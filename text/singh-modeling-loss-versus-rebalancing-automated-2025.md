---
sha256: 72951a682ce5e6471ebbae2c35f7d45f3faabee9f73cbfa707a765becc85b90a
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 57548
---
Modeling Loss-Versus-Rebalancing in Automated Market Makers
via Continuous-Installment Options
Srisht Fateh Singh
University of Toronto, Canada
srishtfateh.singh@mail.utoronto.ca
Reina Ke Xin Li
University of Toronto, Canada
reinakx.li@mail.utoronto.ca
Samuel Gaskin
University of Toronto, Canada
samuel.gaskin@nbc.ca
Yuntao Wu
University of Toronto, Canada
winstonyt.wu@mail.utoronto.ca
Jeffrey Klinck
University of Toronto, Canada
jeffrey.klinck@mail.utoronto.ca
Panagiotis Michalopoulos
University of Toronto, Canada
p.michalopoulos@mail.utoronto.ca
Zissis Poulos
York University, Canada
zpoulos@yorku.ca
Andreas Veneris
University of Toronto, Canada
veneris@eecg.toronto.edu
August 6, 2025
Abstract
This paper mathematically models a constant-function automated market maker (CFAMM) po-
sition as a portfolio of exotic options, known as perpetual American continuous-installment (CI)
options. This model replicates an AMM position’s delta at each point in time over an infinite time
horizon, thus taking into account the perpetual nature and optionality to withdraw of liquidity
provision. This framework yields two key theoretical results: (a) It proves that the AMM’s adverse-
selection cost, loss-versus-rebalancing (LVR), is analytically identical to the continuous funding fees
(the time value decay or theta) earned by the at-the-money CI option embedded in the replicating
portfolio. (b) A special case of this model derives an AMM liquidity position’s delta profile and
boundaries that suffer approximately constant LVR, up to a bounded residual error, over an ar-
bitrarily long forward window. Finally, the paper describes how the constant volatility parameter
required by the perpetual option can be calibrated from the term structure of implied volatilities
and estimates the errors for both implied volatility calibration and LVR residual error. Thus, this
work provides a practical framework enabling liquidity providers to choose an AMM liquidity profile
and price boundaries for an arbitrarily long, forward-looking time window where they can expect
an approximately constant, price-independent LVR. The results establish a rigorous option-theoretic
interpretation of AMMs and their LVR, and provide actionable guidance for liquidity providers in
estimating future adverse-selection costs and optimizing position parameters.
## 1 Introduction
The success of blockchains supporting smart contract such as Ethereum [4], Solana [17], etc., has led
to the rise of Decentralized Finance (DeFi) which offers alternatives to traditional financial services
by removing central trusted intermediaries and replacing them with public, verifiable, and immutable
computer programs. One of the pivotal components of the DeFi infrastructure stack is automated
market makers, or AMMs, allowing the exchange of one token for another at prices decided by an
underlying algorithm. In recent years, AMMs have seen a rapid adoption reflected in financial metrics
such as total value locked (above $21B) and yearly transaction volumes (above $2T), as well as by their
composability [8, 13]. Today, tens of thousands of tokens are listed and hundreds of applications are
built on top of them [10].
The key participants in an AMM are traders and agents known as liquidity providers, or LPs. Traders
exchange one token for another, where the token pair generally consists of a risky asset with volatile
1
arXiv:2508.02971v1 [q-fin.MF] 5 Aug 2025value, and a stable asset or numéraire.1
On the other hand, LPs serve as counterparties to traders (sellers
to buyers and buyers to sellers) by depositing both tokens upfront to the exchange. As a result of each
trade, LPs receive the less favourable of the two tokens. To hedge against the adverse selection faced
by AMMs, LPs can continuously rebalance an off-chain replicating portfolio by accumulating the risky
token as its price rises and selling it when the price falls. However, this hedge is not perfect when the
AMM is not the primary venue for price discovery because the pool’s quoted price tends to lag behind
the prevailing price on a primary venue such as a centralized exchange.
Under such a setting, even proactive LPs who rebalance in response to price changes are exposed
to a systematic cost. Since AMM quotes lag those on primary markets, arbitrageurs can act faster
than LPs and restore the pool price to the external market level. This generates a small but persistent
transfer of value from LPs to arbitrageurs, and when aggregated over multiple price updates, this cost
becomes significant. This cost is referred to as loss-versus-rebalancing (LVR) [16]. The rate at which
LVR accumulates depends on the steepness of the AMM curve and the volatility of the underlying token;
both amplify the arbitrage gap and thus accelerate LVR.
Despite such costs, LPs are incentivized to participate through the earning of trading fees that are
proportional to the value of each trade and paid by the trader. Therefore, LPs considering whether to
provide liquidity on an AMM pool must calculate their expected payoff by estimating and comparing
their position’s LVR with the anticipated trading fees in some predetermined forward time window.
Recent work [16] have analyzed and quantified expressions for instantaneous LVR and retrospectively
tested with historic market data. However, there is limited work that provides estimation methods for
future LVR.
This work estimates the LVR for an LP that decides to provide liquidity for an arbitrarily long
period and can exit at any point. It does so by mathematically modeling liquidity provision on a general
class of AMMs, known as constant function AMMs (CFAMMs), as selling a continuum of perpetual
American put options across continuous strikes. Perpetual American options are financial derivatives
that give their holder the right to buy (known as a call) or sell (known as a put) an underlying asset
at an agreed-upon price (strike) with no expiration. Unlike traditional vanilla options, this work uses
exotic options in its model, known as continuous installment (CI) options, in which the holder must pay a
stream of constant installment rate, referred to as funding fees, to keep their position alive. This funding
fee is analogous to the time value decay of traditional fixed-term options. The paper uses perpetual
American CI options because, unlike fixed-term vanilla options, the pricing function of these options
does not change over time (assuming other market parameters are constant). Moreover, despite their
exotic nature, CI options have been well-studied in the past, and this work builds on results from the
existing literature [5]. This approach yields two key theoretical results.
Funding Fees = LVR: In the limit where the installment rate tends to infinity (analogous to extremely
short-dated fixed-term options), a CI put option has the classic hockey-stick payoff function: it pays the
difference between the strike and the spot price when the underlying’s spot price is below the strike
price, and zero otherwise. Therefore, in this limit, a continuous distribution of CI puts exists that
delta-replicates an arbitrary LP position’s payoff at each point in time. Moreover, the installment rate
earned on this distribution of puts (which, at a given point in time, is earned by the option whose strike
equals the spot price at that time) reproduces the expression for the instantaneous LVR. Therefore,
theoretically, an LP can hold such an options portfolio to stay delta-neutral—the cost due to time value
decay of holding this portfolio, i.e., funding fees, is the LVR.
Since the above model is theoretical, as a continuum of options cannot be reproduced in practice, the
paper subsequently quantifies the approximation error when a discrete portfolio of options with discrete
strike prices is used to replicate the payoff of a liquidity position.
Constant Future LVR: The second result analyzes the converse scenario where a liquidity position’s
payoff replicates the valuation of a single perpetual American CI option. This produces a unique liquidity
profile with almost constant instantaneous LVR rate over a forward time window. Moreover, this rate is
approximately equal to the funding fee of the replicated CI option. As a result, this yields guidance to
LPs, under the model assumptions, on:
• Choosing the price boundaries and shape of liquidity provision that incurs predictable, flat, price-
path independent future LVR.
• Estimating the forward adverse-selection cost for a planned holding period.
1Although some token pairs consist of two stable assets, this work focuses primarily on pairs of one risky and one stable
asset.
2• Understanding the relationship between the optimal holding period and the width of the liquidity
position.
• Selecting an appropriate pool based on its expected future trading fee income.
The paper is organised as follows. Section 2 explains notations and the necessary background, Sec-
tion 3 discusses prior literature and related works, Section 4 motivates the option-based interpretation,
Section 5 provides the options decomposition, Section 6 proves the funding-fee–LVR identities, Section 7
measures the approximation error on delta when the continuous strip is replaced by finitely many strikes,
and Section 8 presents the volatility calibration and design rules for LPs. Finally, Section 9 concludes
with directions for future research.
## 2 Background
In this section, we provide the necessary notation, terminology and background concepts used in the
remainder of the paper.
## 2.1 Notation
We consider two tokens: token 0 representing a risky asset (e.g. BTC, ETH) and token 1 representing
a stable/safe asset (e.g. USDC). Let St denote the spot price of token 0 in units of token 1 at time
t that follows a geometric Brownian motion (GBM) on a filtered probability space

