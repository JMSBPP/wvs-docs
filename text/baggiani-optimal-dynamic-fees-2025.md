---
sha256: cc7cb6c3e263f3ee5d11e6919a1df212fc206ddfa99c778126da677d972f1361
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 52678
---
arXiv:2506.02869v2 [q-fin.TR] 24 Jun 2025
Optimal Dynamic Fees in Automated Market Makers
Leonardo Baggiani∗†
Martin Herdegen‡
Leandro Sánchez-Betancourt§
June 26, 2025
Abstract
Automated Market Makers (AMMs) are emerging as a popular decentralised trading plat-
form. In this work, we determine the optimal dynamic fees in a constant function market maker.
We find approximate closed-form solutions to the control problem and study the optimal fee
structure. We find that there are two distinct fee regimes: one in which the AMM imposes
higher fees to deter arbitrageurs, and another where fees are lowered to increase volatility and
attract noise traders. Our results also show that dynamic fees that are linear in inventory and
that track changes in the external price are a good approximation of the optimal fee structure
and thus constitute suitable candidates when designing fees for AMMs.
Keywords: decentralized finance, automated market makers, optimal fees, arbitrageurs, noise
trading.
Mathematics Subject Classification (2020): 93E20, 91B70.
JEL Classification: C61, G23, D53.
## 1 Introduction
In recent years, automated market makers (AMMs) have gained popularity as a key innovation in
financial technology, fundamentally changing the way liquidity is provided and exchanged within
decentralized finance (DeFi) ecosystems. An AMM is a decentralized venue, where liquidity pro-
vision and liquidity taking follow rules that are encoded in smart contracts. As of 2025, the most
popular AMM is Uniswap, which began gaining widespread adoption with its v2 version and has
now reached v4; see Adams et al. (2020, 2021, 2024) for the white papers on versions v2 to v4, and
Bachu et al. (2025) for a detailed overview of the v4 protocol.
The early works of Capponi and Jia (2021), Bartoletti et al. (2021), Angeris and Chitra (2020),
∗
Corresponding author: leonardo.baggiani@warwick.ac.uk
†
Department of Statistics, University of Warwick
‡
Department of Mathematics, University of Stuttgart
§
Mathematical Institute and Oxford-Man Institute of Quantitative Finance, University of Oxford
1Angeris et al. (2021), Cartea et al. (2022) and Angeris et al. (2023) first explain how these ex-
changes operate and introduce the problem of liquidity provision in AMMs. As shown by Cartea
et al. (2023, 2024b), Milionis et al. (2022), and Fukasawa et al. (2025), liquidity provision in the
absence of fees leads to losses for liquidity providers. There are two well-understood types of losses:
loss-versus-rebalancing (LVR) and impermanent loss (IL). Milionis et al. (2024) describe LVR as
the loss incurred by LPs relative to a trading strategy (the “rebalancing strategy”) that
holds the same risky positions as the pool, but that trades at market prices rather than
AMM prices.
On the other hand, IL is the difference in value between holding the assets inside the pool and
holding the assets outside of the pool. The name impermanent is due to the fact that if the market
condition reverse, the losses disappear.
To address the IL issue, the literature has generally taken two main approaches. The first is
to redesign automated market makers (AMMs) to better account for spot price volatility. For
instance, Bergault et al. (2024b) propose an oracle-based AMM, where price discovery is not de-
termined solely by liquidity takers. Instead, their pricing function integrates external information
about the current market price of the risky asset.
The second approach focuses on finding trading strategies that allow liquidity providers to adapt
to changing market conditions. Capponi and Zhu (2025) tackle the issue of IL by determining an
optimal exit strategy for liquidity providers. Fukasawa et al. (2023) address IL in constant func-
tion market makers by employing a weighted variance swap for hedging, and in a follow up study,
Fukasawa et al. (2024) demonstrate a super-hedging strategy for IL that holds regardless of the
oracle price dynamics. Most recently, Sepp et al. (2024) show that IL can be fully hedged using
European put and call options.
To find solutions for the loss-versus-rebalancing problem, much of the research has centered on
improving AMM designs to make liquidity provision less vulnerable to arbitrageurs. Several no-
table works in this direction include Adams et al. (2025), who introduce an auction-based AMM
in which a pool “manager” captures arbitrage profits and rewards liquidity providers accordingly;
Goyal et al. (2023), who convert LPs’ beliefs about future asset values into optimal trading func-
tions; and Cartea et al. (2024a), who generalize constant function market makers into decentralized
liquidity pools (DLPs), enabling LPs to mitigate loss-versus-rebalancing by selecting suitable quote
and impact functions and by monitoring external information. Another notable contribution is the
work by Nadkarni et al. (2024), in which the authors investigate the problem of finding an optimal
dynamic trading curve with the focus is specifically on developing a strategy that effectively hedges
against loss-versus-rebalancing.
As shown by Milionis et al. (2024), loss-versus-rebalancing can be partially or fully hedged through
the collection of fees. Thus, the problem of determining optimal fees for AMMs has been an im-
2portant issue since the early stages of research in this area. Evans et al. (2021) focused on how to
find optimal fees for geometric mean market makers (G3Ms) while Fritsch (2021) studied how to
determine optimal fees in a setting of multiple liquidity pools competing with each other for trade
volume. He et al. (2024) determined the optimal fee structure for a liquidity provider who allocates
their capital between an automated market maker (AMM) and centralized trading venues. How-
ever, these works only address the problem of finding constant static fees. Sabate-Vidales and Šiška
(2023) address the loss-versus-rebalancing problem by setting dynamic fees although no optimality
is established. Hasbrouck et al. (2022) found how higher fees on decentralised exchanges (DEX)
can increase trading volume because higher fees attract more liquidity providers and boost the in-
ventory in the DEX. Recently, Aqsha et al. (2025) solve a stochastic leader-follower game between
the AMM and the liquidity providers in the venue. They find that under the equilibrium contract,
the liquidity providers have incentives to add liquidity to the pool only when higher liquidity on
average attracts more noise trading. In their work, the fee that the venue charges is proportional
to the trade size.
In this study, we address the problem of determining optimal dynamic fees for AMMs. As ar-
gued in Cao et al. (2023), the fees should adjust dynamically in order to reflect market conditions.
With the recent introduction of Uniswap v4, the implementation of dynamic fees is now possible.
Setting optimal fees is crucial because fees are the primary incentive for liquidity providers to en-
gage with the AMM as they help offset losses from impermanent loss. As a result, a platform
that optimizes fee collection can better compensate liquidity providers and, in turn, strengthen
its overall market position. Inspired by the work on market making by Avellaneda and Stoikov
(2008),1 we formulate a stochastic control problem in which the venue aims to maximize the total
fees collected in a liquidity pool consisting of two assets: a risky asset Y and a riskless asset X.
The control processes are p and m, representing the fees charged for selling and buying asset Y ,
respectively.2 These fees influence the exchange rate faced by liquidity takers: buying Y requires
paying more of asset X, while selling Y yields less of asset X. This, in turn, affects the order
flow. We model sell and buy orders using two point processes,{N+,p
t }t∈[0,T] and {N−,m
t }t∈[0,T], with
controlled stochastic intensities of the form:
λ+,p
t := λ+
exp k Zpt
+ (yp,m
t− ) − (St + ζ)

