---
sha256: 785705146c280834f458e5dca243eff059c33661be9dc53cb9f74f47d1616e1a
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 253837
---
arXiv:2212.03598v1 [math.CO] 7 Dec 2022
Discrete Convex Analysis:
A Tool for Economics and Game Theory*
Kazuo Murota†
October 2016 / December 2022
Abstract
This paper presents discrete convex analysis as a tool for economics and game theory.
Discrete convex analysis is a new framework of discrete mathematics and optimization,
developed during the last two decades. Recently, it is being recognized as a powerful
tool for analyzing economic or game models with indivisibilities. The main feature of
discrete convex analysis is the distinction of two convexity concepts, M-convexity and
L-convexity, for functions in integer or binary variables, together with their conjugacy
relationship. The crucial fact is that M-concavity, or its variant called M♮-concavity, is
equivalent to the (gross) substitutes property in economics. Fundamental theorems in
discrete convex analysis such as the M-L conjugacy theorems, discrete separation theo-
rems and discrete fixed point theorems yield structural results in economics such as the
existence of equilibria and the lattice structure of equilibrium price vectors. Algorithms
in discrete convex analysis give iterative auction algorithms as well as computational
methods for equilibria.
## 1 Introduction
Convex analysis and fixed point theorems have played a crucial role in economic and game-
theoretic analysis, for instance, to prove the existence of competitive equilibrium and Nash
equilibrium; see Debreu (1959), Arrow and Hahn (1971), and Fudenberg and Tirole (1991).
Traditionally, in such studies, it is assumed that commodities are perfectly divisible, or mixed
strategies can be used, or the space of strategies is continuous. However, this traditional ap-
proach cannot be equally applied to economic models which involve significant indivisibili-
ties or to game-theoretic models where the space of strategies is discrete and mixed strategies
do not make much sense. In this paper we will present a new approach based on discrete
convex analysis and discrete fixed point theorems, which have been recently developed in
the field of discrete mathematics and optimization and become a powerful tool for analyzing
economic or game models with indivisibilities.
Discrete convex analysis (Murota 1998, 2003) is a general theoretical framework con-
structed through a combination of convex analysis and combinatorial mathematics. The
* This is a revised version of the paper with the same title published in Journal of Mechanism and Institution
Design1(2016),151–273. Therevisionconsistsofcorrectionsindefinitions(11.6)and(11.7)aswell asupdates
of bibliographic information.
†
The Institute of Statistical Mathematics, and Tokyo Metropolitan University, e-mail: murota@tmu.ac.jp.
1framework of convex analysis is adapted to discrete settings and the mathematical results
in matroid/submodular function theory are generalized1
. The theory extends the direction
set forth in discrete optimization around 1980 by Edmonds (1970), Frank (1982), Fujishige
(1984), and Lovász (1983); see also Fujishige (2005). The main feature of discrete con-
vex analysis is the distinction of two convexity concepts for functions in integer or binary
variables, M-convexity and L-convexity2
, together with their conjugacy relationship with re-
spect to the (continuous or discrete) Legendre–Fenchel transformation. Roughly speaking,
M-convexity is defined in terms of an exchange property and L-convexity by submodularity.
The interaction between discrete convex analysis and mathematical economics was ini-
tiated by Danilov, Koshevoy, and Murota (1998, 2001) for the Walrasian equilibrium of in-
divisible markets (see also Chapter 11 of Murota 2003). The next stage of the interaction
was brought about by the crucial observation of Fujishige and Yang (2003) that M-concavity,
or its variant called M♮
-concavity3
, is equivalent to the gross substitutability (GS) of Kelso
and Crawford (1982). The survey papers by Murota and Tamura (2003b) and Tamura (2004)
describe the interaction at the earlier stages.
Concepts, theorems, and algorithms in discrete convex analysis have turned out to be
useful in modeling and analysis of economic problems. The M-L conjugacy corresponds to
the conjugacy between commodity bundles and price vectors in economics. The conjugacy
theorem in discrete convex analysis implies, for example, that a valuation (utility) function
has substitutes property (M♮
-concavity) if and only if the indirect utility function is an L♮
-
convex function, where L♮
-convexity is a variant of L-convexity.
One of themost successful examples of thediscrete convex analysis approach is Fujishige
and Tamura’s model (Fujishige and Tamura 2006, 2007) of two-sided matching, which uni-
fies the stable matching of Gale and Shapley (1962) and the assignment model of Shap-
ley and Shubik (1972). The existence of a market equilibrium is established by revealing a
novelduality-relatedpropertyofM♮
-concavefunctions. Tamura’smonograph(Tamura2009),
though in Japanese, gives a comprehensive account of this model.
Another significant instance of the discrete convex analysis approach is the design and
analysis of auction algorithms. Based on the Lyapunov function approach of Ausubel (2006),
Murota, Shioura, and Yang (2013a, 2016) shed a new light on a variety of iterative auc-
tions by making full use of the M-L conjugacy theorem and L♮
-convex function minimization
algorithms. The lattice structure of equilibrium price vectors is obtained as an immediate
consequence of the L♮
-convexity of the Lyapunov function.
The contents of this paper are as follows:
Section 1: Introduction
Section 2: Notation
Section 3: M♮
-concave set function
Section 4: M♮
-concave function on Zn
Section 5: M♮
-concave function on Rn
Section 6: Operations for M♮
-concave functions
Section 7: Conjugacy and L♮
-convexity
1
The readers who are interested in general backgrounds are referred to Rockafellar (1970) for convex anal-
ysis, Schrijver (1986) for linear and integer programming, Korte and Vygen (2012) and Schrijver (2003) for
combinatorial optimization, Oxley (2011) for matroid theory, and Fujishige (2005) and Topkis (1998) for sub-
modular function theory.
2
“M” stands for “Matroid” and “L” for “Lattice.”
3
“M♮
” and “L♮
” are read “em natural” and “ell natural,” respectively.
2Section 8: Iterative auctions
Section 9: Intersection and separation theorems
Section 10: Stable marriage and assignment game
Section 11: Valuated assignment problem
Section 12: Submodular flow problem
Section 13: Discrete fixed point theorem
Section 14: Other topics
Following the introduction of notations in Section 2, Sections 3 to 5 present the defi-
nition of M♮
-concave functions and the characterizations of (or equivalent conditions for)
M♮
-concavity in terms of demand functions and choice functions. Section 6 shows the op-
erations valid for M♮
-concave functions, including convolution operation used for the aggre-
gation of utility functions. Section 7 introduces L♮
-convexity as the conjugate concept of
M♮
-concavity, and Section 8 presents the application to iterative auctions. Section 9 deals
with duality theorems of fundamental importance, including the discrete separation theorems
and the Fenchel-type minimax relations. Section 10 is a succinct description of Fujishige and
Tamura’s model. Combinations of M♮
-concave functions with graph/network structures are
considered in Sections 11 and 12. Section 13 explains the basic idea underlying the discrete
fixed point theorems. Finally in Section 14, some topics not covered in the main body of the
paper are touched upon briefly.
Beside economics and game theory, discrete convex analysis has found applications in
many different areas, including systems analysis (Murota 2000) in engineering, and resource
allocation (Katoh et al. 2013) and inventory theory (Simchi-Levi et al. 2014) in operations
research. The survey paper (Murota 2009) describes other applications including those to
finite metric spaces and eigenvalues of Hermitian matrices.
## 2 Notation
Basic notations are listed here.
• The set of all real numbers is denoted by R, and the sets of nonnegative reals and posi-
tive reals are denoted, respectively, by R+ and R++. The set of all integers is denoted by
Z, and the sets of nonnegative integers and positive integers are denoted, respectively,
by Z+ and Z++.
• We consistently assume N = {1,2,...,n} for a positive integer n. Then 2N
denotes the
set of all subsets of N, i.e., the power set of N.
• The characteristic vector of a subset A ⊆ N = {1,2,...,n} is denoted by χA ∈ {0,1}n
.
That is,
(χA)i =
(
1 (i ∈ A),
0 (i ∈ N \ A).
(2.1)
For i ∈ {1,2,...,n}, we write χi for χ{i}, which is the ith unit vector. We define χ0 = 0
where 0 = (0,0,...,0). We also define 1 = (1,1,...,1).
• For a vector x = (x1, x2,..., xn) and a subset A ⊆ {1,2,...,n}, x(A) denotes the com-
ponent sum within A, i.e., x(A) =
P
i∈A xi.
3• For two vectors x = (x1, x2,..., xn) and y = (y1,y2,...,yn), x ≤ y means the componen-
twise inequality. That is, x ≤ y is true if and only if xi ≤ yi is true for all i = 1,2,...,n.
• For two integer vectors a and b in Zn
with a ≤ b, [a,b]Z denotes the integer interval
between a and b (inclusive), i.e., [a,b]Z = {x ∈ Zn
| a ≤ x ≤ b}.
• For two vectors x and y, x∨y and x∧y denote the vectors of componentwise maximum
and minimum. That is, (x ∨ y)i = max(xi,yi) and (x ∧ y)i = min(xi,yi) for i = 1,...,n.
• Forareal numberz ∈ R, ⌈z⌉denotesthesmallestintegernotsmallerthanz(rounding-up
to the nearest integer) and ⌊z⌋ the largest integer not larger than z (rounding-downto the
nearest integer). This operation is extended to a vector by componentwise application.
• For a vector x, supp+
(x) = {i | xi > 0} and supp−
(x) = {i | xi < 0} denote the positive
and negative supports of x, respectively.
• The ℓ∞-norm of a vector x is denoted as kxk∞, i.e., kxk∞ = max(|x1|,|x2|,...,|xn|).
Variants are: kxk+
∞ = max(0, x1, x2,..., xn) and kxk−
∞ = max(0,−x1,−x2,...,−xn).
• For two vectors p = (p1, p2,..., pn) and x = (x1, x2,..., xn), their inner product is
denoted by hp, xi, i.e., hp, xi = p⊤
x =
Pn
i=1 pixi, where p⊤
is the transpose of p viewed
as a column vector.
• For a function f : Rn
→ R ∪ {+∞} or f : Rn
→ R ∪ {−∞},
dom f = {x | −∞ < f(x) < +∞},
argmin f = {x | f(x) ≤ f(y) for all y},
argmax f = {x | f(x) ≥ f(y) for all y}.
These notations are used also for f : Zn
→ R ∪ {+∞} or f : Zn
→ R ∪ {−∞}. We
sometimes use domR f and domZ f to emphasize that dom f ⊆ Rn
and dom f ⊆ Zn
.
• For a set function f : 2N
→ R ∪ {+∞} or f : 2N
→ R ∪ {−∞},
dom f = {X ⊆ N | −∞ < f(X) < +∞},
argmin f = {X ⊆ N | f(X) ≤ f(Y) for all Y ⊆ N },
argmax f = {X ⊆ N | f(X) ≥ f(Y) for all Y ⊆ N }.
• For a function f and a vector p, f[−p] means the function defined by
f[−p](x) = f(x) − p⊤
x = f(x) − hp, xi.
If f is a set function, f[−p] is the set function defined by f[−p](X) = f(X) − p(X).
• For a function f, four variants of the conjugate function of f are denoted as
f•
(p) = sup{hp, xi − f(x)}, f◦
(p) = inf{hp, xi − f(x)},
f▽
(p) = sup{f(x) − hp, xi}, f△
(p) = inf{f(x) + hp, xi}.
• The convex closure of a function f is denoted by f. The convex hull of a set S is
denoted by S.
4• D(p; f) denotes the demand correspondence for a price vector p and a valuation func-
tion f, defined in (3.16) and (4.21).
• C(·) denotes a choice function. C(·; f) denotes the choice function determined by a
valuation function f, defined in (3.17) and (4.23).
• tw(·) denotes the twisting of a set or a vector, defined in (3.18) and (4.25), respectively.
• For an arc a in a directed graph, ∂+
a denotes the initial (tail) vertex of a, and ∂−
a the
terminal (head) vertex of a. That is, ∂+
a = u and ∂−
a = v if a = (u,v).
• For a flow ξ in a network, ∂ξ denotes the boundary vector on the vertex set, defined in
(4.36). For a matching M, ∂M denotes the set of the vertices incident to some edge in
M.
• For a potential p defined on the vertex set of a network, δp denotes the coboundary of
p, the vector on the arc set defined in (12.20).
3 M♮
-concave Set Function
First we introduce M♮
-concavity for set functions. Let N be a finite set, say, N = {1,2,...,n},
F be a nonempty family of subsets of N, and f : F → R be a real-valued function on F. In
economic applications, we may think of f as a single-unit valuation (binary valuation) over
combinations of indivisible commodities N, where F represents the set of feasible combina-
tions.
## 3.1 Exchange property
Let F be a nonempty family of subsets of a finite set N = {1,2,...,n}. We say that a function
f : F → R is M♮
-concave, if, for any X,Y ∈ F and i ∈ X\Y, we have (i) X−i ∈ F, Y +i ∈ F
and
f(X) + f(Y) ≤ f(X − i) + f(Y + i), (3.1)
or (ii) there exists some j ∈ Y \ X such that X − i + j ∈ F, Y + i − j ∈ F and
f(X) + f(Y) ≤ f(X − i + j) + f(Y + i − j). (3.2)
Here we use short-hand notations X − i = X \ {i}, Y + i = Y ∪ {i}, X − i + j = (X \ {i}) ∪ {j},
and Y + i − j = (Y ∪ {i}) \ {j}. This property is referred to as the exchange property.
A more compact way of defining M♮
-concavity, free from explicit reference to the domain
F, is todefineafunction f : 2N
→ R∪{−∞} tobeM♮
-concaveifithasthefollowingproperty:
(M♮
-EXC) For any X,Y ⊆ N and i ∈ X \ Y, we have
f(X) + f(Y) ≤ max f(X − i) + f(Y + i), max
j∈Y\X
{f(X − i + j) + f(Y + i − j)}
!
, (3.3)
where (−∞) + a = a + (−∞) = (−∞) + (−∞) = −∞ for a ∈ R, −∞ ≤ −∞, and a maximum
taken over an empty set is defined to be −∞. The family of subsets X for which f(X) is finite
is called the effective domain of f, and denoted as dom f, i.e., dom f = {X | f(X) > −∞}.
5When f is regarded as a function on F = dom f, it is an M♮
-concave function in the original
sense.
As a (seemingly) stronger condition than (M♮
-EXC) we may also conceive the multiple
exchange property:
(M♮
-EXCm) For any X,Y ⊆ N and I ⊆ X \ Y, there exists J ⊆ Y \ X such that f(X) + f(Y) ≤
f((X \ I) ∪ J) + f((Y \ J) ∪ I), i.e.,
f(X) + f(Y) ≤ max
J⊆Y\X
{f((X \ I) ∪ J) + f((Y \ J) ∪ I)}. (3.4)
Recently it has been shown (Murota 2018) that (M♮
-EXCm) is equivalent to (M♮
-EXC).
Theorem 3.1. A function f : 2N
→ R∪{−∞} satisfies (M♮
-EXC) if and onlyif it satisfies (M♮
-
EXCm). Hence, every M♮
-concave function has the multiple exchange property (M♮
-EXCm).
Remark 3.1. The multiple exchange property (M♮
-EXCm) here is the same as the “strong
no complementarities property (SNC)” introduced by Gul and Stacchetti (1999), where it is
shown that (SNC) implies the gross substitutes property (GS). On the other hand, (GS) is
known (Fujishige and Yang 2003) to be equivalent to (M♮
-EXC) (see Theorem 3.7). There-
fore, Theorem 3.1 above reveals that (SNC) is equivalent to (GS). This settles the question
since 1999: Is (SNC) strictly stronger than (GS) or not? We now know that (SNC) is equiva-
lent to (GS). See Murota (2018) for details.
It follows from the definition of an M♮
-concave function that the (effective) domain F of
an M♮
-concave function has the following exchange property:
(B♮
-EXC) For any X,Y ∈ F and i ∈ X \ Y, we have (i) X − i ∈ F, Y + i ∈ F or
(ii) there exists some j ∈ Y \ X such that X − i + j ∈ F, Y + i − j ∈ F.
This means that F forms a matroid-like structure4
, called a generalized matroid (g-matroid),
or an M♮
-convex family5
. An M♮
-convex family F containing the empty set forms the family
of independent sets of a matroid. For example, for integers a,b with 0 ≤ a ≤ b ≤ n,
Fab = {X | a ≤ |X| ≤ b} is an M♮
-convex family, and F0b (with a = 0) forms the family of
independent sets of a matroid.
Remark 3.2. It followsfrom Theorem 3.1 that a nonemptyfamily F ⊆ 2N
satisfies (B♮
-EXC)
if and only if it satisfies the multiple exchange axiom:
(B♮
-EXCm) For any X,Y ∈ F and I ⊆ X \Y, there exists J ⊆ Y \ X such that (X \ I)∪ J ∈ F
and (Y \ J) ∪ I ∈ F.
M♮
-concavity can be characterized by a local exchange property under the assumption
that function f is (effectively) defined on an M♮
-convex family of sets (Murota 1996c, 2003;
Murotaand Shioura1999). The conditions(3.5)–(3.7)below are “local” in the sense that they
require the exchangeability of the form of (3.3) only for (X,Y) with max(|X \ Y|,|Y \ X|) ≤ 2.
4
See, e.g., Murota (2000a), Oxley (2011), and Schrijver (2003) for matroids.
5
A subset of N can be identified with a 0-1 vector (characteristic vector in (2.1)), and accordingly, a family
of subsets can be identified with a set of 0-1 vectors. We call a family of subsets an M♮
-convex family if the
corresponding set of 0-1 vectors is an M♮
-convex set as a subset of ZN
.
6Theorem 3.2. A set function f : 2N
→ R ∪ {−∞} is M♮
-concave if and only if dom f is an
M♮
-convex family and the following three conditions hold:
f(X + i + j) + f(X) ≤ f(X + i) + f(X + j) (∀X ⊆ N, ∀i, j ∈ N \ X, i , j), (3.5)
f(X + i + j) + f(X + k) ≤ max

f(X + i + k) + f(X + j), f(X + j + k) + f(X + i)

(∀X ⊆ N, ∀i, j,k(distinct) ∈ N \ X), (3.6)
f(X + i + j) + f(X + k + l) ≤ max

f(X + i + k) + f(X + j + l), f(X + j + k) + f(X + i + l)

(∀X ⊆ N, ∀i, j,k,l(distinct) ∈ N \ X). (3.7)
When the effective domain dom f contains the emptyset, the local exchange condition
for M♮
-concavity takes a simpler form without involving (3.7) (Reijnierse et al. 2002, Müller
2006, Shioura and Tamura 2015).
Theorem 3.3. Let f : 2N
→ R ∪ {−∞} be a set function such that dom f is an M♮
-convex
family containing ∅ (the empty set). Then f is M♮
-concave if and only if (3.5) and (3.6) hold.
It is known (Theorem 6.19 of Murota 2003) that an M♮
-concave function is submodular,
i.e.,
f(X) + f(Y) ≥ f(X ∪ Y) + f(X ∩ Y) (X,Y ⊆ N). (3.8)
More precisely, the condition (3.5) above is equivalent to the submodularity (3.8) as long as
dom f is M♮
-convex (Proposition 6.1 of Shioura and Tamura 2015).
Becauseoftheadditionalcondition(3.6)forM♮
-concavity,noteverysubmodularsetfunc-
tion is M♮
-concave. Thus, M♮
-concave set functions form a proper subclass of submodular
set functions.
Remark 3.3. It follows from (M♮
-EXC) that M♮
-concave set functions enjoy the following
exchangepropertiesundercardinalityconstraints(Lemmas4.3and4.6ofMurotaandShioura
1999):
• For any X,Y ⊆ N with |X| < |Y|,
f(X) + f(Y) ≤ max
j∈Y\X
{f(X + j) + f(Y − j)}. (3.9)
• For any X,Y ⊆ N with |X| = |Y| and i ∈ X \ Y,
f(X) + f(Y) ≤ max
j∈Y\X
{f(X − i + j) + f(Y + i − j)}. (3.10)
The former property, in particular, implies the cardinal-monotonicity of the induced choice
function; see Theorem 3.10 and its proof.
Remark 3.4. For a set family F consisting of equi-cardinal sets (i.e., |X| = |Y| for all X,Y ∈
F) the exchange property (B♮
-EXC) takes a simpler form: For any X,Y ∈ F and i ∈ X \ Y,
there exists some j ∈ Y \ X such that X − i + j ∈ F, Y + i − j ∈ F. This means that F forms
the family of bases of a matroid. An M♮
-concave function defined on matroid bases is called
a valuated matroid (Dress and Wenzel 1990,1992; Chapter 5 of Murota 2000a), or an M-
concave set function (Murota 1996c, 2003). The exchange property for M-concavity reads:
A set function f is M-concave if and only if (3.10) holds for any X,Y ⊆ N and i ∈ X \ Y. A
corollary of Theorem 3.1: Every M-concave function (valuated matroid) f has the multiple
exchange property (M♮
-EXCm) with |J| = |I|. A further corollary of this fact is a classical
result in matroid theory: The base family of a matroid has the multiple exchange property
(B♮
-EXCm) with |J| = |I|; see, e.g., Section 39.9a of Schrijver (2003).
73.2 Maximization and single improvement property
For an M♮
-concave function, the maximality of a function value is characterized by a local
condition (Theorem 6.26 of Murota 2003).
Theorem 3.4. Let f : 2N
→ R∪ {−∞} be an M♮
-concave function and X ∈ dom f. Then X is
a maximizer of f if and only if
f(X) ≥ f(X − i + j) (∀i ∈ X, ∀ j ∈ N \ X), (3.11)
f(X) ≥ f(X − i) (∀i ∈ X), (3.12)
f(X) ≥ f(X + j) (∀ j ∈ N \ X). (3.13)
As a discrete analogue of the subgradient inequality for convex functions, we have the
inequality (3.14) in the following theorem6
.
Theorem 3.5. Let f : 2N
→ R ∪ {−∞} be an M♮
-concave function and X,Y ∈ dom f. Then
f(Y) − f(X) ≤ ˆ f(X,Y), (3.14)
where ˆ f(X,Y) is defined as follows:
• When |X| = |Y|,
ˆ f(X,Y) = max
σ
 X
i∈X\Y
[f(X − i + σ(i)) − f(X)]

,
where the maximum is taken over all one-to-one correspondences σ : X \ Y → Y \ X.
• When |X| < |Y|,
ˆ f(X,Y) = max
σ
 X
i∈X\Y
[f(X − i + σ(i)) − f(X)] +
X
j∈Y\(X∪σ(X))
[f(X + j) − f(X)]

,
where the maximum is taken over all injections σ : X \ Y → Y \ X.
• When |X| > |Y|,
ˆ f(X,Y) = max
τ
 X
j∈Y\X
[f(X − τ(j) + j) − f(X)] +
X
i∈X\(Y∪τ(Y))
[f(X − i) − f(X)]

,
where the maximum is taken over all injections τ : Y \ X → X \ Y.
For a vector p = (pi | i ∈ N) ∈ RN
we use the notation f[−p] to mean the function
f(X) − p(X), where X ⊆ N and p(X) =
P
i∈X pi. That is,
f[−p](X) = f(X) − p(X) (X ⊆ N). (3.15)
Note that f[−p] is M♮
-concave if and only if f is M♮
-concave.
The “if” part of Theorem 3.4, which is the content of the theorem, can be restated as
follows: If X is not a maximizer of f, there exists Y ⊆ N such that |X\Y| ≤ 1, |Y \X| ≤ 1, and
f(X) < f(Y). By considering this property for f[−p] with varying p, we are naturally led to
the single improvement property of Gul and Stacchetti (1999):
(SI) Forany p ∈ RN
, if X isnotamaximizerof f[−p], thereexistsY ⊆ N suchthat|X\Y| ≤ 1,
|Y \ X| ≤ 1, and f[−p](X) < f[−p](Y).
The above argument shows that (SI) is true for M♮
-concave functions. In fact, (SI) is equiva-
lent to M♮
-concavity (Fujishige and Yang 2003).
6
Thisis areformulationofthe“upper-boundlemma”(Lemma5.2.29ofMurota2000a)forvaluatedmatroids
to M♮
-concave functions. See also Proposition 6.25 of Murota (2003).
83.3 Maximizers and gross substitutability
For a vector p = (pi | i ∈ N) ∈ RN
we consider the maximizers of the function f[−p](X) =
f(X) − p(X), where p(X) =
P
i∈X pi for X ⊆ N. We denote the set of these maximizers by
D(p; f) = argmax
X
{f(X) − p(X) | X ⊆ N}. (3.16)
In economic applications, p is a price vector and D(p) = D(p; f) represents the demand
correspondence.
It is one of the most fundamental facts in discrete convex analysis that the M♮
-concavity
of a function is characterized in terms of the M♮
-convexity of its maximizers (Murota 1996c;
Theorem 6.30 of Murota 2003; Murota and Shioura 1999).
Theorem 3.6. A set function f : 2N
→ R∪{−∞} is M♮
-concave if and only if, for every vector
p ∈ RN
, D(p; f) is an M♮
-convex family. That is, f satisfies (M♮
-EXC) if and only if, for every
p ∈ RN
, D(p; f) satisfies (B♮
-EXC).
The following are two versions of the multiple exchange property of D(p; f):
(NC) For any p ∈ RN
, if X,Y ∈ D(p; f) and I ⊆ X \ Y, there exists J ⊆ Y \ X such that
(X \ I) ∪ J ∈ D(p; f),
(NCsim) For any p ∈ RN
, if X,Y ∈ D(p; f) and I ⊆ X \ Y, there exists J ⊆ Y \ X such that
(X \ I) ∪ J ∈ D(p; f) and (Y \ J) ∪ I ∈ D(p; f).
The condition (NC), introduced by Gul and Stacchetti (1999), is called “no complementari-
ties property” and (NCsim) is a simultaneous (or symmetric) version of (NC) introduced by
Murota (2018). These conditions, (NC) and (NCsim), are equivalent to each other, and are
equivalent to the M♮
-concavity of f; see Remark 3.1 as well as (Murota 2018) for details.
In the above we have looked at the family D(p; f) of the maximizers for each p ∈ RN
. We
now investigate how D(p; f) changes with the variation of p.
A set function (single-unit valuation function) f : 2N
→ R ∪ {−∞} is said to have the
gross substitutes property if 7
(GS) For any p,q ∈ RN
with p ≤ q and X ∈ D(p; f), there exists Y ∈ D(q; f) such that
{i ∈ X | pi = qi} ⊆ Y.
The concept of gross substitutes property, introduced by Kelso and Crawford (1982), has
turned out to be crucial in economics; see, e.g., Roth and Sotomayor (1990), Bikhchan-
dani and Mamer (1997), Gul and Stacchetti (1999), Ausubel and Milgrom (2002), Milgrom
(2004), Hatfield and Milgrom (2005), Ausubel (2006), Sun and Yang (2006), Milgrom and
Strulovici (2009), and Hatfield et al. (2019).
The following theorem, due to Fujishige and Yang (2003), plays the key role to connect
discrete convex analysis and economics.
Theorem 3.7. A set function f : 2N
→ R ∪ {−∞} has the gross substitutes property (GS) if
and only if it is M♮
-concave.
It is known (Hatfield and Milgrom 2005, Milgrom and Strulovici 2009) that the gross
substitutes property, and hence M♮
-concavity, implies the law of aggregate demand in the
following form:
7
To be precise, Kelso and Crawford (1982) and also Gul and Stacchetti (1999) treat the case of f : 2N
→ R.
9(LAD) For any p,q ∈ RN
with p ≤ q and X ∈ D(p; f), there exists Y ∈ D(q; f) such that
|X| ≥ |Y|.
Gross substitutes properties for multi-unit valuations are treated in Section 4.3.
## 3.4 Choice function
A function C : 2N
→ 2N
is called a choice function if C(Z) ⊆ Z for all Z ⊆ N. We have
C(∅) = ∅ and, possibly, C(Z) = ∅ for some nonempty subsets Z. A choice function C is said
to be consistent if C(X) ⊆ Y ⊆ X implies C(Y) = C(X). Here we discuss two other properties
of choice functions, substitutability and cardinal monotonicity, which are closely related to
M♮
-concavity.
ThesubstitutabilityofachoicefunctionC meansthefollowingproperty(Roth 1984, Roth
and Sotomayor 1990):
(SCch) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 it holds that Z2 ∩C(Z1) ⊆ C(Z2).
Several apparently different formulations of substitutability, each equivalent to (SCch), are
found in the literature:
• For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 it holds that Z1 \ C(Z1) ⊇ Z2 \ C(Z2).
• i ∈ C(X) implies i ∈ C(Y ∪ {i}) for Y ⊆ X.
• For any X ⊆ N and any distinct i, j ∈ X, i ∈ C(X) implies i ∈ C(X \ {j}).
A choice function C is said to be cardinal-monotone if |C(Y)| ≤ |C(X)| for all Y ⊆ X .
This property is called increasing property by Fleiner (2003) and law of aggregate demand
by Hatfield and Milgrom (2005).
Remark 3.5. As is well known, consistency and substitutability together are equivalent to
path independence of Plott (1973), which is characterized by the condition: C(C(X) ∪ Y) =
C(X ∪ Y) for all X,Y ⊆ N. This condition is equivalent to: C(C(X) ∪ C(Y)) = C(X ∪ Y) for
all X,Y ⊆ N.
Remark 3.6. The above-mentioned properties of choice functions are well-known key prop-
erties in economics and game theory. In the stable matching problem, for example, con-
sistency and substitutability (i.e., path independence) guarantee, roughly, the existence of a
stable matching. If, in addition, the choice functions are cardinal-monotone, then the stable
matchings form a nice lattice (with simple lattice operations, being distributive, etc.). To
quote Theorem 10 of Alkan (2002): “The set of stable matchings in any two-sided market
with path-independent cardinal-monotone choice functions is a distributive lattice under the
common preferences of all agents on one side of the market. The supremum (infimum) op-
eration of the lattice for each side consists componentwise of the join (meet) operation in the
revealed preference ordering of associated agents. The lattice has the polarity, unicardinality
and complementarity properties.”
Remark 3.7. A function C : 2N
→ 2N
is called comonotone if there exists a monotone
function g : 2N
→ 2N
such that C(X) = X \ g(X) for all X ⊆ N (Fleiner 2003). A function
C : 2N
→ 2N
is comonotone if and only if C is a choice function with substitutability. The
fixed point approach to stable matchings of Fleiner (2003) is based on the observation that
10stable matchings correspond to fixed points of a certain monotone function associated with
the choice functions and the deferred acceptance algorithm of Gale and Shapley (1962) can
be regarded as an iteration of this function. See also Farooq et al. (2012).
A choice correspondence means a function C : 2N
→ 22N
such that ∅ , C(Z) ⊆ 2Z
for all
Z ⊆ N. It should be clear that the value C(Z) is not a subset of N but a family of subsets of
N. If C(Z) consists of a single subset for each Z ⊆ N, then C can be identified with a choice
function C : 2N
→ 2N
.
The substitutability of a choice correspondence C is formulated as follows (Definition 4
of Sotomayor 1999):
(SC1
ch) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 and any X1 ∈ C(Z1), there exists X2 ∈ C(Z2) such
that Z2 ∩ X1 ⊆ X2.
(SC2
ch) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 and any X2 ∈ C(Z2), there exists X1 ∈ C(Z1) such
that Z2 ∩ X1 ⊆ X2.
For a choice function C : 2N
→ 2N
, (SC1
ch) and (SC2
ch) are each equivalent to (SCch).
Choice function induced from a valuation function: A valuation function f : 2N
→
R ∪ {−∞} with ∅ ∈ dom f induces a choice correspondence C : 2N
→ 22N
by
C(Z) = C(Z; f) = argmax{f(Y) | Y ⊆ Z}. (3.17)
The assumption “∅ ∈ dom f” ensures that C(Z; f) , ∅ for every Z ⊆ N. In general, the
maximizer is not unique, and accordingly, C is a choice correspondence (i.e., C(Z; f) is a
family of subsets of N).
While (SC1
ch) and (SC2
ch) aboveformulate the substitutabilityfor a choice correspondence,
(SC1
) and (SC2
) below are the corresponding conditions for a valuation function f. That is, a
valuation function f satisfies (SC1
) if and only if the induced choice correspondence C(·; f)
satisfies (SC1
ch), and similarly for (SC2
) and (SC2
ch).
(SC1
) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 and any X1 ∈ C(Z1; f), there exists X2 ∈ C(Z2; f)
such that Z2 ∩ X1 ⊆ X2.
(SC2
) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 and any X2 ∈ C(Z2; f), there exists X1 ∈ C(Z1; f)
such that Z2 ∩ X1 ⊆ X2.
These two conditions are independent of each other; see Examples 3.1 and 3.2 in Farooq and
Tamura (2004).
A connection to M♮
-concavity is pointed out by Eguchi et al. (2003); see also Fujishige
and Tamura (2006). This is another important finding, on top of Theorem 3.7 (equivalence of
M♮
-concavity to (GS)), which has reinforced the connection between discrete convex analysis
and economics.
Theorem 3.8. Every M♮
-concave function f : 2N
→ R∪{−∞} with ∅ ∈ dom f satisfies (SC1
)
and (SC2
). That is, the choice correspondence induced from an M♮
-concave set function has
the substitutability properties (SC1
ch) and (SC2
ch).
11Proof. Assume Z1 ⊇ Z2.
Proof of (SC1
): Let X1 ∈ C(Z1; f) and take X2 ∈ C(Z2; f) with minimum |(Z2 ∩ X1) \ X2|.
To prove by contradiction, suppose that there exists i ∈ (Z2 ∩ X1) \ X2. Since i ∈ X1 \ X2,
(M♮
-EXC) implies (i) f(X1) + f(X2) ≤ f(X1 − i) + f(X2 + i) or (ii) there exists j ∈ X2 \ X1
such that f(X1) + f(X2) ≤ f(X1 − i + j) + f(X2 + i − j). In case (i) we note X1 − i ⊆ Z1 and
X2 + i ⊆ Z2, from which follow f(X1 − i) ≤ f(X1) and f(X2 + i) ≤ f(X2). Therefore, the
inequalities are in fact equalities, and X1 − i ∈ C(Z1; f) and X2 + i ∈ C(Z2; f). But we have
|(Z2 ∩ X1) \ (X2 + i)| = |(Z2 ∩ X1) \ X2| − 1, which contradicts the choice of X2. In case (ii)
we note X1 − i + j ⊆ Z1 and X2 + i − j ⊆ Z2, from which follow f(X1 − i + j) ≤ f(X1) and
f(X2+i− j) ≤ f(X2). Therefore, the inequalitiesare in fact equalities, and X1−i+ j ∈ C(Z1; f)
and X2 + i − j ∈ C(Z2; f). But we have |(Z2 ∩ X1) \ (X2 + i − j)| = |(Z2 ∩ X1) \ X2| − 1, which
contradicts the choice of X2.
Proof of (SC2
): Let X2 ∈ C(Z2; f) and take X1 ∈ C(Z1; f) with minimum |(Z2 ∩ X1) \ X2|.
By the same argument as above we obtain (i) X1 − i ∈ C(Z1; f) with |(Z2 ∩ (X1 − i)) \ X2| =
|(Z2 ∩X1)\X2|−1, or (ii) X1 −i+ j ∈ C(Z1; f) with |(Z2 ∩(X1 −i+ j))\X2| = |(Z2 ∩X1)\X2|−1.
This is a contradiction to the choice of X1. 
When the maximizer is unique in (3.17) for every Z, we say that f is unique-selecting.
In this case, C in (3.17) is a choice function (i.e., C(Z; f) is a subset of N for every Z), and
(SC1
) and (SC2
) both reduce to the following condition:
(SC) For any Z1,Z2 ⊆ N with Z1 ⊇ Z2 it holds that Z2 ∩ C(Z1; f) ⊆ C(Z2; f).
Theorem 3.8 yields, as a corollary, the following result of Eguchi and Fujishige (2002).
Theorem 3.9. Every unique-selecting M♮
-concave function f : 2N
→ R ∪ {−∞} with ∅ ∈
dom f satisfies(SC). That is, thechoicefunctioninduced froma unique-selectingM♮
-concave
set function has the substitutability property (SCch).
Unique-selecting M♮
-concave functions are well-behaved also with respect to cardinal
monotonicity. The following is a special case of Lemma 4.5 of Murota and Yokoi (2015).
Theorem 3.10. Every unique-selecting M♮
-concave function f : 2N
→ R ∪ {−∞} with ∅ ∈
dom f induces a choice function with cardinal monotonicity.
Proof. The proof is based on the exchange property (3.9) in Remark 3.3. To prove by contra-
diction, suppose that there exist X and Y such that X ⊇ Y and |C(X)| < |C(Y)|. Set X∗
= C(X)
and Y∗
= C(Y). Then |X∗
| < |Y∗
|. By the exchange property (3.9) there exists j ∈ Y∗
\X∗
such
that f(X∗
)+ f(Y∗
) ≤ f(X∗
+ j)+ f(Y∗
− j). Here we have f(X∗
+ j) < f(X∗
) since X∗
+ j ⊆ X
and X∗
is the unique maximizer, and also f(Y∗
− j) < f(Y∗
) since Y∗
− j ⊆ Y and Y∗
is the
unique maximizer. This is a contradiction. 
Thus, M♮
-concave valuation functions entail the three desirable properties. Recall Re-
mark 3.6 for the implications of this fact.
Theorem 3.11. The choice function induced from a unique-selecting M♮
-concave set function
f with ∅ ∈ dom f has consistency, substitutability, and cardinal monotonicity.
Finally, we mention a theorem that characterizes M♮
-concavity in terms of a parametrized
version of (SC1
) and (SC2
). Recall from (3.15) the notation f[−p](X) = f(X) − p(X) for
p ∈ RN
and X ⊆ N. If f is an M♮
-concave function (not assumed to be unique-selecting),
f[−p] is also M♮
-concave, and hence is equipped with the properties (SC1
) and (SC2
) by
Theorem 3.8. In other words, an M♮
-concave function f has the following properties.
12(SC1
G) For any p ∈ RN
, f[−p] satisfies (SC1
).
(SC2
G) For any p ∈ RN
, f[−p] satisfies (SC2
).
The following theorem, due to Farooq and Tamura (2004), states that these two conditions
are equivalent, and each of them characterizes M♮
-concavity.
Theorem 3.12. For a set function f : 2N
→ R ∪ {−∞} with dom f , ∅, we have the equiva-
lence: f is M♮
-concave ⇐⇒ (SC1
G) ⇐⇒ (SC2
G).
3.5 Twisted M♮
-concavity
Let W be a subset of N. For any subset X of N we define
tw(X) = (X \ W) ∪ (W \ X). (3.18)
A set function f : 2N
→ R∪{−∞} is said to be a twisted M♮
-concave function with respect to
W, if the function ˜ f : 2N
→ R ∪ {−∞} defined by
˜ f(X) = f(tw(X)) (X ⊆ N) (3.19)
is an M♮
-concave function (Ikebe and Tamura 2015). The same concept was introduced
earlier by Sun and Yang (2006, 2009) under the name of GM-concave functions. Note that f
is twisted M♮
-concave with respect to W if and only if it is twisted M♮
-concave with respect
to U = N \ W.
Mathematically, twisted M♮
-concavity is equivalent to the original M♮
-concavity through
twisting, and all the properties and theorems about M♮
-concave functions can be translated
into those about twisted M♮
-concave functions. However, twisted M♮
-concave functions are
convenient sometimes in the modeling in economics.
For example, as pointed out by Ikebe and Tamura (2015), twisted M♮
-concavity implies
the same-side substitutability (SSS) and the cross-side complementarity (CSC) proposed by
Ostrovsky (2008) in discussing supply chain networks. For a choice function C : 2N
→ 2N
the same-side substitutability (SSS) with respect to the bipartition (U,W) of N means the
following property:
(SSS) (i) For any Z1,Z2 ⊆ N with Z1 ∩ U ⊇ Z2 ∩ U and Z1 ∩ W = Z2 ∩ W, we have
Z2 ∩C(Z1) ∩ U ⊆ C(Z2) ∩ U, and (ii) the same statement with U and W interchanged,
and the cross-side complementarity (CSC) means
(CSC) (i) For any Z1,Z2 ⊆ N with Z1 ∩ U ⊇ Z2 ∩ U and Z1 ∩ W = Z2 ∩ W, we have
C(Z1) ∩ W ⊇ C(Z2) ∩ W, and (ii) the same statement with U and W interchanged.
For our exposition it is convenient to combine these two into a single property:
(SSS-CSC) (i) For any Z1,Z2 ⊆ N with Z1 ∩ U ⊇ Z2 ∩ U and Z1 ∩ W = Z2 ∩ W, we have
Z2 ∩C(Z1) ∩ U ⊆ C(Z2) ∩ U and C(Z1) ∩ W ⊇ C(Z2) ∩ W, and (ii) the same statement
with U and W interchanged.
13The connection to twisted M♮
-concavity is given in the followingtheorem8
, to be ascribed
to Ikebe and Tamura (2015). Recall from (3.17) the definition of the choice function induced
from a valuation function: C(Z) = C(Z; f) = argmax{f(Y) | Y ⊆ Z}.
Theorem 3.13. The choice function induced from a unique-selecting twisted M♮
-concave set
function f : 2N
→ R ∪ {−∞} with ∅ ∈ dom f has the property (SSS-CSC).
For choice correspondences we need to consider the following pair of conditions.
(SSS-CSC1
) (i) For any Z1,Z2 ⊆ N with Z1 ∩ U ⊇ Z2 ∩ U and Z1 ∩ W = Z2 ∩ W and any
X1 ∈ C(Z1), there exists X2 ∈ C(Z2)such that Z2∩X1∩U ⊆ X2∩U and X1∩W ⊇ X2∩W,
and (ii) the same statement with U and W interchanged.
(SSS-CSC2
) (i) For any Z1,Z2 ⊆ N with Z1 ∩ U ⊇ Z2 ∩ U and Z1 ∩ W = Z2 ∩ W and any
X2 ∈ C(Z2), there exists X1 ∈ C(Z1)such that Z2∩X1∩U ⊆ X2∩U and X1∩W ⊇ X2∩W,
and (ii) the same statement with U and W interchanged.
The following theorem (Ikebe and Tamura 2015) states that these two properties are im-
plied by twisted M♮
-concavity.
Theorem 3.14. The choice correspondence induced from a twisted M♮
-concave set function
f : 2N
→ R ∪ {−∞} with ∅ ∈ dom f has the properties (SSS-CSC1
) and (SSS-CSC2
).
Proof. We prove (SSS-CSC1
)-(i) and (SSS-CSC2
)-(i); the proofs of (SSS-CSC1
)-(ii) and
(SSS-CSC2
)-(ii) are obtained by interchanging U and W. Assume Z1 ∩ U ⊇ Z2 ∩ U and
Z1 ∩ W = Z2 ∩ W, and let ˜ f be the M♮
-concave function in (3.19) associated with f. For
X1 ⊆ Z1 and X2 ⊆ Z2 define
Φ(X1,X2) = |(Z2 ∩ X1 ∩ U) \ (X2 ∩ U)| + |(X2 ∩ W) \ (X1 ∩ W)|.
Proof of (SSS-CSC1
)-(i): Let X1 ∈ C(Z1; f) and take X2 ∈ C(Z2; f) with Φ(X1,X2)
minimum. To prove by contradiction, suppose that there exists i ∈ (Z2 ∩ X1 ∩ U) \ (X2 ∩
U)

∪ (X2 ∩ W) \ (X1 ∩ W)

. Since i ∈ tw(X1) \ tw(X2), (M♮
-EXC) for ˜ f implies
(i) ˜ f(tw(X1)) + ˜ f(tw(X2)) ≤ ˜ f(tw(X1) − i) + ˜ f(tw(X2) + i) or
(ii) there exists j ∈ tw(X2) \ tw(X1) such that ˜ f(tw(X1)) + ˜ f(tw(X2)) ≤ ˜ f(tw(X1) − i + j) +
˜ f(tw(X2) + i − j).
Letting
X̂1 =
(
tw(tw(X1) − i)) (in (i)),
tw(tw(X1) − i + j)) (in (ii)),
X̂2 =
(
tw(tw(X2) + i)) (in (i)),
tw(tw(X2) + i − j)) (in (ii)),
we can express the above inequalities in (i) and (ii) as
f(X1) + f(X2) ≤ f(X̂1) + f(X̂2).
As can be verified easily, we have X̂1 ⊆ Z1 and X̂2 ⊆ Z2, from which follow f(X̂1) ≤ f(X1)
and f(X̂2) ≤ f(X2) since X1 ∈ C(Z1; f) and X2 ∈ C(Z2; f). Therefore, the inequalities are in
8
Theorem 3.13 can be understood as a twisted version of Theorem 3.9, though a straightforward translation
of Theorem 3.9 via twisting does not seem to yield Theorem 3.13. Theorem 3.13 can be proved as a special
case of Theorem 3.14 below, for which a direct proof is given.
14fact equalities, and X̂1 ∈ C(Z1; f) and X̂2 ∈ C(Z2; f). But we have Φ(X1,X̂2) = Φ(X1,X2) − 1,
which contradicts the choice of X2.
Proof of (SSS-CSC2
)-(i): Let X2 ∈ C(Z2; f) and take X1 ∈ C(Z1; f) with Φ(X1,X2)
minimum. By the same argument as above we obtain X̂1 ∈ C(Z1; f) with Φ(X̂1,X2) =
Φ(X1,X2) − 1. This is a contradiction to the choice of X1. 
The concept of twisted M♮
-concavity can also be defined for functions on integer vectors
ZN
to be used for multi-unit models. See Section 4.5.
## 3.6 Examples
Here are some examples of M♮
-concave set functions.
1. For real numbers ai indexed by i ∈ N, the additive valuation
f(X) =
X
i∈X
ai (X ⊆ N) (3.20)
is an M♮
-concave function.
2. For a set of nonnegative numbers ai indexed by i ∈ N, the maximum-value function
(unit-demand utility)
f(X) = max
i∈X
ai (X ⊆ N) (3.21)
with f(∅) = 0 is an M♮
-concave function.
3. For a univariate concave function ϕ : Z → R ∪{−∞} (i.e., if ϕ(t −1) +ϕ(t + 1) ≤ 2ϕ(t)
for all integers t), the function f defined by
f(X) = ϕ(|X|) (X ⊆ N) (3.22)
is M♮
-concave. Such f is called a symmetric concave valuation.
4. For a family of univariate concave functions {ϕA | A ∈ T} indexed by a family T of
subsets of N, the function
f(X) =
X
A∈T
ϕA(|A ∩ X|) (X ⊆ N) (3.23)
is submodular. A function f of the form (3.23) is called laminar concave, if T is a
laminar family, i.e., if [A, B ∈ T ⇒ A ∩ B = ∅ or A ⊆ B or A ⊇ B]. A laminar concave
function is M♮
-concave. See Note 6.11 of Murota (2003) for a proof. A special case of
(3.23) with T = {N} reduces to (3.22).
5. Given a matroid9
on N in terms of the family I of independent sets, the rank function
f is defined by
f(X) = max{|I| | I ∈ I, I ⊆ X} (X ⊆ N), (3.24)
which denotes the maximum size of an independent set contained in X. A matroid rank
function (3.24) is M♮
-concave. A weighted matroid rank function (or weighted matroid
valuation) is a function represented as
f(X) = max{w(I) | I ∈ I, I ⊆ X} (X ⊆ N) (3.25)
9
For matroids, see, e.g., Murota (2000a), Oxley (2011), and Schrijver (2003).
15S T
M I f(X)
w
Figure 1: Independent assignment valuation
with some weight w ∈ RN
, where w(I) =
P
i∈I wi. A weighted matroid rank function
(3.25) is M♮
-concave (Shioura 2012). See Murota (2010) for an elementary proof for
the M♮
-concavity of (3.25) as well as (3.24).
6. Let G = (S,T;E) be a bipartite graph with vertex bipartition (S,T) and edge set E,
and suppose that each edge e ∈ E is associated with weight we ∈ R. For M ⊆ E, we
denote by ∂M the set of the vertices incident to some edge in M, and call M a matching
if |S ∩ ∂M | = |M | = |T ∩ ∂M |. For X ⊆ T denote by f(X) the maximum weight of a
matching that precisely matches X in T, i.e.,
f(X) = max{w(M) | M is a matching, T ∩ ∂M = X} (3.26)
with w(M) =
P
e∈M we, where f(X) = −∞ if no such M exists for X. Then f : 2T
→
R ∪ {−∞} is an M♮
-concave function. See Example 3.3 of Murota (1996a) or Example
5.2.4 of Murota (2000a) for proofs. Such function is called an assignment valuation by
Hatfield and Milgrom (2005). Assignment valuations cover a fairly large class of M♮
-
concave functions, but not every M♮
-concave function can be represented in the form
of (3.26), as shown by Ostrovsky and Paes Leme (2015).
7. Let G = (S,T;E) be a bipartite graph with vertex bipartition (S,T) and edge set E,
with weight we ∈ R associated with each edge e ∈ E. Furthermore, suppose that a
matroid on S is given in terms of the family I of independent sets (see Fig. 1). For
X ⊆ T denote by f(X) the maximum weight of a matching such that the end-vertices
in S form an independent set and the end-vertices in T are equal to X, i.e.,
f(X) = max{w(M) | M is a matching, S ∩ ∂M ∈ I, T ∩ ∂M = X}, (3.27)
where f(X) = −∞ if no such M existsfor X. We call such f an independent assignment
valuation. It is known that an independent assignment valuation is M♮
-concave. For
proofs, see Example 5.2.18 of Murota (2000a), Section 9.6.2 of Murota (2003), and
Kobayashi et al. (2007). If the given matroid is a free matroid with I = 2S
, (3.27)
reduces to (3.26).
## 3.7 Concluding remarks of section 3
We collect here the conditions that characterize M♮
-concave set functions:
– Exchange property (M♮
-EXC) (Section 3.1)
– Multiple exchange property (M♮
-EXCm)
= Strong no complementarities property (SNC) (Section 3.1)
16✲ i
✻
j
y
x
y′
y′′
x′′
x′
✲
❄
✛
✻
Figure 2: Nearer pair in the definition of M♮
-concave functions
– Local exchange property (Theorems 3.2 and 3.3) (Section 3.1)
– Single improvement property (SI) (Section 3.2)
– Exchange property (B♮
-EXC) for the maximizers D(p; f) (Section 3.3)
– Multiple (one-sided) exchange property for the maximizers D(p; f)
= No complementarities property (NC) (Section 3.3)
– Multiple exchange property (NCsim) for the maximizers D(p; f) (Section 3.3)
– Gross substitutability (GS) (Section 3.3)
– Parametrized substitutability (SC1
G) (Section 3.4)
– Parametrized substitutability (SC2
G) (Section 3.4)
4 M♮
-concave Function on Zn
In Section 3 we have considered M♮
-concave set functions, which correspond to single-unit
valuations with substitutability. In this section we deal with M♮
-concave functions defined
on integer vectors, f : Zn
→ R ∪ {−∞}, which correspond to multi-unit valuations with
substitutability.
## 4.1 Exchange property
Let N be a finite set, say, N = {1,2,...,n} for n ≥ 1. For a vector z ∈ RN
in general, define
the positive and negative supports of z as
supp+
(z) = {i | zi > 0}, supp−
(z) = {j | zj < 0}. (4.1)
Recall that, for i ∈ N, the ith unit vector is denoted by χi.
We say that a function f : ZN
→ R ∪ {−∞} with dom f , ∅ is M♮
-concave, if, for any
x,y ∈ ZN
and i ∈ supp+
(x − y), we have (i)
f(x) + f(y) ≤ f(x − χi) + f(y + χi) (4.2)
or (ii) there exists some j ∈ supp−
(x − y) such that
f(x) + f(y) ≤ f(x − χi + χj) + f(y + χi − χj). (4.3)
This property is referred to as the exchange property. See Fig. 2, in which (x′
,y′
) = (x −
χi,y + χi) and (x′′
,y′′
) = (x − χi + χj,y + χi − χj).
A more compact expression of the exchange property is as follows:
17(M♮
-EXC[Z]) For any x,y ∈ ZN
and i ∈ supp+
(x − y), we have
f(x) + f(y) ≤ max
j∈supp−(x−y)∪{0}
{f(x − χi + χj) + f(y + χi − χj)}, (4.4)
where χ0 = 0 (zero vector). In the above statement we may change “For any x,y ∈ ZN
”
to “For any x,y ∈ dom f ” since if x < dom f or y < dom f, (4.4) trivially holds with
f(x)+ f(y) = −∞. An M♮
-concave function f with dom f ⊆ {0,1}N
can be identified with an
M♮
-concave set function introduced in Section 3.1. A function f is called M♮
-convex if −f is
M♮
-concave.
It follows from (M♮
-EXC[Z]) that the effective domain B = dom f of an M♮
-concave
function f has the following exchange property:
(B♮
-EXC[Z]) For any x,y ∈ B and i ∈ supp+
(x − y), we have (i) x − χi ∈ B, y + χi ∈ B or
(ii) there exists some j ∈ supp−
(x − y) such that x − χi + χj ∈ B, y + χi − χj ∈ B.
A set B ⊆ ZN
having this property is called an M♮
-convex set (or integral generalized poly-
matroid, integral g-polymatroid). An M♮
-convex set contained in the unit cube {0,1}N
can be
identified with an M♮
-convex family of subsets (Section 3.1).
M♮
-concavity can be characterized by a local exchange property under the assumption
that function f is (effectively) defined on an M♮
-convex set (Murota 1996c, 2003; Murota and
Shioura 1999). The conditions (4.5)–(4.9) below are “local” in the sense that they require the
exchangeability of the form of (4.4) only for some (x,y) with kx − yk1 ≤ 4.
Theorem 4.1. A function f : ZN
→ R ∪ {−∞} is M♮
-concave if and only if dom f is an
M♮
-convex set and the following conditions hold:
f(x + 2χi) + f(x) ≤ 2f(x + χi) (∀x ∈ ZN
, ∀i ∈ N), (4.5)
f(x + χi + χj) + f(x) ≤ f(x + χi) + f(x + χj) (∀x ∈ ZN
, ∀i, j ∈ N, i , j), (4.6)
f(x + 2χi) + f(x + χk) ≤ f(x + χi + χk) + f(x + χi) (∀x ∈ ZN
, ∀i,k ∈ N, i , k), (4.7)
f(x + χi + χj) + f(x + χk) ≤ max
h
f(x + χi + χk) + f(x + χj), f(x + χj + χk) + f(x + χi)
i
(∀x ∈ ZN
, ∀i, j,k(distinct) ∈ N), (4.8)
f(x + χi + χj) + f(x + χk + χl)
≤ max
h
f(x + χi + χk) + f(x + χj + χl), f(x + χj + χk) + f(x + χi + χl)
i
(∀x ∈ ZN
, ∀i, j,k,l ∈ N with {i, j} ∩ {k,l} = ∅), (4.9)
where in (4.9) we allow the possibility of i = j or k = l.
When the effectivedomaindom f is an M♮
-convex set such that 0 ∈ dom f ⊆ ZN
+, the local
exchange condition above takes a simpler form that does not involve (4.9) (Theorem 6.8 of
Shioura and Tamura 2015). To cover the case of dom f = ZN
we weaken the assumption on
dom f to:
x,y ∈ dom f =⇒ x ∧ y ∈ dom f. (4.10)
Theorem 4.2. Let f : ZN
→ R ∪ {−∞} be a function such that dom f is an M♮
-convex set
satisfying (4.10). Then f is M♮
-concave if and only if (4.5), (4.6), (4.7) and (4.8) hold.
Proof. The proof of Theorem 6.8 of Shioura and Tamura (2015) works under the weaker
condition (4.10). 
18The local exchange property above admits a natural reformulation in terms of the discrete
Hessian matrix when dom f = ZN
. For x ∈ ZN
and i, j ∈ N define
Hij(x) = f(x + χi + χj) − f(x + χi) − f(x + χj) + f(x), (4.11)
and let Hf (x) = (Hij(x) | i, j ∈ N) be the matrix consisting of those components. This matrix
Hf (x) is called the discrete Hessian matrix of f at x. The following theorem, due to Hirai and
Murota (2004) and Murota (2007), can be derived from Theorem 4.2.
Theorem 4.3. A function f : ZN
→ R is M♮
-concave if and onlyif the discreteHessian matrix
Hf (x) = (Hij(x)) satisfies the following conditions for each x ∈ ZN
:
Hij(x) ≤ 0 for any (i, j), (4.12)
Hij(x) ≤ max(Hik(x),Hjk(x)) if {i, j} ∩ {k} = ∅. (4.13)
Proof. The correspondence between the conditions in Theorems 4.2 and 4.3 is quite straight-
forward. With the use of (4.11) we can easily verify: (4.5) ⇔ Hii(x) ≤ 0, (4.6) ⇔ Hij(x) ≤ 0
(i , j), (4.7) ⇔ Hii(x) ≤ Hik(x) (i , k), and (4.8) ⇔ Hij(x) ≤ max(Hik(x),Hjk(x)) (i, j,k:
distinct). 
It is known (Theorem 6.19 of Murota 2003) that an M♮
-concave function f : ZN
→
R ∪ {−∞} is submodular on the integer lattice, i.e.,
f(x) + f(y) ≥ f(x ∨ y) + f(x ∧ y) (x,y ∈ ZN
). (4.14)
More precisely, the condition (4.6) above is equivalent to the submodularity (4.14) as long
as dom f is M♮
-convex (Proposition 6.1 of Shioura and Tamura 2015). Because of the ad-
ditional conditions for M♮
-concavity, not every submodular function is M♮
-concave. Thus,
M♮
-concave functions form a proper subclass of submodular functions on ZN
.
It is also known (Theorem 4.6 of Murota 1996c, Theorem 6.42 of Murota 2003) that an
M♮
-concave function f : ZN
→ R ∪ {−∞} is concave-extensible, i.e., there exists a concave
function f : RN
→ R ∪ {−∞} such that f(x) = f(x) for all x ∈ ZN
.
Remark4.1. Itfollowsfrom(M♮
-EXC[Z])thatM♮
-concavefunctionsenjoythefollowingex-
change properties under size constraints (Lemmas 4.3 and 4.6 of Murota and Shioura 1999):
• For any x,y ∈ ZN
with x(N) < y(N),
f(x) + f(y) ≤ max
j∈supp−(x−y)
{f(x + χj) + f(y − χj)}. (4.15)
• For any x,y ∈ ZN
with x(N) = y(N) and i ∈ supp+
(x − y),
f(x) + f(y) ≤ max
j∈supp−(x−y)
{f(x − χi + χj) + f(y + χi − χj)}. (4.16)
The former property, in particular, implies the size-monotonicity of the induced choice func-
tion; see Theorem 4.9 and its proof.
Remark 4.2. If B ⊆ ZN
lies in a hyperplane with a constant component sum (i.e., x(N) =
y(N) for all x,y ∈ B), the exchange property (B♮
-EXC[Z]) takes a simpler form (without the
possibility of j = 0): For any x,y ∈ B and i ∈ supp+
(x−y), there exists some j ∈ supp−
(x−y)
such that x − χi + χj ∈ B, y + χi − χj ∈ B. A set B ⊆ ZN
having this exchange property is
19called an M-convex set (or integral base polyhedron). An M♮
-concave function defined on an
M-convex set is called an M-concave function (Murota 1996c, 2003). The exchange property
for M-concavity reads: A function f : ZN
→ R ∪ {−∞} is M-concave if and only if, for any
x,y ∈ ZN
and i ∈ supp+
(x − y), it holds that
f(x) + f(y) ≤ max
j∈supp−(x−y)
{f(x − χi + χj) + f(y + χi − χj)}. (4.17)
M-concave functions and M♮
-concave functions are equivalent concepts, in that M♮
-concave
functions in n variables can be obtained as projections of M-concave functions in n + 1 vari-
ables. More formally, let “0” denote a new element not in N and Ñ = {0} ∪ N. A function
f : ZN
→ R ∪ {−∞} is M♮
-concave if and only if the function ˜ f : ZÑ
→ R ∪{−∞} defined by
˜ f(x0, x) =
(
f(x) if x0 = −x(N)
−∞ otherwise
(x0 ∈ Z, x ∈ ZN
) (4.18)
is an M-concave function. A function f is called M-convex if −f is M-concave.
## 4.2 Maximization and single improvement property
For an M♮
-concave function, the maximality of a function value is characterized by a local
condition as follows, where χ0 = 0 (Proposition 6.23 and Theorem 6.26 of Murota 2003).
Theorem 4.4. Let f : ZN
→ R ∪ {−∞} be an M♮
-concave function and x ∈ dom f.
(1) If f(x) < f(y) for y ∈ dom f, then f(x) < f(x − χi + χj) for some i ∈ supp+
(x − y) ∪ {0}
and j ∈ supp−
(x − y) ∪ {0}.
(2) x is a maximizer of f if and only if
f(x) ≥ f(x − χi + χj) (∀i, j ∈ N ∪ {0}). (4.19)
For a vector p = (pi | i ∈ N) ∈ RN
we use the notation f[−p] to mean the function
f(x) − p⊤
x, where p⊤
means the transpose of p. That is,
f[−p](x) = f(x) − p⊤
x (x ∈ ZN
). (4.20)
By considering the properties of (1) and (2) in Theorem 4.4 for f[−p] with varying p, we are
naturally led to (SSI[Z]) and (SI[Z]) below10
:
(SSI[Z]) For any p ∈ RN
and x,y ∈ dom f with f[−p](x) < f[−p](y), there exists i ∈
supp+
(x − y) ∪ {0} and j ∈ supp−
(x − y) ∪ {0} such that f[−p](x) < f[−p](x − χi + χj).
(SI[Z]) For any p ∈ RN
, if x ∈ dom f is not a maximizer of f[−p], there exists i ∈ N ∪ {0}
and j ∈ N ∪ {0} such that f[−p](x) < f[−p](x − χi + χj).
The stronger version (SSI[Z]) is shown to be equivalent to M♮
-concavity (Theorem 7 of
Murota and Tamura 2003a). This property is named the strong single improvement property
in Shioura and Tamura (2015). The latter (SI[Z]) is the vector version of single improve-
ment property (Section 3.2), called the multi-unit single improvement property by Milgrom
and Strulovici (2009). We can see from Theorem 13 of Milgrom and Strulovici (2009) that
(SI[Z]) is equivalent to M♮
-concavity under the assumption of concave-extensibility of f and
boundedness of dom f.
10
(SSI[Z]) here is denoted as (M♮
-SI[Z]) in Murota (2003).
204.3 Maximizers and gross substitutability
For a vector p = (pi | i ∈ N) ∈ RN
we consider the maximizers of the function f[−p](x) =
f(x) − p⊤
x. We denote the set of these maximizers by
D(p; f) = argmax
x
{f(x) − p⊤
x}. (4.21)
In economic applications, p is a price vector and D(p) = D(p; f) represents the demand
correspondence.
It is one of the most fundamental facts in discrete convex analysis that the M♮
-concavity
of a function is characterized in terms of the M♮
-convexity of its maximizers (Murota 1996c;
Theorem 6.30 of Murota 2003; Murota and Shioura 1999).
Theorem 4.5. Let f : ZN
→ R ∪ {−∞} be a function with a bounded effective domain. Then
f is M♮
-concave if and only if, for every vector p ∈ RN
, D(p; f) is an M♮
-convex set. That is,
f satisfies (M♮
-EXC[Z]) if and only if, for every p ∈ RN
, D(p; f) satisfies (B♮
-EXC[Z]).
As a straightforward extension of the gross substitutes condition from single-unit valua-
tions (Section 3.3) to multi-unit valuations it seems natural to conceive the following condi-
tion:
(GS[Z]) For any p,q ∈ RN
with p ≤ q and x ∈ D(p; f), there exists y ∈ D(q; f) such that
xi ≤ yi for all i ∈ N with pi = qi.
It turns out, however, that this condition alone is too weak to be fruitful, mathematically and
economically. Subsequently, several different strengthened forms of (GS[Z]) are proposed in
the literature (Danilov et al. 2003, Murota and Tamura 2003a, Milgrom and Strulovici 2009,
Shioura and Tamura 2015).
Among others we start with the projected gross substitutes condition11
(PRJ-GS[Z]) of
Murota and Tamura (2003a):
(PRJ-GS[Z]) For any p,q ∈ RN
with p ≤ q, any p0,q0 ∈ R with p0 ≤ q0 and x ∈ D(p −
p01; f), there exists y ∈ D(q − q01; f) such that (i) xi ≤ yi for all i ∈ N with pi = qi and
(ii) x(N) ≥ y(N) if p0 = q0,
where x(N) =
P
i∈N xi and y(N) =
P
i∈N yi. By fixing p0 = q0 = 0 in (PRJ-GS[Z]) we obtain
the following condition:
(GS&LAD[Z]) For any p,q ∈ RN
with p ≤ q and x ∈ D(p; f), there exists y ∈ D(q; f) such
that (i) xi ≤ yi for all i ∈ N with pi = qi and (ii) x(N) ≥ y(N).
As the acronym (GS&LAD[Z]) shows, this condition is a combination of (GS[Z]) above and
the law of aggregate demand:
(LAD[Z]) For any p,q ∈ RN
with p ≤ q and x ∈ D(p; f), there exists y ∈ D(q; f) such that
x(N) ≥ y(N)
11
(PRJ-GS[Z]) is denoted as (M♮
-GS[Z]) in Section 6.8 of Murota (2003).
21considered by Hatfield and Milgrom (2005) and Milgrom and Strulovici (2009). Note, how-
ever, that imposing (GS&LAD[Z]) on f is not the same as imposing (GS[Z]) and (LAD[Z])
on f, since in (GS&LAD[Z]) both (i) and (ii) must be satisfied by the same vector y. Obvi-
ously,(GS&LAD[Z])implies(GS[Z]) and(LAD[Z]). Theamalgamatedform(GS&LAD[Z])
is given in Murota et al. (2013a), whereas the juxtaposition of (GS[Z]) and (LAD[Z]) is in
Theorem 13 (iv) of Milgrom and Strulovici (2009). We may also consider the following vari-
ant (Shioura and Tamura 2015, Shioura and Yang 2015) of (GS&LAD[Z]), where the vector
q takes a special form12
p + δχk with k ∈ N and δ > 0:
(GS&LAD′
[Z]) For any p ∈ RN
, k ∈ N, δ > 0 and x ∈ D(p; f), there exists y ∈ D(p+δχk; f)
such that (i) xi ≤ yi for all i ∈ N \ {k} and (ii) x(N) ≥ y(N).
M♮
-concavity can be characterized by these properties as follows (Murota and Tamura
2003a, Danilov et al. 2003, Theorem 13 of Milgrom and Strulovici 2009, Theorem 4.1 of
Shioura and Tamura 2015; Theorems 6.34 and 6.36 of Murota 2003). The theorem refers to
two other conditions (SWGS[Z]) and (SS[Z]), which are explained in Remark 4.3 below.
Theorem 4.6. Let f : ZN
→ R ∪ {−∞} be a concave-extensible function with a bounded
effective domain. Then we have the following equivalence: (M♮
-EXC[Z]) ⇐⇒ (PRJ-GS[Z])
⇐⇒ (GS&LAD[Z]) ⇐⇒ (GS[Z]) & (LAD[Z]) ⇐⇒ (GS&LAD′
[Z]) ⇐⇒ (SWGS[Z]).
If dom f is contained in ZN
+, each of these conditions is equivalent to (SS[Z]).
Remark 4.3. The step-wise gross substitutes condition (Danilov et al. 2003) means:
(SWGS[Z]) For any p ∈ RN
, k ∈ N and x ∈ D(p; f), at least one of (i) and (ii) holds true13
:
(i) x ∈ D(p + δχk; f) for all δ ≥ 0,
(ii) there exists δ ≥ 0 and y ∈ D(p + δχk; f) such that yk = xk − 1 and yi ≥ xi for all
i ∈ N \ {k}.
The strong substitute condition (Milgrom and Strulovici 2009) for a multi-unit valuation f
means the condition (GS[Z]) for the single-unit valuation fB
corresponding to f:
(SS[Z]) The function fB
associated with f satisfies the condition (GS[Z]).
More specifically, the function fB
is defined as follows. Let u ∈ ZN
+ be a vector such that
dom f ⊆ [0,u]Z. Consider a set NB
= {(i,β) | i ∈ N, β ∈ Z, 1 ≤ β ≤ ui} and define
fB
: ZNB
→ R ∪ {−∞} with dom fB
⊆ {0,1}NB
by
fB
(xB
) = f(x), xB
∈ {0,1}NB
, xi =
ui X
β=1
xB
(i,β) (i ∈ N). (4.22)
## 4.4 Choice function
Let b ∈ ZN
+ be an upper bound vector and B = {x ∈ ZN
+ | x ≤ b} be the set of feasible vectors.
A function C : B → B is called a choice function if C(x) ≤ x for all x ∈ B. Three important
properties are identified in the literature (Alkan and Gale 2003):
12
Recall that χk denotes the kth unit vector.
13
Recall that χk denotes the kth unit vector.
22• C is called consistent if C(x) ≤ y ≤ x implies C(y) = C(x),
• C is called persistent if x ≥ y implies y ∧ C(x) ≤ C(y),
• C is called size-monotone if x ≥ y implies |C(x)| ≥ |C(y)|, where |C(x)| =
X
i∈N
C(x)i.
Remark 4.4. Alkan and Gale (2003) considered the stable allocation model that extends the
stable matching model of Alkan (2002). If the choice functions are consistent and persistent,
the set of stable allocations is nonempty and forms a lattice. Moreover, if the choice func-
tions are also size-monotone, the lattice of stable allocations is distributive and has several
significant properties, called polarity, complementarity, and uni-size property.
For a given function f : ZN
→ R ∪ {−∞} we define
C(z) = C(z; f) = argmax{f(y) | y ≤ z}. (4.23)
In general, the maximizer may not be unique, and hence C(z; f) ⊆ ZN
. We also have the
possibility of C(z; f) = ∅ to express the nonexistence of a maximizer.
An important property of M♮
-concave functions, closely related to persistence, is found
in Lemma 1 of Eguchi et al. (2003); see also Lemma 5.2 of Fujishige and Tamura (2006).
Theorem 4.7. Let f : ZN
→ R ∪ {−∞} be an M♮
-concave function. Then the following hold.
(SC1
[Z]) For any z1,z2 ∈ ZN
with z1 ≥ z2 and C(z2; f) , ∅ and for any x1 ∈ C(z1; f), there
exists x2 ∈ C(z2; f) such that z2 ∧ x1 ≤ x2.
(SC2
[Z]) For any z1,z2 ∈ ZN
with z1 ≥ z2 and C(z1; f) , ∅ and for any x2 ∈ C(z2; f), there
exists x1 ∈ C(z1; f) such that z2 ∧ x1 ≤ x2.
Proof. Assume z1 ≥ z2. For x1 ≤ z1 and x2 ≤ z2 define
Φ(x1, x2) =
X
{(x1)i − (x2)i | i ∈ supp+
((z2 ∧ x1) − x2)}.
Proof of (SC1
[Z]): Let x1 ∈ C(z1; f) and take x2 ∈ C(z2; f) with minimum Φ(x1, x2).
To prove by contradiction, suppose that there exists i ∈ supp+
((z2 ∧ x1) − x2). Since i ∈
supp+
(x1 − x2), (M♮
-EXC[Z]) implies there exists j ∈ supp−
(x1 − x2) ∪ {0} such that
f(x1) + f(x2) ≤ f(x1 − χi + χj) + f(x2 + χi − χj).
Herewehave x1−χi+χj ≤ z1 and x2+χi−χj ≤ z2; theformerisobviousif j = 0and otherwise,
it follows from (x1)j < (x2)j ≤ (z2)j ≤ (z1)j, and the latter follows from (x2)i < (z2)i. This
implies that f(x1 − χi + χj) ≤ f(x1) and f(x2 + χi − χj) ≤ f(x2) since x1 ∈ C(z1; f) and
x2 ∈ C(z2; f). Therefore, the inequalities are in fact equalities, and x1 −χi +χj ∈ C(z1; f) and
x2 +χi −χj ∈ C(z2; f). But we have Φ(x1, x2 +χi −χj) = Φ(x1, x2)−1, which contradicts the
choice of x2.
Proof of (SC2
[Z]): Let x2 ∈ C(z2; f) and take x1 ∈ C(z1; f) with minimum Φ(x1, x2). By
the same argument as above we obtain x1 − χi + χj ∈ C(z1; f) with Φ(x1 − χi + χj, x2) =
Φ(x1, x2) − 1. This is a contradiction to the choice of x1. 
23When the maximizer is unique in (4.23) for every z, we say that f is unique-selecting. In
the following we assume that f is unique-selecting and
0 ∈ dom f ⊆ ZN
+. (4.24)
Then C in (4.23) can be regarded as a choice function C : B → B.
The induced choice function C is obviously consistent for any valuation function f.
For persistence, M♮
-concavity plays an essential role. The following theorem of Eguchi et
al. (2003) can be obtained as a corollary of Theorem 4.7, since for unique-selecting valuation
functions, (SC1
[Z]) and (SC2
[Z]) are equivalent and both coincide with persistence.
Theorem 4.8. Every unique-selecting M♮
-concave function f : ZN
→ R ∪ {−∞} with (4.24)
induces a persistent choice function.
The size-monotonicity is also implied by M♮
-concavity (Murota and Yokoi 2015).
Theorem 4.9. Every unique-selecting M♮
-concave function f : ZN
→ R ∪ {−∞} with (4.24)
induces a size-monotone choice function.
Proof. The proof is based on the exchange property (4.15) in Remark 4.1. To prove by
contradiction, suppose that there exist x,y ∈ ZN
such that x ≥ y and |C(x; f)| < |C(y; f)|.
Set x∗
= C(x; f) and y∗
= C(y; f). Then |x∗
| < |y∗
|. By the exchange property (4.15) there
exists j ∈ supp−
(x∗
− y∗
) such that f(x∗
) + f(y∗
) ≤ f(x∗
+ χj) + f(y∗
− χj). Here we have
f(x∗
+χj) < f(x∗
) since x∗
+χj ≤ x by x∗
j < y∗
j ≤ yj ≤ xj and x∗
is the unique maximizer. We
also have f(y∗
− χj) < f(y∗
) since y∗
− χj ≤ y∗
≤ y and y∗
is the unique maximizer. This is a
contradiction. 
Thus, M♮
-concave valuation functions entail the three desired properties, consistency,
persistence, and size-monotonicity14
. Recall Remark 4.4 for the implications of this fact.
Theorem 4.10. For a unique-selecting M♮
-concave value function f : ZN
→ R ∪ {−∞} with
(4.24), the choice function C induced from f is consistent, persistent, and size-monotone.
Finally, we mention a theorem that characterizes M♮
-concavity in terms of a parametrized
version of (SC1
[Z]) and (SC2
[Z]). Recall from (4.20) the notation f[−p](x) = f(x)− p⊤
x for
p ∈ RN
and x ∈ ZN
. If f is an M♮
-concave function (not assumed to be unique-selecting),
f[−p] is also M♮
-concave, and hence is equipped with the properties (SC1
[Z]) and (SC2
[Z])
by Theorem 4.7. In other words, an M♮
-concave function f has the following properties.
(SC1
G[Z]) For any p ∈ RN
, f[−p] satisfies (SC1
[Z]).
(SC2
G[Z]) For any p ∈ RN
, f[−p] satisfies (SC2
[Z]).
Thefollowingtheorem, dueto Farooq and Shioura(2005), states that each ofthese conditions
characterizes M♮
-concavity.
Theorem 4.11. For a function f : ZN
→ R ∪ {−∞} with a bounded nonempty effective
domain, we have the equivalence: f is M♮
-concave ⇐⇒ (SC1
G[Z]) ⇐⇒ (SC2
G[Z]).
14
Theorem 4.10 can be extended to quasi M♮
-concave value functions; see Murota and Yokoi (2015).
244.5 Twisted M♮
-concavity
Let W be a subset of N. For any vector x ∈ ZN
we define tw(x) ∈ ZN
by specifying its ith
component tw(x)i as
tw(x)i =
(
xi (i ∈ N \ W),
−xi (i ∈ W).
(4.25)
A function f : ZN
→ R∪{−∞} is said to be a twisted M♮
-concave function with respect to W,
if the function ˜ f : ZN
→ R ∪ {−∞} defined by
˜ f(x) = f(tw(x)) (x ∈ ZN
) (4.26)
is an M♮
-concave function (Ikebe and Tamura 2015). The same concept has been introduced
by Shioura and Yang (2015), almost at the same time and independently, under the name of
GM-concave functions. Note that f is twisted M♮
-concave with respect to W if and only if it
is twisted M♮
-concave with respect to U = N \ W.
Mathematically, twisted M♮
-concavity is equivalent to the original M♮
-concavity through
twisting, and all the properties and theorems about M♮
-concave functions can be translated
into those about twisted M♮
-concave functions. In such translations it is often adequate to
define the twisted demand correspondence as15
D̃(p; f) = argmax
x
{f(x) − tw(p)⊤
x}. (4.27)
A twisted version of (GS&LAD′
[Z]) is introduced by Ikebe et al. (2015) as the general-
ized full substitutes (GFS[Z]) condition:
(GFS[Z]) (i) For any p ∈ RN
, D̃(p; f) is a discrete convex set16
.
(ii) For any p ∈ RN
, k ∈ U, δ > 0, and x ∈ D̃(p; f), there exists y ∈ D̃(p + δχk; f) such
that
xi ≤ yi (∀i ∈ U \ {k}), xi ≥ yi (∀i ∈ W), x(U) − x(W) ≥ y(U) − y(W). (4.28)
(iii) For any p ∈ RN
, k ∈ W, δ > 0, and x ∈ D̃(p; f), there exists y ∈ D̃(p −δχk; f) such
that
xi ≤ yi (∀i ∈ W \ {k}), xi ≥ yi (∀i ∈ U), x(W) − x(U) ≥ y(W) − y(U). (4.29)
The following theorem17
(Ikebe et al. 2015) characterizes twisted M♮
-concavity in terms of
this condition.
Theorem 4.12. Let f : ZN
→ R ∪ {−∞} be a concave-extensible18
function with a bounded
effective domain. Then f satisfies (GFS[Z]) if and only if it is a twisted M♮
-concave function
with respect to W.
15
Note: x ∈ D̃(p; f) ⇐⇒ tw(x) ∈ D(p; ˜ f).
16
That is, D̃(p; f) should coincide with the integer points contained in the convex hull of D̃(p; f).
17
Theorem4.12canbe understoodas a twisted versionof theequivalence“(GS&LAD′
[Z])⇔ (M♮
-EXC[Z])”
in Theorem 4.6.
18
The concave-extensibility of f is assumed here for the consistency with the statement of Theorem 4.6.
Mathematically,this assumptioncan be omitted,since the condition(i) in (GFS[Z])is equivalentto the concave-
extensibility of f and twisted M♮
-concave functions are concave-extensible. Similarly in Theorem 4.13.
25In the modeling of a trading network (supply chain network), where an agent is identified
withavertex(node)ofthenetwork, each vertex(agent)isassociatedwithavaluationfunction
f defined on the set of arcs incident to the vertex. Denoting the set of in-coming arcs to the
vertex by U and the set of out-going arcs from the vertex by W, the function f is defined on
U ∪W. Twisted M♮
-concave functions are used effectively in this context (Ikebe and Tamura
2015, Ikebe et al. 2015, Candogan et al. 2016). See Section 14.2.
With the use of the ordinary (un-twisted) demand correspondence
D(p; f) = argmax
x
{f(x) − p⊤
x}, (4.30)
a similar condition was formulated by Shioura and Yang (2015), independently of Ikebe et
al. (2015), to deal with economies with two classes of indivisible goods such that goods
in the same class are substitutable and goods across two classes are complementary. The
condition, called the generalized gross substitutes and complements (GGSC[Z]) condition,
reads as follows:
(GGSC[Z]) (i) For any p ∈ RN
, D(p; f) is a discrete convex set.
(ii) For any p ∈ RN
, k ∈ U, δ > 0, and x ∈ D(p; f), there exists y ∈ D(p + δχk; f) that
satisfies (4.28).
(iii) For any p ∈ RN
, k ∈ W, δ > 0, and x ∈ D(p; f), there exists y ∈ D(p + δχk; f) that
satisfies (4.29).
This condition also characterizes twisted M♮
-concavity (Shioura and Yang 2015).
Theorem 4.13. Let f : ZN
→ R ∪ {−∞} be a concave-extensible function with a bounded
effective domain. Then f satisfies(GGSC[Z]) if and onlyif it is a twisted M♮
-concave function
with respect to W.
Although Theorems 4.12 and 4.13 have significances in different contexts, they are in
fact two variants of the same mathematical statement. Note that (GSF[Z]) and (GGSC[Z])
are equivalent, since
D(p; f) = D̃(tw(p); f), tw(p + δχk) =
(
tw(p) + δχk (k ∈ U),
tw(p) − δχk (k ∈ W).
The multi-unit (or vector) version of the same-side substitutability (SSS) and the cross-
side complementarity (CSC) of Ostrovsky (2008) can be formulated for a correspondence
C : ZN
→ 2ZN
as follows, where, for any z ∈ ZN
, the subvector of z on U is denoted by
zU
∈ ZU
and similarly the subvector on W by zW
∈ ZW
.
(SSS-CSC1
[Z]) (i) For any z1,z2 ∈ ZN
with zU
1 ≥ zU
2 , zW
1 = zW
2 and C(z2) , ∅ and for any
x1 ∈ C(z1), there exists x2 ∈ C(z2) such that zU
2 ∧ xU
1 ≤ xU
2 and xW
1 ≥ xW
2 , and (ii) the
same statement with U and W interchanged.
(SSS-CSC2
[Z]) (i) For any z1,z2 ∈ ZN
with zU
1 ≥ zU
2 , zW
1 = zW
2 and C(z1) , ∅ and for any
x2 ∈ C(z2) there exists x1 ∈ C(z1), such that zU
2 ∧ xU
1 ≤ xU
2 and xW
1 ≥ xW
2 , and (ii) the
same statement with U and W interchanged.
The following theorem (Ikebe and Tamura 2015) states that these two properties are im-
plied by twisted M♮
-concavity. Recall from (4.23) that a valuation function f induces the
correspondence19
C(z) = C(z; f) = argmax{f(y) | y ≤ z} (z ∈ ZN
).
19
It may be that C(z) = ∅ if dom f is unboundedbelow or {y | y ≤ z} ∩dom f = ∅. The condition “C(z2) , ∅”
in (SSS-CSC1
[Z]), for example, takes care of this possibility.
26Theorem 4.14. For any twisted M♮
-concave function f : ZN
→ R ∪ {−∞}, the induced
correspondence C has the properties (SSS-CSC1
[Z]) and (SSS-CSC2
[Z]).
Proof. We prove (SSS-CSC1
[Z])-(i) and (SSS-CSC2
[Z])-(i); the proofs of (SSS-CSC1
[Z])-
(ii) and (SSS-CSC2
[Z])-(ii) are obtained by interchanging U and W. Assume zU
1 ≥ zU
2 , zW
1 =
zW
2 and C(z1; f) , ∅, and let ˜ f be the M♮
-concave function in (4.26) associated with f. For
x1 ≤ z1 and x2 ≤ z2 define
Φ(x1, x2) =
X
{(x1)i − (x2)i | i ∈ U ∩ supp+
((z2 ∧ x1) − x2)}
+
X
{(x2)i − (x1)i | i ∈ W ∩ supp+
(x2 − x1)}.
Proof of (SSS-CSC1
[Z])-(i): Let x1 ∈ C(z1; f) and take x2 ∈ C(z2; f) with Φ(x1, x2)
minimum. To prove by contradiction, suppose that there exists
i ∈ U ∩ supp+
((z2 ∧ x1) − x2)

∪ W ∩ supp+
(x2 − x1)

.
Then i ∈ supp+
(tw(x1) − tw(x2)), and (M♮
-EXC[Z]) for ˜ f implies that there exists j ∈
supp−
(tw(x1) − tw(x2)) ∪ {0} such that
˜ f(tw(x1)) + ˜ f(tw(x2)) ≤ ˜ f(tw(x1) − χi + χj) + ˜ f(tw(x2) + χi − χj).
Letting x̂1 = tw(tw(x1) − χi + χj)) and x̂2 = tw(tw(x2) + χi − χj)) we can express the above
inequality as
f(x1) + f(x2) ≤ f(x̂1) + f(x̂2).
By considering all possibilities (i ∈ U or i ∈ W, and j ∈ U or j ∈ W or j = 0), we
can verify that x̂1 ≤ z1 and x̂2 ≤ z2, from which follow f(x̂1) ≤ f(x1) and f(x̂2) ≤ f(x2)
since x1 ∈ C(z1; f) and x2 ∈ C(z2; f). Therefore, the inequalities are in fact equalities, and
x̂1 ∈ C(z1; f) and x̂2 ∈ C(z2; f). But we have Φ(x1, x̂2) = Φ(x1, x2) − 1, which contradicts the
choice of x2.
Proof of (SSS-CSC2
[Z])-(i): Let x2 ∈ C(z2; f) and take x1 ∈ C(z1; f) with minimum
Φ(x1, x2). Bythesameargumentasaboveweobtain x̂1 ∈ C(z1; f)withΦ(x̂1, x2) = Φ(x1, x2)−
1. This is a contradiction to the choice of x1. 
## 4.6 Examples
Here are some examples of M♮
-concave functions in integer variables.
1. A linear (or affine) function
f(x) = α + hp, xi (4.31)
with p ∈ RN
and α ∈ R is M♮
-concave if dom f is an M♮
-convex set.
2. A quadratic function f : ZN
→ R defined by
f(x) =
n X
i=1
n X
j=1
aijxixj (4.32)
with aij = aji ∈ R (i, j = 1,...,n) is M♮
-concave if and only if
aij ≤ 0 for all (i, j), and aij ≤ max(aik,ajk) if {i, j} ∩ {k} = ∅. (4.33)
The Hessian matrix Hf (x) = (Hij(x)) defined in (4.11) is given by Hij(x) = 2aij, and
(4.33) above is consistent with (4.12), (4.13) in Theorem 4.3.
273. A function f : ZN
→ R ∪ {−∞} is called separable concave if it can be represented as
f(x) =
X
i∈N
ϕi(xi) (x ∈ ZN
) (4.34)
for univariate concave functions20
ϕi : Z → R ∪ {−∞} (i ∈ N). A separable concave
function is M♮
-concave. In (4.4) for (M♮
-EXC[Z]) we can always take j = 0, i.e., (4.2).
4. A function f : ZN
→ R ∪ {−∞} is called laminar concave if it can be represented as
f(x) =
X
A∈T
ϕA(x(A)) (x ∈ ZN
) (4.35)
for a laminar family T ⊆ 2N
and a family of univariate concave functions ϕA : Z →
R ∪ {−∞} indexed by A ∈ T, where x(A) =
P
i∈A xi. A laminar concave function is
M♮
-concave; see Note 6.11 of Murota (2003) for a proof. A special case of (4.35) with
T = {{1},{2},...,{n}} reduces to the separable convex function (4.34).
5. M♮
-concave functions arise from the maximum weight of nonlinear network flows. Let
G = (V,A) be a directed graph with two disjoint vertex subsets S ⊆ V and T ⊆ V
specified as the entrance and the exit. Suppose that, for each arc a ∈ A, we are given a
univariate concave function ϕa : Z → R ∪ {−∞} representing the weight of flow on the
arc a. Let ξ ∈ ZA
be a vector representing an integer flow, and ∂ξ ∈ ZV
be the boundary
of flow ξ defined by
∂ξ(v) =
P
{ξ(a) | arc a leaves v } −
P
{ξ(a) | arc a enters v } (v ∈ V). (4.36)
Then, the maximum weight of a flow that realizes a supply/demand specification on the
exit T in terms of x ∈ ZT
is expressed by
f(x) = sup
ξ
X
a∈A
ϕa(ξ(a)) | (∂ξ)(v) = −x(v) (v ∈ T), (∂ξ)(v) = 0 (v ∈ V \ (S ∪ T)) ,
(4.37)
where no constraint is imposed on (∂ξ)(v) for entrance vertices v ∈ S. This function is
M♮
-concave, provided that f does not take the value+∞ and dom f is nonempty. If S =
∅, the function f is M-concave, since
P
v∈T x(v) = −
P
v∈T(∂ξ)(v) =
P
v∈V\T(∂ξ)(v) = 0
in this case. See Example 2.3 of Murota (1998) and Section 2.2.2 of Murota (2003) for
details. The maximum weight of a matching in (3.26) can be understood as a special
case of (4.37).
## 4.7 Concluding remarks of section 4
The concept of M-convex functions is formulated by Murota (1996c) as a generalization of
valuated matroids of Dress and Wenzel (1990, 1992). Then M♮
-convex functions are intro-
duced by Murota and Shioura (1999) as a variant of M-convex functions. Quasi M-convex
functions are introduced by Murota and Shioura (2003). The concept of M-convex functions
is extended to functions on jump systems by Murota (2006); see also Kobayashi et al. (2007).
Unimodularity is closely related to discrete convexity. For a fixed unimodular matrix U
we may consider a change of variables x 7→ Ux for x ∈ Zn
to define a class of functions
{f(Ux) | f : M♮
-concave} as a variant of M♮
-concave functions. Twisted M♮
-concave func-
tions(Section4.5)areatypicalexampleofthisconstructionwithU = diag(1,...,1,−1,...,−1);
see Sun and Yang (2008) and Section 14.5 for further discussion in this direction.
20
Recall that ϕ : Z → R ∪ {−∞} is called concave if ϕ(t − 1) + ϕ(t + 1) ≤ 2ϕ(t) for all integers t.
285 M♮
-concave Function on Rn
In Sections 3 and 4, we have considered M♮
-concave functions on 2N
and ZN
, which corre-
spond to valuations for indivisible goods with substitutability. In this section we deal with
M♮
-concave functions in real vectors, f : RN
→ R∪{−∞}, which correspond to valuations for
divisible goods with substitutability. M♮
-concave functions in real variables are investigated
by Murota and Shioura (2000, 2004a, 2004b).
## 5.1 Exchange property
We say that a function f : RN
→ R ∪ {−∞} is M♮
-concave if it is a concave function (in the
ordinary sense) that satisfies
(M♮
-EXC[R]) For any x,y ∈ RN
and i ∈ supp+
(x − y), there exist j ∈ supp−
(x − y) ∪ {0} and
a positive number α0 ∈ R++ such that
f(x) + f(y) ≤ f(x − α(χi − χj)) + f(y + α(χi − χj)) (5.1)
for all α ∈ R with 0 ≤ α ≤ α0.
In the following we restrict ourselves to closed proper21
M♮
-concave functions, for which
the closure of the effective domain dom f is a well-behaved polyhedron (g-polymatroid, or
M♮
-convex polyhedron22
); see Theorem 3.2 of Murota and Shioura (2008). Often we are
interested in polyhedral M♮
-concave functions.
Remark 5.1. It follows from (M♮
-EXC[R]) that M♮
-concave functions enjoy the following
exchange properties under size constraints:
• For any x,y ∈ RN
with x(N) < y(N), there exists α0 ∈ R++ such that
f(x) + f(y) ≤ max
j∈supp−(x−y)
{f(x + αχj) + f(y − αχj)} (5.2)
for all α ∈ R with 0 ≤ α ≤ α0.
• For any x,y ∈ RN
with x(N) = y(N) and i ∈ supp+
(x − y), there exists α0 ∈ R++ such that
f(x) + f(y) ≤ max
j∈supp−(x−y)
{f(x − α(χi − χj)) + f(y + α(χi − χj))} (5.3)
for all α ∈ R with 0 ≤ α ≤ α0.
Remark 5.2. If dom f ⊆ RN
lies in a hyperplane with a constant component sum (i.e.,
x(N) = y(N) for all x,y ∈ dom f), the exchange property (M♮
-EXC[R]) takes a simpler
form excluding the possibility of j = 0. A function f : RN
→ R∪{−∞} having this exchange
property is called an M-concave function. That is, a concave function f is M-concave if and
only if (5.3) holds.
21
A concave function f : Rn
→ R ∪ {−∞} is said to be proper if dom f is nonempty, and closed if the
hypograph{(x,β) ∈ Rn+1
| β ≤ f(x)} is a closed subset of Rn+1
.
22
A polyhedron P is called an M♮
-convex polyhedron if its (concave) indicator function f is M♮
-concave,
where f(x) = 0 for x ∈ P and = −∞ for x < P. See Section 4.8 of Murota (2003) for details.
295.2 Maximizers and gross substitutability
For p ∈ RN
we denote the set of the maximizers of f[−p](x) = f(x) − p⊤
x by D(p; f) ⊆ RN
(cf. (4.21)). M♮
-concavity of a function f is characterized by the M♮
-convexity of D(p; f)
(Theorem 5.2 of Murota and Shioura 2000).
Theorem 5.1. A polyhedral concave function f : RN
→ R ∪ {−∞} is M♮
-concave if and only
if, for every vector p ∈ RN
, D(p; f) is an M♮
-convex polyhedron23
.
(GS[R]) For any p,q ∈ RN
with p ≤ q and x ∈ D(p; f), there exists y ∈ D(q; f) such that
xi ≤ yi for all i ∈ N with pi = qi.
The following theorem is given by Danilov et al. (2003).
Theorem 5.2. ApolyhedralM♮
-concavefunction f : RN
→ R∪{−∞} withaboundedeffective
domain satisfies (GS[R]).
Proof. This follows from Theorem 7.5 (2) and Theorem 7.7 in Section 7.2. 
Example 5.1. Here is an example to show that (GS[R]) does not imply M♮
-concavity. Let
f : R2
→ R be defined by f(x1, x2) = min(2, x1 + 2x2) on dom f = R2
. This function is
not M♮
-concave because (M♮
-EXC[R]) fails for x = (2,0), y = (0,1) and i = 1. However, it
satisfies (GS[R]), which can be verified easily. Thus the converse of Theorem 5.2 does not
hold.
## 5.3 Choice function
In Theorem 4.10 in Section 4.4 we have seen, for the multi-unit indivisible goods, the choice
function induced from a unique-selecting M♮
-concave value function is consistent, persistent,
and size-monotone in the sense of Alkan and Gale (2003). In this section we point out that
this is also the case with divisiblegoods; recall Remark 4.4 in Section 4.4 for the implications
of this fact.
For a choice functionC : B → B with B = {x ∈ RN
+ | x ≤ b} for some b ∈ RN
+, consistency
means [ C(x) ≤ y ≤ x ⇒ C(y) = C(x) ], persistence means [ x ≥ y ⇒ y ∧ C(x) ≤ C(y) ], and
size-monotonicity means [ x ≥ y ⇒ |C(x)| ≥ |C(y)| ], where |C(x)| =
P
i∈N C(x)i (sum of the
components).
Theorem 5.3. For a unique-selecting M♮
-concave value function f : RN
→ R ∪ {−∞} with
0 ∈ dom f ⊆ RN
+, the induced choice function C(x; f) = argmax{f(y) | y ≤ x} is consistent,
persistent, and size-monotone24
.
Proof. The consistency is obvious from the definition of C(x; f).
To prove persistence25
by contradiction, suppose that y ∧C(x; f) ≤ C(y; f) fails for some
x,y ∈ RN
with x ≥ y. Set x∗
= C(x; f), y∗
= C(y; f). Since y∧ x∗
≤ y∗
fails, there exists some
i ∈ N such that yi ∧ x∗
i > y∗
i . Then i ∈ supp+
(x∗
− y∗
). We apply (M♮
-EXC[R]) to x∗
,y∗
and i,
to obtain j ∈ supp−
(x∗
− y∗
) ∪ {0} and α0 > 0 such that
f(x∗
) + f(y∗
) ≤ f(x∗
− α(χi − χj)) + f(y∗
+ α(χi − χj)) (5.4)
23
See the footnote 22.
24
As in Section 4.4, f is said to be unique-selecting if C(x; f) consists of a single element for every x.
25
This proof for persistence is an adaptation of the one in Lemma 3.3 of Murota and Yokoi (2015).
30for all α with 0 < α ≤ α0. For sufficiently small α > 0 we also have x∗
− α(χi − χj) ≤ x and
y∗
+ α(χi − χj) ≤ y; the former follows from x∗
j < y∗
j ≤ yj ≤ xj for j ∈ supp−
(x∗
− y∗
), and the
latter from y∗
i < yi∧x∗
i ≤ yi. On the right-hand side of (5.4), we have f(x∗
−α(χi−χj)) < f(x∗
)
since x∗
− α(χi − χj) ≤ x and x∗
= C(x; f) is the unique maximizer of f in {z ∈ RN
| z ≤ x},
and similarly, f(y∗
+ α(χi − χj)) < f(y∗
). This is a contradiction, proving persistence.
To prove size-monotonicity by contradiction, suppose that there exist x,y ∈ RN
such
that x ≥ y and |C(x; f)| < |C(y; f)|. Set x∗
= C(x; f) and y∗
= C(y; f). Then |x∗
| < |y∗
|.
By the exchange property (5.2) in Remark 5.1, there exists j ∈ supp−
(x∗
− y∗
) such that
f(x∗
) + f(y∗
) ≤ f(x∗
+ αχj) + f(y∗
− αχj) for sufficiently small α > 0. Here we have
f(x∗
+ αχj) < f(x∗
) since x∗
+ αχj ≤ x by x∗
j < y∗
j ≤ yj ≤ xj and x∗
is the unique maximizer.
We also have f(y∗
− αχj) < f(y∗
) since y∗
− αχj ≤ y∗
≤ y and y∗
is the unique maximizer.
This is a contradiction, proving size-monotonicity. 
## 5.4 Examples
Here are some examples of M♮
-concave functions in real variables.
1. A function f : RN
→ R ∪ {−∞} is called laminar concave if it can be represented as
f(x) =
X
A∈T
ϕA(x(A)) (x ∈ RN
) (5.5)
for a laminar family T ⊆ 2N
and a family of univariate (closed proper) concave func-
tions ϕA : R → R ∪ {−∞} indexed by A ∈ T, where x(A) =
P
i∈A xi. A laminar concave
function is M♮
-concave.
2. M♮
-concave functions arise from the maximum weight of nonlinear network flows. Let
G = (V,A) be a directed graph with two disjoint vertex subsets S ⊆ V and T ⊆ V
specified as the entrance and the exit. Suppose that, for each arc a ∈ A, we are given
a univariate (closed proper) concave function ϕa : R → R ∪ {−∞} representing the
weight of flow on the arc a. Let ξ ∈ RA
be a vector representing a flow, and ∂ξ ∈ RV
be the boundary of flow ξ defined by (4.36). Then, the maximum weight of a flow that
realizes a supply/demand specification on the exit T in terms of x ∈ RT
is expressed by
a function f : RT
→ R∪{−∞} defined as (4.37). This function is M♮
-concave, provided
that f does not take the value +∞ and dom f is nonempty. If S = ∅, the function f
is M-concave. See Section 2.2.1 of Murota (2003) and Theorem 2.10 of Murota and
Shioura (2004a) for details.
## 5.5 Concluding remarks of section 5
TheconceptofM-concavefunctionsin continuousvariablesisintroducedforpolyhedralcon-
cave functions by Murota and Shioura (2000) and for general concave functions by Murota
and Shioura (2004a). This is partly motivated by a phenomenon inherent in the network
flow/tension problem described in Section 5.4.
316 Operations for M♮
-concave Functions
## 6.1 Basic operations
Basic operations on M♮
-concave functions on Zn
are presented here, whereas the most pow-
erful operation, transformation by networks, is treated in Section 6.2.
M♮
-concave functions admit the following operations.
Theorem 6.1. Let f, f1, f2 : ZN
→ R ∪ {−∞} be M♮
-concave functions.
(1) For nonnegative α ∈ R+ and β ∈ R, αf(x) + β is M♮
-concave in x.
(2) For a ∈ ZN
, f(a − x) and f(a + x) are M♮
-concave in x.
(3) For p ∈ RN
, f[−p] is M♮
-concave, where f[−p] is defined by (4.20).
(4) For univariate concave functions ϕi : Z → R ∪ {−∞} indexed by i ∈ N,
˜ f(x) = f(x) +
X
i∈N
ϕi(xi) (x ∈ ZN
) (6.1)
is M♮
-concave, provided dom ˜ f , ∅.
(5) For a ∈ (Z ∪ {−∞})N
and b ∈ (Z ∪ {+∞})N
, the restriction of f to the integer interval
[a,b]Z = {x ∈ ZN
| a ≤ x ≤ b} defined by
f[a,b]Z
(x) =
(
f(x) (x ∈ [a,b]Z),
−∞ (x < [a,b]Z)
(6.2)
is M♮
-concave, provided dom f[a,b]Z
, ∅.
(6) For U ⊆ N, the restriction of f to U defined by
fU(y) = f(y,0N\U) (y ∈ ZU
) (6.3)
is M♮
-concave, provided dom fU , ∅, where 0N\U means the zero vector in ZN\U
.
(7) For U ⊆ N, the projection of f to U defined by
fU
(y) = sup{f(y,z) | z ∈ ZN\U
} (y ∈ ZU
) (6.4)
is M♮
-concave, provided fU
< +∞.
(8) For U ⊆ N, the function ˜ f defined by
˜ f(y,w) = sup{f(y,z) | z(N \ U) = w,z ∈ ZN\U
} (y ∈ ZU
,w ∈ Z) (6.5)
is M♮
-concave, provided ˜ f < +∞.
(9) Integer (supremal) convolution f1 f2 : ZN
→ R ∪ {−∞,+∞} defined by
(f1 f2)(x) = sup{f1(x1) + f2(x2) | x = x1 + x2, x1, x2 ∈ ZN
} (x ∈ ZN
) (6.6)
is M♮
-concave, provided (f1 f2) < +∞.
Proof. See Theorem 6.15 of Murota (2003) for the proofs of (1) to (8). In view of the im-
portance of convolution operations we give a straightforward alternative proof of (9) in Re-
mark 6.2. 
Remark 6.1. Theorem 6.1 (9) for M♮
-concavity of convolutions has an implication of great
economic significance. Suppose that U1,U2,...,Uk represent utility functions. Then the
aggregated utility is given by their convolution U1U2···Uk. Theorem 6.1 (9) means that
substitutability is preserved in this aggregation operation.
32Remark 6.2. A proof for M♮
-concavity of the convolution (6.6) is given here26
. Let f1 and
f2 be M♮
-concave functions, and f = f1 f2. First we treat the case where dom f1 and dom f2
are bounded. Then dom f = dom f1 +dom f2 (Minkowski sum) is bounded. For each p ∈ RN
we have f[−p] = (f1[−p])(f2[−p]), from which follows
argmax(f[−p]) = argmax(f1[−p]) + argmax(f2[−p]).
In this expression, both argmax(f1[−p]) and argmax(f2[−p]) are M♮
-convex sets by Theo-
rem 4.5 (only if part), and therefore, their Minkowski sum (the right-hand side) is M♮
-convex
(Theorem 4.23 of Murota 2003). This means that argmax(f[−p]) is M♮
-convex for each
p ∈ RN
, which implies the M♮
-concavity of f by Theorem 4.5 (if part).
The general case withouttheboundednessassumptionon effectivedomainscan be treated
via limiting procedure as follows. For l = 1,2 and k = 1,2,..., define f(k)
l : ZN
→ R ∪ {−∞}
by
f(k)
l (x) =
(
fl(x) if kxk∞ ≤ k
−∞ otherwise,
which is an M♮
-concave function with a bounded effective domain, provided that k is large
enough to ensure dom f(k)
l , ∅. For each k, the convolution f(k)
= f(k)
1  f(k)
2 is M♮
-concave by
the above argument, and moreover, limk→∞ f(k)
(x) = f(x) for each x. It remains to demon-
strate the property (M♮
-EXC[Z]) for f. Take x,y ∈ dom f and i ∈ supp+
(x − y). There exists
k0 = k0(x,y), depending on x and y, such that x,y ∈ dom f(k)
for every k ≥ k0. Since f(k)
is
M♮
-concave, there exists jk ∈ supp−
(x − y) ∪ {0} such that
f(k)
(x) + f(k)
(y) ≤ f(k)
(x − χi + χjk
) + f(k)
(y + χi − χjk
).
Sincesupp−
(x−y)∪{0} isafiniteset, atleast oneelementofsupp−
(x−y)∪{0} appears infinitely
many times in the sequence {jk | k ≥ k0}. More precisely, there exists j ∈ supp−
(x − y) ∪ {0}
and an increasing subsequence k(1) < k(2) < ··· such that jk(t) = j for t = 1,2,.... By letting
k → ∞ along this subsequence in the above inequality we obtain
f(x) + f(y) ≤ f(x − χi + χj) + f(y + χi − χj).
Thus f = f1 f2 satisfies (M♮
-EXC[Z]), which proves Theorem 6.1 (9).
Remark 6.3. A sum of M♮
-concave functions is not necessarily M♮
-concave. This implies,
in particular, that an M♮
-concave function does not necessarily remain M♮
-concave when its
effective domain is restricted to an M♮
-convex set. For example27
, let S1 = S0 ∪ {(0,1,1)}
and S2 = S0 ∪ {(1,1,0)} with S0 = {(0,0,0),(1,0,0),(0,1,0),(0,0,1),(1,0,1)}, and let fi :
Z3
→ R ∪ {−∞} be the (concave) indicator function28
of Si for i = 1,2. Then f1 + f2 is the
indicator function of S1 ∩ S2 = S0. Here S1 and S2 are M♮
-convex sets, whereas S0 is not29
.
Accordingly, f1 and f2 are M♮
-concave functions, but their sum f1 + f2 is not M♮
-concave.
Functions represented as a sum of two M♮
-concave functions are an intriguing mathematical
object, investigated under the name of M
♮
2-concave function in Section 8.3 of Murota (2003).
26
This proof is an adaptation of the proof (Murota 2004b) for M-convex functions to M♮
-concave functions.
See Note 9.30 of Murota (2003) for another proof using a network transformation.
27
This example is a reformulation of Note 4.25 of Murota (2003) for M-convex functions to M♮
-concave
functions.
28
fi(x) = 0 for x ∈ Si and = −∞ for x < Si.
29
(B♮
-EXC[Z]) fails for S0 with x = (1,0,1), y = (0,1,0), and i = 1.
33S
g(z)
T
f(x)
✲
❥
✲
✯
s
q
✶
❥
◆
✕
✶
✲
❥
✣
❃
✲
❖
❲
ϕa(ξ(a))
S T
M g(Z) f(X)
w
Figure 3: Transformation by a network and a bipartite graph
Remark 6.4. For a function f : Zn
→ R ∪ {−∞} and a positive integer α, the function fα
:
Zn
→ R ∪ {−∞} defined by fα
(x) = f(αx) (x ∈ Zn
) is called a domain scaling of f. If α = 2,
for instance, this amounts to considering the function values only on vectors of even integers.
Scaling is one of the common techniques used in designing efficient algorithms and this is
particularly true of network flow algorithms. Unfortunately, M♮
-concavity is not preserved
under scaling. For example30
, let f be the indicator function of a set S = {c1(1,0,−1) +
c2(1,0,0) + c3(0,1,−1) + c4(0,1,0) | ci ∈ {0,1}} ⊆ Z3
. This f is an M♮
-concave function, but
f2
(=fα
with α = 2), being the indicator function of {(0,0,0),(1,1,−1)}, is not M♮
-concave.
Nevertheless, scaling of an M♮
-concave function is useful in designing efficient algorithms
(Section 10.1 of Murota 2003). It is worth mentioning that some subclasses of M♮
-concave
functions are closed under scaling operation; linear, quadratic, separable, and laminar M♮
-
concave functions, respectively, form such subclasses.
Remark 6.5. A class of set functions, named matroid-based valuations, is defined by Ostro-
vsky and Paes Leme (2015) with the use of the convolution operation as well as the contrac-
tionoperation. Forsetfunctions f1, f2 : 2N
→ R∪{−∞}, theconvolutionof f1 and f2 isdefined
by (f1 f2)(X) = maxY⊆X(f1(Y)+ f2(X \Y)) for X ⊆ N. For a set function f : 2N
→ R∪{−∞}
and a subset T of N, the contractionof T is defined as fT(X) = f(X∪T)− f(T) for X ⊆ N\T.
A set function f is said to be a matroid-based valuation, if it can be constructed by repeated
application of convolution and contraction to weighted matroid valuations (3.25). By Theo-
rem 6.1, matroid-based valuations are M♮
-concave functions. It is conjectured in Ostrovsky
and Paes Leme (2015) that every M♮
-concave function is a matroid-based valuation.
## 6.2 Transformation by networks
M♮
-concave functions can be transformed through networks. Let G = (V,A) be a directed
graph with two disjoint vertex subsets S ⊆ V and T ⊆ V specified as the entrance and the exit
(Fig. 3, left). Suppose that, for each arc a ∈ A, we are given a univariate concave function
ϕa : Z → R ∪ {−∞} representing the weight of flow on the arc a. Let ξ ∈ ZA
be a vector
representing a flow, and ∂ξ ∈ ZV
be the boundary of flow ξ defined by (4.36).
Given a function g : ZS
→ R∪{−∞} on the entrance set S, we define a function f : ZT
→
R ∪ {−∞,+∞} on the exit set T by
f(x) = sup
ξ,z
{g(z)+
X
a∈A
ϕa(ξ(a)) | ξ ∈ ZA
,∂ξ = (z,−x,0) ∈ ZS
×ZT
×ZV\(S∪T)
} (x ∈ ZT
). (6.7)
30
This example is a reformulation of Note 6.18 of Murota (2003) for M-convex functions to M♮
-concave
functions.
34This function f(x) represents the maximum weight to meet the demand specification x at the
exit, subject to the flow conservation at the vertices not in S ∪ T. The weight consists of two
parts, the weight g(z) of supply z at the entrance S and the weight
P
a∈A ϕa(ξ(a)) in the arcs.
We can regard (6.7) as a transformation of g to f by the network. If the given function
g is M♮
-concave, the resultant function f is also M♮
-concave, provided that f does not take
the value +∞ and dom f is nonempty. In other words, the transformation (6.7) by a network
preserves M♮
-concavity. See Section 9.6 of Murota (2003) for a proof. An alternative proof
is given by Kobayashi et al. (2007).
In particular, an M♮
-concave set function is transformed to another M♮
-concave set func-
tion through a bipartite graph (Fig. 3, right). Let G = (S,T;E) be a bipartite graph with
vertex bipartition (S,T) and edge set E, with weight we ∈ R associated with each edge e ∈ E.
Given an M♮
-concave set function g : 2S
→ R ∪ {−∞} on S, define a set function f on T by
f(X) = max{g(Z) + w(M) | M is a matching, S ∩ ∂M = Z, T ∩ ∂M = X} (X ⊆ T), (6.8)
where f(X) = −∞ if no such M exists for X. If g is M♮
-concave, then f is also M♮
-concave,
as long as dom f is nonempty. A proof tailored to set functions is given in the proof of
Theorem 5.2.18 of Murota (2000a).
## 6.3 Concluding remarks of section 6
Efficient algorithms are available for the operations listed in Theorem 6.1. In particular, the
convolution (6.6), corresponding to the aggregation of utility functions, can be computed
efficiently (Murota and Tamura 2003b). The transformation by networks is also accompanied
by efficient algorithms. For M♮
-concave function maximizationalgorithms, see Chapter 10 of
Murota (2003), and more recent papers, e.g., Shioura (2004), Tamura (2005), Murota (2010),
Moriguchi et al. (2011), Fujishige et al. (2015), and Shioura (2015).
7 Conjugacy and L♮
-convexity
Conjugacy under the Legendre transformation is one of the most appealing facts in convex
analysis. This is also the case in discrete convex analysis. The conjugacy theorem in discrete
convex analysis says that the Legendre transformation gives a one-to-one correspondence be-
tween M♮
-concave functions and L♮
-convex functions. Since M♮
-concavity expresses substi-
tutability of valuation or utility functions, L♮
-convexity characterizes substitutability in terms
of indirect utility functions. This fact has a significant application to auction theory, to be
expounded in Section 8.
7.1 L♮
-convex function
The concept of L♮
-convexity is defined for functions in discrete (integer) variables and for
those in continuous (real) variables. We start with discrete variables.
L♮
-convex function on Zn
: First recall that a function g : Zn
→ R∪{+∞} is called submod-
ular if
g(p) + g(q) ≥ g(p ∨ q) + g(p ∧ q) (p,q ∈ Zn
), (7.1)
35where p ∨ q and p ∧ q mean the vectors of componentwise maximum and minimum of p
and q, respectively. To define L♮
-convexity of g, we consider a function g̃ in n + 1 variables
(p0, p) = (p0, p1,..., pn) defined as
g̃(p0, p) = g(p − p01) (p0 ∈ Z, p ∈ Zn
), (7.2)
where 1 = (1,1,...,1). Then we say that g : Zn
→ R ∪ {+∞} is L♮
-convex if the associated
function g̃ : Zn+1
→ R ∪ {+∞} is a submodular function in (p0, p), i.e., if
g(p−p01)+g(q−q01) ≥ g((p∨q)−(p0 ∨q0)1)+g((p∧q)−(p0 ∧q0)1) (p0,q0 ∈ Z, p,q ∈ Zn
).
(7.3)
Remark 7.1. The significance of the extra variable p0 in the definition of L♮
-convexity is
most transparent when n = 1. When n = 1 we have (p∨q, p∧q) = (p,q) or (q, p), according
to whether p ≥ q or p ≤ q. Hence the submodular inequality (7.1) is always satisfied, and
every function g : Z → R ∪ {+∞} is submodular. On the other hand, the inequality (7.3) for
(p0, p) = (1,t) and (q0,q) = (0,t +1) yields g(t −1)+g(t +1) ≥ 2g(t) for t ∈ Z, which shows
the convexity of g on Z. The converse is also true. Therefore, a function g : Z → R ∪ {+∞}
is L♮
-convex if and only if g(t − 1) + g(t + 1) ≥ 2g(t) for all t ∈ Z.
Remark 7.2. For a set function µ : 2N
→ R ∪ {+∞}, L♮
-convexity is equivalent to submod-
ularity (3.8). Recall the notation χX for the characteristic vector of a subset X; see (2.1). A
set function µ can be identified with a function g : ZN
→ R ∪ {+∞} with domg ⊆ {0,1}N
by
µ(X) = g(χX) for X ⊆ N, and µ is submodular if and only if the corresponding g is L♮
-convex.
Remark 7.3. Matroid rank functions have a dual character of being both L♮
-convex and
M♮
-concave. It is L♮
-convex as it is submodular, and M♮
-concave as already mentioned in
Section 3.6.
L♮
-convexitycanbecharacterized byanumberofequivalentconditions(FavatiandTardella
1990, Fujishige and Murota 2000, Murota 2003).
Theorem 7.1. For g : Zn
→ R ∪ {+∞} the following conditions, (a) to (d), are equivalent:
(a) L♮
-convexity, i.e., (7.3).
(b) Translation-submodularity31
:
g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1)) (∀p,q ∈ Zn
,∀α ∈ Z+). (7.4)
(c) Discrete midpoint convexity:
g(p) + g(q) ≥ g
p + q
2

+ g
p + q
2

(p,q ∈ Zn
), (7.5)
where ⌈·⌉ and ⌊·⌋ denote the integer vectors obtained by componentwise rounding-up and
rounding-down to the nearest integers, respectively.
(d) For any p,q ∈ Zn
with supp+
(p − q) , ∅, it holds that32
g(p) + g(q) ≥ g(p − χA) + g(q + χA), (7.6)
where A = argmax
i
{pi − qi}.
31
This condition is labeled as (SBF♮
[Z]) in Section 7.1 of Murota (2003). Note that α is restricted to be
nonnegative,and the inequality (7.4) for α = 0 coincides with submodularity (7.1).
32
This condition is labeled as (L♮
-APR[Z]) in Section 7.2 of Murota (2003). Recall the notation χA for the
characteristic vector of A, as defined in (2.1).
36It is known (Theorem 7.20 of Murota 2003) that an L♮
-convex function g : Zn
→ R ∪
{+∞} is convex-extensible, i.e., there exists a convex function g : Rn
→ R ∪ {+∞} such that
g(p) = g(p) for all p ∈ Zn
. Moreover, the convex extension g can be constructed by a simple
procedure; see Theorem 7.19 of Murota (2003).
Remark 7.4. A nonempty set P ⊆ Zn
is called an L♮
-convex set if its indicator function33
is
an L♮
-convex function. In other words, P , ∅ is an L♮
-convex set if it satisfies one of the
following equivalent conditions, where p,q ∈ Zn
and p0,q0 ∈ Z:
(a) p − p01, q − q01 ∈ P =⇒ (p ∨ q) − (p0 ∨ q0)1, (p ∧ q) − (p0 ∧ q0)1 ∈ P.
(b) p,q ∈ P, α ∈ Z+ =⇒ (p − α1) ∨ q, p ∧ (q + α1) ∈ P.
(c) p,q ∈ P =⇒
lp+q
2
m
,
jp+q
2
k
∈ P.
(d) p,q ∈ P, supp+
(p − q) , ∅ =⇒ p − χA, q + χA ∈ P with A = argmax
i
{pi − qi}.
For an L♮
-convex function g, the effective domain domg and the set of minimizers argming
are L♮
-convex sets. See Section 5.5 of Murota (2003) for more about L♮
-convex sets.
Remark7.5. A functiong : Zn
→ R∪{+∞}iscalledan L-convexfunctionifitisan L♮
-convex
function such that there exists r ∈ R for which g(p + 1) = g(p) + r for all p ∈ Zn
. L-convex
functions and L♮
-convex functions are equivalent concepts, in that L♮
-convex functions in n
variables can be identified, up to the constant r, with L-convex functions in n + 1 variables.
Indeed, a function g : Zn
→ R ∪ {+∞} is L♮
-convex if and only if the function g̃ : Zn+1
→
R ∪ {+∞} in (7.2) is an L-convex function (with r = 0).
L♮
-convex function on Rn
: We turn to continuous variables. A function g : Rn
→ R∪{+∞}
is said to be L♮
-convex if it is a convex function (in the ordinary sense) such that g̃(p0, p) =
g(p − p01) (p0 ∈ R, p ∈ Rn
) is a submodular function in n + 1 variables, i.e.,
g(p−p01)+g(q−q01) ≥ g((p∨q)−(p0∨q0)1)+g((p∧q)−(p0∧q0)1) (p0,q0 ∈ R, p,q ∈ Rn
).
(7.7)
In the following we restrict ourselves to closed proper L♮
-convex functions34
, for which
the closure of the effective domain domg is a well-behaved polyhedron (L♮
-convex poly-
hedron35
); see Theorem 3.3 of Murota and Shioura (2008). For a closed proper convex func-
tion g : Rn
→ R ∪ {+∞}, the condition (7.7) for L♮
-convexity is equivalent to translation-
submodularity:
g(p) + g(q) ≥ g((p − α1) ∨ q) + g(p ∧ (q + α1)) (∀p,q ∈ Rn
,∀α ∈ R+). (7.8)
Often we are interested in polyhedral L♮
-convex functions.
L♮
-convex functions in real variables are investigated by Murota and Shioura (2000,
2004a, 2004b, 2008).
33
g(p) = 0 for p ∈ P and = +∞ for p < P.
34
A convex function g : Rn
→ R∪{+∞} is said to be proper if domg is nonempty,and closed if the epigraph
{(p,α) ∈ Rn+1
| α ≥ g(p)} is a closed subset of Rn+1
.
35
A polyhedron is called an L♮
-convex polyhedron if its (convex) indicator function is L♮
-convex. See Sec-
tion 5.6 of Murota (2003) for details.
377.2 Conjugacy
Functions in continuous variables: For a function f : Rn
→ R ∪ {+∞} (not necessarily
convex) with dom f , ∅, the convex conjugate f•
: Rn
→ R ∪ {+∞} is defined by
f•
(p) = sup{hp, xi − f(x) | x ∈ Rn
} (p ∈ Rn
), (7.9)
where hp, xi =
Pn
i=1 pixi is the inner product of p = (pi) ∈ Rn
and x = (xi) ∈ Rn
. The
function f•
is also referred to as the (convex) Legendre(–Fenchel) transform of f, and the
mapping f 7→ f•
as the (convex) Legendre(–Fenchel) transformation. A fundamental theo-
rem in convex analysis states that the Legendre transformation gives a symmetric one-to-one
correspondence in the class of all closed proper convex functions. That is, for a closed proper
convex function f, the conjugate function f•
is a closed proper convex function and the bi-
conjugacy (f•
)•
= f holds.
To formulate the correspondence between concave functions f : Rn
→ R ∪ {−∞} and
convex functions g : Rn
→ R ∪ {+∞} with dom f , ∅ and domg , ∅, we introduce the
following variants of the transformation (7.9):
f▽
(p) = sup{f(x) − hp, xi | x ∈ Rn
} (p ∈ Rn
), (7.10)
g△
(x) = inf{g(p) + hp, xi | p ∈ Rn
} (x ∈ Rn
), (7.11)
where f▽
: Rn
→ R ∪ {+∞} and g△
: Rn
→ R ∪ {−∞}. The biconjugacy is expressed
as (f▽
)△
= f, (g△
)▽
= g for closed proper concave functions f and closed proper convex
functions g.
Theorem 7.2.
(1) The transformations (7.10) and (7.11) give a one-to-one correspondence between the
classes of all closed proper concave functions f and closed proper convex functions g.
(2) For a closed proper concave function f : Rn
→ R ∪ {−∞}, the conjugate function f▽
:
Rn
→ R ∪ {+∞} is a closed proper convex function and (f▽
)△
= f.
(3) For a closed proper convex function g : Rn
→ R∪{+∞}, the conjugatefunction g△
: Rn
→
R ∪ {−∞} is a closed proper concave function and (g△
)▽
= g.
Addition of combinatorial ingredients to the above theorem yields the conjugacy theorem
between M♮
-concave and L♮
-convex functions (Murota and Shioura 2004a).
Theorem 7.3.
(1) The transformations (7.10) and (7.11) give a one-to-one correspondence between the
classes of all closed proper M♮
-concave functions f and closed proper L♮
-convex functions g.
(2) For a closed proper M♮
-concave function f : Rn
→ R ∪ {−∞}, the conjugate function
f▽
: Rn
→ R ∪ {+∞} is a closed proper L♮
-convex function and (f▽
)△
= f.
(3) For a closed proper L♮
-convex function g : Rn
→ R ∪ {+∞}, the conjugate function
g△
: Rn
→ R ∪ {−∞} is a closed proper M♮
-concave function and (g△
)▽
= g.
The M♮
/L♮
-conjugacy is also valid for polyhedral concave/convex functions (Murota and
Shioura 2000, Theorem 8.4 of Murota 2003).
Theorem 7.4.
(1) The transformations (7.10) and (7.11) give a one-to-one correspondence between the
classes of all polyhedral M♮
-concave functions f and polyhedral L♮
-convex functions g.
38(2) For a polyhedral M♮
-concave function f : Rn
→ R ∪ {−∞}, the conjugate function f▽
:
Rn
→ R ∪ {+∞} is a polyhedral L♮
-convex function and (f▽
)△
= f.
(3) For a polyhedral L♮
-convex function g : Rn
→ R ∪ {+∞}, the conjugate function g△
:
Rn
→ R ∪ {−∞} is a polyhedral M♮
-concave function and (g△
)▽
= g.
As corollaries oftheconjugacytheorems, thefollowingcharacterizations of M♮
-concavity
and L♮
-convexity in terms of the conjugate functions are obtained.
Theorem 7.5.
(1) A function f : Rn
→ R ∪ {−∞} is closed proper M♮
-concave if and only if the conjugate
function f▽
: Rn
→ R ∪ {+∞} by (7.10) is closed proper L♮
-convex.
(2) A function f : Rn
→ R ∪ {−∞} is polyhedral M♮
-concave if and only if the conjugate
function f▽
: Rn
→ R ∪ {+∞} by (7.10) is polyhedral L♮
-convex.
Theorem 7.6.
(1) A function g : Rn
→ R ∪ {+∞} is closed proper L♮
-convex if and only if the conjugate
function g△
: Rn
→ R ∪ {−∞} by (7.11) is closed proper M♮
-concave.
(2) A function g : Rn
→ R∪{+∞} is polyhedralL♮
-convex if and only if the conjugatefunction
g△
: Rn
→ R ∪ {−∞} by (7.11) is polyhedral M♮
-concave.
L♮
-convexity, being equivalent to translation-submodularity, is a stronger property than
mere submodularity. When we replace L♮
-convexity of f▽
in Theorem 7.5 (2) with submodu-
larity, we obtain a larger class of polyhedral concave functions f than M♮
-concave functions.
The following theorem is ascribed to Danilov and Lang (2001) in Danilov et al. (2003); see
also Appendix of Shioura and Tamura (2015) for technical supplements.
Theorem 7.7. Let f : RN
→ R ∪ {−∞} be a polyhedral concave function with a bounded
effective domain. Then the following conditions are equivalent36
:
(a) f satisfies (GS[R]).
(b) For every p ∈ RN
, each edge (one-dimensional face) of D(p; f) is parallel to a vector d
with |supp+
(d)| ≤ 1 and |supp−
(d)| ≤ 1.
(c) f▽
: RN
→ R ∪ {+∞} by (7.10) is a submodular function.
Remark7.6. InDanilovetal. (2003)aboundedpolyhedron Piscalledaquasi-polymatroidif
each edge(one-dimensionalface) is parallel to a vectord with|supp+
(d)| ≤ 1 and |supp−
(d)| ≤
1. ItfollowsfromTheorem3.1ofFujishigeetal.(2004)thateveryfaceofaquasi-polymatroid
whose normal vector has the full support N is obtained from an M-convex polyhedron (base
polyhedron) by a scaling along axes. We mention in passing that a pointed convex polyhe-
dron is called polybasic if each edge is parallel to a vector d with |supp+
(d)| + |supp−
(d)| ≤ 2
(Fujishige et al. 2004).
Remark 7.7. In the canonical situation, where f : Rn
→ R is a strictly concave smooth
function, the equivalence between (GS[R]) of f and the submodularity of g = f▽
is easily
derived by simple calculus. Let x(p) be the unique maximizer of f(x) − hp, xi. We have
pi = ∂f/∂xi for i = 1,...,n, and g(p) = f(x(p)) − hp, x(p)i. This implies ∂g/∂pi = −xi
(i = 1,...,n), and hence ∂2
g/∂pi∂pj = −∂xi/∂pj (i, j = 1,...,n). On the other hand, the
submodularity of g is equivalent to ∂2
g/∂pi∂pj ≤ 0 (i , j), and (GS[R]) of f is represented
as ∂xi/∂pj ≥ 0 (i , j).
36
Recallthedefinitionof(GS[R])fromSection5.2. AlsorecallfromTheorem5.2thatpolyhedralM♮
-concave
functions satisfy (GS[R]).
39Functions in discrete variables: We turn to functions defined on integervectors. For func-
tions f : Zn
→ R ∪ {−∞} and g : Zn
→ R ∪ {+∞} with dom f , ∅ and domg , ∅, the
transformations (7.10) and (7.11) are modified to
f▽
(p) = sup{f(x) − hp, xi | x ∈ Zn
} (p ∈ Rn
), (7.12)
g△
(x) = inf{g(p) + hp, xi | p ∈ Zn
} (x ∈ Rn
), (7.13)
where f▽
: Rn
→ R ∪ {+∞} and g△
: Rn
→ R ∪ {−∞}.
The conjugacy between M♮
-concavity and L♮
-convexity in this case reads as follows37
.
Theorem 7.8.
(1) For an M♮
-concave function f : Zn
→ R ∪ {−∞}, the conjugate function f▽
: Rn
→
R ∪ {+∞} is a (locally polyhedral) L♮
-convex function, and (f▽
)△
(x) = f(x) for x ∈ Zn
.
(2) For an L♮
-convex function g : Zn
→ R∪{+∞}, the conjugate function g△
: Rn
→ R∪{−∞}
is a (locally polyhedral) M♮
-concave function, and (g△
)▽
(p) = g(p) for p ∈ Zn
.
For integer-valued functions f and g, f▽
(p) and g△
(x) are integers for integer vectors p
and x. Hence (7.12) with p ∈ Zn
and (7.13) with x ∈ Zn
, i.e.,
f▽
(p) = sup{f(x) − hp, xi | x ∈ Zn
} (p ∈ Zn
), (7.14)
g△
(x) = inf{g(p) + hp, xi | p ∈ Zn
} (x ∈ Zn
), (7.15)
define transformations of f : Zn
→ Z∪{−∞} to f▽
: Zn
→ Z∪{+∞} and g : Zn
→ Z∪{+∞}
to g△
: Zn
→ Z ∪ {−∞}, respectively.
The conjugacy theorem for integer-valued discrete-variable M♮
-concave and L♮
-convex
functions reads as follows (Murota 1998, Theorem 8.12 of Murota 2003).
Theorem 7.9.
(1) The transformations (7.14) and (7.15) give a one-to-one correspondence between the
classes of all integer-valued M♮
-concave functions f and integer-valued L♮
-convex functions
g.
(2) For an integer-valued M♮
-concave function f : Zn
→ Z ∪ {−∞}, the conjugate function
f▽
: Zn
→ Z ∪ {+∞} is an integer-valued L♮
-convex function and (f▽
)△
= f.
(3) For an integer-valued L♮
-convex function g : Zn
→ Z ∪ {+∞}, the conjugate function
g△
: Zn
→ Z ∪ {−∞} is an integer-valued M♮
-concave function and (g△
)▽
= g.
As corollaries oftheconjugacytheorems, thefollowingcharacterizations of M♮
-concavity
and L♮
-convexity in terms of the conjugate functions are obtained.
Theorem 7.10.
(1) A function f : Zn
→ R ∪ {−∞} is M♮
-concave if and only if the conjugate function
f▽
: Rn
→ R ∪ {+∞} by (7.12) is (locally polyhedral) L♮
-convex.
(2) A function f : Zn
→ Z ∪ {−∞} is M♮
-concave if and only if the conjugate function
f▽
: Zn
→ Z ∪ {+∞} by (7.14) is L♮
-convex.
Theorem 7.11.
(1) A function g : Zn
→ R∪{+∞} is L♮
-convex if and only if the conjugate function g△
: Rn
→
R ∪ {−∞} by (7.13) is (locally polyhedral) M♮
-concave.
(2) A function g : Zn
→ Z∪{+∞} is L♮
-convex if and only if the conjugate function g△
: Zn
→
Z ∪ {−∞} by (7.15) is M♮
-concave.
37
In Theorem 7.8 (1), ▽
is defined by (7.12) and △
by (7.11). In (2), △
is defined by (7.13) and ▽
by (7.10).
40L♮
-convexity, being equivalent to translation-submodularity, is a stronger property than
mere submodularity. Naturally, we may wonder if L♮
-convexity of f▽
in Theorem 7.10 can
be replaced by submodularity. However, the following example denies this possibility38
.
Example 7.1. Here is an example of a function f such that the conjugate function f▽
is
submodular, but f is not M♮
-concave. Let f : Z2
→ R ∪ {−∞} be defined by f(x1, x2) =
min(2, x1 + 2x2) on dom f = {(x1, x2) ∈ Z2
| 0 ≤ x1 ≤ 2,0 ≤ x2 ≤ 1}, whose numerical values
are
f(0,0) = 0, f(1,0) = 1, f(2,0) = 2; f(0,1) = f(1,1) = f(2,1) = 2.
This function is not M♮
-concave because (M♮
-EXC[Z]) fails for x = (2,0), y = (0,1) and
i = 1. The conjugate function f▽
: R2
→ R ∪ {+∞} of (7.12) is given by
f▽
(p1, p2) = max(0,2−2p1,2−p2,2−2p1−p2) =

      
      
0 (p1 ≥ 1, p2 ≥ 2),
2 − 2p1 (2p1 ≤ min(2, p2), p2 ≥ 0),
2 − p2 (p2 ≤ min(2,2p1), p1 ≥ 0),
2 − 2p1 − p2 (p1 ≤ 0, p2 ≤ 0).
Thefunction f▽
issubmodular,asiseasilyverified, butitisnotL♮
-convexsincethetranslation-
submodularity(7.8)fails for g = f▽
, p = (1,2), q = (0,0)and α = 1 withg(p)+g(q) = 0+2 =
2 and g((p − α1) ∨ q) + g(p ∧ (q + α1)) = g(0,1) + g(1,1) = 2 + 1 = 3. It is also noted that
f▽
(p1/2, p2) is L♮
-convex in (p1, p2).
In spite of the above example, M♮
-concavity of a set function f : 2N
→ R ∪ {−∞} can be
characterized by submodularity of the conjugate function f▽
, which is defined by
f▽
(p) = max{f(X) − p(X) | X ⊆ N} (p ∈ Rn
) (7.16)
as an adaptation of (7.12).
Theorem 7.12. A set function f : 2N
→ R ∪ {−∞} is M♮
-concave if and only if the conjugate
function f▽
: Rn
→ R ∪ {+∞} in (7.16) is submodular.
This theorem can be derived from a combination of Theorem 10 of Ausubel and Milgrom
(2002) with Theorem 3.7 in Section 3.3; see also Section 7.2.2 of Shioura and Tamura (2015)
for an alternative proof.
7.3 Minimization of L♮
-convex functions
The set of the minimizers of an L♮
-convex function on Zn
forms a well-behaved “discrete
convex” subset of Zn
. Recall from Remark 7.4 that a nonempty set P ⊆ Zn
is called an
L♮
-convex set if
p,q ∈ P =⇒ (p − α1) ∨ q, p ∧ (q + α1) ∈ P (∀α ∈ Z+). (7.17)
This condition with α = 0 gives
p,q ∈ P =⇒ p ∨ q, p ∧ q ∈ P, (7.18)
which shows that an L♮
-convex set forms a sublattice of Zn
. A bounded L♮
-convex set has the
(uniquely determined) maximal element and the (uniquely determined) minimal element.
38
Example 7.4 of Shioura and Tamura (2015) also shows this. See Theorem 7.7 for the continuous case.
41Theorem 7.13. Let g : ZN
→ R ∪ {+∞} be an L♮
-convex function and assume argming , ∅.
Then the set of the minimizers argming is an L♮
-convex set. If argming is bounded, there
exist the maximal and the minimal minimizer of g.
Proof. This follows easily from the translation-submodularity in Theorem 7.1 (b). 
For an L♮
-convex function, the minimality of a function value is characterized by a local
condition as follows (Theorem 7.14 of Murota 2003). Recall the notation χY for the charac-
teristic vector of a subset Y; see (2.1).
Theorem 7.14. Let g : ZN
→ R ∪ {+∞} be an L♮
-convex function and p ∈ domg.
(1) If g(p) > g(q) for q ∈ domg, then g(p) > g(p + χY) for some Y ⊆ supp+
(q − p) or
g(p) > g(p − χZ) for some Z ⊆ supp−
(q − p).
(2) p is a minimizer of g if and only if
g(p) ≤ g(p + χY) (∀Y ⊆ N), g(p) ≤ g(p − χZ) (∀Z ⊆ N). (7.19)
Proof. (1) Thisfollowsfrom Theorem 7.15 below. Ifg(q) < g(p) in (7.20), g(p+χYk
)−g(p) <
0 for some k or g(p − χZj
) − g(p) < 0 for some j. (2) This is immediate from (1). 
Theorem 7.15. Let g : ZN
→ R ∪ {+∞} be an L♮
-convex function. For p,q ∈ domg we have
g(q) ≥ g(p) +
m X
k=1
[g(p + χYk
) − g(p)] +
l X
j=1
[g(p − χZj
) − g(p)], (7.20)
where39
∅ , Y1 ⊆ Y2 ⊆ ··· ⊆ Ym = supp+
(q− p), ∅ , Z1 ⊆ Z2 ⊆ ··· ⊆ Zl = supp−
(q− p), and
q − p =
m X
k=1
χYk
−
l X
j=1
χZj
. (7.21)
Proof. (1) If supp+
(q − p) is nonempty, (7.6) for (q, p) implies
g(q) ≥ g(p + χY1
) + g(q − χY1
) − g(p) = [g(p + χY1
) − g(p)] + g(q2),
where q2 = q − χY1
. If supp+
(q2 − p) is nonempty, (7.6) for (q2, p) implies
g(q2) ≥ g(p + χY2
) + g(q2 − χY2
) − g(p) = [g(p + χY2
) − g(p)] + g(q3),
where q3 = q2 −χY2
= q −χY1
− χY2
. Repeating this, we obtain q′
= q −
Pm
k=1 χYk
= p ∧q and
g(q) ≥ g(q′
) +
m X
k=1
[g(p + χYk
) − g(p)]. (7.22)
By the similar procedure starting with (p,q′
) we obtain p = q′
+
Pl
j=1 χZj
and
g(q′
) ≥ g(p) +
l X
j=1
[g(p − χZj
) − g(p)]. (7.23)
Adding (7.22) and (7.23) we obtain (7.20). 
39
The decomposition (7.21) is uniquely determined: m = max(0,q1 − p1,...,qn − pn), Yk = {i | qi − pi ≥
m + 1 − k} (k = 1,...,m); l = max(0, p1 − q1,..., pn − qn), Zj = {i | pi − qi ≥ l + 1 − j} (j = 1,...,l).
42Algorithms for L♮
-convex minimization: Algorithms for L♮
-convex function minimiza-
tion are considered by Murota (2000b), Kolmogorov and Shioura (2009), Murota and Sh-
ioura (2014, 2017), Murota et al. (2016), and Shioura (2017); see also Section 10.3 of Murota
(2003). Among others we present here the following two algorithms40
.
Algorithm Greedy
Step 0: Find a vector p◦
∈ domg and set p := p◦
.
Step 1: Find ε ∈ {+1,−1} and X ⊆ N that minimize g(p + εχX).
Step 2: If g(p) ≤ g(p + εχX), then output p and stop.
Step 3: Set p := p + εχX and go to Step 1.
Algorithm GreedyUpMinimal
Step 0: Find a vector p◦
∈ domg such that {q | q ≥ p◦
} ∩ argming , ∅ and set p := p◦
.
Step 1: Find the minimal minimizer X ⊆ N of g(p + χX).
Step 2: If X = ∅, then output p and stop.
Step 3: Set p := p + χX and go to Step 1.
The algorithm Greedy can start with an arbitrary initial vector p◦
in the effective domain,
and the vector p may increase or decrease depending on ε = +1 or −1. The output of
the algorithm Greedy is not uniquely determined, varying with the choice of ε and X in
case of ties in minimizing g(p + εχX) in Step 1. Step 1 amounts to minimizing two set
functions ρ+(X) = g(p + χX) − g(p) and ρ−(X) = g(p − χX) − g(p) over all subsets X of N.
As a consequence of submodularity of g, both ρ+ and ρ− are submodular set functions and
they can be minimized efficiently (i.e., in strongly polynomial time). The second algorithm,
GreedyUpMinimal, keeps increasing the vector p, until it reaches the smallest minimizer of
g that is greater than or equal to p◦
. Accordingly, the initial vector p◦
must be small enough
to ensure {q | q ≥ p◦
} ∩ argming , ∅. If g has the minimal minimizer p∗
min and p◦
≤ p∗
min,
then the algorithm GreedyUpMinimal outputs p∗
min.
The correctness of the algorithms, at their termination, is guaranteed by Theorem 7.14,
whereas the following exact bounds for the number of updates of p are established recently
by Murota and Shioura (2014).
Theorem 7.16.
(1) The number of updates of p in the algorithm Greedy is exactly equal to
µ(p◦
) = min{kp◦
− p∗
k+
∞ + kp◦
− p∗
k−
∞ | p∗
∈ argming} (7.24)
under the assumption of argming , ∅, where kqk+
∞ = max(0,q1,q2,...,qn) and kqk−
∞ =
max(0,−q1,−q2,...,−qn).
(2) The number of updates of p in the algorithm GreedyUpMinimal is exactly equal to41
µ̂(p◦
) = min{kp◦
− p∗
k∞ | p∗
∈ argming, p◦
≤ p∗
} (7.25)
under the assumption of {q | q ≥ p◦
} ∩ argming , ∅. If the minimal minimizer p∗
min exists
and p◦
≤ p∗
min, then µ̂(p◦
) = kp◦
− p∗
mink∞.
40
Algorithm Greedy is called “steepest descent algorithm” in Section 10.3.1 of Murota (2003).
41
We have µ̂(p◦
) = +∞ if there is no p∗
∈ argming with p∗
≥ p◦
. It can be shown that µ̂(p◦
) ∈ {µ(p◦
),+∞}
holds for all p◦
∈ Zn
; see Shioura (2017) for the proof.
43Table 1: Algorithms Greedy-{Up, Down}-{Minimal, Maximal}
(a) Description of the algorithms
Greedy Minimal Maximal
Up Step 0 p◦
such that {q | q ≥ p◦
} ∩ argming , ∅ (i.e., p∗
max ≥ p◦
)
Step 1 minimal minimizer X of g(p + χX) maximal minimizer X of g(p + χX)
Down Step 0 p◦
such that {q | q ≤ p◦
} ∩ argming , ∅ (i.e., p∗
min ≤ p◦
)
Step 1 maximal minimizer X of g(p − χX) minimal minimizer X of g(p − χX)
(b) Output and the exact number of updates of p
Greedy Minimal Maximal
Up Output p∗
min if p∗
min ≥ p◦
; otherwise p∗
max
min({q | q ≥ p◦
} ∩ argming)
# Updates kp◦
− p∗
mink∞ if p∗
min ≥ p◦
; kp◦
− p∗
maxk∞
otherwise µ̂(p◦
)
Down Output p∗
min p∗
max if p∗
max ≤ p◦
; otherwise
max({q | q ≤ p◦
} ∩ argming)
# Updates kp◦
− p∗
mink∞ kp◦
− p∗
maxk∞ if p∗
max ≤ p◦
;
otherwise µ̌(p◦
)
p◦
: initial vector, p∗
min: minimal minimizer of g, p∗
max: maximal minimizer of g
µ̂(p◦
) = min{kp◦
− p∗
k∞ | p∗
∈ argming, p◦
≤ p∗
}
µ̌(p◦
) = min{kp◦
− p∗
k∞ | p∗
∈ argming, p◦
≥ p∗
}
We can conceive variants of GreedyUpMinimal by changing “Up” to “Down” and/or
“Minimal” to “Maximal” according to Table 1 (a). For example, the algorithm GreedyDown-
Minimal is obtained from GreedyUpMinimal by changing Steps 0 and 1 to:
Step 0: Find a vector p◦
∈ domg such that {q | q ≤ p◦
} ∩argming , ∅ and set p := p◦
.
Step 1: Find the maximal minimizer X ⊆ N of g(p − χX).
Starting with an initial vector p◦
large enough to ensure {q | q ≤ p◦
} ∩ argming , ∅, this
algorithm keeps decreasing the vector p. If g has the minimal minimizer p∗
min, the algorithm
stops when it reaches p∗
min. The number of updates of p in GreedyDownMinimal is exactly
equal to kp◦
− p∗
mink∞ (Proposition 3.7 of Murota et al. 2016). Table 1 (b) shows the output
and the number of updates of p for the four algorithms.
In Section 8 we shall discuss connection of L♮
-convex function minimization to iterative
auctions. The algorithm GreedyUpMinimal corresponds to ascending (English)auctions, and
GreedyDownMaximal to descending (Dutch) auctions. In connection to two-phase(English–
Dutch) auctions it is natural to consider two-phase algorithms for L♮
-convex function mini-
mization.
The combination of GreedyUpMinimal and GreedyDownMaximal results in the follow-
ing algorithm:
Algorithm TwoPhaseMinMax
Step 0: Find a vector p◦
∈ domg and set p := p◦
. Go to Up Phase.
Up Phase:
Step U1: Find the minimal minimizer X ⊆ N of g(p + χX).
44Step U2: If X = ∅, then go to Down Phase.
Step U3: Set p := p + χX and go to Step U1.
Down Phase:
Step D1: Find the minimal minimizer X ⊆ N of g(p − χX).
Step D2: If X = ∅, then output p and stop.
Step D3: Set p := p − χX and go to Step D1.
It can be shownfrom Theorem 7.1 (d)that, at theend oftheup phase, thevector p satisfies
the condition {q | q ≤ p} ∩ argming , ∅ required for an initial vector of GreedyDown-
Maximal. Therefore, the output of TwoPhaseMinMax is guaranteed to be a minimizer of
g. An upper bound on the number of updates of p is given in Theorem 4.13 of Murota et
al. (2016), which is improved to the following statement by Murota and Shioura (2017); see
also Remark 7.8. Recall the definition of µ(p◦
) from (7.24).
Theorem 7.17. For any initial vector p◦
, the algorithm TwoPhaseMinMax terminates by
outputting some minimizer of g. The number of updates of the vector p is bounded by µ(p◦
)
in the up phase and by µ(p◦
) in the down phase; in total, bounded by 2µ(p◦
).
For the analysis of the Vickrey–English–Dutch auction algorithm (Section 8.3), it is con-
venient to consider the combination of GreedyUpMinimal and GreedyDownMinimal. The
resultingtwo-phasealgorithmiscalledTwoPhaseMinMin, whichisthesameasTwoPhaseM-
inMax except that Step D1 is replaced by
Step D1: Find the maximal minimizer X ⊆ N of g(p − χX).
An upper bound on the number of updates of p is given in Theorem 4.12 of Murota et
al. (2016), which is improved by Murota and Shioura (2017) to the following statement;
see also Remark 7.9. Recall the notation kqk+
∞ = max(0,q1,q2,...,qn) for q ∈ Zn
.
Theorem 7.18. For any initial vector p◦
, the algorithm TwoPhaseMinMin terminates by
outputting the minimal minimizer p∗
min of g, if p∗
min exists. The number of updates of the
vector p is bounded by µ(p◦
) in the up phase and is exactly equal to kp◦
− p∗
mink+
∞ in the down
phase; in total, bounded by µ(p◦
) + kp◦
− p∗
mink+
∞.
Remark 7.8. For the algorithm TwoPhaseMinMax, Theorem 4.13 of Murota et al. (2016)
shows that the number of updates of p is bounded by η(p◦
, p∗
) = kp◦
− p∗
k+
∞ + kp◦
− p∗
k−
∞ in
the up phase, by 2η(p◦
, p∗
) in the down phase, and in total by 3η(p◦
, p∗
), where p∗
denotes
the output of the algorithm. Theorem 7.17 gives an improved bound since η(p◦
, p∗
) ≥ µ(p◦
).
Theorem 3.2 of Murota et al. (2013a), though stated as a bound for a two-phase auction
algorithm, implies that the number of updates of p in TwoPhaseMinMax is bounded by µ(p◦
)
in the up phase, by 2µ(p◦
) in the down phase, and in total by 3µ(p◦
); see Murotaet al. (2013b)
for the proof.
Remark 7.9. For the algorithm TwoPhaseMinMin, Theorem 4.12 of Murota et al. (2016)
shows that the number of updates of p is bounded by η(p◦
, p∗
min) = kp◦
−p∗
mink+
∞ +kp◦
−p∗
mink−
∞
in the up phase, by 2η(p◦
, p∗
min) in the down phase, and in total by 3η(p◦
, p∗
min). Theorem 7.18
gives an improved bound since η(p◦
, p∗
min) ≥ µ(p◦
) and η(p◦
, p∗
min) ≥ kp◦
− p∗
mink+
∞.
Remark 7.10. Besides TwoPhaseMinMax and TwoPhaseMinMin, we can obtain other vari-
ants of two-phase algorithms by choosing appropriate combinations from among the algo-
rithms Greedy-{Up, Down}-{Minimal, Maximal} listed in Table 1.
457.4 Concluding remarks of section 7
In this paper we put more emphasis on M♮
-concave functions and give L♮
-convex functions
only a secondary role as the conjugate of M♮
-concave functions, though, in fact, they are
equally important and play symmetric roles in discrete convex analysis.
The concept of L-convex functions is formulated by Murota (1998), compatibly with the
accepted understanding of the relationship between submodularity and convexity expounded
by Lovász (1983). Then L♮
-convex functions are introduced by Fujishige and Murota (2000)
as a variant of L-convex functions, together with the observation that they coincide with
submodular integrally convex functions considered earlier by Favati and Tardella (1990).
The concept of quasi L-convex functions is also introduced by Murota and Shioura (2003), in
accordance with quasisupermodularity of Milgrom and Shannon (1994). L-convex functions
in continuous variables are defined by Murota and Shioura (2000, 2004a), partly motivated
by a phenomenon inherent in the network flow/tension problem described in Section 2.2.1 of
Murota (2003).
Recently, the concept of L-convex functions is extended to functions on graph structures,
which are more general than Zn
. See Kolmogorov (2011), Huber and Kolmogorov (2012),
Fujishige (2014), and Hirai (2015, 2016a, 2018) for the recent development.
## 8 Iterative Auctions
Thissection presentsa unified methodofanalysis foriterativeauctions(dynamicauctions)by
combining the Lyapunov function approach of Ausubel (2006) with discrete convex analysis.
We are mainly concerned with the multi-item multi-unit model, where there are multiple
indivisible goods for sale and each good may have several units. The bidders’ valuation
functions are assumed to have gross substitutes property. This section is mostly based on
Murota et al. (2013a, 2016) with some new results from Murota and Shioura (2017).
## 8.1 Auction models and Walrasian equilibrium
Fundamental concepts about auctions are introduced here only briefly; see, e.g., Milgrom
(2004), Cramton et al. (2006), and Blumrosen and Nisan (2007) for comprehensive accounts.
In the auction market, there are n types of items or goods, denoted by N = {1,2,...,n},
and m bidders, denoted by M = {1,2,...,m}, where m ≥ 2. We have ui units available for
each item i ∈ N, where ui is a positive integer. We denote the integer interval as [0,u]Z =
{x ∈ Zn
| 0 ≤ x ≤ u}, where u = (u1,u2,...,un). Each vector x ∈ [0,u]Z is called a bundle;
a bundle x = (x1, x2,..., xn) corresponds to a (multi-)set of items, where xi represents the
multiplicity of item i ∈ N. Each bidder j ∈ M has his valuation function fj : [0,u]Z → R;
the number fj(x) represents the value of the bundle x worth to bidder j. The case with ui = 1
for all i ∈ N is referred to as single-unit auction, while the general case with u ∈ Zn
++ as
multi-unit auction. Note that [0,1]Z = {0,1}n
, where 1 = (1,1,...,1). A further special case
where each bidder is interested in getting at most one item is called unit-demand auction.
In an auction, we want to find an efficient allocation and market clearing prices. An
allocationofitemsis defined as aset ofbundles x1, x2,..., xm ∈ [0,u]Z satisfying
Pm
j=1 xj = u.
Given a price vector p ∈ Rn
+, each bidder j ∈ M wants to have a bundle x which maximizes
the value fj(x) − p⊤
x. For j ∈ M and p ∈ Rn
+, define
Dj(p) = D(p; fj) = argmax{fj(x) − p⊤
x | x ∈ [0,u]Z }. (8.1)
46We call the set Dj(p) ⊆ [0,u]Z the demand set. The auctioneer wants to find a pair of a price
vector p∗
and an allocation x∗
1, x∗
2,..., x∗
m such that x∗
j ∈ Dj(p∗
) for all j ∈ M. Such a pair is
called a (Walrasian) equilibrium and p∗
is called a (Walrasian) equilibrium price vector.
Although the Walrasian equilibrium possesses several desirable properties, it does not
always exist. Some condition has to be imposed on bidders’ valuation functions before the
existence of a Walrasian equilibrium can be guaranteed. Throughout this section we assume
the following conditions for bidders’ valuation functions fj (j = 1,2,...,m):
(A0) fj is monotone nondecreasing,
(A1) fj is an M♮
-concave function,
(A2) fj takes integer values.
Recall from Sections 3.3 and 4.3 that a valuation function is M♮
-concave if and only if it
has the gross substitutes (GS) property (in its stronger form); see Theorems 3.7 and 4.6, in
particular.
Remark 8.1. Whereas we are mainly concerned with the multi-unit model here, the single-
unit model is treated more extensively in the literature, e.g., Kelso and Crawford (1982),
Gul and Stacchetti (1999, 2000), Milgrom (2004), Blumrosen and Nisan (2007), Cramton
et al. (2006), and Milgrom and Strulovici (2009). The method of analysis presented in this
section remains meaningful and interesting also for the single-unit model.
Remark 8.2. Iterative auctions for unit-demand auction are discussed extensively in the lit-
erature, e.g., Vickrey (1961), Demange et al. (1986), Mo et al. (1988), Sankaran (1994),
Mishra and Parkes (2009), Andersson et al. (2013), and Andersson and Erlanson (2013).
Specifically, the Vickrey–English auction by Demange et al. (1986), the Vickrey–Dutch auc-
tion by Mishra and Parkes (2009), and the Vickrey–English–Dutchauction by Andersson and
Erlanson (2013) are such iterative auctions. Although these three algorithms are proposed in-
dependently of the iterative auction algorithms for the multi-unit model, it is possible to give
a unified treatment of these iterative auction algorithms by revealing their relationship to the
Lyapunov function approach (Section 8.3).
## 8.2 Lyapunov function approach to iterative auctions
In this section we describe the Lyapunovfunction-based iterative auctions, which is proposed
by Ausubel (2006). Our objective is to clarify the underlying mathematical structure with the
aid of discrete convex analysis, and to derive sharp upper or exact bounds on the number of
iterations in the iterative auctions.
For j ∈ M and p ∈ Rn
+, we define the indirect utility function Vj : Rn
+ → R by
Vj(p) = V(p; fj) = max{fj(x) − p⊤
x | x ∈ [0,u]Z }, (8.2)
and the Lyapunov function by
L(p) =
m X
j=1
Vj(p) + u⊤
p (p ∈ Rn
), (8.3)
where the vector u ∈ Zn
+ represents the numbers of available units for items in N.
47Under the assumptions (A0)–(A2) it can be shown42
that there exists an equilibrium price
vector p∗
whose components are nonnegative integers. Henceforth we assume that the price
vector p in iterative auctions is always chosen to be a nonnegativeinteger vector, i.e., p ∈ Zn
+.
Accordingly, we regard Vj and L as integer-valued functions defined on nonnegativeintegers,
i.e., Vj : Zn
+ → Z and L : Zn
+ → Z.
The ascending auction algorithm based on the Lyapunov function (Ausubel 2006) is as
follows:
Algorithm AscendMinimal
Step 0: Set p := p◦
, where p◦
∈ Zn
+ is an arbitrary vector satisfying p◦
≤ p∗
min (e.g., p◦
= 0).
Step 1: Find the minimal minimizer X ⊆ N of L(p + χX).
Step 2: If X = ∅, then output p and stop.
Step 3: Set p := p + χX and go to Step 1.
The above algorithm can be interpreted in auction terms as follows43
:
Algorithm AscendMinimal (in auction terms)
Step 0: The auctioneer sets p := p◦
, where p◦
∈ Zn
should satisfy p◦
≤ p∗
min.
Step 1: The auctioneer asks the bidders to report their demand sets Dj(p) (j ∈ M),
and finds the minimal minimizer X ⊆ N of L(p + χX).
Step 2: The auctioneer checks if X = ∅; if X = ∅ holds, then the auctioneer
reports p as the final price vector and stop.
Step 3: The auctioneer sets p := p + χX and returns to Step 1.
The analysis of the algorithm AscendMinimal can be made transparent by using concepts
and results from discrete convex analysis. Before presenting formal theorems, we enumerate
the major mathematical ingredients.
• As pointed out by Ausubel (2006), the Walrasian equilibrium price vector can be char-
acterized as a minimizer of the Lyapunov function L and an iterative auction algorithm
can be understood as a minimization process of the Lyapunov function L(p). See The-
orem 8.1.
• The conjugate function of an M♮
-concave function is an L♮
-convex function, and vice
versa (the conjugacy theorem in Section 7.2). Hence the indirect utility function Vj is
an L♮
-convex function and therefore, theLyapunovfunction L is an L♮
-convex function.
See Theorem 8.2.
• The L♮
-convexity of the Lyapunov function L implies a nice combinatorial structure of
the equilibrium prices. The set of the equilibrium prices is an L♮
-convex set (Remark
7.4), which is more special than just being a sublattice. See Theorem 8.3.
• The L♮
-convexityof the Lyapunovfunction L enables us to utilizegeneral results on L♮
-
convex function minimization (Section 7.3) to analyze the behavior of iterative auction
algorithms, such as convergence to an equilibrium price and the number of iterations
needed to reach the equilibrium price. See Theorem 8.4 as well as Theorem 8.9.
42
The integrality follows from the fact that an integer-valued M♮
-concave function f on Zn
has an integral
subgradient (or supergradient) at every point x in dom f.
43
See Appendix B of Ausubel (2006) for details about the implementation of Steps 2 and 3.
48We now present the theorems substantiating the above-mentioned points. The conditions
(A0)–(A2) are assumed implicitly in the following four theorems. The first theorem is due to
Ausubel (2006).
Theorem 8.1. A vector p ∈ Zn
+ is an equilibrium price vector if and only if it is a minimizer
of the Lyapunov function L.
Proof. The key of the proof is the fact that the set of excess supply vectors at a price vector p,
i.e., {u −
Pm
j=1 xj | xj ∈ Dj(p) (j = 1,2,...,m)}, coincides with the set of subgradients of the
Lyapunov function L at p; see Ausubel (2006). 
Theorem 8.2.
(1) For each j ∈ M, the indirect utility function Vj is an L♮
-convex function.
(2) The Lyapunov function L is an L♮
-convex function.
Proof. (1) When regarded as Vj : Zn
+ → Z, the definition (8.2) of Vj shows that Vj is the
conjugate function of fj in the sense of (7.14). That is, Vj = f▽
j in the notation of Section 7.2.
Then Theorem 7.9 (2) shows the L♮
-convexity of Vj.
(2) In the definition (8.3) of L, each Vj is L♮
-convex by (1), and the linear term u⊤
p is
obviously L♮
-convex. The sum of L♮
-convex functions is again L♮
-convex by Theorem 7.1.
Hence the Lyapunov function L is L♮
-convex. 
Theorem 8.3. The equilibrium price vectors form a bounded L♮
-convex set44
. That is, for
two equilibrium price vectors p∗
, q∗
and any nonnegative integer α, both (p∗
− α1) ∨ q∗
and
p∗
∧ (q∗
+ α1) are equilibrium price vectors. In particular, the minimal equilibrium price
vector p∗
min and the maximal equilibrium price vector p∗
max are uniquely determined.
Proof. This follows from the L♮
-convexity of the Lyapunov function (Theorem 8.2) and the
L♮
-convexity of the set of the minimizers (Remark 7.4); the boundedness is easily shown. 
Theorem 8.4. For an initial vector p◦
with p◦
≤ p∗
min, the algorithm AscendMinimal outputs
the minimal equilibrium price vector p∗
min and the number of updates of the price vector is
exactly equal to kp∗
min − p◦
k∞.
Proof. The Lyapunov function L is an L♮
-convex function by Theorem 8.2, and the algorithm
AscendMinimal is nothing but the algorithm GreedyUpMinimal in Section 7.3 applied to
L. Since the minimal minimizer of the Lyapunov function L is the minimal equilibrium
price vector p∗
min by Theorem 8.1, the auction algorithm AscendMinimal yields the minimal
equilibrium price vector p∗
min. The number of updates of the price vector is equal to kp∗
min −
p◦
k∞ by Theorem 7.16 (2). 
Theorem8.4isduetoMurotaetal.(2016), whilethefiniteterminationisnotedinAusubel
(2006). The bound for the number of iterations in AscendMinimal is given as the ℓ∞-distance
from the initial price vector p◦
to the minimal equilibrium price vector p∗
min. This implies,
in particular, that the trajectory of the price vector generated by the ascending auction is the
“shortest” path between the initial vector and the minimal equilibrium price vector.
44
See Remark 7.4 for L♮
-convex sets. If we consider real price vectors, the equilibrium price vectors form an
L♮
-convex polyhedron.
49Variants of auction algorithms: A variant of the ascending auction algorithm, called As-
cendMaximal, is obtained through the application of the algorithm GreedyUpMaximal in
Section 7.3 to the Lyapunov function L. Two other variants of the descending auction algo-
rithm, called DescendMaximal and DescendMinimal, are obtained through the application of
the algorithms GreedyDownMaximal and GreedyDownMinimal in Section 7.3 to the Lya-
punov function L, where DescendMaximal coincides with the descending auction algorithm
in Ausubel (2006). The general results for L♮
-convex function minimization summarized in
Table 1 (b) in Section 7.3 imply the following exact bounds (Murota et al. 2016).
Theorem 8.5.
(1) For an initial vector p◦
with p◦
≤ p∗
max, the algorithm AscendMaximal outputs p∗
max and
the number of updates of the price vector is exactly equal to kp∗
max − p◦
k∞.
(2) For an initial vector p◦
with p◦
≥ p∗
max, the algorithm DescendMaximal outputs p∗
max and
the number of updates of the price vector is exactly equal to kp∗
max − p◦
k∞.
(3) For any initial vector p◦
with p◦
≥ p∗
min, the algorithm DescendMinimal outputs p∗
min and
the number of updates of the price vector is exactly equal to kp∗
min − p◦
k∞.
A two-phase auction algorithm, consisting of an ascending auction phase followed by a
descending phase, can be obtained by applying the algorithm TwoPhaseMinMax in Section
7.3 to the Lyapunov function L. Another two-phase auction algorithm can be obtained from
TwoPhaseMinMin. Then Theorems 7.17 and 7.18 imply the following (Murota and Shioura
2017).
Theorem 8.6.
(1) For any initial vector p◦
, the two-phase algorithm TwoPhaseMinMax outputs some equi-
librium price p∗
. The number of updates of the vector p is bounded by µ(p◦
) in the ascending
phase and by µ(p◦
) in the descending phase; in total, bounded by 2µ(p◦
).
(2) For any initial vector p◦
, the two-phase algorithm TwoPhaseMinMin outputs the minimal
equilibrium price p∗
min. The number of updates of the vector p is bounded by µ(p◦
) in the
ascending phase and is exactly equal to kp◦
− p∗
mink+
∞ in the descending phase; in total,
bounded by µ(p◦
) + kp◦
− p∗
mink+
∞.
Two-phasealgorithmswithmoreflexibilityaregiveninMurotaetal.(2013a), and Murota
and Shioura (2017).
Remark 8.3. The algorithm TwoPhaseMinMax, when applied to valuation functions on
{0,1}N
(single-unit valuations), coincides with a special case of “Global Dynamic Double-
Track(GDDT)procedure”proposedinSunandYang(2009). The“globalWalrasiantâtonnement
algorithm” proposed by Ausubel (2006) repeats ascending and descending phases until some
equilibrium is found. Theorem 7.17 shows that the global Walrasian tâtonnement algorithm
terminates after only one ascending phase and only one descending phase. Put differently, the
behavior of the global Walrasian tâtonnement algorithm coincides with that of TwoPhaseM-
inMax.
Remark 8.4. Besides TwoPhaseMinMax, we can obtain many variants of two-phase al-
gorithms by choosing appropriate combinations from among the algorithms Greedy-{Up,
Down}-{Minimal, Maximal} listed in Table 1. In Section 8.3, for example, we consider the
combination of GreedyUpMinimal and GreedyDownMinimal.
508.3 Unit-demand auctions
Fundamentalmulti-itemunit-demandauctionalgorithmssuchastheVickrey–English,Vickrey–
Dutch, Vickrey–English–Dutch auctions can be reformulated in the framework of the Lya-
punov function approach. In so doing we can derive bounds for the number of iterations in
these auction algorithms from the corresponding results about L♮
-convex function minimiza-
tion presented in Section 7.3.
The unit-demand auction model is a special case of the single-unit auction model, where
each bidderisa unit-demandbidder, beinginterestedin gettingatmostoneitem. We continue
to use notations N = {1,2,...,n} for the set of items and M = {1,2,...,m} for the set of
bidders. For each item i and each bidder j, we denote by vji the valuation of item i by
bidder j, which is assumed to be a nonnegative integer, i.e., vji ∈ Z+. The valuation function
fj : 2N
→ Z+ of bidder j is given by
fj(X) =
(
max{vji | i ∈ X} (if X , ∅),
0 (if X = ∅).
(8.4)
A valuation function of this form, often called a unit-demand valuation45
, is a gross substi-
tutes valuation, as pointed out by Gul and Stacchetti (1999). In other words, a unit-demand
valuation is M♮
-concave; see (3.21). We are interested in finding the minimal Walrasian equi-
librium price vector p∗
min ∈ ZN
+ by iterative auctions.
Fundamental iterative auction algorithms such as the Vickrey–English auction of De-
mangeet al. (1986)(thevariantby Moet al. (1988)and Sankaran (1994), to bemorespecific),
the Vickrey–Dutch auction of Mishra and Parkes (2009), and the Vickrey–English–Dutch
auction of Andersson and Erlanson (2013) can be recast into the Lyapunov function-based
framework. The following theorem is due to Murota et al. (2016); the specific forms of the
auction algorithms are described in Remark 8.5.
Theorem 8.7. Let L : ZN
+ → Z be the Lyapunov function associated with the unit-demand
valuations (8.4).
(1) For any initial price vector p◦
with p◦
≤ p∗
min, the sequence of price vectors p generated
by the algorithm Vickrey English is the same as that of GreedyUpMinimal applied to L.
(2) For any initial price vector p◦
with p◦
≥ p∗
min, the sequence of price vectors p generated
by the algorithm Vickrey Dutch is the same as that of GreedyDownMinimal applied to L.
(3) For any initial price vector p◦
, the sequence of price vectors p generated by the algorithm
Vickrey English Dutch is the same as that of TwoPhaseMinMin applied to L.
Theorem 8.7 above is established on the basis of the following technical observations
(Lemma 5.7 of Murota et al. 2016), which relate the descending directions of the Lya-
punov function with “sets in excess demand” (see Remark 8.5) used in the Vickrey–English,
Vickrey–Dutch, Vickrey–English–Dutch auction algorithms.
Proposition 8.8. Let p ∈ ZN
+ be a price vector.
(1) A set X ⊆ N is the maximal set in excess demand at price p if and only if X is the minimal
minimizer of L(p + χX) − L(p).
(2) A set Z ⊆ supp+
(p) is the maximal set in positive excess demand at price p if and only if
X = supp+
(p) \ Z is the maximal minimizer of L(p − χX) − L(p).
45
See, e.g., Section 9.2.2 of Cramton et al. (2006) and Definition 11.17 of Blumrosen and Nisan (2007).
51Theorem 8.7 enables us to resort to the general results for L♮
-convex function minimiza-
tion in Section 7.3 to establish the following (exact or upper) bounds on the number of iter-
ations in the unit-demand auction algorithms, where (1) and (2) are given in Corollary 2 of
Andersson and Erlanson (2013), and (3) is in Murota and Shioura (2017).
Theorem 8.9.
(1) For any initial price vector p◦
with p◦
≤ p∗
min, the number of updates of the price vector
in the algorithm Vickrey English is exactly equal to kp◦
− p∗
mink∞.
(2) For any initial price vector p◦
with p◦
≥ p∗
min, the number of updates of the price vector
in the algorithm Vickrey Dutch is exactly equal to kp◦
− p∗
mink∞.
(3) For any initial price vector p◦
, the number of updates of the price vector in the algorithm
Vickrey English Dutch is bounded by µ(p◦
) in the ascending phase and is exactly equal to
kp◦
− p∗
mink+
∞ in the descending phase; in total, bounded by µ(p◦
) + kp◦
− p∗
mink+
∞.
Proof. We prove the claims to illustrate the use of the general results in Section 7.3. (1)
follows from Theorem 8.7 (1) and Theorem 7.16 (2). (2) follows from Theorem 8.7 (2) and
Table 1 (b). (3) follows from Theorem 8.7 (3) and Theorem 7.18. 
Remark 8.5. The Vickrey–English, Vickrey–Dutch, Vickrey–English–Dutch auction algo-
rithmsaredescribedhere, followingAnderssonandErlanson(2013)andAnderssonetal.(2013).
Denote by 0 an artificial item (null-item) which has no value (i.e., vj0 = 0 for all j ∈ M) and
is available in an infinite number of units. For each bidder j ∈ M and a price vector p ∈ ZN
+,
define Dj(p) ⊆ N ∪ {0} by
Dj(p) = argmax{vji − pi | i ∈ N ∪ {0}} = {i ∈ N ∪ {0} | vji − pi ≥ vji′ − pi′ (∀i′
∈ N ∪ {0})},
where p0 = 0. For an item set Y ⊆ N and a price vector p ∈ ZN
+, define
O(Y, p) = {j ∈ M | Dj(p) ⊆ Y},
U(Y, p) = {j ∈ M | Dj(p) ∩ Y , ∅}.
The set O(Y, p) consists of bidders who only demand items in Y at price p, while U(Y, p) is
the set of bidders who demand some item in Y at price p. Obviously, O(Y, p) ⊆ U(Y, p). A
set X ⊆ N is said to be in excess demand at price p if it satisfies
|U(Y, p) ∩ O(X, p)| > |Y| (∅ , ∀Y ⊆ X).
For each price vector p there uniquely exists a maximal set in excess demand46
. The Vickrey-
English auction algorithm due to Mo et al. (1988) and Sankaran (1994), a variant of the one
in Demange et al. (1986), is as follows:
Algorithm Vickrey English
Step 0: Set p := p◦
, where p◦
∈ ZN
+ is an arbitrary vector satisfying p◦
≤ p∗
min (e.g., p◦
= 0).
Step 1: Find the maximal set X ⊆ N in excess demand at price p.
Step 2: If X = ∅, then output p and stop.
Step 3: Set p := p + χX and go to Step 1.
46
See Proposition 1 of Mo et al. (1988) and also Proposition 1 of Andersson and Erlanson (2013), and
Theorem 1 of Andersson et al. (2013).
52The Vickrey-Dutch auction algorithm refers to the variants of the sets Dj(p) and O(Y, p)
defined as
D+
j (p) = Dj(p) ∩ supp+
(p),
O+
(Y, p) = {j ∈ M | D+
j (p) ⊆ Y}.
A set X ⊆ N is said to be in positive excess demand at price p if X ⊆ supp+
(p) and
|U(Y, p) ∩ O+
(X, p)| > |Y| (∅ , ∀Y ⊆ X).
For each price vector p there uniquely exists a maximal set in positive excess demand47
. The
Vickrey–Dutch auction by Mishra and Parkes (2009) is as follows:
Algorithm Vickrey Dutch
Step 0: Set p := p◦
, where p◦
∈ ZN
+ is an arbitrary vector satisfying p◦
≥ p∗
min.
Step 1: Find the maximal set Z ⊆ N in positive excess demand at price p, and
set X := supp+
(p) \ Z.
Step 2: If X = ∅, then output p and stop.
Step 3: Set p := p − χX and go to Step 1.
The Vickrey–English–Dutch auction by Andersson and Erlanson (2013) is a combination
of the Vickrey–English and Vickrey–Dutch auctions, as follows:
Algorithm Vickrey English Dutch
Step 0: Set p := p◦
, where p◦
∈ ZN
+ is an arbitrary vector. Go to Ascending Phase.
Ascending Phase:
Step A1: Find the maximal set X ⊆ N in excess demand at price p.
Step A2: If X = ∅, then go to Descending Phase.
Step A3: Set p := p + χX and go to Step A1.
Descending Phase:
Step D1: Find the maximal set Z ⊆ N in positive excess demand at price p, and
set X := supp+
(p) \ Z.
Step D2: If X = ∅, then output p and stop.
Step D3: Set p := p − χX and go to Step D1.
## 8.4 Concluding remarks of section 8
Useof discrete convexanalysis in the Lyapunovfunction approach is also conceived by Drexl
and Kleiner (2015). Besides the basic form of ascending auction, the paper proposes and ana-
lyzes the “singleton-based tâtonnement” which reflects a certain practice in auction design. It
also discusses the double-track adjustment process of Sun and Yang (2009) as an application
of the framework of Section 8.2; the underlying key fact here is that gross substitutes and
complements are represented by twisted M♮
-concave functions (Section 3.5). Lehmann et
al. (2006) shows a connection between discrete convex analysis and combinatorial auctions.
Sun and Yang (2014) considers super-additive utility functions.
47
See Theorem 2 of Andersson and Erlanson (2013).
539 Intersection and Separation Theorems
## 9.1 Separation theorem
The dualityprinciplein convex analysis can be expressed in a number of different forms. One
of the most appealing statements is in the form of the separation theorem, which asserts the
existence of a separating affine function y = α∗
+ hp∗
, xi for a pair of convex and concave
functions. Inapplicationtoeconomicproblems,theseparatingvector p∗
givestheequilibrium
price.
In the continuous case we have the following.
Theorem 9.1. Let f : Rn
→ R ∪ {+∞} and h : Rn
→ R ∪ {−∞} be convex and concave
functions, respectively (satisfying certain regularity conditions). If
f(x) ≥ h(x) (∀x ∈ Rn
),
there exist α∗
∈ R and p∗
∈ Rn
such that
f(x) ≥ α∗
+ hp∗
, xi ≥ h(x) (∀x ∈ Rn
).
In the discrete case we are concerned with functions defined on integer points: f : Zn
→
R ∪ {+∞} and h : Zn
→ R ∪ {−∞}. A discrete separation theorem means a statement like:
For any f : Zn
→ R ∪ {+∞} and h : Zn
→ R ∪ {−∞} belonging to certain classes
of functions, if f(x) ≥ h(x) for all x ∈ Zn
, then there exist α∗
∈ R and p∗
∈ Rn
such that
f(x) ≥ α∗
+ hp∗
, xi ≥ h(x) (∀x ∈ Zn
).
Moreover, if f and h are integer-valued, there exist integer-valued α∗
∈ Z and
p∗
∈ Zn
.
In applicationto economicproblems, theseparating vector p∗
inadiscreteseparationtheorem
often gives the equilibrium price in markets with indivisible goods.
Discrete separation theorems capture deep combinatorial properties in spite of the appar-
ent similarity to the separation theorem in the continuous case. In this connection we note
the following facts that indicate the difficulty inherent in discrete separation theorems48
. Let
f : Zn
→ R ∪ {+∞} be a convex-extensible function, with the convex closure f. Also let
h : Zn
→ R ∪ {−∞} be a concave-extensible function, with the concave closure h. In the
following statements, =⇒ 6 stands for “does not imply.”
1. f(x) ≥ h(x) (∀x ∈ Zn
) =⇒ 6 f(x) ≥ h(x) (∀x ∈ Rn
).
2. f(x) ≥ h(x) (∀x ∈ Zn
) =⇒ 6 existence of α∗
∈ R and p∗
∈ Rn
.
3. existence of α∗
∈ R and p∗
∈ Rn
=⇒ 6 existence of α∗
∈ Z and p∗
∈ Zn
.
It is known that discrete separation theorems hold for M♮
-convex/M♮
-concave functions
and for L♮
-convex/L♮
-concave functions. The M♮
-separation theorem (Theorem 9.2) is shown
byMurota(1996c,1998, 1999)intermsofM-convex/concavefunctions,andtheL♮
-separation
48
See Examples 1.5 and 1.6 of Murota (2003) for concrete examples.
54theorem (Theorem 9.3) by Murota (1998) in terms of L-convex/concave functions. The as-
sumptions of the theorems refer to the convex and concave conjugate functions of f and h
defined, respectively, by49
f•
(p) = sup{hp, xi − f(x) | x ∈ Zn
} (p ∈ Rn
), (9.1)
h◦
(p) = inf{hp, xi − h(x) | x ∈ Zn
} (p ∈ Rn
). (9.2)
Theorem 9.2 (M♮
-separation theorem). Let f : Zn
→ R ∪ {+∞} be an M♮
-convex function
and h : Zn
→ R ∪ {−∞} be an M♮
-concave function such that domZ f ∩ domZh , ∅ or
domR f•
∩ domRh◦
, ∅. If f(x) ≥ h(x) (∀x ∈ Zn
), there exist α∗
∈ R and p∗
∈ Rn
such that
f(x) ≥ α∗
+ hp∗
, xi ≥ h(x) (∀x ∈ Zn
).
Moreover, if f and h are integer-valued, there exist integer-valued α∗
∈ Z and p∗
∈ Zn
.
Theorem 9.3 (L♮
-separation theorem). Let g : Zn
→ R ∪ {+∞} be an L♮
-convex function
and k : Zn
→ R ∪ {−∞} be an L♮
-concave function such that domZg ∩ domZk , ∅ or
domRg•
∩ domRk◦
, ∅. If g(p) ≥ k(p) (∀p ∈ Zn
), there exist β∗
∈ R and x∗
∈ Rn
such that
g(p) ≥ β∗
+ hp, x∗
i ≥ k(p) (∀p ∈ Zn
).
Moreover, if g and k are integer-valued, there exist integer-valued β∗
∈ Z and x∗
∈ Zn
.
As an immediate corollary of the M♮
-separation theorem we can obtain an optimality
criterion for the problem of maximizing the sum of two M♮
-concave functions, which we call
the M♮
-concave intersection problem. Note that the sum of M♮
-concave functions is no longer
M♮
-concave and Theorem 4.4 does not apply. Recall the notation f[−p](x) = f(x) − hp, xi.
Theorem 9.4 (M♮
-concave intersection theorem). For M♮
-concave functions f1, f2 : Zn
→
R ∪ {−∞} and a point x∗
∈ domZ f1 ∩ domZ f2 we have
f1(x∗
) + f2(x∗
) ≥ f1(x) + f2(x) (∀x ∈ Zn
)
if and only if there exists p∗
∈ Rn
such that
f1[−p∗
](x∗
) ≥ f1[−p∗
](x) (∀x ∈ Zn
),
f2[+p∗
](x∗
) ≥ f2[+p∗
](x) (∀x ∈ Zn
).
These conditions are equivalent, respectively, to
f1[−p∗
](x∗
) ≥ f1[−p∗
](x∗
+ χi − χj) (∀i, j ∈ {0,1,...,n}),
f2[+p∗
](x∗
) ≥ f2[+p∗
](x∗
+ χi − χj) (∀i, j ∈ {0,1,...,n}),
and for such p∗
we have
argmax
Z
(f1 + f2) = argmax
Z
f1[−p∗
] ∩ argmax
Z
f2[+p∗
].
Moreover, if f1 and f2 are integer-valued, we can choose integer-valued p∗
∈ Zn
.
49
We have f•
(p) = −f△
(−p) and h◦
(p) = −h▽
(p) in the notation of (7.12) and (7.13).
55An extension of the M♮
-concave intersection theorem is given in Theorem 10.4, which
constitutes the technical pivot in the Fujishige–Tamura model that unifies the stable marriage
and the assignment game (see Remark 10.1).
Remark 9.1. Three different proofs are available for the M♮
-concave intersection theorem.
The original proof (Murota 1996c) is based on the reduction of the M♮
-concave intersection
problem to the M-convex submodular flow problem; see Remark 12.2 in Section 12.1. Then
Theorem 9.4 is derived from the negative-cycle optimality criterion (Theorem 12.2) for the
M-convex submodular flow problem. The second proof is based on the reduction to the dis-
crete separation theorem, which is proved by the polyhedral-combinatorial method using the
(standard) separation theorem in convex analysis; see the proof of Theorem 8.15 of Murota
(2003). The third proof (Murota 2004a) is a direct constructive proof based on the successive
shortest path algorithm.
## 9.2 Fenchel duality
Anotherexpressionofthedualityprincipleisin theform oftheFenchel duality. Thisis amin-
max relation between a pair of convex and concave functions and their conjugate functions.
Such a min-max theorem is computationallyuseful in that it affords a certificate of optimality.
We start with the continuous case. For a function f : Rn
→ R ∪ {+∞} with dom f , ∅,
the convex conjugate f•
: Rn
→ R ∪ {+∞} is defined by50
f•
(p) = sup{hp, xi − f(x) | x ∈ Rn
} (p ∈ Rn
). (9.3)
For h : Rn
→ R ∪ {−∞}, the concave conjugate h◦
: Rn
→ R ∪ {−∞} is defined by
h◦
(p) = inf{hp, xi − h(x) | x ∈ Rn
} (p ∈ Rn
). (9.4)
Theorem 9.5. Let f : Rn
→ R ∪ {+∞} and h : Rn
→ R ∪ {−∞} be convex and concave
functions, respectively (satisfying certain regularity conditions). Then
inf{f(x) − h(x) | x ∈ Rn
} = sup{h◦
(p) − f•
(p) | p ∈ Rn
}.
We now turn to the discrete case. For any functions f : Zn
→ Z ∪ {+∞} and h : Zn
→
Z ∪ {−∞}, we define the discrete versions of (9.3) and (9.4) as
f•
(p) = sup{hp, xi − f(x) | x ∈ Zn
} (p ∈ Zn
), (9.5)
h◦
(p) = inf{hp, xi − h(x) | x ∈ Zn
} (p ∈ Zn
). (9.6)
Then we have a chain of inequalities:
inf{f(x) − h(x) | x ∈ Zn
} sup{h◦
(p) − f•
(p) | p ∈ Zn
}
≥
≥
inf{f(x) − h(x) | x ∈ Rn
} ≥ sup{h
◦
(p) − f
•
(p) | p ∈ Rn
},
(9.7)
where f and h are the convex and concave closures of f and h, respectively, and f
•
and h
◦
are defined by (9.3) for f and (9.4) for h. We observe that
50
We have f•
(p) = −f△
(−p) and h◦
(p) = −h▽
(p) in the notation of (7.10) and (7.11).
561. The second inequality (≥) in the middle of (9.7) is in fact an equality (=) (under mild
regularityconditions)bytheFenchel dualitytheoreminconvexanalysis(Theorem9.5);
2. The first inequality (
≥
) in the left of (9.7) can be strict (i.e., ,) even when f is convex-
extensible and h is concave-extensible, and similarly for the third inequality (
≥
) in the
right. See Examples 9.1 and 9.2 below51
.
Example 9.1. For f,h : Z2
→ Z defined as
f(x1, x2) = |x1 + x2 − 1|, h(x1, x2) = 1 − |x1 − x2|
we have inf{f −h} = 0, inf{f −h} = −1. The conjugate functions (9.5) and (9.6) are given by
f•
(p1, p2) =
(
p1 ((p1, p2) ∈ S)
+∞ (otherwise),
h◦
(p1, p2) =
(
−1 ((p1, p2) ∈ T)
−∞ (otherwise)
with S = {(−1,−1),(0,0),(1,1)} and T = {(−1,1),(0,0),(1,−1)}. Hence sup{h◦
− f•
} =
h◦
(0,0) − f•
(0,0) = −1 − 0 = −1. Then (9.7) reads as
inf{f − h} > inf{f − h} = sup{h
◦
− f
•
} = sup{h◦
− f•
}.
(0) (−1) (−1) (−1)
Example 9.2. For f,h : Z2
→ Z defined as
f(x1, x2) = max(0, x1 + x2), h(x1, x2) = min(x1, x2)
we have inf{f − h} = inf{f − h} = 0. The conjugate functions (9.5) and (9.6) are given as
f•
= δS and h◦
= −δT in terms of the (convex) indicator functions52
of S = {(0,0),(1,1)} and
T = {(1,0),(0,1)}. Since S ∩ T = ∅, the function h◦
− f•
is identically equal to −∞, whereas
sup{h
◦
− f
•
} = 0 since f
•
= δS , h
◦
= −δT and S ∩ T = {(1/2,1/2)}. Then (9.7) reads as
inf{f − h} = inf{f − h} = sup{h
◦
− f
•
} > sup{h◦
− f•
}.
(0) (0) (0) (−∞)
The Fenchel-type duality holds for M♮
-convex/M♮
-concave functions and L♮
-convex/L♮
-
concave functions. The Fenchel-type duality theorem originates in Murota (1996c) (see also
Murota 1998) and formulated into the following form in Murota (2003). The essence of the
theorem is the assertion that the first and third inequalities in (9.7) are in fact equalities for
M♮
-convex/M♮
-concave functions and L♮
-convex/L♮
-concave functions.
Theorem 9.6 (Fenchel-type duality theorem).
(1) Let f : Zn
→ Z∪{+∞} be an integer-valuedM♮
-convex function and h : Zn
→ Z∪{−∞} be
an integer-valued M♮
-concave function such that domZ f ∩domZh , ∅ or domZ f•
∩domZh◦
,
∅, where f•
and h◦
are defined by (9.5) and (9.6). Then we have
inf{f(x) − h(x) | x ∈ Zn
} = sup{h◦
(p) − f•
(p) | p ∈ Zn
}. (9.8)
If this common value is finite, the infimum and the supremum are attained.
51
These examples are taken from Murota (2009).
52
δS (p) = 0 for p ∈ S and = +∞ for p < S.
57(2) Let g : Zn
→ Z∪{+∞} be an integer-valued L♮
-convex function and k : Zn
→ Z∪{−∞} be
aninteger-valuedL♮
-concavefunctionsuchthatdomZg∩domZk , ∅ ordomZg•
∩domZk◦
, ∅,
where g•
and k◦
are defined by (9.5) and (9.6). Then we have
inf{g(p) − k(p) | p ∈ Zn
} = sup{k◦
(x) − g•
(x) | x ∈ Zn
}. (9.9)
If this common value is finite, the infimum and the supremum are attained.
The Fenchel-type duality theorem can be formulated for real-valued functions f,g : Zn
→
R ∪ {+∞} and h,k : Zn
→ R ∪ {−∞} as well; see Theorem 8.21 of Murota (2003).
Remark 9.2. For the Fenchel-type duality, the two functions must be consistent with respect
to the types (M♮
or L♮
). In Example 9.1, f is M♮
-convex and h is L♮
-concave. This is also the
case in Example 9.2.
Remark 9.3. Whereas the L♮
-separation and M♮
-separation theorems are parallel or conju-
gate to each other in their statements, the Fenchel-type duality theorem is self-conjugate, in
that the substitution of f = g•
and h = k◦
into (9.8) results in (9.9) by virtue of the bi-
conjugacy g = (g•
)•
and k = (k◦
)◦
(Theorem 7.9). With the knowledge of M-/L-conjugacy
(Section 7.2), these three duality theorems are almost equivalent to one another; once one of
them is established, the other two theorems can be derived by relatively easy formal calcula-
tions.
## 9.3 Concluding remarks of section 9
The significance of the duality theorems of this section in combinatorial optimization is men-
tioned here. Frank’s discrete separation theorem (Frank 1982) for submodular/supermodular
set functions is a special case of the L♮
-separation theorem. Frank’s weight splitting theo-
rem (Frank 1981) for the weighted matroid intersection problem is a special case of the M♮
-
concave intersection problem. Edmonds’s intersection theorem (Edmonds 1970) for (poly)
matroids in the integral case is a special case of the Fenchel-type duality (Theorem 9.6 (1)).
Fujishige’sFenchel-type dualitytheorem (Fujishige1984; also Section 6.1ofFujishige2005)
for submodular set functions is a special case of Theorem 9.6 (2). Section 8.2.3 of Murota
(2003) gives more details.
## 10 Stable Marriage and Assignment Game
Two-sided matching (Roth and Sotomayor 1990, Abdulkadiroğlu and Sönmez 2013) affords
a fairly general framework in game theory, includingthe stable matching of Gale and Shapley
(1962) and the assignment model of Shapley and Shubik (1972) as special cases. An even
more general framework has been proposed by Fujishige and Tamura (2007), in which the
existence of an equilibrium is established on the basis of a novel duality-related property
of M♮
-concave functions. The results of Fujishige and Tamura (2007) are described in this
section53
.
53
This section is based on Section 11.10 of Murota (2009).
5810.1 Fujishige–Tamura model
Let P and Q be finite sets and put
E = P × Q = {(i, j) | i ∈ P, j ∈ Q},
where we think of P as a set of workers and Q as a set of firms, respectively. We suppose
that worker i works at firm j for xij units of time, gaining a salary sij per unit time. Then the
labor allocation is represented by an integer vector
x = (xij | (i, j) ∈ E) ∈ ZE
and the salary by a real vector s = (sij | (i, j) ∈ E) ∈ RE
. We are interested in the stability of
a pair (x, s) in the sense to be made precise later.
For i ∈ P and j ∈ Q we put
E(i) = {i} × Q = {(i, j) | j ∈ Q}, E(j) = P × {j} = {(i, j) | i ∈ P},
and for a vector y on E we denote by y(i) and y(j) the restrictions of y to E(i) and E(j), respec-
tively. For example, for the labor allocation x we obtain
x(i) = (xij | j ∈ Q) ∈ ZE(i)
, x(j) = (xij | i ∈ P) ∈ ZE(j)
and this convention also applies to the salary vector s to yield s(i) and s(j).
It is supposed that for each (i, j) ∈ E lower and upper bounds on the salary sij are given,
denoted by πij ∈ R ∪ {−∞} and πij ∈ R ∪ {+∞}, where πij ≤ πij. A salary s is called feasible
if πij ≤ sij ≤ πij for all (i, j) ∈ E. We put
π = (πij | (i, j) ∈ E) ∈ (R ∪ {−∞})E
, π = (πij | (i, j) ∈ E) ∈ (R ∪ {+∞})E
.
Each agent (worker or firm) k ∈ P ∪ Q evaluates his/her state x(k) of labor allocation
in monetary terms through a function fk : ZE(k)
→ R ∪ {−∞}. Here the effective domain
dom fk = {z ∈ ZE(k)
| fk(z) > −∞} is assumed to satisfy the following natural condition:
dom fk is bounded and hereditary, with unique minimal element 0, (10.1)
where dom fk being hereditary means that 0 ≤ z ≤ y ∈ dom fk implies z ∈ dom fk. In what
follows we always assume that x is feasible in the sense that
x(i) ∈ dom fi (i ∈ P), x(j) ∈ dom fj (j ∈ Q).
A pair (x, s) of feasible allocation x and feasible salary s is called an outcome.
Example 10.1. The stable marriage problem can be formulated as a special case of the
present setting. Put π = π = 0 and define fi : ZE(i)
→ R ∪ {−∞} for i ∈ P and fj : ZE(j)
→
R ∪ {−∞} for j ∈ Q as
fi(y) =

   
   
aij (y = χj, j ∈ Q),
0 (y = 0),
−∞ (otherwise),
fj(z) =

   
   
bij (z = χi,i ∈ P),
0 (z = 0),
−∞ (otherwise),
(10.2)
where the vector (aij | j ∈ Q) ∈ RQ
represents (or, is an encoding of) the preference of “man”
i ∈ P over “women” Q, and (bij | i ∈ P) ∈ RP
the preference of “woman” j ∈ Q over “men”
P. Then a matching X is stable if and only if (x, s) = (χX,0) is stable in the present model.
Example 10.2. The assignment model is a special case where π = (−∞,...,−∞), π =
(+∞,...,+∞) and the functions fi and fj are of the form of (10.2) with some aij,bij ∈ R
for all i ∈ P, j ∈ Q.
5910.2 Market equilibrium
Given an outcome (x, s) the payoff of worker i ∈ P is defined to be the sum of his/her evalua-
tion of x(i) and the total income from firms:
fi(x(i)) +
X
j∈Q
sijxij (=: (fi + s(i))(x(i))). (10.3)
Similarly, the payoff of firm j ∈ Q is defined as
fj(x(j)) −
X
i∈P
sijxij (=: (fj − s(j))(x(j))). (10.4)
Each agent (i ∈ P or j ∈ Q) naturally wishes to maximize his/her payoff function54
.
A market equilibrium is defined as an outcome (x, s) that is stable under reasonable ac-
tions (i) by each worker i, (ii) by each firm j, and (iii) by each worker-firm pair (i, j). To be
specific, we say that (x, s) is stable with respect to i ∈ P if
(fi + s(i))(x(i)) = max{(fi + s(i))(y) | y ≤ x(i)}. (10.5)
Similarly, (x, s) is said to be stable with respect to j ∈ Q if
(fj − s(j))(x(j)) = max{(fj − s(j))(z) | z ≤ x(j)}. (10.6)
In technical terms (x, s) is said to satisfy the incentive constraint if it satisfies (10.5) and
(10.6).
The stability of (x, s) with respect to (i, j) is defined as follows. Suppose that worker i and
firm j think of a change of their contract to a new salary α ∈ [πij,πij]R and a new working
time of β ∈ Z+ units. Worker i will be happy with this contract if there exists y ∈ ZE(i)
such
that
yj = β, yk ≤ xik (k ∈ Q \ {j}), (10.7)
(fi + s(i))(x(i)) < (fi + (s−j
(i),α))(y), (10.8)
where (s−j
(i),α)denotes the vector s(i) with its j-th componentreplaced by α. Notethat y means
the new labor allocation of worker i with an increased payoff given on the right-hand side of
(10.8). Similarly, firm j is motivated to make the new contract if there exists z ∈ ZE(j)
such
that
zi = β, zk ≤ xkj (k ∈ P \ {i}), (10.9)
(fj − s(j))(x(j)) < (fj − (s−i
(j),α))(z), (10.10)
where (s−i
(j),α) is the vector s(j) with its i-th component replaced by α. Then we say that (x, s)
is stable with respect to (i, j) if there exists no (α,β,y,z) that simultaneously satisfies (10.7),
(10.8), (10.9) and (10.10).
We now define an outcome (x, s) to be stable if, for every i ∈ P, j ∈ Q, (x, s) is (i) stable
with respect to i, (ii) stable with respect to j, and (iii) stable with respect to (i, j). This is our
concept of market equilibrium.
A remarkable fact, found by Fujishige and Tamura (2007), is that a market equilibrium
exists if the functions fk are M♮
-concave.
54
We have (fi + s(i))(x(i)) = fi[+s(i)](x(i)) and (fj − s(j))(x(j)) = fj[−s(j)](x(j)) in the notation of (4.20).
60Theorem 10.1. Assume that π ≤ π and, for each k ∈ P ∪ Q, fk is an M♮
-concave function
satisfying (10.1). Then a stable outcome (x, s) ∈ ZE
× RE
exists. Furthermore, we can take
an integral s ∈ ZE
if π ∈ (Z ∪ {−∞})E
, π ∈ (Z ∪ {+∞})E
, and fk is integer-valued for every
k ∈ P ∪ Q.
## 10.3 Technical ingredients
The technical ingredients of the above theorem can be divided into the following two theo-
rems, due to Fujishige and Tamura (2007). Note also that sufficiency part of Theorem 10.2
(which we need here) is independent of M♮
-concavity.
Theorem 10.2. Under the same assumption as in Theorem 10.1 let x be a feasible allocation.
Then (x, s) is a stable outcome for some s if and only if there exist p ∈ RE
, u = (u(i) | i ∈ P) ∈
(Z ∪ {+∞})E
and v = (v(j) | j ∈ Q) ∈ (Z ∪ {+∞})E
such that
x(i) ∈ argmax{(fi + p(i))(y) | y ≤ u(i)}, (10.11)
x(j) ∈ argmax{(fj − p(j))(z) | z ≤ v(j)}, (10.12)
π ≤ p ≤ π, (10.13)
(i, j) ∈ E,uij < +∞ =⇒ pij = πij,vij = +∞, (10.14)
(i, j) ∈ E,vij < +∞ =⇒ pij = πij,uij = +∞. (10.15)
Moreover, (x, p) is a stable outcome for any (x, p,u,v) satisfying the above conditions.
Theorem 10.3. Under the same assumption as in Theorem 10.1 there exists (x, p,u,v) that
satisfies (10.11)–(10.15). Furthermore, we can take an integral p ∈ ZE
if π ∈ (Z ∪ {−∞})E
,
π ∈ (Z ∪ {+∞})E
, and fk is integer-valued for every k ∈ P ∪ Q.
It is worth while noting that the essence of Theorem 10.3 is an intersection-type theorem
for a pair of M♮
-concave functions, Theorem 10.4 below, due to Fujishigeand Tamura (2007).
Indeed Theorem 10.3 can be derived easily from Theorem 10.4 applied to
fP(x) =
X
i∈P
fi(x(i)), fQ(x) =
X
j∈Q
fj(x(j)). (10.16)
Theorem 10.4. Assume π ≤ π for π ∈ (R ∪ {−∞})E
and π ∈ (R ∪ {+∞})E
, and let f,g :
ZE
→ R ∪ {−∞} be M♮
-concave functions such that the effective domains are bounded and
hereditary, with unique minimal element 0. Then there exist x ∈ dom f ∩ domg, p ∈ RE
,
u ∈ (Z ∪ {+∞})E
and v ∈ (Z ∪ {+∞})E
such that
x ∈ argmax{(f + p)(y) | y ≤ u}, (10.17)
x ∈ argmax{(g − p)(z) | z ≤ v}, (10.18)
π ≤ p ≤ π, (10.19)
e ∈ E,ue < +∞ =⇒ pe = πe,ve = +∞, (10.20)
e ∈ E,ve < +∞ =⇒ pe = πe,ue = +∞. (10.21)
Furthermore, we can take an integral p ∈ ZE
if π ∈ (Z∪{−∞})E
, π ∈ (Z∪{+∞})E
, and f and
g are integer-valued.
Remark 10.1. Two special cases of Theorem 10.4 are worth mentioning.
61• The first case is where π = (−∞,...,−∞) and π = (+∞,...,+∞). In this case, (10.19)
isvoid,and wemusthaveue = ve = +∞ foralle ∈ E by(10.20)and (10.21). Therefore,
the assertion of Theorem 10.4 reduces to: There exist x ∈ dom f ∩ domg and p ∈ RE
such that x ∈ argmax(f + p) and x ∈ argmax(g − p), which coincides with the M♮
-
concave intersection theorem (Theorem 9.4).
• The second case is where π = π = 0, which corresponds to the discrete concave stable
marriage model of Eguchi et al. (2003). Let w be a vector such that y ≤ w for all
y ∈ dom f ∩ domg. By (10.19) we must have pe = 0 for all e ∈ E. For each e ∈ E,
we must have ue = +∞ or ve = +∞ (or both) by (10.20) and (10.21). Therefore, the
assertion of Theorem 10.4 reduces to: There exist x ∈ dom f ∩ domg, u ∈ ZE
, and
v ∈ ZE
such that w = u ∨ v, x ∈ argmax{f(y) | y ≤ u}, and x ∈ argmax{g(z) | z ≤ v}.
This is the main technical result of Eguchi et al. (2003) that implies the existence of a
stable allocation in their model.
## 10.4 Concluding remarks of section 10
The Fujishige–Tamura model contains several recently proposed matching models such as
Eriksson and Karlander (2000), Fleiner (2001), Sotomayor (2002) as well as Eguchi and
Fujishige (2002), Eguchi et al. (2003), Fujishige and Tamura (2006) as special cases. In
particular, the hybrid model of Eriksson and Karlander (2000), with flexible and rigid agents,
is a special case where P and Q are partitioned as P = P∞ ∪ P0 and Q = Q∞ ∪ Q0, and
πij = −∞, πij = +∞ for (i, j) ∈ P∞ × Q∞ and πij = πij = 0 for other (i, j). Realistic
constraints on matchings such as lower quotas can be expressed in terms of matroids (Fleiner
2001, Fleiner and Kamiyama 2016, Kojima et al. 2018, Goto et al. 2017, Yokoi 2017).
## 11 Valuated Assignment Problem
As we have seen in Sections 3.6 and 6.2, M♮
-concave set functions are amenable to (bipartite)
graph structures. As a further step in this direction we describe the valuated (independent)
assignment problem, introduced by Murota(1996a, 1996b). In contrast to the original formu-
lation of the problem in terms of valuated matroids (or M-convex set functions), we present
here a reformulation in terms of M♮
-concave set functions for the convenience of applications
to economics and game theory.
## 11.1 Problem description
The problem we consider is the following55
:
[M♮
-concave matching problem] Given a bipartite graph G = (V+
,V−
;A), a pair of M♮
-
concave set functions f+
: 2V+
→ R∪{−∞} and f−
: 2V−
→ R∪{−∞}, and a weight function
w : A → R (see Fig. 4), find a matching M (⊆ A) that maximizes
w(M) + f+
(∂+
M) + f−
(∂−
M), (11.1)
where w(M) =
P
{w(a) | a ∈ M}, and ∂+
M (resp., ∂−
M) denotes the set of the vertices in V+
(resp., V−
) incident to M. For (11.1) to be finite, we have implicit constraints that
∂+
M ∈ dom f+
, ∂−
M ∈ dom f−
. (11.2)
55
This problem is a variant of the valuated independent assignment problem.
62V+ V−
A
M f+ f−
w
Figure 4: Valuated assignment problem
In applications the empty set often belongs to dom f+
(resp., dom f−
), in which case
dom f+
(resp., dom f−
) forms the family of independent sets of a matroid. If f+
≡ 0 and
f−
≡ 0 (with dom f+
= 2V+
and dom f−
= 2V−
), this problem coincides with the conventional
weighted matching problem.
An important special case of the M♮
-concave matching problem arises from a very special
underlying graph G≡ = (V+
,V−
;A≡) that represents a one-to-one correspondence between V+
and V−
. In other words, givena pair of M♮
-concave set functions f1, f2 : 2V
→ R∪{−∞} and a
weight function w : V → R, let V+
and V−
be disjoint copies of V and A≡ = {(v+
,v−
) | v ∈ V},
where v+
∈ V+
and v−
∈ V−
denote the copies of v ∈ V. The given functions f1 and f2 are
regarded as set functions on V+
and V−
, respectively. Then we obtain the following problem:
[M♮
-concave intersection problem] Given a pair of M♮
-concave set functions f1, f2 :
2V
→ R ∪ {−∞} and a weight function w : V → R, find a subset X that maximizes
w(X) + f1(X) + f2(X), (11.3)
where w(X) =
P
v∈X w(v).
## 11.2 Optimality criterion by potentials
We showthe optimalitycriterion for the M♮
-concave matching problem in terms ofpotentials,
where a potential means a function p : V+
∪ V−
→ R (or a vector p ∈ RV+
∪V−
) on the vertex
set V+
∪ V−
. In the following theorem due to Murota (1996a) (see also Theorem 5.2.39 of
Murota 2000a), the statement (1) refers to the existence of an appropriate potential, whereas
its reformulation in (2) reveals the duality nature56
. For each arc a = (u,v) ∈ A, ∂+
a denotes
the initial (tail) vertex of a, and ∂−
a the terminal (head) vertex of a, i.e., ∂+
a = u ∈ V+
and
∂−
a = v ∈ V−
, where all the arcs are assumed to be directed from V+
to V−
.
Theorem 11.1 (Potential criterion). Let M be a matching inG = (V+
,V−
;A) satisfying(11.2)
for the M♮
-concave matching problem to maximize (11.1).
(1) M is an optimal matching if and only if there exists a potential p : V+
∪V−
→ R such that
(i) w(a) − p(∂+
a) + p(∂−
a)
(
≤ 0 (a ∈ A),
= 0 (a ∈ M),
(ii) ∂+
M is a maximizer of f+
[+p+
],
(iii) ∂−
M is a maximizer of f−
[−p−
],
56
Compare the identity in (2) with the Fenchel-type duality in Theorem 9.6.
63where p+
and p−
are the restrictions of p to V+
and V−
, respectively, and f+
[+p+
] and
f−
[−p−
] are defined by
f+
[+p+
](X) = f+
(X) +
X
{p(u) | u ∈ X} (X ⊆ V+
),
f−
[−p−
](Y) = f−
(Y) −
X
{p(v) | v ∈ Y} (Y ⊆ V−
).
(2) max
M
{w(M) + f+
(∂+
M) + f−
(∂−
M)}
= min
p
{max(f+
[+p+
]) + max(f−
[−p−
]) | w(a) − p(∂+
a) + p(∂−
a) ≤ 0 (a ∈ A)}.
(3) If f+
, f−
and w are all integer-valued, the potential p in (1) and (2) can be chosen to be
integer-valued.
(4) Let p be a potential that satisfies (i)–(iii) in (1) for some (optimal) matching M = M0. A
matching M′
is optimal if and only if it satisfies (i)–(iii) (with M replaced by M′
).
In connection to (ii) and (iii) in (1) in Theorem 11.1, Theorem 3.4 shows:
X ∈ argmax(f+
[+p+
])
⇐⇒

   
   
f+
(X) − f+
(X − u + v) + p(u) − p(v) ≥ 0 (∀u ∈ X, ∀v ∈ V+
\ X),
f+
(X) − f+
(X − u) + p(u) ≥ 0 (∀u ∈ X),
f+
(X) − f+
(X + v) − p(v) ≥ 0 (∀v ∈ V+
\ X),
(11.4)
Y ∈ argmax(f−
[−p−
])
⇐⇒

   
   
f−
(Y) − f−
(Y − u + v) − p(u) + p(v) ≥ 0 (∀u ∈ Y, ∀v ∈ V−
\ Y),
f−
(Y) − f−
(Y − u) − p(u) ≥ 0 (∀u ∈ Y),
f−
(Y) − f−
(Y + v) + p(v) ≥ 0 (∀v ∈ V−
\ Y).
(11.5)
These expressions are crucial in deriving the second optimality criterion (Theorem 11.3) in
Section 11.3 and in designing efficient algorithms for the M♮
-concave matching problem.
The optimality condition for the M♮
-concave intersection problem (11.3) deserves a sepa-
rate statement in the form of weight splitting,though it is an immediatecorollary of the above
theorem.
Theorem 11.2 (Weight splitting for M♮
-concave intersection).
(1) A subset X ⊆ V maximizes w(X) + f1(X) + f2(X) if and only if there exist w1,w2 : V → R
such that
(i) [“weight splitting”] w(v) = w1(v) + w2(v) (v ∈ V),
(ii) X is a maximizer of f1[+w1],
(iii) X is a maximizer of f2[+w2].
(2) max
X
{w(X) + f1(X) + f2(X)}
= min
w1,w2
{max(f1[+w1]) + max(f2[+w2]) | w(v) = w1(v) + w2(v) (v ∈ V)}.
(3) If f1, f2 and w are all integer-valued, we may assume that w1,w2 : V → Z.
## 11.3 Optimality criterion by negative-cycles
As the second criterion for optimality we describe the negative-cycle criterion. First we need
to introduce the auxiliary graph GM = (Ṽ,AM) associated with a matching M satisfying
∂+
M ∈ dom f+
and ∂−
M ∈ dom f−
in (11.2). Define X = ∂+
M and Y = ∂−
M.
64The vertex set Ṽ of the auxiliary graph GM is given by Ṽ = V+
∪ V−
∪ {s+
, s−
}, where s+
and s−
are new vertices often referred to as “source vertex” and “sink vertex” respectively.
The arc set AM consists of nine disjoint parts:
AM = (A◦
∪ M◦
) ∪ (A+
∪ F+
∪ S+
) ∪ (A−
∪ F−
∪ S−
) ∪ R,
where57
A◦
= {a | a ∈ A} (copy of A),
M◦
= {a | a ∈ M} (a: reorientation of a),
A+
= {(u,v) | u ∈ X, v ∈ V+
\ X, X − u + v ∈ dom f+
},
F+
= {(u, s+
) | u ∈ X, X − u ∈ dom f+
}, (11.6)
S+
= {(s+
,v) | v ∈ V+
\ X, X + v ∈ dom f+
},
A−
= {(v,u) | u ∈ Y, v ∈ V−
\ Y, Y − u + v ∈ dom f−
},
F−
= {(s−
,u) | u ∈ Y, Y − u ∈ dom f−
},
S−
= {(v, s−
) | v ∈ V−
\ Y, Y + v ∈ dom f−
},
R = {(s−
, s+
),(s+
, s−
)}.
The arc length ℓM(a) for a ∈ AM is defined by
ℓM(a) =

                   
                   
−w(a) (a ∈ A◦
),
w(a) (a = (u,v) ∈ M◦
, a = (v,u) ∈ M),
f+
(X) − f+
(X − u + v) (a = (u,v) ∈ A+
),
f+
(X) − f+
(X − u) (a = (u, s+
) ∈ F+
),
f+
(X) − f+
(X + v) (a = (s+
,v) ∈ S+
),
f−
(Y) − f−
(Y − u + v) (a = (v,u) ∈ A−
),
f−
(Y) − f−
(Y − u) (a = (s−
,u) ∈ F−
),
f−
(Y) − f−
(Y + v) (a = (v, s−
) ∈ S−
),
0 (a ∈ R).
(11.7)
A directed cycle in GM of a negative length with respect to the arc length ℓM is called a
negative cycle. As is well known in network flow theory, there exists no negative cycle in
(GM,ℓM) if and only if there exists a potential p : Ṽ → R such that
ℓM(a) + p(∂+
a) − p(∂−
a) ≥ 0 (a ∈ AM), (11.8)
where ∂+
a denotes the initial (tail) vertex of a, and ∂−
a the terminal (head) vertex of a. With
the use of (11.4), (11.5) and (11.8), Theorem 11.1 is translated into the following theorem;
see Remark 11.1. This theorem (Murota 1996a, Theorem 5.2.42 of Murota 2003) gives an
optimality criterion in terms of negative cycles.
Theorem 11.3 (Negative-cycle criterion). In the M♮
-concave matching problem to maximize
(11.1), a matching M satisfying (11.2) is optimal if and only if there exists in the auxiliary
graph GM no negative cycle with respect to the arc length ℓM.
Remark 11.1. The condition (11.8) for a ∈ (F+
∪ S+
)∪ (F−
∪S−
) refers to p(s+
) and p(s−
),
while the potential p in Theorem 11.1 is defined only on V+
∪ V−
. To derive (11.8) from
57
The reorientation of an arc a = (u,v) means the arc (v,u), to be denoted as a.
65Theorem 11.1 we may define p(s+
) = p(s−
) = 0. Indeed, the conditions imposed on p(s+
) by
(11.8) are
f+
(X) − f+
(X − u) + p(u) − p(s+
) ≥ 0 (u ∈ X),
f+
(X) − f+
(X + v) + p(s+
) − p(v) ≥ 0 (v ∈ V+
\ X),
which are satisfied by (11.4) if p(s+
) = 0. Similarly for p(s−
).
## 11.4 Concluding remarks of section 11
Theorems 11.1 and 11.3 contain several standard results in matroid optimization, such as
Frank’s weight splittingtheorem (Frank 1981)for theweighted matroid intersection problem.
The proofs of Theorems 11.1 and 11.3 can be found in Murota (1996a) and Section 5.2 of
Murota (2000a). There are two key lemmas, called “upper-bound lemma” and “unique-max
lemma,” which capture the essential properties inherent in M-concavity. On the basis of these
optimalitycriteriaefficient algorithmscan bedesignedfortheM♮
-concavematchingproblem.
For algorithmic issues, see Murota (1996b) and Section 6.2 of Murota (2000a).
The valuated matching problem treated in this section is generalized to the submodular
flow problem in Section 12.
## 12 Submodular Flow Problem
## 12.1 Submodular flow problem
Let G = (V,A) be a directed graph with vertex set V and arc set A. Suppose that each arc
a ∈ A is associated with upper-capacity c(a), lower-capacity c(a), and cost γ(a) per unit flow.
Furthermore, for each vertex v ∈ V, the amount of flow supply at v is specified by x(v).
The minimum cost flow problem is to find a flow ξ = (ξ(a) | a ∈ A) that minimizes
the total cost hγ,ξiA =
P
a∈A γ(a)ξ(a) subject to the capacity constraint c(a) ≤ ξ(a) ≤ c(a)
(a ∈ A) and the supply specification. Here the supply specification means a constraint that
the boundary ∂ξ of ξ defined by
∂ξ(v) =
X
{ξ(a) | a ∈ δ+
v} −
X
{ξ(a) | a ∈ δ−
v} (v ∈ V) (12.1)
should be equal to a given value x(v), where δ+
v and δ−
v denote thesets of arcs leaving (going
out of) v and entering (coming into) v, respectively. We can interpret x(v) = ∂ξ(v) as the net
amount of flow entering the network at v from outside.
We consider the integer flow problem, which is described by an integer-valued upper-
capacity c : A → Z∪{+∞}, an integer-valued lower-capacity c : A → Z∪{−∞}, a real-valued
cost function γ : A → R, and an integer supply vector x : V → Z, where it is assumed that
c(a) ≥ c(a) for each a ∈ A. The variable to be optimized is an integral flow ξ : A → Z.
[Minimum cost flow problem MCFP (linear arc cost)]58
Minimize Γ0(ξ) =
X
a∈A
γ(a)ξ(a) (12.2)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (12.3)
∂ξ = x, (12.4)
ξ(a) ∈ Z (a ∈ A). (12.5)
58
MCFP stands for Minimum Cost Flow Problem.
66A generalization of the minimum cost flow problem MCFP is obtained by relaxing the
supply specification ∂ξ = x to the constraint that the flow boundary ∂ξ should belong to a
given subset B of ZV
representing “feasible” or “admissible” supplies59
:
∂ξ ∈ B. (12.6)
Such problem is called the submodular flow problem, if B is an M-convex set (integral base
polyhedron; see Remark 4.2)60
. This problem is introduced by Edmonds and Giles (1977).
[Submodular flow problem MSFP1 (linear arc cost)]61
Minimize Γ1(ξ) =
X
a∈A
γ(a)ξ(a) (12.7)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (12.8)
∂ξ ∈ B, (12.9)
ξ(a) ∈ Z (a ∈ A). (12.10)
A further generalization of the problem is obtained by introducing a cost function for the
flow boundary ∂ξ rather than merely imposingthe constraint ∂ξ ∈ B. Namely, with a function
f : ZV
→ R ∪ {+∞} we add a new term f(∂ξ) to the objective function, thereby imposing
constraint ∂ξ ∈ B = dom f implicitly. If the function f is M-convex, the generalized problem
is called the M-convex submodular flow problem, introduced by Murota (1999).
[M-convex submodular flow problem MSFP2 (linear arc cost)]
Minimize Γ2(ξ) =
X
a∈A
γ(a)ξ(a) + f(∂ξ) (12.11)
subject to c(a) ≤ ξ(a) ≤ c(a) (a ∈ A), (12.12)
∂ξ ∈ dom f, (12.13)
ξ(a) ∈ Z (a ∈ A). (12.14)
The special case of the M-convex submodular flow problem MSFP2 with a {0,+∞}-valued f
reduces to the submodular flow problem MSFP1.
A still further generalization is possible by replacing the linear arc cost in Γ2 with a
separable convex function. Namely, using univariate convex functions62
fa : Z → R ∪ {+∞}
(a ∈ A), we consider
X
a∈A
fa(ξ(a)) instead of
X
a∈A
γ(a)ξ(a) to obtain MSFP3 below.
[M-convex submodular flow problem MSFP3 (nonlinear arc cost)]
Minimize Γ3(ξ) =
X
a∈A
fa(ξ(a)) + f(∂ξ) (12.15)
subject to ξ(a) ∈ dom fa (a ∈ A), (12.16)
∂ξ ∈ dom f, (12.17)
ξ(a) ∈ Z (a ∈ A). (12.18)
59
By the flow conservation law, the sum of the components of ∂ξ is equal to zero, i.e., ∂ξ(V) = 0, for any
flow ξ. Accordingly we assume that B is contained in the hyperplane {x ∈ RV
| x(V) = 0}.
60
In the conventionalformulation (Chapter III of Fujishige 2005), the M-convex set B is given by an integer-
valued submodular set function that describes B; see also Section 4.4 of Murota (2003).
61
MSFP stands for M-convex Submodular Flow Problem. We use denotation MSFPi with i = 1,2,3 to
indicate the hierarchy of generality in the problems.
62
fa(t − 1) + fa(t + 1) ≥ 2fa(t) for all integers t.
67V1
−f1(x1)
V2
−f2(−x2)
v10
v11
. . .
v1n
v20
v21
. . .
v2n
✲
✲
✲
✲
✲
Figure 5: M-convex submodular flow problem for M♮
-concave intersection problem
Obviously, MSFP2 is a special case of MSFP3 with
fa(t) =
(
γ(a)t (t ∈ [c(a),c(a)]Z),
+∞ (otherwise).
(12.19)
Conversely, MSFP3 can be put into the form MSFP2; see Remark 12.1.
Remark 12.1. Problem MSFP3 on G = (V,A) can be written in the form of MSFP2 on a
larger graph G̃ = (Ṽ,Ã). We replace each arc a = (u,v) ∈ A with a pair of arcs, a+
= (u,v−
a)
and a−
= (v+
a ,v), where v+
a and v−
a are newly introduced vertices. Accordingly, we have
Ã = {a+
,a−
| a ∈ A} and Ṽ = V ∪ {v+
a,v−
a | a ∈ A}. For each a ∈ A we consider a function
˜ fa : Z2
→ R ∪ {+∞} given by
˜ fa(t, s) =
(
fa(t) (t + s = 0),
+∞ (otherwise),
and define ˜ f : ZṼ
→ R ∪ {+∞} by
˜ f(x̃) =
X
a∈A
˜ fa(x̃(v+
a), x̃(v−
a)) + f(x̃|V) (x̃ ∈ ZṼ
),
where x̃|V denotes the restriction of x̃ to V. For a flow ξ̃ : Ã → Z, we have ξ̃(a+
) = ξ̃(a−
) if
(∂ξ̃(v+
a ),∂ξ̃(v−
a )) ∈ dom ˜ fa. Problem MSFP3 is thus reduced to MSFP2 with objective function
Γ̃2(ξ̃) = ˜ f(∂ξ̃), where the function ˜ f is M-convex.
Remark 12.2. The M♮
-concave intersection problem (Section 9.1) can be formulated as an
M-convex submodular flow problem. Suppose we want to maximize the sum f1(x) + f2(x)
of two M♮
-concave functions f1, f2 : Zn
→ R ∪ {−∞}. Let ˜ f1, ˜ f2 : Zn+1
→ R ∪ {−∞} be
the associated M-concave functions; see (4.18). We consider an M-convex submodular flow
problem on the bipartite graph G = (V1 ∪ V2,A) in Fig. 5, where Vi = {vi0,vi1,...,vin} for
i = 1,2 and A = {(v1j,v2j) | j = 0,1,...,n}. The boundary cost function f : ZV1
× ZV2
→
R ∪ {+∞} is defined by f(x1, x2) = − ˜ f1(x1) − ˜ f2(−x2) for x1 ∈ ZV1
and x2 ∈ ZV2
, which
is an M-convex function. The arc costs are identically zero and no capacity constraints are
imposed (γ(a) = 0, c(a) = +∞, c(a) = −∞ for all a ∈ A). Since x1 = −x2 if (x1, x2) = ∂ξ for a
flow ξ in this network, this M-convex submodular flow problem is equivalent to the problem
of maximizing f1(x) + f2(x). Theorem 9.4 for the M-convex intersection problem can be
regarded as a special case of Theorem 12.1 for the M-convex submodular flow problem.
In subsequent sections we show optimality criteria for the M-convex submodular flow
problem in terms of potentials and negative cycles.
6812.2 Optimality criterion by potentials
We showthe optimalitycriterion forthe M-convexsubmodularflow problemMSFP3 in terms
of potentials. A potential means a function p : V → R (or a vector p ∈ RV
) on the vertex set
V. The coboundary of a potential p is a function δp : A → R on the arc set A defined by
δp(a) = p(∂+
a) − p(∂−
a) (a ∈ A), (12.20)
where, for each arc a ∈ A, ∂+
a denotes the initial (tail) vertex of a and, ∂−
a the terminal
(head) vertex of a. The following theorem is due to Murota (1999); see also Section 9.4 of
Murota (2003).
Theorem 12.1(Potentialcriterion). ConsidertheM-convexsubmodularflowproblemMSFP3.
(1) For a feasible flow ξ : A → Z, two conditions (OPT) and (POT) below are equivalent.
(OPT) ξ is an optimal flow.
(POT) There exists a potential p : V → R such that63
(i) ξ(a) ∈ argmin fa[+δp(a)] for every a ∈ A, and
(ii) ∂ξ ∈ argmin f[−p].
(2) Suppose that a potential p : V → R satisfies (i) and (ii) above for an optimal flow ξ. A
feasible flow ξ′
is optimal if and only if
(i) ξ′
(a) ∈ argmin fa[+δp(a)] for every a ∈ A, and
(ii) ∂ξ′
∈ argmin f[−p].
(3) If the cost functions fa (a ∈ A) and f are integer-valued, there exists an integer-valued
potential p : V → Z in (POT). Moreover, the set of integer-valued optimal potentials,
Π∗
= {p | p : integer-valued optimal potential},
is an L-convex set64
.
In connection to (i) and (ii) in (POT) in Theorem 12.1, note the equivalences:
ξ(a) ∈ argmin fa[+δp(a)]
⇐⇒ fa(ξ(a) + d) − fa(ξ(a)) + d[p(∂+
a) − p(∂−
a)] ≥ 0 (d = ±1), (12.21)
∂ξ ∈ argmin f[−p]
⇐⇒ ∆f(∂ξ;v,u)+ p(u) − p(v) ≥ 0 (∀u,v ∈ V), (12.22)
where
∆f(z;v,u) = f(z + χv − χu) − f(z) (z ∈ dom f;u,v ∈ V). (12.23)
These expressions are crucial in deriving the second optimality criterion (Theorem 12.2) in
Section 12.3 and in designing efficient algorithms for the M-convex submodular flow prob-
lem.
63
By notation (4.20), fa[+δp(a)] means the function defined as fa[+δp(a)](t) = fa(t)+(p(∂+
a)− p(∂−
a))t for
all t ∈ Z.
64
A nonempty set P ⊆ Zn
is called an L-convex set if it is an L♮
-convex set (Remark 7.4) such that p ∈ P
implies p + 1, p − 1 ∈ P. See Chapter 5 of Murota (2003) for details.
6912.3 Optimality criterion by negative cycles
The optimality of an M-convex submodular flow can also be characterized by the nonex-
istence of negative cycles in an auxiliary network. This fact leads to the cycle-cancelling
algorithm. We consider the M-convex submodular flow problem MSFP2 that has a linear arc
cost. This is not restrictive, since MSFP3 can be put in the form of MSFP2 (Remark 12.1).
For a feasible flow ξ : A → Z we define an auxiliary network as follows. Let Gξ = (V,Aξ)
be a directed graph with vertex set V and arc set Aξ = A◦
ξ ∪B◦
ξ ∪Cξ consisting of three disjoint
parts:
A◦
ξ = {a | a ∈ A, ξ(a) < c(a)},
B◦
ξ = {a | a ∈ A, c(a) < ξ(a)} (a: reorientation of a),
Cξ = {(u,v) | u,v ∈ V, u , v, ∂ξ − (χu − χv) ∈ dom f}. (12.24)
We define an arc length function ℓξ : Aξ → R by
ℓξ(a) =

    
    
γ(a) (a ∈ A◦
ξ),
−γ(a) (a ∈ B◦
ξ, a ∈ A),
∆f(∂ξ;v,u) (a = (u,v) ∈ Cξ).
(12.25)
We refer to (Gξ,ℓξ) as the auxiliary network.
A directed cycle in Gξ of a negative length with respect to the arc length ℓξ is called a
negative cycle. As is well known in network flow theory, there exists no negative cycle in
(Gξ,ℓξ) if and only if there exists a potential p : V → R such that
ℓξ(a) + p(∂+
a) − p(∂−
a) ≥ 0 (a ∈ Aξ). (12.26)
With the use of (12.21), (12.22) and (12.26), Theorem 12.1 is translated into the following
theorem (Murota 1999; see also Section 9.5 of Murota 2003), which gives an optimality
criterion in terms of negative cycles.
Theorem 12.2 (Negative-cycle criterion). For a feasible flow ξ : A → Z to the M-convex
submodular flow problem MSFP2, the conditions (OPT) and (NNC) below are equivalent.
(OPT) ξ is an optimal flow.
(NNC) There exists no negative cycle in the auxiliary network (Gξ,ℓξ) with ℓξ of (12.25).
Cycle cancellation: The negative-cycle optimality criterion states that the existence of a
negative cycle implies the non-optimality of a feasible flow. This suggests the possibility of
improvinga non-optimalfeasibleflow by thecancellation of a suitablychosen negativecycle.
Suppose that negative cycles exist in the auxiliary network (Gξ,ℓξ) for a feasible flow ξ,
where the arc length ℓξ is defined by (12.25). Choose a negative cycle having the smallest
number of arcs, and let Q (⊆ Aξ) be the set of its arcs. Modifying the flow ξ along Q by a unit
amount we obtain a new flow ξ defined by
ξ(a) =

    
    
ξ(a) + 1 (a ∈ Q ∩ A◦
ξ),
ξ(a) − 1 (a ∈ Q ∩ B◦
ξ),
ξ(a) (otherwise).
(12.27)
70Thefollowingtheorem65
showsthattheupdated flowξ is afeasibleflowwith an improvement
in the objective function in (12.11):
Γ2(ξ) =
X
a∈A
γ(a)ξ(a) + f(∂ξ).
Theorem 12.3. For a feasible flow ξ : A → Z to the M-convex submodular flow problem
MSFP2, let Q be a negative cycle having the smallest number of arcs in (Gξ,ℓξ). Then ξ in
(12.27) is a feasible flow and
Γ2(ξ) ≤ Γ2(ξ) + ℓξ(Q) < Γ2(ξ). (12.28)
## 12.4 Concluding remarks of section 12
On the basis of the optimality criteria in Theorems 12.1 and 12.2 we can design efficient
algorithms for the M-convex submodular flow problem, where the expressions (12.21) and
(12.22)arecrucial. Foralgorithmicissues,seeMurota(1999), Section 10.4ofMurota(2003),
Iwata and Shigeno (2003), Murota and Tamura (2003b), and Iwata et al. (2005).
## 13 Discrete Fixed Point Theorem
Discrete fixed point theorems in discrete convex analysis originate in the theorem of Iimura
et al. (2005) based on Iimura (2003), which is described in this section. Subsequent develop-
ment and other types of discrete fixed point theorems are mentioned in Section 13.5.
## 13.1 Discrete fixed point theorem
To motivate the discrete fixed point theorem of Iimura et al. (2005), we first take a glimpse at
Kakutani’s fixed point theorem.
Let S be a subset of Rn
and F be a set-valued mapping (correspondence) from S to itself,
which is denoted as F : S →→ S (or F : S → 2S
). A point x ∈ S satisfying x ∈ F(x) is said
to be a fixed point of F. Kakutani’s fixed point theorem reads as follows.
Theorem 13.1. A set-valued mapping F : S →→ S, where S ⊆ Rn
, has a fixed point if
(a) S is a bounded closed convex subset of Rn
,
(b) For each x ∈ S, F(x) is a nonempty closed convex set, and
(c) F is upper-hemicontinuous.
In the discrete fixed point theorem (Theorem 13.2 below) we are concerned with F :
S →→ S, where S is a subset of Zn
. The three conditions (a) to (c) in Theorem 13.1 above
are “discretized” as follows.
• Condition(a) assumesthatthedomainofdefinitionS is nicely-shapedorwell-behaved.
In the discrete case we assume S to be “integrally convex.”
• Condition (b) assumes that each value F(x) is nicely-shaped or well-behaved. In the
discrete case we assume that F(x) = F(x) ∩ Zn
, where F(x) denotes the convex hull of
F(x).
65
The inequality (12.28) is by no means obvious. See Murota (1999) and Section 10.4 of Murota (2003) for
the proof.
71y y
Figure 6: Integral neighbor N(y) of y (◦: point of N(y))
Integrally convex Not integrally convex Not integrally convex
Figure 7: Concept of integrally convex sets
Figure 7: Concept of integrally convex sets
• Condition (c) assumes that mapping F is continuous in some appropriate sense. In the
discrete case we assume F to be “direction-preserving.”
The key concepts, “integrally convex set” and “direction-preserving mapping,” are ex-
plained in Section 13.2. The discrete fixed point theorem of Iimura et al. (2005) is the fol-
lowing.
Theorem 13.2. A set-valued mapping F : S →→ S, where S ⊆ Zn
, has a fixed point if
(a) S is a nonempty finite integrally convex subset of Zn
,
(b) For each x ∈ S, F(x) is nonempty and F(x) = F(x) ∩ Zn
, and
(c) F is direction-preserving.
## 13.2 Integrally convex set and direction-preserving mapping
Integrally convex set: The integral neighborhood of a point y ∈ Rn
is defined as
N(y) = {z ∈ Zn
| kz − yk∞ < 1}. (13.1)
See Fig. 6. A set S ⊆ Zn
is said to be integrally convex if
y ∈ S =⇒ y ∈ S ∩ N(y) (13.2)
for any y ∈ Rn
(Favati and Tardella 1990). Figure 7 illustrates this concept. We have S =
S ∩Zn
for an integrally convex set S. It is known that L♮
-convex sets and M♮
-convex sets are
integrally convex. See Section 3.4 of Murota (2003) and Moriguchi et al. (2016) for more
about integral convexity.
Direction-preserving mapping: Let S be a subset of Zn
and F : S →→ S be a set-
valued mapping (correspondence) from S to S. For x = (x1,..., xn) ∈ Zn
we denote by
π(x) = (π1(x),...,πn(x)) ∈ Rn
the projection of x to F(x); see Fig. 8. This means that π(x)
72x
❥
π(x)
F(x)
Figure 8: Projection ) with sign( 1)
Figure 8: Projection π(x) with σ(x) = sign(π(x) − x) = (+1,−1)
is the point of F(x) that is nearest to x with respect to the Euclidean norm. We define the
direction sign vector σ(x) ∈ {+1,0,−1}n
as
σ(x) = (σ1(x),...,σn(x)) = (sign(π1(x) − x1),...,sign(πn(x) − xn)),
where
sign(y) =

   
   
+1 (y > 0),
0 (y = 0),
−1 (y < 0).
Then we say that F is direction-preserving if for all x,z ∈ S with kx − zk∞ ≤ 1 it holds that
σi(x) > 0 =⇒ σi(z) ≥ 0 (i = 1,...,n). (13.3)
Note that this is equivalent to saying that σi(x)σi(z) , −1 for each i = 1,...,n if x,z ∈ S and
kx − zk∞ ≤ 1. Being direction-preserving is interpreted as being “continuous” in the discrete
setting.
## 13.3 Illustrative examples
Example 13.1. The significance of being direction-preserving is most transparent in the case
of n = 1. Let S = [a,b]Z be an integer interval with a,b ∈ Z and a ≤ b. Consider F : S →→
S represented as F(x) = [α(x),β(x)]Z, where α(x),β(x) ∈ Z and a ≤ α(x) ≤ β(x) ≤ b. The
projection π(x) and the direction sign vector σ(x) are given by
π(x) =

   
   
x (α(x) ≤ x ≤ β(x)),
α(x) (x ≤ α(x) − 1),
β(x) (x ≥ β(x) + 1),
σ(x) =

   
   
0 (α(x) ≤ x ≤ β(x)),
+1 (x ≤ α(x) − 1),
−1 (x ≥ β(x) + 1).
Suppose that F is direction-preserving, which means σ(x)σ(x + 1) , −1 for all x with a ≤
x < b. There are three possibilities:
(i) σ(x) = +1 for all x ∈ S,
(ii) σ(x) = −1 for all x ∈ S,
(iii) σ(x) = 0 for some x ∈ S.
In the first case (i) we must have x + 1 ≤ α(x) ≤ b for all x ∈ S, but this is impossible for
x = b. Similarly, the second case (ii) is not possible, either. Therefore, we must have the third
case (iii), and then the x satisfying σ(x) = 0 is a fixed point of F.
733
2
1
a
b c d
e
9: Necessity of the assumption of integral convexity
is equivalent to saying that 1 for each ,..., if and
1. Being direction-preserving is interpreted as being “continuous” in the discrete
Illustrative examples
of being direction-preserving is most transparent in the case
of 1. Let be an integer interval with . Consider →→
as ,β )] , where ,β . The
) and the direction sign vector ) are given by
))
) ( 1)
) ( 1)
0 ( ))
1 ( 1)
1 ( 1)
is direction-preserving, which means 1) 1 for all
. There are three possibilities:
= +1 for all
1 for all
0 for some
In the first case (i) we must have , but this is impossible for
. Similarly, the second case (ii) is not possible, either. Therefore, we must have the third
0 is a fixed point of
(a) of integral convexity in Theorem 13.2 cannot be weak-
to the “hole-free” property: . Let 3 and consider a subset of 9)
given by
(0 0) (1 0) (2 0) (3 0) (4 1)
is not integrally convex, but satisfies . Define →→ by
For each ) is a nonempty subset of . Furthermore,
is direction-preserving. Indeed we have
( 4 1)
( 3 1)
( 0 2)
0)
1)
1)
1)
( 0 1)
0)
1)
77
Figure 9: Necessity of the assumption of integral convexity
Example 13.2. The assumption (a) of integral convexity in Theorem 13.2 cannot be weak-
ened to the “hole-free” property: S = S ∩Zn
. Let n = 3 and consider a subset S of Z3
(Fig. 9)
given by
S = {a = (0,1,0), b = (1,0,0), c = (2,0,0), d = (3,0,0), e = (4,0,1)},
which is not integrally convex, but satisfies S = S ∩ Zn
. Define F : S →→ S by
F(a) = F(b) = {e}, F(c) = {a,e}, F(d) = F(e) = {a}.
For each x ∈ S, F(x) is a nonempty subset of S satisfying F(x) = F(x) ∩ Zn
. Furthermore, F
is direction-preserving. Indeed we have
π(a) − a = ( 4, −1, 1),
π(b) − b = ( 3, 0, 1),
π(c) − c = ( 0, 1/2, 1/2),
π(d) − d = (−3, 1, 0),
π(e) − e = (−4, 1, −1),
σ(a) = (+1, −1, +1),
σ(b) = (+1, 0, +1),
σ(c) = ( 0, +1, +1),
σ(d) = (−1, +1, 0),
σ(e) = (−1, +1, −1)
and the condition (13.3) holds for every pair (x,z) with kx − zk∞ ≤ 1, i.e., for (x,z) =
(a,b),(b,c),(c,d),(d,e). Thus, F meets the conditions (b) and (c) in Theorem 13.2, but F
has no fixed point.
13.4 Proof outline
The proof of Theorem 13.2 consists of the following three major steps; the reader is referred
to Iimura et al. (2005) for the detail.
1. An integrally convex set S has a simplicial decomposition T with a nice property. For
each y ∈ Rn
contained in the convex hull of S, let T(y) denote the smallest simplex in
T that contains y. Then the simplicial decomposition T has the property that all the
vertices of T(y) belong to the integral neighborhood N(y) of y. That is, the set of the
vertices of T(y), to be denoted by V(y), is given as V(y) = T(y) ∩ N(y).
2. With reference to the simplicial decomposition T, we define a piecewise linear exten-
sion, say, f of the projection π by
f(y) =
X
x∈V(y)
λxπ(x) (y =
X
x∈V(y)
λxx,
X
x∈V(y)
λx = 1, λx ≥ 0).
By Brouwer’s fixed point theorem applied to f : S → S, we obtain a fixed point y∗
∈ S
of f, i.e., y∗
= f(y∗
).
743. From the equations
X
x∈V(y∗)
λx(π(x) − x) =
X
x∈V(y∗)
λxπ(x) −
X
x∈V(y∗)
λxx = f(y∗
) − y∗
= 0
and the assumption of F being direction-preserving, we see that π(x) − x = 0 for some
x ∈ V(y∗
). Let x∗
be such a point in V(y∗
). Then x∗
is a fixed point of F, since
x∗
= π(x∗
) ∈ F(x∗), from which follows x∗
∈ F(x∗) ∩ Zn
= F(x∗
) by condition (b).
## 13.5 Concluding remarks of section 13
The discrete fixed point theorem initiated by Iimura (2003) and Iimura et al. (2005) aims at
a discrete version of Brouwer’s fixed point theorem. Related work in this direction includes
van der Laan et al. (2006), Danilov and Koshevoi(2007), Chen and Deng (2006, 2008, 2009),
Yang (2008, 2009), Talman and Yang (2009), Iimura and Yang (2009), Iimura (2010), Deng
et al. (2011), van der Laan et al. (2011), and Iimura et al. (2012). Discrete fixed point the-
orems are used successfully in showing the existence of a competitive equilibrium under
indivisibility, a pure Nash equilibrium with discrete strategy sets, etc.
Efforts are made to weaken the condition (c) of “direction preserving” in Theorem 13.2.
Weaker conditions called “locally gross direction preserving” and “simplicially locally gross
direction preserving” are considered by Yang (2008, 2009), Iimura and Yang (2009), Iimura
(2010). Further variants are found in Talman and Yang (2009), van der Laan et al. (2011),
and Iimura et al. (2012). These studies, however, share the framework of mappings and
correspondences defined on integrally convex sets or their simplicial divisions.
TheproofofTheorem13.2byIimuraetal.(2005)isnotconstructive,relyingonBrouwer’s
fixed point theorem. Constructive proofs are given by van der Laan et al. (2006) and van der
Laan et al. (2011). Computationalcomplexityoffindinga fixed pointfordirection-preserving
mappings is discussed by Chen and Deng (2006, 2008, 2009) and Deng et al. (2011).
Another type of (discrete) fixed point theorem, the lattice-theoretical fixed point theorem
of Tarski (1955), is a powerful tool used extensively in economics and game theory; see
Milgrom and Roberts (1990), Vives (1990), and Topkis (1998). For stable matchings, use
and powerofTarski’sfixed pointtheoremare demonstratedby Adachi (2000), Fleiner(2003),
and Farooq et al. (2012). It may be said, however, that Tarski’s fixed point theorem is rather
independent of discrete convex analysis.
Yet another type of discrete fixed point theorems are considered in the literature, includ-
ing Robert (1986), Shih and Dong (2005), Richard (2008), Sato and Kawasaki (2009) and
Kawasaki et al. (2013).
## 14 Other Topics
## 14.1 Matching market and economy with indivisible goods
Since the seminal paper by Kelso and Crawford (1982), the concept of gross substitutes with
its variants has turned out to be pivotal in discussing matching market and economy with in-
divisible goods. The literature includes, e.g., Roth and Sotomayor (1990), Bikhchandani and
Mamer (1997), Gul and Stacchetti (1999), Ausubel and Milgrom (2002), Milgrom (2004),
Hatfield and Milgrom (2005), Ausubel (2006), Sun and Yang (2006), Milgrom and Strulovici
(2009), and Hatfield et al. (2016).
75Application of discrete convex analysis to economics was started by Danilov et al. (1998,
2001) for the Walrasian equilibrium of indivisible markets (see also Chapter 11 of Murota
2003). The interaction between economics and discrete convex analysis was reinforced deci-
sively by the observation of Fujishige and Yang (2003) that M♮
-concavity (of set functions)
is equivalent to the gross substitutes property (Theorem 3.7 in Section 3.3). This equivalence
is extended to functions in integer variables (Section 4.3). While the reader is referred to
Tamura (2004) and Chapter 11 of Murota (2003) for this earlier development, we mention
more recent papers below.
As described in Section 10, the Fujishige-Tamura model of two-sided matching markets,
proposed by Fujishige and Tamura (2006, 2007), is a common generalization of the stable
marriage model (Gale and Shapley 1962) and the assignment game (Shapley and Shubik
1972).
Inoue (2008) uses the property of M♮
-convex sets that they are closed under (Minkowski)
summation, to show that the weak core in a finite exchange economy is nonempty if every
agent’s upper contour set is M♮
-convex. Kojima et al. (2018) present a unified treatment of
two-sidedmatchingmarketswithavarietyofdistributionalconstraintsthatcan berepresented
by M♮
-concave functions. It is shown that the generalized deferred acceptance algorithm is
strategy-proof and yields a stable matching. Yokote (2016) considers a market in which each
buyer demands at most one unit of commodity and each seller produces multiple units of
several types of commodities. The core and the competitive equilibria are shown to exist and
coincide under the assumption that the cost function of each seller is M♮
-convex.
Algorithmic aspects of Walrasian equilibria are fully investigated by Paes Leme and
Wong (2020) in a general setting, in which the algorithms from discrete convex analysis are
singled out as efficient methods for the gross substitutes case. See also Paes Leme (2017) as
well as Murota and Tamura (2003b) and Section 11.5 of Murota (2003).
## 14.2 Trading networks
M♮
-concavity plays a substantial role in the modeling and analysis of vertical trading net-
works (supply chain networks) introduced by Ostrovsky (2008) and investigated in a more
generalsettingbyHatfieldetal.(2013),Fleiner(2014), Fleineretal.(2015), Ikebeetal.(2015),
Ikebe and Tamura (2015), and Candogan et al. (2016).
In a trading network, an agent is identified with a vertex (node) of the network. In-
coming arcs to a vertex represent the trades in which the agent acts as a buyer and out-going
arcs represent the trades in which the agent acts as a seller. Each vertex v of the network is
associated with a choice function Cv and/or a valuation function fv of the agent, defined on
the set Uv ∪ Wv of the arcs incident to v, where Uv is the set of in-coming arcs to the vertex
v and Wv is the set of out-going arcs from v. In particular, the function fv is a set function on
Uv ∪ Wv in the single-unit case, whereas it is a function on ZUv∪Wv
in the multi-unit case.
In the single-unit case, Ostrovsky (2008) identifies the key property of a choice function,
called the same-side substitutability (SSS) and the cross-side complementarity (CSC), which
are discussed in Section 3.5. These properties are satisfied by the choice function induced
from a unique-selecting twisted M♮
-concave valuation function fv, with twisting by Wv; see
Theorem 3.13. The multi-unit case is treated by Ikebe and Tamura (2015). The conditions
(SSS) and (CSC) are generalized to (SSS-CSC1
[Z]) and (SSS-CSC2
[Z]), and these conditions
are shown to be satisfied by the choice function induced from a unique-selecting twisted M♮
-
concave valuation fv; see Theorem 4.14 in Section 4.5.
76Discrete convex analysis is especially relevant and useful when valuation functions and
the price vector p are explicitly involved in the model as in Hatfield et al. (2013), Ikebe et
al. (2015), and Candogan et al. (2016). Specifically, we can use the results from discrete
convex analysis as follows:
• The existence of a competitive equilibrium (Hatfield et al. 2013, Definition 3) can be
proved with the aid of the M♮
-concave intersection theorem (Theorem 9.4).
• The lattice structure of the equilibrium price vectors can be shown through the conju-
gacy relationship between M♮
-concavity and L♮
-convexity (Section 7.2).
• The equivalence of chain stability and stability can be established with the aid of the
negative-cycle criterion for the M-convex submodular flow problem (Theorem 12.2).
Recall from Remark 12.2 that the M♮
-concave intersection problem can be formulated
as an M-convex submodular flow problem.
• Fundamental computational problems for a trading network, such as checking stability,
computing a competitive equilibrium, and maximizing the welfare, can often be solved
with the aid of algorithms known in discrete convex analysis, such as those for maxi-
mizing M♮
-concave functions and for solving the M-convex submodular flow problem.
See Candogan et al. (2016) as well as Murota and Tamura (2003b), Section 11.5 of
Murota (2003), and Ikebe et al. (2015).
## 14.3 Congestion games
Congestion games (Rosenthal 1973), which are equivalent to (exact) “finite” potential games
(Monderer and Shapley 1996), are a class of games possessing a Nash equilibrium in pure
strategies. There are various generalizations of potential games, such as: ordinal and gener-
alized ordinal (Monderer and Shapley 1996) and best-response (Voorneveld 2000) potential
games. For algorithmic aspects of congestion games, we refer to Roughgarden (2007) and
Tardos and Wexler (2007).
Recently, a connection is made by Fujishige et al. (2015) between congestion games on
networks and discrete convex analysis. It has been known (Fotakis 2010) that for every
congestion game on an extension-parallel network, considered by Holzman and Law-yone
(2003), any best-response sequence reaches a pure Nash equilibrium of the game in n steps,
where n is the number of players. It is pointed out by Fujishige et al. (2015) that the fast
convergence of best-response sequences is a consequence of M♮
-convexity of the associated
potential function, which is a laminar convex function and hence is M♮
-convex; see (4.35) in
Section 4.6.
In economics, potential games on somesubset of a Euclidean space are more widely stud-
ied. A maximizer of (some sort of) potential function is a Nash equilibrium. We also have
the converse if the potential function is “concave,” since local optimality implies the global
optimality there. Ui (2006, 2008) studies the condition for a local maximizer of a function
on the integer lattice to become a global maximizer of the function as well, with application
to best-response potential games on the integer lattice. In Ui (2008), it is shown that a condi-
tion analogous to midpoint concavity, called “larger midpoint property,” is sufficient for the
equivalence of local optimality and global optimality, and shows the equivalence of a Nash
77equilibrium and a maximizer of the best-response potential function. A more general condi-
tion for the equivalence of local and global optimality is studied in Ui (2006), along with its
relation to M-, L-, L♮
-, and M♮
-convex functions.
## 14.4 Integrally concave games
Another study on the games on the integer lattice Zn
is found in Iimura and Watanabe (2014),
which deals with n-person symmetric games with integrally concave payoff functions defined
on the n-product of a finite integer interval. Here, the integral concavity is in the sense of Fa-
vati and Tardella (1990); see also Section 3.4 of Murota (2003). It is shown that every game
in this class of games has a (not necessarily symmetric) Nash equilibrium, which is located
within a unit distance from the diagonal of strategy space. Although assuming concavity on
the entire strategy space is somewhat stringent, this result generalizes the result of Cheng et
al. (2004) that every n-person symmetric“two-strategy” game has a (not necessarily symmet-
ric) Nash equilibrium, because any real-valued function on the n-product of a doubleton is
integrally concave. A further generalization has been made by Iimura and Watanabe (2016),
whichimpliestheexistenceofan equilibriumin discreteCournotgamewithconcaveindustry
revenue, convex cost, and nonincreasing inverse demand.
## 14.5 Unimodularity and tropical geometry
Unimodular coordinate transformations are a natural operation for discrete convexity. In
Section 4.7 we have mentioned that a function f is twisted M♮
-concave if and only if it
is represented as f(x) = g(Ux) with U = diag(1,...,1,−1,...,−1) for some M♮
-concave
functiong. AnothersuchexampleismultimodularfunctionsofHajek(1985)usedindiscrete-
event control (Altman et al. 2000). A function f : Zn
→ R∪{+∞} is said to be multimodular
if the function ˜ f : Zn+1
→ R ∪ {+∞} defined by ˜ f(x0, x) = f(x1 − x0, x2 − x1,..., xn − xn−1)
for x0 ∈ Z and x ∈ Zn
is submodular in n + 1 variables. This means that f is multimodular
if and only if the function g(x) = f(Dx) is L♮
-convex, where D = (dij | 1 ≤ i, j ≤ n) is a
bidiagonal matrix defined by dii = 1 (i = 1,...,n) and di+1,i = −1 (i = 1,...,n − 1). This
matrix D is unimodular, and its inverse D−1
is an integral matrix with (D−1
)ij = 1 for i ≥ j and
(D−1
)ij = 0 for i < j. Therefore, a function f is multimodular if and only if it is represented
as f(x) = g(Ux) with U = D−1
for some L♮
-convex function g.
The fundamental role of unimodularity for discrete convexity, beyond unimodular coor-
dinate transformations, is investigated in Danilov and Koshevoy (2004) under the name of
“unimodular systems.” An application of unimodular systems to competitive equilibrium is
found in Danilov et al. (2001).
Another recent topic, of a similar flavor, is tropical geometry. Baldwin and Klemperer
(2019) investigate indivisibility issues in terms of tropical geometry. The Ricardian theory
of international trade is treated by Shiozawa (2015), mechanism design by Crowell and Tran
(2016), and dominant strategy implementation by Weymark (2016). The interaction of tropi-
cal geometry with economics has just begun66
.
66
A summer schoolentitled “Economicsand TropicalGeometry”was organizedby Ngoc Tran andJosephine
Yu at Hausdorff Center for Mathematics, Bonn, May 2016.
78Acknowledgements
The author would like to thank Zaifu Yang for offering the opportunity of this survey pa-
per. Special thanks go to Akiyoshi Shioura and Akihisa Tamura for carefully reading all
the manuscript and making constructive comments. The author is also indebted to Satoru
Fujishige, Takuya Iimura, Satoko Moriguchi, and Yu Yokoi for helpful suggestions. This
work was supported by TheMitsubishiFoundation, CREST, JST, and JSPS KAKENHIGrant
Number 26280004.
References
A. Abdulkadiroğlu and T. Sönmez (2013): Matching Markets: Theory and Practice, in: D.
Acemoglu,M.Arello, and E.Dekel, eds., Advances inEconomicsand Econometrics,Vol.1,
Cambridge University Press, Cambridge, 3–47.
H. Adachi (2000): On a characterization of stable matchings, Economic Letters, 68, 43–49 .
A. Alkan (2002): A class of multipartner matching markets with a strong lattice structure,
Economic Theory, 19, 737–746.
A. Alkan and D. Gale (2003): Stable schedule matching under revealed preference, Journal
of Economic Theory, 112, 289–306.
E. Altman, B. Gaujal, and A. Hordijk (2000): Multimodularity, convexity, and optimization
properties, Mathematics of Operations Research, 25, 324–347.
T. Andersson, C. Andersson, and A.J.J. Talman (2013): Sets in excess demand in simple
ascending auctions with unit-demand bidders, Annals of Operations Research, 211, 27–36.
T. Andersson and A. Erlanson (2013): Multi-item Vickrey–English–Dutch auctions, Games
and Economic Behavior, 81, 116–129.
K. J. Arrow and F. H. Hahn (1971): General Competitive Analysis, Holden–Day, San Fran-
cisco.
L. M. Ausubel (2006): An efficient dynamic auction for heterogeneous commodities, Ameri-
can Economic Review, 96, 602–629.
L. M. Ausubel, P. Milgrom (2002): Ascending auctions with package bidding, Frontiers of
Theoretical Economics, 1, Issue 1, Article 1.
E. Baldwin and P. Klemperer (2019): Understanding preferences: “demand types”, and the
existence of equilibrium with indivisibilities, Econometrica, 87, 867–932.
S. Bikhchandani and J. W. Mamer (1997): Competitive equilibrium in an exchange economy
with indivisibilities, Journal of Economic Theory, 74, 385–413.
L. Blumrosen and N. Nisan (2007): Combinatorial auctions, in: N. Nisan, T. Roughgarden,
É. Tardos, V. V. Vazirani, eds., Algorithmic Game Theory, Cambridge University Press,
Cambridge, Chapter 11, 267–299.
O. Candogan, M. Epitropou and R. V. Vohra (2016): Competitive equilibrium and trading
networks: A network flow approach, EC’16, The 17th ACM Conference on Economics
and Computation, July 2016, Maastricht, The Netherlands.
79X. Chen and X. Deng (2006): Lattice embedding of direction-preserving correspondence
over integrally convex set, in: S.-W. Cheng and C. K. Poon, eds., Algorithmic Aspects in
Information and Management Second International Conference, AAIM 2006, Hong Kong,
China, June 20-22, 2006. Lecture Notes in Computer Science, 4041, 53–63.
X. Chen and X. Deng (2008):Matchingalgorithmicboundsforfindinga Brouwerfixed point,
Journal of ACM, 55, no. 3, Article 13.
X. Chen and X. Deng (2009): A simplicial approach for discrete fixed point theorems, Algo-
rithmica, 53, 250–262.
S.-F. Cheng, D. M. Reeves, Y. Vorobeychik, M. P. Wellman (2004): Notes on equilibria in
symmetric games, in: Proceedings of the 6th International Workshop on Game Theoretic
and Decision Theoretic Agents GTDT 2004.
P. Cramton, Y. Shoham, and R. Steinberg (2006): Combinatorial Auctions, MIT Press, Cam-
bridge.
R. A. Crowell and N. M. Tran (2016): Tropical geometry and mechanism design, Preprint
arXiv:1606.04880.
V. I. Danilov and G. A. Koshevoy (2004): Discrete convexity and unimodularity, I, Advances
in Mathematics, 189, 301–324.
V.I. Danilov and G.A. Koshevoi (2007): Existence of fixed points for mappings of finite sets
(in Russian), Mathematicheskie Zametki, 82, 201–206; English translation: Mathematical
Notes, 82, 174–179.
V. Danilov, G. Koshevoy, and C. Lang (2003): Gross substitution, discrete convexity, and
submodularity, Discrete Applied Mathematics, 131, 283–298.
V. Danilov, G. Koshevoy, and K. Murota (1998): Equilibria in economies with indivisible
goods and money, RIMS Preprint 1204, Kyoto University.
V. Danilov, G. Koshevoy, and K. Murota (2001): Discrete convexity and equilibria in
economies with indivisible goods and money, Mathematical Social Sciences, 41, 251–273.
V. I. Danilov and C. Lang (2001): The gross substitution property for piece-wise functions.
Economics and Mathematical Methods, 37, 50-63 (in Russian).
G. Debreu (1959): Theory of Value—An Axiomatic Analysis of Economic Equilibrium, John
Wiley and Sons, New York.
G. Demange, D. Gale, and M. Sotomayor (1986): Multi-item auctions, Journal of Political
Economy, 94, 863–872.
X. Deng, Q. Qi, A. Saberi, and J. Zhang (2011): Discrete fixed points: Models, complexities,
and applications, Mathematics of Operations Research, 36, 636–652.
A. W.M. Dress andW. Wenzel (1990): Valuatedmatroid:Anew lookat thegreedy algorithm,
Applied Mathematics Letters, 3, 33–35.
A. W. M. Dress and W. Wenzel (1992): Valuated matroids, Advances in Mathematics, 93,
214–250.
M. Drexl and A. Kleiner (2015): An efficient dynamic auction for general economies with
indivisibilities, Working Paper.
80J. Edmonds (1970): Submodular functions, matroids and certain polyhedra, in: R. Guy, H.
Hanani, N. Sauer, and J. Schönheim, eds., Combinatorial Structures and Their Applica-
tions, Gordon and Breach, New York, 69–87. Also in: M. Jünger, G. Reinelt, and G. Ri-
naldi, eds., Combinatorial Optimization—Eureka, You Shrink!, Lecture Notes in Computer
Science, 2570, Springer-Verlag, Berlin, 2003, 11–26.
J. Edmonds and R. Giles (1977): A min-max relation for submodular functions on graphs,
Annals of Discrete Mathematics, 1, 185–204.
A. Eguchi and S. Fujishige (2002): An extension of the Gale–Shapley stable matching al-
gorithm to a pair of M♮
-concave functions. Discrete Mathematics and Systems Science
Research Report, No. 02-05, Division of Systems Science, Osaka University.
A. Eguchi, S. Fujishige, and A. Tamura (2003): A generalized Gale-Shapley algorithm for a
discrete-concave stable-marriage model. in: T. Ibaraki, N. Katoh, and H. Ono, eds., Algo-
rithms and Computation,ISAAC2003, Lecture Notes in Computer Science, 2906, Springer-
Verlag, Berlin, 495–504.
K. Eriksson and J. Karlander (2000): Stable matching in a common generalization of the
marriage and assignment models, Discrete Mathematics, 217, 135–156.
R. Farooq, T. Fleiner and A. Tamura(2012): Matchingwith partially ordered contracts, Japan
Journal of Industrial and Applied Mathematics, 29, 401–417.
R. Farooq and A. Shioura (2005): A note on the equivalence between substitutability and
M♮
-convexity, Pacific Journal of Optimization, 1, 243–252.
R. Farooq and A. Tamura (2004): A new characterization of M♮
-convex set functions by
substitutability, Journal of Operations Research Society of Japan, 47, 18–24.
P. Favati and F. Tardella (1990): Convexity in nonlinear integer programming, Ricerca Oper-
ativa, 53, 3–44.
T. Fleiner (2001): A matroid generalization of the stable matching polytope, in: B. Gerards
and K. Aardal, eds., Integer Programming and Combinatorial Optimization, Lecture Notes
in Computer Science, 2081, Springer-Verlag, Berlin, 105–114.
T. Fleiner (2003): A fixed point approach to stable matchings and some applications, Mathe-
matics of Operations Research, 28, 103–126.
T. Fleiner (2014): On stable matchings and flows, Algorithms, 7, 1–14.
T. Fleiner, Z. Jankó, A. Tamura, and A. Teytelboym (2015): Stability in cyclic supply chains,
Proceedings of the 9th Hungarian-Japanese Symposium on Discrete Mathematics and Its
Applications, 423–429.
T. Fleiner and N. Kamiyama (2016): A matroidal approach to stable matchings with lower
quotas, Mathematics of Operations Research, 41, 734–744.
D. Fotakis (2010): Congestion games with linearly independent paths: Convergence time and
price of anarchy, Theory of Computing Systems, 47, 113–136.
A. Frank (1981): A weighted matroid intersection algorithm, Journal of Algorithms, 2, 328–
336.
A. Frank (1982): An algorithm for submodularfunctions on graphs, Annals of Discrete Math-
ematics, 16, 97–120.
81D. Fudenberg and J. Tirole (1991): Game Theory, MIT Press, Cambridge, MA.
S. Fujishige (1984): Theory of submodular programs: A Fenchel-type min-max theorem and
subgradients of submodular functions, Mathematical Programming, 29, 142–155.
S. Fujishige (2005): Submodular Functions and Optimization, 2nd ed., Elsevier, Amsterdam.
S. Fujishige (2014): Bisubmodular polyhedra, simplicial divisions, and discrete convexity,
Discrete Optimization, 12, 115–120.
S. Fujishige, M. X. Goemans, T. Harks, B. Peis, and R. Zenklusen (2015): Congestion games
viewed from M-convexity, Operations Research Letters, 43, 329–333.
S. Fujishige, K. Makino, T. Takabatake, and K. Kashiwabara (2004): Polybasic polyhedra:
structure of polyhedra with edge vectors of support size at most 2, Discrete Mathematics,
280, 13–27.
S. Fujishige and K. Murota (2000): Notes on L-/M-convex functions and the separation the-
orems, Mathematical Programming, 88, 129–146.
S. Fujishige and A. Tamura (2006): A general two-sided matching market with discrete con-
cave utility functions, Discrete Applied Mathematics, 154, 950–970.
S. Fujishige and A. Tamura (2007): A two-sided discrete-concave market with possibly
bounded side payments: An approach by discrete convex analysis, Mathematics of Op-
erations Research, 32, 136–155.
S. Fujishige and Z. Yang (2003): A note on Kelso and Crawford’s gross substitutes condition,
Mathematics of Operations Research, 28, 463–469.
D. Gale and L. S. Shapley (1962): College admissions and stability of marriage, American
Mathematical Monthly, 69, 9–15.
M. Goto, F. Kojima, R. Kurata, A. Tamura and M. Yokoo (2017): Designing matching mech-
anisms under general distributional constraints, American Economic Journal: Microeco-
nomics, 9, 226–262.
F. Gul and E. Stacchetti (1999): Walrasian equilibrium with gross substitutes, Journal of
Economic Theory, 87, 95–124.
F. Gul and E.Stacchetti (2000): TheEnglishauctionwith differentiatedcommodities,Journal
of Economic Theory, 92, 66–95.
B. Hajek (1985): Extremal splittings of point processes, Mathematics of Operations Re-
search, 10, 543–556.
J. W. Hatfield, S. D. Kominers,A. Nichifor, M. Ostrovsky,and A. Westkamp (2013): Stability
and competitive equilibrium in trading networks, Journal of Political Economy, 121, 966–
1005.
J. W. Hatfield, S. D. Kominers, A. Nichifor, M. Ostrovsky, and A. Westkamp (2019): Full
substitutability, Theoretical Economics, 14, 1535–1590.
J. W. Hatfield and P. R. Milgrom (2005): Matching with contracts, American Economic Re-
view, 95, 913–935.
H. Hirai (2015): L-extendable functions and a proximity scaling algorithm for minimum cost
multiflow problem, Discrete Optimization, 18, 1–37.
82H. Hirai (2016a): Discrete convexity and polynomial solvability in minimum 0-extension
problems, Mathematical Programming, Series A, 155, 1–55.
H. Hirai (2018): L-convexity on graph structures, Journal of the Operations Research Society
of Japan, 61, 71–109.
H. Hirai and K. Murota (2004): M-convex functions and tree metrics, Japan Journal of In-
dustrial and Applied Mathematics, 21, 391–403.
R. Holzman and N. Law-yone (2003): Network structure and strong equilibrium in route
selection games, Mathematical Social Sciences, 46, 193–205.
A. Huber and V. Kolmogorov (2012): Towards minimizing k-submodular functions, Pro-
ceedings of the Second International Symposium on Combinatorial Optimization (ISCO),
Lecture Notes in Computer Science 7422, Springer-Verlag, Berlin, 451–462.
T.Iimura(2003):Adiscretefixedpointtheoremand itsapplications,JournalofMathematical
Economics, 39, 725–742.
T. Iimura (2010): Discrete modeling of economic equilibrium problems, Pacific Journal of
Optimization, 6, 57–64.
T. Iimura, K. Murota, and A. Tamura (2005): Discrete fixed point theorem reconsidered.
Journal of Mathematical Economics, 41, 1030–1036.
T. Iimura, K. Murota, and A. Tamura (2012): Sperner’s lemma and zero point theorems on a
discrete simplex and a discrete simplotope, Discrete Applied Mathematics, 160, 588–592.
T. Iimura and T. Watanabe (2014): Existence of a pure strategy equilibrium in finite symmet-
ric games where payoff functions are integrally concave, Discrete Applied Mathematics,
166, 26–33.
T. Iimura and T. Watanabe (2016): Pure strategy equilibria in finite symmetric concave
games and an application to symmetric discrete Cournot games, in: P. von Mouche and
F. Quartieri, eds., Equilibrium Theory for Cournot Oligopolies and Related Games: Essays
in Honour of Koji Okuguchi, Springer-Verlag, Berlin, 85–96.
T. Iimura and Z. Yang (2009): A study on the demand and response correspondences in the
presence of indivisibilities, Journal of Fixed Point Theory and Applications, 6, 333–349.
Y. T. Ikebe, Y. Sekiguchi, A. Shioura and, A. Tamura (2015): Stability and competitive equi-
libria in multi-unit trading networks with discrete concave utility functions, Japan Journal
of Industrial and Applied Mathematics, 32, 373–410.
Y. Ikebe and A. Tamura (2015): Stability in supply chain networks: an approach by discrete
convex analysis, Journal of Operations Research Society of Japan, 58, 271–290.
T. Inoue (2008): Indivisible commodities and the nonemptiness of the weak core, Journal of
Mathematical Economics, 44, 96–111.
S. Iwata, S. Moriguchi, and K. Murota (2005): A capacity scaling algorithm for M-convex
submodular flow, Mathematical Programming, 103, 181–202.
S. Iwata and M. Shigeno (2003): Conjugate scaling algorithm for Fenchel-type duality in
discrete convex optimization, SIAM Journal on Optimization, 13, 204–211.
N.Katoh, A.Shioura, andT. Ibaraki(2013):Resource allocationproblems,in:P. M.Pardalos,
D.-Z. Du, and R. L. Graham, eds., Handbook of Combinatorial Optimization, 2nd ed., Vol.
5, Springer-Verlag, Berlin, 2897–2988.
83H. Kawasaki, A. Kira, and S. Kira (2013): An application of a discrete fixed point theorem to
a game in expansive form, Asia-Pacific Journal of Operational Research, 30, 1340013-1–
1340013-7.
A. S. Kelso, Jr., V.P. Crawford (1982): Job matching, coalition formation and gross substi-
tutes, Econometrica, 50, 1483–1504.
Y. Kobayashi, K. Murota, and K. Tanaka (2007): Operations on M-convex functions on jump
systems, SIAM Journal on Discrete Mathematics, 21, 107–129.
F. Kojima, A. Tamura, and M. Yokoo (2018): Designing matching mechanisms under con-
straints: An approach from discrete convex analysis, Journal of Economic Theory, 176,
803–833.
V. Kolmogorov(2011): Submodularityon a tree: Unifying L♮
-convexand bisubmodularfunc-
tions,in:F. Murlakand P.Sankowski,eds.,MathematicalFoundationsofComputerScience
2011, Lecture Notes in Computer Science 6907, Springer-Verlag, Berlin, 400–411.
V. Kolmogorovand A. Shioura (2009): New algorithms for convex cost tension problem with
application to computer vision, Discrete Optimization, 6, 378–393.
B. Korte and J. Vygen (2012): Combinatorial Optimization: Theory and Algorithms, 5th ed.,
Springer-Verlag, Heidelberg.
G. van der Laan, D. Talman, and Z. Yang (2006): Solving discrete zero point problems,
Mathematical Programming, 108, 127–134.
G. van der Laan, D. Talman, and Z. Yang (2011): Solving discrete systems of nonlinear
equations, European Journal of Operational Research, 214, 493–500.
B. Lehmann, D. Lehmann, and N. Nisan (2006): Combinatorial auctions with decreasing
marginal utilities, Games and Economic Behavior, 55, 270–296.
L. Lovász (1983): Submodular functions and convexity, in: A. Bachem, M. Grötschel and
B. Korte, eds., Mathematical Programming—The State of the Art, Springer-Verlag, Berlin,
235–257.
P.Milgrom(2004):PuttingAuctionTheorytoWork,CambridgeUniversityPress,Cambridge.
P. Milgrom and J. Roberts (1990): Rationalizability, learning, and equilibrium in games with
strategic complementarities, Econometrica, 58, 1255–1277.
P. Milgrom and C. Shannon (1994): Monotone comparative statics, Econometrica, 62, 157–
180.
P. Milgrom and B. Strulovici (2009): Substitute goods, auctions, and equilibrium, Journal of
Economic Theory, 144, 212–247.
D. Mishra and D.C. Parkes (2009): Multi-item Vickrey–Dutch auctions, Games and Eco-
nomic Behavior, 66, 326–347.
J.-P. Mo, P.-S. Tsai, S.-C. Lin (1988): Pure and minimal overdemanded sets: A note on De-
mange, Gale and Sotomayor, Unpublished Mimeo.
D. Monderer and L. S. Shapley (1996): Potential games, Games and Economic Behavior, 14,
124–143.
84S. Moriguchi, K. Murota, A. Tamura, and F. Tardella (2016): Scaling and proximity prop-
erties of integrally convex functions, The 27th International Symposium on Algorithms
and Computation (ISAAC 2016). Seok-Hee Hong (ed.): ISAAC2016, Leibniz International
Proceedings in Informatics (LIPIcs), 64, Article No. 56, pp.56:1–56:12.
S. Moriguchi, A. Shioura, and N. Tsuchimura (2011): M-convex function minimization by
continuous relaxation approach—Proximity theorem and algorithm, SIAM Journal on Op-
timization, 21, 633–668.
R. Müller (2006): Tractable cases of the winner determination problem, in: P. Cramton, Y.
Shoham, and R. Steinberg, eds., Combinatorial Auctions, MIT Press, Cambridge, MA,
Chapter 13, 319–336.
K. Murota (1996a): Valuated matroid intersection, I: optimality criteria, SIAM Journal on
Discrete Mathematics, 9, 545–561.
K. Murota (1996b): Valuated matroid intersection, II: algorithms, SIAM Journal on Discrete
Mathematics, 9, 562–576.
K. Murota (1996c): Convexity and Steinitz’s exchange property, Advances in Mathematics,
124, 272–311.
K. Murota (1998): Discrete convex analysis, Mathematical Programming, 83, 313–371.
K. Murota (1999): Submodular flow problem with a nonseparable cost function, Combina-
torica, 19, 87–109.
K. Murota (2000a): Matrices and Matroids for Systems Analysis, Springer-Verlag, Berlin.
K. Murota (2000b): Algorithms in discrete convex analysis, IEICE Transactions on Systems
and Information, E83-D, 344–352.
K.Murota(2003):DiscreteConvexAnalysis,SocietyforIndustrialandAppliedMathematics,
Philadelphia.
K. Murota (2004a): A proof of the M-convex intersection theorem, RIMS Kokyuroku, 1371,
13–19.
K. Murota (2004b): On infimal convolution of M-convex functions, RIMS Kokyuroku, 1371,
20–26.
K. Murota(2006): M-convexfunctions on jumpsystems:A general framework for minsquare
graph factor problem, SIAM Journal on Discrete Mathematics, 20, 213–226.
K. Murota (2007): Primer of Discrete Convex Analysis—Discrete versus Continuous Opti-
mization (in Japanese), Kyoritsu Publishing Co., Tokyo.
K. Murota (2009): Recent developments in discrete convex analysis, in: W. Cook, L. Lovász
and J. Vygen, eds., Research Trends in Combinatorial Optimization, Bonn 2008, Springer-
Verlag, Berlin, Chapter 11, 219–260.
K. Murota (2010): Submodular function minimization and maximization in discrete convex
analysis, RIMS Kokyuroku Bessatsu, B23, 193–211.
K. Murota (2018): Multiple exchange property for M♮
-concave functions and valuated ma-
troids, Mathematics of Operations Research, 43, 781–788.
K. Murota and A. Shioura (1999): M-convex function on generalized polymatroid, Mathe-
matics of Operations Research, 24, 95–105.
85K. Murota and A. Shioura (2000): Extension of M-convexity and L-convexity to polyhedral
convex functions, Advances in Applied Mathematics, 25, 352–427.
K. Murota and A. Shioura (2003): Quasi M-convex and L-convex functions: quasi-convexity
in discrete optimization, Discrete Applied Mathematics, 131, 467–494.
K. Murota and A. Shioura (2004a): Conjugacy relationship between M-convex and L-convex
functions in continuous variables, Mathematical Programming, 101, 415–433.
K. Murota and A. Shioura (2004b): Fundamental properties of M-convex and L-convex func-
tions in continuous variables, IEICE Transactions on Fundamentals of Electronics, Com-
munications and Computer Sciences, E87-A, 1042–1052.
K. Murota and A. Shioura (2008): Note on the continuity of M-convex and L-convex func-
tions in continuous variables, Journal of Operations Research Society of Japan, 51, 265–
273.
K. Murota and A. Shioura (2014): Exact bounds for steepest descent algorithms of L-convex
function minimization, Operations Research Letters, 42, 361–366.
K. Murotaand A. Shioura(2017): Noteon timeboundsfor two-phasealgorithmsofL-convex
function minimization, Japan Journal of Industrial and Applied Mathematics, 34, 429–440.
K. Murota, A. Shioura, and Z. Yang (2013a): Computing a Walrasian equilibrium in iter-
ative auctions with multiple differentiated items, The 24th International Symposium on
Algorithms and Computation (ISAAC 2013), L. Cai, S.-W. Cheng, and T.-W. Lam (eds.):
ISAAC2013, Lecture Note in Computer Science 8283, Springer-Verlag, Berlin Heidelberg,
468–478.
K. Murota, A. Shioura, and Z. Yang (2013b): Computing a Walrasian equilibrium in iterative
auctions with multiple differentiated items, Technical Report METR 2013-10, University
of Tokyo.
K. Murota, A. Shioura, and Z. Yang (2016): Time bounds for iterative auctions: A unified
approach by discrete convex analysis, Discrete Optimization, 19, 36–62.
K. Murota and A. Tamura (2003a): New characterizations of M-convex functions and their
applications to economic equilibrium models with indivisibilities, Discrete Applied Math-
ematics, 131, 495–512.
K. Murota and A. Tamura (2003b): Application of M-convex submodular flow problem to
mathematical economics, Japan Journal of Industrial and Applied Mathematics, 20, 257–
277.
K. Murota and Y. Yokoi (2015): On the lattice structure of stable allocations in two-sided
discrete-concave market, Mathematics of Operations Research, 40, 460–473.
M. Ostrovsky (2008): Stability in supply chain networks, American Economic Review, 98,
897–923.
M. Ostrovsky and R. Paes Leme (2015): Gross substitutes and endowed assignment valua-
tions, Theoretical Economics, 10, 853–865.
J. G. Oxley (2011): Matroid Theory, 2nd ed., Oxford University Press, Oxford.
R. Paes Leme (2017): Gross substitutability: an algorithmic survey, Games and Economic
Behavior, 106, 294–316.
86R. Paes Leme, and S C.-w. Wong (2020): Computing Walrasian equilibria: fast algorithms
and structural properties, Mathematical Programming, 179, 343–384.
C. R. Plott (1973): Path independence, rationality, and social choice, Econometrica, 41,
1075–1091.
H. Reijnierse, A. van Gallekom, and J. A. M. Potters (2002): Verifying gross substitutability,
Economic Theory, 20, 767–776.
A. Richard (2008): An extension of the Shin-Dong’s combinatorial fixed point theorem, Ad-
vances in Mathematics, 41, 620–627.
F. Robert (1986): Discrete Iterations: A Metric Study, Springer-Verlag, Berlin.
R. T. Rockafellar (1970): Convex Analysis, Princeton University Press, Princeton.
R. W. Rosenthal (1973): A class of games possessing pure-strategy Nash equilibria, Interna-
tional Journal of Game Theory, 2, 65–67.
A. E. Roth (1984): Stability and polarization of interests in job matching, Econometrica, 52,
47–58.
A. E. Roth and M. A. O. Sotomayor (1990): Two-Sided Matching—A Study in Game-
Theoretic Modeling and Analysis, Cambridge University Press, Cambridge.
T. Roughgarden (2007): Routing games, in: N. Nisan, T. Roughgarden, É. Tardos, V. V. Vazi-
rani, eds., AlgorithmicGame Theory, Cambridge UniversityPress, Cambridge, Chapter 18,
461–486.
J. K. Sankaran (1994): On a dynamic auction mechanism for a bilateral assignment problem,
Mathematical Social Sciences, 28, 143–150.
J. Sato and H. Kawasaki (2009): Discrete fixed point theorems and their application to Nash
equilibrium, Taiwanese Journal of Mathematics, 13, 431–440.
A. Schrijver (1986): Theory of Linear and Integer Programming, John Wiley and Sons, New
York.
A. Schrijver (2003): Combinatorial Optimization—Polyhedra and Efficiency, Springer-
Verlag, Heidelberg.
L. S. Shapley and M. Shubik (1972): The assignment game I: The core, InternationalJournal
of Game Theory, 1, 111–130.
M.-H. Shih and J.-L. Dong (2005): A combinatorial analogue of the Jacobian problem in
automata networks, Advances in Applied Mathematics, 34, 30–46.
A. Shioura (2004): Fast scaling algorithms for M-convex function minimization with appli-
cation to the resource allocation problem, Discrete Applied Mathematics, 134, 303–316.
A. Shioura(2012):Matroidrank functionsand discreteconcavity,JapanJournalof Industrial
and Applied Mathematics, 29, 535–546.
A.Shioura(2015):Polynomial-timeapproximationschemesformaximizinggrosssubstitutes
utility under budget constraints, Mathematics of Operations Research, 40, 171–191.
A. Shioura (2017): Algorithms for L-convex function minimization: Connection between
discrete convex analysis and other research areas, Journal of Operations Research Society
of Japan, 60, 216–243.
87A. Shioura and A. Tamura (2015): Gross substitutes condition and discrete concavity for
multi-unit valuations: A survey, Journal of Operations Research Society of Japan, 58, 61–
103.
A. Shioura and Z. Yang (2015): Equilibrium, auction, and generalized gross substitutes and
complements, Journal of Operations Research Society of Japan, 58, 410–435.
Y. Shiozawa (2015): International trade theory and exotic algebra, Evolutionary and Institu-
tional Economics Review, 12, 177–212.
D. Simchi-Levi, X. Chen and J. Bramel (2014): The Logic of Logistics: Theory, Algorithms,
and Applications for Logistics Management, 3rd ed. Springer-Verlag, New York.
M. Sotomayor (1999): Three remarks on the many-to-many stable matching problem, Math-
ematical Social Sciences, 38, 55–70.
M. Sotomayor (2002): A labor market with heterogeneous firms and workers, International
Journal of Game Theory, 31, 269–283.
N. Sun and Z. Yang (2006): Equilibria and indivisibilities: Gross substitutes and comple-
ments, Econometrica, 74, 1385–1402.
N. Sun and Z. Yang (2008): On a class of discrete convolution concave functions and their
applications, Yokohama Business Review, 29, 255–262.
N. Sun and Z. Yang (2009): A double-track adjustment process for discrete markets with
substitutes and complements, Econometrica, 77, 933–952.
N. Sun and Z. Yang (2014): An efficient and incentive compatible dynamic auction for mul-
tiple complements, Journal of Political Economy, 122, 422–466.
D. Talman, and Z. Yang (2009): A discrete multivariate mean value theorem with applica-
tions, European Journal of Operational Research, 192, 374–381.
A. Tamura(2004): Applicationsof discreteconvex analysis to mathematical economics, Pub-
lications of Research Institute for Mathematical Sciences, 40, 1015–1037.
A. Tamura (2005): Coordinatewise domain scaling algorithm for M-convex function mini-
mization, Mathematical Programming, 102, 339–354.
A. Tamura (2009): Discrete Convex Analysis and Game Theory (in Japanese), Asakura Pub-
lishing Co., Tokyo.
É. Tardos and T. Wexler(2007): Network formationgames and thepotentialfunction method,
in: N. Nisan, T. Roughgarden, É. Tardos, V. V. Vazirani, eds., Algorithmic Game Theory,
Cambridge University Press, Cambridge, Chapter 19, 487–516.
A. Tarski (1955): A lattice-theoretical fixpoint theorem and its applications, Pacific Journal
of Mathematics, 5, 285–309.
D. M. Topkis (1998): Supermodularity and Complementarity, Princeton University Press,
Princeton, NJ.
T. Ui (2006): A note on discrete convexity and local optimality, Japan Journal of Industrial
and Applied Mathematics, 23, 21–29.
T. Ui (2008): Discrete concavity for potential games, International Game Theory Review, 10,
137–143.
88W. Vickrey (1961): Counterspeculation, auctions, and competitive sealed tenders, Journal of
Finance, 16, 8–37.
X.Vives(1990):Nashequilibriumwithstrategiccomplementarities,JournalofMathematical
Economics, 19, 305–321.
M. Voorneveld (2000): Best-response potential games, Economics Letters, 66, 289–295.
J. A. Weymark (2016): A geometric approach to dominant strategy implementation, Presen-
tation at Hausdorff Center Summer School “Economics and Tropical Geometry”.
Z. Yang (2008):On thesolutionsofdiscretenonlinearcomplementarityand related problems.
Mathematics of Operations Research, 33, 976–990.
Z. Yang (2009): Discrete fixed point analysis and its applications, Journal of Fixed Point
Theory and Applications, 6, 351–371.
Y. Yokoi (2017): A generalized polymatroid approach to stable matchings with lower quotas,
Mathematics of Operations Research, 42, 238–255.
K. Yokote (2016): Core and competitive equilibria: An approach from discrete convex anal-
ysis, Journal of Mathematical Economics, 66, 1–13.
89Contents
## 1 Introduction 1
## 2 Notation 3
3 M♮
-concave Set Function 5
## 3.1 Exchange property . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 3.2 Maximization and single improvement property . . . . . . . . . . . . . . . . 8
## 3.3 Maximizers and gross substitutability . . . . . . . . . . . . . . . . . . . . . 9
## 3.4 Choice function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
3.5 Twisted M♮
-concavity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
## 3.6 Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
## 3.7 Concluding remarks of section 3 . . . . . . . . . . . . . . . . . . . . . . . . 16
4 M♮
-concave Function on Zn
17
## 4.1 Exchange property . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
## 4.2 Maximization and single improvement property . . . . . . . . . . . . . . . . 20
## 4.3 Maximizers and gross substitutability . . . . . . . . . . . . . . . . . . . . . 21
## 4.4 Choice function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 22
4.5 Twisted M♮
-concavity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
## 4.6 Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
## 4.7 Concluding remarks of section 4 . . . . . . . . . . . . . . . . . . . . . . . . 28
5 M♮
-concave Function on Rn
29
## 5.1 Exchange property . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
## 5.2 Maximizers and gross substitutability . . . . . . . . . . . . . . . . . . . . . 30
## 5.3 Choice function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
## 5.4 Examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 31
## 5.5 Concluding remarks of section 5 . . . . . . . . . . . . . . . . . . . . . . . . 31
6 Operations for M♮
-concave Functions 32
## 6.1 Basic operations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
## 6.2 Transformation by networks . . . . . . . . . . . . . . . . . . . . . . . . . . 34
## 6.3 Concluding remarks of section 6 . . . . . . . . . . . . . . . . . . . . . . . . 35
7 Conjugacy and L♮
-convexity 35
7.1 L♮
-convex function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 35
## 7.2 Conjugacy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
7.3 Minimization of L♮
-convex functions . . . . . . . . . . . . . . . . . . . . . . 41
## 7.4 Concluding remarks of section 7 . . . . . . . . . . . . . . . . . . . . . . . . 46
## 8 Iterative Auctions 46
## 8.1 Auction models and Walrasian equilibrium . . . . . . . . . . . . . . . . . . . 46
## 8.2 Lyapunov function approach to iterative auctions . . . . . . . . . . . . . . . 47
## 8.3 Unit-demand auctions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
## 8.4 Concluding remarks of section 8 . . . . . . . . . . . . . . . . . . . . . . . . 53
909 Intersection and Separation Theorems 54
## 9.1 Separation theorem . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
## 9.2 Fenchel duality . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
## 9.3 Concluding remarks of section 9 . . . . . . . . . . . . . . . . . . . . . . . . 58
## 10 Stable Marriage and Assignment Game 58
## 10.1 Fujishige–Tamura model . . . . . . . . . . . . . . . . . . . . . . . . . . . . 59
## 10.2 Market equilibrium . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 60
## 10.3 Technical ingredients . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
## 10.4 Concluding remarks of section 10 . . . . . . . . . . . . . . . . . . . . . . . 62
## 11 Valuated Assignment Problem 62
## 11.1 Problem description . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 62
## 11.2 Optimality criterion by potentials . . . . . . . . . . . . . . . . . . . . . . . . 63
## 11.3 Optimality criterion by negative-cycles . . . . . . . . . . . . . . . . . . . . . 64
## 11.4 Concluding remarks of section 11 . . . . . . . . . . . . . . . . . . . . . . . 66
## 12 Submodular Flow Problem 66
## 12.1 Submodular flow problem . . . . . . . . . . . . . . . . . . . . . . . . . . . 66
## 12.2 Optimality criterion by potentials . . . . . . . . . . . . . . . . . . . . . . . . 69
## 12.3 Optimality criterion by negative cycles . . . . . . . . . . . . . . . . . . . . . 70
## 12.4 Concluding remarks of section 12 . . . . . . . . . . . . . . . . . . . . . . . 71
## 13 Discrete Fixed Point Theorem 71
## 13.1 Discrete fixed point theorem . . . . . . . . . . . . . . . . . . . . . . . . . . 71
## 13.2 Integrally convex set and direction-preserving mapping . . . . . . . . . . . . 72
## 13.3 Illustrative examples . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 73
## 13.4 Proof outline . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 74
## 13.5 Concluding remarks of section 13 . . . . . . . . . . . . . . . . . . . . . . . 75
## 14 Other Topics 75
## 14.1 Matching market and economy with indivisible goods . . . . . . . . . . . . . 75
## 14.2 Trading networks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 76
## 14.3 Congestion games . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 77
## 14.4 Integrally concave games . . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
## 14.5 Unimodularity and tropical geometry . . . . . . . . . . . . . . . . . . . . . . 78
References 79
91List of Figures
## 1 Independent assignment valuation . . . . . . . . . . . . . . . . . . . . . . . 16
2 Nearer pair in the definition of M♮
-concave functions . . . . . . . . . . . . . 17
## 3 Transformation by a network and a bipartite graph . . . . . . . . . . . . . . . 34
## 4 Valuated assignment problem . . . . . . . . . . . . . . . . . . . . . . . . . . 63
5 M-convex submodular flow problem for M♮
-concave intersection problem . . 68
## 6 Integral neighbor N(y) of y (◦: point of N(y)) . . . . . . . . . . . . . . . . . 72
## 7 Concept of integrally convex sets . . . . . . . . . . . . . . . . . . . . . . . . 72
8 Projection π(x) with σ(x) = sign(π(x) − x) = (+1,−1) . . . . . . . . . . . . . 73
## 9 Necessity of the assumption of integral convexity . . . . . . . . . . . . . . . 74
92