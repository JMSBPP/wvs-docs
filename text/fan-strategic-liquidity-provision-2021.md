---
sha256: 4579e21c4e2a20c1dbfa170a8028ba7acf0419be7c2066dd4d969bcfaf91ee47
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 80731
---
Strategic Liquidity Provision in Uniswap v3
Zhou Fan #
Harvard University, USA
Francisco Marmolejo-Cossio #
Harvard University, USA
IOG, USA
Daniel Moroz #
Harvard University, USA
Michael Neuder #
Harvard University, USA
Rithvik Rao #
Harvard University, USA
David C. Parkes #
Harvard University, USA
Abstract
Uniswap v3 is the largest decentralized exchange for digital currencies, and allows a liquidity provider
(LP) to allocate liquidity to one or more closed intervals of the price of an asset. An LP earns fee
rewards proportional to the amount of its liquidity allocation when prices move in this interval. This
induces the problem of strategic liquidity provision: smaller intervals result in higher concentration of
liquidity and correspondingly larger fees when the price remains in the interval, but with higher risk
as prices may exit the interval leaving the LP with no fee rewards. Although reallocating liquidity
to new intervals can mitigate this loss, it comes at a cost, as LPs must expend gas fees to do so.
We formalize the dynamic liquidity provision problem, and focus on a general class of strategies for
which we provide a neural network-based optimization framework for maximizing LP earnings. We
model a single LP that faces an exogenous sequence of price changes that arise from arbitrage and
non-arbitrage trades in the decentralized exchange. We present experimental results informed by
historical price data that demonstrate large improvements in LP earnings over existing allocation
strategy baselines. Moreover we provide insight into qualitative differences in optimal LP behavior
in different economic environments.
2012 ACM Subject Classification Computing methodologies → Modeling methodologies; Computing
methodologies → Neural networks
Keywords and phrases blockchain, decentralized finance, Uniswap v3, liquidity provision, stochastic
gradient descent
Acknowledgements This work is supported in part by two generous gifts to the Center for Research
on Computation and Society at Harvard University, both made to support research on applied
cryptography and society.
## 1 Introduction
Decentralized finance (DeFi) is a large and rapidly growing collection of projects in the
cryptocurrency and blockchain ecosystem. From May 2019 to May 2023, the TVL (total
value locked, meaning the sum of all liquidity provided to the protocol) into DeFi protocols
has increased 100x from 500 million USD to 50 billion USD. During this time period, TVL
rapidly increased in 2021, reaching a peak of roughly 176 billion USD in November 2021, but
arXiv:2106.12033v5 [cs.CR] 16 Aug 20242 Strategic Liquidity Provision in Uniswap v3
it also suffered large drops in 2022 leading to current TVL levels.1
DeFi aims to provide the function of financial intermediaries and instruments through
smart contracts executed on blockchains (typically Ethereum). The importance of decentral-
ized exchanges (DEXes) is that traders can swap tokens of different types without a trusted
intermediary. Most DEXes, including Uniswap, fall into the category of constant function
market makers (CFMMs). Instead of using an order book as is done in traditional exchanges,
CFMMs are smart contracts that use an automated market maker (AMM) to determine the
price of a trade.
In Uniswap v2, token pairs can be swapped for each other using liquidity pools, which
contain quantities of each of the pair of tokens (say, token A and token B). Uniswap v3,
which launched on Ethereum on May 3, 2021, introduced concentrated liquidity [3], where an
LP can provide liquidity to each of any number of price intervals, these called positions.
As a result, Uniswap v3 supports a diversity of LP strategies in regard to the allocation
of liquidity, as an LP can mint multiple positions, each on a different interval. Each LP is
presented with a tradeoff between choosing large positions that cover many possible prices
but earn less fees and smaller more concentrated positions that are more risky (since they
cover fewer prices). Additionally, an LP can reallocate its liquidity as prices change, but this
comes at two costs. First, an LP may need to trade between assets to mint new liquidity
positions in a reallocation, potentially suffering losses from slippage in such trades. Second,
since liquidity allocations are transactions that must be written as updates to the contract
and included in a block, they also incur gas fees. Both of these costs must be incorporated
in more complex LP strategies that make use of liquidity reallocation.
Given the increased complexity for LPs in v3, it is important to understand the ways LPs
can benefit from strategically allocating liquidity as prices change, as this ultimately impacts
the performance of v3 contracts as DEXs. This paper develops optimal liquidity provision
strategies, that make use of liquidity reallocations and the full complexity of v3 positions.
As in [14], we adopt the perspective of an LP with stochastic beliefs over how market prices
evolve, and how contract prices may change along with market prices via arbitrage and
non-arbitrage trades. We also make the same assumption as there, namely that the LP is
small enough that these beliefs are independent of capital allocated by the LP. Given this,
we provide a new optimization framework for computing optimal dynamic liquidity provision
strategies over a given time horizon, and show that such strategies can provide large gains to
LPs over strategies that are static or dynamic but with simple liquidity positions.
Contributions. We define dynamic liquidity provision strategies, as a means by which
LPs can mitigate potential losses by using earned capital to reallocate liquidity to different
price intervals in a given time horizon. In particular, we focus on the family of τ-reset
strategies, which allocate over an interval of prices centered on the current price and whose
width is controlled by τ (including the possibility of declining to allocate liquidity) and
reallocate whenever the price moves outside this interval. Moreover, within the space of
dynamic liquidity provision strategies, we distinguish between those that are context-aware
and context-independent, which depends on whether they incorporate historical price and
contract information in their decision-making or not.
We develop the use of stochastic optimization for optimizing over the space of τ-reset
strategies, considering an LP with stochastic beliefs on market and contract prices, and with
different levels of risk-aversion. We give empirical results based on historical Ethereum price
1
https://defillama.com/Z. Fan et al. 3
data which show that our dynamic allocation strategies (which forcibly incorporate LP beliefs
on price changes) give rise to large gains in LP earnings relative to baseline uniform allocation
strategies (similar in nature to liquidity allocation in Uniswap v2). As expected, we see the
best performance for context-aware allocation strategies, for which we make use of a neural
network representation of an investment strategy. In addition, our results provide insight into
how optimal LP behavior varies depending on relevant aspects of the economic environment.
In particular, we find that more risk-averse LPs spread their liquidity over larger price ranges,
especially when faced with a larger volume of non-arbitrage trades. In addition we also find
that, as expected, optimal reset frequencies are sensitive to the reallocation costs.
## 1.1 Related work
The Uniswap v1 protocol was defined by [1], followed up with v2 by [2], and most recently
amended in v3 by [3]. There has been a growing body of work studying LP incentives in
Uniswap v2. [6] present an analysis of Uniswap, and more broadly of constant-product
AMMs, and demonstrate conditions for which the markets closely track the price on an
external reference market. [4] extend this line of research by demonstrating that the more
general class of CFMMs incentivize participants to report the true price of an asset on an
external market, demonstrating their value as price oracles.
[7] study the equilibrium liquidity provision of constant product AMMs, and show that
strategic LPs in the Uniswap v2 environment may have a non-monotonic best response when
parameterized with the opponents’ liquidity provision. [5] extend this line of work to CFMMs
and calculate bounds on the LP rewards based on the curve that defines the CFMM. [10]
studies the adopation of decentralized exchanges more generally, using a sequential game
framework to model interactions between LPs and traders. In addition, [23] and [15] provide
an axiomatic framework for general CFMMs similar in nature to Uniswap v2, with the
latter focusing on connections with CFMMs in the prediction market setting. [12] consider
geometric mean market makers (G3Ms), and show that passive liquidity provision can be
used to replicate payoffs of financial derivatives and more active trading strategies. [24] and
[25] analyze the growth in wealth of an LP in CFMM for a geometric Brownian motion price
process. [13] extend this to more general LP objectives and diffusion processes.
All above work applies to Uniswap v2 and similarly structured CFMMs but not to v3.
An early blog post by [18] describes a “passive rebalancing” strategy for v3, which aims at
maintaining a 50-50 ratio of value for the assets of the LP. Most relevant to the present work,
and also studying Uniswap v3, are the two papers, [11, 14], the first of which provides insight
into how LPs can profit from liquidity reallocations with simple positions, and the second
of which focuses on how LPs can profit from complicated static liquidity positions over a
given time horizon.2
In more detail, the authors of [11] provide a closed form solution for
computing optimal LP allocations that dynamically readjust positions to different intervals
as prices evolve over time. Though these strategies make use of dynamic reallocation of
liquidity, the only allocations explored in the optimization are individual v3 positions over
a single price range (which forcibly change at each reallocation) instead of the full class of
potential allocations available to an LP in Uniswap v3. The authors of [14] compute optimal
arbitrary v3 positions for small LPs who seek to maximize profit and loss over a fixed time
horizon, but only consider static LP strategies which do not make use of reallocations as
prices change.
2
Both of these papers were written after the first version of the present paper [21]4 Strategic Liquidity Provision in Uniswap v3
Further related work on v3 includes [20], who decompose divergence/impermanent loss
into hedgeable market risk and profit made by arbitrage traders at a loss to the exchange.
(This is related to [11], who decompose divergence/impermanent loss into two components:
the loss due to arbitrage (convexity cost) and the cost of locking capital). [9] uses regret-
minimization from online learning to provide liquidity provision strategies under adversarial
trading. [19] and [16] study the construction of optimal CFMMs frwom the perspective of LP
beliefs, with the latter providing a Myersonian framework for creating incentive compatible
AMMs, and the former employing techniques from convex optimization to determine optimal
trading functions based on LP beliefs on future trades. [17] study the risks inherent to LP
returns for multiple fixed strategies in different economic environments, concluding that
liquidity provision in v3 is a sophisticated game where uninformed retail traders can suffer
large disadvantages relative to more informed agents. In addition to studying optimal static
liquidity provision, [14] provide insights on how aspects of a v3 contract, notably the partition
of price space, have implications on LP profit as well as gas fees incurred by traders.
## 1.2 Background on Uniswap v2 and v3
Permitted trades in Uniswap v2 are determined by the reserve curve, xy = L2
, where x and
y denote the the number of tokens of type A and B respectively in the liquidity pool, and
the value of L must be maintained across a trade. Liquidity providers (LPs) add tokens to
liquidity pools for the traders to swap against, and are rewarded through the fees traders
pay. An illustrative reserve curve is shown in Figure 1. Assuming that the v2 contract holds
x units of token A and y units of token B with xy = L2
, then in order to sell some quantity
∆x > 0 of token A for some quantity ∆y > 0 of token B, the trader must keep the product
of reserves constant, with ∆y such that (x − ∆x)(y + ∆y) = L2
. This defines an effective
contract price for token A in units of token B, i.e., P = −dy/dx. In the context of the
xy = L2
curve, we have y = L2
/x =⇒ P = L2
/x2
= y/x. By convention, we take the
contract price to be the price of token A, which we may assume is volatile relative to token
B. In Uniswap v2, traders pay LPs a fee of 0.3% of the transaction amount in return for
using the liquidity to execute a swap [2]. In v2, the liquidity of every LP can be used for
swaps at every possible price P ∈ (0,∞), and an LP earns fees based on their fraction of the
total liquidity in the pool.
Considering Uniswap v3, the liquidity allocated by an LP to position [Pa,Pb] earns fees
when the contract price is in that interval. If multiple LPs allocate liquidity over an interval
containing the current price, each is rewarded proportionally to the fraction of the liquidity
they own at that price. Figure 2 visualizes the functional invariant respected by the overall
assets provided by LPs to support trades over [Pa,Pb]. For trades in this interval, a v3
contract effectively shifts the reserve curve of Uniswap v2 via an affine transformation to
intercept the axes at a and b, which depend on the end points of interval [Pa,Pb]. This shifted
curve is governed by the equation: x + L/
√
Pb

