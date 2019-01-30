ns = round(logspace(2,6,100));
navg = 100;
errs = zeros(size(ns));
for i = 1:length(ns)
  for j = 1:navg
    x = rand(1,ns(i));
    errs(i) = errs(i) + abs(loopsum(x)-sum(x))/sum(abs(x));
  end
  errs(i) = errs(i) / navg;
  disp(sprintf('finished n=%d, got err = %g', ns(i), errs(i)));
  drawnow;
end
