function [val, gradient] = lorentzfit2(p, x, y)
  A1 = p(1);
  w1 = p(2);
  G1 = p(3);
  A2 = p(4);
  w2 = p(5);
  G2 = p(6);
  val = sum((y - A1 ./ ((x-w1).^2 + G1^2) - A2 ./ ((x-w2).^2 + G2^2)).^2);
  if (nargout > 1)
    er = y - A1 ./ ((x-w1).^2 + G1^2) - A2 ./ ((x-w2).^2 + G2^2);
    gradient(1) = sum(-2 * er ./ ((x-w1).^2 + G1^2));
    gradient(2) = sum(4 * A1 * (w1-x) .* er ./ (((x-w1).^2 + G1^2)).^2);
    gradient(3) = sum(4 * A1 * G1 * er ./ (((x-w1).^2 + G1^2)).^2);
    gradient(4) = sum(-2 * er ./ ((x-w2).^2 + G2^2));
    gradient(5) = sum(4 * A2 * (w2-x) .* er ./ (((x-w2).^2 + G2^2)).^2);
    gradient(6) = sum(4 * A2 * G2 * er ./ (((x-w2).^2 + G2^2)).^2);
  end
