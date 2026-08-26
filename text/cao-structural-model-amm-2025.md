---
sha256: b358c670e8299db6d6843654a0619be15c88266d3f4d7c64d41f1fd6d1071d36
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 74722
---
A Structural Model of Automated Market Making
David Cao, Brett H. Falk, Leonid Kogan, Gerry Tsoukalas∗
November 18, 2025†
CBER CtCe Working Paper Series‡
Abstract
Automated market makers (AMMs) process billions in annual transactions, yet most rely on
fixed fee schedules that stand in contrast to microstructure theory, which prescribes volatility-
sensitive spreads. To assess whether this theory extends to AMMs, we develop and estimate
a structural model of an AMM. We show that fixed fees are inefficient and characterize the
optimal volatility-sensitive fee schedule. Testing on ETH-USDC data shows that, even with
noisy volatility forecasts, adaptive fees outperform fixed fees, increasing the annual fee revenue
by 9-44%, and AMM liquidity supply by 2-10%.
Keywords: Automated Market Makers (AMM), Decentralized Finance (DeFi), Dynamic Fees,
Market Microstructure, Uniswap, Volatility.
∗
Cao: University of Pennsylvania (davidcao@seas.upenn.edu), Falk: University of Pennsylvania (fbrett@seas.
upenn.edu); Kogan: Massachusetts Institute of Technology (lkogan2@mit.edu); Tsoukalas: Boston University
(gerryt@bu.edu) & University of Pennsylvania (gtsouk@wharton.upenn.edu)
†
First version: October 3, 2023.
‡
The authors are grateful to the Uniswap Foundation for funding provided through the CBER CtCe grant.
11 Introduction
Decentralized finance is reshaping trade by enabling markets that function without centralized in-
termediaries. Automated Market Makers (AMMs) such as Uniswap have cumulatively processed
trillions of dollars in transactions, suggesting that algorithmic market making can operate at insti-
tutional scale. In response, a growing literature has begun to examine how AMMs might reshape
market structure. For example, Malinova and Park (2023) asks whether AMMs could meaningfully
complement, or even eventually replace the traditional limit-order markets.
Despite their success, AMMs make design choices that depart from core principles of traditional
market microstructure, particularly in how they manage liquidity provider (LP) risk. A core tenet of
traditional centralized exchanges is that market makers widen spreads when information asymmetry
or volatility rises, which protects them from adverse selection and inventory risk. Leading AMMs, in
contrast, typically rely on fixed fee percentages that do not adjust with market conditions. AMMs’
fixed-fee approach represents either a costly oversight or evidence that their trading mechanism can
achieve near-optimal outcomes with a simple constant-fee policy. This is the question we address in
this paper: is the current fee structure, with a constant fee level, optimal? Or, to put it differently,
could an adaptive, volatility-sensitive fee policy lead to more efficient AMM performance?
We find that volatility-sensitive fees generate substantial efficiency gains. Using a structural
model calibrated to transaction-level Uniswap data, we find that volatility-sensitive fees yield 13.2%
higher annual fee revenue (range 9% to 44%) and attract 2.6% more liquidity (range 2% to 10%)
relative to fixed fees. The optimal fees we derive increase with expected volatility, which is intuitive
because elevated price volatility has a similar effect in the AMM setting to elevated adverse selection
under a traditional market design, e,g, a limit-order book.
AMMs differ fundamentally from traditional centralized exchanges, therefore it is unclear in
principle whether the absence of adaptive fees is of first-order economic importance. In centralized
limit-order markets, prices emerge from the continuous interaction of buy and sell orders that traders
submit, cancel, and revise. By contrast, AMMs rely on a transparent, pre-specified pricing curve
such as a constant product that maps the pool’s asset balances into a quoted price, allowing trades
to execute directly against pooled liquidity rather than against standing orders. Liquidity providers
(LPs) supply capital to these pools and earn fees on each trade. As trading activity changes the
pool’s asset balances, the AMM moves mechanically along its pricing curve, generating fee revenue.
Despite these architectural differences, AMMs expose liquidity providers to economic forces that
parallel those faced by market makers in traditional limit-order markets. The mechanisms differ, but
2the risks that determine compensation for liquidity provision are closely aligned. Liquidity providers
are exposed to “impermanent loss,” defined as the shortfall in value relative to a chosen benchmark.
Common benchmarks include a passive buy-and-hold or buy-and-stake position in the underlying
assets, or an actively and continuously rebalanced (hedged) strategy (Milionis et al. 2022). All
yield the same economic conclusion: absent trading fees, LP returns systematically underperform
these benchmarks in expectation. Such losses by LPs are analogous to market makers in centralized
markets incurring losses to high-frequency traders taking advantage of stale limit orders. AMMs
generate a similar effect: as external prices change, arbitrageurs trade against the pool to realign
its quoted price, mechanically rebalancing LP portfolios toward the asset that has depreciated and
away from the one that has appreciated. This mechanism operates even under full information. A
simple example illustrates the effect. Suppose an AMM pool initially holds 10 ETH and $1,000
USDC, implying a price of $100 per ETH with constant product k = 10,000. If the external price
doubles to $200, arbitrageurs buy ETH from the pool until its price matches, yielding new reserves
x1 =
√
50 ≈ 7.07 ETH and y1 ≈ 1,414 USDC. Ignoring fees from these trades, the LP’s position is
worth about $2,828 versus $3,000 under buy-and-hold, highlighting the inventory distortion created
by the AMM’s pricing rule.
A second, related parallel is adverse selection. In limit-order markets, market makers lose when
facing better-informed traders. AMMs admit a similar channel: traders who observe new price
information before it is incorporated into the pool can transact against stale AMM prices and earn
rents at the expense of LPs. This mechanism is distinct from impermanent loss.
A third parallel involves order-processing and latency costs. In centralized markets, these costs
arise from updating quotes, monitoring inventory, and processing trades in real time. AMMs exhibit
analogous frictions due to blockchain settlement: LPs can adjust positions only discretely, face con-
firmation delays and transaction costs, and cannot respond instantaneously to price changes. These
constraints limit real-time inventory management and mirror the operational frictions embedded in
traditional spreads. Taken together, these parallels indicate that AMMs reproduce the fundamental
economic forces that shape compensation for liquidity provision, even though their trading protocols
differ from those in centralized markets.
Microstructure literature (Kyle 1985, Glosten and Milgrom 1985, Easley and O’Hara 1987) shows
that costs of liquidity provision, e.g., due to information asymmetry, are reflected in trading frictions
(bid-ask spread or market impact) faced by the market participants. Against this backdrop, the
fixed-fee structures used by AMMs stand out as a gap in their design.
One potential reason why existing AMMs use constant fee schedules is legacy – early AMM
3designs did not accommodate dynamic fee schedules. Another potential reason is the challenge of
empirical identification of the optimal fee schedule. In AMMs, fees, liquidity, and trading volume
are ideally jointly determined in equilibrium. LPs choose how much capital to supply based on
expected fees and impermanent-loss risk, while traders respond to both fee levels and available
liquidity. These simultaneous decisions create a deep endogeneity problem: changes in fees affect
liquidity and volume, but liquidity and volume also affect the fees that would be optimal. As
a result, the causal effect of fee changes on market outcomes cannot be recovered with standard
empirical approaches or simple reduced-form variation. Previous theoretical work, including Evans
et al. (2021), analyzes optimal AMM fees in stylized settings but does not address the empirical
identification of fee effects in environments where fees, liquidity, and volume are jointly determined.
With recent technological innovations, the idea of adaptive fees has become increasingly visible
in practitioner discussions. Shin and Adams (2023) argues that in a very volatile asset you might
need higher fees,” and Ippolito (2023) similarly notes that one of the big topics in DEX-land right
now is dynamic fees.” These views suggest that fixed fees may leave value on the table for both
LPs and exchanges. Our conversations with researchers at Uniswap indicate that this perspective
has gained additional momentum with the launch of Uniswap v4 in 2025. The v4 architecture
introduces “hooks,” customizable smart-contract modules that allow pools to adjust key aspects of
trade execution, including fee logic, making state-contingent fees operational at scale. Consequently,
dynamic fees have become a prominent topic of discussion in decentralized exchange design, even
though their economic implications remain largely unexplored.
We address these gaps by developing a structural framework that captures the equilibrium
relationships among fees, trading volume, and liquidity provision. The model jointly characterizes
the behavior of LPs, who allocate capital based on expected returns and impermanent-loss risk,
and traders, whose order flow reflects both noise trading and arbitrage activity. Estimating these
decisions in a unified system allows us to recover the causal effect of fee policy in an environment
where fees, liquidity, and volume are determined simultaneously. The framework delivers closed-
form expressions for optimal fees as functions of expected volatility and market conditions, providing
a rigorous basis for evaluating the performance of adaptive fee schedules.
To quantify the magnitudes involved, we apply the framework to Uniswap v2 transaction data
for the ETH–USDC pair. The available AMM data contains no fee variation, making it impossible
to estimate fee elasticities directly. Our structural approach addresses this constraint by tracing out
the range of elasticities consistent with observed behavior and evaluating AMM performance across
these plausible values. We combine external price data to forecast volatility with a predictive model
4of impermanent loss and use these components to simulate daily optimal fees under alternative
elasticity assumptions. Across all specifications, the gains from volatility-sensitive fees are robust to
different trader responses to fee changes. These counterfactuals speak directly to the design choices
now feasible in protocols such as Uniswap v4.
In summary, the paper makes four contributions. First, it develops a formal framework that em-
beds AMM fee-setting within market microstructure economics, clarifying how volatility, inventory
risk, and trader behavior jointly determine optimal fees. Second, it directly tackles the core endo-
geneity problem in AMMs – fees, trading volume, and liquidity provision being jointly determined –
by introducing a structural empirical approach that identifies these equilibrium relationships in the
absence of fee variation. To our knowledge, this is the first paper to address this identification chal-
lenge directly. Third, it provides the first systematic evidence on how AMM liquidity and volume
respond to fee changes by estimating these components with on-chain transaction data. Finally, it
quantifies the performance of volatility-sensitive fees using counterfactual simulations grounded in
the estimated model, showing their potential to substantially improve AMM performance, and the
trillions of dollars in transactions that this mechanism supports.
The remainder of the paper is organized as follows. Section 2 reviews related work. Section 3
presents the theoretical framework and outlines the three-shot game. Section 4 derives the equi-
librium. Section 5 describes the data and the two-stage GMM estimation. Section 6 outlines the
in-model impact of a dynamic fee. Section 7 concludes.
## 2 Literature
Although we are unaware of any prior structural estimation work that focuses primarily on optimal
AMM fee structure, several papers have developed theoretical models that capture different aspects
of the dynamics of AMMs. Several of these introduce theoretical models of AMMs, but they miss
certain crucial ingredients necessary to model how liquidity providers and traders react to changes
in fees.
In order to capture these dynamics we need strategic liquidity providers who react to (1) the
volatility of the asset price (which can cause impermanent loss) and (2) trader volume. Then we also
need traders who react to (1) the amount of liquidity in the pool (this determines price slippage)
and (2) the trading fees.
Below, we outline how prior works model liquidity providers and traders, and highlight how they
are insufficient to comprehensively address the problem of optimizing fees.
5One work which considers how fees affects liquidity provider profits is Evans et al. (2021). In
their setting, LPs are not interested in maximizing returns, but instead on keeping their portfolio
close to some optimal portfolio weights (e.g. 50% ETH 50% USDC). With this objective, higher fees
mean that there is a large “no-arb window” where arbitrageurs will not adjust the pool weights. This
leads them to the rather counterintuitive conclusion that “liquidity provider’s losses are minimized
by reducing the fees as much as possible, while ensuring they are not zero.” Their model does not
formally address other trading behavior.
Four works that introduce (and solve) models for strategic liquidity provisioning are Lehar and
Parlour (2021), Hasbrouck et al. (2022), Capponi and Jia (2021), Malinova and Park (2023).
Lehar and Parlour (2021) introduces a one-step model. LPs are strategic, and decide how much
liquidity to put into the pool, then with some fixed probability, there is a price shock. If there is
a price shock, the pool is arbitraged back. If there is no price shock, there is a noise trader, then
an arbitrage trade which pushes the pool back to the true price. In their setting, the noise trader
trades a fixed amount independent of the pool size and fees. This would imply that the fee could
be set arbitrarily large without affecting noise trader demand. Thus this approach is not directly
applicable to our setting.
Hasbrouck et al. (2022) introduces a multi-period model. LPs are strategic, and decide how much
liquidity to put into the pool. Then, at every time step, noise traders with idiosyncratic demands
arrive probabilistically, and trade with the pool. In this model, there are no price fluctuations of the
assets, so the LPs are not subject to impermanent loss.1 In our model, we must take into account
price fluctuations, when considering setting the optimal fee.
Capponi and Jia (2021) is a two-step model in which LPs are strategic and deposit at time 0.
Then at time 1, there is either a price shock or a noise trade. This is similar to Lehar and Parlour
(2021), but the key difference is that the price shock / noise trade is not immediately arbitraged.
Instead, at time 2, an arbitrageur arrives, and the LP and the arbitrageur engage in a gas auction,
where the LP tries to withdraw (to avoid impermanent loss), and the arbitrageur tries to arbitrage
the pool. They show, however, that the arbitrageur will always win this auction whenever there
is more than one LP, because the arbitrageur will make gains proportional to the entire pool size,
whereas the LP’s savings are only proportional to their share of the pool. They identify when there
is a “liquidity-freeze,” i.e., when LPs deposit zero liquidity in equilibrium.
1
“Crucially, it is well-established that fluctuations in the fair value exchange rate between cryptoassets in a pool
generate losses, termed impermanent loss (see Capponi and Jia 2021), that then necessitate fees to compensate
liquidity providers. We emphasize that the channel we establish does not depend on such price fluctuations and we
hold constant the fair value exchange rate to establish that point.”
6Malinova and Park (2023) introduces a multi-step model and attempts to determine if AMMs
would be a viable mechanism for traditional assets. Fee is strategically set to minimize transaction
costs for traders and then liquidity providers deposit according to a break-even constraint. They
empirically test their model using equities data and find AMMs can significantly reduce trader costs.
However, in this model, while traders split their flow between an AMM and a traditional market
based on their costs, the total volume is exogenous and fixed.
Adams et al. (2024) Considers an alternative, “auction-managed” AMM (am-AMM) model,
where individuals can purchase the rights to “manage” the AMM. The manager pays the LP’s for
this privilege, and in turn is able to set AMM fees, and collects all fees on trades. This effectively
allows the manager to trade without fee, and thus the manager is the only arbitrageur who can
(profitably) trade in the no-arb window. They model noise traders whose trade volume depends on
both fees and liquidity.
Milionis et al. (2022) introduces the concept of Loss Versus Rebalancing (LVR). In their model,
liquidity is fixed (LPs are non-strategic), and they do not specify any model for noise traders or
fees2. In Milionis et al. (2023), this model is extended to account for fees paid by arbitrageurs,
but the model does not include noise traders. In both these works, liquidity is fixed, so there is no
attempt to solve for equilibrium levels of liquidity.
Angeris et al. (2021) creates a multi-period simulation-based analysis of AMM trading and
liquidity provision. Their model includes fees and noise traders3. In their model, they discuss how
increases in fees increase the “no-arbitrage” window, but they do not explore how changes in fees
affect liquidity provider profits.
Rao and Shah (2023) proposes a new fee mechanism, where fees are not constant in trade size,
but instead the marginal fee is decreasing, i.e., the total fee is concave in the trade size (as opposed
to linear in trade size). Using these new “triangle fees,” they simulate LP profits when the prices
move according to symmetric random process, and arbitrageurs rebalance the pool. Their model
assumes liquidity is fixed, they do not model noise traders.
In this work, we present the first structural AMM model that includes (1) strategic LPs, (2)
traders that are sensitive to fees and liquidity, and (3) price shocks, and yet is simple enough that
we can characterize the amount of liquidity in equilibrium and test it empirically.
2
They define a variable, Feet, denoting the fees collected at time t, but they do not give it any specific form.
3
Since noise traders are not strictly rational, it is necessary to make assumptions about how they trade. In
Angeris et al. (2021), noise traders will trade a fixed amount with the AMM, if and only if the AMM price is no more
than a fixed percentage away from the true price. This means that noise traders will not trade if the fees are too
high, or liquidity is too low.
73 Model
Consider an exchange setting with three types of strategic agents: a platform operating an AMM,
liquidity providers (LPs), and traders. Each make decisions/take actions in their own dedicated
time periods, denoted by t = 0 (platform), t = 1 (LPs), and t = 2 (traders). At time t = 0, the
platform sets the fees, f. At time 1, the LPs deposit an amount of capital, c. At time t = 2, traders
trade with the platform, and there is a price shock. After trades have been made at time t = 2, all
agents exit and the game ends. The timeline details are provided further down.
Some may note that we do not include arbitrageurs in our model explicitly. It is reasonable to
consider an extension of our model where there is a fourth time period t = 3 where arbitrageurs
arrive and trade the AMM to match the external price. However, as we discuss later on, this
extension is already accounted for within our model and is effectively equivalent. Intuitively, this
is because our model considers trading by both noise traders and arbitrage trades in aggregate,
without needing to distinguish one from the other. The only assumption needed is that the AMM
price is in line with the external price at the end of each period, which we discuss futher below and
additionally show is reasonable in our empirical study.
The Financial Market
The AMM has a liquidity pool composed of two generic assets. To ease exposition, we refer to it
as the “risky/stable” pool, e.g. ETH/USDC; the stable asset is the numeraire, and all quantities
will be expressed in its units, referred to as $ for short. Let p0 be the fair market price of the risky
asset on the AMM at time 0, before any trades. For instance, p0 ≈ $3,500 in the case of the price
of ETH at the time of writing. The risky asset’s price has a random fundamental value at the end
of the game, which we model as
p = v · p0,
where v is a random variable representing percent change, with PDF φv, mean µ and volatility σ.
When considering an explicit form for φv, we use a lognormal distribution.
We consider a simple Constant Function Market Maker (CFMM) invariant with a proportional
trading fee f (e.g., Uniswap v2). The CFMM exchange rules work as follows: for a pool with ℓs
units of the stable asset, ℓr units of the risky asset, and pool fee f, an incoming trade swapping δs
units of the stable asset for δr units of the risky asset (buying the risky asset) must satisfy
(ℓs + (1 − f) · δs)(ℓr − δr) ≥ ℓs · ℓr (Buying from the pool) (1)
8The fee is always taken in the incoming asset with respect to the pool. That is, a sell of δr units of
the risky asset to the pool must satisfy
(ℓs − δs)(ℓr + (1 − f) · δr) ≥ ℓs · ℓr (Selling to the pool) (2)
A graphical depiction of this invariant or “bonding curve” can be seen in Figure 1.
t = 0
t = 1
∆s
(1 − f) · ∆r
pe
p0
Stable asset liquidity
Risky asset liquidity
Figure 1: A visual illustration of a CFMM trade. The curve in red is the invariant. A trader is selling ∆r
units of the risky asset in return for ∆s units of the stable asset. The effective price pe is the (negative) slope
of the curve shown in blue. The instantaneous price p0 can then be determined as the slope of the tangent
at the current liquidity amounts, that is, the derivative of the invariant. This is shown in green.
The Platform
We view the platform as an entity similar to the Uniswap Foundation. In this light, it is reasonable
to assume that the platform wishes to set the fee f to maximize deposited liquidity c.
max
f
c (3)
The key consideration is that the fee level will affect the endogenous entry of LPs and the liquidity
amount they provide. We describe their behavior next.
The Liquidity Providers
LPs deposit stable and risky amounts that are equivalent in value based on the current fair price of
the pool. As total liquidity deposited c must correctly reflect the price p0, this results in the initial
constraints ℓs = p0 · ℓr and ℓs + p0 · ℓr = c, which implies
ℓs =
c
2
and ℓr =
c
2 · p0
.
9Thus, as initial price is exogenous, we can simplify the LPs’ decision to a single variable c, rather
than ℓr,ℓs.
LP revenue ultimately comes from a single source: fees from trading volume F(·). However,
since the price at the end of the game is not necessarily the same as it was in the beginning, LPs
also incur a profit or loss to their portfolio depending on if the final price increases or drops. We
assume that the ending price of the period aligns with the external price. That is, the price of the
AMM moves from p0 to v · p0 where v is stochastic and represents the percentage movement of the
price.
We additionally assume that the liquidity market is perfectly competitive, implying that LPs
are strategic and provide enough liquidity to break even against a baseline portfolio that is similar
to their pool reserve allocation. In practice, using Ethereum as an example, traders can stake
their Ethereum directly by running a validator or through a service such as Lido. Additionally,
they could make return on their USDC by providing liquidity on AAVE or simply moving it to
Coinbase. To model this, instead of the usual buy-and-hold or loss-versus rebalancing benchmarks
considered in the AMM literature, we consider a more stringent benchmark which we refer to as
the “buy-and-stake” portfolio (BNS). The return on BNS over a time period dt is defined as
c
2
· eγs·dt
+
c
2 · p0
· eγr·dt
· v · p0 = c ·

