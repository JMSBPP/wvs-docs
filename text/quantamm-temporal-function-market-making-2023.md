---
sha256: 5499cfce41110446688db8f643717ec1995f99c383664f998f6d9761997523bb
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 70255
---
Temporal-Function Market Making Litepaper
QuantAMM Team
Version 0.1.0
## 17 November 2023
Abstract
First generation AMMs instantiate an extremely limited and fixed strategy: a simple holding
strategy very often provides superior returns compared to depositing into a CFMM. Recent analysis
has expanded on the issue of loss vs rebalancing, and LPs have moved to new solutions of ranged
liquidity and limit order books. The fixed-weight strategy is a defining reason for the difficulties of
AMMs, and altering the strategies applied is the simplest and most effective mechanism to make
AMMs profitable.
We introduce Temporal-Function Market Marking (TFMM), where the trading function
of an AMM pool, and thus its desired deployment of value, changes with time. Differing from
pools that allow external or stochastic updates to weight vectors, TFMMs enables dynamic AMM
pools that run continuous, fully-on-chain quantitative strategies.
We give a short background on the fundamentals of AMMs and then outline, both theoretically
and in simulation (expanded to real-world scenarios in the QuantAMM paper), how TFMMs can
outperform HODL as well as earlier-generation AMMs.
We then expand on how a dynamic re-weighting of an AMM pool can be implemented inexpens-
ively on-chain. Further, a novel approach to hierarchical composability of AMM pools (composite
pools) allows automated risk management on top of multiple strategies, without adding additional
trade routing complexity.
## 1 Introduction
In recent years, automated market makers (AMMs) and decentralised exchanges (DEXs) have grown to
become integral parts of decentralised Finance (DeFi) infrastructure. These systems notionally enable
liquidity providers (LPs), the depositors, to earn a return on their capital, their liquidity, by enabling
traders to exchange one token for another against the deposited capital. For providing liquidity, LPs
receive ‘liquidity tokens’ representing their share of the capital deposited in the pool. Trading fees go
to LPs in proportion to their LP token holdings. Some of these systems allow liquidity provision over
a pair of tokens, others a basket.
There is a massive and well known problem: AMM pools generally lose value for their LPs, even after
fees are taken into account. This is known as Impermanent Loss. LVR [Milionis et al., 2022] is a
separate (but related Nezlobin [2022]) metric for measuring AMM performance, where fixed-weight
AMM pool’s rebalancing is compared to rebalancing via a CEX, and again AMM pools perform poorly.
Even recent advances in AMM technology suffer these problems.
TFMMs attack this problem by going back to first principles and recognising that a fixed-allocation
strategy is just one choice of opinionated strategy. Once this is realised, the fundamental question
can be asked if other, non-fixed-allocation, strategies are cursed to also suffer from impermanent loss
–we discover both in theory and in practice that this is not the case. We extend the basic notion of
constant-function market makers (CFMMs) by developing a decentralised method of dynamically re-
weighting the held reserves using oracle signals and functions thereof, increasing the available returns
on deposited capital. This is done by continuously changing the portfolio vector inside the constant
function of the pool, where the new portfolio vectors are a (chosen) function of (chosen) oracles. In
fact, TFMM pool re-balancing is often substantially cheaper than, in an LVR-like comparison, running
a ‘mirrored’ strategy that is re-balanced by trading with a CEX.
12 Temporal-Function Market Makers
Our proposal is to enable w, the portfolio vector, to update continuously on-chain using low frequency,
periodic on-chain oracle calls, for example using the price of the tokens in the pool: the allocation
of assets in the pool is thus responsive to market information. This is the key to how TFMMs can
potentially circumvent impermanent loss. We will write w(t) to indicate this dependency on time, and
the time-varying equation that defines a TFMM pool block-to-block, the trading function, becomes:
N Y
i=1
R
wi(t)
i = k(t), where
N X
i=1
wi(t) = 1, and ∀i 0 < wi(t) < 1. (1)
A trade still has to preserve (or increase) the value of k(t) that exists at the time of that trade. Weight
changes when the pool is in equilibrium—quoting the market price—create an arbitrage opportunity.
This is desirable, we need to incentivise the pool’s reserves to be re-balanced to the new weights.
We call the resulting systems Temporal Function Market Makers. While some CFMMs allow external
and stochastic updates to a pool’s w vector, TFMMs have continuously changing ws, given by an
open-horizon update rule, that never reach some particular final weight. This has cumulative impact
on almost all aspects of AMM functionality and implementation sufficient to warrant a distinction
from CFMMs.1
## 2.1 Superior performance of TFMM Pools
Figure 1: Synthetic example of TFMM performance.
(a) Synthetic price data. (b) Weight changes over time (c) Total USD pool value
Fig 1a Simulation Data: Four token sinusoidal price trajectories that are offset and used every hour
to update the pool’s weights.
Fig 1b Simulation analysis: a TFMM pool running a mean-reversion update rule2
actively changes
its quoted weights over time compared to a Balancer pool. While HODL does not use CFMM pri-
cing and trading, we also show HODL proportional USD market value weights that change directly
corresponding to price fluctuations.
Fig 1c Simulation results: TFMM returns over time generate superior pool value compared to the
Loss-versus-Rebalancing (LVR) Milionis et al. [2022] benchmark’s returns over time. This benchmark
is, roughly speaking, from rebalancing the same portfolio but via a CEX. See 4.1 and the full TFMM
paper for more detail. We also plot HODL and a fixed-CFMM pool for comparison.
While this is a simulation based on idealised synthetic data, the relationship between
the data and the strategy is very important. See the QuantAMM protocol papers for
test results of multiple update rules against historic and Monte Carlo data–results show-
ing considerable alpha over HODL for most market conditions. All simulations include
advanced components such as fee modelling and “no-arb region” modelling.
1More broadly, TFMMs are also different to Replicating Market Makers (RMMs) in that TFMMs naturally implement
quantitative strategies for the reallocation of value over a basket of many assets over time, whereas RMMs aim to mimic
the payoffs of (often finite-duration) financial instruments (eg options under a Black-Scholes pricing model).
2The update rules is within the family given by Eq (13), see QuantAMM litepaper for more detail.
22.2 TFMM innovations beyond current AMMs
Update Rules: Strategies for Pools The first question is: what algorithm should determine
pools’ weight changes over time? Traditional finance can provide an encyclopedia of possible strategies,
which we call update rules. While some protocols attempt TradFi strategies by introducing off-chain
dependencies and calculations, novel mathematical approaches had to be developed to make TradFi
strategies feasible to be run continuously and completely on-chain. As a result, TFMM pools can even
run successfully on L1 with relatively small TVL.
Changes in quoted weights motivate the pool’s reserves to be passively re-balanced via an arbitrage
opportunity. While the strategy might update the weight trajectories every hour or every day using
oracles, the weights visible to traders and to the market changes every block solely using stored
variables. New analysis on multi-block attack vectors, Appendix C, informs explicit tuning of the block-
by-block weight change protections based on the level of protection the pool creator feels comfortable
with. To the best of our knowledge such protections are neither explored or tuned in any other protocol.
Composite pools: Enabling diverse portfolios and re-balancing strategies Novel architec-
ture in TFMMs enables LPs to avoid split management of multiple pools by constructing “pools of
pools”: the liquidity placed in a composite pool is distributed across its underlying pools, enabling an
LP to benefit from exposure to these underlying pools.
While some protocols enable virtual or phantom pools, these are for the benefit of the trader and not
the reallocation of capital between pools. Composite pools allow for liquidity to be shifted between
base pools that are intended to perform better in different market conditions—for example between a
‘bull market’ subpool and a ‘bear market’ subpool.
AMM “execution management” techniques When requiring large weight changes, such a move
could produce large slippage if attempted naively. While simple execution management techniques can
perform well, some novel techniques (computationally cheap enough to be run on-chain) are explored
to increase efficiencies even further. This makes the inter-block weight updates somewhat reminiscent
of trades in Time-weighted average market makers (TWAMMs) [White et al., 2021]. However unlike
traders on TWAMMs, TFMMs rebalance by being a ‘price maker’ rather than a ‘price taker’.
Advanced pool management and tooling Given easy parallels to TradFi strategies and pre-
dictability, TFMMs allow automated advanced tooling to lower sophistication barriers. An example
of tooling that can be provided is auto-generated key investor information documents (KIID). With
regards to alpha leak, for instance if a new update rule creator does not want to expose all aspects
of that rule on-chain, ZK-wrapped strategies conform with both the spirit of continuous, on-chain
TFMMs (without manual or voted updates) while keeping the exact fixed strategy mechanics private.
TFMM interoperability with current AMM ecosystems While TFMM introduces automated
and effective inter-block functionality to deal with current CFMM shortfalls, certain aspects are kept
consistent with CFMMs. This means that no drastically new infrastructure is needed to integrate
TFMMs with current DEX ecosystems of aggregation, leverage and arbitrage. Multi-token trades are
allowed on TFMMs in the same manner as other geometric mean market makers, as well as standard
quoting of some amount Λk of the kth
token in exchange ∆j for a jth
token:
Λk = Rk

1 −
1

1 + γ
∆j
Rj

wj(t)/wk(t)

 (2)
Exactly like pools on prior AMMs, TFMM pools issue liquidity tokens to LPs in proportion to the
value they place in a pool, whether this is in a single or multi asset deposit. At time t, the total supply
of liquidity tokens τP(t) for a pool P is therefore given by τP = s(w(t))k(t), where s is a scaling factor
that determines the total size of the supply and depends on the current weights. Within a block, s is
constant.
33 How TFMMs beat Impermanent Loss when CFMMs cannot
Non-Dynamic AMM pools must suffer Impermanent Loss In previous AMMs liquidity pro-
viders suffer from impermanent (a.k.a. divergence) loss: any change in the ratios of the market prices
of tokens in a basket leads to that pool holding less value than when the pool was capitalised. When
the market prices change from some initial value p(t0) to a later value p(t′
); arbitrageurs then trade
with the pool until, once again, the quoted prices of the pool match the new market prices. Performing
this analysis, the pool’s reserves become
R(t′
) = R(t0)
p(t0)
p(t′)
N Y
i=1

