% Usage: [g,gp,E,psi] = schrodinger_fd_adj(x, V, psi0)
%
% Given a column-vector x(:) of N equally spaced x points and a column-vector
% V of the potential V(x) at those points, solves Schrodinger's eigen-equation
%               [ -d^2/dx^2 + V(x) ] psi(x) = E psi(x)
% with periodic boundaries for the lowest "ground state" eigenvalue E and
% wavefunction psi.
%
% Furthermore, it computes the function g = integral |psi - psi0|^2 and
% the gradient gp = dg/dV (at each point x).

function [g,gp,E,psi] = schrodinger_fd_adj(x, V, psi0)
  dx = x(2) - x(1);
  N = length(x);
  A = spdiags([ones(N,1), -2 * ones(N,1), ones(N,1)], -1:1, N,N);
  A(1,N) = 1;
  A(N,1) = 1;
  A = - A / dx^2 + spdiags(V, 0, N,N);

  opts.disp = 0;
  [psi,E] = eigs(A, 1, 'sa', opts);
  E = E(1,1);
  if sum(psi) < 0
    psi = -psi; % pick sign; note that psi' * psi = 1 from eigs already
  end

  gpsi = psi - psi0;
  g = gpsi' * gpsi * dx;
  gpsi = gpsi * 2*dx;
  
  P = @(x) x - psi * (psi' * x); % projection onto direction normal to psi

  [lambda,flag] = pcg(A - spdiags(E*ones(N,1), 0, N,N), P(gpsi), 1e-6, N);
  lambda = P(lambda);
  gp = -real(conj(lambda) .* psi);

  disp(g);