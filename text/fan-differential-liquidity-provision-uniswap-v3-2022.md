---
sha256: cb9df0abb035533307da83add1d6aeb7390bb52a2266b775187a0892978e6449
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 125324
---
Differential Liquidity Provision in Uniswap v3 and Implications for
Contract Design
Zhou Fan∗,†,1
, Francisco Marmolejo-Cossı́o∗,†,1,2
, Ben Altschuler‡,1
, He Sun†,1
,
Xintong Wang†,1
, and David C. Parkes§,1
1
Harvard University
2
IOHK
Abstract
Decentralized exchanges (DEXs) provide a means for users to trade pairs of assets on-chain
without the need for a trusted third party to effectuate a trade. Amongst these, constant
function market maker DEXs such as Uniswap handle the most volume of trades between ERC-
20 tokens. With the introduction of Uniswap v3, liquidity providers can differentially allocate
liquidity to trades that occur within specific price intervals. In this paper, we formalize the
profit and loss that liquidity providers can earn when providing specific liquidity allocations
to a v3 contract. We give a convex stochastic optimization problem for computing optimal
liquidity allocation for a liquidity provider who holds a belief on how prices will evolve over time
and use this to study the design question regarding how v3 contracts should partition the price
space for permissible liquidity allocations. Our results show that making a greater diversity of
price-space partitions available to a contract designer can simultaneously benefit both liquidity
providers and traders.
Keywords: blockchain, decentralized finance, Uniswap v3, liquidity provision
## 1 Introduction
A key application in decentralized finance (DeFi) is that of decentralized exchanges (DEXs). DEXs
offer smart contracts that allow users to trade tokens without the need of a trusted-third party
to effectuate the trade. A benefit of such an implementation is that it avoids the hacking risks
that can be suffered by centralized, off-chain exchanges. Amongst DEXs, there are two prevailing
algorithmic paradigms for executing a trading contract: order book DEXs and automated market
maker (AMM) DEXs. Order book DEXs maintain a list of buy and sell orders from users at distinct
prices for a given pair of assets to be traded, with these orders received, matched and executed.
An AMM DEX, on the other hand, will always quote a buy and sell prices for any trade, where
these prices depend on the contract’s assets and the rules of the AMM.
∗
These authors contributed equally to this work.
†
{zfan, fjmarmol, he sun, xintongw}@g.harvard.edu
‡
baltschuler@college.harvard.edu
§
parkes@eecs.harvard.edu; also DeepMind
1
arXiv:2204.00464v2 [cs.GT] 25 Aug 2022AMMs are the most common form of DEXs, amongst which Uniswap contracts handle a sub-
stantial proportion of trading volume. Uniswap contracts serve as constant function market makers
(CFMMs), which are a popular kind of AMM design. In CFMMs, the contract computes the price
of buying and selling between two assets by preserving a functional invariant of its existing liquidity
reserves. To briefly describe the operation of a CFMM, let x and y denote the liquidity reserves
the contract has of each of two assets, say token A and B respectively. The trading invariant
can be expressed as F(x,y) = C, for a given function F and constant C. A trader who wishes
to sell ∆x > 0 of token A must send ∆x units of A tokens to the contract, and the amount of
token B they receive is the value, ∆y > 0, such that the functional invariant is maintained, i.e.
F(x + ∆x,y − ∆y) = C. The quantity ∆y/∆x represents the average, per-unit price of token A
for the trade (in terms of token B). As ∆x → 0, this ratio gives the instantaneous price of token
A in terms of token B for a contract with with a bundle of assets given by (x,y).
Liquidity providers (LPs) provide assets to the contract and enable these trades. An LP lends
the contract a bundle of A and B tokens, which is traded against as the relative price of token A
(or equivalently token B) changes. Liquidity provision is rewarded by means of transaction fees on
trades. In May 2021, Uniswap v3 introduced a new family of AMMs where LPs can differentially
allocate liquidity to a v3 contract [1]. v3 contracts allow users to allocate liquidity to be used
for trades in a specific price interval. The fees associated with a trade are shared proportionally
amongst the LPs who provide liquidity on intervals that contain the associated price change. With
this change, LPs can use the same capital to obtain more aggressive liquidity allocations around
tight price intervals, and thus potentially earn more fees (at the risk of losing out on fees all together
if prices leave a particular price interval). Another important consideration for LPs is that trades
that occur on the contract and price changes change the composition of capital that an LP has a
claim to. If prices returns to where they were when liquidity was first provided, then the LP can
withdraw its liquidity in the same token quantities as initially lent. Otherwise, the bundle of tokens
to which an LP has claim has a lower value when evaluated at the new price. This phenomenon
is referred to as the impermanent loss of a liquidity allocation, and is a crucial consideration for
liquidity provision.
## 1.1 Our Contributions
Given the rapid increase in DEX usage,1 and the associated questions around contract design, it
is important to understand the decision problem facing an LP. This paper builds off existing work
to provide a new theoretical and empirical understanding of LP behavior, and in turn to provide
concrete design recommendations for Uniswap v3 contracts.
We begin by providing an overview of Uniswap dynamics for v2 and v3 contracts in Section 2.
In Section 3, we provide an expression for LP profit and loss over a sequence of price changes in
the contract. In Section 4, we formulate a convex stochastic optimization problem for the problem
facing a risk-averse LP who seeks to optimize its profit and loss over a finite time horizon, given
beliefs as to how prices will evolve (we also give an linear programming formulation for a risk
neutral provider). The optimization problem fundamentally relies on the simplified assumption
that prices follow a stochastic process that is independent of liquidity provision. More specifically,
1
At the time of writing, the daily trade volume in Uniswap v2 and v3 contracts is approximately 96 Million USD
and 1.14 Billion USD respectively. In addition, the total liquidity locked by users to facilitate trades in v2 and
v3 contracts is 1.51 Billion USD and 4.57 Billion USD respectively. v2: https://v2.info.uniswap.org/home, v3:
https://v3.info.uniswap.org/home.
2we assume a price-based, stochastic flow of non-arbitrage trades that can shift the spot price of a
Uniswap contract away from an assumed market price, as well as arbitrage trades that keep the
spot price of the Uniswap contract close to the market price (how close depends on the underlying
transaction fees of the contract). Remarkably, this assumption of an exogeneous price dynamic
makes the problem facing a single LP that of a (single-agent) decision-theoretic problem rather
than a game-theoretic problem. We leave to future work a more sophisticated model of trade flow
with resulting price sequences that also depend on liquidity within a Uniswap contract.
In Section 5 we apply this model of LP behavior to the design question of how v3 contracts
should partition the price space in affording different liquidity allocations by LPs. There is a trade
off to be struck: finer partitions provide more flexibility for LPs and thus a better ability to optimize
return on investment, but increases the gas cost to traders as as a result of higher computational
overhead in determining trade dynamics over more complicated liquidity allocations. Through
experiments that are calibrated to real price data 2, we provide empirical evidence that a greater
diversity of price partitions available to a contract designer can benefit both LPs and traders. We
study a wide family of log-linear price partitions that generalize the current partition of price space
used by v3 contracts, and show that our results are robust to a wide array of assumptions regarding
token price volatility, drift, as well as gas prices. Furthermore, we also study how different degrees
of risk-aversion impact optimal liquidity allocations for LPs. We find that as LPs become more
risk-averse, they spread their liquidity across larger price ranges, as this helps reduce the variance in
their profit and loss over extended price sequences. Moreover, we also see that increased volatility
in price sequences also causes risk-averse LPs to spread their liquidity allocations further over a
larger price range.
## 1.2 Related Work
This paper extends a growing body of literature around the incentives of liquidity provision from
on-chain implementations of CFMMs. Most closely related is Neuder et al. [15], who study strategic
liquidity provision in Uniswap v3. As in our work, they assume that LPs holds beliefs that contract
prices will evolve according to a Markov chain, and they provide a method for LPs to maximize
fees earned in the steady state of the chain. One major difference in the present work is that we
model impermanent loss in addition to fees earned, which is a first-order consideration for LPs. A
second major difference is that we study the question of the design of v3 contracts in regard to the
partitioning of the price space for potential liquidity allocations, a problem which to our knowledge
has not been considered before in the CFMM literature.
With regards to Uniswap v2, Angeris et al. [7] provide theoretical evidence showing that under
reasonable conditions v2 exchanges closely track reference markets. Their work involves modeling
potential arbitrage opportunities for traders, even as they are faced with trading fees in CFMMs.
In addition, their work provides expressions for potential LP earnings under simple price changes in
v2 contracts. This work is extended in Angeris and Chitra [3], who provide similar guarantees for a
more general class of CFMMs, as well as in Angeris et al. [2], where similar results and techniques
are extended to CFMMs supporting multi-asset trades. In Angeris et al. [4], the authors also study
the implications of the curvature in reserve curves for traders and LPs, providing concrete tradeoffs
for when high and low curvature regimes favor each of these two classes of agents. All these results
2
As further specified in Appendix E, we use per-minute price data between Ethereum (ETH) and Bitcoin (BTC)
as well as between Ethereum (ETH) and Tether (USDT) for the month of February 2020, obtained from Binance, to
calibrate beliefs LPs may have regarding external prices in our experiments
3focus on v2 contracts however, and not on the richer space of liquidity allocations presented by v3,
nor on the design questions related to v3 contracts.
A related branch of work also studies how LPs can replicate the payoffs of financial derivatives.
Evans [13] focuses on geometric mean market makers (CFMMs with functional invariants which
preserve a weighted geometric mean of assets held in the contract), and more general results are
shown in a series of papers by Angeris et al. [5] and [6] for a larger class of financial derivatives.
Finally, Capponi and Jia [11] study the adoption of Uniswap v2 by considering a sequential game
between LPs and traders, and use a similar stochastic model for price changes as that adopted in
the present paper.
The liquidity provision problem in Uniswap also shares similarities with market making in limit
order markets. Avellaneda [10], for example, sets up the market making problem of posting bid and
ask quotes in a maximized exponential utility framework and solves it in a two step approach where
the market-maker first computes an indifference valuation of the traded stock that incorporates
inventory risk, then decides where to place the bid and ask quotes based on a probabilistic model
of orders being executed at different prices given the current mid-price. Our study of LP revenue
as a function of the fidelity in setting liquidity allocations is related, also, to the tick size design
problem in traditional limit order markets, which has attracted considerable attention from both
an economics and regulatory perspective. European exchanges, for example, compete directly on
the minimum pricing increment in the limit order book to capture market shares of quoted and
executed volumes [14]. In 2016, the US Securities and Exchange Commission (SEC) launched the
Tick Size Pilot Program to assess the impact of increasing tick sizes on the market quality for
illiquid stocks [12].
## 2 Overview of Uniswap
A core functionality of Uniswap contracts is to provide a family of CFMM DEXs for trading between
ERC-20 token pairs. In this section, we provide a brief overview of the mechanics of Uniswap v2
and Uniswap v3 to lay the groundwork for subsequent sections.
## 2.1 Uniswap v2: Providing Liquidity at all Prices
A Uniswap v2 contract facilitates trades between a pair of ERC-20 tokens, say Token A and Token
B. LPs provide liquidity in the form of bundles of A and B tokens to the contract. Let x > 0 and
y > 0 denote the number of A tokens and B tokens, respectively, provided by LPs to the contract.
We refer to (x,y) as the v2 contract state.
2.1.1 v2 Reserve Curve
As trades are made, Uniswap v2 maintains a functional invariant on the liquidity held in the
contract. The number of assets in the contract must satisfy F(x,y) = C, for function F and
constant C. We refer to the collection of all states (x,y) ∈ (R+)2 that satisfy F as the reserve
curve. In particular, if a trader sells ∆x > 0 units of A, they receive ∆y > 0 units of B, such that
F(x + ∆x,y − ∆y) = C is maintained. For Uniswap v2, F(x,y) = xy, and the reserve curve is as
visualized in Figure 1.
Let L =
√
xy denote a quantity that we refer to as the number of liquidity units in a contract.
This provides a convenient, single-valued measure of how much liquidity is held in the contract.
4Figure 1: The x,y coordinates on the Uniswap v2 xy = L2 reserve curve, with points illustrated
for prices Pa < Pm < Pb. Buying xr units of token A requires sending (yb − ym) units of token B
to the contract and increases the price from Pm to Pb. Buying yr units of token B requires sending
xa − xm units of token A to the contract and decreases the price from Pm to pa.
With this, the reserve curve is the set of states (x0,y0) that satisfy x0y0 = L2. In this sense, liquidity
L controls the set of allowable trades, including the way trades are priced.
Definition 1 (Uniswap v2 Reserve Curve). For L > 0 units of liquidity held in the contract, we
let R(2)(L) denote the v2 reserve curve at liquidity L between token A and token B, with
R(2)
(L) = {(x,y) ∈ R+
× R+
| xy = L2
}. (2.1)
## 2.1.2 Contract Price
The infinitesimal price P of token A in terms of token B is the contract price, and depends on the
contract state (x,y). For an amount of liquidity L, the amount of token B held in the contract
depends functionally on the amount of token A, with y = fL(x) for fL(x) = L2/x. With this, the
instantaneous price P of token A given liquidity L is −dfL(x)/dx and we have,
P = −
dfL(x)
dx
=
L2
x2
=
y
x
. (2.2)
The constant-product function can also be re-written as (x/L)(y/L) = 1, from which we see
that when L is higher, the contract price, P = (y/L)/(x/L) slips less in response to trades; i.e.,
changing the price from P to P0 requires a larger change in the contract state, in terms of ∆x or
∆y, when the liquidity, L, is larger. Based on the following correspondence, each point on reserve
curve R(2)(L) can be identified by (x,y) assets of token A and token B, or equivalently (L,P) and
the amount of liquidity and the contract price.
5Proposition 1. If a Uniswap v2 contract has L units of liquidity and a contract price P, it must
be the case that the contract state is given by (x,y) such that:
x =
L
√
P
, y = L
√
P. (2.3)
Proof. Immediate, by verifying (x,y) ∈ R(2)(L) and P = y/x.
A consequence of Proposition 1 is that a contract’s state can be represented by the bundle of A
and B tokens the contract holds as liquidity, (x,y), or equivalently by how much liquidity is held in
the contract, and at what contract price, i.e. (L,P). We call the former the token-bundle contract
state and the latter the liquidity-price contract state. For a given liquidity-price state, (L,P), we
refer to the corresponding token-bundle contract state as the v2 bundle value of L units of liquidity
at price P and denote this as V(2)(L,P) = (L/
√
P,L
√
P). From Proposition 1, the bundle value
of L units of liquidity is linear in L, and we also write V(2)(P) = V(2)(1,P) for the bundle value of
1 unit of liquidity, so that V(2)(L,P) = L · V(2)(P).
## 2.1.3 Providing and Removing Liquidity
LPs can add liquidity to the contract or remove liquidity they own under the invariant that the
price P remains unchanged. For example, an LP who wants to add L0 units of liquidity to the
contract with current liquidity-price state of (L,P) and token-bundle state of (x,y) must deposit
V(2)(L0,P) = (x0,y0), which is a bundle of A tokens and B tokens. The effect is to change the
token-bundle state to (x + x0,y + y0) and the liquidity-price state to (L + L0,P). Similarly, an LP
with claim to L0 units of liquidity may remove a token bundle consisting of V(2)(L0,P) = (x0,y0),
from the contract. The resulting token-bundle state is (x − x0,y − y0) and the liquidity-price state
is (L−L0,P). This is formalized in the following proposition, whose proof is deferred to Appendix
A.
Proposition 2. Suppose that (x,y) ∈ R(2)(L) with P = y/x, and (x0,y0) ∈ R(2)(L0) such that
P0 = y0/x0 = P. Then (x + x0,y + y0) ∈ R(2)(L + L0), and in addition, (y0 + y)/(x + x0) = P. If
L0 < L, then (x − x0,y − y0) ∈ R(2)(L − L0) and (y − y0)/(x − x0) = P.
## 2.1.4 Trading Fees
When a trade occurs in Uniswap v2, a portion goes to the LPs as fees. Suppose a trader sends ∆x
units of token A to purchase units of token B (the case where the roles of A and B are reversed
is identical). In this case, γ∆x units of A are skimmed as trade fees and allocated to LPs in
proportion to how much liquidity they have contributed, for fee rate, γ ∈ (0,1). More specifically,
let us assume that there are d ∈ N LPs, such that the j-th LP has provided Lj units of liquidity
and the total liquidity in the contract is given by L =
Pd
j=1 Lj. For the given trade, the j-th LP
receives (
Lj
L )γ∆x units of token A. The remaining (1 − γ)∆x units of A sent from the trader are
used to move along the reserve curve, shifting the contract’s token-bundle state to (x0,y0), where
x0 = x + (1 − γ)∆x, and y0 is such that (x0,y0) ∈ R(2)(L), and the trader receives y0 − y units of
token B in return for this trade. In Appendix C.1 we provide an in-depth example of v2 trade
dynamics.
62.2 Uniswap v3: Concentrated Liquidity Provision
In v2 contracts, LPs provide assets to the contract to facilitate trades at any contract price and
an LP’s contributions to the contract is measured in units of v2 liquidity. In v3 contracts, LPs are
given the option to allocate liquidity to be used only for trades in a finite price interval [a,b]. As
we will see, we use an analogous, single-valued measure of an LP’s contribution to prices in this
range, which we refer to as units of [a,b]-liquidity.
At a high level, providing L units of [a,b]-liquidity has two key consequences regarding trans-
action fees earned by an LP:
(i) this liquidity only earns fees when the contract price is in [a,b], where fees are split pro-
portionally amongst all LPs who have allocated liquidity at intervals including the contract price,
and
(ii) the value (in terms of either units of token A or token B) of the bundle of tokens equivalent
to L units of [a,b]-liquidity is smaller as the interval [a,b] becomes smaller.
Combining these two points, if an LP has a certain initial capital in terms of tokens A and B,
they can potentially obtain more liquidity units over smaller intervals, and hence increase the fees
they potentially accrue. However, this comes at the risk of not earning fees when prices exit the
liquidity’s given interval. As with v2 contracts, when an LP provides L units of [a,b]-liquidity, they
send a bundle of A and B tokens equivalent to the bundle value of L units of [a,b]-liquidity at the
given contract price (albeit with different expressions for bundle value). As the token price changes,
the LP may face losses in the redeemable token bundle value of L units of [a,b]-liquidity relative to
the value they would have accrued simply holding their initial liquidity before obtaining the liquidity
from the contract. This phenomenon is called impermanent loss (this phrasing recognizing that this
loss disappears if the prices return to their original values). In Section 3, we provide more details
on these considerations, where we note that as the relevant interval decreases for [a,b]-liquidity the
potential impermanent loss to an LP increases.
2.2.1 [a,b]-Liquidity
In Uniswap v3, an LP provides liquidity for a specific price interval, denoted [a,b], and we quantify
a user’s contribution in terms of [a,b]-liquidity units. We introduce the following notation,
∆x
P,P0 =
1
√
P0
−
1
√
P
, ∆y
P,P0 =
√
P0 −
√
P, (2.4)
where ∆x
P,P0 and ∆y
P,P0 represent the change in x and y values, respectively, along the v2 reserve
curve for unit liquidity, R(2)(1), as the contract price changes from P to P0. We provide a map
from [a,b]-liquidity to a token position, for Uniswap v3, that is analogous to the v2 function that
gives the bundle value.
Definition 2 ([a,b]-Liquidity value). Suppose that the contract price is P ∈ (0,∞). We let
V(3)(L,a,b,P) ∈ R+ × R+ denote the bundle value of L units of [a,b]-liquidity, which is a bundle
of A and B tokens respectively, and the number of tokens that is equivalent to liquidity L on this
interval at price P, with
V(3)
(L,a,b,P) =



