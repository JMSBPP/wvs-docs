---
sha256: 9df1e64ab64715c3006ee4e448e6045670033aafe2def642e5ca4e9aa1a5dcfe
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 8678
---
The replicating portfolio of a constant product market
Joseph Clark∗
March 8, 2020
Abstract
We derive the replicating portfolio of a constant product market. This is structurally
short volatility (selling options) which explains why positive transaction costs are
needed to induce liquidity providers to participate. Where futures and options markets
do not exist, this payoff can be used to create them.
∗
RMIT Blockchain Innovation Hub. joecmail@gmail.com
Electronic copy available at: https://ssrn.com/abstract=35506011 Introduction
A constant product market (CPM) is a mechanism to trade between pairs of assets. A typical
CPM is a pool containing a quantity of both assets with a rule specifying the amount of one
asset that will be exchanged for another. Arbitrage with external spot markets ensures that
the ratio of the quantities of assets in the pool should be close to the prevailing exchange
rate.
Liquidity providers put up the pool of assets and are able to redeem at any time, receiving
a proportion according to the new ratio of assets as well as a share of transaction fees. It
can be shown that the payoff to liquidity providers is proportional to the square root of
the exchange rate between the two assets (see (1)). This payoff can be replicated precisely
with a static combination of futures and options. If these futures and options exist and are
tradable, the transaction fee charged by the CPM will be determined by the option prices
and the expected quantity of transactions. If the options do not exist the payoff of the CPM
can be used to create them.
This second replication of European options with the CPM payoff is a novel use of these
contracts, and one that has potential application to support new option markets without
requiring traditional option market makers.
## 2 Preliminaries
For the most part we follow the notation of (1) who examine constant product markets such
as Uniswap.
Definition 1: Constant product market
A constant product market (CPM) is a tuple (t,Rβ,Rα). A transaction depositing ∆β
at time t will receive ∆α satisfying
(Rα − ∆α)(Rβ + ∆β) = k (1)
1
Electronic copy available at: https://ssrn.com/abstract=3550601Where Rβ,Rα > 0, k = RαRβ. Reserves are updated according to Rβ 7→ Rβ + ∆β,
Rα 7→ Rα − ∆α.
For simplicity the initial reserves are exogenous.
Definition 2: Spot market
A spot market is a mechanism which exchanges ∆α units of α for mt
p∆β units of β at
time t. An infinitely elastic spot market is one where mt
p does is not depend on ∆β
## 3 The value of a constant product market
Summarising the development in Aegeris (2019) let mt
p be the price in the spot market. No
arbitrage gives mt
p = Rt
β/Rt
α. Combining with 1 gives
Rt
β =
q
kmt
p (2)
The return between two periods is
δt
=
mt
pRt
α + Rt
β
mt−1
p Rt−1
α + Rt−1
β
Substitute for mt
p and then for Rt
β
δt
=
Rt
β
Rt−1
β
=
s
mt
p
mt−1
p
The total gain in the portfolio value is
δ =
T Y
t=2
δt
=
s
mT
p
m1
p
The final portfolio value is the initial portfolio inflated by the gain
PT
V = (m1
pR1
α + R1
β)δ = 2
q
kmT
p
2
Electronic copy available at: https://ssrn.com/abstract=35506014 The replicating portfolio for the CPM
To replicate PT
V we use the spanning result of Green and Jarrow (1987) which provides that
any function W of a final price mT
can be replicated as
W(ST
) = W(A)e−rT
+ W0
(A)(mT
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
(3)
Where r is the interest rate (from here we’ll assume r=0). We choose A = m0
(suppressing
the subscript) and replicate with a bond, futures, and strips of options on the underlying all
expiring at T:
Face value of bond: W(m0
) = 2
√
km0
Notional value of futures: W0
(m0
) =
r
k
m0
Notional value of options at strike K: W00
(K) = −
1
2
r
k
K3
dK
The appendix has an example of replication with limited strikes.
## 5 Replicating European options from with the CPM
We now replicate in the other direction – creating a European call option from a CPM.
Unlike the previous replication this is neither perfect or static, though it can be made quite
precise even with limited re-hedging (see Appendix B).
Say we have a European call option expiring at T and the payoff of the CPM. We have
use of the following greeks:
3
Electronic copy available at: https://ssrn.com/abstract=3550601CPM delta: Deltat
CPM =
∂CPMt
∂mt
=
r
k
mt
CPM gamma Γt
CPM =
∂2
CPMt
(∂mt)2
= −
1
2
s
k
(mt)3
Call delta: Deltat
C =
∂Ct
∂mt
Call gamma Γt
C =
∂2
Ct
(∂mt)2
Call theta Θt
C =
∂Ct
∂t
We can replicate by matching exposures to the underlying. The hedge ratio to match
the gamma of the CPM and the call option is
HRt
=
Γt
C
Γt
CPM
The payoff of the call can be approximated with
∆V t
C ≈ DeltaC∆mt
+ 0.5Γt
C(∆mt
)2
+ Θt
C∆t (4)
The delta and gamma components can be approximated by holding combination of the
CPM and a futures contract on mt
. The replicating portfolio is:
Notional value of futures: Deltat
C − HRt
Deltat
CPM
Notional value of CPM: HRt
The payoff is
∆VC0 − Θt
C∆t = HRt
∆CMPt
+ Deltat
C − HRt
Deltat
CPM

∆mt
(5)
4
Electronic copy available at: https://ssrn.com/abstract=3550601Appendix B demonstrates the accuracy of the replicating portfolio for an at-the money
call with simulated prices.
## 6 Discussion
The existence of a static replicating portfolio for the CPM means that the payoff can be
perfectly hedged. In this case the transaction fee will be determined by these option prices
combined with an expectation of transaction quantity. On the other hand if there are no
option and futures markets, or if they are not tradeable, the payoff of the CPM itself can be
used to replicate the options.
5
Electronic copy available at: https://ssrn.com/abstract=3550601Appendix A. Example: Replicating a CPM with options
Consider a constant product market with state
(t,Rβ,Rα) = (1,10,200)
The price of β in units of α is m1
p =
Rβ
Rα
= 0.05.
The initial value of the pool (in units of β) is
P1
V = (m1
pR1
α + R1
β) = 0.05 ∗ 200 + 10 = 20
The replicating portfolio is:
Face value of bond: W(m0
p) = 2
q
km0
p = 2
√
2000 ∗ 0.05 = 20
Notional value of futures : W0
(m0
p) =
s
k
m0
p
=
r
2000
0.05
= 200
Notional value of options at strike K W00
(K) = −
1
2
r
k
K3
dK =
0.0125
2
r
2000
K3
If we hold a discrete number of strikes K = (0.125,0.025,...,0.1) payoff at expiry is a
discretized version of 3 (again with zero rates)
W(mT
) = W(m0
p) + W0
(m0
p)(mT
− m0
p) +
X
K≤mo
p
W00
(K)P(K)∆K +
X
K>mo
p
W00
(K)C(K)∆K
Table 1 has the notional value of four strikes each for the calls and puts. Figure 1
compares the total value of the pool and the replicating portfolio for values of the exchange
rate at T.
Appendix B. Example: Replicating an option with a CPM
We simulate 10000 paths of mt and record the value of the two replicating portfolios for a
30 day at-the-money call on mT
with a starting price m0
= 100, and constant 20% annual
volatility.
Figure 2 compares replication of the option using a futures and a rebalanced CPM (panel
(a) is equation 5) to a delta hedge (panel (b)). Figure 3 has the basis between the V T
C0
6
Electronic copy available at: https://ssrn.com/abstract=3550601Figure 1: Constant product market value vs replicated value
Table 1: Option notional by strike
Strike K Call notional Put notional
0.0125 0 -200
0.025 0 -70.7
0.0375 0 -38.5
0.05 0 -25
0.0625 -17.8 0
0.075 -13.6 0
0.0875 -10.8 0
0.1 -8.3 0
(equation 5) and V T
C (equation 4) as a fraction of the option price. 99% of replications are
within 0.7% of the target portfolio.
References
[1] Angeris, Guillermo, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra An
analysis of Uniswap markets, arXiv preprint arXiv:1911.03380, 2020.
[2] Carr, P., Wu, L., Variance risk premiums. Review of Financial Studies 22, 1311–1341,
2009.
7
Electronic copy available at: https://ssrn.com/abstract=3550601(a)
(b)
Figure 2: (a) Replication with CPM (b) Replication with delta
8
Electronic copy available at: https://ssrn.com/abstract=3550601Figure 3: Basis between replication with option greeks and CPM greeks
[3] Emanuel Derman, Kresimir Demeterfi, Michael Kamal, and Joseph Zou. A guide to
volatility and variance swaps. Journal of Derivatives, 6(4):9–32, 1999.
[4] Zhang, Yi, Xiaohong Chen, and Daejun Park Formal specification of constant product
(xy=k) market maker model and implementation, 2018.
[5] Green R, C., and R.A. Jarrow. Spanning and completeness in markets with contingent
claims. Journal of Economic Theory, Vol. 41, No 1, pp. 202-210, 1987.
9
Electronic copy available at: https://ssrn.com/abstract=3550601