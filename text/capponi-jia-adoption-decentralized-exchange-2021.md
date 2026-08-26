---
sha256: 9ab8aa585696f7a02ae7d94a71d6f2f77bdb13c729e3a845039d33297b99d262
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 169413
---
The Adoption of Blockchain-Based Decentralized Exchanges
Agostino Capponi∗
, Ruizhe Jia†
July 22, 2021
Abstract
We investigate the market microstructure of Automated Market Makers (AMMs), the most
prominent type of blockchain-based decentralized exchanges. We show that the order execution
mechanism yields token value loss for liquidity providers if token exchange rates are volatile.
AMMs are adopted only if their token pairs are of high personal use for investors, or the
token price movements of the pair are highly correlated. A pricing curve with higher curvature
reduces the arbitrage problem but also investors’ surplus. Pooling multiple tokens exacerbates
the arbitrage problem. We provide statistical support for our main model implications using
transaction-level data of AMMs.
Keywords: Crypto tokens; FinTech; Decentralized Finance; Market Microstructure.
∗
Columbia University, Department of Industrial Engineering and Operations Research, Email: ac3827@columbia.edu
†
Columbia University, Department of Industrial Engineering and Operations Research, Email: rj2536@columbia.edu.
1
arXiv:2103.08842v4 [q-fin.TR] 21 Jul 20211 Introduction
Since the emergence of Bitcoin in 2008, practitioners and academics have argued that financial inno-
vations such as tokenization of assets and decentralized ledgers, along with the backbone blockchain
technology, will disrupt traditional financial services (see, e.g., Campbell (2016), Yermack (2017),
Cong and He (2019), Chiu and Koeppl (2019), Cong, Li, and Wang (2020), Gan, Tsoukalas, and
Netessine (2021)). However, despite thousands of crypto tokens have been created and the total
capitalization of cryptocurrencies has exceeded 1.7 trillions as of early 2021, no blockchain-based
financial service providers has yet truly challenged traditional financial intermediaries. Ironically,
most transactions of crypto tokens still rely on unregulated centralized intermediaries that expose
investors to the risk of thefts and exit scams (see, e.g., Gandal et al. (2018)).
In the mid of 2020, a new type of blockchain application called decentralized finance, and
commonly referred to as DeFi, has emerged (see Harvey, Ramachandran, and Santoro (2021) for an
overview). DeFi utilizes open-source smart contracts on blockchains to provide financial services
which typically rely on centralized financial intermediaries. One of the most prominent DeFi
innovations are decentralized exchanges which run on the Ethereum blockchain. Most of these
exchanges utilize an Automated Market Maker (AMM) smart contract, which makes the market
according to a deterministic algorithm, instead of utilizing order books and relying on central
intermediaries. The largest of these decentralized exchanges, Uniswap, has become the fourth-
largest cryptocurrency exchange by daily trading volume, just a few months after its launch (Kharif
(2020)).
The AMMs built on blockchains are revolutionary in many ways. First, the settlement of
transactions is instantaneous, after they are confirmed and included on the blockchain. Prior to
settlement, traders still retain full control of their tokens. This eliminates counterparty risk for
the users. Second, users of AMMs do not need to be paired to complete a transaction. Rather,
they gain immediate access to available liquidity by interacting with the smart contract. Thirdly,
different from traditional centralized exchanges where liquidity providers are typically professional
market makers, any token holder can become a liquidity provider by depositing their tokens and
earning fees from trading activities.
The mechanism underlying decentralized exchanges is fundamentally different from that of
traditional exchanges. Hence, existing market microstructure literature has little to say about
promises and pitfalls of this new form of exchanges. Many important questions remain unanswered:
Can AMM provide sufficient incentives for provision of liquidity? Will there be any transaction
2breakdown where the liquidity reserve of the AMM is drained? What kind of tokens are most
suitable for AMMs? How does the AMM structure affect trading activities and economic incentives
of market participants?
In this paper, we develop a game theoretical model to answer the questions above, and provide
empirical support to our main model implications. We show that, even without any information
asymmetry, liquidity providers face arbitrage problems if the token exchange rate fluctuates. This
stands in contrast with the adverse selection problem that market makers face in a centralized
limit-order-book exchange (see, for instance, Glosten and Milgrom (1985)). While market makers
in a centralized limit-order-book exchange can alleviate adverse selection through bid-ask spreads,
liquidity providers in the AMM can neither charge a bid-ask spread nor front-run because of the
order execution structure of blockchain.
We analyze the incentives of liquidity providers and characterize the subgame perfect equilib-
rium of the game. At equilibrium, if the exchange rate of tokens is too volatile, liquidity providers
do not deposit their tokens in the AMM, which leads to a “liquidity freeze”. In such case, the
expected fee revenue from providing liquidity is lower than the expected arbitrage loss plus the
opportunity cost from holding the tokens to deposit in the AMM. Moreover, a “liquidity freeze”
is less likely to occur if investors extract large private benefits from using their tokens on the cor-
responding platforms, or if the price movement of two tokens are highly correlated. In the former
case, investors would have strong incentives to trade, hence resulting in large trading volumes and
high fee revenues for liquidity providers; in the latter case, the prices of two tokens are more likely
to co-move, thus leading to less arbitrage opportunities. Last, but not least, we argue that a “liq-
uidity freeze” is more likely to occur for tokens with low expected returns, as liquidity providers
incur a large opportunity cost for holding those tokens in their portfolios.
Our equilibrium results also help correct the widely spread misconception that the token value
loss due to arbitrage is impermanent and vanishes when the exchange rate reverts to its initial value.
We argue that the long-established benchmark used to measure the “impermanent loss” is unable
to fully account for the opportunity cost of depositing in the AMM. We show that, contrary to the
popular belief, liquidity providers’ incentives to deposit in the AMM may become stronger if the
expected “impermanent loss” increases and the probability of exchange rate reversion decreases.
We show that if the AMM is largely adopted, both the expectation and variance of transaction
fees charged by the blockchain underlying the exchange increase. This imposes negative externalities
on other decentralized applications operating on the same blockchain. Higher and more volatile
transaction fees may prevent consumers from using these applications or cause high execution
3delays. Hence, our results indicate that not only does the blockchain affect the DeFi applications
built on it, but the DeFi applications also affect the underlying blockchain.
We use our model to analyze the design of an AMM. There currently exist hundreds of AMMs,
which mainly differ in terms of the pricing curve used and the number of managed tokens. (See,
for instance, Xu et al. (2021)). First, we show that the curvature of the pricing function deter-
mines the severity of the arbitrage problem and the fee revenue generated by trading activities.
Pricing functions with larger curvature reduce the arbitrage problem, but also decrease investors’
surplus. We construct an optimal pricing function, which maximizes welfare and deposit efficiency,
and minimizes the occurrence of a “liquidity freeze”. Second, we explore how pooling more than
two different tokens in the AMM affects the occurrence and profitability of exploitable arbitrage
opportunities. Our analysis warns against a typical fallacy—pooling more tokens in the AMM
reduce the token value loss due to diversification effects. We show that pooling multiple tokens not
only increases the probability that an arbitrage occurs but also allows the arbitrageur to extract a
larger portion of deposited tokens.
We provide empirical support to the main testable implications of our model using transaction-
level data from Uniswap V2 and Sushiswap AMMs. We identify the deposit, withdrawal, and swap
orders from the raw transaction history of 80 AMMs offering the most actively traded token pairs,
in the period from Dec 22, 2020 to June 20, 2021. Consistently with our theoretical predictions,
we find that token exchange rate volatility has a negative effect on deposit flow rate, while trading
volume has a positive effect. Both effects are statistically and economically significant. An increase
in weekly log spot rate volatility by 0.04 (around one-standard-deviation) decreases the weekly
deposit flow rate by 0.06 (around 25% of the standard deviation). Moreover, an increase in trading
volume by one standard deviation increases the weekly deposit flow rate by around 35% of the
standard deviation.
We exploit the segmentation of AMMs by dividing them into two groups: “stable pairs” and
“non-stable pairs”. “Stable pairs” consist of two stable coins which are each pegged to one US
dollar, and thus these pairs have very low token exchange rate volatility compared with “unstable
pairs”. Consistent with our theoretical predictions, we find that gas fees for transactions of “stable
pairs” are 8% lower than those of “non-stable pairs”, and that the weekly volatility of gas fees
for “stable pairs” is about 40% lower than for “non-stable pairs”. This implies that the size of
(negative) externalities imposed by “stable pairs” on other platforms using the Ethereum blockchain
is smaller.
The rest of paper is organized as follows. Section 2 gives institutional details of crypto exchanges
4and describes the AMM. Section 3 develops the game theoretical model. Section 4 solves for the
subgame perfect equilibrium of the model, and analyzes its economic implications. Section 5
discusses the design of AMMs. Section 6 tests statistically the main model implications. We
conclude in Section 7.
Literature Review. Our paper contributes to the so-far scarce, but rapidly growing, literature
on blockchain-based decentralized finance. Relevant contributions include Angeris et al. (2021), who
show that the AMM can track the market price closely under no-arbitrage conditions; Bartoletti,
Chiang, and Lluch-Lafuente (2021) who abstract away from the economic mechanisms behind
AMMs, and prove a set of structural properties; Daian et al. (2020) who provide empirical evidence
for the existence of arbitrage at AMM. We refer to Harvey, Ramachandran, and Santoro (2021)
for an excellent and comprehensive survey of DeFi applications. In their survey, they highlight
the potential token value loss faced by liquidity providers, often referred to as “impermanent loss”.
We show that the widely accepted measure of “impermanent loss” can be misleading and lead to
sub-optimal liquidity management strategy of liquidity providers.
To the best of our knowledge, our paper is the first to explore theoretically and empirically the
market microstructure of AMMs and their design. It is worth mentioning two recent complimen-
tary studies to ours. Park (2021) discusses front-running arbitrage, a different form of arbitrage
that arises in blockchain-based crypto exchanges, and Lehar and Parlour (2021) compare liquidity
provision at a centralized exchange with liquidity provision at an AMM which utilizes a constant
product function.
Our results also add to existing literature on crypto trading. Griffins and Shams (2020), Cong
et al. (2020), and Li, Shin, and Wang (2018) analyze the trading activities and price manipula-
tions at centralized crypto exchanges. We contribute to this strand of literature by analyzing the
economic incentives behind trading and provision of liquidity at decentralized exchanges, whose
trading volume has been growing steadily.
Our paper is broadly related to the the stream of literature studying blockchain technologies.
Some of these studies investigate miners’ incentives and how blockchain protocols achieve decentral-
ized consensus. Noticeable contributions in this direction include Abadi and Brunnermeier (2018),
Biais et al. (2019), Leshno and Strack (2020), Saleh (2020), Budish (2018), Roşu and Saleh (2021),
Hinzen, John, and Saleh (2019), and Cong, He, and Li (2020). Hinzen, John, and Saleh (2019)
argue that the Bitcoin’s protocol, despite ensuring decentralization, may result in limited adoption
of Bitcoin as a payment system. Our results show that while gas fees incentivize miners and guar-
5antee decentralization on the Ethereum blockchain, they also make the arbitrage problem on DeFi
exchanges unavoidable and consequently reduces adopting.
A related branch of literature analyzes blockchain in the context of crypto transactions and
pricing. Contribution in this direction include Huberman, Leshno, and Moallemi (2021), Sockin
and Xiong (2020), Easley, O’Hara, and Basu (2019), Pagnotta (2021), Schilling and Uhlig (2019),
Athey et al. (2016), and Irresberger et al. (2020). Unlike these studies which view blockchain as
the technology underlying payment systems, we investigate the pros and cons of blockchain as an
infrastructure for decentralized exchanges. In their work, Irresberger et al. (2020) highlight the
functionality of public blockchain as an infrastructure supporting DeFi applications.
## 2 Crypto Exchanges
In this section, we provide institutional details of crypto exchanges and discuss the mechanics of
AMMs.
## 2.1 Institutional Details
Tokenization has gained increasing popularity since the introduction of bitcoin in 2008 by Nakamoto
(2008). As of January 2021, there are over 4,000 crypto tokens created, distributed, and circulated
(Bagshaw (2020)). With the increasing adoption of cryptocurrencies, many exchanges have been
created specifically for trading of crypto tokens. Those exchanges usually fall into two categories:
centralized exchanges and decentralized exchanges (often called DEX).
A centralized cryptocurrency exchange is a trusted intermediary which monitors and facilitates
crypto trades as well as securely stores tokens and fiat currencies. Similar to the equity market,
centralized exchanges are often in the form of limit order books, and many of them also provide
leverage and derivative trading. However, different from the equity market, most of the centralized
cryptocurrency exchanges are unregulated and lack of proper insurance for the assets stored. This
presents concerns for safety, trustworthiness, and potential manipulation.1
Because of the concerns presented by centralized crypto exchanges, decentralized exchanges are
becoming alternative platforms for the purchase and sale of crypto tokens. As of August 2020, DEX
account for more than 5% of the total crypto trading, and their market shares have been increasing
1
The study of Gandal et al. (2018) highlights price manipulation behavior on crypto exchanges including Mt.Gox
which, at its peak, was responsible for more than 70% of bitcoin trading. In early 2014, Mt.Gox suddenly closed
its platform and filed for bankruptcy claiming that the platform’s wallet was hacked and a great amount of assets
were stolen. Other centralized exchanges subject to thefts and exit scams include Binance, BitKRX, BitMarket,
PonziCoin, and so on.
6steadily (McSweeney (2020)). Different from centralized exchanges, DEX are blockchain-based
smart contracts which can operate without a trusted central authority. Most of them utilize an
AMM smart contract that tracks a constant product function. The two largest DeFi exchanges,
Uniswap and Sushiswap, respectively make up for about 50% and 20% of the trading volume at
decentralized exchanges (Smith and Das (2021)).
Orders are typically executed on the scale of milliseconds in a centralized exchange (Sedgwick
(2018)). Unlike centralized exchanges which facilitate trades and manage all orders using their own
infrastructure, decentralized exchanges take in, manage, and execute orders through a blockchain-
based platform (typically Ethereum). Instead of sending the order directly to the exchange, users
submit their orders2 to the blockchain network and attach a transaction fee (the gas price and gas
limit in the Ethereum network). The miner that mines the very next block will prioritize orders
based on the attached gas price, from highest to lowest, and append them to the blockchain. Since
each block has a maximum size, the number of orders a miner can include in a single block is
limited. Hence, an order with a too low transaction fee may need to wait a few minutes before
being confirmed and executed.
2.2 AMM with Constant Product Function
We provide a brief description of the most common AMM smart contract, which deploys a constant
product function. We refer to Adams (2020) for a more extensive overview.
An AMM does not rely on a limit-order book for transactions. Rather, it develops a new market
structure called liquidity pool. A liquidity pool allows for a direct exchange of two crypto tokens,
say A and B tokens, instead of first selling A tokens for fiat currency and then purchasing B tokens
using proceeds from the asset sale. Each liquidity pool typically manages a pair of tokens.3 We
remark that any pair of tokens can form a liquidity pool. Hence, liquidity pools can support trading
activities for tokens not yet listed on centralized exchanges.
The liquidity pool works by incentivizing owners to deposit their tokens into the smart contract.
Assume a liquidity pool manages the exchange of two tokens, A and B, where each A token is worth
pA and each B token is worth pB. Anyone who owns both A and B tokens can choose to be a
liquidity provider by depositing an equivalent value of each underlying token in the AMM and in
2
Users maintain full custody of their tokens and can overwrite their orders before they are confirmed. As a result,
users are not exposed to counterparty risk, that is, the risk that the exchange defaults on its obligations to deliver
tokens after the transaction is confirmed. Upon confirmation, the delivery of tokens is instantaneous.
3
It is also possible to pool multiple tokens together, despite pools with a single pair are the most common. It
is worth emphasizing that the trading mechanism of pools with more than two tokens is almost identical to that of
pools with a single pair of tokens.
7return, receiving pool tokens which prove his share of the AMM. For example, if the current reserve
in the liquidity pool contains 10 tokens A and 5 tokens B, and the current value is 1 dollar for one
A token and 2 dollars for one B token, then the liquidity provider must deposit A tokens and B
tokens in the ratio 2:1. After depositing 10 tokens A and 5 tokens B, the liquidity provider can
claim pool tokens that account for half of the total tokens in the current liquidity reserve. The
provider can exit the liquidity pool by trading in his pool tokens, and receiving his share of the
liquidity reserve in the AMM. For instance, if the liquidity reserve contains 25 tokens A and 9
tokens B when the liquidity provider exits and no one deposits after her, then she receives 12.5
tokens A and 4.5 tokens B.
Suppose a new investor arrives at the AMM and wants to exchange A for B tokens. To complete
such a trade, this investor does not need to search for a counterparty who is willing to exchange
B for A tokens. Rather, she directly interacts with the AMM by submitting a swap order through
which she deposits an amount ∆A of A tokens and withdraws an amount ∆B of B tokens. The
quantities ∆A and ∆B satisfy (20 + ∆A)(10 − ∆B) = 20 ∗ 10 = 200. That is, multiplying the
amount of both tokens in the AMM must yield a constant. Formally, assume the initial liquidity
reserve in the AMM contains yA A tokens and yB B tokens. Then the trade needs to satisfy
(yA + ∆A)(yB − ∆B) = yAyB. In addition to the amount ∆A of tokens A exchanged, the investor
must pay an additional amount f∆A of tokens A as trading fee. Most of this fee is then added to
the liquidity pool.4 Hence, the trading fee increases both the total liquidity reserve of the AMM
and the AMM share of liquidity providers. Liquidity providers are incentivized to deposit because
they earn the trading fee. For Uniswap V2 and Sushiswap, this trading fee is currently set to 0.3%
of the tokens that investors trade in. The ratio between the amount of two tokens in the liquidity
pool equals the spot exchange rate when the trading size is infinitesimally small.5
It is worth noticing that the relationship (yA + ∆A)(yB − ∆B) = yAyB can, in principle, be
replaced by F(yA +∆A,yB −∆B) = F(yA,yB), where F(x,y) is an arbitrary pricing curve referred
to as the pricing function. AMMs differ in terms of the chosen pricing function. The constant
production function is just a special case, where F(x,y) = xy. We refer to Xu et al. (2021) for an
overview of pricing functions used by different AMMs.
4
In practice, a small portion of the trading fees may be collected by the underlying platform. This can be
incorporated in the model by multiplying the trading fee collected by the liquidity provider with a constant term.
Because such an additional feature would not qualitatively change our results, we opted for leaving it out.
5
It can be easily verified that if ∆A → 0, then ∆A
∆B
→ yA
yB
.
83 Baseline AMM Model
Our baseline model consists of 2 periods indexed by t, t = 1,2. Each period has 3 sub-periods.
There are three kinds of agents: liquidity providers, an arbitrageur, and investors. The discount
factor of each agent is equal to 1.
## 3.1 The Pricing Function of the AMM
The agents have access to two different tokens, referred to as A and B tokens. The tokens can be
used directly on the corresponding platforms A and B. Alternatively, they can be exchanged for a
single consumption good used as a numeraire at prices which are public information for all agents.
We denote the amount of consumption good that a single A and B token can exchange for at the
end of sub-period s of period t, as p
(t,s)
A and p
(t,s)
B respectively. We will refer to p
(t,s)
A and p
(t,s)
B as
the token prices of A and B tokens respectively interchangeably throughout the paper. We will
refer to the ratio of token prices,
p
(t,s)
A
p
(t,s)
B
, as the fair value exchange rate.
There is a smart contract built on a blockchain that functions as the AMM for A and B tokens.
The smart contract utilizes a twice continuously differentiable pricing function F(x,y) : R2 → R to
decide the exchange rate for any trade. If the AMM contains an amount yA of A tokens and yB
of B tokens, any trade that exchanges ∆A A tokens for ∆B B tokens needs to satisfy the relation
F(yA + ∆A,yB − ∆B) = F(yA,yB),0 ≤ ∆B ≤ yB. An additional amount f∆A of A tokens needs
to be added to the AMM as a trading fee.
Assumption 1. The function F(x,y) : R2 → R satisfies the following properties:
1. Fx > 0,Fy > 0.
2. Fxx < 0,Fyy < 0,Fxy > 0.
3. ∀c ≥ 0,clF(x,y) = F(cx,cy) for some l > 0.
4. limx→0
Fx
Fy
= ∞,limx→∞
Fx
Fy
= 0, limy→0
Fx
Fy
= 0,limy→∞
Fx
Fy
= ∞.
The first assumption ensures that a positive amount of A tokens can be exchanged for a positive
amount of B tokens from the AMM. The second assumption guarantees that the curve F(x,y) = C,
where C is a constant, is convex. This implies that if the demand of A tokens goes up, the exchange
rate used to convert from B to A tokens correspondingly increases. Symmetrically, if the demand
for B tokens increases, a higher amount of A tokens is required to exchange for a single B token.
The third assumption states that the function F is homogeneous of degree l, and ensures that the
9exchange rate at the AMM does not change significantly if the amount of deposited tokens goes
up. The last condition ensures that the AMM supports trading for any token exchange rate in the
interval [0,∞). These four properties can be verified to hold for the majority of existing AMMs.
(see, for instance, Xu et al. (2021)).
## 3.2 Liquidity Providers
There are n > 1 liquidity providers, indexed by N = {1,2,...,n}, and each endowed with a
positive amount of consumption good at t = 0. We use e
(0)
i to denote the initial endowment of
liquidity provider i ∈ N, where e
(0)
i > 0. The aggregate initial endowment of liquidity providers is
Pn
i=1 e
(0)
i = e(0).
At sub-period 1 of each period t,t = 1,2, liquidity providers choose their portfolios. Specifically,
they decide whether to exchange their consumption good for A and B tokens, and how much to
exchange for. In addition, they decide whether to deposit their tokens in the AMM and how
much to deposit. The liquidity providers maximize the amount of consumption good that they can
exchange for at the end of period 2. We also impose the following tie-breaking rule:
Assumption 2. The liquidity providers do not deposit their tokens if they are indifferent between
whether or not to deposit.
We denote the amount of A and B tokens deposited in the AMM at the beginning of period t,
respectively by y
(t,1)
A and y
(t,1)
B . Liquidity provider i deposits w
(t)
i y
(t,1)
A and w
(t)
i y
(t,1)
B amount of A
and B tokens, respectively, where
Pn
1 w
(t)
i = 1,w
(t)
i ≥ 0. The AMM requires tokens to be deposited
at the current fair value exchange rate6, i.e., Fx
Fy
(x,y)=(y
(t,1)
A ,y
(t,1)
B )
=
p
(t,1)
A
p
(t,1)
B
.
## 3.3 Investors’ Arrival and Token Price Shocks
In sub-period 2 of each period t,t = 1,2, after liquidity providers decide on their token holdings
and deposit in the AMM, one of the following three mutually exclusive and collectively exhaustive
events occurs: “the arrival of an investor”, “the arrival of a token price shock that hits A token or
B token”, and “neither a shock hits, nor an investor arrives”.
Investors’ Arrival. With probability κI , an investor arrives to the AMM. An investor is char-
acterized by an intrinsic type, that is “type A” or “type B”. A “type A” investor extracts a private
6
As an example, an AMM which utilizes a constant product function requires the deposited tokens to have equal
value, i.e., y
(2)
A p
(2)
A = y
(2)
B p
(2)
B .
10benefit of (1+α)p
(t,1)
A from using one A token on its corresponding platform. A “type A” investor
does not use platform B, so she only receives p
(t,1)
B for each B token. Symmetrically, a “type B”
investor receives (1 + α)p
(t,1)
B for each B token and p
(t,1)
A for each A token.7 The investor arriving
to the AMM is of “type A” or of “type B” with equal probability. The investor chooses the traded
quantity to maximize her total surplus from the transaction.
Token Price Shock. In each period t, the prices of A and B tokens may be hit by exogenous
shocks. With probability θ, the price changes of A and B tokens are driven by a common shock
ζcom:
ζcom ∼ Bern(κcom),p
(t,2)
i = (1 + βζcom)p
(t,1)
i ,i = A,B. (1)
That is, with probability 0 < κcom < 1, the common shock causes a price increase of β for both A
and B tokens.
With probability 1 − θ, the price changes of A and B tokens are caused by independent, id-
iosyncratic shocks ζA,ζB:
ζA ∼ Bern(κ1),ζB ∼ Bern(κ2),ζA ⊥ ζB,κ1 > κ2,
p
(t,2)
i = (1 + βζi)p
(t,1)
i ,i = A,B.
(2)
That is, with probability 0 < κ1 < 1, the idiosyncratic shock ζA realizes and increase the price of
A tokens by β; with probability 0 < κ2 < 1, the idiosyncratic shock ζB realizes, and increases the
price of B tokens by β. Notice that κ1 > κ2. This means that the expected return of holding B
tokens is smaller than the corresponding return of holding A tokens, and thus holding B tokens
presents an opportunity cost.
## 3.4 Arbitrage and Token Withdrawal
The arrival of an investor or the occurrence of a token price shock at sub-period 2 presents an
opportunity for the arbitrageur. At sub-period 3 of each period t, the arbitrageur submits an
arbitrage order and the liquidity provider submits a withdrawal order.
7
For instance, the platform that issues token B20 is Metapurse. On this platform, one can use token B20 to
claim ownership of NFT collectibles. The Ethereum network is a platform, where one can use ETH tokens as a
cryptocurrency to exchange for goods and other tokens, or to run applications. If an investor prefers to gain exposure
to NFT collectibles rather than fiat currencies, then she prefers token B20 over stable coins pegged to USD, such
as USDT, USDC. If an investor needs to run applications on Ethereum networks, then she can extract a private
benefit from token ETH. If an investor prefers low volatility, high liquidity and wants to exchange her tokens for fiat
currencies, then she can extract a private benefit from holding stable coins.
11Arbitrage Opportunity After the investor arrives and trades, the ratio between the amount
of A and B tokens deviates from
y
(t,1)
A
y
(t,1)
B
. Since the spot exchange rate is solely decided by the ratio
between the amount of tokens, this deviation may present arbitrage opportunities.
Similarly, upon realization of the token price shock, the fair exchange rate of two tokens may
change. However, the spot exchange rate in the AMM remains unchanged, and this creates an
arbitrage opportunity. The arbitrageur is incentivized to trade in the token not hit by the shock for
the token which becomes more valuable after the shock. This, in turn, yields a loss for the liquidity
providers, who then have strong incentives to withdraw their tokens ahead of the arbitrageur.
Arbitrageur. The arbitrageur does not use tokens on either platform and only exchange tokens
for consumption good. It takes advantage of the price deviation at the AMM and trades to maximize
its profit from arbitrage p
(t,2)
B ∆q
(t,3)
B + p
(t,2)
A ∆q
(t,3)
A , where ∆q
(t,3)
A and ∆q
(t,3)
B are respectively the
change in the amount of A and B tokens held by the arbitrageur. This trading opportunity can
be exploited by the arbitrageur only if its order is confirmed by the blockchain before others. The
arbitrageur adds a transaction fee g
(t,3)
arb to its order. We will also refer to such fee as “gas fee”8
interchangeably throughout the paper, following its institutional counterpart. The orders will be
included on the underlying blockchain and executed in decreasing order of of gas fees, and any tie
will be broken uniformly at random. We assume that gas fees attached to unconfirmed orders are
observable by everyone.9 Following Glosten and Milgrom (1985), we assume that the arbitrageur
earns zero profit from each trade net of the paid gas fee.
Assumption 3. The arbitrageur attaches a gas fee equal to the highest possible profit from an
arbitrage order.
Such an outcome can be attained in a competitive environment with many arbitrageurs. Suppose
an arbitrageur submits an arbitrage order and attaches a gas fee smaller than the profit earned
from the arbitrage. Another arbitrageur can undercut the first order by submitting the exact same
order and attaching a slightly higher gas fee. Only if an arbitrageur submits an optimal arbitrage
8
For Ethereum, the total gas fee is equal to the gas price multiplied by the gas amount needed to execute the
transaction. The gas price is defined as the amount of ETH paid per unit of gas used, and the gas amount measures
the computational resources needed to execute a transaction on Ethereum. The unit of gas price is Gwei, that is,
10−9
ETH token. Transactions with higher gas prices are confirmed first, because miners prioritize them to maximize
their fee revenue. Since transactions executed on the same AMM use similar gas amounts, the transactions with
higher gas prices have higher total gas fees. In our model, we assume that the agents directly submit a gas fee instead
of a gas price.
9
This assumption is consistent with current practices. All submitted, pending orders to the AMMs are stored at
the mempool which is publicly accessible.
12Figure 1: Timeline of The Model.
order (i.e., one which maximizes its trading profits) and bids a gas fee equal to its profit, then other
arbitrageurs are unable to undercut the submitted order.
Token Withdrawal. In each period t, at sub-period 3, the liquidity provider i withdraws
his tokens from the AMM by submitting an order and attaching a non-negative gas fee g
(t)
(lp,i) to
it. When the withdraw order is executed, the liquidity provider i pays the attached gas fee and
receives an amount y0
Aw
(t)
i of A tokens and an amount y0
Bw
(t)
i of B tokens, where y0
A,y0
B are the
total reserves in the AMM before the first withdrawal. We recall here that w
(t)
i is the share of
reserves that liquidity provider i deposited at the beginning of period t. Upon receiving their
tokens, liquidity providers exchange them for the consumption good, and period t ends. We denote
the amount of consumption good that liquidity provider i owns at the end of period t by e
(t)
i . We
visualize the timeline of the model in Figure 1.
## 3.5 States, Actions, Strategy Profiles, and Equilibrium
In this section, we formally define the states, action space, and strategy profiles and payoffs of
liquidity providers, investors, and arbitragers.
States. We denote by Ω the set of possible states. We denote the initial state of the game as
ω(0). The state ω(t,s) = {P(t,s),H(t,s)} at sub-period s of period t consists of two components:
1. P(t,s) = {(p
(1,1)
A ,p
(1,1)
B ),...,(p
(t,s)
A ,p
(t,s)
B ))}, where p
(t,s)
A ,p
(t,s)
B are the price of A and B tokens
at the end of sub-period s of period t. P(t,s) is the history of token prices until the end of
13sub-period s of period t.
2. H(t,s) = {h(1,1),...,h(t,s)}, where h(t,s) = {(w
(t)
i y
(t,s)
A ,w
(t)
i y
(t,s)
B ,c
(t,s)
i ,x
(t,s)
Ai
,x
(t,s)
Bi
)}i∈N collect
the portfolios of liquidity providers at the end of sub-period s of period t. w
(t)
i y
(t,s)
A and
w
(t)
i y
(t,s)
B are, respectively, the amounts of A and B token in the AMM that belong to liquidity
provider i; c
(t,s)
i is the amount of consumption good he holds; (x
(t,s)
Ai
,x
(t,s)
Bi
) are the amounts
of A and B token that liquidity provider i holds (apart from his deposit in the AMM).
Action Space. Liquidity provider i chooses the portfolio at sub-period 1 of each period t,
(w
(t)
i y
(t,1)
A ,w
(t)
i y
(t,1)
B ,c
(t,1)
i ,x
(t,1)
Ai
,x
(t,1)
Bi
), and the gas fee g
(t)
(lp,i) attached to the withdrawal order at
sub-period 3 of each period t. Liquidity provider i finances his portfolio at t using his endowment
e
(t−1)
i at the end of period t − 1, i.e. he is subject to the following budget constraint:
p
(t,1)
A (w
(t)
i y
(t,1)
A + x
(t,1)
Ai
) + p
(t,1)
B (w
(t)
i y
(t,1)
B + x
(t,1)
Bi
) + c
(t,1)
i = e
(t−1)
i .
When the investors arrive at the AMM, they choose the trading quantities, (∆Q
(t,2)
A ,∆Q
(t,2)
B ).
At sub-period 3, the arbitrageur chooses the arbitrage order, (∆q
(t,3)
A ,∆q
(t,3)
B ).
Strategy. A (pure) strategy of the liquidity provider i, σ(lp,i) consists of four mappings: the first
is from the initial state ω(0) to a portfolio h(1,1) at sub-period 1 of period 1, the second is from
ω(1,3) ∈ Ω to a portfolio h(2,1) at sub-period 1 of period 2, and the third and fourth are from a
state ω(t,2) ∈ Ω to a gas fee g
(t)
(lp,i), for t = 1,2, respectively. We denote the strategy profile of the n
liquidity providers by σlp = {σ(lp,i)}i∈N .
The strategies of an arriving “type A” and “type B” investor are denoted, respectively, by
σ(inv,A) and σ(inv,B). They are mappings from a state ω(t,1) ∈ Ω to ∆Q
(t,2)
A and ∆Q
(t,2)
B , i.e., the
amount of A and B tokens traded, respectively, by the “type A” and ”type B“ investors. We denote
the strategy profile of the investors by σinv = {σ(inv,A),σ(inv,B)}.
A (pure) strategy of the arbitrageur σarb is a mapping from a state ω(t,2) ∈ Ω to the amount of
A and B tokens resulting from its arbitrage, respectively ∆q
(t,3)
A and ∆q
(t,3)
B .
Payoffs. The expected payoff of liquidity provider i is E
h
e
(2)
i
i
, that is, the total amount of con-
sumption good that liquidity provider i is expected to possess at the end of period 2. The expected
payoff of the arbitrageur is
P2
t=0 E
h
p
(t,2)
B ∆q
(t,3)
B + p
(t,2)
A ∆q
(t,3)
A − g
(t,3)
arb
i
, that is, the expected total
profit from the arbitrage order net of the gas fee paid.
14The payoff of an investor arriving at period t is defined by her surplus from the transaction, that
is, (1+α)p
(t,1)
A ∆Q
(t,2)
A +p
(t,1)
B ∆Q
(t,2)
B for “type A” investors, and (1+α)p
(t,1)
B ∆Q
(t,2)
B +p
(t,1)
A ∆Q
(t,2)
A
for “type B” investors.
Equilibrium. The states, the strategy profile, and the payoffs above define our dynamic game.
Our equilibrium concept is that of a subgame perfect equilibrium.
## 4 Equilibrium Trading and Liquidity Provision
We analyze the game theoretical model developed in the previous section. In Section 4.1, we
show that the liquidity providers face an arbitrage problem after a token price shock occurs. In
Section 4.2, we study the trading strategy of investors. In Section 4.3, we characterize the subgame
perfect equilibrium of the game, and study under which conditions liquidity providers do not find
it incentive compatible to deposit tokens.
## 4.1 The Arbitrage Problem
Upon the occurrence of a token price shock in sub-period 2, liquidity providers and the arbitrageur
submit their respective orders to the blockchain. An arbitrageur decides the amount of A or B
tokens traded in as well as the gas fee attached to the order. A liquidity provider decides the gas
fee attached to his exit order only. We show that a liquidity provider will be subject to an arbitrage
problem and token value loss, if token prices do not co-move and the price change is large enough.
Recall that the amount of A and B tokens in the AMM at sub-period 2 of period t, is denoted
respectively, by y
(t,2)
A and y
(t,2)
B . When the common shock occurs and the price of the two tokens
co-move, the fair value exchange rate remains unchanged:
p
(t,2)
A
p
(t,2)
B
=
p
(t,1)
A
p
(t,1)
B
. However, if a shock hits
either token A or token B only, then the fair value exchange rate
p
(t,2)
A
p
(t,2)
B
deviates from the spot
exchange rate
p
(t,1)
A
p
(t,1)
B
. Without loss of generality, we assume the shock hits B tokens10, and the price
rises from p
(t,1)
B to p
(t,2)
B = (1 + β)p
(t,1)
B . To profit from this deviation, the arbitrageur submits
an order to the AMM and exchanges an amount −∆q
(t,3)
A of A tokens for ∆q
(t,3)
B B tokens. The
arbitrageur aims for the optimal arbitrage, i.e., chooses the buy order which solves the following
10
The case where the price shock yields an appreciation of A tokens can be handled symmetrically.
15optimization problem:
max
∆q
(t,3)
A ,∆q
(t,3)
B
p
(t,2)
A (1 + f)∆q
(t,3)
A + p
(t,2)
B ∆q
(t,3)
B
s.t. F(y
(t,2)
A ,y
(t,2)
B ) = F(y
(t,2)
A − ∆q
(t,3)
A ,y
(t,2)
B − ∆q
(t,3)
B )
∆q
(t,3)
A ≤ 0,y
(t,2)
B ≥ ∆q
(t,3)
B ≥ 0,
(3)
where p
(t,2)
A (1+f)∆q
(t,3)
A is the trading cost, that is, the value of A tokens traded in plus the trading
fee paid to the liquidity providers, and p
(t,2)
B ∆q
(t,3)
B = p
(t,1)
B (1 + β)∆q
(t,3)
B is the value of B tokens
received by the arbitrageur from the order. Solving for the optimal arbitrage yields the following
result:
Lemma 1. If a price shock hits only one token and the price change of that token exceeds the paid
fee, i.e., β > f, then the arbitrageur earns a positive profit π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) > 0 from the
optimal arbitrage trade. Moreover, such profit and the unique optimal trading size |∆q
(t,3)∗
A | for A
tokens and |∆q
(t,3)∗
B | for B tokens are increasing in β and decreasing in f.
When the prices of two tokens do not co-move, if the realized token price change is sufficiently
large, it is profitable for the arbitrageur to exchange the token not hit by the positive price shock for
the other more valuable token. The larger the realized price change, the higher the payoff attained
from the arbitrage, and the larger the token value loss for liquidity providers. Moreover, the higher
the trading fee charged by the AMM, the higher the trading cost for the arbitrageur, which in turn
reduces the arbitrage profit and the order size.
The profit of the arbitrageur equals the loss in token value incurred by the liquidity providers.
Formally, liquidity provider i incurs a token value loss w0
iπ(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) if an optimal
arbitrage order is executed. Hence, this liquidity provider has an incentive to submit a withdrawal
order to the AMM. To avoid the loss, the withdrawal order must be executed and included in the
underlying blockchain before the order submitted by the arbitrageur. This means that the liquidity
provider must pay a gas fee higher than the one attached to the arbitrage order. By Assumption 3,
the gas fee paid by the arbitrageur for its order matches exactly its gain π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
from the optimal arbitrage. Hence, the arbitrageur makes a zero net profit. Observe that it is never
profitable for liquidity provider i to pay a gas fee higher than w0
iπ(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ), because
he would otherwise incur a cost higher than the loss from arbitrage. Hence, for liquidity providers,
the problem is not avoidable by exiting the contract before the arbitrage is exploited.11 This also
11
One can easily derive the same result by introducing multiple arbitrageurs and modelling competition for first
16implies that liquidity providers end up submitting their exit orders with zero gas fee attached,
because there is no benefit for bidding up. The next proposition formalizes the above discussion.
Proposition 1. If β > f and the token price shock hits only one token in sub-period 2 of period
t,t = 1,2, then an optimal arbitrage order is the first order executed in sub-period 3. The arbitrage
yields a loss w0
iπ(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) for liquidity provider i, and the gas fee g
(t,3)
arb attached to
the arbitrage order is π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ). If β ≤ f, or the prices of two tokens co-move, then
the arbitrageur does not trade.
It is worth noticing that the arbitrage problem in the AMM is fundamentally different from the
adverse selection problem arising in typical open limit-order book markets. In a limit-order book
market, studied for instance in Glosten and Milgrom (1985) and Glosten (1994), market markers
can be adversely selected by other investors who have private information about future realization
of asset returns. However, in the AMM, the arbitrage exists even if there is complete information,
due to the order execution mechanism of decentralized exchanges built on blockchains. Moreover,
market makers in traditional open limit-order book markets can offset the adverse selection problem
by placing a bid-ask spread, or they can even front-run the orders when they are able to predict the
direction of order flow. In contrast, the AMM does not charge a bid-ask spread, and the liquidity
providers are also unable to front-run the arbitrage order because the execution priority is decided
by the gas fee attached to the order. As a result, the liquidity providers participating in the AMM
are subject to token value loss, and must be compensated with enough trading fees.
A question which often puzzles liquidity providers is as follows: does the token value loss
still exist if the token exchange rate reverts back to its initial level in subsequent periods? Some
commentators have argued that if the token exchange rate is hit by a shock in the opposite direction,
another arbitrage will occur and bring the ratio of deposits back to the initial ratio. Hence, there
would be no token value loss from arbitrage. This is the reason why token value loss from arbitrage
is often referred to as “impermanent loss” by practitioners (see also Harvey, Ramachandran, and
Santoro (2021)).
Definition 1. The “impermanent loss” is defined as:
IL
p
(0)
A
p
(0)
B
,
p
(2,3)
A
p
(2,3)
B
!
:= 1 −
p
(2,3)
A x2 + p
(2,3)
B y2
p
(2,3)
A x1 + p
(2,3)
B y1
, (4)
execution as a first-price auction with any tie-breaking rule. For any arbitrageur, the first execution has value
π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ), and for liquidity provider i, the first execution has a value w0
iπ(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ).
At equilibrium, an arbitrageur wins the auction, and the gas fee that the winning arbitrageur pays for the first
execution is exactly π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ). In the absence of competition, the liquidity providers can exit with
zero additional gas fee after the first execution.
17where x1,y1,x2,y2 > 0 are specified by the following constraints:
F(x1,y1) = F(x2,y2),
Fx(x1,y1)
Fy(x1,y1)
=
p
(0)
A
p
(0)
B
,
Fx(x2,y2)
Fy(x2,y2)
=
p
(2,3)
A
p
(2,3)
B
.
In the definition above, x1,y1 are the amount of A and B tokens, respectively deposited in the
AMM if the initial fair value exchange rate is
p
(0)
A
p
(0)
B
. If the fair value exchange rate changes to
p
(2,3)
A
p
(2,3)
B
at the end of the investment horizon, then after the arbitrage is exploited, the amount of A and B
tokens in the AMM will be x2,y2 respectively (assuming zero fee). Moreover, the constraint imposed
by the pricing curve, F(x1,y1) = F(x2,y2), needs to be satisfied. Thus, if x1,y1 are the amount
of deposited tokens, p
(2,3)
A x2 + p
(2,3)
B y2 is the total value of deposited tokens after the price change.
If the tokens are not deposited, p
(2,3)
A x1 + p
(2,3)
B y1 is the total value of tokens. The expression in
(4) aims at capturing the magnitude of token value loss from depositing relative to not depositing.
The “impermanent loss” is indeed zero if the token price reverts, i.e.,
p
(0)
A
p
(0)
B
=
p
(2,3)
A
p
(2,3)
B
. All this leads to
the seemingly logical liquidity management strategy to minimize impermanent loss—whenever a
token value occurs, ignore token price movements in short term, continue depositing in the AMM,
and wait for the reversion of exchange rate to occur. (see, for instance, Davis (2021)). However, as
we show in Section 4.3, the above claim is fallacious.
## 4.2 Investors’ Trading
Each investor arrives to the exchange and decides the amount of A and B tokens to trade. Moreover,
investors’ trades may leave an exploitable arbitrage opportunity for the arbitrageur.
Assume a “type A” investor arrives at sub-period 2 of period t. The case of a “type B” investor
arriving first follows from symmetry arguments. Since a “type A” investor has personal use for A
tokens, she uses B tokens to exchange for A tokens. Formally, when the “type A” investor decides
the desired amount ∆Q
(t,2)
A ≥ 0 of A tokens from the trade, she maximizes her total surplus from
the transaction subject to the constraints imposed by the pricing function of the AMM:
max
∆Q
(t,2)
A ,∆Q
(t,2)
B
(1 + α)p
(t,1)
A ∆Q
(t,2)
A + (1 + f)p
(t,1)
B ∆Q
(t,2)
B
s.t. F(y
(t,1)
A ,y
(t,1)
B ) = F(y
(t,1)
A − ∆Q
(t,2)
A ,y
(t,1)
B − ∆Q
(t,2)
B )
y
(t,1)
A ≥ ∆Q
(t,2)
A ≥ 0,∆Q
(t,2)
B ≤ 0,
(5)
where (1+α)p
(t,1)
A ∆Q
(t,2)
A is the total private benefit of the “type A” investor after trading, and −(1+
18f)p
(t,1)
B ∆Q
(t,2)
B is the total value of B tokens paid by the investor. We use sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
and sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ), to denote the maximum surplus of an arriving “type A” investor,
respectively “type B” investor, in period t.
Lemma 2. If f < α, then the arriving “type i” investor, i ∈ {A,B}, trades and earns a positive
surplus from the transaction, i.e., si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) > 0. Moreover, the maximum surplus
and the optimal trading quantities of an arriving investor, |Q
(t,2)∗
A |,|Q
(t,2)∗
B |, are strictly positive,
increasing in α, and decreasing in f. If instead f ≥ α, then the arriving investor does not trade.
Trading generates fees for the liquidity providers, which are then compensated for the arbitrage
problem they face. After the investor arrives and trades, the amounts of A and B tokens in the
AMM become y
(t,2)
A and y
(t,2)
B , respectively. The trade by the investor alters the ratio
y
(1)
A
y
(1)
B
of A and
B tokens in the AMM, which may lead to an arbitrage opportunity. Again, assume a “type A”
investor arrives at t = 1. After the investor trades, the spot rate at which A tokens are exchanged
for B tokens is higher than the fair value exchange rate:
Fx
Fy (x,y)=(y
(t,2)
A ,y
(t,2)
B )
>
Fx
Fy (x,y)=(y
(t,1)
A ,y
(t,1)
B )
=
p
(t,1)
A
p
(t,1)
B
=
p
(t,2)
A
p
(t,2)
B
.
The arbitrageur then exchanges A for B tokens and chooses the exchange order which solves the
optimization problem (3).
## 4.3 The Adoption of the AMM
In this section, we first characterize the subgame perfect equilibrium of the game. We then provide
the conditions under which a “liquidity freeze” occurs at equilibrium.
Proposition 2. For any α,θ,β,f,κI,κcom,κ1,κ2, there exists a subgame perfect equilibrium (σ∗
lp,σ∗
inv,σ∗
arb).
12
We then examine the conditions under which at the equilibrium, the liquidity providers are
incentive compatible to deposit their tokens into the decentralized exchange. If none of the liquidity
providers deposits their tokens at period t, no trading activities occur at that period. We call this
market breakdown a “liquidity freeze”. The following proposition characterizes the condition under
which a “liquidity freeze” occurs.
12
Multiplicity of equilibria only arises if the liquidity providers are indifferent between investing A tokens and B
tokens in period 1, and depositing tokens in the AMM in period 1 yields lower expected payoff than investing in
either A token or B token. This means that the deposit amounts of A and B tokens in the AMM are the same for all
possible equilibria. Moreover, for all the possible equilibria, the expected payoff of all the agents are the same.
19Proposition 3. A “liquidity freeze” occurs surely in period 1 and 2 if and only if β ≥ βfrz, where
βfrz ∈ [0,+∞]. Moreover, the threshold βfrz is increasing in α,κI,θ,κ2, and decreasing in κ1.
The above proposition states that when the token exchange rate is sufficiently volatile, the
arbitrage problem is severe and a “liquidity freeze” occurs. The comparative static results are
intuitive. First, when tokens become more attractive for investors (α increases) and the arrival
rate of investors goes up (κI increases), the expected trading volume increases and thus liquidity
providers collect a higher trading fee. Hence, a “liquidity freeze” is less likely to occur. Second,
when the tokens are more likely to be hit by a common shock (θ increases) and co-move, arbitrage
opportunities are less likely, i.e., the arbitrage problem faced by liquidity providers is less severe.
Third, when the token exchange rate is more volatile (magnitude of the price shock β and arrival
rate of the shock κ1 both increase), the arbitrage becomes more costly for liquidity providers, and
thus a “liquidity freeze” is more likely. Fourth, when κ2 increases, the difference in expected return
of the two tokens (1+β)(κ1 −κ2) decreases, and thus the opportunity cost of holding both tokens
and providing liquidity decreases. In this way, the incentive of liquidity providers to adopt the
AMM becomes stronger.
The above result suggests that the AMM may be more suitable for adoption of pairs whose
token prices are highly correlated and not volatile, such as a pair of stable coins. Moreover,
adoption is higher for tokens which provide investors with high personal use value, such as BTC and
ETH. Because those tokens attract investors who in turn generate high trading volumes, liquidity
providers can earn large trading fees and be compensated for the arbitrage problem they face. Last,
but not least, adoption is very unlikely for pairs of tokens whose expected returns are low, such as
the majority of Altcoins13 which have no value and discernible purpose. This is because owning
and providing liquidity for this kind of tokens is very risky and presents large opportunity costs.
Corollary 1. Suppose that the fair value exchange rate changes from
p
(0)
A
p
(0)
B
to
p
(0)
A
(1+β)p
(0)
B
in period
1. Then, the probability that the fair value exchange rate reverts to
p
(0)
A
p
(0)
B
in period 2 decreases in
κ2, and the expected “impermanent loss” increases in κ2. The expected marginal fee revenue from
deposits does not change in κ2. However, in period 2, liquidity providers deposit in the AMM at
equilibrium if and only if β < β
(2)
frz, and the threshold β
(2)
frz increases in κ2.
It is a very common misconception that the token value loss from arbitrage is ”impermanent”
and will decrease to zero if the exchange rate reverts back to the initial level. This leads to the
13
Altcoins is the term used to refer to all alternative cryptocurrencies that were launched after the massive success
achieved by Bitcoin.
20widely spread liquidity management strategy— after arbitrage loss occurs, if the token exchange
rate is likely to revert to its initial level, then it is optimal for the liquidity providers to keep
depositing and wait for exchange rate reversion. However, the above corollary shows that this
claim is not sound, and the strategy is sub-optimal. As κ2 decreases, even though the probability
of token exchange rate reversion increases, the expected “impermanent loss” decreases, and the
expected marginal fee revenue from deposits is unaffected, liquidity providers’ incentive to deposit
becomes weaker. This is because if the token exchange rate reverts in period 2, then the liquidity
providers who deposit will only suffer from another token value loss due to arbitrage orders which
trade B tokens for A tokens. No matter whether token exchange reverse or not, each realized
arbitrage occurred still yields a permanent loss that cannot be offset by the previous arbitrages.
In this way, when the reversion probability is high, instead of depositing and waiting for reversion,
the optimal action of liquidity providers in period 2 should be holding A tokens in the portfolio
and not providing liquidity at the AMM.
The benchmark upon which the widely accepted measure of “impermanent loss” (formally de-
fined in (4)) is based, is misleading: it compares the return of depositing tokens in the AMM with
the return of holding the same tokens in a portfolio out of the AMM for the whole time. Main-
taining such a fixed portfolio is by no means the optimal strategy ex-ante or the best alternative of
depositing tokens for the whole time, and this is why the measure of “impermanent loss” fails to
fully account for the opportunity cost of depositing tokens at the AMM. The optimal liquidity man-
agement strategy at equilibrium requires the liquidity providers to account for opportunity costs,
and decide their portfolio based on the expected return calculation for the following periods. Using
this strategy as a benchmark, liquidity providers can quantify the opportunity cost of depositing
in the AMM for the entire investment horizon.
Proposition 4. The expectation and variance of the gas fee in period t, E(t,1)[g
(t,3)
arb ]14 and V ar(t,1)[g
(t,3)
arb ],
are both increasing in the amount of token y
(t,1)
A and y
(t,1)
B deposited by liquidity providers.
The above proposition captures an important, yet undesirable, consequence of AMM adoption.
Intuitively, if a large amount of tokens is deposited at the AMM, we expect more profitable arbitrage
opportunities and thus gas fee surges due to arbitrageur’s bidding. Hence, as the AMM becomes
more popular and widely adopted, the instability of its underlying infrastructure—blockchain–
may increase. A surge of gas fees implies that other decentralized applications built on the same
blockchain may lose their costumers due to high transaction fees, or significantly delay the execution
14
E(t,s)[X] denotes the expectation of the random variable X conditional on the information available at the end
of sub-period s of period t.
21of orders by their costumers. Additionally, if those fees become less predictable due to larger
variance, the usage of the blockchain decreases. This means that the large adoption of the AMM
may impose negative externalities on other decentralized applications using the same blockchain
infrastructure.
## 5 The Design of AMMs
Since Uniswap first introduced AMMs with constant product function, numerous AMMs have been
developed. They differ in terms of the pricing functions they utilize, the number of different tokens
handled, and the charged transaction fees.
In this section, we study how such choices affect the equilibrium outcome. In Section 5.1, we
show that the curvature of the curve F(x,y) = C determines the severity of the arbitrage problem
and the deposit efficiency, i.e., the expected trading volume per unit token deposited. We also solve
for the optimal curvature of the pricing function, i.e., the curvature at which a “liquidity freeze” is
least likely to occur and aggregate welfare maximized. In Section 5.2, we argue why pooling more
than two tokens in the AMM does not reduce the arbitrage problem.
## 5.1 The Curvature of Pricing Curve
We begin by recalling that at sub-period s of period t, any trade satisfies the relation:
F(y
(t,s−1)
A + ∆A,y
(t,s−1)
B + ∆B) = F(y
(t,s−1)
A ,y
(t,s−1)
B ),∆B ≥ −y
(t,s−1)
B ,∆A ≥ −y
(t,s−1)
A , (6)
where ∆A,∆B are, respectively, the amounts of A and B tokens added to (or withdrawn from, if
the sign is negative) the AMM. The slope of the curve, −
∂F
∂∆A
∂F
∂∆B
, is the negative of marginal exchange
rate, and the curvature of the curve at each point captures the rate of change of the marginal
exchange rate.
For example, if the pricing function F is linear, F
(t)
0 (x,y) = p
(t,1)
A x + p
(t,1)
B y, then the slope
of the curve is −
p
(t,1)
A
p
(t,1)
B
and its curvature is 0, i.e., the marginal exchange rate is fixed at the fair
rate at sub-period 1 and equal to
p
(t,1)
A
p
(t,1)
B
. Another example is the product function used by Uniswap
V2 and Sushiswap, i.e., F1(x,y) = xy. The slope of the curve is −y
x, which means that the
marginal exchange rate depends on the deposited tokens at the AMM. Moreover, the curvature of
the exchange rate curve is positive. This implies that the marginal exchange rate from A to B tokens
22decreases in the amount of A tokens traded in, ∆A, which leads to the so called “slippage”.15 The
size of the slippage, which is determined by the curvature of the pricing curve, affects the equilibrium
outcomes. To see this, consider the following family of pricing functions:
F
(t)
k (x,y) = (1 − k) A F
(t)
0 (x,y) + k F1(x,y),
where k ∈ [0,1], and A =

