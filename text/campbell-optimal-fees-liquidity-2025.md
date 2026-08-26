---
sha256: 2f51296284443a5c08586e9c3701f788207b232520de28e8061897f07b3289c9
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 117318
---
OPTIMAL FEES FOR LIQUIDITY PROVISION IN AUTOMATED
MARKET MAKERS
STEVEN CAMPBELL, PHILIPPE BERGAULT, JASON MILIONIS, AND MARCEL NUTZ
Abstract. Passive liquidity providers (LPs) in automated market makers (AMMs) face
losses due to adverse selection (LVR), which static trading fees often fail to offset in prac-
tice. We study the key determinants of LP profitability in a dynamic reduced-form model
where an AMM operates in parallel with a centralized exchange (CEX), traders route their
orders optimally to the venue offering the better price, and arbitrageurs exploit price dis-
crepancies. Using large-scale simulations and real market data, we analyze how LP profits
vary with market conditions such as volatility and trading volume, and characterize the
optimal AMM fee as a function of these conditions. We highlight the mechanisms driving
these relationships through extensive comparative statics, and confirm the model’s rele-
vance through market data calibration. A key trade-off emerges: fees must be low enough
to attract volume, yet high enough to earn sufficient revenues and mitigate arbitrage
losses. We find that under normal market conditions, the optimal AMM fee is competitive
with the trading cost on the CEX and remarkably stable, whereas in periods of very high
volatility, a high fee protects passive LPs from severe losses. These findings suggest that
a threshold-type dynamic fee schedule is both robust enough to market conditions and
improves LP outcomes.
1. Introduction
Decentralized exchanges (DEXs) are an important class of trading venues in decentralized
finance (DeFi), allowing users to trade assets or provide liquidity without intermediation.
Most DEXs operate using automated market makers (AMMs) where traders interact with
a liquidity pool rather than being matched directly as in a limit order book.1
Exchange
rates are set by predetermined formulas, most often following the constant function market
maker (CFMM) model which enforces a fixed relationship between asset quantities in the
pool. A key attraction of CFMMs is passive liquidity provision—liquidity providers (LPs)
can supply liquidity without managing their positions continuously as in limit order book
markets. In return for providing liquidity, LPs earn a pro-rata share of fees that are levied
on trades in the AMM. However, the convenience of not managing positions comes at a
cost: LPs are exposed to losses due to adverse selection (see Capponi and Jia [13] and
Milionis et al. [31], among others). Indeed, rational market participants monitoring real-
time prices on other venues where price discovery occurs can exploit stale prices offered
by the AMM. Even after hedging away price risk, LPs incur a systematic loss known as
loss-versus-rebalancing (LVR, see Milionis et al. [31], also identified as “convexity cost,” see
Cartea et al. [14, 15]). While fees would ideally compensate for that, practice has shown
that LPs often suffer persistent negative returns, especially in volatile markets (e.g., [11,
17, 18]). This poses a serious challenge to the long-term sustainability of passive liquidity
Date: August 12, 2025.
1See https://defillama.com/dexs for up-to-date trading volume statistics. We lightly abuse terminology
in using the terms DEX and AMM interchangeably.
1
arXiv:2508.08152v1 [q-fin.TR] 11 Aug 2025provision (e.g., Hasbrouck et al. [23]). Therefore, a plurality of recent works study this issue
and possible solutions from various angles, such as dynamic fees adjusting to volatility (Cao
et al. [12]), modifications to blockchain frequency (Milionis et al. [30]), or auction-based
AMM designs redistributing arbitrage gains to LPs (Adams et al. [1]), among many others.
The practical relevance of such approaches is also evidenced by the numerous works from
industry groups aiming to mitigate LVR (e.g., [3, 16, 20, 26, 27]). Despite this rapidly
growing body of literature, a simulation-based, model-agnostic framework for analyzing LP
profitability is absent.
The goal of the present work is to understand the PnL of passive liquidity provision as
a function of market conditions such as trading fees, price volatility, and trading volume.
In particular, we want to determine the AMM fee that maximizes expected LP PnL given
market conditions, and whether that PnL is positive. Moreover, we want to understand
how much the PnL deteriorates when the AMM fee deviates from the optimum, perhaps
because market conditions evolve over time. One motivation for the present work is the
proposal of dynamic fees (that vary as a function of market conditions) as a way to reduce
LVR. In the context of Uniswap v4 hook design, Uniswap’s guidance highlights volatility
and trade volume dependence as a best practice in fee design [32].
In contrast to the existing related literature (see Section 1.3 for a literature review), we
propose a reduced-form model where the market conditions are input parameters—rather
than an equilibrium model which endogenizes some or all of the conditions. Using large-
scale simulation, we can then explore the hypersurface of all parameter combinations. A
dynamic market where conditions evolve jointly over time can be seen as a curve traveling
on that hypersurface, so that our study can inform LP profitability in a dynamic situation:
a simulation with constant parameters over a short time horizon serves as a building block of
a dynamic model obtained by concatenating several simulations with different parameters.
While the evolution would certainly include market and asset-specific dynamics, the design
of the building block is agnostic to those.
1.1. Model. In our baseline model, the numéraire asset X and the risky asset Y are traded
on two venues, a centralized exchange (CEX) and a decentralized exchange operating by an
AMM, more precisely a constant product market maker (first analyzed by Angeris et al. [4])
akin to Uniswap v2.2
The price of Y (in units of X) on the CEX evolves exogenously and
the assets can be traded at a fixed proportional cost η0 which stands in for all trading costs
on the CEX—nominal fees levied by the exchange, bid-ask spread, etc. The liquidity for the
AMM is supplied by a representative LP at the initial time. After that, no shares are minted
or burnt, so that pool reserves on the AMM evolve only due to swaps by traders. Swaps
on the AMM incur a proportional fee η1 which is paid to the LP. There are two types of
traders. Arbitrageurs act whenever prices on the two venues allow for a profitable roundtrip
after accounting for fees. Their trades thus align the marginal price on the AMM with the
CEX price, up to fees. Traders of the second type are called fundamental traders and differ
only by having an exogenous trading demand. To satisfy their demand, they route their
order flow optimally to the two venues, meaning that each marginal trade is routed to the
2While Uniswap v3 with concentrated liquidity carries higher trading volume at the time of writing, and
v4 with hooks is the most recent Uniswap protocol, we prefer a parsimonious model with few parameters
to study the mechanics of CEX-DEX interaction. In such a model, producing realistic price ratios is a
nontrivial sanity check (see Section 5), whereas with a very large parameter set as in v3 (even infinite in
v4), it would be difficult to draw any conclusions.
2venue offering a better marginal price after fees.3
As a result, some of the fundamental flow
may go to the AMM and contribute to aligning the price with the CEX, even when there
is no profitable roundtrip. We evaluate the expected PnL of the representative LP, which
comprises the fees accrued plus the change in marked-to-CEX value of the pool reserves.
Before moving on to our results, let us pause to highlight how our setup differs from the
existing literature studying the interaction of an AMM with a CEX (see also Section 1.3).
Most previous works assume that the CEX is frictionless—while trading on the AMM is
subject to a fee, trading on the CEX does not incur any fee or slippage. Then, trading on
the AMM should be attractive only to one side of the informed market; for instance, buyers
if the price on the AMM, inclusive of fee, is lower than the CEX price. The resulting trades
would be the ones with the highest adverse selection cost to LPs, and it is intuitive that
liquidity provision would never be beneficial in this situation. Previous works include noise
traders who trade on the AMM regardless of prices on the CEX. This adds trades that
are on average profitable to LPs as soon as the AMM fee is positive, so that a sufficiently
large volume of noise trades renders liquidity provision profitable. By contrast, our baseline
model does not have noise traders. While our fundamental traders have an exogenous
trading motive, they are informed about CEX prices and route their flow optimally between
the two venues.
In the absence of noise traders, a key reason that liquidity provision can be profitable
is that trading on the CEX is not free either. Indeed, both venues offer a combination of
price and slippage. Even when the AMM marginal price is inferior to the CEX price, the
AMM can be competitive for fundamental flow if its fee is lower. Specifically, a marginal
fundamental buyer prefers the AMM if AMM marginal price plus AMM fee is lower than
CEX price plus CEX fee. For an LP who marks assets to CEX prices and earns the AMM
fee, this means that the trade is potentially profitable.4
In the absence of free money from noise traders, the AMM needs to compete with the
CEX in terms of trading costs. This idea will be underscored by our quantitative results on
optimal AMM fees below, which will show that the AMM can make up for its stale pricing by
offering a competitive fee, and carve out a regime where LP provision is profitable without
noise traders. This is a conservative assessment: We agree with the literature that in reality
there are traders who will avoid the CEX even when its price is more attractive, for instance,
to avoid counterparty risk or Know Your Customer regulations. Adding noise traders to
our model as a third type of trader will only increase LP profitability, as is discussed in
Section 6 among other extensions of our baseline model.
1.2. Contributions and Results. Before discussing the insights derived from our model,
let us briefly highlight the implementation itself. To meet the computational demands of
large-scale experimentation, we provide an efficient, parallelized code base ready to deploy
on high-performance computing clusters. The implementation is modular and extensible, so
that interested researchers can run their own experiments. The code is publicly available.5
Thanks to our reduced-form modeling approach, we can produce comparative statics with
respect to any parameter, and that is key to our goal of understanding LP profitability.
3Equivalently, fundamental traders send all their orders to a smart router (aggregator) monitoring both
venues.
4If the AMM price inclusive of fee exceeds the CEX price without fee, the difference will be the LP’s marginal
net profit (which is therefore bounded from above by the CEX fee). If not, the trade results in a loss for
the LP.
5https://github.com/JasonSome/cpmm-trading/tree/master
3Assuming that the CEX price follows a driftless geometric Brownian motion,6
the price
dynamics are summarized by a single volatility parameter σ. In line with previous findings,
our simulation shows that all else equal, expected LP PnL is decreasing in volatility. On the
other hand, it is increasing in fundamental demand, which was not considered before.7
We
highlight the mechanics leading to those effects by extensively analyzing (a) the distribution
of the ratio between AMM and CEX prices, which captures the adverse selection cost of
trades, and (b) the volume attracted by the AMM, which multiplies the gross PnL of those
trades and additionally the LP’s fee earnings. Greater CEX price volatility is reflected
in wider dispersion of the price ratio distribution, thus increasing adverse selection and
reducing PnL. Increasing fundamental demand generally means that the AMM captures
more volume, increasing fee revenue. More importantly, this additional fundamental flow
tends to trade at prices that imply smaller adverse selection costs or even profits (depending
on the relationship between AMM and CEX fees): When CEX prices sufficiently deviate
from AMM prices, the AMM attracts one-sided fundamental flow (only buyers or only
sellers) which acts as a reverting drift on the price ratio process even before arbitrage
opportunities arise.8
This effect is clearly seen in the narrowing price ratio distribution, and
exemplifies how volatility and fundamental demand tend to act in opposition in shaping the
ratio distribution. Such an effect has not been observed in previous works.
While our reduced form model allows us to discuss comparative statics individually for
each parameter, it is important to remember that market characteristics are likely corre-
lated in practice. For instance, our simulation also shows that if a volatility increase is
accompanied by a surge in demand, the net effect on LP PnL can be approximately flat.
However, all else fixed, a sufficiently large volatility will always render liquidity provision
unprofitable: in the limit σ → ∞, both the arbitrage volume and the per-trade adverse
selection loss tend to infinity. A detailed discussion of LP profitability and comparative
statics can be found in Section 3.
Next, we highlight the complex role of the AMM fee, likely the most interesting parameter
in light of the current discussions about AMM design. Higher fees increase per-trade rev-
enues for the LP and defend against adverse selection. On the other hand, higher fees reduce
the volume captured by the AMM, reducing fee income but also increasing price stickiness
as the reverting force of fundamental flow is reduced and arbitrage requires greater price
disparities. This economic narrative is central to our analysis: the LP cannot choose its fee
in a vacuum; instead, fee-setting happens in direct competition with the CEX, and every
basis-point change carries downstream consequences for trade volume, price action, revenue
generation, and arbitrage activity.
For a broad range of volatility and fundamental demand parameters (which we interpret
as normal market conditions), we find that there is a unique optimal AMM fee maximizing
expected LP PnL. The optimal fee undercuts the representative CEX trading cost η0, in
line with the aforementioned idea that the AMM needs to be competitive with the CEX in
terms of slippage. Indeed, slippage on the AMM is given by AMM fee plus price impact
6
While we focus here on geometric Brownian motion, the simulation accepts any time series as input for the
CEX price, be it a sample from a stochastic process or real-world price data as discussed in Section 5.
7PnL is also increasing in noise trader volume if such traders are included. This agrees with previous findings
and is also straightforward analytically as fee income from noise trader volume amounts to a direct transfer
to LPs.
8If prices deviate even more, the ratio process is reflected at the threshold where the arbitrage opportunity
arises.
4whereas slippage on the CEX is given by the CEX fee alone, hence undercutting by a modest
amount is an intuitive choice for a competitive AMM fee. Nevertheless, it seems that we
are the first to make this direct connection between optimal AMM fee and trading costs on
the CEX.
At this point, it is important to remember that our CEX fee represents all trading costs
on the CEX. While assuming a single representative number is useful for comparative statics
and the empirical experiments below, we also note that in reality, different traders incur
different costs when trading on a CEX, for instance because nominal fees differ by volume
tiers9
or because the slippage of a sophisticated execution algorithm is smaller than for a
simple market order. On the other hand, the AMM fee is the same for all traders. Thus, in
practice, the message of undercutting may be interpreted as offering a better fee for some
traders, perhaps retail customers that form a relatively important fraction in cryptocurrency
markets. See also the discussion in Section 6.3. In Section 5, the representative CEX fee is
determined by calibrating to the price ratio distribution rather than using posted nominal
fees.
Returning to the discussion of simulation results, the optimal AMM fee is increasing in
volatility and decreasing in demand throughout the regime of normal markets, reflecting the
changing tradeoff between volume capture and defending against adverse selection losses.10
The sensitivity of the optimal fee, as well as the level itself, are significantly lower than in
previous studies. While our optimal AMM fee is below the CEX fee, previous models implied
optimal AMM fees at very elevated levels, for instance around 125–250 basis points (bps)
for the volatility range presented in the recent work of He et al. [25, Figure 5]. While the
methodology in previous works is quite different, it is intuitive that inclusion of fundamental
traders generally lowers the optimal AMM fee. Our findings align with the recent popularity
of 5 bps pools (see also Section 7).
Our simulation allows us to study in detail the PnL regret, i.e., how much PnL is dimin-
ished when the fee is not optimal. We find that in the regime of normal markets, and more
generally as long as volatility does not exceed the threshold where liquidity provision be-
comes unprofitable, the regret is quite moderate when the AMM fee is kept at a well-chosen
value below the CEX fee. This has important practical implications for AMM design, as
discussed in Section 7.
When the volatility exceeds that threshold, the optimal fee ceases to exist: while the
optimum is quite stable up to the threshold (hovering slightly below the CEX fee), the
optimal fee is infinite above the threshold as the LP prefers to halt trading on the AMM.
The precise threshold depends on the market parameters—if an increase in volatility is
accompanied by a sufficiently large increase in fundamental trading volume, the optimal
fee remains fairly stable. Our results on AMM fees are reported in Section 4, and some
practical conclusions for a threshold-type dynamic fee schedule are in Section 7.
Our empirical analysis in Section 5 demonstrates that our stylized framework, despite
its parsimony, captures relevant features of real-world markets. Because our simulation
accommodates arbitrary price trajectories, we can feed observed CEX time series directly
into the model for calibration and testing. Using high-frequency data for ETH/USDC from
9For instance, https://www.binance.com/en/fee/schedule lists a maker/taker fee of 10 basis points (bps)
for users with a 30-day trading volume under $1M, decreasing to 4/5.2 bps for a user with a $100M volume
(as of June 30, 2025).
10
In a regime of small fundamental demand, the optimal fee is decreasing-then-increasing. An explanation
can be found in Section 4.
5Binance and Uniswap, we estimate the model’s three core parameters: the CEX fee, price
volatility, and fundamental demand. With only these inputs, the model reproduces a price
ratio distribution that closely aligns with empirical observations. The calibrated CEX fee
converges near posted taker rates, and estimated volatility falls within plausible intraday
ranges. Importantly, when testing LP performance on real price data, we find that lowering
the AMM fee below the effective CEX level improves LP profitability—a conclusion that
reinforces our simulation results and underscores the model’s practical relevance.
To confirm that our conclusions are robust, Section 6 considers several extensions of the
baseline model. These extensions include adding noise traders that always prefer the AMM
to the CEX, additional fee levels, changing trading frequency, and CEX prices with drift.
1.3. Related Literature. The interaction between an AMM and a CEX, and the resulting
adverse selection on the AMM, have been studied in a number of papers. Capponi and Jia
[13] consider a group of LPs that maximize expected profits by controlling the amount of
liquidity they provide in a one-period model. The authors observe that LPs in CFMMs
suffer losses when risky asset prices move, and calculate the welfare-maximizing convexity
of the CFMM invariant, trading off losses from arbitrage with increased price impact of
investors. Lehar and Parlour [28] show theoretically and empirically that the equilibrium
pool size is smaller when asset volatility is higher and larger when noise trading volume
is higher, and characterize a number of other stylized facts of Uniswap liquidity pools.
Hasbrouck et al. [24] show that when a group of LPs can choose between providing liquidity
and an outside investment, a higher unit trading fee on the AMM can increase equilibrium
liquidity provision and trading volume on the AMM, due to decreasing price impact.
Closest to our model in terms of order flow routing is the work of Aoyagi and Ito [5] which
examines the amount of liquidity in a one-period equilibrium model where LPs factor in
opportunity cost. The main similarity with our modeling is that in addition to noise traders,
there are informed traders choosing between the AMM and CEX depending on prices, bid-
ask spread on CEX and fee on AMM. However, in their model, informed traders always
cause a loss to LPs (and noise traders always cause a gain, see Lemmas 5 and 6 in [5]).
The equilibrium amount of liquidity provision is found to be hump-shaped in volatility.
Moreover, there is a positive spillover effect between liquidity on AMM and CEX, contrary
to the centralization phenomenon usually observed between venues of the same type. Like
most equilibrium models, [5] does not aim to (and is unable to) investigate LP profitability;
indeed, the equilibrium is determined by imposing the break-even condition that expected
LP PnL equals zero.
Closest in terms of goal, namely studying optimal AMM fees when competing with a
CEX, is the work of He et al. [25]. In a dynamic model where CEX prices are exogenous
and arbitrageurs adjust prices on the AMM while noise traders ignore price differences,
LPs are risk-averse and optimize dynamically between liquidity provision in the AMM and
investment in the CEX. (Here, LPs are active—the amount of liquidity provided responds
to every CEX price increment, with no gas fees.) Among other questions, the authors study
the optimal fee level on the AMM. Assuming stationary distribution of the state variables,
LPs’ expected utility is numerically found to be increasing-then-decreasing with respect to
the fee, and the optimal fee is increasing with respect to volatility. Qualitatively, this is
in line with our results in Section 4. Quantitatively, the optimal AMM fee is reported at
125–250 bps for a range of volatilities, but we note that numerical values may ultimately
6be driven by assumptions on risk aversion coefficients and sharp ratios that are difficult to
pin down in practice. No such assumptions are needed in our risk-neutral model.
In terms of approach, the present work is complementary to the above. While equilibrium
and utility-maximization approaches can give valuable insights into interactions, the present
reduced-form approach is more directly applicable by practitioners. As shown in Section 5,
real-world time series can be used for asset prices and latent parameters can be calibrated to
observables such as asset price ratios. While we cannot hope to infer equilibrium reactions,
we can observe realistic patterns of order flow and LP PnL at existing market conditions.
As mentioned, dynamic AMM fees (that vary with market conditions) have been proposed
to reduce LVR and are one motivation for the present study. There are existing protocols
that leverage dynamic fees in an empirical manner to provide liquidity providers with better
arbitrage protection (e.g., LFJ [29] and Elsts [19]), including in the context of Uniswap v4
hook design, but they are mostly using ad-hoc solutions based on real-time empirics. For
instance, LFJ [29] implements the variable fee as a quadratic function of instantaneous
volatility. Attempts to understand the benefits of dynamic fees have appeared in the work of
Cao et al. [12] who conduct an optimization over volatility-dependent fees in a static single-
period model without CEX competition. More similar to the present work, Volosnikov
et al. [33] study profitability depending on fixed or sigmoid volatility-dependent fees by
simulation, but again without taking competition by a CEX into account. Fritsch [21]
studies fees in a static Nash equilibrium between competing AMMs, also without a CEX.
The systematic study of fees as a function of market conditions in a competitive setting is
a crucial gap in the literature that is addressed by our work.
A different stream of literature studies potential AMM designs with a price oracle, es-
sentially meaning that the CEX price is a state variable of the AMM. Bergault et al. [8]
use a mean-variance framework inspired by portfolio theory to investigate the use of non-
adversarial quotes for AMMs and perform simulations under various market conditions;
see also [9, 10] for extensions. Aqsha et al. [6] use a principal-agent framework to study
the optimal mechanism to redistribute a CFMM’s fixed fee to LPs in order to maximize
order flow. Most recently, Baggiani et al. [7] study optimal dynamic fees in a CFMM using
stochastic control. We emphasize that the present setting is fundamentally different as the
adverse selection issue is directly related to the latency in price discovery which would be
removed by the oracle.11
There is by now a substantial literature on AMMs, in addition to the classical literature
on market microstructure. For a more extensive review, see for instance He et al. [25,
Section 1.1].
1.4. Organization. The remainder of this paper is structured as follows. Section 2 de-
scribes the market model consisting of CEX, DEX, traders, and LP, together with the
sequence of their interactions. Section 3 investigates how market characteristics affect LP
returns and highlights the underlying mechanisms by analyzing the price ratio and volume
distributions. Section 4 focuses on the optimal fee for LPs and its robustness. Section 5
contains the empirical analysis applying our model to Binance and Uniswap data. Section 6
confirms that our main findings are robust to several extensions of the model. Section 7
11
For example, when (as in [7]) there are two dynamic fees (for buying and selling) and both can depend
on the CEX price, then one possible fee schedule is to make AMM prices (inclusive of fees) equal to CEX
prices, eliminating adverse selection.
7concludes. Appendix A gives pseudo-code for the simulation algorithm. Appendix B de-
tails various summary statistics for the simulations with different parameters underlying
the price ratio histograms shown in Figure 6 of Section 3. Appendix C reports an analyt-
ical derivation for a limiting regime of large demand and small volatility that is discussed
Section 4.
2. The Model
We propose a stylized model of an economy with two assets and two trading venues.
The first asset, denoted X, serves as a reference currency or numéraire. The second asset,
denoted Y , plays the role of the risky asset. In our examples, we take X to be the stablecoin
USDC and Y to be ETH. The two assets are traded against one another on a centralized
exchange (CEX) and a decentralized exchange (DEX). Trading evolves over a time interval
[0,T] and is simulated as N discrete periods of equal length δt = T/N. There will be three
types of agents: arbitrageurs, fundamental traders, and liquidity providers. (Section 6
additionally considers noise traders.) Below, we first detail each of these ingredients, then
explain how they interact in the simulation.
CEX. The price S0
t of the risky asset Y at time t (denominated in units of X) on the
CEX follows exogenous dynamics. Most of our exposition uses a simulated price, namely,
a geometric Brownian motion with zero drift: S0
t has continuous dynamics
(2.1) log(S0
t /S0
0) = −
1
2
σ2
t + σWt, t ≥ 0,
where W = (Wt)t≥0 is a standard Brownian motion, and this process is sampled at the
discrete trading periods. We choose this model for simplicity and parsimony. That said, our
implementation can accept an arbitrary time series as input for S0
t , and Section 5 presents
an empirical analysis where S0
t follows a historical time series from Binance instead of a
simulated price. Section 6 considers simulated processes with drift.
As we are modeling a situation where the CEX is a highly liquid trading venue (relative
to the DEX), trading on the CEX incurs a proportional fee η0 > 0, but no price impact. We
emphasize that this fee stands in for all trading costs on the CEX (such as bid-ask spread
for market orders, adverse selection costs for limit orders, etc.), thus may be larger than the
nominal fee posted on exchanges like Binance. The role of η0 will be highlighted in greater
detail below, and generalizations of this modeling are discussed in Section 6.
The mechanics of the CEX are then straightforward: traders can swap any quantity y > 0
of Y against yS0
t of X while paying the fee η0yS0
t (in units of X) to third parties.
DEX. The DEX is implemented as constant product market maker (CPMM), akin to
Uniswap v2.12
The initial reserves (X0,Y0) of the two assets are seeded by a single repre-
sentative liquidity provider (LP) who passively holds inventory of both assets and collects
all trading fees that traders incur on the AMM.
Prices on the AMM are governed by the constant product invariant XtYt = k, where
(Xt,Yt) are the reserves of the two assets at time t. The marginal price of Y is S1
t = Xt/Yt,
and the cost for trading a quantity ∆ of Y (positive for buy, negative for sell) is
Pt[∆] =
Xt
Yt − ∆
.
12Our simulation code is modular and can accommodate arbitrary AMM designs, for instance G3Ms.
8After such a trade, the reserves update via
Xt+δt = Xt + Pt[∆] · ∆, Yt+δt = Yt − ∆, (2.2)
and the new marginal price becomes
S1
t+δt =
Xt+δt
Yt+δt
=

