---
sha256: 1f21b17a66e870dff68de62f4c9ba94dc71548b5baacdc5b4ea45b243b600879
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 63389
---
A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM
DYNAMICS IN CONTINUOUS TIME
SHEN-NING TUNG AND TAI-HO WANG
Abstract. This paper develops a rigorous mathematical framework for analyzing Con-
centrated Liquidity Market Makers (CLMMs) in Decentralized Finance (DeFi) within a
continuous-time setting. We model the evolution of liquidity profiles as measure-valued pro-
cesses and characterize their dynamics under continuous trading. Our analysis encompasses
two critical aspects of CLMMs: the mechanics of concentrated liquidity provision and the
strategic behavior of arbitrageurs. We examine three distinct arbitrage models—myopic,
finite-horizon, and infinite-horizon with discounted and ergodic controls—and derive closed-
form solutions for optimal arbitrage strategies under each scenario. Importantly, we demon-
strate that the presence of trading fees fundamentally constrains the admissible price pro-
cesses, as the inclusion of fees precludes the existence of diffusion terms in the price process
to avoid infinite fee generation. This finding has significant implications for CLMM design
and market efficiency.
1. Introduction
Decentralized Finance (DeFi) has revolutionized the financial landscape by enabling trust-
less, peer-to-peer transactions without intermediaries [HRS+
21, GM23]. At the heart of this
revolution are Automated Market Makers (AMMs) [CJ21, Loe22], which facilitate efficient
and permissionless token exchanges. Unlike traditional limit order books (LOBs) that match
discrete bids and asks [GPW+
13], AMMs employ mathematical formulas to determine prices
based on asset quantities within liquidity pools, ensuring continuous liquidity availability and
instant trade execution.
The introduction of Concentrated Liquidity Market Makers (CLMMs) by Uniswap V3
[AZS+
21] marked a paradigm shift in AMM design. Unlike traditional Constant Function
Market Makers (CFMMs) [AC20, ACE22, ACD+
23], where liquidity is distributed uni-
formly across the entire price range according to a fixed bonding curve, CLMMs empower
liquidity providers (LPs) to concentrate their capital within specific price intervals. This fun-
damental change shifts control of the market’s bonding curve from a rigid, protocol-defined
function to an emergent structure determined collectively by LP decisions. By enabling
market participants to actively shape the liquidity distribution, CLMMs address a key in-
efficiency of CFMMs, where substantial capital may sit idle in rarely-traded price ranges.
The resulting dynamic liquidity profile more closely resembles traditional limit order books
[MMR23b], combining the capital efficiency of order book markets with the automation and
permissionless nature of AMMs.
Date: December 25, 2024.
Key words and phrases. Automatic market making, Decentralized exchange, Decentralized finance.
1
arXiv:2412.18580v1 [q-fin.MF] 24 Dec 20242 S.-N. TUNG AND T.-H. WANG
Recent literature has made significant strides in understanding CLMM dynamics. Heim-
bach et al. [HSW23] provide a comprehensive analysis of the risks and returns associated
with concentrated liquidity provision. Echenim et al. [EGM23] develop precise models of
CLMM mechanics using “liquidity curves” to analyze strategies and calculate LP fee earn-
ings. Urusov et al. [UBY24] contribute specialized backtesting frameworks for evaluating
CLMM performance.
Milionis et al. [MMRZ22a, MMRZ22b] explored the theoretical foundations of AMM
dynamics under myopic arbitrage, deriving a Black-Scholes-type formula, termed “loss-
versus-rebalancing” (LVR), to quantify LPs’ adverse selection costs. Their subsequent work
[MMR23a] extended this analysis to incorporate trading fees and discrete block generation
times. Fukasawa et al. [FMW23b, FMW23a] discussed model-free hedging strategies in the
context of Geometric Mean Market Makers (G3Ms). Further research has broadened the
analytical framework, with Bergault et al. [BBB+
24] and Cartea et al. [CDSB+
23] exploring
innovative AMM designs based on stochastic control theory.
Despite these advances in understanding CLMMs, a unified mathematical framework that
fully captures the dynamic interplay between concentrated liquidity provision, price move-
ments, and trading fees, comparable to those developed for LOBs [CST10, CdL13, CM21,
CDX23], has remained elusive. This paper addresses this gap through three main contribu-
tions:
(1) We introduce a framework for modeling liquidity profiles as measure-valued processes
(see Equations (16) and (19)). This formulation precisely characterizes how concen-
trated liquidity affects market behavior and trading outcomes.
(2) Building upon the joint work with C.-Y. Lee [LTW24], we employ stochastic anal-
ysis and control theory to analyze liquidity profile dynamics under arbitrage. This
analysis reveals that the presence of trading fees imposes fundamental constraints on
admissible price processes, specifically precluding diffusion terms to avoid infinite fee
generation.
(3) We derive closed-form solutions for optimal arbitrage strategies under three distinct
scenarios: myopic arbitrage, finite-horizon optimization, and infinite-horizon opti-
mization with discounted or ergodic control. These solutions provide valuable in-
sights into how rational actors interact with CLMMs and influence price discovery
and market efficiency.
Our findings have significant implications for CLMM design and management, offering
guidance on optimizing fee structures and liquidity incentives to enhance market efficiency.
The framework we develop bridges classical financial theory with emerging DeFi mechanisms,
providing valuable insights for both researchers and practitioners in the field.
Outline. The remainder of this paper is structured as follows: Section 2 examines the
fundamentals of CFMMs, establishing the mathematical groundwork. Section 3 introduces
liquidity profiles in CLMMs and develops the measure-theoretic framework for analyzing
their properties. Section 4 presents our main results on CLMM dynamics, including the
characterization of optimal arbitrage strategies and their implications for price processes.
Finally, Section 5 concludes with a discussion of practical implications and directions for
future research.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 3
2. Automated Market Maker Fundamentals
This section provides a concise review of Constant Function Market Makers. Readers
already familiar with this topic can proceed to the next section.
2.1. Constant Function Market Makers. Constant Function Market Makers (CFMMs)
[AC20, ACE22, ACD+
23] is a fundamental class of AMMs that operate based on a bonding
function. These systems facilitate decentralized trading by enabling interactions between
two primary categories of participants:
• Liquidity Providers (LPs): Users who deposit assets into the CFMM and receive
liquidity tokens representing their pool share.
• Liquidity Takers (Traders): Users who exchange one asset for another using the
liquidity provided in the pool.
2.1.1. Trading Mechanism. The core mechanism of a CFMM relies on its bonding function,
which represents a level set:
f(x,y) = ℓ,
where
• x,y ∈ R+ represent the quantities of the risk asset and numéraire, respectively;
• ℓ ∈ R+ denotes the liquidity amount of the pool;
• f : R+ × R+ → R+ is a twice continuously differentiable function.
A trade, represented by quantity changes (∆x,∆y), is considered valid if and only if it
preserves the bonding function:
f(x + ∆x,y + ∆y) = f(x,y).
This constraint ensures that the liquidity amount remains constant throughout each trade,
maintaining the fundamental relationship between asset quantities.
For a CFMM to support viable trading, the bonding function must satisfy several key
properties:
• Monotonicity: The implicit function y(x) derived from f(x,y) = ℓ must be strictly
decreasing.
• Convexity: The trading curve must be convex (see Equation (2)) to ensure price
impact increases with trade size.
• Scaling: For any λ > 0, f(λx,λy) = λℓ. This ensures reserves (x,y) scale linearly
with the liquidity amount ℓ.
2.1.2. Price Formation. The instantaneous price (or spot price) of the risk asset in terms of
the numéraire is derived using the implicit function theorem:
P = −
dy
dx
=
fx
fy
, (1)
where fx and fy are partial derivatives of f with respect to x and y. This ratio of partial
derivatives represents the slope of the tangent line to the trading curve at the point (x,y).4 S.-N. TUNG AND T.-H. WANG
For a given liquidity level ℓ, we can express x as a function of y:
x = ϕ(y,ℓ)
where ϕ is obtained by solving f(x,y) = ℓ for x. This allows us to express price as a function
of y and ℓ:
P =
fx(ϕ(y,ℓ),y)
fy(ϕ(y,ℓ),y)
.
The marginal price impact of a trade is given by
dP
dx
= −
d2
y
dx2
= −
fxxfy − fxfxy
(fy)2
. (2)
This relationship, which is positive due to the convexity of the bonding function, demon-
strates how larger trades move the price more significantly, creating a natural price discovery
mechanism.
2.1.3. Liquidity Provision. Liquidity providers (LPs) play a crucial role in CFMMs by de-
positing assets into the pool. When LPs add or remove liquidity, they do so proportionally
to the existing reserves. In exchange for providing liquidity, LPs receive liquidity tokens.
These tokens represent their pool share and can be redeemed later for a corresponding por-
tion of the pool’s assets. The minting and redemption mechanisms ensure that the relative
proportions of the assets in the pool remain consistent as liquidity is added or removed. The
additivity of liquidity across multiple LPs allows for efficient tracking and management of
liquidity provision.
2.1.4. Trading Fees. To incentivize users to provide liquidity, CFMMs incorporate a trading
fee. This fee is typically denoted by a parameter γ ∈ (0,1), where 1 − γ represents the
percentage of the trade value that is collected as a fee. Common values for γ range from
99% to 99.99%. The trading fee modifies the trading mechanism as follows:
• For buying the risk asset (∆x > 0):
f(x + γ∆x,y + ∆y) = f(x,y).
• For selling the risk asset (∆x < 0):
f(x + ∆x,y + γ∆y) = f(x,y).
The trading fee creates an infinitesimal bid-ask spread, which is the difference between the
price at which traders can buy and sell an infinitesimal amount of the risk asset:
Pbid = γ−1
P, Pask = γP,
where P is the instantaneous price (mid-price) derived earlier. This creates a bid-ask spread
of
Pbid − Pask = (γ−1
− γ)P.
The accumulated fees in terms of each asset are
∆Fx =
1 − γ
γ
∆x+
, ∆Fy =
1 − γ
γ
∆y+
where ∆x+
and ∆y+
represent positive changes in respective asset quantities.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 5
2.1.5. Pool Valuation. The total value V of the liquidity pool, expressed in terms of the
numéraire (asset Y ), is given by
V = Px + y, (3)
where P is the instantaneous price. This formula allows for a straightforward calculation of
the pool’s overall worth. The pool’s value function exhibits several important properties:
(1) Homogeneity: V (λx,λy) = λV (x,y) for λ > 0.
(2) Concavity in price: ∂2V
∂P2 = dx
dP
≤ 0.
For a liquidity provider owning a fraction α of the pool, their position value is
Vα = α(Px + y).
2.1.6. Examples:G3Ms. Geometric Mean Market Makers (G3Ms), popularized by Balancer
Protocol [MM19, Eva21, AKC+
21], employ the following bonding function:
f(x,y) := xw
y1−w
= ℓ, (4)
where w ∈ (0,1) represents the weight of asset X in the pool. This function enforces a
constant weighted geometric mean relationship between the quantities of the two assets, x
and y. The instantaneous price P in a G3M is given by
P = −
dy
dx
=
w
1 − w
y
x
. (5)
Using (4) and (5), we can express the reserves x and y in terms of the liquidity ℓ and price
P:
x =

