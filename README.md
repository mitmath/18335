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

* Psets will be **submitted electronically via Canvas**.  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://www.piazza.com/mit/spring2022/18335/home)

* previous midterms: [fall 2008](https://github.com/mitmath/18335/blob/fall08/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall08/midterm-sol.pdf), [fall 2009](https://github.com/mitmath/18335/blob/fall09/midterm-f09.pdf) (no solutions), [fall 2010](https://github.com/mitmath/18335/blob/fall10/midterm-f10.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall10/midterm-sol-f10.pdf), [fall 2011](https://github.com/mitmath/18335/blob/fall11/midterm-f11.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall11/midtermsol-f11.pdf), [fall 2012](https://github.com/mitmath/18335/blob/fall12/midterm-f12.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall12/midtermsol-f12.pdf), [fall 2013](https://github.com/mitmath/18335/blob/fall13/midterm-f13.pdf) and [solutions](https://github.com/mitmath/18335/blob/fall13/midtermsol-f13.pdf), [spring 2015](https://github.com/mitmath/18335/blob/spring15/exams/midterm-s15.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring15/exams/midtermsol-s15.pdf), [spring 2019](https://github.com/mitmath/18335/blob/spring19/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring19/psets/midtermsol.pdf), [spring 2020](https://github.com/mitmath/18335/blob/spring20/psets/midterm.pdf) and [solutions](https://github.com/mitmath/18335/blob/spring20/psets/midtermsol.pdf).

**TA/grader:** TBD

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will be an 8–15 page paper reviewing some interesting numerical algorithm not covered in the course. See the [18.335 final-projects page](project/final_project.md) for more information, including topics from past semesters.

Assignments
------------
* [Pset 1](psets/pset1.pdf) is due on Friday, February 18 at 12pm.

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