Yt
Yt − ∆
2
S1
t . (2.3)
A proportional fee η1 > 0 is charged on every DEX trade and paid directly to the LP (i.e.,
the amount η1Pt[∆]|∆| is paid in currency X).13
Since we assume that LPs do not mint or
burn shares over time, the evolution of the reserves (Xt,Yt) is entirely dictated by trader
activity via (2.2).
Traders. In addition to the LP, two types of traders interact with the venues: fundamental
traders and arbitrageurs. Fundamental traders have an exogenous trading motive whereas
arbitrageurs only act when they can attain a round-trip profit from buying on one venue
and immediately selling on the other.
Indeed, if the DEX offers a better sell price after fees than the CEX buy price after fees
(or vice versa), arbitrageurs act to exploit the mispricing. For instance, if
S0
t (1 + η0
) < S1
t (1 − η1
)
it would be profitable to buy on the CEX and sell on the DEX. The size of the arbitrage
trade is determined endogenously such as to maximize the profit, or equivalently, to align
post-trade marginal prices (inclusive of fees). Explicitly, the arbitrageur’s trade on the DEX
is
∆A
t = Yt 1 −
s
S1
t (1 − η1)
S0
t (1 + η0)
!
∧ 0 + Yt 1 −
s
S1
t (1 + η1)
S0
t (1 − η0)
!
∨ 0. (2.4)
On the other hand, fundamental traders have exogenous demand. They consist of funda-
mental buyers and sellers which must execute quantities ∆B
t > 0 and ∆S
t < 0, respectively.
While those quantities can be specified arbitrarily for each trading period of the simulation,
we shall keep them constant over time for parsimony. Buyers and sellers act sequentially
in randomized order: either buyers act first, or sellers. Their order flow is routed optimally
between the venues, as though processed by a perfectly efficient aggregator (see Section 6
for a generalization). This means that traders send their marginal volume to the DEX if
and only if the marginal price inclusive of fee is better than the price on the CEX inclusive
of fee. Volume will be routed to the DEX until either the desired quantity is satisfied or
the price on the DEX becomes aligned with the CEX (inclusive of fees). At that point, the
remaining volume will be routed to the CEX as there is no price impact on the CEX. In
formulas, buyers trade
∆B,DEX
t = ∆B
t ∧ Yt 1 −
s
S1
t (1 + η1)
S0
t (1 + η0)
!!
∨ 0 (2.5)
13In practice, two methods have been adopted for the collection of fees. Either fees are paid into a separate
account, as in our model, or fees are deposited into the AMM pool. We have implemented both methods
and found very similar results, thus use the method which leads to simpler formulas and has been favored
in recent practice.
9on the DEX and sellers trade
∆S,DEX
t = ∆S
t ∨ Yt 1 −
s
S1
t (1 − η1)
S0
t (1 − η0)
!!
∧ 0. (2.6)
0.0 0.2 0.4 0.6 0.8 1.0
Time
0.996
0.998
1.000
1.002
1.004
Price Ratio
Asset Price Ratio (Before Trading)
0.0 0.2 0.4 0.6 0.8 1.0
Time
0.996
0.998
1.000
1.002
1.004
Price Ratio
Asset Price Ratio (After Trading)
AMMPrice/CEXPrice ArbitrageBoundary BuyRegionBoundary SellRegionBoundary
Figure 1. Sample trajectory of the asset price ratio Rt = S1
t /S0
t before and
after trading on the DEX. Outside of the orange lines arbitrageurs act and
reflect the price ratio. Above the red line the AMM captures fundamental
sellers and the ratio is pushed down. Below the blue line the AMM captures
fundamental buyers and the ratio is pushed up. The center band represents
the region where the AMM captures both buy and sell flow. The figure
shows the cumulative effect of arbitrageurs and fundamental traders.
We observe in Equations (2.4) to (2.6) that the decisions of all traders can be neatly
expressed in terms of the price ratio process Rt = S1
t /S0
t . Comparing the above expressions,
we see that buyers send marginal volume to the DEX if Rt < (1+η0)/(1+η1), while seller
volume arrives if Rt > (1−η0)/(1−η1). Similarly, arbitrageurs trade if Rt < (1−η0)/(1+η1)
or Rt > (1 + η0)/(1 − η1). We call those thresholds the buy region boundary, sell region
boundary, and arbitrage region boundaries, respectively. These regions will play a crucial
role in our analysis of LP profitability; they are visualized alongside an illustrative evolution
of Rt in Figure 1.
LP PnL. We evaluate LP performance through both unhedged and hedged profit-and-loss
(PnL). Since we consider the CEX to be the primary venue of price formation, we mark
holdings in Y to the CEX price (rather than the DEX price). The unhedged (LP) PnL is
defined as the change in the marked-to-market value of the pool reserves plus the total of
fees collected,
Unhedged PnL = XT + YT · S0
T − (X0 + Y0 · S0
0) + Fees Accrued.
When the price S0
t is volatile, the unhedged PnL tends to be very noisy and primarily
driven by the exposure to the price fluctuations of the Y holdings. Practitioners are more
interested in the hedged PnL which isolates the effects of trading and fees by removing the
price risk. Specifically, hedging takes place on the CEX; it proceeds by initializing a position
of Y0 units of the risky asset and rebalancing each period to match the current Yt reserve
10level. We let H = (Ht)t≥0 denote the value of the hedging portfolio which is initialized at
H0 = X0 + Y0S0
0 and updated in a self-financing fashion according to
Ht+δt = Ht + Yt · (S0
t+δt − S0
t ).
The cost of adjusting the hedge is computed using CEX prices and is frictionless in our
baseline simulation.14
The hedged LP PnL is therefore
Hedged PnL = Unhedged PnL −
N X
i=1
Y(i−1)δt ·

