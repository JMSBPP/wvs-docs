---
sha256: 9558856b4bbaa327a213786c732daecea48fbef74a66a704a43398c9373b09ea
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 10012
---
Spanning with Power Perpetuals
Joseph Clark∗
January 3, 2023
Abstract
Any continuous function can be spanned by a suitable portfolio of power perpetuals.
We generate this replicating portfolio, derive the arbitrage-free funding rates, and
demonstrate the replication and arbitrage-free swap fee for a Uniswap LP.
∗
Opyn Research. joe@opyn.co
Electronic copy available at: https://ssrn.com/abstract=43170721 Introduction
Power perpetual contracts give an exposure an asset price raised to a power. A sequence
of power perpetuals can replicate any continuous payoff function by matching the exposures
from its Taylor expansion. For example, constant product markets such as Uniswap can be
hedged with a square-root perpetual or a sequence of integer-power perpetuals (see (2)). A
European option under Black-Scholes-Merton assumptions can be hedged with a linear and
a quadratic perpetual (see (3)). 1
The arbitrage-free funding rate for any payoff is the sum of funding rates for the replicating
portfolio of power perpetuals. From this perspective, the funding rate for a European option
(theta) is a combination of the funding rates for the linear and quadratic perpetual. The
funding rate for a constant product AMM such as Uniswap (its fair yield from swap fees)
is the combination of funding rates for the sequence of power perpetuals that replicates its
payoff.
We proceed first by defining the mechanism for a power perpetual. Then we construct a
representation for power perpetuals in terms of power return swaps (where the floating leg of
the swap is a power of the asset return), and a corresponding representation for any function
of the return with a Taylor series. This gives the machinery to replicate any continuous
function of an asset return as a sequence of power return swaps. The replicating portfolio
of power perpetuals is a set of weights to each integer power perpetual (1-perpetual, 2-
perpetual, etc) that match the Taylor series for the target return. Finally, we demonstrate
the hedge for a constant product market maker using linear and quadratic perpetuals, and
show a convenient representation of the arbitrage-free yield from fees as a weighed sum of
funding rates of its replicating portfolio; this is approximately one eighth of the asset return
variance.
1
More generally, constant function market makers (see (1)) can be hedged with arbitrary precision with
a set of power perpetuals.
1
Electronic copy available at: https://ssrn.com/abstract=43170722 Power perpetuals
Power perpetuals ((4), (5), (3)) are perpetual contracts that target a power of an underlying
price. A first order perpetual targets the underlying price St, a second order perpetual
targets the square of the price, S2
t , and so forth.
Power perpetuals transfer a funding rate fp between longs to shorts that varies with the
distance between the traded price (mark) and the target price (index). A typical mechanism
calculates a funding rate as:
fp = λ

Mt − Sp
t
Mt

Where Mt is the prevailing traded price of the power perpetual and λ is a constant.
A power perpetual can be replicated with a sequence of fixed expiry power contracts with
payoffs Sp
T at expiry T. Each fixed expiry power contract can be replicated with a portfolio
of futures and options (see (3)).
## 2.1 From power perpetuals to power swaps
The return for the long side of the contract between t0 to t1 is
Sp
t1
− Sp
t0
(1 + fp)
Sp
t0
= (1 + rt0→t1)p
− fp − 1 =
" p
X
k=0

p
k

rk
t0→t1
#
− fp − 1 (1)
Where rt0→t1 = St1/St0 − 1, henceforth ignoring the subscript. This gives a useful
representation of the funding rate as a linear function of the swap rates.
fQ
p =
p
X
k=0

p
k

srk − 1
Where srp is the fixed rate for a swap paying rp
under the risk neutral measure. So for
example sr1 is the funding rate for a standard total return swap.
2
Electronic copy available at: https://ssrn.com/abstract=43170722.2 From power swaps to general payoff functions
Any continuous function of the underlying price return g(r) can be expanded as a Taylor
series
g(r) =
X
n=0
g(n)
(0)
n!
rn
≡
X
n=0
hn(g)rn
(2)
Matching terms between the Taylor expression 2 and the swap representation 1 gives the
spanning portfolio for g in power perpetuals and the funding rate for g(r).
## 3 Hedge construction
The replicating portfolio is defined in terms of a sequence of hedge ratios hp(g), exposures
to exposures to each rp
. So, for example, if h1(g) = 0.5 the first order (delta) hedge for g is
50%.
A p̄’th order replication using power perpetuals will be a set of notional amounts Nj to
each j-th power perpetual (from 2 and 1):
p̄
X
j=0
Nj (1 + r)j
− 1

=
p̄
X
j=0
hj(g)rj
This works as a partial replication for functions with non-zero higher order exposures,
correct up to O(rp+1
) terms.
## 4 Function swap rates
The funding rate for g(r) is the weighted swap rate for the component hedges.
fg =
p̄
X
j=0
Nj
j
X
k=0

j
k

