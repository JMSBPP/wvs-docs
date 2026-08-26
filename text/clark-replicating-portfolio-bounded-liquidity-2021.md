---
sha256: 5913a5a00be4e167fe569d45a00f462bb7a0477137c4e221df4da5ca1407a108
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 8969
---
The replicating portfolio of a constant product market
with bounded liquidity
Joseph Clark∗
August 3, 2021
Abstract
We derive the replicating portfolio and greeks for a constant product market with
bounded liquidity such as Uniswap v3. The portfolio value is concave in the relative
price of pool assets, short volatility, and can be effectively hedged in the same manner
as a vanilla option.
## 1 Introduction
A constant product market (CPM) is a mechanism to trade between a pair of assets without
an order book. Liquidity providers deposit some quantity of two assets into a pool, and any
swap preserves the product of reserves. Arbitrage ensures that the value of each side of the
pool is equal.
From a liquidity provider perspective, the situation is similar to selling an option. The
value of pool is concave in price, so always under-performs a linear future. The swap fee
revenue must be enough to compensate liquidity providers for this under-performance. This
is similar to a delta-hedged option seller requiring contributions from theta to offset losses
from gamma.
Constant product markets, and their generalization as constant function markets have
been extensively characterised by Angeris and coauthors in a series of papers (see in particular
(2) and (4)). The basic replicating portfolio and greeks were discussed in (6) and generalised
for for constant function markets in (3).
Bounded liquidity CPMs such as Uniswap v3 (1) generalize the mechanism by allowing
liquidity providers to concentrate liquidity over an interval. This improves capital efficiency
∗
Opyn. joecmail@gmail.com
1
Electronic copy available at: https://ssrn.com/abstract=3898384and reduces slippage over the interval. The bounded position behaves like an ordinary CPM
with a larger amount of ‘virtual’ reserves while the price is within the bound.
The value of the pool is a known function of the price and can be perfectly replicated with
a spanning portfolio of bonds, futures, and options. We provide the replicating portfolio in
section 5 and illustrate with an example.
## 2 Preliminaries
For the most part we follow the notation of (2) who examine constant product markets such
as Uniswap.
Definition 1: Bounded liquidity position
A bounded liquidity position is a tuple (t,Rβ,Rα,pa,pb) satisfying

Rα +
L
√
pb

(Rβ + L
√
pa) = L2
(1)
This can be seen as an ordinary constant product market on virtual reserves
Rvirtual
α Rvirtual
β = L2
while the price p = Rvirtual
β /Rvirtual
α is between pa and pb.
A transaction depositing ∆β at time t will receive ∆α satisfying
(Rvirtual
α − ∆α)(Rvirtual
β + ∆β) = L2
(2)
Actual reserves are updated according to Rβ 7→ Rβ + ∆β, Rα 7→ Rα − ∆α provided the
resulting actual reserves are positive.
Definition 2: Spot market
A spot market is a mechanism which exchanges ∆α units of α for pt
∆β units of β at time
t. An infinitely elastic spot market is one where pt
does is not depend on ∆β
## 3 Characterising actual and virtual liquidity
From 1 and 2 virtual and actual reserves be helpfully related to virtual liquidity and price
2
Electronic copy available at: https://ssrn.com/abstract=3898384Figure 1: Virtual and real liquidity
Rvirtual
α =
L
√
p
(3)
Rvirtual
β = L
√
p (4)
Rα =
L
√
p
−
L
√
pb
(5)
Rβ = L
√
p − L
√
pa (6)
The relationship between actual reserves and virtual reserves in 1 is illustrated in figure
1. Points on the virtual liquidity curve are feasible if they correspond to positive values for
actual liquidity Rα and Rβ.
While virtual liquidity is unbounded, actual liquidity is limited by the availability of
reserves. The maximum actual liquidity supported by a some virtual liquidity L is obtained
on the boundaries p = pa and p = pb
R+
α =
L
√
pa
−
L
√
pb
(7)
R+
β = L
√
pb − L
√
pa (8)
3
Electronic copy available at: https://ssrn.com/abstract=3898384Figure 2: Value function of bounded liquidity position
## 4 The value of a bounded liquidity position
The total value of actual liquidity measured in units of β is
V = Rαp + Rβ (9)
Using the conditions from 1 and 2 and the bounds for actual liquidity this is
V =

 
 
pR+
α , for p ≤ pa
2L
√
p − L
√
pa − p L √
pb
, for pa ≤ p ≤ pb
R+
β , for p ≥ pb
(10)
In the limiting case with pa = 0, pb = ∞ corresponds to an ordinary constant product
market. A typical value function is figure 2.
## 4.1 Leverage
The bounded liquidity position supports a larger value of virtual liquidity than a standard
pool. This efficiency can be characterised by the ratio of value between the virtual and actual
liquidity using 9 and 3-6
4
Electronic copy available at: https://ssrn.com/abstract=3898384(a) (b)
Figure 3: (a) Delta (b) Gamma
Leverage =
2
2 −
q
p
pb
−
q
pa
p
(11)
## 4.2 Greeks
The first and second order sensitivities are
CPM delta: DeltaCPM = ∂V
∂p
=

 
 
