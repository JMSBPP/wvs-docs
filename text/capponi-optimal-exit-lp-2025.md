---
sha256: adafa768826bcc320896fc577bbcc0120e27a8121ad6979d641d9707c04c30de
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 67110
---
Optimal Exiting for Liquidity Provision in
Constant Function Market Makers
Agostino Capponi∗
and Brian Zhu†
Abstract
Providing liquidity to constant function market makers is often less profitable or favorable
than simply holding assets, primarily because of impermanent loss. Using an optimal stopping
approach, we show the existence of liquidity provision strategies that are profitable (excluding
infrastructural fees) relative to holding, in which a liquidity provider (LP) exits the pool when
the price ratio first hits certain thresholds. For the constant product pricing function, we derive
closed-form solutions for the optimal thresholds. We demonstrate that pricing functions can be
designed to maximize the expected time an optimally-acting LP exits the pool and backtest our
strategy on Uniswap v2 data.
The authors are grateful to participants at the 2024 INFORMS Annual Meeting and 2024 Peter Carr Conference
on Mathematical Finance for valuable comments and discussion.
∗
Columbia University, Department of Industrial Enginering and Operations Research; ac3827@columbia.edu.
†
Columbia University, Department of Industrial Enginering and Operations Research; bzz2101@columbia.edu.1 Introduction
Decentralized exchanges (DEXs) are the leading category within decentralized finance (DeFi), rep-
resenting 40% of the market share.1 DEXs enable users to provide liquidity and trade directly
on a peer-to-peer system, eliminating the need for intermediaries. Most DEXs utilize automated
market makers (AMMs), enabling liquidity providers (LPs) and traders to interact with a liquidity
pool instead of being directly matched with each other. Pricing is determined through predefined
pricing functions. The vast majority of AMMs use the constant function market maker (CFMM)
mechanism, where trading and liquidity provision are governed by the requirement to maintain a
specific invariant of a bivariate function. A distinguishing feature of CFMMs is the introduction of
passive liquidity provision: unlike traditional limit order books, where market makers actively man-
age liquidity through continuous submission of limit orders, users in a DEX can deposit liquidity
into the pool without needing to constantly offer quotes or monitor the market.
However, liquidity provision in DEXs is often unprofitable, particularly in pools where at least
one coin is risky, both in absolute terms and also relative to simply holding one’s assets. One
significant factor contributing to this unprofitability is the impermanent loss created by the CFMM
pricing function, where an LP’s deposited assets change in quantity and value due to arbitrage trades
on the DEX (Capponi and Jia (2021)). Given the importance of liquidity pool depth on execution
prices for traders and the functionality of DEXs as a whole, many market design solutions have been
proposed to alleviate or eliminate the issue caused by impermanent loss and arbitrage risk. These
include modifications to blockchain infrastructure (Milionis, Moallemi, and Roughgarden (2022b)),
adaptive fees based on token pair volatility (Cao, Falk, and Tsoukalas (2024)), optimally designing
the pricing function for LPs (Capponi and Chen (2024)), and allowing for novel forms of liquidity
provision such as just-in-time liquidity (Capponi, Jia, and Zhu (2023)).
This paper examines the decision-making challenge faced by liquidity providers (LPs) in deter-
mining an optimal policy for exiting a liquidity pool, with the goal of balancing trading fee revenue
against impermanent loss.2 We consider a CFMM managing a pair of tokens, a risky and stable
coin, and model the LP’s decision problem as an optimal stopping problem. The LP selects an exit
policy that maximizes their payoff relative to just holding their assets off chain. This payoff consists
of a running reward which captures fee revenue earned from providing liquidity to the liquidity pool
and a terminal penalty capturing the impermanent loss, the difference in value of assets deposited
in a liquidity pool relative to holding them outside the pool due to traders swapping with the pool,
incurred at the time of withdrawal. As the impermanent loss heavily depends on the risky coin’s
price at time of withdrawal compared to the price at time of deposit, a natural class of exit policies
is given by first hitting times of the price process, i.e. the LP withdraws whenever the risky coin’s
price hits a threshold. In our model, given the price at the time when the LP supplied liquidity, the
LP chooses an upper and lower price threshold to dictates their exit policy.
1
For details, see https://www.coingecko.com/research/publications/defi-categories-market-share.
2
Li et al. (2024) study a model of active LPs who can continuously rebalance between their personal wallets and
liquidity pool, in contrast with our one-shot decision.
1Since the downside risk of impermanent loss is bounded above, there is no lower price threshold
at which it is more beneficial for an LP to withdraw liquidity than to remain invested in the pool;
LPs can simply recover their bounded impermanent loss by earning fees from trades on the DEX.
In contrast, the upside risk of impermanent loss is unbounded, and we demonstrate that for a broad
class of pricing functions, there exists a unique upper price threshold that maximizes an LP’s payoff
relative to simply holding the assets. It is important to note that while tokens with higher volatility
tend to be prone to higher impermanent loss, the primitive factor that governs impermanent loss is
the difference in price relative to the price at deposit. While price changes in both directions result
in impermanent loss, price increases are of greater concern as the potential losses can be unbounded.
The assymetry of limited downside but unlimited upside resembles going long a put option or short
a call option, revealing a similarity between liquidity provision on AMMs and traditional derivatives
markets.3
Importantly, we show that a liquidity provider’s expected payoff when using the optimal price
threshold strategy is greater than the payoff resulting from holding the assets off-chain. This implies
that, if one disregards infrastructural fees paid to the builders and validators involved in the block
production process, also referred to as gas fees, liquidity provision can be profitable in expectation.
When gas fees are low or negligible, as is the case on typical Layer 2 networks, our model provides
an alternative strategy for LPs to mitigate losses: rather than altering the market design of DEXs,
LPs can strategically time their exits from the pool to optimize their outcomes.
Our optimal stopping approach can be used to design pricing functions based on how long an
optimally-behaving LP will keep their liquidity in the pool. Under this framework, a higher optimal
upper price threshold, which corresponds to a longer expected time in the pool, is more desirable as
it keeps an optimally-exiting LP in the pool for longer. Unlike existing approaches that emphasize
welfare (Capponi and Jia (2021)) or trading efficiency (Goyal et al. (2023)), our approach focuses
exclusively on value locked in the AMM pool.
We derive a formula for impermanent loss that depends solely on token prices and the curvature
of the pricing function. This formula reflects the heuristic that greater curvature (or convexity) in
the pricing function correspond to lower impermanent loss.4 When market parameters, particularly
the fee reward rate, are held constant, selecting a pricing function with a larger overall curvature
increases the optimal upper price threshold. However, in practice, greater curvature also increases
slippage for traders, which may reduce the overall trading volume on the AMM. To address this,
we examine a parametric family of pricing functions where the “overall curvature” increases in the
parameter value while the fee reward rate decreases in the parameter value. Under certain conditions
on the parametric family and fee structure, we demonstrate that there exists a unique parameter
value that maximizes the LP’s optimal upper price threshold. Furthermore, this maximizer lies in
the interior of the parameter space, indicating that the optimal AMM design based on our criterion
achieves a balance between the benefits to traders and LPs.
3
Milionis et al. (2022) provides another similarity, deriving an equivalence between the loss-versus-rebalancing
metric and a bet on asset price volatility.
4
See Capponi and Jia (2021) and Fabi and Prat (2023), for example.
2Literature Review. Our study contributes to the literature on arbitrage risk facing liquidity
providers in AMMs. Capponi and Jia (2021) show that arbitrage loss to passive LPs is inevitable in
AMMs given the pricing function and transaction execution mechanisms of blockchains, which may
cause liquidity freezes when price ratios are highly volatile. Their model is extended in Capponi,
Jia, and Zhu (2023) to delineate conditions under which the active liquidity provision mechanism
of just-in-time liquidity benefits passive LPs. Hasbrouck, Rivera, and Saleh (2022) demonstrate the
importance of transaction fees in AMMs to attract liquidity and counteract arbitrage losses. Fabi
and Prat (2023) study the economics of CFMMs, demonstrating that the interests of traders and
LPs are at odds with each other.
Many studies within this stream of literature model time as continuous. Milionis et al. (2022)
introduce and study the dynamics of loss-versus-rebalancing (LVR), an arbitrage loss metric when
LPs can hedge their position via a rebalancing trading strategy. Milionis, Moallemi, and Rough-
garden (2022b) examine LVR under Poisson block times and non-negligible transaction fees for
arbitrageurs. Li et al. (2023) study a stochastic control problem for LPs that incorporates fee APR,
impermanent loss, and gas fees. They find that LPs enter pools when APR is high and gas fees are
low, and exit pools when the opposite holds.
Our work contributes to this strand of literature by taking an novel optimal stopping approach
to liquidity provision. Noting that impermanent loss is highly depend on token prices at time of
entry and exit, we examine the incentives behind liquidity provision when LPs can carefully choose
when to exit the pool. Whereas previous works typically treat LPs as passive or active in some form
(e.g. rebalancing, just-in-time liquidity), the LP in our model can be considered as “semi-active”
due to their ability to time their exit.
We provide another method to mitigate losses for liquidity providers. Existing literature has
largely focused on changes to blockchain infrastructure and the market design of DEXs. Milionis,
Moallemi, and Roughgarden (2022b) suggest that faster intervals between the production of blocks
reduces arbitrage profits. Canidio and Fritsch (2023) propose an AMM design with batch auctions
that eliminates arbitrage profits in expectation. Capponi, Jia, and Zhu (2023) show that different
fee tiers for active and passive LPs allow just-in-time liquidity to benefit passive LPs. Adams
et al. (2024) propose auctions for “pool manager” rights and dynamic fees to achieve higher levels of
liquidity on AMM pools. Relative to these works, we instead focus on what an LP can do themselves
to mitigate arbitrage losses within the classical framework of a CFMM with fixed fees. Our model
suggests that optimally-timed withdrawals from a liquidity pool resolve the impermanent loss issue
and generate profits in expectation.
Some studies focus on liquidity provision strategies for AMMs that use the “concentrated liq-
uidity” mechanism, such as Uniswap v3 (Adams et al. (2021)). Fan et al. (2023) use a framework
based on neutral networks to solve a dynamic optimization problem for LPs, and Cartea, Drissi, and
Monga (2024) formulate a stochastic control problem to derive optimal LP “spreads” on Uniswap v3.
These strategies are tailored to sophisticated LPs, whereas our model and results are implementable
by more passive LPs.
3There is also a body of literature on designing the optimal pricing function given some criterion
for evaluation. Capponi and Jia (2021) derive the socially optimal pricing function from a parametric
family of pricing functions. Goyal et al. (2023) find optimal pricing functions given a distribution of
price ratios based on a measure of trading efficiency. Milionis, Moallemi, and Roughgarden (2022a)
take a Myersonian approach to designing AMMs based on an LP’s beliefs on trading demand and
token prices. Compared with the rest of the literature, we offer a novel criterion for pricing function
optimization based on how long an optimally-exiting LP stays in a liquidity pool. Our model is
applicable to various parametric families of pricing curves that satisfy certain properties.
## 2 Background
## 2.1 Decentralized Exchanges
Decentralized exchanges allow for the liquidity provision and trading of tokens on blockchains via
smart contracts. DEXs consist of automated market makers: smart contracts that use liquidity pools
and pricing function to algorithmically determine quotes for traders. In contrast to limit order books
in which buyers and sellers are matched, liquidity providers and liquidity demanders interact with
the liquidity pool rather than with each other. Many AMMs support exchanges between two tokens,
but there exist a sizable number of AMMs that allow for exchanges between three or more tokens
(e.g. Balancer and Curve).
LPs deposit tokens into the liquidity pool, with the relative quantities of each token determined
by the pricing function that preserves the pre-existing marginal exchange rate, or spot rate, in the
pool. In return, the LP receives some certificate demonstrating their stake in the pool based on the
value of their deposit. In Uniswap v2, for example, LPs receive some amount of pool tokens that
represents their proprotional stake in the pool, while in Uniswap v3, a single non-fungible token
(NFT) tracks their liquidity position. LPs may choose to exit from the pool at any time, receiving
their stake of the liquidity pool’s value upon withdrawal.
Liquidity demanders, or traders, submit orders to exchange one token for another. The traded
quantities must preserve an invariant determined by the pricing function. The quantities of valid
trades implicitly determine relative prices for swapping. For most pricing functions, trading costs
increase in the trade size and decrease in the depth of the liquidity pool. In additional to the price
impact generated by the pricing function, traders also pay a transaction fee proportional to their
trade size, with the proportional rate typically being pre-determined by the AMM. For example,
Uniswap v2 sets a fixed 0.3% fee across all of its pools, while Uniswap v3 allows for multiple fee
tiers, ranging from 0.01% to 1%. The trading fee either goes into the liquidity pool, directly to the
LPs, or to the AMM. This incentivizes LPs to deposit and contributes to the upkeep of the AMM.
## 2.2 Constant Function Market Makers
The oldest type of AMM is the constant function market maker (CFMM). To offer an example, we
consider the constant product pricing function F : R2
+ → R+ for a CFMM between tokens X and Y,
4given by F(x,y) = xy, where x and y are the quantities of token X and Y, respectively. To maintain
the CFMM’s spot rate, LPs need to deposit equal values of both tokens. Suppose that there are 10
tokens X and 20 tokens Y already in the pool, with token X having twice the price of token Y. An
LP can then deposit 2 tokens X and 4 tokens Y into the pool for a one-sixth stake in the pool. With
the resulting pool reserves being x = 12 and y = 24, the CFMM invariant is F(x,y) = 288. A trader
can then trade in 6 tokens X for 6 tokens Y, moving the reserves to x′ = 16 and y′ = 18, preserving
the invariant level of 288 under F. Observe that the execution price is 1 while the fundamental price
ratio is 1/2. If the LP were to withdraw after the trade, their one-sixth stake means that the LP
receives back 8/3 tokens X and 3 tokens Y upon exit. A more formal treatment of CFMMs is found
in the next section. Recent innovations in AMM design have introduced new types of AMMs. One
such example is the concentrated liquidity market maker (CLMM), which allows for LPs to choose
the price range in which their liquidity can be used for trades, making CLMMs somewhat resemble
traditional LOBs. For the remainder of this paper, we restrict our attention to CFMMs.
## 2.3 Impermanent Loss
One particular feature of CFMMs is impermanent loss: when changes in fundamental prices and
arbitrage trades result in an LP’s value in the liquidity pool being lower than an LP’s value from
simply holding the tokens. To see a simple example of this, suppose that initial price of token X is
pX = 1 and that token Y is the numeraire. An LP deposits 2 tokens X and 2 tokens Y into an AMM
with the pricing function F(x,y) = xy and no pre-existing liquidity. Now, suppose that pX jumps
to 4, and a arbitrageur trades in 2 tokens Y for 1 token X, bringing the pool reserves to x = 1 and
y = 4. The value of the pool is 4×1+1×4 = 8, while the value from holding the original quantity
of assets, evaluated at the currenct token prices, is 4 × 2 + 1 × 2 = 10. The difference 8 − 10 = −2
is the impermanent loss. As pX further increases, the impermanent loss worsens, and LPs incur
impermanent loss when pX decreases as well. However, if an LP withdraws from the pool when the
price of token X is the same as that at the time of deposit, then impermanent loss is completely
mitigated due to reverse trades by arbitrageurs. Our paper takes a particular focus on this aspect
of CFMMs, balancing loss mitigation with revenue from transaction fees.
## 3 Model
Asset Price Dynamics. Time is continuous on R+. Let (Ω,F,{Ft}t∈R+,P) be a filtered proba-
bility space and {Wt} be an {Ft}-adapted Wiener process. There is a risky coin X with fundamental
price Pt at time t and a stable coin Y with price 1 at all times. The risky coin’s price process {Pt}
follows a geometric Brownian motion governed by the stochastic differential equation
dPt = µPt dt + σPt dWt
where µ ∈ R is the drift parameter and σ > 0 is the volatility parameter. The risk-free rate is r > 0.
5Constant Function Market Maker. There is a CFMM for exchanging the risky and stable
coins with fee tier f. We work with the class of pricing functions that satisfy Assumption 1 below.5
Assumption 1. The CFMM’s pricing function F : R2
+ → R+ satisfies the following properties:
(i) Fx,Fy > 0 and F2
y Fxx − 2FxFyFxy + F2
xFyy < 0;
(ii) F is k-homogeneous, i.e. there exists k > 0 such that F(cx,cy) = ck · F(x,y) for all c > 0;
(iii) limx→0 Fx/Fy = ∞, limx→∞ Fx/Fy = 0, limy→0 Fx/Fy = 0, and limy→∞ Fx/Fy = ∞.
Liquidity provision and trading on the CFMM works as follows. Suppose that at time t, there
are Xt risky coins and Yt stable coins. A liquidity provider who wishes to deposit dX risky coins
and dY stable coins at time t must have dX and dY preserve the liquidity pool’s spot rate, which
we assume is aligned with the fundamental price due to the presence of arbitrageurs:
Fx(Xt + dX,Yt + dY )
Fy(Xt + dX,Yt + dY )
= Pt.
Let It = F(Xt,Yt). A trader who wishes to trade qX risky coins for qY stable coins at time t must
have qX and qY preserve the liquidity pool’s invariant level It prior to the trade:
F(Xt + qX,Yt + qY ) = It.
Arbitrageurs, Pool Value Function, and Impermanent Loss. We assume that a population
of arbitrageurs continuously monitors the CFMM’s liquidity pool to align the CFMM’s marginal
price, i.e. Fx/Fy, with the fundamental price of the risky coin. This assumption captures the fact
that due to priority fee bidding, LPs almost always have their transactions ordered after those of
arbitrageurs.
Milionis et al. (2022) show that given an invariant level I, the value of pool reserves under the
presence of arbitrageurs when the price is P, denoted by V (P;I) or V (P) in short, solves the pool
value problem given by
V (P;I) = min
(x,y)∈R2
+
(Px + y)
subject to F(x,y) = I.
We show in the appendix that V (P) is well-defined when F satisfies Assumption 1. Capponi and
Jia (2021) show that arbitrageurs solve a similar problem, framed in terms of the CFMM’s trading
function and incorporating a transaction fee.
Impermanent loss can be concisely characterized in terms of the pool value function. Suppose
that a liquidity provider deposits x0 risky coins and y0 stable coins at time 0. Let I0 = F(x0,y0).
5
Assumption 1 results in a slightly broader class of pricing functions than the class considered in Capponi and
Jia (2021): the “convexity” property (Fxx < 0, Fyy < 0 and Fxy > 0) in Capponi and Jia (2021) is sufficient for
F2
y Fxx − 2FxFyFxy + F2
x Fyy ≤ 0.
6In the appendix, we show that this LP’s share of the total pool value is equivalent to solving the
pool value problem at invariant level I0. In other words, let the total pool reserves at time t, under
the presence of arbitrageurs, consist of Xt risky coins and Yt stable coins. Let It = F(Xt,Yt) and
wt be the LP’s share of the pool at time t. Then
wt · V (Pt;It) = V (Pt;I0)
Note that this LP’s share of the pool value only depends on the price process and the initial invariant
level of the deposit. Had the LP held the assets, their value at time t, denoted by Vh, would be
Vh(Pt) = Ptx0 + y0.
The per-unit impermanent loss of the LP, denoted by L, is the difference in value between holding
x0 risky coins and y0 stable coins versus providing liquidity to the CFMM, normalized by x0, i.e.
L(Pt) =
V (Pt;I0) − Vh(Pt)
x0
.
Since Vh(Pt) is the value of a suboptimal solution to a minimization problem whose optimal value
is given by V (Pt;I0), it follows that L(Pt) ≤ 0 for all Pt ∈ R+.
Noise Traders and Trading Fees. There is a population of noise traders such that the combined
instantaneous trading volume (of both the arbitrageurs and noise traders) is of the form ν·x∗(P0;It),
where x∗(P0;It) solves the pool value problem at P0 ant It. The increasing trading intensity with
respect to pool depth reflects the increased order flow volume attracted by a deeper market with
better execution prices, and the specific functional form allows an individual liquidity provider’s
instantaneous fee reward rate, the pro-rata share of fees denoted by ϕ ∈ R+, to be constant.6
The Liquidity Provider’s Problem. We consider the perspective of a single liquidity provider
in a CFMM, focusing on the management of a liquidity position in a one-shot setting, and do not
consider subsequent positions that the LP may take. Our modeling assumptions result in the LP’s
problem being agnostic to the behavior of and strategic interaction between other LPs in the pool.
At time t = 0, the LP deposits x0 risky coins and y0 stable coins in the liquidity pool of the CFMM.
While the LP’s assets are locked in the pool, the LP earns an per-unit instantaneous fee reward rate
of ϕ ∈ R+. Upon withdrawal at a stopping time T (with respect to F), the LP incurs a per-unit
impermanent loss of L(PT ). Discounting by rate r > 0, the LP’s expected payoff relative to holding
the same quantity of assets is thus
E
Z T
0
e−rt
ϕdt + e−rT
· L(PT )

