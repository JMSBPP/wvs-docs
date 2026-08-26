---
sha256: afdb6424f1c9ab270aad438e96e7098c2405c4cba794311796b14b6614e83cfb
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 44223
---
arXiv:2403.03367v4 [q-fin.TR] 12 Feb 2025
am-AMM: An Auction-Managed Automated Market Maker∗
Austin Adams
Whetstone Research
email: austin@whetstone.cc
Ciamac C. Moallemi
Columbia University / Paradigm
email: ciamac@gsb.columbia.edu
Sara Reynolds
Uniswap Labs
email: sara@uniswap.org
Dan Robinson
Paradigm
email: dan@paradigm.xyz
Initial version: February 13, 2024
This version: February 12, 2025
Abstract
Automated market makers (AMMs) have emerged as the dominant market mechanism for
trading on decentralized exchanges implemented on blockchains. This paper presents a single
mechanism that targets two important unsolved problems for AMMs: reducing losses to in-
formed orderflow, and maximizing revenue from uninformed orderflow. The “auction-managed
AMM” works by running a censorship-resistant onchain auction for the right to temporarily act
as “pool manager” for a constant-product AMM. The pool manager sets the swap fee rate on the
pool, and also receives the accrued fees from swaps. The pool manager can exclusively capture
some arbitrage by trading against the pool in response to small price movements, and also can
set swap fees incorporating price sensitivity of retail orderflow and adapting to changing market
conditions, with the benefits from both ultimately accruing to liquidity providers. Liquidity
providers can enter and exit the pool freely in response to changing rent, though they must pay
a small fee on withdrawal. We prove that under certain assumptions, this AMM should have
higher liquidity in equilibrium than any standard, fixed-fee AMM.
1. Introduction
Liquidity providers (LPs) for automated market makers (AMMs) want to minimize their losses
to arbitrageurs while maximizing fee revenue from retail flow. Each of these is a major unsolved
problem in AMM design. Minimizing losses to arbitrageurs (which can be characterized as “loss-
vs-rebalancing,” or LVR) requires either setting high fees or relying on some other mechanism
to capture the profits from information or latency arbitrage and mitigate losses to agents (arbi-
trageurs), who possess superior information on the market value of the asset and snipe stale prices
posted by the AMM. Meanwhile, the optimal fee for a given asset pair depends on how retail volume
for that pair responds to fees — a difficult problem that is not easy to model. Moreover, the opti-
mal fee may be dynamic and vary with other market variables such as volatility or overall market
volume. In standard fixed-fee AMMs (ff-AMMs), these problems compound and interfere with each
∗
The second author is supported by the Briger Family Digital Finance Lab at Columbia Business School, and is
an advisor to Paradigm and to fintech companies. The authors wish to thank Agostino Capponi, Mallesh Pai, and
Anthony Zhang for helpful comments.
1other: liquidity providers must choose a pool with fees high enough to reduce arbitrage opportuni-
ties while still low enough to capture value from retail flow. Additionally, liquidity providers must
make this choice statically and for themselves, and if they disagree, liquidity ends up fragmented
across multiple pools.
In this paper, we propose the auction-managed AMM (am-AMM), a new AMM design that
targets both LVR reduction and fee optimization with one mechanism. The mechanism incentivizes
sophisticated market participants to capture some of the value leaked by the AMM, and also lets
those market participants set fees at a level that optimizes revenue from retail traders. The pool
maintains synchronous composability with other onchain contracts, does not require price oracles,
and is resistant to censorship. It also ensures accessibility, meaning that liquidity on the pool can
always be traded against with some capped fee. Under certain assumptions, we prove that the
am-AMM will attract more liquidity than any fixed-fee constant product AMM pool (with any fee
up to the cap), in equilibrium.
The am-AMM is a constant-product AMM. The AMM utilizes an onchain censorship-resistant
“Harberger lease” auction to find the highest bidder. The current highest bidder in the ongoing
auction, known as the manager, pays rent to liquidity providers. In exchange, the manager can
dynamically set the swap fee rate (up to some maximum cap), and receives all swap fees collected by
the pool. This allows the manager to capture small arbitrage opportunities each block by trading
on the pool, since they can trade with effectively zero fee. It also incentivizes them to set the swap
fee in order to maximize revenue from uninformed flow. Liquidity providers can enter and exit the
pool freely (though they pay a small withdrawal fee).
The am-AMM has some drawbacks. It may provide even fewer protections against sandwich
attacks than a fixed-fee AMM, since the pool manager’s ability to trade without fees allows them
to profit by pushing any publicly visible transaction to its limit price. It also could contribute
to centralization of block builder infrastructure. We think these limitations and drawbacks war-
rant future study, as does the problem of making this feature work with concentrated liquidity
Adams et al. (2021).
Related literature. While automated market makers are newer compared to many financial market
primitives, the literature on the subject is growing rapidly. The concept of AMMs can be traced
back to Hanson (2007) and Othman et al. (2013). Early literature on the current implementations
of AMMs includes Angeris et al. (2019), Angeris and Chitra (2020), Lehar and Parlour (2021),
Capponi and Jia (2021), and Hasbrouck et al. (2022). Implementation details of automated market
makers are described in Adams et al. (2020) and Adams et al. (2021). Furthermore, Adams et al.
(2023b) describes a forthcoming platform for customizable AMMs.
Our paper builds directly on the loss-vs-rebalancing framework established in Milionis et al.
(2022) and Milionis et al. (2023) as a model for evaluating designs for AMMs. Contemporaneous
with the this paper, Ma and Crapis (2024) analyze liquidity provision in AMMs with a similar
model of LP profitability and noise trader demand as the present paper.
The idea described in this paper is an instance of an ex ante auction for the right to capture the
2arbitrage profit from the block, an idea first proposed by Alex Herrmann from Gnosis as the “MEV
capturing AMM” (McAMM) in Herrmann (2022). This paper extends that concept to allow the
manager to also select the fee charged to retail traders and collect those fees, thus using a similar
mechanism to address an independent problem. Also, unlike the McAMM, the auction proposed
here guarantees the property of accessibility — people can trade against the pool even if the current
manager has not submitted a transaction in this block.
Our paper also proposes a way to optimize fees that takes into account the difficult-to-model de-
mand function for retail orderflow. Some AMMs, such as Uniswap v3 (Adams et al., 2021) address
this problem by letting liquidity providers choose between different static “fee tiers.” This puts the
responsibility for optimizing fees on individual liquidity providers, can lead to some fragmentation
of liquidity. Other automated market makers have implemented dynamic fees on individual pools,
including Trader Joe v2.1 (MountainFarmer et al., 2022), Curve v2 (Egorov and GmbH), 2021),
and Mooniswap (Bukov and Melnik, 2020), as well as Nezlobin (2023). Cartea et al. (2023) pro-
pose a design involving dynamic fees and dynamic price impact functions. While innovative, these
dynamic fee implementations are not necessarily optimized for maximizing liquidity. The am-AMM
is a first attempt at a provably incentive-compatible dynamic fee, where the fee is set by the market
in a way that should always attract more liquidity than any fixed-fee AMM.
2. Auction Design
The auction is designed to set up a censorship-resistant version of the two-stage game modelled
in Section 3.2, where (1) potential managers bid for the right to set and earn the trading fee in a
future block; and (2) liquidity providers respond by adding or removing liquidity. The auction uses
a delay parameter K. The rules of the auction are designed so that both the rent and the pool
manager for block N are locked in as of block N − K.
Harberger lease. The right to be the manager of a pool is set in a special onchain auction we call
a “Harberger lease” (named after the “Harberger taxes” popularized by Posner and Weyl (2018)).
This is a continuously held English auction where bids are expressed in terms of rent per block.
The top bid at any given time determines the manager for the pool, who pays the rent to liquidity
providers in the pool for as long as that bid is active.
The rent is denominated and paid in pool tokens, and is paid out of the pool manager’s deposit
to all pool LP token holders proportional to their stake (thus effectively increasing the value of
those pool tokens). This ensures that pool tokens remain fungible and that rent is compounded
automatically.
Bidding rules. Each bid specifies a per-block rent R. When the bid is placed, it must include a
deposit D, which must be a multiple of R and must be at least R · K. Newly placed bids do not
become active immediately, but are delayed by K blocks. When either a new high bid becomes
active, or the current pool manager’s deposit is depleted, the new high bidder usurps the current
pool manager. The contract enforces a minimum bid increment.
3The top bid cannot be cancelled, but can reduce its deposit as long as it leave a minimum deposit
of Dtop ≥ RtopK. The contract keeps track of the next bid (which is either the next-highest bid
after the current top bid, or a bid that is higher than the top bid but is not yet active). If the
top bid does not have enough rent to pay for K blocks — that is, if Dtop
Rtop
< K, then the next bid
cannot be canceled, but must leave at least enough deposit such that
Dtop
Rtop
+ Dnext
Rnext
≥ K.
Pool manager rights. The current pool manager can adjust the swap fee for the next block at
any time, subject to a fixed fee cap fmax. The pool manager also receives all swap fees collected
by the pool. Since the pool manager receives swap fees, they are effectively able to swap on the
pool with zero fee. This means that they can capture arbitrages from small price movements that
no other arbitrageur would be able to profitably capture. However, if the price moves by more
than the current fee in a single block — in other words, if it moves outside the “no-trade region”
(Milionis et al., 2023) — then some of the profit could leak to other arbitrageurs, as discussed in
Section 3.2.
Censorship resistance. The delay parameter K should be chosen such that there is a negligible
probability that anyone can censor the base layer for K blocks in a row. This prevents someone
from stealing MEV from a high-volatility block by usurping the current manager and then censoring
arbitrage transactions for K blocks. It also ensures that liquidity providers can respond to changes
in rent by adding or removing liquidity before the new rent takes effect.
Withdrawal fees. Liquidity providers are free to enter or exit at any time. This allows them
to respond to anticipated changes in rent during the K-block delay. However, when liquidity
providers exit, they must pay a small withdrawal fee to the current manager. This prevents liquidity
providers from withdrawing liquidity after volatility is realized but before the current manager has
the opportunity to execute an arbitrage transaction. As shown in Appendix B, even a very small
withdrawal fee — less than 0.13 basis points, if the fee cap is 1% — can ensure that strategic liquidity
provider withdrawals cannot reduce the manager’s profit from a given arbitrage opportunity below
the amount assumed in Section 3. This fee could alternatively be replaced with a withdrawal delay
for a similar effect.
3. Theory
Our starting point is a model inspired by Milionis et al. (2022) and Milionis et al. (2023), which
consider an AMM trading a risky asset (denoted by x) versus the numéraire (denoted by y), and that
the risky asset has a fundamental price at all times (for example, on an infinitely deep centralized
exchange). As in Milionis et al. (2023), we assume that traders can only trade on the pool at
discrete block generation times.
Our setting is consistent with and can be structurally microfounded in the full setting of
Milionis et al. (2023), which assumes that blocks arrival times follow a Poisson process and that
the asset’s price follows geometric Brownian motion parameterized by volatility σ > 0, but our the-
orems do not depend on those assumptions. Instead we describe the model primitives in reduced
4form, with weaker assumptions, and provide examples that show that those models would satisfy
the assumptions.
We will restrict to the case of a constant product market maker,1 with invariant
√
xy = L,
where we denote the reserve quantities by (x,y) and the pool liquidity level by L. If the price
of the risky asset is given by P, the value of the the pool reserves is given by V (L) , 2
√
PL,
as a function of the available liquidity L. We assume the pool charges a proportional trading fee
f ∈ [0,fmax].
We consider a setting where there are two types of traders: (1) noise traders, who trade for
idiosyncratic reasons and generate fee income for the pool; and (2) arbitrageurs, who seek to exploit
price differences between the pool and the fundamental price, and create adverse selection costs
for the pool. Here, the P&L of LPs is a jump process, stochastically jumping at instances of block
generation. We will consider the expected aggregate instantaneous rate of P&L of LPs per unit
time, where we are averaging over stochasticity in future price changes, or, equivalently, assuming
that exposure to market risk of the risky asset has been hedged.
Noise traders. We assume there exists a population of noise traders that trade for idiosyncratic
reasons (e.g., convenience of executing on chain) and not for informational reasons. Hence, eco-
nomically, in our model noise traders serve exclusively to generate fee income for the pool. Given
pool fee f ≥ 0 and liquidity L ≥ 0, denote by H(f,L) the expected total volume of noise trades
arriving per unit time, denominated in the numéraire, so that fH(f,L) is the total rate per unit
time of fee revenue generated by the noise traders. We will assume that:
Assumption 1 (Noise trader demand). For L > 0, define
H0(f,L) , H(f,L)/V (L),
to be the expected noise trader volume per unit time per unit of pool value, we assume that H0(·,·)
is a continuous function satisfying:
1. For all L > 0, H0(f,L) is a decreasing function of f.
2. For all f ∈ [0,fmax], H0(f,L) is strictly decreasing function of L. Moreover, H0(f,L) ↓ 0 as
L → ∞, and H0(f,L) ↑ ∞ as L → 0.
Part 1 asserts that noise trader demand is decreasing in the price (fee) charged. Part 2 implies
that the noise trader is sub-linear in pool value or liquidity, i.e., noise trader demand is satiated.
Example 1. Consider H(f,L) , c0Lα exp(−c1f), where c0,c1 > 0 and α ∈ (0,1) are parame-
ters that could be estimated from transaction data, and may be time varying or may depend on
1
The key property of the constant product market maker we use is that the arbitrage profits and arbitrage excess
scale linearly with pool value, where the constant of proportionality does not depend on the price. This property holds
more generally for geometric mean market makers, and our results would trivially extend there. Beyond that, when
considering more general invariant curves, there may be additional second order effects due to the price changing over
time horizon of the LP investment. If price movements over the scale of the LP investment horizon are not large,
these effects may not be significant, and we would expect the high level insights of our model to continue to apply to
general invariant curves.
5other market parameters such as volatility or broader market volume. This liquidity dependence is
consistent with the model proposed by Hasbrouck et al. (2023).
Arbitrageur profits. We assume there is a competitive and deep market of arbitrageurs monitoring
prices in the AMM and exploiting price differences between the AMM and the fundamental price.
Denote by ARB_PROFIT(f,L) the expected profit to arbitrageurs per unit time, given fee f ∈
[0,fmax] and liquidity L ≥ 0. We make the following assumption:
Assumption 2 (Arbitrageur profits). For L > 0, we assume that
ARB_PROFIT(f,L) = AP0(f)V (L),
where AP0(·) is a continuous, decreasing function.
Assumption 2 guarantees that arbitrage profits scale linearly with the pool value or liquidity,
in contrast to noise trader volume. This is because we assume, by nature of engaging in riskless
activity, arbs have access to infinite capital for arbitrage activity, and arbitrage demand will not be
satiated so long as arbitrage opportunities are available. Assumption 2 also implies that, holding
liquidity fixed, arbitrageur profits are decreasing in the fee f, this is because the fee is a friction
that limits arbitrage.
This assumption does not depend on a particular model for either the asset price’s behavior
or for block generation times, but we show that it can be structurally microfounded in one such
model, as illustrated here:2
Example 2. Consider a setting where the risky asset’s price follows geometric Brownian motion
parameterized by volatility σ > 0 and blocks are generated at the arrivals of a Poisson process of
rate ∆t−1, with ∆t being the average interblock time. Milionis et al. (2023) establish that, when
∆t < 8σ2,
ARB_PROFIT(f,L) =
σ2
8
1
1 + f
σ
√
∆t/2
e+f/2 + e−f/2
2

