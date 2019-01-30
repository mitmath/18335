ms = round(logspace(1, 3, 50));
gflops = zeros(1,length(ms));
for i = 1:length(ms)
  m = ms(i);
  A = rand(m,m);
  B = rand(m,m);
  t = 0;
  iters = 1;
  % run benchmark for at least 0.1 seconds
  while (t < 0.1)
    tic
    for iter = 1:iters
      C = A * B;
    end
    t = toc; % elapsed time in seconds
    iters = iters * 2;
  end
  gflops(i) = 2*m^3 * 1e-9 / (t * 2/iters);
  disp(sprintf('gflops for m=%d = %g after %d iters',m,gflops(i),iters/2));
  drawnow update;
end
plot(ms, gflops, 'r-')