.
6
The assumption that noise trading volume increases in pool size can be microfounded via a noise trader that has
a private value of the risky coin (see Capponi, Jia, and Zhu (2023), for instance).
7Restricting the action set of the LP to a family of stopping times T , the LP’s problem is to choose
the stopping time that maximizes their payoff relative to holding, i.e.
sup
T∈T
E
Z T
0
e−rt
ϕdt + e−rT
· L(PT )

.
The family of stopping times we consider is the one generated by two-sided hitting times. For
PL < P0, let T(PL) = inf{t ∈ R+ : Pt ≤ PL} and for PU > P0, let T(PU) = inf{t ∈ R+ : Pt ≥ PU}.
Let T(PL,PU) = min{T(PL),T(PU)}; then we can express T as
T = {T(PL,PU) : PL < P0, PU > P0}.
Discussion of Assumptions and AMM Loss Metrics. Although blockchain transactions are
settled in discrete blocks, we assume that time is continuous (similar to Milionis et al. (2022) and Li
et al. (2023), for example), allowing us to use stochastic control theory and HJB equations to solve
the LP’s problem. Whereas several studies micro-found trading behavior on DEXs, we instead use
a reduced-form model of trading given by an intensity that increases with respect to the invariant
level. The trading intensity scales in such a way that any LP’s fee rewards from providing liquidity
is constant regardless of the LP’s stake in the pool; the constant rate ϕ is critical to the tractability
of the HJB equation and independence of the LP’s problem on other LPs in the liquidity pool.
Impermanent loss and loss-versus-relabancing (LVR) are two related but different measures of
value lost to arbitrageurs on CFMMs. Milionis et al. (2022) describe impermanent loss as “loss-
versus-holding” and show that it can be decomposed into the sum of two components: LVR and
market risk, where the market risk component can be either positive or negative. LVR thus mea-
sures the risk of providing liquidity that cannot be hedged away by a rebalancing trading strategy,
while market risk is incorporated into the impermanent loss. For more passive or semi-active LPs,
impermanent loss may be more applicable since these types of LPs could be unable or not well-
capitalized enough to implement the rebalancing strategy. Additionally, LVR is path-dependent
and cannot be used as the “terminal reward” component in a standard stochastic control setting.
## 4 Optimal Exiting Policies
We reparameterize the LP’s problem in terms of log-prices. Let pt = log Pt/P0 denote the log-
(relative) price. Then the log-price process follows the stochastic differential equation given by
dpt = µ̃dt + σ dWt
where µ̃ = µ − σ2/2. Let ℓ denote the per-unit impermanent loss function in terms of log-prices
with the relation between the two given by
ℓ(pt) = L(P0 exppt).
8As the fee reward rate does not depend on price, the reparameterized problem is given by
sup
T∈T
E
Z T
0
e−rt
ϕdt + e−rT
· ℓ(pT )

