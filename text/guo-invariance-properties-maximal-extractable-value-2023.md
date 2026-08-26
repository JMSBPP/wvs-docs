---
sha256: b5e356558e347aae95708e57c224380d91cfe93ae572bed6729ceff67dcdd713
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 71297
---
arXiv:2304.11010v1 [q-fin.MF] 21 Apr 2023
Invariance properties of maximal extractable value
Alan Guo ∗
April 24, 2023
Abstract
We develop a formalism for reasoning about trading on decentral-
ized exchanges on blockchains and a formulation of a particular form of
maximal extractable value (MEV) that represents the total arbitrage
opportunity extractable from on-chain liquidity. We use this formalism
to prove that for blockchains with deterministic block times whose liq-
uidity pools satisfy some natural properties that are satisfied by pools
in practice, this form of MEV is invariant under changes to the or-
dering mechanism of the blockchain and distribution of block times.
We do this by characterizing the MEV as the profit of a particularly
simple arbitrage strategy when left uncontested. These results can in-
form design of blockchain protocols by ruling out designs aiming to
increase trading opportunity by changing the ordering mechanism or
shortening block times.
## 1 Introduction
## 1.1 Background
Blockchain systems originated with Bitcoin as simply distributed ledgers,
but have since evolved into distributed universal computers starting with
Ethereum. Such Turing-complete blockchains enable decentralized finance
(DeFi) via programs, dubbed “smart contracts”, which facilitate financial
transactions between parties without intermediaries.
One of the most common types of protocols in decentralized finance are
decentralized exchanges. The dominant model for a decentralized exchange
is an automated market maker (AMM). AMMs are typically smart contracts
that have passive liquidity providers add assets to the contract. Active
∗
Jump Crypto. aguo@jumptrading.com
1traders may trade with the AMM by making “swaps” against the contract,
trading one asset for another, and pay a fee on each swap to the liquidity
providers to compensate them. What distinguishes an AMM from any other
is the logic it uses to govern what swaps are valid from any given state of
the AMM. A constant function market maker (CFMM) is a prototypical
example of an AMM. A CFMM is specified by an invariant function of its
asset reserves, such that a swap is only valid if it maintains the invariant.
One of the simplest and still most popular forms of CFMM is constant
product market makers, where the invariant is the product of the asset
reserves. AMMs generally rely on arbitrageurs to bring prices in line with
external prices. Therefore, the available liquidity in an AMM has option
value to arbitrageurs.
MEV is a phenomenon inherent to blockchains that support decentral-
ized finance. The acronym was coined by [DGK+19] and originally stood
for “miner extractable value”, and is traditionally defined as the value that
can be extracted by a miner by reordering, adding, or censoring transac-
tions from blocks. It was so named because at the time Ethereum, the
blockchain with the first and most mature DeFi ecosystem, used a proof-of-
work (PoW) consensus protocol in which miners had absolute control over
the transactions that were ultimately included in blocks. Prominent exam-
ples of malignant MEV include front running and sandwich attacks, which
extract profits at the expense of other users. However, there are also benign
forms of MEV such as cross-exchange arbitrage.
More recently, DeFi-capable blockchains typically do not use PoW for
consensus — even Ethereum has since switched to a proof-of-stake (PoS)
consensus protocol. As such, miners no longer play a role in the network,
and MEV is now referred to as “maximal extractable value”, which is a less
well-defined concept. What is clear is that users assign value to on-chain
execution and are willing to pay fees to network operators such as validators
to include their transactions in blocks. So there is clearly value that users
wish to extract from the network, a portion of which accrues to validators
as fees.
An active area of research in the blockchain and DeFi community is
designing protocols to minimize malignant MEV and to maximize benign
MEV, the former to encourage adoption and the latter to increase the value
of the network and incentivize network operators. One challenge in this
research is determining whether a proposed design actually increases the
overall extractable value or merely redistributes it. It is difficult to assess
the impact of a design if the objective to optimize is not clearly, precisely
defined.
21.2 Our results
The goal of this work is to formalize an intuitive notion of benign, arbitrage-
centric MEV, and to prove some invariance properties of this notion of MEV,
showing that certain changes to a blockchain design do not increase the
overall extractable value. We emphatically do not consider the malignant
redistributive MEV in this work.
Our work introduces a formalism for reasoning about trading strategies
that have access to a liquid external market, such as a centralized exchange,
as well as decentralized exchanges on blockchains with discrete block times.
At the core is the formalization of liquidity pools as abstract state machines
satisfying natural axioms, which abstracts properties of not only CFMMs,
but other AMMs such as Uniswap v3 as well, and even compositions of
AMMs. Within this formalism, we define MEV as the maximum net amount
of profit that can be extracted from the network before gas fees. This quan-
tity represents an upper bound on the amount traders would be willing to
pay in fees to network operators. We define competitive and noncompeti-
tive versions of MEV. The former represents the extractable value if at each
block traders leave no arbitrage opportunity behind, while the latter repre-
sents the same quantity without this constraint. We also define a particular
simple arbitrage strategy that is a greedy locally optimal strategy. We show
that when the asset price is a martingale, then the competitive MEV is equal
to the expected profit of this simple strategy when given exclusive access to
the liquidity, while the noncompetitive MEV is equal to the expected profit
of a related family of strategies. Since the expected profit of a strategy left
uncontested is independent of the blockchain’s ordering mechanism and dis-
tribution of block times, this shows the independence of the corresponding
notions of MEV to these same factors.
In Section 2, we lay out our formalism for on-chain trading, including
liquidity pools, blockchain markets, trading strategies, PNL, and MEV. Our
notion of liquidity pool is significantly more abstract and general than a
single AMM so that our results may apply more broadly. In Section 3,
we state our main invariance results. In Section 4, we develop some theory
around our formalism and leverage it to prove the main results. In Section 5,
we show how some of our simplifying assumptions can be relaxed and how
our results extend to more general settings. In Section 6, we show how many
decentralized exchanges in the wild satisfy the axioms of our formalism.
31.3 Prior work
MEV was introduced by the seminal paper [DGK+19]. The work of [KDC22]
develops a theoretical framework for analyzing the redistributive notion of
MEV, which is orthogonal to the notion of MEV studied in this work. The
constant product market maker model was formalized as a state transition
system in [ZCP18]. Constant product market makers and CFMMs were
analyzed in [AKC+19] and [AC20] respectively. The idea that holding a
passive liquidity position is equivalent to a short option position is not new.
[Cla20] shows that the payoff of a constant product market can be replicated
by a static portfolio of European call and put options. [MMRZ22] quantifies
the “loss-versus-rebalancing” (LVR) of passive liquidity in a CFMM, which
represents the optionality captured by arbitrageurs.
## 2 Formalism
In this section we develop the formalism for analyzing on-chain trading and
MEV. We give definitions and state our assumptions. Some of the assump-
tions are purely for the sake of simplifying the exposition and do not result
in the loss of any generality. We explore how these assumptions can be
relaxed in Section 5.
Assumption 1 (Single risky asset). There are just two assets: a risky asset
x and a numéraire y. In Section 5.2 we show how to generalize our results
to multiple risky assets.
Assumption 2 (Frictionless external market). There is a external market
where x and y may be exchanged frictionlessly (instantly without fees) at a
market price Pt which is assumed to be a semimartingale.
## 2.1 Liquidity pools
In an effort to capture as large a class of on-chain markets as we can, we
model them as abstractly as possible, only requiring as many assumptions as
are necessary (all of which are natural and satisfied by real world examples)
to prove our main results. Note that throughout this work, we are assuming
that liquidity is static — no liquidity is added or removed from a pool.
Definition 1 (Liquidity pool). A liquidity pool is an abstract determin-
istic state machine, represented by the tuple
(Σ,A,{As}s∈Σ,τ,π,s0)
4where
• Σ is the state space, the set of possible states the pool can be in. An
element of Σ is called a (pool) state
• A is the atomic action space, the set of possible atomic actions one
can take interacting with the pool.
• Given A, we define A∗ to be the smallest set such that A ⊆ A∗ and
a1,a2 ∈ A =⇒ a1a2 ∈ A∗. In other words, A∗ is the set of concate-
nations of elements of A. We call elements of A∗ actions or trades
(we will use them interchangeably).
• For each pool state s ∈ Σ, the set As ⊆ A∗ is the set of admissible
actions with respect to s.
• τ : S × A∗ → S is the transition function, describing how the state
of the pool changes under each action.
• π : A∗ → R2 is the payoff function. If action a is taken, then π(a) =
(∆x,∆y) represents the change in the trader’s holdings in the assets
x and y.
• s0 is the initial pool state at time t = 0.
Assumption 3 (Liquidity pool axioms). We assume a liquidity pool satis-
fies the following axioms: 1
• (Null action): There exists a null action ⊥ ∈ A, such that
1. ⊥ ∈
T
s∈Σ As
2. τ(s,⊥) = s for all s ∈ Σ
3. π(⊥) = (0,0)
• (Composition of actions): For any two actions a1,a2 ∈ A∗, their com-
posite action a1a2 ∈ A satisfies
1. π(a1a2) = π(a1) + π(a2)
2. a1 ∈ As,a2 ∈ Aτ(s,a1) =⇒ a1a2 ∈ As
3. Composition is associative: (a1a2)a3 = a1(a2a3)
1
The algebraically inclined may notice that these axioms declare A∗
to be the free
monoid on the set A, and π : A∗
→ R2
is a monoid homomorphism, and τ : S × A∗
→ S
describes a monoid action of A∗
on S.
5• (Optimal action): For any pool state s ∈ Σ and external price P of the
asset x, there exists an atomic a∗(s,P) ∈ As ∩ A with π(a∗(s,P)) =
(∆x,∆y) that maximizes
∆xP + ∆y.
Note that ∆xP + ∆y ≥ 0 since we can always choose ⊥.
Definition 2 (Admissible sequence of actions). If s ∈ Σ is a pool state, then
a sequence a1,...,an ∈ A is admissible with respect to s if a1 ···an ∈ As.
Assumption 4 (Single liquidity pool). There is a single liquidity pool with
reserves in the risky asset x and numéraire y. This assumption loses no
generality, as shown in Section 5.1.
Definition 3 (No-arbitrage state). For any external price P of the asset
x, a no-arbitrage state relative to P is a state s ∈ Σ such that for every
admissible a ∈ As,
π(a) = (∆x,∆y) =⇒ ∆xP + ∆y ≤ 0.
Definition 4 (Frictionless pool). A liquidity pool is frictionless if for every
external price P there exists a unique no-arbitrage state s∗(P) ∈ Σ.
Definition 5 (Path-independent pool). A liquidity pool is path-independent
if
τ(s,a) = τ(s,a′
) =⇒ π(a) = π(a′
)
for all s ∈ Σ.
Definition 6 (Efficient pool). A liquidity pool is efficient if every state is
a no-arbitrage state relative to some price.
Definition 7 (Volume). For any action a ∈ A∗, the volume of a, denoted
|a|, is defined as
|a| ,
(
|∆y| a ∈ A and π(a) = (∆x,∆y)
|a1| + |a2| a = a1a2
which is well-defined since composition in A∗ is associative.
Definition 8 (Liquidity pool with fees). Let φ > 0. A liquidity pool Π =
(Σ,A,{As}s∈Σ,τ,π,s0) has fee φ if there exists a payoff function π0 such
that the liquidity pool Π0 = (Σ,A,{As}s∈Σ,τ,π0,s0) satisfies the axioms of
Assumption 3 and
π0(a) = (∆x,∆y) =⇒ π(a) = (∆x,∆y − φ|a|).
We say Π has fee φ relative to Π0, which is the underlying pool.
6A pool satisfying Definition 8 does not necessarily satisfy the axioms of
Assumption 3, in particular the optimal action axiom. We show (Corollary 23)
that if the underlying pool is efficient and frictionless, then the pool with
fees satisfies the optimal action axiom.
In Section 6 we see that the most popular, dominant decentralized ex-
changes satisfy the liquidity pool axioms and furthermore are frictionless,
path-independent, and efficient.
## 2.2 Blockchain markets
Definition 9 (Blockchain market). A blockchain market is an increasing
sequence of block times t1,t2,... ∈ R+ and an ordering mechanism
which is a probability distribution for each tn satisfying the following:
• For each block time tn, let sn be the pool state at time tn before any ac-
tions. For each sequence T of actions (not necessarily admissible), the
ordering mechanism specifies a probability distribution over permuta-
tions σ(T) of T. The sequence T is the on-chain trades submitted
for block n.
• Once a permutation σ(T) is selected, a subsequence T′ is constructed
from σ(T) by starting from the first element of σ(T) and iteratively
dropping any action that is not admissible with respect to the pool
state after all the preceding non-dropped trades. By construction,
the resulting subsequence T′ is admissible with respect to the original
pool state sn. The sequence T′ is the on-chain trades executed for
block n.
• The starting state at block time tn+1 is sn+1 = τ(sn,T′) where we
abuse notation by using T′ to denote the composition of the elements
of T′.
Assumption 5 (Deterministic block times). We assume that the block
times (tn) are deterministic.
Assumption 6 (No gas fees). We assume there are no gas fees. As such,
the PNL we measure for a trading strategy is the gross PNL (after liquidity
provider fees) and an upper bound on how much the strategy would be
willing to pay in fees to network operators.
72.3 Trading strategies
We extend the formalization of a trading strategy used in [MMRZ22] to ex-
plicitly reflect the ability to make discrete trades on a decentralized exchange
on a blockchain.
Definition 10 (Trading strategies, on-chain trades). A trading strategy
is a stochastic process (xt,yt) representing its holdings at time t of the risky
asset x and the numéraire y and, for each block time tn, a sequence of
submitted on-chain trades Tn, which may be chosen probabilistically.
Because we assume block times are deterministic, we may assume that the
on-chain trades are submitted using all information available at time tn.
We require that the process is adaptable, predictable, and satisfies
E
Z t
0
x2
sP2
s ds

< ∞
for all t ≥ 0.
Assumption 7 (Self-financing strategies). We assume that all trading strate-
gies are self-financing, i.e. for all t ≥ 0, if t ∈ [tn,tn+1), then
xtPt + yt − (x0P0 + y0) =
Z t
0
xsdPs +
n X
i=1
ni X
j=1
(∆xi,jPti + ∆yi,j).
where (∆xi,j,∆yi,j)ni
j=1 are the payoffs of the on-chain trades executed by
the strategy for block i.
Informally, a self-financing strategy does not get any assets added or
removed aside from through trades, either exchanging at the external market
price or executing admissible trades through the on-chain liquidity pool.
Definition 11 (Sum of strategies). Let S be a trading strategy whose asset
holdings are given by (xt,yt) and whose sequence on-chain trades submitted
for block n is Tn, and similarly let S′ be a trading strategy whose asset hold-
ings and submitted on-chain trades are (x′
t,y′
t) and T′
n respectively. Then
their sum S+S′ is defined to be the strategy whose asset holdings are given
by (xt + x′
t,yt + y′
t) and whose on-chain trades submitted for block n is the
union Tn ∪ T′
n.
Definition 12 (Arbitrage strategy). An arbitrage strategy is a trading
strategy with xt = 0 for all t.
8Definition 13 (Simple arbitrage strategy S0). Given a fixed blockchain
market and a fixed liquidity pool within that market, the simple arbitrage
strategy, denoted by S0, with respect to that market is defined to be the
self-financing arbitrage strategy such that for each block n with block time
tn it submits the trade a∗(sn,Ptn).
Definition 14 (Concurrent strategies). A set of trading strategies S1,...,Sm
is concurrent if their executed on-chain trades are disjoint.
Definition 15 (Covering strategies). A set of trading strategies is covering
if it is concurrent and the union of their on-chain trades equals all on-chain
trades.
Definition 16 (Complete strategies). A set of trading strategies is com-
plete if it is covering and their sum is an arbitrage strategy.
Definition 17 (Competitive strategies). A set of m trading strategies is
competitive if it is complete and the following conditions are satisfied:
1. For each block, the pool state after executing all the on-chain trades
from all the strategies in the set is a no-arbitrage state.
2. either m = 1 or with probability 1 each strategy submits non-null
admissible on-chain trades for some positive number of blocks, and
there are infinitely many blocks for which at least two of the strategies
submit non-null admissible on-chain trades.
Intuitively, a concurrent set of strategies models a set of strategies that
actually run in the same world and compete for the same set of opportuni-
ties. A covering set captures all strategies that trade on-chain. A complete
set captures all strategies that trade in the external market as well. A com-
petitive set models the notion of a set of strategies that leave no money on
the table after each block. The second condition for competitiveness just en-
forces that each strategy is “doing something” rather than just one strategy
doing all the trading while the others sit back and watch.
2.4 PNL and MEV
Definition 18 (PNL of strategy). Let S = (xt,yt) be a strategy. The PNL
(Profit and Loss) of S, denoted PNL(S), is the process
PNL(S)t , xtPt + yt − (x0P0 + y0).
9We denote by
PNL∗
(S)
the PNL of S if S is the only trading strategy submitting on-chain trades,
called the uncontested PNL of S.
Definition 19 (MEV). Let B be a blockchain market and let m be a positive
integer. The m-player competitive pathwise maximal extractable
value (MEV) of B, denoted MEVpath
m (B), is
MEVpath
m (B) , sup
S competitive
X
S∈S
PNL(S)
where S ranges over all competitive sets of m or more strategies.
The m-player competitive MEV of B, denoted MEVm(B), is
MEVm(B) , sup
S competitive
E
"
X
S∈S
PNL(S)
#
where again S ranges over all competitive sets of m or more strategies.
The noncompetitive MEV of B, denoted MEV∗
(B), is
MEV∗
(B) , sup
S covering
E
"
X
S∈S
PNL(S)
#
where S is allowed to range over all covering sets of strategies.
As we will see in Theorem 1, Theorem 3, and Theorem 5, MEVpath
m (B)
and MEVm(B) are independent of m, and so there are well-defined notions
of MEVpath
(B) and MEV(B).
Definition 19 is worth explaining, as it may look strange at first glance.
Recall that PNL(S) is not a single number, it is a stochastic process, with
a random value at each time t ≥ 0. Therefore
P
S∈S PNL(S) is a stochastic
process. Since stochastic processes in general cannot be totally ordered,
we must take the pathwise supremum over each time t. In particular, this
means that for each t, the set S that approaches the supremum may be
very different, and there may not be a single S whose total PNL comes
close to MEVm(B). However, our first main result (Theorem 1) is that, in
the frictionless setting, indeed there exists a single set S that attains this
maximum value. As for MEV(B) and MEV∗
(B), these quantities are no
longer random, but are still functions of time t.
10It is important to require concurrency because otherwise one can make
MEVm(B) arbitrary large by adding arbitrarily many copies of the same
strategy, while we are interested in the value that can be extracted by strate-
gies competing for the same on-chain opportunities.
The covering hypothesis is also necessary to avoid a degenerate defini-
tion. The profit of an on-chain trade can be arbitrarily large if the trade is
preceded by an arbitrarily unprofitable trade (this is the idea behind back-
running). Therefore, we should include both trades, so that we can show
that on-chain trading is constant-sum.
For pathwise MEV, completeness is required because otherwise we can
make a strategy’s PNL arbitrarily large by making its risk exposure arbitrar-
ily high in the external market. But the external market is zero-sum, so any
arbitrarily large profits made by a strategy in the external market must be
offset by corresponding losses spread across other strategies. Completeness
essentially includes those strategies being traded against. When the price
is a martingale, we do not require completeness because any trades in the
external market have zero expected return.
The competitiveness condition is the main difference between MEV(B)
and MEV∗
(B). The former measures the MEV when the space is competitive
to the point where every block no profits are left on the table, while the latter
measures the maximum possible value if some profits could be deferred.
## 3 Main Results
We now state our results, deferring the proofs to Section 4.
## 3.1 Ordering mechanism invariance
Our main results characterize the measures of MEV defined in Section 2
in terms of the uncontested PNL of a single strategy or a family of strate-
gies. This implies that the MEV is invariant to ordering mechanisms, since
uncontested PNL is invariant.
## 3.1.1 Frictionless setting
When the pool is frictionless, we show that the pathwise competitive MEV
is equal to the uncontested PNL of the simple arbitrage strategy.
Theorem 1 (Invariance of competitive pathwise MEV, frictionless). Let B
be a blockchain market with deterministic block times whose liquidity pool is
11frictionless. Then, for all positive integers m, there exists a competitive set
S of m strategies such that
MEVpath
m (B) =
X
S∈S
PNL(S) = PNL∗
(S0).
In particular, MEVpath
m (B) does not depend on m, so the following definition
of competitive pathwise MEV
MEVpath
(B) , MEVpath
m (B)
is well-defined, and also does not depend on the ordering mechanism of B.
A corollary of this is that we can easily characterize the (non-pathwise)
competitive MEV.
Corollary 2 (Competitive MEV is average competitive pathwise MEV). Let
B be a blockchain market with deterministic block times with a frictionless
liquidity pool. Then
MEV(B) = E[PNL∗
(S0)] = E[MEVpath
(B)].
If we additionally require that the pool is path-independent and that the
asset price Pt is a martingale, then we can characterize the noncompetitive
MEV as the expected uncontested PNL of the simple arbitrage strategy too,
and therefore competitive and noncompetitive MEV are equal.
Theorem 3 (Invariance of noncompetitive MEV, frictionless). Let B be
a blockchain market with deterministic block times whose liquidity pool is
frictionless and path-independent. Suppose Pt is a martingale. Then
MEV∗
(B) = E[PNL∗
(S0)].
In particular, MEV∗
(B) is independent of the ordering mechanism of B, and
also
MEV∗
(B) = MEV(B).
## 3.1.2 Fees setting
If the pool has a fee relative to an efficient, frictionless, path-independent
pool, and the asset price is a martingale, then we can prove analogous results.
In particular, Theorem 4 is the analogue of Corollary 2 and Theorem 5 is
the analogue of Theorem 3. In Section 4.3, we give a counterexample to
show how an analogue of Theorem 1 cannot hold in general when there are
fees.
12Theorem 4 (Invariance of competitive MEV, with fees). Let B be a blockchain
market with deterministic block times whose liquidity pool has a fee relative
to an efficient, frictionless, path-independent pool. Suppose Pt is a martin-
gale. Then, for all positive integers m,
MEVm(B) = E[PNL∗
(S0)].
In particular, MEVpath
m (B) does not depend on m, so the following definition
of competitive MEV
MEV(B) , MEVm(B)
is well-defined, and also does not depend on the ordering mechanism of B.
Theorem 5 (Invariance of noncompetitive MEV, with fees). Let B be a
blockchain market with deterministic block times whose liquidity pool has a
fee relative to an efficient, frictionless, path-independent pool. Suppose Pt
is a martingale. For each block n ≥ 1 with block time tn, define Sn to be
arbitrage strategy that only submits an on-chain trade of a∗(sn,Ptn) on block
n and no trades on any other block. Then, for t ≥ 0, if tn ≤ t < tn+1,
MEV∗
(B)t = E[PNL∗
(Sn)].
## 3.2 Dependence on block times
We also investigate the dependence of the measures of MEV on block times,
namely what happens if we subdivide each block into multiple blocks.
In the frictionless case, if the pool is path-independent and the asset
price is a martingale, then there is no dependence on block times.
Theorem 6 (Block time invariance of MEV, frictionless). Let B be a blockchain
market with deterministic block times whose liquidity pool is frictionless and
path-independent, and let B′ be identical to B except each block is subdivided
into k blocks (not necessarily evenly spaced). Suppose Pt is a martingale.
Then, for all block times t of B,
MEV(B′
)t = MEV(B)t
and
MEV∗
(B′
)t = MEV∗
(B)t.
In the setting with fees, if the underlying pool is efficient, frictionless,
and path-independent, and the asset price is a martingale, then the noncom-
petitive MEV does not depend on block times, but the competitive MEV
may shrink as block times get shorter.
13Theorem 7 (MEV is nonincreasing with shorter block times with fees).
Let B be a blockchain market with deterministic block times whose liquidity
pool has a fee relative to an efficient, frictionless and path-independent pool,
and let B′ be identical to B except each block is subdivided into k blocks (not
necessarily evenly spaced). Suppose Pt is a martingale. Then, for all block
times t of B,
MEV(B′
)t ≤ MEV(B)t
and
MEV∗
(B′
)t = MEV∗
(B)t.
## 4 Proofs
In this section we prove the main results of Section 3.
## 4.1 Intermediate results
We begin by developing some helpful intermediate results.
## 4.1.1 General
This section contains general results about strategies and PNL. We start
by observing some simple but useful facts that follow immediately from our
definitions.
Proposition 8. If S1,...,Sm are concurrent trading strategies, then S1 +
···+Sm is a trading strategy whose submitted on-chain trades and executed
on-chain trades are the respective unions of those of S1,...,Sm.
Proof. Follows immediately by induction on Definition 11.
Proposition 9. Let S1,...,Sm be trading strategies. Then
PNL(S1 + ··· + Sm) = PNL(S1) + ··· + PNL(Sm).
Proof. Follows from Definition 18 and Proposition 8, in particular the fact
that PNL is linear in xt, yt, ∆xi,j, and ∆yi,j.
The next result provides a formula for the PNL of an arbitrage strategy.
14Proposition 10. Let (tn) be block times. Let S be an arbitrage strategy. Let
(∆xi,1,∆yi,1),...,(∆xi,ni,∆yi,ni) be payoffs of the on-chain trades executed
by S in block i. If tn ≤ t < tn+1, then
PNL(S)t =
n X
i=1
ni X
j=1
(∆xi,jPti + ∆yi,j).
Proof. By Definition 18 and Assumption 7 we have
PNL(S)t = xtPt + yt − (x0P0 + y0) =
Z t
0
xsdPs +
n X
i=1
ni X
j=1
(∆xi,jPti + ∆yi,j).
By Definition 12, xs = 0 for all s ≥ 0, hence the integral equals 0.
The next lemma is used to show that S0 is optimal in capturing MEV
in a given block.
Lemma 11. Fix a block with time t and state s, and let a1,...,an be an ad-
missible sequence of trades with respect to s, with payoffs (∆x1,∆y1),...,(∆xn,∆yn).
Let Pt be the external market price. Let a∗(s,Pt) ∈ As be the optimal action
and let π(a∗(s,Pt)) = (∆x∗,∆y∗). Then
n X
i=1
(∆xiPt + ∆yi) ≤ ∆x∗
Pt + ∆y∗
.
Proof. Let a = a1 ···an, which has payoff π(a) = (∆x,∆y) where ∆x = Pn
i=1 xi and ∆y =
Pn
i=1 yi. By the composition axiom of Assumption 3, a
is admissible with respect to s. By the optimality of a∗(s,P),
n X
i=1
(∆xiPt + ∆yi) = ∆xPt + ∆y ≤ ∆x∗
Pt + ∆y∗
.
The next lemma says that optimal actions put the pool in a no-arbitrage
state.
Lemma 12. For any pool state s ∈ Σ and external market price P, τ(s,a∗(s,P))
if a no-arbitrage state relative to P. In particular, if Π is frictionless, then
τ(s,a∗
(s,P)) = s∗
(P).
15Proof. Let s′ = τ(s,a∗(s,P)). Suppose there exists a ∈ As′ with π(a) =
(∆x,∆y) such that ∆xP + ∆y > 0. Let π(a∗(s,P)) = (∆x∗,∆y∗). Then
the action a∗a is admissible with respect to s and
π(a∗
a) = (∆x∗
+ ∆x,∆y∗
+ ∆y)
by the composition axiom of Assumption 3. But
(∆x∗
+ ∆x)P + (∆y∗
+ ∆y) = (∆x∗
P + ∆y∗
) + (∆xP + ∆y)
> ∆x∗
P + ∆y∗
contradicting the optimality of a∗(s,P). Therefore ∆xP + ∆y ≤ 0 for all
a ∈ As′. Therefore τ(s,a∗(s,P)) is a no-arbitrage state relative to P.
If Π is frictionless, then it has only one no-arbitrage state s∗(P) relative
to P.
Corollary 13. If the liquidity pool is frictionless, the set {S0} is competitive.
Proof. Follows immediately from Lemma 12.
Corollary 14. For a frictionless pool, if s ∈ Σ and P is some price, then
there exists an atomic a ∈ As ∩ A such that τ(s,a) = s∗(P).
Proof. Follows immediately from Lemma 12.
The next lemma implies that concurrent copies of S exactly split the pie.
Lemma 15. For a given pool state s ∈ Σ and external price P, if π(a∗(s,P)) =
(∆x,∆y) and ∆xP + ∆y > 0, and m copies of a∗(s,P) are submitted, then
exactly one of the trades will be executed.
Proof. Certainly at least one of the trades will be executed, so it only re-
mains to show that none of the other trades are executed. It suffices to
show that a∗(s,P)a∗(s,P) / ∈ As. By Lemma 12, τ(s,a∗(s,P)) = s∗(P). By
the equilibrium state axiom in Assumption 3, for any a ∈ As∗(P), its payoff
(∆x,∆y) satisfies ∆xP + ∆y ≤ 0. Therefore a∗(s,P) / ∈ As∗(P), so by the
composition axiom in Assumption 3, a∗(s,P)a∗(s,P) / ∈ As.
Proposition 16. For any positive integer m, there exists a competitive set
S of m strategies such that
X
S∈Σ
PNL(S) = PNL∗
(S0).
16Proof. For i ∈ {1,...,m}, let Si be a concurrent copy of S0 and let S =
{S1,...,Sm}. On each block, either none of the Si submits any on-chain
trade, or they all submit a copy of the trade a∗(s∗(Ptn−1),Ptn) at block time
tn, in which case exactly one is executed (by Lemma 15). Therefore the
executed trades of S1 + ··· + Sm are exactly equal to that of S0, hence
X
S∈S
PNL(S) = PNL(S1 + ··· + Sm) = PNL∗
(S0).
This also implies that S is covering. The fact that it is complete follows from
the fact that S0 is an arbitrage strategy. Finally, it is competitive since it
executes the same on-chain trades as S0 which is competitive (Corollary 13).
## 4.1.2 Frictionless pools
This section contains a result that is true for frictionless pools. It states
that no competitive set of strategies can make more profit than S0 by itself.
Proposition 17. Suppose the liquidity pool is frictionless. Let S1,...,Sm
be a competitive set of trading strategies. Then
PNL(S1) + ··· + PNL(Sm) ≤ PNL∗
(S0).
Proof. Let S = S1+···+Sm, which is an arbitrage strategy by Definition 17.
Since both sets {S1,...,Sm} and {S0} are competitive (Corollary 13), un-
der each set of concurrent strategies the pool state at block time ti is si =
s∗(Pti−1) since the pool is frictionless. Consider a fixed block at time ti and
let T be the on-chain trades of S. Since S is complete, T is an admissible se-
quence of trades with respect to si. Let (∆xi,1,∆yi,1),...,(∆xi,ni,∆yi,ni) be
the payoffs of the trades in T. Let (∆x∗
i ,∆y∗
i ) be the payoff of a∗(s∗(Pti−1),Pti).
Therefore, if tn ≤ t < tn+1,
PNL(S1)t + ··· + PNL(Sm)t = PNL(S)t (Proposition 9)
=
n X
i=1
ni X
j=1
(∆xi,jPti + ∆yi,j) (Proposition 10)
≤
n X
i=1
(∆x∗
i Pti + ∆y∗
i ) (Lemma 11)
= PNL∗
(S0)t. (Proposition 10)
174.1.3 Martingales
This section contains results that are true when Pt is a martingale. The first
lemma says that if the pool is frictionless and path-independent, and Pt is
a martingale, then any two strategies that end the pool in the same state
have the same expected cumulative PNL.
Lemma 18. Let B be a blockchain market whose liquidity pool is frictionless
and path-independent. Suppose Pt is a martingale. Let S be an arbitrage
strategy that submits on-chain trade ai on block i at time ti. Let S′ be an
arbitrage strategy that submits no on-chain trades except a′ on block n. If
τ(s0,a1 ···an) = τ(s0,a′), then
E[PNL∗
(S)tn] = E[PNL∗
(S′
)tn].
Proof. Decompose S = S1+S2 where S1 submits the same on-chain trades as
S but has xtj =
Pj
i=1 ∆xi for each 1 ≤ j ≤ n and xs = xtj for tj ≤ s < tj+1,
where π(ai) = (∆xi,∆yi), and S2 submits no on-chain trades and has xtj
offsetting the position of S1, i.e. xtj = −
Pj
i=1 ∆xi for 1 ≤ j ≤ n and
xs = xtj for tj ≤ s < tj+1.
Setting t0 = 0, if xs is the holdings for x for S1, then
Z t
0
xsdPs =
n X
j=1
Z tj
tj−1
xsdPs
=
n X
j=1
xtj−1
Z tj
tj−1
dPs
=
n X
j=1
j−1 X
i=1
∆xi(Ptj − Ptj−1)
=
n−1 X
i=1
∆xi
n X
j=i+1
(Ptj − Ptj−1)
=
n−1 X
i=1
∆xi(Ptn − Pti).
18Therefore
PNL∗
(S1)tn =
Z t
0
xsdPs +
n X
i=1
(∆xiPti + ∆yi)
=
n−1 X
i=1
∆xi(Ptn − Pti) +
n X
i=1
(∆xiPti + ∆yi)
=
n X
i=1
(∆xiPtn + ∆yi)
=
n X
i=1
∆xi
!
Ptn +
n X
i=1
∆yi
!
.
Let π(a′) = (∆x′,∆y′). By Proposition 10,
PNL∗
(S′
)tn = ∆x′
Ptn + ∆y′
.
By hypothesis, τ(s0,a1 ···an) = τ(s0,a′), so by path-independence, this
implies
n X
i=1
∆xi,
n X
i=1
∆yi
!
= π(a1 ···an) = π(a′
) = (∆x′
,∆y′
).
Therefore,
PNL∗
(S1)tn = PNL∗
(S′
)tn.
Now, since S2 exclusively trades in the external market and Pt is a martin-
gale,
E[PNL∗
(S2)] = 0.
Putting it all together, we get
E[PNL∗
(S)] = E[PNL∗
(S1) + PNL∗
(S2)]
= E[PNL∗
(S1)] + E[PNL∗
(S2)]
= E[PNL∗
(S′
1)]
= E[PNL∗
(S′
)].
The next lemma is nearly identical to Lemma 18 except the pool has
a fee. The conclusion is also weakened: a strategy cannot outperform (on
average) a version of itself that just waits until the end of n blocks and
moves the pool to the same end state.
19Lemma 19. Let B be a blockchain market whose liquidity pool has a fee
relative to a frictionless and path-independent pool. Suppose Pt is a martin-
gale. Let S be an arbitrage strategy that submits on-chain trade ai on block
i at time ti. Let S′ be an arbitrage strategy that submits no on-chain trades
except a′ on block n. If τ(s0,a1 ···an) = τ(s0,a′), then
E[PNL∗
(S)tn] ≤ E[PNL∗
(S′
)tn].
Proof. Suppose the pool Π has a fee φ relative to Π0, which is frictionless
and path-independent by hypothesis, and let π0 be the payoff function of
Π0. Let PNL∗
0 denote the uncontested PNL before fees, which is the PNL
using π0. For each block i, let ai be the trade submitted by S on that block,
with π0(ai) = (∆xi,∆yi). Then, by Lemma 18,
E[PNL∗
0(S)t] = E[PNL∗
0(S′
)t].
Then,
PNL∗
(S′
)t − PNL∗
(S)t = PNL∗
0(S′
)t − PNL∗
0(S)t + φ
n X
i=1
|∆yi| −
n X
i=1
∆yi
!
≥ PNL∗
0(S′
)t − PNL∗
0(S)t
so
E[PNL∗
(S′
)t] − E[PNL∗
(S)t] ≥ E[PNL∗
0(S′
)t] − E[PNL∗
0(S)t] = 0.
## 4.1.4 Efficient pools
We now prove some properties of efficient pools. These results are critical in
proving our main results in the setting with fees. In particular, Corollary 23
establishes that S0 is even well-defined for a pool with a fee whose underlying
pool is efficient and frictionless. Many intuitive properties of exchanges can
be proved for efficient pools.
The first result simply states that in an efficient, frictionless pool, any
state is reachable from any other state by an atomic action.
Proposition 20. Let Π be an efficient, frictionless pool. Let s1,s2 ∈ Σ be
two states of the pool. Then there exists an atomic a ∈ As1 ∩ A such that
τ(s1,a) = s2.
20Proof. Since Π is efficient, there exists P such that s2 = s∗(P). Apply
Corollary 14.
The next result states the intuitive property that buying from the pool
raises the pool price, while selling lowers the pool price.
Proposition 21. Let Π be an efficient, frictionless pool. Let s = s∗(P0) for
some price P0 and let a ∈ As with π(a) = (∆x,∆y). Suppose ∆xP+∆y > 0.
• P > P0 if and only if ∆y < 0.
• P < P0 if and only if ∆y > 0.
Proof. Since s is a no-arbitrage state for P0, we have ∆xP0 + ∆y ≤ 0.
Subtracting this from ∆xP + ∆y > 0 yields
∆x(P − P0) > 0.
If P > P0, then ∆x > 0. Then we must have ∆y < 0, for if ∆y ≥ 0,
then ∆xP0 + ∆y > 0, contradicting that s is a no-arbitrage state for P0.
Conversely, if ∆y < 0, then ∆xP > ∆xP + ∆y > 0, hence ∆x > 0, so
P − P0 > 0.
If P < P0, then ∆x < 0, and so ∆y > ∆xP + ∆y > 0. Conversely, if
∆y > 0, then we must have ∆x < 0, for if ∆x ≥ 0, then ∆xP0 + ∆y ≥
∆y > 0, contradicting that s is a no-arbitrage state for P0. Therefore
P − P0 < 0.
The following result characterizes the optimal action for a pool with fee
relative to an efficient, frictionless pool. When the external price P is high,
the optimal action is to buy until the pool price is P
1+φ, while if P is low,
the optimal action is to sell until pool price is P
1−φ.
Proposition 22. Let Π have a fee φ relative to an efficient, frictionless pool
Π0. If s = s∗(P0) and P is some price, and there exists an atomic action
a ∈ As ∩ A that maximizes
∆xP + ∆y − φ|∆y|
such that
• if P > P0(1 + φ), then τ(s,a) = s∗

P
1+φ

;
• if P < P0(1 − φ), then τ(s,a) = s∗

P
1−φ

;
21• otherwise, τ(s,a) = s.
In particular, s ∈ Σ is a no-arbitrage state (in Π) for price P if and only
if s = s∗(P0) (in Π0) for some P
1+φ ≤ P0 ≤ P
1−φ.
Proof. Suppose P > P0(1+φ). By Proposition 21, ∆x P
1+φ +∆y > 0 only if
∆y < 0. Since we can always take a = ⊥, this means maximizing ∆x P
1+φ +
∆y does change when restricting to ∆y < 0, in which case, by multiplying
the expression by 1 + φ, it is equivalent to maximizing
∆xP + ∆y(1 + φ) = ∆xP + ∆y − φ|∆y|.
Since Π0 satisfies the optimal action axiom, this maximization problem has
an atomic solution a = a∗

s, P
1+φ

∈ As ∩ A in Π0, and by Lemma 12,
τ(s,a) = s∗

P
1+φ

.
Similarly, if P < P0(1 − φ), Proposition 21 implies ∆x P
1−φ + ∆y > 0
only if ∆y > 0, so maximizing ∆x P
1−φ +∆y does change when restricting to
∆y > 0, in which case it is equivalent to maximizing
∆xP + ∆y(1 − φ) = ∆xP + ∆y − φ|∆y|.
Again, this maximization problem has an atomic solution a = a∗

s, P
1−φ

∈
As ∩ A in Π0, and Lemma 12 implies that τ(s,a) = s∗

P
1−φ

.
Now suppose P0(1 − φ) ≤ P ≤ P0(1 + φ). Suppose there exists a ∈ As
with π(a) = (∆x,∆y) and ∆xP + ∆y − φ|∆y| > 0. If ∆y < 0, then
∆x
P
1 + φ
+∆y =
1
1 + φ
(∆xP +∆y(1+φ)) =
1
1 + φ
(∆xP +∆y−φ|∆y|) > 0
so Proposition 21 implies that P
1+φ > P0, a contradiction. A similar argu-
ment shows that ∆y > 0 cannot be true. Therefore ∆y = 0. Since s is a
no-arbitrage state for P0, this implies 0 ≥ ∆xP0 + ∆y = ∆xP0, so ∆x = 0,
but this contradicts ∆xP + ∆y > 0. Hence such an action a does not exist
and the best we can do is a = ⊥.
We now move on to prove that s ∈ Σ is a no-arbitrage state in Π for
price P if and only if s = s∗(P0) in Π0 for some P
1+φ ≤ P0 ≤ P
1−φ. We have
just shown the reverse direction. Now suppose s is a no-arbitrage state, and
let s = s∗(P0). Suppose P0 > P
1−φ. By what was shown earlier in this proof,
22the optimal action in Π has payoff (∆x,∆y) maximizing ∆x P
1−φ + ∆y with
∆y > 0. Since s is a no-arbitrage state in Π, this implies
∆x
P
1 − φ
+ ∆y =
1
1 − φ
(∆xP + ∆y − φ|∆y|) = 0
so s is a no-arbitrage state in Π0 for P
1−φ. Since Π0 is frictionless, this implies
s = s∗

P
1−φ

, and we are done. A similar argument shows that if P0 < P
1+φ,
then s = s∗

P
1+φ

and again we are done.
The following is the culmination of the previous results in this section
and states that S0 is well-defined for a pool with fee relative to an efficient,
frictionless pool.
Corollary 23. Let Π have a fee relative to an efficient, frictionless pool.
Then Π satisfies the optimal action axiom of Assumption 3, and in particular
the simple arbitrage strategy S0 is well-defined for Π.
Proof. Let P be the external market price. By Proposition 22, there exists
an atomic action a∗ with π(a∗) = (∆x∗,∆y∗) maximizing
∆x∗
P + ∆y∗
− φ|∆y∗
|.
It only remains to show that there is no action a ∈ A∗ with π(a) = (∆x,∆y)
such that
∆xP + ∆y − φ|a| > ∆x∗
P + ∆y∗
− φ|∆y∗
|.
But this follows simply from the fact that |a| ≥ |∆y| (which follows easily
from the triangle inequality), so if such an action existed, that would imply
∆xP + ∆y − φ|∆y| > ∆x∗
P + ∆y∗
− φ|∆y∗
|
which contradicts the optimality of a∗.
The following result states for an efficient, frictionless, path-independent
pool one can define a nondecreasing potential function on prices such that
the potential difference between two prices represents the volume one needs
to buy or sell to change the pool price from one price to the other.
Proposition 24. Let Π be an efficient, frictionless, path-independent pool.
Then there exists a well-defined nondecreasing potential function on prices,
q : R+ → R, such that for every pair of prices P1,P2, and every a ∈ As∗(P1)
with π(a) = (∆x,∆y),
τ(s∗
(P1),a) = s∗
(P2) =⇒ q(P1) − q(P2) = ∆y.
23Proof. Pick an arbitrary price P0 ∈ R+ and define q(P0) = 0. For any
price P ∈ R+, we define q(P) as follows: by Proposition 20, there exists an
admissible action a ∈ As∗(P0) such that τ(s∗(P0),a) = s∗(P), with π(a) =
(∆x,∆y); define q(P) = −∆y.
Because Π is path-independent, the definition of q(P) is independent
of our choice of a, and so q is well-defined. Let P1,P2 be two prices. Let
a ∈ As∗(P1) be an action with π(a) = (∆x,∆y). Let a1 = a∗(s∗(P0),P1)
and a2 = a∗(s∗(P0),P2), with π(a1) = (∆x1,∆y1) and π(a2) = (∆x2,∆y2).
Then q(P1) − q(P2) = ∆y2 − ∆y1. If τ(s∗(P1),a) = s∗(P2), then
τ(s∗
(P0),a2) = τ(s∗
(P0),a1a)
so path-independence implies
(∆x2,∆y2) = π(a2) = π(a1a) = (∆x1 + ∆x,∆y1 + ∆y).
Therefore, q(P1) − q(P2) = ∆y2 − ∆y1 = ∆y.
Finally, we verify that q is nondecreasing. If P1 < P2 and a = a∗(s∗(P1),P2)
with π(a) = (∆x,∆y). Since τ(s∗(P1),a) = s∗(P2), by what we just proved
above it follows that q(P2) − q(P1) = −∆y, so it suffices to show that
∆ ≤ 0. First suppose ∆xP2 +∆y > 0. Then Proposition 21 implies ∆y < 0.
Now suppose ∆xP2 + ∆y = 0. Since a was optimal, this implies s∗(P1)
is a no-arbitrage state for P2 as well. Since Π is frictionless, this implies
s∗(P1) = s∗(P2). So we may take a = ⊥ with ∆y = 0.
The next lemma is critical to the proof of Theorem 4. It implies that
S0 minimizes fees paid among all competitive strategies. However, it states
something even stronger: if we S is any other competitive strategy, we can
modify S0 into a strategy S′
0 that trades like S0 and on the final block n
makes an additional trade to get to the same state that S ends on, and even
with that additional trade S′
0 still pays no more fees than S.
Lemma 25. Let Π have a fee φ relative to an efficient, frictionless, path-
independent pool Π0. Let S be a competitive strategy. Let n ≥ 1 and tn ≤
t < tn+1, and suppose S submits trades a1,...,an on the first n blocks
respectively. Define a strategy S′
0 to make the same trades as S0 on blocks
1,...,n−1, i.e. a∗(si−1,Pti), and on block n submit a∗(sn−1,Ptn) composed
with a trade such that the state after is equal to τ(s0,a1 ···an). If a′
1,...,a′
n
are the trades of S′
0, then
n X
i=1
|a′
i| ≤
n X
i=1
|ai|.
24In other words, S trades at least as much volume as S′
0.
Proof. Let a∗
1,...,a∗
n be the trades of S0 on blocks 1,...,n. Note that
a′
i = a∗
i for 1 ≤ i ≤ n − 1. Let P0 , sup{P | s0 = s∗(P)}. First, consider
the case
P0 ≤ Pt1 ≤ ··· ≤ Ptn.
Suppose Ptn < P0(1 + φ). By Proposition 22, S0 does not submit any non-
null trades, so the result trivially follows. Now suppose Ptn ≥ P0(1+φ). By
Proposition 22, the only non-null trades S0 submits are buys, and S0 ends
on state s∗

Ptn
1+φ

. Meanwhile, S lands on s∗(P) for some P ≥ Ptn
1+φ. Let q
be a potential function given by Proposition 24. Then
n X
i=1
|ai| −
n X
i=1
|a∗
i | = q

Ptn
1 + φ

− q(P) ≥ 0.
Similarly, if we redefine P0 , inf{P | s0 = s∗(P)} and consider the case
P0 ≥ Pt1 ≥ ··· ≥ Ptn
then either Ptn > P0(1 − φ) in which case S0 does not submit any non-null
trades and the result trivially follows, or Ptn ≤ P0(1−φ) in which case there
is some P ≤ Ptn
1−φ such that
n X
i=1
|ai| −
n X
i=1
|a∗
i | = q(P) − q

Ptn
1 − φ

≥ 0.
Now consider the general where Pt1,...,Ptn are arbitrary. By grouping
together consecutive prices moving in the same direction, we can assume
without loss of generality that the sequence alternates directions with suffi-
ciently large movements, say
Pti
1+φ ≥
Pti−1
1−φ if i has the same parity as n and
Pti
1−φ ≤
Pti−1
1+φ otherwise. Then after block n − 1, S0 is at state s∗
Ptn−1
1−φ

while S is at state s∗(P) for some P ≤
Ptn−1
1−φ , and
n−1 X
i=1
|ai| −
n−1 X
i=1
|a∗
i | ≥ 0.
Since Ptn ≥
Ptn−1
1−φ , after block n, S0 ends at state s∗

Ptn
1+φ

while S ends at
state s∗(P′) for some P′ ≥ Ptn
1+φ. Therefore, by Proposition 24, the additional
25trade submitted by S′
0 is a buy to reach s∗(P′), and
|a′
n| = |a∗
n| + q

Ptn
1 + φ

− q(P′
)
= q

Ptn−1
1 − φ

− q(P′
)
≤ q(P) − q(P′
)
= |an|.
Therefore,
n X
i=1
|a′
i| =
n−1 X
i=1
|a∗
i | + |a′
n| ≤
n X
i=1
|ai|.
## 4.2 Proofs of main results
## 4.2.1 Proof of Theorem 1
Proof. Let S = {S1,...,Sm} be competitive. Since the pool is frictionless,
we may apply Proposition 17 to conclude that
m X
i=1
PNL(Si) ≤ PNL∗
(S0).
Taking the supremum over all complete S yields
MEVpath
m (B) ≤ PNL∗
(S0).
To finish the proof, it suffices to construct a competitive set S of m
trading strategies such that
X
S∈S
PNL(S) = PNL∗
(S0),
since then we have
MEVpath
m (B) ≥
X
S∈S
PNL(S) = PNL∗
(S0).
But this follows immediately from Proposition 16.
264.2.2 Proof of Theorem 3
Proof. For each block n ≥ 1, let Sn be the arbitrage strategy that waits
until block n and then submits a∗(s0,Ptn). The pool is frictionless and
path-independent, so it has a fee of φ = 0 relative to itself, so we can apply
Theorem 5 to conclude that, for tn ≤ t < tn+1,
MEV∗
(B)t = E[PNL∗
(Sn)t].
Since the pool is frictionless, it follows from Lemma 12 that
τ(s0,a∗
(s0,Pt1)···a∗
(sn−1,Ptn) = s∗
(Ptn) = τ(s0,a∗
(s0,Ptn)).
Therefore, it follows from Lemma 18 that
E[PNL∗
(S0)t] = E[PNL∗
(Sn)t] = MEV∗
(B)t.
## 4.2.3 Proof of Theorem 4
Proof. It follows from Proposition 16 that
MEVm(B) ≥ E[PNL∗
(S0)]
so it only remains to prove the other direction. Let S be a competitive set
of strategies. We wish to show
E
"
X
S∈S
PNL(S)
#
≤ E[PNL∗
(S0)].
Since S is competitive, it is covering, so
PNL(S) = PNL∗
(S).
Since PNL is additive and netting trades cannot increase fees, and we are
trying to prove an upper bound on
P
S∈S PNL(S), we may replace the set
with their sum and assume without loss of generality that the set consists
of a single strategy S.
Suppose Π has a fee relative to Π0 with payoff π0, where Π0 is efficient.
Let PNL∗
0 denote uncontested PNL relative to π0, i.e. before fees. Let tn ≤
t < tn+1. Let a1,...,an be the trades of S0. Define a strategy S′
0 to make
the same trades as S0 on blocks 1,...,n − 1, i.e. a∗(si−1,Pti), and on block
27n submit a∗(sn−1,Ptn) composed with a trade such that it ends in the state
τ(s0,a1 ···an) (there always exists such a trade by Proposition 20). Since
the first n−1 trades of S′
0 and S0 are identical, they pass through the same
states in each block, and in block n the strategy S0 makes an optimal trade
compared with S′
0, so
PNL∗
(S′
0)t ≤ PNL∗
(S0)t.
Therefore, it suffices to show that
E[PNL∗
(S)t] ≤ E[PNL∗
(S′
0)t].
Let a∗
1,...,a∗
n be the trades of S′
0. By construction, τ(s0,a1 ···an) =
τ(s0,a∗
1 ···a∗
n), so by Lemma 18 it follows that
E[PNL∗
0(S)t] = E[PNL∗
0(S′
0)t].
Since S is competitive and Π0 is efficient, it trades at least much volume as
S′
0, hence
PNL∗
(S′
0)t − PNL∗
(S)t = PNL∗
0(S′
0)t − PNL∗
0(S)t + φ
n X
i=1
|ai| −
n X
i=1
|a∗
i |
!
≥ PNL∗
0(S′
0)t − PNL∗
0(S)t (Lemma 25)
Therefore
E[PNL∗
(S′
0)t] − E[PNL∗
(S)t] ≥ E[PNL∗
0(S′
0)t] − E[PNL∗
0(S)t] ≥ 0.
## 4.2.4 Proof of Theorem 5
Proof. By definition, E[PNL∗
(Sn)] ≤ MEV∗
(B), so it only remains to prove
the other direction. Let S be a covering set of strategies. Since PNL is
additive and netting trades cannot increase fees, and we are trying to prove
an upper bound on
P
S∈S PNL(S), we may replace the set with their sum
and assume without loss of generality that the set consists of a single strategy
S. Our goal is to prove
E[PNL(S)t] ≤ E[PNL∗
(Sn)t].
Since S is covering,
PNL(S) = PNL∗
(S).
28Suppose the pool Π has fee φ relative to Π0, which is frictionless and path-
independent by hypothesis, and let π0 be the payoff function of Π0. Let
PNL∗
0 denote the uncontested PNL before fees, which is the PNL using π0.
For each block i, let ai be the trade submitted by S on that block, with
π0(ai) = (∆xi,∆yi). Let ∆x =
Pn
i=1 ∆xi and ∆y =
Pn
i=1 ∆yi. Let S′ be
an arbitrage strategy that waits until block n and submits a1 ···an for block
n. By Lemma 19,
E[PNL∗
(S)t] ≤ E[PNL∗
(S′
)t].
Let π0(a∗(s0,Ptn)) = (∆x∗,∆y∗). By optimality of a∗(s0,Ptn) for Π,
PNL∗
(S′
)t = ∆xPtn + ∆y − φ|∆y| ≤ ∆x∗
Ptn + ∆y∗
− φ|∆y∗
| = PNL∗
(Sn)t.
Therefore,
E[PNL(S)t] = E[PNL∗
(S)t] ≤ E[PNL∗
(S′
)t] ≤ E[PNL∗
(Sn)t].
## 4.2.5 Proof of Theorem 6
Proof. Let S0 and S′
0 be the simple arbitrage strategies for B and B′ respec-
tively. In light of Theorem 1 and Corollary 2, it suffices to show that
E[PNL∗
(S0)t] = E[PNL∗
(S′
0)t].
Since the pool is frictionless, both S0 and S′
0 end at the same state s∗(Pt).
Therefore we may apply Lemma 18 to obtain the result immediately.
## 4.2.6 Proof of Theorem 7
Proof. We first prove the equality of MEV∗
. Let S be the arbitrage strategy
that waits until time t and submits a∗(s0,Pt). By Theorem 5,
MEV∗
(B)t = E[PNL∗
(S)t] = MEV∗
(B′
)t.
Next we prove the inequality of MEV. Let S0 and S′
0 be the simple arbi-
trage strategies for B and B′ respectively. Let S be an arbitrage strategy for
B that submits two trades on each block n: the optimal trade a∗(sn−1,Ptn)
and another trade a to land in the same state as S′
0 (such an action a always
exists by Proposition 20). Since S′
0 is competitive, so is S, so by Theorem 4
it follows that
E[PNL∗
(S)] ≤ E[PNL∗
(S0)].
29Therefore it suffices to show that S′
0 is no better than S on average. Since
S′
0 and S end at the same state at each block time of B, it suffices to show
that S′
0 is no better than S on average on each block of B, which consists
of k blocks of B′. This follows immediately from Lemma 19.
## 4.3 Counterexamples
In this section we give counterexamples to show why Theorem 1 has no
analogue in the fee setting, and why Theorem 5, the analogue of Theorem 3,
does not characterize MEV∗
(B) with the single strategy S0.
First, we consider Theorem 1 in the fee setting. Recall that the statement
is an equality of random variables, so the equality holds for all possible price
paths. In the fee setting, the proof breaks down because a pool with fee is no
longer frictionless, i.e. for a given external price P it may have multiple no-
arbitrage states for P. Therefore, there is no guarantee that a competitive
set of strategies passes through the same sequence of states as S0, so it is
possible to construct price paths that reward deviating from the path taken
by S0.
As a simple example, consider a liquidity pool with a linear liquidity
curve: 1 unit per price of liquidity uniformly distributed across all prices.
If the current pool price is p1, it costs
Rp2
p1
pdp = (p2
2 − p2
1)/2 before fees to
buy p2 −p1 units which pushes the pool price to p2. If the fee is φ, then the
total cost would be (p2
2 − p2
1)/2 − φ|p2 − p1|.
Suppose both the external market price and pool price start at P0 = 1
and the fee is φ = 0.01. Now suppose at the next block, the external price
rises to P1 = 100. The simple arbitrage strategy S0 will buy from the pool
until the pool price is 100(1 − φ) = 99, with (∆x,∆y) = (98,−4949) and
therefore a profit of 4851. Consider an alternate competitive strategy S1.
It is required to push the price between 99 and 101. Suppose S1 buys to
push the price to 101, with (∆x,∆y) = (100,−5151), for a total profit of
4849. Now suppose in the subsequent block the external price drops all
the way back down to P2 = 1. S0 starts with a pool price of 99 and must
sell until it is 1.01, with (∆x,∆y) = (−97.99,4850.99) and a profit of 4753,
while S1 starts with a pool price of 101 and can also sell until it is 1.01,
with (∆x,∆y) = (−99.99,5048.99) and a profit of 4949. So S1 loses to S0
by 2 on the first block but beats by nearly 200 on the second block! This
is because they pushed the pool price beyond the optimal price in the first
block at a very low cost, and then when the external price dropped down S1
was able to monetize those two extra units it bought at a value of nearly 100
each. If the price repeatedly alternates between 1 and 100 or any two prices
30sufficiently far from each other, then S1 can outerpform S0 by an arbitrarily
large amount.
Next, we turn to looking at the difference between Theorem 3 and Theorem 5,
which concern noncompetitive MEV, i.e. how much expected value can be
captured if one is free to defer profit without worrying about others tak-
ing it. The former essentially says that in the frictionless setting, greedily
optimizing profit every block also optimizes total profit across blocks on av-
erage, assuming the price is a martingale. This cannot be extended to the
fee setting for a simple reason: Theorem 7. When there are fees, it is always
better to wait n blocks and do one optimal trade than to do an optimal
trade at each intermediate block.
## 5 Generalizations
## 5.1 Multiple liquidity pools
The formalism in Section 2 easily handles multiple liquidity pools. The idea
is that multiple liquidity pools can be viewed as a single liquidity pool.
Definition 20 (Product of liquidity pools). Let
Π1 = (Σ1,A1,{As}s∈Σ1,τ1,π1,s1,0)
Π2 = (Σ2,A2,{As}s∈Σ2,τ2,π2,s2,0)
be two liquidity pools. The product Π1 ×Π2 of Π1 and Π2 is defined to be
the liquidity pool (Σ,A,{As}s∈Σ,τ,π,s0) defined by
• Σ = Σ1 × Σ2;
• A = A1 × A2;
• If (s1,s2) ∈ Σ, then (a1,a2) ∈ A(s1,s2) if and only if a1 ∈ As1 and
a2 ∈ As2.
• τ((s1,s2),(a1,a2)) = (τ1(s1,a1),τ2(s2,a2)) for every (s1,s2) ∈ Σ and
(a1,a2) ∈ A.
• π((a1,a2)) = π1(a1) + π2(a2) for every (a1,a2) ∈ A.
• s0 = (s1,0,s2,0).
Conceptually, Π1 × Π2 just represents having both liquidity pools side
by side, where the admissible actions are either simultaneously applying
31admissible actions on each pool, or only apply an admissible action on one
of the pools. We show that the product satisfies the axioms if each of the
constituents does, which demonstrates that we may assume without loss of
generality that there is just a single liquidity pool for the asset x.
Proposition 26. If Π1 and Π2 are liquidity pools satisfying the axioms of
Assumption 3, then so is their product Π1 × Π2.
Proof. We first verify the liquidity pool axioms for Π1 × Π2:
• (Null action): Let ⊥1 and ⊥2 be the respective null actions of Π1 and
Π2. It is easily verified that ⊥ = (⊥1,⊥2) is a null action of Π1 × Π2.
• (Composition of actions): If (a1,a2),(a′
1,a′
2) ∈ A∗, define their com-
position to be (a1a′
1,a2a′
2). It is easily verified that this composition
law satisfies the required property.
• (Optimal action): Let s = (s1,s2) ∈ Σ and let P be the external
price of asset x. Let a∗
1 = a∗
1(s1,P) ∈ As1 and a∗
2 = a∗
2(s2,P) ∈ As2
be optimal actions for Π1 and Π2 respectively, with respective payoffs
(∆x∗
1,∆y∗
1) and (∆x∗
2,∆y∗
2). Define a∗(s,P) = (a∗
1(s1,P),a∗
2(s2,P)) ∈
As, which has payoff (∆x∗
1 + ∆x∗
2,∆y∗
1 + ∆y∗
2). Let a = (a1,a2) ∈ A
and suppose π1(a1) = (∆x1,∆y1) and π2(a2) = (∆x2,∆y2), so π(a) =
(∆x1 + ∆x2,∆y1 + ∆y2). By the optimality of a∗
1 and a∗
2,
∆x1P + ∆y1 ≤ ∆x∗
1P + ∆y∗
1
∆x2P + ∆y2 ≤ ∆x∗
2P + ∆y∗
2.
Therefore
(∆x1 + ∆x2)P + (∆y1 + ∆y2) ≤ (∆x∗
1 + ∆x∗
2)P + (∆y∗
1 + ∆y∗
2)
so a is optimal.
This completes the verification that Π1 × Π2 satisfies the liquidity pool ax-
ioms.
The next two results show that the frictionless and path-independent
properties are preserved by the product operation.
Proposition 27. If Π1 and Π2 are frictionless, then so is Π1 × Π2.
32Proof. Let P be the external price of the asset x. Let s∗
1(P) and s∗
2(P)
be the no-arbitrage states of Π1 and Π2 respectively. Define s∗(P) =
(s∗
1(P),s∗
2(P)). Suppose a = (a1,a2) ∈ As∗(P) where π1(a1) = (∆x1,∆y1)
and π2(a2) = (∆x2,∆y2). Since s∗
1(P) and s∗
2(P) are no-arbitrage states,
(∆x1 + ∆x2)P + (∆y1 + ∆y2) = (∆x1P + ∆y1) + (∆x2P + ∆y2) ≤ 0,
therefore s∗(P) is a no-arbitrage state. It only remains to show that s∗(P)
is unique. Let s = (s1,s2) ∈ Σ be a different state, s 6= s∗(P). Without loss
of generality, suppose s1 6= s∗
1(P). Then s1 is not a no-arbitrage state since
s∗
1(P) is unique, so there exists a1 ∈ As1 with π1(a) = (∆x,∆y) such that
∆xP + ∆y > 0. Then the action a = (a1,⊥2) ∈ As has π(a) = (∆x,∆y)
and therefore ∆xP + ∆y > 0. Therefore s is not a no-arbitrage state.
Proposition 28. If Π1 and Π2 are path-independent, then so is Π1 × Π2.
Proof. Let s = (s1,s2) ∈ Σ. Suppose a = (a1,a2) and a′ = (a′
1,a′
2) are
actions such that τ(s,a) = τ(s,a′). Unrolling Definition 20, this means
(τ1(s1,a1),τ2(s2,a2)) = τ(s,a) = τ(s,a′
) = (τ1(s1,a′
1),τ2(s2,a′
2))
so τ1(s1,a1) = τ1(s1,a′
1) and τ2(s2,a2) = τ2(s2,a′
2). Since Π1 and Π2 are
path-independent, this implies that π1(a1) = π1(a′
1) and π2(a2) = π2(a′
2).
Therefore,
π(a) = π1(a1) + π2(a2) = π1(a′
1) + π2(a′
2) = π(a′
).
It follows from Proposition 27 and Proposition 28 that any statement
that holds for frictionless or path-independent pools holds for products
of such pools, and in particular Theorem 1, Corollary 2, Theorem 3, and
Theorem 6 all hold for multiple pools.
Extending the results in the fee setting is less automatic. The product of
two efficient pools is not necessarily efficient. In fact, it almost certainly is
not, because cross-exchange arbitrages are possible. Moreover, mutiple pools
may have distinct fee rates. However, our results still hold for products of
pools with fees relative to efficient, frictionless, path-independent pools. It
follows from the following definition and result.
Definition 21 (Product of trading strategies). Let Π1 and Π2 be liquidity
pools, and let S1 and S2 be trading strategies that trade on Π1 and Π2 re-
spectively. The product of S1 and S2, denoted by S1 × S2, is the strategy
33whose position is given by the sum of the positions and on each block it sub-
mits (a1,b1),...,(an,bn), if S1 submits a1,...,an and S2 submits b1,...,bn
(we may assume they submit the same number of trades by padding with
⊥).
Proposition 29. Let Π1 and Π2 be liquidity pools with product Π = Π1×Π2.
Let S be a trading strategy trading on Π. Then S can be decomposed into a
product of strategies S = S1 × S2 such that S1 trades on Π1 and S2 trades
on Π2, and
PNL(S) = PNL(S1) + PNL(S2).
Proof. For any two strategies S1 and S2, it follows from π((a1,a2)) =
π1(a1) + π2(a2) that
PNL(S1 × S2) = PNL(S1) + PNL(S2).
So it only remains to show that we can decompose S into a product. Each
on-chain trade submitted by S takes the form (a1,a2) ∈ A∗
1 × A∗
2, For each
such trade submitted by S, we define S1 to submit the trade a1 and S2 to
submit the trade a2. For the positions of S1 and S2, we can arbitrarily split
the position of S. Then S = S1 × S2.
Each pool with fee satisfies the liquidity pool axioms, by Corollary 23, so
by Proposition 26 their product does as well. Therefore the simple arbitrage
strategy S0 is well-defined for the product. From Proposition 29, it follows
that S0 can be decomposed into strategies on each pool in the product,
and moreover from the proof of the decomposition and the definition of the
product’s optimal action, we see that S0 can be decomposed into a product
of simple arbitrage strategies on each pool. Furthermore, it follows from
Proposition 29 that
MEV(BΠ1×Π2) = MEV(BΠ1) + MEV(BΠ2)
and similarly for MEV∗
. Therefore Theorem 4, Theorem 5, and Theorem 7
extend to a product of pools each with a fee relative to some efficient, fric-
tionless, path-independent pool.
## 5.2 Multiple risky assets
To extend our results to multiple assets, we must generalize our definitions
and verify that our intermediate results still hold or are even well-defined.
If we have n assets, none of which are the numéraire, we denote the position
34by a vector x ∈ Rn and external market prices by a vector P ∈ Rn
+. Then
all instances of xP + y generalize to x⊤P + y. Payoff functions generalize
to π : A∗ → Rn+1. The results in the frictionless setting easily follow in the
general setting.
It is less clear how to generalize the definitions of volume (Definition 7)
and therefore fees (Definition 8), as well as the results on efficient pools
(Section 4.1.4), which assume the payoff of each action only involves two
assets, one of which is the numéraire y, and therefore the results in the fee
setting.
The definitions and results can be generalized as follows. We (arbitrarily)
order the assets
x1 ≺ ··· ≺ xn ≺ xn+1 = y.
We assume that each efficient pool only involves two assets xi,xj where
i < j. We define the volume of an action a ∈ A∗ to be a vector |a| ∈ Rn+1
as follows: If a ∈ A is atomic, then
π(a) = (0,...,∆xi,0,...,∆xj,0,...,0) =⇒ |a| = (0,...,|∆xj|,0,...,0)
where π(a) has entries ∆xi and ∆xj in the ith and jth coordinates respec-
tively and zero elsewhere, and |a| has |∆xj| in the jth coordinate and zero
elsewhere. If a = a1a2 is a composition, then |a| = |a1| + |a2| as before.
Then we may define a pool with fee even more succinctly than before with
π(a) = π0(a) − φ|a|.
Then all of the results in Section 4.1.4 still hold if we replace external market
price P with the ratio of external market prices Pi/Pj.
## 6 Examples of liquidity pools
In this section we show that a wide range of AMMs satisfy the liquidity pool
axioms of Assumption 3, and furthermore have frictionless underlying pools
that are also path-independent and efficient.
## 6.1 Constant function market makers
We show that under mild assumptions about the invariant, a CFMM without
fees satisfies the liquidity pool axioms and is frictionless, path-independent,
and efficient. Suppose the invariant of the CFMM is given by
f(x,y) = L
35for some fixed L ∈ R. This defines a curve Σ ⊆ R2
+ which can be the state
space. The atomic actions are (∆x,∆y), with transition function
τ((x,y),(∆x,∆y)) = (x − ∆x,y − ∆x).
The action (∆x,∆y) is admissible with respect to (x,y) if and only if
f(x − ∆x,y − ∆y) = f(x,y).
The payoff function π is just the identity on R2.
We can model this as a liquidity pool as follows. The state space is simply
R2
+, with the asset reserves (x,y) as the state. The action space is simply
R2, with each action (∆x,∆y) representing the transfer of assets to the
trader, with the payoff function π being the identity function. The transition
function is τ((x,y),(∆x,∆y)) = (x − ∆x,y − ∆y). If we wish to model
a trading fee, then the transition function would be τ((x,y),(∆x,∆y)) =
(x − ∆x′,y − ∆y′) where ∆x′ and ∆y′ represent the amounts with the fee
added in the appropriate asset depending on which quantity is negative.
Then (∆x,∆y) is admissible if and only if f(x − ∆x′,y − ∆y′) = L.
The null action axiom is satisfied by (0,0). Composition of actions is
defined by addition and can be seen to satisfy the composition axiom. We
will show the optimal action exists by first showing that such a pool is
frictionless.
A state (x,y) is a no-arbitrage state for external price P if and only if
the line with slope −P through (x,y) is tangent to Σ. Suppose the gradient
∇f = (∂xf,∂yf) is defined and continuous almost everywhere on Σ. Then
the vector (−∂yf,∂xf) is tangent to Σ at (x,y) and so (x,y) is a no-arbitrage
state if −∂xf
∂yf = P. The optimal action is the one that brings the state to the
state that satisfies this. If ∂xf
∂yf restricted to Σ is a bijection with R+, then
the pool is frictionless and efficient. Path-independence is easily verified.
An application of this is to constant product market makers such as
Uniswap V2. For constant product markets, f(x,y) = xy, so (x,y) is a
no-arbitrage state for P if and only if y/x = P.
The StableSwap invariant implemented by Curve v1 stablecoin pools
([Ego19]) can also be shown to satisfy these properties, being an interpola-
tion between constant sum and constant product markets.
Note that constant sum markets themselves do not satisfy the liquidity
axioms.
366.2 Uniswap v3
Uniswap v3 ([AZS+21]) offers an innovation over constant product market
makers like Uniswap v2 and CFMMs in general by supporting concentrated
liquidity, allowing liquidity providers to specify a price band in which to
concentrate their liquidity, as opposed to spreading it out across the entire
price range of (0,∞) as in CFMMs. This allows for greater capital efficiency,
and as a result Uniswap v3 pools are the most actively traded AMMs on
Ethereum and DeFi in general.
The state space of Uniswap V3 is parameterized by the pool price p and
consists of several translated copies of Uniswap V2 states stitched together,
each copy representing a price band [pa,pb). An action either takes the state
to another point on the same Uniswap V2 curve or crosses into another
band. One can verify that Uniswap V3 without fees satisfies the liquidity
pool axioms and is frictionless, path-independent, and efficient.
## 7 Discussion and Open Questions
We have shown that an risk-neutral arbitrage-centric measure of MEV is
invariant to some classes of transformations to a blockchain protocol de-
sign, namely ordering mechanisms and block times, assuming the liquidity
resides in protocols satisfying our liquidity pool axioms, that block times
are deterministic, and that liquidity providers are passive.
One consequence of this theoretical result is that certain ordering mecha-
nisms, such as giving a trader guaranteed priority in a block or even exclusive
access, do not change the overall profit that can be extracted, even if cou-
pled with mechanisms that effectively decrease the time between blocks for
the trader. Another corollary is that even given such a benefit, the simple
arbitrage strategy optimally extracts the value of that benefit.
An interesting line of further work is to consider measures of value other
than pure risk-neutral dollar profit. For example, traders may have different
risk preferences, and different ordering mechanisms or block time distribu-
tions may increase the overall utility if not the overall dollar profit amount.
Another interesting direction is to extend our formalism to include DEXs
that do not satisfy our current liquidity pool axioms, even in the absence of
liquidity provider actions, e.g. pools whose state changes from price oracles,
whether external or internal, such as Curve v2 crypto pools ([Ego21]).
Another question that is interesting purely theoretically is the invariance
of MEV when block times are not deterministic, but follow a Poisson point
process as in blockchains that use a PoW consensus protocol.
378 Acknowledgements
We thank Lucas Baker, Jeff Bezaire, Christopher Chung, Jennifer Pan, and
Michael Setrin, Nihar Shah, and Anirudh Suresh for helpful conversations,
inspiration, and feedback.
References
[AZR20] Hayden Adams, Noah Zinsmeister, Dan Robinson. Uniswap v2
core. 2020.
[AZS+21] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer,
Dan Robinson. Uniswap v3 core. 2021.
[AC20] Guillermo Angeris, Tarun Chitra. Improved Price Oracles: Con-
stant Function Market Makers. 2020.
[AKC+19] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie
Noyes, Tarun Chitra. An analysis of Uniswap markets.
arXiv:1911.03380, 2019.
[Cla20] Joseph Clark. The replicating portfolio of a constant product
market. Available at SSRN 3550601, 2020.
[DGK+19] Philip Daian, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan
Zhao, Iddo Bentov, Lorenz Breidenbach, Ari Juels. Flash Boys
2.0: Frontrunning, Transaction Reordering, and Consensus In-
stability in Decentralized Exchanges. arXiv:1904.05234, 2019.
[Ego19] Michael Egorov. StableSwap - efficient mechanism for Stablecoin
liquidity. 2019.
[Ego21] Michael Egorov. Automatic market-making with dynamic peg.
2021.
[KDC22] Kshitij Kulkarni, Theo Diamandis, Tarun Chitra. Towards a
Theory of Maximal Extractable Value I: Constant Function
Market Makers. arXiv:2207.11835, 2022.
[MMRZ22] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, An-
thony Lee Zhang. Automated Market Making and Loss-Versus-
Rebalancing. arXiv:2208.060246, 2022.
38[ZCP18] Yi Zhang, Xiaohong Chen, Daejun Park. Formal Specification
of Constant Product (x × y = k) Market Maker Model and
Implementation. 2018.
39