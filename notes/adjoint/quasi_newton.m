function  [X, info, perf, D] = quasi_newton(fun,par, x0, opts, D0)
%QUASI_NEWTON  Quasi-Newton method for nonlinear optimization:
%  Find  xm = argmin{f(x)} , where  x  is an n-vector and the scalar
%  function  f  with gradient  g  (with elements  g(i) = Df/Dx_i )
%  must be given by a MATLAB function with with declaration
%            function  [f, g] = fun(x, par)
%  par  holds parameters of the function.  It may be dummy.  
%  
%  Call
%    [X, info {, perf {, D}}] = quasiNewton(fun,par, x0, opts {, D0})
%
%  Input parameters
%  fun  :  String with the name of the function.
%  par  :  Parameters of the function.  May be empty.
%  x0   :  Starting guess for  x .
%  opts :  Vector with 9 elements:
%          opts(1) :  Choice of updating formula:
%              opts(1) = 1 :  DFP,  otherwise : BFGS 
%          opts(2) :  Choice of line search method:
%              opts(2) = 1 :  Exact l. s., otherwise : Soft l.s.
%          opts(3) :  Upper bound on initial step
%          opts(4:6)  used in stopping criteria:
%              ||g||_inf <= opts(4)                     or 
%              ||dx||_2 <= opts(5)*(opts(5) + ||x||_2)  or
%              no. of function evaluations exceeds  opts(6) . 
%          opts(7:9)  used as linesearch parameters lpar(3:5) .
%              See LINESEARCH .
%          Any illegal element in  opts  is replaced by its
%          default value :
%              opts(1:6) = [2  2  1  1e-4*||g(x0)||_inf  1e-6  100]
%          and
%              opts(2)=1:  opts(7:9) = [1e-4  1e-6  10]
%              opts(2)=2:  opts(7:9) = [1e-1  1e-2  10]
%  D0   :  (optional)  If present, then approximate inverse Hessian
%          at  x0 .  Otherwise, D0 := I .
%
%  Output parameters
%  X    :  If  perf  is present, then array, holding the iterates
%          columnwise.  Otherwise, computed solution vector.
%  info :  Performance information, vector with 6 elements:
%          info(1:3) = final values of 
%              [f(x)  ||g||_inf  ||dx||_2] 
%          info(4:5) = no. of iteration steps and evaluations of (f,g)
%          info(6) = 1 :  Stopped by small gradient
%                    2 :  Stopped by small x-step
%                    3 :  Stopped by  opts(6) .
%                    4 :  Stopped by zero step.
%  perf :  (optional). If present, then array, holding 
%            perf(1:2,:) = values of  f(x) and ||g||_inf
%            perf(3:5,:) = Line search info:  values of  
%                          alpha, phi'(alpha), no. fct. evals. 
%  D    :  (optional). If present, then array holding the 
%          approximate inverse Hessian at  X(:,end) .
%
%  Use of other MATLAB functions :  LINESEARCH .
%
%  Method
%  See Chapter 5 in  P.E. Frandsen, K. Jonasson, H.B. Nielsen, 
%  O. Tingleff: "Unconstrained Optimization", IMM, DTU.  1999.

