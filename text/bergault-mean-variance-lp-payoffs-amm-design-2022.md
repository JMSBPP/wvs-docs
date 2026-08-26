---
sha256: 719b1f56d19042facf11a28f26c77eeeeaa0a0c601bfced43b9e8f4433d17864
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 61084
---
Automated Market Makers: Mean-Variance Analysis of LPs
Payoffs and Design of Pricing Functions
Philippe Bergault∗
Louis Bertucci†
David Bouba‡
Olivier Guéant§
Abstract
With the emergence of decentralized finance, new trading mechanisms called Automated Market
Makers have appeared. The most popular Automated Market Makers are Constant Function Market
Makers. They have been studied both theoretically and empirically. In particular, the concept of im-
permanent loss has emerged and explains part of the profit and loss of liquidity providers in Constant
Function Market Makers. In this paper, we propose another mechanism in which price discovery does
not solely rely on liquidity takers but also on an external exchange rate or price oracle. We also propose
to compare the different mechanisms from the point of view of liquidity providers by using a mean /
variance analysis of their profit and loss compared to that of agents holding assets outside of Automated
Market Makers. In particular, inspired by Markowitz’ modern portfolio theory, we manage to obtain
an efficient frontier for the performance of liquidity providers in the idealized case of a perfect oracle.
Beyond that idealized case, we show that even when the oracle is lagged and in the presence of adverse
selection by liquidity takers and systematic arbitrageurs, optimized oracle-based mechanisms perform
better than popular Constant Function Market Makers.
Key words: Automated market makers, cryptocurrencies, DeFi, oracles, stochastic optimal control.
## 1 Introduction
Since the early days of the Decentralized Finance (DeFi) era, Automated Market Makers (AMMs) have
been some of the largest DeFi protocols on public blockchains. Although it is nothing more than a smart
contract on a blockchain, an AMM should be regarded, from a financial point of view, as a liquidity pool
of two assets1
involving two types of agents: liquidity providers (referred to as LPs) and liquidity takers
(referred to as LTs or, more simply, traders). LPs supply reserves to the pool, usually in both assets of the
pool. In exchange, they become entitled to a share of the pool that is in line with their supply. LTs, in
turn, use AMMs to trade, that is to swap a given quantity of one asset against the other. The exchange
rate proposed by an AMM is typically based on a pre-defined and public formula that depends on the
reserves, the transaction size and the direction of the swap. This function is often called the pricing func-
tion, and, although it must be defined in the contract, it can use external data through what is called oracles.
AMMs constitute a new paradigm beyond (i) that of dealer markets (like the global FX market, see [62, 63])
where specific agents – usually banks – provide liquidity to clients and hold risk on their balance sheet,
(ii) that of classical order-driven markets organized around limit order books (like most stock markets), and
(iii) that of dark pools introduced in the last decades (see [51]). Unlike in dealer markets, any agent can
provide liquidity through an AMM. Unlike in limit order books, prices are automatically set by the protocol.
∗Université Paris Dauphine-PSL, Ceremade, 75116, Paris, France, bergault@ceremade.dauphine.fr.
†Institut Louis Bachelier, 75002, Paris, France, louis.bertucci@institutlouisbachelier.org.
‡Swaap Labs, d@swaap.finance.
§Université Paris 1 Panthéon-Sorbonne, Centre d’Economie de la Sorbonne, 106 Boulevard de l’Hôpital, 75642 Paris
Cedex 13, France, olivier.gueant@univ-paris1.fr.
1There exist AMMs functioning with pools involving more than two assets, but we focus on the two-asset case throughout
this paper.
1
arXiv:2212.00336v6 [q-fin.TR] 19 Nov 2023Unlike in dark pools, the available liquidity is visible and the price is not defined solely by importing that
of another venue. Most importantly, LPs do not provide liquidity to LTs in the case of AMMs: LPs provide
liquidity to the pool and LTs take liquidity from the pool.2
The novelty of AMMs raises a lot of theoretical
questions from an economic point of view, in relation to the classical market microstructure literature, but
also optimization and quantitative questions related to the quantitative finance and financial engineering
literature.
This paper is a contribution to the quantitative finance literature on AMMs focusing on the relation be-
tween the design of AMMs and the performance of LPs. Using standard convex analysis, we recover the
now well-known result that, in the absence of transaction fees, posting liquidity into a Constant Function
Market Maker3
(CFMM) exposes to a concave payoff that is inferior to that of holding coins outside of the
pool.4
This nonpositive and concave payoff comes from the fact that price discovery in CFMMs is left to
LTs who act as arbitrageurs and make money out of the pool. Transaction fees should therefore compensate
a risk that is fundamentally related to the design of CFMMs and competition between CFMMs cannot
reduce transaction fees below a threshold that depends on market conditions. We therefore plead in this
paper for the design of oracle-based AMMs that are more complicated than CFMMs in that they do not
solely rely on LTs for price discovery.
In our paper, we explore indeed AMMs in which the pricing function uses external information about cur-
rent market prices. Even if a blockchain only has knowledge about on-chain activity, it is possible to feed a
smart contract with external data through oracles (see [27] for a discussion). This situation is quite similar
to that of a traditional market maker in dealer markets who provides quotes based on an estimation of the
price or exchange rate (typically a mid-price imported from an electronic platform or a composite price)
that is available at the same time. Instead of being entirely passive, the AMM can update its bid and offer
not only after a trade or a provision or redemption of liquidity, but also after the oracle has fired a price
update. One difference with the traditional finance case is however that a dealer in FX or corporate bond
markets can have and frequently has short positions whereas liquidity must always be present in the pool
in the case of an AMM.
In order to compare different AMMs (from the point of view of LPs5
), we build in this paper a simple
mean-variance framework inspired by the so-called modern portfolio theory of the 1950s. However, unlike
in the Markowitz case, we always consider the Hodl6
strategy as a benchmark. An agent faces indeed an
alternative: providing liquidity by posting coins into an AMM or holding them. The Hodl benchmark is
also intimately linked to the notion of impermanent loss that is ubiquitous in the field.
We also borrow from the modern portfolio theory the concept of efficient portfolios which becomes in our
case efficient market making strategies, i.e. efficient pricing functions. Indeed, in addition to comparing the
risk / return profile of different existing AMMs, we are interested in computing the maximum extra return
that a LP could expect for a given level of tracking error with respect to Hodl.
Although the efficient frontier cannot be computed in closed form, it can easily be approximated using a
2In particular (like for most DeFi applications) AMMs are fully collateralized and neither LPs nor LTs are exposed to any
sort of counterparty risk. To be more precise, LPs are exposed to a technological – or cyber – risk, but as long as the smart
contract works as expected, they will be able to withdraw their share of the reserves.
3We refer to [59] for a pedagogical introduction to CFMMs and the classical pricing functions. Examples of popular
CFMMs include Uniswap (see [2, 3, 4]), Balancer (see [56]), Curve (see [35, 36]), etc. An interesting empirical analysis of
Uniswap v3 is [54].
4This led to the now classical concept of impermanent loss that is widely used in the DeFi world. The “impermanent”
trait of such loss lies in the fact that losses vanish when the exchange rate reverts back to its original value (at the time the
liquidity was provided).
5Due to the challenges posed by impermanent loss, much of the existing literature has sought to optimize AMM designs
with a focus on LPs. Our work aligns with this perspective, drawing additional inspiration from research works on optimal
market making in OTC markets, which predominantly consider the dealers’ standpoint. It is worth noting, however, that an
economic perspective on AMM design should ideally encompass both LTs and LPs. In the below literature review, there are a
few papers tackling equilibrium issues encompassing both LPs and LTs but not with designs like ours.
6Hodl is slang in the cryptocurrency community for holding a cryptocurrency. In traditional finance, this would be called
“buy and hold”.
2model inspired by the modern literature on market making. Interestingly, we show that popular CFMMs
exhibit poor performances relatively to our approximation of the theoretical efficient frontier in a complete
information framework. However, even in the presence of a lagged oracle and adverse selection, an optimized
oracle-based AMM is able to get close to that theoretical efficient frontier.
In recent years, many research works have been carried out on AMMs, especially CFMMs, with a special
focus on Constant Product Market Makers (CPMMs) and their generalizations. Motivated by the emer-
gence of Uniswap and the volume exchanged through it, the authors of [11] studied the main properties
of CPMMs. In particular, they showed that, in the presence of arbitrageurs, the exchange rate proposed
by a CPMM for small transactions should be in a range around that of competing venues – the width of
the range being determined by transaction fees. Then, they studied the main properties of CPMMs: the
no-splitting property, the no-depletion property, etc. They also studied the payoff of LPs in a CPMM as a
function of an external asset price when there is no transaction fees (see also [33] and an extension to the
case of liquidity concentration as in Uniswap v3 in [34]). The returns of LPs are also studied in [24] and
[37] for pricing functions that are geometric means. In particular, impermanent loss is studied for several
pricing functions.
Beyond CPMMs, CFMMs have been studied by the authors of [7] in a general multi-coin setting. They
introduced a natural notion of trading set and showed that its convexity is key to obtain desirable prop-
erties. In the no-transaction-fee case, they also obtained a formula for the value of the pool that involves
Legendre-Fenchel transforms (see also [9] and Section 2 for a discussion). In particular, they showed that
the returns of LPs between two liquidity provision or redemption events suffered from impermanent loss for
all CFMMs. The same group of authors with additional coauthors then shed a new light on their previous
works in [6] by embedding several problems involving CFMMs in a convex setting.
A recent and important work to better understand the payoff of LPs in CFMMs is [57]. Because the value
of a CFMM is a concave function of the exchange rate between the two assets, Itô’s formula leads to a
decomposition7
of the payoff of LPs into two terms: a stochastic integral corresponding to the payoff of
a self-financing strategy and a nonincreasing and nonpositive term. They use this decomposition to claim
that, at least theoretically, part of the risk can be hedged away. In particular, if continuous-time hedging
with no friction was possible and if an AMM or an LP implemented the hedging strategy, only part of the
impermanent loss would remain that they call Loss-Versus-Rebalancing (LVR).8
Beyond the properties of CFMMs and the returns of LPs, several questions have also been addressed in
the literature. The question of the optimal fees is discussed in [38]. That of the take rate (the proportion
of the fees kept by the protocol) is addressed in [41]. Strategic liquidity provision is the topic of several
papers. With a viewpoint rooted into the classical Kyle/Glosten-Milgrom literature on market microstruc-
ture, [12] studies liquidity provision in a CPMM with a focus on equilibrium issues. Equilibrium questions
are also discussed in [48]. The authors of [30] and [60] discuss the impact of liquidity concentration (as
in Uniswap v3) on liquidity provision strategies. A microstructural and game-theoretical approach is pro-
posed in [26] in which the authors discuss, among many interesting topics, the influence of volatility on the
adoption of AMMs. The coexistence of limit order books and AMMs and the competition between them
are discussed in [13], [16] and [52]. The execution of orders in CFMMs has also been studied in several
papers: [10] tackles the static problem of optimal routing across a set of several CFMMs while [29] studies
a dynamic problem of optimal execution à la Almgren-Chriss on a CFMM.
In this paper, we go beyond CFMMs and propose an optimized oracle-based AMM. Our ideas and the
model we use are inspired by the recent literature on market making. The quantitative literature on market
making initially started in the 1980s with the seminal works [49, 50] (see also the papers [5] and [61] from
the 1980s). It was revived in 2008 in [14] where the authors use stochastic optimal control tools. Following
the latter paper, market making has become an important research strand in quantitative finance over
the last decade. The authors of [44] presented a thorough analysis of the problem introduced in [14], and
7When the price process is a martingale this is the Doob-Meyer decomposition of the payoff.
8In the very recent paper [58] they added transaction costs and discrete-time trading and obtained asymptotic results with
respect to the frequency of blocks.
3proposed closed-form approximations of the optimal quotes in the case of exponential intensities. Instead
of the expected utility framework of [14], our model uses the objective function introduced in [32]. Since
then, a lot of new features have been progressively added to the initial models: the impact of parameters
ambiguity is studied in [28], in [21] the authors considered a framework with various trade sizes, etc. Also,
specific models for different asset classes have been proposed: for stock options in [15], for foreign exchange
currencies in [17], [18] and [19], and for bonds in [45].9
Our model extends the recent market making
models tackling the problem faced by FX dealers, in which exchange rate dynamics are geometric rather
than arithmetic, by considering instead of the total profit and loss (PnL) of the liquidity provider, only the
extra money (positive or negative) beyond Hodl.
The remaining of the paper is organized as follows. In Section 2, we introduce notation and recall classi-
cal results about the returns of LPs in CFMMs in a concise manner. Section 3 goes beyond the case of
CFMMs and derives approximations of efficient pricing functions for an AMM with complete information (in
particular a perfect exchange rate oracle). Section 4 relaxes the assumptions of Section 3 to be closer to re-
ality by considering misspecification of the parameters, a lagged oracle and adverse selection by arbitrageurs.
## 2 The payoff of LPs in CFMMs: a primer
## 2.1 Notation and definition of the protocol
CFMMs constitute one of the simplest forms of AMMs. In CFMM protocols, the exchange rate for a given
pair of coins or tokens is determined by the function of (i) the reserves in the liquidity pool and (ii) the
size (and side) of the prospective transaction. In what follows, we recall the functioning of two-currency
CFMMs and the now classical analysis of the PnL of LPs in these protocols. It is noteworthy that, because
ownership over the CFMM reserves is defined proportionally to the amounts deposited by LPs, one can
consider – without loss of generality – the special case of a 1-LP-only system.10
In what follows, we shall denote by (q0
t )t≥0 and (q1
t )t≥0 the two processes for the reserves corresponding
respectively to the number of coins of currency 0 and currency 1 in the pool (time 0 corresponds to the
initial posting of reserves). In the case of a CFMM with no transaction fees, the proposed exchange rate
is typically such that the quantity f(q0
t ,q1
t ) remains constant11
before and after a trade where the function
f : R∗
+ × R∗
+ → R is typically increasing with respect to both of its variables, reflecting the intent to swap
one currency for the other. For what follows, it is more practical to use an alternative formulation based on
level sets. We assume that reserves always satisfy the equation q0
t = ψ(q1
t ) where the function ψ : R∗
+ → R∗
+
satisfies the following properties:
• ψ is decreasing – this reflects that one currency is swapped for the other
• limq1→0+ ψ(q1
) = +∞ and limq1→+∞ ψ(q1
) = 0 – to prevent depletion of one of the two currencies
• ψ is strictly convex – convexity12
guarantees the absence of arbitrage opportunities
• ψ is continuously differentiable – to simplify the analysis (it is the case in practice).
In this setting, if a client wants to sell ∆q1
> 0 coins of currency 1 to the pool at date t, he/she will receive
∆q0
coins of currency 0 where
q0
t − ∆q0
= ψ(q1
t + ∆q1
), i.e.
∆q0
∆q1
= −
ψ(q1
t + ∆q1
) − ψ(q1
t )
∆q1
.
9See the books [31] and [42] for a detailed bibliography on market making.
10As in most papers of the literature, our analysis is valid between any two liquidity provision/redemption events. In other
words, we assume that liquidity evolves according to the swaps placed by LTs only.
11Of course, in the case of provision/redemption of liquidity, the quantity changes, hence the above footnote.
12The strictness is important only to differentiate the Legendre transform of ψ below.
4Symmetrically, if a client wants to buy ∆q1
> 0 coins of currency 1 from the pool at date t, he/she will pay
∆q0
coins of currency 0 where
q0
t + ∆q0
= ψ(q1
t − ∆q1
), i.e.
∆q0
∆q1
=
ψ(q1
t − ∆q1
) − ψ(q1
t )
∆q1
.
Of course, the convexity of ψ ensures that
−
ψ(q1
t + ∆q1
) − ψ(q1
t )
∆q1
≤
ψ(q1
t − ∆q1
) − ψ(q1
t )
∆q1
,
thereby precluding the existence of arbitrage opportunities within the pool.
## 2.2 No-arbitrage assumption and PnLs
Assuming there exists at time t an external market exchange rate St for currency 1 (in terms of currency 0)
at which infinitesimal quantities could be traded, we clearly see from the above equations that there would
be an arbitrage opportunity at time t if St was not equal to −ψ′
(q1
t ). Neglecting the existence of bid-ask
spreads even for tiny transactions, we write St = −ψ′
(q1
t ) and decide to evaluate (in currency 0 terms) any
position in currency 1 with exchange rate St.
In such an idealized setting, the PnL at time t (in currency 0 terms)13
of the representative LP is therefore
PnLt = q0
t + Stq1
t

