---
sha256: 01aac3aa820ec7f23ed00a24d7046037f26201989322f99bf716ad0ff37f482c
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 43774
---
Quantitative Finance
ISSN: 1469-7688 (Print) 1469-7696 (Online) Journal homepage: www.tandfonline.com/journals/rquf20
Weighted variance swaps hedge against
impermanent loss
Masaaki Fukasawa, Basile Maire & Marcus Wunsch
To cite this article: Masaaki Fukasawa, Basile Maire & Marcus Wunsch (2023) Weighted
variance swaps hedge against impermanent loss, Quantitative Finance, 23:6, 901-911, DOI:
10.1080/14697688.2023.2202708
To link to this article: https://doi.org/10.1080/14697688.2023.2202708
© 2023 The Author(s). Published by Informa
UK Limited, trading as Taylor & Francis
Group
Published online: 26 May 2023.
Submit your article to this journal
Article views: 5741
View related articles
View Crossmark data
Citing articles: 10 View citing articles
Full Terms & Conditions of access and use can be found at
https://www.tandfonline.com/action/journalInformation?journalCode=rquf20Quantitative Finance, 2023
Vol. 23, No. 6, 901–911, https://doi.org/10.1080/14697688.2023.2202708
© 2023 iStockphoto LP
Weighted variance swaps hedge against
impermanent loss
MASAAKI FUKASAWA†, BASILE MAIRE‡ and MARCUS WUNSCH *§
†Graduate School of Engineering Science, Osaka University, Osaka, Toyonaka, Japan
‡Quantena AG, Zug, Switzerland
§School of Management and Law, Zurich University of Applied Sciences, Zurich, Switzerland
(Received 28 April 2022; accepted 31 March 2023; published online 26 May 2023)
Impermanent Loss in Decentralized Finance can be hedged with
weighted variance swaps
1. Introduction
Decentralized Exchanges (DEXes) allow users to trade in a
fully noncustodial manner. Traders can directly swap their
digital currencies using a smart contract, a program running
on the blockchain, rather than trusting a central counterparty
with their funds. In the early stages, the low throughput of
blockchains required another trading model than the tradi-
tional order book approach, which gave rise to Automated
Market Makers (AMMs). An AMM is a smart contract that
determines the price for which traders can swap their digi-
tal currency against another digital currency. For the trade to
happen, liquidity providers lock digital currencies into a smart
contract, the liquidity pool. The AMM deposits the trader’s
digitalcurrencyintotheliquiditypoolandpaysthetraderwith
the other digital currency from the liquidity pool according
to the price provided by the AMM. This alters the amounts
owned by liquidity providers. In turn, liquidity providers earn
trading fees, cf. Mohan (2022). In a Constant Function Mar-
ket, the AMM determines the price via a so-called trading
function – a function of the liquidity pool’s reserves – so that
the value of the trading function given the post-trade reserves
equals its value given the pre-trade reserves.
Typically, liquidity provision is segregated into pairs of
tokens that can be swapped, e.g. there is one pool for BTC-
USD and another one for ETH-USD for a given AMM.
Hence,wewillfocusontwoassetsinthisarticle.MostAMMs
∗Corresponding author. Email: marcus.wunsch@zhaw.ch
require that liquidity providers deposit the pair subject to
equal value (e.g. when BTC is at 20 000 USD, the ratio of
BTC to USD deposited has to be 1:20 000), so that liquid-
ity providers cannot choose the relative amount of the digital
currency they deposit.
When the exchange rate of the digital currencies moves,
the liquidity provider’s portfolio is subject to price risk. In
fact, neglecting trading fees, liquidity providers are worse
off when the price moves away from the original exchange
rate, compared to the buy-and-hold investor. This loss relative
to the buy-and-hold portfolio is termed Impermanent Loss.
SomeDEXeshavetriedtoaddressthisissuebychangingtheir
AMM design using one of the following two approaches. One
approach is to adjust the AMM pricing formula, see, e.g. Bal-
ancer v2 (2022), which in turn has negative consequences on
slippage. Another approach is to reward liquidity providers
with the protocol token in the hope of mitigating the losses
incurred from liquidity provision, see, e.g. Bancor v3 (2022),
which works out for the liquidity provider as long as the
protocol’s token is valuable enough. To the best of our knowl-
edge, there is no DEX offering a hedge against Impermanent
Loss. However, with the rise of derivatives in DeFi, hedging
Impermanent Loss has become possible.
The success of AMMs is often measured by the value of the
funds locked into the contracts for liquidity provision, termed
Total Value Locked (TVL). At the time of this writing, TVL
in DEXes stood at USD 41bn, while their combined trading
volume in December 2022 was USD 45bn.†
†As retrieved from Defillama on 9 January, 2023
© 2023 The Author(s). Published by Informa UK Limited, trading as Taylor & Francis Group
This is an Open Access article distributed under the terms of the Creative Commons Attribution-NonCommercial-NoDerivatives License (http://creativecommons.org/licenses/
by-nc-nd/4.0/), which permits non-commercial re-use, distribution, and reproduction in any medium, provided the original work is properly cited, and is not altered, transformed,
or built upon in any way. The terms on which this article has been published allow the posting of the Accepted Manuscript in a repository by the author(s) or with their consent.902 Feature
Currently, many platforms charge fixed proportional trans-
action fees that are paid to liquidity providers. We employ
arguments from risk-neutral valuation to determine the fair
price of providing liquidity in a complete market.
1.1. Related literature
Early analyses of Constant Product Markets can be found
in Angeris et al. (2020) and Angeris et al. (2021c). Evans
(2020) discusses the returns of liquidity providers in geo-
metric mean market makers, which generalize the concept
of Constant Product Markets to pools containing several
tokens with dynamic weights. Mohan (2022) provides a
comprehensive and systematic overview of Automated Mar-
ket Makers, and Lipton and Sepp (2021) present an AMM
cross-settlement mechanism for Central Bank Digital Curren-
cies (CBDC). Clark (2020) derives the replicating portfolio
of a Constant Product Market and describes a static hedge
for the dollar-value of liquidity provision. While KPMG
China (2021) claim that Impermanent Loss (synonymously,
Divergence Loss) can be hedged with a long straddle, this
does not apply in general. A general overview of Decentral-
ized Finance can be found in Schär (2021) and Lipton and
Treccani (2021).
There is a rich academic literature on modelling volatility,
cf. Gatheral (2012), Bossu (2004) and the references therein
forageneraloverview,andFukasawa(2014)foranexposition
on (weighted) variance swaps. Connections of Constant Func-
tion Markets with variance swaps were described in Angeris
et al. (2021a, 2021b).
1.2. Outline
We start our analysis with considerations on the risk-neutral
valuation of liquidity provision fees in Constant Product Mar-
kets in Section 2. The close connection between (the hedging
of) Impermanent Loss and variance swaps and gamma swaps
is demonstrated in Section 4. Furthermore, we derive alterna-
tive trading functions that lead to market structures in which
Impermanent Loss can be hedged with a variance swap or
a gamma swap, respectively, see Proposition 6.4. We finally
show in Proposition 6.6 that any concave payoff can be repli-
cated in a Constant Function Market with a suitably defined
trading function.
Throughout the text, we give practical examples that illus-
trate the relevance and consistency of our results with empir-
ical observations.
1.3. Main contributions
This paper contributes to the existing literature by
demonstrating that Impermanent Loss, a key concept for
Decentralized Exchanges, can be hedged with a weighted
variance swap. This allows us to put Impermanent Loss into
context with variance swaps and gamma swaps, which are
central objects of research in volatility modeling and trad-
ing. Moreover, we define a one-parameter family of Constant
Function Markets whose Impermanent Loss can be hedged
with weighted variance swaps.
2. Liquidity provision
We analyze Constant Function Markets, often also called
Constant Function Market Makers (CFMMs). Examples of
Constant Function Markets implementations are Uniswap v2
or Balancer, see Martinelli and Mushegian (2019).
Definition 2.1 Constant Function Markets and Trading Function
Constant Function Markets are a type of automated mar-
ket maker defined by its reserves and its trading function.
The reserves are the tokens available to the smart contract
given by x0 ∈ R+ of the token to be traded and y0 ∈ R+ of
the numéraire token. The trading function maps the pair of
reserves (x,y) ∈ R2
+ and a trade (x,y) ∈ R2
to a scalar:
 : R2
