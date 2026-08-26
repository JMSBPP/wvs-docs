---
sha256: 1c85fb79a506490a5688ad39c9a719414ab5077c499bc486c89c6a708f2def5a
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 75786
---
Unified Approach for Hedging Impermanent Loss of Liquidity
Provision
Alex Lipton∗
, Vladimir Lucic†
and Artur Sepp‡
1st
July, 2024
Abstract
We develop static and dynamic approaches for hedging of the impermanent loss (IL) of
liquidity provision (LP) staked at Decentralised Exchanges (DEXes) which employ Uniswap V2
and V3 protocols. We provide detailed definitions and formulas for computing the IL to unify
different definitions occurring in the existing literature. We show that the IL can be seen a
contingent claim with a non-linear payoff for a fixed maturity date. Thus, we introduce the
contingent claim termed as IL protection claim which delivers the negative of IL payoff at the
maturity date. We apply arbitrage-based methods for valuation and risk management of this
claim. First, we develop the static model-independent replication method for the valuation of IL
protection claim using traded European vanilla call and put options. We extend and generalize
an existing method to show that the IL protection claim can be hedged perfectly with options if
there is a liquid options market. Second, we develop the dynamic model-based approach for the
valuation and hedging of IL protection claims under a risk-neutral measure. We derive analytic
valuation formulas using a wide class of price dynamics for which the characteristic function is
available under the risk-neutral measure. As base cases, we derive analytic valuation formulas
for IL protection claim under the Black-Scholes-Merton model and the log-normal stochastic
volatility model. We finally discuss estimation of risk-reward of LP staking using our results.
Keywords: Automated Market Making, Liquidity Provision, Decentralized Finance, Uniswap,
Cryptocurrencies, Impermanent Loss
JEL Classifications: C02, G12, G23
## 1 Introduction
Decentralised Exchanges (DEXes) play fundamental part in blockchain ecosystem by allowing users
to swap digital assets. The functioning of DEXes requires liquidity providers who stake their
liquidity to so-called pools, so that traders can use these pools for buying and selling tokens.
Automated Market Making (AMM) protocol is a mechanism for settling buy and sell orders at
DEXes. An AMM protocol is characterized by a constant function market maker (CFMM) which
assigns buy and sell prices for given orders using order sizes and current liquidity of a pool. Uniswap
V3 (Adams et al. (2021)) is the most widely employed CFMM which is adopted by many DEXes,
in addition to Uniswap DEX itself1. Uniswap V2 (Adams et al. (2020)) is an earlier AMM protocol
employing the constant product CFMM which is less capital efficient than V3 CFMM. Uniswap V2
is still in use for old altcoins pools. For details of the design of various CFMMs, see among others
Angeris et al. (2019), Lipton-Treccani (2021), Mohan (2022), Lipton-Hardjono (2022), Lipton-Sepp
(2022), Milionis et al. (2022), Park (2023), Lehar-Parlour (2024).
∗
Abu Dhabi Investment Authority & ADIA Lab & Khalifa University, Abu Dhabi, UAE
†
Imperial College & Marex, London, UK
‡
LGT Bank, Zurich, Switzerland, artursepp@gmail.com
1
In the second half of year 2024, Uniswap development team is launching Uniswap V4 AMM which has the same
CFMM as Uniswap V3.
1
arXiv:2407.05146v1 [q-fin.MF] 6 Jul 2024Uniswap V3 protocol allows liquidity providers to concentrate liquidity in specified ranges. As
a result, the liquidity of the pool can be increased in certain ranges (typically around the current
price) and the potential to generate more trading fees from the LP is increased accordingly. We
illustrate the dynamics of staked LP using ETH/USDT pool as an example. A liquidity provider
stakes liquidity to a specific range using initial amount of ETH and USDT tokens as specified by
Uniswap V3 CFMM. When the price of ETH falls, traders use the pool to swap USDT by depositing
ETH, so that the LP accrues more units of ETH. Thus when ETH falls persistently, the liquidity
provider ends up holding more units of the depreciating asset, which is similar to being short a put
option. In opposite, when ETH price increases, traders will deplete ETH reserves from the pool by
depositing USDT tokens. Thus, the liquidity provider ends up holding less units of the appreciating
asset, which is similar to being short a call option. The combined effect of increasing / decreasing
the exposure to depreciating / appreciating asset leads to what is known as the impermanent loss
in Decentralised Finance (DeFi) applications.
It is clear that the mechanism behind the impermanent loss of LPs is similar to being short a
portfolio of call and put options. Accordingly, we can apply well-developed methods from financial
engineering for designing the valuation and risk management of LPs using static and dynamic
methods for valuation and risk-management of derivative securities. Our contributions include
static model-independent replication and dynamic model-dependent replication of IL.
## 1.1 Literature review and contributions
For the static replication of IL under Uniswap V2 protocol, Fukasawa et al. (2023) derive ap-
proximate hedging portfolio using variance and gamma swaps. In addition, Lipton (2024) extends
Lipton-Sepp (2008), Lipton (2018), and obtains model-dependent costs of hedging portfolios using
values of variance and gamma swaps under Heston model. Deng et al. (2023) and Maire-Wunsch
(2024) develop the static replication for Uniswap V3 protocol. We note that their result hinges
specifically on the analytical formula of the IL under Uniswap V3 AMM. Also this method requires
to hold both call and put options for in-the-money and out-of-the-money strikes, which could be
very costly for practical implementation2. We provide a generic approach to design cost-efficient
replicating portfolio for IL hedging for general CFMM and illustrate our approach for Uniswap V3
protocol.
We note that currently the liquid option market (on Deribit options exchanges and some other
centralised exchanges) exists only for Bitcoin and Ether. Thus, hedging of LP stakes for altcoins
requires a model-dependent approach for replication of IL by introducing IL protection claim and
applying dynamic delta-hedging of this claim. In the current ecosystem, a few market-making and
trading companies provide off-chain (over-the-counter) IL protection of claims for a wide range of
digital assets. We develop a dynamic model-dependent approach for the valuation of IL protection
claims, which appears to be new in the literature.
For valuation purposes under Uniswap V3 protocol, we provide an original result with a de-
composition of the IL into components including payoffs of vanilla call and put options, digital
options, and an exotic payoff on the square root of the price. This decomposition allows for the
valuation of the IL protection claims under a large class of price dynamics, which have solution
for their characteristic functions, by utilizing Lipton-Lewis formula. As an important example we
derive an analytic solution for IL protecting claim under Black-Scholes-Merton model, which al-
lows to analyze the value of the IL protection claim using a single volatility parameter. As realistic
price dynamics including stochastic volatility correlated with the price dynamics, we apply the
log-normal stochastic volatility model developed in Sepp-Rakhmonov (2023).
2
At major options exchanges for digital and traditional markets, the liquidity is concentrated in call and put
options with out-of-the-money and near at-the-money strikes. Options with in-the-money strikes are not liquid with
high bid-ask spreads. As a result, a liquid and cost-efficient replicating portfolio should include only out-of-the-money
and near at-the-money strikes.
2Our paper is organized as follows. In Section 2, we provide definitions and derivations of the
IL and payoffs of IL protection claims. In Section 3, we apply these results for Uniswap V2 and V3
protocols. Hereby, we derive the decomposition formula for IL in Uniswap V3 protocol into payoffs
of vanilla, digital and square root contracts, which we use further for model-dependent valuation.
In Section 4, we develop generic approach for static replication of IL using traded vanilla options. In
Section 5, we develop the model-dependent approach for the valuation of protection claim against
IL. We conclude in Section 6.
## 2 Impermanent Loss of Liquidity Provision
## 2.1 Liquidity Provision
We consider a liquidity pool on a pair of token 1 and token 2. Without loss of generality, we assume
that token 1 is a volatile token and token 2 is a stable token with the spot price p of swapping one
unit of token 1 to p units of token 2. For concreteness, we fix token 1 to be ETH and token 2 to
be USDT with spot price p being ETH/USDT exchange price (p0 = 3800 as of 7th June 2024).
We consider a liquidity provision (LP) provided on x0 and y0 units of token 1 (ETH) and token
2 (USDT), respectively. The initial value of the LP in the units of token 2 (USDT) is given by
V
(y)
0 = p0x0 + y0 (1)
The value of the LP at time t is given by
V
(y)
t = ptxt + yt (2)
where xt and yt are the current units of ETH and USDT (these units are the outputs from AMM
protocol), respectively, in the staked LP and pt is the current ETH/USDT spot price. We treat
accrued LP fees separately in line with Uniswap convention.
The value of the LP in units of token 1 is given by
V
(x)
t = xt + p−1
t yt (3)
Our further results can be directly applied for pools with USDT/ETH type of conversion using
corresponding inverse prices and ranges. We also note that, in Uniswap V2 and V3, the price is
defined on the grid of price ticks which are functions of the pool fee tiers. Price ticks are dense for
pools with small fee tiers, so we assume that price range for pt is continuous (see Echenim et al.
(2023) for the analysis using discrete ticks).
## 2.2 Profit-and-Loss of LP
We consider two types of LP strategies excluding and including static delta hedging of the initial
stake.
Definition 2.1 (USDT Funded LP position). Funded position is created by funding the initial
allocation of x0 and y0 units with the total capital commitment of V
(y)
0 USDT. Staking the funded
position includes the purchase of x0 units of ETH token at price p0.
The value of the funded position equals to the value of LP in Eq (2): V funded
(y)
t = V
(y)
t . As
a result, the Profit-and-Loss (P&L) of the funded position in token 2 (USDT) at time t is given by
P&L funded(y)
≡ V
(y)
t − V
(y)
0 = (ptxt + yt) − (p0x0 + y0) (4)
3Definition 2.2 (Borrowed LP position). Borrowed position is created either by borrowing x0 units
of ETH or by purchasing x0 units of ETH for staking and by simultaneously selling short the
perpetual future for hedging the initial stake of x0 units of ETH3.
For the borrowed position with hedging, we set the hedge position of selling short x0 units of
token 1 with strike/entry price p0. The P&L of the hedge position in units of USDT token at time
t is given by
Hedge
(y)
t = −(pt − p0)x0 (5)
We assume that the hedge can be implemented by short selling the perpetual future and we treat
the funding cost separately from the LP P&L. The initial value of the staking position is given in
Eq (2). The value of the borrowed LP position at time t is given by
V borrowed
(y)
t = ptxt + yt − [pt − p0]x0 (6)
The P&L of the borrowed position at time t is given by
P&L borrowed
(y)
t = (ptxt + yt − [pt − p0]x0) − (p0x0 + y0)
= (ptxt + yt) − (ptx0 + y0)
(7)
## 2.3 Impermanent Loss
Using the two definitions of LPs in Eqs (4) and (7), we define the quantity known as the imperma-
nent loss in the following three ways.
Definition 2.3 (Impermanent Loss %). The nominal IL of funded LP is defined for the LP funded
with USDT by
IL funded(y)
(pt) =
(ptxt + yt) − (p0x0 + y0)
(p0x0 + y0)
(8)
The nominal IL of borrowed LP is defined for the LP with borrowed ETH by
IL borrowed(y)
(pt) =
(ptxt + yt) − (ptx0 + y0)
(p0x0 + y0)
(9)
The relative IL of borrowed LP is defined for borrowed LP by
Rel IL borrowed(y)
(pt) =
(ptxt + yt) − (ptx0 + y0)
(ptx0 + y0)
(10)
In the literature, all three definitions are being used. Hereby, we clarify the meaning of each
definition. The nominal IL of funded LP is applicable when the LP provider funds the position
by allocation V0 USDT tokens and buys the initial stake of x0 ETH tokens. The nominal IL
for borrowed LP is common for LPs accompanied with either borrowing the initial stake of x0
ETH tokens or with static delta-hedging of the initial stake of x0 tokens using perpetual futures.
The relative IL of borrowed LP defines the P&L of the borrowed LP relative to the buy-and-hold
position rather than the initial staked value of the LP.
The nominal IL can be easily interpreted because P&L of the LP in USDT is the nominal IL
multiplied by the initial staked notional so that we obtain
P&L funded(y)
(pt) = N(y)
× IL funded(y)
(pt)
P&L borrowed(y)
(pt) = N(y)
× IL borrowed(y)
(pt)
(11)
3
There is very liquid market for core cryptocurrencies on both on-chain exchanges (such as Hyperliquid, GMX,
Aevo) and on off-chain exchanges (such as Binance, Bybit, Deribit), so that hedging of long exposures is possible.
4where N(y) is the initial notional in USDT token of the staked LP. In opposite, the relative IL lacks
this interpretation. Thus, while relative IL appears in some of the literature to emphasize the IL
relative to the buy-and-hold portfolio, its practical application for modelling of the realised P&L
from a LP is not obvious. In this paper we focus only on hedging of the nominal IL for funded and
borrowed LPs in Eqs (8) and (9), respectively.
Since the tokens can be used interchangeably, our definitions are symmetric. For a position
funded in x (ETH) tokens the corresponding P&L is obtained using p−1
t = 1/pt and Eq (11)
becomes
P&L funded(x)
(p−1
t ) = N(x)
× IL funded(x)
(p−1
t ),
P&L borrowed(x)
(p−1
t ) = N(x)
× IL borrowed(x)
(p−1
t ),
(12)
where N(x) is notional in x units and
IL funded(x)
(p−1
t ) =
xt + p−1
t yt

