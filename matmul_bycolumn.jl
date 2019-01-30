# Usage: C = matmul_bycolumn(A, B)
#
# Computes the matrix product C = A * B, but instead of 
# just calling A * B, it multiplies A by each column of
# B in sequence.
function matmul_bycolumn{T}(A::Matrix{T}, B::Matrix{T})
    C = Array(T, size(A,1), size(B,2));
    for j = 1:size(C,2)
        C[:,j] = A * B[:,j];
    end
    return C
end