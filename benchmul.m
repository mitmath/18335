gflops = zeros(1,1000);
for m = 1:1000
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
  gflops(m) = 2*m^3 * 1e-9 / (t * 2/iters);
end