.
The reparameterized family of stopping times is now
T = {T(pL,pU) : pL < 0, pU > 0}
where T(pL) = inf{t ∈ R+ : pt ≤ pL} for pL < 0 and T(pU) = inf{t ∈ R+ : pt ≥ pU} for pU > 0.
We can write the problem as
sup
(pL,pU):pL<0,pU>0
E
Z T
0
e−rt
ϕdt + e−rT
· ℓ(pT )

.
In other words, we are interested in the optimal exit policy that can be characterized by an log-price
interval (pL,pU) where pL < 0 and pU > 0 such that the LP exits the pool when the log-price is
first outside this interval.
Theorem 4.1. There exists a unique optimal solution (p∗
L,p∗
U) to the LP’s problem in which:
• p∗
L = −∞;
• p∗
U ∈ (0,∞) if r ≤ µ and p∗
U = ∞ otherwise;
• v(0;p∗
L,p∗
U) > 0, i.e. expected payoff is positive.
This means that there is no lower price threshold at which withdrawing yields a higher payoff
in expectation relative to holding. As impermanent loss is bounded when the price decreases, given
the same fee reward rate ϕ, it is better for LPs to stay in the pool and recuperate their impermanent
loss via fees. Thus, the downside risk of providing liquidity to a CFMM is bounded and can be
covered by incentives for liquidity provision. However, upside impermanent loss is unbounded, which
significantly affects how the optimal upper price threshold is determined.
On the other hand, impermanent loss is unbounded as price tends to infinity. For the LP, there is
now a tradeoff between worsening impermanent loss as the price increases and the inability to earn
fees upon withdrawal from the pool. The above theorem shows that for a CFMM pricing function
that satisfies Assumption 1, there exists a unique policy that maximizes expected payoff relative
to holding among all upper price threshold policies. Moreover, the fact that v(0) > 0 implies that
the optimal policy yields a positive expected payoff relative to holding, net of infrastructural fees,
giving rise to a profitable liquidity provision strategy when network fees are negligible.
In the case where µ is not sufficiently large relative to r, then the optimal upper price threshold
is also infinite. The intuition is that for fixed stopping times T, smaller values of µ correspond to
longer expected times in the pool, i.e. larger E[T]. This means that there are more fees accumulated
and a smaller discounted impermanent loss incurred, with upon exiting the pool, with the latter
9force outweighing the former, relative to a larger value of µ which corresponds to a shorter expected
time in the pool.
Comparative Statics with Respect to Price and Trading Dynamics. Having established
the existence and uniqueness of an optimal upper price threshold for a class of pricing functions, we
now examine how this threshold varies as market parameters, i.e. the price process and fee reward
rate change. Besides the market parameters, the other main determinant of the optimal threshold
is the pricing function, which we take a closer look at in the following section. The following result
characterizes the comparative statics.
Theorem 4.2. If r is sufficiently small,7 then the optimal upper price threshold p∗
U increases in ϕ
and decreases in µ and σ.
These results are fairly intuitive. A larger value of µ, meaning a more positive drift of the price
process, drives p∗
U down as the upside risk increases, raising the chance for potentially unbounded
losses. Higher volatility increases price uncertainty, leading to a similar increase in the upside
risk. This finding is in line with other results in the literature, particularly that LVR is proxied
by volatility and the quadratic variation of the price process. Thus, upward price movement and
volatility disincentivize liquidity provision due to a larger expected impermanent loss. An increase
in the fee reward rate, on the other hand, incentivizes liquidity provision as LPs will want to stay
longer in pool and earn the extra fees, holding all other parameters fixed.
Example: Constant Product Function We derive the impermanent loss function and resulting
optimal upper price threshold for the constant product function as an example. The constant
product function, used on Uniswap v2 and on many other DEXs, is given by F(x,y) = xy. Solving
the pool value problem for invariant level I yields optimal reserves and a pool value of
(x∗
(P),y∗
(P)) =

