---
sha256: 8c7f201c2d73bfb2c6a7a3d8a7da21f642e7decef158c1f5c42540218a51ae96
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 54317
---
arXiv:2309.14201v1 [cs.GT] 25 Sep 2023
Towards a Theory of Maximal Extractable Value II:
Uncertainty
Tarun Chitra
September 2023
Abstract
Maximal Extractable Value (MEV) is value extractable by temporary monopoly
power commonly found in decentralized systems. This extraction stems from a lack
of user privacy upon transaction submission and the ability of a monopolist validator
to reorder, add, and/or censor transactions. There are two main directions to reduce
MEV: reduce the flexibility of the miner to reorder transactions by enforcing ordering
rules and/or introduce a competitive market for the right to reorder, add, and/or censor
transactions. In this work, we unify these approaches via uncertainty principles, akin
to those found in harmonic analysis and physics. This provides a quantitative trade-off
between the freedom to reorder transactions and the complexity of an economic payoff
to a user in a decentralized network. This trade off is analogous to the Nyquist-Shannon
sampling theorem and demonstrates that sequencing rules in blockchains need to be
application specific. Our results suggest that neither so-called fair ordering techniques
nor economic mechanisms can individually mitigate MEV for arbitrary payoff functions.
## 1 Introduction
Blockchains and other decentralized value transfer systems involve coordinating networks
of agents with varied reward and utility functions. These systems inherently need to be
designed to handle both sophisticated users, who optimize their transaction processing, and
unsophisticated users who are not aware of how the precise microstructure of their trans-
actions are processed. While this problem exists in both traditional finance and online ad
markets, blockchains have a unique problem as transaction submission is open to arbitrary
users and all transaction data is eventually made public. This transparency, while a boon
for analysis of user behavior and fund dispersion, also creates excess profit opportunities for
strategic users at the expense of non-strategic users.
However, such profits are not risk-free and are often needed for security properties in
blockchain systems. Arbitrage against decentralized exchanges is necessary to ensure that
prices are kept in line with off-chain marketplaces [AC20]. Strategic users generating MEV is
crucial for the functioning of such arbitrage. In some scenarios, it has even been demonstrated
1that there is a net positive externality to all users when such MEV is present as it improves
execution and routing quality [KDC22]. On the other hand, MEV has been utilized to
execute economic-based attacks on blockchain protocols and to reduce economic surplus to
unsophiscated users. There have been a number of articles that have attempted to quantify
this [Tit23,DGK+
20] and the conclusions on the magnitude of user impact are inconsistent.
MEV Mitigation. This lack of clear data on the net negative effect of MEV hasn’t pre-
vented research on MEV mitigation techniques. One of the first (and by far, the least suc-
cessful in practice) forms of MEV mitigation was so-called ‘fair ordering’ [KDK22,KDL+
21].
Fair ordering methods attempt to modify blockchain consensus to force validators to provide
extra information about the relative times that they received particular transactions. For
instance, if more than 50% of validators attest to receiving transaction A before transaction
B, a fair ordering protocol could enforce (as a consensus rule) that transaction A preceeds
transaction B.
Unfortunately, classical social choice theory shows that such pairwise ordering methods
cannot always work due to Condorcet Paradoxes (and more generally, Arrow’s impossibility
theorem). In response to this, fair ordering protocols attempt to create mechanisms that
minimize the probability of such paradoxical occurrences. However, it has now been es-
tablished that such mechanisms are vulnerable to denial-of-service attacks [VK23] and also
distort economic payoffs for end users (e.g. there is an excess cost to the user in terms of lost
utility that is greater than the gain from ‘fairness’ [WZD+
23,ACDK23]).
On the other hand, there are scenarios where ordering restrictions that are less strict
than fair ordering can provide positive user outcomes. For instance, [XFP23] demonstrates
that particular sequencing rules (e.g. restrictions on the final output ordering) for automated
market markers can increase social welfare for unsophiscated agents. This observation sug-
gests that restricting orderings based on user welfare functions can mitigate the negative
welfare effects of MEV. Note that this is in contrast to fair ordering, which is agnostic to
economic payoffs that occur under different orderings.
One natural question is how to construct sets of orderings that improve social welfare
given a set of utility functions. Both [KDC22] and [XFP23] are able to measure the impact
of reordering on automated market makers in part by taking advantage of the convexity
of the associated payoff functions. The goal of this paper is to provide generalizations
of these sequencing rules to a larger class of payoff functions. We will demonstrate via
example in §2.3 that the impact of sequencing rules can be dramatically larger for non-
smooth and non-monotone payoffs. These examples demonstrate that there is a trade-off
between the complexity of an ordering rule and some (coarse) notion of the complexity of the
payoff function realized by users. In particular, these examples illustrate that more complex
ordering rules tend to inure higher penalties (measured in terms of worst case payoffs to
users) for less complex payoff functions.
Uncertainty Principles. One way of demonstrating that two functions f,g are unable
to both simultaneously be ‘simple’ is to prove an uncertainty principle. While uncertainty
2principles are often associated with quantum systems in physics, they are a more general
phenomena for linear operators. In particular, if C(f) is a measure of complexity of f, an
uncertainty principle will usually be of the form
C(f) · C(Lf) ≥ c
for a constant c > 0 and for a linear transform L. The Heisenberg uncertainty principle
corresponds to C(f) =
R
x2|f(x)|dx
kfk2
and L being the Fourier transform. Such an inequality
says that if a complexity measure is ‘small’ for f then it cannot be small for Lf beyond some
level of precision (specified by the constant c). For the Fourier transform, such uncertainty
principles effectively state that f and its Fourier transform ˆ f cannot both be localized.
We aim to construct complexity measures C that represent fairness. These measures
will connect sizes of particular subsets of permutations, A ⊂ Sn, where Sn is the set of
permutations on n elements to measures of complexity of the payoff function f. We view the
sets A ⊂ Sn as the outputs of sequencing rules (such as fair ordering or the greedy CFMM
rule of [XFP23]). A large set means that the ordering rule is not restricting orderings
sufficiently whereas a small set is highly constrained. While there are many inequivalent
notions of function complexity for functions f : Sn → R, we will aim to choose the simplest
measure based on the boolean degree of a function [FKLM20].
This Paper. Using uncertainty principles as our guide, we will first reduce the problem
of measuring welfare loss due to MEV to a discrete harmonic analysis problem. We do this
by considering real-valued payoff functions that take in a sequence of transactions from a
fixed set, f(T1,...,Tn). We then consider a functional that maps a function f and a set
of orderings A ⊂ Sn to [0,1] to measure the ‘fairness’ of restricting f to A. One can use
this measurement to make relative comparisons of fairness for given payoff functions and
orderings A.
Our main results are that the fairness functionals that we define in §2.3 can be upper
and lower bounded using discrete harmonic analysis (such as uncertainty principles). More
precisely, we look at a payoff f and its Fourier transform ˆ f and utilize existing uncertainty
principles to show that the fairness functional of a payoff is bounded by the L1
and L∞
norms of ˆ f. This allows us to precisely state when a set of orderings A ⊂ Sn worsens the
fairness functional of f.
In the process, we also construct two major examples of payoff functions that are com-
monly found in decentralized finance (DeFi): constant function market makers (CFMM)
and liquidations. The fairness and MEV properties CFMMs have been repeatedly stud-
ied (e.g. [KDC22,XFP23,ZQT+
21,CAE22]) as their payoffs are smooth and have convexity
properties. Liquidations, on the other hand, are much harder to study because their pay-
off are extremely non-smooth. We utilize recent work [ACDK23] that demonstrates that
liquidations can be used as function basis for the set of reordering MEV payoff functions f.
One natural interpretation is that the Fourier expansion of payoff function corresponds
to expanding it in a basis of liquidations. This allows us to have concrete realizations of
payoff functions, represented as combinations of liquidations, that can saturate the best and
3worst case outcomes measured by fairness functionals. We believe that this ‘liquidation
representation’ of an MEV payoff (which is just its Fourier transform over the symmetric
group) will be useful for further design and analysis of MEV.
Notation. The set of permutations of n elements will be denoted Sn. For a permutation
π ∈ Sn, π(i) refers to the index where the ith element is moved. The probability simplex
will be defined as ∆n
= {(x1,...,xn) : xi ≥ 0,
P
i xi = 1}. We denote by [n] = {1,...,n}
and λ = (λ1,...,λk) ⊢ n a partition of n, e.g.
P
i λi = n with λi ∈ N. For a finite set S, we
denote the expectation of a function f : S → R as E[f] = 1
|S|
P
s∈S f(s). We treat Rn!
as
the set of functions f : Sn → R and view Lp
(Sn) as Rn!
with the metric k · kp.
## 2 Background
The goal of this section is to describe how to reduce a large portion of MEV to a problem
about functions f : Sn → R. Reducing MEV to a concrete mathematical problem allows us
to use tools from algebra and combinatorics to provide concrete guarantees. We note that
our definitions only focus on reordering MEV as opposed to MEV arising from censorship of
transactions. However, our algebraic tools can be extended to handle censorship with some
extra care (this is addressed in §4).
## 2.1 Blockchains.
Blockchains are decentralized systems that come to consensus on particular state and exe-
cution of computation on that state. We assume that readers are familiar with the basic
notions of blockchains and provide the minimal description. Readers interested in more
detials are referred to modern textbooks such as [Shi23] for further details.
A blockchain consists of a monotonically increasing sequence of blocks Bi, i ∈ N that
contain state and state transitions. Each block is made up of transactions T1,...,Tn that
mutate the state of the previous block and/or write new state. Users submit their transac-
tions via a peer-to-peer network and pay a fee to have their transactions included in a block.
Validators or miners are network participants who collect transactions and come to consen-
sus about the validity of a block Bi. Validators or miners must lock a resource to participate
and are incentivized with fees from user transactions and from a subsidy known as a block
reward. One key aspect of blockchains is that they allow for asynchronous communication
about shared state and that they are designed such that it is costly for validators to deviate
from the consensus protocol.
Different consensus mechanisms make different assumptions about validators in order to
guarantee security properties of the blockchain. For instance, an honest majority assumption
is necessary to prove that Proof of Work (which is what Bitcoin uses) provides users with
safety and liveness. Safety is the property that once a transaction has entered a confirmed
block, it cannot be evicted later (with high probability). Liveness is the property that the
4network can continually take new transactions and that the time from when a user submits
a transaction to when it is confirmed is bounded.
One common feature to many consensus protocols is that a single validator holds a
monopoly over the production of block Bi. A randomness beacon is used to select a random
validator Vi ∼ S ∈ ∆V
where V ∈ N is the number of validators and S is a distribution
over locked resources. Once a validator Vi is chosen, they have the right to choose which
transactions T1,...,Tn ∈ T can be included and the order in which those transactions are
included. Most consensus mechanisms, such as Proof of Work or Proof of Stake, have the
probability of a validator Vi being chosen proportional to the amount of resource they locked.
This way, validators who are contributing more to the network’s security are rewarded with
a higher pro-rata portion of network fees and inflation.
2.2 MEV
The temporary monopoly guaranteed to a single validator affords them the opportunity
to include, exclude, or reorder transactions to maximize a validator’s profit. Any strategy
that deviates from ordering transactions by the fees they pay can be viewed as a maximal
extractable value strategy. As noted in [BGR23], the precise definition of MEV can be
somewhat subtle to describe. However, for this paper we will view any strategy that does
not order transactions based on transaction fees and earns a higher expected profit for
validators as an MEV strategy.
The types of strategies that can be employed by validators differs depending on the types
of transactions Ti that are submitted. Some strategies involve adding front-running and
‘back-running’ transactions around user trades in order to allow arbitrage trades to take
advantage of uninformed user flow. This type of MEV has been well-studied and in fact
bounds on social welfare change were calculated in [KDC22].
In this paper, we will focus on MEV that arises from reordering. We assume that there
is a fixed set of transactions T1,...,Tn and a payoff function f(T1,...,Tn) that yields the
payoff to a validator for a particular ordering. We note that we consider the entire amount of
MEV extracted and do not consider the allocation of MEV to validators versus to ‘searchers’,
who are agents who submit orderings to validators and are paid as a function of the excess
profit they generate.
## 2.3 Payoff Functions.
Since we consider a fixed universe of transactions in reordering MEV, we can view the payoff
function for the validator as a function f : Sn → R. Concretely, if we have a function
g : T n
→ R that maps transactions to payoffs, we can define the function f as
f(π) = g(Tπ(1),...,Tπ(n))
One can view the the ordering maxπ∈Sn f(π) as the optimal monopoly profit achievable via
reordering MEV. We will assume that all functions f : Sn → R are positive, f(π) ≥ 0,
5noting that our analysis applies to functions that are bounded below by a constant, f(π) ≥
−c, ∀π ∈ Sn. Before continuing, we will first provide two examples of payoff functions.
Example: Constant function market makers. Suppose that there is a decentralized
exchange, such as a constant function market maker (CFMM) [AC20], that users can tender
assets to for trading. A sandwich attack [ZQT+
21,KDC22] is a type of transaction where a
validator inserts a transaction before a user trade to increase the price ahead of a user trade.
After the execution of the user trade, the validator inserts a trade going in the opposite
direction to generate a profit. This type of front running attack involves three types of
transactions: Fi,∆i,Bi, where Fi is the front-running transaction, Bi is the back-running
transaction, and ∆i is the unsophisticated user trade. Owing to the concavity properties of
a CFMM, one can upper and lower bound the profit of a single sandwich attack via a linear
function of ∆i and the current price pi.
Note that if a validator receives n trades ∆1,...,∆n then the order in which they execute
the sandwich attacks has material impact on their profit. For instance, executing larger size
trade earlier makes the profitability of smaller trades executed later in the ordering higher.
This allows one to write a payoff function of the form
f(π) =
n X
i=1
PNL(∆π(i),pπ(i−1))
where pi is the price tendered after executing ∆i and we abuse notation slightly and interpret
pπ(0) as the initial price from the previous block. This payoff is generally not invariant to
permutations as the price series pi is dependent on the previous set of trades (∆1,...,∆i−1)
and each trade causes positive price impact.
Example: Liquidations. Liquidations are transactions used to clear overindebted posi-
tions in collateralized lending and perpetual protocols within DeFi. Briefly, a user posts qc
units collateral of asset X and borrows qb units of asset Y when the price of X in units of
Y is p0. Suppose the price of X in units of Y at time t is pt. If the price decays such that
qc/pt < qb (e.g. the collateral is worth less than the borrowed asset), then a liquidator can
submit a transaction to the blockchain in which they supply (1 − ǫ)qb units of Y and get qc
units of X back. We call the price threshold p∗
= qc/qb the liquidation price of the position.
Consider a scenario where there are 2k trades ∆i with k trades causing the price to go up
by 1 unit and k trades causing the price to go down by 1 unit. Suppose that the initial price
prior to executing trades ∆i is p0 and that p∗
= p0 − c where c < k. Furthermore, given an
ordering π ∈ Sn define the price pi(π) to be the price after executing ∆π(1),...,∆π(i). Note
that for some permutations π, the liquidation is not possible (e.g. permutations where all of
the trades that move the price up are executed before those that go down) and for others it
is possible. Define the liquidatable set A = {π ∈ Sn : ∃i pi(π) ≤ p0 − c}. Then our payoff
function is
f(π) = 1A(π)
6More generically, as described in [ACDK23], one can utilize liquidations and auctions to
construct payoffs of the form 1B for any B ⊂ Sn. Since any function f(π) can be written as
f(π) =
X
A⊂Sn
ˆ f(A)1A(π)
for some coefficients ˆ f(A) ∈ R, this implies that liquidations can be thought of as generating
a basis for the set of functions f : Sn → R. We will later see that the Fourier transform
directly expands f in a basis like this, allowing us to interpret the Fourier coefficients as a
basis expansion in the ‘liquidation’ basis.
Fairness Functionals. Given a payoff function f : Sn → R, one natural question to ask
is how to measure the fairness of an ordering scheme that generates a set A ⊂ Sn of valid
orderings. To do this, we need to measure some notion of worst and best case payoffs over the
set A. Towards this aim, we first define a global fairness functional as a map Λ : L1
(Sn) → R
which takes a payoff for a set of transactions, and returns a deviation between the maximum
and average case behavior.
The two most natural global fairness functionals are:
Λ̃+
(f) = max
π∈Sn
f(π) −
1
n!
X
π∈Sn
f(π) = kfk∞ −
1
n!
kfk1 = kfk∞ − E[f]
Λ̃⋆
(f) =
maxπ∈Sn f(π)
1
n!
P
π∈Sn
f(π)
=
kfk∞
1
n!
kfk1
=
kfk∞
E[f]
The first functional, Λ̃+
measures the additive difference between the maximum value of the
function f and expected value whereas the latter measures the multiplicative gap. The latter
is similar to a price of anarchy measurement; however, it lacks Lipschitz properties and isn’t
directly related to the graph Laplacian for a Cayley graph of Sn. On the other hand, the
authors of [ACDK23] demonstrate that these properties hold for Λ̃+
.
We can interpret a function that has Λ+
(f) = 0 as perfectly fair in that returning a
random ordering has the same payoff as the best case payoff. On the other hand, note
that E[f] ≥ 1
n!
maxπ∈Sn f(π) so Λ̃+
(f) ≤ maxπ∈A f(π) 1 − 1
n!

