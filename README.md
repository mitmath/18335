#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Spring 2021.

Syllabus
--------

**Lectures**: Monday/Wednesday/Friday 3–4pm
 (via [Zoom videoconference](https://mit.zoom.us/j/96699737160?pwd=ODZDUXY5RHZnbld6aDNHTjlxZ09HZz09)).  Lecture videos and [handwritten notes](https://www.dropbox.com/s/wxd3pwsy3ijblnp/18.335%20Spring%202021.pdf?dl=0) will be posted online.  **Office Hours:** Thursday 4–5pm (via [Zoom videoconference](https://mit.zoom.us/j/99197727490?pwd=b1BtK0FRYkx6Nkx3anZ4WEpFQW1FQT09)).  Zoom and video access requires [MIT Touchstone authentication](https://ist.mit.edu/news/zoom-release).

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of [Julia](http://julialang.org/), a Matlab-like environment (little or no prior experience required; you will learn as you go).

Launch a Julia environment in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mitmath/binder-env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18335%26urlpath%3Dtree%252F18335%252F%26branch%3Dmaster)

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). 18.335 is a graduate-level subject, however, so much more mathematical maturity, ability to deal with abstractions and proofs, and general exposure to mathematics is assumed than for 18.06!

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). ([Readable online](http://owens.mit.edu/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates.)

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 40% problem sets (about six, ~biweekly). 20% **take-home mid-term exam** (posted Thursday **Apr. 15** at 3pm and due Friday **Apr. 16** at 3pm), 40% **final project** ([one-page proposal](psets/proposal.md) due Friday March 26, project due Thursday **May 20**).

* Psets will be **submitted electronically via Canvas**.  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://piazza.com/class/kkzx1wp9ldz55x)

* my previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf), [spring 2020](https://github.com/mitmath/18335/blob/spring20/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring20/psets/midtermsol.pdf).

**TA/grader:** [Mo Chen](https://math.mit.edu/directory/profile.php?pid=2176).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will be an 8–15 page paper reviewing some interesting numerical algorithm not covered in the course. See the [18.335 final-projects page](psets/proposal.md) for more information, including topics from past semesters.

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (Feb 3)

* [video](https://mit.zoom.us/rec/share/OO-jZpJ8Oqgq1uldUFFRTonp1nTS8nZefxAdthbSYENuZbGyAZr0qLC1i02mhWEc.m158MsEBn6vBvI8t?startTime=1613591715000)
* [handwritten notes](https://www.dropbox.com/s/wxd3pwsy3ijblnp/18.335%20Spring%202021.pdf?dl=0) for this and subsequent lectures
* [pset 1](psets/pset1.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/psets/pset1.ipynb), due Monday, March 1.
* [Newton's method for square roots](notes/newton-sqrt.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Newton-Square-Roots.ipynb).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

As a starting example, considered the convergence of Newton's method (as applied to square roots); see the handout and Julia notebook above.

**Further reading:** Googling "Newton's method" will find lots of references; as usual, the [Wikipedia article on Newton's method](https://en.wikipedia.org/wiki/Newton's_method) is a reasonable starting point. Beware that the terminology for the [convergence order](https://en.wikipedia.org/wiki/Rate_of_convergence) (linear, quadratic, etc.) is somewhat different in this context from the terminology for discretization schemes (first-order, second-order, etc.); see e.g. the linked Wikipedia article. Homer Reid's [notes on machine arithmetic](http://homerreid.dyndns.org/teaching/18.330/Notes/RootFinding.pdf) for [18.330](http://homerreid.dyndns.org/teaching/18.330/) are an excellent introduction that covers several applications and algorithms for root-finding. For numerical computation in 18.335, we will be using the Julia language: see this [information on Julia at MIT](https://github.com/mitmath/julia-mit).


### Lecture 2 (Feb 19)

* [video](https://mit.zoom.us/rec/share/VU1OJIaW5sVyUDONOE9O0EDoGOMJaUxCSKoUZGd8r3kqi0H9L67_785_xSHdhQJK.KvAparctLJ79AwYH?startTime=1613764649000)
* [notes on floating-point](notes/lec8handout6pp.pdf) (18.335 Fall 2007; also [slides](notes/lec8.pdf))
* Julia [floating-point notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Floating-Point-Intro.ipynb)
* some [floating-point myths](notes/fp-myths.pdf)

New topic: **Floating-point arithmetic**

The basic issue is that, for computer arithmetic to be fast, it has to be done in hardware, operating on numbers stored in a fixed, finite number of digits (bits). As a consequence, only a _finite subset_ of the real numbers can be represented, and the question becomes _which subset_ to store, how arithmetic on this subset is defined, and how to analyze the errors compared to theoretical exact arithmetic on real numbers.

In **floating-point** arithmetic, we store both an integer coefficient and an exponent in some base: essentially, scientific notation. This allows large dynamic range and fixed _relative_ accuracy: if fl(x) is the closest floating-point number to any real x, then |fl(x)-x| < ε|x| where ε is the _machine precision_. This makes error analysis much easier and makes algorithms mostly insensitive to overall scaling or units, but has the disadvantage that it requires specialized floating-point hardware to be fast. Nowadays, all general-purpose computers, and even many little computers like your cell phones, have floating-point units.

Overview of **floating-point** representations, focusing on the IEEE 754 standard (see also handout from previous lecture). The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property of _uniform relative precision_ (for |_x_| and 1/|_x_| < than some _range_, ≈10³⁰⁰ for double precision) that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10⁻¹⁶ for double precision). There are also a few special values: ±Inf (e.g. for [overflow](https://en.wikipedia.org/wiki/Arithmetic_overflow)), [NaN](https://en.wikipedia.org/wiki/NaN), and ±0 (e.g. for [underflow](https://en.wikipedia.org/wiki/Arithmetic_underflow)).

Went through some simple examples in Julia (see notebook above), illustrating basic syntax and a few interesting tidbits.  In particular, we looked at two examples of [catastrophic cancellation](https://en.wikipedia.org/wiki/Loss_of_significance) and how it can sometimes be avoided by rearranging a calculation.

**Further reading:** Trefethen, lecture 13. [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): contains a nice discussion of floating-point myths and misconceptions.   A brief but useful summary can be found in [this Julia-focused floating-point overview](https://discourse.julialang.org/t/psa-floating-point-arithmetic/8678) by Prof. John Gibson.


### Julia tutorial (Feb 19: 5pm) — optional

* [video](https://mit.zoom.us/rec/share/Q31OQsQ_BdyRaWkdL7Yfib3Dc_uiUYXzEtqvrpjk_ePslt6QcIyvdPU9dnwBEuI.bCSR-o__1yxMIo5r?startTime=1613772007000)
* [tutorial notes online](https://github.com/mitmath/julia-mit/blob/master/README.md)
* [Julia cheat-sheet](https://github.com/mitmath/julia-mit/blob/master/Julia-cheatsheet.pdf)
* [Julia intro slides](https://github.com/mitmath/julia-mit/blob/master/Julia-intro.pdf)

On Friday, 19 February, at 5pm via Zoom, I will give an (attendance-optional!) Julia tutorial, introducing the [Julia programming language and environment](http://julialang.org/) that we will use this term. Please see the [tutorial notes online](https://github.com/mitmath/julia-mit/blob/master/README.md).

Please try to install Julia and the IJulia interface first via the abovementioned tutorial notes. Several people will be at the tutorial session to help answer installation questions. Alternatively, you can use Julia online at [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mitmath/binder-env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18335%26urlpath%3Dtree%252F18335%252F%26branch%3Dmaster) without installing anything (although running things on your own machine is usually faster and eliminates timeout frustrations).

### Lecture 3 (Feb 22)

* [video](https://mit.zoom.us/rec/share/pKyT3VxYFoKb48JS7IZcppStlgPmaSz9zstFB7WBajs9GiKcIyo_ZAySThsG_O9W.5KpNNRpxQ_OxTskw?startTime=1614023943000)
* notes on the accuracy and stability of [floating-point summation](notes/naivesum.pdf)

Continued discussion from Julia floating-point notebook of last lecture, starting with catastrophic cancellation and moving on to error accumulation in summing many floating-point numbers.

Began a more rigorous analysis of summation, accuracy, and stability (see notes).

**Further reading**: See the further reading from the previous lecture. Trefethen, lectures 14, 15, and 3. See also the Wikipedia article on [asymptotic ("big O") notation](https://en.wikipedia.org/wiki/Big_O_notation); note that for expressions like O(ε) we are looking in the limit of _small_ arguments rather than of large arguments (as in complexity theory), but otherwise the ideas are the same.  A classic paper on the accuracy of summation is Higham (1993), ["The accuracy of floating point summation"](https://doi.org/10.1137%2F0914050).

### Lecture 4 (Feb 24)

* [video](https://mit.zoom.us/rec/share/a9XKBb1ngBL3msQ9itWfoUhEZEHgLYxnJ8_EFMrRW8WD88J6RLojZPQn8J4EHxQI.Jp0Qm-3zyvyH10OH?startTime=1614196763000)
* [notes on the equivalence of norms](notes/norm-equivalence.pdf)

Continuing notes from last time, noted that the "forwards" error of summation depends on a ratio called the "condition number" that we will generalize later in the course, and in fact the forwards relative error can be *arbitrarily* large for inputs that sum to nearly zero.   This doesn't mean that the algorithm is "bad", however — in fact, *any* fixed-precision summation algorithm will have this problem.

A better way to evaluate accuracy of algorithms is given by the notion of **numerical stability**, most commonly by the concept of **backwards stability** which we now define.   We can then straightforwardly prove that the naive summation algorithm is, in fact, backwards stable (see notes).

When quantifying errors, a central concept is a **norm**, and we saw in our proof of backwards stability of summation that it is useful to be able to choose different norms in different circumstances. Defined norms (as in lecture 3 of Trefethen): for a vector space V, a norm takes any v∈V and gives you a real number ‖v‖ satisfying three properties:

* Positive definite: ‖v‖≥0, and =0 if and only if v=0
* Scaling: ‖αv‖ = |α|⋅‖v‖ for any scalar α.
* [Triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality): ‖v+w‖≤‖v‖+‖w‖

There are many norms, for many different vector spaces. Gave examples of norms of column vectors: _Lₚ_ norms (usually _p_ = 1, 2, or ∞) and weighted L₂ norms.  A (complete) normed vector space is called a [Banach space](https://en.wikipedia.org/wiki/Banach_space), and these error concepts generalize to f(x) when f and x are in any Banach spaces (including scalars, column vectors, matrices, …though infinite-dimensional Banach spaces are trickier).

Equivalence of norms. Described fact that any two norms are equivalent up to a constant bound, and showed that this means that **stability in one norm implies stability in all norms.**  See notes handout for a proof.

**Further reading:** Trefethen, lectures 14, 15, and 3. If you don't immediately recognize that A'A has nonnegative real eigenvalues (it is positive semidefinite), now is a good time to review your linear algebra; see also Trefethen lecture 24.

### Lecture 5 (Feb 26)

* [video](https://mit.zoom.us/rec/share/EaFEj2fy2ArzOttpyChRT1beSMK8C2PuKO7Bh58jGd7b1X7z7yglMnju6YJilc7w.x5osjnAtUzVpUoOt?startTime=1614369626000)

Especially important in numerical analysis are functions where the inputs and/or outputs are matrices, and for these cases we need matrix norms. The most important matrix norms are those that are related to matrix operations. Started with the Frobenius norm. Related the Frobenius norm ‖A‖F to the square root of the sum of eigenvalues of A'A, which are called the _singular values_ σ²; we will do much more on singular values later, but for now noted that they equal the squared eigenvalues of A if A'A (Hermitian). Also defined the induced matrix norm, and bounded it below by the maximum eigenvalue magnitude of A (if A is square). For the L₂ induced norm, related it (without proof for now) to the maximum singular value.  A useful property of the induced norm is ‖AB‖≤‖A‖⋅‖B‖.  Multiplication by a unitary matrix Q (Q' = Q⁻¹) preserves both the Frobenius and L₂ induced norms.

Relate backwards error to forwards error, and backwards stability to forwards error (or "accuracy" as the book calls it). Show that, in the limit of high precision, the forwards error can be bounded by the backwards error multiplied by a quantity κ, the **relative condition number**. The nice thing about κ is that it involves only exact linear algebra and calculus, and is completely separate from considerations of floating-point roundoff. Showed that, for differentiable functions, κ can be written in terms of the induced norm of the Jacobian matrix.

Calculated condition number for square root, summation, and matrix-vector multiplication, as well as solving Ax=b, similar to the book. Defined the condition number of a matrix: for f(x)=Ax, the condition number is ‖A‖⋅‖x‖/‖Ax‖, which is bounded above by κ(A)=‖A‖⋅‖A⁻¹‖.

**Further reading:** Trefethen, lectures 12, 14, 15, 24.  See any linear-algebra textbook for a review of eigenvalue problems, especially Hermitian/real-symmetric ones.  See also [these notes from 18.06](https://nbviewer.jupyter.org/github/stevengj/1806/blob/fall18/lectures/Conditioning.ipynb) for a basic overview.

### Lecture 6 (Mar 1)

* [video](https://mit.zoom.us/rec/share/2goGg3hqQ3FKzjWgzDT88I46EW2ufwYgnf4Jq_NqTuiQEjtbjMCeSRz2PiRAA0ud.jahcg47feiT9BafU?startTime=1614628812000)
* [pset 1 solutions](psets/pset1sol.pdf) and accompanying [Julia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/psets/pset1sol.ipynb)
* [pset 2](psets/pset2.pdf): due Friday March 12 at 3pm.

Related matrix L₂ norm to eigenvalues of B=AᵀA (or Āᵀ=A^\* for complex A). B is obviously Hermitian (Bᵀ=B), and with a little more work showed that it is positive semidefinite: xᵀBx≥0 for any x. Reviewed and re-derived properties of eigenvalues and eigenvectors of Hermitian and positive-semidefinite matrices. Hermitian means that the eigenvalues are real, the eigenvectors are orthogonal (or can be chosen orthogonal). Also, a Hermitian matrix must be diagonalizable (I skipped the proof for this; we will prove it later in a more general setting). Positive semidefinite means that the eigenvalues are nonnegative.

Proved that, for a Hermitian matrix B, the **Rayleigh quotient** R(x)=xᵀBx/xᵀx is bounded above and below by the largest and smallest eigenvalues of B (the "min–max theorem"). Hence showed that the L₂ induced norm of A is the square root of the largest eigenvalue of B=AᵀA. Similarly, showed that the L₂ induced norm of A⁻¹, or more generally the supremum of ‖x‖/‖Ax‖, is equal to the square root of the inverse of the smallest eigenvalue of AᵀA

Understanding norms and condition numbers of matrices therefore reduces to understanding the eigenvalues of AᵀA (or AAᵀ). However, looking at it this way is unsatisfactory for several reasons. First, we would like to solve one eigenproblem, not two. Second, working with things like AᵀA explicitly is often bad numerically, because it squares the condition number \[showed that κ(AᵀA)=κ(A)²\] and hence exacerbates roundoff errors. Third, we would really like to get some better understanding of A itself. All of these concerns are addressed by the **singular value decomposition** or **SVD**.

Explicitly constructed SVD (both "thin" and thick/unitary) in terms of eigenvectors/eigenvalues of AᵀA and AAᵀ. Recall from above that we related the singular values to induced L₂ norm and condition number.

Talked a little about the SVD and low-rank approximations (more on this in homework), e.g. graphically illustrated via [image compression](http://timbaumann.info/svd-image-compression-demo/), or [principal component analysis](http://en.wikipedia.org/wiki/Principal_component_analysis) (PCA), e.g. illustrated with this [nice demo of human locomotion analysis](https://www.biomotionlab.ca/html5-bml-walker/).

**Further reading:** Trefethen, lectures 4, 5, 11.

### Lecture 7 (Mar 3)

* [video](https://mit.zoom.us/rec/share/1JE0NH6CtgV_enNpRYBSuicV0hd_g8Vw2gjONusIHAo8ayJcI8eyXNyogTI-c9LR.J2EQJe_rZS9JIG3H?startTime=1614801542000)

Finished SVD topics from last time.

* [least-squares IJulia notebook](https://github.com/mitmath/18335/blob/spring21/notes/Least-squares.ipynb)

Introduced least-squares problems and went through some examples (notebook).

**Further reading:** Trefethen, lectures 7, 8, 18, 19

### Lecture 8 (Mar 5)

* [video](https://mit.zoom.us/rec/share/2zzBTWWYNnHPpQd70jO0YfadaqG1JgcEUG3ySICkJWLVKk_apkJLPBNJb6kAGwFb.nc370aR1-D9tXbZ0?startTime=1614974391000)

Finished least-squares notebook. Reviewed some basic consequences of SVD: κ(A) from σ max/min ratio, κ(Q)=1, κ(AᵀA)=κ(A)².  Key consequence for least-squares: normal equations formulation squares the condition number—not a good idea if we can avoid it.

Introduced the alternative of QR factorization (finding an orthonormal basis for the column space of the matrix). Explained why, if we can do it accurately, this will give a good way to solve least-squares problems.

* Per Persson's [2006 18.335 Gram-Schmidt slides](notes/lec5.pdf)
* [Gram-Schmidt IJulia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Gram-Schmidt.ipynb)

Gave the simple, but unstable, construction of the Gram-Schmidt algorithm, to find a QR factorization.

Discussed loss of orthogonality in classical Gram-Schmidt, using a simple example (see slides), especially in the case where the matrix has nearly dependent columns to begin with. Showed modified Gram-Schmidt and argued how it (mostly) fixes the problem. (For more numerical examples, see the notebook.)

**Further reading:** Trefethen, lectures 7, 8, 18, 19. The [Wikipedia Gram-Schmidt article](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) is also nice. It turns out that modified GS is backwards stable in the sense that the product QR is close to A, i.e. the function f(A) = QᵀR is backwards stable in MGS; this is why solving systems with Q,R (appropriately used as discussed in Trefethen lecture 19) is an accurate approximation to solving them with A. For a review of the literature on backwards-stability proofs of MGS, see e.g. [this 2006 paper by Paige et al.](https://epubs.siam.org/doi/abs/10.1137/050630416) \[_SIAM J. Matrix Anal. Appl._ **28**, pp. 264-284\].

### Lecture 9 (Mar 9: **Tuesday** is an "MIT Monday")

* [video](https://mit.zoom.us/rec/share/zIk3UezniG7SjYrftyquPG7PVJtmROO_21WgM2Rx6AReijSVs6hCd0uh7BlmnB-Q.LcNG3YNPs5AaGrfm?startTime=1615320002000)
* [Householder QR notes](notes/lec6handout6pp.pdf) from Per Persson.

Floating-point operation (**flop**) count for classical or modified Gram–Schmidt.

Re-interpret Gram-Schmidt in matrix form as Q = AR₁R₂..., i.e. as multiplying A on the right by a sequence of upper-triangular matrices to get Q. The problem is that these matrices R may be very badly conditioned, leading to an inaccurate Q and loss of orthogonality. Instead of multiplying A on the right by R's to get Q, however, we can instead multiply A on the left by Q's to get R.  In homework (pset 2), you will show that *any* algorithm consisting of multiplying by a sequence of Q's is backwards stable! This leads us to the Householder QR algorithm.

Introduced Householder QR, emphasized the inherent stability properties of multiplying by a sequence of unitary matrices (as shown in pset 2). Show how we can convert a matrix to upper-triangular form (superficially similar to Gaussian elimination) via unitary Householder reflectors.

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 10 (Mar 10)

* [video](https://mit.zoom.us/rec/share/mGMbqDRsMaUCXae54EBKfiB7pU-q7J3MoldyLIPqSdEne-_Sfpxre8RvTLi6l6kf.dPGZhSCnafJtz8-U)

Finished Householder QR derivation from last time, including the detail that one has a choice of Householder reflectors...we choose the sign to avoid taking differences of nearly-equal vectors. Emphasized that we don't need to explicitly compute Q if we instead store the Householder reflector vectors, and can still compute Qx and Qᵀx quickly.

Operation count for Gram-Schmidt (2mn²) vs. Householder (2mn² - 2n³/3).  Noted that associativity matters in matrix products: there is a big difference in computational cost between v(vᵀX) and (vvᵀ)X! Evidently, Householder is at least as accurate as modified GS while being slightly faster. But does fewer operations really mean it is faster?

* performance experiments with matrix multiplication ([one-page](notes/matmuls-handout.pdf) or [full-size](notes/matmuls.pdf) versions)

Counting arithmetic operation counts is no longer enough. Illustrate this with some performance experiments on a much simpler problem, matrix multiplication (see handouts). This leads us to analyze memory-access efficiency and caches and points the way to restructuring many algorithms.

**Further reading:** Trefethen, lectures 7, 8, 10, 16.

### Lecture 11 (Mar 12)

* [video](https://mit.zoom.us/rec/share/PvQ9R5p3v4NBiUS7xGjcBvPoeHQDaKwqkwAiMHYXNvZKxameHHSSdNRBd0YMdqaF.Ineu4sDc_TkW3dMZ?startTime=1615579182000)
* [pset 2 solutions](psets/pset2sol.pdf) and [IJulia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/psets/pset2sol.ipynb)
* [pset 3](psets/pset3.pdf): due Friday, March 26 at 3pm
* [IJulia matrix-multiplication notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Memory-and-Matrices.ipynb)
* [ideal-cache terminology](notes/ideal-cache.pdf)

Outline of the memory hierarchy: CPU, registers, L1/L2 cache, main memory, and presented simple 2-level ideal-cache model that we can analyze to get the basic ideas.

Analyzed cache complexity of simple row-column matrix multiply, showed that it asymptotically gets no benefit from the cache. Presented blocked algorithm, and showed that it achieves optimal Θ(n³/√Z) cache complexity.

Discussed some practical difficulties of the blocked matrix multiplication: algorithm depends on cache-size _Z_, and multi-level memories require multi-level blocking. Discussed how these ideas are applied to the design of modern linear-algebra libraries (LAPACK) by building them out of block operations (performed by an optimized BLAS).

**Further reading:** Wikipedia has a reasonable [introduction to memory locality](http://en.wikipedia.org/wiki/Locality_of_reference) that you might find useful. The optimized matrix multiplication shown on the handouts is called ATLAS, and you can find out more about it on the [ATLAS web page](http://math-atlas.sourceforge.net/). The ["Cache-oblivious algorithms"](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.7911) paper (1999) describes the ideal cache model and analysis for various algorithms. [Notes on the switch from LINPACK to LAPACK/BLAS in Matlab](https://www.mathworks.com/company/newsletters/articles/matlab-incorporates-lapack.html). The MIT course [6.172](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/) has two lecture videos ([first](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-videos/lecture-14-caching-and-cache-efficient-algorithms/) and [second](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-172-performance-engineering-of-software-systems-fall-2018/lecture-videos/lecture-15-cache-oblivious-algorithms/)) on cache-efficient algorithms, including a discussion of matrix multiplication.

### Lecture 12 (Mar 15)

* [video](https://mit.zoom.us/rec/share/MPW1HsOTWiaCnaZBYqYznuVDM54jrdYDqMXgpgvX-w3tgkEqn0mdK1abDTFjb4KF.t1UOw46myEu3aii6?startTime=1615834826000)
* experiments with cache-oblivious matrix-multiplication ([handout](notes/oblivious-matmul-handout.pdf) or [full-size slides](notes/oblivious-matmul.pdf)) … see Julia notebook above for more recent results.

Introduced the concept of optimal cache-oblivious algorithms. Discussed cache-oblivious matrix multiplication in theory and in practice (see handout, Julia notebook, and Frigo et. al paper above).

Discussion of spatial locality and cache lines, with examples of dot products and matrix additions (both of which are "level 1 BLAS" operations with no temporal locality), and the critical implications for loop ordering when traversing multidimensional arrays.

**Further reading:** Frigo et al. paper from previous lecture. A typical free-software BLAS these days is [OpenBLAS](https://www.openblas.net/). See [Register Allocation in Kernel Generators](http://cscads.rice.edu/workshops/july2007/autotune-slides-07/Frigo.pdf) (talk by M. Frigo, 2007) on the difficulty of optimizing for the last level of cache (the registers) in matrix multiplication (compared to FFTs), and why a simple cache-oblivious algorithm is no longer enough. See e.g. the Wikipedia article on [row-major and column-major order](http://en.wikipedia.org/wiki/Row-major_order) and the resulting [Julia performance tip](https://docs.julialang.org/en/v1/manual/performance-tips/#man-performance-column-major).

### Lecture 13 (Mar 17)

* [video](https://mit.zoom.us/rec/share/BMLfjHa8AsAVvEAJ0SnjXMf_SetO92jRrR6ZB5Asf8Tx6CPm1g4unf6nFyor96kV.wPCbT1L5BKWECOfw?startTime=1616007600000)

Review of **Gaussian elimination**. Reviewed the fact (from 18.06) that this givs an A=LU factorization, and that we then solve Ax=b by solving Ly=b (forward substitution: doing the same steps to b that we did to A during elimination to get y) and then solving Ux=y (backsubstitution). Emphasized that you should **almost never compute A⁻¹** explicitly. It is just as cheap to keep L and U around, since triangular solves are essentially the same cost as a matrix-vector multiplication. Computing A⁻¹ is usually a mistake: you can't do anything with A⁻¹ that you couldn't do with L and U, and you are wasting both computations and accuracy in computing A⁻¹. A⁻¹ is useful in abstract manipulations, but whenever you see "x=A⁻¹b" you should interpret it for computational purposes as solving Ax=b by LU or some other method.

In Julia, `x = A \ b` solves Ax=b by a specialized method depending on the type of `A`, and `F = factorization(A)` followed by `x = F \ b` stores the factorization (e.g. LU) for re-use on subsequent right-hand sides.

**Further reading:** Trefethen, lectures 20–22.

### Lecture 14 (Mar 19)

* [video](https://mit.zoom.us/rec/share/wMsV8X1FNSZSeZiYtT5ebFaUzzQkhLudRuDww9ma8cAwB4vHeY25Qpb4jJXoYI18.OclUE9JHl9MbHdG3?startTime=1616180412000)

Showed with an example that Gaussian elimination (LU) without row swaps ("pivoting") is numerically unstable.  (In principle, we could instead solve Ax=b with Householder QR, but we'd rather not: QR flop count 2m³ - 2m³/3 = 4m³/3 is double that of LU.)

Introduced partial pivoting, and pointed out (omitting bookkeeping details) that this can be expressed as a PA=LU factorization where P is a permutation. Discussed backwards stability of LU, and mentioned example where U matrix grows exponentially fast with _m_ to point out that the backwards stability result is practically useless here, and that the (indisputable) practicality of Gaussian elimination is more a result of the types of matrices that arise in practice.

Discussed Cholesky factorization, which is Gaussian elimation for the special case of Hermitian positive-definite matrices, where we can save a factor of two in time and memory. More generally, if the matrix A has a special form, one can sometimes take advantage of this to have a more efficient Ax=b solver, for example: Hermitian positive-definite (Cholesky), tridiagonal or banded (linear-time solvers), lower/upper triangular (forward/backsubstitution), generic sparse (A is mostly zero: sparse-direct and iterative solvers, to be discussed later; typically only worthwhile when the matrix is much bigger than 1000×1000).

**Further reading:** Trefethen, lectures 20–23.   See all of the [special cases of LAPACK's linear-equation solvers](http://www.netlib.org/lapack/lug/node38.html).

### Lecture 15 (March 24 — NO CLASS MONDAY)

* [video](https://mit.zoom.us/rec/share/qgqqa8Xl0-UwBS8vyc_myhk9-80mgjRF1nYJ6HTShbpHXkAx9CLKGNUk1sfksrHf.DrzxIFRx22U8Y6J8?startTime=1616612242000)

New topic: **eigenproblems**. Reviewed the usual formulation of eigenproblems and the characteristic polynomial.  Discussed diagonalization and defective matrices — although exactly defective matrices are nearly nonexistent in practice, many matrices are *nearly* defective, corresponding to the eigenvector basis being ill-conditioned.  The exception are [normal matrices](https://en.wikipedia.org/wiki/Normal_matrix), most commonly Hermitian or unitary matrices, which have orthonormal eigenvectors.  Otherwise, eigenvectors can be a very unreliable basis (which greatly amplifies numerical errors if they happen to be ill-conditioned). An alternative orthonormal basis is given by the [Schur factorization](https://en.wikipedia.org/wiki/Schur_decomposition): showed that any square matrix A=QTQᵀ where T is upper-triangular.

Pointed out that an "LU-like" algorithm for eigenproblems, which computes the exact eigenvalues/eigenvectors (in exact arithmetic, neglecting roundoff) in a finite number of steps involving addition, subtraction, multiplication, division, and roots, is impossible. The reason is that no such algorithm exists (or can _ever_ exist) to find roots of polynomials with degree greater than 4, thanks to a theorem by Abel, Galois and others in the 19th century. Used the [companion matrix](http://en.wikipedia.org/wiki/Companion_matrix) to show that polynomial root finding is equivalent to the problem of finding eigenvalues. Mentioned the connection to other classic problems of antiquity (squaring the circle, trisecting an angle, doubling the cube), which were also proved impossible in the 19th century.

As a result, all eigenproblem methods must be _iterative_: they must consist of improving an initial guess, in successive steps, so that it converges towards the exact result to _any desired accuracy_, but never actually reaches the exact answer in general. A simple example of such a method is Newton's method, which can be applied to iteratively approximate a root of any nonlinear function to any desired accuracy, given a sufficiently good initial guess.

However, forming the characteristic polynomial and searching for its roots can be a terrible way to find eigenvalues if you aren't careful. The problem is that the roots are an exponentially ill-conditioned function of the polynomial coefficients; gave the example of [Wilkinson's polynomial](http://en.wikipedia.org/wiki/Wilkinson%27s_polynomial). If we can compute the characteristic polynomial values implicitly somehow, directly from the determinant, then it is not too bad (if you are looking only for eigenvalues in some known interval, for example), but we haven't learned an efficient way to do that yet. The way LAPACK and Matlab actually compute eigenvalues, the QR method and its descendants, wasn't discovered until 1960.

**Further reading:** Trefethen, lecture 24, 25. See [this Wilkinson polynomial Julia notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring15/notes/Wilkinson-Polynomial.ipynb) for some experiments with polynomial roots in Julia, as well as [this more recent 18.06 notebook](https://nbviewer.jupyter.org/github/stevengj/1806/blob/fall18/lectures/Eigenvalue-Polynomials.ipynb).

### Lecture 16 (March 26)

* [video](https://mit.zoom.us/rec/share/6xPglmx5EfRpfoJicepecUYWJTz4AZSowDUZbhxtlvZpqS6lZ15s2b-ynJo8AMmz.ptm-aacmshkD3PkU?startTime=1616785249000)
* [pset 3 solutions](psets/pset3sol.pdf)
* [pset 4](psets/pset4.pdf): due Friday April 9

The key to making most of the eigensolver algorithms efficient is reducing A to **Hessenberg form**: A=QHQᵀ where H is upper triangular plus one nonzero value below each diagonal. Unlike Schur form, Hessenberg factorization _can_ be done exactly in a finite number of steps (in exact arithmetic), Θ(m³) steps to be precise. H and A are similar: they have the same eigenvalues, and the eigenvector are related by Q. And once we reduce to Hessenberg form, all the subsequent operations we might want to do (determinants, LU or QR factorization, etcetera), will be fast. In the case of Hermitian A, showed that H is Hermitian tridiagonal; in this case, most subsequent operations (even LU and QR factorization) will be Θ(m) (you will show this in HW)!  (In fact, you can always arrange that H is a *real* tridiagonal matrix even if A is complex Hermitian.)

Reviewed power method for biggest-|λ| eigenvector/eigenvalue and its the convergence rate.   To get the eigenvalue, we use the Rayleigh quotient of our eigenvector estimate.  Showed that (related to the min–max theorem), for a Hermitian matrix the eigenvectors are all *extrema* of the Rayleigh quotient, and this means that the eigenvalue estimates converge at *twice* the rate (i.e. squared error) of the eigenvectors.

**Further reading:** Trefethen, lecture 25, 26, and and Per Persson's [2006 notes](notes/lec14handout6pp.pdf) on Hessenberg factorization.  The Julia LinearAlgebra provides functions `schur`, `eigen`, and `hessenberg` for the Schur, eigenvector, and Hessenberg factorizations respectively.  (For a large real-symmetric matrix, Hessenberg factorization is about 5× faster than diagonalization, but is only about 40% faster than finding the eigenvalues and not eigenvectors.)

### Lecture 17 (March 29)

* [video](https://mit.zoom.us/rec/share/OWnsSqgxWK8DzhYDMmOQex-hp9UyMaxED_MWLks4ijOGHexNvSVE9ujB04reF72a.SFChGmWcityiJz9n?startTime=1617044407000)

Finished analyzing rate of convergence of the power method, along with Rayleigh-quotient method for estimating eigenvalues, for Hermitian matrices.
Mentioned variants of inverse- and shifted-inverse iteration.   (Later on, we will discuss how to accelerate convergence with the Arnoldi algorithm.)

Discussed how to use the power method to get multiple eigenvalues/vectors of Hermitian matrices by "deflation" (using orthogonality of eigenvectors). Discussed how, in principle, QR factorization of _Aⁿ_ for large _n_ will give the eigenvectors and eigenvalues in descending order of magnitude, but how this is killed by roundoff errors.

Unshifted QR method: proved that repeatedly forming A=QR, then replacing A with RQ (as in pset 3) is equivalent (in exact arithmetic) to QR factorizing _Aⁿ_. But since we do this while only multiplying repeatedly by unitary matrices, it is well conditioned and we get the eigenvalues accurately.

To make the QR method faster, we first reduce to Hessenberg form; you showed in pset 3 that this is especially fast when A is Hermitian and the Hessenberg form is tridiagonal. Second, we use shifts.  In particular, the worst case for the QR method, just as for the power method, is when eigenvalues are nearly equal. We can fix this by shifting.  Brief discussion of shifted QR and the Wilkinson shift.

**Further reading:** See Trefethen, lectures 27–30, and Per Persson's [2006 notes](notes/lec15handout6pp.pdf) on power/inverse/Rayleigh iteration and on QR ([part 1](notes/lec15handout6pp.pdf) and [part 2](notes/lec16handout6pp.pdf)).

### Lecture 18 (March 31)

* [video](https://mit.zoom.us/rec/share/VDVaIWQ5Mm5pvBzqiMhr5LjaQyqlBpJNU-uiuhyRuFvoL6_-IJg1ozHEr32DUKEG.BSLQvdp2dxtgpk6C?startTime=1617216915000)

Finished discussion of QR method.   Shifted QR, Wilkinson shift for "breaking ties", fact that similar method for non-Hermitian A converges to Schur factor T, brief mention of bidiagonalization for the SVD.

New topic: **iterative linear-algebra algorithms**, usually for sparse matrices, and in general for matrices where you have a fast way to compute _Ax_ matrix–vector products but cannot (practically) mess around with the specific entries of _A_. That is, you have huge matrices (stored in some compressed fashion) where you cannot afford Θ(m³) algorithms or Θ(m²) storage.   New goal: solve Ax=b or Ax=λx by starting with some initial guess (e.g. random numbers) and iteratively converge to a solution *as quickly as possible* using *only* matrix–vector products _Ax_.

Gave simple example of power method, which we already learned. This, however, only keeps the most recent vector Axₙ and throws away the previous ones. Introduced Krylov subspaces, and the idea of **Krylov subspace** methods: ideally, we want to find the "best" solution in the *whole subspace* 𝒦ₙ spanned by {b,Ab,...,Aⁿ⁻¹b}, which is the *only* subspace you can get starting from b if you are only allowed linear operations and matrix–vector products.

**Further reading:** Trefethen, lectures 28–31 on QR, lectures 32–33 on iterative methods. The online books, [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html), are useful surveys of iterative methods.

### Lecture 19 (April 2)

* [video](https://mit.zoom.us/rec/share/GFTScHrynRtObn17RP45q9EoHF2WioWQn-nDx50bmVi5i-1_2soZVqgPqPZHpEid.SWLzXR36i_G5Nv5w?startTime=1617390021000)

Presented the **Arnoldi** algorithm. Unlike the book, I _start_ the derivation by viewing it as a modified Gram–Schmidt process, and prove that it is equivalent (in exact arithmetic) to GS on {b,b,Ab,A²b,...}, so it is an orthonormal basis for 𝒦ₙ.  Then we showed that this corresponds to partial Hessenberg factorization: AQₙ = QₙHₙ + h₍ₙ₊₁₎ₙqₙ₊₁eₙᵀ where Hₙ is upper-Hessenberg.

Discussed what it means to find the "best" solution in the Krylov subspace 𝒦ₙ. Discussed the general principle of Rayleigh–Ritz methods for approximately solving the eigenproblem in a subspace: finding the Ritz vectors/values (= eigenvector/value approximations) with a residual perpendicular to the subspace (a special case of a Galerkin method).

For Hermitian matrices A, I showed that the max/min Ritz values are the maximum/minimum of the Rayleigh quotient in the subspace, via the min–max theorem.  In this sense, at least for Hermitian matrices, the Ritz vectors are *optimal* in the sense of maximizing (or minimizing) the Rayleigh quotient in the Krylov space.  Another sense in which they are optimal for Hermitian A is that the Ritz vectors/values minimize ‖AV-VD‖₂ over all possible orthonormal bases V of the Krylov space and all possible diagonal matrices D (see the Bai notes below for a proof).   (Later, we will discuss an "optimal polynomial" interpretation of Arnoldi+Rayleigh–Ritz from Trefethen lecture 34.)

**Further reading:** Trefethen lecture 33 on Arnoldi. [This 2009 course](https://web.cs.ucdavis.edu/~bai/Winter09/) on numerical linear algebra by Zhaojun Bai has [useful notes](https://web.cs.ucdavis.edu/~bai/Winter09/krylov.pdf) on Krylov methods, including a discussion of the Rayleigh–Ritz procedure.

### Lecture 20 (April 5)

* [video](https://mit.zoom.us/rec/share/VWHBM4qP1hTZf6mYTi5Bn2Jvsyi0se8pwiXsxKElK2BTMxY4x_b2XioSsaWvqvE7.mYWhIdkah_67j9jx?startTime=1617649211000)
* [Arnoldi-iteration experiments](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Arnoldi.ipynb)
* [notes on restarting Arnoldi](notes/restarting-arnoldi.pdf)

Showed that in the case where A is Hermitian, Hₙ is Hermitian as well, so Hₙ is tridiagonal and most of the dot products in the Arnoldi process are zero.  Hence Arnoldi reduces to a three-term recurrence, and the Ritz matrix is tridiagonal.  This is called the **Lanczos** algorithm.

Showed some computational examples (notebook above) of Arnoldi convergence. Discussed how rounding problems cause a loss of orthogonality in Lanczos, leading to "ghost" eigenvalues where extremal eigenvalues re-appear. In Arnoldi, we explicitly store and orthogonalize against all qj vectors, but then another problem arises: this becomes more and more expensive as n increases.

A solution to the loss of orthogonality in Lanczos and the growing computational effort in Arnoldi is restarting schemes, where we go for n steps and then restart with the k "best" eigenvectors.   If we restart with k=1 *every* step, then we essentially have the power method, so while restarting makes the convergence worse the algorithm still converges, and converges significantly faster than the power method for k>1.

**Further reading:** Trefethen, lecture 36. See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 21 (April 7)

* [video](https://mit.zoom.us/rec/share/NDlcIc1WoZgJ2qaQK8HUFMoKYgjKLGrBEKup2jAcmGu1J0Uim17uFr_yQRcNOjI.HBexT6JbT7uiWwHh?startTime=1617822039000)
* [notes on restarting Arnoldi](notes/restarting-arnoldi.pdf)

Explained why restarting properly is nontrivial for k>1: we need to restart in such a way that maintains the Arnoldi (or Lanczos) property AQₙ = QₙHₙ + rₙeₙᵀ where Hₙ is upper-Hessenberg, rₙ is orthogonal to Qₙ, and eₙᵀ is only nonzero in the last column.  In particular, showed that the "obvious" naive restarting algorithm using k Ritz vectors *almost* works, but messes up the eₙᵀ property.  See the notes.

Introduced the **GMRES** algorithm: compute the basis Qₙ for 𝒦ₙ as in Arnoldi, but then minimize the residual ‖Ax-b‖₂ for x∈𝒦ₙ using this basis.  This yields a small (n+1)×n least-squares problem involving Hₙ.

**Further reading:** Trefethen, lectures 34–36. See the section on [implicitly restarted Lanczos](http://www.cs.utk.edu/~dongarra/etemplates/node117.html) in [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html).

### Lecture 22 (April 9)

* [video](https://mit.zoom.us/rec/share/wkp1-b0gFsUe4QlJf7vNr3k80ak6jQIpDN8A0fmb06jN2WxpmbOwtqd63jBtWgFm.cgwP51kgayUw9RmW?startTime=1617994835000)
* [pset 4 solutions](psets/pset4sol.pdf)

Finished writing GMRES convergence in terms of polynomials, and contrasted it to Arnoldi/Lanczos.

Like Arnoldi/Lanczos, if GMRES does not converge quickly we must generally **restart** it, usually with a subspace of dimension 1; restarting GMRES repeatedly after k steps is called **GMRES(k)**. Unfortunately, unlike Arnoldi for the largest |λ|, restarted GMRES is _not guaranteed to converge_. If it doesn't converge, we must do something to speed up convergence: preconditioning (next time).

In many practical cases, unfortunately, the eigenvalues of A are _not_ mostly clustered, so convergence of GMRES may be slow (and restarted GMRES may not converge at all).

The solution to this problem is **preconditioning**: finding an (easy-to-compute) M such that MA (left preconditioning) or AM (right preconditioning) has clustered eigenvalues (solving MAx=Mb or AMy=b with x=My, respectively). Essentially, one can think of M as a crude approximation for A⁻¹ (or the inverse of a crude approximation of A that is easy to invert). Brief summary of some preconditioning ideas: multigrid, incomplete LU/Cholesky, Jacobi/block-Jacobi. (Since Jacobi preconditioners only have short-range interactions, they tend not to work well for matrices that come from finite-difference/finite-element discretizations on grids, but they can work well for diagonally dominant matrices that arise in spectral and integral-equation methods.)

**Further reading:** Trefethen, lectures 34, 35, 40. The convergence of GMRES for very non-normal matrices is a complicated subject; see e.g. [this paper on GMRES for defective matrices](http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.48.1733) or [this paper surveying different convergence estimates](http://eprints.maths.ox.ac.uk/1290/). Regarding convergence problems with GMRES, see this 2002 presentation by Mark Embree on [Restarted GMRES dynamics](http://www.caam.rice.edu/~embree/householder.pdf). [Cullum (1996)](http://link.springer.com/article/10.1007%2FBF02127693) reviews the relationship between GMRES and a similar algorithm called FOM that is more Galerkin-like (analogous to Rayleigh–Ritz rather than least-squares).  **Preconditioning:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html), chapter on [preconditioners](http://www.netlib.org/linalg/html_templates/node51.html), and e.g. _[Matrix Preconditioning Techniques and Applications](http://books.google.com?id=d9UdanCqJ1QC)_ by Ke Chen (Cambridge Univ. Press, 2005).   For Hermitian A, we can also specialize the GMRES algorithm analogous to Lanczos, giving MINRES and SYMMLQ: [Differences in the effects of rounding errors in Krylov solvers for symmetric indefinite linear systems](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.3064) by Sleijpen (2000); see also van der Vorst notes from Lecture 22 and the _Templates_ book.

### Lecture 23 (April 12)

* [video](https://mit.zoom.us/rec/share/kWU4PPKcx3AeajjVe4Zgnqb6kx9XOK8-8Q0Dy_0kSUx3o9LrNTfZyufRg5nspF4g.tSJCLpKoB7AyqFTR?startTime=1618254043000)

**Conjugate-gradient (CG) methods:**

Began discussing gradient-based iterative solvers for Ax=b linear systems, starting with the case where *A is Hermitian positive-definite*. Our goal is the conjugate-gradient method, but we start with a simpler technique. First, we cast this as a minimization problem for f(x)=xᵀAx-xᵀb-bᵀx, or equivalently f(x)=‖x-xₑ‖²–‖xₑ‖² where xₑ is the exact solution and ‖⋅‖ is the *A-weighted* L2 norm. Then, we perform 1d line minimizations of f(x+αd) for some direction d. If we choose the directions d to be the steepest-descent directions b-Ax, this gives the steepest-descent method. Discussed successive line minimization of f(x), and in particular the steepest-descent choice of d=b-Ax at each step. Explained how this leads to "zig-zag" convergence by a simple two-dimensional example, and in fact the number of steps is proportional to κ(A). We want to improve this by deriving a Krylov-subspace method that minimizes f(x) over _all_ previous search directions simultaneously.

**Further reading:** Trefethen, lecture 38 on CG. See also the useful notes, [An introduction to the conjugate gradient method without the agonizing pain](http://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf) by J. R. Shewchuk.  There is also a close connection between the conjugate directions of conjugate gradient and the "momentum" terms of stochastic gradient-descent methods; see e.g. [Bhaya (2004)](https://www.sciencedirect.com/science/article/abs/pii/S0893608003001709).

### Lecture 24 (April 14)

* [video](https://mit.zoom.us/rec/share/2rTRTDWECWo7C7pb8q6mWB0k2mxUgs_lqbjsjWxuhSz7g_ww_EFuIV4smqv3OuXi.qFouE3MZds4xGpdW?startTime=1618426846000)

Finished derivation of conjugate gradient.

Discussed convergence of conjugate gradient, connecting it to minimizing polynomials at the eigenvalues similar to GMRES.

Derived the preconditioned conjugate gradient method (showing how the apparent non-Hermitian-ness of MA is not actually a problem as long as M is Hermitian positive-definite). Mentioned the connection to approximate Newton methods (which is easy to see if we consider preconditioned steepest-descent with M approximately A⁻¹).

As an alternative to GMRES for non-Hermitian problems, considered the biCG algorithm. Derived it as in the van der Vorst notes below: as PCG on the Hermitian-indefinite matrix B=\[0,A;Aᵀ,0\] with the "preconditioner" \[0,I;I,0\] (in the unpreconditioned case). Because this is Hermitian, there is still a conjugacy condition and it is still a Krylov method. Because it is indefinite, we are finding a saddle point and not a minimum of a quadratic, and _breakdown_ can occur if one of the denominators (e.g. dᵀBd) becomes zero. (This is the same as algorithm 39.1 in Trefethen, but derived very differently.) Because of this, you should almost never use the plain biCG algorithm. However, the biCG idea was the starting point for several "stabilized" refinements, culminating in biCGSTAB(L) that try to avoid breakdown by combining biCG with elements of GMRES. Other iterative Ax=b algorithms worth trying are the QMR and DQGMRES algorithms.

**Further reading:** [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html). A very nice overview of iterative methods for non-Hermitian problems can be found in these 2002 [Lecture Notes on Iterative Methods](http://www.math.uu.nl/people/vorst/lecture.html) by Henk van der Vorst (second section, starting with GMRES).

### Take-home midterm (April 15)

* [midterm](psets/midterm.pdf)
* [solutions](psets/midtermsol.pdf)

The 18.335 midterm exam will be posted at 3pm (EDT) on Thursday April 15 and will be due at 3pm (EDT) on Friday April 16.  The exam is **open notes** and **open book** (including any material posted for the class: pset solutions and handouts).  **No other materials** may be used ("**closed Internet**").  The exam will be designed to take **roughly 2 hours,** but you can take *as much time as you want* within the 24-hour time slot.

It will cover everything in 18.335 up to and including **pset 4** and **lecture 20**.

### Lecture 25 (April 16)

* [video](https://mit.zoom.us/rec/share/kCxSHyF6hUTOFCmspZPIu_SZ4CqmDuNPynviyZ0gDm9m1oR-1SeGjV-tg2e3Vw6Q.p-GqnPs45BjOUOy7?startTime=1618599650000)
* [notes on sparse-direct solvers](notes/lec21handout6pp.pdf) from Fall 2006
* [IJulia notebook on sparse-direct solvers](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/Nested-Dissection.ipynb)

**Sparse-direct solvers:** For many problems, there is an intermediate between the dense Θ(m³) solvers of LAPACK and iterative algorithms: for a sparse matrix A, we can sometimes perform an LU or Cholesky factorization while maintaining sparsity, storing and computing only nonzero entries for vast savings in storage and work.  One key observation is that the fill-in only depends on the pattern of the matrix, which can be interpreted as a [graph](http://en.wikipedia.org/wiki/Graph_%28mathematics%29): m vertices, and edges for the nonzero entries of A (an [adjacency matrix](http://en.wikipedia.org/wiki/Adjacency_matrix) of the graph), and sparse-direct algorithms are closely related to graph-theory problems.    How efficient the sparse-direct methods are depends on how easy it is to **partition** the graph by chopping it into pieces, and this is **easier for matrices that come from low-dimensional meshes** (e.g. discretized low-dimensional PDEs).  1d meshes are best (giving *banded* matrices with *linear* complexity), 2d meshes are still pretty good, and 3d meshes start to become challenging.  See the scalings in the handout, which are derived in the Davis book below.

Concluded with some rules of thumb about which type of solvers to use: LAPACK for small matrices (< 1000s×1000s), sparse-direct for intermediate-size sparse cases (especially from 1d and 2d meshes), and iterative methods for the largest problems or problems with a fast matrix⋅vector but no sparsity. One important point is that sparse-direct algorithms scale much better for sparse matrices that come from discretization of 2d PDEs than 3d PDEs. In general, some experimentation is required to find the best technique for a given problem, so software like Julia, Scipy, Matlab, or the Petsc library is extremely helpful in providing a quick way to explore many algorithms.

**Further reading:** The book _[Direct Methods for Sparse Linear Systems](http://books.google.com/books?id=TvwiyF8vy3EC&lpg=PR1&ots=odauEC2c4k&dq=direct%20methods%20for%20sparse%20davis&pg=PR1#v=onepage&q&f=false)_ by Davis is a useful reference.

### Lecture 26 (April 21)

* [video](https://mit.zoom.us/rec/share/QwT0OMMFfkgi9dD0Zoa_3UK-14LbQR8GFcd7Q-O9PqIJTbbULGYqX3isDkLa1kOw.CNhZ0KukrqW2kxeT?startTime=1619031558000)
* [overview of optimization](notes/optimization.pdf)

Several of the iterative algorithms so far have worked, conceptually at least, by turning the original linear-algebra problem into a minimization problem. It is natural to ask, then, whether we can use similar ideas to solve more general **optimization problems**, which will be the next major topic in 18.335.

Broad overview of optimization problems (see handout). The most general formulation is actually quite difficult to solve, so most algorithms (especially the most efficient algorithms) solve various special cases, and it is important to know what the key factors are that distinguish a particular problem. There is also something of an art to the problem formulation itself, e.g. a nondifferentiable minimax problem can be reformulated as a nicer differentiable problem with differentiable constraints.

**Further reading:** There are many textbooks on [nonlinear optimization](http://www.athenasc.com/nonlinbook.html) algorithms of various sorts, including specialized books on [convex optimization](http://web.stanford.edu/~boyd/cvxbook/), [derivative-free optimization](http://bookstore.siam.org/mp08/), etcetera.  A useful review of topology-optimization methods can be found in [Sigmund and Maute (2013)](https://link.springer.com/article/10.1007/s00158-013-0978-6).

### Lecture 27 (April 23)

* [video](https://mit.zoom.us/rec/share/I590wu5HQCN2ZJAY9WphZDlH9rk3HRTDo5E7604U3IpzSiXGsIV2Sm091RMvMNgV.1ec5sLzM0JHCppk5?startTime=1619204435000)

CG easily generalizes to the [nonlinear conjugate-gradient algorithm](https://en.wikipedia.org/wiki/Nonlinear_conjugate_gradient_method) to (locally) minimize an *arbitrary* twice-differentiable f(x): the only changes are that r=-∇f is not simply b-Ax  and that the successive line minimizations min f(x+αd) need to be done numerically (an “easy” 1d optimization problem). The key point being that, near a local minimum of a smooth function, the objective is typically roughly quadratic (via Taylor expansion), and when that happens CG greatly accelerates convergence. (Mentioned Polak–Ribiere heuristic to help "reset" the search direction to the gradient if we are far from the minimum and convergence has stalled; see the Hager survey below for many more.)

Outlined application of nonlinear CG to Hermitian eigenproblems by minimizing the Rayleigh quotient (this is convex, and furthermore we can use the Ritz vectors to shortcut both the conjugacy and the line minimization steps). The generalization of this is the [LOBPCG](http://en.wikipedia.org/wiki/LOBPCG) algorithm.

The "block" version of the LOBPCG algorithm uses a block version of the min–max theorem and the Rayleigh quotient, which is nice to know about for its own sake.  For a Hermitian A, the sum of the k smallest eigenvalues minimizes the trace tr[XᵀAX(XᵀX)⁻¹] over all m×k matrices X, a fact that is closely related to the [polar decomposition](https://nhigham.com/2020/07/28/what-is-the-polar-decomposition/) of X.

Discussed some general concepts in local optimization. **Global convergence** means convergence to a _local_ optimum from any _feasible_ starting point; explained why finding the feasible region from an _infeasible_ starting point is in general as hard as global optimization. A typical **trust region** approach is to _locally approximate_ the objective and constraint functions by some _simple functions_ that are easy to optimize, optimize them within some localized trust region around a current point **x** to obtain a candidate step **y**, and then either take the step (e.g. if **y** is an improvement) and/or update the approximations and trust region (e.g. if **y** was not an improvement or the approximation and exact functions differed greatly). There are many, many algorithms that follow this general outline, but they differ greatly in what approximations they use (e.g. linear, quadratic, ...), what trust region they use, and what methods they use to update the trust region and to evaluate candidate steps. Often, the approximate functions are _convex_ so that convex-optimization methods can be used to solve the _trust-region subproblems_.

**Further reading:** There are many textbooks on [nonlinear optimization](http://www.athenasc.com/nonlinbook.html) algorithms of various sorts, including specialized books on [convex optimization](http://web.stanford.edu/~boyd/cvxbook/), [derivative-free optimization](http://bookstore.siam.org/mp08/), etcetera.  A useful review of topology-optimization methods can be found in [Sigmund and Maute (2013)](https://link.springer.com/article/10.1007/s00158-013-0978-6). There are many variants of nonlinear conjugate-gradient, mainly to avoid bad behavior far from the minimum, as surveyed by Hager and Zhang, “[A Survey of Nonlinear Conjugate Gradient Methods](http://people.cs.vt.edu/~asandu/Public/Qual2011/Optim/Hager_2006_CG-survey.pdf),” *Pacific J. Optim.* 2, pp. 35-58 (2006).  There is also a close connection between the conjugate directions of conjugate gradient and the "momentum" terms of stochastic gradient-descent methods; see e.g. [Bhaya (2004)](https://www.sciencedirect.com/science/article/abs/pii/S0893608003001709).

### Lecture 28 (Apr 26)

* [video](https://mit.zoom.us/rec/share/xLxMyhBSoIhSFxce5lHb1ubItby5BKFs6mgJJ7kMmjotETmaYm4YA22TA8w8n13i.6sTEFrkkloG7LFeR?startTime=1619463273000)
* [slides](notes/adjoint/adjoint-intro.pdf)
* [notes on adjoint methods](notes/adjoint/adjoint.pdf) to compute gradients

Introduction to **adjoint** methods and the remarkable fact that one can compute the gradient of a complicated function with about the same number of additional operations as computing the function _once_.

Guest lecture by [Dr. Zin Lin](http://zinlin.mit.edu/home).

**Further reading:** A variant of adjoint methods is the well-known [backpropagation algorithm](https://en.wikipedia.org/wiki/Backpropagation) for neural networks, which can often be thought of as a recurrence relation (one per network layer).  Computers can sometimes now compute derivatives automatically via [automatic differentiation (AD)](https://en.wikipedia.org/wiki/Automatic_differentiation), and adjoint methods correspond to "reverse mode" AD.  For the largest-scale computational problems, solved by very complicated programs (often combining multiple external libraries), AD is still a challenge, however, and some understanding of adjoint methods is often still required.

### Lecture 29 (Apr 28)

* [video](https://mit.zoom.us/rec/share/MVrErvy33_5BXMimMIad9R_TRhlvCy-nRZZsXO14tl6_mUMnD19jMGkwJ-ziWEYj.RD-_CwwE0pOxyadd?startTime=1619636374000)
* [notes on adjoint methods for recurrence relations](notes/adjoint/recurrence2.pdf)
* [adjoint example notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring19/notes/adjoint/Adjoint-method.ipynb)

Discussed adjoint methods for recurrence relations, connection to backpropagation in neural nets, and connection to "vector-Jacobian products" in automatic differentiation (AD) (section 5 of [the notes on adjoint methods](notes/adjoint/adjoint.pdf)).

### Lecture 30 (Apr 30)

* [video](https://mit.zoom.us/rec/share/UfE3Xn1sL3aU-LORdjfw51VAicWyMkvzMccCx8L8HoQeX3ZZAKOIhXmwfRxo6wGf.0LzPmyFjFpGQheTT?startTime=1619809242000)

Went over a particular example of a nonlinear optimization scheme, solving the full inequality-constrained nonlinear-programming problem: the CCSA algorithms, as refined by Svanberg (2002). This is a surprisingly simple algorithm (the [NLopt](http://ab-initio.mit.edu/nlopt) implementation is only 300 lines of C code), but is robust and provably convergent, and illustrates a number of important ideas in optimization: optimizing an approximation to update the parameters **x**, guarding the approximation with trust regions and penalty terms, and optimizing via the dual function (Lagrange multipliers). Like many optimization algorithms, the general ideas are very straightforward, but getting the details right can be delicate!

Outlined the inner/outer iteration structure of CCSA, and the interesting property that it produces a sequence of feasible iterates from a feasible starting point, which means that you can stop it early and still have a feasible solution (which is very useful for many applications where 99% of optimal is fine, but feasibility is essential).

The inner optimization problem involving the approximate gᵢ functions turns out to be *much* easier to solve because it is *convex* and *separable* (gᵢ = a sum of 1d convex functions of each coordinate xⱼ).  Convexity allows us to use the technique of **duality** to turn the problem into an equivalent "dual" optimization problem, and separability makes this dual problem trivial to formulate and solve.   Began discussing the ideas of *Lagrangians* and duality using the Boyd textbook; we will continue this in the next lecture.

**Further reading:** Pages 1–10 of [Svanberg (2002) paper on CCSA algorithms](
http://dx.doi.org/10.1137/S1052623499362822) — I used the "linear and separable quadratic approximation" functions gᵢ in section 5.1; as far as I can tell the other example gᵢ functions have no general advantages.

### Lecture 31 (May 3)

* [video](https://mit.zoom.us/rec/share/HuMJZYJx-zEbMv_cvjf1w1Gdim8a5qTbhkcxWZt8VDgQrhUdFoirPg_VW_YrQVFI.0dsbgpiVIDxNkJO9?startTime=1620068445000)
* [slides from Boyd, chapter 5](notes/boyd-ch5-slides.pdf)

Started by reviewing the basic idea of Lagrange multipliers to find an extremum of one function f₀(x) and one equality constraint h₁(x)=0. We instead find an extremum of L(x,ν₁)=f₀(x)+ν₁h₁(x) over x and the _Lagrange multiplier_ ν₁. The ν₁ partial derivative of L ensures h₁(x)=0, in which case L=f0 and the remaining derivatives extremize f0 along the constraint surface. Noted that ∇L=0 then enforces ∇f₀=0 in the direction parallel to the constraint, whereas perpendicular to the constraint ν₁ represents a "force" that prevents x from leaving the h₁(x)=0 constraint surface.

Generalized to the Lagrangian L(x,λ,ν) of the general optimization problem (the "primal" problem) with both inequality and equality constraints, following chapter 5 of the Boyd and Vandenberghe book (see below) (section 5.1.1).

Described the KKT conditions for a (local) optimum/extremum (Boyd, section 5.5.3). These are true in problems with strong duality, as pointed out by Boyd, but they are actually true in much more general conditions. For example, they hold under the "LICQ" condition in which the gradients of all the active constraints are linearly independents. Gave a simple graphical example to illustrate why violating LICQ requires a fairly weird optimum, at a cusp of two constraints.

Explain how duality applies to the CCSA algorithm: for the separable convex approximate optimization problem in gᵢ(x), we can find the dual function g(λ) analytically, which results in a much simpler convex optimization problem with only bound constraints λᵢ≥0.  This can be solved in a variety of ways, but one elegant technique is to apply CCSA recursively to the dual problem. Where on each iteration of the recursive CCSA, we approximate g(λ) by yet another separable convex approximation, and then the dual of *this* approximation has no variables at all (since there were no nonlinear constraints) and hence is trivial.

**Further reading:** _[Convex Optimization](http://www.stanford.edu/~boyd/cvxbook/)_ by Boyd and Vandenberghe (free book online), chapter 5. There are many sources on [Lagrange multipliers](http://en.wikipedia.org/wiki/Lagrange_multipliers) (the special case of equality constraints) online that can be found by googling.

### Lecture 32 (May 5)

* [video](https://mit.zoom.us/rec/share/naqcRgSkZ0VNeDp0ht8QmB566mPowuHJ8k0LcaAmZ7XxaCT1ch4j_O4Khzi-taXm.CXI8xFthag4RvvoC?startTime=1620241284000)
* [notes on BFGS and quasi-Newton methods](notes/BFGS.pdf)

Overview of discussing quasi-Newton methods in general, and the BFGS algorithm in particular, following the notes.

**Further reading:** Wikipedia's articles on [quasi-Newton methods](http://en.wikipedia.org/wiki/Quasi-Newton_methods) and the [BFGS method](http://en.wikipedia.org/wiki/BFGS_method) have some useful links and summaries. Helpful derivations of many of the properties of BFGS updates, and many references, can be found in [this 1980 technical report by Dennis and Schnabel](http://www.cs.colorado.edu/department/publications/reports/docs/CU-CS-185-80.pdf) and for a generalization in [this 1994 paper by O'Leary and Yeremin](http://www.cs.umd.edu/~oleary/reprints/j39.pdf), for example.

Finished BFGS notes (begun last lecture).

Introduced derivative-free optimization algorithms, for the common case where you don't have too many parameters (tens or hundreds) and computing the gradient is inconvenient (complicated programming, even if adjoint methods are theoretically applicable) or impossible (non-differentiable objectives). Started by discussing methods based on linear interpolation of simplices, such as the [COBYLA algorithm](https://link.springer.com/chapter/10.1007/978-94-015-8330-5_4) of Powell.

Discussed derivative-free optimization based on quadratic approximation by symmetric Broyden updates (as in [BOBYQA](https://www.damtp.cam.ac.uk/user/na/NA_papers/NA2009_06.pdf)/[NEWUOA](https://www.damtp.cam.ac.uk/user/na/NA_papers/NA2004_08.pdf)/[LINCOA](http://www.damtp.cam.ac.uk/user/na/NA_papers/NA2014_02.pdf) algorithm of Powell, for example). Updating the Hessian turns into a quadratic programming (QP) problem, and discussed solution of QPs by construction of the dual, turning it into either an unconstrained QP (and hence a linear system) for equality constrained problems, or a bound-constrained QP for inequality-constrained QPs.

Mentioned multi-start global optimizer algorithms, e.g. MLSL (from [here](https://link.springer.com/article/10.1007/BF02592070) (and [here](https://link.springer.com/article/10.1007/BF02592071)) and TikTak.

**Further reading:** The book [Introduction to Derivative-Free Optimization](http://books.google.com/books?id=7c7X6tlcaHEC&lpg=PP1&ots=ljSCrl3WuI&dq=derivative%20free%20optimization%20conn&pg=PP1#v=onepage&q&f=false) by Andrew Conn et al is a reasonable starting point. See also the [derivative-free algorithms in NLopt](https://nlopt.readthedocs.io/en/latest/NLopt_Algorithms/) and the references thereof.  Several more stochastic algorithms in Julia are implemented in the [BlackBoxOptim](https://github.com/robertfeldt/BlackBoxOptim.jl) package.

### Lecture 33 (May 10)

* [video](https://mit.zoom.us/rec/share/1gFzJgDzbI2EfQmvLxwPx1jtasu_0VmWj5nm4rys9ilLwYdWly2IijBWSTKK3s-b.pVjBVPPYht8GArAJ?startTime=1620673258000)
* [Notes](notes/trap-quad.pdf) on error analysis of the trapezoidal rule and Clenshaw-Curtis quadrature in terms of Fourier cosine series, and a [quick review of cosine series](http://math.mit.edu/~stevenj/cosines.pdf).

New topic: **numerical integration** (numerical quadrature). Began by basic definition of the problem (in 1d) and differences from general ODE problems. Then gave trapezoidal quadrature rule, and simple argument why the error generally decreases with the square of the number of function evaluations.

Showed numerical experiment (see handout) demonstrating that sometimes the trapezoidal rule can do much better than this: it can even have exponential convergence with the number of points! To understand this at a deeper level, I analyze the problem using Fourier cosine series (see handout), and show that the error in the trapezoidal rule is directly related to the convergence rate of the Fourier series. Claimed that this convergence rate is related to the smoothness of the periodic extension of the function, and in fact an analytic periodic function has Fourier coefficients that vanish exponentially fast, and thus the trapezoidal rule converges exponentially in that case. Proved by integration by parts of the Fourier series. In fact, we find that only the _odd_\-order derivatives at the endpoints need to be periodic to get accelerated convergence.

### Lecture 34 (May 12)

* [video](https://mit.zoom.us/rec/share/bszeFw29UP92OesGJQppz-uB0h8F0eVD_fg7INuVDrQV1GAMK5aJBzf9oLoLaKk.wt9ocOPFDckxe6tQ?startTime=1620846106000)

Continued analysis of trapezoidal-rule quadrature, from notes of last lecture.

Explained the idea of Clenshaw–Curtis quadrature as a change of variables + a cosine series to turn the integral of _any_ function into the integral of periodic functions. This way, functions only need to be analytic on the interior of the integration interval in order to get exponential convergence. (See Wikipedia handout.)

### Lecture 35 (May 14)

* [video](https://mit.zoom.us/rec/share/ZDmD6UIEybtemfOssMgfw6f87E6qZUtmwzWi6DHc4MX-9XfWk4Op2q5Kqng5ky8.Eggn9BlZcz8UxtFt?startTime=1621018860000)
* [ApproxFun demo](https://nbviewer.jupyter.org/github/mitmath/18335/blob/spring21/notes/ApproxFun-demo.ipynb)

Finished discussion of Clenshaw–Curtis quadrature.

Mentioned (as in the handout) how to precompute the weights in terms of a discrete cosine transform, rather than cosine-transforming the function values every time one needs an integral, via a simple transposition trick.

Mentioned the utility of **nested quadrature** rules for _a posteriori_ error estimation and adaptive quadrature. Discussed p-adaptive vs. h-adaptive adaptive schemes.

Explained connection of Clenshaw-Curtis quadrature and cosine series to Chebyshev polynomials. This leads into the general topic of Chebyshev approximation, and how we can approximate any smooth function on a finite interval by a polynomial with exponential accuracy (in the degree of the polynomial) as long as we interpolate via Chebyshev points.

Using Chebyshev approximation, explained how lots of problems can be solved by first approximating a nasty function via a polynomial, at which point one can just use easy methods for polynomials. Showed examples of root finding, minimization, and integration via the [ApproxFun](https://github.com/ApproxFun/ApproxFun.jl) package for Julia, which implements a modern version of these ideas (following in the tracks of the pioneering [chebfun](http://www.chebfun.org/) package for Matlab).

**Further reading**: Lloyd N. Trefethen, "[Is Gauss quadrature better than Clenshaw-Curtis?](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.157.4174)," _SIAM Review_ **50** (1), 67-87 (2008). Pedro Gonnet, [A review of error estimation in adaptive quadrature](http://dl.acm.org/citation.cfm?id=2333117), _ACM Computing Surveys_ **44**, article 22 (2012).  [Chebyshev polynomials on Wikipedia](http://en.wikipedia.org/wiki/Chebyshev_polynomials), free book online [Chebyshev and Fourier Spectral Methods](http://www-personal.umich.edu/~jpboyd/BOOK_Spectral2000.html) by John P. Boyd, the [chebfun package](http://www2.maths.ox.ac.uk/chebfun/) for Matlab by Trefethen et al., and the lecture notes from [Numerical Complex Analysis by Sheehan Olver](http://www.maths.usyd.edu.au/u/olver/teaching/NCA/).

### Lecture 36 (May 17)

* [video](https://mit.zoom.us/rec/share/NHzH5JJXQRSG4ZPiUYZ8Vrl7zNFTQqXm5n16rznce_itg2_Lvl-cgpejWJE-gNPH.Kpk_qNhWdQfnj-8V?startTime=1621278104000)

Introduced the [discrete Fourier transform (DFT)](https://en.wikipedia.org/wiki/Discrete_Fourier_transform).   Talked about its history (Gauss!), properties (unitarity, convolution theorem), aliasing, special case of the [type-1 discrete cosine transform (DCT)](https://en.wikipedia.org/wiki/Discrete_cosine_transform), and applications (Chebyshev and other spectral methods for integration, PDEs, etcetera; signal processing, [multiplying large numbers](https://en.wikipedia.org/wiki/Sch%C3%B6nhage%E2%80%93Strassen_algorithm)), etc.

A [fast Fourier transform (FFT)](https://en.wikipedia.org/wiki/Fast_Fourier_transform) is an O(N log N) algorithm to compute the DFT.  There are many such algorithms, the most famous of which is the Cooley–Tukey algorithm (1965, though there were many precursors dating back to Gauss himself).

Reviewed the definition of the DFT and some important properties: unitarity/inverses, the [convolution theorem](https://en.wikipedia.org/wiki/Convolution_theorem) & diagonalizing [circulant matrices](https://en.wikipedia.org/wiki/Circulant_matrix), and connection to discrete cosine transforms (= DFT for real mirror-symmetric input).

### Lecture 37 (May 19)

* [video](https://mit.zoom.us/rec/share/Qi_SMbMyiH3D4BJy8xsFvfV8YFPd6nvhB0Dr_P1sGhqx25oZKpiIOJb_zMwpxASr.b6cw3YHF-TZl2lil?startTime=1621450874000)
* [notes on FFTs](notes/fft-iap3.pdf)
* [slides on FFTs and FFTW](notes/FFT.pdf)

**Further reading**: The [Wikipedia FFT article](https://en.wikipedia.org/wiki/Fast_Fourier_transform) (partially written by SGJ) was still not bad last I checked. [Gauss and the history of the fast Fourier transform](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.309.181) (1985) is a wonderful article on the historical development of the FFT.  [Duhamel & Vetterli (1990)](https://doi.org/10.1016%2F0165-1684%2890%2990158-U) is a classic review article.