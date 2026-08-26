---
sha256: db856ead2a02fef96ccbbe06b53e241276f37c865b5d72b390fbf02d731ff1d8
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 32918
---
Optimal Fees for Geometric Mean Market
Makers
Alex Evans1
, Guillermo Angeris2
, and Tarun Chitra3
1
alex@placeholder.vc
2
guillean@stanford.edu
3
tarun@gauntlet.network
Abstract. Constant Function Market Makers (CFMMs) are a family
of automated market makers that enable censorship-resistant decentral-
ized exchange on public blockchains. Arbitrage trades have been shown
to align the prices reported by CFMMs with those of external markets.
These trades impose costs on Liquidity Providers (LPs) who supply re-
serves to CFMMs. Trading fees have been proposed as a mechanism for
compensating LPs for arbitrage losses. However, large fees reduce the
accuracy of the prices reported by CFMMs and can cause reserves to
deviate from desirable asset compositions. CFMM designers are there-
fore faced with the problem of how to optimally select fees to attract
liquidity. We develop a framework for determining the value to LPs of
supplying liquidity to a CFMM with fees when the underlying process
follows a general diffusion. Focusing on a popular class of CFMMs which
we call Geometric Mean Market Makers (G3Ms), our approach also al-
lows one to select optimal fees for maximizing LP value. We illustrate
our methodology by showing that an LP with mean-variance utility will
prefer a G3M over all alternative trading strategies as fees approach zero.
Introduction
Constant Function Market Makers (CFMMs) [2] are a family of automated mar-
ket makers that enable censorship-resistant decentralized exchange on public
blockchains. In CFMMs, Liquidity Providers (LPs) supply assets (reserves) to
an on-chain smart contract. The smart contract makes reserves available for
swaps, executing a trade only if it preserves some function of reserves, known
as ‘the invariant.’ For example, Uniswap [1] only permits trades that preserve
the product of reserves (the product of reserve quantities must be the same be-
fore and after a trade). Similarly, Balancer only permits trades that preserve
the weighted geometric mean of reserves. LPs are entitled to a pro-rata share of
the CFMM’s reserves, as well as any trading fees that the CFMM collects. As
of this writing, CFMMs have attracted billions of dollars worth of reserves and
trade over $1 Billion worth of cryptocurrency daily [12]. The rapid growth in
the value deposited in CFMMs has allowed these protocols to regularly compete
with established centralized exchanges on the basis of liquidity [6]. At the same
time, this growth has raised questions of efficiency, including how to optimally
arXiv:2104.00446v1 [q-fin.MF] 1 Apr 20212 Alex Evans, Guillermo Angeris, and Tarun Chitra
utilize reserves and how to select parameters for attracting liquidity and trading
volume.
Under fairly general conditions, the prices reported by CFMMs have been
shown to closely track those of external, more liquid markets [2]. Because the
price reported by a CFMM is a function of reserves, this “oracle” property
requires an arbitrageur to maximize profit by adjusting reserves to align the
CFMM’s price with that of the external market. Because reserves are adjusted
in response to price changes on the external market, the asset composition that
Liquidity Providers (LPs) are entitled to is continually rebalanced. Protocols
such as Balancer take advantage of this property to offer LPs payoffs that re-
semble constant-mix portfolios [16]. While LPs may benefit from rebalancing
their portfolio to a target allocation, they also bear the cost of arbitrage trans-
actions. In response, most CFMMs charge fees for incoming trades. However,
fees make arbitrage less profitable, leading to only partial adjustment of reserves
in response to price changes. This allows asset compositions to stray further from
their desired allocations and reduces the accuracy of the prices reported by the
CFMM. As a result, fees may in fact reduce the value LPs receive in certain
cases. Given these trade-offs, CFMM designers are faced with the problem of
how to assess the impact of fees on LP value and how to select optimal fees for
attracting liquidity.
Our analysis focuses on Geometric Mean Market Makers (G3Ms), which in-
clude most popular CFMMs used in practice, including Uniswap, Sushiswap and
Balancer [1,16]. G3Ms require that the reserves of the CFMM before and after
each trade must have the same (weighted) geometric mean. As a by-product of
arbitrage, the proportion of value deposited in the constant-mean CFMM for a
given asset closely tracks the weight applied to the asset when calculating the
weighted geometric mean [16]. This property resembles a constant-mix portfo-
lio and simplifies the analysis of Liquidity Provider (LP) returns. G3Ms allow
us to model weight dynamics directly in the presence of fees. It has recently
been shown that G3Ms can replicate a wide variety of trading strategies, includ-
ing options payouts, using dynamic weights [13]. Our analysis therefore extends
naturally to a large class of LP payouts that can be represented by G3Ms.
Prior work. Prior work on LP returns in CFMMs has primarily focused on the
case where no fees are charged. In [13], it is shown LPs in G3Ms with no fees
underperform equivalent constant-mix portfolios due to arbitrage. However, the
case with fees is more involved as path independence is typically not satisfied.
This question was addressed in [18] for the case of a Uniswap LP seeking to
maximize the growth rate of wealth when the underlying price process follows a
geometric Brownian motion. This model assumes a particular functional form of
the fee and shows that LPs can generate positive geometric growth with any non-
zero fee provided that the mean and volatility are bounded in a suitable manner.
The result holds for the specific case where the objective of the LP is to maximize
the expected logarithm of reserve value when the underlying price process follows
a geometric Brownian motion with certain mean and volatility constants. Our
approach extends this setting to general diffusions and LP objective functions.Optimal Fees for Geometric Mean Market Makers 3
A separate line of work has applied conventional microstructure models to
the problem of LP profitability, positing a game between LPs and informed
traders to estimate profitability conditions for Uniswap [5]. This framework is
generalized to arbitrary CFMMs in [3], where it is shown that the curvature of
the CFMM’s trading function can be used to bound LP profitability. Our results
apply to the case where the trader has perfect information and extracts risk-free
profit at the expense of the LP. We show that there are general conditions under
which the effect of arbitrage on the LP’s value function approaches zero for small
fees.
Optimal Control and Portfolio Optimization. While constant-mix portfolios pro-
duce excess growth due to rebalancing, no-fee G3Ms have been shown to divert
this growth to arbitrageurs in order to incentivize continual rebalancing [13].
While arbitrage losses are limited by increasing the fee that the G3M charges,
this also limits the amount of rebalancing that arbitrageurs are incentivized to
perform. We seek to formalize the impact of this trade-off on the value LPs
receive from the G3M.
The problem of optimal portfolio selection in continuous time is well-studied
in financial optimization, starting with the classical investment-consumption of
Merton [17]. There are numerous extensions to the classical model that incorpo-
rate the impact of proportional transaction costs [7,11,15]. In this setting, it is
shown that the optimal investment policy involves a no-trade region around the
optimal portfolio weight [9,8,10]. In a G3M, an LP does not have direct control
over reserves and relies on an arbitrageur for rebalancing reserves to the target
asset proportions. It is shown in [4] that the arbitrageur takes no action inside
a no-arbitrage interval around the desired weight. However, the cost to the LP
at the boundary is not proportional to the dollar value of rebalancing required.
The passive nature of LP rebalancing and non-proportional costs complicate
the problem of optimal portfolio strategies for G3Ms. Classical rebalancing [15]
assumes that the portfolio holder actively trades to adjust their portfolio weights.
Unlike traditional portfolio optimization, G3M arbitrageurs adjust the portfolio
with the aim of extracting a profit at the expense of LPs. In this work, we
provide a solution to this problem by explicitly modeling the arbitrage costs
incurred at the boundary of the no-trade region for different levels of the fee.
Our approach is inspired by the stochastic control problems used in traditional
portfolio optimization. These methods are often used in reinforcement learning,
portfolio analysis, and recently in decentralized finance (DeFi) [14].
Summary. We study the value to LPs of contributing capital to a G3M with
fees. We consider the dynamics of the portfolio proportions as a function of time
and fees assuming arbitrageurs trade against the CFMM to maximize profit. We
show that the proportion of G3M value held in a given asset fluctuates freely
within an interval where arbitrage is unprofitable. If the state variable exits this
interval, an arbitrage opportunity arises to return it a point in the interior of
the interval. We explicitly calculate the cost of this adjustment and show that
it vanishes to first order when the state process has contiunous sample paths.4 Alex Evans, Guillermo Angeris, and Tarun Chitra
The observation allows one to compute the value to the LP for a given choice
of fee by solving a differential equation subject to two conditions that hold at
the boundary of the no-arbitrage interval. We illustrate this approach for the
specific example of maximizing mean-variance utility for a geometric Brownian
motion and demonstrate how to optimize the resulting value.
## 1 Problem description
In the arbitrage game, we have two players, each of whom trades in a two-
asset economy: the liquidity provider, who is interested in minimizing some
penalty function depending on the portfolio weights and an arbitrageur who
trades against the liquidity provider’s assets (and therefore, as a side effect,
changes the portfolio weight).
Penalty function. We will define the penalty function φ : R → R∪{+∞} which
depends on the portfolio weight w ∈ [0,1] for a given coin. The penalty function
maps the weight to a liquidity provider’s loss; i.e., we can view the function φ
as the ‘tracking error’ common in the control literature. We will assume that φ
has a minimizer w?
∈ [0,1] such that φ(w?
) ≤ φ(w) for all w ∈ [0,1].
Portfolio weight dynamics. The portfolio weight is, in general, a stochastic pro-
cess that evolves in time, which we will write as wt ∈ [0,1] at time t. We will
assume a discretization in time, with steps of size h > 0 and later recover con-
tinuous results by taking the appropriate limits, such that t = 0,h,2h,.... In
this case, we will assume a basic model with increments given by
ξt(w,h) = a(w)h + b(w)εt
√
h, t = 0,h,...,
where εt ∼ {±1} with equal probability. (For example, if a(w) = 0 and b(w) = 1
for any w, then as h ↓ 0 we have that
Pτ/h
n=1 ξnh converges weakly to a standard
Brownian motion over time τ.) Then, the dynamics of the weights will be given
by some function F : R × R → R:
wt+h = F(wt,ξt(wt,h)), t = 0,h,...,
where F is a function that models the arbitrage dynamics; i.e., the arbitrageur
sees a change in the portfolio weight of ξt and performs arbitrage which results
in some new weight wt+h. We will often abuse notation slightly by writing ξt
instead of ξt(wt,h) to improve readability.
As a side note, we will be very informal regarding different types of conver-
gence in the presentation and will freely switch expectations, limits, and deriva-
tives, along with assuming that all functions are ‘nice enough.’ While we will
mostly work with the discrete approximations, some limits taken at the end will
require justification—a reader familiar with stochastic processes and basic anal-
ysis should be able to insert the corresponding theorems as necessary, but we
will not discuss them further.Optimal Fees for Geometric Mean Market Makers 5
Arbitrage loss and total expected loss. By definition, the arbitrageur is guar-
anteed nonnegative profit at every time t by exploiting the change in portfolio
weights from time t to t+h. We can (conversely) view this as a penalty incurred
by the LP which we will call the adjustment cost, defined by a nonnegative func-
tion C : R×R → R+. A simple interpretation for C(wt,ξt) ≥ 0 is that it is the
cost at time t, incurred by the LP, for adjusting the would-be portfolio weights
wt + ξt to some different weight wt+h.
This lets us write the expected loss for a liquidity provider, starting at weight
w ∈ [0,1]:
J(w) = E
" ∞ X
n=0
e−nhr
(φ(wnh)h + C(wnh,ξnh)) w0 = w
#
, (1)
where wt+h = F(wt,ξt). Here, r is the continuous discounting rate, such that
e−rt
is the amount discounted at time t.
A (tight) lower bound. A simple lower bound on the expected loss J comes from
the fact that φ(wnh) ≥ φ(w?
), by definition of φ(w?
), and C(wnh,ξnh) ≥ 0
by definition of the adjustment cost C, which implies that the expected loss is
bounded from below by:
J(w) ≥
∞ X
n=0
e−nhr
φ(w?
)h.
If φ is normalized such that φ(w?
) = 0 (this can be done without loss of generality
by replacing φ(w) with φ(w) − φ(w?
)), this simplifies to:
J(w) ≥ 0.
The remainder of the paper shows that, in fact, this simple bound becomes
asymptotically tight as the fees approach, but do not equal, zero. (We will see
soon how such fees connect to the problem.) This would immediately imply that
the liquidity provider’s losses are minimized by reducing the fees as much as
possible, while ensuring they are not zero.
No-fee interval. In general, CFMMs have a no-fee interval (which is a function of
the fees) where no possible weight adjustment is profitable for arbitrageurs [4,2].
For most CFMMs, and, more specifically, for the G3Ms we study here, the no-fee
interval [wD,wU] ⊆ [0,1] has nonempty interior when the fee is nonzero; i.e.,
wD < wU. This condition implies that, if the portfolio weight wt lies in the
interior of the interval, any vanishingly small change will not be adjusted and
incurs no losses. More formally, if wD < wt < wU, then
wt+h = F(wt,ξt) = wt + ξt and C(wt,ξt) = 0, (2)
for all h small enough, since ξt ∼ O(h1/2
) by definition. We will show this is true
for all G3Ms in §2.6 Alex Evans, Guillermo Angeris, and Tarun Chitra
Differential equation limit. While (1) is a complete description of our problem,
it is in general not easy to analyze directly. On the other hand, in a similar way
to dynamic programming, we can write J(wt) in terms of the current cost at
time t plus a discounted expectation of J(wt+h) given wt:
J(w) = φ(w)h + E[C(w,ξt) | wt = w] + e−rh
E[J(wt+h) | wt = w].
By rearranging and dividing both sides by h, we find that
e−rh
E