I1/2
P−1/2
,I1/2
P1/2

,
V (P) = 2I1/2
P1/2
.
For the constant product function, the LP’s initial deposit of x0 risky coins and y) stable coins must
satisfy y0/x0 = P0 and x0y0 = I0, so we have
Vh(P) = Px0 + y0(P + P0)x0,
V (P) = 2(x0y0)1/2
P1/2
= 2P
1/2
0 P1/2
x0.
Thus, the impermanent loss function is given by
L(P) =
V (P) − Vh(P)
x0
= 2P
1/2
0 P1/2
− (P0 + P).
7
Specifically, we require r ≤ µ for p∗
U to be finite.
10Note that the impermanent loss under the constant product function is twice the difference between
the geometric and arithmetic means. Let p = logP/P0. Then the impermanent loss function in
log-prices is
ℓ(p) = P0

2exp
p
2
− expp − 1

.
Solving the optimal stopping problem results in an optimal upper price threshold p∗
U of
p∗
U = 2log
1 − 2ξ+ +
q
1 + 4
P0
ξ+(1 − ξ+)ϕ
r
2(1 − ξ+)
where ξ+ is the positive solution to r = µ̃ξ+ 1
2σ2ξ2. We can then verify that the comparative statics
results of Theorem 4.2 hold for the closed-form solution given above.
## 5 Optimal Pricing Functions
Comparative Statics with Respect to the Pricing Function. Having analyzed the com-
parative statics of the optimal upper price threshold with respect to market parameters, we now
explore how the shape of the pricing function itself affects the optimal threshold. The pricing
function affects the LP’s optimal stopping problem through the impermanent loss function in the
terminal reward (or penalty in this case), which we find is closely related to the curvature of the
pricing function. Our definition of the curvature function given a pricing function, price level, and
invariant level, is provided below. This is the standard notion of curvature for the level set of a
parametric curve in two dimensions, in this case given by F(x,y) = I. In this context, the curve is
parameterized by the token price P and evaluated at the no-arbitrage reserve quantities at P.8
Definition. Let F be some pricing function. The curvature function of F at price P and invariant
level I, denoted κ(P;I), is
κ(P;I) =
|F2
y Fxx − 2FxFyFxy + F2
xFyy|
(F2
x + F2
y )3/2
(x∗(P;I),y∗(P;I))
where (x∗(P;I),y∗(P;I)) solves the pool value problem at price P and invariant level I.
Proposition 5.1. If a LP deposits x0 risky coins and y0 stable coins at t = 0, then the LP’s per-unit
impermanent loss function L at price P is
L(P) =
1
x0
Z P
P0
π − P
κ(π;I0)