eγs·dt + eγr·dt · v
2

(4)
where γs is the required return on the stable asset and γr is the required return on the risky asset.
We notate the multiplier as γ(v) for brevity, which we define as
γ(v) =

eγs·dt + eγr·dt · v
2

. (5)
The portfolio value of an LPs’ deposit after the pool is moved to a new price p0 · v can be
calculated through the CFMM invariant. Specifically, the reserve amounts of the LP become

c ·
√
v
2
,
c
2 · p0 ·
√
v

(6)
which, in terms of the stable asset, results in a final value of
c ·
√
v. (7)
It is important to note that if one only considers the reserve amounts of the LP compared to even
a simple “buy-and-hold” strategy, the LP will be guaranteed a loss. This is known as impermanent
10loss in the literature and has been widely studied. Specifically, we see that
c ·
1 + v
2
≥ c ·
√
v (8)
holds directly from the AM-GM inequality. Thus, intuitively, it should be the case that fees from
trading volume cover this deficit. However, given that trading volume is more volatile than a
relatively risk-free staked portfolio, we additionally consider a “risk premium”. Specifically, we
postulate that since LPs are investing in a riskier asset, they may expect a higher return on average
than the baseline.
LPs will deposit enough liquidity such that the returns of the AMM are equivalent to the outside
option of BNS. The resulting break-even condition is given by
E