− x0 + p−1
0 y0

x0 + p−1
0 y0

IL borrowed(x)
(p−1
t ) =
xt + p−1
t yt

− x0 + p−1
t y0

x0 + p−1
0 y0

(13)
## 2.4 Payoff of IL Protection Claim
We fix maturity time T.
Definition 2.4 (Payoff of IL protection claim). We define the protection claim against IL as a
derivative security whose payoff at time T equals to negative value of the IL. For the funded LP,
the payoff at time T is defined by
Payofffunded
(pT ) = −IL funded(y)
(pT ) (14)
For the borrowed LP, the payoff at time T is defined by
Payoffborrowed
(pT ) = −IL borrowed(y)
(pT ) (15)
A liquidity provider of staked LP with notional N(y) can buy the IL protection claim to eliminate
the impermanent loss from the staked LP. By Eq (11), at time T the P&L of holder’s LP will be
matched by the payoff of the IL protection claim in Eq (14) or Eq (15). As a result, the liquidity
provider can perfectly hedge the IL at time T.
## 3 Applications to Uniswap AMM Protocol
We now derive explicit formulas for the IL of funded and borrowed LP stakes under Uniswap V2
and V3 protocols.
## 3.1 Uniswap V2
In Uniswap V2 (Adams et al. (2020)), the CFMM is defined by the constant product rule as follows
xy = L2
(16)
where x and y are pool reserves and L is the pool liquidity parameter. In the Uniswap V2 white
paper, the constant is defined by k. We use L2, L > 0, in line with V3 specification.
The pool price is determined by pool reserves as follows
p ≡
y
x
(17)
5Thus, we need to solve Eq (16) and (17) in the two unknowns x and y. Substituting y = px from
Eq (17) into Eq (16), we obtain that the LP stakes are given as follows
x =
s
L2
p
, y =
p
pL2. (18)
From (18) the value of LP position is given by4
V
(y)
t = ptxt + yt = 2L
√
pt. (19)
Proposition 3.1 (Funded LP). The funded P&L in Eq (4) is computed by:
P&L funded(y)
(pt) = 2L
√
p0
r
pt
p0
− 1

(20)
The nominal IL for funded LP in Eq (8) is computed by
Nom IL funded(y)
(pt) =
r
pt
p0
− 1 (21)
Proof. Using Eq (19), we obtain
P&L funded(y)
(pt) = 2L
√
pt − 2L
√
p0 = 2L
√
p0
r
pt
p0
− 1

(22)
Given an initial notional of the stake such as Ny = V0 = 2L
√
p0, we obtain the nominal IL.
Proposition 3.2 (IL for Borrowed LP in Uniswap V2). The borrowed P&L in Eq (7) is given by:
P&L borrowed(y)
(pt) = −L
√
p0
r
pt
p0
− 1
2
(23)
The nominal IL for borrowed LP in Eq (9) is given by
Nom IL borrowed(y)
pt = −
1
2
r
pt
p0
− 1
2
(24)
Relative IL in Eq (10) is given by
Rel IL borrowed(y)
(pt) = −
q
pt
p0
− 1
2
pt
p0
+ 1
(25)
Proof. From Eq (18) we note that
ptx0 + y0 = pt
s
L2
p0
+
p
p0L2 =
√
p0L

pt
p0
+ 1

(26)
4
This relationship follows from the condition that the internal price in Eq (17) inferred by pool reserves follows
an external price pt, observed on other DEXes and centralised exchanges. In practice, reserves of liquidity pools
are balanced so that the internal price in Eq (17) follows external price feeds withing tight bands most of times due
to arbitrage operations of multiple arbitragers in blockchain ecosystem. For details of such arbitrages see among
others Milionis et al. (2022), Park (2023), Lehar-Parlour (2024), Cartea et al. (2023), Cartea et al. (2024). Same
considerations apply for the internal price in Eq (31) implied by pool reserves for Uniswap V3 pools.
6Thus, we obtain
P&L borrowed(y)
(pt) = (ptxt + yt) − (ptx0 + y0)
= 2
p
ptL2 −
√
p0L

pt
p0
+ 1

= −L
√
p0
r
pt
p0
− 1
2
(27)
It is clear that the minimum is 0 at pt = p0 and otherwise the borrowed P&L is negative for
any value of p1.
Corollary 3.1 (Payoff of claim for IL protection for Uniswap V2 AMM). Using definitions in Eq
(14) and Eq (15) for payoffs of protection claim against funded and borrowed LP, respectively, along
with respective Eqs (21) and (24), we obtain
Payofffunded
(pT ) = 1 −
r
pt
p0
,
Payoffborrowed
(pT ) =
1
2
r
pt
p0
− 1
2 (28)
In subplot (A) of Figure (1), we show ETH units (left y-axis) and USDT units (right y-axis) for
LP Uniswap V2 with 1m USDT notional and p0 = 2000 ETH/USDT price. The initial LP units
of (ETH, USDT) are (250,500000). The red bar at p = 1500 shows LP units of (289, 433013) with
the higher allocation to ETH units as ETH/USDT price falls. The green bar at p = 2500 shows
corresponding LP units of (224,559017) with the higher allocation to USDT units as ETH/USDT
price rises. In subplot (B), we show USDT values of 50%/50% ETH/USDT portfolio, Funded LP
position and Borrowed LP position. The funded LP underperforms the 50%/50% portfolio on both
the upside (because LP position reduces ETH units) and on the downside (because LP position
reduces ETH units). The value of the borrowed LP has zero first-order beta to ETH with negative
quadratic convexity to ETH/USDT changes.
## 3.2 Application to Uniswap V3
In Uniswap V3 protocol (see Adams et al. (2021)), the CFMM is defined by
xvyv = L2
(29)
where xv and yv are termed as virtual reserves:
xv ≡ x +
L
√
pb
, yv ≡ y + L
√
pa (30)
with the liquidity amount L provided in the price range [pa,pb].
For ETH/USDT pool, the price p is set by:
p ≡
yv
xv
=
y + L
√
pa
x + L √
pb
(31)
Eqs (29) and (31) are viewed as two equations in four unknowns (x, y, L, p):

x +
L
√
pb

(y + L
√
pa) = L2
p =
y + L
√
pa
x + L √
pb
.
(32)
7Figure 1: (A) ETH units (left y-axis) and USDT units (right y-axis) for LP Uniswap V2. (B) USDT value of
50%/50% ETH/USDT portfolio, Funded LP position and Borrowed LP position. Uniswap V2 LP position
is constructed using 1m USDT notional with p0 = 2000 ETH/USDT price.
The above equations have to hold at any point in time, with internal price p tracking an internal
price observed on other trading venues within tight bounds due to arbitragers adjust pool reserves
accordingly to eliminate arbitrage opportunities. Adding (removing) liquidity amounts to increasing
(decreasing) L via increasing x and y, while keeping p constant. Swapping (trading) tokens amounts
to keeping changing x, y and p, while keeping L the same.
Importantly, we solve for x and y given L and p as independent variables. For a given position
with L and p as external parameters, this solution provides how much units x and y are assigned
to the LP position.
Lemma 3.1 (Solution for x and y). Thus for p ∈ (pa,pb), the LP units x and y are given by:
x = L

1
√
p
−
1
√
pb

, y = L(
√
p −
√
pa) (33)
For p ≤ pa, the position is fully in token 1:
x = L

1
√
pa
−
1
√
pb

, y = 0 (34)
For p ≥ pb, the position is fully in token 2:
x = 0, y = L(
√
pb −
√
pa) (35)
Proof. We substitute the second equation in Eq (32)
(y + L
√
pa) = p

x +
L
√
pb

(36)
into the first one to obtain

x +
L
√
pb
2
=
L2
p
⇒ x = L

1
√
p
−
1
√
pb

(37)
and
(y + L
√
pa) = L
√
p ⇒ y = L(
√
p −
√
pa) (38)
8We obtain that the initial value of LP using Eq (33) for pt ∈ (pa,pb) is given by
V0 ≡ p0x0 + y0 = L

2
√
p0 −
p0
√
pb
−
√
pa

(39)
Corollary 3.2 (Initial notional Ny). Given an initial notional of the stake such as Ny = V0, using
Eq (39) we obtain that the provided liquidity L is set by
⇒ L =
Ny
2
√
p0 − p0 √
pb
−
√
pa
(40)
## 3.2.1 Impermanent Loss
Proposition 3.3 (Funded P&L and IL in Uniswap V3). The P&L of the funded position in Eq
(4) at time t with current price pt is given by
P&L funded(y)
=

     
     
L
h
2
√
pt −
√
p0