w
1 − w
1−w
LPw−1
, y =

1 − w
w
w
ℓPw
. (6)
This allows us to write the value function for G3M liquidity providers as
V (P,ℓ) = Px + y =
ℓPw
ww(1 − w)1−w
. (7)
This formulation demonstrates that a G3M maintains a portfolio with a fixed weight w in
asset X and (1−w) in asset Y , effectively implementing an automated constant rebalancing
strategy.
A special case of the G3M is the Constant Product Market Maker (CPMM), popularized
by Uniswap V2 [AZR20, AKC+
21]. This corresponds to setting w = 1
2
in the G3M bonding
function, resulting in the familiar constant product formula: xy = ℓ2
2.2. Liquidity Provider Risks. LPs in CFMMs face several inherent risks, with adverse
selection among the most significant. This risk arises when informed traders, particularly
arbitrageurs, exploit price discrepancies between the CFMM and external markets. While
such arbitrage activities help maintain market efficiency, they can substantially impact LPs’
returns. This section provides a rigorous mathematical analysis of these risks, building upon
and extending the framework presented in [MMRZ22b, MMRZ22a, FMW23b, FMW23a].6 S.-N. TUNG AND T.-H. WANG
Figure 1. G3M bonding curves for different values of w. These curves illustrate
the relationship between the quantities of the two assets in the pool, as dictated by
the G3M bonding function.
2.2.1. Impermanent loss. Impermanent loss (IL), also known as divergence loss, quantifies
the opportunity cost of providing liquidity to a CFMM compared to simply holding the
assets. We begin by establishing a formal framework for analyzing this phenomenon.
Consider an LP with initial holdings of x0 = x(P0,ℓ) units of asset X and y0 = y(P0,ℓ)
units of asset Y , where P0 is the initial price of asset X in terms of asset Y within the CFMM
pool.
If the LP holds these assets without trading, the value of their portfolio Ht at time t
evolves according to
dHt = x(P0)dPt.
Integrating this equation yields the portfolio value at time t:
Ht = x0Pt + y0 = x0P0 + y0 + x0
Z t
0
dPs.
When providing liquidity to the CFMM pool, the position value Vt at time t is
Vt = V (Pt) = xtPt + yt = x(Pt)Pt + y(Pt).
Applying Itô’s formula to Vt yields
dVt = V ′
(Pt)dPt +
1
2
V ′′
(Pt)d⟨P⟩t = x(Pt)dPt +
1
2
V ′′
(Pt)d⟨P⟩t,
where d⟨P⟩ denotes the quadratic variation of the price process. Here, we used the fact that
V ′
(Pt) =
d
dP
(Px + y) = x + P
dx
dP
+
dy
dP
= x.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 7
The impermanent loss, ILt := Ht − Vt, represents the difference in value between holding
assets and providing liquidity:
dILt = dHt − dVt = {x(P0) − x(Pt)}dPt −
1
2
V ′′
(Pt)d⟨P⟩t
or equivalently, in integral form:
ILt = Ht − Vt =
Z t
0
{x(P0) − x(Ps)}dPs −
Z t
0
1
2
V ′′
(Ps)d⟨P⟩s.
Given that V ′′
(P) = x′
(P) ≤ 0 (since the amount of asset X held in the pool decreases as
the price P increases), and assuming that the price process Pt is a martingale, we have
E[ILt] = −E
Z t
0
1
2
V ′′
(Ps)d⟨P⟩s

≥ 0.
This result demonstrates that, on average, an LP would have been better off holding the
assets rather than providing liquidity.
2.2.2. Loss-versus-Rebalance. The quadratic variation term in the IL equation can be attrib-
uted to the concept of loss-versus-rebalance (LVR).
Consider a self-financing trading strategy that continuously rebalances the portfolio to
hold x(Pt) units of asset X. Let Rt denote the strategy’s value at time t, with initial value
R0 = x0P0 + y0. The self-financing condition implies
dRt = x(Pt)dPt.
Define the loss-versus-rebalance as LVRt := Rt − Vt. Then,
dLVRt := dRt − dVt = −
1
2
V ′′
(Pt)d⟨P⟩t ≥ 0.
This inequality holds because V ′′
(P) = x′
(P) ≤ 0. The impermanent loss can be decomposed
as
ILt =
Z t
0
{x(P0) − x(Ps)}dPs + LVRt. (8)
This decomposition reveals two components:
(1) A martingale component that can be hedged through dynamic position adjustment.
(2) A non-negative drift component representing the loss-versus-rebalance.
2.2.3. Example: IL and LVR in G3Ms. For G3Ms, applying Itô’s formula to the value func-
tion (7) yields
dVt =

w
1 − w
1−w
ℓPw−1
t dPt −
w1−w
(1 − w)w
2
ℓPw−2
t d⟨P⟩t.
In comparison, the value Rt of a self-financing portfolio continuously rebalanced to hold xt
units of the risky asset evolves according to
dRt = xtdPt =

w
1 − w
1−w
ℓPw−1
t dPt8 S.-N. TUNG AND T.-H. WANG
The difference between these two processes represents the LVR:
dLVRt = dRt − dVt =
w1−w
(1 − w)w
2
ℓPw−2
t d⟨P⟩t.
Using the IL decomposition (8), we obtain
ILt =
Z t
0
(x0 − xs)dPs +
w1−w
(1 − w)w
2
ℓ
Z t
0
Pw−2
s d⟨P⟩s.
This example demonstrates how the concepts of IL and LVR can be explicitly quantified for
the specific case of a G3M.
3. Concentrated Liquidity Market Makers
Unlike traditional CFMMs, where liquidity is distributed uniformly along the entire price
curve, Concentrated Liquidity Market Makers (CLMMs) [AZS+
21] enable LPs to concen-
trate their capital within specific price ranges, substantially improving capital efficiency.
This design allows LPs to optimize their returns by allocating liquidity where it is most
likely to be used, reducing the amount of capital "idle" in price ranges with minimal trading
activity.
3.1. CLMM Architecture.
3.1.1. Position Structure and Mechanics. A CLMM LP position is defined by a pair (ℓ,[pl,pu]),
where ℓ represents the amount of liquidity and 0 < pl < pu < ∞ defines the chosen price
range for liquidity provision. The required reserves depend on the current pool price P:
(1) If P ∈ [pl,pu], the LP deposits ℓ