− q0
0 + S0q1
0

while that of the same agent who would not have posted reserves in the pool would be
PnLHodl
t = q0
0 + Stq1
0

− q0
0 + S0q1
0

= (St − S0)q1
0.
To compare those two PnLs, let us define ψ∗
the Legendre-Fenchel transform14
of ψ, i.e.
ψ∗
: p ∈ R∗
− 7→ sup
q∈R∗
+
pq − ψ(q).
The maximizer q in the definition of ψ∗
(p) is uniquely defined by ψ′
(q) = p and it is hence q1
t when p = −St.
We therefore obtain
ψ∗
(−St) = −q1
t St − ψ(q1
t ) = −q1
t St − q0
t and ψ∗′
(−St) = q1
t .
In particular, we have,
PnLt = ψ∗
(−S0) − ψ∗
(−St) and PnLHodl
t = (St − S0)ψ∗′
(−S0).
Because ψ∗
is strictly convex, its graph lies above the tangent line at all points and we have therefore
PnLt − PnLHodl
t = ψ∗
(−S0) − ψ∗
(−St) − (St − S0)ψ∗′
(−S0) ≤ 0,
with equality if and only if St = S0. This result corresponds to the notion of impermanent loss since the
loss vanishes if the exchange rate goes back to its value when reserves were added to the pool.
## 2.3 Analysis and discussion
The above inequality is fundamental as it claims that, under mild assumptions, there is no benefit in pro-
viding liquidity through a CFMM with no fees. In other words, a minimal amount of fees is necessary to
encourage liquidity provision. In particular, competition between CFMMs cannot decrease fees to zero.
13The PnL needs to be accounted in a given currency. We arbitrarily choose currency 0 in what follows.
14We restrict the function to the interior of its domain.
5The above computations prove that the payoff of a LP in a CFMM with no fees is not only nonpositive but
also concave, i.e. similar to that of an option seller. Assuming that ψ∗
is twice continuously differentiable
and applying Itô’s formula as in [57], we see that
PnLt − PnLHodl
t =
Z t
0
(ψ∗′
(−Ss) − ψ∗′
(−S0))dSs −
1
2
Z t
0
ψ∗′′
(−Ss)d⟨S⟩s
where ⟨·⟩ denoted quadratic variation. The first term can be (theoretically) hedged away through a self-
financing strategy with −(ψ∗′
(−Ss) − ψ∗′
(−S0)) coins of asset 1 at time s, while the second term, called
LVR in [57], is always nonpositive because ψ∗
is convex.
Regarding the first term, continuous-time hedging with no friction is a classical theoretical assumption.
However, in practice, hedging raises a lot of questions given the high frequency at which trades happen
in AMMs: when should we hedge? on which venue? should we cross the spread in limit order books or
post limit orders? what about our market impact? etc. Furthermore, hedging requires to trade on another
venue and may be complicated to implement inside an AMM: LPs should carry out the hedging process by
themselves, all the more since LPs might not want to be hedged at the level of each AMM but rather at
the level of their portfolio to benefit from netting effects. In any case, one can argue that part of the risk
could be hedged away, leading therefore to a reduction of the fees charged by CFMMs to LTs in order to
compensate LPs. This is an important route for future research in the field.
Regarding the second term, it is intrinsically related to the main problem of CFMM protocols. In a CFMM,
the price discovery process indeed occurs solely thanks to trades with LTs, and LTs therefore extract value
from LPs. To avoid this value extraction, an interesting idea consists in using a price oracle. This is the
purpose of this paper.
## 3 Efficient pricing functions in the complete information case
## 3.1 Modeling framework
In this section, we consider a filtered probability space (Ω,F,P;F = (Ft)t≥0) satisfying the usual conditions.
In the previous section, the automated market making protocol did not rely on any external information
to propose exchange rates. It indeed proposed exchange rates for various transaction sizes based only on
the reserves lying in the pool at a given time. We now consider the theoretical and idealized case where an
exogenous market exchange rate is known, for instance the mid-price on a centralized exchange based on a
limit order book, like those of Binance, Kraken or Coinbase. This exchange rate is indicative rather than
tradable (equivalently, we assume that the AMM is not able to trade on other venues) even for infinitesimal
sizes but we still denote by (St)t∈R+ the market exchange rate process, stating the value of currency 1 in
terms of currency 0. We assume for it the following dynamics:
dSt = µStdt + σStdWt,
where µ ∈ R is a known deterministic drift, σ > 0 a known deterministic volatility and (Wt)t∈R+
a standard
Brownian motion.
To study the PnL of LPs, we need assumptions on the demand of LTs. To build a parsimonious model, we
consider as in [19] that transaction sizes are labelled in the accounting currency (currency 0) and that trans-
actions are decomposed into two parts: one part corresponding to the market exchange rate and another
part corresponding to a markup (that might very rarely be a discount) that is accounted in currency 0,
whatever the side of the transaction, for the sake of simplicity. More precisely, if a client wants to buy z
coins of currency 0 at time t, then z/St coins of currency 1 will be asked and zδ1,0
(t,z) out of the total of
z coins of currency 0 will not be transferred to him/her. Symmetrically, if a client wants to sell z coins of
currency 0 at time t, then z/St coins of currency 1 will be offered to him/her and zδ0,1
(t,z) extra coins of
6currency 0 will be asked as a markup.15
We assume that the markups δ0,1
,δ1,0