y + L
√
Pa

= L2
, and the intercepts, a and
b, can be calculated by letting x or y equal zero respectively [3] . This description of Uniswap
v3 is inherently local, as it describes trade dynamics for a specific price interval. Gluing the
local dynamics together for all prices gives rise to an aggregate reserve curve that governs
arbitrary trades across all possible prices. This global reserve curve is in turn a function of
the aggregate distribution of liquidity provided by all LPs. From the perspective of traders,
when more liquidity is allocated to a given price interval, there is less trade slippage for
prices in that interval. This reduced slippage corresponds to a flatter section of the aggregate
reserve curve, as visualized in Figure 3.Z. Fan et al. 5
(x,y)
(x′
,y′
)
∆x
∆y
Token A reserves (x)
Token B reserves (y)
Figure 1 The reserve curve for Uniswap v2. If the pool has reserves (x,y) where x and y represent
units of token A and B respectively, then the contract price of token A is P = y/x. A trader can
send ∆x units of token A to receive ∆y units of token B, such that x′
y′
= L2
, where x′
= x + ∆x
and y′
= y − ∆y. The contract price of token A after the trade is P′
= y′
/x′
.
## 1.3 Outline
Section 2 introduces the Uniswap v3 protocol. Section 3 formalizes the earnings to an LP
from a dynamic liquidity provision strategy and introduces the family of τ-reset strategies.
Section 4 introduces the computational methods for optimizing over τ-reset strategies and
specifically defines the context-aware/independent dynamic liquidity strategies we empirically
study as well as simple baselines to which we compare performance. Section 5 provides
details regarding the economic environments we modulate to study optimal LP behavior,
and Section 6 presents empirical results. Section 7 gives open problems for future research
and concludes.
## 2 The Mechanics of Uniswap
In this section, we provide a brief overview of Uniswap v3 contracts. In all that follows, we
consider a v3 contract that enables trades between two types of tokens that we designate
token A and token B. Furthermore, without loss of generality, we assume token B is the
numeraire, hence when we refer to the price in the contract, we refer to the price of a unit
of A in terms of B. As mentioned in the introduction, liquidity providers (LPs) provide
bundles of A and B tokens to the contract as liquidity to be traded against. The following
sections largely follow the mathematical formalism of [14], to which we refer the reader for
more in-depth details regarding Uniswap v2 and v3 contract dynamics.
2.1 v3 Contracts
Partitioned Price Space
In Uniswap v2 contracts, the liquidity that LPs provide is used to support every trade,
whatever the trade price. Uniswap v3 contracts provide a richer set of actions for an LP,
where they can specify a price range where liquidity is to be used for trading. In order to
enable this functionality, a v3 contract partitions token A prices into a finite set of price
buckets: µ = {B−m,...,B0,...,Bn} with buckets Bi = [ai,bi]. We also require a0 < 1 < b0,
so that the parity price lies in the 0-th bucket, and that bi = ai+1 for i ∈ {−m,...,n − 1}.6 Strategic Liquidity Provision in Uniswap v3
Pb
Pa
b
a
Token A reserves (x)
Token B reserves (y)
v2
v3
Figure 2 The reserve curve of Uniswap v2 over all prices, and of Uniswap v3 over the price
interval [Pa,Pb]. When trades give rise to contract prices in this interval, LP assets are swapped
according to the v3 curve, which is an affine transformation of the v2 curve and defined to respect
the price limits of interval [Pa,Pb].
Price
Aggregate Liquidity
0 1 ∞
Token A reserves (x)
Token B reserves (y)
v2
v3
Figure 3 An aggregate distribution of liquidity for a Uniswap v3 contract (left plot), with most
liquidity allocated close to unit price P = 1. This results in an aggregate reserve curve (right, red
line), which is flatter than the corresponding v2 curve (dotted blue) at prices close to P = 1 and
supports a larger volume of trades at these prices with less slippage.
Contract Price
A v3 contract maintains the contract price of token A, P ∈ (0,∞). This is the infinitesimal
price that traders obtain for trading with the contract.
Minting and Burning Liquidity
LPs provide (or mint) liquidity in a particular bucket, Bi = [ai,bi], referred to as Bi-liquidity,
by sending a bundle of A and B tokens to the contract. The token bundle required to mint L
units of Bi-liquidity is given by the liquidity value function [14], and is tuple V(3)
(L,P,Bi),
where the first component is the quantity in token A and the second is the quantity in token
B. For a < b, let ∆x
b,a = 1 √
a
− 1 √
b
and ∆y
a,b =
√
b −
√
a.
▶ Definition 1 (Bi-Liquidity Value [14]). For contract price P, bucket Bi = [ai,bi], andZ. Fan et al. 7
number of units L > 0, the bundle liquidity value V(3)
(L,P,Bi) ∈ R+
× R+
is defined as
V(3)
(L,P,Bi) =

 
 