pi(t′
)
pi(t0)
wi
, (3)
where multiplication and division between vectors is performed elementwise (this is the case for the
rest of this section). The value in a pool, in the market-price numéraire, at any time t is V (t) =
p(t) · R(t) =
PN
i pi(t)Ri(t). From this we can derive the equation that describes Impermanent Loss.
∆V , the proportional change in the value of the pool compared to holding, is
∆V =
V (t′
)
V (t0)
Vhold(t′)
Vhold(t0)
− 1 =
QN
k=1

pk(t′
)
pk(t0)
wk
Pn
i=1 wi
pi(t′)
pi(t0)
− 1. (4)
This function range is ≤ 0, due to the Weighted AM–GM inequality; in other words, for any p(t′
) ̸=
bp(t0) (where b is any scalar > 0), ∆V < 0 so liquidity providers have lost value compared to holding.
For full derivation, see the full TFMM paper.
TFMM pools do not have to suffer Impermanent Loss How do the reserves, and thus value,
of a TFMM pool change when the weights change? We consider constant market prices with changing
weights. Arbitrageurs will trade with the pool until the quoted prices of the pool again match the
current market prices. Initial weights are w(t0), and a block later, with time t′
= t0 +δt, we have new
weights w(t′
) (and p(t′
) = p(t0)). The new reserves and value after the weight-change are
R∆w(t′
) = R(t0)
w(t′
)
w(t0)
N Y
i=1

wi(t0)
wi(t′)
wi(t′
)
, (5)
V∆w(t′
) =
N X
i=1
pi(t′
)Ri(t′
) =
N X
i=1
pi(t0)Ri(t′
) =
N X
i=1
pi(t0)Ri(t0)
wi(t′
)
wi(t0)
N Y
k=1

wk(t0)
wk(t′)
wk(t′
)
. (6)
Of course when a TFMM pool is running, market prices will change, so to model how reserves change
we have to apply both Eq (3) and Eq (5). Within a single block the market prices change, and then
between blocks the weights change, so we get
RTFMM(t′
) = R(t0)
p(t0)
p(t′)
w(t′
)
w(t0)
N Y
i=1

pi(t′
)
pi(t0)
wi(t0) N Y
k=1

wk(t0)
wk(t′)
wk(t′
)
. (7)
For full derivation, see the full TFMM paper. From the path-dependency of Eq (5) (when applied
repeatedly, terms involving intermediate values of variables do not cancel out), this ‘combined’ update
is also path-dependent and now depends on both the trajectory of prices and that of weights. The
corresponding change in value for one combined update is
VTFMM(t′
) =
N X
i=1
pi(t′
)RTFMM,i(t′
) =
N X
i=1
pi(t0)Ri(t0)
pi(t0)
pi(t′)
wi(t′
)
wi(t0)
N Y
k=1

pk(t′
)
pk(t0)
wk(t0) N Y
ℓ=1

wℓ(t0)
wℓ(t′)
wℓ(t′
)
.
(8)
We cannot write a simple equivalent to Eq (4) for these combined TFMM updates—the value of the
TFMM pool at some later time is not guaranteed to be less than holding one’s initial capital, as it
is for non-dynamic AMM pools. TFMM pools do not have to suffer from Impermanent Loss (but of
course capital is at risk, update rules can be ill-tuned or have market behaviour change such that they
no longer operate as expected). The value of a TFMM pool depends intimately on the sequence of
weights and prices over time, and as such its value can increase above simply holding one’s capital.
44 Rebalancing efficiency and comparisons
Weight Interpolation: Execution Management on TFMMs Weight changes when the pool
is in equilibrium, i.e. quoting the market price, create an arbitrage opportunity. It is desirable for
LPs for the arbitrage opportunity to be smaller rather than larger to reduce slippage. This is roughly
analogous to ‘execution management’ in TradFi, where a trader wishes for their transactions to follow
best execution policies that reduce cost. A simple way to reduce the arbitrage opportunity from a
weight update is to spread out the weight update out over a period in time.
General Case We can want to compare R1-step
, the reserves in the pool when we have directly
updated the weights from w(t0) → w(t0) + ∆w, a one step process, to R2-step
, the reserves when we
have done this weight update via a two step process: w(t0) → w̃ → w(t0) + ∆w, where ∀i, w̃i ∈
[wi(t0),wi(t0) + ∆wi] (as well as 0 < w̃i < 1 and
PN
i=1 w̃i = 1). We show in Appendix A.3.1 that
going through any of this broad family of intermediate values of the weight vector w gives lower arb
cost.
Example: Linear Interpolation We can show this result for the particular case of linear interpol-
ation via Eq (5). Here the two step process is: w(t0) → w(t0)+ 1
2∆w → w(t0)+∆w. This technique
is used for liquidity bootstrap pools and stochastic changing CFMMs. We find that
R2-step
= R1-step
N Y
j=1

1 +
∆wj
2wj(t0)
∆wj
2
. (9)
This is by no means the only mechanism to reduce arbitrage slippage for dynamic inter-block weights
and the full TFMM paper describes other more efficient mechanisms that can add further efficiency.3
The cumulative slippage cost over time means that this can be a significant result.
## 4.1 Reserve and value changes for small weight changes
Given the above, of particular importance is how TFMM pools’ reserves and value change when the
weight changes are vanishingly small. From this we can show how TFMM pools rebalance in the limit
of small weight changes, including with fees present. The value of the pool post rebalance is
V γ-fees
δw (t′
) ≳ V (t0) 1 + (1 − γ)
N X
i=1
(Iδwi>0δwi)
!
. (10)
These results show how a TFMM pool rebalancing can lead, with swap fees present and under the
assumptions made, to an increase in value of the pool.
Comparing to CEX rebalancing We can derive the equivalent results for a more vanilla rebalan-
cing procedure: using a CEX. The CEX-rebalancing counterpart to Eq (10) is
V γ-fees
trad > V (t0) 1 − (1 − γtrad)
N X
i=1
(Iδwi>0δwi)
!
. (11)
Here the pool is a taker, while in the TFMM-rebalancing results above the pool is a maker. This
means here the pool is worth slightly less than V (t0) after the rebalance, rather than slightly more.
See Appendix A for further details and derivations on weight interpolation, linear interpolation and
comparison of TFMM rebalancing vs CEX rebalancing.
3And sometimes, it can even be better to not allow a rebalance and instead to temporarily use a HODL strategy for
a period of time.
55 Update Rules
Many classical strategies from TradFi can be implemented using the tools available for TFMM pools, as
well as many new approaches. One of the main issues with implementing known approaches, especially
on L1s, is operational gas cost. In this section we describe advances made to allow construction of
TradFi strategies fully on-chain and runnable on L1s. We then provide an example family of rules that
can be created using such novel building blocks.
On blockchains with cheaper computations, including L2s, more sophisticated update equations become
possible, including calculations involving higher derivatives and special functions.
## 5.1 On-Chain Methods for Gradients, Covariances and Precisions
Knowing, in isolation, that a signal takes a particular value at the present moment is not necessarily
useful for making a decision based on that signal. It is often by knowing how the current signal
compares to previous values that enables us to make use of a signal. This naturally means that in
building update rules we need a gradient operator, to tell us by how much a market signal has changed.
Simple ‘rise-over-run’ approaches do not work well with financial data due to noise.4
Some update rules need access to the variance of an signal or the covariance between signals. For
example, any update rule that wants to use Markovitz/Mean-Variance Portfolio Theory (MVPT) or
related ideas will need them. We can use a set of mathematical methods, very similar to those used
to calculate our method for the gradient of a signal, to calculate these quantities. Note that often
one wants not the covariance (nor precision) of raw prices, but instead the covariance (or precision) of
returns.
As well as giving us useful, usable, results, we want methods that are sufficiently computationally
cheap that it can be done on-chain. Current modelling gives gas costs, running a four token pool
with a strategy based on these methods, of 221k gas units per pool per day. This means the
methods are pivotal to enabling TFMM pools on Ethereum Mainnet. Here we will briefly discuss how
our gradient method can be used. See the full TFMM paper for information about the covariance and
precision methods.
## 5.2 Trend-Following Update Rules
A broad family of update rules are of the form
w(t) = f

w(t − 1),p(t),
∂p(t)
∂t

, (12)
where p(t) is a vector giving the required oracle values, for example the prices of the N tokens in the
pool. How could we chose f? One choice is for the change in weights to be a function of p(t) and its
time-derivative giving us a family of momentum-like (ie, trend-following) strategies,
w(t) = w(t − 1) + g

p(t),
∂p(t)
∂t

