#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#include <gsl/gsl_rng.h>

static gsl_rng *r = 0;

typedef float R;

static R spairwise(const long double *x, int n, int N)
{
     if (n <= N) {
	  int i;
	  R fsum = 0;
	  for (i = 0; i < n; ++i)
	       fsum = (R) (fsum + x[i]);
	  return fsum;
     }
     else
	  return spairwise(x, n/2, N) + spairwise(x+n/2, n-n/2, N);
}

static R ssuperblock(const long double *x, int n, int b)
{
     if (n <= b) {
	  int i;
	  R fsum = 0;
	  for (i = 0; i < n; ++i)
	       fsum = (R) (fsum + x[i]);
	  return fsum;
     }
     else {
	  int i, m = n / b;
	  R fsum = 0;
	  for (i = 0; i < b-1; ++i)
	       fsum = (R) (fsum + ssuperblock(x+i*m, m, b));
	  return fsum + ssuperblock(x+i*m, n-i*m, b);
     }
}

static long double lpairwise(const long double *x, int n, int N)
{
     if (n <= N) {
	  int i;
	  long double fsum = 0;
	  for (i = 0; i < n; ++i)
	       fsum = fsum + x[i];
	  return fsum;
     }
     else
	  return lpairwise(x, n/2, N) + lpairwise(x+n/2, n-n/2, N);
}

static R skahan(const long double *x, int n)
{
     R sum = x[0], c = 0;
     int i;
     for (i = 1; i < n; ++i) {
	  R y = (R) (x[i] - c), t = (R) (sum + y);
	  c = (R) (((R) (t - sum)) - y);
	  sum = t;
     }
     return sum;
}

static double rerr(R x, double exact) {
     return fabs(x - exact) / fabs(exact);
}

int main(int argc, char **argv)
{
     int m, i;
     double nmin, nmax;
     long double *x;
     
     r = gsl_rng_alloc(gsl_rng_mt19937);
     gsl_rng_set(r, time(NULL));

     nmin = argc > 1 ? atof(argv[1]) : 10;
     nmax = argc > 2 ? atof(argv[2]) : 1e9;
     m = argc > 3 ? atoi(argv[3]) : 1000;

     x = (long double *) malloc(nmax * sizeof(long double));
     for (i = 0; i < nmax; ++i)
	  x[i] = gsl_rng_uniform(r) + gsl_rng_uniform(r) * 1e-8;

     printf("n, naive, pairwise1, pairwise100, superblock100, kahan\n");
     for (i = 0; i < m; ++i) {
	  int n;
	  long double exact;

	  n = pow(10., log10(nmin) + i * (log10(nmax) - log10(nmin)) / (m-1));

	  exact = lpairwise(x, n, 100);
	  printf("%d, %g, %g, %g, %g, %g\n",
		 n,
		 rerr(spairwise(x, n, n), exact),
		 rerr(spairwise(x, n, 1), exact),
		 rerr(spairwise(x, n, 100), exact),
		 rerr(ssuperblock(x, n, 100), exact),
		 rerr(skahan(x, n), exact));
	  fflush(stdout);
     }

     free(x);
     gsl_rng_free(r);
     return 0;
}