y
(t,1)
A y
(t,1)
B
p
(t,1)
A p
(t,1)
B
1/2
is a scaling coefficient. The curvature of the pricing curve
F
(t)
k (x,y) = C is increasing in k. If k = 0, the pricing curve is a straight line with zero curvature;
if k = 1, the pricing curve is the constant product function, and it has the largest curvature among
all F
(t)
k ’s, k ∈ [0,1].
Lemma 3. Suppose y
(t,1)
A ,y
(t,1)
B > 0. The following claims hold:
1. the expected arbitrage loss ratio in period t, that is, the expected loss from arbitrage divided
by the total value of tokens in the AMM, E(t,1)

π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B

, decreases in k;
2. the investors’ surplus ratio in period t, that is, the sum of “type A” investor and “type
B” investor’s maximum surplus divided by the total value of tokens in the AMM, given by
P
i=A,B si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
, is decreasing in k.
When k increases, the curvature of the pricing curve also increases, and the exchange rate
adjusts more quickly to the increased exchange amount. This yields a higher slippage for trades
of the arbitrageur and of investors. Hence, the amount of a token the arbitrageur or investors
exchange for the other token increases. Because trading costs increase, the arbitrageur extracts a
lower profit from the arbitrage opportunity, thus the expected token value loss of liquidity providers
decreases. This explains why employing a pricing curve with a larger curvature reduces the severity
of the arbitrage problem.
A higher curvature does not benefit investors, who see their total trading surplus decrease as a
result of higher trading costs. In a few cases, the fee revenue of liquidity providers would decrease
if the curvature increases.
Proposition 5. Suppose that α > β. Then there exists a critical threshold k∗ ∈ (0,1) such that
15
“Slippage” occurs when the rate |∆B|
|∆A|
at which A tokens are exchanged for B tokens (respectively |∆A|
|∆B|
if B
tokens are exchanged for A tokens), is worse than the spot exchange rate −
∂F
∂∆A
∂F
∂∆B
(respectively −
∂F
∂∆B
∂F
∂∆A
if B tokens are
exchanged for A tokens).
231. The expected payoff of liquidity providers at equilibrium is increasing in k, for k ∈ [0,k∗], and
decreasing in k, for k ∈ [k∗,1].
2. “Liquidity freeze” is least likely to occur if k = k∗. That is, for any state ω(t−1,3), t = 1,2,
if there is a “liquidity freeze” at period t when k = k∗, then there is a “liquidity freeze” at
period t for any other k ∈ [0,1].
When the curvature of the pricing curve is too small, that is, k < k∗, the exchange rate adjusts
very slowly to the exchange amount, and the slippage of trading is very small. In this case, an
arriving investor only needs to deposit a very small amount of A (respectively B) tokens to take out
all the B (respectively A) tokens in the AMM. As a result, the fee revenue generated by investors’
trades is very small. Moreover, because the slippage has a small size, the arbitrage problem is
severe. Hence, increasing the curvature of the pricing function leads to a higher fee revenue and
a smaller arbitrage loss for investors, which in turn increases their payoffs. Conversely, when the
curvature of the pricing function is too high, that is, k > k∗, then so is the slippage of trading.
Despite making the arbitrage problem less severe, investors become more reluctant to trade, and
the fee revenue of liquidity providers is reduced. Hence, decreasing the curvature of the pricing
function increases the payoffs of liquidity providers. If k = k∗, the pricing curve achieves a balance
between these two economic forces: generating a higher fee revenue and increasing the severity of
arbitrage problem. As a result, liquidity providers have the strongest incentives to deposit their
tokens, and the occurrence of a “liquidity freeze” is minimized.
Proposition 6. Suppose that α > β. The equilibrium deposit efficiency in period t,t = 1,2, mea-
sured by the expected investors’ trading volume divided by the total value of tokens deposited in
period t, E

