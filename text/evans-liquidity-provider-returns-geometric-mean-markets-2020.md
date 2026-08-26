---
sha256: 32b4ec3c4ba3922162efe09c5d257e69261669a758e6165f25762696595b5be3
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 46557
---
Liquidity Provider Returns in Geometric Mean Markets
Alex Evans∗
June 2020
Abstract
Geometric mean market makers (G3Ms), such as Uniswap and Balancer, comprise a popular class
of automated market makers (AMMs) defined by the following rule: the reserves of the AMM before
and after each trade must have the same (weighted) geometric mean. This paper extends several results
known for constant-weight G3Ms to the general case of G3Ms with time-varying and potentially stochastic
weights. These results include the returns and no-arbitrage prices of liquidity pool (LP) shares that
investors receive for supplying liquidity to G3Ms. Using these expressions, we show how to create G3Ms
whose LP shares replicate the payoffs of financial derivatives. The resulting hedges are model-independent
and exact for derivative contracts whose payoff functions satisfy an elasticity constraint. These strategies
allow LP shares to replicate various trading strategies and financial contracts, including standard options.
G3Ms are thus shown to be capable of recreating a variety of active trading strategies through passive
positions in LP shares.
## 1 Introduction
Decentralized Finance (DeFi) consists of a set of protocols and applications that provide automated financial
services through smart contracts. At the time of writing, it is estimated that nearly 1 billion USD [1] is
being utilized by DeFi systems. DeFi applications often employ automated market makers (AMMs) to offer
standard financial services such as trading [16] and lending [19], as well as less conventional products such
as perpetual swaps [4] and flash loans [17].
Among AMM designs, geometric mean market makers (G3Ms) are most common to Decentralized Ex-
changes (DEXs) such as Uniswap [6] and Balancer [25]. In G3Ms, liquidity providers deposit assets into the
reserves of a smart contract. This contract permits third parties to submit trades against supplied reserves,
executing a trade only if the weighted geometric mean of reserves after the trade is equal to the one before.
In exchange for supplying reserves to the contract, liquidity providers are issued liquidity pool (LP) shares in
proportion to their contributions. LP shares may be redeemed for a proportional share of the pool’s reserves
at any time. The marginal prices offered by G3Ms are known to closely track prices on more liquid trading
venues [9]. This occurs because arbitrageurs are incentivized to respond to price fluctuations by submitting
trades that rebalance reserves to target weights [25]. This activity is akin to automated Exchange Traded
Fund (ETF) rebalancing.
Numerical example. While a formal definition of G3Ms is provided in §2.1, it is instructive to examine a
simple numerical example first. Consider two investors who each add 5 units of asset A and 5 units of asset
B to a G3M that assigns weights wA = 1/3 to asset A and wB = 2/3 to asset B. The weighted geometric
mean of reserves is then 101/3
102/3
= 10. If a trader sends 1 unit of asset A to the smart contract and
demands 5 units of asset B in exchange, the trade will be rejected, as the post-trade weighted mean would
be 111/3
52/3
6= 10. However, a trade that adds 1 unit of asset A in exchange for 0.466 units of asset B will
be accepted, as 111/3
9.5342/3
= 10. Clearly, the price offered by the G3M in this trade is 1 unit of asset
∗alex@placeholder.vc
1
arXiv:2006.08806v4 [q-fin.MF] 14 Jul 2020A which is added to the LP, for 0.466 units of asset B which is removed from the LP. This price depends
only on the pre-trade reserves RA = RB = 10 and the weights wA = 1/3, wB = 2/3. After the trade, each
investor’s LP shares are redeemable for half of the reserves, namely 5.5 units of asset A and 4.767 units of
asset B. We refer to the total value of reserves that the LP shares can be redeemed for as their “payoff.”
The marginal price offered by the G3M is the amount of asset B a trader receives in exchange for a
small quantity of asset A (and vice versa). When the marginal price offered by the G3M doesn’t reflect the
true market price, an arbitrage opportunity results to adjust the reserves of the G3M. For example, consider
again the case where the LP consists of 10 units of asset A and 10 units of asset B. If the price of asset B
is SB = $2 and the price of asset A is SA = $1, then the LP holds $30 worth of assets, of which 1/3 is held
in asset A and 2/3 in asset B. This allocation agrees with the respective weight of each asset, wA = 1/3
and wB = 2/3. If the external price of asset B drops to S0
B = $1, then, to restore the allocation so that
1/3 of the LP’s value is in asset A and 2/3 in asset B, a trader sends 2.6 units of asset B to the smart
contract. In exchange, the contract sends 3.7 units of asset A to the trader, maintaining the geometric mean
of (10 − 3.7)1/3
(10 + 2.6)2/3
= 10. The trader thus makes an arbitrage profit of 3.7 − 2.6 = 1.1. After the
trade, the reserves are updated to RA = 6.3 in asset A and RB = 12.6 in asset B. The total value held
in the LP is SARA + S0
BRB = $6.3 + $12.6 = $18.9, of which 6.3/18.9 = 1/3 is held in asset A and 2/3 in
asset B (again corresponding to the respective weights of the two assets). One can check that sending any
amount of asset B to the G3M other than 2.6 results in lower arbitrage profits for the trader. For example,
sending 2 units would yield a profit of 1.06, while sending 3 units would yield a profit of 1.08. This insight is
formalized in [9, 25], which show that adjusting the reserves so that 1/3 of the LP’s value is held in asset A
and 2/3 in asset B maximizes arbitrage profits for the trader. Traders are therefore incentivized to respond
to price changes by rebalancing the reserves of the G3M to match the target weights.
G3Ms in practice. The most well-studied examples of G3Ms are the Uniswap and Balancer protocols.
Uniswap exclusively supports LPs consisting of two assets whose reserves are equally weighted. This simplifies
the geometric mean to a “constant product rule” that allows traders to perform any trade that preserves the
product of reserves. The simplicitly and apparent effectiveness of Uniswap has spurred other applications to
adopt the constant product rule [3, 4, 5, 15].
Balancer generalizes the constant product formula by allowing pools of multiple assets as well as config-
urable weights. Balancer also supports dynamic weights that can be updated according to a set of rules [23].
For example, this allows the LP to gradually decrease its exposure to an asset over time [26] or to adjust
weights to favor assets that exhibit lower volatility [14].
As of this writing, Uniswap has nearly 60 million USD in reserves and facilitates 10 million USD in daily
trading volume, while Balancer has approximately 30 million USD in reserves and facilitates nearly 1 million
USD in daily trading volume [1, 2, 7, 21]. Amid growing interest in G3Ms, DeFi lending platforms have
started accepting LP shares as collateral for secured loans [22]. As G3Ms are attracting larger amounts of
capital and their LP shares are being used in increasingly complex financial transactions, there is a rising
need for a unified framework to study the return and price characteristics of LP shares in G3Ms.
Prior work. AMMs have been widely studied since the the introduction of the popular logarithmic market
scoring rule [18]. The present paper focuses on LP share returns in G3Ms, which are a popular class of
AMMs pioneered by [6, 25]. The most relevant prior work in this context is that of [8, 9, 13]. Specifically, [8]
derives returns and prices of LP shares in Uniswap, which consists of two equally-weighted assets, while [9]
derives an expression for LP share returns in constant-weight G3Ms consisting of more than two assets. For
Uniswap, [13] replicates LP share payoffs with the spanning formula of [12] and demonstrates approximate
hedging techniques using portfolios consisting of Uniswap LP shares and positions in futures contracts.
Overview. This paper studies LP share returns in generalized no-fee G3Ms. The static-weight payoff
results in [8] and [9] are extended to G3Ms with dynamic weights. In a parametric setting, the no-arbitrage
prices of LP shares are shown to follow directly from these payoff solutions. The resulting prices can be
used to analyze certain properties of LP share returns, such as per-trade losses and value leakage from
2volatility. This paper also shows how to use LP shares to replicate target payoffs. We show that setting
the weight of a G3M equal to the elasticity of a given payoff function ensures that the LP shares replicate
the payoff. The elasticity of a derivative’s payoff is defined as the percent change in the derivative’s value
per percent change in the price of the underlying asset it references. For differentiable payoff functions that
have elasticity between zero and one, the resulting hedges are exact and do not depend on the model one
uses for the underlying asset price. Replication is also studied under more general assumptions by utilizing
parametric hedges. G3M LPs are therefore shown to recreate the payouts of dynamic trading strategies
through passive positions in LP shares. Rather than using dynamic trading to replicate a desired payoff,
a user may instead purchase and hold the corresponding LPs, while rebalancing is handled by an external
group of arbitrage-seeking traders.
## 2 Assumptions and Notation
## 2.1 Geometric Mean Market Makers (G3Ms)
A Geometric Mean Market Maker (G3M) is an Automated Market Maker (AMM) [18] whose feasible trade
set is determined by the weighted geometric mean of its reserves. Specifically, for a set of n assets with
corresponding weight vector w(t) = (w1(t),...,wn(t)) and reserve vector R(t) = (R1(t),...,Rn(t)) with
R(t) ∈ Rn
+, a G3M enforces the geometric mean
V (t) =
n Y
i=1
Ri(t)wi(t)
(1)
for all t ≥ 0. By assumption, the weight vector is satisfies
n X
i=1
wi(t) = 1, (2)
wi(t) ≥ 0. (3)
A feasible trade is one that results in an updated reserve vector R0
(t) = (R0
1(t),...,R0
n(t)) for which
V (t) =
n Y
i=1
R0
i(t)wi(t)
.
In this paper, we work with G3Ms with no fees. This allows us to greatly simplify the results, while providing
a close approximation for many real-world G3Ms that charge traders a small fee. In this setting, let the
feasible trades for a G3M be defined as the set of vectors of the form ∆(t) = (∆1(t),...,∆n(t)) with
∆(t) ∈ Rn
+ that satisfy
V (t) =
n Y
i=1
Ri(t)wi(t)
=
n Y
i=1
(Ri(t) + ∆i(t))wi(t)
,
with ∆i(t) representing the amount of asset i that a trader will deposit into the pool. (Negative values
indicate amounts the trader removes from the pool.)
For a given weighted geometric mean, V (t), the price offered by a G3M depends only on the size of the
trade and the balances of reserves in the LP. Denote the prices of the assets in the reserve by the vector
S(t) = (S1(t),...,Sn(t)) with S(t) ∈ Rn
+. As shown in [25, Eq. 7], no-arbitrage requires that for all i 6= j,
Ri(t)/wi(t)
Rj(t)/wj(t)
=
Sj(t)
Si(t)
. (4)
That is, if the weight-normalized ratio of reserves for two assets in the LP is equal to the ratio of their prices,
then no arbitrage opportunity exists. We denote the payoff of the LP at time t by G(t). Since LP shares
3can be redeemed at any time for their underlying assets, their payoff is equal to the value of the underlying
reserves:
G(t) =
n X
i=1
Ri(t)Si(t). (5)
From (4) and (5), we have for all j ∈ (1,...,n)
G(t) =
Rj(t)Sj(t)
wj(t)
. (6)
Note that (6) is equivalent to Ri(t)Sj(t) = wj(t)G(t). In other words, the no-arbitrage condition ensures
that the value of the position in asset i represents a proportion wi of the LP’s overall value. As shown in [9]
and [25], should asset values in the LP deviate from the target weights, an arbitrage opportunity is created
to restore (6). To preclude arbitrage, the G3M LP is therefore continually rebalanced so that the proportion
of value allocated to each asset j matches its target weight, wj(t), akin to an ETF. Using (4) and (6), and
noting the restriction (2), one can derive the LP share payoff (total value of assets it can be redeemed for)
as a function of the weighted geometric mean V (t):
G(t) =
Rj(t)Sj(t)
wj(t)
Y
1≤j<i≤n