Ω,F,{Ft}t≥0 ,Q

satisfying the standard assumptions for GBMs (where Q is a risk-neutral probability measure), so that
dSt
St
= r dt + σ dBQ
t , (1)
with constant annual risk-free rate r and volatility σ > 0. {BQ
t }t≥0 is a Wiener process. As usual,
we assume that AMMs constitute secondary markets and the price St is governed by primary markets
such as centralized exchanges. In the subsequent sections, we omit the subscript t and use S and St
interchangeably for convenience.
## 2.2 Constant-Function Automated Market Makers (CFAMMs)
A constant-function automated market maker (CFAMM) maintains token reserves (x,y), deposited by
LPs, such that each trade transforms the reserves to (x′
,y′
) and the reserves before and after the trade
satisfy an invariant function F(x,y) = F(x′
,y′
) = k. In a constant-product AMM (CPAMM), such as
Uniswap v2 [1], the invariant takes the form of F(x,y) =
√
xy. As a result, the marginal exchange
price, assuming no arbitrage, takes the form: S = −∂y
∂x = y
x. This is shown in Figure 1a. Therefore, the
expression for token reserves are x = k √
S
, and y = k
√
S.
A CPAMM with concentrated liquidity (as in Uniswap v3 [2]) uses an invariant parameter k within
a price band [a,b]. The token reserves of LPs in this band consist of only token 0 when the price S ≥ b,
only token 1 when S ≤ a, and for prices S ∈ (a,b), the reserves are:
x = k
√
b −
√
S
√
Sb
, y = k
√
S −
√
a

. (2)
Therefore, the reserve value (denominated in token 1) is
V (S) = k
√
S −
√
a

+ kS
√
b −
√
S
√
Sb
, S ∈ [a,b]. (3)
The liquidity position’s sensitivity to price, known as it’s delta, is denoted by X(S), and the sensitivity of
delta to price, known as gamma, is denoted by Γ(S). In practice, delta is a measure of exposure to small
changes in the price of the risky asset, whereas gamma is a measure of exposure to large movements of
the risky asset’s price. These are given by the first and second derivatives of the value function V (S)
with respect to the underlying’s price, respectively, and are expressed as follows:
X(S) := V ′
(S), Γ(S) := V ′′
(S) = X′
(S) ≤ 0 (S ∈ (a,b)). (4)
Figure 1b illustrates the behavior of delta and gamma across the liquidity band. As shown, the mag-
nitudes of both delta and gamma decrease monotonically with price, as higher prices correspond to a
greater allocation to the numeraire asset.
310 20 30 40 50 60 70 80 90 100
x(token0reserve)
0.00
0.02
0.04
0.06
0.08
0.10
y (token 1 reserve)
xy=k
Tangent(price)
(a) CPAMM Invariant with k = 1 and Marginal Price
(Tangent at x = 30)
0 50 100 150 200 250
PriceS
0
1
2
3
4
5
6
7
Value / Sensitivities
V(S)
ScaledX(S)
Scaled (S)
(b) V (S), 100X(S), and −5000Γ(S) for concen-
trated liquidity position in price band [50,200], and
k = 1.
Figure 1: Profiling CPAMM invariant and concentrated liquidity position, its delta and gamma.
## 2.2.1 Loss-Versus-Rebalancing (LVR)
A continuously rebalanced, self-financing delta-hedge portfolio that holds X(St) units of token 0 has
value Wt with dWt = X(St)dSt. The difference
LVRt := V (St) − Wt (5)
quantifies the AMM’s adverse-selection loss relative to a hedged trader and is referred to as loss-versus-
rebalancing or LVR. The instantaneous LVR, dLVRt, grows quadratically with the spot price and volatil-
ity, and linearly with the gamma of the liquidity position [16].
dLVRt = 1
2 σ2
S2
t Γ(St) dt = 1
2 σ2
S2
t

X′
(St)

dt. (6)
We will later demonstrate the equivalence between the right-hand side of Eq. (6) and the funding fee
of a perpetual American CI option.
## 2.3 Perpetual American Continuous-Installment Options
A perpetual American continuous-installment put option has no expiration date and requires the holder
to pay a continuous stream of constant funding fee q > rK per year to keep the contract alive. At any
point, the holder may choose to stop paying the fee, at which point they can either exercise the option
or drop the position. The option can be exercised at any time for a payoff of max(K − S,0) [5]. In the
analysis below, we assume the underlying asset (token 0) pays zero dividends.
## 2.3.1 Notation and Ordinary Differential Equation Formulation
Let Pq(S;K) denote the discounted put option value at spot price S, strike K, and funding fee q.
Let Sℓ denote the lower boundary, below which the option value equals its payoff, and let Su denote
the upper boundary, above which the option value is zero, as illustrated in Figure 2a. Under the
risk–neutral dynamics, Pq(S;K) satisfies the inhomogeneous Black-Scholes ordinary differential equation
in the continuation region Sℓ < S < Su:
1
2
σ2
S2 ∂2
Pq
∂S2
+ rS
∂Pq
∂S
− rPq = q, S ∈ (Sℓ,Su). (7)
The left and right boundaries are determined endogenously from the value–matching and delta-matching
conditions
Pq(Sℓ;K) = K − Sℓ,
∂Pq
∂S
(Sℓ;K) = −1,
Pq(Su;K) = 0,
∂Pq
∂S
(Su;K) = 0.
(8)
Solving (7) with the four boundary conditions in (8) yields the closed-form expressions below.
40 50 100 150 200 250 300
UnderlyingpriceS
0
20
40
60
80
100 Value PerpetualCIPutValue
Payoffmax(K S,0)
S
Su
(a) Discounted value of a perpetual CI put option with
lower and upper boundaries.
0 50 100 150 200 250 300 350
UnderlyingpriceS
0
20
40
60
80
100
Value
FeeRate1/yr
FeeRate2/yr
FeeRate4/yr
Payoffmax(K S,0)
(b) Discounted value of a perpetual CI put option with
fee rates 1, 2, 4 per annum.
Figure 2: Profiling of perpetual CI put option with K = 100.0, σ = 0.25, q = 2 (in the first figure) and
r = 0.01 (all parameters are annualized).
## 2.3.2 Closed-form solution
The expression for the option price Pq(S;K) takes the following closed form as derived in [5].
Pq(S;K) = αpS + βpSγp
+
q
r
(9)
The delta of the put option, Xq(S;K) = ∂
∂S Pq(S;K), thus takes the form:
Xq(S;K) = αp + βpγpSγp−1
. (10)
Moreover, the upper and lower boundaries, Su and Sℓ respectively, have the following closed form:
Sℓ =
q
r + σ2/2