. A function f has maximal
unfairness if it saturates this bound, which happens if f = 1π for some π ∈ Sn. We say that
a payoff is asymptotically maximally unfair if maxπ∈A f(π) 1 − 1
n!

−Λ+
(f,A) = Θ 1
n!

We
call perfectly fair functions and asymptotically maximally unfair functions asymptotically
trivial payoffs for A.
We define localized fairness functionals Λ : L1
(Sn) × 2Sn
→ R that are localized to a set
A ⊂ Sn as
Λ+
(f,A) = Λ̃+
(f1A) = max
π∈A
f(π) − E[f1A]
Λ⋆
(f,A) = Λ̃⋆
(f1A) =
maxπ∈A f1A(π)
E[f1A]
7We note that prior work on social welfare guarantees for CFMMs [KDC22] studied Λ̃∗
(f)
and showed that provided sufficient liquidity, Λ̃∗
(f) = Θ(logn).
The remainder of the paper will be dedicated to showing asymptotically non-trivial upper
and lower bounds on Λ+
(f). The lower bounds represent a minimal amount of unfairness
injected by the selection of an ordering set A ⊂ Sn whereas the maximal bounds represent a
non-trivial fairness guarantees. Our results in §3 will show that if |A| is sufficiently ‘large’,
then one can achieve non-trivial fairness guarantees whereas if |A| is too ‘small’ then one
has fairness lower bounds for Λ+
. To define the notion of what a ‘large’ and ‘small’ mean,
we will need to using representation theory to define the concept of the boolean degree of a
function.
We finally note that the bounds we construct actually bound Λ∗
(f,A), which is then
used to bound Λ+
(f,A) since
Λ+
(f,A) = max
π∈A
f(π) − E[f1A] = max
π∈A
f(π)

