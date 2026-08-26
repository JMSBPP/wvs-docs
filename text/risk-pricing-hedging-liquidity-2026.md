---
sha256: 3f1a91f796060f3b4f24615bacdbde81b5c28b196cf25a192960752112bd5693
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 78686
---
PRICING AND HEDGING FOR LIQUIDITY PROVISION IN
CONSTANT FUNCTION MARKET MAKING
JIMMY RISK, SHEN-NING TUNG, AND TAI-HO WANG
Abstract. This paper develops a robust mathematical framework for Constant Function
Market Makers (CFMMs) by transitioning from traditional token reserve analyses to a coor-
dinate system defined by price and intrinsic liquidity. We establish a canonical parametriza-
tion of the bonding curve that ensures dimensional consistency across diverse trading func-
tions, such as those employed by Uniswap and Balancer, and demonstrate that asset re-
serves and value functions exhibit a linear dependence on this intrinsic liquidity. This linear
structure facilitates a streamlined approach to arbitrage-free pricing, delta hedging, and
systematic risk management. By leveraging the Carr-Madan spanning formula, we char-
acterize Impermanent Loss (IL) as a weighted strip of vanilla options, thereby defining a
fine-grained implied volatility structure for liquidity profiles. Furthermore, we provide a
path-dependent analysis of IL using the last-passage time. Empirical results from Uniswap
v3 ETH/USDC pools and Deribit option markets confirm a volatility smile consistent with
crypto-asset dynamics, validating the framework’s utility in characterizing the risk-neutral
fair value of liquidity provision.
It all begins with the canonical parametrization of the bonding curve in CFMM.
1. Introduction
The emergence of Decentralized Finance (DeFi) [HRS+
21, GM23, CJ21] has revolutionized
asset exchange through the implementation of Constant Function Market Makers (CFMMs)
[AC20, ACD+
24]. Unlike traditional limit order books that rely on discrete orders, protocols
such as Uniswap [AZR20, AZS+
21, ASZ+
23] and Balancer [MM19] utilize a deterministic
bonding curve to govern the relationship between token reserves and exchange rates. This
mechanism ensures that liquidity remains available across a continuous price spectrum, con-
tingent on the slippage costs defined by the underlying trading function.
Within this ecosystem, the role of the Liquidity Provider (LP) has undergone a profound
transformation. By depositing assets into a smart contract, LPs effectively sell tokens to
the market according to a pre-defined rule [AEC23]. Consequently, an LP position can be
mathematically framed as a sophisticated financial derivative. The growing academic and
industrial recognition of this equivalence is highlighted by protocols such as Panoptic [LK22],
which utilize Uniswap v3 liquidity positions as the underlying engine for perpetual options.
As the complexity of these automated strategies increases, research has shifted toward
the optimal design of bonding curves. While early automated market makers (AMMs) relied
on simple invariants, the current landscape demands capital-efficient structures that reflect
Date: March 3, 2026.
Key words and phrases. Automatic market making, Decentralized exchange, Decentralized finance.
1
arXiv:2603.01344v1 [q-fin.MF] 2 Mar 20262 J. RISK, S.-N. TUNG, AND T.-H. WANG
specific financial payoffs. Determining an “optimal” curve requires a rigorous understanding
of how liquidity profiles interact with market volatility and informed order flow.
Literature Review.
LP Positions as Synthetic Derivatives. A foundational branch of literature characterizes
the payoff structures of LPs as equivalent to traditional derivatives. Early work replicated
Uniswap v2 payoffs with portfolios of options, a framework subsequently extended to the
concentrated liquidity models of Uniswap v3 [Cla20, Cla21]. This equivalence was formal-
ized by Angeris et al. [AEC23], who characterized the space of feasible CFMM payoffs in
terms of the properties of the trading function. Within this lens, Impermanent Loss (IL)
is increasingly viewed as a hedgeable risk; notably, Fukasawa et al. [FMW23] demonstrate
that IL in constant product markets can be perfectly hedged using a weighted variance swap
of order 1/2. More practical hedging strategies involve standard put and call options to
mitigate the idiosyncratic risks of concentrated liquidity positions [LLS25].
Pricing, Hedging, and Implied Volatility. As LP positions are recognized as derivatives, the
question of their “fair value” arises. Recent works establish a rigorous framework for the
arbitrage-free pricing of liquidity tokens [BF24, BF25]. By defining an implied volatility
metric derived from transaction-fee streams, this research enables LPs to quantify the “price
of liquidity” in a manner consistent with the Black–Scholes paradigm, bridging the gap
between endogenous fee generation and exogenous asset volatility.
Dynamic Modeling and Parameterization. To move beyond static payoffs, recent studies
model the temporal evolution of liquidity. The framework introduced in [TW24] provides a
canonical parameterization of CFMMs through a “liquidity profile,” offering a unified mathe-
matical language for various bonding curves. Building on this, [RTW25] models the stochas-
tic dynamics of these profiles to capture shifts in response to market behavior. These models
are essential for analyzing the “Loss-Versus-Rebalancing” (LVR) metric, which [SLG+
25]
presents as a continuous-installment option to price the ongoing costs of providing liquidity
against informed arbitrageurs.
Strategic and Optimal Liquidity Provision. Finally, a growing body of work focuses on LPs’
strategic behavior. Using an optimal stopping approach, Capponi and Zhu [CZ25] demon-
strate the existence of strategies that remain profitable relative to “buy-and-hold” bench-
marks, even after accounting for LVR [CZ25]. This suggests that the “natural coordinates”
for AMM analysis are price and intrinsic liquidity, which together dictate the optimal design
of the bonding function.
Contribution. This paper reviews and extends the market model framework proposed in
[TW24]. By shifting the perspective from token reserves to a coordinate system defined by
price and liquidity, the framework achieves several key objectives:
(1) It defines an intrinsic liquidity that maintains dimensional consistency (
√
ETH × USDC)
across all CFMM bonding functions, providing a universal metric for market depth.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 3
(2) It demonstrates that relevant financial quantities, including asset reserves and value
functions, are encoded in the linear dependence of the model on the intrinsic liquidity
profile.
(3) It simplifies complex tasks such as arbitrage-free pricing, delta hedging, and systematic
risk management by exploiting this linear structure.
(4) It unifies diverse results from existing literature—ranging from constant product for-
mulas to concentrated liquidity—into a single, concise representation.
(5) It enables the evaluation of liquidity profiles through fine-structure implied volatility
and path-dependent last-passage time analysis, allowing for a granular assessment of
market-implied risk.
We argue that the price-intrinsic liquidity pair is the natural coordinate system for the
pricing and hedging of bonding functions. In the following sections, we detail the mathemat-
ical derivation of this framework and demonstrate its application to several canonical AMM
structures.
2. Intrinsic Liquidity and Liquidity Profile
In the study of Constant Function Market Makers (CFMMs) [AC20, ACD+
24], the system
is typically characterized by a bonding function f and its associated level set f(x,y) = K,
often termed the bonding curve. Conventionally, the level K is interpreted as the “liquidity
depth.” We argue, however, that this definition is dimensionally inconsistent across different
CFMM architectures. To resolve this, we propose an intrinsic definition of liquidity that is
invariant under reparametrization and maintains dimensional consistency across all CFMM
models. While aspects of this discussion appear in [TW24], we provide the key arguments
here for completeness.
2.1. Dimensionally Consistent Liquidity. Consider the Constant Product Market Maker
(CPMM) [AZR20] for a pair of tokens, e.g., ETH and USDC. The bonding curve is de-
fined by the level set
√
xy = K, where the parameter K possesses the physical dimension
√
ETH × USDC. In contrast, for Geometric Mean Market Makers (G3Ms) [MM19], the
bonding curve is given by xα
y1−α
= K for some weight α ∈ (0,1). For this model, K carries
the dimension ETHα
× USDC1−α
.
This dimensional disparity implies that the parameter K is not a consistent proxy for mar-
ket depth across protocols; specifically, the same numerical value of K represents different
physical quantities depending on the exponent α. To resolve this, we utilize the framework
established in [TW24, Appendix B] to define a local intrinsic liquidity ℓ that is both di-
mensionally consistent and invariant under reparametrization. For a smooth bonding curve
f(x,y) = K, we define ℓ at the reserve state (x,y) as:
ℓ :=
−2(fxfy)3/2
fyyf2
x − 2fxyfxfy + fxxf2
y
, (1)
where subindices denote partial derivatives.
The definition in (1) ensures that ℓ always yields the dimension
√
ETH × USDC, matching
the CPMM standard regardless of the functional form of f. Mathematically, this definition is4 J. RISK, S.-N. TUNG, AND T.-H. WANG
related to the curvature of the bonding curve in the (x,y) plane. We emphasize two critical
properties of ℓ:
• Locality: Unlike the global constant K, ℓ is a state-dependent quantity ℓ(x,y) that
characterizes the immediate price impact at a specific reserve point.
• Invariance: The definition is intrinsic to the geometry of the curve f(x,y) = K,
meaning it is independent of the choice of functional representation (e.g., xy = K2
versus
√
xy = K).
Example 2.1 (G3M Liquidity). For the G3M f(x,y) = xα
y1−α
= K, the intrinsic liquidity is
computed as:
ℓ = 2
p
α(1 − α)
√
xy = 2
p
α(1 − α)K x
1
2
−α
yα−1
2 .
This expression explicitly restores the
√
ETH × USDC dimension. In the specific case of the
CPMM (α = 1
2
), the local intrinsic liquidity simplifies to ℓ =
√
xy = K. Thus, for a CPMM,
the liquidity profile is uniform across all price points, and the intrinsic liquidity coincides
with the traditional depth parameter.
2.2. Liquidity Profile and Reserves. In the study of CFMMs, the spot price p is endoge-
nously determined by the pool’s current reserve state (x,y). By adopting token Y as the
numéraire, the spot price is defined as the marginal rate of substitution:
p := −
dy
dx
=
fx
fy
.
This value represents the unit price of token X required for an infinitesimal swap dx. While
conventional models define reserves x and y as primary variables, we demonstrate that the
bonding curve f(x,y) = K admits a more fundamental representation via the spot price p
and the local intrinsic liquidity ℓ. This leads to what we term the canonical parametrization
of the bonding curve.
Theorem 2.2 (Canonical Parametrization). Let the bonding function f(x,y) be smooth,
strictly increasing, and convex in (x,y). For the CFMM f(x,y) = K, the reserve levels
(x,y) are uniquely determined by the spot price p and the local intrinsic liquidity ℓ via the
following integral representations:
x(p) =
Z ∞
p
ℓ(q)
2
p
q3
dq, y(p) =
Z p
0
ℓ(q)
2
√
q
dq, (2)
where ℓ(q) is the intrinsic liquidity at price q defined in (1).
Proof. Consider an arbitrary parametrization (x(s),y(s)) of the level curve f(x,y) = K with
ẋ < 0 and ẏ > 0. Implicit differentiation yields fxẋ + fyẏ = 0, implying p = −ẏ/ẋ. By
differentiating p with respect to the parameter s, we have:
dp
ds
= −
d
ds