Ri(t)Si(t)wj(t)
Rj(t)Sj(t)wi(t)
wi(t)
=
n Y
i=1

Ri(t)Si(t)
wi(t)
wi(t)
= V (t)
n Y
i=1

Si(t)
wi(t)
wi(t)
, (7)
where in the second step we use wj(t) = 1 −
P
i6=j wi(t). In the case where weights are constant, all trades
will preserve the weighted geometric mean, so V (t) = V (0) for all t. Section 3 makes use of this fact to price
G3Ms with constant weights using (7). When w(t) is a more general adapted process, we must specify the
evolution of V (t), which may be a stochastic process. This problem is taken up in Section 4.
## 2.2 Market Model
Let (Ω,F,{Ft}t∈R,P) be a conventional filtered probability space [29]. Assume frictionless markets, and
consider a financial market that consists of d risky assets and one money market (risk-free) asset. For
pricing applications, assume further that there exists an equivalent probability measure P̃ such that the
money market asset and risky assets have respective stochastic differentials
dM(t) = M(t)r(t)dt (8)
and
dSi(t) = Si(t)

ri(t)dt +
d X
j=1
σij(t)dBj(t)

, i,j ∈ {1,...,d}. (9)
Here, B(t) = (B1(t),...,Bd(t)) is a standard Brownian motion under P̃, r(t) is the riskless interest rate and
the components of the volatility matrix, (σij(t))i=1,...,d;j=1,...,d, are adapted processes. Allowing pairwise
correlation between risky assets prices, we can rewrite (9) as
dSi(t) = Si(t)[r(t)dt + σi(t)dWi(t)], (10)
4where each Wi(t) =
Pd
j=1
Rt
0
σij(u)
σi(u) dBj(u) is a Brownian motion (by Lévy’s theorem for characterizing a
Brownian motion), and σi(t) =
qPd
j=1 σ2
ij(t) is the volatility of asset i which we assume is never zero.
Define
dWi(t)dWj(t) = ρij(t)dt,
where ρij(t) is the instantaneous correlation between the Brownian motions Wi(t) and Wj(t). It can be
shown that 0 ≤ ρij(t) ≤ 1.
## 3 Constant-Weight G3Ms
In this section, the prices associated with the payoff in (7) are derived in the case of constant-weight G3Ms.
Working with G3Ms consisting of n ≤ d risky assets, we use the model of §2.2 and assume the volatility
matrix (σij(t))i=1,...,n;j=1,...,d and the interest rate price process r(t) are constant; we set σi(t) = σi ≥ 0
and r(t) = r for all t. Note when the weights are fixed, V (t) will be constant. The value of an n-asset LP
with constant weights wi(t) = wi is therefore given by the discounted time-t expectation of (7) under the
risk-neutral probability measure, P̃. Denote the value of the LP share at time t by
f(t,S(t)) = Ẽ
h
e−r(T−t)
G(T)|F(t)
i
, (11)
where S(t) is the vector of time-t prices for the reserve assets in the LP. This leads to the following Proposition.
Proposition 1 (Pricing constant-weight LPs). The price of the LP share with payoff (7) and constant
weights wi(t) = wi is given by the discounted expectation in (11) and is equal to
f(t,S(t)) = eη
V (0)
n Y
i=1

