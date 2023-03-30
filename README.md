#  18.335J/6.7310J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.7310J course at MIT, taught by Dr. [Andrew Horning](https://math.mit.edu/directory/profile.php?pid=2334), in Spring 2023.

Syllabus
--------

**Lectures**: Tuesday/Thursday 11am–12:30pm in room 4-370

**Office Hours:** Wednesday and Thursday at 12:30 - 1:30 in room 2-238C.

**Contact:** horninga@mit.edu

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard, sparse and structured matrices, and linear algebra software. Other topics may include memory hierarchies and the impact of caches on algorithms, nonlinear optimization, numerical integration, FFTs, and sensitivity analysis. Problem sets will involve use of [Julia](http://julialang.org/), a Matlab-like environment (little or no prior experience required; you will learn as you go).

Launch a Julia environment in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mitmath/binder-env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18335%26urlpath%3Dtree%252F18335%252F%26branch%3Dmaster)

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). 18.335 is a graduate-level subject, however, so much more mathematical maturity, ability to deal with abstractions and proofs, and general exposure to mathematics is assumed than for 18.06!

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). For a classical (and rigorous) treatment, see Nick Higham's [Accuracy and Stability of Numerical Algorithms](https://epubs.siam.org/doi/book/10.1137/1.9780898718027).

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 40% problem sets (four psets due / released every other Friday), 30% **take-home mid-term exam** (second week of April), 30% **final project** ([one-page proposal](project/final_project.md) due Friday April 7, project due Tuesday May 16).