p
(t,1)
A |∆Q
(t,2)∗
A |+p
(t,1)
B |∆Q
(t,2)∗
B |
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B

16, is maximized if k = k∗. Moreover, the socially optimal
pricing curve, i.e., under which aggregate welfare measured by the sum of agents’ expected payoffs
is maximized, is attained at k∗.
The arbitrage loss and transaction fees are merely transfers of wealth between agents in our
model, whereas the gas fee paid by the arbitrageur to miners of underlying blockchain is a dead-
weight loss. Hence, the highest social welfare is attained when the aggregated investors’ maximum
surplus and liquidity providers’ payoffs are maximized. Both liquidity providers’ payoffs and de-
posit efficiency are maximized at k = k∗. Hence, deposits of liquidity providers can support the
highest number of trades for investors. Additionally, the amount deposited in the AMM grows the
16
We define the deposit efficiency to be zero when p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B = 0.
24fastest if liquidity providers’ payoffs are maximized. This increases the expected aggregate trading
volume and leads to higher social welfare.
## 5.2 Does Pooling More Tokens Reduce the Arbitrage Problem?
In this section, we analyze how pooling more than two types of tokens in the AMM affects the token
value loss of liquidity providers from arbitrage. Many practitioners have the seemingly convincing
intuition that pooling more tokens may alleviate the arbitrage problem due to diversification effects.
Few AMMs, including Balancer, have been designed based on this intuition. Interestingly, we find
that if an AMM manages more than two types of tokens, the arbitrage problem becomes worse.
Assume agents have access to three different tokens: A, B, and C token. There are two AMMs,
one handles A and B tokens only, while the other handles all three tokens. Both AMMs utilize a
constant product function, that is, FAB(x,y) = xy for the first AMM, and FABC(x,y,z) = xyz for
the second AMM. We denote the price of a single C token at sub-period s of period t by p
(t,s)
C .
As in the baseline model, in each period t the prices of tokens A, B, and C may move due to
exogenous shocks. With probability θ, the price movements of A, B, and C tokens are driven by a
common shock ζcom:
ζcom ∼ Bern(κ),p
(t,2)
i = (1 + βζcom)p
(t,1)
i ,i = A,B,C. (7)
With probability 1 − θ, they are determined by independent, idiosyncratic shocks ζA,ζB,ζC,
respectively:
ζi ∼ Bern(κ),ζA ⊥ ζB,⊥ ζB ⊥ ζC,⊥ ζA ⊥ ζC,
p
(t,2)
i = (1 + βζi)p
(t,1)
i ,i = A,B,C.
(8)
Apart from this adjustment, the model remains the same as the baseline model. The following
proposition compares the arbitrage loss of the two AMMs in equilibrium:
Proposition 7. Suppose y
(t,1)
A ,y
(t,1)
B > 0 for the AMM pooling two tokens and y
(t,1)
A ,y
(t,1)
B ,y
(t,1)
C > 0
for the AMM pooling three tokens. At period t, the expected arbitrage loss ratio of the AMM pooling
A and B tokens, E(t,1)