∆+
(yp,m
t− )

1{yp,m
t− <y},
λ−,m
t := λ−
exp −k Zmt
− (yp,m
t− ) − (St − ζ)

∆−
(yp,m
t− )

1{yp,m
t− >y}.
Here, St denotes the price of asset Y in terms of asset X on a centralized venue (e.g., Kraken,
Binance), while ∆−(yp,m
t− ) and ∆+(yp,m
t− ) represent the amounts that a liquidity taker trades when
buying and selling asset Y , respectively. The control problem we wish to solve is, in its full
1
For a comprehensive exposition of the market making problem and its generalisation see the monographs by
Cartea et al. (2015) and Gueant (2016).
2
We choose p for plus and m for minus because the quantity of asset Y in the pool increases after a trade that
pays p and decreases after a trade that pays m.
3generality, intractable. Therefore, we study two simplified cases using different approximations.
First, we assume that the external price St remains constant at S0. Under this assumption, we
derive in Theorem 4.1 the optimal fee policies and the corresponding value function. Second, we
approximate the exponential terms in the Hamilton–Jacobi–Bellman (HJB) equation using a linear-
quadratic expansion. This leads to an alternative tractable formulation from which we derive the
optimal fees and value function, as stated in Theorem 5.2. In both approximations, we obtain the
same insight: the venue finds it optimal to adopts two distinct fee regimes; one in which the AMM
imposes higher fees to deter arbitrageurs, and another where fees are lowered to increase volatility
and attract noise traders. Figures 1a and 1b illustrate the optimal buying and selling fees under the
first (left) and second (right) approximations, respectively, with the two fee patterns highlighted.
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing
volatility
Z(yt−) > St Z(yt−) < St
p∗
m∗
(a) Optimal fees for selling p∗
t (solid line) and for buy-
ing m∗
t (dashed line) at time t = 0.5 as a function of
the quantity of asset Y in the pool with the approxi-
mation that takes St = S0 for t ∈ [0,T].
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
Z(yt−) > St Z(yt−) < St
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing volatility
p∗
m∗
(b) Optimal fees for selling p∗
t (solid line) and for
buying m∗
t (dashed line) at time t = 0.5 as a function
of the quantity of asset Y in the pool with the linear
quadratic approximation of the stochastic intensities.
Finally, we run simulations to compare the performance of the optimal fee policies against alter-
native strategies. In the case of a constant external price, we find that the optimal fees outperform
constant fee strategies by a significant margin. Furthermore, a linear approximation of the optimal
policies proves to be sufficiently accurate, yielding nearly identical revenue outcomes. Our results
suggest that the optimal fees balance two competing objectives: setting fees high enough to max-
imize per-trade revenue while simultaneously increasing the quadratic variation of the marginal
price, thereby attracting increased noise trading. A similar pattern emerges under the second ap-
proximation, where the revenue generated by the optimal fees also exceeds that of the alternative
strategies.
The remainder of the paper is organised as follows. Section 2 introduces the model that we use,
sets up the control problem and the performance criterion that the venue wants to maximize. In
Section 3 we compute the optimal policies. Sections 4 and 5 are dedicated to finding the value
functions for the first and second approximation, respectively. Finally, in Sections 4.1 and 5.1 we
4carry out simulations to illustrate our theoretical results.
## 2 The model
We study an automated market maker (AMM) with a finite time horizon T > 0. More precisely,
we consider a constant function market (CFM) pool inside the reference AMM with a riskless asset
X and a risky asset Y . Let p2 > 0 denote the depth of the pool and let f : R+ × R+ → R+ be
the trading function, which is strictly increasing and twice differentiable in both arguments. The
trading condition is f(x,y) = p2, where x and y denote the amounts in assets X and Y , respectively.
We can rewrite this condition using the level function φ : R+ → R+ satisfying f(φ(y),y) = p2.
The latter is then automatically differentiable and decreasing, and we assume in addition that it is
convex in order to exclude roundtrip arbitrage, see Cartea et al. (2024b). These assumptions are
satisfied by the most popular CFMs such as constant product markets (CPMs) where f(x,y) = xy
and φ(y) = p2/y.
We assume that quantity of asset Y in the pool takes values in a finite grid given by
{y−N
:= y,...,y0
,...,yN
:= y},
where y and y can be interpreted as reserve constraints satisfying 0 < y < y0 < y < p2.
Consequently, the quantity of asset X in the pool takes values in the grid
{x−N
:= φ(y−N
),...,x0
:= φ(y0
),...,xN
:= φ(yN
)}.
Note that the monotonicity of the grids for the two assets are opposite to each other: the grid for
asset Y is increasing, whereas the grid for asset X is decreasing.
There are three basic exchange rates for the price of asset Y in units of asset X in terms of the
quantity of asset Y in the pool that we use throughout the paper. To fix notation, let yi denote
the quantity of asset Y in the pool just before the trade of a liquidity taker.
(a) The marginal exchange rate describes the price of an infinitesimal trade and is given by
Z(yi
) := −φ′
(yi
).
(b) The exchange rate for buying (taking out of the pool) ∆−(yi) := yi −yi−1 units of asset Y is
given by
Z−(yi
) :=
φ(yi−1) − φ(yi)
∆−(yi)
.
It takes values in the grid
{Z−N+1
− := Z−(y−N+1
),...,Z0
− := Z−(y0
),...,ZN
− := Z−(yN
)}.
5(c) The exchange rate for selling (depositing in the pool) ∆+(yi) := yi+1 −yi units of asset Y is
given by
Z+(yi
) :=
φ(yi) − φ(yi+1)
∆+(yi)
.
It takes values in the grid
{Z−N
+ := Z+(y−N
),...,Z0
+ := Z+(y0
),...,ZN−1
+ := Z+(yN−1
)}.
Note that exchange rates for buying and selling satisfy the identity
Zi
− = Zi−1
+ , i ∈ {−N + 1,...,0,...N}.
We now add proportional transaction cost to the trading mechanism, and model the fees for
buying and selling by the functions m : {y−N,...,yN} → R and p : {y−N,...,yN} → R, respec-
tively.3 The fees are collected in units of the riskless asset X and are deposited outside of the
pool. The corresponding (fee-depending) exchange rates can then be described in the following
way, where yi denotes the quantity of asset Y in the pool just before the trade.
(a) The exchange rate with fee structure m for buying (taking out of the pool) ∆−(yi) := yi−yi−1
units of asset Y is given by
Zm
−(yi
) := (1 + m(yi
))Z−(yi
).
(b) The exchange rate with fee structure p for selling (depositing in the pool) ∆+(yi) := yi+1 −yi
units of asset y is given by
Zp
+(yi
) := (1 − p(yi
))Z+(yi
).
In this paper the AMM mechanism works independently of the fee structure because the fees
charged by the venue go to the venue’s cash account to be redistributed at a later stage. In the
pool, trading is carried out via the rates Z+ and Z− so that the depth p2 does not change. However,
from the point of view of the liquidity taker, the exchange rates include fees.
Our model aims to study how the AMM sets fees dynamically in order to maximize revenue
coming from the order flow. We fix a probability space (Ω,F,F = {Ft}t∈[0,T],Pp,m) supporting
all the processes we use below.4 We model one representative liquidity taker (LT) and assume
that their buy and sell order arrivals are described by controlled point processes {N−,m
t }t∈[0,T] and
{N+,p
t }t∈[0,T], respectively, where the fee structure processes {pt}t∈[0,T] and {mt}t∈[0,T] are assumed
to be predictable. In this work, the depth of the pool p2 is fixed throughout [0,T], that is, T is
3
Although one would expect that m,p ∈ [0,1], we do not impose this condition since it turns out to be optimal to
sometimes charge negative fees, meaning that the venues pays liquidity takers to trade in a given direction.
4
A rigorous definition of the probability space would involve a weak formulation of the control problem because
the controls affect the intensities of the jump processes that inform the filtration. We leave this rigorous treatment
out of the paper for readability. See Section 3.1 in Barucci et al. (2025) for a formal treatment of this issue.
6small enough so that LPs do not add or remove liquidity from the pool. This allows us to study
liquidity taking and optimal fees in isolation.
The controls will operate in such a way that the difference N+,p − N−,m takes values in
{−N,...,N}. The quantity of asset Y at time t ∈ [0,T] is then given by
Y p,m
t := yN+,p
t −N−,m
t .
The controlled intensities of {N−,m
t }t∈[0,T] and {N+,p
t }t∈[0,T] are given by
λ−,m
t := λ−
exp −k(Zmt
− (Y p,m
t− ) − (St − ζ))∆−
(Y p,m
t− )

