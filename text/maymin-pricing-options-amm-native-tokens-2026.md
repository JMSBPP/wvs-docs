---
sha256: 82b20bb267ec579ec52739fd0f55dbdc63182f8981cf25268a492ede0be7f4ee
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 64123
---
The Pricing of Options on AMM-Native Tokens:
Theory and Evidence from Bittensor
Philip Z. Maymin1*
1*Dolan School of Business, Fairfield University, 1073 N Benson Rd,
Fairfield, 06824, CT, USA.
Corresponding author(s). E-mail(s): pmaymin@fairfield.edu;
Abstract
For a token whose only market is a constant-weighted-product automated mar-
ket maker (AMM), the price dynamics are pinned by the bonding curve. We
prove that when the net flow into the pool follows a diffusion, the token price
obeys a constant elasticity of variance (CEV) process whose exponent β equals
the numeraire weight. The result is structural, not estimated: for the standard
constant-product design the exponent is exactly β = 1/2, which translates into
a return-variance elasticity of 2(β − 1) = −1 (return variance scales as the
inverse of the price). We extend this derivation to a jump-diffusion flow specifica-
tion and show that the CEV exponent is preserved; jumps shift the volatility level
but not the elasticity. Across 92 Bittensor subnets (February 2025 to April 2026,
442 daily snapshots per subnet at the longest horizon), the realized variance elas-
ticity has median −0.96 (interquartile range [−1.07,−0.88]), with every single
subnet exhibiting a negative slope, and the implied β̂ ≈ 0.52 statistically indis-
tinguishable from the theoretical 1/2. The estimate is virtually unchanged when
jump days are filtered (−0.95 vs. −0.96), confirming the theoretical robust-
ness empirically. The framework yields a forward-looking benchmark for option
pricing, hedging, and risk management on AMM-native tokens, with concrete
predictions: a normalized implied volatility skew that depends only on the pool
weight and not on pool depth, a structural leverage effect from microstructure
rather than capital structure, and a Black–Scholes limit recovered as pool depth
grows.
Keywords: Automated market makers, Option pricing, Constant elasticity of
variance, Decentralized finance, Implied volatility skew, Jump diffusion
JEL Classification: G12 , G13 , G14
11 Introduction
Automated market makers determine prices algorithmically from token reserves rather
than from a matched order book. The constant-product design that powered Uniswap
V2 (Adams et al, 2021) and the constant-weighted-product extension behind Bal-
ancer (Martinelli and Mushegian, 2019) fixed an invariant on the reserve manifold; the
marginal price falls out as a derivative of the invariant. Concentrated-liquidity proto-
cols such as Uniswap V3 partition that manifold into bounded ranges, but within each
active range the local mechanics revert to a constant-product invariant with effective
reserves (Adams et al, 2021; Hasbrouck et al, 2024). Algorithmic price formation is,
by aggregate volume, the dominant trading mechanism for digital assets.
For most tokens, the AMM is one venue among several: arbitrageurs synchronize
the AMM price with deeper external markets, and the resulting price process is largely
shaped by external information arrival. A different regime arises when the AMM is the
sole price discovery mechanism. Bittensor’s Dynamic TAO (dTAO) system, introduced
in February 2025, provides a clean instance: each subnet has a dedicated constant-
product AMM in which a network-native “alpha” token is exchanged against TAO,
with no order book, no off-chain market, and no external oracle (Bittensor Foundation,
2025). The bonding curve is the market. Whatever stochastic process governs alpha
prices must follow from the AMM mechanics and the dynamics of net staking flow.
Contribution.
The central claim of this paper is a structural identity. Under a flow diffusion of
standard form, the bonding-curve mechanics force the token price to follow a constant
elasticity of variance (CEV) process, with the CEV exponent equal to the numeraire
weight. For the constant-product design that includes Uniswap V2 pools, Balancer
50/50 pools, and Bittensor subnets, the exponent is β = 1/2. The result is not an
empirical fit: it is a deterministic consequence of Itô’s lemma applied to the bonding
curve. Three implications follow.
First, the implied volatility skew that practitioners encounter on AMM tokens is
not a stochastic-volatility artifact and not a market mispricing. It is a feature of the
AMM mechanism itself, with shape pinned by the pool weight. Once normalized to
the at-the-money level, the skew depends only on β and is invariant to pool depth.
Second, the leverage effect, the negative correlation between price and volatil-
ity that has occupied equity option modeling since Black (1976), here arises from
microstructure rather than capital structure. As price falls, the numeraire reserve
shrinks, so the same flow shock produces a larger relative price move. The CEV frame-
work is the natural pricing apparatus for instruments whose volatility dynamics are
determined by the depth of the market.
Third, Black–Scholes is recovered as a limit of infinite pool depth, with an effec-
tive volatility that scales as the inverse square root of liquidity. This gives a precise
characterization of when standard pricing is adequate (deep pools) and when it is not
(shallow pools, especially in the wings).
2Robustness to jumps.
A natural concern with the diffusion assumption is that observed staking flows arrive
in discrete, sometimes large, “whale” transactions. We show that the CEV identity is
robust to this departure: under a compound-Poisson jump component added to the
diffusion, the price process is still CEV, the exponent is still equal to the numeraire
weight, and the jump variance contributes proportionally to the same price elasticity in
the small-jump regime. Empirically, removing jump days from the variance-elasticity
regression shifts the estimate by less than two percent of its standard deviation (paired
test p = 0.11, Wilcoxon p = 0.52). Theory and data agree: the elasticity is structural;
jumps shift the level of volatility, not its dependence on price.
What this paper does and does not establish.
The empirical work in this paper tests the variance-elasticity restriction implied by the
CEV identity. It does not test option prices directly, because there is no liquid option
market on AMM-native tokens. The pricing implications we report are forward-looking
benchmarks derived from the CEV identity together with a standard arbitrage-pricing
argument; the practical replicability of those prices depends on the depth of the AMM
relative to the size of hedging trades, an issue we quantify but cannot eliminate. We
frame the option-pricing results accordingly: a structural model that practitioners
can use to benchmark, calibrate, and stress-test pricing on AMM-native tokens, with
explicit conditions under which the model is reliable and explicit limitations on its
scope.
Roadmap.
Section 2 surveys the related literature. Section 3 states the AMM setup and the insti-
tutional background. Section 4 states and proves the central CEV identity, derives the
elasticity spectrum, the structural leverage effect, and the universal skew. Section 5
develops the jump-diffusion extension and shows that the CEV exponent is preserved
both theoretically and in simulation. Section 6 reports the cross-sectional variance-
elasticity test on Bittensor subnets, including the paired test under jump removal.
Section 7 discusses pricing implications, replication friction, and the conditions under
which the framework yields reliable prices. Section 8 discusses scope, including the
failure modes that arise when the AMM is not the sole price discovery mechanism.
Section 9 concludes. Appendices contain the standard CEV closed-form machinery,
the jump-diffusion option pricing formula, the emission extension, and additional
robustness analyses.
## 2 Related Literature
The financial theory of AMMs has developed along several distinct strands. The
mathematical foundations of constant-function market makers, including feasibility
of trades and the connection between AMM and external prices, were established by
Angeris et al (2021) and extended to optimal routing by Angeris et al (2022). Milionis
et al (2022) introduced the loss-versus-rebalancing framework, decomposing liquidity-
provider returns into market risk and a predictable adverse-selection cost; Cartea et al
3(2024) develop a continuous-time model with arbitrageurs and informed traders. Park
(2023) identifies design flaws in constant-product pricing.
A second strand treats AMM positions as derivatives of the underlying asset price.
Clark (2021) characterizes a constant-product LP as writing a perpetual straddle;
Loesch et al (2021) formalizes impermanent loss as a variance-dependent cost; Has-
brouck et al (2024) formalizes concentrated-liquidity positions as covered calls and
shows that LPs forgo the call’s time premium in exchange for fees. Fukasawa et al
(2023) prove that impermanent loss can be hedged with weighted variance swaps;
Guillaume and Schroers (2024) build static hedges using vanilla options. Bichuch and
Feinstein (2024) derive risk-neutral prices and Greeks for LP tokens themselves, mod-
eling the LP position as a derivative on assets that are assumed to follow geometric
Brownian motion. Hitier (2025) models LP portfolio value in constant-product AMMs
under exogenous GBM and derives a closed-form expected impermanent loss. The
shared modeling stance across this strand is that the underlying asset follows GBM
exogenously and the LP position is the derivative.
This paper inverts that perspective. Rather than treating the AMM token price as
exogenous and pricing the LP position, we derive the price process of a token traded
only through the AMM from the bonding curve mechanics, and then price derivatives
on that token. The result, that AMM token prices follow CEV with exponent equal
to the pool weight, supplies the missing link between the AMM literature on imper-
manent loss and LP derivatives on one hand, and the option-pricing literature on the
underlying token on the other. Hitier (2025)’s framework and ours are complementary:
his applies when the AMM is one of many trading venues for the asset, ours applies
when the AMM is the sole venue.
The CEV model itself is classical. Cox (1975) introduced it; Cox (1996) provided
the published version; Schroder (1989) derived closed-form European prices via the
non-central chi-squared distribution; Davydov and Linetsky (2003) developed eigen-
function expansions; Larguinho et al (2013) improved numerical stability. Empirical
estimation of the elasticity from equity options data appears in Beckers (1980) and
Emanuel and MacBeth (1982). Across this literature, the elasticity parameter β is an
empirical quantity to be estimated. The novelty here is that for AMM tokens, β is
pinned by pool design.
A third strand of work prices options on cryptocurrencies and DeFi tokens using
stochastic-volatility or jump-diffusion frameworks calibrated to centralized exchanges
(Singh, 2025; Dave, 2023; Block Scholes and Panoptic, 2025). None of these papers
derives the underlying process from the AMM mechanics; they apply pricing models
to assets that happen to trade on AMMs. The closest in spirit to the present work is
Cartea et al (2024), which derives a continuous-time model of AMM dynamics under
exogenous arbitrageurs; the present paper concerns the limit in which there is no
external venue.
43 Institutional Setting
## 3.1 The Bonding Curve
A constant-weighted-product AMM holds reserves (x,y) subject to
xw
· y1−w
= K, (1)
where w ∈ (0,1) is the weight of the numeraire token X, and K > 0 is the pool
invariant. A trader who deposits ∆x units of X and withdraws ∆y units of Y moves
the reserves along the level set of (1). Differentiating the invariant, the marginal price
of Y in terms of X is
P =
1 − w
w
·
x
y
. (2)
For the constant-product design (w = 1/2), P = x/y and (1) reduces to xy = k with
k = K2
. This is the design used by Uniswap V2, Balancer 50/50 pools, and Bittensor
subnets.
## 3.2 The Constant-Product Special Case, Generalized Weights,
and Concentrated Liquidity
Three design extensions matter in practice and merit separate treatment.
Generalized weights.
Balancer pools (Martinelli and Mushegian, 2019) allow w to differ from 1/2 and are
most often used to construct asymmetric exposure baskets. Theorem 1 applies directly:
the CEV exponent is β = w, so a Balancer pool with weights (w,1 − w) generates a
CEV process with β = w, distinct from the constant-product β = 1/2.
Concentrated liquidity.
Uniswap V3 (Adams et al, 2021) restricts the constant-product invariant to a bounded
price range [Pa,Pb] and is the dominant design among contemporary order-book com-
petitors. Hasbrouck et al (2024) provide an economic model of decentralized exchanges
with concentrated liquidity. Within an active range, V3 dynamics are equivalent to a
constant-product pool with virtual reserves (x + L
√
Pa,y + L/
√
Pb) where L is the
liquidity parameter; the transformation is an affine shift in (x,y) coordinates that
preserves the local form of the bonding curve. Theorem 1 therefore applies in-range
with β = 1/2 and an effective K scaled by the concentration. At a range boundary
the position becomes single-sided in one asset; the local dynamics are an absorbing
or reflecting boundary depending on whether the LP withdraws or refills. The CEV
identity is a within-range statement; the joint dynamics across multiple LP ranges and
range-switching are addressed by Cartea et al (2024).
Multi-venue assets.
Tokens that trade on the AMM and on order-book exchanges have their price set
jointly by external information arrival and AMM mechanics. Arbitrageurs synchronize
5the AMM to the external venue; the dominant force on the price is the external market,
and the AMM imposes constraints on price impact and fees rather than determining
the full price process. The CEV identity describes a component of the dynamics in
this regime, not the dynamics themselves. The cleanest setting for a structural test is
therefore one in which the AMM is the sole venue, as in Bittensor’s dTAO.
## 3.3 Bittensor as a Test Case
Bittensor is a decentralized network for AI services organized into independent sub-
nets. Since February 2025 it has operated under Dynamic TAO (dTAO), in which each
subnet i maintains its own constant-product AMM with reserves (xi,yi) in TAO and
a subnet-specific alpha token αi (Bittensor Foundation, 2025). Three features make it
the cleanest available test case for AMM price theory:
1. No external venue. Alpha tokens trade only through the on-chain pool. The price
process is therefore entirely determined by AMM mechanics and the dynamics of
net staking flow.
2. Pool-deepening protocol emissions. Each block, the protocol injects TAO into the
pool in proportion to a moving average of net flows, with a matching alpha injec-
tion that holds the spot price fixed and grows the invariant. The TAO emission is
currently 0.5 per block following the December 2025 halving from 1 per block. We
treat this as a deterministic, slowly varying perturbation to K in Appendix C.
3. Participant emissions outside the pool. Each subnet emits roughly two alpha tokens
per block to participants (miners, validators, and the subnet owner), allocated in
fixed proportions. This alpha does not enter the pool but affects circulating supply
if recipients later swap.
We focus on the first feature for the main result and treat the others as extensions
and limitations.
## 4 The CEV Identity
## 4.1 Setup
Let (xt,yt) satisfy the constant-weighted-product invariant (1) and let Ft denote the
cumulative net inflow of the numeraire token, so that dxt = dFt in the absence
of emissions. Take Ft to be a Brownian diffusion on a filtered probability space
(Ω,F,{Ft},P):
dFt = µF dt + σF dWt. (3)
The diffusion approximation captures the limit of many small flow events; we relax it
in Section 5 by adding a jump component.
## 4.2 Main Result
Theorem 1 (AMM token price process). Under the constant-weighted-product invari-
ant (1) with diffusive flow (3), the marginal token price defined by (2) satisfies the
CEV stochastic differential equation
dPt = µ(Pt)dt + δPβ
t dWt, (4)
6with CEV exponent β = w equal to the numeraire weight, volatility parameter
δ =
1
1 − w