. (13)
For update rules to use them in conjunction with our gradient method, simply replace ∂p(t)
∂t with it.
All update rules contain numerical parameters that control their behaviour, and these parameters must
be set. Choosing an uninformed parameter value can lead to negative performance of the pool.
4Financial time series are of course often modelled as stochastic processes, which are not differentiable (you cannot
find a gradient as an infinitesimal rise-over-run calculation).
66 Composite pools
Figure 2: Example LP portfolio struc-
ture without added trade stack complex-
ity. Liquidity depth is also maintained as
the tokens’ balances remain in the base
pools.
A problem with existing AMMs which aspire to manage
LPs’ value for them is that most trades are executed against
pools containing only two or three assets: such small bas-
kets of tokens have downsides as they do not allow for broad
exposure to different tokens. LPs who seek to distribute
their liquidity across a number of assets—that is, LPs who
seek to deposit into pools face typical overhead in main-
taining and running such a portfolio.
The mathematical architecture of TFMM pools enables LPs
to circumvent this dilemma, through composite pools con-
structed by “pooling pools”: the capital placed in a compos-
ite pool is distributed across its underlying pools, enabling
an LP to benefit from the volume in these underlying pools
while covering their assets of interest. This method differs
from current virtual and phantom pools.
This structuring is pivotal to allow the creation of complex
portfolios with multiple layers of capital allocation logic
while never increasing stack complexity.
For example: Different sub-pools can also contain the same
tokens but have different update rules that are highly tuned
to specific market conditions, such as bull runs or bear runs.
Then a composite pool could manage risk by shifting cap-
ital from one pool to the other using an update rule that
applies standard risk management algorithms, allowing for
LP controlled automatic risk management as well as auto-
matic strategy based constituent token re-balancing.
This approach also allows for more tailored sleeves or man-
aged accounts within a broad portfolio, direct participation at any level while, crucially, never increasing
execution management complexity or fragmenting liquidity depth in the base layer pools.
## 7 Multi-block MEV protection
A key consideration for a TFMM pool is whether, through the weightings between tokens changing
over time, their temporal dependence leads to an opportunity for an MEV attack against LPs. This
situation is roughly analogous to a ‘sandwich attack’ on a trade in a vanilla AMM pool. Recall
that the changes in weight happen, in effect, between blocks making weight updates somewhat like
TWAMM trades. This would require multi-block MEV manipulation. The TFMM paper contains
a range of detailed mathematical analysis and simulation tests of novel protections layered on top of
standard AMM protections. See Appendix C for detailed theoretical analysis. This means that TFMM
rebalancing can avoid MEV costs being accrued to LPs as their capital is reallocated in accordance
with their pool’s update rule.
7Technical Appendix for TFMM Litepaper
A Reserve-Update Derivations
A.1 Weights Constant, Prices Change
Here we derive Eq (3), the change in reserves of a pool where weights are fixed but market prices
change. For simplicity we are assuming the no-fees case.
First, recall that to calculate pTFMM
i,j (t), the prices of the ith
token in terms of the jth
, that is, using
the jth
token as the numéraire, simply divide the ith
unscaled price by the jth
,
pTFMM
i,j (t) =
∂
∂Rk(t)

i
∂
∂Rk(t)

j
=
wi(t)/Ri
wj(t)/Rj
. (A.14)
At t0 we have the invariant of the pool
N Y
i=1
Ri(t0)wi
= k, (A.15)
and by the requirement that this quantity does not change under trading, we also have that at a later
time t′
N Y
i=1
Ri(t′
)wi
= k =
N Y
i=1
Ri(t0)wi
. (A.16)
Thus
N Y
i=1

Ri(t′
)
Ri(t0)
wi
= 1. (A.17)
Meanwhile, we are assuming that arbitrageurs trade with the pool until the quoted prices match the
market prices. At time t0 we have prices p(t0) and at time t′
we have prices p(t′
). Using Eq (A.14),
and without loss of generality using the first token as the numéraire, we have that at equilibrium
wi
Ri(t0)
w1
R1(t0)
= pi(t0) (A.18)
and wi
Ri(t′)
w1
R1(t′)
= pi(t′
). (A.19)
Thus we have
pi(t0)
pi(t′)
=
Ri(t′
)R1(t0)
Ri(t0)R1(t′)
, (A.20)
Ri(t′
)
Ri(t0)
=
pi(t0)R1(t′
)
pi(t′)R1(t0)
. (A.21)
8Subbing Eq (A.21) into Eq (A.17), we get
N Y
i=1

Ri(t′
)
Ri(t0)
wi
=
N Y
i=1

pi(t0)R1(t′
)
pi(t′)R1(t0)
wi
= 1 (A.22)
=
R1(t′
)
R1(t0)
N Y
i=1

pi(t0)
pi(t′)
wi
= 1 (A.23)
⇒
R1(t′
)
R1(t0)
=
N Y
i=1

pi(t′
)
pi(t0)
wi
. (A.24)
Now subbing Eq (A.24) into Eq (A.20) and rearranging we get
Ri(t′
) = Ri(t0)
pi(t0)
pi(t′)
N Y
j=1

pj(t′
)
pj(t0)
wj
, (A.25)
as we have in Eq (3) above, completing this derivation.
A.2 Weights Change, Prices Constant
Here we derive Eq (5), the change in reserves of a pool where weights change but market prices are
fixed. For simplicity we are assuming the no-fees case.
At time t0 we have weights w(t0) and a block later t′
= t0 + δt we have weights w(t′
).
Just after the change in weights, we have the invariant of the pool
N Y
i=1
Ri(t0)wi(t′
)
= k(t′
), (A.26)
and by the requirement that this quantity does not change under trading, we also have that after
trading
N Y
i=1
Ri(t′
)wi(t′
)
= k(t′
) =
N Y
i=1
Ri(t0)wi(t′
)
. (A.27)
⇒
N Y
i=1

Ri(t′
)
Ri(t0)
wi(t′
)
= 1. (A.28)
Meanwhile, we are assuming that arbitrageurs trade with the pool until the quoted prices match the
market prices. Prices are p(t0) before and after the change in weights. Using Eq (A.14), and without
loss of generality using the first token as the numéraire, we have that initially, before the change in
weights,
wi(t0)
Ri(t0)
w1(t0)
R1(t0)
= pi(t0) (A.29)
and then after both updating the weights & the pool reaching a new equilibrium
wi(t′
)
Ri(t′)
w1(t′)
R1(t′)
= pi(t0). (A.30)
9Thus we have
wi(t′
)w1(t0)
Ri(t′)R1(t0)
=
w1(t′
)wi(t0)
R1(t′)Ri(t0)
, (A.31)
Ri(t′
)
Ri(t0)
=
wi(t′
)w1(t0)R1(t′
)
w1(t′)wi(t0)R1(t0)
. (A.32)
Subbing Eq (A.32) into Eq (A.28), we get
N Y
i=1

Ri(t′
)
Ri(t0)
wi(t′
)
=
N Y
i=1

wi(t′
)w1(t0)R1(t′
)
w1(t′)wi(t0)R1(t0)
wi(t′
)
= 1 (A.33)
=
w1(t0)R1(t′
)
w1(t′)R1(t0)
N Y
i=1

wi(t′
)
wi(t0)
wi(t′
)
= 1 (A.34)
⇒
w1(t0)R1(t′
)
w1(t′)R1(t0)
=
N Y
i=1

wi(t0)
wi(t′)
wi(t′
)
. (A.35)
Now subbing Eq (A.35) into Eq (A.32) and rearranging we get
Ri(t′
) = Ri(t0)
wi(t′
)
wi(t0)
N Y
j=1

wj(t0)
wj(t′)
wj(t′
)
, (A.36)
as we have in Eq (5) in the main paper, completing this derivation.
A.3 Two-step updates are better than one-step updates
A.3.1 General Interpolation
We will compare two possible weight change methods, against a background of constant prices. We
have γ = 1.
The first is the simple 1-step process, Eq (A.36), derived above. Here we go directly from initial weights
to final weights. For compactness here, we will denote w(t0)+∆w as w(tf). We have w(t0) → w(tf).
The second process is to go to an intermediate set of weights w̃, be arbed to those weights, and then
proceed to the final weights: w(t0) → w̃ → w(tf). The restriction we place here on the elements of
w̃ is that ∀i, w̃i ∈ [wi(t0),wi(tf)]. We enforce the standard requirements on weights, that 0 < w̃i < 1
and
PN
i=1 w̃i = 1.
We will show that the two-step process is always superior as it leads to greater pool reserves.
One-step Eq (A.36) directly gives us the ratio of the change of reserves,
Ri(tf)
Ri(t0)
= rone−step
i =
wi(tf)
wi(t0)
N Y
j=1

wj(t0)
wj(tf)
wj(tf )
.
And to the second leg,
10Two-step Applying Eq (A.36) to the first leg, we get
r1st−step
i =
w̃i
wi(t0)
N Y
j=1

wj(t0)
w̃j
w̃j
.
And to the second leg
r2nd−step
i =
wi(tf)
w̃i
N Y
j=1

w̃j
wj(tf)
wj(tf )
.
This gives and overall change of reserves of
rtwo−step
i = r1st−step
i r2nd−step
i =
wi(tf)
wi(t0)
N Y
j=1

wj(t0)
w̃j
w̃j

w̃j
wj(tf)
wj(tf )
.
Comparison The ratio rtwo−step
i /rone−step
i is
rtwo−step
i /rone−step
i = r =
N Y
j=1

wj(t0)
w̃j
w̃j

w̃j
wj(tf)
wj(tf ) 
wj(tf)
wj(t0)
wj(tf )
(A.37)
=
N Y
j=1

wj(t0)
w̃j
w̃j