+ × R2
→ R. An admissible CFMM trade (x,y) is
implicitly defined by
((x,y),(x,y)) ≡ ((x,y),(0,0)), (1)
cf. Angeris et al. (2020). That is, if the trader sends x tokens
to the CFMM smart contract, she will receive the amount y
of the other token such that Equation 1 is satisfied.
Constant Product Markets (cf. Angeris and Chitra 2020,
Mohan 2022) are a particular form of Constant Function
Markets.
Definition 2.2 Constant Product Markets A Constant Prod-
uct Market is a Constant Function Market whose trading
function is defined as
((x,y),(x,y)) := (x + x)(y + y). (2)
If the Constant Product Market charges traders transaction
fees, then its trading function takes the form
((x,y),(x,y)) := (x + (1 − τX
)x)(y + (1 − τY
)y),
(3)
where τX
= τ1{x>0}, τY
= τ1{y>0}, and τ ∈ [0,1) is a con-
stant representing transaction fees.
Depending on the implementation of the smart contract for
a particular Constant Product Market, fees can be applied
to the incoming token or the outgoing token, cf. Evans et
al. (2021). The subsequent analysis will focus on Constant
Function Markets without fees; we will return to the subject
of transaction fees in Section 5.
Definition 2.3 Exchange Rate We define the exchange rate
in a Constant Function Market as the no-fee infinitesimal
price
lim
x→0
|y|
|x|
. (4)
In a Constant Product Market, where (x0 + x)(y0 +
y) ≡ x0y0, the infinitesimal exchange rate is given as S0 :=
y0/x0.
2.1. Constant product markets
For Constant Product Markets, we define the constant
L :=
√
x0 y0, (5)Feature 903
where x0 > 0, y0 > 0 denote the initial amounts of token
reserves of the traded tokens in the liquidity pool (LP). Per
definition of a Constant Product Market, L must remain con-
stant throughout, i.e. any transaction (x,y) performed by a
liquiditytakeroccurs according to (x0 + x)(y0 + y) = L2
.
The LP’s initial exchange rate between asset X and asset Y
being S0 = y0/x0, we notice that
x0 =
L
√
S0
, y0 = L

S0. (6)
We assume that there is only one participant in the LP, and that
there are no changes in the amount of liquidity (i.e. there are
no deposits or withdrawals) until the terminal time T. Then,
denoting by xT and yT the amounts of token reserves at T, we
have xTyT = L2
. The exchange rate at T is ST = yT/xT. Now
we can write the value of the liquidity provider’s portfolio in
the absence of fees and other liquidity providers as
VLP(0) = y0 + x0 S0 = 2L

S0 =⇒ VLP(T) = 2L

ST. (7)
2.2. Multiple liquidity providers
So far, we have restricted the setting to a single liquid-
ity provider. We now show that the value of one liquidity
provider’s claim to the pool is independent of other liquidity
providers’ actions (i.e. injections and withdrawals).
In practice, a liquidity provider deposits equivalent
amounts of tokens to the pool and receives ‘pool share
tokens’, so that the amount of pool shares relative to the
total amount of issued pool shares corresponds to the amount
deposited relative to the total pool value. By redeeming
her pool share tokens, the liquidity provider will recover a
commensurate amount of tokens from the liquidity pool.
Proposition 2.1 The value of a liquidity provider’s pool
share is not affected by the entry and exit of other liquidity
providers.
Proof Initially, let us assume that there are two liquidity
providers, A and B. Liquidity provider A contributes her
tokens at time t = 0, while the second liquidity provider, B,
does so at time tB ∈ (0,T).
Let L :=