1 − σ2∆t/8
V (L). (1)
This satisfies Assumption 2.
3.1. Fixed-Fee AMM Model
As a benchmark, we consider the standard AMM design with a fixed fee f ∈ [0,fmax], which we
refer to as a fixed-fee AMM (ff-AMM). Following the discussion above, we define the instantaneous
rate of aggregate expected P&L of LPs in this pool in excess of the risk free rate according to
ΠLP
ff (f,L) , fH(f,L) − ARB_PROFIT(f,L) − rV (L)
= (fH0(f,L) − AP0(f) − r)V (L),
(2)
2
See Section 4 for further discussion.
6where the first term in the sum is the revenue from noise traders, the second term is the loss to
arbs, and the final term is a capital charge, where r > 0 is the risk-free rate. Under free entry and
exit of LPs, we define the equilibrium in the fixed-fee AMM according to a zero profit condition:
Lemma 1 (ff-AMM equilibrium). Given fee f ∈ [0,fmax], define a liquidity level L∗ > 0 to be a
competitive equilibrium if LPs earn zero profit in excess of the risk free rate, i.e., ΠLP
ff (f,L∗) = 0.
Then, for any f ∈ [0,fmax], a unique equilibrium level of liquidity L∗ = Lff(f) exists.
3.2. Auction-Managed AMM Model
In this section, we consider the auction-managed AMM design.
Arbitrageur excess. In the am-AMM, the pool manager collects all of the fee revenue, and therefore,
effectively, can also trade against the pool without paying any fees. Therefore, the pool will suffer
adverse selection costs of ARB_PROFIT(0,L), independent of the fee level f. However, the manager
does not collect all of these fees as income. Instead, note that whenever the mispricing in the pool
exceeds the fee f, some of that mispricing can be profitably captured by agents other than the
manager. We denote by ARB_EXCESS(f,L) the instantaneous rate of expected arbitrage profit
per unit time forgone by the manager. We assume that:
Assumption 3 (Arbitrageur excess). For L > 0, we assume that
ARB_EXCESS(f,L) = AE0(f)V (L),
with AE0(f) a continuous, decreasing function that satisfies AE0(f) ≤ AP0(f), for all f ∈ [0,fmax],
and where the inequality is strict if f > 0.
Assumption 3 is largely analogous to Assumption 2, and can be similarly microfounded by a
stochastic model, as shown in Example 4, but does not depend on that model. The strict inequality
assumption simply asserts that some of the arbitrage profit is captured by the manager.
Example 3. One extreme setting is the McAMM design of Herrmann (2022). There, no trades can
occur in an AMM in a given block unless the pool manager has a transaction earlier in the block
to “unlock” the pool. Hence the pool manager is guaranteed to be the first transaction in everyblock
and can capture all arbitrage profits. In this case, ARB_EXCESS(f,L) = 0.
Example 4. In Section 4, we develop structural microfoundations of a model for arbitrageur excess
in the setting of Milionis et al. (2023), where the risky asset’s price follows geometric Brownian
motion parameterized by volatility σ > 0 and blocks are generated at the arrivals of a Poisson
process of rate ∆t−1, with ∆t being the average interblock time. In that setting, we assume that
(1) the pool manager fully monetizes any arbitrage where the mispricing is less than the fee f, and
(2) when the mispricing exceeds the fee f, other arbitrageurs correct the mispricing back to the fee
level f before the pool manager can trade, and hence the pool manager is only able to monetize the
7portion of the arbitrage up to f. Then, we establish that, when ∆t < 8σ2,
ARB_EXCESS(f,L) =
σ2
8
exp −
f
σ
p
∆t/2
!
e+f/2 + e−f/2
2

