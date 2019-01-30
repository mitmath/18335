% Usage: A = A363(1000,100)
%
% Returns the matrix A defined by Trefethen problem 36.3.
function A = A363(m,d2)
  if (nargin < 2)
    d2 = 0;
  end
  A = diag(sqrt([1:m])) + diag(ones(1,m-1),1) + diag(ones(1,m-1),-1);
  if (d2 > 0)
    A = A + diag(ones(1,m-d2),d2) + diag(ones(1,m-d2),-d2);
  end
