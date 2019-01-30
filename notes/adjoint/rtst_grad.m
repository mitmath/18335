% test for adjoint gradient of recurrence, in recurrence2.lyx:
% computation of gradient vector dg^N/dp, given p of length N
function dg = rtst_grad(p)
  x = rtst_x(p);
  l = [0;2*x(2)];
  t = 0.1;
  A = [cos(t) sin(t); -sin(t) cos(t)]';
  dg = zeros(size(p));
  for i = 0:length(p)-1
    dg(length(p)-i) = l(2);
    l = A * l;
  end

