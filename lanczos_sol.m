% Usage: [T, lamsmallest] = lanczos(A, b, nmax)
%
% Returns nmax-by-nmax tridiagonal matrix T after nmax steps of Lanczos,
% starting with a vector b (e.g. a random vector).  T is
% unitarily similar to A (in theory).
%
% If nrestart is passed, repeat the process nrestart times, each time
% starting over with the Ritz vector for the minimim eigenvalue.
%
% Also returns an array lamsmallest of the smallest Ritz values
% for each iteration.
%
% (This routine is not for serious use!  Very inefficient, simplistic
% restarting, no re-orthogonalization, etc.)
function [T,lamsmallest,lam2nd,lam3rd] = lanczos(A, b, nmax, nrestart)
  if (nargin < 4)
    nrestart = 1;
  end
  lamsmallest = [];
  lam2nd = [];
  lam3rd = [];
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
      lam = [eig(T); 0; 0];
      lamsmallest = [lamsmallest, lam(1)];
      lam2nd = [lam2nd, lam(2)];
      lam3rd = [lam3rd, lam(3)];
    end
    [V,D] = eig(T);
    lams = diag(D);
    ilam = min(find(lams == min(lams)));
    b = Q(:,1:nmax) * V(:,ilam);
  end
  