+ p0−pt √
pb
i
pt ∈ (pa,pb)
L
h
pt

1 √
pa
− 1 √
pb

+ p0 √
pb
− 2
√
p0 +
√
pa
i
pt ≤ pa
L
h√
pb + p0 √
pb
− 2
√
p0
i
pt ≥ pb
(41)
where
L =
Ny
2
√
p0 − p0 √
pb
−
√
pa
(42)
and Ny is USDT notional.
The nominal IL for funded position defined in Eq (8) is computed by
Nom IL funded(y)
=
P&L funded(y)
L

2
√
p0 − p0 √
pb
−
√
pa
 (43)
Corollary 3.3 (The payoff of IL protection claim for funded LP). The payoff of IL protection
claim at maturity date T for funded LP in Eq (14) is given by the following compact formula
Payofffunded
(pt) = −
pt √
f(pt;pa,pb)
+
p
f(pt;pa,pb) − pt √
pb
−
√
pa
p0 √
f(p0;pa,pb)
+
p
f(p0;pa,pb) − p0 √
pb
−
√
pa
+ 1 (44)
where f(x;pa,pb) = max(min(x,pb),pa).
Proof. See Appendix 6.1.
Proposition 3.4 (P&L of borrowed LP). The P&L of the borrowed position in Eq (7) is given by
P&L borrowed(y)
(pt) =

      
      
−L
√
p0
q
pt
p0
− 1
2
pt ∈ (pa,pb)
L
h
pt

1 √
pa
− 1 √
p0

−
√
p0 −
√
pa
i
pt ≤ pa
L
h √
pb −
√
p0

− pt

1 √
p0
− 1 √
pb
i
pt ≥ pb
(45)
Nominal borrowed impermanent loss in Eq (9) is given by
Nom IL borrowed(y)
(pt) =
P&L borrowed(y)(pt)
L

2
√
p0 − p0 √
pb
−
√
pa
 (46)
9Figure 2: (A) ETH units (left y-axis) and USDT units (right y-axis) for LP on Uniswap V3. (B) USDT
value of 50%/50% ETH/USDT portfolio, Funded LP position and Borrowed LP position. Uniswap V3 LP
position is constructed using 1m USDT notional with p0 = 2000, pa = 1500, p0 = 2500.
Proof. See Appendix 6.2.
Corollary 3.4 (Payoff of IL protection claim for borrowed LP). The payoff of IL protection claim
against for funded LP in Eq (14) is given by the following compact formula
Payoffborrowed
(pt) =
pt √
f(pt;pa,pb)
+
p
f(pt;pa,pb) − pt √
f(p0;pa,pb)
−
p
f(p0;pa,pb)
p0 √
f(p0;pa,pb)
+
p
f(p0;pa,pb) − p0 √
pb
−
√
pa
(47)
where f(x;pa,pb) = max(min(x,pb),pa).
In subplot (A) of Figure (2), we show ETH units (left y-axis) and USDT units (right y-axis) for
LP on Uniswap V3 with 1m USDT notional and p0 = 2000, pa = 1500, pb = 2500. The initial LP
units of (ETH, USDT) are (220,559282). The red bar at p = 1500 shows LP units of (543, 0) with
LP fully in ETH units when price falls below lower threshold pa. The green bar at p = 2500 shows
corresponding LP units of (0,1052020) with LP fully in USDT units when price rises above upper
threshold pb. In subplot (B), we show USDT values of 50%/50% ETH/USDT portfolio, Funded
LP positions and Borrowed LP positions. The value profile of funded LP resembles the profile of
a covered call option (long ETH and short out-of-the-money call). The value of the borrowed LP
resembles the payoff of a short straddle (short both at-the-money call and put).
In Figure (3) we show P&L profiles of borrowed and funded LPs as functions of ranges for
Uniswap V3 and full range for Uniswap V2. For borrowed LPs, narrow ranges result in higher
losses at same price levels. For funded LPs, narrower ranges result in higher downside losses and
smaller upside potential.
## 3.3 Decomposition of the IL under Uniswap V3 into Simple Payoffs
First we derive the model independent decomposition of IL into payoffs of vanilla and “exotic”
options. We will further apply this decompositions for model-based valuation of IL protection
claims in Uniswap V3.
Proposition 3.5 (Decomposition of IL for Funded LP). IL of funded LP can be decomposed into
the three parts as follows:
IL funded(y)
(pt) = u0(pt) + u1/2(pt) + u1(pt), (48)
10Figure 3: P&L % of hedged and funded LPs as functions of ranges for Uniswap V3 and full range for Uniswap
V2. (A) P&L % of borrowed LP; (B) P&L % of funded LP. LP positions are constructed using 1m USDT
notional with p0 = 2000.
where u0(pt), u1/2(pt), and u1(pt) are linear part, (exotic) square root price, and (vanilla) option
part defined as follows
u0(pt) = −
1
√
pb
pt +

p0
√
pb
− 2
√
p0

u1/2(pt) =
√
pt1{pa < pt < pb}
u1(pt) = −
1
√
pa
max{pa − pt,0} +
1
√
pb
max{pt − pb,0} + 2
√
pa1{pt ≤ pa} + 2
√
pb1{pt ≥ pb}.
(49)
Proposition 3.6 (Decomposition of IL for Borrowed LP). IL of borrowed LP can be decomposed
into the three parts as follows:
IL borrowed(y)
(pt) = u0(pt) + u1/2(pt) + u1(pt), (50)
where u0(pt), u1/2(pt), and u1(pt) are linear part, (exotic) square root price, and (vanilla) option
part defined as follows
u0(pt) = −
1
√
p0
pt −
√
p0
u1/2(pt) =
√
pt1{pa < pt < pb}
u1(pt) = −
1
√
pa
max{pa − pt,0} +
1
√
pb
max{pt − pb,0} + 2
√
pa1{pt ≤ pa} + 2
√
pb1{pt ≥ pb}.
(51)
Proof. See Appendix 6.4.
To summarize, we note that the only difference between the decomposition of IL of funded LP
in Eq (48) and borrowed LP in Eq (50) is given by the linear term u0(pt) with the square root
and option terms being the same. As a result, we can unify our results for ILs of funded LP and
borrowed LP as defined in Eq (8) and (9), respectively, for Uniswap V3 for as follows.
11Corollary 3.5 (Decomposition of IL for Funded and Borrowed LPs). Using Eq (48) for IL of
funded LP and Eq (50) for IL of borrowed LP we obtain
IL funded(y)
(pt) = ufunded
0 (pt) + u1/2(pt) + u1(pt),
IL borrowed(y)
(pt) = uborrowed
0 (pt) + u1/2(pt) + u1(pt),
(52)
where
ufunded
0 (pt) = −
1
√
pb
pt +

p0
√
pb
− 2
√
p0

uborrowed
0 (pt) = −
1
√
p0
pt −
√
p0
u1/2(pt) =
√
pt1{pa < pt < pb}
u1(pt) = −
1
√
pa
max{pa − pt,0} +
1
√
pb
max{pt − pb,0} + 2
√
pa1{pt ≤ pa} + 2
√
pb1{pt ≥ pb}.
(53)
Corollary 3.6 (Payoff of IL protection claim for Uniswap V3 AMM). Using definitions in Eq (14)
and Eq (15) for payoffs of IL protection claim of funded and borrowed LP, respectively, at maturity
time T along with decomposition of IL in Eq (52), we obtain
Payofffunded
(pT ) = −
h
ufunded
0 (pT ) + u1/2(pT ) + u1(pT )
i
,
Payoffborrowed
(pT ) = −
h
uborrowed
0 (pT ) + u1/2(pT ) + u1(pT )
i
,
(54)
where functions u are defined in Eq (53).
## 4 Static Replication of Impermanent Loss with Vanilla Options
We derive a static replication of the IL at the fixed maturity time T using a portfolio of European
call and put options. Accordingly, the IL can be hedged by a buying a portfolio of traded options.
We introduce payoff functions of call and put options as follows5:
ucall
(p,k) = (p − k)+
, uput
(p,k) = (k − p)+
(55)
where k is the strike price k and p is the current price.
We note that Deng et al. (2023) and Maire-Wunsch (2024) obtain the following replication
formula for the replication of funded P&L as defined in Eq (4) and its analytic expression for
Uniswap V3 defined in Eq (41) (expressed using our notation)
1
L
P&L funded(y)
(pt) + 1 = −
1
4
Z pb
pa
k−3/2

uput
(pt,k) + ucall
(pt,k)

dk
+
1
2
√
pa

ucall
(pt,pa) − uput
(pt,pa)

+
1
2
√
pb

uput
(pt,pa) − ucall
(pt,pa)

(56)
Deng et al. (2023) derive the replication formula (56) using the following representation of IL
under Uniswap V3
1
L
P&L funded(y)
(pt) + 1 = pt

1
√
pt
−
1
√
pb
+
− pt

