#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Fall 2008.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm (4-231). **Office Hours:** Thursday 4:30–5:30 (2-388).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systesm, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, and sensitivity analysis. Problem sets require some knowledge of MATLAB.

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or [18.701](http://ocw.mit.edu/OcwWeb/Mathematics/18-701Fall2003/CourseHome)). Ordinary differential equations ([18.03](http://math.mit.edu/18.03/) or 18.034) are another prerequisite (not so much as specific material, but more as experience with post-freshman analysis).

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu:8888/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: The [course notes from 18.335 in previous terms](http://www-math.mit.edu/~persson/18.335/), by Per-Olaf Persson, are available online. Although these provide a useful reference, we _will not cover the material in the same sequence_, nor (despite a large overlap) will the material covered be exactly the same. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.ucdavis.edu/~bai/ET/contents.html) are useful surveys.

**Grading**: 33% problem sets (about six). 33% mid-term exam (Wed., Nov. 5), 34% final project (half-page proposal due Friday, October 31).

**Final Projects**: The final project will be a 5–10 page paper (single-column, single-spaced, ideally using the style template from the [_SIAM Journal on Numerical Analysis_](http://www.siam.org/journals/auth-info.php)), reviewing some interesting numerical algorithm not covered in the course. Paper should be written for an audience of your peers in the class, and should include example numerical results (by you) from application to a realistic problem (small-scale is fine), discussion of accuracy and performance characteristics (both theoretical and experimental), and comparison to at least one competing algorithm for the same problem.

* * *

Lecture Summaries and Handouts
------------------------------

### Lecture 1

**Handouts:** a printout of this webpage (i.e., the syllabus). Also a sign-up sheet to make sure I have your email address and other info.

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

Some discussion of how large matrices arise in practice, and gave a simple example of the discrete Laplacian matrix arising from a discretized version of Poisson's equation. Noted that large matrices in practice often have special structure, e.g. sparseness and symmetry, and it is very important to exploit this structure to make their solution practical.

Jumped right into a canonical dense-matrix direct-solver algorithm that we will use to illustrate some performance and accuracy concerns: Gaussian elimination and LU factorization. This is _Lecture 20_ in the Trefethen text: we are starting in the middle to get to numerical issues as quickly as possible, and then will work backwards to develop the tools we need to analyze these issues.

**Further reading:** Trefethen, chapter 20; also it would be good to review chapters 1–3 if your linear algebra is rusty (these chapters are [available online](http://web.comlab.ox.ac.uk/people/Nick.Trefethen/text.html)).

### Lecture 2

**Handouts:** performance experiments with matrix multiplication ([one-page](matmuls-handout.pdf) or [full-size](matmuls.pdf) versions).

Brief review of LU factorization. Now that we remember what it is, we will put on our "numerical methods" hats and examine the numerical issues: first performance, and later on the accuracy. The classical way to analyze performance is operation counts; show that flop count is 2_m_3/3 for _m_×_m_ problems. Show that this means 1000×1000 problems are now routine, but that 106×106 or larger problems (as commonly arise for PDEs) will require us to take advantage of some special structure.

Furthermore, counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This will lead us, in the next lecture, to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

**Further reading:** Trefethen, chapter 20. Wikipedia also has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/).

### Lecture 3

**Handouts:** [problem set 1](pset1.pdf) (due Sep. 17) (attachments: [matmul\_bycolumn.m](matmul_bycolumn.m), [benchmul.m](benchmul.m)); [ideal-cache terminology](ideal-cache.pdf)

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(_n_3/√_Z_) cache complexity.

Discussed some practical difficulties: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS). Briefly explained ATLAS's self-optimizing code-generation approach, producing zillions of optimized little blocks for different special cases.

Introduced the concept of optimal cache-oblivious algorithms, which we will examine in the next lecture.

**Further reading:** [Cache-oblivious algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911), describing ideal cache model and analysis for various algorithms, by Frigo, Leiserson, Prokop, and Ramachandran (1999). [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](http://www.mathworks.com/company/newsletters/news_notes/clevescorner/winter2000.cleve.html). See also the ATLAS home page linked from lecture 2.

### Lecture 3

**Handouts:** experiments with cache-oblivious matrix-multiplication ([handout](oblivious-matmul-handout.pdf) or [full-size slides](oblivious-matmul.pdf))

Discussed cache-oblivious matrix multiplication in theory and in practice (see handout and Frigo et. al paper above).

Brief discussion of spatial locality and cache lines, with examples of dot products and matrix additions (both of which are "level 1 BLAS" operations with no temporal locality). Discussed matrix storage (row-major and column-major) and effect on algorithms.

Began discussion of matrix-multiply algorithms that do better than O(_m_3).

**Further reading:** Frigo et al. paper from previous lecture. ATLAS web page above. [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007). Trefethen, lecture 20.

### Lecture 4

Discussion of Strassen algorithm and other matrix-multiply algorithms that do betterthan O(_m_3).

New topic: **accuracy and stability**. Start with LU factorization, and give example where small roundoff error can lead to huge mistakes. The next few lectures will deal with, in reverse order (iii) how to improve LU (pivoting); (ii) how to define/characterize accuracy and stability of algorithms; (i) how to describe roundoff errors and computer arithmetic.

**Further reading:** [Using recursion to boost ATLAS's performance](http://www.springerlink.com/content/g146080l0l0xv307/) (D'Alberto and Nicolau, 2008). [Strassen algorithm](http://en.wikipedia.org/wiki/Strassen_algorithm) on Wikipedia. Trefethen book, lectures 20, 13, 14.

### Lecture 5

**Handouts:** [notes on floating-point](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/F71D844D-2DDD-4741-9503-718653216116/0/lec8handout6pp.pdf) (18.335 Fall 2006); page 25 of Kahan's presentation (below).

Overview of floating-point representations, focusing on the IEEE 754 standard. The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10−16 for double precision). Moreover the IEEE standard guarantees that the result of _x_♦_y_ where ♦ is addition, subtraction, multiplication, or division, is equivalent to computing fl(_x_♦_y_), i.e. computing it in infinite precision and then rounding (this is called "exact rounding" or "correct rounding").

Mentioned a few other useful odds and ends of IEEE floating-point arithmetic: ±Inf, NaN (e.g. result of 0/0), signed zeros (so that 1/±0 = ±Inf and vice-versa), exceptions. I skipped over the fine details of the bit representation (hidden bits, normal/denormal numbers etcetera); one useful feature is that "+0" is represented by all-0 bits, so you can use [memset](http://www.opengroup.org/onlinepubs/009695399/functions/memset.html) and similar optimized library routines to initialize a large array to zero.

Emphasized that precision is not the same thing as accuracy. Results can be either more accurate than the precision might seem to imply (e.g. if you do integer arithmetic in floating-point) or less accurate (if you do many computations and the small rounding errors accumulate).

The deceptively-obvious way to define "accuracy" is by forward stability (eq. 14.2 in the text). Showed why this is not actually very useful by the simple example of summing _n_ numbers, which a trivial example shows is not forwards-stable. Defined _stability_ by the more general (weaker) definition as in chapter 14 of the text; we will explore this in the next lecture.

**Further reading:** [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): see discussion of floating-point myths. Trefethen, lectures 13 and 14.

### Lecture 6

**Handouts:** [Pset 1 solutions](pset1sol.pdf), [problem set 2](pset2.pdf) (due 29 Sep.; for problems 2 and 3 you will need the Matlab files [loopsum.m](loopsum.m) and [div2sum.m](div2sum.m))

Reviewed stability definition, and covered the special (stronger) condition of backwards stability, which is true of many algorithms and often not too hard to prove. Showed that floating-point summation of _n_ numbers is backwards stable.

When quantifying errors, a central concept is a norm. Defined norms (as in lecture 3 of Trefethen), gave examples of _Lp_ norms (usually _p_ = 1, 2, or ∞), weighted norms, Frobenius norm, and induced matrix norms. Bounded induced square-matrix norm in terms of matrix eigenvalues (we will give a more precise bound later in terms of SVDs).

**Further reading:** Trefethen, lectures 14, 15, and 3.

### Lecture 7

Showed that unitary matrices preserve _L_2 norms and induced norms, and also the _L_2 Frobenius matrix norm.

Equivalence of norms. Proved that any two norms are equivalent up to a constant bound, and that this means that stability in one norm implies stability in all norms. The proof involved: (i) showing that all norms are continuous; (ii) showing that we can reduce the problem of showing any norm is equivalent to _L_2 on the unit circle; and (iii) a result (quoted without proof) from real analysis: a continuous function on a closed/bounded set achieves its maximum and minimum.

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

**Further reading:** Trefethen, lecture 3, 14, and 12.

### Lecture 8

Further discussion of condition numbers. Calculated condition number for square root, summation, and matrix-vector multiplication, similar to the book.

Related matrix _L_2 norm to eigenvalues of _A_\*_A_. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian positive-definite matrices. In preparation for definition of SVD, showed that _A__A_\* has the same nonzero eigenvalues and related eigenvectors compared to _A_\*_A_.

**Further reading:** Trefethen, lecture 12, 24, 4, 5. Any linear-algebra textbooks coverage of eigenvalues and eigenvectors, especially of Hermitian matrices, would be good to review.

### Lecture 9

Explicitly constructed SVD in terms of eigenvectors/eigenvalues of _A_\*_A_ and _A__A_\*. Related to singular values to induced L2 norm and condition number.

Introduced least-squares problems, gave example of polynomial fitting, gave normal equations.

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 10

**Handouts:** [problem-set 2 solutions](pset2sol.pdf)

Discussed solution of normal equations and pseudo-inverse. Discussed condition number of solving normal equations directly, and noted that it squares the condition number—not a good idea if we can avoid it.

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Gave the simple, but unstable construction of the Gram-Schmidt algorithm, counted operations. Explained how to use QR to solve linear equations and least squares without squaring the condition number...if we have a stable algorithm to do QR.

**Further reading:** Trefethen, lectures 7, 8, 18.

### Lecture 11

**Handouts:** [problem-set 3](pset3.pdf) (due Friday, 10 October).

Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example, especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt, argued how it fixes the problem, and showed an example.

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Showed how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

**Further reading:** Trefethen, lectures 8, 9, 10, 16. 2006 18.335 notes, [lecture 5](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/B500DEEA-1E3F-4796-AA61-E8EE707F6ADE/0/lec5handout6pp.pdf) and [lecture 6](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/3BEAD329-F47F-43E2-9FB3-AE439849F2D1/0/lec6handout6pp.pdf).

### Lecture 12

Considered Householder algorithm in more detail, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

Returned to Gaussian elimination. Introduced partial pivoting, and showed how (by communting the row exchanges with the L matrices) this can be expressed as a PA=LU factorization where P is a permutation. Discussed backwards stability of LU, and gave example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

**Further reading:** Trefethen, lecture 10, 16, 21, 22.

### Lecture 13

Brief discussion of Cholesky factorization, and more generally of the fact that one can often take advantage of special structure if it is present in your matrix.

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial, mentioned extensions to generalized eigenproblems and SVDs. Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization. Proved that every (square) matrix has a Schur factorization, and that for Hermitian matrices the Schur form is real and diagonal.

Pointed out that an "LU-like" algorithm for the Schur factorization, which computes the exact factorization (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Discussed the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

**Further reading:** Trefethen, lecture 23, 24, 25.

### Lecture 14

More on the connection between eigenvalue problems and polynomial roots: introduced the companion matrix of a polynomial, which converts any polynomial into a matrix whose eigenvalues are the roots. This means that any exact method for eigenvalues of matrices bigger than 4×4 would violate Abel's theorem.

Discussed iterative methods in general. Gave the simple example of applying Newton's method to find roots of the characteristic polynomial to any desired accuracy. Pointed out, however, that this is ill-conditioned and extremely sensitive to roundouff. Moreover, the problem of even computing the characteristic polynomial is nontrivial, and showed a simple but O(m4) algorithm to do it. Explained that we can actually circumvent some of these difficulties if we don't explicitly compute the characteristic polynomial, and instead evaluate it at particular values of λ implicitly using det(A-λI), and that this forms the basis of a practical method (bisection) described later in the book...however, bisection relies on you being interested only in eigenvalues in a particular interval, and some additional tricks to count the number of eigenvalues in an interval and evaluate det(A-λI) more efficiently.

Discussed reduction of A to Hessenberg ("almost-Schur") form. Given this, we can actually evaluate det(A-λI) in O(m2) time for each value of λ, or O(m) time if A is Hermitian, making bisection search much more practical. It will also accelerate lots of other methods to find eigenvalues. Introduced basic idea of Hessenberg factorization by relating it to Householder QR, and in particular showed that Householder reflectors will do the job as long as we allow one nonzero element below the diagonal.

**Further reading:** Trefethen, lecture 25, 26.

### Lecture 15

**Handout:** [pset 3 solutions](pset3sol.pdf), [problem set 4](pset4.pdf) (due Monday, Oct. 20)

Showed why QR method (from pset 3) works: corresponds to QR factorization of An, but without explicitly computing powers of A. Discussed power method and Rayleigh quotient.

**Further reading:** Trefethen, lecture 27, 28.

### Lecture 16

Power method, shifted inverse iteration, Rayleigh-quotient iteration, convergence rates. Connection of QR to inverse iteration, and shifted QR.

Briefly discussed algorithms for SVD, and mentioned a few other eigensolver algorithms. At this point, however, we are mostly through with details of dense linear-algebra techniques: the important thing is to grasp the fundamental ideas rather than zillions of little details, since in practice you're just going to use LAPACK anyway.

Started discussing (at a very general level) a new topic: iterative algorithms, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix-vector products but cannot (practically) mess around with the specific entries of _A_.

**Further reading:** Trefethen, lecture 27, 29, briefly touched on lectures 30 and 31. New topic: iterative methods, lecture 32.

### Lecture 17 (Oct 17)

Iterative methods. Discussed the common circumstances where _Ax_ matrix-vector products are fast (sparse matrices, spectral methods with FFTs, integral-equations with fast multipole etc.). General idea of starting with a guess for the solution (e.g. a random vector) and iteratively improving..

Emphasized that there are many iterative methods, and that there is no clear "winner" or single bulletproof library that you can use without much thought (unlike LAPACK for dense direct solvers). It is problem-dependent and often requires some trial and error. Then there is the whole topic of preconditioning, which we will discuss more later, which is even more problem-dependent. Briefly listed several common techniques for linear systems (Ax=b) and eigenproblems (Ax=λx or Ax=λBx).

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Anv and throws away the previous ones. Introduced Krylov subspaces, and the idea of Krylov subspace methods: find the best solution in the whole subspace spanned by v,Av,...,An-1v.

Derived the Arnoldi method as an iterative reduction of A to Hessenberg form, using only _Ax_ matrix-vector products and a Gram-Schmidt-like technique. However, in practice we will stop Arnoldi part-way, as discussed in the next lecture.

**Further reading:** Trefethen, lectures 32 and 33. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.ucdavis.edu/~bai/ET/contents.html), are useful surveys.

### Lecture 18 (Oct 20)

**Handout:** [pset 4 solutions](pset4sol.pdf), [problem set 5](pset5.pdf) (due Wednesday, Oct. 29; for problems 2 and 3, the files [lanczos.m](lanczos.m), [A363.m](A363.m), [SD.m](SD.m), and [A386.m](A386.m) may be helpful)

Discussed what it means to stop Arnoldi after n<m iterations: finding the "best" solution in the Krylov subspace Kn. Discussed the general principle of Rayleigh-Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method). Also showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace.

Lanczos: Arnoldi for Hermitian matrices. Showed that in this case we get a three-term recurrence for the tridiagonal reduction of A. Noted that, in practice, this is still too expensive to always do for _m_ steps to get the full tridiagonal matrix and all the eigenvalues, and that furthermore rounding errors lead to loss of orthogonality and repeating "ghost" eigenvalues. Began discussing of restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors. For k=1 this is easy, but explained why it is nontrivial for k>1: we need to restart in such a way that maintains the Lanczos (or Arnoldi) property that the residual AQn - QnHn is nonzero only in the n-th column.

**Further reading:** Trefethen, lecture 34 and 36. See also the section on restarted Lanczos in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.ucdavis.edu/~bai/ET/contents.html).

### Lecture 19 (Oct 22)

**Handout:** [preconditioning slides](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/89274D7E-68EB-4129-9050-5EAE8B7B0410/0/lec22handout6pp.pdf) by Per Persson, from 2006 18.335.

Discussed the implicitly restarted Lanczos method, which does n-k steps of shifted QR to reduce the problem from n to k dimensions. The key thing is that, because the Q matrices in QR on tridiagonal matrices are upper Hessenberg, their product can be shown to preserve the Lanczos property of the residual for the first k columns.

Began discussing iterative solvers for Ax=b linear systems, starting with the case where A is Hermitian positive-definite. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=x\*Ax-x\*b-b\*x. Then, we show how to perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method.

Discussed convergence of the steepest-descent method. By a simple 2d picture, explain why this depends on the condition number of A, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

**Further reading:** See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.ucdavis.edu/~bai/ET/contents.html). Trefethen, lecture 38. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Lecture 20 (Oct 24)

Derived the conjugate-gradient method, by explicitly requiring that the n-th step minimize over the whole Krylov subspace (the span of the previous search directions). This gives rise to an orthogonality ("conjugacy", orthogonality through A) condition on the search directions, and can be enforced with Gram-Schmidt on the gradient directions. Then we show that a Lanczos-like miracle occurs: most of the Gram-Schmidt inner products are zero, and we only need to keep the previous search direction.

Discussed convergence: useless results like "exact" convergence in m steps (not including roundoff), pessimistic bounds saying that the number of steps goes like the square root of the condition number, and the possibility of superlinear convergence for clustered eigenvalues.

Discussed preconditioning: finding an easy-to-invert M such that M\-1A has clustered eigenvalues. Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of M\-1A is not actually a problem as long as M is Hermitian positive-definite).

**Further reading:** Trefethen, lecture 38 and 40, and the [Shewchuk paper](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) above. See also [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html).

### Lecture 21 (Oct 27)

Discussed preconditioning. Via a simple analysis of the discretized Poisson's equation, then generalized to any discretized grid/mesh with nearest-neighbor interactions, argued that the number of steps in unpreconditioned CG is proportional to the diameter of the grid. Hence, an ideal preconditioner really needs some kind of long-range interaction.

Briefly discussed incomplete LU and incomplete Cholesky heuristics.

Discussed multigrid. Explained why the naive approach of simple using a courser grid as a preconditioner is not enough, because the course-grid solutions necessarily live in a subspace of the fine-grid solutions. Hence, some form of "smoothing", typically combination with another iterative scheme (typically a stationary scheme) is needed.

Discussed spectral methods (e.g. Fourier series) for which diagonal (Jacobi) preconditioners typically work very well. Gave example of fast solver for Poisson's equation, and generalized it to a preconditioner for a Schrodinger/Helmholtz-type operator ∇2+V(x). Briefly mentioned the general idea of approximating matrices by "nearby" circulant matrices, and hence using FFTs.

### Lecture 22 (Oct 29)

**Handoust:** [problem-set 5 solutions](pset5sol.pdf), [summary of options for solving linear systems](solver-options.pdf)

Iterative methods for non-symmetric and indefinite systems.

BiCG (bi-conjugate gradient), derived (as in the van der Vorst notes below) via preconditioned "CG" on a symmetric-indefinite system of twice the size. Hence derived algorithm 39.1 in Trefethen, motivated why it works (why residual is still orthogonal to an expanding Krylov space), but also explained the two sources of breakdown. Briefly discussed refinements: QMR and BiCGSTAB(ell).

Derived the GMRES method as in lecture 35 of Trefethen, as residual minimization in the Krylov space using Arnoldi's orthonormal basis Qn. Like Arnoldi, this is too expensive to run for many steps without restarting. Unlike Arnoldi, there isn't a clear solution (yet) for a good restarting scheme.

Just as Arnoldi reduces to Lanczos for Hermitian matrices, GMRES reduces to MINRES, which is a cheap recurrence with no requirement for restarting. We'll discuss MINRES in the next lecture.

**Further reading:** Trefethen, lectures 35 and 39. [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES).

### Lecture 23 (Oct 31)

MINRES. Sparse-direct solvers.

**Further reading:** On MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book. [Lecture notes on sparse-direct solvers](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/3BCB14B0-126F-4B9E-B686-0E272055B763/0/lec21handout6pp.pdf) from 18.335 in Fall 2006 (also [as slides](http://ocw.mit.edu/NR/rdonlyres/Mathematics/18-335JFall-2006/DF6E3AF7-1D9E-4EAE-B310-B2D6A35CFE12/0/lec21.pdf)). A [survey of nested-dissection algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.58.9722) (Khaira, 1992). List of [sparse-direct solver software](http://www.cs.utk.edu/~dongarra/etemplates/node388.html) by Dongarra et al.

### Lecture 24 (Nov 3)

CG as a general nonlinear-optimization scheme. CG for eigenproblems—noted the remarkable fact that one can do both the line minimization and the conjugacy implicitly in this case by solving a 3×3 eigenproblem for the Ritz vectors.

**Further reading:** For nonlinear CG, see e.g. the Shewchuk ("without the agonizing pain") notes linked above. For CG for eigenproblems, see the _Templates_ book for eigenproblems.

### Midterm (Nov 5)

[Mid-term exam](midterm.pdf) and [solutions](midterm-sol.pdf).

### Lecture 25 (Nov 7)

**Handouts:** [overview of optimization](optimization-handout.pdf) ([full-page slides](optimization.pdf))

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online).

### Lecture 26 (Nov 12)

**Handouts:** [notes on adjoint methods](http://math.mit.edu/~stevenj/18.336/adjoint.pdf) to compute gradients

Adjoint methods for sensitivity analysis. Covered cases of linear equations, nonlinear equations, and eigenequations, from handout.

**Further reading:** see references in handout.

### Lecture 27 (Nov 14)

**Handouts:** [adjoint methods for recurrence relations](http://math.mit.edu/~stevenj/18.336/recurrence2.pdf), [Svanberg (2002) paper on (improved) MMA algoirthm](
http://dx.doi.org/10.1137/S1052623499362822)

Adjoint methods for recurrence relations (which arise e.g. in discretized ODEs and time-evolved PDEs, as well as many other cases).

Start discussing a particular example of a nonlinear optimization scheme, solving the full inequality-constrained nonlinear-programming problem: the MMA algorithm, as refined by Svanberg (2002). This is a surprisingly simple algorithm (the [NLopt](http://ab-initio.mit.edu/nlopt) implementation is only 300 lines of C code), but is robust and provably convergent, and illustrates a number of important ideas in optimization: optimizing an approximation to update the parameters **x**, guarding the approximation with trust regions and penalty terms, and optimizing via the dual function (Lagrange multipliers). Like many optimization algorithms, the general ideas are very straightforward, but getting the details right can be delicate!

### Lecture 28 (Nov 17)

**Handouts:** selections from chapter 5 of _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online).

Simplified discussion of the MMA algorithm: first the unconstrained case, then the nonlinearly constrained case, using the linear+quadratic approximation functions (rather than the MMA functions) from the Svanberg paper.

To solve the approximate constrained problem, which is convex and separable, we turn to Lagrange multipliers, i.e. the "dual" problem. Somewhat handwavy introduction to the basic ideas, which we will look at more formally next time.

### Lecture 29 (Nov 19)

**Handouts:** [problem-set 6](pset6.pdf) (due Monday, 1 Dec) (you'll need [lorentzdata.m](lorentzdata.m) and [lorentzfit.m](lorentzfit.m)).

Duality and the KKT conditions. Derived the Lagrangian and set up the Lagrange dual problem. Proved weak duality (max of dual is lower bound for primal optimum). Gave graphical picture of dual problem (from Boyd book), illustrating why strong duality may not hold for non-convex problems, or even for convex problems with empty feasible regions (violating Slater condition). Introduced the KKT conditions.

### Lecture 30 (Nov 21)

More on KKT conditions. Discussed LICQ (linear-independence constraint qualification) condition for KKT conditions to be necessary. Gave a simple non-convex example where the optimum does not satisfy KKT conditions, and showed that it violates LICQ.

Began discussing variable-metric ("quasi-Newton") methods in general (Davidon, 1959), and the BFGS algorithm in particular. Motivated the problem: we want to construct a sequence of quadratic approximations for our objective function, and optimize these to obtain Newton steps in our parameters. Discussed backtracking line searches to ensure that the Newton step is a sufficient improvement. Discussed difficulty of using exact quadratic model (exact Hessian matrix) in general.

Outlined three desirable properties of approximate Hessian matrix: positive definiteness, convergence to exact Hessian for quadratic objectives, and multiplying it by the change in _x_ should give the change in the gradient for the most recent step.

Gave BFGS update formula, and showed that it satisfies at least the third property.

### Lecture 31 (Nov 24)

Continued discussion of BFGS: showed that it usually maintains positive-definiteness, and how to detect and correct the cases where it doesn't. Briefly discussed later refinements, in particular the limited-memory BFGS algorithm and applications to sequential quadratic programming (SQP).

Introduced derivative-free optimization algorithms, for the common case where you don't have too many parameters (tens or hundreds) and computing the gradient is inconvenient (complicated programming, even if adjoint methods are theoretically applicable) or impossible (non-differentiable objectives). Started by discussing methods based on linear interpolation of simplices, such as the COBYLA algorithm of Powell.

### Lecture 32 (Nov 26)

**Handout:** first few pages of "[Lipschitzian optimization without the Lipschitz constant](http://www.springerlink.com/index/KN467T1876721411.pdf)" by Jones et al (1993, the "DIRECT" algorithm).

Discussed derivative-free optimization based on quadratic approximation by symmetric Broyden updates (as in NEWUOA algorithm of Powell, for example). Updating the Hessian turns into a quadratic programming (QP) problem, and discussed solution of QPs by construction of the dual, turning it into either an unconstrained QP (and hence a linear system) for equality constrained problems, or a bound-constrained QP for inequality-constrained QPs.

Brief introduction to global optimization. Discussed the difficulty of the problem, and the inapplicability of the local approximations that dominate local optimization methods. As an example of a non-random method, described the DIRECT algorithm by Jones et al. Following the Jones paper, worked through a 1d example of optimization using the Lipshitz constant (an upper bound on the rate of change), and then relaxed this to identify the potentially optimal search regions by considering all possible Lipshitz constants. Showed that this reduces to a problem of finding the lower convex hull of a set of points (function values vs. diameter), and is technically a "dynamic convex hull" problem for which many efficient algorithms are known (although Jones et al. do not use this terminology).

### Lecture 33 (Dec 1)

**Handout:** [Notes](http://math.mit.edu/~stevenj/trapezoidal.pdf) on error analysis of the trapezoidal rule and Clenshaw-Curtis quadrature in terms of Fourier series. [pset 6 solutions](pset6sol.pdf)

Finished discussion of DIRECT algorithm by noting some additional heuristics about subdivision strategies, and requirements of sufficient decrease to prevent too much emphasis on local search. Trivial proof of convergence (for continuous objectives), although this is of limited utility because it does not tell us much about the convergence rate in practice. (Noted that one can also trivially prove convergence for pure random search.)

Brief discussion of multistart algorithms, which do repeated local searches (using some local minimization algorithm) from different starting points, and discussed clustering heuristics to prevent repeated searches of the same local minima. In particular, discussed the multi-level single-linkage algorithm (MLSL) of Kan and Timmer (1987).

Switched to completely new topic: **numerical integration** (numerical quadrature). Began by basic definition of the problem (in 1d) and differences from general ODE problems. Then gave trapezoidal quadrature rule, and simple argument why the error generally decreases with the square of the number of function evaluations.

A more careful analysis uses Fourier series; brief review of these.

**Further reading**: the original MLSL paper by Kan and Timmer, [part I](http://portal.acm.org/citation.cfm?id=31676) and [part II](http://portal.acm.org/citation.cfm?id=31673.31677).

### Lecture 34 (Dec 3)

**Handout:** [two numerical experiments with the trapezoidal rule](trapz.pdf) showing very different possible error characteristics

Fourier analysis of the trapezoidal rule and Clenshaw-Curtis quadrature (see notes handout from last lecture).

**Further reading:** [Clenshaw-Curtis quadrature](http://en.wikipedia.org/wiki/Clenshaw-Curtis_quadrature) on Wikipedia.

### Lecture 35 (Dec 5)

Clenshaw-Curtis quadrature and reduction to discrete cosine transforms. Some discussion of adaptive quadrature and Clenshaw-Curtis vs. Gaussian quadrature.

### Lecture 36 (Dec 8)

Fast Fourier transform (FFT) algorithms. Cooley-Tukey, convolutions, Bluestein, Rader, ...

### Lecture 37 (Dec 10)

Practical issues in implementing FFT algorithms; FFTW.