(xA + xB)(yA + yB) denote the liquidity invari-
ant of the pool combined at time t = tB. In particular, xB,yB
are the reserves deposited by liquidity provider B at the
time of injection, and xA,yA are the reserves of the liquid-
ity pool established earlier by liquidity provider A. Since
injections/withdrawals need to correspond with the pool’s
exchange rate, we have
yB
xB
= StB
=
yA
xA
,
which ensures the continuity of the exchange rate
yA + yB
xA + xB
= StB
=
yB
xB
=
yA
xA
. (8)
From (7), we know that the combined pool’s wealth at time T
equals
VLP(T) = 2L

ST.
On the other hand, the liquidity pool’s share of liquidity
provider B is given by
wB :=
yB
yA + yB
.
Therefore, the value of liquidity provider B’s share in the
combined liquidity pool at time T is
VLP,B(T) = wBVLP(T)
=
yB
yA + yB
2

(xA + xB)(yA + yB)

ST
= 2
yB
√
yA + yB
√
xA + xB

ST
= 2yB

xB
yB

ST
= 2
√
xByB

ST,
the penultimate equality holding by (8). The last expression is
precisely the value of an individual liquidity pool established
separately by B. Similarly, one can show that the value of A’s
share in the combined liquidity pool is not affected by B’s
contribution. This argument can be generalized by induction,
which proves the proposition. 
3. Risk-neutral valuation of liquidity provision
3.1. Binomial model with one period
Let us consider a one-period model with two times, t ∈ {0,T}.
At time T, S can take either of the following two values:
ST = S0 u or ST = S0 d = S0/u (d := 1/u). We define the ran-
dom variable KT := ST/S0. Furthermore, let the risk-free rate
beequaltozero:r = 0.LetVLP(.)denotethewealthoftheliq-
uidity provider in the LP, and let VBH(.) be the corresponding
buy-and-hold strategy (the wealth of a HODLer† ).
The value of the liquidity provider portfolio is given by (7),
while
VBH(T) = y0 + x0 ST = L

S0 + x0 ST = L

S0 (1 + KT).
Next, we show how to construct a portfolio that consists
of liquidity provision VLP(.) and a straddle G, which repli-
cates the buy-and-hold strategy VBH(.). For this purpose, let
V(t) := VLP(t) + Gt. We seek to determine  ∈ R such
that
V(T) = VBH(T),
independently from the realization of S(.) at terminal time T.
Let us derive the value of :
V(T) = VLP(T) + GT = VBH(T)
=⇒ 2L

ST + |ST − S0| = y0 (1 + KT)
†The term ’HODLer’, in the jargon of the crypto community,
describes a crypto investor following a buy-and-hold strategy.
’HODLing’ is the corresponding activity.904 Feature
=⇒  =
y0(1 − 2
√
KT + KT)
S0 |KT − 1|
=
L
√
S0
|1 −
√
KT|2
|1 +
√
KT| |1 −
√
KT|
=⇒  =
|1 −
√
KT|
1 +
√
KT
x0.
It is straightforward to see that the value of  does not depend
on whether there is an upward (KT = u) or a downward jump
(KT = 1/u).
Remark 3.1 Bearing in mind that the liquidity provider
and the HODLer start with the same wealth, i.e. VLP(0) =
VBH(0) = 2L
√
S0, it is evident that the wealth of the former,
no matter the future state of the world, will fall short of the
wealth of the latter. This phenomenon is known as Imper-
manent Loss (or Divergence Loss), usually defined as the
relative performance difference between liquidity provision
and HODLing, i.e.
ˆ IL =
VLP(T) − VBH(T)
VBH(T)
.
For our purposes, however, we specify Impermanent Loss as
IL := IL(T) = VBH(T) − VLP(T). (9)
3.1.1. Numerical example. We assume that y0 = x0 = 100,
so that S0 = 1. Moreover, u = 5/4. At time t = T, there are
two possibilities: ST = Su = 5/4 or ST = Sd = 4/5. The risk-
neutral probabilities are calculated as πu = 4/9,πd = 5/9.
Consequently, the straddle premium, being the sum of the call
premium and the put premium, equals G0 = 2/9.
Then VLP(0) = 2L
√
S0 = 200 and
VLP(T) = 2L

S0 KT ≈

223.6068 if KT = u
178.8854 if KT = 1/u.
The HODLer’s wealth equals the LP’s initially; however,
VBH(T) = L

S0 (1 + KT) =

225 if KT = u
180 if KT = 1/u.
The formula for  yields  ≈ 0.0557, so that the initial value
of the hedged portfolio V(.) is given by
V(0) = VLP(0) +  G0 ≈ 201.2384.
In other words, a rational participant in this LP would expect
to receive no less than  G0 ≈ 1.2384 in fees for providing
liquidity during this period. Otherwise, she would be better
off pursuing a buy-and-hold strategy.
3.2. Continuous model
Let the exchange rate St = yt/xt be a diffusion process. We
define Kt := St/S0,fort ∈ [0,T].Inthe continuous-time limit,
the wealth of the HODler and the liquidity provider equals,
respectively,
VBH(t) = y0 (1 + Kt) (10)
VLP(t) = 2y0

Kt. (11)
We consider a liquidity provider who wishes to hedge against
Impermanent Loss at a finite maturity T < ∞. Her goal
is to compensate the shortfall of providing liquidity versus
HODLing using a European-style contingent claim whose
terminal payoff is
HT := VBH(T) − VLP(T) = y0

1 + KT − 2

KT

= y0

KT − 1
2
.
Let (,F = (Ft)t,P) be a complete probability space. In a
complete market, the fair price of a contingent claim making
up for Impermanent Loss (9) is given by the present value of
the corresponding conditional expected payoff, i.e. for t < T,
H(t) = yt E

KT − 1
2 
Ft
= xt E

ST −