1
√
pt
−
1
√
pa
+
+ (
√
pt −
√
pa)+
− (
√
pt −
√
pb)+
(57)
5
We note that on crypto exchanges most options are the so-called inverse options with the payoff paid in the
underlying token. There is a direct arbitrage-based equivalence between vanilla and inverse options, see Alexander et
al. (2023) and Lucic-Sepp (2024) for details, so that our analysis follows the same logic when using inverse options.
12where we apply our definition of nominal IL in Eq (43) and Carr-Madan representation (Carr-Madan
(2001)). We note that, since the function on the left-hand side in (57) is not twice differentiable,
strictly speaking the Carr-Madan representation does not apply. For completeness, in Appendix
6.7 we provide a derivation which only relies of existence of the generalized derivatives.
Decomposition in Eq (57) includes four exotic payoffs on the square root of the price. In contrast,
we derive an alternative decomposition of IL of the funded LP in Eq (48) which decomposes the IL
into one exotic payoff on the square root of the price, two payoffs of vanilla call and put options,
and two payoffs of digital options. It is clear that the decomposition of the IL is not unique and can
be done with different base payoff function. Our decomposition for IL of funded and borrowed LPs
in Eq (48) and (50), respectively, is most suited for the model-dependent valuation of the claims
for IL protection.
We note that there are two complications with replication formula (56) for practical usage.
First, formula (56) assumes that there are strikes corresponding to lower and upper levels pa and
pb. In practice, on Deribit exchange, BTC and ETH options are traded with the strike width of
1000 and 50 USD, respectively. Therefore, the practical application of formula (56) is very limited
because it only applicable to LPs with ranges contained in strikes of traded options. Second,
replication formula (56) requires to buy both calls and puts at the same strikes. Thus, for strikes
smaller than pt, both out-the-money puts and in-the-money calls are purchased and, for strikes
above pt, both in-the-money puts and out-the-money calls are purchased. In practice on Deribit
exchange, the liquidity for in-the-money calls and puts is limited with much wider bid-ask spreads,
so that implementation of formula (56) can be too cost-inefficient in reality.
Instead, we derive an alternative replication formula which only purchases out-out-the money
puts for strikes below the current price and out-out-the money calls for strikes above the current
price. We also note that our replication formula for a generic CFMM of AMM protocols in addition
to CFMMs of Uniswap V2 or V3 protocols.
## 4.1 Replication of IL with Vanilla Options
We derive a replication portfolio for IL under a generic AMM protocol. We assume that IL IL(p)
is a function of the current price p and specified by Eq (4) for funded LP or by Eq (7) for borrowed
LP. In particular, the IL for funded and borrowed LPs in Uniswap V2 is obtained using Eq (21)
and (24), respectively. For Uniswap V3, the IL for funded and borrowed LPs is obtained using Eq
(43) and (46), respectively. The corresponding IL for all these specifications is denoted by IL(p).
Proposition 4.1 (Replication portfolio for generic LP). We consider IL of a generic AMM as
function of price IL(p). We fix option maturity time T and consider a set of call and put options
traded for this maturity time.
Put side. We assume a discrete grid of strikes Kput and corresponding payoffs of put options
Uput:
Kput
= (k1,k2,...,kN), Uput
= (u1,u2,...,uN) (58)
where un = (kn − p)+, n = 1,..,N, kn−1 < kn and kN ≤ p0 with p0 being T-forward price. We
consider the replication portfolio of puts with weights wn:
Πput
=
N X
n=1
wnuput
n (59)
We define the first-order derivative of the IL function at discrete strike points as follows:
δIL(kn) =
IL(kn) − IL(kn−1)
kn − kn−1
(60)
Then the weights of put options for the replication portfolio in Eq (59) are computed by:
wn−1 = −(δIL(kn) − δIL(kn−1)),n = N,...,3 (61)
13with wN = δIL(kN) and with w1 = 0.
Call side. We assume a discrete grid of strikes K and corresponding payoffs of call options
Ucall:
Kcall
= (k1,k2,...,kM), Ucall
= (u1,u2,...,uM) (62)
where um = (p − km)+, m = 1,..,M, with km > km−1 and k1 ≥ p0 being T-forward price.. We
consider the hedging portfolio of calls with weights wm:
Πcall
=
M X
m=1
wmucall
m (63)
We compute the first-order derivative of the IL function δIL(km) as in Eq (60).
Then the weights of call options for the replication portfolio in Eq (63) are computed by:
wm = −(δIL(km) − δIL(km−1)),m = 2,...,M − 1 (64)
with w1 = δIL(k1) and with wM = 0.
Proof. See Appendix 6.5.
Corollary 4.1 (Static portfolio for replication of the payoff of IL Protection claim). The option
replication portfolio for payoff of IL protection claim is given by:
Π ≡ Πput
+ Πcall
=
N X
n=1
wnUput
n +
M X
m=1
wmUcall
m (65)
where the weights of put and call options are computed using Eq (60) and Eq (64), respectively,
with IL function IL(p) specified using Eq (28) and (54) for payoffs under Uniswap V2 and V3
respectively.
The cost of the replication portfolio is Π0 computed using option prices observed at inception of
a IL protection claim .
In Figure (4), we illustrate the application of formulas (59) and (63) for replicating of IL for
borrowed Uniswap V3 LP using 1m USDT notional, p0 = 2000 ETH/USDT with pa = 1500 and
pb = 2500. We use strikes with widths of 50 USDT in alignment with ETH options traded on
Deribit exchange (for options with maturity of less than 3 days, Deribit introduces new strikes with
widths of 25). In subplot (A), we show the IL of the borrowed LP position, and the payoffs of
replicating calls and puts portfolios (with negative signs to align with the P&L). In subplot (B),
we show the residual computed as the difference between the IL and the payoff of the replication
portfolios. In Subplot (C), we show the number of put and call option contracts for the replication
portfolios.
From Eq (152) it is clear that the approximation error is zero at strikes in the grid, which is
illustrated in subplot (B). The maximum value of the residual is 0.025% or 2.5 basis points, which
is very small. A small approximation error with a similar magnitude will occur in case, p0, pa, pb
are not placed exactly at the strike grid.
## 5 Model-dependent Valuation of Protection Claims against IL
In this section we develop the model-dependent valuation and dynamics hedging of IL protection
claims for Uniswap V2 and V3 protocols.
14Figure 4: Replication of P&L of borrowed Uniswap V3 LP for allocation of 1m USDT notional, p0 = 2000
ETH/USDT with pa = 1500 and pb = 2500. (A) Impermanent loss in USDT and (negative) values of
replicating puts and call portfolios; (B) Residual, which is the spread between LP P&L and options replication
portfolios; (B) Number of option contracts for put and calls portfolios.
## 5.1 Exponential Price Dynamics
We consider a continuous-time market with a fixed horizon date T∗ > 0 and uncertainty modeled
on probability space (Ω,F,P) equipped with filtration F = {Ft}0≤t≤T∗. We assume that F is
right-continuous and satisfies usual conditions.
We introduce exponential price dynamics for price pt:
pt = p0ext
, x0 = 0, (66)
where xt is a stochastic process driving the log performance. We assume an arbitrage-free market
with a risk-neutral measure Q such that6:
EQ
[pT |Ft] ≡ ptEQ
[exT
|Ft] = pte(r−q)(T−t)
(67)
where r is the discount rate and q is the borrow rate.
For hedging a IL protection claim, a trader needs to sell short the underlying token. Short-
selling can be readily executed either through a centralized exchange (CEX) using perpetual futures
or through borrowing the token on a DeFi protocol using stablecoins as collateral. In the CEX
case, the borrow rate q is the negative of the funding rate reported by CEX (by the convention of
crypto CEXes, the funding rate is the rate paid by traders with long positions). In the DeFi case,
the borrow rate q is the accrued borrow rate.
As for the discount rate r, most DEXes and CEXes (such as Deribit when marking their listed
options) assume zero discount rate. We would call r as a low risk opportunity cost available in
6
This assumption is valid for complete markets. For incomplete markets, e.g. dynamics including stochastic
volatility or jumps, we fix a martingale measure using specific risk preferences (see for an example Lewis (2000)).
Sepp-Rakhmonov (2023) consider the existence of equivalent risk-neutral measures for stochastic volatility models.
15DeFi with the risk being a potential hack of blockchain technology when deposited and staked
assets could be appropriated. Staking of high quality stablecoins in top DeFi protocols would yield
1% − 2% in the current environment, which is far less than rates on government short-term bonds
in traditional markets (4% − 5% as of June 2024).
When we value issued IL protection claims, we emphasize that the entry price p0 is fixed at the
time of initialising of an LP so that the entry price p0 becomes a parameter of the IL formula in Eq
(50) along with the lower and upper ranges. Once the valuation time advanced to time t and new
price is observed we need to compute the expected IL using price pt. We introduce the following
decomposition at time t for the total log-performance xT
xT = xt + xτ, (68)
where xt is the realised log-performance over period (0,t] and xτ is the stochastic performance over
the period (t,T]. Here τ, τ = T − t, is the time-to-maturity. As a result, we model pT using Eq
(66) with (68) as follows
pT = p0ext+xτ
. (69)
## 5.2 Model-dependent Valuation
We consider the valuation of claims for IL protection as defined in Eqs (14) and (15). We focus
on the valuation of these payoffs for Uniswap V2 and V3 using the payoff decomposition and by
applying the exponential model in Eqs (66) and (69). Hereby, we fix maturity time T.
Corollary 5.1 (Payoff of IL protection claim in Uniswap V2 AMM under exponential model (66)).
Applying exponential model in Eq (69) to Eqs (28), we obtain
Payofffunded
(xT ) = 1 − e
1
2
(xt+xτ)
,
Payoffborrowed
(xT ) =
1
2

e
1
2
(xt+xτ)
− 1
2 (70)
Corollary 5.2 (Payoff of claim for IL protection for Uniswap V3 AMM under exponential model
(66)). Applying exponential model in Eq (69) to Eqs (54), we obtain
Payofffunded
(xτ) = −
h
ufunded
0 (xt + xτ) + u1/2(xt + xτ) + u1(xt + xτ)
i
,
Payoffborrowed
(xτ) = −
h
uborrowed
0 (xt + xτ) + u1/2(xt + xτ) + u1(xt + xτ)
i
,
(71)
where the linear part is computed by
ufunded
0 (xt + xτ) = −
p0
√
pb
ext+xτ
+

p0
√
pb
− 2
√
p0

uborrowed
0 (xt + xτ) = −
√
p0 ext+xτ
+ 1

,
(72)
the square root part is computed by:
u1/2(xt + xτ) =
√
p0 exp

1
2
(xt + xτ)

1{xa < xt + xτ < xb} (73)
with xa = ln(pa/p0) and xb = ln(pb/p0).
The option part is computed by
u1(xt + xτ) =
1
√
pa
max

pa − p0ext+xτ
,0 −
1
√
pb
max

p0ext+xτ
− pb,0
− 2
√
pa1{xt + xτ ≤ xa} − 2
√
pb1{xt + xτ ≥ xb}
(74)
Given payoff function in Eqs (70) and (71), the present value of the IL protection claim at time
t is computed under the risk-neutral measure Q by:
PV (t,pt;T) = e−rτ
EQ
[Payoff(xτ) |Ft] (75)
165.3 Valuation in Black-Scholes-Merton (BSM) model
We consider the BSM model with the price dynamics under the risk-neutral measure Q given by
dpt = µptdt + σptdwt, p0 = p (76)
where µ = r − q is the risk-neutral drift, wt is a Brownian motion with w0 = 0. Accordingly, the
log-performance xt = logpt/p0 is driven by
dxt =

µ −
1
2
σ2

dt + σdwt, x0 = 0 (77)
and the distribution of xτ is normal with mean µ − 1
2σ2

τ and volatility σ
√
τ.
Proposition 5.1 (BSM Value of IL protection claim under Uniswap V2). Applying model dynamics
(76) to payoff functions in Eq (70) using valuation operator in Eq (75), we obtain
PV funded
(t,pt) = e−rτ

1 − e
1
2
xt
G

τ;−
1
2

,
PV borrowed
(t,pt) =
1
2
e−rτ

e(xt+µτ)
− 2e
1
2
xt
G

τ;−
1
2

+ 1
 (78)
where
G

τ;−
1
2

= exp

1
2

µ −
1
2
σ2

τ +
1
8
σ2
τ

(79)
Proof. For the dynamics in Eq (77), we apply the fact that the moment generation function G(τ;ϕ)
of xτ is given by:
G(τ;ϕ) ≡ EQ
[exp{−ϕxτ} |Ft] = exp

−

µ −
1
2
σ2

ϕτ +
1
2
ϕ2
σ2
τ

(80)
Proposition 5.2 (BSM value of IL protection claim under Uniswap V3). The values of IL protec-
tion claims with payoff functions in Eq (71) under valuation operator in Eq (75) and BSM dynamics
(77) are given by
PV funded
(t,pt) = −
h
Ufunded
0 (pt) + U1/2(pt) + U1(pt)
i
,
PV borrowed
(t,pt) = −
h
Uborrowed
0 (pt) + U1/2(pt) + U1(pt)
i
,
(81)
where the linear part is computed by:
Ufunded
0 (t,pt) = e−qτ pt
√
pb
− e−rτ

