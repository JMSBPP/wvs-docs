---
sha256: 979f45f71e0b2f945c578b6364b1aa1ee1ec4a29ac7df203079809956f15796b
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 31648
---
arXiv:2205.12043v2 [q-fin.GN] 2 Mar 2023
Static Replication of Impermanent Loss for Concentrated Liquidity Provision in
Decentralised Markets
Jun Denga
, Hua Zongb
, Yun Wangc
aCorresponding author. School of Finance, University of International Business and Economics, Beijing, China. Email: jundeng@uibe.edu.cn.
b School of Finance, University of International Business and Economics, Beijing, China. Email: 202000210049@uibe.edu.cn
c
School of Finance, University of International Business and Economics, Beijing, China. Email: ywang@uibe.edu.cn
Abstract
This article analytically characterizes the impermanent loss of concentrated liquidity provision for automatic market makers in
decentralised markets such as Uniswap. We propose two static replication formulas for the impermanent loss by a combination of
Europeancalls or puts with strike prices supportedon the liquidity provisionprice interval. It facilitates liquidity providersto hedge
impermanentloss by trading crypto options in more liquid centralised exchanges such as Deribit. Numerical examples illustrate the
astonishing accuracy of the static replication.
Keywords: Decentralised Market, Automatic Market Making, Uniswap, Impermanent Loss
1. Introduction
Decentralised exchanges (DEXs) like Uniswap and
Sushiswap facilitate traders to swap tokens in the listed
liquidity pools by the architecture of automatic market making
(AMM) without the intermediary centralised institutions.
These exchanges utilize open-source protocols for providing
liquidity and trading crypto tokens and all trades are recorded
on Ethereum blockchain. The protocol is non-upgradable and
designed to be censorship resistant without know-your-custom
rule (KYC).Insteadofusinglimited orderbookas intraditional
centralised financial markets that would induce extreme costly
gas fee by miners to verify transactions on blockchain, most
DEXs such as Uniswap and Sushiswap use constant product
function automated market making protocol1
. In this paper,
we would treat the dominant decentralised exchange, Uniswap
that initiates its first version protocol in November 2018. The
Uniswap market lists over 400 tokens and 900 token pairs. The
daily average trading volume exceeds 2 billion USD in 2022
where the most traded pair USDC/ETH consists of almost 50%
share of total volume, followed by USDT/ETH around 10%
volume.
The constant product function automated market making
protocol on Uniswap (see the v2 whitepaper Adams et al. [1])
allows traders to add, remove and swap tokens in the pool that
could host any pair of tokens (TX,TY). The token TY (such as
stablecoin USDC) is treated as the unit of account, i.e. the
numeraire, and TX is taken as the more volatile token such as
ETH which is the native cryptocurrency on the Ethereum. For
1Gas fee is paid to miners for validating transactions on the Ethereum
blockchain to compensate their computational resources. Gas fee is often de-
nominated in ‘Gwei’, which is a unit of measure for the Ethereum’s native
currency, Ether (ETH) (1 Gwei = 10−9 ETH).
a pool with reserves (X,Y) of tokens (TX,TY), to endogenously
determine the pool price, the pool tracks the constant product
‘bonding’ reserve curve X · Y = L2
. The constant L, called the
liquidity, is set at the inception and remains unchanged across
trades.
To exchange ∆X amount of token TX for ∆Y quantity of
token TY, the trader must stay on the ‘bonding’ curve, i.e.,
(X + ∆X) · (Y − ∆Y) = L2
= XY. This means the trader could
deposit ∆X number of token TX to swap ∆Y = Y ·∆X/(X +∆X)
token TY out from the pool. The product of new reserves
X
′
= X+∆X and Y
′
= Y−∆Y remains the constant X
′
·Y
′
= L2
.
To compensatethe risk, such as impermanentloss, taken by liq-
uidity providers, the protocol would charge a swap fee γ · ∆X
in terms of token sending in. The fee rate γ is initiated and un-
changeable when the pool is created, e.g. 0.1%,0.05%,0.03%
and 0.01% on Uniswap. The constant product ‘bonding’ curve
endogenously yields a relative price in the pool. In this arti-
cle, the pool price of token TX is denominated in token TY as
P = Y/X.2
In such a way, the reserves are X = L/
√
P and
Y = L
√
P. A liquidityprovidercouldadd(remove)∆L liquidity
to the existing pool by depositing (redeeming) ∆X = ∆L/
√
P
numberof token TX and ∆Y = ∆L
√
P of token TY. The liquidity
provision is supplied at the current price P and does not alter
the pool price.
The first and second protocol versions of Uniswap are crit-
icized by low capital efficiency where liquidity provisions are
dispersed on the price range (0,∞) and only a small fraction of
total reserves is utilized during swap. Each liquidity provider
only earns a small fraction fee proportional to her share in the
pool. To promote capital efficiency through elimination of un-
used collateral, the Uniswap v3 protocol was launched on the
2The Uniswap protocol always tracks liquidity L and price P instead of
reserves X and Y.
Preprint submitted to Operations Research Letters March 3, 2023Ethereum mainnet on May 2021 with the groundbreakinginno-
vative feature of concentrated liquidity provision where liquid-
ity providers could specify the price interval [Pl,Pu] that they
are willing to supply liquidity, see the whitepaper Adams et al.
[2]. This resembles limit order instead of market order in pre-
vious less-efficient v2 protocol. The ‘bonding’ curve is shifted
as

