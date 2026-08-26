---
sha256: 4d4afb35a7e5c303a0af628dc5b398225320401a2f79c25c6f8bff09dd006d09
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 63969
---
arXiv:1807.09873v2 [cs.LO] 10 Aug 2018
Formalizing the Cox-Ross-Rubinstein pricing of European
derivatives in Isabelle/HOL
Mnacho Echenim∗1,2
, Hervé Guiol†1,3
, and Nicolas Peltier‡1,2
1
Univ. Grenoble Alpes, F-38000 Grenoble France
2
CNRS, LIG
3
CNRS, TIMC
July 2018
Abstract
We formalize in the proof assistant Isabelle essential basic notions and results in financial
mathematics. We provide generic formal definitions of concepts such as markets, portfolios,
derivative products, arbitrages or fair prices, and we show that, under the usual no-arbitrage
condition, the existence of a replicating portfolio for a derivative implies that the latter admits
a unique fair price. Then, we provide a formalization of the Cox-Rubinstein model and we
show that the market is complete in this model, i.e., that every derivative product admits a
replicating portfolio. This entails that in this model, every derivative product admits a unique
fair price.
## 1 Introduction
The basic securities that are traded on financial markets –such as shares on the equity market or
bonds on the fixed-income market– have a price that is submitted to the law of supply and demand,
and depends on the needs of financial actors. Things are not that simple for all securities traded on
financial markets, and in particular, determining the price of so-called derivative products can be a
far from trivial task. A derivative product is a security the value of which depends on that of one
or several underlying securities; a typical example is a vanilla call on a share, which gives its holder
the right, but not the obligation, to buy the share on a predetermined date at a predetermined
price. Obviously, the price of a derivative product should depend on that of its underlyings, but
what exactly is this dependency? In fact, is there even a unique price for any derivative? An
intuitive answer to the second question is that the price of a derivative should be unique: if this
were not the case, an investor could buy the derivative at the lower price and simultaneously sell it
at the higher price, making a profit without investing any money or taking any risks. The investor
would have exploited what is called an arbitrage opportunity and although such opportunities do
exist on financial markets, they are exploited by financial actors called arbitragists and tend to
disappear quickly. This is the reason why many results in quantitative finance rely on a no-arbitrage
hypothesis. Such a hypothesis also permits to provide a more precise definition of what a price for
a derivative should be: this should be any value that is neither so high as to induce an arbitrage
opportunity for the seller of the derivative, nor so low as to induce an arbitrage opportunity for the
buyer. Any price satisfying these conditions is called a fair price for the derivative.
∗Mnacho.Echenim@univ-grenoble-alpes.fr
†Herve.Guiol@univ-grenoble-alpes.fr
‡Nicolas.Peltier@univ-grenoble-alpes.fr
1One of the most important results in financial mathematics was the proof by Black, Scholes
and Merton [2, 11] that, in the so-called Black-Scholes model of an equity market, every derivative
admits a unique price, along with a formula permitting to compute this price, either numerically
or explicitly. Along with the no-arbitrage hypothesis, the authors assume that (1) the market is
frictionless, meaning that securities can be bought or sold with no transaction costs, and (2) investors
can buy and sell any amount of the securities, meaning that the quantity of a security withheld in a
portfolio can be any real number, even a negative one if the security has been sold short (i.e., sold by
an investor not owning the asset). Since then, there have been a wide variety of mathematical models
devised for the pricing of derivative products, adapting the hypotheses of the Black-Scholes-Merton
model or modeling other markets, such as the foreign-exchange or commodities markets.
A discrete-time model of an equity market was introduced in 1979 by Cox, Ross and Rubinstein
[4]. This model is based on hypotheses similar to those of the Black-Scholes-Merton model, in which
time is continuous, and can actually be viewed as a discrete-time approximation of this model. The
complexity of evaluating the price of a derivative in this model implies that it is not frequently used
for the pricing of simpler derivatives. But several financial institutions still rely on this model for the
pricing of more complex derivative, such american options, which can be exercised by their buyer
at any time until a given maturity.
In this paper, we present a formalization in Isabelle/HOL [12] of (1) fair prices for derivative
products on equity financial markets, (2) the proof of their uniqueness when a replicating portfolio
exists in a fair market, and (3) an algorithm to compute fair prices under a risk-neutral probabil-
ity space. We also formalize the Cox-Ross-Rubinstein model and prove that in this model, every
derivative admits a replicating portfolio, i.e., a portfolio with a value at maturity identical to the
payoff of the derivative. The work presented here strictly subsumes the formalization carried out
in [6], which was mainly devoted to the proof that in the model of a market defined by Cox, Ross
and Rubinstein [4], every derivative product admits a replicating portfolio. The results presented
in this paper can be found in many financial mathematics textbooks, with one main difference: in
general, the results are presented by considering an arbitrary derivative with a given maturity T,
and taking the finite probability space with outcomes consisting of all sequences of T coin tosses.
Here we formalize a setting in which any derivative can be priced, and use Isabelle’s codatatypes
[3] to consider non-denumerable probability space with outcomes consisting of all infinite streams of
coin tosses.
Related work. Many results related to financial mathematics have already been formalized in
Isabelle. Large parts of Probability theory have been formalized, building up on [7]; and results and
concepts frequently used in financial mathematics such as Markov processes or the Central Limit
Theorem are also available in Isabelle [8, 1]. To the best of our knowledge, other than [6], there has
been no formalization of financial mathematics.
Organization. This paper is organized as follows. Section 2 contains basic financial notions as well
as a summary of the notions from Probality theory that will be used throughout the paper and are
already formalized in Isabelle. In Section 3, we define equity markets in discrete time, introducing the
notions of portfolios and their values, as well as trading strategies which represent the only reasonable
portfolios that can be constructed. Arbitrage opportunities are introduced in Section 4, they permit
to define the notion of af air price for a derivative, and we show that if a derivative admits a portfolio
whose value at maturity is identical to the derivative payoff, then the fair price for this derivative is
unique. Section 5 is devoted to the definition of risk-neutral probability spaces, which are based on
the existence of martingales, and permit to represent the fair price of a derivative as an expectation.
In Section 6, these results are applied to the Cox-Ross-Rubinstein model, and an explicit formula
for computing the fair price of any derivative is provided. Section 7 contains a detailed illustrative
example, showing how in the Cox-Ross-Rubinstein model, a replicating portfolio is computed, and
the fair price of a derivative is obtained. The theory files described in this paper are available on
the Archive of Formal Proofs, at https://www.isa-afp.org/entries/DiscretePricing.html.
22 Preliminary notions
## 2.1 Some notions in finance
We begin by briefly reviewing some basic standard definitions about equity markets. This treatment
is mainly based on Shreve [13], Vol. 1. An equity market consists of a set of assets or securities
that can be traded at prices that evolve with time. An actor trading on different assets will own
a portfolio containing different quantities of the traded assets. These quantities are real numbers
that can be positive if the corresponding asset was bought, or negative if the asset was the object
of a short sale. A portfolio can be static if its composition is fixed once and for all, and dynamic
if its composition can evolve over time. Clearly, almost all portfolios on markets are dynamic ones.
Among the dynamic portfolios, those of a particular interest are the trading strategies; these are the
dynamic portfolios for which the composition at time t is a random variable that only depends on
the available information up to time t; trading strategies are thus meant to represent portfolios for
which no insider trading can occur. A portfolio in which cash is only invested at inception, after
what all future trades are financed by buying or selling assets in the portfolio is a self-financing
portfolio. An arbitrage represents a “free lunch”: it is defined as a self-financing trading strategy
with a 0 initial investment that offers a risk-free possibility of making a profit. A market is viable if
it offers no arbitrage opportunities.
Some of the securities that can be traded are basic securities, such as bonds, which are generally
assumed to be risk-free assets, or stocks, which are risky assets. Others are derivative securities,
with payoffs (the amount of cash that should be exchanged at exercise time) that depend on the
evolution and values of underlying securities. On the equity market, these derivative securities often
have an expiry date, or maturity, after which they are no longer valid. An option, for instance,
is a derivative that can be viewed as an insurance: when it is exercised, it gives the beholder the
right—but not the obligation—to trade an instrument at a given price. In this paper we will focus
on European options, which can only be exercised at the maturity, see, e.g., [10]. The best-known
options are the call and the put options. A call (resp. put) option gives its beholder the right, at
time T, to buy (resp. sell) the underlying security at the strike price K, thus guaranteeing that there
is a cap (resp. floor) on the price that will be payed at a future time for the security. In practice,
when at time T the price of the underlying security, denoted by ST , is greater than the strike price
K, the buyer of a call receives ST − K from the seller of the option, and buys the instrument on
the market for ST , in effect only spending K to obtain the instrument. When ST < K, the seller
of the call does not deliver any cash, as the buyer will directly buy the instrument on the market
for a value that is less than K. Thus, a call option is a derivative that, at maturity T, delivers a
payoff of (ST − K)+ def
= max(0,ST − K). In a similar way, a put option delivers at time T a payoff
of (K − ST )+
.
Once a derivative is sold, the seller is meant to invest the cash by creating a trading strategy, in
order to be able to pay the required amount of money when the derivative is exercised. A natural
question is the following: how much should a buyer be expected to pay for a given derivative?
Ideally, this price should not be so low that the buyer could make a riskless profit, and it should not
be so high that the seller could make a riskless profit. As we will see, the answer to this question
is quite straightforward when the seller is capable of creating a trading strategy that generates at
exercise time exactly the payoff of the derivative, i.e., of creating a replicating portfolio. In this case,
the fair price for the derivative is the investment needed to initiate the trading strategy. A market
is complete if every derivative admits a replicating portfolio; in a complete market, every derivative
admits a fair price.
The construction of replicating portfolios is clearly not straightforward, and it may not be guar-
anteed that such portfolios actually exist. An answer to the existence of replicating portfolios for
European options was given by Fischer Black and Myron Scholes, and by Robert Merton in [2, 11],
in the so-called Black-Scholes-Merton model. They consider a risky asset, the stock, that pays no
dividends and whose evolution is described by a geometric Brownian motion (see, e.g., [10]), and
showed that, under some simple market hypotheses such as identical bidding and asking prices for
3the stock and the absence of arbitrage opportunities, a European option over a single stock can be
replicated with a portfolio consisting of the stock and a cash account. Their proof is based on the
construction of a dynamic portfolio, the composition of which changes continuously (it is called a
delta-neutral portfolio), which is guaranteed to replicate the option under consideration. Along with
the construction of replicating portfolios, the authors provide a formula that permits to compute
the fair price of any European option.
The Cox-Ross-Rubinstein model [4] that we consider in Section 6 of this paper can be viewed as
an approximation of the Black-Scholes-Merton model to the case where time is no longer continuous
but discrete; i.e., to the case where securities are only traded at discrete times 1,2,...,n,... In this
setting, the evolution of the stock price is described by a geometric random walk, which can be
viewed as a discrete version of the geometric Brownian motion: if the stock has a price s at time n,
then at time n + 1, this price is either u.s (upward movement) or d.s (downward movement). The
probability of the price going up is always 0 < p < 1, and the probability of it going down is 1 − p.
The authors show that under these conditions, the market is complete: every derivative admits a
replicating portfolio.
## 2.2 Probability theory in Isabelle: existing notions
A large part of the formalization of measure and probability theory in Isabelle was carried out by
Hölzl [7] and is now included in Isabelle’s distribution. We briefly recap some of the notions that will
be used throughout the paper and the way they are formalized in Isabelle. We assume the reader
has knowledge of fundamental concepts of measure and probability theory; any missing notions can
be found in Durrett [5] for example. For the sake of readability, in what follows, a term F t will
sometimes be written Ft.
Probability spaces are particular measure spaces. A measure space over a set Ω consists of a
function µ that associates a nonnegative number or +∞ to some subsets of Ω. The subsets of Ω
that can be measured are closed under complement and countable unions and make up a σ-algebra.
The σ-algebra generated by a set C ⊆ 2Ω
is the smallest σ-algebra containing C; it is denoted in
Isabelle by sigma-sets Ω C.
The functions µ that measure the elements of a σ-algebra are positive and sigma additive1
: if
A ⊆ 2Ω
is a σ-algebra and the sequence (Ai)i∈N consists of pairwise disjoint elements in A, then
µ(
S
i∈N Ai) =
P
i∈N µ(Ai). In Isabelle, measure spaces are defined as follows (where R denotes
R ∪ {−∞,+∞} and B = {⊥,⊤}):
measure-space :: αset → αsetset → αset → R