St
2 
Ft (12)
where the expectation is taken under the risk-neutral mea-
sure.† Since investing in the powered power straddle H(.)
guarantees that the Impermanent Loss vanishes at time t = T,
H(t) is a lower bound for the cumulative transaction fees that
a rational liquidity provider should have earned by time t.
Remark 3.2 Note that the payoff of this contingent claim dif-
fers from that of a European ATM straddle: indeed, it is the
sum of an ATM powered power call option with payoff
CT = x0 max

ST −

S0,0
2
and an ATM powered power put option with payoff
PT = x0 max

S0 −

ST,0
2
.
3.2.1. Numerical example (continued). Using the volatility
inferred from the magnitude of an upward jump (u = 5/4) in
our numerical example, u = eσ/
√
t
, we get that σ ≈ 0.2236.
A Monte-Carlo simulation applied to estimate (12) with 1 mil-
lion paths, r = 0, T = 1, S0 = 1 yields the premium H0 ≈
1.2414. The premium calculated with the binomial model,
G0 ≈ 1.2384, is not too far off this mark.
3.3. Dynamic hedging in a Black-Scholes market
Assume that the external market‡ is liquid and that the price
St follows the geometric Brownian motion
dSt
St
= μdt + σ dWt, S0 > 0
†Recall that we assume the risk-free rate to be zero.
‡We refer to the collection of all trading venues (except the LP under
consideration) where the two tokens X, Y can be swapped as the
external market.Feature 905
for μ,σ ∈ R, σ > 0, where W = (Wt)t denotes a one-
dimensional Brownian motion defined on the complete prob-
ability space (,F,P). Note that the bivariate function
p(s,t) = sα
exp −
1
2
α(1 − α)σ2
(T − t)
solves the Black-Scholes PDE
∂p
∂t
+
1
2
σ2
s2 ∂2
p
∂s2
= 0, p(s,T) = sα
for any α ∈ (0,1), cf. Fukasawa (2014). In particular, for α =
1/2,

ST = p(ST,T) = p(S0,0) +
T
0
∂p
∂s
(St,t)dSt
=

S0 e−σ2
T/8
+
T
0
∂p
∂s
(St,t)dSt.
Therefore,
x0

ST −

S0
2
= x0

ST + S0 − 2

STS0

= x0ST + y0 − 2y0e−σ2
T/8
− 2L
T
0
∂p
∂s
(St,t)dSt.
Since y0 = x0S0, this is equivalent to
x0

ST −

S0
2
= 2y0

1 − e−σ2
T/8

+ x0 (ST − S0)
− 2L
T
0
∂p
∂s
(St,t)dSt. (13)
We conclude by noting that, taking expectations under the
risk-neutral measure,
x0 E

ST −

S0
2
= 2y0

1 − e−σ2
T/8

. (14)
This holds because the second and the third term on the right-
hand side of (13) vanish, the latter due to its being a stochastic
integral with respect to a square-integrable martingale.
The amount 2y0(1 − e−σ2
T/8
) ≈ y0σ2
T/4 can serve as a
benchmark for the fair fee for providing liquidity until matu-
rity T even if the external market is illiquid (or does not even
exist).†
3.3.1. Numerical example (continued). Recall from our
previous example that x0 = y0 = 100, T = 1, and σ =
log(u) = log(5/4). Using (13), we find that
2y0

1 − e−σ2
T/8

≈ 1.2410,
whereas
y0
σ2
T
4
≈ 1.2448.
Both figures are very close to the ones found previously with
a Monte-Carlo simulation, and for the binomial model.
†A similar formula was found in Angeris et al. (2021c).
4. Static hedging with weighted variance swaps
4.1. Model-free hedging of impermanent loss
Following Bossu (2004, Problem 3.2), any contingent claim
with a payoff function f(ST) that is twice continuously dif-
ferentiable can be perfectly hedged with (a continuum of)
European calls and puts. The premium of such a contingent
claim is given by
f0 = f(S0) +
S0
0
f (k) p0(k)dk +
∞
S0
f (k) c0(k)dk,
where p0(k), c0(k) denote puts and calls struck at a continuum
of strikes k>0. Due to (12), the payoff reads
f(k) := x0
√
k −

S0
2
=⇒ f (k) = 2
√
k −

S0
 x0
2
√
k
= x0

1 −

S0
k

=⇒ f (k) =
x0
2

S0
k3
.
It follows that Impermanent Loss (9) can be hedged using
vanilla puts and calls:
H0 =
L
2
 S0
0
p0(k)
k3/2
dk +
∞
S0
c0(k)
k3/2
dk . (15)
Remark 4.1 In particular, (15) implies that Impermanent
Loss can be hedged statically and in a model-free manner
purchasing European puts and calls in pre-defined quantities,
cf. Appendix 2 for a computation using actual options data.
In Clark (2020, Section 4), the author derived the replicating
portfolio for the liquidity provider (VLP, in our notation).
Let us write, in the spirit of Fukasawa (2014),
T
0
g(Su)d logS u = fg(ST) − fg(S0) −
T
0
fg(Su)dSu,
(16)
which is a consequence of the Itô-Tanaka-Formula.‡ Here, g
is a locally integrable function, and fg is a function satisfying
fg(x) = 2
x
1
y
1
g(z)
z2
dz.
There are two well-known special cases (cf. Fukasawa 2014
and the references therein).
First, if g(z) ≡ 1, we recover the variance swap, which
is well-known to be hedged statically with a log contract
(cf. Neuberger 1994, Demeterfi et al. 1999, Gatheral 2012):
E[ X T] = −2 E

log

ST
S0

,
where Xt := logKt for all t ∈ [0,T].
‡We use the symbols . to denote quadratic variation.906 Feature
The gamma swap, on the other hand, arises if g(z) = z, so
that
1
S0
E
 T
0
St d log(S) t = 2 E