F(·) + c ·
√
v

= E[c · γ v

] + c · RP. (9)
where RP is the discussed risk premium. We maintain as our baseline assumption that RP is a
constant over time, which we empirically investigate later in section 5.2.2.4
Traders
We assume there is a volume V of trading that is dependent on liquidity c, fee f, and price volatility
σ. This extends many existing noise trading models in the AMM literature, which often assume
noise trading volume is exogenously fixed to a constant Malinova and Park (2023), Hasbrouck et al.
(2023) (in Milionis et al. (2022), liquidity is fixed to a constant). However, determining the exact
amount of fees earned by LPs from trading volume is complex as this not only depends on the size of
each trade but also the order in which they occur. In light of this, we instead approximate trading
fees as
F(·) ≈ f · V (f,σ,c) (10)
This approximation has been made in various other works such as Milionis et al. (2022), but its
accuracy has not yet been empirically validated. We provide this validation in section 5.2.1, and
generally it does extremely well.
We model expected trading demand to be linear in σ,f and logc. We find that this form is
quite accurate in our empirical investigation, but models that capture more nuanced behavior can
4
It is straightforward to extend our model by allowing the conditional RP to depend on observables, e.g., the
lagged liquidity level or price volatility. This would not change our analysis qualitatively, but would potentially
require a longer time-series to estimate the risk-premium parameters with sufficient accuracy.
11be used as well. For simplicity, we consider the following form for trading demand:
E[V (f,σ,c)] = a0 − af · f + aσ · σ + ac · logc (11)
where structural parameters af,aσ,ac > 0.
We hypothesize that traders are inversely sensitive to trading fee f, positively sensitive to price
volatility σ, and positively sensitive to liquidity c. The first two assumptions are natural, and the
third can be thought of as sensitivity to price slippage, i.e. as liquidity increases, less slippage
occurs so more trading happens. The choice of logc is determined by the assumption that traders
are more sensitive to fee than they are to slippage (for large enough liquidity). Intuitively, as c ap-
proaches infinity, trading volume should not increase linearly since slippage becomes effectively zero.
Otherwise, an LP would be able to generate infinite returns with infinite liquidity, an impractical
result.
We acknowledge that our choice of function does not hold intuitively at edge conditions, i.e.
trading volume should be 0 when fee is 1 or liquidity is 0. However, in our empirical study we show
that this linear function is highly representative of the real world and should hold for small changes
in parameters. In particular, trading volume increases slightly with liquidity and more drastically
with external price volatility. It is important to note that since the historical data we have obtained
is under a single fee used in Uniswap V2, it is not possible to directly estimate af. However,
intuitively, it should be the case that as fee increases, trading volume decreases, as reflected by the
negative sign in front of af. Estimation of this parameter would become feasible if and when AMMs
eventually switch to more dynamic fee structures.
Arbitrage Assumption
We assume that arbitrage activities in our environment are unconstrained. As a result, in equilib-
rium, it should be impossible to earn abnormal risk-adjusted returns by trading on the differences
between the price of the risky asset implied by the AMM and its external price. For example, prices
implied by Uniswap consistently track traded prices on Binance Lehar and Parlour (2021). We
operationalize this assumption by assuming that, at the end of each period, the AMM price of the
risky asset equals its external price. Because arbitrage is subject to transaction costs in our model,
the arbitrageur’s optimal trade when the pool price and external price are misaligned should move
the AMM price to the closest edge of the no-trade window. Thus, our assumption of convergence
at the end of the period could potentially bias our estimation of the expected impermanent loss.
12This could happen if the final pool price predictably diverged from c
√
v on average, or if the initial
spread between the pool price and the external price predicted the impermanent loss of the LPs. We
discuss this in more detail in section section 5.2.3, where we find that neither type of predictability
is supported by our empirical evidence.
Preferences and Beliefs
All agents are risk-neutral and know the distribution of the price process (v). They are able to view
all past actions played, e.g. historical liquidity or trading volume.
Timeline
Figure 2 summarizes the timing of aforementioned events.
t=0
t=1
t=2
Platform sets fee f to maximize liquidity deposited.
LPs deposit liquidity c according to break-even constraint.
Traders demand total volume V , aligning the AMM price to the external price of v · p0.
Figure 2: Model timeline.
## 4 Analysis
While our model is approximate, its simplicity allows us to derive closed forms. First, we show some
preliminary results that will aide our subsequent results. All proofs can be found in the appendix.
Lemma 1 (BNS Impermanent Loss). If a liquidity provider makes no fees, then their portfolio will
never be as good as the BNS portfolio. That is,
L = γ(E[v]) − E[
√
v] ≥ 0 (12)
Note that the liquidity provider’s break-even constraint can be rewritten as
f · V (f,σ,c) = c · (L + RP) (13)
which leads to a very natural interpretation: fees from trading volume should cover impermanent
loss with repsect to a buy-and-stake portfolio. For the rest of the paper, when we refer to the
13break-even constraint, we consider this form.
Lemma 2 (Trade Volume Response to Optimal Fee). If liquidity and fee are set as best responses
according to the break-even constraint, trading volume must respond negatively to increases in fee.
In other words, it must be the case that
∂V
∂f
< 0 (14)
Importantly, lemma 2 holds for any functional form of trading volume and leads to a natural
result. That is, if an AMM follows the break-even constraint, traders must negatively react to
increases in fee.
## 4.1 Static Fees
Building further on lemma 2 with our specific functional form for trading volume, the first-order
condition of the break-even constraint with respect to the optimal fee gives us
a0 − af · f + aσ · σ + ac · logc − af · f = 0 (15)
a0 − af · f + aσ · σ + ac · logc = af · f (16)
Note that if a platform sets a static fee f, in order for it to be optimal, the above must be satisfied.
This effectively states that if one uses a static fee, then trading volume should always stay constant
in expectation. Particularly, changes in price volatility should not affect trading volume. However,
a simple empirical test on real-world data correlating daily trade volume and price volatility shows
that this is clearly not the case. Thus, we can immediately reject the hypothesis that a static fee is
optimal.
Thus, from here, we reform our goal of determining if the current fee structure is optimal to
instead exploring how an optimal fee should behave under the break-even constraint.
## 4.2 Simplified Model
Before we proceed to analyze the full model, we consider a simplified model that enables us to obtain
interpretable closed-form solutions and tease out one of the underlying economic forces driving our
main result. The key assumption we make in this section is that for some pools, particularly
those with ample liquidity, trade demand may be relatively insensitive to small changes in liquidity
14amounts, meaning ac ∼ 0. This leads to the linear approximation
V (c,f,σ) ≈ V (f,σ) = a0 − af · f + aσ · σ (17)
Solving the break-even equation for LPs (9) results in the following equilibrium liquidity injected
by LPs
c∗
=
f · (a0 − af · f + aσ · σ)
L + RP
. (18)
This is concave in fee, we can therefore obtain the optimal fee by taking first-order conditions,
leading to the formal result below.
Theorem 1 (Liquidity Insensitive Simplified Model). In the simplified model where traders are
insensitive to liquidity, the optimal fee that maximizes liquidity c∗ given by (18) is linearly increasing
in the risky asset’s return volatility, and is given by
f∗
(σ) =
1
2af