→ B
measure-space Ω A µ ⇔
σ-algebra Ω A ∧ positive A µ ∧ countably-additive A µ
A measure type is defined by fixing the measure of non-measurable sets to 0:
typedef α measure = {(Ω,A,µ)| (∀A / ∈ A.µA = 0) ∧ measure-space ΩAµ}
If M is an element of type α measure, then the corresponding space, σ-algebra and measure are
respectively denoted by ΩM, AM and µM.
The definition of a measure type may seem surprising, especially to mathematicians, because
setting the measure of a set not in A to 0 can be counter-intuitive: there is for example no relationship
between elements with a measure 0 and negligible elements on a measure space. The reason for this
is that in Isabelle, a function cannot be partial and it is necessary to define the measure function on
every subset of ΩM; the choice of setting these measures to 0 is arbitrary but does not entail any
contradiction.
We can associate to any σ-algebra C ⊆ 2Ω
a measure space with a uniformly null measure:
Υ(C)
def
= (Ω,C,(λx.0)). In Isabelle, this measure space is denoted by sigma Ω C.
1This property is also called countable additivity in the literature.
4A function between two measurable spaces is measurable if the preimage of every measurable set
is measurable. In Isabelle, sets of measurable functions are defined as follow:
measurable :: αmeasure → β measure → (α → β)set
measurable M N µ =