1 −
E[f1A]
maxπ∈A f(π)

= max
π∈A
f(π)

1 −
1
Λ⋆(f,A)

(1)
## 2.4 Representation Theory and Uncertainty Principles
If one is given black-box access to a payoff function f : Sn → R, how can one figure out
if the maximum and expected values deviate from one another? The liquidation example
of §2.3 noted that any payoff function f : Sn → R can be expanded as a sum of indicator
function. Our goal is to see if there is a small set of permutations that controls the behavior
of the payoff f : Sn → R. For instance, if there is a set A ⊂ Sn with |A| = O(1) such
that f(π) = 1A(π), then there is a large separation between the optimal payoff of 1 and the
average payoff of |A|
n!
= O( 1
n!
). This large separation between maxπ∈Sn f(π) and Eπ∈Sn[f(π)]
is precisely what fairness functionals aim to measure and is completely controlled by |A| for
indicator function payoffs.
Suppose that one could decompose a general payoff f : Sn → R into a sum of indicator
functions on sets A ⊂ Sn, f =
P
A⊂Sn
ˆ f(A)1A and quantify the size of the coefficients | ˆ f(A)|.
This would allow one to take a set of permutations, possibly constructed via a sequencing
rule or auction, and measure the fairness as illustrated by the previous example. The Fourier
Transform over finite groups precisely characterizes how to decompose a function into a basis
of indicator functions and compute these coefficients. In particular, this allows for one to
provide quantitative control over how a particular set of orderings A impacts a fairness
functional as measured by the sizes of set |A| versus the size of their coefficients.
Fourier-Walsh Transform and boolean degree. If f were a boolean function, f :
{−1,1}n
→ R, then the expansion f(x) =
P
A⊂[n]
ˆ f(A)1A(x) where 1A(x) is one is xi = 1
for all i ∈ A is known as the Fourier-Walsh transform [O’D14]. One can view this as a discrete
analogue of the classical Fourier transform for discrete spaces. We will first describe some
properties of the Fourier-Walsh transform over boolean functions {−1,1}n
before moving to
8functions f : Sn → R. The boolean case is easier to understand and will provide intuition
for what we can expect in the symmetric group case.
Using the Fourier-Walsh transform, one can prove statements that tie the global behavior
of the function f to properties about the sets A that it is supported on. For instance, if
f is a voting rule where each xi is a vote for one of two candidates and the output is an
aggregate vote (such as majority or weighted majority vote), then the sets A ⊂ {−1,1}n
with
large values of ˆ f(A) control the outcome. Classical results in voting theory such as Arrow’s
impossibility theorem can be made quantitative via looking at them via their Fourier-Walsh
transform. If i ∈ A for all A with ˆ f(A) 6= 0, then we say that i is a dictator. One can show
that if f is monotone and unanimous, there exists i such that i ∈ A for any A with ˆ f(A) 6= 0
(i.e. there is a dictator, see [O’D14, §2.5] for a precise statement).
Note that the Fourier-Walsh transform inversely relates the size of a set A to its influence
on f. To see this, suppose A ⊂ [n] is such that |A| = 2. Then there are 2n−2
vectors v in
{−1,1}n
such that 1A(v) = 1. One can generalize this and show that the logarithm of the
support of the function 1A is equal to n−|A|. Thus if there is a small set |A| that has a large
Fourier coefficient ˆ f(A), then a small subset of elements influence the outcome of ˆ f(A).
We can thus interpret the relationship between |A| and the magnitude of ˆ f(A) as repre-
senting how ‘flat’ or ‘sharp’ the function f is. Moreover, we have the Plancharel theorem for
the Fourier-Walsh transform, just as we do for real-valued functions:
X
x∈{−1,1}n
|f(x)|2
=
X
A⊂[n]
| ˆ f(A)|2
This means that if some small collection of sets A ⊂ [n] has more than (1 − ǫ) of the norm
of f, then the function is ‘essentially’ controlled by a small group of variables.
For such an expansion, we define the boolean degree, deg(f), as
deg(f) = max{|A| : A ⊂ {−1,1}n
,| ˆ f(A)| > 0}
Intuitively, the degree of a function measures the size of the largest subset that controls
function behavior. We can also restrict a function to its low degree set. For any t ∈ [n], we
define the degree-t restriction f≤t
(x) as
f≤t
(x) =
X
A⊂{−1,1}n
|A|≤t
ˆ f(A)1A(x)
and define the complement f>t
= f − f≤t
. Note that by definition, deg(f≤t
) ≤ t. Our
notions of ‘large’ and ‘small’ sets for the bounds in §3 will be defined based on deg(f)
Fourier Analysis of the Symmetric Group A similar expansion exists for the symmet-
ric group Sn, although it is significantly more complex and involved. Since the symmetric
group is non-abelian — πσ 6= σπ for two permutations π,σ ∈ Sn — indicator functions
become matrices. Instead of having indictator functions 1A : {−1,1}n
→ R, one has repre-
sentations ρ : Sn → GL(V d
), where GL(V d
) is the set of invertible matrices on a vector space
9of dimension d. For brevity, we will ignore most of the algebraic properties of representation
theory and present the bare minimum to understand the proofs of §3. The interested reader
can see the textbooks [DGK83,Sag13] for a full treatment.
A representation of a finite group G is a map ρ : G → GL(V d
), where d is the dimension
of a representation. Two representations ρ1 : G → GL(V d1
), ρ2 : G → GL(V d2
) can be
summed as ρ = ρ1 ⊕ρ2 which is a matrix in GL(V d1+d2
). A representation ρ is irreducible if
there exist no representations ρ1,ρ2 such that ρ = ρ1 ⊕ρ2. It is a fact that finite groups have
a finite number irreducible representations ρ1,...,ρk and they always satisfy the formula
k X
i=1
dim(ρi)2
= |G|
Representations will serve as the analogues of indicator functions1
for non-abelian groups.
Given a set of irreducible representations ρ1,...,ρk for Sn one defines the Fourier trans-
form ˆ f of a function f : Sn → R to be:
ˆ f(ρ) =
X
π∈Sn
f(π)ρ(π)
Note that this is a sum of matrices and hence ˆ f(ρ) ∈ GL(V dim(ρ)
). Given the Fourier
transform ˆ f(ρ) one can invert the function f via the inversion formula [Dia88],
f(π) =
1
n!
k X
i=1
dim(ρi)Tr[ ˆ f(ρi)ρi(π)]
Similarly to the boolean case, we have a version of the Plancherel theorem,
kfk2 =
1
n!
k X
i=1
dim(ρi)Tr[ ˆ f(ρi)∗ ˆ f(ρi)]
In order to define an analogue of the boolean degree, we will need to have a more concrete
definition of the irreducible representations of Sn. Note that the set of partitions of [n],
λ1 ≥ λ2 ≥ ··· ≥ λk such that
P
i λi = n, describes the set of irreducible representations of
Sn. This is because every permutation can be decomposed into a product of cycles C1 ···Ck
that partition n and such that elements transposed by Ci are not ever transposed with Cj
for i 6= j. To signify that a vector λ is a partition of [n], we use the standard notation λ ⊢ n.
We can write expand the function via the inverse Fourier transform as
f(π) =
1
n!
X
λ⊢n
dλ Tr[ ˆ f(ρλ
)ρλ
(π)] =
1
n!
X
λ⊢n
dλf=λ
(π)
It turns out that each partition λ ⊢ n defines a set of functions invariant under permuta-
tions whose cycle decomposition is λ. This set, called the Specht module [Sag13] Sλ
, allows
1
The indicator functions in the boolean case are a special case of characters of a finite abelian group
10one to decompose L1
(Sn) =
L
λ⊢n Sλ
. Thus the sum above represents the projection of f
to each Specht module. We are now in a position to define the boolean degree of a function
f [FKLM20]:
deg(f) = min{n − λ1 : λ ⊢ n,|f=λ
| > 0} (2)
Intuitively, this degree measures the total entropy of the function outside of the largest
component and we refer the interested reader to [FKLM20] for more details on how why this
is the correct analogue of boolean degree for the symmetric group.
As a concrete example of functions of a particular degree, we introduce the k-juntas [FKLM20].
The set of k-juntas Jk,n are linear combinations of products of indicator functions on k unique
transpositions, i.e.
Jk,n =

 
 