1 √
P
− 1 √
pu

of token X and ℓ

1 √
P
− 1 √
pu

of token
Y into the pool.
(2) If P > pu, LP deposits only ℓ
√
pu −
√
pl

of token Y into the pool, as the price is
above their specified range.
(3) If P < pl, the LP deposits only ℓ

1 √
pl
− 1 √
pu

of token X into the pool, as the price
is below their specified range.
3.1.2. Reserve Functions and Bonding Curves. The complete reserve functions for any price
p can be expressed as:
x(p) = ℓ

1
√
p
−
1
√
pu
+
− ℓ

1
√
p
−
1
√
pl
+
, (9)
y(p) = ℓ
√
p −
√
pl
+
− ℓ
√
p −
√
pu
+
.
These reserve functions resemble the payoff function of a bull spread in a transformed price
space (see, for instance, Equation (12)).
For p ∈ [pl,pu], eliminating the parameter p in Equation (9) yields the bonding curve

x +
ℓ
√
pu
1/2
(y + ℓ
√
pl)1/2
= ℓ,A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 9
or equivalently, 
x
ℓ
+
1
√
pu
y
ℓ
+
√
pl

= 1.
Using Equation (3) and (9), the value of an LP position is given by
V (P) = ℓP
"
1
√
P
−
1
√
pu
+
−

1
√
P
−
1
√
pl
+
+

1
√
P
−
√
pl
P
+
−

1
√
P
−
√
pu
P
+
#
=

  
  
ℓP

1 √
pl
− 1 √
pu

if P < pl,
ℓP

2 √
P
− 1 √
pu
−
√
pl
P

if pl ≤ P ≤ pu,
ℓ
√
pu −
√
pl

if P > pu,
(10)
where (z)+
= max(z,0) denotes the positive part of z.
3.1.3. Relationship to Traditional CFMMs. Uniswap V3 introduced the concept of concen-
trated liquidity, allowing LPs to provide liquidity within specific price ranges. This effectively
provides liquidity on a "portion" of the Uniswap V2 bonding curve (see Figure 2).
Key distinctions between CLMMs and traditional CFMMs include:
• In a CPMM, the bonding curve never intersects the axes, implying that liquidity is
provided across the entire price range [0,∞).
• In a CLMM, if a single LP provides liquidity within the range [pl,pu], the bonding
curve intersects the x-axis at x∗
= ℓ

1 √
pl
− 1 √
pu

and the y-axis at y∗
= L
√
pu
−
√
pl

.
This indicates that no swaps are possible beyond the LP’s specified liquidity range.
Figure 2. CLMM bonding curve with L = 10, pl = 0.4, pu = 2.510 S.-N. TUNG AND T.-H. WANG
3.1.4. Connection to Covered Call Strategies. Providing liquidity in a CLMM can be likened
to a covered call strategy in traditional finance. Let pm =
√
plpu be the geometric mean of
the lower and upper bounds of the LP’s price range. We can then express these bounds as
pl =
pm
r
, pu = rpm,
where r = pu
pl
> 1 represents the relative width of the price range. With this notation, the
LP’s value function (10) can be rewritten as
V (k) = ℓp
1
2
m
"
√
k −
k
√
r
+
−
√
k − k
√
r
+
+

√
k −
1
√
r
+
−
√
k −
√
r
+
#
=

   
   
ℓ
√
pm
√
r − 1 √
r

k if k < r−1
,
ℓ
√
pm

2 −
√
k √
r
− 1 √
kr
√
k if r−1
≤ k ≤ r,
ℓ
√
pm
√
r − 1 √
r

if k > r,
where k = P
pm
is the ratio of the current price P to the center price pm. This function exhibits
the following properties:
• For any k ≥ 0,
V (k) ≤ ℓ
√
pm

√
r −
1
√
r


k − (k − 1)+
; (11)
• As the price range narrows (r → 1, implying pl → pu), the LP’s value function
converges to the right-hand side of inequality (11).
These properties illustrate that the LP’s value function resembles the payoff of a portfolio of
ℓ
√
pm
√
r − 1 √
r

covered call options with a strike price of 1 in the k-domain (see Figure 3).
This analogy highlights the similarity between concentrated liquidity provision and holding
covered calls, where the LP’s potential fees earned from trading activity are akin to the
premiums received from selling call options.
3.2. Liquidity Profile. In Uniswap V3, liquidity providers gain the ability to concentrate
their liquidity within specific price ranges, leading to a piecewise constant or step-function
representation of liquidity within the pool. To formalize this concept, we introduce the notion
of a liquidity profile, denoted by ℓ = ℓ(P), which describes the distribution of liquidity as
a function of the price P over the entire price spectrum (0,∞). This profile provides a
comprehensive view of how liquidity is allocated across different price levels, capturing the
essence of concentrated liquidity provision.
3.2.1. Single Position Analysis. To establish a foundation for understanding liquidity pro-
files, we begin by analyzing a single CLMM position with liquidity ℓ concentrated within a
specific price range [pl,pu]. We utilize a change of variables approach to simplify the analysis
of the reserve functions.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 11
Figure 3. CLMM LP value with L = 1, pl = 0.5, pu = 2
For the reserve function x(p), representing the quantity of asset X held in the pool, we
employ the substitution s = 1 √
p
. This transformation yields
x

1
s2

= ℓ

(s − sr)+
− (s − sl)+
, (12)
where sr = 1 √
pr
and sl = 1 √
pl
. Notably, the right-hand side of Equation (12) corresponds to
the payoff function of a long position in ℓ bull spreads with strikes sr and sl (where sr < sl)
in the s-domain. This connection to option payoffs provides an intuitive understanding of
the reserve function’s behavior.
Equation (12) can be equivalently represented using a Lebesgue integral:
x

1
s2

=
Z
R+
(s − k)+
dℓ̃(k) =
Z
[0,s]
(s − k)dℓ̃(k),
where dℓ̃ is a signed measure defined as the sum of Dirac delta functions:
dℓ̃(k) = ℓ{δ(sr) − δ(sl)}. (13)
Let ℓ̃(k) =
R
[0,k]
dℓ̃(r) be the cumulative distribution function of dℓ̃(r). Assuming ℓ̃(0) = 0
and integrating by parts, we obtain
x

1
s2

= (s − k)ℓ̃(k)|s
0 +
Z
[0,s]
ℓ̃(k)dk =
Z
[0,s]
ℓ̃(k)dk.12 S.-N. TUNG AND T.-H. WANG
Transforming back to the price space with the substitution k = 1 √
q
, we arrive at
x(p) = x

1
s2

=
Z
[0,s]
ℓ̃(k)dk =
1
2
Z ∞
p
ℓ(q)q−3
2 dq, (14)
where ℓ(p) := ℓ̃

1 √
p

.
Similarly, for the reserve function y(p), representing the quantity of asset Y , we substitute
t =
√
p into (9) to obtain
y(p) = y(t2
) = ℓ

(t − tl)+
− (t − tu)+

,
where tl =
√
pl, tu =
√
pu. An analogous analysis leads to
y(p) =
Z
[0,t]
ℓ̃(k)dk =
1
2
Z p
0
ℓ(q)q−1
2 dq, (15)
where ℓ(p) := ℓ̃(
√
p).
It is crucial to note that the measure and its associated distribution function in Equation
(13) are linear in the liquidity parameter ℓ. This linearity allows us to extend the above anal-
ysis and equalities to general σ-finite signed measures through a standard limiting process,
providing a framework for analyzing more complex liquidity profiles.
3.2.2. Liquidity as a Distribution. Building on the analysis in Section 3.2.1, we generalize
the concept of liquidity to be a function of the instantaneous price P, represented by the
liquidity profile ℓ(P). This function describes the distribution of liquidity across different
price levels, capturing the essence of concentrated liquidity provision.
From a measure-theoretic perspective, dℓ(p) can be interpreted as a σ-finite signed measure
on the interval [0,∞), with ℓ(p) serving as its cumulative distribution function (CDF). This
interpretation allows us to leverage the tools of measure theory to analyze the properties of
liquidity profiles and their impact on CLMM behavior.
Using Equations (14) and (15), we express the pool reserves in terms of the instantaneous
price P:
x(P) =
1
2
Z ∞
P
ℓ(p)p−3
2 dp, y(P) =
1
2
Z P
0
ℓ(p)p−1
2 dp. (16)
These equations establish a direct relationship between the reserves and the liquidity profile,
highlighting how the distribution of liquidity influences the quantities of assets held in the
pool. Differentiating (16) with respect to P, we confirm that
dy
dx
=
dy
dP
dx
dP
= −P < 0.
This result verifies that, as in standard CFMMs, the instantaneous price P corresponds to
the negative slope of the tangent to the reserve curve. Further analysis of the shape of this
curve reveals that
d2
y
dx2
=
1
dP
dy
dx

