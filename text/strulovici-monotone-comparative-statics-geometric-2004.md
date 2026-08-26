---
sha256: 23a4575b6c116f6774bdae5d66b0c6e68f5f6cc3265bb0a89cb4ed2a6144ae9b
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 83335
---
Monotone Comparative Statics:
A Geometric Approach∗
Bruno H. Strulovici†
Thomas A. Weber‡
October, 2004
JEL-Classification: C61.
Keywords: Change of Parameters, Parameterized Optimization Problems, Single Cross-
ing, Supermodularity.
∗
We would like to thank Kenneth Arrow, Darrell Duffie, Paul Milgrom, and Pete Veinott for helpful
comments. All remaining errors are our own.
†
Department of Management Science and Engineering, 397 Terman Engineering Center, Stanford
University, Stanford, CA 94305-4026. E-mail: bstrulovici@stanford.edu.
‡
Department of Management Science and Engineering, 442 Terman Engineering Center, Stanford
University, Stanford, CA 94305-4026. E-mail: webert@stanford.edu. Research in part supported by a
David Morgenthaler II Faculty Scholar Award.
1Monotone Comparative Statics:
A Geometric Approach
Abstract
We consider comparative statics of solutions to parameterized optimization prob-
lems. A geometric method is developed for finding a vector field that, at each point
in the parameter space, indicates a direction in which monotone comparative statics
obtain. Given such a vector field, we provide sufficient conditions under which the
problem can be reparameterized on the parameter space (or a subset thereof) in a
way that guarantees monotone comparative statics. A key feature of our method is
that it does not require the feasible set to be a lattice and works in the absence of
the standard quasi-supermodularity and single-crossing assumptions on the objec-
tive function. We illustrate our approach with a variety of applications.
JEL-Classification: C61.
Keywords: Change of Parameters, Parameterized Optimization Problems, Single Cross-
ing, Supermodularity
21 Introduction
In many problems of economics, important insights can be derived from a formal model
by comparing its predictions for different parameter values. The model’s parameters are
exogenously specified and can often be varied for analysis purposes while its variables,
which constitute the building blocks for its predictions, are endogenously determined by
(i) imposed model relations and (ii) parameter values. For instance, an economic model
might be concerned with a firm’s optimal production of widgets (e.g., in terms of capital
and labor requirements), given both a production function relating output to inputs and
a set of prices (e.g., the market price for widgets, the cost of capital, and an average
wage rate). The model would then in the neoclassical tradition impose maximization
of the firm’s profit to determine optimal amounts of factor inputs as a function of their
respective prices. More generally, if a model’s predictions can be expressed as an optimal
action in some finite-dimensional space, then comparative statics studies the direction in
which the optimal action changes consequent upon some disturbance in the values of the
model’s parameters (Samuelson, 1941).1
Thus, in our example, normalizing the price of
the firm’s output to one, the optimal choice of inputs critically depends on the prices of
the production factors which are this model’s parameters.
The key question of monotone comparative statics is to determine under what condi-
tions the model predictions vary monotonically with the parameters (Topkis 1968,1998).
A general answer to this question for optimal actions chosen from feasible sets, which are
usually assumed to be lattices satisfying a set-monotonicity requirement with respect to
the parameters, is provided by Milgrom and Shannon (1994). They provide a necessary
and sufficient condition for optimal actions to exhibit monotone comparative statics with
respect to the parameters. For the special case of our neoclassical production decision
problem, where the production function is independent of the factor prices, monotone
comparative statics (i.e., inputs nonincreasing in prices) obtain if and only if the pro-
duction function is supermodular, which – assuming twice continuous differentiability –
amounts to requiring that all cross-partial derivatives of the production function are non-
negative.
The practical importance of monotone comparative statics, justifying its widespread
use in economics, lies in the fact that robust insights can be obtained in the absence of
1
If an optimal action is infinite-dimensional (e.g., the solution function of a variational problem), then
comparing the model’s predictions for different parameter values is often referred to as “comparative
dynamics.” We limit our attention here to the finite-dimensional case corresponding to “comparative
statics.”
3an analytical solution to the model: the monotonicity of optimal actions in parameters is
guaranteed if the system’s objective function satisfies certain easy-to-check requirements.
In addition, monotonicity of optimal actions can yield useful rules of thumb for deci-
sion makers and thus help in arriving at “optimally imperfect decisions” (Baumol and
Quandt, 1964). Clearly, in our production example (which is examined more closely in
Section 5.2) it would be helpful for the firm to be able to immediately (i.e., without any
further computations) translate price movements into appropriate input changes which
at the very least vary in the right direction, even when its production function is not
supermodular due to anticomplementarities between factor inputs. Unfortunately, the
currently available theory on monotone comparative statics returns negative results in
situations where the aforementioned characterization of monotone comparative statics by
Milgrom and Shannon fails. We argue that this failure is often due to the fact that the
parameterization of the problem is taken as given.2
Indeed, our results indicate that it
may be possible to achieve monotonicity of solutions in new parameters that are obtained
by a one-to-one mapping from the original parameter space. In fact, for problems with a
smooth analytical structure we show that, provided sufficiently precise knowledge about
the location of an optimal action in the action space, it is always possible to find a repa-
rameterization that achieves monotone comparative statics in any single component of the
decision.
Our central goal is to provide a new method for achieving monotone comparative
statics of solutions to parameterized optimization problems, first by relaxing and thereby
generalizing the standard monotone comparative statics problem, and second, by pro-
viding a systematic way to reparameterize the problem in such a way that monotone
comparative statics can be achieved.3
In addition to addressing cases where the standard
results do not apply, our method can, by offering a new description of the parameter
space, shed light on important relations between decision variables and parameters of
economic problems.
The approach developed here builds on tools in differential geometry and we thus
require models with a smooth structure (e.g., a parameterized optimization problem with a
twice continuously differentiable objective function), even though – as we are well aware –
2
This is true in the literature, except for some rare cases where trivial reparameterizations such as a
change of sign or other simple ad hoc reparameterizations are chosen under very special circumstances,
e.g., by Granot and Veinott (1986) in a network flow problem.
3
Even though not explicitly developed, our methods apply equally to equilibrium problems, by re-
placing the first-order necessary optimality conditions of the optimization problem with the equations
specifying equilibria.
4none of our statements fundamentally depends on the differentiable structure. All of our
results can be expected to also hold, if the problem is suitably discretized; nevertheless
we prefer to adopt a differentiable approach for ease of exposition, since then the tools of
differentiable geometry can be applied seamlessly. We decompose the problem of changing
problem parameters to achieve monotone comparative statics (MCS) into two parts. First,
the decision maker needs to solve a local MCS problem by finding for each point t in the
parameter space T a direction vector v(t) (i.e., an element of the tangent space at t)
that would increase the unknown optimal action x(t) if parameters were to be locally
changed from t in the direction of v(t). If the location of x(t) is not known precisely, as is
generally the case, then the direction v(t) must be such that it induces local monotonicity
with respect to all points in a subset R(t) of the action space X which is known to contain
the optimal action x(t), given the possibility that any point in R(t) might turn out to be
optimal. A full solution to the first problem consists in a vector field v(t) defined for all
values of t in the parameter space. Second, given the vector field v(t) the decision maker
needs to find a reparameterization solving the global MCS problem. We show that this
can always be achieved locally through “rectification” of the vector field. Under a few
additional conditions rectification can also be achieved globally, leading to the desired
global MCS reparameterization of the decision problem.
The paper proceeds as follows. In Section 2 we introduce the problem of obtaining
monotone comparative statics (i.e., monotone dependence of solutions on parameters) for
parameterized optimization problems, both from a local and a global viewpoint. When
considered locally, obtaining monotone comparative statics corresponds to finding direc-
tions in the parameter space in which solutions to the optimization problem are nonde-
creasing in parameters. A solution to the local monotone comparative statics problem is
provided in Section 3 using a vector field method. Subsequently, in Section 4, we take a
more global perspective: having obtained a vector field of monotone comparative statics
directions defined at each point of the parameter space, we demonstrate that it is possible
to (at least locally) change the parameters of the optimization problem, i.e., to reparam-
eterize it, such that monotone comparative statics of the solutions of the reparameterized
problem obtain. We show that the reparameterization can be global if a hyperplane can
be found that is transverse to a vector field that solves the local MCS problem at each
point of the parameter space. To illustrate our results we then discuss a number of appli-
cations in Section 5 before concluding with a discussion and directions for further research
in Section 6.
52 Problem Formulation
We consider a decision maker who, given a parameter value t ∈ T , aims to select an
element x(t) of an action space X so as to maximize her objective function f : X ×T → R.
She thus tries to solve the parameterized optimization problem
x(t) ∈ argmax
x∈X
f(x,t), (1)
where X is an open subset4
of Rn
and T is an open subset of Rm
. Provided that a solution
to (1) always exists,5
the decision maker is interested in the comparative statics of the
maximizer x(t) as t ∈ T varies. More generally, we assume that the decision maker is
concerned with the behavior of the composition ϕ ◦ x(t) = ϕ(x(t)), where ϕ : X → Rd
(with 1 ≤ d ≤ n) is an evaluation function that the decision maker uses to assess any
solution x(t) that satisfies (1). For instance, if the decision maker is only interested in the
comparative statics of the first component of the maximizer x(t) = (x1,...,xn)(t), she
can choose ϕ(x) = x1. From Milgrom and Shannon’s (1994) Monotonicity Theorem we
know that if ϕ(x) = x and X is a lattice, then ϕ◦x(t) = x(t) is increasing in t if and only
if f is quasi-supermodular6
in x and satisfies the single-crossing property7
in (x,t). Con-
versely, for any objective function f that does not satisfy these conditions together with
a monotone evaluation function ϕ, the expression ϕ◦x(t) cannot be nondecreasing on T .
Nevertheless, despite this negative result using the standard theory, it may be possible
for the decision maker to at least find a path γt in the parameter space, so that starting
at a given t ∈ T the function ϕ ◦ x is nondecreasing along γt. Monotone comparative
statics (MCS) may thus be obtained following certain directions in the parameter space.
It is useful given any t ∈ T to state the decision maker’s MCS problem (at t) in precisely
these terms.
4
If X lies in a lower-dimensional submanifold of Rn
, the analysis can still be applied, but differential
calculus should be understood on this submanifold, and openness should be understood relative to the
submanifold, cf. Section 3.5.
5
If for any parameter t ∈ T the function f(·,t) is continuous and X is bounded, a solution to the
parameterized optimization problem (1) exists in the closure of X by Weierstrass’ Theorem (Bertsekas,
1995, p. 540).
6
A real-valued function f defined on a lattice X ⊂ Rn
is quasi-supermodular if f(x) ≥ (>)f(x ∧ y)
implies f(x ∨ y) ≥ (>)f(y), for all x,y in X, where x ∨ y = (max{x1,y1},...,max{xn,yn}) and x ∧ y =
(min{x1,y1},...,min{xn,yn}). As its name suggests, quasi-supermodularity is a weaker condition than
supermodularity.
7
A real-valued function f defined on the product X ×T of two partially ordered spaces has the single-
crossing property if, whenever x0
> x and t0
> t, f(x0
,t) ≥ (>)f(x,t) implies f(x0
,t0
) ≥ (>)f(x,t0
). The
single-crossing property is a weaker condition than supermodularity in (x,t).
6MCS Problem (at t). Given a continuously differentiable evaluation function ϕ and a
parameter value t ∈ T , find a nonempty open interval It with 0 ∈ It and a path γt : It →
T , such that ϕ ◦ x(γt(λ)) is nondecreasing8
for all λ ∈ It and γt(0) = t.
If a solution (It,γt) of the MCS problem at t is such that the path γt cannot be extended
in T , then we call the solution maximal. We can restrict our attention, without any loss of
generality, to a maximal solution of the MCS problem at t. Monotone comparative statics
relative to an evaluation function ϕ and a parameter starting value t obtain whenever the
vector ϕ◦x is componentwise nondecreasing along an appropriate path γt in the parameter
space T . Along any such path, x(γt(λ)) solves (1) for all λ ∈ It. A solution to the MCS
problem for all t ∈ T results in a global flow θ(λ,t) = γt(λ), for which θ(0,t) = t and
λ ≤ µ ⇒ ϕ ◦ x(θ(λ,t)) ≤ ϕ ◦ x(θ(µ,t)), (2)
for any λ,µ ∈ It. If it is possible to represent the global flow in the form
θ(λt,ψ(t)) = t, (3)
where λt is uniquely determined and ψ : T → P is a function that maps the parameter
space to a fixed (m−1)-dimensional hypersurface P transverse to the vector field induced
by the MCS paths γt, then using the new parameters s(t) = (s1,...,sm)(t) = (λt,π(ψ(t)))
guarantees monotone comparative statics of ϕ ◦ x(s) in s1 = λ at least locally, where π
is a diffeomorphism from P onto a subset of Rm−1
(details are provided in Section 4).
Letting F =
S
t∈T It×{t}, we formulate the global parameter-change problem accordingly.
Global MCS Reparameterization. If the flow θ : F → T solves the MCS problem
everywhere in T , find a new parameterization s(t) = (s1,...,sm)(t) = (λt,π(ψ(t))) such
that (3) is satisfied for all t ∈ T .
A global MCS reparameterization provides the decision maker with new problem parame-
ters s = (s1,...,sm) that guarantee monotonicity of ϕ(x̂(s)) in the first component s1 ∈ I,
where
x̂(s) = argmax
x∈X
ˆ f(x,s) (4)
and ˆ f(x,s) corresponds to the objective function f(x,t) after the parameter change.
8
A vector v(λ) is nondecreasing in λ if and only if each of its components is nondecreasing in λ.
73 Solving the MCS Problem at t
Our goal is to find directions in which solutions of the parameterized optimization prob-
lem (1) (or functions thereof) are increasing. For this we introduce a “pseudo-gradient”
W(x,t) which mimics the gradient matrix ∇tx(t) = W(x(t),t) corresponding to all po-
tential solutions x ∈ R(t) with respect to the parameters t on a set R(t) that is known
to contain the actual solution x(t). We refer to R(t) as a “reduced feasible set,” for it
is a subset of the set of all feasible actions X. The cardinality of R(t) is a measure of
how much information the decision maker has about the location of the solution to (1)
at t. If for a given t ∈ T all row-vectors of the pseudo-gradient lie in the same m-
dimensional half-space for all points of the reduced feasible set (a subset of X), then a
direction v(t) ∈ Rm
\ {0} exists in which monotone comparative statics obtain locally.
Naturally, if such a direction can be found for all points t of the parameter space T , then
the resulting vector field v : T → Rm
constitutes a solution to the MCS problem on T .
The flow induced by this vector field can then be used to obtain an MCS reparameteri-
zation of the optimization problem (1), which is discussed in Section 4. In what follows
we first introduce a number of assumptions needed for the vector field method. We then
provide techniques to implement the method, and relate the vector field method to classic
supermodularity results. Finally, we provide important methods to deal with problems
that contain equality and/or inequality constraints.
## 3.1 Preliminaries
In order to use standard tools from differential geometry, we require that f be sufficiently
smooth.
Assumption 1 (Smoothness) The objective function f is twice continuously differen-
tiable in x and has continuous cross-derivatives with respect to each tuple (xi,tk), for all
1 ≤ i ≤ n and all 1 ≤ k ≤ m.
Let us denote by
H(x,t) = ∇xxf(x,t) =