πAB(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B

, is smaller than the expected arbitrage loss ratio of
the AMM which pools A, B, and C tokens, E(t,1)

πABC(y
(t,2)
A ,y
(t,2)
B ,y
(t,2)
C ,p
(t,2)
C ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B +p
(t,1)
C y
(t,1)
C

.
The above result shows that the arbitrageur can extract more profit from the AMM pooling
three tokens, leading to a higher loss for the liquidity providers. The reason is twofold. First,
25an arbitrage opportunity becomes more likely as the number of tokens in the AMM increases.
Consequently, the probability of a token value loss for liquidity providers increases. Second, for
each realized arbitrage opportunity, the arbitrageur can extract a larger portion of the shocked
token from the AMM deposit. Intuitively, if the price of token A increases due to a shock in period
t, the arbitrageur can only use token B to exchange for token A in the AMM pooling two tokens.
The exchanged amount will be such that the marginal benefit of trading is equal to the marginal
trading cost. However, in the AMM which pools three tokens, the arbitrageur can use both token
B and C to exchange for the appreciated token A, and it will stop trading only when the marginal
benefit of trading both B and C tokens for A tokens equals to the marginal trading costs.
The logic described above carries through for AMMs which pool M > 3 tokens, M ∈ N. The
main takeaway is that the arbitrage problem cannot be mitigated by pooling more tokens in the
AMM.
## 6 Empirical Analysis
In this section, we provide empirical support to the main testable implications of our model. We
state the implications in Section 6.1. We describe our dataset in Section 6.2. We define the variables
used in our empirical validation in Section 6.3. We discuss the results from the regression analysis
in Section 6.4.
## 6.1 Testable Implications
Our model generates the following implications:
(1) An increase in token exchange rate volatility decreases the amount of tokens deposited at the
AMM. As shown in Proposition 3, if the volatility17 of the token exchange rate increases, the
arbitrage problem becomes more severe, and the liquidity providers have weaker incentives to
deposit their tokens. We test this implication by examining how the amount of deposits in
AMMs changes with the volatility of the token exchange rate.
(2) A higher trading volume results in a higher amount of tokens deposited at the AMM. As
shown in Proposition 3, if the token pairs attract more investors, both volume and trading fees
increase, which gives liquidity providers stronger incentives to deposit. We test this implication
by relating the change of deposits in AMMs with trading volumes.
17
The standard deviation of a change of the log token exchange rate over one-period is
log(1 + β)
p
(1 − θ)(κ1 + κ2 − 2κ1κ2 − (1 − θ)(κ1 − κ2)2), which clearly increases in the parameter β.
26(3) Average levels and volatility of gas fees attached to pairs with larger exchange rate volatility
are higher. Proposition 4 implies that, as the volatility of the token exchange rate increases,
arbitrage opportunities become more profitable. This in turn yields a higher expectation and
variance of the gas fee. To test this implication, we group all token pairs into two categories,
“stable pairs” and “unstable pairs”, and examine whether transactions in “stable pairs” are
associated with lower average levels and volatility of gas fees. “Stable pairs” consist of two
stable coins pegged to one US dollar, and have lower price volatility relative to “unstable
pairs”.
## 6.2 Data
The dataset contains histories of all trades, deposits, and withdrawals for a sample of 80 AMMs
with actively traded pairs. Among the 80 AMMs, 40 of them are from Uniswap V2, and the rest
are from Sushiswap. 7 pairs consist of only stable coins pegged to one US dollar, and they are
denoted as “stable pairs”.
For each AMM, the transaction level data include the time stamp, the address of the investor,
the gas price attached to the transaction, as well as the name and amount of tokens that the investor
trades in or takes out of the AMM. If an investor trades in (takes out) both tokens in a transaction,
then we identify the transaction as a deposit (withdrawal); if instead, the investor trades in one
token and takes out the other token, we identify the transaction as a swap. We use the history to
calculate and track the total liquidity reserve of both tokens in each AMM, and calculate the spot
rate of the exchange from the liquidity reserves.
This study covers the 25-week period18 from Dec 22, 2020 to June 20, 2021. The number of
AMMs initiated by Dec 22, 2020 is only 30. Among them, 16 are from Sushiswap, and the rest are
from Uniswap; in particular, 3 pairs are “stable pairs”, and they all belong to Uniswap.
## 6.3 Definitions of Variables
We next describe the main variables in our analysis.
Token Exchange Rate Volatility. We measure the volatility of the token exchange rate for
AMM j in week t using the standard deviation of the log spot rate between two tokens deposited
18
We choose this interval to have enough cross-sectional and time-series observations. A longer time period reduces
the amount of AMMs available, as most of the AMMs are set up at the end of 2020.
27in the AMM j, in week t. This measurement is invariant with respect to the choice of base token19
of the pair and to scalar multiplication20 of token values.
Deposit Inflow and Outflow. Denote the pair of tokens in AMM j as Aj token and Bj token.
We measure the change of deposits for AMM j in week t as follows:
Depositflowjt = sgn(DepositAjt) ×

DepositAjt
TokenAjt
×
DepositBjt
TokenBjt
1/2
(9)
where DepositAjt, DepositBjt are the total Aj tokens and Bj tokens deposited (if positive), or
withdrawn (if negative) by liquidity providers of AMM j, with deposit or withdrawal order during
week t. TokenAjt and TokenBjt are, respectively, the total liquidity reserves of Aj and Bj tokens
in AMM j at the beginning of week t. sgn(DepositAjt) is positive if the net deposit is larger than
the net withdrawal, and negative otherwise.
Trading Volume. We measure the total trading volume in AMM j during week t as follows:
V olumejt =

TradeAjt
TokenAjt
×
TradeBjt
TokenBjt
1/2
, (10)
where TradeAjt, tradeBjt are, respectively, the total amount of Aj and Bj tokens traded by
investors with swap orders at AMM j in week t, and TokenAjt,TokenBjt are, respectively, the
total liquidity reserves of Aj and Bj tokens in AMM j at the beginning of week t. The above
measure captures the total trading volume by investors relative to the total reserve in AMM j
during week t.
Gas Price Volatility. We measure the gas price volatility in AMM j during week t using the
standard deviation of the gas price attached to all transactions executed on AMM j in week t. All
AMMs we consider are built on the same blockchain, i.e., Ethereum, and thus levels and volatility
of gas prices are comparable across pairs.
Table 1 presents summary statistics of the data. Most of the variables have large in-sample
variations. Since “stable pairs” are pairs of stable coins pegged to one dollar, the log spot exchange
19
In the foreign exchange market, the first element of a currency pair is denoted as the base currency, and the
second one is referred to as the quote currency. We follow the same convention for an AMM, and refer to the first
token in a pair as the base token, and to the second token as the quote token.
20
Some tokens are more valuable than others, with Bitcoin being a prominent example. A normalized measure
makes the volatility of the token exchange rate comparable across pairs
28Table 1: Summary statistics of the data set. It covers the 25-week period from Dec 22, 2020 to
June 20, 2021. Weekly-level variables are included in Panel A, and transaction-level data are in
Panel B.
N Mean SD 10th 50th 90th
Panel A: Weekly-level Data
Log Rate Volatility, All 750 0.049 0.039 0.004 0.042 0.093
Log Rate Volatility, Stable 75 0.004 0.002 0.002 0.003 0.005
Log Rate Volatility, Unstable 675 0.054 0.038 0.015 0.045 0.094
Token Inflow Rate, All 750 0.013 0.273 -0.164 -0.001 0.160
Token Inflow Rate, Stable 75 0.063 0.369 -0.179 -0.002 0.230
Token Inflow Rate, Unstable 675 0.008 0.260 -0.163 -0.001 0.141
Trading Volume , All 750 1.987 1.980 0.200 1.365 4.672
Trading Volume , Stable 75 1.033 1.018 0.173 0.762 2.032
Trading Volume , Unstable 675 2.093 2.032 0.231 1.465 4.794
Gas Price Volatility, All 750 183.045 240.660 29.993 124.363 364.445
Gas Price Volatility, Stable 75 84.888 67.732 17.458 75.391 157.683
Gas Price Volatility, Unstable 675 193.951 250.307 31.922 135.929 383.220
Panel B: Transaction-level Data
Gas Price (Gwei), All 4,161,096 136.884 340.908 34 106.000 235.000
Gas Price (Gwei), Stable 223,318 117.471 113.586 40.000 99.000 202.000
Gas Price (Gwei), Nonstable 3,937,778 137.985 349.363 33.000 106.275 237.865
Absolute Value of Log Spot Rate, All 4,161,096 5.792 2.463 1.698 7.142 7.847
Absolute Value of Log Spot Rate, Stable 223,318 0.003 0.003 0.000 0.002 0.005
Absolute Value of Log Spot Rate, Nonstable 3,937,778 6.120 2.098 3.003 7.199 7.865
rates are very close to 0, and their token exchange rate volatility is much lower than the volatility
of “unstable pairs”.
## 6.4 Empirical Tests and Results
In this section, we examine the three testable implications listed in Section 6.1.
296.4.1 Exchange Rate Volatility, Trading Volume, and Deposit
We estimate the following panel regressions to measure the impact of token exchange rate volatility
and trading volume on deposit flow rates:
Depositflowjt = γj + γt + ρ1V olatilityjt + jt (11)
Depositflowjt = γj + γt + δ1V olumejt + jt (12)
Depositflowjt = γj + γt + ρ2V olatilityjt + δ2V olumejt + jt, (13)
where j indexes AMMs, t indexes time, Depositflowjt is the deposit flow rate (inflow if positive
and outflow if negative), γj,γt are respectively the AMM and time fixed effects, V olatilityjt is the
volatility of the token exchange rate of AMM j in week t, V olumejt is the trading volume at AMM
j in week t, and jt is an error term. We cluster our standard errors at the AMM level. The
coefficients ρ1,ρ2 quantify the sensitivity of deposit flow on token volatility, and the coefficients
δ1,δ2 give the sensitivity of deposit flow on trading volume.
Table 2 shows a negative, statistically significant relationship between the token exchange rate
volatility and the deposit flow rate, which is consistent with our theoretical prediction that ρ1,ρ2 <
0. After controlling for trading volume, a one-standard-deviation increase in weekly spot rate
volatility (which is equal to 0.04) decreases the deposit flow rate by 25% standard deviations
of that variable. Columns (b) and (c) show that there exists a positive, statistically significant
relationship between trading volume and deposit flow rate, confirming our theoretical prediction
that δ1,δ2 > 0. After controlling for exchange rate volatility, a one-standard-deviation increase in
trading volume (which is equal to 1.98) increases the deposit flow rate by 35% standard deviations
of that variable. In summary, Table 2 confirms our model predictions from Section 6.1 that the
amount of deposited tokens decreases with the exchange rate volatility, and increases with the
trading volume. Additionally, the regression estimates indicate that these effects are economically
significant.
## 6.4.2 Token Exchange Rate Volatility and Gas Price
We examine the impact of token exchange rate volatility on levels and volatility of gas fees. Specif-
ically, we estimate the following two linear models:
GasV olatilityjt = γt + γUniswap + κ11StablePair + jt (14)
30Table 2: Results from regressing weekly deposit flow rates of AMMs on token exchange rate volatil-
ity and trading volumes. The data set covers 30 AMMs for a 25-week period from Dec 22, 2020 to
June 20, 2021. The dependent variable is the weekly deposit flow rate of AMMs. The independent
variables are the weekly spot exchange rate volatility and the weekly trading volume of each AMM.
Week fixed effects and AMM fixed effects are included for all regressions. Standard errors are
clustered at the AMM level. Asterisks denote significance levels (***=1%, **=5%, *=10%).
Dependent variable: Deposit Inflow Rate
(a) (b) (c)
Intercept 0.023 −0.103 −0.018
(0.077) (0.073) (0.070)
Exchange Rate Volatility −0.394∗∗ −1.451∗∗∗
(0.182) (0.405)
Trading Volume 0.039∗∗∗ 0.052∗∗∗
(0.015) (0.020)
Week fixed effects? yes yes yes
AMM fixed effects? yes yes yes
Observations 750 750 750
R2 0.11 0.14 0.17
Note: ∗p<0.1; ∗∗p<0.05; ∗∗∗p<0.01
Gasjs = γt + γUniswap + κ21StablePair + js, (15)
where j indexes AMMs, t indexes time, and s indexes transactions. We run regressions at weekly
frequency21 for the model in equation (14) and at daily frequency for the model in equation (15).
GasV olatilityjt is the volatility of gas price at time t in AMM j, Gasjs is the gas price of transaction
s in AMM j, γt are time fixed effects, γUniswap is the fixed effect for all Uniswap AMM exchanges,
1StablePair is the dummy variable for “stable pairs” which consist of two stable coins pegged to
one US dollar, and jt,js are error terms. We cluster our standard errors at the AMM level. The
coefficients κ1 and κ2 quantify the differences in levels and volatility of gas fees between “stable
pairs” and “unstable pairs”, respectively.
Table 3 indicates that the weekly gas price volatility of “stable pairs” is around 40% lower
than that of “non-stable pairs”. Additionally, the gas price level for transactions of “stable pairs”
is around 8% lower than that of “non-stable pairs”. In summary, Table 3 supports our model
predictions from Section 6.1 that levels and volatility of gas fees are higher for pairs with larger
exchange rate volatility. Moreover, the coefficient estimates indicate that these relationships are
21
We choose weekly, instead of daily frequency, to have enough observations to estimate the volatility of gas price.
31Table 3: Results from regressing a binary variable indicating whether or not the AMM contains
a “stable pair” on gas price and gas price volatility. The data covers 30 AMMs for a 25-week
period from Dec 22, 2020 to June 20, 2021. The dependent variable in column (a) is the weekly
gas price volatility, and the dependent variable in column (b) is the gas prices of transactions. The
independent variable is a dummy equal to one if the AMM contains a pair of stable coins pegged
to one US dollar. Time fixed effects and exchange fixed effects are included for all regressions.
Standard errors are clustered at the AMM level. Asterisks denote significance levels (***=1%,
**=5%, *=10%).
Dependent variables:
Gas Price Volatility Gas Price
(a) (b)
Intercept 189.48∗∗∗ 137.34∗∗∗
(16.13) (1.61)
Stable -64.34∗∗∗ -10.51∗∗∗
(20.02) (2.78)
Week fixed effects? yes no
Day fixed effects? no yes
Exchange fixed effects? yes yes
Observations 750 4,161,126
R2 0.24 0.04
Note: ∗p<0.1; ∗∗p<0.05; ∗∗∗p<0.01
economically significant.
## 7 Conclusion
Our paper analyzes the economic incentives behind blockchain-based financial intermediation. We
show theoretically and empirically that exploitable arbitrage opportunities created by token ex-
change rate volatility limits the adoption of blockchain-based AMMs by liquidity providers. We
also argue that the adoption of AMMs impose negative externalities on other decentralized appli-
cations built on the same underlying blockchain.
Our findings inform the liquidity management strategy of token holders. We argue that they
should only deposit into AMMs whose token prices are stable and highly correlated, or whose
trading volumes are high. Our results warn against providing liquidity into AMMs which manage
Altcoins with no intrinsic value. Importantly, we argue that liquidity providers should not fall
prey to the fallacy that token value loss from arbitrage is impermanent and keep depositing if
exchange rate reversion is likely. Token exchange rate movements, regardless of the direction, leads
32to permanent loss, and liquidity providers need to account for the opportunity cost of depositing
tokens into AMMs.
Our results have implications for the operation and design of DeFi exchanges. We argue that
the curvature of the pricing curve used by the AMM governs the trade-offs between the severity
of the arbitrage problem and the investors’ willingness to trade. When these two forces are well
balanced, a “liquidity freeze” is least likely to occur, the deposit efficiency is the highest, and
social welfare is maximized. Our analysis also sheds light on a common misconception among
practitioners, and shows that pooling more than two tokens in the same AMM does not alleviate
the arbitrage problem.
Our paper can be extended along several directions. The first extension is to study the gover-
nance of AMMs. Typically, decisions for the operations of DeFi projects are proposed, voted and
made by investors who hold the governance tokens. However, different voters, such as developers,
liquidity providers, and token investors, may have very different incentives, and their votes often
lead to socially inefficient protocols, such as those demanding very high transaction fees. This calls
for the design of a mechanism which distributes governance tokens to agents so to minimize agency
costs. Another desirable extension is to design protocols through which DeFi projects internalize
the externalities imposed on the underlying blockchains. Such a protocol would inform the decision
of which DeFi projects should be built on the same blockchain versus multiple blockchains. While
executing all DeFi projects on a smaller number of blockchains may increase safety, it would also
increase congestion and transaction costs. We leave a systematic study of the trade-off between
transaction safety and costs for future research.
33References
Abadi, J., and M. Brunnermeier. 2018. Blockchain Economics. NBER Working Papers 25407,
National Bureau of Economic Research, Inc.
Adams, H. 2020. Uniswap. https://uniswap.org/blog/uniswap-v2/.
Angeris, G., H. T. Kao, R. Chiang, C. Noyes, and T. Chitra. 2021. An analysis of Uniswap markets.
Working Paper.
Athey, S., I. Parashkevov, V. Sarukkai, and J. Xia. 2016. Bitcoin pricing, adoption, and usage:
Theory and evidence. Stanford University Graduate School of Business Research Paper No.
16-42. Available at SSRN: https://ssrn.com/abstract=2826674.
Bagshaw, R. 2020. Top 10 cryptocurrencies by market capitalization. https://finance.yahoo.
com/news/top-10-cryptocurrencies-market-capitalisation-160046487.html.
Bartoletti, M., J. Chiang, and A. Lluch-Lafuente. 2021. A theory of automated market makers in
DeFi. Working Paper.
Biais, B., C. Bisière, M. Bouvard, and C. Casamatta. 2019. The Blockchain Folk Theorem. The
Review of Financial Studies 32:1662–715. ISSN 0893-9454.
Budish, E. 2018. The economic limits of bitcoin and the blockchain. Working Paper 24717, National
Bureau of Economic Research.
Campbell, R. H. 2016. Cryptofinance. Working paper.
Chiu, J., and T. V. Koeppl. 2019. Blockchain-Based Settlement for Asset Trading. The Review of
Financial Studies 32:1716–53. ISSN 0893-9454.
Cong, L., X. Li, K. Tang, and Y. Yang. 2020. Crypto wash trading. Working paper.
Cong, L. W., and Z. He. 2019. Blockchain Disruption and Smart Contracts. The Review of Financial
Studies 32:1754–97. ISSN 0893-9454.
Cong, L. W., Z. He, and J. Li. 2020. Decentralized Mining in Centralized Pools. The Review of
Financial Studies 34:1191–235. ISSN 0893-9454.
Cong, L. W., Y. Li, and N. Wang. 2020. Token-Based Platform Finance. NBER Working Papers
27810, National Bureau of Economic Research, Inc.
34Daian, P., S. Goldfeder, T. Kell, Y. Li, X. Zhao, I. Bentov, L. Breidenbach, and A. Juels. 2020.
Flash boys 2.0: Frontrunning in decentralized exchanges, miner extractable value, and consensus
instability. In 2020 IEEE Symposium on Security and Privacy (SP), 910–27.
Davis, D. 2021. What is Impermanent loss? What can I do to avoid it? https://cryptoarena.
org/what-is-impermanent-loss/.
Easley, D., M. O’Hara, and S. Basu. 2019. From mining to markets: The evolution of bitcoin
transaction fees. Journal of Financial Economics 134:91–109. ISSN 0304-405X.
Gan, J. R., G. Tsoukalas, and S. Netessine. 2021. Initial coin offerings, speculation, and asset
tokenization. Management Science 67:914–31.
Gandal, N., J. Hamrick, T. Moore, and T. Oberman. 2018. Price manipulation in the bitcoin
ecosystem. Journal of Monetary Economics 95:86–96. ISSN 0304-3932.
Glosten, L. R. 1994. Is the electronic open limit order book inevitable? The Journal of Finance
49:1127–61.
Glosten, L. R., and P. R. Milgrom. 1985. Bid, ask and transaction prices in a specialist market with
heterogeneously informed traders. Journal of Financial Economics 14:71–100. ISSN 0304-405X.
Griffins, J. M., and A. Shams. 2020. Is Bitcoin really untethered? The Journal of Finance 75:1913–
64.
Harvey, C. R., A. Ramachandran, and J. Santoro. 2021. DeFi and the future of finance. Working
paper.
Hinzen, F. J., K. John, and F. Saleh. 2019. Bitcoin’s limited adoption problem. Working paper.
Huberman, G., J. D. Leshno, and C. Moallemi. 2021. Monopoly without a Monopolist: An Eco-
nomic Analysis of the Bitcoin Payment System. The Review of Economic Studies ISSN 0034-6527.
Rdab014.
Irresberger, F., K. John, P. Mueller, and F. Saleh. 2020. The public blockchain ecosystem: An
empirical analysis. Working paper.
Kharif, O. 2020. DeFi boom makes Uniswap most sought-after crypto
exchange. https://www.bloomberg.com/news/articles/2020-10-16/
defi-boom-makes-uniswap-most-sought-after-crypto-exchange.
35Lehar, A., and C. Parlour. 2021. Decentralized exchanges. Working paper.
Leshno, J. D., and P. Strack. 2020. Bitcoin: An axiomatic approach and an impossibility theorem.
American Economic Review: Insights 2:269–86. doi:10.1257/aeri.20190494.
Li, T., D. Shin, and B. Wang. 2018. Cryptocurrency pump-and-dump schemes. Working Paper.
McSweeney, M. 2020. DEX volumes constituted 6% of centralized ex-
change volumes in august. https://www.theblockcrypto.com/linked/76874/
dex-volumes-constituted-6-of-centralized-exchange-volumes-in-august.
Nakamoto, S. 2008. Bitcoin: A Peer-to-Peer Electronic Cash System. Unpublished manuscript.
Pagnotta, E. 2021. Decentralizing money: Bitcoin prices and blockchain security. Review of Fi-
nancial Studies 34:1–42.
Park, A. 2021. The Conceptual Flaws of Constant Product Automated Market Making. Working
paper.
Roşu, I., and F. Saleh. 2021. Evolution of shares in a proof-of-stake cryptocurrency. Management
Science 67:661–72.
Saleh, F. 2020. Blockchain without Waste: Proof-of-Stake. The Review of Financial Studies
34:1156–90. ISSN 0893-9454.
Schilling, L., and H. Uhlig. 2019. Some simple bitcoin economics. Journal of Monetary Economics
106:16–26. ISSN 0304-3932. SPECIAL CONFERENCE ISSUE: “Money Creation and Currency
Competition” October 19-20, 2018 Sponsored by the Study Center Gerzensee and Swiss National
Bank.
Sedgwick, K. 2018. Order speed analysis reveals the fastest cryptocur-
rency exchanges – exchanges bitcoin news. https://news.bitcoin.com/
order-speed-analysis-reveals-the-fastest-cryptocurrency-exchanges/.
Smith, K., and A. Das. 2021. Uniswap leads 2021’s best decentralized exchanges. https://
bravenewcoin.com/insights/trading-volume-surges-on-decentralized-exchanges.
Sockin, M., and W. Xiong. 2020. A model of cryptocurrencies. Working Paper 26816, National
Bureau of Economic Research.
36Xu, J., N. Vavryk, K. Paruch, and S. Cousaert. 2021. Sok: Decentralized exchanges (dex) with
automated market maker (AMM) protocols.
Yermack, D. 2017. Corporate Governance and Blockchains. Review of Finance 21:7–31. ISSN
1572-3097.
37A Technical Results and Proofs
Proof of Lemma 1. Without loss of generality, we assume the shock hits B tokens. The case where
the shock leads to an appreciation of A tokens can be handled symmetrically. Recall that F is
twice continuously differentiable, and Fx > 0,Fy > 0. By the Implicit Function Theorem, we can
then rewrite the constraint of the arbitrageur’s optimization problem stated in (3) as
∆q
(t,3)
B = g(t,3)
(∆q
(t,3)
A ),−∞ < ∆q
(t,3)
A ≤ 0, (A.1)
where g(t,3) is a twice differentiable function. In this way, we write the amount of B tokens the
arbitrageur can withdraw from the AMM as a function of the negative of the amount of A tokens
deposited into the AMM by the arbitrageur, before paying the fee. The first order derivative of the
above function is the negative of marginal exchange rate:
d(g(t,3))
d(∆q
(t,3)
A )
= −
Fx
Fy (x,y)=(y
(t,2)
A −∆q
(t,3)
A ,y
(t,2)
B −∆q
(t,3)
B )
≤ 0.
By Assumption 1, we have d2(g(t,3))
d(∆q
(t,3)
A )2
= −
−F2
y Fxx+2FyFxFxy−F2
xFyy
F3
y
(x,y)=(y
(t,2)
A −∆q
(t,3)
A ,y
(t,2)
B −∆q
(t,3)
B )
< 0,
i.e., g(t,3) is concave.
Using the relations (A.1), p
(t,2)
A = p
(t,1)
A and p
(t,2)
B = p
(t,1)
B (1+β) into the two-variable optimiza-
tion problem (3), we obtain an equivalent single variable optimization problem:
max
−∞<∆q
(t,3)
A ≤0
p
(t,1)
A (1 + f)∆q
(t,3)
A + p
(t,1)
B (1 + β)g(t,3)
(∆q
(t,3)
A ) (A.2)
The first-order derivative of the objective function in (A.2) is:
p
(t,1)
A (1 + f) − (−p
(t,1)
B (1 + β)
dg(t,3)
d(∆q
(t,3)
A )
) (A.3)
The first term is the arbitrageur’s marginal cost of exchanging A for B tokens, while the second
term is the marginal benefit. By concavity, the above expression decreases in ∆q
(t,3)
A . Moreover, if
∆q
(t,3)
A = 0, dg(t,3)
d(∆q
(t,3)
A )
= −
p
(t,1)
A
p
(t,1)
B
. This is because at sub-period 1 of period t, the liquidity providers
deposit their tokens in the AMM at the fair value exchange rate. Hence, the above first-order
derivative is positive at ∆q
(t,3)
A = 0 if and only if 1+f > 1+β. This means that the marginal cost
exceeds the marginal benefit. The optimal amount of A tokens exchanged for B tokens is then 0.
If ∆q
(t,3)
A = 0, the value of the objective function is exactly 0, because no arbitrage has occurred.
38If 1 + β > 1 + f, the optimal exchange amount is attained when the marginal cost equals the
marginal benefit of exchanging:
p
(t,1)
A (1 + f) = (−p
(t,1)
B (1 + β)
dg(t,3)
d(∆q
(t,3)
A )
). (A.4)
We denote the solution of the above equation by ∆q
(t,3)∗
A . By concavity of g(t,3), the first order
derivative in (A.3) is decreasing in the interval (−∞,0]; it is also negative at 0 by 1+β > 1+f. By
part 4 of Assumption 1, the first order derivative is positive as ∆q
(t,3)
A → −∞. Thus, by continuity
of the first-order derivative, there exists a unique ∆q
(t,3)∗
A at which the derivative is 0, and (A.4) is
satisfied. Therefore, the optimal exchange amount of A tokens, ∆q
(t,3)∗
A , exists. Moreover, ∆q
(t,3)∗
A
is unique because (A.4) admits at most one solution.
Recall that 1 + β > 1 + f, p
(t,1)
A (1 + f) < (−p
(t,1)
B (1 + β) d(g(t,3))
d(∆q
(t,3)
A )
) for ∆q
(t,3)
A = 0. This implies
that ∆q
(t,3)∗
A 6= 0 because the arbitrageur’s objective function attains a strictly higher value at
∆q
(t,3)∗
A 6= 0 than at ∆q
(t,3)
A = 0. Because the objective function has value 0 at ∆q
(t,3)
A = 0, we
obtain π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) > 0 if β > f.
We next prove that π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ), |∆q
(t,3)∗
A |, and |∆q
(t,3)∗
B | increase in β and decrease
in f.
In the case β ≤ f, the arbitrageur does not trade, and thus π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = 0,
|∆q
(t,3)∗
A |= 0,|∆q
(t,3)∗
B |= 0, and thus they are all independent of f and β.
For the case β > f, we apply the Envelope Theorem and obtain ∂π
∂f = p
(t,1)
A ∗ ∆q
(t,3)∗
A < 0, and
∂π
∂β = p
(t,1)
B ∗ ∆q
(t,3)∗
B > 0. Therefore, π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) increases in β and decreases in f.
q
(t,3)∗
A is defined by the condition stated in (A.4). By differentiating both sides of (A.4) with
respect to f, we have
p
(t,1)
A = −p
(t,1)
B (1 + β)
d2g(t,3)
d(∆q
(t,3)
A )2
d∆q
(t,3)∗
A
df
.
Recall that g(t,3) is concave, which means that d2g(t,3)
d(∆q
(t,3)
A )2
< 0. This implies that
d∆q
(t,3)∗
A
df > 0, i.e.,
∆q
(t,3)∗
A increases in f. Following the same procedure as above, we can show that ∆q
(t,3)∗
A decreases
in β. Since ∆q
(t,3)∗
A < 0, |∆q
(t,3)∗
A | decreases in f, and increases in β.
Since ∆q
(t,3)∗
B = g(t,3)(∆q
(t,3)∗
A ) and the derivative of g(t,3) is negative, we have that ∆q
(t,3)∗
B
decreases in ∆q
(t,3)∗
A < 0 and increases in |∆q
(t,3)∗
A |. Thus, ∆q
(t,3)∗
B decreases in f, and increases in
β.
39Lemma A.1. For any period t = 1,2 and constant c > 0, the following properties are true:
1. ∆q
(t,3)∗
B (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = c∆q
(t,3)∗
B (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ),
2. ∆q
(t,3)∗
A (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = c∆q
(t,3)∗
A (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ),
3. π(cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = cπ(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ).
Proof of Lemma A.1. Recall that the constraint of the arbitrageur’s optimization problem defined
in (3) is:
F(y
(t,2)
A ,y
(t,2)
B ) = F(y
(t,2)
A − ∆q
(t,3)
A ,y
(t,2)
B − ∆q
(t,3)
B ).
If the state at subperiod 2 of period t is (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ), then the constraint of
arbitrageur problem becomes:
F(cy
(t,2)
A ,cy
(t,2)
B ) = F(cy
(t,2)
A − ∆q
(t,3)
A ,cy
(t,2)
B − ∆q
(t,3)
B )
⇐⇒ cl
F(y
(t,2)
A ,y
(t,2)
B ) = cl
F(y
(t,2)
A −
∆q
(t,3)
A
c
,y
(t,2)
B −
∆q
(t,3)
B
c
)
⇐⇒ F(y
(t,2)
A ,y
(t,2)
B ) = F(y
(t,2)
A −
∆q
(t,3)
A
c
,y
(t,2)
B −
∆q
(t,3)
B
c
)
With the following change of variables, ∆q
(t,3)0
A = ∆q
(t,3)
A /c,∆q
(t,3)0
B = ∆q
(t,3)
B /c, the optimization
problem given the state (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) may be rewritten as
max
∆q
(t,3)0
A ,∆q
(t,3)0
B
c p
(t,2)
A (1 + f)∆q
(t,3)0
A + c p
(t,2)
B ∆q
(t,3)0
B
s.t. F(y
(t,2)
A ,y
(t,2)
B ) = F(y
(t,2)
A − ∆q
(t,3)0
A ,y
(t,2)
B − ∆q
(t,3)0
B )
∆q
(t,3)0
A ≤ 0,∆q
(t,3)0
B ≥ 0,
(A.5)
which corresponds to the optimization problem stated in (3) except that the objective function is
now multiplied by a constant c. Therefore, the maximum value for the optimization problem in
(A.5) is c times the maximum of the optimization problem stated in (3).
Moreover, the optimization problem (A.5) admits the same solution as the optimization problem
stated in (3), and given by (∆q
(t,3)∗
A (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ),∆q
(t,3)∗
B (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )). After
40multiplying ∆q
(t,3)∗
A (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) and ∆q
(t,3)∗
B (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) by c, we obtain
∆q
(t,3)∗
A (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = c∆q
(t,3)∗
A (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ),
∆q
(t,3)∗
B (cy
(t,2)
A ,cy
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = c∆q
(t,3)∗
B (y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ).
Proof of Lemma 2. Without loss of generality, we assume that the investor who arrives is of “type
A”. The case where the investor who arrives is of “type B” can be handled using symmetric
arguments.
We follow the same procedure as in the proof of Lemma 1. Recall that F is twice continuously
differentiable, and Fx > 0,Fy > 0. By the Implicit Function Theorem, we can then rewrite the
constraint of the investor’s optimization problem stated in (5) as
∆Q
(t,2)
A = g(t,2)
(∆Q
(t,2)
B ),−∞ < ∆Q
(t,2)
B ≤ 0, (A.6)
where g(t,2) is a twice differentiable function. In this way, we can write the amount of A tokens the
investors can withdraw from the AMM as a function of the negative of the amount of B tokens she
has to deposit into the AMM, excluding the fee. The first order derivative of the above function is
the negative of the marginal exchange rate:
dg(t,2)
d(∆Q
(t,2)
B )
= −
Fy
Fx (x,y)=(y
(t,1)
A −∆Q
(t,2)
A ,y
(t,1)
B −∆Q
(t,2)
B )
< 0.
It follows from Assumption 1 that the function g(t,2) is concave, that is, d2g(t,2)
d(∆Q
(t,2)
A )2
≤ 0.
Plugging (A.6) into the two-variable optimization problem stated in (5), we obtain the following
equivalent, single-variable, optimization problem:
max
−∞<∆Q
(t,2)
B ≤0
(1 + α)p
(t,1)
A ∆g(t,2)
∆Q
(t,2)
B + (1 + f)p
(t,1)
B ∆Q
(t,2)
B . (A.7)
The first-order derivative of the objective function in (A.7) is
(1 + f)p
(t,1)
B − −(1 + α)p
(t,1)
A
dg(t,2)
d(∆Q
(t,2)
B )
!
(A.8)
The first term is the marginal cost of exchanging a B token foran A token, and the second term
is the marginal benefit of investors. By concavity, the above expression decreases in ∆Q
(t,2)
B . If
41∆Q
(t,2)
B = 0, dg(t,2)
d(∆Q
(t,2)
B )
= −
p
(t,1)
B
p
(t,1)
A
because at sub-period 1 the liquidity providers deposit their tokens
in the AMM at the fair rate. Hence, the first-order derivative of the objective function stated in
(A.8) is positive at ∆Q
(t,2)
B = 0 if and only if 1 + f > 1 + α. If 1 + f ≥ 1 + α, the marginal cost
exceeds the marginal benefit. Hence, the optimal trading size is zero, i.e., the investor does not
trade.
If 1 + α > 1 + f, the optimal exchange amount is obtained by equating the marginal cost and
the marginal benefit of exchanging:
(1 + f)p
(t,1)
B = −(1 + α)p
(t,1)
A
dg(t,2)
d(∆Q
(t,2)
B )
!
. (A.9)
We denote the solution of the equation above as ∆Q
(t,2)∗
B . Observe that (A.9) admits at
most one solution, hence if a solution ∆Q
(t,2)∗
B exists, it is unique. The existence of a solution
∆Q
(t,2)∗
B follows from the intermediate value theorem: the derivative (A.8) is continuous, negative
if ∆Q
(t,2)
B = 0, and positive if ∆Q
(t,2)
B → −∞. Moreover, ∆Q
(t,2)∗
B 6= 0 because, if 1 + α > 1 + f,
(1+f)p
(t,1)
B < (−(1+α)p
(t,1)
A
dg(t,2)
d(∆Q
(t,2)
B )
) when ∆Q
(t,2)
B = 0. Therefore, the investor’s objective func-
tion attains a higher value at ∆Q
(t,2)∗
B than at 0, and thus the (“type A”) investor’s maximum
surplus sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) is strictly positive if α > f.
We next prove that sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ), |∆Q
(t,2)∗
A |, and |∆Q
(t,2)∗
B | are increasing in α and
decreasing in f. For the case α ≤ f, the investor does not trade, and thus sA(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) =
0, |∆Q
(t,2)∗
A |= 0,|∆Q
(t,2)∗
B |= 0. As a result, ∂sA
∂f = ∂sA
∂α = 0,
∂|∆Q
(t,2)∗
A |
∂f =
∂|∆Q
(t,2)∗
A |
∂α =
∂|∆Q
(t,2)∗
B |
∂f =
∂|∆Q
(t,2)∗
B |
∂α = 0.
For the case α > f, we apply the Envelope Theorem and obtain ∂sA
∂f = p
(t,1)
B ∆Q
(t,2)∗
B < 0, and
∂π
∂α = p
(t,1)
A ∆Q
(t,2)∗
A > 0. Therefore, sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) increases in α and decreases in f.
Recall the quantities ∆Q
(t,2)∗
B ,∆Q
(t,2)∗
A . ∆Q
(t,2)∗
B defined by the condition in (A.9). Differenti-
ating both sides of (A.9) with respect to f, we obtain
p
(t,1)
B = −(1 + α)p
(t,1)
A
d2g(t,2)
d(∆Q
(t,2)
B )2
d∆Q
(t,2)∗
B
df
.
Recall that g(t,2) is concave, thus d2g(t,2)
d(∆Q
(t,2)
B )2
< 0. It then follows that
d∆Q
(t,2)∗
B
df > 0 because p
(t,1)
B > 0.
Using the same argument, we can show
d∆Q
(t,2)∗
B
dα < 0. Since ∆Q
(t,2)∗
B < 0, we have that |∆Q
(t,2)∗
B |
decreases in f, and increases in α. Since ∆Q
(t,2)∗
A = g(t,2)(∆Q
(t,2)∗
B ), and the derivative of g(t,2) is
negative, we have
∂∆Q
(t,2)∗
A
∂f = dg(t,2)
d∆Q
(t,2)∗
B
∂∆Q
(t,2)∗
B
∂f < 0, and
∂∆Q
(t,2)∗
A
∂α = dg(t,2)
d∆Q
(t,2)∗
B
∂∆Q
(t,2)∗
B
∂α > 0. Because
42∆Q
(t,2)∗
A > 0 , we deduce that |∆Q
(t,2)∗
A | decreases in f and increases in α.
Lemma A.2. For any period t = 1,2 and constant c > 0, the following relations hold:
1. ∆Q
(t,2)∗
B (cy
(t,1)
A ,cy
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) = c∆Q
(t,2)∗
B (y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ),
2. ∆Q
(t,2)∗
A (cy
(t,1)
A ,cy
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) = c∆Q
(t,2)∗
A (y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ),
3. sA(cy
(t,1)
A ,cy
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) = c ∗ sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ),
4. sB(cy
(t,1)
A ,cy
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) = c ∗ sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ).
Proof of Lemma A.2. The proof is analogous to that used to prove Lemma A.1.
Lemma A.3.
min
a,b
pA ∗ a + pB ∗ b
s.t. F(yA,yB) = F(yA + a,yB + b).
(A.10)
For any pA,pB,yA,yB > 0, there exists a unique solution (a∗,b∗) for the optimization problem
stated in (A.10), and it satisfies the condition Fx
Fy
(x,y)=(yA+a∗,yB+b∗)
= pA
pB
.
Proof of Lemma A.3. Recall that F is twice continuously differentiable, and Fx > 0,Fy > 0. By
the Implicit Function Theorem, we can rewrite the constraint of the optimization problem stated
in (A.10) as
b = m(a),a ∈ R, (A.11)
where m(a) is twice differentiable function, whose first order derivative is
m0
(a) = −
Fx
Fy (x,y)=(yA+a,yB+b)
< 0.
By Assumption 1, m(a) is convex, that is, m00(a) > 0. We then plug b = m(a) into the optimization
problem stated in (A.10), and we obtain an equivalent single variable unconstrained optimization
problem
min
a
pA ∗ a + pB ∗ m(a), (A.12)
where the objective function is strictly convex. Hence, the optimization problem admits a unique
solution a∗ which satisfies the first-order condition:
pA + pB ∗ m0
(a∗
) = 0.
43We then have:
−m0
(a∗
) =
Fx
Fy (x,y)=(yA+a∗,yB+b∗)
=
pA
pB
.
Proof of Proposition 2. We follow the proof strategy of Zermelo’s theorem. To establish existence,
we identify a strategy profile through backward induction; if multiple equilibria are never encoun-
tered in the process of backward induction, then the identified strategy profile must be the unique
subgame perfect equilibrium.
We start from the last period t = 2. At sub-period 3 of period 2, the arguments in Section 4.1
show that the optimal gas fees that liquidity providers attach to their exit orders are zero. This is
the unique optimal action for all liquidity providers, because submitting a positive gas fee would
only decrease their total consumption good after exiting.
If there exists an arbitrage opportunity at sub-period 3 of period 2, then by Lemma 1, the
optimal trading order is unique. By Assumption 3, the arbitrageur pays a gas fee equal to the
profit from the optimal order. Hence, in the last period the arbitrageur must choose the optimal
trade order specified in Lemma 1; if instead, the arbitrageur chooses a different order, it ends up
with a negative profit in the last period, which is sub-optimal. At sub-period 2, by Lemma 2, if an
investor arrives, then it chooses the unique optimal trading order.
At sub-period 1 of period 2, each liquidity provider maximizes its one-period payoff. Liquidity
provider i holds an amount e
(1)
i of consumption good that he can use to construct his optimal
portfolio (w
(2)
i y
(2,1)
A ,w
(2)
i y
(2,1)
B ,c
(2,1)
i ,x
(2,1)
Ai
,x
(2,1)
Bi
). He assigns zero weight to the consumption good
and B tokens, i.e., x
(2,1)
Bi
= c
(2,1)
i = 0, because they both yield expected returns lower than A
tokens. Hence, liquidity providers only allocate their consumption good to A tokens or deposit in
the AMM. Since the AMM requires tokens to be deposited at the current fair value exchange rate,
i.e., Fx
Fy
(x,y)=(y
(2,1)
A ,y
(2,1)
B )
=
p
(2,1)
A
p
(2,1)
B
=
p
(1,2)
A
p
(1,2)
B
, the ratio of the A and B tokens deposited,
y
(2,1)
B
y
(2,1)
A
, is already
pinned down by the fair value exchange rate at subperiod 2 of period 1,
p
(1,2)
A
p
(1,2)
B
. Hence, the liquidity
provider only chooses the amount of A tokens to deposit. Suppose liquidity provider i deposits an
amount w
(2)
i y
(2,1)
A > 0 and w
(2)
i y
(2,1)
B > 0 of A and B tokens, respectively, and invests the rest of
the consumption good on A tokens. The expected payoff of liquidity provider i is then:
w
(2)
i E(2,1)

