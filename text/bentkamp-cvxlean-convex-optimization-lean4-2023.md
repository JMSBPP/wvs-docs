---
sha256: ef1f10c6902843b3d2f680aa382b8318149daecc1667e11e4283c4d71168e4b9
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 54310
---
Verified reductions for optimization
Alexander Bentkamp1,2
, Ramon Fernández Mir3
, and Jeremy Avigad4
1
Heinrich-Heine-Universität Düsseldorf, Germany
2
State Key Laboratory of Computer Science, Institute of Software,
Chinese Academy of Sciences, Beijing, China
3
School of Informatics, University of Edinburgh, Edinburgh, UK
4
Carnegie Mellon University, Pittsburgh, PA, USA
Abstract. Numerical and symbolic methods for optimization are used
extensively in engineering, industry, and finance. Various methods are
used to reduce problems of interest to ones that are amenable to solution
by these methods. We develop a framework for designing and applying
such reductions, using the Lean programming language and interactive
proof assistant. Formal verification makes the process more reliable, and
the availability of an interactive framework and ambient mathematical
library provides a robust environment for constructing the reductions
and reasoning about them.
Keywords: convex optimization · formal verification · interactive theo-
rem proving · disciplined convex programming
## 1 Introduction
Optimization problems and constraint satisfaction problems are ubiquitous in en-
gineering, industry, and finance. These include the problem of finding an element
of Rn
satisfying a finite set of constraints or determining that the constraints are
unsatisfiable; the problem of bounding the value of an objective function over a
domain defined by such a set of constraints; and the problem of finding a value
of the domain that maximizes (or minimizes) the value of an objective function.
Linear programming, revolutionized by Dantzig’s introduction of the simplex
algorithm in 1947, deals with the case in which the constraints and objective
function are linear. The development of interior point methods in the 1980s
allows for the efficient solution of problems defined by convex constraints and
objective functions, which gives rise to the field of convex programming [9,35,42].
Today there are numerous back-end solvers for convex optimization problems,
including MOSEK [29], SeDuMi [40], and Gurobi [22]. They employ a variety of
methods, each with its own particular strengths and weaknesses. (See [1, Section
1.2] for an overview.)
Using such software requires interpreting the problem one wants to solve in
terms of one or more associated optimization problems. Often, this is straight-
forward; proving the safety of an engineered system might require showing that
a certain quantity remains within specified bounds, and an industrial prob-
lem might require determining optimal or near-optimal allocation of certain
arXiv:2301.09347v3 [cs.LO] 22 Feb 20232 Bentkamp et al.
resources. Other applications are less immediate. For example, proving an inter-
esting mathematical theorem may require a lemma that bounds some quantity
of interest (e.g. [4]). Once one has formulated the relevant optimization prob-
lems, one has to transform them into ones that the available software can solve,
and one has to ensure that the conditions under which the software is designed
to work correctly have been met. Mathematical knowledge and domain-specific
expertise are often needed to transform a problem to match an efficient convex
programming paradigm. A number of modeling packages then provide front ends
that apply further transformations so that the resulting problem conforms to a
back-end solver’s input specification [14,16,19,25,41]. The transformed problem
is sent to the back-end solver and the solver produces a response, which then
has to be reinterpreted in terms of the original problem.
Our goal here is to develop ways of using formal methods to make the pas-
sage from an initial mathematical problem to the use of a back-end solver more
efficient and reliable. Expressing a mathematical problem in a computational
proof assistant provides clarity by endowing claims with a precise semantics,
and having a formal library at hand enables users to draw on a body of mathe-
matical facts and reasoning procedures. These make it possible to verify math-
ematical claims with respect to the primitives and rules of a formal axiomatic
foundation, providing strong guarantees as to their correctness. Complete for-
malization places a high burden on practitioners and often imposes a standard
that is higher than users want or need, but verification is not an all-or-nothing
affair: users should have the freedom to decide which results they are willing to
trust and which ones ought to be formally verified.
With respect to the use of optimization software, the soundness of the soft-
ware itself is one possible concern. Checking the correctness of a solution to a
satisfaction problem is easy in principle: one simply plugs the result into the
constraints and checks that they hold. Verifying the correctness of a bounding
problem or optimization problem is often almost as easy, in principle, since the
results are often underwritten by the existence of suitable certificates that are
output by the optimization tools. In practice, these tasks are made more difficult
by the fact that floating point calculation can introduce numerical errors that
bear on the correctness of the solution.
Here, instead, we focus on the task of manipulating a problem and reducing
it to a form that a back-end solver can handle. Performing such transformations
in a proof assistant offers strong guarantees that the results are correct and
have the intended meaning, and it enables users to perform the transformations
interactively or partially, and thus introspect and explore the results of indi-
vidual transformation steps. Moreover, in constructing and reasoning about the
transformations, users can take advantage of an ambient mathematical library,
including a database of functions and their properties.
In Section 3, we describe the process that CVXPY and other systems use
to transform optimization problems expressed in the disciplined convex program
(DCP) framework to conic form problems that can be sent to solvers like MOSEK
[29]. In Section 4, we explain how our implementation in the Lean programmingVerified reductions for optimization 3
language and proof assistant [31,32] augments that algorithm so that it at the
same time produces a formal proof that the resulting reduction is correct. DCP
relies on a library of basic atoms that serve as building blocks for reductions,
and in Section 5, we explain how our implementation makes it possible to add
new atoms in a verified way. In Section 6, we provide an example of the way that
one can further leverage the power of an interactive theorem prover to justify
the reduction of a problem that lies outside the DCP framework to one that lies
within, using the mathematical library to verify its correctness. In Section 7, we
describe our interface between Lean and an external solver, which transforms an
exact symbolic representation of a problem into a floating point approximation.
Related work is described in Section 8 and conclusions are presented in Section 9.
We have implemented these methods in a prototype, CvxLean.5
We offer
more information about the implementation in Section 9. A preliminary work-
shop paper [6] described our initial plans for this project and the reduction
framework presented here in Section 2.
## 2 Optimization problems and reductions
The general structure of a minimization problem is expressed in Lean 4 as follows:
structure Minimization (D R : Type) :=
(objFun : D → R)
(constraints : D → Prop)
Here the data type D is the domain of the problem and R is the data type in which
the objective function takes its values. The field objFun represents the objective
function and constraints is a predicate on D, which, in Lean, is represented
as a function from D to propositions: for every value a of the domain D, the
proposition constraints a, which says that the constraints hold of a, is either
true or false. The domain D is often Rn
or a space of matrices, but it can also
be something more exotic, like a space of functions. The data type R is typically
the real numbers, but in full generality it can be any type that supports an
ordering. A maximization problem is represented as a minimization problem for
the negation of the objective function.
A feasible point for the minimization problem p is an element point of D
satisfying p.constraints. Lean’s foundational framework allows us to package
the data point with the condition that it satisfies those constraints:
structure FeasPoint {D R : Type} [Preorder R] (p : Minimization D R) :=
(point : D)
(feasibility : p.constraints point)
The curly and square brackets denote parameters that can generally be inferred
automatically. A solution to the minimization problem p is a feasible point,
denoted point, such that for every feasible point y the value of the objective
function at point is smaller than or equal to the value at y.
5
https://github.com/verified-optimization/CvxLean4 Bentkamp et al.
structure Solution {D R : Type} [Preorder R] (p : Minimization D R) :=
(point : D)
(feasibility : p.constraints point)
(optimality : ∀ y : FeasPoint p, p.objFun point ≤ p.objFun y.point)
Feasibility and bounding problems can also be expressed in these terms. If the
objective function is constant (e.g. the constant zero function), a solution to the
optimization problem is simply a feasible point. Given a domain, an objective
function, and constraints, the value b is a strict lower bound on the value of the
objective function over the domain if and only if the feasibility problem obtained
by adding the inequality objFun x ≤ b to the constraints has no solution.
Lean 4 allows us to implement convenient syntax for defining optimization
problems. For example, the following specifies the problem of maximizing
√
x − y
subject to the constraints y = 2x − 3 and x2
≤ 2:
optimization (x y : R)
maximize sqrt (x - y)
subject to
c1 : y = 2*x - 3
c2 : x^2 ≤ 2
c3 : 0 ≤ x - y
The third condition, c3, ensures that the objective function makes sense and is
concave on the domain determined by the constraints. In some frameworks, like
CVXPY, this constraint is seen as implicit in the use of the expression sqrt (x
- y), but we currently make it explicit in CvxLean. Problems can also depend
on parameters and background conditions. For example, we can replace c1 above
by y = a*x - 3 for a parameter a, and we can replace the objective function by
b * sqrt (x - y) with the background assumption 0 < b.
In Section 6, we will consider the covariance estimation for Gaussian vari-
ables, which can be expressed as follows, for a tuple of sample values y:
optimization (R : Matrix (Fin n) (Fin n) R)
maximize (
Q
i, gaussianPdf R (y i))
subject to
c_pos_def : R.posDef
Here Matrix (Fin n) (Fin n) R is Lean’s representation of the data type of n×n
matrices over the reals, gaussianPdf is the Gaussian probability density function
defined in Section 6, and the constraint R.posDef specifies that R ranges over
positive definite matrices.
If p and q are problems, a reduction from p to q is a function mapping any
solution to q to a solution to p. The existence of such a reduction means that
to solve p it suffices to solve q. If p is a feasibility problem, it means that the
feasibility of q implies the feasibility of p, and, conversely, that the infeasibility
of p implies the infeasibility of q. We can now easily describe what we are after:
we are looking for a system that helps a user reduce a problem p to a problem q
that can be solved by an external solver. (For a bounding problem q, the goal is
to show that the constraints with the negated bound are infeasible by finding aVerified reductions for optimization 5
reduction from an infeasible problem p.) At the same time, we wish to verify the
correctness of the reduction, either automatically or with user interaction. This
will ensure that the results from the external solver really address the problem
that the user is interested in solving.
This notion of a reduction is quite general, and is not restricted to any par-
ticular kind of constraint or objective function. In the sections that follow, we
explain how the notion can be applied to convex programming.
## 3 Reduction to conic form
Disciplined Convex Programming (DCP) is a framework for writing constraints
and objective functions in such a way that they can automatically be transformed
into problems that can be handled by particular back-end solvers. It aims to be
flexible enough to express optimization problems in a natural way but restrictive
enough to ensure that problems can be transformed to meet the requirements
of the solvers. To start with, the framework guarantees that expressions satisfy
the relevant curvature constraints [1,20], assigning a role to each expression:
– Constant expressions and variables are affine.
– An expression f(expr1,...,exprn) is affine if f is an affine function and for
each i, expri is affine.
– An expression f(expr1,...,exprn) is convex if f is convex and for each i, one
of the following conditions holds:
• f is increasing in its ith argument and expri is convex.
• f is decreasing in its ith argument and expri is concave.
• expri is affine.
– The previous statement holds with “convex” and “concave” switched.
An affine expression is both convex and concave. Some functions f come with
side conditions on the range of arguments for which such curvature properties are
valid; e.g. f(x) =
√
x is concave and increasing on the domain {x ∈ R | x ≥ 0}.
A minimization problem is amenable to the DCP reduction if, following the
rules above, its objective function is convex and the expressions occurring in
its constraints are concave or convex, depending on the type of constraint. For
example, maximizing
√
x − y requires minimizing −
√
x − y, and the DCP rules
tell us that the latter is a convex function of x and y on the domain where
x − y ≥ 0, because x − y is affine,
√
· is concave and increasing in its argument,
and negation is affine and decreasing in its argument.
CvxLean registers the properties of atomic functions f(ā) in a library of
atoms. Each such function f is registered with a formal representation exprf(ā)
using expressions, like x * log x or log (det A), that can refer to arbitrary func-
tions defined in Lean’s library. The atom also registers the relevant properties of
f. The curvature of f, curvf, has one of the values convex, concave, or affine, and
the monotonicity of the function in each of its arguments is tagged as increasing,
decreasing, or neither. CvxLean also allows the value auxiliary, which indicates an
expression that serves as a fixed parameter in the sense that it is independent6 Bentkamp et al.
of the variables in the optimization problem. Atoms can also come with back-
ground conditions bcondsf(ā), which are independent of the domain variables,
and variable conditions vcondsf(ā), which constrain the domain on which the
properties hold. Notably, the atoms also include proofs of properties that are
needed to justify the DCP reduction.
By storing additional information with each atom, a DCP framework can
use the compositional representation of expressions to represent a problem in a
form appropriate to a back-end solver. For example, solvers like MOSEK expect
problems to be posed in a certain conic form [29]. To that end, CVXPY stores
a graph implementation for each atomic function f, which is a representation
of f as the solution to a conic optimization problem. By definition, the graph
implementation of an atomic function f is an optimization problem in conic
form, given by a list of variables v̄, an objective function objf(x̄,v̄), and a list
of constraints constrf(x̄,v̄), such that the optimal value of the objective under
the constraints is equal to f(x̄) for all x̄ in the domain of validity. For example,
for any x ≥ 0, the concave function
√
x can be characterized as the maximum
value of the objective function obj(x,t) = t satisfying the constraint constr(x,t)
given by t2
≤ x. Once again, a notable feature of CvxLean is that that the atom
comes equipped with a formal proof of this fact.
The idea is that we can reduce a problem to the required form by iteratively
replacing each application of an atomic function by an equivalent characteri-
zation in terms of the graph implementation. For example, we can replace a
subexpression
√
x − y by a new variable t and add the constraint t2
≤ x − y,
provided that the form of the resulting problem ensures that, for any optimal
solution to the constraints, t will actually be equal to
√
x − y. Given a well-
formed DCP minimization problem, CvxLean must perform the reduction and
construct a formal proof of the associated claims. In this section we describe
the reduction, and in the next section we describe the proofs. A more formal
description of both are given in an extended version of this paper [?].
Let e be a well-formed DCP expression. CvxLean associates to each such
expression a tree T whose leaves are expressions that are affine with respect to
the variables of the optimization problem. For example, this is the tree associated
with the expression -sqrt (x - y):
neg (affine, in the role of convex)
sqrt (concave)
sub (affine, in the role of concave)
x
increasing
y
decreasing
increasing
decreasing
Alternatively, we could use a single leaf for x - y. Denoting the variables of the
optimization problem by ȳ, we can recursively assign to each node n a subexpres-Verified reductions for optimization 7
sion oexprn(ȳ) of e that corresponds to the subtree with root n. In the example
above, the subexpressions are x, y, x - y, sqrt (x - y), and -sqrt (x - y). To
each internal node, we assign a curvature, convex, concave, or affine, subject to
the rules of DCP. An expression that is affine can be viewed as either convex
or concave. Equalities and inequalities are also atoms; for example, e1 ≤ e2
describes a convex set if and only if e1 is convex and e2 is concave. A formaliza-
tion of the DCP rules allows us to recursively construct formal proofs of these
curvature claims, modulo the conditions and assumptions of the problem. We
elaborate on this process in the next section.
Now consider a well-formed DCP minimization problem with objective func-
tion o and constraints c1,...,cn. We call these expressions the components of
the problem. Recall the following example from the previous section, recast as a
minimization problem:
optimization (x y : R)
minimize -sqrt (x - y)
subject to
c1 : y = 2*x - 3
c2 : x^2 ≤ 2
c3 : 0 ≤ x - y
Here the components are -sqrt (x - y), y = 2*x - 3, x^2 ≤ 2, and 0 ≤ x - y.
First, we assign to each component c an atom tree Tc as described above. If
ȳ are the variables of the original problem, the variables of the reduced problem
are ȳ ∪z̄, where z̄ is a collection of variables consisting of a fresh set of variables
for the graph implementation at each internal node of each tree, for those atoms
whose graph implementations introduce new variables. To each node n of each
atom tree, we assign an expression rexprn(ȳ,z̄) in the language of the reduced
problem representing the expression oexprn(ȳ) in the original problem. At the
leaves, rexprn(ȳ,z̄) is the same as oexprn(ȳ). At internal nodes we use the ob-
jective function of the corresponding atom’s graph implementation, applied to
the interpretation of the arguments. The objective of the reduced problem is the
expression assigned to the root of To.
As far as the constraints of the reduced problem, recall that each internal
node of the original problem corresponds to an atom, which has a graph imple-
mentation. The graph implementation, in turn, is given by a list of variables v̄,
an objective function objf(ā,v̄), and a list of constraints constrf(ā,v̄). These con-
straints, applied to the expressions representing the arguments, are part of the
reduced problem. Moreover, the constraints of the original problem, expressed in
terms of the reduced problem, are also constraints of the reduced problem, with
one exception. Recall that atoms can impose conditions vcondsf(ā), which are
assumed to be among the constraints of the original problem and to be implied
by the graph implementation. For example, the condition 0 ≤ x is required to
characterize
√
x as the maximum value of a value t satisfying t^2 ≤ x, but, con-
versely, the existence of a t satisfying t^2 ≤ x implies 0 ≤ x. So a constraint
0 ≤ x that is present in the original problem to justify the use of sqrt x can be
dropped from the reduced problem.8 Bentkamp et al.
In the example above, there is a tree corresponding to each of the compo-
nents -sqrt (x - y), x^2 ≤ 2, 0 ≤ x - y, and y = 2*x - 3. As n ranges over
the nodes of these trees, oexprn(x,y) ranges over all the subexpressions of these
components, namely, x, y, x - y, sqrt (x - y), -sqrt (x - y), x^2, 2, x^2 ≤ 2,
and so on. The only atoms whose graph implementations introduce extra vari-
ables are the square root and the square. Thus, CvxLean introduces the variable
t.0, corresponding to the expression sqrt (x - y), and the variable t.1, corre-
sponding to the expression x^2. The values of rexprn(x,y,t0,t1) corresponding
to some of the expressions above are as follows:
oexprn(x,y) x - y sqrt (x - y) -sqrt (x - y) x^2
rexprn(x,y,t0,t1) x - y t.0 -t.0 t.1
The constraints c1 and c2 of the original problem translate to cone constraints
c1’ and c2’ on the new variables, the constraint c3 is implied by the graph
representation of x^2, and the graph representations of sqrt (x - y) and x^2
become new cone constraints c4’ and c5’. Thus the reduced problem is as follows:
optimization (x y t.0 t.1 : R)
maximize t.0
subject to
c1’ : zeroCone (2*x - 3 - y) -- 2*x - 3 - y = 0
c2’ : posOrthCone (2 - t.1) -- 2 - t.1 ≥ 0
c4’ : rotatedSoCone 0.5 (x - y) ![t.0] -- x - y ≥ t.0^2
c5’ : rotatedSoCone t.1 0.5 ![x] -- t.1 ≥ x^2
Here, ![t.0] and ![x] denote singleton vectors and the meaning of the cone
constraints is annotated in the comments. For a description of the relevant conic
forms, see the MOSEK modeling cookbook [30].
## 4 Verifying the reduction
The reduction described in the previous section is essentially the same as the
one carried out by CVXPY. The novelty of CvxLean is that it provides a formal
justification that the reduction is correct. The goal of this section is to explain
how we manage to construct a formal proof of that claim. In fact, given a problem
P with an objective function f, CvxLean constructs a new problem Q with an
objective g, together with the following additional pieces of data:
– a function ϕ from the domain of P to the domain of Q such that for any
feasible point x of P, ϕ(x) is a feasible point of Q with g(ϕ(x)) ≤ f(x)
– a function ψ from the domain of Q to the domain of P such that for any
feasible point y of Q, ψ(y) is a feasible point of P with f(ψ(y)) ≤ g(y).
These conditions guarantee that if y is a solution to Q then ψ(y) is a solution
to P, because for any feasible point x of P we have
f(ψ(y)) ≤ g(y) ≤ g(ϕ(x)) ≤ f(x).Verified reductions for optimization 9
This shows that ψ is a reduction of P to Q, and the argument with P and Q
swapped shows that ϕ is a reduction of Q to P. Moreover, whenever y is a solution
to Q, instantiating x to ψ(y) in the chain of inequalities implies f(ψ(y)) = g(y).
Similarly, when x is a solution to P, we have g(ϕ(x)) = f(x). So the conditions
above imply that P has a solution if and only if Q has a solution, and when they
do, the minimum values of the objective functions coincide. Below, we will refer
to the data (ϕ,ψ) as a strong equivalence between the two problems.
To construct and verify such a strong equivalence between the original prob-
lem and the result of applying the transformation described in Section 3, we need
to store additional information with each atom. Specifically, for each atomic func-
tion f(ā), that atom must provide solutions solf(ā) to the graph implementation
variables v̄, as well as formal proofs of the following facts:
– The function f(ā) satisfies the graph implementation: for each ā satisfying
the conditions vcondsf(ā), we have:
• solution feasibility: solf(ā) satisfies the constraints constrf(ā,solf(ā))
• solution correctness: we have objf(ā,solf(ā)) = exprf(ā) , where exprf(ā)
is the expression representing f.
– The function f(ā) is the optimal solution to the graph implementation, in
the following sense. Write ā0
4 ā to express the assumptions that a0
i ≥ ai
for increasing arguments to f, a0
i ≤ ai for decreasing arguments, and a0
i and
ai are syntactically identical for other arguments. If f is convex and ā 4 ā0
,
we require objf(ā,v̄) ≥ exprf(ā0
) for any v̄ such that constrf(ā,v̄) holds. If f
is concave and ā0
4 ā, we require objf(ā,v̄) ≤ exprf(ā0
) for any v̄ such that
constrf(ā,v̄) holds. For affine atoms, we require both.
Finally, as noted in the previous section, the graph implementation implies the
conditions needed for the reduction. Under the assumptions on ā and ā0
in the
second case above, we also require a proof of vcondsf(ā0
). We refer to this as
condition elimination.
For a concrete example, consider the atom for the concave function
√
a. In
that case, vconds(a) is the requirement a ≥ 0, and expr(a), the Lean representa-
tion of the function, is given by Lean’s sqrt function. The graph implementation
adds a new variable v. The only constraint constr(a,v) is v2
≤ a, and the ob-
jective function is obj(a,v) = v. The solution function sol(a) returns
√
a when
a is nonnegative and an arbitrary value otherwise. The atom for
√
· stores Lean
proofs of all of the following:
– solution feasibility: ∀ a, 0 ≤ a → (sqrt a)^2 ≤ a
– solution correctness: ∀ a, 0 ≤ a → sqrt a = sqrt a
– optimality: ∀ v a a’, a ≤ a’ → v^2 ≤ a → v ≤ sqrt a’
– condition elimination: ∀ v a a’, a ≤ a’ → v^2 ≤ a → 0 ≤ a’.
More precisely, the atom stores the representation of the graph of the square
root function as a cone constraint, and the properties above are expressed in
those terms. These properties entail that sqrt is concave, but we do not need to
prove concavity explicitly.10 Bentkamp et al.
Let the variables ȳ range over the domain of the original problem, P, and
let the variables ȳ,z̄ be the augmented list of variables in the reduced problem,
Q. We wish to construct a strong equivalence between P and Q. To that end,
we need to define a forward map ϕ and a reverse map ψ. The definition of ψ is
easy: we simply project each tuple ȳ,z̄ to ȳ. The definition of the forward map,
ϕ, is more involved, since we have to map each tuple ȳ of values to an expanded
tuple ȳ,z̄. The values of ȳ remain unchanged, so the challenge is to define, for
each new variable z, an expression interpz(ȳ) to interpret it.
Recall that for each subexpression oexprn(ȳ) in the original problem, corre-
sponding to a node n, there is an expression rexprn(ȳ,w̄) involving new vari-
ables from the reduced problem. Suppose a node n corresponds to an expres-
sion f(u1,...,un) in the original problem, and the graph implementation of f
introduces new variables v̄. For each vj, we need to devise an interpretation
interpvj
(ȳ). To start with, solf provides a solution to vj in terms of the argu-
ments u1,...,un. For each of these arguments, rexpr provides a representation in
terms of the variables ȳ and other new variables. Composing these, we get an ex-
pression e(ȳ,w1,...,w`) for vj in terms of the variables ȳ of the original problem
and new variables w1,...,w`. Recursively, we find interpretations interpwk
(ȳ) of
each wk, and define interpvj
(ȳ) to be e(ȳ,interpw1
(ȳ),...,interpw`
(ȳ)). In other
words, we read off the interpretation of each new variable of the reduced problem
from the intended solution to the graph equation, which may, in turn, require
the interpretation of other new variables that were previously introduced.
In the end, the forward map ϕ is the function that maps the variables ȳ in the
original problem to the tuple (ȳ,interpz1
(ȳ),...,interpzm
(ȳ)), where z1,...,zm
are the new variables. To show that (ϕ,ψ) is a strong equivalence, we must show
that for any feasible point ȳ of the original problem, ϕ(ȳ) is a feasible point of the
reduced problem. This follows from the solution correctness requirement above.
We also need to show that if f(ȳ) is the objective function of the original problem
and g(ȳ,z̄) is the objective function of the reduced problem, g(ϕ(ȳ)) ≤ f(ȳ).
In fact, the solution correctness requirement enables us to prove the stronger
property g(ϕ(ȳ)) = f(ȳ). Finally, we need to show that for any feasible point ȳ,z̄
of the reduced problem, the tuple ȳ is a feasible point of the original problem and
f(ȳ) ≤ g(ȳ,z̄). To do that, we recursively use the optimality requirement to show
rexprn(ȳ,z̄) ≥ oexprn(ȳ) whenever the node n marks a convex expression or an
affine expression in the role of a convex expression, and rexprn(ȳ,z̄) ≤ oexprn(ȳ)
whenever the node n marks a concave expression or an affine expression in the
role of a concave expression.
A proof that the maps ϕ and ψ constructed above form a strong equivalence
can be found in the extended version of this paper [?], but it is helpful to
work through the example from Section 3 to get a sense of what the proof
means. For this example, the forward map is ϕ(x,y) = (x,y,
√
x − y,x2
) and
the reverse map is ψ(x,y,t0,t1) = (x,y). Assuming that (x,y) is a solution
to the original problem, the fact that ϕ(x,y) satisfies c1’ follows from c1, the
fact that it satisfies c2’ follows from c2, the fact that it satisfies c4’ and c5’
follows from the fact that
√
x − y and x2
are correct solutions to the graphVerified reductions for optimization 11
constraints. In this direction, g(ϕ(x,y)) = −
√
x − y = f(x,y). In the other
direction, assuming that (x,y,t0,t1) is a solution to the reduced problem, the
fact that (x,y) satisfies c1 follows from c1’, that fact that it satisfies c2 follows
from c2’ and c5’, and the fact that is satisfies c3 follows from c4’. Here we
have f(ψ(x,y,t0,t1)) = −
√
x − y and g(x,y,t0,t1) = −t0, and the fact that the
former is less than or equal to the latter follows from c4’.
## 5 Adding atoms
One important advantage to using an interactive theorem prover as a basis for
solving optimization problems is that it is possible to extend the atom library in
a verified way. In a system like CVXPY, one declares a new atom with its graph
implementation on the basis of one’s background knowledge or a pen-and-paper
proof that the graph implementation is correct and that the function described
has the relevant properties over the specified domain. In CvxLean, we have
implemented syntax with which any user can declare a new atom in Lean and
provide formal proofs of these facts. The declaration can be made in any Lean
file, and it becomes available in any file that imports that one as a dependency.
Lean has a build system and package manager that handles dependencies on
external repositories, allowing a community of users to share such mathematical
and computational content.
For example, the declaration of the atom for the logarithm looks as follows:
declare_atom log [concave] (x : R)+ : log x :=
conditions (cond : 0 < x)
implementationVars (t : R)
implementationObjective t
implementationConstraints (c_exp : expCone t 1 x)
solution (t := log x)
solutionEqualsAtom by ...
feasibility (c_exp : by ...)
optimality by ...
conditionElimination (cond : by ...)
The ellipses indicate places that are filled by formal proofs. Proof assistants
like Lean allow users to write such proofs interactively in an environment that
displays proof obligations, the local context, and error messages, all while the
user types. For example, placing the cursor at the beginning of the optimality
block displays the following goal:
x t : R
c_exp : expCone t 1 x
` ∀ (y : R), x ≤ y → t ≤ log y
In other words, given real values x and t and the relevant constraint in terms of
the exponential cone, we need to prove that for every y ≥ x, we have t ≤ log(y).
For the example we present in the next section, we had to implement the
log-determinant atom [9, Example 9.5], whose arguments consist of a natural12 Bentkamp et al.
number n and a matrix A ∈ Rn×n
. This function is represented in Lean by the
atom expression exprlog-det = log (det A), where the parameter n is implicit in
the type of A. The curvature is specified to be concave, the monotonicity in n
is auxiliary because we do not support the occurrence of optimization variables
in this argument, and the monotonicity in A is neither because the value of
log(detA) is neither guaranteed to increase nor guaranteed to decrease as A
increases. (The relevant order here on matrices is elementwise comparison.) The
correctness of the reduction requires the assumption that A is positive definite.
Following CVXPY, we used the following graph implementation:
maximize
X
i
ti
over t ∈ Rn
, Y ∈ Rn×n
subject to (t,1,y) ∈ expcone

D Z
ZT
A

positive semidefinite
Here y is the diagonal of Y ; Z is obtained from Y by setting all entries below
the diagonal to 0; and D is obtained from Y by setting all entries off the diag-
onal to 0. Here, saying that the tuple (t,1,y) is in the exponential cone means
that eyi
≥ ti for each i. Our implementation in CvxLean required proving that
this graph implementation is correct. To do so, we formalized an argument in
the MOSEK documentation.6
This, in turn, required proving properties of the
Schur complement, triangular matrices, Gram-Schmidt orthogonalization, and
LDL factorization. Moreover, the argument uses the subadditivity of the de-
terminant function, for which we followed an argument by Andreas Thom on
MathOverflow.7
## 6 User-defined reductions
An even more important advantage of using an interactive proof assistant as a
framework for convex optimization is that, with enough work, users can carry out
any reduction that can be expressed and justified in precise mathematical terms.
As a simple example, DCP cannot handle an expression of the form exp(x)exp(y)
in a problem, requiring us instead to write it as exp(x + y). But in CvxLean,
we have the freedom to express the problem in the first form if we prefer to and
then verify that the trivial reduction is justified:
reduction red/prob :
optimization (x y : R)
maximize x + y
subject to
6
https://docs.mosek.com/modeling-cookbook/sdo.html#log-determinant
7
https://mathoverflow.net/questions/65424/determinant-of-sum-of-positive-definit
e-matrices/65430#65430Verified reductions for optimization 13
h : (exp x) * (exp y) ≤ 10 := by
conv_constr => rw [←Real.exp_add]
Here the expression rw [←Real.exp_add] supplies the short formal proof that
exp(x + y) can be replaced by exp(x) · exp(y).
Of course, this functionality becomes more important as the reductions be-
come more involved. As a more substantial example, we have implemented a
reduction needed to solve the the covariance estimation problem for Gaussian
variables [9, pp. 355]. In this problem, we are given N samples y1,...yN ∈ Rn
drawn from a Gaussian distribution with zero mean and unknown covariance
matrix R. We assume that the Gaussian distribution is nondegenerate, so R is
positive definite and the distribution has density function
pR(y) = (2π)−n/2
det(R)−1/2
exp(−yT
R−1
y/2).
We want to estimate the covariance matrix R using maximum likelihood estima-
tion, i.e., we want to find the covariance matrix that maximizes the likelihood
of observing y1,...yN. The maximum likelihood estimate for R is the solution
to the following problem:
maximize
N Y
k=1
pR(yk) over R subject to R positive definite.
As stated, this problem has a simple analytic solution, namely, the sample co-
variance of y1,...,yn, but the problem becomes more interesting when one adds
additional constraints, for example, upper and lower matrix bounds on R, or
constraints on the condition number of R (see [9]). We can easily reduce the
problem to maximizing the logarithm of the objective function above, but that
is not a concave function of R. It is, however, a concave function of S = R−1
, and
common constraints on R translate to convex constraints on S. We can therefore
reduce the problem above to the following:
maximize log(det(S)) −
N X
k=1
yT
k Syk over S subject to S positive definite,
possibly with additional constraints on S. We express the sum using the sample
covariance Y = 1
N
PN
k=1 ykyT
k and the trace operator:
maximize log(det(S)) − N · tr(Y ST
) over S
subject to S positive definite
The problem can then be solved using disciplined convex programming. The
constraint that S is positive definite is eliminated while applying the graph
implementation of log(det(S)).
We have formalized these facts in Lean and used them to justify the reduc-
tion. An example with an additional sparsity constraints on R can be found in
CvxLean/Examples in our repository.14 Bentkamp et al.
## 7 Connecting Lean to a conic optimization solver
Once a problem has been reduced to conic form, it can be sent to an external
back-end solver. At this point, we must pass from the realm of precise symbolic
representations and formal mathematical objects to the realm of numeric compu-
tation with floating point representations. We traverse our symbolic expressions,
replacing functions on the reals from Lean’s mathematical library with corre-
sponding numeric functions on floats, for example associating the floating point
exponential function Float.exp to the real exponential function Real.exp. Our
implementation makes it easy to declare such associations with the following
syntax: addRealToFloat : Real.exp := Float.exp.
This is one area where more verification is possible. We could use verified
libraries for floating point arithmetic [2,8,18,43], we could use dual certificates
to verify the results of the external solver, and we could carry out formal sensi-
tivity analysis to manage and bound errors. Our current implementation is only
designed to verify correctness up to the point where the problem is sent to the
back-end solver, and to facilitate the last step, albeit in an unverified way.
We have implemented a solve command in CvxLean which takes a an opti-
mization problem prob in DCP form and carries out the following steps:
1. It applies the dcp procedure to obtain a reduced problem, prob.reduced, and
a reduction red : Solution prob.reduced -> Solution prob.
2. It carries out the translation to floats, traversing each expression and apply-
ing the registered translations.
3. It extracts the numerical data from the problem. At this point, we have
scalars, arrays and matrices associated to every type of constraint.
4. It writes the problem to an external file in the conic benchmark format.8
5. It calls MOSEK and receives a status code in return, together with a solution,
if MOSEK succeeds in finding one. The problem status is added to the
environment and if it is infeasible or ill-posed, we stop.
6. Otherwise, the solve command interprets the solution so that it matches the
shape of the variables of prob.reduced. It also expresses these values as Lean
reals, resulting in an approximate solution p to prob.reduced. It declares a
corresponding Solution to prob.reduced, using a placeholder for the proofs
of feasibility and optimality (since we simply trust the solver here).
7. It then uses the reduction from prob to prod.reduced, again reinterpreted in
terms of floats, to compute an approximate solution to prob.
Finally, the results are added to the Lean environment. In the following example,
the command solve so1 results in the creation of new Lean objects so1.reduced,
so1.status, so1.value, and so1.solution. The first of these represents the conic-
form problem that is sent to the back-end solver, while the remaining three
comprise the resulting solution.
noncomputable def so1 :=
8
https://docs.mosek.com/latest/rmosek/cbf-format.htmlVerified reductions for optimization 15
optimization (x y : R)
maximize sqrt (x - y)
subject to
c1 : y = 2*x - 3
c2 : x^2 ≤ 2
c3 : 0 ≤ x - y
solve so1
#print so1.reduced -- shows the reduced problem
#eval so1.status -- "PRIMAL_AND_DUAL_FEASIBLE"
#eval so1.value -- 2.101003
#eval so1.solution -- (-1.414214, -5.828427)
## 8 Related work
Our work builds on decades of research on convex optimization [9,35,38,42], and
most directly on the CVX family and disciplined convex programming [14,16,
19,20,41]. Other popular packages include Yalmip [25].
Formal methods have been used to solve bounding problems [17,37], con-
straint satisfaction problems [15], and optimization problems [24]. This litera-
ture is too broad to survey here, but [13] surveys some of the methods that
are used in connection with the verification of cyber-physical systems. Proof
assistants in particular have been used to verify bounds in various ways. Some
approaches use certificates from numerical packages; Harrison [23] uses certifi-
cates from semidefinite programming in HOL Light, and Magron et al. [26] and
Martin-Dorel and Roux [27] use similar certificates in Coq. Solovyev and Hales
use a combination of symbolic and numeric methods in HOL Light [39]. Other
approaches have focused on verifying symbolic and numeric algorithms instead.
For example, Muñoz, Narkawicz, and Dutle [33] verify a decision procedure for
univariate real arithmetic in PVS and Cordwell, Tan, and Platzer [12] verify an-
other one in Isabelle. Narkawicz and Muñoz [34] have devised a verified numeric
algorithm to find bounds and global optima. Cohen et al. [10,11] have devel-
oped a framework for verifying optimization algorithms using the ANSI/ISO C
Specification Language (ACSL) [5].
Although the notion of a convex set has been formalized in a number of
theorem provers, we do not know of any full development of convex analysis.
The Isabelle [36] HOL-Analysis library includes properties of convex sets and
functions, including Carathéodory’s theorem on convex hulls, Radon’s theorem,
and Helly’s theorem, as well as properties of convex sets and functions on normed
spaces and Euclidean spaces. A theory of lower semicontinuous functions by
Grechuk [21] in the Archive of Formal Proofs [7] includes properties of convex
functions. Lean’s mathlib [28] includes a number of fundamental results, including
a formalization of the Riesz extension theorem by Kudryashov and Dupuis and a
formalization of Jensen’s inequality by Kudryashov. Allamigeon and Katz have
formalized a theory of convex polyhedra in Coq with an eye towards applications16 Bentkamp et al.
to linear optimization [3]. We do not know of any project that has formalized
the notion of a reduction between optimization problems.
## 9 Conclusions
We have argued that formal methods can bring additional reliability and interac-
tive computational support to the practice of convex optimization. The success
of our prototype shows that it is possible to carry out and verify reductions using
a synergistic combination of automation and user interaction.
The implementation of CvxLean is currently spread between two versions of
Lean [31,32]. Lean 3 has a formal library, mathlib [28], which comprises close to
a million lines of code and covers substantial portions of algebra, linear algebra,
topology, measure theory, and analysis. Lean 4 is a performant programming
language as well as a proof assistant, but its language is not backward compatible
with that of Lean 3. All of the substantial programming tasks described here
have been carried out in Lean 4, but we rely on a binary translation of the Lean 3
library and some additional results proved there. This arrangement is not ideal,
but a source-level port of the Lean 3 library is already underway, and we expect
to move the development entirely to Lean 4 in the near future.
There is still a lot to do. We have implemented and verified all the atoms
needed for the examples presented in this paper, but these are still only a frac-
tion of the atoms that are found in CVXPY. The DCP transformation currently
leaves any side conditions that it cannot prove for the user to fill in, and special-
purpose tactics, i.e. small-scale automation, could help dispel proof obligations
like monotonicity. Textbooks often provide standard methods and tricks for car-
rying out reductions (e.g. [9, Section 4.1.3]), and these should also be supported
by tactics in CvxLean. Our project, as well as Lean’s library, would benefit
from more formal definitions and theorems in convex analysis and optimization.
We need to implement more efficient means of extracting numeric values for the
back-end solver, and it would be nice to verify more of the numeric computations
and claims. Finally, and most importantly, we need to work out more examples
like the ones presented here to ensure that the system is robust and flexible
enough to join the ranks of conventional optimization systems like CVXPY.
Acknowledgements Seulkee Baek did some preliminary experiments on connect-
ing Lean 3 to external optimization solvers. Mario Carneiro and Gabriel Ebner
advised us on how to formalize optimization problems and on Lean 4 metapro-
gramming. Steven Diamond helped us understand the world of convex opti-
mization. We also had helpful discussions with Geir Dullerud, Paul Jackson,
Florian Jarre, John Miller, Balasubramanian Narasimhan, Ivan Papusha, and
Ufuk Topcu. Steven Diamond, Paul Jackson, and Parth Nobel provided helpful
feedback on a draft of this paper. This work has been partially supported by
the Hoskinson Center for Formal Mathematics at Carnegie Mellon University.
Bentkamp has received funding from a Chinese Academy of Sciences President’s
International Fellowship for Postdoctoral Researchers (grant No. 2021PT0015).
We thank the anonymous reviewers for their corrections and suggestions.Verified reductions for optimization 17
References
1. Agrawal, A., Verschueren, R., Diamond, S., Boyd, S.: A rewriting system for convex
optimization problems. J. Control and Decision 5(1), 42–60 (2018)
2. Akbarpour, B., Abdel-Hamid, A.T., Tahar, S., Harrison, J.: Verifying a synthe-
sized implementation of IEEE-754 floating-point exponential function using HOL.
Comput. J. 53(4), 465–488 (2010). https://doi.org/10.1093/comjnl/bxp023
3. Allamigeon, X., Katz, R.D.: A formalization of convex polyhedra based on the
simplex method. J. Autom. Reason. 63(2), 323–345 (2019)
4. Bachoc, C., Vallentin, F.: New upper bounds for kissing numbers from semidefinite
programming. J. Amer. Math. Soc. 21(3), 909–924 (2008). https://doi.org/10.109
0/S0894-0347-07-00589-9
5. Baudin, P., Cuoq, P., Filliâtre, J.C., Marché, C., Monate, B., Moy, Y., Prevosto,
V.: Acsl: Ansi/iso c specification language (2020), https://frama-c.com/html/acs
l.html, version 1.17
6. Bentkamp, A., Avigad, J.: Verified optimization (work in progress) (2022), formal
Mathematics for Mathematicians (FMM) workshop, 2021
7. Blanchette, J.C., Haslbeck, M.W., Matichuk, D., Nipkow, T.: Mining the archive of
formal proofs. In: Kerber, M., Carette, J., Kaliszyk, C., Rabe, F., Sorge, V. (eds.)
Intelligent Computer Mathematics (CICM) 2015. pp. 3–17. Springer (2015)
8. Boldo, S., Filliâtre, J.: Formal verification of floating-point programs. In: 18th
IEEE Symposium on Computer Arithmetic (ARITH-18) 2007, 25-27 June 2007,
Montpellier, France. pp. 187–194. IEEE Computer Society (2007). https://doi.or
g/10.1109/ARITH.2007.20
9. Boyd, S.P., Vandenberghe, L.: Convex Optimization. Cambridge University Press
(2014), https://web.stanford.edu/~boyd/cvxbook/
10. Cohen, R., Davy, G., Feron, E., Garoche, P.L.: Formal verification for embed-
ded implementation of convex optimization algorithms. IFAC-PapersOnLine 50(1),
5867–5874 (2017), 20th IFAC World Congress
11. Cohen, R., Feron, E., Garoche, P.: Verification and validation of convex optimiza-
tion algorithms for model predictive control. Journal of Aerospace Information
Systems 17(5), 257–270 (3 2020)
12. Cordwell, K., Tan, Y.K., Platzer, A.: A verified decision procedure for univariate
real arithmetic with the BKR algorithm. In: Cohen, L., Kaliszyk, C. (eds.) In-
teractive Theorem Proving (ITP) 2021. LIPIcs, vol. 193, pp. 14:1–14:20. Schloss
Dagstuhl - Leibniz-Zentrum für Informatik (2021)
13. Deshmukh, J.V., Sankaranarayanan, S.: Formal techniques for verification and test-
ing of cyber-physical systems. In: Al Faruque, M.A., Canedo, A. (eds.) Design
Automation of Cyber-Physical Systems. pp. 69–105. Springer, Cham (2019)
14. Diamond, S., Boyd, S.: CVXPY: A Python-embedded modeling language for con-
vex optimization. J. Machine Learning Research 17(83), 1–5 (2016)
15. Fränzle, M., Herde, C., Teige, T., Ratschan, S., Schubert, T.: Efficient solving of
large non-linear arithmetic constraint systems with complex Boolean structure. J.
Satisf. Boolean Model. Comput. 1(3-4), 209–236 (2007). https://doi.org/10.3233/
sat190012
16. Fu, A., Narasimhan, B., Boyd, S.: CVXR: An R package for disciplined convex
optimization. Journal of Statistical Software 94(14), 1–34 (2020)
17. Gao, S., Avigad, J., Clarke, E.M.: δ-complete decision procedures for satisfiability
over the reals. In: Gramlich, B., Miller, D., Sattler, U. (eds.) Automated Reasoning
(IJCAR) 2012. pp. 286–300. Springer (2012)18 Bentkamp et al.
18. Goodloe, A., Muñoz, C.A., Kirchner, F., Correnson, L.: Verification of numerical
programs: From real numbers to floating point numbers. In: Brat, G., Rungta,
N., Venet, A. (eds.) NASA Formal Methods (NFM) 2013. pp. 441–446. Springer
(2013). https://doi.org/10.1007/978-3-642-38088-4_31
19. Grant, M., Boyd, S.: CVX: Matlab software for disciplined convex programming,
version 2.1. http://cvxr.com/cvx (Mar 2014)
20. Grant, M., Boyd, S., Ye, Y.: Disciplined convex programming. In: Global optimiza-
tion, pp. 155–210. Springer (2006)
21. Grechuk, B.: Lower semicontinuous functions. Archive of Formal Proofs (Jan 2011),
https://isa-afp.org/entries/Lower_Semicontinuous.html, Formal proof develop-
ment
22. Gurobi Optimization, LLC: Gurobi Optimizer Reference Manual (2022), https:
//www.gurobi.com
23. Harrison, J.: Verifying nonlinear real formulas via sums of squares. In: Schneider,
K., Brandt, J. (eds.) Theorem Proving in Higher Order Logics (TPHOLs) 2007.
pp. 102–118. Springer (2007)
24. Kong, S., Solar-Lezama, A., Gao, S.: Delta-decision procedures for exists-forall
problems over the reals. In: Chockler, H., Weissenbacher, G. (eds.) Computer Aided
Verification (CAV) 2018, Part II. pp. 219–235. Springer (2018)
25. Löfberg, J.: Yalmip : A toolbox for modeling and optimization in matlab. In:
Computer Aided Control System Design (CACSD) 2004. pp. 284–289 (2004)
26. Magron, V., Allamigeon, X., Gaubert, S., Werner, B.: Formal proofs for nonlinear
optimization. J. Formaliz. Reason. 8(1), 1–24 (2015). https://doi.org/10.6092/is
sn.1972-5787/4319
27. Martin-Dorel, É., Roux, P.: A reflexive tactic for polynomial positivity using
numerical solvers and floating-point computations. In: Bertot, Y., Vafeiadis, V.
(eds.) Certified Programs and Proofs (CPP) 2017. pp. 90–99. ACM (2017). https:
//doi.org/10.1145/3018610.3018622
28. Mathlib Community: The Lean mathematical library. In: Blanchette, J., Hritcu,
C. (eds.) Certified Programs and Proofs (CPP) 2020. pp. 367–381. ACM (2020)
29. MOSEK ApS: Introducing the MOSEK Optimization Suite (2022), https://docs
.mosek.com/latest/intro
30. MOSEK ApS: MOSEK Modeling Cookbook (2022), https://docs.mosek.com/mod
eling-cookbook
31. de Moura, L., Ullrich, S.: The lean 4 theorem prover and programming language.
In: Platzer, A., Sutcliffe, G. (eds.) Automated Deduction (CADE) 2021. pp. 625–
635. Springer (2021). https://doi.org/10.1007/978-3-030-79876-5_37
32. de Moura, L.M., Kong, S., Avigad, J., van Doorn, F., von Raumer, J.: The Lean
theorem prover (system description). In: Felty, A.P., Middeldorp, A. (eds.) Con-
ference on Automated Deduction (CADE) 2015. pp. 378–388. Springer (2015)
33. Muñoz, C.A., Narkawicz, A.J., Dutle, A.: A decision procedure for univariate poly-
nomial systems based on root counting and interval subdivision. J. Formaliz. Rea-
son. 11(1), 19–41 (2018). https://doi.org/10.6092/issn.1972-5787/8212
34. Narkawicz, A., Muñoz, C.A.: A formally verified generic branching algorithm for
global optimization. In: Cohen, E., Rybalchenko, A. (eds.) Verified Software: The-
ories, Tools, Experiments (VSTTE) 2013. pp. 326–343. Springer (2013)
35. Nesterov, Y.: Lectures on convex optimization. Springer, Cham (2018). https:
//doi.org/10.1007/978-3-319-91578-4, second edition
36. Nipkow, T., Paulson, L.C., Wenzel, M.: Isabelle/HOL - A Proof Assistant for
Higher-Order Logic. Springer (2002)Verified reductions for optimization 19
37. Ratschan, S., She, Z.: Safety verification of hybrid systems by constraint
propagation-based abstraction refinement. ACM Trans. Embed. Comput. Syst.
6(1), 8 (2007). https://doi.org/10.1145/1210268.1210276
38. Rockafellar, R.T.: Convex analysis. Princeton University Press, Princeton, N.J.
(1970)
39. Solovyev, A., Hales, T.C.: Formal verification of nonlinear inequalities with Taylor
interval approximations. In: Brat, G., Rungta, N., Venet, A. (eds.) NASA Formal
Methods (NFM) 2013. pp. 383–397. Springer (2013)
40. Sturm, J.F.: Using sedumi 1.02, a matlab toolbox for optimization over symmetric
cones. Optimization methods and software 11(1-4), 625–653 (1999)
41. Udell, M., Mohan, K., Zeng, D., Hong, J., Diamond, S., Boyd, S.: Convex opti-
mization in Julia. SC14 Workshop on High Performance Technical Computing in
Dynamic Languages (2014)
42. Vishnoi, N.: Algorithms for Convex Optimization. Cambridge University Press
(2021)
43. Yu, L.: A formal model of IEEE floating point arithmetic. Arch. Formal Proofs
2013 (2013), https://www.isa-afp.org/entries/IEEE_Floating_Point.shtml