∂2
f(x,t)
∂xi∂xj
n
i,j=1
the Hessian matrix of f(·,t) evaluated at (x,t), and by
K(x,t) = ∇xtf(x,t) =

∂2
f(x,t)
∂xi∂tk
n,m
i,k=1
the matrix of cross-derivatives of f between decision-variable and parameter components,
evaluated at (x,t). In order to bypass (at least for now) any difficulties arising from bind-
8ing constraints at the optimal action, we will assume that the parameterized optimization
problem (1) possesses a unique unconstrained optimum. Constrained optimization prob-
lems can often be restated equivalently so as to satisfy this assumption, and Section 3.5
is dedicated to this issue. We also emphasize that nothing in our method requires that
the feasible set X be a lattice (cf. also footnote 17).
Assumption 2 (Existence and Uniqueness) For each t ∈ T the parameterized op-
timization problem (1) has a unique solution x(t).
In general, the set of maximizers is guaranteed to be nonempty and in the interior of X if,
in addition to being continuous, f is coercive relative to X, in the sense that for any t ∈ T
there exists a point x̌(t) ∈ X such that9
f(x̌(t),t) ≥ maxf(∂X,t), cf. Bertsekas (1995,
pp. 8, 540). If f(·,t) possesses multiple strict local extrema for some t ∈ T , our results can
be applied with respect to the comparative statics of each local maximum. Since X is open,
Fermat’s Lemma (Zorich, 2004, Vol. I, p. 215) implies that each strict local extremum c(t)
(and in particular the unique global maximum x(t) guaranteed by Assumption 2) is a
critical point of f(·,t), i.e., ∇xf(c(t),t) = 0. We denote by C(t) the set of all critical
points10
of f(·,t) in X at t,
C(t) = {x ∈ X : ∇xf(x,t) = 0}.
Thus, if the decision maker can determine C(t), she might be able to find the optimal
action x(t) as the solution of a reduced optimization problem, x(t) = argmaxc∈C(t) f(c,t),
using the first-order necessary optimality conditions. Assumption 2 also implies that
for any t ∈ T at the unique global optimum x(t) the Hessian matrix of f(·,t) is negative
semidefinite, i.e., x(t) satisfies the second-order necessary optimality condition x(t) ∈ D(t),
where
D(t) = {x ∈ X : H(x,t) ≤ 0}.
This allows the decision maker to further reduce the optimization problem combining the
first-order and second-order necessary optimality conditions and solve
x(t) = arg max
x∈R(t)
f(x,t), (5)
where we refer to R(t) ⊆ X as a reduced feasible set; in this case R(t) = (C ∩D)(t). More
generally, we refer to any subset R(t) of X which is guaranteed to contain the solution x(t)
9
∂X denotes the boundary of X.
10
Note that if f(·,t) has a critical point (i.e., X ∩ C(t) 6= ∅) and is strictly concave on X for all t ∈ T ,
then Assumption 2 is automatically satisfied, since f(·,t) is necessarily single-peaked on X.
9of (1) as an admissible reduced feasible set. Any element of R(t) is called a reduced-feasible
action. If the decision maker can determine an admissible reduced feasible set R(t) (e.g.,
by using first- and second-order necessary optimality conditions), so that she is able to
solve the (reduced) parameterized optimization problem (5) on T , then the MCS problem
always has a trivial solution, as will become clear below (cf. Theorem 1). Unfortunately, in
many practical applications, a closed-form solution of (1) is not possible, or the objective
function is not perfectly known by the decision maker (see Milgrom (1994) and Section 6).
In that case, by constructing a reduced feasible set R(t) ⊆ X that is guaranteed to contain
the optimal action x(t) (e.g., by using heuristics related to the special structure of the
problem), the decision maker may still be able to solve the MCS problem without an
explicit solution to the (equivalent) parameterized optimization problems (1) and (5).
To obtain a solution to the MCS problem when the optimal action x(t) can only be
imperfectly localized in the set R(t) ⊆ X, we require that all critical points of f(·,t)
in R(t) be nondegenerate (i.e., such that the Hessian matrix of f(·,t) is nonsingular
there).
Assumption 3 (Nondegeneracy) For any t ∈ T the Hessian matrix H(x,t) is non-
singular for all x ∈ R(t), for some reduced feasible set R(t) ⊆ X which contains x(t).
This assumption guarantees that the inverse H−1
(x,t) is well defined and continuous
at any point (x,t) ∈ R(t) × T . Hence the expression −(H−1
K)(x,t), evaluated at a
point (x,t) possibly different from the optimal (x(t),t), is well-defined. Assumption 3 is
automatically satisfied if the objective function is strictly concave.
Lemma 1 Under Assumptions 1–3 the unique optimal solution x(t) of the parameterized
optimization problem (1) is continuously differentiable on T . The corresponding Jacobi
matrix is given by
∇tx(t) =

∂xi(t)
∂tk
n,m
i,k=1
= − H−1
K