p
(2,3)
A y
(2,3)
A + p
(2,3)
B y
(2,3)
B

+ E(2,1)

p
(2,2)
A
p
(2,1)
A

e
(1)
i − w
(2)
i (p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B )

, (A.13)
44where E(t,s)[X] denotes the expectation of the random variable X conditional on information avail-
able at the end of sub-period s of period t.
In the above expression, the first term is the expected payoff from depositing in the AMM,
and the second term is the expected payoff from investing in A tokens. We may rewrite (A.13) as
follows:
w
(2)
i (p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B )E(2,1)

1+R
(2)
D

+(e
(1)
i −w
(2)
i (p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B ))E(2,1)

1+R
(2)
A

where w
(2)
i (p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B ) is the amount of consumption good used to exchange for tokens
deposited in the AMM, (e
(1)
i − w
(2)
i (p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B )) is the amount of consumption good
invested in A tokens, the one-period expected return from deposits made in subperiod 1 of period
2 is:
E(2,1)

R
(2)
D

:=
y
(2,1)
A
(p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B )
E(2,1)

p
(2,3)
A
y
(2,3)
A
y
(2,1)
A
+ p
(2,3)
B
y
(2,3)
B
y
(2,1)
A

− 1,
and the one-period expected return from investing in A tokens is:
E(2,1)

R
(2)
A

:=E(2,1)

p
(2,2)
A
p
(2,1)
A

− 1.
Conditional on the information at sub-period 1 of period 2,
y
(2,1)
B
y
(2,1)
A
is independent of the deposit
y
(2,1)
A and of w
(2)
i . This is because the AMM requires tokens to be deposited at the current exchange
rate, i.e., Fx
Fy
(x,y)=(y
(2,1)
A ,y
(2,1)
B )
=
p
(2,1)
A
p
(2,1)
B
=
p
(1,2)
A
p
(1,2)
B
, and this pins down the ratio of the A and B tokens
deposited. At sub-period 2, we have y
(2,2)
A = y
(2,1)
A ,and thus
y
(2,2)
A
y
(2,1)
A
= 1 if the investor does not
arrive; y
(2,2)
A = y
(2,1)
A − ∆Q
(2,2)∗
A ,
y
(2,2)
A
y
(2,1)
A
= 1 −
∆Q
(2,2)∗
A
y
(2,1)
A
if a “type A ” investor arrives; y
(2,2)
A =
y
(2,1)
A − (1 + f)∆Q
(2,2)∗
A ,
y
(2,2)
A
y
(2,1)
A
= 1 −
(1+f)∆Q
(2,2)∗
A
y
(2,1)
A
if a “type B ” investor arrives. As we know
from Lemma A.2 that ∆Q
(2,2)∗
A is proportional to y
(2,1)
A , the random variable
y
(2,2)
A
y
(2,1)
A
neither depends
on w
(2)
i nor on y
(2,1)
A . Using symmetric arguments, we obtain that
y
(2,2)
B
y
(2,1)
B
is independent of w
(2)
i
and y
(2,1)
A . Since we have also shown that
y
(2,1)
B
y
(2,1)
A
is independent of w
(2)
i ,y
(2,1)
A , we conclude that
y
(2,2)
B
y
(2,1)
A
=
y
(2,1)
B
y
(2,1)
A
y
(2,2)
B
y
(2,1)
B
is independent of w
(2)
i and ,y
(2,1)
A .
Using Lemma A.1 and the same arguments above, we deduce that
y
(2,3)
A
y
(2,2)
A
and
y
(2,3)
B
y
(2,2)
A
are inde-
pendent of w
(2)
i and y
(2,1)
A . As a result,
y
(2,3)
A
y
(2,1)
A
=
y
(2,3)
A
y
(2,2)
A
y
(2,2)
A
y
(2,1)
A
, and
y
(2,3)
B
y
(2,1)
B
=
y
(2,3)
B
y
(2,2)
B
y
(2,2)
B
y
(2,1)
B
are random
45variables, which are independent of w
(2)
i and y
(2,1)
A . Therefore, the expected return from de-
posits E(2,1)

R
(2)
D

does not depend on the amount of tokens deposited by liquidity provider i,
w
(2)
i y
(2,1)
A , and only depends on token prices at the end of sub-period 2 of period 1, p
(1,2)
A , and
p
(1,2)
B . Moreover, E(2,1)

R
(2)
A

= ((1 − θ)κ1 + θκcom)β is a constant. Hence, the expected returns
E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

are measurable with respect to the random state ω(1,2). Hence, conditional
on ω(1,2), E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

are known to liquidity providers. Hence, the liquidity providers’
portfolio choice at sub-period 1 of period 2 can also be contingent on these values.
If E(2,1)

R
(2)
D

> E(2,1)

R
(2)
A

, then the unique optimal action of the liquidity providers is to use
all their consumption good to purchase A and B tokens, in the ratio required by the AMM, and
deposit them. If instead E(2,1)

R
(2)
D

< E(2,1)

R
(2)
A

, the unique optimal action of liquidity providers
is to use all their consumption good to purchase A tokens and hold them without depositing. If
E(2,1)

R
(2)
D

= E(2,1)

R
(2)
A

, then the liquidity providers are indifferent between depositing in the
AMMs or holding A tokens only. By our tie-breaking rule given in Assumption 2, the unique
optimal action of the arbitrageur is then to exchange all their consumption good to A tokens, and
hold them without depositing.
We now consider period 1. We first show that the optimal gas fees that liquidity providers attach
to their exit orders are zero. Accounting for liquidity provider i’s optimal action in period 2, the
submitted gas fee does not affect the ratio
e
(2)
i
e
(1)
i
, which is determined by the fair value exchange rate
in the state ω(1,2). That is, E(1,2)

e
(2)
i
e
(1)
i
|g
(1)
(lp,i)

= E(1,2)

e
(2)
i
e
(1)
i

. Submitting a nonzero gas fee g
(1)
(lp,i) > 0,
would only decrease the amount of consumption good available after period 1 to liquidity provider
i, e
(1)
i (g
(1)
(lp,i)), and thus decrease his expected payoff E(1,2)

e
(2)
i |g
(1)
(lp,i)

= e
(1)
i (g
(1)
(lp,i))E(1,2)

e
(2)
i
e
(1)
i

.
By Lemma 1, if there exists an arbitrage opportunity at sub-period 3 of period 1, the optimal
trading order is unique. By the optimality of arbitrageur’s action in period 2, its expected profit
from the arbitrage order net of the gas fee paid in period 2 is zero. Hence, in period 1, to maximize
its expected cumulative payoff
P2
t=0 E(1,2)

p
(t,2)
B ∆q
(t,3)
B +p
(t,2)
A ∆q
(t,3)
A −g
(t,3)
arb

, the arbitrageur has to
maximize its one-period payoff in period 1. By Assumption 3, the arbitrageur pays a gas fee equal
to the profit from the optimal order. Consequently, the arbitrageur must choose the optimal trade
order in period 1, otherwise it ends up with a negative profit in such period, which is sub-optimal.
At sub-period 2 of period 1, by Lemma 2, if an investor arrives, then it has to choose the unique
trading order to maximize its surplus.
At sub-period 1, accounting for the optimal actions subsequently taken from all agents, liquidity
46provider i has to choose his portfolio for period 1, (w
(1)
i y
(1,1)
A ,w
(1)
i y
(1,1)
B ,c
(1,1)
i ,x
(1,1)
Ai
,x
(1,1)
Bi
), so to
maximize his expected payoff. Each liquidity provider i chooses c
(1,1)
i = 0, as holding the con-
sumption good is strictly dominated by holding either A or B tokens. Suppose liquidity provider
i chooses the portfolio (w
(1)
i y
(1,1)
A ,w
(1)
i y
(1,1)
B ,0,x
(1,1)
Ai
,x
(1,1)
Bi
). By the law of total expectation, his
expected payoff can then be written as:
E(1,1)

e
(2)
i

=e
(0)
i E(1,1)

e
(2)
i
e
(1)
i
e
(1)
i
e
(0)
i