a0 + aσ · σ

. (19)
Theorem 1 provides a clear rationale for why fees should adapt to increases in returns volatility.
But the only parameter driving this relationship in this simplified model is the aσ term, which
originates from the assumed functional form of the trading volume V . In other words, in situations
where the trading volume may be entirely insensitive to volatility (aσ ∼ 0), then the optimal fee in
(19) becomes constant! But this outcome is sensitive to the fact that the simplified model ignores
endogeneity between trading volume and liquidity. Adding back endogeneity could reverse the result
for the following reason: even if one assumes that aσ = 0, volatility could still affect the optimal
fee indirectly. This is because volatility affects impermanent loss (see (12)), which affects liquidity
provisioning via the breakeven condition (13). In turn, the amount of liquidity injected into the
pool would affect trading volume, which would then imply a possible relationship between fee and
volatility, even as aσ ∼ 0.
To summarize, there are two possible forces at play that could justify dynamic fees as a function
of volatility: The first is a direct relationship between trading volumes and volatilities (aσ > 0). The
second is an indirect relationship that occurs due to the endogenous link between trading volume
and liquidity provisioning.
Adding this endogeneity substantially complicates the analysis. The rest of the paper is thus
devoted to studying this more realistic situation.
154.3 Full Model with Endogeneity
Theorem 2 (Break-even Liquidity). Using the full model of volume eq. (11), liquidity providers’
best response to a fee f set by the platform is defined by
c∗
= −
f · ac
L + RP
· W

−
L + RP
f · ac
· exp

af · f − a0 − aσ · σ
ac