g − g1/γp

, (11)
Su =
q
r + σ2/2

g1−1/γp
− 1

. (12)
Here, αp, βp, γp, and g are expressions that depend on parameters r, σ, K, and q and their expressions
are provided in Appendix (A).
The Black–Scholes partial differential equation in (7) contains no derivative with respect to time.
Consequently, the value of a perpetual CI option is time-invariant. This makes it unique from vanilla
finite expiry American or European options, whose pricing has a time-varying component. The analog of
expiration in CI options is the funding rate, where high funding rates make it “behave similar” to short
expiration option and vice versa for small fee rates. This is depicted in Figure 2b, where increasing the
fee rate reduces the price of the CI option closer to its payoff. The lower and upper boundaries, Sℓ and
Su, characterize the holder’s optimal policy. When the spot price first falls below Sℓ, it is optimal to
exercise the option; when it first exceeds Su, it is optimal to drop the option—i.e., to exit the position
with zero payoff. This is because, in both cases, the expected benefit of continued funding is outweighed
by its cost. In either scenario, the holder stops paying the funding fee immediately upon exit. For this
reason, Sℓ and Su are also called optimal exercise and dropping boundaries, respectively. Conversely, the
option seller receives the continuous funding fee only while the spot price remains in the continuation
region Sℓ < S < Su. We will exploit this fact in the sections that follow.
## 3 Related Work
Early work on studying LP positions in CFAMMs focus on mitigating risks associated with impermanent
loss—the loss experienced by a liquidity provider compared to simply holding the asset, so that an LP
can earn trading fees without exposure to this loss. Deng et al. [9] and Fukasawa et al. [12] study static
replication strategies for impermanent loss in finite-time CFAMM positions using European options and
variance swaps, respectively. Lipton et al. [14] further studies model-based dynamic replication. However,
it can be argued that a comparison against a buy-and-hold strategy is insufficient as it does not account
for adverse selection, where informed traders extract value from passive LPs over time.
5Another approach to quantifying LP loss is the concept of LVR, which captures the loss incurred
by a liquidity provider compared to continuously rebalancing their portfolio at market prices, due to
adverse selection. LVR was formalized by Millionis et al. [16]. Their work offers closed-form expressions
for instantaneous LVR in a CFAMM and provides empirical validation using historical market data.
However, they focus on instantaneous and historical LVR and do not address forward-looking or long-
term LVR estimation. Meanwhile, our approach provides a framework that captures forward-looking
LVR by delta-replication with options portfolios.
Maire and Wunsch [15] make a case for the hedging of the LP position value instead of the im-
permanent loss. They study the problem of market-neutral liquidity provision by constructing a static
replication portfolio that matches the AMM position’s dollar value over time, effectively achieving a con-
stant value position for the finite lifetime of the position. The replicating portfolio’s margin requirement
is then itself hedged by shorting a perpetual or dated futures contract to offset changes in the margin
value, enabling a market-neutral LP strategy that generates interest from LP trading fees and futures
funding fees. Meanwhile, Clark [6, 7] investigates the replicating portfolio of the payoff of a constant
product AMM position and shows how an LP position’s terminal value can be fully statically replicated
using a portfolio of European options. The approach focuses on fixed, finite time horizons and seeks to
hedge only the terminal value of the liquidity position. On the other hand, our approach neither relies
on dynamic hedging, nor assumes finite time horizons. Instead, we model the LP’s position over an
indefinite time horizon using a portfolio of perpetual American CI put options, providing a theoretical
framework that statically captures the path-dependency of forward-looking LVR.
## 4 Work Motivation
The value profile of a concentrated liquidity position in a finite price band, as shown in Figure 1b, closely
resembles that of a portfolio consisting of cash (a constant payoff) and short put options (the negative of
the payoff shown in Figure 2a): flat on one wing, linear on the other, and smoothly curved in between.
Figure 3a makes this visual similarity precise by comparing the value of a CPAMM position with k = 1
and band (80,125) to a portfolio comprising cash and a one-month European put, with strike at the
geometric mean of the price boundaries. The put is valued using the standard Black–Scholes model [3].
Despite the superficial similarity, key differences emerge. As shown in Figure 3b, the two profiles
diverge meaningfully. More critically, the European option’s value is inherently time-variant: even a
single day’s passage erodes its time value (theta), while the CPAMM’s value remains time-stationary.
This contrast is illustrated in Figure 3c, where the solid line represents the option value as a function
of the time-to-maturity. In addition, the CPAMM offers a flexible, perpetual holding period, whereas
fixed-term options require periodic rolling—selling expiring contracts and buying new ones—to replicate
a liquidity position.
These challenges raise a natural question: Can one construct a static portfolio that tracks a perpetual
AMM band without daily rebalancing? The answer is affirmative, provided we replace European options
with a class of American continuous-installment options. This is because the ongoing constant funding
fee, q dt, charged by an active CI option offsets the time decay found in European options. In the limit
of infinite maturity (the perpetual CI variant), the mark-to-market value of a CI put or call becomes
time-invariant, producing a flat line as shown by the dashed line in Figure 3c.
This observation enables a decomposition of a CFAMM band into a perpetual strip of CI puts that
both matches the pool’s delta and offers stationarity. Beyond its conceptual appeal, this decomposition
yields two practical insights:
1. The instantaneous funding fee of the active CI option equals the LP’s loss-versus-rebalancing cost.
Since a CI option is perfectly hedgeable with a Black-Scholes type rebalancing porfolio [5] and both
the CPAMM and the CI option strip have the same delta, they share the same rebalancing portfolio,
and hence the LVR is precisely the difference between the two instruments, i.e. instantaneous
funding fee.
2. If the CFAMM’s delta and price boundaries are calibrated to match those of a single CI put,
then the LVR over a future time window becomes nearly constant and equal to the funding fee q.
Notably, this construction relies on implied volatility, rather than instantaneous volatility, meaning
it can be formulated using observed market data.
The following section formalizes the CI decomposition, proving the equivalence between funding fees and
LVR.
660 80 100 120 140
Price
1.2
1.4
1.6
1.8
2.0
2.2
Value (token 1 )
CFAMMvalue(token1)
BScall,T=1month
(a) Value of a CPAMM band [80,125] versus a short one-
month Black–Scholes put plus cash.
60 80 100 120 140
PriceP
0.010
0.005
0.000
0.005
0.010
Difference
(b) Difference between CPAMM value and short put
plus cash.
0.0 0.2 0.4 0.6 0.8 1.0
Timetomaturity(months)
0
1
2
3
4
5
Option value (token )
BSputvalue
PerpetualCIPutvalue
(c) Time value decay of a European put versus the con-
stant value of a perpetual CI call, whose funding fee off-
sets theta exactly.
Figure 3: Comparison between CPAMM liquidity value and a portfolio of short put (K=100, r=5%,
σ=50%) plus cash.
## 5 Modeling a CFAMM Position with CI Options
## 5.1 Overview
In this section, we construct a portfolio whose delta (change in option price w.r.t. change in spot price) is
the same as the delta of a CFAMM X(S). This portfolio consists of a distribution of perpetual American
CI put options in the limit q → ∞ across a continuum of strike prices. As the funding rate tends to
infinity, the exercise and dropping boundaries of each option collapse to the strike price, and the option’s
valuation converges to max(K−S,0). Consequently, the option’s delta converges to a step function. This
property enables the construction of a portfolio that replicates the delta of an arbitrary (but smooth)
CFAMM payoff function.
## 5.2 Portfolio Construction
We begin with the following lemma:
Lemma 1. In the limit q → ∞, both the lower and upper boundary of a CI put converge to the strike
K, and option’s delta Xq(S;K) becomes a step function −1{S<K}.
This lemma encapsulates the relationship between the funding rate and the option’s “effective” time
to expiration. As the funding rate increases, the option behaves increasingly like a zero-time-to-expiry
option, with its delta approaching a discontinuous step as q → ∞.
Next, we specify the weight distribution of the options portfolio that delta-replicates a CFAMM value
function V (S).
7Theorem 2. Let V : R>0 → R be a twice continuously differentiable function. Assume that V ′
∈
L1
(R>0), V ′
has bounded variation on R>0 and that lim
S→∞
V ′
(S) = 0. Define the weight w(K) := V ′′
(K)
and, for each q < ∞,
Πq(S) :=
Z ∞
0
w(K)Pq(S;K)dK,
and
Π(S) := lim
q→∞
Πq(S).
Then the portfolio Π(S) − V (S) is delta-neutral.
Thus, a perpetual CFAMM position that can be closed by its owner at any time can be perfectly
modeled using a distribution of CI puts with very large funding rates2
. In practice, a continuous dis-
tribution is infeasible, and funding rates are finite. Therefore, one may replicate the delta profile using
a discrete set of puts with different strikes. However, discretization and finite funding rates introduce
non-negligible delta-replication error, dependent on inter-strike spacing and funding rate. We quantify
this approximation error numerically for a constant product AMM position in Section 7.
An additional corollary of the above result is the relationship between the instantaneous LVR of a
liquidity position and the funding fees of options with strikes around the spot price (also referred to as
activated strikes) in the replicating portfolio. This relationship is analyzed in the following section.
## 6 Establishing LVR as Funding Fees
The portfolio Π delta-replicates a given CFAMM liquidity position. However, unlike the AMM position,
the short options portfolio pays a continuous funding fee to the seller—arising from the active CI puts
with strike around the spot price. We show that these funding fees, absent in the AMM, are precisely
equal to the LP’s LVR.
To compute this running funding fee, we first establish the following lemma:
Lemma 3. As q → ∞, the product q (Su(q;K) − Sℓ(q;K)) converges to a finite limit:
lim
q→∞
q · Su(q;K) − Sℓ(q;K)

