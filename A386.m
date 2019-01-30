% Usage: A = A386(100)
%
% Returns the matrix A defined by Trefethen problem 38.6.
function A = A386(m)
  A = diag([1:m]) + diag(ones(1,m-1),1) + diag(ones(1,m-1),-1);
