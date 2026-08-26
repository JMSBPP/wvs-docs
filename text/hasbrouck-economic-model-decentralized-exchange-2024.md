---
sha256: 198f9b09ac08ea321b1228d51d5cf1c0eda1abe58b1beacdea7af0e5419af372
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 85282
---
An Economic Model of a Decentralized Exchange with
Concentrated Liquidity∗
Joel Hasbrouck†
Thomas J. Rivera‡
Fahad Saleh§
Abstract
We develop a model of a decentralized exchange that allows investors to concentrate
liquidity within pre-specified price intervals (e.g., Uniswap V3). Providing liquidity for
a risky/risk-free asset pair within any interval is analogous to investing in a dynamic
portfolio of those assets, subject to an arbitrage cost, where the risky asset weight
declines as its price increases. We derive equilibrium liquidity provision for each price
interval and provide a simple approximation that can be useful for empirical work. We
also show that liquidity provision generates an ex-fee return approximately equivalent
to the return from a covered call trading strategy.
Keywords: Decentralized Exchange, DEX, Automated Market Makers, AMM, Concen-
trated Liquidity, Uniswap V3
∗
We thank Agostino Capponi, Campbell Harvey, Ruizhe Jia, Ciamac Moallemi, Christine Parlour, Adri-
ano Rampini, Tim Roughgarden, Vish Viswanathan, Anthony Zhang and seminar participants at Duke
University for valuable comments.
†
New York University Stern School of Business. Email: jh4@stern.nyu.edu
‡
McGill University. Email: thomas.rivera@mcgill.ca
§
Wake Forest University. Email: salehf@wfu.eduA decentralized exchange (DEX) is an innovation that allows investors to exchange digital
assets through the use of smart contracts deployed on a blockchain. The first successful design
of a DEX (e.g., Uniswap V1/V2) allows investors to passively provide liquidity uniformly
across all price levels. While innovative, this design suffers from inefficiencies because uniform
liquidity provision results in a substantial amount of liquidity being provided at price levels
that are unlikely to be reached. To overcome these inefficiencies, a new design for liquidity
provision, concentrated liquidity provision, has been developed with this new design being
characterized by allowing investors to provide liquidity for only trades with trade prices
within particular price intervals explicitly specified by the liquidity provider. The aim of
this paper is to shed light on the referenced innovation by studying the equilibrium liquidity
provision for a DEX with concentrated liquidity.
Formally, our paper puts forth an economic model of a DEX with concentrated liquidity
provision (e.g., Uniswap V3). In providing such a model, we characterize the investment
return profile for concentrated liquidity providers, and also provide a useful expression for
equilibrium liquidity provision distribution across all price levels. Our analysis of the invest-
ment return to liquidity providers offers worthwhile context for investors deciding whether
to provide liquidity to a DEX such as Uniswap V3. Moreover, our characterization of equi-
librium liquidity provision provides an empirically useful framework that can be utilized to
study DEX liquidity provision in practice.
To provide more detail, we examine a continuous time model with a single DEX that
facilitates trading of a risky asset, hereafter ETH, against a risk-free asset, hereafter USDC.1
Our model consists of investors with identical investment horizons and traders with exoge-
nous trading demand. All investors have access to the risk-free asset, USDC, and can lend
and borrow that asset at an exogenous risk-free rate. At the beginning of the investment
horizon, investors optimally allocate capital across DEX liquidity provision and a portfolio of
1
ETH represents ether, the native cryptoasset of the Ethereum blockchain (a risky crypto-asset) while
USDC represents USD coin, a stable coin pegged to the US dollar. ETH-USDC is typically the most actively
traded token pair at decentralized exchanges such as Uniswap.
1risky assets. Thereafter, traders arrive sequentially and trade at the DEX. Each trader pays
a proportional fee on her trading volume. These fees are distributed pro-rata to the investors
who provided liquidity to the price interval that contains the trades. At the conclusion of the
investment horizon, all investors liquidate their investments and realize their pay-offs. We
assume that, over the investment horizon, ETH-USDC prices at non-DEX venues (e.g., at
centralized exchanges) follow an exogenous generalized diffusion process which reflects inno-
vations in public information. In contrast, ETH-USDC prices at the DEX follow a mechanical
pricing function known as a Constant Product Automated Market Maker (CPAMM) func-
tion (see John et al. 2023 for details). We assume that arbitrage traders immediately exploit
any price dislocations between the DEX and non-DEX trading venues, thereby maintaining
alignment between ETH-USDC prices at the DEX and the ETH-USDC price at non-DEX
venues in equilibrium.
Crucially, our model departs from prior literature by allowing for concentrated liquidity
provision at the DEX. More explicitly, as per Uniswap V3, we assume that the DEX parti-
tions the range of ETH-USDC prices into intervals and that investors may select any subset
of price intervals to which they can provide liquidity. Our model contrasts with prior work
that assumes that any DEX liquidity provision must necessarily apply uniformly across all
price levels. Note that early DEX deployments (e.g., Uniswap V1/V2) impose this latter
condition but recent DEX deployments (e.g., Uniswap V3) allow for concentrated liquidity
provision as per our model.
Our paper consists of three sets of results. First, we provide results that characterize the
investment return profile for providing liquidity to an arbitrary price interval. In particular,
we demonstrate that ex-fee returns from liquidity provision are equivalent to the returns
from investing in a dynamic ETH-USDC portfolio minus the loss-versus-rebalancing effect
first highlighted by Milionis et al. (2022). Notably, we explicitly derive the dynamic portfolio
weighting and demonstrate that the ETH portfolio weight is decreasing in the ETH-USDC
price (Proposition 4.2). After characterizing the returns from liquidity provision for any
2given interval, our second set of results compares those returns across arbitrary intervals.
Our key insight here is that the ex-fee return from providing liquidity to a price interval
lying above the current ETH-USDC price increases as we consider intervals further above
the ETH-USDC price. Further, we show that ex-fee returns from liquidity provision to all
such intervals lying above the current ETH-USDC price are always dominated by the return
from investing only in ETH (Propositions 4.3 and 4.4). Similarly, the ex-fee return from
providing liquidity to a price interval lying below the current ETH-USDC price increases
as we consider intervals further below the ETH-USDC price and ex-fee returns for all such
intervals are always dominated by the return from holding USDC (Propositions 4.3 and
4.5). This second set of results implicitly highlights that equilibrium fee returns must be
sufficiently large to offset the opportunity cost of not investing directly in ETH or USDC.
Relatedly, our third set of results, which constitute our primary contribution, provides a
closed-form expression for the equilibrium liquidity provision distribution across price levels.
In more detail, after characterizing the equilibrium liquidity provision for any arbitrary width
of the price interval, we then study a limiting case whereby the price intervals collapse to
zero width, which allows us to derive closed-form expressions for both equilibrium liquidity
provision (Proposition 4.7) and equilibrium liquidity provision returns (Proposition 4.8).
Notably, our equilibrium liquidity provision expression is easy to compute, and we show how
it can be used to approximate liquidity provision in practice. Our results can thus be applied
to empirically test the distribution of liquidity provision at DEXs that support concentrated
liquidity. Importantly, we also demonstrate that our derived equilibrium liquidity provision
return is similar to the return on an ETH-USDC covered call trading strategy, clarifying that
concentrated liquidity provision differs from investing directly in ETH mainly by foregoing
ETH price appreciation beyond a certain point.
In order to explain our findings, we emphasize that providing DEX liquidity to a given
price interval comes with the restriction that the liquidity can be utilized to facilitate trades
only within that interval. Importantly, in exchange for providing such inventory, each in-
3vestor receives 1.) a pro-rata share of any trading fees earned from trades executed within
that interval and 2.) a pro-rata share of the total inventory associated with the selected
price interval. We show that the return from the pro-rata share of inventory is equivalent to
the return on the portfolio of ETH-USDC inventory for the interval minus the loss-versus-
rebalancing cost of Milionis et al. (2022). We characterize this aforementioned ETH-USDC
inventory portfolio for each interval (Proposition 4.1), hereafter referred to as the liquidity
portfolio for the given price interval, noting that this characterization is a specialization of
a known result that applies to a more general class of AMMs (see Milionis et al. 2022).
Importantly, we demonstrate that the liquidity portfolio possesses dynamic portfolio weights
which vary with the ETH-USDC price (Proposition 4.2). In particular, we show that the
ETH portfolio weight is unity when the ETH-USDC price is below the price interval, zero
when the ETH-USDC price is above the price interval, and continuously decreasing from
unity to zero as the ETH-USDC price increases through the price interval. It is important
to note that Proposition 4.2 would not arise under uniform liquidity provision. More ex-
plicitly, a DEX with a CPAMM function and uniform liquidity provision (e.g., Uniswap V1
and V2) generates a 50-50 portfolio for the two assets being traded against each other (see
Angeris et al. 2021). Crucially, the referenced 50-50 portfolio weighting for uniform liquidity
provision is static and invariant to market prices; this static nature of the liquidity portfolio
under uniform liquidity provision contrasts with the dynamic nature of the liquidity portfolio
under concentrated liquidity provision.
In order to understand the dynamic nature of the liquidity portfolio (i.e., Proposition
4.2), it is necessary to recognize that the mechanical nature of DEX pricing implies that
the ETH-USDC price at the DEX does not directly respond to public information. Rather,
when public information induces an increase in the exogenous ETH-USDC price at non-DEX
venues (e.g., at centralized exchanges), this generates profitable trading opportunities at the
DEX whereby arbitrage traders buy ETH at a stale price from the DEX and sell ETH at the
new higher price at a non-DEX venue (see Capponi and Jia 2021). The referenced arbitrage
4trading ensures that the DEX price is always aligned with the ETH-USDC price at non-
DEX venues. Thus, as the ETH-USDC price increases through a particular price interval,
arbitrage activities lead to net buying of ETH at the DEX; in turn, since an ETH buy at
a DEX is implemented as a swap of ETH for USDC, such net buying decreases the ETH
portfolio weight of the liquidity portfolio for that price interval.
Our second set of results provides comparative insights for the investment returns from
liquidity provision at a DEX. Most notably, Proposition 4.3 establishes that the ex-fee real-
ized return for providing liquidity at a DEX to any price interval is always dominated by the
return from investing in either ETH or USDC directly. More precisely, the ex-fee realized re-
turn from providing liquidity to an interval above the initial ETH-USDC price is dominated
by investing directly in ETH, whereas the ex-fee realized return from providing liquidity to
an interval below the initial ETH-USDC price is dominated by directly holding USDC. Of
note, Proposition 4.3 can be understood as a formal demonstration of the loss-versus-holding
(a.k.a. impermanent loss) concept to a CPAMM DEX with concentrated liquidity.
Importantly, Proposition 4.3 helps us frame the trade-off that liquidity providers inter-
nalize when providing liquidity to a given price interval. More explicitly, since the return on
a liquidity portfolio is always dominated by the return from holding ETH (USDC) directly,
it follows that an investor will provide liquidity to the DEX within a given price interval
only if the expected return from trading fees is high enough to off-set the opportunity cost
of accepting a lower return from the liquidity portfolio. Crucially, the fact that investors
earn their pro-rata share of fee revenues from trading that occurs within their price interval
implies that the liquidity provision to a given interval will adjust in equilibrium to guarantee
that the return from fees exactly offsets the opportunity cost of liquidity provision.
Given all the aforementioned context, we turn to our main result which is to provide the
equilibrium liquidity provision for each price interval. We specifically provide that result in
two ways. First, when deriving our equilibrium model solution (Proposition 3.1), we provide
a general expression for equilibrium liquidity provision for each price interval. Subsequently,
5in Proposition 4.7, we derive equilibrium liquidity provision in a limiting case of our model
whereby the width of the price interval goes to zero and apply that limit to construct a simple
approximation of equilibrium liquidity provision for each price interval. We offer both the
general expression and an approximate expression because the general result of Proposition
3.1 is somewhat opaque, whereas the limiting result of Proposition 4.7 has an intuitive
form. More precisely, the limiting equilibrium liquidity provision for each price interval has
quotient form with the numerator representing the expected fee revenue and the denominator
representing the extent to which ex-fee expected returns fall short of risk-adjusted returns
from investing directly in ETH. This limiting expression thus transparently highlights the
manner in which equilibrium liquidity provision increases with fees but decreases with the
opportunity cost of investment. Notably, we demonstrate that our limiting distribution of
liquidity provision can be utilized to form a simple approximation of equilibrium liquidity
provision that is easy to compute across all price intervals and commensurately easy to apply
for future empirical work and comparative statics.
We conclude our analysis by offering an intuitive characterization of the returns to liq-
uidity provision at a DEX with concentrated liquidity. More explicitly, we conclude with
Proposition 4.8, a result which reveals that providing liquidity to a particular price inter-
val at a DEX with concentrated liquidity is approximately equivalent to holding ETH and
shorting a particular ETH-USDC call against that ETH position (i.e., a covered call). The
aforementioned call option is characterized by a strike price which is within the price inter-
val to which liquidity is being provided and a maturity equal to the end of the investor’s
investment horizon. To understand this result, recall from Proposition 4.2 that the liquidity
portfolio for a given price interval consists of only ETH when the ETH-USDC price is below
the price interval and the liquidity portfolio consists of only USDC when the ETH-USDC
price is above the interval. In turn, as a consequence, providing liquidity to a price interval
over a fixed investment horizon corresponds to receiving the ETH pay-off if the ETH-USDC
price ends below the price interval but otherwise corresponds to the pay-off from having sold
6the ETH inventory for USDC if the ETH-USDC price ends above the price interval. Impor-
tantly, as per Proposition 4.8, this pay-off profile can be approximated by the aforementioned
covered call strategy. In particular, under the aforementioned covered call strategy, if the
terminal ETH-USDC price ends below the interval, then the call option expires worthless
and the investor holds only ETH, just as if the investor had provided liquidity to the DEX. In
contrast, when the terminal ETH-USDC price ends above the interval, then the call option
is optimally exercised and therefore the investor sells her ETH in return for USDC which
also generates the same pay-off in this case from providing liquidity to the DEX.
In broad terms, our paper relates to the literature examining the economics of blockchain.
Makarov and Schoar (2022), John et al. (2022), and John et al. (2023) provide surveys of
that literature. That literature includes many strands of work including blockchain eco-
nomic security (e.g., Biais et al. 2019, Saleh 2021 and Chiu and Koeppl 2022), blockchain
microstructure elements (e.g., Easley et al. 2019, Huberman et al. 2021 and Lehar and Par-
lour 2020), smart contracts (e.g., Cong and He 2019) and tokenomics (e.g., Cong et al. 2021
and Mayer 2022). More recently, a literature examining Decentralized Finance (DeFi) ap-
plications on blockchain has emerged, and our work contributes especially to that strand of
work. In more detail, the DeFi literature particularly examines lending platforms (see, e.g.,
Chiu et al. 2022, Lehar and Parlour 2022, Chaudhary et al. 2023, Rivera et al. 2023) and
DEXs, whereby our contribution is to the latter.
The literature on DEXs is young but quickly growing. The early literature on decen-
tralized exchanges includes Aoyagi (2020), Aoyagi and Ito (2021), Capponi and Jia (2021),
Lehar and Parlour (2021), Park (2021), Hasbrouck et al. (2022) and Milionis et al. (2022).
Apart from Milionis et al. (2022), all the aforementioned papers focus on settings with uni-
form liquidity provision as per the practice of many DEX deployments (e.g., Uniswap V1
and V2). Thus, our contribution relative to those works is that we study a new type of
DEX, namely a DEX with concentrated liquidity provision. It is noteworthy that Milionis
et al. (2022) study a more general setting but focus on establishing a generic cost of DEX
7investing known as Loss-Versus-Rebalancing (LVR) rather than examining specific features
of any particular type of DEX. Importantly, the main insight of Milionis et al. (2022) holds
even out-of-equilibrium and thus Milionis et al. (2022) study a model with an exogenous
level of liquidity provision. In contrast, we determine liquidity provision endogenously and a
primary contribution of our work is to provide a simple expression for equilibrium liquidity
provision across all price intervals.
While we are the first to study an equilibrium model of a DEX with concentrated liquid-
ity provision, there exist other papers that either examine this specific setting empirically or
out-of-equilibrium (i.e., with exogenous liquidity provision). With regard to empirical work,
complementary to our work is the work of Barbon and Ranaldo (2022), Lehar et al. (2022)
and Caparros et al. (2023), both of which conduct empirical analysis on Uniswap V3 (a
DEX that allows for concentrated liquidity provision). Of note, Lehar et al. (2022) also pro-
vide theoretical analysis but focus on competition across markets, abstracting from liquidity
provision across multiple intervals, rather than examining the implications of concentrated
liquidity provision within a single market. With regard to works also studying a DEX with
concentrated liquidity provision in a theoretical context, Neuder et al. 2021 and Heimbach
et al. 2022 theoretically examine the return profile for a single investor. Our work differs from
those works in that we provide an equilibrium analysis with endogenously derived liquidity
provision whereas the referenced papers abstract from equilibrium asset pricing conditions
and also take DEX liquidity provision as exogenous.
## 1 Institutional Detail Regarding Uniswap V3
Before stating our formal economic model, we first clarify the mechanics of a DEX with
concentrated liquidity. More explicitly, within this section, we explain the mechanics of the
most prominent DEX that offers concentrated liquidity provision, Uniswap V3. As an aside,
our model exposition in Section 2 is largely self-contained so that a reader may skip this
8section with minimal loss in clarity with regard to our formal analysis.
The Uniswap V3 specification governs exchanges between two cryptoassets. For exposi-
tional simplicity, we assume the two cryptoassets are ETH (a risky cryptoasset) and USDC
(a USD stablecoin), with prices stated in terms of USDC per ETH token. The price space
is partitioned into a set of intervals. Each price interval corresponds to the range defined by
adjacent values on a price grid which is given as follows:
Ψk “ p1 ` ∆qk
(1)
for all k P Z and with ∆ ą 0 determining the geometric width of each price interval (i.e.,
Ψk`1
Ψk
“ 1 ` ∆ for all i).
Associated with each interval is a portfolio of ETH and USDC contributed by liquidity
suppliers. The ETH and USDC in this portfolio are available for exchange in that ETH
buyers provide USDC as payment in return for ETH, whereas ETH sellers provide ETH in
return for USDC as payment. To provide more detail regarding the mechanics of trades,
Uniswap V3 determines pricing by requiring the following invariant hold at all times:
´
ETHi,t `
Li
?
Ψi`1
¯´
USDCi,t ` Li
a
Ψi
¯
“ L2
i (2)
where ETHi,t denotes the ETH inventory in price interval i at time t, USDCi,t denotes the
USDC inventory in price interval i at time t and Li ě 0 denotes an endogenous market-
determined quantity, generally termed “liquidity” by practitioners.
To see how Equation (2) determines pricing, note that trading δETH ETH alters the
ETH inventory from ETHi,t to ETHi,t ´ δETH where we use the convention that δETH ą 0
corresponds to an ETH buy while δETH ă 0 corresponds to an ETH sell. Importantly, by
altering the ETH inventory level, trading ETH alters the first term on the left hand side of
Equation (2) and thus requires an offsetting adjustment to the second term on the left hand
side of Equation (2) (i.e., to USDC inventory) so as to maintain Equation (2) after the trade.
9In more detail, an ETH buy (i.e., δETH ą 0) reduces ETH inventory and thereby requires an
off-setting increase in USDC inventory of δUSDC ą 0, whereas an ETH sale (i.e., δETH ă 0)
reduces ETH inventory and thereby requires an off-setting decrease of USDC inventory by
δUSDC ă 0. More formally, an ETH trade not only alters ETH inventory to ETHi,t ´ δETH
but, to maintain Equation (2), it must be accompanied by an alteration in USDC inventory
to USDCi,t `δUSDC where δUSDC can be derived by imposing the invariant in Equation (2)
with ETH and USDC inventory levels updated to those after the trade:
´
ETHi,t ´ δETH `
Li
?
Ψi`1
¯´
USDCi,t ` δUSDC ` Li
a
Ψi
¯
“ L2
i (3)
When δETH ą 0, the additional USDC inventory of δUSDC ą 0 is deemed as the payment
for the ETH buy. Similarly, when δETH ă 0, the reduction in USDC inventory is deemed as
the proceeds from the ETH sale. In turn, given that interpretation, it is easy to compute
the (average) price of an ETH trade of δETH by solving for δUSDC and then taking the price
as the amount of USDC per unit ETH (i.e., δUSDC
δETH
). More explicitly, Equation (2) and (3)
collectively imply the following average price, PDEX
t pδETHq, for trading δETH ETH:2
PDEX
t pδETHq “
USDCi,t ` Li
?
Ψi
ETHi,t ` Li ?
Ψi`1
´ δETH
, δETH P rδ´
i,t,δ`
i,ts (4)
where δETH is restricted to the domain rδ´
i,t,δ`
i,ts with δ´
i,t ă 0 representing the largest ETH
sale feasible at time t within price interval i and δ`
i,t ą 0 representing the largest ETH buy
feasible at time t within price interval i. To provide further context, the largest feasible ETH
buy is the ETH quantity that would fully deplete the ETH inventory within the price interval
(i.e., δ`
i,t “ ETHi,t), whereas the largest feasible ETH sale is the ETH sale that would fully
deplete the USDC inventory within the interval (i.e., |δ´
i,t ˆ PDEX
t pδ´
i,tq| ď USDCi,t). If a
2
Note that Equation (4) is identical to the pricing for uniform liquidity provision derived in John et al.
(2023) except that the true inventory levels, ETHi,t and USDCi,t, are inflated by additive factors. More
explicitly, ETHi,t is replaced by ETH1
i,t “ ETHi,t ` Li ?
Ψi`1
whereas USDCi,t is replaced by USDC1
i,t “
USDCi,t ` Li
?
Ψi. In practice, ETH1
i,t and USDC1
i,t are generally referred to as “virtual” inventory.
10trader wishes to place an order larger than δETH P rδ´
i,t,δ`
i,ts, then the maximum feasible
trade is executed within the price interval i, and the remainder of the trading volume is
executed within other price intervals. More explicitly, if the trader wishes to trade δ ą δ`
i,t,
then a trade size of δ`
i,t is executed within price interval i and the remainder of the trade is
executed within price intervals above price interval i; similarly, if the trader wishes to trade
δ ă δ´
i,t, then a trade size of δ´
i,t is executed within price interval i and the remainder of the
trade is executed within price intervals below price interval i.
Crucially, note that, as per Equation (4), trading alters the ETH-USDC price in the
direction of the trade with an ETH buy increasing the ETH-USDC price and an ETH sell
decreasing the ETH-USDC price (i.e., dP
dδ
ą 0 in Equation 4). Uniswap V3 is particularly
specified such that the ETH-USDC price moves continuously upwards through a price interval
due to ETH buying; the buying depletes the ETH inventory, and the ETH-USDC price enters
the adjacent upper interval exactly when the initial interval possesses zero ETH inventory.
Similarly, the ETH-USDC price moves continuously downward through a price interval due
to ETH selling; the selling depletes the USDC inventory, and the ETH-USDC price enters
the adjacent lower interval exactly when the initial interval possesses zero USDC inventory.
Given Li, Uniswap V3 is simply a mechanical rule. There is no presumption that the
rule represents an optimal market structure. Nonetheless, Li is not an exogenous parameter;
rather, it is an endogenous economic quantity determined by the level of investment from
liquidity providers. An important contribution of our work is that we depart from prior
literature by deriving Li as an equilibrium object rather than taking it as exogenous.
2 A Model of Concentrated Liquidity Provision
We model a single investment horizon from time t “ 0 to t “ T. At t “ 0, investors arrive
and allocate their capital across all available investment opportunities. At t “ T, investors
liquidate their investments and realize their pay-offs. We assume that investors select their
11portfolios at t “ 0 to maximize their expected utility.
## 2.1 Assets
There exist two assets: a risk-free asset (USDC) and a risky asset (ETH). USDC is the
numeraire and may be borrowed or lent at the exogenous risk-free rate r ą 0. In contrast,
ETH is a risky asset with ETH-USDC prices tPtuT
t“0 evolving according to an exogenous
continuous time diffusion process given by:
dPt
Pt
“ r dt ` σt dBQ
t (5)
where tBQ
t uT
t“0 denotes a Brownian motion under the risk-neutral measure Q while tσtuT
t“0
denotes a non-negative process for instantaneous ETH return volatility. We require that
tσtuT
t“0 is such that tPtuT
t“0 is non-negative, fully supported on R` and further that there
exists a continuous function fpp,tq which gives the density of pt :“ logpPtq at value p; we also
require Ere
1
2
T ş
0
σ2
t dt
s ă 8. Note that all these regularity conditions are satisfied by geometric
Brownian motion (i.e., σt “ σ ą 0), the most common special case of Equation (5).
## 2.2 Decentralized Exchange (DEX)
We model a single Decentralized Exchange (DEX) which allows for the trading of ETH
against USDC and operates as described in Section 1. Investors may invest in the DEX
by providing liquidity to the DEX which facilitates the DEX’s trading activity. In more
detail, an investor providing liquidity to the DEX means that the investor provides the DEX
with ETH and USDC inventory which is then used by the DEX to meet demand for traders
buying or selling ETH against USDC.
The DEX partitions the feasible range of ETH-USDC prices into exogenous intervals
and each investor may concentrate her liquidity provision on any subset of those intervals.
Providing liquidity to a particular price interval implies that the investor’s inventory can be
12used for trading at the DEX only if that trading occurs at ETH-USDC prices within that
specific price interval. In turn, an investor providing liquidity to a particular price interval
does not improve liquidity for traders when ETH-USDC prices are outside that price interval.
We let price interval i P Z correspond to interval rΨi,Ψi`1s where, as in practice, each
interval endpoint is given explicitly by Ψk “ p1`∆qk
with ∆ ą 0 determining the geometric
width of each price interval (i.e., Ψk`1
Ψk
“ 1 ` ∆ for all k). Then, the gross return from
providing liquidity to interval i, RDEX,i, is given as follows:
RDEX,i “ Ri
P&L ` ϕi (6)
where Ri
P&L denotes the ex-fee gross return on the liquidity providers inventory for price
interval i and ϕi denotes the fees accrued by liquidity providers within price interval i for
providing a unit of inventory capital to price interval i. We subsequently clarify how Ri
P&L
and ϕi are each determined.
2.2.1 Ex-Fee Return to Liquidity Providers, Ri
P&L
As noted earlier, the liquidity provided to the DEX for any particular price interval is
provided as inventory in the form of ETH and USDC and thus the liquidity provided for
any particular price interval constitutes a portfolio of ETH and USDC. Notably, when an
investor provides liquidity at a particular price interval, she becomes a pro-rata owner of
the portfolio associated with that price interval, which we refer to as the liquidity portfolio
for that price interval. In turn, the ex-fee gross return to an investor for providing liquidity
to price interval i, Ri
P&L, is the gross liquidity portfolio return, which is given explicitly as
follows:
Ri
P&L “
Πi,T
Πi,0
(7)
with Πi,t denoting the liquidity portfolio value of inventory associated with price interval i.
Since the liquidity portfolio consists of only ETH and USDC, Πi,t is the sum of the market
13value of ETH and USDC in the portfolio, which is given explicitly as follows:
Πi,t “ USDCi,t ` ETHi,t ˆ Pt (8)
where USDCi,t denotes the inventory of USDC within price interval i at time t, and ETHi,t
denotes the inventory of ETH within price interval i at time t.
The value of inventory, Πi,t, fluctuates not only due to fluctuations of ETH-USDC prices
(i.e., changes in Pt) but also due to changes in the quantity of ETH and USDC associated
with the price interval (i.e., changes in ETHi,t and USDCi,t). In particular, trading at the
DEX, when prices are within price interval i, leads to changes in the quantity of ETH and
USDC associated with price interval i. For example, buying ETH against USDC at a DEX
entails removing ETH inventory from the DEX in exchange for depositing USDC inventory
to the DEX, with the quantity of USDC deposited corresponding to the dollar price paid
for the ETH removed. As per Uniswap V3, we assume that the DEX employs a a Constant
Product Automated Market Maker (CPAMM) for pricing (see Section 1). We also assume
that the ETH-USDC prices at the DEX remain aligned with the true value of ETH-USDC
prices due to arbitrage trading and we follow Milionis et al. (2022) by abstracting from
arbitrageurs trading fees. In that case, the quantity of USDC, USDCi,t, and the quantity of
ETH, ETHi,t, in price interval i at time t are given explicitly as follows:3
USDCi,t “
´b
P̃i,t ´
a
Ψi
¯
ˆ Li, ETHi,t “
´ 1
b
P̃i,t
´
1
?
Ψi`1
¯
ˆ Li (9)
where Li is an endogenous quantity that practitioners refer to as the “liquidity” for price
interval i that is proportional to the dollar value of the liquidity provided to interval i, while
P̃i,t denotes the projection of the ETH-USDC price onto interval i given by:
3
Formally, Equation (9) follows directly from the equations that define the Uniswap V3 protocol, Equa-
tions (2) and (4), when imposing the additional requirement that the marginal ETH-USDC DEX price aligns
with the price at other trading venues (i.e., lim
δÑ0`
PDEX
t pδq “ Pt for all t where PDEX
t pδq is defined explicitly
in Equation 4).
14P̃i,t “
$
’ ’ ’ ’ ’ ’ &
’ ’ ’ ’ ’ ’ %
Ψi`1 if Pt ą Ψi`1
Pt if Pt P rΨi,Ψi`1s
Ψi if Pt ă Ψi
(10)
Equations (7) - (10) then imply that Ri
P&L is given explicitly as follows:
Ri
P&L “
´b
P̃i,T ´
?
Ψi
¯
`
´
1 ?
P̃i,T
´ 1 ?
Ψi`1
¯
ˆ PT
´b
P̃i,0 ´
?
Ψi
¯
`
´
1 ?
P̃i,0
´ 1 ?
Ψi`1
¯
ˆ P0
(11)
## 2.2.2 Fees Accrued to Liquidity Providers, ϕi
Turning to fees accrued by liquidity providers, the DEX charges a proportional fee, ϕ ě 0,
on all trading volume. All fees generated from trading within price interval i are paid pro-
rata to the investors who provide liquidity for that interval. More formally, letting V ą 0
denote the trading volume per unit time and letting Ip¨q denote an indicator variable, the
cumulative fees accrued for price interval i, Φi, from time 0 to time T is given as follows:4
Φi “
T ż
0
ϕ ˆ V ˆ IpPt P rΨi,Ψi`1sq dt (12)
Furthermore, those total fees, Φi, are distributed pro-rata among the liquidity providers
for the price interval i. Since the total investment by liquidity providers is given by the
portfolio value of assets associated with the price interval at t “ 0, the fees accrued for a
unit of investment capital to price interval i, ϕi, is therefore given explicitly as follows:
ϕi “
Φi
Πi,0
(13)
4
Note that we can easily incorporate the fact that higher inventory in any given interval leads to lower
price impacts (see e.g., Hasbrouck et al. 2022) by assuming that trading volume, Vi, to interval i takes the
functional form Vi “ A ¨ pΠi,0qα
for some constants A ě 0 and α P p0,1q. Using this functional form will
only slightly modify our expression for equilibrium liquidity provision.
15Note that we assume that all non-arbitrage trading corresponds to noise trading activity
that nets out in terms of the price impact at the DEX. Therefore, changes in the DEX price
only occur when innovations in public information (i.e., the price at the non-DEX venue)
creates incentives for arbitrageurs to arbitrage the stale prices at the DEX.
## 3 Model Solution
Under the risk-neutral measure Q, all assets must generate the same pay-off as a risk-free
investment. Explicitly, letting R‹
DEX,i denote the equilibrium rate of return from investing
in price interval i at the DEX, the following equation must hold for all i:
EQ
rR‹
DEX,is “ erT
(14)
Then, applying Equations (6) and (13) to Equation (14) yields:
EQ
rRi
P&Ls `
EQ
rΦis
Π‹
i,0
“ erT
(15)
where Π‹
i,0 refers to the dollar value of equilibrium investment to price interval i. Note that
both the expected ex-fee return from investing in price interval i, Ri
P&L, and the expected
total fees accrued in price interval i, Φi, are exogenous (see Equations 11 and 12). In turn,
the endogenous equilibrium investment, Π‹
i,0, can be derived directly from Equation (15).
Furthermore, all other endogenous quantities can be determined from Π‹
i,0. More formally,
the following result provides an explicit solution for all endogenous quantities.
Proposition 3.1. Equilibrium Model Solution
The equilibrium investment, Π‹
i,0, for each interval i P Z is given explicitly as follows:
Π‹
i,0 “
EQ
rΦis
erT ´ EQrRi
P&Ls
(16)
where the Q-measure total expected fee revenue for interval i, EQ
rΦis, is given explicitly as
16follows:
EQ
rΦis “ ϕ ˆ V ˆ
T ż
0
QpPt P rΨi,Ψi`1sq dt (17)
In turn, the equilibrium liquidity, L‹
i , for each interval i is given explicitly as follows:
L‹
i “
Π‹
i,0
γi
(18)
with γi is defined as follows:
γi “
´b
P̃i,0 ´
a
Ψi
¯
`
´ 1
b
P̃i,0
´
1
?
Ψi`1
¯
ˆ P0 (19)
Finally, the equilibrium quantities of USDC, USDC‹
i,t, and ETH, ETH‹
i,t, in price inter-
val i at time t are given as follows:
USDC‹
i,t “
´b
P̃i,t ´
a
Ψi
¯
ˆ L‹
i , ETH‹
i,t “
´ 1
b
P̃i,t
´
1
?
Ψi`1
¯
ˆ L‹
i (20)
## 4 Equilibrium Results
We begin in Section 4.1 by clarifying the characteristics of the ex-fee return to liquidity
providers, Ri
P&L, for any given price interval i. In doing so, we demonstrate that providing
liquidity to any price interval is equivalent to investing in a dynamic ETH-USDC portfolio
with an ETH weight that declines in the ETH-USDC price. Subsequently, in Section 4.2, we
compare ex-fee realized returns from providing liquidity at the DEX with those from direct
investment in ETH or USDC. An important insight therein is that, in the absence of fees,
providing liquidity to any price interval above the initial ETH-USDC price is dominated
by holding ETH directly, whereas providing liquidity to any price interval below the initial
17ETH-USDC price is dominated by holding USDC directly. These findings implicitly establish
that, in equilibrium, the return from fees earned by providing liquidity to an interval must
offset the opportunity cost of not investing directly in ETH or USDC instead. Finally, in
Section 4.3, we provide our main results. More explicitly, we provide an approximate closed-
form expression for equilibrium liquidity provision to any price interval. Moreover, we also
demonstrate that the ex-fee return to liquidity provision is approximately equivalent to the
return from a covered call trading strategy.
4.1 Ex-Fee Return to Liquidity Providers, Ri
P&L
In the absence of trading fees, providing liquidity for ETH-USDC in price interval i is equiv-
alent to investing in a portfolio of ETH and USDC except that the investor also faces a
loss-versus-rebalancing (LVR) cost. A generalized version of this insight has been demon-
strated previously for arbitrary AMMs (see Milionis et al. 2022); nonetheless, for complete-
ness, we begin by re-establishing the result in our specific context of a CPAMM DEX with
concentrated liquidity provision:
Proposition 4.1. Liquidity Provision Is Investing in ETH-USDC Portfolio
The instantaneous ex-fee return from providing liquidity to price interval i is given as follows:
dΠ‹
i,t
Π‹
i,t
“ ω‹
i,t
dPt
Pt
´
li,t
Π‹
i,t
dt (21)
where ω‹
i,t denotes the equilibrium proportion of the inventory invested in ETH:
ω‹
i,t “
ETH‹
i,t ˆ Pt
Π‹
i,t
“
ETH‹
i,t ˆ Pt
USDC‹
i,t ` ETH‹
i,t ˆ Pt
(22)
and li,t denotes the instantaneous loss-versus-rebalancing pLVRq, given explicitly as follows:
li,t “
$
’ ’ &
’ ’ %
L‹
i σ2
t
?
Pt
4
if Pt P rΨi,Ψi`1s
0 otherwise
(23)
18Explicitly, Equation (21) states that the instantaneous ex-fee liquidity provision return,
dΠ‹
i,t
Π‹
i,t
, evolves akin to an ETH-USDC portfolio with an ETH portfolio weight that equals
exactly the DEX inventory value of ETH as a proportion of the total DEX inventory value
(i.e., ω‹
i,t “
ETH‹
i,tˆPt
Π‹
i,t
). There is also a loss beyond the ETH-USDC portfolio instantaneous
return,
li,t
Π‹
i,t
, and this loss corresponds to the loss-versus-rebalancing (LVR) of Milionis et al.
(2022); the LVR loss occurs because arbitrage trades occur at the DEX at stale prices and
therefore impose losses on the liquidity providers.
To understand Proposition 4.1, it is important to recognize that liquidity providers for
price interval i are pro-rata owners of the inventory associated with that price interval. Thus,
the ex-fee return for providing liquidity for a price interval of ETH-USDC corresponds to
the return from an ETH-USDC portfolio because the inventory for that price interval is a
combination of ETH and USDC. In particular, as per Equation (21), an investor providing
liquidity for price interval i experiences an instantaneous return,
dΠ‹
i,t
Π‹
i,t
, proportional to instan-
taneous ETH returns, dPt
Pt
, exactly to the extent that ETH is weighted within the inventory
for price interval i, ω‹
i,t.
Having shown that liquidity provision returns are akin to investment in an ETH-USDC
portfolio, we next turn to clarifying the nature of that ETH-USDC portfolio in the context
of a DEX with concentrated liquidity provision. To that end, we find that the ETH portfolio
weighting, ω‹
i,t, is dynamic and more specifically that it depends negatively on the ETH-
USDC price, Pt. More explicitly, we establish the following result:
Proposition 4.2. ETH Portfolio Weight Declines Monotonically From Unity to Zero
When the ETH-USDC price level is below the price interval pi.e., Pt ă Ψiq, then the liquidity
portfolio is equivalent to holding ETH directly:
Pt ă Ψi ùñ ω‹
i,t “ 1 (24)
19When the ETH-USDC price level is within the price interval pi.e., Pt P rΨi,Ψi`1sq, then
the liquidity portfolio is equivalent to holding an ETH-USDC portfolio with dynamic weight-
ing:
Pt P rΨi,Ψi`1s ùñ ω‹
i,t “ ω‹
i pPtq (25)
where ω‹
i : rΨi,Ψi`1s ÞÑ r0,1s is a continuous and monotonically decreasing function that
satisfies ω‹
i pΨiq “ 1 and ω‹
i pΨi`1q “ 0.
When the ETH-USDC price level is above the price interval pi.e., Pt ą Ψi`1q, then the
liquidity portfolio is equivalent to holding USDC directly:
Pt ą Ψi`1 ùñ ω‹
i,t “ 0 (26)
Proposition 4.2 establishes not only that the ETH portfolio weight, ω‹
i,t, is dynamic but
also that the ETH portfolio weight specifically evolves as a decreasing function of the ETH-
USDC price, Pt. In more detail, the ETH portfolio weight is unity when the ETH-USDC
price is fully below the interval but then declines continuously to zero as the ETH-USDC
price moves through the interval and finally remains zero thereafter when the ETH-USDC
price is fully above the interval. It is noteworthy that this result would not hold if we were
to assume uniform liquidity provision; more explicitly, under uniform liquidity provision and
a CPAMM (e.g., Uniswap V1 and V2), ω‹
i,t is constant and does not depend on Pt (see, e.g.,
Angeris et al. 2021).5
To understand Proposition 4.2, it is important to recognize that increases in the ETH-
USDC price lead to net buying of ETH at the DEX and that net buying of ETH at the
DEX reduces the proportion of ETH inventory held by the DEX. To provide more context,
5
To provide additional context, a CPAMM is a special case within a broader class of AMMs known as
Geometric Mean Market Makers (G3Ms). Notably, under uniform liquidity provision, all G3Ms possess
static portfolio weights (see, e.g., Angeris and Chitra 2020 and Evans 2021). Proposition 4.2 demonstrates
that this static portfolio weights result does not hold under concentrated liquidity thereby highlighting an
important difference between uniform liquidity and concentrated liquidity.
20recall that the DEX employs a mechanical pricing function (i.e., CPAMM) and that this
mechanical pricing function does not directly incorporate innovations in public information.
Thus, when a positive innovation generates an increase in the ETH-USDC price away from
the DEX, an arbitrage opportunity arises whereby traders can momentarily buy at stale
ETH-USDC prices from the DEX and sell at the new higher ETH-USDC prices away from
the DEX.6
In turn, this arbitrage trading represents net ETH buying at the DEX which
reduces the ETH weight in the liquidity portfolio. More concretely, the reduction in the
ETH portfolio weight arises from the ETH buy trade because a trade that buys ETH at the
DEX is implemented as an ETH-USDC swap where the trader receives ETH inventory from
the DEX in return for providing payment as USDC inventory to the DEX, thereby lowering
the liquidity portfolio ETH weight.
## 4.2 Comparative Insights Regarding LP Returns
We next turn to examining how providing liquidity at a DEX with concentrated liquidity
provision compares to investing directly in ETH or USDC. Our first result in that regard,
Proposition 4.3, highlights that, in the absence of fees, providing liquidity at a DEX with
concentrated liquidity provision is always dominated either by investing directly in ETH or
by investing directly in USDC:
Proposition 4.3. Ex-Fee LP Return Is Dominated by ETH or USDC
For any price interval i that is above the initial price level pi.e., Ψi ě P0q, the ex-fee realized
return is lower than then realized return from investing in ETH directly:
Ri
P&L ď
PT
P0
“: RETH
(27)
Moreover, for any price interval i that is below the initial price level pi.e., Ψi`1 ď P0q,
the ex-fee realized return is lower than the realized return from investing in USDC directly:
6
This stale price arbitrage trading was first studied by Capponi and Jia (2021).
21Ri
P&L ď 1 “: RUSDC
(28)
Moreover, ErRi
P&Ls ă ErRETH
s for any price interval i.
To provide more detail, Proposition 4.3 establishes that the realized return from investing
in ETH always exceeds the ex-fee realized return from liquidity provision to any price interval
above the initial ETH-USDC price (Equation 27), and the realized return from holding USDC
always exceeds the ex-fee realized return from liquidity provision to any price interval below
the initial ETH-USDC price (Equation 28). In order to explain these results, we first show
(via Propositions 4.4 and 4.5) that the returns on the liquidity portfolio for a given price
interval are higher for price intervals further away from the initial ETH-USDC price. Then,
Proposition 4.3 is derived from the fact that investing in a price interval infinitely far above
the current ETH-USDC price is equivalent to investing directly in ETH while investing in
a price interval infinitely far below the current ETH-USDC price is equivalent to holding
USDC.
Proposition 4.4. Ex-Fee LP Return Increases Above The Money, Converges to ETH Return
For any two price intervals i ą j such that the smaller price interval is above the initial price
level pi.e., Ψj ě P0q, then the ex-fee realized return of the higher price interval exceeds that
of the lower price interval:
Ri
P&L ě Rj
P&L (29)
Moreover, the ex-fee realized return for providing liquidity to a price interval i converges
to the return from investing directly in ETH as the interval becomes arbitrarily far above the
initial price level pi.e., i Ñ 8q:
lim
iÑ8
Ri
P&L “
PT
P0
“ RETH
(30)
22Proposition 4.4 finds that, when comparing two price intervals i ą j above the initial
ETH-USDC price (i.e., Ψj ě P0), then the realized ex-fee return for providing liquidity to
the higher interval always exceeds that for providing liquidity to the lower interval (i.e.,
Ri
P&L ě Rj
P&L). Proposition 4.4 also finds that the ex-fee realized return for providing
liquidity to price intervals above the initial ETH-USDC price converges to the ETH return
as the interval being examined becomes infinitely far above the initial ETH-USDC price (i.e.,
lim
iÑ8
Ri
P&L “ RETH
).
The first part of Proposition 4.4 arises because the ETH portfolio weights for any pair
of price intervals above the initial ETH-USDC price can differ only when the ETH-USDC
price is above its initial level. Moreover, a higher price interval possesses a higher ETH
portfolio weight in general and thus generates a higher realized return because it incurs
a larger gain whenever the ETH price increases. To provide more depth, Proposition 4.2
establishes that both price intervals possess ETH portfolio weights of unity when the ETH-
USDC price is below the intervals and ETH portfolio weights of zero when the ETH-USDC
price is above the intervals. In turn, the ETH portfolio weights for the pair of price intervals
differ only when the ETH-USDC price is above the lower bound of the smaller interval but
below the upper bound of the larger interval. Since Proposition 4.4 examines only price
intervals above the initial ETH-USDC price, the ETH portfolio weights for such intervals
differ only in cases that the ETH-USDC price increases due to the fact that entering either
price interval requires an ETH-USDC price increase. Then, because the higher price interval
possesses a higher ETH portfolio weight always, the higher price interval therefore always
realizes a higher return. Intuitively, the higher price interval is more exposed to ETH when
ETH-USDC prices increase and thus it incurs larger gains and realizes a higher return.
The second part of Proposition 4.4 arises because the ETH portfolio weight is unity
when the ETH-USDC price is below the price interval. Thus, an ETH-USDC portfolio with
a weight of unity on ETH is a portfolio of only ETH and therefore equivalent to holding ETH
directly. Then, since the ETH-USDC price never reaches a price interval infinitely far above
23the current price level, that limiting price interval possesses an ETH portfolio weight of unity
with probability one and consequently providing liquidity to that interval is equivalent to
holding ETH directly.
Proposition 4.5. Ex-Fee LP Return Decreases Below The Money, Converges to USDC Return
For any two price intervals i ą j such that the larger price interval is fully below the initial
price level pi.e., Ψi`1 ď P0q, then the ex-fee realized return of the lower price interval exceeds
that of the higher price interval:
Rj
P&L ě Ri
P&L (31)
Moreover, the ex-fee realized return for providing liquidity to a price interval i converges
to the return from holding USDC directly as the interval becomes arbitrarily far below the
initial price level pi.e., i Ñ ´8q:
lim
iÑ´8
Ri
P&L “ 1 “ RUSDC
(32)
As a consequence, ErRi
P&Ls ă ErRUSDC
s for any price interval i.
Proposition 4.5 finds that, when comparing two price intervals i ą j below the initial
ETH-USDC price (i.e., Ψi`1 ď P0), then the realized ex-fee return for providing liquidity
to the lower interval always exceeds that for providing liquidity to the higher interval (i.e.,
Rj
P&L ě Ri
P&L). Proposition 4.5 also finds that the ex-fee realized return for providing
liquidity to price intervals below the initial ETH-USDC price converges to the USDC return
as the interval being examined becomes infinitely far below the initial ETH-USDC price (i.e.,
lim
iÑ´8
Ri
P&L “ RUSDC
).
Similar to the intuition for Proposition 4.4, the first part of Proposition 4.5 arises because
the ETH portfolio weights for any pair of price intervals below the initial ETH-USDC price
differ only when the ETH-USDC price is below its initial level; additionally, the lower price
interval possesses a lower ETH portfolio weight and thus the lower price interval incurs a
24higher realized return because it incurs a smaller loss from an ETH price decrease. To provide
more depth, Proposition 4.2 establishes that both price intervals possess ETH portfolio
weights of unity when the ETH-USDC price is below the intervals and ETH portfolio weights
of zero when the ETH-USDC price is above the intervals. As a consequence, the ETH
portfolio weights for the pair of price intervals differ only when the ETH-USDC price is below
the upper bound of the higher interval but above the lower bound of the lower interval. Since
Proposition 4.5 examines only price intervals below the initial ETH-USDC price, the ETH
portfolio weights for such intervals differ only in cases that the ETH-USDC price decreases
due to the fact that entering either price interval requires an ETH-USDC price decrease.
Then, because the lower price interval possesses a lower ETH portfolio weight always (see
Proposition 4.2), the lower price interval therefore always realizes a higher return. Intuitively,
the lower price interval is less exposed to ETH when ETH-USDC prices decline and thus it
faces smaller losses and realizes a higher return.
The second part of Proposition 4.5 arises because the ETH portfolio weight is zero when
the ETH-USDC price is above the price interval (see Proposition 4.2) and also because
the ETH-USDC price at liquidation is above the price interval infinitely far below with
probability one. Notably, an ETH-USDC portfolio with a weight of zero on ETH is a
portfolio of only USDC and thus equivalent to holding USDC directly. In turn, since the
ETH-USDC price never reaches a price interval that is infinitely far below the initial ETH-
USDC price, then the price interval infinitely far below possesses an ETH portfolio weight
of zero with probability one, implying that providing liquidity to that interval is equivalent
to holding USDC directly.
4.3 Equilibrium Liquidity Provision, Π‹
i,0
Our final set of results concerns equilibrium liquidity provision, Π‹
i,0. We begin by highlight-
ing that, in the absence of fees (i.e., ϕ “ 0), the equilibrium liquidity provision is zero for all
price intervals:
25Corollary 4.6. The Need For Fees at a DEX
If trading fees are zero pe.g., ϕ “ 0q, then liquidity provision is also zero:
ϕ “ 0 ùñ Π‹
i,0 “ 0 for all i (33)
Corollary 4.6 arises due to Proposition 4.3. In particular, since ex-fee realized returns from
liquidity provision are below realized returns for at least one other investment opportunity
(i.e., direct holding of ETH or USDC), DEX liquidity provision is therefore a dominated
strategy in the absence of fees. In turn, in the absence of fees, no investor would provide
liquidity to the DEX in equilibrium and there is a need for fees just as in the case of a DEX
with uniform liquidity provision (see, e.g., Hasbrouck et al. 2022).
Nonetheless, fees are non-zero in practice and Equation (16) characterizes equilibrium
liquidity provision for general fee levels. Unfortunately, Equation (16) is somewhat opaque
in general, so we offer an intuitive and easy to use approximate expression for liquidity
provision in our next result:
Proposition 4.7. Equilibrium Liquidity Provision as ∆ Ñ 0`
Given a fixed price level P, we consider an arbitrary sequence of price intervals, tip∆n,PqunPN,
such that lim
nÑ8
∆n “ 0 where each price interval is selected to contain P for each ∆ pi.e.,
P P rΨip∆,Pq,Ψip∆,Pq`1sq. In turn, we apply Proposition 3.1 to construct the associated liquid-
ity provision sequence, tΠ‹
ip∆n,PqunPN, and we thereby derive the limiting liquidity provision,
Π‹
pPq, for each price level, P, as follows:
Π‹
pPq :“ lim
∆Ñ0`
1
∆
Π‹
ip∆,Pq,0 “
$
’ ’ ’ &
’ ’ ’ %
ϕˆV ˆP0ˆ
T ş
0
fpp,tq dt
erT CpP,Tq
if P ě P0
ϕˆV ˆPˆ
T ş
0
fpp,tq dt
erT CpP,Tq´erT pP0´Pq
if P ă P0
(34)
where fpp,tq denotes the Q-measure density of pt :“ logpPtq and CpK,τq :“ e´rT
EQ
rpPτ ´
Kq`
s refers to the price for a European call option with ETH-USDC as the underlying, K
26as the strike price and τ as the time to maturity.
As a corollary, when the ETH-USDC price follows geometric Brownian motion pi.e.,
σt “ σ ą 0q, then the hypothesis of fpp,tq being continuous is met and Equation (34)
simplifies due to the following well-known results:
fpp,tq “ fN pp;p0 ` pr ´
σ2
2
qt,σ2
tq, CpK,τq “ P0 ¨ FN pd`q ´ K ¨ e´rτ
¨ FN pd´q (35)
where fN p¨;µ,vq refers to the density of a normal random variable with mean µ and variance
v, FN denotes the cumulative distribution function for a standard normal random variable
and d˘ is given explicitly as follows:
d˘ “
1
σ
?
τ
´
log
`P0
K
˘
`
`
r ˘
σ2
2
˘
τ
¯
(36)
Notably, ∆ is typically small in practice so that a simplified practical expression for
equilibrium liquidity provision can be deduced by considering the limiting case ∆ Ñ 0`
.
In particular, Proposition 4.7 can be applied to yield the following approximate value for
equilibrium liquidity provision for an arbitrary price interval i:
Π‹
i,0 « Π‹
´
Ppiq
¯
ˆ ∆ (37)
where Π‹
is given explicitly by Equation (34) and an arbitrarily chosen Ppiq P rΨi,Ψi`1s.
We suggest letting Ppiq correspond to the geometric average of the interval as follows:
Ppiq :“
a
ΨiΨi`1 (38)
To provide more detail, Proposition 4.7 fixes a price level, P P R`, and considers the
equilibrium liquidity provision, Π‹
in,0 :“ Π‹
ip∆n,Pq,0, for the price interval in :“ ip∆n,Pq con-
taining the price P when the DEX’s price grid is defined by an arbitrary ∆n ą 0. We
then construct an arbitrary sequence of t∆nunPN such that lim
nÑ8
∆n “ 0 and generate the
27corresponding equilibrium liquidity provision values, tΠ‹
ip∆n,Pq,0unPN where each equilibrium
liquidity provision value is determined as per our equilibrium solution Equation (16). Equa-
tion (34) provides the limit of such an arbitrary sequence (with the appropriate scaling by
1
∆
). Since ∆ is small in practice, we suggest using the well-defined limit point Π‹
pPq, after
reversing the scaling (i.e., multiply by ∆), to proxy for liquidity provision in practice. This
suggested process is implemented explicitly through Equations (37) and (38).
As a final point, the limiting case when the size of the price intervals vanish (i.e., ∆ Ñ 0`
)
is also useful to highlight the key economic channel driving liquidity provision returns at a
DEX with concentrated liquidity. To that end, recall that Proposition 4.2 establishes that
providing liquidity to the DEX entails holding exclusively ETH below the price interval to
which liquidity is provided and holding exclusively USDC above that price interval. Then,
as ∆ Ñ 0`
, each DEX price interval collapses to a single price level and thus the investment
profile from DEX liquidity provision becomes equivalent to that of holding ETH up to the
price level at which liquidity is provided and holding USDC beyond that price level. More
formally, the return from liquidity provision to the DEX for any price level is equivalent to
that from investing in ETH and selling an ETH-USDC European call option where the call
option possesses a strike equal to the price level at which liquidity is being provided and is
sold at its intrinsic value rather than its market value:
Proposition 4.8. Consider an arbitrary sequence of price intervals, tip∆n,PqunPN, such
that lim
nÑ8
∆n “ 0 where each price interval is selected to contain P for each ∆ pi.e., P P
rΨip∆,Pq,Ψip∆,Pq`1sq. Then, the ex-fee realized return for DEX liquidity provision converges
to that from holding ETH and selling an ETH-USDC European call option with a strike equal
to P if the call option is sold at its intrinsic value:
lim
∆Ñ0`
R
ip∆,Pq
P&L “
PT ´ CIpPT ,Pq
P0 ´ CIpP0,Pq
(39)
where CIpPt,Kq :“ pPt ´Kq`
denotes the intrinsic value of the call option where the intrin-
28sic value is defined as the payout from exercising an otherwise equivalent American option
immediately.
Note that the numerator of (39), PT ´CIpPT ,Pq, is equal to the pay-off from holding ETH
and shorting an ETH-USDC call option against that ETH position (i.e., a covered call). In
particular, the call option is characterized by the strike price P and the maturity T where P
represents the price level at which liquidity is being provided and T the investor’s investment
horizon. To provide more context, a liquidity provider receives the ETH price, PT , if the
ETH-USDC price ends below the level at which liquidity is provided (i.e., PT ă P). In that
case, the call option expires worthless (i.e., CIpPT ,Pq “ pPT ´ Pq`
“ 0 when PT ă P) and
thus the liquidity provider holds only ETH as per a covered call strategy. In the alternative
case that the terminal ETH-USDC price ends above the level at which liquidity is provided
(i.e., PT ą P) then the liquidity provider receives a pay-off equal to the strike price of P. In
this case, the call option is optimally exercised at strike price P and therefore the investor
is forced to sell her ETH in return for P units of USDC thereby generating the same pay-off
as a covered call strategy.7
## 5 Conclusion
We study optimal DEX liquidity provision when the DEX allows investors to concentrate
liquidity to pre-specified price intervals (e.g., Uniswap V3). Importantly, and in contrast
to a limit order book, providing concentrated liquidity to a DEX entails providing two-way
liquidity so that whenever an investor’s liquidity is utilized for an exchange, the investor au-
tomatically becomes a liquidity provider of the asset for which their liquidity was exchanged.
For this reason, providing liquidity for an ETH-USDC exchange entails investing in a port-
7
Note that the numerator of Equation (39) matches a covered call strategy pay-off but the denominator
in Equation (39) does not match the cost of initiating a covered call strategy. The reason for this is that, as
∆ Ñ 0`
, the DEX replicates the call option pay-off in a fashion similar to the “stop-loss start-gain” strategy
of Seidenverg (1988). Importantly, this strategy of replicating a call option does not entail paying the market
value of the call upfront but rather entails paying only the intrinsic value upfront and making additional
payments thereafter because the strategy is not self-financing (see Carr and Jarrow 1990 for details).
29folio of ETH and USDC with dynamic weights that evolve with the underlying ETH-USDC
price. This feature of DEXs with concentrated liquidity generates new trade-offs faced by
liquidity providers and therefore characterizes the level of expected fee revenue necessary
to incentivize liquidity provision to a particular price interval. In particular, we show that
without fees, providing liquidity to a particular price interval is always dominated by directly
investing in either ETH or USDC. Thus, for any given level of fee revenue, liquidity provi-
sion will adjust so that the pro-rata return from fees paid to that price interval offsets the
opportunity cost of investing in other assets (e.g., ETH or USDC). In turn, we characterize
the equilibrium liquidity provision and provide a simple approximate expression that can be
useful for empirical work and comparative statics given the opaque nature of the expression
for equilibrium liquidity provision in the general case.
30References
Angeris, G., and T. Chitra. 2020. Improved Price Oracles: Constant Function Market Mak-
ers. In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies,
AFT ’20, p. 80–91. New York, NY, USA: Association for Computing Machinery. URL
https://doi.org/10.1145/3419614.3423251.
Angeris, G., A. Evans, and T. Chitra. 2021. Replicating monotonic payoffs without oracles.
arXiv preprint arXiv:2111.13740 .
Aoyagi, J. 2020. Liquidity provision by automated market makers. Available at SSRN
3674178 .
Aoyagi, J., and Y. Ito. 2021. Coexisting Exchange Platforms: Limit Order Books and
Automated Market Makers .
Barbon, A., and A. Ranaldo. 2022. On The Quality Of Cryptocurrency Markets Centralized
Versus Decentralized Exchanges. Working Paper .
Biais, B., C. Bisière, M. Bouvard, and C. Casamatta. 2019. The Blockchain Folk Theorem.
Review of Financial Studies 32(5):1662–1715.
Caparros, B., A. Chaudhary, and O. Klein. 2023. Blockchain Scaling and Liquidity Concen-
tration on Decentralized Exchanges. Available at SSRN 4475460 .
Capponi, A., and R. Jia. 2021. The Adoption of Blockchain-based Decentralized Exchanges.
Columbia University Working Paper .
Carr, P. P., and R. A. Jarrow. 1990. The stop-loss start-gain paradox and option valuation: A
new decomposition into intrinsic and time value. The review of financial studies 3:469–492.
Chaudhary, A., R. Kozhan, and G. Viswanath-Natraj. 2023. Interest Rate Parity in Decen-
tralized Finance. WBS Finance Group Research Paper Forthcoming .
31Chiu, J., and T. V. Koeppl. 2022. The economics of cryptocurrency: Bitcoin and be-
yond. Canadian Journal of Economics/Revue canadienne d’économique 55:1762–1798.
URL https://onlinelibrary.wiley.com/doi/abs/10.1111/caje.12625.
Chiu, J., E. Ozdenoren, K. Yuan, and S. Zhang. 2022. On the Fragility of DeFi Lending.
Available at SSRN 4328481 .
Cong, L. W., and Z. He. 2019. Blockchain Disruption and Smart Contracts. Review of
Financial Studies 32(5):1754–1797.
Cong, L. W., Y. Li, and N. Wang. 2021. Tokenomics: Dynamic Adoption and Valuation.
Review of Financial Studies 34(3):1105–1155.
Easley, D., M. O’Hara, and S. Basu. 2019. From Mining to Markets: The Evolution of
Bitcoin Transaction Fees. Journal of Financial Economics 134(1):91–109.
Evans, A. 2021. Liquidity provider returns in geometric mean markets .
Hasbrouck, J., T. Rivera, and F. Saleh. 2022. The Need for Fees at a DEX: How Increases
in Fees Can Increase DEX Trading Volume. Working Paper .
Heimbach, L., E. Schertenleib, and R. Wattenhofer. 2022. Risks and returns of uniswap v3
liquidity providers. arXiv preprint arXiv:2205.08904 .
Huberman, G., J. D. Leshno, and C. Moallemi. 2021. Monopoly without a Monopolist: An
Economic Analysis of the Bitcoin Payment System. The Review of Economic Studies URL
https://doi.org/10.1093/restud/rdab014.
John, K., L. Kogan, and F. Saleh. 2023. Smart Contracts and Decentralized Finance. Annual
Review of Financial Economics Forthcoming.
John, K., M. O’Hara, and F. Saleh. 2022. Bitcoin and Beyond. Annual Review of Financial
Economics 14.
32Karatzas, I., and S. Shreve. 1991. Brownian motion and stochastic calculus, vol. 113. Springer
Science & Business Media.
Lehar, A., and C. Parlour. 2020. Miner Collusion and the BitCoin Protocol. Working Paper
.
Lehar, A., and C. Parlour. 2021. Decentralized Exchanges. Working Paper .
Lehar, A., and C. A. Parlour. 2022. Systemic fragility in decentralized markets. Available
at SSRN .
Lehar, A., C. A. Parlour, and M. Zoican. 2022. Liquidity Fragmentation on Decentralized
Exchanges. Available at SSRN 4267429 .
Makarov, I., and A. Schoar. 2022. Cryptocurrencies and decentralized finance (DeFi). Tech.
rep., National Bureau of Economic Research.
Mayer, S. 2022. Token-Based Platforms and Speculators. Working Paper .
Milionis, J., C. C. Moallemi, T. Roughgarden, and A. L. Zhang. 2022. Automated market
making and loss-versus-rebalancing. arXiv preprint arXiv:2208.06046 .
Neuder, M., R. Rao, D. J. Moroz, and D. C. Parkes. 2021. Strategic liquidity provision in
uniswap v3. arXiv preprint arXiv:2106.12033 .
Park, A. 2021. The Conceptual Flaws of Constant Product Automated Market Making.
University of Toronto Working Paper .
Rivera, T. J., F. Saleh, and Q. Vandeweyer. 2023. Equilibrium in a DeFi Lending Market.
Available at SSRN 4389890 .
Saleh, F. 2021. Blockchain Without Waste: Proof-of-Stake. Review of Financial Studies
34(3):1156–1190.
Seidenverg, E. 1988. A case of confused identity. Financial Analysts Journal 44:63–67.
33Appendices
A Proofs
A.1 Proof of Proposition 3.1
The Q-measure is such that all investments must generate the same expected return as the
risk-free investment (i.e., Equation 14 must hold). Then, applying Equations (6) and (13) to
Equation (14) yields Equation (15). Solving for Π‹
i,0 in Equation (15) then yields Equation
(16).
Equation (17) follows from applying the Q-expectation to Equation (12) and then apply-
ing Tonelli’s Theorem to interchange the expectation and the integral.
In order to derive Equations (18) and (19), note that the equilibrium value L‹
i does not
depend on time t. Therefore, setting t “ 0 and applying Equation (9) to Equation (8) then
implies that, in equilibrium,
Π‹
i,0 “ L‹
i
ˆ
p
b
P̃i,0 ´
a
Ψiq ` p
1
b
P̃i,0
´
1
?
Ψi`1
q ˆ P0
˙
which after rearranging gives our expression for L‹
i .
Finally, Equation (20) follows from applying the previous equilibrium solutions to Equa-
tion (9).
A.2 Proof of Proposition 4.1
Applying the equilibrium solutions from Proposition 3.1 to Equation (8) implies that equi-
librium liquidity for price interval i at time t, Π‹
i,t, can be written as a univariate function,
Π‹
i , of the time t price Pt as follows:
Π‹
i,t “ Π‹
i pPtq :“ USDC‹
i pPtq ` ETH‹
i pPtq ˆ Pt (A.1)
34with USDC‹
i pPtq and ETH‹
i pPtq denoting the equilibrium USDC and ETH holdings, written
explicitly as a function of the time t price Pt as follows:
USDC‹
i pPtq :“
´b
P̃i,t ´
a
Ψi
¯
ˆ Li, ETH‹
i pPtq :“
´ 1
b
P̃i,t
´
1
?
Ψi`1
¯
ˆ Li (A.2)
where P̃i,t denotes the projection of Pt onto rΨi,Ψi`1s as per Equation (10).
Note that Π‹
i pPtq is continuously differentiable everywhere but not twice continuously
differentiable everywhere. In particular, Π‹
i pPtq is not twice continuously differentiable at
Pt “ Ψi and Pt “ Ψi`1 even though it is twice continuously differentiable at all other points.
Then, since the hypothesis for the standard Ito’s lemma is not satisfied, we instead invoke a
generalized version of Ito’s lemma for functions twice continuously differentiable at all but
finitely many points (see Chapter 3.6 Section D of Karatzas and Shreve 1991):
dΠ‹
i,t “ dΠ‹
i pPtq “
dΠ‹
i
dPt
dPt `
1
2
d2
Π‹
i
dP2
t
drPt,Pts (A.3)
Notably, although we require a generalized version of Ito’s lemma, this generalized version
reduces to the form of the usual Ito’s lemma because Π‹
i is continuously differentiable even at
the two points at which the second derivative does not exist. Then, to proceed, we compute
the first derivative of Π‹
i ,
dΠ‹
i
dPt
explicitly as follows:
dΠ‹
i
dPt
“ ETH‹
i pPtq (A.4)
Furthermore, we compute the second derivative of Π‹
i ,
d2Π‹
i
dP2
t
, at all points where this
second derivative exists (i.e., when Pt ‰ Ψi,Ψi`1):
d2
Π‹
i
dP2
t
“
$
’ ’ &
’ ’ %
0 if Pt R rΨi,Ψi`1s
´
L‹
i
2
?
P3
t
if Pt P pΨi,Ψi`1q
(A.5)
35Then, Equations (A.4) - (A.5) imply that for Pt R rΨi,Ψi`1s, Equation (A.3) becomes:
dΠ‹
i,t “ ETH‹
i pPtq dPt “ ETH‹
i pPtq ˆ Pt
dPt
Pt
(A.6)
which, in turn, implies:
dΠ‹
i,t
Π‹
i,t
“
ETH‹
i pPtq ˆ Pt
Π‹
i,t
dPt
Pt
“ ω‹
i,t
dPt
Pt
(A.7)
which establishes Proposition 4.1 for Pt R rΨi,Ψi`1s.
Similarly, Equations (A.4) - (A.5) imply that for Pt P pΨi,Ψi`1q Equation (A.3) becomes:
dΠ‹
i,t “ ETH‹
i pPtq dPt ´
L‹
i
4
a
P3
t
drPt,Pts “ Pt ˆ ETH‹
i pPtq
dPt
Pt
´
L‹
i σ2
t
?
Pt
4
dt (A.8)
which, in turn, implies:
dΠ‹
i,t
Π‹
i,t
“
Pt ˆ ETH‹
i pPtq
Π‹
i,t
dPt
Pt
´
L‹
i σ2
t
?
Pt
4Π‹
i,t
dt “ ω‹
i,t
dPt
Pt
´
li,t
Π‹
i,t
dt (A.9)
thereby completing the proof.
A.3 Proof of Proposition 4.2
When Pt ă Ψi, Equation (20) implies USDC‹
i,t “ 0 and thus Pt ă Ψi ùñ ω‹
i,t “ 1, thereby
establishing Equation (24).
When Pt ą Ψi`1, Equation (20) implies ETH‹
i,t “ 0 and thus Pt ą Ψi`1 ùñ ω‹
i,t “ 0,
thereby establishing Equation (26).
For Pt P rΨi,Ψi`1s, Equation (20) implies that USDC‹
i,t “ USDC‹
i pPq :“
´?
P´
?
Ψi
¯
ˆ
L‹
i and ETH‹
i,t “ ETH‹
i pPq :“
´
1 ?
P
´ 1 ?
Ψi`1
¯
ˆ L‹
i which, in turn, establishes Equation
(25) whereby
36ω‹
i,t “ ω‹
i pPq :“
ETH‹
i pPq ˆ P
USDC‹
i pPq ` ETH‹
i pPq ˆ P
(A.10)
By direct verification, ω‹
i pΨiq “ 1, ω‹
i pΨi`1q “ 0 and moreover ω‹
i : rΨi,Ψi`1s is continu-
ous. To conclude the proof, we show that ω‹
i is monotonically decreasing. To establish that
result, we first note that
dω‹
i pPq
dP
ď 0 if and only if
d
dP
rETH‹
i pPq ˆ Ps ˆ USDC‹
i pPq ´
dUSDC‹
i pPq
dP
ETH‹
i pPq ˆ P ď 0
which after substituting the expression from Equation (20) and rearranging holds if and only
if
2
d
Ψi
Ψi`1
ď
c
Ψi
P
`
d
P
Ψi`1
(A.11)
Finally, in order to show that (A.11) always holds, note that P P rΨi,Ψi`1s implies
Ψi
P
, P
Ψi`1
P r0,1s. In turn, Ψi
P
ď
b
Ψi
P
and P
Ψi`1
ď
b
P
Ψi`1
and thus Ψi
P
` P
Ψi`1
ď
b
Ψi
P
`
b
P
Ψi`1
so that 2
b
Ψi
Ψi`1
ď Ψi
P
` P
Ψi`1
is a sufficient condition for inequality (A.11) to hold. Finally,
direct verification yields:
2
d
Ψi
Ψi`1
ď
Ψi
P
`
P
Ψi`1
ô
´c
Ψi
P
´
d
P
Ψi`1
¯2
ě 0 (A.12)
which completes the proof.
A.4 Lemma A.1
Lemma A.1. Price Interval Above Initial Price Level
For any price interval i such that Ψi ą P0, the following results hold:
(a) For PT ď Ψi, Ri
P&L “ PT
P0
(b) For PT ě Ψi`1, Ri
P&L “ Ψi
P0
?
1 ` ∆
(c) For PT P rΨi,Ψi`1s, Ψi
P0
ď Ri
P&L ď PT
P0
37Proof.
First note that whenever Ψi ą P0 then P̃i,0 “ Ψi and therefore, after substituting into
Equation (11), Ri
P&L is given explicitly as:
Ri
P&L “
´b
P̃i,T ´
?
Ψi
¯
`
´
1 ?
P̃i,T
´ 1 ?
Ψi`1
¯
ˆ PT
´
1 ?
Ψi
´ 1 ?
Ψi`1
¯
ˆ P0
(A.13)
Then, PT ď Ψi implies P̃i,T “ Ψi which, when applied to Equation (A.13), yields (a).
Similarly, PT ě Ψi`1 implies P̃i,T “ Ψi`1 which, when applied to Equation (A.13), yields
(b).
To establish (c), note that when PT P rΨi,Ψi`1s, then P̃i,T “ PT and thus Ri
P&L “
p Ri
P&LpPT q with the latter being given explicitly as follows:
p Ri
P&LpPT q “
´?
PT ´
?
Ψi
¯
`
´
1 ?
PT
´ 1 ?
Ψi`1
¯
ˆ PT
´
1 ?
Ψi
´ 1 ?
Ψi`1
¯
ˆ P0
(A.14)
Further, p Ri
P&L is differentiable with:
dp Ri
P&L
dP
“
1 ?
P
´ 1 ?
Ψi`1
1 ?
Ψi
´ 1 ?
Ψi`1
ˆ
1
P0
(A.15)
and thus PT P rΨi,Ψi`1s implies:
dp Ri
P&L
dP
P r0,
1
P0
s (A.16)
Further, p Ri
P&LpPT q is continuous and differentiable over the interval rΨi,Ψi`1s and therefore
by the mean value theorem, for any PT P pΨi,Ψi`1s there exists P1
P pΨi,Ψi`1s such that
p Ri
P&LpPT q ´ p Ri
P&LpΨiq “
dp Ri
P&L
dP
pP1
qpPT ´ Ψiq ď
1
P0
pPT ´ Ψiq
where the last inequality comes from the fact that
d p Ri
P&L
dP
ă 1
P0
. In addition,
d p Ri
P&L
dP
ě 0 implies
38that p Ri
P&LpPT q ě p Ri
P&LpΨiq “ Ψi
P0
and therefore Ψi
PT
ď Ri
P&L “
´
p Ri
P&LpPT q ´ p Ri
P&LpΨiq
¯
`
p Ri
P&LpΨiq ď PT
P0
as desired for (c).
A.5 Lemma A.2
Lemma A.2. Price Interval Below Initial Price Level
For any price interval i such that Ψi`1 ă P0, the following results hold:
(a) For PT ď Ψi, Ri
P&L “ PT
Ψi
?
1`∆
(b) For PT ě Ψi`1, Ri
P&L “ 1
(c) For PT P rΨi,Ψi`1s, 1 ?
1`∆
ď Ri
P&L ď 1
Proof.
First note that Ψi`1 ă P0 and Equation (11) imply that the Ri
P&L is given explicitly as
follows:
Ri
P&L “
´b
P̃i,T ´
?
Ψi
¯
`
´
1 ?
P̃i,T
´ 1 ?
Ψi`1
¯
ˆ PT
?
Ψi`1 ´
?
Ψi
(A.17)
Then, PT ď Ψi implies P̃i,T “ Ψi which, when applied to Equation (A.17), yields (a).
Similarly, PT ě Ψi`1 implies P̃i,T “ Ψi`1 which, when applied to Equation (A.17), yields
(b).
To establish (c), note that when PT P rΨi,Ψi`1s, then P̃i,T “ PT and thus Ri
P&L “
R
i
P&LpPT q with the latter function being given explicitly as follows:
R
i
P&LpPq “
´?
P ´
?
Ψi
¯
`
´
1 ?
P
´ 1 ?
Ψi`1
¯
ˆ P
?
Ψi`1 ´
?
Ψi
(A.18)
Note that R
i
P&L is differentiable with the derivative given explicitly as follows:
39dR
i
P&L
dP
“
1 ?
P
´ 1 ?
Ψi`1
?
Ψi`1 ´
?
Ψi
ě 0 (A.19)
In turn, PT P rΨi,Ψi`1s implies 1 ?
1`∆
“ R
i
P&LpΨiq ď Ri
P&L “ R
i
P&LpPT q ď R
i
P&LpΨi`1q
where R
i
P&LpΨiq ď R
i
P&LpPT q ď R
i
P&LpΨi`1q follows from the fact that R is a weakly
increasing function (i.e., Equation A.19). Finally, using the fact that R
i
P&LpΨiq “ 1 ?
1`∆
and
R
i
P&LpΨi`1q “ 1 we obtain (c).
A.6 Lemma A.3
Lemma A.3. Price Interval Contains the Initial Price Level
For any price interval i such that P0 P rΨi,Ψi`1s, the following results hold:
(a) For PT ď Ψi, PT
Ψi
?
1`∆
ď Ri
P&L ď PT
Ψi
(b) For PT ě Ψi`1, 1 ď Ri
P&L ď
?
1 ` ∆
(c) For PT P rΨi,Ψi`1s, 1 ?
1`∆
ď Ri
P&L ď
?
1 ` ∆
Proof.
As a preliminary step, we define a function, ΓpP,Ψi,Ψi`1q as follows:
ΓpP,Ψi,Ψi`1q “
´?
P ´
a
Ψi
¯
`
´ 1
?
P
´
1
?
Ψi`1
¯
ˆ P (A.20)
Then, note that:
BΓ
BP
“
1
?
P
´
1
?
Ψi`1
(A.21)
and thus P ď Ψi`1 implies that BΓ
BP
ě 0.
We now turn to deriving (a). In particular, whenever PT ď Ψi and P0 P rΨi,Ψi`1s, then
40Ri
P&L can be written as follows:
Ri
P&L “
´
1 ?
Ψi
´ 1 ?
Ψi`1
¯
ˆ PT
ΓpP0,Ψi,Ψi`1q
(A.22)
and thus, when PT ď Ψi the fact that BΓ
BP
ě 0 for P ď Ψi`1 and P0 P rΨi,Ψi`1s implies that:
´
1 ?
Ψi
´ 1 ?
Ψi`1
¯
ˆ PT
ΓpΨi`1,Ψi,Ψi`1q
ď Ri
P&L ď
´
1 ?
Ψi
´ 1 ?
Ψi`1
¯
ˆ PT
ΓpΨi,Ψi,Ψi`1q
(A.23)
which, by direct verification, is equivalent to (a):
PT
Ψi
?
1 ` ∆
ď Ri
P&L ď
PT
Ψi
(A.24)
To prove (b), note that when PT ě Ψi`1 and P0 P rΨi,Ψi`1s, then Ri
P&L can be written
as follows:
Ri
P&L “
?
Ψi`1 ´
?
Ψi
ΓpP0,Ψi,Ψi`1q
(A.25)
and thus, when PT ě Ψi`1, the fact that BΓ
BP
ě 0 for P0 ď Ψi`1 and P0 P rΨi,Ψi`1s implies:
?
Ψi`1 ´
?
Ψi
ΓpΨi`1,Ψi,Ψi`1q
ď Ri
P&L ď
?
Ψi`1 ´
?
Ψi
ΓpΨi,Ψi,Ψi`1q
(A.26)
which, by direct verification, is equivalent to (b):
1 ď Ri
P&L ď
?
1 ` ∆ (A.27)
Finally, to establish (c), note that when PT P rΨi,Ψi`1s and P0 P rΨi,Ψi`1s, then Ri
P&L can
be written as follows:
Ri
P&L “
ΓpPT ,Ψi,Ψi`1q
ΓpP0,Ψi,Ψi`1q
(A.28)
and thus, when PT P rΨi,Ψi`1s, the fact that BΓ
BP
ě 0 for P ď Ψi`1 and P0 P rΨi,Ψi`1s
41implies:
ΓpΨi,Ψi,Ψi`1q
ΓpΨi`1,Ψi,Ψi`1q
ď Ri
P&L ď
ΓpΨi`1,Ψi,Ψi`1q
ΓpΨi,Ψi,Ψi`1q
(A.29)
which, by direct verification, is equivalent to (c):
1
?
1 ` ∆
ď Ri
P&L ď
?
1 ` ∆ (A.30)
A.7 Proof of Proposition 4.3
The first part of the proof, Equation (27), is implied by Lemma A.1. The second part of the
proof, Equation (28), is implied by Lemma A.2.
A.8 Proposition 4.4
By assumption, both price interval i and j satisfy the conditions of Lemma A.1 (i.e., Ψi ą
Ψj ě P0). In turn, the first part of this result, Equation (29), follows directly from Lemma
A.1. More explicitly, when PT ă Ψj ă Ψi, Lemma A.1 (a) implies Ri
P&L “ Rj
P&L “ PT
P0
;
when PT P rΨj,Ψj`1s, Lemma A.1 (a) and (c) imply Rj
P&L ď PT
P0
“ Ri
P&L; finally, when
PT ą Ψj`1, Lemma A.1 (a) - (c) implies Rj
P&L “
Ψj
P0
?
1 ` ∆ ď
Ψj`1
P0
ď mintPT
P0
, Ψi
P0
u. Finally,
note that Ri
P&L ě mintPT
P0
, Ψi
P0
u as when PT ă Ψi then Ri
P&L “ PT
P0
“ mintPT
P0
, Ψi
P0
u, when
PT P rΨi,Ψi`1s then Ri
P&L “ Ψi
P0
?
1 ` ∆ ě Ψi
P0
“ mintPT
P0
, Ψi
P0
u, and when PT ą Ψi`1 then
Ri
P&L ě Ψi
P0
“ mintPT
P0
, Ψi
P0
u. Thus, we have shown that Rj
P&L ď mintPT
P0
, Ψi
P0
u ď Ri
P&L.
For the second part of the result, Equation (27), we derive it explicitly as follows:
Pplim
iÑ8
Ri
P&L “ PT
P0
q ě Pp
8 Ť
N“1
8 Ş
i“N
tRi
P&L “ PT
P0
uq ě Pp
8 Ť
N“1
8 Ş
i“N
tPT ă Ψiuq “ lim
NÑ8
Pp
8 Ş
i“N
tPT ă
Ψiuq “ lim
NÑ8
PpPT ă ΨNq “ PpPT ă 8q “ 1 where the second inequality holds due to
Lemma A.1.
42A.9 Proposition 4.5
By assumption, both price intervals i and j satisfy the conditions of Lemma A.2 (i.e., Ψj`1 ă
Ψi`1 ď P0). In turn, the second part of this result, Equation (31), follows directly from
Lemma A.2. More explicitly, when PT ą Ψi`1, Lemma A.2 (b) implies Ri
P&L “ Rj
P&L “ 1;
when PT P rΨi,Ψi`1s, Lemma A.2 (b) and (c) imply Ri
P&L ď 1 “ Rj
P&L; when PT P
rΨj`1,Ψis, Lemma A.2 (a) and (c) imply Ri
P&L “ PT
Ψi
?
1`∆
ď 1 ?
1`∆
ď 1 “ Rj
P&L; finally,
when PT ă Ψj`1, Lemma A.2 (a) implies Ri
P&L “ PT
Ψi
?
1`∆
ď PT
Ψj
?
1`∆
“ Rj
P&L.
For the second part of the result, Equation (28), we derive it explicitly as follows:
Pp lim
iÑ´8
Ri
P&L “ 1q ě Pp
8 Ť
N“1
8 Ş
i“N
tR´i
P&L “ 1uq ě Pp
8 Ť
N“1
8 Ş
i“N
tPT ą Ψ´i`1uq “ lim
NÑ8
Pp
8 Ş
i“N
tPT ą
Ψ´i`1uq “ lim
NÑ8
PptPT ą Ψ´N`1uq “ PpPT ą ´8q “ 1 where the second inequality holds
due to Lemma A.2.
A.10 Lemma A.4
Lemma A.4. Limiting Fee Level
For any price level P ą 0, let p :“ logpPq. Then, the following result holds:
lim
∆Ñ0`
1
∆
T ż
0
QpPt P rΨip∆,Pq,Ψip∆,Pq`1sq dt “
T ż
0
fpp,tq dt (A.31)
where ip∆,Pq is such that P P rΨip∆,Pq,Ψip∆,Pq`1s for all ∆ ą 0.
Proof.
Let ψip∆,Pq :“ logpΨip∆,Pqq and let δ :“ logp1 ` ∆q. Then:
T ş
0
QpPt P rΨip∆,Pq,Ψip∆,Pq`1sq dt “
T ş
0
ψip∆,Pq`δ ş
ψip∆,Pq
fpp,tq dp dt
In turn, continuity of fpp,tq in its first argument implies:
431
δ
T ş
0
QpPt P rΨip∆,Pq,Ψip∆,Pq`1sq dt “
T ş
0
fppip∆,Pq,tq dt
where pip∆,Pq P rψip∆,Pq,ψip∆,Pq ` δs Ď rp ´ δ,p ` δs.
Finally, note that ∆ Ñ 0`
ô δ Ñ 0`
and thus:
lim
∆Ñ0`
1
∆
T ş
0
QpPt P rΨip∆,Pq,Ψip∆,Pq`1sq dt
“ lim
∆Ñ0`
∆
logp1`∆q
ˆ lim
δÑ0`
1
δ
T ş
0
QpPt P rΨip∆,Pq,Ψip∆,Pq`1sq dt
“ lim
δÑ0`
T ş
0
fppip∆,Pq,tq dt
“
T ş
0
lim
δÑ0`
fppip∆,Pq,tq dt
“
T ş
0
fpp,tq dt
The second-to-last line follows from the Bounded Convergence Theorem, whereas the last
line follows from continuity of fpp,tq and pip∆,Pq P rp´δ,p`δs for all δ. To provide more de-
tail on the former, note that limsup
∆Ñ0`
T ş
0
|fppip∆,Pq,tq| dt ă SˆT ă 8 where S :“ maxtfpρ,τq :
ρ P rp´ε,p`εs,τ P r0,Tsu ă 8 for any ε ą 0 and where the existence of a finite maximum
follows from continuity of fpp,tq.
A.11 Lemma A.5
Lemma A.5. Limiting Ex-Fee Portfolio Value
For any price level P ą 0, the following result holds for any t P r0,1s:
lim
∆Ñ0`
Π‹
ip∆,Pq,t
L‹
i
´?
1 ` ∆ ´ 1
¯ “
$
’ ’ &
’ ’ %
Pt ?
P
if Pt ă P
?
P if Pt ě P
(A.32)
where ip∆,Pq is such that P P rΨip∆,Pq,Ψip∆,Pq`1s for all ∆ ą 0.
44Proof.
For Pt ă P, the result arises by direct verification, applying Equation (20) to Equation (8):
lim
∆Ñ0`
Π‹
ip∆,Pq,t
L‹
i
´
?
1`∆´1
¯ “ lim
∆Ñ0`
´
1 ?
Ψip∆,Pq
´ 1 ?
Ψip∆,Pq`1
¯
ˆPt
?
1`∆´1
“ lim
∆Ñ0`
Pt ?
Ψip∆,Pq`1
“ Pt ?
P
For Pt ą P, the result also arises directly, by applying Equation (20) to Equation (8):
lim
∆Ñ0`
Π‹
ip∆,Pq,t
L‹
i
´
?
1`∆´1
¯ “ lim
∆Ñ0`
?
Ψip∆,Pq`1´
?
Ψip∆,Pq
?
1`∆´1
“ lim
∆Ñ0`
a
Ψip∆,Pq “
?
P
For the case of Pt “ P, it is useful to define Π̃pX,Ψi,Ψi`1q as follows:
Π̃pX,Ψi,Ψi`1q :“
´?
X ´
a
Ψi
¯
`
´ 1
?
X
´
1
?
Ψi`1
¯
ˆ X (A.33)
Direct inspection reveals
Π‹
ip∆,Pq,t
L‹
i
“ Π̃pPt,Ψip∆,Pq,Ψip∆,Pq`1q and also that BΠ̃
BX
ě 0 when-
ever X ď Ψi`1. In turn, we have the following result:
Π̃pΨip∆,Pq,Ψip∆,Pq,Ψip∆,Pq`1q ď
Π‹
ip∆,Pq,t
L‹
i
ď Π̃pΨip∆,Pq`1,Ψip∆,Pq,Ψip∆,Pq`1q (A.34)
Moreover, applying Π̃pΨip∆,Pq,Ψip∆,Pq,Ψip∆,Pq`1q “
´
1 ?
Ψip∆,Pq
´ 1 ?
Ψip∆,Pq`1
¯
ˆ Ψip∆,Pq “
´?
1 ` ∆ ´ 1
¯
Ψip∆,Pq
?
Ψip∆,Pq`1
and Π̃pΨip∆,Pq`1,Ψip∆,Pq,Ψip∆,Pq`1q “
a
Ψip∆,Pq`1 ´
a
Ψip∆,Pq “
´?
1 ` ∆ ´ 1
¯a
Ψip∆,Pq to Equation (A.34) and taking the limit as ∆ Ñ 0`
completes the
proof as follows:
?
P “ lim
∆Ñ0`
Ψip∆,Pq
a
Ψip∆,Pq`1
ď lim
∆Ñ0`
Π‹
ip∆,Pq,t
L‹
i
´?
1 ` ∆ ´ 1
¯ ď lim
∆Ñ0`
a
Ψip∆,Pq “
?
P (A.35)
45A.12 Lemma A.6
Lemma A.6. Limiting Ex-Fee Portfolio Return
For any price level P ą 0, the following result holds:
lim
∆Ñ0`
R
ip∆,Pq
P&L “
mintPT ,Pu
mintP0,Pu
“
PT ´ pPT ´ Pq`
mintP0,Pu
“
P ´ pP ´ PT q`
mintP0,Pu
(A.36)
where ip∆,Pq is such that P P rΨip∆,Pq,Ψip∆,Pq`1s for all ∆ ą 0.
Proof.
Equation (7) yields:
R
ip∆,Pq
P&L “
Π‹
ip∆,Pq,T
Π‹
ip∆,Pq,0
“
Π‹
ip∆,Pq,T
L‹
i
`?
1`∆´1
˘
Π‹
ip∆,Pq,0
L‹
i
`?
1`∆´1
˘
Taking ∆ Ñ 0`
and applying Lemma A.5 then implies the result:
lim
∆Ñ0`
R
ip∆,Pq
P&L “ lim
∆Ñ0`
Π‹
ip∆,Pq,T
L‹
i
`?
1`∆´1
˘
Π‹
ip∆,Pq,0
L‹
i
`?
1`∆´1
˘
“
lim
∆Ñ0`
Π‹
ip∆,Pq,T
L‹
i
`?
1`∆´1
˘
lim
∆Ñ0`
Π‹
ip∆,Pq,0
L‹
i
`?
1`∆´1
˘
“ mintPT ,Pu
mintP0,Pu
where the last equality follows by direct verification.
A.13 Lemma A.7
Lemma A.7. Limiting Ex-Fee Expected Return
For any price level P ą 0, the following result holds:
lim
∆Ñ0`
EQ
rR
ip∆,Pq
P&L s “
P0erT
´ erT
CpP,Tq
mintP0,Pu
(A.37)
where ip∆,Pq is such that P P rΨip∆,Pq,Ψip∆,Pq`1s for all ∆ ą 0 and CpK,τq :“ e´rT
EQ
rpPτ ´
Kq`
s refers to the price of a European call option with ETH-USDC as the underlying, K as
the strike price and τ as the time to maturity.
46Proof.
Lemmas A.1 - A.3 imply that for all ε ą 0:
limsup
∆Ñ0`
Ri
P&L ď p1 ` εq ˆ maxt
P
P0
,
?
1 ` ∆u ă 8 (A.38)
and thus the tail of tRi
P&Lu∆ is bounded so that the Bounded Convergence Theorem implies:
lim
∆Ñ0`
EQ
rR
ip∆,Pq
P&L s “ EQ
r lim
∆Ñ0`
R
ip∆,Pq
P&L s (A.39)
Moreover, Lemma A.6 further implies:
lim
∆Ñ0`
R
ip∆,Pq
P&L “
mintPT ,Pu
mintP0,Pu
“
PT ´ pPT ´ Pq`
mintP0,Pu
(A.40)
where the second equality follows from mintx,yu “ x ´ px ´ yq`
.
Finally, Equation (5) and Ere
1
2
T ş
0
σ2
t dWt
s ă 8 imply that Mt :“ e´rt
Pt is a Q-martingale
and thus EQ
rPT s “ erT
EQ
rMT s “ erT
M0 “ erT
P0. In turn, Equations (A.39) and (A.40)
imply the desired result:
lim
∆Ñ0`
EQ
rR
ip∆,Pq
P&L s “
EQ
rPT s ´ EQ
rpPT ´ P0q`
s
mintP0,Pu
“
P0erT
´ erT
CpP,Tq
mintP0,Pu
(A.41)
A.14 Proof of Proposition 4.7
This result follows directly from Lemmas A.4 and A.7.
47A.15 Proof of Proposition 4.8
Proof.
This follows directly from Lemma A.6. More explicitly:
lim
∆Ñ0`
R
ip∆,Pq
P&L “
mintPT ,Pu
mintP0,Pu
“
PT ´ pPT ´ Pq`
P0 ´ pP0 ´ Pq`
where the first equality is established by Lemma A.6 and the second equality follows from
the identity mintx,yu “ x ´ px ´ yq`
.
48