1
1 + π2
3/2
dπ
where I0 = F(x0,y0).
8
The curvature function is connected to the notion of “slippage” in Fabi and Prat (2023): specifically, κ(P) is
equal to the slippage evaluated at reserves (x∗
(P),y∗
(P)) scaled by (1 + P2
)−3/2
.
11With this notion of curvature, we can express the impermanent loss as a function of price
and curvature. The formula in Proposition 5.1 reveals that impermanent loss can be expressed as a
weighted integral of the reciprocal of the curvature function. The “weights” in the integral are larger
for price levels closer to P0 and increase in P. For larger curvatures, the amount contributed to the
integral is smaller, leading to the heuristic of pricing function’s with larger curvatures having smaller
impermanent losses. We formalize a notion of comparing the curvature of two pricing functions in
the definition below.
Definition. Let F(1) and F(2) be pricing functions with curvature functions κ1 and κ2 at invariant
levels I(1) and I(2), respectively. We say that F(1) curvature-dominates F(2) in the price range
[P,P] if κ1(P;I(1)) ≥ κ2(P;I(2)) for all P ∈ [P,P].
As the curvature of a pricing function can vary significantly depending on the fundamental
price and invariant level, to compare the curvatures of two pricing functions, we need to fix a price
range and invariant level for comparison. When the fundamental price at time of deposit is within
this price range, i.e. P0 ∈ [P,P], an immediate corollary is that if pricing function F1 curvature-
dominates F2 on [P,P], then the impermanent loss function of F1 is less than that of F2 on [P,P].
We would thus expect that if the fee reward rate ϕ remains the same and F(1) curvature dominates
F(2) for all prices larger than P0, then the optimal upper price threshold increases under a pricing
function with larger curvature.
Proposition 5.2. Suppose that a LP deposits x0 risky coins and y0 stable coins at t = 0. If F(1) and
F(2) are pricing functions such that F(1) at invariant level I
(1)
0 := F(1)(x0,y0) curvature-dominates
F(2) at invariant level I
(2)
0 := F(2)(x0,y0) in the price range [P0,∞), then the optimal upper price
threshold p∗
U in a CFMM with pricing function F(1) is greater than that in a CFMM with pricing
function F(2).
This result has implications for the design of AMMs. Assuming that LPs exit the pool optimally
among upper price threshold policies, a larger price threshold implies that the expected time LPs
spend with their assets locked in the liquidity pool is longer, given that market parameters are held
constant. Indeed, under the same law of motion for the fundamental price process, the expected
first hitting time for a price level increases in the price level itself. Keeping LPs in the pool for
a longer time retains liquidity, which is beneficial for the AMM. Proposition 5.2 introduces a new
paradigm for designing and evaluating pricing function by analyzing how long an optimally-behaving
semi-active LP keeps their liquidity in a pool using that pricing function. It is important to note
that for the above result, we fixed the fee reward rate ϕ, but in practice, higher curvature pricing
functions generate more slippage, which may in turn affect the overall trading volume. We proceed
to consider a setting in which the curvature also affects the fee reward rate.
Optimal Pricing Function from a Parametric Family. Fix P0 and x0, the amount of risky
coins initially deposited by the LP. Let {Fθ}θ∈Θ be a parametric family of pricing functions with
parameter space Θ = [θ,θ] ⊆ R+ where θ is a parameter capturing the curvature of the pricing
12function such that higher values of θ correspond to pricing functions with larger curvatures. Specif-
ically, if we have θ1 > θ2, then Fθ1 curvature-dominates Fθ2 on [P0,∞), i.e. κθ1(P) < κθ2(P) for
all P ∈ [P0,∞). The invariant level for the LP’s position at θ, denoted I0(θ), is the value of k that
solves x∗
θ(P0;k) = x0. To capture lower trading volumes induced by a pricing function with a larger
curvature, we assume that the fee reward rate ϕ(θ) is decreasing in θ. Our goal now is to find the
value of θ ∈ Θ that yields the highest optimal upper price threshold p∗
U(θ) for an LP who deposits
x0 risky coins at price P0.
Theorem 5.3. If 1/κθ(P) is decreasing and convex in θ, and ϕ(θ) is decreasing and concave in θ
for θ ∈ [θ,θ] with ϕ(θ) < ∞ and ϕ(θ) = 0, then there exists a unique θ∗ ∈ (θ,θ) that maximizes the
optimal upper threshold p∗
U(θ).
The additional assumptions in Theorem 5.3 provide sufficient conditions for which there exists
a unique maximizer in the interior of Θ. This choice of parameter, denoted by θ∗, maximizes the
upper price threshold that an optimally-behaving LP uses, and thus the expected time an LP stays
in the pool, out of the parametric family of pricing functions. The pricing function corresponding
to parameter θ∗ balances the competing forces of impermanent loss and fee revenue. This result is
similar to Capponi and Jia (2021)’s derivation of the optimal pricing function in their model, where
the optimal choice of curvature is in the interior of the parameter space, balancing both arbitrage
loss and trading volume. Thus, desining pricing functions based on our optimal stopping approach
is thus able to yield results related to those generated from other models of liquidity provision.
Example: Constant Elasticity Functions An example of a parametric family of pricing func-
tions whose curvature for a fixed x0 is increasing in the value of the parameter is the family of
constant elasticity pricing functions {Fθ}θ∈[1,∞) parameterized by θ ∈ [1,∞) where
Fθ(x,y) = (x−θ
+ y−θ
)−1/θ
.
Observe that as θ → ∞, Fθ converges to a Leontief function. Solving the pool value problem for Fθ
yields arbitrageur-optimal reserves of
xθ(P;I) =
I(1 + Pθ/(1+θ))1/θ
P1/(1+θ)
yθ(P;I) = I(1 + Pθ/(1+θ)
)1/θ
and a curvature function of
κθ(P) =
1 + θ
I
· (1 + Pθ/(1+θ)
)(θ−1)/θ P(4+2θ)/(3+3θ)
1 + P2
!3/2
.
13For a fixed x0 = x(P;θ) and P0, we have that
κ(P;θ) =
1 + θ
x0
·
P
1/(1+θ)
0
(1 + P
θ/(1+θ)
0 )1/θ
· (1 + Pθ/(1+θ)
)(θ−1)/θ P(4+2θ)/(3+3θ)
1 + P2
!3/2
.
Standard calculus shows that κ(P;θ) is increasing in θ and 1/κ(P;θ) is convex in θ for θ ∈ [1,∞) at
all P ∈ R+, so this parametric family satisfies the assumptions for Proposition 5.2 and Theorem 5.3.
In the setting of the former result, when ϕ is constant in θ, choosing a higher value of θ results in
a higher optimal upper threshold. However as slippages increase in θ as well, trading demand may
not remain the same. For an appropriate trading demand schedule ϕ(θ) that also satisfies Theorem
5.3’s assumptions, there then exists an optimal choice of θ in the interior of the parameter space
[1,∞).
## 6 Empirical Analysis
Data Collection. We collect pool- and transaction-level data from Uniswap v2 liquidity pools
between 1 February 2022 and 1 August 2024. We focus on the top three pools consisting of Wrapped
Ether (WETH) with stablecoins pegged to the US dollar, i.e. the WETH–USDT, USDC–WETH,
and DAI–WETH pools. Using Amberdata, we obtain pool reserves at hourly frequencies and the
token in/out quantities from all “swap” events occurring on the pool, which signify that a trade has
occurred. We collect ETH–USD price data from centralized exchanges, also from Amberdata. For
the discount rate, we obtain US T-Bill rates from the US Department of the Treasury.
Parameter Calibration. We proceed to calibrate the model parameters µ, σ, ϕ, and r.
• We first estimate the GBM parameters µ and σ for the price process using sample statistics
of CEX price data. Observing daily log-returns of ρ1,...,ρT in the CEX price time series
during the “training” period, let
ρ̄ = T−1
T X
t=1
ρt.
then the estimated GBM parameters are
σ̂ =
s
PT
t=1(ρt − ρ̄)2
T − 1
,
µ̂ = ρ̄ + σ̂2
• To estimate the fee reward rate ϕ, we first construct a time series of daily pro-rata fee revenue
{ft} by taking the total daily volume (in stablecoin), multiply it by the fee tier of 0.3%, and
divide by one plus the median amount of WETH reserves in that day. This corresponds to the
14fee revenue earned by a hypothetical LP who deposits one unit of WETH and the appropriate
quantity of stablecoins. We assume that adding this small amount of hypothetical liquidity to
the pool does not impact observed real-world trading on the pool, which is realistic especially
for large pools like WETH–USDT, USDC–WETH, and DAI–WETH. We then estimate ϕ as
the mean parameter of a GARCH-M model fitted to {ft}.
• We take the one-year US T-Bill rate, normalized to a daily frequency, as r.9
Figure 1: Time Series of Fee Revenue (USD) for Selected Pools
DAI–WETH USDC–WETH WETH–USDT
N 790 790 790
Mean 0.6966 1.0130 1.1371
S.D. 0.8822 1.1123 1.0973
25% 0.2419 0.4171 0.5340
50% 0.4586 0.7042 0.8576
75% 0.7997 1.1154 1.3070
Table 1: Fee Revenue (USD) Summary Statistics for Selected Pools
Figure 1 and Table 1 plot the time series and display summary statistics for the fee revenue of
an LP who hypothetically provides one unit of WETH to each pool. Based off the time series, fee
9
See https://home.treasury.gov.
15revenue generally fluctuates around a mean level with occasional periods of high volatility, which
suggests that our constant fee reward rate assumption is reasonable.
Backtesting Procedure. Since the LP’s problem maximizes expected payoff where the expec-
tation is taken with respect to the price process, and due to the changes in calibrated parameters,
we backtest the exit policy implied by our model with bootstrapped data and adaptive updating of
the optimal exit thresholds.
For a designated start date, we go back Ttrain = 90 days from the start date for the training data
and use data from the start date to the end of the sample period as the test set. For t ∈ [Ttest], let
(ρt,ft) be the observed log-returns and fee revenue at day t, respectively. Since we model the price
process as a GBM, log-returns are assumed to be independent of each other, while fee revenue may
be correlated with log-returns. To account for this, when resampling to obtain a simulated dataset
of length T from the test data, we sample indices {i1,...,iT } independently with replacement from
[Ttest], and ‘couple” the observed fee revenue associated with the observed log-return by taking
((ρi1,fi1),...,(ρiT ,fiT )) as our simulated data. We set T = c · Ttest where c = 2.
To implement the exit policy with adaptive updating of the optimal thresholds, we construct
two time series. The first is the simulated price {Pt}t∈[T] where P̃t+1 = Pt expρit and P̃0 is the ETH
price on the last training set day. The second is the optimal upper price threshold {(p∗
U)t}t∈[T] for
exiting the pool where (p∗
U)t is obtained by appending (ρi1,fi1),...,(ρit,fit)), the first t days of
simulated data, to the training data, then using the combined data to calibrate and solve the model
for the optimal threshold. The exit time τ, if it exists, is the first time that the simulated price on
a given day is higher than the optimal threshold computed at that same day, i.e.
τ = inf{t ∈ [T] : Pt > (p∗
U)t}.
If Pt < (p∗
U)t for all t ∈ [T], then the LP does not exit for the entire duration of the simulation, and
we let τ = T. We compute the LP’s payoff is as
vstrategy
=
τ X
t=1
e−rt
ft + e−rτ
· L(Pτ).
Note that if the LP does not exit during the simulated period, we use the end price of the simulated
data, rather than that implied by the optimal threshold, to evaluate the impermanent loss.
For each simulated dataset, we also compute the LP’s payoff had they used a fixed price P as
their upper price threshold across a grid of price P > P0. Letting τ(P) = inf{t ∈ [T] : Pt > P} if
τ(P) = T if Pt ≤ P for all t ∈ [T], we define
v(P) =
τ(P)
X
t=1
e−rt
ft + e−rτ(P)
· L(P).
16Results. We implement the backtesting procedure for a series of start dates, running N = 1000
simulations per start date. For simulation i ∈ [N], let τi be the exit time and vstrategy
i be the LP’s
payoff. Let vi(P) be the payoffs evaluated for exit policies based on a fixed threshold P. We keep
track of the average payoffs v̄strategy and v̄(P), as well as the average exit price threshold P̄τ:
v̄strategy
= N−1
N X
i=1
vstrategy
i ,
v̄(P) = N−1
N X
i=1
vi(P),
P̄τ = N−1
N X
i=1
Pτi.
We evaluate our strategy by comparing the strategy’s average payoff to the maximum possible
average payoff based on a fixed threshold P. We also compare the strategy’s average exiting price
to the argument of the maximum possible average payoff based on a fixed threshold P. Specifically,
we look at the metrics PctErrPayoff and PctErrPrice, given by:
PctErrPayoff =
maxP>P0 v̄(P) − v̄strategy
maxP>P0 v̄(P)
× 100,
PctErrPrice =
argmaxP>P0 v̄(P) − P̄τ
argmaxP>P0 v̄(P)
× 100.
DAI–WETH USDC–WETH WETH–USDT
Mean Exiting Time (Days) 414.19 484.14 511.49
Mean Initial Price (USD) 1491.67 1491.67 1491.67
Mean Optimal Exiting Price (USD) 2377.67 2847.67 3053.67
Mean Optimal Payoff (USD) 139.68 280.26 345.21
Mean Price Error 13.65% 11.95% 14.92%
Mean Payoff Error 16.73% 11.94% 11.57%
Table 2: Backtesting Results for Selected Pools
Our start dates are the 1st and 16th of every month from August to December 2022, inclusive.
The summary statistics of average percent errors in the price thresholds and payoffs from optimality
are reported in the Table 2, rounded to the nearest percent. The average errors are around 11–16%
for both the price threshold and payoffs, with positive average optimal payoffs, as our theoretical
results would suggest. We can also see how higher daily fee revenue (c.f. Table 1) corresponds with
longer times in pools and higher exiting prices. These results indicating promising results for the
model-implied liquidity provision strategy.
17Figure 2: As an example, the v̄(P) functions (blue) and model-implied exit strategy results (black)
are plotted for the WETH-USDT (left) and USDC-WETH (right) pool on starting at Aug. 1, 2022.
## 7 Conclusion
We study how the incentive of fee revenue and disincentive of impermanent loss affect liquidity
provision using a optimal stopping approach. When using threshold policies to determine when
to exit a liquidity pool, we find that LPs can recuperate impermanent loss by staying in the pool
for downward price movements, but when facing upward price movements, there exists an upper
threshold that maximizes expected payoffs relative to holding. At the optimum, the LP’s expected
payoff is positive, suggesting that before infrastructural fees, liquidity provision is profitable in
expectation given that LPs exit liquidity pools strategically. The optimal upper price threshold can
be used as a benchmark to evaluate pricing functions. Upon establishing a relationship between
impermanent loss and the pricing function’s curvature, we find that pricing functions with larger
curvature given the same risky coin deposit amount correspond to higher optimal upper thresholds.
When the fee renuve also depends on curvature, we provide conditions for which an unique optimal
pricing function among a parametric family exists. These insights can be used by LPs for improved
liquidity management and by DEXs for improved AMM design.
18References
Adams, A., C. C. Moallemi, S. Reynolds, and D. Robinson. 2024. am-AMM: An Auction-Managed
Automated Market Maker. Working paper.
Canidio, A., and R. Fritsch. 2023. Arbitrageurs’ profits, LVR, and sandwich attacks: batch trading
as an AMM design response. Working paper.
Cao, D., B. Falk, and G. Tsoukalas. 2024. Automated Market Makers and the Value of Adaptive
Fees. Working paper.
Capponi, A., and N. Chen. 2024. Optimal Automated Market Maker Pricing Function. Working
paper, available upon request.
Capponi, A., and R. Jia. 2021. Liquidity Provision on Blockchain-Based Decentralized Exchanges.
Working paper.
Capponi, A., R. Jia, and B. Zhu. 2023. The Paradox of Just-in-Time Liquidity in Decentralized
Exchanges: More Providers Can Lead to Less Liquidity. Working paper.
Cartea, A., F. Drissi, and M. Monga. 2024. Decentralised Finance and Automated Market Making:
Predictable Loss and Optimal Liquidity Provision. SIAM Journal on Financial Mathematics
Forthcoming.
Chung, K. L., and R. J. Williams. 1990. Introduction to Stochastic Integration. Boston, MA:
Birkhäuser.
Fabi, M., and J. Prat. 2023. The Economics of Constant Function Market Makers. Journal of
Corporate Finance Forthcoming.
Fan, Z., F. Marmolejo-Cossio, D. Moroz, M. Neuder, R. Rao, and D. C. Parkes. 2023. Strategic
Liquidity Provision in Uniswap V3. Proceedings of the 5th Conference on Advances in Financial
Technologies (AFT 2023) 25:1–22.
Goyal, M., G. Ramseyer, A. Goel, and D. Mazieres. 2023. Finding the Right Curve: Optimal
Design of Constant Function Market Makers. EC ’23: Proceedings of the 24th ACM Conference
on Economics and Computation 783–812.
Hasbrouck, J., T. Rivera, and F. Saleh. 2022. The Need for Fees at a DEX: How Increases in Fees
Can Increase DEX Trading Volume. Working paper.
Li, T., S. Naik, A. Papanicolaou, and L. Schoenleber. 2023. Yield Farming for Liquidity Provision.
Working paper.
———. 2024. Implied Impermanent Loss: A Cross-Sectional Analysis of Decentralized Liquidity
Pools. Working paper.
19Milionis, J., C. C. Moallemi, and T. Roughgarden. 2022a. A Myersonian Framework for Optimal
Liquidity Provision in Automated Market Makers. Working paper.
———. 2022b. Automated Market Making and Arbitrage Profits in the Presence of Fees. Working
paper.
Milionis, J., C. C. Moallemi, T. Roughgarden, and A. L. Zhang. 2022. Automated Market Making
and Loss-Versus-Rebalancing. Working paper.
20A Technical Details
A.1 Pool Value Problem
Lemma A.1. For any pricing function F that satisfies Assumption 1, the pool value problem under
F at price P and invariant level I has a unique optimal solution.
Proof. The pool value problem, reproduced below, is given by
V (P) = min
(x,y)∈R2
+
(Px + y)
subject to F(x,y) = I.
The Lagrangian is
L(x,y,λ) = Px + y − λ(F(x,y) − I)
which has partial derivatives
∂L
∂x
= P − λ · Fx(x,y)
∂L
∂y
= 1 − λ · Fy(x,y)
∂L
∂λ
= I − F(x,y)
Setting the partial derivatives to zero yields
λ · Fx(x,y) = P
λ · Fy(x,y) = 1
F(x,y) = I
and dividing one equation by the other yields necessary conditions of
Fx(x,y)
Fy(x,y)
= P
F(x,y) = I.
We proceed to show that there exists a unique point on the curve F(x,y) = I that satisfies the
equation Fx(x,y)/Fy(x,y) = P. Since Fy > 0 for all (x,y) ∈ R2
+, by the Implicit Function Theorem,
the equation F(x,y)−I = 0 parameterizes exists an implicit function y(x) such that F(x,y(x)) = I
for all x ∈ R+. Differentiating F(x,y(x)) = I with respect to x yields
Fx + Fy · y′
(x) = 0
21y′
(x) = −
Fx
Fy (x,y(x))
Taking the derivative of Fx/Fy evaluated at (x,y(x)), we have
d
dx

