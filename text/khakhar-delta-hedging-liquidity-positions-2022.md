---
sha256: 13330aa39866325870d45a7cc44239cae3a3c3b8576c01606595798df0b488c0
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 48744
---
Delta Hedging Liquidity Positions on Automated Market Makers
Adam Khakhar
University of Pennsylvania
USA
ak@alumni.upenn.edu
Xi Chen
New York University
USA
xc13@stern.nyu.edu
ABSTRACT
LiquidityProvidersonAutomatedMarketMakersgeneratemillions
of USD in transaction fees daily. However, the net value of a Liquid-
ity Position is vulnerable to price changes in the underlying assets
in the pool. The dominant measure of loss in a Liquidity Position
is Impermanent Loss. Impermanent Loss for Constant Function
Market Makers has been widely studied. We propose a new met-
ric to measure Liquidity Position PNL based on price movement
from the underlying assets. Compared to Impermanent Loss, we
show how Liquidity Position PNL more appropriately measures
the change in the net value of a Liquidity Position as a function of
price movement in the assets within the liquidity pool. Our second
contribution is an algorithm to delta-hedge arbitrary Liquidity Posi-
tions on both uniform liquidity Automated Market Makers (such as
Uniswap v2) and concentrated liquidity Automated Market Makers
(such as Uniswap v3) via a combination of derivatives.
1 INTRODUCTION
Decentralized Exchanges (DEXs) are a vital component of the De-
centralized Finance (DeFi) ecosystem. Decentralized Exchanges
are marketplaces where users can trade one cryptocurrency in
exchange for another cryptocurrency without giving any group
the authority to manage trades or act as a custodian [16]. This
peer-to-peer trading is accomplished through the use of smart con-
tracts, programmatic agreements fulfilled on the blockchain when
predetermined conditions are met [4]. Decentralized Exchanges
have several advantages over Centralized Exchanges such as mit-
igating counter-party risk and reducing the friction to trade due
to the lengthy sign-up processes associated with Centralized Ex-
changes. On a more theoretical level, DEXs can allocate risk among
traders with different risk preferences more efficiently, thereby re-
alizing gains from trade that cannot be reproduced in Centralized
Exchanges [15].
Similar to Centralized Exchanges such as Binance, FTX, and
Coinbase, Decentralized Exchanges began facilitating trades via
LimitOrderBooks[20].ALimitOrderBookisamethodtofacilitate
an exchange between market participants, where 2 sorted lists are
maintained including the price and amount that traders are willing
to buy (bid side) or sell (ask side). The Limit Order Book has a
unique impact on Order Flow (adding a bid or ask quote to the
book) and Trade Flow (accepting a bid or ask price and removing
liquidity from the book) [3]. 0x, dydx, and Serum are examples of
Decentralized Exchanges that use a Limit Order Book.
Liquidity is added to Limit Order Books via market participants
who add orders to the Limit Book (ex: a bid order where the market
participant declares that they are willing to buy 𝑠 shares at price
𝑝, or an ask order where the market participant is willing to sell
𝑠 shares at price 𝑝). This market participant who adds liquidity to
the Limit Order Book is referred to as a Market Maker. Once this
order is placed on the limit book, another market participant can
accept the full offer or a fraction of the shares in the offer. This
market participant who accepts a bid or ask and thereby withdraws
liquidity from the Limit Order Book is referred to as the Market
Taker.
In the Limit Order Book paradigm, Market Makers are incen-
tivized to add liquidity through exchanges, which provide benefits
for Market Makers such as transaction rebates and reduced transac-
tionfees[1].Insomecases,marketparticipantscanagreetobecome
a Contractual Market Maker, where they are compensated to re-
liably provide liquidity so that the difference between the largest
ask and smallest bid is kept to a minimum predetermined range
[19]. Low latency trade execution and Market Maker perks have
given rise to a substantially profitable set of firms whose strategy
is to provide liquidity on the Limit Order Book to capture the Bid-
Ask spread while maintaining a delta-neutral portfolio overall [9].
These firms provide liquidity on the Limit Order Book and profit
from Market Maker perks as well as the Bid-Ask spread while hav-
ing an overall portfolio whose value does not decrease even if the
underlying asset changes in price. In the following research, we
present the corresponding delta-neutral liquidity provision strat-
egy for Decentralized Exchanges with Automated Market Makers
(AMM).
Given the expensive gas fees required to maintain the data struc-
tures required for a Limit Order Book on the Ethereum chain, plac-
ing and updating orders on the Limit Order Book became prohibi-
tivelyexpensive[10].Thisproblemwassolvedwithanewprimitive:
AMM, which largely replaced the Limit Order Book in most De-
centralized Exchanges [20]. In a Decentralized Exchange with an
Automated Market Maker, market participants trade against a liq-
uidity pool, with pricing determined using a so-called conservation
function [25]. The canonical conservation function is the Constant
Function Market Maker, whereby the product of the amounts of
each token in the pool are held constant.
Liquidity Providers in an Automated Market Maker provide
assetsinapoolsothattraderscanswaponetokenforanothertoken
withinthispool.Inexchangeforprovidingtokenstoaliquiditypool,
Liquidity Providers receive a transaction fee from each swap. In
Uniswap v3 (the largest Decentralized Exchange by trading volume
[6]), there are several transaction fee tiers ranging from 1 basis
point to 100 basis points [11].
In 2021, Decentralized Exchanges had over $1 trillion USD in
volume traded [6]. Since the Summer of 2020, the Uniswap protocol
has awarded over $1.1 billion USD in transaction fees to liquidity
providers [21]. However, historically, liquidity providers have lost
more in Impermanent Loss than they have received in fees [14],
where Impermanent Loss is defined as the difference between the
value of the Liquidity Position and the value of holding initially
equal amounts of each asset. The value of a liquidity position is
arXiv:2208.03318v3 [cs.CE] 28 Dec 2022Adam Khakhar and Xi Chen
directly dependent on the price of the underlying cryptocurrencies
in the pool. Given the large volatility of cryptocurrencies, creating
a liquidity position becomes risky [7].
Delta-hedging is a strategy which aims to reduce the directional
risk associated with price movements of underlying financial in-
struments within a portfolio [22]. In other words, a portfolio is
delta-hedged with respect to some assets when the change in price
of these assets causes a negligible (or non-existent) change in port-
folio value. Many recent works have investigated delta-hedging
strategieswithdesirableproperties,suchasadelta-hedgingstrategy
via reinforcement learning [5].
2 MOTIVATION
In Centralized Exchanges such as the New York Stock Exchange,
market participants who provide liquidity (add a maker order to
the Limit Order Book), have a liquidity position whose portfolio
value PNL (profit and loss) is linear with respect to the asset on
the exchange. If the liquidity provider is placing an ask order, then
the provider is currently holding shares of the asset, which results
in a liquidity position portfolio value that is equal to the asset’s
price multiplied by the number of shares. In this case, the liquidity
provider can trivially delta-hedge their position by taking a short
position in the same asset. If the liquidity provider is placing a bid
order, then this liquidity provider does not own any shares of the
asset and the portfolio is trivially delta-neutral with respect to the
asset.
Delta-hedging liquidity positions on Automated Market Makers
is not as straight forward as it is in the Limit Order Book paradigm.
Because the portfolio value of the liquidity position is non-linear
with respect to the underlying assets, we must derive a new method
to hedge liquidity positions that is tailored to the economics pre-
sented in Automated Market Makers. Additionally, the PNL of a
liquidity position is more complex than that of a long position on
an asset. The PNL of a long position in some asset is equal to the
number of shares times the change in price, which trivially has a
linear relationship with respect to the asset’s price. While market
participants can hedge a long position in an asset by taking a short
position, there is no reasonable short position that market partici-
pants can take on a liquidity position. In other words, there is no
market in which users can short a liquidity position.
Giventhehighvolatilityofthevalueofliquiditypositions,which
have historically generated substantial revenue in transaction fees,
we introduce a robust strategy to hedge the value of liquidity po-
sitions so that the portfolio value remains nearly constant despite
drastic price changes in the underlying assets in the pool. Main-
taining a near-constant liquidity position value enables Liquidity
Providers to earn transaction fees without risking their liquidity
position investment. Our first contribution is a derivation of the
true change in value of a liquidity position as a function of price.
The dominant measure of loss in a liquidity position is Imperma-
nent Loss; we show why Impermanent Loss is not an appropriate
measure of the change in value of a liquidity position as a func-
tion of price. Our second contribution is an algorithm to find a
combination of derivatives such that the payoff is approximately
equal to an arbitrary function of price. Using this algorithm, we
can purchase the resulting set of derivatives such that the payoff of
Table 1: Notation
Symbol Definition
𝑎,𝑏 Tokens in a pair of tokens in a
liquidity pool, where it is conven-
tional to represent the prices in
terms of token𝑏.
𝑝𝑖
𝑎;𝑏
,𝑝𝑖
𝑏;𝑏
Initial price in units of𝑏 upon Liq-
uidityPositionentryoftoken𝑎 and
token𝑏, respectively.
𝑝
𝑓
𝑎;𝑏
,𝑝
𝑓
𝑏;𝑏
Final price in units of𝑏 of token 𝑎
and token𝑏, respectively.
𝑝𝑙
𝑎;𝑏
Concentrated liquidity position
lower range price in units of 𝑏 of
token 𝑎.
𝑝𝑢
𝑎;𝑏
Concentrated liquidity position up-
per range price in units of 𝑏 of to-
ken 𝑎.
𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎,𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
Initial total number of tokens in
the pool for tokens 𝑎 and𝑏, respec-
tively.
𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 ,𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
Final total number of tokens in the
pool for tokens 𝑎 and 𝑏, respec-
tively.
𝜅 Constant in Constant Product For-
mula.
𝑘 Exercise price of an option.
𝑐 Market price of an option.
𝛿 Price change from initial price at
liquidity provision:
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
− 1
PNL Profit(R+)andloss(R−)fromsome
investment opportunity.
the derivatives for any final price plus the change in the value of
the liquidity position is equal to 0. This results in a delta-neutral
liquidity position. The solution is presented for both AMMs with
uniform liquidity and AMMs with concentrated liquidity.
3 LIQUIDITY POSITION PNL
3.1 Liquidity Position PNL
Inthefollowingsection,wederiveafunctionthatmeasuresthePNL
of a liquidity position. We wish to hedge the difference between
the final value of the liquidity pool assets and the initial value of
the liquidity pool assets:
Liquidity Position PNL =
Final Value of Pool Assets
Initial Value of LP Investment
− 1
We provide a derivation of Liquidity Position PNL from first
principles for Automated Market Makers with uniform liquidity
(such as Uniswap v2) and with concentrated liquidity (such as
Uniswap v3) in the Appendix Section E.
We show that for AMMs with uniform liquidity (Appendix Sec-
tion E.1):
Liquidity Position PNL =
√
𝛿 + 1 − 1Delta Hedging Liquidity Positions on Automated Market Makers
Figure 1: Distribution of liquidity over range of price in an
AMM with uniform liquidity (Uniswap v2) [11].
Figure 2: Variable distribution of liquidity over range of
price in an AMM with concentrated liquidity (Uniswap v3)
[11].
Where 𝛿 represents the price change from the initial price at
liquidity provision (𝑝𝑖
𝑎;𝑏
) to the final price (𝑝
𝑓
𝑎;𝑏
):
𝛿 =
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
− 1
For AMMs with concentrated liquidity, we show that Liquidity
Position PNL is a function of final price, liquidity provision range
lower bound, and liquidity provision range upper bound. The proof
is provided in the Appendix. In Lemma B: Final Token Amounts in
Terms of Price, we find the equation for the final token amounts,
Figure 3: Liquidity Position PNL in Uniform Liquidity AMM
as a function of change in price (𝛿).
which are a function of the final price and liquidity range.
Liquidity Position PNL =
𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
𝑝𝑖
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
− 1
Proof provided in Appendix Section E.2. Where𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 ,𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
are the final amounts of token 𝑎 and token𝑏, respectively:
𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 =
          
        