X
T={(i1,j1)···(ik,jk)}∈(n
k)
2
aT
k Y
ℓ=1
1π(iℓ)=jℓ

 
 
The k-juntas have degree k and span the set of all degree-k functions.
Our results in §3 will compare the size of A ⊂ Sn to deg(f). If a particular monotone
function of |A| is smaller than deg(f), then we will show fairness functional lower bounds.
We will show the opposite if the same function of |A| is greater than deg(f).
Uncertainty Principles. One important property that relates functions and their Fourier
transforms are uncertainty principles. Given a function f and a Fourier transform ˆ f, these
principles state that both f and ˆ f cannot be ‘localized’ simulataneously beyond a point. For
instance, the classical Heisenberg uncertainty principle says that Var(f)Var( ˆ f) ≥ c for a
real function f : R → R. One can also view these as saying that if f is concentrated on
a small set S of values then ˆ f cannot be concentrated on a set of values more than some
decreasing function of µ(S) for Lebesgue measure µ.
There exist uncertainty principles for finite groups as well and the following recent result
of Kuperberg (first described in [WW21]) provides a direct connection to the L1
and L∞
norms of a function f and its Fourier transform ˆ f:
Theorem 1 (Kuperberg, Wigderson, Wigderson [WW21]). Let G be a finite group and con-
sider f : G → R. Let ρi : G → Vi be a complete set of (complex) irreducible representations
for G. Then we have
kfk1
kfk∞
k ˆ fk
(S)
1
k ˆ fk
(S)
∞
≥ |G| (3)
where kAk
(S)
p = Tr[(A∗
A)p/2
]1/p
is the Schatten p-norm of a matrix A
If G = Sn, then this states that
kfk1
kfk∞
k ˆ fk
(S)
1
k ˆ fk
(S)
∞
≥ n! =⇒
1
Λ̃⋆(f)
=
1
n!
kfk1
kfk∞
≥
k ˆ fk
(S)
∞
k ˆ fk
(S)
1
Therefore, uncertainty principles immediately furnish upper bounds on Λ̃⋆
which correspond
to upper bounds on Λ̃+
via (1).
112.5 t-intersecting sets of permutations
In order to formally define the notions of ‘small’ and ‘large’ sets |A| for a payoff, we need
to consider the amount of overlap between elements of A. One can informally think of a
measure overlap of elements of A as the number of points i that are moved to a point j
by permutations in A. Formally, a set A ⊂ Sn is t-intersecting if for all π,π′
∈ A, there
exist t-pairs (i1,j1),...,(it,jt) such that π(ik) = π′
(ik) = jk. Note that the sets of pairs of
elements of [n] can vary for different pairs of permutations π,π′
∈ A.
It was recently shown that sufficiently large t-intersecting sets of permutations A have
their size bounded by (n − t)! [KLMS23, Thm. 1] We claim that this result implies that
indicator functions 1A for such sets A have degree that is always larger than t [KLMS23, Thm.
1]. This means that we can view restrictions of functions to t-intersecting sets as a form
of ‘bandlimiting’ in that it restricts the cycle types of permutations that can have a large
Fourier coefficient. We formalize this claim as follows:
Claim 1. Suppose A ⊂ Sn is a t-intersecting set of permutations such that c0t ≤ n where
c0 is the universal constant of [KLMS23, Thm. 1]. If |A| = Ω((n − t)!) then deg(1A) ≥ t.
The proof is a simple corollary of [KLMS23, Thm. 1] but is very important for our
proofs in §3. In particular, this ensures that if deg(f) ≥ deg(1A) then there are Fourier
terms summing over partitions λ ⊢ n with λ1 ∈ [n−t,n−deg(f)] that can potentially have
very high unfairness (as measured via Λ+
).
Relationship to Fair Ordering. These sets of permutations are natural in that they often
occur within ordering algorithms and MEV. Fair ordering protocols [KDL+
21,RG23] work by
having validators come to consensus on a particular directed graph G. Provided there is at
least an honest majority, the validators of the network can take any valid topological sort of
G and return it as a valid ordering. As noted by [RG23], the graphs constructed are relatively
simple. The graph G has a vertex set equal to the set of transactions, V = {T1,...,Tn} and
weighted directed edges (Ti,Tj) with weight equal to the number of validators who say that
Ti arrived before Tj.
However, such topological sorts are still subject to the standard impossibility theorems
of social choice theory. For instance, the Condorcet paradox can still arise in such orderings,
where the set of topological sorts contains Ti > Tj,Tj > Tk,Tk > Ti. This leads to the
existence of cycles that are conserved within the set A of valid topological sorts of G. In
particular, there exists a minimal t ∈ [n] such that set of sorts is t-intersecting with t < n
when there exist Condorcet cycles.
It is natural that there the set of topological sorts is t-intersecting in that there are
likely transactions that all validators received before other transactions. In fact, the set of
topological sorts is only 0-intersecting if there are no edges or if all edges have exactly 50/50
splits on validators’ votes on transaction order precedence. As such, we can view the results
of §3 as placing bounds on the ‘fairness’ of fair ordering (as measured by fairness functionals)
for particular payoff functions.
123 Main Results
We have two results on fairness: an upper bound on unfairness if the set A is t-intersecting
and t is more than the degree of f and a lower bound otherwise. One can view these as
analogues of Nyquist-Shannon sampling theorems in that one needs to have a sufficiently
small set of permutations to resolve high degree modes.
Upper Bound. Our upper bound result shows that if the set of permutations has high
pairwise overlap, then one gets an upper bound that is asymptotically less than the trivial
upper bound of 1 − 1
n!