=e
(0)
i
X
ω(1,2)∈Ω
P(1,1)(ω(1,2)
)E
"
e
(2)
i
e
(1)
i
ω(1,2)
#
e
(1)
i
e
(0)
i
(ω(1,2)
)
=e
(0)
i
X
ω(1,2)∈Ω
P(1,1)(ω(1,2)
)E
"
e
(2)
i
e
(1)
i
ω(1,2)
#
w
(1)
i (p
(1,1)
A y
(1,1)
A + p
(1,1)
B y
(1,1)
B )
e
(0)
i
∗ (R
(1)
D (ω(1,2)
) + 1)
+
p
(1,1)
A x
(1,1)
Ai
e
(0)
i
(R
(1)
A (ω(1,2)
) + 1) +
p
(1,1)
B x
(1,1)
Bi
e
(0)
i
(R
(1)
B (ω(1,2)
) + 1)

, (A.14)
where ω(1,2) ∈ Ω is the state at sub-period 2 of period 1. E

e
(2)
i
e
(1)
i
ω(1,2)

is then pinned down
by the price ratio,
p
(1,2)
A
p
(1,2)
B
, and thus by the state ω(1,2) ∈ Ω.
w
(1)
i (p
(1,1)
A y
(1,1)
A +p
(1,1)
B y
(1,1)
B )
e
(0)
i
,
p
(1,1)
A x
(1,1)
Ai
e
(0)
i
,
and
p
(1,1)
B x
(1,1)
Bi
e
(0)
i
are the portfolio weights for the deposit, A tokens, and B tokens respectively. The
one-period return from deposit in period 1 is:
R
(1)
D (ω(1,2)
) =:
y
(1,1)
A
(p
(1,1)
A y
(1,1)
A + p
(1,1)
B y
(1,1)
B )
p
(1,3)
A
y
(1,3)
A
y
(1,1)
A
+ p
(1,3)
B
y
(1,3)
B
y
(1,1)
A
!
− 1,
The one-period return from holding A tokens and B tokens in period 1 are:
R
(1)
A (ω(1,2)
) =
p
(1,2)
A
p
(1,1)
A
− 1,R
(1)
B (ω(1,2)
) =
p
(1,2)
B
p
(1,1)
B
− 1.
The only randomness in period 1 is due to the events occurring at sub-period 2 of period 1. All
returns are measurable respect to the random state ω(1,2), and thus they are all uniquely determined
for each realization of ω(1,2).
Accounting for the optimal actions subsequently taken by agents, the expected return of de-
47positing, investing in A tokens, and investing in B tokens in period 1 are:
E(1,1)

VD

=
X
ω(1,2)∈Ω
P(1,1)(ω(1,2)
)E
"
e
(2)
i
e
(1)
i
ω(1,2)
#
R
(1)
D (ω(1,2)
), (A.15)
E(1,1)

VA

=
X
ω(1,2)∈Ω
P(1,1)(ω(1,2)
)E
"
e
(2)
i
e
(1)
i
ω(1,2)
#
R
(1)
A (ω(1,2)
), (A.16)
E(1,1)

VB

=
X
ω(1,2)∈Ω
P(1,1)(ω(1,2)
)E
"
e
(2)
i
e
(1)
i
ω(1,2)
#
R
(1)
B (ω(1,2)
). (A.17)
If E(1,1)

VD

> max

E(1,1)

VA

,E(1,1)

VB

, then liquidity provider i,i ∈ N, exchanges all
its consumption good for A and B tokens in the ratio required by the AMM and deposits them.
If E(1,1)

VD

≤ max

E(1,1)

VA

,E(1,1)

VB

, then liquidity provider i,i ∈ N, does not deposit,
and has to decide between holding A or B tokens. If E(1,1)

VA

> E(1,1)

VB

, then he exchanges all
its consumption good for A tokens and hold them. If E(1,1)

VA

< E(1,1)

VB

, then he exchanges
all its consumption good for B tokens and hold them. if E(1,1)

VA

= E(1,1)

VB

, then any portfolio
consisting of a mix of A and B tokens is optimal.
Therefore, we can identify each player’s optimal action at every sub-period of the backward
induction algorithm. Hence, the strategy profile constructed through this process is a subgame
perfect equilibrium of the game. Also, this equilibrium is unique if E(1,1)

VA

6= E(1,1)

VB

or
E(1,1)

VD

> max

E(1,1)

VA

,E(1,1)

VB

.
Proof of Proposition 3. As shown in the proof of Proposition 2, a liquidity provider will deposit
in period 2 if and only if E(2,1)

R
(2)
D

> E(2,1)

R
(2)
A

. The expected one-period return of holding
A tokens is E(2,1)

R
(2)
A

= (1 − θ)κ1β + θκcomβ. It remains to calculate the expected one-period
return of depositing, given by E(2,1)

R
(2)
D

.
We next analyze the events that may occur at sub-period 2 of period 2. With probability κI
2 ,
a “ type A” investor arrives to the AMM, and with probability κI
2 , a “ type B” investor arrives.
With probability θ, the prices of two tokens co-move, and there is no arbitrage opportunity. With
probability (1 − θ)κ1(1 − κ2), the price of an A token increases and the price of a B token stays
unchanged, which leads to an arbitrage opportunity for the arbitrageur. Similarly, with probability
(1 − θ)κ2(1 − κ1), the price of a B token increases and the price of an A token stays unchanged,
48which again leads to an arbitrage opportunity.
The return from deposits conditional on the occurrence of a common shock. If the
prices of A and B tokens co-move, the exchange rate stays unchanged, so there is no arbitrage
opportunity. Thus, the return from deposits is β if the common shock occurs, and 0 if the common
shock does not occur.
The return from deposits conditional on the occurrence of an idiosyncratic shock. If
both A and B tokens are hit by an idiosyncratic shock, their prices co-move, and the return from
deposits is β. If both A and B tokens are not hit by an idiosyncratic shock, the return is 0.
If only the A token is hit by an idiosyncratic shock, there exists an arbitrage opportunity. In
this case, the return from deposits is
R
(2)
arbA
:= β
p
(2,1)
A y
(2,1)
A
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
−
π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1 + β)p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
, (A.18)
where the first term is the return from B token’s appreciation, and the second term is the arbitrage
ratio, i.e., the token value loss divided by the initial value of deposit. Alternatively, if only B token
is hit by an idiosyncratic shock, then there exists an arbitrage opportunity. In this case, the return
of deposit is then:
R
(2)
arbB
:= β
p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
−
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
. (A.19)
We know from Lemma 1 that
∂π(y
(2,1)
A ,y
(2,1)
B ,(1+β)p
(1,2)
B ,p
(1,2)
A )
∂β = p
(2,1)
B ∆q
(2,3)∗
B > 0,
∂∆q
(2,3)∗
B
∂β > 0.
This implies that
π(y
(2,1)
A ,y
(2,1)
B ,(1+β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
increases in β. Moreover, for any β > M > f, we have
∂π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
∂β
= p
(2,1)
B ∆q
(2,3)∗
B (y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
≥ p
(2,1)
B ∆q
(2,3)∗
B (y
(2,1)
A ,y
(2,1)
B ,(1 + M)p
(1,2)
B ,p
(1,2)
A ) > 0,
49where we have used that
∆q
(2,3)∗
B
∂β > 0. Applying the above inequality, we then have:
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A ) =
Z β
f
∂π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
∂β
≥
Z β
M
∂π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
∂β
≥ (β − M)∆q
(2,3)∗
B (y
(2,1)
A ,y
(2,1)
B ,(1 + M)p
(1,2)
B ,p
(1,2)
A ).
As a result,
π(y
(2,1)
A ,y
(2,1)
B ,(1+β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
converges to ∞ when β → ∞. Following the same procedure,
we can also show that
π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1+β)p
(1,2)
A )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
increases in β and converges to ∞ when β → ∞.
The return from deposits conditional on the investor’s arrival. We only consider the case
where a “type A” investor arrives to the AMM. The case where a “type B” investor arrives can
be obtained following the same procedure. By Lemma 2, the investor chooses its optimal trading
sizes, ∆Q
(2,2)∗
A ,∆Q
(2,2)∗
B . If the trading sizes are nonzero, then after the investor trades, the spot
rate at which A tokens are exchanged for B tokens is higher than the fair value exchange rate:
Fx
Fy (x,y)=(y
(2,2)
A ,y
(2,2)
B )
>
(1 + α)p
(2,1)
A
(1 + f)p
(2,1)
B
>
p
(2,1)
A
p
(2,1)
B
=
p
(2,2)
A
p
(2,2)
B
.
If 1
1+f
Fx
Fy
(x,y)=(y
(2,2)
A ,y
(2,2)
B )
<
p
(2,1)
A
p
(2,1)
B
, then there is no arbitrage opportunity after the investor
trades. This is because for the arbitrageur, the marginal benefit of trading is lower than the
trading cost. The return from the deposit in this case is
p
(2,3)
A y
(2,3)
A + p
(2,3)
B y
(2,3)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
− 1 =
p
(2,1)
A (y
(2,1)
A − ∆Q
(2,2)∗
A ) + p
(2,1)
B (y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
− 1
= −
p
(2,1)
A ∆Q
(2,2)∗
A + p
(2,1)
B (1 + f)∆Q
(2,2)∗
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
=
R0
∆Q
(2,2)∗
B
p
(2,1)
A (g(2,2)(x))0 + p
(2,1)
B (1 + f)dx
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
> 0. (A.20)
We next show that the above expression increases in α. The integrand p
(2,1)
A (g(2,2)(x)0) +
p
(2,1)
B ((1 + f)) > 0 for any x < 0 as the marginal exchange rate −g(2,2)(x)0 <
p
(2,1)
B
p
(2,1)
A
. This implies
that the expression in (A.20) increases in |∆Q
(2,2)∗
B |. The integrand is invariant to α, and |∆Q
(2,2)∗
B |
increases in α by Lemma 2. Therefore, the return from deposits given in (A.20) increases in α.
50If 1
1+f
Fx
Fy
(x,y)=(y
(2,2)
A ,y
(2,2)
B )
>
p
(2,1)
A
p
(2,1)
B
, then there exists an arbitrage opportunity because the
marginal benefit of trading is larger than the marginal cost. The arbitrageur chooses the trad-
ing sizes ∆q
(2,3)∗
A ,∆q
(2,3)∗
B such that the marginal benefit breaks even with the marginal cost:
1
1 + f
Fx
Fy (x,y)=(y
(2,2)
A −∆q
(2,3)∗
A ,y
(2,2)
B −∆q
(2,3)∗
B )
=
p
(2,1)
A
p
(2,1)
B
, (A.21)
where ∆q
(2,3)∗
A ,∆q
(2,3)∗
B satisfies the constraint, F(y
(2,2)
A −∆q
(2,3)∗
A ,y
(2,2)
B −∆q
(2,3)∗
B ) = F(y
(2,2)
A ,y
(2,2)
B ),
and (A.21) pins down the ratio of A to B tokens,
y
(2,2)
A −∆q
(2,3)∗
A
y
(2,2)
B −∆q
(2,3)∗
B
.
We next analyze the sensitivity of the function F(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B ) to α:
dF(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B )
dα
=
dF(y
(2,2)
A ,y
(2,2)
B )
dα
=
dF(y
(2,1)
A − ∆Q
(2,2)∗
A ,y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B )
dα
= −Fx
d∆Q
(2,2)∗
A
dα
− (1 + f)Fy
d∆Q
(2,2)∗
B
dα
= −fFy
d∆Q
(2,2)∗
B
dα
> 0,
where the last inequality follows from Lemma 2, and we have also used the condition −Fx
d∆Q
(2,2)∗
A
dα −
Fy
d∆Q
(2,2)∗
B
dα = 0 which is achieved by differentiating the equation F(y
(2,1)
A − ∆Q
(2,2)∗
A ,y
(2,1)
B −
∆Q
(2,2)∗
B ) = F(y
(2,1)
A ,y
(2,1)
B ) on both sides with respect to α.
Hence, we have shown that F(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B ) is increasing in α. Thus, by
the third property of F stated in Assumption 1 and the fact that the ratio of A and B tokens,
y
(2,2)
A −∆q
(2,3)∗
A
y
(2,2)
B −∆q
(2,3)∗
B
is already determined, we know that both y
(2,2)
A − ∆q
(2,3)∗
A and y
(2,2)
B − ∆q
(2,3)∗
B are
increasing in α.
We then show that −q
(2,3)∗
A increases in α. The quantity −q
(2,3)∗
A is pinned down by (A.21) and
the constraint F(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B ) = F(y
(2,2)
A ,y
(2,2)
B ). Differentiating (A.21) with
respect to α, we have:
1
1 + f
Fxx
dy
(2,2)
A
dα
+
d(−∆q
(2,3)∗)
A
dα
!
+
1
1 + f
Fxy
dy
(2,2)
B
dα
+
d(−∆q
(2,3)∗)
B
dα
!
−
p
(2,1)
A
p
(2,1)
B
Fyy
dy
(2,2)
B
dα
+
d(−∆q
(2,3)∗)
B
dα
!
− Fxy
dy
(2,2)
A
dα
+
d(−∆q
(2,3)∗)
A
dα
!!
= 0.
51Recall that y
(2,2)
A = (y
(2,1)
A − ∆Q
(2,2)∗
A ), y
(2,2)
B = y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B . We can then rewrite the
equation above as
1
1 + f
Fxx −
p
(2,1)
A
p
(2,1)
B
Fxy
!
d(y
(2,1)
A − ∆Q
(2,2)∗
A )
dα
+
1
1 + f
Fxy −
p
(2,1)
A
p
(2,1)
B
Fyy
!
d(y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B )
dα
+
1
1 + f
Fxx −
p
(2,1)
A
p
(2,1)
B
Fxy
!
d(−∆q
(2,3)∗
A )
dα
+
1
1 + f
Fxy −
p
(2,1)
A
p
(2,1)
B
Fyy
!
d(−∆q
(2,3)∗
B )
d(−∆q
(2,3)∗
A )
d(−∆q
(2,3)∗
A )
dα
= 0.
By Assumption 1, Fxx < 0,Fxy > 0,Fyy < 0; by Lemma 2, we have
d(y
(2,1)
A −∆Q
(2,2)∗
A )
dα > 0, and
d(y
(2,1)
B −(1+f)∆Q
(2,2)∗
B )
dα < 0. By the constraint F(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B ) = F(y
(2,2)
A ,y
(2,2)
B ),
we have
d(−∆q
(2,3)∗
B )
d(−∆q
(2,3)∗
A )
< 0. Combining those conditions, we conclude that
d(−∆q
(2,3)∗
A )
dα > 0.
For the case where arbitrage occurs after the investor trades, the return from deposits is:
p
(2,3)
A y
(2,3)
A + p
(2,3)
B y
(2,3)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
− 1
=
p
(2,1)
A (y
(2,1)
A − ∆Q
(2,2)∗
A − (1 + f)∆q
(2,3)∗
A ) + p
(2,1)
B (y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B − ∆q
(2,3)∗
B )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
− 1
=
p
(2,1)
A (y
(2,1)
A − ∆Q
(2,2)∗
A − ∆q
(2,3)∗
A ) + p
(2,1)
B (y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B − ∆q
(2,3)∗
B )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
+
p
(2,1)
A (−f∆q
(2,3)∗
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
− 1, (A.22)
where the first equality follows from the conditions y
(2,3)
A = y
(2,1)
A − ∆Q
(2,2)∗
A − (1 + f)∆q
(2,3)∗
A and
y
(2,3)
B = y
(2,1)
B − ∆Q
(2,2)∗
B − (1 + f)∆q
(2,3)∗
B . Those two conditions reflects the fact that the deposit
in the AMM is only altered by the investor’s trade and the arbitrageur’s trade. Recall we have
shown that both the first and the second term of (A.22) is increasing in α, and thus the return
from deposits when the investor arrives is increasing in α.
We next show that the first term in (A.22), given by
p
(2,1)
A (y
(2,2)
A −∆q
(2,3)∗
A )+p
(2,1)
B (y
(2,2)
B −∆q
(2,3)∗
B )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
=
p
(2,1)
A (y
(2,1)
A −∆Q
(2,2)∗
A −∆q
(2,3)∗
A )+p
(2,1)
B (y
(2,1)
B −(1+f)∆Q
(2,2)∗
B −∆q
(2,3)∗
B )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
, is greater than 1. Since the AMM re-
quires the liquidity providers to deposit at the fair value exchange rate, the condition Fx
Fy
(x,y)=(y
(2,1)
A ,y
(2,1)
B )
=
p
(2,1)
A
p
(2,1)
B
must hold. We also have Fx
Fy
(x,y)=(y
(2,2)
A −∆q
(2,3)∗
A ,y
(2,2)
B −∆q
(2,3)∗
B )
6=
p
(2,1)
A
p
(2,1)
B
by (A.21). Moreover, we
52have the following inequality:
F(y
(2,2)
A − ∆q
(2,3)∗
A ,y
(2,2)
B − ∆q
(2,3)∗
B ) = F(y
(2,2)
A ,y
(2,2)
B ) = F(y
(2,1)
A − ∆Q
(2,2)∗
A ,y
(2,1)
B − (1 + f)∆Q
(2,2)∗
B )
> F(y
(2,1)
A − ∆Q
(2,2)∗
A ,y
(2,1)
B − ∆Q
(2,2)∗
B )
= F(y
(2,1)
A ,y
(2,1)
B ),
where the inequality follows from Fy > 0 and ∆Q
(2,2)∗
B < 0,. The equalities hold because the value
of the pricing function, without accounting for the fee, must stay unchanged for each transaction.
The above result suggests that the value of pricing function increases after the investors and traders
trade.
By Assumption 1, we can write F(y
(2,2)
A −∆q
(2,3)∗
A ,y
(2,2)
B −∆q
(2,3)∗
B ) as clF(
y
(2,2)
A −∆q
(2,3)∗
A
c ,
y
(2,2)
B −∆q
(2,3)∗
B
c )
where c > 1,l > 0,F(
y
(2,2)
A −∆q
(2,3)∗
A
c ,
y
(2,2)
B −∆q
(2,3)∗
B
c ) = F(y
(2,1)
A ,y
(2,1)
B ). It follows from Lemma A.3
that
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B ≤ p
(2,1)
A
y
(2,2)
A − ∆q
(2,3)∗
A
c
!
+ p
(2,1)
B
y
(2,2)
B − ∆q
(2,3)∗
B
c
!
< p
(2,1)
A (y
(2,2)
A − ∆q
(2,3)∗
A ) + p
(2,1)
B (y
(2,2)
B − ∆q
(2,3)∗
B ),
which means that the first term in (A.22) is greater than 1. Moreover, since ∆q
(2,3)∗
A < 0, we know
that the second term,
p
(2,1)
A (−f∆q
(2,3)∗
A )
p
(2,1)
A y
(2,1)
A +p
(2,1)
B y
(2,1)
B
, is positive. It then follows that the return from deposits
stated in (A.22) is positive.
We denote the return from deposit when “type A ” investors and “ type B ” investors arrive
as R
(2)
invA
and R
(2)
invB
respectively. Using similar arguments as above, we can conclude that they are
both increasing in α. By Lemma A.2, they are independent of the amount of deposits and only
depend of the token price ratio at the start of the period,
p
(2,1)
A
p
(2,1)
B
=
p
(1,2)
A
p
(1,2)
B
.
Liquidity freeze threshold. We compare the expectation of the one-period return from de-
positing at period 2, E(2,1)

R
(2)
D

, with the expectation of the one-period return from holding A
53tokens at period 2, E(2,1)

R
(2)
A

. By the law of total expectation, we have the following expressions:
E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

=
κI
2
R
(2)
invA
+
κI
2
R
(2)
invB
+ (1 − θ)

κ1(1 − κ2)R
(2)
arbA
+ κ2(1 − κ1)R
(2)
arbB
+ κ1κ2β

+θκcomβ − ((1 − θ)κ1 + θκcom)β
=
κI
2
R
(2)
invA
+
κI
2
R
(2)
invB
− (1 − θ)

κ1(1 − κ2)
π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1 + β)p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
+κ2(1 − κ1)
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B

− (1 − θ)(κ1 − κ2)β
p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
,
(A.23)
where, in the last expression, we have used the expressions of R
(2)
arbA
and R
(2)
arbB
given, respectively
in equations (A.18) and (A.19). The first two terms in the last expression of Eq. (A.23) are the
expected returns from the fee revenue, the third term is the expected token value loss due to
arbitrage, and the last term is the opportunity cost of holding B tokens. The first two terms are
non-negative, and the remaining terms are non-positive. All of them are independent of the amount
of deposits and pinned down by the token price ratio at the start of the period,
p
(2,1)
A
p
(2,1)
B
=
p
(1,2)
A
p
(1,2)
B
. If
(A.23) is positive, then the liquidity providers deposit their tokens.
If κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
= 0, then (A.23) is non-positive, so there exists liquidity freeze for any
β ≥ 0.
Next, consider the case κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
> 0. If θ = 1, that is, the token prices always
co-move, then there does not exist a liquidity freeze for any β ∈ [0,∞). This is because (A.23) is
positive. If θ < 1, then (A.23) is positive when β → 0, and negative when β → ∞. Since the first
two terms are independent of β, while the last three terms decrease in β, the last expression in
(A.23) is monotonically decreasing in β. It is also continuous in β because all terms are differentiable
respect to β. Therefore, there exists a threshold βfrz such that (A.23) is nonpositive if and only if
β > βfrz. Since (A.23) is pinned down by the ratio
p
(1,2)
A
p
(1,2)
B
, so is the threshold βfrz.
Therefore, there exists a critical threshold βfrz

p
(1,2)
A
p
(1,2)
B

, where βfrz : R → R ∪ {+∞} is a
function of the fair token exchange rate at the start of period 2, such that a “liquidity freeze”
occurs in period 2 if and only if β ≥ βfrz

p
(1,2)
A
p
(1,2)
B

.
There exist three possible realizations of
p
(1,2)
A
p
(1,2)
B
in period 2. These are
p
(0)
A
p
(0)
B
,
(1+β)p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B
,
54where p
(0)
A ,p
(0)
B are the token price at the initial state ω(0). A “liquidity freeze” occurs surely in
period 2 if and only if
β ≥ βfrz := max
(
βfrz
p
(0)
A
p
(0)
B
!
,βfrz
(1 + β)p
(0)
A
p
(0)
B
!
,βfrz
p
(0)
A
(1 + β)p
(0)
B
!)
.
We then show that “Liquidity freeze” occurs in period 1 if β ≥ βfrz. If β ≥ βfrz, then “Liquidity
freeze” occurs surely in period 2, and E

e
(2)
i
e
(1)
i
ω(1,2)

= E
h
1 + R
(2)
A
i
= 1 + ((1 − θ)κ1 + θκcom)β for
any ω(1,2) ∈ Ω. Plugging these expressions into (A.15) and (A.16), we obtain
E(1,1)

VD

= E(1,1)

R
(1)
D

1 + E
h
R
(2)
A
i
= E(2,1)

R
(2)
D
p
(1,2)
A
p
(1,2)
B
=
p
(0)
A
p
(0)
B

1 + E
h
R
(2)
A
i
,
where E(1,1)

R
(1)
D

= E(2,1)

R
(2)
D
p
(1,2)
A
p
(1,2)
B
=
p
(0)
A
p
(0)
B

because if the initial fair value exchange rate,
p
(0)
A
p
(0)
B
is the same as the fair value exchange rate at sub-period 2 of period 1,
p
(1,2)
A
p
(1,2)
B
, then the expected
one-period return of depositing is the same for both periods.
E(1,1)

VA

= E
h
R
(1)
A
i
(1 + E
h
R
(2)
A
i
) = E
h
R
(2)
A
i
(1 + E
h
R
(2)
A
i
).
Since β ≥ βfrz ≥ βfrz

p
(0)
A
p
(0)
B

, we have E
h
R
(2)
A
i
≥ E(2,1)

R
(2)
D
p
(1,2)
A
p
(1,2)
B
=
p
(0)
A
p
(0)
B

. This means that
E(1,1)

VD

≤ E(1,1)

VA

, i.e., “Liquidity freeze” also occurs in period 1. Therefore, “Liquidity
freeze” occurs surely in both period 1 and 2 if and only if β ≥ βfrz.
Comparative Statics. We show that for any arbitrary
p
(1,2)
A
p
(1,2)
B
, βfrz

p
(1,2)
A
p
(1,2)
B

increases in α,κI,θ,κ2,
and decreases in κ1.
For the case κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
= 0, βfrz

p
(1,2)
A
p
(1,2)
B

= 0, which is invariant of all the parameters
locally. For the case κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
> 0 and θ = 1, βfrz

p
(1,2)
A
p
(1,2)
B

= +∞, which is also invariant
of all other parameters except θ locally.
We then consider the case κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
> 0 and θ < 1. βfrz

p
(1,2)
A
p
(1,2)
B

is defined by the
equation: E(2,1)

R
(2)
D − R
(2)
A

= 0. Using the relation (A.23), we take the partial derivative of
55E(2,1)

R
(2)
D − R
(2)
A

with respect to α,κI,θ, and obtain
∂E(2,1)

R
(2)
D − R
(2)
A

∂α
=
κI
2
∂R
(2)
invA
∂α
+
∂R
(2)
invB
∂α
!
> 0, (A.24)
∂E(2,1)

R
(2)
D − R
(2)
A

∂κI
=
1
2
R
(2)
invA
+
1
2
R
(2)
invB
> 0, (A.25)
∂E(2,1)

R
(2)
D − R
(2)
A

∂θ
= −

κ1(1 − κ2)
π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1 + β)p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
+ κ2(1 − κ1)
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A p
(2,1)
B y
(2,1)
B
+ (κ1 − κ2)β
p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B

> 0. (A.26)
Recall that
∂π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1+β)p
(1,2)
A )
∂β > 0,
∂π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1+β)p
(1,2)
A )
∂β > 0 from Lemma 1, so we
have
∂E(2,1)

