---
sha256: e540d9d24535f7cfc6dc861b7bb977f85f7830ba6714ec4bd15fc13dd9426d5d
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 150458
---
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comBook generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comAbout the Author
Jesper Kristensen is an entrepreneur and investor with a passion
for pioneering technological advancements and fostering growth in
the Web3 space. With multiple graduate degrees and a Ph.D. in
Applied Physics and Computer Science from Cornell University,
his career spans industry R&D, software engineering, quantitative
finance, and startup incubation. For his latest work, please follow:
linktr.ee/cryptojesperk.
My Journey
From investing in groundbreaking companies like SpaceX [19], Databricks
[9], and Neuralink [16] to co-founding multiple startups, Jesper’s
professional journey is driven by innovation and a commitment to
shaping the future of technology.
As the CEO and Co-founder of Psi Finance (psifi.app), Jesper is
spearheading the “Venmo moment” for Crypto. Psi Finance aims
to revolutionize how people interact with digital currencies, making
crypto accessible and user-friendly for everyone.
Jesper is also involved with building the future trading exchange
for compute—full details not available at this time.
Pioneering DeFi Options
In the face of the 2022 bear market, Jesper co-founded Panoptic
(panoptic.xyz), a DeFi options protocol built on top of Uniswap.
Together with his co-founder Jesper led Panoptic through a suc-
cessful $4.5M SAFE funding round and a $7M Series Seed round,
attracting support from notable investors such as Jane Street, Coin-
base Ventures, and Uniswap Labs Ventures.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com4
Sharing Knowledge and Insights
Jesper is dedicated to educating others about the crypto and DeFi
spaces. He runs a YouTube channel where he shares insights and
tutorials: www.youtube.com/@cryptojesperk.
He has also authored a best-selling book, Automated Market
Makers, which is a top resource on Amazon for understanding the
mathematics behind this essential DeFi concept.
Academic Contributions
Jesper holds multiple patents and has authored numerous peer-
reviewed articles with hundreds of citations. His work can be ex-
plored in greater detail here: Jesper’s Google Scholar.
Connect with Me
Stay connected and follow Jesper’s journey through these plat-
forms:
• LinkTree
• X
• YouTube—70,000 views and >7,000 subscribers.
• Medium
• GitHub
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comJesper Kristensen
Co-founder of Panoptic1
June 20, 2024
1
I do a lot of things! In the context of this work, this label makes the
most sense. For my current and latest work, please see, and follow my
linktree profile.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comContents
## 1 Introduction 1
## 2 Uniswap v3 Recap 7
## 2.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . 9
## 2.2 Ticks . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 2.2.1 Tick Spacing . . . . . . . . . . . . . . . . . . 11
## 2.3 Liquidity Providers’ Position . . . . . . . . . . . . . 12
2.3.1 LP Position Value . . . . . . . . . . . . . . . 13
## 2.3.2 Open Position (Entry State) . . . . . . . . . 14
## 2.3.3 The LP Position at Price p . . . . . . . . . . 14
## 2.3.4 Summary . . . . . . . . . . . . . . . . . . . . 17
## 2.3.5 Example . . . . . . . . . . . . . . . . . . . . . 17
## 2.4 Capital Efficiency . . . . . . . . . . . . . . . . . . . . 18
## 2.5 Conclusion . . . . . . . . . . . . . . . . . . . . . . . 22
## 3 Uniswap V3 Options 25
## 3.1 Single Tick Uniswap V3 Positions . . . . . . . . . . . 25
## 3.1.1 Covered Call vs. Single Tick Position . . . . 27
## 3.1.2 Cash-Secured Put vs. Single Tick Position . . 29
3.1.3 LP Tokens . . . . . . . . . . . . . . . . . . . 31
3.2 A Touch of Classical Option Theory . . . . . . . . . 35
## 3.2.1 Covered Call Analogy . . . . . . . . . . . . . 37
## 3.2.2 Cash-Secured Put Analogy . . . . . . . . . . 38
## 3.2.3 Theoretical Implications . . . . . . . . . . . . 38
## 3.2.4 Further Exploration . . . . . . . . . . . . . . 39
## 3.2.5 Classical Option Theory . . . . . . . . . . . . 39
## 3.2.6 Single Tick LP Positions vs. Classical Options 41
3.3 LP Expected Returns . . . . . . . . . . . . . . . . . 49
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comii Contents
## 3.3.1 Price Movements . . . . . . . . . . . . . . . . 49
## 3.3.2 Price Inside Liquidity Range . . . . . . . . . 52
## 3.3.3 Implications for Fee Collection . . . . . . . . 54
## 3.3.4 Collected Fees . . . . . . . . . . . . . . . . . 56
## 3.4 Implied Volatility . . . . . . . . . . . . . . . . . . . . 61
## 3.4.1 Holding a Uniswap V3 LP Position . . . . . . 63
## 3.4.2 Lending a Uniswap V3 LP Position . . . . . . 65
## 3.4.3 Premium vs. Fee and Implied Volatility . . . 66
## 3.5 Generalization . . . . . . . . . . . . . . . . . . . . . 70
3.5.1 LP Position Re-write . . . . . . . . . . . . . . 70
## 3.5.2 Covered call . . . . . . . . . . . . . . . . . . . 72
## 3.5.3 Cash–secured put . . . . . . . . . . . . . . . . 74
## 3.5.4 Delta . . . . . . . . . . . . . . . . . . . . . . 76
## 3.5.5 Delta of a Uniswap V3 LP Position . . . . . . 76
## 3.5.6 Gamma . . . . . . . . . . . . . . . . . . . . . 79
## 4 Panoptic 83
## 4.1 Protocol Design . . . . . . . . . . . . . . . . . . . . . 83
## 4.1.1 Option Selling . . . . . . . . . . . . . . . . . 84
## 4.1.2 Option Buying . . . . . . . . . . . . . . . . . 85
## 4.1.3 Favorable Market Conditions . . . . . . . . . 86
## 4.1.4 Perpetual Options . . . . . . . . . . . . . . . 87
## 4.1.5 Summary of Panoptic . . . . . . . . . . . . . 88
Conclusion 89
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comChapter 1
Introduction
Welcome to this mini-book covering how Uniswap V3 positions are
equivalent to perpetual options, a comprehensive exploration of the
theoretical foundations and practical implications of perpetual op-
tions in decentralized finance (DeFi). This book dives into the
intricacies of Uniswap v3 positions and their representation as per-
petual options, providing a detailed examination of the underlying
mechanisms and their applications.
Furthermore, this work is inspired by the articles written by
Panoptic co-founder Guillaume Lambert on Medium, which provide
a good overview of the concepts and applications of AMMs and
perpetual options. In this book, significant details and derivations
have been added to that body of work to ensure it stands alone as
a comprehensive guide.
I aim to fully and clearly explain all derivations, making them
accessible and understandable to everyone, and to share these in-
sights with the public. There will be a lot of mathematics involved,
but examples will be provided as well. The goal in this work is
to enable readers to fully understand everything from start to fin-
ish, providing all the necessary theoretical foundations, practical
examples, and detailed explanations.
The advent of decentralized finance has revolutionized tradi-
tional financial systems, introducing novel mechanisms for trading,
lending, and earning. Among these innovations, perpetual options
stand out as a significant advancement, offering continuous and flex-
ible trading opportunities without an expiration date. This book
focuses on the theoretical underpinnings of perpetual options, par-
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2 Chapter 1. Introduction
ticularly through the lens of Uniswap v3, a leading decentralized
exchange protocol.
The primary aim of this book is to provide a clear and com-
prehensive guide on the steps and derivations required to move
from Uniswap v3 positions to the development and understanding
of perpetual options.
This book is organized into three main sections:
Uniswap v3 Recap
This section provides a foundational understanding of Uniswap v3,
including its unique features such as concentrated liquidity and
tick-based price ranges. It sets the stage for understanding how
Uniswap v3 positions can be viewed as perpetual options.
Uniswap v3 Options
Here, we dive into the core concepts of how single tick Uniswap
v3 positions replicate traditional option strategies like covered calls
and cash-secured puts. This section also covers the theoretical ex-
pected returns, price movements, and the implications of implied
volatility on these positions.
Panoptic Protocol
The final section introduces the Panoptic protocol (panoptic.xyz),
a novel approach to trading perpetual options in DeFi. I discuss
the design, market conditions, and the mechanics of buying and
selling options within this framework.
Target Audience
This book is intended for financial analysts, DeFi enthusiasts, traders,
and academics interested in the intersection of traditional finance
and decentralized technologies. It is also suitable for anyone looking
to gain a deeper understanding of how perpetual options operate
within the DeFi ecosystem and their broader implications for the
future of finance.
As we navigate through the evolving landscape of decentralized
finance, understanding the foundational theories and practical ap-
plications of financial instruments like perpetual options is crucial.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3
This book aims to equip readers with the knowledge and insights
needed to navigate this dynamic field effectively.
It is my sincerest hope that, whether you are a seasoned trader
or a curious newcomer, this mini-book will offer valuable perspec-
tives on one of the most exciting developments in modern finance.
Overview for Beginners
We are going to explore how providing liquidity (putting your
money into) a Uniswap V3 pool is similar to playing with some
special financial tools called options. Let’s break it down in a sim-
ple way:
What is Uniswap V3?
Uniswap V3 is like a marketplace where you can exchange different
types of digital money (cryptocurrencies). To make this market-
place work, people like you and me provide the money (liquidity)
that others use to trade. When we do this, we earn a small fee each
time someone makes a trade using our money.
Single Tick Positions
Imagine you have a store, and you decide to sell your candies only
if the price is between $1 and $2. In Uniswap V3, a single tick
position is similar: you provide liquidity (your money) for a very
narrow price range. If the price moves out of this range, your
money either turns completely into one type of cryptocurrency or
the other.
Comparing to Options
We will compare these single tick positions to two types of financial
tools called options:
Covered Call
A covered call is like agreeing to sell your candy for a specific price
in the future. If the price goes higher than what you agreed, you
sell your candy and make money. In Uniswap, if the price goes
beyond your range, you end up with one type of cryptocurrency.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com4 Chapter 1. Introduction
Cash-Secured Put
A cash-secured put is like agreeing to buy candy for a specific price
in the future. If the price drops, you buy the candy and now own
it. In Uniswap, if the price drops below your range, you end up
with the other type of cryptocurrency.
Holding and Lending LP Positions
When you put your money in Uniswap V3, you get something called
an LP token (Liquidity Provider token, because you provided liq-
uidity, another word for money in this context), which is like a
receipt showing how much money you provided. This LP token
earns fees as long as people are trading within your chosen price
range–and trading outside your range means you earn nothing.
How Long Should You Hold?
The longer you hold your LP position, the more fees you can earn,
in general. However, the increase in fees isn’t just a straight line;
it’s more like the longer you wait, the slower the increase becomes.
For example, waiting 3 days can double the fees compared to 1 day,
but you might need to wait much longer to double them again.
Expected Returns
To figure out how much you can earn, we will look at several factors:
• Deployed Amount: The amount of liquidity you provided.
• Trading Volume: How often people are trading within your
price range.
• Time: How long you keep your money in the pool.
• Volatility: How much the price jumps around. Each trade
will change the price a bit (or a lot, depending on the size of
the trade).
• Fee Factor: The fee tier of the Uniswap V3 pool.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com5
Probability and Fee Collection
We also talked about the chance that the price will stay within
your chosen range over time. This helps us predict how much we
can earn from fees. If the price stays within your range more often,
you’ll earn more fees.
In summary, by understanding and carefully choosing where
and how to provide liquidity in Uniswap V3, you can maximize
your returns and make the most out of your investment.
Let’s get started.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com6 Chapter 1. Introduction
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comChapter 2
Uniswap v3 Recap
Throughout this mini-book, I will provide ELI51 explanations where
appropriate. These are obviously considered optional by default for
experts on the topics. While the book contains numerous advanced
and mathematically intensive sections, I believe these ELI5 sections
can offer a refreshing break and help reinforce understanding.
Here is our first ELI5 section. Again, if you’re already well-
versed in the topic, feel free to skip it:
Understanding Uniswap V2 and V3: An ELI5
Explanation
What is Uniswap V2?
Uniswap V2 [2] is like a big digital marketplace where you can trade
different types of digital money (cryptocurrencies). Imagine you
have two types of candies, chocolate and gummy bears. You want
to trade your chocolates for gummy bears and vice versa. Here’s
how it works:
• Liquidity Pools: People put their candies (cryptocurren-
cies) into a big jar called a liquidity pool. For example, they
might put 100 chocolates and 100 gummy bears into the jar.
1
ELI5 stands for “Explain Like I’m 5.” It’s an internet acronym used to
request a simple explanation of a complex topic, as if explaining it to a five-year-
old. The goal is to break down the concept into basic, easily understandable
terms without assuming prior knowledge.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com8 Chapter 2. Uniswap v3 Recap
• Constant Product Formula: Uniswap uses a special for-
mula to keep things fair. It says that the total value of choco-
lates multiplied by the total value of gummy bears in the jar
must always be the same. If you take out some chocolates,
you have to put in more gummy bears to keep the product
the same.
• Trading: When you want to trade your chocolates for gummy
bears, you add your chocolates to the jar and take out the
equivalent value in gummy bears, according to the formula.
The price changes slightly every time someone trades, de-
pending on how much they take out or put in.
• Earning Fees: The people who put their candies in the
jar (liquidity providers) earn a small fee every time some-
one makes a trade. This fee is a little extra candy added to
the jar.
What is Uniswap V3?
Uniswap V3 [3] is a newer, fancier version of the marketplace with
some cool upgrades. It’s like adding some special rules to make the
candy trading game more strategic and efficient:
• Concentrated Liquidity: Instead of putting your candies
in the whole jar, you can choose to put them in just a small
section of the jar where you think most trading will happen.
For example, you might put your chocolates and gummy bears
in a section where the price is between 1 and 2 chocolates per
gummy bear. This means you can earn more fees because
your candies are being used more effectively.
• Personalized Positions: Each liquidity provider can choose
their own section of the jar (price range) to put their candies
in. This makes each position unique, like having your own
special spot in the marketplace.
• Non-Fungible Tokens (NFTs) [20]: Because each liquidity
position is unique, you get a special digital receipt called an
NFT that shows exactly where your candies are in the jar and
how much you’ve earned.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.1. Introduction 9
• Fee Tiers: Uniswap V3 allows for different fee tiers, so you
can choose to earn higher or lower fees depending on how
much trading you expect in your chosen price range.
Summary
• Uniswap V2 is like a simple candy trading game where ev-
eryone puts their candies in one big jar, and trades follow a
simple rule to keep the value balanced.
• Uniswap V3 adds more strategy to the game by letting you
put your candies in specific parts of the jar, making trading
more efficient and allowing you to earn more fees if you pick
the right spot.
With that, things are going to get more advanced in the follow-
ing sections.
## 2.1 Introduction
Uniswap v3 represents a significant advancement over Uniswap v2.
While both versions use pools with two tokens and a constant prod-
uct formula, Uniswap v3 introduces a new feature called concen-
trated liquidity. This allows liquidity providers to allocate their
liquidity to a specific price range. In this way, the liquidity is con-
centrated rather than spread evenly across all prices, enhancing
capital efficiency. When the price moves outside the chosen range,
the liquidity provider’s assets are fully converted into one of the
two tokens, depending on whether the price moves above or below
the range.
Concentrated liquidity also means that positions are highly per-
sonalized, as liquidity providers can choose both the amount to de-
posit and the specific price range for their liquidity. This customiza-
tion makes the positions non-fungible, requiring unique LP tokens
for each position. Consequently, fees are collected and stored sep-
arately as individual tokens rather than being automatically rein-
vested into the pool. The non-fungible tokens record the particular
position of the liquidity provider and track the collected fees.
To fully grasp the significance of these advancements, it’s ben-
eficial to refer to my previous book, Automated Market Makers -
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com10 Chapter 2. Uniswap v3 Recap
A Practical Guide to Decentralized Exchanges and Cryptocurrency
Trading co-authored with M. Ottina and P. J. Steffensen. That
book dives into the underlying theories and mechanics of AMMs,
covering essential topics such as Uniswap v2, Balancer [13], Curve
Finance [1], and the initial implementation of Uniswap v3. It pro-
vides a thorough exposition of the mathematics behind AMMs,
detailed descriptions of their functioning, and plenty of examples
along with novel proofs for several interesting facts.
The focus of the current book is on how these AMMs, especially
Uniswap v3, can be leveraged to create perpetual options. While
the previous book lays the groundwork by explaining how AMMs
operate and the mathematical principles behind them, this book
will build upon that foundation. We will briefly recap the most
important points from the previous book and then dive into the
application of AMMs in the context of perpetual options, providing
a bridge between theory and practice.
For those who are new to the topic, I recommend starting with
my book on AMMs2 to get a comprehensive understanding of the
fundamental theories. For readers familiar with the basics, we will
summarize the key concepts here before exploring the innovative ap-
plications in creating perpetual options. This structured approach
ensures a seamless transition from theory to practical implementa-
tion, providing a holistic view of AMMs and their potential in the
financial landscape.
## 2.2 Ticks
In Uniswap v3, liquidity is provided within a specified price range,
divided into discrete units known as ticks. Each tick represents
a 0.01% price movement from its neighbor. Ticks are indexed by
integers i and can be expressed in terms of price P as follows:
P(i) = 1.0001i
or i = log1.0001 P (2.1)
Ticks cover all possible prices between P(−223) and P(223 − 1),
encompassing nearly all potential prices in the asset space.
Uniswap v3 maintains the constant product formula used in
Uniswap v2. In a Uniswap v2 pool, the balances A and B of the
2
Automated Market Makers - A Practical Guide to Decentralized Exchanges
and Cryptocurrency Trading co-authored with M. Ottina and P. J. Steffensen.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.2. Ticks 11
two tokens X and Y satisfy:
A · B = L2
(2.2)
where L is the liquidity parameter. The spot price p of token X in
terms of token Y is given by B
A. Therefore, we can express A and
B in terms of L and
√
p as follows:
A =
L
√
p
and B = L ·
√
p (2.3)
These variables L and
√
p track the state of the pool in Uniswap
v3, where:
√
p(i) = 1.0001
i
2 (2.4)
The tick index associated with any price p is the greatest tick t
such that t ≤ p. Hence, the tick index i is given by:
i = ⌊log1.0001 p⌋ = ⌊2log1.0001
√
p⌋ (2.5)
where ⌊x⌋ denotes the floor function, which returns the greatest
integer less than or equal to x.
## 2.2.1 Tick Spacing
Uniswap v3 does not allow arbitrary tick indexes; it introduces tick
spacing to define the separation between allowed tick indexes. Only
multiples of the tick spacing are permitted. For example, if the tick
spacing is 5, only tick indexes like ...,−10,−5,0,5,10,... can be
used.
Tick spacing is fixed when the pool is created. Smaller tick
spacing allows for more precise ranges but increases gas fees, as
new values for certain variables need to be set whenever the price
crosses an initialized tick.
ELI5: Tick Spacing in Uniswap V3
Imagine you have a long ruler, and you want to mark specific points
on it to measure different lengths. But instead of marking every
single millimeter, you decide to only mark every centimeter. This
way, you have fewer marks to keep track of, but you can still mea-
sure most things accurately.
In Uniswap V3, the ruler is like the price range of a cryptocur-
rency, and the marks are called ticks. Here’s how it works:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com12 Chapter 2. Uniswap v3 Recap
• Ticks: Ticks are like the marks on your ruler. They represent
specific price points in the Uniswap V3 pool.
• Tick Spacing: Tick spacing is the distance between these
marks. Instead of having a mark for every possible price,
Uniswap V3 only allows marks (ticks) at certain intervals.
For example, if the tick spacing is 10, you can only have ticks
at prices like 100, 110, 120, and so on.
• Multiple Prices Per Tick: Because of this spacing, mul-
tiple prices can fall into the same tick. For instance, prices
101, 102, and 109 might all correspond to the tick at 100.
• Why Use Tick Spacing?: By using tick spacing, Uniswap
V3 makes it easier and cheaper to manage the pool. If there
were too many ticks (marks), it would be more complicated
and expensive to keep track of all the prices and trades.
• Choosing the Right Tick Spacing: The tick spacing is
chosen based on how much trading you expect and how pre-
cise you want to be. Smaller tick spacing means more precise
pricing but higher costs. Larger tick spacing means less pre-
cision but lower costs.
So, tick spacing in Uniswap V3 is like deciding how often to
put marks on a ruler to balance between being precise and keeping
things simple and affordable. Multiple prices can correspond to the
same tick, making it a bit easier to manage.
## 2.3 Liquidity Providers’ Position
Consider a Uniswap v3 pool with tokens X and Y . When we refer
to price, we mean the price of token X in terms of token Y . A
liquidity provider can choose to provide liquidity within a specific
price range [pa,pb]. Within this range, the provider’s assets are
used for trading. If the price falls below pa, the provider’s position
converts entirely to token X. If the price rises above pb, it converts
entirely to token Y , leaving the provider with the less valuable asset
in both cases.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.3. Liquidity Providers’ Position 13
Table 2.1: Formulae for the real balances of a Uniswap v3 position.
This table shows how the real balances of tokens X and Y vary
based on the price range. The real balance of token X decreases
as the price p increases within the specified range [pa,pb], while the
real balance of token Y increases within the same range. When the
price p falls outside this range, the liquidity provider’s position is
fully converted into one of the tokens.
Price Range Real Balance of Token X Real Balance of Token Y
p ≤ pa
L √
pa
− L √
pb
0
pa ≤ p ≤ pb
L √
p − L √
pb
L
√
p − L
√
pa
p ≥ pb 0 L
√
pb − L
√
pa
Uniswap v3 introduces virtual reserves (xv, yv) and real reserves
(x, y) for tokens X and Y . Virtual reserves satisfy:
xv · yv = L2
and
yv
xv
= p (2.6)
where p is the spot price. Virtual reserves define a virtual pool
state (xv,yv), although real reserves might differ. The relationship
between real and virtual reserves is:
xv = x +
L
√
pb
yv = y + L
√
pa
At a spot price p, since yv
xv
= p and xvyv = L2, we have:
xv =
L
√
p
and yv = L
√
p (2.7)
If p < pa, the balances are as they were at p = pa, and if p > pb,
the balances are as they were at p = pb. These are summarized in
Table 2.1.
2.3.1 LP Position Value
Consider a Uniswap v3 pool with tokens X and Y . A liquidity
provider enters the pool at price p0 within the range [pa,pb]. We
derive the LP position value at price p based on the entry price p0.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com14 Chapter 2. Uniswap v3 Recap
## 2.3.2 Open Position (Entry State)
The initial balances x0 and y0 at the entry state are derived from
Table 2.1:
x0 =

  
  