ẏ
ẋ

=
−ÿẋ + ẍẏ
ẋ2
=
d
ds

fx
fy

= −
ẏ
fxf2
y
(fxxf2
y − 2fxyfxfy + fyyf2
x).PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 5
Utilizing the definition of ℓ in (1) and changing the variable of integration from s to p, we
obtain:
ℓ =
−2(fxfy)3/2
fyyf2
x − 2fxyfxfy + fxxf2
y
= 2
(−ẋẏ)3/2
ÿẋ − ẍẏ
,
dx
dp
= ẋ
ds
dp
= −
ẋ3
ÿẋ − ẍẏ
= −
1
2
2(−ẋẏ)3/2
ÿẋ − ẍẏ

−
ẋ
ẏ
3/2
= −
ℓ
2p3/2
,
dy
dp
= ẏ
ds
dp
= −
ẋ2
ẏ
ÿẋ − ẍẏ
=
1
2
2(−ẋẏ)3/2
ÿẋ − ẍẏ
s
−
ẋ
ẏ
=
ℓ
2
√
p
.
Integrating these expressions with respect to p from the respective boundaries (p → ∞ for
x and p → 0 for y) completes the proof. □
The relationship in Theorem 2.2 allows us to define the local intrinsic liquidity profile as
a distribution function ℓ(p) over the price spectrum (0,∞). For the purpose of financial
modeling, it is often more convenient to work with the liquidity profile L(q), defined as:
L(q) :=
ℓ(q)
2q3/2
. (3)
Substituting L(q) into (2) yields a succinct representation of the pool reserves:
x(p) =
Z ∞
p
ℓ(q)
2
p
q3
dq =
Z ∞
p
L(q)dq, y(p) =
Z p
0
ℓ(q)
2
√
q
dq =
Z p
0
qL(q)dq. (4)
The dimensional consistency is preserved: L(q)dq carries the dimension of token X, while
qL(q)dq carries the dimension of token Y . This formulation highlights the infinitesimal price
impact of a trade volume dx:
dp = −
1
L(p)
dx. (5)
This identity confirms the economic intuition that higher liquidity density L(p) suppresses
slippage, as a larger L(p) results in a smaller price adjustment dp for any given volume dx.
2.3. Liquidity Profile Value and Option Replication. For a given liquidity profile L,
we define its mark-to-market value VL(p) as a function of the spot price p. Taking token
Y as the numéraire, the value is defined by the sum of the value of its constituent token
holdings:
VL(p) = x(p)p + y(p)
=
Z ∞
0
p1[p,∞)(q)L(q)dq +
Z ∞
0
q1[0,p](q)L(q)dq
=
Z ∞
0
min{p,q}L(q)dq, (6)
where 1A(·) denotes the indicator function for the interval A. The representation in (6)
provides a direct financial interpretation: since min{p,q} = p − (p − q)+
corresponds to the
payoff of a covered call struck at q, the total pool value VL is equivalent to the payoff of a
strip of weighted covered calls. The weights of this portfolio are determined entirely by the
liquidity profile L(q).6 J. RISK, S.-N. TUNG, AND T.-H. WANG
A more fundamental decomposition is achieved by applying the spanning formula of Carr
and Madan [CM01], which enables the representation of any twice-differentiable payoff φ(S)
via a portfolio of OTM options:
φ(S) = φ(S0) + φ′
(S0)(S − S0) +
Z S0
0
φ′′
(K)(K − S)+
dK +
Z ∞
S0
φ′′
(K)(S − K)+
dK. (7)
By noting that V ′
L(p) = x(p) and V ′′
L (p) = x′
(p) = −L(p), we apply this decomposition to
the value function VL. Substituting these derivatives into (7) yields:
VL(p) = VL(p0) + V ′
L(p0)(p − p0) +
Z p0
0
V ′′
L (q)(q − p)+
dq +
Z ∞
p0
V ′′
L (q)(p − q)+
dq
= x(p0)p + y(p0) −
Z p0
0
L(q)(q − P)+
dq −
Z ∞
p0
L(q)(p − q)+
dq. (8)
The identity in (8) demonstrates that the liquidity provider’s position is equivalent to a linear
combination of the initial holding value and a short position in a continuously weighted
strip of out-of-the-money (OTM) put options (for q ∈ [0,p0]) and OTM call options (for
q ∈ [p0,∞)). This equivalence is central to the pricing and hedging strategies developed in
subsequent sections. In a complete market, (8) implies that the value VL can be perfectly
replicated by a self-financing trading strategy involving the underlying assets and vanilla
options.
2.4. Replicating Market Makers. In [AEC23], it is established that every CFMM pos-
sesses a concave, nonnegative, and 1-homogeneous payoff function, and conversely, any payoff
function satisfying these properties has a corresponding convex CFMM. We demonstrate in
this section that the canonical relationships established in (4) provide a straightforward, al-
ternative approach for constructing a CFMM trading function for any given target portfolio
value V (p).
Assume a liquidity provider (LP) wishes to replicate a target portfolio value V (p) :=
px(p)+y(p) by designing an appropriate CFMM. Recall from the canonical parametrization
that x(p) = V ′
(p). By inverting this relationship, we obtain the spot price as a function of
reserves: p = (V ′
)−1
(x). Furthermore, since the liquidity profile is given by L(p) = −V ′′
(p),
we can derive the CFMM trading function by integrating the reserve relationship for y:
y +
Z (V ′)−1(x)
0
qV ′′
(q)dq = 0. (9)
We illustrate this procedure with two canonical examples from the literature.
Example 2.3 (Payoff of a Covered Call at Expiry). Consider an LP whose target portfolio
value is the payoff of a covered call struck at K at expiry:
V (p) = p − (p − K)+
.
The corresponding liquidity profile is a Dirac delta function: L(p) = −V ′′
(p) = δ(p − K).
Applying the canonical parametrization yields:
x(p) =
Z ∞
p
δ(q − K)dq = θ(K − p),PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 7
y(p) =
Z p
0
q δ(q − K)dq = Kθ(p − K),
where θ denotes the Heaviside step function. Using the identity 1 − θ(K − p) = θ(p − K),
we recover the linear trading function:
Kx + y = K,
consistent with the results in [AEC23].
Example 2.4 (Black–Scholes Covered Call). Assume the target portfolio value is the price of
a covered call under Black–Scholes dynamics:
V (p) = p − pN(d1) + KN(d2),
where d1 = ln(p/K)
v
+ v
2
and d2 = d1 − v. Since x = V ′
(p) = 1 − N(d1), we find the price as
a function of the x reserve: p = KevN−1(1−x)−v2/2
. Given that L(p) = −V ′′
(p) = Γ(p) (the
Black–Scholes Gamma), the y reserve is obtained via:
y =
Z p
0
qL(q)dq =
Z KevN−1(1−x)−v2
2
0
q Γ(q)dq = KN N−1
(1 − x) − v

,
This can be expressed in the symmetric form:
N−1
(1 − x) − N−1
(y/K) = v,
recovering the replicating market maker results for perpetual options in [AEC23].
3. Pricing and Hedging for General Liquidity Profiles
In this section, we establish that liquidity provision within a CFMM pool is mathematically
equivalent to maintaining a short position in a contingent claim characterized by a convex
payoff. Leveraging the canonical parametrization developed in (4), we quantify the risk
inherent to the liquidity provider (LP) and derive the associated risk-neutral pricing and
hedging frameworks by exploiting the spanning formula introduced in (8).
3.1. Static Replication of Impermanent Loss by Vanilla Options. The primary risk
for an LP in a CFMM is quantified as impermanent loss (IL), also referred to as divergence
loss. Defined as the opportunity cost of providing liquidity relative to a simple buy-and-hold
strategy of the underlying assets, IL can be expressed as a weighted sum of payoffs from a
continuous strip of vanilla options.
Let p0 denote the current pool price and pT the future price at time T. Utilizing the
expression for the value function VL(pT ) from (8), the IL at time T is defined as:
IL(pT |p0,L) := x(p0)pT + y(p0) − VL(pT )
=
Z p0
0
L(q)(q − pT )+
dq +
Z ∞
p0
L(q)(pT − q)+
dq. (10)8 J. RISK, S.-N. TUNG, AND T.-H. WANG
This representation highlights the linearity of IL with respect to the liquidity profile L and
its universal applicability across diverse bonding functions. The formula can be simplified
to a more concise integral form:
IL(pT |p0,L) =
Z pT
p0
(pT − q)L(q)dq, (11)
which underscores that IL is essentially the cost of the option embedded in the LP’s position
rather than a mere metric of pool stability.
This replication framework unifies several disparate expressions found in the literature
[Cla20, Cla21, MW24, LLS25]. For instance, [LLS25] showed that a concentrated liquidity
position in the range [pa,pb] with a single unit of liquidity (L(q) = 1
2q3/2 1{pa≤q≤pb}) can be
decomposed into terms u0, u1/2, and u1 as follows:
u0(pt) =
√
p0 +
pt
√
p0
,
u1/2(pt) = −2
√
pt1{pa≤pt≤pb},
u1(pt) = −2
√
pa1{pt<pa} +
1
√
pa
(pa − pt)+
− 2
√
pb1{pt>pb} −
1
√
pb
(pt − pb)+
.
Applying the general result in (10) provides a direct derivation of this specific case. By
integrating over the range [pa,pb] and considering the price relative to the boundaries, we
recover the tripartite formula:
IL(pt|p0,L) =
Z p0
pa
(q − pt)+ dq
2q3/2
+
Z pb
p0
(pt − q)+ dq
2q3/2
=
Z p0
pa
(q − pt)+ dq
2q3/2
+
Z pb
p0
(pt − q)+ dq
2q3/2

1{pt<pa}
+
Z p0
pa
(q − pt)+ dq
2q3/2
+
Z pb
p0
(pt − q)+ dq
2q3/2

1{pt>pb}
+
Z p0
pa
(q − pt)+ dq
2q3/2
+
Z pb
p0
(pt − q)+ dq
2q3/2

1{pa≤pt≤pb}
=

