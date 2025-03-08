#  18.335J/6.7310J: Introduction to Numerical Methods

This is the repository of course materials for the 18.335J/6.7310J course at MIT, taught by Dr. [Shi Chen](https://math.mit.edu/directory/profile.html?pid=2701), in Spring 2025.

Syllabus
--------

**Lectures**: Monday/Wednesday 9:30am–11am in room 2-190

**Office Hours:** Monday 11am–12pm and Friday 3pm-4pm in room 2-239.

**Contact:** schen636@mit.edu

**Topics**: Advanced introduction to numerical linear algebra and related numerical methods. Topics include direct and iterative methods for linear systems, eigenvalue decompositions and QR/SVD factorizations, stability and accuracy of numerical algorithms, the IEEE floating-point standard. Other topics may include nonlinear optimization, numerical integration, and FFTs. Problem sets will involve use of [Julia](http://julialang.org/), a Matlab-like environment (little or no prior experience required; you will learn as you go).

Launch a Julia environment in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mitmath/binder-env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18335%26urlpath%3Dtree%252F18335%252F%26branch%3Dmaster)

**Prerequisites**: Understanding of linear algebra ([18.06](http://web.mit.edu/18.06/www/), [18.700](http://ocw.mit.edu/OcwWeb/Mathematics/18-700Fall-2005/CourseHome/), or equivalents). 18.335 is a graduate-level subject, however, so much more mathematical maturity, ability to deal with abstractions and proofs, and general exposure to mathematics is assumed than for 18.06!

**Textbook**: The primary textbook for the course is [_Numerical Linear Algebra_ by Trefethen and Bau](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617). For a classical (and rigorous) treatment, see Nick Higham's [Accuracy and Stability of Numerical Algorithms](https://epubs.siam.org/doi/book/10.1137/1.9780898718027).

**Other Reading**: Previous terms can be found in [branches of the 18335 git repository](https://github.com/mitmath/18335/branches). The [course notes from 18.335 in much earlier terms](https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/) can be found on OpenCourseWare. For a review of iterative methods, the online books [Templates for the Solution of Linear Systems](http://www.netlib.org/linalg/html_templates/Templates.html) (Barrett et al.) and [Templates for the Solution of Algebraic Eigenvalue Problems](http://www.cs.utk.edu/~dongarra/etemplates/book.html) (Bai et al.) are useful surveys.

**Grading**: 40% problem sets (three psets due / released every other Friday), 30% **take-home mid-term exam** (second week of April), 30% **final project** (See details below).

* Psets will be **submitted electronically via [Gradescope](https://www.gradescope.com/)** (sign up for Gradescope with the entry code on Canvas).  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://www.piazza.com/mit/spring2025/18335/home)

* previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf), [spring 2020](https://github.com/mitmath/18335/blob/spring20/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring20/psets/midtermsol.pdf).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will explore a numerical topic of your choice that is related to the course material but has not been covered in depth during lectures or problem sets. The project consists of two components:
* **Proposal (due by 11:59 PM, Sunday, April 6)**: A one-page summary outlining your chosen topic and its relevance.
* Final submission: You may choose one of the following formats:
    * **Technical report (5–15 pages)** reviewing an interesting numerical algorithm not covered in the course, due by **11:59 PM, Thursday, May 15**.
    * **Technical presentation (35-minute in-class lecture)**. Limited spots are available, and you may collaborate with one other classmate.
See [this page](https://github.com/mitmath/18335/blob/master/project/final_project_spring2025.pdf) for more details.

Further details will be provided as the semester progresses.

Assignments
------------

* [Pset 1](https://github.com/mitmath/18335/blob/master/psets/pset1.pdf) is due on March 2 at 11:59pm.

* Pset 2 is due on TBD at 11:59pm.

* Pset 3 is due on TBD at 11:59pm.


Lecture Summaries and Handouts
------------------------------

### Lecture 1 (February 3)
* **Scope of Numerical Methods and the key concerns:** A broad introduction to the vast field of numerical methods. Unlike pure mathematics, numerical analysis must account for performance (efficiency) and accuracy (precision and stability).
* **The Importance of Numerical Linear Algebra (NLA):** Why is NLA fundamental? Through examples, we demonstrate how NLA naturally arises in solving a wide range of problems in continuous mathematics.

**Further Reading:** L.N. Trefethen, [The Definition of Numerical Analysis](https://people.maths.ox.ac.uk/trefethen/essays.html), [Lecture notes 1](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture1.pdf).

### Lecture 2 (February 5)
* Floating point arithmetic, exact rounding, and the "fundamental axiom"
* Stability of summation algorithms
* Forward and backward stability

**Further Reading:**  L.N. Trefethen, Lectures 13 and 14. Also, see the [notebook](https://github.com/mitmath/18335/blob/master/notes/Floating-Point-Intro.ipynb) about floating point, [Lecture notes 2](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture2.pdf).

### Lecture 3 (February 10)
* Recap on forward and backward stability, and condition numbers
* Accuracy <= backward stable algorithms + well-conditioned problems
* Vector and matrix norms

**Further Reading:** L. N. Trefethen, Lectures 12 and 15. Also, see the notes about [stability of sum](https://github.com/mitmath/18335/blob/spring21/notes/summation-stability.pdf) and [equivalence of norms](https://github.com/mitmath/18335/blob/spring21/notes/norm-equivalence.pdf), [Lecture notes 3](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture3.pdf).

### Lecture 4 (February 12)
* Solving Ax = b
* Condition number of A
* Orthogonal/Unitary matrices
* The singular value decomposition (SVD)

**Further Reading:** L. N. Trefethen, Lectures 4 and 5. [Lecture notes 4](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture4.pdf).

### Lecture 5 (February 18)

* Recap on SVD and its applications
* Least-squares solutions to overdetermined linear systems
* Normal equations and pseudoinverse
* QR factorization

**Further Reading:** L. N. Trefethen, Lectures 11, 18 and 19. Also, see the notes about [least-squares](https://github.com/mitmath/18335/blob/master/notes/Three-Ways-To-Solve-Least-Squares.ipynb), [Lecture notes 5](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture5.pdf).

### Lecture 6 (February 19)

* Gram-Schmidt orthogonalization and its stability
* Householder transform, Householder QR algorithm and its stability

**Further Reading:** L. N. Trefethen, Lectures 7, 8 and 10. Also, see the notes about [Gram-Schmidt](https://github.com/mitmath/18335/blob/master/notes/Gram-Schmidt.ipynb), [Lecture notes 6](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture6.pdf).

### Lecture 7 (February 24)

* Solving Ax=b via QR factorization: flops and stability
* Solving Ax=b via LU factorization: Gaussian elimination, flops and stability

**Further Reading:** L. N. Trefethen, Lectures 20, 21, and 22. [Lecture notes 7](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture7.pdf)

### Lecture 8 (February 26)

* Pivoting in LU factorization
* LU factorization for symmetric positive definite matrix: Cholesky factorization

**Further Reading:** L. N. Trefethen, Lectures 21, and 22. [Lecture notes 8](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture8.pdf). Can you bring GE's instability to life in this [example](https://github.com/mitmath/18335/blob/master/notes/Is-Gaussian-Elimination-Unstable.ipynb)?

### Lecture 9 (March 3)

* Iterative methods for linear systems
* Convergence of vector sequence
* Matrix splittings and examples
* Convergence of stationary iterative methods

**Further Reading:** Y. Saad, Iterative Methods for Sparse Linear Systems, [Chapter 4](https://epubs.siam.org/doi/10.1137/1.9780898718003.ch4). [Lecture notes 9](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture9.pdf).

### Lecture 10 (March 5)

* Jacobi iteration
* Gauss-Seidel iteration
* Successive over-relaxation (SOR) and optimal relaxation parameter

**Further Reading:** Y. Saad, Iterative Methods for Sparse Linear Systems, [Chapter 4](https://epubs.siam.org/doi/10.1137/1.9780898718003.ch4). [Lecture notes 10](https://github.com/mitmath/18335/blob/master/notes/18.335_Lecture10.pdf).