(x(t),t), (6)
for all t ∈ T .
Proof. By Assumption 2, a unique interior solution x(t) to the parameterized
optimization problem (1) exists for all t ∈ T , satisfying H(x(t),t) ≤ 0 and
∇xf(x(t),t) = 0. (7)
By Assumption 1 we can differentiate (7) with respect to t (using the chain rule) and
obtain
∇t (∇xf(x(t),t)) = (∇xxf(x(t),t))(∇tx(t)) + ∇xtf(x(t),t) = 0,
10or equivalently
H(x(t),t)∇tx(t) + K(x(t),t) = 0,
for all t ∈ T . Since H(x(t),t) is nonsingular by Assumption 3, we get expression (6)
after left-multiplication with H−1
(x(t),t) in the last equality. We now show that ∇tx(t)
is continuous. Since the maximizer x(t) is unique and the objective function f contin-
uous, we have that, as a consequence of Berge’s (1963, p. 116) Maximum Theorem, the
maximizer x(t) is continuous in t (for it is upper-semicontinuous and single-valued). By
virtue of Assumption 1 and nonsingularity of H, all entries of the matrix (H−1
K)(x(t),t)
are well defined and as a composition of continuous functions also continuous. Hence, the
Jacobi matrix ∇tx(t) on the left-hand side of equation (6) must also be continuous, which
completes the proof. 
In order to study the monotonicity of ϕ ◦ x(t), we require some smoothness as well as
functional independence (Zorich, 2004, Vol. I, p. 508) of the evaluation function.
Assumption 4 (Functional Independence) The evaluation function ϕ is continu-
ously differentiable on X, and its Jacobi matrix Φ(x) = ∇xϕ(x) =
h
∂ϕl(x)
∂xi
id,n
l,i=1
has (full)
rank d for any (reduced-)feasible action x.
Assumption 4 is not critical for our results and can (except for the smoothness portion)
be relaxed. Functional independence guarantees that the MCS problem is locally never
trivial, since no two of ϕ’s components are collinear. If Assumptions 1–4 hold, then for
any (reduced-)feasible tuple (x,t) we can define the (d × m)-matrix
W(x,t) = −Φ(x)H−1
(x,t)K(x,t), (8)
which we term the pseudo-gradient of the MCS problem at (x,t). In analogy to Lemma 1, it
is easy to show that the pseudo-gradient evaluated at any optimizing decision-parameter
tuple (x(t),t) describes the comparative statics of ϕ ◦ x(t) along paths parallel to the
standard coordinates in the parameter space T , i.e.,
∇tϕ(x(t)) = W(x(t),t). (9)
We say that the pseudo-gradient of the MCS problem is orientable at (x,t), if the collection
of all its row vectors is a subset of a common half space of Rm
. If for a given t ∈ T the
row vectors of W(x,t) lie in a common half space of Rm
for all x in a set Y ⊆ X, then
we say that the pseudo-gradient is orientable on Y at t.
113.2 The Vector Field Method
To find a path γt that solves the MCS problem at t ∈ T , our method requires track-
ing down some information about the direction of the gradient ∇t(ϕ(x(t))), given that
the decision maker only knows that x(t) lies in some reduced feasible set R(t) ⊆ X.
More specifically, we need to determine a direction forming acute angles with the pseudo-
gradient of the MCS problem. Such a direction exists if the pseudo-gradient is orientable.
Assumption 5 (Pseudo-Gradient Orientability) For each t ∈ T there exists a
continuously differentiable vector field v(t) ∈ Rm
\ {0} such that
W(x,t)v(t) ≥ 0, (10)
for all x ∈ R(t), where R(t) ⊆ X is an admissible reduced feasible set.
Under Assumption 5, v(t) defines a vector field on T and a phase diagram with paths
corresponding to the flow of this vector field.11
The key result of this section is that ϕ◦x
is nondecreasing along the paths.
Theorem 1 Under Assumptions 1-5, let I ⊂ R be an open interval and γ : I → T a
differentiable path such that
γ̇(λ) = v(γ(λ)),
for all λ ∈ I. Then, ϕ(x(γ(λ))) is nondecreasing for all λ ∈ I.
Proof. Since γ is differentiable on I, Lemma 1 implies (using Assumptions 1 and 2)
that
∇tx(γ(λ)) = − H−1
K

(x(γ(λ)),γ(λ)).
Thus, using Assumption 4 and equation (9), the gradient of ϕ(x(γ(λ))) with respect to λ
is given by
∇λϕ(x(γ(λ))) = W(x(γ(λ)),γ(λ))γ̇(λ) = W(x(γ(λ)),γ(λ))v(γ(λ)).
By virtue of inequality (10) in Assumption 5, the latter expression is nonnegative. 
Under the assumptions of Theorem 1, we say that ϕ(x(t)) is nondecreasing along the
trajectories of v(t).
11
The trajectories of a vector field v(t) exist and are unique on the whole domain T if the vector field
is Lipschitz there (Khalil, 1992, pp. 74–77), and in particular when v is continuously differentiable on T .
12Figure 1: Solution to the MCS Problem at t for ϕ(x) = x1.
## 3.3 Implementation
Under Assumptions 1–5 the vector field method can be implemented using the follow-
ing techniques. First, for any t ∈ T determine a reduced feasible set R(t) ⊆ X that is
guaranteed to contain the interior solution x(t) of the parameterized optimization prob-
lem (1). Second, to satisfy Assumption 5, verify that the pseudo-gradient W(x,t) is
orientable on R(t). Note that for any given t ∈ T it may be possible to achieve ori-
entability by premultiplying the evaluation function ϕ by some diagonal (d × d)-matrix
of the form M(t) = diag(m1,...,md)(t) where ml(t) ∈ {−1,1} for all l ∈ {1,...,d}.
Indeed if ϕ̂(x,t) = M(t)ϕ(x), then it is possible to find a matrix M(t) such that the
pseudo-gradient Ŵ(x,t) corresponding to the modified evaluation function ϕ̂,
Ŵ(x,t) = M(t)W(x,t) = −M(t)Φ(x)H−1
(x,t)K(x,t),
is orientable at (x,t). In particular, if a matrix M can be found that is independent of t,
then this suggests that it would be advantageous for the analysis of the problem if the
decision maker uses the evaluation function ϕ̂ instead of ϕ. Third, find a vector field v
that satisfies (10). To accomplish this, a systematic, algorithmic procedure to determine
a vector field v(t) that is “maximally aligned” with the pseudo-gradient W(x,t) consists
in solving the maximin problem,12
v(t) ∈ arg max
v∈Rm:kvk=1

min
x∈R(t)

min
1≤l≤d
hWl(x,t),vi

. (11)
12
Wl is the l−th row vector of W, and h·,·i denotes the scalar product in the relevant Hilbert space.
13When the assumptions of the Min-Max Theorem (Kakutani, 1942) are satisfied, any
solution v(t) to problem (11) also satisfies
v(t) ∈ arg min
x∈R(t)

max
v∈Rm:kvk=1

min
1≤l≤d
hWl(x,t),vi

. (12)
Motivated by the minimax formulation (12), since W is orientable by assumption, one
obtains the following set of candidate vector fields,
V =

W1(x̂1
(t),t)
kWd(x̂1(t),t)k
,...,
Wd(x̂d
(t),t)
kWd(x̂d(t),t)k

t∈T
, (13)
where for any l ∈ {1,...,d} we have set
x̂l
(t) = arg min
x∈R(t)
kWl(x,t)k.
One can now check if any element of V is a suitable vector field on T or possibly a subset
thereof.
The above three steps can be iterated to tighten the reduced feasible set. It can also be
useful to only consider subsets of the parameter space T . Note that if an exact solution
to the maximization problem (5) is known for some t ∈ T , then the MCS problem at t
has a solution if any only if W(x(t),t) is orientable at (x(t),t).
Example 1 Consider a firm that has the option to invest in a number x of geographically
dispersed markets (e.g., cities in the US) at an increasing convex cost C(x) ≥ 0. For
simplicity, the market price p ∈ (0,1) for the firm’s product is assumed to be the same
in each market; it is announced nationally and is a parameter of the problem. Marginal
costs for hamburgers are zero. The demands in the different markets are uncorrelated and
the firm is risk averse with constant absolute risk aversion ρ. By investing in x markets
the firm also reaps an increasing concave side benefit B(x) ≥ 0 (e.g., through real-estate
transactions).13
With a probability q ∈ (0,1 − p) that is at most directly proportional
to the quantity sold in each market the firm incurs a unit loss in any market due to a
13
By imposing the Inada conditions C0
(0) < ∞ and B0
(0) = ∞ one can easily guarantee that the
optimum is interior, i.e., x(t) > 0, so that we can without loss of generality set X = (0,∞).
14liability claim. The firm’s expected payoffs are approximately14
Π(x,q,p) = p(1 − p)x + B(x) − EL̃ −
ρ
2
var(L̃) − C(x)
=

p(1 − p) − q −
ρq(1 − q)
2

x + B(x) − C(x),
where the random variable L̃ ∈ {0,1,...,x} represents the firm’s total losses. Maximizing
profits we thus obtain x∗
(q,p) = ξ(p(1−p)−q −ρq(1−q)/2), where ξ is the (increasing)
inverse of C0
− B0
. Hence, the maximizer x(t) is increasing in the parameter t ∈ T =
{(q,p) ∈ R2
++ : p + q < 1} if and only if p(1 − p) − q − ρq(1 − q)/2 is increasing. The
corresponding pseudo-gradient at the optimum is
W(x(t)) = [−1 + ρq − ρ/2,1 − 2p]ξ0
(p(1 − p) − q − ρq(1 − q)/2),
so that with v(t) = (−p,qρ/2) we obtain
hW(x(t)),v(t)i =
ρξ0
(t)
2

2p
ρ
+ p + q − 4pq

