% Usage: T = lanczos(A, b, nmax)
%
% Returns nmax-by-nmax tridiagonal matrix T after nmax steps of Lanczos,
% starting with a vector b (e.g. a random vector).  T is
% unitarily similar to A (in theory).
%
% (No restarting or re-orthogonalization.  You have been warned.)
function T = lanczos(A, b, nmax)
  m = size(A,1);
  beta(1) = 0;
  qprev = zeros(m, 1);
  q = b / norm(b);
  for n = 1:nmax
    v = A*q;
    alpha(n) = q' * v;
    v = v - beta(n) * qprev - alpha(n) * q;
    beta(n+1) = norm(v);
    qprev = q;
    q = v / beta(n+1);
  end
  beta = beta(2:end-1);
  T = diag(alpha) + diag(beta,1) + diag(beta,-1);
  