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

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617).

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) are useful surveys.

**Grading**: 40% problem sets (four psets due / released every other Friday), 30% **take-home mid-term exam** (First week of April), 30% **final project** ([one-page proposal](project/final_project.md) due TBD, project due TBD).

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
* Orthgonal/Unitary matrices
* The singular value decomposition (SVD)

** Further Reading:** L. N. Trefethen, Lectures 4 and 5.


### Lecture 7 (February 23)

* Gaussian elimination and A = LU (no row interchanges)
* Cost (flops) for A = LU and Ux = b
* Solving Ax=b via A=LU: when to save L?
* Partial pivoting and backward stability (counterexamples)

** Further Reading:** L. N. Trefethen, Lectures 20, 21, and 22. Can you bring GE's instability to life in this [example](https://github.com/mitmath/18335/blob/master/notes/Is-Gaussian-Elimination-Unstable.ipynb)?

### Lecture 8 (February 28)

This lecture is remote (MIT only): https://mit.zoom.us/j/96174583317


