blas_set_num_threads(1) # turn off multi-threaded BLAS for benchmarking
ms = int(logspace(1, 3, 50)) # 50 integers from 10^1 to 10^3
gflops = zeros(length(ms))
function doit(A,B, N) # function to benchmark for N iterations
    for i = 1:N
        C = A * B
    end
end
for i = 1:length(ms) # benchmark different matrix sizes
  m = ms[i]
  A = rand(m,m)
  B = rand(m,m)
  iters = 0
  t = 0.0
  while t < 0.1 # run for at least 0.1 seconds
      iters = iters*2 + 1
      t = @elapsed doit(A,B, iters) # elapsed time in seconds
  end
  gflops[i] = 2m^3 * 1e-9 / (t/iters)
  println("gflops for m=$m = ",gflops[i])
end
using PyPlot
semilogx(ms, gflops)
xlabel("matrix size m")
ylabel("GFLOPS")
