---
sha256: 56e093b05ccb9de3d204b4df11acba17b4531375aa63cbde387f84085a45f2ef
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 76787
---
Uniswap v4 - A Mathematical Primer
LVR & IL Hedge Hook for Concentrated Liquidity Providers,
Dynamic Fees & Delta-Gamma Neutrality:
Power Perpetuals & Lending Protocols
@mevquant, @seecoalba, @theblockchainer
1Contents
## 1 Introduction 4
## 2 Swap Math 5
## 2.1 Price Volatility on LP’s Positions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.1.1 LP Value without fees . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.1.2 LP Value with fees . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
## 2.2 Spot Price, Execution Price & Slippage Math . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
## 2.3 Understanding dx & dy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
## 2.4 Liquidity Draining: ETH/USDC Example . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 2.4.1 Shares, Fees & LP Profits . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
3 LP Math 12
3.1 LP Position Valuation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
## 3.1.1 Full Range . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
## 3.1.2 Concentrated Liquidity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
## 3.2 Liquidity Provider’s Greeks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
## 3.2.1 Full Range . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
## 3.3 Concentrated Liquidity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
## 4 Impermanent Loss 19
4.1 IL on v1 & v2: (0,+∞) - Full range . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
## 4.1.1 The effect of fees on IL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
## 4.1.2 Concentrated Liquidity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
## 4.2 Polynomial Approximation of IL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 23
## 4.3 General DL Derivation for Weighted Pools . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
## 4.4 Expected Impermanent Loss: E(IL) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
## 4.5 Implied Volatility . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
## 4.6 Volatility Risk Premium: Are LPs underpaid? . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
4.7 IL as a Stochastic Process of a G3M . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
4.8 IL on v3 & v4: Concentrated Liquidity in [a,b] ⊆ (0,+∞) ranges . . . . . . . . . . . . . . . . 38
## 4.9 Loss Versus Rebalancing (LVR) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
4.10 E[IL] == E[LVR] . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
## 5 Shares Math 39
## 5.1 Minting: Providing Liquidity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 5.2 Burning: Withdrawing Liquidity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 6 On LP Profitability 39
6.1 JIT, MEV and General LP PnL . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 6.2 Dynamic Fees Hooks . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 7 Hedging Strategies 40
## 7.1 Linear and Non-Linear Payoffs . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40
## 7.2 What can LPs do? . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 42
## 7.3 Dynamic Re-Hedging with Delta One products . . . . . . . . . . . . . . . . . . . . . . . . . . 42
## 7.4 On-Chain Borrowing . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 43
## 7.4.1 Borrowing Basics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 43
## 7.4.2 Example: Volatile/Stable Pair (ETH/USDC) . . . . . . . . . . . . . . . . . . . . . . . 43
## 7.4.3 Full range: Returns & Achieving Delta-Neutrality . . . . . . . . . . . . . . . . . . . . 46
27.4.4 Leveraged Delta-Neutral Borrowing . . . . . . . . . . . . . . . . . . . . . . . . . . . . 52
## 7.5 Leveraged Delta One Hedging . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
## 7.6 Power Perpetuals . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
## 7.7 Gamma Hedging . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 53
## 8 Appendix A 54
## 8.1 Uniswap Whitepapers Takeaways . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
8.1.1 V1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
8.1.2 V2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 54
8.1.3 V3 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 55
8.1.4 V4 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 55
## 9 Disclaimer 56
## 10 References 56
## 10.1 Whitepapers . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
## 10.2 External References . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
## 11 Hook: VRP Discount Factor 58
31 Introduction
This is a draft for the Hookathon. It is still incomplete and some examples are missing.
This document provides an introduction into Uniswap Mathematics from the ground up. No prior knowledge
by the reader beyond some basic algebra, calculus and some DeFi basics is required, although some familiarity
with option contracts will be helpful. The explanation herein intends to be self-complete, meaning that
the reader should not need any extra resources to understand any concept. All the formulas have their
corresponding proves, corollaries and examples.
The author has tried to summarise to his best extent every resource he could find online, from whitepapers,
articles, blogs and videos. Every single formula is derived in simple steps to facilitate comprehension and all
of the plots have been re-done in Python to ensure the author had a complete understanding of every minor
detail in the protocol.
Some of the examples and explanations contained in this article are directly extracted from the original
sources. All credit is due to their original authors, appropriate citations have been provided
wherever necessary.
This is an an opinionated summary of all the relevant information to fully understand Uniswap Mathematics.
The first examples will be on full range positions to build intuition on the inner workings of the protocol and
then move into concentrated liquidity positions.
The document intends to familiarise the reader with both protocol mathematics (core, periphery) and the
necessary financial mathematics to be able to understand concepts like:
A Uniswap liquidity provision position is a perpetual short straddle (no theta/time risk), earning a
variable continuous premium from trading fees, and sold with strike prices equal to the current market price.
In other words, a swap of volatility or gamma risk for a perpetual stream of payments from trading fees.
And be able to hedge a portfolio accordingly. Additionally, it will serve as a foundation to lay down all the
necessary concepts for the hook the author is building for the Hookathon with the Zealynx team.
42 Swap Math
Uniswap is a Constant Function Automated Market Maker (CFMM), also know as Geometric Mean Market
Maker (G3M). To determine how much token Y (dy) you get by swapping some amount of token X (dx) it
uses the following formula:
x · y = k; k constant (1)
k is formally known as the invariant. The invariant only remains constant during trades and only changes
when liquidity is added or removed from the market. This is what makes LPs earn fees via their shares.
Visual representation of y = k
x
, k = 1ETH · 1000USDC
In a bit more detail, one can exactly determine how much dy they will get after exchanging dx accounting for
fees with an expansion of 1. For simplicity, imagine that before the swap we subtract the fees from dx as
dx := dx − fees (this is actually how it was implemented on the code for V1, see Appendix A).
(x + dx) · (y − dy) = k (2)
5Then with some algebra we see that:
(x + dx) · (y − dy) = k
xy − xdy + ydx − dxdy = k
xy + ydx − xdy − dxdy = k
y(x + dx) − dy(x + dx) = k
y(x + dx) = k + dy(x + dx)
y(x + dx) − k = dy(x + dx)
dy = y −
xy
x + dx
dy = y ·

x + dx
x + dx

| {z }
1
−
xy
x + dx
dy =   yx + ydx −   xy
x + dx
dy =
ydx
x + dx
(3)
If one would want to subtract the fee (ϕ ∈ [0,1]) directly and not at the beginning:
dy =
y · dx(1 − ϕ)
x + dx(1 − ϕ)
(4)
Similarly, if we wanted to know the amount of dx we would get if we supplied dy:
(x − dx) · (y + dy(1 − ϕ)) = k
xy + xdy(1 − ϕ) − ydx − dxdy(1 − ϕ) = k
x(y + dy(1 − ϕ)) − dx(y + dy(1 − ϕ)) = k
x(y + dy(1 − ϕ)) − k = dx(y + dy(1 − ϕ))
x −
k
y + dy(1 − ϕ)
= dx
x

y + dy(1 − ϕ)
y + dy(1 − ϕ)

−
k
y + dy(1 − ϕ)
= dx
  xy + x · dy(1 − ϕ) −
k
z}|{
  xy
y + dy(1 − ϕ)
= dx
dx =
x · dy(1 − ϕ)
y + dy(1 − ϕ)
(5)
6Additionally, one can obtain the final amount of tokens after some price movement α (15). Define
r =
x
y
the exchange rate (or price) to convert X tokens into Y tokens. Using that
(
x = r · y
y = x
r
(6)
and 1:
x · y = k
6
− →

   
   
(r · y) · y = k −→ y =
√
k · r
x · x
r = k −→ x =
r
k
r
(7)
## 2.1 Price Volatility on LP’s Positions
In the following section we will explore what happens to our LP position holdings and value when there are
price movements. Then, it will become evident to the reader in an intuitive way the concept of Impermanent
(or Divergence) Loss.
2.1.1 LP Value without fees
Exchange rate r0 (or price) is $100 DAI/ETH.
1. Alice stakes 1 ETH and $100 DAI into the ETH/DAI pool.
2. After her deposit there is a total of 10 ETH and 1000 DAI in the pool. She has a 10% stake on the pool.
3. A week passes and 1 ETH is now worth 200 DAI (r1 = 200).
4. No liquidity is added to the pool during that period.
5. For simplicity, there are also no fees in the pool.
Then, how many assets does Alice hold at the end of the period? What is the new value of her LP position?
We know that k must remain constant during swaps (1), that is:
k0 = k1 = x0 · y0 = 10 · 1000 = 10000 = x1 · y1
We can first indeed check that 7 returns the correct number assets given a certain k and current exchange
rate rt. We have: 


x0 =
q
k0
r0
=
q
10000
100 =
√
100 = 10ETH
y0 =
√
k0 · r0 =
√
10000 · 100 = 1000DAI
(8)
When r1 = 200: 


x1 =
q
k0
r1
=
q
10000
200 =
√
50 ≈ 7.07ETH
y1 =
√
k0 · r1 =
√
10000 · 200 ≈ 1414.21DAI
7We know Alice has a 10% of stake in the pool so we can compute the total holding and position value:
VLP (rt = 200) = x1 · 10% · r1 + y1 · 10%
= 0.707ETH · 200 + 141.421DAI
≈ 282.82DAI
We can easily compute what would have happened if she just simply held the assets:
V 50%
HODL = x0 · 10% · r1 + y0 = 1 · 200 + 100 = 300DAI
As no fees have been generated, by providing liquidity Alice has lost:
L = VLP − V 50%
HODL
≈ 282.82 − 300
≈ −17.18DAI
L% =
VLP − V 50%
HODL
V 50%
HODL
=
VLP
V 50%
HODL
− 1
=
282.82
300
− 1
≈ −5.73%
L ≈ −17.18DAI ; L% ≈ −5.73%
However, notice that this is an unrealised loss, as if Alice does not withdraw and the price goes back to
r = 100 again, her holdings (8) and therefore position value will be the same and L = 0; L% = 0%.
This percentage difference on her holdings’ value caused by price movement is indeed the so called:
Impermanent Loss
It will be covered in detail in Section 4.
2.1.2 LP Value with fees
Wins money example :)
## 2.2 Spot Price, Execution Price & Slippage Math
Section :)
82.3 Understanding dx & dy
A numerical example follows explaining the logic behind 1. Define the current price of ETH=$1000. We create
a new ETH/USDC pool with a fee of 0.3%, starting with 1 ETH and 1000 USDC. Therefore,
k = 1000USDC · 1ETH = 1000
Now an ETH buyer sends $100USDC to the pool. The 0.3% fee is extracted, therefore only $99.7USDC is added
to the pool. Next, the invariant is divided by the amount of USDC there currently is to determine the ETH the
pool will have after the swap.
USDCafter
pool = USDCbefore
pool + dx − ϕ = 1000 + 100 − 0.3 = 1099.7USDC
ETHafter
pool =
kold
USDCafter
pool
=
1000
1099.7
≈ 0.9093ETH
ETHbuyer = ETHbefore
pool − ETHafter
pool = 1ETH −

