function [x,y] = lorentzdata(N, A, w, G, noise)
  x = (rand(1,N) - 0.5) * 8*G + w;
  y = 2*noise * (rand(1,N) - 0.5) + A ./ ((x - w).^2 + G^2);