1 − w
w
1−w
K−1
σF , (5)
and drift
µ(P) =
1
1 − w

1 − w
w
1−w
K−1
µF Pw
+
w
2(1 − w)2

1 − w
w
2(1−w)
K−2
σ2
F P2w−1
.
(6)
Proof. From (1), y = (Kx−w
)1/(1−w)
, so the price defined by (2) is purely a function
of x:
P(x) =
1 − w
w
· K−1/(1−w)
· x1/(1−w)
. (7)
Set α = 1/(1−w) and B = ((1−w)/w)K−α
, so P = Bxα
. By Itô’s lemma applied to
(3),
dP = Bαxα−1
dx + 1
2Bα(α − 1)xα−2
(dx)2
. (8)
With dx = µF dt+σF dW and (dx)2
= σ2
F dt, dP separates into a drift and a diffusion
term. Substituting x = (P/B)1/α
gives xα−1
= B−w
Pw
and xα−2
= B1−2w
P2w−1
.
The diffusion coefficient becomes
BαB−w
Pw
· σF = αB1−w
σF · Pw
,
and B1−w
= ((1 − w)/w)1−w
K−1
together with α = 1/(1 − w) yields the volatility
coefficient (5). The drift collects the two remaining terms:
µ(P) = Bαxα−1
µF + 1
2Bα(α − 1)xα−2
σ2
F
= αB1−w
µF Pw
+ 1
2α(α − 1)B2−2w
σ2
F P2w−1
,
where B2−2w
= ((1−w)/w)2(1−w)
K−2
and α(α−1) = w/(1−w)2
. Substituting yields
(6).
The result is structural. Given the bonding curve and the diffusion model for flow,
the price is forced to be CEV with β equal to the weight; there are no free parameters
to fit.
Corollary 2 (Constant-product AMM). For the standard constant-product AMM
(w = 1/2, K =
√
k, k = xy),
dPt =

