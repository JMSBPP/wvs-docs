---
sha256: f5daec834603a1c72fc610355eebabd674fea93b587bd6c11a1a7042db60953f
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 65909
---
Constant Function Market Makers:
Multi-asset Trades via Convex
Optimization
Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra,
and Stephen Boyd
Abstract The rise of Ethereum and other blockchains that support smart contracts
has led to the creation of decentralized exchanges (DEXs), such as Uniswap, Bal-
ancer,Curve,mStable,andSushiSwap,whichenableagentstotradecryptocurrencies
without trusting a centralized authority. While traditional exchanges use order books
to match and execute trades, DEXs are typically organized as constant function
market makers (CFMMs). CFMMs accept and reject proposed trades based on the
evaluation of a function that depends on the proposed trade and the current reserves
of the DEX. For trades that involve only two assets, CFMMs are easy to understand,
via two functions that give the quantity of one asset that must be tendered to receive
a given quantity of the other, and vice versa. When more than two assets are being
exchanged, it is harder to understand the landscape of possible trades. We observe
that various problems of choosing a multi-asset trade can be formulated as convex
optimization problems and can therefore be reliably and efficiently solved.
## 1 Introduction
In the past few years, several new financial exchanges have been implemented
on blockchains, which are distributed and permissionless ledgers replicated across
networks of computers. These decentralized exchanges (DEXs) enable agents to
G. Angeris (B) · A. Agrawal · S. Boyd
Stanford University, Stanford, USA
e-mail: angeris@stanford.edu
A. Agrawal
e-mail: akshayka@stanford.edu
S. Boyd
e-mail: boyd@stanford.edu
A. Evans
Bain Capital Crypto, Charlotte, USA
T. Chitra
Gauntlet Networks, New York, USA
e-mail: tarun@gauntlet.network
© The Author(s), under exclusive license to Springer Nature Switzerland AG 2022
D. A. Tran et al. (eds.), Handbook on Blockchain, Springer Optimization
and Its Applications 194, https://doi.org/10.1007/978-3-031-07535-3_13
415416 G. Angeris et al.
trade cryptocurrencies, i.e., digital currencies with account balances stored on a
blockchain, without relying on a trusted third party to facilitate the exchange.
DEXs have significant capital flowing through them; the four largest DEXs on
the Ethereum blockchain (Curve Finance [Ego19], Uniswap [ZCP18, AZS+21],
SushiSwap [Sus20], and Balancer [MM19]) have a collective trading volume of
several billion dollars per day.
Unlike traditional exchanges, DEXs typically do not use order books. Instead,
most DEXs (including Curve, Uniswap, SushiSwap, and Balancer) are organized
as constant function market makers (CFMMs). A CFMM holds reserves of assets
(cryptocurrencies), contributed by liquidity providers. Agents can offer or tender
baskets of assets to the CFMM, in exchange for another basket of assets. If the trade
is accepted, the tendered basket is added to the reserves, while the basket received
by the agent is subtracted from the reserves. Each accepted trade incurs a small fee,
which is distributed pro-rata among the liquidity providers.
CFMMs use a single rule that determines whether or not a proposed trade is
accepted. The rule is based on evaluating a trading function, which depends on the
proposed trade and the current reserves of the CFMM. A proposed trade is accepted
if the value of the trading function at the post-trade reserves (with a small correction
for the trading fee) equals the value at the current reserves, i.e., the function is held
constant. This condition is what gives CFMMs their name. One simple example of
a trading function is the product [Lu17, But17], implemented by Uniswap [ZCP18]
and SushiSwap [Sus20]; this CFMM accepts a trade only if it leaves the product of
the reserves unchanged. Several other functions can be used, such as the sum or the
geometric mean (which is used by Balancer [MM19]).
For trades involving just two assets, CFMMs are very simple to understand, via a
scalar function that relates how much of one asset is required to receive an amount
of the other, and vice versa. Thus the choice of a two-asset trade involves only one
scalar quantity: how much you propose to tender (or, equivalently, how much you
propose to receive).
For general trades, in which many assets may be simultaneously exchanged,
CFMMs are more difficult reason about. When multiple assets are tendered, there
can be many baskets that can be tendered to receive a specific basket of assets, and
vice versa, there are many choices of the received basket, given a fixed one that is
tendered. Thus the choice of a multi-asset trade is more complex than just specify-
ing an amount to tender or receive. In this case, the trader may wish to tender and
receive baskets that are most aligned with their preferences or utility (e.g., one that
maximizes their risk-adjusted return).
In all practical cases, including the ones mentioned above, the trading function
is concave [AC20]. In this paper, we make use of this fact to formulate various
multi-assettradingproblemsasconvexoptimizationproblems.Becauseconvexopti-
mization problems can be solved reliably and efficiently (in theory and in practice)
[BV04], we can solve the formulated trading problems exactly. This gives a prac-
tical solution to the problem of choosing among many possible multi-asset trades:
the trader articulates their objective and constraints, and a solution to this problem
determines the baskets of assets to be tendered and received.Constant Function Market Makers: Multi-asset Trades via Convex Optimization 417
Outline.WestartbysurveyingrelatedworkinSect.1.1.InSect.2,wegiveacomplete
description of CFMMs, describing how agents may trade with a CFMM, as well as
add or remove liquidity. In Sect.3, we study some basic properties of CFMMs,
many of which rely on the concavity of the trading function. In Sect.4 we examine
trades involving just two assets, and show how to understand them via two functions
that give the amount of asset received for a given quantity of the tendered asset.
Finally, in Sect.5, we formulate the general multi-asset trading problem as a convex
optimization problem and give some specific examples.
## 1.1 Background and Related Work
Blockchain. CFMMs are typically implemented on a blockchain: a decentralized,
permissionless, and public ledger. The blockchain stores accounts, represented by
cryptographic public keys, and associated balances of one or more cryptocurrencies.
A blockchain allows any two accounts to securely transact with each other without
the need for a trusted third party or central institution, using public-key cryptogra-
phy to verify their identities. Executing a transaction, which alters the state of the
blockchain, costs the issuer a fee, typically paid out to the individuals providing
computational power to the network. (This network fee depends on the amount of
computation a transaction requires and is paid in addition to the CFMM trading fee
mentioned above and described below.)
Blockchains are highly tamper resistant: they are replicated across a network of
computersandkeptinconsensusviasimpleprotocolsthatpreventinvalidtransactions
such as double-spending of a coin. The consensus protocol operates on the level of
blocks (bundles of transactions), which are verified by the network and chained
together to form the ledger. Because the ledger is public, anyone in the world can
view and verify all account balances and the entire record of transactions.
The idea of a blockchain originated with a pseudonymously authored whitepaper
that proposed Bitcoin, widely considered to be the first cryptocurrency [Nak08].
Cryptocurrencies. A cryptocurrency is a digital currency implemented on a
blockchain. Every blockchain has its own native cryptocurrency, which is used to
pay the network transaction fees (and can also be used as a standalone currency).
A given blockchain may have several other cryptocurrencies implemented on it.
These additional currencies are sometimes called tokens, to distinguish them from
the base currency. There are thousands of tokens in circulation today, across various
blockchains. Some, like the Uniswap token UNI, give holders rights over the gover-
nance of a protocol, while others, like USDC, are stablecoins, pegged to the market
value of some external or real-world currency or commodity.
Smartcontracts.Modernblockchains,suchasEthereum[But13, Woo14],Polkadot
[Woo16], and Solana [Yak18], allow anyone to deploy arbitrary stateful programs
called smart contracts. A contract’s public functions can be invoked by anyone,418 G. Angeris et al.
via a transaction sent through the network and addressed to the contract. (The term
‘smartcontract’ was coined inthe 1990s, torefertoaset ofpromises between agents
codified in a computer program [Sza95].) Because creators are free to compose
deployed contracts or remix them in their own applications, software ecosystems on
these blockchains have developed rapidly.
CFMMsareimplementedusingsmartcontracts,withfunctionsfortrading,adding
liquidity, and removing liquidity. Their implementations are usually simple. For
example, Uniswap v2 is implemented in just 200 lines of code. In addition to DEXs,
manyotherfinancialapplicationshavebeendeployedonblockchains,includinglend-
ing protocols (e.g., [aav21, com21]) and various derivatives (e.g., [uma21, dyd21]).
The collection of financial applications running on blockchains is known as decen-
tralized finance, or DeFi for short.
Exchange-traded funds. CFMMs have some similarities to exchange-traded funds
(ETFs). A CFMM’s liquidity providers are analogous to an ETF’s authorized par-
ticipants; adding liquidity to a CFMM is analogous to the creation of an ETF share,
and subsequently removing liquidity is analogous to redemption. But while the list
of authorized participants for an ETF is typically very small, anyone in the world
can provide liquidity to a CFMM or trade with it.
Comparison to order books. In an order book, trading a basket of multiple assets
for another basket of multiple assets requires multiple separate trades. Each of these
trades would entail the blockchain fee, increasing the total cost of trading to the
trader. In addition, multiple trades cannot be done at the same time with an order
book, exposing the trader to the risk that some of the trades go through while others
do not, or that some of the trades will execute at unfavorable prices. In a CFMM,
multiple asset baskets are exchanged in one trade, which either goes through as one
group trade, or not at all, so the trader is not exposed to the risk of partial execution.
Another advantage of CFMMs over order book exchanges is their efficiency of
storage,sincetheydonotneedtostoreandmaintainalimitorderbook,andtheircom-
putational efficiency, since they only need to evaluate the trading function. Because
users must pay for computation costs for each transaction, and these costs can often
be nonnegligible in some blockchains, exchanges implementing CFMMs can often
be much cheaper for users to interact with than those implementing order books.
Previouswork.Academicworkonautomatedmarketmakersbeganwiththestudyof
scoringruleswithinthestatisticsliterature,e.g.,[Win69].Scoringrulesfurnishprob-
abilitiesforbasketsofevents,whichcanbeviewedasassetsortokensinaprediction
market. The output probability from a scoring rule was first proposed as a pricing
mechanism for a binary option (such as a prediction market) in [Han03]. Unlike
CFMMs, these early automated market makers were shown to be computationally
complicated for users to interact with. For example, Chen [CFL+08] demonstrated
that computing optimal arbitrage portfolios in logarithmic scoring rules (the most
popular class of scoring rules) is #P-hard.
The first CFMM on Ethereum (the most commonly used blockchain for smart
contracts) was Uniswap [ZCP18, AZS+21]. The first formal analysis of UniswapConstant Function Market Makers: Multi-asset Trades via Convex Optimization 419
was first done in [AKC+20] and extended to general concave trading functions
in[AC20].Evans[Eva20]firstprovedthatconstantmeanmarketmakerscouldrepli-
cate a large set of portfolio value functions. The converse result was later proven,
providing a mechanism for constructing a trading function that replicates a given
portfolio value function [AEC21b]. Analyses of how fees [EAC21, TW20] and trad-
ing function curvature [AEC20, Aoy20, AI21] affect liquidity provider returns are
also common in the literature. Finally, we note that there exist investigations of pri-
vacy in CFMMs [AEC21a], suitability of liquidity provider shares as a collateral
asset [CAEK21], and the question of triangular arbitrage [WCDW21] in CFMMs.
## 1.2 Convex Analysis and Optimization
Convex analysis. A function f : D → R, with D ⊆ Rn
, is convex if D is a convex
set and
f (θx + (1 − θ)y) ≤ θ f (x) + (1 − θ) f (y),
for 0 ≤ θ ≤ 1 and all x, y ∈ D. It is common to extend a convex function to an
extended-valued function that maps Rn
to R ∪ {∞}, with f (x) = +∞ for x / ∈ D.
A function f is concave if − f is convex [BV04, Chap. 3].
When f is differentiable, an equivalent characterization of convexity is
f (z) ≥ f (x) + ∇ f (x)T
(z − x),
for all z,x ∈ D. A differentiable function f is concave if and only if for all z,x ∈ D
we have
f (z) ≤ f (x) + ∇ f (x)T
(z − x). (1)
The right-hand side of this inequality is the first-order Taylor approximation of the
function f at x, so this inequality states that for a concave function, the Taylor
approximation is a global upper bound on the function.
By adding (1) and the same inequality with x and z swapped, we obtain the
inequality
(∇ f (z) − ∇ f (x))T
(z − x) ≤ 0, (2)
valid for any concave f and z,x ∈ D. This inequality states that for a concave
function f , −∇ f is a monotone operator [RB16].
Convex optimization. A convex optimization problem has the form
minimize f0(x)
subject to fi(x) ≤ 0, i = 1,...,m
gi(x) = 0, i = 1,..., p,420 G. Angeris et al.
where x ∈ Rn
is the optimization variable, the objective function f0 : D → R and
inequality constraint functions fi : D → R are convex, and the equality constraint
functions gi : Rn
→ R are affine, i.e., have the form gi(x) = aT
i x + bi for some
ai ∈ Rn
and bi ∈ R. (We assume the domains of the objective and inequality func-
tions are the same for simplicity.) The goal is to find a solution of the problem,
which is a value of x that minimizes the objective function, among all x satisfying
the constraints fi(x) ≤ 0, i = 1,...,m, and gi(x) = 0, i = 1,..., p [BV04, Chap.
4]. In the sequel, we will refer to the problem of maximizing a concave function,
subject to convex inequality constraints and affine equality constraints, as a convex
optimization problem, since this problem is equivalent to minimizing − f0 subject to
the constraints.
Convex optimization problems are notable because they have many applications,
in a wide variety of fields, and because they can be solved reliably and efficiently
[BV04]. The list of applications of convex optimization is large and still growing. It
has applications in vehicle control [SB08, Bla16, LB14], finance [CT06, BBD+17],
dynamic energy management [MBBW19], resource allocation [ABN+21], machine
learning [FHT01, BPC+11], inverse design of physical systems [AVB21], circuit
design [HBL01, BKPH05], and many other fields.
In practice, once a problem is formulated as a convex optimization problem, we
can use off-the-shelf solvers (software implementations of numerical algorithms)
to obtain solutions. Several solvers, such as OSQP [SBG+20], SCS [OCPB16],
ECOS [DCB13], and COSMO [GCG19], are free and open source, while others,
like MOSEK [ApS19], are commercial. These solvers can handle problems with
thousands of variables in seconds or less, and millions of variables in minutes. Small
to medium-size problems can be solved extremely quickly using embedded solvers
[DCB13, SBG+20, WB10] or code generation tools [MB12, CPDB13, BSM+17].
For example, the aerospace and space transportation company SpaceX uses CVX-
GEN [MB12] to solve convex optimization problems in real-time when landing the
first stages of its rockets [Bla16].
Domain-specific languages for convex optimization. Convex optimization prob-
lems are often specified using domain-specific languages (DSLs) for convex opti-
mization, such as CVXPY [DB16, AVDB18] or JuMP [DHL17], which compile
high-leveldescriptionsofproblemsintolow-levelstandardformsrequiredbysolvers.
The DSL then invokes a solver and retrieves a solution on the user’s behalf. DSLs
vastly reduce the engineering effort required to get started with convex optimization,
and in many cases are fast enough to be used in production. Using such DSLs, the
convex optimization problems that we describe later can all be implemented in just
a few lines of code that very closely parallel the mathematical specification of the
problems.Constant Function Market Makers: Multi-asset Trades via Convex Optimization 421
## 2 Constant Function Market Makers
In this section, we describe how CFMMs work. We consider a DEX with n > 1
assets, labeled 1,...,n, that implements a CFMM. Asset n is our numeraire, the
asset we use to value and assign prices to the others.
2.1 CFMM State
Reserveorpool.TheDEXhassomereservesofavailableassets,givenbythevector
R ∈ Rn
+, where Ri is the quantity of asset i in the reserves.
Liquidity provider share weights. The DEX maintains a table of all the liquidity
providers, agents who have contributed assets to the reserves. The table includes
weights representing the fraction of the reserves each liquidity provider has a claim
to. We denote these weights as v1,...,vN, where N is the number of liquidity
providers.Theweightsarenonnegativeandsumtoone,i.e.,v ≥ 0,and
!N
i=1 vi = 1.
The weights vi and the number of liquidity providers N can change over time, with
addition of new liquidity providers, or the deletion from the table of any liquidity
provider whose weight is zero.
State of the CFMM. The reserves R and liquidity provider weights v constitute the
state of the DEX. The DEX state changes over time due to any of the three possible
transactions: a trade (or exchange), adding liquidity, or removing liquidity. These
transactions are described in Sects.2.2 and 2.6.
## 2.2 Proposed Trade
A proposed trade (or proposed exchange) is initiated by an agent or trader, who
proposes to trade or exchange one basket of assets for another. A proposed trade
specifies the tender basket, with quantities given by ! ∈ Rn
+, which is the basket of
assets the trader proposes to give (or tender) to the DEX, and the received basket,
the basket of assets the trader proposes to receive from the DEX in return, with
quantities given by " ∈ Rn
+. Here !i ("i) denotes the amount of asset i that the
trader proposes to tender to the DEX (receive from the DEX). In the sequel, we will
refer to the vectors that give the quantities, i.e., ! and ", as the tender and receive
baskets, respectively.
The proposed trade can either be rejected by the DEX, in which case its statedoes
not change, or accepted, in which case the basket ! is transferred from the trader
to the DEX, and the basket " is transferred from the DEX to the trader. The DEX
reserves are updated as
R+
= R + ! − ", (3)422 G. Angeris et al.
where R+
denotes the new reserves. A proposed trade is accepted or rejected based
on a simple condition described in Sect.2.3, which always ensures that R+
≥ 0.
Disjoint support of tender and receive baskets. Intuition suggests that a trade
would not include an asset in both the proposed tender and receive baskets, i.e., we
should not have !i and "i both positive. We will see later that while it is possi-
ble to include an asset in both baskets, it never makes sense to do so. This means
that ! and " can be assumed to have disjoint support, i.e., we have !i"i = 0 for
each i. This allows us to define two disjoint sets of assets associated with a proposed
or accepted trade:
T = {i | !i > 0}, R = {i | "i > 0}.
Thus T are the indices of assets the trader proposes to give to the DEX, in exchange
for the assets with indices in R. If j / ∈ T ∪ R, it means that the proposed trade does
not involve asset j, i.e., !j = "j = 0.
Two-asset and multi-asset trades. A very common type of proposed trade involves
only two assets, one that is tendered and one that is received, i.e., |T | = |R| = 1.
Suppose T = {i} and R = {j}, with i *= j. Then we have ! = δei and " = λej,
where ei denotes the ith unit vector, and λ ≥ 0 is the quantity of asset j the trader
wishes to receive in exchange for the quantity δ ≥ 0 of asset i. (This is referred to
as exchanging asset i for asset j.) When a trade involves more than two assets, it is
called a multi-asset trade. We will study two-asset and multi-asset trades in Sect.4
and Sect.5, respectively.
## 2.3 Trading Function
Trade acceptance depends on both the proposed trade and the current reserves. A
proposed trade (!,") is accepted only if
ϕ(R + γ! − ") = ϕ(R), (4)
where ϕ : Rn
+ → R is the trading function associated with the CFMM, and the
parameter γ ∈ (0,1] introduces a trading fee (when γ < 1). The “constant function”
in the name CFMM refers to the acceptance condition (4).
We can interpret the trade acceptance condition as follows. If γ = 1, a proposed
trade is accepted only if the quantity ϕ(R) does not change, i.e., ϕ(R+
) = ϕ(R).
When γ < 1 (with typical values being very close to one), the proposed trade is
accepted based on the devalued tendered basket γ!. The reserves, however, are
updated based on the full tendered basket ! as in (3).
Properties. We will assume that the trading function ϕ is concave, increasing, and
differentiable. Many existing CFMMs are associated with functions that satisfy the
additional property of homogeneity, i.e., ϕ(αR) = αϕ(R) for α > 0.Constant Function Market Makers: Multi-asset Trades via Convex Optimization 423
## 2.4 Trading Function Examples
We mention some trading functions that are used in existing CFMMs.
Linear and sum. The simplest trading function is linear,
ϕ(R) = pT
R = p1R1 + ··· + pn Rn,
with p > 0, where pi can be interpreted as the price of asset i. The trading
condition (4) simplifies to
γpT
! = pT
".
We interpret the right-hand side as the total value of received basket, at the prices
given by p, and the left-hand side as the value of the tendered basket, discounted by
the factor γ.
A CFMM with p = 1, i.e., all asset prices equal to one, is called a constant sum
market maker. The CFMM mStable, which held assets that were each pegged to the
same currency, was one of the earliest constant sum market makers.
Geometric mean. Another choice of trading function is the (weighted) geometric
mean,
ϕ(R) =
n "
i=1
Rwi
i ,
where total w > 0 and 1T
w = 1. Like the linear and sum trading functions, the
geometric mean is homogeneous.
CFMMsthatusethegeometricmeanarecalledconstantmeanmarketmakers.The
CFMMsBalancer[MM19],Uniswap[ZCP18],andSushiSwap[Sus20]areexamples
of constant mean market makers. (Uniswap and SushiSwap use weights wi = 1/n,
and are sometimes called constant product market makers [AKC+20, AC20].)
Otherexamples.Anotherexamplecombinesthesumandgeometricmeanfunctions,
ϕ(R) = (1 − α)1T
R + α
n "
i=1
Rwi
i ,
where α ∈ [0,1] is a parameter, w ≥ 0, and 1T
w = 1. This trading function yields a
CFMMthatinterpolatesbetweenaconstantsummarket(whenα = 0)andaconstant
geometric mean market (when α = 1). Because it is a convex combination of the
sumandgeometricmeanfunctions,whicharethemselveshomogeneous,theresulting
function is also homogeneous.
The CFMM known as Curve [Ego19] uses the closely related trading function
ϕ(R) = 1T
R − α
n "
i=1
R−1
i ,424 G. Angeris et al.
where α > 0. Unlike the previous examples, this trading function is not homoge-
neous.
## 2.5 Prices and Exchange Rates
In this section, we introduce the concept of asset (reported) prices, based on a first-
order approximation of the trade acceptance condition (4). These prices inform how
liquidity can be added and removed from the CFMM, as we will see in Sect.2.6.
Unscaled prices. We denote the gradient of the trading function as P = ∇ϕ(R). We
refer to P, which has positive entries since ϕ is increasing, as the vector of unscaled
prices,
Pi = ∇ϕ(R)i =
∂ϕ
∂Ri
(R), i = 1,...,n. (5)
Toseewhythesenumberscanbeinterpretedasprices,weapproximatetheexchange
acceptance condition (4) using its first-order Taylor approximation to get
0 = ϕ(R + γ! − ") − ϕ(R) ≈ ∇ϕ(R)T
(γ! − ") = PT
(γ! − "),
when γ! − " is small, relative to R. We can express this approximation as
γ
#
i∈T
Pi!i ≈
#
i∈R
Pi"i. (6)
The right-hand side is the value of the received basket using the unscaled prices Pi.
The left-hand side is the value of the tendered basket using the unscaled prices Pi,
discounted by the factor γ.
Prices. The condition (6) is homogeneous in the prices, i.e., it is the same condition
if we scale all prices by any positive constant. The reported prices (or just prices) of
the assets are the prices relative to the price of the numeraire, which is asset n. The
prices are
pi =
Pi
Pn
, i = 1,...,n.
(Thepriceofthenumeraireisalways1.)Ingeneral,thepricesdependonthereserves
R. (The one exception is with a linear trading function, in which the prices are
constant.) In terms of prices, the condition (6) is
γ
#
i∈T
pi!i ≈
#
i∈R
pi"i. (7)Constant Function Market Makers: Multi-asset Trades via Convex Optimization 425
We observe for future use that the prices for two values of the reserves R and R̃
are the same if and only if
∇ϕ(R̃) = α∇ϕ(R), (8)
for some α > 0.
Geometric mean trading function prices. For the special case ϕ(R) =
$n
i=1 Rwi
i ,
with wi > 0 and
!n
i=1 wi = 1, the unscaled prices are
P = ∇ϕ(R) = ϕ(R)(w1R−1
1 ,w2R−1
2 ,...,wn R−1
n ),
and the prices are
pi =
wi Rn
wn Ri
, i = 1,...,n. (9)
Exchange rates. In a two-asset trade with ! = δei and " = λej, i.e., we are
exchanging asset i for asset j, the exchange rate is
Eij = γ
∇ϕ(R)i
∇ϕ(R)j
= γ
Pi
Pj
= γ
pi
pj
.
This is approximately how much asset j you get for each unit of asset i, for a small
trade. Note that Eij Eji = γ2
< 1, when γ < 1, i.e., round-trip trades lose value.
These are first-order approximations. We remind the reader that the various con-
ditions described above are based on a first-order Taylor approximation of the trade
acceptance condition. A proposed trade that satisfies (7) is not (quite) valid; it is
merely close to valid when the proposed trade baskets are small compared to the
reserves. This is similar to the midpoint price (average of bid and ask prices) in an
order book; you cannot trade in either direction exactly at this price.
Reserve value. The value of the reserves (using the prices p) is given by
V = pT
R =
∇ϕ(R)T
R
∇ϕ(R)n
. (10)
When ϕ is homogeneous we can use the identity ∇ϕ(R)T
R = ϕ(R) to express the
reserves value as
V = pT
R =
ϕ(R)
∇ϕ(R)n
. (11)
## 2.6 Adding and Removing Liquidity
In this section, we describe how agents called liquidity providers can add or remove
liquidityfromthereserves.Whenanagentaddsliquidity,sheaddsabasket# ∈ Rn
+ to426 G. Angeris et al.
thereserves,resultingintheupdatedreserves R+
= R + #.Whenanagentremoves
liquidity, she removes a basket # ∈ Rn
+ from the reserves, resulting in the updated
reserves R+
= R − #. (We will see below that the condition for removing liquid-
ity ensures that R+
≥ 0.) Adding or removing liquidity also updates the liquidity
provider share weights, as described below.
Liquidity change condition. Adding or removing liquidity must be done in a way
that preserves the asset prices. Using (8), this means we must have
∇ϕ(R+
) = α∇ϕ(R), (12)
forsome α > 0.(Wewillseelater that α > 1 corresponds to removing liquidity, and
α < 1 corresponds to adding liquidity.) This liquidity change condition is analogous
to the trade exchange condition (4). We refer to # as a valid liquidity change if this
condition holds.
The liquidity change condition (12) simplifies in some cases. For example, with
a linear trading function the prices are constant, so any basket can be used to add
liquidity, and any basket with # ≤ R can be removed. (The constraint comes from
the requirement R+
≥ 0, the domain of ϕ.)
Liquidity change condition for homogeneous trading function. Another simpli-
fication occurs when the trading function is homogeneous. For this case, we have,
for any α > 0,
∇ϕ(αR) = ∇ϕ(R),
(by taking the gradient of ϕ(αR) = αϕ(R) with respect to R). This means that # =
νR, for ν > 0, is a valid liquidity change (provided ν ≤ 1 for liquidity removal). In
words: you can add or remove liquidity by adding or removing a basket proportional
to the current reserves.
Liquidity provider share update. Let V = pT
R denote the value of the reserves
before the liquidity change, and V+
= (p+
)T
R+
= pT
R+
the value after. The
change in reserve value is V+
− V = pT
# when adding liquidity, and V+
− V =
−pT
# when removing liquidity. Equivalently, pT
# is the value of the basket a liq-
uidity provider gives, when adding liquidity, or receives when removing liquidity.
The fractional change in reserve value is (V+
− V)/V+
.
When liquidity provider j adds or removes liquidity, all the share weights are
adjusted pro-rata based on the change of value of the reserves, which is the value of
the basket she adds or removes. The weights are adjusted to
v+
i =
%
vi V/V+
+ (V+
− V)/V+
i = j
vi V/V+
i *= j.
(13)Constant Function Market Makers: Multi-asset Trades via Convex Optimization 427
Thus the weight of liquidity provider j is increased (decreased) by the fractional
change in reserve value when she adds (removes) liquidity. These new weights are
also nonnegative and sum to one.
When ϕ is homogeneous and we add liquidity with the basket # = νR, with
ν > 0, we have V+ = (1 + ν)pT
R, so
V/V+
= 1/(1 + ν), (V+
− V)/V+
= ν/(1 + ν).
The weight updates for adding liquidity # = νR are then
v+
i =
%
(vi + ν)/(1 + ν) i = j
vi/(1 + ν) i *= j.
Forremovingliquiditywiththebasket# = νR,wereplaceν with−ν intheformulas
above, along with the constraint ν ≤ vj.
## 2.7 Agents Interacting with CFMMs
Agents seeking to trade or add or remove liquidity make proposals. These proposals
areacceptedornot,dependingontheacceptanceconditionsgivenabove.Aproposal
canberejectedifanotheragent’sproposedactionisaccepted(processed)beforetheir
proposed action, thus changing R and invalidating the acceptance condition.
Slippagethresholds.Onepracticalandcommonapproachtomitigatingthisproblem
during trading is to allow agents to set a slippage threshold on the received basket.
This slippage threshold, represented as some percentage 0 ≤ η ≤ 1, is simply a
parameter that specifies how much slippage the agent is willing to tolerate without
their trade failing. In this case, the agent presents some trade (!,") along with a
threshold η, and the contract accepts the trade if there is some number α satisfying
η ≤ α such that the trade (!,α") can be accepted. In other words, the agent allows
the contract to devalue the output basket by at most a factor of η. If no such value of
α exists, the trade fails.
Maximalliquidityamounts.Whilesettingslippagethresholdscanhelpwithreduc-
ing the risk of trades failing, another possible failure mode can occur during the
addition of liquidity. A simple solution to this problem is that the liquidity provider
specifies some basket # to the CFMM contract, and the contract accepts the largest
possible basket #−
such that #−
≤ #, returning the remaining amount, # − #−
,
to the liquidity provider. In other words, # can be seen as the maximal amount of
liquidity a user is willing to provide.428 G. Angeris et al.
## 3 Properties
In this section, we present some basic properties of CFMMs.
## 3.1 Properties of Trades
Non-uniqueness. If we replace the trading function ϕ with ϕ̃ = h ◦ ϕ, where h is
concave, increasing, and differentiable, we obtain another concave increasing differ-
entiable function. The associated CFMM has the same trade acceptance condition,
thesameprices,thesameliquiditychangecondition,andthesameliquidityprovider
share updates as the original CFMM.
Maximumvalidreceivebasket.Anyvalidtradesatisfiesϕ(R + γ! − ") = ϕ(R),
so in particular R + γ! − " ≥ 0. Since we assume ! and " have non-overlapping
support, it follows that
" ≤ R.
A valid trade cannot ask to receive more than is in the reserves.
Non-overlapping support for valid tender and receive baskets. Here we show
why a valid proposed trade with !k > 0 and "k > 0 for some k does not make
sense when γ < 1, justifying our assumption that this never happens. Let ( ˜ !, ˜ ") be
a proposed trade that coincides with (!,") except in the kth components, which we
set to
˜ !k = !k − τ/γ, ˜ "k = "k − τ,
where τ = min{γ!k,"k} > 0. Evidently ˜ ! ≥ 0, ˜ " ≥ 0, and
R + γ! − " = R + γ ˜ ! − ˜ ",
so the proposed trade ( ˜ !, ˜ ") is also valid. If the trader proposes this trade instead of
(!,"), the net change in her assets is
˜ " − ˜ ! = " − ! +
&
1
γ
− 1
'
τek.
The last vector on the right is zero in all entries except k, and positive in that entry.
Thus the valid proposed trade ( ˜ !, ˜ ") has the same net effect as the trade (!,"),
exceptthatthetraderendsupwithapositiveamountmoreofthekthasset.Assuming
the kth asset has value, we would always prefer this.
Trades increase the function value. For an accepted nonzero trade, we have
ϕ(R+
) = ϕ(R + ! − ") > ϕ(R + γ! − ") = ϕ(R),Constant Function Market Makers: Multi-asset Trades via Convex Optimization 429
since ϕ is increasing and R + ! − " ≥ R + γ! − ", with at least one entry being
strictly greater, whenever γ < 1.
We can derive a stronger inequality using concavity of ϕ, which implies that
ϕ(R + γ! − ") ≤ ϕ(R + ! − ") + (γ − 1)∇ϕ(R + ! − ")T
!.
This can be rearranged as
ϕ(R+
) ≥ ϕ(R) + (1 − γ)(P+
)T
!,
where P+
= ∇ϕ(R+
) are the unscaled prices at the reserves R+
. This tells us the
function value increases at least by (1 − γ) times the value of tendered basket at the
unscaled prices.
Trading cost is positive. Suppose (!,") is a valid trade. The net change in the
trader’s holdings is " − !. We can interpret δ = pT
(! − ") as the decrease in
value of the trader’s holdings due to the proposed trade, evaluated at the current
prices.We can interpretδ asatrading cost,evaluated at thepre-tradeprices, and now
show it is positive.
Since ϕ is concave, we have
ϕ(R + γ! − ") ≤ ϕ(R) + ∇ϕ(R)T
(γ! − ").
Using ϕ(R + γ! − ") = ϕ(R), this implies
0 ≤ ∇ϕ(R)T
(γ! − ") = PT
(γ! − ").
From this we obtain
PT
(! − ") = PT
(γ! − ") + (1 − γ)PT
! ≥ (1 − γ)PT
!.
Dividing by Pn gives
δ ≥ (1 − γ)pT
!.
Thus the trading cost is always at least a factor (1 − γ) of pT
!, the total value of
the tendered basket.
The trading cost δ is also the increase in the total reserve value, at the current
prices. So we can say that each trade increases the total reserve value, at the current
prices, by at least (1 − γ) times the value of the tendered basket.430 G. Angeris et al.
## 3.2 Properties of Liquidity Changes
Liquidity change condition interpretation. One natural interpretation of the liq-
uidity change condition (12) is in terms of a simple optimization problem. We seek
a basket # that maximizes the post-change trading function value subject to a given
total value of the basket at the current prices,
maximize ϕ(R+
)
subject to pT
(R+
− R) ≤ M.
(14)
Here the optimization variable is R+
∈ Rn
+, and M is the desired value of the basket
# at the current prices, for adding liquidity, or its negative, for removing liquidity.
The optimality conditions for this convex optimization problem are
pT
(R+
− R) ≤ M, ∇ϕ(R+
) − νp = 0,
where ν ≥ 0 is a Lagrange multiplier. Using p = ∇ϕ(R)/∇ϕ(R)n, the second con-
dition is
∇ϕ(R+
) =
ν
∇ϕ(R)n
∇ϕ(R),
which is (12) with α = ν/∇ϕ(R)n. We can easily recover the trading basket # from
R+
since # = R+
− R.
Liquidity provision problem. When the trading function is homogeneous, it is easy
to understand what baskets can be used to add or remove liquidity: they must be
proportional to the current reserves. In other cases, it can be difficult to find an R+
thatsatisfies(12).Inthegeneralcase,however,theconvexoptimizationproblem(14)
canbesolvedtofindthebasket# thatgivesavalidliquiditychange,with M denoting
the total value of the added basket (when M > 0) or removed basket (when M < 0).
Liquidity change and the gradient scale factor α. Suppose that we add or remove
liquidity. Since ϕ is concave (2) tells us that
(∇ϕ(R+
) − ∇ϕ(R))T
(R+
− R) ≤ 0.
Using ∇ϕ(R+
) = α∇ϕ(R), this becomes
(α − 1)∇ϕ(R)T
(R+
− R) ≤ 0.
We have ∇ϕ(R) > 0. If we add liquidity, we have R+
− R ≥ 0 and R+
− R *= 0,
so ∇ϕ(R)T
(R+
− R) > 0. From the inequality above we conclude thatα < 1. Ifwe
remove liquidity, a similar arguments tells us that α > 1.Constant Function Market Makers: Multi-asset Trades via Convex Optimization 431
## 4 Two-Asset Trades
Two-asset trades, sometimes called swaps, are some of the most common types of
tradesperformedonDEXs.Inthissection,weshowanumberofinterestingproperties
of trades in this common special case.
## 4.1 Exchange Functions
Suppose we exchange asset i for asset j, so ! = δei and " = λej, with δ ≥ 0,
λ ≥ 0. The trade acceptance condition (4) is
ϕ(R + γδei − λej) = ϕ(R). (15)
The left-hand side is increasing in δ and decreasing in λ, so for each value of δ there
is at most one valid value of λ, and for each value of λ, there is at most one valid
value of δ. In other words, the relation (15) between λ and γ defines a one-to-one
function. This means that two-asset trades are characterized by a single parameter,
either δ (how much is tendered) or λ (how much is received).
Forward exchange function. Define F : R+ → R, where F(δ) is the unique λ that
satisfies (15). The function F is called the forward exchange function, since F(δ)
is how much of asset j you get if you exchange δ of asset i. The forward exchange
function F is increasing since ϕ is componentwise increasing and nonnegative since
F(0) = 0. We will now show that the function F is concave.
Concavity. Using the implicit function theorem on (15) with λ = F(δ), we obtain
F-
(δ) = γ
∇ϕ(R-
)i
∇ϕ(R-)j
, (16)
where we use R-
= R + γδei − F(δ)ej to simplify notation. To show that F is
concave,wewillshowthat,foranynonnegativetradeamountsδ,δ-
≥ 0,thefunction
F satisfies
F(δ-
) ≤ F-
(δ)(δ-
− δ) + F(δ), (17)
which establishes that F is concave.
Wewrite R--
= R + γδ-
ei − F(δ-
)ej,andnotethatϕ(R) = ϕ(R-
) = ϕ(R--
)from
the definition of F. Since ϕ is concave it satisfies
ϕ(R--
) ≤ ∇ϕ(R-
)T
(R--
− R-
) + ϕ(R-
),
so ∇ϕ(R-
)T
(R--
− R-
) ≥ 0. Using the definitions of R--
and R-
, we have
0 ≤ γ(δ-
− δ)∇ϕ(R-
)i − (F(δ-
) − F(δ))∇ϕ(R-
)j.432 G. Angeris et al.
Dividing by ∇ϕ(R-
)j and using (16), we obtain (17).
Reverse exchange function. Define G : R+ → R ∪ {∞}, where G(λ) is the unique
δ that satisfies (15), or G(λ) = ∞ is there is no such δ. The function G is called the
reverse exchange function, since G(λ) is how much of asset i you must exchange,
to receive λ of asset j. In a similar way to the forward trade function, the reverse
exchange function is nonnegative and increasing, but this function is convex rather
than concave. (This follows from a nearly identical proof.)
Forward and reverse exchange functions are inverses. The forward and reverse
exchange functions are inverses of each other, i.e., they satisfy
G(F(δ)) = δ, F(G(λ)) = λ,
when both functions are finite.
Analogousfunctionsforalimitorderbookmarket.Thereareanalogousfunctions
in a market that uses a limit order book. They are piecewise linear, where the slopes
are the different prices of each order, while the distance between the kink points is
equal to the size of each order. The associated functions have the same properties,
i.e., they are increasing, inverses of each other, F is concave, and G is convex.
Evaluating F and G. In some important special cases, we can express the functions
F andG inaclosedform.Forexample,whenthetradingfunctionisthesumfunction,
they are
F(δ) = min{γδ, Rj}, G(λ) =
%
λ/γ λ/γ ≤ Rj
+∞ otherwise.
When the trading function is the geometric mean, the functions are
F(δ) = Rj
(
1 −
R
wi/wj
i
(Ri + γδ)wi/wj
)
, G(λ) =
Ri
γ
(
R
wj/wi
j
(Rj − λ)wj/wi
− 1
)
,
whenever λ < Rj, and G(λ) = ∞ otherwise.
On the other hand, when the forward and reverse trading functions F and G can-
not be expressed analytically, we can use several methods to evaluate them numer-
ically [PTFV92, Sect.9]. To evaluate F(δ), we fix δ and solve for λ in (15). The
left-hand side is a decreasing function of λ, so we can use simple bisection to solve
this nonlinear equation. Newton’s method can be used to achieve higher accuracy
with fewer steps. Exploiting the concavity of ϕ, it can be shown an undamped New-
ton iteration always converges to the solution. With superscripts denoting iteration,
this is
λk+1
= λk
+
ϕ(R + γδei − λk
ej) − ϕ(R)
∇ϕ(R + γδei − λkej)j
,Constant Function Market Makers: Multi-asset Trades via Convex Optimization 433
0.0 0.5 1.0 1.5 2.0 2.5 3.0
δ
0
5
10
15
20
25
30 λ
R = (1,100)
R = (.1,10)
0.0 0.5 1.0 1.5 2.0 2.5 3.0
λ
0.00
0.05
0.10
0.15
0.20
0.25
0.30
δ
R = (1,100)
R = (.1,10)
Fig. 1 Left. Forward exchange functions for two values of the reserves. Right. Reverse exchange
functions for the same two values of the reserves
with starting point based on the exchange rate,
λ0
= δEij = δ
γpi
pj
.
(It can be shown that the convergence is monotone decreasing.) We note that one of
thelargest CFMMs, Curve, uses atrading function that isnot homogeneous and uses
this method in production [Ego19].
Slope at zero. Using (16), we see that F-
(0+
) = Eij, i.e., the one-sided derivative
at 0 is exactly the exchange rate for assets i and j. Since F is concave, we have
F(δ) ≤ F-
(0+
)δ = Eijδ. (18)
This tells us that the amount of asset j you will receive for trading δ of asset i is no
more than the amount predicted by the exchange rate.
Theone-sidedderivativeofthereverseexchangefunction G at0isG-
(0+
) = Eji.
The analog of the inequality (18) is
G(λ) ≥ G-
(0+
)λ = γ−2
Ejiλ, (19)
which states that the amount of asset i you need to tender to receive an amount of
asset j is at least the amount predicted by the exchange rate.
Examples.Figure1showstheforwardandreverseexchangefunctionsforaconstant
geometric mean market with two assets and weights w1 = 0.2 and w2 = 0.8, and
γ = 0.997. We show the functions for two values of the reserves: R = (1,100) and
R = (0.1,10). The exchange rate is the same for both values of the reserves and
equal to E12 = γw1R2/w2R1 = 25.434 G. Angeris et al.
## 4.2 Exchanging Multiples of Two Baskets
Here we discuss a simple generalization of two-asset trade, in which we tender and
receive a multiple of fixed baskets. Thus, we have ! = δ ˜ ! and " = λ ˜ ", where
λ ≥ 0 and δ ≥ 0 scale the fixed baskets ˜ ! and ˜ ". When ˜ ! = ei and ˜ " = ej, this
reduces to the two-asset trade discussed above.
The same analysis holds in this case as in the simple two-asset trade. We can
introducetheforwardandreversefunctions F andG,whichareinversesofeachother.
They are increasing, F is concave, G is convex, and they satisfy F(0) = G(0) = 0.
We have the inequality
F(δ) ≤ Eδ,
where E is the exchange rate for exchanging the basket ˜ ! for the basket ˜ ",
given by
E = γ
∇ϕ(R)T ˜ !
∇ϕ(R)T ˜ "
.
There is also an inequality analogous to (19), using this definition of the exchange
rate. We mention two specific important examples in what follows.
Liquidating assets. Let ! ∈ Rn
+ denote a basket of assets we wish to liquidate, i.e.,
exchange for the numeraire. We can assume that!n = 0. We then find the α > 0 for
which (!,αen) is a valid trade, i.e.,
ϕ(R + γ! − αen) = ϕ(R). (20)
We can interpret α as the liquidation value of the basket !. We can also show that
the liquidation value is at most as large as the discounted value of the basket; i.e.,
α ≤ γpT
!.
To see this, apply (1) to the left-hand side of (20), which gives, after canceling
ϕ(R) on both sides,
∇ϕ(R)T
(γ! − αen) ≥ 0.
Rearranging, we find:
α ≤
γ∇ϕ(R)T
!
∇ϕ(R)n
= γpT
!.
Purchasing a basket. Let " ∈ Rn
+ denote a basket we wish to purchase using the
numeraire. We find α > 0 for which (αen,") is a valid trade, i.e.,
ϕ(R + γαen − ") = ϕ(R).Constant Function Market Makers: Multi-asset Trades via Convex Optimization 435
We interpret α as the purchase cost of the basket ". It can be shown that α ≥
(1/γ)pT
", i.e., the purchase cost is at least a factor 1/γ more than the value of the
basket, at the current prices. This follows from a nearly identical argument to that of
the liquidation value.
## 5 Multi-asset Trades
We have seen that two-asset trades are easy to understand; we choose the amount
we wish to tender (or receive), and we can then find the amount we will receive (or
tender).Multi-assettradesaremorecomplex,becauseevenforafixedreceivebasket
", there are many tender baskets that are valid, and we face the question of which
one should we use. The same is true when we fix the tendered basket !: there are
many baskets " we could receive, and we need to choose one. More generally, we
have the question of how to choose the proposed trade (!,"). In the two-asset case,
the choice is parameterized by a scalar, either δ or λ. In the multi-asset case, there
are more degrees of freedom.
Example. We consider an example with n = 4, geometric mean trading function
with weights wi = 1/4 and fee γ = 0.997, with reserves R = (4,5,6,7). We fix
the received basket to be " = (2,4,0,0). There are many valid tendered baskets,
which are shown in Fig.2. The plot shows valid values of (!3,!4), since the first
two components of ! are zero.
0 20 40 60 80 100
∆3
0
10
20
30
40
50
60
∆ 4
Fig. 2 Valid tendered baskets (!3,!4) for the received basket " = (2,4,0,0)436 G. Angeris et al.
## 5.1 The General Trade Choice Problem
We formulate the problem of choosing (!,") as an optimization problem. The net
changeinholdingsofthetraderis" − !.Thetraderjudgesanetchangeinholdings
usingautilityfunctionU : Rn
→ R ∪ {−∞},wheresheprefers(!,")to( ˜ !, ˜ ")if
U(" − !) > U( ˜ " − ˜ !).Thevalue−∞isusedtoindicatethatachangeinholdings
isunacceptable.WewillassumethatU isincreasingandconcave.(Increasingmeans
that the trader would always prefer to have a larger net change than a smaller one,
which comes from our assumption that all assets have value.)
To choose a valid trade that maximizes utility, we solve the problem
maximize U(" − !)
subject to ϕ(R + γ! − ") = ϕ(R), ! ≥ 0, " ≥ 0,
(21)
with variables ! and ". Unfortunately, the constraint ϕ(R + γ! − ") = ϕ(R) is
not convex (unless the trading function is linear), so this problem is not in general
convex.
Instead we will solve its convex relaxation, where we change the equality con-
straint to an inequality to obtain the convex problem
maximize U(" − !)
subject to ϕ(R + γ! − ") ≥ ϕ(R), ! ≥ 0, " ≥ 0,
(22)
which is readily solved. It is easy to show that any solution of (22) satisfies ϕ(R +
γ! − ") = ϕ(R)andsoisalsoasolutionoftheproblem (21).(Ifasolutionsatisfies
ϕ(R + γ! − ") > ϕ(R), we can decrease ! or increase " a bit, so as to remain
feasible and increase the objective, a contradiction.)
Thus we can (globally and efficiently) solve the non-convex problem (21) by
solving the convex problem (22).
No-trade condition. Assuming U(0) > −∞, the solution to the problem (22) can
be ! = " = 0, which means that trading does not increase the trader’s utility, i.e.,
the trader should not propose any trade. We can give simple conditions under which
this happens for the case when U is differentiable. They are
γp ≤ α∇U(0) ≤ p, (23)
for some α > 0. We can interpret the set of prices p for which this is true, i.e.,
K = {p ∈ Rn
+ | γp ≤ α∇U(0) ≤ p for some α > 0},
as the no-trade cone for the utility function U. (It is easy to see that K is a convex
polyhedral cone.)Constant Function Market Makers: Multi-asset Trades via Convex Optimization 437
We interpret ∇U(0) as the vector of marginal utilities to the trader, and p as the
prices of the assets in the CFMM. For γ = 1, the condition says that we do not trade
when the marginal utility is a positive multiple of the current asset prices; if this does
not hold, then the solution of the trading problem (22) is nonzero, i.e., the trader
should trade to increase her utility. When γ < 1, the trader will not trade when the
prices are in K.
To derive condition (23), we first derive the optimality conditions for the problem
(22). We introduce the Lagrangian
L(!,",λ,ω,κ) = U(" − !) + λ(ϕ(R + γ! − ") − ϕ(R)) + ωT
! + κT
",
where λ ∈ R+, ω ∈ Rn
+, and κ ∈ Rn
+ are dual variables or Lagrange multipliers for
the constraints. The optimality conditions for (22) are feasibility, along with
∇!L = 0, ∇"L = 0.
The choice ! = 0, " = 0 is feasible and satisfies this condition if
∇!L(0,0,λ,ω,κ) = 0, ∇"L(0,0,λ,ω,κ) = 0.
These are
−∇U(0) + λγ∇ϕ(R) + ω = 0, ∇U(0) − λ∇ϕ(R) + κ = 0,
which we can write as
∇U(0) ≥ λγ∇ϕ(R), ∇U(0) ≤ λ∇ϕ(R).
Dividing these by λPn, we obtain (23), with α = 1/(λPn).
## 5.2 Special Cases
Linear utility. When U(z) = πT
z, with π ≥ 0, we can interpret π as the trader’s
private prices of the assets, i.e., the prices she values the assets at. From (23), we see
that the trader will not trade if her private asset prices satisfy
γp ≤ απ ≤ p (24)
for some α > 0.438 G. Angeris et al.
In the special case where π satisfies
(π2,...,πn) = λ(p2,..., pn),
for λ ≥ 0, i.e., π is collinear with p except in the first entry, (24) is satisfied if and
only if
λγp1 ≤ π1 ≤ λγ−1
p1.
If λ = 1, then this simplifies to the condition
γp1 ≤ π1 ≤ γ−1
p1.
(This will arise in an example we present below.)
Markowitz trading. Suppose the trader models the returnr ∈ Rn
on the assets over
some period of time as a random vector with mean Er = µ ∈ Rn
and covariance
matrix E(r − µ)(r − µ)T
= $ ∈ Rn×n
. If the trader holds a portfolio of assets z ∈
Rn
+, the return is rT
z; the expected portfolio return is µT
z and the variance of the
portfolioreturniszT
$z.InMarkowitztrading,thetradermaximizestherisk-adjusted
return,definedasµT
z − κzT
$z,whereκ > 0istherisk-aversionparameter [Mar52,
BBD+17]. This leads to the Markowitz trading problem
maximize µT
z − κzT
$z
subject to z = zcurr
− ! + "
ϕ(R + γ! − ") ≥ ϕ(R)
! ≥ 0, " ≥ 0,
(25)
with variables z, !, ", where zcurr
is the trader’s current holdings of assets. This is
the general problem (22) with concave utility function
U(Z) = µT
(zcurr
+ Z) − κ(zcurr
+ Z)T
$(zcurr
+ Z).
A well-known limitation of the Markowitz quadratic utility function U, i.e., the
risk-adjusted return, is that it is not increasing for all Z, which implies that the
trading function relaxation need not be tight. However, for any sensible choice of
the parameters µ and $, it is increasing for the values of Z found by solving the
Markowitzproblem(25),andtherelaxationistight.Asapracticalmatter,ifasolution
of (25) does not satisfy the trading constraint, then the parameters are inappropriate.
Expected utility trading. Here the trader models the returns r ∈ Rm
on the assets
over some time interval as random, with some known distribution. The trader seeks
to maximize the expected utility of the portfolio return, using a concave increasing
utility function ψ : R → R to introduce risk aversion. (Thus we use the term utility
function to refer to both the trading utility function U : Rn
+ → R and the portfolioConstant Function Market Makers: Multi-asset Trades via Convex Optimization 439
return utility function ψ : R → R, but the context should make it clear which is
meant.) This leads to the problem
maximize Eψ(rT
z)
subject to z = zcurr
− ! + "
ϕ(R + γ! − ") ≥ ϕ(R)
! ≥ 0, " ≥ 0,
(26)
where the expectation is over r. This is the general problem (22), with utility
U(Z) = Eψ(rT
(zcurr
+ Z)),
which is concave and increasing.
This problem can be solved using several methods. One simple approach is to
replace the expectation with an empirical or sample average over some Monte Carlo
samplesofr,whichleadstoanapproximatesolutionof (26).Theproblemcanalsobe
solved using standard methods for convex stochastic optimization, such as projected
stochastic gradient methods.
## 5.3 Numerical Examples
In this section, we give two numerical examples.
Linear utility. Our first example involves a CFMM with six assets, geometric mean
trading function with equal weights wi = 1/6, and trading fee parameter γ = 0.9.
(We intentionally use an unrealistically small value of γ so the no-trade condition is
more evident.) We take reserves
R = (1,3,2,5,7,6).
The corresponding prices are given by (9),
p = (R6/R1, R6/R2,...,1) = (6,2,3,6/5,6/7,1).
We consider linear utility, with the trader’s private prices given by
π = (tp1, p2,..., pn),
where t is a parameter that we vary over the interval t ∈ [1/2,2]. For t = 1, we have
π = p, i.e., the CFMM prices and the trader’s private prices are the same (and not
surprisingly, the trader does not trade). As we vary t, we vary the trader’s private
price for asset 1 by up to a factor of two from the CFMM price.440 G. Angeris et al.
0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0
t
−0.8
−0.6
−0.4
−0.2
0.0
0.2
0.4
0.6
Λ − ∆
Λ1 − ∆1
Λ2 − ∆2
Λ3 − ∆3
Λ4 − ∆4
Λ5 − ∆5
Λ6 − ∆6
Fig. 3 Solutions " − ! for the linear utility maximization problem, as the private price for asset
1 is varied by the factor t from the CFMM price. The blue curve shows asset 1
The family of optimal trades is shown in Fig.3, as a function of the parameter t.
We plot " − ! versus t, which shows assets in the tender basket as negative and the
received basket as positive. The blue curve shows asset 1, which we tender when t is
small, and receive when t is large. The no-trade region is clearly seen as the interval
t ∈ [0.9,1.1].
Markowitz trading. Our second example uses nearly the same CFMM and reserves
as the previous example, but with a more realistic trading fee parameter γ = 0.997.
(ThisisacommonchoiceoftradingfeeformanyCFMMs.)WesolvetheMarkowitz
trading problem (25), with current holdings
zcurr
= (2.5,1,0.5,2.5,3,1),
mean return
µ = (−0.01,0.01,0.03,0.05,−0.02,0.02),
and covariance $ = VT
V/100, where the entries of V ∈ R6×6
are drawn from the
standard normal distribution. We solve the optimal trading problem for values of the
risk aversion parameter κ varying between 10−2
and 101
. (For all of these values,
the trading constraint is tight.) These optimal trades are shown in Fig.4. It is inter-
esting to note that depending on the risk aversion, we either tender or receive assets
2 and 3.
The CVXPY code for the Markowitz optimal trading problem is given below. In
thissnippet,weassumethatmu,sigma,gamma,kappa,R,andz_currhavebeen
previously defined. Note that the code closely follows the mathematical description
of the problem given in (25).Constant Function Market Makers: Multi-asset Trades via Convex Optimization 441
10−2
10−1
100
101
κ
−30
−20
−10
0
Λ − ∆
Λ1 − ∆1
Λ2 − ∆2
Λ3 − ∆3
Λ4 − ∆4
Λ5 − ∆5
Λ6 − ∆6
Fig.4 Solutions" − !forinstancesofanexampleMarkowitztradingproblemastherisk-aversion
parameter κ is varied
import cvxpy as cp
delta = cp.Variable(6)
lam = cp.Variable(6)
z = z_curr - delta + lam
R_new = R + gamma*delta - lam
objective = cp.Maximize(z.T @ mu - kappa*cp.quad_form(z, sigma))
constraints = [
cp.geo_mean(R_new) >= cp.geo_mean(R),
delta >= 0,
lam >= 0
]
problem = cp.Problem(objective, constraints)
problem.solve()
Listing 1 Markowitz trading CVXPY code.
## 6 Conclusion
We have provided a general description of CFMMs, outlining how users can interact
with a CFMM through trading or adding and removing liquidity. We observe that
many of the properties of CFMMs follow from concavity of the trading function.
In the simple case where two assets are traded or exchanged, it suffices to specify
the amount we wish to receive (or tender), which determines the amount we tender
(receive), by simply evaluating a convex (concave) function. Multi-asset trades are
more complex, since the set of valid trades is multi-dimensional, i.e., multiple tender442 G. Angeris et al.
or received baskets are possible. We formulate the problem of choosing from among
these possible valid trades as a convex optimization problem, which can be globally
and efficiently solved.
Acknowledgements The authors would like to acknowledge Shane Barratt for useful discussions.
Guillermo Angeris issupported by the National Science Foundation Graduate ResearchFellowship
under Grant No. DGE-1656518. Akshay Agrawal is supported by a Stanford Graduate Fellowship.
References
[aav21] Aave. https://aave.com, 2021
[ABN+21] Akshay Agrawal, Stephen Boyd, Deepak Narayanan, Fiodar Kazhamiaka, and Matei
Zaharia. Allocation of fungible resources via a fast, scalable price discovery method.
arXiv preprint arXiv:2104.00282, 2021
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function mar-
ket makers. In Proceedings of the 2nd ACM Conference on Advances in Financial
Technologies, pages 80–91, New York NY USA, October 2020. ACM
[AEC20] Guillermo Angeris, Alex Evans, and Tarun Chitra. When does the tail wag the dog?
Curvature and market making. arXiv preprint arXiv:2012.08040, 2020
[AEC21a] Guillermo Angeris, Alex Evans, and Tarun Chitra. A note on privacy in constant
function market makers. arXiv preprint arXiv:2103.01193, 2021
[AEC21b] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. arXiv
preprint arXiv:2103.14769, 2021
[AI21] Jun Aoyagi and Yuki Ito. Liquidity implications of constant product market makers.
Available at SSRN 3808755, 2021
[AKC+20] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra.
An analysis of Uniswap markets. Cryptoeconomic Systems, November 2020
[Aoy20] Jun Aoyagi. Liquidity provision by automated market makers. Available at SSRN
3674178, 2020
[ApS19] MOSEK ApS. MOSEK Optimizer API for Python 9.1.5.
https://docs.mosek.com/9.1/pythonapi/index.html, 2019
[AVB21] Angeris, G., Vučković, J., Boyd, S.: Heuristic methods and performance bounds for
photonic design. Optics Express 29(2), 2827 (2021)
[AVDB18] Agrawal, A., Verschueren, R., Diamond, S., Boyd, S.: A rewriting system for convex
optimization problems. Journal of Control and Decision 5(1), 42–60 (2018)
[AZS+21] Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson.
Uniswap v3 core. Technical report, 2021
[BBD+17] Boyd, S., Busseti, E., Diamond, S., Kahn, R., Koh, K., Nystrup, P., Speth, J.: Multi-
periodtradingviaconvexoptimization.FoundationsandTrendsinOptimization3(1),
1–76 (2017)
[BKPH05] Stephen Boyd, Seung-Jean Kim, Dinesh Patil, and Mark Horowitz. Digital circuit
optimization via geometric programming. Operations Research, 53(6), 2005
[Bla16] LarsBlackmore.Autonomousprecisionlandingofspacerockets.TheBRIDGE,26(4),
2016
[BPC+11] Stephen Boyd, Neal Parikh, Eric Chu, Borja Peleato, and Jonathan Eckstein. Dis-
tributed optimization and statistical learning via the alternating direction method of
multipliers. Foundations and Trends® in Machine learning, 3(1):1–122, 2011
[BSM+17] Goran Banjac, Bartolomeo Stellato, Nicholas Moehle, Paul Goulart, Alberto Bempo-
rad, and Stephen Boyd. Embedded code generation using the OSQP solver. In IEEE
Conference on Decision and Control, 2017Constant Function Market Makers: Multi-asset Trades via Convex Optimization 443
[But13] Vitalik Buterin. Ethereum: A next-generation smart contract and decentralized appli-
cation platform, 2013
[But17] Vitalik Buterin. On path independence (2017). https://vitalik.ca/general/2017/06/22/
marketmakers.html
[BV04] Boyd,S.,Vandenberghe,L.:ConvexOptimization.CambridgeUniversityPress,Cam-
bridge, UK; New York (2004)
[CAEK21] Tarun Chitra, Guillermo Angeris, Alex Evans, and Hsien-Tang Kao. A note on bor-
rowing constant function market maker shares. 2021
[CFL+08] Yiling Chen, Lance Fortnow, Nicolas Lambert, David Pennock, and Jennifer Wort-
man. Complexity of combinatorial market makers. In Proceedings of the 9th ACM
Conference on Electronic Commerce, pages 190–199, 2008
[com21] Compound. https://compound.finance, 2021
[CPDB13] Eric Chu, Neal Parikh, Alexander Domahidi, and Stephen Boyd. Code generation for
embedded second-order cone programming. In European Control Conference, pages
1547–1552. IEEE, 2013
[CT06] Gerard Cornuejols and Reha Tütüncü. Optimization Methods in Finance. Cambridge
University Press, 2006
[DB16] Diamond, S., Boyd, S.: CVXPY: A Python-embedded modeling language for convex
optimization. Journal of Machine Learning Research 17(83), 1–5 (2016)
[DCB13] Alexander Domahidi, Eric Chu, and Stephen Boyd. ECOS: An SOCP solver for
embedded systems. In 2013 European Control Conference (ECC), pages 3071–3076,
Zurich, July 2013. IEEE
[DHL17] Dunning, I., Huchette, J., Lubin, M.: JuMP: A modeling language for mathematical
optimization. SIAM review 59(2), 295–320 (2017)
[dyd21] dydx. https://dydx.exchange, 2021
[EAC21] Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric mean
market makers. arXiv preprint arXiv:2104.00446, 2021
[Ego19] Michael Egorov. StableSwap - efficient mechanism for Stablecoin liquidity. page 6,
2019
[Eva20] Alex Evans. Liquidity provider returns in geometric mean markets. arXiv preprint
arXiv:2006.08806, 2020
[FHT01] Jerome Friedman, Trevor Hastie, and Robert Tibshirani. The Elements of Statistical
Learning, volume 1. Springer Series in Statistics, 2001
[GCG19] MichaelGarstka,MarkCannon,andPaulGoulart.COSMO:Aconicoperatorsplitting
methodforlargeconvexproblems.In201918thEuropeanControlConference(ECC),
pages 1951–1956, Naples, Italy, June 2019. IEEE
[Han03] Hanson,R.:Combinatorialinformationmarketdesign.InformationSystemsFrontiers
5(1), 107–119 (2003)
[HBL01] Hershenson, M., Boyd, S., Lee, T.: Optimal design of a CMOS op-amp via geometric
programming. IEEE Transactions on Computer-aided design of integrated circuits
and systems 20(1), 1–21 (2001)
[LB14] Lipp, T., Boyd, S.: Minimum-time speed optimisation over a fixed path. International
Journal of Control 87(6), 1297–1311 (2014)
[Lu17] Alan Lu. Building a decentralized exchange in Ethereum.
https://blog.gnosis.pm/building-a-decentralized-exchange-in-ethereum-
eea4e7452d6e, 2017
[Mar52] Markowitz, H.: Portfolio selection. The. Journal of Finance 7(1), 77–91 (1952)
[MB12] Mattingley,J.,Boyd,S.:CVXGEN:Acodegeneratorforembeddedconvexoptimiza-
tion. Optimization and Engineering 13(1), 1–27 (2012)
[MBBW19] Nicholas Moehle, Enzo Busseti, Stephen Boyd, and Matt Wytock. Dynamic energy
management. arXiv preprint arXiv:1903.06230, 2019
[MM19] Fernando Martinelli and Nikolai Mushegian. Balancer: A non-custodial portfolio
manager, liquidity provider, and price sensor. 2019
[Nak08] Satoshi Nakamoto. Bitcoin: A peer-to-peer electronic cash system, 2008444 G. Angeris et al.
[OCPB16] O’Donoghue, B., Chu, E., Parikh, N., Boyd, S.: Conic optimization via operator
splittingand homogeneous self-dual embedding. Journal of OptimizationTheory and
Applications 169(3), 1042–1068 (2016)
[PTFV92] Press, W., Teukolsky, S., Flannery, B.: and William Vetterling. The Art of Scientific
Computing. Cambridge University Press, Numerical Recipes (1992)
[RB16] Ernest Ryu and Stephen Boyd. A primer on monotone operator methods. Applied
Computational Math, 2016
[SB08] GregoryStewartandFrancescoBorrelli.Apredictivecontrolframeworkforindustrial
turbodiesel engine control. In IEEE Conference on Decision and Control (CDC),
pages 5704–5711, 2008
[SBG+20] Bartolomeo Stellato, Goran Banjac, Paul Goulart, Alberto Bemporad, and Stephen
Boyd. OSQP: An operator splitting solver for quadratic programs. Mathematical
Programming Computation, February 2020
[Sus20] Sushi. The SushiSwap project, 2020
[Sza95] Nick Szabo. Smart contracts. Extropy: Journal of Transhumanist Thought, 16, 1995
[TW20] MartinTassyandDavidWhite.Growthrateofaliquidityprovider’s wealthin xy = c
automated market makers, 2020
[uma21] UMA project. https://umaproject.org, 2021
[WB10] Wang,Y.,Boyd,S.:Fastevaluationofquadraticcontrol-Lyapunovpolicy.IEEETrans-
actions on Control Systems Technology 19(4), 939–946 (2010)
[WCDW21] Ye Wang, Yan Chen, Shuiguang Deng, and Roger Wattenhofer. Cyclic arbitrage in
decentralized exchange markets. Available at SSRN 3834535, 2021
[Win69] Winkler, R.: Scoring rules and the evaluation of probability assessors. Journal of the
American Statistical Association 64(327), 1073–1078 (1969)
[Woo14] Gavin Wood. Ethereum: A secure decentralised generalised transaction ledger, 2014
[Woo16] Gavin Wood. Polkadot: Vision for a heterogeneous multi-chain framework, 2016
[Yak18] Anatoly Yakovenko. Solana: A new architecture for a high performance blockchain,
2018
[ZCP18] YiZhang,XiaohongChen,andDaejunPark.Formalspecificationofconstantproduct
(xy = k) market maker model and implementation. 2018