1000
1099.7

ETH
≈ 0.0907ETH
With 100 USDC buyer bought 0.0907 ETH.
Alternatively, using 4:
dy =
y · dx(1 − ϕ)
x + dx(1 − ϕ)
=
1 · 100(1 − 0.003)
1000 + 100 · (1 − 0.003)
=
99.7
1099.7
≈ 0.0907ETH
After the swap has been completed the fee will be added to the pool.
The new invariant will be:
knew =
xnew
z }| {
(USDCafter
pool + ϕ)·
ynew
z }| {
ETHafter
pool
= (USDCafter
pool + ϕ)USDC ·
kold
USDCbefore
pool + dx+ − ϕ
!
ETH
= (1099.7 + 0.3)USDC ·

1000
1099.7

ETH
≈ 1000.27280167
(9)
knew > kold. The increase is due to the new liquidity (ϕ = fee) added to the pool.
How does this affect the pool’s price (or exchange rate)?
If now someone trades in the same direction USDC→ETH (deposits USDC in exchange for ETH, or “buys ETH
with USDC”) the amount of ETH (dy) for the same dx ($100 USDC) will be lower. We can again use 5:
9dy =
ynew · dx(1 − ϕ)
xnew + dx(1 − ϕ)
=
1000
1099.7 · 100(1 − 0.003)
1100 + 100(1 − 0.003)
≈ 0.07557ETH
Now with 100 USDC buyer only bought 0.07557 ETH.
Clearly dynew < dyold, (−16.68%).
The change is quite large due to the low initial liquidity of the pool and the amount we are trading on it (see
2.4).
If instead one swaps ETH for USDC, the amount will be higher than the initial amount of USDC that would
have been returned right after the pool was deployed. One can see that this mechanism benefits some kind of
mean reversion towards the initial ratio the assets were deployed. Arbitragers will ensure the price converges
with that of other exchanges. Users can even use flash swaps (see 10.1) if there is an arbitrage on-chain,
hacing to commit almost zero capital.
## 2.4 Liquidity Draining: ETH/USDC Example
We can further extend our understanding of this simple formula graphically. Imagine just after deploying the
initial 1 ETH and $1000USDC we want to swap dx+
= $1000USDC (current market price for ETH) for some
amount dy−
of ETH (hopefully 1 ETH, right?). Running the above calculation we obtain:
dy ≈ 0.49999925ETH
Exactly dy = 0.5ETH if there was no fee. Did we just lose half our money? What happened?
The pool’s constant product formula is designed in order to prevent liquidity draining. This also prices the
tokens according to supply-demand dynamics, the more a token is demanded, the more expensive it gets. We
can observe the actual initial price curve in terms of each asset with respect to the other.
We can see that, indeed, if one tries to swap now $1000USDC (or 0.5ETH for USDC) the pool will return:
$1000USDC ⇄ 0.5ETH
10If we had initially deployed, at the same exchange rate of 1ETH = $1000USDC, higher amounts of liquidity,
for example:
1000ETH · 1000000USDC = 1e9 = k
And now run the same swap depositing $1000USDC, we would expect to get closer to dy ≈ 1ETH:
dy = 1e3ETH −
1e9
1e6USDC + 997USDC
= 0.99600698104ETH ≈ 1ETH
## 2.4.1 Shares, Fees & LP Profits
One might wonder why there is a fixed fee for every swap. This is to compensate LPs for the tokens they
provide. In order to account for the profit generated with fees by LPs, a share mechanism is used. What the
invariant really represents is x · y at the end of the previous trade.
When LPs provide liquidity to the pool shares are minted (created). When LPs withdraw liquidity they burn
(destroy) shares and receive their assets back. The clever design here is that, as fees are subtracted from dx
(respectively dy) before calculations (or added after price calculations in the pool as done in the contracts)
and no shares are minted for the liquidity provided by the fee, more liquidity is now redeemable by LPs when
they burn their shares (share price has virtually increased), therefore resulting in a net profit distributed in a
pro rata basis among all LPs in the pool.
If no fees were set, then the invariant would actually remain constant for all swaps, having a detrimental
effect on liquidity as pool prices would no be updated and the next trader would get a better rate. Let’s use
the prior example to see this updating k accounting for the fees and without:

       
       
x = 1000ETH
y = 1e6USDC
k = 1e9
dy+
= $1000
dx−
=
(10)
TODO - COMPLETE EXAMPLE!
113 LP Math
3.1 LP Position Valuation
## 3.1.1 Full Range
Given a price P := y
x, the value of a LP position is:
V (P) := xP + y (11)
The pool’s liquidity L is defined by
L2
:= k (12)
With some basic algebra we can see that

    
    
x =
y
P
=
L
√
P
y = L
√
P
y2
P
= L2
(13)
Then it follows from 11 (using 13) that:
V (P) = xP + y
= 2 · y
= 2 ·
k
x
= 2 ·
L2
x
= 2 ·
L2
y
P
= 2 ·
L2
· P
y
= 2 ·
L2
· P
L ·
√
P
= 2L
√
P
(14)
Using L and
√
P is convenient because only one of them changes at a time.
If the price P changes, then V (P) also changes. If we denote PT the price at moment T, with the associated
value VT and the ratio of prices:
α :=
PT
P0
(15)
Then
VT = V0
√
α (16)
This is, the value function of a LP position is a square root function.
12We can easily verify this is true following from the above definition (considering only positive roots):
VT = V0
√
α
V (PT ) = V (P0)
√
α
2L
p
PT = 2L
p
P0
√
α
r
PT
P0
=
√
α
α =
PT
P0
To make sure this intuitively makes sense, imagine the following scenario:
ETH price at t0 is P0 = $1000. We have a Uniswap position with 50:50 liquidity deployed. We deposit 1 ETH
and $1000 USDC into the ETH/USDC Pool. Then it is trivial to see that:
V0 = x · P0 + y = 1ETH · $1000 + $1000USDC = $2000
ETH price at t1 increases to P1 = $2000. Our new position value following 16 will be:
V1 = V0
√
α = $2000
√
2 ≈ $2828.43; α =
2000
1000
= 2
Now let’s add an extra step. We will add one more observation before price reaches $2000. ETH prices will be
t0 = $1000,t1 = $1500,t2 = $2000. We will measure (without doing any changes to our position) how its
value changes over time. As we are not modifying anything we would expect the final value V2 to be the
same as above.

  
  
V0 = $2000
V1 = V0
√
α1 ≈ $2449.49
V2 = V1
√
α2 = (V0
√
α1)
√
α2 ≈ $2828.43
Where α1 = 1500
1000 = 1.5 and α2 = 2000
1500 = 4
3.
## 3.1.2 Concentrated Liquidity
A custom LP range can be though of as providing liquidity with leverage.
With P a price, pa,pb the lower and upper limits of a concentrated liquidity position and given that P ∈ [pa,pb],
based on 10.1 the reserves for a concentrated position are defined by the curve:

x +
L
√
pb

(y + L
√
pa) = L2
(17)
Notice that this is an expansion of 1 with virtual liquidity (more optimized liquidity):
xvirtual · yvirtual = L2
13Define: 
 
 
x = xvirtual − L
pb
13
= L

1 √
P
− 1 √
pb

y = yvirtual − L
√
Pa
13
= L(
√
P −
√
pa)
(18)
Then,
V0 = y + xP
= L(
√
P −
√
pa) + L

1
√
P
−
1
√
pb

· P
= L
√
P − L
√
pa) + L
√
P −
L · P
√
pb
= 2L
√
P − L

√
pa +
P
√
pb

V0 = 2L
√
P − L

√
pa +
P
√
pb

(19)
Using that for VLP on time t, Pt = P0 · α:
VLP = 2L
√
Pα − L

√
pa +
Pα
√
pb

(20)
And finally if assets are just on a 50:50 HODL, at time t:
VHODL = y + xPα
= L(
√
P −
√
pa) + LPα

1
√
P
−
1
√
pb

= L
√
P − L
√
pa + Lα
√
P −
LPα
√
pb
VHODL = L
√
P(1 + α) − L

√
pa +
Pα
√
pb

(21)
## 3.2 Liquidity Provider’s Greeks
## 3.2.1 Full Range
Following the Black-Scholes-Merton model define ∆ (delta) to be the price-dependence of the value function
and Γ (gamma) the price-dependence of delta. These are the first and second order derivatives of the LP
position’s value function with respect to price:
∆LP = V ′
(P) =
∂V (P)
∂P
ΓLP = V ′′
(P) =
∂2
V (P)
∂P2
(22)
14Given the value function 16 as above we can find its derivatives:

   
   