S0
iδt − S0
(i−1)δt

.
We see that when S0 is a martingale, the value of the hedging portfolio is given in terms
of a martingale transform which is again a martingale. Throughout the paper, the expected
PnL will be an important metric. Because of the martingale nature of the hedge, the
expected value of the hedged and unhedged PnL are identical, hence either could be used.
On a trajectory basis, the hedged PnL is significantly less noisy—as seen in the order of
magnitude difference between the representative trajectories displayed in the lower panel of
Figure 2.
0.0 0.2 0.4 0.6 0.8 1.0
Time
59.5
60.0
60.5
61.0
61.5
Value
Pool Value ($ Millions)
PoolValue
HedgingPortfolioValue
0.0 0.2 0.4 0.6 0.8 1.0
Time
0
2
4
6
8
10
12
Error
Tracking Error ($1,000s)
TrackingError(Hedge-Pool)
0.0 0.2 0.4 0.6 0.8 1.0
Time
0.0
2.5
5.0
7.5
10.0
12.5
15.0
17.5
PnL
Hedged PnL ($1,000s)
0.0 0.2 0.4 0.6 0.8 1.0
Time
500
0
500
1000
1500
PnL
Unhedged PnL ($1,000s)
Figure 2. (Upper Left) Sample trajectory of the Pool Value Xt +YtS0
t and
hedging portfolio value Ht. (Upper Right) Corresponding evolution of the
tracking error over time. (Bottom Left) Sample trajectory of Hedged PnL,
to be compared with the Unhedged PnL (Bottom Right).
14For large LPs this simplifying assumption may be justified by internal netting. As an extension, our
implementation also allows one to specify a separate, non-zero fee for hedge trades; this is discussed in
Section 6.
11It is useful to group the pool value and hedge value into a single term, the tracking error,
Tracking Error = Ht − Xt − Yt · S0
t ,
so that we may write
Hedged PnL = Fees Accrued − Tracking Error.
The tracking error is exactly the loss-versus-rebalancing (LVR) of [31] except that we mark
asset values to the CEX price instead of the DEX. It can be thought of as reflecting LP
losses that are attributable to the adverse selection on the DEX brought on by stale prices.
A visualization of the tracking error is given in the upper right panel of Figure 2.
Simulation Steps. We adopt a turn-based simulation in which each period of length δt is
subdivided into four further steps:
1. The CEX price is incremented.
2. Arbitrageurs compare the new CEX price with the DEX price and, if applicable,
execute a roundtrip trade of size (2.4). This trade changes the marginal DEX price
according to (2.3), removing the arbitrage opportunity.
3. An independent coin-flip decides whether fundamental buyers or sellers move first.
In the former case, buyers trade quantity (2.5) on the DEX whose marginal price
adjusts according to (2.3). Next, sellers trade quantity (2.6) on the DEX, again
changing its price. In the latter case, the order is reversed.
4. The LP updates their hedging portfolio on the CEX.
The simulation loops over those steps; Appendix A provides pseudocode summarizing
the implementation. Some models in the literature use noise traders whose actions can lead
to arbitrage opportunities, hence those models include a second intervention of arbitrageurs
exploiting those. In the present baseline model, the actions of fundamental traders in Step 3
never create arbitrage opportunities, hence it would be futile to include another arbitrageur
trade.
3. Determinants of LP Profitability
In this section, we examine how LP profitability is influenced by fundamental demand,
market volatility, and fee levels. To that end, we investigate the comparative statics of the
simulation model described in the preceding section.
Our baseline considers a one-day trading horizon with a one-minute time resolution,
corresponding to T = 1 and N = 1440. The AMM is initialized with $30,000,000 in
numéraire reserves (X) and 10,000 units of the risky asset (Y ), implying an initial price of
S1
0 = $3,000 and a total pool value of $60,000,000. Prices on the CEX are set to the same
initial value, S0
0 = $3,000, and evolve according to (2.1) with volatility σ = 0.04. The default
CEX fee is η0 = 20 basis points (bps). Fundamental buy and sell demand arrives at a rate
of 5,000 units of Y per day, uniformly distributed across time (i.e., ∆B
t = −∆S
t = 5,000 · δt
per minute), which corresponds to a total unsigned daily demand of 10,000 units or 100% of
the pool’s initial inventory. This configuration serves as a reference point for our analysis.
A detailed discussion of the plausibility of these benchmark values, including an empirical
calibration to real market data, is provided in Section 5.
We begin by motivating our use of expected PnL as a performance metric for LPs. Figure 3
shows the distribution of terminal hedged PnL across different AMM fee levels. While the
PnL variance changes only modestly with the fee, the expected PnL is much more sensitive.
122.5 5.0 7.5 10.0 12.5 15.0 17.5 20.0
HedgedPnL($1,000s)
0.0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
Density
HedgedPnLDistributionAcross ¹Values
AMMFee
¹=8bps
¹=11bps
¹=14bps
¹=17bps
¹=20bps
Figure 3. Histograms of terminal hedged PnL across 100,000 simulations,
colored by AMM fee level. Dashed lines mark the distribution means.
Moreover, some fee levels consistently outperform others, and PnL is not monotonic in the
fee level, highlighting its central role in determining LP returns.
Before delving into the details, we observe two basic features of LP profitability. Figure 4
plots average PnL across varying levels of fundamental demand and volatility, holding the
AMM fee fixed at η1 = 15 bps.
Two broad patterns emerge: expected PnL declines with volatility and increases with
the size of fundamental demand. The detailed analysis in this section will show how greater
price dispersion increases the likelihood of stale execution and adverse selection, lowering
PnL. On the other hand, when more flow interacts with the AMM, the LP earns more fee
revenue. More importantly, we will see that this additional fundamental flow tends to trade
at prices that are less stale, an effect not seen in previous models with only (uninformed)
noise traders.
3.1. The Price Ratio. The ratio between AMM and CEX price is a key quantity to
understand why trades generate gains or losses for the LP. Following the concept of toxic
vs. benign flow in classical finance, it is tempting to think of arbitrageur trades as inherently
“bad” for the LP and fundamental trades as “good.” However, this dichotomy is misleading.
The next part of our analysis builds on a key insight: whether a trade benefits or harms the
LP does not depend on the identity or intent of the trader, but rather on the price ratio at
which the trade occurs.
To build intuition, we characterize the conditions under which a marginal (infinitesimally
small) trade on the DEX yields a profit for the LP, accounting for hedging activity on the
CEX. Suppose a trader executes a small buy order of size ∆ > 0 units of the risky asset Y .
The LP gives up ∆ units of Y , receives approximately ∆ · S1
t units of the numéraire asset
X at the current AMM price, and collects an additional fee of η1 · ∆ · S1
t . To maintain a
neutral inventory, the LP rebalances by purchasing ∆ units of Y on the CEX at price S0
t ,
incurring a cost of ∆·S0
t . The marginal change in the LP’s hedged PnL (expressed in units
130
5
10
15
20
25
30
TotalDemand(1,000s)
0.00
0.02
0.04
0.06
0.08
0.10
40
20
0
20
40
PnLGiven15bpsFee($1,000s)
40
20
0
20
40
0
5
10
15
20
25
30
TotalDemand(1,000s)
0.00
0.02
0.04
0.06
0.08
0.10
40
20
0
20
40
PnLGiven15bpsFee($1,000s)
40
20
0
20
40
Figure 4. Expected PnL as a function of fundamental demand and volatil-
ity under the baseline AMM fee of 15 bps. The left and right figures show
two different orientations of the same surface.
Table 1. Trading and Profitability Thresholds
Trade Condition Profit Condition
Fundamental Buyers Rt ≤
1 + η0
1 + η1
Rt ≥
1
1 + η1
Fundamental Sellers Rt ≥
1 − η0
1 − η1
Rt ≤
1
1 − η1
Arbitrage Buyers Rt ≤
1 − η0
1 + η1
N/A
Arbitrage Sellers Rt ≥
1 + η0
1 − η1
N/A
of X) is therefore
Change in Hedged PnL ≈ ∆ ·

(1 + η1
)S1
t − S0
t

= ∆ · S0
t

(1 + η1
)Rt − 1

.
Similarly, for a small sell trade ∆ < 0, the LP receives |∆| units of Y , pays |∆| · S1
t in X,
and hedges by selling |∆| units of Y on the CEX at price S0
t , yielding a revenue of |∆|·S0
t .
The resulting impact on the hedged PnL is
Change in Hedged PnL ≈ ∆ ·

(1 − η1
)S1
t − S0
t

= ∆ · S0
t

(1 − η1
)Rt − 1

.
Evidently, for a buy trade (∆ > 0), the LP earns a profit on a marginal trade if and only if
Rt > 1/(1 + η1). For a sell trade (∆ < 0), the LP earns a profit on a marginal trade if and
only if Rt < 1/(1 − η1). We combine these thresholds with those of the preceding section
in Table 1, and illustrate their sensitivity to the choice of the AMM fee η1 in Figure 5.
We see that the LP benefits from trades that occur when the AMM price does not deviate
too far from the CEX reference. In particular, both buy and sell trades are profitable for
140.0000 0.0005 0.0010 0.0015 0.0020 0.0025 0.0030 0.0035 0.0040
1
0.006
0.004
0.002
0.000
0.002
0.004
0.006
Log(Price Ratio)
RegionClassificationvs. 1 (fixed 0=20bps)
Buyers&Sellers(sellersprofitable)
Buyers&Sellers(bothprofitable)
Buyers&Sellers(buyersprofitable)
Buyers(unprofitable)
Sellers(unprofitable)
Buyers(profitable)
Sellers(profitable)
Arbitrageurs(unprofitable)
Notrades
Figure 5. Illustration of how the critical regions from Table 1 change with
the AMM fee η1, shown in terms of the log price ratio.
the LP when the price ratio lies within the interval

1
1 + η1
,
1
1 − η1

.
We refer to this as the profit region: any marginal trade occurring within this band yields
a net gain for the hedged LP, regardless of trade direction. Outside this region, one side of
the market results in a loss for the LP, even if the flow originates from fundamental traders.
A related concept is the buy-sell region, defined (when η1 ≤ η0) by

1 − η0
1 − η1
,
1 + η0
1 − η1