belong to
A :=
(
δ = δ0,1
,δ1,0

: Ω × [0,T] × R∗
+ 7→ R2
δ is P ⊗ B(R∗
+)-measurable
and δ0,1
(t,z) ∧ δ1,0
(t,z) ≥ −C P ⊗ dt ⊗ dz a.e.
)
,
for a given (large) constant C > 0. Here, P denotes the σ-algebra of F-predictable subsets of Ω×[0,T] and
B(R∗
+) denotes the Borelian sets of R∗
+.
In the model, to simplify the analysis, we accumulate these markups in a process (Xt)t∈[0,T], separated from
the reserves. Its dynamics is
dXt =
Z
z∈R∗
+
zδ0,1
(t,z)J0,1
(dt,dz) +
Z
z∈R∗
+
zδ1,0
(t,z)J1,0
(dt,dz),
with X0 = 0, where J0,1
(dt,dz) and J1,0
(dt,dz) are two R∗
+-marked point processes modelling transactions
through which the AMM sells currency 1 and receives currency 0 (for J0,1
(dt,dz)) and transactions through
which the AMM sells currency 0 and receives currency 1 (for J1,0
(dt,dz)).
These marked point processes also allow to write the dynamics of the reserves:
dq0
t =
Z
z∈R∗
+
z J0,1
(dt,dz) − J1,0
(dt,dz)

