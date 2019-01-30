function lam = newtpoly(H, lamguess)
  lam = lamguess;
  for i = 1:1000
    [p,pderiv] = evalpoly(H, lam);
    disp(lamnew = lam - p / pderiv);
    if (abs(lamnew - lam) < 10*eps*abs(lamnew))
      break;
    end
    lam = lamnew;
  end