.
This is the range of price ratios in which both fundamental buyers and sellers prefer trading
on the AMM over the CEX, allowing the LP to capture two-sided flow. When η1 > η0, this
region becomes empty and the DEX is never simultaneously optimal for both sides of the
market.
Crucially, the profit and buy-sell regions respond differently to the AMM fee η1, and
there is no consistent inclusion relationship between them. As η1 increases, the profit region
expands but the buy-sell region shrinks. Figure 5 illustrates this interaction. When η1 is
small, it is possible for the buy and sell thresholds to lie outside the profit region, meaning
the LP captures two-sided flow even when some trades are marginally unprofitable. By
contrast, as η1 ↑ η0, the profit region will fully contain the buy-sell boundaries.
When the price ratio leaves the broader no-arbitrage region

1 − η0
1 + η1
,
1 + η0
1 + η1

,
arbitrageurs intervene to realign prices across venues. The no-arbitrage region always con-
tains the profit region, since η0 ≥ 0, and arbitrage trades—by construction—are always
unprofitable for the LP. Figure 5 demonstrates that as η1 increases, the arbitrage thresholds
are pushed outwards. While this reduces the frequency of loss-making arbitrage trades,
from the LP’s perspective this should be balanced by the effects on the other regions.
15Our model can be compared to the one of Glosten and Milgrom [22]. There, market
makers defensively widen spreads because they cannot distinguish benign flow from informed
flow that predicts future price movements. Here, fees play an analogous role, as the AMM
fee cannot depend on the current CEX price or the trader motive.
3.2. Distribution of the Price Ratio. The preceding classification of regions provides
a static view of trade incentives and profitability but offers no insight into how often the
AMM/CEX price ratio falls within each region. Next, we study the distribution of the price
ratio, which determines the occupation times of the profit, buy-sell, and arbitrage bands,
and hence offers first insights into the LP PnL.
3.2.1. Sensitivity to Fees. The first row of Figure 6 shows histograms of the log price ratio,
log(Rt) = log(S1
t /S0
t ), sampled immediately before trade execution (i.e., between Steps 1
and 2 as listed at the end of Section 2), across various AMM fee levels ranging from 5 to
25 basis points. The second row of Figure 6 illustrates the closely related influence of the
CEX fee on the price ratio distribution. These distributions are computed using data from
100,000 simulation runs, aggregated over all time steps. When one parameter is varied, the
others are set to the baseline values introduced at the beginning of this section. Simulation
statistics like expected profit and volume captured are reported in Appendix B.
At low AMM fee levels relative to the CEX (e.g., η1 = 5 bps and η0 = 20 bps, or η1 = 15
bps and η0 = 60 bps), the AMM offers competitive execution and captures a large share
of trading volume. The buy-sell region is wide, and the resulting bidirectional fundamental
flow flattens the central portion of the distribution. Indeed, when buy and sell trades
compensate one another, the log ratio process locally resembles a Brownian motion without
drift. The flat part of the distribution (see the second row and last column of Figure 6 for a
pronounced example) can be compared to the stationary distribution of Brownian motion
reflected in a strip, which is a uniform distribution. Overall, this regime produces a broad
and diffuse shape. While a large fraction of the transactions originates from fundamental
traders, many of the trades occur at price ratios outside the LP’s profit region, leading to
poor PnL despite high turnover.
As the AMM fee increases, the widening of the profit region and the decline in the AMM’s
competitiveness restrict participation to trades that remain viable despite the higher cost.
This leads to a contraction of the price ratio distribution around its center due to the price
impact of asymmetric fundamental flow: when only one side of the market interacts with
the AMM, trade flow pushes prices directionally. At high (relative) fees (e.g., η1 ≥ η0 = 20
bps), only unilateral flow is captured and this effect becomes most pronounced. In fact,
when η1 > η0 the order of the buy and sell boundaries switches so that they enclose a region
where the AMM receives no order flow. At the same time, a widening of the no-arbitrage
region leads to slightly longer tails of the distribution at large values of η1. The overall effect
of increasing η1 is thus a transition from high-turnover, low-margin activity with relatively
diffuse pricing to high-margin, selective trading centered near the CEX price.
While both the AMM and CEX fees expand the arbitrage region by pushing the arbitrage
thresholds outward, an important distinction arises in their impact on the buy-sell region.
Specifically, increasing the AMM fee shrinks this region, while increasing the CEX fee ex-
pands it by making AMM execution comparatively more favorable for fundamental traders.
The net effect is a broader, flatter ratio distribution as η0 increases. Notably, although the
CEX fee modifies the attractiveness of AMM execution, it leaves the boundaries of the LP’s
profit region unaffected.
160.005 0.000 0.005
0
50
100
150
200
250
300
Ratio Density ¹=5bps
0.005 0.000 0.005
¹=10bps
0.005 0.000 0.005
¹=15bps
0.005 0.000 0.005
¹=20bps
0.005 0.000 0.005
¹=25bps
Arbitrageboundaries Buyboundary Sellboundary Profitboundaries
0.005 0.000 0.005
0
50
100
150
200
250
300
Ratio Density
=0bps
0.005 0.000 0.005
=5bps
0.005 0.000 0.005
=20bps
0.005 0.000 0.005
=35bps
0.005 0.000 0.005
=60bps
Arbitrageboundaries Buyboundary Sellboundary Profitboundaries
0.005 0.000 0.005
0
100
200
300
400
500
Ratio Density
=2.5%
0.005 0.000 0.005
=3.25%
0.005 0.000 0.005
=4.0%
0.005 0.000 0.005
=4.75%
0.005 0.000 0.005
=5.5%
Arbitrageboundaries Buyboundary Sellboundary Profitboundaries
0.005 0.000 0.005
0
50
100
150
200
250
300
Ratio Density
B=| S|=1000
0.005 0.000 0.005
B=| S|=3000
0.005 0.000 0.005
B=| S|=5000
0.005 0.000 0.005
B=| S|=7000
0.005 0.000 0.005
B=| S|=9000
Arbitrageboundaries Buyboundary Sellboundary Profitboundaries
Figure 6. Distributions of the log price ratio log(Rt) = log(S1
t /S0
t ) sam-
pled immediately before trade execution. The center panel of each row cor-
responds to the common benchmark setting: η1 = 15 bps, η0 = 20 bps,
σ = 4%, and ∆B = |∆S| = 5,000. Each row illustrates how the shape of
this distribution varies with (top) the AMM fee η1, (second) the CEX fee
η0, (third) market volatility σ, and (bottom) fundamental demand. Distri-
butions are aggregated over 100,000 simulation paths. All other parameters
follow the baseline specification in Section 3. Statistics for each configura-
tion are reported in Appendix B.
3.2.2. Sensitivity to Volatility. The third row of Figure 6 depicts how the log price ratio
distribution changes with market volatility σ when the AMM fee η1 is fixed at 15 bps.
At low volatility (e.g., σ = 2.5%), the distribution is sharply concentrated near zero. In
this regime, the reference price evolves gradually, and fundamental order flow acts as a
17stabilizing force: when the price ratio escapes the buy-sell region, the impact from one-
sided trading is often enough to push the ratio back in and keep prices closely aligned with
the CEX, without any action from arbitrageurs. As a result, the AMM captures a large
share of fundamental flow, with much of it arriving in the profit region for this fee level (see
Appendix B for the numerical values).
As volatility increases, the distribution of log(Rt) becomes increasingly dispersed. At
high values of σ, fundamental demand is unable to adjust the AMM price by enough to
track the large swings in the reference price. This leads to more frequent and severe price
misalignments. A large number of trades occur outside of the profit region and at the
highest value illustrated, σ = 5.5%, a nontrivial fraction of the trades occur outside of the
arbitrage boundaries, implying that they are arbitrageur trades. This widening of the price
ratio distribution at high volatility levels contributes to the deterioration in LP profitability
observed above.
3.2.3. Sensitivity to Demand. The last row of Figure 6 illustrates how the distribution of
the log price ratio evolves with increasing levels of fundamental demand when η1 = 15 bps.
At low levels of demand, the ratio distribution has a broad and bulbous shape, and a large
fraction of the trading volume arrives while the price ratio is outside of the profit region.
As demand increases, we observe a notable increase in the concentration of the distribution
about zero.
This behavior can be attributed to the stronger directional pressure exerted by funda-
mental order flow. When demand is weak, price adjustments are sluggish and the AMM
quotes often lag behind the CEX value, which exposes the pool to adverse selection. As
demand increases, the consistent push from one-sided flow outside of the buy-sell region
creates a stabilizing drift that keeps AMM prices more tightly aligned with the CEX. The
result is twofold: not only does higher demand increase traded volume and hence the fee
revenue, but it also enhances the quality of execution from the LP’s perspective. (Of course,
there is a limit to this effect: even if fundamental demand were infinite, the finite liquidity
in the pool ensures that price impact would grow until traders are incentivized to transact
on the CEX.)
3.3. Trading Volume and Market Demand. Understanding where the price ratio spends
time is only part of the picture—LP profitability hinges on how much volume is transacted
in each region and the fees earned per trade. Fundamental order flow is directed to the
AMM when it offers better execution than the CEX for buy or sell orders. The competi-
tiveness of the AMM’s pricing, and hence the volume it captures, is shaped by the AMM
fee η1 and market volatility σ. Because fundamental traders are the only source of profitable
volume (see Section 3.1), it is critical to understand this relationship.
Figure 7 shows the expected volume of fundamental trades executed by the AMM and
the associated fee revenue over the simulation horizon. Since prices remain relatively stable
over the course of a day, fee revenue is roughly proportional to the product of captured
volume and the fee level η1. The most striking insight of Figure 7 is that, except at very
high volatility, volume and revenue strongly depend on the relationship between AMM
and CEX fee. At low volatility, even modestly undercutting the CEX fee enables the
AMM to capture almost all of the fundamental flow; a more detailed discussion of this
undercutting will follow in Section 4 in the context of optimizing the AMM fee. While this
effect is reduced as volatility increases, it remains important in a range of volatilities. As
volatility increases, AMM prices become stale more quickly, reducing their competitiveness.
180 5 10 15 20 25 30 35 40
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
0
2000
4000
6000
8000
10000
ExpectedFundamentalVolume
2000
4000
6000
8000
0 5 10 15 20 25 30 35 40
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
0
5
10
15
20
25
30
35
ExpectedFundamentalRevenue($1,000s)
10
20
30
Figure 7. (Left) Expected fundamental trader volume received by the
AMM as a function of η1 and σ. (Right) Corresponding fee revenue. Lower
volatility favors high capture rates, while revenue reflects the interaction of
volume and fee level.
0 5 10 15 20 25 30 35 40
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
0
1000
2000
3000
4000
5000
6000
ExpectedArbitrageurVolume
0
2000
4000
6000
0
5
10
15
20
25
30
35
40
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
0.0
2.5
5.0
7.5
10.0
12.5
15.0
17.5
20.0
ExpectedArbitrageurRevenue($1,000s)
0
5
10
15
20
Figure 8. (Left) Average arbitrageur volume received by the AMM across
combinations of AMM fee η1 and volatility σ. Higher volatility increases
arbitrage activity, while higher fees reduce it. (Right) Associated fee revenue
earned from these trades.
Maintaining volume under these conditions requires lowering fees, but this comes at the
cost of reduced revenue per trade. The result is a fundamental economic trade-off: greater
competitiveness erodes margins, and this tension intensifies in more volatile markets.
On the other hand, the relationship between arbitrage activity, AMM fee, and volatility is
relatively straightforward. Higher volatility increases price discrepancies between the AMM
and the CEX and hence the arbitrageur volume, as shown in the left panel of Figure 8. By
contrast, higher AMM fees reduce arbitrage incentives and thus lower arbitrage flow. The
19right panel reports the associated fee revenue from these trades. Although this revenue can
be considerable in high-volatility and high-fee settings, it is not sufficient to offset the losses
from adverse selection (as shown analytically in Section 3.1).
4. Optimal Fees and LP Performance
0
10
20
30
40
50
60
70
80
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
60
40
20
0
20
40
60
Expecte d PnL ($1,000 s)
=50bpsand B=| S|=2,500
20
40
60
60
40
20
0
10
20
30
40
50
60
70
80
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
50
0
50
100
150
200
250
300
350
Expecte d PnL ($1,000 s)
=50bpsand B=| S|=25,000
100
200
300
60
40
20
0
10
20
30
40
50
60
70
80
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
60
40
20
0
20
Expecte d PnL ($1,000 s)
=20bpsand B=| S|=2,500
10
20
60
40
20
0
0
10
20
30
40
50
60
70
80
1 (bps)
0.00
0.02
0.04
0.06
0.08
0.10
60
40
20
0
20
40
60
Expecte d PnL ($1,000 s)
=20bpsand B=| S|=25,000
20
40
60
60
40
20
0
Figure 9. Expected PnL surface as a function of the AMM fee η1 and mar-
ket volatility σ, shown under two different assumptions about fundamental
demand and CEX fee η0. The bottom row corresponds to the baseline fee of
η0 = 20 bps while the top row uses η0 = 50 bps. The left column illustrates
a demand of ∆B = |∆S| = 2,500, below our baseline, while the right column
increases demand to the (very high) level of ∆B = |∆S| = 25,000. The
expected PnL for our baseline of ∆B = |∆S| = 5,000 is represented in the
right panel of Figure 10 below.
The preceding discussion highlighted that the AMM fee η1 governs a trade-off: higher
fees increase per-trade revenues for the LP and defend against adverse selection; at the
same time, they reduce the AMM’s competitiveness, lowering the volume of fundamental
20order flow it attracts and increasing price stickiness. In this section, we distill these inter-
actions and determine the AMM fee level that maximizes LP profitability for given market
conditions.
Figure 9 plots the expected PnL surface as a function of η1 and volatility σ, for varying
levels of fundamental demand and different CEX fee benchmarks η0. A consistent pattern
emerges: for a broad range of volatilities σ, the optimal fee is strictly less than the CEX
fee, with the PnL surface exhibiting an interior maximum below η0. The maximum is
particularly pronounced for moderate volatility. As the CEX fee increases, the peak of the
surface shifts by a similar amount. In brief, the optimal fee for the AMM is to undercut
the CEX fee.
At this point it may be important to recall that our CEX fee η0 is a reduced-form rep-
resentation of the effective execution cost faced by market participants, not merely the
nominal fee posted by the exchange. Moreover, in practice, this cost (as well as the posted
fee) varies substantially across traders due to tiered fee schedules, volume-based discounts
and rebates, and optimal execution algorithms employed by sophisticated traders. Our par-
simonious model absorbs these nuances into a single parameter η0, representing an average
or effective benchmark. Consequently, the aforementioned undercutting does not mean that
the optimal AMM fee is lower, e.g., than a posted headline rate such as Binance’s taker fee,
but rather that it should remain competitive with the distribution of effective CEX trading
costs.15
A calibration to real-world data is provided in Section 5, and generalizations of the
fee structure are also discussed in Section 6.3.
Returning to Figure 9, we observe that increased volatility depresses PnL across all fee
levels, while increased demand raises it. At high levels of volatility, the interior maximum
disappears and expected PnL turns negative across all plausible fee values, indicating that
the LP would prefer an infinite AMM fee to prevent trading.
We also observe that greater demand smooths the relationship between PnL and optimal
AMM fee, consistent with the notion that an abundance of available order flow reduces the
sensitivity of performance to fee design. Of course, there is a limit to this effect. At the
extremes of demand, the liquidity in the pool is insufficient to absorb any marginal flow.
Likewise, at very high fee levels and low volatility, it is almost never optimal for traders to
engage with the pool regardless of aggregate demand.
The important Figure 10 extracts from the PnL surface the functional relationship be-
tween the optimal fee and market volatility σ for several levels of fundamental demand.
Overall, we observe a fairly complex behavior in the left panel—but note that the figure
shows a very wide parameter range. Next, we discuss this behavior, going from low to high
demand, or from the top-left to bottom-right curve. While we explain in detail how all the
shapes—including extreme regimes—are implied by the model, we emphasize that the most
important regime for practical purposes is likely closer to the benchmark regime discussed
in Sections 4.3 and 4.4 below.
4.1. Low Demand. For low to moderate levels of demand (darkest curves in the left panel
of Figure 10), the optimal fee exhibits a U-shape in σ, which we explain first.
15For very large demand, a proportional fee may not be a good proxy for price impact costs on the CEX.
Additional price impact would likely increase the optimal AMM fee, as the AMM competes with the overall
slippage on the CEX. We remark that adding nonlinear price impact on the CEX would substantially
complicate the order routing discussed in Section 2.
210.00 0.02 0.04 0.06 0.08 0.10
10
12
14
16
18
20
Fee (bps) OptimalFeeGivenDemand
CEXFee
5000
10000
15000
20000
25000
30000
Demand
0 5 10 15 20 25 30 35 40
1 (bps)
30
20
10
0
10
20
30
40
PnL ($1,000s)
ExpectedPnLforeach
CEXfee
0.01
0.02
0.03
0.04
0.05
0.06
Figure 10. (Left) Optimal AMM fee as function of volatility, for several
levels of total fundamental demand ∆B + |∆S|. (Right) Expected PnL as a
function of the AMM fee (for the baseline total demand of 10,000) with the
numerically optimal fee marked by ×, for several levels of volatility. Where
× is at 40 bps, the PnL is always negative and the true optimum is η1 = ∞.
When there is no volatility (i.e., σ = 0), the AMM can capture all of the fundamental
demand by undercutting the CEX by just enough to remain the preferred venue after
accounting for price impact. While there is still a nonlinear relationship between LP profit
and fee levels due to the influence of η1 on demand, this is a good proxy for what happens
when demand is low. Indeed, if ∆B = |∆S| ≈ 0 and σ = 0 then the buyers have next to no
price impact and (since S1
t ≈ S0
t ≡ S0
0 = S1
0)
Fee Revenue ≈ η1
(∆B
+ |∆S
|)S1
01{η1<η0}.
This is clearly maximized by taking η1 arbitrarily close (but not equal) to η0.
For these lower demand levels, the gap between the CEX fee and the left endpoint of the
curves in Figure 10 (left panel) is approximately such that the AMM remains the preferred
venue even after most of the fundamental buyers (or sellers) pushed its price in one direction.
As a result, the gap initially increases with fundamental demand. Since the external price
is constant, there is no possibility of arbitrage in this environment. This story persists in
very low-volatility environments. Indeed, since prices are relatively stable, the AMM can
undercut the CEX by a modest amount and still attract the lion’s share of the fundamental
volume.
As volatility starts to increase, the fluctuations in the reference price become more of
a concern as AMM quotes become stale more quickly. Nonetheless, the dominant theme
for low volatility is volume capture. Remaining competitive in this environment requires a
deeper fee discount, leading to a decline in the optimal fee (the decreasing part of the U-
shape). At intermediate levels of volatility, the directional pressure from fundamental flow
is no longer sufficient to keep prices aligned. In this regime, the optimal fee flattens out,
reflecting a delicate balance between capturing order flow and earning adequate revenue per
trade.
Beyond a critical volatility threshold, adverse selection begins to dominate the LP’s
decisions. The optimal fee starts to rise—gradually at first, and then more quickly—as
22the LP shifts focus from volume to per-trade PnL and aims to avoid severely unprofitable
executions. Eventually, the optimal fee reaches a plateau below the CEX fee. This plateau
represents the stability of the argmax also seen in the right panel of Figure 10 (shown
there for higher demand). It remains near this level until a tipping point is reached: when
volatility becomes too severe, expected PnL is negative for all fee levels and essentially
increasing in η1. At this stage, the optimal fee jumps to +∞, signaling that the LP would
prefer to shut down AMM activity.
4.2. Moderate to High Demand. As fundamental demand increases, the dependence
of the optimal fee on volatility σ becomes monotonically increasing. We also observe that
the optimal fee for σ = 0 decreases, toward approximately η0/2 = 10 bps for very large
demand.16
The limit of η0/2 = 10 bps can be understood analytically as follows. In the regime of
high demand, DEX liquidity remains finite, so the LP can only absorb a limited amount
of volume per time step. With abundant demand, buyers push the price ratio to the
buy boundary, and sellers push it to the sell boundary. Over time, the system oscillates
between these two points. By assuming we initialize the system at one of these boundaries
and randomizing the arrival of buyers and sellers, the AMM captures both sides of the
market 50% of the time, and one-sided trades otherwise. In expectation, this results in fee
revenue equivalent to 75% of a round-trip price movement from the buy boundary to the
sell boundary and back. Since the CEX price remains constant for σ = 0, both trade sizes
and LP proceeds are deterministic and can be computed explicitly. By expanding for small
η0,η1, we obtain the following leading-order approximation for the expected revenues (see
Appendix C for details)
1
N
E[Fee Revenue] ≈
3
4
X0 2η1
η0
− 2(η1
)2