and dq1
t =
Z
z∈R∗
+
z
St
J1,0
(dt,dz) − J0,1
(dt,dz)

.
Because we are interested in the PnL of a LP compared to that of an agent who would have held the coins
outside of the AMM, we introduce the following two processes:
Y 0
t

t∈R+
= (q0
t − q0
0)

t∈R+
and Y 1
t

t∈R+
= (q1
t − q1
0)St

t∈R+
.
Their dynamics are given by:
dY 0
t =
Z
z∈R∗
+
z J0,1
(dt,dz) − J1,0
(dt,dz)

and dY 1
t = µY 1
t dt+σY 1
t dWt+
Z
z∈R∗
+
z J1,0
(dt,dz) − J0,1
(dt,dz)

.
We assume that the processes J0,1
(dt,dz) and J1,0
(dt,dz) have known intensity kernels given respectively
by (ν0,1
t (dz))t∈R+
and (ν1,0
t (dz))t∈R+
, verifying
ν0,1
t (dz) = Λ0,1
z,δ0,1
(t,z)

1{q1
t−≥ z
St
}m(dz) and ν1,0
t (dz) = Λ1,0
z,δ1,0
(t,z)

1{q0
t−≥z}m(dz),
where m is a measure (typically Lebesgue or discrete) and Λ0,1
and Λ1,0
are called the intensity functions of
the processes J0,1
(dt,dz) and J1,0
(dt,dz) respectively. In the standard literature on market making (see [18]
or [21], for instance), these intensity functions (which correspond to the demand curve of LTs) are assumed
of the logistic type, i.e.
Λ0,1
(z,δ) = λ0,1
(z)
1
1 + eα0,1(z)+β0,1(z)δ
and Λ1,0
(z,δ) = λ1,0
(z)
1
1 + eα1,0(z)+β1,0(z)δ
,
where λ0,1
(z)m(dz) and λ1,0
(z)m(dz) describe the maximum number of transactions of size in [z,z + dz]
per unit of time (the height of the demand curve) and α0,1
(z), β0,1
(z), α1,0
(z), and β1,0
(z) the shape of the
15δ0,1(t,z) and δ1,0(t,z) converted in basis points, could be regarded as “mid”-to-bid and ask-to-“mid” in basis points.
Everything works indeed almost as if the prices proposed for swapping were respectively St(1 − δ1,0(t,z)) (bid) and St(1 +
δ0,1(t,z)) (ask). While St serves as an indicative price independent of size z, the ultimate exchange rate depends on the size
(and direction) of the transaction.
7demand curve, in particular the sensitivity to the markups. It is noteworthy that indicator functions rep-
resent the impossibility for the AMM to propose exchange rates for transactions that cannot occur because
reserves are too low in the demanded currency.
The PnL minus the PnL of Hodl at time T, hereafter the excess PnL, of a LP is therefore given by
XT + Y 0
T + Y 1
T =
Z T
0
Z
z∈R∗
+
zδ0,1
(t,z)J0,1
(dt,dz) +
Z T
0
Z
z∈R∗
+
zδ1,0
(t,z)J1,0
(dt,dz)
+
Z T
0
Z
z∈R∗
+
z J0,1
(dt,dz) − J1,0
(dt,dz)

+
Z T
0
µY 1
t dt +
Z T
0
σY 1
t dWt
+
Z T
0
Z
z∈R∗
+
z J1,0
(dt,dz) − J0,1
(dt,dz)

=
Z T
0
Z
z∈R∗
+
zδ0,1
(t,z)J0,1
(dt,dz) +
Z T
0
Z
z∈R∗
+
zδ1,0
(t,z)J1,0
(dt,dz)
+
Z T
0
µY 1
t dt +
Z T
0
σY 1
t dWt. (1)
We see that the excess PnL can be decomposed into two parts: one corresponding to the accumulated
markups and the other one representing the deviation from the Hodl strategy reserves. In particular, it
contains jump terms and a Brownian term.16
## 3.2 Towards an efficient frontier
We now derive the optimal strategy in this framework with complete information for an objective function
that is not exactly a mean-variance one but a more practical one for us in order to use the tools of stochastic
optimal control theory. In fact, we only consider the variance of
RT
0
σY 1
t dWt which is a very reasonable
proxy for the variance of the excess PnL, as most of the risk comes from the Brownian term and not from
the drift or the jump terms.
More precisely, for each γ > 0,17
we introduce the following stochastic optimal control problem:
sup
(δ0,1,δ1,0)∈A
E
" T Z
0
(Z
z∈R∗
+

zδ0,1
(t,z)Λ0,1
(z,δ0,1
(t,z))1{q1
t−≥ z
St
}
+zδ1,0
(t,z)Λ1,0
(z,δ1,0
(t,z))1{q0
t−≥z}

m(dz) + µY 1
t −
γ
2
σ2
(Y 1
t )2
)
dt
#
.
This stochastic optimal control problem has 4 state variables and is therefore hardly tractable, even nu-
merically. Nevertheless, it is noteworthy that for moderate values of µ, the quadratic penalty provides
an incentive to keep the composition of the pool close to the initial one.18
Therefore, the no-depletion
constraints (which translated into indicators in the above formula) can be regarded as superfluous, and we
16As in the recent article [57], one can argue that the term
R T
0 µY 1
t dt +
R T
0 σY 1
t dWt =
R T
0 (q1
t − q1
0)dSt could be hedged, at
least theoretically.
17The parameter γ can be interpreted in two ways. One can see it as a risk aversion parameter or as a Lagrange multiplier,
like in the Markowitz framework.
18In pratice, the choice of γ should be contingent on the pool size and the level of liquidity. For example, a higher γ value
might be suitable when the pool size is smaller and/or liquidity demand is high. Conversely, a reduced γ could be adopted
when the pool is more substantial, and liquidity demand is lesser. Notably, the value of γ could be adjusted at each time of
liquidity provision/redemption. In this paper, as in most of the literature, we analyse the PnL of LPs between two times of
liquidity provision/redemption and γ is fixed.
8subsequently approximate the problem by removing the latter terms.19
In other words, we consider the
following modified objective function:
E
" T Z
0
(Z
z∈R∗
+

zδ0,1
(t,z)Λ0,1
(z,δ0,1
(t,z)) + zδ1,0
(t,z)Λ1,0
(z,δ1,0
(t,z))

m(dz) + µY 1
t −
γ
2
σ2
(Y 1
t )2
)
dt
#
.
It is noteworthy that this new problem only depends on one state variable, Y 1
, whose dynamic is Markovian.
It can be addressed with classical tools of stochastic optimal control. For that purpose, we introduce the
value function θ : [0,T] × R → R associated with this stochastic optimal control problem. It is well known
that θ solves the following Hamilton-Jacobi-Bellman equation:20

    
    
