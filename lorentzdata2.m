function [x,y] = lorentzdata2(N, A1, w1, G1, A2, w2, G2, noise)
  G = max([G1, G2]);
  w = mean([w1, w2]);
  x = (rand(1,N) - 0.5) * 8*G + w;
  y = 2*noise * (rand(1,N) - 0.5) + A1 ./ ((x - w1).^2 + G1^2) + A2 ./ ((x - w2).^2 + G2^2);
