#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Fall 2012.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm (56-114). **Office Hours:** Thursday 4–5pm (2-388).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of Matlab (little or no prior experience required; you will learn as you go).

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). Ordinary differential equations ([18.03](http://math.mit.edu/18.03/) or 18.034) is another listed prerequisite (not so much as specific material, but more as experience with post-freshman calculus).

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu:8888/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: The [course notes from 18.335 in previous terms](http://persson.berkeley.edu/18.335/), by Per-Olaf Persson, are available online. Although these provide a useful reference, we _will not cover the material in the same sequence_, nor (despite a large overlap) will the material covered be exactly the same. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 33% problem sets (about six). 33% **mid-term exam** (Fri., **Nov. 2 from 2-4pm or from 3-5pm in 4-149**), 34% **final project** (one-page proposal due Friday, October 26, project due Wed., **Dec. 12**).

**TA:** TBA.

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

**Final Projects**: The final project will be a 5–15 page paper (single-column, single-spaced, ideally using the style template from the [_SIAM Journal on Numerical Analysis_](http://www.siam.org/journals/auth-info.php)), reviewing some interesting numerical algorithm not covered in the course. \[Since this is not a numerical PDE course, the algorithm should _not_ be an algorithm for turning PDEs into finite/discretized systems; however, your project _may_ take a PDE discretization as a given "black box" and look at some other aspect of the problem, e.g. iterative solvers.\] Your paper should be written for an audience of your peers in the class, and should include example numerical results (by you) from application to a realistic problem (small-scale is fine), discussion of accuracy and performance characteristics (both theoretical and experimental), and a fair comparison to at least one competing algorithm for the same problem. Like any review paper, you should _thoroughly reference_ the published literature (citing both original articles and authoritative reviews/books where appropriate \[rarely web pages\]), tracing the historical development of the ideas and giving the reader pointers on where to go for more information and related work and later refinements, with references cited throughout the text (enough to make it clear what references go with what results). (**Note:** you may re-use diagrams from other sources, but all such usage must be _explicitly credited_; not doing so is [plagiarism](http://writing.mit.edu/wcc/avoidingplagiarism).) Model your paper on academic review articles (e.g. read _SIAM Review_ and similar journals for examples).

Frequently asked questions about the final project:

1.  _Does it have to be about numerical linear algebra?_ No. It can be any numerical topic (basically, anything where you are computing a conceptually real result, not integer computations), excluding algorithms for discretizing PDEs.
2.  _Can I use a matrix from a discretized PDE?_ Yes. You can take a matrix from the PDE as input and then talk about iterative methods to solve it, etcetera. I just don't want the paper to be about the PDE discretization technique itself.
3.  _How formal is the proposal?_ Very informal—one page describing what you plan to do, with a couple of references that you are using as starting points. Basically, the proposal is just so that I can verify that what you are planning is reasonable and to give you some early feedback.
4.  _How much code do I need to write?_ A typical project (there may be exceptions) will include a working proof-of-concept implementation, e.g. in Matlab, that you wrote to demonstrate that you understand how the algorithm works. Your code does _not_ have to be competitive with "serious" implementations, and I encourage you to download and try out existing "serious" implementations (where available) for any large-scale testing and comparisons.
5.  _How should I do performance comparisons?_ Be very cautious about timing measurements: unless you are measuring highly optimized code or only care about orders of magnitude, timing measurements are more about implementation quality than algorithms. Better to measure something implementation independent (like flop counts, or matrix-vector multiplies for iterative algorithms, or function evaluations for integrators/optimizers), although such measures have their own weaknesses.

* * *

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (Sep 5)

**Handouts:** a printout of this webpage (i.e., the syllabus).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

Jumped right into a canonical dense-matrix direct-solver algorithm that we will use to illustrate some performance and accuracy concerns: Gaussian elimination. Briefly reviewed the basic algorithm, and used Trefethen's "graphical" trick to quickly estimate the number of additions+multiplications as roughly 2_m_3/3 for _m_×_m_ problems. Regarding accuracy, one key question is how roundoff errors propagate in this algorithm, which turns out to be a very difficult and partially unsolved problem discussed in Trefethen chapter 20; another question is what to do with pivots that are nearly zero, which treated naively lead to roundoff disasters and lead to the solution of partial pivoting. We will return to both of these topics later in the course. Regarding performance, there are three key questions that we will return to in lecture 2: (0) how expensive is this in practice, (1) is counting arithmetic operations enough to predict performance, and (2) can one do better than Gaussian elimination?

The classic way to analyze performance is operation counts; from last time that flop count (real additions+multiplications) for Gaussian elimination is 2_m_3/3 for _m_×_m_ problems. Show that this means 1000×1000 problems are now routine, but that 106×106 or larger problems (as commonly arise for PDEs) will require us to take advantage of some special structure, usually _sparsity_: matrices that are mostly zeros.

Some discussion of how large matrices arise in practice. Noted that large matrices in practice often have special structure, e.g. sparseness and symmetry, and it is very important to exploit this structure to make their solution practical. _Skipped:_ Gave a simple example of the discrete Laplacian matrix arising from a discretized version of Poisson's equation.

**Further reading:** Trefethen, chapter 20; also it would be good to review chapters 1–3 if your linear algebra is rusty (these chapters are [available online even for non-MIT people](http://web.comlab.ox.ac.uk/people/Nick.Trefethen/text.html)). **If you do not have the prerequisite linear-algebra experience for this course** (e.g. if you don't immediately know what an LU factorization or singular-value decomposition are), you should start reviewing a basic linear algebra book _now_, e.g. chapters 1–6 of [the 18.06 textbook _Introduction to Linear Algebra_](http://math.mit.edu/linearalgebra/) by Strang; we won't use much of this material in the first week or two, so you have a little time to catch up.

### Lecture 2 (Sep 7)

**Handouts:** performance experiments with matrix multiplication ([one-page](matmuls-handout.pdf) or [full-size](matmuls.pdf) versions); [ideal-cache terminology](ideal-cache.pdf); [pset 1](pset1-f12.pdf) (due Friday, Sep 14) (attachments: [matmul\_bycolumn.m](matmul_bycolumn.m), [benchmul.m](benchmul.m))

Counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This leads us to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(_n_3/√_Z_) cache complexity.

**Further reading:** Wikipedia has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/). [Cache-oblivious algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911), describing ideal cache model and analysis for various algorithms, by Frigo, Leiserson, Prokop, and Ramachandran (1999). [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](http://www.mathworks.com/company/newsletters/news_notes/clevescorner/winter2000.cleve.html).

### Lecture 3 (Sep. 10)

**Handouts:** experiments with cache-oblivious matrix-multiplication ([handout](oblivious-matmul-handout.pdf) or [full-size slides](oblivious-matmul.pdf))

Discussed some practical difficulties of the blocked matrix multiplication: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS). Briefly explained ATLAS's self-optimizing code-generation approach, producing zillions of optimized little blocks for different special cases.

Introduced the concept of optimal cache-oblivious algorithms. Discussed cache-oblivious matrix multiplication in theory and in practice (see handout and Frigo et. al paper above).

Discussion of spatial locality and cache lines, with examples of dot products and matrix additions (both of which are "level 1 BLAS" operations with no temporal locality). Discussed matrix storage (row-major and column-major) and effect on algorithms.

**Further reading:** Frigo et al. paper from previous lecture. ATLAS web page above. See [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007) on the difficulty of optimizing for the last level of cache (the registers) in matrix multiplication (compared to FFTs), and why a simple cache-oblivious algorithm is no longer enough. See e.g. the Wikipedia article on [row-major and column-major order](http://en.wikipedia.org/wiki/Row-major_order).

### Lecture 4 (Sep. 12)

**Handouts:** [notes on floating-point](http://persson.berkeley.edu/18.335/lec8handout6pp.pdf) (18.335 Fall 2007); an excerpt from the [Strassen algorithm](http://en.wikipedia.org/wiki/Strassen_algorithm) article on Wikipedia

Discussion of Strassen algorithm and other matrix-multiply algorithms that do betterthan O(_m_3).

New topic: **accuracy and stability**. Start with LU factorization, and give example where small roundoff error can lead to huge mistakes. The next few lectures will deal with, in reverse order (iii) how to improve LU (pivoting); (ii) how to define/characterize accuracy and stability of algorithms; (i) how to describe roundoff errors and computer arithmetic.

The basic issue is that, for computer arithmetic to be fast, it has to be done in hardware, operating on numbers stored in a fixed, finite number of digits (bits). As a consequence, only a _finite subset_ of the real numbers can be represented, and the question becomes _which subset_ to store, how arithmetic on this subset is defined, and how to analyze the errors compared to theoretical exact arithmetic on real numbers.

Began by describing **fixed-point** arithmetic, which is essentially integer arithmetic with a fixed denominator. Fixed-point arithmetic has the advantage that it is fast on simple computers (small embedded processors) that have only integer arithmetic hardware. It has the major disadvantage of limited dynamic range and fixed _absolute_ accuracy, which means that to avoid catastrophic errors you need to pay very careful attention to the absolute scaling of your numbers, and error analysis in general is greatly complicated.

The alternative is **floating-point** arithmetic, in which we store both an integer coefficient and an exponent in some base: essentially, scientific notation. This allows large dynamic range and fixed _relative_ accuracy: if fl(x) is the closest floating-point number to any real x, then |fl(x)-x| < ε|x| where ε is the _machine precision_. This makes error analysis much easier and makes algorithms mostly insensitive to overall scaling or units, but has the disadvantage that it requires specialized floating-point hardware to be fast. Nowadays, all general-purpose computers, and even many little computers like your cell phones, have floating-point units.

**Further reading:** [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): contains a nice discussion of floating-point myths and misconceptions. Trefethen, lecture 13.

### Lecture 5 (Sep. 14)

**Handouts:** [pset 1 solutions](pset1sol-f12.pdf), [pset 2](pset2-f12.pdf) (due Friday Sep 30); for problems 2 and 3 you will need the Matlab files [loopsum.m](loopsum.m) and [div2sum.m](div2sum.m)).

Overview of **floating-point** representations, focusing on the IEEE 754 standard (see also handout from previous lecture). The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property of _uniform relative precision_ (for |_x_| and 1/|_x_| < than some _range_, ≈10308 for double precision) that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10−16 for double precision). Moreover the IEEE standard guarantees that the result of _x_♦_y_ where ♦ is addition, subtraction, multiplication, or division, is equivalent to computing fl(_x_♦_y_), i.e. computing it in infinite precision and then rounding (this is called "exact rounding" or "correct rounding").

Discussed the choice of base. Decimal floating point has the advantage of representing most human input data exactly, with exact operations on decimal data (up to 16 decimal digits), but has the disadvantage of requiring complicated encodings into binary bits; as a consequence of this, as well as historical inertia, decimal floating point is not implemented in most computer hardware and instead relies on slow software implementations. Binary floating point has the advantage of direct representation in bits and is implemented in hardware on all modern CPUs (except for small embedded processors), but has the disadvantage of not representing decimal fractions exactly. This means that human inputs like "0.345" are rounded, and it is sometimes disconcerting to input "0.345" and then have the computer print out "0.344999999999999".

Briefly discussed some myths about floating point (see the Kahan link above, page 25), especially the pernicious myth that all floating point arithmetic is a little bit "random", and that integer arithmetic is somehow more accurate.

**Further reading**: See the further reading from the previous lecture. See also [decimal floating point](http://en.wikipedia.org/wiki/Decimal_floating_point) and [floating point](http://en.wikipedia.org/wiki/Floating_point) on Wikipedia, which provide a decent overview and many links.

### Lecture 6 (Sep. 17)

**Handout:** [notes on backwards stability of summation](summation-stability.pdf)

Gave the obvious definition of accuracy, or more technically stability: "forwards stability" = almost the right answer for the right input. Showed that this is often too strong; e.g. adding a sequence of numbers is not forwards stable. (Basically because the denominator in the relative forwards error, which is the exact sum, can be made arbitrarily small via cancellations.)

More generally, we apply a weaker condition: "stability" = almost the right answer for almost the right input. (Gave the technical version of this, from the book.) Forwards stability implies stability but not the converse.

Often, it is sufficient to prove "backwards stability" = right answer for almost the right input. Showed that, in our example of adding a sequence of numbers, backwards stability seems to work where forwards stability failed. Then more rigorously proved that floating-point summation of _n_ numbers is backwards stable.

**Further reading:** Trefethen, lectures 13, 14, and 3

### Lecture 7 (Sep. 19)

**Handout:** [notes on the equivalence of norms](norm-equivalence.pdf)

When quantifying errors, a central concept is a norm, and we saw in our proof of backwards stability of summation that the choice of norm seems important. Defined norms (as in lecture 3 of Trefethen), gave examples of norms of column vectors: _Lp_ norms (usually _p_ = 1, 2, or ∞) and weighted L2 norms.

Started discussing matrix norms. The most important matrix norms are those that are related to matrix operations. Started with the Frobenius norm. Related the Frobenius norm |A|F to the square root of the sum of eigenvalues of A\*A, which are called the _singular values_ σ2; we will do much more on singular values later, but for now noted that they equal the squared eigenvalues of A if A\*\=A (Hermitian). Also defined the induced matrix norm, and bounded it below by the maximum eigenvalue magnitude of A (if A is square). For the L2 induced norm, related it (without proof for now) to the maximum singular value.

Equivalence of norms. Described fact that any two norms are equivalent up to a constant bound, and showed that this means that **stability in one norm implies stability in all norms.** Sketched proof: (i) show we can reduce the problem to proving any norm is equivalent to _L_1 on (ii) the unit circle; (iii) show any norm is continuous; and (ii) use a result from real analysis: a continuous function on a closed/bounded (compact) set achieves its maximum and minimum, the [extreme value theorem](http://en.wikipedia.org/wiki/Extreme_value_theorem). See notes handout.

**Further reading:** Trefethen, lecture 3.

### Lecture 8 (Sep. 24)

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

Calculated condition number for square root, summation, and matrix-vector multiplication, as well as solving Ax=b, similar to the book. Defined the condition number of a matrix.

Related matrix _L_2 norm to eigenvalues of _B_\=_A_\*_A_. _B_ is obviously Hermitian (_B_\*\=_B_), and with a little more work showed that it is positive semidefinite: _x_\*_B__x_≥0 for any _x_. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian and positive-semidefinite matrices. Hermitian means that the eigenvalues are real, the eigenvectors are orthogonal (or can be chosen orthogonal). Also, a Hermitian matrix must be diagonalizable (I skipped the proof for this; we will prove it later in a more general setting). Positive semidefinite means that the eigenvalues are nonnegative.

Proved that, for a Hermitian matrix B, the **Rayleigh quotient** R(x)=x\*Bx/x\*x is bounded above and below by the largest and smallest eigenvalues of B (the "min–max theorem"). Hence showed that the L2 induced norm of A is the square root of the largest eigenvalue of _B_\=_A_\*_A_. Similarly, showed that the L2 induced norm of A\-1 is equal to the square root of the inverse of the smallest eigenvalue of _A__A_\*.

Understanding norms and condition numbers of matrices therefore reduces to understanding the eigenvalues of _A_\*_A_ and _A__A_\*. However, looking at it this way is unsatisfactory for several reasons. First, we would like to solve one eigenproblem, not two. Second, working with things like _A_\*_A_ explicitly is often bad numerically, because it squares the condition number \[showed that κ(_A_\*_A_)=κ(_A_)2\] and hence exacerbates roundoff errors. Third, we would really like to get some better understanding of _A_ itself. All of these concerns are addressed by the **singular value decomposition** or **SVD**, which we will derive next time.

**Further reading:** Trefethen, lectures 12, 14, 15, 24. See any linear-algebra textbook for a review of eigenvalue problems, especially Hermitian/real-symmetric ones.

### Lecture 9 (Sep. 26)

Explicitly constructed SVD in terms of eigenvectors/eigenvalues of _A_\*_A_ and _A__A_\*. Related to singular values to induced L2 norm and condition number.

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 10 (Sep. 28)

Talked a little about the SVD and low-rank approximations (more on this in homework). Talked about [principal component analysis](http://en.wikipedia.org/wiki/Principal_component_analysis) (PCA), and gave ["eigenwalker"](http://www.biomotionlab.ca/Demos/BMLwalker.html) demo.

Introduced least-squares problems, gave example of polynomial fitting, gave normal equations, and derived them from the condition that the L2 error be minimized.

Discussed solution of normal equations. Discussed condition number of solving normal equations directly, and noted that it squares the condition number—not a good idea if we can avoid it.

**Further reading:** Trefethen, lectures 7, 8.

### Lecture 11 (Oct. 1)

**Handouts:** [Householder summary](http://persson.berkeley.edu/18.335/lec6handout6pp.pdf), [pset 2 solutions](pset2sol-f12.pdf), [pset 3](pset3-f12.pdf) (due next Friday).

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Explained why, if we can do it accurately, this will give a good way to solve least-squares problems.

Gave the simple, but unstable, construction of the Gram-Schmidt algorithm, to find a QR factorization.

Operation count for Gram-Schmidt. Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example, especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt and argued how it (mostly) fixes the problem.

**Further reading:** Trefethen, lectures 7, 8.

### Lecture 12 (Oct. 3)

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Show how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

Finished Householder QR derivation, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 13 (Oct. 5)

Returned to Gaussian elimination. Reviewed the fact that this givs an A=LU factorization, and that we then solve Ax=b by solving Ly=b (doing the same steps to b that we did to A during elimination to get y) and then solving Ux=y (backsubstitution). Emphasized that you should _almost never compute A\-1_ explicitly. It is just as cheap to keep L and U around, since triangular solves are essentially the same cost as a matrix-vector multiplication. Computing A\-1 is usually a mistake: you can't do anything with A\-1 that you couldn't do with L and U, and you are wasting both computations and accuracy in computing A\-1. A\-1 is useful in abstract manipulations, but whenever you see "x=A\-1b" you should interpret it for computational purposes as solving Ax=b by LU or some other method.

Introduced partial pivoting, and pointed out (omitting bookkeeping details) that this can be expressed as a PA=LU factorization where P is a permutation. Began to discuss backwards stability of LU, and mentioned example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

Discussed Cholesky factorization, which is Gaussian elimation for the special case of Hermitian positive-definite matrices, where we can save a factor of two in time and memory. Showed explicitly how this factorization arises from Gaussian elimination plus an extra symmetrization step, by induction.

**Further reading:** Trefethen, lectures 20, 21, 22, 23.

### Lecture 14 (Oct. 10)

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial, mentioned extensions to generalized eigenproblems and SVDs.

Pointed out that an "LU-like" algorithm for eigenproblems, which computes the exact eigenvalues/eigenvectors (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists (or can _ever_ exist) to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Discussed the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

As a result, all eigenproblem methods must be _iterative_: they must consist of improving an initial guess, in successive steps, so that it converges towards the exact result to _any desired accuracy_, but never actually reaches the exact answer in general. A simple example of such a method is Newton's method, which can be applied to iteratively approximate a root of any nonlinear function to any desired accuracy, given a sufficiently good initial guess.

However, finding roots of the characteristic polynomial is generally a terrible way to find eigenvalues. Actually computing the characteristic polynomial coefficients and then finding the roots somehow (Newton's method?) is a disaster, incredibly ill-conditioned: gave the example of Wilkinson's polynomial. If we can compute the characteristic polynomial values implicitly somehow, directly from the determinant, then it is not too bad (if you are looking only for eigenvalues in some known interval, for example), but we haven't learned an efficient way to do that yet. The way LAPACK and Matlab actually compute eigenvalues, the QR method and its descendants, wasn't discovered until 1960.

Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization. Proved (by induction) that every (square) matrix has a Schur factorization, and that for Hermitian matrices the Schur form is real and diagonal.

**Further reading:** Trefethen, lecture 24, 25.

### Lecture 15 (Oct. 12)

**Handouts:** [notes on Hessenberg factorization](http://persson.berkeley.edu/18.335/lec14handout6pp.pdf)

The key to making most of the eigensolver algorithms efficient is reducing A to **Hessenberg form**: A=QHQ\* where H is upper triangular plus one nonzero value below each diagonal. Unlike Schur form, Hessenberg factorization _can_ be done exactly in a finite number \[Θ(m3)\] of steps (in exact arithmetic). H and A are similar: they have the same eigenvalues, and the eigenvector are related by Q. And once we reduce to Hessenberg form, all the subsequent operations we might want to do (determinants, LU or QR factorization, etcetera), will be fast. In the case of Hermitian A, showed that H is tridiagonal; in this case, most subsequent operations (even LU and QR factorization) will be Θ(m) (you will show this in HW)!

For example we can actually evaluate det(A-λI)=det(H-λI) in O(m2) time for each value of λ, or O(m) time if A is Hermitian, making e.g. Newton's method on det(H-λI) much more practical. It will also accelerate lots of other methods to find eigenvalues.

Introduced basic idea of Hessenberg factorization by relating it to Householder QR, and in particular showed that Householder reflectors will do the job as long as we allow one nonzero element below the diagonal (see handout).

### Lecture 16 (Oct. 15)

Discussed power method for biggest-|λ| eigenvector/eigenvalue, and (re-)introduced the Rayleigh quotient to estimate the eigenenvalue. Discussed the convergence rate, and how for Hermitian matrix the eigenvalue estimate has a much smaller error than the eigenvector (the error is squared) due to the fact that the eigenvalue is an extremum.

Discussed how to use the power method to get multiple eigenvalues/vectors of Hermitian matrices by "deflation" (using orthogonality of eigenvectors). Discussed how, in principle, QR factorization of _An_ for large _n_ will give the eigenvectors and eigenvalues in descending order of magnitude, but how this is killed by roundoff errors.

Discussed inverse iteration, shifted inverse iteration, and Rayleigh quotient iteration, and their respective convergence rates. Showed how QR is equivalent to QR factorizing _A\-n_ (inverse iteration), and by a simple trick we can instead incorporate shifts to obtain the shifted QR algorithm.

**Further reading:** See Trefethen, lecture 27, and these [2007 notes](http://persson.berkeley.edu/18.335/lec15handout6pp.pdf) on power/inverse/Rayleigh iteration.

### Lecture 17 (Oct. 17)

**Handouts:** [pset 3 solutions](pset3sol-f12.pdf), [pset 4](pset4-f12.pdf)

Unshifted QR method: proved that repeatedly forming A=QR, then replacing A with RQ (as in pset 3) is equivalent to QR factorizing _An_. But since we do this while only multiplying repeatedly by unitary matrices, it is well conditioned and we get the eigenvalues accurately.

To make the QR method faster, we first reduce to Hessenberg form; you will show in pset 4 that this is especially fast when A is Hermitian and the Hessenberg form is tridiagonal. Second, we use shifts.

In particular, the worst case for the QR method, just as for the power method, is when eigenvalues are nearly equal. We can fix this by shifting.

Briefly mentioned the Wilkinson shift to break ties, rather than just using a shift based on the minimum |λ| estimate.

There are a number of additional tricks to further improve things, the most important of which is probably the Wilkinson shift: estimating μ from a little 2×2 problem from the last _two_ columns to avoid problems in cases e.g. where there are two equal and opposite eigenvalues. Some of these tricks (e.g. the Wilkinson shift) are described in the book, and some are only in specialized publications. If you want the eigenvectors as well as eigenvalues, it turns out to be more efficient to use a more recent "divide and conquer" algorithm, summarized in the book, but where the details are especially tricky and important. However, at this point I don't want to cover more gory details in 18.335. Although it is good to know the general structure of modern algorithms, especially the fact that they look nothing like the characteristic-polynomial algorithm you learn as an undergraduate, as a practical matter you are always just going to call LAPACK if the problem is small enough to solve directly. Matters are different for much larger problems, where the algorithms are not so bulletproof and one might need to get into the guts of the algorithms; this will lead us into the next topic of the course, iterative algorithms for large systems, in subsequent lectures.

Briefly discussed Golub–Kahn bidiagonalization method for SVD, just to get the general flavor. At this point, however, we are mostly through with details of dense linear-algebra techniques: the important thing is to grasp the fundamental ideas rather than zillions of little details, since in practice you're just going to use LAPACK anyway.

**Further reading:** See Trefethen, lectures 28–31, and Per Persson's 2007 notes on QR ([part 1](http://persson.berkeley.edu/18.335/lec15handout6pp.pdf) and [part 2](http://persson.berkeley.edu/18.335/lec16handout6pp.pdf)).

### Lecture 18 (Oct. 19)

Started discussing (at a very general level) a new topic: iterative algorithms, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix-vector products but cannot (practically) mess around with the specific entries of _A_.

Emphasized that there are many iterative methods, and that there is no clear "winner" or single bulletproof library that you can use without much thought (unlike LAPACK for dense direct solvers). It is problem-dependent and often requires some trial and error. Then there is the whole topic of preconditioning, which we will discuss more later, which is even more problem-dependent. Briefly listed several common techniques for linear systems (Ax=b) and eigenproblems (Ax=λx or Ax=λBx).

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Anv and throws away the previous ones. Introduced Krylov subspaces, and the idea of Krylov subspace methods: find the best solution in the whole subspace spanned by v,Av,...,An-1v.

Derive the Arnoldi algorithm. Unlike the book, I _start_ the derivation by considering it to be modified Gram-Schmidt on (q1,Aq1,Aq2,Aq3,...). In the next lecture, we will re-interpret this as a partial Hessenberg factorization.

Discussed what it means to stop Arnoldi after n<m iterations: finding the "best" solution in the Krylov subspace Kn. Discussed the general principle of Rayleigh-Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method).

**Further reading:** Trefethen, lecture 31, 32, 33, 34. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html), are useful surveys of iterative methods.

### Lecture 19 (Oct. 22)

Continuing from previous lecture, also showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace.

Mentioned another iterative method for eigenvalues of Hermitian matrices: turning into a problem of maximizing or minimizing the Rayleigh quotient. In particular, we will see later in the class how this works beautifully with the nonlinear conjugate-gradient algorithm. More generally, we will see that there is often a deep connection between solving linear equations and optimization problems/algorithms—often, the former can be turned into the latter or vice versa.

Lanczos: Arnoldi for Hermitian matrices. Showed that in this case we get a three-term recurrence for the tridiagonal reduction of A. (Derivation somewhat different than in the book. By using A=A\* and the construction of the q vectors, showed explicitly that qj\*v=qj\*Aqn\=0 for j<n-1, and that for j=n gives |v|=βn from the n-th step. Hence Arnoldi reduces to a three-term recurrence, and the Ritz matrix is tridiagonal.)

Noted that Arnoldi requires Θ(mn2) operations and Θ(mn) storage. If we only care about the eigenvalues and not the eigenvectors, Lanczos requires Θ(mn) operations and Θ(m+n) storage. However, this is complicated by rounding problems.

Discussed how rounding problems cause a loss of orthogonality in Lanczos, leading to "ghost" eigenvalues where extremal eigenvalues re-appear. In Arnoldi, we explicitly store and orthogonalize against all qj vectors, but then another problem arises: this becomes more and more expensive as n increases. The solution to this is restarting, discussed in the next lecture.

**Further reading:** Trefethen, lectures 33, 36.

### Lecture 20 (Oct. 24)

A solution to the loss of orthogonality in Lanczos and the growing computational effort in Arnoldi is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors. For k=1 this is easy, but explained why it is nontrivial for k>1: we need to restart in such a way that maintains the Lanczos (or Arnoldi) property that the residual AQn - QnHn is nonzero only in the n-th column (and that column is orthogonal to Qn).

Discussed the implicitly restarted Lanczos method, which does n−k steps of shifted QR to reduce the problem from n to k dimensions. The key thing is that, because the Q matrices in QR on tridiagonal matrices are upper Hessenberg, their product can be shown to preserve the Lanczos property of the residual for the first k columns.

**Further reading:** See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 21 (Oct. 26)

Following the book (lecture 34), discussed the polynomial viewpoint on the convergence of the Arnoldi algorithm: the n-th step of Arnoldi can be viewed as minimizing |p(λ)| on the eigenvalues of A over all "monic" degree-n polynomials p (such that the degree-n coefficient of p is 1). The roots of p are the Ritz values, and making |p(λ)| small corresponds to placing Ritz values near eigenvalues or clusters of eigenvalues. From this, argued that Arnoldi will tend to converge to extremal eigenvalues first, and will converge more quickly if (a) the extremal eigenvalues are far from the rest of the spectrum and (b) the rest of the eigenvalues are clustered. Moreover, used this viewpoint to show that the convergence of (unrestarted) Arnoldi is invariant under shifts A+μI. So, it finds "extremal" eigenvalues in the sense of eigenvalues that are far from other eigenvalues, not far from the origin. And if you want to find eigenvalues close to μ, you should apply Arnoldi to (A-μI)\-1 or similar.

New topic: iterative methods for Ax=b linear equations. Started discussing the GMRES method, which is the direct analogue of Arnoldi for linear equations.

Derived the GMRES method as in lecture 35 of Trefethen, as residual minimization in the Krylov space using Arnoldi's orthonormal basis Qn. Like Arnoldi, this is too expensive to run for many steps without restarting. Unlike Arnoldi, there isn't a clear solution (yet) for a good restarting scheme, and in particular there are problems where restarted GMRES fails to converge; in that case, you can try restarting after a different number of steps, try a different algorithm, or find a better preconditioner (a topic for later lectures).

Just as Arnoldi reduces to Lanczos for Hermitian matrices, GMRES reduces to MINRES, which is a cheap recurrence with no requirement for restarting. Briefly discussed MINRES, the fact that it converges but has worse rounding errors.

**Further reading:** Trefethen, lectures 34, 35.

### Lecture 22 (Oct. 31)

**Handouts:** [pset 4 solutions](pset4sol-f12.pdf)

Began discussing gradient-based iterative solvers for Ax=b linear systems, starting with the case where A is Hermitian positive-definite. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=x\*Ax-x\*b-b\*x. Then, we perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method. Discussed successive line minimization of f(x), and in particular the steepest-descent choice of d=b-Ax at each step. Explained how this leads to "zig-zag" convergence by a simple two-dimensional example, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

Derived the conjugate-gradient method, by explicitly requiring that the n-th step minimize over the whole Krylov subspace (the span of the previous search directions). This gives rise to an orthogonality ("conjugacy", orthogonality through A) condition on the search directions, and can be enforced with Gram-Schmidt on the gradient directions. Then we show that a Lanczos-like miracle occurs: most of the Gram-Schmidt inner products are zero, and we only need to keep the previous search direction.

**Further reading:** Trefethen, lectures 35 and 39. [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES). Regarding convergence problems with GMRES, see this 2002 presentation by Mark Embree on [Restarted GMRES dynamics](http://www.caam.rice.edu/~embree/householder.pdf). On MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Midterm (Nov. 2)

The (2-hour) [midterm exam](midterm-f12.pdf) and [solutions](midtermsol-f12.pdf)

### Lecture 23 (Nov. 5)

Derived the conjugate-gradient method, by explicitly requiring that the n-th step minimize over the whole Krylov subspace (the span of the previous search directions). This gives rise to an orthogonality ("conjugacy", orthogonality through A) condition on the search directions, and can be enforced with Gram-Schmidt on the gradient directions. Then we show that a Lanczos-like miracle occurs: most of the Gram-Schmidt inner products are zero, and we only need to keep the previous search direction.

Discussed convergence of conjugate gradient: useless results like "exact" convergence in m steps (not including roundoff), pessimistic bounds saying that the number of steps goes like the square root of the condition number, and the possibility of superlinear convergence for clustered eigenvalues.

Started discussing the polynomial viewpoint in the textbook, which views conjugate gradient (and other algorithms) as trying to find a polynomial that is as small as possible at the eigenvalues. This gives a nice way to think about how fast iterative methods converge and the impact of the eigenvalue spectrum.

**Further reading:** See the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk. See the textbook, lecture 38, for the polynomial viewpoint.

### Lecture 24 (Nov. 7)

Discussed the convergence rate of conjugate gradient and GMRES in terms of polynomial approximations. Following the book closely, showed that the relative errors (in the solution for CG or the residual for GMRES) can be bounded minimizing the value p(λ) of a polynomial p(z) evaluated at the eigenvalues, where p(0)=1 and p has degree _n_ after the _n_\-th iteration. (There is also a factor of the condition number of the eigenvector matrix in GMRES, so it is favorable for the eigenvectors to be near-orthogonal, i.e for the matrix to be near-[normal](http://en.wikipedia.org/wiki/Normal_matrix).)

Using this, we can see that the most favorable situation occurs when the eigenvalues are grouped into a small cluster, or perhaps a few small clusters, since we can then make p(λ) small with a low-degree polynomial that concentrates a few roots in each cluster. This meanst that CG and GMRES will achieve small errors in only a few iterations. Morever we can see that a _few_ outlying eigenvalues aren't a problem, since p(z) will quickly attain roots there and effectively eliminate those eigenvalues from the error—this quantifies the intuition that Krylov methods "improve the condition number" of the matrix as the iteration proceeds, which is why the condition-number bounds on the error are often pessimistic. Conversely, the worst case will be when the eigenvalues are all spread out uniformly in some sense. Following examples 35.1 and 35.2 in the book, you can actually have two matrices with very similar small condition numbers but very different GMRES convergence rates, if in one case the eigenvalues are clustered and in the other case the eigenvalues are spread out in a circle around the origin (i.e. with clustered magnitudes |λ| but different phase angles).

Contrasted with Arnoldi/Lanczos.

**Preconditioners**

In many practical cases, unfortunately, the eigenvalues of A are _not_ mostly clustered, so convergence of CG or GMRES may be slow. The solution to this problem is **preconditioning**: finding an easy-to-invert M such that M\-1A has clustered eigenvalues (and is not too far from normal).

Discussed preconditioning: finding an easy-to-invert M such that M\-1A has clustered eigenvalues. Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of M\-1A is not actually a problem as long as M is Hermitian positive-definite).

**Further reading:** Trefethen, lectures 34, 35, 38, 40. The convergence of GMRES for very non-normal matrices is a complicated subject; see e.g. [this paper on GMRES for defective matrices](http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.48.1733) or [this paper surveying different convergence estimates](http://eprints.maths.ox.ac.uk/1290/).

### Lecture 25 (Nov. 9)

**Handouts:** [pset 5](pset5-f12.pdf) (due next Friday) (see also files [SD.m](SD.m) and [A386.m](A386.m)).

Via a simple analysis of the discretized Poisson's equation, then generalized to any discretized grid/mesh with nearest-neighbor interactions, argued that the number of steps in unpreconditioned CG is (at least) proportional to the diameter of the grid for sparse matrices of this type, and that this exactly corresponds to the square root of the condition number in the Poisson case. Hence, an ideal preconditioner really needs some kind of long-range interaction.

Brief summary of some preconditioning ideas: multigrid, incomplete LU/Cholesky, Jacobi/block-Jacobi. (Since Jacobi preconditioners only have short-range interactions, they tend not to work well for matrices that come from finite-difference/finite-element discretizations on grids, but they can work well for diagonally dominant matrices that arise in spectral and integral-equation methods.)

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html), Trefethen chapter 40, and e.g. _[Matrix Preconditioning Techniques and Applications](http://books.google.com/books?id=d9UdanCqJ1QC)_ by Ke Chen (Cambridge Univ. Press, 2005).

### Lecture 26 (Nov. 14)

**Handouts:** [summary of options for solving linear systems](solver-options.pdf)

**Biconjugate gradient:** As an alternative to GMRES for non-Hermitian problems, considered the biCG algorithm. Derived it as in the van der Vorst notes below: as PCG on the Hermitian-indefinite matrix B=\[0,A;A\*,0\] with the "preconditioner" \[0,I;I,0\] (in the unpreconditioned case). Because this is Hermitian, there is still a conjugacy condition and it is still a Krylov method. Because it is indefinite, we are finding a saddle point and not a minimum of a quadratic, and _breakdown_ can occur if one of the denominators (e.g. d\*Bd) becomes zero. (This is the same as algorithm 39.1 in Trefethen, but derived very differently.) Because of this, you should almost never use the plain biCG algorithm. However, the biCG idea was the starting point for several "stabilized" refinements, culminating in biCGSTAB(L) that try to avoid breakdown by combining biCG with elements of GMRES. Another algorithm worth trying is the QMR algorithm.

Concluded with some rules of thumb (see handout) about which type of solvers to use: LAPACK for small matrices (< 1000×1000), sparse-direct for intermediate-size sparse cases, and iterative methods for the largest problems or problems with a fast matrix\*vector but no sparsity. One important point is that sparse-direct algorithms scale much better for sparse matrices that come from discretization of 2d PDEs than 3d PDEs. In general, some experimentation is required to find the best technique for a given problem, so software like Matlab or the Petsc library is extremely helpful in providing a quick way to explore many algorithms.

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview of iterative methods for non-Hermitian problems can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES).

### Lecture 27 (Nov. 16)

**Handouts:** [notes on sparse-direct solvers](http://persson.berkeley.edu/18.335/lec20handout6pp.pdf) from Fall 2007.

**Sparse-direct solvers:** For many problems, there is an intermediate between the dense Θ(m3) solvers of LAPACK and iterative algorithms: for a sparse matrix A, we can sometimes perform an LU or Cholesky factorization while maintaining sparsity, storing and computing only nonzero entries for vast savings in storage and work. In particular, did a Matlab demo, a few experiments with a simple test case: the "discrete Laplacian" center-difference matrix on uniform grids that we've played with previously in 18.335. In 1d, this matrix is tridiagonal and LU/Cholesky factorization produces a bidiagonal matrix: Θ(m) storage and work! For a 2d grid, there are 4 off-diagonal elements, and showed how elimination introduces Θ(√m) nonzero entries in each column, or Θ(m3/2) nonzero entries in total. This is still not too bad, but we can do better. First, showed that this "fill-in" of the sparsity depends strongly on the ordering of the degrees of freedom: as an experiment, tried a _random_ reordering, and found that we obtain Θ(m2) nonzero entries (~10% nonzero). Alternatively, one can find re-orderings that greatly reduce the fill-in. One key observation is that the fill-in only depends on the pattern of the matrix, which can be interpreted as a [graph](http://en.wikipedia.org/wiki/Graph_%28mathematics%29): m vertices, and edges for the nonzero entries of A (an [adjacency matrix](http://en.wikipedia.org/wiki/Adjacency_matrix) of the graph), and sparse-direct algorithms are closely related to graph-theory problems. For our simple 2d Laplacian, the graph is just the picture of the grid connecting the points. One simple algorithm is the [nested dissection algorithm](http://en.wikipedia.org/wiki/Nested_dissection): recursively find a separator of the graph, then re-order the vertices to put the separator last. This reorders the matrix into a mostly block-diagonal form, with large blocks of zeros that are preserved by elimination, and if we do this recursively we greatly reduce the fill-in. Showed some experiments to illustrate the fill-in structure, for our 2d grid where separators are obvious; for more general matrices finding separators is a hard and important problem in graph theory.

**Further reading:** A [survey of nested-dissection algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.58.9722) (Khaira, 1992). List of [sparse-direct solver software](http://www.cs.utk.edu/~dongarra/etemplates/node388.html) by Dongarra and [another list by Davis](http://www.cise.ufl.edu/research/sparse/codes/). [Notes on multifrontal sparse-direct methods](http://www.cse.illinois.edu/courses/cs598mh/gupta.ps) by M. Gupta (UIUC, 1999). The book _[Direct Methods for Sparse Linear Systems](http://books.google.com/books?id=TvwiyF8vy3EC&lpg=PR1&ots=odauEC2c4k&dq=direct%20methods%20for%20sparse%20davis&pg=PR1#v=onepage&q&f=false)_ by Davis is a useful reference. Outside of Matlab, a popular library to help you solve spare problems is [Petsc](http://www.mcs.anl.gov/petsc/petsc-as/).

### Lecture 28 (Nov. 19)

**Handouts:** [overview of optimization](optimization-handout.pdf) ([full-page slides](optimization.pdf))

Several of the iterative algorithms so far have worked, conceptually at least, by turning the original linear-algebra problem into a minimization problem. It is natural to ask, then, whether we can use similar ideas to solve more general **optimization problems**, which will be the next major topic in 18.335.

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

### Lecture 29 (Nov. 21)

**Handouts:** [notes on adjoint methods](http://math.mit.edu/~stevenj/18.336/adjoint.pdf) to compute gradients

A simple algorithm, to start with: successive line minimization (for unconstrained local optimization with continuous design parameters), which leads us directly to nonlinear steepest-descent and thence to nonlinear conjugate-gradient algorithms. The key point being that, near a local minimum of a smooth function, the objective is typically roughly quadratic (via Taylor expansion), and when that happens CG greatly accelerates convergence. (Mentioned Fletcher–Powell heuristic to help "reset" the search direction to the gradient if we are far from the minimum and convergence has stalled; see the Hager survey below for many more.)

Outlined application of nonlinear CG to Hermitian eigenproblems by minimizing the Rayleigh quotient (this is convex, and furthermore we can use the Ritz vectors to shortcut both the conjugacy and the line minimization steps).

Introduction to **adjoint** methods and the remarkable fact that one can compute the gradient of a complicated function with about the same number of additional operations as computing the function _once_.

**Further reading:** For CG for eigenproblems, see the _Templates_ book's section on [preconditioned CG methods for eigenproblems](http://www.cs.utk.edu/~dongarra/etemplates/node418.html). See this [survey by Hager and Zhang (2005)](https://www.math.lsu.edu/~hozhang/papers/cgsurvey.pdf) of variants of nonlinear CG, especially variations on how the search direction is updated.

### Lecture 30 (Nov. 26)

**Handouts:** [notes on adjoint methods for recurrence relations](http://math.mit.edu/~stevenj/18.336/recurrence2.pdf); pages 1–10 of [Svanberg (2002) paper on CCSA algorithms](
http://dx.doi.org/10.1137/S1052623499362822)

Adjoint methods for recurrence relations, following notes.

Discussed some general concepts in local optimization. **Global convergence** means convergence to a _local_ optimum from any _feasible_ starting point; explained why finding the feasible region from an _infeasible_ starting point is in general as hard as global optimization. A typical **trust region** approach is to _locally approximate_ the objective and constraint functions by some _simple functions_ that are easy to optimize, optimize them within some localized trust region around a current point **x** to obtain a candidate step **y**, and then either take the step (e.g. if **y** is an improvement) and/or update the approximations and trust region (e.g. if **y** was not an improvement or the approximation and exact functions differed greatly). There are many, many algorithms that follow this general outline, but they differ greatly in what approximations they use (e.g. linear, quadratic, ...), what trust region they use, and what methods they use to update the trust region and to evaluate candidate steps. Often, the approximate functions are _convex_ so that convex-optimization methods can be used to solve the _trust-region subproblems_.

Start discussing a particular example of a nonlinear optimization scheme, solving the full inequality-constrained nonlinear-programming problem: the CCSA and MMA algorithms, as refined by Svanberg (2002). This is a surprisingly simple algorithm (the [NLopt](http://ab-initio.mit.edu/nlopt) implementation is only 300 lines of C code), but is robust and provably convergent, and illustrates a number of important ideas in optimization: optimizing an approximation to update the parameters **x**, guarding the approximation with trust regions and penalty terms, and optimizing via the dual function (Lagrange multipliers). Like many optimization algorithms, the general ideas are very straightforward, but getting the details right can be delicate!

Outlined the inner/outer iteration structure of CCSA, and the interesting property that it produces a sequence of feasible iterates from a feasible starting point, which means that you can stop it early and still have a feasible solution (which is very useful for many applications where 99% of optimal is fine, but feasibility is essential).

### Lecture 31 (Nov. 28)

Considered only the linear/quadratic CCSA models from the paper, for simplicity. Covered conservative approximations, inner/outer iterations, and trust-region and penalty updating. Because the CCSA approximations are convex, we can use ideas from convex optimization to perform solve the trust-region subproblem: **duality**.

Started by reviewing the basic idea of Lagrange multipliers to find an extremum of one function f0(x) and one equality constraint h1(x)=0. We instead find an extremum of L(x,ν1)=f0(x)+ν1h1(x) over x and the _Lagrange multiplier_ ν1. The ν1 partial derivative of L ensures h1(x)=0, in which case L=f0 and the remaining derivatives extremize f0 along the constraint surface. Noted that ∇L=0 then enforces ∇f0\=0 in the direction parallel to the constraint, whereas perpendicular to the constraint ν1 represents a "force" that prevents x from leaving the h1(x)=0 constraint surface.

Generalized to the Lagrangian L(x,λ,ν) of the general optimization problem (the "primal" problem) with both inequality and equality constraints, following chapter 5 of the Boyd and Vandenberghe book (see below) (section 5.1.1). Defined the Lagrange dual function g(λ,ν) (Boyd, section 5.1.2) and proved weak duality of the dual problem (sections 5.1.3, 5.2, 5.2.2). Commented on strong duality (5.2.3), which is mostly true/useful in convex problems (Slater's condition). Defined the notation x\* etcetera for the optimum, as in Boyd.

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online), chapter 5. There are many sources on [Lagrange multipliers](http://en.wikipedia.org/wiki/Lagrange_multipliers) (the special case of equality constraints) online that can be found by googling.

### Lecture 32 (Nov. 30)

Explained how to solve the convex subproblem from the CCSA (Svanberg, 2001) method (see lecture 29) using duality. We reduce it to a dual problem with only bound constraints on the dual variables, and then do CCSA recursively to obtain a dual problem with no variables at all (trivially solvable).

Described the KKT conditions for a (local) optimum/extremum (Boyd, section 5.5.3). These are true in problems with strong duality, as pointed out by Boyd, but they are actually true in much more general conditions. For example, they hold under the "LICQ" condition in which the gradients of all the active constraints are linearly independents. Gave a simple graphical example to illustrate why violating LICQ requires a fairly weird optimum, at a cusp of two constraints.

CCSA uses only the function value and gradient information from the current step, discarding the gradients from the previous steps; in that sense, it is similar in spirit to steepest-descent algorithms or successive LP approximations. More sophisticated algorithms, converging faster near the minimum, will also use (implicit or explicit) second-derivative information. This leads us to Newton and quasi-Newton methods.

Began discussing quasi-Newton methods in general, and the BFGS algorithm in particular. Motivated the problem: we want to construct a sequence of quadratic approximations for our objective function, and optimize these to obtain Newton steps in our parameters. Discussed backtracking line searches to ensure that the Newton step is a sufficient improvement. Discussed difficulty of using exact quadratic model (exact Hessian matrix) in general.

Discussed how quasi-Newton methods are used: they are used to generate not really a step (since the Newton step may be way off if the function is not near the minimum) but rather a direction for a line search. Discussed exact vs. approximate line searches (ala Nocedal, 1980).

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online), chapter 5. The Wikipedia article on the [KKT conditions](http://en.wikipedia.org/wiki/Karush%E2%80%93Kuhn%E2%80%93Tucker_conditions) lists a number of cases in which they hold, and cites some references.

### Lecture 33 (Dec. 3)

Further discussion of inexact line searches and the [Wolfe conditions](http://en.wikipedia.org/wiki/Wolfe_conditions).

Outlined four desirable properties of approximate Hessian matrix: positive definiteness, convergence to exact Hessian for quadratic objectives, multiplying it by the change in _x_ should give the change in the gradient for the most recent step (the "secant condition"), and it should have as much "memory" as possible (minimizing the change to the Hessian or its inverse in some norm).

Following Greenstadt (1970), showed how minimizing the change in the inverse Hessian, in a weighted Frobenius norm, subject to the secant condition and a symmetry constraint, is a QP that can be explicitly solved via the dual problem. This leads to a nice formula involving two rank-1 updates, which is especially nice if a convenient weight is chosen.

**Further reading:** Wikipedia's articles on [quasi-Newton methods](http://en.wikipedia.org/wiki/Quasi-Newton_methods) and the [BFGS method](http://en.wikipedia.org/wiki/BFGS_method) have some useful links and summaries. Helpful derivations of many of the properties of BFGS updates, and many references, can be found in [this 1980 technical report by Dennis and Schnabel](http://www.cs.colorado.edu/department/publications/reports/docs/CU-CS-185-80.pdf) and for a generalization in [this 1994 paper by O'Leary and Yeremin](http://www.cs.umd.edu/~oleary/reprints/j39.pdf), for example. A nice derivation of the minimum-norm change property (or rather, a derivation of the BFGS update formula from this property), can be found in Greenstadt, _Math. Comp._ **24**, pp. 1–22 (1970).

### Lecture 34 (Dec. 5)

Gave BFGS update formula, that the update for the approximate inverse Hessian can be transformed into a similar update for the Hessian, using the Sherman-Morrison formula for rank-1 updates. Briefly derived this formula.

Gave BFGS update formula, and showed that it satisfies at least positivity. Reduced the problem of proving positive-definiteness to showing that the dot product γTδ of the change in gradient (γ) with the change in _x_ (δ) must be positive.

Explained why an exact line search leads to positive γTδ and hence positive-definite approximate Hessians, and why an approximate line-search can usually be defined to enforce this (cf. [Wolfe conditions](http://en.wikipedia.org/wiki/Wolfe_conditions))...and what to do when this doesn't happen.

Briefly discussed the limited-memory BFGS algorithm, and applications to sequential quadratic programming (SQP).

Introduced derivative-free optimization algorithms, for the common case where you don't have too many parameters (tens or hundreds) and computing the gradient is inconvenient (complicated programming, even if adjoint methods are theoretically applicable) or impossible (non-differentiable objectives). Started by discussing methods based on linear interpolation of simplices, such as the COBYLA algorithm of Powell.

Discussed derivative-free optimization based on quadratic approximation by symmetric Broyden updates (as in BOBYQA/NEWUOA algorithm of Powell, for example). Updating the Hessian turns into a quadratic programming (QP) problem, and discussed solution of QPs by construction of the dual, turning it into either an unconstrained QP (and hence a linear system) for equality constrained problems, or a bound-constrained QP for inequality-constrained QPs.

**Further reading:** Wikipedia's article on the [Sherman-Morrison formula](http://en.wikipedia.org/wiki/Sherman-Morrison_formula).The book [Introduction to Derivative-Free Optimization](http://books.google.com/books?id=7c7X6tlcaHEC&lpg=PP1&ots=ljSCrl3WuI&dq=derivative%20free%20optimization%20conn&pg=PP1#v=onepage&q&f=false) by Andrew Conn et al is a reasonable starting point. See also the [derivative-free algorithms in NLopt](http://ab-initio.mit.edu/wiki/index.php/NLopt_Algorithms) and the references thereof.

### Lecture 35 (Dec. 7)

**Handout:** [Notes](http://math.mit.edu/~stevenj/trapezoidal.pdf) on error analysis of the trapezoidal rule and Clenshaw-Curtis quadrature in terms of Fourier series. [two numerical experiments with the trapezoidal rule](trapz.pdf) showing very different possible error characteristics.

New topic: **numerical integration** (numerical quadrature). Began by basic definition of the problem (in 1d) and differences from general ODE problems. Then gave trapezoidal quadrature rule, and simple argument why the error generally decreases with the square of the number of function evaluations.

Showed numerical experiment (see handout) demonstrating that sometimes the trapezoidal rule can do much better than this: it can even have exponential convergence with the number of points! To understand this at a deeper level, I analyze the problem using Fourier series (see handout), and show that the error in the trapezoidal rule is directly related to the convergence rate of the Fourier series. Claimed that this convergence rate is related to the smoothness of the periodic extension of the function, and in fact an analytic periodic function has Fourier coefficients that vanish exponentially fast, and thus the trapezoidal rule converges exponentially in that case. Sketched proof (given in more detail in notes) by integration by parts of the Fourier series.

### Lecture 36 (Dec. 10)

**Handout** [Clenshaw–Curtis quadrature](http://en.wikipedia.org/wiki/Clenshaw%E2%80%93Curtis_quadrature) from Wikipedia (mostly written by SGJ as of Dec. 2012, so I can vouch for its accuracy).

Explained the idea of Clenshaw–Curtis quadrature as a change of variables + a cosine series to turn the integral of _any_ function into the integral of periodic functions. This way, functions only need to be analytic on the interior of the integration interval in order to get exponential convergence. (See Wikipedia handout.)

Also explained (as in the handout) how to precompute the weights in terms of a discrete cosine transform, rather than cosine-transforming the function values every time one needs an integral, via a simple transposition trick.

Discussed the importance of nested quadrature rules for _a posteriori_ error estimation and adaptive quadrature. Discussed p-adaptive vs. h-adaptive adaptive schemes.

Explained connection of Clenshaw-Curtis quadrature and cosine series to Chebyshev polynomials.

**Further reading**: [Chebyshev polynomials on Wikipedia](http://en.wikipedia.org/wiki/Chebyshev_polynomials), free book online [Chebyshev and Fourier Spectral Methods](http://www-personal.umich.edu/~jpboyd/BOOK_Spectral2000.html) by John P. Boyd, the [chebfun package](http://www2.maths.ox.ac.uk/chebfun/) for Matlab by Trefethen et al., Lloyd N. Trefethen, "[Is Gauss quadrature better than Clenshaw-Curtis?](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.157.4174)," _SIAM Review_ **50** (1), 67-87 (2008).

### Lecture 37 (Dec. 12)

**Handout:** [slides on FFTs and FFTW](FFTW-Alan-2008.pdf)

Overview of fast Fourier transform (FFT) algorithms, and brief discussion of efficient implementation of these algorithms ala the FFTW library. This brings us full circle back to the cache topics in the beginning of the term.

**Further reading:** [notes on FFTs](fft-iap3.pdf) and references therein. [The FFTW web page](http://www.fftw.org) and papers/slides linked therein.