√
p0 −
√
pa −
pt
√
pa
+
pt
√
p0

1{pt<pa}
+

pt
√
p0
−
pt
√
pb
−
√
pb +
√
p0

1{pt>pb}
+

√
p0 − 2
√
pt +
pt
√
p0

1{pa≤pt≤pb}
=

√
p0 +
pt
√
p0

− 2
√
pt1{pa≤pt≤pb} −

√
pa +
pt
√
pa

1{pt<pa} −

pt
√
pb
+
√
pb

1{pt>pb}
=

√
p0 +
pt
√
p0

− 2
√
pt1{pa≤pt≤pb}
−

2
√
pa −
1
√
pa
(pa − pt)

1{pt<pa} −

2
√
pb +
1
√
pb
(pt − pb)

1{pt>pb}PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 9
=
√
p0 +
pt
√
p0
− 2
√
pt1{pa≤pt≤pb}
−2
√
pa1{pt<pa} +
1
√
pa
(pa − pt)+
− 2
√
pb1{pt>pb} −
1
√
pb
(pt − pb)+
= u0(pt) + u1/2u0(pt) + u1u0(pt).
3.2. Dynamic Decomposition: Loss-Versus-Rebalancing. In this subsection, we tran-
sition to a continuous-time framework to analyze the temporal evolution of Impermanent
Loss (IL). A critical, non-hedgeable component of IL is the loss-versus-rebalancing (LVR),
first introduced in [MMRZ22]. We utilize the canonical parametrization in (4) to provide
alternative understandings of the relationship between IL, LVR, and contracts on realized
variance such as variance and gamma swaps.
3.2.1. IL as Hedging Cost plus LVR. By applying the Tanaka formula, we derive an alter-
native expression for the LVR in terms of the local times of the underlying price process Pt.
Given that IL(P0|P0,L) = 0, the evolution of the impermanent loss can be written as:
IL(Pt|P0,L) =
Z t
0
d(IL(Ps|P0,L))
=
Z t
0
Z P0
0
L(q)d(q − Ps)+
dq +
Z t
0
Z ∞
P0
L(q)d(Ps − q)+
dq. (12)
Applying the Tanaka formula:
d(Pt − q)+
= −1{Pt≤q}dPt +
1
2
dLq
t(P), d(q − Pt)+
= 1{Pt≥q}dPt +
1
2
dLq
t(P),
where Lq
t(P) denotes the local time of P at q, we obtain:
IL(Pt|P0,L)
=
Z P0
0
L(q)

−
Z t
0
1{Ps<q}dPs +
1
2
Lq
t(P)

dq +
Z ∞
P0
L(q)
Z t
0
1{Ps>q}dPs +
1
2
Lq
t(P)

dq
= −
Z t
0
Z P0
0
L(q)1{Ps<q}dq −
Z ∞
P0
L(q)1{Ps>q}dq

dPs +
1
2
Z ∞
0
L(q)Lq
t(P)dq. (13)
Recalling the reserve identity x(p) =
R∞
p
L(q)dq , the term multiplying dPs is identified as
the change in token X reserves relative to the initial state:
Z P0
0
L(q)1{Ps<q}dq −
Z ∞
P0
L(q)1{Ps>q}dq = x(Ps) − x(P0).
Substituting this into (13) yields the fundamental dynamic decomposition:
IL(Pt|P0,L) =
Z t
0
{x(P0) − x(Ps)}dPs +
1
2
Z ∞
0
Lq
t(P)L(q)dq. (14)
The first integral,
Rt
0
{x(P0)−x(Ps)}dPs, represents the hedging cost or arbitrage profit arising
from continuous rebalancing. The remaining term defines the LVR:
LVRt :=
1
2
Z ∞
0
Lq
t(P)L(q)dq. (15)10 J. RISK, S.-N. TUNG, AND T.-H. WANG
This representation characterizes LVR as a weighted sum of the local times of the price
process across the entire price spectrum, with weights provided by the liquidity profile L.
By the occupation time formula, the LVR can be expressed as a time-integral of the quadratic
variation ⟨P⟩:
LVRt =
1
2
Z t
0
L(Ps)d⟨P⟩s, (16)
This formulation generalizes the LVR results in [MMRZ22] to arbitrary liquidity profiles and
establishes a direct functional link between L and the non-hedgeable risk of the position.
Example 3.1. Consider the edge case L(q) = lδ(q − q0), where an LP provides liquidity l
only at price q0. In this scenario:
IL(Pt|P0,L) = l(q0 − Pt)+
1{P0≥q0} + l(Pt − q0)+
1{P0≤q0},
LVRt =
l
2
Z ∞
0
Lq
t(P)δ(q − q0)dq =
l
2
Lq0
t (P).
Thus, the IL equates to the payoff of l vanilla options struck at q0, while the LVR is precisely
half the local time spent by the price process at q0.
To demonstrate the advantages of expressing LVR via the liquidity profile L as defined in
(16), we recover several key results from Sections 6.1 and 6.2 of [FMW23]:
Proposition 3.2.
(1) For a CFMM with the bonding curve x + lny = K , the Impermanent Loss at time
T is given by:
ILT = −PT + P0 + PT ln
PT
P0
,
where PT and P0 are the spot prices at times T and 0, respectively. Modulo the P&L
from holding one unit of the risky asset, this IL is equivalent to the payoff of an
entropy contract and, at time 0, corresponds to the value of a gamma swap (up to a
factor of 2).
(2) For a CFMM with the bonding curve lnx+y = K, the Impermanent Loss at time T
is:
ILT =
PT
P0
− 1 − ln
PT
P0
.
Modulo the P&L from holding one unit of the risky asset, this IL is equivalent to the
payoff of a log contract and, at time 0, corresponds to the value of a variance swap
(up to a factor of 2).
Proof. For the curve x + lny = K, we set f(x,y) = x + lny. It follows that p = fx
fy
= y.
Using (1), the local intrinsic liquidity is:
ℓ =
−2(fxfy)3/2
fxxf2
y − 2fxyfxfy + fyyf2
x
=
−2y−3/2
−y−2
= 2
√
y = 2
√
p.
Thus, the liquidity profile is L(q) = ℓ(q)
2
√
q3
= 1
q
. Applying (11) yields:
ILT =
Z
P0
PT
(PT − q)
dq
q
= PT ln
PT
P0
− PT + P0.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 11
For the curve lnx + y = K, we have p = 1
x
and ℓ = 2 √
p
. This results in L(q) = 1
q2 , and (11)
gives:
ILT =
Z
P0
PT
(PT − q)
dq
q2
=
PT
P0
− 1 − ln
PT
P0
.
□
We remark that the gamma and variance swaps identified above result directly from the
LVR. Equation (16) implies that for the curve x + lny = K (where L(q) = 1
q
), we have:
2 × LVRT =
Z T
0
d⟨P⟩s
Ps
,
which is precisely the payoff of a gamma swap. For the curve lnx + y = K, we similarly
obtain:
2 × LVRT =
Z T
0
d⟨P⟩s
P2
s
,
representing the payoff of a variance swap.
The converse also holds: if a gamma swap hedges the LVR pathwise such that LVRT =
1
2
RT
0
d⟨P⟩t
Pt
, then L(p) = 1
p
. The canonical parametrization then yields:
x(p) =
Z C
p
1
q
dq = lnC − lnp, y(p) =
Z p
0
dq = p,
for a constant C > 0. Eliminating p confirms the bonding curve x + lny = lnC. For a
variance swap where LVRT = 1
2
RT
0
d⟨P⟩t
P2
t
, the profile L(p) = 1
p2 corresponds to the bonding
curve lnx + y = K.
3.2.2. Implications for LVR Design and Pricing. The formulation of LVR in (16) provides a
constructive method for designing liquidity profiles, and by extension bonding curves, that
satisfy specific risk-management objectives under a time-homogeneous local volatility model.
This approach mirrors the “replicating market maker” strategy discussed in Section 2.4, but
redirects the focus toward the non-hedgeable LVR component.
Consider a price process Pt governed by the following SDE:
dPt
Pt
= µtdt + σ(Pt)dWt.
The quadratic variation is given by d⟨P⟩t = P2
t σ2
(Pt)dt. By selecting a liquidity profile L(q)
that inversely scales with the stochastic term of the quadratic variation, specifically:
L(q) =
C
q2σ2(q)
,
for some constant C, the resulting LVR process becomes:
LVRt =
1
2
Z t
0
L(Ps)d⟨P⟩s =
1
2
Z t
0
C
P2
s σ2(Ps)
P2
s σ2
(Ps)ds =
C
2
t.12 J. RISK, S.-N. TUNG, AND T.-H. WANG
In this configuration, the LVR is entirely deterministic and proportional to time, effectively
eliminating the risk stemming from price volatility. This design methodology allows for the
construction of LVR-neutral profiles tailored to specific market assumptions.
Example 3.3 (LVR-neutral profile in the CEV model). The Constant Elasticity of Variance
(CEV) model is a local volatility model characterized by the SDE:
dPt = νPβ
t dWt
for constants ν > 0 and β ≥ 0. Under risk-neutral probability with zero interest and dividend
rates, the local volatility function is σ(p) = νpβ−1
. Setting the liquidity profile as
L(q) =
C
q2σ2(q)
=
C
ν2q2β
,
renders the LVR deterministic at C
2
t. The bonding curves associated with this profile vary
by the elasticity parameter β:
x =
C
ν2
Z ∞
p
1
q2β
dq =

    
    
C
ν2
p1−2β
2β−1
if β > 1
2
;
C
ν2 (lnM − lnp) if β = 1
2
, for some large M > 0;
C
ν2
1
1−2β
(M1−2β
− p1−2β
) if β < 1
2
, for some large M > 0;
y =
C
ν2
Z p
0
1
q2β−1
dq =

    
    