.
Maximizing this expression with respect to η1 yields the approximate optimal fee η1,∗ ≈ η0/2
which is consistent with the behavior observed in Figure 10.
At this fee level, the LP’s profit boundaries and the buy-sell boundaries are nearly identi-
cal (see Table 1). We conclude that, in this regime, the LP’s objective shifts from maximiz-
ing order flow capture to optimizing fee revenue per unit of volume. This perspective also
clarifies why the optimal fee becomes strictly increasing in volatility σ as demand grows.
In low-demand settings, higher volatility reduces the AMM’s competitiveness by making
prices stale, necessitating lower fees to maintain flow capture. However, in high-demand
environments—where price ratios naturally hover near the profit boundaries due to high
levels of fundamental trading—volatility introduces the risk of prices drifting into unprof-
itable regions. To mitigate this, the LP increases fees, providing a buffer that preserves
favorable execution conditions.
That said, even with elevated demand, extreme volatility renders price swings so severe
that continued AMM operation becomes unprofitable, motivating the LP to once more exit
the market by setting prohibitively high fees, explaining the vertical part of the curves.
4.3. Benchmark Performance. The right panel of Figure 10 depicts the expected PnL
as a function of the AMM fee across a range of σ when demand is fixed at the baseline
16For low volatility regimes, the monotonicity of the optimal fee in demand breaks down at an intermediate
point. This is elucidated in Figure 23 of Appendix C.1, which illustrates that a shift in the expected PnL
curve’s maximum is responsible for this behavior.
23of ∆B = |∆S| = 5,000 (i.e., 10,000 units in total). The maxima corresponding to the left
panel of the figure are indicated by × markers. This demand falls squarely between the two
extremes discussed above. At this level, we no longer observe the decreasing part of the
U-shape that was prevalent at the lowest total demands of 2,000-4,000 units. At the same
time, we do not undercut the CEX as much as in the highest levels of 20,000-30,000 units.
In this intermediate regime, we see that when volatility is low, PnL is sharply peaked, and
too high of a fee can meaningfully impair performance. As volatility increases, the curvature
around the PnL maximum decreases, indicating reduced sensitivity to fee choice near the
optimum. Nonetheless, in the highest volatility regimes where PnL is always negative,
undercutting the CEX is extremely undesirable and any fee that allows for a meaningful
trading volume can result in significant losses.
0
5
10
15
20
25
30
TotalDemand(1,000s)
0.00
0.02
0.04
0.06
0.08
0.10
0
10
20
30
40
50
60
OptimalExpectedPnL($1,000s)
0
20
40
60
0.00 0.02 0.04 0.06 0.08 0.10
0
10
20
30
40
50
60
OptimalExpectedPnL($1,000s)
5000
10000
15000
20000
25000
Demand
Figure 11. (Left) Expected PnL surface under optimal fees from Figure 10,
shown as a function of volatility σ and total fundamental demand ∆B +|∆S|.
(Right) Cross-section of the same surface as a function of σ, with total
demand levels indicated by the color gradient.
4.4. Takeaways. Notably, for a broad range of intermediate volatility levels, a suitably
chosen constant fee performs reasonably well. Whereas, for very high volatility (relative to
demand) it is optimal for the LP to quote a prohibitively high fee, effectively shutting down
trading. This behavior aligns with established practice in traditional financial markets:
during market shocks, it is often prudent to widen spreads substantially—or even halt
trading altogether—to mitigate risk.
Figure 11 shows the expected PnL achieved under the optimal fee for each combination
of fundamental demand and volatility. Consistent with our original findings in Figure 4 for
fixed fees, the optimal PnL increases with the volume of fundamental flow and decreases
with volatility. As is to be expected, the LP performs best in settings with sustained,
bidirectional flow and relatively low price volatility.
While we have discussed the dynamics of the optimal AMM fee in detail, an important
practical takeaway is that expected PnL is relatively robust around a well-chosen constant
fee. As shown in the right panel of Figure 10, setting the AMM fee to roughly 70–80%
240
5
10
15
20
25
30
TotalDemand(1,000s)
0.00
0.02
0.04
0.06
0.08
0.10
0
10
20
30
40
50
OptimalPnLShortfallGiven15bpsFee($1,000s)
10
20
30
40
Figure 12. Shortfall in expected PnL relative to the optimum from Fig-
ure 11 when applying a fixed 15 bps AMM fee, as in Figure 4.
of the CEX fee yields only modest regret across a broad range of volatility and demand
levels.17
Here, regret refers to the shortfall between the expected PnL obtained with a fixed
fee and the maximum attainable PnL for each choice of market parameters (i.e., with the
optimal fee for those parameters). We visualize this shortfall in Figure 12 by applying a
15 bps AMM fee (approximately 75% of the CEX fee, η0 = 20 bps). We see that along
the diagonal of the (σ,∆B + |∆S|) plane, where volatility and demand increase together,
the regret from using a constant fee remains minimal. This suggests that in dynamic
environments, a fixed fee policy performs particularly well when demand and volatility are
positively correlated. On the other hand, in extremely high-volatility environments where
the LP would optimally choose to halt trading (i.e., set η1 = ∞), the performance loss from
maintaining a constant fee becomes substantial. Since cryptocurrency prices do experience
such episodes, this regime cannot be neglected.
5. Empirical Analysis
This section evaluates the empirical relevance of our stylized model and examines how
fee design affects AMM performance in realistic settings. Our goal is twofold: first, to test
whether the model, once calibrated to market data, can replicate key features of observed
price and volume dynamics; second, to assess the financial implications of fee optimization,
both in simulations and when applied to historical data. To this end, we calibrate the
model parameters using minute-level data for the ETH/USDC pair over January 2025,
then simulate trading under two fee regimes: the standard Uniswap v2 fee and the fee level
predicted by our theoretical optimization. The results show that implementing the optimal
fee leads to narrower trading bands and higher execution rates for both arbitrageurs and
fundamental traders. From a financial perspective, the AMM’s cumulative PnL improves
significantly under the optimal fee, particularly when inventory risk is actively managed.
This confirms that fee adjustments can meaningfully enhance AMM profitability, and that
17This rule of thumb can change based on the reference CEX fee η0
. See Section 5 for an example where
η0
≈ 10 bps.
25our modeling framework provides a practical tool to guide fee setting based on empirical
data.
5.1. Data. Our dataset consists of minute-by-minute records of reserve balances for the
ETH/USDC Uniswap v2 pool, extracted via Dune Analytics18
for the month of January
2025. Using these reserve quantities, we compute the implied DEX price at each timestamp
via the constant product formula. The pool applies a fixed fee of 30 basis points and begins
the month with reserves of $23,000,000 and 6,903 ETH. We also obtain minute-level swap
volume data for liquidity takers (LTs) in both directions (ETH to USDC and USDC to
ETH) over this period.
In parallel, we collect minute-level historical price data for the ETH/USDC pair from
Binance, covering the same month.19
This centralized exchange data serves as a reference
price to benchmark and calibrate our model against real market conditions.
5.2. Calibration. We calibrate our simulation model to the market data described above
for the ETH/USDC pair over the month of January 2025.20
The central object of interest
is the log price ratio process
rt := log(Rt),
computed at each minute from historical data. We construct an empirical histogram of this
process and seek to reproduce its distribution through simulation.
For simplicity, we assume that ∆B = |∆S| =: ¯ ∆, and that this rate is constant over time.
Note that the AMM fee η1 is publicly known. Specifically, we fix η1 to the Uniswap v2 fee
for the ETH/USDC pool, i.e.,
η1
= 30 bps.
Recall that for our model we assume that LPs are passive and precommit liquidity to the
pool for the entire trading horizon. We also treat fees as though they are disbursed directly
to the LP. In v2 market data, liquidity is added and withdrawn, and fees contribute to pool
liquidity. However, over the horizon we consider pool liquidity does not vary substantially
(see Figure 13). Consequently, we fix the liquidity used for calibration to be 2.3·107 USDC
and 6904 ETH, which roughly corresponds to the average values of the pool.
This allows us to reduce the calibration problem to three parameters:
• the volatility σ of the CEX price process S0,
• the effective CEX transaction cost η0,
• and the arrival rates ¯ ∆ of fundamental buyers and sellers, respectively.
Although historical volatility could be used for the value of σ, this leads to an over-
estimation of the volatility due to clustering effects, and we rather rely here on a model-
implied volatility that allows for a better fit to the price ratio. To estimate the parameters
(σ,η0, ¯ ∆), we adopt an approach that targets the distribution of the log price ratio between
the AMM and the CEX. This focus reflects our earlier finding that price ratio dynamics are
central to determining LP profitability. Concretely, we minimize the L2 distance ∥r̂t − rt∥2,
where rt is the empirical distribution of the log price ratio, computed from minute-level
Binance (CEX) and Uniswap (AMM) prices. The simulated counterpart, r̂t, is generated
18https://api.dune.com
19
Binance price data: https://data.binance.vision/?prefix=data/spot/monthly/klines/ETHUSDC/1m/.
20
We have repeated the same calibration procedure on earlier periods—particularly in 2020 and 2021, when
Uniswap v2 enjoyed greater liquidity—and obtained qualitatively similar results. We focus here on a recent
window to ensure the relevance of our findings.
260 5 10 15 20 25 30
1.61
1.62
1.63
1.64
1.65
Value
1e11
ConstantProductValue(ETH×USDC)
UniswapV2Pool January2025
0 5 10 15 20 25 30
4.4
4.6
4.8
5.0
5.2
1e7
TotalValueLocked(TVL)
UniswapV2Pool January2025
Time(January2025)
Figure 13. Left: evolution of the constant product XtYt over time in the
Uniswap V2 ETH/USDC pool during January 2025. Right: corresponding
total value locked (TVL) Xt + S1
t Yt = 2Xt.
from Monte Carlo simulations using the geometric Brownian motion dynamics (2.1) for the
CEX and the stylized AMM trade process detailed in Section 2. The minimization is carried
out using a grid search implemented with the Optuna optimization library [2]. This method
produces consistent estimates for the volatility σ and the effective transaction cost η0, and
accurately captures the empirical shape of the log-ratio distribution, as seen in Figure 14.
In particular, this demonstrates that despite its stylized nature, our model can produce
parameter values that faithfully capture key features of real-world trading dynamics. The
resulting calibrated parameters are reported in Table 2.
0.0125 0.0100 0.0075 0.0050 0.0025 0.0000 0.0025 0.0050
Logpriceratio
0
25
50
75
100
125
150
175
200
Density
DistributionoflogpriceratioforETHUSDC--2025-01
Simulationaftercalibration
Historical
Figure 14. Comparison between the historical distribution of the log price
ratio (bars) and the simulated distribution after calibration (solid line) for
the ETH-USDC pair over January 2025.
27Table 2. Calibrated parameters with η1 = 30 bps
Parameter Value Unit
Buy/sell rate ¯ ∆ 19,068 ETH/day
CEX trading cost η0 6.58 basis points (bps)
Daily volatility σ 2.60% day−1/2
Our model does not explicitly account for gas fees, which represent an additional cost
for traders interacting with the AMM. As a result, the value obtained for the CEX trading
cost η0 in Table 2 is likely downward-biased. To partially correct for this, we repeat the
calibration procedure while adjusting the AMM fee to η1 = 35 bps, thereby approximating
the additional gas cost incurred by DEX users. This yields the following estimates, presented
in Table 3, which provide a plausible range for η0 that better reflects the all-in trading costs
on both venues. Notably, the resulting value for η0 is consistent with observed taker fees
on Binance.
Table 3. Calibrated parameters with η1 = 35 bps
Parameter Value Unit
Buy/sell rate ¯ ∆ 10,338 ETH/day
CEX trading cost η0 11.78 basis points (bps)
Daily volatility σ 2.60% day−1/2
The difference in the estimated arrival rate of fundamental traders ¯ ∆ across the two cali-
brations should not be overinterpreted. High levels of demand tend to produce very similar
fits for the distribution of log price ratios when η1 is much larger than η0, making them
statistically hard to distinguish. As such, our estimates are best understood as providing a
plausible range of demand intensities consistent with the empirical price ratio distribution.
Remark 5.1. As a robustness check, we also performed the calibration by directly using
the historical Binance price series for S0, instead of simulating it as a geometric Brownian
motion. In this setup, the volatility σ is no longer a free parameter, and we calibrate only the
effective CEX transaction cost η0 and the net arrival rate ¯ ∆ of fundamental traders. We find
that this alternative procedure yields similar ranges for both parameters (specifically, ¯ ∆ =
11,684 ETH/day and η0 = 9.87 bps), reinforcing the robustness of our baseline calibration
and suggesting that the geometric Brownian motion assumption for S0 does not materially
affect the identification of key model features.
Remark 5.2. While the proposed calibration successfully captures the microstructural dy-
namics of the AMM, we observe in simulation that the trading volume captured by the AMM
is lower than its empirical counterpart (approximately 210 ETH/day versus 750 ETH/day
in practice). One possible explanation is the presence of “noise traders” who interact with
the AMM independently of relative prices or fees, for idiosyncratic or exogenous reasons.
An alternative modeling route is thus to interpret the residual volume gap as arising from
such non-strategic order flow. In this interpretation, matching the empirical trading volume
would require adding roughly 540 ETH/day of noise-driven trades, which corresponds to
28less than 5% of the fundamental volume estimated by our model. This addition has no
meaningful impact on the qualitative results that follow, since optimal fee setting remains
primarily driven by strategic, incentive-compatible order flow. For clarity of exposition,
we omit noise traders from the main analysis, but develop the corresponding extension in
Section 6.2. We emphasize that it is expected that realized volume will differ since our
model is conservative. Even if we ignore other motivations for trading with the AMM,
our simulation logic assumes that traders have perfect knowledge of market prices and can
always route optimally, which can fail to hold in practice.
5.3. Numerical analysis. We now perform a simulation based on the stylized model and
the parameter values estimated in the previous subsection. For the CEX transaction cost,
we set η0 = 9.18 bps, which lies at the midpoint of the range identified through the two
calibration procedures. Similarly, we set the fundamental demand rate to ¯ ∆ = 14,704
ETH/day, representing an intermediate value between the two previously estimated demand
levels. The simulation is carried out on a minute-by-minute basis over an entire month.
Figure 15 reports the expected PnL of liquidity providers as a function of the AMM fee η1,
for various volatility levels in a neighborhood of the calibrated value. We also include
a benchmark curve computed using historical CEX prices instead of simulated geometric
Brownian motion paths, while keeping the same trade simulation procedure.
The results confirm that the optimal strategy consistently involves undercutting the CEX
fee. Moreover, the maximizer of expected PnL remains stable across different volatility val-
ues, highlighting the robustness of our framework. Importantly, the fact that the optimal
fee remains nearly unchanged when switching from simulated to historical prices suggests
that our stylized price model suffices to capture the core tradeoffs involved in fee design.
This provides strong support for using simulation-based approaches to optimize AMM pa-
rameters, even when abstracting away from complex real-world dynamics such as stochastic
volatility and price jumps.
0 5 10 15 20 25 30 35
1 (bps)
100
0
100
200
300
ExpectedPnL($1,000s)
Simulated =2.00%
Simulated =2.20%
Simulated =2.40%
Simulated =2.80%
Simulated =3.00%
Simulated =3.20%
Simulated =3.40%
Simulated =3.60%
Historicalprices
0
Figure 15. Expected PnL of liquidity providers as a function of the AMM
fee η1 using historical CEX prices (in red), compared to simulated prices
under different volatility levels.
29To assess the practical impact of fee design, we evaluate AMM performance on historical
price data. Using the volatility estimated in calibration, we identified in the above analysis
that the expected PnL is maximized around η1 = 5.42 bps—slightly below the effective
CEX fee η0. As in the earlier analysis of Section 4, this value represents an optimal trade-off
between competitiveness and profitability, encouraging volume without unduly sacrificing
fee revenue.
To test the real-world relevance of this result, we run two simulations using historical
minute-by-minute Binance data:
• In the first, we set η1 = 30 bps, matching the Uniswap v2 fee for ETH/USDC.
• In the second, we rerun the simulation with the optimal fee η1 = 5.42 bps.
Figures 16 and 17 display the results under the standard fee η1 = 30 bps. We observe
wide arbitrage bands and sparse trading, reflecting the deterrent effect of high transaction
costs. The resulting final PnL, both for the hedged and unhedged strategies, is negative
due to limited flow and fewer opportunities to charge trading fees. Echoing the findings
of Section 4, PnL deteriorates markedly during the sharp increase in volatility observed
between days 18 and 20 in Figure 16.
0 5 10 15 20 25 30
Time
0.985
0.990
0.995
1.000
1.005
1.010
1.015
1.020
Price Ratio
Asset Price Ratio (Before Trading)
AMMPrice/CEXPrice ArbitrageBoundary BuyRegionBoundary SellRegionBoundary
Figure 16. Asset price ratio between AMM and CEX prices before trading,
based on historical Binance data, with arbitrage and trading region bound-
aries indicated.
Next, we rerun the same experiment with the optimal fee η1 = 5.42 bps. The result-
ing dynamics are shown in Figures 18 and 19. With lower fees, we observe a noticeable
narrowing of both arbitrage and trading regions. This leads to more frequent arbitrage
interventions and significantly increased volume from fundamental traders. Nonetheless,
PnL still declines during the day 18 to 20 volatility spike21
which marks a period when the
LP would have benefited from levying a much larger fee.
Overall, the hedged PnL improves substantially and becomes positive under the optimal
fee, while the unhedged PnL remains largely unchanged—being mostly driven by the un-
derlying price path. This highlights that fee optimization is most effective when inventory
21This coincides with the days leading up to the U.S. presidential inauguration (January 20, 2025).
300 5 10 15 20 25 30
Time
15.0
12.5
10.0
7.5
5.0
2.5
0.0
2.5
PnL
Hedged PnL ($1,000s)
0 5 10 15 20 25 30
Time
3000
2000
1000
0
1000
2000
3000
PnL
Unhedged PnL ($1,000s)
Figure 17. Cumulative profit and loss (PnL) for hedged (left) and un-
hedged (right) AMM strategies over the simulation period using historical
data, expressed in thousands of USD, with fee η1 = 30 bps.
0 5 10 15 20 25 30
Time
0.990
0.995
1.000
1.005
1.010
1.015
Price Ratio
Asset Price Ratio (Before Trading)
AMMPrice/CEXPrice ArbitrageBoundary BuyRegionBoundary SellRegionBoundary
Figure 18. Asset price ratio between AMM and CEX prices before trading
with optimal DEX fee η1 = 5.42 bps, based on historical Binance data.
risk is actively managed. By lowering its fees, the AMM invites more arbitrage activity,
but more importantly it unlocks a much larger share of profitable flow from fundamental
traders. The result is a robust increase in PnL.
These findings reinforce a key insight from our earlier analysis: excessive protection
against arbitrage can come at the expense of participation from profitable, non-arbitrage
trading flows. Striking the right balance is therefore essential. Rather than minimizing
arbitrage outright, effective fee design should aim to maximize total value captured by
liquidity providers, even if that requires tolerating some arbitrage as part of a broader,
healthy market ecosystem. Our empirical results suggest that modestly undercutting the
effective CEX fee during stable conditions, combined with significantly increasing fees during
310 5 10 15 20 25 30
Time
0
25
50
75
100
125
150
175
PnL
Hedged PnL ($1,000s)
0 5 10 15 20 25 30
Time
3000
2000
1000
0
1000
2000
3000
PnL
Unhedged PnL ($1,000s)
Figure 19. Cumulative profit and loss (PnL) for hedged (left) and un-
hedged (right) AMM strategies over the simulation period with optimal fee
η1 = 5.42 bps using historical data.
periods of heightened volatility, provides a practical path to improving LP performance.
This principle aligns with the design choices seen in recent protocols such as Uniswap v3,
which introduced multiple fee tiers to reflect differing asset profiles, and Uniswap v4, which
further enables dynamic fee customization via hooks—underscoring the growing relevance
of adaptive fee mechanisms in AMM design.
6. Extensions to the Model Design
In this section we briefly address several possible extensions of our baseline model. We
fix the parameters specified at the beginning of Section 3 as a reference point and assess
the impact of each extension in isolation. As we will see, our previous findings are largely
robust to perturbations in the model design.
6.1. Trading Frequency. As the number of trading periods N increases—holding total
daily fundamental demand constant—the market effectively distributes the same aggregate
flow across a greater number of smaller trades. As a result, higher trading frequencies allow
the AMM to better absorb fundamental order flow, as each individual trade imposes only
a small price impact. This allows the AMM to remain competitive for a larger fraction of
the total volume and in turn, enhances LP profitability by increasing the volume captured
at each fee level.
This overall performance improvement driven by the trading frequency is illustrated in the
left panel of Figure 20. At sufficiently high frequencies, we heuristically observe convergence
toward a continuous-time limit. A rigorous analytic treatment of this limiting regime using
stochastic process theory will be reported in future work.
6.2. Noise Traders. As noted in the Introduction, there likely exist market participants
who trade on the DEX even in situations where informed fundamental traders choose not to.
We refer to these participants as noise traders, though their behavior can stem from a range
of plausible exogenous motives. For example, some traders may prefer the DEX due to its
reduced compliance burden, seeking to avoid know-your-customer (KYC) requirements on
centralized exchanges for privacy or convenience reasons. Moreover, it is likely that many
320 5 10 15 20 25 30 35 40
1 (bps)
10
5
0
5
10
15
20
ExpectedPnLbyTradingFrequency($1,000s)
0 5 10 15 20 25 30 35 40
1 (bps)
10
5
0
5
10
15
20
ExpectedPnLbyNoiseVolume($1,000s)
Figure 20. (Left) Expected PnL of the LP as the trading frequency N
increases from 100 to 2000. (Right) Expected PnL as the noise volume
increases from 0 to 500 units of Y per day. In both panels the increase in
the parameter (i.e., N, noise volume) is represented through a color gradient
from dark to light.
traders lack perfect information about cross-venue pricing, causing them to frequently route
orders in a manner that appears suboptimal ex-post.
There are various ways to model such participants. For simplicity, we consider noise
trader flow to be unconditional and insensitive to any reasonable price discrepancies across
venues. Specifically, we assume that in each period, a fixed volume of noise trades arrives on
the DEX, divided evenly between buy and sell orders. These trades occur after fundamental
traders transact, and their symmetric nature ensures they exert no direct influence on the
price ratio distribution. Their sole effect is to increase the fee revenue earned by the LP.
Naturally, the assumption of unconditional noise flow is valid only over a restricted fee
range. As η1 → ∞, execution costs on the DEX would preclude all participation, including
that of noise traders. Absent such a constraint, rational traders would abstain from inter-
acting with the DEX, while noise-driven volume would yield unbounded profits to the LP.
Accordingly, we limit noise flow to fee levels that are economically plausible.
The right panel of Figure 20 illustrates the impact of introducing noise trader flow up
to 5% of the baseline total unsigned fundamental demand (i.e., 500 units of Y per day).
Even when this flow is completely insensitive to η1, the qualitative conclusions from Sec-
tion 4 remain intact for all reasonable fee levels. In particular, while noise flow raises LP
profitability across the board, the optimal AMM fee continues to lie strictly below the fee
charged on the CEX.
6.3. Alternative Fees. We can extend the baseline framework to incorporate more realis-
tic fee structures by introducing two additional parameters: an arbitrageur-specific fee ηA
and a hedging fee ηH applied to the LP’s CEX trades. These fees capture a more nuanced
distinction between market participants. For one, arbitrageurs are often sophisticated ac-
tors who may face lower effective fees than other traders. Likewise, LPs typically incur
strictly positive costs when rebalancing inventory that differ from those faced by funda-
mental traders. While perhaps non-zero, the hedging fee ηH, which represents the LP’s
33effective execution cost on the CEX, still ought to be lower than the standard fee η0 due to
internal netting, tiered fee schedules, or other preferential arrangements.
0 5 10 15 20 25 30 35 40
1 (bps)
20
10
0
10
ExpectedPnLbyHedgingCost($1,000s)
0 5 10 15 20 25 30 35 40
1 (bps)
10
5
0
5
10
15
20
ExpectedPnLbyArbitrageurFee($1,000s)
Figure 21. (Left) Expected PnL as the hedging cost ηH increases from 0 to
η0. (Right) Expected PnL as the arbitrageur fee ηA increases from 0 to η0.
All of the curves are illustrated on a color gradient from dark to light as ηH
and ηA increase.
In view of the tiers for the nominal fees that CEXs levy on their customers’ trades based
on monthly trading volume, one could also consider a distribution of fundamental trader
fees instead of a single value. However, modeling this introduces ambiguity around how to
specify trader heterogeneity and so, we do not pursue this latter extension here in detail.
In effect, varying fundamental trader fees simply alters the decision thresholds for routing
volume to the DEX, and is partly covered by our discussion. Specifically, fundamental
traders with a high CEX fee would route almost all their flow to the DEX, making them
similar to noise traders (see Section 6.2), whereas fundamental traders with a low CEX fee
would route almost all their flow to the CEX and hence become inconsequential for our
analysis. In summary, having a spectrum of fundamental trader fees is similar to reducing
fundamental demand and adding noise traders.
The introduction of a hedging fee ηH modifies the analysis of Section 2 by increasing
the LP’s effective cost of inventory adjustments on the CEX. Accounting for this fee, the
marginal change in the LP’s hedged PnL for a small buy trade (∆ > 0) becomes
Change in Hedged PnL ≈ ∆ · S0
t

