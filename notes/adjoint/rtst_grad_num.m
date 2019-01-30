% test for adjoint gradient of recurrence, in recurrence2.lyx:
% numerical computation of gradient vector dg^N/dp, given p of length N
% and step size dp for center-difference approximation.
function dg = rtst_grad_num(p, dp)
  p0 = p;
  dg = zeros(size(p));
  for i = 1:length(p)
    p(i) = p0(i) + dp/2;
    gp = rtst_g(p);
    p(i) = p0(i) - dp/2;
    gm = rtst_g(p);
    p(i) = p0(i);
    dg(i) = (gp - gm) / dp;
  end