2µF
√
k
p
Pt +
σ2
F
k

dt +
2σF
√
k
p
Pt dWt. (9)
The CEV exponent is β = 1/2 and the volatility parameter is δ = 2σF /
√
k.
Corollary 3 (Black–Scholes limit). As K → ∞, δ → 0 and the price becomes
deterministic. For large but finite K, around P0 the process approximates geometric
Brownian motion with effective volatility σeff = δPw−1
0 , and the Black–Scholes formula
applies to first order.
7Remark 1 (Elasticity spectrum). The CEV exponent β = w links AMM design to
volatility structure: w = 1/2 (constant-product) gives β = 1/2, where return variance
scales as 1/P; w → 1 approaches GBM and Black–Scholes; w → 0 approaches the
Bachelier (normal) model. AMM designers thus implicitly select a volatility regime
through pool weights.
Example 1 (A concrete pool). Consider a constant-product pool with reserves
x = 1,000 TAO and y = 40,000 alpha, so k = 4 × 107
and P = 0.025. A trader
who stakes 100 TAO receives ∆y = 40,000 · 100/(1,000 + 100) = 3,636.4 alpha; the
post-trade reserves are (1,100,36,363.6) and the new price is 0.0302, a 21% move
from a flow that was 10% of the TAO reserve. By Theorem 1, the price obeys
dP = ··· + (2σF /
√
k)
√
P dW, so the volatility coefficient is 2σF /
√
k and the local
return volatility is σret(P) = (2σF /
√
k)/
√
P. A pool ten times deeper produces a price
impact roughly
√
10 times smaller from the same flow shock, with the absolute volatil-
ity correspondingly scaled. The relationship between flow magnitude and price impact
is the mechanical source of the CEV dynamics.
## 4.3 Structural Leverage Effect
Proposition 4 (Volatility structure and leverage effect). Under (4), the instantaneous
return volatility is
σret(P) = δPβ−1
. (10)
For β < 1, σret rises as P falls. For the constant-product AMM, σret(P) = δ/
√
P.
The mechanism is purely structural. When P is low, the numeraire reserve x =
(P/B)α
is small, so a flow dF produces a larger relative change in x, hence a larger
relative change in price. In equity markets the same negative correlation between price
and volatility is conventionally attributed to financial leverage: as firm value falls, the
debt-to-equity ratio rises, amplifying equity volatility. For AMM tokens, no debt is
involved. The bonding curve provides the leverage; market microstructure plays the
role that capital structure plays in the equity case.
## 4.4 Universal Implied Volatility Skew
Proposition 5 (Universality of the normalized skew). The CEV model with β < 1
generates a negative implied volatility skew: out-of-the-money puts have higher Black–
Scholes implied volatility than out-of-the-money calls. After normalization by the at-
the-money level, the skew shape depends only on β, not on the volatility parameter δ
or pool depth.
Proof. Negativity of the skew is standard for CEV with β < 1 (Cox, 1996; Davydov
and Linetsky, 2003). For universality of the normalized skew, observe that the CEV
call price is degree-one homogeneous in spot and strike, so implied volatility depends
only on moneyness Kstr/P. The non-central chi-squared parameters in the closed-
form CEV price (Appendix A) satisfy a/c = (Kstr/P)2(1−β)
e−2r(1−β)T
(independent
of δ and K) and degrees of freedom b = 1/(1 − β) (independent of both). Changing
δ rescales a and c by the same multiplicative factor, leaving the implied volatility at
every moneyness unchanged once σATM is fixed. Hence the normalized skew is invariant
to δ, equivalently to pool depth.
8For β = 1/2, the constant-product case, this gives a sharp prediction. Black–
Scholes calibrated to the at-the-money level underprices a 20%-out-of-the-money put
by roughly six percent in implied volatility terms, and the magnitude of this gap is
identical for shallow and deep pools. The absolute pricing discrepancy vanishes as
pools deepen (Figure 1), but the percentage skew does not. We discuss the practical-
relevance qualifier in Section 7.
104 105 106 107 108 109 1010 1011 1012
Pool Depth k(log scale)
0
20
40
60
80
ATM Call Price (% of spot)
SN58 SN1SN3
ATM Option Price vs. Pool Depth
CEV ( =1/2)
Black Scholes
104 105 106 107 108 109 1010
Pool Depth k(log scale)
10 13
10 11
10 9
10 7
10 5
10 3
10 1
101
|C CEV C BS | (% of spot)
Absolute Pricing Discrepancy
10% OTM put
5% OTM put
ATM
5% OTM call
10% OTM call
O(k 1)
Fig. 1 Left: at-the-money call price (as percentage of spot) versus pool depth k. The CEV (solid)
and Black–Scholes (dashed) curves overlap; the models agree at the money. Right: absolute pricing
discrepancy |CCEV − CBS| as percentage of spot, log-log scale, for five moneyness levels. Out-of-
the-money discrepancies dominate the at-the-money case by orders of magnitude. All curves decline
approximately as O(k−1). Parameters: P0 = 0.025, σF = 48.7, T = 90 days, r = 5%.
0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20
Moneyness (K/P0)
20
40
60
80
Implied Volatility (%)
Absolute Implied Volatility
Shallow (k=5×105)
Medium (k=5×106)
Deep (k=5×107)
0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20
Moneyness (K/P0)
0.96
0.98
1.00
1.02
1.04
1.06
IV / IV ATM
Normalized Skew
Shallow (k=5×105)
Medium (k=5×106)
Deep (k=5×107)
Fig. 2 Left: absolute Black–Scholes implied volatility extracted from CEV prices for three pool
depths. Shallower pools have higher implied volatility because δ is larger. Right: implied volatility
normalized to the at-the-money level. The three curves overlap, illustrating Proposition 5: the nor-
malized skew depends on β alone, not pool depth. Parameters: P0 = 0.025, σF = 48.7, T = 90 days.
## 5 Robustness to Jumps in Flow
The diffusion assumption is an idealization. In practice, large staking events arrive
as discrete shocks rather than as a continuous limit of small trades. Across our 92-
subnet sample (Section 6), days with absolute net flow exceeding three times the
trailing fourteen-day standard deviation occur on 7.2% of trading days but contribute
9a median 44% of the realized variance of flow per subnet. The diffusion specification
cannot be claimed to capture this feature literally. Two questions follow. Is the CEV
identity an artifact of the diffusion limit, or does it survive a jump component? And
empirically, does the variance-elasticity test pick up the same elasticity once jump
days are removed?
## 5.1 Jump-Diffusion Flow
Augment (3) with a compound Poisson component:
dFt = µF dt + σF dWt + dJt, Jt =
Nt X
i=1
ξi, (11)
where Nt is a Poisson process with intensity λ, the ξi are i.i.d. jump sizes with E[ξ] =
µJ and Var[ξ] = σ2
J, and Wt, Nt, and {ξi} are mutually independent.
Proposition 6 (Jump-diffusion CEV). Under (1) and (11), the price Pt = Bxα
t
satisfies
dPt = µ(Pt−)dt + δPβ
t−dWt + dMt, (12)
where Mt is a pure-jump process with jump size at time t equal to
∆Pt = B(xt− + ξNt
)α
− Bxα
t−. (13)
The continuous part of the price process is unchanged: it is CEV with the same
exponent β = w. The jump in P at price level Pt− has size Pt−((1 + ξ/xt−)α
− 1).
Proof. Apply the Itô–Lévy formula (Cont and Tankov, 2004) to P = Bxα
with x
following the jump-diffusion (11). Between jumps, x is the continuous process from
Section 4 and the diffusion calculation gives the first two terms of (12). At a jump time
τi with xτi− → xτi− + ξi, the price moves by (13) discontinuously. The compensated
jump term is absorbed into the drift; in the risk-neutral pricing formulas of Appendix B
we account for this explicitly via the Merton-style drift adjustment.
Remark 2 (Small-jump approximation). For jump sizes small relative to the
numeraire reserve, |ξ/x| ≪ 1, expand (1 + ξ/x)α
= 1 + α(ξ/x) + 1
2α(α − 1)(ξ/x)2
+
O((ξ/x)3
). For the median Bittensor pool, σJ/x ≈ 500/15,000 ≈ 3.3%; the leading-
order correction α(ξ/x) dominates the next-order term by a factor of |2/((α−1)(ξ/x))|,
which is roughly 100 for α = 2 (w = 1/2). Substituting x = (P/B)1/α
,
∆Pt ≈ αB1/α
P
1−1/α
t− ξi = αB1/α
Pw
t−ξi. (14)
The price-jump magnitude scales as Pw
, the same scaling as the diffusion coefficient
δPβ
in Theorem 1. Hence in the small-jump regime, jumps inherit the CEV scaling
with β = w. For larger jumps, the SDE (12) retains its CEV diffusion part exactly,
but the jump contribution to log-return variance is no longer scale-invariant in P, so
the empirical variance elasticity may shift away from the theoretical −1 even when the
CEV diffusion is correct.
10The substantive consequence is that the variance elasticity is preserved. The instan-
taneous variance of ∆logP has two components, Var[dlogPt | Pt]/dt = δ2
P
2(β−1)
t +
λE[(∆logP)2
| Pt], and in the small-jump regime E[(∆logP)2
| P] ∝ P2(β−1)
as well.
The cross-sectional regression of logVar[dlogP] on logP should still recover slope
2(β − 1) = −1 for β = 1/2, regardless of jump intensity. Larger jumps introduce a
second-order correction; we report a Monte Carlo experiment below that quantifies its
size.
## 5.2 Monte Carlo Validation
We simulate AMM paths under (11) with parameters calibrated to the median Bit-
tensor subnet (x0 = 1.5 × 104
TAO, σF = 1,900 TAO/yr, λ = 24 jumps/yr, σJ = 400
TAO/jump) and bracket cases with light, median, and heavy jumps. For each param-
eterization, 5,000 paths are simulated over six months at six-hour resolution. We pool
observations across paths and bin by logP, then regress log instantaneous return
variance on logP. Results are reported in Table 1 and Figure 3.
Table 1 Monte Carlo variance elasticity under
jump-diffusion flow. The CEV theoretical slope is −1. Each
row reports the slope of log d Var[∆logP | P]/dt on logP
from 5,000 paths.
Specification Slope R2
Pure diffusion (λ = 0) −0.961 0.999
Light jumps (λ = 12, σJ = 200) −0.935 0.998
Median calibration (λ = 24, σJ = 400) −0.947 0.995
Heavy jumps (λ = 48, σJ = 800) −0.953 0.997
CEV theoretical −1.000 —
The simulated slope clusters around −0.95 across all specifications, consistent with
β = 1/2 within Monte Carlo error. The CEV identity is robust to jumps of empirically
realistic size.
## 6 Empirical Test of the Variance Elasticity
The CEV identity makes a sharp restriction on the price–variance relationship. We
test it directly using on-chain data from Bittensor subnets. The empirical work in
this section tests the variance elasticity restriction implied by the CEV identity, not
option prices: there is no liquid option market on AMM-native tokens, so a direct test
of pricing accuracy is not currently possible. We return to this point in Section 7.
114.6 4.4 4.2 4.0 3.8 3.6 3.4 3.2 3.0
logP
3.5
3.0
2.5
2.0
1.5
1.0
0.5
0.0
0.5
log Var[ logP |P] /dt
AMMpricevarianceelasticityispreservedunderjump-diffusionflow
Purediffusion(lambda=0):slope=-0.96
Empiricallight:lambda=12,sigma_J=200:slope=-0.94
Empiricalmedian:lambda=24,sigma_J=400:slope=-0.95
Empiricalheavy:lambda=48,sigma_J=800:slope=-0.95
DiffusionCEV:slope= 1
Fig. 3 Monte Carlo variance elasticity from simulated AMM paths under jump-diffusion flow. Each
marker is the binned log of return variance per unit time at a given log-price level, pooled across
5,000 paths. The solid line is the CEV prediction with slope −1. Across pure diffusion, light, median,
and heavy jump specifications, the recovered slopes range from −0.94 to −0.96, confirming that the
CEV exponent is preserved under jump-diffusion flow.
## 6.1 Specification
The CEV instantaneous variance is σ2
ret(P) = δ2
P2(β−1)
with δ = 2σF /
√
k in the
constant-product case (Corollary 2). Substituting,
σ2
ret(P) =
4σ2
F
k
· P2(β−1)
. (15)
Taking logs,
log