w̃j
wj(t0)
wj(tf )
(A.38)
=
N Y
j=1
wj(t0)w̃j
wj(t0)wj(tf )
w̃
wj(tf )
j
w̃
w̃j
j
. (A.39)
If each term in this product is > 1, then we will have shown that the two step process leads to greater
final reserves than a one-step process. Recall that ∀i, wi(t0) < w̃i < wi(tf). Let us now consider the
jth
term of the product. There are two cases to consider, either wi(tf) > wi(t0) or wi(tf) < wi(t0).
The jth
term in the product is
fj =
wj(t0)w̃j
wj(t0)wj(tf )
w̃
wj(tf )
j
w̃
w̃j
j
. (A.40)
wj(tf) > wj(t0): If wj(tf) > wj(t0), then wj(tf) > w̃j and wj(t0) < w̃j. Thus w̃j = ajwj(t0) for
some aj > 1. Subbing into Eq (A.40), we get
fj =
wj(t0)w̃j
wj(t0)wj(tf )
wj(t0)wj(tf )
wj(t0)w̃j
a
wj(tf )
j
a
w̃j
j
= a
wj(tf )−w̃j
j > 1.
wj(tf) < wj(t0): If wj(tf) < wj(t0), then wj(tf) < w̃j and wj(t0) > w̃j. Thus wj(t0) = bjw̃j for
some bj > 1. Subbing into Eq (A.40), we get
fj =
w̃
w̃j
j
w̃
wj(tf )
j
w̃
wj(tf )
j
w̃
w̃j
j
b
w̃j
j
b
wj(tf )
j
= b
w̃j−wj(tf )
j > 1.
11Summary Thus for either increasing elements, wj(tf) > wj(t0), or decreasing elements, wj(tf) <
wj(t0), the terms in the product r are always > 1, therefore taking the two-step process is always
superior, as required.
A.3.2 Linear Interpolation
Here we will derive Eq (9), finding the relationship between R1-step
, the reserves in the pool when we
have directly updated the weights from w(t0) → w(t0) + ∆w, a one step process, and R2-step
, the
reserves when we have done this weight update via a two step process: w(t0) → w(t0) + 1
2∆w →
w(t0) + ∆w.
First Eq (A.36) derived above directly gives us the one-step value:
R1-step
i = Ri(t′
) (A.41)
= Ri(t0)
wi(t0) + ∆wi
wi(t0)
N Y
j=1

wj(t0)
wj(t0) + ∆wj
wj(t0)+∆wj
. (A.42)
Now let’s consider the two-step process. First we do half of the update,
R
∆w/2
i = Ri(t0)
wi(t0) + ∆wi
2
wi(t0)
N Y
j=1
wj(t0)
wj(t0) +
∆wj
2
!wj(t0)+
∆wj
2
. (A.43)
And then completing this two-step process
R2-step
i = R
∆w/2
i
wi(t0) + ∆wi
wi(t0) + ∆wi
2
N Y
j=1
wj(t0) +
∆wj
2
wj(t0) + ∆wj
!wj(t0)+∆wj
(A.44)
= Ri(t0)
wi(t0) + ∆wi
wi(t0)
N Y
j=1
wj(t0)wj(t0)+
∆wj
2

wj(t0) +
∆wj
2
∆wj
2
(wj(t0) + ∆wj)
wj(t0)+∆wj
. (A.45)
Dividing R2-step
i by R1-step
i we get
R2-step
i
R1-step
i
=
N Y
j=1

1 +
∆wj
2wj(t0)
∆wj
2
. (A.46)
Thus we have that
R2-step
= R1-step
N Y
j=1

1 +
∆wj
2wj(t0)
∆wj
2
, (A.47)
as required.
Linear interpolation conclusions The ratio between R2-step and R1-step, is always greater than
or equal to one. This can be seen trivially. When ∆wj is > 0, its term in the product is > 1, as we
have a number > 1 raised by a positive power. When ∆wj is < 0 its term in the product is again > 1,
as we have a number < 1 raised by a negative power. (And when ∆wj is = 0 the term in the product
is 1, as we have 10
= 1.)
This means that for any weight change currently being done in one leap, we can produce a cheaper
weight update procedure by going through and equilibrating at the linear midway value. And after
we apply this ‘bisection’ once, we can apply the exact same argument again on each half the new
procedure, dividing changes in weights in half again. This tells us that we want weight changes to be
maximally smooth. For given start and end weights, choosing to linearly interpolate the value of the
weights in the pool at block-level resolution is thus a simple and effective (and gas-efficient) way to
give us smooth weight changes.
12A.4 Interpretation of re-weighting as an auction
Imagine the weights changing every block, but no arbitrageur acts. The arbitrage opportunity increases
every block (assuming constant market prices). This means that in effect there is a form of Dutch
auction taking place, where the amount a TFMM pool will pay to rebalance increases with blocktime.
Arbitrageurs have their own costs (gas, infrastructure costs, etc) that have to be paid for by their
trades. In this way, the arbitrage opportunities of TFMM pools result in healthy competition between
arbs for who can first fulfil the arbitrage trade, ahead of competitors, by having the leanest, lowest-cost
method of arbing.
A.5 Small weight changes
Here we have a very small change in weights,
w(t′
) = w(t0) + δw, (A.48)
where the components δwi ≪ 1.
A pool is ‘in equilibrium’ if the actual division of value between assets is in accordance with its weight
vector w. If that is the case, w is the division of value over assets in a pool. At time t0, for market
prices pi(t0) and pool reserves Ri(t0), for a pool in equilibrium it is the case that
wi(t0) =
pi(t0)Ri(t0)
V (t0)
, (A.49)
⇒ Ri(t0) =
wi(t0)V (t0)
pi(t0)
, (A.50)
⇒ pi(t0) =
wi(t0)V (t0)
Ri(t0)
, (A.51)
⇒ V (t0) =
pi(t0)Ri(t0)
wi(t0)
, (A.52)
where V (t0) :=
PN
i=1 pi(t0)Ri(t0) is the value of the pool, in the numéraire of the market prices pi(t0)5
.
A.5.1 TFMM pools, No Fees
Here we derive
R(t0)

1 +
δw
w(t0)

+ O {(δwi)2
}

. (A.53)
5Of course changes in numéraire do not change wi or Ri(t0) as such changes equally scale pi(t0) and V (t0) and so
cancel out.
13Start with Eq (5), rearranging, sub in Eq (A.48) and expand out:
R(t′
) = R(t0)
w(t0) + δw
w(t0)
N Y
i=1

wi(t0)
wi(t′)
wi(t′
)
(A.54)
= R(t0)
w(t0) + δw
w(t0)
N Y
i=1

wi(t0)
wi(t0) + δwi
wi(t0)+δwi
(A.55)
= R(t0)
w(t0) + δw
w(t0)
N Y
i=1

1 +
δwi
wi(t0)
−wi(t0)−δwi
(A.56)
= R(t0)
w(t0) + δw
w(t0)
N Y
i=1

1 + (−wi(t0) − δwi)
δwi
wi(t0)
+ H.O.T.

(A.57)
= R(t0)
w(t0) + δw
w(t0)
N Y
i=1
(1 − δwi) + H.O.T. (A.58)
= R(t0)
w(t0) + δw
w(t0)
1 −
N X
i=1
δwi
!
+ H.O.T. (A.59)
= R(t0)
w(t0) + δw
w(t0)
+ H.O.T. (A.60)
= R(t0)

1 +
δw
w(t0)

+ H.O.T. (A.61)
Here ‘H.O.T.’ means higher order terms in the elements of δw.
In Eq (A.57) we have used the binomial expansion, which in Eq (A.58) we have approximated to just
first-order terms in δwi (as the components of δw are small).
In going from Eq (A.58) to Eq (A.59) we have kept only first-order terms in δwi when performing the
product in Eq (A.58).
To go from Eq (A.59) to Eq (A.60) we have used that
PN
i=1 δwi = 0 (weight vectors sums to 1 at all
times, so the sum of changes is necessarily zero).
Using Eq (A.61) with Eq (6), we get, for small weight changes,
Vδw(t′
) =
N X
i=1
pi(t′
)Ri(t′
) (A.62)
=
N X
i=1
pi(t0)Ri(t′
) (A.63)
=
N X
i=1
pi(t0)Ri(t0)

1 +
δwi
wi(t0)

+ H.O.T. (A.64)
14Using
PN
i=1 δwi = 0, we can simply this further:
Vδw(t′
) =
N X
i=1
pi(t0)Ri(t0)

1 +
δwi
wi(t0)

+ H.O.T. (A.65)
=
N X
i=1
pi(t0)Ri(t0) +
N X
i=1
pi(t0)Ri(t0)
wi(t0)
δwi + H.O.T. (A.66)
=
N X
i=1
pi(t0)Ri(t0) +
N X
i=1
V (t0)δwi + H.O.T. (A.67)
=
N X
i=1
pi(t0)Ri(t0) + V (t0)

0
N X
i=1
δwi + H.O.T. (A.68)
=
N X
i=1
pi(t0)Ri(t0) + H.O.T. (A.69)
= V (t0) + H.O.T.. (A.70)
where we have used Eq (A.52) to go from Eq (A.66) to Eq (A.67). Again, ‘H.O.T.’ means higher order
terms in the elements of δw.
A.5.2 TFMM pools, With Fees
Here we derive Eq (10).
Using the results in Appendix B of Angeris et al. [2020]:
V γ-fees
> V no-fees
+ (1 − γ)
N X
i=1
∆ipi, (A.71)
where ∆ is the vector giving the assets being traded into the pool.
∆i in Eq (A.71) is the positive-value-only components in the vector giving the change in reserves from
the arb-trade that brought the pool back into equilibrium (i.e. quoting market prices under its new
weights). Denoting the raw change in reserves Φ := R(t′
) − R(t0) then
∆i = IΦi>0Φi,= IRi(t′)−Ri(t0)>0 (Ri(t′
) − Ri(t0)),
where If is the indicator function. Eq (A.61) gives us that Ri(t′
) − Ri(t0) ≃ Ri(t0)δwi
wi(t0) , enabling an
approximate6
lower bound on the value of a TFMM pool after a small change in weight that has led
to an arbitrageur rebalancing it to have reserves in line with its new weights:
V γ-fees
δw (t′
) ≳ V (t0) + (1 − γ)
N X
i=1

pi(t0)IRi(t0)δwi
wi(t0)
>0

Ri(t0)δwi
wi(t0)

(A.72)
= V (t0) + (1 − γ)
N X
i=1

Iδwi>0

pi(t0)Ri(t0)δwi
wi(t0)

