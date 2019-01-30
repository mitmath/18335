% test for adjoint gradient of recurrence, in recurrence2.lyx:
% computation of g^N, given p of length N
function g = rtst_g(p)
  x = rtst_x(p);
  g = x(2)^2;