=
σ2
K2
2
.
Next, we express Π as the limit of a discrete sum of options. In the following lemma, we construct
such a discretization and show that, as q → ∞, this portfolio converges pointwise to that of Π. We also
compute the limiting funding fee contribution from the option whose holding region contains the spot
price.
Lemma 4. Fix q > 0 and an interval [a,b] ⊂ R>0. Define a sequence of strikes K1 < K2 < ··· < KN(q)
recursively by: 
  
  
Sℓ(q;K1) = a,
Sℓ(q;Ki+1) = Su(q;Ki), i = 1,...,N(q) − 1,
Su(q;KN(q)) = b.
For each i, define the weight
wi :=
Z Su(q;Ki)
Sℓ(q;Ki)
w(K)dK = X Su(q;Ki)

− X Sℓ(q;Ki)

,
so that
N(q)
X
i=1
wi =
Z b
a
w(K)dK = −1.
2Πq(St) has the same payoff as described above at all times. Therefore, the holder must continuously reissue options
that are exercised or dropped.
8Let Kj be the activated strike such that Sℓ(q;Kj) ≤ St ≤ Su(q;Kj). Then, as q → ∞, the discrete
portfolio
e Πq :=
N(q)
X
i=1
wi Pq(·;Ki)
converges pointwise to the continuous payoff Π(S). Moreover, the weighted funding fees at strike Kj
satisfies
lim
q→∞
wjq =
σ2
S2
2
X′
(S).
Lemma 4 constructs a portfolio of CI puts with discrete strikes and finite funding rates, with weights
chosen such that, in the limit q → ∞, the portfolio converges to the CFAMM-replicating portfolio
defined in Theorem (2). The index j denotes the unique option that remains active (i.e., in the holding
region), while all other options are either exercised or dropped. Therefore, the funding fee received by
the portfolio owner is wjq.
As q becomes large, Lemmas 3 and 4 together imply that this funding fee converges to the instanta-
neous LVR of the corresponding CFAMM position. This leads to the following result:
Theorem 5 (Funding fee = LVR). Let dLVRt denote the instantaneous change in the LVR of a CFAMM
position, and let dFeet denote the instantaneous funding income of its delta-replicating CI option portfolio
Π. Then,
dFeet = dLVRt and Fee|T
0 = LVR|T
0 (∀T > 0).
Therefore, the LVR of a liquidity position is precisely the CI funding premium of its delta-replicating
options portfolio. Another way to look at this is that a CI option can be perfectly delta-hedged using a
continuously rebalanced Black–Scholes-type portfolio of risky and stable assets [5]. As the funding rate q
increases, the delta of this rebalancing portfolio converges to that of a CFAMM position. However, unlike
the CI option, a CFAMM position does not compensate the liquidity provider via a funding stream. The
discrepancy between the CFAMM position and its hedge is therefore exactly the foregone CI funding.
This equality relies solely on closed-form expressions and the principle of self-financing, without invoking
any additional modeling assumptions.
One advantage of this option-theoretic interpretation is that CI fee rates, as implied by the options
market, provide both real-time and forward-looking estimates of LVR, enabling informed range manage-
ment. Moreover, this framework permits the construction of liquidity profiles with nearly price-path-
independent LVR. These features are demonstrated in the sections that follow. A further implication
is that a market for CI options allows for static-weight delta-hedging of CFAMM positions—under the
assumption of constant implied volatility—eliminating the need for frequent rebalancing, unlike with
conventional American or European options.
6.1 CFAMM Position Replicating a Unit CI Option
Consider a concentrated–liquidity CFAMM band whose delta, at every price level, matches the delta of
a single perpetual American CI put option. Specifically, choose the liquidity bounds a < b such that
X(S) = V ′
(S) ≡ Xq S;K∗