L ·
√
pb−
√
pa
√
pa·
√
pb
if p0 ≤ pa
L ·

1 √
p0
− 1 √
pb

if pa < p0 < pb
0 if p0 ≥ pb
(2.8)
y0 =

 
 
0 if p0 ≤ pa
L ·
√
p0 −
√
pa

if pa < p0 < pb
L ·
√
pb −
√
pa

if p0 ≥ pb
(2.9)
## 2.3.3 The LP Position at Price p
We find the token amounts xp and yp at a future price p, divided
into components based on the current and entry state (p, p0, x0,
y0). The entry state component ∆0 in base token X is defined as
∆0 =

  
  
x0 if p0 ≤ pa,
x0 ·
q
p0
pa
·
√
pb−
√
pa
√
pb−
√
p0
if pa < p0 < pb,
y0 √
papb
if p0 ≥ pb.
(2.10)
The analysis is divided into three cases depending on the loca-
tion of the current price p.
Case p ≤ pa
From Table 2.1, we have yp = 0 and the real balance of token X is:
xp = L ·
√
pb −
√
pa
√
pa ·
√
pb
(2.11)
Considering different entry prices p0:
• If p0 ≤ pa, then xp = x0.
• If pa < p0 < pb, isolating L from the formula for x0:
xp = x0 ·
√
pbp0
√
pb −
√
p0
·
√
pb −
√
pa
√
pa ·
√
pb
= x0 ·
r
p0
pa
·
√
pb −
√
pa
√
pb −
√
p0
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.3. Liquidity Providers’ Position 15
• If p0 ≥ pb, then xp = y0 √
papb
.
In other words, xp = ∆0.
Case pa < p < pb
From Table 2.1, the real balances are:
xp = L ·

1
√
p
−
1
√
pb

= L ·
√
pb −
√
p
√
p · pb
,
yp = L · (
√
p −
√
pa).
Considering different entry prices p0:
• If p0 ≤ pa, then
xp = x0 ·
r
pa
p
·
√
pb −
√
p
√
pb −
√
pa

(2.12)
• If pa < p0 < pb, then
xp = x0 ·
√
pbp0
√
pb −
√
p0
·
√
pb −
√
p
√
p · pb
= x0 ·
r
p0
pa
·
√
pb −
√
pa
√
pb −
√
p0
·
r
pa
p
·
√
pb −
√
p
√
pb −
√
pa
• If p0 ≥ pb, then
xp =
y0
√
papb
·
√
pb −
√
p
√
p · pb
=
y0
√
papb
·
r
pa
p
·
√
pb −
√
p
√
pb −
√
pa
Summarizing, xp = ∆0 ·
q
pa
p ·
√
pb−
√
p
√
pb−
√
pa
.
Next, consider yp for different entry prices p0:
• If p0 ≤ pa, then
yp = x0 ·
√
papb
√
pb −
√
pa
· (
√
p −
√
pa)
= x0 ·

√
papb ·
√
p −
√
pa
√
pb −
√
pa

Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com16 Chapter 2. Uniswap v3 Recap
• If pa < p0 < pb, then
yp = x0 ·
√
pbp0
√
pb −
√
p0
· (
√
p −
√
pa)
= x0 ·
r
p0
pa
·
√
pb −
√
pa
√
pb −
√
p0
·
√
papb ·
√
p −
√
pa
√
pb −
√
pa
• If p0 ≥ pb, then
yp =
y0
√
pb −
√
p0
· (
√
p −
√
pa)
=
y0
√
papb
·
√
papb ·
√
p −
√
pa
√
pb −
√
pa
Summarizing, yp = ∆0 ·
√
papb ·
√
p−
√
pa
√
pb−
√
pa
.
Case p ≥ pb
From Table 2.1, the real balance of token X is xp = 0 and the real
balance of token Y is:
yp = L · (
√
pb −
√
pa) (2.13)
Considering different entry prices p0:
• If p0 ≤ pa, then
yp = x0
√
papb (2.14)
• If pa < p0 < pb, then
yp = x0 ·
√
pbp0
√
pb −
√
p0
· (
√
pb −
√
pa)
= x0 ·
r
p0
pa
·
√
pb −
√
pa
√
pb −
√
p0
·
√
papb
• If p0 ≥ pb, then yp = y0.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.3. Liquidity Providers’ Position 17
## 2.3.4 Summary
We summarize our findings: The token amounts of X and Y in an
LP position as a function of the price p and entry state x0, y0, p0
are:
xp =

  
  
∆0 if p ≤ pa,
∆0 ·
q
pa
p ·
√
pb−
√
p
√
pb−
√
pa
if pa < p < pb,
0 if p ≥ pb.
(2.15)
yp =

 
 
0 if p ≤ pa,
∆0 ·
√
papb ·
√
p−
√
pa
√
pb−
√
pa
if pa < p < pb,
∆0 ·
√
papb if p ≥ pb.
(2.16)
Moreover, the position value at price p in terms of token Y
becomes:
V (p) = yp + p · xp (2.17)
Remark 2.1. Note that ∆0 is measured in token X and represents
the highest possible amount of token X for the position when the
position consists entirely of token X:
∆0 = L ·

1
√
pa
−
1
√
pb

= L ·
√
papb
√
pb −
√
pa
(2.18)
## 2.3.5 Example
Consider a Uniswap v3 pool with the following parameters3:
Tokens DAI [7] ETH
Balances 40000 10
The entry price is p0 = 4000 and a liquidity provider aims to
provide 1 ETH worth of liquidity in the price range [1499.8709,4499.7603].
The lower and upper tick indices are 73135 and 84122, respectively.
From the formula for x0, we find L = 1106.35. Using Remark 2.1
and the given price range, we compute:
∆0 = 12.07 (2.19)
3
DAI is a type of cryptocurrency known as a stablecoin, which means its
value is designed to remain stable, unlike other cryptocurrencies that can be
very volatile. DAI is created and maintained by a system called MakerDAO,
which is a decentralized platform built on the Ethereum blockchain.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com18 Chapter 2. Uniswap v3 Recap
The amount of DAI to deposit at entry point is:
y0 = L · (
√
p0 −
√
pa) = 27124.8 (2.20)
Using the formulas for xp and yp, we can find the position value
at any price p. Graphically, the total position value V (p) as a
function of p is shown in Figure 2.1.
## 2.4 Capital Efficiency
ELI5: Capital Efficiency Difference Between Uniswap
V2 and V3
Imagine you have a lemonade stand, and you want to make the most
money possible. You have a choice between two different setups:
one is a simple stand (like Uniswap V2), and the other is a fancy
stand with some special features (like Uniswap V3).
• Uniswap V2 (Simple Stand):
– At your simple stand, you just put all your lemons and
sugar into a big pitcher and make lemonade.
– You can’t control how much lemonade you sell at dif-
ferent prices. You just hope that people come and buy
your lemonade.
– Your profits depend on how many people come by and
buy your lemonade, but you can’t adjust anything to
make it more efficient.
• Uniswap V3 (Fancy Stand):
– At your fancy stand, you can do something special: you
can decide to put your lemons and sugar into smaller
pitchers and set them at different prices.
– For example, you can make one small pitcher of lemon-
ade for people who want to pay $1, another small pitcher
for people who want to pay $2, and so on.
– This way, you can focus your ingredients (lemons and
sugar) where you think more people will buy, making
sure you make the most money possible.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.4. Capital Efficiency 19
Figure 2.1: Graph illustrating the value V (p) of a liquidity
provider’s position in a Uniswap v3 pool as a function of the price p.
The position value changes based on whether the price p is below,
within, or above the specified price range [pa,pb]. The green line
represents the maximum value when the price p exceeds the upper
boundary pb, while the red line shows the value when the price p is
below the lower boundary pa. The blue curve depicts the position
value within the range [pa,pb], reflecting the continuous adjustment
of the liquidity provider’s assets as the price fluctuates within this
interval.
– Because you can concentrate your resources where they’ll
be most effective, you end up making more money with
the same amount of lemons and sugar.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com20 Chapter 2. Uniswap v3 Recap
Capital Efficiency
• Uniswap V2 is like the simple stand. It’s straightforward
but not very efficient because you can’t adjust your setup
based on demand.
• Uniswap V3 is like the fancy stand. It’s more complex
but much more efficient because you can concentrate your
resources where they’ll make the most profit.
In technical terms:
• Uniswap V2 uses liquidity (your lemons and sugar) spread
out evenly, so it’s less efficient.
• Uniswap V3 lets you concentrate liquidity in specific price
ranges, so you get more out of the same amount of liquidity.
With that, let us get more technical. In this section, we assume
that the entry price p0 is the geometric mean of the price range
boundaries, i.e., the range [pa,pb] is chosen such that
√
papb = p0.
Under this assumption, the amounts of tokens needed to provide
liquidity in a Uniswap v3 pool will satisfy the deposit requirements
of a Uniswap v2 pool.
Using algebra, we find:
p = pa
r
pb
pa
and pb = pa
r
pb
pa
2
(2.21)
This means that if the entry price p0 is 20% higher than pa,
then pb is 20% higher than p0.
The deposited amounts A and B of tokens X and Y in a
Uniswap v3 pool are found from Table 2.1:
A = L

1
√
p0
−
1
√
pb

and B = L(
√
p0 −
√
pa) (2.22)
We verify if these amounts satisfy the deposit requirements of
a Uniswap v2 pool:
B
A
=
L(
√
p0 −
√
pa)
L

1 √
p0
− 1 √
pb
 =
√
p0 −
√
p0
√
r
1 √
p0
− 1 √
p0
√
r
=
√
p0

1 − 1 √
r

1 √
p0

1 − 1 √
r
 = p0
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.4. Capital Efficiency 21
where r =
q
pb
pa
. Thus, we can deposit amounts A and B into a
Uniswap v2 pool, with the liquidity parameter:
L2 =
√
AB (2.23)
The capital efficiency of a Uniswap v3 position is the ratio of the
liquidity parameter in Uniswap v3 to a similar Uniswap v2 position:
L
L2
=
L
√
AB
=
L
r
L

1 √
p0
− 1 √
r
√
p0

L(
√
p0 −
√
pa)
=
1
r
1 √
p0
− 1 √
r
√
p0
√
p0 −
√
p0
√
r

=
1
r
1 √
p0

1 − 1 √
r
√
p0

1 − 1 √
r
 =
1
r
1 − 1 √
r
2
=
1
1 − 1 √
r
=
1
1 −