C
ν2
1
2(1−β)
p2(1−β)
if β < 1;
C
ν2 (lnp − lnϵ) if β = 1, for some small ϵ > 0;;
C
ν2
1
2(β−1)
(ϵ2−2β
− p2−2β
) if β > 1, for some small ϵ > 0;
In particular, when 1
2
< β < 1, the bonding curve is represented by the G3M form xα
y1−α
=
K, where α = 2 − 2β.
Despite its path-dependent nature, LVR can be priced as a static European contingent
claim. Let Ψ(P) be the second antiderivative of the liquidity profile, such that Ψ′′
(P) =
L(P). Applying Itô’s formula to Ψ(Pt):
dΨ(Pt) = Ψ′
(Pt)dPt +
1
2
Ψ′′
(Pt)d⟨P⟩t
= Ψ′
(Pt)dPt +
1
2
L(Pt)d⟨P⟩t. (17)
If the price process Pt is a Q-martingale, integrating from 0 to T and taking the expectation
yields the LVR price:
EQ
[LVRT ] = EQ
[Ψ(PT )] − Ψ(P0).
This reduction allows for the use of standard European option pricing techniques, such
as Fourier transforms or Monte Carlo simulations, to value the ongoing cost of liquidity
provision.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 13
3.3. Risk Neutral Pricing and Hedging for Impermanent Loss. In this subsection,
we move beyond static replication to address the pricing and hedging of liquidity provision
in a dynamic market setting. Building on the equivalence between providing liquidity and
maintaining a short position in a convex contingent claim, we apply option pricing theory
to quantify risk and establish hedging parameters. By assuming the spot price process Pt
is a martingale under a risk-neutral probability Q, we derive the fair value of IL and define
implied volatility metrics for general liquidity profiles.
3.3.1. Pricing IL as a European-Style Contingent Claim. If we treat IL as a European-style
contingent claim that pays the amount IL(PT |P0,L) at maturity T, its risk-neutral price
ΠIL
t (L,T) at any time t ∈ [0,T] is determined by the conditional expectation under the
risk-neutral measure Q:
ΠIL
t (L,T) := EQ
[IL(PT |P0,L) | Ft]
=
Z P0
0
L(q)EQ

(q − PT )+
| Ft

dq +
Z
P0
∞
L(q)EQ

(PT − q)+
| Ft

dq
=
Z P0
0
L(q)Pt(q,T)dq +
Z
P0
∞
L(q)Ct(q,T)dq, (18)
where Ct(q,T) and Pt(q,T) represent the time-t market prices of European call and put
options with strike q and maturity T.
Applying Jensen’s inequality, it follows that for t ∈ [0,T]:
ΠIL
t (L,T) ≥ IL(Pt|P0,L).
This inequality underscores a vital distinction for LPs: the risk-neutral fair value of their
potential loss is always greater than or equal to the current realized IL prior to expiry.
Delta of IL. The Delta of the risk-neutral price ΠIL
t with respect to the pool price Pt is
given by the weighted integral of the constituent option deltas:
∆ΠIL
t =
∂ΠIL
t
∂Pt
=
Z P0
0
L(q)∆P
t (q,T)dq +
Z ∞
P0
L(q)∆C
t (q,T)dq, (19)
where ∆i
t(q,T) is the Delta of a put or call option (i ∈ {P,C}). This result confirms
that within a local volatility framework, the market is complete, and the IL risk can be
dynamically hedged by holding ∆ΠIL
t units of the underlying asset X.
We distinguish this from the Delta of the current realized IL value, ∆IL
t , which is defined
as:
∆IL
t :=
∂
∂Pt
IL(Pt|P0,L) =
∂
∂Pt
Z P0
0
L(q)(q − Pt)+
dq +
Z ∞
P0
L(q)(Pt − q)+
dq

= −
Z P0
0
L(q)θ(q − Pt)dq +
Z ∞
P0
L(q)θ(Pt − q)dq
=
Z Pt
P0
L(q)dq,14 J. RISK, S.-N. TUNG, AND T.-H. WANG
where recall that θ(·) denotes the Heaviside function. Importantly, ∆IL
t reflects the instan-
taneous sensitivity of current reserves but does not generate the terminal payoff required to
replicate the IL at maturity in a complete market.
Example 3.4 (Delta of Concentrated Liquidity). Consider a concentrated liquidity position
L(q) = ℓ
2q3/2 1[pa,pb](q) for a constant ℓ > 0 and price boundaries 0 < pa < P0 < pb. The
Delta of the realized Impermanent Loss, ∆IL
t , represents the instantaneous change in current
value:
∆IL
t =
Z Pt
P0
L(q),dq =
Z Pt
P0
ℓ
2q3/2
1[pa,pb](q)dq =



ℓ √
P0
− ℓ √
min{Pt,pb}
if Pt ≥ P0,
ℓ √
max{Pt,pa}
− ℓ √
P0
if Pt ≤ P0,
whereas the risk-neutral Delta, ∆ΠIL
t , which incorporates market expectations and time-to-
maturity, is given by:
∆ΠIL
t =
Z P0
0
∆P
t (q,T)L(q)dq +
Z ∞
P0
∆C
t (q,T)L(q)dq
= ℓ
Z P0
pa
∆P
t (q,T)
dq
2q3/2
+ ℓ
Z pb
P0
∆C
t (q,T)
dq
2q3/2
.
Gamma of IL. The Gamma of the risk-neutral price, ΓΠIL
t , is the second-order sensitivity
to the pool price:
ΓΠIL
t =
∂2
ΠIL
t
∂P2
t
=
Z P0
0
L(q)ΓP
t (q,T)dq +
Z ∞
P0
L(q)ΓC
t (q,T)dq,
where Γi
t(q,T) is the gamma of the option struck at q and expiry T, for i = {C,P}.
For the current realized value, the Gamma simplifies directly to the liquidity profile density
at the current price:
ΓIL
t =
∂
∂Pt
∆IL
t = L(Pt),
Example 3.5 (Gamma of Concentrated Liquidity). Continuing with the concentrated liquid-
ity profile L(q) = ℓ
2q3/2 1[pa,pb](q) from Example 3.4, the Gamma of the realized IL corresponds
directly to the liquidity density at the current price:
ΓIL
t = L(Pt) =
ℓ
2
p
P3
t
1[pa,pb](Pt).
The Gamma of the risk-neutral price ΠIL
t is the expectation-weighted sum of vanilla option
Gammas:
ΓΠIL
t =
Z P0
0
ΓP
t (q,T)L(q)dq +
Z ∞
P0
ΓC
t (q,T)L(q)dq
= ℓ
Z P0
pa
ΓP
t (q,T)
dq
2q3/2
+ ℓ
Z pb
P0
ΓC
t (q,T)
dq
2q3/2
.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 15
Vega of IL In models such as Black–Scholes, the Vega of the IL position is likewise a
weighted sum of vanilla Vegas:
νΠIL
t =
Z P0
0
L(q)νP
t (q,T)dq +
Z ∞
P0
L(q)νC
t (q,T)dq,
where νi
t(q,T) is the vega of the option struck at q and expiry T, for i = {C,P}, enabling
LPs to quantify their exposure to forward-looking volatility shifts.
3.3.2. Implied Volatility for Liquidity Profile. For a given liquidity profile L, we define the
Black–Scholes implied volatility σBS(L,T) as the unique value σ that satisfies the following
equation:
Z P0
0
L(q)PBS(q,T,σ)dq+
Z ∞
P0
L(q)CBS(q,T,σ)dq =
Z P0
0
L(q)P(q,T)dq+
Z ∞
P0
L(q)C(q,T)dq,
(20)
where PBS and CBS denote the risk-neutral prices of European puts and calls under the
Black–Scholes model. The right-hand side represents the market price of the IL contingent
claim, ΠIL
, constructed from discrete market option quotes. Similarly, the Bachelier implied
volatility σB(L,T) is defined by solving:
Z P0
0
L(q)PB(q,T,σ)dq +
Z ∞
P0
L(q)CB(q,T,σ)dq =
Z P0
0
L(q)P(q,T)dq +
Z ∞
P0
L(q)C(q,T)dq,
(21)
where PB and CB are option prices under the Bachelier model. We note that the implied
volatilities defined in (20) and (21) are homogeneous of degree zero in L, as the pricing
equations on both sides are linear with respect to the liquidity profile. This metric allows
for a standardized “price of liquidity” that is consistent with the Black–Scholes paradigm,
bridging the gap between endogenous fee generation and exogenous asset volatility.
Since the left-hand side of both (20) and (21) is strictly increasing with respect to σ, we
establish the following existence and uniqueness result:
Proposition 3.6 (Existence and Uniqueness of Implied Volatility). For a given liquidity
profile L and maturity T, there exists a unique solution σBS(L,T) (resp. σB(L,T)) for
equation (20) (resp. equation (21)).
The central insight is that, for each liquidity profile L and a given maturity T, we can
assign an implied volatility σ(L,T) by equating the theoretical IL price under a specific
model (e.g., Black-Scholes or Bachelier) to the option-implied risk neutral price of IL.
3.3.3. Fine Structure of Implied Volatility. While the global implied volatilities σBS(L,·)
and σB(L,·) characterize the risk profile of the liquidity position in aggregation, they do not
distinguish between the risks associated with different segments of the price spectrum. To
achieve a more granular assessment, we define the fine structure of implied volatility, which
highlights the market-implied risk associated with specific intervals within the liquidity pro-
file. This approach is particularly instructive for platforms like Uniswap v3, where liquidity
is non-uniformly distributed across discrete tick ranges.16 J. RISK, S.-N. TUNG, AND T.-H. WANG
Assume the liquidity profile L is supported on the interval [pm,pM] where 0 < pm < pM <
∞. Let {πk} be a sequence of nested partitions of this interval such that πk = {pm =
p0 < p1 < ··· < pik
= pM}. For each sub-interval j ∈ {1,...,ik}, we define the segmented
liquidity profile Lπk
j as:
Lπk
j (q) = L(q)1{pj−1≤q≤pj},
with its corresponding risk-neutral market price Ππk
j defined by the sum of market put and
call options integrated over the segment:
Ππk
j :=
Z P0
0
P(q,T)Lπk
j (q)dq +
Z ∞
P0
C(q,T)Lπk
j (q)dq.
The fine structure of the Black–Scholes implied volatility for the profile L is then defined as
the collection of values {σπk
j,BS} that solve the pricing equation for each segment j:
Ππk,BS
j (σ) =
Z P0
0
PBS(q,T,σ)Lπk
j (q)dq +
Z ∞
P0
CBS(q,T,σ)Lπk
j (q)dq = Ππk
j .
By the linearity of the integral, the total risk-neutral price ΠIL
is recovered as the sum of
the segmented prices:
ΠIL
=
ik X
j=1
Ππk
j =
ik X
j=1
Ππk,BS
j (σπk
j,BS).
However, there are no simple expressions relating the aggregate implied volatility σBS(L,·)
to its fine structure components, the σπk
j,BS’s. We conclude that the fine structure for the
Bachelier implied volatility can be constructed similarly. We reiterate that examples on the
fine structures of implied volatilities for liquidity profiles of various liquidity pools in the
Uniswap v3 platform can be found in Section 5.
4. Pricing via Last Passage Time
In this section, we move beyond the standard treatment of Impermanent Loss (IL) as a
perpetual Bermudan or American option [BF25, CZ25] to propose a valuation framework
based on the theory of diffusion processes and last passage time. The core rationale for this
approach is the "reset" property of Constant Function Market Makers: if an LP provides
liquidity at a specific price p, the associated IL returns to zero whenever the market price
revisits that entry level.
We argue that it is economically rational for an LP to withdraw liquidity when the pool
price reaches the entry price p for the final time. Under this rule, the LP’s realized IL is
minimized (approaching zero) while the duration of liquidity provision is maximized, allow-
ing for optimal compensation through transaction fee collection. Although a last passage
time is not a stopping time—making its real-time implementation more subtle than tradi-
tional rules—its distribution and associated statistics are well-characterized by the transition
densities of diffusion processes.
For the purpose of clear exposition, we assume the pool price Pt follows a geometric
Brownian motion (GBM):
dPt
Pt
= µdt + σdWtPRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 17
where µ and σ > 0 are constants and Wt is a standard Brownian motion. The LP is
compensated by a transaction fee at a constant rate φ. Consequently, the LP’s discounted
P&L up to a random time τ is defined as:
−e−rτ
IL(Pτ|P0,L) +
Z τ
0
e−rt
φdt = −e−rτ
IL(Pτ|P0,L) +
φ
r
(1 − e−rτ
), (22)
where the first term represents the discounted loss realized upon exiting the position and
the second term represents the accumulated discounted fees.
4.1. Transiency and the Last Passage Time. To analyze the behavior of the last passage
time, we first characterize the long-term asymptotic properties of the pool price process Pt.
The scale function s(p) for the geometric Brownian motion defined in the market model is
given by:
s(p) =
1
1 − α
p1−α
− 1