Si(t)
wi
wi
(12)
= G(t)eη
, (13)
where
η =
1
2


n X
i=1
σ2
i (w2
i − wi) +
X
i6=j
σiσjρijwiwj

(T − t). (14)
Furthermore, η ≤ 0.
From the general case addressed in Proposition 1, one can recover the result in [8, Appendix C] for the
simpler Uniswap constant-product market.
Corollary 1.1 (Pricing Uniswap LP shares). Define Uniswap as a G3M with n = 2 assets, a and b, and
wa = wb = 1
2. Then the Uniswap LP has
ηU = −
σ2
rab
8
(T − t). (15)
,
where
σrab
=
q
σ2
a + σ2
b − 2σaσbρab. (16)
In particular, we prove that σrab
is the volatility of the price ratio Sa/Sb for the two assets in the LP.
5Volatility Losses. To understand the content of η in (13) and (14), recall the observation in §2.1 that
no-arbitrage requires the G3M LP to continually rebalance its reserves to match the target weights. Should
asset values in the LP deviate from the target weights, an arbitrage opportunity is created to restore (6). By
definition, arbitrage results in a greater value of assets exiting the LP than entering, which reduces the value
of the LP shares. LP shares therefore incur rebalancing costs due to arbitrage in order to enforce a target
portfolio composition. To understand the magnitude of these costs, contrast the LP share payoff in this
situation with that resulting from continually rebalancing a portfolio to fixed weights under zero transaction
costs. From [10], the stochastic differential for this portfolio is given by
dN(t) = N(t)
n X
i=1
wi
dSi
Si
. (17)
In Appendix A.4, we show that this portfolio strategy has value
Ẽ
h
e−r(T−t)
N(T)|F(t)
i
= e−η(T−t)
f(t,S(t)). (18)
This shows that eη(T−t)
represents the expected loss LP shares incur relative to a constant-mix portfolio with
equivalent weights. This coincides with the well-documented result of volatility harvesting [30] which states
that a continuously-rebalanced constant-mix portfolio has a greater growth rate than the weighted average
of its component assets. The constant-mix portfolio in (18) benefits from volatility through the e−η(T−t)
term, while the no-fee LP in (7) does not. This is the cause of the supermartingale behavior observed in
(13). One can therefore replicate the value of a fixed-weight G3M LP share with less initial capital by
continuously rebalancing to the same target weights in a frictionless market. Informally, this occurs because
the G3M lags the market during rebalancing. LP rebalancing occurs through arbitrage which results when
LP reserves do not reflect updated market prices. LP shares therefore rebalance at suboptimal prices relative
to conventional constant-mix portfolios.
Figure 1 plots η using an example of a two-asset LP share with assets a and b. Note that (15) is minimized
in the Uniswap configuration, where wa = 1
2; this represents the maximum loss relative to the constant-mix
portfolio. Meanwhile, η is zero when wa = 0 and when wa = 1; in these cases the LP shares coincide with
buy-and-hold portfolios, and there are no opportunities for trading against the assets of the pool (hence no
arbitrage losses). The quantity η is increasing with respect to the correlation coefficient ρab. The higher the
correlation coefficient, the smaller the price deviations are expected to be for the assets in the LP; thus, high
values of ρab limit arbitrage losses. Similarly, higher levels of volatility for one of the two assets in the LP
produce greater volatility losses. In the case two-asset case, when σa = σb and ρab = 1, η is zero regardless of
the choice of weight, as there is no expected trading (price moves are expected to have identical magnitude
and direction).
LP share gamma. Taking the first derivative of (12) with respect to the stock price (“delta” in options
terminology) yields fSi = wiS−1
i f, which is non-negative. Taking the second derivative (“gamma”) gives
fSiSi
= wi(wi − 1)S−2
i f, which, by the restrictions on wi, is non-positive. The constant-weight LP will
therefore decrease its unit position in asset i as its price increases (and conversely increase its unit position
as price declines). The resulting payoff is concave in Si, an effect Uniswap traders refer to as “impermanent
loss.” Specifically, regardless of the direction of a price movement, the LP share will decrease in value relative
to the buy-and-hold portfolio, which has a gamma of zero. Note that the constant-mix portfolio without
rebalancing costs described above also exhibits a negative gamma, but, unlike the G3M LP share, it benefits
from volatility in exchange (this is the content of (18)). The LP share’s gamma is minimized (impermanent
loss is highest) when the weight of asset i is wi = 1
2, while it is zero when wi = 1 (LP holds only asset i) and
when wi = 0 (no exposure to i). As noted in [24], this comes with a direct trade-off to the slippage offered
to traders in the pool.
6Figure 1: The left figure plots η (defined in (14)) for a two-asset LP share (n = 2) with asset volatilities
σa = 0.3 and σb = 0.2, given different choices for the weight wa of asset a and for the correlation coefficient
ρab. The right figure holds ρab = 0 and plots η for different choices of wa and volatility levels σa.
## 4 General Weight Functions
## 4.1 Discrete-Time Weighted Geometric Mean
In this section, the payoffs for G3M LP shares are derived for the case where the weight vector w(t) is
an F(t)-measurable process. From an initial weighted geometric mean V (0), assume the process V (t) is
generated by updating the weight vector at a sequence of re-weighting times 0 = t0 < t1 < ... < ts = T.
The weight vector is updated at the left endpoint of each interval [tk,tk+1) and is then held constant until
the next re-weighting time. This ensures that V (t) remains constant on each interval but is allowed to vary
across intervals. Assume the initial weighted geometric mean V (0) = V (t0) is given by
V (t0) =
n Y
i=1
Ri(0)wi(0)
.
By assumption, updating satisfies V (tk−1) =
Qn
i=1 Ri(tk)wi(tk−1)
and V (tk) =
Qn
i=1 Ri(tk)wi(tk)
. Since the
weighted geometric mean is constant within each interval, at each tk we have
V (tk) =
n Y
i=1
Ri(tk)wi(tk)
=
n Y
i=1
Ri(tk)wi(tk−1)
Ri(tk)∆wi(tk)
= V (tk−1)
n Y
i=1
Ri(tk)∆wi(tk)
,
where ∆wi(tk) = wi(tk)−wi(tk−1) and
Pn
i=1 ∆wi(t) = 0. Repeating this procedure starting from ts we get
V (ts) = V (0)
s Y
k=1
n Y
i=1
Ri(tk−1)∆wi(tk)
.
Solving for Ri(tk−1) in the no-arbitrage condition of (6), we have
7Ri(tk−1) =
wi(tk−1)
Si(tk−1)
G(tk−1).
Again using
Pn
i=1 ∆wi(t) = 0,
n Y
i=1
Ri(tk−1)∆wi(tk)
=
n Y
i=1