X + L/
√
Pl

·

Y + L
√
Pu

= L2
. The details are given in the
next section.
The liquidity provider is exposed to impermanent loss that
is only realized until depleting liquidity and withdrawing the
tokens from the pool. This loss is typically calculated as the
difference of her supplied token pair value in the liquidity pool
and the value of simply holding the tokens statically when en-
tering the pool. Since traders always exchange less valuable
token for more valuable one, liquidity providers always suffer
impermanent loss (IL) that could be significant. Loesch et al.
[14] estimate from May to Sep. 2021 the total IL is roughly
$260.1million USD and 49.5% of liquidity providerswith neg-
ative returns in Uniswap v3 market.
In this paper, we propose a static hedge strategy for liquidity
providers using standard European options to eliminate the im-
pact of IL. First, we show that liquidity providers equivalently
long and short different call and put options by liquidity provi-
sion and explicitly characterize the impermanentloss as a com-
binationof severalcalls and puts with differentstrike prices and
underlying driving processes. Second, we propose two static
replication formulas that facilitate liquidity providers to hedge
the impermanent loss risk by taking long positions of standard
European call or put options in these centralised options mar-
ket such as Deribit3
. At last, we numerically verify the static
replication accuracy that would reduce liquidity providers’ im-
permanent loss risk tremendously.
We contribute to the continually growing body of literature
on decentralised exchanges in several ways. For classical mar-
ket making, we refer to the seminal works of [4], [17] and [12],
to name a few. Angeris et al. [5] analyze no-arbitrage bound-
aries and price stability in Uniswap market. [15] show that
the equilibrium utility in a decentralized market can be strictly
higher than in a centralized market and Lehar and Parlour [13]
propose an equilibrium model and give conditions under which
the automatic market making (AMM) dominates a limit order
market andCapponiandJia [7] studythe marketmicrostructure
of AMM. Anotherstrandis to address the optimalliquiditypro-
vision in Uniswap market, see [6], [3] and [16]. However, they
only focus on Uniswap v2 protocoleither without the featureof
concentrated liquidity provision or incorporating the imperma-
nent loss. One exception is Loesch et al. [14] that empirically
calculate the impermanent loss (IL) in Uniswap v3 market us-
ing the on-chain data. Our paper is more related to Clark [10]
that studies static replication in Uniswap v2 market. To the best
of ourknowledge,weare thefirst to characterizetheoption-like
structure of IL that is bothsuffered fromdelta, vegaand gamma
exposures in Uniswap v3 market. Second, from methodologi-
cal perspective, we propose a static option replication formula
3Deribit is the largest centralised Bitcoin and ETHoptions exchanges. More
information could be found at www.deribit.com.
for squared-rootprice process that is further tailored to develop
our replication formulas for the impermanent loss. It facilitates
liquidity providers to hedge permanent loss by trading crypto
options in more liquid centralised exchanges such as Deribit.
The rest of the paper is structuredas follows. Section 2 intro-
duces the concentrated liquidity provision protocol. In Section
3, we characterize the impermanent loss and present the static
replication formulas. Section 4 demonstrates the static hedge
replication accuracy and Section 5 concludes.
2. Concentrated Liquidity Provision
The constant product function protocol of Uniswap v2 fa-
cilitates token swapers and liquidity providers to interact with
the pool automatically without any financial intermediaries,
although suffering low capital efficiency. The Uniswap v3,
launched on the Ethereum mainnet on May 2021, has popular-
ized the innovative feature of concentrated liquidity provision.
This increases the capital efficiency tremendously, up to 4000x
relative to v2, at the sacrifice of higher leverage and imperma-
nent loss.
When supplying liquidity, the liquidity provider specifies a
lower price Pl and a upper price Pu and she earns transaction
fees paid by swapers whenever the price remains in the interval
[Pl,Pu]. When the price moves out of the range [Pl,Pu], the
position is inactive and she no longer earns any fee. Until the
price re-enters into the interval, her position is activated again.
Specifically, the ‘bonding’curve of tokens TX and TY satisfy the
shifted constant product function

