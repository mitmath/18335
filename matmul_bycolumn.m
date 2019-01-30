% Usage: A = matmul_bycolumn(B, C)
%
% Computes the matrix product A = B * C, but instead of 
% just calling B * C, it multiplies B by each column of
% C in sequence.
function A = matmul_bycolumn(B, C)
  A = zeros(size(B,1), size(C,2));
  for j = 1:size(C,2)
    A(:,j) = B * C(:,j);
  end