kfk∞.
Claim 2. Suppose that A ⊂ Sn is a t-intersecting set of valid orderings and f : Sn → R is
an admissible payoff function. Then if t ≥ deg(f) there exists constants C > 0,c > 1 such
that
Λ+
(f,A) = kf1Ak∞ −
1
n!
kf1Ak1 ≤ 1 −
C
n
s
2
c
√
ss!
!
kf1Ak∞ (4)
where s = deg(f)
We note that this is an asymptotically non-trivial upper bound, as n
s
2
c
√
s
s! = O(n2s
c
√
s
s!) =
o(n!) if s = o(n). The proof of claim 2 relies on the uncertainty principle for finite groups,
Theorem 1.
We will sketch how this theorem provide us an upper bound here but leave the full proof
to Appendix B. Let k(n,s) = k ˆ fk
(S)
∞
k ˆ fk
(S)
1
and note that the t dependence will drop out due to
t ≥ s. Then Equation (3) implies that
kfk1
kfk∞
≥ |G|k(n,s) = n! · k(n,s)
Dividing by n! yields
E[f]
kfk∞
≥ k(n,s)
which implies that −E[f] ≤ −k(n,s)kfk∞ so that we have
kfk∞ − E[f] ≤ (1 − k(n,s))kfk∞
The remainder of the proof (see Appendix B involves using facts from representation theory
and the fact that f = f≤s
and t ≥ s to show that k(n,s) has the form of (4).
Lower Bound. On the other hand, the lower bound states that if the set of permutations
does not have sufficient overlap (relative to the degree of f), then there is always a large
amount of unfairness (as measured by Λ+
).
13Claim 3. Let A be a t-intersecting set A ⊂ Sn with |A| = Ω((n − t)!) and f : Sn → R be a
payoff. If t < deg(f), there exists c,c′
> 0,l ∈ [t,s] such that
Λ+
(f,A) = kf1Ak∞ −
1
n!
kf1Ak1 ≥

1 −
c′
(s − t − 1)
(n − t)!

kf1Ak∞ (5)
Note that the assumption of |A| = Ω((n − t)!) is non-trivial. It is clear than one can
have arbitrarily small t-intersecting sets (e.g. size 2), but we note that if |A| = Ω((n − t)!)
then [KLMS23] demonstrated that there exist (i1,j1),...,(it,jt) such that for all π ∈ A,
π(ik) = jk. This has implications for fair ordering in that fair ordering protocols attempt to
have agreement on a maximal set of elements (i.e. want the t-intersecting property to hold
for t = Ω(n)) yet also need sufficiently large sets A to achieve agreement.
The proof of Claim 3 utilizes the fact that the partitions of [n] also furnish a decomposition
of the function space L1
(Sn) into a series of subspaces Vi. We project the payoff onto each
subspace Vi and then use bounds on the eigenvalues of a particular random walk on Vi,
inspired by similar techniques used in [FKLM20]. We note that the representation theory
utilized is relatively minimal and an open question is whether one can prove (or improve)
these bounds via purely combinatorial means.
Examples. As a concrete example of the bound, consider f = 1B with B t-intersecting
and |B| = Ω(n−t)!) and A such that |A∩B| = 1. If A is t-intesecting and |A| = Ω((n−t)!)
then deg1B = deg1A and the upper bound satisfies
Λ+
(f,A) ≤ 1 −
C
n
t
2
c
√
tt!
≤ 1 −
C
ntc
√
tt!
If t = o(n), this is asymptotically non-trivial.
Next, suppose that A is such that deg(1A) < deg(1B). For instance, suppose that A is a
linear combination of k-juntas and B is a linear combination of m-juntas with k < m. Our
lower bound states that for this case, we have
Λ+
(f,A) ≥

