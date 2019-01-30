#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Fall 2011.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm (2-105). **Office Hours:** Thursday 4:30–5:30 (2-388).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of Matlab (little or no prior experience required; you will learn as you go).

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). Ordinary differential equations ([18.03](http://math.mit.edu/18.03/) or 18.034) is another listed prerequisite (not so much as specific material, but more as experience with post-freshman calculus).

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu:8888/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: See [the current 18.335 page](../) The [course notes from 18.335 in previous terms](http://persson.berkeley.edu/18.335/), by Per-Olaf Persson, are available online. Although these provide a useful reference, we _will not cover the material in the same sequence_, nor (despite a large overlap) will the material covered be exactly the same. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 33% problem sets (about six). 33% **mid-term exam** (Wed., **Nov. 2 from 2-4pm or from 3-5pm**) \[see Fall '08 [midterm](../fall08/midterm.pdf) and [solutions](../fall08/midterm-sol.pdf) (a bit harder than usual); also see the [Fall '09 midterm](../fall09/midterm-f09.pdf) or the [Fall '10 midterm](../fall10/midterm-f10.pdf) and [solutions](../fall10/midterm-sol-f10.pdf)\], 34% **final project** (one-page proposal due Friday, October 28, project due Wed., **Dec. 14**).

**TA:** TBA.

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

**Final Projects**: The final project will be a 5–15 page paper (single-column, single-spaced, ideally using the style template from the [_SIAM Journal on Numerical Analysis_](http://www.siam.org/journals/auth-info.php)), reviewing some interesting numerical algorithm not covered in the course. \[Since this is not a numerical PDE course, the algorithm should _not_ be an algorithm for turning PDEs into finite/discretized systems; however, your project _may_ take a PDE discretization as a given "black box" and look at some other aspect of the problem, e.g. iterative solvers.\] Your paper should be written for an audience of your peers in the class, and should include example numerical results (by you) from application to a realistic problem (small-scale is fine), discussion of accuracy and performance characteristics (both theoretical and experimental), and a fair comparison to at least one competing algorithm for the same problem. Like any review paper, you should _thoroughly reference_ the published literature (citing both original articles and authoritative reviews/books where appropriate \[rarely web pages\]), tracing the historical development of the ideas and giving the reader pointers on where to go for more information and related work and later refinements, with references cited throughout the text (enough to make it clear what references go with what results). Model your paper on academic review articles (e.g. read _SIAM Review_ and similar journals for examples).

Frequently asked questions about the final project:

1.  _Does it have to be about numerical linear algebra?_ No. It can be any numerical topic (basically, anything where you are computing a conceptually real result, not integer computations), excluding algorithms for discretizing PDEs.
2.  _Can I use a matrix from a discretized PDE?_ Yes. You can take a matrix from the PDE as input and then talk about iterative methods to solve it, etcetera. I just don't want the paper to be about the PDE discretization technique itself.
3.  _How formal is the proposal?_ Very informal—one page describing what you plan to do, with a couple of references that you are using as starting points. Basically, the proposal is just so that I can verify that what you are planning is reasonable and to give you some early feedback.
4.  _How much code do I need to write?_ A typical project (there may be exceptions) will include a working proof-of-concept implementation, e.g. in Matlab, that you wrote to demonstrate that you understand how the algorithm works. Your code does _not_ have to be competitive with "serious" implementations, and I encourage you to download and try out existing "serious" implementations (where available) for any large-scale testing and comparisons.
5.  _How should I do performance comparisons?_ Be very cautious about timing measurements: unless you are measuring highly optimized code or only care about orders of magnitude, timing measurements are more about implementation quality than algorithms. Better to measure something implementation independent (like flop counts, or matrix-vector multiplies for iterative algorithms, or function evaluations for integrators/optimizers), although such measures have their own weaknesses.

* * *

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (Sep 7)

**Handouts:** a printout of this webpage (i.e., the syllabus).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

Some discussion of how large matrices arise in practice, and gave a simple example of the discrete Laplacian matrix arising from a discretized version of Poisson's equation. Noted that large matrices in practice often have special structure, e.g. sparseness and symmetry, and it is very important to exploit this structure to make their solution practical.

Jumped right into a canonical dense-matrix direct-solver algorithm that we will use to illustrate some performance and accuracy concerns: Gaussian elimination. Briefly reviewed the basic algorithm, and used Trefethen's "graphical" trick to quickly estimate the number of additions+multiplications as roughly 2_m_3/3 for _m_×_m_ problems. Regarding accuracy, one key question is how roundoff errors propagate in this algorithm, which turns out to be a very difficult and partially unsolved problem discussed in Trefethen chapter 20; another question is what to do with pivots that are nearly zero, which treated naively lead to roundoff disasters and lead to the solution of partial pivoting. We will return to both of these topics later in the course. Regarding performance, there are three key questions that we will return to in lecture 2: (0) how expensive is this in practice, (1) is counting arithmetic operations enough to predict performance, and (2) can one do better than Gaussian elimination?

The classic way to analyze performance is operation counts; from last time that flop count (real additions+multiplications) for Gaussian elimination is 2_m_3/3 for _m_×_m_ problems. Show that this means 1000×1000 problems are now routine, but that 106×106 or larger problems (as commonly arise for PDEs) will require us to take advantage of some special structure.

**Further reading:** Trefethen, chapter 20; also it would be good to review chapters 1–3 if your linear algebra is rusty (these chapters are [available online even for non-MIT people](http://web.comlab.ox.ac.uk/people/Nick.Trefethen/text.html)). **If you do not have the prerequisite linear-algebra experience for this course** (e.g. if you don't immediately know what an LU factorization or singular-value decomposition are), you should start reviewing a basic linear algebra book _now_, e.g. chapters 1–6 of [the 18.06 textbook _Introduction to Linear Algebra_](http://math.mit.edu/linearalgebra/) by Strang; we won't use much of this material in the first week or two, so you have a little time to catch up.

### Lecture 2 (Sep. 9)

**Handouts:** performance experiments with matrix multiplication ([one-page](matmuls-handout.pdf) or [full-size](matmuls.pdf) versions); [ideal-cache terminology](ideal-cache.pdf); [pset 1](pset1-f11.pdf) (due Monday, Sep 19) (attachments: [matmul\_bycolumn.m](matmul_bycolumn.m), [benchmul.m](benchmul.m));

Counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This leads us to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(_n_3/√_Z_) cache complexity.

**Further reading:** Wikipedia has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/). [Cache-oblivious algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911), describing ideal cache model and analysis for various algorithms, by Frigo, Leiserson, Prokop, and Ramachandran (1999). [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](http://www.mathworks.com/company/newsletters/news_notes/clevescorner/winter2000.cleve.html).

### Lecture 3 (Sep. 12)

**Handouts:** experiments with cache-oblivious matrix-multiplication ([handout](oblivious-matmul-handout.pdf) or [full-size slides](oblivious-matmul.pdf))

Discussed some practical difficulties of the blocked matrix multiplication: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS). Briefly explained ATLAS's self-optimizing code-generation approach, producing zillions of optimized little blocks for different special cases.

Introduced the concept of optimal cache-oblivious algorithms. Discussed cache-oblivious matrix multiplication in theory and in practice (see handout and Frigo et. al paper above).

**Further reading:** Frigo et al. paper from previous lecture. ATLAS web page above. [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007). Trefethen, lecture 20.

### Lecture 4 (Sep. 14)

**Handouts:** [notes on floating-point](http://persson.berkeley.edu/18.335/lec8handout6pp.pdf) (18.335 Fall 2007); page 25 of Kahan's presentation (below).

Discussion of Strassen algorithm and other matrix-multiply algorithms that do betterthan O(_m_3).

New topic: **accuracy and stability**. Start with LU factorization, and give example where small roundoff error can lead to huge mistakes. The next few lectures will deal with, in reverse order (iii) how to improve LU (pivoting); (ii) how to define/characterize accuracy and stability of algorithms; (i) how to describe roundoff errors and computer arithmetic.

Overview of **floating-point** representations, focusing on the IEEE 754 standard. The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property of _uniform relative precision_ (for |_x_| and 1/|_x_| < than some _range_, ≈10308 for double precision) that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10−16 for double precision). Moreover the IEEE standard guarantees that the result of _x_♦_y_ where ♦ is addition, subtraction, multiplication, or division, is equivalent to computing fl(_x_♦_y_), i.e. computing it in infinite precision and then rounding (this is called "exact rounding" or "correct rounding").

Briefly discussed some myths about floating point (from the Kahan handout), especially the pernicious myth that all floating point arithmetic is a little bit "random", and that integer arithmetic is somehow more accurate. Discussed decimal versus binary floating point, and contrasted with fixed-point arithmetic.

**Further reading:** [Using recursion to boost ATLAS's performance](http://www.springerlink.com/content/g146080l0l0xv307/) (D'Alberto and Nicolau, 2008). [Strassen algorithm](http://en.wikipedia.org/wiki/Strassen_algorithm) on Wikipedia (beware the usual nonsense of equating arithmetic counts with speed). [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): see discussion of floating-point myths. Trefethen, lectures 20 and 13.

### Lecture 5 (Sep. 16)

Gave the obvious definition of accuracy, or more technically stability: "forwards stability" = almost the right answer for the right input. Showed that this is often too strong; e.g. adding a sequence of numbers is not forwards stable.

More generally, we apply a weaker condition: "stability" = almost the right answer for almost the right input. (Gave the technical version of this, from the book.) Forwards stability implies stability but not the converse.

Often, it is sufficient to prove "backwards stability" = right answer for almost the right input. Showed that, in our example of adding a sequence of numbers, backwards stability seems to work where forwards stability failed. Then more rigorously proved that floating-point summation of _n_ numbers is backwards stable.

When quantifying errors, a central concept is a norm, and we saw in our proof of backwards stability of summation that the choice of norm seems important. Defined norms (as in lecture 3 of Trefethen), gave examples of _Lp_ norms (usually _p_ = 1, 2, or ∞), and weighted norms. Started discussing matrix norms, with the example of the Frobenius norm.

**Further reading:** Trefethen, lectures 13, 14, and 3

### Lecture 6 (Sep. 19)

**Handouts:** [pset 1 solutions](pset1sol-f11.pdf) and [pset 2](pset2-f11.pdf) (due Friday Sep 30); for problems 2 and 3 you will need the Matlab files [loopsum.m](loopsum.m) and [div2sum.m](div2sum.m)).

Further discussion of matrix norms. Related the Frobenius norm |A|F to the square root of the sum of eigenvalues of A\*A, which are called the _singular values_ σ2; we will do much more on singular values later, but for now noted that they equal the squared eigenvalues of A if A\*\=A (Hermitian). Also defined the induced matrix norm, and bounded it below by the maximum eigenvalue magnitude of A (if A is square). For the L2 induced norm, related it (without proof for now) to the maximum singular value.

Equivalence of norms. Sketched proof that any two norms are equivalent up to a constant bound, and that this means that stability in one norm implies stability in all norms. The proof involves: (i) showing that all norms are continuous; (ii) showing that we can reduce the problem of showing any norm is equivalent to _L_2 on the unit circle; and (iii) a result from real analysis: a continuous function on a closed/bounded set achieves its maximum and minimum.

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

**Further reading:** Trefethen, lectures 3, 12, 14, 15.

### Lecture 7 (Sep. 23)

Calculated condition number for square root, summation, and matrix-vector multiplication, as well as solving Ax=b, similar to the book. Defined the condition number of a matrix.

Related matrix _L_2 norm to eigenvalues of _B_\=_A_\*_A_. _B_ is obviously Hermitian (_B_\*\=_B_), and with a little more work showed that it is positive semidefinite: _x_\*_B__x_≥0 for any _x_. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian and positive-semidefinite matrices. Hermitian means that the eigenvalues are real, the eigenvectors are orthogonal (or can be chosen orthogonal). Also, a Hermitian matrix must be diagonalizable (I skipped the proof for this; we will prove it later in a more general setting). Positive semidefinite means that the eigenvalues are nonnegative.

Proved that, for a Hermitian matrix B, the **Rayleigh quotient** R(x)=x\*Bx/x\*x is bounded above and below by the largest and smallest eigenvalues of B (the "min–max theorem"). Hence showed that the L2 induced norm of A is the square root of the largest eigenvalue of _B_\=_A_\*_A_. Similarly, showed that the L2 induced norm of A\-1 is equal to the square root of the inverse of the smallest eigenvalue of _A__A_\*.

Understanding norms and condition numbers of matrices therefore reduces to understanding the eigenvalues of _A_\*_A_ and _A__A_\*. However, looking at it this way is unsatisfactory for several reasons. First, we would like to solve one eigenproblem, not two. Second, working with things like _A_\*_A_ explicitly is often bad numerically, because it squares the condition number \[showed that κ(_A_\*_A_)=κ(_A_)2\] and hence exacerbates roundoff errors. Third, we would really like to get some better understanding of _A_ itself. All of these concerns are addressed by the **singular value decomposition** or **SVD**, which we will derive next time.

**Further reading:** Trefethen, lectures 12, 14, 15, 24. See any linear-algebra textbook for a review of eigenvalue problems, especially Hermitian/real-symmetric ones.

### Lecture 8 (Sep. 26)

Explicitly constructed SVD in terms of eigenvectors/eigenvalues of _A_\*_A_ and _A__A_\*. Related to singular values to induced L2 norm and condition number.

Talked a little about low-rank approximations (more on this for HW). Gave ["eigenwalker"](http://www.biomotionlab.ca/Demos/BMLwalker.html) demo.

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 9 (Sep. 28)

**Handouts:** [QR summary](http://persson.berkeley.edu/18.335/lec4handout6pp.pdf), [Gram-Schmidt summary](http://persson.berkeley.edu/18.335/lec5handout6pp.pdf)

Introduced least-squares problems, gave example of polynomial fitting, gave normal equations, and derived them from the condition that the L2 error be minimized.

Discussed solution of normal equations. Discussed condition number of solving normal equations directly, and noted that it squares the condition number—not a good idea if we can avoid it.

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Explained why, if we can do it accurately, this will give a good way to solve least-squares problems.

Gave the simple, but unstable, construction of the Gram-Schmidt algorithm, to find a QR factorization.

**Further reading:** Trefethen, lectures 7, 8.

### Lecture 10 (Sep. 30)

**Handouts:** [Householder summary](http://persson.berkeley.edu/18.335/lec6handout6pp.pdf), [pset 2 solutions](pset2sol-f11.pdf), [pset 3](pset3-f11.pdf) (due next Friday).

Operation count for Gram-Schmidt. Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example, especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt and argued how it (mostly) fixes the problem.

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Started to show how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 11 (Oct. 3)

Finished Householder QR derivation, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

Returned to Gaussian elimination. Reviewed the fact that this givs an A=LU factorization, and that we then solve Ax=b by solving Ly=b (doing the same steps to b that we did to A during elimination to get y) and then solving Ux=y (backsubstitution). Emphasized that you should _almost never compute A\-1_ explicitly. It is just as cheap to keep L and U around, since triangular solves are essentially the same cost as a matrix-vector multiplication. Computing A\-1 is usually a mistake: you can't do anything with A\-1 that you couldn't do with L and U, and you are wasting both computations and accuracy in computing A\-1. A\-1 is useful in abstract manipulations, but whenever you see "x=A\-1b" you should interpret it for computational purposes as solving Ax=b by LU or some other method.

Introduced partial pivoting, and pointed out (omitting bookkeeping details) that this can be expressed as a PA=LU factorization where P is a permutation. Began to discuss backwards stability of LU, and mentioned example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

**Further reading:** Trefethen, lectures 10, 16, 20, 21, 22.

### Lecture 12 (Oct. 5)

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial, mentioned extensions to generalized eigenproblems and SVDs.

Pointed out that an "LU-like" algorithm for eigenproblems, which computes the exact eigenvalues/eigenvectors (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists (or can _ever_ exist) to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Discussed the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

As a result, all eigenproblem methods must be _iterative_: they must consist of improving an initial guess, in successive steps, so that it converges towards the exact result to _any desired accuracy_, but never actually reaches the exact answer in general. A simple example of such a method is Newton's method, which can be applied to iteratively approximate a root of any nonlinear function to any desired accuracy, given a sufficiently good initial guess.

However, finding roots of the characteristic polynomial is generally a terrible way to find eigenvalues. Actually computing the characteristic polynomial coefficients and then finding the roots somehow (Newton's method?) is a disaster, incredibly ill-conditioned: gave the example of Wilkinson's polynomial. If we can compute the characteristic polynomial values implicitly somehow, directly from the determinant, then it is not too bad (if you are looking only for eigenvalues in some known interval, for example), but we haven't learned an efficient way to do that yet. The way LAPACK and Matlab actually compute eigenvalues, the QR method and its descendants, wasn't discovered until 1960.

Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization. Proved (by induction) that every (square) matrix has a Schur factorization, and that for Hermitian matrices the Schur form is real and diagonal.

**Further reading:** Trefethen, lecture 24, 25.

### Lecture 13 (Oct. 7)

**Handouts:** [pset 3 solutions](pset3sol-f11.pdf), [pset 4](pset4-f11.pdf) (due 17 October), [notes on Hessenberg factorization](http://persson.berkeley.edu/18.335/lec14handout6pp.pdf)

The key to making most of the eigensolver algorithms efficient is reducing A to **Hessenberg form**: A=QHQ\* where H is upper triangular plus one nonzero value below each diagonal. Unlike Schur form, Hessenberg factorization _can_ be done exactly in a finite number \[Θ(m3)\] of steps (in exact arithmetic). H and A are similar: they have the same eigenvalues, and the eigenvector are related by Q. And once we reduce to Hessenberg form, all the subsequent operations we might want to do (determinants, LU or QR factorization, etcetera), will be fast. In the case of Hermitian A, showed that H is tridiagonal; in this case, most subsequent operations (even LU and QR factorization) will be Θ(m) (you will show this in HW)!

For example we can actually evaluate det(A-λI)=det(H-λI) in O(m2) time for each value of λ, or O(m) time if A is Hermitian, making e.g. Newton's method on det(H-λI) much more practical. It will also accelerate lots of other methods to find eigenvalues.

Introduced basic idea of Hessenberg factorization by relating it to Householder QR, and in particular showed that Householder reflectors will do the job as long as we allow one nonzero element below the diagonal (see handout).

Discussed power method for biggest-|λ| eigenvector/eigenvalue, and (re-)introduced the Rayleigh quotient to estimate the eigenenvalue. Discussed the convergence rate, and how for Hermitian matrix the eigenvalue estimate has a much smaller error than the eigenvector (the error is squared) due to the fact that the eigenvalue is an extremum.

Discussed how to use the power method to get multiple eigenvalues/vectors of Hermitian matrices by "deflation" (using orthogonality of eigenvectors). Discussed how, in principle, QR factorization of _An_ for large _n_ will give the eigenvectors and eigenvalues in descending order of magnitude, but how this is killed by roundoff errors.

**Further reading:** See Trefethen, lecture 27, and these [2007 notes](http://persson.berkeley.edu/18.335/lec15handout6pp.pdf) on power/inverse/Rayleigh iteration.

### Lecture 14 (Oct. 12)

Unshifted QR method: proved that repeatedly forming A=QR, then replacing A with RQ (as in pset 3) is equivalent to QR factorizing _An_. But since we do this while only multiplying repeatedly by unitary matrices, it is well conditioned and we get the eigenvalues accurately.

To make the QR method faster, we first reduce to Hessenberg form; you will show in pset 4 that this is especially fast when A is Hermitian and the Hessenberg form is tridiagonal. Second, we use shifts.

In particular, the worst case for the QR method, just as for the power method, is when eigenvalues are nearly equal. We can fix this by shifting.

Discussed inverse iteration, shifted inverse iteration, and Rayleigh quotient iteration, and their respective convergence rates. Showed how QR is equivalent to QR factorizing _A\-n_ (inverse iteration), and by a simple trick we can instead incorporate shifts to obtain the shifted QR algorithm.

Briefly mentioned the Wilkinson shift to break ties, rather than just using a shift based on the minimum |λ| estimate.

There are a number of additional tricks to further improve things, the most important of which is probably the Wilkinson shift: estimating μ from a little 2×2 problem from the last _two_ columns to avoid problems in cases e.g. where there are two equal and opposite eigenvalues. Some of these tricks (e.g. the Wilkinson shift) are described in the book, and some are only in specialized publications. If you want the eigenvectors as well as eigenvalues, it turns out to be more efficient to use a more recent "divide and conquer" algorithm, summarized in the book, but where the details are especially tricky and important. However, at this point I don't want to cover more gory details in 18.335. Although it is good to know the general structure of modern algorithms, especially the fact that they look nothing like the characteristic-polynomial algorithm you learn as an undergraduate, as a practical matter you are always just going to call LAPACK if the problem is small enough to solve directly. Matters are different for much larger problems, where the algorithms are not so bulletproof and one might need to get into the guts of the algorithms; this will lead us into the next topic of the course, iterative algorithms for large systems, in subsequent lectures.

**Further reading:** See Trefethen, lectures 28–30, and Per Persson's 2007 notes on QR ([part 1](http://persson.berkeley.edu/18.335/lec15handout6pp.pdf) and [part 2](http://persson.berkeley.edu/18.335/lec16handout6pp.pdf)).

### Lecture 15 (Oct. 14)

Guest lecture by Prof. Edelman: general overview of iterative algorithms.

Started discussing (at a very general level) a new topic: iterative algorithms, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix-vector products but cannot (practically) mess around with the specific entries of _A_.

Emphasized that there are many iterative methods, and that there is no clear "winner" or single bulletproof library that you can use without much thought (unlike LAPACK for dense direct solvers). It is problem-dependent and often requires some trial and error. Then there is the whole topic of preconditioning, which we will discuss more later, which is even more problem-dependent. Briefly listed several common techniques for linear systems (Ax=b) and eigenproblems (Ax=λx or Ax=λBx).

**Further reading:** Trefethen, lecture 31, 32. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html), are useful surveys of iterative methods.

### Lecture 16 (Oct. 17)

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Anv and throws away the previous ones. Introduced Krylov subspaces, and the idea of Krylov subspace methods: find the best solution in the whole subspace spanned by v,Av,...,An-1v.

Derive the Arnoldi algorithm. Unlike the book, I _start_ the derivation by considering it to be modified Gram-Schmidt on (q1,Aq1,Aq2,Aq3,...). In the next lecture, we will re-interpret this as a partial Hessenberg factorization.

Discussed what it means to stop Arnoldi after n<m iterations: finding the "best" solution in the Krylov subspace Kn. Discussed the general principle of Rayleigh-Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method). Also showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace.

Mentioned another iterative method for eigenvalues of Hermitian matrices: turning into a problem of maximizing or minimizing the Rayleigh quotient. In particular, we will see later in the class how this works beautifully with the nonlinear conjugate-gradient algorithm. More generally, we will see that there is often a deep connection between solving linear equations and optimization problems/algorithms—often, the former can be turned into the latter or vice versa.

Lanczos: Arnoldi for Hermitian matrices. Showed that in this case we get a three-term recurrence for the tridiagonal reduction of A. (Derivation somewhat different than in the book. By using A=A\* and the construction of the q vectors, showed explicitly that qj\*v=qj\*Aqn\=0 for j<n-1, and that for j=n gives |v|=βn from the n-th step. Hence Arnoldi reduces to a three-term recurrence, and the Ritz matrix is tridiagonal.)

Noted that Arnoldi requires Θ(mn2) operations and Θ(mn) storage. If we only care about the eigenvalues and not the eigenvectors, Lanczos requires Θ(mn) operations and Θ(m+n) storage. However, this is complicated by rounding problems.

Discussed how rounding problems cause a loss of orthogonality in Lanczos, leading to "ghost" eigenvalues where extremal eigenvalues re-appear. In Arnoldi, we explicitly store and orthogonalize against all qj vectors, but then another problem arises: this becomes more and more expensive as n increases. The solution to this is restarting, discussed in the next lecture.

**Further reading:** Trefethen, lectures 33, 34, 36.

### Lecture 17 (Oct. 19)

**Handouts:** [pset4 solutions](pset4sol-f11.pdf), [pset 5](pset5-f11.pdf) (due next Friday) (see also files [lanczos.m](lanczos.m), [A363.m](A363.m), [SD.m](SD.m), and [A386.m](A386.m)).

A solution to the loss of orthogonality in Lanczos and the growing computational effort in Arnoldi is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors. For k=1 this is easy, but explained why it is nontrivial for k>1: we need to restart in such a way that maintains the Lanczos (or Arnoldi) property that the residual AQn - QnHn is nonzero only in the n-th column (and that column is orthogonal to Qn).

Discussed the implicitly restarted Lanczos method, which does n−k steps of shifted QR to reduce the problem from n to k dimensions. The key thing is that, because the Q matrices in QR on tridiagonal matrices are upper Hessenberg, their product can be shown to preserve the Lanczos property of the residual for the first k columns.

**Further reading:** See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 18 (Oct. 21)

New topic: iterative methods for Ax=b linear equations. Started discussing the GMRES method, which is the direct analogue of Arnoldi for linear equations.

Derived the GMRES method as in lecture 35 of Trefethen, as residual minimization in the Krylov space using Arnoldi's orthonormal basis Qn. Like Arnoldi, this is too expensive to run for many steps without restarting. Unlike Arnoldi, there isn't a clear solution (yet) for a good restarting scheme, and in particular there are problems where restarted GMRES fails to converge; in that case, you can try restarting after a different number of steps, try a different algorithm, or find a better preconditioner (a topic for later lectures).

Just as Arnoldi reduces to Lanczos for Hermitian matrices, GMRES reduces to MINRES, which is a cheap recurrence with no requirement for restarting. Briefly discussed MINRES, the fact that it converges but has worse rounding errors.

Began discussing gradient-based iterative solvers for Ax=b linear systems, starting with the case where A is Hermitian positive-definite. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=x\*Ax-x\*b-b\*x. Then, we perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method. Discussed successive line minimization of f(x), and in particular the steepest-descent choice of d=b-Ax at each step. Explained how this leads to "zig-zag" convergence by a simple two-dimensional example, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

**Further reading:** Trefethen, lectures 35 and 39. [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES). Regarding convergence problems with GMRES, see this 2002 presentation by Mark Embree on [Restarted GMRES dynamics](http://www.caam.rice.edu/~embree/householder.pdf). On MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Lecture 19 (Oct. 24)

Derived the conjugate-gradient method, by explicitly requiring that the n-th step minimize over the whole Krylov subspace (the span of the previous search directions). This gives rise to an orthogonality ("conjugacy", orthogonality through A) condition on the search directions, and can be enforced with Gram-Schmidt on the gradient directions. Then we show that a Lanczos-like miracle occurs: most of the Gram-Schmidt inner products are zero, and we only need to keep the previous search direction.

Discussed convergence of conjugate gradient: useless results like "exact" convergence in m steps (not including roundoff), pessimistic bounds saying that the number of steps goes like the square root of the condition number, and the possibility of superlinear convergence for clustered eigenvalues.

Started discussing the polynomial viewpoint in the textbook, which views conjugate gradient (and other algorithms) as trying to find a polynomial that is as small as possible at the eigenvalues. This gives a nice way to think about how fast iterative methods converge and the impact of the eigenvalue spectrum.

**Further reading:** See the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk. See the textbook, lecture 38, for the polynomial viewpoint.

### Lecture 20 (Oct. 26)

Discussed the convergence rate of conjugate gradient and GMRES in terms of polynomial approximations. Following the book closely, showed that the relative errors (in the solution for CG or the residual for GMRES) can be bounded minimizing the value p(λ) of a polynomial p(z) evaluated at the eigenvalues, where p(0)=1 and p has degree _n_ after the _n_\-th iteration. (There is also a factor of the condition number of the eigenvector matrix in GMRES, so it is favorable for the eigenvectors to be near-orthogonal, i.e for the matrix to be near-[normal](http://en.wikipedia.org/wiki/Normal_matrix).)

Using this, we can see that the most favorable situation occurs when the eigenvalues are grouped into a small cluster, or perhaps a few small clusters, since we can then make p(λ) small with a low-degree polynomial that concentrates a few roots in each cluster. This meanst that CG and GMRES will achieve small errors in only a few iterations. Morever we can see that a _few_ outlying eigenvalues aren't a problem, since p(z) will quickly attain roots there and effectively eliminate those eigenvalues from the error—this quantifies the intuition that Krylov methods "improve the condition number" of the matrix as the iteration proceeds, which is why the condition-number bounds on the error are often pessimistic. Conversely, the worst case will be when the eigenvalues are all spread out uniformly in some sense. Following examples 35.1 and 35.2 in the book, you can actually have two matrices with very similar small condition numbers but very different GMRES convergence rates, if in one case the eigenvalues are clustered and in the other case the eigenvalues are spread out in a circle around the origin (i.e. with clustered magnitudes |λ| but different phase angles).

Contrasted with Arnoldi/Lanczos. Stated without proof (see the book for the proof) that Arnoldi also minimizes a polynomial at the eigenvalues—and the roots of this polynomial are the Ritz values—but that in that case the polynomials have the zn coefficient equal to 1, not the 0-th coefficient. This is similar in some ways, but different in others. For example, for Arnoldi, clusters of eigenvalues are _bad_ if you are trying to resolve individual eigenvalues in the cluster: p(z) will tend to put only one or a few roots in each cluster. On the other hand, this space of polynomials is shift-invariant, so that p(z+μ) is in the same space of polynomials. That means that the convergence of Arnoldi for A and A+μI are identical. This is _not_ true for CG or GMRES \[since p(0)=0 does not imply p(0+μ)=0\], and hence (not surprisingly) solving (A+μI)x=b is very different from solving Ax=b.

In many practical cases, unfortunately, the eigenvalues of A are _not_ mostly clustered, so convergence of CG or GMRES may be slow. The solution to this problem is **preconditioning**: finding an easy-to-invert M such that M\-1A has clustered eigenvalues (and is not too far from normal).

**Further reading:** Trefethen, lectures 34, 35, 38, 40. The convergence of GMRES for very non-normal matrices is a complicated subject; see e.g. [this paper on GMRES for defective matrices](http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.48.1733) or [this paper surveying different convergence estimates](http://eprints.maths.ox.ac.uk/1290/).

### Lecture 21 (Oct. 28)

**Preconditioners**

Discussed preconditioning: finding an easy-to-invert M such that M\-1A has clustered eigenvalues. Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of M\-1A is not actually a problem as long as M is Hermitian positive-definite).

Via a simple analysis of the discretized Poisson's equation, then generalized to any discretized grid/mesh with nearest-neighbor interactions, argued that the number of steps in unpreconditioned CG is (at least) proportional to the diameter of the grid for sparse matrices of this type, and that this exactly corresponds to the square root of the condition number in the Poisson case. Hence, an ideal preconditioner really needs some kind of long-range interaction.

Brief summary of some preconditioning ideas: multigrid, incomplete LU/Cholesky, Jacobi/block-Jacobi. (Since Jacobi preconditioners only have short-range interactions, they tend not to work well for matrices that come from finite-difference/finite-element discretizations on grids, but they can work well for diagonally dominant matrices that arise in spectral and integral-equation methods.)

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html), Trefethen chapter 40, and e.g. _[Matrix Preconditioning Techniques and Applications](http://books.google.com/books?id=d9UdanCqJ1QC)_ by Ke Chen (Cambridge Univ. Press, 2005).

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html).

### Lecture 22 (Oct. 31)

**Handouts:** [summary of options for solving linear systems](solver-options.pdf), [notes on sparse-direct solvers](http://persson.berkeley.edu/18.335/lec20handout6pp.pdf) from Fall 2007.

**Biconjugate gradient:** As an alternative to GMRES for non-Hermitian problems, considered the biCG algorithm. Derived it as in the van der Vorst notes below: as PCG on the Hermitian-indefinite matrix B=\[0,A;A\*,0\] with the "preconditioner" \[0,I;I,0\] (in the unpreconditioned case). Because this is Hermitian, there is still a conjugacy condition and it is still a Krylov method. Because it is indefinite, we are finding a saddle point and not a minimum of a quadratic, and _breakdown_ can occur if one of the denominators (e.g. d\*Bd) becomes zero. (This is the same as algorithm 39.1 in Trefethen, but derived very differently.) Because of this, you should almost never use the plain biCG algorithm. However, the biCG idea was the starting point for several "stabilized" refinements, culminating in biCGSTAB(L) that try to avoid breakdown by combining biCG with elements of GMRES. Another algorithm worth trying is the QMR algorithm.

**Sparse-direct solvers:** For many problems, there is an intermediate between the dense Θ(m3) solvers of LAPACK and iterative algorithms: for a sparse matrix A, we can sometimes perform an LU or Cholesky factorization while maintaining sparsity, storing and computing only nonzero entries for vast savings in storage and work. In particular, did a Matlab demo, a few experiments with a simple test case: the "discrete Laplacian" center-difference matrix on uniform grids that we've played with previously in 18.335. In 1d, this matrix is tridiagonal and LU/Cholesky factorization produces a bidiagonal matrix: Θ(m) storage and work! For a 2d grid, there are 4 off-diagonal elements, and showed how elimination introduces Θ(√m) nonzero entries in each column, or Θ(m3/2) nonzero entries in total. This is still not too bad, but we can do better. First, showed that this "fill-in" of the sparsity depends strongly on the ordering of the degrees of freedom: as an experiment, tried a _random_ reordering, and found that we obtain Θ(m2) nonzero entries (~10% nonzero). Alternatively, one can find re-orderings that greatly reduce the fill-in. One key observation is that the fill-in only depends on the pattern of the matrix, which can be interpreted as a [graph](http://en.wikipedia.org/wiki/Graph_%28mathematics%29): m vertices, and edges for the nonzero entries of A (an [adjacency matrix](http://en.wikipedia.org/wiki/Adjacency_matrix) of the graph), and sparse-direct algorithms are closely related to graph-theory problems. For our simple 2d Laplacian, the graph is just the picture of the grid connecting the points. One simple algorithm is the [nested dissection algorithm](http://en.wikipedia.org/wiki/Nested_dissection): recursively find a separator of the graph, then re-order the vertices to put the separator last. This reorders the matrix into a mostly block-diagonal form, with large blocks of zeros that are preserved by elimination, and if we do this recursively we greatly reduce the fill-in. Showed some experiments to illustrate the fill-in structure, for our 2d grid where separators are obvious; for more general matrices finding separators is a hard and important problem in graph theory.

Concluded with some rules of thumb (see handout) about which type of solvers to use: LAPACK for small matrices (< 1000×1000), sparse-direct for intermediate-size sparse cases, and iterative methods for the largest problems or problems with a fast matrix\*vector but no sparsity. One important point is that sparse-direct algorithms scale much better for sparse matrices that come from discretization of 2d PDEs than 3d PDEs. In general, some experimentation is required to find the best technique for a given problem, so software like Matlab or the Petsc library is extremely helpful in providing a quick way to explore many algorithms.

**Further reading:** A very nice overview of iterative methods for non-Hermitian problems can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES). **Sparse-direct methods:** A [survey of nested-dissection algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.58.9722) (Khaira, 1992). List of [sparse-direct solver software](http://www.cs.utk.edu/~dongarra/etemplates/node388.html) by Dongarra and [another list by Davis](http://www.cise.ufl.edu/research/sparse/codes/). [Notes on multifrontal sparse-direct methods](http://www.cse.illinois.edu/courses/cs598mh/gupta.ps) by M. Gupta (UIUC, 1999). The book _[Direct Methods for Sparse Linear Systems](http://books.google.com/books?id=TvwiyF8vy3EC&lpg=PR1&ots=odauEC2c4k&dq=direct%20methods%20for%20sparse%20davis&pg=PR1#v=onepage&q&f=false)_ by Davis is a useful reference. Outside of Matlab, a popular library to help you solve spare problems is [Petsc](http://www.mcs.anl.gov/petsc/petsc-as/).

### Midterm (Nov. 2)

[Midterm exam](midterm-f11.pdf) and [solutions](midtermsol-f11.pdf).

### Lecture 23 (Nov. 4)

First, finished some discussion of sparse-direct solvers from the last lecture. In particular, derived the space and time complexity of the nested-dissection algorithm in 1d/2d/3d, at least for regular grids like our Laplacian example, to obtain the complexities shown in the last page of the [notes on sparse-direct solvers](http://persson.berkeley.edu/18.335/lec20handout6pp.pdf)2007 notes

Several of the iterative algorithms so far have worked, conceptually at least, by turning the original linear-algebra problem into a minimization problem. It is natural to ask, then, whether we can use similar ideas to solve more general **optimization problems**, which will be the next major topic in 18.335.

A simple algorithm, to start with: successive line minimization (for unconstrained local optimization with continuous design parameters), which leads us directly to nonlinear steepest-descent and thence to nonlinear conjugate-gradient algorithms. The key point being that, near a local minimum of a smooth function, the objective is typically roughly quadratic (via Taylor expansion), and when that happens CG greatly accelerates convergence. (Mentioned Fletcher–Powell heuristic to help "reset" the search direction to the gradient if we are far from the minimum and convergence has stalled; see the Hager survey below for many more.)

Outlined application of nonlinear CG to Hermitian eigenproblems by minimizing the Rayleigh quotient (this is convex, and furthermore we can use the Ritz vectors to shortcut both the conjugacy and the line minimization steps).

**Further reading:** For CG for eigenproblems, see the _Templates_ book's section on [preconditioned CG methods for eigenproblems](http://www.cs.utk.edu/~dongarra/etemplates/node418.html). See this [survey by Hager and Zhang (2005)](https://www.math.lsu.edu/~hozhang/papers/cgsurvey.pdf) of variants of nonlinear CG, especially variations on how the search direction is updated.

### Lecture 24 (Nov. 7)

**Handouts:** [overview of optimization](optimization-handout.pdf) ([full-page slides](optimization.pdf))

Finished discussion of nonlinear CG for Hermitian eigenproblems. Discussed preconditioning nonlinear CG from the perspective of an approximate Newton step.

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

### Lecture 25 (Nov. 9)

**Handouts:** [notes on adjoint methods](http://math.mit.edu/~stevenj/18.336/adjoint.pdf) to compute gradients

Introduction to **adjoint** methods and the remarkable fact that one can compute the gradient of a complicated function with about the same number of additional operations as computing the function _once_.

### Lecture 26 (Nov. 14)

**Handouts:** [notes on adjoint methods for recurrence relations](http://math.mit.edu/~stevenj/18.336/recurrence2.pdf)

Adjoint methods for recurrence relations, following notes.

Started discussing some general concepts in local optimization. **Global convergence** means convergence to a _local_ optimum from any _feasible_ starting point; explained why finding the feasible region from an _infeasible_ starting point is in general as hard as global optimization. A typical **trust region** approach is to _locally approximate_ the objective and constraint functions by some _simple functions_ that are easy to optimize, optimize them within some localized trust region around a current point **x** to obtain a candidate step **y**, and then either take the step (e.g. if **y** is an improvement) and/or update the approximations and trust region (e.g. if **y** was not an improvement or the approximation and exact functions differed greatly). There are many, many algorithms that follow this general outline, but they differ greatly in what approximations they use (e.g. linear, quadratic, ...), what trust region they use, and what methods they use to update the trust region and to evaluate candidate steps. Often, the approximate functions are _convex_ so that convex-optimization methods can be used to solve the _trust-region subproblems_.