f : ΩM → ΩN ∀A ∈ AN .f−1
(A) ∩ ΩM ∈ AM
Probability measures are measure spaces on which the measure of Ω is finite and equal to 1.
In Isabelle, they are defined by a locale; this allows one to delimit a range in which the existence
of a measure satisfying the desired assumptions is assumed, instead of having to explicitly add the
corresponding hypotheses in every theorem, which would be tedious.
locale prob-space = finite-measure + assumes µM(ΩM) = 1
A random variable on a probability space M is a measurable function with domain ΩM. Collections
of random variables are called stochastic processes. In most cases, stochastic processes are indexed
by a totally ordered set, representing time, such as N or R+
. In what follows, we will consider
properties that hold almost surely (or almost everywhere), i.e., are such that the elements for which
they do not hold reside within a set of measure 0:
lemma AE-iff :
(AEM x. P x) ⇔ (∃N ∈ AM.µM(N) = 0 ∧ {x| ¬P x} ⊆ N)
Given measure spaces M and N, we say that N is a subalgebra of M if ΩM = ΩN and AN ⊆ AM.
## 3 Modeling equity markets in discrete time
## 3.1 General definitions
An equity market is characterized by the set of assets that can be traded and the price at which they
are traded2
. A subset of these assets represents the basic securities that can be traded, these are the
stocks. Examples of stocks are shares on companies like Google, Apple, Facebook or Amazon, which
can be traded on the stock market. The remaining assets are viewed as derivative products, the
value of which typically depends on that of some stocks. Examples of derivative products are futures
on Facebook, or basket options on Apple and Google. Their precise definition is not important at
this point, these are assets with a value depending on that of one or several stocks. The price at
which an asset can be traded at each time is a random variable, this price is thus represented by a
stochastic process; and in this case for which time is discrete, these stochastic processes are indexed
by N. At time n, the random variable associated with an asset thus represents the value of this
asset on time interval [n,n + 1[. Note that in this general setting, there is no relationship between
the price processes of assets and that of stocks. As we are concerned with computing fair prices for
derivative products, equity markets are defined in such a way that there always exists at least one
derivative product.
discr-mkt :: β set → (β → (N → α → R)) → B
discr-mkt S P ⇔ S 6= UNIV
Equity markets are defined as a type, from which the stocks and prices can be obtained:
typedef(α,β)discrete-market = {(S,P)| discr-mkt S P}
stocks :: (α,β)discrete-market → β set
stocks Mkt = fst (Rep-discrete-market Mkt)
2This is a simplification as in practice, two prices are associated with each asset: a bid price, which represents the
price traders are willing to pay to buy the asset, and an ask price, which represents the price traders are willing to
sell the asset for. Bid prices are always lower than ask prices, but on markets on which high volumes of assets are
traded, both prices are very close.
5prices :: (α,β)discrete-market → β → N → α → R
prices Mkt = snd (Rep-discrete-market Mkt)
We next consider quantity processes. These are used to represent the fact that assets can be
bought and sold; in particular, it is possible on financial markets to sell an asset that is not withheld:
when this occurs, we say the seller is short on the asset and owns a negative amount of the asset.
When the holder owns a positive amount of the asset, we say the holder is long on the asset. We
assume that any portion of the asset may be traded, thus the quantity withheld is a real number.
Quantity processes are formalized as functions that associate a stochastic process to each asset. By
convention, for n > 0, if q is a quantity process and a is an asset, then q a n w represents the
quantity (positive if we are long the asset and negative if we are short the asset) of asset a withheld
on the time interval ]n − 1,n] for scenario w. The value of a quantity process at time 0 is thus
unimportant. Intuitively, the reason for such a convention is that, at time n, a quantity process
is meant to only depend on the information available up to time n − 1. More formally, in both
discrete and continuous-time models, quantity processes of interest will be required to be predictable
processes, and the convention on quantity processes allows for a uniform presentation. We define
operators that permit to construct and combine quantity processes.
qty-empty :: β → N → α → R
qty-empty = (λx n w. 0)
qty-single :: β → (N → α → R) → β → N → α → R
qty-single asset prc = qty-empty(asset := prc)
qty-sum :: (β → N → α → R) → (β → N → α → R) →
β → N → α → R
qty-sum q1 q2 = (λx n w. (q1 x n w) + (q2 x n w))
qty-mult-comp :: (β → N → α → R) → (N → α → R) →
β → N → α → R
qty-mult-comp q prd = (λx n w. (q x n w).(prd n w))
qty-rem-comp :: (β → N → α → R) → (N → α → R) →
β → N → α → R
qty-rem-comp q asset = q(asset := (λn w.0))
Intuitively, qty-empty represents the quantity process in which no asset is bought or sold, and
qty-single is the process for which a single asset is potentially bought or sold3
. The other operators
permit to respectively add quantity processes, to multiply all of them by another process, and to
nullify the quantity of an asset.
Related to the notion of a quantity process is that of its support set, which consists of all
the assets that are potentially bought or sold at some point for some scenario. This leads to the
definition of portfolios, which are quantity processes that admit a finite support set. Stock portfolios
are portfolios for which the support set consists only of stocks.
support-set :: (β → N → α → R) → β set
support-set q = {a| ∃nw. q a n w 6= 0}
portfolio :: (β → N → α → R) → B
portfolio p ⇔ finite (support-set p)
stock-portfolio :: (α,β)discrete-market → (β → N → α → R) → B
stock-portfolio p ⇔ portfolio p ∧ support-set p ⊆ stocks Mkt
3Recall that in Isabelle, the notation f(a := b) represents an update of function f so that the image of a becomes
b
6Example 1 Consider a market Mkt with stocks including shares on Apple, Facebook and Google:
{Apl, Fbk, Goog} ⊆ stocks Mkt. We can construct the following portfolio
p1
def
= qty-sum (qty-single Apl (λ n w.n)) (qty-single Goog (λ n w. − n)).
This is portfolio in which we are long n shares of Apple and short n shares of Google until time n
for all scenarios; it has a support set consisting of Apple and Google and is thus a stock portfolio.
Time 1 2 3 4
Apl quantity 1 2 3 4
Goog quantity −1 −2 −3 −4
We now define value processes and closing value process for portfolios. Intuitively, the value
process of a portfolio at time n represents the total amount of cash that is necessary to invest in
the assets of the portfolio until time n + 1, and the closing value process of a portfolio at time n
represents the total amount of cash received/owed when closing out all positions at time n. The
closing value process of a portfolio at time 0 can be defined arbitrarily; a standard practice consists
in setting its value to that of the value process of the portfolio at time 0. Note that if the composition
of the portfolio does not change between times ]n−1,n] and ]n,n+1], then the value of the closing
value process at time n is the same as that of the value process.
val-process :: (α,β)discrete-market → (β → N → α → R) →
N → α → R
val-process Mkt p = if ¬(portfolio p) then (λn w. 0) else 
λn w.
P
a∈support-set p((prices Mkt) a n w) ∗ (p a (n + 1) w)

tmp-cl-val :: (α,β)discrete-market → (β → N → α → R) →
N → α → R
tmp-cl-val Mkt p 0 = val-process Mkt p 0
tmp-cl-val Mkt p (n + 1) = 
λw.
P
a∈support-set p((prices Mkt) a (n + 1) w) ∗ (p a (n + 1) w)