ST
S0
log
ST
S0
,
the right-hand side of which is also known as ‘entropy
contract’.
Now, if we consider g(z) =
√
z, which yields f√
.(x) =
4(
√
x − 1)2
, then we see that Impermanent Loss can be
hedged using a weighted variance swap, cf. Fukasawa (2014):
E
 T
0

St d log(S) t =
4
√
S0
E

ST −

S0
2
.
If we define the parameterized family of functions
gα(z) = zα
, α ∈ R, (17)
then we can consider the Impermanent Loss hedge (α = 1/2)
to lie between a variance swap (α = 0) and a gamma swap
(α = 1).
Proposition 4.2 In a Constant Product Market, Imperma-
nent Loss (9) can be hedged statically with a weighted
variance swap with exponent α = 1/2.
Remark 4.3 It is intriguing that weighted variance swaps in
fact have explicit representations in the Heston model, cf.
Appendix 1.
4.2. Approximate hedging with variance and gamma swaps
Market making in traditional order-book-based markets
involves actively participating in the market, e.g. by adjusting
orders after an event according to the market maker’s strategy.
By contrast, liquidity provision in DeFi is envisioned to be a
passive way to enable trading. In this spirit, it is appropriate to
look for a static hedge that the liquidity provider can purchase
when starting their investment.
In terms of (17), the Impermanent Loss hedge lies between
the gamma swap and the variance swap. Therefore, we pro-
ceed by searching for an approximation of the Impermanent
Loss hedge via gamma swap, and then via variance swap. We
find that the two approximations sandwich the Impermanent
Loss hedge and we suggest a convex combination of the two
approximations to better approximate the Impermanent Loss
hedge.
4.3. Approximate hedge with gamma swaps
Using Equation (15) we write HT as
HT =
x0
√
S0
2
 S0
0
pT(k)
k3/2
dk +
∞
S0
cT(k)
k3/2
dk .
This is equivalent to
HT =
x0
√
S0
2
 ST
S0
ST − k
k3/2
dk . (18)
We move
√
S0 into the integral and replace it with
√
k to get
H( )
T =
x0
2
 ST
S0
ST − k
k
dk . (19)
From this expression, we see that when ST is close to S0, H( )
T
is close to HT, and
H( )
T > HTif ST > S0, while H( )
T < HTif ST < S0,
meaning that if we used H( )
in our hedging approach, we
would over-hedge if the terminal prize ST ends up above the
beginning of period spot, and we would under-hedge if ST <
S0. Integration of (19) yields
H
( )
T =
x0
2
ST
S0
ST
k
dk −
x0
2
ST
S0
dk =
x0
2
[ST log(k) − k]



k=ST
k=S0
=
x0
2

ST log
ST
S0
− (ST − S0) . (20)
The second term of Equation (20) is equal to the payoff at the
expiration of half a forward contract on the underlying S with
delivery price S0, which is linear in ST. The forward contract
can be valued without any knowledge about the volatility of S.
On the other hand, the first term of Equation (20) corresponds
to the payoff of an entropy contract.
From Fukasawa (2014), we know that the value of a gamma
swap is given by the expectation of the entropy contract
E0 = 2 E

ST
S0
ln
ST
S0
.
Plugging this into (20) gives
H( )
0 =
x0
4
[S0 E0 − 2 F0],
where F0 corresponds to a forward contract with payoff (ST −
S0). An imperfect hedge for Impermanent Loss could thus be
topurchaseagammaswap,yieldinganover-hedgeifST > S0,
and an under-hedge otherwise.
4.4. Approximate hedge with variance swaps
Again we start with HT given by Equation (18) and construct
an approximation that is close to HT when ST is close to S0.
To do so, we write
HT =
x0S0
2
ST
S0
1
k3/2
√
S0
(ST − k)dk
and substitute
√
S0 in the denominator inside the integral with √
k to obtain an approximation
H(υ)
T =
x0S0
2
ST
S0
ST − k
k2
dk. (21)
We notice that HT is close to H(υ)
T when ST is close to S0, and
H(υ)
T < HT if ST > S0, while H(υ)
T > HT if ST < S0.Feature 907
Therefore, if we used H(υ)
in our hedging approach, we would
under-hedge if the terminal prize ST ended up above the initial
spot, and we would over-hedge otherwise. Integrating (21)
yields
H(υ)
T =
x0
2

−S0 log
ST
S0
+ (ST − S0) . (22)
Again, the second term corresponds to a forward contract
– in fact, it is the same contract as for the gamma-contract
hedge H( )
T , only with the opposite sign. The first part cor-
responds to the payoff of a variance swap. The value of a
variance swap (see Bossu (2004, Section 5-2)) is given by the
expectation
ϒ0 = −2 E

log
ST
S0
.
The first term on the right-hand side of Equation (22) thus
corresponds to S0 quarters of variance swaps and hence
H(υ)
0 =
x0
4
[S0ϒ0 + 2(ST − S0)],
4.5. Approximate hedge with a weighted average
Since H(v)
T over-hedges whenever H( )
T under-hedges and
vice-versa (cf. Figure 1), we do a convex combination of a
Gamma swap and a variance swap to approximate the perfect
hedge H0:
H(ϑ)
0 = wH(υ)
0 + (1 − w)H( )
0
=
y0
4
[wϒ0 + (1 − w)E0] +
x0
2
F0,
where w ∈ [0,1] and F0 correspond to a forward contract with
payoff (ST − S0). For each terminal value ST, we can find
a portfolio weight w so that the value of our hedge portfo-
lio H(ϑ)
at maturity equals that of the perfect hedge; that is,
H(ϑ)
T (w,ST) = HT(ST), see Figure 1. Building on this, we can
find a w∗
that minimizes the mean-squared hedging error for
a pre-specified set of terminal values s ∈ S:
w∗
= argmin
w

s∈S