≥
(4ρ − 1)ξ0
(t)
16
> 0,
for all t ∈ T and ρ > 1/4. The simple elliptic vector field v thus solves the MCS problem
on T . In Example 3 we show how to obtain a global MCS reparameterization of the
problem based on the vector field v, cf. Figure 2. Let us remark that clearly in this
example R(t) = {x(t)}, if ξ−1
is known precisely (for any given B and C). However, our
conclusions can be obtained without further specifying the firm’s payoffs. Also note that
it would have been possible to trivially replace p(1 − p) − q − ρ(1 − q)q/2 by a scalar
parameter λ, which would somewhat decrease the resolution of insight (not a one-to-one
mapping from the parameter space) for the decision maker somewhat, yet clearly provide
trivial but precise monotone comparative statics. 
## 3.4 Relation to Classic Supermodularity Results
We now derive a well-known supermodularity result as a particular case of Theorem 1.
Under Assumption 1, we recall that f(x,t) is supermodular in x if ∂2f(x,t)
∂xi∂xj
is nonnegative
for all (x,t) ∈ X×T and 1 ≤ i 6= j ≤ n. We call the function f(x,t) supermodular in (x,t)
if in addition ∂2f
∂xi∂tk
(x,t) is nonnegative for all (x,t) ∈ X × T and 1 ≤ i ≤ n,1 ≤ k ≤ m.
14
The dependence of Π on the parameter ρ is not explicitly noted. In fact, in this problem the compara-
tive statics with respect to ρ are obvious. We can thus use ρ itself in solving the MCS problem and finding
an appropriate simple reparameterization, which illustrates an interesting “partial reparameterization”
variant of our technique.
15Figure 2: Global MCS Reparameterization in Examples 2 and 3.
Corollary 1 Suppose that Assumptions 1-3 hold and that f is supermodular in (x,t).
Then x(t) is nondecreasing in t.
Proof. We show that x(t) is nondecreasing in each component of t = (t1,...,tm).
Supermodularity in (x,t) implies that all components of K(x,t) are nonnegative on X×T .
It also implies that Hij(x,t) ≥ 0 for all i,j ∈ {1,...,m} with i 6= j on X×T . Without loss
of generality we can restrict our attention to the reduced feasible set R(t) = (C ∩ D)(t).
Hence Hii(x(t),t) ≤ 0 for all i ∈ {1,...,n}, for the Hessian matrix is negative definite at
the optimum. Since H−1
ij = (−1)i+j
det(Hji
)/det(H), it is a simple linear algebra exercise
to verify that H−1
ij ≤ 0 on X × T for all i,j in {1,...,n}.15
For any vector v(t) > 0 all
entries of −H−1
(x,t)K(x,t)v(t) are therefore nonnegative. As a result, Assumption 5 is
satisfied for ϕ(x) = x and v(t) ≡ ek where ek is the k-th unit vector in the canonical basis
of Rm
. An application of Theorem 1 with ϕ(x) = x concludes the proof. 
An important case that is not currently dealt with in the monotone comparative statics
literature is when f is supermodular in x but does not have the single-crossing property
in (x,t).16
In that context, Assumption 5 can be simplified as follows.
Assumption 5’ For each t ∈ T , there exists a vector v(t) ∈ Rm
such that K(x,t)v(t) is
nonnegative for all x ∈ R(t), where R(t) ⊆ X is an admissible reduced feasible set.
15
The adjoint matrix Hij
is obtained by removing the i-th row and the j-th column from H.
16
In particular, f is not supermodular in (x,t).
16Corollary 2 Suppose that Assumptions 1-3 and 5’ hold and that f is supermodular
in x. Then, x(t) is nondecreasing along the trajectories of v.
Proof. We modify the proof of Corollary 1. Supermodularity in x ensures
that H−1
ij ≤ 0 on X × T for all i,j ∈ {1,...,n}. This together with Assumption 5’
implies that all entries of −H−1
(x,t)K(x,t)v(t) are nonnegative. A direct application of
Theorem 1 with ϕ(x) = x concludes the proof. 
Corollary 2 applies to situations in which there are complementarities between the dif-
ferent decision variables, but not between decision variables and parameters. Since the
maximizer under the original parameterization can be nonmonotonic, it is clear that
Assumption 5’ relaxes the tight single-crossing requirement put forward in Milgrom in
Shannon (1994) for the price of an MCS reparameterization of the problem.
## 3.5 Constrained Optimization Problems
Assumption 2 requires that the optimizer be in the interior of the feasible set X. This
assumption can be relaxed in different ways, either by reducing the dimensionality of the
decision space (using a substitution approach for equality constraints) or by augmenting
the dimensionality of the decision space (using a Lagrange-multiplier approach for equality
and/or inequality constraints).
Substitution Approach. Any equality constraints that are part of the definition of
the feasible set X define in fact a lower-dimensional set X0
that forms a submanifold
of X (with or without boundary). If the equality constraints can be solved globally for a
number of decision variables, the parameterized optimization problem can be viewed as
unconstrained on X0
after backsubstitution of these variables. More specifically, if X0
is
diffeomorphic to an open subset of Rn̂
with n̂ < n, the problem can be seen as uncon-
strained on an open subset of Rn̂
. To render our discussion precise, consider the problem17
max
x∈X(t)
f(x,t) (14)
with
X(t) = {x ∈ Y : g(x,t) = 0},
17
Note that in this formulation it is possible to have the feasible set depend on parameters. In contrast
to standard MCS results obtained on lattices, we do not assume at the outset that X(t) is monotone in t
with respect to the Veinott set order (Milgrom and Shannon, 1994). We are grateful to Pete Veinott for
pointing out that his set order (originally termed “lower than” relation) was first introduced by him in
a 1965 unpublished paper.
17where Y is an open subset of Rn
, t belongs to an open set T of Rm
, and g takes values
in Rk
(for some 1 ≤ k < n) and is twice continuously differentiable. Suppose that the
level set g(x,t) = 0 can be expressed explicitly as (xn−k+1,...,xn)(t) = g̃(x1,...,xn−k,t),
for (x1,...,xn−k) ∈ X0
, where X0
is the projection of Y on the plane {(x1,...,xn−k,0,...,0) :
(x1,...,xn−k) ∈ Rn−k
} ⊂ Rn
. The problem is then reduced to the (n − k)-variable un-
constrained problem on X0
max
(x1,...,xn−k)∈X0
˜ f(x1,...,xn−k,t) = max
(x1,...,xn−k)∈X0
f(x1,...,xn−k,g̃(x1,...,xn−k,t),t).
The application discussed in Section 5.3 provides a simple example of this transformation.
Lagrange-Multiplier Approach. Equality constraints can also be approached with La-
grange multipliers. In the previous example, a necessary condition (Bertsekas, 1995,
p. 255) for optimality is the existence of a k-dimensional vector ν such that at the opti-
mum
∇xf(x,t) + νT
∇xg(x,t) = 0.
Together with the k equations g(x,t) = 0, this determines a system of n + k equations
in n + k + m variables x, t, and ν
G(x,t,ν) =
"
∇xf(x,t) + νT
∇xg(x,t)
g(x,t)
#
= 0.
The implicit function theorem implies that, if Gxν is invertible, then locally
∇t(x,ν)(t) = −

G−1
xν Gt

(x,ν,t).
Even though the position of the optimal x and ν in X × Rk
is unknown, it might be
possible to find directions in the parameter space, such that x(t) is nondecreasing in
these directions. The following example illustrates this Lagrange-multiplier approach
with equality constraints.
Example 2 Consider an economy with two goods (x,y) ∈ R2
+, with the production
frontier {(x,y) ∈ R2
+ : g(x,y) = x2
+ y2
− 1 = 0} and a representative agent with util-
ity f(x,y) = u(x)+tv(y), where u,v are twice continuously differentiable, increasing and
concave. We would like to determine the monotonicity properties of the optimizer (x,y)(t)
with respect to the parameter t. The constraint set is clearly not a lattice, hence classic
supermodularity results do not apply directly.18
Using the Lagrange-multiplier approach
18
However, classic results could be applied in conjunction with the substitution approach described
earlier.
18we have
G(x,y,ν,t) =




u0
(x) + 2νx
tv0
(y) + 2νy
x2
+ y2
− 1



,
which implies that
Gx,y,ν(x,y,ν,t) =




u00
(x) + 2ν 0 2x
0 tv00
(y) + 2ν 2y
2x 2y 0




and
Gt(x,y,ν,t) =




0
v0
(y)
0



.
An application of the implicit function theorem then yields
d
dt




x
y
ν



 =
v0
(y)
D




−4xy
4x2
2y(u00
(x) + 2ν)



,
where D = −4y2
(u00
(x)+2ν)−4x2
(tv00
(y)+2ν). In this problem, the condition ∇f+ν∇g =
0 implies that ν is negative, since the gradients of f and g both belong to the positive
orthant of R2
. This, along with the concavity of u and v, implies that D is positive and
that ∇tx < 0 < ∇ty, i.e., monotone comparative statics obtain. 
Inequality constraints can be approached in a similar fashion. Consider again prob-
lem (14), this time with
X(t) = {x ∈ Y : g(x,t) = 0,h(x,t) ≤ 0},
where Y is an open subset of Rn
, t belongs to an open set T of Rm
, g and h take values
in respectively Rk
and Rr
(with k+r < n) and are both twice continuously differentiable.
The Kuhn-Tucker necessary optimality conditions (Bertsekas, 1995, p. 284) imply the
existence of adjoint variables ν and µ in respectively Rk
and Rr
+, such that
∇xf + hν,∇xgi + hµ,∇xhi = 0,
and
µ̂i(x,µ,t) = µi(t)hi(x,t) = 0
19for all i ∈ {1,...,r}. Letting
G(x,ν,µ,t) =




∇xf + νT
∇xg + µT
∇xh
g(x,t)
µ̂(x,µ,t)