X + L/
p
Pl

·

Y + L
p
Pu

= L2
.
The amount L/
√
Pl and L
√
Pu are the virtual token reserves
which are not tradable. Depending on the location of supported
price interval [Pl,Pu] relative to the current price P0, to supply
∆L liquidity, the liquidity provider’s deposits ∆X and ∆Y of
tokens TX and TY are
∆X =

      
      
∆L

1 √
Pl
− 1 √
Pu

, if P0 < Pl,
∆L

1 √
P0
− 1 √
Pu

, if P0 ∈ [Pl,Pu],
0, if P0 > Pu.
(1)
∆Y =

   
   
0, if P0 < Pl,
∆L(
√
P0 −
√
Pl), if P0 ∈ [Pl,Pu],
∆L(
√
Pu −
√
Pl), if P0 > Pu.
The deposits ∆X and ∆Y could be regarded as the trading vol-
ume that are needed to move price out the supported interval
[Pl,Pu] from the lower boundaryPl and the upper boundaryPu.
The liquidity ∆L is not a tradable asset, only a synonym of to-
ken reserves ∆X and ∆Y. Several important facts follows from
(1).
(i) The liquidity ∆L supplied on the interval [Pl,Pu] could be
treated as uniformly distributed. We only illustrate one
case when Pl ≤ P0 ≤ Pu, where P0 is the current pool
price. That means if we artificially split [Pl,Pu] into two
2sub-intervals [Pl,P0] and [P0,Pu], the liquidity on two in-
tervals are both equal to ∆L. By the supply equations in
(1), we could reformulate it as
∆X = 0 |{z}
∆Xl deposit on [Pl,P0]
+∆L
1
√
P0
−
1
√
Pu
!
| {z }
∆Xr deposit on [P0,Pu]
,
∆Y = ∆L(
p
P0 −
p
Pl)
| {z }
∆Yl deposit on [Pl,P0]
+ 0 |{z}
∆Yr deposit on [P0,Pu]
.
It clearly shows that the provider supplies liquidity ∆L on
the left interval [Pl,P0] with reserves (∆Xl
,∆Yl
) and on
the right interval [P0,Pu] with reserves (∆Xr
,∆Yr
) simul-
taneously.
(ii) The discussion above motivates us considering liquidity
provision only from two sides of the current price P0 that
means we treat the liquidity provision on Pl ≤ P0 ≤ Pu
as two independent and disjoint price bins [Pl,P0] and
[P0,Pu]. In doing so, on the lower price bin [Pl,P0] she
onlysuppliestokenTY with theamountof∆L(
√
P0−
√
Pl),
in the meanwhile, she only deposits token TX with the
amount of ∆L

1 √
P0
− 1 √
Pu

