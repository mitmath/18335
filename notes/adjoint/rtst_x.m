% test for adjoint gradient of recurrence, in recurrence2.lyx:
% computation of x^N, given p of length N
function x = rtst_x(p)
  x = [1;0];
  t = 0.1;
  A = [cos(t) sin(t); -sin(t) cos(t)];
  for i = 1:length(p)
    x = A*x + [0;p(i)];
  end
