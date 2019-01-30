[x,y] = lorentzdata(200, 1, 0, 1, 0.1);
stop.xtol_rel = 1e-8; stop.verbose = 1;
[p, errmin] = nlopt_minimize(NLOPT_LN_NEWUOA_BOUND, @lorentzfit, {x,y}, [-inf,-inf,0], [inf,inf,inf], [0,1,2], stop);