wi(tk−1)
Si(tk−1)
∆wi(tk)
.
This provides the discrete-time formula for the weighted geometric mean at time T:
V (T) = V (t0)
n Y
i=1
s Y
k=1

wi(tk−1)
Si(tk−1)
∆wi(tk)
. (19)
Note that this discrete-time formulation is the most realistic setting for G3Ms deployed on public blockchains
such as Ethereum that have positive-length time intervals between blocks. In this setting, each weight
adjustment will present an arbitrage opportunity that results in some value loss for LP shares.
## 4.2 Payoff for Continuously-Varying Weights
This section studies LP returns in the case where weights are allowed to vary continuously. The key result
of this section is the following.
Proposition 2 (Payoff for dynamic-weight LPs). Assume each component weight function wi(s), i ∈
{1,...,n}, is continuous and has bounded variation, and denote the length of the longest interval in (19) by
||Π|| = maxk=0,...,s−1(tk+1 − tk). Then taking the limit in (19) as ||Π|| → 0 gives the weighted geometric
mean for all T ≥ t ≥ 0
V (T) = V (t)
n Y
i=1

wi(T)
Si(T)
wi(T) 
Si(t)
wi(t)
wi(t)
e
R T
t
wi(t)dlog(Si(t))
with corresponding payoff function
G(T) = G(t)
n Y
i=1
e
R T
t
wi(t)dlog(Si(t))
. (20)
This is the payoff function we work with in the remaining sections.
LP prices computed by taking discounted risk-neutral expectations in (20) will depend on the stochastic
process chosen for the weight vector w(t) = (w1(t),...,wn(t)). However, if the weight vector is a deterministic
function of time, the solution can be simplified. In this case, LP prices can be computed directly given the
model in §2.2.
Proposition 3 (Pricing LPs with deterministic time-varying weights). If each component of w(t) = (w1(t),...,wn(t))
is an F(t)-measurable deterministic function of t, then the corresponding LP share price is given by the dis-
counted expectation under the risk-neutral measure of (20) and is equal to
Ẽ
h
e−r(T−t)
G(T)|F(t)
i
= G(t)eη(t,T)
, (21)
where
8η(t,T) =
n X
i=1
σ2
i
2
Z T
t
[w2
i (t) − wi(t)]dt +
1
2
X
i6=j
σiσjρij
Z T
t
wi(t)wj(t)dt. (22)
These prices are relevant to applications that require G3M weights to be adjusted according to a fixed
schedule. Typically, an LP will reduce the weight of one of its assets until some target weight is reached. This
creates an arbitrage opportunity to remove units of the asset whose weight is declining in favor of the other
reserve assets. This has been proposed as a mechanism for bootstrapping liquidity in nascent markets [26].
Similarly, it may be desirable for an LP to decrease its exposure to assets with fixed maturities, such as
options and bonds, as these near expiry.
## 5 Payoff Targeting and Replication
This section shows how to select G3M weight functions to ensure that the resulting payoffs of the LP shares
replicate the payoffs of derivative claims on the price of an asset. We work with a two-asset G3M that
consists of a risky asset with weight w(x,t) and a position in the risk-free asset with weight 1 − w(x,t),
where x = Sα(t) is the price of the risky asset. Consider a contract with payoff given by the real-valued
function g(x,t).1
Rewriting (20) as
G(t) = G(0)e
R t
0
w(x,s)dlog(x)
, (23)
we solve for the weight w∗
(x,t) such that the LP and the derivative contract have the same payoff for all
t ≥ 0:2
G(t) = g(Sα(t),t) for all t ≥ 0. (24)
Proposition 4 (Replicating weight function). Let g be differentiable with respect to x for x ∈ R+. Then
the solution for w(x,t) in (24) with initial condition G(0) = g(Sα(0),0) is given by
w∗
(x,t) =
dlog(g(x,t)))
dlog(x)
=
xgx(x,t)
g(x,t)
, (25)
where gx is the partial derivative of g with respect to x. The payoff g(x,t) can be replicated by a G3M LP
provided that w∗
(x,t) is continuous in x and
0 ≤ w∗
(x,t) ≤ 1 for all x,t ∈ R+. (26)
Equation (25) is the elasticity of a contingent claim, i.e. the percent change in the value of the derivative given
a one-percent change in the price of the risky asset (it is also termed “lambda” or “omega” in derivatives
parlance). The condition in (26) is due to the restrictions (2) and (3) on the weights of the G3M. Note that
if short-selling an LP share is possible, one can also replicate claims with −1 ≤ w∗
(x) ≤ 0. The condition
(26) states that the G3M cannot be used to gain leverage on its reserve assets. The maximum elasticity of a
contingent claim with respect to the risky asset is therefore attained when w(x,t) = 1, when the pool consists
exclusively of the risky asset. For differentiable claims where (26) is satisfied, (25) guarantees that holding
an LP share provides an exact static hedge of the contingent claim regardless of the model one uses for the
underlying asset price. In practice, continuous weight adjustments will not be possible in the discrete-time
1For example, a forward contract expiring at time T has g(x,T) = Sα(T) − K, and an option expiring at time T has
g(x,T) = max{Sα(T) − K,0}, where, in both examples, K is the strike price.
2In practice, enforcing weight updates of this form may require the use of a “price oracle” such as [20] that reports the price
of the asset to the G3M smart contract.
9setting of public blockchains. Discrete weight adjustments will result in arbitrage opportunities that reduce
the value of the pool. This implies that the LP share will in practice provide a sub-hedge for g(x,t), though
the introduction of fees can be used to offset all or part of these relative losses.
It will often be possible to relax the assumptions of Proposition 4 by instead replicating the value of the
contract by replacing g(x,t) in (25) with its discounted expectation under the risk-neutral measure. Such
pricing formulae will typically require the use of a model such as that of §2.2 for the underlying price. The
resulting LP share will provide a parametric hedge for the derivative asset, and the accuracy of the hedge
will depend on the model chosen. For concreteness, we provide an example below.
Example (Protective put). A protective put [27] is a popular risk-management strategy wherein an
investor buys an asset alongside a put option on the same asset. In exchange for the option premium, the
strategy allows the investor to profit from price appreciation while being protected from losses. Given a
model for the option price, we can show that a G3M LP can be programmed to synthetically replicate a
protective put. For example, using the Black–Scholes formula [11] for the value of a put option, we have
P(x,t) = Ke−r(T−t)
Φ(−d2) − xΦ(−d1),
where T > 0 is the expiration, K ≥ 0 is the strike price, Φ(·) is the standard normal CDF, and
d1 =
log(x/K) + (r + σ2
α/2)(T − t)
σα
√
T − t
,
d2 = d1 − σα
√
T − t.
where σα is the volatility of the risky asset. It can be shown that the protective put claim g(x,t) = x+P(x,t)
has elasticity
w∗
pp(x,t) =
x(1 − Φ(−d1))
P(x,t) + x
. (27)
Note that the numerator is equal to the price of the asset multiplied by one plus the “put delta,” the
first derivative of the put with respect to x. This quantity is always non-negative, as 0 ≤ Φ(·) ≤ 1 and
x ∈ R+. The denominator is also non=negative, as the value of the option is given by the time-t risk-neutral
expectation of g(x,T) = max{Sα(T) − K,0}. Therefore w∗
pp(x,t) ≥ 0. Furthermore,
w∗
pp(x,t) ≤ w∗
pp(x,t) +
Ke−r(T−t)
Φ(−d2)
P(x,t) + x
= 1.
We conclude that setting the G3M’s weight for the risky asset to (27) replicates a protective put on the
risky asset with strike K and expiry T. Using the same procedure, we can show that an LP can replicate a
covered call, which consists of a long position in an asset alongside a short position in a call option written
on the same asset. Figure 2 shows the weight function that replicates a protective put. As the price of the
underlying asset increases, the weight tends to one, where the LP consists entirely of the risky asset. As price
declines, the LP increases the weight of the money market (risk-free) asset. The relationship with time to
maturity depends on whether the put option is “in the money” (above the strike price K). If the put is “at
the money” (Sα = K), then the G3M weight is 0.5 regardless of time to maturity. If the put is near expiry
and Sα > K, then the G3M places a greater weight on the risky asset. If the put is near expiry and Sα < K,
then the G3M places a greater weight on the risk-free asset. The replicating weight of the protective put in
the risky asset is therefore increasing with respect to the probability that the put will expire out of the money.
A number of interesting derivative contracts, such as pure (“naked”) options, often exhibit elasticity
far greater than one. There are two approaches to replicating such contracts. The first involves taking
10Figure 2: Replicating weights w(x,t) for a protective put given a strike price of K = 100 USD for the put
option and a risky asset with monthly volatility of σα = 0.2. The left figure plots the replicating weight
as a function of asset price for different maturities, while the right figure plots the replicating weight as a
function of time to maturity for different values of the asset price.
offsetting positions in addition to the LP. For example, holding an LP that replicates a protective put while
also establishing a short position in the underlying asset will replicate the payoff of the put option. Using
the approach of the proceeding example, it can be shown that a portfolio consisting of a call option plus
a position worth er(T−t)
K in the money market satisfies (26). Holding the replicating LP share of this
portfolio in addition to an offseting short position of er(T−t)
K in the money market will replicate the pure
call option. The offsetting positions in the risky or money market assets can be interpreted as borrowing
the respective assets and placing them in the replicating LP. This could be facilitated by an existing lending
protocol such as [22] that accepts LP shares as collateral for secured loans. For example, to replicate a
naked put option, the investor would place an amount of capital equal to the initial price of the option in a
G3M that replicates a protective put. At the same time, the lending protocol would supply one unit of the
risky asset to the G3M, while taking the corresponding LP shares as collateral. Even if the option expires
worthless, the lender can be assured that the replicating LP will be at least as valuable as the risky asset that
was lent, ensuring repayment of the loan. At expiration, after repaying the borrowed asset to the lending
protocol, the investor’s remaining position will have equal value to that of the pure put option (assuming
the model used in constructing the hedge was correctly calibrated).
A second approach to replicating claims with elasticity greater than one involves adding derivatives to a
G3M’s reserves. The use of levered assets can expand the range of derivatives that an LP share can be used
to replicate. For example, in place of the risky asset one can include a derivative on the risky asset in the
LP’s reserves with time-t price z(Sα(t)). In this case (23) becomes
G(t) = G(0)e
R t
0
w(z(x))dlog(z(x))
, (28)
and we have the following solution. For simplicity, we work with the single-variable payoff, g(x).
Corollary 4.1 (Replication with derivative assets). Let g and z be differentiable on R+. Then the solution
to G(t) = g(Sα(t)) when G(t) is given by (28) and with initial condition G(0) = g(Sα(0)) is
11w∗
(z(x)) =
dlog(g(x))
dlog(z(x))
. (29)
Replication with a G3M LP requires that
0 ≤
dlog(g(x))
dlog(z(x))
≤ 1 for all x ∈ R+. (30)
G3Ms can therefore replicate any claim whose logarithmic derivative is no larger than that of its reserve asset
price function. The logarithmic derivatives of the payoff g(x) and price z(x) determine their infinitesimal
relative changes and can informally be thought of as a measure of leverage. When the target claim is no
more levered than the reserve claim, replication will be possible through a static position in the LP.
## 6 Conclusion
This work studies the returns investors receive for contributing reserves to G3Ms. We derive explicit payoff
and pricing functions for LP shares in G3Ms that utilize both static and dynamic weights. We show that
LP share payoffs of G3Ms that do not charge fees are supermartingales under the risk-neutral probability
measure, due to having higher rebalancing costs than constant-mix portfolios. Utilizing dynamic weights, we
show that G3M LP shares can be used to provide exact static hedges for arbitrary financial contracts whose
payoffs have elasticity between zero and one. In a parametric setting, we demonstrate how to use offsetting
positions and external leverage to replicate more general financial contracts, such as standard options.
A question left open by this paper concerns fees. In practice, most G3Ms charge fees that introduce path
dependencies in LP share payoffs [9]. As fees may alter both the frequency and the cost of G3M rebalancing,
it may be instructive to consider the corresponding constant-mix portfolio under rebalancing restrictions and
transaction costs [28].
Acknowledgement
The author would like to thank Guillermo Angeris, Tarun Chitra, Alexandre Obadia and Assimakis Kattis
for their feedback on this paper.
12A Proofs
A.1 Combining Brownian Motions
We establish a definition that will be useful in the proofs of Propositions 1 and 3. For n ≤ d, and given that
the components of w(t) are square-integrable by the restrictions in (2) and (3), we can define
ZP (t) =
n X
i=1
Z t
0
wi(u)σi(u)
σP (u)
dWj(u),
with
σP (t) =
v
u
u
t
n X
i=1
w2
i (t)σ2
i (t) +
X
i6=j
wi(t)wj(t)σi(t)σj(t)ρij(t),
which we assume is non-zero. (As will be discussed in the proofs of Propositions 1 and 3, σP represents the
volatility of the weighted geometric mean of the risky asset prices.) We can use these definitions to write
σP (t)dZP (t) =
n X
i=1
wi(t)σi(t)dWi(t).
It is trivial to verify that ZP has quadratic variation hZP (t)i = t. Being the sum of continuous martingales,
ZP (t) is therefore a Brownian motion by Lévy’s theorem.
A.2 Proof of Proposition 1
The proof of Proposition 1 has two parts: first we prove (13), and then we prove that the quantity η defined
in (14) is at most zero.
i) The proof of (13) runs as follows: the differential for the weighted geometric mean of the prices will give
a geometric Brownian motion, from which (13) follows immediately by taking expectations in (11).
Note that Si(t)wi
is given by
Swi
i (t) = Swi
i (0)ewi(r−σ2
i /2)t+wiσiWi(t)
.
Applying Itô’s lemma results in the differential
dSwi
i (t) = Swi
i (t)

