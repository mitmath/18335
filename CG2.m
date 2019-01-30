% Usage: [x, residnorm, residnorm2] = CG2(A, b, x, nmax, tol)
%
% Performs nmax steps of conjugate gradient to solve Ax = b for x,
% given a starting guess x (e.g. a random vector).  A should be
% Hermitian positive-definite.  Returns the improved solution x.
%
% Stops whenever nmax steps are performed, or when the estimated residual
% is reduced by a factor tol, whichever occurs first.
%
% residnorm is an array of length nmax of the residuals |r| as
% computed during the SD iterations.  residnorm2 is the same thing,
% but using |b - A*x| instead of via the updated r vector.
function [x, residnorm, residnorm2] = CG2(A, b, x, nmax, tol)
  d = zeros(size(x));
  Ad = d;
  r = b - A*x;
  rr = r' * r;
  alpha = 0;
  initresid = norm(r);
  for n = 1:nmax
    r = r - alpha * Ad;
    residnorm(n) = norm(r);
    residnorm2(n) = norm(b - A*x);
    if (residnorm(n) < initresid * tol)
      break
    end
    rrnew = r' * r;
    d = r + d * (rrnew / rr);
    rr = rrnew;
    Ad = A*d;
    alpha = rr / (d' * Ad);
    x = x + alpha * d;
  end