srk
!
− 1
!
3
Electronic copy available at: https://ssrn.com/abstract=4317072The rates for the return swaps will typically know under the pricing measure. For
lognormal sr they will be functions of the non-central moments:
Order Rate
1 sr1 = c
2 sr2 = c2
+ σ2
3 sr3 = c3
+ 3cσ2
4 sr4 = c4
+ 6c2
σ2
+ 3σ4
Table 1: Power swap rates
Where σ2
is variance of the return and c is the carry (asset yield less numeraire yield).
## 5 Hedging a constant product AMM with power perpetuals
The value of full range constant product AMM, excluding fees, is (see (1), (2))
V LP
t = 2L
p
St
Where L is liquidity and St is the price of one unit of token0 in units of token1.
The return between two periods t0 and t1 is
rLP
t0→t1
=
V LP
t1
V LP
t0
− 1 =
s
St1
St0
− 1 =
p
1 + rt0→t1 − 1
where rt0→t1 is the price return
rt0→t1 =
St1
St0
− 1
The Taylor expansion around r = 0 is
rLP
t0→t1
=
X
n=0
g(n)
(0)
n!
|r=0rn
t0→t1
=
1
2
rt0→t1 −
1
8
r2
t0→t1
+
3
48
r3
t0→t1
−
15
384
r4
t0→t1
+ O(r5
t0→t1
)
4
Electronic copy available at: https://ssrn.com/abstract=4317072(a) (b)
Figure 1: (a) An LP and its Taylor series components (b) LP hedge error vs hedge order
This means the contract can be replicated with a 50% exposure to a return swap, a
-12.5% exposure to a quadratic swap, a +3.125% exposure to a cubic swap, and so forth.
The payoff and its components are in figure 1 (a). The replicating portfolio becomes
increasingly accurate with higher orders or returns in figure 1 (b).
In terms of power perpetuals the replicating portfolio is 0.75 1-perpetuals and 0.125
2-perpetuals (table 2).
Value Return First
order
Second
order
Third
order
Constant
product AMM
2L
√
St
√
1 + r − 1 − f 1/2 -1/8 3/48
Linear
perpetual
St r − sr 1 0 0
Quadratic
perpetual
S2
t 2r + r2
− sr2 2 1 0
Cubic
perpetual
S3
t r3
+3r2
+2r −sr3 2 3 1
AMM
Second-order
replication
0.75St − 0.125S2
t 0.75(r − sr
) −
0.125(2r+r2
−sr2)
1/2 -1/8 0
Table 2: Sensitivities for the constant product AMM and power perpetuals
The first and second order sensitives are like option greeks. The AMM has a delta of
1/2 and a gamma of 1/8; a 1-perpetual has a delta of 1 and no gamma; a quadratic power
perpetual has a delta of 2 and gamma of 1.
5
Electronic copy available at: https://ssrn.com/abstract=4317072Figure 2: A hedged full range LP is close to a linear perpetual
6 A second order hedge and the fair price of fees
The swap rate for the AMM is the sum of swap rates for the Taylor expansion, so
f =
1
2
sr1 −
1
8
sr2 +
3
48
sr3 −
15
384
sr4 + ...
where sr and sr2 are swap rates for the total return and the quadratic return, and f is
the pool fee expressed as a fraction of the pool size.
For a well-behaved price process with constant variance and zero net funding cost this is
f∗
= EQ

−
sr
2
+
sr2
8
− O(r3
)

≈
σ2
r
8
The fair yield from fees for a full range LP on a Uniswap pool is one eighth of the variance
of the price. This is exact under GBM with no drift (see (? )).
## 7 Example: Hedging ETH/stable pairs on Uniswap v3
A constant product AMM LP can be hedged with:
6
Electronic copy available at: https://ssrn.com/abstract=4317072Figure 3: A Uniswap v3 ETH/USDT LP hedged to first and second order
• First order hedge: -50% notional hedge with ETH/USD perpetuals
• Second order hedge: -75% notional hedge with ETH/USD perpetuals and a 12.5%
notional hedge with a quadratic power perpetual (oSQTH).
The performance of the two hedges on the ETH/USDT 5bps pool is in figure 3.
Each hedge can be viewed as receiving the pool fee and paying a hedging cost. The
trade-off is typical for gamma hedging. The linear first order hedge typically is lower cost
because funding is expensive, but performs worse for large jumps in the spot price.
Figure 4 below shows the 10-day moving average of the fee against the first and second
order hedge costs.
References
[1] Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra, and Steven Boyd. (2022).
Constant Function Market Makers: Multi-asset Trades via Convex Optimization. In:
7
Electronic copy available at: https://ssrn.com/abstract=4317072Figure 4: 10 day rolling hedge costs vs Uniswap fee yield
Tran, D.A., Thai, M.T., Krishnamachari, B. (eds) Handbook on Blockchain. Springer
Optimization and Its Applications, vol 194. Springer, Cham.
https://doi.org/10.1007/978-3-031-07535-3_13
[2] Joseph Clark (2021) The Replicating Portfolio of a Constant Product market with
Bounded Liquidity.
https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3898384
[3] Andrew Leone and Joseph Clark (2022) More Than You Ever Wanted to Know About
Power Perpetuals.
https://colab.research.google.com/drive/1HTM_2j0jmda9tzN_uskBPz9Rpma8Lp3C
[4] Dave White and Sam Bankman-Fried, (2021) Everlasting Options.
https://www.paradigm.xyz/papers/everlasting_options.pdf
[5] Dave White, Dan Robinson, Zubin Koticha, Andrew Leone, Alexis Gauba, and Aparna
Krishnan, (2021) Power Perpetuals.
https://www.paradigm.xyz/2021/08/power-perpetuals/
8
Electronic copy available at: https://ssrn.com/abstract=4317072