in the upper price bin. The
two price intervals [Pl,P0] and [P0,Pu] resembles the bid-
ask prices of the traditional limit-order-book. This would
greatly simply the analysis of impermanent loss below.
3. Impermanent Loss of Liquidity Provision
The impermanent loss is the possible loss from liquidity
provision, compared to the static strategy where the liquidity
providerholds the correspondingtokens in the pool unchanged.
Due to the change of token pool price, once the provider closes
her position and exits the pool, the impermanent loss would be
realized. Following [3], [11], and [14], we define the imperma-
nent loss (IL) as follows.
Definition 3.1. For a liquidity provision with deposits X0 and
Y0 of tokens TX and TY at initial time 0, the realized imperma-
nent loss (IL) at time t whenremoving theliquidityis the capital
loss if she holds token pair statically at initial time 0 instead.
Specifically, the impermanent loss (IL) is calculated as
IL = Yt − Y0 + (Xt − X0) · Pt.
Here, Xt and Yt are the quantities withdrawn at time t and Pt is
the price of token TX.
The impermanent loss is not defined as the difference be-
tween ‘exit’ value and ‘entry’ value as usual. Here, we take
the same perspective of [3], [11], and [14] and industry prac-
tice that liquidity providers treat impermanent loss as the cost
of buying their initial liquidity deposits back when exiting the
pool. A recent work on other form of arbitrage and losses in
decentralised exchanges (the so-called miner extractable value)
is studied in Capponi et al. [8]. Since token TY is usual some
stable-coin (such as USDC and USDT) with value pegged to 1
USD, we always consider the realized impermanentloss (IL) in
terms of token TY.
From the analysis in Section 2, we could treat each liquidity
provision separately from two sides of the current pool price
P0. Without loss of generality, we assume the liquidity ∆L is
supplied on the right side price interval [Pl,Pu] where P0 ≤
Pl ≤ Pu that resembles the ask prices in limit order book. From
(1), the number of tokens required to establish the position is
∆Y0 = 0, ∆X0 = ∆L
1
√
Pl
−
1
√
Pu
!
.
Now, we track the token holdings when the provider closes her
position where the price changes from P0 to Pt at exiting time
t. We distinguish three possible locations of price Pt.
(i) Pt ∈ [Pl,Pu] : When the price increases and moves into
the price interval [Pl,Pu], the initial reserve ∆X0 is par-
tially converted to less valuable token TY that would in-
duce loss to the liquidity provider. At time t, when exiting,
the quantitiesof tokensTY andTX can be retrievedfromthe
pool are
∆Yt = ∆L(
p
Pt −
p
Pl), ∆Xt = ∆L
1
√
Pt
−
1
√
Pu
!
.
The amount of ∆X0 −∆Xt of token TX is convertedto token
TY that would have been sell more if she does not provide
liquidity. Therefore, the IL denominated in token TY is
IL(1)
= ∆L(
p
Pt −
p
Pl) + ∆L
1
√
Pt
−
1
√
Pl
!
Pt
= ∆L 2
p
Pt −
Pt
√
Pl
−
p
Pl
!
≤ 0.
With the escalatingoftokenTX’s price,the provideris con-
sistently and gradually selling more valuable token TX for
token TY. Therefore, she suffers a loss.
(ii) Pt ≥ Pu : When the price crosses above the upper price
Pu, all token reserve ∆X0 are converted to token TY. The
amount of tokens TY and TX can be retrieved from the pool
at time t are
∆Yt = ∆L(
p
Pu −
p
Pl), ∆Xt = 0.
Therefore, the IL is
IL(2)
= ∆L
p
Pu −
p
Pl −
1
√
Pl
−
1
√
Pu
!
Pt
!
≤ 0
In the meanwhile, the average selling price of token TX is
∆Yt/∆X0 =
√
PuPl, lower than the market price Pt.
(iii) Pt ≤ Pl : When the price stays below the lower boundary
Pl, the quantity of token TX is unchanged and the IL is 0.
Taking together, the aggregated impermanent loss from the
right side price interval ILR
is
ILR
∆L
= 2
p
Pt −
Pt
√
Pl
−
p
Pl
!
1{Pl≤Pt≤Pu} (2)
3+
p
Pu −
p
Pl −
1
√
Pl
−
1
√
Pu
!
Pt
!
1{Pt≥Pu}.
Similar argument to the liquidity provision from the left side
price interval [Sl,Su] (i.e. Sl ≤ Su ≤ P0) leads to
ILL
∆L
= 2
p
Pt −
Pt
√
Su
−
p
Su
!
1{Sl≤Pt≤Su} (3)
+
1
√
Sl
−
1
√
Su
!
Pt −
p
Su +
p
Sl
!
1{Pt≤Sl}.
We call the ratio IL/∆L as unit impermanent loss per liquidity
(UIL). Rearranging (2) and (3) gives the following representa-
tion. 4
Proposition 3.2. The impermanent loss per liquidity (UIL) is
characterized as a combination of short and long positions in
different call options as following.
UILR
= 2
p
Pt −
p
Pl
+
− 2
p
Pt −
p
Pu
+
(4)
−
1
√
Pl
(Pt − Pl)+
+
1
√
Pu
(Pt − Pu)+
,
UILL
= 2
p
Sl −
p
Pt
+
− 2
p
Su −
p
Pt
+
−
1
√
Sl
(Sl − Pt)+
+
1
√
Su
(Su − Pt)+
. (5)
Proposition3.2demonstratestheunitimpermanentloss UILR
(UILL
) is equivalent to hold two types of long call (put) options
with price process Pt and squared root price process
√
Pt and
also two short call (put) positions. The strike prices are either
the lower boundary Pl or the upper boundary Pu. This also
means liquidity providers suffer all standard European option’s
risk such as vega and gamma exposures.
Assuming risk-free rate is zero and Pt obeys geometric
Brownian motion, we have the following corollary.
Corollary3.3. If the price Pt of token TX is drivenby a geomet-
ric Brownianmotionwith volatilityσ, theimpermanentloss per
liquidity UILR
and UILL
are
E[UILR
] = 2
p
P0 exp −
σ2
t
8
!
N(dl + σ
√
t/2) − N(du + σ
√
t/2)