(S ∈ [a,b]), (13)
a = Sl(q,K∗), (14)
b = Su(q,K∗). (15)
for some strike K∗ and finite fee rate q.
Theorem 6. The instantaneous rate of change of the LVR of the above CFAMM position is approximately
equal to the funding fees of the unit put option, up to a bounded approximation error. That is, there
exists a residual function ϵ(t) with |ϵ(t)| ≤ rK∗, such that
dLVRt = q dt + ϵ(t)dt,
Thus, the AMM liquidity position with the above delta profile suffers an almost flat, price-path-
independent, volatility-independent LVR. Note that because Xq(S;K∗) depends on the volatility param-
eter σ, as shown in Eq (10), the calibrated boundaries a,b—and thus the entire delta curve X(S)—remain
implicitly volatility-dependent. The residual error term, ϵ(·), is bounded in magnitude by a constant
9and its relative magnitude is reported and discussed in Section 8. The above liquidity profile is useful
for LPs who want to estimate forward LVR and compare it with the expected future trading fees. Lastly,
constructing such an AMM profile requires estimates of future volatility. This can be approximated using
a term structure of implied volatility gathered from the fixed-term options market. Section 8 discusses
this in detail and estimates the approximation error arising from the calibration between fixed-term and
perpetual options’ volatilities.
## 7 Error Analysis of Discrete CI-Option Replication
In this section we quantify the approximation error that arises when the continuous–strike decomposition
of a concentrated CFAMM is replaced by a discrete strip of perpetual American CI put options with
finite q.
## 7.1 Sources of error
We isolate two drivers of error: (i) The installment rate q (large but finite), and (ii) the inter-strike
spacing ∆K of the discrete strip. For a given pair (q,∆K), we construct a strip of discrete options and
measure the absolute difference between the target delta (of the CFAMM) and the strip’s delta. This is
done over the active price band S ∈ [a,b] and its maximum and root-mean-square values are plotted.
## 7.2 Experimental methodology
We chose a concentrated liquidity AMM as our target CFAMM. Thus, the analytical delta X(S) =
L(1/
√
S − 1/
√
b) for uniform liquidity on a price band [a,b]. We choose a = 80, and b = 125, and L
chosen so that X(a) = 1, X(b) = 0. We discretize the replication weight such that on each strike interval
[Ki,Ki+1] we set
wi =
Z Ki+1
Ki
X′
(K)dK = X(Ki+1) − X(Ki), (16)
ensuring that the discrete weights sum to the continuous integral. For each strike, we compute the short
CI put delta, clipped to {−1,0} outside its continuation band. Let Xstrip(S;q,∆K) =
P
i wi Xq(S;Ki)
be the delta of the strip at S. Define the error
ε(Sj;q,∆K) = X(Sj) − Xstrip(Sj;q,∆K)
evaluated on grid {Sj}N
j=1 where N =2000. We consider two error metrics:
• Maximum absolute error: maxj ε(Sj;q,∆K).
• Root-mean-square error (RMSE):
q
N−1
P
j ε(Sj;q,∆K)2.
We evaluate a parameter sweep (q,∆K) ∈ {8,16,32,64,125,250,500,1000,2000,4000}×{0.25,0.5,1.0,2.0,4.0}.
## 7.3 Results
Figure 4a shows the logarithm of maximum absolute error versus q for five strike spacings. Similarly,
Figure 4b displays the RMSE versus q for the same strike spacings. Both errors increase strictly with
strike spacing for a given q across all installment rates. On the other hand, for a given strike spacing,
both errors generally decrease with q with some exceptions. For large strike spacing, ∆K = {1,2,4},
the RMSE error increases with q for large values, q ≥ 128. Lastly, Figure 4c plots a representative delta
curve (q=250, ∆K=2) against the CPAMM target delta.
## 7.4 Discussion
Both errors are below 10−3
and shrink as expected: a larger q steepens each put’s delta, while a finer
∆K better resolves the continuous weight. The trade-off between the capital cost of a large q and the
operational cost of a finer strike mesh can be balanced according to the LP’s precision requirements.
100 500 1000 1500 2000 2500 3000 3500 4000
Installmentrateq
11
10
9
8
7
Log max-error K=0.250
K=0.500
K=1.000
K=2.000
K=4.000
(a) Log max error
0 500 1000 1500 2000 2500 3000 3500 4000
Installmentrateq
12
11
10
9
8
Log RMSE
K=0.250
K=0.500
K=1.000
K=2.000
K=4.000
(b) Log RMSE error
80 85 90 95 100 105 110 115 120
PriceP
0.0000
0.0005
0.0010
0.0015
0.0020
Delta
CPAMM
CI putstrip
(c) CFAMM target delta (solid) versus discrete CI-put strip
approximation (dashed) for q = 250, ∆K = 2.
Figure 4: Log-Max absolute and RMSE delta-replication error versus installment rate q under different
parameter settings.
## 8 Volatility Calibration for Perpetual CI Put Options
Perpetual CI put pricing requires a constant volatility parameter σ. Market quotes instead supply a term
structure b σ(τ) of implied volatility with time to expiration τ. In the following, we derive the effective
implied volatility σeff(q) for a perpetual American CI option with funding fee q using the market-implied
term structure of at-the-money options.
## 8.1 Effective time horizon
For a CI put with rate q, the continuation band is (Sℓ(q),Su(q)).
It stays alive as long as the underlying spot price St remains within the continuation band. Otherwise,
when St = Sl, the option is dropped, or when St = Su, it is exercised by the holder.
Define the first-exit time
τ(q) := inf

t > 0 : St / ∈ (Sℓ(q),Su(q)) ,
i.e. the random horizon at which the CI position terminates. In probabilistic terms, E[τ(q)] = τ̄(q) is
the mean first-exit time of a GBM between two absorbing boundaries.
Theorem 7. The closed-form solution of τ̄(q) is
τ̄(q) =



1
σ2 ln

S0
Sl(q)

ln

Su(q)
S0

if a = 0
1
a
h
ln

Sl(q)
S0

+ ln

Sl(q)
Su(q)

Sκ
0 −Sl(q)κ
Sl(q)κ−Su(q)κ
i
if a ̸= 0
(17)
where a = r − σ2
2 and κ = −2a
σ2 .
Figure 5 plots the distribution of the first-exit time, τ for a CI put with r = 2%, σ = 67%, S0 = K =
100, and q = 5. Here, τ̄ = 1.6 months,
p
Var(τ) = 0.11, and E[|τ − τ̄|] = 0.08.
110.0 0.2 0.4 0.6 0.8 1.0 1.2
ExitTime
0
1
2
3
4
5
6
7
Density
Numericalmean
Analyticalmean
Figure 5: Distribution of first-exit time τ for r = 2%, σ = 67%, K = 100, q = 5.
0.41 0.42 0.43 0.44 0.45
2
eff
0
50
100
150
200
250
Density
w( )/
[ 2
eff]
Figure 6: Distribution of σ2
for r = 2%, σ = 61%, K = 100, q = 5 using ETH ATM IVs.
## 8.2 Practical estimation from ATM IVs
Given At-The-Money (ATM) implied volatilities σ̂(T) for fixed terms T1 < ... < Tn and a desired
effective time horizon τ ∈ [Ti,Ti+1), the squared constant volatility implied by the perpetual contract
can be approximated by linearly interpolating the total variances (Tσ̂2
(T)) derived by the market implied
volatilities:
σ2
effτ ≈ σ̃2
effτ = σ̂2
(Ti)Ti +
σ̂2
(Ti+1)Ti+1 − σ̂2
(Ti)Ti
Ti+1 − Ti
(τ − Ti) ≡ w(τ) (18)
The effective squared volatility can be estimated ex ante for a desired first-exit time distribution:
E[σ̃2
eff] = E

w(τ)
τ

≈
w(τ̄)
τ̄
(19)
When τ̄ is a function of σ2
eff, the problem becomes a fixed-point equation. Specifically, Eq. (19) must be
solved for σ2
eff as a function of itself: σ2
eff =
w(τ̄(σ2
eff))
τ̄(σ2
eff)
.
1201-05 01-12 01-19 01-26 02-02 02-09 02-16 02-23 03-02
Timestamp
0%
10%
20%
30%
40%
50%
%
MAD
RMSE
w( )/
Figure 7: MAD and RMSE for r = 5%, K = 100, q = 40, where σ2
eff is derived by fixed point methods.
IV data is from ETH ATM IVs for Jan-Feb 2024.
Theorem 8. The estimate σ̃2
eff ≈ w(τ̄)
τ̄ yields root mean squared error and mean absolute deviation
RMSE ≤ M
p
Var(τ) (20)
MAD ≤ ME[|τ − τ̄|] (21)
where M = maxi supτ∈[Ti,Ti+1)
d
dτ

w(τ)
τ