H(ϑ)
T (w,s) − HT(s)
2
, (23)
where we write HT as a function of ST.
4.5.1. Example. We set S0 = 100 and define S = {s ∈
N|s ≥ 10,s ≤ 190}. This leads to w∗
= 0.61. Figure 2 plots
the payoff of the perfect hedge and its approximation
using w∗
.
5. Hedging impermanent loss in the presence of fees
If, in Definition 2.2, we assume that there are non-zero fees,
i.e. τ > 0, then we can show that
y = −
1 − τX
1 − τY
Sx
x
x + (1 − τX )x
,
so that the exchange rate is computed as
lim
x↓0
|y|
|x|
= (1 − τ)S, lim
x↑0
|y|
|x|
=
1
1 − τ
S, (24)
thefirstexpressiondenotingthebidprice(forsellingxtothe
pool in exchange for y), and the second the corresponding
ask price.
In the presence offees, the liquidity pool’s valuation at time
t is given by (cf. Mohan (2022, p. 22))
VLP(t) = yt + xt St = yt +
τ2
+ 2(1 − τ)
2(1 − τ)
yt =
(2 − τ)2
2(1 − τ)
yt,
where we used the mid-price derived from (24). This can be
considered a pool valuation from the perspective of liquidity
providers, cf. Mohan (2022, p. 23). Assuming that transaction
fees are held outside of the liquidity pool after each trade, the
liquidity provider’s wealth process is
VLP(t) =
(2 − τ)2
2(1 − τ)
L

St,
so that Impermanent Loss can be hedged with appropriate
adjustments using the same principles as in Subsections 3.3,
4.1. Further analyses are required if transaction fees remain
within the liquidity pool, and will appear elsewhere.
6. Beyond constant product markets
Consider a Constant Function Market whose trading func-
tion (cf. 1) corresponds to Cobb-Douglas utility indifference
pricing, i.e.
((x,y),(x,y)) := (x + x)α
(y + y)1−α
, α ∈ (0,1);
(25)
α = 1/2 being the case of a Constant Product Market.
Remark 6.1 Constant Function Markets with trading func-
tion (25) belong to the class of geometric mean market
makers, cf. Evans (2020).
As before, we define a constant
L := xα
0 y1−α
0 , (26)
where x0 and y0 are the initial LP reserves. Since any transac-
tion (x,y) ∈ R2
must satisfy
(x + x)α
(y + y)1−α
≡ L,
we have
y =
L1/(1−α)
(x + x)α/(1−α)
−
L1/(1−α)
xα/(1−α)
≈ −L1/(1−α) α
1 − α
x−1/(1−α)
x.908 Feature
Figure 1. Terminal Payoff. Payoffs of the weighted variance swap (solid line termed ‘Perfect Hedge’), the gamma swap (dashed), and the
variance swap (dotted). S0 = 100.
Figure 2. Hedging Error. This figure plots the hedge approximation using a variance and gamma swap (portfolio weight w∗ = 0.61) in terms
of relative error as a function of the return ST/S0 − 1. The hedging error stays below ±3% for the wide range of underlying asset returns
from -75% to +75%.
Therefore, the infinitesimal price (exchange ratio) is
S = L1/(1−α) α
1 − α
x−1/(1−α)
,
and this has to coincide with the price in an external market
formarketviability.Togetherwith(25),wehave,attimet>0,
xt = L

α
1 − α
1−α
1
S1−α
t
, yt = L

α
1 − α
−α
Sα
t .Feature 909
At time t>0, the liquidity provider’s wealth (in units of the
asset Y) that is locked in the LP equals
VLP(t) = yt + xtSt = L

α
1 − α
−α
1
1 − α
Sα
t .
Now suppose that St is the price process in the external mar-
ket and the liquidity provider finances her initial pool (x0,y0)
fromtheexternalmarketattimet = 0.HerImpermanentLoss
at time T is
HT = VBH(T) − VLP(T)
= (y0 + x0ST) − L

α
1 − α
−α
1
1 − α
Sα
T
= −L

α
1 − α
−α
Sα
0

1
1 − α

ST
S0
α
− 1 −
α
1 − α
ST
S0

.
This payoff can be statically hedged by using an European
power contract. With the reparametrization
L := L

α
1 − α
−α
,
we have the alternative expression
HT = LSα
0

ST
S0
α
1
1 − α

ST
S0
1−α
− 1

+ 1 −
ST
S0

.
(27)
Remark 6.2 A contract with the payoff given in (27) hedges
against Impermanent Loss in a constant-weight geometric
meanmarketmakerwithtwotokens.WerefertoEvans(2020)
for the wealth process of a general geometric mean market
maker (with several tokens and dynamic weights).
Letting α → 1, the limit payoff is
L

ST log
ST
S0
− ST + S0

,
which can be hedged by a static portfolio of the Gamma swap
(entropy contract).
With a different reparametrization,
L̂ = L

α
1 − α
1−α
,
we have yet another representation:
HT = −L̂Sα
0

1
α

ST
S0
α
− 1

+ 1 −
ST
S0

.
Letting α → 0, the limit payoff is
−L̂

log
ST
S0
+ 1 −
ST
S0

,
which can be hedged by a static portfolio of the variance swap
(the ‘log contract’, cf. Neuberger (1994)).
Remark 6.3 Note that, for the limit α → 1 (α → 0), we
keep the reparametrization L (L̂) constant. This means that L
diverges in the limit α → 1 (α → 0).
Proposition 6.4 In a Constant Function Market whose trad-
ing function is given by (25), the static hedge against Imper-
manent Loss (9) can be approximated with a variance swap
as α → 0, and with a Gamma swap as α → 1.
Remark 6.5 In Evans (2020, p. 6), the LP’s value in the
limiting case α = 1 (α = 0) is interpreted as a buy-and-hold
strategy of token X (token Y) exclusively. The difference with
our result is that we require the reparametrization L̃ (L̂) to
remain constant.
We can directly construct utility functions (trading func-
tions) corresponding to gamma swap and variance swap pay-
offs, respectively, as we show in the following subsections.
6.1. The constant function market whose impermanent loss
can be hedged with a gamma swap
Consider the trading function
((x,y),(x,y)) := x + x + log(y + y)
Then, defining L := x + logy, we get
y = eL−x−x
− y = eL−x−x
− eL−x
≈ −xeL−x
,
which implies that S = eL−x
= y is the infinitesimal price of
asset Y in units of asset X. Therefore,
x = L − logS, y = S, y + xS = S(1 + L − logS),
and so Impermanent Loss at time T is
HT = S0 + (L − logS0)ST − ST(1 + L − logST)
= −ST + S0 + ST log
ST
S0
.
6.2. The constant function market whose impermanent loss
can be hedged with a variance swap
Similarly, the trading function
((x,y),(x,y)) := log(x + x) + (y + y)
gives y ≈ −x
x
, meaning that S = 1
x
. In this case, with
L := logx + y, we have
x =
1
S
, y = L − logx, y + xS = 1 + L + logS.
Impermanent Loss thus becomes
HT =

