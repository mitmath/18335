#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Fall 2010.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm (2-105). **Office Hours:** Thursday 4:30–5:30 (2-388).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of Matlab (little or no prior experience required; you will learn as you go).

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). Ordinary differential equations ([18.03](http://math.mit.edu/18.03/) or 18.034) are another prerequisite (not so much as specific material, but more as experience with post-freshman calculus).

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu:8888/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: The [course notes from 18.335 in previous terms](http://www-math.mit.edu/~persson/18.335/), by Per-Olaf Persson, are available online. Although these provide a useful reference, we _will not cover the material in the same sequence_, nor (despite a large overlap) will the material covered be exactly the same. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 33% problem sets (about six). 33% **mid-term exam** (Wed., **Nov. 3 in 50-340 from 2-4pm or from 3-5pm**), 34% **final project** (half-page proposal due Friday, October 29, project due Wed., **Dec. 8**).

**TA:** [Yee Lok Wong](http://math.mit.edu/people/profile.php?pid=297)

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

### Lecture 1 (Sep 9)

**Handouts:** a printout of this webpage (i.e., the syllabus).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

Some discussion of how large matrices arise in practice, and gave a simple example of the discrete Laplacian matrix arising from a discretized version of Poisson's equation. Noted that large matrices in practice often have special structure, e.g. sparseness and symmetry, and it is very important to exploit this structure to make their solution practical.

Jumped right into a canonical dense-matrix direct-solver algorithm that we will use to illustrate some performance and accuracy concerns: Gaussian elimination. Briefly reviewed the basic algorithm, and used Trefethen's "graphical" trick to quickly estimate the number of additions+multiplications as roughly 2_m_3/3 for _m_×_m_ problems. Regarding accuracy, one key question is how roundoff errors propagate in this algorithm, which turns out to be a very difficult and partially unsolved problem discussed in Trefethen chapter 20; another question is what to do with pivots that are nearly zero, which treated naively lead to roundoff disasters and lead to the solution of partial pivoting. We will return to both of these topics later in the course. Regarding performance, there are three key questions that we will return to in lecture 2: (0) how expensive is this in practice, (1) is counting arithmetic operations enough to predict performance, and (2) can one do better than Gaussian elimination?

The classic way to analyze performance is operation counts; from last time that flop count (real additions+multiplications) for Gaussian elimination is 2_m_3/3 for _m_×_m_ problems. Show that this means 1000×1000 problems are now routine, but that 106×106 or larger problems (as commonly arise for PDEs) will require us to take advantage of some special structure.

**Further reading:** Trefethen, chapter 20; also it would be good to review chapters 1–3 if your linear algebra is rusty (these chapters are [available online even for non-MIT people](http://web.comlab.ox.ac.uk/people/Nick.Trefethen/text.html)). **If you do not have the prerequisite linear-algebra experience for this course** (e.g. if you don't immediately know what an LU factorization or singular-value decomposition are), you should start reviewing a basic linear algebra book _now_, e.g. chapters 1–6 of [the 18.06 textbook _Introduction to Linear Algebra_](http://math.mit.edu/linearalgebra/) by Strang; we won't use much of this material in the first week or two, so you have a little time to catch up.

### Lecture 2 (Sep. 10)

**Handouts:** performance experiments with matrix multiplication ([one-page](matmuls-handout.pdf) or [full-size](matmuls.pdf) versions); [ideal-cache terminology](ideal-cache.pdf); [pset 1](pset1-f10.pdf) (due Monday, Sep 20) (attachments: [matmul\_bycolumn.m](matmul_bycolumn.m), [benchmul.m](benchmul.m));

Counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This leads us to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(_n_3/√_Z_) cache complexity.

**Further reading:** Wikipedia has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/). [Cache-oblivious algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911), describing ideal cache model and analysis for various algorithms, by Frigo, Leiserson, Prokop, and Ramachandran (1999). [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](http://www.mathworks.com/company/newsletters/news_notes/clevescorner/winter2000.cleve.html).

### Lecture 3 (Sep. 13)

**Handouts:** experiments with cache-oblivious matrix-multiplication ([handout](oblivious-matmul-handout.pdf) or [full-size slides](oblivious-matmul.pdf))

Discussed some practical difficulties of the blocked matrix multiplication: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS). Briefly explained ATLAS's self-optimizing code-generation approach, producing zillions of optimized little blocks for different special cases.

Introduced the concept of optimal cache-oblivious algorithms. Discussed cache-oblivious matrix multiplication in theory and in practice (see handout and Frigo et. al paper above).

**Further reading:** Frigo et al. paper from previous lecture. ATLAS web page above. [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007). Trefethen, lecture 20.

### Lecture 4 (Sep. 15)

**Handouts:** [notes on floating-point](http://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2006/lecture-notes/lec8handout6pp.pdf) (18.335 Fall 2006); page 25 of Kahan's presentation (below).

Discussion of Strassen algorithm and other matrix-multiply algorithms that do betterthan O(_m_3).

New topic: **accuracy and stability**. Start with LU factorization, and give example where small roundoff error can lead to huge mistakes. The next few lectures will deal with, in reverse order (iii) how to improve LU (pivoting); (ii) how to define/characterize accuracy and stability of algorithms; (i) how to describe roundoff errors and computer arithmetic.

Overview of floating-point representations, focusing on the IEEE 754 standard.

**Further reading:** [Using recursion to boost ATLAS's performance](http://www.springerlink.com/content/g146080l0l0xv307/) (D'Alberto and Nicolau, 2008). [Strassen algorithm](http://en.wikipedia.org/wiki/Strassen_algorithm) on Wikipedia (beware the usual nonsense of equating arithmetic counts with speed). [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): see discussion of floating-point myths. Trefethen, lectures 20 and 13.

### Lecture 5 (Sep. 17)

Floating-point arithmetic, continued. The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10−16 for double precision). Moreover the IEEE standard guarantees that the result of _x_♦_y_ where ♦ is addition, subtraction, multiplication, or division, is equivalent to computing fl(_x_♦_y_), i.e. computing it in infinite precision and then rounding (this is called "exact rounding" or "correct rounding").

Briefly discussed some myths about floating point (from the Kahan handout, last time), especially the pernicious myth that all floating point arithmetic is a little bit "random", and that integer arithmetic is somehow more accurate. Discussed decimal versus binary floating point, and contrasted with fixed-point arithmetic.

Gave the obvious definition of accuracy, or more technically stability: "forwards stability" = almost the right answer for the right input. Showed that this is often too strong; e.g. adding a sequence of numbers is not forwards stable.

More generally, we apply a weaker condition: "stability" = almost the right answer for almost the right input. (Gave the technical version of this, from the book.) Forwards stability implies stability but not the converse.

Often, it is sufficient to prove "backwards stability" = right answer for almost the right input. Showed that, in our example of adding a sequence of numbers, backwards stability seems to work where forwards stability failed. (Will give a rigorous proof next time.)

**Further reading:** Trefethen, lectures 13 and 14.

### Lecture 6 (Sep. 20)

**Handouts:** [pset 1 solutions](pset1sol-f10.pdf), [pset 2](pset2-f10.pdf) (due Friday, October 2; for problems 2 and 3 you will need the Matlab files [loopsum.m](loopsum.m) and [div2sum.m](div2sum.m)).

Reviewed stability definition, and covered the special (stronger) condition of backwards stability, which is true of many algorithms and often not too hard to prove. Showed that floating-point summation of _n_ numbers is backwards stable.

When quantifying errors, a central concept is a norm. Defined norms (as in lecture 3 of Trefethen), gave examples of _Lp_ norms (usually _p_ = 1, 2, or ∞),

More norms: weighted norms, Frobenius norm, and induced matrix norms. Bounded induced square-matrix norm in terms of matrix eigenvalues (we will give a more precise bound later in terms of SVDs). Showed that unitary matrices preserve _L_2 norms and induced norms, and also the _L_2 Frobenius matrix norm.

Equivalence of norms. Sketched proof that any two norms are equivalent up to a constant bound, and that this means that stability in one norm implies stability in all norms. The proof involves: (i) showing that all norms are continuous; (ii) showing that we can reduce the problem of showing any norm is equivalent to _L_2 on the unit circle; and (iii) a result from real analysis: a continuous function on a closed/bounded set achieves its maximum and minimum.

**Further reading:** Trefethen, lectures 14, 15, and 3.

### Lecture 7 (Sep. 22)

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

Calculated condition number for square root, summation, and matrix-vector multiplication, as well as solving Ax=b, similar to the book. Defined the condition number of a matrix.

Related matrix _L_2 norm to eigenvalues of _B_\=_A_\*_A_. _B_ is obviously Hermitian (_B_\*\=_B_), and with a little more work showed that it is positive semidefinite: _x_\*_B__x_≥0 for any _x_. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian and positive-semidefinite matrices. Hermitian means that the eigenvalues are real, the eigenvectors are orthogonal (or can be chosen orthogonal). Also, a Hermitian matrix must be diagonalizable (I skipped the proof for this; we will prove it later in a more general setting). Positive semidefinite means that the eigenvalues are nonnegative.

**Further reading:** Trefethen, lectures 12, 14, 15, 24. See any linear-algebra textbook for a review of eigenvalue problems, especially Hermitian/real-symmetric ones.

### Lecture 8 (Sep. 24)

Explicitly constructed SVD in terms of eigenvectors/eigenvalues of _A_\*_A_ and _A__A_\*. Related to singular values to induced L2 norm and condition number.

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 9 (Sep. 27)

Introduced least-squares problems, gave example of polynomial fitting, gave normal equations, and derived them from the condition that the L2 error be minimized.

Discussed solution of normal equations. Discussed condition number of solving normal equations directly, and noted that it squares the condition number—not a good idea if we can avoid it.

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Explained why, if we can do it accurately, this will give a good way to solve least-squares problems.

Gave the simple, but unstable, construction of the Gram-Schmidt algorithm, to find a QR factorization.

**Further reading:** Trefethen, lectures 7, 8.

### Lecture 10 (Sep. 29)

**Handouts:** [Gram-Schmidt notes from 2007](http://www-math.mit.edu/~persson/18.335/lec5handout6pp.pdf), [Householder notes from 2007](http://www-math.mit.edu/~persson/18.335/lec6handout6pp.pdf)

Operation count for Gram-Schmidt. Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example, especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt and argued how it (mostly) fixes the problem.

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Showed how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 11 (1 October)

**Handouts:** [pset 2 solutions](pset2sol-f10.pdf), [pset 3](pset3-f10.pdf) (due Wed. 13 Oct.)

Considered Householder algorithm in more detail, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

Returned to Gaussian elimination. Introduced partial pivoting, and pointed out (omitting bookkeeping details) that this can be expressed as a PA=LU factorization where P is a permutation. Discussed backwards stability of LU, and gave example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

Brief discussion of Cholesky factorization, and more generally of the fact that one can often take advantage of special structure if it is present in your matrix.

**Further reading:** Trefethen, lecture 10, 16, 21, 22, 23.

### Lecture 12 (4 October)

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial, mentioned extensions to generalized eigenproblems and SVDs.

Pointed out that an "LU-like" algorithm for eigenproblems, which computes the exact eigenvalues/eigenvectors (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists (or can _ever_ exist) to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Discussed the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

As a result, all eigenproblem methods must be _iterative_: they must consist of improving an initial guess, in successive steps, so that it converges towards the exact result to _any desired accuracy_, but never actually reaches the exact answer in general. A simple example of such a method is Newton's method, which can be applied to iteratively approximate a root of any nonlinear function to any desired accuracy, given a sufficiently good initial guess.

However, finding roots of the characteristic polynomial is generally a terrible way to find eigenvalues. Actually computing the characteristic polynomial coefficients and then finding the roots somehow (Newton's method?) is a disaster, incredibly ill-conditioned: gave the example of Wilkinson's polynomial. If we can compute the characteristic polynomial values implicitly somehow, directly from the determinant, then it is not too bad (if you are looking only for eigenvalues in some known interval, for example), but we haven't learned an efficient way to do that yet. The way LAPACK and Matlab actually computes eigenvalues, the QR method and its descendants, wasn't discovered until 1960.

Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization. Proved (by induction) that every (square) matrix has a Schur factorization, and that for Hermitian matrices the Schur form is real and diagonal.

**Further reading:** Trefethen, lecture 24, 25.

### Lecture 13 (6 October)

**Handout:** [Hessenberg handout from 2007](http://www-math.mit.edu/~persson/18.335/lec14handout6pp.pdf)

The key to making most of the eigensolver algorithms efficient is reducing A to **Hessenberg form**: A=QHQ\* where H is upper triangular plus one nonzero value below each diagonal. Unlike Schur form, Hessenberg factorization _can_ be done exactly in a finite number \[Θ(m3)\] of steps (in exact arithmetic). H and A are similar: they have the same eigenvalues, and the eigenvector are related by Q. And once we reduce to Hessenberg form, all the subsequent operations we might want to do (determinants, LU or QR factorization, etcetera), will be fast. In the case of Hermitian A, showed that H is tridiagonal; in this case, most subsequent operations (even LU and QR factorization) will be Θ(m) (you will show this in HW)!

For example we can actually evaluate det(A-λI)=det(H-λI) in O(m2) time for each value of λ, or O(m) time if A is Hermitian, making e.g. Newton's method on det(H-λI) much more practical. It will also accelerate lots of other methods to find eigenvalues.

Introduced basic idea of Hessenberg factorization by relating it to Householder QR, and in particular showed that Householder reflectors will do the job as long as we allow one nonzero element below the diagonal (see handout).

Discussed power method for biggest-|λ| eigenvector/eigenvalue, and (re-)introduced the Rayleigh quotient to estimate the eigenenvalue. Discussed the convergence rate, and how for Hermitian matrix the eigenvalue estimate has a much smaller error than the eigenvector (the error is squared) due to the fact that the eigenvalue is an extremum. Discussed inverse iteration, shifted inverse iteration, and Rayleigh quotient iteration, and their respective convergence rates.

**Further reading:** See Trefethen, lecture 27, and these [2007 notes](http://www-math.mit.edu/~persson/18.335/lec15handout6pp.pdf) on power/inverse/Rayleigh iteration.

### Lecture 14 (8 October)

Discussed how to use the power method to get multiple eigenvalues/vectors of Hermitian matrices by "deflation" (using orthogonality of eigenvectors). Discussed how, in principle, QR factorization of _An_ for large _n_ will give the eigenvectors and eigenvalues in descending order of magnitude, but how this is killed by roundoff errors.

Unshifted QR method: proved that repeatedly forming A=QR, then replacing A with RQ (as in pset 3) is equivalent to QR factorizing _An_. But since we do this while only multiplying repeatedly by unitary matrices, it is well conditioned and we get the eigenvalues accurately.

To make the QR method faster, we first reduce to Hessenberg form; you will show in pset 4 that this is especially fast when A is Hermitian and the Hessenberg form is tridiagonal. Second, we use shifts.

In particular, the worst case for the QR method is when all of the eigenvalues are nearly equal, so that |λ1/λm| is nearly 1. In this case, our previous analysis shows that a large number of iterations may be required to discriminate between the eigenvectors. However, if we instead do QR on A-μI where μ is approximately λm, then |(λ1\-μ)/(λm\-μ)| will be large and the algorithm will converge quickly. μ, in turn, can be estimated from the Rayleigh quotient of the last column of the current An matrix, since that column should be approximately the eigenvector qm; as the algorithm progresses, this will approach λm and the algorithm will converge more and more quickly. This insight leads to the _shifted QR algorithm_.

There are a number of additional tricks to further improve things, the most important of which is probably the Wilkinson shift: estimating μ from a little 2×2 problem from the last _two_ columns to avoid problems in cases e.g. where there are two equal and opposite eigenvalues. Some of these tricks (e.g. the Wilkinson shift) are described in the book, and some are only in specialized publications. If you want the eigenvectors as well as eigenvalues, it turns out to be more efficient to use a more recent "divide and conquer" algorithm, summarized in the book, but where the details are especially tricky and important. However, at this point I don't want to cover more gory details in 18.335. Although it is good to know the general structure of modern algorithms, especially the fact that they look nothing like the characteristic-polynomial algorithm you learn as an undergraduate, as a practical matter you are always just going to call LAPACK if the problem is small enough to solve directly. Matters are different for much larger problems, where the algorithms are not so bulletproof and one might need to get into the guts of the algorithms; this will lead us into the next topic of the course, iterative algorithms for large systems, in subsequent lectures.

**Further reading:** See Trefethen, lectures 28–30, and Per Persson's 2007 notes on the QR algorithm, [part I](http://www-math.mit.edu/~persson/18.335/lec15handout6pp.pdf) and [part II](http://www-math.mit.edu/~persson/18.335/lec16handout6pp.pdf), as well as [notes on other eigenvalue algorithms](http://www-math.mit.edu/~persson/18.335/lec17handout6pp.pdf).

### Lecture 15 (13 October)

**Handouts:** [pset 3 solutions](pset3sol-f10.pdf), [pset 4](pset4-f10.pdf) (due 22 October).

Briefly discussed Golub–Kahn bidiagonalization method for SVD, just to get the general flavor. At this point, however, we are mostly through with details of dense linear-algebra techniques: the important thing is to grasp the fundamental ideas rather than zillions of little details, since in practice you're just going to use LAPACK anyway.

Started discussing (at a very general level) a new topic: iterative algorithms, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix-vector products but cannot (practically) mess around with the specific entries of _A_.

Discussed iterative methods in general, briefly mentioned sparse-direct methods (which we will come back to later), the sources of special structure (e.g. sparsity) that allow you to have rapid matrix-vector products with large matrices.

Iterative methods. Discussed the common circumstances where _Ax_ matrix-vector products are fast (sparse matrices, spectral methods with FFTs, integral-equations with fast multipole etc.). General idea of starting with a guess for the solution (e.g. a random vector) and iteratively improving..

Emphasized that there are many iterative methods, and that there is no clear "winner" or single bulletproof library that you can use without much thought (unlike LAPACK for dense direct solvers). It is problem-dependent and often requires some trial and error. Then there is the whole topic of preconditioning, which we will discuss more later, which is even more problem-dependent. Briefly listed several common techniques for linear systems (Ax=b) and eigenproblems (Ax=λx or Ax=λBx).

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Anv and throws away the previous ones. Introduced Krylov subspaces, and the idea of Krylov subspace methods: find the best solution in the whole subspace spanned by v,Av,...,An-1v.

**Further reading:** Trefethen, lecture 31, 32. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html), are useful surveys of iterative methods.

### Lecture 16 (15 October)

Derive the Arnoldi algorithm. Unlike the book, I _start_ the derivation by considering it to be modified Gram-Schmidt on (q1,Aq1,Aq2,Aq3,...). In the next lecture, we will re-interpret this as a partial Hessenberg factorization.

Discussed what it means to stop Arnoldi after n<m iterations: finding the "best" solution in the Krylov subspace Kn. Discussed the general principle of Rayleigh-Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method). Also showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace.

Mentioned another iterative method for eigenvalues of Hermitian matrices: turning into a problem of maximizing or minimizing the Rayleigh quotient. In particular, we will see later in the class how this works beautifully with the nonlinear conjugate-gradient algorithm. More generally, we will see that there is often a deep connection between solving linear equations and optimization problems/algorithms—often, the former can be turned into the latter or vice versa.

Lanczos: Arnoldi for Hermitian matrices. Showed that in this case we get a three-term recurrence for the tridiagonal reduction of A. (Derivation somewhat different than in the book. By using A=A\* and the construction of the q vectors, showed explicitly that qj\*v=qj\*Aqn\=0 for j<n-1, and that for j=n gives |v|=βn from the n-th step. Hence Arnoldi reduces to a three-term recurrence, and the Ritz matrix is tridiagonal.)

Noted that Arnoldi requires Θ(mn2) operations and Θ(mn) storage. If we only care about the eigenvalues and not the eigenvectors, Lanczos requires Θ(mn) operations and Θ(m+n) storage. However, this is complicated by rounding problems, as discussed in the next lecture.

**Further reading:** Trefethen, lectures 33, 34, 36.

### Lecture 17 (18 October)

Re-interpret Arnoldi and Lanczos as partial Hessenberg factorization. How that they correspond to AQn\=QnHn+hn+1,nqn+1en\* for Arnoldi and AQn\=QnTn+hn+1,nqn+1en\* for Lanczos, where Hn and Tn are upper Hessenberg and tridiagonal matrices respectively and en is the unit vector in the n-th direction.

Discussed how rounding problems cause a loss of orthogonality in Lanczos, leading to "ghost" eigenvalues where extremal eigenvalues re-appear. In Arnoldi, we explicitly store and orthogonalize against all qj vectors, but then another problem arises: this becomes more and more expensive as n increases. The solution to this is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors. For k=1 this is easy, but explained why it is nontrivial for k>1: we need to restart in such a way that maintains the Lanczos (or Arnoldi) property that the residual AQn - QnHn is nonzero only in the n-th column (and that column is orthogonal to Qn).

Discussed the implicitly restarted Lanczos method, which does n-k steps of shifted QR to reduce the problem from n to k dimensions. The key thing is that, because the Q matrices in QR on tridiagonal matrices are upper Hessenberg, their product can be shown to preserve the Lanczos property of the residual for the first k columns.

**Further reading:** See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 18 (20 October)

New topic: iterative methods for Ax=b linear equations. Started discussing the GMRES method, which is the direct analogue of Arnoldi for linear equations.

Derived the GMRES method as in lecture 35 of Trefethen, as residual minimization in the Krylov space using Arnoldi's orthonormal basis Qn. Like Arnoldi, this is too expensive to run for many steps without restarting. Unlike Arnoldi, there isn't a clear solution (yet) for a good restarting scheme, and in particular there are problems where restarted GMRES fails to converge; in that case, you can try restarting after a different number of steps, try a different algorithm, or find a better preconditioner (a topic for later lectures).

Just as Arnoldi reduces to Lanczos for Hermitian matrices, GMRES reduces to MINRES, which is a cheap recurrence with no requirement for restarting. Briefly discussed MINRES, the fact that it converges but has worse rounding errors.

Began discussing gradient-based iterative solvers for Ax=b linear systems, starting with the case where A is Hermitian positive-definite. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=x\*Ax-x\*b-b\*x. Then, we perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method.

**Further reading:** Trefethen, lectures 35 and 39. [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES). Regarding convergence problems with GMRES, see this 2002 presentation by Mark Embree on [Restarted GMRES dynamics](http://www.caam.rice.edu/~embree/householder.pdf). On MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Lecture 19 (22 October)

**Handouts:** [pset 4 solutions](pset4sol-f10.pdf); pages 8 and 20 of the Shewchuk notes, below

Quick review of the "gradient": for a real-valued function f(x) for x in **R**m, the gradient is defined by f(x+δ) = f(x) + δT∇f + O(δ2). For a real-valued function f(x) of _complex_ vectors x, the gradient ∇f can be defined by f(x+δ) = f(x) + Re\[δ\*∇f\] + O(δ2) = f(x) + \[δ\*∇f + (∇f)\*δ\]/2 + O(δ2). For the case here of f(x)=x\*Ax-x\*b-b\*x, just expanding f(x+δ) as in the previous lecture gives ∇f/2 = Ax-b = -(b-Ax) = -(residual).

Discussed successive line minimization of f(x), and in particular the steepest-descent choice of d=b-Ax at each step. Explained how this leads to "zig-zag" convergence by a simple two-dimensional example, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

Derived the conjugate-gradient method, by explicitly requiring that the n-th step minimize over the whole Krylov subspace (the span of the previous search directions). This gives rise to an orthogonality ("conjugacy", orthogonality through A) condition on the search directions, and can be enforced with Gram-Schmidt on the gradient directions. Then we show that a Lanczos-like miracle occurs: most of the Gram-Schmidt inner products are zero, and we only need to keep the previous search direction.

Discussed convergence of conjugate gradient: useless results like "exact" convergence in m steps (not including roundoff), pessimistic bounds saying that the number of steps goes like the square root of the condition number, and the possibility of superlinear convergence for clustered eigenvalues.

**Further reading:** See the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Lecture 20 (25 October)

Discussed preconditioning: finding an easy-to-invert M such that M\-1A has clustered eigenvalues. Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of M\-1A is not actually a problem as long as M is Hermitian positive-definite).

Via a simple analysis of the discretized Poisson's equation, then generalized to any discretized grid/mesh with nearest-neighbor interactions, argued that the number of steps in unpreconditioned CG is (at least) proportional to the diameter of the grid for sparse matrices of this type, and that this exactly corresponds to the square root of the condition number in the Poisson case. Hence, an ideal preconditioner really needs some kind of long-range interaction.

Discussed multigrid. (Briefly) explained why the naive approach of simple using a courser grid as a preconditioner is not enough, because the course-grid solutions necessarily live in a subspace of the fine-grid solutions. Hence, some form of "smoothing", typically combination with another iterative scheme (typically a stationary scheme) is needed.

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html).

### Lecture 21 (27 October)

**Handouts:** [summary of options for solving linear systems](solver-options.pdf), [notes on sparse-direct solvers](http://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2006/lecture-notes/lec21handout6pp.pdf) from Fall 2006.

Brief summary of some preconditioning ideas: multigrid, incomplete LU/Cholesky, Jacobi/block-Jacobi. (Since Jacobi preconditioners only have short-range interactions, they tend not to work well for matrices that come from finite-difference/finite-element discretizations on grids, but they can work well for diagonally dominant matrices that arise in spectral and integral-equation methods.)

BiCG (bi-conjugate gradient), derived (as in the van der Vorst notes below) via preconditioned "CG" on a symmetric-indefinite system of twice the size. Hence derived algorithm 39.1 in Trefethen, motivated why it works (why residual is still orthogonal to an expanding Krylov space), but also explained the two sources of breakdown. Briefly discussed refinements: QMR and BiCGSTAB(ell).

Began talking about sparse-direct solvers (see links below).

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html). A very nice overview of iterative methods for non-Hermitian problems can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES). **Sparse-direct methods:** A [survey of nested-dissection algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.58.9722) (Khaira, 1992). List of [sparse-direct solver software](http://www.cs.utk.edu/~dongarra/etemplates/node388.html) by Dongarra and [another list by Davis](http://www.cise.ufl.edu/research/sparse/codes/). [Notes on multifrontal sparse-direct methods](http://www.cse.illinois.edu/courses/cs598mh/gupta.ps) by M. Gupta (UIUC, 1999). The book _[Direct Methods for Sparse Linear Systems](http://books.google.com/books?id=TvwiyF8vy3EC&lpg=PR1&ots=odauEC2c4k&dq=direct%20methods%20for%20sparse%20davis&pg=PR1#v=onepage&q&f=false)_ by Davis is a useful reference.

### Lecture 22 (29 October)

Several of the iterative algorithms so far have worked, conceptually at least, by turning the original linear-algebra problem into a minimization problem. It is natural to ask, then, whether we can use similar ideas to solve more general **optimization problems**, which will be the next major topic in 18.335.

A simple algorithm, to start with: successive line minimization (for unconstrained local optimization with continuous design parameters), which leads us directly to nonlinear steepest-descent and thence to nonlinear conjugate-gradient algorithms. The key point being that, near a local minimum of a smooth function, the objective is typically roughly quadratic (via Taylor expansion), and when that happens CG greatly accelerates convergence. (Mentioned Fletcher–Powell heuristic to help "reset" the search direction to the gradient if we are far from the minimum and convergence has stalled.)

Application of nonlinear CG to Hermitian eigenproblems by minimizing the Rayleigh quotient (this is convex, and furthermore we can use the Ritz vectors to shortcut both the conjugacy and the line minimization steps).

**Further reading:** For CG for eigenproblems, see the _Templates_ book's section on [preconditioned CG methods for eigenproblems](http://www.cs.utk.edu/~dongarra/etemplates/node418.html). See this [survey by Hager and Zhang (2005)](https://www.math.lsu.edu/~hozhang/papers/cgsurvey.pdf) of variants of nonlinear CG, especially variations on how the search direction is updated.

### Lecture 23 (1 November)

**Handouts:** [overview of optimization](optimization-handout.pdf) ([full-page slides](optimization.pdf)) [notes on adjoint methods](http://math.mit.edu/~stevenj/18.336/adjoint.pdf) to compute gradients

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

Introduction to **adjoint** methods and the remarkable fact that one can compute the gradient of a complicated function with about the same number of additional operations as computing the function _once_.

### Midterm (3 November)

[Midterm](midterm-f10.pdf) and [solutions](midterm-sol-f10.pdf)

### Lecture 24 (5 November)

**Handouts**: [pset 5](pset5-f10.pdf) (due Monday Nov 15) (see also the files [lanczos.m](lanczos.m), [A363.m](A363.m), [SD.m](SD.m), and [A386.m](A386.m));

Adjoint methods, following notes. Adjoint methods for linear equations, nonlinear equations, and eigenproblems.

### Lecture 25 (8 November)

**Handouts**: [adjoint methods for recurrence relations](http://math.mit.edu/~stevenj/18.336/recurrence2.pdf); pages 1–10 of [Svanberg (2002) paper on CCSA algorithms](
http://dx.doi.org/10.1137/S1052623499362822)

Adjoint methods for recurrence relations, following notes.

Start discussing a particular example of a nonlinear optimization scheme, solving the full inequality-constrained nonlinear-programming problem: the CCSA and MMA algorithms, as refined by Svanberg (2002). This is a surprisingly simple algorithm (the [NLopt](http://ab-initio.mit.edu/nlopt) implementation is only 300 lines of C code), but is robust and provably convergent, and illustrates a number of important ideas in optimization: optimizing an approximation to update the parameters **x**, guarding the approximation with trust regions and penalty terms, and optimizing via the dual function (Lagrange multipliers). Like many optimization algorithms, the general ideas are very straightforward, but getting the details right can be delicate!

(Some concepts that CCSA does _not_ use, that we will return to later: using second-derivative information \[quasi-Newton methods\], optimization with function values only \[no gradients\], and global optimization. Note that the "globally convergent" property in the title of the Svanberg paper means that it converges to a local optimum from any feasible starting point, not that it necessarily gives the global optimum.)

Outlined the inner/outer iteration structure of CCSA, and the interesting property that it produces a sequence of feasible iterates from a feasible starting point, which means that you can stop it early and still have a feasible solution (which is very useful for many applications where 99% of optimal is fine, but feasibility is essential).

### Lecture 25 (10 November)

Simplified discussion of MMA algorithm considering only the linear/quadratic CCSA models from the paper, not the actual MMA model functions. Covered conservative approximations, inner/outer iterations, and trust-region and penalty updating. Because the CCSA approximations are convex, we can use ideas from convex optimization to perform solve the trust-region subproblem: **duality**.

Started by reviewing the basic idea of Lagrange multipliers to find an extremum of one function f0(x) and one equality constraint h1(x)=0. We instead find an extremum of L(x,ν1)=f0(x)+ν1h1(x) over x and the _Lagrange multiplier_ ν1. The ν1 partial derivative of L ensures h1(x)=0, in which case L=f0 and the remaining derivatives extremize f0 along the constraint surface. Noted that ∇L=0 then enforces ∇f0\=0 in the direction parallel to the constraint, whereas perpendicular to the constraint ν1 represents a "force" that prevents x from leaving the h1(x)=0 constraint surface.

Generalized to the Lagrangian L(x,λ,ν) of the general optimization problem (the "primal" problem) with both inequality and equality constraints, following chapter 5 of the Boyd and Vandenberghe book (see below) (section 5.1.1). Defined the Lagrange dual function g(λ,ν) (Boyd, section 5.1.2) and proved weak duality of the dual problem (sections 5.1.3, 5.2, 5.2.2). Commented on strong duality (5.2.3), which is mostly true/useful in convex problems (Slater's condition). Defined the notation x\* etcetera for the optimum, as in Boyd.

Described the KKT conditions for a (local) optimum/extremum (Boyd, section 5.5.3). These are true in problems with strong duality, as pointed out by Boyd, but they are actually true in much more general conditions. For example, they hold under the "LICQ" condition in which the gradients of all the active constraints are linearly independents. Gave a simple graphical example to illustrate why violating LICQ requires a fairly weird optimum, at a cusp of two constraints.

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online), chapter 5. There are many sources on [Lagrange multipliers](http://en.wikipedia.org/wiki/Lagrange_multipliers) (the special case of equality constraints) online that can be found by googling. The Wikipedia article on the [KKT conditions](http://en.wikipedia.org/wiki/Karush%E2%80%93Kuhn%E2%80%93Tucker_conditions) lists a number of cases in which they hold, and cites some references.

### Lecture 26 (12 November)

Explained how to solve the convex subproblem from the CCSA (Svanberg, 2001) method (see lecture 29) using duality. We reduce it to a dual problem with only bound constraints on the dual variables, and then do CCSA recursively to obtain a dual problem with no variables at all (trivially solvable).

CCSA uses only the function value and gradient information from the current step, discarding the gradients from the previous steps; in that sense, it is similar in spirit to steepest-descent algorithms or successive LP approximations. More sophisticated algorithms, converging faster near the minimum, will also use (implicit or explicit) second-derivative information. This leads us to Newton and quasi-Newton methods.

Began discussing quasi-Newton methods in general, and the BFGS algorithm in particular. Motivated the problem: we want to construct a sequence of quadratic approximations for our objective function, and optimize these to obtain Newton steps in our parameters. Discussed backtracking line searches to ensure that the Newton step is a sufficient improvement. Discussed difficulty of using exact quadratic model (exact Hessian matrix) in general.

Discussed how quasi-Newton methods are used: they are used to generate not really a step (since the Newton step may be way off if the function is not near the minimum) but rather a direction for a line search. Discussed exact vs. approximate line searches (ala Nocedal, 1980).

Outlined four desirable properties of approximate Hessian matrix: positive definiteness, convergence to exact Hessian for quadratic objectives, multiplying it by the change in _x_ should give the change in the gradient for the most recent step, and it should have as much "memory" as possible (minimizing the change to the Hessian or its inverse in some norm).

### Lecture 27 (15 November)

**Handout:** [pset 5 solutions](pset5sol-f10.pdf)

Gave BFGS update formula, and showed that it satisfies at least the third property. Reduced the problem of proving positive-definiteness to showing that the dot product γTδ of the change in gradient (γ) with the change in _x_ (δ) must be positive.

Explained why an exact line search leads to positive γTδ and hence positive-definite approximate Hessians, and why an approximate line-search can usually be defined to enforce this (cf. [Wolfe conditions](http://en.wikipedia.org/wiki/Wolfe_conditions))...and what to do when this doesn't happen.

Noted that the BFGS update for the approximate Hessian can be transformed into a similar update for the inverse Hessian, using the Sherman-Morrison formula for rank-1 updates. Briefly derived this formula.

Briefly discussed the connection of the BFGS update to minimizing a weighted Frobenius norm of the change in the inverse Hessian approximation.

Showed that the same considerations applied to the inverse Hessian, interchanging the roles of δ and γ, lead to another possible update formula, the DFP update (which minimizes a change in the Hessian approximation). In practice, BFGS seems to work better than DFP for this problem.

Briefly discussed the limited-memory BFGS algorithm, and applications to sequential quadratic programming (SQP).

**Further reading:** Wikipedia's articles on the [Sherman-Morrison formula](http://en.wikipedia.org/wiki/Sherman-Morrison_formula), a [quasi-Newton methods](http://en.wikipedia.org/wiki/Quasi-Newton_methods), and the [BFGS method](http://en.wikipedia.org/wiki/BFGS_method) have some useful links and summaries. Helpful derivations of many of the properties of BFGS updates, and many references, can be found in [this 1980 technical report by Dennis and Schnabel](http://www.cs.colorado.edu/department/publications/reports/docs/CU-CS-185-80.pdf) and for a generalization in [this 1994 paper by O'Leary and Yeremin](http://www.cs.umd.edu/~oleary/reprints/j39.pdf), for example. A nice derivation of the minimum-norm change property (or rather, a derivation of the BFGS update formula from this property), can be found in Greenstadt, _Math. Comp._ **24**, pp. 1–22 (1970).

### Lecture 28 (17 November)

Introduced derivative-free optimization algorithms, for the common case where you don't have too many parameters (tens or hundreds) and computing the gradient is inconvenient (complicated programming, even if adjoint methods are theoretically applicable) or impossible (non-differentiable objectives). Started by discussing methods based on linear interpolation of simplices, such as the COBYLA algorithm of Powell.

Discussed derivative-free optimization based on quadratic approximation by symmetric Broyden updates (as in BOBYQA/NEWUOA algorithm of Powell, for example). Updating the Hessian turns into a quadratic programming (QP) problem, and discussed solution of QPs by construction of the dual, turning it into either an unconstrained QP (and hence a linear system) for equality constrained problems, or a bound-constrained QP for inequality-constrained QPs.

**Further reading** The book [Introduction to Derivative-Free Optimization](http://books.google.com/books?id=7c7X6tlcaHEC&lpg=PP1&ots=ljSCrl3WuI&dq=derivative%20free%20optimization%20conn&pg=PP1#v=onepage&q&f=false) by Andrew Conn et al is a reasonable starting point. See also the [derivative-free algorithms in NLopt](http://ab-initio.mit.edu/wiki/index.php/NLopt_Algorithms) and the references thereof.

### Lecture 29 (19 November)

**Handout:** first few pages of D. R. Jones, C. D. Perttunen, and B. E. Stuckmann, "Lipschitzian optimization without the lipschitz constant," J. Optimization Theory and Applications, vol. 79, p. 157 (1993).

Brief introduction to global optimization. Discussed the difficulty of the problem, and the inapplicability of the local approximations that dominate local optimization methods. The key in general with many global optimization is to find the right balance between global and local search. Essentially there are four categories of possible methods, depending on whether local and global searches are stochastic or deterministic. A genetic algorithm uses stochastic methods for both the global and local search; such algorithms can often be very flexible and easy to implement, but often also converge slowly. Multistart algorithms such as [MLSL](http://ab-initio.mit.edu/wiki/index.php/NLopt_Algorithms#MLSL_.28Multi-Level_Single-Linkage.29) use stochastic global search combined with deterministic local search by standard local-optimization algorithms. A nice example of a completely deterministic algorithm is the [DIRECT](http://ab-initio.mit.edu/wiki/index.php/NLopt_Algorithms#DIRECT_and_DIRECT-L) algorithm by Jones et al.

Described the DIRECT algorithm by Jones et al. Following the Jones paper, worked through a 1d example of optimization using the Lipshitz constant (an upper bound on the rate of change), and then relaxed this to identify the potentially optimal search regions by considering all possible Lipshitz constants. Showed that this reduces to a problem of finding the lower convex hull of a set of points (function values vs. diameter), and is technically a "dynamic convex hull" problem for which many efficient algorithms are known (although Jones et al. do not use this terminology). Trivial proof of convergence (for continuous objectives), although this is of limited utility because it does not tell us much about the convergence rate in practice.

Brief discussion of multistart algorithms, which do repeated local searches (using some local minimization algorithm) from different starting points, and discussed clustering heuristics to prevent repeated searches of the same local minima. In particular, discussed the multi-level single-linkage algorithm (MLSL) from A. H. G. Rinnooy Kan and G. T. Timmer, "Stochastic global optimization methods," Mathematical Programming, vol. 39, p. 27-78 (1987).

### Lecture 30 (22 November)

**Handout:** [Notes](http://math.mit.edu/~stevenj/trapezoidal.pdf) on error analysis of the trapezoidal rule and Clenshaw-Curtis quadrature in terms of Fourier series. [two numerical experiments with the trapezoidal rule](trapz.pdf) showing very different possible error characteristics.

New topic: **numerical integration** (numerical quadrature). Began by basic definition of the problem (in 1d) and differences from general ODE problems. Then gave trapezoidal quadrature rule, and simple argument why the error generally decreases with the square of the number of function evaluations.

Showed numerical experiment (see handout) demonstrating that sometimes the trapezoidal rule can do much better than this: it can even have exponential convergence with the number of points! To understand this at a deeper level, I analyze the problem using Fourier series (see handout), and show that the error in the trapezoidal rule is directly related to the convergence rate of the Fourier series. Claimed (without proof for now) that this convergence rate is related to the smoothness of the periodic extension of the function, and in fact an analytic periodic function has Fourier coefficients that vanish exponentially fast, and thus the trapezoidal rule converges exponentially in that case.

### Lecture 31 (24 November)

**Handout** [Clenshaw–Curtis quadrature](http://en.wikipedia.org/wiki/Clenshaw%E2%80%93Curtis_quadrature) from Wikipedia (mostly written by SGJ as of Dec. 4, so I can vouch for its accuracy).

Derived convergence rate of Fourier series via integration by parts (as in the handout from last lecture), and showed that a function whose k-th derivative is piecewise continuous and bounded has Fourier coefficients cm that decay as O(m−(k+1)). It follows that a smooth function has Fourier coefficients that decay faster than any polynomial in 1/m; sketched contour-integration proof that the convergence rate is exponential for analytic functions with poles a finite distance from the real axis.

Related this convergence rate to trapezoidal rule, and explained why there is an additional cancellation if the discontinuities occur only at the endpoints, and hence the N-point trapezoidal rule always converges as an even power of 1/N.

Explained the idea of Clenshaw–Curtis quadrature as a change of variables + a cosine series to turn the integral of _any_ function into the integral of periodic functions. This way, functions only need to be analytic on the interior of the integration interval in order to get exponential convergence. (See Wikipedia handout.)

Also explained (as in the handout) how to precompute the weights in terms of a discrete cosine transform, rather than cosine-transforming the function values every time one needs an integral, via a simple transposition trick.

Discussed the importance of nested quadrature rules for _a posteriori_ error estimation and adaptive quadrature. Discussed p-adaptive vs. h-adaptive adaptive schemes.

### Lecture 32 (29 November)

Explained connection of Clenshaw-Curtis quadrature and cosine series to Chebyshev polynomials.

Demo of Trefethen's [chebfun package](http://www2.maths.ox.ac.uk/chebfun/) package.

Briefly discussed relationship to Gaussian quadrature (see Trefethen, 2008, below).

**Further reading**: [Chebyshev polynomials on Wikipedia](http://en.wikipedia.org/wiki/Chebyshev_polynomials), free book online [Chebyshev and Fourier Spectral Methods](http://www-personal.umich.edu/~jpboyd/BOOK_Spectral2000.html) by John P. Boyd, the [chebfun package](http://www2.maths.ox.ac.uk/chebfun/) for Matlab by Trefethen et al., Lloyd N. Trefethen, "[Is Gauss quadrature better than Clenshaw-Curtis?](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.157.4174)," _SIAM Review_ **50** (1), 67-87 (2008).