−
p
PlN(dl) +
p
PuN(du)
−
1
√
Pl
P0N(dl + σ
√
t) +
1
√
Pu
P0N(du + σ
√
t),
E[UILL
] = 2
p
P0 exp −
σ2
t
8
!
−N(−ql − σ
√
t/2)
+N(−qu − σ
√
t/2)

+
p
SlN(−ql) −
p
SuN(−qu)
4If we track the impermanent loss by trading volume and there are multiple
liquidity providers with possible overlap provision price intervals, we could
split them to non-overlap ones and investigate impermanent loss separately. We
thank the referee for pointing out this. In this paper, we take the perspective of
tracing price changes that simplifies the exposure.
0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
-8
-6
-4
-2
10-3
0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16
-8
-6
-4
-2
10-3
Figure 1: Impermanent Loss Sensitives
Note. Here, we set ∆L = 1, σ = 0.7. The initial pool price is P0 = 10 and the
liquidity provider supplies on the upper price interval [Pl,Pu] = [11,12] and
lower price interval [Sl,Su] = [8,9] and closes her position after one month,
i.e. t = 30 days.
+
1
√
Sl
P0N(−ql − σ
√
t) −
1
√
Su
P0N(−qu − σ
√
t).
Here, N(·) is the standard normal cumulative distribution func-
tion and
du =
ln(P0/Pu) − σ2
t/2
σ
√
t
, dl =
ln(P0/Pl) − σ2
t/2
σ
√
t
,
qu =
ln(P0/Su) − σ2
t/2
σ
√
t
, ql =
ln(P0/Sl) − σ2
t/2
σ
√
t
.
Figure 1 shows the impermanent loss E[UILR
] and E[UILL
]
are both declining with the increasing of volatility and exiting
time t. It all shows the asymmetric pattern that the right side
liquidity provision E[UILR
] is less sensitive to vega and theta
risk.
3.1. Static Replication of Impermanent Loss
Proposition 3.2 demonstrates the impermanent loss is an
“option-like” instrument that can not be easily hedged by un-
derlying asset and futures. In this section, we statically repli-
cate (or hedge) the impermanent loss by standard European
call or put options. Here, static replication means the liquid-
ity provider could buy a combination of calls or puts at incep-
tion and hold the position statically until removingher liquidity
fromthe pool. This lowers transactionand re-balancingcost for
them. We start with two basic equalities.
Lemma 3.4. The following two equations hold.
√
x −
p
b K
+
=
b K−1
2
2

x − b K
+
−
1
4
Z ∞
b K
K−3
2 (x − K)+
dK,(6)
p
b K −
√
x
+
=
b K−1
2
2

b K − x
+
+
1
4
Z b K
0
K−3
2 (K − x)+
dK.(7)
4Proof. Any twice differentiable function f can be represented
as (see Carr and Madan [9])
f(x) = f(x⋆
) + f
′
(x⋆
)(x − x⋆
) (8)
+
Z x⋆
0
f
′′
(K)(K − x)+
dK +
Z +∞
x⋆
f
′′
(K)(x − K)+
dK.
Applying formula (8) to f(x) =
√
x −
p
b K and choose x⋆
= b K,
we have
√
x −
p
b K =
1
2
b K−1
2

x − b K