dx
dP
=
−1
−ℓ(P)
2P
3
2
=
2P
3
2
ℓ(P)
> 0.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 13
These findings indicate that the reserve curve is both decreasing and convex, ensuring that
the price impact of trades increases with trade size, a crucial property for market stability.
Furthermore, assume the boundary conditions
lim
p→∞
ℓ(p)p−1
2 = 0 and lim
p→0
ℓ(p)p
1
2 = 0,
and applying integration by parts to Equation (16), we obtain
x(P) =
ℓ(P)
√
P
+
Z ∞
P
1
√
p
dℓ(p),
y(P) = ℓ(P)
√
P −
Z P
0
√
pdℓ(p).
These expressions provide an alternative representation of the pool reserves in terms of the
liquidity profile and its integral.
3.2.3. Examples and Empirical Data.
Example 3.1 (Uniform Liquidity). The simplest case is a uniform liquidity distribution, where
ℓ(P) = ℓ for all P ∈ (0,∞). This corresponds to the CPMM, where liquidity is evenly
distributed across all price levels. In this case, Equations (16) reduce to the familiar constant
product formula xy = L2
.
Figure 4. Liquidity profile for Uniswap V2, illustrating a constant liquidity distri-
bution across all prices.14 S.-N. TUNG AND T.-H. WANG
Example 3.2 (Two Disjoint Positions). Consider a liquidity profile constructed by combining
two distinct LP positions:
ℓ(p) = k11 1 1[a,b)(p) + k21 1 1[b,c)(p),
where k1 and k2 are positive constants and 1 1 1[a,b) denotes the indicator function of the interval
[a,b). This profile represents two concentrated liquidity positions with different intensities
within distinct, non-overlapping price ranges. Calculating the integrals in (16) for the dif-
ferent price intervals yields:
(1) For P ≥ c,
x = 0, y = −k1
√
a − (k2 − k1)
√
b + k2
√
c = k1
√
b −
√
a

+ k2
√
c −
√
b

.
(2) For b ≤ P < c,
x =
ℓ(P)
√
P
+
Z ∞
P
1
√
p
dℓ(p) =
k2
√
P
−
k2
√
c
= k2

1
√
P
−
1
√
c

,
y =
√
Pℓ(P) −
Z P
0
√
pdℓ(p) = k2
√
P − k1
√
a − (k2 − k1)
√
b
= k1
√
b −
√
a

+ k2
√
P −
√
b

.
(3) For a ≤ P < b,
x =
ℓ(P)
√
P
+
Z ∞
P
1
√
p
dℓ(p) =
k1
√
P
+ (k2 − k1)

1
√
b
−
1
√
c

−
k2
√
c
= k1

1
√
P
−
1
√
b

+ k2

1
√
b
−
1
√
c

,
y =
√
Pℓ(P) −
Z P
0
√
pdℓ(p) = k2
√
P − k1
√
a − (k2 − k1)
√
b
= k1
√
b −
√
a

+ k2
√
P −
√
b

.
(4) For P < a,
x =
ℓ(P)
√
P
+
Z ∞
P
1
√
p
dℓ(p) =
k1
√
a
+
k2 − k1
√
b
−
k2
√
c
, y = 0.
Example 3.3 (Continuous Distribution). Assume the liquidity profile is given by a χ2
dis-
tribution with three degrees of freedom. In this case, the expressions in (16) do not have
closed-form analytical solutions. To illustrate the behavior of the liquidity profile and the
corresponding pool reserves, Figure 6 presents numerical results parameterized by pool price
P.
Example 3.4 (Real-World Liquidity Profiles). Figure 7 illustrates empirical liquidity profiles
observed on Uniswap V3. The top 3D plot shows the evolution of liquidity over time, with
"tick" representing discrete price levels and the vertical axis indicating liquidity depth (on a
logarithmic scale). The bottom four plots provide snapshots of liquidity profiles at different
points in time, highlighting the varying concentration of liquidity around the spot price.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 15
Figure 5. Liquidity profile with two concentrated liquidity positions, illustrating
the varying liquidity levels across different price ranges.
Notably, the liquidity profiles tend to be highly concentrated around the current spot price,
reflecting the active management of liquidity positions by liquidity providers.
3.2.4. IL and LVR for Static Liquidity Profile. We now examine how IL and LVR evolve
in the context of a liquidity profile ℓ(P). Applying Itô’s formula to (16), we obtain the
dynamics of the reserve asset xt:
dxt = d

1
2
Z ∞
Pt
ℓ(p)p−3
2 dp

=
1
2
Z ∞
Pt
dℓ
dt
(p)p−3
2 dp −
1
2
ℓ(Pt)Pt
−3
2 dPt +
1
2

−
1
2
Ptℓ′
(Pt) +
3
4
ℓ(Pt)

P
−5
2
t d⟨P⟩t ,
and yt:
dyt =d

1
2
Z Pt
0
ℓ(p)p−1
2 dp

=
1
2
Z Pt
0
dℓ
dt
(p)p−1
2 dp +
1
2
ℓ(Pt)Pt
−1
2 dPt +
1
2

1
2
Ptℓ′
(Pt) −
1
4
ℓ(Pt)

P
−3
2
t d⟨P⟩t .16 S.-N. TUNG AND T.-H. WANG
Figure 6. Liquidity profile following a χ2-distribution, demonstrating a continuous
and non-uniform liquidity distribution.
Note that dℓ
dt
= 0 since the liquidity profile is static. Using these expressions, we derive the
evolution of the total pool value Vt = Ptxt + yt:
dVt =d(Ptxt + yt) = xtdPt + Ptdxt + d⟨x,P⟩t + dyt
=xtdPt −
1
2
ℓ(Pt)Pt
−1
2 dPt +
1
2

−
1
2
Ptℓ′
(Pt) +
3
4
ℓ(Pt)

P
−3
2
t d⟨P⟩t
−
1
2
ℓ(Pt)Pt
−3
2 d⟨P⟩t +
1
2
ℓ(Pt)Pt
−1
2 dPt +
1
2

1
2
Ptℓ′
(Pt) −
1
4
ℓ(Pt)

P
−3
2
t d⟨P⟩t
=xtdPt −
1
4
ℓ(Pt)P
−3
2
t d⟨P⟩t .
Therefore, the LVR in this scenario is given by
dLVRt = xtdPt − dVt =
1
4
ℓ(Pt)P
−3
2
t d⟨P⟩t . (17)
Consequently, the impermanent loss ILt can be expressed as
dILt = (x0 − xt)dPt + dLVRt.
This analysis reveals that, similar to standard CFMMs, the LVR for a liquidity profile
is influenced only by the quadratic variation of the pool price P and the liquidity amount
at the current price. This highlights the importance of understanding the price dynamics
and liquidity distribution when assessing the risks associated with concentrated liquidity
provision.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 17
(a) 3D Liquidity Evolution
(b) Snapshot 1 (c) Snapshot 2
(d) Snapshot 3 (e) Snapshot 4
Figure 7. Empirical liquidity profiles from Uniswap V3. The 3D plot shows liq-
uidity evolution over time and across "ticks" (discrete price levels). The 2D plots
display snapshots of liquidity profiles at different times, with liquidity shown on a
logarithmic scale. Data courtesy of Wun-Cing Liou and Jimmy Risk.18 S.-N. TUNG AND T.-H. WANG
3.2.5. Time-Dependent Liquidity Profile. When the liquidity profile ℓt(·) varies over time,
the reserve amounts (xt,yt) are no longer static. However, the fundamental relationships
between these quantities still hold at each point in time. Specifically, for a given price P and
time t, the reserve amounts are given by
xt(P) =
1
2
Z ∞
P
ℓt(p)p−3
2 dp, yt(P) =
1
2
Z P
0
ℓt(p)p−1
2 dp. (18)
The dynamics of the reserve amounts follow from the dynamics of the liquidity profile:
dxt(P) =
1
2
Z ∞
P
dℓt(p)p−3
2 dp,
dyt(P) =
1
2
Z P
0
dℓt(p)p−1
2 dp.
These equations link the evolution of the liquidity profile to changes in the reserve amounts,
capturing the dynamic interplay between liquidity provision and asset holdings.
The instantaneous price Pt continues to be defined as the negative slope of the tangent to
the reserve curve at time t:
mt(P) :=
∂yt
∂xt
= −P.
The dynamics of the instantaneous price are given by
dmt(P) = d