(L∆x
bi,ai
,0) if P < ai,
(0,L∆y
ai,bi
) if P > bi, or
(L∆x
bi,P ,L∆y
ai,P ) if P ∈ Bi,
(1)
and specifies the bundle of A and B tokens, respectively, to mint L units of Bi-liquidity.
LPs can also remove liquidity they have a claim to from the contract by means of the value
function. When this happens, we say that an LP burns L units of Bi liquidity, and the LP
receives token bundle V(3)
(L,P,Bi) if the contract price is P. Since V(3)
is linear in L, we
also adopt shorthand V(3)
(P,Bi) = V(3)
(1,P,Bi) for the token bundle value of a single unit
of liquidity, with V(3)
(L,P,Bi) = L · V(3)
(P,Bi).
Contract State
The contract price P and the collective set of minted liquidity allocations of all LPs denotes
the state of a v3 contract. As shown in [14] (Section 2.2.3) we can simplify the set of potential
states the contract can take by making two minor assumptions regarding LPs:
1. Every LP allocates liquidity to a single bucket from µ, and
2. Every bucket from µ has liquidity allocated by at least one LP.
In regard to the first assumption, Uniswap v3 contracts actually allow an LP to mint
positions over multiple contiguous buckets, such as minting a position worth L units of
liquidity over the price interval [ai,bj] where i < j. However, this is equivalent to minting
positions worth L units of liquidity for each bucket in {Bi,...,Bj}. With regards to the
second assumption, it can indeed be the case that no LP allocates liquidity to a given bucket,
however in practice contract prices do not reach buckets without liquidity. Indeed most
liquidity is allocated to multiple buckets around contract prices.3
Moreover, trade dynamics
when prices reach buckets with no liquidity can be approximated by the dynamics that occur
when the bucket has an infinitesimal amount of liquidity.
Given the assumptions, at any given moment there are (a variable) number, d ≥ n+m+1,
of LPs providing liquidity to the contract. Furthermore, we let σ : [d] → {−m,...,0,...,n}
and L = (L1,...,Ld) be such that the j-th LP has minted Lj units of Bσ(j)-liquidity. We
call (σ,L) the allocation profile and use this to define the contract state.
▶ Definition 2 (Contract state). Given contract price P and allocation profile (σ,L), the
state of a v3 contract is S = (P,σ,L).
As we have seen above, LPs can change the contract state by minting and burning
liquidity. Traders alter the contract state by changing the contract price P.
Trading and Fees
Suppose P does not lie on the boundary of any bucket, and refer to the bucket in which it
is contained as the active bucket, with index i∗
∈ {−m,...,n}. The LPs who have minted
liquidity in Bi∗ are the active LPs, and the sum of their liquidity in this bucket is the
active liquidity, L∗
=
P
j∈σ−1(i∗) Lj. Let V(3)
(L∗
,P,Bi∗ ) = (x∗
,y∗
) denote the active token
bundle. Let γ ∈ (0,1) denote the fee rate of the contract, which specifies what portion of
3
https://info.uniswap.org/home#/pools/8 Strategic Liquidity Provision in Uniswap v3
b∗
i
a∗
i
P
ȳ
x̄
y∗
x∗
Token A reserves (x)
Token B reserves (y)
v2
v3
Figure 4 Visualization for trade dynamics in an active bucket given by B∗
i = [a∗
i ,b∗
i ]. The
blue curve is given by xy = (L∗
)2
, where L∗
is the active liquidity in B∗
i . The contract price, P,
corresponds to the active bundle (x∗
,y∗
). The upper bound on the amount of token A which can be
present in an active bundle for B∗
i is given by x̄. Similarly, the upper bound on the amount of token
B which can be present in an active bundle for B∗
i is given by ȳ.
trades are skimmed as fees for LPs (Uniswap v3 contracts have three potential fee rates,
γ ∈ {0.0005,0.003,0.01}). Since P lies in the interior of Bi∗ , we have a∗
i < P < b∗
i . We
let x̄ = (V(3)
(L∗
,bi∗ ,Bi∗ ))1 = L∆x
b∗
i
,a∗
i
, and as shown in [14] (Section 2.2.3), the fact that
(x∗
,y∗
) is the active token bundle for a price in the interior of the active bucket implies that
x∗
< x̄, as visualized in Figure 4.
Suppose a trader wants to sell ∆x ≤ 1
1−γ (x̄ − x∗
) units of token A for some quantity
of token B. The contract first takes γ∆x units of token A as fees for LPs, to be shared
proportionally amongst active LPs where an active LP j with σ(j) = i∗
receives γ∆x
Lj
L∗
units of token A. The remaining (1 − γ)∆x ≤ x̄ − x∗
units of token A are used to change
the contract state and determine how many units of token B the trader receives. There is a
unique P′
∈ Bi such that P′
< P and V(3)
(L∗
,P′
,Bi) = (x′
,y′
) with x′
= x∗
+ (1 − γ)∆x.
∆y = y∗
− y′
is the quantity of B tokens received in exchange for ∆x units of A tokens and
the price changes from P to P′
. For a trader who wants to sell ∆x > 1
1−γ (x̄ − x∗
) units of
token A, then after skimming fees, (1 − γ)∆x > x̄ − x∗
units of A are used to change the
contract state by shifting the contract price. First, x̄ − x∗
is used to change the contract
state, shifting the contract price to P′
= ai. This changes the active bundle to i∗
− 1 (as the
price decreases), and the remaining amount (1 − γ)∆x − (x̄ − x∗
) > 0 is traded recursively,
as specified above. This works symmetrically for a trader who wants to sell token B, with
the main difference that these trades increase the contract price. Also, if the initial price
before a trade is not in the interior of a bucket, but rather P ∈ Bi ∩Bi+1 then depending on
whether the trader sells token A (decreasing the contract price) or sells token B (increasing
the contract price), the active bucket is i or i + 1 respectively.
## 3 Liquidity Allocation Strategies and LP Earnings
In this section, we describe a rich set of strategies that LPs can use to maximize their earnings
over a given time horizon. As token B is the numeraire, we measure all earnings in terms of
units of token B and we assume that the LP begins with a fixed budget consisting of W > 0Z. Fan et al. 9
units of token B. We model price discovery between A and B tokens as occurring outside
of Uniswap contracts, and in addition to the contract price there is a market price that is
determined by external markets. We denote the market price by Pm and contract price
by Pc, and we extend price P so that P = (Pm,Pc) denotes a contract-market price pair.
Furthermore, we assume that arbitrage trade can be performed by traders at price Pm which
in turn brings Pc close to Pm (see Section 5.1). In what follows, we consider time horizons
that are characterized by a single sequence of T > 0 contract-market prices, denoted by
P = (P0,...,PT ), where Pt = (Pc,t,Pm,t) is the t-th contract-market price in the sequence
(time steps are indexed t).
## 3.1 Static Liquidity Provision Strategies
We begin by using a similar mathematical formalism and notation from [14] to express an
LP’s earnings over price sequence P for a simple family of liquidity allocation strategies.
▶ Definition 3 (Static liquidity provision strategy). An LP with an initial budget of W > 0
units of token B uses a static liquidity provision strategy when they
1. mint an initial liquidity allocation at P0,
2. accrue token fees over the course of P as prices change, and
3. burn the existing liquidity allocation at PT , the end of the time horizon, to recover invested
capital from the contract.
We focus on a single LP, and suppose they mint liquidity positions at the beginning of
P, when contract-market prices are given by P0 = (Pc,0,Pm,0), with their initial budget of
W > 0 units of token B. For this, let x = (x−m,...,xn) denote a proportional liquidity
allocation, where for i ∈ {−m,...,n}, xi ≥ 0 represents the proportion of capital used to
mint Bi-liquidity (with
Pn
i=−m xi ≤ 1 so that x ∈ ∆m+n+2
, the (m + n + 2)-dimensional
simplex). The LP uses Wxi units of token B to mint Bi-liquidity for each of i ∈ {−m,...,n}.
Let xn+1 = 1 −
Pn
i=−m xi ∈ [0,1] denote the proportion of capital that the LP does not
invest and keeps as units of token B.
Let B : (R+
)2
× R+
→ R+
, defined as B((z1,z2),Pm) = Pm · z1 + z2, return the token
B market worth of a bundle of A and B tokens when token A has market price Pm. For a
given contract-market price sequence, P, let wi = B(V(3)
(Pc,0,Bi),Pm,0) denote the amount
of B tokens required to mint one unit of Bi-liquidity at the initial contract-market price
of P0 = (Pc,0,Pm,0). With this in hand, let vector ℓ = (ℓ−m,...,ℓn) denote the absolute
liquidity allocation induced by initial budget (W), proportional liquidity allocation (x) and
initial contract-market price (P0). It follows that ℓi = Wxi
wi
units of Bi-liquidity for each
i ∈ {−m,...,n}. This implies that ℓ is linear as a function of each of x and W.
## 3.1.1 Linearity of Fee Rewards in x
We are ultimately interested in expressing an LP’s token B value of earnings as a function of
their liquidity allocation over the contract-market price sequence. We begin by determining
the amount of trading fees earned by an LP. Interestingly, these earnings are not only
independent of other LP allocations, but also linear in ℓ (and consequently x).
▶ Theorem 4 (Section 3.1 [26]). For a fixed contract-market price sequence P, the amount
of A tokens and B tokens accrued from fees is linear in ℓ and independent of the liquidity of
other LPs in the contract.10 Strategic Liquidity Provision in Uniswap v3
That the fees that a single LP earns are independent of other LPs’ liquidity allocations
follows from the assumption that contract-market prices are independent of the liquidity
allocation of this LP. Indeed, for a fixed price sequence, allocating liquidity by an LP has two
effects. First, increasing the liquidity means that a larger volume of trade needs to happen to
effect the same price change, resulting in more fees to be paid out to LPs. Second, the same
LP has a proportionally larger amount of liquidity across the relevant price interval. The
net effect is that fees are only a function of a single LP’s proportional (or absolute) liquidity
allocation. Theorem 4 justifies the following definition of a trading fee function for a single
LP and a given contract-market price sequence.
▶ Definition 5 (Trading Fee Functions). Suppose that P is a fixed contract-market price
sequence and W > 0 an initial token B budget. For a proportional (or absolute) liquidity
allocation given by x (or ℓ), we let FA
(x,W,P) (or FA
(ℓ,P)) denote the units of A tokens
earned from fees over P from downward price movements. Similarly, we let FB
(x,W,P)
(or FB
(ℓ,P)) denote the units of B tokens earned from fees over P from upward price
movements.
When the resulting absolute liquidity allocation ℓ is treated as a function of x and W, it
is linear in x and W, and it follows that both FA
(x,W,P) and FB
(x,W,P) are linear in x
and W. For this reason, we let FA
(x,P) = FA
(x,1,P) and FB
(x,P) = FB
(x,1,P). This
in turn implies that FA
(x,W,P) = W ·FA
(x,P), and similarly FB
(x,W,P) = W ·FB
(x,P)
for arbitrary x,W, and P.
## 3.1.2 Burning Liquidity Allocations at PT
All that remains to fully quantify the earnings of an LP over P is to take into account
the capital they obtain by burning their liquidity positions at time T under contract-
market price PT = (Pc,T ,PT,m), obtaining a final quantity of token B. For this, let w′
i =
B(V(3)
(Pc,T ,Bi),Pm,T ) be the token B worth of the capital obtained from burning 1 unit
of Bi-liquidity at the final contract-market price of PT = (Pc,T ,Pm,T ). Given absolute
liquidity position ℓ, the overall token B value of capital obtained from burning is C(ℓ,P) =
Pn
i=−m w′
iℓi, and linear in ℓ. Let C(x,W,P) denote the final token B worth (at PT ) of
a liquidity position minted at P0 with x and budget W. Since proportional allocations
also allow an LP to maintain funds in terms of token B (i.e., when xn+1 > 0), we obtain
the expression C(x,W,P) = C(ℓ,P) + Wxn+1, where ℓ is the absolute liquidity allocation
corresponding to x. Once more, since ℓ is in turn linear in x and W, it follows that C is linear
in ℓ and W. For this reason, we let C(x,P) = C(x,1,P), so that C(x,W,P) = W · C(x,P)
for arbitrary x,W, and P.
## 3.1.3 Linearity of Overall Earnings in x
We now define an LP’s earnings over a contract-market price sequence.
▶ Definition 6. Suppose that P = (P0,...,PT ) is a contract-market price sequence and that
x ∈ ∆m+n+2
is a proportional liquidity allocation. An LP’s earnings (in units of token B)
under P with an initial budget of W > 0 is,
V (x,W,P) = Pm,T · FA
(x,W,P) + FB
(x,W,P) + C(x,W,P).Z. Fan et al. 11
From this definition, we conclude that an LP’s earnings from a fixed contract-market
price sequence and with a static liquidity provision strategy are linear in x and W.4
▶ Theorem 7. V is linear in both W and x for any contract-market price sequence, P.
Proof. This is an immediate corollary of the fact that FA
, FB
and C are each linear in x
and W for any contract-market price sequence P. ◀
Similar to before, we use the shorthand V (x,P) = V (x,1,P) such that V (x,W,P) =
W · V (x,P) for arbitrary x,W, and P.
## 3.2 Dynamic Liquidity Provision Strategies
In this section, we introduce the notion of dynamic liquidity provision strategies, where an
LP can reallocate their liquidity at any time step of the contract-market price sequence, P.
At a high level, if an LP chooses to reallocate liquidity at time t, they burn their existing
liquidity position and use their overall earnings at time t, denoted by Wt, to mint a new
proportional allocation, x, given the contract-market price Pt. Reallocation comes at a cost
however, which represents the fact that burning and minting positions on a Uniswap contract
requires paying gas fees, and that minting new positions may require the LP to trade between
A and B tokens. We model reallocation costs as proportional to overall earnings used to mint
the position x (i.e. the funds corresponding to capital kept token B outside the contract
(xn+1) do not incur a cost). Cost is specified by a single parameter, η ∈ [0,1], such that the
LP retains ηWt(1 − xn+1) of the funds they intend to use for minting a new position after
paying reallocation costs at time t (i.e., by paying (1 − η)Wt(1 − xn+1) in reallocation cost).
We partition price sequence P into epochs, which are sequences of contract-market prices
from P uninterrupted by liquidity reallocations. For an LP that burns and reallocates
liquidity positions at time steps t = (t0
,...tk
), where t0
= 0 and tk
= T, there are k ≥ 1
epochs, where the j-th epoch is Ej
= (Ptj ,...,Ptj+1). When indexing over epochs we use
superscripts, and when indexing over time-steps in P we use subscripts.
Each epoch, Ej
, is associated with the total earnings, Wj
, the LP has accrued at
the beginning of the epoch, and the proportional liquidity allocation, xj
, the LP uses to
mint positions with Wj
over Ej
. From the static liquidity allocation analysis, it follows
that the LP’s earnings over the epoch are given by Wj
· V (xj
,Ej
). After incorporating
the proportional reallocation cost, the earnings available for the LP to use for Ej+1
are
Wj+1
= ηWj
· V (xj
,Ej
)(1 − xj+1
n+1). We encode the collection of all proportional allocations
as a (k × (m + n + 1)) matrix X, such that the j-th row of X corresponds to xj
.
▶ Definition 8 (Dynamic liquidity provision strategy). We say that Λ is a dynamic liquidity
provision strategy if it takes as input a contract-market price sequence, P = (P1,...,PT ),
and defines:
t = (t0
,...,tk
), with k ≥ 1, t0
= 0, and tk
= T. These are time-steps where a reallocation
occurs.
X ∈ mat(k × (m + n + 1)) such that the j-th row of X encodes xj
, the proportional
liquidity allocation profile to be used at Ej
.
4
As a side note, with the definition of LP’s earnings here we are modeling the profit and loss (PnL)
of an LP who holds their Uniswap v3 liquidity position without hedging. The strategy optimization
approach in this paper can be naturally extended for maximizing the PnL of a delta-hedge LP as well
by incorporating Loss versus Rebalancing (LVR) from [20] since LVR is also linear in x and W.12 Strategic Liquidity Provision in Uniswap v3
We write Λ(P) = (t,X) and say that this is the realized dynamic liquidity provision strategy
of an LP under Λ for contract-market price sequence P.
For an initial budget W(= W0 = W0
), we let V (Λ,W,P) denote the overall earnings an
LP obtains over P by employing strategy Λ, which can be computed recursively over the
epochs of P. As in previous sections, we let V (Λ,P) = V (Λ,1,P).
## 3.2.1 Reset Liquidity Strategies
In practice, a strategy Λ may not be implementable, for example requiring an LP to know
the full contract-market price sequence, P, before it is realized. In this section, we focus on
a specific family of implementable dynamic liquidity provision strategies, the reset liquidity
strategies.
For this, an LP at time-step t with accumulated earnings Wt may choose to trigger a
liquidity reallocation based on the contract-market price sequence up to time t, denoted P≤t.
For reset liquidity strategies, the LP maintains a reference bucket index Zt ∈ {−m,...,n}
(correspondingly a reference bucket BZt
∈ µ). We let St = (Z,Wt,P≤t) denote the system
state, and we let S denote the space of all possible system states. A liquidity reset consists
in updating the reference bucket index and using the Wt units of B tokens at their disposal
to mint a liquidity position relative to the reference bucket index Zt.
▶ Definition 9 (Reset liquidity provision strategy). A reset liquidity provision strategy (reset-LP
strategy) is composed of:
1. A reference bucket update function, g, which takes as input an arbitrary system state
S ∈ S and updates the reference bucket index to Z ← Z′
where Z′
= g(S).
2. An allocation function, A : S × Z → [0,1], which specifies the fraction of budget an LP
allocates to mint liquidity in each bucket relative to Z after a liquidity reset is triggered.
More specifically, A gives rise to the proportional allocation x such that xi = A(S,i − Z).
3. A reset condition, h(S) ∈ {0,1}, which is an indicator function for whether a reset is
triggered in system state S ∈ S and specifies which contract-market prices, relative to the
reference bucket, will trigger a liquidity reset. In the event of a trigger, a new reference
bucket is computed via update function g.
We denote a reset-LP strategy by tuple (g,h,A).
Of particular interest is the family of τ-reset strategies. These strategies have LPs reset
liquidity when the index of the bucket containing the contract price is more than τ away
from the reference index, Z. In the case of a reset, the reference bucket changes to the bucket
containing the current contract price.
▶ Definition 10 (τ-reset Strategy). Suppose that τ is a non-negative integer. We let hτ :
S → {0,1} and gτ : S → {−m,...,n} denote trigger and reference bucket update functions,
defined for system state St = (Zt,Wt,P≤t) ∈ S as
hτ(Zt,Wt,P≤t) = 1 if and only if Pc,t ∈ Bi and |Zt − i| > τ, and
gτ(Zt,Wt,P≤t) = Pc,t.
We say that (gτ,hτ,A) is a τ-reset strategy, for any allocation function, A : S × Z → [0,1].
We illustrate the versatility of τ-reset strategies through some examples:
1. (Static Strategies): For τ > T, i.e., the time horizon of P, we recover static strategies.
2. (Uniform τ-Reset Strategies): Allocating liquidity uniformly on a range of contiguous
buckets centered around the current reference bucket BZt and resetting when prices move
outside of this range.Z. Fan et al. 13
Figure 5 An illustration of how a τ-reset strategy with τ = 1 can play out. Buckets are represented
by circles, and for simplicity we assume that market and contract prices move together at each time
step. The shaded circle represents the bucket that contract/market prices are in, and the dynamics
of price movements are expressed by the smaller arrows between buckets. Colored buckets represent
the contiguous 2τ + 1 buckets centered around an epoch’s reference bucket. For this sequence, we
see that price movements at t1 = 2 and t2 = 4 trigger resets, as the shaded bucket escapes the
contiguous 2τ + 1 colored buckets. The specific reallocation after each trigger is specified by the
allocation function A in the τ-reset strategy.
3. (Context-Independent Allocation Strategies): Setting A(S,i) = Ai ∈ R for all S ∈ S; i.e.,
the proportional allocations relative to baseline bucket index are always the same at the
time of a reset trigger.
## 4 Optimizing Earnings
In this section, we formulate the earnings optimization problem faced by an LP with belief,
P, defining a distribution on contract-market price sequences in a given time horizon. In
the most general case, belief P would depend on the liquidity allocation strategy used
by an LP. For example, if the LP provides a large amount of liquidity for a given price
interval, this would in turn reduce the slippage of trades at those prices, which may in turn
increase the volume of trades facilitated by the contract, and hence change P. As in [14],
we make the simplifying assumption, reasonable for a small LP, that their belief P is a
liquidity-independent distribution, and independent of the strategic liquidity strategy used by
the LP. Going forward, we limit our attention to liquidity-independent beliefs. In particular,
we will model non-arbitrage traders who trade to a particular buy or sell contract price
whose value is unaffected by this LP’s liquidity allocation, along with arbitrage traders whose
trades are triggered by considerations of market price vs contract price.
4.1 Optimal τ-reset Strategies
We’ve seen that τ-reset strategies are a versatile framework for dynamic liquidity provision.
For a given value of τ, the only choice in defining a τ-reset strategy is the allocation function
A, and we let Λτ(A) = (gτ,hτ,A) denote the resulting τ-reset strategy.
In this section, we provide a means of optimizing expected earnings for a given τ. For
this, we assume that A ∈ A, where A is a family of allocation functions. The space of all
allocation functions is large, with an allocation function potentially depending on the entire
history of contract-market price sequences and LP actions up to the point when a liquidity
reset is triggered.14 Strategic Liquidity Provision in Uniswap v3
In defining an LP’s optimization problem, we consider LPs with different levels of risk-
aversion, encoded by a utility function, u : R → R (we provide example utility functions
below), and we assume that an LP wants to select an allocation function to maximize
V u
τ,P(A) = EP∼P [u(V (Λτ(A),P)]. With this in hand, we let
OPT(τ,P,u,A) = max
A∈A
V u
τ,P(A),
and denote an allocation function in family A that achieves optimal earnings by A∗
.
In general, convex u and concave u correspond to risk-seeking and risk-averse LPs,
respectively, and linear u corresponds to a risk-neutral LPs (where we can adopt u(x) = x
without loss of generality). Going forward, we adopt as the utility function that with constant
Arrow-Pratt measures of absolute risk-aversion [8, 22].
▶ Definition 11 (Constant Absolute Risk Aversion Utility). For a given a ∈ R, the constant
absolute risk aversion utility function, ua : R → R, is given by:
ua(x) =
(
(1 − e−ax
)/a if a ̸= 0, and
x otherwise.
(2)
For a < 0, a = 0, and a > 0, utility function ua models a risk-seeking, risk-neutral, and
risk-averse agent, respectively.
4.2 Sampling to Approximate OPT
In order to optimize V u
τ,P(A), we approximate the objective by taking a discrete sample of
paths from P. As such, suppose that P1,...,PN ∼ P. We define the empirical average
earnings of an LP given the sample paths as:
V̂ u
τ (A | P1,...,PN) =
1
N
N X
q=1
u(V (Λτ(A),Pq).
In expectation, we obtain:
EP1,...,PN ∼P
h
V̂ u
τ (A | P1,...,PN)
i
= V u
τ,P(A).
Going forward, we approximate OPT(τ,P,u,A) by taking sufficiently many samples from P
and optimizing V̂ u
τ .
4.3 Computing Optimal τ-reset Strategies with Neural Networks
We compute optimal τ-reset strategies by letting the allocation function, A, be parametrized
by a feedforward neural network (NN) with parameters given by θ ∈ θ. We let Aθ denote
the specific allocation function for a given parameter choice θ ∈ θ and we let Aθ denote
the space of all possible parametric settings of the NN. Our objective is to maximize
V̂ u
τ (Aθ | P1,...,PN) for a given sample of contract/market price paths P1,...,PN ∼ P.
When a reallocation is triggered at the beginning of epoch j(j = 1,2,...,k), the NN takes
as input a set of features Cj
that contains context information. The set of context features
includes the current time step, the current wealth, the current pool price, the current bucket
that the pool price lies in, and an exponentially-weighted moving average (the smoothing
parameter value is 0.1) of non-arbitrage trade volume that a hypothetical 1 unit of liquidity
over the entire price range would have achieved given the price trajectory.Z. Fan et al. 15
We use a fully connected neural network architecture with 5 hidden layers, and the size
of each hidden layer is m = 16. The size of the input layer is n = 5 (the number of context
features), and the output layer is of size s = 2τ + 2 (the first 2τ + 1 dimensions are the
proportional capital to be allocated into the corresponding buckets, and there is also a
special dimension for not allocating some of the wealth if needed). All the hidden layers are
associated with the ReLU activation function. In addition, a soft-max function is added for
the final output in order to produce a vector of sum 1. The architecture we use is visualized
in the right image of Figure 6.
Unpacking the objective, V̂ u
τ (Aθ | P1,...,PN) shows a fundamental recurrence in the
given allocation function Aθ. This is because an allocation produced by Aθ is deployed into
the pool and affects the value of wealth when the next reallocation is triggered, and wealth
is used as part of the input to Aθ for the new reallocation as visualized in the left diagram
of Figure 6. However, the NN representation of A allows gradients to be pushed through
the recurrence with standard back propagation methods used for recurrent neural networks.
Given this, we find optimal θ ∈ θ via standard gradient descent methods.
In more detail, for optimization of the NN (ODRA) and the constant allocation (OIRA)5
,
we use stochastic gradient descent based on sampled price trajectories. The number of
training steps is 10000 for both optimize methods. The learning rate for the NN is 10−3
while the learning rate for the constant allocation is 10−2
. In addition, the Adam optimizer
is used for both methods.6
As risk aversion parameter a increases, the relative difference between the utility values of
two wealth values (ua(x1) − ua(x2))/ua(x1) becomes smaller and this could pose a challenge
to the optimization of ODRA and OIRA when the improvement of utility value is numerically
very small. To resolve this issue, we apply a positive affine transformation to the utility values
as u∗
a(x) = (ua(x) − ua(1))/(ua(1.1) − ua(1)) for all x and use the transformed utility values
u∗
a(x) in the loss function during training of ODRA and OIRA. This helps the optimization
process and at the same time does not alter the problem formulation of the optimization as
utility functions ua and u∗
a represent the same set of underlying preferences.
## 4.4 Liquidity Provision Strategies
Below we outline the main strategies we compare in different regimes:
1. Optimal static allocation (OSA): This strategy computes x that optimizes the value of
ua(V (x | P1,...,PN)) from Section 3.1. This is the only strategy that does not explicitly
use liquidity reallocations (though it can be seen as a τ-reset strategy with τ > T), and
it coincides with the work of [14].
2. Uniform liquidity τ-reset allocation (ULRA): For a fixed τ, this strategy mints an equal
µ units of liquidity for each of the 2τ + 1 contiguous buckets considered in a reallocation.
τ is chosen to be as large as possible so the LP makes use of the entire wealth at their
disposal at a reset to reallocate liquidity.
3. Uniform proportional τ-reset allocation (UPRA): For a fixed τ, this allocates wealth in
equal proportions to each of the 2τ + 1 buckets after a reset (in general this does not
result in a uniform liquidity allocation as the cost per unit of liquidity in each bucket
may be different).
5
In Appendix A we also provide a natural variant of OIRA for LPs exhibiting risk-aversion via logarithmic
utilities as in [11]. For this model we provide convex optimization methods to solve for optimal allocations.
6
The codebase we use to run experiments is open-sourced at https://github.com/Evensgn/
uniswap-active-lp.16 Strategic Liquidity Provision in Uniswap v3
C
Aθ
x
W W0
C0
Aθ
x0
W1
C1
Aθ
x1
W2
C2
Aθ
x2
W3
Ck
Aθ
xk
Wk+1
= ...
c1
c2
c3
cn
. . .
a
(1)
1
a
(1)
2
a
(1)
3
a
(1)
4
a
(1)
m
. . .
a
(2)
1
a
(2)
2
a
(2)
3
a
(2)
4
a
(2)
m
. . .
a
(3)
1
a
(3)
2
a
(3)
3
a
(3)
4
a
(3)
m
. . .
a
(4)
1
a
(4)
2
a
(4)
3
a
(4)
4
a
(4)
m
. . .
a
(5)
1
a
(5)
2
a
(5)
3
a
(5)
4
a
(5)
m
. . .
x1
x2
xs
. . .
input
layer
hidden layers
output
layer
Figure 6 The top image provides a visualization of the recurrence in Aθ for the overall objective
V̂ u
τ (Aθ | P1,...,PN) which we exploit to compute gradients in a similar fashion to recurrent neural
networks. In this image, C denotes the context that is fed to the neural network Aθ as features. A
relevant feature at each epoch is the wealth that the LP has accumulated at the beginning of the
epoch Wi
, which is exemplified via an arrow in the figure. The overall objective is the given utility
function applied to the wealth at the end of the final epoch Wk+1
. The bottom image provides a
visualization of the neural network architecture we use for Aθ. There is a soft-max function applied
to the output layer. The recurrent structure of the objective’s dependence with respect to the NN
parameters, θ ∈ θ allow us to use techniques from recurrent neural networks to compute the gradient
of the objective u(Wk+1
) with respect to θ.
4. Optimal context-independent τ-reset allocation (OIRA): For a fixed τ, this computes
the optimal single allocation vector to be used at every reset. In other words, the LP
computes an optimal (A−τ,...,Aτ), to be used to allocate liquidity around the reference
bucket at each reallocation.
5. Optimal context-dependent τ-reset allocation (ODRA): For fixed τ, this is solved with
the Neural Network formulation of Section 4.3.
## 5 Experimental Setup: Contract-Market Prices
In this section, we describe a family of empirically-informed contact-market price sequences
against which we will optimize τ-reset strategies and we use historical data to inform this
stochastic price model.Z. Fan et al. 17
## 5.1 Modeling Contract-Market Prices
For this, we use a similar approach to [14], which is in turn inspired by [10], to provide a
family of liquidity-independent contract-market price distributions. This makes use of an
external stochastic process to define a sequence of market prices, together with non-arbitrage
trades that affect the contract price and arbitrage trades that act to bring contract prices
closer to market prices.
We assume that contract-market prices are generated over each of R > 0 rounds. At the
beginning of each round, market prices change randomly according to a stochastic process
PM. During the r-th round, after the contract-market price update, there are some number,
kr ≥ 0, of non-arbitrage trades which impact contract price, Pc, only. Each non-arbitrage
trade is either a purchase or a sale, this determined uniformly at random with probability 1/2.
The effect of such a trade is that the contract price changes to (1 + λr)Pc or (1 + λr)−1
Pc
respectively, where λr > 0, depending on whether a purchase or sale occured. Crucially,
trades are price-based in our model rather than volume based, which in turn ensures that
contract-market prices evolve independent of liquidity provided by an LP. It is precisely this
exogenous uncertainty to LP actions that will allows us to compute optimal τ-reset strategies
via the methods of Section 4, as this allows us to sample price paths first and then optimize
LP allocation functions.
We also model arbitrage trades whose role is to bring contract prices close to market
prices. For this, we follow [14], and with a Uniswap contract fee rate, γ ∈ (0,1), we let
Iγ(Pm) = [(1−γ)Pm,(1−γ)−1
Pm] be the no-arbitrage interval around the market price Pm.
If the contract price exits this no-arbitrage interval, we assume a arbitrage trade brings the
contract price to the closest price in the interval. That is, if Pc < (1 − γ)Pm we assume that
arbitrage trade moves the contract price to (1 − γ)Pm, and if Pc > (1 − γ)−1
Pm we assume
that arbitrage trade moves the contract price to (1 − γ)−1
Pm.
▶ Definition 12 (Round-Based Liquidity-Independent Price Distribution). We say that P
is a round-based liquidity-independent price distribution when it is a distribution that is
parameterized by:
R > 0: the number of rounds,
γ ∈ (0,1): the fee rate of the Uniswap contract,
PM: the stochastic process governing market price updates at the beginning of each round,
k = (kr)R
r=1 with kr > 0: the number of non-arbitrage trades in each round r ∈ {1,...,R},
and
λ = (λr)R
r=1 with λr > 0: the multiplicative impact of a non-arbitrage trade on contract
price for each round r ∈ {1,...,R}.
When we wish to specify the resulting round-based price distribution, we write this as
P(R,γ,PM,k,λ).
We model PM as a geometric Brownian motion with parameters estimated from historical
price data between token pairs. We also explore multiple regimes of time-varying non-
arbitrage trade by varying λ (the framework is flexible enough to permit arbitrary values of
λr for each round).
## 5.2 Market Prices as a Geometric Brownian Motion
We model the stochastic nature of market prices, PM, as a Geometric Brownian Motion
(GBM). If the time series is given by X1,...,XT , then the successive multiplicative increments18 Strategic Liquidity Provision in Uniswap v3
of the time series are i.i.d lognormally distributed. If we let Zi = log

Xi
Xi−1

, then Z2,...ZT ∼
iid N(µ,σ2
) with drift, µ, and diffusion, σ. We estimate these parameters on per-minute
time series data for ETH/BTC prices (the low volatility regime) and ETH/USDT (the high
volatility regime) from March 2022 through February 2023. For each time series, we estimate
the drift and diffusion via standard MLE methods. The following are the MLE estimates we
obtain for µ and σ2
for each of the two volatility regimes:
ETH/BTC ETH/USDT
µ̂ 4.835 × 10−8
−1.140 × 10−6
σ̂2
1.946 × 10−7
8.329 × 10−7
Figure 7 Log ratios of consecutive prices (per-minute) between different asset pairs. Left:
ETH/BTC, representing low-volatility contract-market price sequences as these prices are highly
correlated. Parameter estimates give rise to values µ̂ ≈ 4.84 × 10−8
and σ2
≈ 1.95 × 10−7
. Right:
ETH/USDT, representing high-volatility contract-market price sequences as these prices are less
correlated. Parameter estimates give rise to values µ̂ ≈ −1.14 × 10−6
and σ2
≈ 8.33 × 10−7
## 5.3 Contract Price Updates
Whereas arbitrage trades are specified by the fee rate of the contract, non-arbitrage trades are
parametrized by k = (kr)R
r=1 and λ = (λr)R
r=1, which specify the number and multiplicative
magnitude of price change updates arising from non-arbitrage trades in a given round. In
our experiments, we fix kr = 10 for each round and introduce time-varying non-arbitrage
price flow by explicitly modulating λ before sampling from P. In particular we explore λ
such that λr = λ̄+α·tanh(10(t/T −0.5)), where λ̄ > 0 is the average λr value over the time
horizon and α > 0 is the variation exhibited in λr around the mean.
## 6 Experimental Results
In this section, we explore the increase in earnings that LPs can gain through the use
of dynamic allocation strategies, studying the performance of various liquidity provision
strategies in a multitude of economic environments modulated by contract/market price
volatility, LP risk-aversion, and reallocation costs. Most importantly, we find many set-
tings in which optimal τ-reset strategies outperform simpler liquidity provision strategies.
In all the experiments that follow, we assume a default setting of (W,γ,R,kr,λ̄,α,η) =
(1,0.003,1000,10,0.00005,0.00005,0.01). When deviating from the default setting we clarify
which parameters are changed. In addition, we assume that the buckets of the v3 contract
µ = {B−m,..,Bn} are given by Bi = [ai,bi] = [ϕi
,ϕi+1
] for ϕ = 1.000110
.Z. Fan et al. 19
5 10 15 20
1.1
1.2
1.3
1.4
1.5
1.6
Expected Utility
LowPriceVolatility,a=0.0
5 10 15 20
7
8
9
10
Expected Utility
1e 6+9.999e 2
LowPriceVolatility,a=10.0
5 10 15 20
4
6
8
10
Expected Utility
1e 11+4.99999999e 2
LowPriceVolatility,a=20.0
5 10 15 20 1.0
1.1
1.2
1.3
Expected Utility
HighPriceVolatility,a=0.0
5 10 15 20
6
7
8
9
Expected Utility 1e 6+9.999e 2
HighPriceVolatility,a=10.0
5 10 15 20
0.8
0.6
0.4
0.2
0.0
Expected Utility
1e 10+5e 2
HighPriceVolatility,a=20.0
0
10
20
30
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
OIRA ODRA OSA( = ) ExpectedNumberofRe-allocations
Figure 8 The performance of OIRA, ODRA and OSA strategies as we modulate both risk-aversion
and PM. For each strategy, we plot the expected utility it achieves as a function of τ, and we also
plot the expected number of reallocations that occur as a function of τ. The top row corresponds to
a low volatility PM, empirically informed from ETH/BTC prices, and the bottom row corresponds
to high volatility PM, empirically informed from ETH/USDC prices. The columns correspond to
risk-aversion values a = 0,10, and 20, respectively from left to right. When scientific notation is
used for the y-axis values in certain subplots, it is denoted by a number above the respective y-axis.
## 6.1 The Impact of Price Volatility
In Figures 8 and 9 we plot the performance of all LP strategies as we modulate PM from low
to high volatility as well as the risk-aversion of the LP. Figure 8 focuses on only comparing
OIRA, ODRA and OSA to tease out the relative performance of ODRA vs. OIRA. Figure 9
incorporates UPRA and ULRA, from where we can see that their performance is almost
identical. The NN-based ODRA outperforms all strategies, especially OSA which does not
make use of reallocations. As risk-aversion increases, we see that the distinction between
ODRA and OIRA becomes more clear in the plots, however, this does not imply a greater
magnitude of performance due to the fact that different risk-aversion values give rise to
different scales. In addition, we see that OIRA generally exhibits optimal performance with
τ > 1 whereas all other τ-reset strategies in this setting perform better with τ = 1.
In terms of the impact of PM, we see that for lower τ values, higher PM leads to a larger
separation between ODRA and OIRA in performance. Moreover, Figure 10 plots allocation
profiles for ODRA and OIRA as we modulate risk-aversion and PM. As expected, with higher
risk-aversion we see a larger spread in allocations, as LPs may seek to decrease the variance
in their earnings with wider positions. On the other hand, as PM increases in volatility, we
see that LP positions for both ODRA and OIRA become more narrow. This is likely due
to the fact that the expected number of reallocations is higher in the high volatility setting
than in the low volatility setting for the same τ. For a lower frequency of reallocations, the
allocated liquidity is used for longer time periods, hence an LP may wish to spread liquidity
over various buckets.20 Strategic Liquidity Provision in Uniswap v3
10 20 1.0
1.2
1.4
1.6
Expected Utility
LowPriceVolatility,a=0.0
10 20
7
8
9
10
Expected Utility
1e 6+9.999e 2
LowPriceVolatility,a=10.0
10 20
4
6
8
10
Expected Utility
1e 11+4.99999999e 2
LowPriceVolatility,a=20.0
10 20
0.9
1.0
1.1
1.2
1.3
Expected Utility
HighPriceVolatility,a=0.0
10 20
0.09997
0.09998
0.09999
0.10000
Expected Utility HighPriceVolatility,a=10.0
10 20
8
6
4
2
0
Expected Utility
1e 9+5e 2
HighPriceVolatility,a=20.0
0
10
20
30
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
OIRA ODRA OSA( = ) UPRA ULRA ExpectedNumberofRe-allocations
Figure 9 The performance of all strategies as we modulate both risk-aversion and PM. For each
strategy we plot the expected utility it achieves as a function of τ, and we also plot the expected
number of reallocations that occur as a function of τ. The top row corresponds to a low volatility
PM, empirically informed from ETH/BTC prices, and the bottom row corresponds to high volatility
PM, empirically informed from ETH/USDC prices. The columns correspond to risk-aversion values
a = 0,10, and 20, respectively from left to right. When scientific notation is used for the y-axis
values in certain subplots, it is denoted by a number above the respective y-axis.
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
LowPriceVolatility,a=0.0
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
LowPriceVolatility,a=10.0
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
LowPriceVolatility,a=20.0
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
HighPriceVolatility,a=0.0
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
HighPriceVolatility,a=10.0
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportional Capital
HighPriceVolatility,a=20.0
ProportionalCapitalAllocation, =20
OIRA ODRA(MeanAllocation)
Figure 10 OIRA allocation and ODRA average allocations for τ = 20 as we modulate both
risk-aversion and PM. The top row corresponds to a low volatility PM, empirically informed from
ETH/BTC prices, and the bottom row corresponds to high volatility PM, empirically informed from
ETH/USDC prices. The columns correspond to risk-aversion values a = 0,10, and 20, respectively
from left to right.Z. Fan et al. 21
5 10 15 20
8.0
8.5
9.0
9.5
10.0
Expected Utility
1e 6+9.999e 2
LowVolatility,Constant
5 10 15 20
7.5
8.0
8.5
9.0
9.5
10.0
Expected Utility
1e 6+9.999e 2
LowVolatility,Time-varying
5 10 15 20
7
8
9
10
Expected Utility
1e 6+9.999e 2
LowVolatility,MoreTime-varying
5 10 15 20
7.25
7.50
7.75
8.00
8.25
8.50
Expected Utility
1e 6+9.999e 2
HighVolatility,Constant
5 10 15 20
7.0
7.5
8.0
8.5
9.0
Expected Utility 1e 6+9.999e 2
HighVolatility,Time-varying
5 10 15 20
7
8
9
Expected Utility
1e 6+9.999e 2
HighVolatility,MoreTime-varying
5
10
15
20
Number of Re-allocations
0
5
10
15
20
25
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
Number of Re-allocations
OIRA ODRA ExpectedNumberofRe-allocations
Figure 11 The performance of OIRA and ODRA strategies as we modulate PM and λ. For all plots,
we use a = 10 for risk aversion and λ̄ = 0.00005 and we modulate the α in {0.0,0.00003,0.00005}
in columns from left to right. The top row plots low volatility PM and the bottom row plots high
volatility PM. When scientific notation is used for the y-axis values in certain subplots, it is denoted
by a number above the respective y-axis.
## 6.2 Varying Non-arbitrage Flow
In Figure 11 we modulate the volatility of PM and the magnitude of non-arbitrage flow in
λ by modulating α, the amplitude of change in λ while keeping mean λ the same. The
most salient observation is that as λ becomes more time-varying, the NN-based approach of
ODRA increases its performance relative to OIRA. This is to be expected due to the fact
that ODRA can incorporate temporal context in deciding an allocation after a reset, and
the non-arbitrage flow inherently has the temporal context of increased importance as α
increases.
In Figure 12 and 13 we also modulate λ albeit by jointly modulating amplitude(α) and
mean of λr values, λ̄. Once more we see that the NN-based ODRA strategy outperforms
all strategies, and we see that the optimal τ values for ODRA drastically differ in the high
volatility PM over those of Figure 11. Moreover in Figure 13 we see that both increased
non-arbitrage flow and PM volatility contribute to more spread allocations. LPs make profits
from non-arbitrage trades, hence they stand to obtain more fees with wider positions for
larger flows of non-arbitrage trade.
## 6.3 The Impact of Risk-aversion
As mentioned in the previous sections, risk-aversion mostly impacts the allocations used
in ODRA and OIRA LP strategies. In Figure 14 we make fine-grained modulations of
risk-aversion and see that indeed LPs spread their liquidity more as they become more
risk-averse. A larger spread of liquidity allocation typically implies lower expected earnings
for an LP as they have less proportional liquidity at prices that are traded at, but at the
same time, there is less risk of missing out on fees due to prices escaping their position or22 Strategic Liquidity Provision in Uniswap v3
5 10 15 20
6
7
8
9
Expected Utility
1e 6+9.999e 2
LowVolatility,LowVolume
5 10 15 20
7
8
9
10
Expected Utility
1e 6+9.999e 2
LowVolatility,MediumVolume
5 10 15 20
8.0
8.5
9.0
9.5
10.0
Expected Utility
1e 6+9.999e 2
LowVolatility,HighVolume
5 10 15 20
5.50
5.75
6.00
6.25
6.50
6.75
Expected Utility
1e 6+9.999e 2
HighVolatility,LowVolume
5 10 15 20
7
8
9
Expected Utility
1e 6+9.999e 2
HighVolatility,MediumVolume
5 10 15 20
7.5
8.0
8.5
9.0
9.5
10.0
Expected Utility
1e 6+9.999e 2
HighVolatility,HighVolume
5
10
15
Number of Re-allocations
0
10
20
30
Number of Re-allocations
0
10
20
30
40
50
Number of Re-allocations
0
10
20
30
40
50
Number of Re-allocations
0
20
40
60
Number of Re-allocations
0
20
40
60
80
Number of Re-allocations
OIRA ODRA ExpectedNumberofRe-allocations
Figure 12 The performance of OIRA and ODRA strategies as we modulate PM and
λ. For all plots, we use a = 10 for risk aversion and we modulate the (λ̄,α) ∈
{(0.000025,0.000025),(0.00005,0.00005),(0.000075,0.000075)} in columns from left to right. The
top row plots low volatility PM and the bottom row plots high volatility PM. When scientific
notation is used for the y-axis values in certain subplots, it is denoted by a number above the
respective y-axis.
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
LowVolatility,LowVolume
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
LowVolatility,MediumVolume
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
LowVolatility,HighVolume
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
HighVolatility,LowVolume
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
HighVolatility,MediumVolume
20 10 0 10 20
BucketIndex
0.0
0.2
0.4
0.6
0.8
1.0
Proportion of Capital Allocated
HighVolatility,HighVolume
ProportionalCapitalAllocation, =20
OIRA ODRA(MeanAllocation)
Figure 13 OIRA allocation and ODRA average allocation as we modulate PM and
λ. For all plots, we use a = 10 for risk aversion and we modulate the (λ̄,α) ∈
{(0.000025,0.000025),(0.00005,0.00005),(0.000075,0.000075)} in columns from left to right. The
top row plots low volatility PM and the bottom row plots high volatility PM.Z. Fan et al. 23
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=0.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=2.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=4.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=6.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=8.0
20 0 20
BucketIndex
0.0
0.5
1.0 Proportional Capital a=10.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=12.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=14.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=16.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=18.0
20 0 20
BucketIndex
0.0
0.5
1.0
Proportional Capital
a=20.0
ProportionalCapitalAllocation, =20
OIRA ODRA(MeanAllocation)
Figure 14 OIRA allocation and ODRA average allocation for τ = 20 for low volatility PM as we
modulate risk-aversion from a = 0 to a = 20.
suffering impermanent loss due to price deviating from the initial price.
## 6.4 The Impact of Reallocation Costs
In Figure 15 we modulate the cost of reallocation, η. We see that higher η values lead to
higher optimal τ values for both OIRA and ODRA strategies. This is to be expected, for
although low τ values might lead to higher gains in fees, this also leads to more frequent
resets which in turn come with a higher cost.
## 7 Conclusion
This paper fills existing gaps in the literature regarding strategic liquidity provision strategies
for LPs in Uniswap v3. Whereas earlier work has either optimized for complex liquidity
positions in static environments, or simple positions with dynamic reallocations, our work
simultaneously provides complex, context-dependent liquidity allocations that dynamically
reallocate as prices evolve in v3 contracts. Our results show that such liquidity provision
strategies provide large gains for LPs relative to baseline uniform allocation strategies (similar
to liquidity allocation in Uniswap v2) in multiple economic environments for decentralized
exchanges. Natural directions for future work include: incorporating LVR [20] into the
objective definition to optimize the strategy of a delta-hedge LP, incorporating a game-
theoretic framework to liquidity provision which is more apt for large LPs, and modelling
competition between different pools such as v2 and v3 pools for the same token pairs.
References
## 1 Hayden Adams. Uniswap whitepaper, 2018. URL: https://hackmd.io/@HaydenAdams/
HJ9jLsfTz.
## 2 Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core, 2020. URL:
https://uniswap.org/whitepaper.pdf.24 Strategic Liquidity Provision in Uniswap v3
5 10 15 20
1.25
1.50
Expected Utility
=0.005,a=0.0
5 10 15 20
8
10
Expected Utility
1e 6+9.999e 2
=0.005,a=10.0
5 10 15 20
6
8
10
Expected Utility
1e 11+4.99999999e 2
=0.005,a=20.0
5 10 15 20
1.1
1.2
1.3
Expected Utility
=0.01,a=0.0
5 10 15 20
7
8
9
Expected Utility
1e 6+9.999e 2
=0.01,a=10.0
5 10 15 20
5
0
Expected Utility
1e 11+5e 2
=0.01,a=20.0
5 10 15 20
1.0
1.1
Expected Utility
=0.015,a=0.0
5 10 15 20
6
8
Expected Utility
1e 6+9.999e 2
=0.015,a=10.0
5 10 15 20
90
95
Expected Utility
1e 11+4.9999999e 2
=0.015,a=20.0
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
0
25
50
Re-allocations
OIRA ODRA ExpectedNumberofRe-allocations
Figure 15 The performance of OIRA and ODRA strategies as we modulate η and risk-aversion.
For all plots, we use high volatility PM. We modulate a in {0,10,20} in columns from left to right
and η ∈ {0.005,0.01,0.015} in rows from top to bottom. When scientific notation is used for the
y-axis values in certain subplots, it is denoted by a number above the respective y-axis.
## 3 Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap
v3 core, 2021. URL: https://uniswap.org/whitepaper-v3.pdf.
## 4 Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market
makers. In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies,
pages 80–91, 2020.
## 5 Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog? Curvature
and market making. arXiv preprint arXiv:2012.08040, 2020.
## 6 Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An analysis
of Uniswap markets. arXiv preprint arXiv:1911.03380, 2019.
## 7 Jun Aoyagi. Lazy liquidity in automated market making. Available at SSRN 3674178, 2020.
## 8 Kenneth Joseph Arrow. Aspects of the theory of risk-bearing. Helsinki, 1965.
## 9 Yogev Bar-On and Yishay Mansour. Uniswap liquidity provision: An online learning approach.
arXiv preprint arXiv:2302.00610, 2023.
## 10 Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges.
arXiv preprint arXiv:2103.08842, 2021.
## 11 Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralised finance and automated
market making: Predictable loss and optimal liquidity provision. Available at SSRN 4273989,
2022.
## 12 Alex Evans. Liquidity provider returns in geometric mean markets. arXiv preprint
arXiv:2006.08806, 2020.
## 13 Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric mean market
makers. arXiv preprint arXiv:2104.00446, 2021.
## 14 Zhou Fan, Francisco J. Marmolejo Cossío, Ben Altschuler, He Sun, Xintong Wang, and David C.
Parkes. Differential liquidity provision in Uniswap v3 and implications for contract design. In
3rd ACM International Conference on AI in Finance, ICAIF, pages 9–17, 2022.
## 15 Rafael Frongillo, Maneesha Papireddygari, and Bo Waggoner. An axiomatic characterization
of CFMMs and equivalence to prediction markets. arXiv preprint arXiv:2302.00196, 2023.Z. Fan et al. 25
## 16 Mohak Goyal, Geoffrey Ramseyer, Ashish Goel, and David Mazières. Finding the right curve:
Optimal design of constant function market makers. arXiv preprint arXiv:2212.03340, 2022.
## 17 Lioba Heimbach, Eric Schertenleib, and Roger Wattenhofer. Risks and returns of Uniswap v3
liquidity providers. arXiv preprint arXiv:2205.08904, 2022.
## 18 Max. Introducing Alpha Vaults–an LP strategy for
Uniswap V3, 2021. URL: https://medium.com/charmfinance/
introducing-alpha-vaults-an-lp-strategy-for-uniswap-v3-ebf500b67796.
## 19 Jason Milionis, Ciamac C Moallemi, and Tim Roughgarden. A Myersonian framework for
optimal liquidity provision in automated market makers. arXiv preprint arXiv:2303.00208,
2023.
## 20 Jason Milionis, Ciamac C Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated
market making and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046, 2022.
## 21 Michael Neuder, Rithvik Rao, Daniel J Moroz, and David C Parkes. Strategic liquidity
provision in uniswap v3. arXiv preprint arXiv:2106.12033, 2021.
## 22 John W Pratt. Risk aversion in the small and in the large. Econometrica, 32:122–136, 1964.
## 23 Jan Christoph Schlegel, Mateusz Kwaśnicki, and Akaki Mamageishvili. Axioms for constant
function market makers. Available at SSRN, 2022.
## 24 Martin Tassy and David White. Growth rate of a liquidity provider’s wealth in xy = c
automated market makers, 2020.
## 25 Dave White, Martin Tassy, Charlie Noyes, and Dan Robinson. Uniswap’s financial alchemy,
2020. URL: https://research.paradigm.xyz/uniswaps-alchemy.
## 26 Wenqi Zhao, Hui Li, and Yuming Yuan. Understand volatility of Algorithmic Stablecoin:
Modeling, verification and empirical analysis. In Financial Cryptography and Data Security,
volume 12676 of Lecture Notes in Computer Science, pages 97–108. Springer, 2021.
A Casting OIRA Variants as a Convex Optimization Problem
In this section we consider a slightly different reallocation cost model and risk-aversion utility
function for LPs. In this framework we are able to cast the problem of computing a natural
variant of the optimal context-independent τ-reset allocation (which we denote OIRA’) as a
convex optimization problem.
Modified Reallocation Cost
In Section 3.2 we modeled reallocation costs as being proportional to the capital an LP locks
in the contract for a given epoch. For this section, we make the simplifying assumption
that reallocation costs are simply proportional to the overall wealth accumulated by the
LP at the time of a liquidity reset. In more detail, let us suppose that the LP triggers a
reset at time t, using their overall earnings, Wt, to mint a proportional allocation x given
the contract-market price Pt. Reallocation costs are once more parametrized by a single
parameter η ∈ [0,1], and we assume that the LP pays (1 − η)Wt in reallocation costs and
applies the proportional allocation x to be used with available funds ηWt.
As before, the price sequence P is partitioned into epochs when a given reset strategy is
applied. Let us consider the j-th epoch, denoted by Ej
. The epoch has Wj
total earnings
accrued at its beginning, and the LP uses xj
as a proportional allocation for the duration
of the epoch. Given the cost model from the previous paragraph, it follows that the LP’s
wealth at the end of the epoch (and hence at the beginning of Ej+1
) is given by:
Wj+1
= ηWj
· V (xj
,Ej
).26 Strategic Liquidity Provision in Uniswap v3
Now let us suppose that applying a dynamic reset strategy Λ to P results in k epochs.
We can express the overall earnings of the LP as follows:
V (Λ,W,P) = ηWk
· V (xj
,Ej
) = W ηk
k Y
i=1
V (xj
,Ej
)
!
,
where we have unpacked each Wj
in the product. Importantly, we notice that this expression
is in fact linear in W, hence it follows that V (Λ,W,P) = W · V (Λ,P).
Logarithmic Risk-aversion
In Section 4.1 we modeled risk-averse LPs via Constant Absolute Risk Aversion (CARA)
utilities. Another common choice for risk aversion in LPs is that of logarithmic utility, as in
the work of [11].
▶ Definition 13 (Logarithmic Utility). The logarithmic utility function ul : R → R is:
ul(x) = log(x)
Optimal Context-Independent Allocations as a Convex Optimization Problem
In this section we focus on context-independent τ-reset allocations. We recall that such
dynamic liquidity provision strategies have the constraint that the LP uses the same relative
allocation at each reset (i.e. all xj
are equal in all epochs), hence the space of all such
allocations can be identified with the convex (2τ + 2)-dimensional simplex, with x ∈ ∆2τ+2
denoting the common strategy used at all liquidity resets. We let Λ(x) denote the context-
independent τ-reset allocation that makes use of x at each reset.
Following the notation of Section 4.1, we are ultimately interested in optimizing the
following objective:
V ul
τ,P(Λ(x)) = EP∼P[ul(V,Λ(x),P)]
where P is a liquidity-independent price distribution and ul is the logarithmic risk-aversion
utility function.
▶ Theorem 14. V ul
τ,P is concave in x.
Proof. From the previous section, we know that V (Λ(x),P) = ηk
Qk
i=1 V (x,Ej
). If we
apply logarithmic utilities to this expression, we obtain:
ul(V (Λ(x),P)) = klog(η) +
k X
i=1
log(V (x,Ej
)).
We recall that for each epoch, V (x,Ej
) is linear in x. Since the log function is concave
and nondecreasing, it follows that log(V (x,Ej
)) is in turn concave in x. It follows that
ul(V (Λ(x),P)) is concave in x since it is the sum of a constant independent of x and another
sum of concave functions in x. ◀
As before, we can approximate the objective function by taking samples from P. As such,
suppose that P1,...,PN ∼ P. The empirical average earnings of an LP are given by:
V̂ ul
τ,P(x | P1,...,PN) =
1
N
N X
q=1
ul(V (Λ(x),Pq)),Z. Fan et al. 27
where this expression is concave in x as per Theorem 14. If we take expectations we obtain
EP1,...,PN ∼P
h
V̂ ul
τ,P(x | P1,...,PN)
i
= V ul
τ,P(Λ(x).
Ultimately, we denote the optimal liquidity allocation in this context by OIRA’, and the
convex optimization problem used to compute it is as follows:
min
x
− V̂ ul
τ,P(x | P1,...,PN)
s.t. x ∈ ∆2τ+2
(3)28 Strategic Liquidity Provision in Uniswap v3
Symbol Description
γ Fee tier of contract
µ = {B−n,...,Bm} Set of price buckets in contract
Bi = [ai,bi] i-th price bucket
P ∈ (0,∞) Contract price
V(3)
(L,P,Bi) Token bundle value of L units of Bi-liquidity at contract price P
(σ,L) Liquidity Allocation profile of v3 contract
P = (P1,...,PT ) Contract-market price sequence over time horizon of length T
Pt = (Pc,t,Pm,t) Contract-market price at time t
W Initial token B budget of LP
x = (x−n,...,xm) Proportional liquidity allocation
B((z1,z2),Pm) Token B value of (z1,z2) bundle of A and B tokens at market price Pm
ℓ = (ℓ−m,...,ℓn) Absolute liquidity allocation
wi,w′
i Token B value of 1 unit of liquidity at beginning (end resp.) of time horizon
FA
(x,W,P), FB
(x,W,P) Token A and B fee rewards for x over P with initial budget W
C(x,W,P) Token B value of LP position at time T
V (x,W,P) Token B earnings of LP at time T
η Reallocation cost
(E1
,...,Ek
) Epochs of reset LP strategy
t = (t1
,...,tk
) Reset times over contract-market price sequence
Wj
Cumulative token B wealth at beginning of Ej
Cj
Context feature used as input of NN at beginning of Ej
X Matrix with proportional allocations at each epoch (rows)
(t,X) Realized dynamic liquidity provision allocation profile
Λ Reset LP strategy
V (Λ,P) Token B earnings of LP with W = 1 under reset LP strategy Λ
P Distribution over contract-market prices sequences
R Number of rounds of market-price updates
k = (k1,...,kR) Vector with number of non-arbitrage trades per round
λ = (λ1,...,λR) Vector with magnitude of non-arbitrage trades per round
λ̄,α Average and spread of values in λ over all rounds
Table 1 Relevant Notation