---
sha256: f5d0f3f06b1d986adfe52b332f2e6de7c1dd2752ea61c61f72937180c776dbe6
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 135173
---
arXiv:2210.01227v4 [q-fin.MF] 1 Feb 2025
Axioms for Automated Market Makers: A Mathematical
Framework in FinTech and Decentralized Finance
Maxim Bichuch ∗
Zachary Feinstein †
Tuesday 4th
February, 2025
Abstract
Within this work we consider an axiomatic frameworkfor Automated Market Makers (AMMs).
AMMs are smart contracts that set prices for swaps on a pool of assets. By imposing reasonable
axioms on the underlying utility function, we are able to characterize the properties of the swap
size of the assets and of the resulting pricing oracle. In providing these general axioms, we de-
fine a novel measure of price impacts that can be used to quantify those costs between different
AMM constructions. We have analyzed many existing AMMs and shown that the vast majority
of them satisfy our axioms. We have also considered the question of fees and divergence loss. In
doing so, we have proposed a new fee structure so as to make the AMM indifferent to transac-
tion splitting. Finally, we have proposed a novel AMM that has nice analytical properties and
provides a large range over which there is no divergence loss.
Keywords: Decentralized Finance, FinTech, Decentralized Exchange, Automated Market Mak-
ers, Divergence Loss, Blockchain.
## 1 Introduction
Decentralized Finance (DeFi) is a new paradigm for finance which replaces traditional interme-
diaries with innovative financial technologies based on blockchain. DeFi companies are providing
services in areas such as lending and borrowing, insurance underwriting, and trading without work-
ing with the traditional financial intermediaries. Within this work, we focus on the use of DeFi
∗
Department of Mathematics, SUNY at Buffalo Buffalo, NY 14260. mbichuch@buffalo.edu. Work is partially
supported by NSF grant DMS-1736414.
†
School of Business, Stevens Institute of Technology, Hoboken, NJ 07030, USA, zfeinste@stevens.edu.
1for constructing markets to trade financial instruments; specifically, Automated Market Makers
(AMMs) are a decentralized approach for creating financial markets. The key idea is to create a
(liquidity) pool of assets against which a trader can transact; a swap is executed on the pool at
a price determined by the AMM according to an invariance function. A key benefit of DeFi and
AMMs is that any individual can invest in the pool so that he or she can share in the benefits from
providing these key services in the financial system.
The organization of this paper is as follows. The motivation for studying DeFi and, more
specifically, AMMs is provided within Section 1.1. A review of the literature on AMMs is provided
within Section 1.2. The introduction is then concluded by an overview of the primary contributions
and results of this work in Section 1.3. In Section 2, the desirable economic and financial properties
for markets made by AMMs are provided. The mathematical construction of a generic AMM is
presented within Section 3. With that discussion, the properties of the realized swap value and the
pricing oracle derived from the AMM are provided and compared with those desirable properties
in Section 2. In Section 4, these axioms and properties are then validated against AMMs that exist
in practice as well as a new mathematical structure that can be used for generating new AMMs.
Finally, in Section 5, we present a discussion on how the pool can collect fees along with the possible
risks that are involved with becoming a liquidity provider (i.e., the divergence or impermanent loss).
We summarize and conclude in Section 6. The proofs of all results are provided within Appendix C.
## 1.1 Motivation
At the most recent peak for cryptocurrency valuation on Nov 8, 2021, the total market capitalization
of various DeFi projects was nearly $180B.1 Since then, and especially after the onset of the so-
called “crypto winter” in May 2022, the risk of various DeFi projects has come into full view of the
public. To highlight just a few DeFi failures: the demise of the algorithmic stablecoin TerraUSD
– which was triggered by a run on the Terra Luna coin – wiped out billions of dollars in wealth in
a single week; separately, the DeFi lending platform Celsius Networks, which had approximately
$12B in assets under management prior to the crypto winter, filed for bankruptcy in July 2022.
With the onset of the crypto winter and the crash in cryptocurrencies, the total value locked in to
pools at Decentralized Exchanges has dropped precipitously as well with, e.g., Curve falling from
1
https://tradingview.com/markets/cryptocurrencies/global-charts/
2a market capitalization of almost $3B in early January 2022 to just over $300M in June 2022.2
With the irrational exuberance subsiding, now is the perfect time to explore the viability and risks
associated with DeFi projects. Specifically, for the purposes of this work, we wish to quantify
the risks, and understand the pitfalls, of AMMs while highlighting the benefits for investors and
liquidity providers.
One beneficial aspect of AMMs, and a defining property of them, is the decentralization. While
much has been written on the decentralization of transaction verification through blockchain, AMMs
also allow for decentralization in rewards. This is because anybody can become a liquidity provider
in, and therefore a shareholder of, the pool. Due to this democratization of market making, AMMs
lower the barriers for listing new securities (or tokens) considerably.
Of course, with any type of investment also comes risk; as such, understanding the downsides
for liquidity providers (i.e., investors in a pool) is vital. We tackle this problem by formalizing the
axioms that AMMs operate under. For example, we prove that the typical constructions of AMMs
in practice (without fees) always have a divergence loss – a detrimental result for liquidity providers.
In fact [31] states “this “loss” only disappears when the current proportions of the pool assets equal
exactly those at liquidity provision, which is rarely the case.” As such, fees are necessary to provide
a cushion for the investors against this loss and, thereby, to encourage investment in pools; however,
not every fee structure works well. For example, a pool can charge fees on any of its quoted assets
either before or after the verification of a trade. While any combination of fees can intuitively work,
some fee structures can lead to, e.g., the pool charging smaller fees for bulk trades. As far as we
are aware, the implication of fees on optimal investor behavior has not previously been studied.
Due to these (and other) conceptual benefits and risks for AMMs, in this work we postulate
(intuitive) axioms for AMMs to follow and deduce their implications for traders and liquidity
providers. Providing such a mathematical foundation for AMMs permits an exploration of the
fundamental properties of these DeFi products; this includes both investigating real-world AMMs
and proposing new AMMs that satisfy the appropriate axioms. As touched on above, studying
these AMMs mathematically allows us to consider the implications of different fee structures and,
importantly, propose a new fee structure for AMMs which is ambivalent to trade execution (i.e.,
between trading in bulk or splitting a transaction).
2
https://coinmarketcap.com/currencies/curve-dao-token/
31.2 Literature review
AMMs for cryptocurrencies and other digital assets have existed since, at least, 2018 with the
launch of Uniswap. As summarized by the defining whitepapers [32, 3], this initial AMM follows a
constant product rule for swapping assets. Briefly, and explained more in depth within Section 4.1
and Appendix B.1, if the pool holds two types of assets then the product of the reserves of those
assets must be the same before and after any swap is realized. We refer the interested reader to,
e.g., [24] for a thorough comparison of the constant product market with a limit order book market.
This notion of keeping the value of a function (e.g., the product) of asset reserves invariant to swaps
was later generalized into the idea of constant function market making.
The basic construction of constant function market makers was formalized in [8]. These struc-
tures were studied for use with making foreign exchange markets for digital assets in [26]. Typically
for simplicity, and as is taken within this work, these pools are presented for markets with two assets
only. In [7], trading in multi-asset pools was considered. Alternatively, trading against multiple
pools was presented within [19]. [12] provides a generalized structure for the interactions that can
occur between investors and the pool. We refer the interested reader to [31] for a summary of
terminology and structures that are currently used in practice in this field. [10] studies specific
widely-used AMM structures to investigate the implications that this parameterized AMM has on
price stability to determine scenarios in which different structures may be most appropriate.
The profitability of AMMs in an economic framework with different investor classes was studied
in [13]. The risks, and the appropriate hedging of those risks, for specific AMM structures have
been studied in numerous works; we highlight the study of the divergence loss of Uniswap V2 [4]
and Uniswap V3 [18]. (These constant product market makers were studied in a number of other
works as well, e.g., [16, 6].) The costs of being a liquidity provider were further analyzed within [27].
Conversely, [11] proposes a method to construct AMMs which replicate the payoff of a financial
derivative allowing for the study of derivative pricing to inform AMM valuation.
In a separate context, AMMs for prediction markets were first proposed in [22]. Such a structure
is fundamentally different from the constant function market makers considered herein insofar as
a prediction market includes a terminal time at which bets are realized. As summarized above,
constant function market making has no terminal time but rather is focused merely on the spot
4market between two (or more) assets.
Though most prior works on AMMs have focused on specific market structures such as the
constant product market maker of Uniswap V2, select literature has considered the generalized
AMM construction from a mathematical perspective. For instance, [13] introduces specific sufficient
conditions for the constant function construction for the results provided in that work. Similarly
to this work, [20, 28] explicitly propose axioms for AMMs as well though the former only loosely
imposes conditions and the latter focuses on the relation to prediction markets. Additionally, [9]
provides geometric axioms for AMMs in a similar vein to those taken herein. We refer the interested
reader to Appendix F for a detailed overview of the axioms assumed in these other works and how
they compare with the results presented herein.
## 1.3 Primary contributions
In light of the aforementioned growth and contraction of DeFi, and keeping the specific motivations
provided within Section 1.1 in mind, the primary contributions of this paper are as follows.
• We construct an axiomatic definition for AMMs and characterize the economic implica-
tions of these various axioms on the swap amount and pricing oracle within Section 3. As
highlighted in Section 1.2, prior studies of AMMs have imposed strict requirements on the
structure of the AMM for mathematical simplicity. As discussed in Section 4.1, some of these
strict mathematical structures are not satisfied by many widely used AMMs, whereas the
axioms proposed herein are satisfied.
• Beyond providing axioms and properties for AMMs, we consider (as far as the authors are
aware) a novel fee structure for an AMM in Section 5. This framework, e.g., imposes a
logical indifference to trade execution which is lost by other constructions presented within
the literature. Along with the construction of fees, we provide a mathematical description
and consideration of the divergence loss – also called impermanent loss – which defines the
risk a liquidity provider assumes by pooling with the AMM.
• Of particular use for practitioners, we mathematically characterize widely-used real-
world AMMs in Section 4 and expanded upon in Appendix B. By characterizing these
AMMs, we are able to demonstrate which axioms are satisfied and violated by these structures.
5We then propose some new AMM constructions which extend real-world AMM constructions
in novel ways satisfying the desired mathematical and financial properties discussed within
this work.
## 2 Market design
When creating a new financial market, there are certain properties that are desirable for the efficient
use of liquidity. As the purpose of this work is to study markets made by AMMs, we will first review
the financial properties we deem desirable for these novel markets. Specifically, we consider two
types of properties: those that are are desirable for any market structure (e.g., for traditional
limit-order books) and those that are specific to AMMs.
First, as discussed in, e.g., [8, 25, 1], any traditional market (i.e., based on a limit-order book)
should satisfy the following properties:
(No Arbitrage) Buying and, immediately, selling (resp. selling and, immediately, purchasing)
assets results in no more value at the end than at the beginning of the transaction. As a
consequence, e.g., no amount of assets are recovered when no cash is paid (resp. no cash is paid
when 0 assets are sold).
(Path Independent) Neglecting fees, the number of assets purchased in a single large trade is
equal to the sum total from placing multiple small trades in rapid succession (that sum to the
large transaction) (resp. the total cash recovered from a large liquidation is bounded by that
which is recovered from small transactions).3
(No Wasted Liquidity) The entire market liquidity can be purchased for a, potentially infinite,
cost (resp. recovered from an infinite-sized sale).4
(Positive Marginal Return) More assets are purchased with a larger expenditure of cash (resp.
more cash is recovered when more assets are sold).5
(Decreasing Marginal Return) Market prices are nondecreasing in the number of units pur-
chased (resp. market prices are nonincreasing in the number of units sold).
In order to consider the properties specific for AMMs, we need to introduce a few notions of
3
This property was independently defined in [21] as PathIndependence.
4
For a traditional market, this corresponds to a sufficiently wealthy trader’s ability to purchase the entire book.
5
This property was independently defined in [21] as NoDominatedTrades.
6decentralized exchanges which will be more formally defined below. AMM pools function by holding
reserves of liquidity in all of the assets that it trades. One of these assets, typically, acts as the
numéraire (“cash”) against which all prices are quoted. The pool uses these reserves in order to
execute swaps desired by external traders. The pool quotes prices on these assets in such a way so
as to be consistent with the swaps that it permits, i.e., via the cost of a marginal swap. With these
ideas, an AMM should satisfy the following properties so that the designed market is usable and
follows economic logic:
(Infinite Liquidity) The market can act as a counterparty for any trade, i.e., assets are always
available for purchase or sale.6
(Monotone in Liquidity) As the liquidity of a single asset increases, while that of all others
remains unchanged, its price drops. Conversely, as the liquidity of only the numéraire asset
increases, the price of all other assets grow.
(Pooling Increases Liquidity) Larger asset reserves in the pool, starting from the same initial
price, lead to lower execution costs for buying and a higher recovery value for selling assets.
In the following section, we will formally introduce the mathematical structure utilized by
AMMs and introduce a number of axioms on that framework in order to guarantee the aforemen-
tioned properties. The relation between these axioms and desired properties is summarized within
Table 2 of Appendix A (with axioms defined in Definition 3.1). A simple review of this summary
table provides a clear indication that some properties are unnecessary to guarantee any of these
desirable market properties and, thus, may not be needed in practice.
## 3 Constant function market maker
Constant function market makers are the most prevalent AMMs that exist in practice; for instance,
the most prominent AMM – Uniswap – is a constant function market maker. Due to this promi-
nence, we will often equate the concepts of AMMs and constant function market makers within this
work. Fundamentally, a constant function market maker is a multivariate utility function which
codifies the value placed on a portfolio by the liquidity providers. This utility function has the
6
This property was independently defined in [21] as BoundedReserves. We also wish to note that this is similar to
Liquidation as defined therein except that that property assumes that the market maker can pay out infinite amounts
of any asset for a high enough price.
7dual task of providing liquidity to the market via swaps and acting as a pricing oracle to quote
spot prices on the assets. The construction and axioms of such a utility function are provided
within Section 3.1. For this reason, within this work, we will equate the AMM smart contract
with its underlying utility function. For simplicity, we will assume the pool of asset reserves only
permits swaps between two assets A and B, although similar axioms can be developed for multi-
asset swaps as well. Simply put, and as expressed within e.g. [8], a trader exchanging quantity x
of asset A with a constant function market maker u receives quantity Y(x) of asset B such that
u(a + x,b − Y(x)) = u(a,b) where the market maker has initial reserves (a,b) in the two assets;
this is explored within Section 3.2. The pricing oracle provides exactly the swap amounts for a
marginally small trade, i.e., Y′(0); this is explored in depth within Section 3.3. Throughout these
discussions, we relate the provided axioms of AMM utility functions to the properties of a well-
designed market as provided in Section 2. Recall that the proofs for all results are provided within
Appendix C.
## 3.1 Axioms
As expressed in the introduction of this section, an AMM is a multivariate (herein always taken to
be bivariate) utility function which codifies the value placed on a portfolio by the liquidity providers.
This utility function defines the price impacts of swaps and acts as a pricing oracle to quote spot
prices on the assets. Within the following definition, we encode the axioms on these AMMs we
impose at various points within this work. To correspond more closely to the typical utility theory
(see, e.g., [30]), we note that the functions provided for AMMs in practice (see Section 4.1 and
Appendix B) are often characterized as the exponential of the formulations given herein. We will
clarify this point in Example 3.2 below. By formulating AMMs in this way, we are able to directly
interpret the provided axioms in the same way as taken in utility theory. To simplify notation,
throughout we use subscripts to denote partial derivatives; in line with the nomenclature for our
two assets, subscript A (respectively B) denotes the partial derivative w.r.t. the first (second) input.
Definition 3.1. An AMM is a utility function u : R2
+ → R∪ {−∞} that may satisfy the following
properties:
(UfB) Unbounded from below: u(x,0) = u(0,y) = −∞ for every x,y ≥ 0 and u(z) > −∞ for
8every z ∈ R2
++.
(UfA) Unbounded from above: limx̄→∞ u(x̄,y) = limȳ→∞ u(x,ȳ) = ∞ for every x,y > 0.
(SM) Strictly monotonic: u(z) > u(z̄) if z − z̄ ∈ R2
+\{0} for z,z̄ ∈ R2
++.
(C) Continuous: u is continuous.
(QC) Quasiconcave: u is quasiconcave.
(SI) Scale invariant: if u(z) ≥ u(z̄) for z,z̄ ∈ R2
+ then u(tz) ≥ u(tz̄) for any t ≥ 0.
(I+) Inada+: u is differentiable with:
• limx̄→∞ uA(x̄,y) = limȳ→∞ uB(x,ȳ) = 0,
• limx̄→∞ uB(x̄,y) ∈ (0,∞), limȳ→∞ uA(x,ȳ) ∈ (0,∞),
• limx̄→0 uA(x̄,y) = limȳ→0 uB(x,ȳ) = ∞,
• limx̄→0 uB(x̄,y) < ∞, limȳ→0 uA(x,ȳ) < ∞
for every x,y > 0.
(SC) Single crossing: u is twice continuously differentiable with uA(z),uB(z) > 0, uB(z)uAA(z) ≤
uA(z)uAB(z), and uA(z)uBB(z) ≤ uB(z)uAB(z) for every z ∈ R2
++.
Example 3.2. The most commonly reported AMM is the constant product market maker with
function F(x,y) = xy which is utilized by, e.g., Uniswap V2. As noted above, to correspond more
closely with the literature on utility functions, herein we formalize Uniswap V2 as the logarithmic
utility u(x,y) := log(F(x,y)) = log(x) + log(y) instead. We expand on this AMM in Section 4.1
and Appendix B.1. Notably, and as can be trivially verified, the logarithmic utility function satisfies
all axioms proposed within Definition 3.1.
Remark 1. We wish to note that some of the axioms of Definition 3.1 can imply others. For
instance, (SC) implies (SM) and (C) and, additionally, (QC) if at least one of the defining in-
equalities is strict; this condition is further implied by (SM) and a monotone differences property
(uAA,uBB ≤ 0 and uAB ≥ 0) that is explicitly given in Assumption 1 of [13] for AMMs. Within our
9discussion of some real-world AMMs (see Section 4.1), we note that this monotone difference con-
dition is not satisfied in many cases. However, the relevant mathematical properties from monotone
differences of an AMM – as shown in [13] – appear to be satisfied under the weaker (SC) condition
proposed herein. A full description of the axioms used within [13] (as well as other works) and their
relation to those provided within Definition 3.1 is provided in Appendix F.
Remark 2. We refer to condition (I+) as the Inada+ condition as the usual Inada conditions
(i.e., limx̄→0 uA(x̄,y) = limȳ→0 uB(x,ȳ) = ∞ and limx̄→∞ uA(x̄,y) = limȳ→∞ uB(x,ȳ) = 0 for any
x,y > 0) are satisfied; in addition to these properties, (I+) also provides the strict monotonicity of
u(x,y) in y as x → ∞ (and vice versa for monotonicity of x as y → ∞) as well as behavior of the
derivatives at 0.
Remark 3. Theorem 3.12(1) provides the interpretation of (SC) as providing a single crossing
condition for both fA((x,y),δ) := u(a+δ +x,b−y) and fB((x,y),δ) := u(a+x,b+δ −y) for any
a,b > 0. Specifically, for any feasible (x′,y′) ≥ (x′′,y′′) and δ′ ≥ δ′′,
fA
((x′
,y′
),δ′
) ≥ fA
((x′′
,y′′
),δ′
) ⇒ fA
((x′
,y′
),δ′′
) ≥ fA
((x′′
,y′′
),δ′′
)
fB
((x′
,y′
),δ′′
) ≥ fB
((x′′
,y′′
),δ′′
) ⇒ fB
((x′
,y′
),δ′
) ≥ fB
((x′′
,y′′
),δ′
).
Similarly, the results can be shown for subtracting x and adding y.
The first task of an AMM pool is to act as a liquidity provider to facilitate swaps between the
two assets. The size of these swaps is provided by the functions Y,X.
Definition 3.3. Let u : R2
+ → R ∪ {−∞} be an AMM. Let (a,b) ∈ R2
+ be the size of the reserves
of asset A and B within the pool respectively. The swap values Y : R3
+ → R+ and X : R3
+ → R+
are defined for any x,y ≥ 0 as:
Y(x;a,b) := sup{y ∈ [0,b] | u(a + x,b − y) ≥ u(a,b)},
X(y;a,b) := sup{x ∈ [0,a] | u(a − x,b + y) ≥ u(a,b)}.
Where clear, we will drop the explicit dependence of Y,X on the pool sizes (a,b) ∈ R2
+.
10Remark 4. Though Definition 3.3 differs slightly from the typical form of a constant function
market maker (see, e.g., [8]) in that the “constant function” can be an inequality here. Provided
the equality is attained (see, e.g., the conditions in Lemma 3.7(2) below), i.e., u(a+x,b−Y(x)) =
u(a,b), we can recover a notion of the indifference price for the quantity x (see, e.g., [14] but for
AMMs). As discussed above, in this way the axioms of Definition 3.1 can be interpreted as in
standard utility theory (see, e.g., [30]).
Example 3.4. Consider again the Uniswap V2 logarithmic utility function introduced within Ex-
ample 3.2. The resulting swap functions Y,X : R3
+ → R+ have analytical forms Y(x;a,b) = bx
a+x
and X(y;a,b) = ay
b+y, for any x,y ≥ 0 and a,b > 0.
The second task of an AMM, encoded by the utility function u : R2
+ → R ∪ {−∞}, is to act as
a pricing oracle P : R2
++ → R++. Throughout this work we will consider the price P of asset A
denominated in units of asset B. For B in terms of A, the reciprocal 1/P is taken instead; further
considerations of the change of numéraire and a bid-ask spread are presented within Sections 3.3
and 5. For the purposes of the definition of the pricing oracle, we will assume that the swap
function Y is differentiable at (0;a,b); we will use the above axioms on the utility u to guarantee
this derivative exists within Section 3.2 below.
Definition 3.5. The pricing oracle P : R2
++ → R++ provides the marginal units of asset B obtained
from selling a marginal number of units of asset A, i.e., P(a,b) := Y′(0;a,b) for any a,b > 0.
Example 3.6. Consider again the Uniswap V2 logarithmic utility function introduced within Ex-
ample 3.2. The resulting pricing oracle P : R2
++ → R++ is provided by the ratio of the reserves in
the pool, i.e., P(a,b) = b/a for any a,b > 0.
## 3.2 Swaps
Herein we wish to study the swap values Y,X when transferring between the assets in a pool using
an AMM. To reduce redundancy, throughout this section, we will focus on the properties of the
swap of units of A for B only, i.e., properties of Y as given in Definition 3.3. By symmetry of the
AMM, comparable results can be provided for the swap of units of B for A (i.e., X).
First, we will consider whether the AMM and the current pool reserves can satisfy the constant
function framework, i.e., u(a,b) = u(a + x,b − Y(x)). As highlighted above, this constant function
11framework is how the swap amounts Y are normally defined (see, e.g., [8]) even though a solution to
the constant function need not exist nor be unique for general utility functions u. For instance, we
highlight mStable (details provided in Appendix B.4) for which no feasible solution exists for a trade
of size x > b. Notably, this constant function structure follows trivially when the AMM satisfies
(Infinite Liquidity) so that the pool never depletes its reserves. As provided in the following lemma,
an AMM satisfying (UfB) and (C) is guaranteed to generate a market with (Infinite Liquidity).
Lemma 3.7. Consider an AMM u : R2
+ → R ∪ {−∞}. Fix the initial pool a,b > 0 and swap
amount x ≥ 0.
1. If (C) then u(a + x,b − Y(x)) ≥ u(a,b), i.e., market utility never drops.
2. If (C) and Y(x) 6= b then u(a + x,b − Y(x)) = u(a,b), i.e., the constant function market
maker structure is satisfied.
3. (Infinite Liquidity): If (UfB) and (C) then Y(x) < b.
Having determined how the properties of the AMM utility relates to those of the swapped
amount Y, we want to consider fundamental properties of financial markets. Within the subsequent
lemma, we consider sufficient conditions for the resulting market to satisfy (Positive Marginal Return),
i.e., the price of assets never drops below 0. Furthermore, in related results, we also find that a
simple no-arbitrage condition (Y(0) = 0) so that no assets are recovered if the trader pays nothing.
Finally, augmenting also Lemma 3.7(3), sufficient conditions are provided so that the pool has access
to all of its asset reserves if a sufficiently large trade is undertaken, i.e., (No Wasted Liquidity).
Lemma 3.8. Consider an AMM u : R2
+ → R ∪ {−∞}. Fix the initial pool a,b > 0 and swap
amount x ≥ 0.
1. If (SM) then Y(0) = 0, i.e., no assets are recovered when no payment is made.
2. (Positive Marginal Return): If (SM) then Y is nondecreasing in x. If, additionally, (UfB)
and (C) then Y is strictly increasing in x.
3. (No Wasted Liquidity): If (UfA), (SM), and (C) then limx→∞ Y(x) = b.
12In addition to (Positive Marginal Return), financial markets should have (Decreasing Marginal Return),
i.e., increasing costs as more assets are purchased. This notion can be mathematically encoded by
concavity of Y. Sufficient conditions for such a result are provided in the subsequent lemma. In
addition, by applying (SI), a relation between the pool sizes and trade sizes can be provided; specif-
ically, the recovered assets grow in proportion to, jointly, the trade size and asset reserves in the
pool. This simplifying structure matches what occurs on, e.g., a limit-order book when all trades
in the book are scaled proportionally.
Lemma 3.9. Consider an AMM u : R2
+ → R ∪ {−∞}. Fix the initial pool a,b > 0 and swap
amount x ≥ 0.
1. If (C) then Y is upper semicontinuous.
2. (Decreasing Marginal Return): If (C) and (QC) or (SC) then Y is concave, continuous
and a.e. differentiable.
3. If (C) and (SI) then Y is positive homogeneous in (x;a,b), i.e., Y(tx;ta,tb) = tY(x;a,b) for
any t > 0.
4. If (SM), (C), and (QC) or (SC) then Y is subadditive, i.e., the number of assets purchased in
a single large trade is no larger than sum total from placing multiple small trades (that sum
to the large transaction) when all such trades are assessed at the current market snapshot.
Remark 5. Subadditivity of Y (Lemma 3.9(4)) differs from (Path Independent) in that the former
property assumes that, for all trades, the market conditions (i.e., pool reserves) are frozen at the
current state; in the latter property, the market conditions evolve as swaps are actualized.
Remark 6. Assume (C) and (QC) or (SC). It follows from Lemma 3.9(2) that Y and X are
concave. Therefore, sub-differentials of Y and X are always well defined, and will a.s. coincide
with the derivative. This allows us to give the following definition.
Definition 3.10. Denote Y′(x;a,b) := lim
εց0
Y(x+ε;a,b)−Y(x;a,b)
ε , and similarly for X′(x;a,b) if they ex-
ist. If the AMM is differentiable (with nonzero partial derivatives) then Y′(x;a,b) = uA(a+x,b−Y(x;a,b))
uB(a+x,b−Y(x;a,b))
by implicit differentiation (similarly for X′(x;a,b)). Furthermore, assuming differentiability of the
AMM, denote Ya(x;a,b) = lim
εց0
Y(x;a+ε,b)−Y(x;a,b)
ε , and similarly for Yb(x;a,b),Xa(x;a,b),Xb(x;a,b),
which can all be formulated via implicit differentiation as well.
13We conclude our discussion of the properties of swaps without fees by considering a simple
strategy to optimally execute transactions. In particular, we consider how a trader may want to
split transactions, either into smaller trades or as a round-trip transaction (i.e., potential arbitrage
opportunities). As described by (Path Independent) and (No Arbitrage), without fees,7 a trader
should be indifferent in how their swap is executed. Formally, (Path Independent) can be viewed
as a type of no arbitrage argument for trades going in the same direction whereas (No Arbitrage)
considers trades that reverse directions.
Lemma 3.11. Consider an AMM u : R2
+ → R ∪ {−∞}. Fix the initial pool a,b > 0 and swap
amounts x1,x2 ≥ 0.
1. (Path Independent): If (UfB), (SM), and (C) then Y(x1+x2;a,b) = Y(x1;a,b)+Y(x2;a+
x1,b − Y(x1;a,b)).
2. (No Arbitrage): If (SM) and (C) then X(Y(x;a,b);a+x,b−Y(x;a,b)) ≤ x and Y(X(y;a,b);a−
X(y;a,b),b +y) ≤ y for any x,y ≥ 0 and a,b > 0. If, additionally, (UfB) then these inequal-
ities hold as equalities for every x,y ≥ 0 and a,b > 0.
Remark 7. Lemma 3.11(1) implies an investor is indifferent to trade execution, i.e., (Path Independent).
However, as discussed in Remark 24 in Appendix D, naively assessing fees to transactions can re-
sult in this property no longer holding in general. As discussed in Remark 5, Lemma 3.9(4) implies
splitting a transaction with pool recovery receives a higher value.
Within the next theorem, we want to study the implications of changing the pool sizes a,b.
Specifically, how altering the pool composition changes the value of a swap and the limiting behavior
as pool sizes shrink to 0 or grow to infinity.
Theorem 3.12. Assume (UfB) and (SC).
1. (Monotone in Liquidity): Ya(x;a,b) ≤ 0 and Yb(x;a,b) ∈ [0,1) for any x ≥ 0 and a,b >
0.
2. limāց0 Y(x;ā,b) = b and limb̄ց0 Y(x;a,b̄) = 0 for every a,b,x > 0 with the latter limit
converging uniformly in a,x, i.e., as asset reserves in A drop to 0 the value of asset A grows
to ∞ whereas the value of asset A decreases to 0 when reserves of B drop to 0.
7
Fees are introduced and studied in Section 5 and Appendix D below.
143. If additionally (QC) and (I+) then limāր∞ Y(x;ā,b) = 0 and limb̄ր∞ Y(x;a,b̄) = ∞ for
every a,b,x > 0, i.e., as asset reserves in A grow to ∞ the value of asset A drops to 0
whereas the value of asset A grows to ∞ when reserves of B grow to ∞.
## 3.3 Pooling and the pricing oracle
Recall from Definition 3.5 that the pricing oracle P : R2
++ → R++ provides the marginal units of
asset B obtained from selling a marginal number of units of asset A, i.e., P(a,b) := Y′(0;a,b) for
any a,b > 0.
Remark 8. Following Lemma 3.11, if (SM) and the AMM u is differentiable then there does not
exist a bid-ask spread in the pricing oracle for strictly positive reserves, i.e., P(a,b) = Y′(0;a,b) =
1
X′(0;a,b) for any a,b > 0.
In the following proposition, we consider simple properties on the pricing oracle. Specifically,
though already considered above for the swap function in Section 3.2, we consider ways in which
(Monotone in Liquidity) and (Infinite Liquidity) can be represented with the pricing oracle. Further
details of (Infinite Liquidity) are provided in Remark 9.
Proposition 3.13. Assume (SC).
1. (Monotone in Liquidity): The pricing oracle P is differentiable with PA ≤ 0 and PB ≥ 0.
2. If, additionally, (UfB), (QC), and (I+) then for any a > 0, b 7→ P(a,b) is nondecreasing and
surjective on R++.
3. If, additionally, (UfB), (QC), and (I+) then for any b > 0, a 7→ P(a,b) is nonincreasing and
surjective on R++.
4. If, additionally, (SI) then P is scale invariant, i.e., P(ta,tb) = P(a,b) for any reserves
a,b > 0 with scaling t > 0.
Remark 9. (Infinite Liquidity) implies that that swaps are able to fluctuate prices within rangeP ⊆
R++ with inf rangeP = 0 and suprangeP = ∞. In contrast, Proposition 3.13(2) and (3) imply it is
possible to trace the entire price curve R++ by manipulating the reserves in each asset independently.
15As opposed to more traditional market makers, an AMM allows investors to join the liquidity
pool and capture a fraction of the profits (see Section 5 and Appendix D below for a discussion of fee
structures). As presented in, e.g., [7], pooling should be accomplished so that the price is unaffected
by the injection of additional liquidity into the market. That is, adding (α,β) ∈ R2
+\{0} to a pool
of size (a,b) ∈ R2
++ so that P(a+α,b+β) = P(a,b). Within the following theorem, we consider a
sufficient condition on the pricing oracle so that increasing the size of the reserves actually increases
market liquidity (Pooling Increases Liquidity), i.e., pooling (α,β) ∈ R2
+\{0} results in
Y(x;a + α,b + β) ≥ Y(x;a,b), X(y;a + α,b + β) ≥ X(y;a,b), ∀x,y ≥ 0. (3.1)
Theorem 3.14. (Pooling Increases Liquidity): Assume (SC). Pooling (i.e., injecting (α,β) ∈
R2
+\{0} to the initial pool (a,b) ∈ R2
++ such that P(a + α,b + β) = P(a,b)) increases market
liquidity as defined in (3.1) if either: (1) the AMM satisfies (SI); or (2) the utility function u :
R2
+ → R ∪ {−∞} is thrice continuously differentiable, (UfB), (QC), (I+), and
PB(z)PAA(z) − (P(z)PB(z) + PA(z))PAB(z) + P(z)PA(z)PBB(z) ≥ 0, ∀z ∈ R2
++. (3.2)
Remark 10. Maintaining a constant price is a necessary condition for increased liquidity as
P(a,b) = Y′(0;a,b) = 1
X′(0;a,b). Under (SI), due to Proposition 3.13(4), this reduces to the simpler
“proportional to current reserves” rule-set that is often assumed instead (see, e.g., [13]).
Remark 11. As far as the authors are aware, there is no meaningful financial condition that implies
(3.2). This is merely a mathematical argument on the pricing oracle P that provides sufficient
conditions for the desired increasing liquidity property of (3.1). As highlighted in the proof of
Theorem 3.14 in Appendix C.7, (3.2) arises so as to guarantee that the number of units α 7→ β(α)
of B being pooled is more sensitive to the number of units α of A being pooled before any swap
(x,Y(x)) is actualized on the pool (with decreasing sensitivity in the size of the swap x ≥ 0). As
highlighted in Section 4 below, all AMMs studied within this work satisfy this condition, though as
demonstrated in Section 4.2 this curvature condition is independent of the other axioms on AMMs.
Inspired by Proposition 4.1 below, it can be shown that (3.2) follows from (SC) along with
uA,uB log-convex (with u thrice differentiable) and uAB ≥ 0; we wish to recall from Remark 1
16that Assumption 1 of [13] imposes the second derivative condition uAB ≥ 0 though this stronger
condition is not satisfied for every AMM utilized in practice as highlighted in Section 4.1.
Example 3.15. Consider again the Uniswap V2 logarithmic utility function introduced within
Example 3.2. As this utility is such that uA(a,b) = 1/a, uB(a,b) = 1/b are log-convex and uAB = 0
is non-negative, as provided in Remark 11, Uniswap V2 satisfies (3.2). We wish to note that the
product formulation of this AMM is such that FA(a,b) = b and FB(a,b) = a are not log-convex;
even though (3.2) is invariant to monotonic transformations of the utility function, the use of the
logarithmic transformation can assist in verifying these essential properties.
We conclude this section on pooling and the impacts of liquidity by quantifying a measure of
price impacts. We consider this in three parts: first, we determine the effect that pooling has on
price impacts from executing a swap; second, we define a (approximating) price impact oracle that
only depends on the current pool reserves; finally, we find conditions so that this price impact
oracle can be used to bound the actualized price impacts from any swap. In studying this measure
we are able to compare AMM constructions as well as measure the level of liquidity impacts.
Corollary 3.16. Define the price impacts for swapping assets A for B and vice versa, respectively,
as: IY(x;a,b) = P(a,b)x − Y(x;a,b), IX (y;a,b) = y/P(a,b) − X(y;a,b), (a,b) ∈ R2
++, x,y ≥ 0.
Under the conditions of Theorem 3.14, pooling decreases the price impact from swapping. In other
words, for any x,y ≥ 0, pooling additional liquidity (α,β) ∈ R2
+\{0} to the initial pool (a,b) ∈ R2
++
such that P(a + α,b + β) = P(a,b) decreases the price impacts
IY(x;a,b) ≥ IY(x;a + α,b + β), IX (x;a,b) ≥ IX (x;a + α,b + β). (3.3)
Corollary 3.16 introduce the new notations IX ,IY of price impact from swapping that quantifies
this quantity. The key result shows that this impact decreases as liquidity is added to the pool.
This is of course a very desirable conclusion—recall (Pooling Increases Liquidity) from the market
design list—as this implies that the more liquid the market is, the closer to linear the price is even
for large transactions. Note that the linear part P(a,b)x (and y/P(a,b) respectively) is invariant
to additional liquidity.
Though IX ,IY capture the full price impacts from swapping, these functions explicitly depend
17on the size of the swap. We now wish to introduce a novel price impact oracle which is independent
to the swap size x,y.
Definition 3.17. The price impact oracle I : R2
++ → R provides (a multiplier of) the marginal
change in the pricing oracle from selling a marginal number of units of asset A, i.e., I(z) :=
−1
2Y′′(0;z) = 1
2[P(z)PB(z) − PA(z)] for any z ∈ R2
++.
Proposition 3.18. Consider a thrice continuously differentiable AMM u : R2
+ → R ∪ {−∞}. Fix
the pool reserves (a,b) ∈ R2
++, then the price impacts from swapping can be approximated via the
price impact oracle for any x,y ≥ 0 as:
IY(x;a,b) = I(a,b)x2
+ O
x
a
3