R+
α , for p ≤ pa
L √
p
− L √
pb
, for pa ≤ p ≤ pb
0, for p ≥ pb
CPM gamma: GammaCPM = ∂2V
(∂p)2 =

 
 
0, for p ≤ pa
−1
2
L
p3/2 for pa ≤ p ≤ pb
0, for p ≥ pb
(12)
Again the limiting case corresponds to an unbounded liquidity position for delta, and is
identical for gamma.
## 5 The replicating portfolio
To replicate V T
we use the spanning result of Green and Jarrow (1987) which provides that
any function W of a final price mT
can be replicated as
5
Electronic copy available at: https://ssrn.com/abstract=3898384W(ST
) = W(A)e−rT
+ W0
(A)(pT
− Ae−rT
) +
Z A
0
W00
(K)P(K)dK +
Z ∞
A
W00
(K)C(K)dK
(13)
Where r is the interest rate (from here we’ll assume r=0). We choose A = p0
(suppressing
the subscript) and replicate with a bond, futures, and strips of options on the underlying all
expiring at T and for p ∈ [pa,pb]:
Face value of bond: W(p0
) = 2L
p
p0 − L
√
pa − p
L
√
pb
Notional value of futures: W0
(p0
) =
L
p
p0
−
L
√
pb
Notional value of options at strike K: W00
(K) = −
1
2
L
K3/2
dK , K ∈ [pa,pb]
The appendix has an example of replication with limited strikes.
Appendix A. Example: Replicating a bounded liquidity
position with options
A liquidity provider provides 10 units of α to a liquidity position bounded on p ∈ [pa,pb] =
(5,15) with a current price p1
= 10.
To satisfy 1 the liquidity provider must also provide 159.611 units of β corresponding to
L ≈ 172.34
The corresponding virtual liquidity can be calculated directly
Rvirtual
α =
L
√
p
≈ 54.49 (14)
Rvirtual
β = L
√
p ≈ 544.95 (15)
(16)
The initial value of the pool (in units of β) is
V 1
= (p1
R1
α + R1
β) = 10 ∗ 10 + 159.61 = 259.61
6
Electronic copy available at: https://ssrn.com/abstract=3898384Figure 4: Constant product market value vs replicated value
The value of the virtual liquidity supported between the price range is
V 1,V irtual
= (p1
R1,virtual
α + R1,virtual
β ) ≈ 10 ∗ 54.49 + 544.95 ≈ 1089.90
If we hold a discrete number of strikes K = (5,6,...,15) payoff at expiry is a discretized
version of 13 (again with zero rates)
W(pT
) = W(p0
) + W0
(p0
)(pT
− p0
) +
X
K≤p0
W00
(K)P(K)∆K +
X
K>p0
W00
(K)C(K)∆K
Table 1 has the notional value of four strikes each for the calls and puts. Figure 4
compares the total value of the pool and the replicating portfolio for values of the exchange
rate at T.
References
[1] Adams, H, N. Zinsmeister, M. Salem, River Keefer, and D. Robinson, Uniswap v3 Core,
2021.
[2] Angeris, Guillermo, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra An
analysis of Uniswap markets, arXiv preprint arXiv:1911.03380, 2020.
7
Electronic copy available at: https://ssrn.com/abstract=3898384Table 1: Option notional by strike
Strike K Call notional Put notional
5 0 -7.71
6 0 -5.86
7 0 -4.65
8 0 -3.80
9 0 -3.19
10 0 -2.72
11 -2.36 0
12 -2.07 0
13 -1.83 0
14 -1.64 0
15 -1.48 0
[3] Angeris, Guillermo, Alex Evans, Tarun Chitra When does the tail wag the dog? Curvature
and market making, arXiv preprint arXiv:2012.08040, 2020
[4] Angeris, Guillermo, Akshay Agrawal, Alex Evans, Tarun Chitra, and Steven Boyd.
Constant Function Market Makers: Multi-Asset Trades via Convex Optimization,
forthcoming
[5] Carr, P., and Dilip Madan, Towards a theory of volatility trading, Option Pricing, Interest
Rates and Risk Management, Handbooks in Mathematical Finance (2001), 458–476
[6] Clark, J. The replicating portfolio of a constant product market Available at SSRN
3550601, 2020.
[7] Emanuel Derman, Kresimir Demeterfi, Michael Kamal, and Joseph Zou. A guide to
volatility and variance swaps. Journal of Derivatives, 6(4):9–32, 1999.
[8] Zhang, Yi, Xiaohong Chen, and Daejun Park Formal specification of constant product
(xy=k) market maker model and implementation, 2018.
[9] Green R, C., and R.A. Jarrow. Spanning and completeness in markets with contingent
claims. Journal of Economic Theory, Vol. 41, No 1, pp. 202-210, 1987.
8
Electronic copy available at: https://ssrn.com/abstract=3898384