(20)
where W(·) is the Lambert W function.
Note that the interior of W(·) is always negative. Since the Lambert W function takes on
two real solutions between (−1/e,0), if break-even liquidity has a solution, there must be two.
Intuitively, the result of theorem 2 having two solutions comes from trader’s sensitivity to liquidity.
More complex forms of liquidity sensitivity can result in more solutions.
To classify each solution, consider that for any given liquidity amount in the pool, if LPs are
making more than the outside option of BNS, it is strictly better for traders currently holding a
BNS portfolio to instead put their assets into the pool. The reverse holds true if LPs are making
less than the outside option: LPs would prefer to withdraw their holdings and reinvest into a BNS
portfolio. This observation motivates the introduction of “stable” and “unstable” liquidity amounts,
inspired from the traditional definitions in game theory.
Definition 1 (Stable Liquidity). A break-even liquidity c∗ is stable if there exists a constant τ > 0
such that for all ϵ ≤ τ, c∗ + ϵ results in less returns for liquidity providers than the outside option
and c∗−ϵ results in more returns for liquidity providers than the outside option. That is, movements
away from the break-even liquidty results in a pressure in the opposite direction. In other words, if
LPs make less than BNS with liquidity greater than the break-even and more than BNS with liquidity
less than the break-even, the break-even is stable.
An unstable break-even liquidity is where the opposite is true. That is, movements away from
the break-even liquidity results in pressure to continue moving in that direction.
Given this definition, we can now classify the two solutions found in theorem 2.
Theorem 3 (Stable Break-even). Of the two best responses the liquidity provider has, the lesser is
unstable and the larger is stable. Thus, the break-even liquidity the provider prefers will be the larger
solution.
As a note, if one assumes that returns for LPs approach 0 as liquidity approaches inifinity,
theorem 3 can be extended to generalize for a break-even condition with any number of solutions.
16By simple contradiction, if the solution with the largest liquidity is unstable, then LPs must be
making non-zero returns at infinite liquidity.
While it is technically possible to write a form for the platform’s best response f∗, it appears
to be inordinately large and complex, with no real analytical insights easily determined. Instead,
we turn towards numerical simulations based on estimated parameters to determine behavior of
optimal fee. Particularly, we aim to highlight the relationship between f∗ and σ, as hinted at in
the simple model’s analysis. The next section is dedicated to this task.
## 5 Empirical Estimation
In this section we describe and implement our approach to estimating parameters of our structural
model. In particular, we express the theoretical relation (11) as the following statistical relation:
V (f,σ,c)t = a0 − afft−1 + aσσt−1 + ac logct−1 + εt (21)
Here we assume that the process of the per-period realized price volatility is Markovian, and ap-
proximate the conditional expectation of the trading volume to be linearly related to the realized
price volatility over the most recent period, σt−1. We further assume that the expected volume
depends linearly on the end-of-period t − 1 log liquidity level logct−1, which is equivalently the
beginning-of-period t log liquidity.
To estimate (21) empirically, we must address the challenge posed by the endogeneity of pooled
liquidity. We assume that liquidity providers set their positions at the beginning of each trading
period based on their information set, before observing the day’s realized volatility and trading
volume. As a result, we allow for the possibility that logct−1 and εt are correlated, and we therefore
cannot estimate the relation (21) by OLS. To address this, we use the Generalized Method of
Moments (GMM). Instead of the conditional moment Et−1[logct−1εt], we impose the cross-equation
restriction that the conditional mean of the risk-adjusted return spread between the AMM and the
buy-and-stake strategy is zero. As we discuss below, we define several unconditional moments based
on this conditional-moment condition.
Finally, note that parameter af cannot be identified based on available empirical information,
because in Uniswap v2 only a single fee of 30 basis points has been used throughout our sample:
ft = f is a constant. We therefore define a new parameter ā0 = a0 − aff and re-write the volume
equation as
V (f,σ,c)t = ā0 + aσσt−1 + ac logct−1 + εt (22)
175.1 Data Collection
Uniswap Data
Data was collected by scraping all event logs from the Uniswap V2 ETH-USDC pool5. Logs were
taken from the creation of the contract on May 5, 2020 to December 16, 2024. These event logs
were then split based on their event type and parsed into CSV files. Specifically, Uniswap V2 pools
emit 4 events of relevance: Mint, Burn, Swap, and Sync. A description of each of these events can
be found in table 1. Ethereum event logs were specifically gathered from the publically available
dataset on Google BigQuery Day and Medvedev (2018). Once downloaded, they were parsed into
CSV formats. Only Swap and Sync events were collected and used in our analysis.
Event Description Total Post Merge
Mint LP deposits liquidity into the pool. - -
Burn LP withdraws liquidity from the pool. - -
Swap Swap is made against the pool. 5,840,505 2,003,132
Sync Reserve amounts changed, i.e. burn/mint/swap/hotfixes. 5,918,265 2,012,786
Table 1: An overview of the event logs collected from the Uniswap V2 ETH-USDC pool. PM represents
the total counts “post-merge”, which enabled ETH staking and happened on September 15, 2022 at block
15537393.
Staked Returns Data
For the returns of staking both ETH and USDC, we used data gathered from Lido and AAVE.
Lido is a DeFi pooling service where users can easily stake their ETH without the requirement of
needing 32 ETH and hardware that is consistently connected to the Ethereum network. In short,
trusted validators stake users’ ETH for them in return for a small fee. AAVE is a DeFi lending
service where users can provide liquidity to make passive return from lending. While the service is
not completely risk free, as of writing, no lender has ever lost collateral on Aave.6.
Data was gathered by using a full-archival Ethereum validator. We queried for the state of the
Lido smart contract at a 100 block granularity, which translates to roughly a 20 minute window,
5
Event logs were taken by scraping all logs emitted by address 0xb4e16d0168e52d35cacd2c6185b44281ec28c9dc.
6
Aave v2 had thousands of liquidations where borrowers have lost money, but the platform itself has only lost
about $2M in “bad” loans. More than half of this loss was due to a single malicious loan taken out by Avi Eisenberg,
the Mango markets attacker Warmuz et al. (2022). The losses to bad loans are miniscule compared to the total profits
of the platform, and these losses have been absorbed by Aave itself, and no lenders have ever lost funds on Aave.
18and the AAVE smart contract at 1000 block granularity, which translates to roughly 200 minutes.
Full details of how the data was parsed can be found in our GitHub repository.
External Price Data
Since our model requires an assumption that the underlying asset pair can be traded externally to
realize arbitrage opportunities, we turn towards Binance for price data. Binance is a centralized
exchange where users can swap cryptocurrenies for each other and consistently has the largest
trading volume out of all of the centralized exchanges. In particular, Binance has an ETH-USDC
instrument for which we scraped price data at a 1 second granularity. Again, the code to scrape
and merge price data files can be found in our GitHub repository.
## 5.2 Preliminary Results
We first empirically show some preliminary results that validate choices made in our model, partic-
ularly the choice of the trading fee approximation and the exclusion of explicitly modeling arbitrage
trading.
## 5.2.1 Accuracy of Trading Fee Approximation
We first quantify the accuracy of approximating trading fees. In practice, fees are on the incoming
asset, meaning on a buy of the risky asset, the fees are collected in the stable asset and on a sell
of the risky asset, fees are collected in the risky asset. Thus, the direct calculation of fees earned
from noise trades becomes fairly complex, since both the size and ordering of trades affect the total
outcome. Simplifying assumptions such as perfectly balanced buys and sells do not appear to lessen
the complexity either. Specifically, we would have that fees earned from a buy and sell of size xn is
f ·

c · p0 · xn
(1 − f)(c − 2 · p0 · xn)
+ xn · E[v] · p

(23)
Instead, we consider the much simpler approximation of expected trading fees as
f · V (c,f;v) (24)
where V is the expected trading volume over the time period, which we posit is a function of liquidity,
fee, and price volatility.
This approximation is motivated by the fact that one side of fees collected, i.e. in the stable
19asset, is always simply f times the amount of the incoming asset. Thus, this approximation is
exactly correct roughly half the time.
We quantify the accuracy of this approximation by comparing the difference between the actual
fees collected for each day on the Uniswap V2 ETH-USDC pool from a month after its creation
(May 2020) to August 20, 2024 (1542 days). The first month includes various test trades that are
inane, resulting in poor representation of our estimate. For each day, the total volume is used to
determine our fee approximation. To compute actual fees, we take only the inputs to the AMM and
use the closet price from Binance to convert ETH into USD. Overall, we find that for practically all
days, the fee approximation has less than 1% difference from the actual fees collected. Only 11 days
have a larger than 1% difference with the largest being about 7.2%. A graph of the distribution of
the differences can be seen in fig. 3.
Figure 3: The distribution of the accuracy of the linear fee approximation method. Actual and approximate
fees made were calculated for each day from June 1, 2020 to August 20, 2024 (1542 days). The percentage
difference for each day was sorted then plotted. The plot on the right shows the tail distribution starting
from the 99th percentile.
## 5.2.2 Constant Risk Premium
Here, we consider the empirical properties of the risk premium, which we are assuming to be constant
in our model. To quantify to what extent the conditional risk premium may change over time, we
regress the realized risk premium on the lagged values of both price volatility σ and the log ratio
of the trading volume to pool liquidity, log(V
c ). The first predictor, recent price volatility, captures
the possibility that the riskiness of the spread between returns of liquidity providers and the buy-
and-stake return is affected by the price volatility of the risky asset in the pool. The second variable
20is a natural predictor of the risk premium: if the pool size were to fall relative to the expected
trading volume, liquidity providers would be expected to earn abnormally high returns. Results of
the regressions can be found in figure 4.
We find only weak evidence, if any, that the risk premium is predictable by the recent price
volatility. However, there is some statistically significant evidence that the volume-to-liquidity
ratio can forecast the conditional risk premium. This may reflect adjustment frictions faced by
the liquidity providers, which we do not model explicitly. If imperfect pool-size adjustment is the
cause of the observed predictability, its effect on the predictable component of the risk premium,
as revealed by the above specification, is of economically small magnitude and tends to dissipate
after approximately two weeks. While adjustment frictions could be incorporated into the model,
we choose not to do that in the basic version of the model presented here.
Figure 4: Coefficient of lagged σ and log(V/c) fit on the spread of the break-even condition with varying
lags. The shaded regions are the 95% asymptotic confidence bands around the regression coefficients.
## 5.2.3 Price Spread Effect
Here we show that impermanent loss is not predictable with respect to price spread, backing our
modeling assumption that the pool price matches the external price in expectation at the end of
the period. First, we compute the spread ∆ between the pool price and external price at the start
of each day along with the realized impermanent loss with respect to BNS. We define the spread
as the percentage difference between the pool price and external price with respect to the external
price. The calculation for realized impermanent loss is a bit more involved. We use LP token data
and pool reserve amounts for the Uniswap V2 ETH-USDC pool to determine LP token values at
21the start and end of each day. However, pool reserve amounts include fees earned, so in order
to determine the value of an LP’s initial investment, we deduct these fees from the pool reserve
amounts at the end of each day. Finally, we compare the returns of a BNS portfolio against the
value of the pool reserve less fees at the end of each day to determine impermanent loss.
Concretely, impermanent loss for each day is computed using the following equations. R repre-
sents pool reserve amounts, TS represents LP token supply, F is the fees collected for each asset
throughout the day, and γ represents the staked return rate for that particular day. Times 0 and 1
denote start and end of day.
TV0 = RUSDC
0 + RETH
0 · p0