p0
√
pb
− 2
√
p0

Uborrowed
0 (t,pt) =
√
p0

pt
p0
e−qτ
+ e−rτ

.
(82)
Here U1/2(pt) is the BSM value of the square root payoff in Eq (73) computed by:
U1/2(pt) = 2e−rτ√
pt exp

1
2
µτ −
1
8
σ2
τ

N

ln(pb/pt) − (r − q)τ
σ
√
τ

− N

ln(pa/pt) − (r − q)τ
σ
√
τ

,
(83)
where N is the cpdf of normal random variable.
17Figure 5: BSM premium annualised (Uborrower
(t,pt)/T) for borrowed LP computed using Eq (81) with time
to maturity of two weeks T = 14/365 and notional of 1 USDT as function of the range multiple m such that
pa(m) = e−m
p0 and pb(m) = em
p0.
The option part is computed by
U1(pt) =
1
√
pa
OBSM
(pt;pa,−1) −
1
√
pb
OBSM
(pt;pb,+1)
− 2
√
paDBSM
(pt;pa,−1) − 2
√
pbDBSM
(pt;pb,+1).
(84)
Here OBSM(pt;k,+1) and OBSM(pt;k,−1) are the BSM prices of vanilla call and put with the
strike price k and indicator ω ∈ {+1,−1} respectively:
OBSM
(pt;k,ω) = e−qτ
ptN(ωd+(pt,k)) − ke−rτ
N(ωd−(pt,k)), (85)
where
d±(pt,k) =
ln(pt/k) + (r − q)τ
σ
√
τ
±
1
2
σ
√
τ, (86)
and DBSM(pt;k,+1) and DBSM(pt;k,−1) are digital call and put options with strike price k,
respectively:
DBSM
(pt;k,ω) = e−rτ
N(ωd−(pt,k)). (87)
Proof. See Appendix 6.6.
In Figure (5), we show the annualised cost (APR) % for the cost of BSM hedge for the borrowed
LP as a function of the range multiple m such that pa(m) = e−mp0 and pb(m) = emp0. We use two
weeks to maturity T = 14/365 and different values of log-normal volatility σ. All being the same,
it is more expensive to hedge narrow ranges.
The protection seller must hedge the claim dynamically using option delta. As a result, we
consider option delta under BSM model.
Corollary 5.3 (The delta of IL protection claim under BSM model).
∆funded
(t,pt) = −
h
∂pUfunded
0 (pt) + ∂pU1/2(pt) + ∂pU1(pt)
i
,
∆borrowed
(t,pt) = −
h
∂pUborrowed
0 (pt) + ∂pU1/2(pt) + ∂pU1(pt)
i
,
(88)
where
∂pUfunded
(t,pt) = e−qτ 1
√
pb
, ∂pUborrowed
(t,pt) = e−qτ 1
√
p0
, (89)
18Figure 6: BSM delta for borrowed LP computed using Eq (88) with time to maturity of two weeks T = 14/365
for Uniswap V3 LP with p0 = 2000, pa = 1500, pb = 2500, and notional of 1000000 USDT.
and
∂pU1/2(pt) =
1
2
√
pt
exp

1
2
µτ −
1
8
σ2
τ

N

ln(pb/pt) − (r − q)τ
σ
√
τ

− N

ln(pa/pt) − (r − q)τ
σ
√
τ

−
1
σ
√
τ
√
pt
exp

1
2
µτ −
1
8
σ2
τ

n

ln(pb/pt) − (r − q)τ
σ
√
τ

− n

ln(pa/pt) − (r − q)τ
σ
√
τ

.
(90)
Finally
∂pU1(pt) =
1
√
pa
∆O(pt;pa,−1) −
1
√
pb
∆O(pt;pb,+1)
− 2
√
pa∆D(pt;pa,−1) − 2
√
pb∆DG(pt;pb,+1)
(91)
where ∆O(pt;k,+1) and ∆D(pt;k,−1) are Black-Scholes-Merton deltas of vanilla option and digital
option, respectively, given by:
∆O(pt;k,ω) = N(ωd1), ∆D(pt;k,ω) =
ωe−rτ
ptσ
√
τ
n(d2) (92)
Proof. By taking the partial derivative wrt p in Eq (81).
In Figure 6, we show BSM delta for borrowed LP computed using Eq (88) with time to maturity
of two weeks T = 14/365 for borrowed LP in Uniswap V3 with p0 = 2000, pa = 1500, pb = 2500,
and notional of 1000000 USD. The initial units in the LP is (220.36,559282.18) units of ETH and
USDT, respectively. The static hedge is constructed by shorting 220.36 units of ETH. The first
line labeled LP ETH-Units corresponds to the excess ETH units of borrowed LP with zero units
at p = p0 and being under-hedged on the downside and over-hedged on the upside. ETH option
hedge shows the BSM delta computed using Eq (88) (the hedge for borrower LP is implemented
using the negative sign of BSM delta). For high volatilities or large maturity times, BSM delta
under-hedges near the range.
## 5.4 Valuation using Moment Generating Function
We consider a wide class of Markovian exponential dynamics in Eq (66) for which the moment
generating function (MGF) for the log-return xτ is available in closed-form. The closed-form
19solution for the MGF is available under a wide class of models including jump-diffusions and
diffusions with stochastic volatility. Thus, we can develop analytic solution for model-dependent
valuation of IL protection under various models with analytic MGF.
We denote the MGF by G(τ;ϕ), where ϕ is a complex-valued transform variable such that
ϕ = ϕr + iϕi, i =
√
−1. Formally, the MGF solves the following problem:
G(τ;ϕ) = EQ
h
e−ϕxτ
|Ft
i
(93)
where the expectation is computed using model dynamics under the risk-neutral measure Q and
Ft is information set.
Using the MGF, the density of x′ = xτ denoted by P(τ,x;x′) is computed by the Fourier
inversion
P(τ,x;x′
) =
1
π
ℜ
Z ∞
0
exp

ϕx′
G(τ;ϕ)dϕ

≡
1
π
ℜ
Z ∞
0
exp

ϕ(x′
− x) E(τ;ϕ)dϕ

(94)
with dϕ ≡ dϕi and G(τ;ϕ) ≡ exϕE(τ;ϕ).
For valuation of the IL protection claim using MGF G(τ;ϕ), we need to evaluate vanilla and
digital options, and the square root payoff in Eq (71). First, we derive generic valuation method for
payoff u(xτ). We evaluate the present value U(τ,xt) at time t of the payoff function u(xτ) which
is given similarly to Eq (75) by
U(τ,xt) = e−rτ
EQ
[u(xτ) |Ft] (95)
Using Eq(94) we obtain
U(τ,x) = e−rτ
Z ∞
−∞
u(x′
)P(τ,x;x′
)dx′
= e−rτ
ℜ
Z ∞
−∞
u(x′
)

1
π
Z ∞
0
eϕ(x′−x)
E(τ,ϕ)dϕ

dx′

=
1
π
e−rτ
ℜ
Z ∞
0
b u(ϕ)E(τ,ϕ)dϕ

,
(96)
where we assume that the inner integrals are finite to exchange the order of the integration. Here
b u(ϕ) is the transformed payoff function defined by
b u(ϕ) = e−ϕx
Z ∞
−∞
eϕx′
u(x′
)dx′
. (97)
Proposition 5.3 (Value of IL protection claim under Uniswap V2 under exponential model dy-
namics (76) with using the MGF). Applying dynamics (76) to payoff functions in Eq (70) under
expectation operator (75), we obtain
PV funded
(t,pt) = e−rτ

1 − e
1
2
xt
G

τ;−
1
2

,
PV borrowed
(t,pt) =
1
2
e−rτ

e(xt+µτ)
− 2e
1
2
xt
G

τ,−
1
2

+ 1
 (98)
Proof. We apply the definition of the MGF in Eq (93) and the martingale condition in Eq (67).
Accordingly, the IL under Uniswap V2 can be solved analytically for a wide class of models
which is first concluded in Lipton (2024).
20Proposition 5.4 (Valuation of IL protection claim under Uniswap V3). Given the MGF G(τ;ϕ)
defined in Eq (94) for log-price xτ in the exponential model in Eq (66) and payoff functions in Eq
(71), we obtain the following valuation formula
Ufunded
(t,pt) = −
h
Ufunded
0 (pt) + U1/2(pt) + U1(pt)
i
,
Uborrowed
(t,pt) = −
h
Uborrowed
0 (pt) + U1/2(pt) + U1(pt)
i
,
(99)
where Ufunded
0 (t,pt) and Uborrowed
0 (t,pt) are model independent linear parts computed as in BSM
model in Eq (82)
Ufunded
0 (t,pt) = e−qτ pt
√
pb
− e−rτ

p0
√
pb
− 2
√
p0

Uborrowed
0 (t,pt) =
√
p0

pt
p0
e−qτ
+ e−rτ

.
(100)
U1/2(pt) is the square root claim computed using valuation formula (96) with transform in Eq
(113).
The option part is computed by
u1(pt) =
1
√
pa
O(pt;pa,−1) −
1
√
pb
O(pt;pb,+1)
− 2
√
paD(pt;pa,−1) − 2
√
pbD(pt;pb,+1)
(101)
where O(pt;k,+1) and O(pt,k,−1) are model values of call and put options, respectively, computed
in Eq (103); D(pτ;k,+1) and D(pτ;k,−1) are model values of digital options computed in Eq
(107).
We emphasize that for the computation of the payoff transform b u(ϕ) of capped option in Eq
(106) we use ϕ = iy − 1/2. Then for call and put digitals we use Eq (108) and (110) also with
ϕ = iy − 1/2. Finally the transform of the square root payoff in Eq (113) can be also evaluated
using ϕ = iy−1/2. Thus for numerical implementation we fix the grid of {y} and set ϕ = iy−1/2.
We the compute MGF E(τ;ϕ) and 5 transforms of payoffs along ϕ = iy − 1/2, and compute 5
option values using Eq (96). Accordingly, the numerical implementation of pricing formula in Eq
(99) is efficient.
Proof. Vanilla call and put options
We represent the put and call payoff functions using capped payoffs as
c(pτ,k) = max{exτ
− k,0} = pτ − min{exτ
,k},
p(pτ,k) = max{k − exτ
,0} = k − min{exτ
,k}
(102)
Accordingly, we need to evaluate option on the capped payoff using Eq(96) so that we can value
vanilla calls and puts using
O(pt;k,+1) = e−qτ
pt − U(pt,k)
O(pt;k,−1) = e−rτ
k − U(pt,k)
(103)
where U(pt;k,ω) is the value of the capped payoff.
Applying Eq (97) for capped payoff u(x′) = min
n
ex′
,k
o
, we obtain
b u(ϕ) = e−ϕx e(ϕ+1)k∗
ϕ + 1
− ek∗ 1
Φ
eϕk∗
!
= e−ϕx

