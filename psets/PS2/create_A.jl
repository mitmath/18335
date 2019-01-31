using JLD

m = 2000
ν = 5

s = [100rand(ν) + 1; 0.01rand(m-ν)]

# U, ~ = qr(rand(m,m))
# V, ~ = qr(rand(m,m))
U, ~ = qr(rand(Complex128,m,m))
V, ~ = qr(rand(Complex128,m,m))

A = U*diagm(s)*V'

@save "A.jld" A