,
where α = 2µ
σ2 ̸= 1. The transiency of the process depends on the relationship between the
drift µ and the volatility σ:
• Downward Transient: If µ < σ2
2
(i.e., α < 1), then s(0+) = 1
α−1
> −∞ and
s(∞) = ∞. In this regime, the process Pt is transient toward zero, such that
P[limt→∞ Pt = 0 | P0 = p] = 1 for all p ∈ (0,∞).
• Upward Transient: If µ > σ2
2
(i.e., α > 1), then s(0+) = −∞ and s(∞) = 1
α−1
< ∞.
Here, the process Pt is transient toward infinity, with P[limt→∞ Pt = ∞ | P0 = p] = 1
for all p ∈ (0,∞).
For any ϵ ∈ R, we define the last passage time πϵ
at the price level P0eϵ
as:
πϵ
:= sup{t ≥ 0 : Pt = P0eϵ
} = sup{t ≥ 0 : νt + σWt = ϵ},
where ν = µ − σ2
2
. By convention, πϵ
= 0 if the process Pt never visits the price level P0eϵ
.
In the critical case where µ = σ2
2
, the process is recurrent, and the last passage time πϵ
= ∞
almost surely for all ϵ ∈ R.
In the subsequent analysis, we focus on the case µ > σ2
2
(upward transient), noting that
the results for the downward transient case µ < σ2
2
can be obtained by symmetry.
4.2. Optimal Withdrawal Strategy. In the upward transient regime where µ > σ2
2
(and
thus ν = µ− σ2
2
> 0), we identify the log-exit price ϵ that maximizes the liquidity provider’s
returns. The expected discounted P&L, v(ϵ), is defined as the difference between accumu-
lated transaction fees and the realized impermanent loss at the last passage time πϵ
:
v(ϵ) := EQ
h
−e−rπϵ
IL(Pπϵ|P0,L) +
φ
r
1 − e−rπϵ
| P0
i
=
φ
r
−
Z P0eϵ
P0
(P0eϵ
− q)L(q)dq +
φ
r

ϕϵ(r), (23)18 J. RISK, S.-N. TUNG, AND T.-H. WANG
where ϕϵ(r) is the moment generating function of the last passage time πϵ
. Following [EK25,
(36) on p.12] or [PRY10, (2.25) on p.28], the function ϕϵ(r) is given by:
ϕϵ(r) =

   
   
ν
√
ν2 + 2rσ2
e
ϵ
σ2 (ν−
√
ν2+2rσ2
) if ϵ ≥ 0;
1 − e
2ν
σ2 ϵ
+
ν
√
ν2 + 2rσ2
e
ϵ
σ2 (ν+
√
ν2+2rσ2
) if ϵ < 0.
The value v(0) represents the expected P&L if the LP withdraws at the final moment the
price revisits the initial entry level P0.
4.2.1. Analytic Characterization of the Optimal Exit. The determination of the optimal exit
level ϵ∗
depends on the sign of the derivative v′
(ϵ):
v′
(ϵ) =
ν
√
ν2 + 2rσ2 − ν

σ2
√
ν2 + 2rσ2
e
ϵ
σ2 (ν−
√
ν2+2rσ2
) ×
(√
ν2 + 2rσ2 − ν − σ2
√
ν2 + 2rσ2 − ν
P0eϵ
Z P0eϵ
P0
L(q)dq −
Z P0eϵ
P0
qL(q)dq +
φ
r
)
. (24)
Note that v′
(0+
) = limϵ→0+ v′
(ϵ) = − ν
σ2
√
ν2+2rσ2
φ
r
(ν −
√
ν2 + 2rσ2) > 0, indicating that v is
increasing to the right of the origin.
Utilizing the identity ν2
+2rσ2
−(σ2
+ν)2
= 2(r−µ)σ2
, the behavior of v(ϵ) is categorized
by the relationship between the drift µ and the discount rate r:
(1) Asymptotic Maximization (µ < r): If the bracketed term in (24) remains positive
for all ϵ > 0, v is monotonically increasing. This typically occurs when µ < r,
as the first term in the brackets is positive and increasing. In this regime, the LP
optimally maintains the position indefinitely, with the expected P&L approaching
the supremum φ
r
as ϵ → ∞.
(2) Unique Interior Maximizer (µ ≥ r): If a unique ϵ∗
> 0 exists such that v′
(ϵ∗
) = 0,
then v is maximized at this point. This uniqueness is guaranteed for µ ≥ r because
the first term in the brackets decreases toward −∞ as ϵ → ∞.
When µ = r, the identity ν + σ2
−
√
ν2 + 2rσ2 = 0 holds. Consequently, the first-order
condition v′
(ϵ) = 0 simplifies to
RP0eϵ
P0
qL(q)dq = φ
r
. This yields the explicit solution:
P0eϵ∗
= y−1
φ
r
− y(P0)

,
where y(·) is the reserve function defined in (4). These results are summarized in Theorem
4.1.
Theorem 4.1. Let the pool price Pt follow the geometric Brownian motion dPt
Pt
= µdt+σdWt,
with σ > 0 and µ > σ2
2
. The expected discounted P&L v(ϵ), stopped at the last passage time
πϵ
of the price level P0eϵ
, is given by:
v(ϵ) = EQ
h
−e−rπϵ
IL(Pπϵ|P0,L) +
φ
r
(1 − e−rπϵ
) | P0
i
.
The optimal exit level ϵ∗
is characterized as follows:PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 19
(1) If µ ≥ r, there exists a unique maximizer ϵ∗
> 0 satisfying the transcendental equa-
tion:
√
ν2 + 2rσ2 − ν − σ2
√
ν2 + 2rσ2 − ν
P0eϵ
Z P0eϵ
P0
L(q)dq −
Z P0eϵ
P0
qL(q)dq +
φ
r
= 0, (25)
where ν = µ − σ2
2
.
(2) In the specific case µ = r, the optimal exit price admits the explicit solution:
P0eϵ∗
= y−1
φ
r
− y(P0)

