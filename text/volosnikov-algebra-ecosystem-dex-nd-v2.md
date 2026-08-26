---
sha256: 198cdb05938811b6dadf3eede288d4eb4aff7ab331d96261494889824fec26cf
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 19422
---
ALGEBRAEcosystem: Decentralized exchange
Abstract. In this article, we review main features of the Algebra Decentralized Exchange (DEX)
and compare it with other DEXs and their approach to decentralized trading. The key differences
between Algebra and other exchanges are dynamic fees, built-in farming, and deflationary tokens
support. We are taking a closer look at these features and exploring exchange users' benefits.
​
​ 1. Dynamic Fees
​ Introduction
Decentralized exchanges (DEX) are a fundamental constituent of the rapidly-developing field of
decentralized finance. The functioning of the financial system is impossible without a stable and
reliable ability to exchange assets. This is why a number of developers and researchers are
focused on the development of exchanges that would enable this financial system. In addition to
breakthrough technologies like Uniswap, there is work being done on a wide range of alternative
approaches and solutions.
The leading direction in the field of DEXs (decentralized exchanges) is the use of automated
market makers – AMM, which provide users with the opportunity to conduct instant exchanges
without the participation of third parties as facilitators. The standard approach to implementing
AMMs at the moment is to constantly follow some invariant, particularly the constant market
function. For Uniswap V2 and other similarAMMs, it can be expressed as follows:
𝑋 · 𝑌 = 𝑘 (1)
where X and Y, respectively, are the reserves of the first and second asset in the pool, and k is a
constant determined when creating a pair. This formula provides a simple calculation of the swapresults, the stability of the exchange and its functioning at any time. However, this system relies
completely on providing a sufficient number of reserves to maintain an acceptable level of
liquidity and reflect the real market price.
The role of providing reserves is assigned to liquidity providers who place their assets in
exchange for a share of the fees collected during the trading. For this reason, the provision of
attractive and economically reasonable conditions for liquidity providers is fundamental for the
viability and functionality of an AMM. While examining the attractiveness of the liquidity
provision strategy, it is rational to compare it with the "zero strategy" – storing assets on the
account without performing any actions, it is also referred to as a “hold strategy”. The
dependence of the liquidity provider's profit compared to the “hold strategy” when the price
moves under zero fee, is depicted in Figure 1.
Fig. 1 Comparison of The Liquidity Provider's Profit Relative To The Hold Strategy
The phenomenon of a provider's negative profit when the price moves is called impermanent
loss, since the losses do not occur when the price returns to the initial level. The nature of
impermanent losses significantly depends on the type of constant function – when using an
invariant other than (1), the depicted loss curve may be more flat or steep. Due to theimpermanent loss, the volatile price of an asset is a risk factor for liquidity providers, which
should be compensated by a high level of potential profit from fees.
The key innovations implemented for the first time in Uniswap V3 are aimed at solving the
problems described above when providing liquidity. When using the technology of concentrated
liquidity, assets are placed at specified price intervals, called positions (Fig. 2). This liquidity is
used during trading and collects a fee only if the current price is within the range set by the
position, which increases the efficiency of using the liquidity provider's funds. Using positions
allows you to achieve an uneven distribution of liquidity and, as a result, different price
behaviour and temporary losses.
Fig. 2 Examples of Liquidity Placement Ranges
Therefore, the placement of assets within price ranges not only increases the efficiency of funds
but also makes the overall market function much more flexible due to the arbitrary distribution ofliquidity. Due to this, liquidity providers have the ability to independently adjust the conditions
that minimize the impermanent loss. Another important factor is the presence of several pools
with different fees for each pair of assets. Via self-regulation, based on supply and demand, the
ability to choose the applied pool theoretically leads to the establishment of optimal
compromised conditions for all participants in the trading process.
However, the effectiveness of the overall liquidity is significantly reduced when several pools are
used on a certain pair, all at once. For instance, only 72% of providers choose a pool with a 0.3%
fee on the ETH/USDC pair, as can be seen in Figures 3.1 - 3.4. While the remaining 28%
virtually exist separately. The less liquidity is provided for a specific period, the less profitable
the exchange is due to a strong price change during the exchange. Сonsequently, such
distribution of assets leads to the fact that in a pool with 0.3%, exchanges move the price more
strongly than in a situation where all the liquidity is provided in one pool. “One pool” approach
is used inAlgebra.
Figure 3.1 1INCH\ETH Pool Figure 3.2 ETH\USDC Pool
Figure 3.3 BAT\ETH Pool Figure 3.4 WBTC\ETH PoolOptimal Conditions
All participants interacting with a DEX can be divided into three categories:
1. Regular Traders
2. Arbitrageurs
3. Liquidity Providers
Each group of participants has its own goals and strives to reach maximum profit with minimal
risks. The interests of groups can either coincide or contradict. On the one hand, liquidity
providers are interested in maximizing the profit from their investments, which is positively
influenced by high volume, high fees and low volatility. On the other hand, high fees contradict
the interests of users who carry out trades.
Fig. 4 User Groups and Their InterestsThe effective functionality of a DEX requires a balanced and compromised solution that meets
the interests of all parties. Since the entire system can be considered closed – money does not
emerge from anywhere – an increase in the profit of one of the participants, usually, has the
opposite effect on others.
As already mentioned before, the fee size is one of the tools for redistributing profits and,
consequently, regulating the balance of interests. The presence of three pool options for each pair
in Uniswap V3 is precisely aimed at maintaining a balance of interests – the options are initially
designed to optimally match three different asset classes, such as stable pairs, normal and exotic
(Fig. 5).
Fig. 5 Uniswap V3 Pools
However, as already mentioned, this approach has a number of disadvantages: the dispersion of
liquidity, the complication of interaction with DEX, etc. In addition, the nature of the assets’
behaviour rarely remains the same for a long period of time. This fact can be demonstrated by
the history of ETH prices to USDC (Fig. 6). During periods of high demand, volatility increases
significantly, the price begins to change significantly and drastically – at this time, the losses of
liquidity providers increase, which should force them to move assets to a pool with higher fees.
On the other hand, there are also time intervals with a more stable price.Fig. 6 History of ETH/USDC Price
However, the mechanism of the fees’ correction, with the help of several pools, turns out to be
very inertial in such situations – it is unclear what the further behaviour of the asset will be, and
also which pool will provide the greatest liquidity and trading volumes. This is the reason for the
initially selected "type" of the asset and the pool to be mainly preserved, which leads to inferior
conditions and lost profits for participants.
To solve this problem, Algebra offers a dynamic fee mechanism that will enable the
concentration of liquidity in one pool and guarantee the balance between participants, increasing
the income of each of the parties.​ Dynamic Fee Mechanism
To find the optimal commission amount, depending on the nature of the asset's behaviour, the
following indicators are monitored:
1. Volatility
2. Liquidity
3. Trading Volume
High liquidity is supported by beneficial conditions for providers, which consist of high trading
volume with low volatility. In this case, the following situations are possible for providers:
High volume Low volume
High volatility Average income Negative income
Low volatility High income Average income
Table 1 Dependence of Profitability For LP On Market Behaviour
From this, the following conclusions can be drawn:
​ When the volatility is high, it is necessary to increase the fee to compensate potential
losses of liquidity providers;
​ When the volume is low and there is sufficient liquidity, fees should be reduced in order
to attract more volume.
This is why Algebra offers a complex formula for determining the current fees in the pool, taking
into account changes in the parameters of volatility, trading volume and current liquidity.​ Volatility
First of all, based on the time-weighted moving average (2), the current volatility is calculated in
the form of a standard deviation (3).
In this case:
- the time points corresponding to the available price observations, τ
- the value of the price at the moment, 𝑃(τ) τ
- the time during which this price was maintained, ∆𝑡(τ)
- time period (in seconds). Volatility, average values of the volume and the liquidity for every 𝑇
time point are calculated during the period.
TWMA 𝑃(𝑡) =
1
𝑇
τ ∈ [𝑡−𝑇, 𝑡]
∑ 𝑃(τ) · ∆𝑡(τ) (2)
volatility δ(𝑡) =
1
𝑇
τ ∈ [𝑡−𝑇, 𝑡]
∑ 𝑃(τ) − 𝑃(τ) ( )
2
(3)
It should be noted that these statistical parameters are calculated for the logarithmic prices
(ticks), which removes the dependence on the absolute value of the price – a price change from
1000 to 1100 will not cause greater volatility than a change from 100 to 110.
The received volatility value is then used to determine the base fee level. To do this, a formula
based on the sum of two sigmoids is used. The standard sigmoid is given by the formula (4).
𝑦 =
1
1+𝑒
−𝑥 (4)Fig. 7 Graph of The Standard Sigmoid Function
A small modification allows us to create the following formula, which provides considerably
more flexibility:
𝑦 =
α
1+𝑒
γ β−𝑥 ( ) (5)
The following coefficients have been added to the formula:
​ α - allows scaling the maximum value of the sigmoid
​ β - is responsible for the linear shift along the x-axis
​ γ - regulates the "steepness" of the sigmoid
In this case, you can derive the following formula:
𝑦 =
α1
1+𝑒
γ1
β1
−𝑥 ( ) +
α2
1+𝑒
γ2
β2
−𝑥 ( ) (6)Fig. 8 Step Function of Sigmoids
By changing the coefficients, it is possible to provide a wide range of different options:The derived formula is convenient for calculation and has sufficient flexibility, which allows you
to set the dependence of the fees’base level on volatility:
𝐹𝑒𝑒𝑏𝑎𝑠𝑒
𝑡 ( ) =
α1
1+𝑒
γ1
β1
−δ(𝑡) ( ) +
α2
1+𝑒
γ2
β2
−δ(𝑡) ( ) (7)
Formula (7) can be used to calculate the commission, but it does not take into account the other
important factors – volume and liquidity.
​ Volume
It is known that the absolute values of the trading volume for different assets can differ
significantly – $1,000,000 is not the same as 1,000,000 ETH. For this reason, it is necessary to
build a general indicator that will uniformly characterize the intensity of trading for different
assets.
In the case of the market function (1), the amount of liquidity is calculated using the formula:
𝐿 = 𝑋 · 𝑌 (8)
Knowing the trading volume of each of the assets in the pool, you can get a value that
characterizes the amount of liquidity used:𝐿
~
= 𝑉1
· 𝑉2
(9)
where V1 and V2, respectively, are the trading volumes of assets 1 and 2. In this case, the
following ratio characterizes the level of intensity of use of the available liquidity in the pool:
𝐼𝑡
=
𝐿
~
𝑡
𝐿𝑡
(10)
By using the formula (5) and determining the necessary threshold values, it is possible to create a
"regulator" that reflects the "sufficiency" of the trading volume at the moment:
α𝑅
1+𝑒
γ𝑅
β𝑅
−𝐼𝑡 ( ) (11)
It is reasonable to choose the coefficient equal to 1, to let the trading volume play the role of a α𝑅
threshold regulator that reduces the commission at low exchange activity.
Then the final fee function turns out to be as follows:
𝐹𝑒𝑒 𝑡 ( ) = 𝐹𝑒𝑒𝑏𝑎𝑠𝑒
𝑡 ( ) ·
1
1+𝑒
γ𝑅
β𝑅
−𝐼𝑡 ( ) (12)
More detailed:
𝐹𝑒𝑒 𝑡 ( ) =
α1
1+𝑒
γ1
β1
− δ(𝑡) ( ) +
α2
1+𝑒
γ2
β2
− δ(𝑡) ( ) ( )·
1
1+𝑒
γ𝑅
β𝑅
−
𝑉
1
(𝑡)·𝑉
2
(𝑡)
𝐿
𝑡
⎛
⎝
⎞
⎠
(13)​ Dynamic Fee Usage
Based on the historical data of trades on Uniswap V3 pools, the adaptive fees values were
calculated at different time points. The reaction of the fees functions adequately corresponds to
what is happening on the market.
On each chart, the white colour corresponds to the zones with the lowest fees, and the dark red
colour corresponds to the highest.
​ ETH/USDC
ETH/USDC price chart in a pool with a fee of 0.05%:
The graph above demonstrates that the control function successfully detects time intervals with
high volatility and high demand for the asset, which indicates the need to increase the fee in dark
red zones. Still, there are periods of relative calm with low trading volume and weak volatility,
during which time it is reasonable to reduce the fee.
The more detailed period from 8/17/2021 to 9/13/2021:The period from 7/25/2021 to 8/1/2021:
The period from 7/2/2021 to 7/6/2021:
In the more detailed charts, you can observe the fee's reaction to changes in market conditions in
more detail. Thus, it is recommended to increase the fees drastically during moments where it
collapses and rises, like in early September 2021, which simultaneously stimulates trading with a
reduced commission during periods of calm.
​ SHIBA/ETH
Asimilar graph of the same fee function for the SHIBA/ETH pool:This chart reflects a pair with a more volatile and hyped asset, which forces the function to set a
high fee most of the time.
​ DAI/USDC
Asimilar graph of the same fee function for the DAI/USDC pool:Apool with a stablecoin has much lower volatility. This fact, combined with a stable trading
volume, encourages the function to keep the fee at a minimum level.
Conclusion
According to the results of these tests, it can be concluded that the received fee function responds
adequately and on time to changes in the nature of price behaviour.Apair of stablecoins
consistently has the lowest fees, and the fees of more volatile assets depend on the market
situation. This is why such management of the commission will allow for balancing the interests
of various traders, providing the most effective and favourable conditions.
​
​ 2. Built-in Farming
Overview
After the user has provided liquidity for a certain range, he receives an ERC-721 token tied to
this range. This token can be used, not only as a proof of the provided liquidity, but also as a tool
for yield-farming.
To receive rewards, a liquidity provider can participate in one of the farming Campaigns. A
Campaign is a time-limited, pool-based incentive program that contains a certain amount of
reward tokens.
To participate in the Campaign, one needs to send an ERC-721 token to the farming contract,
which will be stored on it until the end of the Campaign. After the end of the Campaign, all
reward tokens will be distributed among the liquidity providers who participated in the
Campaign, and all ERC-721 tokens will be returned back.
The amount of the reward that a particular liquidity provider will receive depends on the time
while her liquidity was in the price range in which the trades took place.For proper reward calculation for each Campaign participant we invented an entity called a
Virtual pool. A Virtual pool is a simplified copy of a real pool; it is used to track the time while
the liquidity of different providers is active.
The calculation of the time when liquidity was active for a certain period is performed as
follows:
𝑠𝑒𝑐𝑜𝑛𝑑𝑠𝑃𝑒𝑟𝐿𝑖𝑞𝑢𝑖𝑑𝑖𝑡𝑦 =
𝑟𝑎𝑛𝑔𝑒𝑆𝑒𝑐𝑜𝑛𝑑𝑠𝐼𝑛𝑠𝑖𝑑𝑒
𝑟𝑎𝑛𝑔𝑒𝐿𝑖𝑞𝑢𝑖𝑑𝑖𝑡𝑦
(15)
where rangeSecondsInside is the time while the price was at the range of provided liquidity, and
rangeLiquidity is all of the liquidity on that range.
The time while liquidity was active on a given range is calculated as:
𝑝𝑜𝑠𝑖𝑡𝑖𝑜𝑛𝑆𝑒𝑐𝑜𝑛𝑑𝑠𝐼𝑛𝑠𝑖𝑑𝑒 = 𝑠𝑒𝑐𝑜𝑛𝑑𝑠𝑃𝑒𝑟𝐿𝑖𝑞𝑢𝑖𝑑𝑖𝑡𝑦 * 𝑝𝑜𝑠𝑖𝑡𝑖𝑜𝑛𝐿𝑖𝑞𝑢𝑖𝑑𝑖𝑡𝑦 (16)
where positionLiquidity is the value that represents position’s liquidity.
Now, knowing the time while the liquidity was active, we can calculate the reward for the given
Campaign participant:
𝑟𝑒𝑤𝑎𝑟𝑑 =
𝑡𝑜𝑡𝑎𝑙𝑅𝑒𝑤𝑎𝑟𝑑 * 𝑝𝑜𝑠𝑖𝑡𝑖𝑜𝑛𝑆𝑒𝑐𝑜𝑛𝑑𝑠𝐼𝑛𝑠𝑖𝑑𝑒
𝑐𝑎𝑚𝑝𝑎𝑖𝑔𝑛𝐷𝑢𝑟𝑎𝑡𝑖𝑜𝑛
(17)
where totalReward is the total reward amount, and campaignDuration is the duration of the
Campaign.
Every time there is a swap in the real pool, or a new participant takes part in the event, the
Virtual pool recalculates the rewards for each participant of the Campaign.Example
Total reward amount of the Campaign is 180 tokens. The Campaign lasts 60 minutes.
4 liquidity providers participate in the Campaign. Their positions have the following parameters:
Provider #1: Liquidity: 10 points, was active for 30 minutes
Provider #2: Liquidity: 20 points, was active for 10 minutes
Provider #3: Liquidity: 30 points, was active for 30 minutes
Provider #4: Liquidity: 100 points, was inactiveLet's depict the time while liquidity was active on rangesA, B, C, D:It should be noted that the liquidity of Provider #4, located on range D, was inactive.
At the end of the Campaign, the rewards were distributed among the providers as follows:
Provider #1 received of total amount (70 tokens) (
20* 10
10
+
10*10
30
)/60 =
7
18
Provider #2 received of total amount (20 tokens) (
10*20
30
)/60 =
2
18
Provider #3 received of total amount (90 tokens) (
30*30
30
)/60 =
9
18
Despite the fact that 4 liquidity providers participated in the Campaign, the rewards were
distributed only among those providers whose liquidity was active for at least some time.
Provider #4 did not receive any awards.Conclusion
Therefore, Algebra implements the following features for providing the best exchange
experience to all the participants:
— An innovative adaptive fee formula guarantees optimal values ​ ​ for both liquidity providers and
traders.
— Built-in farming allows projects to increase their attractiveness for holders and investors, in
the meanwhile giving liquidity providers an opportunity to make profit from their deposited
funds.
These features, as well as provide support for deflationary tokens, will place Algebra in a leading
position in DeFi space.