L + logS0 +
ST
S0

− (1 + L + logST)
=
ST
S0
− 1 − log
ST
S0
,
as noted in Angeris et al. (2021b, Subsection 2.4).910 Feature
6.3. Constructing the constant function market
corresponding to a general payoff
Under general C1
utility indifference pricing (cf., e.g. Car-
mona 2009)
((x,y),(x,y)) := u(x + x,y + y)
with non-degenerate marginal utility
∂u
∂x
= 0,
∂u
∂y
= 0,
we have
∂u
∂x
(x,y)x +
∂u
∂y
(x,y)y ≈ 0,
which implies the price of Y in units of X in an external
market to be
S =
∂u
∂x
∂u
∂y
(x,y).
The implicit function theorem on the other hand ensures the
existence of a C1
function f such that u(x,f(x)) = L with
f (x) = −
∂u
∂x
∂u
∂y
(x,f(x)) = −S.
For a reasonably chosen utility function, the reserve x in the
LP is a strictly decreasing function of the external price S, and
so we assume f to be strictly increasing, or equivalently, f to
be strictly convex hereafter. The LP’s value in units of Y is
VLP = y + xS = f(x) − xf (x) = f(x∗
(p)) − x∗
(p)p,
where p = −S and x∗
(p) = (f )−1
(p). We then conclude
VLP = −f∗
(−S),
where f∗
(p) is the Legendre transform of f:
f∗
(p) = sup
x
{px − f(x)}.
In particular, we find that VLP is a concave function of S.
Further, since (f∗
) (p) = x∗
(p), VLP should be nondecreasing.
The property (−g)∗∗
= −g for a concave function g gives the
following.
Proposition 6.6 Any nondecreasing, strictly concave C1
payoff VLP(S) = g(−S) of S on (0,∞) can be replicated in
a Constant Function Market with a utility function u such that
u(x,f(x)) is constant, where f is the Legendre transform of the
nondecreasing strictly convex C1
function −g on (−∞,0).
Remark 6.7 In Angeris et al. (2021b, Subsection 1.1), the
authorslinkConstantFunctionMarkets’tradingfunctionsand
payoff profiles via the Fenchel transform. We consider the
reasoning put forth herein more straightforward.
Example 6.8 For a Constant Product Market, whose trad-
ing function is given by (5), the expressions above reduce
to S = y/x, f(x) = 1/x, and f∗
(p) = −2
√
−p, so that VLP =
−f∗
(−S) = 2
√
S, as in (11).
7. Conclusion
In this paper, we analyzed the connection between Constant
Function Markets and variance swaps and gamma swaps,
which are important and extensively studied volatility prod-
ucts in traditional finance (‘TradFi’). This link between DeFi
and TradFi is established by the hedging of Impermanent
Loss that a liquidity provider suffers vis-à-vis a HODLer. In
particular, we showed that Impermanent Loss in a Constant
Product Market can be hedged statically with a weighted vari-
ance swap of order 1/2. We furthermore derived the Constant
Function Market’s trading functions such that Impermanent
Loss can be hedged with variance swaps or gamma swaps.
These results are similar in spirit to the research of Angeris
et al. (2021a, 2021b) on designing Constant Function Mar-
kets whose trading functions are specified in such a way as to
guarantee the liquidity provider a certain payoff, such as that
of a covered call or a portfolio with equal weights.
We strongly believe that the intersection between TradFi
and DeFi highlighted herein offers a rich field of research
for experts in quantitative finance, and we hope that its
cross-fertilization will contribute to the maturing process of
Decentralized Finance.
Acknowledgments
The authors are grateful for several valuable comments and
suggestions made by the anonymous referee. M.W. thanks the
participants of the ZHAW advanced course on DeFi in Febru-
ary2022andtheCSHViennaWorkshoponDeFiinJune2022
for feedback and discussions.
Disclosure statement
No potential conflict of interest was reported by the author(s).
Funding
The author acknowledges partial financial support by COST
Action 19130: Fintech and Artificial Intelligence in Finance
(European Cooperation in Science and Technology).
ORCID
Marcus Wunsch http://orcid.org/0000-0002-8127-9466
References
Angeris, G. and Chitra, T., Improved price oracles: Constant function
market makers. In Proceedings of the 2nd ACM Conference on
Advances in Financial Technologies, AFT ’20, pp. 80–91, 2020
(Association for Computing Machinery: New York, NY).Feature 911
Angeris, G., Evans, A. and Chitra, T., When does the tail wag
the dog? Curvature and market making. Available online at:
https://arxiv.org/abs/2012.08040, 2020.
Angeris, G., Evans, A. and Chitra, T., Replicating market makers.
Available online at: https://arxiv.org/abs/2103.14769, 2021a.
Angeris, G., Evans, A. and Chitra, T., Replicating monotonic payoffs
without oracles. Available online at: https://arxiv.org/abs/2111.
13740, 2021b.
Angeris, G., Kao, H.T., Chiang, R., Noyes, C. and Chitra,
T., An analysis of Uniswap markets. Available online at:
http://arxiv.org/abs/1911.03380, 2021c.
Balancer v2, Weighted pools. Available online at: https://docs.
balancer.fi/products/balancerpools/weighted-pools, 2022.
Bancor v3, Impermanent loss protection. Available online at:
https://whitepaper.io/document/52/bancor-whitepaper, 2022.
Bossu, S., Advanced Equity Derivatives, 2004 (John Wiley & Sons
Inc.: Hoboken, NJ).
Carmona, R., Indifference Pricing: Theory and Applications, 2009
(Princeton University Press: Princeton, NJ).
Clark, J., The replicating portfolio of a constant product market.
SSRN Scholarly Paper ID 3550601, 2020.
delBañoRollin,S.,Ferreiro-Castilla,A.andUtzet,F.,Onthedensity
of log-spot in the Heston volatility model. Stoch. Process. Their.
Applications, 2010, 120(10), 2037–2063.
Demeterfi, K., Derman, E., Kamal, M. and Zhou, J., More than
you ever wanted to know about volatility swaps. Goldman
Sachs Quantitative Strategies Research Notes. Available online at:
https://web.math.ku.dk/ rolf/Demeterfi.pdf, 1999.
Evans, A., Liquidity provider returns in geometric mean markets.
Available online at: https://arxiv.org/abs/2006.08806v4, 2020.
Evans, A., Angeris, G. and Chitra, T., Optimal fees for geomet-
ric mean market makers. Available online at: http://arxiv.org/abs/
2104.00446, 2021.
Fukasawa, M., Volatility derivatives and model-free implied lever-
age. Int. J. Theor. Appl. Finance, 2014, 17(1), 1450002.
Gatheral, J., The Volatility Surface: A Practitioner’s Guide, 1st ed.,
2012 (Wiley: Hoboken, NJ).
KPMG China, Crypto Insights, 2021.
Lipton, A. and Sepp, A., Automated market-making for fiat curren-
cies. Available online at: http://arxiv.org/abs/2109.12196, 2021.
Lipton, A. and Treccani, A., Blockchain and Distributed Ledgers:
Mathematics, Technology, and Economics, 2021 (World Scien-
tific: Singapore).
Macovschi, S. and Quittard-Pinon, F., On the pricing of power and
other polynomial options. J. Derivatives, 2006, 13(4), 61–71.
Martinelli, F. and Mushegian, N., A non-custodial portfolio manager,
liquidity provider, and price sensor. (Balancer Whitepaper), 2019.
Mohan, V., Automated market makers and decentralized exchanges:
A DeFi primer. Financ. Innovation, 2022, 8, 20.
Neuberger, A., The log contract. J. Portf. Management, 1994, 20(2),
74–80.
Schär, F., Decentralized finance: On blockchain- and smart contract-
based financial markets. Federal Reserve Bank of St. Louis
Review, pp. 153–174, 2021.
Appendices
Appendix 1. Formulae under the Heston model
Under the Heston model
dSt
St
=
√
νt ρ dWt +