1 −
c′
(m − k − 1)
(n − k)!

If m ≫ k and k = o(1), this shows that the deviation is very large. We are effectively taking
advantage of the fact that the support of an element that is a k-juntas is generically larger
than the support of a m-junta, so the average over a k-junta’s support set will be smaller
than the maximum, as the maxima is contained in A ∩ B.
## 3.1 Implications for MEV
The upper bound of Claim 2 can be interpreted as stating that random selection of a payoff,
by first drawing π ∼ Unif(A) and then realizing f(π), can achieve some constant fraction
of the maximal MEV revenue. On the other hand, the lower bound states that the random
14sampling procedure cannot provide a non-trivial constant approximation of the maximal
payoff if t < s. The key here is that the permutations in A agree sufficiently (measured by
the t-intersection property relative to the complexity of the function f, measured by s). As
mentioned earlier, we also claim that this can be thought of as a Nyquist-Shannon sampling
limit for MEV.
To see this, note that we view the Fourier decomposition of f : Sn → R as having ‘low
frequency modes’ corresponding to payoffs returns to sets of permutations that don’t have
a large overlap and ‘high frequency modes’ as payoffs returning to sets of permutations that
overlap substantially. The bounds of the claims state that one needs sets of permutations
that have sufficient overlap to realize optimal payoffs for high-degree payoff functions.
As we illustrated via our examples, CFMMs and AMMs realize low-degree payoffs, so
they don’t need complex sequencing rules to achieve high welfare. This matches the results
of [XFP23], where it is demonstrated that simple sequencing rules can reduce sandwich
attack profitability. On the other hand, liquidations in DeFi protocols can have very high-
degree payoffs as they represent arbitrary indicator functions on sets A ⊂ Sn. This means
that random orderings impact liquidations much more and that sequencing rules to preserve
different notions of fairness for liquidations much be sufficiently complex.
Our results suggest strongly that consensus enforced ordering rules need to be constructed
on an application-level basis. Each application can be viewed as represented by a payoff
f : Sn → R and the boolean degree of f controls the complexity of sequence rules needed.
## 3.2 Implications for Fair Ordering
As mentioned in §2.5, most fair ordering protocols generate t-intersecting sets of permuta-
tions. Our results suggest that fair ordering protocols that only guarantee t = o(n) are likely
to cause increased unfairness for payoff functions f with deg(f) = Ω(n). This intuitively
makes sense as there can be up to O n
t