, IX (y;a,b) =
I(a,b)
(P(a,b))3
y2
+ O
y
b
3

.
Furthermore, pooling decreases the price impact oracle (i.e., I(a + α,b + β) ≤ I(a,b) when pooling
(α,β) ∈ R2
+\{0} into the pool with reserves (a,b)) if either of the conditions of Theorem 3.14 are
satisfied. Moreover, if (SC) and (SI) then the price impact oracle is positive homogeneous of degree
−1 (i.e., I(ta,tb) = t−1I(a,b) for any t > 0).
Proposition 3.18 formally presents how the price impact oracle approximates the actualized
price impacts, i.e., as a quadratic approximation. If trade sizes are sufficiently large then the
identified error term will become dominant. However, empirical analysis of a Uniswap pool finds
that trade sizes remain sufficiently small (in relation to the pool size) so that the price impacts
can be accurately captured by the quadratic term in practice. Specifically, Figures 1a and 1b show
that, empirically on data obtained from a Uniswap pool, the price impacts IY(x;a,b),IX (y;a,b)
are (almost) entirely captured by the quadratic terms I(a,b)x2, I(a,b)
P(a,b)3 y2, the coefficients of which
are independent of the trade size and only depend on the current market liquidity. Furthermore,
Figure 1c shows that even the relative errors for these quadratic approximations are empirically
very small. Thus we conclude that I(a,b) is a highly effective empirical measure for price impact.
Finally, to further quantify the accuracy of the price impact oracle, we further investigate its
use as an explicit bound on the price impacts in the following lemma.
Corollary 3.19. Consider a thrice continuously differentiable AMM u : R2
+ → R∪{−∞}. Assume
(SC) holds, and fix the pool (a,b) ∈ R2
++, then:
180 100 200 300 400 500 600 700 800
True Price Impacts
0
100
200
300
400
500
600
700
800
Quadratic Price Impacts
IY
(a) Graph of quadratic error
term I(a,b)x2
vs. the true price
impact IY.
0 1 2 3 4 5 6 7 8 9 10
True Price Impacts 105
0
1
2
3
4
5
6
7
8
9
10
Quadratic Price Impacts
105 IX
(b) Graph of quadratic error
term I(a,b)
P(a,b)3 y2
vs. the true price
impact IX .
Mar 23 Mar 25 Mar 27 Mar 29 Mar 31 Apr 02
2023
0
0.5
1
1.5
2
2.5
3
3.5
4
10-3 Relative Error in Price Impacts
(I x
2
- I
Y
)/I
Y
(I/P
3
y
2
- I
X
)/I
X
(c) Graph of the relative
error I(a,b)x2
−IY (x;a,b)
IY(x;a,b) and
I(a,b)
P(a,b)3 y2
−IY (x;a,b)
IY (x;a,b) between
March 23 and April 02, 2023.
Figure 1: Comparison of the approximation of the price impact and the true price impact using
Uniswap data between March 23 and April 02, 2023 from a USDC/WETH pool on the Polygon
blockchain (smart contract 0x45dda9cb7c25131df268515131f647d726f50608).
1. The pricing oracle bounds the swap amount, i.e., IY(x;a,b),IX (y;a,b) ≥ 0 for any x,y ≥ 0.
Additionally, the price impact oracle is nonnegative, i.e., I(a,b) ≥ 0.
2. If, additionally, for every z ∈ R2
++,
Ψ(z) := PAA(z) − 2P(z)PAB(z) + P(z)2
PBB(z) + (P(z)PB(z) − PA(z))PB(z) ≥ 0, (3.4)
then IY(x;a,b) ≤ I(a,b)x2 for any x ≥ 0.
3. If, additionally, for every z ∈ R2
++,
−P(z)Ψ(z) + 3(P(z)PB(z) − PA(z))2
≥ 0, (3.5)
then IX (y;a,b) ≤ I(a,b)
P(a,b)3 y2 for any y ≥ 0.
Remark 12. Condition (3.4) guarantees that, with a fixed amount of liquidity (i.e., along the utility
indifference curve), that the change in prices is convex as a trader swaps A for B. Condition (3.5)
guarantees the same result when swapping B for A. As highlighted in Remark 16, in the special
case of a decomposable utility function u(z) = U(z1) + U(z2), these conditions are related to the
absolute risk aversion of the univariate utility function U.
Remark 13. [10] introduced a definition for µ-price stability so that no swap (x,Y(x)) moves the
19price by more than µx with implicit dependence on the pool reserves (a,b) ∈ R2
++. Any AMM
satisfying (3.4) is, therefore, I(a,b)-price stable. Similarly, when considering swaps (X(y),y), the
pricing oracle is I(a,b)
P(a,b)3 -price stable if (3.5) holds.
As the above results show, the approximation of IY(x;a,b) via I(a,b)x2 (respectively IX (y;a,b)
via I(a,b)/(P(a,b)3)y2) is not only accurate empirically, but also is an upper bound on the price
impact encountered by the trader and is entirely captured by the quadratic term I(a,b). For
instance, if this term were to equal 0 then IY(x;a,b) = 0 via the results of Corollary 3.19, i.e., no
price impacts would be experienced by the trader. Additionally, the quantity I(a,b) is independent
of the trade sizes x,y, which makes the approximation simpler and even more desirable. Therefore,
we will use I(a,b) as a measure of price impact.
Example 3.20. Consider again the Uniswap V2 logarithmic utility function introduced within
Example 3.2. As the pricing oracle for this AMM is given by P(a,b) = b/a, and the price impact
oracle I(a,b) = b
a2 . We can directly check conditions (3.4) and (3.5). In particular, we find that
0 ≤ 6z2
z3
1
= Ψ(z) and 0 ≤
6z2
2
z4
1
= −P(z)Ψ(z) + 3(P(z)PB(z) − PA(z))2 for any z ∈ R2
++.
Therefore, following the results of Corollary 3.19, IY(x;a,b) ∈ [0, bx2
a2 ] and IX (y;a,b) ∈ [0, ay2
b2 ] for
any x,y ≥ 0 and (a,b) ∈ R2
++.
## 4 Examples of AMMs
Within this section we wish to explore a number of different AMMs. Within Section 4.1, we will
summarize a number of AMMs that exist in practice; the detailed mathematical representations
of these AMMs are provided within Appendix B. All such results have been empirically validated
through reference to the applicable white papers and documentation. A summary of the axioms
satisfied by these real-world AMMs is provided within Table 1. Within Section 4.2, we construct
a novel generalized AMM structure; we use that structure to provide a new concentrated liquidity
swap structure which has strong theoretical stability properties. We wish to remind the reader
that many of the AMMs presented below, and detailed in Appendix B, are often characterized as
the exponential of the utility functions provided herein; as the definition of the swap values X,Y
are based on relative utilities, this exponentiation does not impact the implementation, only the
description, of the AMM.
20AMM Details (UfB) (UfA) (SM) (C) (QC) (SI) (I+) (SC) (3.2) (3.4) (3.5)
Uniswap V2 B.1 X X X X X X X X X X X
Balancer B.2 X X X X X X X X X X X
Uniswap V3 B.3 X X X X X X X X
mStable B.4 X X X X X X X X X
StableSwap B.5.1 X X X X X X X X
L.StableSwap B.5.2 X X X X X X X X X
Curve B.6 X X X X X∗ X X X∗ X∗
Dodo B.7 X X X X X X X X
SDAMM 4.2 X† X† X† X† X† X† X† X† X† X†
Table 1: Summary of popular AMMs and the axioms satisfied. †: Under some conditions specified
in Proposition 4.1.
∗: Axiom verified numerically.
4.1 AMMs in practice
Herein we summarize a number of AMMs that exist in practice. The details for all of these AMMs
are provided within Appendix B. We, also, refer the reader to Table 1 which summarizes the findings
about all example AMMs considered within this work.
Fundamentally, most current AMMs are built based on two structures:
• Uniswap V2: As presented in the running example throughout Section 3 (beginning with
Example 3.2) and Appendix B.1, Uniswap V2 is the AMM with logarithmic utility function,
i.e., u(x,y) = log(x) + log(y). Notably, this simple structure satisfies all axioms presented
within this work. However, Uniswap V2 is often criticized as it is subject to high price
impacts as it tends to save a lot of liquidity solely for the tail of the price distribution (so as
to guarantee infinite liquidity).
• mStable: As presented in Appendix B.4, mStable is an AMM that has no price impacts at
all, i.e., u(x,y) = log(x+ y). In order to guarantee the constant price of mStable, this AMM
fails to satisfy (UfB) and (I+).
By combining the notions of these AMMs in different ways, a liquidity provider is able to concentrate
liquidity, i.e., lower the price impacts from trades, when the pool is “balanced” (i.e., when the asset
pools are of comparable size). StableSwap (u(x,y) = log(C(x + y) + xy) for parameter C > 0; see
Appendix B.5.1) considers a linear combination of Uniswap V2 and mStable within the logarithm.
By doing so, there is less price impact than Uniswap V2 but at the expense of infinite liquidity
21and positive homogeneity (i.e., (UfB), (SI) and (I+) are not satisfied). Such a construction is
especially valuable when pairing stablecoins (i.e., assets which are constructed so as to keep a stable
price against a reference instrument). Curve is an extension of StableSwap that satisfies (UfB)
and (SI) at the expense of (3.4), (3.5) and is only implicitly defined (u(x,y) = log(D(x,y)) for
D(x,y)3 + 4(C − 1)xyD(x,y) − 4C(x + y)xy = 0 with parameter C ≥ 1; see Appendix B.6). To
maintain the infinite liquidity and concentrate liquidity around a price of 1, the price impacts
in the tails (i.e., when one of the pools is nearly exhausted) become exceedingly high. Within
Appendix B.5.2, we introduce a new AMM structure, as the linear combination of UniSwap V2 and
mStable, which we call L.StableSwap (u(x,y) = C log(x+y)+log(x)+log(y) for parameter C > 0).
As with Uniswap V2 and Curve, all fundamental axioms are satisfied for this new construction and
it is subject to low price impacts near pool balance (a ≈ b for reserves a,b > 0). However, in contrast
to Uniswap V2 (but similar to Curve), (3.4) and (3.5) are not satisfied for this construction as it does
not exhibit price stability in the edges of its reserves. Notably, in contrast to Curve, L.StableSwap
is constructed with a simple analytical utility function. Both Curve and L.StableSwap, due to
their low price impacts8, are able to provide additional liquidity near the theoretical constant price
for stablecoin pairs, but still capable of providing some limited liquidity in the tails of the price
distribution. Due to the uniform distribution of liquidity in Uniswap V2, that AMM can serve well
for asset pairs with high volatility whereas these more stable AMMs are more appropriate for pairs
with low volatility.
Remark 14. In each of the aforementioned AMMs, we have described them so that P(t,t) = 1
for any t > 0. Especially when considering pairs of stablecoins, a different balanced price may be
desirable. Consider the desired balanced price p > 0, then setting ūp(x,y) := u(px,y) satisfies all
of the same axioms as u with pricing oracle P̄p(x,y) = pP(px,y); in particular, P̄p(t,pt) = p by
construction for any t > 0. Notably, in this case, the balance occurs not when the pool of asset A
and B are equal but rather when their ratio coincides with the desired price p.
Other AMMs are built from the structure of Uniswap V2 directly. Balancer (u(x,y) = wlog(x)+
(1−w)log(y) for parameters w ∈ (0,1); see Appendix B.2) is merely a weighted version of Uniswap
V2 so as to scale the asset pools when pricing. Uniswap V3 (u(x,y) = log(α + x) + log(β + y) for
8
Verified empirically for Curve.
22parameters α,β > 0; see Appendix B.3) introduces “virtual reserves” so as to concentrate liquidity
and decrease price impacts. However, the concentrated liquidity introduced in Uniswap V3 comes
at the expense of (UfB), (SI), and (I+) so that, much like StableSwap, it only has finite liquidity
and does not scale linearly.9
The final AMM which we consider that is used in practice is Dodo (u(x,y) = log(Pα(x,y) +
β(x,y)) for external price P > 0; see Appendix B.7). Dodo is fundamentally different from all other
AMMs considered within this work as it uses an exogenous pricing oracle (such as a centralized
exchange) and does not provide its own pricing oracle. Because there is no endogenous pricing
oracle, Dodo permits pooling and withdrawing in any combination of assets (though with the
possibility of withdrawal fees so as to guarantee the withdrawal is possible). The utility for Dodo
is constructed in such a way to attempt to match the external price.
Remark 15. As noted within Remark 1, [13] assumes AMMs satisfy a monotone differences prop-
erty (uAA,uBB ≤ 0 and uAB ≥ 0). However, the utility functions for mStable, StableSwap, Curve,
and Dodo do not satisfy this stronger property.
Select AMMs are compared visually in Appendix B.8.
## 4.2 Symmetric Decomposable AMM
Herein we propose a new class of AMMs which we name Symmetric Decomposable AMMs (SDAMMs)
that provides a simple analytical structure for the utility function. This is in contrast to the major-
ity of currently existing AMMs which, by and large, are combinations of Uniswap V2 and mStable.
Specifically, define the SDAMM utility function as
u(x,y) = U(x) + U(y)
for any x,y ≥ 0 with the univariate utility function U : R+ → R ∪ {−∞}. This can be seen as
a generalization of Uniswap V2 since taking U(z) := log(z) for any z ≥ 0 exactly replicates this
well-known AMM.
9
As detailed in [2] and provided in Appendix B.3, the virtual liquidity α,β for Uniswap V3 are dynamic in practice;
in fact, they are constructed in such a way that Uniswap V3 satisfies (SI).
23The following proposition relates the properties of the univariate utility function U to the axioms
of the associated SDAMM.
Proposition 4.1. Let U : R+ → R ∪ {−∞} be a thrice differentiable univariate utility function
and let u be the associated SDAMM. Immediately, u satisfies (C).
1. If U(0) = −∞ and U(z) > −∞ for any z > 0 then (UfB).
2. If limz→∞ U(z) = ∞ then (UfA).
3. If U is strictly increasing then (SM).
4. If U is concave then (QC). If, additionally, U is strictly increasing then (SC).
5. If U is strictly increasing and both limz→∞ U′(z) = 0 and limz→0 U′(z) = ∞ then (I+).
6. If U is strictly increasing, concave, and U′ is log-convex then (3.2).
7. If U is strictly increasing, concave, and 3U′′(z)2 ≥ U′(z)U′′′(z) ≥ 0 for any z > 0 then (3.4)
and (3.5).
Proposition 4.1 provides simple conditions on U : R+ → R ∪ {−∞} to guarantee the various
axioms proposed within this work. As these properties are easily satisfied (see, e.g., Uniswap V2
and Example 4.2), we highlight in Table 1 that SDAMM satisfies these axioms.
Remark 16. Proposition 4.1(7) provides a financial interpretation to (3.4) and (3.5). Specifi-
cally, 3U′′(z)2 ≥ U′(z)U′′′(z) for every z > 0 if and only if the absolute risk aversion of U does not
decrease too rapidly. In fact, if U has nondecreasing absolute risk aversion then this condition is au-
tomatically satisfied. It is for these reasons that we view conditions (3.4) and (3.5) as properties on
the absolute risk aversion of AMMs. Furthermore, to complete the discussion of Proposition 4.1(7),
the additional condition U′(z)U′′′(z) ≥ 0 for every z > 0 is equivalent to the convexity of U′ due to
the monotonicity of U.
With this utility function, the pricing oracle is defined as P(x,y) = U′(x)
U′(y) for x,y ≥ 0. In contrast
to many of the aforementioned AMMs, pooling for SDAMM can be much more complex as it need
not satisfy (SI).10 In fact, to accomplish pooling in such a case, we recommend a scheme in which
10
As proven in [29, Theorem 8], this decomposable structure for SDAMM satisfies (SI) if and only if U is a power
utility function.
24the liquidity provider supplies the assets in any ratio which the pool then swaps appropriately to
maintain a constant price. For instance, in Example 4.2 below, we consider a specific function U that
satisfies Properties (1)-(6) of Proposition 4.1 but is not scale invariant (SI) nor does it satisfy (3.4)
and (3.5); this proposed new AMM structure concentrates liquidity around the balanced reserve
price of 1. Within Section 5.2 below, we investigate some important implications of dropping the
scale invariance (SI) axiom.
Example 4.2. Let U(z) = log(sinh(Czq)) with C > 0 and q ∈ (0,1] for any z ≥ 0. This satisfies
all the properties considered within Proposition 4.1 except (7) (nor does it satisfy (SI)) if q < 1;
however, if q = 1, then (I+) is no longer satisfied as well. We use the hyperbolic sine function
because it limits to the exponential function as the pool size grows to infinity. As such this AMM
limits to mStable when the pool size is large enough (and as q → 1). In this way, this AMM pool
can have extremely stable prices at 1, even more than Curve, and have infinite liquidity. In order
to gain this price stability, an (extremely) unbalanced pool has extremely high price impacts in order
to remain liquid. Much like Curve and L.StableSwap, these stable AMMs fail to satisfy (3.4) and
(3.5) in order to still provide liquidity throughout the price curve.
## 5 Fee structures and divergence loss
Thus far, we have only discussed AMMs without any explicit fees collected by the liquidity providers.
Within this section we propose a novel structure for assessing fees on a swap.11 In doing so, we
explore the costs that liquidity providers may incur by investing in the pool. In particular, we
focus primarily on the so-called “impermanent loss” or divergence loss [31]. We refer the interested
reader to [24] for a discussion of the tradeoff between fees and adverse selection for the liquidity
providers. As before, we will primarily focus on the properties of Y as the results are symmetric
to X.
Assumption 5.1. Throughout the remainder of this paper, we will consider AMMs satisfying
(UfB), (QC), (I+), and (SC).
11
We directly compare this construction to the prior methods of assessing fees discussed within the literature
(.e.g, [8, 26]) in Remark 24 in the appendix.
255.1 Assessing fees on the marginal price
Herein we, first, wish to propose a novel structure for assessing fees on a swap. Specifically, we
propose that a fee γ ∈ [0,1] is assessed to each marginal unit being bought. This is accomplished
by assessing the fees directly on the price as given by the pricing oracle P. This interpretation is
consistent with a typical financial interpretation of a bid-ask spread (see, e.g., [17]).
Definition 5.2. Let u : R2
+ → R ∪ {−∞} be an AMM with associated pricing oracle P : R2
++ →
R++. Let a,b > 0 be the size of the reserves of asset A and B within the pool respectively. Let
γ ∈ [0,1] be the fee level assessed on a transaction. The swap functions with fees Yγ : R3
+ → R+
and Xγ : R3
+ → R+ are defined for any x,y ≥ 0 as:
Yγ(x;a,b) := (1 − γ)
Z x
0
P(a + z,b − Yγ(z;a,b))dz, (5.1)
Xγ(y;a,b) := (1 − γ)
Z y
0
1
P(a − Xγ(z;a,b),b + z)
dz. (5.2)
Where clear, we will drop the explicit dependence of Yγ,Xγ on the pool reserves (a,b) ∈ R2
++.
The intuition behind the constructions (5.1) and (5.2) is that the AMM should be indifferent to
the size of transactions; a sequence of unidirectional small trades should have the same result for the
pool as a single large trade (assuming nothing happens in between the transactions). Lemma D.1
proves the existence and uniqueness of these swap functions Yγ,Xγ for any γ ∈ [0,1].
Remark 17. By construction of the pricing oracle of an AMM satisfying Assumption 5.1, if the fees
are zero (γ = 0), we recover Y0 ≡ Y. That is, the pool recovers the swap amounts Y as presented in
the prior sections when no fees are assessed. In addition, as proven in Proposition D.3, the incurred
fees are monotonic in γ, i.e., 0 ≤ Yγ2(x;a,b) < Yγ1(x;a,b) ≤ Y(x;a,b) for any 0 ≤ γ1 < γ2 ≤ 1.
Further properties of this fee structure are provided in Appendix D; we wish to highlight that this
fee structure is designed to satisfy the properties introduced in Section 2.
## 5.2 Divergence loss
We will conclude our discussion of AMMs by considering the profits and losses observed by liquidity
providers. The greater the gains (or smaller the losses), the more incentive there is for users to
26deposit liquidity in order to capture a portion of the fees. The most commonly reported metric for
the costs to liquidity providers is called the divergence loss or impermanent loss (see, e.g., [4, 18])
which measures the opportunity cost of investing in the pool. Notably, the divergence loss differs
from the accounting profits and losses for the liquidity provider.12
The divergence loss measures the mark-to-market loss from repurchasing the original pooled
portfolio after withdrawing the liquidity position (accounting for any asset rebalancing and fee
collection), i.e., the difference between the value of a buy-and-hold strategy and of a liquidity
position in the pool. Though conceptually this is a dynamic measure due to the relation between
fee collection and price volatility, the divergence loss is traditionally simplified so that it measures
the gains or losses to the liquidity position after only a single swap is undertaken. That is, first
the liquidity provider invests the funds, second the price moves because of a trade, and finally the
liquidity is withdrawn to provide the value of the pooled position; the divergence loss then is the
difference between the value of the original liquidity position (under the updated price) and this
withdrawn position. Formally, the divergence loss is defined directly below.
Definition 5.3. Consider a pool with reserves (a,b) ∈ R2
++ and fee level γ ∈ [0,1]. Let (α,β) ∈
R2
+\{0} such that P(a + α,b + β) = P(a,b). The divergence loss ∆ : (0,∞) → R depending
implicitly on (a,b,α,β) is the difference between the mark-to-market value of (α,β) being held and
being pooled, i.e.,
∆(p) :=

  
  