Fx
Fy

=
Fy(Fxx + Fxy · y′(x)) − Fx(Fxy + Fyy · y′(x))
F2
y (x,y(x))
.
Substituting the expression for y′(x) yields
d
dx

Fx
Fy

=
F2
y Fxx − 2FxFyFxy + F2
xFyy
F3
y (x,y(x))
< 0.
As x → 0, by Assumption 1, Fx/Fy → ∞ along the curve F(x,y(x)) = I. Similarly, as x → ∞, we
have Fx/Fy → 0 along the curve F(x,y(x)) = I. Since Fx/Fy is decreasing in x along the curve
F(x,y(x)) = I as shown above, there exists a unique point along the curve F(x,y(x)) = I such
that Fx/Fy = P. Since there is a unique point satisfying the necessary condition, it follows that
there exists a unique solution to the pool value problem.
Lemma A.2. Let (x(P),y(P)) and V (P) be the optimal solution and value, respectively, to the pool
value problem at price P and invariant level I. Then
• V ′(P) = x∗(P) > 0
• V ′′(P) = x∗′
(P) ≤ 0
Proof. See Milionis et al. (2022).
A.2 Motivation of Constant Fee Reward Rate
Lemma A.3. Suppose that the combined trading intensity of the arbitrageurs and noise traders at
time t is ν · x∗(P0,It). Then the LPs fee reward intensity is constant.
Proof. Suppose that the LP deposits (x0,y0) liquidity at time 0, and that time t, the LP’s share
of the pool is 1/(1 + wt) where wt ∈ R represents the entry/exit of other LPs in the pool. If the
fundamental price were still P0, then there would be (1 + wt)x0 risky coins and (1 + wt)y0 stable
coins in the liquidity pool (by the 0-homogeneity of Fx/Fy), so the LP’s fee reward intensity per
unit of risky coin deposited is then
Share of Pool × Fee Tier × Trade Intensity
Risky Coins Deposited
=
1
x0
·
1
1 + wt
× f × ν × x∗
(P0;It)
=
1
x0
·
1
1 + wt
× f × ν × (1 + wt)x0 = fν := ϕ
which is constant, as desired.
22B Proofs
B.1 Proof of Theorem 4.1
We require the following lemma.
Lemma B.1. If the CFMM’s pricing function F satisfies Assumption 1, then
• ℓ′(p) ≥ ℓ′′(p) for all p > 0;
• limp→∞(ℓ(p) − ℓ′(p)) = ∞.
Proof. We write the above conditions in terms of the absolute price given by the change-of-variables
P = P0ep. By the Chain Rule,
ℓ′
(p) =
dℓ
dp
=
∂L
∂P
·
∂P
∂p
= L′
(P) · P0ep
= P · L′
(P)
ℓ′′
(p) =
d2ℓ
dp2
=
d
dp
(P · ℓ′
(P)) =
∂
∂P
(P · L′
(P)) ·
∂P
∂p
= P2
· L′′
(P) + P · L′
(P)
The conditions can then be written as
• L′′(P) ≤ 0 for all P > P0;
• limP→∞(L(P) − P · L′(P)) = ∞.
By Lemma A.3, without loss of generality, we can work with a representative LP that deposits
x0 risky coins and y0 stable coins. We denote the optimal solution to the pool value problem at
fundamental price P and invariant level I = F(x0,y0) as (x(P),y(P)). Then we can write the pool
value and value from holding the same amount of assets, respectively, as
V (P) = P · x(P) + y(P)
Vh(P) = P · x(P0) + y(P0)
Recall that the per-unit impermanent loss is
L(P) =
V (P) − Vh(P)
x0
By Lemma A.1, we have
L′
(P) =
V ′(P) − V ′
h(P)
x(P0)
=
x(P)
x(P0)
− 1
L′′
(P) =
V ′′(P) − V ′′
h (P)
x(P0)
=
x′(P)
x(P0)
Since x′(P) < 0, it follows that L′′(P) ≤ 0.
23As y → 0, by Assumption 1, Fx/Fy → 0 along the curve F(x,y(x)) = I. Similarly, as y → ∞,
we have Fx/Fy → ∞ along the curve F(x,y(x)) = I. Since Fx/Fy is decreasing in x along the curve
F(x,y(x)) = I, it follows that Fx/Fy is increasing in y along the curve F(x,y(x)) = I. Because we
must have Fx(x(P),y(P))/Fy(x(P),y(P)) = P, it follows that limP→∞ y(P) = ∞, so
lim
P→∞
(y(P) − y(P0)) = lim
P→∞
(L(P) − P · L′
(P)) = ∞
as desired.
Let Λ(π;p,pL,pU) be the discounted local time of {pt} at π given p0 = p and a stopping time
of T(pL,pU). That is, λ is the function such that
m(A;p,pL,pU) =
Z
p∈A
Λ(π;p,pL,pU)dp
where m is given by
m(A;p,pL,pU) =
Z T(pL,pU)
0
e−rt
1A(pt)dt.
Standard probability theory results (e.g. Chung and Williams (1990)) show that such a function Λ
exists. Let ψL(p;pL,pU) and ψU(p;pL,pU) be the expected discount factors at T(pL,pU) conditional
on pT(pL,pU) = pL and pT(pL,pU) = pU, respectively, and p0 = p. That is,
ψL(p;pL,pU) = Ep[e−rT(pL,pU)
|pT(pL,pU) = pL] · Pp(pT(pL,pU) = pL),
ψU(p;pL,pU) = Ep[e−rT(pL,pU)
|pT(pL,pU) = pU] · Pp(pT(pL,pU) = pU).
We can then write the LP’s objective, denoted v, as
v(0;pL,pU) =
Z pU
pL
E[Λ(π;0,pL,pU)]dπ + ψL(0;pL,pU) · ℓ(pL) + ψU(0;pL,pU) · ℓ(pU).
For the remainder of the proof, we will use the following facts (see Stokey (2008)):
∂
∂pL
E[Λ(π;0,pL,pU)] = ψL(0;pL,pU) ·
∂
∂pL
E[Λ(π;pL,pL,pU)],
∂
∂pU
E[Λ(π;0,pL,pU)] = ψU(0;pL,pU) ·
∂
∂pL
E[Λ(π;pU,pL,pU)],
∂
∂pL
ψL(0;pL,pU) = ψL(0;pL,pU) ·
∂
∂pL
ψL(pL;pL,pU),
∂
∂pU
ψL(0;pL,pU) = ψU(0;pL,pU) ·
∂
∂pU
ψL(pU;pL,pU),
∂
∂pL
ψU(0;pL,pU) = ψL(0;pL,pU) ·
∂
∂pL
ψU(pL;pL,pU),
24∂
∂pL
ψU(0;pL,pU) = ψU(0;pL,pU) ·
∂
∂pU
ψU(pU;pL,pU),
and the closed forms
E[Λ(π;p,pL,pU)] =

   
   