√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
√︃
𝑝𝑙
𝑎;𝑏
·𝑝𝑢
𝑎;𝑏
𝑝
𝑓
𝑎;𝑏
≤ 𝑝𝑙
𝑎;𝑏
√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝
𝑓
𝑎;𝑏
·𝑝𝑢
𝑎;𝑏
𝑝𝑙
𝑎;𝑏
< 𝑝
𝑓
𝑎;𝑏
< 𝑝𝑢
𝑎;𝑏
0 𝑝
𝑓
𝑎;𝑏
≥ 𝑝𝑢
𝑎;𝑏
𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
=
      
    

0 𝑝
𝑓
𝑎;𝑏
≤ 𝑝𝑙
𝑎;𝑏
√
𝜅(
√︃
𝑝
𝑓
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) 𝑝𝑙
𝑎;𝑏
< 𝑝
𝑓
𝑎;𝑏
< 𝑝𝑢
𝑎;𝑏
√
𝜅(
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) ≥ 𝑝𝑢
𝑎;𝑏
Proof provided in Appendix Section C, Lemma B: Final Token
Amounts in Terms of Price.
3.2 Discussion of Impermanent Loss
Impermanent Loss is the most common metric used to analyze the
loss incurred in a liquidity position. Impermanent Loss is defined
as the difference in portfolio value between a liquidity position andAdam Khakhar and Xi Chen
Figure 4: Final Value of Pool Assets over Price in an AMM
with concentrated liquidity (Uniswap v3) [13].
simply holding onto both assets at initially equal values.
Impermanent Loss =
Final Value of Pool Assets
Value If Assets Were Held
− 1
Impermanent Loss has been well studied on various types of Auto-
mated Market Makers [24].
We provide a derivation of Impermanent Loss from first princi-
ples for Automated Market Makers with uniform liquidity (such as
Uniswap v2) and with concentrated liquidity (such as Uniswap v3)
in the Appendix. We show that for AMMs with uniform liquidity
(Appendix Section D.1.3):
Impermanent Loss =
2
√
𝛿 + 1
𝛿 + 2
− 1
Figure 5: Impermanent Loss in Uniform Liquidity AMM as
a function of change in price (𝛿).
Impermanent Loss and Liquidity Position PNL both share the
same numerator: Final Value of Pool Assets:
Final Value of Pool Assets = 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 + 𝑝
𝑓
𝑏;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
See Figure 4 for the Final Value of Pool Assets as a function of price.
In the case of concentrated liquidity, 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 and 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
de-
pend on the final price as well as the liquidity position range. Thus,
similar to Liquidity Position PNL, for AMMs with concentrated
liquidity, we show that Impermanent Loss is also function of final
price,liquidityprovisionrangelowerbound,andliquidityprovision
range upper bound:
Impermanent Loss =
𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
+
√︃
𝑝𝑖
𝑎;𝑏
!
×
√
𝜅
Where Equations (19) and (20) define 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 and 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
as
functions of price.
Despite the theory surrounding Impermanent Loss, the metric
measures the difference between the final value of the liquidity
pool assets versus a portfolio of holding an initially equal amount
of each asset. As we purchase a portfolio of derivatives, we do not
want to hedge for the difference between initially holding an equal
amount of each asset. If Impermanent Loss was hedged via deriva-
tives, the resulting portfolio’s value would change with directional
price movements in the assets held. This would not solve the funda-
mental problem with liquidity positions: the directional price risk
resulting from the high volatility of cryptocurrencies. Furthermore,
if we view the liquidity position as a black box function, the market
participant invests some combination of tokens into a pool. At any
given moment, the investment can be redeemed for some combina-
tion of the same tokens in the pool. Because the Liquidity Position
PNL metric measures this change in investment value, it is the only
necessary value that Liquidity Providers need to hedge. Therefore,
unlike Impermanent Loss, Liquidity Position PNL is a direct and
efficient metric for measuring the change in value of a Liquidity
Position as a function of price.
4 USING DERIVATIVES TO DELTA-HEDGE
We define a strategy to be delta-neutral when the directional risk
associatedwiththepricemovementsintheassetsheldinthetrading
strategy are nearly completely removed [22]. In other words, the
change in price of the underlying assets held will not affect the net
portfolio value.
## 4.1 Derivatives Optimization Problem
Definition
Given the function of Liquidity Position PNL defined in Section
3.1, which takes as input the final price, we must find some linear
combination of derivatives such that:
Liquidity Position PNL(Final Price)+Payoff(Derivatives, Final Price) ≈ 0
Ifthisequationissatisfied,thenanylossintheLiquidityPosition
resulting from a change in value from the underlying assets will
be made up by a positive payoff from the derivatives being held.Delta Hedging Liquidity Positions on Automated Market Makers
This results in a trading strategy whose net portfolio value is not
affected by directional changes in the price of the underlying assets.
The Liquidity Provider can profit from transaction fees without
risking losing value in liquidity provided in the pool.
Let 𝑝
𝑓
𝑎;𝑏
be the final price of token 𝑎 in terms of token𝑏, let 𝑐 be
the market price of an option, let𝑘 be the strike price of the option.
Recall the following equations for the payoff of an option:
Payoff of Long Call Option = 𝑚𝑎𝑥(0,𝑝
𝑓
𝑎;𝑏
−𝑘) −𝑐 (1)
Payoff of Short Call Option = 𝑐 −𝑚𝑎𝑥(0,𝑝
𝑓
𝑎;𝑏
−𝑘) (2)
Payoff of Long Put Option = 𝑚𝑎𝑥(0,𝑘 − 𝑝
𝑓
𝑎;𝑏
) −𝑐 (3)
Payoff of Short Put Option = 𝑐 −𝑚𝑎𝑥(0,𝑘 − 𝑝
𝑓
𝑎;𝑏
) (4)
4.2 Algorithm
We can formulate this optimization problem as a least squares
regression. We define Payoff(Derivatives, Final Price) as:
Payoff(Derivatives, Final Price)
=
∑︁
𝜃𝑖 ∈𝜃
𝜃𝑖 × Payoff(Derivative𝑖, Final Price), (5)
where Payoff(Derivatives, Final Price) : 𝜃,𝑝
𝑓
𝑎;𝑏
→ PNL.
We define the cost function of the linear regression as the following:
𝐽(𝜃) =
1
2
∑︁
𝑝𝑎;𝑏 ∈𝑃