−e(ϕ+1)k∗ 1
(ϕ + 1)ϕ

= −ke−ϕx∗ 1
(ϕ + 1)ϕ
(104)
21where x∗ = ln(pt/k) + µτ is the log-moneyness, k∗ = lnk − µτ with the first integral being finite
for ℜ[ϕ] > −1 and the second integral being finite for ℜ[ϕ] < 0. The integral (104) is finite for
−1 < ϕr < 0. Setting ϕ = iy − 1/2, we derive:
b u(ϕ = iy − 1/2) = −ke−(iy−1/2)x∗ 1
(1/2 + iy)(−1/2 + iy)
= ke−(iy−1/2)x∗ 1
y2 + 1/4
(105)
Finally we obtain the valuation formula for capped payoff known as Lipton-Lewis formula
(Lipton (2001), Lewis (2000)) as follows
U(pt,k) =
ke−rτ
π
ℜ
Z ∞
0
e−(iy−1/2)x∗ 1
y2 + 1/4
E(τ;ϕ = iy − 1/2)dy

, (106)
where x∗ = ln(pt/k) + µτ is log-moneyness.
Digital options
We represent the value of digital calls and puts as follows
D(pτ,k = xb,+1) = 1{xτ ≥ k} = 1 − 1{xτ < k},
D(pτ,k = xa,−1) = 1{xτ ≤ k} = 1 − 1{xτ > k}
(107)
We compute the transform of the payoff function in (96) for digital call as follows
b uc
(ϕ) = e−ϕx
Z ∞
−∞
eϕx′
Uc
(x′
)dx′
= e−ϕx
Z ∞
xb
exp

ϕx′
dx′
= −e−ϕx 1
ϕ
exp{ϕxb} (108)
where the integral converges if ϕr < 0.
We compute the transform of the payoff function in (96) for digital put as follows
b up
(ϕ) = e−ϕx
Z ∞
−∞
eϕx′
Up
(x′
)dx′
= e−ϕx
Z xa
−∞
exp

ϕx′
dx′
= e−ϕx 1
ϕ
exp{ϕxa} (109)
where the integral converges if ϕr > 0.
We note that using (107), we can evaluate digital put as
D(pτ,k = xa,ω = −1) = 1 − D(pτ,k = xa,ω = +1) (110)
so that we can use call transform in Eq (108) to evaluate both call and put digital with ϕr < 0.
Square root payoff
We evaluate the value function in Eq (95) corresponding to the square root payoff in Eq (73)
as follows
U1/2(τ,pt) = e−rτ√
ptE[u(x)] (111)
where
u(x) = exp

1
2
x

1{xa < xτ < xb} (112)
and xa = ln(pa/pt) and xb = ln(pb/pt).
We compute the transform of the payoff function in (96) as follows
b u(ϕ) = e−ϕx
Z ∞
−∞
eϕx′
u(x′
)dx′
= e−ϕx
Z xb
xa
exp

ϕ +
1
2

x′

dx′
= e−ϕx 1
ϕ + 1
2


exp

ϕ +
1
2

xb

− exp

ϕ +
1
2

xa

(113)
where the integral converges for ϕr ∈ R. For xb → ∞ we set ϕr < 0, and for xa → −∞ we set
ϕr > 0.
225.5 Application of Log-normal SV Model
We apply the log-normal SV model which can handle positive correlation between returns and
volatility observed in price-volatility dynamics of digital assets (see Sepp-Rakhmonov (2023) for
details). We consider price dynamics under the risk-neutral measure Q for the spot price St and
the instantaneous volatility σt as follows
dSt = r(t)Stdt + σtStdW
(0)
t , S0 = S,
dσt = (κ1 + κ2σt)(θ − σt)dt + βσtdW
(0)
t + εσtdW
(1)
t , σ0 = σ
(114)
where W(0), W(1) are uncorrelated Brownian motions, κ1 > 0 and κ2 ≥ 0 are linear and quadratic
mean-reversion rates respectively, θ > 0 is the mean of the volatility, β ∈ R is the volatility beta
which measures the sensitivity of the volatility to changes in the spot price, and ε > 0 is the
volatility of residual volatility.
Sepp-Rakhmonov (2023) find the first-order solution to MGF defined in Eq (93) is given as
follows
G(τ;ϕ) = exp{−ϕx}E[1]
(τ,ϕ), (115)
where E[1] is the exponential-affine function
E[1]
(τ,ϕ) = exp
( 2 X
k=0
A(k)
(τ;ϕ)(σ − θ)k
)
, (116)
where ϑ2 = β2 + ε2 and vector function A(τ) =

A(k)(τ,Φ) , k = 0,1,2, solve the quadratic
differential system as a function of τ:
A(k)
τ = A⊤
M(k)
A +

L(k)
⊤
A + H(k)
, (117)
M(k)
=

  
  




0 0 0
0 θ2ϑ2
2 0
0 0 0



,




0 0 0
0 θϑ2 θ2ϑ2
0 θ2ϑ2 0



,




0 0 0
0 ϑ2
2 2θϑ2
0 2θϑ2 2θ2ϑ2





  
  
,
L(k)
=





0
−θ2βϕ
θ2ϑ2

,


0
−(κ1 + κ2θ) − 2θβϕ
2(θϑ2 − θ2βϕ)

,


0
−βϕ − κ2
ϑ − 2(κ1 + κ2θ) − 4θβϕ





,
H(k)
=

1
2
θ2
ϕ2
+ ϕ

, θ ϕ2
+ ϕ − 2ψ

,
1
2
ϕ2
+ ϕ


,
with the initial condition A(0) = (0, 0, 0)⊤. The second order solution is provided in Theorem
4.6. Sepp-Rakhmonov (2023).
In Subplot (A) of Figure (7)7, we show the implied volatilities of the log-normal SV model for
a range of volatility of residual volatility ε with β = 0. In Subplot (B), we show the premium APR
for IL protection as a function of range multiple for a range of ε. We see that the model-value of IL
protection is is not very sensitive to tails of implied distribution (or, equivalently, to the convexity
of the implied volatility). The reason is that the most of the value of IL protection is derived from
the center of returns distribution.
7
Github project https://github.com/ArturSepp/StochVolModels provides Python code for this computations
using the log-normal SV model.
23Figure 7: (A) BSM volatilities implied by log-normal SV model as function of volatility-of-volatility parame-
ter ε for τ = 14/365; (B) Premiums APR computed using log-normal SV model for borrowed LP as function
of the range multiple m such that pa(m) = e−m
p0 and pb(m) = em
p0. Other model parameters include
σ0 = θ = 0.50, κ1 = 2.21, κ2 = 2.18, β = 0.0.
## 6 Conclusions
We have developed a unified approach for hedging of Impermanent Loss (IL) which arises when
providing liquidity to Automated Market Making (AMM) Pools in blockchain ecosystem. We have
introduced the two ways to create a liquidity provision (LP) including a funded LP (with the long
initial exposure to underlying token) and a borrowed LP (with the zero initial exposure to the
underlying token). We have applied Uniswap V2 and V3 protocols, which are constant function
market maker (CFMM) most commonly employed by most of decentralized exchanges. We have
shown that the IL can be represented with a non-linear function of the current spot price. As a
result, using traditional methods of financial engineering, we can handle the valuation and risk-
management of the IL protection claim which delivers the negative of the IL at a fixed maturity
date.
First, we have derived a static replication approach for the IL arising from a generic constant
function market maker (CFMM) using a portfolio of traded call and put options at a fixed maturity
date. This approach allows for model-free replication of the IL when a liquid options market exists,
which is the case for core digital assets including Bitcoin and Ethereum.
Second, for digital assets without a liquid options market, we have developed a model-based
approach using the decomposition of the IL function into vanilla options, digital options, and an
exotic square root payoff. We have derived a closed-form valuation formula for a wide class of
price dynamics with tractable characteristic and moment generating functions (MGF) by means of
Fourier transform.
Model-based valuation can be employed by a few crypto trading companies that currently sell
over-the-counter IL protection claims. When using model-based dynamics delta-hedging for the
replication of the payoff of the IL protection claim, the profit-and-loss (P&L) of the dynamic delta-
hedging strategy will be primarily driven by the realised variance of the price process. Thus, the
total P&L of a trading desk will be the difference between premiums received (from selling IL
protection claims) and the variance realised through delta-hedging. Trading desk can employ our
results for the analysis of price dynamics and hedging strategies which optimize their total P&L.
For liquidity providers, who buy IL protection claims for their LP position, the total P&L will
be driven by the difference between accrued fees from LP positions and costs of IL protection
claims. The cost of the IL protection claim can be estimated beforehand using either the cost
of static options replicating portfolio or costs of buying IL protection from a trading desk. As a
24result, liquidity providers can focus on selecting DEX pools and liquidity ranges where expected
fees could exceed hedging costs. Thus, liquidity providers can apply our analysis optimal allocation
to LP pools and for creating static replication portfolios using either traded options or assessing
costs quoted by providers of IL protection8.
References
Angeris, G., Kao, H.T., Chiang, R., Noyes, C., Chitra, T., (2019). An analysis of Uniswap markets
Cryptoeconomic Systems Journal
Alexander, C., Chen, D., Imeraj, A. (2023), Crypto quanto and inverse options, Mathematical
Finance 33(4), 1005–1043.
Bergault, P., Bertucci, L., Bouba, D. (2023). Automated market makers: mean-variance analysis
of LPs payoffs and design of pricing functions. Digital Finance, https://doi.org/10.1007/
s42521-023-00101-0
Capponi A., and Jia, R. (2024). Liquidity provision on blockchain-based decentralized exchanges.
Working paper, https://ssrn.com/abstract=3805095
Cartea A., Drissi F., and Monga, M. (2024). Predictable losses of liquidity provision in constant
function markets and concentrated liquidity markets. Applied Mathematical Finance, 30, 69–93
Cartea A., Drissi F., and Monga, M. (2024). Decentralised Finance and Automated Market Making:
Predictable Loss and Optimal Liquidity Provision. Working paper, https://arxiv.org/abs/
2309.08431
P. Carr and D. Madan. (2001). Towards a Theory of Volatility Trading, In: E. Jouini, J. Cvitanic,
M. Musiela, eds. Handbooks in Mathematical Finance: Option Pricing, Interest Rates and Risk
Management, Cambridge University Press 458–476
Adams H., Zinsmeister N., and D. Robinson. (2021). Uniswap V2 Core, White paper https://
uniswap.org/whitepaper.pdf
Adams H., Zinsmeister N., Salem M., Keefer R., and D. Robinson. (2021). Uniswap V3 Core, White
paper https://uniswap.org/whitepaper-V3.pdf
Deng J., Zong H., and Y. Wang. (2023). Static replication of impermanent loss for concentrated
liquidity provision in decentralised markets, Operations Research Letters 51(3) 206–211
Echenim M., Gobet E., and A.C. Maurice. (2023). Thorough mathematical modelling and analysis
of Uniswap V3, Working paper https://hal.science/hal-04214315V2
Fukasawa M., Maire B., and M. Wunsch. (2023). Weighted variance swaps hedge against imperma-
nent loss, Quantitative Finance 23(6) 901–911
Heimbach L., Schertenleib E., and R. Wattenhofer. (2022). Risks and returns of Uniswap v3 liquidity
providers, Working paper https://arxiv.org/abs/2205.08904
Lehar A., and Parlour C.A. (2024). Decentralized Exchange: The Uniswap Automated Market
Maker, Journal of Finance, forthcoming https://ssrn.com/abstract=3905316
Lewis, A. L. (2000), Option Valuation under Stochastic Volatility, Finance Press.
8
The empirical analysis of the profitability of LP strategies is a hot area in AMM-related literature, see for an
example among others Heimbach et al. (2022), Cartea et al. (2023), Bergault et al. (2023), Cartea et al. (2024), Li et
al. (2023), Li et al. (2024).
25Li T., Naik S., Papanicolaou A., and L. Schoenleber. (2023). Yield farming for liquidity provision,
Working paper https://ssrn.com/abstract=4422213
Li T., Naik S., Papanicolaou A., and L. Schoenleber. (2024). Implied Impermanent Loss: A
Cross-Sectional Analysis of Decentralized Liquidity Pools, Working paper https://ssrn.com/
abstract=4811111
Lipton, A. (2001). Mathematical Methods for Foreign Exchange: A Financial Engineer’s Approach.
World Scientific
Lipton, A. (2018). Financial Engineering: Selected Works of Alexander Lipton. World Scientific
Lipton, A. (2024). Hydrodynamics of Markets: Hidden Links Between Physics and Finance, Cam-
bridge University Press
Lipton, A. and Hardjono T. (2022). Blockchain Intra- and Interoperability, in Babich V, Birge J,
Hilary G (eds), Springer, New York.
Lipton, A. and Sepp A. (2008). Stochastic volatility models and Kelvin waves. J. Phys. A: Math.
Theor. 41, 344012 (23pp)
Lipton, A. and Sepp A. (2022). Automated market-making for fiat currencies, Risk Magazine, May
Lipton A., and A. Treccani, (2021). Distributed Ledgers: Mathematics, Technology, and Economics,
World Scientific, Singapore
Lucic, V. and Sepp, A. (2024), Valuation and Hedging of Cryptocurrency Inverse Options: With
Backtest Simulations using Deribit Options Data, Quantitative Finance, forthcoming https:
//ssrn.com/abstract=4606748
Maire, B. and Wunsch, M. (2024), Market Neutral Liquidity Provision, Preprint
Milionis, J., Moallemi C. C., Roughgarden, T., Lee Zhang, A. (2022), Automated Market Making
and Loss-Versus-Rebalancing, Financial Innovation 8(20) https://api.semanticscholar.org/
CorpusID:251554626
Mohan, V. (2022), Automated market makers and decentralized exchanges: a DeFi primer, Finan-
cial Innovation 8(20) https://doi.org/10.1186/s40854-021-00314-5
Park, A. (2023), The conceptual flaws of decentralized automated market making, Management
Science 69(11) 6731–6751. https://doi.org/10.1287/mnsc.2021.02802
Sepp, A. and Rakhmonov, P. (2023) Log-normal Stochastic Volatility Model with Quadratic Drift,
International Journal of Theoretical and Applied Finance 26(08), 2450003, https://doi.org/
10.1142/S0219024924500031
26Appendices
## 6.1 Proof of Proposition 3.3
Proof. Using Eq(4) with Eq(33) for pt ∈ (pa,pb):
P&Lfunded
= (ptxt + yt) − (p0x0 + y0)
= L