(1 + η1
)Rt − (1 + ηH
)

,
and for a small sell trade (∆ < 0),
Change in Hedged PnL ≈ ∆ · S0
t

(1 − η1
)Rt − (1 − ηH
)

.
The updated profitability thresholds are then given by
Rt ≥
1 + ηH
1 + η1
(buy trades), Rt ≤
1 − ηH
1 − η1
(sell trades)
with net effect being that ηH compresses the LP’s profit region. As illustrated in Figure 21,
since this addition does not change the ratio distribution or volume traded, the additional
cost can only decrease the profitability of the LP.
34On the other hand, introducing a lower arbitrageur fee ηA < η0 pushes the arbitrage
boundaries inwards towards the profit region. In the extreme case ηA = 0 and ηH = 0, the
arbitrage and profit boundaries coincide. Thus, in this regime arbitrageurs reflect the price
ratio into the region where trading is profitable for the DEX. As demonstrated in Figure
21, this general intuition persists for strictly positive values of ηA, and LP profitability
improves as ηA decreases. We collect these observations about the changes to the trading
regions of Table 1 in the updated Table 4.
Table 4. Generalized Trading and Profitability Thresholds
Trade Condition Profit Condition
Fundamental Buyers Rt ≤
1 + η0
1 + η1
Rt ≥
1 + ηH
1 + η1
Fundamental Sellers Rt ≥
1 − η0
1 − η1
Rt ≤
1 − ηH
1 − η1
Arbitrage Buyers Rt ≤
1 − ηA
1 + η1
N/A
Arbitrage Sellers Rt ≥
1 + ηA
1 − η1
N/A
6.4. Alternative Price Dynamics. Building on the empirical analysis of Section 5, we
can investigate the influence of adding additional characteristics to the price series dynamics.
Figure 22 illustrates the sensitivity of the LP’s PnL to prices that exhibit a trend (left) and
mean reverting dynamics (right).
We implement the trend by augmenting the reference price dynamics in (2.1) to include
a drift parameter µ ∈ R,
(6.1) log(S0
t /S0
0) = µ − 1
2σ2