R
(2)
D − R
(2)
A

∂β
= −
(1 − θ)
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B

κ1(1 − κ2)
∂π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1 + β)p
(1,2)
A )
∂β
+κ2(1 − κ1)
∂π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
∂β
+ (κ1 − κ2)(p
(2,1)
B y
(2,1)
B )

< 0.
Thus, applying the Implicit Function Theorem to the curve E(2,1)

R
(2)
D − R
(2)
A

= 0, we deduce
∂βfrz
p
(1,2)
A
p
(1,2)
B
!
∂α > 0,
∂βfrz
p
(1,2)
A
p
(1,2)
B
!
∂κI
> 0,
∂βfrz
p
(1,2)
A
p
(1,2)
B
!
∂θ > 0.
We then consider the partial derivative of E(2,1)

R
(2)
D − R
(2)
A

with respect to κ1 and κ2.
∂E(2,1)

R
(2)
D − R
(2)
A

∂κ1
= −(1 − θ)

(1 − κ2)
π(y
(2,1)
A ,y
(2,1)
B ,p
(1,2)
B ,(1 + β)p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
−κ2
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
+ β
p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B

< 0,
(A.27)
where we have used the inequality 0 ≤ π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A ) ≤ (β − f)p
(2,1)
B y
(2,1)
B . This
56inequality can be seen as follows:
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A ) = p
(2,1)
A (1 + f)∆q
(2,3)∗
A + p
(2,1)
B (1 + β)∆q
(2,3)∗
B
≤ −p
(2,1)
A (1 + f)
p
(2,1)
B
p
(2,1)
A
∆q
(2,3)∗
B + p
(2,1)
B (1 + β)∆q
(2,3)∗
B
= (β − f)p
(2,1)
B ∆q
(2,3)∗
B
< (β − f)p
(2,1)
B y
(2,1)
B .
In the above expressions, the first inequality holds since the marginal exchange rate from an A
token to a B token is smaller than the spot exchange rate
p
(1,2)
A
p
(1,2)
B
, so the marginal cost for each
extra B token acquired is larger than (1+f)p
(2,1)
B for the arbitrageur. The second inequality holds
because the amount of B tokens the arbitrageur can withdraw from the AMM is smaller than the
total amount of B tokens deposited in the AMM.
It follows from a similar calculation that
∂E(2,1)

R
(2)
D −R
(2)
A


∂κ2
> 0. By the Implicit Function
Theorem, we have
∂βfrz
p
(1,2)
A
p
(1,2)
B
!
∂κ1
< 0,
∂βfrz
p
(1,2)
A
p
(1,2)
B
!
∂κ2
> 0.
As βfrz = max

βfrz

p
(1,2)
A
p
(1,2)
B

,βfrz

(1+β)p
(0)
A
p
(0)
B

,βfrz

p
(0)
A
(1+β)p
(0)
B

, we deduce that βfrz also
increases in α,κI,θ,κ2, and decreases in κ1.
Lemma A.4. The “impermanent loss” increases in the difference between initial fair value ex-
change rate and the fair value exchange rate at the end of investment horizon, i.e.,
∂IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B
!
∂β >
0, and
∂IL
p
(0)
A
p
(0)
B
,
(1+β)p
(0)
A
p
(0)
B
!
∂β > 0.
Proof of Lemma A.4. We only prove
∂IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B
!
∂β > 0. The inequality
∂IL
p
(0)
A
p
(0)
B
,
(1+β)p
(0)
A
p
(0)
B
!
∂β > 0
can be proven by following the same procedure. First, recall that IL

p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B

is defined as:
IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)p
(0)
B
!
:= 1 −
p
(0)
A x2 + (1 + β)p
(0)
B y2
p
(0)
A x1 + (1 + β)p
(0)
B y1
, (A.28)
57where x1,y1,x2,y2 > 0 are specified by the following constraints:
F(x1,y1) = F(x2,y2),
Fx(x1,y1)
Fy(x1,y1)
=
p
(0)
A
p
(0)
B
,
Fx(x2,y2)
Fy(x2,y2)
=
p
(0)
A
(1 + β)p
(0)
B
.
Note that x1,y1 do not depend on β. We differentiate (A.28) with respect to β, and obtain
−
∂(p
(0)
A x2+(1+β)p
(0)
B y2)
∂β (p
(0)
A x1 + (1 + β)p
(0)
B y1) − (p
(0)
B y1)(p
(0)
A x2 + (1 + β)p
(0)
B y2)
((p
(0)
A x1 + (1 + β)p
(0)
B y1)2
= −
p
(0)
B y2(p
(0)
A x1 + (1 + β)p
(0)
B y1) − p
(0)
B y1(p
(0)
A x2 + (1 + β)p
(0)
B y2)
((p
(0)
A x1 + (1 + β)p
(0)
B y1)2
= −
p
(0)
B p
(0)
A (x1y2 − x2y1)
((p
(0)
A x1 + (1 + β)p
(0)
B y1)2
where we have used
∂(p
(0)
A x2+(1+β)p
(0)
B y2)
∂β = p
(0)
B y2. Observe that x2 and y2 changes with β, but the
equality just mentioned holds by Lemma A.3. As Fx(x2,y2)
Fy(x2,y2) =
p
(0)
A
(1+β)p
(0)
B
is satisfied, (x2,y2) is the
solution to the optimization problem:
min
x2,y2
p
(0)
A x2 + (1 + β)p
(0)
B y2
s.t. F(x1,y1) = F(x2,y2).
(A.29)
Therefore, we can apply the envelope theorem and obtain
∂(p
(0)
A x2+(1+β)p
(0)
B y2)
∂β = p
(0)
B y2. Moreover,
as shown in the proof of Lemma A.3, we can rewrite F(x1,y1) = F(x2,y2) as
y2 − y1 = m(x2 − x1),x2 − x1 ∈ R, (A.30)
where m is a twice differentiable function, whose first order derivative is m0(x2 −x1) = −Fx(x2,y2)
Fy(x2,y2) <
0. By Assumption 1, m is convex, that is, m00 > 0. When x2 −x1 = 0, we have m0(0) = −Fx(x1,y1)
Fy(x1,y1).
Since m00 > 0 and −m0(0) = Fx(x1,y1)
Fy(x1,y1) =
p
(0)
A
p
(0)
B
>
p
(0)
A
(1+β)p
(0)
B
= Fx(x2,y2)
Fy(x2,y2) = −m0(x2 − x1), we have
x2 − x1 > 0. Moreover, as m0 < 0, we have y2 − y1 = m(x2 − x1) < m(0) = 0, so y2 − y1 < 0.
Hence, we obtain x1y2 − x2y1 < 0. Therefore, we obtain
∂IL

p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B

∂β
= −
p
(0)
B p
(0)
A (x1y2 − x2y1)
((p
(0)
A x1 + (1 + β)p
(0)
B y1)2
> 0.
58Proof of Corollary 1. The probability of token exchange reversion is exactly the probability that
an A token is hit by an idiosyncratic shock while a B token is not hit by an idiosyncratic shock:
(1 − θ)κ1(1 − κ2),
which clearly decreases in κ2.
The probability that the fair value exchange rate remains
p
(0)
A
(1+β)p
(0)
B
is (1−θ)(κ1κ2 +(1−κ2)(1−
κ1)) + θ. The probability that the fair value exchange rate becomes
p
(0)
A
(1+β)2p
(0)
B
after period 2 is
(1 − θ)κ2(1 − κ1). By the law of total expectation, the expected “impermanent loss” is
IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)p
(0)
B
!
((1 − θ)(κ1κ2 + (1 − κ2)(1 − κ1)) + θ)+IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)2p
(0)
B
!
(1−θ)κ2(1−κ1),
whose partial derivative with respect to κ2 is then
IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)p
(0)
B
!
(1−θ)κ1+ IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)2p
(0)
B
!
− IL
p
(0)
A
p
(0)
B
,
p
(0)
A
(1 + β)p
(0)
B
!!
(1−θ)(1−κ1) > 0,
where we have used the inequality IL

p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)2p
(0)
B

> IL

p
(0)
A
p
(0)
B
,
p
(0)
A
(1+β)p
(0)
B

, which holds because
of Lemma A.4 and the condition (1 + β)2 > (1 + β). Hence, the expected “impermanent loss” is
increasing in the parameter κ2.
The expected marginal fee revenue from deposits, κI
2 R
(2)
invA
+ κI
2 R
(2)
invB
, is independent of κ2
because κI,R
(2)
invA
,R
(2)
invB
do not depend on the parameter κ2.
As shown in the proof of Proposition 3, liquidity providers choose to deposit in period 2 if and
only β < β
(2)
frz = βfrz

p
(0)
A
(1+β)p
(0)
B

. We have shown in the proof of Proposition 3 that
∂β
(2)
frz
∂κ2
> 0,
hence the threshold β
(2)
frz increases in κ2.
Proof of Proposition 4. By Assumption 3, in every period t = 1,2, the gas fee attached to the arbi-
trage order is equal to the largest profit possible from the arbitrage, given by π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ).
By Lemma A.2,
π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = y
(t,1)
A π
y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A
!
,
59where at sub-period 1 of period t, π

y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A

> 0 is a random variable that does
not depend on the amount of A tokens y
(t,1)
A deposited in the AMM. The required ratio of deposits
y
(t,1)
A
y
(t,1)
B
is also uniquely pinned down by the token price ratio before sub-period 1 of period t, which
means that y
(t,1)
B is a constant multiple of y
(t,1)
A . Hence, π

y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A

also does not
depend on the amount of B tokens deposited, y
(t,1)
B . We have that
E(t,1)[g
(t,3)
arb ] = E(t,1)[π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )]
= E(t,1)
"
y
(t,1)
A π
y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A
!#
= y
(t,1)
A E(t,1)
"
π
y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A )
!#
,
which increases in y
(t,1)
A because π

y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A

is a non-negative random variable, and
thus E(t,1)

π

y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A

≥ 0. The quantity E(t,1)[g
(t,3)
arb ] is also increasing in y
(t,1)
B
because y
(t,1)
B is just y
(t,1)
A multiplied by a constant.
Using a similar argument, we find that V ar(t,1)[g
(t,3)
arb ] = (y
(t,1)
A )2V ar(t,1)

π

y
(t,2)
A
y
(t,1)
A
,
y
(t,2)
B
y
(t,1)
A
,p
(t,2)
B ,p
(t,2)
A

,
which implies that the variance of gas fee increases both in y
(t,1)
A and in y
(t,1)
B .
Proof of Lemma 3. Recall that liquidity providers must deposit their tokens at the spot price
Fx
Fy
(x,y)=(y
(t,1)
A ,y
(t,1)
B )
=
p
(t,1)
A
p
(t,1)
B
. This condition guarantees that a liquidity provider deposits A tokens
and B tokens with same value, i.e.,
p
(t,1)
A
p
(t,1)
B
=
y
(t,1)
B
y
(t,1)
A
for t = 1,2.
We consider the case when a shock only hits the B token in period t,t ∈ {1,2}. The case where
a shocks hits the A token can be proven via symmetric arguments. We plug the specification of
the pricing curve, F
(t)
k (x,y) = (1−k) A F
(t)
0 (x,y)+k F1(x,y) = (1−k) A (p
(t,1)
A x+p
(t,1)
B y)+k xy,
into the arbitrageur’s optimization problem (3). After straightforward algebraic manipulations, we
60obtain the following arbitrageur’s optimization problem in period t:
max
∆q
(t,3)
A ,∆q
(t,3)
B
p
(t,2)
A (1 + f)∆q
(t,3)
A + p
(t,2)
B ∆q
(t,3)
B
s.t. q
(t,3)
B =
q
(t,3)
A y
(t,2)
B
kq
(t,3)
A − y
(t,2)
A
,
∆q
(t,3)
A ≤ 0,y
(t,2)
B ≥ ∆q
(t,3)
B ≥ 0.
(A.31)
Plugging q
(t,3)
B =
q
(t,3)
A y
(t,2)
B
kq
(t,3)
A −y
(t,2)
A
into y
(t,2)
B ≥ ∆q
(t,3)
B ≥ 0, we obtain
y
(t,2)
A
−1+k ≤ ∆q
(t,3)
A ≤ 0. We then use
q
(t,3)
A y
(t,2)
B
kq
(t,3)
A −y
(t,2)
A
to replace q
(t,3)
B in (A.31), which leads to the following equivalent single variable and
unconstrained optimization problem:
max
y
(t,2)
A
−1+k
≤∆q
(t,3)
A ≤0
p
(t,1)
A (1 + f)∆q
(t,3)
A + (1 + β)p
(t,1)
B
∆q
(t,3)
A y
(t,2)
B
k∆q
(t,3)
A − y
(t,2)
A
(A.32)
As in the more general case of the proof of Lemma 1, the optimal trading amount ∆q
(t,3)
A = 0
if β ≤ f. If β > f, then the optimal trading amount is achieved either when the marginal benefit
is equal to the marginal cost, i.e.
p
(t,1)
A (1 + f) − (1 + β)p
(t,1)
B
y
(t,2)
A y
(t,2)
B
(k∆q
(t,3)∗
A − y
(t,2)
A )2
= 0,
which leads to
∆q
(t,3)∗
A =
y
(t,2)
A
k
1 −
s
1 + β
1 + f
!
(A.33)
or when all the B tokens in the AMM have been withdrawn, i.e.,
p
(t,1)
A (1 + f) − (1 + β)p
(t,1)
B
y
(t,2)
A y
(t,2)
B
(k∆q
(t,3)∗
A − y
(t,2)
A )2
< 0,
∆q
(t,3)∗
A y
(t,2)
B
k∆q
(t,3)∗
A − y
(t,2)
A
= y
(t,2)
B ,
which leads to the following solution
∆q
(t,3)∗
A =
y
(t,2)
A
−1 + k
. (A.34)
The latter case occurs if 1 + β > 1+f
(1−k)2 , i.e., if the curvature of the pricing function is sufficiently
small.
We then plug the optimal trading amount into (A.32). If β ≤ f, we have π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,1)
A ) =
610. If 1+f
(1−k)2 − 1 > β > f, plugging (A.33) into the objective function given by (A.32), we obtain
π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) =
(
q
1+β
1+f − 1)(
p
(1 + β)(1 + f)p
(t,1)
B y
(t,2)
B − p
(t,1)
A (1 + f)y
(t,2)
A )
k
=
(
√
1 + β −
√
1 + f)2p
(t,1)
A y
(t,1)
A
k
,
(A.35)
where to obtain the second equality, we use the identity
p
(t,1)
A
p
(t,1)
B
=
y
(t,1)
B
y
(t,1)
A
, and the fact that y
(t,2)
A =
y
(t,1)
A ,y
(t,2)
B = y
(t,1)
B if only a token price shock arrives at sub-period 2 of period t. Applying the
above identities again, we have that if an arbitrage opportunity occurs in period t, then the realized
arbitrage loss ratio is:
π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
=
(
√
1 + β −
√
1 + f)2
2k
. (A.36)
The probability that an arbitrage occurs in period t is (1−θ)(κ1(1−κ2)+κ2(1−κ1)), so we have
E(t,1)

π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B

= (1 − θ)(κ1(1 − κ2) + κ2(1 − κ1))
(
√
1 + β −
√
1 + f)2
2k
The above ratio is obviously decreasing in k. If β ≥ 1+f
(1−k)2 − 1, we plug (A.34) into the objective
function given by (A.32). Following the same procedure as above, we obtain
π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = (1 + β)p
(t,1)
B y
(t,2)
B − (1 + f)p
(t,1)
A
y
(t,2)
A
1 − k
= (1 + β)p
(t,1)
B y
(t,1)
B − (1 + f)p
(t,1)
A
y
(t,1)
A
1 − k
, (A.37)
where to obtain the last equality, we use the identity
p
(t,1)
A
p
(t,1)
B
=
y
(t,1)
B
y
(t,1)
A
, and the fact that y
(t,2)
A =
y
(t,1)
A ,y
(t,2)
B = y
(t,1)
B if only a token price shock arrives at sub-period 2 of period t. The probability
that an arbitrage occurs in period t is (1 − θ)(κ1(1 − κ2) + κ2(1 − κ1)), so we have
E(t,1)

π(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B

= = (1 − θ)(κ1(1 − κ2) + κ2(1 − κ1))
(1 + β)p
(t,1)
B y
(t,2)
B − (1 + f)p
(t,1)
A
y
(t,2)
A
1−k
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
= (1 − θ)(κ1(1 − κ2) + κ2(1 − κ1))
(1 + β) − 1+f
1−k
2
,
(A.38)
where we use the identity
p
(t,1)
A
p
(t,1)
B
=
y
(t,1)
B
y
(t,1)
A
. Clearly, the above expectation is decreasing in k.
62We then calculate the investors’ maximum surplus for “type A” investors and “type B” investors,
respectively given by sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ), and sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ). We consider the
case where a “type B” investor arrives. The case where a “type A” investor arrives can be easily
handled with symmetric arguments. We proceed as above, and plug the expression of the pric-
ing function F
(t)
k (x,y) into the investor’s optimization problem (2). This leads to the following
equivalent single-variable optimization problem:
max
y
(t,1)
A
−1+k
≤∆Q
(t,2)
A ≤0
p
(t,1)
A (1 + f)∆Q
(t,2)
A + (1 + α)p
(t,1)
B
∆Q
(t,2)
A y
(t,1)
B
k∆Q
(t,2)
A − y
(t,1)
A
(A.39)
If α ≤ f, then the optimal trading amount is ∆Q
(t,2)∗
A = 0. If 1+f
(1−k)2 − 1 > α > f, then the
optimal trading amount is achieved when the marginal benefit is equal to marginal cost, i.e.,
∆Q
(t,2)∗
A =
y
(t,1)
A
k

1 −
r
1 + α
1 + f

. (A.40)
If 1+α > 1+f
(1−k)2 , then the optimal trading amount is achieved when all B tokens in the AMM have
been withdrawn, i.e.,
∆Q
(t,2)∗
A =
y
(t,1)
A
−1 + k
. (A.41)
If α ≤ f, we have that sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) = 0. If 1+f
(1−k)2 − 1 > α > f, then the (“type
B”) investor’s maximum surplus is given by
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) =
(
√
1 + α −
√
1 + f)2
k
p
(t,1)
A y
(t,1)
A .
Using the identity
p
(t,1)
A
p
(t,1)
B
=
y
(t,1)
B
y
(t,1)
A
, we obtain
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
=
(
√
1 + α −
√
1 + f)2
2k
. (A.42)
The above expression obviously decreases in k. If α ≥ 1+f
(1−k)2 − 1, then we have the investor’s
maximum surplus:
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) =

(1 + α) −
1 + f
1 − k

p
(t,1)
A y
(t,1)
A ,
63and
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
=
1
2

(1 + α) −
1 + f
1 − k