0 = ∂tθ(t,y) + µy (1 + ∂yθ(t,y)) − γ
2 σ2
y2
+ 1
2σ2
y2
∂2
yyθ(t,y)
+
R
R∗
+

zH0,1

z, θ(t,y)−θ(t,y−z)
z

+ zH1,0

z, θ(t,y)−θ(t,y+z)
z

m(dz),
θ(T,y) = 0,
(2)
where
H0,1
: (z,p) ∈ R∗
+ × R 7→ sup
δ≥−C
Λ0,1
(z,δ)(δ − p) and H1,0
: (z,p) ∈ R∗
+ × R 7→ sup
δ≥−C
Λ1,0
(z,δ)(δ − p).
Using the same ideas as in [43], we see that for i ̸= j ∈ {0,1}, the supremum in the definition of Hi,j
(z,p)
is reached at a unique δ̄i,j
(z,p) given by
δ̄i,j
(z,p) = (Λi,j
)−1
z,−∂pHi,j
(z,p)

where for all z, (Λi,j
)−1
(z,.) denotes the inverse of the function Λi,j
(z,.). Moreover, the markups that
maximize our modified objective function are obtained in the following form
δ0,1∗
(t,z) = δ̄0,1

z,
θ(t,Y 1
t−) − θ(t,Y 1
t− − z)
z

(3)
and
δ1,0∗
(t,z) = δ̄1,0

z,
θ(t,Y 1
t−) − θ(t,Y 1
t− + z)
z