∂yt
∂xt

= d(−P) = 0.
This equation highlights a crucial property: even with a time-varying liquidity profile, the
instantaneous price at a given price level P remains independent of time.
Remark 3.5. The evolution of ℓt can be modeled using various stochastic processes, such
as Gaussian processes or stochastic partial differential equations (SPDEs), to capture the
dynamic nature of liquidity provision. For instance, a stochastic heat equation of the form
dℓt = Atℓtdt + σℓtdWt
could be employed, where At is a second-order parabolic or elliptic differential operator, and
Wt is standard Brownian motion. This allows for a flexible and nuanced representation of
how liquidity profiles change over time.
Remark 3.6. While the framework in Section 3.2.4 can accommodate time-dependent liquid-
ity profiles, we focus on the time-independent case for the following reasons:
• Active liquidity management by LPs introduces non-self-financing aspects, as LPs
may need to add or remove assets from the pool to maintain their desired liquidity
positions. To address this within the context of IL and LVR analysis, the terms
1
2
Pt
R∞
Pt
dℓ(p)p−3
2 dp+ 1
2
RPt
0
dℓt(p)p−1
2 dp, which arise from liquidity adjustments, need
to be incorporated into the definition of the hedging/replication strategy.
• Price changes dPt and liquidity adjustments dℓt occur as distinct, ordered events on
the blockchain. This implies that d⟨P,ℓ(P)⟩t = 0 simplifies the expression for dVt by
eliminating several terms.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 19
• Consequently, the core component of dLVRt that is both unhedgeable and directly
attributable to arbitrage remains 1
4
ℓ(Pt)P
−3
2
t d⟨P⟩t, consistent with the static liquidity
profile case in Equation (17). This emphasizes that the primary driver of LVR in
CLMMs is the quadratic variation of the price, even in the presence of time-dependent
liquidity profiles.
4. Price Process Models and Arbitrage
4.1. Continuous Trading Framework. To delve deeper into the dynamics of CLMMs
under continuous trading, we construct a mathematical framework that seamlessly integrates
order flows, price impacts, fees, and liquidity constraints. This framework serves as the
cornerstone for comprehending arbitrage opportunities and constructing optimal trading
strategies within the CLMM environment.
4.1.1. Order Flow Dynamics. Given a filtered probability space (Ω,F,{Ft},P) that adheres
to the usual conditions, the trading dynamics are characterized by two non-negative, adapted
processes:
• ua
t : The rate at which the CLMM buys asset X, capturing the influx of buy orders
for the asset.
• ub
t: The rate at which the CLMM sells asset X, representing the flow of sell orders
for the asset.
These processes encapsulate the continuous trading activity within the CLMM to model the
evolution of the pool’s state.
The evolution of the pool state (xt,yt,Pt) follows directly from differentiating Equations
(18):
dxt =
1
2
Z ∞
Pt
dℓt(p)p−3
2 dp + (ua
t − ub
t)dt,
dyt =
1
2
Z Pt
0
dℓt(p)p−1
2 dp − Pt(ua
t − ub
t)dt, (19)
dPt =
−2P
3
2
t
ℓt(Pt)
(ua
t − ub
t)dt.
These equations depict how the pool’s reserves and price evolve in response to trading ac-
tivity, capturing the interplay between order flows, liquidity profiles, and price adjustments.
4.1.2. Fee Considerations. For a fee tier (1 − γ), fees accumulate according to
dFx
t =
1 − γ
γ
ua
t dt, dFy
t =
1 − γ
γ
Ptub
tdt (20)
where Fx
t (resp. Fy
t ) represents the cumulative amount of fees accrued in asset X (resp. Y ).20 S.-N. TUNG AND T.-H. WANG
4.2. Arbitrage Models. This section delves into arbitrage models within the established
CLMM continuous trading framework. To ensure analytical tractability and accommodate
trading fees (20), we assume that the price process, Pt, has finite variation. This assumption
excludes stochastic differential equations (SDEs) with a diffusion term for the price process.
4.2.1. Mispricing Process. We begin by introducing an exogenous price process, St, for asset
X, which follows geometric Brownian motion (GBM):
dlnSt = µdt + σdWt.
where µ represents the drift and σ the volatility parameter. This exogenous price reflects
the asset’s true underlying value, which may deviate from the CLMM price due to market
inefficiencies or temporary imbalances.
To quantify this discrepancy, we define the mispricing process, Zt, as the logarithmic
difference between the CLMM price, Pt, and the fair price, St:
Zt = lnSt − lnPt.
Under the finite variation assumption for Pt, Zt must have a diffusion coefficient of σ. Con-
sequently, it follows the SDE:
dZt = (µ − ut)dt + σdWt, (21)
where ut controls the log-price movement rate:
dlnPt =
−2P
1
2
t
ℓt(Pt)
(ua
t − ub
t)dt := utdt.
Remark 4.1.
(1) The exogenous price, St, typically refers to the price observed on centralized ex-
changes with high trading volumes, providing a reliable benchmark for the asset’s
fair value.
(2) The logarithmic scale, lnPt, for price and liquidity provision aligns with the design
of Uniswap V3.
(3) This modeling approach draws an analogy with LOBs [CST10, CdL13, CM21, CDX23],
where St represents the mid-price and the bid-ask spread is determined by the fee
parameter γ. However, unlike traditional LOBs, the bid-ask spread in a CLMM is
fixed, and liquidity provision does not directly influence the price.
4.2.2. Myopic Arbitrage. This model explores a scenario where arbitrageurs exclusively drive
the CLMM price. We assume a group of arbitrageurs continuously monitors the CLMM and
the fair market prices, executing trades whenever profitable arbitrage opportunities arise,
specifically when St − γ−1
Pt > 0 (buy opportunity) or γPt − St > 0 (sell opportunity).
We introduce the following additional assumptions:
Assumption 4.2.
• The reference market exhibits infinite liquidity, implying arbitrage trading does not
affect the fair price, St.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 21
• Arbitrageurs are myopic, meaning they execute trades immediately to capitalize
on any observed price discrepancies without considering future price movements or
potential competition from other arbitrageurs.
These assumptions lead to the price dynamics described in [FMW23a, NTYY24, LTW24]:
Proposition 4.3 (Myopic Arbitrage Dynamics). Given a continuous market price St sat-
isfying the initial condition γP0 ≤ S0 ≤ γ−1
P0, and under Assumptions 4.2, the following
hold:
a) The mispricing process Zt can be decomposed as Zt = lnSt − lnP0 + Lt − Ut and
remains within the range [lnγ,−lnγ] for all t ≥ 0.
b) Lt and Ut are both non-decreasing and continuous, with initial values L0 = U0 = 0.
c) Lt increases only when Zt = −lnγ, and Ut increases only when Zt = lnγ.
Moreover, Lt and Ut satisfy
Lt = sup
0≤s≤t
(−ln(γP0) + lnSs − Us)−
,
Ut = sup
0≤s≤t
ln(γ−1
P0) − lnSs − Ls
−
.
The following corollaries follow directly from Proposition 4.3 and Section 4.1:
Corollary 4.4 (Inventory Dynamics in Myopic Arbitrage). Under the same assumptions as
in Proposition 4.3, the following hold:
(a) xt and yt are predictable processes.
(b) xt increases only when Zt = lnγ and decreases only when Zt = −lnγ. Similarly, yt
increases only when Zt = −lnγ and decreases only when Zt = lnγ.
(c) xt and yt are continuous and of bounded variation on any bounded interval in [0,∞).
(d) The arbitrage inventory process can be characterized by
dxt =
ℓ(Pt)P
−1
2
t
2
{dLt − dUt}, dyt =
ℓ(Pt)P
−1
2
t
2
{dUt − dLt}.
Corollary 4.5 (Trading Fee Dynamics in Myopic Arbitrage). Under the same assumptions
as in Proposition 4.3, the following hold:
(a) Fx
t and Fy
t are predictable processes.
(b) Fx
t increases only when Zt = lnγ and Fy
t increases only when Zt = −lnγ.
(c) Fx
t and Fy
t are continuous and of bounded variation on any bounded interval in [0,∞).
(d) The trading fee process can be characterized by
dFx
t =
1 − γ
γ
ℓ(Pt)P
−1
2
t
2
dLt, dFy
t =
1 − γ
γ
ℓ(Pt)P
1
2
t
2
dUt.
Remark 4.6. In the absence of fees (γ = 1), the arbitrageur’s profit equals the LVR given by
Equation (17), driven by the quadratic variation of the price process. However, with fees,
the quadratic variation of Pt vanishes due to the finite variation assumption. In this case,22 S.-N. TUNG AND T.-H. WANG
the arbitrageur’s profit (or LP’s loss) is
dARBt = (St − γ−1
Pt)dx+
t + (γPt − St)dx−
t (22)
=
ℓ(Pt)P
1
2
t
2