,
where y is the reserve function defined in (4).
(3) If µ < r, v(ϵ) may be monotonically increasing for all ϵ ∈ R, in which case (25) has
no solution and v attains its supremum φ
r
as ϵ → ∞.
Example 4.2. Consider an initial pool price P0 = 1 and a liquidity profile L(q) = e− 1
10
|q−1|
.
With volatility σ = 10% and fee rate φ = 2%, we evaluate the optimal exit strategy under
varying drift µ and discount rate r:
• Case 1 (µ = 2%,r = 1%): Since µ > r, Equation (25) yields a unique finite maximizer
ϵ∗
≈ 0.65, as seen in the left panel of Figure 1.
• Case 2 (µ = 2%,r = 3%): Despite µ < r, the specific interplay of parameters allows
for a unique interior maximizer ϵ∗
≈ 0.45, illustrated in the middle panel of Figure 1.
• Case 3 (µ = 1%,r = 4%): Here, the drift is significantly lower than the discount
rate. The equation has no solution, and v(ϵ) increases toward its supremum φ
r
= 0.5
as ϵ → ∞, shown in the right panel of Figure 1.
Figure 1. The expected P&L v(ϵ) defined in (25) as a function of the log-exit price ϵ. Left
(Case 1): A unique maximizer ϵ∗
> 0 exists because µ > r. Middle (Case 2): A unique interior
maximizer exists despite µ < r, due to the interplay of fee income and last-passage statistics. Right
(Case 3): v(ϵ) increases monotonically toward the supremum φ
r
= 0.5 as ϵ → ∞, indicating an
optimal strategy of never withdrawing.
5. Data and Numerical Implementation
In this section, we present empirical results on the fine structure of implied volatility
for Uniswap V3 liquidity profiles, utilizing the framework developed in Section 3. The
central advancement of this framework is the impermanent loss (IL) replication formula
(10), which characterizes IL as a weighted strip of vanilla options. For a liquidity profile
L(q) = ℓ(q)/(2q3/2
), we can assign an implied volatility to any liquidity provision by equating20 J. RISK, S.-N. TUNG, AND T.-H. WANG
the option-implied IL price to its corresponding model price under Black-Scholes or Bachelier
dynamics.
A primary advantage of this canonical parametrization is that it enables a direct economic
comparison across disparate liquidity pools. Specifically, pools with varying fee tiers or liq-
uidity concentrations can be evaluated on a unified basis of implied volatility. In the following
analysis, we compare Black-Scholes and Bachelier implied volatilities across multiple expiries
and fee tiers using market data.
5.1. Data Sources and Collection. This subsection details the empirical data acquisition
process required to synthesize the market-side IL integral and reconstruct the corresponding
liquidity profiles.
5.1.1. Option Data. European option quotes for ETH are obtained from the Deribit exchange
through its public API. For each hourly snapshot, the following data points are collected:
• Bid-ask mid prices: Prices for both call and put options are gathered across the full
spectrum of available strikes.
• Quarterly expiries: The dataset includes four specific expiries: December 2025, March
2026, June 2026, and September 2026.
• Forward Price and Maturity: We collect the underlying reference forward price F
(Deribit underlying_price) and the time to maturity T in years for each respective
expiry.
Let P0 denote the Uniswap pool spot price at the snapshot, and let F denote the Deribit
maturity-T reference forward used for the option surface. In our pipeline, P0 is used only to
implement the IL replication split in (18) (i.e., the boundary between the put and call legs),
while F is used for put–call parity, model option prices, and the log-moneyness coordinate
x = log(K/F). Consequently, the IL split point K = P0 corresponds to x = log(P0/F) on
the plots.
5.1.2. Liquidity Data. On-chain liquidity profiles are extracted directly from the Uniswap
V3 ETH/USDC pool contracts. For each snapshot, the following parameters are queried:
• Tick Data: All initialized ticks and their corresponding signed liquidity deltas ∆ℓi.
• Pool State: The pool’s current tick, reported in-range liquidity ℓcurr, and the pool
price P0.
The intrinsic liquidity ℓ(q)—representing active in-range liquidity at price q—is reconstructed
by aggregating the signed tick deltas. Here, ∆ℓi corresponds to the pool’s liquidityNet,
representing the change in active liquidity as the price crosses tick ti upward [Uni23]. To fix
the additive constant of the cumulative sum, the profile is anchored to the reported in-range
liquidity ℓcurr at the current tick t0, setting ℓ(P−
0 ) = ℓcurr.
The analysis focuses on two ETH/USDC pools with fee tiers of 5 basis points (5bp) and 30
basis points (30bp). These pools allow for a contrast between tight liquidity concentration
(5bp) and broader spatial distributions (30bp). The main-text empirical results use the
November 17, 2025 snapshot, while additional weekly snapshots are reported in Appendix
D.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 21
5.2. Data Cleaning and Processing.
5.2.1. Option Data Cleaning. To ensure the integrity of the market-side IL integrals, raw
option quotes from Deribit are subjected to standard no-arbitrage filters as recommended
by CBOE [Cbo19]. The following constraints are applied:
• Positive Prices: All quotes with non-positive mid prices are removed.
• Monotonicity: Call prices must be non-increasing with respect to the strike, while
put prices must be non-decreasing.
• Convexity: To prevent butterfly arbitrage, the second difference in prices relative to
the strike must be non-negative (i.e., C(Ki−1) − 2C(Ki) + C(Ki+1) ≥ 0).
In our analyzed snapshots, OTM quotes passed these filters after positive-price filtering.
ITM coverage gaps, where arbitrage violations are more common, are addressed implicitly
via put–call parity.
5.2.2. Interpolation and Synthetic Pricing. The integration variable is identified with the
strike K (measured in USD per ETH), which aligns with the price axis q used in the liquidity
profile. Between observed strikes, option prices are linearly interpolated. For strikes K ∈
[Ki,Ki+1] with observed prices Ci and Ci+1, the call price is given by:
C(K) = Ci +
Ci+1 − Ci
Ki+1 − Ki
(K − Ki).
This piecewise linear representation, when combined with the piecewise constant liquid-
ity profile derived from the Uniswap tick structure, allows for the use of closed-form an-
tiderivatives for the IL integrals. Specifically, on any interval [a,b] where ℓ is constant, thus
L(q) = ℓ/(2q3/2
), and the option price O(q) = a0 + a1q is linear:
Z b
a
L(q)O(q),dq =
ℓ
2

−
2a0
√
q
+ 2a1
√
q
b
a
.
This analytic approach completely sidesteps numerical quadrature noise. The piecewise-
linear interpolant is the pointwise maximal arbitrage-free fill-in between observed strikes
[CRW20]. Since L(q) is positive, this upper bound on the market price translates into a
conservative benchmark for the subsequent implied-volatility inversion.
Higher-order spline interpolation is avoided for two reasons [LF20]:
• Static Arbitrage: Splines are not necessarily shape-preserving and can violate the
convexity constraints required to exclude butterfly arbitrage [Wys17].
• Numerical Ringing: Cubic splines may overshoot between knots, and these artifacts
can be amplified into spurious high-frequency oscillations in the implied volatility
curve during the nonlinear inversion process.
Synthetic option pricing. When strike coverage on one side of the market is sparse, missing
prices are synthesized from the better-covered side using put–call parity. With r = 0, this is
C(K)−P(K) = F −K (equivalently, P = C −F +K and C = P +F −K). This approach
guarantees continuous coverage across the integration domain while preserving no-arbitrage
conditions, as put–call parity is an exact identity.22 J. RISK, S.-N. TUNG, AND T.-H. WANG
The threshold for switching to synthetic pricing is a local strike gap of 500 USD or more.
This data-coverage heuristic reflects the transition from dense near-ATM strike spacing on
Deribit (typically 25–50 USD) to sparse deep-OTM spacing (500 USD or more). We found
this to be a stable cutoff across expiries in our snapshot. When gaps exceed this threshold,
linear interpolation becomes unreliable, and we instead rely on the synthetic prices derived
from the more liquid side of the market.
Market Proxy vs. Model Prices. Our empirical pipeline utilizes two distinct objects to facil-
itate the implied-volatility inversion:
• Market Proxy (b Omkt
(K)): This is constructed from discrete market option quotes
via no-arbitrage cleaning and piecewise-linear interpolation. It is used exclusively to
evaluate the market-side IL integrals. We maintain this evaluation as analytically as
possible by using closed-form antiderivatives to avoid injecting numerical quadrature
noise into the subsequent inversion process.
• Model Option Prices (OBS
(K;σ) and OB
(K;σ)): These are the theoretical prices used
to define Black–Scholes and Bachelier implied volatilities. Inversion is performed by
matching model-side and market-side IL integrals on each integration bin at the
chosen resolution.
By partitioning the integration domain at all Uniswap V3 tick boundaries, strike knots,
and the split point P0, we ensure that the intrinsic liquidity ℓ remains constant and the
market proxy remains affine on each segment. This structure allows for an exact closed-
form evaluation of the market-side integral, providing a robust and noise-free benchmark for
determining the fine structure of implied volatility.
5.2.3. Integration Partitioning. To maintain analytic precision, the integration domain is
partitioned at every point where the integrand’s functional form changes. These boundaries
include all Uniswap V3 tick limits where the intrinsic liquidity ℓ shifts, all strike knots
where the market proxy b Omkt
(K) undergoes a change in slope, and the spot price P0, which
serves as the put–call split point. Because liquidity ℓ remains constant and the market
proxy remains affine on each resulting segment, the market-side integral admits an exact
closed-form evaluation.
5.2.4. Numerical Integration Details. The IL integrals, characterized by the form
Z b
a
O(K)
K3/2
dK,
are evaluated using strategies tailored to the specific model dynamics. For market prices and
the Black–Scholes model (r = 0), we utilize piecewise linear interpolation and closed-form
antiderivatives for
Z b
a
CBS(K;σ)
K3/2
dK
to avoid injecting numerical quadrature noise into the evaluation. In the Bachelier model,
where the auxiliary term involving Φ(d(K))/
√
K lacks an elementary antiderivative, we em-
ploy a hybrid approach: exact boundary terms are combined with 32-point Gauss–LegendrePRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 23
quadrature on the smooth remainder. This semi-closed-form method ensures machine-
precision accuracy across each segment; see Appendix B for the derivation and numerical
validation.
5.2.5. Interest Rate Convention. In accordance with Deribit exchange conventions, the risk-
free rate is set to r = 0 throughout the implementation. This is consistent with the theoretical
assumption of equal interest rates for both tokens in the pool in Section 3. While the
empirical forward price F is used for model pricing and put–call parity identities, the pool
price P0 is used exclusively as the boundary to split the integral between put and call terms
in (18).
5.3. Implied Volatility Computation (Multi-Resolution). Let x := log(K/F) denote
log-moneyness (identifying the integration variable q with strike K). For a given resolution
n, we define a partition x0 < x1 < ··· < xn and corresponding bins Bn,k := {K : x(K) ∈
[xk−1,xk)}, k = 1,...,n. In practice, the partition is taken as a coarsening of the finest
initialized-tick partition, obtained by aggregating adjacent tick buckets into n bins. We then
restrict the liquidity profile L to each bin via
Ln,k(K) := L(K)1{K∈Bn,k}.
For each bin we compute Black–Scholes and Bachelier implied volatilities σBS
n,k and σB
n,k by
matching model and market IL prices:
Z
Ln,k(K) b Omkt
(K)dK =
Z
Ln,k(K)OBS
(K;σBS
n,k)dK,
and the same for Bachelier. By Proposition 3.6, each equation admits a unique solution
because the combined put+call map is strictly increasing in σ. We solve by bisection and
do not invert put and call components separately.
We report multiple resolutions n ∈ {1,3,6,12,N}, where N is the finest initialized-tick
partition. The Black–Scholes IV is reported as an annualized volatility level, and the Bache-
lier IV is normalized as
σ̄B := σB/P0,
matching the scale used in the multi-resolution overlay figures.
5.4. Empirical Results: Multi-Resolution Implied Volatility. The main-text empiri-
cal results use the November 17, 2025 snapshot for both 5bp and 30bp ETH/USDC pools.
Additional weekly snapshots are reported in the Appendix D as robustness checks.
5.4.1. Liquidity Concentration and IL Contribution. Figures 2 and 3 report IL contribu-
tion for a representative expiry (March 2026) in each fee tier. In this snapshot, the 5bp
pool concentrates weight more tightly near P0, while the 30bp pool distributes weight more
broadly.24 J. RISK, S.-N. TUNG, AND T.-H. WANG
Figure 2. IL contribution for the 30bp ETH/USDC pool (Nov 17, 2025 snapshot; representative
expiry). The left column reports IL contribution; the remaining columns show the corresponding
single-resolution IV outputs from the shared plotting routine.
Figure 3. IL contribution for the 5bp ETH/USDC pool (Nov 17, 2025 snapshot; representative
expiry). The left column reports IL contribution; the remaining columns show the corresponding
single-resolution IV outputs from the shared plotting routine.
Having established how each fee tier loads the IL strip, we now turn to the implied-volatility
surfaces obtained by equating IL prices across models.
Figures 4 and 5 overlay implied-volatility curves across resolutions n ∈ {1,3,6,12,N} for
four expiries (columns). The top row shows Black–Scholes IV and the bottom row shows
normalized Bachelier IV σ̄B = σB/P0.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 25
Figure 4. Multi-resolution implied-volatility overlay for the 30bp ETH/USDC pool (Nov 17, 2025
snapshot). Curves correspond to n ∈ {1,3,6,12,N}, with N the finest initialized-tick partition.
Columns are quarterly expiries; rows are Black–Scholes IV (top) and normalized Bachelier IV
σ̄B = σB/P0 (bottom).
Figure 5. Multi-resolution implied-volatility overlay for the 5bp ETH/USDC pool (Nov 17, 2025
snapshot). Fine-scale oscillations are most visible at n = N, while coarser aggregations (e.g., n = 6
and n = 12) recover a stable macro smile/skew structure.
The overlays support four robust empirical findings:
• Scale separation: the macro smile and skew are already visible at coarse resolutions
and remain qualitatively stable as n increases.
• Microstructure concentration: high-frequency wiggles are concentrated at the finest
resolution, consistent with small-bin conditioning effects rather than large economic
regime shifts.
• Term structure: near-dated expiries show stronger curvature, while longer-dated ex-
piries are flatter in both Black–Scholes and Bachelier representations.
• Fee-tier comparison: the 5bp pool exhibits finer native structure at n = N, but at
matched coarse resolution (e.g., n = 12) the 5bp and 30bp smiles are closely aligned.
This coincides with tighter IL concentration in Figures 2–3, which can make small-bin
inversions more sensitive.26 J. RISK, S.-N. TUNG, AND T.-H. WANG
5.5. Summary Statistics. Under the multi-resolution framing, extreme min/max values at
the native finest partition are sensitive to microstructure and are not the preferred primary
summary for economic interpretation. We therefore emphasize the cross-resolution overlays
in Figures 4 and 5; additional weekly snapshots are provided in Appendix D.
5.6. Key Takeaways. The empirical analysis of multi-resolution implied volatility yields
several significant conclusions regarding the pricing of liquidity provision in Uniswap V3:
(1) Persistence of the Volatility Smile: The IL-implied volatility exhibits the charac-
teristic "smile" shape prevalent in traditional options markets, with elevated IV for
out-of-the-money strikes on both sides. This confirms that the option-based replica-
tion formula (10) effectively inherits the market’s complex view on price dynamics
and tail risk.
(2) Model Convergence near ATM: Near the money, Black–Scholes IV and normalized
Bachelier IV are closely aligned; divergence is primarily a wing effect.
(3) Term Structure Dynamics: The overlays reveal systematic maturity smoothing: near-
term expiries exhibit stronger smile curvature, while longer-term expiries are flatter.
(4) Decoupling of Fee Tiers and Economic Risk: While the 5bp and 30bp pools have
very different native bucket granularity, their coarse-resolution smiles remain close.
This indicates fee tiers primarily reshape liquidity placement rather than the market-
implied level of economic risk.
(5) Unified Cross-Pool Comparison: The canonical parametrization using (P,ℓ) enables
direct comparison across fee tiers and resolutions. The persistence of similar coarse-
scale IV levels across pools suggests LP risk is largely a market-level property.
(6) Level: The inferred Black–Scholes IV levels are consistent with the Deribit option
surface used as input in our snapshots.
6. Conclusion and Discussion
We have demonstrated in this article that the canonical parametrization of the bond-
ing curve in a CFMM, as established in (4), provides a robust and convenient framework
for addressing several key problems in decentralized finance. Specifically, this formulation
enables:
• Risk-Neutral Pricing and Hedging: The derivation of fair values and sensitivities
(Delta, Gamma, Vega) for both pool value and impermanent loss.
• Implied Volatility Fine Structure: The assignment of model-implied volatilities to
discrete liquidity segments, allowing for a granular assessment of risk across the price
spectrum.
• Loss-Versus-Rebalancing (LVR): A generalized understanding of the non-hedgeable
costs of liquidity provision as a time-integral of quadratic variation weighted by the
liquidity profile.
• Path-Dependent Analysis: The pricing of impermanent loss using the last-passage
time theory, which accounts for the "reset" property of CFMM positions.
Numerical examples utilizing market data from Uniswap V3 ETH/USDC pools and Deribit
option markets validate these methodologies. Our empirical results confirm a volatilityPRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 27
smile consistent with crypto-asset dynamics and demonstrate that while fee tiers alter the
structural concentration of liquidity, the underlying economic risk remains consistent across
the market.
Throughout this work, except for the numerical analysis, liquidity profiles have been
treated as static. In practice, while the intrinsic liquidity profile ℓ is observable on-chain, its
evolution is dynamic, driven by block-level validation and LP activity. This observation mo-
tivates the shift toward statistical and dynamical modeling of liquidity surfaces. Preliminary
empirical analyses of the temporal evolution of these profiles can be found in [RTW25].
Furthermore, the parametrization in (4) provides a foundation for developing market mod-
els that are fully consistent with the CFMM mechanism. By accounting for the dual nature
of pool updates—where trades move the state along the bonding curve while LP additions or
withdrawals shift the curve itself—the evolution of the pool state (xt,yt,Pt) can be modeled
as a dynamical system:
dxt =
Z ∞
Pt
dLt(q)dq + dΛa
t − dΛb
t,
dyt =
Z Pt
0
qdLt(q)dq − Pt dΛa
t − dΛb
t