1 − σ2∆t/8
V (L). (3)
This satisfies the conditions of Assumption 3.
Comparing Example 2 and Example 4, we see that ARB_EXCESS(f,L) ≪ ARB_PROFIT(f,L)
in the sense that
ARB_EXCESS(f,L)
ARB_PROFIT(f,L)
=
AE0(f,L)
AP0(f,L)
= 1 +
f
σ
p
∆t/2
!
exp −
f
σ
p
∆t/2
!
,
which is exponentially vanishing in f/σ
√
∆t.
Equilibrium. We imagine a game that proceeds in two steps: (1) agents bid rent R, the agent with
the highest rent wins the auction and is declared the pool manager, with the right to determine
the trading fee f and earn all fees; and (2) LPs determine aggregate liquidity L given R. Based on
the discussion above, the P&L of the manager per unit time is given by
ΠMGR
am (R,L) , max
f∈[0,fmax]
{fH(f,L) + ARB_PROFIT(0,L)
−ARB_EXCESS(f,L) − R}
= max
f∈[0,fmax]
{fH0(f,L) + AP0(0) − AE0(f)}V (L) − R.
The maximization is because the manager is free to set the fee, and we assume they will do so to
maximize P&L. The first term captures the fact that the manager retains all fee revenue. The
second and third terms capture the fact that the manager earns arbitrage profits as if it pays no
fees, except for the arbitrage excess. The final term captures the fact that the manager pays rent.
On the other hand, the LPs in aggregate earn P&L per unit time given by
ΠLP
am(R,L) , R − ARB_PROFIT(0,L) − rV (L) = R − (AP0(0) + r)V (L).
Here, the first term is the rent payment made by the manager, the second term is the adverse
selection cost (which is as if no fees are charged), and the third term is the cost of capital. Given
these definitions, we have that:
Theorem 1 (am-AMM equilibrium). (R∗,L∗) is a competitive equilibrium of the am-AMM if the zero
profit conditions3
ΠMGR
am (R∗
,L∗
) = 0, ΠLP
am(R∗
,L∗
) = 0,
3
Here, we assume that entry and exit are frictionless for LPs, ignoring the withdrawal fees. This is justified if the
liquidity provision decision horizon is sufficiently long so that, amortized over its length, the withdrawal fees are de
minimus.
8are satisfied. An equilibrium (R∗,L∗) must exist, with equilibrium fees
f∗
∈ argmax
f∈[0,fmax]
fH0(f,L) − AE0(f), (4)
and satisfies L∗ > Lff(f), for all f ≥ 0. Therefore, in equilibrium, the am-AMM will have higher
liquidity than any ff-AMM.
Theorem 1 establishes that the equilibrium liquidity for the am-AMM is larger than that of any
ff-AMM. Beyond that, it gives insight into the equilibrium fee f∗ set in the am-AMM: from (4),
the pool operator will seek to set the fee to maximize noise trader revenue adjusted for arbitrageur
excess. As a comparison, consider the fee level foptthat exclusively maximizes noise trader revenue,
i.e.,
fopt ∈ argmax
f∈[0,fmax]
fH0(f,L∗
). (5)
If we assume that the revenue function f 7→ fH0(f,L∗) is concave, and the arbitrageur excess
function AE0(f) is convex, then a comparison of first order conditions for (4)–(5) reveals that
fopt ≤ f∗, i.e., the am-AMM will set fees higher than is purely revenue optimal. However, by virtue
of the optimality of f∗ in (4), we have that
foptH0(fopt,L∗
) − f∗
H0(f∗
,L∗
) ≤ AE0(fopt) − AE0(f∗
) ≤ AE0(fopt). (6)
In the arbitrageur excess model of Example 4, AE0(fopt) may be very small (since it is exponentially
vanishing in blocktime, for example), and in such cases (6) would imply that f∗ is also nearly optimal
from a noise trader revenue perspective.
4. A Structural Model for Arbitrageur Excess
In this section, we will derive the structural model for arbitrageur excess of Example 4, following
the arbitrageur profits model of Milionis et al. (2023) and of Example 2.
Fee structure. In order to simplify formulas, Milionis et al. (2023) uses a fee structure wherein a
proportional fee of e+γ − 1 = γ + o(γ) is charged for purchases of the risky asset from the pool,
while a proportional fee of 1 − e−γ = γ + o(γ) is charged for sales of the risky asset to the pool
— these are symmetric fees in log-price space. This is different than the setting in this paper,
where we assume a fee proportional f which is the same for buys or sells — that is, symmetric in
(linear) price space. In order to facilitate comparison with Milionis et al. (2023), we will make the
approximation f = γ. As illustrated in Example 1 of Milionis et al. (2023), for practical parameter
values, this does not make a significant difference.
Asset price dynamics. Denote by Pt the fundamental price of the asset, which follows a geometric
Brownian motion with drift µ > 0 and volatity σ > 0, and denote by P̃t the implied spot price of
the asset in the pool. Define zt , logPt/P̃t to be the log-mispricing at time t. When t is not a block
9generation time, Itô’s lemma implies that zt is governed by the stochastic differential equation
dzt =