t + σWt, t ≥ 0.
Similarly, the mean reverting dynamics are implemented by modeling S0
t as the exponential
of an Ornstein-Uhlenbeck (OU) process,
(6.2) log(S0
t /S0
0) =
Z t
0
κ(θ − log(S0
s))ds + σWt, t ≥ 0.
Here, κ > 0 is the mean reverting force and θ ∈ R is the reference level. For Figure 22 we
fix θ = log(S0
0) = log(3,000).
We see only minor variations of the expected PnL surface for reasonable choices of the
new parameters µ and κ. Near the optimal fee, the expected (hedged) PnL appears to
improve modestly as the trend goes from µ = −4% to µ = 4%. We also see a slight
improvement to profitability for fees η1 < η0 when introducing a mean reverting force.22
Consistent with the analysis of Section 5, we conclude that the general form of the PnL
22We note that when the price process is not a martingale, the hedging strategy exhibits a non-zero expected
PnL. In Figure 22, we observe a cancellation between two effects: the impact of price dynamics on the
unhedged PnL and their effect on the performance of the hedging portfolio. For example, when the price
of asset Y increases, both the pool and the hedging portfolio experience gains since they are long Y , and
these gains partially offset each other. While an LP with perfect knowledge of the price dynamics might opt
not to hedge, we do not assume such clairvoyance. To be consistent with our main analysis we focus on the
baseline case in which the LP hedges by default.
350 5 10 15 20 25 30 35 40
1 (bps)
10
5
0
5
10
15
ExpectedPnLbyCEXPriceDrift($1,000s)
0 5 10 15 20 25 30 35 40
1 (bps)
10
5
0
5
10
15
20
ExpectedPnLbyMeanRevertingForce($1,000s)
Figure 22. (Left) Expected PnL for drift µ ∈ [−0.04,0.04]. (Right) Ex-
pected PnL for mean reverting force κ ∈ [0,100]. In both cases the PnL
curves are shown on a color gradient from dark to light as µ and κ increase.
surface and the overall findings of Section 4 are generally robust to changes in the price
dynamics. Importantly, the existence of a maximum in η1 below the (effective) CEX fee
persists in this setting.
7. Conclusion
Using a parsimonious yet flexible reduced-form model of CEX-DEX interaction, we have
studied the expected PnL and optimal trading fees for passive liquidity provision to a
CPMM as a function of market conditions including volatility and demand. We have also
highlighted the mechanisms underlying these dependencies through extensive comparative
statics. Our simulation can be calibrated to market data, reproducing realistic price ratio
distributions and yielding quantitative, actionable insights.
Our results link the optimal AMM fee level to the trading cost on the CEX and suggest
that fees should be competitive with those costs during business-as-usual periods, in par-
ticular, potentially lower than the 30 bps fee that was implemented in Uniswap v2 and is
still often considered a default for ETH-USDC and comparable pairs. This aligns with the
recent popularity of 5 bps Uniswap v3 and v4 pools.23
In our model, the optimal fee remains
remarkably stable throughout normal market conditions. However, our results also suggest
that passive liquidity providers need protection during periods of high volatility, such as
a high fee that discourages adverse selection on the AMM. Complementary to theoreti-
cal studies in toy models, our insights are directly implementable in practice. Specifically,
Uniswap v4 hooks could be used to implement a threshold-type dynamic AMM fee which
takes two possible values, one that competes with CEX trading costs and a higher rate
designed to limit adverse selection in periods of extreme volatility.
23For ETH-USDC, 5 bps far dominates 30 bps on Uniswap v4 as of June 30, 2025, with $130.6M vs.
$5.3M total value locked. Uniswap v3 has $94M total value locked on 5 bps vs. $51M on 30 bps. Source:
https://app.uniswap.org/explore/pools/ethereum
36Acknowledgements
The authors thank Patrick Chang, Fayçal Drissi, Ruizhe Jia, Roger Lee, Xin Wan, and
numerous conference participants at the Fields Institute and the University of Chicago
for helpful discussions. The authors also acknowledge support from a Columbia Univer-
sity CFDT Research Grant and the use of computing resources from Columbia Univer-
sity’s Shared Research Computing Facility project, which is supported by NIH Research
Facility Improvement Grant 1G20RR030893-01, and associated funds from the New York
State Empire State Development, Division of Science Technology and Innovation (NYS-
TAR) Contract C090171, both awarded April 15, 2010. S. Campbell is supported in part
by an NSERC Fellowship (PDF-599675-2025), and M. Nutz is supported in part by NSF
Grants DMS-2407074 and DMS-2106056. J. Milionis’s research is supported in part by NSF
awards CNS-2212745, CCF-2332922, CCF-2212233, DMS-2134059, and CCF-1763970, by
an Onassis Foundation Scholarship, and an A.G. Leventis educational grant.
Disclosures
The third author is currently working with blockchain companies not directly involved in
AMMs, advising companies on marketplace and incentive design, and has worked with com-
panies involved in creating automated market making protocols, including some referenced
in this work. The other authors declare that they do not have any competing interests.
Notwithstanding, the ideas and opinions expressed herein are those of the authors, rather
than of any of these companies or their affiliates, and should not be construed as or relied
upon in any manner as investment, legal, tax, or other advice.
References
[1] Austin Adams, Ciamac Moallemi, Sara Reynolds, and Dan Robinson. “am-AMM: An
Auction-Managed Automated Market Maker”. In: arXiv preprint arXiv:2403.03367
(2024).
[2] Takuya Akiba, Shotaro Sano, Toshihiko Yanase, Takeru Ohta, and Masanori Koyama.
“Optuna: A next-generation hyperparameter optimization framework”. In: Proceed-
ings of the 25th ACM SIGKDD International Conference on Knowledge Discovery &
Data Mining. 2019, pp. 2623–2631.
[3] Algebra Protocol. ALGEBRA Ecosystem: Decentralized exchange. 2023. url:
https : / / algebra . finance / static / Algerbra % 20Tech % 20Paper -
15411d15f8653a81d5f7f574bfe655ad.pdf (visited on 11/10/2023).
[4] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra.
“An analysis of Uniswap markets”. In: arXiv preprint arXiv:1911.03380 (2019).
[5] Jun Aoyagi and Yuki Ito. “Coexisting Exchange Platforms: Limit Order Books and
Automated Market Makers”. SSRN 3808755. 2024.
[6] Alif Aqsha, Philippe Bergault, and Leandro Sánchez-Betancourt. Equilibrium Re-
ward for Liquidity Providers in Automated Market Makers. 2025. arXiv: 2503.22502
[q-fin.TR]. url: https://arxiv.org/abs/2503.22502.
[7] Leonardo Baggiani, Martin Herdegen, and Leandro Sánchez-Betancourt. Optimal Dy-
namic Fees in Automated Market Makers. 2025. arXiv: 2506.02869 [q-fin.TR]. url:
https://arxiv.org/abs/2506.02869.
37[8] Philippe Bergault, Louis Bertucci, David Bouba, and Olivier Guéant. “Automated
market makers: mean-variance analysis of LPs payoffs and design of pricing functions”.
en. In: Digital Finance 6.2 (June 2024), pp. 225–247. issn: 2524-6186. doi: 10.1007/
s42521-023-00101-0. url: https://doi.org/10.1007/s42521-023-00101-0
(visited on 06/17/2025).
[9] Philippe Bergault, Louis Bertucci, David Bouba, Olivier Guéant, and Julien Guil-
bert. Automated Market Making: the case of Pegged Assets. 2024. arXiv: 2411.08145
[q-fin.TR]. url: https://arxiv.org/abs/2411.08145.
[10] Philippe Bergault, Louis Bertucci, David Bouba, Olivier Guéant, and Julien Guilbert.
Price-Aware Automated Market Makers: Models Beyond Brownian Prices and Static
Liquidity. 2024. arXiv: 2405.03496 [q-fin.TR]. url: https://arxiv.org/abs/
2405.03496.
[11] Andrea Canidio and Robin Fritsch. “Arbitrageurs’ profits, LVR, and sandwich attacks:
batch trading as an AMM design response”. In: arXiv preprint arXiv:2307.02074
(2023).
[12] David Cao, Leonid Kogan, Gerry Tsoukalas, and Brett Hemenway Falk. A Struc-
tural Model of Automated Market Making. Available at SSRN: https://ssrn.com/
abstract=4591447. 2023.
[13] Agostino Capponi and Ruizhe Jia. “The adoption of blockchain-based decentralized
exchanges”. In: arXiv preprint arXiv:2103.08842 (2021).
[14] Álvaro Cartea, Fayçal Drissi, and Marcello Monga. “Decentralized Finance and Auto-
mated Market Making: Predictable Loss and Optimal Liquidity Provision”. In: SIAM
Journal on Financial Mathematics 15.3 (2024), pp. 931–959.
[15] Álvaro Cartea, Fayçal Drissi, and Marcello Monga. “Predictable losses of liquidity pro-
vision in constant function markets and concentrated liquidity markets”. In: Applied
Mathematical Finance 30.2 (2023), pp. 69–93.
[16] Cata Labs. Optimising LP performance part 2: Dynamic fees. Nov. 2023. url: https:
//blog.catalyst.exchange/optimising-lp-performance-part-2-dynamic-
fees/ (visited on 11/10/2023).
[17] CrocSwap. Usage of Markout to Calculate LP Profitability in Uniswap V3. en. 2022.
url: https://crocswap.medium.com/usage-of-markout-to-calculate-lp-
profitability-in-uniswap-v3-e32773b1a88e (visited on 06/30/2025).
[18] Atis Elsts. Conceptualizing Uniswap v3 LP profit and loss. en. Jan. 2023. url: https:
//atise.medium.com/conceptualizing-uniswap-v3-lp-profit-and-loss-
ecbae6e09644 (visited on 06/30/2025).
[19] Atis Elsts. Dynamic fees for automated market makers: liquidity, volatility, and col-
lected fees. en. May 2024. url: https://atise.medium.com/dynamic- fees-
for-automated-market-makers-liquidity-volatility-and-collected-fees-
db211da18d0d.
[20] Fenbushi Capital. Ending LP’s Losing Game: Exploring the Loss-Versus-
Rebalancing (LVR) Problem and its Solutions. Oct. 2023. url: https :
/ / mirror . xyz / 0xbdA5bCe76bF62d97D9C9dF0425CC10079Df1aD75 /
bWOCccjVC7eoYKOzgmjXFdhWDc8rrUL6Yei-eugF52s (visited on 06/30/2025).
[21] Robin Fritsch. “A Note on Optimal Fees for Constant Function Market Makers”. In:
Proceedings of the 2021 ACM CCS Workshop on Decentralized Finance and Security.
2021, pp. 9–14.
38[22] Lawrence R Glosten and Paul R Milgrom. “Bid, ask and transaction prices in a special-
ist market with heterogeneously informed traders”. In: Journal of financial economics
14.1 (1985), pp. 71–100.
[23] Joel Hasbrouck, Thomas Rivera, and Fahad Saleh. “An Economic Model of a Decen-
tralized Exchange with Concentrated Liquidity”. In: Management Science, forthcom-
ing (2025). url: https://doi.org/10.1287/mnsc.2024.04510.
[24] Joel Hasbrouck, Thomas Rivera, and Fahad Saleh. “The need for fees at a DEX:
How increases in fees can increase DEX trading volume”. In: Journal of Finance,
forthcoming (2025).
[25] Xue Dong He, Chen Yang, and Yutian Zhou. Optimal Design of Automated Mar-
ket Makers on Decentralized Exchanges. Available at SSRN: https://ssrn.com/
abstract=4801468. 2024. url: http://dx.doi.org/10.2139/ssrn.4801468.
[26] Ariah Klages-Mundt and Steffen Schuldenzucker. Elliptic Concentrated Liquidity Pool
(E-CLP): Technical Overview. 2022.
[27] Sorella Labs. Sorella Labs. en. 2025. url: https://sorellalabs.xyz/writing/a-
new-era-of-defi-with-ass (visited on 08/11/2025).
[28] Alfred Lehar and Christine A. Parlour. “Decentralized Exchange: The Uniswap Au-
tomated Market Maker”. In: The Journal of Finance 80.1 (2025), pp. 321–374. doi:
https://doi.org/10.1111/jofi.13405. url: https://onlinelibrary.wiley.
com/doi/abs/10.1111/jofi.13405.
[29] LFJ. Liquidity Book: Primer — LFJ. 2025. url: https://docs.lfj.gg/liquidity/
liquidity_book-_primer_6893873 (visited on 08/11/2025).
[30] Jason Milionis, Ciamac C. Moallemi, and Tim Roughgarden. “Extended Abstract:
The Effect of Trading Fees on Arbitrage Profits in Automated Market Makers”. In:
Financial Cryptography and Data Security. FC 2023 International Workshops. Ed. by
Aleksander Essex, Shin’ichiro Matsuo, Oksana Kulyk, Lewis Gudgeon, Ariah Klages-
Mundt, Daniel Perez, Sam Werner, Andrea Bracciali, and Geoff Goodell. Cham:
Springer Nature Switzerland, 2023, pp. 262–265. isbn: 978-3-031-48806-1.
[31] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Au-
tomated Market Making and Loss-Versus-Rebalancing. Extended abstract published in
Proceedings of the 2022 ACM CCS Workshop on Decentralized Finance and Security,
DeFi’22, https://dl.acm.org/doi/abs/10.1145/3560832.3563441. 2022. doi:
10.48550/ARXIV.2208.06046. url: https://arxiv.org/abs/2208.06046.
[32] Uniswap. Dynamic Fees in Uniswap V4. https://docs.uniswap.org/contracts/
v4/concepts/dynamic-fees. Accessed: 2024-11-21. 2024.
[33] Vladislav Volosnikov, Alexander Pimenov, and Vladimir Tikhomirov. The Impact of
Market Conditions and Fee Algorithms on the Design of a Competitive AMM. Working
paper. 2024. url: https://algebra.finance/static/the-impact-of-market-
conditions-and-fee-algorithms-on-the-design-of-a-competitive-amm.pdf.
39Appendix A. Pseudocode for Simulation
Algorithm 1: Pseudocode for Simulating Market Dynamics
Input: Initial reserves (X0,Y0), CEX prices S0, fees η0, η1, demand sizes ∆B, ∆S,
time horizon T, time steps N, market instances M
Output: Reserve paths (Xt,Yt), DEX prices S1
t , fee revenues, hedging values Ht
## 1 Initialize market instances and trading flags:
2 for each price path j = 1,...,M do
3 Set reserves: (Xj
0,Y j
0 ) ;
4 Set hedge: Hj
0 ← Xj
0 + Y j
0 S0,j
0 ;
5 for each time step i = 1,...,N do
6 Randomly assign buyer firsti,j ∈ {True,False} ;
## 7 Set seller firsti,j = ¬buyer firsti,j ;
## 8 Simulation loop:
9 for each time step i = 1,...,N do
10 for each price path j = 1,...,M do
11 Update hedge portfolio value: Hj
i ← Hj
i−1 + Y j
i−1 · (S0,j
i − S0,j
i−1) ;
## 12 Arbitrage step:
13 if arbitrage opportunity exists then
14 Compute arbitrage volume ∆A
i,j ;
15 Execute arbitrage: update (Xj
i ,Y j
i ,S1,j
i ) and record fees ;
## 16 Fundamental trading step:
17 if buyer firsti,j then
## 18 Compute buy volume on DEX: ∆B,DEX
i,j ;
19 Execute buy trade: update (Xj
i ,Y j
i ,S1,j
i ) and record fees ;
## 20 Compute sell volume on DEX: ∆S,DEX
i,j ;
21 Execute sell trade: update (Xj
i ,Y j
i ,S1,j
i ) and record fees ;
22 else if seller firsti,j then
## 23 Compute sell volume on DEX: ∆S,DEX
i,j ;
24 Execute sell trade: update (Xj
i ,Y j
i ,S1,j
i ) and record fees ;
25 Compute buy volume on DEX: ∆B,DEX
i,j ;
26 Execute buy trade: update (Xj
i ,Y j
i ,S1,j
i ) and record fees ;
40Appendix B. Summary Statistics for Ratio Histograms
Table 5. Summary statistics for varying η1 in Figure 6
η1 (bps) 5 10 15 20 25
E[profit] ($) 946.51 10881.14 17031.02 11877.55 8682.79
E[fees] ($) 12937.55 22872.52 29022.89 23869.56 20672.64
E[volume] 8626.36 7625.19 6450.42 3979.41 2757.35
P(profit) 24.74% 51.44% 72.89% 85.93% 91.17%
P(buy–sell) 66.79% 51.44% 29.15% 0.00% 0.00%
P(arb) 9.35% 3.72% 1.59% 0.77% 0.48%
Table 6. Summary statistics for varying η0 in Figure 6
η0 (bps) 0 5 20 35 60
E[profit] ($) -3482.90 -1576.77 17031.02 26137.29 29612.52
E[fees] ($) 8507.31 10417.23 29022.89 38116.95 41543.90
E[volume] 1891.54 2316.01 6450.42 8471.36 9233.20
P(profit) 64.77% 71.42% 72.89% 55.46% 29.95%
P(buy–sell) 0.00% 0.00% 29.15% 70.03% 84.97%
P(arb) 35.19% 14.73% 1.59% 0.64% 0.33%
Table 7. Summary statistics for varying σ in Figure 6
σ 2.50% 3.25% 4.00% 4.75% 5.50%
E[profit] ($) 27382.31 22319.82 17031.02 11676.99 6223.08
E[fees] ($) 32068.21 30237.50 29022.89 28585.86 28891.86
E[volume] 7126.94 6720.19 6450.42 6353.62 6422.21
P(profit) 94.00% 83.94% 72.89% 63.39% 55.97%
P(buy–sell) 47.45% 36.71% 29.15% 23.97% 20.43%
P(arb) 0.01% 0.29% 1.59% 4.17% 7.59%
Table 8. Summary statistics for varying demand in Figure 6
∆B = |∆S| 1000 3000 5000 7000 9000
E[profit] ($) -4133.82 5570.90 17031.02 28459.36 36430.06
E[fees] ($) 7836.39 17556.25 29022.89 40453.67 48426.54
E[volume] 1742.01 3902.03 6450.42 8991.11 10764.58
P(profit) 46.80% 63.50% 72.89% 76.30% 78.27%
P(buy–sell) 16.51% 24.31% 29.15% 30.82% 31.90%
P(arb) 11.62% 4.27% 1.59% 0.77% 0.44%
41Appendix C. Infinite Demand and σ = 0 Approximation
Since demand is infinite and purchases/sales occur only at the sell/buy boundaries, re-
spectively, we have the following volumes (when non-zero)
∆B,DEX
t = Yt 1 −
s
(1 − η0)(1 + η1)
(1 − η1)(1 + η0)
!
, ∆S,DEX
t = Yt 1 −
s
(1 + η0)(1 − η1)
(1 + η1)(1 − η0)
!
.
The corresponding fee revenue collected by the LP is
Buy Revenue = η1
Pt[∆B,DEX
t ]∆B,DEX
t , Sell Revenue = η1
Pt[∆S,DEX
t ] ∆S,DEX
t ,
and the expected fee revenue per period (when initializing the price ratio at either the buy
or sell boundary) is thus given by
E[Fee Revenue per period] = E[Buy Revenue + Sell Revenue].
Substituting the trade expressions and simplifying (using that we pick up approximately
75% of a round trip and that Xt ≈ X0) yields
(C.1)
1
N
E[Fee Revenue] ≈
3
4
X0η1
"s
(1 + η0)(1 − η1)
(1 + η1)(1 − η0)
−
s
(1 − η0)(1 + η1)
(1 − η1)(1 + η0)
#
.
Expanding (C.1) to second order in η0 and η1 gives the expression reported in Section
4.2. An illustration of the approximation accuracy of (C.1) for various demands is given in
Figure 23.
As an aside, we recall the breakdown in monotonicity of the optimal fee with respect to
demand observed in Figure 10 of Section 4. Figure 23 exposes the precise mechanism by
which monotonicity fails: the curve’s maximum translates abruptly from left to right at an
intermediate demand level.
0.0 2.5 5.0 7.5 10.0 12.5 15.0 17.5 20.0
1 (bps)
0
10
20
30
40
50
60
Expected PnL ($1,000s)
Approximation
Figure 23. Illustration of the infinite demand approximation in (C.1)
(black curve) for parameters σ = 0 and η0 = 20bps. The expected PnL
curves for various demand levels ∆B = |∆S| ∈ {1000,2000,...,25000} are
provided on an increasing gradient from blue to red.
42Dept. of Statistics, Columbia University
Email address: sc5314@columbia.edu
CEREMADE, Université Paris Dauphine-PSL
Email address: bergault@ceremade.dauphine.fr
Dept. of Computer Science, Columbia University and Category Labs
Email address: jm@cs.columbia.edu
Depts. of Statistics and Mathematics, Columbia University
Email address: mnutz@columbia.edu
43