pa
pb
1
4
Example 2.2. In Table 2.2, we show the values of the quotient L
L2
for different values of the parameter r, along with the corresponding
values of the quotient pb
pa
.
For instance, if r = 1.1, then pb = 1.21pa, meaning that price pb
is 21% higher than price pa. In this interval, the liquidity parameter
of a Uniswap v3 position is approximately 21.5 times higher than
the liquidity parameter of the same deposit into a Uniswap v2 pool.
If r = 1.05, then pb = 1.1025pa, and thus pb is approximately
10% higher than pa. In this case, the liquidity parameter of a
Uniswap v3 position is approximately 41.5 times higher than that
of the same deposit into a Uniswap v2 pool. As expected, if the
interval in which liquidity is deposited is smaller, then the liquidity
parameter will be bigger since providing the same amount of tokens
for a smaller interval implies more concentrated liquidity.
Of course, we must remember that a smaller interval increases
the likelihood of the price falling outside that interval. When the
price goes out of the interval, the liquidity provider stops earning
trading fees.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com22 Chapter 2. Uniswap v3 Recap
Table 2.2: Comparison of the capital efficiency of Uniswap v3 and
Uniswap v2. The table shows the ratio of liquidity parameters L
L2
for different values of the parameter r, which determines the price
range boundaries pa and pb. Higher values of L
L2
indicate greater
capital efficiency in Uniswap v3 compared to Uniswap v2.
r pb
pa
L
L2
1.005 1.010025 401.5
1.01 1.0201 201.5
1.05 1.1025 41.5
1.1 1.21 21.5
1.2 1.44 11.5
2 4 3.41
10 100 1.46
100 10000 1.11
## 2.5 Conclusion
Uniswap v3 marks a significant leap forward in decentralized fi-
nance by allowing liquidity providers to allocate their capital more
efficiently through the concept of concentrated liquidity. This inno-
vation not only increases capital efficiency but also offers a higher
degree of customization for liquidity providers, enabling them to
choose specific price ranges that align with their strategies and risk
tolerance.
By introducing the mechanisms of ticks and tick spacing, Uniswap
v3 provides a more granular approach to liquidity provision, allow-
ing for precise control over liquidity deployment. This detailed
framework enhances the potential for optimized returns while si-
multaneously introducing new complexities and considerations, such
as managing liquidity when prices move outside the selected range.
The ability to provide liquidity in a specified range transforms
the traditional liquidity provision model, offering significant advan-
tages over Uniswap v2. However, this comes with the necessity for
liquidity providers to carefully monitor and adjust their positions
to maintain effectiveness and profitability.
The in-depth exploration of Uniswap v3’s liquidity mechanics,
including the relationship between virtual and real reserves, the cal-
culation of liquidity provider positions, and the impact of capital
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com2.5. Conclusion 23
efficiency, equips us with a comprehensive understanding of this ad-
vanced protocol. These foundational concepts are crucial as we dive
deeper into the practical applications and strategic implications of
Uniswap v3 in subsequent chapters.
As we move forward in this book, we will build on the principles
outlined in this chapter to explore more advanced strategies, an-
alyze real-world scenarios, and understand how these innovations
can be leveraged to optimize trading and liquidity provision in de-
centralized finance. Uniswap v3 represents not just an incremental
improvement, but a paradigm shift in how liquidity is managed
and deployed in DeFi, setting the stage for the next generation of
financial applications.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com24 Chapter 2. Uniswap v3 Recap
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comChapter 3
Uniswap V3 Options
## 3.1 Single Tick Uniswap V3 Positions
Consider a Uniswap V3 liquidity pool having two tokens, X and Y .
For simplicity, we will assume that X is ETH and Y is DAI. The
price p will refer to the price of 1 ETH in terms of DAI.
An interesting and special case from the theory of Uniswap V3
is where the deposited liquidity is narrowed to a single tick t. This
means a one-tick wide position with a liquidity price range [t,t′],
where t′ > t is t’s nearest neighbor tick. This single tick position
supports trades where the price moves within tick t.
Remark 3.1. Although we refer to this position as a single tick
position, note that two neighboring ticks are involved in defining
the price range. However, all prices in the price range are associated
with tick t according to (2.5).
Suppose that an amount of 1 ETH is deposited in a single tick
Uniswap V3 position at a price p < t. From Table 2.1, it follows
that only ETH tokens are deposited, and the following relation
holds:
1 = L ·

1
√
t
−
1
√
t′