1{Y p,m
t− >y},
λ+,p
t := λ+
exp k(Zpt
+ (Y p,m
t− ) − (St + ζ))∆+
(Y p,m
t− )

1{Y p,m
t− <y}.
Here, λ− and λ+ are some baseline intensities, k > 0 is an exponential decay parameter (similar to
that in Avellaneda and Stoikov (2008)), {St}t∈[0,T] denotes the midprice in a centralised exchange
(outside of the pool) of asset Y in terms of the riskless asset X, the so-called oracle price, and
ζ > 0 is the corresponding half-spread in the centralised exchange. We assume that {St}t∈[0,T] has
dynamics given by
St = S0 + σWt,
where {Wt}{t∈[0,T]} is a Brownian motion.
The controlled stochastic intensities λ−,m
t and λ+,p
t aim to capture the following stylised fact:
when Zmt
− (Y p,m
t− ) < St − ζ, buying ∆−(Y p,m
t− ) units to the pool and selling the same amount from
the external venue is profitable to arbitrageurs. Thus, all else being equal, the buy intensity λ+,p
t
increases. Similarly, when Zpt
+ (Y p,m
t− ) > St + ζ, selling ∆+(Y p,m
t− ) units to the pool and buying
the same amount from the external venue is profitable to arbitrageurs, and the sell intensity λ+,p
t
increases. In order to make the notation simpler, we incorporate e−kζ into λ+ and λ− and formally
set ζ := 0.
The cumulative fees {Cp,m
t }t∈[0,T] collected by the AMM are in turn given by
Cp,m
t =
Z t
0
puZpu
+ (Y p,m
u− )∆+
(Y p,m
u− )dN+,p
u +
Z t
0
muZmu
− (Y p,m
u− )∆−
(Y p,m
u− ))dN−,m
u , t ∈ [0,T].
The performance criterion of the venue is given by
J(m,p) := E

Cp,m
T −
Z T
0
P(Y p,m
t ,St)dt

,
where P is a penalty function. An example of the function P that we consider below is the quadratic
distance between the oracle price St and the instantaneous exchange rate Z(yt), i.e.,
P(Y p,m
t ,St) = ϕ(Z(Y p,m
t ) − St)2
.
7Note, however, that P is not needed to add concavity to the problem, because the term CT itself
is concave in the controls. Our main results and insights are obtained when P = 0.
## 3 Characterization of the value function
The AMM seeks to solve the control problem
v(t,c,y,s) := sup
(m,p)∈At
v(m,p)
(t,c,y,s),
where At denotes the set of all F-predictable and bounded fee structure processes (mu,pu){t≤u≤T}
and the conditional performance criterion is given by
v(m,p)
(t,c,y,s) := E(t,c,y,s)

C
(t,c,y,s,m,p)
T −
Z T
t
P(Y (t,c,y,s,m,p)
u ,S(t,c,y,s)
u )du

.
Here, {C
(t,c,y,s,m,p)
u }u∈[t,T], {Y
(t,c,y,s,m,p)
u }u∈[t,T] and {S
(t,c,y,s)
u }u∈[t,T] denote the (controlled) processes
C, y and S restarted at time t with initial value c, y and s, respectively. From the dynamic
programming principle, we determine that the Hamilton-Jacobi-Bellman (HJB) equation satisfied
by the value function is:
∂
∂t
v(t,y,c,s) +
σ2
2
∂2
∂s2
v(t,y,c,s) − P(y,s)
+ λ+
ek(Z+(y)−s)∆+(y)
sup
p∈R
e−kpZ+(y)∆+(y)

v(t,y + ∆+
(y),c + pZ+(y)∆+
(y),s) − v(t,c,y,s)

!
1{y<y}
(3.1)
+

λ−
e−k(Z−(y)−s)∆−(y)
sup
m∈R
e−kmZ−(y)∆−(y)

v(t,y − ∆−
(y),c + mZ−(y)∆−
(y),s) − v(t,c,y,s)


1{y>y} = 0,
with terminal condition v(T,y,c,s) = c. The terms in this HJB equation have an intuitive inter-
pretation. The terms
v(t,y +∆+
(y),c+pZ+(y)∆+
(y))−v(t,y,c,s), v(t,y −∆−
(y),c+mZ−(y)∆−
(y))−v(t,y,c,s),
represent the difference in the value function before and after a trade. If there is a sell trade,
the quantity of asset y in the pools jumps from y to y + ∆+(y), and the AMM collects fees that
amount to pZ+(y)∆+(y), i.e., the percentage of fees p times the quantity traded ∆+(y) times the
sell exchange rate at the moment of the trade Z+(y). Symmetrically, when there is a buy trade,
the grid for the risky asset moves from y to y −∆−(y), and the AMM collects fees that amount to
mZ−(y)∆−(y). Each of the differences is multiplied by the respective intensity of order arrival.
Next, we make the ansatz v(t,y,c,s) = g(t,y,s) + c, to obtain that g(t,y,s) satisfies the HJB
8equation
∂
∂t
g(t,y,s) +
σ2
2
∂2
∂s2
g(t,y,s) − P(y,s)
+ λ+
ek(Z+(y)−s)∆+(y)
sup
p∈R
e−kpZ+(y)∆+(y)