VLP = V0
√
α
∆LP = V0
2
√
α
ΓLP = − V0
4α
√
α
(23)
Applying some basic calculus and some abuse of notation to facilitate comprehension:
∆LP :=
∂VT
∂P
=
∂(V0
√
α)
∂P
=⇒ V0
∂
√
α
∂P
=
V0
2
√
α
ΓLP :=
∂∆LP
∂P
=
∂
∂P
V0
2
√
α
=⇒
V0
2
·
∂
∂P

1
√
α

= −
V0
4α
√
α
A more in-depth study on how to hedge a full-range position can be found at Section 7 - Hedging Strategies.
Gamma term is a non-linear, always negative function that describes the impermanent loss of a LP position.
In contrast, 50:50 HODL and 100% asset holdings have zero gamma, therefore no impermanent loss.
Normally the 50:50 HODL is used a benchmark to compare the LP position, however, this is not always the
best one to use.

    
    
VHODL =
V0 + V0 · α
P
= L
√
P(1 + α)
∆HODL =
V0
2
= const
ΓHODL = 0

 
 
Vasset = V0 · α
∆asset = V0 = const
Γasset = 0
(24)
To see why the second expression of VHOLD is true, we can start from the definition of value (11)
VHODL = y + xPt = y + xPα
And now using the first and second formulas from 13 we obtain
VHODL = y + xPα = L
√
P +
L
√
P
Pα = L
√
P + L
√
Pα = L
√
P · (1 + α) (25)
We can visualize this graphically:
An alternative way to think about the LP position:
15• If asset price increases, LP’s delta is lower than the delta of a 50:50 HODL position;
• If asset price decreases, LP’s delta is higher.
The LP position is underexposed to price increases, and overexposed to price decreases. When
price goes up, the gain of the LP is reduced; when the price goes down, their loses increased.
The primary intuition you should have about concentrated liquidity is that it makes all things more extreme.
Fee income is amplified while the position is in range, but impermanent loss is amplified as well. Another
important ideas is that CL introduces new risks (going out of range) as well as opportunities (range orders,
limit orders).
Full-range LP position’s value:
Red area shows loss relative to initial value, the green area: gain or neutral.
The figure below shows the profit the LP has relative to a 50:50 HODL:
16One can notice that the curve is always bellow 0. This means that if no fees are distributed Liquidity
Providing is always a losing strategy. That is, fees have to be sufficiently high to offset the IL generated by
the change in price α. Nevertheless, this is also incomplete: we are assuming the 50:50 HODL strategy holds
the tokens still; however, this is unrealistic as risk free strategies exist in DeFi. We can assume the DeFi
risk-free rate to be the one of lending at Aave, Compound, etc. or staking funds at Lido even low-risk yield
farming strategies at Yearn, Convex, ... and similar strategies.
Therefore, fees do not only have to outweight IL but also the DeFi risk-free rate. This rarely happens. Now
let’s assume the LP position collects 5% of its initial value in fees: a simplification that is not fully realistic,
but gives something to start with. Even under this assumption of the relatively high 5% fees, the LP suffers
losses if the price changes significantly enough.
17Full-range LP position with 5% fees, LP profit vs. HODL
## 3.3 Concentrated Liquidity
184 Impermanent Loss
4.1 IL on v1 & v2: (0,+∞) - Full range
With the information we have already covered we have sufficient knowledge to formalise the Impermanent Loss
(also referred to as Divergence Loss or Loss-Versus-Holding, LVH for a stable-volatile pair. Impermanent loss
is typically calculated with respect to one asset relative to another in a liquidity pool. When both assets are
volatile (non-stable), the calculation becomes more complex.
Starting from 1 and using 13 and the value definition derived at 14 we define Impermanent Loss by computing
the percentage loss of having VLP compared to VHODL (24 & 25).
IL(α) :=
VLP − VHODL
VHODL
=
VLP
VHODL
− 1 =
V0
√
α
L
√
P(1 + α)
− 1 =
2L
√
P
√
α
L
√
P(1 + α)
− 1 =
2
√
α
(1 + α)
− 1
IL(α) = DL(α) =
2
√
α
1 + α
− 1 (26)
We can use a plot to gain some intuition on how IL might behave depending on α:
Notice value is always negative except at α = 1 where the price has reverted back to the original price,
hence the “impermanence”. Many researchers prefer not to use this term as every loss is impermanent (or
unrealised) until you close the trade, but that does not mean that price is going to return even near the
initial price. Moreover, Impermanent Loss is not a loss in itself but rather an opportunity cost of having
provided the assets as LP.
Example: We have provided liquidity to the ETH/USDC pool 50:50. If the price of ETH rises α = 2 (+200%)
19and we obtained no fees (µ = 0) our DL will be:
DL(α = 2) =
2
√
2
3
− 1 ≈ −5.72%
## 4.1.1 The effect of fees on IL
With a small addition to the equation above (see [5]) we can visualize how different fee returns (µ ∈ [0%,20%])
affect IL:
ILµ,t(α) =
2
√
α
1 + α
· eµ·t
− 1 (27)
Let t = 1, then:
Due to the return’s square root relationship with price, the effect of a high µ decreases as price deviates from
the original price at which liquidity was provided.
## 4.1.2 Concentrated Liquidity
Using 20 and 21 we can compute IL based on α, pa and pb. We will compute some extra steps to obtain
ILa,b(α) as a function of IL(α). This is, we want to find ILa,b(α) = IL(α) · C:
20ILa,b(α) =
VLP − VHODL
VHODL
=
2L
√
Pα −

L
√
pa + Pα √
pb

− L
√
P(1 + α) +

L
√
pa + Pα √
pb

L
√
P(1 + α) − L
√
pa + Pα √
pb

=
2L
√
Pα − L
√
P(1 + α)
L
√
P(1 + α) − L
√
pa + Pα √
pb

=
 L · (2
√
Pα −
√
P(1 + α))
 L ·
√
P(1 + α) −
√
pa + Pα √
pb

=
√
P · (2
√
α − 1 − α)
√
P(1 + α) −
√
pa + Pα √
pb
 ·
1 √
P
1 √
P
!
| {z }
1
=
2
√
α − 1 − α
(1 + α) −
ppa
P − α
q
P
pb
·

1 + α
1 + α

| {z }
1
=
2
√
α − 1 − α
1 + α
·

 1 + α
1 + α −
ppa
P − α
q
P
pb


=



2
√
α
1 + α
−

1
1 + α
1 + α


 ·

 1 + α
1 + α −
ppa
P − α
q
P
pb


=

2
√
α
1 + α
− 1

| {z }
IL(α)
·

 1 + α
1 + α −
ppa
P − α
q
P
pb


= IL(α) ·



1
1+α−
√pa
P −α
q
P
pb
1+α



= IL(α) ·



1

  >
1
1+α
1+α −
√pa
P +α
q
P
pb
1+α



| {z }
C
ILa,b(α) = IL(α) ·



1
1 −
√pa
P +α
q
P
pb
1+α


 (28)
21Note that this equation only applies when P ∈ [pa,pb]. Outside of this price range asset holding stop changing.
Normally pa and pb are set as a percentage (fixed distance) of the current price. For example, if an LP wants
to create a (−r,r) range around the current price P:
(
pb = (1 + r) · P
pa = P
1+r
(29)
Intuitively, if P = 100 and r = 0.1 (10%),
(
pb = (1 + 0.1) · 100 = 110
pa = 100
1+0.1 ≈ 90.91
We can visualize how much ILa,b(α) increases as the range narrows (r gets smaller):
We see that, the narrower the range (r → 0), the steeper IL becomes. On the other hand, the bigger r
becomes (r → 1), the more the IL curve resembles that one of v2 (full range). This can easily be seen as
when pb → +∞,pa → 0 we have a full range liquidity position and as C → 1 =⇒ ILa,b(α) → IL(α). More
formally:
lim
pa→0
pb→+∞
ILa,b(α) = IL(α) ∵ C → 1 (30)
22The following three sections can safely be skipped as they are intended for the most advanced and
curious readers. This is to add completeness to the document.
## 4.2 Polynomial Approximation of IL
As it will become evident in future sections, having a polynomial approximation of the IL will come in handy
when trying to hedge it. To do this, let’s recall the general definition of the Taylor polynomial.
Theorem. Let D ⊂ Rn
be an open set, and f : D → R an m-differentiable function at a point a ∈ D. Then,
∃!p ∈ R[x1,...,xn]m such that:
lim
x→a
f(x) − p(x)
∥x − a∥m
= 0
This unique polynomial is of the form:
23Tf,a,m(x) :=
m X
k=0
Dk
f(a)
(x − a,
k
···,x − a)
k!
(31)
Note that D0
f(a) = f(a) and (x − a)0
= 1.
In less technical terms, which some readers might find more familiar and helpful:
f(x) =
∞ X
k=0
f(k)
(a)
k!
= f(a) + f′
(a)(x − a) +
f′′
(a)
2!
(x − a)2
+ ··· +
f(n)
(a)
n!
(x − a)n
+ ···
Therefore, we can apply this to the IL(α) formula we described above (26). First, we will need to compute its
first and second order derivatives. We will ignore any higher order derivatives, we are interested in hedging
delta (first-order derivative) and gamma (second-order derivative), as their marginal impact is negligible.
∂IL(α)
∂α
= 2 ·
1
2
√
α
(1 + α) − (
√
α · 1)
(1 + α)2
!
= 2 ·
1+α
2
√
α
−
√
α
(1 + α)2
!
= 2 ·
1+α−2α
2
√
α
(1 + α)2
!
=  2 ·
1 − α
 2
√
α · (1 + α)2
∂IL(α)
∂α
=
1 − α
√
α(1 + α)2
(32)
24Now deriving that expression again with respect to α:
∂2
IL(α)
∂α2
=
−[
√
α(1 + α)2
] − [(1 + α)2
+ 4α(1 + α)]
[
√
α(1 + α)2]2
=
−
√
α(1 + α)2
−

(1 − α) · 5α2
+6α+1
2
√
α

(
√
α(1 + α)2)
2
=
−
√
α(1 + α)2
−

5α2
+6α(1−α)+(1−α)
2
√
α

(
√
α(α2 + 2α + 1))
2
=
−2α(1+α)2
−5α2
−6α(1−α)−(1−α)
2
√
α
(α2
√
α + 2α
√
α +
√
α)2
=
3α3
− 3α2
− 7α − 1
2
√
α · (α5 + 4α4 + 6α3 + 4α2 + α)
=
(α + 1)(3α2
− 6α − 1)
2
√
α · α(α + 1)4
=
  (α + 1)(3α2
− 6α − 1)
2
√
α · α(α + 1)  
3
4
∂2
IL(α)
∂α2
=
3α2
− 6α − 1
2α
√
α(1 + x)3
(33)
Now we can formulate TIL,a,2:
TIL,a,2 =
2
√
a
1 + a
− 1 +
1 − a
√
a(1 + a)2
· (α − a) +
3a2
− 6a − 1
2a
√
a(1 + a)3
·
(α − a)2
2
(34)
We are interested in approximating IL(α) at a = 1:
TIL,a=1,m=2 =
2
2
− 1 +
1 − 1
√
1(1 + 1)2
· (α − 1) +
3 − 6 − 1
2 · (2)3
·
(α − a)2
2
= 0 + 0 +
−4 · (α − 2)2
32
= −
(α − 1)2
8
TIL,1,2 = −
1
8
(α − 1)2
(35)
For approximately α ∈ (−30%,+30%) it is a reasonable approximation and indeed it locally matches the
negative convexity (concavity) as desired:
25We will not be needing higher order derivatives however it can be interesting to visualise the Taylor expansion
for higher degrees. In order to keep this document short, higher order derivatives are left as an exercise to
the reader.

                       
                       
IL(α) = 2
√
α
(1+α) − 1
∂IL(α)
∂α = 1−α √
α(1+α)2
∂2
IL(α)
∂α2 = 1
2 · 3α2
−6α−1
α
√
α(1+x)3
∂3
IL(α)
∂α3 = −3
4 · 5α3
−15α2
−5α−1
α2
√
α(1+α)4
∂4
IL(α)
∂α4 = 3
8 · 35α4
−140α3
−70α2
−28α−5
α3
√
α(1+α)5
∂5
IL(α)
∂α5 = 15
16 · −63α5
+315α4
+210α3
+126α2
+45α+7
x4
√
α(1+α)6
. . .
. . .
(36)
26We will first evaluate each term at a = 1:

                       
                       
IL(1) = 0
∂IL(1)
∂α = 0
∂2
IL(1)
∂α2 = −1
4
∂3
IL(1)
∂α3 = 3
4
∂4
IL(1)
∂α4 = −39
16
∂5
IL(1)
∂α5 = 75
8
. . .
And now add it to our Taylor expansion:
TIL,1,5 = −
1
4
(x − 1)2
2
+
3
4
(x − 1)3
6
−
39
16
(x − 1)4
24
+
75
8
(x − 1)5
120
= −
1
8
(x − 1)2
+
3
24
(x − 1)3
−
13
128
(x − 1)4
+
5
64
(x − 1)5
It is now apparent that the contribution of higher-order terms (m > 2) is negligible.
The construction of the general formula for the nth term is left as an exercise to the author (in some
not-so-distant future).
274.3 General DL Derivation for Weighted Pools
The formula above for DL is actually a concrete example of a more general formula with only two assets [ETH,
USDC] with respective prices and weights:
p =

1000,
1

, w =

0.5
0.5

;
Other AMM’s like Balancer do not follow a 50:50 distribution of tokens. Therefore, a more general definition
of DL as a function of asset prices and weigths can be formulated as:
DL(p,w) =
Q
i(∆pi
USD)wi
P
i(∆pi
USD · wi)
− 1 (37)
Additionally, k can be computed as:
k =
Y
i
xwi
i ; i ∈ N+
While it may look scary, the formula is actually quite simple: subtract one from the quotient of the product
of all token USD price changes in each token to the power of their weight and the sum of all token USD price
changes multiplied by their weight.
For example, imagine a similar pool for ETH:USDC pool where ETH trades for $100 USDC. However instead of
50:50 this pool is 20:80. We will not be needing it but
k = 1000.2
+ 10.8
≈ 3.5119
Then ETH price increases to $200. Our DL(α = 2) can be computed as:
DL20:80(α = 2) =
20.8
· 10.2
(2 · 0.8) + (1 · 0.2)
− 1 ≈ −3.27%
And we can clearly see that, as the weight of ETH is lower, so it is the Divergence Loss:
DL50:50(2) > DL20:80(2)
In fact we can see that the general inequality for the loss: DL50:50 >= DL20:80 holds.
28One might be tempted to think, well, if down-weighting the volatile asset we reduce DL, let’s minimize that
so that DL is also minimal. However, this is not so easy as it impacts the fees received as well (see 7.1).
## 4.4 Expected Impermanent Loss: E(IL)
Assume that asset prices follow a Geometric Brownian Motion (GBM) with log-normally distributed returns.
This is a reasonable assumption typically made in traditional asset pricing models such as Black-Scholes-Merton
model for options.
Define S0 the price of the asset at time 0, St the price of the asset at time t, µ the expected log return of
the asset, σ the volatility of the log returns of the asset and Wt a Wiener process that follows a normal
distribution with mean 0 and variance t.
St = S0 · exp

µ −
σ2
2
t + σWt

, Wt ∼ N(0,t) (38)
Given the values of the LP (24) and IL derived earlier (26):

     
     
V = 2L
√
P0α
Vh = L
√
P0(1 + α)
IL = 2
√
α
1+α − 1
Under the assumption of GBM we can model the price of the portfolio held outside of Uniswap V2 and the
one with the assets provided as liquidity:

   
   
V = 2L
q
P0 · exp µ − σ2
2

t + σWt

Vh = L
√
P0

1 + exp

µ − σ2
2

t + σWt
 (39)
We can now compute the Expected Value of the portfolio held outside the AMM (HODL), which results in the
same function but instead of the exponential we use the expected value of the GBM:
E[Vh] = E

L
p
P0

1 + exp

µ −
σ2
2

t + σWt

= L
p
P0

1 + E

e

µ−σ2
2

t+σWt

E[Vh] = L
p
P0(1 + eµt
) (40)
29We will now do the same for the Expected Value of the portfolio held inside the AMM:
E[V ] = E

2L
p
P0 · e

µ
2 −σ2
4

t
· e
σWt
2

= 2L
p
P0 · e

µ
2 −σ2
4

t
· E
h
e
σWt
2
i
= 2L
p
P0 · e

µ
2 −σ2
4

t
·
Z +∞
−∞
e
σWt
2 ·
e−
W2
t
2t
√
2πt
dWt
= 2L
p
P0 · e

µ
2 −σ2
4

t
·
Z +∞
−∞
e− 1
2t (W2
t −σtWt)
√
2πt
dWt
= 2L
p
P0 · e

µ
2 −σ2
4

t
·
Z +∞
−∞
e− 1
2t (W2
t −σtWt+1
4 σ2
t2
−1
4 σ2
t2
)
√
2πt
dWt
= 2L
p
P0 · e

µ
2 −σ2
4

t
·
Z +∞
−∞
e
− 1
2t
h
(Wt−σ
2 )
2
−σ2t2
4
i
√
2πt
dWt
= 2L
p
P0 · e

µ
2 −σ2
4

t
·
Z +∞
−∞
e− 1
2t (Wt−σ
2 )
2
· e
σ2t
8
√
2πt
dWt
= 2L
p
P0 · e

µ
2 −σ2
4

t
· e
σ2t
8
 :1 ∵ it is a PDF Z +∞
−∞
e− 1
2t (Wt−σ
2 )
2
√
2πt
dWt
E[V ] = 2L
p
P0 · e

µ
2 −σ2
8

t
(41)
And then for the expected value of the IL:
E[IL] =
E[V ]
E[Vh]
− 1
=
2L
√
P0 · e

µ
2 −σ2
8

t
L
√
P0 (1 + eµt)
− 1
=
2e

µ
2 −σ2
8

t
(1 + eµt)
− 1
Using the cosh identity
cosh(x) =
1 + e2x
2ex
(42)
And setting
x =
µt
2
30We can simplify the formula for the expected value of the impermanent loss to:
E[IL] =
e−σ2t
8
cosh µt
2
 − 1 (43)
We can visualize the expected impermanent loss surface as a function of µ and σ:
With the formulas to compute IL on Uniswap v3 as seen on [11]. Define the range factor r =
q
pb
pa
, then:
IL3 :=

     
     
√
r·α−1
α+1 α < 1
r
√
r √
r−1
·

2
√
α
α+1 − 1

1
r < α < r
√
r−α
α+1 α > r
(44)
Additionally, we know that:
lim
r→+∞
IL3 = IL2 (45)
If a non-trivial range is used, the top and bottom formulas on (44) become relevant. Due to the assumption
of GBM, it would be necessary to integrate the normal distribution curve over all three separate price ranges.
This would result in a very complex equation, as none of the integrals resolves to 1.
For this reason, computational methods are used to find the expected value of impermanent loss for Uniswap
v3 pool positions that use a non-trivial price range.
Using a modification of the code provided by the author in [7] I have numerically recreated an E[IL3] Surface
31for r = 0.5 (±50%) as a function of µ and σ:
## 4.5 Implied Volatility
This section is mainly extracted from [5].
Under the no-arbitrage principle, there is no strategy between becoming an LP or just holding assets that
inherently has positive EV. If the yields from a pool were much higher than the impermanent loss, providing
liquidity would have a positive expected return, therefore arbitrageurs would take advantage of a statistical
arbitrage and bring back EV to 0. If the reverse was true, the expected impermanent loss was higher than
the yields from trading fees, the impermanent loss normally faced by LPs would become that borrower’s
impermanent gain.
Therefore, if we are to assume that there is no arbitrage opportunity in Uniswap, then the volatility the
Uniswap trading fee yields imply is the expected return of the contract, and in this case that the return
from trading fees and impermanent loss is equivalent to zero. At this level of volatility there is no strategy,
providing liquidity or borrowing liquidity, that can generate an expected positive return.
Then, in order to find the Implied Volatility (σ) we assume the expected impermanent loss (43) with trading
fees of the liquidity pool to be equal to zero and solve for σ:
0 =
e

α−
µ2
pool
8

t
cosh µt
2
 − 1
σ =
s
8
t

µpool · t − ln

cosh

µt
2

(46)
32For very short periods of time, where µ can assumed to be 0:
σ =
p
8µpool
With a reasonably good assumption of µ, the expected price movement of a pair over a certain period of
time, we can estimate what the Uniswap v2 pool expected volatility for a given pair is based on that pair’s
current yield from trading fees.
For concentrated liquidity ranges, the issue is the same as in the previous section, analytical solutions can get
complicated, therefore is preferred to use numerical analysis to find the solutions to some of this equations.
An example follows with the Implied Volatility for a range r = 0.5 as a function of µ and α. A small
modification of the author code’s has been made: k_=midSigma, i_=hiSigma, j_=loSigma in order for the
complete provided code to run.
334.6 Volatility Risk Premium: Are LPs underpaid?
Whenever implied volatility is higher than historical or expected volatility, providing liquidity to a
Uniswap pool provides positive expected return.
If the implied volatility is lower than the historical or expected volatility, the return becomes
negative.
Therefore, implied volatility relative to whatever metric of expected volatility we use is a better determinate
of EV than pool yield alone. In most cases, Uniswap does not pay LPs an adequate risk adjusted
return [9].
34Figure extracted from [9]
The yield was worth the risk from June 2020 to the first half of 2021 but not after, assuming the annual
return for this whole period of time is about 200%. If it is no longer positive EV to hold tokens in Uniswap,
or at the very least less profitable than alternatives, then why are LPs still providing liquidity?
Liquidity providers (LPs) may continue to provide liquidity on Uniswap despite it no longer being as profitable
due to revised market expectations, particularly surrounding ethereum’s price appreciation against the US
dollar. As ethereum’s network grows, its volatility and risk diminish, leading to lower expected annual returns,
now around 50% instead of 100%. Although historical performance, especially during the bull market of
2020-2021, showed exaggerated returns, LPs might believe that the market for volatility is fairly priced and
expect lower, but still profitable, returns going forward. Some volatility discrepancies after mid-2021 may
further reflect market adjustments (or LPs could just be uninformed - I doubt it).
35Figure extracted from [9]
Performance Statistic Value
Mean Annual Return 8.54%
Std of Annual Return 35.81%
Total Return 18.82%
Sharpe Ratio 0.24
Sortino Ratio 0.36
Statistics of LP portfolio:
May 2020 to May 2022
Given the large drawdown the liquidity provider (LP) experienced, the risk adjusted returns are relatively
low. The fact that the LP is still profitable is not statistically significant from random luck.
There was a liquidity mining program to issue UNI (Uniswap governance token) tokens, that ran from Sep.
2020 to Nov. 2020, to LPs in some Uniswap V2 pools. USDC-ETH and WBTC-ETH pools were part of it but not
the WBTC-USDC pool. Perhaps that’s the reason why the USDC-ETH and WBTC-ETH pools were able to perform
so well around that time period.
Unlike Deribit where a low price of volatility will attract buyers of volatility, Uniswap and other AMMs are
a one sided volatility marketplace only enabling users to sell volatility. Therefore the volatility market in
AMMs cannot function properly and adjust itself rapidly enough when volatility is cheap, unlike Deribit,
without first causing losses to liquidity providers.
CFMM liquidity can be shorted by borrowing liquidity from the CFMM and withdrawing the reserve
tokens it represents and holding them, such that the impermanent loss becomes an impermanent gain. The
impermanent gain is the ability of the borrower to purchase more LP tokens with their reserve tokens.
Since the impermanent loss to LPs becomes the impermanent gain of the borrower, the borrower will have
36achieved a long gamma position whose return can be characterized by the following function:
R = 1 −
2
√
α · e(µpool+gb−r)t
1 + α
(47)
In this example, gb represents the interest rate charged by GammaSwap to liquidity borrowers. GammaSwap is
the protocol whose founder inspired this section and author of the original article it is based on.
4.7 IL as a Stochastic Process of a G3M
The text below is entirely extracted from [19].
Given a portfolio P of fixed weights (w1,...,wn), which is of dynamic:
• P0 = 1
• dP
dt = ⟨w|dS
S ⟩, Pt = exp
Rt
0
(⟨w|µ⟩ − 1
2⟨w|Σw⟩)dt +
Rt
0
⟨w|σ ⊙ dWt⟩

• V :=
Q
i Swi
i = exp
Rt
0
(⟨w|µ⟩ − 1
2⟨w|σ2
⟩)dt +
Rt
0
⟨w|σ ⊙ dWt⟩

And as such obtain:
V = P · exp

1
2
Z t
0
(⟨w|Σw⟩) − ⟨w|σ2
⟩)dt

As w ∈ Ω := {w ∈ Rn
|w ≥ 0,⟨w|1⟩ = 1} and f : w 7→ ⟨w|Σw⟩ − ⟨w|σ2
⟩ is a convex functional which is equal
to zero on G := {w ∈ Rn
|∃j ∈ [[1,n]],wi = δi,j∀i}, we recall that Ω is the convex closure of G and obtain by
direct application of the Jensen Theorem that f ≤ 0 on Ω, i.e. that V is doomed to underperform P.
37Define the Impermanent Loss (IL) process of the G3M as:
It := exp

1
2
Z t
0
(⟨w|Σw⟩ − ⟨w|σ2
⟩)dt

Its negative trend is essentially proportional to Σ and this suggests that the G3M strategy is essentially
‘selling gamma’ in option-trading language against the prospect of accruing transaction fees.
Actually the underperformance of V relative to the constant-mix portfolio P, and referring to the Stochastic
Portfolio Theory developed by Fernholz, we further notice that f is the direct opposite of the excess growth
rate provided by diversification in Fernholz’ framework. In other words, investing in a G3M negates the
boost provided by diversification in terms of portfolio growth rate. Indeed, one advantage of diversification is
that the portfolio’s growth rate is superior to the combination of its component stock growth: diversification
in itself boosts portfolio returns. Alas, this is not the case for G3M strategies.
4.8 IL on v3 & v4: Concentrated Liquidity in [a,b] ⊆ (0,+∞) ranges
When providing liquidity in a custom fixed range one can optimize its capital efficiency up to x4000. But as
one should know already, with no free lunch laying around on the market, that comes at a cost. This cost is
materialised through an increase in the IL.
## 4.9 Loss Versus Rebalancing (LVR)
4.10 E[IL] == E[LVR]
385 Shares Math
## 5.1 Minting: Providing Liquidity
## 5.2 Burning: Withdrawing Liquidity
## 6 On LP Profitability
6.1 JIT, MEV and General LP PnL
Study on short/mid/long term profitability of LPs vs JIT bots. (Stefan et al., replicate from scratch with
indexer to have up to date data)
## 6.2 Dynamic Fees Hooks
As it has been shown LPs rely on fees to offset IL.
Main debate seems to be doing it fully on-chain, oracle-free and saving gas costs. Main ideas extracted from
[4]:
• Volatility-based approach: tie the swap fee to the historical volatility of the asset pair. The volatility
can be tracked either by the pool itself, or by an external oracle. (Used by Trader Joe Liquidity Book,
Algebra, Hypersea and many others.)
• Lookback approach: It requires a number of external pool with the same asset pair, but different fee
tiers. The pool should be highly liquid, for example, they can be the mainnet Uniswap v3 pools. The
idea is to set the fee same as the fee of the external pool most profitable in the lookback period. (Used
by Ambient Finance.)
• Price oracle approach: use an external price oracle to determine the correct price of the asset. A
higher fee is asked if the trade moves the pool price closer to this external price. (Used by Swaap.)
• Price momentum approach: look at the price history in the most recent block(s) and asymmetrically
change the fee depending on the trade direction. The aim is to infer the dynamics of the external price
without using an oracle. (Implemented as a Uniswap v4 hook.)
• Asset composition approach: lower fee for trades that make the pool more balanced, higher for
trades that imbalance it. (Used in some Curve pools.)
• Transaction-source based approach: provide lower fee for transactions that are routed through
aggregators, or are otherwise unlikely to be arbitrage-traded. (Example: Balancer has lower fees for
trades coming from CowSwap solvers.)
Other ideas, such as using the swap size, the source address of the transaction, the transaction history of the
source address, etc.
397 Hedging Strategies
To safeguard some of LPs capital, hedging strategies can be used. For simplicity sake we will be working
with stable-volatile pairs such as ETH/USDC.
Hedging can fully be done on-chain via borrowing, however due to undercolateralisation this becomes more
capital intensive than using margin. Additionally, borrowing on DeFi usually comes with a positive APR
(%) that needs to be payed in order to hold the borrow. Meanwhile, because of funding fees, margin selling
can have (this is not always true) a negative APR, therefore adding some extra yield on top of the fees.
Liquidation risks are shared among strategies.
## 7.1 Linear and Non-Linear Payoffs
The main idea behind the hedge is to understand how the value of the position will behave with respect to
our derivative of choice for the hedge.
The payoff of a HODL position follows a linear pattern. In a literal sense, the value function resembles a
straight line. This remains true for all HODL portfolios:
• The payoff of holding only the stable coins is a horizontal line,
• The payoff of 50:50 HODL portfolio is the y = x
2 + c; c constant line,
• The payoff of 100% volatile asset is the y = 1 · x line
Longing the volatile asset through 10x leverage trading has y=10·x payoff and shorting it with 10x leverage
has y= - 10·x payoff (up to the point of liquidation, and assuming a zero funding rate for simplicity).
In contrast, the payoff of an LP position is nonlinear:
• The value of a full range LP position, Uniswap v2 style, grows with the square root of the price.
• Uniswap v3 position values and payoffs are more tricky to describe mathematically, but the basic
intuition is that concentrated liquidity makes all things more extreme, including the non-linearity of
the LP value and payoff functions.
40When a linear function is added to a nonlinear one, the result is always another nonlinear function, similar to
how multiplying a negative number by a positive one always yields a negative number.
It means that LP positions cannot be perfectly hedged by just longing or shorting the volatile
asset once.
It’s the special kind of non-linearity called concavity or negative convexity, also characterized with
negative gamma, that is bad for LPs.
This kind of non-linearity is present in all reasonable AMMs (as mathematically demonstrated in [17]), not
just the Uniswap’s xy=k type of AMM. Therefore it’s usually fine to use the mental shortcuts “linear =
beneficial for LPs” and “nonlinear = detrimental for LPs in this context.
There are AMMs with bonding curves that are close to a line for some values of the price. Curve is the most
well known of these. However, while Curve offers nice properties for stable swaps, it has higher slippage and
risks for LPs at the extremes of the bonding curve, when the price deviate s too much from the stable region.
Essentially, Curve reduces the likelihood of losses, but increases the severity of the losses if they do occur.
417.2 What can LPs do?
To counteract the negative gamma exposure that LPs face, several methods can be employed.
1. Maximize fee income. LPs are profitable relative to HODL when fee income is greater than the
divergence loss. Select better pools, better fee tier and explore IV or Sharpe Ratio metrics for the pool.
2. Explore less volatile pairs as expected value of the impermanent loss is function of volatility squared.
3. Hedge the position by buying financial instruments that have positive gamma, such as buying
options, power perpetuals or protocols like Smilee Finance or GammaSwap.
4. Dynamically re-hedge the position when ever price changes (the main goal of our hook is to facilitate
this step).
## 7.3 Dynamic Re-Hedging with Delta One products
No exotic financial instruments are required to hedge LP positions with an almost perfect accuracy.
The key concept here is that, for relatively small price movements, gamma (the change in delta) is small and
therefore convexity does not play a big role in our loss and a linear approximation with a Delta one product
might suffice. Of course, for large price movements the hedge would be completely out-of-sync with the assets
in the pool and therefore turn useless.
The main problem using this approach is that, of course, to re-hedge some trading action is required, either
on-chain or off-chain and that carries some costs like fees, slippage, gas or borrowing APR’s (although they
are sometimes off-set by lended collateral ones). On the other hand, using this method Divergence Loss can
be made as small as desired. The more experience reader might find this to be an optimization problem, with
a trade-off between rebalance frequency (as a function of trading costs) and the negative convexity loss.
427.4 On-Chain Borrowing
## 7.4.1 Borrowing Basics
DeFi Concepts - Borrowing:
The Loan to Value (LTV) ratio defines the maximum amount of assets that can be borrowed with a
specific collateral. It is expressed as a percentage (e.g., at LTV=75%, for every 1 ETH worth of collateral,
borrowers will be able to borrow 0.75 ETH worth of the corresponding currency). Once a borrow occurs, the
LTV evolves with market conditions.
The Liquidation Threshold is the percentage at which a position is defined as undercollateralised. For
example, a Liquidation threshold of 80% means that if the value rises above 80% of the collateral, the
position is undercollateralised and could be liquidated. The difference between the LTV and the Liquidation
Threshold is a safety mechanism in place for borrowers.
When the Health Factor Hf < 1 the position may be liquidated to maintain solvency.
Bob deposits 120 USDC of collateral at P0=$100/ETH and borrows 0.825 ETH worth $82.5 from a pool with
a liquidation threshold of 86%. This means that if the value of his collateral (V c
) is less than 0.825 · V b
(with
V b
the value of his borrowed assets) he will get liquidated, equivalently, his Hf < 1.
We see that, if ETH price increases, he will either have to provide more collateral, repay a part of his debt or
get liquidated. If the price decreases however, the value of his collateral with respect to his borrowings has
increased. Nevertheless, this does not imply he has made a profit. He still owes 0.825 ETH to the pool. So, if
at t0 he did not sell the borrowed assets, at t1 he has no profit in terms of USDC.
This is why some people do not consider borrowing an equivalent to shorting and somewhat closer to a
neutral strategy depending on the actions taken by the borrower.
## 7.4.2 Example: Volatile/Stable Pair (ETH/USDC)
Alice has $5000 USDC and wants to deploy them to Uniswap v2 (or v3 in full range) hedging with a
borrowing strategy in Aave (we will ignore gas fees and suppose borrowing APR is compensated by lending
APR which is not an unreasonable assumption).
This is what she will do:
431. Lend (deposit) $4000 USDC into Aave.
2. Borrow 1 ETH ($1000) from Aave.
3. Provide 50:50 liquidity full-range (1 ETH & $1000 USDC).
The value of her capital can be computed as:

       
       
Vcollateral = $4000
Vdebt = $1000
Vpool = $2000
Vhedge = $4000 − $1000 = $3000
Vcapital = Vpool + Vhedge = $2000 + $3000 = $5000
(48)
As expected. Then imagine ETH price doubles (1 ETH = $2000 USDC). We can now compute the new value
of her capital using 16 to calculate Vpool:

       
       
Vcollateral = $4000
Vdebt = $2000
Vpool = $2000 ·
√
2
Vhedge = $4000 − $2000 = $2000
Vcapital = Vpool + Vhedge = $2000 ·
√
2 + $2000 = $2000(
√
2 + 1) ≈ $4828.43
Due to the increase in ETH price Alice has suffered a 4828.43
5000 − 1 = −3.43% loss.
Now meet Bob. Bob has the same initial capital and strategy than Alice. However, when he sees the price
increase to $1500 he decides to rebalance the hedge. He observes that by AMM mechanics, he now holds less
ETH than before (< 1 ETH). Therefore, as he had borrowed 1 ETH, he decides to repay some of the borrowed
ETH. To do it, he removes some collateral USDC from Aave, swaps it for ETH (assuming 0 cost) and then repays
the ETH to ensure that borrowedETH = LPETH.
44Now when ETH price reaches $2000 Bob has still a loss but smaller than Alice’s.
More formally, if P0 denotes the initial price, P the current price, α the ratio between them as defined in 15,
V0 the initial value of the LP or HODL position. For different HODL portfolios we have that (24):

   
   
V 100%
H = V0 · α
V 50%
H = V0(1+α)
2
V 0%
H = V0
(49)
Full range LP position value is (16):
VLP (α) = V0 ·
√
α
By using a hedge as seen on 48, the LP position value becomes:
Vportfolio = VLP (α) + Vhedge(α) (50)
We know Divergence (Impermanent) Loss is then defined by 26
IL(α) = DL(α) =
2
√
α
(1 + α)
− 1
We can now decompose the value of the LP position using the HODL position’s value and the divergence loss
term:
VLP (α) = V 50%
H (α) + V 50%
H (α) · DL(α) (51)
This can be checked substituting the corresponding values from 49, 26 and 16:
VLP (α) = V 50%
H (α) + V 50%
H (α) · DL(α)
= V 50%
H (α) · (1 + DL(α))
=
V0 · (1 + α)
2
·

 1 +
2
√
α
1 + α
−  1

=
V0 ·   (1 + α)
2
·

2
√
α
  1 + α

=
V0
 2
· ( 2
√
α)
= V0
√
α
If we wished to obtain a delta-neutral portfolio then our hedge should be constructed so that it has inverse
payoff to the 50:50 HODL porfolio:
Vhedge(αh) := V0 − V 50%
H (αh) (52)
Where αh denotes the price ratio at which the hedge portfolio was constructed. If α = αh then this gives a
truly delta-neutral combined portfolio. This is, small variations in the volatile asset’s price do not have a
significant impact on the value of the portfolio.
45Vportfolio(α) = VLP (α) + Vhedge(α) − Hc
= V 50%
H (α) + V 50%
H (α) · DL(α) + V0 − V 50%
H (α) − Hc
= 
V 50%
H (α) + V 50%
H (α) · DL(α) + V0 − 
V 50%
H (α) − Hc
= V0 + V 50%
H (α) · DL(α) − Hc
(53)
Where Hc are the hedging costs involved in performing the hedge (fees, slippage, gas, etc.). Additionally,
notice that the term V 50%
H (α) · DL(α) ≤ 0 describes the loss due to price change. If α = 1 then this term is 0
(good). When the price change is small, this term is close to 0 as it’s a non-linear function of the price change.
The main idea is to rebalance the hedge every time α grows or decreases above some fixed threshold called
rebalancing step. The more frequent the rebalances the higher the hedging costs but the loss term can be
made as small as possible.
## 7.4.3 Full range: Returns & Achieving Delta-Neutrality
This section is inspired by [6], although some notation changes have been made to keep formulas consistent
with this document and new plots and comparissons have been added to better illustrate some points.
Given the value for an lp position from 14 and adding the return µ from fees (see [6]):
VLP = 2L
√
Pα · eµt
This function is determined by the price P. Therefore, to hedge it we must take the opposite position, we
must short asset X. We can achieve this by borrowing asset X using asset Y as collateral. The hedge
portfolio becomes:
VLP = 2L
√
Pα · eµt
− xPα · ert
θ + y · θ
With θ a number that represents the percentage of the liquidity position that is being shorted. Usually
θ ∈ [0,1), however it can be greater than 1 if we seek to obtain a net short position.
r being the interest rate on the loan per units of time t. Many times this cost will be negligible as it
(approximately) cancels out with the APY from lending the other asset provided as collateral.
The sign next to x is negative as we are borrowing (short, as we will be providing it as liquidity) that asset
and selling it for y (long). We are short x in terms of y. However, as we have just seen (7.4.1) we need to
overcollateralise some of the funds when borrowing as margin.
We denote the LTV by φ = Vb
Vc
; φ ∈ (0,1). Additionally, let ω represent the percentage of liquidity provided
in the pool due to the LTV. That is, if we need to overcollateralise the short position, we have less capital
available to provide as liquidity.
ω is not chosen by the LP but rather dependent on θ and φ.
VLP = ω2L
√
Pα · eµt
− xPα · ert
θ + y
θ
φ
(54)
ω = 1 −
θ
2

1
φ
− 1

46Normally ω ≤ 1. This is because as a general rule θ ∈ [0,1), furthermore, θ is divided by two as we can only
create a short up until half our entire capital. φ ∈ (0,1) and therefore 1
φ − 1 (the collateral to debt ratio of
the lending platform) will always be > 0.
In the example above, at t0 Bob had an LTV φ = 66.67%. This implies that the percentage that his collateral
represents over his debt is:
Vc − Vb
Vb
=
Vc
Vb
− 1 =
1
φ
− 1 =
1
0.6667
− 1 = 0.5
which is precisely the collateral to debt ratio term.
Therefore, if we are not hedging our liquidity position at all ω = 1, otherwise ω < 1. Now to conclude, using
13 we can define the hedge portfolio as:
VLP = ω2L
√
Pα · eµt
− xPα · ert
θ + y
θ
φ
= ω2L
√
Pα · eµt
−
L
√
P
Pα · ert
θ + L
√
P
θ
φ
VLP = ω2L
√
Pα · eµt
− θL
√
P

αert
−
1
φ

(55)
Now we can compute the return function of the hedged LP as:
RLP =
Vt − V0
V0
=
Vt
V0
− 1
=
ωeµt
· 2 
L
√
P ·
√
α − θ 
L
√
P (αert
− 1
φ)
2 
L
√
P
− 1
= ω
√
α · eµt
−
θ
2
(αert
−
1
φ
) − 1
RLP =

1 −
θ
2

1
φ
− 1

√
α · eµt
−
θ
2

α · ert
−
1
φ

− 1 (56)
If we set for example φ = 0.85, µ = 20%, r = 5%, t = 1, then we can see the evolution of the portfolio as a
function of θ and α:
47Notice that for, φ = θ=1, µ = r=0, t = 1, this formula exactly matches The value V(P) of LP vs. HODL
with µ = 0% (on 3.2.1):
If we now study the variability our returns have against price movements, for the unhedged position (23),
accounting for returns and setting V0 = 1 we obtain:
∂RLP
∂α
=
eµt
2
√
α
(57)
If we do the same for a hedged position now:
∂Rh
LP
∂α
=
eµt
2
√
α
· ω −
θ
2
ert
=

1 −
θ
2

1
φ
− 1

·
eµt
2
√
α
−
θ
2
ert
(58)
48In order to achieve ∆-neutrality, we simply equal that expression to 0, considering φ a constant given by the
lending protocol, and solving for θ:
0 =
∂Rh
LP
∂α
0 =

1 −
θ
2

1
φ
− 1

·
eµt
2
√
α
−
θ
2
ert
0 =
eµt
2
√
α
−
θ
2

1
φ
− 1

·
eµt
2
√
α
−
θ
2
· ert
θ
 2

1
φ
− 1

·
eµt
2
√
α
+ ert

=
eµt
 2
√
α
θ =
eµt

1
φ − 1

· 1
2eµt +
√
αert
·
 1
eµt
1
eµt

| {z }
1
θ =
1
1
2

1
φ − 1

+ e(r−µ)t
√
α
Since we assume delta-neutrality is measured when we open the position we can consider α = 0 and t = 1,
therefore to maintain a delta-neutral portfolio, at any given time, our theta must be:
θ =
1
1
2

1
φ − 1

+ 1
=
1
1
2

1
φ + 1

(59)
Then for example, if φ = 0.8, θ must always be 8
9. Then ω = 8
9. Meaning, we should be providing 8
9 of
our capital as liquidity and hedging with the remaining 1
9 (θ
2). If the LTV was lower: φ = 0.5, θ = ω = 2
3,
therefore we would be providing 2
3 of our capital as liquidity on Uniswap and 1
3 as the capital for the hedge.
49We can see that there are also some heavy losses on the right side of the chart. However, this losses cannot
occur as the lending position would either get liquidated or need to be repayed before that as the borrow
value would be too great against the collateral. If we constantly rebalance the portfolio, the hedge will always
be readjusting so that returns continue to increase with increases in price. The same can be done when prices
decrease to avoid negative P&L. To do this one must increase the hedge as price decreases, although the
effect of price declines are less significant.
If we compare it against an unhedged position:
50Change (%) Hedged Ret. (%) Unhedged Ret. (%)
-100 -33.33 -100.00
-80 -10.19 -55.28
-60 -4.50 -36.75
-40 -1.69 -22.54
-20 -0.37 -10.56
0.00 0.00 0.00
20 -0.30 9.54
40 -1.12 18.32
60 -2.34 26.49
80 -3.89 34.16
100 -5.72 41.42
120 -7.78 48.32
140 -10.05 54.92
160 -12.50 61.25
Table 1: Comparison of Hedged and Unhedged Returns,
µ = r = 0, φ = 0.5, ω = θ = 2
3
Then we see that if the LP rehedges for prices movements around ±20% the exposure to price movements
will be minimal. Otherwise, if LP wanted to minimize hedging costs they could rebalance when prices move
±40%.
The Sharpe Ratio is a metric that allow us to understand how much excess return above the risk free rate
(Rp − Rf) we are getting per unit of risk (volatility) in our portfolio (σp). Therefore it can be thought as a
metric to define risk-adjusted returns.
SR =
E(Rp − Rf)
σp
(60)
51A portfolio with a higher Sharpe Ratio than another one, even if it has lower returns, is preferable. That is
because the higher Sharpe ratio portfolio can be leveraged to increase the risk to match that of the lower
Sharpe ratio portfolio and thus increase the return to higher levels than those of the lower Sharpe ratio
portfolio. For example, although delta neutral liquidity provision has lower returns than unhedged liquidity
provision, the lower variability of the returns lead to a higher Sharpe Ratio, despite the lower absolute returns.
Therefore, a leveraged delta neutral liquidity provision portfolio can have substantially higher returns than
an unhedged liquidity provision portfolio.
The following explanation and table are both directly extracted from [6]:
Below are the Sharpe ratios of a delta neutral liquidity provision portfolio and a non hedged liquidity provision
portfolio after a Monte Carlo simulation of 10,000 runs for a liquidity pool with different levels of growth
(µ), different volatilities and returns for the underlying pair of the liquidity pool, and different rebalancing
strategies to achieve delta neutrality or restart the position in the unhedged portfolio (rebalancing every week
and every month). The instances where the Sharpe ratio of the delta neutral liquidity provision portfolio
(hedging) was higher is highlighted in yellow. The risk free rate of return was assumed to be zero for the sake
of simplicity. We also assumed a φ of 0.5 and therefore a θ of 1/3 to achieve delta neutrality.
Monthly Rebalance Weekly Rebalance
µ = 20%, r = 5% Annual Underlying Volatility
Annual Underlying Return 25% 50% 100% 150% 200% 25% 50% 100% 150% 200%
0%
non-hedging 0.48 0.23 0.13 0.10 0.06 0.24 0.11 0.08 0.05 0.02
hedging 15.57 3.87 0.52 -0.09 -0.27 15.40 3.47 0.41 -0.17 -0.36
50%
non-hedging 1.08 0.54 0.29 0.19 0.16 0.50 0.23 0.13 0.08 0.06
hedging 14.36 3.55 0.41 -0.12 -0.29 15.88 3.50 0.38 -0.18 -0.36
100%
non-hedging 1.64 0.82 0.45 0.30 0.23 0.77 0.40 0.21 0.16 0.11
hedging 9.54 2.64 0.34 -0.15 -0.30 13.11 3.30 0.37 -0.18 -0.36
200%
non-hedging 2.80 1.43 0.72 0.48 0.37 1.31 0.68 0.34 0.26 0.17
hedging 4.19 1.41 0.08 -0.21 -0.33 8.55 2.57 0.29 -0.21 -0.36
300%
non-hedging 3.88 1.97 1.00 0.69 0.51 1.92 0.93 0.48 0.32 0.25
hedging 1.91 0.60 -0.09 -0.29 -0.37 5.85 1.95 0.19 -0.23 -0.38
400%
non-hedging 4.92 2.53 1.28 0.89 0.63 2.45 1.21 0.61 0.41 0.32
hedging 0.62 0.08 -0.23 -0.36 -0.41 3.96 1.41 0.10 -0.26 -0.40
µ is the pool growth rate from trading fees, set at 20% APY, r is the lending rate in a decentralized exchange
to achieve the hedge, set at 5% APY, the risk free rate of return was assumed to be 0.
As you can see in the table above, the portfolio’s Sharpe ratio improves as mu and the rebalancing period
increase and worsens as volatility and returns in the underlying increase. For additional tables with varying
values of µ refer to the original article. I have decided not to include them as it is unlikely to get such
high returns from fees over a long period of time. However, the reader is highly encouraged to review these
elements, as they provide a clearer perspective on how each variable impacts the SR.
## 7.4.4 Leveraged Delta-Neutral Borrowing
Due to the higher Sharpe Ratio that the delta-neutral strategy has, one might be tempted to leverage it to
further increase capital efficiency. Nevertheless, the increase in leverage implies a higher interest payment in
loans to finance the higher leverage. In order to account for the leverage and its associated cost we only need
to increase the return by the leverage ratio and subtract the additional interest accrued on the borrowed
sums.
52Let f be the equity to total assets rate (i.e. f = 20% means 20% is equity, 80% is borrowed sums: a leverage
ratio of x5).
RLP =
1
f

V1 − V0
V0

−

1 − f
f

ert
Therefore, substituting the corresponding values we obtain:
Rleveraged =
1
f

1 −
θ
2

1
φ
− 1

eµt
√
α −
θ
2

αert
−
1
φ

− (1 − f)ert
− 1

(61)
And we have that the delta of such portfolio is exactly:
∂Rleveraged
∂α
=
1
f

∂Rh
LP
∂α

(62)
Therefore, achieving delta-neutrality (make the first derivative with respect to price zero) is the same process
as for the non leveraged portfolio.
## 7.5 Leveraged Delta One Hedging
When hedging with Delta One products like futures (or perpetuals), one can utilise leverage to improve its
capital efficiency. For example, using a 2x leverage one could hedge with 33.33% of their funds at a CEX the
other 66.67% that are deployed as liquidity. By doing so, instead of splitting the capital 50/50 (x1 leverage),
with only the 50% of capital earning fees, one can be earning fees with 66% while (approximately) neutral,
gaining a +33.33% in capital efficiency.
This strategy could not be replicated on-chain via borrowing protocols as they always require an overcollateralisation.
## 7.6 Power Perpetuals
Power perps go brr
## 7.7 Gamma Hedging
538 Appendix A
## 8.1 Uniswap Whitepapers Takeaways
8.1.1 V1
Uniswap v1 allows for an exchange rate between ETH and an ERC20 token based on the relative sizes of their
liquidity pools within the contract. This is done by maintaining the relationship:
eth_pool * token_pool = invariant
This invariant is held constant during trades and only changes when liquidity is added or removed from the
market.
When doing a swap the fee (commission) is added after price calculation therefore the invariant increases
slightly with every trade, making the system profitable for liquidity providers. Swapping fees are immediately
deposited into liquidity reserves. Since total reserves are increased without adding any additional share
tokens, this increases that value of all share tokens equally. This functions as a payout to liquidity providers
that can be collected by burning shares. Since fees are added to liquidity pools, the invariant increases at the
end of every trade. Within a single transaction, the invariant represents eth_pool * token_pool at the
end of the previous transaction. Fees taken during trades are added to total liquidity pools without minting
new liquidity tokens. Because of this, ethWithdrawn and tokensWithdrawn include a proportional share of
all fees collected since the liquidity was first added.
Purchases that are large relative to the total size of the liquidity pools will cause price slippage. In an active
market, aribitrage will ensure that the price will not shift too far from that of other exchanges.
The first liquidity provider to join a pool sets the initial exchange rate by depositing what they believe to be
an equivalent value of ETH and ERC20 tokens. If this ratio is off, arbitrage traders will bring the prices to
equilibrium at the expense of the initial liquidity provider.
Liquidity tokens are minted to track the relative proportion of total reserves that each liquidity provider has
contributed.
ETH and ERC20 tokens are withdrawn at the current exchange rate (reserve ratio), not the ratio of their
originial investment. This means some value can be lost from market fluctuations and arbitrage.
8.1.2 V2
Uniswap v2 introduces some novel upgrades to the protocol like being able to swap arbitrary ERC-20 tokens
without routing through ETH, as well as re-writing the entire Vyper code base in Solidity and diminishing the
surface of attack in the core contracts. Major updates are:
• ERC-20 Pairs
• Price Oracle (TWAP)
• Precision
• Flash Swaps
• Protocol Fee
• Meta Transactions
• Solidity & Contract Re-architecture
• Wrapping ETH (removal of native ETH)
• Deterministic Pair Addresses
• Maximum Token Balance
548.1.3 V3
Uniswap v3 provides increased capital efficiency and fine-tuned control to liquidity providers, improves the
accuracy and convenience of the price oracle, and has a more flexible fee structure.
• Concentrated Liquidity
• Flexible Fees
• Protocol Fee Governance
• Improved Price Oracle
• Liquidity Oracle
• Non-Fungible Liquidity
• Geometric Mean TWAP (sum of log prices)
The main change for LPs is the possibility to provide concentrated liquidity.
(x +
L
√
pb
)(y + L
√
pa) = L2
8.1.4 V4
559 Disclaimer
This article is for general information purposes only and does not constitute investment advice. The author
does not guarantee the accuracy of the information provided in this article. This article was written in the
author’s free time and is not related to his professional activity. Furthermore, it reflects the current opinions
of the author, and does not necessarily reflect the opinions of his employer.
## 10 References
## 10.1 Whitepapers
[W1]. Hayden A., (2018). Uniswap Whitepaper
[W2]. Hayden A., et al., (2020). Uniswap V2 Whitepaper
[W3]. Hayden A., et al., (2021). Uniswap V3 Whitepaper
[W4]. Hayden A., et al., (2024). Uniswap V4 Whitepaper
## 10.2 External References
1. Atis E., (2021). Liquidity Math In Uniswap v3
2. Atis E., (2023). Liquidity Provider Strategies for Uniswap v3 [Series]
3. Atis E., (2023). Uniswap LP Articles Code
4. Atis E., (2024). Dynamic Fees for Automated Market Makers: Liquidity, Volatility, and Collected Fees
5. Daniel A., (2021). Total Returns and Impermanent Loss in Uniswap V2
6. Daniel A., (2021). Optimizing Liquidity Provision: Hedging Market Risk in Uniswap V2
7. Daniel A., (2022). Expected Impermanent Loss in Uniswap V2 & V3
8. Daniel A., (2022). Calculating Implied Volatility Uniswap V2 & V3
9. Daniel A., (2022). Uniswap Liquidity Provision: Is the Yield Worth the Risk?
10. Guillaume L., (2021). Medium Articles
11. Guillaume L., (). An Analysis of the Expected Value of the Impermanent Loss in Uniswap (V3)
12. Joseph Clark, (2021). Hedging Uniswap v3 Positions with SQUEETH
13. Dave W., et al., (2021). Power Perpetuals
14. Joseph Clark, (2023). Spanning with Power Perpetuals
15. Joseph Clark, (2021).The replicating portfolio of a constant product market with bounded liquidity
16. Niccolò B., & Alessandro N. (2023). Liquidity Providers Greeks and Impermanent Gain
17. Jason M., et al. (2024). Automated Market Making and Loss-Versus-Rebalancing
18. Stefan L., et al. (2021). Impermanent Loss in Uniswap v3
19. Nassib B. (2021). G3M Impermanent Loss Dynamics
20. Compass Labs. (2024).Tracking Impermanent Loss on UniswapV3 using Dojo
5621. Cyfrin Updraft. (2024). Uniswap v2 Developer Course
22. Peteris E. (2021). Impermanent Loss in Uniswap v3
23. Peteris E. (2021). How to calculate Impermanent Loss: full derivation
24. Doncho K. (2021). Impermanent Loss Explained With Examples & Math
25. Sia M., (2024). Convexity and Concavity in Investing, Life and Decision Making
26. Saleh H., Mohsen P., (2022). Concentrated Liquidity Analysis in Uniswap V3
27. Alex E., (2023). Navigating Uniswap V3: A Comprehensive Guide to APR Estimation and Pool Risk
Analysis
28. Yi Z., et al., (2018). Formal Specification of Constant Product (xy = k) Market Maker Model and
Implementation
29. Vitalik B., (2018). Improving front running resistance of x*y=k market makers
30. Vitalik B., (2016). Let’s run on-chain decentralized exchanges the way we run prediction markets
31. Hayden A., (2018). uniswap exchange.vy commit 4610c59
32. RareSkills, (2023). Uniswap V2 Book
33. Chaisomsri, (2024). [DeFi Math] Uniswap V3 Concentrated Liquidity
34. Jeiwan, (2022). Uniswap V3 Development Book
35. Guillermo A., et al., (2019). An analysis of Uniswap markets
36. The-CTra1n, (2023). LVR-minimization in Uniswap V4
37. llllvvuu, (2021). Raw Moment Derivatives
38. mookid, (2014). Derivatives Pricing with Squared and Cubed Stock Prices
39. makemake, (2023). sneed, Uniswap V4 Hook to Hedge Against Impermanent Loss
40. Adam K., Xi Z., (2022). Delta Hedging Liquidity Positions on Automated Market Makers
41. Amy K., (2024). From CEX to DEX: A New Formulation For Implied Volatility - Part 2
42. Xue D., Chen Y., Yutian Z., (2024). Liquidity Pool Design on Automated Market Makers
43. CrocSwap, (2022). Benchmarking the Performance of Automated Liquidity Vault Strategies
44. rekt, (2021). Uniswap V3 LP Rekt
45. CowSwap, (2024). What is Loss-Versus-Rebalancing (LVR)?
46. DelphiDigital, (2024). Loss Versus Rebalancing (LVR)
5711 Hook: VRP Discount Factor
Let σi denote the Implied Volatility and ζr the Realized or Historical Volatility. Then, the discount factor to
reduce the Volatility Risk Premium (VRP) is defined by:
d(σi,ζr) = min
e(σi·
ln(ζr)
ζr
)
σi
·

e
ζr·
ln(2)
σi − 1

,2
!
(63)
58