.
Hence, when the total variance derived from market-implied volatilities (which are approximately
linear in log-Moneyness log(K/S)) has a small slope, the approximation error is small. Figure 6 plots
the distribution of σ̃2
eff, its mean, and the approximation w(τ̄)
τ̄ (for the same CI put as in Figure 5)
using ETH ATM 7-day, 30-day, 90-day, and 180-day IVs. Figure 7 plots the RMSE and MAD (as a
percentage of w(τ̄)
τ̄ ) for the approximation σ̃2
eff ≈ w(τ̄)
τ̄ for the period of Jan 2024-Feb 2024.
## 8.3 Interpretation for Liquidity Providers
The volatility calibration framework enables liquidity providers (LPs) to estimate future loss-versus-
rebalancing (LVR) of a concentrated AMM position using observable option market information. By
associating the funding fee q of a perpetual CI put with its expected lifetime τ̄(q), and mapping this
to market-implied volatilities, LPs can extract an estimate for the effective squared volatility σ̃2
eff that
governs the dynamics of the position and its underlying asset.
As the funding rate q increases, the continuation band [Sℓ(q),Su(q)] narrows, leading to shorter
expected lifetimes τ(q) for the CI put. Conversely, smaller q implies wider bands and longer-lived
options. Since market-implied volatilities are typically flatter at long durations, we can observe that:
• Short durations (high q) correspond to low maturity implied volatilities, where the IV curve is
more curved and error-prone. More fine-grained market data is required here for better estimates.
• Long durations (low q) correspond to long-dated IVs, where the volatility curve is typically
flatter. The estimate σ̃2
eff = w(τ)
τ is then less sensitive to the exact value of τ, so M is small and
the approximation of the mean is more robust to variation in τ. Long durations also tend to have
a tighter concentration of realised σ̃2
eff around its mean for the same reason, meaning the mean is
a good ex ante estimate.
If a liquidity band is chosen to replicate the delta of a single perpetual CI put—using the squared
volatility estimate—then the LP incurs a predictable LVR almost equal to the funding rate q. This
transforms an otherwise stochastic adverse-selection cost into a predictable fixed cost per unit time,
13Table 1: Funding fee q, resulting CFAMM band (Sl,Su), and residual bound rK, for r = 0.05, for desired
τ̄ under varying σeff exposures.
% of K % of q
τ̄ σeff q (token1/yr) Sl(q) Su(q) Width rK
1 d 60% 284% 97% 103% 6% 2%
1 d 80% 380% 96% 104% 8% 1%
1 d 100% 475% 95% 105% 10% 1%
1 wk 60% 106% 92% 109% 17% 5%
1 wk 80% 142% 90% 112% 22% 4%
1 wk 100% 178% 87% 115% 28% 3%
2 wk 60% 74% 89% 113% 24% 7%
2 wk 80% 99% 86% 118% 32% 5%
2 wk 100% 125% 83% 123% 40% 4%
1 mo 60% 49% 85% 120% 35% 10%
1 mo 80% 66% 80% 128% 47% 8%
1 mo 100% 84% 76% 136% 60% 6%
2 mo 60% 34% 79% 130% 51% 15%
2 mo 80% 46% 74% 142% 69% 11%
2 mo 100% 58% 68% 157% 88% 9%
1.00% 1.50% 2.00% 2.50% 3.00% 3.50% 4.00% 4.50% 5.00%
r(risk-freerate)
0
2
4
6
8
10
12
14
rK (%)
TimeHorizon( )
=1d
=1wk
=2wk
=1mo
=2mo
Volatility( )
=60%
=80%
=100%
Figure 8: Residual upper bound rK as a percentage of q for various time horizons and σeff exposures.
simplifying the LP’s decision-making. For instance, given a desired expected time-horizon, an LP can
estimate the effective term volatility, which in turn informs the liquidity band selection. Table 1 shows
the different band widths corresponding to expected time horizons and effective term volatilities and
Figure 8 shows the LVR − q residual term upper bound. Conversely, given a liquidity band, an LP can
estimate the position’s expected effective time horizon using numerical fixed point methods. Combined
with the results of Section 6, the effective term volatility estimation provides a practical framework for
LPs to choose bands that realize a desired holding period τ(q) and predictable LVR, or to estimate
expected forward-looking LVR for a desired liquidity band.
149 Conclusion
This work introduces a novel decomposition of a concentrated CFAMM position into a continuum of
perpetual American continuous-installment (CI) put options, offering the first closed-form equivalence
between the funding mechanics of perpetual American CI options and the loss-versus-rebalancing cost
faced by concentrated AMM liquidity providers, providing as option-theoretic interpretation of LVR.
By exploiting the limiting behavior of CI option valuations as the installment rate grows large, the
paper constructs delta-replicating portfolios that match the AMM exposure exactly. The analysis shows
that the funding income from this replicating portfolio, absent in the AMM, is analytically equal to the
LVR cost borne by the LP in the AMM. This time-invariant correspondence permits a forward-looking
estimation of LVR and provides actionable design rules for selecting position width and shape.
Beyond theoretical insight, the framework yields practical tools for LPs. The discrete error analysis
confirms that a small collection of finite-q CI puts suffices to replicate AMM delta within tight error
bounds, making implementation of the replicating portfolio feasible for LPs wishing to immunize against
LVR. Crucially, the analysis also shows that if a liquidity band is chosen to replicate the delta of a single
perpetual CI put, the LP incurs a predictable LVR equal approximately to the funding rate q. This
converts a stochastic adverse-selection cost into a predictable fixed cost per unit time, simplifying LP
decision-making when it comes to position shape and width: using market-implied volatility curves, LPs
can calibrate the position shape, width, and implied volatility to a desired expected holding period and
LVR, or conversely, estimate a position’s effective time horizon and LVR given a liquidity band.
This framework opens several avenues for further research. While the present analysis focuses only
on liquidity bands centered around the current price (ATM), LPs may, in practice, deploy liquidity
asymmetrically about the spot price to expose their positions to greater or lesser volatility. A resulting
mismatch of spot and the replicated strike requires extended analysis to capture the entire volatility
surface, as opposed to only considering the ATM volatility curve. Alternatively, if on-chain markets
for CI options were developed, they could serve as direct hedging instruments and sources of IV data.
Furthermore, the Black-Scholes model assumes the underlying asset experiences a constant volatility,
which is not supported by market data. In reality, volatilities may be time-dependent or even stochastic.
Models like the Heston model or Hull-White model, which extend upon Black-Scholes, may be applied
here for analysis under dynamic volatility surfaces and to assess the model’s sensitivity to deviations
from constant volatility assumptions. Finally, the model assumes continuous-time trading and perfect
liquidity. Future work will relax these assumptions to quantify the impact of transaction costs, slippage,
and gas fees on the CI funding fee-LVR equivalence.
References
[1] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap V2
Core. https://uniswap.org/whitepaper-v2.pdf, 2020. Accessed: 2025-05-25.
[2] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap v3
Core Whitepaper. https://uniswap.org/whitepaper-v3.pdf, 2021. Accessed: 2025-05-25.
[3] Fischer Black and Myron Scholes. The pricing of options and corporate liabilities. Journal of political
economy, 81(3):637–654, 1973.
[4] Vitalik Buterin. Ethereum white paper. GitHub repository, 1(22-23):5–7, 2013.
[5] Pierangelo Ciurlia and Camilla Caperdoni. A note on the pricing of perpetual continuous-installment
options. Mathematical Methods in Economics and Finance, 4(1):11–26, 2009.
[6] Joseph Clark. The replicating portfolio of a constant product market. Available at SSRN, 2020.
doi:10.2139/ssrn.3550601.
[7] Joseph Clark. The replicating portfolio of a constant product market with bounded liquidity. Avail-
able at SSRN, 2021. doi:10.2139/ssrn.3898384.
[8] DeFiLlama. DEX protocols. https://defillama.com/protocols/dexs. Accessed: 2025-05-26.
[9] Jun Deng, Hua Zong, and Yun Wang. Static replication of impermanent loss for concentrated
liquidity provision in decentralised markets. Operations Research Letters, 51(3):206–211, 2023. doi:
10.1016/j.orl.2023.03.002.
15[10] Dune Analytics. Total number of liquidity pools. https://dune.com/queries/3243692/5427065.
Accessed: 2025-05-25.
[11] Gerald B Folland. Real analysis: modern techniques and their applications. John Wiley & Sons,
1999.
[12] Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Weighted variance swaps hedge against
impermanent loss. Quantitative Finance, 23:901–911, 2023. doi:10.1080/14697688.2023.2202708.
[13] hagaetc. DEX metrics - dune analytics dashboard. https://dune.com/hagaetc/dex-metrics.
Accessed: 2025-05-26.
[14] Alex Lipton, Vladimir Lucic, and Artur Sepp. Unified approach for hedging impermanent loss of
liquidity provision. 2024. arXiv:2407.05146.
[15] Basile Maire and Marcus Wunsch. Market neutral liquidity provision. Ledger, 9:73–88, Nov. 2024.
doi:10.5195/ledger.2024.389.
[16] Jason Milionis, Ciamac C Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated market
making and loss-versus-rebalancing. 2024. arXiv:2208.06046.
[17] Anatoly Yakovenko. Solana: A new architecture for a high performance blockchain v0. 8.13, 2018.
[18] Bernt Øksendal. Stochastic Differential Equations: An Introduction with Applications, chapter 7,
pages 109–132. Springer Verlag, 5th edition, 2000. doi:10.1007/978-3-662-03185-8.
A Closed-Form of Perpetual American CI Put Option
Below, we provide closed-form expressions for the perpetual American CI put option.
Define
γp := −
2r
σ2
, (22)
g := 1 +
rK
q
. (23)
Then, the option price is
Pq(S;K) = αpS + βpSγp
+
q
r
where the constants αp and βp are given by
αp = g1−1/γp
− 1
−1
, (24)
βp = −
1
γp

