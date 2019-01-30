[x,y] = lorentzdata2(200, 1,0,1, 2,1,1.5, 0.01);
stop.xtol_rel = 1e-4; stop.verbose = 1;
[p, errmin] = nlopt_minimize(NLOPT_LD_LBFGS, @lorentzfit2, {x,y}, [0,0,0,0,0,0], [5,5,5,5,5,5], rand(1,6), stop);
