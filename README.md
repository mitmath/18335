#  18.335J/6.337J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.337J course at MIT, taught by Dr. [Andrew Horning](https://math.mit.edu/directory/profile.php?pid=2334), in Spring 2022.

Syllabus
--------

**Lectures**: Monday/Wednesday 11am–12:30pm in room 4-237

**Office Hours:** Tuesday @ 2pm and Wendesday @ 1pm in room 2-238C

**Contact:** horninga@mit.edu

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of [Julia](http://julialang.org/), a Matlab-like environment (little or no prior experience required; you will learn as you go).

Launch a Julia environment in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mitmath/binder-env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18335%26urlpath%3Dtree%252F18335%252F%26branch%3Dmaster)

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). 18.335 is a graduate-level subject, however, so much more mathematical maturity, ability to deal with abstractions and proofs, and general exposure to mathematics is assumed than for 18.06!

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617).

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 40% problem sets (four psets due / released every other Friday), 30% **take-home mid-term exam** (first week of April), 30% **final project** ([one-page proposal](project/final_project.md) due Wednesday March 30, project due Monday **May 9**).

* Psets will be **submitted electronically via Canvas** (navigate to the Gradescope tab to submit).  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://www.piazza.com/mit/spring2022/18335/home)

* previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf), [spring 2020](https://github.com/mitmath/18335/blob/spring20/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring20/psets/midtermsol.pdf).

**TA/grader:** TBD

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will be an 8–15 page paper reviewing some interesting numerical algorithm not covered in the course. See the [18.335 final-projects page](project/final_project.md) for more information, including topics from past semesters.

Assignments
------------
* [Pset 1](psets/pset1.pdf) is due on Friday, February 18 at 12pm.
* [Pset 2](psets/pset2.pdf) is due on Friday, March 4 at 12pm.
* [Pset 3](psets/pset3.pdf) is due on Friday, March 18 at 12pm.
* [Pset 4](psets/pset4.pdf) is due on Friday, April 22 at 12pm.

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (January 31)

This course is about Numerical Linear Algebra (NLA) and related numerical methods. But why do we need NLA? How does it fit in to other areas of computational science and engineering (CSE)? Three simple examples illustrate how NLA problems arise naturally when solving problems drawn from across continuous applied mathematics. 
* Solving Poisson's equation: from charge density to electric potential. (Linear systems: LU and Cholesky, iterative methods.)
* Schrodinger's equation: quantizing energy at the smallest scales. (Eigenvalue problems: QR algorithm, Krylov iterations.)
* Dynamic Mode Decomposition: learning models from data. (Least squares: QR factorization, SVD.)

NLA is often applied in tandem with tools from other fields of mathematics: approximation theory, functional analysis, and statistics, to name a few. We'll focus on NLA, which is a computational workhorse within CSE.

**Further Reading:** L.N. Trefethen, [The Definition of Numerical Analysis](https://people.maths.ox.ac.uk/trefethen/essays.html). 

### Lecture 2 (February 2)

To do linear algebra on a computer, we need to approximate real numbers and their arithmetic. Chasing significant digits leads us to _floating point numbers_, which have some excellent approximation properties:
* For any real number x, there is a floating point x' that satisfies |x' - x| <= 0.5 |x| **eps_mach**. **eps_mach** is about 2.22e-16 in IEEE double precision.
* For any two floating point numbers x and y, floating point arithmetic is equivalent to rounding the exact result to the nearest floating point number (we called this _exact rounding_).
* The above two facts give us the "fundamental theorem of floating point arithmetic" (p. 99, Trefethen), which says the relative error in a single floating point operation (e.g., adding two floating point numbers) is no greater than **eps_mach**.

There are a few things to watch out for in floating point arithmetic: overflow and underflow (due to finite exponent), and catastrophic cancellation (when all significant digits cancel).

To develop reliable algorithms for numerical linear algebra, we'll need to understand how rounding errors can accumulate over many floating point operations. The fundamental theorem above will our key tool to understand and control error accumulation.

**Further Reading:** L. N. Trefethen, Lecture 13.

### Lecture 3 (February 7)

The algorithms of NLA are usually implemented with floating point arithmetic, which introduces rounding errors. The accuracy of our algorithms depends crucially on how these rounding errors propagate and accumulate. Broadly, this will depend on the *conditioning* of the underlying problem and the *stability* of the algorithm.
* Ideally, we might hope that the relative error in the output of our algorithms is "small" for any allowed input (*forward stability*). However, this is usually placing too much burden on the algorithm. *Ill conditioned* problems can be highly sensitive to perturbations in the input, so rounding errors in the input alone may cause large changes in the output, even if everything afterward is computed perfectly!
* A fairer way to evaluate our algorithms is to compare them with this idealized algorithm that computes exactly with the rounded inputs. A *backward stable* algorithm computes an exact output for a perturbed input whose relative error is "small" (compared with the exact input).

Backward stable algorithms "give exactly the right answer to nearly the right question" (Trefethen, p. 104). For example, summing a set of floating point numbers by accumulating the partial sums is backward stable - it's as if we summed a slightly perturbed set of numbers in exact arithmetic. The beauty of backward stability analysis is that it separates inherent sensitivity in the problem from the stability of the algorithm used to solve it. Intuitively, backward stable algorithms provide accurate outputs when the problem is not too sensitive to perturbed inputs. To say more, we need to understand *condition numbers*, which attempt to quantify a problem's sensitivity.

**Further Reading:** L. N. Trefethen, Lectures 12, 14, and 15.

### Lecture 4 (February 9)

The *condition number* k(x) of a problem quantifies how small perturbations in the inputs affect the outputs. If the condition number is large, small perturbations in the inputs can lead to very large changes in the outputs. We say that such problems are *ill-conditioned*. On the other hand, *well-conditioned* problems have modest condition numbers. Critically, k(x) is **independent** of the algorithm used to solve the problem on a computer. It is an inherent property of the mathematical problem (but may vary by a constant, depending on the norm used to measure perturbations).
* For differentiable functions the condition number is the (scaled) norm of the Jacobian, the matrix of partial derivatives that governs the first-order linear response in the output.
* The forward relative error for a backward stable algorithm is on the order of k(x) **eps_mach** (see the [notes](notes/) for the precise statement). In general, the backward error of an algorithm can be amplified by the condition number in the forward error.
* For the summation of n real numbers, k(x) = 1 (in the 1-norm) when the summands are positive, but can be arbitrarily large when mixed signs lead to large cancellations.

Backward error analysis provides an elegant framework to evaluate the stability of an algorithm. To judge the accuracy of an algorithm's outputs, one then converts backward error bounds to forward error bounds through the condition number. This will be our guiding paradigm when we analyze the accuracy of NLA's foundational algorithms in the coming weeks.

### Lecture 5 (February 14)

A fundamental task of linear algebra is the solution of linear systems of equations. In matrix notation, we write Ax = b where A is an m x n matrix, b is an m x 1 vector, and x is the n x 1 vector of unkowns. In high-level languages like Julia (and Matlab, Python, etc.), one can 'solve' Ax = b with the powerful "backslash" operator: x = A \ b. But what is the backslash operator really doing? Over the next several lectures, we will examine the core NLA algorithms that illuminate the "how" and "why" of backslash for dense, unstructured matrices. To get started, we ask a simpler question: what does it mean to solve Ax = b?

Undergraduate linear algebra teaches us that there may be zero, one, or infinitely many solutions to Ax=b. We can get to the heart of the matter quickly with the singular value decomposition (SVD) of A. The SVD decomposes A into two rotations/reflections and a non-negative diagonal scaling. By rotating the inputs and outputs of our linear system, we can replace A x = b with a simpler diagonal system. The non-negative scaling factors are called _singular values_ of A and the rotated bases are called _singular vectors_.
* When n = m, we have a square matrix. If A is invertible, we have a unique solution x = inv(A) b. A laundry list of equivalent conditions for invertibility of a square matrix all point to the same picture: the columns of A span the m-dimensional space of outputs and x describes the coordinates of b in the basis of column vectors. A is invertible whenever the singular values are nonzero and we say that A has full rank.
* When n<m, we have too few equations and too many unkowns. When the singular values of A are nonzero, we say that A has full row rank and we will have infinitely many solutions. Which one should we pick?
* When n>m, we have too many equations and too few unknowns. If the singular values of A are nonzero, we say that A has full column rank and we cannot solve Ax = b exactly (unless b happens to lie exactly in the column space of A). Instead, we try to minimize the Euclidean length between the left and right-hand side, i.e., min_x ||Ax-b||. The length of the projection of b onto the bottom n-m left singular vectors of A tells us exactly how small we can make ||Ax-b||.

The SVD is extremely powerful, both conceptually and numerically. We'll revisit it's computation when we discuss the eigenvalue decomposition later in the course, but will look at simpler, (often) more efficient methods to solve Ax=b first. In the meantime, we'll often turn to the SVD for insight into the problems and algorithms of NLA.

**Further Reading:** L. N. Trefethen, Lectures 4-5. (Lectures 1-3 are highly recommended for a quick linear algebra review.)

### Lecture 6 (February 16)

The SVD decouples a linear system of equations by _diagonalizing_ the coeffient matrix A. Solving and analyzing a diagonal system is easy because we can calculate all the unkowns independently. However, computing the SVD of A can be fairly expensive on a computer. It is usually cheaper to _triangularize_ A and then solve with forward or backward susbstitution.
* Gaussian elimination (without pivoting) triangularizes A with sequences of elementary row operations.
* In matrix form, elementary row operations are equivalent to left multiplication by structured lower triangular matrices. Inverting these transformations yields the factorization A = LU, where L is lower triangular and U is upper triangular
* After computing A = LU, solving Ax = b requires two triangular solves.

Unfortunately, solving Ax = b by LU factorization in floating point arithmetic is terrifically unstable. In practice, it is necessary to introduce special row/column permutations during Gaussian elimination, which lead to _pivoting_ strategies.

**Further Reading:** L.N. Trefethen, Lectures 20-21.

### Lecture 7 (February 22 - MIT Monday schedule)

Computing A = LU by Gaussian elimination (GE) fails entirely if a row operation involves division by zero. Similarly, dividing by a very small number can introduce large backward errors because very large numbers in L and U can lead to catastrophic cancellation errors in the product LU. In general, the backward error can be large when ||L|| and/or ||U|| are much larger than ||A||. To control growth in the LU factors, we can use row permutations to avoid dividing by small numbers during elimination. This strategy is called partial pivoting.
* Entries used for elimination are called pivots. They appear in the denominator of the multipliers which make up the (strictly) lower triangular part of  L.
* Partial pivoting selects the maximum entry on or below the diagonal as the pivot, consequently, the entries of L are always <= 1.
* A clever repackaging of permutation and elimination matrices reveals that GE with partial pivoting computes an LU factorization of A after row permutation (in exact arithmetic). This is the factorization PA = LU.

Because ||L|| = O(1) when partial pivoting is employed, the stability of GE (with partial pivoting) boils down to growth in U relative to A. Are there matrices for which ||U|| is much larger than ||A||? The answer is yes, but they essentially never appear in practice. In theory GE is unstable, but in practice it behaves like a backward stable algorithm when partial pivoting is employed. With a fascinating history stretching back centuries, GE remains the algorithm of choice for solving dense, unstructured m x m linear systems of equations.

**Further Reading:** L.N. Trefethen, Lectures 21-22. Also, experiment with the [GE notebook](notes/Is-Gaussian-Elimination-Unstable.ipynb).

### Lecture 8

For a symmetric positive definite matrices, Gaussian elimination can be performed twice as fast, without pivoting, and is backward stable. This is the _Cholesky decomposition_, A = R R^T. Cholesky introduces zeros in both columns and rows by applying left and right elimination matrices in a symmetric manner. By preserving symmetry at each step and working only with the lower triangular part of A, one cuts the workload of triangularization in half.

When A has more rows than columns the system is overdetermined and typically does not have an exact solution. The _least-squares_ solution minimizes the residual norm ||Ax-b|| in two steps:
* Project b onto the column space of A.
* Solve Ax = Pb with the projected right-hand side.

_Gram-Schmidt orthogonalization_ of the columns of A leads to the _QR factorization_ A = QR. The columns of Q form an orthonormal basis for the column space of A and R is an upper triangular matrix. The least-squares problem becomes Rx = Q^T b, which can be solved efficiently with back-substitution. This "classical" Gram-Schmidt procedure is unstable, so we'll take a closer look at two alternative algorithms for A = QR in Lecture 9.

**Further Reading:** L.N. Trefethen, Lecture 7 and 23.

#### Lecture 9

Gram-Schmidt orthogonalization in its classical form is unstable, but there is a simple fix: orthogonalize all following columns (j > k) against q_k as soon as q_k is computed. This incremental orthogonalization of the columns has superior stability properties and is usually a better way to compute A = QR. However, both classical and modified Gram-Schmidt may suffer from _loss of orthogonality_: the columns of Q may be far from orthogonal when the columns of A are nearly linearly independent.

Another option when computing A = QR is to triangularize A via orthogonal (or unitary) transformations. Working with orthogonal matrices is a game-changer in numerical analysis, because rotations and reflections don't amplify errors or cancel catastrophically in the way that other transformations (such as elimination matrices) are prone to do. Triangularization of A with orthgonal matrices can be formulated using rotations (Givens) or reflections (Householder). These orthogonal transformations form the foundation of backward stable algorithms throughout NLA.

**Further Reading:** L.N. Trefethen, Lectures 8 and 10.

### Lecture 10

Triangularizing a matrix A with Householder reflections provides the first _backward stable_ factorization algorithm that we have encountered in this course. They key enabling property is that Householder reflections are always orthogonal transformations, even when the generating vectors (reflectors) are computed inexactly in floating point! In practice, the orthogonal factor Q is usually not stored explicitly: instead, the reflectors are stored and used to efficiently and stably apply Q and Q^T to vectors. Consequently, orthogonal Householder transformations
* avoid large relative errors (e.g., cancellation) in the product QR, and
* maintain orthogonality even when A is ill-conditioned.

In addition to its superior stability, Householder QR is more efficient (in the classical 'flops' metric) than Gram-Schmidt because it works with submatrices of decreasing row and column dimension (similar to Gaussian elimination), whereas only row dimension decreases during Gram-Schmidt. 

Backward stable factorizations frequently act as building blocks for the design of backward stable algorithms in NLA. For example, Householder QR provides us with an efficient backward stable method for computing least-squares solutions to overdetermined linear systems. Householder QR is typically the method of choice for general purpose "backslash"-style algorithms when confronted with rectangular linear systems.

**Further Reading:** L.N. Trefethen, Lectures 11, 16, and 19.

### Lecture 11

During the past few weeks, we have focused on the numerical solution of linear systems, Ax = b, by _triangularizing_ the coefficient matrix A. We now turn to a second classical problem in linear algebra: the eigenvalue problem, Ax = lambda x. The eigenvalues (lambda) and eigenvectors (x) of matrices play a central role in their _diagonalization_. Not every matrix is diagonalized by its eigenvectors, but every **symmetric matrix is diagonalized by an orthonormal set of eigenvectors**. The eigenvectors of the symmetric nonnegative matrices A * A^T and A^T * A are the left and right singular vectors of A, respectively, while the singular values are the (nonnegative) square roots of their shared eigenvalues. The eigenvalue decomposition of a symmetric nonnegative matrix coincides with its SVD.

Eigenvalues and eigenvectors appear throughout applied math in a stunning variety of roles. Common themes that link their applications are 
* decoupling equations that evolve linearly over time, where it is important to keep the same basis for inputs and outputs.
* asymptotic behavior of linear evolution equations.
* resonant response of linear systems to select inputs (see 18.03 notes).

There is no general purpose direct method that computes the eigenvalues of a matrix A in a finite number of algebraic operations on the computer. This is because the eigenvalues of A are the roots of the _characteristic polynomial_ p(lambda) = det(A - lambda * I), and the roots of polynomials (degree => 5) have no closed form expression in terms of algebraic operations (add, multiply, and nth roots). Instead, we'll develop _iterative methods_ that aim to efficiently refine approximate eigenvalues and eigenvectors of A, but usually do not converge to the true values in finitely many operations.

**Further Reading:** L.N.T. Lectures 25 and 27.

### Lecture 12

In its simplest form, the QR algorithm calculates all of the eigenvalues of a square matrix A by iterating two steps: (1) compute the qr factorization A = QR, and (2) recombine the factors backwards A <- RQ. Remarkably, the diagonal entries of A typically converge to the eigenvalues of the original matrix as the iteration progresses! When A is symmetric, the product of orthogonal factors from each iteration typically converge to the associated eigenvector matrix. But what makes this remarkable iteration converge? 

The simple form of the QR algorithm can be understood through the lens of _simultaneous power iterations_. Power iterations extract approximations to the dominant eigenvalue and eigenvector of A by applying powers of A to an initial "guess" and normalizing. If we apply powers of A simultaneously to a set of m linearly independent vectors and periodically orthgonalize, we can even get approximations to the dominant m eigenpairs. These approximations generically converge geometrically for (real) symmetric matrices with distinct eigenvalues. The key to understanding the QR iteration is the equivalence between QR iterates and simultaneous power iterates.

**Further Reading:** L.N.T. Lecture 28.

### Lecture 13

To make the QR algorithm computationally efficient, it is essential that (1) each iteration can be executed efficiently, and (2) the iterates converge rapidly. To address (1), we split the computation into a direct phase and an iterative phase. For symmetric matrices, this two-phase approach takes the form:
* **Tridiagonal reduction:** The symmetric matrix A is reduced to tridiagonal form by a finite sequence of orthogonal similarity transformations (i.e., Householder reflections). The tridiagonal output has the same eigenvalues as A and its eigenvectors are related by an orthogonal transformation. This phase costs O(m^3) flops.
* **Tridiagonal QR iteration:** QR iterations preserve symmetric tridiagonal structure. Moreover, sparsity and symmetry allow rapid execution in this case, taking just O(m) flops / iteration.

Simultaneous power iterations can converge very slowly when the eigenvalues of A are not well-separated and the same problem afflicts generic QR iterations. To accelerate convergence, it is essential to introduce carefully selected _shifts_ at each iteration in the second phase. To see how to select the shifts, we move from power iterations to Rayleigh Quotient iterations (RQI) and discover a hidden link between RQI and the last column of the QR iterates. The last row and column of the tridiagonal matrix converges (usually) rapdily to zero, except for the diagonal entry (usually) converging rapidly to an eigenvalue of A. _Deflation_ allows us to drop this last row and column, continuing the iteration with the remaining principle (n-1) x (n-1) submatrix, and so forth.

**Further Reading:** L.N.T. Lectures 26 and 29. For the curious biography of QR author John Francis, see Gene Golub and Frank Uhlig's [article](https://academic.oup.com/imajna/article-abstract/29/3/467/883213?redirectedFrom=fulltext&login=false).

### Lecture 14

Real symmetric (Hermitian) matrices are always diagonalized by an orthogonal (unitary) basis of eigenvectors. The QR algorithm leverages this property: it diagonalizes real symmetric (Hermitian) matrices by applying a sequence of orthogonal (unitary) similarity transformations to A. Consequently, both phases are backward stable. On the other hand, nonsymmetric matrices may not be diagonalized by an orthogonal basis of eigenvectors. So how should we proceed?

Rather than diagonalizing nonsymmetric matrices, the basic QR iterations _triangularize_ them by unitary similarity transformations. This triangular reduction is called the _Schur form_ of A and the eigenvalues of A are revealed along the diagonal. If A is real but nonsymmetric we can work with the _real Schur form_, which has 2 x 2 real diagonal blocks corresponding to any complex conjugate eigenvalue pairs of A. The two phase QR iteration for nonsymmetric matrices is similar to the symmetric QR algorithm with a few adapations. For example, the symmetric tridiagonal reduction and iterations are replaced by upper Hessenberg reduction and iterations and implicit double shifts accelerate convergence to the real Schur form while avoiding complex arithmetic (see the accompanying [notebook](notes/implicit_Q.ipynb)).

As an alternative to the eigendecomposition, we can also diagonalize a nonsymmetric matrix A via the SVD. Here, an adaptation of the two phase QR algorithm applies _different_ orthogonal transformations from the left and right to diagonalize A.

**Further Reading:** L.N.T. Lecture 31. For more on the nonsymmetric QR iterations, deflation, and implicit double shifts, see the accompanying [iJulia notebook](notes/implicit_Q.ipynb).

### Lecture 15

Over the last several weeks, we examined numerical algorithms for the solution of linear systems, least-squares problems, and eigenvalue problems. These algorithms are backward stable (or behaved like backward stable algorithms in practice), meaning they compute exact outputs for slightly perturbed inputs. To understand the accuracy of these algorithms, we turn to perturbation theory and sensitivity analysis.

The _condition number of a matrix_ A bounds the first-order sensitivity of matrix multiplication and the solution of linear systems to perturbed inputs. As the ratio of the largest and smallest singular values, it quantifies how much A can stretch and shrink inputs in different directions. For overdetermined systems, another factor influences the sesnitivity of the least-squares solution: the condition number of the orthogonal projection onto the range of A. Put roughly, both suffer from ill-conditioning when cancellation occurs and the outputs are **much** smaller than the inputs.

**Further Reading:** L.N.T. Lectures 12 and 18.

### Lecture 16

Given a matrix A, how sensitive are its eigenvalues to small perturbations in the entries of A? Broadly speaking, the eigenvalues of matrices with orthogonal eigenvectors are well conditioned. If the eigenvectors are far from orthogonal, some or all of the eigenvalues may be ill-conditioned.
* _Wilkinson's condition number_ describes the first-order sensitivity of a simple eigenvalue using _right_ and _left_ eigenvectors.
* The _epsilon pseudospectrum_ describes how far eigenvalues can travel under perturbations using level sets of the resolvent norm. It is a remarkably versatile tool and recovers classical results like the Bauer-Fike Theorem.

**Further Reading:** See David Bindel's notes on [Gershgorin disks](https://www.cs.cornell.edu/~bindel/class/cs6210-f09/lec24.pdf) and [Bauer-Fike](https://www.cs.cornell.edu/~bindel/class/cs6210-f09/lec25.pdf). Check out the [Pseudospectra Gateway](https://www.cs.ox.ac.uk/pseudospectra/intro.html) for more on the epsilon pseudosepctrum.

### Lecture 17

The algorithms we have studied so far rely on dense matrix factorizations, which are prohibitively expensive for very large matrices (typically requiring O(m^3) flops). However, when large matrices arise in "real world applications" they are often _data-sparse_. For example, large PDE discretizations usually have only O(m) nonzero entries. Can we leverage such sparsity and design scalable algorithms for very large matrices?

A broad class of data-sparse matrices have a fast "mat-vec": they can be multiplied by a vector using only O(m) or O(mlog(m)) flops. Iterative methods based on _Krylov subspaces_ use this fast mat-vec to build up a subspace from which approximate solutions to, e.g., linear systems, eigenvalues, eigenvectors, and more, can be constructed. Ideally, a Krylov subspace of small dimension contains good approximations so that not many mat-vecs are required.

The naive Krylov basis, matrix powers applied to a starting vector, is famously ill-conditioned. The _Arnoldi iteration_ produces an orthonormal basis for the Krylov subspace by applying a modified Gram-Schmidt procedure to the naive Krylov basis. When projected onto this special orthonormal basis, our matrix is transformed to upper Hessenberg form. This upper Hessenberg matrix is the key to constructing approximations from the Krylov subspace.

**Further Reading:** L.N.T. Lectures 32 and 33.

### Lecture 18

An important application of the Arnoldi iteration is the approximation of a few isolated extremal eigenvalues of a matrix. The approximate eigenvalues are the eigenvalues of the small upper Hessenberg matrix, i.e., the Ritz values obtained from a Rayleigh--Ritz projection step with the Arnoldi basis. Among possible Rayleigh--Ritz approximations, the Arnoldi basis is very special: the eigenvalues of the upper Hessenberg matrix are the roots of a minimizing monic polynomial. We can analyze the convergence of the Ritz-values produced by Arnoldi iterations by studying this (min-max) polynomial optimization problem.

**Further Reading:** L.N.T. Lectures 34. For more about the convergence of Arnoldi's Ritz values, see the illuminating review article by [Arno Kuijlaars](https://epubs.siam.org/doi/10.1137/S0036144504445376).

### Lecture 19

Arnoldi is not just useful for eigenvalue problems - it's also the starting point for the Krylov subspace methods used to solve linear systems. The prototype is GMRES, the Generalized Minimal RESidual method. At each step of the Arnoldi iteration, GMRES minimizes the residual Ax - b over the Krylov subspace by solving a small least-squares system involving the rectangular upper Hessenberg matrix from the Arnoldi decomposition.

The convergence of GMRES can again be understood through the lens of an optimal polynomial's size on the spectrum of A. When A has nearly orthogonal eigenvectors and it's spectrum is clustered away from the origin, the residuals often decay rapidly to machine precision, producing excellent approximate solutions to the linear system. However, ill-conditioning, non-normality, and other geometric spectral properties can cause GMRES to converge very slowly and stagnate. In these cases, we typically start looking for a preconditioner.

**Further Reading:** L.N.T. Lecture 35. See the paper by [Driscoll et. al.](https://epubs.siam.org/doi/pdf/10.1137/S0036144596305582) for more about the convergence of GMRES.

### Lecture 20

When the matrix A is symmetric, something remarkable occurs in the Arnoldi iteration. The upper Hessenberg matrix inherits the symmetry of A: it is tridiagonal. Consequently, the Arnoldi vectors can be constructed from a 3-term recurrence and do not need to be explicitly orthogonalized against all previous Arnoldi vectors at each iteration! 

This modified iteration, based on 3-term recurrence, is called the Lanczos iteration. Like Arnoldi, it is often used to compute extremal eigenvalues of A and it provides the foundation for analogues of GMRES based on short recurrences rather than explicit orthogonalization. A word of caution: short recurrences usually lead to a loss of orthogonality in floating point, so one typically needs to reorthogonalize the computed Lanczos vectors periodically.

The Conjugate Gradient method (CG) is a particularly powerful Krylov method for solving Ax = b when A is a symmetric positive definite (SPD) matrix. It relies on short recurrences for fast orthogonal updates of the residual, as well as A-orthogonal updates for special search directions. The sequence of residuals and search directions form, respectively, orthogonal and A-orthogonal bases for the nested Krylov subspaces K_n(A,b). Together, they provide A-optimal approximations to Ax = b from the Krylov subspace.

**Further Reading:** L.N.T. Lectures 36 and 37.