* Psets will be **submitted electronically via [Gradescope](https://www.gradescope.com/)** (sign up for Gradescope with the entry code on Canvas).  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://www.piazza.com/mit/spring2022/18335/home)

* previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf), [spring 2020](https://github.com/mitmath/18335/blob/spring20/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring20/psets/midtermsol.pdf).

**TA/grader:** TBD

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will be an 8–15 page paper reviewing some interesting numerical algorithm not covered in the course. See the [18.335 final-projects page](project/final_project.md) for more information, including topics from past semesters.

Assignments
------------

* [Pset 1](https://github.com/mitmath/18335/tree/master/psets) is due on Friday, February 24 at 11:59pm.

* [Pset 2](https://github.com/mitmath/18335/blob/master/psets/pset2.pdf) is due on Friday, March 17 at 11:59pm.

* [Pset 3](https://github.com/mitmath/18335/blob/master/psets/pset3.pdf) is due on Friday, April 14 at 11:59pm.



Lecture Summaries and Handouts
------------------------------

### Lecture 1 (February 7)

This course is about Numerical Linear Algebra (NLA) and related numerical methods. But why do we need NLA? How does it fit in to other areas of computational science and engineering (CSE)? Three simple examples demonstrate how NLA problems arise naturally when solving problems drawn from across continuous applied mathematics. 
* Solving Poisson's equation: from charge density to electric potential. (Linear systems: LU and Cholesky, iterative methods.)
* Dynamic Mode Decomposition: learning models from data. (Least squares: QR factorization, SVD, low-rank approximation.)
* Charge density of interacting electrons: NLA in nonlinear problems. (Eigenvalue problem: QR algorithm, iterative methods)

NLA is often applied in tandem with tools from other fields of mathematics: approximation theory, functional analysis, and statistics, to name a few. We'll focus on NLA, which is a computational workhorse within CSE. The starting point is floating point: how do we respresent _real numbers_ on the computer?

**Further Reading:** L.N. Trefethen, [The Definition of Numerical Analysis](https://people.maths.ox.ac.uk/trefethen/essays.html). 

### Lecture 2 (February 9)

* Floating point arithmetic, exact rounding, and the "fundamental axiom"
* Catastrophic cancellation, overflow, underflow
* Forward and backward stability
* Stability of summation algorithms

**Further Reading:** L. N. Trefethen, Lectures 13 and 14. Also, see the [notebook](https://github.com/mitmath/18335/blob/master/notes/Floating-Point-Intro.ipynb) about floating point.

### Lecture 3 (February 14)

* Vector and matrix norms
* Jacobian and condition numbers
* Accuracy <= backward stable _algorithms_ + well-conditioned _problems_

**Further Reading:** L. N. Trefethen, Lectures 12 and 15.

### Lecture 4 (February 16)

* Solving Ax = b
* Condition number of A
* Orthogonal/Unitary matrices
* The singular value decomposition (SVD)

** Further Reading:** L. N. Trefethen, Lectures 4 and 5.


### Lecture 5 (February 23)

* Gaussian elimination and A = LU (no row interchanges)
* Cost (flops) for A = LU and Ux = b
* Solving Ax=b via A=LU: when to save L?
* Partial pivoting and backward stability (counterexamples)

** Further Reading:** L. N. Trefethen, Lectures 20, 21, and 22. Can you bring GE's instability to life in this [example](https://github.com/mitmath/18335/blob/master/notes/Is-Gaussian-Elimination-Unstable.ipynb)?

### Lecture 6 (February 28)

This lecture is remote (MIT only): https://mit.zoom.us/j/96174583317

* Partial pivoting and PA=LU
* Solving Ax=b via PA=LU
* Backward stability of PA=LU in theory and in practice
* Sparse LU factors via row and column pivoting

** Further Reading:** L. N. Trefethen, Lectures 21 and 22. See the [MATLAB docs](https://www.mathworks.com/help/matlab/ref/lu.html) for PA=LU for more examples of pivoting in action.

### Lecture 7 (March 2)

* The Cholesky decomposition: symmetric elimination for symmetric positive definite (SPD) matrices
* Cost (1/2 of A=LU) and stability (backward stable, no pivoting) of Cholesky
* Column and row pivoting to improve sparsity
* Least-squares solutions to overdetermined linear systems

** Further Reading:** L. N. Trefethen, Lecture 23. See the MATLAB docs for [Cholesky](https://www.mathworks.com/help/matlab/ref/chol.html) and, e.g., [approximate minimal degree (AMD)](https://www.mathworks.com/help/matlab/ref/amd.html) reordering to reduce fill-in.

### Lecture 8 (March 7)

Three ways to compute least-squares solutions to overdetermined linear systems
* The normal equations 
* The singular value decomposition
* The QR decomposition

All three formulations lead to the pseudoinverse of A and are mathematically equivalent, but not numerically equivalent. The SVD approach leverages orthogonal projections to simplify the pseudoinverse and avoid squaring the condition number of the resulting n x n diagonal system for the least-squares solution. While the SVD diagonalizes A by rotating/reflecting inputs and outputs, the QR decomposition triangularizes A by rotating/reflecting outputs. The result is an orthogonal basis for the column space of A and a triangular n x n system to solve for the least-squares solution.

**Further Reading:** L. N. Trefethen, Lectures 11, 18, and 19.

### Lecture 9 (March 9)

* Sensitivity and conditioning of least-squares solutions
* Gram-Schmidt orthogonalization and A = QR
* Loss of orthogonality and modified Gram-Schmidt
* Householder triangularization

**Further Reading:** L. N. Trefethen, Lectures 7, 8, and 9.

### Lecture 10 (March 14)

* Triangularization vs orthogonalization
* "Thin" and "full" QR decompositions
* Computing and applying Householder reflectors
* Householder QR algorithm
* Flop count and backward stability

**Further Reading:** L. N. Trefethen, Lectures 10 and 16. For backward stability analysis, see Chapter 18.3 of Higham.

### Lecture 11 (March 16)

* Householder reflections and Givens rotations demos
* Eigenvalues, eigenvectors, and diagonalizable matrices
* Why do we need eigenvectors? (And not just the SVD)

**Further Reading:** L. N. Trefethen, Lecture 24. Explore the [reflections-and-rotations notebook](https://github.com/mitmath/18335/blob/master/notes/Reflections-Rotations-And-Orthogonal-Transformations.ipynb) and the [least-squares notebook](https://github.com/mitmath/18335/blob/master/notes/Three-Ways-To-Solve-Least-Squares.ipynb) for more computational demos with least-squares and A=QR in Julia.

### Lecture 12 (March 21)

* Eigensolvers must be iterative
* Simultaneous power iterations
* The QR iteration for eigenvalues
* Convergence of QR iterations

**Further Reading:** L. N. Trefethen, Lecture 25 and 28. For the remarkable stories of John Francis and Vera Kublanovskaya, who independently proposed and analyzed the QR algorithm, see Gene Golub and Frank Uhlig's [article](https://academic.oup.com/imajna/article-abstract/29/3/467/883213?redirectedFrom=fulltext&login=false). 

### Lecture 13 (March 23)

* Accelerating power iterations with shift-and-invert
* Rayleigh quotient iterations
* QR iterations with shifts
* Tridiagonal reduction and QR iterations

**Further Reading:** L. N. Trefethen, Lectures 26, 27, and 29.