(A.73)
= V (t0) + (1 − γ)
N X
i=1
(Iδwi>0 (V (t0)δwi)) (A.74)
⇒ V γ-fees
δw (t′
) ≳ V (t0) 1 + (1 − γ)
N X
i=1
(Iδwi>0δwi)
!
, (A.75)
as required.
6Due to our first-order-in-δw truncations.
15A.5.3 CEX rebalancing, No Fees
Here we consider active rebalancing, where the pool’s assets are rebalanced by going out to market to
trade, by being a taker. As above we will assume prices are constant over the course of the rebalancing
so pi(t0) = pi(t′
). Again, we have the weights change a small amount, as in Eq (A.48),
w(t′
) = w(t0) + δw.
An ideal weight change would mean that no cost at all is paid to rebalance, so V (t0) = V (t′
). That
would then mean that after the weights have changed and this perfect rebalance has been done, we
have that
wi(t0) + δwi =
pi(t′
)Ri(t′
)
V (t0)
, (A.76)
⇒ Ri(t′
) =
(wi(t0) + δwi)V (t0)
pi(t0)
, (A.77)
Ri(t′
) =
(wi(t0) + δwi)R(t0)
wi(t0)
, (A.78)
Ri(t′
) =

1 +
δwi
wi(t0)

R(t0), (A.79)
where we have made use Eq (A.51) to write the post-update reserves in terms only of initial reserves,
initial weights, and weight changes. This gives us exactly Eq (A.53) written in component form, which
shouldn’t be surprising as we have essentially just reversed the derivations in the above section.
A.5.4 CEX rebalancing, With Fees
Here we derive Eq (11).
A simple model for fees for this rebalance is to charge a fee amount on the outgoing leg of the trade.
To keep similarity with how we parameterise fees in DEX trades, we will parameterise the fees as
1 − γtrad, so γtrad = 0.999 would mean fees of 10bps.
As in the section above, we denote the outgoing leg of the trade ∆, with
∆i = IRi(t′)−Ri(t0)>0 (Ri(t′
) − Ri(t0)) = I δwi
wi(t0)
R(t0)>0

δwi
wi(t0)
R(t0)

,
Where we have used Eq (A.79) that tells us Ri(t′
) − Ri(t0) = δwi
wi(t0)R(t0) (for TFMM the equals sign
was a ≃ due to the small-δwi first-order approximation, here it is exact). This gives us Eq (11), our
counterpart for CEX rebalancing to Eq (10),
V γ-fees
trad > V (t0) 1 − (1 − γtrad)
N X
i=1
(Iδwi>0δwi)
!
, (A.80)
as required.
16B Concentrated Liquidity for Multi-token TFMM Pools
Previous projects have introduced the use of ‘concentrated liquidity’ Adams et al. [2021], Nguyen et al.
[2021], where trades are performed ‘as if’ a pool contains more reserves than it in fact does. If liquidity
is concentrated by quoting trading using these virtual reserves, that are greater than the true reserves,
then it can be possible for trades to remove all of the reserves of any token in the pool by a single trade
or a sequence of trades. This has the effect of making the reserves of a pool only available within a
certain range of market prices. Why is this method desirable? It leads to reduced slippage for traders,
as higher reserves in a pool naturally decrease the curvature of commonly-used trading functions.
This means that pools with concentrated liquidity are more appealing for traders than those that do
not concentrate their liquidity, all else being equal. Previous projects have implemented concentrated
liquidity for pools composed of pairs of tokens. Here we extend the virtual reserves approach to pools
with non-uniform weights over tokens and simultaneously to multi-token pools.
A TFMM pool has, in a given block, the invariant
N Y
i=1
R
wi(t)
i = k(t), where
N X
i=1
wi(t) = 1, and ∀i 0 < wi(t) < 1
We scale the reserves uniformly by a factor ν (≥ 1) to get our virtual reserves, R̆i,
R̆i = νRi,
and further we require that these new virtual reserves follow a matched virtual invariant function
N Y
i=1
R̆
wi(t)
i = k̆(t), where
N X
i=1
wi(t) = 1, and ∀i 0 < wi(t) < 1 (B.81)
Subbing in R̆i = νRi, we obtain
k̆(t) = νk(t), (B.82)
First let us obtain Eq (B.82):
k̆(t) =
N Y
i=1
R̆
wi(t)
i (B.83)
=
N Y
i=1
(νRi)
wi(t)
(B.84)
=
N Y
i=1
(ν)
wi(t)
N Y
i=1

R
wi(t)
i

(B.85)
= ν
PN
i=1 wi(t)
N Y
i=1
R
wi(t)
i (B.86)
= ν
N Y
i=1
R
wi(t)
i (B.87)
= νk(t) (B.88)
What about after a trade has been done? Using primes to denote post-trade quantities,
R′
i = Ri + ∆i − Λi (B.89)
R̆′
i = νRi + ∆i − Λi (B.90)
⇒ R̆′
i = R′
i + (ν − 1)Ri. (B.91)
17This enables us to write the post-trade invariant of the virtual reserves, Eq (B.81), in terms of the
true reserves
N Y
i=1
R̆
′wi(t)
i =
N Y
i=1
(R′
i + (ν − 1)Ri)
wi(t)
= νk′
(t) (B.92)
which shows us clearly that the virtual invariant is a scaled and shifted version of the original invariant.
NB: For the rest of this section of the appendix we are going to drop explicit time dependence for
clarity.
B.1 Minimum and Maximum Reserves
Say that we wish bound out post-trade underlying reserves, R′
i. What are the corresponding bounds
on the virtual, scaled reserves, R̆i?
Minimum R̆′
i We bound the post-trade underlying reserves, R′
i, to be (1 − δ)Ri for 0 < δ < 1.
R̆′
i,min(δ) = (1 − δ)Ri + (ν − 1)Ri = (ν − δ)Ri.
So the absolute minimum is when the underlying reserves go to zero, so R̆′
i,min(δ = 1) = (ν − 1)Ri.
Maximum R̆′
i If all tokens but one have their virtual post-trade reserves reduced to R̆′
i,min =
(ν − 1)Ri, what are the virtual reserves of the one, maximised token? For the no-fees case, whatever
trades took us to this situation must have, at minimum, preserved the invariant of the virtual pool, so
νk =
N Y
i=1
R̆′wi
i =
N Y
i=1
i̸=j
R̆′wi
i,minR̆
′wj
j,max =
N Y
i=1
i̸=j
(ν − δ)wi
N Y
i=1
i̸=j
R′wi
i R̆
′wj
j,max (B.93)
⇒ νk = (ν − δ)′1−wj
k
R
wj
j
R̆
′wj
j,max (B.94)
⇒ R̆′
j,max = Rjν1/wj
(ν − δ)1−1/wj
, (B.95)
as required. (With fees present, this simply becomes R̆′
j,max(γ) = Rjν1/wj
(ν − γδ)1−1/wj
, assuming
that this change was done in one batch trade.)
B.2 Interpreting the Transform
At this stage, it is worth reminding ourselves of the geometric construction behind this form of con-
centration. Recall that, speaking informally, the slippage in a trade is a function of the curvature of
the underlying trading function. So to improve the experience of traders, we can aim to find a ‘virtual’
pool which has less curvature than the original, and expose that new virtual pool’s trading function
to traders to interact with. We want to find an invariant function of the same geometric form as the
original, but scaled and translated in such a way that curvature is minimised.
In theory this gives us N + 1 degrees of freedom, one for each translation in a token direction and
an overall scaling. But these movements of the trading function have the potential to change the
quoted prices of the pool. If trading using the virtual trading function is done using prices that are not
consistent, the system will create enormous and costly arbitrage opportunities. That is, the gradient
of the virtual trading function with respect to virtual token reserves, evaluated at the virtual reserves
that the true reserves are mapped to, has to match the gradients of the original trading function
evaluated at the true reserves. These requirements takes up N degrees of freedom, meaning that we
can parameterise the set of possible virtual reserves by a single parameter, ν. Let us now discuss this
in more mathematical depth.
18Why Linear, Uniform, Scaling of Reserves? Consider a set of N monotonic, positive definite
functions {fi(·)},t ∈ 1,...,N, which we use to make to our virtual reserves:
R̆i = fi(Ri).
The virtual pool has a constant k̆ =
QN
i=1 fi(Ri)wi
. A trade now happens, ∆i being deposited and Λi
being withdrawn, that maintains (or increases) the virtual pool’s constant. It is still the case that 1)
the actual trade amounts, ∆i,Λi must be added and subtracted the true reserves, as that is what it
means to trade with a pool and 2) the actual trade amounts, ∆i,Λi must be added and subtracted
from the virtual reserves in the virtual invariant, because again that is what it is to run a pool. (Note
that we handle the zero-fees case here, for simplicity, but the argument made here is not fundamentally
changed by the presence of fees).
This means we can write down the generalised versions of Eqs (B.89-B.91):
R′
i = Ri + ∆i − Λi (B.96)
R̆′
i = fi(Ri) + ∆i − Λi (B.97)
⇒ R̆′
i = R′
i + (fi(Ri) − 1)Ri. (B.98)
This enables us to write the generalised version of Eq (B.92):
N Y
i=1
R̆′wi
i =
N Y
i=1
(R′
i + (fi(Ri) − 1)Ri)
wi
= k̆′
(B.99)
Because of this linearity we can apply the underlying logic of Eq (A.14) to our virtual pool invariant,
that the marginal prices quoted by a pool for one token in terms of another is the gradient of the
derivatives of the trading function w.r.t. each token’s post-trade reserves, evaluated at the current
reserves. Applying that here results in
pvirtual
i,j =

∂
∂R′ k̆′

i 
∂
∂R′ k̆′

j
R′
=R
(B.100)
=
wi
wj
R′
j + (fj(Rj) − 1)Rj