[pα + β] − P(a,b)α+β
P(a,b)[a+α]+[b+β] [p(a + α + xp) + (b + β − Yγ(xp;a + α,b + β)] if p ≤ P(a,b)
[pα + β] − P(a,b)α+β
P(a,b)[a+α]+[b+β] [p(a + α − Xγ(yp;a + α,b + β)) + (b + β + yp)] if p > P(a,b)
where xp > 0 is such that p = P(a + α + xp,b + β − Yγ(xp;a + α,b + β)) and yp > 0 is such that
p = P(a + α − Xγ(yp;a + α,b + β),b + β + yp).
Remark 18. Note that the domain of ∆ is (0,∞) under Assumption 5.1. In other words, for any
p < P(a,b) there exists some xp > 0 such that p = P(a + α + xp,b + β − Yγ(xp;a + α,b + β)), and
similarly for any p > P(a,b) there exists some yp > 0 such that p = P(a + α − Xγ(yp;a + α,b +
β),b+β+yp). To see this, recall that the pricing oracle P is differentiable with PA ≤ 0 and PB ≥ 0.
As Yγ is strictly increasing, we find that P(a+α+x,b+β −Yγ(x;a+α,b+β)) < P(a,b) for any
12
Another widely cited metric is the loss-versus-rebalancing proposed within [27].
27x > 0. Furthermore, 0 ≤ lim
x→∞
P(a+α+x,b+β−Yγ(x;a+α,b+β)) ≤ lim
x→∞
P(a+α+x,b+β) = 0.
Therefore, together with continuity, this guarantees the existence of such xp.
Often it is convenient to consider the divergence loss as a function of the swap amounts rather
than prices. That is, ¯ ∆ : R → R defined as:
¯ ∆(z) :=

  
  
∆(P(a + α + z,b + β − Yγ(z;a + α,b + β))) if z ≥ 0,
∆(P(a + α − Xγ(−z;a + α,b + β),b + β − z)) if z < 0,
so as to remove the explicit dependence of ∆ on the mappings xp,yp.
Remark 19. Recall that the divergence loss ∆(p) is a form of opportunity cost from investing
the portfolio (α,β) into the pool. It can be seen as the difference between the accounting profits
and losses from the buy-and-hold strategy and the liquidity providing position. Specifically, these
accounting profits ΠH(p),ΠL(p), respectively, are provided by: ΠH(p) := (pα+β)−(P(a,b)α+β) =
(p−P(a,b))α and, using Definition 5.3, ΠL(p) = ΠH(p)−∆(p) . Further details and discussion of
the accounting profits and losses are provided in Appendix E. In particular, we highlight that both
the liquidity provider and arbitrageur can profit simultaneously as the liquidity provider is long in
asset A whereas the arbitrageur is direction agnostic. That is, if the arbitrageur takes advantage of
stale prices in such a way so as to increase the value of asset A, then a liquidity provider will also
make an accounting profit. On net, the profits of all liquidity providers and arbitrageurs replicate
the buy-and-hold strategy. In other words, the liquidity providers and arbitragers are not locked in a
zero sum game. Rather they split the profits (or losses) of the buy-and-hold position between them.
Thus both can have accounting profits if the price has increased.
As noted above, the divergence loss is important as it quantifies an opportunity cost for the
liquidity provider in pooling his or her assets. As stated in [31], the divergence loss ∆(p) of well-
studied AMMs is strictly positive so long as p 6= P(a,b) when neglecting the fees. As we will see
in Lemma 5.4 and Figure 2a, this result is a direct consequence of (SI). This creates a tradeoff
between the easy implementation of the proportional rule for pooling assets as noted in Remark 10
and losses for the liquidity providers.
28Lemma 5.4. Consider an AMM satisfying Assumption 5.1 and (SI). The divergence loss can be
simplified as:
∆(p) =

  
  
δ
1+δ[Yγ(xp;(1 + δ)a,(1 + δ)b) − pxp] if p ≤ P(a,b),
δ
1+δ[pXγ(yp;(1 + δ)a,(1 + δ)b) − yp] if p > P(a,b),
where, implicitly, α := δa and β := δb for some δ > 0. Furthermore, the sign of the divergence loss
can be characterized w.r.t. the fees:
1. if γ = 0 then ∆(p) ≥ 0 with strict inequality if p 6= P(a,b);
2. if γ ∈ (0,1] then there exist p∗ < P(a,b) < p∗ such that ∆(p) < 0 for p ∈ (p∗,p∗)\{p}.
We now want to consider the divergence loss for Uniswap V2 with fees (Example 3.2) in order
to formalize the results of Lemma 5.4 for this well-known AMM. Second, we numerically study
multiple different AMMs to consider the divergence loss when (SI) is not satisfied to highlight
the value in dropping this axiom that is widely assumed in practice (see Table 1) and within the
literature (see, e.g., [13, 28]).
Example 5.5. Consider the Uniswap V2 AMM with fees γ ∈ (0,1), in other words, Yγ(x;a,b) =
b

1 −

a
a+x
1−γ

and Xγ(y;a,b) = a

1 −

b
b+y
1−γ

for any transactions x,y ≥ 0.13 As
Uniswap V2 satisfies (SI), the results of Lemma 5.4 hold. Furthermore, as noted within Remark 10
and used in Lemma 5.4, we take the liquidity injection to be α = δa and β = δb for some δ > 0.
We wish to consider the form of the divergence loss (characterized as ¯ ∆) and the threshold prices
p∗,p∗ which construct the interval of divergence gains for the liquidity provider. Let z ∈ R then
¯ ∆(z) =

   
   
δb

1 − 2

(1+δ)a
(1+δ)a+z
1−γ
+

(1+δ)a
(1+δ)a+z
2−γ

if z ≥ 0
δb

1 − 2

(1+δ)b−z
(1+δ)b

+

(1+δ)b−z
(1+δ)b
2−γ

if z < 0.
We will now direct our attention to determining the threshold prices p∗,p∗. Consider, first, p∗ ≤
P(a,b) = b/a which involves studying ¯ ∆(z) for z ≥ 0. It can be determined that ¯ ∆(z) < 0 for z ≥ 0
if and only if z ∈ (0,x∗ := (1+δ)(1−t∗)a
t∗
) where t∗ ∈ (0,1 − γ) solves 1 − 2t1−γ + t2−γ = 0. The
lower bound p∗ for divergence gains can be determined by finding the price assuming x∗ assets were
13
For details, see Example D.2.
29transacted, i.e.,
p∗ := P((1 + δ)a + x∗,(1 + δ)b − Yγ(x∗;(1 + δ)a,(1 + δ)b) =
b
a
t2−γ
∗ <
b
a
= P(a,b).
Following similar arguments, we determine that the divergence loss is negative for z < 0 if and
only if z ∈ (−y∗ := −(1 + δ)b(t∗ − 1),0) where t∗ ∈ (1 + γ)
1
1−γ + (0,−1−2(1+γ)
1
1−γ +(1+γ)
2−γ
1−γ
γ(1−γ) ) solves
1 − 2t + t2−γ = 0, i.e., the upper bound p∗ for divergence gains is
p∗
:= P((1 + δ)a − Xγ(y∗
;(1 + δ)a,(1 + δ)b),(1 + δ)b + y∗
) =
b
a
(t∗
)2−γ
>
b
a
= P(a,b).
Remark 20. Though only provided as a sufficient condition for divergence gain, we hypothesize
that Lemma 5.4(2) can be strengthened insofar as we conjecture that ∆(p) > 0 for p 6∈ [p∗,p∗]
under (SI) with fees γ ∈ (0,1). We highlight in Example 5.5, that this stronger conjecture is
satisfied in that special case. To be proven for a generic AMM, this requires that Yγ(x;a,b) −
P(a + x,b − Yγ(x;a,b))x ≥ 0 for x > x∗ (wlog suppressing the need for δ ≥ 0 in this expression).
However, this expression is not necessarily monotonic nor convex in x which makes such a proof
highly non-trivial and beyond the scope of this work.
In Lemma 5.4, we have seen how (SI) guarantees the divergence loss when γ = 0 fees are
assessed. In the following corollary, we generalize this result to provide necessary and sufficient
conditions for the existence of divergence gain without fees. In fact, except in degenerate cases,
(SI) is necessary and sufficient for guaranteed divergence loss.
Corollary 5.6. Consider an AMM satisfying Assumption 5.1 with γ = 0. Consider the pool
reserves (a,b) ∈ R2
++ and let (α,β) ∈ R2
+\{0} such that P(a + α,b + β) = P(a,b). There exists a
price p 6= P(a,b) such that ∆(p) < 0 if and only if α/β 6= a/b.
Remark 21. Corollary 5.6 replicates the γ = 0 fee case of Lemma 5.4 as pooling under (SI) implies
α/β = a/b as discussed in Remark 10. In contrast, if (SI) does not hold then, except in degenerate
cases, α/β 6= a/b. This result contrasts with the approach taken in, e.g., [27] in which the divergence
loss is considered on the entire pool reserves rather than for the individual LPs. Under (SI), it is
functionally equivalent to consider the entire pool or a single LP position; however, without that
300 0.5 1 1.5 2 2.5 3 3.5 4
p
-0.05
0
0.05
0.1
0.15
0.2
0.25
(p)
Divergence Loss (p) with P(a,b) = 2
(a) The divergence loss ∆(p) for Uniswap
V2, StableSwap, L.StableSwap, Curve, and
the hyperbolic sine SDAMM.
0.5 1 1.5 2 2.5 3
p
-0.2
-0.1
0
0.1
0.2
0.3
0.4
Profits and Losses
Profits for Market Participants with StableSwap
Liquidity Provider
Buy-and-Hold Strategy
Arbitrageur
(b) Accounting profits and losses for differ-
ent strategies with StableSwap.
Figure 2: Pools all considered with u(a,b) = 1, P(a,b) = 2, and P(a,b)α+β
P(a,b)(a+α)+(b+β) = 1
11. Note that
StableSwap is only able to support prices in [0.4195,2.3837].
property, the value of providing liquidity depends on the original pool reserves at the time of the
liquidity provision.
Finally, we want to demonstrate how the divergence loss differs based on the AMM construction
used. In Figure 2a, we compare the divergence loss ∆(p) for the same AMMs as considered in
Figure 3 (i.e., Uniswap V2, StableSwap, L.StableSwap, Curve, and the hyperbolic sine SDAMM)
without fees, i.e., γ = 0. Notably, both StableSwap and the hyperbolic sine SDAMM are able to
capture divergence gains in a portion of the price range, whereas the other AMMs considered all
suffer divergence losses throughout. As provided in Table 1, neither StableSwap nor the hyperbolic
sine SDAMM satisfy (SI) whereas the rest of the considered AMMs are scale invariant.
Note that the divergence loss is an opportunity cost. Even though AMMs without (SI) can
have divergence gains, these do not lead to accounting losses for the arbitrageurs. In Figure 2b,
we consider the profits and losses of different investment strategies when considering StableSwap.
Specifically, we plot the profits and losses for liquidity providers (holding 1/11th of the pool), buy-
and-hold investors, and arbitrageurs. By doing this, we are able to highlight how the divergence
loss is the difference between the profits of two different trading strategies so that it is possible
for, e.g., simultaneous divergence gains and accounting losses and vice versa. In addition, we wish
to note that both the liquidity providers and arbitrageurs can experience accounting profits at the
same time. In fact, as noted in Remark 19, the collection of all liquidity providers and arbitrageurs
31split the profits and loses of the buy-and-hold strategy exactly.
Remark 22. As discussed above, though (SI) leads to simplifying mathematical properties (see
Lemma 3.9(3) and Proposition 3.13(4)), it introduces significant risks to liquidity providers (see
Lemma 5.4). This is especially notable in comparison to AMMs that are utilized in practice that
are, frequently, satisfying (SI) as highlighted within Table 1. Furthermore, when reviewing Table 2,
we note that (SI) is not necessary for any of the fundamental properties for financial markets.
## 6 Conclusion
Within this work we have considered an axiomatic framework for AMMs. By imposing reasonable
axioms on the underlying utility function, we are able to characterize the properties of the swap
size of the assets and of the resulting pricing oracle. In addition, we have introduced a novel price
impact oracle which quantifies these costs for traders. We have analyzed many existing AMMs
and shown that the vast majority of them satisfy our axioms. Finally, we have also considered the
question of fees and divergence loss. In doing so, we have proposed a new fee structure so as to
make the AMM pool indifferent to trade execution. Finally, we have proposed a novel AMM that,
while it does not satisfy all of our axioms, has nice analytical properties and provides a large range
over which there is no divergence loss.
We wish to provide a few extensions for this work. First, and importantly, a rigorous study
of the conjecture provided within Remark 20 would greatly enhance our understanding of the
divergence loss and the impacts that scale invariance (SI) has on those costs. Second, within this
work and throughout the literature on constant function market makers, a single utility function
u : R2
+ → R∪{−∞} is always considered; herein we propose considering the generalized AMM with
incomplete preference relation  on R2
+ so that, e.g., Y(x;a,b) = sup{y ∈ [0,b] | (a + x,b − y) 
(a,b)}. In this way the fees can be endogenized within the preference relation itself. Related to
the first two extensions, we propose further studies on new AMM constructions so as to minimize
divergence loss (and maximize revenue for liquidity providers) much as we undertook with the
SDAMM example within this work. Finally, within this paper, we only considered the traditional
style AMMs, i.e., for swap markets. In order to grow the decentralized finance offerings, a rigorous
study of AMMs for derivatives and other complex financial securities needs to be undertaken.
32References
[1] Austin Adams, Benjamin Y Chan, Sarit Markovich, and Xin Wan. The costs of swapping on the uniswap
protocol. arXiv preprint arXiv:2309.13648, 2023.
[2] Hayden Adams, Noah Zinmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap v3 core.
2021.
[3] Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core. 2020.
[4] Andreas A Aigner and Gurvinder Dhaliwal. Uniswap: Impermanent loss and risk profile of a liquidity
provider. arXiv preprint arXiv:2106.14404, 2021.
[5] Charalambos D. Aliprantis and Kim C. Border. Infinite Dimensional Analysis: A Hitchhiker’s Guide.
Springer, 2007.
[6] Álvaro Cartea, Fayçal Drissi, and Marcello Monga. Decentralised finance and automated market making:
Execution and speculation. Available at SSRN 4144743, 2022.
[7] Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra, and Stephen Boyd. Constant function
market makers: Multi-asset trades via convex optimization. arXiv preprint arXiv:2107.12484, 2021.
[8] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market makers. In
Proceedings of the 2nd ACM Conference on Advances in Financial Technologies, pages 80–91, 2020.
[9] Guillermo Angeris, Tarun Chitra, Theo Diamandis, Alex Evans, and Kshitij Kulkarni. The geometry
of constant function market makers. 2023.
[10] Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog? curvature and
market making. arXiv preprint arXiv:2012.08040, 2020.
[11] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. arXiv preprint
arXiv:2103.14769, 2021.
[12] Massimo Bartoletti, James Hsin-yu Chiang, and Alberto Lluch-Lafuente. A theory of automated market
makers in defi. In International Conference on Coordination Languages and Models, pages 168–187.
Springer, 2021.
[13] Agostino Capponi and Ruizhe Jia. The adoption of blockchain-based decentralized exchanges. arXiv
preprint arXiv:2103.08842, 2021.
[14] René Carmona. Indifference pricing: theory and applications. Princeton University Press, 2008.
33[15] Yiling Chen and David M Pennock. A utility framework for bounded-loss market makers. arXiv preprint
arXiv:1206.5252, 2012.
[16] Joseph Clark. The replicating portfolio of a constant product market. Available at SSRN 3550601,
2020.
[17] Harold Demsetz. The cost of transacting. The quarterly journal of economics, 82(1):33–53, 1968.
[18] Jun Deng and Hua Zong. Static replication of impermanent loss for concentrated liquidity provision in
decentralised markets. arXiv preprint arXiv:2205.12043, 2022.
[19] Daniel Engel and Maurice Herlihy. Composing networks of automated market makers. In Proceedings
of the 3rd ACM Conference on Advances in Financial Technologies, pages 15–28, 2021.
[20] Matheus VX Ferreira and David C Parkes. Credible decentralized exchange design via verifiable se-
quencing rules. arXiv preprint arXiv:2209.15569, 2023.
[21] Rafael Frongillo, Maneesha Papireddygari, and Bo Waggoner. An axiomatic characterization of cfmms
and equivalence to prediction markets. arXiv preprint arXiv:2302.00196, 2023.
[22] Robin Hanson. Logarithmic markets coring rules for modular combinatorial information aggregation.
The Journal of Prediction Markets, 1(1):3–15, 2007.
[23] P. Hartman. Ordinary Differential Equations: Second Edition. Classics in Applied Mathematics. Society
for Industrial and Applied Mathematics, 2002.
[24] Alfred Lehar and Christine A Parlour. Decentralized exchange: The Uniswap automated market maker.
Available at SSRN 3905316, 2021.
[25] Xiaolong Li and Jennifer Wortman Vaughan. An axiomatic characterization of adaptive-liquidity market
makers. In Proceedings of the fourteenth ACM Conference on Electronic Commerce, pages 657–674, 2013.
[26] Alex Lipton and Artur Sepp. Automated market-making for fiat currencies. arXiv preprint
arXiv:2109.12196, 2021.
[27] Jason Milionis, Ciamac C Moallemi, Tim Roughgarden, and Anthony Lee Zhang. Automated market
making and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046, 2022.
[28] Jan Christoph Schlegel, Mateusz Kwaśnicki, and Akaki Mamageishvili. Axioms for constant function
market makers. Available at SSRN, 2023.
[29] Costis Skiadas. Scale or translation invariant additive preferences. Unpublished manuscript, 2016.
[30] John Von Neumann and Oskar Morgenstern. Theory of games and economic behavior, 2nd rev. 1947.
34[31] Jiahua Xu, Krzysztof Paruch, Simon Cousaert, and Yebo Feng. Sok: Decentralized exchanges (dex)
with automated market maker (amm) protocols. arXiv preprint arXiv:2103.12732, 2021.
[32] Yi Zhang, Xiaohong Chen, and Daejun Park. Formal specification of constant product (x × y = k)
market maker model and implementation. 2018.
35A Summary Table of Main Results
Property Details (UfB) (UfA) (SM) (C) (QC) (SI) (I+) (SC) (3.2) (3.4) (3.5)
(No Arbitrage) L. 3.11(2) X X
(Path Independent) L. 3.11(1) X X X
(No Wasted Liquidity) L. 3.8(3) X X X
(Positive Marginal Return) L. 3.8(2) X X X
(Decreasing Marginal Return) L. 3.9(2) (1) (1) (2)
(Infinite Liquidity) L. 3.7(3) X X
(Monotone in Liquidity) T. 3.12(1)
P. 3.13(1)
X X
(Pooling Increases Liquidity) T. 3.14 (2) (2) (1) (2) X (2)
Table 2: Summary of main results and necessary axioms. (1) and (2) denote alternative conditions where either all axioms in (1) must
be satisfied or axiom (2) is satisfied.
1B Details of Existing Automated Market Makers
B.1 Uniswap V2
Though we refer to this example as Uniswap V2, the same mathematical structure is also utilized within
many other AMMs in practice such as SushiSwap, DefiSwap, and Quickswap. Structurally, Uniswap V2 is
the logarithmic utility function, i.e.,
u(x,y) = log(x) + log(y)
for x,y ≥ 0. With this utility function, the pricing oracle and price impact oracle are defined as
P(x,y) =
y
x
, I(x,y) =
y
x2
, x,y ≥ 0.
This AMM permits pooling at the ratio of the current reserves. As highlighted within Table 1, this AMM
satisfies every axiom proposed within this work.
B.2 Balancer
Though we refer to this example as Balancer, the same mathematical structure is also utilized within many
other AMMs in practice such as Bancor and Loopring. Structurally, Balancer is a weighted version of
Uniswap V2, i.e.,
u(x,y) = w log(x) + (1 − w)log(y)
with w ∈ (0,1) for x,y ≥ 0. With this utility function, the pricing oracle and price impact oracle are defined
as
P(x,y) =
wy
(1 − w)x
, I(x,y) =
wy
2(1 − w)2x2
, x,y ≥ 0.
Notably, this AMM always achieves a lower price impact than Uniswap V2 for w ∈ (0, 1
2). It also permits
pooling at the ratio of the current reserves. As highlighted within Table 1, this AMM satisfies every axiom
proposed within this work.
B.3 Uniswap V3
Though we refer to this example as Uniswap V3, the same mathematical structure is also utilized within
many other AMMs in practice such as KyberSwap and MooniSwap. The generic structure of all of these
AMMs is the same as Uniswap V2 but with “virtual reserves” to provide concentrated liquidity, i.e.,
u(x,y) = log(α + x) + log(β + y)
2with α,β > 0 for x,y ≥ 0. Each of these real-world AMMs select α,β in different ways which may be
dynamic in time or based on the implemented trades. For instance, Uniswap V3 implements this AMM in
such a way that α,β are adjusted dynamically so that the AMM maintains a fixed maximum and minimum
quoted price. With this utility function, the pricing oracle and price impact oracle are defined as
P(x,y) =
β + y
α + x
, I(x,y) =
β + y
(α + x)2
, x,y ≥ 0.
This AMM permits pooling at the ratio of the current reserves inclusive of the virtual reserves α,β. As
mentioned, these virtual reserves concentrate the liquidity to reduce price impacts from a transaction when
the virtual reserves (α,β) are close to the true reserves (a,b), but this comes at the cost of unbounded
from below. Additionally, as constructed here with static α,β, Uniswap V3 fails to be scale invariant. As
highlighted in Table 1, Uniswap V3 does not satisfy (UfB), (SI), or (I+).
In practice this is undertaken with functional forms for α,β so that the liquidity is concentrated within
constant upper PU
and lower PL
prices without regard to the amount of physical liquidity provided. Within
the actual Uniswap V3 this is formulated via:
α(x,y) =
√
PLPUx + y +
q
(
√
PLPUx + y)2 + 4
√
PU(
√
PU −
√
PL)xy
2
√
PU(
√
PU −
√
PL)
β(x,y) =
√
PL

√
PLPUx + y +
q
(
√
PLPUx + y)2 + 4
√
PU(
√
PU −
√
PL)xy

2(
√
PU −
√
PL)
Notably, following this functional form (as α,β are positive homogeneous), (SI) is now recovered.
B.4 mStable
mStable is an AMM constructed to have no price impacts from trading. This is accomplished through the
mathematical structure
u(x,y) = log(x + y)
for x,y ≥ 0. This AMM comes with the constant pricing oracle and zero price impacts
P(x,y) = 1, I(x,y) = 0, x,y ≥ 0.
Pooling for mStable can, in theory, be accomplished with any combination of assets; traditionally, pooling
is done either at the current ratio of assets or so that the pooled assets are in equal proportion. As with
Uniswap V3, the ability to reduce price impacts (in this case to 0) comes at the expense of unbounded from
3below (UfB); in fact, these zero price impacts also cause the AMM to lose (I+). Furthermore, though (SC)
is satisfied, it is only satisfied with an equality (and thus does not guarantee quasiconcavity by itself).
B.5 Stable swaps
B.5.1 StableSwap
Though we refer to this example as StableSwap, the same mathematical structure is also utilized with
many other AMMs in practice such as Saber and Saddle. Much like Uniswap V3, StableSwap aims to
concentrate liquidity towards the “balanced” pool. This is accomplished by taking a linear combination of
(the exponentials of) Uniswap V2 and mStable, i.e.,
u(x,y) = log(C(x + y) + xy)
with C > 0 for x,y ≥ 0. With this utility function, the pricing oracle and price impact oracle are defined as
P(x,y) =
C + y
C + x
, I(x,y) =
C + y
(C + x)2
, x,y ≥ 0.
This AMM permits pooling at the ratio of the current reserves inclusive of the parameter C. As with
Uniswap V3, the ability to reduce price impacts for a (potentially wide) neighborhood around the balanced
pool comes at the expense of unbounded from below (UfB) and is neither scale invariant (SI) nor satisfies
(I+).
B.5.2 Liquid StableSwap [L.StableSwap]
As far as we are aware, this construction has never been implemented before as an AMM in practice. Rather
than taking the linear combination of exponentials of Uniswap V2 and mStable, here we take the linear
combination directly, i.e.,
u(x,y) = C log(x + y) + log(x) + log(y)
with C > 0 for x,y ≥ 0. This concentrates liquidity when the reserves of the pool are not too far out of
balance, but exacerbates price impacts once the reserves of the pool become too skewed towards one asset.
With this utility function, the pricing oracle and price impact oracle are defined as
P(x,y) =
y[(C + 1)x + y]
x[x + (C + 1)y]
, I(x,y) =
(C + 2)y(x + y) C x2
+ y2

+ (x + y)2

2x2(Cy + x + y)3
, x,y ≥ 0.
4By taking this structure all fundamental axioms proposed within this work are satisfied in comparison to
Uniswap V3, mStable and StableSwap. However, in order to have both a stable price near the balanced
pool but provide liquidity throughout the price curve, L.StableSwap loses (3.4) and (3.5). Indeed, near the
balanced pool, the price impacts are lower than those of Uniswap V2.
B.6 Curve
Curve is a popular AMM that, much like our newly proposed Liquid StableSwap, extends StableSwap in such
a way so as to guarantee infinite liquidity through satisfying (UfB). For the construction of Curve, let D(x,y)
denote the total number of coins when the reserves (x,y) ∈ R2
++ are traded into balance from a StableSwap
AMM, i.e., log(C(x + y) + xy) = log(CD(x,y) + D(x,y)2
/4). However, in contrast to StableSwap, Curve
considers a functional parameter C(x,y); by dimensional analysis C(x,y) must have units in number of coins
(so that C(x,y)(x + y) and xy are both in number of coins squared). Furthermore, with the notion that
Curve desires a balanced pool, C(x,y) is constructed to be proportional to both the number of coins for the
balanced pool (D(x,y)) and to a unitless measure of pool balance, i.e., C(x,y) ∝ D(x,y)×

xy
D(x,y)2/4

where
xy
D(x,y)2/4 ∈ [0,1] provides a measure of pool balance. With this functional parameter C(x,y) := Cxy
D(x,y) with
constant C, the balanced pool size D(x,y) satisfies the equation
log(C(x,y)(x + y) + xy) = log

C(x,y)D(x,y) +
D(x,y)2
4

⇔ D(x,y)3
+ 4(C − 1)xyD(x,y) − 4C(x + y)xy = 0. (B.1)
It is this balanced pool size D(x,y) which defines the utility function for Curve. Specifically,
u(x,y) = log(D(x,y))
for x,y ≥ 0 where D(x,y) is implicitly defined as the unique nonnegative root of (B.1) for C ≥ 1. Uniqueness
of D(x,y) follows from an application of Descartes’ rule of signs. With this utility function, the pricing oracle
and price impact oracle are defined as
P(x,y) =
y[C(2x + y) − (C − 1)D]
x[C(x + 2y) − (C − 1)D]
,
I(x,y) =
y (C(x + y) − (C − 1)D) ((C − 1)D)2
− 3C(C − 1)(x + y)D + 3C2
(x2
+ xy + y2
)

x2(C(x + 2y) − (C − 1)D)3
,
5for x,y ≥ 0 where, for simplicity, we set D = D(x,y). Despite the complex, implicit, structure of this
pricing oracle, Curve permits pooling at the current ratio of reserves because it satisfies (SI). Due to the
implicit construction of the Curve AMM, (some of) the axioms presented within this paper can only be
verified numerically. Even so, as highlighted within Table 1, all axioms presented are satisfied for Curve
either analytically or (for (QC), (SC), and (3.2)) numerically. Similar to L.StableSwap above, in order to
have both a stable price near the “balanced” pool but provide liquidity throughout the price curve, Curve
loses (3.4) and (3.5).
B.7 Dodo
In contrast to all other AMMs presented herein, Dodo is constructed based on an exogenous pricing oracle
(e.g., a centralized exchange) and does not provide its own pricing oracle. In doing so, Dodo permits pooling
in any combination of assets rather than guaranteeing the pricing oracle is kept constant. To guarantee that
the pool has the requisite liquidity, withdrawal fees may be assessed; these withdrawal fees take the place of
the divergence loss (see Section 5.2) of other AMMs. Mathematically, Dodo takes the form
u(x,y) = log(Pα(x,y) + β(x,y))
for exogenous pricing signal P and such that α,β : R2
+ → R+ satisfy price matching and equilibrium pooling,
i.e.,
• price matching: the value of α(x,y) is equal to β(x,y), i.e., Pα(x,y) = β(x,y);
• equilibrium pooling: when an endogenized price Pf(x,y) (to account for the actual pool reserves) is
used, the value of the portfolio (x,y) should be equivalent to (α(x,y),β(x,y)), i.e., Pf(x,y)(α(x,y)−
x)+(β(x,y)−y) = 0. Within the current construction of Dodo, the price modifier function f : R2
+ →
R+ is defined as
f(x,y) :=

 
 
1 + C

α(x,y)
x − 1

if Px ≤ y,
h
1 + C

β(x,y)
y − 1
i−1
if Px > y,
with C ∈ [0,1] for any x,y ≥ 0.
Note that the construction of Dodo has a parameter C ∈ [0,1] for the appropriate notion of equilibrium
pooling. If C = 0 then u(x,y) = log(Px + y) is equivalent to the mStable AMM; if C = 1 then u(x,y) =
log(2
√
Pxy) log(x) + log(y) is equivalent to the Uniswap V2 AMM. In fact, a closed form for the Dodo
6construction can be provided for C ∈ [0,1] such that
u(x,y) =

  
  
log

2

−(1−C)Px+
√
(1−C)2P2x2+CPx((1−C)Px+y)
C

if Px ≤ y,
log

2

−(1−C)y+
√
(1−C)2y2+Cy(Px+(1−C)y)
C

if Px > y.
As highlighted within Table 1, Dodo satisfies all relevant axioms proposed within this work provided C >
0; (3.2), (3.4), and (3.5) are not studied for Dodo due to the use of the exogenous pricing oracle.
B.8 Visualization of Automated Market Makers
We conclude this discussion of AMMs used in practice by comparing some of these constructions graphically.
Demonstrations of Uniswap V2, StableSwap, L.StableSwap, Curve, and the hyperbolic sine SDAMM (see
Example 4.2) are provided within Figure 3. In particular, we compare these AMMs in 4 dimensions: (i)
the binding curve u(z) = 1; (ii) the swap function Y(x;1,1); (iii) the pricing oracle P; and (iv) the price
impact oracle I. These plots make clear that Uniswap V2 has the largest price impact, L.StableSwap and
Curve have extremely similar behaviors, and, generally, that there are tradeoffs between price impacts and
tail behavior (or nonexistence of possible trades in the case of StableSwap). In particular, in Figure 3d, we
observe the price impact oracle I(z) for a balanced pool P(z) = 1 as the value of the reserves z vary. Here we
observe that the price impacts are monotonic in pool value but to varying degrees with StableSwap having
the most stable (but low) price impacts and the hyperbolic sine SDAMM having the greatest change in price
impacts. Notably, and as expected, Uniswap V2 has the greatest price impacts for this pool as the 4 other
AMM designs are all meant to have a stable price at P(a,b) = 1.
C Proofs
C.1 Proof of Lemma 3.7
Proof. 1. Let C(z̄) := {z ∈ R2
+ | u(z) ≥ u(z̄)} denote the set of positions z ∈ R2
+ that exceed z̄ ∈ R2
+
in utility. By (upper semi)continuity, C(z̄) is closed for every z̄ ∈ R2
+. Therefore Y(x) = sup{y | y ∈
[0,b], (a + x,b − y) ∈ C(a,b)} is the supremum over a compact set and thus is attained.
2. Assume Y(x) < b. Then, by construction of Y, u(a+x,b−[Y(x)+ǫ]) < u(a,b) for any ǫ ∈ (0,b−Y(x)].
By (lower semi)continuity, u(a + x,b − Y(x)) ≤ liminfǫց0 u(a + x,b − [Y(x) + ǫ]) ≤ u(a,b).
3. Assume Y(x) = b then u(a + x,b − Y(x)) = u(a + x,0) ≥ u(a,b) contradicts (UfB).
70 0.5 1 1.5 2 2.5 3 3.5 4
x
0
0.5
1
1.5
2
2.5
3
3.5
4
y
Binding Curves u(x,y) = 1
(a) Binding curve u(x,y) = 1 for various
AMMs.
0 1 2 3 4 5
x
0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
0.8
0.9
1
Y(x;1,1)
Swap Amount Y(x;1,1)
(b) Swap function Y(x;1,1) for various
AMMs.
0 0.5 1 1.5
10-2
10-1
100
101
102
P(r( )cos( ) , r( )sin( ))
Pricing Oracle P(r( )cos( ) , r( )sin( ))
(c) Angled sweep of the pricing oracle
P(r(θ)cos(θ),r(θ)sin(θ)) where r(θ) is such
that u(r(θ),cos(θ),r(θ)sin(θ)) = 1 for vari-
ous AMMs. The flatter the curve, the more
stable the AMM prices.
0 2 4 6 8 10
Pool Value P(a,b)a + b
10-1
100
101
I(a,b)
Price Impact Oracle I(a,b)
(d) Price impacts I(a,b) where P(a,b) = 1
(i.e., a = b) for various AMMs. The steeper
the decline the faster the price impact de-
creases with liquidity.
Figure 3: Comparison of Uniswap V2, StableSwap, L.StableSwap, Curve, and the hyperbolic sine
SDAMM.
C.2 Proof of Lemma 3.8
Proof. 1. By (SM), u(a,b) > u(a,b − y) for any y ∈ (0,b], which immediately results in Y(0) = 0.
2. It trivially follows from (SM) that Y(x) ≤ Y(x +∆) for any ∆ ≥ 0. To prove the strict monotonicity,
by contradiction, let ∆ > 0 and assume Y(x) = Y(x + ∆). Therefore, by (SM),
u(a + x + ∆,b − Y(x + ∆)) = u(a + x + ∆,b − Y(x)) > u(a + x,b − Y(x)) ≥ u(a,b).
From Lemma 3.7(3), we can already conclude that Y(x),Y(x + ∆) < b. As such, we now obtain a
contradiction to item Lemma 3.7(2). Therefore, it must follow that Y(x + ∆) > Y(x).
83. By the first claim in item (2) within this theorem and monotone convergence, Y(x) ր Y∗
for some
Y∗
≤ b. Assume Y∗
< b (and therefore Y(x) 6= b for every x > 0), then
u(a,b) = u(a + x,b − Y(x)) ≥ u(a + x,b − Y∗
) ∀x > 0.
Taking the limit as x tends to infinity implies ∞ > u(a,b) ≥ limā→∞ u(ā,b − Y∗
) = ∞ which forms a
contradiction, i.e., Y∗
= b.
C.3 Proof of Lemma 3.9
Proof. 1. Note that C̄(x) := {y ∈ [0,b] | u(a + x,b − y) ≥ u(a,b)} is upper continuous by the closed
graph theorem [5, Theorem 17.11]. Thus by [5, Lemma 17.30], Y(x) = sup{y | y ∈ C̄(x)} is upper
semicontinuous.
2. First, under axioms (C) and (QC), the hypograph
hypoY = {(x,y) ∈ R+ × R | Y(x) ≥ y} = {(x,y) ∈ R+ × R | y ≤ b, u(a + x,b − y) ≥ u(a,b)}
is trivially convex. Now, instead, assume (SC) holds. By implicit differentiation, and with all deriva-
tives of the utility u being taken at (a + x,b − Y(x)),
Y′′
(x) =
uB[uBuAA − uAuAB] + uA[uAuBB − uBuAB]
u3
B
≤ 0.
3. By Lemma 3.7(1), u(a + x,b − Y(x;a,b)) ≥ u(a,b). An application of (SI) implies u(t[a + x],t[b −
Y(x;a,b)]) ≥ u(ta,tb) for any t > 0, i.e., Y(tx;ta,tb) ≥ tY(x;a,b) by construction. The reverse
inequality (Y(tx;ta,tb) ≤ tY(x;a,b)) follows trivially by applying this result to (tx;ta,tb) with scaling
factor t−1
.
4. By Lemma 3.8(1), Y(0) = 0. Further, by item (2), Y is concave. Combining these properties,
Y(x1) ≥ x1
x1+x2
Y(x1 +x2) and Y(x2) ≥ x2
x1+x2
Y(x1 +x2). Therefore, Y(x1)+Y(x2) ≥ Y(x1 +x2), i.e.,
Y is subadditive.
C.4 Proof of Lemma 3.11
Proof. 1. By Lemma 3.7(2) and (3), it immediately follows that u(a+ x,b −Y(x;a,b)) = u(a,b) for any
x ≥ 0 and a,b > 0. By (SM), u(a + x,b − Y(x;a,b) − ǫ) < u(a,b) for any x ≥ 0, a,b > 0, and
9ǫ ∈ (0,b − Y(x;a,b)]. Therefore, if u(a + x,b − y) = u(a,b) it must follow that Y(x;a,b) = y. Using
this result we recover the desired property because:
u(a + x1 + x2,b − Y(x1;a,b) − Y(x2;a + x1,b − Y(x1;a,b))) = u(a + x1,b − Y(x1;a,b)) = u(a,b).
2. We will only prove the first (in)equality, the second follows comparably. Denote Y := Y(x;a,b) and
X := X(Y;a + x,b − Y). Then, by Lemma 3.7(1),
u(a + x − X,b) = u(a + x − X,b − Y + Y) ≥ u(a + x,b − Y) ≥ u(a,b).
By (SM), this implies a + x − X ≥ a, i.e., X ≤ x. If, additionally, (UfB) then the inequalities above
hold as equalities and the result follows comparably.
C.5 Proof of Theorem 3.12
Proof. 1. By implicit differentiation (and noting uA,uB > 0 by (SC)):
Ya(x;a,b) =
uA(a + x,b − Y(x;a,b)) − uA(a,b)
uB(a + x,b − Y(x;a,b))
Yb(x;a,b) =
uB(a + x,b − Y(x;a,b)) − uB(a,b)
uB(a + x,b − Y(x;a,b))
< 1.
Therefore, the results hold if ∂
∂xuA(a + x,b − Y(x;a,b)) ≤ 0 and ∂
∂xuB(a + x,b − Y(x;a,b)) ≥ 0.
Consider these derivatives:
∂
∂x
uA(a + x,b − Y(x;a,b)) = uAA(a + x,b − Y(x;a,b)) − Y′
(x;a,b)uAB(a + x,b − Y(x;a,b))
= uAA(a + x,b − Y(x;a,b)) −
uA(a + x,b − Y(x;a,b))
uB(a + x,b − Y(x;a,b))
uAB(a + x,b − Y(x;a,b)) ≤ 0,
∂
∂x
uB(a + x,b − Y(x;a,b)) = uAB(a + x,b − Y(x;a,b)) − Y′
(x;a,b)uBB(a + x,b − Y(x;a,b))
= uAB(a + x,b − Y(x;a,b)) −
uA(a + x,b − Y(x;a,b))
uB(a + x,b − Y(x;a,b))
uBB(a + x,b − Y(x;a,b)) ≥ 0
taking advantage of Y strictly increasing and differentiable.
2. (a) By item (1) within this theorem and monotone convergence, Y(x;ā,b) ր Y∗
for some Y∗
≤ b as
ā ց 0. Assume Y∗
< b, then
u(ā,b) = u(ā + x,b − Y(x;ā,b) ≥ u(ā + x,b − Y∗
) ∀ā > 0.
10Taking the limit as ā tends to 0 leads to −∞ = limāց0 u(ā,b) ≥ limāց0 u(ā + x,b − Y∗
) =
u(x,b − Y∗
) > −∞ which forms a contradiction, i.e., Y∗
= b.
(b) For every ǫ > 0, we have that |Y(x;a,b̂)| < b̂ ≤ ǫ for any b̂ ∈ (0,ǫ] by Lemma 3.7(3).
3. (a) By item (1) within this theorem and monotone convergence, Y(x;ā,b) ց Y∗
for some Y∗
≥ 0 as
ā ր ∞. Assume Y∗
> 0, then
u(ā,b) = u(ā + x,b − Y(x;ā,b)) ≤ u(ā + x,b − Y∗
) ∀ā > 0.
By quasiconcavity this inequality implies xuA(ā,b) ≥ Y∗
uB(ā,b) for every ā > 0; in particular,
this implies 0 = xlimā→∞ uA(ā,b) ≥ Y∗
limā→∞ uB(ā,b) > 0 which forms a contradiction due
to (I+), i.e., Y∗
= 0.
(b) By item (1) within this theorem and monotone convergence, Y(x;a,b̄) ր Y∗
for some Y∗
≤ ∞
(possibly infinite) as b̄ ր ∞. Assume Y∗
< ∞, then
u(a,b̄) = u(a + x,b̄ − Y(x;a,b̄)) ≥ u(a + x,b̄ − Y∗
) ∀b̄ > Y∗
.
By quasiconcavity this inequality implies Y∗
uB(a+x,b̄−Y∗
) ≥ xuA(a+x,b̄−Y∗
); in particular,
this implies 0 = Y∗
limb̄→∞ uB(a + x,b̄ − Y∗
) ≥ xlimb̄→∞ uA(a + x,b̄ − Y∗
) > 0 which forms a
contradiction due to (I+), i.e., Y∗
= ∞.
C.6 Proof of Proposition 3.13
Proof. First, we will prove that P is differentiable. By explicitly providing the derivatives, monotonicity of
the pricing oracle can be proven directly. With this result, we will prove surjectivity of P by demonstrating
that limāց0 P(ā,b) = ∞, limb̄ց0 P(a,b̄) = 0, limāր∞ P(ā,b) = 0, and limb̄ր∞ P(a,b̄) = ∞ for any a,b > 0.
As mentioned above, we will prove differentiability and monotonicity by explicitly providing the partial
derivatives of P:
∂
∂a
P(a,b) =
uB(a,b)uAA(a,b) − uA(a,b)uAB(a,b)
uB(a,b)2
≤ 0,
∂
∂b
P(a,b) =
uB(a,b)uAB(a,b) − uA(a,b)uBB(a,b)
uB(a,b)2
≥ 0,
using (SC) and the fact that P(a,b) = Y′
(0;a,b) = uA(a,b)/uB(a,b).
Consider now the limits:
11• Consider limāց0 P(ā,b): By concavity of Y, P(a,b) = Y′
(0;a,b) ≥ Y(x;a,b)
x for any x > 0. Therefore,
by Theorem 3.12(2), limāց0 P(ā,b) ≥ limāց0 Y(x;ā,b)/x = b/x for any x > 0. As this inequality
holds for any x > 0, it must follow that limāց0 P(ā,b) = ∞.
• Consider limb̄ց0 P(a,b̄): Recall that P(a,b) = 1
X′(0;a,b) by the provided assumptions. Therefore
limb̄ց0 P(a,b̄) = 0 if limb̄ց0 X′
(0;a,b̄) = ∞. By symmetry of the assets, this is equivalent to
limāց0 Y′
(0;ā,b) = ∞ which is proven in the prior case.
• Consider limāր∞ P(ā,b): As in the prior case, recall that P(a,b) = 1
X′(0;a,b) by the provided assump-
tions. Therefore limāր∞ P(ā,b) = 0 if limāր∞ X′
(0;ā,b) = ∞. By symmetry of the assets, this is
equivalent to limb̄ր∞ Y′
(0;a,b̄) = ∞ which is proven in the next case.
• Consider limb̄ր∞ P(a,b̄): As in the first case, by concavity of Y, P(a,b) = Y′
(0;a,b) ≥ Y(x;a,b)
x for
any x > 0. Therefore, by Theorem 3.12(3), limb̄ր∞ P(a,b̄) ≥ limb̄ր∞ Y(x;a,b̄)/x = ∞ for any x > 0.
Finally, the scale invariance of P follows directly from the positive homogeneity of Y (see Lemma 3.9(3)).
Specifically, let t > 0 then
P(ta,tb) = lim
ǫց0
Y(ǫ;ta,tb)
ǫ
= lim
ǫց0
Y(tǫ;ta,tb)
tǫ
= lim
ǫց0
tY(ǫ;a,b)
tǫ
= lim
ǫց0
Y(ǫ;a,b)
ǫ
= P(a,b).
C.7 Proof of Theorem 3.14
Proof. Fix (a,b) ∈ R2
++. Due to the symmetry of the AMM utility function, we will prove this result for the
swap function Y only.
1. By Proposition 3.13(4), pooling is accomplished in proportion to the pool size, i.e., (α,β) = t(a,b) for
some t > 0. Following Lemma 3.9(3), (3.1) trivially holds as
Y(x;a + α,b + β) = Y(x;(1 + t)a,(1 + t)b) = (1 + t)Y(
1
1 + t
x;a,b) ≥ Y(x;a,b)
where the final inequality holds since Y is concave (Lemma 3.9(2)) and Y(0) = 0 (Lemma 3.8(1)).
2. Define β : [−a,∞) → [−b,∞) such that P(a,b) = P(a + δ,b + β(δ)) for any δ ∈ (−a,∞) which is
guaranteed to exist by the surjective property of the pricing oracle P as provided in Proposition 3.13
(and with β(−a) = −b). This proof could comparably be defined w.r.t. α : [−b,∞) → [−a,∞)
constructed as with β but on the first asset.14
14
Though (I+) was assumed for Theorem 3.14, it is not necessary for that result. Specifically, (I+) is only used
12Recall P(ā,b̄) := Y′
(0;ā,b̄) = uA(ā,b̄)/uB(ā,b̄) for any reserves (ā,b̄) ∈ R2
++. Therefore, by implicit
differentiation,
β′
(δ) = −
PA(â,b̂)
PB(â,b̂)
,
where (â,b̂) := (a + δ,b + β(δ)) for any δ ∈ (−a,∞).
We will prove this result only in the case of Y; the monotonicity of X follows similarly. For shorthand,
define Ȳ(δ) := Y(x;a+δ,b+β(δ)) for fixed x > 0. Then u(a+δ+x,b+β(δ)−Ȳ(δ)) = u(a+δ,b+β(δ))
by construction. Using the same construction of (â,b̂) := (a + δ,b + β(δ)) as above, by implicit
differentiation
Ȳ′
(δ) =
h
uA(â + x,b̂ − Ȳ(δ)) + β′
(δ)uB(â + x,b̂ − Ȳ(δ))
i
−
h
uA(â,b̂) + β′
(δ)uB(â,b̂)
i
uB(â + x,b̂ − Ȳ(δ))
.
Therefore Ȳ′
(δ) ≥ 0 if
∂
∂x
h
uA(â + x,b̂ − Y(x;â,b̂)) + β′
(δ)uB(â + x,b̂ − Y(x;â,b̂))
i
| {z }
(∗)
≥ 0.
Explicitly computing the derivative (∗), we recover the equivalent condition:
β′
(δ) = −
PA(â,b̂)
PB(â,b̂)
≥ −
PA(â + x,b̂ − Y(x;â,b̂))
PB(â + x,b̂ − Y(x;â,b̂))
.
In particular, this holds if
∂
∂x
PA(â + x,b̂ − Y(x;â,b̂))
PB(â + x,b̂ − Y(x;â,b̂))
!
| {z }
(∗∗)
≥ 0.
Explicitly computing the derivative (∗∗), we recover the desired monotonicity:
(∗∗) :=
PB(ẑ)PAA(ẑ) − [P(ẑ)PB(ẑ) + PA(ẑ)]PAB(ẑ) + P(ẑ)PA(ẑ)PBB(ẑ)
PB(ẑ)2
≥ 0
by assumption where ẑ := (â + x,b̂ − Y(x;â,b̂)).
to guarantee the existence of β(δ) for any δ ∈ [−a,∞) through the surjectivity of b 7→ P(a,b) as provided in
Proposition 3.13. However, if β(δ) does not exist, then pooling would need to be done primarily in A instead using
the, similarly defined, function α : [−b,∞) → [−a,∞). (At least one of α or β can be appropriately defined as, from
the proof of Proposition 3.13, limāց0 P(ā,b) = ∞ and limb̄ց0 P(a,b̄) = 0 for any a,b > 0 without requiring (I+).)
13C.8 Proof of Corollary 3.16
Proof. The decrease of the price impact from swapping inequalities, i.e. the inequalities in (3.3) follow
immediately from the definition of IY, IX and (3.1) shown in Theorem 3.14.
C.9 Proof of Proposition 3.18
Proof. To show the approximating power of the price impact oracle, we will only investigate the bounds for
Y; similar arguments can be made for the bounds on X. Fix (a,b) ∈ R2
++ and let z(x) := (a+x,b−Y(x;a,b)).
By simple differentiation, we find that
Y′
(x) = P(z(x)), (C.1)
Y′′
(x) = PA(z(x)) − P(z(x))PB(z(x)),
Y′′′
(x) = PAA(z(x)) − 2P(z(x))PAB(z(x)) + P(z(x))2
PBB(z(x))
+ (P(z(x))PB(z(x)) − PA(z(x)))PB(z(x)) (C.2)
for any x ≥ 0. Therefore, since Y is thrice continuously differentiable at x = 0, we have the Taylor expansion
of Y around zero as
Y(x) = Y(0) + aY′
(0)
x
a
+
a2
2
Y′′
(0)
x
a
2
+ O
x
a
3

= P(a,b)x −
1
2
(P(a,b)PB(a,b) − PA(a,b))x2
+ O
x
a
3

. (C.3)
For the second part of the proposition, first let the conditions of Theorem 3.14 hold. Let β : [−a,∞) →
[−b,∞) be defined as in the proof of Theorem 3.14.15
To simplify notation, let (â,b̂) := (a + δ,b+ β(δ)) for
δ ∈ (−a,∞). The result follows by taking the derivative of the price impact oracle w.r.t. the added liquidity
δ (noting that P(a,b) = P(â,b̂)):
∂
∂δ
I(â,b̂) =
∂
∂δ
[P(a,b)PB(â,b̂) − PA(â,b̂)]
= −
PB(â,b̂)PAA(â,b̂) − (P(a,b)PB(â,b̂) + PA(â,b̂))PAB(â,b̂) + P(a,b)PA(â,b̂)PBB(â,b̂)
PB(â,b̂)
= −
PB(â,b̂)PAA(â,b̂) − (P(â,b̂)PB(â,b̂) + PA(â,b̂))PAB(â,b̂) + P(â,b̂)PA(â,b̂)PBB(â,b̂)
PB(â,b̂)
≤ 0.
Now assume (SC) and (SI). Note that, as in Remark 10, β(δ) = δb/a for any δ ∈ (−a,∞). Therefore,
15
As noted within the proof of Theorem 3.14, we can take α : [−b,∞) → [−a,∞) instead if β is not well-defined
for every reserve level.
14the modified liquidity (â,b̂) = (ta,tb) for some t > 0 and, as such, we can prove the desired monotonicity in
liquidity by demonstrating that the price impact oracle is positive homogeneous of degree −1. Fix t > 0 then,
by the positive homogeneity of Y (see Lemma 3.9(3)) and the scale invariance of P (see Proposition 3.13(4)),
I(ta,tb) = −
1
2
Y′′
(0;ta,tb) = −
1
2
lim
ǫց0
Y′
(ǫ;ta,tb) − Y′
(0;ta,tb)
ǫ
= −
1
2
lim
ǫց0
Y′
(tǫ;ta,tb) − Y′
(0;ta,tb)
tǫ
= −
1
2t
lim
ǫց0
P(t[a + ǫ],t[b − Y(ǫ;a,b)]) − P(ta,tb)
ǫ
= −
1
2t
lim
ǫց0
P(a + ǫ,b − Y(ǫ;a,b)) − P(a,b)
ǫ
=
1
t
I(a,b).
C.10 Proof of Corollary 3.19
Proof. In the same setting as in the proof of Proposition 3.18, the upper and the lower bounds trivially
follow from the Taylor expansion of Y in (C.3), and the assumptions of the lemma that the derivatives in
(C.1)–(C.2) satisfy Y′
(x) > 0, Y′′
(x) ≤ 0, and Y′′′
(x) ≥ 0 for any x ≥ 0. The bounds for IX can similarly
be proven. Finally, by Proposition 3.13(1), I(a,b) ≥ 0 for any (a,b) ∈ R2
++.
C.11 Proof of Proposition 4.1
1. Under the assumptions, trivially u(x,0) = U(x) + U(0) = −∞, u(0,y) = U(0) + U(y) = −∞ and
u(z) = U(z1) + U(z2) > −∞ for any x,y ≥ 0 and z ∈ R2
++.
2. Under the assumptions, trivially limx̄→∞ u(x̄,y) = limx̄→∞ U(x̄) + U(y) = ∞ and limȳ→∞ u(x,ȳ) =
U(x) + limȳ→∞ U(ȳ) = ∞ for any x,y > 0.
3. Let z − z̄ ∈ R2
+\{0} for z,z̄ ∈ R2
++, i.e., z1 ≥ z̄1, z2 ≥ z̄2 and z 6= z̄. Therefore at least one of z1 > z̄1
or z2 > z̄2. Under the assumptions, the desired strict monotonicity follows: u(z) = U(z1) + U(z2) >
U(z̄1) + U(z̄2) = u(z̄).
4. First we note that u(x,y) = U(x) + U(y) is concave as the sum of two concave functions, i.e., (QC)
holds trivially. Now let us consider the properties of (SC) under the added assumption that U′
(z) > 0
for every z > 0: Fix z ∈ R2
++.
• uA(z) = U′
(z1) > 0 and uB(z) = U′
(z2) > 0.
• uB(z)uAA(z) = U′
(z2)U′′
(z1) ≤ 0 = uA(z)uAB(z) and uA(z)uBB(z) = U′
(z1)U′′
(z2) ≤ 0 =
uB(z)uAB(z) as uAB ≡ 0.
5. To prove (I+), fix x,y > 0:
15• limx̄→∞ uA(x̄,y) = limx̄→∞ U′
(x̄) = 0 and limȳ→∞ uB(x,ȳ) = limȳ→∞ U′
(ȳ) = 0.
• limx̄→∞ uB(x̄,y) = U′
(y) ∈ (0,∞) and limȳ→∞ uA(x,ȳ) = U′
(x) ∈ (0,∞).
• limx̄→0 uA(x̄,y) = limx̄→0 U′
(x̄) = ∞ and limȳ→0 uB(x,ȳ) = limȳ→0 U′
(ȳ) = ∞.
• limx̄→0 uB(x̄,y) = U′
(y) ∈ (0,∞) and limȳ→0 uA(x,ȳ) = U′
(x) ∈ (0,∞).
6. First we recall that P(z) = U′
(z1)/U′
(z2) for any z ∈ R2
++. Note that, by assumption, U′
(z)U′′′
(z) ≥
U′′
(z)2
for any z > 0 by assumption. Fix z ∈ R2
++ then:
PB(z)PAA(z) − (P(z)PB(z) + PA(z))PAB(z) + P(z)PA(z)PBB(z)
= −
U′
(z1)U′′
(z2)
U′(z2)2
U′′′
(z1)
U′(z2)
+

−
U′
(z1)
U′(z2)
U′
(z1)U′′
(z2)
U′(z2)2
+
U′′
(z1)
U′(z2)

U′′
(z1)U′′
(z2)
U′(z2)2
+
U′
(z1)
U′(z2)
U′′
(z1)
U′(z2)
U′
(z1)

2U′′
(z2)2
− U′
(z2)U′′′
(z2)

U′(z2)3
=
U′
(z1)2
U′′
(z1)[U′′
(z2)2
− U′
(z2)U′′′
(z2)] + U′
(z2)2
U′′
(z2)[U′′
(z1)2
− U′
(z1)U′′′
(z1)]
U′(z2)5
≥ 0.
7. Recall that P(z) = U′
(z1)/U′
(z2) for any z ∈ R2
++. Therefore, by construction:
Ψ(z) = PAA(z) − 2P(z)PAB(z) + P(z)2
PBB(z) + (P(z)PB(z) − PA(z))PB(z)
=
U′′′
(z1)
U′(z2)
+ 2
U′
(z1)
U′(z2)
U′′
(z1)U′′
(z2)
U′(z2)2
+
U′
(z1)2
U′(z2)2
U′
(z1)

2U′′
(z2)2
− U′
(z2)U′′′
(z2)

U′(z2)3
+

U′
(z1)
U′(z2)
U′
(z1)U′′
(z2)
U′(z2)2
+
U′′
(z1)
U′(z2)

U′
(z1)U′′
(z2)
U′(z2)2
=
U′
(z1)3
[3U′′
(z2)2
− U′
(z2)U′′′
(z2)] + U′
(z2)2
[U′
(z2)2
U′′′
(z1) + 3U′
(z1)U′′
(z1)U′′
(z2)]
U′(z2)5
for any z ∈ R2
++. Trivially, by the assumptions, Ψ(z) ≥ 0 for any z ∈ R2
++, i.e., (3.4) is satisfied.
Consider, now, (3.5) and fix z ∈ R2
++
− P(z)Ψ(z) + 3(P(z)PB(z) − PA(z))2
=
U′
(z2)3
[3U′′
(z1)2
− U′
(z1)U′′′
(z1)] + U′
(z1)2
[U′
(z1)2
U′′′
(z2) + 3U′
(z2)U′′
(z1)U′′
(z2)]
U′(z2)5
.
By the same logic as above, (3.5) is satisfied.
C.12 Proof of Lemma 5.4
Proof. We will prove these results for p < P(a,b) only; the case for p > P(a,b) follows similarly. To simplify
notation, let Yγ(p) := Yγ(xp;(1+δ)a,(1+δ)b). Furthermore, recall that p = P((1+δ)a+xp,(1+δ)b−Yγ(p)) =
1
1−γ Y′
γ(xp;(1 + δ)a,(1 + δ)b). First, we wish to demonstrate that we recover the simplified version of the
16divergence loss:
∆(p) = δ[pa + b] −
δ
1 + δ
[p((1 + δ)a + xp) + ((1 + δ)b − Yγ(p)]
=
δ
1 + δ
[(1 + δ)(pa + b) − p((1 + δ)a + xp) − ((1 + δ)b − Yγ(p))]
=
δ
1 + δ
[Yγ(p) − pxp].
Therefore the sign of the divergence loss ∆(p) is completely characterized by the sign of Yγ(p)−pxp. As there
is a one-to-one relation between ∆ and ¯ ∆, we will consider the question of the sign of Yγ(x;(1 + δ)a,(1 +
δ)b) − P((1 + δ)a + x,(1 + δ)b − Yγ(x;(1 + δ)a,(1 + δ)b))x as x ≥ 0 varies (corresponding to p ≤ P(a,b)).
To simplify notation, as before we will drop the arguments of these functions where the meaning is clear.
Note that [Yγ − Px]x=0 = 0 by construction and ∂
∂x[Yγ − Px] = −γP + x((1 − γ)PPB − PA). Recall
from Proposition 3.13 that PA ≤ 0 and PB ≥ 0. Therefore, at γ = 0, Yγ − Px ≥ 0 for any x > 0 with
equality if and only if P((1 + δ)a + x,(1 + δ)b − Yγ(x;(1 + δ)a,(1 + δ)b)) = P(a,b), i.e., where p = P(a,b).
If γ ∈ (0,1) then, for x small enough, ∂
∂x[Yγ − Px] < 0; thus there exists some x∗ ∈ (0,∞] such that
Yγ − Px < 0 for every x ∈ (0,x∗
) and [Yγ − Px]x=x∗ = 0. By the relation between x and p, we can define
p∗ := P((1 + δ)a + x∗,(1 + δ)b − Yγ(x∗;(1 + δ)a,(1 + δ)b)).
C.13 Proof of Corollary 5.6
Proof. Proof Let δ := P(a,b)α+β
P(a,b)a+b . For the purposes of this proof, we will consider the case with p < P(a,b)
generated by a swap of x > 0 for Y(x;a + α,b + β) > 0. Note that ¯ ∆(0) = 0. Fix z := (a + α + x,b + β −
Y(x;a + α,b + β)) then
¯ ∆′
(x) = (PA(z) − P(z)PB(z))α −
δ
1 + δ
[P(z) + (PA(z) − P(z)PB(z))(a + α + x) − P(z)]
=
PA(z) − P(z)PB(z)
1 + δ
(α − δ(a + x)).
Recall, from Proposition 3.13, that PA(z) ≤ 0 and PB(z) ≥ 0; in fact, without loss of generality, we can
take PA(z) − P(z)PB(z) < 0 as otherwise there exists some x∗
> x such that P(z) = P(a + α + x∗
,b + β −
Y(x∗
;a + α,b + β)) which can be taken instead. Therefore, for x > 0 small enough, ¯ ∆′
(x) < 0 if and only if
α−δa > 0, i.e., α < δa and β > δb, i.e., α/β < a/b. Similarly, considering a swap y > 0 for X(y;a+α,b+β)
results in ¯ ∆′
(−y) < 0 if and only if β − δb > 0.
17D Properties of fees on the marginal price
Herein we wish to provide the properties that our novel fee structure (Definition 5.2) satisfies. Recall that
the intuition behind the constructions (5.1) and (5.2) is that the AMM should be indifferent to the size of
transactions; a sequence of unidirectional small trades should have the same result for the pool as a single
large trade (assuming nothing happens in between the transactions). In other words, a trade of Yγ(x;a,b)
and then another (infinitesimal) trade Yγ(dx;a + x,b − Yγ(x;a,b)) should be equivalent to a single trade
of Yγ(x + dx;a,b) from the perspective of the pool. Charging γ proportion in fees, and using the fact that
Yγ(dx;a + x,b − Yγ(x;a,b)) ≈ Y′
γ(0;a + x,b − Yγ(x;a,b))dx = (1 − γ)P(a + x,b − Yγ(x;a,b))dx, we arrive
at an equivalent ODE formulation for (5.1):
Y′
γ(x) = (1 − γ)P(a + x,b − Yγ(x)) =: (1 − γ)g(x,Yγ(x)) ∀x ≥ 0 (D.1)
with initial value Yγ(0) = 0. (An ODE can similarly be provided for Xγ).
Before continuing with the discussion of these fees, we will prove that the AMM with fees is well-defined
in that there exists unique swap functions Yγ,Xγ given by Definition 5.2.
Lemma D.1. Let u : R2
+ → R ∪ {−∞} be an AMM satisfying Assumption 5.1. There exists unique swap
functions Yγ,Xγ for any γ ∈ [0,1].
Proof. We will prove the result for Yγ only, the proof for Xγ follows comparably. Consider the ODE
representation (D.1) and note the domain domg := R+ × [0,b). By Proposition 3.13, g and ∂
∂xg, ∂
∂y g are
continuous, and thus bounded, on this domain. Therefore, by the Picard-Lindelöf Theorem and extension
theorem (e.g., [23, Theorem II.1.1 and Theorem II.3.1]), there exists a unique solution Yγ(x) on some
maximal domain x ∈ [0,x∗
) for some x∗
> 0. Furthermore, by the extension theorem, if x∗
< ∞ then
limx→x∗ Yγ(x) ∈ {0,b}. Trivially, Yγ(x) > 0 for x > 0 by g(x,y) > 0 for any y ∈ [0,b). Assume now that
x∗
< ∞ and limx→x∗ Yγ(x) = b. To complete this proof, we will demonstrate that Yγ(x) ≤ Y(x) for any
x ∈ [0,x∗
), from which it will follow that limx→x∗ Yγ(x) ≤ limx→x∗ Y(x) = Y(x∗
) < b (by Lemma 3.7(3))
to reach a contradiction. To show that Yγ(x) ≤ Y(x) for any x ∈ [0,x∗
), assume by contradiction that this
inequality is false and take x†
:= inf{x ∈ [0,x∗
) | Yγ(x) > Y(x)} < x∗
. Note that Yγ(x†
) = Y(x†
) by a
simple continuity argument, and Yγ(x†
+ ǫ) > Y(x†
+ ǫ) for every ǫ ∈ (0,δ) for some δ > 0. However, this
implies Y′
γ(x†
) = (1 − γ)g(x†
,Yγ(x†
)) ≤ g(x†
,Y(x†
)) = Y′
(x†
) which results in a simple contradiction.
Before studying the properties of the modified swap functions and pricing oracle, we wish to provide an
explicit example of the swap function Yγ under a real-world AMM construction.
18Example D.2. Consider the Uniswap V2 utility function u(x,y) = log(x) + log(y) as discussed in Exam-
ple 3.2. For this AMM, the pricing oracle P(x,y) = y/x is the ratio of the reserves as noted in Example 3.6.
The swap for x ≥ 0 with fee level γ ∈ [0,1] can be found to be
Yγ(x;a,b) = b

1 −
a1−γ
(a + x)1−γ

by solving the differential equation (D.1).
We now consider our first property of the AMM with fees. Specifically, as expected, as the fees γ increase
then the pool will pay out less in a swap.
Proposition D.3. Let u : R2
+ → R∪{−∞} be an AMM satisfying Assumption 5.1. For any 0 ≤ γ1 < γ2 ≤ 1,
0 ≤ Yγ2 (x;a,b) < Yγ1 (x;a,b) ≤ Y(x;a,b), (D.2)
0 ≤ Xγ2 (y;a,b) < Xγ1 (y;a,b) ≤ X(y;a,b),
for every x,y > 0 and a,b > 0.
Proof. As in prior proofs, we will provide the proof of this result for Yγ only as the proof for Xγ follows
comparably. First, we wish to note that the non-strict monotonicity encoded in (D.2) follows as a simple
application of [23, Theorem III.4.1]. We now wish to prove the strict monotonicity of (D.2). Consider the
ODE satisfied by ∂
∂γ Yγ(x;a,b), i.e.,
∂
∂γ
Y′
γ(x;a,b) = −P(a + x,b − Yγ(x;a,b)) − (1 − γ)
∂
∂γ
Yγ(x;a,b)PB(a + x,b − Yγ(x;a,b)) (D.3)
where, by (SC), we have that ∂
∂γ Y′
γ =

∂
∂γ Yγ
′
. Furthermore, note that we can view P(a+x,b−Yγ(x;a,b))
and PB(a + x,b − Yγ(x;a,b)) as functions of x (with fixed reserves a,b > 0). Therefore, together with the
initial condition ∂
∂γ Yγ(0;a,b) = 0, we can explicitly solve (D.3) for ∂
∂γ Yγ(x;a,b), i.e., for any x ≥ 0
∂
∂γ
Yγ(x;a,b) = −
Z x
0
e−(1−γ)
R x
t
PB(a+u,b−Yγ(u;a,b))du
P(a + t,b − Yγ(t;a,b))dt.
As this is strictly negative for any x > 0, (D.2) follows.
We now turn our attention to the fundamental properties of AMMs that, without fees, were studied
previously in Section 3.2. Within the following corollary, we find that all relevant properties are satisfied by
Yγ with strictly positive fees. For this result we restrict ourselves to fee levels γ ∈ (0,1); if γ = 0 then we
recover the original swap values (as discussed in Remark 17) and if γ = 1 then Y1 ≡ 0 by construction.
19Corollary D.4. Consider an AMM u : R2
+ → R ∪ {−∞} satisfying Assumption 5.1. Fix the fee level
γ ∈ (0,1), initial pool reserves a,b > 0, and swap amounts x,x1,x2 ≥ 0.
1. u(a + x,b − Yγ(x)) ≥ u(a,b) with strict inequality if x > 0, i.e., market utility never drops.
2. (Positive Marginal Return) and (Decreasing Marginal Return): Yγ is strictly increasing,
concave, and subadditive in x.
3. (No Wasted Liquidity): If, additionally, (UfA), then lim
x→∞
Yγ(x) = b.
4. If, additionally, (SI), then Yγ is positive homogeneous in (x;a,b), i.e., Yγ(tx;ta,tb) = tYγ(x;a,b) for
any t > 0.
5. (Path Independent): Yγ(x1 + x2;a,b) = Yγ(x1;a,b) + Yγ(x2;a + x1,b − Yγ(x1;a,b)).
Proof. 1. Let x > 0 as the case of equality when x = 0 is trivial. By Lemma 3.7(2) and Proposition D.3,
and recalling from Remark 17 that Y0 ≡ Y, u(a + x,b − Yγ(x)) > u(a + x,b − Y(x)) = u(a,b).
2. (a) Strict monotonicity of Yγ in x follows trivially from its integral representation as the pricing
oracle is strictly positive on positive pool sizes.
(b) By implicit differentiation of (D.1) and the monotonicity of the pricing oracle as provided in
Proposition 3.13, Y′′
γ (x) = (1−γ)[PA(a+x,b−Yγ(x))−(1−γ)P(a+x,b−Yγ(x))PB(a+x,b−
Yγ(x))] ≤ 0.
(c) Subadditivity follows from concavity and Yγ(0) = 0 as demonstrated in the proof of Lemma 3.9(4).
3. Note that cB(b) := supā>0 uB(ā,b) < ∞ for every b > 0, because uB is continuous with limiting
behavior lim
ā→0
uB(ā,b), lim
ā→∞
uB(ā,b) < ∞. Assume by contradiction that lim
x→∞
Yγ(x) = Y∗
γ < b. Recall
Yγ is strictly monotonic, therefore Yγ(x) < Y∗
γ for every x. Therefore,
lim
x→∞
Yγ(x) = lim
x→∞
(1 − γ)
Z x
0
P(a + y,b − Yγ(y))dy ≥ (1 − γ)
Z ∞
0
P(a + y,b − Y∗
γ)dy
= (1 − γ)
Z ∞
0
uA(a + y,b − Y∗
γ)
uB(a + y,b − Y∗
γ)
dy ≥
(1 − γ)
R∞
0
uA(a + y,b − Y∗
γ)dy
cB(b − Y∗
γ)
=
1 − γ
cB(b − Y∗
γ)

lim
x→∞
u(a + x,b − Y∗
γ) − u(a,b − Y∗
γ)

= ∞.
4. Let t > 0. From (D.1) it follows that
∂
∂x
1
t
Yγ(tx;ta,tb) = (1 − γ)P(ta + tx,tb − Yγ(tx;ta,tb)) = (1 − γ)P(a + x,b −
1
t
Yγ(tx;ta,tb)).
Since for x = 0, we have that both 1
t Yγ(0;ta,tb) = 0 = Yγ(0;a,b), we can appeal to the existence and
uniqueness result of Lemma D.1 to recover 1
t Yγ(tx;ta,tb) = Yγ(x;a,b), i.e., positive homogeneity.
205. From (D.1) it follows that
Y′
γ(x1 + x2;a,b) = (1 − γ)P(a + x1 + x2,b − Yγ(x1;a,b) − [Yγ(x1 + x2;a,b) − Yγ(x1;a,b)]). (D.4)
Note also that
Y′
γ(x1 + x2;a,b) =
∂
∂x2
[Yγ(x1 + x2;a,b) − Yγ(x1;a,b)]. (D.5)
Combining (D.4) and (D.5), it follows that
∂
∂x2
[Yγ(x1 + x2;a,b) − Yγ(x1;a,b)]
= (1 − γ)P(a + x1 + x2,b − Yγ(x1;a,b) − [Yγ(x1 + x2;a,b) − Yγ(x1)]).
We also have, by construction of (D.1), that
Y′
γ(x2;a + x1,b − Yγ(x1;a,b))
= (1 − γ)P(a + x1 + x2,b − Yγ(x1;a,b) − Yγ(x2;a + x1,b − Yγ(x1;a,b)))
Since for x2 = 0, we have that both Yγ(x1 + x2) − Yγ(x1) = 0 = Yγ(x2;a + x1,b − Yγ(x1;a,b)), we
can appeal to the existence and uniqueness result of Lemma D.1 to conclude
Yγ(x1 + x2;a,b) − Yγ(x1;a,b) = Yγ(x2;a + x1,b − Yγ(x1;a,b))
for any x1,x2 ≥ 0.
Remark 23. In contrast to the fee-less construction provided within Section 3 (and as expected), introducing
a fee γ ∈ (0,1) immediately introduces a bid-ask spread. Specifically, the bid price is given by Y′
γ(0) =
(1 − γ)P(a,b) and the ask price is given by X′
γ(0)−1
= (1 − γ)−1
P(a,b) for any pool reserves (a,b) ∈ R2
++.
Note that the pricing oracle P(a,b) is between the bid and ask prices but is not the mid-price.
As a direct consequence of the bid-ask spread discussed in Remark 23, the introduction of fees guarantees
a strict no-arbitrage condition.
Corollary D.5. (No Arbitrage): Consider an AMM u : R2
+ → R ∪ {−∞} satisfying Assumption 5.1. If
γ ∈ (0,1] then Xγ(Yγ(x;a,b);a +x,b− Yγ(x;a,b)) < x and Yγ(Xγ(y;a,b);a−Xγ(y;a,b),b+ y) < y for any
x,y > 0 and a,b > 0.
21Proof. We will only prove the first inequality, the second follows similarly. By Lemma 3.8(2), Theo-
rem 3.12(1), and Proposition D.3,
Xγ(Yγ(x;a,b);a + x,b − Yγ(x;a,b)) < X(Yγ(x;a,b);a + x,b − Yγ(x;a,b))
≤ X(Yγ(x;a,b);a + x,b − Y(x;a,b))
< X(Y(x;a,b);a + x,b − Y(x;a,b)) = x.
We wish to conclude the discussion of properties of the swap amounts with fees by studying the depen-
dence of Yγ on the reserves (a,b) as well as the fees γ.
Corollary D.6. (Monotone in Liquidity): Consider an AMM u : R2
+ → R ∪ {−∞} satisfying Assump-
tion 5.1. Fix the fee level γ ∈ (0,1]. Then ∂
∂aYγ(x;a,b) ≤ 0 and ∂
∂bYγ(x;a,b) ∈ [0,1) for any x ≥ 0 and
a,b > 0.
Proof. We will prove this result for ∂
∂aYγ(x;a,b) ≤ 0 only; the proof for ∂
∂bYγ(x;a,b) ∈ (0,1] follows similarly.
Following the same strategy as in the proof of Proposition D.3, we can construct the ODE
∂
∂a
Y′
γ(x;a,b) = (1 − γ)[PA(a + x,b − Yγ(x;a,b)) −
∂
∂a
Yγ(x;a,b)PB(a + x,b − Yγ(x;a,b))]
with initial condition ∂
∂aYγ(0;a,b) = 0 for every a,b > 0. By solving this ODE, we recover
∂
∂a
Yγ(x;a,b) = (1 − γ)
Z x
0
e−(1−γ)
R x
t
PB(a+u,b−Yγ(u;a,b))du
PA(a + t,b − Yγ(t;a,b))dt, ∀x ≥ 0.
From Proposition 3.13 it now follows that ∂
∂aYγ(x;a,b) ≤ 0.
Remark 24. The fee structure introduced within Section 5 is not the only approach that can be used for an
AMM. We wish to highlight two alternate structures which can be viewed as assessing the fees on the assets
sold or bought by the investor respectively. With both of these structures we wish to briefly comment on how
an investor may want to optimally split a transaction when transacting with the pool; this lack of indifference
to trade splitting leads to strange implications for the pool (i.e., the liquidity provider should only care about
the final state of the pool rather than how trades are executed).
1. Consider the fees collected on the asset being sold to the pool. That is, a fraction γ ∈ [0,1] of x is
taken by the pool to compensate it for acting as a liquidity provider. Mathematically, this is encoded
by
Ȳγ(x;a,b) := Y((1 − γ)x;a,b).
22That is, the collected fees are γx of asset A so that the realized pool size, after the swap is completed,
is still of the form (a +x,b−Ȳγ(x;a,b)). We wish to note that this is the fee structure considered in,
e.g., [8, 26].
Though a simple structure to implement, this fee structure provides a discount to buying in bulk, i.e.,
Ȳγ(x1 +x2;a,b) ≥ Ȳγ(x1;a,b)+Ȳγ(x2;a+x1,b−Ȳγ(x1;a,b)), and aside from extreme cases, leading
to strict inequality violating (Path Independent). By imposing costs to an investor who splits her
transaction, the pool is subsidizing large traders.
2. Consider the fees collected on the asset being bought by the trader. That is, a fraction γ ∈ [0,1] of Y
is taken by the pool to compensate it for acting as a liquidity provider. Mathematically, this is encoded
by
Ȳγ
(x;a,b) := (1 − γ)Y(x;a,b).
That is, the collected fees are γY(x;a,b) of asset B so that the realized pool size, after the swap is
completed, is still of the form (a + x,b − Ȳγ
(x;a,b)).
In contrast to the fees on the sold asset, imposing fees on the bought asset provides a benefit to an
investor who splits her trade over time, i.e., Ȳγ
(x1 + x2;a,b) ≤ Ȳγ
(x1;a,b) + Ȳγ
(x2;a + x1,b −
Ȳγ
(x1;a,b)), and aside from extreme cases, leading to strict inequality violating (Path Independent).
By encouraging these small transactions, the pool incentivizes traders to make a series of infinitesimally
small transactions; that is, an intelligent trader will, in fact, implement the integral strategy Yγ we
propose in Definition 5.2.
E Accounting Profits and Losses
As highlighted by, e.g., Figure 2b, it is possible for both the liquidity provider and an arbitrageur (taking
advantage of the pool’s stale price) to have accounting profits. Within this section, we wish to detail the
strategies of both types of market participants.
23E.1 Liquidity Providers
Recall from Remark 19 that the accounting profits and losses of the liquidity providing position can be
provided by:
ΠL(p) :=

     
     
P(a,b)α+β
P(a,b)[a+α]+[b+β] [p(a + α + xp) + (b + β − Yγ(xp;a + α,b + β)] − (P(a,b)α + β) if p < P(a,b)
P(a,b)α+β
P(a,b)[a+α]+[b+β] [p(a + α − Xγ(yp;a + α,b + β)) + (b + β + yp)] − (P(a,b)α + β) if p > P(a,b)
0 if p = P(a,b)
where xp,yp are as in Definition 5.3. Though it is possible that with high enough fees γ ∈ (0,1), there is
also an accounting profit for the liquidity provide even in case of price decrease p < P(a,b), we will consider
the more intuitive case when the price increases p > P(a,b) and the accounting profits are always positive.
For simplicity of constructions, herein we consider Π̄L as a function of the swap amounts rather than prices
(as taken with ¯ ∆ in Section 5.2). Noting that Π̄L(0) = 0, we wish to consider the change in the profitability
as the swap size grows, i.e.,
Π̄′
L(y) =
P(a,b)α + β
P(a,b)[a + α] + [b + β]
×

γ +

−
(1 − γ)PA(a + α − Xγ(y),b + β + y)
P(a + α − Xγ(y),b + β + y)
+ PB(a + α − Xγ(y),b + β + y)

(a + α − Xγ(y))

≥ 0
by PA ≤ 0 and PB ≥ 0. In particular, if y > 0 and γ ∈ (0,1) then Π̄L(y) > 0. For Uniswap V2 (see
Example D.2), these profits are given by ΠL(p) =
2αyp
a+α > 0. As highlighted in Figure 2a, though the liquidity
providers would be guaranteed positive profits, the divergence loss may still exist. The aforementioned
properties indicate that the liquidity providers are purchasing a long position in A (where B is utilized as
the numéraire asset). By symmetry, it becomes clear that the profitability of the pool depends crucially on
the choice of numéraire.16
E.2 Arbitrageurs
In contrast to the long position in A taken by the liquidity providers, the arbitrageurs are directionally
agnostic. As such, it is possible for both the liquidity provider and an arbitrageur (taking advantage of the
pool’s stale price) to have accounting profits. Consider the strategy of the arbitrageur:
16
This symmetry holds also for the buy-and-hold strategy. For example, letting pA,pB > 0 be the price of A and
B respectively in some third asset (e.g., US dollars) then the value of this strategy in units of B is monotonically
increasing in pA/pB while the value in units of A would be monotonically decreasing.
24• If the arbitrageur is able to buy A frictionlessly at a price of p < (1 − γ)P(a,b) on some external
market, then she will purchase x(1−γ)−1p units of A externally (for a cost of px(1−γ)−1p) swap for
Yγ(x(1−γ)−1p;a + α,b + β) through the AMM (for a value of Yγ(x(1−γ)−1p;a + α,b + β)). This leads
to a strictly positive profit of ΠA(p) := Yγ(x(1−γ)−1p;a + α,b + β) − px(1−γ)−1p > 0.
• If the arbitrageur is able to sell A frictionlessly at a price of p > (1 − γ)−1
P(a,b) on some external
market, then she will borrow y(1−γ)p units of B externally (at unit cost), swap for Xγ(y(1−γ)p;a +
α,b + β) through the AMM, and liquidate those A assets (for a value of pXγ(y(1−γ)p;a + α,b + β)).
This leads to a strictly positive profit of ΠA(p) := pXγ(y(1−γ)p;a + α,b + β) − y(1−γ)p > 0.
Note that, due to the fee structure, the arbitrageur would not profit (and, therefore, not operate) if the
external market quotes a price within the bid-ask spread of the pool (1 − γ)P(a,b) < (1 − γ)−1
P(a,b).17
The profitability of the arbitrageur follows from the construction of Yγ,Xγ as provided in Definition 5.2.
F Comparison to Prior Axioms and Definitions
Within this section, we wish to highlight four other contemporary papers which, independently, provide
generalized definitions of AMMs. Within this section we highlight how the axioms proposed herein relate to
the definitions used within [13, 20, 28, 9]. For ease of reference, these results are summarized within Table 3.
First, [13] introduces four properties for the utility function u : R2
+ → R ∪ {−∞} of an AMM within
Assumption 1 of that work. Briefly, that paper assumes that:
1. Positive derivatives: uA(z),uB(z) > 0 for every z ∈ R2
+ is a stronger version of (SM) though, we
note, we also assume this property within (SC);
2. Convexity: uAA(z),uBB(z) < 0, uAB(z) > 0 for every z ∈ R2
+ was discussed in more details within
Remark 1 and (along with the prior property) implies (SC);
3. Homogenous of degree l: ∃l > 0 : ∀c ≥ 0, cl
u(z) = u(cz) for every z ∈ R2
+ is strictly stonger
than (SI); and
4. Surjective in price: limx→0 P(x,y) = ∞, limx→∞ P(x,y) = 0,
limy→0 P(x,y) = 0, limy→∞ P(x,y) = ∞ is strongly related to (Infinite Liquidity) as highlighted
in Remark 9; in particular, we find this property is implied by (UfB), (QC), (I+), and (SC) within
Proposition 3.13(2) and (3).
17
Notably, the necessary condition for profitability of the liquidity provider coupled with the behavior of the
arbitrageur, guarantees that the liquidity provider cannot profit off of an arbitrageur for any price p < P(a,b).
25Second, [20] independently considered utility functions u : R2
+ → R∪{−∞} that were strictly increas-
ing (i.e., (SM)) and quasiconcave (i.e., (QC)). Notably, that work makes no further assumptions upon the
AMMs under consideration. We highlight in Table 2 how these two axioms alone are insufficient to guarantee
most desired properties for the markets made by an AMM.
Third, [28] introduces a number of properties for the utility functions u : R2
+ → R ∪ {−∞}.18
Briefly,
that paper assumes that:
1. Existence of marginal prices: u is differentiable everywhere implies (C) and, in turn, is implied
by (SC) where we assume twice-differentiability;
2. Aversion to permament loss: {z ∈ R2
+ | u(z) ≥ u(z̄)} is convex for every z̄ ∈ R2
+ is equivalent
to (QC);
3. Sufficient funds: u(z) = u(z̄) with z̄ ∈ R2
++ implies z ∈ R2
++ provides the same implications as
(UfB) used herein;
4. Scale invariance: u(z) = u(z̄) implies u(tz) = u(tz̄) for any z,z̄ ∈ R2
+ and t > 0 is equivalent to
(SI);
5. Homogenity in liquidity: u(tz) = tu(z) for any z ∈ R2
+ and t > 0 is strictly stronger than (SI);
6. Translation invariance: u(z) = u(z̄) implies u(z +t1) = u(z̄ +t1) for any feasible t ∈ R is only
applicable for proving the equivalence to scoring rules for prediction markets (as in [15]);
7. One invariance: u(z + t1) = u(z) + t is a stronger translation invariance property; and
8. Symmetry: u(a,b) = u(b,a) is not explicitly considered herein though we note that all examples in
Section 4 satisfy this property.
Finally, [9] considers a geometric representation for AMMs rather than the functional approach taken
elsewhere. Specifically, in that work, the authors consider the reachable set Sz = {z̄ ∈ R2
| u(z̄) ≥ u(z)}
as the set of positions that can be attained through trading with the pool (the equivalence to the utility
formulation provided is the functional equivalent).19
Briefly, that paper assumes that:
1. Non-empty and non-negative reserves: ∅ 6= Sz ⊆ R2
+ for any z ∈ R2
++ is equivalent to
domu ⊆ R2
+;
2. Closed: Sz is closed for any z ∈ R2
++ is equivalent to the upper semicontinuity of u (and therefore
implied by, e.g., (C));
18
We wish to note that [28] proposes all of these axioms within a multi-asset market. For ease of comparison, we
consider only the two asset case herein.
19
We wish to note that [9] proposes all of these axioms within a multi-asset market. For ease of comparison, we
consider only the two asset case herein.
263. Convex: Sz is convex for any z ∈ R2
++ is equivalent to (QC); and
4. Upward closed: Sz + R2
+ = Sz for any z ∈ R2
++ is implied by (SM) (and is equivalent to the
non-strict monotonicity).
27Reference Property (UfB) (UfA) (SM) (C) (QC) (SI) (I+) (SC) (3.2) (3.4) (3.5)
[13]
Positive derivatives
uA,uB > 0
⇒ ⇒ ⇐
Convexity
uAA,uBB < 0, uAB > 0
⇒∗
Homogenous of degree l
∃l > 0 : cl
u(z) = u(cz)
⇒
Surjective in price
limx→0 P(x,y) = ∞, limx→∞ P(x,y) = 0,
limy→0 P(x,y) = 0, limy→∞ P(x,y) = ∞
⇐ ⇐ ⇐ ⇐
[20]
Strictly increasing X
Quasiconcave X
[28]
Existence of marginal prices
u is differentiable
⇒ ⇐
Aversion to permanent loss
{z | u(z) ≥ u(z̄)} convex
X
Sufficient funds
u(z) = u(z̄) then z ∈ R2
++ ⇒ z̄ ∈ R2
++
X
Scale invariance
u(z) = u(z̄) implies u(tz) = u(tz̄)
X
Homogeneity in liquidity
u(tz) = tu(z)
⇒
Translation invariance
u(z) = u(z̄) ⇒ u(z + t1) = u(z̄ + t1)
Only appropriate for prediction markets
One invariance
u(z + t1) = u(z) + t
Only appropriate for prediction markets
Symmetry
u(a,b) = u(b,a)
[9]
Non-empty and non-negative reserves
∅ 6= Sz := {z̄ | u(z̄) ≥ u(z)} ⊆ R2
+
By construction of the reachable set
Closed
Sz is closed
⇐
Convex
Sz is convex
X
Upward closed
Sz + R2
+ = Sz
X†
Table 3: Summary of properties defined within [13, 20, 28] and the relation to the axioms provided herein.
X: Equivalence of axioms.
⇒: The property from the external paper implies our axiom.
⇐: The collection of our axioms imply the property from the external paper.
∗: Convexity (uAA,uBB < 0, uAB > 0) implies (SC) if positive derivatives (uA,uB > 0) is also assumed.
†: Upward closed (Sz + R2
+ = Sz) is equivalent to nondecreasing without requiring the strict monotonicity.
28