σ2
2
(ξ+
− ξ−
)
−1 
e−ξ−(p−π)
− ψUeξ−(pU−π)
− ψLeξ+(pL−π)

π ≤ 0

σ2
2
(ξ+
− ξ−
)
−1 
e−ξ+(p−π)
− ψUeξ−(pU−π)
− ψLeξ+(pL−π)

π ≥ 0,
ψL(p;pL,pU) =
eξ−p+ξ+pU − eξ+p+ξ−pU
eξ−pL+ξ+pU − eξ+pL+ξ−pU
,
ψU(p;pL,pU) =
eξ−p+ξ+pU − eξ+p+ξ−pU
eξ−pL+ξ+pU − eξ+pL+ξ−pU
.
Then the derivative of v with respect to pL can be written as
∂v(0)
∂pL
= A · ((ξ+
eξ+pL+ξ−pU
− ξ−
eξ+pU+ξ−pL
)(ℓ(pL) − ϕ/r) + (ξ+
− ξ−
)(ℓ(pU) − ϕ/r)
+ ℓ′
(pU)(eξ+pU+ξ−pL
− eξ+pL+ξ−pU
))
where A is given by
A =
eξ+pU − eξ−pU
(eξ+pU+ξ−pL − eξ+pL+ξ−pU )2
.
Since ξ+,pU > 0 and ξ−,pL < 0, it follows that ∂v(0)/∂pL < 0. Then p⋆
L = −∞.
Since the optimal choice of pL is −∞ for any pU > 0, the LP’s objective can be rewritten as
v(pU) =
Z pU
−∞
E[Λ(π;0,−∞,pU)]dπ + ψL(0;−∞,pU) · ℓ(−∞) + ψU(0;−∞,pU) · ℓ(pU).
The derivative of v with respect to pU can be written as
∂v(0)
∂pU
= e−ξ+pU

ϕ
r
· ξ+
− ξ+
· ℓ(pU) + ℓ′
(pU)

