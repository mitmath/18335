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

**Grading**: 40% problem sets (about six, ~biweekly). 20% **take-home mid-term exam** (posted Thursday **Apr. 15** and due Friday **Apr. 16**), 40% **final project** ([one-page proposal](psets/proposal.md) due Friday March 26, project due Thursday **May 20**).

* Psets will be **submitted electronically via Canvas**.  Submit a good-quality PDF *scan* of any handwritten solutions and *also* a PDF *printout* of a Julia notebook of your computational solutions.

* [Piazza discussion board](https://piazza.com/class/kkzx1wp9ldz55x)

**TA/grader:** [Mo Chen](https://math.mit.edu/directory/profile.php?pid=2176).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.335. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

* You can use [psetpartners.mit.edu](https://psetpartners.mit.edu/) to help you find classmates to chat with.

**Final Projects**: The final project will be an 8–15 page paper reviewing some interesting numerical algorithm not covered in the course. See the [18.335 final-projects page](psets/proposal.md) for more information, including topics from past semesters.

Lecture Summaries and Handouts
------------------------------

### Lecture 1 (Feb 3)

* [video](https://mit.zoom.us/rec/share/OO-jZpJ8Oqgq1uldUFFRTonp1nTS8nZefxAdthbSYENuZbGyAZr0qLC1i02mhWEc.m158MsEBn6vBvI8t?startTime=1613591715000)
* [handwritten notes](https://www.dropbox.com/s/wxd3pwsy3ijblnp/18.335%20Spring%202021.pdf?dl=0) for this and subsequent lectures
* [pset 1](psets/pset1.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/psets/pset1.ipynb), due Monday, March 1.
* [Newton's method for square roots](notes/newton-sqrt.pdf) and accompanying [notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Newton-Square-Roots.ipynb).

Brief overview of the huge field of numerical methods, and outline of the small portion that this course will cover. Key new concerns in numerical analysis, which don't appear in more abstract mathematics, are (i) performance (traditionally, arithmetic counts, but now memory access often dominates) and (ii) accuracy (both floating-point roundoff errors and also convergence of intrinsic approximations in the algorithms).

As a starting example, considered the convergence of Newton's method (as applied to square roots); see the handout and Julia notebook above.

**Further reading:** Googling "Newton's method" will find lots of references; as usual, the [Wikipedia article on Newton's method](https://en.wikipedia.org/wiki/Newton's_method) is a reasonable starting point. Beware that the terminology for the [convergence order](https://en.wikipedia.org/wiki/Rate_of_convergence) (linear, quadratic, etc.) is somewhat different in this context from the terminology for discretization schemes (first-order, second-order, etc.); see e.g. the linked Wikipedia article. Homer Reid's [notes on machine arithmetic](http://homerreid.dyndns.org/teaching/18.330/Notes/RootFinding.pdf) for [18.330](http://homerreid.dyndns.org/teaching/18.330/) are an excellent introduction that covers several applications and algorithms for root-finding. For numerical computation in 18.335, we will be using the Julia language: see this [information on Julia at MIT](https://github.com/mitmath/julia-mit).


### Lecture 2 (Feb 19)

* [video](https://mit.zoom.us/rec/share/VU1OJIaW5sVyUDONOE9O0EDoGOMJaUxCSKoUZGd8r3kqi0H9L67_785_xSHdhQJK.KvAparctLJ79AwYH?startTime=1613764649000)
* [notes on floating-point](notes/lec8handout6pp.pdf) (18.335 Fall 2007; also [slides](notes/lec8.pdf))
* Julia [floating-point notebook](https://nbviewer.jupyter.org/github/mitmath/18335/blob/master/notes/Floating-Point-Intro.ipynb)
* some [floating-point myths](notes/fp-myths.pdf)

New topic: **Floating-point arithmetic**

The basic issue is that, for computer arithmetic to be fast, it has to be done in hardware, operating on numbers stored in a fixed, finite number of digits (bits). As a consequence, only a _finite subset_ of the real numbers can be represented, and the question becomes _which subset_ to store, how arithmetic on this subset is defined, and how to analyze the errors compared to theoretical exact arithmetic on real numbers.

In **floating-point** arithmetic, we store both an integer coefficient and an exponent in some base: essentially, scientific notation. This allows large dynamic range and fixed _relative_ accuracy: if fl(x) is the closest floating-point number to any real x, then |fl(x)-x| < ε|x| where ε is the _machine precision_. This makes error analysis much easier and makes algorithms mostly insensitive to overall scaling or units, but has the disadvantage that it requires specialized floating-point hardware to be fast. Nowadays, all general-purpose computers, and even many little computers like your cell phones, have floating-point units.

Overview of **floating-point** representations, focusing on the IEEE 754 standard (see also handout from previous lecture). The key point is that the nearest floating-point number to _x_, denoted fl(_x_), has the property of _uniform relative precision_ (for |_x_| and 1/|_x_| < than some _range_, ≈10³⁰⁰ for double precision) that |fl(_x_)−_x_| ≤ εmachine|_x_|, where εmachine is the relative "machine precision" (about 10⁻¹⁶ for double precision). There are also a few special values: ±Inf (e.g. for [overflow](https://en.wikipedia.org/wiki/Arithmetic_overflow)), [NaN](https://en.wikipedia.org/wiki/NaN), and ±0 (e.g. for [underflow](https://en.wikipedia.org/wiki/Arithmetic_underflow)).

Went through some simple examples in Julia (see notebook above), illustrating basic syntax and a few interesting tidbits.  In particular, we looked at two examples of [catastrophic cancellation](https://en.wikipedia.org/wiki/Loss_of_significance) and how it can sometimes be avoided by rearranging a calculation.

**Further reading:** Trefethen, lecture 13. [What Every Computer Scientist Should Know About Floating Point Arithmetic](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.6768) (David Goldberg, ACM 1991). William Kahan, [How Java's floating-point hurts everyone everywhere](http://www.cs.berkeley.edu/~wkahan/JAVAhurt.pdf) (2004): contains a nice discussion of floating-point myths and misconceptions.   A brief but useful summary can be found in [this Julia-focused floating-point overview](https://discourse.julialang.org/t/psa-floating-point-arithmetic/8678) by Prof. John Gibson.


### Julia tutorial (Feb 19: 5pm) — optional

* [video](https://mit.zoom.us/rec/share/-d9QInu9gX9K9RjKSDAzCkfOSGwZQeefhaWu_atpkvaW7JBMGlFkHD8WRw8Ch-Q.dLAhy2244T0p9dku)
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