Condorcet cycles in such cases and most of these
cycles may avoid particular low payoff permutations. On the other hand, the upper bounds
of Claim 2 suggest that if fair ordering protocols (or general sequencing rules, such as those
of [XFP23]) are able to consistently generate high intersection numbers (e.g. t = Θ(n)), then
they are fair for ‘most’ payoff functions.
## 4 Conclusion
In this paper, we construct a generic model for analyzing MEV under reordering. We first
formulated the problem as a discrete harmonic analysis problem on payoffs f : Sn → R.
We then used Fourier analytic tools to relate the overlap properties of sets of permutations
to different measures of fairness of f. We demonstrate that if the sets of permutations
do not overlap sufficiently for the payoff function f, then one can inure worse unfairness.
On the other hand, we showed that with sufficient overlap, the unfairness can be reduced
asymptotically.
15This suggests extending the works of [KDC22, XFP23], which shows that simple se-
quencing rules for constant function market makers (CFMMs) can provide better fairness
properties. Since CFMMs have relatively simple and smooth payoff functions, they tend
to have low-degree Fourier spectra. On the other hand, liquidations within DeFi can have
arbitrarily high-degree Fourier expansions. This implies that sequencing rules need to be
tailored to the applications that they are used with.
From a pure mathematical perspective, it is likely that our bounds can be improved. We
note that our theoretical bounds can be improved using techniques such as those of [EFP11,
KLMS23] for analyzing t-intersecting permutations on particular Cayley graphs. Moreover,
there is a close connection between the eigenvalue bounds used in the proof of Claim 3 and
the Aldous ordering conjecture [AK13]. The Aldous ordering conjecture effectively states
that the eigenvalues of particular representations can be bounded and/or totally ordered
by ‘simple’ representations. We suspect that resolutions to higher order Aldous ordering
conjectures will provide much stronger versions of Claim 3.
Finally, we note that one can extend our results to censorship MEV, related to the
addition or censoring of particular transactions. As the Young tableaux have natural de-
compositions into lower dimensional representations of n, one can effectively project the
non-zero coefficients down to representations that are product representations. For instance,
if we have a maximum of n transactions in a block (e.g. maximum gas limit) then we can
consider all of the decompositions λ ⊢ n and then consider the fairness functional as a func-
tion f : Sλ1 × ··· × Sλk
→ R. However, this exponentially increases the complexity of the
analysis since one has to look at the payoff function over all such decompositions.
## 5 Acknowledgments
The author would like to thank Kshitij Kulkarni, Guillermo Angeris, Peteris Erins, and
Matheus V. X. Ferreira for helpful comments and suggestions.
References
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function
market makers. In Proceedings of the 2nd ACM Conference on Advances in
Financial Technologies, pages 80–91, 2020.
[ACDK23] Guillermo Angeris, Tarun Chitra, Theo Diamandis, and Kshitij Kulkarni. The
specter (and spectra) of miner extractable value. preprint on Github, August
2023.
[AK13] Gil Alon and Gady Kozma. Ordering the representations of using the interchange
process. Canadian Mathematical Bulletin, 56(1):13–30, 2013.
16[BGR23] Maryam Bahrani, Pranav Garimidi, and Tim Roughgarden. Transaction fee
mechanism design with active block producers. arXiv preprint arXiv:2307.01686,
2023.
[CAE22] Tarun Chitra, Guillermo Angeris, and Alex Evans. Differential privacy in con-
stant function market makers. In International Conference on Financial Cryp-
tography and Data Security, pages 149–178. Springer, 2022.
[DGK83] Persi Diaconis, RL Graham, and William M Kantor. The mathematics of perfect
shuffles. Advances in applied mathematics, 4(2):175–196, 1983.
[DGK+
20] Philip Daian, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan Zhao, Iddo Ben-
tov, Lorenz Breidenbach, and Ari Juels. Flash boys 2.0: Frontrunning in decen-
tralized exchanges, miner extractable value, and consensus instability. In 2020
IEEE Symposium on Security and Privacy (SP), pages 910–927. IEEE, 2020.
[Dia88] Persi Diaconis. Group representations in probability and statistics. Lecture notes-
monograph series, 11:i–192, 1988.
[EFP11] David Ellis, Ehud Friedgut, and Haran Pilpel. Intersecting families of permuta-
tions. Journal of the American Mathematical Society, 24(3):649–682, 2011.
[FKLM20] Yuval Filmus, Guy Kindler, Noam Lifshitz, and Dor Minzer. Hypercontractivity
on the symmetric group. arXiv preprint arXiv:2009.05503, 2020.
[KDC22] Kshitij Kulkarni, Theo Diamandis, and Tarun Chitra. Towards a theory of
maximal extractable value i: Constant function market makers. arXiv preprint
arXiv:2207.11835, 2022.
[KDK22] Mahimna Kelkar, Soubhik Deb, and Sreeram Kannan. Order-fair consensus in
the permissionless setting. In Proceedings of the 9th ACM on ASIA Public-Key
Cryptography Workshop, pages 3–14, 2022.
[KDL+
21] Mahimna Kelkar, Soubhik Deb, Sishan Long, Ari Juels, and Sreeram Kannan.
Themis: Fast, strong order-fairness in byzantine consensus. Cryptology ePrint
Archive, 2021.
[KLMS23] Nathan Keller, Noam Lifshitz, Dor Minzer, and Ohad Sheinfeld. On t-intersecting
families of permutations. arXiv preprint arXiv:2303.15755, 2023.
[O’D14] Ryan O’Donnell. Analysis of boolean functions. Cambridge University Press,
2014.
[RG23] Geoffrey Ramseyer and Ashish Goel. Fair ordering via social choice theory. arXiv
preprint arXiv:2304.02730, 2023.
17[Sag13] Bruce E Sagan. The symmetric group: representations, combinatorial algorithms,
and symmetric functions, volume 203. Springer Science & Business Media, 2013.
[Shi23] Elaine Shi. Foundations of distributed consensus and blockchains (book
manuscript)(2020). https://www.distributedconsensus.net, 2023.
[Tit23] Titan. Builder dominance and searcher dependence, June 2023.
[VK23] Mohammad Amin Vafadar and Majid Khabbazian. Condorcet attack against
fair transaction ordering. arXiv preprint arXiv:2306.15743, 2023.
[WW21] Avi Wigderson and Yuval Wigderson. The uncertainty principle: variations on
a theme. Bulletin of the American Mathematical Society, 58(2):225–261, 2021.
[WZD+
23] Sarisht Wadhwa, Luca Zanolini, Francesco D’Amato, Aditya Asgaonkar, Fan
Zhang, and Kartik Nayak. Breaking the chains of rationality: Understanding
the limitations to and obtaining order policy enforcement. Cryptology ePrint
Archive, 2023.
[XFP23] Matheus Venturyne Xavier Ferreira and David C Parkes. Credible decentralized
exchange design via verifiable sequencing rules. In Proceedings of the 55th Annual
ACM Symposium on Theory of Computing, pages 723–736, 2023.
[ZQT+
21] Liyi Zhou, Kaihua Qin, Christof Ferreira Torres, Duc V Le, and Arthur Ger-
vais. High-frequency trading on decentralized on-chain exchanges. In 2021 IEEE
Symposium on Security and Privacy (SP), pages 428–445. IEEE, 2021.
A Proof of Claim 1
Recall that [KLMS23, Thm. 1] proves that if |A| = Ω((n − t)!) and c0t ≤ n, then there
exists i1,...,it such that π(ik) = π′
(ik) for all π,π′
∈ A. Let π ∈ A and suppose that the
cycle decomposition of A is A = C1 ···Cℓ. If each ik is in a different cycle Cℓ, then ℓ ≥ t.
This is because disjoint cycles don’t have overlapping elements and so the Young tableaux
has at least t boxes as one goes downwards. This implies that λ1 ≤ n−t which implies that
deg(1A) ≥ t.
B Proof of Claim 2
The majority of this proof relies on bounding k(n,s), as defined in §3. By definition, we
have k(n,s) =
k ˆ fk
(S)
1
k ˆ fk
(S)
∞
. Recall that ˆ f takes in an irreducible representation ρ of G and outputs
a linear operator over the same domain as ρ. In particular, we have
ˆ f(ρ) =
X
π∈Sn
f(π)ρ(π)
18Furthermore, recall that the irreducible representations of Sn are classified by the Young
tableaux λ = (λ1,...,λk), λ1 ≥ λ2 ≥ ··· ≥ λk that are partitions of n (i.e.
P
i λi = n). We
will denote an irreducible representation of Sn by ρλ
: Sn → V λ
where dλ = dimV λ
. For a
matrix A, we will denote its singular values as µ1(A) ≥ ... ≥ µd(A). This means that we
can write the Schatten p-norm of a matrix A as
kAk(S)
p = Tr[(A∗
A)p/2
]1/p
=
d X
i=1
|µi(A)|p
!1/p
Using this definition of the Schatten p-norm and the fact that ˆ f is only supported on parti-
tions with λ1 ≥ n − s, we have
k ˆ f(ρλ
)k
(S)
1 =
X
λ⊢n
λ1≥n−s
dλ
dλ X
i=1
|µi( ˆ f(ρλ
))|
k ˆ f(ρλ
)k(S)
∞ = max
i∈[dλ]
|µi( ˆ f(ρλ
))|
Since t ≥ s, we have n− t ≤ n − s so that this expression makes sense for π ∈ A. Now note
the following upper bound:
k ˆ f(ρλ
)k
(S)
1
k ˆ f(ρλ)k
(S)
∞
=
P
λ⊢n
λ1≥n−s
dλ
Pdλ
i=1 |µi( ˆ f(ρλ
))|
maxi∈[dλ] |µi( ˆ f(ρλ))|
=
X
λ⊢n
λ1≥n−s
dλ
dλ X
i=1
|µi( ˆ f(ρλ
))|
maxi∈[dλ] |µi( ˆ f(ρλ))|
≤
X
λ⊢n
λ1≥n−s
d2
λ
One can show an upper bound on dλ of the following form [Dia88, Pg. 136]:
dλ ≤