(R′
i + (fi(Ri) − 1)Ri)
R′
=R
(B.101)
=
wi
wj
fj(Rj)
fi(Ri)
. (B.102)
We need the prices quoted by our virtual invariant to match the prices we obtain from the original
invariant, Eq (A.14), otherwise allowing trades under the virtual invariant will not lead to the pool
have the desired division of value between assets at equilibrium—i.e. these two sets of prices have to
match for w to describe the division of pool value between token holdings. So we require that
fj(Rj)
fi(Ri)
=
Rj
Ri
,
which is satisfied for fk(x) = f(x) = νx for some constant ν, as required.
B.3 What should ν be set to?
Pool creators can choose a particular value based on their analysis, analogous to how update rules’
parameters are set; but also, if they prefer, they can choose an external smart contract to be called at
the same time as the weight update call to calculate a dynamic ν(t) that depends on market conditions,
which could include external oracle calls.
19C Study of Potential Multiblock Attack
An important question about TFMMs is whether their temporal dependence means there is an op-
portunity for MEV. Here we study such attacks, where an attacker aims to manipulate a TFMM pool
shortly before a weight update. This situation is the TFMM equivalent of a ‘sandwich attack’, but
with the attack being done against pool LPs rather than a trader.
First the attacker trades against the pool to take it out of equilibrium, then the weights change for the
next block, and the attacker does a trade in the reverse direction – if effect this is a multi-block sandwich
attack, where the change of weights between blocks is roughly analogous to a trade. Like trades in
vanilla sandwich attacks, certain criteria have to be met for this attack to be profitable/possible.
We perform mathematical analysis of the circumstances where attacks of this kind are possible and
where they are impossible, even when granting the attacker (for free and with certainty) the final
transaction in one block and the first transaction in the next.
We will derive the cost of manipulating a TFMM pool, with particular weights, such that it quotes a
chosen price, rather than the true, reference, market price. We do this in the presence of fees. After
having manipulated the price in this way, the weights of the pool change, and a ‘boosted’ arbitrage
trade is then available in the following block. We derive the returns to an arbitrageur from bringing
the manipulated-pool back to quoting market prices after the weights have been updated.
From these quantities we can then calculate the overall return on this three-step process, the cost
of manipulating the quoted prices of a pool, the weights changing, and the return of performing an
arbitrage trade against the pool’s new weights
C.1 Trading & Fees
Consider an N-token pool. For simplicity of analysis we trade a subset of 2 tokens for this attack—in
our numerical work later we allow all tokens to be traded and empirically we find that optimal attacks
are done by trading between a pair of tokens in this way. Those two tokens have weights w = {w1,w2}
and reserves R = {R1,R2}. We are here going to consider the quoted prices of the tokens in the pool.
We assume the existence of true, external market prices for the tokens. mp,2 = mp is the market price
of the second token in terms of the first. mp,1, the market price of the first token in terms of the second
is simply the reciprocal of this: mp,1 = 1/mp,2 = 1/mp. (Without loss of generality, we will be using
the first token as the numéraire throughout unless otherwise noted.7
)
Here we consider an attacker who wishes the pools quoted price for the second token, in terms of the
first, to deviate from the market prices by a factor of (1+ϵ). Without loss of generality we will consider
attacks where the initial price manipulation is done to increase the quoted price of the second token.
The attacker trades the first token into the pool and withdraws the second tokens.
This is without loss of generality as a) we can freely permute the indices of assets in a pool’s basket and
as b) a manipulation to increase the price of one token in the pool, by reducing its reserves, necessarily
means we are decreasing the price of the other token. So an attack based around decreasing the price
of token, rather than increasing it, is obtained simply by exchanging the indices of the tokens.
7Either you can imagine that the first token in the pool is a stablecoin in USD, say. Or it can be an arbitrary
token, and we then are applying a linear scaling (that token’s price) to our vanilla market prices to get them in the
denomination of our particular chosen numéraire.
20C.2 Mathematical Analysis of Potential Attack
With fees of τ = 1−γ (commonly γ = 0.997), when trading in ∆1 > 0 of token 1 to receive ∆2 > 0 of
token 2 the trade must fulfill
(R1 + γ∆1)w1
(R2 − ∆2)w2
≥ k = Rw1
1 Rw2
2 , (C.103)
with the best deal for the trader found when
(R1 + γ∆1)w1
(R2 − ∆2)w2
= k = Rw1
1 Rw2
2 . (C.104)
Eq (C.104) can be rearranged into a neater form,
1 −
∆2
R2
=

1 + γ
∆1
R1
−
w1
w2
. (C.105)
In this attack, the attacker first manipulates the pool’s quoted price for second token to be
mmanip.
AMM,2 = (1 + ϵ)mp, (C.106)
where ϵ ≥ ϵ0. ϵ0 is the ‘do nothing’ or ‘NULL’ value—equivalent to their being no attack carried out.
When fees are present and we are in a worst-case scenario for the pool, ϵ0 > 0.
C(ϵ) denotes the cost to the attacker of performing the first, price-manipulating, trade, making clear
the dependence of this cost on the scale of the price deviation the attacker does. X(ϵ) denotes the
return to the attacker from the post-weight-update arbitrage trade. The overall benefit to the attacker
over not carrying out the attack and just being an arbitrageur, Z(ϵ), is thus
Z(ϵ) = X(ϵ) − C(ϵ) − X(ϵ0), (C.107)
When Z(ϵ) > 0 the return from the attack, X(ϵ)−C(ϵ), is greater than the vanilla, just-doing-arbitrage
return X(ϵ0). We can obtain bounds on X(ϵ) and C(ϵ) when fees are present without having them in
closed form.
C.2.1 Cost of Manipulating Quoted Prices
Post-trade, the quoted prices are
mattacker = mp(1 + ϵ) =
1
γ
w2
R2−∆2
w1
R1+∆1
. (C.108)
Subbing in that mp = γmu, we find that after the attack trade
R1 + ∆1
R2 − ∆2
= γ2
(1 + ϵ)
R1
R2
. (C.109)
Combining Eq (C.109) with Eq (C.104) and rearranging we have that

1 +
∆1
R1

1 + γ
∆1
R1
w1
w2
= γ2
(1 + ϵ) (C.110)
Similar manipulations give us

1 −
∆2
R2
−1
1 +
1
γ

1 −
∆2
R2
−
w2
w1
− 1
!!
= γ2
(1 + ϵ). (C.111)
C(ϵ), the cost of the attack to the manipulator, again using token 1 as the numéraire, is
C(ϵ) = ∆1 − mp∆2. (C.112)
Eq (C.110) links together ∆1,R1,γ and ϵ, and Eq (C.111) separately links ∆2,R2,γ and ϵ. These are
implicit equations for ∆1 or ∆2 in terms of the other variables.
This means we cannot trivially write down C(ϵ) in closed form. We can make progress as we need
only either the ratio of ∆1 to ∆2 or the partial derivatives of the cost, of ∆1, and of ∆2, with respect
to ϵ for us to find a bound on Z(ϵ).
21C.2.2 Change of Reserves of an Attacked Pool After a Weight Update
We assume that all this takes place fast enough that the market prices are constant–this could all take
place in one block. After the price manipulation above we have new (′
ed) reserves
R1
′
= R1 + ∆1 (C.113)
R2
′
= R2 − ∆2 (C.114)
The weights of the pool change, so now we have new (again, ′
ed) weights w′
1 = w1 + ∆w1 and
w′
2 = w2 + ∆w2.
After the arbitrage trade, the reserves of the pool will change again (to ′′
ed values) such that the new
weights, w′
1,w′
2, and the new post-arbitrage-trade reserves, R1
′′
,R2
′′
, minimise the value in the pool
(thus maximising the returns to the arb). We thus have
R1
′′
= R1
′
− ∆′
1 (C.115)
R2
′′
= R2 + ∆′
2. (C.116)
The return to the arbitrageur is
X(ϵ) = ∆′
1 − mp∆′
2 (C.117)
What is the best-for-the-arb trade? Instead of directly obtaining the value of X(ϵ) we will upper
bound its value by Xγ=1(ϵ) (the return to the arbitrageur when the arbitrageur’s trade takes place in
a no-fees way—γ = 1 for this trade). Intuitively Xγ=1(ϵ) > X(ϵ) (after all it would be surprising if
fees made the trade cheaper), and in Appendix C.3 we prove that this is indeed the case.
And thus that
m′
AMM = m′
u =
w′
2
R2
′′
w′
1
R1
′′
= mp, (C.118)
Combining Eqs (C.109) and (C.118) we get
w′
2
R2
′′
w′
1
R1
′′
=
1
γ
1
1 + ϵ
w2
R2
′
w1
R1
′
(C.119)
⇒
R2
′′
R2
′ = γ(1 + ϵ)
w′
2
w2
w1
w′
1
R1
′′
R1
′ . (C.120)
Thus we can consider the no-fees invariant before and after this arb-trade:
k̃′
= R1
′w′
1R2
′w′
2 = R1
′′w′
1 R2
′′w′
2
⇒ 1 =

R1
′′
R1
′
w′
1

R2
′′
R2
′
w′
2
. (C.121)
Using Eq (C.120) we get
1 =

R1
′′
R1
′
w′
1

γ2
(1 + ϵ)
w′
2
w2
w1
w′
1
R1
′′
R1
′
w′
2
,
⇒
R1
′′
R1
′ =

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 w′
2
w′
1+w′
2
, (C.122)
and thus, similarly, that
R2
′′
R2
′ =

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 −w′
1
w′
1+w′
2
. (C.123)
22From algebraic manipulation we obtain that
∆′
1 = R1
′

1 −

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 w′
2
w′
1+w′
2

, (C.124)
∆′
2 = R2
′



w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 −w′
1
w′
1+w′
2
− 1

, (C.125)
Our upper bound on the return to the arbitrageur is thus
Xγ=1(ϵ) =∆′
1 − mp∆′
2
⇒ Xγ=1(ϵ) =R1
′

1 −

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 w′
2
w′
1+w′
2

 − mpR2
′



w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 −w′
1
w′
1+w′
2
− 1