J(wt+h) − J(w)
h
wt = w

+ φ(w)
+
E[C(w,ξt) | wt = w]
h
−
1 − e−rh
h
J(w) = 0. (3)
Note that, if w lies in the interior of the no-arbitrage integral, wD < w < wU,
then the limit as h ↓ 0 implies that C(w,ξt)/h = 0, since ξt ↓ 0 and C(w,ξt) = 0
for all ξt small enough, from (2). Similarly, since wt+h = wt + ξt for all ξt small
enough, we have
lim
h↓0
E

J(wt+h) − J(w)
h
wt = w

= a(w)J0
(w) +
b(w)2
2
J00
(w),
which follows from Taylor expanding J(wt+h) = J(w + ξt) into its linear and
quadratic terms, as ξt is on the order of h1/2
, and taking the corresponding
expectation. This means that the final limit of (3) as h ↓ 0, is the following
differential equation:
a(w)J0
(w) +
b2
(w)
2
J00
(w) + φ(w) − rJ(w) = 0, (4)
whenever wD < w < wU. In order to solve this differential equation, we will also
need appropriate boundary conditions which will depend on the specifics of the
CFMM we are considering. In our case, we will show that
J0
(wD) = J0
(wU) = 0, (5)
is satisfied.
## 2 Fees for G3Ms
In this section, we will provide a specific application of the framework provided
in §1 in order to show that a G3M with appropriately chosen weights will always
have an optimal fee that is as small as possible without being zero.
Constant function market makers. A constant function market maker is defined
by its reserves Rα(t) of coin α and Rβ(t) of coin β at time t. Traders can trade
with the CFMM (and therefore liquidity providers’ funds) by proposing a tradeOptimal Fees for Geometric Mean Market Makers 7
∆α ≥ 0 of coin α and ∆β ≤ 0 of coin β to the CFMM. The trade is accepted if
the CFMM’s trading function defined by ψ : R+ × R+ → R satisfies
ψ(Rα(t) + γ2∆α,Rβ(t) + ∆β) = ψ(Rα(t),Rβ(t)).
(i.e., it is ‘kept constant.’) Here (1−γ) is the fee, which must satisfy 0 < γ ≤ 1.
If, instead, we wish to trade ∆α ≤ 0 for ∆β ≥ 0, we would instead switch the
fee to the incoming coin β, i.e., the trade is accepted if
ψ(Rα(t) + ∆α,Rβ(t) + γ1∆β) = ψ(Rα(t),Rβ(t)).
If the trade (∆α,∆β) satisfies either equation, then the CFMM takes ∆α from
the trader (if ∆α ≥ 0, otherwise it pays out ∆α) and pays out ∆β ≥ 0 (as
before), updating its reserves to
Rα(t + h) = Rα(t) + ∆α and Rβ(t + h) = Rβ(t) + ∆β.
For more information on CFMMs see, e.g., [2].
In the special case of G3Ms, which is the case we consider in the remainder
of the paper, we have the specific trading function:
ψ(Rα,Rβ) = R1−θ
α Rθ
β,
where 0 < θ < 1 is called the weight parameter. We derive explicit formulas for
wU,wD and the adjustment costs in this case in Appendix §A.
Portfolio value and weight. The definition of the portfolio value of liquidity
providers for the CFMM is the total present market value of reserves. If asset β
has some market value S(t) at time t, then the portfolio value is given by
Rα(t) + S(t)Rβ,
and the portfolio weight (of coin β) of the liquidity providers is defined as
wt =
Rβ(t)S(t)
Rα(t) + Rβ(t)S(t)
.
In other words, wt is the total proportion of wealth allocated to asset β with
respect to the complete porfolio.
Price process. We will compute the optimal fees when the price of the risky asset
follows
S(t + h) = S(t)
h
(µ − r)h + σεt
√
h
i
, (6)
where εt ∼ {±1} is uniform and µ, r and σ are constants that represent the
growth rate, discounting rate, and volatility, respectively. (We will later take
h ↓ 0 such that S(t) converges to a geometric Brownian motion.)
When no adjustments occur by the arbitrageur, there is no trade performed
and so Rα(t) = Rα and Rβ(t) = Rβ are constant from t to t + h. So, the
corresponding dynamics of wt can be derived in the limit of small h:
wt+h − wt = wt(1 − wt)(µ − r − wtσ2
)h + wt(1 − wt)σεt
√
h + O(h3/2
). (7)
Through a discrete approximation, we prove the boundary conditions (5) for
these weight dynamics in Appendix §B.8 Alex Evans, Guillermo Angeris, and Tarun Chitra
Penalty function. We assume the penalty function is given by
φ(wt) =
1
2
λσ2
(wt − w∗
)2
(8)
for some constant w∗
. This functional form is used in [15] and conforms with
the assumption that LP has mean-variance preferences over rates of return to
wealth with risk aversion parameter λ. In particular, we note that this expression
generalizes the setting considered in [18] where one seeks to maximize the growth
rate of LP wealth. To see this, note the expected logarithm of wealth satisfies
1
T
E[ln(W(T)/W(0)] =
1
T
Z T
0
(ws(µ − r) −
1
2
σ2
ws)ds.
Through a standard procedure, this expectation can be shown to be maximized
by fixing w∗
= µ−r
σ2 . Substituting this value when taking the difference between
the growth rate at w∗
and w,
[(µ − r)w∗
−
1
2
σ2
(w∗
)2
]dt − [(µ − r)wt −
1
2
σ2
w2
t ]dt =
1
2
σ2
(w − w∗
)2
dt,
which (8) for the special case of λ = 1.
Approximation. We consider the case when wt ≈ w∗
which will provide a close
approximation for small fees. When this is true, we can approximate (7) by
wt+h − wt = wtah + wtbdεt
√
h,
where
a = (1 − w∗
)(µ − r − w∗
σ2
), b = (1 − w∗
)σ.
The equation in (4) simplifies to Euler-Cauchy form and has an explicit solution
given in [15],
J(w,γ1,γ2) =
1
2
λσ2

w2
r − 2a − b2
−
2ww∗
r − a
+
(w∗
)2
r

+ C1wz1
+ C2wz2
. (9)
where
z1 =
b2
2 − a +
q
(a − b2
2 )2 + 2b2r
b2
, z2 =
b2
2 − a −
q
(a − b2
2 )2 + 2b2r
b2
Determining optimal values. Note that (4) and (5) will hold for all values of γ1
and γ2. For the optimal values, we show in §C that
J11 (wU,γ1,γ2) = J11 (wD,γ1,γ2) = 0. (10)
Using the conditions in (5) and (10), we will determine the values of the coeffi-
cients C1,C2 in (9) as well as the optimal values for γ1 and γ2. One can check
that the (numerical) maxima happen when γ1 and γ2 both approach 1 (zero fee).
However, the system of equations has no solution as C1 and C2 are undefined
for γ1 = γ2 = 1. Taking the limit as (γ1,γ2) → (1−
,1−
), one can show that
J(w,γ1,γ2) approaches zero, implying that no cost is incurred relative to the
optimal strategy.Optimal Fees for Geometric Mean Market Makers 9
Fig.1. Cost function for J(w?
) when the LP seeks to minimize the penalty on the rate
of wealth growth (λ = 1) and fees are equal regardless of trading direction γ = γ1 =
γ2. We plot different mean-variance pairs that each satisfy w?
= 1
2
. Higher volatility
increases the relative cost incurred for higher values of the fee, for every choice J(w?
)
is brought close to zero as the fee approaches zero (while the function is not continuous
at γ = 1)
## 3 Conclusion
Fees are a critical component of LP value in CFMMs. Fees offset the cost of
arbitrage, but also reduce the extent of rebalancing performed. We formalize
this trade-off through a control-inspired approach that allows us to explicitly
derive a solution for LP value for given fee choices. This solution also allows
us to make the optimal choice of fees for maximizing value for the LP. In the
example where the LP faces a quadratic tracking error for asset prices following
geometric Brownian motion, we show that costs are minimized as fees approach
zero. Our result applies to all G3Ms and allows one to derive results for general
LP objective functions when the underlying asset price dynamics are governed
by a continuous process.
References
1. Adams, H.: Uniswap whitepaper. Tech. rep. (2018)
2. Angeris, G., Chitra, T.: Improved price oracles: Constant function market mak-
ers. In: Proceedings of the 2nd ACM Conference on Advances in Financial Tech-
nologies. p. 80–91. AFT ’20, Association for Computing Machinery, New York,
NY, USA (2020). https://doi.org/10.1145/3419614.3423251, https://doi-org.
stanford.idm.oclc.org/10.1145/3419614.3423251
3. Angeris, G., Evans, A., Chitra, T.: When does the tail wag the dog? Curvature
and market making. arXiv preprint arXiv:2012.08040 (2020)
4. Angeris, G., Kao, H.T., Chiang, R., Noyes, C., Chitra, T.: An analysis of Uniswap
markets. Cryptoeconomic Systems Journal p. to appear (2019)10 Alex Evans, Guillermo Angeris, and Tarun Chitra
5. Aoyagi, J.: Lazy liquidity in automated market making. Available at SSRN 3674178
(2020)
6. Cermak, L.: Uniswap’s monthly trade volume exceeded coinbase’s
in september. https://www.theblockcrypto.com/linked/79775/
uniswap-coinbase-monthly-volume-september (October 2020)
7. Davis, M.H.A., Norman, A.R.: Portfolio selection with transaction costs. Math-
ematics of Operations Research 15(4), 676–713 (1990), https://EconPapers.
repec.org/RePEc:inm:ormoor:v:15:y:1990:i:4:p:676-713
8. Dixit, A.: The Art of Smooth Pasting. Fundamentals of pure and applied
economics, Harwood Academic Publishers (1993), https://books.google.com/
books?id=nmoUDNfYK2sC
9. Dixit, A.: A simplified treatment of the theory of optimal regulation of
brownian motion. Journal of Economic Dynamics and Control 15(4), 657 –
673 (1991). https://doi.org/https://doi.org/10.1016/0165-1889(91)90037-2, http:
//www.sciencedirect.com/science/article/pii/0165188991900372
10. Dumas, B.: Super contact and related optimality conditions. Journal of Economic
Dynamics and Control 15(4), 675–685 (1991), https://EconPapers.repec.org/
RePEc:eee:dyncon:v:15:y:1991:i:4:p:675-685
11. Dumas, B., Luciano, E.: An exact solution to a dynamic portfolio choice prob-
lem under transactions costs. Journal of Finance 46(2), 577–95 (1991), https:
//EconPapers.repec.org/RePEc:bla:jfinan:v:46:y:1991:i:2:p:577-95
12. Dune: Dune analytics decentralized exchange dashboard (2020), avail-
able at https://explore.duneanalytics.com/public/dashboards/
c87JEtVi2GlyIZHQOR02NsfyJV48eaKEQSiKplJ7
13. Evans, A.: Liquidity provider returns in geometric mean markets. arXiv preprint
arXiv:2006.08806 (2020)
14. Kao, H.T., Chitra, T.: Feedback control as a new primi-
tive for DeFi (2020), https://medium.com/gauntlet-networks/
feedback-control-as-a-new-primitive-for-defi-27b493f25b1
15. Leland, H.E.: Optimal portfolio management with transactions costs and capital
gains taxes. Working Paper RPF-290, IBER, UC Berkeley, Available at SSRN:
https://ssrn.com/abstract=206871 (December 1999)
16. Martinelli, F., Mushegian, N.: Balancer: A non-custodial portfolio manager, liq-
uidity provider, and price sensor (2019)
17. Merton, R.: Lifetime portfolio selection under uncertainty: The continuous-time
case. The Review of Economics and Statistics 51(3), 247–57 (1969), https://
EconPapers.repec.org/RePEc:tpr:restat:v:51:y:1969:i:3:p:247-57
18. Tassy, M., White, D.: Growth rate of a liquidity provider’s wealth in xy = c au-
tomated market makers. https://math.dartmouth.edu/~mtassy/articles/AMM_
returns.pdf (Nov 2020)
A G3M Arbitrage Results
When the arbitrageur adds reserves of the risky asset, we have the following
constant geometric mean formula,
(Rα − ∆α)1−θ
(Rβ + γ1∆β)θ
= R1−θ
α Rθ
β.Optimal Fees for Geometric Mean Market Makers 11
Solving for ∆β,
∆β =
1
γ1
Rβ

Rα
Rα − ∆α
1−θ
θ
− 1
!
The aribtrageur’s problem is therefore
maximize ∆α − S(t)
1
γ1
Rβ

Rα
Rα − ∆α
1−θ
θ
− 1
!
subject to ∆α ≥ 0
(11)
As in [4], we note that the unconstrained maxima are those where the derivative
of (11) is zero. This happens when
∆α = Rα −

1 − θ
γ1θ
S(t)RβR
1−θ
θ
α
θ
. (12)
This implies
∆β =

θ
1 − θ
Rα
S(t)
1−θ 
Rβ
γ1
θ
−
Rβ
γ1
.
Substituting this back into the objective of (11) and simplifying, we get that the
total arbitrage profit for the trader
Rα −
1
θθ(1 − θ)1−θ
R1−θ
α

S(t)Rβ
γ1
θ
+
S(t)Rβ
γ1
Scaling to total LP wealth S(t)Rβ + Rα,
Cd = (1 − w(t)) −
1
θθ(1 − θ)1−θ

w(t)
γ1
θ
(1 − w(t))1−θ
+
w(t)
γ1
, (13)
where w(t) =
S(t)Rβ
S(t)Rβ+Rα
, the fraction of LP wealth in the risky asset prior to
rebalancing. No-arbitrage requires that ∆ ≤ 0 in (12), which implies
w(t) ≥
γ1θ
1 − θ + γ1θ
= wD
After this adjustment, the quantities are updated to Rα 7→ Rα −∆α and Rβ 7→
Rβ + ∆β. The weight after the adjustment is given by
wd(t) =
(Rβ + ∆β)S
(Rβ + ∆β)S + Rα − ∆α
Which we can rewrite as
wd(t) =
1 + γθ
1

1−θ
θ
w(t)
1−w(t)
1−θ
(1 − γ−1
1 )
1
θ + γθ
1

1−θ
θ
w(t)
1−w(t)
1−θ
(1 − γ−1
1 )
(14)12 Alex Evans, Guillermo Angeris, and Tarun Chitra
When adding units of the numéraire in exchange for the risky asset, the constant
geometric mean gives
(Rα + γ2∆α)1−θ
(Rβ − ∆β)θ
= R1−θ
α Rθ
β.
Through a similar procedure, it is possible to show
Cu =
1
γ2
(1 − w(t)) −
1
θθ(1 − θ)1−θ

1
γ2
(1 − w(t))
1−θ
w(t)θ
+ w(t), (15)
and
w(t) ≤
θ
γ2(1 − θ) + θ
.
The weight after the adjustment is given by
wu(t) =
1
1
θ + γ2
1−θ
θ
1−θ

1−w(t)
w(t)
θ
(1 − γ−1
2 )
.
B Proof of Boundary Conditions
We proceed by a discrete approximation of the problem and derive the associated
boundary conditions at the limit. Analogous to [9,8], we divide time into discrete
intervals of length τ and state into steps of size ξ. In what follows, we will
approximate the weight variable in a slightly different way, but will still recover
(2) at the limit; here, for each i, we will have
wi+1 − wi = ξ.
We approximate the unadjusted weight process with a random walk. Starting
from wi, the next step after τ units of time have passed will be wi−1, with prob-
ability p, and wi+1, with probability q = 1−p. If we suppose these probabilities
satisfy
awiτ = qξ + p(−ξ),
then this implies
p =
1
2
(1 − awiτ/ξ), q =
1
2
(1 + awiτ/ξ).
The variance is given by
b2
w2
i τ = q(ξ − awiτ)2
+ p(ξ + awiτ)2
= ξ2
− a2
w2
i τ2
.
Keeping only the leading term, b2
w2
i τ = ξ2
, and taking the limit as τ and ξ tend
to zero, we recover the process in (2). From §A, we have the boundaries of the
no-arbitrage interval,
γ1w∗
1 − w∗ + γ1w∗
= wD,
w∗
γ2(1 − w∗) + w∗
= wU.Optimal Fees for Geometric Mean Market Makers 13
The random walk proceeds unadjusted on the states i = D + 1,..,U − 1. If the
process is at D and takes a step to the right, again no arbitrage adjustment
occurs. If, however, the process moves to D − 1, then arbitrage instantaneously
adjusts the weight to wd in (14). At i = D the next step will be wD+1, with
probability p, and wd with probability q = 1−p. Similarly, at the upper boundary,
we will have wU−1 with probability p, and wu, with probability q = 1 − p.
Therefore, at the boundary point wU, we have
J(wU) = f(wU)τ + e−rτ
pJ(wU−1) + e−rτ
qJ(wu(ξ)) − qCu(ξ),
where
Cu(ξ) =
1
γ2
(1 − wU − ξ) −
(1 − wU − ξ)1−w∗
γ2(w∗)w∗
(1 − w∗)1−w∗ (wU + ξ)w∗
+ wU + ξ, (16)
and
wu(ξ) =
1
1
w∗ + γ2
1−w∗
w∗
1−w∗

1−WU −ξ
WU +ξ
w∗
(1 − γ−1
2 )
.
Rearranging terms and multiplying by erτ
erτ
J(wU) − pJ(wU−1) − qJ(wu(ξ)) = erτ
f(wU)τ − erτ
qCu(ξ)).
Expanding on the right side and noting that τ is o(ξ),
τ[1 + rτ + o(τ)]f(wU) −
1
2
(1 + aξ/(wUb2
))[1 + rτ + o(τ)]Cu(ξ))
= −
1
2
(1 + aξ/(wUb2
))Cu(ξ)) + o(ξ).
Expanding on the left side,
[1 + rτ + o(τ)]J(wU) − p[J(wU) − J1(wU)ξ + o(ξ)] + qJ(wu(ξ))
= q[J(wU) − J(wu(ξ))] + pJ1(wU) + o(ξ)
=
1
2
(1 + aξ/(wUb2
))[J(wU) − J(wu(ξ))] +
1
2
(1 − aξ/(wUb2
))J1(wU)ξ + o(ξ)
=
1
2

