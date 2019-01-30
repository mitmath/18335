% Usage: [x, residnorm, residnorm2] = PCG(A, Ainv, b, x, nmax)
%
% Performs nmax steps of conjugate gradient to solve Ax = b for x,
% given a starting guess x (e.g. a random vector).  A should be
% Hermitian positive-definite.  Returns the improved solution x.
%
% Preconditioned by Ainv, an approximate inverse for A.
%
% residnorm is an array of length nmax of the residuals |r| as
% computed during the SD iterations.  residnorm2 is the same thing,
% but using |b - A*x| instead of via the updated r vector.
function [x, residnorm, residnorm2] = PCG(A, Ainv, b, x, nmax)
  d = zeros(size(x));
  Ad = d;
  r = b - A*x;
  Ainvr = Ainv * r;
  rr = r' * Ainvr;
  alpha = 0;
  for n = 1:nmax
    r = r - alpha * Ad;
    residnorm(n) = norm(r);
    residnorm2(n) = norm(b - A*x);
    Ainvr = Ainv * r;
    rrnew = r' * Ainvr;
    d = Ainvr + d * (rrnew / rr);
    rr = rrnew;
    Ad = A*d;
    alpha = rr / (d' * Ad);
    x = x + alpha * d;
  end