(wir +
σ2
i
2
(w2
i − wi))dt + wiσidWi(t)

,
which defines a geometric Brownian motion with mean (wir+ σ2
2 (w2
i −wi)) and volatility wiσi. Note further
that
d(Swi
i (t)S
wj
j (t)) = Swi
i (t)dS
wj
j (t) + dSwi
i (t)S
wj
j (t) + dSwi
i (t)dS
wj
j (t)
= Swi
i (t)S
wj
j (t)[(r(wi + wj) +
σ2
i
2
(w2
i − wi) +
σ2
j
2
(w2
j − wj) + wiwjσiσjρij)dt
+ wiσidWi(t) + wjσjdWj(t)].
Iterating gives
13d
n Y
i=1
Swi
i (t)
!
=
n Y
i=1
Swi
i (t)



r +
n X
i=1
σ2
i
2
(w2
i − wi) +
1
2
X
i6=j
wiwjσiσjρij

dt +
n X
i=1
wiσidWi(t)

. (31)
As shown shown in §A.1, we may define
σP =
v
u
u
t
n X
i=1
w2
i σ2
i +
X
i6=j
wiwjσiσjρij
and
ZP (t) =
n X
i=1
Z t
0
wiσi
σP
dWj(u),
which is a Brownian motion. We can then rewrite (31) as
d
n Y
i=1
Swi
i (t)
!
=
n Y
i=1
Swi
i (t)