[J(wU) − J(wu(ξ))] +
aξ
wUb2
[J(wU) − J(wu(ξ))] + J1(wU)ξ

+ o(ξ).
Next, we divide both sides by ξ and take the limit as ξ tends to zero. From (16),
one can check that
CU(ξ) =
(γ2(1 − w?
) − w)3
2γ2
2(1 − w?)w?
ξ2
+ o(ξ2
)
Therefore, the right-hand side is zero. For the left-hand side, noting that wu(0) =
wU we have
lim
ξ→0
1
2

[J(wU) − J(wu(ξ))] +
aξ
wUb2
[J(wU) − J(wu(ξ))] + J1(wU)ξ + o(ξ)

= lim
ξ→0
1
2

J(wU) − J(wu(ξ))
ξ
+ J1(wU)
14 Alex Evans, Guillermo Angeris, and Tarun Chitra
By the Mean Value Theorem, there exists ζ ∈ (wU,wu(ξ)) such that
lim
ξ→0
1
2

J(wU) − J(wu(ξ))
ξ
+ J1(wU)

= lim
ξ→0
1
2

J1(ζ)[wU − wu(ξ))]
ξ
+ J1(wU)

= lim
ξ→0
1
2

−
J1(ζ)[w0
u(0)ξ + o(ξ))]
ξ
+
1
2
J1(wU)