pt

1
√
pt
−
1
√
pb

+ (
√
pt −
√
pa)

− L

p0

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

√
pt −
pt
√
pb

+ (
√
pt −
√
pa) −

√
p0 −
p0
√
pb

− (
√
p0 −
√
pa)

= L

√
pt −
pt
√
pb

+
√
pt −

√
p0 −
p0
√
pb

−
√
p0

= L

2(
√
pt −
√
p0) +
p0 − pt
√
pb

(118)
For pt ≤ pa, using (34):
P&Lfunded
= (ptxt + yt) − (p0x0 + y0)
= L

pt

1
√
pa
−
1
√
pb

+ 0

−

p0

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

pt

1
√
pa
−
1
√
pb

−

p0

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

pt

1
√
pa
−
1
√
pb

+
p0
√
pb
− 2
√
p0 +
√
pa

(119)
For pt ≥ pb, using Eq (35):
P&Lfunded
= (ptxt + yt) − (p0x0 + y0)
= L

(0 + (
√
pb −
√
pa)) −

p0

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

(
√
pb −
√
pa) −

p0

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

(
√
pb −
√
pa) +
p0
√
pb
− 2
√
p0 +
√
pa

= L

√
pb +
p0
√
pb
− 2
√
p0

(120)
276.2 Proof to Proposition 3.4
Proposition 3.4. Using Eq(7) with Eq(33) for p ∈ (pa,pb):
P&Lborrowed
= (ptxt + yt) − (ptx0 + y0)
= L

pt

1
√
pt
−
1
√
pb

+ (
√
pt −
√
pa)

−

pt

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

pt

1
√
pt
−
1
√
p0

+ (
√
pt −
√
p0)

= L

pt
√
p0 −
√
pt
√
p0
√
pt

+ (
√
pt −
√
p0)

= L
√
p0pt − pt
√
p0
+ (
√
pt −
√
p0)

= L

2
√
p0pt − pt − p0
√
p0

= −
L
√
p0
(
√
pt −
√
p0)2
= −L
√
p0
r
pt
p0
− 1
2
(121)
For p ≤ pa, using (34):
P&Lborrowed
= (ptxt + yt) − (ptx0 + y0)
= L

pt

1
√
pa
−
1
√
pb

+ 0

−

pt

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

pt

1
√
pa
−
1
√
p0

− (
√
p0 −
√
pa)

(122)
For p ≥ pb, using Eq (35):
P&Lborrowed
= (ptxt + yt) − (ptx0 + y0)
= L

(0 + (
√
pb −
√
pa)) −

pt

1
√
p0
−
1
√
pb

+ (
√
p0 −
√
pa)

= L

(
√
pb −
√
p0) − pt

1
√
p0
−
1
√
pb

(123)
## 6.3 Proof to Proposition 3.5
Proof. We apply P&L of Funded LP in Eq (41) as follows.
P&L funded(y)
(pt) =

  
  
2
√
pt −
√
p0

+ p0−pt √
pb
pt ∈ (pa,pb)
pt

1 √
pa
− 1 √
pb

+ p0 √
pb
− 2
√
p0 +
√
pa pt ≤ pa
√
pb + p0 √
pb
− 2
√
p0 pt ≥ pb
(124)
We consider the range part in the interval pt ∈ (pa,pb) as follows.
Range(pt) = 2(
√
pt −
√
p0) +
p0 − pt
√
pb
= −
pt
√
pb
+ 2
√
pt +

p0
√
pb
− 2
√
p0
 (125)
28We extend the range part to the interval pt ∈ (0,+∞) as follows
Range(pt) ≡ −
1
√
pb
u1(pt) + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

u0(pt) (126)
where
u1(pt) = pt1{pa < pt < pb}
u1/2(pt) =
√
pt1{pa < pt < pb}
u0(pt) = 1{pa < pt < pb}
(127)
are extended on pt ∈ (0,+∞) with zero values outside pt ∈ (pa,pb).
It is clear that u1(pt) can be decomposed on pt ∈ (0,∞) as a collar option position along with
put and call digital:
u1(pt) = pt + max{pa − pt,0} − max{pt − pb,0} − pa1{pt ≤ pa} − pb1{pt ≥ pb} (128)
We evaluate u0(pt) term as follows
u0(pt) = 1 − 1{pt ≥ pb} − 1{pt ≤ pa} (129)
Then u1/2(pt) is the only non-linear claim which needs model valuation
u1/2(pt) =
√
pt1{pa < pt < pb} (130)
Thus the range part on pt ∈ (0,∞) becomes
Range(pt) ≡ −
1
√
pb
u1(pt) + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

u0(pt)
= −
1
√
pb
[pt + max{pa − pt,0} − max{pt − pb,0} − pa1{pt ≤ pa} − pb1{pt ≥ pb}] + 2u1/2(pt)
+

p0
√
pb
− 2
√
p0

[1 − 1{pt ≥ pb} − 1{pt ≤ pa}]
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−
1
√
pb
max{pa − pt,0} +
1
√
pb
max{pt − pb,0} +
1
√
pb
pa1{pt ≤ pa} +
√
pb1{pt ≥ pb}
−

p0
√
pb
− 2
√
p0

[1{pt ≥ pb} + 1{pt ≤ pa}]
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−
1
√
pb
max{pa − pt,0} +
1
√
pb
max{pt − pb,0}
+

1
√
pb
pa −

p0
√
pb
− 2
√
p0

1{pt ≤ pa} +

√
pb −

p0
√
pb
− 2
√
p0

1{pt ≥ pb}
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−
1
√
pb
max{pa − pt,0} +
1
√
pb
max{pt − pb,0}
+

pa − p0
√
pb
+ 2
√
p0

1{pt ≤ pa} +

pb − p0
√
pb
+ 2
√
p0

1{pt ≥ pb}
(131)
29Next we evaluate the put side for pt ≤ pa:
Put(pt) = pt

1
√
pa
−
1
√
pb

+
p0
√
pb
− 2
√
p0 +
√
pa
=
√
pb −
√
pa
√
pa
√
pb

(pt ± pa) +

p0
√
pb
− 2
√
p0 +
√
pa

=
√
pb −
√
pa
√
pa
√
pb

(−{pa − pt} + pa) +

p0
√
pb
− 2
√
p0 +
√
pa

= −
√
pb −
√
pa
√
pa
√
pb

{pa − pt} +
√
pb −
√
pa
√
pa
√
pb

pa +

p0
√
pb
− 2
√
p0 +
√
pa

= −
√
pb −
√
pa
√
pa
√
pb

{pa − pt} +
√
pb
√
pa − pa
√
pb
+
p0 − 2
√
p0
√
pb +
√
pb
√
pa
√
pb
= −
√
pb −
√
pa
√
pa
√
pb

{pa − pt} +
(p0 − pa) − 2
√
p0
√
pb + 2
√
pb
√
pa
√
pb
= −
√
pb −
√
pa
√
pa
√
pb

{pa − pt} +
p0 − pa
√
pb
− 2(
√
p0 −
√
pa)
(132)
We further extend the last expression on pt ∈ (0,+∞)
Put(pt) = −
√
pb −
√
pa
√
pa
√
pb

max{pa − pt,0} +

p0 − pa
√
pb
− 2(
√
p0 −
√
pa)

1{pt ≤ pa} (133)
Next we extend the call side for pt ∈ (0,+∞) as follows
Call(pt) =