/TS0 (25)
TV1 = RUSDC
1 − FUSDC
+ RETH
1 − FETH

· p1

/TS1 (26)
TV BNS
1 = RUSDC
0 · γUSDC + RETH
0 · γETH · p1

/TS0 (27)
L =
TV BNS
1 − TV1
TV0
(28)
We then ran linear regressions using OLS to determine the predictability of impermanent loss
with respect to spread at start of day and lagged price volatility. Results are summarized in table 2.
We can clearly see that price spread at start of day does not predict impermanent loss given the
high standard errors and p-values.
Parameter Coefficient Std Err P-Value
const 0.0002 1.29e-05 0
∆ -0.0041 0.006 0.483
Parameter Coefficient Std Err P-Value
const 0.0001 6.34e-05 0.090
∆ -0.0036 0.006 0.532
Lagged σ 0.0045 0.003 0.086
Table 2: Linear regression parameters predicting impermanent loss. Two regressions were run, one just using
spread and one with spread and lagged price volatility σ.
225.2.4 Break-even Condition
To show that buy-and-stake (BNS) is a better baseline than the traditionally considered buy-and-
hold (BNH) portfolio, we compare each to the real-world returns LPs make on the ETH-USDC
Uniswap V2 pool. We use data from AAVE and Lido to determine the staked returns for both
ETH and USDC and compare the spread between the BNS/BNH and LP returns. Our findings are
summarized in table 3. Overall, we find that BNS is significantly better at tracking the returns of
LPs.
BNS Spread BNH Spread |BNS Spread| |BNH Spread| Window
−8.508 · 10−6 9.5427 · 10−5 1.3617 · 10−4 1.8283 · 10−4 1 day
Table 3: Spreads for BNH and BNS returns compared to LP returns. The first two columns are the mean
spread for each portfolio, and the third and fourth columns are the mean of the absolute value of the spreads.
## 5.3 Parameter Estimation
To estimate parameters, we apply the generalized method of moments (GMM). We aim to estimate
four parameters in total: a0, ac, aσ, and RP.
We define unconditional GMM moments by conditioning down the volume equation, (22), and
the conditional break-even condition for the LPs, (12). We list the resulting moment conditions in
(29–42) below.
The moment E[g0] = 0 indicates that the residual εt in the volume equation has zero mean.
Conditions E[gi] = 0, i = 3,4,5 state that the residual in the volume equation is not correlated with
lagged values of price volatility, trade count, and trade size.
The moment E[g1] = 0 is the average break-even condition, stating that the average spread
between the LP return implemented by the model and the empirical buy-and-stake return is equal to
the risk premium. Other unconditional versions of the break-even condition, expressed as E[gi] = 0,
i = 6,7,8,9,10, are obtained by interacting the LP vs. buy-and-stake return spread with the
lagged values of price volatility, log liquidity, log trading volume, trade count, and trade size. As
we discussed above, the size of the pool relative to the predictors of trading volume is a natural
candidate for predicting the return spread earned by liquidity providers.
The moment E[g2] = 0 states that the average spread between the empirical LP return and
the buy-and-stake return is equal to the risk premium – this moment identifies the risk premium
23parameter RP. Moments E[gi] = 0, i = 11,12,13 require the risk premium to be uncorrelated with
the lagged values of the log pool size, log trading volume, and price volatility.
In summary, we define our moments as
g0(t) = Vt − (ā0 + aσ · σt−1 + ac · logct−1) (29)
g1(t) = f · (ā0 + aσ · σt−1 + ac · logct−1) ·
1
ct−1
+
√
vt − BNSt − RP (30)
g2(t) = LPt − BNSt − RP (31)
g3(t) = g0(t) · σt−1 (32)
g4(t) = g0(t) · TCt−1 (33)
g5(t) = g0(t) · TSt−1 (34)
g6(t) = g1(t) · σt−1 (35)
g7(t) = g1(t) · log(ct−1) (36)
g8(t) = g1(t) · log(Vt−1) (37)
g9(t) = g1(t) · TCt−1 (38)
g10(t) = g1(t) · TSt−1 (39)
g11(t) = g2(t) · log(ct−1) (40)
g12(t) = g2(t) · log(Vt−1) (41)
g13(t) = g2(t) · σt−1 (42)
(43)
where vt is the external price movement during time window t, V is the real noise volume, BNS is
the baseline BNS portfolio based on real data, and LP is real LP returns assuming entry and exit
at the beginning and end of the time window.
With our moments defined, we run a two-step GMM (e.g., Cochrane (2009)). Our GMM is
run on daily windows of our data, resulting in over 800 data points. We scale both liquidity c and
trading volume c to be in units of $1M USD for more reasonable parameter values. We use the
identity weight matrix for the first step. In the second step, we specify the weight matrix as the
inverse of the diagonal matrix of the moment variances (using the estimated parameters from the
first step to evaluate the moments). We find little change in estimated parameter value between
the two steps.
We summarize parameter estimates and their standard errors in Table 4. An example of the
24Figure 5: A visual depiction of the break-even condition using parameters fit from GMM. L = 0.000135 and
σ = 0.467 were chosen from the medians of our data and a fee of 0.002 was used.
break-even condition with our fitted parameters can be seen in Figure 5.
Parameter Value Std Err 95% Confidence Interval
a0 -21.6456 6.0736 -33.5499, -9.7412
ac 5.1079 1.4866 2.1942, 8.0216
aσ 11.1560 1.6743 7.8743, 14.4376
RP -1.7941e-5 9.7519e-6 -3.7055e-5, 1.1724e-6
Table 4: Estimated values of our model parameters using Generalized Method of Moments. The standard
error was calculated using the Newey-West approxmiation for the spectral density matrix with k = 6. The
liquidity and trading volume values used in GMM were scaled down by 106
to achieve more reasonable values.
## 5.3.1 Relation between Optimal Fee and σ
Having estimated model parameters, we explore the relationship between optimal fee and price
volatility σ. We assume a log normal distribution for the percent change in price with parameters
µ,σ, which allows us to characterize the expected impermanent loss as
25E[L] = γ

exp

µ +
σ2
2

− exp

µ
2
+
σ2
8