r +
n X
i=1
σ2
i
2
(w2
i − wi) +
1
2
X
i6=j
wiwjσiσjρij

dt + σP dZP (t)

, (32)
which is a geometric Brownian motion with mean r+
Pn
i=1
σ2
i
2 (w2
i −wi)+ 1
2
P
i6=j wiwjσiσjρij and volatility
σP . We obtain the result (13) by taking the expectation in (11). The result in (12) follows from noting that
V (0) = G(0)
Qn
i=1

wi(0)
Si(0)
wi(0)
, which follows from (7).
ii) Next, we show that η ≤ 0 (where η is defined in (14)). Since 1
2(T −t) ≥ 0, this is equivalent to showing
that
n X
i=1
σ2
i (w2
i − wi) +
X
i6=j
σiσjρijwiwj ≤ 0.
Recall the restrictions (2) and (3) and the assumption that σ1,...,σn are positive constants. Since the
second summand is positive and 0 ≤ ρij(t) ≤ 1, it suffices to show that
n X
i=1
σ2
i (w2
i − wi) +
X
i6=j
σiσjwiwj ≤ 0.
The left-hand side can be rewritten as
n X
i=1
σ2
i (w2
i − wi) +
X
i6=j
σiσjwiwj = −
n X
i=1
σ2
i wi(1 − wi) +
X
i6=j
σiσjwiwj
= −
n X
i=1
σ2
i wi