−
1
4
Z b K
0
K−3
2 (K − x)+
dK
−
1
4
Z +∞
b K
K−3
2 (x − K)+
dK.
Multiplying 1{x≥b K} in the above equation, it yields (6). Similar
argument leads to (7). This completes the proof.
Proposition 3.5. The impermanent loss per liquidity (UIL) can
be statically replicated by
E[UILR
] = −
1
2
Z Pu
Pl
K−3
2 C(K)dK, (9)
E[UILL
] = −
1
2
Z Su
Sl
K−3
2 P(K)dK. (10)
Here, C(K) and P(K) are European call and put option prices
with maturity t and strike price K.
Especially, when the provider supplies liquidity over (0,∞)
as in Uniswap v2, the total UIL is −1
2
R ∞
P0
K−3
2 C(K)dK −
1
2
R P0
0
K−3
2 P(K)dK.
Proof. Using equations (6) and (4) of Lemma 3.4 and Proposi-
tion 3.2 with x = Pt and b K ∈ {Pl,Pu}, we have
UILR
= 2
p
Pt −
p
Pl
+
− 2
p
Pt −
p
Pu
+
−
1
√
Pl
(Pt − Pl)+
+
1
√
Pu
(Pt − Pu)+
= P
−1
2
l (Pt − Pl)+
−
1
2
Z +∞
Pl
K−3
2 (Pt − K)+
dK
− P
−1
2
u (Pt − Pu)+
+
1
2
Z +∞
Pu
K−3
2 (Pt − K)+
dK
− P
−1
2
l (Pt − Pl)+
+ P
−1
2
u (Pt − Pu)+
= −
1
2
Z Pu
Pl
K−3
2 (Pt − K)+
dK.
Taking expectation under risk-neutral probability gives the first
equation in (9). Similar argument with (5) and (7) gives the
second equality in (10). When the provider supplies liquidity
over (0,∞) as in Uniswap v2, the supported price intervals are
[Pl,Pu] = [P0,+∞] and [Sl,Su] = [0,P0]. This completes the
proof.
First of all, Proposition 3.5 shows the impermanent loss
could be perfectly replicated via a group of call or put options
with strike prices supported in the liquidity provision interval.
This equips liquidity providers the vehicle to hedge the IL by
trading options in the more liquid centralised cyptocurrency
market such as Deribit. Second, the impermanent losses inherit
all option Greeks such as delta, gamma and vega risk factors.
For instance, the delta ∂E[UILR
]/∂P = −1
2
R Pu
Pl
K−3
2 ∆C(K)dK
and ∆C(K) is the call option’s delta at strike price K. Third,
in practice, only limited option strikes are traded in the mar-
ket. Therefore, we use a discrete version of formulae (9) and
(10), i.e. E[UILR
] ≃ −0.5
P
i K−3/2
i C(Ki)∆Ki and E[UILL
] ≃
−0.5
P
i M−3/2
i P(Mi)∆Mi. Here, (Ki) and (Mi) are the partitions
of intervals [Pu, Pl] and [Su, Sl] accordingly. The approxi-
mation would induce discretization errors for the replications
which is evaluated in the following section.
4. Numerical Analysis
4.1. Discretization Errors
In this section, we assume the pool price is driven by the
Heston process
dPt = µPtdt +
√
νtPtdWP
t , dνt = κ(θ − νt)dt + ξ
√
νtdWν
t .
Here, WP
and Wν
are two correlated Brownian motions with
correlation ρ. In the numerical analysis, we assume the initial
pool price P0 = 10 and volatility ν0 = 0.3 and set µ = 0.1
and ρ = −0.3. The mean-reversion speed, volatility level and
volatility-of-volatility are set as κ = 0.4,θ = 0.4 and ξ = 0.15
accordingly. The liquidity provider supplies liquidity in the up-
per price interval [Pl,Pu] = [11,14] and lower price interval
[Sl,Su] = [6,9]andclosesherpositionafteroneweek,i.e. t = 7
days.
First, we use Monte Carlo method to estimate
E[UILR
], E[UILL
] and call and put prices. Second, the
simple trapezoidal numerical integration is utilized to approxi-
mate the integrals in (9) and (10) with 100 different strikes in
the intervals [Pl,Pu] and [Sl,Su]. Table 1 reports the replication
error ratios. It shows in all scenarios the replication formulas
yield highly accurate approximations for both right and left
side impermanent losses if there are enough traded option
strikes. The error ratios are roughly 0.1 base point (0.01%)
for right side impermanent losses and 0.01bp for the left
one. With the increasing of volatility level θ, it also increases
impermanentlosses E[UILR
] and E[UILL
] simultaneously. The
effects of reversion speed κ and volatility-of-volatility ξ are
mixed.
4.2. Replication Error on Deribit Option Market
In this section, we verify the replication accuracy using bit-
coin options traded on Deribit exchange from 1, Jan. 2020 to
31, Dec. 2020. We access the tick-by-tick options data through
Deribit API (application programming interface) which con-
sists of 1,316,050 trades with the annual total volume of 56.7
billion USD.
5Table 1: Static Replication Accuracy for Impermanent Loss per Liquidity
E[UILR
] UILR
Replication Error Ratio
κ = 0.3 -0.424263 -0.424267 1.03E-05
κ = 0.4 -0.420756 -0.420761 1.03E-05
κ = 0.5 -0.439243 -0.439248 1.02E-05
θ = 0.3 -0.411396 -0.411401 1.08E-05
θ = 0.4 -0.460699 -0.460703 1.01E-05
θ = 0.5 -0.501689 -0.501694 9.68E-06
ξ = 0.1 -0.440122 -0.440126 1.02E-05
ξ = 0.15 -0.497540 -0.497545 9.97E-06
ξ = 0.2 -0.467309 -0.467313 1.02E-05
E[UILL
] UILL
Replication Error Ratio
κ = 0.3 -0.177913 -0.177913 1.59E-06
κ = 0.4 -0.186653 -0.186652 1.83E-06
κ = 0.5 -0.192570 -0.192570 1.41E-06
θ = 0.3 -0.150062 -0.150061 1.91E-06
θ = 0.4 -0.185478 -0.185477 1.58E-06
θ = 0.5 -0.217112 -0.217112 7.72E-07
ξ = 0.1 -0.187169 -0.187168 1.72E-06
ξ = 0.15 -0.182929 -0.182929 1.36E-06
ξ = 0.2 -0.184267 -0.184267 1.18E-06
Note. The initial pool price and volatility are P0 = 10 and ν0 = 0.3. Choose
µ = 0.1 and ρ = −0.3. The mean-reversion speed, volatility level and volatility-
of-volatility are set as κ = 0.4,θ = 0.4 and ξ = 0.15. The liquidity provider
supplies liquidity in the upper price interval [Pl,Pu] = [11,14] and lower price
interval [Sl,Su] = [6,9] and closes her position after one month, i.e. t = 7 days.
On each day, we suppose the liquidity provider could ran-
domly enter the Uniswap market and provide liquidity for the
BTC-USDC pool from the right and left sides of current price,
i.e., [P0,u·P0] and [d·P0,P0] and deplete liquidity until time T
(1 or 2 weeks). Here, P0 is the entry bitcoin price and two con-
stantsu > 1andd < 1controltheliquidityprovisionpriceinter-
vals. The impermanent loss when exiting is calculated through
equations (4) and (5).
In the meanwhile, the liquidity provider also longs a combi-
nationof calls (or puts)with strikes in [P0,u·P0] (or[d·P0,P0])
and holds statically to maturityT. The call and put options gain
are calculated via the means of
− 0.5
X
i
K−3/2
i (PT − Ki)+
∆Ki, and,
− 0.5
X
i
M−3/2
i (Mi − PT)+
∆Mi.
Here, PT is the bitcoin price at time T and Ki, Mi are all traded
option strikes.
Table 2 shows several interesting facts: (1) the impermanent
losses UILR
and UILL
both increase with more wider liquidity
provision intervals (larger u and smaller d); (2) the right side
loss UILR
is more severe than left side loss UILL
. The intuition
is the bitcoin price soars from 4,000 to nearly 30,000 in 2020
and right side liquidity provision would be much more risky;
(3) even-though only a few strikes (3, 7, 10) are traded, the
replication errors are reasonable, especially for this particular
volatile markets; (4) we do not observe obvious patterns when
the liquidity provision duration is longer.
Table 2: Static Replication using Deribit Option
T(week) Price Interval E[UILR
] Static #Strikes
1
u = 1.1 -1.588 -0.991 3
u = 1.2 -2.735 -2.294 7
u = 1.3 -3.597 -3.253 10
2
u = 1.1 -1.586 -0.921 3
u = 1.2 -2.726 -2.216 7
u = 1.3 -3.569 -3.157 10
E[UILL
] Static #Strikes
1
d = 0.9 -0.097 -0.066 3
d = 0.8 -0.154 -0.122 7
d = 0.7 -0.182 -0.149 10
2
d = 0.9 -0.101 -0.068 3
d = 0.8 -0.158 -0.124 7
d = 0.7 -0.187 -0.154 10
Note. The liquidity provider provides liquidity for the BTC-USDC pool from
the right and left sides of current price, i.e., [P0,u · P0] and [d · P0, P0] and
deplete liquidity until time T (1 or 2 weeks). The two constants u > 1 and
d < 1 control the liquidity provision price intervals. In the meanwhile, the
liquidity provider also trades Deribit bitcoin options via the static replication
formulae (9) and (10), reported in column “static”. The column “#Strikes” is
the average number of traded option strikes in the provision price intervals.
5. Conclusion
Liquidity providers supply crypto tokens from the right and
left sides of the current price in decentralised markets such as
Uniswap where they are exposed to impermanent loss. We an-
alytically characterize the option-like payoff structures of im-
permanent losses for concentrated liquidity provision and pro-
pose two static replication formulas for the impermanent loss
by a combination of European calls or puts with strike prices
supported on the liquidity provision price interval. Liquidity
providers could hedge their permanent loss by trading options
in more liquid centralised exchanges such as Deribit. The He-
ston stochastic diffusion model illustrates the extreme accuracy
of replication formulas when there are enough traded option
strikes. Further evidences from Deribit bitcoin option market
confirmtheusefulnessandaccuracyofthestatic replicationfor-
mulae.
6References
References
[1] Adams, H., Zinsmeister, N., and Robinson, D. (2020). Uniswap v2 core.
https://uniswap.org/whitepaper.pdf.
[2] Adams, H., Zinsmeister, N., Salem, M., Keefer, R., and Robinson, D.
(2021). Uniswap v3 core. Thttps://startcy.io/whitepaper-v3.pdf.
[3] Aigner, A. A. and Dhaliwal, G. (2021). Uniswap: Impermanent loss and
risk profile of a liquidity provider. arXiv preprint arXiv:2106.14404.
[4] Amihud, Y. and Mendelson, H.(1980). Dealership market: Market-making
with inventory. Journal of financial economics, 8(1):31–53.
[5] Angeris, G., Kao, H.-T., Chiang, R., Noyes, C., and Chitra, T. (2019). An
analysis of uniswap markets. arXiv preprint arXiv:1911.03380.
[6] Aoyagi, J. (2020). Liquidity provision by automated market makers. Avail-
able at SSRN 3674178.
[7] Capponi, A. and Jia, R. (2021). The adoption of blockchain-based decen-
tralized exchanges. arXiv preprint arXiv:2103.08842.
[8] Capponi, A., Jia, R., and Wang, Y. (2022). The evolution of
blockchain: From public to private mempools. Available at SSRN:
https://ssrn.com/abstract=399779.
[9] Carr, P. and Madan, D. (2001). Towards a theory of volatility trading.
Option Pricing, Interest Rates and Risk Management, Handbooks in Math-
ematical Finance, 22(7):458–476.
[10] Clark, J. (2020). The replicating portfolio of a constant product market.
Available at SSRN 3550601.
[11] Heimbach, L., Schertenleib, E., and Wattenhofer, R. (2022). Risks and
returns of uniswap v3 liquidity providers. arXiv preprint arXiv:2205.08904.
[12] Korajczyk, R. A. and Murphy, D. (2019). High-frequency market making
to large institutional trades. The Review of Financial Studies, 32(3):1034–
1067.
[13] Lehar, A. and Parlour, C. A. (2021). Decentralized exchanges. Available
at SSRN: https://ssrn.com/abstract=3905316.
[14] Loesch, S., Hindman, N., Richardson, M. B., and Welch, N. (2021). Im-
permanent loss in uniswap v3. arXiv preprint arXiv:2111.09192.
[15] Malamud, S. and Rostek, M. (2017). Decentralized exchange. American
Economic Review, 107(11):3320–62.
[16] Neuder, M., Rao, R., Moroz, D. J., and Parkes, D. C. (2021). Strategic
liquidity provision in uniswap v3. arXiv preprint arXiv:2106.12033.
[17] O’hara, M. and Oldfield, G. S. (1986). The microeconomics of market
making. Journal of Financial and Quantitative analysis, 21(4):361–376.
7