(44)
We then compute the optimal fee over varying σ and plot the results in Figure 6. The range of af
used is identified from the estimation exercise outlined in section 6.2. This can be thought of as the
optimal fee the platform should set as a function of their belief of the next period’s price volatility
σ. As shown, there is a clear positive relation between the optimal fee and price volatility. As price
becomes more volatile, fee should increase. This result motivates the need for dynamic fees, which
we explore in the following section.
Figure 6: Daily optimal fee f∗
with varying annualized σ and µ = 0 to represent an equal chance of the
price moving up or down. The values used for staked USDC and ETH returns were the average over the
data collected 0.98 and 1.1 basis points, respectively.
## 6 Dynamic Fees
In this section we explore the impact of a dynamic AMM fee in a simulated environment, calibrated
to Uniswap v2 data. We find economically significant differences between the dynamic fee process
implied by our model and the current constant fee structure in Uniswap v2.
To implement the dynamic fee policy, two additional elements are needed: a predictive model
of impermanent loss L (which depends on future prices and volatility), and the parameter af,
26describing the sensitivity of the trading volume to transasction fees.7 While we cannot identify af
empirically, we define below an implied range for af values based on the Uniswap v2 data, and
perform sensitivity analysis with respect to af over the empirically relevant range.
This section is organized as follows: first, we describe the simulation of the trading model. Then
we determine the relevant implied range for af. Next, we analyze the relation between the dynamic
fees and price volatility and compare the performance of the dynamic fee policy to the static fee
used by Uniswap v2.
## 6.1 Simulation
We simulate the decision process of both the platform and the LPs. For a given day t, the platform
first computes the optimal fee assuming that the LPs strategically deposit liquidity according to
(20), conditionally on σt−1. Liquidity providers act next. We then compute the expected trade
volume given σt−1; the price moves according to the real price process from Binance; and profits
are realized at the end of the day.
To define the break-even liquidity, we need to model expectations of impermanent loss by the
platform operators and by liquidity providers. For our simulation experiments, we make a simpli-
fying assumption that both groups use recent price volatility as the only predictor of impermanent
loss, and that their conditional expectation of impermanent loss is described by a three-parameter
(L,k,σ0) logistic function on lagged price volatility σ.
E[Lt|σt−1] =
L
1 + exp(−k(σt−1 − σ0))
(45)
Figure 7 shows the fit of our model of the expected impermanent loss. The choice of the statistical
model for the expected impermanent loss affects the precise response of the optimal fee to changes
in conditional price volatility. However, the comparison of the fixed and dynamic fee rules should
be less affected, because we evaluate both rules using the same forecast of L.
Finally, we use estimated parameters a0,ac,aσ on data from Uniswap V2 between September
2022 and December 2024 and run the simulation on price data from Binance. We use the same
time window of one day as our GMM estimation. For each window t, we compute the annualized
σt from the one-second granular price data. For each time window, we compute optimal liquidity,
7
The sensitivity parameter af cannot be identified with the constant fee history under Uniswap v2. Uniswap
v3 data provides an avenue, however mapping v3 to v2 proves to be a non-trivial task. In the future, it should be
feasible to estimate af under the Uniswap v4 protocol.
27Figure 7: A fit of the logistic predictive model for impermanent loss L as a function of lagged price volatility
σ. The fitted parameters used were L = 0.0021,k = 27.7716,σ0 = 0.1064.
fee, and expected trading volume for both the fixed and dynamic fee policies.
## 6.2 Implied range of af
As mentioned, estimation opportunities for fee sensitivity af are limited until v4 experiments can
be implemented. Nonetheless, we can make some progress by assuming that the current 0.3% fee is
equal to the average value of the optimal dynamic fee over our sample period. We run a simulation
of daily dynamic fees for the same dates as the GMM parameters were fit on (Sept 2022 - Dec 2024).
To find the optimal fee, for each day t, we iterate over all fees between 0−3% with a step of 0.00001
(1/10 of a bp) and compute the break-even liquidity in response to fee and σt−1. We then pick the
fee that results in the maximal break-even liquidity and compute trading volume as a function of
σt. This can be thought of as the process the platform goes through to determine the optimal fee
to set, in each period.
We find that a range of roughly 2500 ≤ af ≤ 3500 is “reasonable”, with af ≈ 3250 being the
closest to having an average fee of the current status quo of 0.003. As expected, as af increases,
the optimal fee declines.
28Figure 8: Optimal daily dynamic fees for price data from September 2022 to December 2024 for af =
2500,3500.
## 6.3 Impact of Dynamic Fees
We quantify the benefits of dynamic fee AMMs relative to fixed fee AMMs using af values within
the range determined from our previous analysis. We employ the same logistic model to forecast
impermanent loss and utilize out-of-sample price data from December 17, 2024 to May 9, 2025 (144
days).
For each trading day, we simulate aggregate fees earned under dynamic versus fixed fee struc-
tures. Dynamic fees follow the process described above, while fixed fees assume LPs optimize their
response to a constant 0.3% fee rate. Solutions were found on all days for both dynamic and static
fee mechanisms. Consistent with our earlier methodology, we exclude these days from the analysis.
Figure 9 presents the cumulative fee differential, while Table 5 reports average liquidity in-
creases under dynamic pricing. Using our estimated af = 3250, the dynamic mechanism generates
approximately $440,000 in additional fees annually—an 13.2% annual improvement over fixed fees.
Moreover, average liquidity increases by 2.6%.
These results demonstrate that dynamic fee AMMs achieve superior efficiency relative to fixed
fee alternatives, even accounting for forecasting errors inherent in practical implementation (as
shown in Figure 7).
29Figure 9: The cumulative difference in fees collected by the platform with dynamic fees vs. a fixed 0.003
fee. Units of fees are in $1,000,000. In ascending order, each af resulted in 43.7%, 29.7%, 20.0%, 13.2%, and
8.8% additional cumulative fees over a fixed fee, annualized.
af 2500 2750 3000 3250 3500
Average Liquidity Increase 9.9% 6.1% 3.8% 2.6% 2.0%
Table 5: The additional percentage of liquidity a dynamic fee AMM generates versus a fixed 0.003 fee AMM.
The percent increase (D − F)/F where D is dynamic liquidity and F is fixed liquidity was computed for
each day between Dec 17 2024 - May 9 2025.
## 7 Discussion
We define a structural model of AMMs to determine how and when fees should be dynamically
adjusted, addressing a question central to classical market microstructure but largely unexplored in
decentralized markets. Unlike traditional markets, which use volatility-sensitive spreads to mitigate
adverse selection, AMMs currently rely on static fees. Our model captures the interconnected
decisions of platforms, liquidity providers, and traders to describe the behavior of a “stable-risk”
asset pair AMM. Using a three-period game, we analyze how agents jointly determine the AMM
fee, trade volume, and liquidity provisioned. We derive equilibrium conditions for both the optimal
fee and liquidity, establishing a positive relationship between price volatility and the optimal fee.
Our key contribution lies in combining a rigorous theoretical framework with empirical struc-
30tural estimation that addresses endogeneity between trading volume and liquidity provision, a gap
in prior research. Using a two-stage generalized method of moments (GMM) approach, we pro-
vide robust empirical evidence that optimal AMM fees should dynamically adjust to asset price
volatility. This contribution bridges traditional and decentralized finance, revealing that AMMs
and traditional markets share common design principles for dynamic fee structures, despite their
significant microstructure differences.
Our findings show that static fees in AMMs lead to inefficiencies, such as lower liquidity and
reduced trading volumes, underscoring the critical need for dynamic fee mechanisms. While the
absence of CFMMs with dynamic fees limits full quantification of the volatility-fee relationship, our
results offer actionable insights for designing more efficient and scalable AMMs.
Future research could refine and extend our model in several ways. For example, while our
functional form for trading volume empirically captures its high-level relationship with fees, liquidity,
and volatility, it does not fully account for edge conditions, such as trading volume approaching zero
when fees approach one or liquidity falls to zero. Uniswap v3’s multiple fee tiers provide a potential
data source, though mapping this to an equivalent CFMM model is challenging due to bonding
constraints. Alternatively, Uniswap v4 offers an opportunity to design and test a dynamic fee AMM,
enabling further validation of our findings. These extensions could deepen our understanding of
trading behavior under dynamic fees, advancing both theory and practice in decentralized markets.
References
Adams, A., C. Moallemi, S. Reynolds, D. Robinson. 2024. am-amm: An auction-managed automated market
maker. arXiv preprint arXiv:2403.03367.
Angeris, G., H.-T. Kao, R. Chiang, C. Noyes, T. Chitra. 2021. An analysis of uniswap markets. Cryptoeco-
nomic Systems. doi:https://doi.org/10.21428/58320208.c9738e64.
Capponi, A., R. Jia. 2021. The adoption of blockchain-based decentralized exchanges. arXiv preprint
arXiv:2103.08842.
Cochrane, J. H. 2009. Asset pricing. Princeton University Press.
Day, A., E. Medvedev. 2018. Ethereum in BigQuery: a public dataset for smart
contract analytics. https://cloud.google.com/blog/products/data-analytics/
ethereum-bigquery-public-dataset-smart-contract-analytics. Accessed: 2024-11-21.
Easley, D., M. O’Hara. 1987. Price, trade size, and information in securities markets. Journal of Financial
economics 19(1) 69–90.
Evans, A., G. Angeris, T. Chitra. 2021. Optimal fees for geometric mean market makers. FC.
31Glosten, L. R., P. R. Milgrom. 1985. Bid, ask and transaction prices in a specialist market with heteroge-
neously informed traders. Journal of financial economics 14(1) 71–100.
Hasbrouck, J., T. J. Rivera, F. Saleh. 2022. The need for fees at a DEX: How increases in fees can increase
DEX trading volume. Available at SSRN .
Hasbrouck, J., T. J. Rivera, F. Saleh. 2023. An economic model of a decentralized exchange with concentrated
liquidity. Available at SSRN 4529513.
Ippolito, M. 2023. DEXs: Uniswap origin, intents, scaling. https://youtu.be/OJsGuvCydL4?t=3455.
Kyle, A. S. 1985. Continuous auctions and insider trading. Econometrica 1315–1335.
Lehar, A., C. A. Parlour. 2021. Decentralized exchanges. Available at SSRN 3905316 .
Malinova, K., A. Park. 2023. Learning from DeFi: Would automated market makers improve equity trading?
Working Paper .
Milionis, J., C. C. Moallemi, T. Roughgarden. 2023. Automated market making and arbitrage profits in the
presence of fees. arXiv preprint arXiv:2305.14604 .
Milionis, J., C. C. Moallemi, T. Roughgarden, A. L. Zhang. 2022. Automated market making and loss-
versus-rebalancing. arXiv preprint arXiv:2208.06046 .
Rao, R., N. Shah. 2023. Triangle fees. arXiv preprint arXiv:2306.17316.
Shin, L., H. Adams. 2023. What makes uniswap v4 special. https://youtu.be/KNK-W8JDuWg?t=1037.
Warmuz, J., A. Chaudhary, D. Pinna. 2022. Toxic liquidation spirals. arXiv preprint arXiv:2212.07306.
32Appendix
A Proofs
Proof of lemma 1. Intuitively, since BNS is strictly better than a buy-and-hold portfolio, it must
be the case that this is true. More formally, we see
γ(E[v]) − E[
√
v] ≥ 0 (46)
eγs·dt + eγr·dt · E[v]
2
− E[
√
v] ≥ 0 (47)
Note that by definition we have that the staked returns γs,γr ≥ 1. Thus,
eγs·dt + eγr·dt · E[v]
2
− E[
√
v] ≥
1 + E[v]
2
− E[
√
v] ≥ 0 (48)
Let φ(v) be the PDF for the distribution of v. We then see
Z
φ(v)

