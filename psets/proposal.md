See the [web page](../README.md) for more information about final projects and what is expected; the proposal is just so that I can give you early feedback on your plans.  Note in particular that I do NOT expect "research" projects; your project should mostly consist of known results that you review, re-implement, validate, compare, and otherwise synthesize.

As described on the web page, you have broad flexibility in choosing a project.  Some key constraints are:

* Must be "numerical" in the sense of taking real (or complex) numbers in and real numbers out; no integer-only algorithms.

* Must not be covered in class.  (This includes topics that *will* be covered; you can look ahead in the [web page from previous years](https://github.com/mitmath/18335/tree/spring15) to get a sense of what will be covered, and I will also give you feedback if you propose a topic that I plan to cover in class.)

* Must not be about how to discretize a PDE or integral equation. (You can, however, take a discretized PDE as an *input* and talk about techniques to solve it.)

* Must involve nontrivial numerics; a rule of thumb is that it should take at least 100-200 lines of code to implement.  (As opposed to algorithms where the analysis is very complicated but the resulting algorithm is trivial to implement.)  (You can implement in any language you want, though I would tend to recommend a high-level language like Julia, Python, or Matlab, rather than a low-level language like C or C++.)

A few examples of project topics from past terms are:

* Nonlinear eigenproblems
* Multidimensional cubature with sparse grids (e.g. Smolyak algorithms)
* Monte-Carlo integration with adaptive importance sampling
* Iterative linear-algebra algorithms not covered in class, e.g. BiCGSTAB(ℓ), DQGMRES, or the Jacobi-Davidson eigenproblem algorithm.
* Discrete cosine transform algorithms (e.g. for audio compression)
* Nonlinear optimization algorithsms, e.g. ORBIT, VNS, multistart algorithms, globally convergent Nelder-Mead, …
* Linear Programming (LP) algorithms (e.g. interior-point or simplex)
* Quasi-Newton methods for nonlinear systems of equations (e.g. Broyden updates)
* Rational approximation (e.g. the Remez algorithm)
* The Fast Multipole Method for the n-body problem

(Try leafing through a book on numerical algorithms, e.g. Numerical Recipes, for ideas.)

Your proposal should include:

* A *brief* (1–2 paragraph) description of the algorithm and the problem it solves.
* How you intend to *validate* your implementation (e.g. test problems).
* Information on your planned implementation — language, useful libraries you will exploit?
* What algorithm(s) you intend to compare your implementation to.
* How will you compare algorithms?  (As noted in the course README, I would recommend against measures like execution time that depend strongly on how well-optimized your implementation is.)
* A few references that you will use as starting points.