(eZt
− γ−1
)dLt + (γ − eZt
)dUt

,
where dx+
t = max{dxt,0} and dx−
t = max{−dxt,0}.
Proposition 4.3(c) implies that Equation (22) equals zero, suggesting the myopic arbi-
trage model may not fully capture the continuous dynamics of AMM prices with fees. This
motivates the exploration of more sophisticated models incorporating arbitrageur control
mechanisms.
4.2.3. Finite-Horizon Arbitrage. Instead of myopic arbitrage, we now consider a single arbi-
trageur who aims to maximize their profit over a finite time horizon [0,T]. This arbitrageur
strategically controls the CLMM price movement through continuous trading, assuming no
transaction costs.
Specifically, the arbitrageur controls the log-price movement rate, which is modeled as
dlnPt = utdt. To formalize this, we define the following classes of admissible controls:
(1) A[t,T] := {u : [t,T] × Ω → R | us is Ft-progressively measurable, E[
RT
t
|us|2
ds] <
+∞} for any T > 0;
(2) A :=
T
T>0 A[0,T].
With these definitions, the arbitrageur’s optimization problem can be formulated as
sup
u∈A[0,T]
E
Z T
0
(St − Pt)dxt

. (23)
Using the relation dxt = 1
2
ℓt(Pt)P
−3
2
t dPt and the approximation a ≈ ea
− 1 for small a, we
can approximate the optimization problem (23) in log-scale as
sup
u∈A[0,T]
E
Z T
0
ℓt(Pt)P
−1
2
t Ztutdt

,
This approximation simplifies the optimization problem while preserving its essential fea-
tures, allowing for a more feasible analysis. Recall that the mispricing process, Zt, is defined
by Equation (21).
To enhance the tractability of the control problem, we introduce the following simplifying
assumptions:
Assumption 4.7.
• (Square Rule for Liquidity) The time-dependent liquidity profile, ℓt(Pt), adheres to
a "square rule" ℓt(Pt)P
1
2
t ≡ K, where K is a constant. This assumption ensures a
simple relationship between liquidity and price, simplifying the analysis.
• (Quadratic Control Penalty) We impose a quadratic penalty, λ
2
u2
t , on the control
variable, ut, where λ > 0 is a penalty parameter. This penalty discourages excessive
control actions by the arbitrageur and promotes smoother, more gradual adjustments
to the price.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 23
• (Mispricing Penalty) We incorporate a mispricing penalty, τ
2
Z2
t , where τ > 0 is
another penalty parameter. This penalty penalizes large deviations of the mispricing
process, Zt, from zero, ensuring the validity of the approximation z ≈ ez
− 1 used
earlier and bounding the reward function to ensure the stability of the solution.
Under these assumptions, the finite-horizon arbitrage problem is simplified to
sup
u∈A[0,T]
Ez
Z T
0

Ztut −
λ
2
u2
t −
τ
2
Z2
t

dt

.
Remark 4.8.
• The "square rule" can be interpreted as maintaining constant instantaneous liquidity
in terms of the numéraire. Recall that in a CPMM, the LP’s wealth is represented
by V (P) = 2ℓP
1
2 (see Equation (7)). Thus, this condition ensures that the "virtual"
wealth associated with the liquidity at the current price remains stable, even as the
risky asset’s price fluctuates.
• From an economic perspective, the mispricing penalty can be viewed as a cost associ-
ated with the risk that other arbitrageurs might exploit the price discrepancy before
the current arbitrageur can react. This penalty reflects the competitive nature of
the arbitrage environment and the potential for missed opportunities due to delayed
actions.
• While our analysis focuses on the case without transaction costs and trading fees
for clarity, a similar analysis can be conducted for the more general case. However,
incorporating these factors involves significantly more technical details and is left for
future research.
Consider the value function
V (t,z) = VT (t,z) := sup
u∈A[t,T]
Ez
Z T
t
n
Zsus − λu2
s −
τ
2
Z2
s
o
ds

. (24)
The dynamic programming principle leads to the Hamilton-Jacobi-Bellman (HJB) equation:
0 = ∂tV + sup
u

σ2
2
∂zzV + (µ − u)∂zV + zu −
λ
2
u2
−
τ
2
z2

(25)
with the boundary condition V (T,z) = 0. The optimal control, u∗
, is
u∗
= argmax
u
{−u∂zV + zu −
λ
2
u2
} =
z − ∂zV
λ
. (26)
Substituting this into the HJB Equation yields
0 = ∂tV +
σ2
2
∂zzV + µ∂zV +
(z − ∂zV )2
2λ
−
τ
2
z2
(27)
with terminal condition V (T,z) = 0.24 S.-N. TUNG AND T.-H. WANG
Proposition 4.9. Let φ =
pτ
λ
and ξ = 1+
√
λτ
1−
√
λτ
. Define
h2(t) =
√
λτ
1 + ξe2φ(T−t)
1 − ξe2φ(T−t)
,
h1(t) =λµ(1 +
1
√
λτ
)

eφ(T−t)
+ e−φ(T−t)
− 2
ξeφ(T−t) − e−φ(T−t)

,
h0(t) =
Z T
t

σ2
2
h2(s) + µh1(s) +
1
2λ
h2
1(s)

ds.
Then, the value function for the control problem (24) is
VT (t,z) =
1
2
h2(t)z2
+ h1(t)z + h0(t).
Proof. Substituting the quadratic ansatz V (t,z) = 1
2
h2(t)z2
+ h1(t)z + h0(t) into the HJB
equation (27) and comparing coefficients, we obtain the following system of ODEs:
z2
: ḣ2 +
1
λ
(1 − h2)2
− τ = 0,
z : ḣ1 + µh2 −
1
λ
(1 − h2)h1 = 0,
1 : ḣ0 +
σ2
2
h2 + µh1 +
1
2λ
h2
1 = 0
with the terminal conditions h2(T) = h1(T) = h0(T) = 0. Solving this system of ODEs yields
the expressions for h2(t), h1(t), and h0(t) given in the proposition statement. A standard
verification argument, such as the one outlined in [Pha09, Theorem 3.5.2] is indeed the value
function for the control problem (24). □
Remark 4.10.
(1) While the closed-form solution for h0(t) is generally complex, it can be computed
using symbolic integration software like MATLAB. In the specific case where µ = 0,
the expressions for h1(t) and h0(t) simplify significantly:
h1(t) = 0, h2(t) = −
σ2
2φ
ln
ξ − 1
ξeφ(T−t) − e−φ(T−t)
.
(2) As T − t → 0+
and λ → 0+
, the optimal control approaches a "bang-bang" type
u∗
=



+∞ if z > 0;
0 if z = 0;
−∞ if z < 0,
This behavior illustrates why a myopic or impatient trader, whose trading rate is not
penalized (λ = 0), would optimally exploit any observed price discrepancy (mispric-
ing) z immediately.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 25
4.2.4. Discounted Infinite-Horizon Arbitrage Model. We now consider a single arbitrageur
who aims to maximize their discounted long-term profit:
sup
u∈A
E
Z ∞
0
e−ρt
(St − Pt)dxt

, (28)
where ρ is the discount rate. Applying similar arguments and assumptions as in Section
4.2.3, we can express the value function in logarithmic scale as
V (z) = Vρ(z) := sup
u∈A
Ez
Z ∞
0
e−ρt

Ztut −
λ
2
u2
t −
τ
2
Z2
t