Payoff(Derivatives, Final Price)
+ Liquidity Position PNL
2
Where Liquidity Position PNL is defined in 3.1.
Anadditionalconsiderationisthenumberofoptionsintheportfolio.
It is desirable to hold as simple of an options portfolio as possible. It
is well known that by adding L1 norm, we can encourage sparsity
in 𝜃, thereby resulting in a portfolio with fewer option contracts
[23].
Adding L1 Norm:
𝐽(𝜃) =
1
2
∑︁
𝑝𝑎;𝑏 ∈𝑃

Payoff(Derivatives, Final Price)
+ Liquidity Position PNL
2
+ 𝜆
∑︁
𝜃𝑖 ∈𝜃
|𝜃𝑖|
This loss function can be optimized via Stochastic Gradient De-
scent. Each 𝜃𝑖 ∈ 𝜃 can be positive or negative. A positive value is a
long position in the options contract, while a negative value is a
short position.
Note that this algorithm identifies a set of options that matches
any payoff diagram that can be expressed as a function of 𝑝
𝑓
𝑎;𝑏
→
PNL. In this paper, our goal is to delta-hedge the value of a liquidity
position. Thus, in the set of experiments in Section 5, we use the
algorithm in Section 4.2 to find a portfolio of options that negates
the Liquidity Position PNL for any 𝑝
𝑓
𝑎;𝑏
.
5 EXPERIMENTAL RESULTS
## 5.1 Method
We tested our Delta Hedging algorithm using the Liquidity Position
PNL function on both AMMs with uniform liquidity and AMMs
withconcentratedliquidity.Wetesttoseeifthealgorithmpresented
can find a near-optimal set of derivatives for a given Liquidity
Position PNL function. In other words, we test the following:
Liquidity Position PNL(𝑝
𝑓
𝑎;𝑏
)
+ Payoff(Derivative Combination, 𝑝
𝑓
𝑎;𝑏
)
?
≈ 0, ∀𝑝
𝑓
𝑎;𝑏
∈ (0..∞) (6)
Derivatives and their market statistics (bid prices, ask prices,
strike price, etc.) are retrieved from the Deribit exchange, which as
of July 2022 has 97% Open Interest (O.I.) Market Share of Ethereum
Options, 90% O.I. Market Share of Bitcoin Options, and 100% O.I.
Market Share of Solana Options [12].
5.2 Uniform Liquidity Experiment (Uniswap
v2)
In the following experiment, we tested the effectiveness of the delta-
hedging algorithm presented in this paper on the Ethereum-USDT
Pair in Uniswap v2, which employs uniform liquidity.
Let 𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚 be token 𝑎 and𝑈𝑆𝐷𝑇 be token𝑏. We execute the
experiment with the following steps:
(1) View transaction for liquidity provision in
the Uniswap v2 ETH-USDT pool at address
0x0d4a11d5eeaac28ec3f61d100daf4d40471f1852. Note
the price of ETH in terms of USDT - this will be 𝑝𝑖
𝑎;𝑏
(2) Construct a function for Liquidity Position PNL as described
in 3.1.
(3) Retrieve bid and ask quotes for all Ethereum options on
Deribit.
(4) Runthealgorithmasdescribedin4.2tofind𝜃 -thequantities
of each option to hold.
(5) Evaluate Equation (6)
Deribit had markets for 600 different Ethereum based options at
varying strike prices and exercise dates. This results in 1,200 possi-
ble positions as we can long or short each contract.
We examine the Liquidity Provision transaction at address
0x863572d128332e1b9ea1fec39b7c0df514af6d67146bb2537c08982c8-
6c517b3. From the transaction, we see that 143.78 𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚 tokens
and 232,015.77𝑈𝑆𝐷𝑇 tokens were provided to the pool. We outline
the initial values for variables in Table 2.
## 5.2.1 Results From Uniform Liquidity Experiment. Using the Equa-
tion in Section 3.1 to find the function for Liquidity Position PNL
as a function of final price, we generate Figure 6.
We would like to find a portfolio of options that results in the
sum of the Liquidity Position PNL and the payoff of the options
being equal to 0. Thus, the target PNL for our portfolio of options
is found by negating the function for Liquidity Position PNL.Adam Khakhar and Xi Chen
Table 2: Initial Values From Uniform Liquidity Delta Hedg-
ing Experiment
Symbol Value
𝑎 𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚
𝑏 𝑈𝑆𝐷𝑇
𝑝𝑖
𝑎;𝑏
$1,613.68
𝑝𝑖
𝑏;𝑏
$1
𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 143.78
𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
232,015.77
Figure 6: Liquidity Position PNL as a function of 𝑝
𝑓
𝑎;𝑏
for Ex-
periment 5.2.
After running the algorithm described in section 4.2, we find the
following payoff diagram for the constructed portfolio of options:
Figure 7.
The following is the resulting total strategy PNL plot: the sum-
mation of Liquidity Position PNL and the payoff of the options
portfolio Figure 8.
## 5.2.2 Uniform Liquidity Experiment Discussion. From Figure 8, we
can see the total strategy PNL as a function of final price in the
underlying assets. We can see that the directional risk of price
movement in 𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚 is nearly completely removed from the
PNL of the combination of the Liquidity Position PNL and portfolio
of options. The PNL as a percentage of Liquidity Provided to the
poolisnearly0forallfinalpricesof𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚.Weexpecttoachieve
even better performance (where PNL → 0∀𝑝
𝑓
𝑎;𝑏
) as the regression
model is trained further.
Thus,inthecaseofuniformlydistributedliquidity,thealgorithm
proposed to generate a portfolio of options to delta-hedge a Liq-
uidity Position is successful. Liquidity Providers can successfully
provide liquidity, receive transaction fees from each swap in the
pool, and not have directional exposure to 𝐸𝑡ℎ𝑒𝑟𝑒𝑢𝑚.
Figure 7: Options Portfolio Resulting PNL as a function of
𝑝
𝑓
𝑎;𝑏
for Experiment 5.2.
Figure 8: Strategy Combined Liquidity Position PNL and Op-
tions Portfolio Payoff Diagram for Experiment 5.2.
5.3 Concentrated Liquidity Experiment
(Uniswap v3)
In the following experiment, we tested the effectiveness of the delta-
hedging algorithm presented in this paper on the WBTC-USDC
Pair in Uniswap v3, which employs concentrated liquidity.𝑊𝐵𝑇𝐶
(Wrapped Bitcoin) is an ERC20 token, where each𝑊𝐵𝑇𝐶 can be
converedintoBTC.𝑊𝐵𝑇𝐶 enables𝐵𝑇𝐶 tobeusedontheEthereum
chain.
Let 𝐵𝑖𝑡𝑐𝑜𝑖𝑛 be token 𝑎 and 𝑈𝑆𝐷𝐶 be token 𝑏. We execute the
experiment with the following steps:Delta Hedging Liquidity Positions on Automated Market Makers
Table 3: Initial Values From Concentrated Liquidity Delta
Hedging Experiment
Symbol Value
𝑎 𝑊𝐵𝑇𝐶
𝑏 𝑈𝑆𝐷𝐶
𝑝𝑖
𝑎;𝑏
$23,776.00
𝑝𝑖
𝑏;𝑏
$1
𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 19.94
𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
265,132.51
𝑝𝑙
𝑎;𝑏
$18,050.17
𝑝𝑢
𝑎;𝑏
$40,089.53
(1) View transaction for liquidity provision in
the Uniswap v3 WBTC-USDC pool at address
0x99ac8cA7087fA4A2A1FB6357269965A2014ABc35.
Note the price of WBTC in terms of USDC - this will be 𝑝𝑖
𝑎;𝑏
(2) Construct a function for Liquidity Position PNL as described
in 3.1.
(3) Retrieve bid and ask quotes for all Bitcoin options on Deribit.
(4) Runthealgorithmasdescribedin4.2tofind𝜃 -thequantities
of each option to hold.
(5) Evaluate Equation (6)
We examine the Liquidity Provision transaction at address
0x33b9cf45ce3a3fb36d0c9b2dbaa31b2dd929d10be042b54f7c1ef1852-
d44c09a. From the transaction, we see that 19.94𝑊𝐵𝑇𝐶 tokens and
265,132.51𝑈𝑆𝐷𝐶 tokens were provided to the pool. Additionally,
in the transaction logs, we see that the 𝑖𝑛𝑡24 values for 𝑡𝑖𝑐𝑘𝐿𝑜𝑤𝑒𝑟
and 𝑡𝑖𝑐𝑘𝑈𝑝𝑝𝑒𝑟 are 51960 and 59940, respectively. To convert this
into a price in human readable format, recall from [11] that:
𝑝𝑎;𝑏 = 1.0001𝑖
Where 𝑖 is the tick value. Next, note that the number of decimals
chosen in the 𝑊𝐵𝑇𝐶 ERC-20 contract is 8, while the number of
decimals chosen in the𝑈𝑆𝐷𝐶 ERC-20 contract is 6. Thus, we have
to adjust for these order of magnitude differences in order to arrive
at the liquidity range upper and lower bounds in units of𝑈𝑆𝐷𝐶.
𝑝𝑙
𝑎;𝑏
= 1.000151960
× 108−6
= $18,050.17
and
𝑝𝑢
𝑎;𝑏
= 1.000159940
× 108−6
= $40,089.53
We outline the initial values for variables in Table 3.
## 5.3.1 Results From Concentrated Liquidity Experiment. Using the
Equation in Section 3.1 to find the function for Liquidity Position
PNL as a function of final price, we generate Figure 9.
We would like to find a portfolio of options that results in the
sum of the Liquidity Position PNL and the payoff of the options
being equal to 0. Thus, the target PNL function for our portfolio of
Figure 9: Liquidity Position PNL as a function of 𝑝
𝑓
𝑎;𝑏
for Ex-
periment 5.3.
options is equal to the function for Liquidity Position PNL reflected
over the x-axis.
After running the algorithm described in section 4.2, we find the
following payoff diagram for the constructed portfolio of options:
Figure 10.
Figure 10: Options Portfolio Resulting PNL as a function of
𝑝
𝑓
𝑎;𝑏
for Experiment 5.3.
The following is the resulting total strategy PNL plot: the sum-
mation of Liquidity Position PNL and the payoff of the options
portfolio Figure 8.
5.3.2 Concentrated Liquidity Experiment Discussion. From Figure
11, we can see the total strategy PNL as a function of final price in
the underlying assets. We can see that the directional risk of priceAdam Khakhar and Xi Chen
Figure 11: Strategy Combined Liquidity Position PNL and
Options Portfolio Payoff Diagram for Experiment 5.3.
movement in 𝐵𝑖𝑡𝑐𝑜𝑖𝑛 is nearly completely removed from the PNL
of the combination of the Liquidity Position PNL and portfolio of
options. The PNL as a percentage of Liquidity Provided to the pool
is < 1% for all final prices of 𝐵𝑖𝑡𝑐𝑜𝑖𝑛.
Thus, in the case of concentrated distributed liquidity, the algo-
rithm proposed to generate a portfolio of options to delta-hedge a
LiquidityPositionissuccessful.LiquidityProviderscansuccessfully
provide liquidity, receive transaction fees from each swap in the
pool, and not have directional exposure to 𝐵𝑖𝑡𝑐𝑜𝑖𝑛.
6 DISCUSSION
Our results clearly show that the least squares regression formula-
tion of the problem of finding a near-optimal set of derivatives to
approximate the negation of the Liquidity Position PNL function
works for Decentralized Exchanges with both uniform liquidity
and concentrated liquidity. The value of our approach to delta-
hedging liquidity positions lies in its use in the real-world. The
delta-hedging strategy described in this paper can be used by any
market participant with minimal set-up and algorithm execution
costs. Additionally, our delta-hedging strategy requires few trades
and does not require a low-latency trading system.
In addition to being used for delta-hedging liquidity positions,
the algorithm described in Section 4.2 can be used to find a set of
derivatives that approximate any PNL as a function of final asset
price. A natural use case is for the replication of the payoff of a
liquidity position. In this setting, individuals can participate in
the PNL of a liquidity position via purchasing the resulting set of
options on a Centralized Exchange such as Deribit, without making
any transactions on Decentralized Exchanges.
Loss Versus Rebalancing is another useful metric with many
interpretations introduced in concurrent work [17]. One method
for delta-hedging a liquidity position is achieved by buying and
selling the risky asset in the opposite way as the Automated Market
Maker does at Centralized Exchange prices [17]. While this strategy
seems intuitive, it might have potential issues in implementation.
Because the strategy requires many taker trades on both the bid
and ask side of the Limit Order Book, the market participant will
lose value due to the bid-ask spread: the difference between the
highest price a buyer is willing to pay (bid side of the Limit Order
Book) for the asset and the lowest price a seller is willing to sell
the asset (ask side of the Limit Order Book). Even on Binance, the
cryptocurrency exchange with the most 24-hour volume, the bid-
ask spread can be several basis points (hundredths of a percent)
for many cryptocurrencies [2]. If the strategy were to re-balance
several hundred times per day, it is easy to see that the portfolio
value would quickly diminish due to crossing the bid-ask spread.
Comparing the delta-hedging strategy presented in this paper with
the one in the Loss Versus Rebalancing work [17] would be an
interesting direction of future research.
It is important to note the limitations of the options based delta-
hedging approach. The model assumes that the derivatives market
has sufficient liquidity for the options portfolio. If the options port-
folio computed from the algorithm described in Section 4.2 includes
a significant position in a specific options contract with little liq-
uidity, the market participant can face high slippage in price when
executing the order. Additionally, the payoff expected from the
option is only guaranteed when exercising the option. The Deribit
options exchange offers European style options, which means that
the options can only be exercised at expiry. Therefore, the liquidity
providermustdecideonanappropriatecombinationofexpirydates
for the options when computing the optimal portfolio.
7 CONCLUSION
In this work, we presented an algorithm for delta-hedging Liquidity
Positions via derivatives while introducing a new metric, Liquidity
Position PNL, which directly measures the change in the net value
ofaLiquidityPositionasafunctionofpricemovementintheunder-
lying assets. The portfolio value of the Liquidity Position combined
with the derivatives portfolio determined by the algorithm does
not have directional risk associated with price movements in the
underlying assets in the liquidity pool. Liquidity Providers can use
this algorithm to effectively provide liquidity and earn transaction
fees from the protocol while not having to worry about the change
in value of the underlying assets in the pool.
We are excited about delta-neutral liquidity positions and plan
to apply the concept to more tasks such as Strategic Liquidity Pro-
vision [18]. We plan to further research quantitative strategies in
the economics that Decentralized Exchanges present.
We provide a repository including an implementation of the
algorithm:
https://github.com/adamkhakhar/lp-delta-hedge
ACKNOWLEDGMENTS
We are grateful to Ami Lipkind for their helpful discussions.
REFERENCES
[1] 2022. Introducing the Binance Market Maker Program. https://www.binance.com/
en/support/announcement/360034573691Delta Hedging Liquidity Positions on Automated Market Makers
[2] Raynor de Best. 2022. Biggest crypto exchanges 2022. https://www.statista.com/
statistics/864738/leading-cryptocurrency-exchanges-traders/
[3] Bruno Biais, Pierre Hillion, and Chester Spatt. 1995. An Empirical Analysis of
the Limit Order Book and the Order Flow in the Paris Bourse. The Journal of
Finance 50, 5 (1995), 1655–1689. http://www.jstor.org/stable/2329330
[4] Vitalik Buterin. 2014. Ethereum: A Next-Generation Smart Contract
and Decentralized Application Platform. https://ethereum.org/
669c9e2e2027310b6b3cdce6e1c52962/Ethereum_Whitepaper_-_Buterin_
2014.pdf
[5] Jay Cao, Jacky Chen, John Hull, and Zissis Poulos. 2020. Deep Hedging of
Derivatives Using Reinforcement Learning. The Journal of Financial Data Science
3, 1 (dec 2020), 10–27. https://doi.org/10.3905/jfds.2020.1.052
[6] L. Cermak, S. Zheng, Andrew Cahill, Lars Hoffman, and Eden Au. 2022. 2022
Digital Asset Outlook. https://www.tbstat.com/wp/uploads/2021/12/The-Block-
Research-2022-Digital-Asset-Outlook.v2.pdf
[7] Yianni Doumenis, Javad Izadi, Pradeep Dhamdhere, Epameinondas Katsikas,
and Dimitrios Koufopoulos. 2021. A Critical Analysis of Volatility Surprise in
Bitcoin Cryptocurrency and Other Financial Assets. Risks 9, 11 (2021). https:
//doi.org/10.3390/risks9110207
[8] Atis Elsts. 2021. Liquidity Math in Uniswap v3. https://atiselsts.github.io/pdfs/
uniswap-v3-liquidity-math.pdf
[9] Oguz Ersan, Nihan Dalgic, Cumhur Ekinci, and Mehmet Budur. 2021. High-
Frequency Trading and its Impact on Market Liquidity: A Review of Literature.
https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3756596
[10] Youssef Faqir-Rhazoui, Javier Arroyo, Miller-Janny Ariza-Garzom, and Samer
Hassan. 2021. Effect of the Gas Price Surges on User Activity in the DAOs of the
Ethereum Blockchain. https://eprints.ucm.es/id/eprint/64153/1/CHI_21.pdf
[11] H. Adams et al. 2021. Uniswap v3 Core. https://uniswap.org/whitepaper-v3.pdf
[12] JohnJansen.2022. ShapingtheCryptoOptionsIndustry. https://www.deribit.com/
[13] Guillaume Lambert. 2021. Understanding the Value of Uniswap v3 Liquidity
Positions. https://lambert-guillaume.medium.com/understanding-the-value-of-
uniswap-v3-liquidity-positions-cdaaee127fe7
[14] Stefan Loesch, Nate Hindman, Mark B Richardson, and Nicholas Welch. 2021.
Impermanent Loss in Uniswap v3. https://doi.org/10.48550/ARXIV.2111.09192
[15] Semyon Malamud and Marzena Rostek. 2017. Decentralized Exchange. Ameri-
can Economic Review (2017). https://pubs.aeaweb.org/doi/pdfplus/10.1257/aer.
20140759
[16] Fernando Martinelli and Nikolai Mushegian. 2019. A Non-Custodial Portfolio
Manager, Liquidity Provider, and Price Sensor. https://balancer.fi/whitepaper.pdf
[17] Jason Milionis, Ciamac C. Moallemi, Tim Roughgarden, and Anthony Lee Zhang.
2022. Automated Market Making and Loss-Versus-Rebalancing. https://doi.org/
10.48550/ARXIV.2208.06046
[18] MichaelNeuder,RithvikRao,DanielJ.Moroz,andDavidC.Parkes.2021. Strategic
Liquidity Provision in Uniswap v3. https://doi.org/10.48550/ARXIV.2106.12033
[19] Steven Poser. 2021. Market Makers in Financial Markets: Their Role, How They
Function,WhyTheyareImportant,andtheNYSEDMMDifference. https://www.
nyse.com/publicdocs/nyse/NYSE_Paper_on_Market_Making_Sept_2021.pdf
[20] Barnaby Robson, Karl Koch, and Arun Ghosh. 2021. Decentralized Ex-
changes and Automated Market Makers - Innovations, Challenges and
Prospects. https://assets.kpmg/content/dam/kpmg/cn/pdf/en/2021/10/crypto-
insights-part-2-decentralised-exchanges-and-automated-market-makers.pdf
[21] Jesús Rodriguez. 2022. Into the Block: Uniswap Protocol Insights. https://app.
intotheblock.com/insights/defi/protocols/uniswap
[22] Edward O. Thorpe and Sheen T. Kassouf. 1967. Beat the Market: A Scientific Stock
Market System (1st ed.). Random House.
[23] R. Tibshirani. 1996. Regression Shrinkage and Selection via the Lasso. Journal of
the Royal Statistical Society (Series B) 58 (1996), 267–288.
[24] Neelesh Tiruviluamala, Alexander Port, and Erik Lewis. 2022. A General
Framework for Impermanent Loss in Automated Market Makers. https:
//doi.org/10.48550/ARXIV.2203.11352
[25] Jiahua Xu, Krzysztof Paruch, Simon Cousaert, and Yebo Feng. 2021. SoK: De-
centralized Exchanges (DEX) with Automated Market Maker (AMM) Protocols.
https://doi.org/10.48550/ARXIV.2103.12732
A EQUATIONS
• Note that:
𝑝𝑖
𝑏;𝑏 = 𝑝
𝑓
𝑏;𝑏
= 1 (7)
• Constant Product Formula:
𝜅 = 𝑎𝑚𝑜𝑢𝑛𝑡𝑎 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑏 (8)
• Price from Constant Product Formula:
𝑝𝑎;𝑏 =
𝑎𝑚𝑜𝑢𝑛𝑡𝑏
𝑎𝑚𝑜𝑢𝑛𝑡𝑎
(9)
• Let 𝛿 represent the price change from 𝑝𝑖
𝑎;𝑏
to 𝑝
𝑓
𝑎;𝑏
:
𝛿 =
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
− 1 (10)
•
Impermanent Loss =
Final Value of Pool Assets
Value If Assets Were Held
− 1 (11)
•
Liquidity Position PNL =
Final Value of Pool Assets
Initial Value of LP Investment
−1 (12)
B LEMMA A: RELATION BETWEEN AMOUNT,
PRICE, AND 𝜅
𝜅 = 𝑎𝑚𝑜𝑢𝑛𝑡𝑎 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑏 from (8)
𝜅 =
𝑎𝑚𝑜𝑢𝑛𝑡𝑎
𝑎𝑚𝑜𝑢𝑛𝑡𝑎
×𝑎𝑚𝑜𝑢𝑛𝑡𝑎 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑏 multiply by
𝑎𝑚𝑜𝑢𝑛𝑡𝑎
𝑎𝑚𝑜𝑢𝑛𝑡𝑎
𝜅 = 𝑎𝑚𝑜𝑢𝑛𝑡𝑎 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑎 × 𝑝𝑎;𝑏 from (9)
𝑎𝑚𝑜𝑢𝑛𝑡𝑎 =
√︂
𝜅
𝑝𝑎;𝑏
rearrange (13)
𝑎𝑚𝑜𝑢𝑛𝑡𝑏 =
√︁
𝜅 × 𝑝𝑎;𝑏 substitute (14)
C LEMMA B: FINAL TOKEN AMOUNTS IN
TERMS OF PRICE
Given the initial values for price (𝑝𝑖
𝑎;𝑏
), initial deposit amounts
(𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎,𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
), liquidity range (𝑝𝑙
𝑎;𝑏
,𝑝𝑢
𝑎;𝑏
), and ending price
(𝑝
𝑓
𝑎;𝑏
), we derive a closed-form solution to find the ending token
amounts (𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 ,𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
) [13] [14] [8].
C.1 Case 𝑝
𝑓
𝑎;𝑏
≤ 𝑝𝑙
𝑎;𝑏
If the final price of 𝑎 in terms of 𝑏 is less than the lower price of
the liquidity position range, then only 𝑎 tokens will remain as all
𝑏 tokens would be swapped for 𝑎 tokens (as the price crosses the
lower tick). An AMM sells the outperforming asset in exchange for
the underperforming asset [14].
(𝑎𝑚𝑜𝑢𝑛𝑡𝑎 +
√︄
𝜅
𝑝𝑢
𝑎;𝑏
)(𝑎𝑚𝑜𝑢𝑛𝑡𝑏 +
√︃
𝜅 · 𝑝𝑙
𝑎;𝑏
) = 𝜅 From [11]
(𝑎𝑚𝑜𝑢𝑛𝑡𝑎 +
√︄
𝜅
𝑝𝑢
𝑎;𝑏
)(
√︃
𝜅 · 𝑝𝑙
𝑎;𝑏
) = 𝜅 𝑎𝑚𝑜𝑢𝑛𝑡𝑏 = 0
𝑎𝑚𝑜𝑢𝑛𝑡𝑎 ·
√︃
𝑝𝑙
𝑎;𝑏
+
v u t
𝜅 · 𝑝𝑙
𝑎;𝑏
𝑝𝑢
𝑎;𝑏
=
√
𝜅 Simplify
𝑎𝑚𝑜𝑢𝑛𝑡𝑎 =
√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
√︃
𝑝𝑙
𝑎;𝑏
· 𝑝𝑢
𝑎;𝑏
(15)
C.2 Case 𝑝
𝑓
𝑎;𝑏
≥ 𝑝𝑢
𝑎;𝑏
Similar to C.1, f the final price of 𝑎 in terms of𝑏 is greater than the
upper price of the liquidity position range, then only𝑏 tokens willAdam Khakhar and Xi Chen
remain as all 𝑎 tokens would be swapped for𝑏 (as the price crosses
the upper tick).
(𝑎𝑚𝑜𝑢𝑛𝑡𝑎 +
√︄
𝜅
𝑝𝑢
𝑎;𝑏
)(𝑎𝑚𝑜𝑢𝑛𝑡𝑏 +
√︃
𝜅 · 𝑝𝑙
𝑎;𝑏
) = 𝜅 From [11]
√︄
𝜅
𝑝𝑢
𝑎;𝑏
(𝑎𝑚𝑜𝑢𝑛𝑡𝑏 +
√︃
𝜅 · 𝑝𝑙
𝑎;𝑏
) = 𝜅 𝑎𝑚𝑜𝑢𝑛𝑡𝑎 = 0
𝑎𝑚𝑜𝑢𝑛𝑡𝑏
√︃
𝑝𝑢
𝑎;𝑏
+
v u t
𝜅 · 𝑝𝑙
𝑎;𝑏
𝑝𝑢
𝑎;𝑏
=
√
𝜅
𝑎𝑚𝑜𝑢𝑛𝑡𝑏 =
√
𝜅(
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) (16)
C.3 Case 𝑝𝑙
𝑎;𝑏
< 𝑝
𝑓
𝑎;𝑏
< 𝑝𝑢
𝑎;𝑏
When the ending price is within the liquidity range, we can modify
equations (15, 16) to account for𝑝
𝑓
𝑎;𝑏
being within the range. Specif-
ically, for 𝑎𝑚𝑜𝑢𝑛𝑡𝑎, we can replace 𝑝𝑙
𝑎;𝑏
with 𝑝
𝑓
𝑎;𝑏
and for 𝑎𝑚𝑜𝑢𝑛𝑡𝑏,
we can replace 𝑝𝑢
𝑎;𝑏
with 𝑝
𝑓
𝑎;𝑏
.
𝑎𝑚𝑜𝑢𝑛𝑡𝑎 =
√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝
𝑓
𝑎;𝑏
· 𝑝𝑢
𝑎;𝑏
(17)
𝑎𝑚𝑜𝑢𝑛𝑡𝑏 =
√
𝜅(
√︂
𝑝
𝑓
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) (18)
C.4 Final Token Amounts in Terms of Price
and Liquidity
𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 =
          
        