i−1 X
j=1
wj +
n X
j=i+1
wj

 + 2
X
1≤i<j≤n
σiσjwiwj
= −
X
1≤j<i≤n
σ2
i wiwj −
X
1≤i<j≤n
σ2
i wiwj + 2
X
1≤i<j≤n
σiσjwiwj,
14where the second line follows from (2). Relabeling indices in the first sum gives
−
X
1≤i<j≤n
σ2
j + σ2
i − 2σiσj

wiwj = −
X
1≤i<j≤n
(σj − σi)
2
wiwj ≤ 0,
as desired.
A.3 Proof of Corollary 1.1
The volatility σab will follow from the expression for the price ratio. The stochastic differential for the ratio
of the prices of two assets Srab
(t) = Sa(t)/Sb(t) is given by
Srab
(t) = (1/Sb(t))dSa(t) − (Sa(t)/S2
b (t))dSb(t) − (1/S2
b (t))dSa(t)dSb(t) + (Sa(t)/S3
b (t))(dSb)2
= Srab
(σ2
b(t) − σa(t)σb(t)ρab(t))dt + Srab
σrab
(t)dZr(t),
where
σrab
(t) =
q
σ2
a(t) + σ2
b(t) − 2σa(t)σb(t)ρab(t)
and
Zr(t) =
1
σrab
Z t
0
σa(u)dWa(u) −
Z t
0
σb(u)Wb(u)

;
note that Zr(t) is a Brownian motion. Therefore Srab
is a geometric Brownian motion with drift σ2
b(t) −
σa(t)σb(t)ρab(t) and volatility σrab
(t). Assuming constant volatilities and taking n = 2 and wa = wb = 1
2 in
(13), we have
η =

−
σ2
a
8
−
σ2
a
8
+
1
4
σaσbρab

(T − t) =
σ2
rab
8
(T − t),
as desired.
A.4 Payoff of Constant-Mix Portfolio
From (17) we have
dN(t) = N(t)(rdt +
n X
i=1
wiσidWi)
= N(t)(rdt + σP dZP ), (33)
which gives
N(t) = N(0)e(r−
σ2
P
2 )t+σP ZP (t)
.
Comparing (33) with (32) shows that the difference between their drift terms is (14), from which the result
in (18) follows by taking expectations.
15A.5 Proof of Proposition 2
Take the limit as the quantity ||Π|| = maxk=0,...,s−1(tk+1 − tk) (the size of the longest time interval in (19))
tends to zero:
V (T) = V (t0) lim
||Π||→0
s Y
k=1
n Y
i=1
wi(tk−1)
Si(tk−1)
∆wi(tk)
.
We have
log[V (T)/V (t0)] = lim
||Π||→0
n X
i=1
s X
k=1
log

wi(tk−1)
Si(tk−1)

∆wi(tk)
=
n X
i=1
Z T
t0
log

wi(t)
Si(t)

dwi(t)
=
n X
i=1
"
log

wi(T)wi(T)
wi(0)wi(0)

+ wi(T) − wi(0) −
Z T
t0
log(Si(t))dwi(t)
#
.
Note that
Pn
i=1[wi(T) − wi(t0)] = 0, and integrate by parts:
log[V (T)/V (t0)] =
n X
i=1
"
log

wi(T)wi(T)
wi(t0)wi(t0)

− wi(T)log(Si(T)) + wi(t0)log(Si(t0)) +
Z T
t0
dlog(Si(t))wi(t)
#
.
Setting t0 = t,
V (T) = V (t)
n Y
i=1

wi(T)
Si(T)
wi(T) 
Si(t)
wi(t)
wi(t)
e
R T
t
wi(t)dlog(Si(t))
.
Using the payoff function in (7),
G(T) = V (t)
n Y
i=1

Si(t)
wi(t)
wi(t)
e
R T
t
wi(t)dlog(Si(t))
.
Noting that (7) also implies
V (t) = G(t)
n Y
i=1

wi(t)
Si(t)
wi(t)
gives
G(T) = G(t)
n Y
i=1
e
R T
t
wi(t)dlog(Si(t))
,
as desired.
16A.6 Proof of Proposition 3
Expanding in (20), we have
G(T) = G(t)
n Y
i=1
e(r−
σ2
i
2 )
R T
t
wi(t)dt+σi
R T
t
wi(t)dW−i(t)
= G(t)er(T−t)−
Pn
i=1
σ2
i
2
R T
t
wi(t)dt+σi
R T
t
wi(t)dWi(t)
.
Taking expectations, we obtain
Ẽ
h
e−r(T−t)
G(T)|F(t)
i
= Ẽ

G(t)e−r(T−t)
er−
Pn
i=1
σ2
i
2
R T
t
wi(t)dt+σi
R T
t
wi(t)dWi(t)

