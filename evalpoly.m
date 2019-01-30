function [p,pderiv] = evalpoly(H,z)
  m = size(H,1);
  d1 = (H(1,1) - z);
  d2 = 1;
  d1deriv = -1;
  d2deriv = 0;
  for i = 2:m
    d = (H(i,i) - z) * d1 - H(i-1,i)*H(i,i-1) * d2;
    dderiv = -d1 + (H(i,i) - z) * d1deriv - H(i-1,i)*H(i,i-1)* d2deriv;
    d2 = d1;
    d1 = d;
    d2deriv = d1deriv;
    d1deriv = dderiv;
  end
  p = d1;
  pderiv = d1deriv;