=
1
2
J1(wU)(1 − w0
u(0))
=
γ2(1 − w∗
) − w∗
2γ2
J1(wU)
Noting γ2(1−w∗
)−w∗
2γ2
is non-zero and finite for 0 < γ2 ≤ 1 completes the proof of
(5). For γ2 = 0, the boundary condition does not apply as no adjustment occurs
and this holds for all w > wD = 0. The proof for the lower boundary is similar.
C Optimality conditions
Substituting the boundary condition (5) into the general solution (9) we have
J1(wU,γ1,γ2) =
1
2
λσ2

2wU
r − 2a − b2
−
2w∗
r − a

+ C1z1wz1−1
U + C2z2wz2−1
U .
Taking the derivative with respect to γ1
J12(wU,γ1,γ2) =
∂C1
∂γ1
z1wz1−1
U +
∂C2
∂γ1
z2wz2−1
U = 0.
We note that for b 6= 0 and r > 0, z1 and z2 will have opposite signs. Since wz1−q
and wz2−q
are positive, we conclude that ∂C1
∂γ1
and ∂C2
∂γ1
have the same sign. So,
J2(w,γ1,γ2) =
∂C1
∂γ1
wz1
+
∂C2
∂γ1
wz2
.
Again wz1
and wz2
are positive and the derivatives have the same sign. This
implies that changing γ1 either increases or decreases the total cost for all values
of w. The first-order condition for optimality is therefore J2(w,γ1,γ2) = 0. We
conclude that
∂C1
∂γ2
=
∂C2
∂γ2
= 0.
Taking the derivative of (5) with respect to γ1 gives
J12(wD,γ1,γ2) = 0
∂C1
∂γ1
z1wz1−1
D +
∂C2
∂γ1
z2wz2−1
D +
w∗
(1 − w∗
)
(1 + (γ1 − 1)w∗)2
[C1z1(z1 − 1)wz1−2
D 2C2z2(z2 − 1)wz2−2
D +
λσ2
r − 2a − b2
] = 0
w∗
(1 − w∗
)
(1 + (γ1 − 1)w∗)2
J11(wD,γ1,γ2) = 0,
which gives the desired result for the second derivative at the lower boundary.
The proof is identical for the upper boundary.