µ − 1
2σ2

dt + σdBt, (7)
where Bt is a Brownian motion. We will make the symmetry assumption that µ = 1
2σ2, so that zt
is a driftless, (scaled) Brownian motion.
Block time dynamics. We assume that blocks are generated according to a Poisson process with
mean interarrival time ∆t. Denote the block generation times by 0 < τ1 < τ2 < .... At instances
t = τi when blocks are generated, we imagine that
1. If the |zt−| ≥ f (i.e., the mispricing immediately before block generation exceeds the fee),
we imagine an arbitrageur is able to trade until the mispricing is equal to the fee, and thus
earns profits that are not captured by the pool operator. These profits then become part of
arbitrageur excess. Following the derivation of Milionis et al. (2023), the instaneous profit
from arbitrageur excess when price is P = Pt and the mispricing is z = zt− due to buying
(respectively, selling) is given by
A+(P,z) ,
h
P
n
x∗

Pe−z

− x∗

Pe−f
o
+ e+f
n
y∗

Pe−z

− y∗

Pe−f
oi
I{z>+f} ≥ 0,
A−(P,z) ,
h
P
n
x∗

Pe−z

− x∗

Pe+f
o
+ e−f
n
y∗

Pe−z

− y∗

Pe+f
oi
I{z<−f} ≥ 0.
Here, the holdings of the pool when implied price is P are given by x∗(P) , L/
√
P, y∗(P) =
L
√
P.
2. After the arbitrageur trades, the pool operator corrects any remaining mispricing, so that
zt = 0.
Intensity of arbitrageur excess. The intensity or instaneous rate of arbitrageur excess per dollar
of pool value per unit time is given by
AE0(f) =
ARB_EXCESS(f,L)
V (L)
=
1
∆t
E