,
dPt = −
1
Lt(Pt)
dΛa
t − dΛb
t

,
dLt(q) = {ALt(q) + h(t,q)}dt,
where Λi
t represents cumulative trade volumes and the operator A describes the diffusive
properties of liquidity over time. We refer the reader to [LRTW26] for a stochastic treat-
ment of the dynamic for L. These equations capture the complex interplay between order
flow, liquidity provision, and price formation. The comprehensive analysis of this system,
particularly under stochastic noise, remains an area for future research.
Acknowledgements
S. N. T. is grateful for the financial support from the National Science and Technology
Council of Taiwan under grant 114-2115-M-007-012-MY3, "Mathematical Foundation of Au-
tomated Market Makers."
The authors used Google Gemini 3 (Flash version, March 2, 2026) to polish the manu-
script’s grammar and style. All original theorems, proofs, and analyses were developed solely
by the authors, who assume full responsibility for the integrity of the work.
Appendix A. Note on Interest Rates
This section details the interest rate conventions and forward price mechanics utilized in
the pricing models, specifically relating them to standard Black-Scholes dynamics. We define
the relevant rates as follows:
• r: The risk-free rate of the numeraire (e.g., USD).
• δ: The yield or staking reward of the underlying asset (e.g., ETH). This is functionally
equivalent to a foreign short rate in foreign exchange (FX) market models.28 J. RISK, S.-N. TUNG, AND T.-H. WANG
The risk-neutral drift for the underlying asset under the numeraire measure is determined
by the differential r − δ. Consequently, the forward price F0,T at time T is defined by:
F0,T = P0e(r−δ)T
.
Under these definitions, the standard put-call parity identity holds, mirroring the convention
used in FX markets:
C − P = e−rT
(F0,T − K) = P0e−δT
− Ke−rT
.
In the numerical implementation discussed in Section 5, the risk-free rate is set to r = 0
throughout, consistent with the assumption of equal interest rates for both tokens in the
pool. Under this r = δ = 0 assumption, the theoretical forward price F equals the spot
price S0. Empirically, however, the Deribit forward price (underlying_price) may differ
slightly from the Uniswap pool price P0; we utilize the forward F for all pricing and parity
calculations while maintaining P0 as the put/call split point.
Appendix B. Numerical Integration for Bachelier IL
Both Black-Scholes and Bachelier models require the evaluation of integrals in the form:
Z b
a
O(K)
K3/2
dK,
where O(K) represents an option price. Applying integration by parts with f = O(K) and
g′
= K−3/2
yields:
Z b
a
O(K)
K3/2
dK =

−
2O(K)
√
K
b
a
+ 2
Z b
a
O′
(K)
√
K
dK,
where the derivative O′
(K) is −Φ(d) for call options and 1 − Φ(d) for put options. Conse-
quently, the computational problem reduces to evaluating the auxiliary integral
R Φ(d(K))
√
K
dK.
B.1. Model-Specific Analytic Properties. The feasibility of a closed-form solution de-
pends on the underlying price dynamics:
• Black-Scholes (Closed Form): In the lognormal model,
d2(K) =
log(P0/K) − 1
2
σ2
T
σ
√
T
is proportional to logK. By substituting u =
√
K,
d2(u2
) =
logP0 − 2logu
σ
√
T
−
σ
√
T
2
= A − B logu
becomes linear in logu. The resulting integral takes the form
R
Φ(linear)×exp(linear),
which admits an elementary antiderivative involving only Φ and exp.
• Bachelier (Non-Elementary): In the normal model,
d(K) =
F − K
σ
√
TPRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 29
is proportional to K. The substitution u =
√
K results in
d(u2
) =
F − u2
σ
√
T
= A − Bu2
,
which is quadratic in u. The auxiliary integral
R
Φ(quadratic)du has no elementary
antiderivative and typically requires Owen’s T-functions or complex error functions
for exact evaluation.
B.2. Semi-Closed Form Solution. To maintain high precision without the complexity of
non-elementary functions, we compute the Bachelier integral using a semi-closed form:
Z b
a
CB(K)
K3/2
dK =

−
2CB(K)
√
K
b
a
| {z }
exact
−2
Z b
a
Φ(d)
√
K
dK
| {z }
Gauss-Legendre
The boundary terms are evaluated exactly. For the remaining integral, we employ n-point
Gauss-Legendre quadrature on the interval [a,b]:
Z b
a
f(K)dK ≈
b − a
2
n X
i=1
wi f

b − a
2
xi +
a + b
2

,
where xi and wi denote the Legendre nodes and weights on [−1,1].
B.3. Error Control and Validation. The integrand Φ(d(K))/
√
K is C∞
on any interval
[a,b] ⊂ (0,∞), ensuring exponential convergence for Gauss-Legendre quadrature. Empirical
testing demonstrates the following precision levels:
n (Points) Relative Error
8 6 × 10−7
16 2 × 10−15
32 < 10−15
Table 1. Convergence of relative error with increasing number of quadrature points.
In our implementation, we utilize n = 32 points to consistently achieve machine precision
with negligible computational overhead.
Appendix C. Discretization of Integral Remainder
This section provides a formal discretization of the remainder term I(P0,T), which is
essential for practitioners implementing IL pricing within the piecewise-constant liquidity
environment of Uniswap V3.
Proposition C.1. Assume a constant risk-free rate r and dividend rate δ. The total imper-
manent loss value is given by:
ΠIL(P0) =
Z ∞
0
L(q)C(q,T)dq + I(P0,T),30 J. RISK, S.-N. TUNG, AND T.-H. WANG
where, defining α =
√
1.0001 and ℓi as the liquidity present in the interval [xi,xi+1) with
xi = (1.0001)i
= α2i
, the remainder I(P0,T) evaluates to:
I(P0,T) =(α − 1)
k−1 X
i=imin
ℓi
h
e−rT
αi
− P0e−δT
α−(i+1)
i
+ ℓk
h
e−rT
p
P0 − αk