,
so the first-order condition for this problem is
FOC(pU) =
ϕ
r
ξ+
− ξ+
· ℓ(pU) + ℓ′
(pU) = 0.
If r ≤ µ, then ξ+ ≤ 1. If ξ+ ≤ 1, then for any pU > 0,
0 > −ℓ′
(pU) + ℓ′′
(pU) ≥ −ξ+
· ℓ′
(pU) + ℓ′′
(pU) =
∂FOC
∂pU
(pU),
25so FOC(pU) is decreasing in pU by Lemma B.1. We also have
ϕ
r
ξ+
− ℓ(pU) + ℓ′
(pU) ≥
ϕ
r
ξ+
− ξ+
· ℓ(pU) + ℓ′
(pU) = FOC(pU),
so limpU→∞ FOC(pU) = −∞ by Lemma B.1.
Since FOC(0) > 0, FOC(pU) is decreasing in pU, and limpU→∞ FOC(pU) = −∞, there exists a
unique p∗
U ∈ (0,∞) such that FOC(p∗
U) = 0. Then FOC(pU) > 0 for all pU < p∗
U and FOC(pU) < 0
for all pU > p∗
U, so
∂v(0)
∂pU
(
> 0 pU < p∗
U
< 0 pU > p∗
U
.
Since v(0) = 0 for pU = 0 and v(0) is increasing in pU to p∗
U, it follows that v(0;p∗
L,p∗
U) > 0 for
pU = p∗
U is positive.
We finally show that when r > µ, then p∗
U = ∞. Note that r > µ if and only if ξ+ − 1. We
first show that y′(P) = o(1). Suppose, towards a contradiction, that |x′(P)| = Ω(P−1). Then
|x(P)| = Ω(logP). Since x(P) is positive and decreasing, we have a contradiction. Then we must
have |x′(P)| = o(P−1), so |P ·x′(P)| = o(1). Since y′(P) = −P ·x′(P), it follows that |y′(P)| = o(1).
Since y(P) is increasing, the claim follows. Then
|L(P)| = |P · (x(P) − x(P0)) + (y(P) − y(P0))|
≤ P · |x(P) − x(P0)| + |y(P) − y(P0)| ≤ P · x(P0) + |y(P) − y(P0)|.
Since y′(P) = o(1), it follows that |L(P)| = O(P).
Recall that
v(0;pU) =
ϕ
r
+ e−ξ+pU

ℓ(pU) −
ϕ
r

.
Changing variables from log-prices to absolute prices yields
v(0;pU) =
ϕ
r
+

PU
P0
−ξ+ 
L(PU) −
ϕ
r

.
Since ξ+ > 0, we have
V (0;pU) = O(P−ξ+
U · L(PU)).
It follows that if ξ+ > 1, then |P−ξ+
U · L(PU)| → 0 as PU → ∞. Then V (0;pU) → ϕ
r as pU → ∞,
the maximal attainable value, so the optimal upper threshold when ξ+ > 1 is p⋆
U = ∞.
26B.2 Proof of Theorem 4.2
We first show that p∗
U is increasing in ϕ. The FOC is
FOC(pU) =
ϕ
r
ξ+
− ξ+
· ℓ(pU) + ℓ′
(pU) = 0.
Recall in the proof of Theorem 4.1 that FOC is decreasing in pU. Then by implicit differentiation,
dp∗
U
dϕ
= −
ξ+
r
∂FOC
∂pU
(p∗
U)
> 0.
We then look at the comparative statics of p∗
U with respect to µ and σ. Recall that
ξ+
=
−µ̃ +
p
µ̃2 + 2σ2r
2σ2
=
−(µ − σ2/2) +
p
(µ − σ2/2)2 + 2σ2r
2σ2
.
Differentiating with respect to µ̃ yields
∂ξ+
∂µ̃
=
1
2σ2
µ̃
p
µ̃2 + 2rσ2
− 1
!
< 0
and differentiating with respect to σ yields
∂ξ+
∂σ
= −
µ
q
(2µ − σ2)2
+ 8rσ2 + (2r − µ)σ2 + 2µ2
σ3
q
(2µ − σ2)2
+ 8rσ2
< 0.
By implicit differentiation,
dp∗
U
dµ
= −

ϕ
r − ℓ(p∗
U)

· ∂ξ+
∂µ̃ · ∂µ̃
∂µ
∂FOC
∂pU
(p∗
U)
< 0,
dp∗
U
dσ
= −

ϕ
r − ℓ(p∗
U)

· ∂ξ+
∂σ
∂FOC
∂pU
(p∗
U)
< 0
as desired.
B.3 Proof of Proposition 5.1
For any invariant level I, the arbitrage-free quantities x(P) and y(P) of the risky and stable coins,
respectively, must satisfy
F(x(P),y(P)) − I = 0
Fx(x(P),y(P))
Fy(x(P),y(P))
− P = 0.
27Taking derivatives with respect to P implies that x′(P) and y′(P) must satisfy
Fx · x′
(P) + Fy · y′
(P) = 0
FyFxx − FxFxy
F2
y
· x′
(P) +
FyFxy − FxFyy
F2
y
· y′
(P) − 1 = 0.
Solving the first equation for y′(P) yields
y′
(P) = −
Fx
Fy
· x′
(P)
y(P) = y(P0) +
Z P
P0
y′
(π)dπ
Plugging this expression into the second equation and solving for x′(P) yields
x′
(P) =
F3
y
F2
y Fxx − 2FxFyFxy + F2
xFyy
.
Assume that Fx,Fy,Fxy > 0 and Fxx,Fyy ≤ 0. Note that we can write
x′
(P) =
F3
y
F2
y Fxx − 2FxFyFxy + F2
xFyy
= −
(F2
x + F2
y )3/2
|F2
y Fxx − 2FxFyFxy + F2
xFyy|
F2
x + F2
y
F2
y
!−3/2
.
Let κ(P) be the curvature of the implicit curve F(x,y) − I = 0 at (x(P),y(P)). Then
x′
(P) = −
1
κ(P)

1
1 + P2
3/2
x(P) = x(P0) +
Z P
P0
x′
(π)dπ.
Since Fx/Fy evaluated at (x(P),y(P)) yields the spot price P, plugging in the expression for x′(P)
into the expression for y′(P) yields
y′
(P) =
P
κ(P)

1
1 + P2
3/2
y(P) = y(P0) +
Z P
P0
y′
(π)dπ.
Since the per-unit impermanent loss is given by
L(P) =
V (P) − Vh(P)
x0
=
P(x(P) − x(P0)) + (y(P) − y(P0))
x0
the result follows.
28B.4 Proof of Theorem 5.2
Lower Curvature Implies Higher Upside Loss Since the curvature of a nonlinear implicit
curve is positive, x′(P) < 0 and y′(P) > 0. Since
L′
(P) =
1
x(P0)
(x(P) − x(P0)) =
RP
P0
x′(π)dπ
x(P0)
,
for (nonlinear) pricing functions F(1) and F(2), if the LP deposits the same amount x(P0) of risky
coins and the curvature of F(1) at implied invariant level I(1) is greater than that of F(2) at implied
invariant level I(2) for every price P > 0, then the per-unit impermanent loss under F(2) is greater
than that under F(1) for all P > P0.
Higher Curvature Implies Higher Upper Threshold Recall that the first-order condition
for pU is
FOC(pU) =
ϕ
r
ξ+
− ξ+
· L(pU) + L′
(pU) = 0.
Fix P0 and x0. Let F(1) and F(2) be nonlinear pricing functions with induced impermanent loss
functions L1 and L2 at invariant levels I1 and I2, respectively, such that x1(P0) = x2(P0) = x0.
Suppose that F(2) has higher curvature than F(1) in the upside region, i.e. P ∈ [P0,∞). Since FOC
is decreasing, an equivalent condition for p∗
U(F(1)) < p∗
U(F(2)) is
−ξ+
· ℓ1(pU) + ℓ′
1(pU) ≤ −ξ+
· ℓ2(pU) + ℓ′
2(pU)
ξ+
(ℓ2(pU) − ℓ1(pU)) ≤ ℓ′
2(pU) − ℓ′
1(pU).
Since lower curvature implies higher upside loss, ℓ2(pU)−ℓ1(pU) > 0 for pU > 0. Since r ≤ µ implies
ξ+ ≤ 1, a sufficient condition for the above is
ℓ2(pU) − ℓ1(pU) ≤ ℓ′
2(pU) − ℓ′
1(pU).
Changing variables to absolute prices yields
L2(PU) − L1(PU) ≤ PU(L′
1(PU) − L′
2(PU))
L2(PU) − PU · L′
2(PU) ≤ L1(PU) − PU · L′
1(PU)
1
x2(P0)
· (y2(PU) − y2(P0)) ≤
1
x1(P0)
· (y1(PU) − y1(P0))
Z PU
P0
y′
2(P)dP ≤
Z PU
P0
y′
1(P)dP
assuming that x1(P0) = x2(P0), i.e. the LP deposits the same amount of risky coins for both pricing
functions. The last inequality holds by the formula for y′(P).
29B.5 Proof of Theorem 5.3
Recall that in absolute prices,
L(P;θ) = x−1
0 (P(x(P) − x(P0)) + (y(P) − y(P0)))
= x−1
0

P
Z P
P0
x′
(π;θ)dπ +
Z P
P0
y′
(π,θ)dπ

and that
L′
(P;θ) = x−1
0 (x(P) − x(P0))
= x−1
0
Z P
P0
x′
(π;θ)dπ.
Impermanent Loss Part of FOC is Increasing Note that
∂
∂θ
ℓ(p;θ) ≤
∂
∂θ
ℓ′
(p;θ) =⇒ −ξ+
·
∂
∂θ
ℓ(p;θ) +
∂
∂θ
ℓ(p;θ) ≥ 0.
Changing to absolute price means that we want to show that
∂
∂θ
L(P;θ) ≤
∂
∂θ
P · L′
(P;θ).
Substituting expressions yields
x−1
0

P
Z P
P0
∂
∂θ
x′
(π;θ)dπ +
Z P
P0
∂
∂θ
y′
(π;θ)dπ

≤ x−1
0 P
Z P
P0
∂
∂θ
x′
(π;θ)dπ.
Since 1/κ(P;θ) is decreasing, substituting the formula for y′(π;θ) yields that the second term on
the LHS is negative, making the inequality true.
Impermanent Loss Part of FOC is Concave Note that
∂2
∂θ2
ℓ′
(p;θ) ≤
∂2
∂θ2
ℓ(p;θ) =⇒ −ξ+
·
∂2
∂θ2
ℓ(p;θ) +
∂2
∂θ2
ℓ(p;θ) ≤ 0.
Changing to absolute prices means that we want to show that
∂2
∂θ2
P · L′
(P;θ) ≤
∂2
∂θ2
L(P;θ).
Substituting expressions yields
x−1
0 P
Z P
P0
∂2
∂θ2
x′
(π;θ)dπ ≤ x−1
0

P
Z P
P0
∂2
∂θ2
x′
(π;θ)dπ +
Z P
P0
∂2
∂θ2
y′
(π;θ)dπ

.
30Since 1/κ(P;θ) is convex, substituting the formula for y′(π;θ) yields that the second term on the
RHS is positive, making the inequality true.
Remainder of Proof Fix pU ∈ R+. By the first-order condition, if θ satisfies
−ξ+
· ℓ(pU;θ) + ℓ′
(pU;θ) = −ϕ(θ) ·
ξ
r
then the optimal upper threshold when the pricing function selected from the family of pricing
functions has parameter θ is pU.
Since limpU→∞ −ξ+ · ℓ(pU;θ) + ℓ′(pU;θ) ↘ −∞ for all θ, there exists a unique pU
such that
−ξ+ · ℓ(pU
;θ) + ℓ′(pU
;θ) = −ϕ(θ). Since −ξ+ · ℓ(pU
;θ) + ℓ′(pU
;θ). Since −ξ+ · ℓ(pU
;θ) + ℓ′(pU
;θ)
increases but remains negative, −ϕ(θ) increases to zero, and a convex and concave line intersect at
most twice, there exists a unique θ > θ such that −ξ+ · ℓ(pU
;θ∗) + ℓ′(pU
;θ) = ϕ(θ). Thus, pU
is an
optimal threshold for θ and θ. Since ℓ(p;θ) decreases pointwise in p for all θ, the first θ solution
increases and the second θ solution decreases as p increases. Since ℓ(p;θ) is continuous, there exists
some p∗
U where both solutions coincide at a point denoted θ∗. After that, i.e. for pU > p∗
U, there is
no value of θ that supports pU as an optimal threshold. Thus, pU is optimized at θ∗.
31