A+(P,z) + A−(P,z)
V (L)

,
where the expectation is over z = zτ at the next block generation time τ, i.e., z ∼ N(0,σ2τ) with
τ ∼ Exp(∆t−1).
10Observe that
A+(P,z)
V (L)
=
1
2L
√
P
h
P
n
x∗

Pe−z

− x∗

Pe−f
o
+ e+f
n
y∗

Pe−z

− y∗

Pe−f
oi
I{z>+f}
= 1
2
hn
e+z/2
− e+f/2
o
+ e+f
n
e−z/2
− e−f/2
oi
I{z>+f}
= 1
2e+f/2
h
e+(z−f)/2
− 2 + e−(z−f)/2
i
I{z>+f},
A−(P,z)
V (L)
=
1
2L
√
P
h
P
n
x∗

Pe−z

− x∗

Pe+f
o
+ e−f
n
y∗

Pe−z

− y∗

Pe+f
oi
I{z<−f}
= 1
2
hn
e+z/2
− e−f/2
o
+ e−f
n
e−z/2
− e+f/2
oi
I{z<−f}
= 1
2e−f/2
h
e+(z+f)/2
− 2 + e−(z+f)/2
i
I{z<−f},
Taking expectations of the first term, conditioned on the block generation time τ, we have
z ∼ N(0,σ2τ), so that
E

A+(P,z)
V (L)
τ

= −e
f
2 +
1
2

ef
+ 1