+ P0e−δT
 1
√
P0
− α−k
i
. (26)
Here, imin is the first index with non-zero liquidity, and k is the index such that xk ≤ P0 <
xk+1.
Corollary C.2. If a unit of liquidity ℓ(q) = 1 is deposited in the interval [a,b) where a =
(1.0001)i
and b = (1.0001)j
for some integers i,j, and a ≤ P0 ≤ b, then the IL value
simplifies to:
ΠIL(P0) =
Z b
a
L(q)C(q,T)dq + e−rT
p
P0 −
√
a

+ P0e−δt

1
√
P0
−
1
√
a

.
C.1. C.1. Proof of Proposition. Using put-call parity, the impermanent loss integral is
split as follows:
ΠIL(P0) =
Z ∞
0
L(q)C(q,T)dq +
Z P0
0
L(q) qe−rT
− P0e−δT

dq
| {z }
=:I(P0)
.
Since the intrinsic liquidity ℓ(q) is piecewise constant on the intervals [xi,xi+1) defined by
the Uniswap V3 tick structure, I(P0) can be expressed in closed form. For any sub-interval
(a,b) ⊂ [xi,xi+1), the integral evaluates as:
I[a,b](P0,T) =
Z b
a
ℓi
2q3/2
qe−rT
− P0e−δT

,dq
= ℓi
h
e−rT
√
b −
√
a

+ P0e−δT
 1
√
b
−
1
√
a
i
.
By discretizing I(P0,T) as a sum over the active tick range:
I(P0,T) =
k−1 X
i=imin
I[xi,xi+1](P0,T) + I[xk,P0](P0,T)
=
k−1 X
i=imin
ℓi
h
e−rT √
xi+1 −
√
xi

+ P0e−δT
 1
√
xi+1
−
1
√
xi
i
+ ℓk
h
e−rT
p
P0 −
√
xk

+ P0e−δT
 1
√
P0
−
1
√
xk
i
.
Substituting α =
√
1.0001 such that
√
xi = αi
and 1/
√
xi = α−i
, we arrive at the final
summation form in (26).PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 31
Appendix D. Additional Snapshot Overlays
Main-text figures use the November 17, 2025 snapshot. For completeness, this appendix
reports the same multi-resolution overlays for additional weekly snapshots.
30bp Pool.
Figure 6. Multi-resolution implied-volatility overlay for the 30bp pool (Oct 27, 2025 snapshot).
Figure 7. Multi-resolution implied-volatility overlay for the 30bp pool (Nov 3, 2025 snapshot).32 J. RISK, S.-N. TUNG, AND T.-H. WANG
Figure 8. Multi-resolution implied-volatility overlay for the 30bp pool (Nov 10, 2025 snapshot).
Figure 9. Multi-resolution implied-volatility overlay for the 30bp pool (Nov 24, 2025 snapshot).
Figure 10. Multi-resolution implied-volatility overlay for the 30bp pool (Dec 1, 2025 snapshot).
5bp Pool.
Figure 11. Multi-resolution implied-volatility overlay for the 5bp pool (Oct 27, 2025 snapshot).PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 33
Figure 12. Multi-resolution implied-volatility overlay for the 5bp pool (Nov 3, 2025 snapshot).
Figure 13. Multi-resolution implied-volatility overlay for the 5bp pool (Nov 10, 2025 snapshot).
Figure 14. Multi-resolution implied-volatility overlay for the 5bp pool (Nov 24, 2025 snapshot).34 J. RISK, S.-N. TUNG, AND T.-H. WANG
Figure 15. Multi-resolution implied-volatility overlay for the 5bp pool (Dec 1, 2025 snapshot).
References
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market makers.
In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies, AFT ’20,
pages 80–91, New York, NY, USA, 2020. ACM.
[ACD+
24] Guillermo Angeris, Tarun Chitra, Theo Diamandis, Kshitij Kulkarni, and Alex Evans. The
geometry of constant function market makers. In Proceedings of the 25th ACM Conference on
Economics and Computation, EC ’24, page 732, New York, NY, USA, 2024. Association for
Computing Machinery.
[AEC23] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. Digital Finance,
5(2):367–387, 6 2023.
[ASZ+
23] Hayden Adams, Moody Salem, Noah Zinsmeister, Dan Robinson, River Keefer, et al. Uniswap
v4 core: Hooks and custom liquidity. Whitepaper, Uniswap Labs, 2023. Accessed: 2026-02-13.
[AZR20] Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core. Whitepaper, Uniswap,
2020. Accessed: 2025-10-18.
[AZS+
21] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap v3
core. Whitepaper, Uniswap, 2021.
[BF24] Maxim Bichuch and Zachary Feinstein. DeFi arbitrage in hedged liquidity tokens. arXiv preprint
arXiv:2409.11339, 9 2024.
[BF25] Maxim Bichuch and Zachary Feinstein. The price of liquidity: Implied volatility of automated
market maker fees. arXiv preprint arXiv:2509.23222, 9 2025.
[Cbo19] Cboe Global Indices. Cboe european-style options implied volatility calculation methodology.
Technical report, Cboe Global Indices, LLC, 10 2019.
[CJ21] Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges.
arXiv preprint arXiv:2103.08842, 2021.
[Cla20] Joseph Clark. The replicating portfolio of a constant product market. SSRN Electronic Journal,
3 2020.
[Cla21] Joseph Clark. The replicating portfolio of a constant product market with bounded liquidity.
SSRN Electronic Journal, 8 2021.
[CM01] Peter Carr and Dilip Madan. Towards a theory of volatility trading. In Elyès Jouini, Jakša
Cvitanic, and Marek Musiela, editors, Handbooks in Mathematical Finance: Option Pricing,
Interest Rates and Risk Management, pages 458–476. Cambridge University Press, Cambridge,
2001.
[CRW20] Samuel N. Cohen, Christoph Reisinger, and Sheng Wang. Detecting and repairing arbitrage in
traded option prices. Applied Mathematical Finance, 27(5):345–373, 2020.PRICING AND HEDGING FOR LIQUIDITY PROVISION IN CFMM 35
[CZ25] Agostino Capponi and Brian Zhu. Optimal exiting for liquidity provision in constant function
market makers. SSRN Electronic Journal, 2 2025.
[EK25] Masahiko Egami and Rusudan Kevkhishvili. On decomposition of the last passage time of diffu-
sions. Stochastic Processes and their Applications, 182:104563, 2025.
[FMW23] Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Weighted variance swaps hedge against
impermanent loss. Quantitative Finance, 23(6):901–911, 2023.
[GM23] Emmanuel Gobet and Anastasia Melachrinos. Decentralized finance & blockchain technology. In
SIAM Financial Mathematics and Engineering 2023, Philadelphia, PA, 6 2023.
[HRS+
21] Campbell R. Harvey, Ashwin Ramachandran, Joey Santoro, Fred Ehrsam, and Vitalik Buterin.
DeFi and the Future of Finance. Wiley, 2021.
[LF20] Fabien Le Floc’h. An arbitrage-free interpolation of class C2
for option prices. arXiv preprint
arXiv:2004.08650, 4 2020.
[LK22] Guillaume Lambert and Jesper Kristensen. Panoptic: The perpetual, oracle-free options proto-
col. arXiv preprint arXiv:2204.14232, 4 2022.
[LLS25] Alexander Lipton, Vladimir Lucic, and Artur Sepp. Unified approach for hedging impermanent
loss of liquidity provision. Digital Finance, 7:429–477, 2025.
[LRTW26] Cheuk Yin Lee, Jimmy Risk, Shen-Ning Tung, and Tai-Ho Wang. Dynamics of liquidity profile
in concentrated liquidity provision: An SPIDE approach. Working paper in progress, 1 2026.
[MM19] Fernando Martinelli and Nikolai Mushegian. Balancer: A non-custodial portfolio manager, liq-
uidity provider, and price sensor. Whitepaper, Balancer Labs, 2019. Accessed: 2025-10-18.
[MMRZ22] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated
market making and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046, 8 2022.
[MW24] Basile Maire and Marcus Wunsch. Market neutral liquidity provision. Ledger, 9, 11 2024.
[PRY10] Christophe Profeta, Bernard Roynette, and Marc Yor. Option Prices as Probabilities: A New
Look at Generalized Black–Scholes Formulae. Springer Finance. Springer-Verlag, Berlin, Heidel-
berg, 2010.
[RTW25] Jimmy Risk, Shen-Ning Tung, and Tai-Ho Wang. Dynamics of liquidity surfaces in Uniswap v3.
arXiv preprint arXiv:2509.05013, 9 2025.
[SLG+
25] Srisht Fateh Singh, Reina Ke Xin Li, Samuel Gaskin, Yuntao Wu, Jeffrey Klinck, Panagiotis
Michalopoulos, Zissis Poulos, and Andreas Veneris. Modeling loss-versus-rebalancing in auto-
mated market makers via continuous-installment options. In 7th Conference on Advances in
Financial Technologies, volume 354 of LIPIcs, pages 6:1–6:23. Schloss Dagstuhl, 2025.
[TW24] Shen-Ning Tung and Tai-Ho Wang. A mathematical framework for modelling CLMM dynamics
in continuous time. arXiv preprint arXiv:2412.18580, 12 2024.
[Uni23] Uniswap Labs. A primer on Uniswap v3 math: As easy as 1, 2, v3. Uniswap Blog, 2023. Official
explanation of tick mechanics and liquidityNet.
[Wys17] Uwe Wystup. Arbitrage in the perfect volatility surface. Technical report, MathFinance AG, 10
2017.
Jimmy Risk
Department of Mathematics and Statistics,
Cal Poly Pomona
3801 W Temple Ave, Pomona CA 91768
Email address: jrisk@cpp.edu
Shen-Ning Tung
Department of Mathematics,
National Tsing Hua University
Hsinchu, Taiwan
Email address: tung@math.nthu.edu.tw36 J. RISK, S.-N. TUNG, AND T.-H. WANG
Tai-Ho Wang
Department of Mathematics
Baruch College, The City University of New York
## 1 Bernard Baruch Way, New York, NY10010
Email address: tai-ho.wang@baruch.cuny.edu