√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
√︃
𝑝𝑙
𝑎;𝑏
·𝑝𝑢
𝑎;𝑏
𝑝
𝑓
𝑎;𝑏
≤ 𝑝𝑙
𝑎;𝑏
√
𝜅 ·
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝
𝑓
𝑎;𝑏
·𝑝𝑢
𝑎;𝑏
𝑝𝑙
𝑎;𝑏
< 𝑝
𝑓
𝑎;𝑏
< 𝑝𝑢
𝑎;𝑏
0 𝑝
𝑓
𝑎;𝑏
≥ 𝑝𝑢
𝑎;𝑏
(19)
𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
=
      
    

0 𝑝
𝑓
𝑎;𝑏
≤ 𝑝𝑙
𝑎;𝑏
√
𝜅(
√︃
𝑝
𝑓
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) 𝑝𝑙
𝑎;𝑏
< 𝑝
𝑓
𝑎;𝑏
< 𝑝𝑢
𝑎;𝑏
√
𝜅(
√︃
𝑝𝑢
𝑎;𝑏
−
√︃
𝑝𝑙
𝑎;𝑏
) ≥ 𝑝𝑢
𝑎;𝑏
(20)
D DERIVATION OF IMPERMANENT LOSS
D.1 Impermanent Loss: Uniform Liquidity
D.1.1 Final Value of Pool Assets: Uniform Liquidity.
Final Value of Pool Assets
= 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 + 𝑝
𝑓
𝑏;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
= 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
from (7)
= 𝑝
𝑓
𝑎;𝑏
×
√︄
𝜅
𝑝
𝑓
𝑎;𝑏
+
√︂
𝜅 × 𝑝
𝑓
𝑎;𝑏
from Lemma A: (13), (14)
=
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝
𝑓
𝑎;𝑏
×
©
­
«
𝑝
𝑓
𝑎;𝑏
×
√︄
𝜅
𝑝
𝑓
𝑎;𝑏
+
√︂
𝜅 × 𝑝
𝑓
𝑎;𝑏
ª
®
¬
multiply by
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝
𝑓
𝑎;𝑏
=
1
√︃
𝑝
𝑓
𝑎;𝑏
×