e
σ2τ
8 −
1
2
ef
e
σ2τ
8 erf
σ2τ + 2f
2
√
2σ
√
τ
!
+
1
2
e
σ2τ
8 erf
σ2τ − 2f
2
√
2σ
√
τ
!
+ e
f
2 erf
f
σ
√
τ
√
2
!
.
Taking expectations over τ ∼ Exp(∆t−1), assuming that ∆t < 8σ2,
1
∆t
E

A+(P,z)
V (L)

=
σ2
8
exp −
f
σ
p
∆t/2
!
e+f/2
2

1 − σ2∆t/8
.
Similarly, for the other term,
1
∆t
E

A−(P,z)
V (L)

=
σ2
8
exp −
f
σ
p
∆t/2
!
e−f/2
2

1 − σ2∆t/8
.
Combining these results yields the arbitrageur excess expression in (3).
Discussion. The expressions (1) for arbitrageur profits and (3) for arb excess have an interesting
common structure. In both cases, the expressions can be decomposed into the product of (1)
the probability that an arbitrageur can trade at the next block time; and (2) the expected profit
conditioned on trade. In the arbitrageur profits expression, the probability of trade is given by
1
1 + f
σ
√
∆t/2
,
while in the arbitrageur excess expression, it is given by
exp −
f
σ
p
∆t/2
!
.
11In both cases, however, the expected profit conditioned on trade is the same. Thus, the fact that
arbitrageur excess is less than arbitrageur profits is driven by the fact that the probability of trade
is (exponentially) less. This, in turn, is because the pool operator drives the mispricing to zero at
the end of every block, making large mispricings at the beginning of the next block unlikely.
5. Discussion
Advantages. One desirable characteristic of the auction-managed AMM is that it shifts the strate-
gic burden of determining the optimal fee from passive LPs to the pool manager, who, in turn will
set the fee according to (4), which seeks to set fees to optimize revenue from noise traders, adjusted
by arb excess paid to arbitraguers. This makes sense, since the pool manager is assumed to be a
more sophisticated entity that can perform off-chain modeling and analysis to estimate noise trader
sensitivity and losses to arbs.
Our model captures the most visible and salient features that drive noise trader demand (the
fee and the liquidity). However, as argued by Milionis et al. (2023) and Rao and Shah (2023),
noise traders may also be concerned with the accuracy of prices in the pool. Relative to an outside
reference price (e.g., the price on infinitely deep centralized exchange), noise traders pay an effective
spread which is the sum of the trading fee of the pool (deterministic, positive) and the relative
mispricing of the pool (stochastic, could be positive or negative). In general noise traders will
prefer pools with less relative mispricing. An additional benefit of the am-AMM over the ff-AMM
is that the quoted prices are more accurate. This is because the pool operator of an am-AMM
faces no fees in performing arbitrage trades against the pool, and is able to correct smaller price
discrepancies.
There is also an important transfer of risk between the LPs and the pool manager: in the
am-AMM, the LPs earn rent payments instead of noise trader fees. Since these rent payments are
determined ex ante, in equilibrium, they incorporate the expected value of future noise trader fee
revenue, in contrast to the actual noise trader fee revenue, which arrives in a lumpy and stochastic
fashion and goes to the pool manager. Although it is beyond the scope of the analysis we have
presented (which assumes risk neutrality), this risk transfer is likely welfare improving since the
pool manager is likely a larger and better capitalized entity than a typical passive LP, and is thus
less risk averse.
Drawbacks. The auction-managed AMM is not without drawbacks. First, the pool manager’s
ability to effectively trade on the pool with zero spread exacerbates the “sandwich attack” problem
with onchain AMMs, as discussed generally by Daian et al. (2020); Zhou et al. (2021); Adams et al.
(2023a). A party that can trade with zero fees can profit by pushing any publicly visible swap
transaction to its limit price. This is a meaningful drawback — which could hurt swappers or
ultimately discourage retail flow, thus potentially invalidating the assumption in Section 3 that
retail flow is only a function of liquidity and fee — but known mitigations for general sandwich
attacks could be applied, such as verifiable sequencing rules (Ferreira and Parkes, 2022), private
12relays (Adams et al., 2023a), or offchain filler auctions (Adams et al., 2023c).
Second, the ex ante auction for the arbitrage opportunity could have effects on the market for
block building. The pool manager’s exclusive right to capture some arbitrage profit from a pool
could give them an advantage in the block builder auction, similar to the advantages enjoyed by
builders with private orderflow discussed by Gupta et al. (2023). Additionally, while the am-AMM
allows any party to bid on the pool manager position, parties with greater sophistication or access
to private orderflow may be more likely to win the auction. On the other hand, by capturing some
arbitrage profit and reducing the power of block proposers, the am-AMM could mitigate some of
the harmful pressures that MEV puts on the blockchain consensus mechanism. We think these
possible consequences warrant further study.
Lastly, one disadvantage of the am-AMM over the McAMM discussed by Herrmann (2022) is
that the current manager does not capture the “arbitrage excess” that results from single-block
price movements beyond the no-trade region, as discussed in Section 3. This creates an incentive
for the manager to set a higher fee than the one that optimizes total fee revenue. This could be
fixed by requiring the manager to unlock the pool at every block, at the cost of sacrificing the
accessibility property.
Future work. In this paper, we focus on constant product market makers. Extending this design
to other AMMs — and particularly to concentrated liquidity AMMs, in which different liquidity
providers may have different returns during the same period and may go in or out of range as a
result of price changes — is left for future work.
Implementing this mechanism is also left for future work. Since we first made this paper
available, there has been at least one open-source third-party implementation BidDog (2024).
References
Austin Adams, Benjamin Y Chan, Sarit Markovich, and Xin Wan. 2023a. The Costs of Swapping on the
Uniswap Protocol. arXiv preprint arXiv:2309.13648 (2023).
Hayden Adams, Moody Salem, Noah Zinsmeister, Sara Reynolds, Austin Adams, Will Pote, Mark
Toda, Alice Henshaw, Emily Williams, and Dan Robinson. 2023b. Uniswap v4 Core [Draft].
https://github.com/Uniswap/v4-core/blob/main/docs/whitepaper-v4.pdf
Hayden Adams, Noah Zinsmeister, and Dan Robinson. 2020. Uniswap v2 Core. Retrieved Jun 12, 2023
from https://uniswap.org/whitepaper.pdf
Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. 2021. Uniswap v3 Core.
Retrieved Jun 12, 2023 from https://uniswap.org/whitepaper-v3.pdf
Hayden Adams, Noah Zinsmeister, Mark Toda, Emily Williams, Xin Wan, Matteo Leibowitz, Will Pote,
Allen Lin, Eric Zhong, Zhiyuan Yang, Riley Campbell, Alex Karys, and Dan Robinson. 2023c. UniswapX.
https://uniswap.org/whitepaper-uniswapx.pdf
Guillermo Angeris and Tarun Chitra. 2020. Improved price oracles: Constant function market makers. In
Proceedings of the 2nd ACM Conference on Advances in Financial Technologies. 80–91.
Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. 2019. An analysis of
Uniswap markets. arXiv preprint arXiv:1911.03380 (2019).
13BidDog. 2024. BidDog: Open source implementation of am-AMM auctions.
https://github.com/Bunniapp/biddog Accessed: 2024-05-22.
Anton Bukov and Mikhail Melnik. 2020. Mooniswap by 1inch.exchange. Retrieved Sept 18, 2023 from
https://mooniswap.exchange/docs/MooniswapWhitePaper-v1.0.pdf
Agostino Capponi and Ruizhe Jia. 2021. The adoption of blockchain-based decentralized exchanges. arXiv
preprint arXiv:2103.08842 (2021).
Álvaro Cartea, Fayçal Drissi, Leandro Sánchez-Betancourt, David Siska, and Lukasz Szpruch. 2023. Auto-
mated market makers designs beyond constant functions. Available at SSRN 4459177 (2023).
Philip Daian, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan Zhao, Iddo Bentov, Lorenz Breidenbach, and
Ari Juels. 2020. Flash boys 2.0: Frontrunning in decentralized exchanges, miner extractable value, and
consensus instability. In 2020 IEEE Symposium on Security and Privacy (SP). IEEE, 910–927.
Michael Egorov and Curve Finance (Swiss Stake GmbH). 2021. Automatic market-making with dynamic peg.
Retrieved Sept 18, 2023 from https://classic.curve.fi/files/crypto-pools-paper.pdf
Matheus VX Ferreira and David C Parkes. 2022. Credible decentralized exchange design via verifiable
sequencing rules. arXiv preprint arXiv:2209.15569 (2022).
Tivas Gupta, Mallesh M Pai, and Max Resnick. 2023. The centralizing effects of private order flow on
proposer-builder separation. arXiv preprint arXiv:2305.19150 (2023).
Robin Hanson. 2007. Logarithmic markets coring rules for modular combinatorial information aggregation.
The Journal of Prediction Markets 1, 1 (2007), 3–15.
Joel Hasbrouck, Thomas J Rivera, and Fahad Saleh. 2022. The need for fees at a dex: How increases in fees
can increase dex trading volume. Available at SSRN (2022).
Joel Hasbrouck, Thomas J. Rivera, and Fahad Saleh. 2023. An Economic Model of a Decentralized Exchange
with Concentrated Liquidity. (2023). Working paper.
Alex Herrmann. 2022. MEV capturing AMM (McAMM). Retrieved Sept 18, 2023 from
https://ethresear.ch/t/mev-capturing-amm-mcamm/13336
Alfred Lehar and Christine A Parlour. 2021. Decentralized exchanges. Available at SSRN 3905316 (2021).
Julian Ma and Davide Crapis. 2024. The Cost of Permissionless Liquidity Provision in Automated Market
Makers. arXiv preprint arXiv:2402.18256 (2024).
Jason Milionis, Ciamac C Moallemi, and Tim Roughgarden. 2023. Automated Market Making and Arbitrage
Profits in the Presence of Fees. arXiv preprint arXiv:2305.14604 (2023).
Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. 2022. Automated Market
Making and Loss-Versus-Rebalancing. https://doi.org/10.48550/ARXIV.2208.06046
MountainFarmer, Louis, Hanzo, Wawa, Murloc, and Fish. 2022. JOE v2.1 Liquidity Book. Retrieved Sept 18,
2023from https://github.com/traderjoe-xyz/LB-Whitepaper/blob/main/Joe%20v2%20Liquidity%20Book%20Whitep
Alex Nezlobin. 2023. Twitter thread. Retrieved Dec 3, 2023 from
https://twitter.com/0x94305/status/1674857993740111872
Abraham Othman, David M Pennock, Daniel M Reeves, and Tuomas Sandholm. 2013. A practical liquidity-
sensitive automated market maker. ACM Transactions on Economics and Computation (TEAC) 1, 3
(2013), 1–25.
Eric A. Posner and E. Glen Weyl. 2018. Radical Markets: Uprooting Capitalism and Democracy for a Just
Society. Princeton University Press, Princeton, NJ.
14Rithvik Rao and Nihar Shah. 2023. Triangle Fees. arXiv:2306.17316 [q-fin.MF]
Liyi Zhou, Kaihua Qin, Christof Ferreira Torres, Duc V Le, and Arthur Gervais. 2021. High-frequency
trading on decentralized on-chain exchanges. In 2021 IEEE Symposium on Security and Privacy (SP).
IEEE, 428–445.
A. Proofs
Proof of Lemma 1. Given fixed f ∈ [0,fmax], define G(L) , fH0(f,L)−AP0(f)−r. By Assump-
tion 1(2) and Assumption 2, this is a continuous function, and
lim
L→0
G(L) = ∞, lim
L→∞
G(L) = −AP0(f) − r < 0.
By the intermediate value theorem, there exists L∗ > 0 with G(L∗) = 0, comparing with (2), this
must be an equilibrium. This equilibrium is unique since G(·) is strictly monotonic. 
Proof of Theorem 1. First, we will prove that the equilibrium (R∗,L∗) exists. Solving for R∗ in
the condition ΠMGR
am (R∗,L∗) = 0 and substituting into ΠLP
am(R∗,L∗) = 0, we have that L∗ must
satisfy G(L∗) = 0 where
G(L) , max
f∈[0,fmax]
fH0(f,L) − AE0(f) − r.
From Assumption 1 and Assumption 2, this function is continuous, and
lim
L→∞
G(L) = max
f∈[0,fmax]
−AE0(f) − r = −AE0(0) − r < 0.
lim
L→0
G(L) ≥ lim
L→0
fH0(f,L) − AE0(f) − r = ∞ > 0,
for any f ∈ (0,fmax]. By the intermediate value theorem, an equilibrium (R∗,L∗) must exist.
In order to compare with the ff-AMM, define
Lmax , max
f∈[0,fmax]
Lff(f),
to be the maximum level of liquidity that can be achieved in the ff-AMM, and denote by f∗ the
maximizing fee. Define
Rmax , (AP0(0) + r)V (Lmax).
From the zero profit condition ΠLP
am(Rmax,Lmax) = 0, it is clear that a rent payment of Rmax will
15incentivize liquidity Lmax. Under such a rent payment, the pool manager earns profits
ΠMGR
am (Rmax,Lmax) = AP0(0) + max
f∈[0,fmax]
fH0(f,Lmax) − AE0(f)
!
V (Lmax) − Rmax
≥ (AP0(0) + f∗
H0(f∗
,Lmax) − AE0(f∗
))V (Lmax) − Rmax
= (AP0(0) + AP0(f∗
) + r − AE0(f∗
))V (Lmax) − Rmax
= (AP0(0) + AP0(f∗
) + r − AE0(f∗
))V (Lmax) − (AP0(0) + r)V (Lmax)
= (AP0(f∗
) − AE0(f∗
))V (Lmax)
> 0.
Here, the first inequality follows from the suboptimality of f∗ for the am-AMM, and we also use
the fact that ΠLP
ff (f∗,Lmax) = 0 since it is an equilibrium for the ff-AMM. The last equality follows
from Assumption 3.
Since the pool manager earns positive profits when the rent is Rmax, and equilibrium rent R∗
musty satisfy R∗ > Rmax, therefore and equilibrium fee-auction AMM utility L∗ > Lmax. 
B. Withdrawal Fees
Here, we show that a withdrawal fee of 1 −
2·
√
fcap
fcap+1 is sufficient to protect managers from strategic
liquidity withdrawals. With a fee cap of 1%, this comes out to approximately 0.00001238%, or
about 0.1238 basis points — a $12.38 fee on a $1 million position.
Our goal is to set a withdrawal fee to prevent opportunistic withdrawals of liquidity (in response
to arbitrage opportunities) from reducing manager profits. Under our assumptions, the manager’s
profit from a given arbitrage opportunity is capped once the price moves by fcap, the maximum
allowable swap fee. Any larger price move results in MEV for the block proposer (since any arbi-
trageur can capture the excess portion with a swap), rather than profit for the manager. Therefore,
we only need to set a withdrawal fee that is greater than the value from arbing that liquidity in
response to an increase of a factor of fcap. (A decrease by a factor of fcap will result in a smaller
arbitrage opportunity.)
For this proof, we use the same conventions as Section 3, where reserves are expressed in
terms of two assets x and y, asset y is defined as the numéraire for all prices and valuations, and
“liquidity” for a position is defined as
√
xy where x and y are the position’s reserves of assets x
and y, respectively.
Suppose without loss of generality that a liquidity provider is providing 1 unit of liquidity, and
the current midpoint price on the AMM is pamm. Since pamm = ynow
xnow
and xnow · ynow = 1, the
liquidity provider’s current reserves of assets X and Y are xnow = 1 √
pamm
and ynow =
√
pamm.
We suppose price has increased by fcap, making the true price ptrue = fcap · pamm.
The current valuation of the liquidity is:
16vnow = ptrue · xnow + ynow = fcap · pamm ·
1
√
pamm
+
√
pamm = (1 + fcap) ·
√
pamm (8)
The valuation of the liquidity after the manager arbitrages the pool to ptrue (fcap ·pamm) would
be:
vafter = fcap · pamm ·
1
p
fcap · pamm
+
q
fcap · pamm = 2 ·
q
fcap · pamm (9)
To prevent strategic withdrawal from being profitable for liquidity providers at the expense of
managers, we can impose a withdrawal fee of
vnow−vafter
vnow
, which simplifies to:
fwithdrawal =
vnow − vafter
vnow
= 1 −
2 ·
p
fcap
1 + fcap
(10)
17