g(t,y + ∆+
(y),s) − g(t,y,s) + pZ+(y)∆+
(y)

!
1{y<y}
(3.2)
+

λ−
e−k(Z−(y)−s)∆−(y)
sup
m∈R
e−kmZ−(y)∆−(y)

g(t,y − ∆−
(y),s) − g(t,y,s) + mZ−(y)∆−
(y)


1{y>y} = 0,
with terminal condition g(T,y,s) = 0. The corresponding maximizers are given by
p∗
(t,y) :=
g(t,y,s) − g(t,y + ∆+(y),s)
Z+(y)∆+(y)
+
1
kZ+(y)∆+(y)
,
m∗
(t,y) :=
g(t,y,s) − g(t,y − ∆−(y),s)
Z−(y)∆−(y)
+
1
kZ−(y)∆−(y)
.
(3.3)
Plugging the maximizers in (3.2), we obtain
∂
∂t
g(t,y,s) +
σ2
2
∂2
∂s2
g(t,y,s) − P(y,s)
+
λ+e−ks∆+(y)−1
k
ekZ+(y)∆+(y)
ek(g(t,y+∆+(y),s)−g(t,y,s))
!
1{y<y} (3.4)
+
λ−eks∆−(y)−1
k
e−kZ−(y)∆−(y)
ek(g(t,y−∆−(y),s)−g(t,y,s)
!
1{y>y} = 0.
## 4 Constant oracle price
To compute the first approximate solution, we take St = S0, which is equivalent to assuming that
σ = 0. In Section 5 we return to the case σ > 0. With this assumption the reduced value function
g no longer depends on s and the Hamilton-Jacobi-Bellman equation (3.4) simplifies to
∂
∂t
g(t,y) − P(y,s)
+
λ+e−ks∆+(y)−1
k
ekZ+(y)∆+(y)
ek(g(t,y+∆+(y))−g(t,y))
!
1{y<y} (4.1)
+
λ−eks∆−(y)−1
k
e−kZ−(y)∆−(y)
ek(g(t,y−∆−(y))−g(t,y)
!
1{y>y} = 0.
9We make the substitution ekg(t,y) = w(t,y) which transforms (3.4) into a linear system of ODEs of
the form
∂
∂t
w(t,y) − kP(y,s)w(t,y)
+

λ+
e−ks∆+(y)−1
ekZ+(y)∆+(y)
w(t,y + ∆+
(y))

1{y<y} (4.2)
+

λ−
eks∆−(y)−1
e−kZ−(y)∆−(y)
w(t,y − ∆−
(y))

1{y>y} = 0.
The solution to the system is summarized in the following theorem. The proof is straightforward
and hence, omitted.
Theorem 4.1. Define the matrix A := (Ai,j)0≤i≤j≤2N by
Ai,j :=

      
      
−kP(yj−N,s) if i = j,
λ+e−ks∆+(yj−N)−1ekZ+(yj−N)∆+(yj−N) if i = j − 1,
λ−eks∆−(yj−N)−1e−kZ−(yj−N)∆−(yj−N) if i = j + 1
0 otherwise,
and denote with 1 the unit vector of R2N. Define the function w : [0,T] × {y−N,...,yN} → R by
w(t,yi
) := (exp(A(T − t))1)i,
and the function v : [0,T] × {y−N,...,yN} × R+ → R as
v(t,yi
,c) = c +
1
k
log(w(t,yi
)).
Then v solves the Hamilton-Jacobi-Bellman equation
∂
∂t
v(t,yi
,c) − P(yi
,s)+
λ+
e−ks∆+(yi)
sup
p∈R
ekZ+(p,yi)∆+(yi)

v(t,yi+1
,c + pZ+(yi
)∆+
(yi
)) − v(t,yi
,c)

!
1{yi<yN}

λ−
eks∆−(yi)
sup
m∈R
e−kZ−(m,yi)∆−(yi)

v(t,yi−1
,c + mZ−(yi
)∆−
(yi
)) − v(t,yi
,c)


1{yi>y−N} = 0,
with boundary condition v(T,y,c) = c. Moreover, the corresponding optimizers are independent of
c and satisfy
p∗
(t,yi
) :=
1
kZ+(yi)∆+(yi)

1 + log

w(t,yi)
w(t,yi+1)

, (4.3)
m∗
(t,yi
) :=
1
kZ−(yi)∆−(yi)

1 + log

w(t,yi)
w(t,yi−1)

, (4.4)
10for yi ∈ {y−N = y,...,y0 = y0,...,yN = y}.
## 4.1 Optimal fee structure
We perform numerical simulations of the results found in Theorem 4.1. We assume that the AMM
is a CPM, where the trading function f : R+ × R+ → R+ is f(x,y) := xy and the level function
φ : R+ → R+ is φ(y) := p2/y. We assume that the the grid for y is such that after every trade the
exchange rate Z(y) moves by 0.1. More precisely, the grid for the risky asset is in turn given by
the formula
yi
:=
v
u
u
t
p2

p2
y0
− 0.1i
, for i ∈ {−20,...,20}.
We take the time horizon T = 1, the two baseline intensities λ− = λ+ = 50, the rate of exponential
decay k = 2, the oracle price S0 = 100, and the penalty function P(y,s) = ϕ(Z(y)−s)2. Moreover,
we assume that the initial conditions of the pool are p2 = 108 and y0 = 1000. Figure 2a shows the
optimal fees in the case where the penalization constant ϕ = 0.
From the plot in Figure 2a we see that the AMM charges fees in two different regimes. When the
quantity of asset y is below the value of y0 it is more profitable to sell inside the AMM with respect
to the oracle price, hence the AMM will charge high fees to penalize arbitrageurs. At the same time
it will charge low fees to buy, even negative ones, in order to encourage noise traders to trade inside
the venue and increase the volatility in the price. Symmetrically, the analogous happens when the
quantity is above the value of y0. Figure 2b shows that if the quantity of asset Y stays in a small
enough neighbourhood of y0, a linear approximation of the fees is a good enough approximation.
Below we show that the linear approximation generates revenues close to the optimal strategy.
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing
volatility
Z(yt−) > St Z(yt−) < St
p∗
m∗
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool.
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing
volatility
Z(yt−) > St Z(yt−) < St
p∗
m∗
(b) Linear fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool.
The behaviour of the fees is highly dependent on the value of the parameter k. Indeed, as
the value of the parameter k gets smaller, the probability of arrival becomes less sensitive to price
11changes. As a response to this, the AMM prioritizes pushing the price as close to the oracle price
as possible to get away from the boundaries where it does not generate revenues. We can observe
this phenomenon in Figure 3a and Figure 3b for k = 1 and k = 0.25, respectively.
990 995 1000 1005 1010
yt−
0.0125
0.0150
0.0175
0.0200
0.0225
0.0250
0.0275
(p ∗
, m ∗
)
Z(yt−) > St Z(yt−) < St
p∗
m∗
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) multiplied by k at
time t = 0.5 as a function of the quantity of asset Y
in the pool when k = 1.
990 995 1000 1005 1010
yt−
0.0125
0.0150
0.0175
0.0200
0.0225
0.0250
0.0275
0.0300
(kp ∗
, km ∗
)
Z(yt−) > St Z(yt−) < St
kp∗
km∗
(b) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) multiplied by k at
time t = 0.5 as a function of the quantity of asset Y
in the pool when k = 0.25.
The following corollary gives a rigorous mathematical characterization of this behaviour. The
proof is straightforward and hence, omitted.
Corollary 4.2. Define the matrix A := (Ai,j)0≤i≤j≤2N by
Ai,j :=

   
   