𝑝
𝑓
𝑎;𝑏
×
√
𝜅 + 𝑝
𝑓
𝑎;𝑏
×
√
𝜅

simplify
= 2
√︂
𝜅 × 𝑝
𝑓
𝑎;𝑏
rearrange
D.1.2 Value if Assets Were Held.
Value if Assets Were Held
= 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 + 𝑝
𝑓
𝑏;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
= 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏 from (7)
= 𝑝
𝑓
𝑎;𝑏
×
√︄
𝜅
𝑝𝑖
𝑎;𝑏
+
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
from Lemma A: (13), (14)
=
1
√︃
𝑝𝑖
𝑎;𝑏

𝑝
𝑓
𝑎;𝑏
×
√
𝜅 + 𝑝𝑖
𝑎;𝑏 ×
√
𝜅

multipy by
√︃
𝑝𝑖
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
=
𝑝
𝑓
𝑎;𝑏
+ 𝑝𝑖
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
×
√
𝜅 simplify
=
©
­
­
«
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
+
√︃
𝑝𝑖
𝑎;𝑏
ª
®
®
¬
×
√
𝜅 simplifyDelta Hedging Liquidity Positions on Automated Market Makers
D.1.3 Impermanent Loss: Uniform Liquidity.
Impermanent Loss
=
Final Value of Pool Assets
Value If Assets Were Held
− 1 from (11)
=
2
√︃
𝜅 × 𝑝
𝑓
𝑎;𝑏
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
+
√︃
𝑝𝑖
𝑎;𝑏
!
×
√
𝜅
− 1 from D.1.1 and D.1.2
=
2
√︃
𝑝
𝑓
𝑎;𝑏
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
+
√︃
𝑝𝑖
𝑎;𝑏
! − 1 simplify
√
𝜅
√
𝜅
= 1
=
2
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏

𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
+ 1
 − 1 multiply denominator by
√︃
𝑝𝑖
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
=
2
√︃
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
× (𝛿 + 2)
− 1 from (10)
=
2
√
𝛿 + 1
𝛿 + 2
− 1 from (10),
√
𝛿 + 1 =
v u u t
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
D.2 Impermanent Loss: Concentrated Liquidity
D.2.1 Final Value of Pool Assets: Concentrated Liquidity.
Final Value of Pool Assets = 𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 + 𝑝
𝑓
𝑏;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
Lemma B, Equations 19 and 20 define 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 and 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
as
functions of price.
D.2.2 Value if Assets Were Held. Same as the case with Uniform
Liquidity D.1.2.
D.2.3 Impermanent Loss: Concentrated Liquidity.
Impermanent Loss
=
Final Value of Pool Assets
Value If Assets Were Held
− 1 from (11)
=
𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
𝑝
𝑓
𝑎;𝑏
√︃
𝑝𝑖
𝑎;𝑏
+
√︃
𝑝𝑖
𝑎;𝑏
!
×
√
𝜅
from D.2.1, D.2.2
Lemma B, Equations 19 and 20 define 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 and 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
as
functions of price.
E DERIVATION OF LIQUIDITY POSITION PNL
E.1 Liquidity Position PNL: Uniform Liquidity
E.1.1 Initial Value of LP Investment.
Initial Value of LP Investment
= 𝑝𝑖
𝑎;𝑏 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 + 𝑝𝑖
𝑏;𝑏 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
= 𝑝𝑖
𝑎;𝑏 ×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏 from (7)
= 𝑝𝑖
𝑎;𝑏 ×
√︄
𝜅
𝑝𝑖
𝑎;𝑏
+
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
from Lemma A: (13), (14)
= 2
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
simplify
E.1.2 Liquidity Position PNL: Uniform Liquidity.
Liquidity Position PNL
=
Final Value of Pool Assets
Initial Value of LP Investment
− 1 from (12)
=
2
√︃
𝜅 × 𝑝
𝑓
𝑎;𝑏
2
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
− 1 from D.1.1 and E.1.1
=
v u u t
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
− 1 simplify
=
√
𝛿 + 1 − 1 from (10), we have
𝑝
𝑓
𝑎;𝑏
𝑝𝑖
𝑎;𝑏
= 𝛿 + 1
E.2 Liquidity Position PNL: Concentrated
Liquidity
E.2.1 InitialValueofLPInvestment. SameasthecasewithUniform
Liquidity E.1.1.
E.2.2 Liquidity Position PNL: Concentrated Liquidity.
Liquidity Position PNL
=
Final Value of Pool Assets
Initial Value of LP Investment
− 1 from (12)
=
Final Value of Pool Assets
2
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
− 1 from E.2.1
=
𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
2
√︃
𝜅 × 𝑝𝑖
𝑎;𝑏
− 1 from D.2.1
=
𝑝
𝑓
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
𝑝𝑖
𝑎;𝑏
×𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑎 +𝑎𝑚𝑜𝑢𝑛𝑡𝑖
𝑏
− 1 from E.2.1
Lemma B, Equations 19 and 20 define 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑎 and 𝑎𝑚𝑜𝑢𝑛𝑡
𝑓
𝑏
as
functions of price.