√
pb +
p0
√
pb
− 2
√
p0

1{pt ≥ pb} (134)
Finally we sum up the three parts on pt ∈ (0,+∞) as
Range(pt) + Put(pt) + Call(pt)
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−
1
√
pb
max{pa − pt,0} +
1
√
pb
max{pt − pb,0}
+

pa − p0
√
pb
+ 2
√
p0

1{pt ≤ pa} +

pb − p0
√
pb
+ 2
√
p0

1{pt ≥ pb}
−
√
pb −
√
pa
√
pa
√
pb

max{pa − pt,0} +

p0 − pa
√
pb
− 2(
√
p0 −
√
pa)

1{pt ≤ pa}
+

√
pb +
p0
√
pb
− 2
√
p0

1{pt ≥ pb}
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−

1
√
pb
+
√
pb −
√
pa
√
pa
√
pb

max{pa − pt,0} +
1
√
pb
max{pt − pb,0}
+

pa − p0
√
pb
+ 2
√
p0 +
p0 − pa
√
pb
− 2(
√
p0 −
√
pa)

1{pt ≤ pa}
+

pb − p0
√
pb
+ 2
√
p0 +
√
pb +
p0
√
pb
− 2
√
p0

1{pt ≥ pb}
= −
1
√
pb
pt + 2u1/2(pt) +

p0
√
pb
− 2
√
p0

−
1
√
pa
max{pa − pt,0} +
1
√
pb
max{pt − pb,0} + 2
√
pa1{pt ≤ pa} + 2
√
pb1{pt ≥ pb}
(135)
306.4 Proof of Proposition 6.4
Proof. Using P&L of borrowed LP in Eq (45) we obtain the following.
P&L borrowed(y)
(pt) =

   
   
−
√
p0
q
pt
p0
− 1
2
pt ∈ (pa,pb)
pt

1 √
pa
− 1 √
p0

−
√
p0 −
√
pa

pt ≤ pa
√
pb −
√
p0

− pt

1 √
p0
− 1 √
pb

pt ≥ pb
(136)
where L = 1
We split the payoff in the three parts.
The range part we evaluate for pt ∈ (pa,pb) as follows
Range(pt) = −
√
p0

pt
p0
− 2
r
pt
p0
+ 1

≡

1
√
p0
u1(pt) − 2u1/2(pt) +
√
p0u0(pt)
 (137)
It is clear that the first term can be decomposed for pt ∈ (0,∞) as a collar option position :
u1(pt) = pt + max{pa − pt,0} − max{pt − pb,0} − pa1{pt ≤ pa} − pb1{pt ≥ pb} (138)
where 1{x} is the indicator function.
We evaluate u0(pt) term is as follows:
u0(pt) = 1 − 1{pt ≥ pb} − 1{pt ≤ pa} (139)
Then u1/2(pt) is the only non-linear claim which needs model valuation
u1/2(pt) =
√
pt1{pa < pt < pb} (140)
We evaluate the put side for pt ≤ pa as follows
Put(pt) = (
√
p0 −
√
pa) − pt
√
p0 −
√
pa
√
p0pa

=
√
p0 −
√
pa
√
p0pa

[±pa +
√
p0pa − pt]
=
√
p0 −
√
pa
√
p0pa

[(pa − pt) + (
√
p0pa − pa)]
=
√
p0 −
√
pa
√
p0pa
[pa − pt] +
√
p0 −
√
pa
√
p0pa
(
√
p0pa − pa)
=
√
p0 −
√
pa
√
p0pa
[pa − pt] +
√
p0 −
√
pa
2
√
p0
(141)
As a result, the payoff on the put side can be written for pt ∈ (0,∞) as follows
Put(pt) =
√
p0 −
√
pa
√
p0pa
max{pa − pt,0} +
√
p0 −
√
pa
2
√
p0
1{pt ≤ pa} (142)
31Second, we evaluate the call side for pt ≥ pb as follows
Call(pt) = pt
√
pb −
√
p0
√
p0pb

− (
√
pb −
√
p0)
=
√
pb −
√
p0
√
p0pb

[pt −
√
p0pb ± pb]
=
√
pb −
√
p0
√
p0pb

[pt − pb] +
√
pb −
√
p0
√
p0pb

[pb −
√
p0pb]
=
√
pb −
√
p0
√
p0pb

[pt − pb] +
√
pb −
√
p0
2
√
p0
(143)
As a result, the payoff on the call side can be written for pt ∈ (0,∞) as follows
Call(pt) =
√
pb −
√
p0
√
p0pb

max{pt − pb,0} +
√
pb −
√
p0
2
√
p0
1{pt ≥ pb} (144)
Summing all together:
Range(pt) + Put(pt) + Call(pt)
= −2u1/2(pt) +
1
√
p0
[pt + max{pa − pt,0} − max{pt − pb,0} − pa1{pt ≤ pa} − pb1{pt ≥ pb}]
+
√
p0 [1 − 1{pt ≥ pb} − 1{pt ≤ pa}]
+
√
p0 −
√
pa
√
p0pa
max{pa − pt,0} +
√
p0 −
√
pa
2
√
p0
1{pt ≤ pa}
+
√
pb −
√
p0
√
p0pb

max{pt − pb,0} +
√
pb −
√
p0
2
√
p0
1{pt ≥ pb}
= −2u1/2(pt) +
1
√
p0
pt +
√
p0
+
√
p0 −
√
pa
√
p0pa
+
1
√
p0

max{pa − pt,0}
+
√
pb −
√
p0
√
p0pb
−
1
√
p0

max{pt − pb,0}
+
" √
p0 −
√
pa
2
√
p0
−
pa
√
p0
−
√
p0
#
1{pt ≤ pa}
+
" √
pb −
√
p0
2
√
p0
−
pb
√
p0
−
√
p0
#
1{pt ≥ pb}
= −2r1(pt) +
1
√
p0
pt +
√
p0
+
1
√
pa
max{pa − pt,0}
−
1
√
pb
max{pt − pb,0}
− 2
√
pa1{pt ≤ pa}
− 2
√
pb1{pt ≥ pb}
(145)
The final result follows by collecting payoffs of vanilla puts and calls and digitals.
326.5 Proof to Proposition 4.1
Proof. For the put side, it is clear that
Π(K) =
N X
n=1
wnPn(K) =
N X
n=1
wn max(Kn − K,0) (146)
We define the first-order derivatives at discrete strike points as follows:
δIL(Kn) =
IL(Kn) − IL(Kn−1)
Kn − Kn−1
δΠ(Kn) =
Π(Kn) − Π(Kn−1)
Kn − Kn−1
(147)
In particular for Kn ∈ K:
Π(Kn) =
N X
n′≥n
wn′Pn′(Kn) =
N X
n′≥n
wn′ (Kn′ − Kn)
Π(Kn−1) =
N X
n′≥n−1
wn′ (Kn′ − Kn−1) = wn−1 (Kn−1 − Kn−1) +
N X
n′≥n
wn′ (Kn′ − Kn−1) =
N X
n′≥n
wn′ (Kn′ − Kn−1)
(148)
As a result:
δΠ(Kn) =
1
Kn − Kn−1
(Π(Kn) − Π(Kn−1))
=
1
Kn − Kn−1


N X
n′≥n
wn′ (Kn′ − Kn) −
N X
n′≥n
wn′ (Kn′ − Kn−1)


= −
N X
n′≥n
wn′
(149)
and
δΠ(Kn) − δΠ(Kn−1) = −wn−1 (150)
By piece-wise approximation over the interval x ∈ (Kn−1 − Kn):
δIL(x) = δL(Kn) −
Kn − x
Kn − Kn−1
(δIL(Kn) − δIL(Kn−1)) (151)
and
δΠ(x) = δΠ(Kn) −
Kn − x
Kn − Kn−1
(δΠ(Kn) − δΠ(Kn−1))
= δΠ(Kn) −
x − Kn
Kn−1 − Kn
(−wn−1)
(152)
The proof for the call side follows by analogy.
336.6 Proof of Proposition 5.2
Proof. We use Eq (71) as follows
Ufunded
(t,pt) = −e−r(T−t)
EQ
h
ufunded
0 (xt + xτ) + u1/2(xt + xτ) + u1(xt + xτ)
i
,
Uborrowed
(t,pt) = −e−r(T−t)
EQ
h
uborrowed
0 (xt + xτ) + u1/2(xt + xτ) + u1(xt + xτ)
i
,
(153)
The square payoff in Eq (73) is computed using:
U1/2(t,pt) = e−r(T−t)
EQ
hp
p0ext+xτ 1{xa < xt + xτ < xb}
i
= e−r(T−t)√
pt
Z ∞
−∞
exp

1
2

µ −
1
2
σ2

τ +
1
2
σ
√
τx

1{xa − xt < x < pb − xt}n(x)dx
= e−r(T−t)√
pt
Z −d−(pt,pb)
−d−(pt,pa)
exp

1
2

µ −
1
2
σ2

τ +
1
2
σ
√
τx

n(x)dx
= e−r(T−t)√
pt exp

1
2

µ −
1
2
σ2

τ
Z −d−(pt,pb)
−d−(pt,pa)
exp

1
2
σ
√
τx

n(x)dx
= e−r(T−t)√
pt exp

1
2

µ −
1
2
σ2

τ

(m(−d−(pt,pb)) − m(−d−(pt,pa)))
= e−r(T−t)√
pt exp

1
2
µτ −
1
8
σ2
τ

N

ln(pb/pt) − (r − q)τ
σ
√
τ

− N

ln(pa/pt) − (r − q)τ
σ
√
τ

(154)
where n is normal pdf and
m(x) = exp

1
8
σ2
τ

N(x −
1
2
σ
√
τ) (155)
The option part is computed using the option pricing formulas for BSM model.
## 6.7 Carr-Madan representation
In Carr-Madan (2001) a representation of an arbitrary, twice-differentiable function (payoff) in
terms of put and call payoffs was given. Here we derive the same representation relaxing the
smoothness assumption, only requiring that its first derivative possesses the generalized derivative
everywhere.
To this end, assume that f : R 7→ R, is such that f′ has generalized derivative at every point,
and fix arbitrary S, F ≥ 0. Then we have
f(S) = f(F) + I{S>F}
Z S
F
f′
(u)du − I{S<F}
Z F
S
f′
(u)du
= f(F) + I{S>F}
Z S
F

f′
(F) +
Z u
F
f′′
(v)dv

du − I{S<F}
Z F
S

f′
(F) −
Z F
u
f′′
(v)dv

du
= f(F) + f′
(F)(S − F) + I{S>F}
Z S
F
Z u
F
f′′
(v)dv du + I{S<F}
Z F
S
Z F
u
f′′
(v)dv du
= f(F) + f′
(F)(S − F) +
Z S
F
f′′+
dv +
Z F
0
f′′+
dv, (156)
where in the last step we used Fubini’s theorem. (Note that the upper limit in the first integral in
(156) can be replaced by infinity.)
34