.
C.2.3 Putting it all together: When is there no extractable value?
Our upper bound on Z(ϵ) is thus:
Z(ϵ) ≤ Z̃(ϵ) = Xγ=1(ϵ) − C(ϵ) − Xγ=1(ϵ0). (C.126)
C.2.4 Bounding via gradients of Z(ϵ)
Recall that there is a ‘NULL’ value of ϵ, ϵ0, which corresponds to no-price-manipulation. As ∆1(ϵ0) =
∆2(ϵ0) = 0, Z(ϵ0) = Z̃(ϵ0) = 0.
We want to find settings of pool parameters such that Z(ϵ) < 0 for all ϵ > ϵ0. If ∂Z̃(ϵ)
∂ϵ < 0 for all
ϵ > ϵ0 (ie if Z(ϵ) is a monotonically non-increasing function for ϵ > ϵ0) then Z(ϵ) < 0 for all ϵ > ϵ0.
In the zero fees case the ‘NULL’ value ϵ0 = 0.
Taking partial derivatives of Z̃(ϵ) w.r.t. ϵ we get
∂Z̃(ϵ)
∂ϵ
=
∂
∂ϵ
(∆′
1 − ∆1) + mp
∂
∂ϵ
(∆2 − ∆′
2), (C.127)
so if ∂
∂ϵ (∆′
1 − ∆1) ≤ 0 and ∂
∂ϵ (∆2 − ∆′
2) ≤ 0, then we can guarantee that the attack will not work.
Gradient of ∆′
1 − ∆1 w.r.t. ϵ Using Eq (C.124), recalling that R1
′
= R1 + ∆1, we have that
∆′
1 − ∆1 = R1 −

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 w′
2
w′
1+w′
2
(∆1 + R1) (C.128)
⇒
∂
∂ϵ
(∆′
1 − ∆1) =

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 w′
2
w′
1+w′
2

1
1 + ϵ
w′
2
w′
1 + w′
2
(∆1 + R1) −
∂∆1
∂ϵ

. (C.129)
We find that (see Appendix C.4.1)
∂∆1
∂ϵ
=
γ2
R1

1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1

1 + γ∆1
R1
w1
w2
. (C.130)
Subbing this into Eq (C.129), and using Eq (C.110), for ∂
∂ϵ (∆′
1 − ∆1) ≤ 0 it must be that
w′
2
w′
1 + w′
2
1 + γ
w1
w2

1 +
∆1
R1

1 + γ
∆1
R1
−1
!
≤ 1, (C.131)
where we have used that

w2
w′
2
w′
1
w1
1
γ
1
1+ϵ
w′
2
> 0 when w1 ∈ (0,1), w2 ∈ (0,1), w′
1 ∈ (0,1), w′
2 ∈ (0,1),
0 < γ < 1, and ϵ > ϵ0.
23Gradient of ∆2 − ∆′
2 w.r.t. ϵ Using Eq (C.125), recalling that R2
′
= R2 − ∆2, we have that
∆2 − ∆′
2 = R2 +

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
−w′
1
(∆2 − R2) (C.132)
⇒
∂
∂ϵ
(∆2 − ∆′
2) =

w2
w′
2
w′
1
w1
1
γ
1
1 + ϵ
 −w′
1
w′
1+w′
2

1
1 + ϵ
w′
1
w′
1 + w′
2
(∆2 − R2) +
∂∆2
∂ϵ

. (C.133)
We find that (see Appendix C.4.2)
∂∆2
∂ϵ
=
γ3
R2

1 − ∆2
R2
2

1 + w2
w1

1 − ∆2
R2
−
w2
w1
− (1 − γ)
(C.134)
Subbing this into Eq (C.133), and using Eq (C.111), for ∂
∂ϵ (∆2 − ∆′
2) ≤ 0 it must be that
w′
1
w′
1 + w′
2
≥
1 − (1 − γ)

1 − ∆2
R2
w2
w1
1 + w2
w1
− (1 − γ)

1 − ∆2
R2
w2
w1
, (C.135)
where we have used that

w2
w′
2
w′
1
w1
1
γ
1
1+ϵ
−w′
1
> 0 when w1 ∈ (0,1), w2 ∈ (0,1), w′
1 ∈ (0,1), w′
2 ∈ (0,1),
0 < γ < 1, and ϵ > ϵ0.
These results tell us that if the changes in weights are within these bounds, then no attack is possible.
2-token case For the case of a two-token pool, so the two tokens being traded are the old tokens
present, we can simplify the above equations and plot them. We are interested in knowing what
weight changes we can ‘get away with’ without a pool being open to attack. That means we are most
interested in the above inequalities reformulated explicitly to give us bounds on the weight changes.
As we are now in the two-token case, w′
1 +w′
2 = w1 +w2 = 1 and ∆w1 = −∆w2. Thus we can re-write
Eq (C.131) and Eq (C.135) in terms of just w = w1 = 1 − w2 and ∆w = ∆w1 = −∆w2 :
∆w ≥ 1 −
1

1 + γ w
(1−w)

1 + ∆1
R1

1 + γ∆1
R1
−1
 − w, (C.136)
∆w ≥
1 − (1 − γ)

1 − ∆2
R2
(1−w)
w
1 + (1−w)
w − (1 − γ)

1 − ∆2
R2
(1−w)
w
− w. (C.137)
In §C.2 we described how we could study the case where the attacker initially increases the quoted
price of the second token, denominated in the first, without loss of generality as we can simply swap
indices in our final equations to get the results for the mirror-attack where the price of the first token is
initially pumped up by the attacker. We can now do that swapping, giving the additional constraints:
∆w ≤
1

1 + γ(1−w)
w

1 + ∆2
R2

1 + γ∆2
R2
−1
 − w, (C.138)
∆w ≤ 1 −
1 − (1 − γ)

1 − ∆1
R1
 w
(1−w)
1 + w
(1−w) − (1 − γ)

1 − ∆1
R1
 w
(1−w)
− w. (C.139)
If the changes in weight fulfil Eqs (C.136-C.139) then no attack is possible for a given initial price-
deviating trade. These bounds are expressed as functions of that initial trade, ∆1 and ∆2. These
bounds are also monotonic in ∆1 and ∆2 such that if a pool is safe under an initial trade (¯ ∆1, ¯ ∆2)
then it is safe also for all trades ∆1 < ¯ ∆1 and ∆2 < ¯ ∆2. See Appendix C.5 for this.
24Figure C.3: Plots of the two-token inequalities Eqs (C.136-C.139), where shaded regions are the safe
region of each inequality. This is done for ∆1 = 0.2R1 and γ = 0.997. The x-axis is w and the y-axis
is ∆w.
C.3 Proof that Xγ=1(ϵ) is an upper bound on X(ϵ)
Here we will demonstrate that Xγ=1(ϵ) > X(ϵ) for ϵ > ϵ0. First recall that
X(ϵ) = ∆′
1(ϵ,γ) − mp∆′
2(ϵ,γ)
and that
Xγ=1(ϵ) = ∆′
1(ϵ,γ = 1) − mp∆′
2(ϵ,γ = 1),
where we have made explicit the dependence of ∆′
1 and ∆′
2 on ϵ and γ.
Xγ=1(ϵ) − X(ϵ) = ∆′
1(ϵ,γ = 1) − ∆′
1(ϵ,γ) − (mp∆′
2(ϵ,γ = 1) − ∆′
2(ϵ,γ)),
This means for Xγ=1(ϵ) > X(ϵ) it is sufficient to show that ∆′
2(ϵ,γ) > ∆′
2(ϵ,γ = 1) and that ∆′
1(ϵ,γ) <
∆′
1(ϵ,γ = 1). We will handle these in turn
Showing ∆′
2(ϵ,γ) > ∆′
2(ϵ,γ = 1): We begin by writing down the trade-invariant for ∆′
1 and ∆′
2 in
the presence of fees. It is, naturally, that
(R1
′
− ∆′
1(ϵ,γ))w′
1 (R2
′
+ γ∆′
2(ϵ,γ))w′
2 = k′
= R1
′w′
1R2
′w2
, (C.140)
as the trader is putting ∆′
2 of token 2 into the pool and withdrawing ∆′
1 of token 1.
Next, we need the trade invariant if γ = 1—if there are no fees. Then
(R1
′
− ∆′
1(ϵ,γ = 1))w′
1(R2
′
+ ∆′
2(ϵ,γ = 1))w′
2 = k′
= R1
′w′
1R2
′w2
. (C.141)
The final part we need is the following. We know that the purpose of this trade is to get the pool to
quote a certain price after the trade has been performed, based on its post-trade pool reserves. This
means that the quoted prices after the trade-with-fees will, indeed must, be the same as the quoted
price after the trade-with-no-fees8
. Thus, using Eq (C.118) we get that
(R1
′
− ∆′
1(ϵ,γ = 1))
(R2
′
+ ∆′
2(ϵ,γ = 1))
=
(R1
′
− ∆′
1(ϵ,γ))
(R2
′
+ ∆′
2(ϵ,γ))
, (C.142)
8Note that we are only setting γ = 1 for the trade in the γ = 1 part of this construction. We are still having the
arbitrage trade, with fees or not, bring the quoted price to the upper end of the (γ defined) no-arb region.
25where the weights have cancelled out. Rearranging we get that
(R1
′
− ∆′
1(ϵ,γ)) = (R2
′
+ ∆′
2(ϵ,γ))
(R1
′
− ∆′
1(ϵ,γ = 1))
(R2
′
+ ∆′
2(ϵ,γ = 1))
,
which we can sub in to Eq (C.140) to get