dt

. (29)
This leads to the following HJB equation
ρV =
σ2
2
∂zzV + µ∂zV +
(z − ∂zV )2
2λ
−
τ
2
z2
. (30)
Proposition 4.11. Let
h2 = 1 +
ρλ
2
−
r
ρ2λ2
4
+ ρλ + τλ,
h1 = −
µ
ρ + τ
[(1 + ρλ)h2 − (1 − τλ)],
h0 =
1
ρ

σ2
2
+
ρµ2
(ρ + τ)2
(1 + ρλ)2
2

h2 +
µ2
(ρ + τ)2
(1 − λτ)(
τ
2
−
ρ2
λ
2
)

.
Then, the value function for the control problem (29) is
Vρ(z) =
1
2
h2z2
+ h1z + h0.
Proof. Substituting the quadratic ansatz V (z) = 1
2
h2z2
+ h1z + h0 into the HJB equation
(30) and comparing coefficients, we obtain the following system of equations:
z2
: ρh2 =
1
λ
(1 − h2)2
− τ,
z : ρh1 = µh2 −
1
λ
(1 − h2)h1,
1 : ρh0 =
σ2
2
h2 + µh1 +
1
2λ
h2
1.
The first equation is a quadratic equation for h2, which has two solutions
h±
2 = 1 +
ρλ
2
±
r
ρ2λ2
4
+ ρλ + τλ.
For each solution h±
2 , we can solve for h±
1 and h±
0 using the second and third equations,
respectively. This gives us two candidate value functions:
V ±
(z) = h±
2 z2
+ h±
1 z + h0.26 S.-N. TUNG AND T.-H. WANG
The corresponding optimal controls are
u±
(z) =
1 − h2
λ
z −
µ
ρ + τ

ρ + τ +
h2 − 1
λ

= ∓
r
ρ2
4
+
ρ
λ
+
τ
λ
−
ρ
2
!
z −
µ
ρ + τ

+ µ.
Substituting these controls into the SDE for the mispricing process (21), we get
dZ±
t = µ − u±
(Zt)

dt + σdWt = ∓
r
ρ2
4
+
ρ
λ
+
τ
λ
−
ρ
2
!
µ
ρ + τ
− Zt

dt + σdWt.
To determine the true value function, we apply the verification theorem [Pha09, Theorem
3.5.3], which requires that limsupT→∞ e−ρT
E[V (ZT )] = 0. A direct computation reveals
that this condition holds for V −
(z) but not for V +
(z). Therefore, the true value function is
V (z) = V −
(z), proving the proposition. □
Under the optimal arbitrage strategy
u∗
(z) =
r
ρ2
4
+
ρ
λ
+
τ
λ
−
ρ
2
!
z −
µ
ρ + τ

+ µ, (31)
the mispricing process Zt follows an Ornstein-Uhlenbeck (OU) process
dZt = (µ − u∗
(Zt))dt + σdWt =
r
ρ2
4
+
ρ
λ
+
τ
λ
−
ρ
2
!
µ
ρ + τ
− Zt

dt + σdWt.
4.2.5. Ergodic Arbitrage Model. Finally, we consider an arbitrageur aiming to maximize their
long-term average profit, formulated as
sup
ũ
lim
T→∞
1
T
E
Z T
0
(St − Pt)dxt

. (32)
Under the previous assumptions and simplifications, this reduces to
J(z;u) = lim
T→∞
1
T
E
Z T
0

Ztut −
λ
2
u2
t −
τ
2
Z2
t

dt

, η = sup
u∈A
J(z;u). (33)
Analyzing this problem by taking limits in the discounted infinite-horizon (ρ → 0) and
finite-horizon cases (T → ∞), we obtain:
To analyze the ergodic arbitrage problem (33), we follow the general method used in works
such as [AL98, ABG11]. By taking limits in the discounted infinite-horizon (ρ → 0) and
finite-horizon cases (T → ∞), we obtain:
Theorem 4.12. There exists a constant η̂ ∈ R such that for all z ∈ R,
η̂ = lim
ρ→0
ρVρ(z) = lim
T→∞
1
T
VT (0,z)A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 27
where Vρ and VT are the value functions defined in (29) and (24), respectively. Moreover,
η = η̂ =
σ2
2
+
µ2
2

1
τ
− λ

.
Proof. We first show that limρ→0 ρVρ(z) exists. From the explicit expression for Vρ derived
in Proposition 4.11, we have
lim
ρ→0
ρVρ(z) = lim
ρ→0
ρ

1
2
h2z2
+ h1z + h0

=
σ2
2
+
µ2
2

1
τ
− λ

.
This limit exists and is the same for all z ∈ R.
Next, we establish that limT→∞
1
T
VT (0,z) exists. From the explicit expression for VT from
Proposition 4.91
, we have
lim
T→∞
1
T
VT (0,z) = lim
T→∞
1
T

1
2
h2(0)z2
+ h1(0)z + h0(0)

=
σ2
2
+
µ2
2

1
τ
− λ

.
Again, this limit also exists and is finite for all z ∈ R.
Finally, we need to show that η = η̂, which is a consequence of [ABG11, Lemma 3.6.4]. □
Corollary 4.13. The optimal Markov control for the ergodic control problem (29) is
u∗
(z) =
r
τ
λ
z +

1 −
1
√
λτ

µ.
Furthermore, under this control, the mispricing process is driven by the OU process
dZt =
r
τ
λ
µ
τ
− Zt

dt + σdWt.
Proof. According to [ABG11, Theorem 3.6.6], the ergodic HJB equation for the control
problem (29) is
η = sup
u

σ2
2
∂zzV + (µ − u)∂zV + zu −
λ
2
u2
−
τ
2
z2

where η is the ergodic constant given in Theorem 4.12 and V is the relative value function,
uniquely defined up to a constant. The supremum is attained at u∗
, given again by equation
(26).
Using the ansatz V (z) = 1
2
h2z2
+ h1z + h0, we obtain the following system of equations:
1
λ
(1 − h2)2
− τ = 0,
µh2 −
1
λ
(1 − h2)h1 = 0,
σ2
2
h2 + µh1 +
1
2λ
h2
1 = η.
1To verify the case when µ ̸= 0, we utilize the explicit closed-form solution computed by MATLAB.28 S.-N. TUNG AND T.-H. WANG
To ensure that the optimal control belongs to the set of admissible controls, we select the
root h2 = 1 −
√
λτ. This leads to h1 = λµh2
1−h2
= µ(
q
λ
τ
− λ). Therefore, the optimal ergodic
control in feedback form is
u∗
(z) =
z − ∂zV
λ
=
(1 − h2)z − h1
λ
=
r
τ
λ
z +

1 −
1
√
λτ