%  Hans Bruun Nielsen,  IMM, DTU.  99.08.13 / 08.23 / 12.07

   %  Check call 
   [x  trpx  n  f  g  opts] = check(fun,par,x0,opts);
   if  nargin > 4,  D = checkD(n,D0),  fsc = 0;  
   else,            D = eye(n);   fsc = 1; end
   %  Finish initialization
   k = 1;   kmax = opts(6);   neval = 1;   ng = norm(g,inf);
   Trace = nargout > 2;
   if  Trace
         X = x(:)*ones(1,kmax+1);
         perf = [f; ng; zeros(3,1)]*ones(1,kmax+1);
       end
   found = ng <= opts(4);
   malfa = 32;   sc0 = 1;

   while  ~found
     %  Previous values
     xp = x;   gp = g;   fp = f;
     %  New direction
     k = k+1;   h = D*(-g(:));   nh = norm(h);
     if  trpx,  h = h'; end
     if  nh == 0
       found = 4;
     else
       if  fsc,  sc = opts(3)/malfa/nh; fsc = 0; % Bound initial step
       else,     sc = sc0; end
       %  Line search
       lspar = [malfa  opts([2 7:8])  min(kmax-neval, opts(9))];
       [al  f  g  dval] = linesearch(fun,par,x,f,g, sc*h, lspar);
       if  al == malfa,  sc0 = 2*sc0;
       elseif  al < 1,  sc0 = max(1, sc0/4); end
       %  Update  x, neval and ||g||
       alpha = sc * al;
       x = x + alpha*h;   neval = neval + dval;  ng = norm(g,inf);
       if  Trace
             X(:,k) = x(:);   perf(1:2,k) = [f; ng];
             perf(3:5,k-1) = [alpha; dot(h,g); dval]; end
       h = x - xp;   nh = norm(h);
       if  nh == 0,
         found = 4;
       else
         y = g - gp;   yh = dot(y,h);
         if  yh > sqrt(eps) * nh * norm(y)
           %  Update  D
           v = D*y(:);   yv = dot(y,v);
           if  opts(1) == 1  % DFP
             D = D + (h(:)/yh)*h(:)' - (v/yv)*v';
           else    % BFGS
             a = (1 + yv/yh)/yh;   v = v/yh;
             D = D + (a*h(:) - v)*h(:)' - h(:)*v';
           end
         end  % update D
         %  Check stopping criteria
         if      ng <= opts(4),                            found = 1;
         elseif  alpha*nh <= opts(5)*(opts(5) + norm(x)),  found = 2;
         elseif  neval >= kmax,                            found = 3; end
       end  
     end  % Nonzero h
   end  % iteration

   %  Set return values
   if  Trace
     X = X(:,1:k);   perf = perf(:,1:k);
   else,  X = x;  end
   info = [f  ng  alpha*nh  k-1  neval  found];

% ==========  auxiliary functions  =================================

function  [x,trpx,n, f,g, opts] = check(fun,par,x0,opts0)
%  Check function call
   x = x0;   sx = size(x);   n = max(sx);   trpx = sx(2) > sx(1);
   if  (min(sx) > 1)
       error('x0  should be a vector'), end
   [f g] = feval(fun,x,par);
   sf = size(f);   sg = size(g);
   if  any(sf-1) | ~isreal(f)
       error('f  should be a real valued scalar'), end
   if  any(sg - sx)
       error('g  should be a vector of the same type as  x'), end

   so = size(opts0);
   if  (min(so) ~= 1) | (max(so) < 9) | any(~isreal(opts0(1:9)))
       error('opts  should be a real valued vector of length 9'), end
   opts = opts0(1:9);   opts = opts(:).';
   i = find(opts(1:2) > 2);
   if  length(i)    % Set default values
     d = [2  2];   opts(i) = d(i);
   end
   i = find(opts(1:6) <= 0);
   if  length(i)    % Set default values
     d = [2  2  1  1e-4*norm(g, inf)  1e-6  100];
     opts(i) = d(i);
   end
   i = find(opts(7:9) <= 0);
   if  length(i)    % Set default values
     d = [1e-6  1e-6  10; 1e-1  1e-2  10];
     opts(6+i) = d(opts(2),i);
   end

% ----------  end of  check  ---------------------------------------

function  D = checkD(n,D0)
%  Check given inverse Hessian
   D = D0;   sD = size(D)
   if  any(sD - n)
       error(sprintf('D  should be a square matrix of size %g',n)), end
   if  norm(D - D')
       error('The given D0 is not symmetric'), end
   [R p] = chol(D);
   if  p
       error('The given D0 is not positive definite'), end
