#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Spring 2020.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm (formerly 2-190, now via [Zoom videoconference](https://mit.zoom.us/j/283159937)).  [Lecture videos](https://video.odl.mit.edu/collections/5e0691b4c35e4672b7c4613522814c35/) and [handwritten notes](https://www.dropbox.com/s/l8ot1wc19r29lx6/18.335%20spring%202020.pdf?dl=0) are posted online.  **Office Hours:** Thursday 4–5pm (formerly 2-345, now via [Zoom videoconference](https://mit.zoom.us/j/420290549)).  Videoconference access requires [MIT Touchstone authentication](https://ist.mit.edu/news/zoom-release).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of [Julia](http://julialang.org/), a Matlab-like environment (little or no prior experience required; you will learn as you go).

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). 18.335 is a graduate-level subject, however, so much more mathematical maturity, ability to deal with abstractions and proofs, and general exposure to mathematics is assumed than for 18.06!

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 33% problem sets (about six, ~biweekly). 33% **take-home mid-term exam** (posted Friday **Apr. 10** and due Saturday **Apr. 11**), 34% **final project** ([one-page proposal](psets/proposal.md) due Friday March 20, project due Tuesday **May 12**).

* Psets will be [submitted electronically via Stellar](https://learning-modules.mit.edu/gradebook/index.html?uuid=/course/18/sp20/18.335).  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://piazza.com/class/k8rtd8epj6l7nj)

**TA/grader:** [Jacob Gold](http://math.mit.edu/directory/profile.php?pid=1714).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

**Final Projects**: The final project will be a 8–15 page paper (single-column, single-spaced, ideally using the style template from the [_SIAM Journal on Numerical Analysis_](http://www.siam.org/journals/auth-info.php)), reviewing some interesting numerical algorithm not covered in the course. \[Since this is not a numerical PDE course, the algorithm should _not_ be an algorithm for turning PDEs into finite/discretized systems; however, your project _may_ take a PDE discretization as a given "black box" and look at some other aspect of the problem, e.g. iterative solvers.\] Your paper should be written for an audience of your peers in the class, and should include example numerical results (by you) from application to a realistic problem (small-scale is fine), discussion of accuracy and performance characteristics (both theoretical and experimental), and a fair comparison to at **least one competing algorithm** for the same problem. Like any review paper, you should _thoroughly reference_ the published literature (citing both original articles and authoritative reviews/books where appropriate \[rarely web pages\]), tracing the historical development of the ideas and giving the reader pointers on where to go for more information and related work and later refinements, with references cited throughout the text (enough to make it clear what references go with what results). (**Note:** you may re-use diagrams from other sources, but all such usage must be _explicitly credited_; not doing so is [plagiarism](http://writing.mit.edu/wcc/avoidingplagiarism).) Model your paper on academic review articles (e.g. read _SIAM Review_ and similar journals for examples).

A good final project will include:

* An extensive introduction and bibliography putting the algorithm in context.  Where did it come from, and what motivated its development?  Where is it commonly used (if anywhere)?  What are the main competing algorithms?  Were any variants of the algorithm proposed later?  What do other authors say about it?

* A clear description of the algorithm, with a summary of its derivation and key properties.   Don't copy long mathematical derivations or proofs from other sources, but do *summarize* the key ideas and results in the literature.

* A convincing validation on a representative/quasi-realistic test problem (i.e. show that your code works), along with an informative comparison to important competing algorithms.  For someone who is thinking about using the algorithm, you should strive to give them *useful* guidance on how the algorithm compares to competing algorithms: when/where should you consider using it (if ever)?   Almost never rely on actual timing results — see below!

Frequently asked questions about the final project:

1.  _Does it have to be about numerical linear algebra?_ No. It can be any numerical topic (basically, anything where you are computing a conceptually real result, not integer computations), excluding algorithms for discretizing PDEs.
2.  _Can I use a matrix from a discretized PDE?_ Yes. You can take a matrix from the PDE as input and then talk about iterative methods to solve it, etcetera. I just don't want the paper to be about the PDE discretization technique itself.
3.  _How formal is the proposal?_ Very informal—one page describing what you plan to do, with a couple of references that you are using as starting points. Basically, the proposal is just so that I can verify that what you are planning is reasonable and to give you some early feedback.
4.  _How much code do I need to write?_ A typical project (there may be exceptions) will include a working proof-of-concept implementation, e.g. in Julia or Python or Matlab, that you wrote to demonstrate that you understand how the algorithm works. Your code does _not_ have to be competitive with "serious" implementations, and I encourage you to download and try out existing "serious" implementations (where available) for any large-scale testing and comparisons.
5.  _How should I do performance comparisons?_ Be very cautious about timing measurements: unless you are measuring highly optimized code or only care about orders of magnitude, timing measurements are more about implementation quality than algorithms. Better to *measure something implementation-independent* (like flop counts, or matrix-vector multiplies for iterative algorithms, or function evaluations for integrators/optimizers), even though such measures have their own weaknesses.

* * *

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (Feb 3)

* [pset 1](psets/pset1.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/psets/pset1.ipynb), due Friday Feb. 14.
* [Newton's method for square roots](notes/newton-sqrt.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Newton-Square-Roots.ipynb).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

As a starting example, considered the convergence of Newton's method (as applied to square roots); see the handout and Julia notebook above.

**Further reading:** Googling "Newton's method" will find lots of references; as usual, the [Wikipedia article on Newton's method](https://en.wikipedia.org/wiki/Newton's_method) is a reasonable starting point. Beware that the terminology for the [convergence order](https://en.wikipedia.org/wiki/Rate_of_convergence) (linear, quadratic, etc.) is somewhat different in this context from the terminology for discretization schemes (first-order, second-order, etc.); see e.g. the linked Wikipedia article. Homer Reid's [notes on machine arithmetic](http://homerreid.dyndns.org/teaching/18.330/Notes/RootFinding.pdf) for [18.330](http://homerreid.dyndns.org/teaching/18.330/) are an excellent introduction that covers several applications and algorithms for root-finding. For numerical computation in 18.335, we will be using the Julia language: see this [information on Julia at MIT](https://github.com/mitmath/julia-mit).

### Lecture 2 (Feb 5)

* [notes on floating-point](notes/lec8handout6pp.pdf) (18.335 Fall 2007; also [slides](notes/lec8.pdf))
* Julia [floating-point notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Floating-Point-Intro.ipynb)
* some [floating-point myths](notes/fp-myths.pdf)


New topic: **Floating-point arithmetic**

The basic issue is that, for computer arithmetic to be fast, it has to be done in hardware, operating on numbers stored in a fixed, finite number of digits (bits). As a consequence, only a _finite subset_ of the real numbers can be represented, and the question becomes _which subset_ to store, how arithmetic on this subset is defined, and how to analyze the errors compared to theoretical exact arithmetic on real numbers.

In **floating-point** arithmetic, we store both an integer coefficient and an exponent in some base: essentially, scientific notation. This allows large dynamic range and fixed _relative_ accuracy: if fl(x) is the closest floating-point number to any real x, then |fl(x)-x| < ε|x| where ε is the _machine precision_. This makes error analysis much easier and makes algorithms mostly insensitive to overall scaling or units, but has the disadvantage that it requires specialized floating-point hardware to be fast. Nowadays, all general-purpose computers, and even many little computers like your cell phones, have floating-point units.

Overview of **floating-point** representations, focusing on the IEEE 754 standard (see also handout from previous lecture). The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property of _uniform relative precision_ (for |_x_| and 1/|_x_| < than some _range_, ≈10³⁰⁰ for double precision) that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10⁻¹⁶ for double precision). There are also a few special values: ±Inf (e.g. for [overflow](https://en.wikipedia.org/wiki/Arithmetic_overflow)), [NaN](https://en.wikipedia.org/wiki/NaN), and ±0 (e.g. for [underflow](https://en.wikipedia.org/wiki/Arithmetic_underflow)).

Went through some simple examples in Julia (see notebook above), illustrating basic syntax and a few interesting tidbits.  In particular, we looked at two examples of [catastrophic cancellation](https://en.wikipedia.org/wiki/Loss_of_significance) and how it can sometimes be avoided by rearranging a calculation.

**Further reading:** Trefethen, lecture 13. [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): contains a nice discussion of floating-point myths and misconceptions.   A brief but useful summary can be found in [this Julia-focused floating-point overview](https://discourse.julialang.org/t/psa-floating-point-arithmetic/8678) by Prof. John Gibson.

### Lecture 3 (Feb 7)

* notes on the accuracy and stability of [floating-point summation](notes/naivesum.pdf)

Summation, accuracy, and stability.

**Further reading**: See the further reading from the previous lecture. Trefethen, lectures 14, 15, and 3. See also the Wikipedia article on [asymptotic ("big O") notation](https://en.wikipedia.org/wiki/Big_O_notation); note that for expressions like O(ε) we are looking in the limit of _small_ arguments rather than of large arguments (as in complexity theory), but otherwise the ideas are the same.

### Julia tutorial (Feb 7: 5pm in 32-141) — optional

**Handout:** [Julia cheat-sheet](https://github.com/mitmath/julia-mit/blob/master/Julia-cheatsheet.pdf), [Julia intro slides](https://github.com/mitmath/julia-mit/blob/master/Julia-intro.pdf)

On Friday, 7 February, at 5pm in 32-141, I will give an (attendance-optional!) Julia tutorial, introducing the [Julia programming language and environment](http://julialang.org/) that we will use this term. Please see the [tutorial notes online](https://github.com/mitmath/julia-mit/blob/master/README.md).

Please **bring your laptops**, and try to install Julia and the IJulia interface first via the abovementioned tutorial notes. Several people will be at the tutorial session to help answer installation questions. Alternatively, you can use Julia online at [JuliaBox](https://juliabox.com/) without installing anything (although running things on your own machine is usually faster).

### Lecture 4 (Feb 10)

* [notes on the equivalence of norms](notes/norm-equivalence.pdf)

When quantifying errors, a central concept is a norm, and we saw in our proof of backwards stability of summation that the choice of norm seems important. Defined norms (as in lecture 3 of Trefethen): for a vector space V, a norm takes any v∈V and gives you a real number ‖v‖ satisfying three properties:

* Positive definite: ‖v‖≥0, and =0 if and only if v=0
* Scaling: ‖αv‖ = |α|⋅‖v‖ for any scalar α.
* [Triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality): ‖v+w‖≤‖v‖+‖w‖

There are many norms, for many different vector spaces. Gave examples of norms of column vectors: _Lₚ_ norms (usually _p_ = 1, 2, or ∞) and weighted L₂ norms.  A (complete) normed vector space is called a [Banach space](https://en.wikipedia.org/wiki/Banach_space), and these error concepts generalize to f(x) when f and x are in any Banach spaces (including scalars, column vectors, matrices, …though infinite-dimensional Banach spaces are trickier).

Especially important in numerical analysis are functions where the inputs and/or outputs are matrices, and for these cases we need matrix norms. The most important matrix norms are those that are related to matrix operations. Started with the Frobenius norm. Related the Frobenius norm ‖A‖F to the square root of the sum of eigenvalues of A'A, which are called the _singular values_ σ²; we will do much more on singular values later, but for now noted that they equal the squared eigenvalues of A if A'A (Hermitian). Also defined the induced matrix norm, and bounded it below by the maximum eigenvalue magnitude of A (if A is square). For the L₂ induced norm, related it (without proof for now) to the maximum singular value.  A useful property of the induced norm is ‖AB‖≤‖A‖⋅‖B‖.  Multiplication by a unitary matrix Q (Q' = Q⁻¹) preserves both the Frobenius and L₂ induced norms.

Equivalence of norms. Described fact that any two norms are equivalent up to a constant bound, and showed that this means that **stability in one norm implies stability in all norms.** Sketched proof (_only skimmed this_): (i) show we can reduce the problem to proving any norm is equivalent to e.g. L₁ on (ii) the unit circle; (iii) show any norm is continuous; and (ii) use a result from real analysis: a continuous function on a closed/bounded (compact) set achieves its maximum and minimum, the [extreme value theorem](http://en.wikipedia.org/wiki/Extreme_value_theorem). See notes handout.

**Further reading:** Trefethen, lecture 3. If you don't immediately recognize that A'A has nonnegative real eigenvalues (it is positive semidefinite), now is a good time to review your linear algebra; see also Trefethen lecture 24.

### Lecture 5 (Feb 12)

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

Calculated condition number for square root, summation, and matrix-vector multiplication, as well as solving Ax=b, similar to the book. Defined the condition number of a matrix: for f(x)=Ax, the condition number is ‖A‖⋅‖x‖/‖Ax‖, which is bounded above by κ(A)=‖A‖⋅‖A⁻¹‖.

Related matrix _L_2 norm to eigenvalues of B\=A\*A. B is obviously Hermitian (B\*\=B), and with a little more work showed that it is positive semidefinite: _x_\*B_x_≥0 for any _x_. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian and positive-semidefinite matrices. Hermitian means that the eigenvalues are real, the eigenvectors are orthogonal (or can be chosen orthogonal). Also, a Hermitian matrix must be diagonalizable (I skipped the proof for this; we will prove it later in a more general setting). Positive semidefinite means that the eigenvalues are nonnegative.

Proved that, for a Hermitian matrix B, the **Rayleigh quotient** R(x)=x\*Bx/x\*x is bounded above and below by the largest and smallest eigenvalues of B (the "min–max theorem"). Hence showed that the L2 induced norm of A is the square root of the largest eigenvalue of B\=A\*A. Similarly, showed that the L₂ induced norm of A⁻¹, or more generally the supremum of ‖x‖/‖Ax‖, is equal to the square root of the inverse of the smallest eigenvalue of A\*.A

Understanding norms and condition numbers of matrices therefore reduces to understanding the eigenvalues of A\*A (or AA\*). However, looking at it this way is unsatisfactory for several reasons. First, we would like to solve one eigenproblem, not two. Second, working with things like A\*A explicitly is often bad numerically, because it squares the condition number \[showed that κ(A\*A)=κ(A)2\] and hence exacerbates roundoff errors. Third, we would really like to get some better understanding of A itself. All of these concerns are addressed by the **singular value decomposition** or **SVD**, which we will derive next time.

**Further reading:** Trefethen, lectures 12, 14, 15, 24.  See any linear-algebra textbook for a review of eigenvalue problems, especially Hermitian/real-symmetric ones.  See also [these notes from 18.06](https://nbviewer.jupyter.org/github/stevengj/1806/blob/fall18/lectures/Conditioning.ipynb).

### Lecture 6 (Feb 14)

* [pset 1 solutions](psets/pset1sol.pdf) and accompanying [Julia notebook](psets/pset1sol.ipynb)
* [pset 2](psets/pset2.pdf), due Fri. Feb 28, 2020, at 3pm via Stellar.

Proved that, for a Hermitian matrix B, the **Rayleigh quotient** R(x)=x\*Bx/x\*x is bounded above and below by the largest and smallest eigenvalues of B (the "min–max theorem"). Hence showed that the L2 induced norm of A is the square root of the largest eigenvalue of B\=A\*A. Similarly, showed that the L₂ induced norm of A⁻¹, or more generally the supremum of ‖x‖/‖Ax‖, is equal to the square root of the inverse of the smallest eigenvalue of A\*A

Understanding norms and condition numbers of matrices therefore reduces to understanding the eigenvalues of A\*A (or AA\*). However, looking at it this way is unsatisfactory for several reasons. First, we would like to solve one eigenproblem, not two. Second, working with things like A\*A explicitly is often bad numerically, because it squares the condition number \[showed that κ(A\*A)=κ(A)²\] and hence exacerbates roundoff errors. Third, we would really like to get some better understanding of A itself. All of these concerns are addressed by the **singular value decomposition** or **SVD**.

Explicitly constructed SVD (both "thin" and thick/unitary) in terms of eigenvectors/eigenvalues of A\*A and _AA_\*. Recall from last time that we related the singular values to induced L₂ norm and condition number.

Talked a little about the SVD and low-rank approximations (more on this in homework), e.g. graphically illustrated via [image compression](http://timbaumann.info/svd-image-compression-demo/), or [principal component analysis](http://en.wikipedia.org/wiki/Principal_component_analysis) (PCA), e.g. illustrated with this [nice demo of human locomotion analysis](https://www.biomotionlab.ca/html5-bml-walker/).

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 7 (Feb 18: Tuesday `==` MIT Monday)

**Handouts:** [least-squares IJulia notebook](https://github.com/mitmath/18335/blob/master/notes/Least-squares.ipynb)

Introduced least-squares problems, gave example of polynomial fitting, gave normal equations, and derived them from the condition that the L2 error be minimized.

Discussed solution of normal equations. Discussed condition number of solving normal equations directly, and noted that it squares the condition number—not a good idea if we can avoid it.

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Explained why, if we can do it accurately, this will give a good way to solve least-squares problems.

**Further reading:** Trefethen, lectures 7, 8, 18, 19

### Lecture 8 (Feb 19)

* Per Persson's [2006 18.335 Gram-Schmidt notes](notes/lec5.pdf)
* [Gram-Schmidt IJulia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Gram-Schmidt.ipynb)

Gave the simple, but unstable, construction of the Gram-Schmidt algorithm, to find a QR factorization.

Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example, especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt and argued how it (mostly) fixes the problem. Numerical examples (see notebook).

Re-interpret Gram-Schmidt in matrix form as Q = AR1R2..., i.e. as multiplying A on the right by a sequence of upper-triangular matrices to get Q. The problem is that these matrices R may be very badly conditioned, leading to an inaccurate Q and loss of orthogonality. Instead of multiplying A on the right by R's to get Q, however, we can instead multiply A on the left by Q's to get R. This leads us to the Householder QR algorithm.

**Further reading:** Trefethen, lectures 7, 8, 18, 19. The [Wikipedia Gram-Schmidt article](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) is also nice. It turns out that modified GS is backwards stable in the sense that the product QR is close to A, i.e. the function f(A) = Q\*R is backwards stable in MGS; this is why solving systems with Q,R (appropriately used as discussed in Trefethen lecture 19) is an accurate approximation to solving them with A. For a review of the literature on backwards-stability proofs of MGS, see e.g. [this 2006 paper by Paige et al.](https://epubs.siam.org/doi/abs/10.1137/050630416) \[_SIAM J. Matrix Anal. Appl._ **28**, pp. 264-284\].
### Lecture 9 (Feb 21)

Guest lecture by Prof. [Alan Edelman](http://math.mit.edu/~edelman/): the Generalized SVD (GSVD).  Least-square problems (via QR or SVD) and different viewpoints on linear regression: linear algebra, optimization, statistics, machine learning.

**Further reading:** Trefethen, lectures 7, 11.  Edelman and Wang (2019), [The GSVD: Where are the ellipses?](https://arxiv.org/abs/1901.00485).

### Lecture 10 (Feb 24)

* [Householder QR notes](notes/lec6handout6pp.pdf) from Per Persson.

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Show how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

Finished Householder QR derivation, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

Operation count for Gram-Schmidt (2mn²) and Householder (2mn² - 2n³/3), using the simple "graphical" estimation method from Trefethen. Evidently, Householder is at least as accurate as modified GS while being slightly faster. But does fewer operations really mean it is faster?

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 11 (Feb 26)

(Start by finishing operation counts from last lecture.)

* performance experiments with matrix multiplication ([one-page](notes/matmuls-handout.pdf) or [full-size](notes/matmuls.pdf) versions)
* [ideal-cache terminology](notes/ideal-cache.pdf)

Finished Householder QR derivation, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Gave flop count, showed that we don't need to explicitly compute Q if we store the Householder reflector vectors.

Counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This leads us to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(n³/√Z) cache complexity.

Discussed some practical difficulties of the blocked matrix multiplication: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS).

**Further reading:** Wikipedia has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/). [Cache-oblivious algorithms](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911), describing ideal cache model and analysis for various algorithms, by Frigo, Leiserson, Prokop, and Ramachandran (1999). [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](https://www.mathworks.com/company/newsletters/articles/matlab-incorporates-lapack.html). The MIT course [6.172](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2010/index.htm) has two lecture videos ([first](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2010/video-lectures/lecture-8-cache-efficient-algorithms) and [second](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2010/video-lectures/lecture-9-cache-efficient-algorithms-ii)) on cache-efficient algorithms, including a discussion of matrix multiplication.

### Lecture 12 (Feb 28)

* experiments with cache-oblivious matrix-multiplication ([handout](notes/oblivious-matmul-handout.pdf) or [full-size slides](notes/oblivious-matmul.pdf))
* [IJulia matrix-multiplication notebook](notes/Memory-and-Matrices.ipynb)
* [pset 2 solutions](psets/pset2sol.pdf) and [IJulia notebook](psets/pset2sol.ipynb)
* [pset 3](psets/pset3.pdf) (due Fri 13 March)

Introduced the concept of optimal cache-oblivious algorithms. Discussed cache-oblivious matrix multiplication in theory and in practice (see handout and Frigo et. al paper above).

Discussion of spatial locality and cache lines, with examples of dot products and matrix additions (both of which are "level 1 BLAS" operations with no temporal locality); you'll do more on this in pset 3.

**Further reading:** Frigo et al. paper from previous lecture. ATLAS web page above. See [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007) on the difficulty of optimizing for the last level of cache (the registers) in matrix multiplication (compared to FFTs), and why a simple cache-oblivious algorithm is no longer enough. See e.g. the Wikipedia article on [row-major and column-major order](http://en.wikipedia.org/wiki/Row-major_order).

### Lecture 13 (March 2)

Finished cache and memory discussion from last lecture's notebook.

Review of **Gaussian elimination**. Reviewed the fact (from 18.06) that this givs an A=LU factorization, and that we then solve Ax=b by solving Ly=b (doing the same steps to b that we did to A during elimination to get y) and then solving Ux=y (backsubstitution). Emphasized that you should **almost never compute A⁻¹** explicitly. It is just as cheap to keep L and U around, since triangular solves are essentially the same cost as a matrix-vector multiplication. Computing A⁻¹ is usually a mistake: you can't do anything with A⁻¹ that you couldn't do with L and U, and you are wasting both computations and accuracy in computing A⁻¹. A⁻¹ is useful in abstract manipulations, but whenever you see "x=A⁻¹b" you should interpret it for computational purposes as solving Ax=b by LU or some other method.

**Further reading:** Trefethen, lectures 20–22.

### Lecture 14 (March 4)

Introduced partial pivoting, and pointed out (omitting bookkeeping details) that this can be expressed as a PA=LU factorization where P is a permutation. Began to discuss backwards stability of LU, and mentioned example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

Discussed Cholesky factorization, which is Gaussian elimation for the special case of Hermitian positive-definite matrices, where we can save a factor of two in time and memory. More generally, if the matrix A has a special form, one can sometimes take advantage of this to have a more efficient Ax=b solver, for example: Hermitian positive-definite (Cholesky), tridiagonal or banded (linear-time solvers), lower/upper triangular (forward/backsubstitution), sparse (mostly zero—sparse-direct and iterative solvers, to be discussed later; typically only worthwhile when the matrix is much bigger than 1000×1000).

**Further reading:** Trefethen, lectures 20–23.   See all of the [special cases of LAPACK's linear-equation solvers](http://www.netlib.org/lapack/lug/node38.html).

### Lecture 15 (March 6)

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial, mentioned extensions to generalized eigenproblems and SVDs. Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization.

Discussed diagonalization, defective matrices, and the generalization ot the Schur factorization. Proved (by induction) that every (square) matrix has a Schur factorization, and that for Hermitian matrices the Schur form is real and diagonal.

Pointed out that an "LU-like" algorithm for eigenproblems, which computes the exact eigenvalues/eigenvectors (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists (or can _ever_ exist) to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Used the [companion matrix](http://en.wikipedia.org/wiki/Companion_matrix) to show that polynomial root finding is equivalent to the problem of finding eigenvalues. Mentioned the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

As a result, all eigenproblem methods must be _iterative_: they must consist of improving an initial guess, in successive steps, so that it converges towards the exact result to _any desired accuracy_, but never actually reaches the exact answer in general. A simple example of such a method is Newton's method, which can be applied to iteratively approximate a root of any nonlinear function to any desired accuracy, given a sufficiently good initial guess.

However, finding roots of the characteristic polynomial is generally a terrible way to find eigenvalues. Actually computing the characteristic polynomial coefficients and then finding the roots somehow (Newton's method?) is a disaster, incredibly ill-conditioned: gave the example of [Wilkinson's polynomial](http://en.wikipedia.org/wiki/Wilkinson%27s_polynomial). If we can compute the characteristic polynomial values implicitly somehow, directly from the determinant, then it is not too bad (if you are looking only for eigenvalues in some known interval, for example), but we haven't learned an efficient way to do that yet. The way LAPACK and Matlab actually compute eigenvalues, the QR method and its descendants, wasn't discovered until 1960.

**Further reading:** Trefethen, lecture 24, 25. See [this Wilkinson polynomial Julia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring15/notes/Wilkinson-Polynomial.ipynb) for some experiments with polynomial roots in Julia, as well as [this more recent 18.06 notebook](https://nbviewer.jupyter.org/github/stevengj/1806/blob/fall18/lectures/Eigenvalue-Polynomials.ipynb).


### Lecture 16 (March 9)

The key to making most of the eigensolver algorithms efficient is reducing A to **Hessenberg form**: A=QHQ\* where H is upper triangular plus one nonzero value below each diagonal. Unlike Schur form, Hessenberg factorization _can_ be done exactly in a finite number of steps (in exact arithmetic), Θ(m³) steps to be precise. H and A are similar: they have the same eigenvalues, and the eigenvector are related by Q. And once we reduce to Hessenberg form, all the subsequent operations we might want to do (determinants, LU or QR factorization, etcetera), will be fast. In the case of Hermitian A, showed that H is Hermitian tridiagonal; in this case, most subsequent operations (even LU and QR factorization) will be Θ(m) (you will show this in HW)!  (In fact, you can always arrange that H is a *real* tridiagonal matrix even if A is complex Hermitian.)

Reviewed power method for biggest-|λ| eigenvector/eigenvalue and its the convergence rate.   To get the eigenvalue, we use the Rayleigh quotient of our eigenvector estimate.  Showed that (related to the min–max theorem), for a Hermitian matrix the eigenvectors are all *extrema* of the Rayleigh quotient, and this means that the eigenvalue estimates converge at *twice* the rate (i.e. squared error) of the eigenvectors.

**Further reading:** Trefethen, lecture 25, 26, and and Per Persson's [2006 notes](notes/lec14handout6pp.pdf) on Hessenberg factorization.  The Julia LinearAlgebra provides functions `schur`, `eigen`, and `hessenberg` for the Schur, eigenvector, and Hessenberg factorizations respectively.  (For a large real-symmetric matrix, Hessenberg factorization is about 5× faster than diagonalization, but is only about 40% faster than finding the eigenvalues and not eigenvectors.)

### Lecture 17 (March 11)

Discussed how to use the power method to get multiple eigenvalues/vectors of Hermitian matrices by "deflation" (using orthogonality of eigenvectors). Discussed how, in principle, QR factorization of _Aⁿ_ for large _n_ will give the eigenvectors and eigenvalues in descending order of magnitude, but how this is killed by roundoff errors.

Unshifted QR method: proved that repeatedly forming A=QR, then replacing A with RQ (as in pset 3) is equivalent (in exact arithmetic) to QR factorizing _Aⁿ_. But since we do this while only multiplying repeatedly by unitary matrices, it is well conditioned and we get the eigenvalues accurately.

To make the QR method faster, we first reduce to Hessenberg form; you will show in pset 3 that this is especially fast when A is Hermitian and the Hessenberg form is tridiagonal. Second, we use shifts.  In particular, the worst case for the QR method, just as for the power method, is when eigenvalues are nearly equal. We can fix this by shifting.  Brief discussion of shifted QR and the Wilkinson shift.

**Further reading:** See Trefethen, lectures 27–30, and Per Persson's [2006 notes](notes/lec15handout6pp.pdf) on power/inverse/Rayleigh iteration and on QR ([part 1](notes/lec15handout6pp.pdf) and [part 2](notes/lec16handout6pp.pdf)).

### Lecture 18 (March 30)

* **Note**: This and all future lectures will be via [Zoom videoconference](https://mit.zoom.us/j/283159937) (all registered students should have received an email with the details).  Lectures will continue to be [recorded and posted](https://video.odl.mit.edu/collections/5e0691b4c35e4672b7c4613522814c35/), and "whiteboard" notes from the lectures will also be posted.

* [lecture notes](https://www.dropbox.com/s/l8ot1wc19r29lx6/18.335%20spring%202020.pdf?dl=0) — all subsequent lecture notes will be here also
* [pset 3 solutions](psets/pset3sol.pdf)
* [pset 4](psets/pset4.pdf) (due Monday April 6)

New topic: **iterative algorithms**, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix-vector products but cannot (practically) mess around with the specific entries of _A_.

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Anv and throws away the previous ones. Introduced Krylov subspaces, and the idea of Krylov subspace methods: find the best solution in the whole subspace 𝒦ₙ spanned by {b,Ab,...,Aⁿ⁻¹b}.

Presented the **Arnoldi** algorithm. Unlike the book, I _start_ the derivation by viewing it as a modified Gram–Schmidt process, and prove that it is equivalent (in exact arithmetic) to GS on {b,b,Ab,A²b,...}, so it is an orthonormal basis for 𝒦ₙ.  Then we showed that this corresponds to partial Hessenberg factorization: AQₙ = QₙHₙ + h₍ₙ₊₁₎ₙqₙ₊₁eₙᵀ where Hₙ is upper-Hessenberg.

Discussed what it means to find the "best" solution in the Krylov subspace 𝒦ₙ. Discussed the general principle of Rayleigh–Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method).

For Hermitian matrices A, I showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace, via the min–max theorem.  In this sense, at least for Hermitian matrices, the Ritz vectors are *optimal* in the sense of maximizing (or minimizing) the Rayleigh quotient in the Krylov space.  Another sense in which they are optimal for Hermitian A is that the Ritz vectors/values minimize ‖AV-VD‖₂ over all possible orthonormal bases V of the Krylov space and all possible diagonal matrices D (see the Bai notes below for a proof).

**Further reading:** Trefethen, lecture 31, 32, 33, 34. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html), are useful surveys of iterative methods.   [This 2009 course](https://web.cs.ucdavis.edu/~bai/Winter09/) on numerical linear algebra by Zhaojun Bai has [useful notes](https://web.cs.ucdavis.edu/~bai/Winter09/krylov.pdf) on Krylov methods, including a discussion of the Rayleigh–Ritz procedure.

### Lecture 19 (April 1)

* [Arnoldi-iteration experiments](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Arnoldi.ipynb)
* [notes on restarting Arnoldi](notes/restarting-arnoldi.pdf)

Showed that in the case where A is Hermitian, Hₙ is Hermitian as well, so Hₙ is tridiagonal and most of the dot products in the Arnoldi process are zero.  Hence Arnoldi reduces to a three-term recurrence, and the Ritz matrix is tridiagonal.  This is called the **Lanczos** algorithm.

Showed some computational examples (notebook above) of Arnoldi convergence. Discussed how rounding problems cause a loss of orthogonality in Lanczos, leading to "ghost" eigenvalues where extremal eigenvalues re-appear. In Arnoldi, we explicitly store and orthogonalize against all qj vectors, but then another problem arises: this becomes more and more expensive as n increases.

A solution to the loss of orthogonality in Lanczos and the growing computational effort in Arnoldi is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors.   If we restart with k=1 *every* step, then we essentially have the power method, so while restarting makes the convergence worse the algorithm still converges, and converges significantly faster than the power method for k>1.

**Further reading:** Trefethen, lecture 36. See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 20 (April 3)

* [notes on restarting Arnoldi](notes/restarting-arnoldi.pdf)

A solution to the loss of orthogonality in Lanczos and the growing computational effort in Arnoldi is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors.   If we restart with k=1 *every* step, then we essentially have the power method, so while restarting makes the convergence worse the algorithm still converges, and converges significantly faster than the power method for k>1.

Explained why restarting properly is nontrivial for k>1: we need to restart in such a way that maintains the Arnoldi (or Lanczos) property AQₙ = QₙHₙ + rₙeₙᵀ where Hₙ is upper-Hessenberg, rₙ is orthogonal to Qₙ, and eₙᵀ is only nonzero in the last column.  In particular, showed that the "obvious" naive restarting algorithm using k Ritz vectors *almost* works, but messes up the eₙᵀ property.  See the notes.

Introduced the **GMRES** algorithm: compute the basis Qₙ for 𝒦ₙ as in Arnoldi, but then minimize the residual ‖Ax-b‖₂ for x∈𝒦ₙ using this basis.  This yields a small (n+1)×n least-squares problem involving Hₙ.

**Further reading:** Trefethen, lectures 34–36. See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 21 (April 6)

* [pset 4 solutions](psets/pset4sol.pdf)
* [Arnoldi-iteration experiments](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Arnoldi.ipynb)

Discussed the convergence rate of GMRES and Arnoldi in terms of **polynomial** approximations. Following the book closely, showed that the relative errors (the residual norm ‖Ax-νx‖ or ‖Ax-b‖) can be bounded by minimizing the value p(λ) of a polynomial p(z) evaluated at the eigenvalues, where p has degree _n_ after the _n_\-th iteration. In Arnoldi, the λⁿ coefficient of p(λ) is 1, whereas in GMRES the constant coefficient p(0)=1. (There is also a factor of the condition number of the eigenvector matrix in GMRES, so it is favorable for the eigenvectors to be near-orthogonal, i.e for the matrix to be near-[normal](http://en.wikipedia.org/wiki/Normal_matrix).)

Using this, we can see that the most favorable situation occurs when the eigenvalues are grouped into a small cluster, or perhaps a few small clusters, since we can then make p(λ) small with a low-degree polynomial that concentrates a few roots in each cluster. This meanst that Arnoldi/GMRES will achieve small errors in only a few iterations. Morever we can see that a _few_ outlying eigenvalues aren't a problem, since p(z) will quickly attain roots there and effectively eliminate those eigenvalues from the error—this quantifies the intuition that Krylov methods "improve the condition number" of the matrix as the iteration proceeds, which is why the condition-number bounds on the error are often pessimistic. Conversely, the worst case will be when the eigenvalues are all spread out uniformly in some sense. Following examples 35.1 and 35.2 in the book, you can actually have two matrices with very similar small condition numbers but very different GMRES convergence rates, if in one case the eigenvalues are clustered and in the other case the eigenvalues are spread out in a circle around the origin (i.e. with clustered magnitudes |λ| but different phase angles).

Contrasted convergence with Arnoldi/Lanczos. As in the book, showed that Arnoldi also minimizes a polynomial on the eigenvalues, except that in this case the coefficient of the _highest_ degree term is constrained to be 1. (We proceeded somewhat backwards from the book: the book started with polynomial minimization and derived the Rayleigh-Ritz eigenproblem, whereas we went in the reverse direction.) Showed that this set of polynomials is shift-invariant, which explains why (as we saw experimentally) Arnoldi convergence is identical for A and A+μI. This is _not_ true for GMRES, and hence GMRES convergence is not shift-invariant—this is not suprising, since solving Ax=b and (A+μI)x=b can be very different problems.

Showed some examples of Arnoldi's minimizing polynomial (which turns out to be exactly the characteristic polynomial of the Ritz matrix Hₙ) in the notebook above.

**Further reading:** Trefethen, lectures 34, 35, 40.

### Lecture 22 (April 8)

Finished writing GMRES convergence in terms of polynomials, and contrasted it to Arnoldi/Lanczos.

Like Arnoldi/Lanczos, if GMRES does not converge quickly we must generally **restart** it, usually with a subspace of dimension 1; restarting GMRES repeatedly after k steps is called **GMRES(k)**. Unfortunately, unlike Arnoldi for the largest |λ|, restarted GMRES is _not guaranteed to converge_. If it doesn't converge, we must do something to speed up convergence: preconditioning (next time).

In many practical cases, unfortunately, the eigenvalues of A are _not_ mostly clustered, so convergence of GMRES may be slow (and restarted GMRES may not converge at all).

The solution to this problem is **preconditioning**: finding an (easy-to-compute) M such that MA (left preconditioning) or AM (right preconditioning) has clustered eigenvalues (solving MAx=Mb or AMy=b with x=My, respectively). Essentially, one can think of M as a crude approximation for A⁻¹ (or the inverse of a crude approximation of A that is easy to invert). Brief summary of some preconditioning ideas: multigrid, incomplete LU/Cholesky, Jacobi/block-Jacobi. (Since Jacobi preconditioners only have short-range interactions, they tend not to work well for matrices that come from finite-difference/finite-element discretizations on grids, but they can work well for diagonally dominant matrices that arise in spectral and integral-equation methods.

**Conjugate-gradient (CG) methods:**

Began discussing gradient-based iterative solvers for Ax=b linear systems, starting with the case where *A is Hermitian positive-definite*. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=xᵀAx-xᵀb-bᵀx, or equivalently f(x)=‖x-xₑ‖² where xₑ is the exact solution and ‖⋅‖ is the *A-weighted* L2 norm. Then, we perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method. Discussed successive line minimization of f(x), and in particular the steepest-descent choice of d=b-Ax at each step. Explained how this leads to "zig-zag" convergence by a simple two-dimensional example, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

**Further reading:** Trefethen, lectures 34, 35, 40. The convergence of GMRES for very non-normal matrices is a complicated subject; see e.g. [this paper on GMRES for defective matrices](http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.48.1733) or [this paper surveying different convergence estimates](http://eprints.maths.ox.ac.uk/1290/). Regarding convergence problems with GMRES, see this 2002 presentation by Mark Embree on [Restarted GMRES dynamics](http://www.caam.rice.edu/~embree/householder.pdf). [Cullum (1996)](http://link.springer.com/article/10.1007%2FBF02127693) reviews the relationship between GMRES and a similar algorithm called FOM that is more Galerkin-like (analogous to Rayleigh–Ritz rather than least-squares).  **Preconditioning:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html), and e.g. _[Matrix Preconditioning Techniques and Applications](http://books.google.com?id=d9UdanCqJ1QC)_ by Ke Chen (Cambridge Univ. Press, 2005).   For Hermitian A, we can also specialize the GMRES algorithm analogous to Lanczos, giving MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book. **Conjugate gradients:** Trefethen, lecture 38 on CG. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.

### Lecture 23 (April 10)

Continued derivation of conjugate gradient, starting with the steepest-descent method and then moving on to minimizing over the whole Krylov space of all previous search directions.

Discussed convergence of conjugate gradient, connecting it to minimizing polynomials at the eigenvalues similar to GMRES.

Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of MA is not actually a problem as long as M is Hermitian positive-definite). Mentioned the connection to approximate Newton methods (which is easy to see if we consider preconditioned steepest-descent with M approximately A⁻¹).

### Take-home midterm (April 10)

* [midterm](psets/midterm.pdf) and [solutions](psets/midtermsol.pdf)

The 18.335 midterm exam will be posted at 4:30pm (EDT) on Friday April 10 and will be due at 4:30pm (EDT) on Saturday April 11.  The exam is **open notes** and **open book** (including any material posted for the class: pset solutions and handouts).  **No other materials** may be used (**closed Internet**).  The exam will be designed to take **roughly 2 hours,** but you can take *as much time as you want* within the 24-hour time slot.

It will cover everything in 18.335 up to and including **pset 4** and **lecture 19**.

* my previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf).

### Lecture 24 (April 13)

Finished derivation of conjugate gradient.

Discussed convergence of conjugate gradient, connecting it to minimizing polynomials at the eigenvalues similar to GMRES.

Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of MA is not actually a problem as long as M is Hermitian positive-definite). Mentioned the connection to approximate Newton methods (which is easy to see if we consider preconditioned steepest-descent with M approximately A⁻¹).

### Lecture 25 (April 13)

* [notes on sparse-direct solvers](notes/lec21handout6pp.pdf) from Fall 2006
* [IJulia notebook on sparse-direct solvers](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring19/notes/Nested-Dissection.ipynb)

As an alternative to GMRES for non-Hermitian problems, considered the biCG algorithm. Derived it as in the van der Vorst notes below: as PCG on the Hermitian-indefinite matrix B=\[0,A;A\*,0\] with the "preconditioner" \[0,I;I,0\] (in the unpreconditioned case). Because this is Hermitian, there is still a conjugacy condition and it is still a Krylov method. Because it is indefinite, we are finding a saddle point and not a minimum of a quadratic, and _breakdown_ can occur if one of the denominators (e.g. d\*Bd) becomes zero. (This is the same as algorithm 39.1 in Trefethen, but derived very differently.) Because of this, you should almost never use the plain biCG algorithm. However, the biCG idea was the starting point for several "stabilized" refinements, culminating in biCGSTAB(L) that try to avoid breakdown by combining biCG with elements of GMRES. Another algorithm worth trying is the QMR algorithm.

**Sparse-direct solvers:** For many problems, there is an intermediate between the dense Θ(m3) solvers of LAPACK and iterative algorithms: for a sparse matrix A, we can sometimes perform an LU or Cholesky factorization while maintaining sparsity, storing and computing only nonzero entries for vast savings in storage and work.  One key observation is that the fill-in only depends on the pattern of the matrix, which can be interpreted as a [graph](http://en.wikipedia.org/wiki/Graph_%28mathematics%29): m vertices, and edges for the nonzero entries of A (an [adjacency matrix](http://en.wikipedia.org/wiki/Adjacency_matrix) of the graph), and sparse-direct algorithms are closely related to graph-theory problems.    How efficient the sparse-direct methods are depends on how easy it is to **partition** the graph by chopping it into pieces, and this is **easier for matrices that come from low-dimensional meshes** (e.g. discretized low-dimensional PDEs).  1d meshes are best (giving *banded* matrices with *linear* complexity), 2d meshes are still pretty good, and 3d meshes start to become challenging.  See the scalings in the handout, which are derived in the Davis book below.

Concluded with some rules of thumb about which type of solvers to use: LAPACK for small matrices (< 1000s×1000s), sparse-direct for intermediate-size sparse cases, and iterative methods for the largest problems or problems with a fast matrix⋅vector but no sparsity. One important point is that sparse-direct algorithms scale much better for sparse matrices that come from discretization of 2d PDEs than 3d PDEs. In general, some experimentation is required to find the best technique for a given problem, so software like Julia, Matlab, or the Petsc library is extremely helpful in providing a quick way to explore many algorithms.

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview of iterative methods for non-Hermitian problems can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES).  The book _[Direct Methods for Sparse Linear Systems](http://books.google.com/books?id=TvwiyF8vy3EC&lpg=PR1&ots=odauEC2c4k&dq=direct%20methods%20for%20sparse%20davis&pg=PR1#v=onepage&q&f=false)_ by Davis is a useful reference.

### Lecture 26 (Apr 17)

* [overview of optimization](notes/optimization.pdf)

Several of the iterative algorithms so far have worked, conceptually at least, by turning the original linear-algebra problem into a minimization problem. It is natural to ask, then, whether we can use similar ideas to solve more general **optimization problems**, which will be the next major topic in 18.335.

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

CG easily generalizes to the [nonlinear conjugate-gradient algorithm](https://en.wikipedia.org/wiki/Nonlinear_conjugate_gradient_method) to (locally) minimize an *arbitrary* twice-differentiable f(x): the only changes are that r=-∇f is not simply b-Ax  and that the successive line minimizations min f(x+αd) need to be done numerically (an “easy” 1d optimization problem). The key point being that, near a local minimum of a smooth function, the objective is typically roughly quadratic (via Taylor expansion), and when that happens CG greatly accelerates convergence. (Mentioned Polak–Ribiere heuristic to help "reset" the search direction to the gradient if we are far from the minimum and convergence has stalled; see the Hager survey below for many more.)

Outlined application of nonlinear CG to Hermitian eigenproblems by minimizing the Rayleigh quotient (this is convex, and furthermore we can use the Ritz vectors to shortcut both the conjugacy and the line minimization steps). The generalization of this is the [LOBPCG](http://en.wikipedia.org/wiki/LOBPCG) algorithm.

**Further reading:** There are many textbooks on [nonlinear optimization](http://www.athenasc.com/nonlinbook.html) algorithms of various sorts, including specialized books on [convex optimization](http://web.stanford.edu/~boyd/cvxbook/), [derivative-free optimization](http://bookstore.siam.org/mp08/), etcetera.  A useful review of topology-optimization methods can be found in [Sigmund and Maute (2013)](https://link.springer.com/article/10.1007/s00158-013-0978-6). There are many variants of nonlinear conjugate-gradient, mainly to avoid bad behavior far from the minimum, as surveyed by Hager and Zhang, “[A Survey of Nonlinear Conjugate Gradient Methods](http://people.cs.vt.edu/~asandu/Public/Qual2011/Optim/Hager_2006_CG-survey.pdf),” *Pacific J. Optim.* 2, pp. 35-58 (2006).  There is also a close connection between the conjugate directions of conjugate gradient and the "momentum" terms of stochastic gradient-descent methods; see e.g. [Bhaya (2004)](https://www.sciencedirect.com/science/article/abs/pii/S0893608003001709).

### Lecture 27 (Apr 22)

* [notes on adjoint methods](notes/adjoint/adjoint.pdf) to compute gradients
* [notes on adjoint methods for recurrence relations](notes/adjoint/recurrence2.pdf)
* [adjoint example notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring19/notes/adjoint/Adjoint-method.ipynb)

Introduction to **adjoint** methods and the remarkable fact that one can compute the gradient of a complicated function with about the same number of additional operations as computing the function _once_.

**Further reading:** A variant of adjoint methods is the well-known [backpropagation algorithm](https://en.wikipedia.org/wiki/Backpropagation) for neural networks, which can often be thought of as a recurrence relation (one per network layer).  Computers can sometimes now compute derivatives automatically via [automatic differentiation (AD)](https://en.wikipedia.org/wiki/Automatic_differentiation), and adjoint methods correspond to "reverse mode" AD.  For the largest-scale computational problems, solved by very complicated programs (often combining multiple external libraries), AD is still a challenge, however, and hand implementation of adjoint methods is often still required.

### Lecture 28 (Apr 24)

Adjoint methods for eigenproblems and recurrence relations, following notes from previous lecture.

### Lecture 29 (Apr 27)

Discussed some general concepts in local optimization. **Global convergence** means convergence to a _local_ optimum from any _feasible_ starting point; explained why finding the feasible region from an _infeasible_ starting point is in general as hard as global optimization. A typical **trust region** approach is to _locally approximate_ the objective and constraint functions by some _simple functions_ that are easy to optimize, optimize them within some localized trust region around a current point **x** to obtain a candidate step **y**, and then either take the step (e.g. if **y** is an improvement) and/or update the approximations and trust region (e.g. if **y** was not an improvement or the approximation and exact functions differed greatly). There are many, many algorithms that follow this general outline, but they differ greatly in what approximations they use (e.g. linear, quadratic, ...), what trust region they use, and what methods they use to update the trust region and to evaluate candidate steps. Often, the approximate functions are _convex_ so that convex-optimization methods can be used to solve the _trust-region subproblems_.

Went over a particular example of a nonlinear optimization scheme, solving the full inequality-constrained nonlinear-programming problem: the CCSA algorithms, as refined by Svanberg (2002). This is a surprisingly simple algorithm (the [NLopt](http://ab-initio.mit.edu/nlopt) implementation is only 300 lines of C code), but is robust and provably convergent, and illustrates a number of important ideas in optimization: optimizing an approximation to update the parameters **x**, guarding the approximation with trust regions and penalty terms, and optimizing via the dual function (Lagrange multipliers). Like many optimization algorithms, the general ideas are very straightforward, but getting the details right can be delicate!

Outlined the inner/outer iteration structure of CCSA, and the interesting property that it produces a sequence of feasible iterates from a feasible starting point, which means that you can stop it early and still have a feasible solution (which is very useful for many applications where 99% of optimal is fine, but feasibility is essential).

The inner optimization problem involving the approximate gᵢ functions turns out to be *much* easier to solve because it is *convex* and *separable* (gᵢ = a sum of 1d convex functions of each coordinate xⱼ).  Convexity allows us to use the technique of **duality** to turn the problem into an equivalent "dual" optimization problem, and separability makes this dual problem trivial to formulate and solve.   Began discussing the ideas of *Lagrangians* and duality using the Boyd textbook; we will continue this in the next lecture.

**Further reading:** Pages 1–10 of [Svanberg (2002) paper on CCSA algorithms](
http://dx.doi.org/10.1137/S1052623499362822) — I used the "linear and separable quadratic approximation" functions gᵢ in section 5.1; as far as I can tell the other example gᵢ functions have no general advantages.

### Lecture 30 (Apr 29)

* [slides from Boyd, chapter 5](notes/boyd-ch5-slides.pdf)

tarted by reviewing the basic idea of Lagrange multipliers to find an extremum of one function f₀(x) and one equality constraint h₁(x)=0. We instead find an extremum of L(x,ν₁)=f₀(x)+ν₁h₁(x) over x and the _Lagrange multiplier_ ν₁. The ν₁ partial derivative of L ensures h₁(x)=0, in which case L=f0 and the remaining derivatives extremize f0 along the constraint surface. Noted that ∇L=0 then enforces ∇f₀=0 in the direction parallel to the constraint, whereas perpendicular to the constraint ν₁ represents a "force" that prevents x from leaving the h₁(x)=0 constraint surface.

Generalized to the Lagrangian L(x,λ,ν) of the general optimization problem (the "primal" problem) with both inequality and equality constraints, following chapter 5 of the Boyd and Vandenberghe book (see below) (section 5.1.1).

Described the KKT conditions for a (local) optimum/extremum (Boyd, section 5.5.3). These are true in problems with strong duality, as pointed out by Boyd, but they are actually true in much more general conditions. For example, they hold under the "LICQ" condition in which the gradients of all the active constraints are linearly independents. Gave a simple graphical example to illustrate why violating LICQ requires a fairly weird optimum, at a cusp of two constraints.

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online), chapter 5. There are many sources on [Lagrange multipliers](http://en.wikipedia.org/wiki/Lagrange_multipliers) (the special case of equality constraints) online that can be found by googling.

### Lecture 31 (Apr 30)

* [notes on BFGS and quasi-Newton methods](notes/BFGS.pdf)

Began discussing quasi-Newton methods in general, and the BFGS algorithm in particular, following the notes.

**Further reading:** Wikipedia's articles on [quasi-Newton methods](http://en.wikipedia.org/wiki/Quasi-Newton_methods) and the [BFGS method](http://en.wikipedia.org/wiki/BFGS_method) have some useful links and summaries. Helpful derivations of many of the properties of BFGS updates, and many references, can be found in [this 1980 technical report by Dennis and Schnabel](http://www.cs.colorado.edu/department/publications/reports/docs/CU-CS-185-80.pdf) and for a generalization in [this 1994 paper by O'Leary and Yeremin](http://www.cs.umd.edu/~oleary/reprints/j39.pdf), for example.