µ.
The SDE for the mispricing process, Zt, follows immediately from substituting this control
into equation (21). □
5. Conclusion
This paper establishes a comprehensive mathematical framework for analyzing Concen-
trated Liquidity Market Makers (CLMMs) in continuous time, offering valuable insights into
these essential DeFi primitives. We introduce a novel approach to modeling liquidity pro-
files as measure-valued processes, precisely characterizing how concentrated liquidity affects
market behavior and trading outcomes. Our investigation of arbitrage dynamics reveals that
trading fees fundamentally constrain admissible price processes to those with finite varia-
tion, preventing infinite fee generation. This finding has significant implications for CLMM
design and highlights the need to adapt traditional continuous-time finance models for DeFi
applications.
Furthermore, we derive closed-form solutions for optimal arbitrage strategies under three
distinct scenarios: myopic arbitrage, finite-horizon optimization, and infinite-horizon opti-
mization with discounted and ergodic controls. These solutions provide a deeper under-
standing of how rational actors interact with CLMMs, influencing price discovery and mar-
ket efficiency. Notably, our analysis demonstrates that optimal arbitrage in the ergodic
case leads to an Ornstein-Uhlenbeck process for the mispricing process, suggesting a natural
mean-reversion tendency in CLMM markets.
Our framework illuminates practical considerations for CLMM design. The constraint on
price processes imposed by trading fees necessitates careful calibration of fee parameters to
balance revenue generation with market efficiency. Additionally, the relationship between
concentrated liquidity provision and market stability underscores the importance of well-
designed incentive mechanisms for optimal liquidity distribution. Our characterization of
price process behavior under different arbitrage models offers valuable guidance for develop-
ing robust and manipulation-resistant price oracles.
Future research directions include incorporating transaction costs and trading fees into the
arbitrage strategy analysis, developing optimal liquidity provision strategies under various
market conditions, investigating the impact of discrete block times on continuous-time ap-
proximations, analyzing the stability and convergence of complex fee structures, and studying
the interactions between diverse market participants. As DeFi continues to evolve, this rigor-
ous approach to analyzing market mechanisms will become increasingly crucial for informed
protocol design and optimization.A MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 29
Acknowledgement
We gratefully acknowledge the valuable feedback received from participants at seminars
and lectures delivered at Bocconi University, the Dipartimento di Scienze per l’Economia e
l’Impresa at the Università degli Studi di Firenze, and Ritsumeikan University. We extend
special thanks to Jimmy Risk for their contributions to generating figures from empirical
liquidity profiles and to Wun-Cing Liou for his assistance with Uniswap data collection.
S.-N. T. acknowledges the support of the National Science and Technology Council of Tai-
wan under grant number 111-2115-M-007-014-MY3. He expresses his gratitude to Shuenn-Jyi
Sheu and Wei-Cheng Wang for their insightful discussions and assistance, and to Jie-Hong
Lai for his help with MATLAB. T.-H. W. expresses his gratitude for the hospitality of the
Mathematics Division of the National Center for Theoretical Sciences during his stay in
Taipei in August 2024.
References
[ABG11] Ari Arapostathis, Vivek S. Borkar, and Mrinal K. Ghosh. Ergodic Control of Diffusion Pro-
cesses. Encyclopedia of Mathematics and its Applications. Cambridge University Press, Cam-
bridge, 2011.
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market makers.
In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies, AFT ’20,
pages 80–91, New York, NY, USA, 2020. Association for Computing Machinery.
[ACD+
23] Guillermo Angeris, Tarun Chitra, Theo Diamandis, Alex Evans, and Kshitij Kulkarni. The
geometry of constant function market makers. arXiv preprint arXiv:2308.08066, aug 2023.
[ACE22] Guillermo Angeris, Tarun Chitra, and Alex Evans. When does the tail wag the dog? curvature
and market making. Cryptoeconomic Systems, 2(1), June 2022.
[AKC+
21] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chi-
tra. An Analysis of Uniswap markets. Cryptoeconomic Systems, 0(1), apr 5 2021.
https://cryptoeconomicsystems.pubpub.org/pub/angeris-uniswap-analysis.
[AL98] M. Arisawa and P.-L. Lions. On ergodic stochastic control. Communications in Partial Differ-
ential Equations, 23(11-12):2187–2217, 1998.
[AZR20] Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core. https://uniswap.
org/whitepaper-v2.pdf, 2020. Accessed: December 25, 2024.
[AZS+
21] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap
v3 core, 2021. Accessed: December 25, 2024.
[BBB+
24] Philippe Bergault, Louis Bertucci, David Bouba, Olivier Guéant, and Julien Guilbert. Price-
aware automated market makers: Models beyond brownian prices and static liquidity. arXiv
e-prints, May 2024.
[CdL13] Rama Cont and Adrien de Larrard. Price dynamics in a Markovian limit order market. SIAM
Journal on Financial Mathematics, 4(1):1–25, 2013.
[CDSB+
23] Álvaro Cartea, Fayçal Drissi, Leandro Sánchez-Betancourt, David Siska, and Lukasz Szpruch.
Automated market makers designs beyond constant functions. SSRN, May 2023.
[CDX23] Rama Cont, Pierre Degond, and Lifan Xuan. A mathematical framework for modeling order
book dynamics. arXiv e-prints, page arXiv:2302.01169, February 2023.
[CJ21] Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges.
arXiv preprint arXiv:2103.08842, 2021.
[CM21] Rama Cont and Marvin S. Müller. A stochastic partial differential equation model for limit
order book dynamics. SIAM Journal on Financial Mathematics, 12(2):744–787, 2021.
[CST10] Rama Cont, Sasha Stoikov, and Rishi Talreja. A stochastic model for order book dynamics.
Operations Research, 58(3):549–563, 2010.30 S.-N. TUNG AND T.-H. WANG
[EGM23] Mnacho Echenim, Emmanuel Gobet, and Anne-Claire Maurice. Thorough mathematical mod-
elling and analysis of uniswap v3. Working paper or preprint, September 2023.
[Eva21] Alex Evans. Liquidity Provider Returns in Geometric Mean Markets. Cryptoeconomic Systems,
1(2), oct 22 2021. https://cryptoeconomicsystems.pubpub.org/pub/evans-g3m-returns.
[FMW23a] Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Model-free hedging of impermanent loss
in geometric mean market makers. arXiv e-prints, 2023.
[FMW23b] Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Weighted variance swaps hedge against
impermanent loss. Quantitative Finance, 23(6):901–911, 2023.
[GM23] Emmanuel Gobet and Anastasia Melachrinos. Decentralized finance & blockchain technology.
In SIAM Financial Mathematics and Engineering 2023, Philadelphia, United States, Jun 2023.
[GPW+
13] Martin D. Gould, Mason A. Porter, Stacy Williams, Mark McDonald, Daniel J. Fenn, and
Sam D. Howison. Limit order books. Quantitative Finance, 13(11):1709–1742, 2013.
[HRS+
21] C.R. Harvey, A. Ramachandran, J. Santoro, F. Ehrsam, and V. Buterin. DeFi and the Future
of Finance. Wiley, 2021.
[HSW23] Lioba Heimbach, Eric Schertenleib, and Roger Wattenhofer. Risks and returns of uniswap
v3 liquidity providers. In Proceedings of the 4th ACM Conference on Advances in Financial
Technologies, AFT ’22, pages 89–101, New York, NY, USA, 2023. Association for Computing
Machinery.
[Loe22] Stefan Loesch. The quantitative finance aspects of automated market makers in defi. arXiv
preprint arXiv:2212.10974, December 2022.
[LTW24] Cheuk Yin Lee, Shen-Ning Tung, and Tai-Ho Wang. Growth rate of liquidity provider’s wealth
in g3ms. arXiv e-prints, 2024.
[MM19] Fernando Martinelli and Nikolai Mushegian. Balancer: A non-custodial portfolio manager,
liquidity provider, and price sensor. https://balancer.fi/whitepaper.pdf, 2019. Accessed:
December 25, 2024.
[MMR23a] Jason Milionis, Ciamac C. Moallemi, and Tim Roughgarden. Automated market making and
arbitrage profits in the presence of fees. arXiv preprint arXiv:2305.14604, 2023.
[MMR23b] Jason Milionis, Ciamac C. Moallemi, and Tim Roughgarden. Complexity-approximation trade-
offs in exchange mechanisms: Amms vs. lobs. In Financial Cryptography and Data Security:
27th International Conference, FC 2023, Bol, Brač, Croatia, May 1–5, 2023, Revised Selected
Papers, Part I, pages 326–343, Berlin, Heidelberg, 2023. Springer-Verlag.
[MMRZ22a] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated
market making and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046, 2022.
[MMRZ22b] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Quantifying
loss in automated market makers. In Proceedings of the 2022 ACM CCS Workshop on Decen-
tralized Finance and Security (DeFi’22), pages 71–74, New York, NY, USA, 2022. Association
for Computing Machinery.
[NTYY24] Joseph Najnudel, Shen-Ning Tung, Kazutoshi Yamazaki, and Ju-Yi Yen. An arbitrage driven
price dynamics of automated market makers in the presence of fees. Frontiers of Mathematical
Finance, 3(4):560–571, 2024.
[Pha09] Huyên Pham. Continuous-time Stochastic Control and Optimization with Financial Applica-
tions. Stochastic Modelling and Applied Probability. Springer Berlin, Heidelberg, 2009.
[UBY24] Andrey Urusov, Rostislav Berezovskiy, and Yury Yanovich. Backtesting framework for concen-
trated liquidity market makers on uniswap v3 decentralized exchange. arXiv e-prints, October
2024.
Shen-Ning Tung
Department of Mathematics,
National Tsing Hua University
No. 101, Sec. 2, Guangfu Rd., Hsinchu, Taiwan
Email address: tung@math.nthu.edu.twA MATHEMATICAL FRAMEWORK FOR MODELLING CLMM DYNAMICS IN CONTINUOUS TIME 31
Tai-Ho Wang
Department of Mathematics
Baruch College, The City University of New York
## 1 Bernard Baruch Way, New York, NY10010
and
Department of Mathematical Sciences,
Ritsumeikan University
1-1-1 Nojihigashi, Kusatsu, Shiga, 525-8577, Japan
Email address: tai-ho.wang@baruch.cuny.edu