,
a necessary optimality condition is that G(x,ν,µ,t) = 0. This defines a system of n+k+r
equations in n + k + r + m variables, so that we can apply (if the relevant matrix is
invertible) the implicit function theorem to compute ∇t(x,ν,µ), and proceed as in the
equality case. In some problems, it is possible to know in advance which inequality
constraints are binding at the optimum. In this simple case, non-binding inequalities
are ignored, while binding ones are treated as equality constraints. This approach is
illustrated in the applications of Sections 5.2 and 5.3.
## 4 Finding a Global MCS Reparameterization
Given a smooth solution v : T → Rm
to the MCS Problem, it is interesting in practice
to find an MCS reparameterization of the optimization problem (1). The idea is to start
with the flow θ : F → T induced by the vector field v and note that this flow is smooth
and unique on what we refer to as the maximum “flow domain” F ⊂ R × T , beyond
which the integral curves of the vector field cannot be extended. By taking a plane that
is transverse (i.e., never collinear) to these integral curves, it is possible to construct new
parameter coordinates under which monotone comparative statics obtain, at least locally.
## 4.1 Global Flows
As a consequence of the standard theory on ordinary differential equations (ODEs; Arnold,
1973) we obtain that if the solution v is smooth, then integral curves to the vector field
exist, are unique, and induce a smooth local flow θ.19
To define the concept of a local
flow, let us first introduce a flow domain F ⊂ R×T with the property that for any t ∈ T ,
the set
F(t)
= {λ ∈ R : (λ,t) ∈ F} ⊂ R
is an open interval containing zero. A local flow on T is a continuous map θ : F → T
that satisfies the following two group laws:
θ(0,t) = t, (15)
19
Existence and uniqueness of integral curves is also obtained when the vector field v merely satisfies
a Lipschitz condition (cf. footnote 11).
20for all t ∈ T , and
θ(λ,θ(µ,t)) = θ(λ + µ,t), (16)
for all λ ∈ F(t)
and µ ∈ F(θ(λ,t))
such that λ + µ ∈ F(t)
. In addition, for a given local
flow θ we define
θλ(t) = θ(t)
(λ) = θ(λ,t)
whenever (λ,t) ∈ F. A local flow (sometimes also referred to as a “one-parameter group
action”) relates for any t ∈ T the vector field v(t) to its orbits θ(t)
(λ). If the flow domain
is such that the map θ is surjective (i.e., θ(F) = T ), then we call θ a global flow.
Theorem 2 (ODE Existence, Uniqueness, and Smoothness) Let v : T → Rm
be a smooth vector field. Consider the initial value problem
∇λγt(λ) = v(γt(λ)), γt(λ0) = t. (17)
(i) Existence: For any λ0 ∈ R there exist a nonempty open interval I which con-
tains λ0 and an open set U ⊂ T such that for any t ∈ U there is a smooth integral
curve γt : I → T which solves (17) for all λ ∈ I.
(ii) Uniqueness: Any two smooth solutions to (17) agree on their common domain.
(iii) Smoothness: Let F = I × U as in (i). If we define the local flow θ : F → T with
θ(λ,t) = γt(λ), then θ is smooth.
Proof. See e.g., Lee (2003, pp. 452–459).
In the following we use global flows corresponding to the solution vector field v to the
MCS problem on T (or a subset thereof) in order to find a global MCS reparameterization
of problem (1) as previously indicated in Section 2
## 4.2 Coordinate Change in Parameter Space
By construction, if v is a solution to the MCS problem on T , it is nonsingular everywhere.
The lack of singular points allows us to give a canonical, local representation of v using a
change of coordinates in T . Consider a point t0 of T . If v is smooth, there exists an open
interval I ⊂ R containing the origin and an open subset U of T satisfying the conclusions
of Theorem 2 (with λ0 = 0). Moreover, since v(t0) is nonsingular, it uniquely determines
an orthogonal hyperplane H ⊂ Rm
containing t0. Let
P = U ∩ H ⊂ Rm
.
21Since H is diffeomorphic to Rm−1
, P can also be seen as an open subset of Rm−1
. To
avoid confusion, let Π = π(P) denote the image of P under the diffeomorphism π : H →
Rm−1
. Theorem 2 implies the existence of a smooth flow θ(λ,t), which we restrict to the
domain I×P. The flow can be reparameterized by θ(λ,π) on the product S = I×Π ⊂ Rm
.
Moreover, the corresponding range T̄ = θ(S) is an open subset of T by Theorem 2. Last,
θ is one-to-one and smooth from S to T̄ , also by Theorem 2. We have therefore defined
a local change of coordinates around t0: any t in the open neighborhood T̄ of t0 can be
uniquely expressed by a tuple (λt,π(ψ(t))) ∈ S. The (m−1)-dimensional component ψ(t)
of t is the intersection of the trajectory going through t with the hyperplane H. Moreover,
since t = γψ(t)(λt), Theorem 1 implies that ϕ ◦ x is nondecreasing along the trajectories
of the flow θ as λ increases. We have thus proved the following result.
Theorem 3 (Local MCS Reparameterization) If v solves the MCS problem on T ,
there exists a local MCS reparameterization of the form
s = (s1(t),s2(t),...,sm(t)) = (λt,π(ψ(t))), (18)
around any t0 ∈ T , such that ϕ(x(s)) is nondecreasing in s1.
In practice, this result can often be applied globally as the following example illustrates.
Example 3 In Example 1 we obtained a vector field of the form v(t) = (−t2,αt1) (for
some α > 0) as the solution to an MCS problem on some T ⊂ R2
+ \ {0}. Since v2(t) =
αt1 6= 0 on T we can choose the plane P = {t ∈ T : t = (t1,0)} which is transverse to the
vector field. The (global) flow of the vector field v(t) is given by
θλ(t1,t2) =

t1 cos
√
αλ −
t2 sin
√
αλ
√
α
,t1
√
αsin
√
αλ + t2 cos
√
αλ

.
Thus, for any (s,0) ∈ P we obtain
θλ(s,0) = (scos
√
αλ,s
√
αsin
√
αλ),
for λ ∈ (0,π/(2
√
α)) and s > 0. Hence, on any contractible20
compact subset T̄ of T
we obtain the global reparameterization t 7→ (λ,s) with λ = 1 √
α
arctan t2 √
αt1
and s =
p
t2
1 + (t2
2/α), cf. Figure 2. In the context of Example 1, the key insight for the decision
maker from the MCS reparameterization is that the optimal number of markets to invest
in varies monotonically in the ratio p/q, i.e., the product price in relation to the risk of
liability lawsuits. 
22Figure 3: Global MCS Reparameterization.
We now formally generalize the reparameterization technique used in the local case by
providing a general condition under which Theorem 3 holds globally.
Assumption 6 (Transverse Hypersurface) There exist subsets T̄ and P of T with
T̄ open and P ⊂ T̄ , such that:
(i) there exists a convex, open subset Π of Rm−1
and a diffeomorphism π mapping P
onto Π;
(ii) for each t ∈ T̄ , γt(F(t)
) ∩ P is a singleton {ψ(t)}.
This last assumption ensures that trajectories of an MCS vector field v lead to a foliation
of the subset T̄ of T . In other words, the existence of a set of points P, each element of
which can be associated with exactly one trajectory, allows projection of the set T̄ onto P
and – via the length (from t to ψ(t)) of the trajectory (which could pass outside T̄ ) –
obtain a bijection between T̄ and a set S ⊂ Rm
. This bijection corresponds to the desired
global MCS reparameterization containing the length of the MCS trajectories as one new
parameter in which the solution to the reparameterized problem (4) (when evaluated
with ϕ) varies monotonically.
Theorem 4 (Global MCS Reparameterization) If the vector field v is a solution
to the MCS problem on T̄ and Assumption 6 holds, then there exists a global MCS repa-
rameterization of the form
s = (s1(t),s2(t),...,sm(t)) = (λt,π(ψ(t))), (19)
20
An m-dimensional open set with nonempty interior is contractible if it is homotopy equivalent (i.e., it
can be deformed via a continuous transformation) to an m-dimensional open ball. Intuitively, contractible
sets have no “holes.”
23such that ϕ(x(s)) is nondecreasing in s1.
Proof. Each element t of T̄ uniquely determines an element ψ(t) of P and a real λt
such that γψ(t)(λt) = t. The set S =
S
ψ∈P F(ψ)
×{π(ψ)} is an open subset of Rm
. More-
over, the application t 7→ s = (λt,π(ψ(t))) ∈ S is one-to-one from T̄ to S and smooth by
Theorem 2. Last, since t(s) = (λ,ψ) follows the trajectories of v as λ increases, Theorem 1
implies that ϕ(x(s)) = ϕ(x(λ,π)) is nondecreasing in s1 = λ. 
When v has a potential u : T → R, a good candidate for P in Assumption 6 is any iso-
potential that crosses all trajectories.21
Although this need not always be the case, it is
likely that iso-potentials will be diffeomorphic to an open subset of Rm−1
, and to a convex
subset if one chooses T̄ carefully. The following classic theorem (essentially Poincaré’s
Lemma) gives a necessary and sufficient condition for the existence of a potential, which
can be tested on any vector field v satisfying Assumption 5.
Theorem 5 (Existence of a Potential) Let T̄ ⊂ T be a contractible compact do-
main with nonempty interior and v be a vector field on T̄ . Then ∂vk/∂tl = ∂vl/∂tk for
all k,l ∈ {1,...,m} with k 6= l, if and only if there exists a twice continuously differen-
tiable potential u : T → R, i.e.,
v(t) = ∇tu(t),
for all t ∈ T .
Proof. See Zorich (2004, Vol. II, p. 296).
## 5 Applications
## 5.1 Optimal Capacity Choice and Product Distribution
Suppose that a firm can choose the quantity (or, equivalently, the quality) q of a product
that will be provided to each of m geographically dispersed consumers. Each consumer
k ∈ {1,...,m} is located at a point tk ∈ R, representing his or her type. To deliver
the product to consumer i the firm incurs a quadratic transportation (or, customization)
cost d(z − tk)2
, where z ∈ R is the location of a distribution center that the firm is able
to freely determine and d is a positive constant. The firm’s unit transportation cost from
its factory (located at the origin) to the distribution center is given by the smooth convex
function C(z) with C0
(0) = C(0) = 0. To keep our analysis simple, we assume that
21
In that case, trajectories cross P only once, because the potential increases along them.
24each consumer’s demand can be represented by a linear inverse demand function of the
form a−bq, where a,b are positive constants.22
The firm’s profit can therefore be written
as
Π(q,z,t) = mq(a − bq) − dq
m X
k=1
(tk − z)2
− mqC(z), (20)
where t = (t1,...tm) ∈ Rm
. The firm thus solves the parameterized optimization problem
max
(q,z)∈R+×R
Π(q,z,t). (21)
Provided that a is sufficiently large, it is easy to verify that the problem (21) has a unique
interior solution (q∗
(t),z∗
(t)) and satisfies Assumptions 1–3. The firm’s MCS problem
is the following: how does the optimal per-consumer production quantity q∗
vary with t?
Starting from a market characterized by the parameter vector t ∈ Rm
, is there a direction
in the parameter space in which the optimal production quantity q∗
increases? We first
determine the first-order necessary optimality conditions for (21),
∂Π
∂q
= a − 2bq − d
m X
k=1
(tk − z)2
− mC(z) = 0, (22)
and
∂Π
∂z
= 2dq
m X
k=1
(tk − z) − mqC0
(z) = 0. (23)
Therefore, we can restrict R(t) to the subset of tuples (q,z) ∈ X = R+ × R that satisfy
(22) and (23). To apply the method, we also compute Φ, H−1
and K. Since ϕ(q,z) = q,
we have that Φ = (1,0) and Assumption 4 is satisfied. Moreover,
H =
"
−2b 2d
Pm
k=1(tk − z) − mC0
(z)
2d
Pm
k=1(tk − z) − mC0
(z) −2mdq − mqC00
(z)
#
.
The first-order necessary optimality condition with respect to z, given in (23), simplifies
the Hessian matrix H to
H =
"
−2b 0
0 −2mdq − mqC00
(z)
#
.
It follows that23
H−1
=
1
2bmq(2d + C00(z))
"
−2mdq − mqC00
(z) 0
0 −2b
#
,
22
This corresponds to a quadratic utility function uk(q) = aq−bq2
/2 for all consumers k ∈ {1,...,m}.
Allowing for demand heterogeneity with uk(q) = akq − bkq2
/2 leads to analogous results.
23
Observe that the determinant is nonzero, since C00
(z) ≥ 0 by convexity of g.
25whence
−ΦH−1
=

