function  [X, info, perf] = damp_newton(fun,par, x0, opts)
%DAMP_NEWTON  Levenberg-Marquardt type damped Newton method for
%  nonlinear optimization:
%  Find  xm = argmin{f(x)} , where  x  is an n-vector and the scalar
%  function  f  with gradient  g  (with elements  g(i) = Df/Dx_i )
%  and Hessian  H  (with elements  H(i,j) = D2f/Dx_iDx_j )
%  must be given by a MATLAB function with with declaration
%            function  [f, g, H] = fun(x, par)
%  par  holds parameters of the function.  It may be dummy.  
%  
%  Call
%      [X, info {, perf}] = damp_newton(fun,par, x0, opts)
%
%  Input parameters
%  fun  :  String with the name of the function.
%  par  :  Parameters of the function.  May be empty.
%  x0   :  Starting guess for  x .
%  opts :  Vector with 4 elements:
%          opts(1)  starting value for Marquardt parameter.
%          opts(2:4)  used in stopping criteria:
%              ||g||_inf <= opts(2)                     or 
%              ||dx||2 <= opts(3)*(opts(3) + ||x||2)    or
%              no. of iteration steps exceeds  opts(4) .
%          A nonpositive element in  opts  is replaced by its
%          default value :
%            opts = [1e-3*||H0||_inf  1e-4*||g(x0)||_inf  1e-6  100] 
%
%  Output parameters
%  X    :  If  perf  is present, then array, holding the iterates
%          columnwise.  Otherwise, computed solution vector.
%  info :  Performance information, vector with 6 elements:
%          info(1:4) = final values of 
%              [f(x)  ||g||_inf  ||dx||_2  mu_final] 
%          info(5) = no. of iteration steps 
%          info(6) = 1 :  Stopped by small gradient
%                    2 :  Stopped by small x-step
%                    3 :  Stopped by  opts(4) . 
%  perf :  (optional). If present, then array, holding 
%            perf(1:2,:) = values of  f(x) and ||g||_inf
%            perf(3:4,:) = values of gain ratio  r  and
%                          damping parameter  mu .
%
%  Method
%  See Section 5.2 in  P.E. Frandsen, K. Jonasson, H.B. Nielsen, 
%  O. Tingleff:  "Unconstrained Optimization", IMM, DTU.  1999.

%  Hans Bruun Nielsen,  IMM, DTU.  99.08.10 / 08.12

   %  Check call 
   [x  trpx  n  f  g  H  opts] = check(fun,par,x0,opts);
   %  Finish initialization
   k = 1;   kmax = opts(4);   nu = 2;
   ng = norm(g, inf);   mu = opts(1);
   Trace = nargout > 2;
   if  Trace
         X = x(:)*ones(1,kmax+1);
         perf = [f; ng; zeros(2,1)]*ones(1,kmax+1);
       end
   found = ng <= opts(2);

   while  ~found
     %  Cholesky factorization
     posdef = 0;
     while  ~posdef
       [R  p] = chol(H + mu*eye(n));
       if  p,  mu = 2 * mu;
       else,   posdef = 1; end
     end
     if  Trace, perf(4,k) = mu; end
     %  Get step and check stopping criterion
     h = R \ (R' \ (-g(:)));     nh = norm(h);
     if  nh <= opts(3)*(opts(3) + norm(x)),  found = 2;
     else    %  Try the step
       if  trpx,  h = h'; end
       xnew = x + h;   h = xnew - x;   dL = dot(h, mu*h - g)/2;
       [fn gn Hn] = feval(fun, xnew,par);   df = f - fn; 
       if  (dL > 0) & (df > 0)
         x = xnew;   f = fn;  g = gn;  H = Hn; 
         ng = norm(g,inf);
         mu = mu * max(1/3, 1 - (2*df/dL - 1)^3);   nu = 2;
       else,   mu = mu*nu;  nu = 2*nu;  end
       k = k + 1;
       if  Trace
             X(:,k) = x(:);   perf(3,k-1) = df/dL;
             perf(1:2,k) = [f; ng]; end
       if      ng <= opts(2),  found = 1;
       elseif  k > kmax,       found = 3; end       
     end
   end  % Iteration 

   %  Set return values
   if  Trace
     X = X(:,1:k);   perf = perf(:,1:k);
   else,  X = x;  end
   info = [f  ng  nh  mu  k-1  found];

% ==========  auxiliary function  =================================

function  [x,trpx, n, f,g,H, opts] = check(fun,par,x0,opts0)
%  Check function call
   x = x0;   sx = size(x);   n = max(sx);   trpx = sx(2) > sx(1);
   if  (min(sx) > 1)
       error('x0  should be a vector'), end
   [f g H] = feval(fun,x,par);   
   sf = size(f);   sg = size(g);
   if  any(sf-1) | ~isreal(f)
       error('f  should be a real valued scalar'), end
   if  any(sg - sx)
       error('g  should be a vector of the same type as  x'), end
   if  any(size(H) - n)
       error('H  should be a matrix of order length(x)'), end 

   so = size(opts0);
   if  (min(so) ~= 1) | (max(so) < 4) | any(~isreal(opts0(1:4)))
       error('opts  should be a real valued vector of length 4'), end
   opts = opts0(1:4);   opts = opts(:).';
   i = find(opts <= 0);
   if  length(i)    % Set default values
     d = [1e-3*norm(H,inf)  1e-4*norm(g,inf)  1e-6  100];
     opts(i) = d(i);
   end

     