(L∆x
b,a,0) if P < a
(0,L∆y
a,b) if P > b
(L∆x
b,P ,L∆y
a,P ) if P ∈ [a,b]
(2.5)
7As with the v2 value function, this expression is linear in L, hence we also use the shorthand
for V(3)(a,b,P) = V(3)(1,a,b,P) so that V(3)(L,a,b,P) = L · V(3)(a,b,P). In particular, an LP
who wants to add L0 units of [a,b]-liquidity to a v3 contract, when the contract price is P, must
send the token bundle V(3)(L0,a,b,P) to the contract. An LP who wants to remove L0 units of
[a,b]-liquidity will receive the token bundle V(3)(L0,a,b,P).
As mentioned above, as the interval [a,b] becomes smaller, the bundle value of L0 units of
[a,b]-liquidity falls; i.e., L0 units can be added with fewer A and B tokens. At the same time, fees
for [a,b]-liquidity are limited to trades at prices P ∈ [a,b]. In the converse, as the interval [a,b]
approaches the entire price interval, we recover the v2 liquidity value. The proof of the following
is deferred to Appendix A.
Proposition 3. In the limit of an [a,b]-interval that approaches the entire price interval, the value
of Uniswap v3 liquidity is that of Uniswap v2 liquidity, i.e.,
lim
a→0,b→∞
[V(3)
(a,b,P)] = V(2)
(P). (2.6)
2.2.2 v3 Reserve Curves
Suppose that a v3 contract has L units of [a,b]-liquidity, in addition to other liquidity over the
rest of the price space. In v2, trades move the contract state along the reserve curve, R(2)(L), and
this keeps the total number of liquidity units in the contract constant. The same holds for a v3
contract, albeit for trades for which the contract price remains in the interval. To explain this,
we first define the reserve curve that corresponds to L units of [a,b]-liquidity. For this, we define
φA
a,b(z) = z + L √
b
and φB
a,b(z) = z + L
√
a, and write φa,b(w,z) = (φA
a,b(w),φB
a,b(z)).
Definition 3 (Uniswap v3 reserve curve). Given L units of [a,b]-liquidity in Uniswap v3, we denote
the reserve curve at [a,b]-liquidity L by R(3)(L,a,b), with
R(3)
(L,a,b) = {(x,y) ∈ R+
× R+
| φA
a,b(x) · φB
a,b(y) = L2
}. (2.7)
For a given v3 reserve curve, R(3)(L,a,b), we call R(2)(L) the virtual reserve curve of the assets,
appealing here to the v2 reserve curve. As the following proposition shows, the v3 reserve curve is
a positive affine transformation of the portion of R(2)(L) that corresponds to token-bundle states
with a contract price in [a,b]. Furthermore, prices are preserved for trades in this interval since the
transformation is positive affine. An example of a v3 reserve curve and its virtual reserve curve is
visualized in Figure 2.
Proposition 4. Suppose that (x,y) ∈ R(3)(L,a,b). It follows that φa,b(x,y) ∈ R(2)(L), and if we
let P = φB
a,b(y)/φA
a,b(x), then P ∈ [a,b] and (x,y) = V(3)(L,a,b,P).
The proof of Proposition 4 can be found in Appendix A. It shows that the affine map φa,b
naturally maps φa,b to R(2)(L). In this regard, we say a token bundle (x,y) ∈ R(3)(L,a,b) has a
contract price given by P =
φB
a,b(y)
φA
a,b(x)
.
## 2.2.3 Trading and Fees
Having described how LPs can provide and remove liquidity over different price intervals by sending
a v3 contract the required token bundles, we now describe the trade dynamics for a v3 contract.
8Figure 2: The affine shift of the Uniswap v2 reserve curve (blue line) to the v3 reserve curve (red
line). The v3 reserve curve is only defined when the price is in the interval [a,b], where a < b are
the price bounds specified by the LP.
Let us assume that d LPs have provided liquidity to the contract, where we assume that the j-th
LP has provided precisely Lj units of [aj,bj]-liquidity 3. In addition, suppose the v3 contract has a
current price given by P ∈ (0,∞). In what follows, we will show the dynamics of a trade that moves
the contract price to P0 < P (the case where the price increases is symmetric). Before continuing,
we make two key assumptions on the positions provided by LPs:
A1 If the j-th and r-th LPs have allocations over intervals [aj,bj] and [ar,br] respectively, then
either the intervals are the same, the intervals are disjoint, or their intersection is at their
boundaries.
A2 There exists an LP with an allocation [ai,bi] such that [P0,P] ⊆ [ai,bi].
These assumptions are without loss of generality. For A1, this hinges on Proposition 5, with
proof in Appendix A, which tells us that if an LP has an allocation worth L units of [a,b]-liquidity,
the token-bundle value of such an allocation can be decomposed into that of L units of [a,c] and
[c,b] liquidity for any choice of c ∈ (a,b). Furthermore, this decomposition holds at any price.
Proposition 5. Consider an arbitrary closed interval [a,b] and a value c ∈ (a,b). Let P be an
arbitrary contract price, then
V(3)
(L,a,c,P) + V(3)
(L,c,b,P) = V(3)
(L,a,b,P). (2.8)
To apply this result to our scenario, suppose that the j-th and r-th LP do not satisfy the first
assumption. Let the intersection over their positions be [a0,b0] = [aj,bj] ∩ [ar,br]. For each LP,
we can decompose their liquidity to be over [a0,b0] and at most two other price segments (this
3
This is without loss of generality. To see why, suppose that an LP has provided L1 units of liquidity to the
interval [a1,b1] and L2 units of liquidity to [a2,b2] with L1 > L2 and b1 = a2. This allocation is identical to the LP
providing L1 units of liquidity to [a1,b2] and L2 −L1 units of liquidity to [a2,b2], where we can treat each allocation
as a different LP. This argument can be extended to arbitrary liquidity allocations.
9follows from Proposition 5). The resulting positions, when treated as different LPs, satisfy our first
assumption.
With regards to A2, when a v3 contract is created, an LP allocation is created on the entire
price space, this corresponding to a v2 allocation for some amount of liquidity determined by the
entity creating the contract. This means that there must exist LPs with positions over intervals
[ai,bi] and [aj,bj] such that P ∈ [ai,bi] and P0 ∈ [aj,bj]. If these intervals are not equal, then
it must be the case that P0 < ai < P, in which case, we can decompose the price movement as
occurring from P to P00 = ai and subsequently to P0. Ultimately [P,P00] ⊆ [ai,bi], and we obtain
the desired assumption above.
Trading with Active Liquidity. Returning to the example, there is a contract price P and
a trade that moves the contract price to P0 < P by sending A tokens to the contract. If the
allocation corresponding to the interval [aj,bj] of the j-th LP contains P, then we say the LP is
active and that their Lj units of [aj,bj]-liquidity is active liquidity. Assumptions A1 and A2 imply
the existence of values, a∗ and b∗, such that if the j-th LP is active, then aj = a∗ and bj = b∗. We
call [a∗,b∗] the active interval at price P.
Without loss of generality, assume the first s of the d LPs are active, and say that L =
Ps
j=1 Li
is the total active liquidity at price P and (x,y) = V(3)(L,a∗,b∗,P) ∈ R(3)(L,a∗,b∗) denote the
active bundle at price P. Traders will send assets to the v3 contract, which move the active bundle
along the v3 reserve curve, which is given by R(3)(L,a∗,b∗) and we refer to as the active v3 reserve
curve. Finally, we let x∗ = L √
a∗ and y∗ = L
√
b∗, where values x∗ and y∗ denote the maximum
amount of A tokens and B tokens, respectively, that can be achieved by bundles on the active
reserve curve.
We recall that γ ∈ (0,1) is the trade fee rate of the contract and begin by considering a trader
who sends ∆x ≤ 1
1−γ (x∗ −x) units of token A to the contract. This trade amount ensures that the
active bundle can move to another bundle on the active reserve curve. First, fees of γ∆x units of
token A are skimmed for LPs and this is shared among the active LPs, proportionally, such that if
the j-th LP is active, they will receive
Lj
L γ∆x units of token A. The remaining (1−γ)∆x ≤ x∗ −x
of token A moves the active bundle to a bundle with x0 = x + (1 − γ)∆x ≤ x∗ units of A tokens.
That x0 ≤ x∗, ensures that there is a corresponding y0 such that the bundle (x0,y0) lies on the active
reserve curve, with contract price of P0 =
φa∗,b∗(y0)
φa∗,b∗(x0) ∈ [a∗,b∗]. The trader receives y − y0 units of B
tokens.
If the trader sends ∆x > 1
1−γ (x∗ −x) units of token A, the contract first trades 1
1−γ (x∗ −x) such
tokens, which moves the contract bundle to the boundary of the active reserve curve. To trade the
remaining tokens the contract must exit the current active interval, and determine the new active
interval along with the set of active LPs and active liquidity. Whatever gas fees are needed for the
computation of the aforementioned active quantities within the contract are charged to the trader
4. Ultimately, the remaining 1
1−γ (x∗ −x)−∆x units of A tokens are then traded iteratively as per
this process. In Appendix C.2, we provide an in-depth example of v3 trading dynamics.
Price Buckets. A Uniswap v3 contract partitions the space of all prices, (0,∞), into intervals,
which are called price buckets. The effect is that an LP can only provide [a,b]-liquidity for values
4
Gas fees are also charged to traders for the computational overhead in updating v2 contracts, but we model only
the (significant) surplus gas fees paid by traders participating in v3 contracts for the computation of active intervals
10of a and b that correspond to endpoints of buckets (and an interval over which liquidity is provided
corresponds to a set of contiguous buckets). We assume that there are n+m+1 buckets, with indices
from the set {−m,...,0,...,n}. The i-th such bucket is denoted by Bi, and typically represents
an interval [ai,bi]. We distinguish B−m and Bn however as representing the intervals (a−m,b−m] =
(0,b−m] and [an,bn) = [an,∞) respectively. Thus we have ∪iBi = (0,∞), and bi = ai+1 for all
i < n. By convention, the unit price P = 1, where tokens A and B are at parity within the contract,
lies in the 0-th bucket (and a0 < 1 < b0). In addition, we let µ = {B−m,...,B0,...,Bn} denote
the set of buckets in the v3 contract.
3 LP Profit and Loss over Price Sequences
Going forward, we assume that v3 contracts are secondary to larger markets between token pairs,
these existing on centralized exchanges. As a result, there is a market price that is determined by
on a centralized exchange and tha also influences the contract price through arbitrage trading. In
this regard, it is important to highlight that the contract price from the previous section need not
coincide with the market price of token A on external exchanges. As we will see, keeping track of
both quantities is important to the profit and loss of an LP.
To facilitate exposition, we will denote the market price by Pm and the contract price by Pc
when it is necessary to distinguish them. Furthermore, we let P = (Pc,Pm) denote a contract-
market price pair. In what follows, we consider the perspective of an LP who borrows capital to
create a liquidity allocation in a v3 contract. We let ` = (`−m,...,`0,...,`n) denote the liquidity
allocation of the LP over each of the m + n + 1 buckets in the contract, where `i denotes the units
of [ai,bi]-liquidity held by the provider.
Let B : (R+)2 × R+ → R+ be the function that returns the market worth in terms of token B
of a bundle of A and B, under the assumption that token A has a market price of Pm, that is
B((x,y),Pm) = Pm · x + y. (3.1)
To obtain L0 units of [ai,bi]-liquidity, i.e. corresponding to a particular bucket, when the
contract price is Pc requires an LP to send a bundle of A and B tokens given by V(3)(L0,ai,bi,Pc) =
L0 · V(3)(ai,bi,Pc). At market price Pm, this bundle has an equivalent token B worth given by
B(V(3)(L0,ai,bi,Pc),Pm) units of token B.
## 3.1 Transaction Fees over a Price Sequence
LPs earn fees when trades occur (and thus the contract price changes). We express the fees
accrued by an LP with liquidity allocation ` over a finite sequence of contract-market price pairs
P = (P0,...,PT ). For this, let Pt = (Pc,t,Pm,t) denote the t-th contract-market price pair. Without
loss of generality, we assume that each individual contract price movement from Pt to Pt+1 occurs
within a single bucket (we can always split the price movement accordingly). We focus on a single
contract price movement from Pc,t → Pc,t+1, where Pc,t,Pc,t+1 ∈ [ai,bi]. We let L0
t→t+1 = `i denote
the liquidity the LP has in this bucket, and let Lt→t+1 denote the total liquidity of all LPs have in
this bucket.
We first consider an upward contract price movement, Pc,t → Pc,t+1, where Pc,t+1 > Pc,t. Here,
∆y = Lt→t+1∆y
Pc,t,Pc,t+1
units of token B are used for trading with the contract. Since a γ proportion
of all funds sent to the contract are skimmed for LP fees, this means (1/(1 − γ))Lt→t+1∆y
Pc,t,Pc,t+1
11units of token B are sent to the contract to move the price. Of this, a proportional L0
t→t+1/Lt→t+1
quantity of ∆y is traded using the L0
t→t+1 units of liquidity of the LP (liquidity that is active in
the interval [Pc,t,Pc,t+1]), and of this γ fraction is skimmed as fees. Combining, the LP earns
FB
Pt→Pt+1
(`) = L0
t→t+1