(R2
′
+ ∆′
2(ϵ,γ))
(R1
′
− ∆′
1(ϵ,γ = 1))
(R2
′
+ ∆′
2(ϵ,γ = 1))
w′
1
(R2
′
+ γ∆′
2(ϵ,γ))w′
2 = k′
.
Rearranging Eq (C.141) we get
(R1
′
− ∆′
1(ϵ,γ = 1))w′
1 =
k′
(R2
′
+ ∆′
2(ϵ,γ = 1))w′
2
,
which we can then sub in to the previous equation to obtain
(R2
′
+ ∆′
2(ϵ,γ))w′
1 (R2
′
+ γ∆′
2(ϵ,γ))w′
2 = (R2
′
+ ∆′
2(ϵ,γ = 1)).
As w′
1 + w′
2 = 1, 0 < w′
1 < 1, 0 < w′
2 < 1 and 0 < γ < 1, it is thus clear that ∆′
2(ϵ,γ) > ∆′
2(ϵ,γ = 1).
Showing ∆′
1(ϵ,γ) < ∆′
1(ϵ,γ = 1): Rearranging Eq (C.142) we get
∆′
1(ϵ,γ = 1) = R1
′
− (R1
′
− ∆′
1(ϵ,γ))
(R2
′
+ ∆′
2(ϵ,γ = 1))
(R2
′
+ ∆′
2(ϵ,γ))
,
⇒ ∆′
2(ϵ,γ = 1) = R1
′
(1 − k) + k∆′
1(ϵ,γ),
⇒ ∆′
2(ϵ,γ) =
1
k
∆′
1(ϵ,γ = 1) + R1
′ (k − 1)
k
,
where k =
(R2
′
+∆′
2(ϵ,γ=1))
(R2
′+∆′
2(ϵ,γ)) . k < 1 as ∆′
2(ϵ,γ) > ∆′
2(ϵ,γ = 1) and k > 0 as both its numerator and
denominator are > 0. This last equation, for ∆′
1(ϵ,γ) as a function of ∆′
1(ϵ,γ = 1), is a straight line
with gradient 1/k > 1 and intercept R1
′ (k−1)
k < 0. This line crosses ‘y = x’ when R1
′
= ∆′
1(ϵ,γ = 1),
so for all ∆′
1(ϵ,γ = 1) < R1
′
(which are the only possible values as the pool cannot be drained) we
have that ∆1(ϵ,γ = 1) < ∆′
1(ϵ,γ = 1) as required.
C.4 Finding partial derivatives
C.4.1 Finding ∂∆1/∂ϵ
Recall the implicit equation that defines ∆1, Eq (C.110):

1 +
∆1
R1

1 + γ
∆1
R1
w1
w2
= γ2
(1 + ϵ).
Taking partial derivatives of both sides with respect to ϵ:
∂
∂ϵ

1 +
∆1
R1

1 + γ
∆1
R1
w1
w2
!
=
∂
∂ϵ
γ2
(1 + ϵ)

⇒
1
R1
∂∆1
∂ϵ

1 + γ
∆1
R1
w1
w2
+

1 +
∆1
R1

w1
w2

1 + γ
∆1
R1
w1
w2
−1
γ
R1
∂∆1
∂ϵ
= γ2
⇒
∂∆1
∂ϵ
1
R1

1 + γ
∆1
R1
w1
w2
1 + γ

1 +
∆1
R1

w1
w2

1 + γ
∆1
R1
−1
!
= γ2
⇒
∂∆1
∂ϵ
=
γ2
R1

1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1

1 + γ∆1
R1
w1
w2
,
as required.
26C.4.2 Finding ∂∆2/∂ϵ
Recall the implicit equation that defines ∆2, Eq (C.111):

1 −
∆2
R2
−1
1 +
1
γ

1 −
∆2
R2
−
w2
w1
− 1
!!
= γ2
(1 + ϵ).
Taking partial derivatives of both sides with respect to ϵ:
∂
∂ϵ

1 −
∆2
R2
−1
1 +
1
γ

1 −
∆2
R2
−
w2
w1
− 1
!!!
=
∂
∂ϵ
γ2
(1 + ϵ)

⇒
∂∆2
∂ϵ
1
R2

1 −
∆2
R2
−2

 1 +
1
γ
1 −
∆2
R2
!−
w2
w1
−
1
γ


+
1
γ
w2
w1

1 −
∆2
R2
−
w2
w1
!!
= γ2
⇒
∂∆2
∂ϵ
=
γ3
R2

1 − ∆2
R2
2

1 + w2
w1

1 − ∆2
R2
−
w2
w1
− (1 − γ)
,
as required.
C.5 Monotonicity of inequalities
We have two inequalities that we derive above, Eq (C.131),
w′
2
w′
1 + w′
2
1 + γ
w1
w2

1 +
∆1
R1

1 + γ
∆1
R1
−1
!
≤ 1,
and Eq (C.135),
w′
1
w′
1 + w′
2
≥
1 − (1 − γ)

1 − ∆2
R2
w2
w1
1 + w2
w1
− (1 − γ)

1 − ∆2
R2
w2
w1
.
Here we are interested in the monotonicity of the level-sets of these w.r.t. ∆1 and ∆2. That is, if our
values of w′
1,w′
2 satisfy their inequalities for some particular values of w1,w2,R1,R2,∆1,∆2, can we
guarantee that the same values of w′
1,w′
2 also satisfy the inequalities for ˆ ∆1 < ∆1 and ˆ ∆2 < ∆2 (with
w1,w2,R1,R2 fixed)?
For this to be the case, we need the level sets of the inequalities to always have the correct gradient
so that smaller values of ∆1,∆2 always move the inequality’s boundary ‘further away’ from the value
of w′
1,w′
2. Let us handle the above equations in turn.
∆1 Consider the case where our w′
1,w′
2 values just satisfies the first inequality above, so that
w̄′
2
w̄′
1 + w̄′
2
=
1
1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1 ,,
27where w̄′
1,w̄′
2 denotes these critical value of w′
1,w′
2. For w̄′
1,w̄′
2 to also satisfy the inequality for ˆ ∆1 < ∆1,
we need that
∂
∂∆1



1
1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1


 < 0,
as then the required critical value will be larger for smaller ∆1 values. Evaluating this partial derivative,
we find that
∂
∂∆1



1
1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1


 = −
γw1
w2

1 + γ∆1
R1
−1

1 + γ

1 + ∆1
R1

1 + γ∆1
R1
−1


1 + γw1
w2

1 + ∆1
R1

1 + γ∆1
R1
−1
2 .
For w1 ∈ (0,1), w2 ∈ (0,1), γ > 0, R1 > 0 and ∆1 > 0, clearly this gradient is always negative, as
required.
∆2 Again let us take the critical value of the new weight such that the inequality is just satisfied, so
w̄′
1
w̄′
1 + w̄′
2
=
1 − (1 − γ)

1 − ∆2
R2
w2
w1
1 + w2
w1
− (1 − γ)

1 − ∆2
R2
w2
w1
. (C.143)
Here we want the partial derivative of this critical value to always be positive, so that the required
critical value is always smaller for smaller ∆2 values, so we want that
∂
∂∆2



1 − (1 − γ)

1 − ∆2
R2
w2
w1
1 + w2
w1
− (1 − γ)

1 − ∆2
R2
w2
w1


 > 0.
We can re-write Eq (C.143) more compactly as
w̄′
1
w̄′
1 + w̄′
2
=
1 − f(∆2)
1 + a − f(∆2)
. (C.144)
where f(∆2) = (1 − γ)

1 − ∆2
R2
w2
w1
and a = w2
w1
.
∂
∂∆2

1 − f(∆2)
1 + a − f(∆2)

= −
a∂f(∆2)
∂∆2
(1 + a − f(∆2))
2 .
As a > 0, as w1 ∈ (0,1) and w2 ∈ (0,1), the gradient
∂w̄′
1
∂∆2
is positive if ∂f(∆2)
∂∆2
< 0. Let us evaluate
∂f(∆2)
∂∆2
:
∂f(∆2)
∂∆2
=
∂
∂∆2
(1 − γ)

1 −
∆2
R2
w2
w1
!
= −
1
R2
w2
w1
(1 − γ)

1 −
∆2
R2
w2
w1
−1
!
As R2 < ∆2, w1 ∈ (0,1), w2 ∈ (0,1), 0 < γ < 1, this gradient is always negative, so ∂
∂∆2
1−(1−γ)

1−
∆2
R2
w2
w1
1+
w2
w1
−(1−γ)

1−
∆2
R2
w2
w1
!
>
0, as required.
28References
Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated market
making and loss-versus-rebalancing, 2022.
Alexander Nezlobin. Ethereum block times, mev, and lp returns, 2022. URL https://medium.com/
@alexnezlobin/ethereum-block-times-mev-and-lp-returns-5c13dc99e80.
Dave White, Dan Robinson, and Hayden Adams. Automated market making and loss-versus-
rebalancing, 2021. URL https://www.paradigm.xyz/2021/07/twamm.
Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog? curvature and
market making, 2020.
Hayden Adams, Noah Zinsmeister, Moody Salem River Keefer, and Dan Robinson. Uniswap v3 core,
2021.
Andrew Nguyen, Loi Luu, and Ming Ng. Kyberswap: Dynamic automated market making, 2021.
29DISCLAIMER This paper is for general information purposes only. It does not constitute investment
advice or a recommendation or solicitation to buy or sell any investment or asset, or participate in
systems that use TFMM. This paper should not be used in the evaluation of the merits of making any
investment decision. It should not be relied upon for accounting, legal or tax advice or investment
recommendations. This paper reflects current opinions of the authors regarding the development and
functionality of TFMM and is subject to change without notice or update.
While some aspects, such as altering target weights in geometric mean market makers is prior art,
aspects of TFMM that are novel such as, but not exclusively, composability mechanisms, efficient
methods for gradients and covariances, generic form multi-token amplification and advanced execution
management mechanisms for use in dynamic weight AMMs, for purposes of core liquidity providing
or forms of asset management including, but not exclusively, fund construction, structured products,
treasury management are covered by patent filing date of 21st February 2023.
30