1 + v
2
−
√
v

dv ≥ 0 (49)
Since v only takes on non-negative values, by AM-GM this must always be true.
Proof of lemma 2. Consider the derivative of the break-even with respect to f. Note that c is a
function of f.
f · V (f,σ,c) = c · (L + RP) (50)
V (f,σ,c) + f ·

∂V
∂f
+
∂V
∂c
·
∂c
∂f

=
∂c
∂f
· (L + RP) (51)
We assume σ is exogenously determined, so it is not dependent on f. By definition, ∂c
∂f = 0 when
the platform picks the best fee f∗ such that liquidity is maximized. Thus, the first-order condition
of the break-even states that
V (f,σ,c) + f ·
∂V
∂f
= 0 (52)
Finally, since V,f > 0, it must be the case that ∂V
∂f < 0.
Proof of theorem 1. Taking the first order condition with respect to f of the break-even results
in the following equation:
33∂
∂f
c =
a0 − 2af · f + aσ · σ
L + RP
= 0 (53)
a0 − 2af · f + aσ · σ = 0 (54)
f =
1
2af
(a0 + aσ · σ) (55)
Proof of theorem 2. Manipulating the break-even, we see that
f · V (f,σ,c) = c · (L + RP) (56)
f · (a0 − af · f + aσ · σ + ac · log(c)) = c · (L + RP) (57)
c · (L + RP) − f · (a0 − af · f + aσ · σ)
f · ac
= log(c) (58)
exp

c · (L + RP) − f · (a0 − af · f + aσ · σ)
f · ac

= c (59)
exp

c · (L + RP)
f · ac

· exp

−f · (a0 − af · f + aσ · σ)
f · ac

= c (60)
Let u = c·(L+RP)
f·ac
, so c = u·f·ac
L+RP .
u · f · ac
L + RP
= exp(u) · exp

af · f − a0 − aσ · σ
ac

(61)
u · exp(−u) =
L + RP
f · ac
· exp

af · f − a0 − aσ · σ
ac

(62)
−u = W

−
L + RP
f · ac
· exp

af · f − a0 − aσ · σ
ac

(63)
Finally, substituting c back in for u, we have
−
c · (L + RP)
f · ac
= W

−
L + RP
f · ac
· exp

af · f − a0 − aσ · σ
ac

(64)
c∗
= −
f · ac
L + RP
· W

−
L + RP
f · ac
· exp

af · f − a0 − aσ · σ
ac

(65)
Proof of theorem 3. Consider the rate of change with respect to c of both sides of the break-even
34constraint. On the RHS, by assumption, it is simply a positive constant L + RP. On the LHS,
we have ac
c . Note that as c → ∞, the rate at which it changes approaches 0. Thus, if there are
solutions to the break-even, it must be the case that the largest solution crosses the RHS from top
to bottom, meaning it is stable.
B Arbitrageur Behavior
Here, we describe the behavior of arbitrageurs. We assume that arbitrageurs incur AMM trading
costs (including fees and slippage), but are otherwise able to frictionlessly trade between the AMM
and an external market to realize the arbitrage. They trade the quantity that maximizes their profit
after the price shock v has been realized. Note that if v > 1, a potential profit opportunity exists
by buying from the AMM and selling externally. Similarly, if v < 1, a potential profit opportunity
is to buy externally and sell to the AMM.
We assume initial reserve amounts of ℓs,ℓr, which implies p0 = ℓs
ℓr
. Their optimization problem
depends on the realized value of the price multiplier v, and is given by
max
x≥0








x · v · p0 − x · pbuy
e (c,f,x)
x · psell
e (c,f,x) − x · v · p0








if v ≥ 1
if v < 1.
(66)
Case 1: v > 1, i.e., the arbitrageur buys from the AMM and sells externally for profit.
g(x)
def
= max
0≤x<ℓr
v ·
ℓs
ℓr
· x −
1
1 − f

ℓsℓr
ℓr − x
− ℓs

(67)
Then
dg
dx
= v ·
ℓs
ℓr
−
ℓsℓr
(1 − f)(ℓr − x)2
(68)
d2g
dx2
= −
2ℓsℓr
(1 − f)(ℓr − x)3
(69)
Note that d2g
dx2 ≤ 0 for 0 ≤ x < ℓr. This means that if dg
dx(0) < 0, then dg
dx < 0 for all x.
dg
dx
(0) = v ·
ℓs
ℓr
−
ℓs
(1 − f)ℓr
(70)
35So if 1
1−f > v > 1, we have that the optimal x is x = 0. We can also check that
v <
1
1 − f
⇒ v ·
ℓs
ℓr
· x −
1
1 − f

ℓsℓr
ℓr − x
− ℓs

≤ 0 for all x > 0 (71)
So for the rest of the analysis, we assume v > 1
1−f In this case, the first-order condition (given by
Equation 68) becomes
v =
ℓ2
r
(1 − f)(ℓr − x)2
(72)
Solving for x, we have
x = ℓr ±
ℓr
p
(1 − f)v
(73)
Since we assume x ≤ ℓr, we have
x = ℓr −
ℓr
p
(1 − f)v
(74)
Thus the informed trader’s best response is
x =

      
      
0 if 1 < v ≤ 1
1−f
ℓr − ℓr √
(1−f)v
if v > 1
1−f
(75)
Case 2: When v < 1, then the arbitrageur wishes to buy externally and sell to the AMM.
g(x)
def
= max
x
ℓs −
ℓsℓr
ℓr + (1 − f)x
− x · v ·
ℓs
ℓr
(76)
Then
dg
dx
=
(1 − f)ℓsℓr
(ℓr + (1 − f)x)2
− v ·
ℓs
ℓr
(77)
d2g
dx2
= −
2(1 − f)2ℓsℓr
(ℓr + (1 − f)x)3
(78)
The first-order condition becomes
v =
(1 − f)ℓ2
r
(ℓr + (1 − f)x)2
(79)
Solving for x, we have
x =
ℓr
p
(1 − f)v
−
ℓr
1 − f
(80)
36Note that x is positive only if v < 1 − f. If v > 1 − f, the optimization (Equation 76)
ℓs −
ℓsℓr
ℓr + (1 − f)x
− v ·
ℓs
ℓr
· x < 0 for all x ̸= 0 (81)
So the optimal x in this case is x = 0
x =

      
      
0 if 1 > v > 1 − f
ℓr
1−f − ℓr √
(1−f)v
if v < 1 − f
(82)
Thus, the arbitrageur’s optimal response for any price change v is
x =

            
            
0 if 1 − f ≤ v ≤ 1
1−f
ℓr − ℓr √
(1−f)v
if v > 1
1−f
ℓr
1−f − ℓr √
(1−f)v
if v < 1 − f
(83)
37