cls-val-process :: (α,β)discrete-market → (β → N → α → R) →
N → α → R
cls-val-process Mkt p = if ¬(portfolio p) then (λn w. 0) else
(λn w. tmp-cl-val Mkt p n w)
Example 2 Assume the Apple and Google shares have deterministic prices given by the table below.
Then the value process and closing value process of portfolio p1 defined in Example 1 are given in
the same table.
Time 0 1 2 3
Apl quantity − 1 2 3
Goog quantity − −1 −2 −3
Apl value 100 98 96 98
Goog value 90 92 98 95.5
val-process Mkt p1 10 12 −6 10
cls-val-process Mkt p1 10 6 −4 7.5
Self-financing portfolios are portfolios in which no cash is invested except possibly at inception.
A portfolio is self-financing if its closing value and value at time n+1 are identical; this means that
7the value of the portfolio may be affected by the evolution of the market but not by the changes in
its composition.
self-financing :: (α,β)discrete-market → (β → N → α → R)
→ B
self-financing Mkt p ⇔
∀n.val-process Mkt p (n + 1) = cls-val-process Mkt p (n + 1)
A self-financing portfolio with initial value v0 can be obtained starting from an arbitrary portfolio,
provided the market contains an asset that never admits a price equal to 0, by buying (resp. selling)
the required quantity of the asset with the extra (resp. missing) cash.
Example 3 Portfolio p1 of Example 1 is not self-financing. Assume the stock price of Facebook is
deterministic and given in the table below.
Time 0 1 2 3
Fbk 5 4 4 5
Then we can construct a self-financing portfolio p2 with initial value 0, that has the same quantity
processes as p1 for Apple and Google. The quantities of stocks and the value and closing value
processes of p2 are given in the following table.
Time 0 1 2 3 4
Apl quantity − 1 2 3 4
Goog quantity − −1 −2 −3 −4
Fbk quantity − −2 −3.5 −3 −3.5
Apl value 100 98 96 98 −
Goog value 90 92 98 95.5 −
Fbk value 5 4 4 5 −
val-process Mkt p2 0 −2 −18 −7.5 −
cls-val-process Mkt p2 0 −2 −18 −7.5 −
The value process of p2 at time 3 is computed by having a quantity −3.5 of Facebook stock in the
portfolio until time 4. For instance, at time 0, the holder buys a share of Apple for 100e and sells
a (borrowed) share of Google for 90e, creating a portfolio for a total cost of 10e. To make the
portfolio self-financed with initial value 0, this cost is compensated by selling 2 (borrowed) shares
of Facebook at 5e each, the total cost of the created portfolio is then 0e.
## 3.2 Modeling time-dependent information
Filtrations are used to represent information accumulated over time. Formally, they are defined as
a collection of increasing subalgebras over a totally ordered set with a minimal element ⊥ –typically
N or R+
.
class linorder-bot = linorder+ bot
filtration :: αmeasure → ((ι :: linorder-bot) → αmeasure) → B
filtration M F ⇔ (∀t. subalgebra M Ft) ∧
(∀s t. s ≤ t ⇒ subalgebra Ft Fs)
In general, when a filtration F representing available information is provided, we will mainly
be interested in stochastic processes that depend on this information. There are two categories of
such stochastic processes of interest for our purpose: adapted stochastic process, that at time n are
Fn-measurable; and predictable stochastic processes, that at time n > 0 are Fn−1-measurable. The
definition of adapted stochastic processes in the more general case is a straightforward generalization
8of that in the discrete case, which is the one that is formalized below. We also introduce abbreviations
for stochastic processes with a range in a borel measure space.
adapt-sp :: (ι → αmeasure) → (ι → α → β) →
β measure → B
adapt-sp F X N ⇔ ∀t. Xt ∈ measurable Ft N
abbreviation borel-adapt-sp F X ≡ adapt-sp F X borel
predict-sp :: (N → αmeasure) → (N → α → β) →
β measure → B
predict-sp F X N ⇔ X0 ∈ measurable F0 N∧
∀n. Xn+1 ∈ measurable Fn N
abbreviation borel-predict-sp F X ≡ predict-sp F X borel
In our context, filtrations are meant to represent the currently available information. A standard
filtration used in financial mathematics is the one defined as follows: for all n ≥ 0, Fn is the smallest
subalgebra of M in which for any stock s and time k ≤ n, the price process (prices Mkt) s k is
borel-measurable. It is straightforward to verify that F is indeed a filtration. In particular, at time
0, there is no information available, thus the measure space F0 = F⊥ is trivial. Filtrations satisfying
such a requirement are called initially trivial filtrations.
init-triv-filt :: αmeasure → (ι → αmeasure) → B
init-triv-filt M F ⇔ filtration M F ∧ sets F⊥ = {∅,ΩM}
We define a locale for discrete equity markets by fixing a market and considering a probability
space equipped with an arbitrary filtration that is initially trivial.
locale init-triv-prob-space = prob-space +
fixes F :: N → (αmeasure)
assumes init-triv-filt F
locale disc-equity-market = init-triv-prob-space +
fixes Mkt :: (α,β)discrete-market
Most of the assets that we will be considering in this locale are those that have an adapted price
process w.r.t. the given filtration. Quantity processes in which only assets with an adapted price
process are bought or sold are called support-adapted quantity processes.
support-adapt :: (α,β)discrete-market → (β → N → α → R)
→ B
support-adapt Mkt prc ⇔ ∀a ∈ support-set p.
borel-adapt-sp F (prices Mkt a)
The portfolios that can reasonably be constructed are those for which the amounts that are
bought or sold of each asset on the time interval ]n,n+1] is known at time n. In other words, these
are portfolios for which the quantity of each asset is a predictable process; such portfolios are called
trading strategies.
trading-strat :: (β → N → α → R) → B
trading-strat p ⇔ portfolio p ∧
(∀a ∈ support-set p. borel-predict-sp F (p a))
In particular, the value process of a support-adapted trading strategy is itself an adapted process:
lemma trading-strategy-adapted
assumes trading-strat p
and support-adapt Mkt p
shows borel-adapt-sp F (val-process Mkt p)
9Since the filtration F is assumed to be initially trivial, such a strategy necessarily admits a constant
value at inception:
lemma trading-strategy-init
assumes trading-strat p
and support-adapt Mkt p
shows ∃c. ∀ω ∈ ΩM. val-process Mkt p 0 w = c
We denote by init-value p the constant value equal to the value process of a trading strategy at
time 0.
## 4 The notion of a fair price
## 4.1 Definitions
We define the notion of a fair price, which is meant to represent the price at which a derivative
should be bought or sold. Intuitively, a fair price for an asset is one that does not allow a buyer or
seller of the asset of making a risk-free profit thanks to this transaction. Making a risk-free profit is
called an arbitrage. We begin by formally defining the notion of an arbitrage. This is a self-financing
trading strategy with a zero initial value, that at some point in time is almost surely positive and
with a strictly positive probability of making a gain. Although such arbitrage opportunities do exist
in real financial markets, they are generally quickly exploited and disappear: in fact, there is an
entire category of traders on markets with the goal of detecting and exploiting arbitrages as quickly
as possible. Pricing results in financial mathematics are based on a no-arbitrage assumption.
arbitrage-process :: (α,β)discrete-market → (β → N → α → R) → B
arbitrage-process Mkt p ⇔
(∃m ∈ N.
(trading-strat p) ∧ (self-financing p) ∧
(∀ω ∈ ΩM. (val-process p) 0 ω = 0) ∧
(AEM ω. (cls-val-process p) m ω ≥ 0) ∧
(P({ω ∈ ΩM | (cls-val-process p) m ω > 0}) > 0))
Next we define the notion of a price structure for a derivative. Derivatives are characterized by
their maturity and the payoff they deliver at maturity; a price structure is a stochastic process with a
constant initial value that coincides with the payoff of the derivative almost everywhere at maturity.
The initial value of a price structure will represent the price of the derivative under consideration.
price-struct :: (α → R) → N → R → (N → α → R) → B
price-struct κ T π pr ⇔ (∀ω ∈ ΩM. pr 0 ω = π) ∧
(AEM ω. pr T ω = κ ω) ∧
(pr T ∈ borel-measurable FT )
In order to formalize the notion of a fair price for a derivative, we need to formalize the fact that
buying or selling the derivative at that price π does not lead to any arbitrage opportunity. More
precisely, it should not be possible to obtain an arbitrage process using only stocks from the market
and an asset with a price process identical to a price structure of the derivative, with an initial value
π. In order to guarantee the existence of such an asset, we define the notion of coincidence between
two markets.
coincides :: (α,β)discrete-market → (α,β)discrete-market →
β set → B
coincides Mkt Mkt′
A ⇔ stocks Mkt = stocks Mkt′
∧
∀x. x ∈ A ⇒ prices Mkt a = prices Mkt′
a
10fair-price :: (α,β)discrete-market → R → (α → R) →
N → B
fair-price Mkt π κ T ⇔ (∃pr. price-struct κ T π pr∧
(∀a Mkt′
p. a / ∈ stocks Mkt ⇒
(coincides Mkt Mkt′
) ∧
(prices Mkt′
a = pr) ∧
(portfolio p) ∧
(support-set p ⊆ stocks Mkt ∪ {a}) ⇒
¬arbitrage-process Mkt′
p))
## 4.2 Replicating portfolios
We prove the central result that, under the hypothesis that a replicating portfolio exists for a given
derivative, the latter admits a fair price that is unique. A replicating portfolio for a given derivative
is a self-financing trading strategy that consists of stocks only, and that at maturity, has a value
identical to the payoff of the derivative almost everywhere. If such a portfolio exists, then the
derivative is attainable, and if every derivative available on a market is attainable, then the market
is complete:
replic-pf :: (β → N → α → R) → (α → R) → N → B
replic-pf p κ T ⇔ (stock-portfolio Mkt p) ∧
(self-financing p) ∧ (trading-strat p)∧
(AEM ω. cls-val-process Mkt p T ω = κ w)
attainable :: (α → R) → N → B
attainable κ T ⇔ (∃p. replic-pf p κ T)
complete-market :: B
complete-market ⇔ ∀T. ∀κ ∈ (borel-measurable FT ). attainable κ T
The existence of a replicating portfolio by itself is not sufficient to guarantee the existence of
a fair price: indeed, if for example it is already possible to construct an arbitrage process on the
market using only stocks, then there clearly cannot be any fair price for any derivative product. It is
thus necessary to forbid arbitrage opportunities using only stocks from the market. This is captured
by the notion of a viable market.
viable-market :: (α,β)discrete-market → B
viable-market Mkt ⇔ ∀p. stock-portfolio p ⇒
¬arbitrage-process Mkt p
We obtain the following results. We first show that, if the market is viable, every derivative
admitting a replicating portfolio has a fair price that is the initial value of the replicating portfolio.
lemma replicating-fair-price
assumes viable-market Mkt
and replic-pf p κ T
and support-adapt Mkt p
shows fair-price Mkt (init-value p) κ T
We then provide a proof of the uniqueness of a fair price for attainable derivatives based on the
existence of a stock on the market with a strictly positive price process. The proof could also be
carried out assuming the existence of a stock on the market with a strictly negative price process,
11but that does not really make sense from a financial point of view. We also assume that the price
processes of all stocks in the market are adapted to the filtration under consideration.
locale disc-mkt-pos-stock = disc-equity-market +
fixes pos-stock :: β
assumes pos-stock ∈ stocks Mkt
and ∀n ω. prices Mkt pos-stock n ω > 0
and ∀a ∈ stocks Mkt. borel-adapt-sp F (prices Mkt a)
lemma replicating-fair-price-unique
assumes replic-pf p κ T
and fair-price Mkt π κ T
shows π = (init-value p)
## 5 Risk-neutral probability spaces
## 5.1 Interest rates and discounted values
We begin by defining the notion of interest rates. The existence of an interest rate is modeled by
assuming that the market contains a stock with a deterministic return. The price process of this stock
is parameterized by an interest rate r. In this setting, the interest rate is constant, although there
exist more general models in which the interest rate can be time-dependent, and even stochastic.
disc-rfr-proc :: R → N → α → R
disc-rfr-proc r 0 ω = 1
disc-rfr-proc r (n + 1) ω = (1 + r).(disc-rfr-proc n ω)
We call risk-free asset any asset a such that prices Mkt a = disc-rfr-proc r for some rate r, and
define a locale for a market containing a risk-free asset.
locale risk-free-stock-market = disc-equity-market +
fixes rf-asset :: β
and r :: R
assumes − 1 < r
and rf-asset ∈ stocks Mkt
and prices Mkt rf-asset = disc-rfr-proc r
Having a risk-free asset as a stock in a market makes it possible to deposit (by buying the asset)
or borrow (by shorting the asset) cash on this market.
Example 4 Assume there is a risk-free asset with an annual rate of 2% on the market. This means
that buying 100e worth of the asset today will permit to obtain 102e by selling the asset in one
year. Assuming the time lapse between times n and n + 1 is a day and there are 252 business
days in one year, the daily rate r in the definition of disc-rfr-proc then satisfies the equation
(1 + r)252
= 1.02, so we have r ≈ 7.85.10−5
.
Remark. Observe that if the market is viable, then all risk-free assets must have the same rate.
Indeed, if there exist two risk-free assets with interest rates r1 < r2 then an arbitrage can be
constructed: it suffices to buy 1 share of the second asset and sell 1 share of the first one. The initial
investment is 1−1 = 0, and at time n the closing value of the portfolio is (1+r2)n
−(1+r1)n
> 0.
We also define the discounted value of a stochastic process. This notion is related to that of the
present value of a future cash-flow, given an interest rate.
discount-factor :: R → N → α → R
discount-factor r n ω = inverse (disc-rfr-proc r n ω)
discounted-value :: R → (N → α → R) → N → α → R
discounted-value r X = λn ω. (discount-factor r n ω).(Xn ω)
12Example 5 Assume we have a viable market that contains a risk-free asset with a rate of 2% per
year, and that the price of a share of Apple today is 95e. Consider a forward contract for buying a
share of Apple stock at a strike price of 98e in two years. The fair price for this contract is obtained
by computing the discounted value of the strike and subtracting it from the current price of a share
today. Here the discounted value of the strike is 98.(1+0.02)−2
≈ 94.19, hence the fair price of this
contract is 0.81e. Indeed, this amount of money can be used to construct a replicating portfolio as
follows.
1. Borrow 94.19e today.
2. Use the cash, along with the 0.81e received at the sale of the contract to buy a share of Apple
stock today.
3. Wait for two years.
4. Sell the share of Apple stock to the buyer of the forward contract for 98e.
5. Use this to reimburse the cash that was borrowed at the start and is now worth 94.19.(1 +
0.02)2
≈ 98e.
## 5.2 Conditional expectations and martingales
The results of Section 4.2 show that when a replicating portfolio exists for a given derivative, the
fair price for this derivative is unique and equal to the initial value of the portfolio. In this section
we prove that this initial value can be computed without explicitly constructing any replicating
portfolio under the hypothesis of the existence of a risk-neutral probability space. From a financial
point of view, assets carry different levels of risk, and the more risky an asset, the higher the return
buyers will be expecting when investing in the asset; this additional return is called the market price
of risk. A risk-neutral probability space is meant to represent a world in which investors do not
expect an increased return for a more risky asset: they are neutral to risk and expect the returns of
all assets to be identical.
The expected returns of assets are modeled using the notion of conditional expectations. A
conditional expectation is meant to represent the best approximation of a random variable given the
currently available information. Formally, a conditional expectation of a random variable X given a
measure space N that is a subalgebra of M is any random variable XN that is N-measurable, and
such that for any set N ∈ N,
Z
N
XN dµM =
Z
N
XdµM.
A conditional expectation of X given N always exists as long as X is integrable, and is almost surely
unique, meaning that two conditional expectations of X given N are identical almost everywhere.
In what follows, we will therefore refer to the conditional expectation of X given N, and denote it
by E[X | N]. Conditional expectations are already formalized in Isabelle.
Conditional expectations are used to define martingales. Given a filtration F, these are stochastic
processes (Xt)t such that for all t ≤ s, Xt is the best estimation of Xs given the information Ft. In
other words, Xt and E[Xs | Ft] are equal almost everywhere.
martingale :: αmeasure → (ι → αmeasure) → (ι → α → R) → B
martingale M F X ⇔
(filtration M F) ∧ (borel-adapt-sp F X) ∧ (∀t.integrable M Xt)∧
(∀ts.t ≤ s ⇒ (AEM ω.Xt w = real-cond-exp M Ft Xs w))
Because the risk-free asset we defined has a deterministic price process with a constant return
rate, it is straightforward to verify that the discounted value of this price process is constant, and is
13trivially a martingale. In a risk-neutral probability space, the martingale property holds for all the
stocks of the market:
risk-neutral-prob-space :: αmeasure → B
risk-neutral-prob-space N ⇔ prob-space N ∧
∀a ∈ (stocks Mkt). martingale N F (discounted-value r (prices Mkt a))
## 5.3 Filtration-equivalence
If there were no relationship whatsoever between a risk-neutral probability space and the actual
probability space, the former would not be of much use. In general, both spaces are assumed to be
equivalent, meaning that they agree on the events that have a zero probability. It turns out that
when there is a filtration associated with a probability space, this notion can be relaxed into that
of filtration-equivalence, which is sufficient for our purpose.
filt-equiv :: (ι → αmeasure) → αmeasure → αmeasure → B
filt-equiv F M N ⇔ filtration M F ∧ AM = AN ∧
∀i A. A ∈ AFi ⇒ (µM(A) = 0 ⇔ µN (A) = 0)
When probability spaces are filtration-equivalent, almost everywhere properties propagate from
one space to the other. In particular, a replicating portfolio for a derivative in one given probability
space will necessarily be a replicating portfolio for the derivative in a filtration-equivalent probability
space, even if the probabilities assigned to different events may defer.
lemma filt-equiv-borel-AE-eq
assumes filt-equiv F M N
and f ∈ borel-measurable Fi
and g ∈ borel-measurable Fi
and AEM ω. f w = g w
shows AEN ω. f w = g w
Provided integrability properties are guaranteed for the assets of a self-financing trading strategy,
the latter is a martingale in a filtration-equivalent risk-neutral probability space.
lemma self-fin-trad-strat-mart
assumes filt-equiv F M N
and risk-neutral-prob-space N
and trading-strat p
and self-financing Mkt p
and stock-portfolio Mkt p
and ∀n. ∀a ∈ support-set p. integrable N
(λω. (prices Mkt a n ω)(p a (n + 1) ω))
and ∀n. ∀a ∈ support-set p. integrable N
(λω. (prices Mkt a (n + 1) ω)(p a (n + 1) ω))
shows martingale N F (discounted-value r (cls-val-process Mkt p))
We obtain the following result, which in a viable market, provides an effective way of computing
the fair price of an attainable derivative when a filtration-equivalent risk-neutral probability space
14exists:
lemma replicating-expectation
assumes filt-equiv F M N
and risk-neutral-prob-space N
and κ ∈ borel-measurable FT
and replic-pf p κ T
and ∀n. ∀a ∈ support-set p. integrable N
(λω. (prices Mkt a n ω)(p a (n + 1) ω))
and ∀n. ∀a ∈ support-set p. integrable N
(λω. (prices Mkt a (n + 1) ω)(p a (n + 1) ω))
and viable-market Mkt
and AF0 = {{},ΩM}
shows fair-price Mkt E[discounted-value r κ T] κ T
## 6 Fair prices in the Cox-Ross-Rubinstein model
The CRR model is a discrete-time model consisting of a market in which there are two stocks, a
risk-free asset and a risky one. At every time n, the risky asset can only move upward or downward
with respective probabilities p and 1−p. This means that the evolution of the risky asset price can be
modeled by tossing at each time n a coin that lands on its head with a probability p, and having the
price move upward at time n+1 exactly when the coin lands on its head. The evolution of this price
is thus controlled by sequences of coin tosses. In most introductory textbooks on the CRR model,
these sequences are finite as the results are presented for a given derivative with a finite maturity. We
choose to consider infinite sequences—or streams—of coin tosses for the sake of generality. Since at
time n no event other than the outcome of the coin toss is required, this outcome can be represented
by a Bernoulli distribution of parameter p. In Isabelle, because discrete probability distributions
and probability mass functions are isomorphic, the type of probability mass functions are defined as
a subtype of measures [9], along with an injective representation function measure-pmf :: α pmf →
α measure. The Bernoulli distribution is thus defined as measure-pmf (bernoulli-pmf p). The
measure space for infinite sequences of independent coin tosses is isomorphic to the infinite product
of Bernoulli distributions with the same parameter. In Isabelle, this measure space is defined using
the function stream-space :: α measure → (α stream) measure. The measure space thus defined
is the smallest one in which the function nth :: α stream → N → α such that (nth s n) is the nth
element of stream s is measurable [8]. The measure spaces we consider are defined as follows:
bernoulli-stream :: R → (B stream) measure
bernoulli-stream p = stream-space (measure-pmf (bernoulli-pmf p))
We define a locale in which we impose that 0 ≤ p ≤ 1, and thus obtain a probability space:
locale infinite-coin-toss-space=
fixes p and M
assumes 0 ≤ p ≤ 1 and M = bernoulli-stream p
The maximal amount of information that should be available at time n is the outcome of the first
n coin tosses, and we define a filtration Fnat
accordingly: intuitively, in this filtration, two streams
of coin tosses with the same first n outcomes cannot occur in distinct sets that are measurable in
Fnat
. In our setting, each restricted measure space Fnat
n can be defined as generated by an arbitrary
measurable function which maps all streams that agree on the first n coin tosses to the same element.
We thus considered the sequence of so-called pseudo-projection functions (π⊤
n )n∈N, where:
π⊤
n : ΩM → ΩM
(w1,··· ,wn,wn+1,···) 7→ (w1,··· ,wn,⊤,⊤,···)
15S 10
12
14.4
9.6
8
9.6
6.4
⊤
⊥
⊤
⊥
⊤
⊥
Figure 1: Example of a geometric random walk
These functions are measurable and permit to define a sequence of restricted measure spaces which
is indeed a filtration:
Fnat
:: N → (B stream) measure
Fnat
n = M(π⊤
n )
We can thus define a locale for the infinite coin toss space along with this filtration:
locale infinite-cts-filtration = infinite-coin-toss-space +
fixes F assumes F = Fnat
Any other considered filtration on this probability space will be a sub-filtration of the natural
filtration.
An important feature of the natural filtration is that the expectation of any Fnat
n -measurable
function is very similar to that of a function on a finite probability space: for ω = ω1,··· ,ωn,···
and i ∈ N, if νi(ω)
def
= if ωi then p else 1 − p, then we have
lemma expect-prob-comp
assumes f ∈ borel-measurable Fnat
n
shows E[f] =
P
ω∈π⊤
n (ΩM) (
Qn
i=1 νi(ωi).f(ω))
In the CRR model, the price of the risky asset is modeled by a geometric random walk with
parameters specifying the upward and downward movements as well as the price of the asset at time
0:
geom-rand-walk :: R → R → R →
(N → (B stream) → R)
(geom-rand-walk u d v) 0 ω = v
(geom-rand-walk u d v) (n + 1) ω = (if ωn then u else d) ×
((geom-rand-walk u d v) n ω)
Example 6 Figure 1 depicts the first values of the geometric random walk process geom-rand-walk1.2 0.8 10.
This is a process with a deterministic initial value 10. Intuitively, at time 1, if the outcome of a coin
toss is a head, then this process has a value of 12, and if the outcome is a tail, then it has a value
of 8. If at time 2 the first two outcomes are a head then a tail, then the value is 9.6, etc.
16The geometric random walk process is an adapted process, in the infinite coin toss space equipped
with its natural filtration, since its value at time n depends only on the outcome of the first n coin
tosses:
lemma geom-rand-walk-borel-adapted :
borel-adapt-sp (geom-rand-walk u d v)
locale prob-grw = infinite-coin-toss-space +
fixes geom-proc and u and d and v
assumes geom-proc = geom-rand-walk u d v
We define a locale in which there is a stochastic process that is a geometric random walk:
The locale for the market in the CRR model is defined as follows:
locale CRR-hyps = prob-grw+ risk-free-stock-market+
fixes S
assumes stocks Mkt = {S,rf-asset}
and prices Mkt S = geom-proc
and 0 < v and 0 < d < u
and 0 < p < 1
In particular, we require that 0 < p < 1 so that S is indeed a risky asset.
The filtration associated with this probability space is meant to represent the fact that the
information available at time n is the price evolution of the risky asset up to time n. We thus
define a function that associates a filtration to a stochastic process X, such that at time n, the
corresponding measure space is the smallest subalgebra for which Xk is measurable for all k ≤ n.
stoch-proc-filt :: α measure → (N → α → β) → β measure →
N → α measure
stoch-proc-filt M X N n = sigma ΩM
S
k≤n