1
2b
,0

.
The first row of K is given by24

∂2
Π
∂q∂t1
,...,
∂2
Π
∂q∂tm

= 2d((z − t1),...,(z − tm)).
Therefore, in order to satisfy Assumption 5, we are looking for a vector v(t) ∈ Rm
such
that
h
d
b
(z − t1,...,z − tm),v(t)i ≥ 0,
for all z ∈ R, or equivalently
h(ze − t),v(t)i ≥ 0, (24)
for all z ∈ R, where e = (1,...,1)/m is the unit vector of the first bisectrix25
∆ in Rm
.
It is easy to see that if v(t) is orthogonal to e and has a nonnegative scalar product
with −t, the condition is satisfied. The vector v(t) = −t + mht,eie is such that first,
he,v(t)i = 0, since he,ei = 1/m; and second, h−t,v(t)i = ht,ti − m(ht,ei)2
≥ 0 by the
Cauchy-Schwarz inequality. Moreover, the inequality is strict if t is not collinear with e.
Last, observe that, when seen from t, v(t) points directly26
to the first bisectrix ∆ of Rm
.
We therefore conclude from Theorem 1 that q∗
(t) increases as t gets closer to ∆. In other
words, as the consumer types become “closer”, the optimal product quantity increases.
When the consumer types are identical (t collinear to e), the optimal production reaches
its maximum. The problem can thus be reparameterized in the following way: define a
cylinder P around the first bisectrix ∆, for example
P =

t ∈ Rm−1
: d(t,∆) = 1 ,
where d is the Euclidian distance from a point to a line. This cylinder is an (m − 1)-
dimensional manifold, which can be parameterized by m−1 components. Moreover, P is
transverse to all trajectories, and is hit by all trajectories once, so that Assumption 6 is
satisfied.27
Therefore, we have a global reparameterization of Rm
where m−1 components
correspond to the position on the cylinder and determine a radius emanating from ∆, and
the remaining component is a parametric representation of the radius. In this particular
24
There is no need to compute the second row, since K is left-multiplied by −ΦH−1
, whose second
component is zero.
25
The first bisectrix is defined by the equation t1 = t2 = ... = tm.
26
The vector v(t) points in the direction of the orthogonal projection of t on ∆.
27
To be rigorous, P is diffeomorphic to Sm−2
× R, where Sm−2
is the unit sphere in Rm−1
. This
parameterization is a generalization of cylindric coordinates in R3
.
26context, it is possible to construct a more efficient parameterization: let H denote the
(m−1)-dimensional hyperplane of Rm
orthogonal to the first bisectrix and going through
the origin, and (1,2,...,m−1) be an orthogonal basis of H. Then, (e1,e2,...,em) =
(1,2,...,m−1,e) is an orthogonal basis of Rm
. Moreover, if t is represented with respect
to that basis, i.e., t = s1e1 + s2e2 + ··· + smem, we obtain a new parameterization of the
parameter space such that q∗
(s1,...,sm) is nonincreasing in (s1,...,sm−1) (the smaller
these coordinates, the closer t is to the first bisectrix).28
It is worth observing that in order to solve the MCS problem, we relied on our knowl-
edge of the first-order optimality condition for z. It is our second use of the crucial
device R(t), which enables us to narrow down the domain where Assumption 5 must be
satisfied. On the other hand, we did not use the fact that the optimizer (q∗
,z∗
) satisfies
the first-order optimality condition for q. Thus R(t) could have been larger without af-
fecting our ability to construct the vector field v satisfying Assumption 5. We also note
that classic supermodularity is of no use in this problem, since q∗
is not monotonic in any
of the tk’s. Last, observe a remarkable fact in our analysis of this example: we are able to
obtain monotone comparative statics for q∗
without solving explicitly for either q∗
or z∗
.
In general, the method can be used to derive monotone comparative statics for any single
decision variable, say, x1, while one is able to solve the optimization problem explicitly
for some other variables, say, xk(t),xi+1(t),...,xn(t). In that case the reduced feasible
set R(t) can be narrowed down to the set of all x ∈ X such that xk = xk(t),...,xn = xn(t).
## 5.2 Neoclassical Production
Consider a firm’s optimal choice of factor inputs, capital k and labor l, so as to maximize
the objective function
f(x,t) = g(k,l) − rk − wl, (25)
where x = (k,l) and t = (r,w) with r the rate of return of capital and w the average
wage rate. As pointed out by Milgrom and Shannon (1994), if g is not supermodular,
comparative statics are not monotone in the original parameterization. To demonstrate
the use of our method we assume that g is twice continuously differentiable and that there
exists a unique optimizer in the interior of R2
+. Therefore, Assumptions 1–3 are satisfied,
with the Hessian and cross-derivative matrices given by
H =
"
gkk gkl
gkl gll
#
and K =
"
−1 0
0 −1
#
.
28
Moreover, it can be shown that q∗
(s) is independent of the last component, sm.
27The pseudo-gradient is therefore
W =
1
D
"
gll −gkl
−gkl gkk
#
,
where D(k,l) = (gkkgll − g2
kl)(k,l) is the determinant of H(k,l). Because of the strict
concavity of g at the optimizer, we can restrict the reduced feasible set R(t) to the subset
of R2
+ where H is negative definite, implying that D(k,l) is positive.29
Notice that the
pseudo-gradient and the reduced feasible set are independent of r and w.30
To simplify
our exposition we drop the explicit dependence on t and refer to R(t) as R. If one can
find a vector v making a positive scalar product with W(k,l) for all (k,l), it will satisfy
Assumption 5 for all values of r and w. The vector field will then consist of straight,
parallel trajectories of direction v. This will generate a linear reparameterization of the
problem (the basis of the new coordinate system consisting of v and any other vector
not collinear to v), under which both k and l are nondecreasing in the first parameter
coordinate. Before addressing the problem of monotone comparative statics for k and l
at the same time, let us consider the simpler problem of finding monotone comparative
statics for k alone. That is, we consider the function ϕ(k,l) = k, which trivially satisfies
Assumption 4. The pseudo-gradient then becomes
Wk(k,l) = Φ(k,l)W(k,l),
with Φ(k,l) = (1,0). This yields
Wk(k,l) =
1
D
(gll,−gkl).
We are looking for a vector v ∈ R2
\ {0} such that hWk(k,l),vi ≥ 0, or equivalently
h(gll,−gkl),vi ≥ 0. (26)
Since gll is nonpositive, a solution is v = (−1,0). That is, k(r,w) is nondecreasing in r.
Notice that this result obtains without any assumption on g except for smoothness.31
In general, k(r,w) is not monotonic in w: this would require gkl ≥ 0 for all (k,l) (as
29
The determinant D is positive at any maximizer of (25) as the product of the two negative eigenvalues
of H.
30
Note that H,K and D are all independent of (r,w).
31
Another way to see this is the following: the function f(k,l,r,w) = g(k,l)−rk−wl is supermodular
in (r,k). To apply standard supermodularity results, define F(k,r,w) = maxl≥0 f(k,l,r,w). F is super-
modular in (k,r) and argmaxk≥0 F(k,r,w) = k(r,w). This implies that k(r,w) is nondecreasing in r.
We thank Paul Milgrom for this observation.
28can be seen by substituting v = (0,−1) in equation (26)). However, there may be other
directions of v such that k is nondecreasing. Equation (26) can be rewritten as
v1gll(k,l) − v2gkl(k,l) ≥ 0
for all (k,l) ∈ R2
+. Since gll ≤ 0 on R, this is equivalent to
v1 ≤ (D ∧ d)v2 (27)
where (d,D) = (inf δ,sup∆) with
δ =

gkl
gll
(k,l) : gkl ≥ 0, gll < 0, (k,l) ∈ R

,
∆ =

gkl
gll
(k,l) : gkl ≤ 0, gll < 0, (k,l) ∈ R