, (A.43)
which is also decreasing in k.
Following the same procedure above, we can show that for a “type A” investor arriving in period
t,
sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
=
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
, and both of these quantities are decreasing in k.
Therefore,
P
i=A,B si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
is decreasing in k.
Proof of Proposition 5. We follow the proof strategy of Proposition 3. Let k1 := 1 −
q
1+f
1+α, which
yields the condition α = 1+f
(1−k1)2 −1. Let k2 := 1−
q
1+f
1+β , which yields the condition β = 1+f
(1−k2)2 −1.
It follows from the assumption α ≥ β that k1 ≥ k2.
We distinguish between two cases: (1) there does not exist an arbitrage opportunity after the
investor arrives and trades in sub-period 2 of period t,t = 1,2 , (2) there exists an arbitrage
opportunity after the investor arrives and trades in sub-period 2 of period t,t = 1,2. We only
consider case (1), as case (2) follows from similar arguments and using a slightly different expression
for the return.
Observe that case (1) occurs if
q
1 − f √
α+1
√
f+1
−
√
f+1 √
α+1
≤ 0. As in the more general case con-
sidered in Proposition 5, the liquidity provider will deposit in period 2 if and only if E(2,1)

R
(2)
D

>
E(2,1)

R
(1)
A

. The expected one-period return from holding A tokens is E(2,1)

R
(1)
A

= (κ1(1 − θ) +
κcomθ)β. It remains to calculate the expected one-period return from depositing E(2,1)

R
(2)
D

.
We first consider the case where a “type B” investor arrives to the AMM, and calculate the
return from depositing. Recall from (A.20) that
R
(2)
invB
=
(1 + f)p
(2,1)
A (−∆Q
(2,2)∗
A ) + p
(2,1)
B (−∆Q
(2,2)∗
B )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
(A.44)
If k > k1, plugging ∆Q
(2,2)∗
A =
y
(2,1)
A
k

1 −
q
1+α
1+f

from (A.40) into (A.44) and using the relation
64Q
(2,2)∗
B =
∆Q
(2,2)∗
A y
(2,2)
B
k∆Q
(2,2)∗
A −y
(2,2)
A
, we obtain:
R
(2)
invB
=
(1 + f)p
(2,1)
A

y
(2,1)
A
k
q
1+α
1+f − 1

− p
(2,1)
B
y
(2,1)
B
k
q
1+α
1+f
q
1+α
1+f − 1

p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
=
(1 + f −
q
1+f
1+α)(
q
1+α
1+f − 1)
2k
(A.45)
If k < k1, plugging ∆Q
(2,2)∗
A =
y
(2,1)
A
−1+k from (A.41) into (A.44) and using the relationship Q
(2,2)∗
B =
∆Q
(2,2)∗
A y
(2,2)
B
k∆Q
(2,2)∗
A −y
(2,2)
A
, we have:
R
(2)
invB
=
(1 + f)p
(2,1)
A
y
(2,1)
A
1−k − p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
=
1
2

1 + f
1 − k
− 1

(A.46)
Following the same procedure above, we obtain R
(2)
invA
= R
(2)
invB
.
We then consider the event where only the B token is hit by an idiosyncratic shock. Then there
exists an arbitrage opportunity. Recall that in this case, the return from depositing is then:
R
(2)
arbB
=: β
p
(2,1)
B y
(2,1)
B
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
−
π(y
(2,1)
A ,y
(2,1)
B ,(1 + β)p
(1,2)
B ,p
(1,2)
A )
p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B
If k > k2, using (A.35), the identity
p
(2,1)
A
p
(2,1)
B
=
y
(2,1)
B
y
(2,1)
A
, and the fact that y
(2,2)
A = y
(2,1)
A ,y
(2,2)
B = y
(2,1)
B
when no investor arrives at sub-period 2 of period 2, we obtain:
R
(2)
arbB
=
β
2
−
(
√
1 + β −
√
1 + f)2
2k
. (A.47)
Similarly, if k < k2, using (A.37) and the above identities, we have:
R
(2)
arbB
=
β
2
−
(1 + β − 1+f
1−k)
2
. (A.48)
Following the same procedure above, we obtain R
(2)
arbB
= R
(2)
arbA
.
We now compare the expectation of the one-period return from depositing at period 2, E(2,1)

R
(2)
D

,
with the expectation of the one-period return from holding an A tokens at period 2, E(2,1)

R
(2)
A

.
65Recall from (A.23) that we have:
E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

=
κI
2
R
(2)
invA
+
κI
2
R
(2)
invB
+ (1 − θ)

κ1(1 − κ2)R
(2)
arbA
+ κ2(1 − κ1)R
(2)
arbB
+ κ1κ2β

+θκcomβ − ((1 − θ)κ1 + θκcom)β (A.49)
If k ≥ k1 ≥ k2, plugging (A.45) and (A.47) into (A.49), and using the identities R
(2)
arbB
= R
(2)
arbA
and R
(2)
invA
= R
(2)
invB
, we obtain:
E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

=
1
k
τ1 − (1 − θ)(κ1 − κ2)β, (A.50)
where
τ1 =

κI
(1 + f −
q
1+f
1+α)(
q
1+α
1+f − 1)
2
− (1 − θ)
(
√
1 + β −
√
1 + f)2
2
(κ1(1 − κ2) + κ2(1 − κ1))

.
If τ1 < 0, then all the terms in (A.50) are negative, and we have E(2,1)

R
(2)
D

−E(2,1)

R
(2)
A

< 0,
that is, the expected one-period return from depositing is smaller than the expected one-period
return from holding A token. As a result, there is a liquidity freeze. The liquidity providers’
expected return at period 2 is then E(2,1)

R
(2)
A

= (κ1(1 − θ) + κcomθ)β, which is constant with
respect to k.
If τ1 > 0, then E(2,1)

R
(2)
D

−E(2,1)

R
(2)
A

decreases in k. Since E(2,1)

R
(2)
A

is constant in k, we
also have that E(2,1)

R
(2)
D

decreases in k. Thus, the liquidity providers’ expected return at period
2, max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

also decreases in k.
If k1 ≥ k ≥ k2, plugging (A.46) and (A.47) into (A.49), and using the identities R
(2)
arbB
= R
(2)
arbA
and R
(2)
invA
= R
(2)
invB
, we obtain
E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

= τ2 − (1 − θ)(κ1 − κ2)β, (A.51)
where
τ2 =
κI
2

1 + f
1 − k
− 1

−
1
k
(1 − θ)
√
1 + β −
√
1 + f)2
2
(κ1(1 − κ2) + κ2(1 − κ1)),
66which increases in k since all the terms in τ2 increases in k, and (1−θ)(κ1 −κ2)β is constant with
respect to k.
If k2 ≥ k ≥ 0, plugging (A.45) and (A.48) into (A.49), and using the identities R
(2)
arbB
= R
(2)
arbA
and R
(2)
invA
= R
(2)
invB
, we have:
E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

= τ3 − (1 − θ)(κ1 − κ2)β, (A.52)
where
τ3 =

κI
2

1 + f
1 − k
− 1

− (1 − θ)
(1 + β − 1+f
1−k)
2
(κ1(1 − κ2) + κ2(1 − κ1))

,
which increases in k since all the terms in τ3 increases in k, and (1−θ)(κ1 −κ2)β is constant in k.
Therefore, E(2,1)

R
(2)
D

−E(2,1)

R
(2)
A

increases in k for k < k1. Since E(2,1)

R
(2)
A

is constant in
k, we have the expected return from depositing, E(2,1)

R
(2)
D

increases in k. Moreover, we also have
the liquidity providers’ expected return at period 2, max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

increases in
k for k < k1.
The liquidity providers’ expected return at period 2, max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

is max-
imized at k∗ = k1, since it increases in k on the interval [0,k1] and decreases in k on the interval
[k1,1]. Since E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

is also maximized at k∗ = k1, if a liquidity freeze occurs
at period 2 for k = k∗, i.e, E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

< 0, then E(2,1)

R
(2)
D

− E(2,1)

R
(2)
A

< 0
for other k ∈ [0,1], which means that a liquidity freeze also occurs for other k ∈ [0,1]. Moreover,
max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

only depends on fixed parameters, which means that it does not
depend on the state ω(1,3). Plugging E

e
(2)
i
e
(1)
i
ω(1,2)

= max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

+ 1 into
(A.15), (A.16), and (A.17), we have
E(1,1)

VD

= E(1,1)

R
(1)
D

max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

+ 1

, (A.53)
E(1,1)

VA

= E(1,1)

R
(1)
A

max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

+ 1

, (A.54)
E(1,1)

VB

= E(1,1)

R
(1)
B

max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

+ 1

. (A.55)
The above expressions indicate that each liquidity provider only needs to maximize its one-period
return in period 1. Hence, liquidity providers choose their portfolios in period 1 exactly the same
as they choose their portfolios in period 2, which also maximize the one-period return. Hence, the
67aggregate payoff of liquidity provider i is:

max

E(2,1)

R
(2)
D

,E(2,1)

R
(2)
A

+ 1
2
e
(0)
i ,
which is maximized at k∗.
Because the optimal actions are the same in both periods, a liquidity freeze occurs at period
1 if and only if it occurs at period 2. This implies that in period 1, a liquidity freeze is also least
likely whenk = k∗. As a result, for any period t = 1,2, if a liquidity freeze occurs for k∗, it also
occurs for any other k ∈ [0,1].
Proof of Proposition 6. If there exists a liquidity freeze, then there is no deposit made at the AMM,
and consequently the capital efficiency is 0.
We next consider the case where deposits are nonzero at equilibrium. If the investor does not
arrive in period t, then |∆Q
(t,2)∗
A |= |∆Q
(t,2)∗
B |= 0, and the realized capital efficiency is zero. The
probability of an investor arriving is constant with respect to k. In order to show that the expected
capital efficiency at period t is maximized at k∗, it suffices to show that upon the arrival of an
investor, the realized capital efficiency is maximized at k∗. We again consider the case where a
“type B ” investor arrives, and omit the case of a “type A” investor arriving, because it follows
from similar arguments. Recall that the capital efficiency is defined as:
p
(t,1)
A |∆Q
(t,2)∗
A |+p
(t,1)
B |∆Q
(t,2)∗
B |
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
=
p
(t,1)
A |∆Q
(t,2)∗
A |+p
(t,1)
B |
∆Q
(t,2)∗
A y
(t,1)
B
k∆Q
(t,2)∗
A −y
(t,1)
A
|
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
, (A.56)
where we have used the relation ∆Q
(t,2)∗
B =
∆Q
(t,2)∗
A y
(t,1)
B
k∆Q
(t,2)∗
A −y
(t,1)
A
.
If k ≥ k∗, plugging ∆Q
(t,2)∗
A =
y
(t,1)
A
k

1 −
q
1+α
1+f

from (A.40) into (A.56), we obtain that the
realized capital efficiency when a “type B” investor arrives is
p
(t,1)
A
y
(t,1)
A
k
q
1+α
1+f − 1

+ p
(t,1)
B
y
(t,1)
B
k
q
1+α
1+f
q
1+α
1+f − 1

p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
,
which decreases in k.
68If k < k∗, plugging ∆Q
(t,2)∗
A =
y
(t,1)
A
−1+k from (A.41) into (A.56), we obtain
p
(t,1)
A
y
(t,1)
A
1−k + p
(t,1)
B y
(t,1)
B
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B
,
which increases in k. Therefore, the capital efficiency is maximized at k = k∗.
We then show that the expected social welfare is maximized at k = k∗. Recall that the social
welfare W is defined as the sum of all agents’ expected payoffs:
W =
n X
i=1
E
h
e
(2)
i
i
+
2 X
t=0
E
h
p
(t,2)
B ∆q
(t,3)
B + p
(t,2)
A ∆q
(t,3)
A − g
(t,3)
arb
i
+
2 X
t=0
E
"
κI
P
i=A,B si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
2
#
,
where the first term is the cumulative expected payoff of liquidity providers, the second term is the
expected payoff of the arbitrageur, and the third term is the expected payoff of investors.
For k > k∗, we have shown in the proof of Lemma 3 that “type A” and “type B” investors’
maximum surplus is decreasing in k. We have also proven that the liquidity providers’ aggregate
payoff is decreasing in k in Proposition 5. Moreover, we also shown that the equilibrium payoff of
the arbitrageur is 0. Therefore, the sum of all agents’ expected payoffs decreases in k, for k > k∗.
As shown in the proof of Proposition 5, the one-period return from depositing is the same in
both periods. Hence, we denote it by E[RD] and omit the time superscript. Similarly, we denote
the one-period return from holding A tokens by E[RA].
We now consider the case where k2 ≤ k ≤ k∗. Recall from the proof of Proposition 5 that the
liquidity providers deposit in both periods if and only if E[RD − RA] > 0. If E[RD − RA] > 0
then liquidity providers do not deposit, and only hold A tokens in their portfolio. In such case,
a liquidity freeze occurs in both periods, and both the arbitrageur and investors have zero payoff.
Then, the expected social welfare is
n X
i=1
e
(0)
i (1 + E[RA])2
=
n X
1
e
(0)
i (1 + (κ1(1 − θ) + κcomθ)β)2
.
If E[RD − RA] > 0 then the liquidity providers deposit in both periods, and their expected return
69in both periods are E[RD]. The expected social welfare in this case may be written as:
(A.57)
n X
i =1
e
(0)
i (1 + E[RD])2
+ E
" n X
i=1
e
(0)
i
κI
P
i=A,B si(y
(1,1)
A ,y
(1,1)
B ,p
(1,1)
B ,p
(1,1)
A )
2(p
(1,1)
A y
(1,1)
A + p
(1,1)
B y
(1,1)
B )
#
+ E
" n X
i=1
e
(1)
i
κI
P
i=A,B si(y
(2,1)
A ,y
(2,1)
B ,p
(2,1)
B ,p
(2,1)
A )
2(p
(2,1)
A y
(2,1)
A + p
(2,1)
B y
(2,1)
B )
#
where the first term is the the cumulative expected payoff of liquidity providers, the second and
the third terms are the expected payoff of investors in period 1 and 2 respectively.
From (A.43) and the condition
sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
=
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
, we know that
κI
P
i=A,B si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
2(p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B )
= κI
2

(1 + α) − 1+f
1−k

is the same for both periods t = 1,2. Since
liquidity providers deposit in period 1, we also have E
hPn
i=1 e
(1)
i
i
=
Pn
i=1 e
(0)
i (1 + E[RD]). Using
the conditions above, we can rewrite (A.57) as
n X
i=1
e
(0)
i ((1 + E[RD])τ4 + τ4 + 1),
where
τ4 = E[RD] +
κI
P
i=A,B si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
2(p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B )
is the expected return of liquidity providers plus the investors’ surplus ratio multiplied by the
investors’ arrival probability. Observe that τ4 ≥ E[RD] because si(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A ) > 0 by
Lemma 2. We then use (A.43), (A.51), along with the conditions E[RA] = (κ1(1 − θ) + κcomθ)β)
and
sA(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
=
sB(y
(t,1)
A ,y
(t,1)
B ,p
(t,1)
B ,p
(t,1)
A )
p
(t,1)
A y
(t,1)
A +p
(t,1)
B y
(t,1)
B
, and rewrite τ4 as
τ4 =
κI
2
α−
1
k
(1−θ)
(
√
1 + β −
√
1 + f)2
2
(κ1(1−κ2)+κ2(1−κ1))+(κ1(1−θ)+κcomθ)β−(1−θ)(κ1−κ2)β.
Clearly, the expression above is increasing in k.
Combining the two cases discussed above, we can write the expected social welfare as
W = 1E[RD−RA]≤0
n X
i=1
e
(0)
i (1 + E[RA])2
+ 1E[RD−RA]>0
n X
i=1
e
(0)
i ((1 + E[RD])τ4 + τ4 + 1)
= (1 + (E[RA])2
) + 1E[RD−RA]>0
n X
i=1
e
(0)
i ((2 + E[RD])τ4 + 1 − (1 + (E[RA])2
)). (A.58)
70Moreover, using the inequality τ4 ≥ E[RD], we deduce
(2 + E[RD])τ4 + 1 − (1 + (E[RA])2
)
≥(1 + E[RD])2
− (1 + (E[RA])2
)
≥0,
Because τ4 is increases in k, so is
Pn
i=1 e
(0)
i ((2 + E[RD])τ4 + 1 − (1 + (E[RA])2)). We also
have that 1E[RD−RA]>0 ≥ 0 is increasing in k, as we have shown E[RD − RA] increases in k for
k2 ≤ k ≤ k∗ in the proof of Proposition 5. Therefore, the expected social welfare W given in (A.58)
is increasing in k for k2 ≤ k ≤ k∗.
If k ≤ k2, we can prove that W is increasing in k using a similar procedure. Therefore, the
expected social welfare is maximized at k∗.
Proof of Proposition 7. If β ≤ f, then no arbitrage occurs, and the arbitrage loss ratio for both
AMMs is zero.
Next, we consider the case β > f. Consider the AMM which manages A and B tokens only.
We are considering an AMM utilizing a constant product function, that is, a special case of F
(t)
k
where we set k = 1. Plugging k = 1 into (A.35), we have that the realized token value loss when
an arbitrage opportunity occurs at period t,t ∈ {1,2}, is given by
πAB(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A ) = (
p
1 + β −
p
1 + f)2
p
(t,1)
A y
(t,1)
A .
The probability that an arbitrage opportunity occurs is 2(1−θ)(1−κ)κ. At period t, the expected
arbitrage ratio of the AMM that pools two tokens is
E(t,1)

πAB(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B

= (1 − θ)(1 − κ)κ(
p
1 + β −
p
1 + f)2
,
where we have used that liquidity providers must deposit at the spot rate, and thus the ratio of
deposits is uniquely pinned down by the relations p
(t,1)
A y
(t,1)
A = p
(t,1)
B y
(t,1)
B .
We then calculate the arbitrage ratio of the AMM that pools three tokens. An arbitrage occurs
if the token price shock hits only one or two tokens. The probability that only one token is hit by an
idiosyncratic shock is 3(1−θ)(1−κ)2κ, and the probability that two tokens are hit by idiosyncratic
shocks is 3(1−θ)(1−κ)κ2. Suppose that only token B is hit by a price shock, then the arbitrageur
71solves the following optimization problem:
max
∆q
(t,3)
A ,∆q
(t,3)
B ,∆q
(t,3)
C
p
(t,1)
A (1 + f)∆q
(t,3)
A + (1 + β)p
(t,1)
B ∆q
(t,3)
B + (1 + f)p
(t,1)
C ∆q
(t,3)
C
s.t. y
(t,2)
A y
(t,2)
B y
(t,2)
C = (y
(t,2)
A − ∆q
(t,3)
A )(y
(t,2)
B − ∆q
(t,3)
B )(y
(t,2)
C − ∆q
(t,3)
C )
∆q
(t,3)
A ≤ 0,∆q
(t,3)
B ≥ 0,∆q
(t,3)
C ≤ 0.
(A.59)
The arbitrage profit is maximized if the following first-order conditions are satisfied:
(1 + β)p
(t,1)
B
(1 + f)p
(t,1)
A
=
(y
(t,2)
A − ∆q
(t,3)
A )
(y
(t,2)
B − ∆q
(t,3)
B )
,
(1 + β)p
(t,1)
B
(1 + f)p
(t,1)
C
=
(y
(t,2)
C − ∆q
(t,3)
C )
(y
(t,2)
B − ∆q
(t,3)
B )
.
The relations above hold if the marginal benefit of exchanging tokens is equal to the marginal cost
of the arbitrageur.
Using the condition above, the identities p
(t,1)
A y
(t,1)
A = p
(t,1)
B y
(t,1)
B = p
(t,1)
C y
(t,1)
C ,y
(t,1)
A = y
(t,2)
A ,y
(t,1)
B =
y
(t,2)
B ,y
(t,1)
C = y
(t,2)
C and the constraint y
(t,2)
A y
(t,2)
B y
(t,2)
C = (y
(t,2)
A − ∆q
(t,3)
A )(y
(t,2)
B − ∆q
(t,3)
B )(y
(t,2)
C −
∆q
(t,3)
C ), we obtain
p
(t,1)
A (y
(t,2)
A − ∆q
(t,3)
A ) = p
(t,1)
C (y
(t,2)
C − ∆q
(t,3)
C ) =

1 + β
1 + f
1
3
p
(t,1)
A y
(t,1)
A ,
p
(t,1)
B (y
(t,2)
B − ∆q
(t,3)
B ) =

1 + β
1 + f
−2
3
p
(t,1)
A y
(t,1)
A
(A.60)
Plugging (A.60) into the objective function given in (A.59), we then obtain the realized arbitrage
loss when only token B is hit by a shock:
πABC(y
(t,2)
A ,y
(t,2)
B ,y
(t,2)
C ,p
(t,2)
C ,p
(t,2)
B ,p
(t,2)
A ) = p
(t,1)
A y
(t,1)
A (3 + β + 2f − 3(1 + f)
2
3 (1 + β)
1
3 )
≥ p
(t,1)
A y
(t,1)
A (2 + β + f − 2(1 + f)
1
2 (1 + β)
1
2 )
= p
(t,1)
A y
(t,1)
A (
p
1 + β −
p
1 + f)2
,
where we have used the geometric inequality 1 + f + 2(1 + f)
1
2 (1 + β)
1
2 ) ≥ 3(1 + f)
2
3 (1 + β)
1
3 .
Following an analogous procedure, we can verify that the following inequality holds if two tokens
are hit by price shocks:
πABC(y
(t,2)
A ,y
(t,2)
B ,y
(t,2)
C ,p
(t,2)
C ,p
(t,2)
B ,p
(t,2)
A ) ≥ p
(t,1)
A y
(t,1)
A (
p
1 + β −
p
1 + f)2
. (A.61)
Recall that the probability that only one token is hit by a shock is 3(1 − θ)(1 − κ)2κ, and
72the probability that two tokens are hit by idiosyncratic shocks is 3(1 − θ)(1 − κ)κ2. Applying the
inequality in (A.61) and the identity p
(t,1)
A y
(t,1)
A = p
(t,1)
B y
(t,1)
B = p
(t,1)
C y
(t,1)
C , we have:
E(t,1)

πABC(y
(t,2)
A ,y
(t,2)
B ,y
(t,2)
C ,p
(t,2)
C ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B + p
(t,1)
C y
(t,1)
C

≥ (1 − θ)((1 − κ)2
κ + (1 − κ)κ2
)(
p
1 + β −
p
1 + f)2
= (1 − θ)(1 − κ)κ(
p
1 + β −
p
1 + f)2
= E(t,1)

πAB(y
(t,2)
A ,y
(t,2)
B ,p
(t,2)
B ,p
(t,2)
A )
p
(t,1)
A y
(t,1)
A + p
(t,1)
B y
(t,1)
B

73