n
λ1

p
(n − λ1)! (6)
Moreover, the number of partitions λ ⊢ n that have λ1 = n − i is precisely the number of
partitions of i. Recall that number of partitions of k has asymptotics of the form O(k−1
c
√
k
)
for c > 1. Therefore we have
k(n,s) ≤
X
λ⊢n
λ1≥n−s
d2
λ ≤
X
λ⊢n
λ1≥n−s

n
λ1
2
(n − λ1)! ≤ D
s X
i=1
c
√
i
i

n
i
2
i! ≤ Dc
√
s

n
s
2
s!
for some D > 0. This proves the result.
19C Proof of Claim 2
We first provide two key results that we will use to get our final result. The first is a
symmetric group analogue of the so-called ‘second’ Erdös-Ko-Rado theorem.
Theorem 2 ( [KLMS23]). There exists a universal constant c0 > 0 such that for all t ∈ N
and n ≥ c0t and a t-intersecting set A ⊂ Sn, we have |A| ≤ (n − t)!. Moreover, if |A| =
Ω((n − t)!), then there exist (i1,j1),...,(it,jt) such that for all π ∈ A, π(ik) = jk.
We note that this result was first conjectured in the 1960s and proved by [EFP11] for
t = O(loglogn). The second result required comes from [FKLM20, §7]. Recall that a
symmetric set F ⊂ Sn is a subset such that if π ∈ F then π−1
∈ F. Given a symmetric
set, we can construct the Cayley graph G = (Sn,E) on Sn where π,π′
are connected by an
edge (i.e. (π,π′
) ∈ E) if there exists π′′
∈ F such that π = π′′
◦ π′
. Let TF be the adjacency
matrix of the this graph given a symmetric set F. A simple result ( [FKLM20, Claim 7.5])
is that TF maps the space of functions V λ
to itself. Note, that TF as an adjacency matrix
can be lifted to an operator on functions f : Sn → R such that
TF (f(π)) = E
(π,σ)∈E
[f(σ)]
The eigenvalues of T∗
F TF , µλ, for each λ ⊢ n satisfy [FKLM20, Claim 7.6]
µλ ≤
n!
|F|dim(λ)
(7)
Now we are ready to prove the claim. Let Â = A ∪ {a−1
: a ∈ A} be the symmetrized
version of A. Note that TÂ = 1
2
(TA + Tt
A). Let g = (f≤s
)≥t
= f − f≤t
. Firstly, note the
following elementary inequality due to Claim 1
kg1Ak1 ≤ kg1Ak∞k1≤t
A − 1≥s
A k1
The comes from factoring out the maximal term when writing out the 1-norm and the fact
that g is only supported on λ with λ1 ∈ [n − s,n − t − 1]. We claim that
k1≤s
A − 1≥t
A k1 ≤
X
λ⊢n
λ1∈[n−s,n−t−1]
µλ
where µλ are the eigenvalues of TÂ. Recall that TF V =λ
⊆ V =λ
so if we write out
(1≤s
A − 1≥t
A )(π) =
X
λ⊢n
λ1∈[n−s,n−t−1]
1=λ
A
which then implies that
kT∗
Â
TÂ(1≤s
A −1≥t
A )k1 = k
X
λ⊢n
λ1∈[n−s,n−t−1]
T∗
Â
TÂ1=λ
A k1 ≤
X
λ⊢n
λ1∈[n−s,n−t−1]
kT∗
Â
TÂ1=λ
A k1 =
X
λ⊢n
λ2∈[n−s,n−t−1]
µλ
20Note that kT∗
Â
TÂ(1≤s
A −1≥t
A )k1 ≥ k1≤s
A −1≥t
A k1 since TÂ is non-contractive by (7). Now note
that by assumption, |A| ≥ C(n − t)! so that µλ ≤ (n)t
dim(λ)
. Note that via the hook length
formula, dim(λ) ≥ cn
for some c > 1. This gives us the final bound:
kg1Ak1 ≤ kg1Ak∞k1≤t
A − 1≥s
A k1 ≤ kg1Ak∞
X
λ⊢n
λ2∈[n−s,n−t−1]
µλ
≤ kg1Ak∞
X
λ⊢n
λ1∈[n−s,n−t−1]
(n)t
cn
= kg1Ak∞(n)t



X
λ⊢n
λ1∈[n−s,n−t−1]
1
cn



= kg1Ak∞(n)t
s X
i=t+1
c
√
i
s
1
cn
!
We note that since icn
≥ c
√
i
for i ∈ [n] the sum is bounded by D(s − t − 1) for a constant
D ≥ 0. Thus we have:
E[g1A] =
1
n!
kg1Ak1 ≤
kg1Ak∞(n)t
n!
D(s − t − 1)
as claimed
21