,
as well as the conventions that inf{∅} = +∞ and sup{∅} = −∞. When ∆ 6= ∅, D ≥ 0.
Similarly, d ≤ 0 if δ 6= ∅. When g is supermodular, ∆ is empty or reduced to the
singleton {0}, so that D ≤ 0. Moreover, δ 6= ∅ implies d ≤ 0, so that condition (27) is
satisfied by any v ∈ R2
−, by virtue of the nonpositivity of d ∧ D. This proves that k(r,w)
is nonincreasing not only in r, but also in w, whenever g is supermodular. In general,
relation (27) defines a convex cone Γk ∈ R2
based at the origin which always contains
the negative real line R− × {0}. Except when both D = +∞ and d = −∞, Γk has a
nonempty interior. If gkl > 0, D = −∞, implying that Γk is a half-space that is located
below the line v1 = dv2.
The optimizer k(r,w) is nondecreasing in any direction of Γk. When Γk has a nonempty
interior, it is possible to change coordinates in the parameter space by using two indepen-
dent basis vectors in Γk. As pointed out earlier, this coordinate change is global, since Γk
is independent of the particular values chosen for r and w. Similarly, l(r,w) is nondecreas-
ing in any direction located in the cone Γl based at the origin and containing the negative
imaginary line {0} × R−. Having constructed these two cones we can now address the
more challenging question, is it possible to find directions in which both k and l increase?
The answer depends on V = Γk ∩ Γl. If V is empty, we cannot construct any direction
that jointly increases k and l. If V is nonempty, then it is also a convex cone, whose
elements are directions of joint increase. The intersection V being empty does not prove
the nonexistence of directions of joint increase. It just means that we do not have enough
information on the optimizers to produce such directions. As our information gets richer,
the set R becomes narrower, which implies that the cones Γk and Γl become wider. When
one has enough information, the cones are wide enough to intersect, yielding the desired
29Figure 4: Neoclassical Production: Monotonicity of k(r,w) on Γk ∩ Γl.
directions of joint increase (cf. Figure 4).32
When V is nonempty, the vector field can be
chosen constant: v(r,w) = v for some v ∈ V. In that case, any straight line P orthogonal
to v satisfies Assumption 6: it is transverse and is hit exactly once by all trajectories.
The reparameterization is then simple: take any vector e2 on that line and let e1 = v.
Then, (e1,e2) is an orthogonal basis of R2
, such that if one expresses t = (r,w) on that
basis (that is, (r,w) = s1e1 + s2e2), then (k(s),l(s)) is nondecreasing in s1.
## 5.3 Giffen Goods
In an economy with two goods, an agent wishes to maximize her increasing and concave
utility by solving
max
(x,y)∈R2
+
u(x,y),
subject to
px + qy ≤ w,
32
The analysis for obtaining directions of joint decrease is naturally analogous, by considering opposite
directions. Similarly, it is possible to obtain directions of increase in one parameter and decrease in the
other.
30where x,y are the quantities of the two goods, p,q are their respective positive prices,
and w represents the agent’s wealth. Without loss of generality we select the second good
to be the numéraire and correspondingly set q = 1. In addition, since both goods are
desirable, the agent’s budget constraint is binding. As pointed out in Section 3.5 the
agent’s problem can then be restated in the form
max
x∈[0,w/p]
u(x,w − px).
In this formulation the problem has one decision variable and two parameters.33
If u is
smooth, compactness insures the existence of an optimizer. We assume that for our start-
ing values of w and p, the optimizer x(w,p) is unique, located in (0, w
p
), and that u(·,w,p)
is locally strictly concave at x(w,p) and everywhere twice continuously differentiable.
This implies that Assumptions 1–3 are satisfied. The first good is “normal” if x(w,p) is
nonincreasing in p, and Giffen or “inferior” if this monotonicity is sometimes violated.34
Similarly, one would usually expect the consumption of any good to increase with the
agent’s wealth. However, this monotonicity is also sometimes violated. The question
then becomes, under what conditions is a good normal, and how are price and wealth
effects connected? The Hessian and cross-derivative matrices are
H = uxx − 2puxy + p2
uyy and K =
h
uxy − puyy −xuxy + pxuyy − uy
i
.
The pseudo-gradient W is therefore given by
W(x,w,p) =
1
D
h
α(x,w,p) −xα − uy(x,w − xp)
i
,
where D = −H > 0 (by strict concavity of H at the optimizer) and α(x,w,p) = uxy−puyy.
We also note that since ϕ(x) = x, Assumption 4 is trivially satisfied. In order to meet
Assumption 5, we are thus looking for a vector v ∈ R2
such that
α(x,w,p)v1 − (xα(x,w,p) + uy)v2 ≥ 0 (28)
for all x in the reduced feasible set R(w,p). First, we observe that if u is supermodular
and concave in its second variable, α is nonnegative, which implies, along with the non-
negativity of uy, that any vector v in R+ × R− solves (28). This means that if the two
33
As mentioned earlier, we have therefore converted the initial problem with two decision variables on
a one-dimensional manifold of R2
with empty interior but nonempty relative interior, into a problem with
one decision variable on a set with nonempty interior.
34
Classic examples include potatoes or bread. The gist of the argument goes as follows: when the
price for bread increases, poorer people cannot afford buying “luxury goods” such as meat, and end
up consuming more bread, which is still the cheapest good. Other goods violating this monotonicity
are Veblen goods (Veblen, 1899) or positional goods (Hirsch, 1976, Chapter 3) which are such that the
implied status of the owner increases with their price.
31goods are complements and if the utility function is concave in the second good, the first
good is normal.35
In the general case, we show that there is a hierarchical relationship
between wealth and price effects. Increasing wealth amounts to setting v1 > 0 and v2 = 0,
so that the good is normal with respect to the wealth effect if and only if α ≥ 0. On
the other hand, α ≥ 0 implies xα + uy ≥ 0. Since decreasing the price amounts to
setting v2 > 0 and v1 = 0, the good is therefore normal with respect to the price effect
if α ≥ 0. This shows that the following result holds for any smooth, nondecreasing utility
function: if an augmentation in wealth increases the optimal consumption of a good, then
a cut in its price also increases its optimal consumption. The reverse is, in general, not
true.36
If the optimal consumption x(w,p) is known or constrained to belong to some
subinterval J = (x1,x2) ⊂ (0,w/p),37
the analysis can be refined. For example, suppose
that minx∈J {α(x,w,p)} ≥ 0 for all w,p. Then the good is normal with respect to both
wealth and price effects (any v ∈ R+ ×R− solves (28)). If α sometimes takes negative val-
ues but minx∈J {xα(x,w,p) + uy(x,w − px)} ≥ 0, then the good is normal with respect
to price effect (v ∈ {0} × R− solves (28)). More generally, suppose that α(·,w,p) only
changes sign once on (x1,x2) and α(x1,w,p) > 0 for all w,p in an open neighborhood of
initial values of wealth and price. The second condition means that the good is normal for
low consumption, while the first condition means that the good becomes Giffen for high
consumption values. Then, if the vectors (α(x1,w,p),−x1α(x1,w,p) + uy(x1,w − px1))
and (α(x2,w,p),−x2α(x2,w,p) + uy(x2,w − px2)) are in the same half-plane, there ex-
ists a normal vector v(w,p) of the half-space whose scalar product with W(x,w,p) is
nonnegative for all x ∈ (x1,x2). The situation is represented in Figure 5.
We note that it is easy to verify that v(w,p) can always be taken in the negative or-
thant R2
−. Therefore we have the following result: if the pseudo-gradients of consumption
boundaries x1,x2 lie in the same half-plane, and the good behaves as a normal good for low
consumption values and as a Giffen one for high consumption values (such as potatoes,
cf. footnote 34), then there exists a way to increase its optimal consumption by reducing
both wealth and price at the same time. It can also be shown that in the same situation,
there is no way to increase consumption by raising both wealth and price at the same
time.
35
This result can also be shown by observing that the concavity of u in y implies the supermodularity
of v in (x,w,−p).
36
The result can be read in the opposite direction: if a good is inferior with respect to price effect, it
is also inferior for wealth effect.
37
For example, minimal consumption could be imposed or supply could be limited.
32Figure 5: Giffen Goods: Solving the MCS Problem for x(w,p).
## 5.4 Multiattribute Screening
A variation of our method can be used in the context of screening with multiple in-
struments. A firm faces customers of different types, distributed on an interval X ⊂ R
according to a positive density function g. The firm sells products whose attributes are
described by a vector t ∈ T ⊂ Rm
. The goal of the firm is to propose a product line Γ ⊂ T
and a price schedule P : Γ → R+ (with 0 ∈ Γ and P(0) = 0) that maximizes its expected
profit
π(P,Γ) =
Z
X
[P(t(x)) − C(t(x))]g(x)dx,
where C(t(x)) is the cost of producing t(x) ∈ Γ and t(x) solves the type-x consumer’s
utility maximization problem
t(x) ∈ argmax
t∈Γ
{u(x,t) − P(t)}.
This general screening problem has only been solved in particular cases (cf. Roberts (1979),
Mirman and Sibley (1980), and Matthews and Moore (1987) for the multiattribute, one-
dimensional type case, and Rochet and Stole (2003) for a recent account of the general
multidimensional screening literature). When m = 1 (only one instrument available), it
is possible to directly compute the optimal price schedule P(x) under some additional su-
permodularity assumptions on the primitives of the problem. Assuming that u is smooth,
33we can define
µ(x,t) = u(x,t) − ux(x,t)
1 − G(x)
g(x)
,
where G is the probability distribution of the density g. Mussa and Rosen (1978) have
shown, based on a technique developed by Mirrlees (1971), that if u and µ are twice
differentiable and supermodular (i.e., uxt ≥ 0 and µxt ≥ 0 on X × T ), then it is possible
to construct the optimal price schedule. Moreover, this optimal schedule leads to “perfect”
screening (without bunching): each consumer of type x will buy a distinct product t(x).
Suppose now that there are m ≥ 2 product attributes available. Our method can be
extended to build product lines that will perfectly screen consumers. Defining the pseudo-
gradient W as the (2 × m)−matrix
W(x,t) =
"
∇T
x ut(x,t)
∇T
x µt(x,t)
#
,
suppose that there exists for all t ∈ T a nonzero vector v(t) such that
W(x,t)v(t) ≥ 0
for all x ∈ X (i.e., Assumption 5 is satisfied). We can then define Γ ⊂ T to be the image
of any smooth trajectory γ : (0,1) → T generated by the vector field v. This leads to a
reparameterization of the utility u and the function µ when restricted to X × Γ (that is,
when customers are offered the product line Γ). Specifically, we define ũ and µ̃ on X×(0,1)
by ũ(x,λ) = u(x,γ(λ)) and µ̃(x,λ) = µ(x,γ(λ)). Using Lemma 1 and Theorem 1, we can
show that ũ and µ̃ are supermodular on X ×(0,1). The aforementioned result then implies
that it is possible to find the optimal price schedule on Γ, and that this schedule perfectly
screens customers. This approach does not solve the original problem of maximizing the
profit on T , since we artificially restricted ourselves to the product line Γ. However, the
method can be repeated for several distinct trajectories, and leads to a perfectly screening
price schedule that maximizes the expected profit not only on a particular product line,
but on a large class of product lines that spans the whole multiattribute space T .
## 6 Discussion
In the available literature on monotone comparative statics, the parameterization of the
optimization problem is essentially taken as given.38
The presently known criteria for
38
Note that the decision variables are also typically taken as given. Our method in principle allows for
a change of the decision variables to obtain monotone comparative statics through an appropriate choice
of the evaluation function ϕ.
34the monotonicity of solutions hold, therefore, only with respect to the particular prob-
lem formulation given at the outset. Milgrom and Shannon’s (1994) charactererization
of the monotonicity of solutions to (1) on lattices requires the objective function f to
be quasi-supermodular in x and to satisfy a single-crossing property in (x,t).39
The
supermodularity requirement on the objective function can thereby be interpreted in
terms of “complementarity” of decision variables, a concept that dates back at least to
Edgeworth (1897) and whose origins are reviewed by Samuelson (1974). Milgrom and
Roberts (1990) demonstrate the power of complementarities and associated supermod-
ularity properties in interpreting decision changes as monotone responses to exogenous
shifts of economic conditions. Even though equilibria cannot be located exactly, comple-
mentarities allow one to make precise statements about the direction in which optimal
decisions change as a consequence of parameter changes. In the absence of such comple-
mentarities the presently available theory unfortunately guarantees the nonmonotonicity
of solutions, even though this nonmonotonicity might just be a symptom of an unsuitable
parameterization of the problem. In this paper, we provide a way to obtain an equivalent
formulation of the optimization problem (1) using an MCS reparameterization, such that
– provided sufficient knowledge about the location of the solution – monotone comparative
statics may be obtained. Finding an MCS parameterization of the problem amounts to
creating a set of economic indicators which allow for monotonic decision making and thus
easy rules of thumb (i.e., when the relevant indicator goes up, the optimal decision goes
up, too). This seems especially useful in situations where the same optimization problem
needs to be solved repeatedly for different parameter values. Let us briefly mention at
this point that our method naturally extends to equilibrium problems (cf. also Milgrom
and Roberts (1994)) specified by a relation
F(x,t) = 0,
where F : X × T → Rn
is a continuously differentiable function, as can be seen by
associating ∇xf with F, so that H = ∇xF and K = ∇tF. With these substitutions in
place, all of our results hold essentially without any change. We also remind the reader
that, as pointed out in Section 3.5, even though we require through Assumption 2 the
existence of a unique interior global optimum, parameter-dependent constraints can be
accommodated in a straightforward way by shifting the analysis to a submanifold in X
or augmenting the space of decision variables by the Lagrange multipliers corresponding
to the binding constraints.
39
Athey (2002) applies these results to expected-utility maximization problems under uncertainty and
finds necessary and sufficient conditions on the model primitives in that context.
35Sometimes our method may also be useful for reducing the number of parameters
without any losses. To show this, let us note first that clearly an “ideal” parameterization
of the problem (1) for m ≥ n associates exactly one parameter ti with each component
of the decision variable xi and is such that xi remains unchanged in response to a change
of parameter tj (with j 6= i). If the location of the optimal solution is perfectly known, a
reparameterization with these “ideal” properties can always be obtained by setting si =
xi(ti) for i ∈ {1,...,n} and simply discarding all other m − n parameters tn+1,...,tm.
Unfortunately it is usually the lack of knowledge about the location of the optimizer (up to
a monotone transformation) that makes this trivial solution impracticable. Nevertheless,
it may sometimes be possible to reduce the number of parameters by finding directions v(t)
for which hW(x,t),v(t)i = 0 for all x in an admissible reduced feasible set R(t). If such a
direction can be found, the solution does not depend on λ in the associated global MCS
reparameterization and λ may thus be discarded from the set of new parameters. By
repeating this process it may be possible to eliminate further parameters.
The tradeoff between the decision maker’s knowledge about the location of the op-
timal action and her ability to find directions that guarantee monotone behavior of the
optimizer (i.e., to solve the (local) MCS problem) is related to “partially specified prob-
lems” discussed by Milgrom (1994). One type of partially specified optimization problems
possesses an objective function of the form f(x,t) = g(x,t) + δ(x), where δ is any affine
mapping from X ⊂ R to R. Monotonicity of optimal solutions xδ(t) to the problem (1) for
any affine δ is then equivalent to the (otherwise unknown) function g being supermodular
on X × T . The key idea in this approach is that the class of perturbations δ is large
enough relative to g and X to allow for any location of the optimizer in X. A variation of
our method bypasses this definitive result when the function g fails to be supermodular:
it might be possible to transform the parameter space so as to “supermodularize” the
function g. If g(x,t) is not supermodular in (x,t), we can build trajectories γ : (0,1) → T
in the parameter space, such that g(x,γ(λ)) is supermodular in (x,λ). We have also used
this approach in Section 5.4 and Corollary 2. While supermodularization of functions is
just a particular application of our method, its repeated use in this paper suggests its po-
tential benefits in numerous other settings, such as for supermodularizing noncooperative
games for instance.
Further research could proceed to relax some of the differentiable structure imposed
to obtain our results. Systematic MCS reparameterizations can be expected to naturally
generalize to an analysis on lattices. The problem is to find a rule on W ⊂ T × T
such that (t,t0
) ∈ W implies φ(x(t0
)) ≥ φ(x(t)). In particular, suppose that we can build
36trajectories {Ti} in T such that (x,t) 7→ f(x,t) has the single-crossing property40
on X×Ti
for all i ∈ I. If f is in addition (quasi-)supermodular in x, standard results as in Milgrom
and Shannon (1994) apply, showing that x(t) is nondecreasing along the trajectories. The
problem is of course to construct such trajectories. Our method for doing so is based
on differential calculus, but there may be other ways to build trajectories, or at least
find rules in the parameter space, to achieve monotone comparative statics (e.g., through
discretization of our results).
References
[1] Arnold, V.I. (1973) Ordinary Differential Equations, MIT Press, Cambridge, MA.
[2] Athey, S. (2002) “Monotone Comparative Statics Under Uncertainty,” Quarterly
Journal of Economics, Vol. 117, No. 1, pp. 187–223.
[3] Baumol, W.J., Quandt, R.E. (1964) “Rules of Thumb and Optimally Imperfect
Decisions,” American Economic Review, Vol. 54, No. 2, pp. 23–46.
[4] Berge, C. (1963) Topological Spaces, Oliver and Boyd, Edinburgh, UK. Reprinted
by Dover Publications, Mineola, NY, in 1997.
[5] Bertsekas, D.P. (1995) Nonlinear Programming, Athena Scientific, Belmont, MA.
[6] Edgeworth, F.Y. (1897) “The Pure Theory of Monopoly.” Reprinted in: Edge-
worth, F.Y. (1925) Papers Relating to Political Economy, Macmillan, London, UK.
[7] Granot, F., Veinott, A.F. (1985) “Substitutes, Complements and Ripples in
Network Flows,” Mathematics of Operations Research, Vol. 10, No. 3, pp. 471–497.
[8] Hirsch, F. (1976) Social Limits to Growth, Harvard University Press, Cambridge,
MA.
[9] Kakutani, S. (1941) “A Generalization of Brouwer’s Fixed Point Theorem,” Duke
Mathematical Journal, Vol. 8, pp. 457–459.
[10] Khalil, H.K. (1992) Nonlinear Systems, Macmillan, New York, NY.
[11] Lee, J.M. (2003) Introduction to Smooth Manifolds, Springer, New York, NY.
40
Any trajectory is totally ordered, with the order implied by the parametric description of the curve.
37[12] Matthews, S., Moore, J. (1987) “Monopoly Provision of Quality and Warranties:
An Exploration of the Theory of Multidimensional Screening,” Econometrica, Vol. 55,
No. 2, pp. 441–467.
[13] Milgrom, P. (1994) “Comparing Optima: Do Simplifying Assumptions Affect Con-
clusions?”, Journal of Political Economy, Vol. 102, No. 3, pp. 607–615.
[14] Milgrom, P., Roberts, J. (1990) “The Economics of Modern Manufacturing:
Technology, Strategy, and Organization,” American Economic Review, Vol. 80, No. 3,
pp. 511–528.
[15] Milgrom, P., Roberts, J. (1994) “Comparing Equilibria,” American Economic
Review, Vol. 84, No. 3, pp. 441–459.
[16] Milgrom, P., Shannon, C. (1994) “Monotone Comparative Statics,” Economet-
rica, Vol. 62, No. 1, pp. 157–180.
[17] Mirman, L.J., Sibley, D.S. (1980) “Optimal Nonlinear Prices for Multiproduct
Monopolies,” Bell Journal of Economics, Vol. 11, No. 2, pp. 659–670.
[18] Mirrlees, J.A. (1971) “An Exploration in the Theory of Optimal Income Taxa-
tion,” Review of Economic Studies, Vol. 38, No. 2, pp. 175–208.
[19] Mussa, M., Rosen, S. (1978) “Monopoly and Product Quality,” Journal of Eco-
nomic Theory, Vol. 18, No. 2, pp. 301–317.
[20] Roberts, K.W.S. (1979) “Welfare Considerations of Nonlinear Pricing,” Economic
Journal, Vol 89, No. 353, pp. 66–83.
[21] Rochet, J.-C., Stole, L.A. (2003) “The Economics of Multidimensional Screen-
ing,” in: Dewatripont, M., Hansen, L.-P., Turnovsky, S.J. (Eds.), Advances in Eco-
nomics and Econometrics: Theory and Applications: Eighth World Congress, Vol. I,
Cambridge University Press, New York, NY, pp. 150–197.
[22] Samuelson, P.A. (1941) “The Stability of Equilibrium: Comparative Statics and
Dynamics,” Econometrica, Vol. 9, No. 2, pp. 97–120.
[23] Samuelson, P.A. (1974) “Complementarity: An Essay on the 40th Anniversary
of the Hicks-Allen Revolution in Demand Theory,” Journal of Economic Literature,
Vol. 12, No. 4, pp. 1255–1289.
38[24] Topkis, D.M. (1968) Ordered Optimal Solutions, Doctoral Dissertation, Stanford
University, Stanford, CA.
[25] Topkis, D.M. (1998) Supermodularity and Complementarity, Princeton University
Press, Princeton, NJ.
[26] Veblen, T. (1899) The Theory of the Leisure Class. Reprinted by Penguin Books,
New York, NY, in 1994.
[27] Zorich, V.A. (2004) Mathematical Analysis, Volume I+II, Springer, New York,
NY.
39