γ
1 − γ
∆y
Pc,t,Pc,t+1

(3.2)
units of token B for this contract price movement and FA
Pt→Pt+1
(`) = 0 units of A tokens.
The analysis for a downward contract price movement from Pc,t to Pc,t+1 with Pc,t+1 < Pc,t, is
almost identical. In this case, some number of units of token A are sent to the contract by a trader,
to move the contract price. In particular, ∆x = (1/(1 − γ))Lt→t+1∆x
Pc,t,Pc,t+1
units of token A, of
which the LP also receives a γL0
t→t+1/Lt→t+1 portion. Putting everything together, the LP earns
FA
Pt→Pt+1
(`) = L0
t→t+1

γ
1 − γ
∆x
Pc,t,Pc,t+1

(3.3)
units of token A for this price movement and FB
Pt→Pt+1
(`) = 0 units of B tokens. Finally, if the
contract price does not move, then no transaction fees are accrued. In other words, if Pc,t = Pc,t+1,
then FA
Pt→Pt+1
(`) = FB
Pt→Pt+1
(`) = 0.
Note that the transaction fee earned by a LP is determined by Pt,Pt+1, and L0
t→t+1, and does not
depend on the total liquidity Lt→t+1 that is active for this price movement. Similarly, in Uniswap
v2, the transaction fee that an LP earns from a single price movement is totally decided given
Pt,Pt+1, and L0, where L0 is the LP’s liquidity over the entire price interval [0,∞), regardless of the
total liquidity L over the entire price interval. This means that 1 unit of liquidity over [0,∞) in v2
and 1 unit of liquidity over a price interval [a,b] in v3 would gain the same amount of transaction
fees if the same price movement Pt to Pt+1 happens in v2 and v3 pools (given Pc,t,Pc,t+1 ∈ [a,b]).
We now express the total transaction fees earned under liquidity allocation ` and price sequence
P = (P0,...PT ). In what follows, we let I(A) denote the indicator function for event A.
Definition 4 (Trading fees). Suppose that a provider has liquidity allocation ` over the contract-
market price pair sequence given by P = (P0,...PT ). Let FA(`,P) and FB(`,P) denote the accrued
amounts of token A and token B to the provider respectively as trade fees, expressed as follows:
FB
(`,P) =
T−1 X
t=0
FB
Pt→Pt+1
(`) · I(Pc,t+1 > Pc,t), FA
(`,P) =
T−1 X
t=0
FA
Pt→Pt+1
(`) · I(Pc,t+1 < Pc,t).
(3.4)
In addition, let F(`,P) denote the accrued trading fees in terms of token B value at the final
market price, which is given by:
F(`,P) = B((FA
(`,P),FB
(`,P)),PT,m) = PT,m · FA
(`,P) + FB
(`,P). (3.5)
Notice that F(`,P) is linear in ` for any contract-market price sequence P.
## 3.2 Impermanent Loss
Suppose that an LP borrows the initial capital, which is a bundle of tokens A and B, to purchase `i
units of [ai,bi]-liquidity in a v3 contract, and needs to repay this bundle in the future. We assume
12the initial contract-market price pair is given by P = (Pc,Pm), in which case the capital borrowed
is precisely the bundle V(3)(`i,ai,bi,Pc) = `i · V(3)(ai,bi,Pc). Suppose the contract-market price
pair changes to P0 = (P0
c,P0
m) 6= P . At this price pair, the capital that was borrowed has a token
B worth, given by v
(3)
h (`i,Bi,P,P0) = B(V(3)(`i,ai,bi,Pc),P0
m). We call this the token B holding
value for the v3 asset. On the other hand, at price pair P0, the `i units of [ai,bi]-liquidity have
a token B worth of v
(3)
p (`i,Bi,P0) = B(V(3)(`i,ai,bi,P0
c),P0
m). We call this the token B purchase
value for the v3 asset.
The discrepancy in the purchase and holding value is the impermanent loss, and represents a
potential loss suffered by the LP, as they have to repay the equivalent token B value of the initial
borrowed capital. For v2 contracts, we can obtain similar expressions by letting v
(2)
h (`,P,P0) =
B(V(2)(`,Pc),P0
m) be the token B holding value, and v
(2)
p (`,P0) = B(V(2)(`,P0
c),P0
m) be the token
B purchase value of ` > 0 units of v2 liquidity.
Definition 5 (Impermanent Loss). Suppose that for a given bucket, Bi = [ai,bi], an LP has
obtained `i units of [ai,bi]-liquidity at initial price pair P = (Pc,Pm). As the contract price shifts
from P to P0 = (P0
c,P0
m) 6= P, the LP suffers a v3 impermanent loss of IL(3)
(`i,Bi,P,P0):
IL(3)
(`i,Bi,P,P0
) = v
(3)
h (`i,Bi,P,P0
) − v(3)
p (`i,Bi,P0
). (3.6)
If instead, an LP has obtained ` > 0 units of v2 liquidity at initial price pair P, then as the
contract price shifts from P to P0, the LP suffers a v2 impermanent loss of IL(2)
(`,P,P0):
IL(2)
(`,P,P0
) = v
(2)
h (`,P,P0
) − v(2)
p (`,P0
). (3.7)
For a given liquidity allocation ` obtained at initial price pair P = (Pc,Pm), let IL(3)
(`,P,P0)
denote the overall impermanent loss that an LP suffers from the contract-market price movement
from P to P0:
IL(3)
(`,P,P0
) =
n X
i=−m
IL(3)
(`i,Bi,P,P0
). (3.8)
Since we focus on v3 contracts, we also use the shorthand IL to refer to v3 impermanent loss.
In practice, when the contract price deviates enough from the market price, this presents an
arbitrage opportunity. For this reason, contract prices are expected to track market prices reason-
ably closely, with the degree of closeness depending on the fee rate, γ of the Uniswap contract, as
well as gas fees incurred by trades. Proposition 6 tells us that when the contract price perfectly
tracks the market price, then a trader’s impermanent loss is always non-negative.
Proposition 6. For any choice of initial contract-market prices, P = (Pc,Pm), and end prices
P0 = (P0
c,P0
m), the v3 impermanent loss, IL(3)(`,P,P0), is linear in `. In addition, if P0
c = P0
m, then
IL(3)(`,P,P0) is non-negative for any `. Similarly, for any choice of P and P0, the v2 impermanent
loss IL(2)(`,P,P0) is linear in `, and when P0
c = P0
m, it is non-negative for any choice of ` > 0.
## 3.3 Profit and Loss
We now describe the overall profit and loss of an LP with liquidity allocation ` as contract-market
prices follow the sequence P = (P0,...,PT ), and where the LP borrows the capital required to create
13their allocation `. The LP accrues fees over the price sequence, and at the end of the sequence,
they remove their allocation ` from the contract, thereby receiving an overall bundle of A and B
tokens that is a function of the end contract price, Pc,T . Finally, the LP must repay the capital
used to initially create the position, hence the overall profit and loss of the LP’s allocation simply
consists of their accrued fees minus their impermanent loss, where quantities are measured in terms
of token B using the final market price as reference of exchange between A and B tokens.
Definition 6 (Profit and Loss). We denote PnL(`,P) as the overall profit and loss of an LP with
liquidity allocation ` over contract-market price sequence P = (P0,...,PT ), i.e.,
PnL(`,P) = F(`,P) − IL(`,P0,PT ). (3.9)
Since F and IL are both linear in `, so is PnL for any price sequence P.
## 4 Optimal Liquidity Provision
In this section, we assume that an LP has a probabilistic model for contract-market prices sequences,
and formulate the problem of finding an optimal liquidity provision over a finite time horizon as an
optimization problem. For a risk neutral LP this is a linear program and for a risk averse LP this
is a convex optimization problem. We use the notation P to denote a distribution over contract-
market price sequences and call an instance of P the belief profile of an LP, prior to opening a v3
liquidity allocation.
## 4.1 Liquidity-independent LP Beliefs
In general, liquidity provision in Uniswap v3 is a game-theoretic problem, where the agents include
the LPs as well as traders. An important manifestation of the strategic interdependence of agents in
this game is the distribution P on contract-market prices. As a concrete example, consider multiple
LPs providing liquidity over buckets. If the aggregate liquidity allocation places large amounts of
liquidity around the current contract-market prices, then we can expect, at least in the short term,
that P will follow contract-market prices closer to the current price, as higher liquidity results in
less price slippage. At the same time, less slippage makes the pool more attractive to traders, and
can potentially increase the volume of trade, and hence further change P.
In our model, we make the simplifying assumption that P is independent of the liquidity pro-
vided by LPs, and this is what we mean by a Liquidity-independent belief profile. Given this, the
question of how to optimally allocate liquidity is simplified and becomes decision-theoretic, such
that an LP’s profit and loss only depends on the liquidity allocation they provide to the contract
and not on the investment by other LPs. Though the model fails to capture the coupling between
investment and price dynamics, which further entails game-theoretic aspects of liquidity provision,
we view this as an important first step in understanding key design considerations in Uniswap v3
contracts.
That a Liquidity-independent LP belief profile reduces the question of how to optimally compute
LP positions to a decision-theoretic problem arises from our analysis in Section 3. Since LPs earn
fees proportional to the liquidity they provide over contract prices traded, at face value it may
seem that their profit and loss depends on the liquidity allocations of other LPs (as this affects
the proportion of liquidity an LP owns at given prices). However, for a liquidity-independent price
14movement, the rules of the CFMM mean that the volume traded is proportional to the liquidity
supporting that price movement. As a result, as an LP provides more liquidity, not only are
they increasing their proportional share of fees, but also the total volume traded for a given price
sequence. The combination of these two dependencies balance in such a way that earned fees are
linear in the liquidity allocation of an LP (the same is true for the impermanent loss).
## 4.2 Maximizing Expected Profit and Loss: Risk Neutral LP
We assume that an LP borrows the capital required to create a liquidity allocation for a fixed
time horizon. Once the time horizon ends, the LP removes their liquidity from the contract, and
uses this capital alongside accrued fees to pay the amount owed for creating the position. For a
risk-neutral LP, the relevant quantity to optimize is the expected profit and loss over a distribution
of price sequences corresponding to belief profile P,
PnLP(`) = EP∼P(PnL(`,P)). (4.1)
Since PnL(`,P) is linear for any given choice of P, it follows that PnLP(`) is also linear in `.
We consider an LP that has an initial budget of D units of token B and wishes to create an optimal
liquidity allocation. For each bucket Bi ∈ µ, we let wi = B(V(3)(1,ai,bi,Pc,0),Pm,0) denote the
token B worth of 1 unit of liquidity at the intial parity contract-market price, P0 = (Pc,0,Pm,0) =
(1,1). Summing over buckets, the budget constraint is
P
i `iwi ≤ D. The optimization problem is:
max
`
PnLP(`)
s.t.
X
i
`iwi ≤ D (4.2)
`i ≥ 0, for all i
The linearity of the objective function allows us to write PnLP(`) =
Pn
i=−m αi`i, where αi is
the expected PnL of a single unit of liquidity in bucket Bi ∈ µ. Based on this, the optimal bucket
has index i∗ = argmaxi[αi/wi], and the optimal PnL is given by Dαi∗/wi∗. This is linear in D, and
so we can assume without loss of generality that D = 1. The optimal normalized PnL, OPT(P,µ),
is
OPT(P,µ) = max
i∈{−m,...,n}

αi
wi

. (4.3)
It is the Liquidity-independent nature of P that leads to linearity in ` in the objective PnLP(`),
and in turn to this linear optimization problem.
## 4.3 Maximizing Expected Profit and Loss: Risk-Averse LP
Although an LP maximizes expected PnL to allocate liquidity to the single bucket with the highest
normalized PnL, such an allocation is inherently risky: if the price ever goes outside of this bucket
over the LPs time horizon then not only does the LP miss out on fees, but the LP also suffers an
impermanent loss. Indeed, empirical evidence shows that LPs tend to use liquidity allocations that
make use of multiple buckets, spreading their liquidity over a large range of prices.
For these reasons, we introduce the notion of risk-aversion, and use the exponential utility
function (constant absolute risk aversion) [8, 16].
15Definition 7. Let ua(x), for parameter a ∈ R, denote the exponential utility function, with
ua(x) =
(
(1 − e−ax)/a if a 6= 0, and
x otherwise.
(4.1)
If a < 0 the LP is risk-seeking, if a > 0 the provider is risk-averse, and if a = 0 the LP is
risk-neutral.
We can now express the utility that an LP obtains for a given price sequence as follows.
Definition 8 (Risk-averse PnL). Suppose that an LP has a liquidity allocation ` over a bucket
instance µ. For a given contract-market price sequence, P = (P0,...,PT ), we denote the risk-
averse profit and loss of the LP by PnLa
(`,P), for risk-profile a ≥ 0, given by:
PnLa
(`,P) = ua(PnL(`,P)). (4.2)
If P is generated according to an LP belief profile P, then we let PnLa
P denote the expected
risk-averse profit and loss of the LP:
PnLa
P(`) = EP∼P(PnLa
(`,P)) (4.3)
Lemma 1. PnLa
P(`) is concave in ` for any choice of a and P.
Proof. Function ua(x) is smooth and concave for any choice of a, as e−ax within the expression is
convex. We have previously seen that PnL(`,P) is linear in ` for any choice of P, hence PnLa
(`,P)
is concave in ` for any choice of P. Finally, concavity is preserved over expectation.
We can now define the optimization problem for a risk-averse LP seeking to optimally create a
liquidity allocation, subject to budget-constraints:
min
`
− PnLa
P(`)
s.t.
X
i
`iwi ≤ D (4.4)
`i ≥ 0, for all i
As before, it is WLOG to focus on the scenario where D = 1, and in such a setting, we let
OPTa(P,µ) denote the value of the optimal solution, with `∗
to denote the corresponding liquidity
allocation. As a consequence of Lemma 1, the optimization problem is convex. In the next section
we exploit convexity to provide efficient methods for solving OPTa(P,µ).
## 4.3.1 Computational Methods
The main difficulty in solving the optimization problem (4.4) is that the objective function is an
expectation with respect to P. In this regard, we approximate PnLa
P(`) as the average PnL over a
sample of price paths from P. We take N i.i.d. sample price paths, P1,...,PN ∼ P, and define
the following objective:
PnLa
(` | P1,...,PN) =
1
N
N X
i=1
PnLa
(`,Pi). (4.5)
16Taking expectations, we get:
EP1,...,PN∼P [PnLa
(` | P1,...,PN)] = PnLa
P(`). (4.6)
We can define a corresponding optimization problem for a risk-averse LP seeking to approxi-
mately optimally create a liquidity allocation, subject to budget-constraints:
min
`
− PnLa
(` | P1,...,PN)
s.t.
X
i
`iwi ≤ D (4.7)
`i ≥ 0, for all i
This is a convex optimization problem, and we can evaluate gradients for the objective function
via standard methods. As before, we focus on the case where D = 1, and in this case we use
projected gradient descent to solve (4.7).
## 4.4 Optimal Risk-averse PnL as a function of Bucket Characteristics
OPTa(P,µ) is intricately tied to the characteristics of the buckets available in a v3 contract. In
practice, the Uniswap v3 contract uses buckets µ with endpoints that correspond to multiplicative
increases and decreases of the parity price, P = 1. The contract maintains a fixed set of price
ticks {t(−q),...t(0),...t(q)}, where t(i) = 1.0001i and q = 223. Each contract also has a positive
integer variable tickspacking, which we denote by ∆, and dictates which tick values can be used
as bucket endpoints. A tick can only be a bucket endpoint if i ≡ 0 mod ∆. We can express the
bucket structure by letting the i-th bucket, Bi, represent an interval [ai,bi] such that ai = 1.0001∆i
and bi = 1.0001∆(i+1).
Proposition 7. Suppose that µ(∆) is the bucket list that results from setting tickspacing to
∆ ≥ 1. Furthermore, let ∆0 = q∆ for any integer q > 2. For any choice of LP belief profile P, and
risk-aversion parameter a, we have:
OPTa(P,µ(∆0
)) ≤ OPTa(P,µ(∆)). (4.8)
Proof. These bucket designs are nested, with µ(∆0) a coarsened version of µ(∆), which means that
any liquidity allocation over µ(∆0) can also be represented by a allocation over µ(∆). Suppose
an allocation over µ(∆0) consists of allocating `i units of liquidity to Bi. An LP who creates an
allocation with `i units of liquidity in each of the q buckets in µ(∆) that correspond to this bucket
has an overall bundle value of the allocation that is equal to `i units of liquidity in Bi (in a similar
vein to Proposition 5). Furthermore, as per Section 3.1, this results in the same fees for the LP.
## 4.5 Trader Gas Fees
Finer bucket lists allow LPs to create more complicated liquidity allocations that potentially make
use of more active endpoints, and as per Proposition 7, this leads to weakly improving expected
utility for LPs in v3 contracts. However, this kind of refinement also results in increased gas fees
for traders, since a trade that pushes the contract price outside of the current active interval of the
v3 contract requires that a new active interval is computed, alongside the set of active LPs and
total active liquidity. This computational overhead is passed on to traders through gas fees.
17For each bucket, Bi ∈ µ = {B−m,...,Bn} such that i 6= −m, we define ci(P,µ), which is
the expected number of crossings of its left endpoint, ai, over the course of the stochastic process
associated with belief profile P. What matters for gas fees is the number of active bucket endpoints
that are crossed: for there to be computational overhead, there needs to be an LP with an allocation
that uses an endpoint. We assume that each bucket endpoint is active, in this sense, in what we
call the bucket coverage assumption. This is justified empirically: we find that for buckets close to
the contract price there is almost always at least one LP with an allocation ending in that bucket’s
endpoint (see Appendix D.)
Definition 9 (Trader Gas Cost). Let us consider a liquidity provision instance dictated by LP belief
profile P and buckets given by µ. We let GAS(P,µ) denote the expected gas fees incurred by all
traders over the time horizon T. Under the bucket coverage assumption, this is given by:
GAS(P,µ) =
n X
i=−m+1
ci(P,µ). (4.9)
Since we are interested in the relative gas cost between distinct bucketing schemes, we normalize
the gas fees per crossing of an active endpoint to be 1. In practice this quantity depends on the
price of ETH. As in the computation of OPTa(P,µ), we can take a sample-based approach to
compute GAS(P,µ), whereby we sample N sequences of contract-market price pairs from P and
compute the average number of bucket endpoint crossings as an approximation to GAS(P,µ).
## 4.6 The Uniswap v3 Contract Design Problem
We are interested in how choices for bucket design µ impact both OPTa and GAS, for fixed LP
belief profiles P and a risk-aversion parameter a ≥ 0. Both objectives are important: higher PnL
may attract liquidity providers to reduce slippage in trades, while increased gas costs can dissuade
traders from participating, thereby reducing fees. We focus on parametrized families of bucket sets.
Definition 10 (Exponential Bucket Scheme). Suppose that θ > 1 is a real number and ∆,m,n ≥ 1
are integers. In an (θ,∆,m,n)-exponential bucket scheme, buckets in µ(θ,∆,m,n) are parametrized
as follows:
• B−m = (0,b−m], with b−m = θ∆(−m+1),
• Bn = [an,∞), with an = θ∆n, and
• for −m < i < n, Bi = [ai,bi] = [θ∆i,θ∆(i+1)].
For convenience, we also let µ(θ,∆) denote an exponential bucket scheme for m,n → ∞, such
that Bi is a finite bucket for all i ∈ Z. Exponential bucket schemes are a natural extension of
the bucketing scheme used by v3 contracts. In particular, a v3 contract with tickspacing = ∆
is equivalent to a (1.0001,∆)-exponential bucketing scheme. We can express the Pareto frontier of
such bucketing schemes, considering the dual objectives OPT and GAS.
Definition 11 (The Uniswap v3 OPT-GAS Pareto Frontier). Suppose that we fix an LP optimiza-
tion profile given by P, risk-aversion parameter a ≥ 0, and a family of bucket sets parametrized by
ζ and denoted by µ(ζ). Furthermore, let ζ0
6= ζ be such that:
GAS(P,µ(ζ0
)) ≤ GAS(P,µ(ζ)), and OPTa(P,µ(ζ0
)) ≥ OPTa(P,µ(ζ)), (4.10)
18Market Price
Contract Price
(i-1)-th round i-th round (i+1)-th round
a market price change
a contract price change due to arbitrage trade following a market price change
a contract price change due to a non-arbitrage trade
a contract price change due to arbitrage trade following a non-arbitrage trade
shows the market price that each arbitrage trade corresponds to
Figure 3: Market price changes triggering contract price changes, illustrated for three rounds, where
each round contains four non-arbitrage and four arbitrage trades following a market price change.
where one of the inequalities is strict. We say that bucketing scheme µ(ζ0
) Pareto dominates µ(ζ)
for LP belief profile P and risk-aversion parameter a ≥ 0. We denote this relationship over the
parameter space of µ by ζ0 P ζ. In addition, we let Pareto(P,µ) denote the set of all parameters,
ζ which are not Pareto dominated.
## 5 Simulation Results
In this section, we take a computational approach to investigate the Uniswap v3 contract design
problem5. For our results, we utilize a specific family of LP belief profiles that can be seen as an
extension of the model from Capponi and Jia [11], repeated here over a longer time horizon.
## 5.1 Modeling Liquidity-independent Contract-market Price Changes
Our family of Liquidity-independent belief profiles generates contract-market prices via a repeated,
two-stage process over T rounds. We model a stochastic market price, with this inducing a stochas-
tic contract price. In each round, in a first stage we sample the new market price according to
an exogenous stochastic process, and in a second stage we model non-arbitrage traders who either
increase or decrease contract price in a stochastic manner. At any point in either stage, if there is
a large enough discrepancy between the contract and market price (as a function of the transaction
fee rate, γ), then arbitrageurs trade with the contract to bring the contract price close to market
price.6 Figure 3 illustrates the way that we model changes in contract price in response to market
price changes, non-arbitrage trades, and arbitrage trades.
5
Our code of the computational method: https://github.com/Evensgn/uniswap-modeling
6
Even though arbitrageurs need to pay a gas fee when making an arbitrage trade, we ignore this because the gas
fee does not grow with the trade size and becomes negligible for a large trade.
195.1.1 Market Prices
Market prices take values in set Z(r,s,ω) = {Z−r,...,Z0,...Zs}, which is parametrized by r,s ∈ N
and ω > 1, such that Zi = ωi. As mentioned above, the beginning of a round marks an exogenous
stochastic change in market price and we let zt ∈ Z(r,s,ω) denote the market price in the t-th
round. We model the sequence of market prices z = (z0,...,zT ) with z0 = 1 as approximating a
geometric random walk (GRW), as is typical for modeling time series data in financial markets [9].
For this, we assume that conditional on the price being zt = Zi at time step t, the price will
move to zt+1 = Zj where j−i is distributed according to a binomial distribution, suitably truncated
under the constraint that Zj ∈ Z. In particular, we assume an integral bandwidth parameter of
W ≥ 1. Let Y 0 ∼ Binom(2W,p), such that Y = Y 0 − W encodes the maximal change in index
from the current price Zi. This means that the price transitions as follows:
zt+1 =



Z−r if i + Y < −r, or
Zs if i + Y > s, or
Zi+Y otherwise.
(5.11)
By imposing a constant price ratio of ω in Z, and having price indices transition according to a
binomial distribution, the stochastic price process approximates a geometric binomial random walk
(GBRW). An exception is when the price is close to the boundaries of Z, where it deviates from
GBRW due to truncation. We also require that the stochastic process is approximately on-average
stable (E[zt+1
zt
] = 1), which we achieve by choosing a suitable value of p ∈ [0,1] to govern the draw
Y 0 ∼ Binom(2W,p), and subsequently, Y = Y 0 − W.
Proposition 8 (Informal). Suppose that m = log(ω). If we let p = m+2−
√
m2+4
2m , then for large
bandwidth values, it follows that E[zt+1
zt
] ≈ 1. Consequently, the price ratio stochastic process is
approximately on-average stable.
Proof (informal). First of all, we make use of the fact that if Xn ∼ Binom(n,p), then as n → ∞,
Xn
d
→ X, where X ∼ N(np,np(1 − p)). We recall that Y + W ∼ Binom(2W,p), hence it follows
that we can approximate Y as being distributed according to N(2Wp − W,2Wp(1 − p)). Let
Q = ωY = zt+1
zt
, which in turn can be approximated as distributed according to a log normal
distribution with parameters (µ,σ2) = (2Wp − W,2Wp(1 − p)). Under the approximation, it
follows that E[Q] = emµ+m2σ2
2 . The given choice of p ensures that this is equal to 1.
Empirically Informing the GBRW. We require five parameters, (r,s,ω,W,T), to define how
the market price evolves. The parameters (r,s,ω) give rise to the price space, Z(r,s,ω). The
parameters ω > 1 and W ≥ 1 define the approximate GBRW that dictates random transitions
over Z(r,s,ω) and T ≥ 1 controls the number of times market price can change. Proposition 8
implies that the design choice mostly depends on the multiplicative ratio ω, and is not dependent
on the total number of price tick r + s + 1. This provides a way to obtain a price sequence that
approximates an on-average stable geometric random walk, where ω and W govern the overall
volatility, as larger values of ω imply that price index changes result in larger multiplicative price
changes, and larger bandwidth values, W, imply that the random walk can make larger jumps in
a given time step.
The parameters ω and W directly impact the volatility of the GBRW. We fit these two pa-
rameters using historical price data via a maximum likelihood estimate (see Appendix E). We use
20prices between Ethereum (ETH) and Bitcoin (BTC) for the low volatility regime, as the prices of
these two tokens are highly correlated. We use prices between Ethereum (ETH) and USDT for the
high volatility regime. For ETH/BTC prices, we estimate values ω = 1.0005 and W = 3, and for
ETH/USDT, we estimate values ω = 1.0005 and W = 7. Given this, we adopt ω = 1.0005 in all
LP belief profiles and consider W ∈ {3,5,7} to represent low/medium/high market price volatility
regimes.
We set r = s = 150, so that the GBRW takes prices in the interval [ω−r,ωs] ≈ [0.9278,1.0778],
and consider time horizon T = 100. Given the fact that our empirical results are informed from
per-minute price data (see Appendix E), this time-scale corresponds to a roughly two hour window.
This choice of a smaller price range and time horizon is for two reasons. First, we consider optimal
LP strategies with respect to introducing liquidity at time t = 0 and removing it at time t = T. In
practice we expect such simple strategies to be more prevalent at smaller time scales. Moreover,
using a GBRW with a coarse discretization of price space over large time horizons runs the risk
of inadequately modeling smaller order price oscillations, which in turn impacts LP profit and loss
(in terms of fees mostly); working with a smaller time horizon and price space mitigates this risk.
## 5.1.2 Contract Price Updates
As mentioned before, we model contract-price updates via rounds that undergo a two-stage process.
The first stage in a round samples the market price, as per the approximate GBRW process from
before. The second stage modifies the contract price according to both non-arbitrage and arbitrage
trading. These modifications require 3 relevant parameters: (k,λ,γ). The first parameter k ∈ N
specifies the number of non-arbitrage trades that occur in a given round. The second parameter
λ ∈ (0,1) specifies the multiplicative price impact a single non-arbitrage trade has in a given round.
The final parameter γ ∈ [0,1] is the trading fee present in the v3 contract at hand.
In more detail, the t-th round consists of a sequence of 2(k + 1) contract-market price pairs
given by Pt = (Pt
0,...Pt
2k+1). The j-th pair is given by Pt
j = (Pt
c,j,Pt
m,j), and for all pairs it holds
that Pt
c,j = zt; i.e., the market price remains unchanged within this second stage of the round.
For all odd j, the transition from Pt
j to Pt
j+1 consists of a single non-arbitrage trade. With
probability 1/2, the trader buys token A from the contract such that contract price increases to
Pt
c,j+1 = (1−λ)−1Pt
c,j, and with probability 1/2, the trader sells token A to the contract such that
contract price decreases to Pt
c,j+1 = (1 − λ)Pt
c,j. This form of price-based non-arbitrage trade is
similar to that used in Capponi and Jia [11].
For all even j < 2(k + 1), the transition from Pt
j to Pt
j+1 consists of a (potentially empty)
arbitrage trade. Given the fee rate, γ, and any market price Pm ∈ (0,∞), we let Iγ(Pm) =
[(1−γ)Pm,(1−γ)−1Pm] be the no-arbitrage interval around market price Pm. As shown in Angeris
et al. [7], if a contract price Pc is such that Pc ∈ Iγ(Pm), then even if Pc 6= Pm, arbitrage is
not profitable due to transaction fees. More specifically, no-arbitrage conditions for trading with
a Uniswap contract with contract price Pc ∈ (0,∞) precisely amount to having Pc ∈ Iγ(Pm).
Consequently, if at Pt
j , the contract price is outside the no-arbitrage interval of the market price,
we will assume that arbitrageurs trade in such a way that the contract price reaches the closest point
in the no-arbitrage interval. For a given x ∈ R and interval I ⊆ R we let π(x,I) = argminy∈I |x−y|
be the projection of x onto I; i.e., the closest point in I to x. Using this notation, we say an
arbitrage trader updates the contract price from Pt
c,j to Pt
c,j+1 = π(Pt
c,j,Iγ(zt)).
210 5 10 15 20 25 30 35 40
Δ
0.00
0.05
0.10
0.15
0.20
0.25
OPT (P, μ) Δ vs OPT (P, μ) and GAS (P, μ)
V3Utility
V2Utility
40
60
80
100
120
GAS (P, μ)
GAS (P, μ)
0 5 10 15 20 25 30 35 40
Δ
0.00
0.01
0.02
0.03
0.04
OPT (P, μ)
Δ vs OPT (P, μ) and GAS (P, μ)
V3Utility
V2Utility
40
60
80
100
120
GAS (P, μ)
V3TotalCrossing
Figure 4: LP profit an loss and trader Gas fee, for (W,k,λ,γ) = (5,10,0.00025,0.01), and a = 0
risk-neutral (left) and a = 20 risk-averse (right), and a (θ,∆)-exponential bucketing scheme with
multiplicative factor θ = 1.002 and bucket spacing ∆ ∈ {1,...,40}. The plots also show the
corresponding v2 PnL.
Relevant Parameter Regimes. Going forward we fix the empirically-informed values of r,s =
150, ω = 1.0005 and T = 100 for precisely the reasons specified at the end of 5.1.1: 1) static
LP strategies are more realistic at smaller time scales 2) finer discretizations of price space (and
correspondingly smaller price ranges) mitigate the risk of model error arising from smaller order
price oscillations. Consequently, we focus on modulating four parameters, (W,k,λ,γ) to change
the way in which market prices are updated and also how non-arbitrage trades and arbitrage trades
induce contract price updates. Parameters k and λ modulate the number of non-arbitrage trades in
a round, and the per-trade price impact of said trades, respectively. Parameters W and γ modulate
how market prices evolve and when arbitrage trading kicks in.
In Sections 5.2, 5.3, and 5.4 we fix (W,k,λ,γ) = (5,10,0.00025,0.01). Here, the choice of W = 5
represents intermediate market price volatility and k and λ are chosen such that two consecutive
non-arbitrage trades, if uninterrupted by arbitrage trades, result in a multiplicative change of 1.0005
which equals the value of the parameter ω from the GBRW. Finally, the choice of γ = 0.01 is the
highest fee tier available in Uniswap contracts, which can have fee tiers γ ∈ {0.0005,0.003,0.01}.
In Section 5.5, we vary k, λ and γ to see how OPTa and GAS depend on different scales
of non-arbitrage and arbitrage trade while maintaining intermediate market price volatility fixed.
In Section 5.6, we explore the impact overall contract-market price volatility has on our results.
We do so by exploring two further parameter settings for (W,k,λ,γ) given by (3,5,0.002,0.01)
and (7,15,0.003,0.01). The former setting corresponds to a lower contract-market price volatil-
ity and the latter to a higher contract-market price volatility, compared with the baseline of
(5,10,0.00025,0.01).
## 5.2 The Effect of Bucket Size on PnL and Gas Cost
As bucket sizes decrease, an LP’s optimal PnL increases, in line with our result from Proposition 7,
and the expected gas cost to traders increases as finer partitions result in more crossings of active
price ticks (see Figure 4, where multiplicative factor θ is fixed to 1.002 and we vary bucket spacing
22∆. The plot also includes the optimal PnL of an LP under a v2 contract (the v2 Gas cost is zero
in our model, since no crossings of bucket endpoints ever occur).
## 5.3 The Uniswap v3 OPT-GAS Pareto Frontier
In Figure 5, we plot the performance of different bucketing schemes for different LP risk profiles.
Points with the same color have the same multiplicative factor (θ) but vary in bucket spacing ∆ ∈
{1,...,20}. The right-hand plots highlight which of these points are on the Pareto frontier. There
is a multiplicity of different exponential bucketing schemes on the Pareto frontier, as illustrated
through multiple colors and thus θ values and multiple ∆ values for a given color, as there are
multiple points of the same color on the frontier. From this, a concrete design improvement for
Uniswap v3 contracts lies in providing additional bucketing schemes for a contract designer, as
suited to different PnL-Gas fee tradeoffs and depending on the preferences of agents (the LPs
and traders). The status quo design in Uniswap v3 is equivalent to a (θ,∆)-exponential bucketing
schemes with θ = 1.0001 and ∆ corresponding to tickspacing in the contract. The top right
point of each Pareto frontier plot (in light blue) of Figure 5 corresponds to a (1.002,1)-exponential
bucketing scheme. This θ value is closest to the v3 status quo of θ = 1.0001 and results in relatively
high PnL for LPs but higher gas fees for traders.7
## 5.4 The Effect of Risk-Aversion
The expected PnL and standard deviation of PnL are decreasing functions, for an optimal LP
behavior, are each decreasing in the risk-aversion parameter a ≥ 0 (see Figure 6). This is to be
expected for the constant absolute risk-aversion function. Moreover, as the level of risk-aversion
increases, optimal liquidity allocations remain centered around the initial unit price, but become
more spread out, as visualized in Figure 7. This is to be expected, as spreading out an allocation
mitigates the risk that an LP will lose out on fees when prices exit a liquidity allocation.
Referring back to Figure 5, we can also see that with an increased level of LP risk-aversion, the
same set of exponential bucketing schemes gives rise to a steeper Pareto curve that is composed of
less points, indicating that different exponential bucketing schemes with similar gas costs give rise
to a wider spread of expected utility in the risk-averse setting. In addition, the risk-averse Pareto
frontier is still composed of multiple (θ,∆) values, which continues to indicate that a richer partition
of the price space can simultaneously benefit LPs and traders over a wide spread of risk-aversion
values.
## 5.5 Modulating Non-Arbitrage Trade and Fee Rates
Parameters k and λ control the quantity of non-arbitrage trades and their impact on the contract
price, respectively. The PnL and Gas costs are monotonically increasing in each of parameters k
and λ, as we would expect (see Figure 8 which give results for both risk-neutral and risk-averse
LPs). For PnL, LPs only make a profit for non-arbitrage trades [11], hence this relationship is
expected. As for gas costs, it is clear that more contract price movements will trigger the crossing
of more active ticks.
The transaction fee rate, γ, affects the LP PnL and the Gas costs in multiple ways. On one
hand, changing γ directly affects LP profits, as price movements provide more fees. On the other
7
We only tested larger θ values due to the granularity constraint of our GBRW model.
2340 60 100 120 80
GAS (P, μ)
0.00
0.05
0.10
0.15
0.20
0.25
OPT (P, μ)
Exponential Bucketing Performance, Risk-neutral LP
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
40 60 100 120 80
GAS (P, μ)
0.00
0.05
0.10
0.15
0.20
0.25
OPT (P, μ)
Pareto Frontier, Risk-neutral LP
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
40 60 100 120 80
GAS (P, μ)
0.00
0.01
0.02
0.03
0.04
0.05
0.06
0.07
0.08
OPT (P, μ)
Exponential Bucketing Performance, a = 10
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
40 60 100 120 80
GAS (P, μ)
0.00
0.01
0.02
0.03
0.04
0.05
0.06
0.07
0.08
OPT (P, μ)
Pareto Frontier, a = 10
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
40 60 100 120 80
GAS (P, μ)
0.01
0.02
0.03
0.04
OPT (P, μ)
Exponential Bucketing Performance, a = 20
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
40 60 100 120 80
GAS (P, μ)
0.01
0.02
0.03
0.04
OPT (P, μ)
Pareto Frontier, a = 20
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
Figure 5: LP PnL vs Trader gas fees for (W,k,λ,γ) = (5,10,0.00025,0.01), LPs with risk parameter
a ∈ {0,10,20} (top, middle, bottom), and different (θ,∆)-exponential bucketing schemes. Each
point corresponds to a specific (θ,∆), varying bucket spacing ∆ ∈ {1,...,20} and with color
indicating multiplicative factor (θ). The right column highlights only the bucketing schemes on the
Pareto Frontier.
hand, γ affects the no-arbitrage interval around a given market price, and thus the stochastic
process governing the contract prices. In Figure 9, we see that with a risk-neutral LP each of the
different fee rates is included on the Pareto frontier. This is quite different for risk-averse LPs,
240 5 15 20 10
Risk Aversion
0.17
0.18
0.19
0.20
0.21
0.22
0.23
0.24
0.25
Expected PnL
Risk Aversion vs Expected PnL and Std of PnL
ExpectedPnL
0.06
0.08
0.10
0.12
0.14
0.16
Std of PnL
StdofPnL
Figure 6: Expected PnL and standard deviation of PnL vs. risk parameter a for (W,k,λ,γ) =
(5,10,0.00025,0.01), multiplicative factor θ = 1.002, bucket spacing ∆ = 1.
with the highest fee rate, γ = 0.2 dominating the rest of the bucketing designs for a ∈ {10,20}. To
interpret this, to earn the same expected utility as γ = 0.2 with lower fee rates, the contract must
make the sacrifice of having larger gas costs.
On the basis of this analysis, higher fee rates seem desirable for contract design, at least for
the case of risk averse LPs. However, we caution that a higher fee rate also makes a trading pool
less desirable for traders, and that this is a phenomenon that is outside of our current model. For
this, we would need to model competition between pools, and the interplay between LPs and pool
desirability to traders, in order to obtain a more precise statement.
## 5.6 The Effect of Contract-Price Volatility
In this section, we study the impact of different levels of contract-price volatility. We recall that
four parameters, W,k,λ, and γ, govern LP belief profiles. k represents the number of non-arbitrage
trades in a given round, and λ represents the multiplicative change in price caused by a non-
arbitrage trade. Lower values of each parameter reduce the overall contract price changes that
arise from non-arbitrage trading. W represents the volatility of the GBRW governing market
prices and γ represents the fee tier of a v3 contract. Larger values of W and lower values of γ
increase the contract price changes that arise from arbitrage trading. Until now, we have focused
on an intermediate volatility regime, given by (W,k,λ,γ) = (5,10,0.00025,0.01). In what follows,
we explore a low volatility regime given by (W,k,λ,γ) = (3,5,0.0002,0.01) and a high volatility
regime given by (W,k,λ,γ) = (7,15,0.0003,0.01).
## 5.6.1 Implications for the OPT-GAS Pareto Frontier
In Figures 10 and 11, we plot the OPT-GAS Pareto frontier for low volatility and high volatility
contract price regimes, respectively. The main results of Sections 5.3 and 5.4 are robust to variations
in contract-price volatility. Most importantly, we see that multiple different bucketing scheme
continue to lie on the Pareto frontier, again showing the importance of allowing a diverse set of
price bucketing schemes for contract design, this extending to different volatility regimes.
250.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 0.0 a = 2.0 a = 4.0 a = 6.0
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 8.0 a = 10.0 a = 12.0 a = 14.0
0.99 1.00 1.01
Bucket
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 16.0
0.99 1.00 1.01
Bucket
a = 18.0
0.99 1.00 1.01
Bucket
a = 20.0
0.99 1.00 1.01
Bucket
a = 22.0
Optimal Liquidity Allocation With Varying Risk-aversion
Figure 7: Optimal liquidity allocations for (W,k,λ,γ) = (5,10,0.00025,0.01) and varying risk
parameter, a. Each bar represents the proportion of an LP’s initial capital allocated to a bucket in
the optimal liquidity allocation.
Furthermore, we also see that for all levels of volatility, when risk-aversion increases, Pareto
curves become more steep. In addition, the Pareto curves are also steeper at higher levels of volatil-
ity when risk-aversion is maintained constant. This confirms that different exponential bucketing
schemes give rise to a wider spread of expected PnL for risk-averse LPs, with similar gas costs, and
with this this spread increasing in higher volatility contract-price regimes.
## 5.6.2 Implications for Risk-averse LPs
We also confirm that both expected PnL and the standard deviation of PnL are decreasing functions
in the risk-aversion parameter a of an LP for each of the low-volatility and high-volatility contract-
price regimes (Figure 12). The main difference between volatility regimes is that the overall spread
of PnL earned (as a function of risk-aversion) is larger for high volatility regimes.
The fact that expected PnL and standard deviation of PnL are decreasing as functions of a for
all volatility regimes is to be expected for the constant absolute-risk aversion function. As for the
fact that larger volatility regimes give rise to larger spreads of expected PnL (as a function of a),
262.5 5.0 7.5 10.0 12.5 15.0 17.5 20.0
K
0.05
0.10
0.15
0.20
0.25
0.30
0.35
0.40
OPT (P, μ)
K vs OPT (P, μ) and GAS (P, μ) , a = 0
OPT (P, μ)
50
100
150
200
250
GAS (P, μ)
GAS (P, μ)
2.5 5.0 7.5 10.0 12.5 15.0 17.5 20.0
K
0.0300
0.0325
0.0350
0.0375
0.0400
0.0425
0.0450
0.0475
0.0500
OPT (P, μ)
K vs OPT (P, μ) and GAS (P, μ,) , a = 20
OPT (P, μ)
50
100
150
200
250
GAS (P, μ)
GAS (P, μ)
5 10 15 20 25 30 35 40
λ (x10-5)
0.100
0.125
0.150
0.175
0.200
0.225
0.250
0.275
0.300
OPT (P, μ)
λ vs OPT (P, μ) and GAS (P, μ) , a = 0
OPT (P, μ)
25
50
75
100
125
150
175
200
225
GAS (P, μ)
GAS (P, μ)
0.044
0.045
0.046
0.047
0.048
0.049
OPT (P, μ)
λ vs OPT (P, μ) and GAS (P, μ) , a = 20
25
50
75
100
125
150
175
200
225
GAS (P, μ)
5 10 15 20 25 30 35 40
λ (x10-5)
OPT (P, μ)
GAS (P, μ)
Figure 8: The top row plots expected PnL and Gas costs for an LP as a function of k (the number
of per-round non-arbitrage trades) and the bottom row plots expected PnL and Gas costs for an
LP as a function of λ (the scale of non-arbitrage trade). Left plots correspond to a = 0 (risk neutral
LP) and right plots to a = 20 (risk-averse LP). For all plots, we let market prices follow a GBRW
with bandwidth W = 5 and consider v3 contracts with fee rate γ = 0.01.
this is explained in part by the fact that higher contract price volatility results in more fees earned
by an LP (especially through increased non-arbitrage trades).
We also plot optimal LP allocations for different risk-aversion values in Figure 13. The most
interesting observation is that the spread of an LP’s optimal allocation is more sensitive to risk-
aversion in higher volatility contract-price regimes than lower volatility regimes. With the same
risk-aversion, an LP operating in a high-volatility regime has a more dispersed optimal liquidity
allocation relative to operating in a low-volatility regime. This phenomenon makes sense, as narrow
liquidity allocations run a larger risk on missing out on transaction fees in a higher volatility
contract-price regime.
2740 60 100 120 80
GAS (P, μ)
0.00
0.05
0.10
0.15
0.20
0.25
OPT (P, μ)
Exponential Bucketing Performance, a = 0
γ = 0.0005
γ = 0.003
γ = 0.005
γ = 0.01
γ = 0.02
20 40 60 80 100 120 140 160
GAS (P, μ)
0.00
0.02
0.04
0.06
0.08
OPT (P, μ)
Exponential Bucketing Performance, a = 10
γ = 0.0005
γ = 0.003
γ = 0.005
γ = 0.01
γ = 0.02
20 40 60 80 100 120 140 160
GAS (P, μ)
0.00
0.01
0.02
0.03
0.04
0.05
OPT (P, μ)
Exponential Bucketing Performance, a = 20
γ = 0.0005
γ = 0.003
γ = 0.005
γ = 0.01
γ = 0.02
Figure 9: LP PnL vs. Trader gas fees for W = 5, k = 10, λ = 0.01, LPs with risk parameter a ∈
{0,10,20}, and for different values of transaction fee rate, γ. Each point corresponds to a specific
(θ,∆), varying multiplicative factor θ ∈ {1.002 + i · 0.002}4
i=0 and bucket spacing ∆ ∈ {1 + 2i}4
i=0,
and with color indicating fee rate γ ∈ {0.0005,0.003,0.005,0.01,0.02}.
## 6 Conclusion
In this paper, we have developed a model for the tradeoffs that LPs are faced with in regards to
how to optimally allocate liquidity in Uniswap v3 contracts. We give explicit expressions for LP
profit and loss that incorporate profits from fees accrued from traders as well as impermanent loss
from deviations in contract price. We have explored optimal liquidity provision strategies when
LPs are endowed with stochastic beliefs over how prices will evolve as well as differing degrees
of risk aversion, developing linear and convex optimization formulations for LP investment and a
method for computing expected Gas fees incurred by traders for a given bucketing scheme in a v3
contract. Contract prices in the model are induced by a stochastic model of market prices as well
as non-arbitrage and arbitrage trade in the smart contract.
Adopting an empirically-informed belief profiles of price changes, we show that LP PnL is
maximized for smaller bucket sizes and a higher volume of non-arbitrage trades (Figures 4 and 8)
but this comes at a cost of higher gas fees for traders. Viewed as a multi-objective optimization
2815 20 25 30 40 45 50 55 35
0.00
0.02
0.04
0.06
0.08
0.10
0.12
0.14
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
GAS (P, μ)
OPT (P, μ)
Exponential Bucketing Performance, Risk-neutral LP
15 20 25 30 40 45 50 55 35
0.00
0.02
0.04
0.06
0.08
0.10
0.12
0.14
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
GAS (P, μ)
OPT (P, μ)
Pareto Frontier, Risk-neutral LP
20 25 30 40 45 50 35
0.00
0.01
0.02
0.03
0.04
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
GAS (P, μ)
OPT (P, μ)
Exponential Bucketing Performance, a = 20
20 25 30 40 45 50 35
0.00
0.01
0.02
0.03
0.04
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
GAS (P, μ)
OPT (P, μ)
Pareto Frontier, a = 20
Figure 10: LP PnL vs. Trader gas fees for low volatility regime (W,k,λ,γ) = (3,5,0.002,0.01),
LPs with risk parameter a ∈ {0,20}, and different exponential bucketing schemes. Each point
corresponds to a specific (θ,∆), varying bucket spacing ∆ ∈ {1,...,20}, and with color indicating
multiplicative factor (θ). The right column highlights only the bucketing schemes on the Pareto
Frontier.
problem where we care about LP PnL as well as trader gas cost, we see the value of providing
a more diverse set of price bucketing schemes than those currently available in Uniswap v3. We
have also developed initial insight into the effect of transaction fees on LP PnL, showing that for
Liquidity-independent LP beliefs, higher transaction fees provide higher LP utility at potentially
lower gas costs for traders if adopted together with a suitably optimized bucketing scheme (Figure
9). As mentioned in Section 5.5, though this may suggest that higher fee rates are desirable from
both the perspective of increasing LP PnL and decreasing trader gas fees, we caution that pool
desirability for traders is also affected by gas fees, hence more comprehensive models are needed
to provide further insight regarding the impact of fees on v3 contracts. Finally, we also study the
impact risk-aversion has on LP PnL as well as corresponding optimal liquidity allocations. As
seen in Figure 7, we find that as risk-aversion increases, LPs correspondingly spread their liquidity
across larger prices ranges to reduce variance in PnL. Furthermore, this spread is increased for
more volatile contract-market price sequences.
This paper contributes to a growing body of work on differential liquidity provision in Uniswap
v3 contracts. We leave open many interesting directions to pursue. One would relax the assumption,
2950 75 100 125 150 175 200 225
GAS (P, μ)
0.00
0.05
0.10
0.15
0.20
0.25
0.30
0.35
OPT (P, μ)
Exponential Bucketing Performance, Risk-neutral LP
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
50 75 100 125 150 175 200 225
GAS (P, μ)
0.00
0.05
0.10
0.15
0.20
0.25
0.30
0.35
OPT (P, μ)
Pareto Frontier, Risk-neutral LP
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
50 75 100 125 150 175 200 225
0.01
0.02
0.03
0.04
0.05
Exponential Bucketing Performance, a = 20
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
GAS (P, μ)
OPT (P, μ)
50 75 100 125 150 175 200 225
0.01
0.02
0.03
0.04
0.05
NonFrontier
Theta=1.002
Theta=1.004
Theta=1.006
Theta=1.008
Theta=1.01
Theta=1.012
Theta=1.014
Theta=1.016
Theta=1.018
Theta=1.02
Pareto Frontier, a = 20
OPT (P, μ)
GAS (P, μ)
Figure 11: LP PnL vs. Trader gas fees for high volatility regime (W,k,λ,γ) = (7,15,0.003,0.01),
LPs with risk parameter a ∈ {0,20}, and different (θ,∆)-exponential bucketing schemes. Each
point corresponds to a specific (θ,∆), varying ∆ ∈ {1,...,20} and with color indicating θ value.
The right column highlights only the bucketing schemes on the Pareto Frontier.
critical here in making the analysis decision-theoretic rather than game-theoretic, of Liquidity-
independent trade flow (here, each LP can separately optimize for PnL given their belief profile).
One way to relax this assumption is to consider a model in which prices change via trade dynamics
that also incorporate trade volume. For example, if a bucket has a large amount of liquidity
then moving the price through the bucket requires a larger trade volume, thereby affecting price
movement, at least in the short term. In this scenario, the fact that LP liquidity allocation affects
price movements makes their actions interdependent, and thus requires an equilibrium analysis.
Another means by which LP liquidity allocations can influence price dynamics is by indirectly
signaling their own beliefs about how prices may evolve over time. Indeed our work is an initial
step in this direction, as we can interpret the optimal liquidity allocation as a signal of an LP’s
belief profile. A fundamental question is how to interpret the liquidity profile of LPs with locked
assets in a v3 contract, and whether this information can signal collective price beliefs of LPs.
In addition, this work focuses on a family of relatively simple and short-term liquidity allocation
strategies, whereby an LP allocates liquidity for fixed amount of time and then removes their
liquidity and collects their fees for potential profit and loss. It will be interesting to study more
complicated liquidity provision strategies, especially those that involve LPs actively re-allocating
300 5 15 20 10
Risk Aversion
0.125
0.130
0.135
0.140
Expected PnL
Risk Aversion vs Expected PnL and Std of PnL
(Low Volatility)
ExpectedPnL
0.040
0.045
0.050
0.055
0.060
0.065
0.070
Std of PnL
StdofPnL
0 5 15 20 10
Risk Aversion
0.22
0.24
0.26
0.28
0.30
0.32
0.34
Expected PnL
ExpectedPnL
0.06
0.08
0.10
0.12
0.14
0.16
0.18
Std of PnL
StdofPnL
Risk Aversion vs Expected PnL and Std of PnL
(High Volatility)
Figure 12: LP PnL and standard deviation of PnL as risk parameter a varies, for low volatil-
ity regime (W,k,λ,γ) = (3,5,0.0002,0.01) (left) and high volatility regime (W,k,λ,γ) =
(7,15,0.0003,0.01) (right), and with exponential-bucketing scheme θ = 1.002, ∆ = 1.
liquidity as prices evolve over time. Indeed this thread of work has been explored in Neuder et
al. [15], albeit without consideration to impermanent loss, and it will be interesting to link the gas
fees LPs pay to reallocate liquidity to our notion of the gas cost incurred by traders for different
choices of bucketing regimes.
Acknowledgments
We would like to thank anonymous reviewers for helping improve earlier versions of this work, as
well as insightful conversations with research teams at Wisdomise, Maverick and Uniswap. This
work is supported in part by two generous gifts to the Center for Research on Computation and
Society at Harvard University to support research on applied cryptography and society. Our work
also benefited from Microsoft Azure credits provided by the Harvard Data Science Initiative.
References
[1] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap
v3 core. Technical report, Tech. rep., Uniswap, 2021.
[2] Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra, and Stephen Boyd. Con-
stant function market makers: Multi-asset trades via convex optimization. arXiv preprint
arXiv:2107.12484, 2021.
[3] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market mak-
ers. In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies, pages
80–91, 2020.
[4] Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog? curvature
and market making. arXiv preprint arXiv:2012.08040, 2020.
310.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
0.99 1.00 1.01
Bucket
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
0.99 1.00 1.01
Bucket
0.99 1.00 1.01
Bucket
0.99 1.00 1.01
Bucket
a = 0.0 a = 2.0 a = 4.0 a = 6.0
a = 8.0 a = 10.0 a = 12.0 a = 14.0
a = 16.0 a = 18.0 a = 20.0 a = 22.0
Optimal Liquidity Allocation With Varying Risk-aversion
(Low Volatility)
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 0.0 a = 2.0 a = 4.0 a = 6.0
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 8.0 a = 10.0 a = 12.0 a = 14.0
0.99 1.00 1.01
Bucket
0.0
0.2
0.4
0.6
0.8
1.0
Capital Allocation
a = 16.0
0.99 1.00 1.01
Bucket
a = 18.0
0.99 1.00 1.01
Bucket
a = 20.0
0.99 1.00 1.01
Bucket
a = 22.0
Optimal Liquidity Allocation With Varying Risk-aversion
(High Volatility)
Figure 13: Optimal liquidity allocations for different risk-aversion parameters a and low volatil-
ity regime (W,k,λ,γ) = (3,5,0.0002,0.01) (left) and high-volatility regime (W,k,λ,γ) =
(7,15,0.0003,0.01) (right). Each bar represents the proportion of an LP’s initial capital allocated
to a bucket in the optimal liquidity allocation.
[5] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. arXiv preprint
arXiv:2103.14769, 2021.
[6] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating monotonic payoffs without
oracles. arXiv preprint arXiv:2111.13740, 2021.
[7] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An analysis
of uniswap markets. arXiv preprint arXiv:1911.03380, 2019.
[8] Kenneth Joseph Arrow. Aspects of the theory of risk-bearing. Helsinki, 1965.
[9] Stoikov S. Avellaneda M. Stock price volatility: Tests based on the geometric random walk.
The American Economic Review, 1992.
[10] Stoikov S. Avellaneda M. High-frequency trading in a limit order book. Quantitative Finance,
2008.
[11] Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges.
arXiv preprint arXiv:2103.08842, 2021.
[12] Rösch D. Chung K., Lee A. Tick size, liquidity for small and large orders, and price in-
formativeness: Evidence from the tick size pilot program. Journal of Financial Economics,
2019.
[13] Alex Evans. Liquidity provider returns in geometric mean markets. arXiv preprint
arXiv:2006.08806, 2020.
32[14] Sean Foley, Tom Meling, and Bernt Arne Ødegaard. Tick size wars: The market quality effects
of pricing grid competition. Available at SSRN 2866943, 2021.
[15] Michael Neuder, Rithvik Rao, Daniel J. Moroz, and David C. Parkes. Strategic liquidity
provision in uniswap v3. CoRR, abs/2106.12033, 2021.
[16] John W Pratt. Risk aversion in the small and in the large. In Uncertainty in economics, pages
59–79. Elsevier, 1978.
A Omitted Proofs from Section 2
Proposition 2. Suppose that (x,y) ∈ R(2)(L) with P = y/x, and (x0,y0) ∈ R(2)(L0) such that
P0 = y0/x0 = P. Then (x + x0,y + y0) ∈ R(2)(L + L0), and in addition, (y0 + y)/(x + x0) = P. If
L0 < L, then (x − x0,y − y0) ∈ R(2)(L − L0) and (y − y0)/(x − x0) = P.
Proof. We work with the product (x + x0)(y + y0) = xy + x0y0 + x0y + xy0. The first two terms
are equal to L2 and (L0)2 respectively, since (x,y) ∈ V(2)(L) and (x0,y0) ∈ V(2)(L0). We have
L =
√
xy and L0 =
√
x0y0, and LL0 =
√
xyx0y0. However, we can invoke the fact that P = P0, to
get x0y = xy0, and thus LL0 =
p
(x0y)2 = x0y = xy0. Putting everything together, we have:
(x + x0
)(y + y0
) = L2
+ 2LL0
+ (L0
)2
= (L + L0
)2
, (A.1)
and (x + x0,y + y0) ∈ R(2)(L + L0), as desired. As for (y + y0)/(x + x0) = P, we have y = Px
and y0 = Px0, and thus (y + y0)/(x + x0) = P(x + x0)/(x + x0) = P. The case where we remove
(x0,y0) from the bundle (x,y) is identical.
Proposition 3. In the limit of an [a,b]-interval that approaches the entire price interval, the value
of Uniswap v3 liquidity is that of Uniswap v2 liquidity, i.e.,
lim
a→0,b→∞
[V(3)
(a,b,P)] = V(2)
(P). (2.6)
Proof. Since we take the limit as a → 0 and b → ∞, we can suppose that a < P < b, in
which case V(3)(a,b,P) = (∆x
b,P ,∆y
a,P ). We have limb→∞ ∆x
b,P = limb→∞[1/
√
P − 1/
√
b] = 1/
√
P,
and lima→0 ∆x
a,P = lima→0[
√
P −
√
a] =
√
P. Altogether, we have lima→0,b→∞ V(3)(a,b,P) =
[1/
√
P,
√
P] = V(2)(P).
Proposition 4. Suppose that (x,y) ∈ R(3)(L,a,b). It follows that φa,b(x,y) ∈ R(2)(L), and if we
let P = φB
a,b(y)/φA
a,b(x), then P ∈ [a,b] and (x,y) = V(3)(L,a,b,P).
Proof. The correspondence to the v2 revenue curve follows directly from Definition 3. For the rest
of the proof, we notice that for (w,z) ∈ R(2)(L), we can use the fact that wz = L2, to express
the price P = z/w in terms of w or z only: P = L2/w2 = z2/L2. We have φa.b(x,y) ∈ R(2)(L),
and as a point on the v2 reserve curve, it has an associated price P = φB
a,b(y)/φA
a,b(x), which we
now know is equivalent to L2/φA
a,b(x)2. Thus, when we treat P as a function of x, we see that it is
a decreasing, injective function. Furthermore, it is easy to check that at extremal bundles on the
33v3 reserve curve, i.e., (∆x
b,a,0),(0,L∆y
a,b) ∈ V(3)(L,a,b), we get P values of a and b respectively.
It thus follows that for all (x,y) ∈ V(3)(L,a,b), P = φB
a,b(y)/φA
a,b(x) ∈ [a,b]. This, along with
Definition 2, gives V(3)(L,a,b,P) = (L∆x
b,P ,L∆y
a,P ). Let us focus on the first term in the bundle:
L∆x
b,P = L/
√
P − L/
√
b. From before, we know that P = L2/φA
a,b(x)2, hence
√
P = L/φA
a,b(x). It
follows that L∆x
b,P = φA
a,b(x) − L/
√
b = x as desired. The same argument holds for L∆y
a,b, albeit
using substitution P = φB
a,b(y)2/L2.
Proposition 5. Consider an arbitrary closed interval [a,b] and a value c ∈ (a,b). Let P be an
arbitrary contract price, then
V(3)
(L,a,c,P) + V(3)
(L,c,b,P) = V(3)
(L,a,b,P). (2.8)
Proof. We recall that V(3) is linear in L, hence it suffices to prove the statement for L = 1. We
begin by considering the scenario where a < P < c < b, in which case V(3)(a,c,P) = (∆x
c,P ,∆y
a,P )
and V(3)(c,b,P) = (∆x
b,c,0).
V(3)
(a,c,P) + V(3)
(c,b,P) = (∆x
c,P ,∆y
a,P ) + (∆x
b,c,0) (A.2)
= (∆x
b,c + ∆x
c,P ,∆y
a,P )
= (∆x
b,P ,∆y
a,P )
= V(3)
(a,b,P)
The scenario where a < c < P < b is almost identical to that above, hence we continue to the
case where P < a < c < b:
V(3)
(a,c,P) + V(3)
(c,b,P) = (∆x
c,a,0) + (∆x
b,c,0) (A.3)
= (∆x
b,c + ∆x
c,a,0)
= (∆x
c,a,0)
= V(3)
(a,b,P)
The final case where a < c < b < P is almost identical.
B Omitted Proofs from Section 3
.
Proposition 6. For any choice of initial contract-market prices, P = (Pc,Pm), and end prices
P0 = (P0
c,P0
m), the v3 impermanent loss, IL(3)(`,P,P0), is linear in `. In addition, if P0
c = P0
m, then
IL(3)(`,P,P0) is non-negative for any `. Similarly, for any choice of P and P0, the v2 impermanent
loss IL(2)(`,P,P0) is linear in `, and when P0
c = P0
m, it is non-negative for any choice of ` > 0.
34Proof. For the entirety of this proof we focus on the claims for v3 impermanent loss. The results
for v2 hold for the same reason that they hold for v3 in the special case when the beginning and
end price P,P0 lie in the bucket for which liquidity has been obtained.
Since IL(3)(`,P,P0) is a linear combination of IL(3)(`i,Bi,P,P0) terms, it suffices to show that
IL(`i,Bi,P,P0) is linear in `i. We recall that in Section 2.2, we showed that V(3)(L,a,b,P) =
L·V(3)(a,b,P). Furthermore, we also recall we defined B((x,y),P) = Px+y as the token B worth
of a bundle (x,y) when token A has price P. Combining these two facts, it is clear that
IL(3)
(`i,Bi,P,P0
) = `i(v
(3)
h (1,Bi,P,P0
) − v(3)
p (1,Bi,P0
)) = `i · IL(1,Bi,P,P0
), (B.1)
which establishes our desired linearity.
As for the remainder of the proposition, we assume that market price and contract price
coincide, hence we slightly abuse notation going forward, so that P = Pc = Pm and P0 =
P0
c = P0
m. To prove non-negativity of impermanent loss, we will show that IL(3)(`,P,P0) = Pn
i=−m IL(3)(`i,Bi,P,P0) ≥ 0 by showing that it is always the case that IL(3)(`i,Bi,P,P0) ≥ 0.
We can expand the left hand side of the inequality to see that this boils down to showing that
v
(3)
h (`i,Bi,P,P0) ≥ v
(3)
p (`i,Bi,P0). which given the linearity of each of these terms in `i, is further
equivalent to showing that v
(3)
h (1,Bi,P,P0) ≥ v
(3)
p (1,Bi,P0). We prove this statement by showing
that the function v
(3)
p (1,Bi,P0) is differentiable and concave in P0, and that v
(3)
h (1,Bi,P,P0) is the
tangent to v
(3)
p (1,Bi,P0) at P0 = P, hence the inequality holds. We can expand the expression for
v
(3)
p (1,Bi,P0) as follows:
v(3)
p (1,Bi,P0
) =

 
 
P0 · ∆x
bi,ai
if P0 < ai
∆y
ai,bi
if P0 > bi
P0 · ∆x
bi,P0 + ∆y
ai,P0 if P0 ∈ [ai,bi].
(B.2)
We begin by considering the third case of the piece-wise definition above. I.e. P0 ∈ [ai,bi],
which in turn gives v
(3)
p (1,Bi,P0) = P0 · ∆x
bi,P0 + ∆y
ai,P0. If we simplify the expression, we obtain:
v(3)
p (Bi,P0
) = P0
· ∆x
bi,P0 + ∆y
ai,P0 (B.3)
= P0

1
√
P0
−
1
√
bi

+ (
√
P0 −
√
ai)
= −
1
√
bi
P0
+ 2
√
P0 −
√
ai
From this, we obtain the first and second derivatives of the expression:
d
dP0
v(3)
p (Bi,P0
) =
1
√
P0
−
1
√
bi
= ∆x
bi,P0,
d2
dP02
v(3)
p (Bi,P0
) = −
1
2P03/2
. (B.4)
From this, we have that v
(3)
p (Bi,P0) is differentiable for all P0, as derivatives match over the piece-
wise definition of the function, furthermore, the only non-linear component (when P0 ∈ [ai,bi]) is
smooth and concave from the negative second derivative above.
35Finally, we expand the expression for v
(3)
h (1,Bi,P,P0):
v
(3)
h (1,Bi,P,P0
) =

 
 
P0 · ∆x
bi,ai
if P < ai
∆y
ai,bi
if P > bi
P0 · ∆x
bi,P + ∆y
ai,P if P ∈ [ai,bi].
(B.5)
This is linear in P0 and that v
(3)
h (1,Bi,P,P) = v
(3)
p (1,Bi,P). To show that this is tangent to
v
(3)
p (1,Bi,P0) at P0 = P, it suffices to consider where the initial price P lies relative to ai ≥ bi. In
all cases though, from the above we see that the gradient of v
(3)
h (1,Bi,P,P0) as a function of P0
matches up with the gradient of v
(3)
p (1,Bi,P0) at P0 = P, hence v
(3)
h (1,Bi,P,P0) is indeed tangent
at P0 = P as desired.
C Example Uniswap Dynamics
C.1 Example v2 Dynamics
In all that follows, we suppose that a Uniswap v2 contract has been set up to trade between token
A and token B. In addition, we assume that the trade fee rate is given by γ = 0.5.
Initial Liquidity A first LP, denoted by LP1 provides a token bundle given by (x,y) = (10,10)
to initialize the contract’s bundle state, which must necessarily also be (10,10). The corresponding
liquidity-price state of this contract is thus given by (10,1) and we denote the liquidity units owned
by this LP with L1 = 10.
Moving Price from P = 1 to P = 1
4 A trader sends ∆x = 20 units of token A to the contract.
Of this, γ∆x = 10 is skimmed for liquidity providers, and since LP1 is the only provider, they
receive the entirety of this amount. The remaining (1 − γ)∆x = 10 is used to trade with the
contract. The token bundle state of the contract changes to (20,5), with a corresponding liquidity-
price state of (10, 1
4). This implies that the trader receives −∆y = 10 − 5 = 5 units of B tokens in
return for the ∆x = 20 units of A tokens they sent.
LP2 enters the contract A new liquidity provider, LP2 wishes to provide L2 = 40 units of
liquidity given the current contract price P = 1
4. To do so, they must send a token bundle
consisting of V(2)(L2,P) = (80,20) to the contract. Upon doing so, the contract’s token-bundle
state becomes (100,25) and the liquidity-price state becomes (50, 1
4) = (L1 + L2,P).
Moving Price from P = 1
4 to P = 25 Suppose a trader sends ∆y = 400 units of B tokens to
the contract. Of this γ∆y = 200 are skimmed for liquidity providers. LP1 receives L1
L1+L2
200 = 40
B tokens and LP2 receives the remaining 160 B tokens. The remaining (1− γ)∆y = 100 B tokens
are used to move the token-bundle state of the contract along the reserve curve R(2)(50). The
token-bundle state of the contract changes to (10,250), with a corresponding liquidity-price state
of (50,25). This implies that the trader receives −∆x = 50 − 10 = 40 A tokens in return for the
∆y = 200 B tokens they sent the contract.
36LP1 exits with their Liquidity We recall that LP1 has L1 = 10 units of liquidity in the contract.
Suppose they remove this liquidity at price P = 25. This means that they receive a token bundle
consisting of V(2)(L1,P) = (2,50). Notice that at the contract price P = 25, the token B worth
of this bundle is V(2)((2,50),25) = 100 B tokens. On the other hand, the initial bundle they had
provided to create this allocation (when price was P = 1) consisted of (10,10). The token B worth
of this bundle at the given price P = 25 is given by B((10,10),25) = 260. In this example, LP1 has
suffered an impermanent loss of 260 − 25 = 245 units of B tokens.
C.2 Example v3 Dynamics
Hopefully this example is enough to walk readers through the intricacies of liquidity provision, fees,
price dynamics, etc. In what follows we will follow closely the acitivity of 3 liquidity providers as
they provide and remove liquidity at different price intervals. We will also see what fees they accrue
and how the value of their assets change as traders interact with the system. In all that follows,
we suppose that the contract fee rate is given by γ = 0.5.
Initial Liquidity. Our first liquidity provider, which we denote LP1, provides L1 = 60 units of
liquidity over the price range I1 = [a1,b1] = [1/16,16]. Furthermore, we suppose that they have
allocated a bundle at price P = 1. This means that they have sent the contract the following
bundle:
V(3)
(L1,a1,b1,P) = (45,45).
Since LP1 is the only liquidity provider and P ∈ [a1,b1], it follows that they are the only active
LP in the system. Furthermore, the minimal active price interval, [a∗,b∗] is also trivially [a1,b1].
Similarly, L = L1 is the total amount of active liquidity, and the contract’s active bundle is the
same as LP1’s active bundle, which as we have seen is (45,45).
Moving Contract Price from P = 1 to P = 9. A trader sends ∆y = 240 units of token B to
the contract. Given the fee rate, γ, it follows that γ240 = 120 units of token B are proportionally
allocated to all active liquidity providers, which in this scenario is only LP1. The remaining 120
units of token B are to be used for trading via the v3 reserve curve given by R(3)(L,a∗,b∗). The
resulting active bundle of the system changes from (45,45) to (5,165), where the latter can be
verified to also lie on R(3)(L,a∗,b∗). In fact, the corresponding point on the virtual reserve curve is
φa∗,b∗(5,165) = (20,180), for which it is simple to verify that the contract price is indeed P = 9. In
concrete terms, this means that the trader received 45−5 = 40 A tokens in exchange for the 240 B
tokens they sent to trade and that LP1 received 120 B tokens in fees for their liquidity provision.
LP2 enters the contract. A new liquidity provider, which we dub LP2, wishes to provide
L2 = 120 units of liquidity over the price range I2 = [a2,b2] = [1/25,4]. Given the fact that the
current contract price is P = 9, which is above their price interval, this means that they need to
provide a token bundle which only consists of B tokens. More specifically, they send the following
bundle:
V(3)
(L2,a2,b2,P) = (0,216)
which has 216 B tokens to be exact. Notice however that the minimal active price interval is now
given by [a∗,b∗] = [4,16], for at a price of P = 4, LP2’s liquidity becomes active. At the current
price P = 9, only LP1 has active liquidity, which in turn implies that the total active liquidity in
37the contract is given by L = L1. At the same time, the contract’s active bundle is now different
from LP1’s overall assets in the pool for the minimal active price interval has changed. The active
bundle of the contract is given by V(3)(L,a∗,b∗,9) = (5,60), all of which belongs to LP1.
Moving Contract Price from P = 9 to P = 1/16. In what follows, let us assume that a
trader has sent ∆x = 1280 units of token A to the contract. As we will see shortly, this will indeed
move the contract price from P = 9 to P = 1/16, however such a price movement must necessarily
involve a change in active liquidity, for the price movement traverses the price P = 4, where the
L2 units of [a2,b2]-liquidity of LP2 become active. For this reason, we break up the ∆x into two
smaller trades: ∆xα = 20 and ∆xβ = 1260, each consisting of A tokens to be sent to the contract
by the trader.
For the first trade, we recall that the active price interval is given by [a∗,b∗] and that the total
active liquidity in the contract is L = L1. Furthermore, the active bundle of the contract is also
given by (5,60) ∈ R(3)(L,a∗,b∗). Of the ∆xα = 20 A tokens sent for trading, a γ portion is accrued
as fees. This amounts to 10 A tokens, which go entirely to LP1. The remaining (1 − γ)∆xα = 10
A tokens are used for trading along R(3)(L,a∗,b∗). This changes the active contract bundle to
(15,0), which means that the trader receives 60 B tokens for such an exchange. We also notice that
(15,0) ∈ V(3)(L,a∗,b∗) corresponds to the bundle φa∗,b∗(15,0) = (30,120) ∈ R(2)(L) on the virtual
reserve curve. This bundle can easily be verified to exhibit a contract price of 4 = a∗, which means
that to continue trading the remaining ∆xβ = 1260 A tokens, the contract must update its set of
active LPs.
As we continue trading from price P = 4, it is straightforward to see that the new active price
interval is given by [a∗,b∗] = [1/16,4], and that both LP1 and LP2 are active liquidity providers.
This in turn means that L = L1 + L2 is the new total active liquidity in the contract. In addition,
contract’s active bundle can be expressed by:
V(3)
(L,a∗
,b∗
,P) = (0,315).
This bundle is the aggregation of the active bundles of LP1 and LP2, which are each given by
V(3)(L1,a∗,b∗,P) = (0,105) and V(3)(L2,a∗,b∗,P) = (0,210) respectively. Now we can return
to the question of trading ∆xβ = 1260 A tokens. As before, γ∆xβ = 630 is taken as fees for
active LPs. Notice however, that in this case we have 2 active LPs, hence this quantity must
be split proportionally amongst them. LP1 receives L1
L 630 = 210 A tokens and LP2 receives the
remaining 420 A tokens as fees. Now let us consider using the remaining 630 A tokens to change
the contract bundle along the v3 reserve curve, R(3)(L,a∗,b∗). We can quickly verify that indeed
(630,0) ∈ R(3)(L,a∗,b∗), and has a corresponding bundle on the virtual reserve curve given by
φa∗,b∗(630,0) = (720,45) which can quickly be verified to exhibit a contract price of P = 1/16.
As the contract bundle went from (0,315) to (630,0) in this second trade, we see that the trader
receives 315 B tokens in exchange for the ∆xβ A tokens they sent for trading. In summary, the
trader sent ∆x = ∆xα + ∆xβ = 1280 units of A tokens and received 60 + 315 = 375 B tokens in
exchange.
LP3 enters the contract. A new liquidity provider, LP3 wishes to provide L3 = 180 units of
liquidity over the range I3 = [a3,b3] = [1/9,36]. We recall the current contract price is P = 1/16,
which is below the LP’s desired price range. For this reason, LP3 will have to deposit a bundle
38consisting entirely of A tokens to establish this liquidity allocation. More specifically, they will
provide the contract with the following bundle:
V(3)
(L3,a3,b3,P) = (510,0).
Notice that at the current price P = 1/16, the liquidity of LP3 is not active. Indeed it does not
become active until a price of P = 1/9 is reached. For this reason, the contract has a new minimal
active price interval given by [a∗,b∗] = [1/16,1/9]. It follows that the contract still has a total
active liquidity given by L = L1 + L2. At the same time, the contract’s active bundle is also given
by
V(3)
(L,a∗
,b∗
) = (180,0).
This bundle is also the aggregation of the active bundles of LP1 and LP2 over [a∗,b∗], which are
given by V(3)(L1,a∗,b∗,P) = (60,05) and V(3)(L2,a∗,b∗,P) = (120,0) respectively.
Moving Contract Price from P = 1/16 to P = 1. In what follows, we will assume that a
trader has sent ∆y = 510 units of token B to the contract to exchange for A tokens. As we will see
shortly, this will indeed move the contract price from P − 1/16 to P = 1. Such a price movement
however, must necessarily involve changes of active liquidity, for at price P = 1/9 the liquidity of
LP3 becomes active. For this reason, similar to before, we break up ∆y into tow smaller trades:
∆yα = 30 and ∆yβ = 480, each consisting of B tokens to be sent to the contract by the trader.
For the first trade, we recall that the active price interval is given by [a∗,b∗] and that the
total active liquidity in the contract is given by L = L1 + L2. In addition, as we’ve previously
seen, the active bundle of the contract is given by (180,0) ∈ R(3)(L,a∗,b∗). Of the ∆yα = 30
tokens, γ∆yα = 15 are skimmed for fees, which are shared between LP1 and LP2. LP1 receives
L1
L 15 = 5 B tokens and LP2 receives the remaining 10 B tokens. After such fees are leveed, the
remaining (1 − γ)∆yα = 15 B tokens are used to move active bundle along the v3 reserve curve,
R(3)(L,a∗,b∗). The resulting active bundle is thus (0,15) ∈ R(3)(L,a∗,b∗), which corresponds to
the bundle φa∗,b∗(0,15) = (540,60) ∈ cR(2)(L) on the virtual reserve curve. This bundle can easily
be verified to exhibit a contract price of P = 1/9 = a∗, which means that to continue trading the
remaining ∆yβ = 480 units of token B, the contract must update its set of active LPs.
As we continue trading from P = 1/9, it is straightforward to see that the new active price
interval is given by [a∗,b∗] = [1/9,4]. In this price range all LPs are active, hence the total active
liquidity is given by L = L1 + L2 + L3 = 360. As before, we can also compute the contract’s new
active bundle as:
V(3)
(L,a∗
,b∗
) = (900,0).
This bundle is made of the smaller active bundles of each LP, which are given by V(3)(L1,a∗,b∗) =
(150,0), V(3)(L2,a∗,b∗) = (300,0), and V(3)(L3,a∗,b∗) = (450,0) respectively for LP1, LP2 and
LP3. Now let us focus on the ∆yβ = 480 units of token B sent to the contract by the trader. As
before, we first skim provider fees, which amount to γ∆yβ = 240 B tokens to be split proportionally
amongst active LPs. In this case, LP1 receives L1
L 240 = 40 B tokens, LP2 receives L2
L 240 = 80
B tokens, and LP3 receives the remaining 80 B tokens. Now let us consider using the remaining
240 B tokens to change the contract bundle along the v3 reserve curve, R(3)(L,a∗,b∗). We can
quickly verify that indeed (180,240) ∈ R(3)(L,a∗,b∗), which has a corresponding token bundle on
the virtual reserve curve given by φa∗,b∗(180,240) = (360,360), which exhibits a price of P = 1 as
desired. The contract bundle changed from (900,0) to (180,240), meaning that the trader receives
39720 A tokens in exchange for the ∆yβ sent to the contract. Putting everything together, the trader
receives 900 A tokens in exchange for 510 B tokens.
LP1 exits with their liquidity. In what follows, we assume that LP1 removes their liquidity
from the contract. Before doing so, we recall that after the previous trade, the contract price
is given by P = 1. In addition, the active price interval is still [a∗,b∗] = [1/9,4], and all LPs
contribute to the active liquidity and active price bundle of the contract. We recall that LP1 has
L1 = 60 units of [a1,b1]-liquidity for a1 = 1/16 and b1 = 16. By removing their liquidity from the
contract, they receive a bundle given by:
V(3)
(L1,a1,b1,P) = (45,45).
Notice that this is the same as the bundle they used to open their liquidity allocation. This is due
to the fact that they are withdrawing their liquidity when the contract price is given by P = 1,
which is the same as the contract price when they created their position. In this example however,
removing LP1’s liquidity has no effect on the active price range, What does change however is
the active liquidity in the contract, and consequently, the active token bundle of the contract. The
contract’s active liquidity comes from LP2 and LP3, hence the active liquidity is L = L2+L3 = 300.
In addition, the active bundle is once again given by:
V(3)
(L,a∗
,b∗
) = (150,200).
This can be further split into the active bundle of each LP, LP2 has an active bundle given by
V(3)(L2,a∗,b∗) = (60,80) and V(3)(L3,a∗,b∗) = (90,120) respectively for LP2 and LP3.
Moving Contract Price from P = 1 to P = 1/4. A trader sends ∆x = 600 A tokens to the
contract. γ∆x = 300 A tokens are skimmed as fees for LP2 and LP3 who are both active. LP1
earns L2
L 300 = 120 A tokens and LP2 gets the remaining 180 A tokens as fees. The remaining
(1−γ)∆x = 300 A tokens are used to trade against the v3 reserve curve. At price P = 1, the active
token bundle of the contract is given by (150,200), however the trade shifts the active token bundle
to (450,50) ∈ R(3)(L,a∗,b∗), which has a corresponding bundle on the virtual reserve curve given
by φa∗,b∗(450,50) = (600,150), which clearly has a contract price of P = 1/4 as desired. Overall,
the trader sent ∆x = 600 A tokens to the contract and received 150 B tokens in exchange.
LP2 exits with their liquidity After the previous price move, the contract still has the same
active price interval [a∗,b∗] = [1/9,4], and the contract’s active bundle is (450,50). Furthermore,
the current contract price is given by P = 1/4. We assume that LP2 wishes to remove their L2
units of [a2,b2]-liquidity, where a2 = 1/25, and b2 = 4. In this case, LP2 receives the following
bundle upon extracting their liquidity:
V(3)
(L2,a2,b2,P) = (180,36).
Consequently, the active price interval changes to [a∗,b∗] = [1/9,36], which is the interval over
which LP3 lent liquidity, for they are the only remaining LP. As a final point, note that the bundle
received by LP2 is different from what they used to create their liquidity allocation, which was
(0,216). At the current price P = 1/4, the bundle (180,36) is worth 81 B tokens, which is much
less than the original 216 B tokens used to create the liquidity allocation. This is the impermanent
loss suffered by LPs as the contract price fluctuates.
40Figure 14: Uniswap v3 Liquidity Distribution for the top USDC/ETH pool on February 6th, 2022.
Each bar represents a bucket, and the height of the bar represents the amount of liquidity locked
in the bucket around the current contract price, which is given by the bar in red. As we can see,
most buckets near the price have different amounts of locked liquidity, which forcibly means that
their endpoints are active ticks, in line with our bucket coverage assumption.
D Empirical Findings on Liquidity Provision
We focus on providing empirical evidence in favor of our bucket coverage assumption from Section
4.5. To this end, Figure 14 provides a typical snapshot of locked liquidity in a USDC/ETH v3 pool
taken on February 6, 2022. The snapshot was reconstructed from transactions on the Ethereum
blockchain. Each bar in the image corresponds to a bucket, and the height of each bar represents
the amount of liquidity locked in that bucket. As we can see, buckets near the contract price, which
is the bar in red, have different amounts of liquidity. Specific liquidity amounts are shown in Table
1, where the index of the bucket in the first column represents the bucket position relative to the
contract price (which is in bucket B0). This typical difference in liquidity values for buckets around
the contract price in turn implies that said buckets’ endpoints must in turn be active, providing
credence to our bucket coverage assumption.
E Maximum Likelihood Estimation (MLE)
We are given a price sequence given by p = (p1,...,pn+1) where each pi ∈ R+. As per Section
4.3.1, we model market price evolution as a geometric binomial random walk with two relevant
parameters: ω and W. The parameter ω represents the multiplicative ratio between discrete prices
the random walk evolves over, and W is the bounded bandwidth that limits how far prices can
deviate in the random walk conditional on a given price.
It is important to note that empirical price data given by the sequence p need not adhere
to a single multiplicative ratio, as said prices are only constrained to lie in R+. However, as in
Proposition 8, we use the approximation that xt = logω( pt
pt+1
) ∼ N(2Wp − W,2Wp(1 − p)), with
p = m+2−
√
m2+4
2m , where m = log(ω). With this normal approximation, we can then perform a
maximum likelihood estimate over the sequence x1,...,xn, where each xt = logω( pt
pt+1
) is assumed
to be i.i.d normal with mean µ = 2Wp−W and variance σ2 = 2Wp(1−p). With this in hand, we
can express the likelihood of a choice of ω and W for the given price sequence p as follows:
41Table 1: Locked liquidity around the contract price for the top USDC/ETH pool on February 6th,
2022
Bucket Units of Liquidity Locked
B−5 14308585389682429965
B−4 13699020740164778906
B−3 13704199306520970180
B−2 13761114721595607988
B−1 14169372155386979909
B0 16389750355923557295
B1 10795735828654461424
B2 10786362926145864699
B3 10730695468843515712
B4 10847573897531124431
B5 10865194479196829563
L(ω,W | p) = P(x1,...,xn | ω,W) (E.1)
As is standard we maximize this expression by taking logarithms and minimizing the negative
log-likelihood given by:
NLL(ω,W | p) =
n
2
log(2πσ2
) +
1
2σ2
n X
i=1
(xi − µ)2
(E.2)
Lemma 2. The unique W∗ that minimizes NLL for a fixed ω is given by:
W∗
=
Pn
i=1 x2
i
n(p(1 − p) +
q
p2(1 − p)2 + 1
n
P
x2
i (2p − 1)2)
(E.3)
Proof. Going forward, we re-write the negative log-likelihood as a function of W:
f(W) = NLL(ω,W | p) =
n
2
log(aW) +
b
W
n X
i=1
(xi − cW)2
(E.4)
where a = 4πp(1 − p),b = 1
4p(1−p),c = 2p − 1. After some collecting terms, the derivative of f has
the following form:
f0
(W) = −
Pn
i=1 x2
i
4p(1 − p)
1
W2
+
n
2
1
W
+
n(2p − 1)2
4p(1 − p)
(E.5)
We can solve for f0(W∗) = 0 under the constraint given by W∗ > 0. We get a unique closed form
solution given by:
42W∗
=
Pn
i=1 x2
i
n(p(1 − p) +
q
p2(1 − p)2 + 1
n
Pn
i=1 x2
i (2p − 1)2)
(E.6)
as desired. Furthermore, We can compute the second derivative of f:
f00
(W) =
n
Pn
i=1 x2
i

− n2p(1 − p)W
2np(1 − p)W3
(E.7)
Clearly the second derivative depends on the data (i.e. the values of xi), but if we plug the
given W∗ into the expression, we obtain:
f00
(W∗
) =
Pn
i=1 x2
i
2p(1 − p)(W∗)3



1 −
1
1 +
r
1 +
(2p−1)2
Pn
i=1 x2
i
np2(1−p)2



 > 0 (E.8)
Hence W∗ is a minimum as desired.
E.1 Empirical Results
In this section we outline our methods for obtaining relevant ω and W values to be used in the LP
belief profiles from Section 5.1.
Baseline Price Sequences. As mentioned in Section 5.1, ω and W both govern the volatility of
the stochastic process dictating market prices relevant to an LP. In this regard, we looked historical
prices between Ethereum (ETH) and Bitcoin (BTC), as well as historical prices between Ethereum
(ETH) and and Tether (USDT). The former pair was chosen as a low volatility representative, as
most cryptocurrencies have prices correlated to Bitcoin. The latter pair was chosen for its relatively
higher volatility, for USDT is pegged to the dollar. For each of these price pairs, we obtained a
baseline price sequence from https://www.binance.com/en/landing/data of per-minute prices
for the month of February 2020.
Sub-sampling from Price Sequences. Let us denote the baseline price sequence for the ETH-
BTC pair by X0
1,...,X0
T , and that of the ETH-USDT pair by Y1,...,Y 0
T . Our first step of price-
processing involves sampling a collection of prices from each sequence at a desired frequency to
then apply MLE estimates from the previous section to obtain ω and W values. To this end, let
t0 ∈ {1,...,T}, and g,k ≥ 1 be integers. Let us focus on the ETH-USDT sequence given by
X0
i. A choice of (t0,g,k) implies we take a subsequence from {X0
i}T
i=1 given by {X0
tj
}k
j=1, where
tj = t0 +g ·j. Clearly this implies that we impose the constraint t0 +g ·k ≤ T. Ultimately, we are
interested in optimal liquidity allocations from LPs as per the methodology of Section 4. As we
focus on LP strategies that consist of allocating liquidity over T time-steps of a stochastic process
and subsequently removing said liquidity (and extracting fees), we are interested in sub-sampling
over smaller time horizons at smaller values of g, as it is in this regime where such LP strategies
are reasonable. Though this does imply that we are interested in smaller values of k, at the same
time, too small of values of k would give us poor MLE estimates as per the previous section, as we
would not have many samples to work with.
43Figure 15: The MLE fit over sub-sampled data from ETH-BTC and ETH-USDT.
MLE Computation. Once we choose values of (t0,g,k), we obtain a price subsequence as per
the exposition above, which for ETH-BTC is given by {X0
tj
}k
j=1, where tj = t0 + g · j. To proceed,
assume a fixed value of ω > 1, and use this to generate the sequence X1,...,Xk−1, where Xj =
logω

X0
tj+1
X0
tj

. For such a sequence, we can compute W∗ as per the closed form of Lemma 2, and
from this obtain NLL(ω,W∗ | X1,...,Xk−1). We can repeat this computation for multiple choices
of ω to find an ω∗ such that the negative log-likelihood is minimized via grid search. In summary,
once we fix sub-sampling parameters (t0,g,k), we can obtain MLE estimates ω∗,W∗ as above.
Results. For both price pairs, we used sub-sampling parameters given by (t0,g,k) = (0,1,256).
The reason for this is that we want to computationally explore the impact of price volatility on LP
PnL and trader gas fees given an LP belief profile, hence it is important to maintain these sub-
sampling parameters fixed over both price pairs of different real-world volatility. Our resulting MLE
estimates were (ω∗,W∗) = (1.005,3.0607) for ETH-USDT and (ω∗,W∗) = (1.005,6.7695) for ETH-
BTC. For reference, Figure 15 contains a visualization of the fit of the MLE normal distribution over
empirical log price ratios. Ultimately, LP beliefs are constructed via an approximate Geometric
Binomial Random Walk, hence we require integral values of W. For this reason, our computational
results in Section 5 use W values from the set {3,5,7}, where the lower and upper bounds on W
are precisely informed by our empirical results of this section.
44