c RV · k/σ̂2
F

= const + 2(β − 1)logP. (16)
For β = 1/2 the slope is −1; for GBM (β = 1) the slope is 0. The left-hand side controls
for both pool depth and flow volatility, isolating the price–variance relationship.
## 6.2 Data and Sample Construction
We use daily on-chain snapshots of the 128 Bittensor subnets from the Taostats API,
covering February 2025 (when Dynamic TAO launched) through April 2026. Each
active subnet has up to 442 daily observations. Of the 128 subnets, 100 have at least
42 daily observations (28 needed for a 14-day rolling window plus the 14-day variance
horizon). We exclude 8 additional subnets with degenerate price paths (price range
exceeding 104
×, zero price variance) or insufficient intra-window variation, leaving 92
subnets for the main test.
12Within each subnet, we compute log returns of price and net flows in TAO. For
each rolling 14-day window starting at day i, we compute realized return variance
c RVi =
Pi+13
j=i r2
j ·365/14 (annualized), flow variance σ̂2
F,i = d Var(∆x)i·365 (annualized),
and the pool invariant ki = xi · ypool,i. We regress log(c RV · k/σ̂2
F ) on logP within
each subnet, after removing observations more than three standard deviations from
the subnet mean.
## 6.3 Cross-Sectional Result
The 92 within-subnet slope estimates form a distribution. Figure 4 reports the his-
togram and a representative scatter for the subnet whose slope is closest to the
median.
1.4 1.2 1.0 0.8 0.6 0.4 0.2 0.0
Slopeoflog(RV k/ 2
F)onlogP
0
1
2
3
4
Density
CEV( =1/2): 1
Median:-0.96
GBM:0
4.5 4.0 3.5 3.0 2.5 2.0 1.5
logP
4
2
0
2
4
6
log(RV k / 2
F )
Subnet56(representative)
OLS:slope = 0.89,R2=0.36
CEV:slope = 1
GBM:slope =0
Fig. 4 Cross-sectional test of the CEV variance elasticity across 92 Bittensor subnets, February 2025
to April 2026. Left: distribution of within-subnet slopes of log( c RV · k/σ̂2
F ) on logP. Median slope
−0.96; CEV prediction (dashed red) is −1; GBM null (dotted) is 0. Every subnet exhibits a negative
slope. Right: representative subnet (closest to the median slope).
The median slope is −0.96 with interquartile range [−1.07,−0.88]; every single
subnet (100%) has a negative slope. Two pre-specified one-sample t-tests treat the two
natural nulls. Against GBM (slope = 0), the rejection is overwhelming: t = −51.3,
p < 10−68
. Against the exact CEV prediction (slope = −1), the rejection is now
only marginal: t = 2.13, p = 0.036. The implied elasticity from the median slope is
β̂ ≈ 0.52, essentially equal to the theoretical 1/2.
This is a substantial sharpening relative to a shorter sample. The point estimate
has moved from β̂ ≈ 0.57 toward β̂ ≈ 0.52, the interquartile range has tightened from
[−0.98,−0.71] to [−1.07,−0.88], and the share of subnets with negative slopes has
risen to 100%. The data are now consistent with the theoretical β = 1/2 to within
sampling error.
The cross-sectional regression aggregates one slope per subnet, so the per-subnet
serial correlation from overlapping rolling windows does not contaminate the cross-
sectional inference. The overlapping-window estimator is more efficient (uses every day
of data) but introduces within-subnet correlation; the non-overlapping estimator is the
13cleaner inference benchmark. As a sensitivity check we re-run with non-overlapping
14-day windows. The median slope is −0.94 (interquartile range [−1.10,−0.86]); the
rejection against the GBM null remains decisive (t = −45.7, p < 10−63
), while the
rejection against the exact CEV value cannot be made at conventional levels (t = 1.92,
p = 0.058). The non-overlapping estimate is therefore statistically indistinguishable
from −1 at α = 0.05. The marginal rejection in the overlapping-window estimator
(p = 0.036) reflects the higher efficiency of that estimator, not a substantive departure
from CEV; both point estimates are within sampling error of −1.
Three plausible sources of the small upward residual (β̂ − 1/2 ≈ 0.02) are: (i)
discrete-time aggregation of continuous-time dynamics, which biases regression slopes
toward zero; (ii) effective slippage from MEV and sandwich attacks (Park, 2023), which
acts like an effective transaction cost and dampens realized variance at price extremes;
and (iii) heterogeneity in effective pool weights, since some Bittensor subnets have
begun adopting concentrated-liquidity-style features. Disentangling these requires per-
subnet estimation of effective weights, which we leave for future work.
## 6.4 Jump Robustness
The CEV identity is preserved under jump-diffusion flow (Section 5). We test this
empirically by repeating the variance-elasticity regression after removing jump days.
Within each rolling window, we identify days with |∆x| > 3σ̂F and exclude their
squared returns from the realized variance estimate.
The paired estimates are reported in Table 2. The median slope is −0.96 with
all observations and −0.95 with jumps removed. The paired difference per subnet
has mean −0.014 and is statistically indistinguishable from zero (paired t = −1.61,
p = 0.11; Wilcoxon signed-rank p = 0.52). Removing jumps does not change the
elasticity. The data are consistent with the theoretical prediction that jumps shift the
level of variance, not its dependence on price.
Table 2 Variance-elasticity slopes with all observations versus jumps removed, paired
by subnet (n = 92). The paired difference is statistically zero, confirming that the
CEV exponent is preserved under jump-diffusion flow as predicted by Proposition 6.
Median slope IQR t-test vs 0
All observations −0.956 [−1.07,−0.88] t = −51.3, p < 10−68
Jumps removed (> 3σ̂F ) −0.952 [−1.06,−0.88] t = −48.7, p < 10−66
Paired difference −0.014 — t = −1.61, p = 0.11
## 6.5 What Is and Is Not Tested
The variance-elasticity restriction is the falsifiable content of the CEV identity that on-
chain data can directly evaluate. The data strongly favor it. What this evidence does
not establish is that any specific option-pricing formula derived from the CEV identity
matches market prices: there are no traded options against which to compare. Pricing
accuracy in the wings, where the CEV correction to Black–Scholes is largest, remains
14a forward-looking prediction. We treat the option-pricing apparatus accordingly in
Section 7.
## 7 Option Pricing on AMM Tokens
## 7.1 The Pricing Apparatus
Given the CEV identity, the standard CEV closed-form pricing apparatus applies.
Under the risk-neutral measure Q, the price process becomes dP = rPdt+δPβ
dWQ
.
The change of measure is justified by the inaccessibility of zero (Lemma 7 in
Appendix A); the existence of the equivalent martingale measure for CEV with
β ∈ (0,1) is established by Davydov and Linetsky (2003). The European call price has
the closed form derived by Cox (1975) and Schroder (1989) in terms of the non-central
chi-squared distribution. Greeks, including a liquidity Greek Λ = ∂C/∂k specific to the
AMM setting, follow by direct differentiation. The standard derivations and Greeks
are contained in Appendix A, where they belong; they are not the contribution of this
paper.
For the jump-diffusion specification of Section 5, the option price takes a Merton-
style form: a Poisson-weighted sum of CEV prices conditional on jump count.
Appendix B gives the explicit formula and a numerical comparison.
## 7.2 Replication and Hedging Through the AMM
The risk-neutral pricing argument requires the contingent claim to be approximately
replicable by dynamic trading in the underlying. For AMM tokens, all hedge trades
execute through the same AMM that determines the price, so each rebalance pays
slippage and fees. The slippage cost on a hedge trade of ∆P units at price P in a
constant-product pool is approximately P2
(∆P)2
/(2k) (from the bonding curve to
second order). Integrated over a delta-hedged path,
R ≤
δ2
P2β
2k
· EQ
"Z T
0
Γ2
CEV(t)P(t)2
dt
#
. (17)
The bound scales as k−2
, while the CEV correction to Black–Scholes pricing scales
as k−1
. For the shallowest pool in our sample (k = 7.4 × 109
), the right-hand side
evaluates to less than 10−6
% of the option price; the CEV pricing discrepancy of one
to six percent in implied volatility terms dominates by many orders of magnitude. The
replication friction is small in the regime where the CEV correction is large.
This conclusion has a sharp boundary. For very shallow pools not represented
in our data (say k < 105
), (17) is no longer negligible and the CEV prices should
be interpreted as fair-value benchmarks rather than strict arbitrage-free prices. Two
further frictions matter for practical implementation. First, swap fees (ϕ on Uniswap,
currently zero on Bittensor) introduce a bid-ask spread that compresses the effective
σF by a factor (1−ϕ); the qualitative CEV structure is unchanged. Second, block-level
execution constraints in DeFi mean that hedge trades are not arbitrarily frequent; the
15discrete-time hedging error analyzed by Bertsimas et al (2000) adds to (17) but is
independent of the AMM-specific friction.
## 7.3 When the AMM Is Not the Sole Venue
The framework presented here applies to AMM-native tokens, defined as tokens whose
only price-discovery mechanism is the AMM. For tokens that trade simultaneously
on AMMs and on order-book exchanges, the price process is no longer pinned by
the bonding curve alone. Arbitrageurs synchronize the AMM price to the external
venue, and the dominant force on the price is the external information arrival, with
the AMM dynamics relegated to high-frequency wedges and impermanent-loss flows.
In this multi-venue regime, the CEV identity describes a component of the dynamics
rather than the dynamics themselves; the AMM imposes a constraint on price impact
and fees but not on the volatility structure of the price.
The literature on multi-venue AMM dynamics provides explicit models for this
case (Cartea et al, 2024; Milionis et al, 2022). The cleanest empirical environment
for a structural test of the CEV identity is therefore one in which the AMM has
no external complement, as in Bittensor’s dTAO. As DeFi matures and AMM-native
tokens proliferate, we expect more clean test cases to emerge.
7.4 A Concrete Forward-Looking Benchmark
To make the magnitudes concrete, consider 90-day at-the-money calls and 20%-out-
of-the-money puts on the three representative Bittensor subnets of Table 4. Table 3
reports prices under Black–Scholes (with matched at-the-money volatility), pure-
diffusion CEV (β = 1/2), and the jump-diffusion specification calibrated to median
Bittensor jump parameters (λ = 24/yr, σJ = 400 TAO).
Table 3 Forward-looking option pricing benchmarks for representative
Bittensor subnets, 90-day maturity, r = 5%. Columns BS (Black–Scholes),
CEV (pure-diffusion CEV with β = 1/2), and CEV+J (jump-diffusion
CEV calibrated to median Bittensor jump parameters λ = 23,σJ = 500).
Prices in percentage of spot.
ATM call (K = P0) OTM put (K = 0.8P0)
Subnet BS CEV CEV+J BS CEV CEV+J
Shallow (SN58) 27.27 27.38 35.31 14.85 16.19 23.27
Medium (SN1) 10.62 10.63 11.29 2.12 2.46 2.90
Deep (SN3) 32.74 32.93 32.96 19.52 21.18 21.21
Three patterns are visible. First, the at-the-money call price is essentially identical
under Black–Scholes and pure CEV: this is the universality of the skew (Proposition 5)
realized in dollar terms. Second, the out-of-the-money put price is 9–16% higher under
pure CEV than under Black–Scholes; the percentage discrepancy expressed as implied
volatility is invariant in pool depth (Proposition 5), so the absolute spread reflects
the level of volatility, not a deeper-pool effect. Third, the jump-diffusion specification
16adds substantially to OTM put prices in shallow pools but barely affects deep pools:
the magnitude of the jump correction scales with the relative size of jumps to the
numeraire reserve, σJ/x, which is small for deep pools and large for shallow ones.
These prices are forward-looking benchmarks. A subnet treasury seeking downside
protection should expect to pay closer to the CEV+J column than to the Black–Scholes
column; a market maker selling such puts using Black–Scholes will systematically
underprice the risk, particularly in shallow pools and during periods of elevated jump
activity.
Table 4 Representative Bittensor subnet parameters (median values February
2025 to April 2026). Reserves in native units; σ̂F annualized standard deviation
of daily TAO reserve changes.
Subnet x0 (TAO) y0 (α) k (×109) P0 (TAO/α) σ̂F
Shallow (SN58) 3,268 1,373,533 4.6 0.0031 2,574
Medium (SN1) 20,680 1,754,041 36.7 0.0125 5,422
Deep (SN3) 51,123 1,468,442 78.0 0.0353 43,217
## 8 Scope, Limitations, and Failure Modes
Scope of the variance-elasticity test.
The empirical test in Section 6 validates the CEV identity at the variance-elasticity
level. It does not test option prices directly, because liquid option markets on AMM-
native tokens do not yet exist. A direct pricing test will become possible once such
markets develop; the framework is best read as a forward-looking benchmark.
Distributional regularity of flows.
Shapiro–Wilk tests reject normality of daily flows for all 100 subnets with sufficient
history. The diffusion specification (3) is an idealization. Section 5 shows that the
qualitative CEV structure is preserved under a jump component, and the empirical
paired test (Table 2) confirms this; nonetheless, more elaborate flow dynamics (regime
switching, autocorrelation, heteroskedasticity) would require explicit treatment in any
high-precision application.
Hedging in shallow pools.
The replication argument relies on slippage being second-order, which is justified for
the pools in our sample but not for arbitrarily shallow pools. The k−2
versus k−1
scaling of friction versus correction is favorable in the regime where the model bites,
but the bound (17) is a sufficient, not necessary, condition; finer treatment via utility-
based hedging (Davis et al, 1993) or mean–variance hedging would tighten the practical
implications.
17Multi-venue and concentrated-liquidity regimes.
For tokens trading on multiple venues or for liquidity positions concentrated in narrow
ranges, the CEV identity describes a component of the dynamics rather than the full
process. Section 3 sketches the local equivalence of V3 within an active range; more
elaborate treatment, including range-switching, lies beyond the scope of this paper.
Endogenous emissions.
The Bittensor allocation rule couples emissions to staking flows: high inflows raise
the subnet’s emission share, deepen the pool, and compress volatility. Modeling this
endogenous coupling between k̇ and the flow process is a natural next step. Appendix C
treats deterministic emissions as a slow-varying perturbation.
Manipulation near expiry.
AMM token prices can be moved by spending the depth of the pool. The cost of
moving the price by a fraction ϵ scales linearly with the TAO reserve, so for shallow
pools the cost may be small relative to the option payoff. Practical implementations
should use time-weighted averaging or aggregated oracle settlement.
## 9 Conclusion
The price of a token traded on a constant-weighted-product AMM is forced by Itô’s
lemma to follow a constant elasticity of variance process with elasticity equal to the
numeraire weight, under the standing assumptions of a fixed pool invariant, fixed
weights, zero fees, single-venue price discovery, and a flow process that drives the
numeraire reserve directly. We relax the constant-invariant assumption for determin-
istic protocol emissions in Appendix C; we discuss fees, multi-venue pricing, and
dynamic weights as scope limitations in Section 8. The identity extends to flow with
a compound-Poisson jump component: the diffusive part of the price is exactly CEV
with the same exponent, and the jump contribution to log-return variance scales with
the same exponent in the small-jump regime |ξ/x| ≪ 1, which holds for the median
Bittensor pool by two orders of magnitude. Monte Carlo simulation at empirically
calibrated jump sizes recovers the CEV elasticity within sampling error.
Cross-sectional evidence from 92 Bittensor subnets, covering 14 months of daily
on-chain snapshots from Dynamic TAO’s launch through April 2026, gives a median
realized variance elasticity of −0.96, with every single subnet exhibiting a negative
slope; the implied β̂ ≈ 0.52 is essentially equal to the theoretical 1/2 for the constant-
product case. Removing jump days does not move the estimate.
Three contributions distinguish this work from prior literature on AMMs and on
CEV pricing. First, the elasticity parameter β, which has been an empirical free param-
eter in the CEV literature for half a century, is a structural quantity for AMM-native
tokens, equal to the numeraire weight in the bonding curve. Second, the leverage effect,
conventionally attributed to capital structure in equity markets, has a microstructural
origin in this setting: the bonding curve provides the leverage. Third, the Merton-style
18preservation of the CEV exponent under jump-diffusion flow, with empirical confir-
mation through a paired-test design, is to our knowledge the first such result in the
AMM-options literature.
The framework supplies the missing link between the AMM literature on imperma-
nent loss and LP-as-derivative pricing on one hand, and the option-pricing literature
on the underlying token on the other. It produces a forward-looking benchmark for
pricing, hedging, and risk management on AMM-native tokens, with sharp predictions,
an explicit Black–Scholes limit, and explicit conditions under which the framework
is reliable. The empirical evidence is from one ecosystem, Bittensor’s Dynamic TAO,
because that is the cleanest available environment for a structural test (no exter-
nal venue, transparent on-chain state, weight-uniform pools). The theoretical claim is
general: any token whose only price discovery is a constant-weighted-product AMM
should obey the CEV identity, with β pinned by the pool weight. As more AMM-native
tokens emerge across DeFi, the framework provides the natural pricing apparatus.
Statements and Declarations
Funding.
No funding was received for this research.
Competing interests.
The author reports no conflicts of interest. The author has no financial interest in
Bittensor, TAO tokens, or any DeFi protocol discussed herein.
Data availability.
On-chain data were retrieved from the Taostats API (taostats.io) and are repro-
ducible from public on-chain state. Replication code is available from the author upon
request and will be deposited in a public repository upon acceptance.
AI tool disclosure.
A generative AI assistant was used during preparation of the manuscript, includ-
ing for drafting code that produced the numerical simulations and figures, and for
prose editing. The author directed all aspects of the work, reviewed all output, and
takes full responsibility for the content of this publication, including the mathematical
derivations, model formulation, empirical design, and interpretation of results.
References
Adams H, Zinsmeister N, Salem M, et al (2021) Uniswap v3 core. Uniswap Labs
Technical Report
Angeris G, Kao HT, Chiang R, et al (2021) An analysis of Uniswap markets.
Cryptoeconomic Systems 1(1)
19Angeris G, Agrawal A, Evans A, et al (2022) Optimal routing for constant function
market makers. In: Proceedings of the 2022 ACM CCS Workshop on Decentralized
Finance and Security (DeFi), New York, NY
Beckers S (1980) The constant elasticity of variance model and its implications for
option pricing. Journal of Finance 35(3):661–673
Bertsimas D, Kogan L, Lo AW (2000) When is time continuous? Journal of Financial
Economics 55(2):173–204
Bichuch M, Feinstein Z (2024) A derivative pricing perspective on liquidity tokens in
constant product market makers. arXiv preprint arXiv:240911339
Bittensor Foundation (2025) Dynamic TAO whitepaper. https://bittensor.com/
dtao-whitepaper, accessed February 2026
Black F (1976) Studies of stock price volatility changes. Proceedings of the 1976
Meeting of the Business and Economic Statistics Section pp 177–181
Block Scholes, Panoptic (2025) Perpetual options — a research report. Block Scholes
Research, published August 2025
Cartea Á, Drissi F, Monga M (2024) Decentralised finance and automated market
making: Predictable loss and optimal liquidity provision. SIAM Journal on Financial
Mathematics 15(3):931–961
Clark J (2021) Replicating market makers. arXiv preprint arXiv:2103.14769
Cont R, Tankov P (2004) Financial Modelling with Jump Processes. Chapman and
Hall/CRC, Boca Raton, FL
Cox JC (1975) Notes on option pricing I: Constant elasticity of variance diffusions.
Working Paper, Stanford University Reprinted in Journal of Portfolio Management,
1996
Cox JC (1996) The constant elasticity of variance option pricing model. Journal of
Portfolio Management 22:15–17. Special Issue
Dave S (2023) Perpetual options in decentralized finance. Panoptic Research Report
Davis MHA, Panas VG, Zariphopoulou T (1993) European option pricing with
transaction costs. SIAM Journal on Control and Optimization 31(2):470–493
Davydov D, Linetsky V (2003) Pricing options on scalar diffusions: An eigenfunction
expansion approach. Operations Research 51(2):185–209
20Emanuel DC, MacBeth JD (1982) Further results on the constant elasticity of variance
call option pricing model. Journal of Financial and Quantitative Analysis 17(4):533–
554
Fukasawa M, Maire B, Wunsch M (2023) Weighted variance swaps hedge against
impermanent loss. Quantitative Finance 23(6):901–911
Guillaume F, Schroers D (2024) A unified approach for hedging impermanent loss of
liquidity provision. arXiv preprint arXiv:2407.05146
Hasbrouck J, Rivera TJ, Saleh F (2024) An economic model of a decen-
tralized exchange with concentrated liquidity. Management Science DOI:
10.1287/mnsc.2024.04510
Hitier S (2025) The dynamics of constant product market makers: A geometric
Brownian motion approach. SSRN Working Paper 5404433
Larguinho M, Dias JC, Braumann CA (2013) A note on the computation of the CEV
option pricing formula. Quantitative Finance 13(6):877–886
Loesch S, Hindman N, Richardson MB, et al (2021) Impermanent loss in Uniswap v3.
arXiv preprint arXiv:211109192
Martinelli F, Mushegian N (2019) A non-custodial portfolio manager, liquidity
provider, and price sensor. Balancer Labs Technical Report
Milionis J, Moallemi CC, Roughgarden T, et al (2022) Automated market making
and loss-versus-rebalancing. arXiv preprint arXiv:220806046 Conference version in
ACM DeFi’22
Park A (2023) The conceptual flaws of decentralized automated market making.
Management Science 69(11):6731–6751
Schroder M (1989) Computing the constant elasticity of variance option pricing
formula. Journal of Finance 44(1):211–219
Singh F (2025) Option contracts in the DeFi ecosystem: Opportunities, solutions, and
technical challenges. International Journal of Network Management 35(2):e70005
Appendix A Standard CEV Closed-Form
Machinery
This appendix collects the closed-form pricing apparatus that follows from the CEV
identity. The results are due to Cox (1975), Schroder (1989), Davydov and Linetsky
(2003), and Larguinho et al (2013); they are not novel to this paper. We include them
for self-containment.
21A.1 Risk-Neutral Dynamics and Boundary Behavior
Under the risk-neutral measure Q,
dPt = rPtdt + δPβ
t dWQ
t . (A1)
The Girsanov kernel θ(P) = (µ(P)−rP)/(δPβ
) is bounded on {P ≥ ε} for any ε > 0.
Define stopping times τn = inf{t : Pt < 1/n} and apply Girsanov on each [0,τn ∧ T].
Since zero is inaccessible under (A1) (Lemma 7 below), τn → ∞ a.s. and the global
measure change is justified.
Lemma 7 (Boundary inaccessibility). For β = 1/2 and r > 0, the CEV process
(A1) has P = 0 as an inaccessible (entrance) boundary: the process cannot reach
zero in finite time. The non-central chi-squared pricing formula is well-defined without
boundary correction.
Proof. Apply the Feller boundary classification to (A1). The scale function near zero
is s(P) =
RP
exp(−2ru1−2β
/(δ2
(1 − 2β)))du for β < 1/2, and a standard adaptation
for β = 1/2. The integral diverges as P → 0+
, so zero is inaccessible (Davydov and
Linetsky, 2003, §3).
Under the physical measure, when µF is small relative to σ2
F /
√
k, the boundary
can be attainable; this is the case of a draining pool. For pricing purposes only the
risk-neutral measure matters.
A.2 European Call Price
Theorem 8 (CEV call price; Schroder 1989). For β < 1 and r > 0, the European call
with strike Kstr and maturity T has price
C(P,Kstr,T) = P[1 − χ2
(a;b + 2,c)] − Kstre−rT
χ2
(c;b,a), (A2)
where χ2
(x;n,λ) is the cumulative distribution of the non-central chi-squared with n
degrees of freedom and non-centrality parameter λ, and
κ =
2r
δ2(1 − β)(e2r(1−β)T − 1)
, (A3)
c = κP2(1−β)
e2r(1−β)T
, a = κK
2(1−β)
str , b =
1
1 − β
. (A4)
For β = 1/2, b = 2 and the formulas simplify. Put prices follow by parity: Π =
C − P + Kstre−rT
.
A.3 Liquidity-Adjusted Greeks
Definition 1 (Liquidity Greek). Beyond the standard Greeks, the AMM setting
motivates
Λ ≡
∂C
∂k
=
∂C
∂δ
·
∂δ
∂k
. (A5)
22For a constant-product AMM, δ = 2σF /
√
k, so ∂δ/∂k = −σF /k3/2
and Λ < 0: deeper
pools reduce option value by compressing volatility.
Numerical comparison of CEV and Black–Scholes Greeks appears in Figure A1
and the liquidity Greek in Figure A2.
10 15 20 25 30 35 40 45 50
Price (TAO/ × 1000)
0.0
0.2
0.4
0.6
0.8
1.0
Delta
Delta Comparison
CEV ( =1/2)
Black--Scholes
10 15 20 25 30 35 40 45 50
Price (TAO/ × 1000)
10
20
30
40
Gamma
Gamma Comparison
CEV ( =1/2)
Black--Scholes
Fig. A1 CEV (β = 1/2) and Black–Scholes Greeks for an at-the-money European call. Both gammas
peak below the strike; the CEV gamma is sharper and peaks further below, reflecting concentration
of risk in the high-volatility low-price region.
106 107 108 109 1010
Pool Depth k(log scale)
0.8
0.6
0.4
0.2
0.0
(× 10 9 )
Liquidity Greek = C/ k
Fig. A2 The liquidity Greek Λ = ∂C/∂k for an at-the-money call as a function of pool depth.
Sensitivity is concentrated in shallow pools and becomes negligible for k > 109.
A.4 Monte Carlo Validation of the Closed-Form
Figure A3 compares Monte Carlo prices to the CEV formula across strikes and pool
depths. For deep pools the maximum deviation is below 0.5% of spot. For shallow
pools, MC prices exceed CEV by 1–3%, reflecting Euler–Maruyama discretization error
amplified when flow volatility is large relative to the reserve.
230.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4
0
5
10
15
20
25
30
35
40
Call Price (% of spot)
Shallow Pool (k=106)
CEV (closed-form)
Monte Carlo (100K paths)
0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4
0
5
10
15
20
25
30
35
40
Call Price (% of spot)
Deep Pool (k=109)
CEV (closed-form)
Monte Carlo (100K paths)
0.6 0.8 1.0 1.2 1.4
Moneyness (K/P0)
0.0
0.2
0.4
MC CEV (% of spot)
Pricing Error
0.6 0.8 1.0 1.2 1.4
Moneyness (K/P0)
0.4
0.3
0.2
0.1
0.0
MC CEV (% of spot)
Pricing Error
Fig. A3 Monte Carlo validation of the CEV pricing formula: shallow pool (k = 106) and deep pool
(k = 109). Top: closed-form CEV (line) versus Monte Carlo (points with 95% confidence intervals).
Bottom: pricing error as a percentage of spot.
Appendix B Jump-Diffusion Option Pricing
For the jump-diffusion specification of Section 5, an option price follows by condi-
tioning on the realized number of jumps and using the Merton (1976) decomposition.
With independent diffusion and Poisson components, the call price is
CJD(P,Kstr,T) =
∞ X
n=0
e−λT
(λT)n
n!
· CCEV(Pn,Kstr,T;rn,δn,β), (B6)
where CCEV is the formula (A2), conditional spot is Pn = P exp(nµlog P
J ) with µlog P
J =
2µJ/x in the small-jump approximation, conditional drift is rn = r −λκJ +nlog(1+
κJ)/T with κJ = exp(2µJ/x+2σ2
J/x2
)−1, and conditional volatility absorbs n jumps’
worth of log-price variance: δ2
n = δ2
+ nσlog P,2
J P2(1−β)
/T, with σlog P,2
J = (2σJ/x)2
.
Figure B4 compares the Merton-CEV price with pure CEV and Black–Scholes
for parameters calibrated to the median Bittensor subnet. Light jumps shift the call
price by less than one percent of spot; heavy jumps shift it by several percent. The
skew shape (right panel) is essentially unchanged: jumps shift the level, not the shape,
consistent with Proposition 6.
Appendix C Extension: Token Emissions
When the protocol deepens the pool deterministically over time, K becomes a (slow)
function of t. For Bittensor, the protocol injects TAO and matches alpha to hold the
240.7 0.8 0.9 1.0 1.1 1.2 1.3
MoneynessK/P
0
5
10
15
20
25
30
35
Call price (% of spot)
CEVwithjump-diffusionflowvsBlack-Scholes
PureCEV(nojumps)
CEV+lightjumps(lam=12,sJ=200)
CEV+medianjumps(lam=24,sJ=400)
CEV+heavyjumps(lam=48,sJ=800)
Black-Scholes(matchedATM)
0.7 0.8 0.9 1.0 1.1 1.2 1.3
MoneynessK/P
0
1000
2000
3000
4000
5000
6000
7000
% deviation from pure-CEV price
JumpsshifttheCEVpricelevel,nottheskewshape
PureCEV(nojumps)
CEV+lightjumps(lam=12,sJ=200)
CEV+medianjumps(lam=24,sJ=400)
CEV+heavyjumps(lam=48,sJ=800)
Fig. B4 Merton-CEV jump-diffusion call price for parameters calibrated to the median Bittensor
subnet. Left: call price as percentage of spot vs. moneyness, for jump-diffusion specifications ranging
from no jumps to heavy jumps. Right: percentage deviation from the pure-CEV (no-jumps) price.
Jumps shift the price level systematically but the skew shape is preserved.
spot price constant, so the invariant grows as
dk
dt
= y(t)eTAO + x(t)eα, (C7)
where eTAO and eα are the per-unit-time emission rates. For option horizons short
relative to the emission timescale, k(t) ≈ k0 + k̇t, the volatility parameter becomes
time-dependent δ(t) = 2σF /
p
k(t), and the integrated variance entering CEV pricing
is
v̄2
=
Z T
0
δ(t)2
dt =
4σ2
F
k̇
log 1 +
k̇T
k0
!
. (C8)
Proposition 9 (Option pricing with emissions). Under deterministically time-varying
δ(t) that evolves slowly relative to the option horizon, the CEV pricing formula (A2)
remains valid with δ2
T replaced by v̄2
. As k̇ → 0, v̄2
→ 4σ2
F T/k0 = δ2
0T, recovering
the constant case.
Figure C5 shows the effect on call prices: higher emissions deepen the pool, com-
press volatility, and reduce option value, with the effect most pronounced at long
maturities.
Remark 3 (Emissions as effective dividend yield). Expanding v̄2
for small k̇T/k0 gives
v̄2
≈ δ2
0T(1 − k̇T/(2k0) + ···). Defining qeff = k̇/(2k0), the emission-adjusted CEV
price equals to first order the zero-emission price on an underlying with continuous
yield qeff.
Appendix D Robustness of the Variance-Elasticity
Sample
The variance-elasticity test in Section 6 excludes 8 subnets with degenerate price paths
or insufficient intra-window variation. We re-run the regression on the broader sample
of all 127 eligible subnets (out of 128 total) that pass only the basic history filter,
250 50 100 150 200 250 300 350
Maturity (days)
5
10
15
20
25
30
35
ATM Call Price (% of spot)
Effect of Token Emissions on Option Prices
No emissions
Low (k=k0/yr)
Medium (k=5k0/yr)
High (k=20k0/yr)
Fig. C5 At-the-money call price (as percentage of spot) versus maturity under different emission
rates, expressed as multiples of k0 per year. Higher emissions deepen the pool over time, compressing
volatility and reducing option prices at longer maturities.
with predictable degradation but the same qualitative result. Table D1 reports the
comparison.
Table D1 Variance-elasticity slope for the main 92-subnet sample versus the
broader 127-subnet sample without quality screens. The qualitative result is
unchanged.
Sample Median slope IQR
Main sample (92 subnets, with screens) −0.956 [−1.07,−0.88]
Broader sample (127 subnets, history only) −0.948 [−1.07,−0.86]
The median slope shifts by less than 0.01 and remains highly significant against
the GBM null (t = −49.3); the rejection against the exact CEV value (t = 2.25) is
similarly marginal. The conclusion is robust to sample selection.
Appendix E Variance-Elasticity Backtest of
Hedging Performance
To verify that the variance-elasticity test maps to a property of hedging perfor-
mance, we conduct a complementary cross-sectional delta-hedged backtest of 14-day
at-the-money calls across all 103 eligible Bittensor subnets after filtering out 25 with
degenerate price paths (MAE > 50%, typically near-zero reserves or extreme price
dislocations). The procedure: (i) estimate σ̂F from the trailing 14 days of TAO reserve
changes; (ii) compute model prices under both CEV (β = 1/2, δt = 2σ̂F /
√
kt) and
Black–Scholes (matched ATM σeff = δP−1/2
); (iii) delta-hedge daily for 14 days; (iv)
at expiry compute hedged P&L and aggregate per subnet to a mean absolute hedging
error.
26Figure E6 shows that CEV and Black–Scholes hedging errors are nearly identical
at the money. An OLS regression of the CEV/BS error ratio on log10(k) yields slope
0.011, R2
= 0.06, p = 0.013 on the filtered 103-subnet sample (slope 0.009, p = 0.015
on the unfiltered 128-subnet sample). The slope is small in magnitude and statistically
significant, but the cross-sectional ratio remains close to one across the entire range
of pool depths: CEV hedging errors are within 3% of Black–Scholes at the median
pool depth. This is consistent with Proposition 5: the normalized skew is universal
in k, so ATM CEV and Black–Scholes deltas are nearly identical and produce nearly
indistinguishable hedges. The CEV correction matters most for OTM positions, which
cannot be tested without an OTM option market.
0.0 2.5 5.0 7.5 10.0 12.5 15.0 17.5
BS Mean Abs. Hedging Error (% of spot)
0.0
2.5
5.0
7.5
10.0
12.5
15.0
17.5
CEV Mean Abs. Hedging Error (% of spot)
Hedging Error: CEV vs. BS (103 subnets)
CEV = BS
8 9 10 11 12
log10(k)(pool depth)
0.950
0.975
1.000
1.025
1.050
1.075
1.100
1.125
CEV / BS Hedging Error Ratio
Relative Hedging Performance vs. Pool Depth
CEV = BS
OLS: slope=0.011
Unfiltered (N=128): slope=0.009
8
9
10
11
12
log 10 (k)
Fig. E6 Cross-sectional delta-hedged backtest of 14-day at-the-money calls across 103 Bittensor
subnets. Left: CEV vs. Black–Scholes mean absolute hedging error per subnet, colored by pool depth.
Points cluster tightly on the 45-degree line. Right: CEV/BS error ratio vs. pool depth shows a small
positive slope (0.011, p = 0.013); the ratio remains close to one at all depths, consistent with universal-
skew prediction that ATM hedges are essentially equivalent.
27