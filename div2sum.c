#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

#include <gsl/gsl_rng.h>

static gsl_rng *r = 0;

static void div2sum(int n, float *fsum, long double *dsum)
{
     if (n < 200) {
	  int i;
	  *fsum = 0;
	  *dsum = 0;
	  for (i = 0; i < n; ++i) {
	       double x = gsl_rng_uniform(r);
	       *fsum = (float) (*fsum + x);
	       *dsum = *dsum + x;
	  }
     }
     else {
	  float fsum1, fsum2;
	  long double dsum1, dsum2;
	  div2sum(n/2, &fsum1, &dsum1);
	  div2sum(n - n/2, &fsum2, &dsum2);
	  *fsum = fsum1 + fsum2;
	  *dsum = dsum1 + dsum2;
     }
}

int main(int argc, char **argv)
{
     int m, i;
     double nmin, nmax, naverage = 100;
     
     r = gsl_rng_alloc(gsl_rng_mt19937);
     gsl_rng_set(r, time(NULL));

     nmin = argc > 1 ? atof(argv[1]) : 10;
     nmax = argc > 2 ? atof(argv[2]) : 1e9;
#if 0
     for (i = 2; i <= 2*nmax; i *= 2) {
	  int n, nav;
	  float fsum;
	  long double dsum;
	  double err = 0;
	  n = i;
	  for (nav = 0; nav < naverage; ++nav) {
	       div2sum(n, &fsum, &dsum);
	       err += (fabs(fsum - dsum) / dsum);
	  }
	  err /= naverage;
	  printf("%d, %g\n", n, err);
	  fflush(stdout);
     }
#else
     m = argc > 3 ? atoi(argv[3]) : 1000;
     for (i = 0; i < m; ++i) {
	  int n, nav;
	  float fsum;
	  long double dsum;
	  double err = 0;
	  n = pow(10., log10(nmin) + i * (log10(nmax) - log10(nmin)) / (m-1));
	  for (nav = 0; nav < naverage; ++nav) {
	       div2sum(n, &fsum, &dsum);
	       err += (fabs(fsum - dsum) / dsum);
	  }
	  err /= naverage;
	  printf("%d, %g\n", n, err);
	  fflush(stdout);
     }
#endif

     gsl_rng_free(r);
     return 0;
}