X−1
i (A) ∩ ΩM A ∈ AN
In the locale below, we denote by G the filtration such that at time n, Gn is the smallest subalgebra
for which prices Mkt S k is borel-measurable for all k.
locale CRR-market = CRR-hyps+
fixes G
assumes G = stoch-proc-filt M geom-proc borel
In order to compute fair prices, the CRR market is required to be viable. We have the following
result:
lemma viable-iff
shows viable-market Mkt ⇔ (d < 1 + r < u)
The direct implication is straightforward to prove. If for example the risky asset always has a
return greater than the risk-free rate, i.e., 1+r ≤ d, then an arbitrage can be obtained by borrowing
the initial value of the risky asset, v, at time 0 and buying one share of the risky asset. This results
in a portfolio with initial value 0. At time 1, the closing value of the portfolio is either dv −(1+r)v
or uv − (1 + r)v; in both cases this value is positive, and it is strictly positive with probability
p > 0. The market can therefore not be viable. The proof of the other direction is not as obvious.
Intuitively, this result can be proved by showing that when d < 1 + r < u, if there is a scenario
in which a portfolio with an initial value of 0 admits a strictly positive closing value, then there
necessarily exists a scenario in which this portfolio admits a strictly negative value.
We may thus define a locale for a viable CRR market:
locale CRR-market-viable = CRR-market+
assumes viable-market Mkt
17Next, we provide a necessary and sufficient condition for the existence of a risk-neutral bernoulli
stream space that is filtration-equivalent to M.
lemma risk-neutral-iff
assumes N = bernoulli-stream q
and 0 < q < 1
shows risk-neutral-prob-space G Mkt r N ⇔ q = 1+r−d
u−d
We also prove that every derivative is attainable in the CRR model:
lemma CRR-market-complete :
shows complete-market
The result is proven by constructing a replicating portfolio for any GT -measurable payoff κ :
α → R and exercise time T. Note that the fact that function κ is GT -measurable ensures that the
payoff only depends on information available up to time T. The principle of the construction of the
portfolio is explained in details on an example in Section 7.
We finally obtain the final result:
lemma CRR-market-fair-price :
assumes κ ∈ borel-measurable GT
and N = bernoulli-stream 1+r−d
u−d
shows fair-price Mkt
P
ω∈π⊤
T (ΩM)
QT
i=1 νi(ωi).(discounted-value r κ ω)