q
r+σ2/2
1−γp
αγp
p . (25)
Let Xq(S;K) = ∂
∂S Pq(S;K) be the delta of put value, its expression is given by
Xq(S;K) = αp + βpγpSγp−1
.
Lastly, the lower and upper boundaries, Sℓ and Su respectively, have the following closed-form:
Sℓ =
q
r + σ2/2

g − g1/γp

,
Su =
q
r + σ2/2

g1−1/γp
− 1

.
16B Proofs of Main Theorems
Proof of Lemma 1. Boundary collapse. Let Sℓ(q) and Su(q) be the exercise and abandonment bound-
aries in (11) and (12). We will prove that
lim
q→∞
Sℓ(q) = lim
q→∞
Su(q) = K.
Define ε := rK/q, so g = 1 + ε and ε ↓ 0 as q ↑ ∞. Consider the second-order expansion (1 + ε)a
=
1 + aε + 1
2a(a − 1)ε2
+ O(ε3
). Applying it to the two exponents in (11) and (12) yields
Sℓ(q) =
qε
r + σ2/2

1 − 1
γp

+ O q−1

,
Su(q) =
qε
r + σ2/2

1 − 1
γp

+ O q−1

.
Because qε = rK and 1 − 1
γp
= 1 + σ2
/(2r), both leading terms equal K. Therefore,
lim
q→∞
Sℓ(q) = lim
q→∞
K + O q−1

= K,
lim
q→∞
Su(q) = lim
q→∞
K + O q−1

= K.
Step-delta limit. The smooth–fit conditions (continuous first order derivative) on the boundaries of the
holding region of the option valuation curve from Section 2.3.1 give Xq(Sℓ;K) = −1 and Xq(Su;K) = 0.
Because Xq is monotone increasing in S between the two boundaries and the interval Su(q) − Sℓ(q)
collapses, we have the pointwise limit
X∞(S;K) := lim
q→∞
Xq(S;K) = −1{S<K}. (26)
Thus, as the funding fees of a continuous-installment put becomes large, it transforms into a unit-step-
delta contract.
Proof of Theorem 2. For each K, the map S 7→ Pq(S;K) is continuously differentiable. Moreover, for
fixed q, there exists a constant cq > 0 such that ∂SPq(S;K) ≤ cq(1+K)−2
|w(K)|. Hence, the integrand
is point-wise dominated by an L1
–function of K. Leibniz’s rule [11] yields
∂SΠq(S) =
Z ∞
0
w(K)Xq(S;K)dK,
where Xq := ∂SPq is the CI–put delta. For every K, we have
lim
q→∞
Xq(S;K) = X∞(S;K)
= −1{S<K}
from Lemma 1. Let {qn} be a sequence such that qn → ∞. |Xqn
(S;K)| ≤ 1 for all n, S and K, and
Xqn
(S;K) → X∞(S;K) pointwise in K, so dominated convergence theorem [11] applies:
∂SΠ(S) = lim
n→∞
Z ∞
0
w(K)Xqn(S;K)dK
=
Z ∞
0
w(K)X∞(S;K)dK
= −
Z ∞
S
w(K)dK
= V ′
(S) − V ′
(∞)
= V ′
(S).
Therefore, Π(S) − V (S) is delta-neutral.
17Proof of Lemma 3. Using closed forms for a CI put boundaries from Appendix A, g := 1 + ε, ε = rK/q
and γp = −2r/σ2
:
Sℓ(q) =
q
r + σ2/2

g − g1/γp

,
Su(q) =
q
r + σ2/2

g1−1/γp
− 1

.
Setting α := 1/γp = −σ2
/(2r) and expanding to second order:
gα
= 1 + αε + 1
2α(α − 1)ε2
+ O(ε3
),
g1−α
= 1 + (1 − α)ε − 1
2(1 − α)αε2
+ O(ε3
).
Substituting the above into the closed forms of Sℓ and Su cancels the first-order terms and the second-order
coefficient becomes α(α − 1). Therefore, one obtains
Su(q) − Sℓ(q) =
α(α − 1)r2
K2
(r + σ2/2)q
+ O q−2

. (27)
Hence,
lim
q→∞
q Su(q) − Sℓ(q)

= lim
q→∞
α(α − 1)r2
K2
(r + σ2/2)
+ O q−1

=
σ2
K2
2
Proof of Lemma 4. Point-wise convergence. Both e Πq and Π vanish for all S ≥ b. Moreover, the
CI–put delta satisfies 0 ≤ |Xq(S;K)| ≤ 1. Consequently |∂S
e Πq(S)| =
P
i wi Xq(S;Ki) ≤
P
i |wi| = 1
for every q and S. Let i⋆
= i⋆
(S,q) be the (unique) index with S ∈ [Sℓ(q;Ki⋆ ),Su(q;Ki⋆ )]. By
Lemma (1), Xq(S;Ki⋆ ) → −1{S<Ki⋆ }, while Xq(S;Ki) → 0 for i ̸= i⋆
. Dominated convergence therefore
gives
lim
q→∞
∂S
e Πq(S) = −
Z b
a
w(K)1{S<K} dK = X(S).
For any S ≤ b
e Πq(S) = e Πq(b) −
Z b
S
∂S
e Πq(u)du.
Because e Πq(b) = 0 for all q and the integrands converge point-wise while being uniformly bounded by 1,
dominated convergence implies e Πq(S) → Π(S).
Limit of wjq. From the statement of the Lemma,
wj = X Su(q;Kj)

− X Sℓ(q;Kj)

Therefore,
lim
q→∞
wjq = lim
q→∞
q

X Su(q;Kj)