= G(t)e−
Pn
i=1
σ2
i
2
R T
t
wi(t)dt
Ẽ
h
eσi
R T
t
wi(t)dWi(t)
|F(t)
i
. (34)
Following the process outlined in §A.1 now define the processes
σP (t) =
v
u
u
t
n X
i=1
w2
i (t)σ2
i +
X
i6=j
wi(t)wj(t)σiσjρij
and
ZP (t) =
n X
i=1
Z t
0
wi(t)σi
σP (t)
dWj(u).
where ZP (t) is a Brownian motion. Equation (34) can now be written as
Ẽ
h
e−r(T−t)
G(T)|F(t)
i
= G(t)e−
Pn
i=1
σ2
i
2
R T
t
wi(t)dt+
R T
t
σ2
P (t)
2 dt
= G(t)e
Pn
i=1
σ2
i
2
R T
t
[w2
i (t)−wi(t)]dt+1
2
P
i6=j σiσjρij
R T
t
wi(t)wj(t)dt
,
as desired.
A.7 Proof of Proposition 4
We seek a solution for w(x,t) that satisfies
G(0)e
R t
0
w∗
(x,s)dlog(x)
= g(x,t)
with initial condition g(Sα(0)) = G(0). This is equivalent to
Z t
0
w∗
(x,s)dlog(x) = log
g(x,t)
G(0)
,
which is solved by
w∗
(x,t) =
dlog(g(x,t))
dlog(x)
=
xgx(x,t)
g(x,t)
.
17A.8 Proof of Corollary 4.1
The proof is identical to that of Proposition 4, except that we replace x by z(x) and w(x,t) by w(z(x)).
B References
[1] DeFi pulse: The DeFi leaderboard. https://defipulse.com.
[2] Uniswap info. https://uniswap.info/home.
[3] An analysis of the stability characteristics of Celo, 2019.
[4] Futureswap: 20x leverage on Ethereum, Apr 2020. Available at
https://medium.com/futureswap/futureswap-20x-leverage-on-ethereum-f27a2a9ed59a.
[5] Why AMM is crucial to decentralized perpetual contracts, Apr 2020. Available at
https://medium.com/@montecarlodex/
why-amm-is-crucial-to-decentralized-perpetual-contracts-70e3159d270d.
[6] Adams, H. Uniswap whitepaper. Tech. rep., 2018.
[7] Analytics, D. Dune analytics decentralized exchange dashboard, 2020. Available at https://
explore.duneanalytics.com/public/dashboards/c87JEtVi2GlyIZHQOR02NsfyJV48eaKEQSiKplJ7.
[8] Angeris, G., Chiang, R., Chitra, T., Kao, H.-T., and Noyes, C. An analysis of Uniswap
markets. Preprint, 2019. Available at https://arxiv.org/abs/1911.03380.
[9] Angeris, G., and Chitra, T. Improved price oracles: Constant function market makers. Preprint,
2020. Available at https://arxiv.org/abs/2003.10001.
[10] Bertrand, P., and Prigent, J.-L. Portfolio insurance strategies: OBPI versus CPPI, Dec 2001.
Available at https://ssrn.com/abstract=299688.
[11] Black, F., and Scholes, M. The pricing of options and corporate liabilities. Journal of Political
Economy 81, 3 (1973), 637–654.
[12] Carr, P., and Madan, D. Towards a theory of volatility trading. In Option Pricing, Interest Rates,
and Risk Management, E. Jouini, J. Cvitanic, and M. Musiella, Eds. Cambridge University Press,
1998, pp. 417–427.
[13] Clark, J. The replicating portfolio of a constant product market, Mar 2020. Available at
https://ssrn.com/abstract=3550601.
[14] Delmonti, A. USD++ V2—the stablecoin basket. Tech. rep., PieDAO, May 2020. Available at
https://forum.piedao.org/t/usd-v2-the-stablecoin-basket/116.
[15] Di Maggio, M. Survey of automated market making algorithms, Jul 2019. Available at https:
//medium.com/terra-money/survey-of-automated-market-making-algorithms-951f91ce727a.
[16] Egorov, M. StableSwap—efficient mechanism for stablecoin liquidity. Tech. rep., Feb 2019.
[17] Gervais, A., Livshits, B., Qin, K., and Zhou, L. Attacking the DeFi ecosystem with flash loans
for fun and profit. Preprint, 2020. Available at https://arxiv.org/abs/2003.03810.
[18] Hanson, R. Combinatorial information market design. Information Systems Frontiers 5, 1 (Jan
2003), 107–119.
[19] Hayes, G., and Leshner, R. Compound: The money market protocol. Tech. rep., Feb 2019.
18[20] Lambur, H., Lu, A., and Cai, R. UMA data verification mechanism: Adding economic guarantees
to blockchain oracles. Tech. rep., Risk Labs, Inc., Jul 2019. Available at
https://github.com/UMAprotocol/whitepaper/blob/master/UMA-DVM-oracle-whitepaper.pdf.
[21] Leibowitz, M. Balancer dashboard, 2020. Available at https://explore.duneanalytics.com/
public/dashboards/nuO3UDqwY8TwfCtI5A0GCzt0coDoXeBr5bL28hKT.
[22] LG, J. The Uniswap Market is live on Aave Protocol, May 2020. Available at
https://medium.com/aave/the-uniswap-market-is-live-on-aave-protocol-12b5a4cc5e2.
[23] Martinelli, F. Interest-bearing stablecoin pools without impermanent loss, Oct 2019. Available at
https://medium.com/balancer-protocol/
zero-impermanent-loss-stablecoin-pool-with-lending-interests-a3da6d8bb782.
[24] Martinelli, F. 80/20 Balancer pools, Mar 2020. Available at
https://medium.com/balancer-protocol/80-20-balancer-pools-ad7fed816c8d.
[25] Martinelli, F., and Mushegian, N. Balancer: A non-custodial portfolio manager, liquidity
provider, and price sensor, Sep 2019. Available at https://balancer.finance/whitepaper.
[26] McDonald, M. Building liquidity into token distribution, Mar 2020. Available at https://medium.
com/balancer-protocol/building-liquidity-into-token-distribution-a49d4286e0d4.
[27] McKeon, R., and Svetina, M. Protecting against loss: Protective put strategies versus stop-loss
strategies. The Journal of Investing 26, 3 (2017), 65–76.
[28] Mkaouar, F., and Prigent, J.-L. Constant proportion portfolio insurance under tolerance and
transaction costs. Working Papers 2014-303, Department of Research, IPAG Business School, 2014.
[29] Shreve, S. E. Stochastic Calculus for Finance II: Continuous-Time Models. Springer, 2004.
[30] Witte, J. H. Volatility harvesting: Extracting return from randomness. Preprint, 2015. Available at
https://arxiv.org/abs/1508.05241.
19