1 − ρ2 dW⊥
t ,
dνt = κ(θ − νt)dt + η
√
νt dWt,
where (W,W⊥) is a two-dimensional standard Brownian motion,
we know explicit formulae for the variance swap and gamma swap
prices ϒ0 and E0 exist:
ϒ0 = θT + (ν0 − θ)
1 − e−κT
κ
,
E0 =
κ
κ
θT +

ν0 −
κ
κ
θ
 1 − e−κ T
κ
,
where κ = κ − ηρ. The two prices coincide when ρ = 0. More gen-
erally, they coincide under any stochastic volatility model with no
leverage effect. See Fukasawa (2014) for the details.
An involved but nevertheless explicit expression for the Imper-
manent Loss hedge (12) can be inferred directly from del Baño
Rollin et al. (2010, Subsection 2.1); cf. also Macovschi and Quittard-
Pinon (2006, Section II). The authors’ approach in del Baño Rollin
et al. (2010) is based on the characteristic function (in their notation,
Xt = logSt, u = 1/2, a = κ, b = θ, c = η, μ = 0).
Appendix 2. Computing the hedge premium from options
data
We use options data as of 25 March, 2022 as displayed in Table A1.
Assuming that a liquidity provider establishes an LP containing x0 =
1 BTC and y0 = 42,955 USD (so that both amounts have the same
dollar value), Formula (15) yields that the value of her static hedge
against Impermanent Loss is approximately USD 178.84. In fact,
from this, we can back out the implied volatility using the approx-
imation of the fee (cf. (14)), y0σ2T/4, which yields σ ≈ 65.90%.
Note that this is close to the implied volatility based on six months
of data, which stood roughly at 65.57% as of 25 March 2022, cf. The
Block Crypto.
Table A1. Option Prices. Vanilla BTCUSD calls and
puts with two-weeks maturity, on 25 March 2022
(ATM = 42,955). We thank SEBA Bank for kindly mak-
ing these data available to us.
Calls Puts
Premium Strike Premium Strike
2072 43,000 2095 43,000
1841 43,500 1849 42,500
1629 44,000 1623 42,000
1437 44,500 1419 41,500
1263 45,000 1235 41,000
1107 45,500 1072 40,500
968 46,000 928 40,000
845 46,500 798 39,500
733 47,000 684 39,000
636 47,500 584 38,500
550 48,000 499 38,000
476 48,500 427 37,500
411 49,000 367 37,000
355 49,500 318 36,500
307 50,000 275 36,000
267 50,500 236 35,500
232 51,000 202 35,000
202 51,500 174 34,500
176 52,000 151 34,000
154 52,500 131 33,500
134 53,000 114 33,000
118 53,500 100 32,500
104 54,000 88 32,000
92 54,500 77 31,500
81 55,000 68 31,000
72 55,500 60 30,500
64 56,000 53 30,000
57 56,500 47 29,500
52 57,000 42 29,000
46 57,500 37 28,500
42 58,000 33 28,000
37 58,500 29 27,500