κ T
7 A complete example
We use the results above to price a lookback option and illustrate how the completeness of the Cox-
Ross-Rubinstein market is proved by constructing a replicating portfolio for this option. A lookback
option is characterized by a maturity T and at this maturity, pays max0≤i≤T Si − ST . In other
words, instead of having a payoff that only depends on the value of the risky asset at maturity, a
lookback option has a payoff that depends on all the values of the risky asset until maturity. It is
called a path-dependent option.
We assume that the risky asset has an initial value 10, an upward movement u = 1.2 and a
downward movement d = 0.8. The risk-free rate is r = 3% (see Figure 2). Consider a lookback
option with maturity T = 2. Its payoff is depicted on the right-hand side of the figure. If the
outcomes of the first two coin tosses are heads, then the maximal value of the risky asset is its value
at time 2, so that this option does not pay anything. If the outcomes are first a head then a tail,
then the value of the risky asset at time 2 is 9.6e the option pays off 2.4e. Note that if the first
two coin tosses are a tail then a head, then the value of the risky asset at time 2 is also 9.6e, but
the option only pays off 0.4e.
The fair price of this option is computed using Lemma CRR-market-fair-price, which states
that this fair price is the risk-neutral expectation of the discounted payoff of the option. The risk-
neutral probability space is given by taking the probability of the coin landing on its head equal to
1+r−d
u−d = 0.575. We thus obtain the following table:
Outcomes ⊤⊤ ⊤⊥ ⊥⊤ ⊥⊥
Probability 0.330625 0.244375 0.244375 0.180625
Payoff 0 2.4 0.4 3.6
Disc. payoff 0 2.262 0.377 3.393
We deduce that the fair price of this option is 1.2579e.
18We now construct a replicating portfolio for this option. This portfolio will be constructed by
going backward in time. First assume the outcome of the first coin toss is a head. In this scenario,
we construct a portfolio that starts at time 1. The fair price of the option is given using the table
below:
Outcomes ⊤⊤ ⊤⊥
Probability 0.575 0.425
Payoff 0 2.4
Disc. payoff 0 2.33
We deduce that the fair price of the option (and the initial value of the portfolio under construction
starting at time 1) is approximately 0.9903e. The quantity invested in the risky asset is given by
∆⊤
def
=
κ⊤⊤ − κ⊤⊥
S⊤⊤ − S⊤⊥
=
0 − 2.4
14.4 − 9.6
= −0.5,
where κω1ω2 and Sω1ω2 respectively denote the payoff of the derivative and the value of the risky
asset at time 2, depending on the outcomes of the first two coin tosses ω1 and ω2.
This means that half a share of the risky asset is sold (a short sell) for 6e. Since the initial value
of the portfolio is 0.9903e, this cash, along with the one obtained by selling the risky asset for a
total of 6.9903e, is invested in the risk-free rate. At time 2, the cash invested in the risk-free rate
is recovered and worth 6.9903∗ 1.03 = 7.2e; the half-share of the risky asset is bought back.
• If the outcome of the second coin toss is a head, then the risky asset is worth 14.4e, so 7.2e
are necessary to buy half the share back. The value of the portfolio is 0e.
• If the outcome of the second coin toss is a tail, then the risky asset is worth 9.6e, so 4.8e are
necessary to buy half the share back. The value of the portfolio is 2.4e.
Now assume the outcome of the first coin toss is a tail. The fair price of the option at time 1 in
this scenario is given using the table below:
Outcomes ⊥⊤ ⊥⊥
Probability 0.575 0.425
Payoff 0.4 3.6
Disc. payoff 0.38835 3.49515
The fair price of the option under this scenario is approximately 1.7087e. The quantity invested in
the risky asset is
∆⊥
def
=
κ⊥⊤ − κ⊥⊥
S⊥⊤ − S⊥⊥
=
0.4 − 3.6
9.6 − 6.4
= −1.
One share of the risky asset is sold for 8e, and the proceeds of this sale, along with the initial value
of the portfolio are invested in the risk-free asset. At time 2, the amount thus invested is worth 10e,
and the share of the risky asset is bought back.
• If the outcome of the second coin toss is a head, then the risky asset is worth 9.6e, so the
value of the portfolio is 0.4e.
• If the outcome of the second coin toss is a tail, then the risky asset is worth 6.4e, so the value
of the portfolio is 3.6e.
We now construct a portfolio with initial value 1.2579e, and worth 0.9903e if the outcome of
the first coin toss is a head, and 1.7087e if the outcome is a tail. The quantity invested in the risky
asset is given by
∆⊤
def
=
0.9903− 1.7087
12 − 8
= −0.1796.
This quantity of the risky asset is sold for 10e, and the proceeds are invested in the risk-free asset,
along with the initial value of the portfolio. At time 1, the cash thus invested is worth 3.145517e.
The quantity of risky asset that was shorted is bought back.
19R 1 1.03 1.061
S 10
12
14.4
9.6
8
9.6
6.4
0
2.4
0.4
3.6
⊤
⊥
⊤
⊥
⊤
⊥
Figure 2: Lookback option settings and payoff. R denotes the risk-free asset and S the risky one.
• If the outcome of the first coin toss is a head, then the risky asset is worth 12e and buying
back the quantity that was shorted costs 2.1552e, so the value of the portfolio is 0.9903e.
• If the outcome of the first coin toss is a tail, then the risky asset is worth 8e and buying back
the quantity that was shorted costs 1.4368e, so the value of the portfolio is 1.7087e.
To recap, the seller of the lookback option sells it for 1.2579e, and constructs a replicating
portfolio as follows.
1. The seller receives 1.796e by short selling the risky asset and invests the 3.0539e in the risk-free
asset until time 1.
2. If at time 1 the outcome of the first coin toss is a head, then the seller uses the closing value
of the portfolio, 0.9903e, to short half a share of the risky asset and invest 6.9903e in the
risk-free asset. Otherwise, the seller uses the closing value of the portfolio, 1.7087e, to short
one share of the risky asset and invest 9.7087e in the risk-free asset.
3. At time 2, quantity of risky asset that was shorted is bought back and the cash invested in the
risk-free asset is withdrawn; the closing value of the portfolio is exactly equal to the payoff of
the lookback option.
This construction can be generalized to arbitrary Fnat
T -measurable functions. At any time t < T,
the composition of the portfolio is determined in such a way that its closing value at time t + 1
matches the value already computed at time t + 1, for both outcomes of the next coin toss. This
yields a system of two linear equations, one for each possible outcome of the toss coin, with two
variables (the amounts of risk-free and risky assets, respectively). Lemma viable-iff on Page 17
imposes additional conditions on u,d,r that ensure that the system admits a unique solution.
## 8 Discussion
We have formalized a framework for proving financial results in Isabelle. The formalization permits
a formal definition of fair prices in Isabelle, and presents one of the main pricing results in finance:
under a risk-neutral probability, the fair price of an attainable derivative is equal to the expectation
20of its discounted payoff. This formalization is quite extensive, as many financial notions had to
be introduced, and it was used to prove that every derivative admits a fair price in the Cox-Ross-
Rubinstein model of an equity market, by proving the completeness of this market. As far as future
work is concerned, we intend to work on the pricing in the Cox-Ross-Rubinstein model of American
options, that can be exercised at any time by the buyer until the maturity –and not simply at
maturity, as for European options–. Pricing such options will require the definition of additional
notions, such as supermartingales, and our aim will be to implement a completely certified pricer
for such options. We also intend to pursue our formalization effort of mathematical finance and
extend our results to a continuous-time setting. This is an ambitious and interesting task, and we
hope this first formalization will encourage other researchers, from computer science and financial
mathematics to extend these results in Isabelle.
References
[1] J. Avigad, J. Hölzl, and L. Serafin. A formally verified proof of the central limit theorem. J.
Autom. Reasoning, 59(4):389–423, 2017.
[2] F. Black and M. Scholes. The pricing of options and corporate liabilities. Journal of political
economy, 81(3):637–654, 1973.
[3] J. C. Blanchette. Relational analysis of (co)inductive predicates, (co)algebraic datatypes, and
(co)recursive functions. Software Quality Journal, 21(1):101–126, 2013.
[4] J. C. Cox, S. A. Ross, and M. Rubinstein. Option pricing: A simplified approach. Journal of
Financial Economics, 7(3):229–263, 1979.
[5] R. Durrett. Probability : theory and examples. The Wadsworth & Brooks/Cole statis-
tics/probability series. Wadsworth Inc. Duxbury Press, Belmont, California, 1991.
[6] M. Echenim and N. Peltier. The binomial pricing model in finance: A formalization in isabelle.
In L. de Moura, editor, Automated Deduction - CADE 26 - 26th International Conference on
Automated Deduction, Gothenburg, Sweden, August 6-11, 2017, Proceedings, volume 10395 of
Lecture Notes in Computer Science, pages 546–562. Springer, 2017.
[7] J. Hölzl. Construction and Stochastic Applications of Measure Spaces in Higher-Order Logic.
PhD thesis, Institut für Informatik, Technische Universität München, October 2012.
[8] J. Hölzl. Markov chains and markov decision processes in isabelle/hol. Journal of Automated
Reasoning, pages 1–43, 2016. http://dx.doi.org/10.1007/s10817-016-9401-5.
[9] J. Hölzl, A. Lochbihler, and D. Traytel. A Formalized Hierarchy of Probabilistic System Types
- Proof Pearl. In Proc. of ITP, pages 203–220, 2015.
[10] J. Hull. Options, Futures and Other Derivatives. Pearson/Prentice Hall, 2009.
[11] R. Merton. The theory of rational option pricing. Bell Journal of Economics and Management
Science, 4:141–183, 1973.
[12] T. Nipkow, M. Wenzel, and L. C. Paulson. Isabelle/HOL: A Proof Assistant for Higher-order
Logic. Springer-Verlag, Berlin, Heidelberg, 2002.
[13] S. E. Shreve. Stochastic Calculus for Finance I: The Binomial Asset Pricing Model. Springer
Finance, 2003.
21