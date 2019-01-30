% Usage: [V,psi,psi0,E,g,gp] = schrodinger_fd_opt(x, V0, psi0, maxit, tol)
%
% Solve the Schrodinger inverse problem: given a desired ground-state wavefunction
% psi0 (column vector) at equally spaced points x (column vector), compute the
% potential V (column vector) at the x points that yields this wavefunction
% as closely as possible.  Minimizes g = integral |psi - psi0|^2, where
% psi is the actual ground-state wavefunction.
%
% Returns the potential V found, the corresponding wavefunction psi and energy E,
% the objective function g, and its gradient gp = dg/dV.  Also returns psi0
% renormalized to |psi0|^2 = 1 with a canonical sign, to match psi.
%
% Argument V0 is an initial guess for V (V0 = 0*x is usually fine).  maxit and tol
% are the maximum number of iterations and the relative tolerance, respectively,
% for the optimization.
%
% Requires schrodinger_fd_adj.m (solves the eigenproblem and the gradient dg/dV).a
% Also needs conj_grad.m and linesearch.m from http://www2.imm.dtu.dk/~hbn/Software/

function [V,psi,psi0,E,g,gp] = schrodinger_fd_opt(x, V0, psi0, maxit, tol)
  if nargin < 4
    maxit = 300;
  end
  if nargin < 5
    tol = 1e-8;
  end

  psi0 = psi0 / sqrt(psi0' * psi0);
  if sum(psi0) < 0
    psi0 = -psi0; % pick canonical sign
  end

  V = conj_grad(@(v,p) schrodinger_fd_adj(x,v,psi0), [], V0, [2,2,1,0,tol,maxit,0,0,0]);

  [g,gp,E,psi] = schrodinger_fd_adj(x,V,psi0);