λ+e−1 if i = j − 1,
λ−e−1 if i = j + 1,
0 otherwise,
and denote with 1 the unit vector of R2N. Define the function w : [0,T] × {y−N,...,yN} → R by
w(t,yi
) := (exp(A(T − t))1)i,.
Let p∗ and m∗ be the optimal fees from Theorem 4.1 and define the quantities
p∗
0(t,yi
) :=
1
Z+(yi)∆+(yi)

1 + log

w(t,yi)
w(t,yi+1)

(4.5)
m∗
0(t,yi
) :=
1
Z−(yi)∆−(yi)

1 + log

w(t,yi)
w(t,yi−1)

. (4.6)
We have that
lim
k→0
kp∗
(t,yi
) = p∗
0(t,yi
) and lim
k→0
km∗
(t,yi
) = m∗
0(t,yi
), (4.7)
12for every t ∈ [0,T] and yi ∈ {y−N,...,yN}.
The next plots illustrates the corollary. More precisely, we compare k∗p∗ and k∗m∗ for k = 0.1
(left figure) with the limit optimal fees p∗
0 and m∗
0 (right figure) in (4.2).
990 995 1000 1005 1010
yt−
0.010
0.015
0.020
0.025
0.030
(kp ∗
, km ∗
)
Z(yt−) > St Z(yt−) < St
kp∗
km∗
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) multiplied by k at
time t = 0.5 as a function of the quantity of asset Y
in the pool when k = 0.5.
990 995 1000 1005 1010
yt−
0.010
0.015
0.020
0.025
0.030
(p ∗
0 , m ∗
0 )
Z(yt−) > St Z(yt−) < St
p∗
0
m∗
0
(b) Optimal fees for selling p∗
0(t,yt−) (solid line) and
for buying m∗
0(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool.
Next we discuss how the optimal fees behave as functions of ϕ. If we increase ϕ, the AMM
tries to keep prices aligned to the external price by pushing quantities of asset Y away from the
boundaries. To this end, it charges low fees to sell and high fees to buy when the price is less than
the oracle price and vice versa when the price is high. Figure 5a and Figure 5b show the fees as a
function of quantity and penalization constant when t = 0.5, for k = 2 and k = 0.1 respectively.
The curves corresponding to ϕ = 0 are the ones in Figure 2a and Figure 4a respectively .
990 995 1000 1005 1010
yt−
−0.010
−0.005
0.000
0.005
0.010
0.015
0.020
0.025
0.030
(p ∗
, m ∗
)
0
20
40
60
80
100
φ
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool and
of ϕ when k = 2.
990 995 1000 1005 1010
yt−
0.0
0.1
0.2
0.3
0.4
(p ∗
, m ∗
)
0
20
40
60
80
100
φ
(b) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y and of ϕ in the
pool when k = 0.1.
13As the penalty parameter ϕ increases, it alters both the shape and slope of the optimal fees.
When ϕ becomes sufficiently large, the penalty term dominates the allocation of the fees, with
alignment of quotes becoming a secondary effect. The following plots show the behaviour of the
fees as a function of time (x axis) and quantity in the pool (colorbar) for k = 2 and k = 0.1. The
effect present in the Figure 4a can be seen also in Figure 6b.
0.0 0.5 1.0
t
0.000
0.005
0.010
0.015
0.020
p ∗
t
0.0 0.5 1.0
t
m ∗
t
990.15 995.00 1000.00 1005.00 1010.15
yt−
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5
as a function of the quantity of asset Y (colorbar)
in the pool and of time when k = 2.
0.0 0.5 1.0
t
0.010
0.015
0.020
0.025
0.030
p ∗
t
0.0 0.5 1.0
t
m ∗
t
990.15 995.00 1000.00 1005.00 1010.15
yt−
(b) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5
as a function of the quantity of asset Y (colorbar)
and of time in the pool when k = 0.1.
Lastly we compare our optimal strategy with other different strategies:
(i) the linear strategy described in Figure 2b, where at each time with linearised p∗(t,y), m∗(t,y)
in a neighbourhood of y0, and
(ii) the constant strategy where the fees are constant for every time t and every quantity y. The
constant c is chosen as the average of the optimal two fees at t = 0.5 for y = y0, i.e.,
c =
p∗(0.5,y0) + m∗(0.5,y0)
2
.
We consider the following parameters p2 = 108, y0 = 1000, ϕ = 0, y = 980, y = 1020, T = 1
and we run simulations for different values of λ−, λ+ and k. We carry out 100,000 simulations and
we discretise [0,T] in 1,000 timesteps.5
We observe that the revenues are decreasing in the values of k and increasing in the value
of λ+ and λ−. The latter is because as λ+ and λ− increase the number of orders increase and
hence the revenue increases, similarly, as k decreases, the arbitrageurs react less to mispricing and
simultaneously, the optimal fees increase and thus the AMM collects more fees.
In the following table, the column fees shows the revenue from collecting fees, the column sell
shows the number of sell orders, the column buy shows the number of buy orders, and the column
QV shows the quadratic variation of the instantaneous exchange rate Z defined in Equation 1.
5
Our code is publicly available at https://github.com/leonardobaggiani/amm-fees.git.
14λ+ = λ− = 100 λ+ = λ− = 150
fees sell buy QV fees sell buy QV
k = 2
Optimal 35.55 35.89 35.91 0.69 52.97 53.45 53.47 1.01
Linear 35.55 35.88 35.91 0.69 52.97 53.44 53.48 1.01
Constant 35.16 35.15 35.16 0.68 52.26 52.26 52.26 0.99
k = 1
Optimal 71.46 35.92 35.94 0.69 106.38 53.47 53.50 1.01
Linear 71.46 35.91 35.95 0.69 106.38 53.46 53.51 1.01
Constant 71.22 35.60 35.62 0.69 105.90 52.94 52.96 1.00
We find that optimal strategy outperforms the constant strategy and the linear approximation
of the fees has a performance that is indistinguishable from that of the optimal strategy for the
above parameters. Thus, a linear fee structure is suitable when designing the fees to charge in these
venues.
## 5 Quadratic approximation with stochastic oracle price
For the second approximate solution we return to the original HJB equation in (3.4). Here, we
make a quadratic approximation of the exponential terms:
ek(−s∆+
(y)+Z+(y)∆+
(y)+g(t,y+∆+
(y),s)−g(t,y,s))
≈ 1 + k(−s∆+
(y) + Z+(y)∆+
(y) + g(t,y + ∆+
(y),s) − g(t,y,s))
+
1
2
[k(−s∆+
(y) + Z+(y)∆+
(y) + g(t,y + ∆+
(y),s) − g(t,y,s))]2
,
ek(s∆−
(y)−Z−(y)∆−
(y)+g(t,y−∆−
(y),s)−g(t,y,s))
≈ 1 + k(s∆−
(y) − Z−(y)∆−
(y) + g(t,y − ∆−
(y),s) − g(t,y,s))
+
1
2
[k(s∆−
(y) − Z−(y)∆−
(y) + g(t,y − ∆−
(y),s) − g(t,y,s))]2
.
The HJB in (3.4) becomes
∂
∂t
g(t,y,s) +
σ2
2
∂2
∂s2
g(t,y,s) − ϕ(Z(y) − s)2
+
e−1
λ+
k
[1 − k(s∆+
(y) + Z+(y)∆+
(y) + g(t,y + ∆+
(y),s) − g(t,y,s))
+
k2
2
(−s∆+
(y) + Z+(y)∆+
(y) + g(t,y + ∆+
(y),s) − g(t,y,s))2
]
e−1
λ−
k
[1 + k(s∆−
(y) − Z−(y)∆−
(y) + g(t,y − ∆−
(y),s) − g(t,y,s))
+
k2
2
(s∆−
(y) − Z−(y)∆−
(y) + g(t,y − ∆−
(y),s) − g(t,y,s))2
] = 0.
(5.1)
We assume that ∆−
(y) and ∆+
(y) are constant equal to δ−
and δ+
, respectively.
Remark 5.1. The assumption that ∆−
(y) and ∆+
(y) are constant is necessary if one wishes to carry out a
15quadratic expansion of the exponential terms. If we employ a linear approximation of the exponential terms,
we could work with the case where ∆−
(y) and ∆+
(y) are linear in y.
Lastly, we use a linear approximation to the exchange rates
Z(y) =
p2
y2
≈
p2
y2
0
− 2(y − y0)
p2
y3
0
,
Z+(y)δ+
=
p2
y2 + δ+y
≈
p2
y2
0 + δ+y0
− (y − y0)
p2
(2y0 + δ+
)
(y2
0 + δ+y0)2
,
Z−(y)δ−
=
p2
y2 − δ−y
≈
p2
y2
0 − δ−y0
− (y − y0)
p2
(2y0 − δ−
)
(y2
0 − δ−y0)2
.
In order to find a solution for the equation (5.1) we assume that g(t,y,s) is a quadratic polynomial in y
of the form
g(t,y,s) = y2
A(t) + yB(t,s) + C(t,s),
with A(T) = B(T,s) = C(T,s) = 0. Proposition (5.2) formalises the solution to the HJB equation.
Theorem 5.2. There exists constants6
{ψi}1≤i≤26 ⊂ R that define the unique solution to the HJB equation
(5.1) as follows. Let A : [0,T] → R be the solution to the Riccati ODE
ψ0 + ψ1A(t) + ψ2A2
(t) + A′
(t), A(T) = 0.
Let b0, b1 : [0,T] → R be the unique solutions to the system



ψ3 + ψ4A(t) + ψ5A2
(t) + ψ6A(t)b0(t) + ψ7b0(t) + b
′
0(t) = 0
ψ8 + ψ9A(t) + ψ10A(t)b1(t) + ψ11b1(t) + b
′
1(t) = 0,
with terminal conditions b0(T) = b1(T) = 0. Let c0, c1, c2 : [0,T] → R be the unique solutions to the system

  
  
ψ12 + ψ13A(t) + ψ14A2
(t) + ψ15A(t)b0(t) + ψ16b0(t) + ψ17b2
0(t) + σ2
c2(t) + c
′
0(t) = 0,
ψ18 + ψ19A(t) + ψ20A(t)b1(t) + ψ21b0(t) + ψ22b0(t)b1(t) + ψ23b1(t) + c
′
1(t) = 0,
ψ24 + ψ25b1(t) + ψ26b2
1(t) + c
′
2(t) = 0,
with terminal conditions c0(T) = c1(T) = c2(T) = 0. Define B̂,Ĉ : [0,T] × R → R as
B̂(t,s) = sb1(t) + b0(t),
Ĉ(t,s) = s2
c2(t) + sc1(t) + c0(t).
Then, the function
g(t,y,s) = y2
Â(t) + yB̂(t,s) + Ĉ(t,s),
is a solution to the HJB equation (5.1).
With the above results, the optimal fees from (3.3) become
6
The full definition of the constants {ψi}1≤i≤26 is publicly available in the GitHub of the project.
16p∗
(t,y) := −
(2y + δ+
)Â(t) + B̂(t,s)
Z+(y)
+
1
kZ+(y)δ+
,
m∗
(t,y) := −
(−2y + δ−
)Â(t) − B̂(t,s)
Z−(y)
+
1
kZ−(y)δ−
.
(5.2)
Observe that the fees depend linearly on y and s and they do not depend on σ.
## 5.1 Optimal fee structure: dynamic oracle price with second order approxima-
tion
We perform numerical simulations of the results found in Theorem 5.2. In order to make it consistent with the
hypothesis of the theorem, we assume that the traded amounts are ∆+
(y) = δ+
= 0.5 and ∆−
(y) = δ−
= 0.5.
We fix an initial value of y0 = 1000 which gives the following grid for y as
yi
= (1000 + i), for i ∈ {−20,−19.5,...,19.5,20}.
We take the time horizon T = 1, the two baseline intensities λ−
= λ+
= 50, the rate of exponential decay
k = 2, the oracle price St = S0 + σWt with S0 = 100, σ = 0.2 and ϕ = 0. As before, we assume that the
depth of the pool is p2
= 108
.
The next figures show the plot for the optimal fees of (5.2) and the comparison with the optimal fees
obtained with the first approximation. It is important to point out that the fees in (5.2) are no longer skewed
at the boundaries.
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
Z(yt−) > St Z(yt−) < St
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing volatility
p∗
m∗
(a) Optimal fees (second approximation Section 5) for
selling p∗
(t,yt−) (solid line) and for buying m∗
(t,yt−)
(dashed line) at time t = 0.5 as a function of the
quantity of asset Y in the pool.
990 995 1000 1005 1010
yt−
0.000
0.005
0.010
0.015
0.020
(p ∗
, m ∗
)
Z(yt−) > St Z(yt−) < St
penalizing arbitrageurs penalizing arbitrageurs
increasing volatility increasing volatility
p∗
m∗
(b) Optimal fees (first approximation Section 4) for
selling p∗
(t,yt−) (solid line) and for buying m∗
(t,yt−)
(dashed line) at time t = 0.5 as a function of the
quantity of asset Y in the pool.
The plot in Figure 7a confirm the insights we obtained from Figure 2a, namely that there are two distinct
regimes for the fee structure: one in which arbitrageurs are penalised and one that aim to increase volatility
and noise trading. Next, we study the case when k → 0. Here, the second order approximation does not
work well for smaller values of the parameters k. Indeed, since the fees are independent of σ we would expect
that as k → 0 the fees in (5.2) should resemble the one in Figure 4b, however, the next two figures show
that this is not the case. The explanation for this phenomenon comes from the fact that when k → 0 then
17A(t) → 0 and B(t) → ψ3t, hence the following holds.
Corollary 5.3. Let p∗
(t,y) and m∗
(t,y) be the optimal fees from Theorem 5.2 and define the quantities
p∗
0(t,yi
) :=
1
Z+(yi)δ+
(5.3)
m∗
0(t,yi
) :=
1
Z−(yi)δ−
. (5.4)
Then we have that
lim
k→0
kp∗
(t,yi
) = p∗
0(t,yi
) and lim
k→0
km∗
(t,yi
) = m∗
0(t,yi
), (5.5)
for every t ∈ [0,T] and yi
∈ {y−N
,...,yN
}.
Figures 8a and 8b illustrate the limiting behaviour described in Corollary (5.3).
990 995 1000 1005 1010
yt−
0.0190
0.0195
0.0200
0.0205
0.0210
(kp ∗
, km ∗
)
kp∗
km∗
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) for k = 0.25 at
time t = 0.5 as a function of the quantity of asset Y
in the pool.
990 995 1000 1005 1010
yt−
0.0196
0.0197
0.0198
0.0199
0.0200
0.0201
0.0202
0.0203
0.0204
(p ∗
0 , m ∗
0 )
p∗
0
m∗
0
(b) Optimal fees for selling p∗
0(t,yt−) (solid line) and
for buying m∗
0(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool.
The next two figures show how the optimal fees behave as functions of ϕ (left) and as a function of St
(right). Similarly to the first approximation there are two different regimes, one for ϕ = 0 and one for ϕ ̸= 0.
Indeed, when ϕ ̸= 0 the AMM tries to push the price away from the boundaries. Hence, when the quantity
of asset y is close to y it will charge high fees to buy and low (or even negative) fees to sell and when the
quantity of asset y is close to y we get the symmetric effect. As expected from the expression in (5.2), the
dependence on St is linear, furthermore, p decreases when St increases and m decreases as St increases.
18990 995 1000 1005 1010
yt−
−0.04
−0.02
0.00
0.02
0.04
(p ∗
, m ∗
)
0
20
40
60
80
100
φ
(a) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool and
ϕ (colorbar).
990 995 1000 1005 1010
yt−
−0.01
0.00
0.01
0.02
0.03
(p ∗
, m ∗
)
98
99
100
101
102
S t
(b) Optimal fees for selling p∗
(t,yt−) (solid line) and
for buying m∗
(t,yt−) (dashed line) at time t = 0.5 as
a function of the quantity of asset Y in the pool and
s (colorbar).
We now compare the value functions obtained from the two approximations. If σ = 0 then the value
function v(t,y,c) (right) from Theorem 4.1 is the true value function and we expect it to be close to the
function g(t,y,s) (left) in the case of σ = 0. The following figures shows the comparison between the plots
for g and v depending from time and the quantity of asset Y . The interval [0,1] has been discretized in 1000
time steps.
990
995
1000
1005
1010
yt−
0.0
0.2
0.4
0.6
0.8
1.0
t
0
5
10
15
20
25
g(t, y t− )
(a) Value function first approxi-
mation.
990
995
1000
1005
1010
yt−
0.0
0.2
0.4
0.6
0.8
1.0
t
0
5
10
15
20
25
v(t, y t− )
(b) Second approximation when
σ = 0.
990
995
1000
1005
1010
yt−
0.0
0.2
0.4
0.6
0.8
1.0
t
−0.4
−0.3
−0.2
−0.1
0.0
0.1
0.2
v(t, y t− ) − g(t, y t− ) (c) Difference between the two ap-
proximations.
Finally we compare the optimal strategy from the second-order approximation in (5.2) (Optimal SA) to
the following strategies:
(i) the optimal strategy from the first approximation (Optimal FA) implemented with a stochastic St
instead of S0,
(ii) the constant strategy where the fees are constant for every time t and every quantity y. The constant
c is chosen as the average of the optimal two fees at t = 0.5 for y = y0, i.e.,
c =
p∗
(0.5,y0) + m∗
(0.5,y0)
2
.
We use the following parameters: p2
= 108
, y0 = 1000, ϕ = 0, y = 990, y = 1010, T = 1 and we run
19simulations for different λ−
, λ+
and k. We carry out 100,000 simulations and we discretise [0,T] in 1,000
timesteps.
In the following table the column fees shows the revenue from collecting fees, the column sell shows
the number of sell orders, the column buy shows the number of buy orders and the column QV shows the
quadratic variation of the instantaneous exchange rate Z defined in Equation 1.
λ+
= λ−
= 100 λ+
= λ−
= 150
fees sell buy QV fees sell buy QV
k = 2
Optimal SA 35.62 35.90 35.91 0.69 53.05 51.60 51.60 0.98
Optimal FA 35.61 34.79 34.76 0.67 53.02 53.45 53.45 1.01
Constant 35.18 35.18 35.19 0.68 52.29 52.28 52.29 0.99
k = 1
Optimal SA 71.49 35.92 35.93 0.69 106.42 53.46 53.47 1.00
Optimal FA 71.51 35.47 35.44 0.68 106.38 53.46 53.51 1.01
Constant 71.23 35.60 35.61 0.69 105.90 52.91 52.91 1.00
As before, we find that either approximation yields a performance that is almost indistinguishable from
the other, and both outperform constant fees substantially. This supports the usage of linear dynamic fees
when designing fee structures in AMMs.
## 6 Conclusion
In this paper, we study how an AMM maximizes its revenue by setting optimal dynamic trading fees. We
find that the optimal fee schedule serves two distinct purposes. On the one hand, by monitoring external
prices, the AMM raises fees strategically to penalize arbitrageurs. On the other hand, it lowers fees to
increase price volatility, which attracts noise traders and stimulates trading volume. This dual approach
allows the AMM to balance the trade-off between deterring arbitrageurs and encouraging liquidity taking
through noise order flow.
Although in this paper we focus on a time-horizon that is small enough so that liquidity remains con-
stant, future work will look at the case of non-static liquidity; see e.g., Aqsha et al. (2025); Bergault et al.
(2024a). Similarly, one could also look at online learning algorithms (e.g., adaptation and learning with neu-
ral contextual bandits or reinforcement learning, as in Duran-Martin et al. (2022); Spooner et al. (2018)) to
automate the fees that AMMs charge, similar to what has been done in Nadkarni et al. (2023). Competition
between pools is another promising area of future work; see e.g., Boyce et al. (2025); Guo et al. (2024) for
studies in limit order books.
References
Austin Adams, Ciamac C. Moallemi, Sara Reynolds, and Dan Robinson. am-amm: An auction-managed
automated market maker. arXiv preprint arXiv:2403.03367, 2025.
20Hayden Adams, Noah Zinsmeister, and Daniel H. Robinson. Uniswap v2 core, 2020.
Hayden Adams, Noah Zinsmeister, Moody Salem, and Daniela Robinson. Uniswap v3 core, 2021.
Hayden Adams, Noah Zinsmeister, Moody Salem, Daniela Robinson, Sara Reynolds, Austin Adams, Will
Pote, Mark Toda, Alice Henshaw, and Emily Williams. Uniswap v4 core, 2024.
Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market makers. In Pro-
ceedings of the 2nd ACM Conference on Advances in Financial Technologies, 2020.
Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An Analysis of Uniswap
markets. Cryptoeconomic Systems, 0(1), apr 5 2021.
Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. Digital Finance, 2023.
Alif Aqsha, Philippe Bergault, and Leandro Sánchez-Betancourt. Equilibrium reward for liquidity providers
in automated market makers. arXiv preprint arXiv:2503.22502, 2025.
Marco Avellaneda and Sasha Stoikov. High-frequency trading in a limit order book. Quantitative Finance,
8(3):217–224, 2008.
Brad Bachu, Joel Hasbrouck, Fahad Saleh, and Xin Wan. An overview of uniswap v4 for researchers. SSRN,
2025. SSRN preprint.
Massimo Bartoletti, James Hsin-yu Chiang, and Alberto Lluch-Lafuente. A theory of automated market
makers in defi. In Coordination Models and Languages, Lecture Notes in Computer Science, 2021.
Emilio Barucci, Adrien Mathieu, and Leandro Sánchez-Betancourt. Market making with fads, informed, and
uninformed traders. arXiv preprint arXiv:2501.03658, 2025.
Philippe Bergault, Louis Bertucci, David Bouba, Olivier Guéant, and Julien Guilbert. Price-aware automated
market makers: Models beyond Brownian prices and static liquidity. arXiv preprint arXiv:2405.03496,
2024a.
Philippe Bergault, Louis Bertucci, David Bouba, and Olivier Guéant. Automated market makers: Mean-
variance analysis of lps payoffs and design of pricing functions. Digital Finance, 2024b.
Robert Boyce, Martin Herdegen, and Leandro Sánchez-Betancourt. Market making with exogenous compe-
tition. SIAM Journal on Financial Mathematics, 16(2):692–706, 2025.
David Cao, Leonid Kogan, Gerry Tsoukalas, and Brett Hemenway Falk. A structural model of automated
market making. SSRN preprint, 2023.
Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges. arXiv preprint
arXiv:2103.08842, 2021.
Agostino Capponi and Brian Zhu. Optimal exiting for liquidity provision in constant function market makers.
SSRN preprint, 2025.
Álvaro Cartea, Fayçal Drissi, Leandro Sánchez-Betancourt, David Siska, and Lukasz Szpruch. Strategic
bonding curves in automated market makers, 2024a. SSRN preprint.
21Álvaro Cartea, Sebastian Jaimungal, and José Penalva. Algorithmic and High-Frequency Trading. Cambridge
University Press, 2015. ISBN 978-1-107-09114-6.
Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralised finance and automated market making:
Execution and speculation. SSRN Electronic Journal, 2022. ISSN 1556-5068. doi: 10.2139/ssrn.4144743.
Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Predictable losses of liquidity provision in constant
function markets and concentrated liquidity markets. Applied Mathematical Finance, 30(2):69–93, 2023.
Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralized finance and automated market making:
Predictable loss and optimal liquidity provision. SIAM Journal on Financial Mathematics, 15(3):931–959,
2024b.
Gerardo Duran-Martin, Aleyna Kara, and Kevin Murphy. Efficient online bayesian inference for neural
bandits. In International conference on artificial intelligence and statistics, pages 6002–6021. PMLR,
2022.
Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric mean market makers. In
Financial Cryptography and Data Security. FC 2021 International Workshops, Lecture Notes in Computer
Science, 2021.
Robin Fritsch. A note on optimal fees for constant function market makers. In Proceedings of the 2021 ACM
CCS Workshop on Decentralized Finance and Security. Association for Computing Machinery, 2021.
Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Weighted variance swaps hedge against impermanent
loss. Quantitative Finance, 23(6):901–911, 2023.
Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Model-free hedging of impermanent loss in geometric
mean market makers with proportional transaction fees. Applied Mathematical Finance, pages 1–22, 2024.
Masaaki Fukasawa, Basile Maire, and Marcus Wunsch. Liquidity provision of utility indifference type in
decentralized exchanges. arXiv preprint arXiv:2502.01931, 2025.
Mohak Goyal, Geoffrey Ramseyer, Ashish Goel, and David Mazieres. Finding the right curve: Optimal
design of constant function market makers. In Proceedings of the 24th ACM Conference on Economics
and Computation, 2023.
Olivier Gueant. The financial mathematics of market liquidity. From optimal execution to market making.
Chapman Hall/CRC Financ. Math. Ser. Boca Raton, FL: CRC Press, 2016. ISBN 978-1-4987-2547-7;
978-1-4987-2548-4.
Ivan Guo, Shijia Jin, and Kihun Nam. Macroscopic market making games. arXiv preprint arXiv:2406.05662,
2024.
Joel Hasbrouck, Thomas J Rivera, and Fahad Saleh. The need for fees at a dex: How increases in fees can
increase dex trading volume. SSRN preprint, 2022. SSRN preprint.
Xue Dong He, Chen Yang, and Yutian Zhou. Optimal design of automated market makers on decentralized
exchanges. arXiv preprint arXiv:2404.13291, 2024.
22Jason Milionis, Ciamac C Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated market making
and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046, 2022.
Jason Milionis, Ciamac C Moallemi, and Tim Roughgarden. Automated market making and arbitrage profits
in the presence of fees. In International Conference on Financial Cryptography and Data Security, pages
159–171. Springer, 2024.
Viraj Nadkarni, Jiachen Hu, Ranvir Rana, Chi Jin, Sanjeev Kulkarni, and Pramod Viswanath. Zeroswap:
Data-driven optimal market making in defi. arXiv preprint arXiv:2310.09413, 2023.
Viraj Nadkarni, Sanjeev Kulkarni, and Pramod Viswanath. Adaptive curves for optimally efficient market
making. arXiv preprint arXiv:2406.13794, 2024.
Marc Sabate-Vidales and David Šiška. The case for variable fees in constant product markets: An agent-based
simulation. In Financial Cryptography and Data Security. FC 2022 International Workshops, Lecture
Notes in Computer Science, 2023.
Artur Sepp, Alex Lipton, and Vladimir Lucic. Unified approach for hedging impermanent loss of liquidity
provision. Available at SSRN, 2024.
Thomas Spooner, John Fearnley, Rahul Savani, and Andreas Koukorinis. Market making via reinforcement
learning. In Proceedings of the 17th International Conference on Autonomous Agents and MultiAgent
Systems, pages 434–442, 2018.
23