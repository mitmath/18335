% Usage: [T, lammu] = lanczos2(A, b, nmax, nrestart, mu)
%
% Returns nmax-by-nmax tridiagonal matrix T after nmax steps of Lanczos,
% starting with a vector b (e.g. a random vector).  T is
% unitarily similar to A (in theory).
%
% If nrestart is passed, repeat the process nrestart times, each time
% starting over with the Ritz vector for the minimim eigenvalue.
%
% Also returns an array lammu of the Ritz values closest to mu
% for each iteration (defaults to mu = 0).
%
% (This routine is not for serious use!  Very inefficient, simplistic
% restarting, no re-orthogonalization, etc.)
function [T,lammu] = lanczos2(A, b, nmax, nrestart, mu)
  if (nargin < 4)
    nrestart = 1;
  end
  if (nargin < 5)
    mu = 0;
  end
  lammu = [];
  m = size(A,1);
  for irestart = 1:nrestart
    beta(1) = 0;
    qprev = zeros(m, 1);
    q = b / norm(b);
    Q = q;
    for n = 1:nmax
      v = A*q;
      alpha(n) = q' * v;
      v = v - beta(n) * qprev - alpha(n) * q;
      beta(n+1) = norm(v);
      qprev = q;
      q = v / beta(n+1);
      Q = [Q,q];
      
      beta1 = beta(2:end-1);
      T = diag(alpha) + diag(beta1,1) + diag(beta1,-1);
      lams = eig(T);
      ilam = find(abs(lams - mu) == min(abs(lams - mu))); ilam = ilam(1);
      lammu = [lammu, lams(ilam)];
    end
    [V,D] = eig(T);
    lams = diag(D);
    ilam = find(abs(lams - mu) == min(abs(lams - mu))); ilam = ilam(1);
    b = Q(:,1:nmax) * V(:,ilam);
  end
  