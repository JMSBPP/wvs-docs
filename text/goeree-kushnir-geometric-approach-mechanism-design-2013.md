---
sha256: 32447fe50713389498889210d038594dc354fb63ef381643d147f5ec0cd3f66f
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 73941
---
A Geometric Approach to
Mechanism Design
Jacob K. Goeree and Alexey Kushnir∗
November 21, 2013
Abstract
We develop a novel geometric approach to mechanism design using an important re-
sult in convex analysis: the duality between a closed convex set and its support function.
By deriving the support function for the set of feasible interim values we extend the well
known Maskin–Riley–Matthews conditions for reduced-form auctions to social choice en-
vironments. We next refine the support function to include incentive constraints using a
geometric characterization of incentive compatibility. Borrowing results from majorization
theory that date back to the work of Hardy, Littlewood, and Pólya (1929) we elucidate
the “ironing” procedure introduced by Myerson (1981) and Mussa and Rosen (1978). The
inclusion of Bayesian and dominant strategy incentive constraints result in the same sup-
port function, which establishes equivalence between these implementation concepts. Using
Hotelling’s lemma we next derive the optimal mechanism for any social choice problem and
any linear objective, including revenue and surplus maximization. We extend the approach
to include general concave objectives by providing a fixed-point condition characterizing
the optimal mechanism. We generalize reduced-form implementation to environments with
multi-dimensional, correlated types, non-linear utilities, and interdependent values. When
value interdependencies are linear we are able to include incentive constraints into the sup-
port function and provide a condition when the second-best allocation is ex post incentive
compatible.
Keywords: mechanism design, convex set, support function, duality, majorization, ironing,
Hotelling’s lemma, reduced-from implementation, BIC-DIC equivalence, concave objectives, in-
terdependent values, second-best mechanisms
∗
ESEI Center for Market Design, University of Zürich, Blümlisalpstrasse 10, CH-8006, Zürich, Switzerland.
We gratefully acknowledge financial support from the European Research Council (ERC Advanced Investigator
Grant, ESEI-249433). We thank Yuanchuan Lien, Konrad Mierendorff, Roberto Serrano, Rakesh Vohra, Philip
Reny, seminar participants at Cambridge University, Ecole Polytechnique, Humboldt University, Northwestern
University, Paris School of Economics, St. Andrews University, University College London, University of Michigan,
University of Montreal, University of Pennsylvania, University of Toronto, Western University, SHUFE, HKUST,
UTS, as well as participants at the North American Econometric Society Meeting 2012, the 4th World congress
of the Game Theory Society 2012, the European Econometric Society Meeting 2012, the Asian Meetings of the
Econometric Society 2012, and the UECE Lisbon Meeting 2013 for useful suggestions.1. Introduction
Mechanism design concerns the creation of optimal social systems by maximizing a well-defined
social welfare function taking into account resource constraints and participants’ incentives and
hidden information. It provides a framework to address questions like “what auction format
assigns goods most efficiently or yields the highest seller revenue” and “when should a public
project such as building a highway be undertaken?” The difficulty in answering these questions
stems from the fact that the designer typically does not possess detailed information about
bidders’ valuations for the goods or about voters’ preferences for the public project. A well-
designed mechanism should therefore elicit participants’ private information in a truthful, or
incentive compatible, manner and implement the corresponding social optimum.
The constraints imposed by incentive compatibility are generally treated separately from
other more basic constraints, such as resource constraints. As a result, mechanism design theory
appears to have developed differently from classical approaches to consumer and producer choice
theory despite some obvious parallels. For example, in producer choice theory, the firm also
maximizes a well-defined objective, its profit, over a feasible production set that reflects its
resource constraints. A well-known result is that a firm’s optimal production plan follows by
evaluating the gradient of the profit function at output and factor prices – Hotelling’s lemma.
One contribution of this paper is to draw a parallel between classical choice theory and mechanism
design by showing how standard micro-economics tools such as Hotelling’s lemma can be used
to derive optimal mechanisms.1
Our approach is geometric in nature and utilizes convexity of the set of feasible outcomes,
which consists of a collection of probability simplices, one for each type profile. To conveniently
parameterize this high-dimensional set we employ techniques from convex analysis, a subfield
of mathematics that studies properties of convex sets and functions. A key result in convex
analysis is the duality between a closed convex set and its support function, which is convex and
homogeneous of degree one (e.g. a firm’s profit function). We exploit this duality to derive, in a
surprisingly simple manner, the support function of the feasible set for a general class of social
choice problems.2
Despite this simplicity, our geometric approach provides a powerful new perspective on re-
duced form implementation. Maskin and Riley (1984) first noted that with risk-averse bidders
1
See also Makowski and Ostroy (2013) who draw a parallel between revealed preference in consumer choice
theory and preference revelation in mechanism design.
2
Some papers in decision theory also exploit convenient properties of support functions, e.g. Dekel et al.
(2001), Sarver (2008), and Ergin and Sarver (2010).
1the optimal mechanism typically cannot be found by point-wise maximization but instead re-
quires maximization over the set of interim allocation rules. This raises the issue of reduced form
implementation: “which interim allocation rules are implementable, i.e. for which interim alloca-
tion rule does there exist an ex post allocation rule that generates it?” For the symmetric case,
Matthews (1984) provided a set of inequalities and conjectured they were both necessary and
sufficient, a conjecture that was subsequently proven by Border (1991). Our geometric approach
clarifies the origin of the so called “Maskin-Riley-Matthews” conditions. They are standard du-
ality inequalities for the set of interim feasible allocations. Importantly, our approach generalizes
these conditions to arbitrary social choice problems.3
We next refine the support function to include incentive constraints using a geometric charac-
terization of incentive compatibility. Borrowing results from majorization theory due to Hardy,
Littlewood, and Pólya (1929) we provide a reinterpretation of the “ironing” procedure introduced
by Mussa and Rosen (1978) and Myerson (1981). We show that the support function for the set
of feasible and incentive compatible outcomes is simply the support function for the feasible set,
evaluated at ironed weights.4
A major question in mechanism design is whether dominant strategy incentive compatibility
is more stringent than Bayesian incentive compatibility. For example, does requiring dominant
strategies limit a seller’s revenue? A recent contribution by Manelli and Vincent (2010) shows
that for the special case of single-unit, independent private-value auctions the answer is negative:
Bayesian incentive compatibility and dominant strategy incentive compatibility are equivalent in
this setting. Gershkov et al. (2013) extend this equivalence result to social choice environments
by generalizing a theorem due to Gutmann et al. (1991).5
Here we provide a simpler proof by
showing that the support functions of the sets of interim values under Bayesian and dominant-
strategy incentive compatibility are identical.
Using the support function for the set of feasible and incentive compatible outcomes we derive
the optimal mechanism by applying Hotelling’s lemma. In particular, we determine the optimal
allocation for any social choice problem and any linear objective and show that the optimal
allocation can be implemented in dominant strategies. As an illustration, we determine the
optimal auction for shares when bidders have decreasing marginal valuations.
3
Economics papers that rely on reduced-form implementation include Matthews (1983), Armstrong (2000),
Brusco and Lopomo (2002), Pai (2009), Pai and Vohra (2010, 2011, 2012), Manelli and Vincent (2010), Asker and
Cantillon (2010), Belloni, Lopomo, and Wang (2010), Hörner and Samuelson (2011), Mierendorff (2011), Miralles
(2012), Ben-Porath et al. (2012), and Che, Condorelli, Kim (2013). See Alaei et al. (2012), Cai et al. (2012a,
2012b), Hartline (2012) for papers in computer science literature.
4
Hence, the geometric approach is an alternative to Lagrangian methods that are typically used to characterize
feasible and incentive compatible outcomes (see Ledyard and Palfrey, 1999, 2007).
5
See Kushnir (2013) for an extension of this result to the environments with correlated types.
2We finally discuss some extensions and applications of the geometric approach. First, for
general concave objectives that depend on both agent values and transfers we provide a fixed-point
condition that characterizes the optimal mechanism. Second, we further extend the reduced-
form implementation to richer environments with multi-dimensional, correlated types, non-linear
utilities, and interdependent values. Third, in environments with linear interdependencies we
illustrate that the equivalence between Bayesian and ex post incentive compatibility breaks down.
Furthermore, when the surplus maximizing allocation, i.e. first-best, is not achievable we provide
a condition when the second-best allocation rule is ex post incentive compatible.
1.1. Related Literature
Compared with early papers on reduced form auctions (Maskin and Riley, 1984; Matthews,
1984; Border, 1991, 2007; Mierendorff, 2011), the geometric approach does not demand any
sophisticated techniques. Using the geometric approach, one could teach the reduced form im-
plementation to any graduate and undergraduate student with a basic knowledge of calculus and
linear algebra. The construction of the support function that characterizes the set of interim
expected allocation probabilities has only three easy steps. First, we derive the support function
for the k-dimensional simplex, which is almost trivial. Second, we note that the support function
for the cartesian product of sets equals the sum of support functions. Third, we use the stan-
dard property of how the support functions changes under linear transformation. At the same
time, the geometric approach provides the most general characterization of reduced form imple-
mentation for asymmetric auctions with correlated types (as in Border, 2007). In addition, the
geometric approach pushes the boundaries of the reduced form implementation to social choice
environments (see Section 3) and to environments with interdependencies (see Section 4).6
We
are not aware of any paper that has done this previously.
Two recent approaches to reduced form auctions by Hart and Reny (2011) and Vohra (2011)
reinterpret the Maskin-Riley-Matthews conditions, but do not extend them beyond the early
papers. Hart and Reny (2011) provide a condition equivalent to Maskin-Riley-Matthews in-
equalities for symmetric auctions with independently distributed types. Their alternative con-
dition is formulated using the notion of the second-order stochastic dominance. Vohra (2011)
notices that Maskin-Riley-Matthews inequalities define a polymatroid, and he then uses the stan-
dard results from the polymatroid optimization literature (e.g. Nemhauser and Wolsey, 1988)
6
In environments with interdependencies, interim expected allocation probabilities alone do not determine the
overall social surplus. Hence, one might be interested in characterizing the set of feasible interim expected values
(a part of agent’s interim expected utilities without transfers). In Subsection 4.2, we derive the support function
for the set of feasible interim expected values.
3to derive a revenue-maximizing auction. Only Che, Mierendorff, and Kim (2013) extend the
standard reduced form auctions beyond the results of the early papers. Using the techniques
of the network-flow literature they characterize the reduced form implementation for multi-unit
auctions with low and upper bounds on bidders’ allocations. In this paper, we do not study the
upper and low bound constraints on bidders’ allocations.
In addition, the geometric approach allows incorporating incentive compatibility constraints.
Among above papers only Vohra (2011) analyzes incentive compatibility using both the network
approach and the Lagrangian maximization method. Compared to Vohra (2011), however, the
power of the geometric approach allows us to derive the optimal mechanism for any social choice
problem and for any linear objective function. We are not aware of any paper that provides such
general characterization.
1.2. Organization
In Section 2 we illustrate our approach via an example of a single-unit auction with two ex ante
symmetric bidders and two possible types. For this example, we demonstrate how to derive the
support function for the feasible set, how to refine it to include incentive constraints, and how the
optimal mechanism follows from Hoteling’s lemma. Section 3 develops the approach for social
choice problems, discusses its implications for reduced form implementation, establishes equiv-
alence of Bayesian and dominant strategy implementation, and provides the optimal (dominant
strategy) mechanism for any linear objective. Section 4 presents the extensions and applications.
Section 5 discusses further developments and concludes. The Appendix contains most of the
proofs.
2. A Simple Auction Example
A central result in convex analysis concerns the duality between a closed convex set C ⊂ IRn
and
its support function SC
: IRn
→ IR, defined as
SC
(W) = sup{V · W|V ∈ C},
with V · W =
Pn
i=1 ViWi being the usual inner product. The support function is homogeneous
of degree one, convex, and lower semi-continuous. Conversely, any function with these properties
is the support function of a closed convex set, defined as the intersection of half spaces
C =