= L ·
√
t′ −
√
t
√
tt′
where L is the liquidity parameter. For p ≥ t′, the amount of ETH
tokens is fully converted into DAI tokens. From the above relation,
the converted DAI amount becomes L·(
√
t′ −
√
t) =
√
tt′, as shown
in Table 2.1.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com26 Chapter 3. Uniswap V3 Options
To summarize, outside the one-tick wide interval [t,t′], the real
token balances xp,yp at a price p of the Uniswap V3 position are
either 100% ETH or 100% DAI:
xp =
(
1 ETH if p < t,
0 ETH if p ≥ t′
yp =
(
0 DAI if p < t,
√
tt′ DAI if p ≥ t′
The amount of 1 ETH is converted into
√
tt′ DAI when the price
moves from t → t′. For prices within the narrow range [t,t′], the
position is distributed among both ETH and DAI.
If the 1 ETH single tick position is deployed at tick t = 3999.742678
(tick index = 82944), then the position value V (p) = yp+p·xp mea-
sured in DAI can be viewed as a function of the price p:
Figure 3.1: Value of the single tick position as a function of price
p.
Remark 3.2. Although it seems that the value function is a straight
linear followed by a constant function, the nature of a Uniswap
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.1. Single Tick Uniswap V3 Positions 27
V3 position is a bit more complex. Up to t = 3999.742678, the
value function follows a straight line, then a curved
√
p dependency
between t = 3999.742678 and t′ = 4000.142653, and finally, above
price t′, the function is a constant equal to
√
tt′ = 3999.9427.
In the next sections, we continue the example with a single tick
Uniswap V3 ETH–DAI position. We also keep the notation of ticks
t and t′ with their definitions.
## 3.1.1 Covered Call vs. Single Tick Position
ELI5: Covered Call
Imagine you have a collection of baseball cards that you think might
go up in value, but you’re not sure. You want to make some extra
money from them while you wait to see what happens. Here’s how
you can do that with a covered call:
• Owning the Cards (Asset):
– You already own a bunch of baseball cards (your asset),
and you think they might be worth more in the future.
• Selling a Promise (Call Option):
– You make a promise to someone else: If they give you
some money now, you’ll sell them your baseball cards
at a set price (the strike price) by a certain date (the
expiration date).
– This promise is called a “call option.” The money they
give you now is called the “premium.”
• Making Extra Money (Premium):
– By selling this call option, you get to keep the premium,
which is like extra money in your pocket.
– This works even if the baseball cards don’t go up in
value.
• Two Possible Outcomes:
– If the cards go up in value: By the expiration date, if
your baseball cards are worth more than the strike price,
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com28 Chapter 3. Uniswap V3 Options
the person who bought the call option will want to buy
them from you at the lower strike price. You still make
money because you sold them at the agreed price and
you got to keep the premium.
– If the cards don’t go up in value: If the cards are
worth less than or equal to the strike price by the expi-
ration date, the person who bought the call option won’t
buy them from you. You still get to keep the baseball
cards and the premium.
So, a covered call is a way to make extra money from something
you already own, by selling the right to buy it at a certain price in
the future.
Now consider a 1 ETH single tick position at price p ≤ t. The
real balances for the position are given as in Table 2.1, applying
boundaries pa = t and pb = t′. If the deposited amount for p ≤ t is
1 ETH, then we have
1 = L ·

1
√
t
−
1
√
t′

which gives us √
tt′ = L · (
√
t′ −
√
t).
The right-hand side is the exact amount of DAI in our position for
prices ≥ pb = t′, again applying Table 2.1. Set
k :=
√
tt′.
To summarize, when the price p crosses tick t and moves from
t → t′, the position amounts are converted from 1 ETH to k DAI,
which is the real balance for prices in [t′,∞).
This behavior is similar to a covered call strategy, where an
investor sells an out-of-the-money call option on an asset that is
part of their portfolio. If you hold 1 ETH and write an out-of-the-
money call option on selling 1 ETH at an agreed price of k DAI,
close to the expiration time we can argue that: If the ETH price in
DAI stays below k, then the option is worthless, and the portfolio
value is just 1 ETH plus the option premium. If the ETH price
exceeds k DAI, then the option becomes in-the-money, and 1 ETH
is sold at the agreed price of k DAI; the total portfolio value for
p > k remains constant, equal to k DAI plus the option premium.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.1. Single Tick Uniswap V3 Positions 29
This behavior is very similar to the single tick Uniswap V3 position
value as a function of p in Figure 3.1.
## 3.1.2 Cash-Secured Put vs. Single Tick Position
ELI5: Cash-Secured Put
Imagine you have some money and you’re thinking about buying
a new toy, but only if it gets cheaper. You can make some extra
money while you wait for the price to drop by selling a promise to
buy the toy at a lower price. Here’s how it works:
• Having the Money (Cash):
– You have some money set aside (cash) and you’re ready
to buy the toy if the price drops.
• Selling a Promise (Put Option):
– You make a promise to someone else: If they give you
some money now, you’ll agree to buy the toy from them
at a set price (the strike price) by a certain date (the
expiration date).
– This promise is called a “put option.” The money they
give you now is called the “premium.”
• Making Extra Money (Premium):
– By selling this put option, you get to keep the premium,
which is like extra money in your pocket.
– This works even if the toy’s price doesn’t drop.
• Two Possible Outcomes:
– If the toy’s price drops: By the expiration date, if
the toy’s price drops below the strike price, the person
who bought the put option will want to sell it to you at
the higher strike price. You still make money because
you get the toy at the agreed price and you got to keep
the premium.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com30 Chapter 3. Uniswap V3 Options
– If the toy’s price doesn’t drop: If the toy’s price is
higher than or equal to the strike price by the expiration
date, the person who bought the put option won’t sell
it to you. You still get to keep your money and the
premium.
So, a cash-secured put is a way to make extra money from your
cash by selling the right for someone else to sell you a toy (or any
asset) at a certain price in the future.
Next, we consider a 1 ETH single tick position at a price p ≥
t′. In this scenario, the position consists entirely of DAI tokens.
As the price p crosses tick t′ (moving from higher prices to lower
prices), the amount of DAI in the position starts to convert into
ETH tokens.
If we deposit k =
√
tt′ DAI tokens at an entry price p ≥ t′, then
from the balances in Table 2.1 and the following observation:
√
tt′ = L · (
√
t′ −
√
t) =⇒ 1 = L ·

1
√
t
−
1
√
t′

we can deduce that the DAI amount converts to exactly 1 ETH
when p ≤ t. Recall that we have defined k :=
√
tt′ as the geometric
mean of the ticks t and t′.
To summarize, as the price p crosses tick t′ and moves from
t′ → t, the position amounts are converted from k DAI to 1 ETH,
which is the real balance for prices in the range [t′,∞).
This behavior is analogous to a cash-secured put strategy, where
an investor sells an out-of-the-money put option on an asset and
holds enough cash to buy the asset if the option is exercised. Con-
sider holding k DAI and writing a put option to buy 1 ETH at an
agreed price of k DAI. Close to the expiration time, we can argue
that:
• If the ETH price in DAI stays above k, the option is worthless,
and the portfolio value remains as the cash holdings of k DAI
plus the option premium.
• If the ETH price falls below k DAI, the option becomes in-
the-money, and the k DAI is used to buy ETH at the agreed
price (here exactly 1 ETH). The total portfolio value for p < k
becomes 1 ETH plus the option premium.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.1. Single Tick Uniswap V3 Positions 31
This behavior is very similar to the single tick Uniswap V3
position value as a function of p shown in Figure 3.1. When the
price is above k, the position is fully in DAI. As the price drops
below k, the position starts converting to ETH, and below the lower
tick t, the position consists entirely of ETH, similar to the payout
profile of a cash-secured put option.
3.1.3 LP Tokens
ELI5: LP Tokens
Imagine you have a lemonade stand with your friend, and you both
want to keep track of how much money each of you has put in and
earned. Here’s how you can do that with something called ”LP
tokens”:
• Setting Up the Stand Together:
– You and your friend both put in some money to buy
lemons, sugar, and cups for your lemonade stand.
– You decide to keep track of how much each of you con-
tributed by giving each other special tickets called ”LP
tokens.”
• LP Tokens as Receipts:
– These LP tokens are like receipts that show how much
money each of you put into the stand.
– If you put in more money, you get more LP tokens. If
your friend puts in more money, they get more LP to-
kens.
• Earning Money:
– When customers buy lemonade, the money you earn goes
into a big jar.
– At the end of the day, you look at how many LP tokens
each of you has to figure out how to split the money in
the jar.
• Getting Your Money Back:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com32 Chapter 3. Uniswap V3 Options
– If you ever want to take your money out of the lemonade
stand, you give back your LP tokens, and you get your
share of the money based on how many LP tokens you
have.
• Example:
– You and your friend each put in $10, so you each get 10
LP tokens.
– If the lemonade stand makes $40, you both have a total
of 20 LP tokens.
– You each get half of the $40 because you both have the
same number of LP tokens.
So, LP tokens are like special tickets that keep track of how
much money you and your friend have put into and earned from
your lemonade stand.
Now, single tick LP tokens replicate the behavior of assets in
a covered call or a cash-secured put strategy when they are sold
close to or at expiration. In Sections 3.1.1 and 3.1.2, we mimicked
the payoff of a covered call or a cash-secured put by deploying a
single tick position at a current price below t or above t′. For
simplicity, we will not distinguish between t and t′ when discussing
single tick positions but instead collapse the ticks into one price –
the geometric mean k.
That means if the price p is ≤ k, then a 1 ETH amount deployed
almost mimics the behavior of a covered call holding 1 ETH and
selling a call option on ETH-DAI with a DAI strike price of k (close
to or at option expiration). Similarly, a single tick LP position
replicates how assets are bought in a cash-secured put.
However, there are some properties of LP tokens that are very
different from traditional financial instruments like covered calls or
cash-secured puts:
• LP tokens have no expiration date; you hold them until you
plan to burn them. Unlike European call and put options,
there is no fixed expiration time for LP tokens.
• For classical options, the conversion between tokens happens
instantaneously when the price crosses the strike price k. In
contrast, for a single tick position, where the price crosses
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.1. Single Tick Uniswap V3 Positions 33
the one-tick wide range [t,t′], the token conversion occurs
continuously.
• Conversion between tokens/assets is done automatically dur-
ing trading activity and can happen multiple times. This is
not limited to the expiration time as with ordinary options.
If we continue the analogy to option theory, should we then
price single tick positions using a standard Black-Scholes model
[6]? The analytic Black-Scholes (BS) price model for options only
applies to options with a fixed expiration and an implied volatility
(reflecting the future price change of the underlying asset). While
the BS model estimates the expected return at expiration time for
options, the expected return for single tick positions is the accrued
fee earnings from trading activity within the liquidity range. Every
time prices cross the liquidity range, the entire position is activated
and fees are collected.
In a 3% pool, each LP token earns a proportional fee on all
amounts entering the pool for trades made within the liquidity
range. Moreover, fee earnings can occur multiple times if the price
leaves and re-enters the range many times. The illustration in Fig-
ure 3.1.3 shows how a single tick liquidity position accumulates fees
each time the price crosses the price range.
Figure 3.2: Fee accumulation for a single tick position.
It is important to note that the analysis carried out in this
section applies to any token pair X,Y . We explicitly defined X
and Y as ETH and DAI, respectively, for clarity.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com34 Chapter 3. Uniswap V3 Options
In this work, we have highlighted the similarities between Uniswap
V3 single tick positions and traditional financial instruments such
as covered call or cash-secured put options. However, there are
unique aspects to LP tokens that warrant further investigation.
Unlike traditional options, LP tokens never expire and thus be-
have like perpetual covered call or secured put options. The option
premium in traditional finance is theoretically computed as the ex-
pected return for the option payoff. For LP tokens, the expected
return is akin to the accrued fees, which require a detailed under-
standing.
Each time the current price crosses the single tick, a propor-
tional fee is taken on the input trading amount. This characteristic
differentiates LP tokens from their traditional counterparts and in-
troduces new dynamics in terms of fee accumulation and return on
investment. Understanding these dynamics is crucial for accurately
estimating the potential returns for liquidity providers.
Future work should focus on several key areas to deepen our
understanding of LP tokens and their behavior:
• Fee Accumulation Analysis: A thorough analysis of the
fee accumulation process is needed. This includes quantifying
the fees collected each time the price crosses the single tick
and understanding how these fees contribute to the overall
return for the LP position.
• Price Crossing Frequency: Developing a theoretical model
to estimate the number of times the price is expected to
cross a single tick. This will involve analyzing historical price
data, understanding market volatility, and employing statis-
tical methods to predict future price movements.
• Expected Return Calculation: With a model for price
crossing frequency and fee accumulation, we can estimate the
total accumulated fees within a liquidity range. This will
allow us to compute the expected return for a single tick LP
position over different time horizons and market conditions.
• Comparative Analysis with Traditional Options: Con-
ducting a comparative analysis of the returns from LP tokens
versus traditional covered calls and cash-secured puts. This
will help in understanding the advantages and potential draw-
backs of using LP tokens as a perpetual financial instrument.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 35
• Risk Assessment: Evaluating the risks associated with sin-
gle tick LP positions, including market risk, liquidity risk,
and the impact of extreme price movements. Developing
strategies to mitigate these risks will be essential for liquidity
providers.
• Algorithmic Trading and Automation: Exploring the
potential for algorithmic trading strategies that can optimize
fee collection and manage liquidity across multiple ticks. Au-
tomation can enhance the efficiency and profitability of LP
positions.
By addressing these areas, we can gain a deeper understanding
of the mechanics and potential of Uniswap V3 LP tokens. This will
not only help in refining the theoretical models but also provide
practical insights for liquidity providers looking to maximize their
returns.
3.2 A Touch of Classical Option Theory
ELI5: Classical Option Theory
Imagine you’re at a fair, and you see a game where you can buy a
ticket that gives you the right to win a prize. There are two types
of tickets you can buy: call options and put options. Let’s break it
down:
Call Options
• Buying a Call Option:
– You see a stuffed animal that you really want, but you’re
not sure if you should buy it now or later.
– You buy a call option ticket for a small price (premium).
This ticket gives you the right to buy the stuffed animal
at a set price (strike price) anytime before a certain date
(expiration date).
• Two Possible Outcomes:
– If the stuffed animal’s price goes up: If the price
of the stuffed animal goes higher than the strike price
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com36 Chapter 3. Uniswap V3 Options
before the expiration date, you can use your ticket to
buy it at the lower strike price. You save money because
you bought the right to buy it cheaper.
– If the stuffed animal’s price doesn’t go up: If the
price stays the same or goes down, you don’t have to use
your ticket. You don’t buy the stuffed animal, but you
lose the small amount of money you paid for the ticket
(premium).
Put Options
• Buying a Put Option:
– You have a toy that you think might lose value, but
you’re not sure.
– You buy a put option ticket for a small price (premium).
This ticket gives you the right to sell your toy at a set
price (strike price) anytime before a certain date (expi-
ration date).
• Two Possible Outcomes:
– If the toy’s price goes down: If the price of the toy
drops below the strike price before the expiration date,
you can use your ticket to sell it at the higher strike
price. You get more money for the toy than it’s worth
on the market.
– If the toy’s price doesn’t go down: If the price
stays the same or goes up, you don’t have to use your
ticket. You keep the toy, but you lose the small amount
of money you paid for the ticket (premium).
Black-Scholes Formula
In the world of classical options, there’s a special formula called
the Black-Scholes formula. It helps you figure out how much these
option tickets (call and put options) should cost based on several
factors:
• Current Price: The price of the stuffed animal or toy right
now.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 37
• Strike Price: The price at which you can buy (call) or sell
(put) the stuffed animal or toy.
• Time to Expiration: How long you have before the option
ticket expires.
• Volatility: How much the price of the stuffed animal or toy
is expected to move up or down.
• Risk-Free Rate: The interest rate you’d earn if you put
your money in a safe place like a bank.
The Black-Scholes formula uses all these factors to calculate the
fair price of the call or put option ticket.
In Section 3.1, we explored how a single tick LP position behaves
similarly to a covered call or a cash-secured put option. Let’s briefly
refresh this concept. Let t be a tick in the tick space and let p be
the current price. We define t′ as the nearest neighbor tick greater
than t, that is:
t′
= min{j ∈ Tick space : j > t}.
A single tick position at tick t is a Uniswap V3 position where
liquidity is deployed in the narrow one-tick wide range [t,t′]. Set
k :=
√
tt′ – the geometric mean of t and t′.
Assume that the tokens in our pool are X = ETH and Y =
DAI. If p ≤ k, then a 1 ETH single tick position has a similar
payoff structure to a covered call option on ETH/DAI with a strike
price of k. Similarly, for p ≥ k, a single tick position using an
amount of k DAI has a similar payoff structure to a cash-secured
put option on ETH/DAI with a strike price of k.
## 3.2.1 Covered Call Analogy
When p ≤ k, deploying 1 ETH in a single tick position mimics the
behavior of a covered call strategy. In a covered call, an investor
holds the underlying asset (in this case, ETH) and sells a call option
with a strike price of k. The potential outcomes are as follows:
• If the price of ETH remains below k, the call option expires
worthless, and the investor retains their ETH, plus any pre-
mium received from selling the option.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com38 Chapter 3. Uniswap V3 Options
• If the price of ETH rises above k, the option is exercised, and
the investor sells their ETH at the strike price, effectively
capping their maximum gain.
In the context of a single tick Uniswap V3 position, if the price
remains below k, the position retains its ETH. As the price moves
through the tick range [t,t′], the position gradually converts to
DAI, similar to how the covered call option is exercised as the price
crosses the strike price.
## 3.2.2 Cash-Secured Put Analogy
When p ≥ k, deploying k DAI in a single tick position mirrors the
behavior of a cash-secured put strategy. In a cash-secured put, an
investor holds enough cash to purchase the underlying asset (ETH)
if the option is exercised. The potential outcomes are:
• If the price of ETH remains above k, the put option expires
worthless, and the investor retains their cash, plus any pre-
mium received from selling the option.
• If the price of ETH falls below k, the option is exercised, and
the investor buys ETH at the strike price, effectively acquiring
the asset at a lower price.
In a single tick Uniswap V3 position, if the price remains above k,
the position retains its DAI. As the price moves through the tick
range [t,t′], the position gradually converts to ETH, similar to how
the cash-secured put option is exercised as the price crosses the
strike price.
## 3.2.3 Theoretical Implications
The analogies to covered calls and cash-secured puts provide a use-
ful framework for understanding the behavior of single tick Uniswap
V3 positions. However, there are significant differences to consider:
• No Expiration: Unlike traditional options, LP tokens have
no expiration date. This perpetual nature means that the
position can continually generate returns as long as it remains
active.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 39
• Continuous Conversion: The conversion between tokens
happens continuously as the price moves through the tick
range, rather than instantaneously at a specific strike price.
• Fee Accumulation: Each time the price crosses the tick
range, fees are collected, providing a steady stream of income
to the liquidity provider.
These characteristics introduce new dynamics and opportunities
for liquidity providers. By leveraging the continuous nature of LP
token conversions and the perpetual accumulation of fees, investors
can potentially achieve returns that differ from traditional covered
call or cash-secured put strategies.
## 3.2.4 Further Exploration
Future research should dive deeper into the quantitative aspects of
these analogies. Key areas of interest include:
• Pricing Models: Developing robust pricing models that ac-
count for the perpetual nature and continuous conversion of
LP tokens.
• Risk Management: Identifying and mitigating the unique
risks associated with single tick positions, such as market
volatility and liquidity risk.
• Optimization Strategies: Exploring algorithmic trading
strategies that optimize the deployment and management of
liquidity across multiple ticks.
By advancing our understanding of these areas, we can further
enhance the utility and effectiveness of Uniswap V3 LP tokens,
opening new avenues for innovation and growth in decentralized
finance.
## 3.2.5 Classical Option Theory
This section aims to refresh the fundamental results from classical
finance, with a focus on classical options [14, 10, 6, 17, 18, 8, 5,
4, 15, 12]. Consider a call option on an underlying asset with the
price in token Y for one token X, having a strike price k and an
expiration time T. Let Call(pt,t) denote the option price at time
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com40 Chapter 3. Uniswap V3 Options
t, where pt is the price at time t. Note that T − t is the time
to expiration at time t. The value Call(pt,t) also depends on the
volatility σ of the underlying asset and, under certain assumptions,
is given by the Black-Scholes formula:
Call(pt,t) = pt · N(d1) − k · e−α(T−t)
· N(d2), (3.1)
where α is the risk-free interest rate, N is the cumulative distribu-
tion function of the normal distribution, and d1 and d2 are defined
as follows:
d1 =
ln pt
k

+ (α + σ2
2 )(T − t)
σ
√
T − t
,
d2 = d1 − σ
√
T − t.
The price of a put option with the same parameters is denoted as
Put(pt,t) and is given by:
Put(pt,t) = −pt · N(−d1) + k · e−α(T−t)
· N(−d2). (3.2)
Let us briefly, and without proofs, review the derivation of these
results. For details, refer to [10]1.
Consider an underlying asset price that follows an Itô process
(see [12] Chapter 4), defined as a stochastic process with a drift
rate2 and a Wiener process dz, also known as Brownian motion:
dp = a(p,t) · dt + b(p,t) · dz for 0 ≤ t ≤ T, (3.3)
where T is a fixed expiration time in the future. Itô’s Lemma states
that if p satisfies (3.3), then any (sufficiently smooth) function u =
u(p,t) is a solution to the partial differential equation:
du =

∂u
∂p
a +
∂u
∂t
+
1
2
∂2u
∂p2
b2

dt +
∂u
∂p
b · dz. (3.4)
The Feynman-Kac formula3 [12, 21] provides the solution u
in the time interval [0,T] conditional on the boundary condition
1
https://www.saxo.com/dk/options-futures-and-other-derivatives-
ebook-global-edition john-c-hull pdf 9781292212920
2
Average price change per unit of time.
3
https://en.wikipedia.org/wiki/Feynman%E2%80%93Kac formula
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 41
u(p,T) = uT :
u(p,t) =
Z ∞
0
1
xσ
√
2πt
exp



−

ln x
p − (µ − σ2
2 t)
2
2σ2t


·exp[−µt]·u(x,T)dx,
(3.5)
for 0 ≤ t ≤ T. The Black-Scholes formulae (3.1) and (3.2) result
from applying (3.5) to the boundary conditions specific to call and
put options.
For a call option, we apply the option price function u = Call(pt,t)
subject to the boundary condition:
u(x,T) = max(x − K,0).
For a put option, we apply the option price function u = Put(pt,t)
subject to the boundary condition:
u(x,T) = max(K − x,0).
The Black-Scholes model provides a robust framework for pric-
ing European options, where the absence of dividends, continuous
trading, and constant volatility are assumed. This classical option
theory underpins much of modern financial practice and provides
valuable insights into the pricing and risk management of derivative
instruments.
## 3.2.6 Single Tick LP Positions vs. Classical Options
In this section, we explore the relationship between single tick
LP positions in Uniswap V3 and classical options. We consider
a Uniswap V3 pool consisting of two tokens X and Y (which could
be ETH and DAI, but we will keep it general). A liquidity provider
supplies liquidity in a price range [pa,pb]. Define the parameters:
k =
√
papb, (3.6)
r =
r
pb
pa
. (3.7)
Observe that kr = pb and k
r = pa; in other words, we can express
our price range in terms of k and r as [k
r ,kr].
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com42 Chapter 3. Uniswap V3 Options
Recall from the summary in Section 2.3.4 that the Uniswap V3
position value can be expressed as:
V (p) = yp + p · xp,
where xp and yp are the token amounts at price p. Suppose that
liquidity is provided within the chosen price range [pa,pb]. If the
position is opened at an entry price p0 with deployed token amounts
x0 and y0, the formulas for xp and yp are:
xp =

  
  
∆0 if p ≤ pa,
∆0 ·
q
pa
p ·
√
pb−
√
p
√
pb−
√
pa
if pa < p < pb,
0 if p ≥ pb.
yp =

 
 
0 if p ≤ pa,
∆0 ·
√
papb ·
√
p−
√
pa
√
pb−
√
pa
if pa < p < pb,
∆0 ·
√
papb if p ≥ pb.
where ∆0 is defined by the entry state:
∆0 =

  
  
x0 if p0 ≤ pa,
x0 ·
q
p0
pa
·
√
pb−
√
pa
√
pb−
√
p0
if pa < p0 < pb,
y0 √
papb
if p0 ≥ pb.
For an entry price p0 ≤ pa, the position is opened using only
token X amounts. For simplicity, we assume the position is normal-
ized in token X, meaning x0 = 1 for p0 ≤ pa, so the entry compo-
nent ∆0 = 1. For p0 ≥ pb, the position is opened using only token
Y amounts, and since we require ∆0 = 1, we have y0 =
√
papb = k.
We now apply our main assumption for the rest of this section:
The position will be a single tick position, where we set r = 1 for
simplicity, or equivalently pa = pb (which represents the limit for
a very narrow single tick position). Thus, the common value of pa
and pb is k, as defined by k =
√
papb. The formulas for xp and yp
under the assumption r = 1 can be simplified to find the position
value:
V (p) =
(
p if p ≤ k,
k if p ≥ k.
Note that V (p) = p − max(p − k,0).
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 43
This simplified formula shows that the value of a single tick LP
position behaves like a capped payoff, similar to classical financial
options. When p ≤ k, the position value increases linearly with
p. When p ≥ k, the position value is capped at k, mimicking the
behavior of a covered call or a cash-secured put option, depending
on the initial deployment of liquidity.
By understanding this relationship, we can leverage the theoret-
ical insights from classical options to better manage and optimize
LP positions in Uniswap V3. This includes developing strategies
to maximize returns, mitigate risks, and adapt to changing market
conditions.
Covered Call
A covered call strategy involves selling a call option on an asset
that you already own. Suppose the asset price is p and the call
option is sold with a strike price k. The payoff at expiration is
p − max(p − k,0), which corresponds to the value V (p) of a single
tick position in Uniswap V3.
Let T be a future time measured in days from now, for example,
10 or 20 days, and let pT be the asset price at time T (with the
asset being token Y in terms of token X). The single tick position
value at time T replicates the payoff of a covered call with a strike
price of k and expiration time T:
V (pT ) = pT − max(pT − k,0).
The right-hand side represents the boundary condition for a
covered call with a strike price of k. Thus, the results from Section
3.2.5 on classical option theory can be used to find an expression
for V (pt):
V (pt) = pt − Call(pt,t). (3.8)
Remark 3.3. If p ≤ k and liquidity is provided in a Uniswap V3
pool using 1 unit of token X, then the portfolio consisting of one
short position in token X and a long single tick position at tick
k results in shorting a call option. Applying (3.8), we see that
−pt + V (pt) = −Call(pt,t). Therefore, providing liquidity in a
Uniswap V3 pool mimics shorting a call option (and as we shall see
later, also selling a put option).
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com44 Chapter 3. Uniswap V3 Options
To elaborate further, the covered call strategy is often used
by investors to generate additional income from their holdings. By
selling a call option, the investor collects a premium, which provides
some downside protection if the asset’s price falls. However, the
trade-off is that the potential upside is capped if the asset’s price
exceeds the strike price k, as the option will be exercised, and the
investor will have to sell the asset at the strike price.
In the context of Uniswap V3, the single tick LP position can be
viewed similarly. When providing liquidity within a narrow price
range, the liquidity provider earns fees from trades occurring within
that range, akin to collecting the option premium. If the asset price
remains within the range, the position retains its value, much like
how the underlying asset remains in the investor’s portfolio in a
covered call strategy. If the asset price moves outside the range,
the position’s value adjusts, reflecting the capped payoff structure
similar to that of a covered call.
The comparison highlights the versatility and potential of Uniswap
V3 LP positions to replicate traditional financial strategies, offering
new opportunities for investors in the decentralized finance (DeFi)
space. By understanding these analogies, liquidity providers can
better manage their positions and optimize their returns.
Cash-Secured Put
Our single tick position value can also be written as:
V (p) = k − max(k − p,0),
which is the payoff at expiration of a cash-secured put with a strike
price of k and price p at expiration.
Let T be a future time measured in days from now, and let pT be
the asset price at time T. Consider a single tick position deployed at
tick k. The single tick position value at time T replicates the payoff
of a cash-secured put with a strike price of k and an expiration time
T:
V (pT ) = k − max(k − pT ,0).
The right-hand side represents the boundary condition for a
cash-secured put with a strike price of k. Thus, the results from
Section 3.2.5 on classical option theory can be used to find an ex-
pression for V (pt):
V (pt) = k − Put(pt,t). (3.9)
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 45
Remark 3.4. If p ≥ k and liquidity is provided in a Uniswap V3
pool using k amount of token Y , then the portfolio consisting of
a short position of k amounts of token Y and a long single tick
position at tick k results in shorting a put option. By applying
(3.9), we see that −k + V (pt) = −Put(pt,t). Therefore, providing
liquidity in a Uniswap V3 pool mimics shorting a put option.
To elaborate further, the cash-secured put strategy is commonly
used by investors who are willing to buy the underlying asset at a
lower price. By selling a put option, the investor collects a premium
and agrees to buy the asset at the strike price k if the option is
exercised. This strategy provides some downside protection, as the
investor effectively sets a purchase price for the asset that they are
comfortable with.
In the context of Uniswap V3, the single tick LP position can be
viewed similarly. When providing liquidity within a narrow price
range, the liquidity provider earns fees from trades occurring within
that range, similar to collecting the option premium. If the asset
price remains within the range, the position retains its value, just
like how the underlying asset remains in the investor’s portfolio in
a cash-secured put strategy. If the asset price moves outside the
range, the position’s value adjusts, reflecting the payoff structure
similar to that of a cash-secured put.
Summary
In this section, we have drawn parallels between single tick LP
positions in Uniswap V3 and classical options. Let’s highlight our
key observations:
Observation 1
Holding an LP token for T days mimics selling a covered call
option with a strike price of k and an expiration time of T.
Observation 2
Holding an LP token for T days mimics selling a cash-secured
put option with a strike price of k and an expiration time of
T.
The “covered call” and “cash-secured put” comes from the fact
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com46 Chapter 3. Uniswap V3 Options
that LP positions in Uniswap V3 are collateralized by the assets
provided in the liquidity pool, much like covered calls and cash-
secured puts are collateralized by the underlying assets or cash.
Here are the observations broken down. First, for observation
1:
• Selling a Call Option: When you sell a call option, you are
giving the buyer the right to purchase the underlying asset at
a specific price (the strike price) by a specific date (expiration
time). If the price goes above the strike price, you must sell
the asset at the strike price, potentially incurring a loss.
Mimic in Uniswap V3: When you hold an LP position
and the price of the asset goes above the upper bound of
your liquidity range, you effectively have to sell your asset,
similar to being short on a call option.
Then, for observation 2:
• Selling a Put Option: When you sell a put option, you are
giving the buyer the right to sell the underlying asset at a
specific price (the strike price) by a specific date (expiration
time). If the price falls below the strike price, you must buy
the asset at the strike price, potentially incurring a loss.
Mimic in Uniswap V3: When you hold an LP position
and the price of the asset goes below the lower bound of your
liquidity range, you effectively have to buy the asset, similar
to being short on a put option.
Recall that an LP token is the receipt you receive after opening
a Uniswap V3 position by depositing amounts of tokens X and Y .
The position is assumed to be a single tick Uniswap V3 position
deployed at tick k.
• Covered Call Analogy: When the price p is less than or
equal to k, the single tick LP position value behaves like the
payoff of a covered call. The position’s value increases linearly
with the price p up to k, after which it is capped. This mimics
the behavior of selling a call option where the potential upside
is capped if the asset’s price exceeds the strike price k.
• Cash-Secured Put Analogy: When the price p is greater
than or equal to k, the single tick LP position value behaves
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.2. A Touch of Classical Option Theory 47
like the payoff of a cash-secured put. The position’s value is
capped at k and decreases linearly as the price p falls below
k. This mimics the behavior of selling a put option where the
investor agrees to buy the asset at the strike price k if the
option is exercised.
• Continuous Fee Accumulation: Unlike traditional op-
tions that have a fixed expiration date, LP tokens in Uniswap
V3 do not expire. They continue to earn fees from trades
occurring within the liquidity range, providing a continuous
stream of income to the liquidity provider. This characteristic
makes LP tokens behave like perpetual options rather than
traditional options with a fixed term.
• Dynamic Conversion: The conversion between tokens X
and Y in a single tick LP position happens continuously as
the price moves through the tick range [t,t′]. This dynamic
conversion process differs from the instantaneous conversion
at the strike price in traditional options.
• Risk and Return Management: Understanding these analo-
gies allows liquidity providers to better manage their positions
in Uniswap V3. By leveraging the principles of classical op-
tions, liquidity providers can develop strategies to maximize
returns and mitigate risks, enhancing their participation in
the decentralized finance (DeFi) space.
By recognizing these observations, we gain a deeper understand-
ing of how LP tokens in Uniswap V3 can be utilized to replicate
traditional financial strategies. This insight opens up new avenues
for innovation and growth in DeFi, offering investors sophisticated
tools to manage their assets and optimize their returns.
Future Work
We have highlighted the similarities between the value of a deployed
single tick position in Uniswap V3 and a shorted call or put option.
This is derived from formulas (3.8) and (3.9), along with Remarks
3.3 and 3.4. One important note: The expressions in (3.8) and
(3.9) for the Uniswap V3 position value hold true only if the po-
sition is kept for exactly T days, mirroring the expiration of the
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com48 Chapter 3. Uniswap V3 Options
corresponding option. However, in real life, LP tokens never ex-
pire—they behave like perpetual call or put options, rather than
classical options with fixed terms.
To further elucidate the differences between classical options
and single tick positions in a Uniswap V3 pool (the left and right-
hand sides of (3.8) and (3.9)), we propose the following avenues for
future research:
• Fee Accumulation Analysis: Investigate the dynamics of
fee accumulation in Uniswap V3 positions. Unlike traditional
options, LP tokens earn fees continuously as trades occur
within the liquidity range. Quantifying these fees and un-
derstanding their impact on the overall return is crucial for
liquidity providers.
• Price Crossing Frequency: Develop a theoretical model
to estimate the frequency with which the price crosses a sin-
gle tick range. This involves analyzing historical price data
and applying statistical methods to predict future price move-
ments. The model will help in estimating the potential fees
earned over time.
• Comparative Analysis: Compare the returns from holding
a Uniswap V3 position versus selling a call or put option.
This includes evaluating the expected returns from accrued
fees in LP tokens and option premiums in classical options.
Understanding these differences will help liquidity providers
optimize their strategies.
• Volatility and Risk Management: Assess the impact of
market volatility on Uniswap V3 positions. Unlike traditional
options that have a defined expiration, the continuous nature
of LP tokens introduces unique risk factors. Developing risk
management strategies to mitigate these risks will be essential
for liquidity providers.
• Algorithmic Trading and Automation: Explore the po-
tential for algorithmic trading strategies that can optimize
fee collection and manage liquidity across multiple ticks. Au-
tomation can enhance the efficiency and profitability of LP
positions, allowing liquidity providers to dynamically adjust
their positions based on market conditions.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 49
• Perpetual Option Valuation: Extend classical option val-
uation models to account for the perpetual nature of LP to-
kens. This involves modifying existing models, such as Black-
Scholes, to incorporate continuous fee accumulation and the
absence of a fixed expiration date.
• Behavioral Insights: Study the behavioral patterns of liq-
uidity providers and traders within the Uniswap V3 ecosys-
tem. Understanding how different market participants inter-
act with LP positions can provide valuable insights for opti-
mizing liquidity provision and fee collection.
By addressing these areas, we can gain a deeper understanding
of the mechanics and potential of Uniswap V3 LP tokens. The
exploration of LP tokens as perpetual options is a promising avenue
in this journey.
3.3 LP Expected Returns
When a user opens a Uniswap V3 position, several factors must be
considered to maximize profit. Key questions include: what should
the center price be, how should the upper and lower tick prices be
set, and how long should the position be held? In this section, we
will dive into the theoretical price movements and the probability
that the price remains within a given range over a specified future
time. This understanding is crucial for estimating the amount of
fees that can be collected from a Uniswap V3 position within a
given timeframe.
## 3.3.1 Price Movements
ELI5: LP Expected Return
Imagine you have a lemonade stand and you decide to share the
work and profits with your friend. You both put in some money to
buy lemons and sugar, and you both get special tickets called LP
tokens that represent your share of the stand. Now, let’s see how
you can figure out how much money you’ll make over time.
• Setting Up the Stand:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com50 Chapter 3. Uniswap V3 Options
– You and your friend each put in $10 to buy supplies.
You get LP tokens that show you both own half of the
lemonade stand.
• Making Money:
– As you sell lemonade, customers pay money, and it goes
into a big jar. At the end of the day, you split the money
based on how many LP tokens you each have.
• Collecting Fees:
– Imagine every time someone buys a cup of lemonade,
you collect a small fee for each sale. These fees are like
extra tips that go into the jar.
• How Long to Keep the Stand Open:
– You want to know how long you should keep the stand
open to make the most money. The longer you keep it
open, the more fees you can collect.
• Price Movements:
– Sometimes, the price of lemons or sugar might go up
or down. This affects how much you need to spend on
supplies and how much you can charge for lemonade.
You need to think about how these prices move over
time.
• Probability and Timing:
– You wonder how often the price of lemons will be in a
good range for you to make the most profit. You can
calculate the probability of the price being in that good
range at different times in the future.
• Expected Returns:
– To figure out how much money you’ll make (expected
return), you look at how often the price of lemons is in
the good range and how many fees you collect during
that time. The more often the price is good, the more
money you make.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 51
• Staying in the Range:
– If the price of lemons stays in the good range more often,
you’ll collect more fees. If the price goes outside the
range, you collect fewer fees.
Example:
• You and your friend decide to keep the stand open for 10
days. You calculate that there’s a good chance the price of
lemons will stay in the good range for 7 out of those 10 days.
• You figure out that the fees you collect during those 7 days
will give you a good return on your initial investment.
So, by understanding how long to keep your stand open and
how the price of lemons moves, you can estimate how much money
you’ll make from your lemonade stand over time.
Let’s briefly review the assumptions behind the Black-Scholes
formula for option pricing. The underlying asset price (e.g., a
stock price) is assumed to follow a Geometric Brownian Motion,
a stochastic process St given by:
dSt = µStdt + σStdWt, (3.10)
where Wt is a Brownian motion, µ is the drift rate representing the
average price change4, and σ is the volatility.
The Brownian motion Wt is a Wiener process, meaning the
increments Ws+t − Ws are normally distributed with mean 0 and
variance t. Additionally, W0 = 0, so Wt = Wt −W0 ∼ N(0,t). The
probability density function fWt of Wt is:
fWt(x) =
1
√
2πt
e−x2
2t . (3.11)
Analytic Solution to (3.10)
Applying Itô’s Lemma (3.4) to the function u(t) = lnSt gives:
d(lnSt) = (µ −
σ2
2
)dt + σdWt.
4
A positive µ indicates a bullish trend, while a negative µ indicates a bearish
trend.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com52 Chapter 3. Uniswap V3 Options
Integrating this, we get:
lnSt − lnS0 = (µ −
σ2
2
)t + σWt,
or equivalently:
St = S0 · e(µ−σ2
2
)t+σWt
. (3.12)
For practical purposes, we can approximate (3.12) under the
assumption µ − σ2
2 ≪ 1:
St ≈ S0 · (1 + σWt) = S0
|{z}
Start price
+ S0σWt
| {z }
Expected move
. (3.13)
Remark 3.5. Consider an ETH-USD annual volatility of 100% and
an average daily ETH return in USD of 0.2%. The daily volatility
can be computed from the annual volatility as 100% √
365
≈ 5.23%, so
µ − σ2
2 = 0.0006.
Remark 3.6. Since Wt = Wt−W0 ∼ N(0,t), the standard deviation
of Wt is
√
t. Thus, the standard deviation of St is S0σ
√
t. This
means there is a 68.2% chance that St falls within S0 ± S0σ
√
t.
The probability increases to 95.4% for S0 ± 2S0σ
√
t and 99.7% for
S0 ± 3S0σ
√
t.
## 3.3.2 Price Inside Liquidity Range
Now let’s consider a Uniswap V3 position with a range defined
by lower and upper tick prices pa and pb. The question is: if the
current price is p0, what is the probability that the price at a future
time T will be within this liquidity range?
Returning to (3.12) and solving for WT (where starting price
= p0 and future price = pT ):
WT =
1
σ
ln

pT
p0

−
1
σ
(µ −
σ2
2
).
The probability that pT falls within the range [pa,pb] is equivalent
to finding WT within:

1
σ
ln

pa
p0

−
1
σ
(µ −
σ2
2
),
1
σ
ln

pb
p0

−
1
σ
(µ −
σ2
2
)

.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 53
Using the density function of Wt from (3.11), we compute this prob-
ability as:
Prob pT in range =
Z 1
σ
ln

pb
p0

− 1
σ
(µ−σ2
2
)
1
σ
ln

pa
p0

− 1
σ
(µ−σ2
2
)
1
√
2πT
e−x2
2T dx
=
Z 1
σ
ln

pb
p0

− 1
σ
(µ−σ2
2
)
−∞
1
√
2πT
e−x2
2T dx
−
Z 1
σ
ln

pa
p0

− 1
σ
(µ−σ2
2
)
−∞
1
√
2πT
e−x2
2T dx
= N


ln

pb
p0

− T(µ − σ2
2 )
σ
√
T


−N


ln

pa
p0

− T(µ − σ2
2 )
σ
√
T

,
where N(x) =
Rx
−∞
1 √
2π
e−t2
2 dt is the cumulative normal distribu-
tion. The first term represents the probability of ending up below
pb, and the second term represents the probability of ending up
below pa. The difference between these probabilities gives us the
probability of the price ending up between pa and pb.
From Remark 3.5, we can assume that T(µ−σ2
2 ) ≈ 0 (at least for
short future times T). Thus, we can simplify the above expression:
Prob pT in range = N


ln

pb
p0

σ
√
T

 − N


ln

pa
p0

σ
√
T

.
If the range is centered around the current price p0 as follows:
pa =
p0
r
and pb = p0r
for some r > 1, the probability can be written as:
Prob pT in range = N

ln(r)
σ
√
T

− N

−
ln(r)
σ
√
T

.
We can simplify this further by using the relationship between
the Error function Erf(x)5 and the cumulative normal distribution
5
https://en.wikipedia.org/wiki/Error function
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com54 Chapter 3. Uniswap V3 Options
N(x):
N(x
√
2) =
Erf(x) + 1
2
.
Thus, our probability becomes:
Prob pT in range =
Erf

ln(r)
σ
√
2T

− Erf

− ln(r)
σ
√
2T

2
= Erf

ln(r)
σ
√
2T

.
The final equality follows from the fact that the Error function is
odd.
Remark 3.7. For r → 1, we have Prob pT in range → 0, which is
intuitively correct as the price range becomes infinitesimally small.
For T → 0, we see that Prob pT in range → 1, which is also in-
tuitively correct since the starting price p0 is already in the range
by construction. As the future time T increases, the probability
of finding pT within the price range decreases due to the increased
likelihood of the price moving outside the range.
## 3.3.3 Implications for Fee Collection
Understanding the probability of the price staying within the spec-
ified range over a given timeframe is crucial for estimating the ex-
pected returns from a Uniswap V3 position. The collected fees are
proportional to the trading volume within this range, so accurately
estimating the probability helps in predicting the potential fee in-
come.
To estimate the expected returns, liquidity providers should
consider the following:
• Historical Volatility: Analyze historical volatility to set
realistic expectations for future price movements.
• Optimal Tick Range: Choose an optimal tick range that
balances the probability of price staying within the range and
the potential fee income.
• Market Trends: Monitor market trends and adjust the po-
sition accordingly to capture maximum fee opportunities.
• Rebalancing Frequency: Determine how often to rebal-
ance the position to maintain an optimal tick range.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 55
By integrating these considerations, liquidity providers can bet-
ter manage their Uniswap V3 positions, maximizing the expected
returns from their liquidity provision.
Summary
We consider price of token X in terms of token Y in a two–asset
Uniswap v3 pool. The price expansion St is assumed to follow a
Geometric Brownian motion [11]—that is, St satisfies the partial
differential equation:
dSt = µStdt + σStdWt.
With some approximations, the expected move of a crypto asset St
as a function of t were found as:
St ≈ S0
|{z}
Start price
+ S0σWt.
| {z }
Expected move
For a Uniswap v3 position created in a concentrated liquidity
range [p0
r ,p0r] around p0 for some r > 1, the probability that the
price pT at a future time T to be within the range is
Erf(
ln(r)
σ
√
2T
).
Note that the relation between r and boundary prices pa,pb is r = q
pb
pa
.
Next Step
The previous sections describe the probability of the price being
within the liquidity range at a specific future time T. However, a
Uniswap V3 position never expires, and fees are earned each time
the price is within the range. Thus, a natural question arises: How
long is the price inside the liquidity range compared to the total
duration time T? Furthermore, what are the expected collected
fees for a Uniswap V3 position up to a time T?
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com56 Chapter 3. Uniswap V3 Options
## 3.3.4 Collected Fees
The setup and assumptions remain the same as in 3.3.2: We con-
sider a Uniswap V3 position with concentrated liquidity deployed
in a price range [pa,pb] around the current price p0 such that
p0 = rpa = pb
r for some range factor r > 1. Knowing the prob-
ability of the price being within the range at a given future time T,
we can determine the fraction of time spent within the price range
from time 0 up to T as:
TITM
T
=
RT
0 Prob pt in range dt
T
=
RT
0 Erf

ln(r)
σ
√
2t

dt
T
,
where TITM is the time the price p is within the range, i.e., in–the–
money (ITM). Let’s dive into the computation of the numerator.
Erf Integral
From an integral table of the error function6, we find:
Z ∞
x
Erf(z)z−3
dz =
Erf(x)
2x2
+
1
√
π
Z ∞
x
1
z2
e−z2
dz
=
Erf(x)
2x2
+
1
√
π
x−1
e−x2
− (1 − Erf(x)).
To compute the integral
RT
0 Erf

ln(r)
σ
√
2t

dt, we make the substi-
tution z = ln(r)
σ
√
2t
and re–write:
dz
dt
=
ln (r)
−2tσ
√
2t
=⇒ dt =
−ln2
(r)
σ2
z−3
dz.
6
https://nvlpubs.nist.gov/nistpubs/jres/73b/jresv73bn1p1 a1b.pdf
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 57
Thus, we have:
Z T
0
Erf

ln(r)
σ
√
2t

dt =
ln2
(r)
σ2
Z ∞
ln r
σ
√
2T
Erf(z)z−3
dz
=
ln2
(r)
σ2


Erf

ln(r)
σ
√
2T

2

ln2
(r)
2σ2T
 + σ
r
2
π
√
T
ln(r)
e−
ln2(r)
2σ2T
− (1 − Erf

ln(r)
σ
√
2T

)

=

T +
ln2
(r)
σ2

Erf

ln(r)
σ
√
2T

+
r
2
π
√
T ln(r)
σ
e−
ln2(r)
2σ2T
−
ln2
(r)
σ2
.
We can now write:
TITM
T
=
(ln2
(r) + σ2T)Erf

ln(r)
σ
√
2T

+ ln(r)
q
2
πσ
√
Te−
ln2(r)
2σ2T − ln(r)

σ2T
=
r
8
π
ln(r)
σ
√
T
+ Powers of ln(r) of degree ≥ 2.
Assumptions
The assumptions behind the above formulae (especially, the expres-
sion for Prob pt in range) include:
• T · (µ − σ2
2 ) ≪ 1,
• The starting price p0 is the geometric mean of the boundary
prices pa,pb, that is: p0 =
√
papb.
We have also used the Taylor expansion for the error function:
Erf(z) =
2
√
π
z + Powers of z of degree ≥ 3.
The above expression for TITM
T is a crucial factor in the formula
for the expected return within T days of an LP position (expected
collected fees). The fee factor ϕ also plays a significant role. The
collected fees depend on the total amount of assets locked in each
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com58 Chapter 3. Uniswap V3 Options
tick AMTtick at the traded tick, the daily trading volume (VOL),
and the duration T (in days) that the user holds the position.
In summary, the fees collected in T days per unit of asset
amounts deployed can be written as:

TITM
T
· T

| {z }
User controlled
·

ϕ ·
V OL
AMTtick

| {z }
Pool controlled
. (3.14)
Note that neither ϕ, AMTtick, nor V OL can be controlled by the
user since they are pool-specific. However, TITM (which depends
on the size of the range) is part of the LP position and controlled
by the user, as is the time T for which the position is held.
Remark 3.8. AMTtick will change among different ticks within a
range; however, for narrow ranges, we would expect AMTtick to
stabilize, and the formula for the LP return given in (3.14) holds
approximately. We will instead compute the return per tick in the
liquidity range. For that, we need the number of ticks within a
range.
Number of Ticks within a Range
Let N be the number of ticks defined by the upper and lower tick
indices tu,tl and the tick spacing ts:
N =
tu − tl
ts
=
ln(pb)
ln1.0001 − ln(pa)
ln1.0001
ts
=
ln(pb) − ln(pa)
ts · ln1.0001
=
10000.5 · ln(r2)
ts
=
20001 · ln(r)
ts
.
In the Uniswap V3 whitepaper7, it is mentioned that the pairs of
fee tiers ϕ and tick spacings ts supported are: ϕ,ts = (0.05%,10) or
7
https://uniswap.org/whitepaper-v3.pdf
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.3. LP Expected Returns 59
ϕ,ts = (0.3%,60) or ϕ,ts = (1%,200). This means that ts
20001 ≈ ϕ
and we can therefore rewrite N as:
N =
ln(r)
ϕ
.
Expected Return per Liquidity and per Tick
By inserting the expressions for TITM
T and N into (3.14) and rear-
ranging terms, we can express the expected return from time 0 up
to T per asset amount deployed and per tick as:
LP return per amount and per tick
∝
r
8
π
√
T
σ
· ϕ2
+ Linear terms of ln(r)n
for n ≥ 1.
We will refer to the expected return per liquidity and per tick as
the effective LP return. The right-hand side of that expression
(including all linear terms) is displayed in Fig. (3.3) for different r
while keeping ϕ = 0.3% and yearly σ = 100% fixed.
Implications and Summary
The analysis presented highlights the importance of understand-
ing price dynamics and fee structures in Uniswap V3 positions.
The collected fees depend significantly on the duration the price
remains within the liquidity range and the trading volume within
that range. By carefully choosing the tick range and monitoring the
market conditions, liquidity providers can optimize their positions
to maximize returns.
Key Takeaways:
• The probability of the price staying within a specified range
over a given timeframe is crucial for estimating potential fee
income.
• Understanding the relationship between price movements and
fee collection helps in optimizing liquidity provision strategies.
• The effective LP return can be influenced by factors such as
historical volatility, optimal tick range, market trends, and
rebalancing frequency.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com60 Chapter 3. Uniswap V3 Options
Figure 3.3: Effective LP return as a function of time
Effective LP return as a function of time for different values of r.
The figure shows the growth of LP returns over time for
single-tick (r = 1), r = 1.05, and r = 2.71828. As the value of r
increases, the returns grow more slowly compared to a
single-tick position.
By integrating these considerations, liquidity providers can bet-
ter manage their Uniswap V3 positions, maximizing the expected
returns from their liquidity provision.
Takeaways
The LP returns exhibit a
√
T dependency, indicating that the col-
lected fees increase with the square root of the holding time. For
example, to double the fees collected after 1 day, you should wait
for 3 days. Similarly, to double the fees collected after 4 days, you
should wait for 12 days, and so on.
The effective LP return is maximized for narrow ranges, partic-
ularly when the range factor r is close to 1. In this scenario, the
√
T
dependency becomes dominant, and the logarithmic terms (ln(r))
become insignificant for r ≈ 1 and higher-order terms (n ≥ 1). As
the range factor r increases, the LP returns decrease and exhibit a
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.4. Implied Volatility 61
linear dependency on time for large r values (r ≫ 1).
In summary:
• The collected fees increase with the square root of the holding
time (
√
T dependency).
• Narrower ranges (r ≈ 1) maximize the effective LP return
due to the dominant
√
T dependency.
• Increasing the range factor r decreases LP returns, with re-
turns becoming linear in time for large r values (r ≫ 1).
Understanding these takeaways helps liquidity providers opti-
mize their strategies to maximize returns based on their chosen
tick range and holding time.
## 3.4 Implied Volatility
ELI5: Implied Volatility
Imagine you’re at an amusement park, and there’s a game where
you can guess the number of jellybeans in a jar to win a prize. The
more people guess, the more hints you get about the actual number
of jellybeans in the jar. In finance, implied volatility is like trying
to guess how much a stock’s price will move in the future, based on
the price of options on that stock.
Breaking It Down
• The Jellybean Jar:
– Think of the stock price as the number of jellybeans in
the jar. You don’t know exactly how many there are,
but you have some idea based on what you see and hear.
• The Game:
– The game is like the options market. People are plac-
ing bets (buying options) based on how many jellybeans
they think are in the jar (how much they think the stock
price will move).
• Hints from Other People:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com62 Chapter 3. Uniswap V3 Options
– When lots of people guess, you get more hints about
the likely number of jellybeans. Similarly, when lots of
people buy options, the prices of those options give you
hints about how much the stock price might move.
• Volatility:
– Volatility is like how much you think the number of jelly-
beans can vary. If people think there could be a lot more
or a lot fewer jellybeans than a certain number, that’s
high volatility. If people think the number is pretty close
to the actual count, that’s low volatility.
• Implied Volatility:
– Implied volatility is the market’s guess about how much
the stock price will move in the future, based on the cur-
rent prices of options. It’s not about what the stock price
is now, but about how much it’s expected to change.
How It Works
• When you buy an option, you’re essentially betting on the
future price of a stock.
• If a lot of people are willing to pay a lot for options, it means
they think the stock price will move a lot in the future.
• The price of the options reflects this belief. Higher option
prices imply higher expected movements in the stock price.
• Implied volatility is the number that comes out of this process.
It tells you how much the market thinks the stock price will
swing over a certain period.
Example
• If everyone at the amusement park thinks the jellybean count
could be way off and they’re making wild guesses, the implied
volatility is high.
• If everyone thinks their guess is pretty close, the implied
volatility is low.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.4. Implied Volatility 63
So, implied volatility helps you understand the market’s expec-
tations for future price movements, even though no one knows the
exact future price.
In Section 3.2, we discussed how single tick LP positions in
Uniswap V3 can mimic call or put options. In this section, we will
consider two approaches:
• Hold the Position: Maintain the single tick Uniswap V3 LP
position for a fixed time T and collect the fees from trading
activities.
• Lend the Position: Lend the Uniswap V3 LP position for a
fixed time T and receive a Black-Scholes premium for lending
the put option (or call if we mimic a covered call).
We will explore both cases analytically, using the results from
the previous sections.
By examining these approaches, we will introduce the concept
of implied volatility for Uniswap V3 LP positions. Understanding
implied volatility is important for several reasons:
• Market Expectations: Implied volatility helps you under-
stand the market’s expectations for future price movements.
This insight can guide you in setting the best price range for
your trades.
• Trade Frequency and Fees: The higher the implied volatil-
ity, the more likely it is that the price will stay within your
range, resulting in more trades and higher fee collection.
This understanding of implied volatility can significantly en-
hance the decision-making process for liquidity providers in Uniswap
V3, optimizing their strategies for maximizing returns.
## 3.4.1 Holding a Uniswap V3 LP Position
To understand the returns from holding a Uniswap V3 liquidity
provider (LP) position, we can use the expression for effective liq-
uidity derived in the previous sections. The LP return per tick for
a position with an amount AMTpos deployed is given by:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com64 Chapter 3. Uniswap V3 Options
LP return per tick = AMTpos ·
V OL
AMTtick
·
r
8
π
√
T
σ
· ϕ2
+Linear terms of ln(r)n
.
For a single tick position, we simplify by letting N → 1 (conse-
quently ln(r) → 0), making the linear terms of ln(r) powers insignif-
icant. Thus, the approximate LP return for a single tick position
becomes:
AMTpos ·
V OL
AMTtick
·
r
8
π
√
T
σ
· ϕ2
. (3.15)
This equation highlights several key factors influencing the re-
turns from holding a Uniswap V3 LP position:
• Deployed Amount (AMTpos): The amount of liquidity de-
ployed in the position.
• Trading Volume (V OL): The daily trading volume within
the liquidity range.
• Tick Liquidity (AMTtick): The total amount of assets locked
in each tick.
• Time (T): The duration for which the position is held, with
returns increasing with the square root of time (
√
T).
• Volatility (σ): The volatility of the underlying asset.
• Fee Factor (ϕ): The fee tier of the Uniswap V3 pool.
By understanding and manipulating these factors, liquidity providers
can optimize their strategies to maximize returns. Here’s how each
factor plays a role:
• Deployed Amount (AMTpos): Increasing the amount of
liquidity deployed directly scales the returns proportionally.
• Trading Volume (V OL): Higher trading volume within the
liquidity range leads to more frequent transactions and thus
more fee earnings.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.4. Implied Volatility 65
• Tick Liquidity (AMTtick): Lower tick liquidity means a
larger share of the trading volume is attributed to your posi-
tion, increasing your fee earnings.
• Time (T): Holding the position for longer periods increases
returns due to the
√
T dependency.
• Volatility (σ): Higher volatility increases the likelihood of
the price moving within the liquidity range, thus potentially
increasing fee earnings.
• Fee Factor (ϕ): Higher fee tiers result in greater fee earnings
per transaction.
Optimizing these parameters allows liquidity providers to en-
hance their effective LP returns significantly. Narrowing the price
range for concentrated liquidity and holding positions over extended
durations can be particularly effective strategies for maximizing re-
turns.
## 3.4.2 Lending a Uniswap V3 LP Position
Deploying a single tick8 LP position limited for T days is akin to
a cash-secured put (or covered call) with strike k that expires in T
days. Consequently, a fair price for lending the LP position is the
premium from the sold put (or call) with strike k, given by (at time
t = 0):
Put : k · e−αT
· N(−d2) − p0 · N(−d1)
Call : p0 · N(d1) − k · e−αT
· N(d2),
where p0 is the initial price and α is the risk-free rate. The
parameters d1 and d2 are defined as:
d1 =
ln p0
k

+ (µ + σ2
2 )T
σ
√
T
d2 =
ln p0
k

+ (µ − σ2
2 )T
σ
√
T
,
8
The tick is assumed to be k.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com66 Chapter 3. Uniswap V3 Options
with µ and σ as defined in section 3.3.1. If the position has
been created at-the-money (i.e., at tick price equal to the current
price k = p0 at t = 0) and if µ ≪ σ2
2 and σ
√
T
2 ≪ 1, as mentioned
in 3.3.4, then the premium simplifies to:
Put premium ≈ k · N
σ
√
T
2
!
− k · N −
σ
√
T
2
!
≈ k ·
1
√
2π
· 2 ·
σ
√
T
2
= k · σ ·
r
T
2π
Call premium ≈ k · N
σ
√
T
2
!
− k · N −
σ
√
T
2
!
≈ k ·
1
√
2π
· 2 ·
σ
√
T
2
= k · σ ·
r
T
2π
.
These premiums reflect the fair compensation for lending the LP
position, mirroring the premiums one would receive from selling
corresponding put or call options with the same strike price and
expiration. By lending the LP position, liquidity providers can
achieve returns comparable to those from options trading while
maintaining their liquidity on the Uniswap V3 platform.
## 3.4.3 Premium vs. Fee and Implied Volatility
Let’s recap before proceeding with the final steps. We consider a
single tick Uniswap v3 position deployed at the at-the-money price
p0 = k (entry price p0 is the tick k). The total amount deployed is
k if measured in token Y and 1 if measured in token X (recall the
setup from section 3.1).
When the price crosses tick k upwards, 1 token X converts to k
tokens Y , and similarly, k tokens Y convert to 1 token X when the
price crosses tick k again. The premium for a put or call option has
been calculated previously with the following approximated values
(under some assumptions):
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.4. Implied Volatility 67
Put premium ≈ k · σ ·
r
T
2π
Call premium ≈ k · σ ·
r
T
2π
The collected fees from holding a position of an asset amount
of k is:
k ·
V OL
AMTtick
·
r
8
π
√
T
σ
· ϕ2
.
Canceling the position size k in both expressions, we can com-
pare the premium vs. fee collected as:
V OL
AMTtick
·
r
8
π
√
T
σ
· ϕ2
| {z }
Hold position
vs. σ ·
r
T
2π | {z }
Lend option
Therefore, it is more beneficial to hold a Uniswap v3 position
rather than lending the option if the following condition is true:
V OL
AMTtick
>

σ
2ϕ
2
The daily trading volume V OL and the total amount of asset
locked at that tick AMTtick can be computed for each pool, and so
can the realized volatility σ for the asset price. The fee parameter
ϕ is set by the pool.
If the LP position underperforms compared to lending the op-
tion and obtaining the premium, LP providers can increase their
return by lending the LP position as short put or call options.
Option buyers would similarly benefit from an option market pro-
tecting their crypto investments.
Example 3.9. Let us consider a Uniswap v3 position deployed at
the 3990 tick in the ETH-DAI-0.3% pool (see Fig. 3.4). The total
daily volume is $15.71 million, and the 3990 tick has a total tick
liquidity of 70.60 ETH = $281,694. We assume a 100% annualized
volatility, equivalent to a daily volatility σ = 100 √
365
= 5.23%. Now
insert AMTtick = $281,694, VOL = $15.71 million, ϕ = 0.0003
and σ = 0.0523 into (3.15) and find the LP return to be 1.53%
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com68 Chapter 3. Uniswap V3 Options
Figure 3.4: Snapshot of the DAI/ETH 0.3% liquidity pool from
Uniswap’s website. The graph shows the distribution of liquidity
across different price ranges. Key metrics displayed include Total
Value Locked (TVL), 24-hour trading volume, and 24-hour fees
collected. The current price of 1 DAI is approximately 0.0003 ETH,
and 1 ETH is equivalent to 3,803.1609 DAI.
per
√
days and per unit liquidity or 29.2% per year (assuming 365
days).
To choose between holding the LP position vs. lending the posi-
tion to an option buyer for maximizing profit, we compare V OL
AMTtick
and

σ
2ϕ
2
by inserting numbers:
V OL
AMTtick
=
15.71
0.281694
= 55.77 < 76.1 =

σ
2ϕ
2
Therefore, we conclude that holding the Uniswap v3 position
will underperform compared to lending the position to an option
buyer.
In the example above, we used an annualized volatility σ of
100%. One way to estimate the asset volatility is from the underly-
ing price changes within a time period—the realized volatility. But
what is the correct volatility to use?
When we compare the return from holding the Uniswap v3 posi-
tion and lending the option, we implicitly assume that the on-chain
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.4. Implied Volatility 69
asset price volatility (generating fees when being within the liquid-
ity range) is the same as the market volatility used to price the
option (implied volatility). The implied volatility (IV ) of an op-
tion is the value of the underlying asset volatility which, when used
in Black-Scholes pricing, will return a theoretical value equal to the
current market price.
To compute IV , we assume that the market for option pricing
has taken all available market information into account9 including
the expected LP returns. This means that the option price (pre-
mium) based on a Uniswap v3 position and the expected return
from the same Uniswap v3 position will converge, implying that
the implied volatility IV can be derived from:
V OL
AMTtick
=

IV
2ϕ
2
=⇒ IV = 2ϕ ·
r
V OL
AMTtick
(3.16)
Example 3.10. Consider a USDC-ETH-0.3% pool having a daily
trading volume of $70.5 million and an amount of liquidity at the
current tick of $5.5 million. Then the annualized implied volatility
becomes:
IV = 2 · 0.003 ·
r
70,500,000
5,500,000
·
√
365 = 41% per year.
Here, the
√
365 maps daily volatility to yearly volatility. We assume
that trading activity of the total daily volume $70.5 million is done
within the single tick, generating fees from the LP position.
In section 3.3.1, we introduced an assumption on the price move-
ments for our underlying asset prices; namely that it follows a Geo-
metric Brownian Motion. Remark 3.6 says that the expected price,
with a probability of 68%, at time t is in the following interval:
S0 ± S0σ
√
t
where S0 is the starting price. Knowing σ = IV can therefore
tell us which liquidity in a Uniswap v3 pool will be activated and
generate fees (with a given probability). Let’s consider a concrete
example.
9
The efficient-market-hypothesis https://en.wikipedia.org/wiki/Effici
ent-market hypothesis
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com70 Chapter 3. Uniswap V3 Options
Example 3.11. Consider the pool from example 3.10; a USDC-
ETH-0.3% pool having a daily trading volume of $70.5 million and
an amount of liquidity at the current tick of $5.5 million. The daily
implied volatility becomes:
IV = 2 · 0.003 ·
r
70,500,000
5,500,000
= 2.15% per day.
If the current ETH price in USDC is 4000, the expected movements
within one week (t = 7) are:
4000 ± 227 USDC.
Therefore, with a probability of 68%, the prices will the next week
stay in the interval [3773;4227]; a lot of liquidity will therefore be
untouched.
## 3.5 Generalization
We copy the setup from section 3.2.6, where a liquidity provider
has provided liquidity in a price range [pa,pb]. We will also adapt
the notation from that section:
k =
√
papb
r =
r
pb
pa
Until now, our main focus has been on single tick positions, which
we approximated by setting r = 1 and pa = pb = k. In the fol-
lowing, we will consider an arbitrary price range, provide a closed
formula for the position value, and discuss the analogy to options
(as we did for single tick positions). We will continuously check
that our formulas limit to the single tick results when we let r → 1.
Remark 3.12. Applying simple algebra, we have:
pa =
k
r
∧ pb = kr
3.5.1 LP Position Re-write
Recall from the summary part in section 2.3.4 that the Uniswap v3
position value can be written as:
V (p) = yp + p · xp
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 71
where xp and yp are the token amounts at price p. If the position
is opened at an entry price p0 and x0,y0 are the deployed token
amounts, the formulas for xp and yp can be written as:
xp =

  
  
∆0 if p ≤ pa,
∆0 ·
q
pa
p ·
√
pb−
√
p
√
pb−
√
pa
if pa < p < pb,
0 if p ≥ pb.
yp =

 
 
0 if p ≤ pa,
∆0 ·
√
papb ·
√
p−
√
pa
√
pb−
√
pa
if pa < p < pb,
∆0 ·
√
papb if p ≥ pb.
where ∆0 is defined by the entry state as:
∆0 =

  
  
x0 if p0 ≤ pa,
x0 ·
q
p0
pa
·
√
pb−
√
pa
√
pb−
√
p0
if pa < p0 < pb,
y0 √
papb
if p0 ≥ pb.
For an entry price p0 ≤ pa, the position is opened using token
X amounts only. We will, for simplicity, assume that the position
is normalized in token X, meaning that x0 = 1 for p0 ≤ pa, and
consequently the entry component ∆0 = 1. For p0 ≥ pb, the posi-
tion is opened using token Y amounts only, and since we require
∆0 = 1, we have y0 =
√
papb = k.
Now, if we apply the formulas for xp,yp and some algebra, we
can write V (p) = yp +p·xp in terms of k and r as follows (remem-
bering that ∆0 = 1):
V (p) =

 
 
p if p ≤ k
r ,
2·
√
pkr−p−k
r−1 if k
r < p < kr,
k if p ≥ kr.
For p ≤ pa = k
r , we have V (p) = yp +p·xp = 0+p·x0 = p. For
p ≥ pb = kr, we have V (p) = yp+p·xp = ∆0·
√
papb+p·0 = y0 = k.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com72 Chapter 3. Uniswap V3 Options
The final case where pa = k
r < p < kr = pb is given by:
V (p) = yp + p · xp
= k ·
√
p −
√
pa
√
pb −
√
pa
+ p ·
r
pa
p
·
√
pb −
√
p
√
pb −
√
pa
=
√
ppb − k
r − 1
+
√
ppb − p
r − 1
=
2 ·
√
pkr − p − k
r − 1
.
## 3.5.2 Covered call
As in section 3.2.6, we can, after doing some algebra, rewrite V (p)
in a convenient way that includes the covered call payoff as part of
V (p):
V (p) = p − max(p − k,0)
| {z }
First part: Covered call payoff
+

    
    
0 if p < k
r ,
2·
√
pkr−pr−k
r−1 if k
r ≤ p < k,
2·
√
pkr−p−kr
r−1 if k ≤ p < kr,
0 if p ≥ kr.
| {z }
Second part: Range payoff
The first part
p − max(p − k,0) =
(
p if p < k,
k if p ≥ k
is simply the payoff of a covered call with strike price k and price
p. The second part will be referred to as the range payoff.
Remark 3.13. The difference between a covered call payoff and a
Uniswap v3 position value turns out to be exactly the range payoff.
This highlights the previous observation: a single tick Uniswap v3
position has a similar payoff to a covered call, since the range payoff
becomes zero when narrowing the range, that is, letting r → 1.
Let T be a future time measured in days from now and consider
a Uniswap v3 position with parameters k,r and a covered call with
strike price k that expires at time T. The Uniswap v3 position
value at time T, V (pT ), can be written as the covered call payoff
and the range payoff:
V (pT ) = pT − max(pT − k,0) + Range Payoff(pT ).
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 73
This is the boundary condition for the position value function
V (pt) at any time 0 ≤ t ≤ T. We can use (3.5) to find an expression
for V (pt): First, apply (3.5) to the first part (the covered call part)
to get pt − Call(pt,t). The second part, however, is more complex
and will be abbreviated as ρ(pt,t), which is short for the Feynman-
Kac formula (3.5) applied to u = the range payoff function. That
means we can write the Uniswap v3 value at t ≤ T as:
V (pt) = pt − Call(pt,t) + ρ(pt,t).
Instead of explicitly evaluating ρ(pt,t), we will do the following:
For a range factor r, the shape of V (pt) is very similar to a covered
call that expires some days before the expiration time T:
V (pt) ≈ pt − Call(pt,t + tr) (3.17)
for some timespan tr > 0 that depends on r. The right-hand side of
(3.17) appears to be the price of a call option that expires at time
T − tr using the translation t → t + tr in (3.1).
To sum up, the Uniswap v3 position value defined by the pa-
rameters k,r mimics a covered call with strike k that expires tr
days before expiration time T.
The relation between r and tr can be found as follows: Since
(3.17) holds for all prices pt and t, it holds for the at-the-money
price pt = k at time t = T − tr. If pt = k, the left-hand side of
(3.17) equals (this is V (k)):
k +
2k
√
r − k − kr
r − 1
.
The right-hand side can be estimated using (3.1) and some approx-
imations10:
k − kσ
r
tr
2π
.
We can now equate the left and right-hand sides and find the rela-
tion between r and tr as:
tr =
2π
σ2
·
√
r − 1
√
r + 1
2
(3.18)
10
https://quant.stackexchange.com/questions/1150/what-are-some-u
seful-approximations-to-the-black-scholes-formula/1154#1154
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com74 Chapter 3. Uniswap V3 Options
or
rt =


1 + σ
q
t
2π
1 − σ
q
t
2π


2
. (3.19)
Summary
Therefore, to mimic a covered call option (e.g., on an underlying
token pair ETH/DAI) with strike k that expires t days before expi-
ration, one should open a Uniswap v3 position with a range factor
rt defined in (3.19); that is, provide liquidity within this range
[ k
rt
,krt].
Remark 3.14. Suppose we provide liquidity in a Uniswap v3 pool
using 1 amount of token X. Then the portfolio of a short position of
token X and a long position in the Uniswap v3 pool together results
in shorting a call option, applying (3.17). Thus, we will often say
that liquidity provision in a Uniswap v3 pool mimics selling a call
option (and, as we shall see later, also selling a put option).
Example 3.15. Assume that the yearly ETH/DAI volatility is
σ = 100% and that we should create a Uniswap v3 position to
mimic a covered call that expires t = 10 days before expiration
and k = 3300. We start by finding rt: The daily volatility is
σ = 100 √
365
= 5.23%, so that rt = 1.303. That means, one should
deploy a Uniswap V3 position within the range [2533,4299].
Example 3.16. Consider, as above, a LP provider that opens a
Uniswap v3 position on ETH/DAI at k = 3300 with a range fac-
tor r = 1.1256. The range factor corresponds to a position range
[2931,3714]. If the yearly volatility is σ = 100%, then the Uniswap
v3 return behaves like a covered call with strike k = 3300 that
expires tr = 2 days before expiration.
## 3.5.3 Cash–secured put
We will also cover the similarities between a cash-secured put and a
Uniswap v3 position, although the results are quite similar to those
from the covered call case in 3.5.2.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 75
Let us, as done in 3.5.2, rewrite the Uniswap v3 position value
V (p) in a convenient way that now resembles a put payoff:
V (p) = k − max(k − p,0)
| {z }
First part: Put payoff
+

    
    
0 if p < k
r ,
2·
√
p·k·r−pr−k
r−1 if k
r ≤ p < k,
2·
√
p·k·r−p−kr
r−1 if k ≤ p < kr,
0 if p ≥ kr.
| {z }
Second part: Range payoff
The first part is simply the payoff of a cash-secured put. If we
let V (pT ) be the Uniswap v3 position value at time T, then at a
time t with 0 ≤ t ≤ T, we can divide the Uniswap v3 position into
two parts: The first part becomes the value of a cash-secured put
at t, pt − Put(pt,t); the second part is (again) more complex and
will be abbreviated as ρ(pt,t), which is short for the Feynman–Kac
formula applied to u = the range payoff function (second part).
That means we can write the Uniswap v3 value at a time t ≤ T as:
V (pt) = k − Put(pt,t) + ρ(pt,t).
For a range factor r, the shape of V (pt) is very similar to that of
a cash-secured put that expires some days before expiration time:
V (pt) ≈ k − Put(pt,t + tr) (3.20)
for some timespan tr > 0 that depends on r. The put option on
the right-hand side of (3.20) can be written as in (3.2) with the
translation T → T − tr, which is simply the price of a put that
expires at time T − tr. To sum up, the value of V (pt) is similar to
a cash-secured put that expires tr days before expiration.
At time t = T −tr, the at-the-money values are the same: that
is, CallATM
(k,T − tr) = PutATM
(k,T − tr). This can be used to
find the exact same relations between r and tr as for the covered
call case, see (3.18) and (3.19).
Summary
To mimic a cash-secured put option (e.g., on an underlying token
pair ETH/DAI) with strike k that expires t days before expiration,
one should open a Uniswap v3 position with a range factor rt de-
fined in (3.19); that is, provide liquidity within this range [ k
rt
,krt].
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com76 Chapter 3. Uniswap V3 Options
## 3.5.4 Delta
ELI5: What is Delta?
Delta is like a sensitivity meter. If the delta of an option is 0.5, it
means that if the stock price goes up by $1, the option price will
go up by $0.50. If the delta is 1, the option price will move exactly
like the stock price.
• Positive and Negative Delta: Call Options (the right to buy):
They have a positive delta. If the stock price goes up, the
value of the call option goes up. Put Options (the right to
sell): They have a negative delta. If the stock price goes up,
the value of the put option goes down.
• Delta Values: For call options, delta ranges from 0 to 1. For
put options, delta ranges from -1 to 0.
• Delta as Probability: Sometimes, delta is also thought of as
the probability that the option will end up being worth some-
thing (in-the-money) at expiration. For example, if a call op-
tion has a delta of 0.6, it can be interpreted as a 60% chance
that the option will be worth something at expiration.
## 3.5.5 Delta of a Uniswap V3 LP Position
The delta for the LP position V (p) measures the change in value
when the underlying price changes. Essentially, delta expresses the
price sensitivity of the value function and is simply the derivative
of V (p) with respect to p. It can be computed as:
δ(p) =

  
  
1 if p ≤ pa,
q
pa
p ·
√
pb−
√
p
√
pb−
√
pa
if pa < p < pb,
0 if p ≥ pb.
(3.21)
Between pa and pb, delta goes from 1 to 0, meaning that the value
of V (p) tracks p with 100% correlation for p ≤ pa and with 0%
correlation above pb.
Below, the position value V (p) is plotted for a specific liquidity
range along with the delta at a specific price.
If we narrow the price range, the sharpness of the curve within
the range becomes closer to the dashed line in figure 3.5.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 77
Figure 3.5: Delta for a Uniswap v3 position.
Delta for a Uniswap v3 position. The figure shows the value
function V (p) for a Uniswap v3 position and its corresponding
delta, δ(p), at a specific price. The delta indicates the sensitivity
of the position’s value to changes in the underlying price, with a
value of δ(p) = 0.42 shown at a particular price point. The
graph illustrates how delta varies within the price range, going
from 1 to 0 as the price moves from the lower to the upper
bound of the range.
Remark 3.17. Since δ(p) ≤ 1, the return of the Uniswap V3 position
will always be less than holding the tokens outside the pool before
accounting for any fees; thus there will be an impermanent loss
when the underlying price moves away from the entry price.
For a price p within the price range, we can express delta from
(3.21) in terms of the current price p and k,r from (3.17) in the
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com78 Chapter 3. Uniswap V3 Options
following way:
δ(p) =
r
pa
p
·
√
pb −
√
p
√
pb −
√
pa
=
r
pa
p
·
r
1
pa
·
√
pb −
√
p
r − 1
=
q
pb
p − 1
r − 1
=
q
r · k
p − 1
r − 1
If we apply k,r instead of pa,pb, we can write
δ(p) =

  
  
1 if p ≤ k
r ,
q
r·k
p
−1
r−1 if k
r < p < kr,
0 if p ≥ kr.
(3.22)
Remark 3.18. Observe that, when r ≈ 1, δ(p) → 1
2 for p → k by
using calculus. This is in line with our expectations from option
theory; ATM options have 50% delta.
In fact, for any delta δ with 0 ≤ δ ≤ 1, we can create a Uniswap
V3 position having exactly that given delta simply by opening a
position with parameter kδ (solve the above expression for k):
kδ = p ·
(δ · (r − 1) + 1)2
r
(3.23)
In 3.5.2 and 3.5.3, we established the relationship between the
range factor rt for a Uniswap V3 position defined in (3.17) and
the number of days to expiration for the Uniswap V3 option (the
analogy described earlier). The formula for kδ tells us how to create
a Uniswap V3 position having a specific option delta δ between 0
and 1.
Remark 3.19. Since 0 ≤ δ ≤ 1, we clearly have p
r ≤ kδ ≤ pr using
(3.23). So, if a Uniswap V3 position is defined from the parameters
k,r and k = kδ for some δ ∈ [0,1], the position range [k
r ,kr] will
contain p.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 79
Let’s work out a simple example.
Example 3.20. Suppose we want to mimic a short call that expires
tr = 10 days before expiration and requires a δ = 30%. Let’s say
the current ETH/DAI price is p = 3300 and the yearly volatility of
ETH/DAI is σ = 100%. First, we find rt:
rt =


1 + 1 ·
q
10
365·2π
1 − 1 ·
q
10
365·2π


2
= 1.3028
Next, from (3.23), we find the strike price k that matches δ = 30%
at the current price p:
kδ = 3300 ·
(0.3 · (1.3028 − 1) + 1)2
1.3028
= 3014
Given k and r, we can now find the upper and lower tick price as:
lower =
k
r
= 2313
upper = kr = 3926
Thus, to mimic the call in question, we should create a Uniswap
V3 position with (asymmetric) price range [2313,3926] around p.
## 3.5.6 Gamma
ELI5: What is Gamma?
Gamma is a measure of how much the delta of an option changes
when the price of the underlying asset changes. Let’s break this
down with simple terms and examples:
• Delta: Delta is like the speedometer in your car. It tells you
how fast the option’s price is changing compared to the price
of the stock. If delta is 0.5, it means if the stock price goes
up by $1, the option price goes up by $0.50.
• Gamma: Gamma is like the speedometer’s needle that tells
you how quickly your speed (delta) is changing. It tells you
how much the delta is expected to change when the stock
price changes. If gamma is high, it means that even small
movements in the stock price can cause big changes in delta.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com80 Chapter 3. Uniswap V3 Options
Example:
• Imagine you have a call option on a stock. The stock price is
$100, and the delta of your option is 0.5. This means if the
stock price goes up by $1 to $101, the option price will go up
by $0.50.
• Now, let’s say the gamma of your option is 0.1. This means
if the stock price goes up by $1, the delta of your option will
increase by 0.1. So if the stock price moves from $100 to $101,
the new delta will be 0.6.
• If the stock price goes up by another $1 to $102, the delta will
increase again by the gamma (0.1), making the new delta 0.7.
Why is Gamma Important?:
• Sensitivity: Gamma helps you understand how sensitive
your delta is to changes in the stock price. If gamma is high,
it means delta can change rapidly, making the option’s price
more volatile.
• Risk Management: Traders use gamma to manage risk.
High gamma means that they need to pay more attention to
the option’s position because small changes in the stock price
can significantly affect the option’s price.
• Non-Linear Movement: Gamma shows that the relation-
ship between the stock price and the option price is not linear.
As the stock price changes, the rate at which the option price
changes also varies.
In Summary:
• Delta is how fast your option price is changing with the stock
price.
• Gamma is how fast your delta is changing with the stock
price.
Understanding gamma helps traders predict and manage the
changes in their options’ prices more effectively.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com3.5. Generalization 81
We know that the gamma of an LP position V (p) measures the
rate of change of the delta with respect to the underlying price.
It is found by taking the second derivative of the value function
V (p). Having already computed the first-order derivative (delta),
this becomes straightforward. The gamma can be expressed as:
Γ(p) =

  
  
0 if p ≤ k
r ,
−1
2 ·
√
rk
r−1 · 1 √
p3
if k
r < p < kr,
0 if p ≥ kr.
(3.24)
As p approaches k
r from the right, we have −Γ → r2
2k
√
r−1
.
As p approaches kr from the left, we have −Γ → 1
2kr
√
r−1
.
Visually, −Γ has the following form:
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com82 Chapter 3. Uniswap V3 Options
Figure 3.6: Gamma for a Uniswap V3 position.
Gamma for a Uniswap V3 position. The figure illustrates the
gamma (Γ) of a Uniswap V3 position, which measures the rate
of change of delta with respect to the underlying price. Gamma
is highest in the middle of the price range and decreases as the
price approaches either boundary of the range. This graph
shows how the sensitivity of delta changes within the liquidity
range, highlighting the non-linear nature of the value function’s
responsiveness to price movements.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comChapter 4
Panoptic
Panoptic is a blockchain-based options trading protocol for decen-
tralized option trading based on automated market maker proto-
cols. On top of any asset pool in the Uniswap V3 ecosystem, it is
possible to conduct option trading by introducing a new Panoptic
pool and moving liquidity between the original Uniswap V3 pool
and the Panoptic pool. We will use the theory already developed,
especially the similarities between Uniswap V3 positions and op-
tions, now in the light of Panoptic.
## 4.1 Protocol Design
The setup involves a Uniswap V3 pool of two tokens X and Y , See
Fig. (4.1). On top of the Uniswap V3 pool, there is another pool of
the same tokens X and Y – the Panoptic pool. It is created from
liquidity providers depositing tokens X and Y in any ratio they
want. Moving tokens between the Panoptic and the Uniswap V3
pool can simulate option trading, as we shall see below.
Let’s refresh the results from Section 3.2.6, especially Remarks
3.3 and 3.4: Taking 1 amount of token X and deploying a single tick
Uniswap V3 position at tick k is similar to shorting a call option.
Similarly, taking k amount of token Y and deploying a single tick
Uniswap V3 position at tick k is similar to shorting a put option.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com84 Chapter 4. Panoptic
Figure 4.1: Illustration of the PanopticPool and UniswapV3Pool.
The PanopticPool holds deposited tokens from liquidity providers,
while the UniswapV3Pool manages the liquidity for trading. The
UniswapV3Pool is divided into SFPM (Semi-Fungible Position
Manager) liquidity and NFPM (Non-Fungible Position Manager)
liquidity, demonstrating the segmentation between Panoptic-owned
liquidity (SFPM) and Uniswap-owned liquidity (NFPM).
## 4.1.1 Option Selling
For simplicity, let’s assume that X = ETH and Y = DAI. The
current ETH price is 2000 DAI. We will consider two strategies
involving selling an option.
If you expect the upside for ETH (in terms of DAI) to be limited
(say less than 2200), you can sell an ETH/DAI call option with
strike k = 2200 and charge a premium to the option buyer. You
are now indifferent if the ETH price is stable or goes down – as
long as it stays below 2200.
On the other hand, if you are bullish on the ETH/DAI price,
you can sell an ETH/DAI put option with a strike of k = 1800 and
charge a premium to the option buyer. You are now obligated to
buy 1 ETH at the strike price regardless of market price.
In Panoptic, option selling is managed in the following way:
When an option seller wants to sell an option (call or put as above)
on the token pair X/Y with a strike price k, this is simulated by
borrowing liquidity from the Panoptic pool (one token X amount
or k token Y amount) and adding it to the Uniswap V3 pool as a
single tick position at tick k.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com4.1. Protocol Design 85
Figure 4.2: An option seller using the Panoptic protocol
“liquidity chunk”
Illustration of the Panoptic protocol for option selling. Liquidity
is moved from the Panoptic Pool to the Uniswap V3 Pool, where
it is allocated as a single tick position. The option seller
relocates liquidity to the Uniswap V3 pool, receiving fee
earnings as compensation.
## 4.1.2 Option Buying
Again, assume that X = ETH and Y = DAI. The current ETH
price is 2000 DAI. We will consider two strategies involving buying
an option.
If you expect the ETH/DAI price to rise above a given level k
(e.g., k could just be the current price), you can for a relatively
small upfront payment (premium) buy a call option with strike
price k and enjoy the asset gains above k.
Alternatively, if you are bearish on the ETH/DAI price, you can
buy a put option with strike price k and magnify the profit when
the ETH/DAI price goes below k.
In Panoptic, option buying is managed by reversing the proce-
dure for selling an option: When an option buyer wants to buy an
option (call or put as above) on the token pair X/Y with a strike
price k, this is simulated by moving liquidity out of the Uniswap
V3 pool; that is, burning the LP token for a single tick position at
tick k and putting the tokens into the Panoptic pool.
You can only buy an option if the exact same option has been
sold. The seller is paid from the stream of fees earned in the
Uniswap V3 pool, which is what the buyer pays for the option.
This concept is known as streamia: In traditional finance, an op-
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com86 Chapter 4. Panoptic
tion buyer pays an upfront option premium, but here we allow
dynamic payments, as a position accumulates premiums as long as
it remains within the liquidity range.
Figure 4.3: An option buyer using the Panoptic protocol
An option buyer using the Panoptic protocol. The buyer moves
liquidity out of the Uniswap V3 Pool into the Panoptic Pool,
effectively buying an option. The buyer pays the missing fee
earnings that the position would have generated in the Uniswap
V3 Pool.
## 4.1.3 Favorable Market Conditions
Selling
Selling an option is executed by moving liquidity from the Panop-
tic pool to the Uniswap pool, and the seller will be compensated
through fee earnings. liquidity is moved into a single tick Uniswap
V3 position around the current price p0. A favorable situation for
the seller is where the future price remains within the liquidity
range, thus maximizing the fee earnings or, in the context of the
new option pricing paradigm, the option price received.
Buying
Buying an option involves moving liquidity out of the Uniswap pool
into the Panoptic pool, and the buyer will pay for the missing fee
earnings that the position would have generated. This is illustrated
in Figure 4.4. The plot of future price movements starting at p0
depicts a favorable situation for the buyer, where the future price
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com4.1. Protocol Design 87
quickly moves out of the liquidity range, thereby minimizing the
missing fee earnings or, in the new option pricing paradigm, the
option price paid.
Figure 4.4: Favorable from a buyer’s perspective
Favorable scenario from a buyer’s perspective in the Panoptic
protocol. The current price p0 is indicated, and the future price
Pt is shown to quickly move out of the liquidity range,
minimizing the missing fee earnings and reducing the option
price paid by the buyer.
## 4.1.4 Perpetual Options
Perpetual Options (also known as XPOs) are financial derivatives
that give investors the right (but not the obligation) to buy or
sell an asset at any given price and time, distinguishing them from
conventional options that have specific expiry dates. XPOs can
be seen as dynamic options contracts with ultra-short expiration
periods that continually renew before reaching maturity.
A comparison between XPOs and traditional options reveals
several key differences. Most notably, XPOs do not have a fixed ex-
piry date, allowing investors to exercise them at any time, whereas
traditional options have specific expiration dates, after which they
become worthless.
The mechanism behind XPOs involves streaming premia, where
the option buyer does not pay an upfront cost to initiate the posi-
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com88 Chapter 4. Panoptic
tion. Instead, a fee is paid on an ongoing basis to maintain the open
position. XPOs derive their value from continuous fees generated
through real trading activity in the spot markets, particularly the
underlying AMM pool.
Panoptic introduces XPOs, also known as Panoptions, and em-
ploys this streaming-premia-driven approach.
## 4.1.5 Summary of Panoptic
Panoptic is an innovative protocol for decentralized option trading,
built on top of the Uniswap V3 ecosystem. By leveraging the simi-
larities between Uniswap V3 positions and options, Panoptic allows
users to trade options without traditional expiration dates. The
protocol enhances flexibility and continuous liquidity movement be-
tween pools, creating new opportunities for both option sellers and
buyers. What’s cool about Panoptic is its ability to enable dynamic
option trading with perpetual options (XPOs), providing a novel
approach to financial derivatives in the DeFi space.
• Dynamic Options: Unlike traditional options, Panoptic’s
XPOs do not have a fixed expiry date, allowing for continuous
trading and flexibility.
• Streaming Premia: Option buyers pay ongoing fees rather
than an upfront premium, creating a more dynamic and ac-
cessible market.
• Enhanced Liquidity: By moving liquidity between the Panop-
tic and Uniswap pools, the protocol ensures continuous liq-
uidity and optimizes fee earnings for option sellers.
• Innovative Trading: Panoptic introduces new strategies for
both bullish and bearish market conditions, enabling users to
hedge or speculate effectively.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comConclusion
The journey through the intricacies of Uniswap V3 and its applica-
tion in the creation of perpetual options has been an enlightening
exploration of decentralized finance. This mini-book has aimed
to provide a comprehensive understanding of the theoretical foun-
dations underpinning Uniswap V3, the mechanics of concentrated
liquidity, and the innovative ways in which these principles can be
extended to develop perpetual options.
We began by recapping the essential features of Uniswap V3,
highlighting how it differs from its predecessor, Uniswap V2, and
introducing the concept of concentrated liquidity. This new feature
allows liquidity providers to allocate their capital within specific
price ranges, leading to enhanced capital efficiency and more per-
sonalized liquidity provision.
The core sections of this mini-book dove deeply into the mathe-
matical models and theoretical constructs that make Uniswap V3 a
powerful tool for decentralized trading. By dissecting the constant
product formula, tick indices, and liquidity provider positions, we
have built a robust framework that supports the creation and man-
agement of perpetual options.
Perpetual options, as discussed, represent a significant advance-
ment in the DeFi space. They offer continuous exposure to an as-
set without the need for physical settlement or periodic expiration,
making them an attractive instrument for traders and investors
seeking flexibility and efficiency. By leveraging the unique proper-
ties of Uniswap V3, perpetual options can be designed to provide
consistent liquidity, transparent pricing, and decentralized gover-
nance.
Throughout this mini-book, our aim has been to present a stan-
dalone guide that offers clear, detailed derivations and explanations,
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com90 Chapter 4. Panoptic
ensuring that readers can follow the theoretical developments from
start to finish. The inclusion of practical examples and real-world
applications further solidifies the concepts, making them accessible
and actionable for practitioners in the DeFi space.
As we conclude, it is important to recognize the broader impli-
cations of our exploration. The advancements in AMM protocols
like Uniswap V3 and the development of sophisticated financial in-
struments such as perpetual options underscore the transformative
potential of blockchain technology. These innovations are paving
the way for a more inclusive, transparent, and efficient financial
ecosystem.
I hope that this mini-book has equipped you with the knowledge
and insights necessary to navigate and contribute to the evolving
landscape of decentralized finance. The future of DeFi is bright, and
with continued research, collaboration, and innovation, we can look
forward to a new era of financial empowerment and opportunity.
Thank you for embarking on this journey with me. I encourage
you to continue exploring, experimenting, and contributing to the
DeFi community, as together, we shape the future of finance.
Jesper Kristensen, Ph.D.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comBibliography
[1] Curve Documentation. 2022. https://curve.readthedocs.
io/ /downloads/en/latest/pdf/.
[2] Hayden Adams, Noah Zinsmeister, and Dan Robinson.
Uniswap v2 Core. 2020. https://uniswap.org/whitep
aper.pdf.
[3] Hayden Adams, Noah Zinsmeister, Moody Salem, River
Keefer, and Dan Robinson. Uniswap v3 Core. 2021. https:
//uniswap.org/whitepaper-v3.pdf.
[4] Martin Baxter and Andrew Rennie. Financial Calculus: An
Introduction to Derivative Pricing. Cambridge University
Press, 1996.
[5] Tomas Björk. Arbitrage Theory in Continuous Time. Oxford
University Press, 3rd edition, 2009.
[6] Fischer Black and Myron Scholes. The pricing of options and
corporate liabilities. Journal of political economy, 81(3):637–
654, 1973.
[7] Jason Chen, Kathy Fogel, and Kose John. Understanding the
maker protocol, 2022.
[8] John C Cox, Stephen A Ross, and Mark Rubinstein. Op-
tion pricing: A simplified approach. Journal of Financial Eco-
nomics, 7(3):229–263, 1979.
[9] Databricks. Databricks: Unified analytics platform, 2024. Ac-
cessed: 2024-06-18.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com92 Bibliography
[10] John C Hull. Options, Futures, and Other Derivatives. Pearson
Education, 10th edition, 2018.
[11] Ioannis Karatzas and Steven E. Shreve. Brownian Motion and
Stochastic Calculus, volume 113 of Graduate Texts in Mathe-
matics. Springer, New York, 1991.
[12] Ioannis Karatzas and Steven E Shreve. Brownian Motion and
Stochastic Calculus. Springer, 2nd edition, 1998.
[13] Fernando Martinelli and Nikolai Mushegian. Balancer
whitepaper - A non-custodial portfolio manager, liquidity
provider, and price sensor. 2019. https://balancer.fi/
whitepaper.pdf.
[14] Robert C Merton. Theory of rational option pricing. The Bell
Journal of Economics and Management Science, 4(1):141–183,
1973.
[15] Marek Musiela and Marek Rutkowski. Martingale Methods in
Financial Modelling. Springer, 2nd edition, 2005.
[16] Neuralink. Neuralink: Advancing brain-machine interface
technology, 2024. Accessed: 2024-06-18.
[17] Steven E Shreve. Stochastic Calculus for Finance I: The Bi-
nomial Asset Pricing Model. Springer, 2004.
[18] Steven E Shreve. Stochastic Calculus for Finance II:
Continuous-Time Models. Springer, 2004.
[19] SpaceX. Spacex: Mars beyond, 2024. Accessed: 2024-06-18.
[20] Qin Wang, Rujia Li, Qi Wang, and Shiping Chen. Non-
fungible token (nft): Overview, evaluation, opportunities and
challenges, 2021.
[21] Bernt Øksendal. Stochastic Differential Equations: An Intro-
duction with Applications. Springer, 6th edition, 2013. See
Chapter 8 for a detailed discussion of the Feynman-Kac for-
mula.
Book generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.comBook generated only for #1035 JUAN MIGUEL SERRANO juan.serranotmf@gmail.com