− X Sℓ(q;Kj)

= lim
q→∞
q(Su(q;Kj) − Sℓ(q;Kj))
X Su(q;Kj)

− X Sℓ(q;Kj)

(Su(q;Kj) − Sℓ(q;Kj))
= lim
q→∞
q(Su(q;Kj) − Sℓ(q;Kj)) lim
q→∞
X Su(q;Kj)

− X Sℓ(q;Kj)

(Su(q;Kj) − Sℓ(q;Kj))
= lim
q→∞
q(Su(q;Kj) − Sℓ(q;Kj))X′
(Kj)
=
σ2
S2
t
2
X′
(St)
18Proof of Theorem 5. From Lemma 4, we can approximate the continuous portfolio by a discrete portfolio
of CI puts. For a specific funding fee q, at each time t, there is only one active option j with weight wj,
price Pq(St,Kj). The total funding fee accured over [t,t + dt] is:
dFeeq
t = wjqdt
Again from Lemma 4, we have lim
q→∞
wjq =
σ2
S2
t
2
X′
(St). This implies that
lim
q→∞
dFeeq
t = lim
q→∞
wjqdt =
σ2
S2
t
2
X′
(St)dt
This exactly matches Eq. (6). Hence,
dFeet = dLVRt
Integrating over t ∈ [0,T], we get:
Feet|T
0 =
Z T
0
dFeet =
Z T
0
dLVRt = LVR|T
0
Proof of Theorem 6. Equation (7) gives
1
2
σ2
S2 ∂2
Pq
∂S2
+ rS
∂Pq
∂S
− rPq = q, S ∈ (Sℓ,Su).
and
dLVRt =
1
2
σ2
S2 ∂2
Pq
∂S2
dt
= qdt − r(S
∂Pq
∂S
− Pq)dt
Therefore, the residual term ϵ(t) = −r(S
∂Pq
∂S − Pq). Note that we use S instead of St for brevity. ϵ(·) is
a function of t.
Bounding |ϵ(t)|. In the region S ∈ (Sℓ,Su),
∂ϵ(t)
∂S
= −rS
∂2
Pq
∂S2
Since
∂2
Pq
∂S2 is always non-negative,
∂ϵ(t)
∂S
= −rS
∂2
Pq
∂S2
≤ 0
Therefore, ϵ(t) is monotonically decreasing with S. Moreover, when evaluated at S = Sℓ,
ϵ(t) = −r((−1 · Sℓ) − (K∗ − Sℓ))
= rK∗.
and when S = Su,
ϵ(t) = 0.
Hence, |ϵ(t)| ≤ rK∗.
C Effective Time Horizon τ̄(q)
Proof of Theorem 7. Given a continuation band,
Sℓ(q) < St < Su(q), t ≥ 0, (28)
and an initial spot price S0, we formulate the problem as a GBM first-exit problem.
19Under the risk-neutral measure Q the spot follows a geometric Brownian motion (GBM)
dSt = rSt dt + σSt dBQ
t , S0 ∈ Sℓ(q),Su(q)

, (29)
where {BQ
t }t≥0 is a Wiener process. Setting Yt := logSt converts (29) into an arithmetic Brownian
motion
dYt = adt + σ dBQ
t , a := r − 1
2σ2
, (30)
absorbed at the logarithmic levels
L := logSℓ(q), U := logSu(q).
The time at which the CI position terminates is the first-exit time
τ(q) := inf

t > 0 : Yt / ∈ L,U

= inf

t > 0 : St / ∈ Sℓ(q),Su(q)

. (31)
C.1 Boundary Value ODE Problem
Let m(y) ≡ Ey[τ(q)] ≡ τ̄(q) be the expectation of the time to absorption conditional on Y0 = y ∈ L,U

.
By Dynkin’s formula [18],
Ey[m(Yτ)] = m(y) + Ey
Z τ
0
Am(Ys)ds

At the exit time, τ, the process has left (L,U), so m(Yτ) = 0, and
Ey[τ] = m(y) = −Ey
Z τ
0
Am(Ys)ds

We can write τ as the integral of 1 over [0,τ] so that
Ey
Z τ
0
1ds

= −Ey
Z τ
0
Am(Ys)ds

which implies that Am(y) = −1.
The generator A of the time-homogeneous Brownian motion Yt also satisfies Af(y) = af′
(y)+σ2
2 f′′
(y),
yielding the boundary-value problem:
σ2
2
m′′
(y) + am′
(y) = −1, m L

= m U

= 0. (32)
C.2 Closed-form solution for critical drift r = 1
2
σ2
When r = 1
2σ2
, a = 0 in (30), and the ODE becomes:
m′′
(y) = −
2
σ2
(33)
The solution to (33) is of the form m(y) = − 1
σ2 y2
+ C1y + C2. Applying the boundary conditions,
m(L) = m(U) = 0, we have the system of equations:
(
1
σ2 L2
= C1L + C2
1
σ2 U2
= C1U + C2
Solving this yields
C1 =
1
σ2
(L + U)
C2 = −
LU
σ2
Finally, plugging in L = lnSl(q), U = lnSu(q), and y = lnS0, the solution to (33) is
τ̄(q) =
1
σ2
ln

S0
Sl(q)

ln

Su(q)
S0

(34)
20C.3 Closed-form solution for r ̸= 1
2
σ2
In this case, let κ = −2a
σ2 . The general solution to the homogeneous ODE corresponding to (32) is
mh(y) =
C1
κ
eκy
+ C2
for some constants C1 and C2.
Let mp(y) = −y
a +C3, for some constant C3, so that m′′
p(y) = 0 and m′
p(y) = −1
a. mp is a particular
solution to the ODE. Then, the general solution to the non-homogeneous ODE (32) is
m(y) = mh(y) + mp(y) =
C1
κ
eκy
+ C2 −
y
a
+ C3 (35)
To simplify notation, let A := C1
κ and B := C2+C3. Applying the boundary conditions, m(L) = m(U) =
0, we have the system of equations:
(
AeκL
+ B = L
a
AeκU
+ B = U
a
(36)
Solving this yields
A =
1
a
L − U
eκL − eκU
(37)
B =
1
a

L −
L − U
eκL − eκU
eκL

(38)
Finally, plugging in L = lnSl(q), U = lnSu(q), and y = lnS0, the solution to (32) is
τ̄(q) =
1
a

ln

Sl(q)
S0

+ ln

Sl(q)
Su(q)

Sκ
0 − Sl(q)κ
Sl(q)κ − Su(q)κ

(39)
D Volatility Estimation Error Bounds
Proof of Theorem 8. The root mean squared error of the estimate σ̃2
eff ≈ w(τ̄)
τ̄ is
RMSE =
v
u
u
tE
"
σ̃2
eff −
w(τ̄)
τ̄
2
#
Let f(τ) = σ̃2
eff = w(τ)
τ , which is differentiable almost everywhere, with
f′
(τ) =
miτ − w(τ)
τ2
mi ≡
σ̂2
(Ti+1)Ti+1 − σ̂2
(Ti)Ti
Ti+1 − Ti
f(0) = m0
f is Lipschitz continuous, so let M = maxi supτ∈[Ti,Ti+1) |f′
(τ)|. Then, |f(τ) − f(τ̄)| ≤ M|τ − τ̄| and
RMSE =
p
E[(f(τ) − f(τ̄))2] ≤
p
E[M2(τ − τ̄)2] =
p
M2 Var(τ) = M
p
Var(τ) (40)
Similarly, the mean absolute deviation is
MAD = E[|f(τ) − f(τ̃)|] ≤ ME[|τ − τ̄|] (41)
21