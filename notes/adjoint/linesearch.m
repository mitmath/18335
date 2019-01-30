function  [alpha,fn,gn,neval,perf] = ...
              linesearch(fun,fpar, x,f,g, h, lpar)
%LINESEARCH  Line search:  Find  alpha = argmin_a{f(x+a*h)} , 
%  where  f  and its gradient vector  g  must be given by a 
%  MATLAB function with with declaration
%            function  [f, g] = fun(x, fpar)
%  fpar contains parameters of the function.  It may be dummy.
%  
%  Call
%      [alpha,fn,gn,neval {,perf}] = ...
%                linesearch(fun,fpar, x,f,g, h, lpar)
%
%  Input parameters
%  fun  :  String with the name of the function.
%  fpar :  Parameters of the function.  May be empty.
%  x    :  Starting point for the line search.
%  f, g :  f(x)  and the gradient at  x .
%  h    :  Search direction.
%  lpar :  Vector with at least one element
%          lpar(1)   :  Maximal allowable step,  alpha_max .
%          lpar(2)   :  Choice of method:  
%                       lpar(2) = 1 : exact line search
%                       otherwise   : soft line search 
%          lpar(3:4) :  parameters for the stopping criteria
%                       See Method below.
%          lpar(5)   :  Max. number of iterations (default = 5).
%          lpar(6)   :  If present, then perform a thorough check.
%                       An error found will stop execution with
%                       an error message.                      
%
%  Output parameters
%  alpha :  Computed steplength.  alpha = 0  indicates an error.
%  fn, gn:  f( x + alpha*h )  and the gradient at  x + alpha*h .
%  neval :  Number of function evaluations.
%  {perf}:  {Only returned if linesearch is called with 5 output 
%           parameters}  'Trace': array with alpha-values in the 
%	    first column and corresponding phi(alpha) and
%           phi'(alpha)-values in columns two and three.
%
%  Method
%  Described in Sections 2.5 - 2.6 of  Frandsen, Jonasson, Nielsen
%  & Tingleff: "Unconstrained Optimization".  Let
%         phi(alpha) = f( x + alpha * h ) ,
%         phi'(alpha) = h' * grad( x + alpha * h ).
%  If the number of function evaluations does not exceed 
%  kmax = lpar(5), then the computed steplength satisfies the 
%  following two conditions:
%  if  lpar(2) = 1  (exact line search) : 
%        |phi'(alpha)| <= tau * |phi'(0)|  or  b-a <= epsilon * b 
%    where  [tau, epsilon] = lpar(3:4). 
%    Default:  lpar(3) = lpar(4) = 1e-3
%  Otherwise  (soft line search
%        phi(alpha) <= phi(0) + alpha * rho * phi'(0)
%    and
%        phi'(alpha) >= beta * phi'(0),
%    where  [beta, rho] = lpar(3:4). 
%    Default:  lpar(3) = 0.99,  lpar(4) = 1e-3 

%  Hans Bruun Nielsen,  IMM, DTU.  99.12.07

   % Default return values and simple checks
   alpha = 0;   fn = f;   gn = g; 
   if  length(lpar) > 5
     [n,h, b,fib,g,spar] = check(x,fn,gn,h,lpar,[nargin nargout], fun,fpar);
     neval = 1;
   else
     neval = 0;   n = length(x);   spar = getlpar(lpar);
     if  length(h) ~= n
         error('h  should have the same length as  x'), end
     if  norm(size(x) - size(h)),  h = h'; end
   end 

   % Initial values
   dfi0 = dot(h,gn);      
   Trace = nargout > 4;
   if  Trace,  perf = [0 fn dfi0; zeros(spar(4),3)]; end

   % Check descent condition
   if  dfi0 >= 0
     if  Trace,  perf = perf(1,:); end
     return
   end

   % Finish initialization 
   fi0 = f;    slope0 = spar(3)*dfi0;   slopethr = spar(2)*dfi0;
   if  length(lpar) < 6    % First call
     b = min(1, spar(1));
     [fib g] = feval(fun,x+b*h,fpar);  neval = 1;
   end
   dfib = dot(g,h); 
   if  Trace,  perf(2,:) = [b fib dfib]; end

   switch  spar(5)
   case  1    % Exact line search
     % Expand interval
     more = 1;   dfia = dfi0;
     while  more
       if  fib < fi0    % New lower bound
         fiok = 1;
         alpha = b;   fn = fib;   gn = g;   dfia = dfib; 
         if  (neval < spar(4)) & (b < spar(1))
           % Augment right hand end
           if  2.5*b >= spar(1),  b = spar(1);  else,  b = 2*b;  end
           [fib  g] = feval(fun, x+b*h, fpar);   neval = neval+1;
           dfib = dot(g,h); 
           if  Trace,  perf(neval+1,:) = [b  fib  dfib]; end
           if  dfib >= 0,  more = 0; end
         else,  more = 0; end
       else,  fiok = 0;   more = 0; end
     end
     if  (b < spar(1)) | (dfib > 0)
     % Refine interval
       % Set auxiliary array
       xfd = [alpha fn dfia; b fib dfib; b fib dfib];
       while  (neval < spar(4)) & (abs(xfd(3,3)) > slopethr) ...
              &  (diff(xfd(1:2,1)) > spar(3) )
         c = interpolate(xfd,n);
         [fic g] = feval(fun, x+c*h, fpar);   neval = neval+1;
         xfd(3,:) = [c  fic  dot(g,h)];
         if  Trace,  perf(neval+1,:) = xfd(3,:); end
         if xfd(3,3) < 0 & fic < xfd(1,2)    % New lower bound
           xfd(1,:) = xfd(3,:);
           alpha = c;   fn = fic;   gn = g;
         else,  xfd(2,:) = xfd(3,:); end
       end % while
     end % refine

   otherwise    % Soft line search
     % Expand interval
     more = 1;   dfia = dfi0;
     while  more
       if  fib <= fi0 + slope0*b    % New lower bound
         fiok = 1;
         alpha = b;   fn = fib;   gn = g;   dfia = dfib; 
         if  (neval < spar(4)) & (b < spar(1)) & (dfib < slopethr)
           % Augment right hand end
           if  2.5*b >= spar(1),  b = spar(1);  else,  b = 2*b;  end
           [fib  g] = feval(fun, x+b*h, fpar);   neval = neval+1;
           dfib = dot(g,h);
           if  Trace,  perf(neval+1,:) = [b  fib  dfib]; end
         else,  more = 0; end
       else,  fiok = 0;   more = 0; end
     end   
     if  ~fiok    % Refine interval
       xfd = [alpha fn dfia; b fib dfib; b fib dfib];
       while  (neval < spar(4)) & (diff(xfd(1:2,1)) > 0) & ...
              ((xfd(3,3) < slopethr) |...
               (xfd(3,2) > fi0 + slope0*xfd(3,1)) )
         c = interpolate(xfd,n);
         [fic g] = feval(fun, x+c*h, fpar);   neval = neval+1;
         xfd(3,:) = [c  fic  dot(g,h)];
         if  Trace,  perf(neval+1,:) = xfd(3,:); end
         if fic < fi0 + slope0*c    % New lower bound
           xfd(1,:) = xfd(3,:);
           alpha = c;   fn = fic;   gn = g;
         else,  xfd(2,:) = xfd(3,:); end
       end  % while
     end  % refine

   end % cases

   % Return values
   if  Trace,   perf = perf(1:neval+1,:); end

% ==========  auxiliary functions  =================================

function  [n,h, b, f, g, parms] = check(x,f,g, h, lpar, nargs, fun,fpar)
%  Check function call

   if  nargs(1) ~= 7,  error('Wrong number of input arguments')
   elseif  (nargs(2) < 4) | (nargs(2) > 5)
      error('Wrong number of output arguments'),  end
   sx = size(x);   n = max(sx);
   if  (min(sx) > 1),  error('x  should be a vector'), end
   sf = size(f); 
   if  (any(sf) ~= 1) | ~isreal(f)
      error('f  should be a real scalar'), end
   sg = size(g);
   if  (min(sg) > 1) | (max(sg) ~= n)
      error('g  should be a vector of the same length as  x'), end 
   sh = size(h);
   if  norm(sx - sh)
      if  min(sh) > 1 | max(sh) ~= n
        error('h  should be a vector of the same type as  x')
      else,  h = h';  end
   end

   % Line search parameters
   parms = getlpar(lpar);
   if  parms(1) <= 0
     tx = 'alpha_max = lpar(1)  must be a strictly positive number';
     error(tx), end
   if  (parms(5) ~= 1) & (parms(2) < parms(3) | parms(2) > 1)
     tx = 'The values of [beta, rho] = lpar(3:4)  are not valid';
     error(tx), end
   if  (parms(5) == 1) & (min(parms(2:3)) <= 0)
      tx = 'The values of [tau, epsilon] = lpar(3:4)';
      error([tx ' must be positive']), end

   % Check call of  fun  
   b = min(1, parms(1));
   [f g] = feval(fun,x+b*h,fpar); 
   sf = size(f);   sg = size(g); 
   if  (any(sf) ~= 1) | ~isreal(f)
      error('f  from  fun  is not a real scalar'), end
   if  (min(sg) > 1) | (max(sg) ~= n)
      tx = 'g  from  fun  is not a vector of the same length as  x';
      error(tx), end 

% ------------  end of check

function  p = getlpar(lpar)
%  Get line search parameters,
%  if  soft  then  p = [a_max  beta   rho    kmax  2]
%            else  p = [a_max  tau  epsilon  kmax  1]

   p = [lpar(1)  zeros(1,4)];  llp = length(lpar);
   if  llp < 2,  p(2:5) = [0.99  1e-3  5  2];
   elseif  llp < 4
     p(5) = lpar(2);
     if  p(5) == 1,  p(2:4) = [1e-3  1e-3  20];
     else,           p(2:4) = [0.99  1e-3  5];  end
   elseif  llp < 5
     p(5) = lpar(2);
     if  p(5) == 1,  p(4) = 20;  else, p(4) = 5; end
   else,  p(2:5) = lpar([3:5 2]); end

% ------------  end of  getlpar

function  alpha = interpolate(xfd,n);
%  Minimizer of parabola given by
%  xfd(1:2,1:3) = [a fi(a) fi'(a); b fi(b) dummy]

   a = xfd(1,1);   b = xfd(2,1);   d = b - a;   dfia = xfd(1,3);
   C = diff(xfd(1:2,2)) - d*dfia;
   if C >= 5*n*eps*b    % Minimizer exists
     A = a - .5*dfia*(d^2/C);
     d = 0.1*d;   alpha = min(max(a+d, A), b-d);
   else
     alpha = (a+b)/2;
   end

% ------------  end of  interpolate 
