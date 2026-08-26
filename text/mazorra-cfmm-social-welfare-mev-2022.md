---
sha256: abfb9730322e72fabd440647a517d2d366ce904d547eb54975592d0427973442
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 33969
---
Constant Function Market Making, Social Welfare and Maximal
Extractable Value∗
Bruno Mazorra1 and Nicolás Della Penna2
1Universitat Pompeu Fabra
2Amurado Research
November 24, 2022
Abstract
We consider the social welfare that can be facilitated by a constant function market maker (CFMM).
When there is sufficient liquidity available to the CFMM, it can approximate the optimal social welfare
when all users transactions are executed. When one of the agent has the role of proposing the block, and
blockspace is scarce, they can obtain higher expected utility than otherwise identical agents. This gives
a lower bound on the maximal extractable value exposed when blockspace is scarce.
## 1 Introduction
Constant function market makers (CFMMs) are one of the leading application of distributed consensus
systems. These markets accurately report prices under the existence of off-chain markets and non-arbitrage
condition [2]. In this paper, we explore the properties of the CFMM to aproximate Walrassian Equilibrium
prices when players act sequentially with Walrasian demands. Moreover, we study welfare in a model
exchange economy with random trader endowments, similar to that of [4] use to study automated market
makers (AMMs) for securities with binary payoffs, motivated by prediction markets. We show that if the
liquidity available to the CFMM asymptotically increases relative to the wealth of the traders arriving in a
single period, it can approximate the optimal social welfare when all users transactions are executed. When
one of the agent plays the role of proposing a block, and thus has the ability to censor transactions, they
can obtain higher utility than otherwise identical agents when blockspace is scarce relative to transactions.
## 2 Preliminaries
## 2.1 Welfare in Walrasian equilibrium
Assume that all players share the same concave utility function U ∶ Rl
+ → R. Each player have a vector of
endowments ∆ ∈ Rl
+ drawn from a distribution D. All players are utility maximizing price takers, thus given
the price of endowments is p, a player with endowment ∆ solves:
max
∆′
U(∆′
)
s.t. p⋅∆ = p⋅∆′
.
We denote by ζ(∆,p) the ∆′
that optimizes the problem and by z(∆,p) ∶= ζ(∆,p)−∆. Then the Walrasian
equilibrium price is defined as a price vector p⋆
such that
E∆∼D[z(∆,p⋆
)] = 0.
∗Work in progess.
1
arXiv:2211.07220v2 [cs.GT] 23 Nov 2022By Arrow-Debreu [7], we have that if U is strictly increasing, convex and the support of the endowments is
bounded, then the Walrasian equilibrium exist. In this paper, we will constrain to the exchange economies
with a unique Walrasian equilibrium. For a given set of endowments and a utility function U, the social
welfare in this game is defined as Wf(D,U) ∶= E∆∼D[ζ(∆,p⋆
)].
Now, assume that the number of player instances is a finite number n. In this case, in order to find the
Pareto optimal allocation, we will do the following. Consider a case with traders I = {1,...,n} and assets
T = {1,...,l}. Each player, has a preference over the assets modeled by a utility function U ∶ Rl
+ → R and is
endowed with a non-negative vector of l goods ∆i
= (∆i
1,...,∆i
l) drawn from the distribution D. Altogether,
E = (I,T,U,∆ = {∆i
}i) defines an exchange economy.
Without assuming inventory or storage (such as that of an AMM), the first requirement is that the assignment
of goods to individuals not exceed the amounts available. We define the allocation of assets as a vector
x = (x1
,...,xn
) where xi
= (xi
1,...,xi
l) denotes trader i′
s bundle according to the allocation. The set of
feasible allocation is defined as
F(∆) = {(x1
,...,xn
) ∶ ∑
i∈I
xi
= ∑
i∈I
∆i
}
and it contains all allocations of goods across individuals that, in total, exhaust the available amount of
every good. Under sufficient good conditions, there exist a Walrasian equilibrium, and we can compute the
Walrasian equilibrium allocations (WEA).
Now let ∆1,....,∆n be i.i.d with distribution D. For each instance of ∆ = (∆1,...,∆n), we can compute
the Walrasian equilibrium price p. And so, the Walrasian equilibrium price p = p(∆1,...,∆) follows a
distribution Xn with supp Xn ⊆ {x ∈ Rl
+ ∶ ∑
l
i=1 xi = 1}. In this paper, we will assume that for a pure exchange
economy with n players and endowment distribution D with bounded support, we have that E[Xn] = p⋆
and
Xn Ð→
n→+∞
p⋆
almost surely.
## 2.2 Constant function market makers
A constant function market maker (CFMM,see [1]) consist of a function C ∶ Rl
+ → R, its reserves R ∈ Rl
+ and
transaction fees parameter γ. The element Ri is the amount of i assets available on the CFMM contract,
while the function C specifies the behavior of the contract. More specifically, if an agent wants to trade with
the CFMM a vector of assets Λ ∈ Rl
if
C(R +(1−γ)Λ) ≥ C(R).
We say that the CFMM has no fees if γ = 0. In this paper, we will assume fee-less CFMM except stated
otherwise. The agents that add and remove liquidity on the CFMM are called liquidity providers. When
adding and removing some reserves by these players, the marginal price of the CFMM can not change, that
is, ∇C(R′
) = ∇C(R), see [2].
Examples 2.1. In the following, we provide an incomplete list of examples of CFMM:
• Uniswap V2 DEX has the CFMM defined as C(x,y) = xy. If the tuple of initial reserves is R = (R0,R1)
and a trader wants to exchange some amount ∆ of tokens X, she obtains g(∆) = −R0R1
R0+∆
+R1.
• Constant sum market makers C(x) = ct
⋅x, for some c ∈ Rl
+.
• Constant geometric mean market maker C(x) = ∏
l
i=1 xwi
i , where w > 0 and 1t
⋅w = 1.
• Constant min market maker C(x) = min{x1,...,xl}. Observe that if a player with strictly increasing
utility function U trades with this market maker will reach a state with reserves of the form (Ri,...,Ri)
for some i.
• Quadratic-over-linear constant market maker C(x,y) = −x2
/y defined in {(x,y) ∶ y > 0}.
• The Minecraft modification package market maker C(x,y) = xey
.
2In this paper, we will not assume that players have a specific utility function. Therefore, we will need to
state the general trade choice problem, similar to the problem stated in [2]. We have a player with
strictly increasing and concave utility function U with initial endowments ∆. Then, a utility maximizing
players that trades with a CFMM with constant function C and reserves R solves the problem
maximize
Λ
U(Λ)
subject to C(R +∆−Λ) ≥ C(R),Λ ≥ 0
This problem is a convex problem, thus we can globally and efficiently solve this problem [2]. It is easy to
show what the solution will satisfy C(R+∆−Λ) = C(R). For a player with utility function U and endowments
∆ and a CFMM with function C and reserves R, we denote the solution of the optimization problem as
ζ(U,∆,C,R) or ζ(∆,R) if U and C are clearly specified. Observe that the solution of the optimization
problem is not necesrly unique and therefore ζ(∆,R) is not specified. However, we will see that in some
conditions, choosing a solution for a specific ∆0,R0 the function ζ can be extended smoothly.
## 2.3 Maximal extractable value
Maximal (also miner) extractable value, or MEV, usually refers to the value that privileged players can
extract by strategically ordering, censoring, and placing transactions in a blockchain. In our context, this
privileged players will be builders or Walrasian auctioneers, i.e. players responsible for constructing the
new block or more generally responsible for allocating the goods an input of endowments and preferences
revealed.
A formal definition of MEV can be seen in [3, 8]. In this paper, we will define the maximal extractable value
as follows.
Definition 2.2. Let P be a builder with utility function UP and endowments ∆. Let M be an allocation
mechanism and T the set of transactions received by the builder. Then, we define the Walrasian MEV as
maximize
T ′
UP (M(T ′
)P )
subject to T ′
⊆ T
## 3 Constant function market makers with Walrasian demand
In this section, we study the social welfare when players interact with constant function market makers
sequentially. We assume that there exist an exogenous liquidity provider with initial liquidity R0 provided
to a constant function market maker with convex function C ∶ Rl
+ → R. All players share the same utility
function U and the endowments are drawn from a distribution D. Except stated otherwise, we will assume
that C and U are smooth maps.
## 3.1 Model
In each time period t, an agent with endowment ∆t ∼ D and convex, strictly increasing utility function
U ∶ Rl
+ → R trades in the constant function market maker. After a feasible trade Λt, the liquidity is updated
to Rt+1 = Rt +Λ′
t. Assuming that all players are utility maximizing, we have that, at time t the player solves
the general trade choice problem computing ζ(∆t,Rt). For a specific realization of endowments ∆1,...,∆t,
we denote ∆(t) = (∆1,...,∆t).
To define the notion of social welfare and optimal welfare in equilibrium, one need to define a notion of
the equilibrium on the game. One could be tempted to define a generalization of the notion of Walrasian
equilibrium provided in section 2.1. Equivalently, one could say that a reserve R⋆
in the feasible set of a
CFMM with curve C is a Walrasian equilibrium for CFMM if
E∆[z(∆,R⋆
,C)] = 0 (1)
3However, in general, there is no solution R⋆
for the equation 1, see A for counterexample. So, to counterfac-
tual compare different social welfare CFMM, we define the following exchange economy and notion of social
welfare.
Definition 3.1. A CFMM with Walrasian demands (CFMMWD) consists of a tuple G = (R,C,U,D). As
previous described G induces a stochastic process {Rt}t in the topological space {R′
∈ Rl
+ ∶ C(R′
) = C(R)}.
We say that a game G = (R,C,U,D) is non-subsidizing if p⋆
= pa. In general, this equilibrium is not
computable in polynomial time.
Observation: The stochastic process {Rk}k is in fact a Markov process with state space S = {R ∈ Rl
≥0 ∶
C(R) = C(R0)} since a strategic player optimization problem just depends on its utility function, the current
state and hers endowments.
Proposition 3.2. If C ∶ Rl
+ → R is a smooth map with boundaries, then S is a manifold with boundaries.
If C vanishes in the boundaries, then S is a manifold.
Proposition 3.3. Let C and U are smooth and strictly concave functions. Then for a given solution on a
initial tuple (∆0,R0) the function ζ(⋅,⋅) can be extended smoothly on all the domain.
Definition 3.4. A CFMMWD G is complete if the map ϕG ∶ S → ∆n
defined as R ↦ ∇C(R)/∣∣∇C(R)∣∣1
is differentiable, injective, image int(∆l
) and with differential inverse. So, we can define the updating price
stochastic process as
pk+1 = ϕ(ϕ−1
(pk)+ζ(⋅,C,ϕ−1
(pk))). (2)
we denote by p⋆
s ∈ ∆l
the stochastic equilibrium price defined as a solution of
E∆∼D[ϕ(ϕ−1
(p⋆
s)+ζ(∆,C,ϕ−1
(p⋆
s)))] = p⋆
s. (3)
Counterexample: Observe that in general p⋆
s does not exist. For example, consider the CFMM game with
U(x,y) = C(x,y) = xy and D is given by Pr[(∆1,∆2) = (1,0)] = 1. Then, clearly we have that Rk → (0,1)
as k → +∞. Since the image of ϕG is in (0,1), we have that p⋆
s does not exist.
Theorem 3.5. Let G be a complete CFMMWD with p⋆
> 0 and D with bounded support, then p⋆
s exists.
Proposition 3.6. Let D be distribution of endowments, utility function U with unique Walrasian equilib-
rium p⋆
. Let C ∶ Rl
→ R be convex and differentiable function and R ∈ Rl
such that ∇C(R) = p⋆
. Then, it
holds that the sequence of stochastic prices {p⋆
s(λ)}λ∈R≥0 of the CFMMWD Gλ
= (λR,C,U,D) converge to
p⋆
.
## 3.2 Welfare and average price
We define the notion of social welfare in CFMM with Walrasian demands. We will prove that, locally, the
CFMM that provides more social welfare is the constant sum market maker with price p⋆
. However, globally,
we will prove that this is in general not true, leaving as an open question which function C optimizes the
social welfare for a given set of players with endowments D and utility function U.
Definition 3.7. For a CFMMWD, we define the average social welfare as
WF(G) = lim
t→+∞
E∆(t)∼Dt[∑
t
k=1 U(ζ(Rk,∆k,C))]
t
.
We define the average quilibrium price as
pa = lim
t→+∞
E∆(t)∼Dt[∑
t
k=1 ∇C(Rk)/∣∣∇C(Rk)∣∣]
t
.
In general Wf(G) does not need to exist, however there are sufficiently good conditions where this term is
well-defined. Before doing that, we prove that locally the bests CFMM in terms of social welfare (without
subsidizing) is the constant sum market maker with price p⋆
.
4Proposition 3.8. Let R be an initial liquidity, U a concave utility function and ∆ ∈ Rl
+. Let Co(Rl
+,R+)
be the set of all smooth convex functions from Rl
+ to R+. Let p⋆
be the WEP of the one-shoot model with
utility function U and distribution D. Assume that supp z(⋅,p⋆
) ⊆ [0,R]l
. Then,
maxC∈Co(Rl
+,R+)
s.t.∇C(R)=p⋆
U(ζ(∆,R,C)) = U(ζ(∆,p⋆
))
and the curve that is realized is C(v) = v ⋅p⋆
. So, if D a distribution over Rl
+ and supp z(⋅,p⋆
) ⊆ [0,M]l
, for
some M > 0, and R is sufficiently big, we have that:
maxC∈Co(Rl
+,R+)
s.t.∇C(R)=p⋆
E[U(ζ(∆,R,C))] = E[U(ζ(∆,p⋆
))]
As we mentioned, the Wf(G) does not necessarily exist, however, if the Markov process {Rk}k associated
to the CFMM has a unique stationary distribution, then this value is well-defined. Moreover, the average of
utilities not just converges in expectancy but also converges almost surely to Wf(G).
Proposition 3.9 (Existence of Wf). Let G = (R,U,C,D) be a CFMMWD and M = {Rk}k∈N its associated
Markov process. If M has a unique stationary distribution π, and Eπ×D[∣U(ζ(R,∆,C)∣] < +∞ then
Wf(G) =
a.s.
lim
t→+∞
∑
t
k=1 U(ζ(Rk,∆k,C))
t
Now, let’s provide an example of the computation of a Wf(G) for a specific game. Assume that the CFMM
has constant function C(x,y) = x + y and initial liquidity (R1,R2). Assume that the representative agent
has a Cobb-Douglas utility function U(x,y) = xy. The distribution of endowments is given by B(1,1/2)2
.
Each round t, the agent with endowment ∆ = (∆1,∆2) wants to solve
max
∆′
(∆1 +x)(∆2 +y)
s.t. R1 +R2 +x+y = R1 +R2,
R1 +x ≥ 0,R2 +y ≥ 0
Easily, we obtain that if (∆1,∆2) is (0,0) or (∆max,∆max), the agent will not interact with the CFMM
since he is already maximizing his utility function. On the other hand, if (∆1,∆2) = (∆max,0) or (0,∆max),
if possible, the agent will execute the trade, depositing ∆max/2 of one asset and removing ∆max/2 of the
other one. Then the reserves of the CFMM behave as the following Markov chain process:
Rk+1 = Rk +Y
where Y is the random variable with distribution, Pr[Y = (−1/2,1/2)] = 1/4, Pr[Y = (−1/2,1/2)] = 1/4 and
Pr[Y = (0,0)] = 1/2.
Assume that R1,R2 are integers and ∆max = 1. Computing the stationary distribution π, we obtain that
the probability that the Markov process is in the boundary set {(R1 +R2,0),(0,R1 +R2)} is pb = 2/R1 +R2.
By, proposition 3.9 we have that
Wf(G) = (1−
1
R1 +R2
)⋅Welfare of one-shoot (4)
Similar to 3.8 one could think that the constant sum Market Maker provides more social welfare than all
others CFMM, however this is not true.
Theorem 3.10. There exists a utility function U and a distribution of endowments D such that the constant
sum market maker with normal vector p⋆
(i.e. C(x) = p⋆
⋅ x) does not maximize welfare. In other words,
there exist C′
such that Wf(U,R,C′
) > Wf(U,R,C).
5Proposition 3.11. For a D distribution of endowments and utility function U and Walrasian equilibrium
price p⋆
, we have that for all R > 0.
lim
λ→+∞
Wf(Gλ
) = Wf(D,U)
where Gλ
= (λR,C(x) = x⋅p⋆
,U,D).
Proposition 3.12. If the Markov process associated to G have a stationary distribution π, then we have
that the average equilibrium price holds:
ER∼π [
∇C(R)
∣∣∇C(R)∣∣1
] =
a.s
lim
t→+∞
∑
t
k=1 ∇C(Rk)/∣∣∇C(Rk)∣∣1
t
= lim
t→+∞
∑
t
k=1 pk
t
.
Theorem 3.13. Assuming that C is a convex complete CFMM an D is a distribution with bounded support.
Then sequence of average prices of the CFMMWD Gλ
= (λR,C,U,D) converges to p⋆
. In other words, if
the liquidity is sufficiently large, we have that the oracle price of the CFMM converges to the Walrasian
equilibrium price.
The proof of the theorem can be found in the appendix. Now, we will provide an example. Assume that
players have Coubb-douglas utility function and that the distribution of endowments is given by U[0,1]2
.
Then, by symmetry, one can easily prove that pa = p⋆
= (1,1). We simulated the CFMM with Walrasian
demand with Uniswap V2 curvature and t = 2⋅106
. The initial reserves are set (950,1050) and (1000,1000)
respectively.
(a) Reserves heat map (b) Prices and average price
Figure 1: Simulation of CFMM with Walrasian demand (R,C = xy,U = xy,U[0,1]2
) and initial reserves
(1000,1000)
## 4 Maximal extractable value in exchange economy
In this section, we will try to lower bound the MEV in a Walrasian auctioneer mechanism with and without
CFMM. Similar to the section 2.1, we assume that all players have a concave utility function U and the
endowments are drawn from a distribution D. We assume that the players endowments and utility functions
are truthfuly reported to the auctioneer. Assume the existence of a Walrasian auctioneer (in PBS this will
be the builder) responsible for batching the transactions received and compute the Walrasian equilibrium
price p⋆
and the output allocations. However, due to computation limitation per period of time (gas limit
in Blockchain context) the number of transactions that the builder can settle is bounded by some number
N. Moreover, we assume that this player share the same utility function and endowments distribution.
Now, we will lower bound the MEV that the builder can extract in different scenarios. In this context, a
transaction t will be a tuple (U,∆). First, we will assume that there is no bribing and that the probability of
6(a) Reserves heat map (b) Prices and average price
Figure 2: Simulation of CFMM with Walrasian demand (R,C = xy,U = xy,U[0,1]2
) and initial reserves
(900,1111.11)
a non-builder transaction being added is uniformly random. That is, if the builder received M transactions,
then Pr[tx ∈ B] = N
M
.
Builder: In this context, the builder will be the responsible for executing the Walrasian equilibrium pricing
algorithm for a given set of transactions T . We will assume that the builder has the same utility function U
and initial endowments ∆ drawn from the distribution D.
Definition 4.1. We say that the builder is informed if he has access to the transactions T (perfect signal).
We say that a builder is a censorship builder if, for any given set of transactions T , he can choose a
subset of transactions T ′
⊆ T and compute the Walrasian allocation of this subset. We say that a builder
censorship-minimizer if he constructs the Walrasian allocation of any subset with maximal cardinality
bounded by N.
Similarly to [8], we define the MEV as an optimization problem.
Definition 4.2. Let ∆b be the endowments of the builder and T be the set of transactions received. Then,
the MEV of an informed and censorship builder MEV(∆b,T ) is:
max
B
U(xb(B ∪{(U,∆b)})
s.t. B ⊆ T ,∣B∣ ≤ N −1
In the case that the builder minimize censorship, the MEV is defined analogously by adding the constraint
that ∣B∣ = min{∣T ∣+1,N −1}.
In the limit cases, that is, if the number of transactions M → +∞ the MEV of the censorship-minimizer builder
converges to the MEV of the censorship builder. Observe that in general, the MEV is greater than zero. For
example, assume that we have l = 2, D is the distribution that Pr[(∆1,∆2) = (1,0)] = Pr[(∆1,∆2) = (0,1)]
and the players have the Coubb-douglas utility function U(x,y) = xy. Assume that the builder receives
3 transactions. Two of the form tx1 = (U(x,y) = xy,(1,0)) and one of the form tx2 = (U(x,y),(0,1)).
Moreover, assume that the builder has (0,1) of initial endowments. Then, if the builder adds all transactions,
its final endowments are (1/2,1/2) obtaining a total utility of 1/4. However, if the player censors the
transaction tx2, then his final endowments are (1,1/2) leading to a utility of 1/2.
Proposition 4.3. When the builder is uninformed, individually rational, and risk-averse, then they want
to add as many transactions as possible in a block. More formally, an uninformed builder has non-censoring
as a dominant strategy. Moreover, we have that
E(MEV) = Wf(D,U)
7with p following the distribution XN conditioned by one transaction being ∆ and p⋆
being the Walrasian
equilibrium. On the other hand, the expected utility of non-builder player is Pr[tx ∈ B]Wf(D,U)+(1−Pr[tx ∈
B])E∆∼D[U(∆)] and so the difference between the value extracted from a builder and a non-builder players
is
(1−Pr[tx ∈ B])(Wf(D,U)−E∆∼D[U(∆)]). (5)
Proof. By assumption made in preliminars, a risk averse agent will add as much transaction to reduce the
risk of having a worst price than the Walrasian equilibrium price. Since, by the assumption, the agent is
truthful, we have that the builder will always add its transaction and remove another one. In this case, by
the assumption its expected is Wf(D).
The last proposition gives us a lower bound on the one block MEV in a pure exchange economy with random
endowments. Similar lower bounds emerge in frequent batch auctions such as [9]. Moreover, we prove that
with enough demand of exchange (that is Pr[tx ∈ B] < 1) the value extracted by the builder is strictly greater
than the one extracted by a non-builder player. However, clearly if there is demand of exchange is because
Wf(D) > E∆∼D[U(D)]. In other words, a blockchain with unique validators per slot always have strict
asymmetry of payoffs between validators and non-validators players if and only if there is sufficient demand
of exchange through the chain.
4.1 MEV in CFMM
In this paper, we did not took into account the utility of the liquidity provider. Since, in general, any passive
liquidity provider is weak against adverse selection. More formally, we have the following result. Let i ∈ I be
a player with initial endowments R ∈ Rk
+, with utility function U ∶ Rk
+ → R. There is no CFMM C ∶ Rk
+ → R
such that the solutions of the optimization problems:
max
x
U(x)
s.t. c⋅x = c⋅R
max
x
−c⋅x
s.t. C(x) = C(R)
x⋆
1 and x⋆
2 are have the same utility. The first optimization problem models the best response of the player
if there is a referential market with price vector c (the Walrasian equilibrium price). That is, the liquidity
provided by the LP is significantly small compared to the one provided by the off chain market. The second
optimization problem models how does the market react if the player posts a contract with initial reserves
R and CFMM C.
Example: Assume that the constant function is C(x,y) = xy and the utility of the LP is U = xy. Can we
find a utility function such that the optimization problem share the same solution? Assume that the initial
endowment is R = (1,1). Wlog, we can assume that the vector price is of the form c = (1,p). Then, the
solution of the second optimization problem is realized in R′
= (
√
p,1/
√
p) and so the utility is 1. On the
other hand, the solution of he first optimization problem is given in (1+p
2
, 1+p
2p
) and so the utility is (1+p)2
4p
and is strictly larger than 1 for p / = 1. Therefore, we have that an LP with utility function U = xy makes
worse providing liquidity than rebalancing in the market.
Proposition 4.4. Let U be a strictly increasing concave utility function and V1,V2 ⊆ Rl
++ open sets. Then,
for all complete CFMM C it holds U(x⋆
1(c,R)) > U(x⋆
2(c,R)) for every in c ∈ V1 and initial reserves R ∈ V2
such that ∇C(R) / = c.
In other words, there is no CFMM that maximizes the trader’s utility and the utility of the LP providers at
the same time. Or, in other words, the LP positions are always exposed to adversarial selection, even with
agents with Walrasian demands.
Now, we will discuss the expected MEV generated by the CFMM. For a given CFMM with reserves R.
If validators’ endowments are drawn randomly from the set of endowments D, then the expected MEV
is E[U(ζ(∆,R,C)]. Observe that in this case, the reserves that maximize the welfare are the ones that
maximize the MEV. An interesting question is which reserves (or point in the feasible set) minimizes the
8Figure 3: Geometric proof of LP loss
MEV. In presence of another off chain market maker and players that just values the non-risk asset the MEV
is minimized when the marginal price of assets coincide off chain and in the CFMM (no arbitrage condition,
see [2]). However, this is not true with players with Walrasian demands. More specifically, there are cases
where the CFMM being in the Walrasian equilibrium price maximizes MEV but also there are games where
the CFMM being in the Walrasian equilibrium price minimizes the MEV
Example: We have the same distribution of endowments as previous examples and utility function U(x,y) =
log(x) + log(y). Clearly, in this case the MEV is not minimized in reserves (R,R) since taking the reserves
lim
x→+∞
E[U(ζ(∆,C,(R2
/x,x)))] = −∞.
## 5 Future Work
While in the special case of the model we analysed the MEV does not reduce social welfare, this is not in
general the case. Characterising the loss in social welfare from MEV in a more general model where the
validator has visibility into the content of transactions. This naturally motivates the design of variations of
CFMMs that have higher social welfare. Another open problem is under what conditions does the average
price of the CFMM converges to the Walrasian equilibrium and if so how does the MEV impact on the rate
convergence.
References
[1] Guillermo Angeris and Tarun Chitra. “Improved price oracles: Constant function market makers”. In:
Proceedings of the 2nd ACM Conference on Advances in Financial Technologies. 2020, pp. 80–91.
[2] Guillermo Angeris et al. “Constant function market makers: Multi-asset trades via convex optimization”.
In: arXiv preprint arXiv:2107.12484 (2021).
[3] Kushal Babel et al. “Clockwork finance: Automated analysis of economic security in smart contracts”.
In: arXiv preprint arXiv:2109.04347 (2021).
[4] Rafael Frongillo, Nicholás Della Penna, and Mark D Reid. “Interpreting prediction markets: a stochastic
approach”. In: Advances in Neural Information Processing Systems 25 (2012).
[5] Allen Hatcher. Algebraic topology. 2005.
[6] Frederick S Hillier. “Introduction to operations research”. In: (1967).
[7] Andreu Mas-Colell, Michael Dennis Whinston, Jerry R Green, et al. Microeconomic theory. Vol. 1.
Oxford university press New York, 1995.
[8] Bruno Mazorra, Michael Reynolds, and Vanesa Daza. “Price of MEV: Towards a Game Theoretical
Approach to MEV”. In: arXiv preprint arXiv:2208.13464 (2022).
[9] Conor McMenamin, Vanesa Daza, and Matthias Fitzi. “FairTraDEX: A Decentralised Exchange Pre-
venting Value Extraction”. In: arXiv preprint arXiv:2202.06384 (2022).
9A Appendix(Work in Progress)
Proof 3.2: Clearly, we have that ∇C(x) / = 0 for all x ∈ Rl
++. In other words, all non-trivial elements are
regular. By implicit function theorem, we have that C−1
(R) is a manifold of dimension l −1.◻
Proof 3.3 First, using Lagrangian and the implicit function theorem, we can prove that the function ζ
can be defined locally and is smooth. We can extend it globally since the maximum always exist and by
continuity of the function
L(∆,Λ,R,µ) = U(∆)−µ(C(R +∆−Λ)−C(R)).◻
Proof 3.5: Let’s consider the map F ∶ p ↦ E∆∼D[ϕ(ϕ−1
(p⋆
s)+ζ(∆,C,ϕ−1
(p⋆
s)))]. Since ϕ,ϕ−1
and
ζ(∆,C,R) are continuous, we deduce that F is continuous by using the convergence dominated theorem.
Now, we will prove ε > 0 such that Nε = ∆l
ε = {x ∈ ∆l
∶ x ≥ ε1} holds F(Nε) ⊆ Nε. Assume otherwise,
then exist a sequence of points {xn}n such that d(F(xn),∂∆l
) → 0 (where d denotes the Euclidean dis-
tance and ∂∆l
the frontier of the l dimensional simplex). Since ∆l
is compact, wlog we can assume that
F(xn) → q for some q ∈ ∆l
and that F(xn)i → 0 and xj → 0 for some i and j (taking subsequences). Since
d(F(xn),∂∆l
) → 0, we deduce that q ∈ ∂∆l
. However, since the support of the endowments D is finite, we
have that i = j (is deduced from the fact that if C is complete). But if i = j, we would deduce that pi = 0,
leading to a contradiction. Therefore, exist Nε such that F(Nε) ⊆ Nε. Since Nε ≅ ∆l
, using the Brouwer
theorem [5], we have that exist x⋆
such that F(x⋆
) = x⋆
.◻
Proof 3.6 Since the Walrasian equilibrium of the pure exchange economy is unique, we have that is enough
to show that E[z(∆,limλ→+∞ p⋆
s(λ))] = 0. Since the map p ↦ E[z(∆,p)] is continuous, we have that
E[z(∆,limλ→+∞ p⋆
s(λ))] = limλ→+∞ E[z(∆,p⋆
s(λ))]. On the other hand, since ∇C(λR)/∣∣C(λR)∣∣1 = p⋆
, we
have that z(∆,C,λR) Ð→
λ→+∞
z(∆,p⋆
) uniformly at ∆. So,
E[z(∆, lim
λ→+∞
p⋆
s(λ))] = lim
λ→+∞
E[z(∆,p⋆
s(λ))]
= lim
λ→+∞
E[z(∆,C,p⋆
s(λ))]
= 0.◻
Proof 3.8 Clearly, using that supp z(⋅,p⋆
) ⊆ [0,M]l
we have that if C(v) = v ⋅ p⋆
then E[U(ζ(∆,R,C))] =
E[U(ζ(∆,p⋆
))]. Moreover, the feasible set associated to Cp⋆ (v) = v ⋅ p⋆
with reserves R is E = {R′
∈ Rl
+ ∶
R′
⋅ p⋆
≥ R ⋅ p⋆
}. Now, We have to prove that maxC∈Co(Rl
+,R+)
s.t.∇C(R)=p⋆
E[U(ζ(∆,R,C))] ≤ E[U(ζ(∆,p⋆
))]. If we
denote by S the feasible set induced by C. we have that S ⊆ E. This holds from the fact that ∇C(R) = p⋆
and C is concave. By the upper bound constraints on ∆, we have that z(∆,R,C) holds all the optimization
problem constraints and therefore we deduce the result. The second part is deduced immediately by taking
expectancies.◻
Proof 3.9: If M has a stationary distribution, then, since U is bounded, we deduce it by the large law of
numbers, for more details see [6]. ◻
Proof 3.10: Take Utility function Un(x,y) = log(x + 1/n) + log(y + 1/n). Assume endowments hold the
distribution D defined as Pr[(∆1,∆2) = (1,0)] = Pr[(∆1,∆2) = (0,1)] = 1/2. Let πn be the stationary
distribution followed by the Markov process (R,Un,C = x + y,D). Observe that in this CFMMWD, the
utility of the player after the trade is bounded by 2log(1+1/n). Therefore, we have that
Wf(Un,R,C) ≤ (1−πb/2)2log(1+1/n)+
πb
2
(log(1+1/n)+log(1/n)),
where πb = Probability of reserves being in the boundary. Observe that
lim
n→∞
Wf(Un,R,C) = −∞
Now, we will prove that there exist a C such that the CFMMWD G = (R,Un,C,D) holds Wfn(G) ≥ L
for some L. Take the constant product market maker C(x,y) = xy. Now, for an endowment, (0,1) we can
10compute the best trade. Assume that the current reserves of the CFMM are Rx,Ry. The player will trade
a quantity 0 ≤ b ≤ 1 such that maximizes G(b)(1 − b) where G(b) = −k
Ry+b
+ Rx. Computing it, we have that
b = −Ry +
√
Ry(Ry +1). On the other hand, the π distribution of the reserves is uniquely determineted for
the x reserves Rx. One can prove that exist xmin and xmax such that π(x) ≤ 1/21/x
for x ∈ [0,xmin] and
1 − π(x) ≤ 1/2x
for x ∈ [xmax,+∞]. Therefore, we deduce that ∫
∞
−∞(log(x) + log(g(x))π(x)dx exits and is
finite, deducing the result. ◻
Proof 3.11: The proof is deduced from the fact that the probability of being in the border tends to zero as
λ tends to infinity and the proposition 3.9.◻
Proof Sketch 3.12: The first equality is deduced similar to 3.9, the second one by definition.
Proof 3.13:
Lemma A.1. Let Gλ
= (λR,C,U,D) be a sequence of CFMM with Walrasian demand with C(x) = p ⋅ x
with p / = p⋆
. Assume that the support of the endowments is bounded. Then:
1. Gλ
is Ergodic for all λ ≥ 0, and so, we can consider the stationary distribution πλ
.
2. Let S be the state space of G1
and A ⊆ int(S) closed set, then limλ→+∞ πλ
[x ∈ λA] = 0.
Proof. 1. Since Sλ
is compact, we have that every collection of measures are tight. Moreover, the Markov
operator associated to the Markov process is Feller. Therefore, the statement is deduced by the Krylov-
Bogolioubov theorem.
2. This is equivalent to proof that positive random walks with negative drift have a stationary distribution.
Since, we can approximate the Markov chain by sufficiently closer Markov chains.
The theorem then is deduced from approximating the CFMM by piece-wise linear CFMM and proving that
the probability that the point is in the piece with price p / = p⋆
is zero.
Proof 4.4: Let R be the initial reserves of the CFMM. Take c such that C(R) / = c. Let R′
be the reserves
after the trade x2(c,R). Taking Lagrangian, we can show that ∇C(R′
) = c. Since C is convex, we have that
C(R) ≤ C(R′
)+∇C(R′
)⋅(R −R′
)
Since C(R′
) = C(R), we have that cR ≥ cR′
. Therefore, we deduce that there exist λ ≥ 1 such that
λx2 ∈ {x ∶ xc = x1c}. Now we will proof that λ > 1. Assume that λ = 1, then we would have that cR = cR′
.
Since C is concave, we have that the set S = {R ∶ C(R) ≥ C(R)} is convex and so the line {x ∶ xc = x2c}
is tangent. This implies that ∇C(R) = c, leading to a contradiction, therefore λ > 1. Since U is strictly
increasing, we have that U(λx2(c,R)) > U(x2(c,R)). On the other hand, λx2 holds the constraints of the
first optimization problem, therefore, U(x1(c,R)) > U(λx2(c,R)). ◻
11