. (4)
In practice, we proceed in two steps in order to solve the above stochastic optimal control problem. First,
we approximate numerically the solution to the HJB equation (2). For that purpose, we employ operator
splitting in order to deal separately with the differential terms and the non-local terms. For the differential
terms, we used an implicit scheme with Neumann conditions at the boundaries (±ȳ for ȳ chosen large). As
for the non-local terms, we used a discrete measure m and applied a Newton-Raphson algorithm to resolve
the implicit scheme at each time step (we assume that the AMM does not accept trades that go beyond
the boundaries ±ȳ). This approach proved to be computationally efficient. Once the value function θ is
approximated, the second step consists in plugging the approximation of θ into Equations (3) and (4) to
obtain the associated markups.
19In fact, in our numerical examples, we observe that, with the markups obtained using this approach, the reserves remain
positive at all times, i.e. the constraints are not binding.
20If continuous-time hedging with no friction was possible as in [57], the HJB equation would be Eq. (2) with µ = 0 and
σ = 0. This would lead to θ(t,y) = C(T −t) for some constant C independent of y and an optimal strategy independent of Y 1
t .
A softer way to consider the possibility to hedge could be, as in [17], to add a term supv v∂yθ−L(v) with L : v 7→ ψ|v|+η|v|1+ϕ
an execution cost function as in the optimal execution literature. In particular, the cost of liquidity and the need to cross the
spread would be modeled.
93.3 Numerical example
In what follows, we are going to illustrate the excess PnL associated with various strategies. In order to
illustrate our findings, we use throughout the paper a market simulator based on a discrete-time version of
the above framework, with the following realistic parameters:
• currency 0: USD, currency 1: ETH
• Initial exchange rate: 1600 USD per ETH
• Drift: µ = 0 day−1
• Volatility: σ = 1 year−1
2
• Single transaction size: 4000 USD (i.e. m is a Dirac mass)
• Intensity functions: λ0,1
= λ1,0
= 100 day−1
, α0,1
= α1,0
= −1.8, β0,1
= β1,0
= 1300 bps−1
(this
corresponds to an average of 86 trades per day when the proposed exchange rate always equals the
market exchange rate, 96 trades per day when the proposed exchange rate is the market exchange rate
improved by 10 bps, and 62 trades per day when the proposed exchange rate is the market exchange
rate worsen by 10 bps)
• Initial inventory: 2000000 USD and 1250 ETH
• Time horizon: T = 0.5 day.
We plot in Figure 1 the performance of AMMs following different strategies:
• Naive oracle-based strategies consisting in choosing δ0,1
and δ1,0
constant
• CPMM strategies with various transaction fees
• CFMM strategies as decribed in [35, 36]
• An oracle-based strategy documented in [23]
• Oracle-based strategies associated with the markups we derived from the above stochastic optimal
control problem.
We used Monte-Carlo simulations with 1000 trajectories. The (approximation of the) efficient frontier is pa-
rameterized by γ. Unsurprisingly, when γ is large (i.e. large risk aversion), the optimal strategy consists in
providing liquidity at a very high cost, and the resulting risk / return profile gets close to the origin (0,0). As
γ decreases, the efficient frontier describes an increasing curve that stops (unlike in the Markowitz case) at
γ = 0, at a point corresponding to (optimized) constant markups and to the maximum expected excess PnL.
Although this first graph corresponds to an idealized world where the market exchange rate is perfectly
known at all times (and where there is therefore no arbitrage), it sheds light on the intrinsic limitations
of (oracle-free) CFMMs compared to oracle-based AMMs. In our setting, CFMMs indeed underperform
optimal strategies, as expected, but also naive strategies, both in terms of expected excess PnL and in terms
of standard deviation. It is noteworthy that implementing a hedging strategy for CFMMs would reduce the
standard deviation but leave negative expected excess PnLs in our setting.
These results, however need to be qualified. Naive strategies with constant transaction fees lack of robust-
ness: in the presence of an arbitrage opportunity due to information asymmetry or mispricing, the pool
would indeed be depleted from one of the two assets! In the next section, we show that our optimized
oracle-based strategies are, however, robust to misspecifications, lags in price oracles and the introduction
of adverse selection.
100.00000 0.00005 0.00010 0.00015 0.00020 0.00025 0.00030 0.00035
StandarddeviationofexcessPnL(inUSD)after0.5day
0.00025
0.00020
0.00015
0.00010
0.00005
0.00000
0.00005
Mean of excess PnL (in USD) after 0.5 day
22
6
18
10
2
26
14
6
14
22
10
26
18
2
a
e
c
b
d
3e-1
1e-1
1e-2
1e-3 1e-4 0 2e-5
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 1: Performance of strategies in terms of mean / standard deviation of excess PnL. In blue: naive strategies
with constant δ0,1
,δ1,0
(the number next to the point corresponds to the value of δ0,1
and δ1,0
in bps). In grey:
CPMM with fees (the numbers next to the points correspond to the transaction fees in bps). In pink: CFMM without
market exchange rate oracle as described in [35, 36] for different sets of realistic parameters. In purple (⋆): AMM
with market exchange rate oracle as described in [23]. In green: approximation of the efficient frontier, obtained
using the optimal markups for different levels of risk aversion (the numbers next to the points correspond to the
value of γ).
## 4 Beyond the idealized case: misspecification, incomplete informa-
tion and introduction of adverse selection
In practice, an AMM can be designed with some values of the drift, volatility and liquidity parameters, but
different values may realize. Furthermore, the drift is highly unpredictable, volatility is not constant but
clustered, while liquidity varies depending on market conditions.21
Consequently, it is of the utmost impor-
tance to study the impact of parameters misspecification on the risk / return profile of allegedly efficient
strategies, i.e. what happens if the realized drift, volatility and liquidity parameters do not match those
used in the smart contract.
In Figure 2, we consider the case where the actual liquidity parameters λ0,1
and λ1,0
one inputs in the
simulator are the same as in the above section, but the liquidity parameters of the strategy are set to
λ0,1
= λ1,0
= 50 day−1
. We compare the results to the efficient frontier and observe that the misspecified
strategies remain almost exactly on the efficient frontier, with a shift toward higher risk aversions. Similarly,
we consider in Figure 3 the case where the actual volatility one inputs in the simulator is equal to 100%
(σ = 1 year−1
2 ) as above, but the volatility used to compute the strategy is 120% (σ = 1.2 year−1
2 ). We
compare the results to the efficient frontier and observe the same phenomenon as for liquidity parameters.
These results can be explained theoretically. Indeed, in the absence of drift and ignoring the Laplacian
term 1
2σ2
y2
∂2
yyθ(t,y), it can be shown that when λ0,1
= λ1,0
=: λ, misspecifying λ or σ has the same effect
as choosing another γ, because the solution to Equation (2) depends only on the ratio λ
γσ2 . This is in line
with the observation made in [18].
21For models taking account of the stochastic nature of volatility and liquidity, see [22].
110.000000 0.000025 0.000050 0.000075 0.000100 0.000125 0.000150 0.000175
StandarddeviationofexcessPnL(inUSD)after0.5day
0
1
2
3
4
5
6
7
Mean of excess PnL (in USD) after 0.5 day
1e 5
3e-1
1e-1
1e-2
1e-3
1e-4
2e-5 0
3e-1
1e-1
1e-2
1e-3
1e-4
0 2e-5
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 2: Performance of strategies in terms of mean / standard deviation of excess PnL when λ0,1
and λ1,0
are
misspecified. In green: efficient frontier, obtained with the efficient strategy for different levels of risk aversion with
complete information. In pink: performance of the misspecified strategy obtained with λ0,1
= λ1,0
= 50 day−1
for
different levels of risk aversion. The numbers next to the points correspond to the value of γ.
0.000000 0.000025 0.000050 0.000075 0.000100 0.000125 0.000150 0.000175
StandarddeviationofexcessPnL(inUSD)after0.5day
0
1
2
3
4
5
6
7
Mean of excess PnL (in USD) after 0.5 day
1e 5
3e-1
1e-1
1e-2
1e-3
0
1e-4
2e-5
3e-1
1e-1
1e-2
1e-3
1e-4
0 2e-5
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 3: Performance of strategies in terms of mean / standard deviation of excess PnL when σ is misspecified.
In green: efficient frontier, obtained with the efficient strategy for different levels of risk aversion with complete
information. In pink: performance of the misspecified strategy obtained with σ = 1.2 year− 1
2 for different levels of
risk aversion. The numbers next to the points correspond to the value of γ.
12Finally, we consider in Figure 4 the case where the parameters of the strategy correspond to those used
in the previous section with no drift, but the drift one inputs to compute the strategy is equal to 40%
(µ = 0.4 year−1
). We compare the results to the efficient frontier and observe that the misspecified strate-
gies remain close to the efficient frontier. It is noteworthy that we did not compute the point corresponding
to no risk aversion (γ = 0) because the optimal strategy of any risk-neutral agent with a view on the drift
is to get an infinite directional position: here, this means that the AMM should sell one of the two assets
to buy the other.
0.000000 0.000025 0.000050 0.000075 0.000100 0.000125 0.000150 0.000175
StandarddeviationofexcessPnL(inUSD)after0.5day
0
1
2
3
4
5
6
7
Mean of excess PnL (in USD) after 0.5 day
1e 5
3e-1
1e-1
1e-2
1e-3
2e-5
1e-4
3e-1
1e-1
1e-2
1e-3
1e-4
0 2e-5
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 4: Performance of strategies in terms of mean / standard deviation of excess PnL when µ is misspecified.
In green: efficient frontier, obtained with the efficient strategy for different levels of risk aversion with complete
information. In pink: performance of the misspecified strategy obtained with µ = 0.4 year−1
for different levels of
risk aversion. The numbers next to the points correspond to the value of γ.
Misspecification can be a problem, but the main problem faced by AMMs is adverse selection. It is im-
portant to recall that the main problem of CFMMs is that value is extracted by LTs. Of course, in the
above model with complete information, the market exchange rate is known at all times and adverse selec-
tion does not exist. To introduce adverse selection, we assume that the AMM cannot observe the market
exchange rate perfectly but rather with a lag, while the demand curves of LTs are centered on the right
(current) price. We show the results in Figure 5 and clearly see that performances move away from the effi-
cient frontier as the delay increases. However, the performance remains good for reasonable values of the lag.
Partial information regarding the market exchange rate can sometimes result in arbitrage opportunities for
LTs. These arbitrage opportunities are already taken into account in the demand curves modeled by the
intensity functions, though not in a systematic way. In other words, if a price appears to be very good
for LTs, the probability that a transaction occurs is very high in our model. In practice however, there
exists a category of agents who systematically exploit arbitrage opportunities: they trade with the AMM
until arbitrage opportunities disappear.22
The above analysis regarding market exchange rate oracles can
then only be complete if we take into account these arbitrageurs. In practice, arbitrageurs can represent a
22Of course, these trades come with a cost for arbitrageurs, who still have to pay the fees associated with a swap on an
other (centralized) exchange. In our case, we assume a proportional cost of 7.5 bps. Moreover, note that in our simulations,
arbitrageurs trade a size that is optimal for them – and thus does not necessarily correspond to the size of the other trades.
13significant volume as soon as the market exchange rate moves outside of the spread offered by the AMM,
and we compare in Figure 6 the performance of the efficient strategies in the presence of a 10-second delayed
oracle and with arbitrageurs. We also provide in Figure 7 a complete risk / return analysis of the different
strategies studied in this paper, in the presence of arbitrageurs and incomplete information (for those relying
on oracles).
0.00000 0.00005 0.00010 0.00015 0.00020 0.00025
StandarddeviationofexcessPnL(inUSD)after0.5day
0.00010
0.00005
0.00000
0.00005
Mean of excess PnL (in USD) after 0.5 day
3e-1
1e-1
1e-2
1e-3
1e-4 0 2e-5
1e-2
1e-3
1e-4 2e-5
0
1e-2
1e-3
1e-4
0
2e-5
3e-1 1e-1 1e-2 1e-3 0 1e-4 2e-5
1e-2
1e-3
1e-4
2e-5 0
3e-1
1e-1
1e-4
1e-3
2e-5
0
1e-2
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 5: Performance of the efficient strategies in terms of mean / standard deviation of excess PnL, obtained by
playing the efficient strategies for different levels of risk aversion with different oracle delays: complete information
(in green), 10-second delay (in yellow), 30-second delay (in blue), 1-minute delay (in purple), 5-minute delay (in
pink), 30-minute delay (in red). The number next to the point corresponds to the value of γ.
What we observe in Figure 6 is that the presence of arbitrageurs who systematically and continuously
keep the offered exchange rate in a narrow range around the market exchange rate tends to increase the
expected excess PnL and reduce risk. This may sound counter-intuitive, but it comes from the fact that
those arbitrageurs actually “protect” the AMM against trades with traditional LTs at prices even further
away from the market exchange rate (this could be related to the findings of [58]). Of course, the efficient
frontier documented in Figure 6 does not take into account this additional flow. Building a model that
would internalize both delayed oracles and (systematic) arbitrageurs and allow to derive optimal strategies
in this context remains an open problem.
Figure 7 confirms that the use of a market exchange rate oracle, even delayed, really makes a difference
in terms of risk / return profile. Nevertheless, it is important to note that introducing an oracle creates
a fundamentally different protocol which relies on external data. One of the issues with oracles (as noted
in [65] and then in [55]), is that they could be manipulated. Using an oracle in an AMM protocol should
therefore be performed carefully in order for LPs to really achieve the promised improved risk-adjusted
performance (for a detailed explanation of the next generation of decentralized oracles see [25]).
140.000000 0.000025 0.000050 0.000075 0.000100 0.000125 0.000150 0.000175
StandarddeviationofexcessPnL(inUSD)after0.5day
0
1
2
3
4
5
6
7 Mean of excess PnL (in USD) after 0.5 day
1e 5
3e-1
1e-1
1e-2
1e-3
1e-4
0 2e-5
1e-2
1e-3
1e-4
2e-5
0
1e-4
2e-5
1e-3
1e-2
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 6: Performance of the previous optimal strategy in terms of mean / standard deviation of excess PnL. In
green: efficient frontier, obtained by playing the optimal strategy for different levels of risk aversion with complete
information. In yellow: performance of the same optimal strategy for different levels of risk aversion with a lagged
oracle. In orange: performance of the same optimal strategy for different levels of risk aversion with a lagged oracle
and with arbitrage flow. The number next to the point corresponds to the value of γ.
0.00000 0.00005 0.00010 0.00015 0.00020 0.00025 0.00030 0.00035
StandarddeviationofexcessPnL(inUSD)after0.5day
0.00010
0.00005
0.00000
0.00005
Mean of excess PnL (in USD) after 0.5 day
a
b
c
d
e
22
26
18
10
6
14
2
3e-1
1e-1
1e-4 2e-5
1e-3
1e-2
StatisticsofexcessPnL(inUSD)after0.5dayfordifferentLPstrategies
Figure 7: Performance of strategies in terms of mean / standard deviation of excess PnL with a lagged oracle and
with arbitrage flow. In grey: CPMM with fees. In pink: CFMM without market exchange rate oracle as described in
[35, 36] for different sets of realistic parameters. In purple (⋆): AMM with market exchange rate oracle as described
in [23]. In orange: performance of the efficient strategies for different levels of risk aversion.
155 Conclusion
In this paper, we provide an analysis of AMMs in a mean / standard deviation framework inspired by both
Markowitz’ modern portfolio theory and the recent literature on optimal market making. We show that
traditional CFMMs (including CPMMs) with different levels of transaction fees perform poorly relative to
the theoretical efficient frontier and very often exhibit negative excess PnL. We also show that allowing
an AMM to get information about the current market exchange rate (through an oracle) can significantly
improve performance. Such an oracle-based AMM would quote a bid / ask spread around the current
market exchange rate based on its reserves. This design significantly reduces the volatility of the excess
PnL while delivering a positive excess PnL on average. Our results are robust to the presence of a lagged
oracle and to the introduction of adverse selection by LTs and arbitrageurs. Nevertheless, while introducing
an oracle in the AMM design can significantly improve the risk-adjusted performance of LPs, it comes at
the cost that the oracle itself should be carefully designed to avoid introducing additional attack vectors.
Statement and acknowledgment
The research carried out for this paper benefited from the support of the Research Program “Decentralized
Finance and Automated Market Makers”, a Research Program under the aegis of Institut Europlace de
Finance, in partnership with Apesu / Swaap Labs.
The content of this article has been presented at several conferences and seminars: BlockSem seminar (Paris,
France), FFEA 2nd Spring Workshop on FinTech (Ghent, Belgium), The 3rd workshop on Decentralized
Finance (Bol, Croatia), DeFOx seminar (Oxford, UK), Euro Working Group on Commodities and Financial
Modelling meeting (Rome, Italy), SIAM Conference on Financial Mathematics and Engineering (Philadel-
phia, USA), AMaMeF conference (Bielefeld, Germany), Florence-Paris Workshop on Mathematical Finance
(Florence, Italy), Frontiers in Quantitative Finance Seminar (London, UK), Séminaire Bachelier (Paris,
France), 16th Financial Risks International Forum (Paris, France), London-Paris Bachelier Workshop on
Mathematical Finance (London, UK), Blockchain@X-OMI Workshop on Blockchain and Decentralized Fi-
nance (Palaiseau, France), Apéro DeFi (Paris, France). The discussions that took place during these events
have substantially contributed to improving the presentation of our results.
We extend our sincere gratitude to the two anonymous referees for their insights and constructive feedback,
which greatly enhanced the quality of our article.
References
[1] Frédéric Abergel, Côme Huré, and Huyên Pham. Algorithmic trading in a microstructural limit order
book model. Quantitative Finance, 20(8):1263–1283, 2020.
[2] Hayden Adams. Uniswap whitepaper. 2018.
[3] Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core, 2020. 2020.
[4] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap v3 core,
2021.
[5] Yakov Amihud and Haim Mendelson. Dealership market: Market-making with inventory. Journal of
Financial Economics, 8(1):31–53, 1980.
[6] Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra, and Stephen Boyd. Constant function
market makers: Multi-asset trades via convex optimization. arXiv preprint arXiv:2107.12484, 2021.
[7] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market makers. In
Proceedings of the 2nd ACM Conference on Advances in Financial Technologies, pages 80–91, 2020.
16[8] Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog? Curvature and
market making. arXiv preprint arXiv:2012.08040, 2020.
[9] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. arXiv preprint
arXiv:2103.14769, 2021.
[10] Guillermo Angeris, Alex Evans, Tarun Chitra, and Stephen Boyd. Optimal routing for constant function
market makers. In Proceedings of the 23rd ACM Conference on Economics and Computation, pages
115–128, 2022.
[11] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An analysis of
Uniswap markets. arXiv preprint arXiv:1911.03380, 2019.
[12] Jun Aoyagi. Liquidity provision by automated market makers. Available at SSRN 3674178, 2020.
[13] Jun Aoyagi and Yuki Ito. Coexisting Exchange Platforms: Limit Order Books and Automated Market
Makers. In Limit Order Books and Automated Market Makers. 2021.
[14] Marco Avellaneda and Sasha Stoikov. High-frequency trading in a limit order book. Quantitative
Finance, 8(3):217–224, 2008.
[15] Bastien Baldacci, Philippe Bergault, and Olivier Guéant. Algorithmic market making for options.
Quantitative Finance, 21(1):85–97, 2021.
[16] Andrea Barbon, Angelo Ranaldo. On the quality of cryptocurrency markets: Centralized versus de-
centralized exchanges. arXiv preprint arXiv:2112.07386, 2021.
[17] Alexander Barzykin, Philippe Bergault, and Olivier Guéant. Algorithmic market making in foreign
exchange cash markets: a new model for active market makers. Mathematical Finance, 33(1):41–79,
2021.
[18] Alexander Barzykin, Philippe Bergault, and Olivier Guéant. Market-making by a foreign exchange
dealer. Risk Magazine, August 2022.
[19] Alexander Barzykin, Philippe Bergault, and Olivier Guéant. Dealing with multi-currency inventory
risk in foreign exchange cash markets. Risk Magazine, March 2023.
[20] Philippe Bergault, David Evangelista, Olivier Guéant, and Douglas Vieira. Closed-form approximations
in multi-asset market making. Applied Mathematical Finance, 28(2):101–142, 2021.
[21] Philippe Bergault and Olivier Guéant. Size matters for otc market makers: general results and dimen-
sionality reduction techniques. Mathematical Finance, 31(1):279–322, 2021.
[22] Philippe Bergault, Louis Bertucci, David Bouba, Olivier Guéant, Julien Guilbert. Enhancing oracle-
based automated market makers: advanced price and liquidity models. Working paper, 2023.
[23] David Bouba. Swaap.finance: Introducing the matrix-mm. 2021.
[24] Nassib Boueri. G3M impermanent loss dynamics. arXiv preprint arXiv:2108.06593, 2021.
[25] Lorenz Breidenbach, Christian Cachin, Benedict Chan, Alex Coventry, Steve Ellis, Ari Juels, Farinaz
Koushanfar, Andrew Miller, Brendan Magauran, Daniel Moroz, et al. Chainlink 2.0: Next steps in the
evolution of decentralized oracle networks. Chainlink Labs, 2021.
[26] Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges. arXiv
preprint arXiv:2103.08842, 2021.
[27] Agostino Capponi, Garud Iyengar, and Jay Sethuraman. Decentralized Finance: Protocols, Risks, and
Governance. Foundations and Trends in Privacy and Security, 5(3):144–188, 2023.
[28] Álvaro Cartea, Ryan Donnelly, and Sebastian Jaimungal. Algorithmic trading with model uncertainty.
SIAM Journal on Financial Mathematics, 8(1):635–671, 2017.
17[29] Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralised finance and automated market mak-
ing: Execution and speculation. Available at SSRN, 2022.
[30] Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralised finance and automated market mak-
ing: predictable loss and optimal liquidity provision. Available at SSRN, 2022.
[31] Álvaro Cartea, Sebastian Jaimungal, and José Penalva. Algorithmic and high-frequency trading. Cam-
bridge University Press, 2015.
[32] Álvaro Cartea, Sebastian Jaimungal, and Jason Ricci. Buy low, sell high: A high frequency trading
perspective. SIAM Journal on Financial Mathematics, 5(1):415–444, 2014.
[33] Joseph Clark. The replicating portfolio of a constant product market. Available at SSRN 3550601,
2020.
[34] Joseph Clark. The replicating portfolio of a constant product market with bounded liquidity. Available
at SSRN, 2021.
[35] Michael Egorov. Stableswap – efficient mechanism for stablecoin liquidity. 2019.
[36] Michael Egorov. Automatic market-making with dynamic peg. 2021.
[37] Alex Evans. Liquidity provider returns in geometric mean markets. arXiv preprint arXiv:2006.08806,
2020.
[38] Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric mean market makers. In
International Conference on Financial Cryptography and Data Security, pages 65–79. Springer, 2021.
[39] Pietro Fodra and Huyên Pham. High frequency trading and asymptotics for small risk aversion in a
markov renewal model. SIAM Journal on Financial Mathematics, 6(1):656–684, 2015.
[40] Pietro Fodra and Huyên Pham. Semi-markov model for market microstructure. Applied Mathematical
Finance, 22(3):261–295, 2015.
[41] Robin Fritsch, Samuel Käser, and Roger Wattenhofer. The economics of automated market makers.
arXiv preprint arXiv:2206.04634, 2022.
[42] Olivier Guéant. The Financial Mathematics of Market Liquidity: From optimal execution to market
making, volume 33. CRC Press, 2016.
[43] Olivier Guéant. Optimal market making. Applied Mathematical Finance, 24(2):112–154, 2017.
[44] Olivier Guéant, Charles-Albert Lehalle, and Joaquin Fernandez-Tapia. Dealing with the inventory risk:
a solution to the market making problem. Mathematics and Financial Economics, 7(4):477–507, 2013.
[45] Olivier Guéant and Iuliia Manziuk. Deep reinforcement learning for market making in corporate bonds:
beating the curse of dimensionality. Applied Mathematical Finance, 26(5):387–452, 2019.
[46] Fabien Guilbaud and Huyen Pham. Optimal high-frequency trading with limit and market orders.
Quantitative Finance, 13(1):79–94, 2013.
[47] Fabien Guilbaud and Huyên Pham. Optimal high-frequency trading in a pro rata microstructure with
predictive information. Mathematical Finance, 25(3):545–575, 2015.
[48] Joel Hasbrouck, Thomas J. Rivera, and Fahad Saleh. The need for fees at a dex: How increases in fees
can increase dex trading volume. Available at SSRN, 2022.
[49] Thomas Ho and Hans R Stoll. Optimal dealer pricing under transactions and return uncertainty.
Journal of Financial Economics, 9(1):47–73, 1981.
[50] Thomas SY Ho and Hans R Stoll. The dynamics of dealer markets under competition. The Journal of
Finance, 38(4):1053–1074, 1983.
18[51] Charles-Albert Lehalle and Sophie Laruelle. Market microstructure in practice. World Scientific, 2018.
[52] Alfred Lehar and Christine A. Parlour. Decentralized exchanges. Technical report, Working paper,
2021.
[53] Alex Lipton and Artur Sepp. Automated Market-Making for Fiat Currencies. arXiv preprint
arXiv:2109.12196, 2021.
[54] Stefan Loesch, Nate Hindman, Mark B. Richardson, and Nicholas Welch. Impermanent loss in uniswap
v3. arXiv preprint arXiv:2111.09192, 2021.
[55] Torgin Mackinga, Tejaswi Nadahalli, and Roger Wattenhofer. Twap oracle attacks: Easier done than
said? Cryptology ePrint Archive, 2022.
[56] Fernando Martinelli and Nikolai Mushegian. A non-custodial portfolio manager, liquidity provider, and
price sensor. 2019.
[57] Jason Milionis, Ciamac Moallemi, Tim Roughgarden, and Antony Lee Zhang Automated market
making and loss-versus-rebalancing. 2023.
[58] Jason Milionis, Ciamac Moallemi, Tim Roughgarden. Automated Market Making and Arbitrage Profits
in the Presence of Fees. arXiv preprint arXiv:2305.14604, 2023.
[59] Vijay Mohan. Automated market makers and decentralized exchanges: a DeFi primer. Financial
Innovation, 8(1):1–48, 2022.
[60] Michael Neuder, Rithvik Rao, Daniel J Moroz, and David C Parkes. Strategic liquidity provision in
uniswap v3. arXiv preprint arXiv:2106.12033, 2021.
[61] Maureen O’hara and George S Oldfield. The microeconomics of market making. Journal of Financial
and Quantitative analysis, 361–376, 1986.
[62] Andreas Schrimpf and Vladyslav Sushko. FX trade execution: complex and highly fragmented. BIS
Quarterly Review, December, 2019.
[63] Andreas Schrimpf and Vladyslav Sushko. Sizing up global foreign exchange markets. BIS Quarterly
Review, December, 2019.
[64] Hans R Stoll. Market microstructure. In Handbook of the Economics of Finance, volume 1, 553–604.
2003.
[65] Kevin Tjiam, Rui Wang, Huanhuan Chen, and Kaitai Liang. Your smart contracts are not secure:
Investigating arbitrageurs and oracle manipulators in ethereum. In CYSARM@ CCS, 25–35, 2021.
19