V ∈ IRn
|V · W ≤ SC
(W) ∀W ∈ IRn
.
4V1
V2
W
W
W
V1
V2
Figure 1. Illustration of duality. The left panel shows how the support function is determined by
maximizing V ·W over the simplex. The right panel shows how the simplex can be recovered from the
inequalities V · W ≤ S(W) = max(0,W1,W2) for W ∈ IR2
.
Consider, for instance, the two-dimensional simplex shown in the left panel of Figure 1. In
this panel, the blue dots show the outcomes of the maximization problem. It is readily verified
that the support function for the simplex is
S(W) = max(0,W1,W2).
In turn, the simplex can be recovered from the duality inequalities V·W ≤ S(W), which define
half spaces of possible V for each W ∈ IR2
. In the right panel of Figure 1 these half spaces are
bounded by the green lines and their intersection reproduces the simplex.
To illustrate our approach consider a single-unit auction with two ex ante symmetric bidders
and two equally likely types, x < x. Let Q (Q) denote a bidder’s expected probability of winning
when her type is low (high) and define Q = (Q,Q). The set of all feasible symmetric allocations
is indicated by the shaded area in the left panel of Figure 2.7
The support function for this set
is given by:
Sinterim(W) =
1
4
max(0,W) +
1
2
max(0,W,W) +
1
4
max(0,W)
which is simply the probability-weighted sum of the support functions for the two-dimensional
simplices, S(W) = max(0,W1,W2), one for each of the four possible profiles.8
7
Symmetry implies that a bidder wins with probability 1
2 when facing a rival of the same type, which occurs
with probability 1
2. Hence, the maximum expected probability of winning is 1
2 · 1
2 + 1
2 · 1 = 3
4.
8
The four possible profiles for (W1,W2) are (W,W), (W,W), (W,W), and (W,W), each of which occur with
probability 1
4.
5Q
Q
1
4
1
2
3
4
3
4
1
2
1
4
∩
Q
Q
=
Q
Q
3
4
1
2
1
4
1
4
1
2
Figure 2. The figure illustrates for a single-unit auction with two-bidders and two equally-likely types
that the set of feasible and Bayesian incentive compatible allocations (right panel) can be described as
intersection of the set of feasible allocations (left panel) with the half-space that is “above the 45-degree
line” (middle panel).
For our example, Bayesian incentive compatibility is equivalent to the monotonicity of the
allocation rule, i.e. Q ≥ Q (see Section 3). To derive the support function for the set of
feasible and Bayesian incentive compatible allocations it is convenient to describe this set as the
intersection of the feasible set and the half-space “above the 45-degree line,” see Figure 2. The
half-space can be written as (−1,1) · Q ≥ 0 and its support function equals
SH
(W) =
(
0 if W = −Λ(−1,1)
∞ if W 6= −Λ(−1,1)
for any Λ ≥ 0. The support function for the intersection follows from the convolution:
SBIC
interim(W) = inf{Sinterim(W1) + SH
(W2)|W1 + W2 = W}
= inf
Λ≥0
Sinterim(W + Λ(−1,1))
It is readily verified that in optimum Λ = 0 when W ≤ W and Λ = 1
2
(W − W)) otherwise.
To summarize, the support function for the set of feasible and Bayesian incentive-compatible
allocations is simply
SBIC
interim(W) = Sinterim(W+
)
where W+
denote the “ironed” weights
W+
=
(
(W,W) if W ≤ W
1
2
(W + W,W + W) if W > W
6Q
Q
3
4
1
2
1
4
W
1
4
1
2
W
Figure 3. The figure illustrates the maximization of the linear objective over the set of feasible and
Bayesian incentive compatible allocations. The lines are level-surfaces for the linear objective W · Q
and the dots are optimal allocations when 0 < W < W (blue) and 0 < W < W (red).
We consider now the maximization of the linear objective W·Q over the feasible and Bayesian
incentive compatible set when the weights satisfy 0 < W < W, see the solid blue line on
Figure 3. The support function reduces to Sinterim(W+
) = 1
4
W + 3
4
W and the optimal interim
allocations follow from Hotelling’s lemma: Q = ∇Sinterim(W+
) = (1
4
, 3
4
) (blue dot). These
expected probabilities of winning result when using an efficient symmetric allocation rule. Next
suppose the weights satisfy W > W > 0, see the dashed red line on Figure 3. Now the support
function simplifies to Sinterim(W+
) = 1
2
(W +W), which yields Q = ∇Sinterim(W+
) = (1
2
, 1
2
) (red
dot). This allocation results from using a random mechanism. We next generalize the above
steps to social choice problems with an arbitrary number of agents and alternatives.
3. Social Choice Implementation
We consider an environment with a finite set I = {1,2,...,I} of agents and a finite set
K = {1,2,...,K} of social alternatives. When alternative k is selected, agent i’s payoff equals
ak
i xi where ak
i is some constant and agent i’s type, xi, is distributed according to probability
distribution fi(xi) with discrete support Xi = {x1
i ,...,xNi
i }, where the xj
i are non-negative with
xj−1
i < xj
i for j = 2,...,Ni.9
Let x = (x1,...,xI) ∈ X =
Q
i∈I Xi denote the profile of agents’
types. Without loss of generality we restrict attention to direct mechanisms characterized by
9
This formulation includes many important applications, e.g. single or multi-unit auctions, public goods
provision, bilateral trade, etc. For example, single-unit auctions are captured by setting ak
i = δk
i for i = 1,...,I
and k = 1,...,I + 1, where alternative i = 1,...,I corresponds to the case where bidder i wins the object and
alternative I + 1 corresponds to the case where the seller keeps the object. As another example, public goods
provision can be summarized by two alternatives, i.e. k = 1 when the public good is implemented and k = 2
when it is not, and ak
i = δk
1 for i = 1,...,I.
7K + I functions, {qk
(x)}k∈K and {ti(x)}i∈I, where ti(x) ∈ IR is agent i’s payment and qk
(x)
is the probability alternative k is selected. We define the ex post value vi(x) =
P
k∈K ak
i qk
(x)
so that agent i’s utility from truthful reporting, assuming others report truthfully as well, is
ui(x) = xivi(x) − ti(x).
3.1. Feasibility
The probabilities with which the alternatives occur satisfy the usual feasibility conditions qk
(x) ≥
0 for k ∈ K and
P
k∈K qk
(x) = 1. In other words, for each type profile x ∈ X, the qk
(x) define a
simplex in IRK
. The support function for the cartesian product of sets equals the sum of support
functions (see Rockafellar, 1970), so we can simply write the support function S : IRK|X|
→ IR
as a sum, over all type profiles, of simplex support functions
S(w) =
X
x∈X
max
k ∈K
wk
(x)
Let C ∈ IRn
be a closed convex set and let A : IRn
→ IRm
be a linear transformation. Recall
that Aq · w = q · AT
w where AT
denotes the transpose of A. The support function for the
transformed set AC is thus given by SAC
(w) = SC
(AT
w) for w ∈ IRm
. The support function
for the set of ex post values is therefore
Sex post(w) =
X
x∈X
max
k ∈K
X
i∈I
ak
i wi(x)
where w ∈ IRI|X|
. Throughout we distinguish interim variables using capital letters: Vi(xi)
denotes the interim value, Ti(xi) denotes the interim payment, and Ui(xi) = Vi(xi)xi − Ti(xi)
denotes the interim utility of agent i ∈ I. Since interim values are linear transformations of ex
post values, Vi(xi) =
P
x−i
f−i(x−i)vi(x), we can once more invoke the above rule for the support
function of the transformed set. To arrive at expressions that are symmetric in the probabilities
we define the interim support function using the probability-weighted inner product
V · W =
X
i∈I
X
xi ∈Xi
fi(xi)Vi(xi)Wi(xi).
where W ∈ IR
P
i |Xi|
. In other words, we multiply the interim weight Wi(xi) associated with
Vi(xi) by fi(xi) so that all terms are weighted by f(x) =
Q
i fi(xi). Using this definition of the
support function we obtain the following result.
8Proposition 1. The support function for the set of feasible interim expected values is
Sinterim(W) = Ex max
k ∈K
X
i∈I
ak
i Wi(xi)

(1)
and the feasible interim values V satisfy V · W ≤ Sinterim(W) for all W ∈ IR
P
i |Xi|
.
It is insightful to work out the duality inequalities for single-unit private-value auctions, which
fit the social choice framework as follows: alternative k = 1,...,I corresponds to the event when
bidder i wins, i.e. ai
i = 1 and ak
i = 0 for k 6= i, and alternative I+1 corresponds to the event when
the seller keeps the object. In this case, the reduced form value Vi(xi) is equal to a bidder i’s
interim expected chance of winning Qi(xi) = Ex−i
(qi
(x)) and the support function in Proposition
1 simplifies to
Sinterim(W) = Ex max
i∈I
(0,Wi(xi))

An exhaustive set of inequalities follow by choosing, for each i ∈ I, a subset Si ⊆ Xi and setting
Wi(xi) = 1 for xi ∈ Si and 0 otherwise and then varying the set Si.
Proposition 2. For single unit auctions, the duality inequalities simplify to
X
i∈I
X
xi ∈Si
fi(xi)Qi(xi) ≤ 1 −
Y
i∈I
X
xi 6∈Si
fi(xi) (2)
for any subset Si ⊆ Xi, i = 1,...,I.
The inequalities in Proposition 2 are known as the Maskin-Riley-Matthews conditions for reduced
form implementation, an approach to optimal auctions initiated by Maskin and Riley (1984).
They were conjectured to be necessary and sufficient by Matthews (1984) based on the following
intuition: the probability that a certain bidder with a certain type wins (left side) can be no
higher than the probability that such a bidder exists (right side). The conjecture was subsequently
proven and generalized by Border (1991, 2007). Besides clarifying their origin as basic duality
inequalities, Proposition 1 extends these conditions to social choice problems. In Section 4
we further extend the reduced form implementation to environments with multi-dimensional,
correlated types, non-linear utilities, and interdependent values.
3.2. Incentive Compatibility
A mechanism is dominant strategy incentive compatible (DIC) if truthful reporting is a dominant
strategy equilibrium.10
Necessary and sufficient conditions for a mechanism (q,t) to be DIC is
10
More precisely, qi(xi,x−i)xi −ti(xi,x−i) ≥ qi(x0
i,x−i)xi −ti(x0
i,x−i) for all i ∈ I, x0
i,xi ∈ Xi and x−i ∈ X−i.
9that the ex post values and payments satisfy
(vi(xj
i,x−i) − vi(xj−1
i ,x−i))xj−1
i ≤ ti(xj
i,x−i) − ti(xj−1
i ,x−i) ≤ (vi(xj
i,x−i) − vi(xj−1
i ,x−i))xj
i (3)
for j = 2,...,Ni. Moreover, ex post individual rationality (EXIR) requires that ui(x) ≥ 0 for
x ∈ X, i ∈ I. Since agent utilities satisfy the single crossing condition the EXIR constraints are
binding only for the lowest type: ti(x1
i ,x−i) ≤ vi(x1
i ,x−i)x1
i . This constraint can be included as
the upward incentive constraint (3) for j = 1 if we set vi(x0
i ,x−i) = ti(x0
i ,x−i) = 0.
Similarly, a mechanism (q,t) is Bayesian incentive compatible (BIC) if truthful reporting is a
Bayes-Nash equilibrium. Bayesian incentive compatibility holds if and only if the interim values
and payments satisfy
(Vi(xj
i) − Vi(xj−1
i ))xj−1
i ≤ Ti(xj
i) − Ti(xj−1
i ) ≤ (Vi(xj
i) − Vi(xj−1
i ))xj
i (4)
for j = 2,...,Ni. Furthermore, interim individual rationality (INIR) requires that Ui(xi) ≥ 0 for
all xi ∈ Xi, i ∈ I, which again holds if Ti(x1
i ) ≤ Vi(x1
i )x1
i . This constraint can also be included
as the upward incentive constraint for j = 1 if we set Vi(x0
i ) = Ti(x0
i ) = 0.
To evaluate the BIC and DIC constraints from an agent’s viewpoint we determine how they
affect the interim support function. In Section 2 we illustrate how to obtain the support function
of the intersection of interim feasible set and the incentive constraint represented by a half space.
If incentive constraints include several half spaces Bm · V ≥ 0 for m = 1,...,M the support
functions of intersection can be calculated as (see Rockafellar, 1970)
inf
Λm ≥0
Sinterim(W +
M X
m=1
ΛmBm) (5)
The DIC constraints in (3) imply that interim values are non-decreasing. Furthermore, each
of the vi(xj
i,x−i) appears in two constraints: vi(xj+1
i ,x−i) − vi(xj
i,x−i) ≥ 0 and vi(xj
i,x−i) −
vi(xj−1
i ,x−i) ≥ 0. Let λi(xj
i,x−i) be associated with the first constraint and λi(xj−1
i ,x−i) with
the second. Likewise, the BIC constraints in (4) imply that interim values are non-decreasing
and each Vi(xj
i) appears in two constraints, for which we similarly denote Λi(xj
i) and Λi(xj−1
i ).
Define for j = 1,...,Ni the differences
∆λi(xj
i,x−i) ≡ λi(xj
i,x−i) − λi(xj−1
i ,x−i)
∆Λi(xj
i) ≡ Λi(xj
i) − Λi(xj−1
i )
10with λi(x0
i ,x−i) = λi(xNi
i ,x−i) = 0 and Λi(x0
i ) = Λi(xNi
i ) = 0. Using the notion of the support
function based on the probability-weighted inner product and formula (5) we obtain the following
result.
Proposition 3. The support function for the set of feasible interim expected values that satisfy
dominant strategy incentive compatibility is given by
SDIC
(W) = inf
0≤λi(x)
Ex

max
k ∈K
X
i∈I
ak
i (Wi(xi) −
∆λi(x)
fi(xi)
)

(6)
Likewise, the support function for the set of feasible interim expected values that satisfy Bayesian
incentive compatibility is
SBIC
(W) = inf
0≤Λi(xi)
Ex

max
k ∈K
X
i∈I
ak
i (Wi(xi) −
∆Λi(xi)
fi(xi)
)

(7)
The minimization problem that defines the DIC support function involves more parameters,
which could result in a lower support function (reflecting a smaller set). This is not the case,
however, if the solutions to the minimization problems satisfy λi(xi,x−i) = Λi(xi) for all x−i.
Example 1. Consider again the single-unit auction example of Section 2 with two agents and
two equally-likely types. Unlike in Section 2, however, we do not impose symmetry. We first
include only the DIC constraints for agent 1 to the interim support functions.11
S(W) = inf
0≤λ1,λ1
1
4
max(0,W1 − λ1,W2) + 1
4
max(0,W1 + λ1,W2)
+ 1
4
max(0,W1 − λ1,W2) + 1
4
max(0,W1 + λ1,W2)
where Wi and Wi are weights associated with x and x for agent i respectively, and λ1 and λ1
are associated with constraints v1(x,x) − v1(x,x) ≥ 0 and v1(x,x) − v1(x,x) ≥ 0 respectively.
Surprisingly, there is always exists a solution to the minimization problem that does not depend
on agent 2’s weights λ1 = λ1 = max(0, 1
2
(W1 − W1)). Similarly, if we introduce now the DIC
constraints for agent 2 there is an optimal solution that does not depend on agent 1’s weights
λ2 = λ2 = max(0, 1
2
(W2 − W2)). We can consider the minimization over parameters λ1 and λ2
sequentially only because of their geometric interpretation: each minimization corresponds to the
intersection of the feasible set with the corresponding incentive constraint. For our example then
the DIC minimization problem for any weights gives the same outcome as the BIC minimization
11
Without loss of generality we scale the λ parameters by 1
2.
11problem. Therefore, the BIC and DIC support functions coincide. 
To show the equivalence more generally we rely on results from majorization theory. Let p1,...,pn
denote arbitrary non-negative numbers and consider two sequences σ and ς with elements σj,ςj
for j = 1,...,n. We will write σ p ς if
l X
j =1
pjσj ≥
l X
j =1
pjςj for l = 1,...,n − 1
n X
j =1
pjσj =
n X
j =1
pjςj
The following result dates back to Hardy, Littlewood, and Polya (1929), see also Fuchs (1947).
Lemma 1. If σ, ς are non-decreasing sequences and σ p ς then we say that σ p-majorizes ς
and we have
n X
j =1
pjg(σj) ≤
n X
j =1
pjg(ςj)
for any continuous convex function g : IR → IR.
Consider any sequence σ, not necessarily non-decreasing, and let σ+
denote the non-decreasing
sequence such that (i) σ p σ+
and (ii) any other non-decreasing sequence ς that satisfies
σ p ς is p-majorized by σ+
. The latter property motivates calling σ+
the largest non-decreasing
sequence that satisfies σ p ς. Lemma A1 in the Appendix establishes that sequence σ+
is well
defined and that ς = σ+
is the solution to
min
σ p ς
n X
j =1
pjg(ςj)
where the minimization considers all possible sequences, which are not necessary non-decreasing.
Now consider the BIC minimization problem in (7). Note that the shifted weights
c Wi(xi) = Wi(xi) −
∆Λi(xi)
fi(xi)
satisfy Wi fi
c Wi for all i ∈ I.12
In other words, varying the Λi(xi) results in sequences c Wi that
are fi-majorized by Wi. Lemma A1 implies the Λi(xi) should be chosen such that c Wi = W+
i .
12
Since
Pl
j=1 ∆Λi(xj
i) = Λi(xl
i) − Λi(x0
i ) ≥ 0 for l = 1,...,Ni with equality for l = Ni.
12Importantly, the same solution applies to the DIC minimization problem in (6).
Proposition 4. The support function for the set of feasible interim expected values that satisfy
BIC or DIC incentive compatibility constraints is given by
SBIC
(W) = SDIC
(W) = Sinterim(W+
)
for any W ∈ IR
P
i |Xi|
with Sinterim given in Proposition 1.
3.3. Optimal Mechanisms: Linear Objectives
The mechanism that maximizes the linear objective V · Ω over the set of feasible and incentive
compatible interim values follows from applying Hotelling’s lemma to the support function of
Proposition 4 (see Rockafellar, 1970). The BIC-DIC equivalence result of Proposition 4 ensures
that the resulting mechanism can be written as a dominant strategy incentive compatible mech-
anism.
Proposition 5. For any social choice problem and any linear objective V · Ω, an optimal
dominant strategy incentive compatible allocation is given by
qk
(x) =
(
1/|M| if k ∈ M
0 otherwise
(8)
where M ≡ argmaxk ∈K
P
i∈I ak
i Ω+
i (xi). Given vi(x) =
P
k∈K ak
i qk
(x), optimal payments equal
ti(x) = xivi(x) −
X
xj
i <xi
(xj+1
i − xj
i)vi(xj
i,x−i) (9)
Commonly studied objectives are expected surplus and expected revenue, both of which are
linear in the interim expected values. Expected surplus Ex(
P
i∈I Vi(xi)xi) is readily written as
V · x. Likewise, the upward binding incentive compatibility constraints (3) allow us to rewrite
expected revenue Ex(
P
i ti(x)) as V · MR, where the marginal revenues are defined as
MRi(xj
i) = xj
i − xj+1
i − xj
i
1 − Fi(xj
i)
fi(xj
i)
(10)
and Fi(xj
i) =
Pj
l=1 fi(xl
i). Hence, as an immediate corollary, Proposition 5 results in the efficient
and the revenue maximizing mechanisms for any social choice problems.
13With the next example we illustrate that the support function approach can be immediately
extended to some environments with non-linear utilities and a continuous set of alternatives.
Example 2. Consider an auction for a single perfectly-divisible good among I ≥ 1 ex ante
symmetric bidders. Bidders’ types are distributed according to a common probability distribution
f(·) with support X = {x1
,...,xN
} for some N ≥ 1. Suppose bidders have diminishing marginal
valuations, i.e. they value winning a fraction qi(x) at vi(x) = qi(x)1−γ
where 0 ≤ γ ≤ 1. The
interim support function equals
Sinterim(W) = Ex
I X
i=1
max(0,Wi(xi))1/γ
γ
For the surplus-maximizing allocation rule we do not need to majorize agent weights and the
optimal allocation equals
q∗
i (x) =
x
1/γ
i
PI
j =1 x
1/γ
j
and the payment rule is given by
t∗
i (x) = xiq∗
i (x)1−γ
−
X
xj
i <xi
(xj+1
i − xj
i)q∗
i (xj
i,x−i)1−γ
Similarly, the revenue-maximizing allocation rule is13
q∗∗
i (x) =
max(0,MR+
(xi))1/γ
PI
j =1 max(0,MR+(xj))1/γ
and the optimal payments are similarly defined. When γ tends to one, the efficient allocation rule
assigns shares proportionally to bidders’ types while the optimal allocation rule assigns shares
proportionally to bidders’ marginal revenues. For intermediate values, 0 < γ < 1, the efficient
and optimal allocation rules resemble “Tullock-type” success functions. Finally, Myerson’s (1981)
familiar result for the optimal auction is obtained in the limit when γ tends to zero, which
corresponds to a linear value function vi(x) = qi(x). Now the efficient allocation rule is to
assign all shares to the highest-type bidder while the revenue-maximizing allocation rule assigns
all shares to the bidder with the highest positive marginal revenue (and assigns nothing if all
marginal revenues are negative). 
13
Where we interpret 0/0 as 0.
144. Extensions and Applications
4.1. Optimal Mechanisms: Concave Objectives
General objectives that differ from pure profit and efficiency maximization are widespread. Many
governmental programs give preferences to some groups to alleviate their economic and social
disadvantages. For example, the US Federal Communications Commission gives substantial
bidding preferences to minority firms in the form of bidder-subsides (Ayres and Crampton, 1996),
i.e. by charging only a portion of a winning bid. In the same way, the Department of Defense
charges 50% bid penalty to foreign agents in US defense contracts.14
Many firms have also
objectives that differ from pure profit maximization. European Civil Law countries such as
France and Germany view big firms as “mini-societies” that take into account the impact of
their decisions on the welfare of their employers, consumers, and suppliers (see, e.g. Tirole, 2001;
and Magill, Quinzii, and Rochet, 2010).15
We analyze objectives that depend on both agent interim expected values and transfers. To
include interim expected transfers Ti(xi) into the support function we denote their corresponding
weights as Zi(xi) for xi ∈ Xi, i = 1,...,I. Since transfers are unrestricted the support function
that corresponds to their feasible set (not yet taking into account incentive constraints) equals
Ex δ(Zi(xi) = 0, ∀xi,∀i), where we use the standard definition of δ-function that equals 0 if its
argument is true and +∞ otherwise. Combining this result with Proposition 1 we obtain the
expression for the support function of feasible expected interim values and transfers
Sinterim(W,Z) = Ex max
k ∈K
X
i∈I
ak
i Wi(xi)

+ Ex δ(Zi(xi) = 0, ∀xi,∀i)

(11)
Let the weights Zi(xi) correspond to the interim expected payoffs Ti(xi) and define
MRZi
(xj
i) = xj
iZi(xj
i) −
xj+1
i − xj
i
fi(xj
i)
X
l>j
fi(xl
i)Zi(xl
i) (12)
for j = 1,...,Ni and xNi+1
i = xNi
i . Note that for Zi(xj
i) ≡ 1 the latter expression reduces to
the standard formula for marginal revenues (10). Parallel to Proposition 4 we now obtain the
support function of feasible and incentive compatible interim expected values and transfers.
Proposition 6. The support function for the set of feasible interim expected values and transfers
14
“Defense Federal Acquisition Regulation Supplement,” Part 225: Foreign Acquisition (2008),
http://www.acq.osd.mil/.
15
See Ledyard and Palfrey (1999) for a discussion about general welfare objectives in public good provision
settings.
15O
O0
< O ∇S
(V∗
,T∗
) ∈ ∇S(∇O(V∗
,T∗
))
Figure 4 Maximizing concave objectives using the geometric approach. The optimal interim expected
values and transfers belong to the subdifferential of the support function at the vector of weights equal
to the gradient of the objective function at the optimal interim expected values and transfers.
that satisfy BIC (DIC) constraints is given by
SDIC
(W,Z) = SBIC
(W,Z) = Ex

max
k ∈K
X
i∈I
ak
i Wi(xi) + MRZi
(xi)
+

(13)
for any W ∈ IR
P
i |Xi|
and Z ∈ IR
P
i |Xi|
+ .16
We now consider an increasing, concave, and differentiable objective17
O(V,T),
and extend the logic of Subsection 3.3 to characterize the maximimum of objective O over the
set of feasible and incentive compatible interim expected values and transfers.
To characterize the optimal point we use that concave objectives have convex indifference
curves. Therefore, the tangent line to objective O at the optimal point should separate the
indifference curve of the objective and the feasible and incentive compatible set. Proposition 5
then implies that the optimal point belongs to the subdifferential of the support function at the
vector of weights equal to the gradient of objective O at the optimal point (see Figure 4). As a
result the following proposition follows.
Proposition 7. For any social choice problem and for any increasing, concave, and differen-
tiable objective O(V,T) the interim expected values and transfers that correspond to an optimal
16
We consider ex post and interim individually rationality constraints as a part of DIC and BIC constraints
respectively. See the discussion in the beginning of Subsection 3.2.
17
This class of objectives does not include functions that are decreasing in agent payments, like objectives
increasing in agent utilities. We consider this important class of objectives in a companion paper Goeree and
Kushnir (2013).
16mechanism satisfy18
(V∗
,T∗
) ∈ ∇SBIC
(∇O(V∗
,T∗
)) (14)
We finally note that for increasing and concave objectives only the optimal values V∗
need
to be determined by the fixed-point equation (14). The optimal values V∗
in turn uniquely
determine the optimal payments. To understand this, we note that expression (13) links the
partial derivatives of the support function with respect to Wi(xi) and the partial derivatives of
the support function with respect to Zi(xi). Using the fixed point equation (14) we then substitute
the partial derivatives in this link with agent values V∗
and transfers T∗
. As a consequence we
obtain the following
T∗
i (xi) = V ∗
i (xi)xi −
X
xk
i <xi
V ∗
i (xk
i )(xk+1
i − xk
i )
This expression is analogous to formula (9) for the ex post optimal payments. The ex post
optimal payments in (9), however, can be chosen with some flexibility. In contrast, when the
objective is increasing in both agent values and transfers the optimal values determine the optimal
payments uniquely. In this sense, the above expression is close to the seminal envelope theorem
(e.g. Milgrom and Segal, 2002).
4.2. Reduced Form Implementation for General Social Choice Problems
In Subsection 3.1 we show how the geometric approach extends the reduced form auctions to
social choice problems for models with private values and independently distributed types. Here,
we further develop this extension both to the problems with correlated and multi-dimensional
types see, which is known to the literature (see Border, 2007), and to the case when agents have
interdependent values, which is novel to the literature.
We consider settings with multi-dimensional types. Agent i’s type is Ti-dimensional and the
profile of agent types is x = (x1
1,...,xT1
1 ,...,x1
I,...,xTI
I ). We denote Xi =
QTi
j=1 Xij, where each
Xij = {x1
ij,...,x
Nij
ij }, and X =
Q
i Xi. We allow for correlation in types and denote their joint
probability distribution as f(x). Agent values are interdependent: when alternative k is selected
and the profile of agent types is x agent i’s value equals vk
i (x). We denote agent i’s ex post and
interim expected value as vi(x) =
P
k∈K vk
i (x)qk
(x) and Vi(xi) =
P
x−i
f−i(x−i)vi(x) respectively.
This setup relaxes all assumptions of the main model: the values vk
i can be non-linear functions
of the types, the values are not private since they depend on others’ types, and types are correlated
and multi-dimensional. While the setup is much more general, the derivation of the ex post and
18
We consider a differentiable objective function only for ∇O(V∗
,T∗
) be a singleton. Otherwise, the optimal
mechanism belongs to the subdifferential of the support function at some point in ∇O(V∗
,T∗
).
17interim support functions parallels that of Proposition 1.
Proposition 8. The support function for the feasible interim values is
Sinterim(W) = Ex max
k ∈K
X
i∈I
vk
i (x)Wi(xi)

and the feasible interim values V satisfy V · W ≤ Sinterim(W) for all W ∈ IR
P
i |Xi|
.
Proposition 8 extends the reduced form implementation to the environments with interdependent
values by providing the explicit formula for the support function for the set of agent feasible
values. Yet this support function does not include incentive constraints. For the general model,
determining the consequences of incentive constraints is complicated and requires more than
comparing adjacent types only. We leave a complete analysis to future research but illustrate
in the next subsection how our methodology applies to the case of linear interdependencies for
which adjacent comparisons are sufficient.
4.3. Interdependent Values: Second-Best Mechanisms
For the environments with interdependent values a natural analog of dominant strategy incentive
compatibility (DIC) is the notion of ex post incentive compatibility (EPIC), which requires that,
for each type profile, agents prefer to report their types truthfully when others do. EPIC and
DIC coincide if agent types are private and independent (Bergemann and Moris, 2005). Unlike
DIC, however, EPIC does not depend on agents’ beliefs when there are value interdependencies.
In this section we illustrate how the geometric approach can be applied to environments with
interdependent values. For these environments we consider settings when the maximum social
surplus, i.e. first-best, is not achievable and derive its second-best level, i.e. the maximum level
of social surplus under Bayesian incentive compatible (BIC) and interim individually rational
(INIR) constraints. We also provide a condition when the second-best level can be implemented
with EPIC and ex post individually rational (EXIR) mechanism.
Consider a single-unit auction with two bidders. Agent types are positive and independently
distributed. There are only three possible social alternatives. Alternative i corresponds to the
event that bidder i wins the unit, and alternative 0 to the event that the seller keeps the unit.
The utility of agent i equals xi +αxj if he wins the object and 0 otherwise. Hence, the expected
interim value of agent i is
Vi(xi) = xiQi(xi) + αExj
(xjqi
(xi,xj)),
18where Qi(xi) = Exj
(qi
(xi,xj)) is bidder i’s interim expected chance of winning. In this environ-
ment, the incentive compatibility constraints reduce to monotonicity constraints on the allocation
rule.
Proposition 9. If mechanism (q,t) is BIC (EPIC) then Qi(xi) (qi
(xi,x−i)) is non-decreasing
function of xi for each i ∈ I. Conversely, for any allocation rule q such that Qi(xi) (qi
(xi,x−i))
is non-decreasing function of xi for each i ∈ I there exist transfers t such that mechanism (q,t)
is BIC (EPIC).
Given the above monotonicity conditions the support function for the set of interim expected
values that can be achieved with some BIC and INIR mechanism equals
SBIC
(W) = inf
Λi(xi)≥0
Ex max
i6=j
0,(xi + αxj)Wi(xi) −
∆Λi(xi)
fi(xi)

Similarly the support function for the set of interim expected values that can be achieved with
some EPIC and EXIR mechanism equals
SEPIC
(W) = inf
λi(x)≥0
Ex max
i6=j
0,(xi + αxj)Wi(xi) −
∆λi(x)
fi(xi)

Maskin (1992) show for a continuous-type version of this example that the first-best social surplus
cannot be implemented with BIC and INIR (and, hence, EPIC and EXIR) mechanism when
α > 1. We now provide conditions when the second-best level of social surplus, which equals
the value of support function at unit weights SBIC
(1), can be implemented with some EPIC and
EXIR mechanism. We first approach this question when the unit has to be always allocated to
the agents(see also Proposition 2 in Hernando-Veciana and Michelucci, 2011), and, hence, there
are no zeros in the support function expressions.
Proposition 10. If the unit has to be always allocated to the agents and α > 1 the second-best
level of social surplus can be implemented with some EPIC and EXIR mechanism and equals
SEPIC
(1) = SBIC
(1) = max
i∈I
(Ei(xi)) + αmin
i∈I
(Ei(xi))
We now identify a condition on α when one of the bidders always get the unit at the second-best
allocation, even though the auctioneer can keep the unit (see also Proposition 6 in Hernando-
Veciana and Michelucci, 2009). In this case the second-best level of social surplus can be again
implemented with some EPIC and EXIR mechanism.
19Proposition 11. Consider the case when the auctioneer can keep the unit. The second-best
level of social surplus can be implemented with some EPIC and EXIR mechanism if
1 < α ≤ maxi∈I(
Ei(xi)
Ei(xi) −
P
j∈I x1
j
)
where Ei(xi) denotes the expected type of agent i.
We finally illustrate our results with a simple example of a single-unit auction with two symmetric
bidders and two equally likely and independent types, x = 1 and x = 10. We compare the sets
of feasible outcomes that satisfy BIC and EPIC constraints respectively. Since the bidders are
ex ante symmetric, the allocation rule has no agent specific subscript and can be represented by
a matrix
q =
 q(x,x) q(x,x)
q(x,x) q(x,x)

where the rows correspond to (say) agent 1’s type and the columns to agent 2’s type, and the
entries correspond to the probabilities that the object is assigned to agent 1. The probability
that object is assigned to agent 2 can be obtained by the transposition of the matrix.
Figure 5 shows the sets of interim values that result when α = 0 (left panel), α = 1.2 (middle
panel), and α = 2 (right panel). In each of the panels, the light area corresponds to the set
of feasible values without any incentive constraints imposed, the medium dark area to the BIC
values, and the dark area to the EPIC values. In case of pure private values, i.e. α = 0, the
latter two sets coincide as shown by the left panel. However, the equivalence between Bayesian
and ex post implementation generally fails when α > 0 as shown by the middle and right panels.
The easiest way to describe the different sets is by their vertices.19
For instance, the set
of EPIC outcomes can be described by five vertices, which (clockwise starting at the origin)
correspond to the following allocation rules
qEPIC
=
 0 0
0 0

,
 0 0
1 1
2

,
 1
2
0
1 1
2

,
 1
2
1
2
1
2
1
2

,
 0 1
2
0 1
2

Likewise, for the BIC outcomes the six vertices correspond to the allocation rules
qBIC
=
 0 0
0 0

,
 0 0
1 1
2

,
 1
2
0
1 1
2

,
 1
2
1
2
1
2
1
2

,
 0 3
4
1
4
1
2

,
 0 1
2
1
2
0

19
The vertices follow from the gradient of the support function at points of differentiability. The five EPIC
vertices (0,0),(0, 15
2 +3α),(1
4 + 1
4α, 15
2 +3α),(1
2 + 11
4 α,5+ 11
4 α),(1
4 + 5
2α, 5
2 + 5
2α). The first four plus (3
8 + 15
4 α, 15
4 +
21
8 α), (1
4 + 5
2α, 5
2 + 1
4α) constitute the six BIC vertices.
20v
v
v
v
v
v
Figure 5. Application of the geometric approach to the environments with interdependent values.
Shown are the feasible outcomes with no incentive constraints imposed (light), Bayesian incentive com-
patible outcomes (medium dark), and ex post incentive compatible outcomes (dark) for α = 0 (left
panel), α = 1.2 (middle panel), and α = 2 (right panel). The largest blue dot indicates the first-best
outcome, the medium-sized blue dot the second-best outcome under BIC, and the smallest blue dot
indicates the allocation that delivers the maximum level of social surplus under EPIC.
Bayesian incentive compatibility requires that the sum of entries in the top row does not exceed
the sum of entries in the bottom row. In contrast, ex post incentive compatibility requires that
the entries in the top row do not exceed the entries in the bottom row for both columns (see
Proposition 9). Notice that the final two BIC matrices violate this more stringent condition.
The blue dots in Figure 5 indicate the optimal outcomes: the largest blue dot indicates the
first-best outcome, the medium-sized blue dot indicates the second-best outcome under BIC, and
the smallest blue dot indicates the allocation that delivers the maximum level of social surplus
under EPIC. For α ≤ 1, the first-best outcome can be implemented with EPIC mechanism and
correspond to the third EPIC matrix. When 1 < α ≤ E(x)
E(x)−2x
= 11
7
the first-best cannot be
achieved, but the second-best outcome can be implemented with EPIC mechanisms and corre-
spond to the penultimate EPIC matrix. If α > 11
7
the second-best outcome can be implemented
only with BIC mechanism, and correspond to the penultimate BIC matrix. In this case BIC
implementation leads to more social surplus than EPIC.
5. Conclusions
This paper develops a novel geometric approach to mechanism design based on the duality be-
tween a convex closed set and its support function. Using this duality, we first extend the
literature on reduced form auction to social choice problems with interdependent values. Second,
we show that the “ironing” procedure (Mussa and Rosen, 1978; and Myerson, 1981) can be rein-
terpreted in terms of majorization theory (Hardy, Littlewood, and Pólya, 1929). We also provide
21a simple proof that the feasible sets of interim expected values and transfers that remain after
imposing Bayesian and dominant strategy incentive compatibility constraints coincide. Third,
the knowledge of the support function admits the direct derivation of the optimal mechanism
using standard tools such as Hotelling’s lemma. We determine the optimal mechanism for any
social choice problem and any linear objective, including revenue and surplus maximization. We
also provide a fixed point equation that characterizes an optimal mechanism for general concave
objectives. Finally, for environments with linear value interdependencies we provide a condition
when the second-best allocation is ex post incentive compatible.
Importantly, our geometric approach applies to questions that go beyond the scope of this
paper. The geometric interpretation of the incentive compatibility constraints extend to other
types of constraints, such as capacity constraints and budget balance. For instance, we consider
the maximization of general concave welfare objectives when agent transfers needs to be budget
balanced in a companion paper Goeree and Kushnir (2013a). Next, the geometric approach can
be immediately adapted to continuous type spaces. An analog of support functions for infinite-
dimensional type-spaces are support functionals. They possess the same properties as support
functions with respect to additions, intersections, and linear transformations, as well as there is
an analog of Hotelling’s lemma for continuous type-spaces (see Chapter 7.10 in Aliprantis and
Border, 2006). Moreover, the geometric approach can be readily applied to the environments
with multi-dimensional types and non-linear utilities. For these environments the incentive com-
patibility constraints are equivalent to cycle-monotonicity conditions (Rochet, 1987), which can
be incorporated into the support function (Goeree and Kushnir, 2013b).
To summarize, our geometric approach applies to a wide spectrum economic problems. As
such it may provide a powerful tool to study mechanism design problems that have hitherto
resisted thorough analysis because of analytical intractability. We leave this exciting prospect as
a topic for future research.
22A. Appendix
Proof of Proposition 2. Necessity of the inequalities follows from the definition of the sup-
port function. Sufficiency also follows easily from our approach by interpreting (2) in terms of
hyperplanes that bound the interim expected probability set. Any boundary point of the interim
expected probability set, i.e. any Q that satisfies Q · W = S(W) for some W, can be written
as Q = ∇S(W) at points of differentiability of the support function from the envelope theorem.
Furthermore, if S(W) is not differentiable at W then the subdifferential ∇S(W) produces a face
on the boundary. For any Q 6= Q0
that belong to such a face we have
(Q − Q0
) · W = S(W) − S(W) = 0.
Each point of non-differentiability, W, therefore defines a normal vector to the face of the poly-
hedron, formed by ∇S(W). For the support function (1) the points of non-differentiability are
weight vectors with several equal entries, and those equal entries are the largest entries for some
profile of types x. Since non-maximum entries does not change the value of the support func-
tion we can consider only such weights where these entries are 0. Since the support function is
homogeneous of degree one we can restrict ourselves to weights with only 1 and 0 entries. Then
considering all non-trivial W ∈ {0,1}
P
i Xi
exhausts all hyperplanes that contain one of the faces
of the boundary of the interim expected probability set. 
Lemma A1. For any σ sequence σ+
is well defined and ς = σ+
solves
min
σ p ς
n X
j =1
pjg(ςj) (A.1)
for any convex function g : IR → IR.
Proof: We first show that sequence σ+
is well defined. For this purpose let us define for any
non-decreasing sequence ς ∈ IRn
function fl(ς) =
Pl
j=1 pjςj and αl = supσpς fl(ς), l = 1,..,n,
where the supremum is taken only over non-decreasing sequences. Define now sequence σ+
as
σ+
l = (αl−αl−1)/pl, where α0 = 0. Clearly, we have σ p σ+
. To prove that σ+
is non-decreasing
notice that
fl(ς)
pl
+ fl−2(ς)
pl−1
≥ ( 1
pl
+ 1
pl−1
)fl−1(ς)
for any non-decreasing ς and l = 2,...,n. Therefore,
sup
σpς
fl(ς)
pl
+ fl−2(ς)
pl−1

≥ ( 1
pl
+ 1
pl−1
) sup
σpς
fl−1(ς)
where the supremums are taken over only non-decreasing sequences. Hence, (αl − αl−1)/pl ≥
(αl−1 − αl−2)/pl−1.
23We now consider minimization problem (A.1). We show that, without loss of generality, we
can restrict attention to non-decreasing sequences ς. Suppose not and ςl > ςk for l < k. Then
define the sequence ς̃ with elements ˜ ςl = ςl −ε(ςl −ςk)/pl and ˜ ςk = ςk +ε(ςl −ςk)/pk while ˜ ςj = ςj
for j 6= l,k. The sequence ς̃ also satisfies σ p ς̃. Since g(·) is convex we have
plg(˜ ςl) + pkg(˜ ςk) ≤ plg(ςl) + pkg(ςk)
and, hence,
Pn
j =1 pjg(˜ ςj) ≤
Pn
j =1 pjg(ςj). Repeatedly applying this procedure results in a non-
decreasing sequence ς̃ that satisfies σ p ς̃. But any such sequence is p-majorized by σ+
. Hence,
the statement of the lemma follows from Lemma 1. 
Proof of Proposition 4. The statement of the proposition follows from a more general result
established in Proposition 6 that also incorporates transfers into the support function. 
Proof of Proposition 5. Using Proposition 4 and the definition of the interim support function
we have
SDIC
(Ω) = Sinterim(Ω+
) = max
X
k∈K
Ex qk
(x)
X
i∈I
ak
i Ω+
i (xi)

|q is feasible .
This establishes the optimality of the allocation rule in equation (8). To derive the payments
that are ex post individually rational and implement allocation (8) in dominant strategies we
consider constraints (3). Considering the payments binding the upward incentive constraints and
the ex post individually rationality constraint for the lowest type we recursively calculate
ti(x) = vi(x) −
X
xj
i <xi
xj+1
i − xj
i

vi(xj
i,x−i)
for x ∈ X and i ∈ I. This establishes the claim of the proposition. 
Proof of Proposition 6. Let us first derive the support function of feasible interim expected
values and transfers that also satisfy Bayesian incentive compatibility (BIC) constraints (4) and
interim individual rationality (INIR) constraints. For convenience we rewrite these constraints
as
Ti(xj
i) − Ti(xj−1
i ) ≥ xj−1
i Vi(xj
i) − Vi(xj−1
i )

(A.2)
Ti(xj
i) − Ti(xj−1
i ) ≤ xj
i Vi(xj
i) − Vi(xj−1
i )

(A.3)
Ti(xj
i) ≤ xj
iVi(xj
i) (A.4)
24The support function of the intersection of non-empty closed convex sets is the convolution of
the support functions of these sets (see Rockafelar, 1970). When some sets are half spaces the
support function of the intersection can be calculated using formula (5) and, hence, we obtain
SBIC
(W,Z) = inf
Λ,γ,µ≥0
Ex max
k ∈K
X
i
ak
i
c Wi(xi)

+ Ex δ(b Zi(xi) = 0, ∀xi,∀i)

(A.5)
where
c Wi(xj
i) = Wi(xj
i) + 1
fi(xj
i )
(−xj−1
i Λi(xj−1
i ) + xj
iΛi(xj
i) + xj
iγi(xj
i) − xj+1
i γi(xj+1
i ) + xj
iµi(xj
i))
b Zi(xj
i) = Zi(xj
i) + 1
fi(xj
i )
(Λi(xj−1
i ) − Λi(xj
i) − γi(xj
i) + γi(xj+1
i ) − µi(xj
i))
and parameters Λi(xj−1
i ), γi(xj
i), µi(xj
i) correspond to constraints (A.2), (A.3), and (A.4) respec-
tively. Note that our convention is that Λi(x0
i ) = Λi(xNi
i ) = 0 and γi(x1
i ) = γi(xNi+1
i ) = 0.
Since agents’ utilities satisfy the single crossing condition with respect to xi and Vi(xi) the INIR
constraints are binding only for the lowest type, i.e. µi(xj
i) = 0 for j = 2,...,Ni. Using this fact
and that (b Zi(xi) = 0, ∀xi,∀i) we deduce
µi(x1
i ) =
Ni X
l=1
Zi(xl
i)fi(xl
i),
γi(xj
i) =
Ni X
l=j
Zi(xl
i)fi(xl
i) + Λi(xj−1
i ) for j = 2,...,Ni
Note that constraints µi(x1
i ) ≥ 0 and γi(xj
i) ≥ 0 are satisfied for any vector Z ∈ IR
P
i |Xi|
+ .
With some abuse of notation we replace (xj+1
i − xj
i)Λi(xj
i) with Λi(xj
i). Substituting the above
expressions in the formula (A.5) the support function for the set of feasible interim expected
values and transfers that satisfy BIC and INIR constraints reduces to
SBIC
interim(W,Z) = inf
0≤Λi(xi)
Ex

max
k ∈K
X
i∈I
ak
i Wi(xi) + MRZi
(xi) −
∆Λi(xi)
fi(xi)

Let us now define shifted weights
c Wi(xi) = Wi(xi) + MRZi
(xi) −
∆Λi(xi)
fi(xi)
It is straightforward to verify that Wi + MRZi
fi
c Wi for all i ∈ I.20
Therefore, Lemma A1
implies that (Wi + MRZi
)+
delivers the minimum to the above expression, which establishes the
claim of the proposition for the BIC support function.
20
Note that
Pl
j=1 ∆Λi(xj
i) = Λi(xl
i) − Λi(x0
i ) ≥ 0 for l = 1,...,Ni with equality for l = Ni.
25We now show that the introduction of the dominant strategy incentive compatibility (DIC)
constraints
ti(xj
i,x−i) − ti(xj−1
i ,x−i) ≥ xj−1
i vi(xj
i,x−i) − vi(xj−1
i ,x−i)

(A.6)
ti(xj
i,x−i) − ti(xj−1
i ,x−i) ≤ xj
i vi(xj
i,x−i) − vi(xj−1
i ,x−i)

, (A.7)
and ex post individual rationality (EXIR) constraints
ti(xj
i,x−i) ≤ xj
ivi(xj
i,x−i) (A.8)
lead to the same support function as the introduction of BIC and INIR constraints. To ac-
complish this we use the geometric interpretation of incentive constraints: the support function
minimization problem corresponds to the intersection of the feasible set with the corresponding
incentive constraint. Hence, we can include the constraints to support function (11) for one agent
at a time.
Using arguments similar to the BIC support function we first include agent 1’s DIC and EXIR
constraints to the support function. Therefore,
SDIC
agent1
(W,Z) = inf
0≤λ1(x)
Ex

max
k ∈K
(ak
1(W1(x1) + MRZ1(x1) − ∆λ1(x)
f1(x1)
) +
P
i6=1 ak
i Wi(xi) + MRZi
(xi)

where parameters λ1(xj−1
1 ,x−1) correspond to constraints (A.6), λ1(x0
1,x−1) = λ1(xN1
1 ,x−1) = 0,
and ∆λ1(xj
1,x−1) = λ1(xj
1,x−1) − λ1(xj−1
1 ,x−1). We again consider the shifted weights
c W1(x) = W1(x1) + MRZ1(x1) − ∆λ1(x)
f1(x1)
For each x−1 vector c W1(·,x−1) satisfies W1 + MRZ1 f1
c W1(·,x−1) and the above minimization
problem can be rewritten as
X
x−1
inf
W1+MRZ1
f1
c W1(·,x−1)
X
x1
f1(x1)g1(c W1(x1,x−1))
where g1(y) = f−1(x−1)maxk ∈K ak
1y +
P
j6=1 ak
j Wj(xj) + MRZj
(xj)

is a convex function of y.
Lemma A1 asserts that c W1(·,x−1) = (W1 + MRZ1)+
for each x−1 solves the above minimization
problem.
Let us now assume that we have introduced the constraints of i−1 agents. The minimization
problem that corresponds to the introduction of the constraints of agent i is
X
x−i
inf
Wi+MRZi
fi
c Wi(·,x−i)
X
xi
fi(xi)gi(c Wi(xi,x−i))
26where
c Wi(x) = Wi(xi) + MRZi
(xi) − ∆λi(x)
fi(xi)
and function
gi(y) = f−i(x−i)max
k ∈K
X
j<i
ak
j Wj(xj) + MRZj
(xj)
+
+ ak
i y +
X
j>i
ak
j Wj(xj) + MRZj
(xj)

is a convex function of y. Lemma A1 again asserts that c Wi(·,x−i) = (Wi + MRZi
)+
for each x−i
solves the above minimization problem. Proceeding in this way for all agents, we finally obtain
that the support function for the feasible set of agent interim expected values and transfers that
satisfies the DIC and EXIR constraints coincides with SBIC
(W,Z). 
Proof of Proposition 7. Vector (V∗
,T∗
) belongs to ∇SBIC
(∇O(V∗
,T∗
)) if and only if (see
Theorem 23.5 in Rockafellar, 1970)
(V∗
,T∗
) ∈ argmax((V,T) ◦ ∇O(V∗
,T∗
)|(V,T) ∈ C)
where C is the set of feasible incentive compatible and individually rational interim expected
values and transfers. This is equivalent to ∇O(V∗
,T∗
) be tangent to set C at (V∗
,T∗
) (see
p. 15, Rockafellar, 1997). Finally, Theorem 27.4 in Rochafellar (1997) establishes that this is
equivalent to (V∗
,T∗
) be a vector where maximum of O(V,T) relative to C is attained. 
Proof of Proposition 8. We show in Subsection 3.1 that the support function for allocation
probabilities qk
(x) equals
S(w) =
X
x∈X
max
k ∈K
wk
(x)
Taking into account how the support function changes under a linear transformation (see Sub-
section 3.1) we derive the support function for ex post agent values vi(x) =
P
k vk
i (x)qk
(x):
Sex post(w) =
X
x∈X
max
k ∈K
X
i∈I
vk
i (x)wi(x)
The interim expected values are given by Vi(xi) =
P
x−i
f(x|xi)vi(x), where f(x|xi) denotes the
conditional distribution of agent types. Therefore,
Sinterim(W) = Ex max
k ∈K
X
i∈I
vk
i (x)Wi(xi)

where, as before, we multiplied by fi(xi), i.e. we used the probability weighted inner product to
define the set of interim expected values. 
27Proof of Proposition 9. The statement for BIC mechanisms directly follows from Theorem
3.1 in Jehiel and Moldovanu (2001). The extension to EPIC mechanisms is immediate. 
Proof of Proposition 10. The second-best level of social surplus equals the value of support
function at unit weights SBIC
(1). If the auctioneer has to always allocate the unit we have
SBIC
(1) = α Ei(xi) + Ej(xj)

+ inf
Λi≥0
Ex max
i6=j
(1 − α)xi −
∆Λi(xi)
fi(xi)

If we denote the shifted weights c Wi(xi) = (1 − α)xi − ∆Λi(xi)
fi(xi)
Lemma A1 establishes that f-
majorized values ((1 − α)xi)+
= (1 − α)Ei(xi) deliver the minimum to the above expression.
After some rearrangement the second-best level of social surplus equals
SBIC
(1) = max
i
Ei(xi) + αmin
i
Ei(xi)
The expression of SEPIC
(1) can be written similarly. The only differences is that the min-
imization takes place over λi(x) ≥ 0 that depend on the whole vector of agent types. The
argument of Proposition 6 establishes that ((1 − α)xi)+
delivers also the minimum to support
function SEPIC
(1) with the same optimal value. Hence, the second-best allocation can be im-
plemented with some EPIC and EXIR mechanism mechanism. 
Proof of Proposition 11. If the auctioneer can keep the unit the value of support function at
unit weights equals
SBIC
(1) = α Ei(xi) + Ej(xj)

+ inf
Λi≥0
Ex max
i6=j
−α(xi + xj),((1 − α)xi −
∆Λi(xi)
fi(xi)

Given the condition on α stated in the proposition and that agent types are positive we have
((1 − α)xi)+
= (1 − α)Ei(xi) > −α(xi + xj)
for each realization of xi and xj for at least some i 6= j = 1,2. Hence, the shifted weights
c Wi(xi) = ((1−α)xi)+
identified in Proposition 10 still deliver the minimum to the minimization
problem for SBIC
(1). The same argument applies to SDIC
(1). 
28References
Alaei, Saeed, Hu Fu, Nima Haghpanah, Jason Hartline, and Azarakhsh Malekian (2012)
“Bayesian Optimal Auctions via Multi- to Single-agent Reduction,” Working Paper.
Aliprantis, Charalambos D. and Kim C. Border (2006) “Infinite Dimensional Analysis: A Hitch-
hiker’s Guide,” Springer, Berlin.
Armstrong, Mark (2000) “Optimal Multi-Object Auctions,” Review of Economic Studies, 67,
455–481.
Asker, John and Estelle Cantillon (2010) “Procurement When Price and Quality Matter,” The
RAND Journal of Economics, 41, 1–34.
Ayres, Ian and Peter Crampton (1996) “Deficit Reduction Through Diversity: How Affirmative
Action at the FCC Increased Auction Competition,” Stanford Law Review, 48, 761-815.
Baldwin, Elizabeth and Paul Klemperer (2012) “Tropical Geometry to Analyse Demand,” Work-
ing paper, Oxford University.
Bapat, R. B. (1991) “Majorization and Singular Values III, ” Linear Algebra and its Applications,
145, 59–70.
Belloni, Alexandre, Giuseppe Lopomo, and Shouqiang Wang (2010) “Multidimensional Mecha-
nism Design: Finite-Dimensional Approximations and Efficient Computation,” Operations
Research, 58, 1079–1089.
Ben-Porath, Elchanan, Eddie Dekel, Barton L. Lipman (2012) “Optimal Allocation with Costly
Verification,” Working paper, Northwestern University.
Bergemann, Dirk and Stephen Morris (2005): “Robust Mechanism Design,” Econometrica, 73,
1771–1813.
Border, Kim C. (1991) “Implementation of Reduced Form Auctions: A Geometric Approach,”
Econometrica, 59, 1175–1187.
Border, Kim C. (2007) “Reduced Form Auctions Revisited,” Economic Theory, 31, 167–181.
Brusco, Sandro and Giuseppe Lopomo (2002) “Collusion via Signalling in Simultaneous Ascend-
ing Bid Auctions with Heterogeneous Objects, with and without Complementarities,” The
Review of Economic Studies, 69, 407–436.
Cai, Yang, Constantinos Daskalakis, and Matt Weinberg (2012a) “An Algorithmic Character-
ization of Multi-Dimensional Mechanisms,” in the 44th ACM Symposium on Theory of
Computing.
29Cai, Yang, Constantinos Daskalakis, and Matt Weinberg (2012b) “Optimal Multi-Dimensional
Mechanism Desgin: Reducing Revenue to Welfare Maximization,” in the 53rd Annual
IEEE Symposium on Foundations of Computer Science.
Che, Yeon-Koo, Daniele Condorelli, and Jinwoo Kim (2013) “Weak Cartels and Collusion-Proof
Auctions,” Working paper, University of Essex.
Che, Yeon-Koo, Jinwoo Kim, and Konrad Mierendorff (2013) “Generalized Reduced-Form Auc-
tions: A Network-Flow Approach,” Econometrica, forthcoming.
Dekel, Eddie, Barton L. Lipman, and Aldo Rustichini (2001) “Representing Preferences With a
Unique Subjective state Space,” Econometrica, 69(4), 891–934.
Ergin, Haluk and Todd Sarver (2010) “A Unique Costly Contemplation Representation,” Econo-
metrica, 78(4), 1285–1339.
Fuchs, Ladislas (1947) “A New Proof of an Inequality of Hardy-Littlewood-Polya,” Mat. Tidsskr.
B, 53–54.
Gershkov, Alex, Jacob K. Goeree, Alexey Kushnir, Benny Moldovanu, and Xianwen Shi (2013)
“On the Equivalence of Bayesian and Dominant-Strategy Implementation,” Econometrica,
81, 197–220.
Goeree, Jacob K. and Alexey Kushnir (2013a) “Optimal Mechanisms for General Welfare Ob-
jectives,” Working Paper, University of Zürich.
Goeree, Jacob K. and Alexey Kushnir (2013b) “A Geometric Approach to Mechanism Design:
The Case of Multidimensional Types,” Working Paper, University of Zürich.
Gutmann, Sam, J. H. B. Kemperman, J. A. Reeds, and L. A. Shepp (1991) “Existence of Prob-
ability Measures with Given Marginals,” Annals of Probability, 19, 1781–1797.
Hardy, Godfrey H., Littlewood, John E., and Pólya, Gyorgy (1929) “Some Simple Inequalities
Satisfied by Convex Functions,” Messenger Math, 58, 145–152.
Hart, Sergiu and Philip J. Reny (2011) “Implementation of Reduced Form Mechanisms: A Simple
Approach and a New Characterization,” Working Paper, The Hebrew University.
Hartline, Jason (2012) “Bayesian Mechanism Design (a Survey),” Foundations and Trends in
Theoretical Computer Science, 8(3), 143-263.
Hernando-Veciana, Angel and Fabio Michelucci (2009) “Second-Best Efficiency and the English
Auction,” Working Paper.
Hernando-Veciana, Angel and Fabio Michelucci (2011) “Second-Best Efficiency and the English
Auction,” Games and Economic Behavior, 73, 496–506.
30Hörner, Johannes and Larry Samuelson (2011) “Managing Strategic Buyers,” Journal of Political
Economy, 119, 379–425.
Kushnir, Alexey (2013) “On the Equivalence of Bayesian and Dominant-Strategy Implementa-
tion: The Case of Correlated Types,” Working Paper, University of Zürich.
Ledyard, John O. and Thomas R. Palfrey J. (1999) “A Characterization of Interim Efficiency
With Public Goods,” Econometrica, 67, 435–848.
Ledyard, John O. and Thomas R. Palfrey (2007) “A General Characterization of Interim Efficient
Mechanisms for Independent Linear Environments,” Journal of Economic Theory 133,
441–466.
Makowski, Louis, and Joseph M. Ostroy (2013) “From Revealed Preference to Preference Reve-
lation,” Journal of Mathematical Economics, 49, 71–81.
Manelli, Alejandro M. and Daniel R. Vincent (2007) “Multidimensional Mechanism Design: Rev-
enue Maximization and the Multiple-good Monopoly,” Journal of Economic Theory, 137,
153–185.
Manelli, Alejandro M. and Daniel R. Vincent (2010) “Bayesian and Dominant-Strategy Imple-
mentation in the Independent Private Values Model,” Econometrica, 78, 1905–1938.
Marshall, A. W., I. Olkin, I. and B. C. Arnold (2011) Inequalities: Theory of Majorization and
its Applications, Springer, New York.
Maskin, Eric (1992) “Auctions and Privatization,” in Privatization: Symposium in honour of
Herbert Giersh, ed. by H. Siebert, Institute fur Weltwirtshaft an der Univarsitat Kiel.
Maskin, Eric and John Riley (1984) “Optimal Auctions with Risk Averse Buyers,” Econometrica,
52, 1473–1518.
Matthews, Steven A. (1983) “Selling to Risk Averse Buyers with Unobservable Tastes,” Journal
of Economic Theory, 30, 370–400.
Matthews, Steven A. (1984) “On the Implementability of Reduced Form Auctions,” Economet-
rica, 52, 1519–1522.
Mierendorff, Konrad (2011) “Asymmetric Reduced Form Auctions,” Economics Letters, 110,
41–44.
Mierendorff, Konrad (2011) “Optimal Dynamic Mechanism Design with Deadlines,” Working
Paper, University of Zürich.
Milgrom, Paul and Ilya Segal (2002) “Envelope Theorems for Arbitrary Choice Sets,” Economet-
rica, 70, 583–601.
31Miralles, Antonio (2012) “Cardinal Bayesian Allocation Mechanisms Without Transfers,” Journal
of Economic Theory, 147, 179-206.
Mussa, Michael and Sherwin Rosen (1978) “Monopoly and Product Quality,” Journal of Eco-
nomic Theory, 18, 301–317.
Myerson, Roger B. (1981) “Optimal Auction Design,” Mathematics of Operations Research, 6,
58–73.
Magill, Michael, Martine Quinzii and Jean-Charles Rochet (2010)“Reforming Capitalism,” Work-
ing Paper.
Nemhauser, George L., and Laurence A. Wolsey (1988) “Integer and Combinatorial Optimiza-
tion,” Vol. 18, New York: Wiley.
Pai, Mallesh (2009) “Competing Auctioneers,” Working Paper, Kellogg School of Management,
Northwestern University.
Pai, Mallesh and Rakesh Vohra (2010) “Optimal Auctions with Financially Constrained Bidders,”
Working Paper, Kellogg School of Management, Northwestern University.
Pai, Mallesh and Rakesh Vohra (2011) “Otimal Dynamic Auctions and Simple Index Rules,”
Working Paper, Kellogg School of Management, Northwestern University.
Pai, Mallesh and Rakesh Vohra (2012) “Auction Design with Fairness Concerns: Subsidies vs.
Set-Asides,” Working Paper, Kellogg School of Management, Northwestern University.
Sarver, Todd (2008) “Anticipating Regret: Why Fewer Options May Be Better,” Econometrica,
76(2), 263–305.
Rochet, Jean-Charles (1987) “A Necessary and Sufficient Condition for Rationalizability in a
Quasi-Linear Context,” Journal of Mathematical Economics, 16, 191–200.
Rockafellar, R. Tyrrell (1970) Convex Analysis, Princeton Landmarks in Mathematics, Princeton
University Press.
Tirole, Jean (2001) “Corporate Governance,” Econometrica, 69,1–35.
Vohra, Rakesh V. (2011) Mechanism Design: A Linear Programming Approach, Cambridge Uni-
versity Press.
32