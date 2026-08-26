---
sha256: 2daad76d1b2dd921f4d789244d4cd6776fe345999d19b59650dabbb13dc89856
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 114231
---
Journal of Futures Markets
RESEARCH ARTICLE
Price Discovery and Efficiency in Uniswap Liquidity
Pools
Carol Alexander1,2
| Xi Chen1
| Jun Deng3
| Qi Fu4
1
University of Sussex Business School, Brighton, UK | 2
Exponential Science, London, UK | 3
China School of Banking and Finance, University of
International Business and Economics, Beijing, China | 4
Guanghua School of Management, Peking University, Beijing, China
Correspondence: Carol Alexander (c.alexander@sussex.ac.uk)
Received: 1 March 2024 | Revised: 3 January 2025 | Accepted: 21 April 2025
Funding: The research of Jun Deng is supported by the National Natural Science Foundation of China (Grant No. 72371073)
Keywords: automated market making | market efficiency | price discovery | transaction costs
ABSTRACT
Using almost three years of minute‐level data, we show that the efficiency of Uniswap v3 is much improved relative to v2, and
some v3 pools are approaching or even exceeding Bitstamp in terms of price discovery ability. Regression results suggest that the
channels of influence for these improvements are an increase in informed liquidity providers and swappers, who nevertheless
prefer to use centralized exchanges when markets become volatile. At such times, there are relatively more uninformed
speculative traders in all Uniswap pools, and cross‐exchange arbitrage activities become more prevalent. However, these
decrease the price discovery ability of Uniswap pools relative to Coinbase and Bitstamp. The informed traders that remain on
Uniswap during periods of high uncertainty tend to switch to the higher‐fee v3 pools to compensate for efficiency loss, or to v2
pools where there is sufficient liquidity to complete large trades.
JEL Classification: G14, D47
1 | Introduction
Crypto assets have very special trading features. There are two
completely different market making processes. On centralized
exchanges (CEXs), crypto prices are formed by standard limit
order book matching system, but decentralized exchanges
(DEXs) normally use a novel type of automatically managed
liquidity pool, governed by smart contracts, to set price via an
automated market making design (AMM), which enables direct
peer‐to‐peer crypto transactions.
There are hundreds of CEXs, and all but a handful are
unregulated by market authorities. For this reason, they can—
and do—operate very differently from traditional exchanges for
securities, commodities, or derivatives. There is little or no
independent risk management oversight or even attempts to
separate activities on most crypto CEXs.1
The recent collapse of
FTX is a good illustration of the problems. The event was
triggered by a report from CoinDesk in early November 2022,
which pointed out the potential leverage and solvency concerns
regarding Alameda Research, an FTX‐affiliated trading firm.
Immediately, FTX lost billions in its valuation, followed by a
liquidity crisis, eventually leading to its bankruptcy. Because
activities on CEXs are highly anonymous and difficult to trace,
price and volume manipulation are common (Cong et al. 2023;
Gandal et al. 2018).2
Most leading crypto CEXs apply know‐
your‐customer rules and take custody of traders' assets to
facilitate order matching. Hence, both the funds and private
information of their clients are prone to intermediary defaults,
privacy leaks, or blockchain wallet hackers. Examples of such
incidents are common.3
The rising popularity of DEXs stems from all these concerns.
Although the trading volume is still less than that of CEXs,
This is an open access article under the terms of the Creative Commons Attribution License, which permits use, distribution and reproduction in any medium, provided the original work is properly
cited.
© 2025 The Author(s). The Journal of Futures Markets published by Wiley Periodicals LLC.
1023 of 1087 Journal of Futures Markets, 2025; 45:1023–1048
https://doi.org/10.1002/fut.22593DEXs resolve many of the challenges currently faced by CEXs.
Indeed, the completely different order matching and trade
management procedures have many implications for operational
management. Because every transaction must be recorded on a
blockchain, trading volume is limited by the speed of the
blockchain. Most pools use the Ethereum chain, which currently
adds about one block every 12 seconds (see Etherscan), but other
chains or layer 2 solutions are possible. The leading DEX
Uniswap currently allows pools to employ Arbitum, Base, BNB
Chain, Celo, Optimism, Polygon, and Ethereum. Because of the
speed limitation associated with blockchain transparency, it is
difficult for DEX market participants to engage in wash trading
(volume inflation) because gas fees must be paid for each
transaction (Han et al. 2023).4
Also, unlike a CEX, there is no
need for custody on a DEX, where tokens remain in users'
wallets and are never stored by any intermediary. Consequently, the
security and privacy issues of centralized control are eliminated,
making transactions more transparent and safe.5
Indeed, Han et al.
(2023) show that DEXs can gain investors' trust because of their
ability to aggregate the consensus of a token's value when it is not
feasible for the token's trading structure to be underwritten by a
credible central party.
As of December 2024, the total value locked (TVL) in decen-
tralized finance was about 140 billion USD, with around 30
billion locked in DEXs.6
Figure 1 (left panel) shows that the
monthly spot trading volume on DEXs has been growing to
about 11% of the volume on CEXs. The right panel shows a
recent proliferation of DEXs, with about 35% of current trading
occurring on Uniswap. The major DEXs also serve as the price
oracle for decentralized applications, such as the popular peer‐
to‐peer lending platforms AAVE and Compound (Adams
et al. 2022). Indeed, DEXs are rapidly becoming one of the
central pillars of the decentralized finance ecosystem (Caldarelli
and Ellul 2021; Dave et al. 2021). It is therefore important for
academics and practitioners to understand their microstructure,
as we do in this paper.
Information dissemination of DEXs is still relatively slow, and as
trading volume grows, this could be severely hindered by the
limited speed of the blockchain consensus mechanisms. So, as
operational improvements in AMM protocols are made to increase
trading volume and attract more sophisticated traders, does a DEX
become more or less efficient? Could the price actually be slower
to respond, due to blockchain congestion? We answer this
question by investigating Uniswap's price discovery ability and
market efficiency. As well as comparing the main centralized and
decentralized markets for ether (ETH) spot trades, namely the
USDC‐ETH Uniswap v2 and v3 markets and the USD‐ETH Co-
inbase and Bitstamp markets, we also compare another 10
matching token pairs that are traded on these platforms.
Our main conclusions are as follows: (1) Uniswap markets have
lower levels of market efficiency compared with Coinbase and
Bitstamp; they play the role of “shock receiver” so their global
market influence is limited; (2) Informed traders prefer to use
centralized exchanges when markets become volatile. However,
trading volume increases during volatile periods, so more
speculators must be trading in the Uniswap pools during peri-
ods of high uncertainty. The basis between Uniswap and Co-
inbase or Bitstamp also has a predominately negative effect on
price discovery. Since this basis tends to widen during volatile
periods, fewer informed traders but a greater number of
uninformed traders are using Uniswap, e.g. for cross‐exchange
arbitrage, at these times; (3) The Uniswap v3 upgrade has much
improved price discovery ability relative to Uniswap v2, and the
price discovery ability of some Uniswap v3 pools can now even
exceed that of Bistamp; (4) Considering pools with different fee
structures, large trades decrease price discovery ability of the v3
(005) pools but increase price discovery of the larger v3 (030)
and v2 pools. Hence, informed traders choose to make large
trades on higher‐fee pools where there should be sufficient
liquidity to do the trade without too much slippage; (5) Re-
garding the inferior efficiency of high‐fee pools, when markets
are highly volatile the v3 liquidity provider needs to either (a)
widen their supply range, in which case the capital efficiency
decreases and the pool becomes more like the v2 pools, or (b)
change a narrow supply range more frequently, thus incurring
gas fees. Either action will decrease market efficiency.
In the following: Section 2 sets our work in the context of the
relevant literature; Section 3 describes the technological
improvements of Uniswap v3 compared with Uniswap v2 as
they relate to (a) capital efficiency and (b) market efficiency;
Section 4 describes our data and lists the statistical tests em-
ployed; Section 5 reports our empirical findings; and Section 6
concludes. An Appendix describes the statistical tests and
presents some supplementary empirical results. Our data
analysis is built using Python and R; all scripts are available
upon request.
FIGURE 1 | Spot trading volume on DEXs. Total DEXs monthly trading volume relative to that on CEXs (left panel; source: The Block) and
monthly trading volume shares between major DEXs (right panel; source: The Block).
1024 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License2 | Positioning in the Literature
Computer science is by far the most active of all the disciplines
focusing research on blockchain trading. However, whenever an
institution deploys its own capital for any length of time, it must
consider whether this capital is allocated in an optimal manner.
So this paper examines the development of the main decen-
tralized market for some major token pairs in terms of price
discovery and efficiency. These concepts have been applied to
traditional markets for many decades, using well‐known models
and metrics. They measure how quickly new information is
incorporated into asset prices, and how prices are transmitted
through different instruments on the same underlying assets.
More recent studies examine crypto markets, which have a much
more interesting microstructure because the same product can
be traded in many different venues. Several recent papers have
focused on the efficiency of CEXs, which, not surprisingly,
have become more efficient over time—see Krückeberg and
Scholz (2020), Alexander et al. (2020), Alexander et al. (2022),
and many others since. But relatively few studies have looked
into the market efficiency of DEXs. Angeris et al. (2021) show
that prices in the Uniswap market closely track the reference
prices in centralized markets. Barbon and Ranaldo (2021) show
that CEXs have better market quality than DEXs (in terms of
lower transaction costs and fewer deviations from the
no‐arbitrage condition), but they argue that improvements in
Uniswap v3 smart contracts can compensate for this lesser
market quality, to some extent. We also conduct a comparative
analysis of Uniswap markets relative to centralized exchanges,
under different smart contracts, and we go further—to examine
the drivers of the greatly increased efficiency more recently
found in v3. We also use a vector error correction model (VECM)
to examine how information is transmitted between CEXs
and DEXs, and we calculate spillover effects to gain a clearer
depiction of this transmission process. Lo and Medda (2021)
only examine the efficiency of Uniswap v2, and they employ
hourly data, which is not of sufficiently high frequency for a
VECM‐based price discovery analysis. We use minute‐level data
to examine the efficiency of both Uniswap v2 and v3 markets,
and compare the results with those from centralized exchanges
during the same time period.
Other relevant studies in the financial markets literature
include: Aoyagi (2020), Loesch et al. (2021) and Heimbach et al.
(2022b), who analyze the profits and losses of AMMs; Capponi
and Jia (2021), Neuder et al. (2021) and Lehar and Parlour
(2024), who analyze market‐making strategies on DEXs; and
Aigner and Dhaliwal (2021) and Deng et al. (2023), who
investigate risk management on DEXs; Capponi et al. (2023),
who study the emergence of private mining pools and its affect
on price discovery; Lehar et al. (2023), who analyze the impact
of gas fees and other transaction costs on liquidity provision
strategies; and Han et al. (2023), who investigate investors'
cross‐market arbitrage activities based on price spreads between
DEXs and CEXs and other effective information. Other studies
more closely related to our work include: Hansson (2024), who
analyses price discovery in constant product markets by dem-
onstrating the impact of large, medium and small trades made
by different types of traders of USDC‐ETH on Uniswap v2;
Entrop et al. (2020), who find that market uncertainty and trade
characteristics (costs, volume and size) all contribute to price
discovery of bitcoin in centralized spot and futures markets; and
Chen and Yang (2024), who find that relative liquidity, investor
structure and crypto hacking activities all contribute to the
bitcoin futures market's price discovery process.
We extend these lines of research by investigating the effect of
operational innovations—in terms of offering AMMs with a
choice of liquidity provision range, and liquidity pools with
different transactions costs—on the information content of
market prices and the price discovery ability of a Uniswap pool
in a global setting. We also analyze the effect of large trades and
different market conditions as determinants of each Uniswap
pool's market efficiency and price discovery ability, these
dependent variables being measured using well‐known models
and metrics. Our paper differs from Hansson (2024) by dem-
onstrating the inferior relative price discovery ability of Uni-
swap relative to major CEXs. In this sense, it complements
Klein et al. (2023), who examine the USDC‐ETH pools on
Uniswap v3 versus major CEXs. They investigate the price
impact of the flow of different types of orders, showing that by
following the liquidity providers' activities on Uniswap, traders
can place large limit orders on the CEXs, which create long‐
term price impacts.
Capponi et al. (2024) asks how information gets incorporated to
asset prices on DEXs, showing that informed traders bid higher
fees to execute their transactions and this may create relatively
long‐term price impacts; and in a similar vein, Mohan (2022)
argues that the unique AMM mechanisms of DEXs could be a
catalyst for a novel type of information transmission process,
which in turn could impact CEX prices. By contrast, we do not
ask how prices are formed in DEXs, and although it is poten-
tially interesting to study the microstructure of the Uniswap
market, in this paper, we investigate the role played by Uniswap
in ether price discovery, instead of having prices that simply
follow those formed on traditional CEX exchanges.
Another related strand of the finance literature looks at the
trading volume and the liquidity provision and/or taking on
DEXs. Park (2023) discusses the shortcomings of a deterministic
liquidity invariance rule in AMM market smart contracts,
including so‐called sandwich attacks, and Adams and Liao (2022)
highlight the advantages of Uniswap v3 over Uniswap v2 in
terms of returns and liquidity. Our research complements these
studies by comparing the informational inefficiency of both
DEXs under different AMM mechanisms. Additionally, we
reveal how improvements in smart contracts can increase both
trading volume and market liquidity. In the same vein, a recent
study by Hasbrouck et al. (2022) demonstrates that increasing
trading fees can reduce the price impact on a DEX, also pro-
posing a way to increase trading volume through smart contract
design. For instance, the coming Uniswap v4 introduces Hooks,
which bring greater composability and user flexibility while
significantly reducing gas fees (Adams et al. 2023). This further
innovation should attract greater trading volumes. Hasbrouck
et al. (2025) derive an equilibrium level of liquidity provision
within any given price interval and further demonstrate that
providing liquidity for risky and risk‐free assets (such as sta-
blecoins and native tokens) is analogous to investing in a port-
folio composed of both types of assets. Moving now to the other
type of DEX users, Cartea et al. (2023a) focus on optimizing the
1025 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licenselarge positions of a liquidity taker, developing trading strategies
suitable for AMM markets with more or less efficiency. Our price
discovery results also provide valuable insights for traders and
investors to use when formulating their strategies, but instead of
liquidity provision or taking, we uncover the potential for arbi-
trage opportunities between CEXs and DEXs. Like us, Cartea
et al. (2023b) find that CEX prices always lead DEX markets, but
we go further to look at the impact of information flows, the
influence of smart contract design on efficiency, and the drivers
of efficiency improvements.
3 | Uniswap Automated Market Making
Mechanisms
Trading on Uniswap requires first selecting a liquidity pool, or
pool for short. Every pool is linked to a token pair X Y ( , ), and
the pool price P of the token X in terms of another token Y
depends on the relative reserves of these two tokens in the pool,
in a manner determined by the AMM protocols deployed.
Uniswap also lists multiple pools for each pair, depending on:
(i) the smart‐contract blockchain used for validating transac-
tions; and (ii) the fee paid by traders swapping tokens in the
pool. In addition to trading fees, each user must pay the gas
fees, tips to miners for validation, for transactions that depend
on the blockchain chosen and the time‐varying traffic activity
levels on that blockchain.
Pools have two kinds of users, liquidity providers and
liquidity takers. Liquidity providers, from henceforth simply
providers, deposit simultaneously the two tokens in the ratio
determined by the current pool price. In return for deposit-
ing tokens, providers receive a crypto asset called a liquidity
token, which is minted via the DEX smart contract and could
be used as collateral elsewhere in the Defi ecosystem. When
a provider wishes to withdraw liquidity, he redeems the
liquidity token, which is then burned by the smart contract,
and the provider receives the original tokens in the ratio
determined by the pool price at the time of burning.
Liquidity takers pay a fee to providers to swap one token for
another. We term this type of user a swapper or taker for
short. Swapping alters the reserves ratio and thereby also the
pool price.
Uniswap currently allows users to trade on two updates to its
original (v1) smart contract protocol, namely v2 (launched on
May 19, 2020) and v3 (launched on May 5, 2021).7
They employ
different versions of a Constant Product Market Maker (CPMM)
mechanism. The general framework of CPMMs is described in
the white paper of Adams et al. (2021) and analyzed by Angeris
et al. (2021).8
The fundamental principle of any CPMM is to
maintain an invariant state in which the product of the quan-
tities of tokens deposited by providers is held constant. Consider
a pool with the quantity x of token X and the quantity y of
tokenY. The pool price P, namely the rate of exchange of token
Y for token X, is the ratio of their reserves, that is, ∕ P y x = .
One illustrative example is taking token Y as the stable coin
USDC as numéraire and token X as the more volatile crypto
ETH. Thus, the relative price of X increases as the reserves of X
decrease, and likewise for token Y.9
Uniswap v2 requires that
the product of the quantities of tokens X and Y should be
constant, and set according to the so‐called ‘bonding curve’, viz.
the hyperbola:
∈ ∞ xy L x y = , , (0, ), 2 (1)
where L is the liquidity supplied to the pool, which changes
every time a provider makes or withdraws supplies of the two
tokens, which must be done in the ratio determined by the
current pool price. Uniswap v2 is designed to provide liquidity
for any ∈ ∞ P (0, ) rather than prices that trade in some an-
ticipated finite range around the current price.
Now, suppose that the initial state of the v2 pool has x tokens of X
and y tokens ofY, and the trader wants to swap tokenY for token
X. Let us say that he wants to swap y Δ of the Y token for an
amount x Δ of the token X from the pool. The number of token X
becomes x x − Δ after this transaction. The swapper must pay a
proportional fee γ y Δ , which is automatically reinvested in the pool
for liquidity provision by the protocol design and is distributed to
providers only when they exit the pool.10
Thus, only an amount
γ y (1 − )Δ is used for token swapping. Put another way, the
swapper deposits y Δ into the pool and then the protocol divides this
into two parts, the amount γ y (1 − )Δ used for swapping—
according to the bonding curve—and the transaction fee γ y Δ ,
which is automatically reinvested into the pool only after the
transaction.11
Therefore, according to the bonding curve (1), we
must have
x x y γ y L ( − Δ )( + (1 − )Δ ) = . 2 (2)
Since the trading fee γ y Δ is automatically reinvested in the
pool, the total reserves of token Y after swapping is y y + Δ .
This way, the price changes from P to P′, where:
P
y y
x x
′ =
+ Δ
− Δ
.
We now introduce a novel way to measure liquidity for AMMs by
applying the traditional market liquidity measure of Kyle (1985) to
this analysis. That is, we take the price change from P to P′ and
divide this by the trade volume as measured by y Δ , obtaining:
∕
λ
P P
y
γ y y
x
=
′ −
Δ
=
1 + (1 − )(1 + Δ )
. (3)
Note that λ is essentially an illiquidity measure because the
larger λ is, the less liquid the market is. Now, by first rewriting
Equation (2) and then using Equation (3), we can express the
quantity x Δ of token X received by the swapper as:
⋅
∕
⋅
x x
L
y γ y
y
P
γ
γ y y
y
P
γ
λx γ
Δ = −
+ (1 − )Δ
=
Δ 1 −
1 + (1 − )Δ
=
Δ 1 −
− (1 − )
.
2
(4)
This way, we see that x Δ consists of two components, namely (i)
the amount of token X bought at the current price, that is, ∕ y P Δ ,
and (ii) the pool price slippage ∕ γ λx γ (1 − ) ( − (1 − )). Note that
the price slippage term decreases with both the proportional fee γ
1026 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licenseand λ; it is bounded above by 1 when γ = 0 and y Δ = 0, and it
decreases to zero as → γ 1. Therefore, the price will change after
any token swap with y Δ > 0. Because of this positive price slippage
term, the combined value of the deposited tokens in the pool will
always be less than their combined value if the tokens were never
deposited in the first place. The difference in the combined token
value is called the impermanent loss to providers, and it would be
realized if they were to withdraw their tokens at any price different
from the price at which they deposited the tokens. Therefore, to
encourage liquidity provision, the income from trading fees needs to
exceed this impermanent loss.
Providers in the Uniswap markets have suffered severe
impermanent loss over time. However, v3 does nothing to
alleviate this problem. In fact, Aigner and Dhaliwal (2021) show
that impermanent loss is always greater in v3 than it is in v2.
Empirical verification of the excess impermanent loss from v3,
relative to v2, is also provided by Loesch et al. (2021), who
estimate an impermanent loss of about 260 million USD during
the first few months of operation of v3, between May and
September 2021. During that time, almost 50% of providers
experienced negative total returns. To hedge these losses, Clark
(2020), Fukasawa et al. (2023), and Deng et al. (2023) derive
static replication strategies using ether options.
Because both tokens should be available to swap at any price P, the
issue of over‐capitalization with v2 has long been recognized;
indeed, inefficient use of capital was the main motivation for adding
the new v3 protocol to the set of Uniswap AMMs. Milionis et al.
(2022) and others12
argue that v3 has better capital efficiency
because in v2 only small fractions of the total reserves of each token,
namely ∕ x x Δ and ∕ y y Δ , are utilized for swapping x Δ of token X
for y Δ of token Y. However, improved capital efficiency does not
imply a higher level of market efficiency, in terms of incorporating
new information from within and outside the market. So it is nat-
ural to ask: Do the technological advances made in v3 actually
improve market efficiency, relative to v2?
The main technological improvements of the v3 protocol
address the issue of capital efficiency by allowing liquidity
providers to specify a finite price interval over which they are
willing to supply the swappers. The protocol still uses a CPMM,
but now providers have a greater selection of pools according to
the fee tiers set by the protocol. Whereas v2 only has one pool
for each token pair, there are several pools in v3 offering dif-
ferent fee tiers. For instance, at the time of writing, there are
four pools for USDC‐ETH, with fees γ = 0.01%, 0.05%, 0.3% and
1%. Some pairs have even more pools. Having selected a pool,
providers then set a price range, say P P [ , ] l u , within which they
are willing to provide liquidity.
The ability to select both liquidity ranges and fees in v3 offers more
control over the trade‐off between trading volume and
impermanent loss, since both decrease as the fee increases. But does
this much greater flexibility for providers also improve market
efficiency? Because v3 has more pools per token pair than v2 and
trading is more dispersed on v3, ceteris paribus, this should decrease
the market efficiency for v3 relative to v2. However, the improved
capital efficiency of v3 attracts more providers overall. To see this for
the USDC‐ETH token pair, Figure 2 compares the trading volume
and illiquidity on Uniswap v2 with that on the 0.05% and 0.3% pools
for v3. On the left, Figure 2a shows that the trading volume on the
v3 pools is roughly five times that of v2, with almost all trading
occurring on the lower‐fee pool. On the right, Figure 2b depicts the
illiquidity defined as the price change divided by the trading vol-
ume.13
Figures are calculated daily and the illiquidity time series are
also smoothed for better visualization. The mean illiquidity of v3
over the sample period is 0.005, compared with a mean of 0.030 for
v2, which is six times larger. The increase in trading volume and
liquidity indicates directly that the v3 market is deeper and more
active than v2.
Because liquidity providers receive liquidity tokens that can be used
elsewhere in decentralized finance, it is common to use the terms
minting and burning liquidity for the provision and removal of
liquidity.14
Once liquidity is provided over a given price range, the
provider cannot change this range without incurring gas fees—
these are required for both providing and removing liquidity via the
smart contract. For this reason, providers try to avoid frequent
changes to their liquidity range. But when prices are highly volatile,
the decision about liquidity provision becomes rather complex
(Chen et al. 2024). As long as the price remains within the range
FIGURE 2 | Daily trading volume and illiquidity of v2 and v3, on the USDC‐ETH with 0.05% and 0.3% fee rates. Our sampling period is between
July 1, 2021 and June 1, 2024. Similar to Kyle (1985), we measure illiquidity by the ratio of price change to trading volume, that is,
∕ λ = (Price − Price ) Trading Volume t t t t −1 . To present the trend more clearly, we also display series (in bold lines) that are smoothed by an
exponential moving average: v a v = 0.1 + 0.9 t t t−1, where at (vt) is the original (smoothed) sequence of illiquidity.
1027 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseP P [ , ] l u , the provider will earn transaction fees from swappers, but if
the price moves out of this range, the provider's liquidity position is
deactivated.15
As argued by Adams et al. (2021) and Loesch et al.
(2021), liquidity provision via range orders in v3 resembles the
strategic market making of a limit order book: buying token X
moves the price up toward the boundary Pu, selling token X moves
the price down toward Pl, if the price moves out of the range the
liquidity position becomes dormant, and if the price returns to the
provider's range it is automatically reactivated. Our data also shows
that providers on v3 supply more liquidity and adjust and monitor
their positions far more frequently, indicating a much deeper
market than v2. For all these reasons, v3 may attract different types
of traders, specifically market makers in large hedge funds and
institutions who have better active liquidity management skills;16
and the presence of more informed traders on v3 might improve its
efficiency.
4 | Data and Statistical Tests
According to the criteria used by CoinMarketCap, after the collapse
of FTX, Coinbase, Binance, and Bitstamp became the largest CEXs
for trading ether spot markets. Ether is important because it has
become the numéraire for decentralized finance, being the unit for
gas fees of smart contracts on the dominant (Ethereum) chain, and
the base currency for non‐fungible token transactions. Bitcoin is a
main focus for manipulative trades on the many unregulated CEXs,
and some huge “whale” trades on certain products like the Binance
perpetuals completely dominate the bitcoin price discovery process
(Peterson 2021). So, rather than focus on bitcoin, we analyze the
relative price discovery and efficiency of ether (ETH) traded on the
major CEXs and DEXs, selecting Coinbase and Bitstamp to repre-
sent the centralized exchanges. Because these are among the few
CEXs that are semi‐regulated, in that they have licenses to operate
in all major US states and Europe. We have excluded Binance due
to significant gaps in their data over extended periods, as detailed in
Appendix A.
Our research focuses on 11 token pairs. The first is USDC‐ETH
on Uniswap markets versus USD‐ETH on Coinbase and Bit-
stamp. Then we identified 10 matched pairs that are actively
traded across Uniswap v3 pools 001, 005, and 030 (which have
fee tiers 0.01%, 0.05%, and 0.30%, respectively), Uniswap v2,
Bitstamp, and Coinbase. Specifically:17
• ETH‐USDC, ETH‐USDT, BTC‐ETH, ETH‐DAI, and ETH‐
LINK are the only pairs traded across Uniswap v2, Uniswap
v3, Coinbase, and Bitstamp.
• BTC‐USDC, DAI‐USDC, LINK‐USDT, BTC‐USDT, and
BTC‐UNI are traded exclusively on Uniswap v3, Coinbase,
and Bitstamp.
Our sample period is from July 1, 2021 to June 1, 2024. We start the
sample on July 1 to eliminate the interference of market instability
immediately following Uniswap v3's release on 5 May 2021. Trade‐
level data on Uniswap markets are obtained from CCdata. These
data contain a complete record of each mint, burn, and swap
transaction, including the timestamp and the amount of each token
swapped in or out. We then aggregate the trade‐level data to
minute‐level by taking the first trade price and the total trading
volume within each minute. We downloaded minute‐level data
directly from the Coinbase and Bitstamp official websites. We
considered using higher frequency data, such as at 15‐s intervals,
but the data were too sparse even for the most liquid token pair,
ETH‐USDC. Furthermore, much existing price‐discovery literature
supports the use of minute‐level, or even coarser data intervals.18
Table 1 reports the average daily trading volumes on different
platforms, namely those where there are order books and/or pools
available for the token pair. Coinbase, as the number one exchange
for spot ether trades, has a much larger trading volume than the
other platforms. Bitstamp's trading volume is comparable to that of
Uniswap v2 and Uniswap v3 (030). But for most other pairs, Uni-
swap exhibits the greatest trading volumes. Table C1 in Appendix C
summarizes some additional preliminary statistics of the data on all
token pairs. Table C1a presents the results of the Dickey and Fuller
(1979) test on minute‐level log price and return series, which show
that all log return series are stationary. Then Table C1b reports the
results of Johansen (1988) tests, so that we make a reasonable
assumption about the cointegration rank of the log prices, which is
required for the estimation of a suitable vector error correction
model (VECM) in Section B. Almost all token pairs have coin-
tegration rank k − 1, with k denoting the number of exchanges the
TABLE 1 | Comparison of trading volumes.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
ETH‐USDC vs ETH‐USD 216.93 28.68 8.07 33.33 406.69
ETH‐USDC 216.93 28.68 8.07 0.23
ETH‐USDT 43.32 13.12 6.92 0.64 22.42
BTC‐ETH 31.23 11.36 0.45 2.12 17.40
BTC‐USDT 1.28 1.23 28.53
BTC‐USDC 5.73 0.72
DAI‐USDC 19.92 4.55
ETH‐DAI 13.64 5.64 1.24 1.18
ETH‐LINK 4 0.4 0.48
UNI‐BTC 0.01 0.03 0.65
LINK‐USDT 0.01 0.22
Note: Average daily trading volume (in million USD) on Uniswap v2, Uniswap v3, Bitstamp, and Coinbase, between July 1, 2021 and June 1, 2024.
1028 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licensepair is traded on. To align with our VECM, we conducted additional
tests on the intra‐day minute‐level data for each day and calculated
the proportion of null hypotheses rejected for different cointegration
ranks. The findings remain consistent over the entire sample, un-
derscoring the robustness of our results.
5 | Empirical Results
Table 2 summarizes the empirical tests we adopt to investigate the
price discovery ability and level of market efficiency of the ex-
changes. The tests are explained in detail in Appendix B. We apply
them to minute‐level spot returns on each day, repeating them daily
across the entire sample and summarize our results in Tables 3–5,
and Figure 3. Table 3 reports the two‐way Granger causality test
results, based on bivariate VECMs that are calibrated separately on
each day of the sample; Table 4a reports the median CS (component
share) and MIS (modified information share) derived from the same
models; Table 4b reports the net spillover from each of the four
exchanges, the gross spillover of exchanges are reported in Table C2
in Appendix C; Table 5 reports the results of the Ljung‐Box test,
AVR test, and Bartels' test; and Figure 3 depicts time series of the
R/S Hurst exponents for the main token pairs, with exponents for
other token pairs depicted in Figure C2 in Appendix C.
Several conclusions may be drawn from these results. First, from
Table 3 we see that Coinbase and Bitstamp are generally more
efficient than Uniswap. The following observations justify this
statement: (i) Granger causality test results indicate that both these
exchanges frequently lead prices on Uniswap v2 and Uniswap v3.
For the ETH‐stablecoin token pairs, there is also strong evidence for
bidirectional causality from Uniswap v3 (005) to Coinbase and
Bitstamp, but Uniswap v2 plays much less of a leadership role; (ii)
Table 4a shows that Coinbase's median CS and MIS are the highest,
for all token pairs that are traded there, and for the other pairs
Uniswap v3 (005) has greater median CS and MIS than Bitstamp.
However, Uniswap v3 (030) has the smallest median CS and MIS.
These findings are relatively stable over the sample—see, for ex-
ample, Figure C1, which depicts the evolution of daily CS and MIS
values of exchanges for ETH‐USDC versus ETH‐USD; (iii)
Regarding the median net spillover rates reported in Table 4b,
Bitstamp and Coinbase are almost always the main “senders” of
information shocks. Figure 4 illustrates an example comparing
ETH‐USDC and ETH‐USD, where both CEXs show positive net
spillovers on each day of our sample, whereas the Uniswap markets
very often exhibit negative net spillovers; (iv) Also, for seven of the
eleven pairs the Uniswap pools fail our statistical tests on market
efficiency (namely the Ljung‐Box, AVR and Bartels' tests) more
frequently than Coinbase and Bitstamp do, as reported in Table 5;
and furthermore (v) Figure 3 shows that the R/S Hurst exponents of
token pairs on both Coinbase and Bitstamp tend to be closer to 0.5
than the equivalent exponents for Uniswap.
Secondly, comparing price discovery ability only between the dif-
ferent Uniswap pools, we find that Uniswap v3 (005) prices tend to
lead those on Uniswap v2 and v3 (030). To see this, note that: (i) the
CS and MIS of Uniswap v3 (001 and 005) in Table 4a are almost
always higher than the CS and MIS for other pools; (ii) from
Table 4b, Uniswap v3 (001 and 005) often generates positive spil-
lover to other exchanges, and passes the Ljung‐Box, AVR and
Bartels' test more often in Table 5; and (iii) for three out of 10 pairs
traded on v3 (030), the daily R/S Hurst exponents shown in Figure3
can go beyond 0.65 (indicating a state persistence) or below 0.45
(indicating a reverse state persistence) for long periods. But the R/S
Hurst exponent for token pairs traded on Uniswap v3 001 and v3
005 pools are almost never state persistent, except for DAI‐USDC,
where the R/S Hurst exponent indicates strong reverse state per-
sistence until the end of 2023—see Figure C2 in Appendix C.
Overall, these findings provide strong evidence of a positive effect
from the technological advances in Uniswap v3. The improvement
in price discovery ability for Uniswap v3 (001 and 005) confirms
that more sophisticated and institutional traders are using Uniswap
v3, as reported by Coinmarketcap.19
Thirdly, price discovery on Uniswap v3 (005) often exceeds that
for Bitstamp, even for USD(C)‐ETH, where Bitstamp is the third‐
largest CEX. To support this observation: (i) the Granger cau-
sality results in Table 3 show that v3 (005) and Bitstamp lead
other exchanges equally often; (ii) from Table 4a the median CS
and MIS values of v3 (005) are higher than those of Bitstamp for
TABLE 2 | Summary of statistical tests.
Category Test Literature
Price discovery Two‐way Granger (1969)
Causality Test
Procasky (2021)
Gross and Net Spillover Pesaran and Shin (1998); Alexander et al. (2020, 2022)
Price discovery/Market
efficiency
Component share (CS) Gonzalo and Granger (1995); Hasbrouck (1995); Lien and
Shrestha (2009); Alexander et al. (2020, 2022)
Modified information share (MIS) Hasbrouck (1995); Lien and Shrestha (2009); Alexander
et al. (2020, 2022)
Market efficiency Ljung and Box (1978) test Urquhart (2016)
Wild‐bootstrapped Automatic
Variance (AVR) test
Andrews (1991); Choi (1999); Charles et al. (2012);
Urquhart (2016)
Bartels (1982)'s rank test Urquhart (2016)
Rescaled Hurst (R/S Hurst)
exponent
Hurst (1951); Urquhart (2016)
Note: The tests we adopt to analyze the price discovery ability and market efficiency of the four crypto exchanges, Uniswap v2, Uniswap v3, Coinbase, and Bitstamp.
1029 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE 3 | The percentage of days during our sample for which bivariate Granger causality tests are rejected at the 1% significance level.
BTC, ETH vs USD.
From v3 (005) v3 (030) v2 Bitstamp Coinbase
To
ETH‐USDC vs ETH‐USD v3 (005) — 16.42 31.61 99.72 98.97
v3 (030) 99.06 — 94.84 98.87 98.87
v2 99.34 33.58 — 99.25 99.16
Bitstamp 90.9 7.5 19.7 — 41.65
Coinbase 96.81 8.35 24.39 99.62 —
ETH‐USDC v3 (005) — 16.42 31.61 17.92
v3 (030) 99.06 — 94.84 68.01
v2 99.34 33.58 — 37.34
Bitstamp 94.65 46.81 81.71 —
ETH‐USDT v3 (005) — 44.65 55.63 79.64 99.91
v3 (030) 98.59 — 96.62 95.03 99.44
v2 98.31 27.49 — 85.37 99.62
Bitstamp 97.65 30.49 58.35 — 99.44
Coinbase 80.21 6.75 15.85 51.22 —
BTC‐ETH v3 (005) — 19.00 20.74 99.34 99.34
v3 (030) 63.24 — 30.84 65.36 66.31
v2 50.58 43.22 — 53.59 54.84
Bitstamp 56.47 9.88 10.47 — 99.72
Coinbase 26.83 7.68 8.33 95.03 —
BTC‐USDT v3 (030) — 84.88 86.38
Bitstamp 8.17 — 99.44
Coinbase 4.98 61.73 —
BTC‐USDC v3 (030) — 84.05
Bitstamp 14.07 —
Other tokens.
From v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
To
DAI‐USDC v3 (001) — 2.46
v3 (005) 3.68 —
ETH‐DAI v3 (005) — 53.9 63.23 82.27
v3 (030) 82.07 — 82.82 85.35
v2 89.02 33.99 — 87.80
Coinbase 71.2 16.43 30.68 —
ETH‐LINK v3 (030) — 26.92 95.31
v2 79.08 — 86.21
Coinbase 32.08 18.86 —
UNI‐BTC v3 (030) — 24.51 40.47
Bitstamp 14.38 — 72.13
Coinbase 6.98 9.81 —
LINK‐USDT v3 (030) — 30.99
Coinbase 5.92 —
Note: The null hypothesis of no causality from one exchange to another is tested daily, and the percentage of days on which the test is rejected is reported. Our sample is
from July 1, 2021 to June 1, 2024, in total 1066 trading days.
1030 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licensethree out of four pairs traded on both exchanges; (iii) while
Bitstamp seems always to generate positive net spillover in
Table 4b, v3 (005) achieves the same for three out of six pairs that
are traded there. In fact, for USD(C)‐ETH, there are many days
when v3 (005) generated positive net spillovers to Bitstamp—see
Figure 4; and (iv) Uniswap v3 (005) fails the Ljung‐Box, AVR and
Bartels' tests less often than Bitstamp, for two out of the four
pairs that are traded in both exchanges, as reported in Table 5.
Finally, our comparison of different Uniswap v3 pools shows how
the fee structure impacts price discovery ability and efficiency. The
0.01% DAI‐USDC pool v3 (001) is designed for pairs having low
volatility, and it is marginally more efficient than v3 (005); but the
0.05% fee pools are also more efficient than the 0.3% fee pools and
the v2 pools. The v3 (030) pools are more suited to token pairs that
are highly volatile, reflecting the inherent trade‐off between the fees
that providers receive and the more frequent need to pay gas fees to
adjust the price range for liquidity supply. These findings highlight
the nuanced role of fee selection in shaping the price discovery
contribution of Uniswap v3 markets. Our results align with the
expectation that low‐volatility pairs gravitate toward lower fee tiers
(0.01% and 0.05%) and that these tiers tend to provide more efficient
trading environments. Conversely, higher volatility pairs gravitate
towards the 0.30% tier, where efficiency is moderated by the higher
fee structure.
In Section 3, we explained how technological improvements in
the v3 protocol addressed the issue of capital efficiency and
FIGURE 3 | R/S Hurst exponents for major token pairs. The R/S Hurst exponent value staying between 0.65 and 0.45 indicates no state
persistence in the timeseries; a value above 0.65 (below 0.45) indicates a (reverse) state persistence. Our sample period is between July 1, 2021 and
June 1, 2024, a total of 1066 trading days. To present the trend more clearly in these plots, the series is smoothed by an exponential moving
average: v a v = 0.1 + 0.9 t t t−1.
1031 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE 4 | Median values of the daily MIS and CS shares and daily net spillover from different exchanges.
(a) Median CS and MIS.
BTC, ETH vs USD.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
ETH‐USDC vs ETH‐USD CS • 0.227 0.099 • 0.087 • 0.084 • 0.435
MIS • 0.228 • 0.018 • 0.025 0.209 • 0.472
ETH‐USDC CS • 0.629 • 0.095 • 0.101 • 0.112
MIS • 0.843 • 0.018 • 0.034 • 0.048
ETH‐USDT CS • 0.120 • 0.099 • 0.101 0.107 • 0.499
MIS • 0.135 • 0.019 • 0.029 0.076 • 0.681
BTC‐ETH CS • 0.055 • 0.170 0.156 • 0.122 • 0.350
MIS • 0.026 • 0.047 0.057 • 0.180 • 0.530
BTC‐USDT CS • 0.160 0.181 • 0.605
MIS • 0.039 0.153 • 0.749
BTC‐USDC CS • 0.222 • 0.778
MIS • 0.072 • 0.928
Other tokens.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
DAI‐USDC CS • 0.735 • 0.265
MIS • 0.753 • 0.247
DAI‐ETH CS • 0.147 • 0.110 • 0.140 • 0.491
MIS • 0.178 • 0.021 • 0.043 • 0.650
LINK‐ETH CS 0.298 • 0.106 • 0.552
MIS 0.112 • 0.027 • 0.827
UNI‐BTC CS 0.255 • 0.131 • 0.478
MIS 0.111 • 0.057 • 0.683
LINK‐USDT CS • 0.287 • 0.713
MIS • 0.150 • 0.850
(b) Median net spillover (in %).
BTC, ETH vs USD.
From v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
ETH‐USDC vs ETH‐USD −2.53 −1.53 −5.46 • 5.63 • 4.78
ETH‐USDC • 0.03 −0.36 −0.13 • 0.60
ETH‐USDT • 1.90 −1.04 −3.57 • 1.28 • 1.54
BTC‐ETH −1.01 −0.15 • 0.01 • 0.73 • 0.29
BTC‐USDT −0.03 • 1.29 −1.19
BTC‐USDC −0.00 • 0.00
Other tokens.
From v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
DAI‐USDC • 0.00 −0.00
ETH‐DAI • 0.01 −0.04 −0.08 • 0.03
ETH‐LINK • 0.03 • 0.01 −0.06
(Continues)
1032 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE 4 | (Continued)
Other tokens.
From v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
UNI‐BTC 0.00 • 0.00 −0.02
LINK‐USDT −0.00 • 0.00
Note: Our sample is from July 1, 2021 to June 1, 2024, in total 1066 trading days. The daily MIS and CS represent price discovery shares, derived from our daily VECM
model calibrations. Panel B tabulates the long‐horizon (h = 60 min) median net spillover from different exchanges, computed by first measuring the gross spillover of
market X to all other markets on a given day, and subtracting from this the gross spillover that market X receives from all other markets on the same day, and then
reporting the median of these net daily spillovers. Color indicators are included in the results. For panel (a), the dark red (green) lights indicate the highest (lowest) values,
and the light red (green) lights indicate the second highest (lowest) values. For panel (b), the dark red lights indicate positive net spillover values.
TABLE 5 | Results of Ljung‐Box, AVR, and Bartels' tests.
BTC, ETH vs USD.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
ETH‐USDC vs ETH‐USD
Ljung‐Box • 60.04 33.02 • 61.42 • 20.54 • 21.95
AVR • 43.81 40.43 • 60.57 • 11.35 • 15.20
Bartels' 87.8 • 99.91 • 95.68 • 8.91 • 15.48
ETH‐USDC
Ljung‐Box • 60.04 • 33.02 • 61.42 • 76.55
AVR • 42.87 • 40.06 • 60.57 • 75.33
Bartels' • 87.80 • 99.91 • 95.68 • 81.52
ETH‐USDT
Ljung‐Box • 69.42 32.83 • 60.40 • 31.80 •18.39
AVR • 46.53 41.28 • 55.60 • 27.86 • 12.29
Bartels' 65.57 • 98.50 • 91.18 • 33.02 • 13.51
BTC‐ETH
Ljung‐Box • 27.49 • 83.30 • 98.50 37.62 • 30.39
AVR • 21.20 • 84.33 • 98.31 38.93 • 23.26
Bartels' 69.61 • 0100 • 98.59 • 34.24 • 26.64
BTC‐USDT
Ljung‐Box • 93.15 39.77 • 18.11
AVR • 92.59 34.15 • 11.54
Bartels' • 98.03 42.5 • 11.35
BTC‐USDC
Ljung‐Box • 78.80 • 41.56
AVR • 79.64 • 34.90
Bartels' • 97.84 • 45.31
Other tokens.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
DAI‐USDC
Ljung‐Box • 58.82 • 98.92
AVR • 67.74 • 99.25
Bartels' • 45.38 • 99.25
ETH‐DAI
Ljung‐Box • 39.49 • 68.11 • 27.34 • 60.98
AVR • 26.55 • 69.98 • 27.63 • 56.66
(Continues)
1033 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licensequestioned whether this would lead to increased trading vol-
umes and improved liquidity in v3 pools. In the following we
answer this question empirically, by estimating multi‐variate
linear regression models:
 y α β x = + + ϵ , it i
j
ij ijt it
=1
5
(5)
where yit is either (a) the price discovery ability of v2 (i = 1) and
v3 (i = 2) markets, represented by the CS and MIS measures
computed in Table 4a, or (b) the market efficiency of the pool
represented by the absolute deviation of the R/S Hurst exponent
from 0.5 (variable ADH), whose daily time series are depicted in
Figure 3. Note that the CS and MIS represent the price dis-
covery contribution of pool i to the entire system of pools and
exchanges where the same token pair is traded, whereas the
efficiency variable ADH just depends on the individual pool.
The explanatory variables xijt for each token pair modeled using
Equation (5) are: Vol j ( = 1), the volatility of the token pair
minute‐level log returns in pooli on dayt; Basis (j = 2), defined
as the absolute value of the average price difference between
pool i prices and the CEX market prices, averaged over every
minute‐level observation on each day t; LTR (j = 3), the large
trade ratio, computed as the ratio of the sum of the volumes of
large trades (above the 75% quantile size per day) to the total
trading volume in pool i on day t; the illiquidity measure λ
defined in Equation (3) (j = 4), which is computed as explained
in Figure 2; and LPA (j = 5), the activity of liquidity providers,
which is proxied by the daily average minute‐level change in
the liquidity supply constant L, for pool i on day t.
Table C3a in Appendix C examines the correlations between the
five explanatory variables and trading volume. We exclude the daily
trading volume because it is very highly correlated with both vol-
atility and the large trade ratio in every pool. The five explanatory
variables we have selected have reasonably low correlations in most
pools. Results using trading volume instead of volatility are quali-
tatively similar, and are available in Table C4 in Appendix C. The
only issue with multi‐collinearity might be between basis and vol-
atility (see Table C3b); for example, in the LINK‐USDT pool on v3
(030), these have a correlation of 0.597.
The impact that some of these explanatory variables have on
liquidity supply and trading on decentralized crypto ex-
changes has already been studied, to some extent. For
instance, while Capponi and Jia (2021), Chen et al. (2024),
and Lehar and Parlour (2024) all show that volatility affects
both liquidity provision and impermanent loss, the net effect
TABLE 5 | (Continued)
Other tokens.
v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
Bartels' • 32.36 • 95.03 • 37.43 • 62.01
LINK‐ETH
Ljung‐Box • 47.19 • 80.86 57.41
AVR • 54.41 • 79.34 54.88
Bartels' • 66.51 • 79.17 77.02
UNI‐BTC
Ljung‐Box • 0100 86.31 • 34.94
AVR • 0100 86.50 • 33.81
Bartels' • 0100 86.12 • 45.33
LINK‐USDT
Ljung‐Box • 0100 • 40.86
AVR • 0100 • 44.18
Bartels' • 0100 • 58.31
Note: We report the percentage of days in our sample for which at least one of the Ljung‐Box, AVR, or Bartels' tests are rejected at the 1% significance level. Our sample is
from July 1, 2021 to June 1, 2024, in total 1066 trading days. Color indicators are included in the results. The dark red (green) lights indicate highest (lowest) values, and
the light red (green) lights indicate second highest (lowest) values.
FIGURE 4 | Daily net spillover. Daily series of net spillovers (in %) for
ETH‐USDC on Uniswap versus ETH‐USD on Coinbase and Bitstamp,
computed using daily‐calibrated VECMs. Our sample is from July 1, 2021 to
June 1, 2024, in total 1066 trading days. To present the trend more clearly,
the series is smoothed by an exponential moving average for plot-
ting: v a v = 0.1 + 0.9 t t t−1.
1034 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licenseon price discovery and efficiency remains unclear. Uniswap offers
several pools with different fee levels, and it may be that lower‐fee
pools have relatively lower liquidity during volatile periods com-
pared with higher‐fee pools. This is because supply ranges need to
be changed more frequently when markets become more volatile,
and changing the supply range incurs gas costs, so to compensate
for these increased costs, liquidity providers could shift to higher‐fee
pools at such times. And if pools become less efficient or less
dominant in price discovery during volatile periods, this implies that
informed traders move away from Uniswap and toward centralized
exchanges at such times. Nevertheless, because the trading volume‐
volatility correlation is very high in every pool, as shown in
Table C3a in Appendix C, uninformed speculative trading volume
increases on Uniswap during volatile periods.
Regarding the basis and the prevalence of large trades as ex-
planatory variables, Heimbach et al. (2022a) show that Uniswap
prices may deviate further from centralized exchanges during
periods of extreme distress. Hence, traders attempting to exploit
arbitrage opportunities between centralized exchanges and
Uniswap pools should become more active during periods when
the basis is large. If these arbitrageurs are informed professional
traders (who tend to make larger trades) a large basis could
improve the price discovery ability of the Uniswap pool; but if
they are speculators (who tend to make smaller trades) the
opposite could be the case.
Lastly, as well as investigating the explanatory role of all these
variables for price discovery and efficiency, we ask whether
their effects differ according to the fee tier of the liquidity
pool—a question that is in line with previous research in tra-
ditional finance markets, which finds that price discovery
ability varies under different market conditions (Chakravarty
et al. 2004; Entrop et al. 2020).
Table 6 reports our main results. First, note that during volatile
periods, price discovery ability (CS, MIS) and efficiency (ADH) of
almost all the Uniswap pools reduce. This implies that informed
traders prefer to use centralized exchanges when markets become
volatile, but, because total trading volume invariably increases when
markets are volatile, it must be that more speculators start trading
in the Uniswap pools at these times. The only exception is the DAI‐
USDC v3 (001) pool, which is not traded on our centralized ex-
changes (hence there is no basis variable). However, this stablecoin
pair has very low volatility, and our results merely show that the
low‐fee pool becomes more dominant and efficient compared with
the higher‐fee pool v3 (005). The basis between Uniswap and Co-
inbase or Bitstamp also has a predominately negative effect on price
discovery. Since the basis tends to widen during volatile periods, this
supports our finding that fewer informed traders, but a greater
number of uninformed traders, use Uniswap when markets become
volatile. The basis has a mixed and less significant effect on effi-
ciency; the only notable result being the coefficient of 2.537 for the
UNI‐BTC v3 (030) pool, but this pool has a very low trading volume
(of about 10,000 USD per day, on average during our sample).
The effect of large trades, as captured by the LTR variable, depends
on the fee structure. For instance, large trades decrease the price
discovery ability of the v3 (005) pools but increase the price dis-
covery of the larger v3 (030) and v2 pools. If large trades bring more
information to the market and thereby improve market efficiency
and price discovery, this shows that more informed traders choose
to trade first on higher‐fee pools where there is sufficient liquidity to
do the trade without too much slippage. Regarding the relative
efficiency, when markets are highly volatile, the v3 liquidity pro-
vider needs to either (a) widen their supply range, in which case the
capital efficiency decreases and the pool becomes more like the v2
pools, or (b) change a narrow supply range more frequently, thus
incurring gas fees. Either action will decrease market efficiency.
Since the higher‐fee v3 (030) pools are designed to compensate
liquidity providers for the more frequent supply range changes,
which volatile token pair prices require, providers may switch
supply to these higher‐fee pools during especially volatile periods,
thus increasing liquidity and attracting greater trading volume.
However, the significant decrease in CS, MIS, and ADH during
highly uncertain periods indicates that more speculators, rather
than informed swappers, may be using the higher‐fee pools at such
times, when there are also more opportunities for cross‐exchange
arbitrage.
The illiquidity variable typically has a mixed effect: a higher
liquidity (when λ is lower) is associated with better price dis-
covery ability but less efficiency in the ETH‐USDC v3 (005)
pool. But in other pools, the effect is reversed, or not significant.
And liquidity provider activity (LPA) also has little significance
except in the USDT‐ETH v3 (005) pool and the stablecoin pair
v1 (001) pool, where, as expected, it has a positive effect on both
price discovery and efficiency.
6 | Conclusions
Market efficiency and price discovery ability measure whether
the asset prices in a financial market can fully and rapidly
incorporate new information from within and outside of the
market, respectively. They have significant implications for risk
management and hedging, as well as the potential to exploit
cross‐market arbitrage opportunities. This paper examines the
price discovery ability and market efficiency of Uniswap v2 and
Uniswap v3 compared with two major centralized exchanges for
spot trading, Coinbase, and Bitstamp. We found a total of eleven
token pairs that are actively traded in several Uniswap pools as
well as on either Coinbase or Bitstamp, or both, and our em-
pirical results are based on almost 3 years of trade‐by‐trade data
from all the platforms listing these token pairs that provide the
relevant data. These data are then aggregated to minute‐level,
from which vector error correction models are estimated day‐
by‐day to generate time series of price discovery and market
efficiency metrics for each token pair pool or exchange.
Uniswap markets have attracted much attention from aca-
demics and practitioners. The liquidity pools use a basic con-
stant proportion market‐making automation in Uniswap v2,
and Uniswap v3 employs a more capital and computationally
efficient form of automated market maker, which improves
liquidity provision. Although both v2 and v3 are less efficient
than Coinbase and Bitstamp, the price discovery ability of some
v3 pools is now surpassing that of Bitstamp.
The superior price discovery ability of v3, compared with
the same token pair pool on v2, can be attributed to the user‐
defined features of v3. By allowing providers to supply pools
1035 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE 6 | The impact of market characteristics on price discovery and market efficiency.
Coin pair CS MIS ADH
Vol Basis LTR λ LPA Vol Basis LTR λ LPA Vol Basis LTR λ LPA
v3 (001)
DAI‐USDC 0.009 0.162*** 0.009 0.069** 0.032 0.153*** −0.001 0.072** 0.144*** −0.078** 0.161*** 0.026
v3 (005)
USDC/
USD‐ETH
−0.001 0.016 −0.244*** 0.175*** −0.033 0.117*** 0.042 −0.180*** 0.279*** −0.027 −0.244*** 0.064** −0.126*** −0.105*** −0.034
ETH‐USDC −0.341*** 0.113*** −0.232*** 0.124*** −0.033 −0.396*** 0.113*** −0.234*** 0.123*** −0.032 −0.206*** −0.073** −0.149*** −0.131*** −0.037
USDT‐ETH −0.340*** −0.075** −0.124*** −0.037 0.159*** −0.330*** −0.137*** −0.167*** −0.018 0.168*** −0.049 −0.060* 0.005 −0.100*** 0.188***
BTC‐ETH −0.055 0.154*** −0.03 −0.174*** 0.033 0.056 0.182*** −0.002 −0.157*** 0.130*** −0.048 0.032 0.024 0.067* −0.036
ETH‐DAI −0.340*** −0.011 −0.374*** −0.017 0.051** −0.339*** −0.018 −0.279*** −0.019 −0.023 0.044 0.024 0.017 0.010 0.055*
DAI‐USDC −0.638*** −0.070** −0.142*** 0.032 −0.592*** −0.060** −0.116*** 0.017 0.289*** −0.002 0.121*** 0.024
v3 (030)
USDC/
USD‐ETH
−0.282*** −0.063* 0.111*** −0.060** 0.007 −0.138*** −0.049 0.101*** −0.040 −0.008 −0.166*** −0.031 −0.018 0.018 0.013
ETH‐USDC −0.182*** −0.101*** 0.088*** −0.039 0.011 −0.065** −0.115*** 0.077** −0.025 −0.008 −0.157*** −0.072** −0.035 0.014 0.012
USDT‐ETH −0.247*** −0.107*** 0.044 −0.032 0.023 −0.133*** −0.130*** 0.013 −0.020 0.050* −0.157*** −0.024 0.041 −0.060** −0.03
BTC‐ETH −0.499*** 0.191*** −0.018 −0.001 −0.014 −0.338*** 0.357*** −0.015 0.047 −0.034 −0.240*** 0.092* −0.076** −0.142*** −0.021
BTC‐USDT −0.332*** −0.113*** 0.207*** −0.031 −0.033 −0.219*** −0.084*** 0.255*** −0.019 −0.039 −0.131*** 0.003 −0.031 −0.011 −0.036
BTC‐USDC −0.377*** −0.235*** 0.078*** 0.023 −0.009 −0.256*** −0.216*** 0.087*** 0.010 −0.015 −0.174*** −0.019 0 −0.048 −0.011
ETH‐DAI −0.163*** −0.098*** 0.117*** 0.091*** −0.011 −0.093*** −0.124*** 0.098*** 0.181*** 0.011 −0.099*** −0.047 −0.032 −0.034 −0.001
LINK‐ETH −0.216*** −0.210*** 0.142*** −0.143*** 0.049* −0.065** −0.205*** 0.188*** −0.132*** 0.051* −0.140*** −0.066* −0.068** −0.017 0.022
LINK‐USDT −0.415*** 0.244*** −0.173*** −0.056 0 −0.259*** 0.192*** −0.168*** −0.029 0.007 −0.133*** 0.182*** −0.031 0.038 −0.019
UNI‐BTC −0.221*** 0.310 −0.119*** 0.041 −0.018 −0.094*** 0.819** −0.140*** 0.104** −0.019 −0.046 2.537** −0.06 −0.026 −0.002
v2
USDC/
USD‐ETH
−0.081** −0.089*** 0.084** −0.038 −0.016 0.085** −0.090*** 0.171*** −0.018 −0.018 −0.038 0.058* 0.093*** −0.047 −0.011
ETH‐USDC 0.009 −0.002 0.221*** −0.034 −0.012 0.160*** −0.017 0.285*** −0.016 −0.008 −0.043 0.067** 0.088*** −0.047 −0.01
USDT‐ETH −0.110** −0.090*** 0.108*** 0.021 0.005 0.150*** −0.102*** 0.127*** −0.066* 0.039 −0.271*** 0.091*** 0.188*** 0.266*** 0.025
BTC‐ETH −0.110*** −0.046 −0.150*** −0.057 0.025 −0.084*** 0.001 −0.057* 0.106*** −0.005 0.054* −0.043 −0.055 −0.074 −0.003
ETH‐DAI −0.207*** −0.164*** −0.055* 0.107*** −0.018 −0.120*** −0.151*** −0.021 0.069* −0.016 −0.092** 0.032 0.057* 0.071* −0.008
LINK‐ETH −0.238*** −0.076 0.047 0.051 −0.017 −0.053 0.050 0.046 0.006 −0.026 0.019 −0.040 −0.017 0.056 0.03
Note: The results of model (5), which uses minute‐level volatility (Vol), basis, large trade ratio (LTR), the market illiquidity measure λ in Equation (3), and the liquidity provider activity (LPA) to explain price discovery ability (CS or MIS)
and efficiency (ADH). The sample from July 1, 2021 to June 1, 2024, 1066 observations. All variables are normalized and asterisks ***, **, and * represent 1%, 5%, and 10% significance levels.
1036 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licensewith different fee levels, and to select tailor‐made liquidity ranges
within each pool, liquidity provision in v3 becomes similar to the
limit order book employed in a traditional market—whereas trades
in v2 are more like market orders. This potentially attracts more
informed traders to the low‐fee v3 pools, which consequently
demonstrates an improved level of price discovery. Our results have
also highlighted the nuanced role of fee selection in shaping the
price discovery contribution of Uniswap v3 markets. Uniswap v3
prices in pools with 0.05% fees tend to lead those on Uniswap v2
and v3 pools with 0.30% fees. Low‐volatility pairs gravitate toward
lower fee tiers (0.01% and 0.05%), and these tiers tend to provide
more efficient trading environments. Conversely, higher volatility
pairs gravitate toward the 0.30% tier, where efficiency is moderated
by the higher fee structure.
Nevertheless, our battery of empirical tests shows that most
Uniswap pools remain in the position of follower rather than
leader, with prices largely driven by cross‐market DEX‐CEX
arbitrage activities. This is not surprising given that, even
adopting layer‐two roll‐ups designed to speed up transactions,
Ethereum consensus and verification mechanisms still slow
down information dissemination, which harms the perform-
ance of DEXs as efficient financial markets. Unlike traditional
markets and the major crypto centralized exchanges, trading
volume is often found to have a negative effect on both price
discovery and efficiency. This can be explained by the increased
presence of speculative rather than informed professional
traders during volatile periods, when trading volume increases,
and the opportunities for cross‐market arbitrage.
Decentralized trading can resolve many of the security and
operational challenges faced by centralized exchanges, and
with oracles now adopting crypto prices from Uniswap, these
liquidity pools are rapidly becoming one of the main pillars of
the DeFi community. Although our findings confirm that
liquidity pools can be significantly enhanced through chan-
ges in smart contract protocols, many more technical devel-
opments are needed if they are to attract higher trading
volumes.
Acknowledgments
We thank the editor and an anonymous referee whose comments
resulted in significant improvements of this study.
Conflicts of Interest
The authors declare no conflicts of interest.
Data Availability Statement
The authors obtained data from CCdata, Bitstamp, and Coinbase.
Endnotes
1
On most CEXs, the same company will act as a custodian, broker,
market maker, and central clearing counterparty, not only as the
operator of electronic trading platforms that adopt efficient order
matching engines and funding management systems to ensure
cheap, smooth, and fast transactions. Consequently, they have
become the dominant platforms for crypto trading. As of December
19, 2024, the 24‐h trading volume of all tokens held on 218 cen-
tralized exchanges was 300 billion USD. Source: CoinGecko.
2
For instance, there are no public records of fiat currency deposits
and withdrawals. Only the pseudonymous deposits and withdrawals
of crypto are recorded on a blockchain, via connection to the CEXs
hot wallet. Also, most CEXs do not provide full details of the limit
order book.
3
For instance, during the hours following its filing for bankruptcy on
November 11, 2022, the FTX exchange experienced a possible hack
in which hundreds of millions worth of tokens were stolen. Simi-
larly, in October 2022, hackers exploited vulnerabilities to attack
Binance, which is by now the largest CEX, and stole BNB tokens
worth 570 million US dollars. In 2022, 3.7 billion USD was lost due
to various attacks, hacks, and scams, according to CoinDesk.
4
A gas fee is the amount of native token required for a blockchain
network user to conduct a transaction on the network. Nevertheless,
see this Solidus Report.
5
However, a new form of manipulation called maximum extractable
value does occur, via sandwich attacks and other forms of front‐
running on DEXs (Daian et al. 2019; Alipanahloo et al. 2024;
Gramlich et al. 2024).
6
Source: DeFiLlama. The TVL on a DEX depends on the number of
tokens in the pools and their USD prices and as such it tracks the
market capitalization of crypto, which reached a high of almost four
trillion USD at the end of 2024.
7
Uniswap v4 is due to be launched soon. See the white paper Adams
et al. (2023).
8
An excellent review by Mohan (2022) clarifies the similarities and dif-
ferences between various types of AMMs, including Constant Mean
Market Makers, Constant Sum Market Makers and Hybrid Function
Market Makers, as well as CPMMs, which may also be called Constant
Function Market Makers, e.g,. as in Milionis et al. (2022).
9
We only consider pools for swapping two tokens. Multiple token
pools do exist, e.g. on Balancer or Curve, but a constant mean
market maker (CMMM) is normally used in this case. These pools
have reserves x x x ( , , …, ) n 1 2 of n tokens X X X , , …, n 1 2 that satisfy the
function  x K = i
n
i
w
=1
i with  w = 1 i
n
i =1 .
10
Uniswap allows different fee tiers in pools, such as
∈ γ {0.01%, 0.05%, 0.3%, 1%} for the USDC‐ETH pair.
11
Another difference in the Uniswap v3 protocol is that the smart
contract automatically mints ERC‐721 non‐fungible liquidity tokens
for fees, and providers then have the option to manually redeposit
the transaction fees back into the pool after the transaction.
12
The blog by Austin Adams and Gordon Liao claims that v3 increases
capital efficiency for providers by up to 4000x, compared with v2,
and that fee returns on non‐rebalancing v3 positions outperform
comparable v2 positions by more than 50%.
13
In v3, liquidity provisions are more concentrated around the
current pool price. For instance, see the liquidity distribution of
the WETH‐USDC 0.05% pool. Trades seldom cross multiple
liquidity provision intervals. We still use the ratio of price
change to trading volume to measure market illiquidity λ in the
Uniswap v3 market.
14
In particular, v2 mints ERC‐20 fungible tokens and v3 mints ERC‐
721 non‐fungible tokens, i.e. each token is unique. The rationale
behind this change is for liquidity providers to boost income by
liquidity mining, see the blog of Adams et al. (2021).
15
At the boundaries of the price range, liquidity reserves
are concentrated on the less valuable asset. For example, if
P P [ , ] = [1000, 3000] l u in the USDC‐ETH pool, once the price
hits 1000, the entire provision becomes ETH tokens, no USDC
tokens; and if the price falls further, to 900 say, then the pro-
viders balance is measured in ETH. Conversely, if the price ap-
preciates to 3000, then the entire balance is automatically held
in USDC.
1037 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License16
See Is UNISWAP v3 Sacrificing Retail for Capital Efficiency?: Flipside
Crypto. https://coinmarketcap.com/academy/article/is-uniswap-v3-
sacrificing-retail-for-capital-efficiency
17
LINK‐USDC is omitted because it is only traded on Uniswap v3 (fee
tier 0.30%) and Binance.
18
For example, Han et al. (2023) studied the reliability of Uniswap
prices from an investor's perspective using 5‐min order and trade
data, including price discovery measures like Component Share
(CS). Similarly, Hansen et al. (2024) examined the price dis-
covery capabilities of Binance, Coinbase, and Uniswap v2 using
minute‐level data. Studies using tick‐by‐tick data typically focus
on investment or trading strategies. For instance, Capponi et al.
(2024) adopted tick‐by‐tick Ethereum mempool data to investi-
gate investor strategies and distinguish transactions from public
and private pools. Hansson (2024) used tick‐by‐tick data to study
how manual, algorithmic, and arbitrage trading, alongside
liquidity provision, contribute to price discovery on Uniswap.
These examples demonstrate that while finer intervals can be
insightful in some contexts, they are not universally adopted and
are not, in fact suitable for our study. Foley et al. (2023) suggest
how to identify imprecise or slow exchanges by examining
whether they record trades with millisecond‐level precision,
and whether internal latency is an issue, whereby the matching
engine speed lags behind the timestamp accuracy (e.g., parts
of a market order being processed across multiple milliseconds).
However, such reliability concerns do not affect our analysis,
as our study is based on lower‐frequency data. The data set
we utilize is not designed to capture the nuances of millisecond‐
level precision, but it is well‐suited for our research objectives.
19
op. cit. note 16.
20
Binance Auto‐Convert USDC to BUSD.
21
Binance Stopped BUSD Auto‐Conversion.
22
ETH‐USDC, BTC‐USDC Back to Binance.
23
Conventionally, the VECM model is written as:
 r αβ p A r ϵ , = ′ + + t t
q
Q
q t q t −1
=1
−
where Q represents the lag order of VECM. For simplicity, our
model assumes Q = 1, which is well‐grounded because in
practice, the BIC criterion usually selects a lag order of one
(Alexander and Heck 2020).
24
We compute l following Andrews (1991) using the method specified
in the R package designed for this test.
25
In other words, for the kth sub‐sample, ∕  ( ) y x x m = − kq kq i
m
ki =1 ,
and  z y q m = , = 1, …, kq i
q
ki =1 .
References
Adams, A., and G. Liao 2022. “When Uniswap v3 Returns More Fees for
Passive LPs.” Available at SSRN 4671238.
Adams, A., X. Wan, and N. Zinsmeister 2022. “Uniswap v3 TWAP
Oracles in Proof of Stake.” Available at SSRN 4384409.
Adams, H., M. Salem, N. Zinsmeister, et al. 2023. “Uniswap v4 Core.”
Adams, H., N. Zinsmeister, M. Salem, R. Keefer, and D. Robinson 2021.
“Uniswap v3 Core.” arXiv:2111.09192.
Aigner, A. A., and G. Dhaliwal 2021. “Uniswap: Impermanent Loss and
Risk Profile of a Liquidity Provider.” arXiv:2106.14404.
Alexander, C., J. Choi, H. Park, and S. Sohn. 2020. “Bitmex Bitcoin
Derivatives: Price Discovery, Informational Efficiency, and Hedging
Effectiveness.” Journal of Futures Markets 40, no. 1: 23–43.
Alexander, C., and D. F. Heck. 2020. “Price Discovery in Bitcoin: The
Impact of Unregulated Markets.” Journal of Financial Stability 50: 100776.
Alexander, C., D. F. Heck, and A. Kaeck 2022. “Price Discovery in
Bitcoin: The Role of Limit Orders.” Available at SSRN 4150979.
Alipanahloo, Z., A. S. Hafid, and K. Zhang 2024. “Maximal Extractable
Value Mitigation Approaches in Ethereum and Layer‐2 Chains: A
Comprehensive Survey.” arXiv preprint arXiv:2407.19572.
Andrews, D. W. 1991. “Heteroskedasticity and Autocorrelation Con-
sistent Covariance Matrix Estimation.” Econometrica 59: 817–858.
Angeris, G., H.‐T. Kao, R. Chiang, C. Noyes, and T. Chitra. 2021. “An
Analysis of Uniswap Markets.” Cryptoeconomic Systems 1: 1–30.
Aoyagi, J. 2020. “Liquidity Provision by Automated Market Makers.”
Available at SSRN 3674178.
Barbon, A., and A. Ranaldo 2021. “On the Quality of Cryptocurrency
Markets: Centralized Versus Decentralized Exchanges.”
arXiv:2112.07386.
Bartels, R. 1982. “The Rank Version of von Neumann's Ratio Test for
Randomness.” Journal of the American Statistical Association 77, no.
377: 40–46.
Caldarelli, G., and J. Ellul. 2021. “The Blockchain Oracle Problem in
Decentralized Finance—A Multivocal Approach.” Applied Sciences 11,
no. 16: 7572.
Capponi, A., and R. Jia 2021. “The Adoption of Blockchain‐Based De-
centralized Exchanges.” arXiv:2103.08842.
Capponi, A., R. Jia, and Y. Wang. 2023. “Blockchain Private Pools and
Price Discovery.” AEA Papers and Proceedings 113: 253–256.
Capponi, A., R. Jia, and S. Yu 2024. “Price Discovery on Decentralized
Exchanges.” Available at SSRN 4236993.
Cartea, Á., F. Drissi, and M. Monga 2023a. “Decentralised Finance
and Automated Market Making: Execution and Speculation.” arXiv:
2307.03499.
Cartea, Á., F. Drissi, and M. Monga 2023b. “Execution and Statistical
Arbitrage With Signals in Multiple Automated Market Makers.”
Available at SSRN 4388104.
Chakravarty, S., H. Gulen, and S. Mayhew. 2004. “Informed Trading in
Stock and Option Markets.” Journal of Finance 59, no. 3: 1235–1257.
Charles, A., O. Darné, and J. H. Kim. 2012. “Exchange‐Rate Return
Predictability and the Adaptive Markets Hypothesis: Evidence From
Major Foreign Exchange Rates.” Journal of International Money and
Finance 31, no. 6: 1607–1626.
Chen, T., J. Deng, J. Nie, Q. Fu, and B. Zou 2024. “Liquidity Provision
and its Information Content in Decentralized Markets.” Available at
SSRN 4568075.
Chen, Y.‐L., and J. J. Yang. 2024. “Time‐Varying Price Discovery in
Regular and Microbitcoin Futures.” Journal of Futures Markets 44, no.
1: 103–121.
Choi, I. 1999. “Testing the Random Walk Hypothesis for Real Exchange
Rates.” Journal of Applied Econometrics 14, no. 3: 293–308.
Clark, J. 2020. “The Replicating Portfolio of a Constant Product Mar-
ket.” Available at SSRN 3550601.
Cong, L. W., X. Li, K. Tang, and Y. Yang. 2023. “Crypto Wash Trading.”
Management Science 69, no. 11: 6427–6454.
Daian, P., S. Goldfeder, T. Kell, et al. 2019. “Flash Boys 2.0: Frontrun-
ning, Transaction Reordering, and Consensus Instability in Decen-
tralized Exchanges.” arXiv:1904.05234.
Dave, K., V. Sjöberg, and X. Sun 2021. “Towards Verified Price Oracles
for Decentralized Exchange Protocols.” In 3rd International Workshop
on Formal Methods for Blockchains (FMBC 2021).
1038 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseDeng, J., H. Zong, and Y. Wang. 2023. “Static Replication of
Impermanent Loss for Concentrated Liquidity Provision in Decen-
tralised Markets.” Operations Research Letters 51, no. 3: 206–211.
Dickey, D. A., and W. A. Fuller. 1979. “Distribution of the Estimators
for Autoregressive Time Series With a Unit Root.” Journal of the
American Statistical Association 74, no. 366a: 427–431.
Diebold, F. X., and K. Yilmaz. 2012. “Better to Give Than to Receive:
Predictive Directional Measurement of Volatility Spillovers.” International
Journal of Forecasting 28, no. 1: 57–66.
Entrop, O., B. Frijns, and M. Seruset. 2020. “The Determinants of Price
Discovery on Bitcoin Markets.” Journal of Futures Markets 40, no. 5:
816–837.
Foley, S., W. Krekel, V. Mollica, and J. Svec. 2023. “Not so Fast: Iden-
tifying and Remediating Slow and Imprecise Cryptocurrency Exchange
Data.” Finance Research Letters 51: 103401.
Fukasawa, M., B. Maire, and M. Wunsch. 2023. “Weighted Variance
Swaps Hedge Against Impermanent Loss.” Quantitative Finance 23: 1–11.
Gandal, N., J. Hamrick, T. Moore, and T. Oberman. 2018. “Price
Manipulation in the Bitcoin Ecosystem.” Journal of Monetary
Economics 95: 86–96.
Gonzalo, J., and C. Granger. 1995. “Estimation of Common Long‐
Memory Components in Cointegrated Systems.” Journal of Business &
Economic Statistics 13, no. 1: 27–35.
Gramlich, V., D. Jelito, and J. Sedlmeir. 2024. “Maximal Extractable
Value: Current Understanding, Categorization, and Open Research
Questions.” Electronic Markets 34, no. 49: 1–21.
Granger, C. W. 1969. “Investigating Causal Relations by Econometric
Models and Cross‐Spectral Methods.” Econometrica 37: 424–438.
Han, J., S. Huang, and Z. Zhong 2023. “Trust in DeFi: An Empirical
Study of the Decentralized Exchange.” Available at SSRN 3896461.
Hansen, P. R., C. Kim, and W. Kimbrough. 2024. “Periodicity in
Cryptocurrency Volatility and Liquidity.” Journal of Financial
Econometrics 22, no. 1: 224–251.
Hansson, M. 2024. “Price Discovery in Constant Product Markets.”
Available at SSRN 4582649.
Hasbrouck, J. 1995. “One Security, Many Markets: Determining the
Contributions to Price Discovery.” Journal of Finance 50, no. 4:
1175–1199.
Hasbrouck, J., T. J. Rivera, and F. Saleh 2022. “The Need for Fees at a
DEX: How Increases in Fees Can Increase DEX Trading Volume.”
Available at SSRN 4192925.
Hasbrouck, J., T. J. Rivera, and F. Saleh 2025. “An Economic Model of a
Decentralized Exchange With Concentrated Liquidity.” Management
Science, ahead of print, February 25. https://doi.org/10.1287/mnsc.2024.
04510.
Heimbach, L., E. Schertenleib, and R. Wattenhofer 2022a. “Exploring
Price Accuracy on Uniswap v3 in Times of Distress.” In Proceedings of
the 2022 ACM CCS Workshop on Decentralized Finance and Security,
47–53.
Heimbach, L., E. Schertenleib, and R. Wattenhofer 2022b. “Risks and
Returns of Uniswap v3 Liquidity Providers.” arXiv:2205.08904.
Hurst, H. E. 1951. “Long‐Term Storage Capacity of Reservoirs.”
American Society of Civil Engineers Tans 116, no. 1: 13–27.
Johansen, S. 1988. “Statistical Analysis of Cointegration Vectors.”
Journal of Economic Dynamics and Control 12, no. 2–3: 231–254.
Kim, J. H. 2009. “Automatic Variance Ratio Test Under Conditional
Heteroskedasticity.” Finance Research Letters 6, no. 3: 179–185.
Klein, O., R. Kozhan, G. Viswanath‐Natraj, and J. Wang 2023. “Price
Discovery in Cryptocurrencies: Trades Versus Liquidity Provision.”
Available at SSRN 4642411.
Krückeberg, S., and P. Scholz. 2020. “Decentralized Efficiency? Arbi-
trage in Bitcoin Markets.” Financial Analysts Journal 76, no. 3: 135–152.
Kyle, A. S. 1985. “Continuous Auctions and Insider Trading.”
Econometrica 53: 1315–1335.
Lehar, A., C. Parlour, and M. Zoican 2023. “Liquidity Fragmentation on
Decentralized Exchanges.” arXiv:2307.13772.
Lehar, A., and C. A. Parlour. 2025. “Decentralized Exchange: The
Uniswap Automated Market Maker.” Journal of Finance 80, no. 1:
321–374.
Levin, A., C.‐F. Lin, and C.‐S. J. Chu. 2002. “Unit Root Tests in Panel
Data: Asymptotic and Finite‐Sample Properties.” Journal of
Econometrics 108, no. 1: 1–24.
Lien, D., and K. Shrestha. 2009. “A New Information Share Measure.”
Journal of Futures Markets 29, no. 4: 377–395.
Ljung, G. M., and G. E. Box. 1978. “On a Measure of Lack of Fit in Time
Series Models.” Biometrika 65, no. 2: 297–303.
Lo, Y. C., and F. Medda. 2021. “Do Dexs Work? Using Uniswap v2 to
Explore the Effectiveness of Decentralized Exchanges.” Journal of
Financial Market Infrastructures 10, no. 2: 21–46.
Loesch, S., N. Hindman, M. B. Richardson, and N. Welch 2021.
“Impermanent Loss in Uniswap v3.” arXiv:2111.09192.
Milionis, J., C. Moallemi, T. Roughgarden, and A. Zhang 2022.
“Quantifying Loss in Automated Market Making.” arXiv:2208.06046.
Mohan, V. 2022. “Automated Market Makers and Decentralized Ex-
changes: A DeFi Primer.” Financial Innovation 8, no. 1: 20.
Neuder, M., R. Rao, D. J. Moroz, and D. C. Parkes 2021. “Strategic
Liquidity Provision in Uniswap v3.” arXiv:2106.12033.
Park, A. 2023. “The Conceptual Flaws of Decentralized Automated
Market Making.” Management Science 69, no. 11: 6731–6751.
Pesaran, H. H., and Y. Shin. 1998. “Generalized Impulse Response Anal-
ysis in Linear Multivariate Models.” Economics Letters 58, no. 1: 17–29.
Peterson, T. 2021. “To the Moon: A History of Bitcoin Price Manipu-
lation.” Journal of Forensic and Investigative Accounting 13, no. 2: 1–23.
Procasky, W. J. 2021. “Price Discovery in CDS and Equity Markets:
Default Risk‐Based Heterogeneity in the Systematic Investment Grade
and High Yield Sectors.” Journal of Financial Markets 54: 100581.
Urquhart, A. 2016. “The Inefficiency of Bitcoin.” Economics Letters 148:
80–82.
Yan, B., and E. Zivot. 2010. “A Structural Analysis of Price Discovery
Measures.” Journal of Financial Markets 13, no. 1: 1–19.
Appendix A
Binance Data
On August 29, 2022 03:00 (UTC) Binance introduced its own stablecoin,
BUSD, with automatic conversion for users' existing balances and new
deposits of USDC stablecoins at a 1:1 ratio.20
But on March 10, 2023
(UTC) it stopped BUSD auto‐conversion for new deposits of USDC,21
and, on March 12, 2023 06:00 (UTC), it added the ETH‐USDC and BTC‐
USDC pairs back.22
Because of this, we have missing data on ETH‐
USDC and BTC‐USDC between August 29, 2022 and March 12, 2023.
Also, during the periods where Binance does have this data, the trading
volume was five to 10 times that of Coinbase and a 100 times that of
Bitstamp. Therefore, as expected, Binance has the best price discovery
for almost all trading pairs, except BTC‐USDT, ETH‐USDT (Coinbase is
the best for these two). If we include Binance in the spillover analysis,
for the periods where data are available, Binance has positive net spil-
lover for the top trading pairs, such as ETH‐USDC, ETH‐USDT, BTC‐
ETH, and BTC‐USDT, but a negative net spillover for smaller trading
pairs for which Coinbase has positive net spillover. For market
1039 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licenseefficiency (including R/S Hurst), Binance generally passes the test, and
the Binance market can be generally viewed as informationally
efficient.
Appendix B
Statistical Models and Tests
First, we introduce the vector error correction model (VECM, see, e.g.,
Alexander et al. 2020, for detailed discussion) that is used to explore the
price discovery relationship between different liquidity pools, and
between liquidity pools and centralized exchanges. Each VECM
requires the token pair price system to be cointegrated, which is con-
firmed by the results in Table C1. We calibrate the VECMs on a daily
basis, using the minute‐level token pair prices and returns obtained
from the k different platforms it is traded on:
r αβ p Ar ϵ = ′ + + , t t t t −1 −1 (B1)
where pt is a k × 1 vector representing the log price at time t of the
token pair on k different platforms; rt denotes their log returns; α is a
k k × − 1 error correction coefficient matrix, whose sign and magni-
tude represent the reaction direction and speed of the token pair prices
when deviating from the long‐term equilibrium price of each platform;
β is a k k × − 1 matrix that makes the β p ′ t−1 vector stationary and
equal to the deviations from long‐term equilibrium; A is a k k × au-
toregressive coefficient matrix capturing short‐term fluctuations of the
ether spot prices;23
and ϵt denotes the residuals at time t.
We understand how the token pair prices on different platforms
influence each other by computing the component and information
share measurements for each calibrated VECM. It is worth noting that
previous research (such as Hasbrouck 1995; Lien and Shrestha 2009;
Alexander et al. 2020) on price discovery testing mainly calibrates
bivariate VECMs, as we also do for the Granger causality tests. But two‐
dimensional VECMs provide limited, one‐sided information since the
price discovery ability of any given token pair not only varies over time,
but also depends on which pools and exchanges are in the system, each
corresponding to a different platform where the token pair is traded.
These are the tests we perform day by day, on each calibrated bivariate
or k‐variate VECM:
1. Two‐way Granger (1969) causality test: For this test, we use
bivariate VECMs calibrated using minute‐level token pair returns
from any two of the pools or exchanges that trade the token pair.
The null hypothesis is that the past values of the returns from one
pool or exchange (the “origin/from”) do not help to predict
the future values of the returns from another pool or exchange
(the “receiver/to”). Rejecting the Granger test on any specific day
indicates that the token pair price on one pool or exchange is
leading that of another pool or exchange on that day. Conducting
this test across all trading days of our sampling period can help us
understand how often the price discovery on one pool or ex-
change leads that of another pool or exchange.
2. CS, MIS, gross, and net spillover: Each token pair has its own k‐
dimensional VECM, which is calibrated daily. Then following
Alexander et al. (2020), we calculate the CS and MIS of the
exchange s, denoted CSs and MISs, respectively, as:
⊥
⊥ 
( )
α
α
ψF
ψ ψ
F G G V
Ω
Λ
CS = , MIS =
([ ] )
′
,
with = ′ ,
s
s
q
k
q
s
s ,
=1 ,
2
−1
2 −1
−1
on each trading day, where: Ω denotes the covariance matrix of
the residual vector ϵ; Λ denotes the diagonal matrix of
eigenvalues of Ω with the corresponding eigenvectors denoted
as G; V represents the diagonal matrix of the residuals'
standard deviations; ψ is the common row vector of
⊥ ⊥ ⊥ ⊥


     


     
β α I A β α Ψ = ′ ( − ) ′ k
−1
, where ⊥ α and ⊥ β denote the orthogonal
complements of α and β, respectively, and Ik is the k k × identity
matrix. The CSs statistic indicates the relative contribution
of the ether spot price obtained from exchange s to the discovery
of the long‐term equilibrium spot price of ether. From a
different angle, CSs indicates the relative stability of market s. A
high CSs indicates a good price discovery ability of exchange s.
The MISs statistic indicates the extent to which exchange s's
new information contributes to the variation in the common
factor. In other words, MISs indicates the speed and accuracy of
the ether spot price on exchange s reacting to new information.
A high MIS means a quick and complete response of the ether
spot price of the exchange to new information shocks. Clearly,
these metrics reveal different and complementary character-
istics and therefore, are often used together (Yan and
Zivot 2010).
The gross spillover from the information shock embedded in the
token pair price in pool or exchange j to that in pool or exchange
i, denoted θij, is also calculated on each trading day, as:


( ) e e
e e
θ
ω ΨΩ
ΨΩΨ
=
′
′ ′
, ij
jj q
h
i q j
q
h
i q q j
−1
=0
−1 2
=0
−1
where we set h to 60 (minutes looking‐ahead), ωjj is the jth diagonal
entry of Ω, and ej is a column vector, which takes the value one in
the jth entry and zero otherwise. For q h = 0, …, − 1, each Ψq is a
k k × matrix, obtained from the vector moving average (VMA)
model that is equivalent to the VECM (B1), namely:
≈
∞
  r ϵ L L L L Ψ Ψ Ψ Ψ = ( ) , ( ) = , t t
q
q
q
q
h
q
q
=0 =0
−1
where L is the lag operator. The net spillover from the information
embedded in the ether spot price on exchange j to that on exchange
i is calculated on each trading day as:

θ θ θ θ
θ
θ
* = ˜ − ˜ , ˜ = . ij ij ji ij
ij
s
k
is =1
Thenθ* ij indicates whether marketi is a “sender” or “receiver” of shocks
compared with market j. Intuitively, if market i is a net sender of
shocks relative to market j, as identified by θ* > 0 ij , then market i
plays a more significant role in price discovery than market j
(Diebold and Yilmaz 2012).
3. Autocorrelation, independence, and state‐persistence: These tests
are designed to reveal the level of market efficiency of the
liquidity pools by looking at the autocorrelation, independence,
and state‐persistence of the return series. Under the efficient
markets hypothesis, all valuable information in an efficient
market should be fully, quickly, and accurately reflected in the
current price. This means future prices in an efficient market
should be unpredictable and follow a random walk. Rejecting
this pattern (or equivalently, rejecting any of these tests) indi-
cates a lack of efficiency of the market. For each exchange
separately, we apply the following four tests to the entire time
series of n minute‐level ether spot returns, which is denoted
r r r = { , …, } n 1 :
1. Ljung and Box (1978) test: The test statistic takes the form:



     


     
n n r n q ( + 2) ( − ) ,
q
h
q
=1
2
1040 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons Licensewhere n is the sample size, rq is the qth order autocorrelation
coefficient estimated from r and h is the number of lags being
tested, which we set at 1 because we want to check the short‐term
auto‐correlation here; the longer term dependencies will be revealed
by the Hurst exponent, defined below. The null hypothesis is that
there is no autocorrelation present in the tested series.
2. Wild‐bootstrapped AVR test (Andrews 1991; Choi 1999): This
tests whether the returns are serially uncorrelated. To perform
it we rely on the standardized variance ratio (VR) statistic of
Choi (1999): For each sample r we set:
∕ 


    


  


  




     l n l k
q
l
r r
r
l
γ n
γ
VR( ) = 2 and = 1.3221
(4 )
(1 − )
,
q
n
t
n q
t t q
t
n
t =1
−1
=1
−
+
=1
2
2 0.2
0.8
where l is a lag truncation point,24
γ is the lagged dependent variable
coefficient estimate in an AR(1) model fitted to r and ( ) k
q
l
is a
quadratic spectral kernel that takes the form:
∕ 

  


   k
q
l
y y y
y
= 3
sin( ) − cos( )
, 2
with ( ) y π = 1.2
q
l
. Following Kim (2009), we obtain the p‐value of
the test in two steps. First, an optimal lag truncation point l* is
estimated according to equation (6.2) in Andrews (1991). The
observed value of the test statistic is the corresponding VR value,
denoted l VR( *). Second, following Kim (2009), we take m boot-
straps from the original sampler and in each bootstrapped sample
we find the optimal lag truncation point, l* k, for k m = 1, …, . Then
we compute the corresponding ( ) l VR * k statistic for each k. The p‐
value of the test is computed as the proportion of bootstrapped
statistics greater than the observed statistic.
3. Bartels (1982) rank test of randomness: The null hypothesis is
that the sample is random. As a test of independence, this test
is stronger than the previous two tests, which only rely on the
autocorrelation coefficients of the returns. Denote a time
series by r r { , …, } n 1 . The test statistic is:
σ
RVN−2
,
where
∕


σ
n n n
n n n
R R
R n
=
4( − 2)(5 − 2 − 9)
5 ( + 1)( − 1)
,
RVN =
( − )
( − ( + 1) 2)
, i
n
i i
i
n
i
2
2
2
=1
−1
+1
2
=1
2
and R r = rank( ) i i for i n = 1, …, .
4. Hurst exponent (Hurst 2021; 1951): This metric identifies
the state persistence in a time series, which differs from
autocorrelation. State persistence means the tendency for a
system—in this case a token pair price—to remain at the
same level. Reverse state persistence means the tendency
for a token pair price not to remain at the same level.
Positive (negative) autocorrelation is only a form of
(reverse) state persistence. Primarily, autocorrelation iden-
tifies the recent dependencies within a series, whereas state
persistence identifies long‐term, extensive dependencies
within the series. Calculating the R/S Hurst exponent relies
on taking the entire time series r r r = { , …, } n 1 and cutting
this into sub‐samples of equal size m, denoted
∕ k n m x { ; = 1, …, } k . We demean all sub‐samples by their
sub‐sample mean to obtain y { } k , and further convert them to
their cumulative terms z { } k .25
For each sub‐sample k, we
compute the “R/S” value as the ratio between the range size
of zk (i.e., z z max( ) − min( ) k k ) and the standard deviation of
yk. Taking all sub‐samples, we thus obtain m different R/S
values and subsequently compute their average R/S
value, R/S.
Now, we select a range of values for m, denoted by m { } i .
These values are chosen between 50 and 1440 and also
have to be factors of the time series size n. For each mi, we
repeat the process discussed above and obtain an R/S
value, denoted by R/Si. Then we run the following
regression:
a b m e ln(R/S ) = + ln( ) + , i i i
where b is called as the R/S Hurst exponent. A value of b near 0.5
indicates that the tested series r follows a Brownian motion. A value
of b greater than 0.65 (less than 0.45) indicates significant (reverse)
state persistence in r.
1041 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseAppendix C
Supporting Empirical Results
TABLE C1 | Further preliminary statistics of data.
(a) Test stats of the Dickey‐Fuller test ( H0 : The series is nonstationary.)
Log prices v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
ETH‐USDC vs ETH‐USD −1.327 −1.398 −1.393 −1.322 −1.317
ETH‐USDC −1.327 −1.398 −1.393 −1.46
ETH‐USDT −1.33 −1.388 −1.354 −1.394 −1.315
BTC‐ETH −2.063 −2.105 −2.448 −2.111 −2.106
BTC‐USDT −0.617 −0.522 −0.458
BTC‐USDC −0.592 −0.496
DAI‐USDC −73.407*** −52.050***
ETH‐DAI −2.015 −1.402 −1.406 −1.352
ETH‐LINK −2.649 −3.093 −2.621
UNI‐BTC −2.272 −3.051 −2.844
LINK‐USDT −2.261 −1.711
Log returns
vs ETH‐USD −158.288*** −155.508*** −182.077*** −158.805*** −158.379***
ETH‐USDC −158.288*** −155.508*** −182.077*** −165.910***
ETH‐USDT −165.646*** −154.400*** −173.569*** −166.659*** −159.960***
BTC‐ETH −166.863*** −171.859*** −178.448*** −238.947*** −171.799***
BTC‐USDT −168.246*** −161.204*** −159.966***
BTC‐USDC −179.270*** −164.073***
DAI‐USDC −206.645*** −171.335***
ETH‐DAI −213.600*** −168.481*** −229.955*** −167.331***
ETH‐LINK −154.899*** −186.140*** −165.333***
UNI‐BTC −161.178*** −227.954*** −158.532***
LINK‐USDT −417.993*** −147.820***
(b) Panel B: Sample level test stats of Johansen test and % of days in which H0 is rejected ( H0 : The system of log prices is cointegrated
at a rank of r.)
r = 0 r = 1 r = 2 r = 3 r = 4
ETH‐USDC vs
ETH‐USD
Test stats. 717,980.8*** 362,408.3*** 132,869.9*** 61,612.8*** 1.7
Rejection % 100.00 100.00 99.62 92.87 11.54
ETH‐USDC Test stats. 325,683.5*** 95,964.8*** 27,204.7*** 1.5
Rejection % 99.34 96.44 73.55 9.38
ETH‐USDT Test stats. 736,884.4*** 335,619.4*** 147,850.6*** 55,838.3*** 1.7
Rejection % 100.00 100.00 99.72 94.56 12.48
BTC‐ETH Test stats. 327,409.7*** 81,283.6*** 20,248.7*** 7631.2*** 4.7
Rejection % 100.00 98.53 65.91 26.92 4.81
BTC‐USDT Test stats. 86,863.1*** 24,767.0*** 0.3
Rejection % 99.44 76.34 12.58
BTC‐USDC Test stats. 32,615.1*** 0.2
Rejection % 83.96 11.54
(Continues)
1042 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE C1 | (Continued)
(b) Panel B: Sample level test stats of Johansen test and % of days in which H0 is rejected ( H0 : The system of log prices is cointegrated
at a rank of r.)
r = 0 r = 1 r = 2 r = 3 r = 4
DAI‐USDC Test stats. 37,787.7*** 9260.9***
Rejection % 94.20 46.54
ETH‐DAI Test stats. 247,495.0*** 134,643.0*** 34,833.7*** 1.7
Rejection % 98.59 90.89 72.86 9.30
ETH‐LINK Test stats. 75,018.9*** 21,030.9*** 6.6
Rejection % 96.72 78.05 10.41
UNI‐BTC Test stats. 15,948.2*** 25.2*** 7.4***
Rejection % 56.70 14.71 2.12
LINK‐USDT Test stats. 1846.9*** 2.9
Rejection % 23.10 5.07
Note: Our sampling period is between July 1, 2021 to June 1, 2024. Panel A presents the results of Dickey‐Fuller test for the minute‐level ether log price and returns series
from the four exchanges. The reported test statistics of the Dickey‐Fuller test is MacKinnon's approximate statistics based on Levin et al. (2002). Panel B presents the
results of Johansen test using the minute‐level log prices in the entire sample (the first row) and in each trading day across our sampling period at 1% significance level. *,
**, and *** represents rejecting the null hypothesis at 10%, 5%, and 1% level, respectively.
TABLE C2 | Gross and net spillover (in %).
(a) BTC, ETH vs USD.
From v3 (005) v3 (030) v2 Bitstamp Coinbase
To
ETH‐USDC v3 (005) 0.545 0.012 0.059 0.171 0.172
vs ETH‐USD v3 (030) 0.007 0.942 0.015 0.004 0.005
v2 0.035 0.016 0.818 0.023 0.023
Bitstamp 0.199 0.01 0.047 0.453 0.34
Coinbase 0.199 0.009 0.045 0.338 0.45
net spillover −0.025 −0.015 −0.055 0.056 0.048
ETH‐USDC v3 (005) 0.889 0.011 0.06 0.021
v3 (030) 0.013 0.955 0.017 0.005
v2 0.067 0.016 0.88 0.017
Bitstamp 0.018 0.003 0.011 0.96
net spillover 0 −0.004 −0.001 0.006
ETH‐USDT v3 (005) 0.774 0.007 0.025 0.035 0.136
v3 (030) 0.009 0.943 0.017 0.009 0.011
v2 0.032 0.018 0.86 0.025 0.041
Bitstamp 0.036 0.006 0.017 0.857 0.066
Coinbase 0.138 0.01 0.032 0.07 0.731
net spillover 0.019 −0.01 −0.036 0.013 0.015
BTC‐ETH v3 (005) 0.949 0.004 0.002 0.012 0.016
v3 (030) 0.004 0.977 0.003 0.003 0.004
v2 0.001 0.002 0.986 0.002 0.002
Bitstamp 0.011 0.003 0.003 0.771 0.189
Coinbase 0.015 0.003 0.003 0.191 0.761
net spillover −0.01 −0.001 0 0.007 0.003
(Continues)
1043 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE C2 | (Continued)
(a) BTC, ETH vs USD.
From v3 (005) v3 (030) v2 Bitstamp Coinbase
BTC‐USDT v3 (030) 0.991 0.004 0.004
Bitstamp 0.004 0.871 0.115
Coinbase 0.004 0.133 0.854
net spillover 0 0.013 −0.012
BTC‐USDC v3 (030) 0.995 0.005
Bitstamp 0.005 0.995
net spillover 0 0
(b) Other tokens.
From v3 (001) v3 (005) v3 (030) v2 Bitstamp Coinbase
To
DAI‐USDC v3 (001) 1 0
v3 (005) 0 1
net spillover 0 0
ETH‐DAI v3 (005) 0.966 0.002 0.005 0.018
v3 (030) 0.003 0.976 0.009 0.005
v2 0.005 0.009 0.966 0.007
Coinbase 0.015 0.005 0.008 0.954
net spillover 0 0 −0.001 0
ETH‐LINK v3 (030) 0.977 0.007 0.008
v2 0.007 0.987 0.002
Coinbase 0.009 0.003 0.986
net spillover 0 0 −0.001
UNI‐BTC v3 (030) 0.998 0 0.002
Bitstamp 0 0.996 0.003
Coinbase 0.002 0.004 0.991
net spillover 0 0 0
LINK‐USDT v3 (030) 1 0
Coinbase 0 1
net spillover 0 0
TABLE C3 | Panel A documents minimum, mean, median, and maximum value of correlations between explanatory variables include trading
volume (TV), large trade ratio (LTR), market depth (λ), liquidity providers activeness (LPA), volatility (Vol), and basis, as well as price discovery
ability and efficiency measures, CS, MIS, and ADH, across all pairs on all exchanges.
(a) Min, mean, median, and max values of correlations between explanatory variables.
LTR λ LPA Vol Basis
TV Min −0.415 −0.26 −0.011 −0.009 −0.172
Median 0.102 −0.054 0.097 0.442 0.295
Mean 0.015 −0.065 0.143 0.404 0.252
Max 0.364 0.093 0.671 0.683 0.632
LTR Min −0.256 −0.038 −0.481 −0.456
(Continues)
1044 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE C3 | (Continued)
(a) Min, mean, median, and max values of correlations between explanatory variables.
LTR λ LPA Vol Basis
Median 0.009 0.041 0.105 −0.06
Mean 0.003 0.064 0.035 −0.098
Max 0.198 0.251 0.399 0.183
λ Min −0.168 −0.061 −0.125
Median −0.012 0.074 0.068
Mean −0.02 0.193 0.119
Max 0.109 0.683 0.535
LPA Min −0.191 −0.302
Median 0.033 0
Mean 0.073 0.005
Max 0.288 0.192
Vol Min −0.236
Median 0.274
Mean 0.285
Max 0.597
(b) Vol‐basis correlations, sorted from the highest to the lowest.
Coin pair Exchange Correlation
LINK‐USDT v3 (030) 0.597
LINK‐ETH v2 0.590
BTC‐ETH v3 (030) 0.422
ETH‐DAI v3 (005) 0.402
LINK‐ETH v3 (030) 0.388
ETH‐USDC v3 (005) 0.364
USDT‐ETH v3 (005) 0.363
BTC‐USDT v3 (030) 0.317
ETH‐USDC v2 0.302
ETH‐USDC v3 (030) 0.296
BTC‐USDC v3 (030) 0.274
BTC‐ETH v2 0.252
USDC/USD‐ETH v2 0.234
USDT‐ETH v3 (030) 0.231
ETH‐DAI v3 (030) 0.227
USDC/USD‐ETH v3 (030) 0.216
BTC‐ETH v3 (005) 0.206
USDT‐ETH v2 0.205
USDC/USD‐ETH v3 (005) 0.171
ETH‐DAI v2 0.165
UNI‐BTC v3 (030) −0.236
Note: Panel B documents correlations between Vol and the basis for each coin pair traded in every exchange.
1045 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseFIGURE C1 | CS and MIS value (smoothed) plots on most traded pair ETH‐USDC versus ETH‐USD.
1046 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseFIGURE C2 | R/S Hurst exponents (smoothed) for minor pools.
1047 of 1087
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons LicenseTABLE C4 | The impact of market characteristics on price discovery and market efficiency.
Coin Pair CS MIS ADH
TV Basis LTR λ LPA TV Basis LTR λ LPA TV Basis LTR λ LPA
v3 (001)
DAI‐USDC 0.067* 0.148*** 0.026 0.061* 0.081** 0.137*** 0.019 0.068** 0.005 −0.074** 0.161*** 0.065*
v3 (005)
USDC/
USD‐ETH
0.296*** −0.092*** −0.145*** 0.126*** −0.03 0.375*** −0.079*** −0.112*** 0.273*** −0.019 −0.069* 0.057* −0.033 −0.207*** −0.043
ETH‐USDC −0.014 0.035 −0.103*** −0.036 −0.045 −0.094** 0.061 −0.097*** −0.049 −0.046 0.014 −0.132*** −0.068** −0.231*** −0.044
USDT‐ETH 0.237*** −0.267*** −0.095*** −0.135*** 0.139*** 0.268*** −0.340*** −0.134*** −0.107*** 0.143*** 0.094*** −0.114*** 0.017 −0.103*** 0.175***
BTC‐ETH 0.190*** 0.139*** −0.079** −0.190*** −0.002 0.242*** 0.167*** −0.038 −0.103*** 0.096*** −0.056* 0.034 0.025 0.035 −0.03
ETH‐DAI −0.049* −0.133*** −0.478*** −0.021 0.072*** −0.167*** −0.130*** −0.388*** −0.024 0.023 −0.044 0.045 0.029 0.010 0.063**
DAI‐USDC −0.068** −0.277*** −0.206*** −0.086*** −0.061* −0.253*** −0.176*** −0.093*** −0.003 0.078 0.146*** 0.078**
v3 (030)
USDC/
USD‐ETH
−0.209*** −0.039 0.139*** −0.073** 0.011 −0.128*** −0.030 0.109*** −0.050 −0.006 −0.071** −0.033 0.009 0.016 0.014
ETH‐USDC −0.145*** −0.080** 0.107*** −0.049 0.014 −0.080** −0.096** 0.080** −0.032 −0.007 −0.051 −0.084** −0.009 0.013 0.012
USDT‐ETH −0.105*** −0.094** 0.121*** −0.040 0.027 −0.033 −0.135*** 0.062* −0.023 0.051* 0.011 −0.051 0.117*** −0.060** −0.03
BTC‐ETH −0.269*** −0.109*** −0.039 −0.002 −0.064** −0.263*** 0.153*** −0.021 0.037 −0.059** −0.148*** −0.071* −0.079** −0.164*** −0.04
ETH‐DAI −0.071** −0.113*** 0.108*** 0.093*** −0.022 −0.090*** −0.108*** 0.098*** 0.179*** 0.008 −0.109*** −0.033 −0.031 −0.038 −0.004
BTC‐USDT −0.162*** −0.188*** 0.177*** −0.051* 0.074* −0.135*** −0.128*** 0.234*** −0.033 0.049 −0.084* −0.022 −0.043 −0.020 0.02
BTC‐USDC −0.268*** −0.327*** 0.088*** 0.024 −0.015 −0.222*** −0.275*** 0.103*** 0.008 −0.018 −0.114*** −0.062* 0.004 −0.047 −0.014
LINK‐ETH −0.014 −0.290*** 0.165*** −0.166*** 0.003 −0.005 −0.229*** 0.195*** −0.139*** 0.037 −0.011 −0.118*** −0.054* −0.032 −0.008
LINK‐USDT −0.042 −0.124*** −0.238*** −0.067* −0.014 −0.034 −0.037 −0.207*** −0.036 0 −0.005 0.043 −0.039 0.007 −0.024
UNI‐BTC −0.174*** 0.430 −0.138*** −0.028 0.018 −0.132*** 0.951*** −0.138*** 0.067 0.011 −0.038 2.224* −0.064 −0.094 0.006
v2
USDC/
USD‐ETH
0.040 −0.119*** 0.045 −0.037 −0.036 0.132*** −0.107*** 0.166*** −0.017 −0.03 −0.094*** 0.076** 0.105*** −0.048 0.001
ETH‐USDC 0.276*** −0.124*** 0.161*** −0.031 −0.059* 0.382*** −0.147*** 0.250*** −0.013 −0.051* −0.128*** 0.113*** 0.103*** −0.048 0.006
USDT‐ETH −0.019 −0.090** 0.091*** −0.034 0.003 0.200*** −0.227*** 0.110*** 0.029 0.011 −0.200*** 0.202*** 0.180*** 0.105*** 0.018
BTC‐ETH −0.160*** −0.081** −0.117*** −0.083** 0.026 −0.176*** −0.025 −0.013 0.075** −0.003 −0.111*** −0.017 0.011 −0.132** −0.002
ETH‐DAI −0.115*** −0.149*** −0.047 −0.035 −0.01 −0.122*** −0.123*** −0.01 −0.016 −0.007 −0.042 0.035 0.059* 0.008 −0.005
LINK‐ETH 0.081** −0.229*** 0.008 −0.053 −0.021 −0.059* 0.042 0.054 −0.034 −0.023 0.032 −0.040 −0.022 0.073** 0.029
Note: The results of model (5), which uses trading volume (TV), basis, large trade ratio (LTR), the market illiquidity measure λ in (3), and the liquidity provider activity (LPA) to explain price discovery ability (CS or MIS) and efficiency
(ADH). The sample from 1 July 2021 and 1 June 2024, 1066 observations. All variables are normalized and asterisks ***, **, and * represent 1%, 5%, and 10% significance levels.
1048 of 1087 Journal of Futures Markets, 2025
10969934, 2025, 8, Downloaded from https://onlinelibrary.wiley.com/doi/10.1002/fut.22593 by Cochrane Colombia, Wiley Online Library on [31/03/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License