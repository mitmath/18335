function [val, gradient] = lorentzfit(p, x, y)
  A = p(1);
  w = p(2);
  G = p(3);
  val = sum((y - A ./ ((x-w).^2 + G^2)).^2);
  if (nargout > 1)
    gradient(1) = sum(-2 * (y - A ./ ((x-w).^2 + G^2)) ./ ((x-w).^2 + G^2));
    gradient(2) = sum(4 * A * (w-x) .* (y - A ./ ((x-w).^2 + G^2)) ./ (((x-w).^2 + G^2)).^2);
    gradient(3) = sum(4 * A * G * (y - A ./ ((x-w).^2 + G^2)) ./ (((x-w).^2 + G^2)).^2);
  end
