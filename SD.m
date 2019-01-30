% Usage: x = SD(A, b, x, nmax)
%
% Performs nmax steps of steepest descent to solve Ax = b for x,
% given a starting guess x (e.g. a random vector).  A should be
% Hermitian positive-definite.  Returns the improved solution x.
function x = SD(A, b, x, nmax)
  Ad = zeros(size(x));
  r = b - A*x;
  alpha = 0;
  for n = 1:nmax
    r = r - alpha * Ad;
    d = r;
    Ad = A*d;
    alpha = d' * r / (d' * Ad);
    x = x + alpha * d;
  end

    