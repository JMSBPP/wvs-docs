---
sha256: e967dad520bcc9bd70a5aa4a457f3b13ca9f8ee7815c2459b01c7e9e5702af8a
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 115622
---
Auctioning Time to Mitigate Latency Races:
Theory and Evidence from Blockchains
Agostino Capponi∗
and Brian Zhu†
Abstract
High-frequency trading, in both traditional and decentralized markets, induces latency races
and redundant order flow as traders spend resources to win time-sensitive opportunities. We
show that auctioning artificial time priority can redirect resources away from wasteful speed
races toward auction payments. While such waste is difficult to measure in traditional markets,
blockchain transactions provide transparent records of these competitive costs through observ-
able duplicate submissions. We study the introduction of Timeboost, a time-priority auction
mechanism on Arbitrum, a blockchain that batches transactions before settlement on Ethereum,
as a natural experiment. We find that redundant transactions decrease and platform revenue
increases relative to comparable networks, consistent with our theoretical predictions.
The authors are grateful to Edward Felten and Akaki Mamageishvili for helpful comments and discussion, and
acknowledge the support of Ripple’s University Blockchain Research Initiative.
∗
Columbia University, Department of Industrial Engineering and Operations Research and Columbia Business
School; ac3827@columbia.edu.
†
Columbia University, Department of Industrial Engineering and Operations Research; bzz2101@columbia.edu.
arXiv:2512.10094v3 [cs.GT] 16 Feb 20261 Introduction
Speed is a central determinant of trading outcomes in high-frequency environments. When access
to time-sensitive trading opportunities depends on being first to a platform, traders invest in costly
technology, connectivity, and order management systems to reduce latency. These latency races
create large expenditures with limited social upside as resources are focused toward speed acquisition
and redundant order flow creates congestion externalities. Empirical evidence quantifying these
races confirms their significance. Aquilina et al. (2022) find latency arbitrage races, where traders
rapidly attempt to “snipe” profitable opportunities and cancel failed attempts, occur roughly once
per minute per symbol in FTSE 100 stocks. However, the investment decisions underlying these
races remain unobservable, because speed technology investment in traditional markets, such as co-
location services and proprietary infrastructure, is private information and unable to be observed.
Many studies in the market-design literature have proposed altering the allocation of time pri-
ority, for example through frequent batch auctions (Budish et al. (2015)), speed bumps such as
on IEX (Woodward (2018)), or Pigouvian taxes on investment technologies (Biais et al. (2015)).
An alternative approach to mitigating latency races is to sell time priority explicitly.1 Instead of
rewarding whoever arrives first, a platform can auction an ordering advantage that determines ex-
ecution precedence for a specified time interval. The rationale behind time-priority auctions is to
convert competition over speed into competition over price: traders bid for priority rather than
investing in latency reduction technologies. The idea is closely related to broader proposals in mar-
ket design that replace technological races with price-based allocation of scarce trading privileges,
including batch auctions and congestion pricing mechanisms. Whether this reallocation occurs in
practice, however, is difficult to test in traditional markets because the underlying investments in
speed technology are not directly observable.
We study this question in blockchains, where the outcomes of latency races are more directly
observable and most notably, costly. Blockchain-based trading venues generate time-sensitive op-
portunities known as maximal extractable value (MEV), which include centralized and decentralized
exchanges (Capponi and Jia (2025)), cyclic arbitrage between exchanges (Solmaz et al. (2025)), fron-
truns (Capponi et al. (2025), Lehar and Parlour (2023)), backruns, and liquidations on decentralized
1
While the IEX introduces a 350 millisecond delay for all non-resting orders, this is not a winner-take-all approach
and is mainly designed to protect resting orders from being picked off during periods of high volatility.
1lending protocols. Participants compete to be first to exploit profitable opportunities, but the nature
of competition differs from traditional markets. Improvements to latency see diminished returns
relative to traditional electronic markets due to how blockchain networks process transactions. As
a result, traders often submit multiple copies of the same transaction in rapid succession, hoping
one executes while the rest fail. This shifts competitive resources from infrastructure investment
toward transaction fees and redundant submissions.2
Unlike traditional electronic platforms where order submission and cancellation is costless, users
incur infrastructural costs for failed attempts on blockchains. Moreover, while message data on
traditional exchanges is proprietary and may require invoking financial market regulations to ac-
quire, failed attempts are public and visible on blockchains. These duplicate submissions constitute
an on-chain trail of evidence and provide a measurable analogue of otherwise unobservable costly
efforts to achieve latency. We summarize these differences in Table 1.
We leverage the introduction of Timeboost on the Arbitrum blockchain, as a market-design
intervention in this observable environment.3 Timeboost auctions an artificial time priority via a
sealed-bid second-price auction. Rather than racing through duplicate submissions, traders can
compete over priority directly via auction. We interpret this setting as a natural laboratory that
introduces an explicit market for time priority into an environment where latency races are actively
occurring. The experiment allows us to study a general question: what happens when a platform
replaces speed races with price-based allocation of priority?
Speed technology Order submission
Centralized
exchanges
Orders propagated via proprietary net-
works to matching engine → latency
differences translate directly to priority
→ unobservable but costly competition
Traders cancel and resubmit orders
via message data at no cost → ob-
servable but costless competition
Layer-2
blockchains
Orders propagated via public networks
to sequencing node; latency advantages
are noisy and bring diminished returns
→ low incentive for competition here
Traders submit multiple identical
transactions; unsuccessful attempts
revert and incur fees → observable
and costly competition
Table 1: Dimensions of Latency Competition Across Trading Environments
2
See Section 2 for details on how blockchain transaction routing creates this competitive dynamic.
3
Layer-2 blockchains execute transactions off the main Ethereum network and periodically settle batched results on-
chain, enabling faster and cheaper execution. Most Layer-2 networks use a centralized sequencer to order transactions,
creating a setting where time-priority can be explicitly auctioned.
2We develop a model in which traders expend costly effort, interpretable as latency investment
in traditional markets or duplicate submissions in blockchain markets, to capture time-sensitive
opportunities; these investments have convex costs. We show that introducing a time-priority auc-
tion reduces equilibrium effort, reallocating resources from wasteful speed competition into platform
revenue. The blockchain environment represents a special case where effort costs are approximately
linear, as they are gas fees paid from the reversion of non-winning duplicate transactions. Addition-
ally, the user’s revert costs are awarded to the blockchain platform, whereas effort costs in general
may go to other service providers.4 Having user costs being accrued by the platform as revenue also
holds for traditional HFT settings, as many exchanges either own or tightly control the co-location
facilities used by HFT entities. Under this setting, we show that despite accruing fewer fees from
fewer transactions submitted, the auction revenue more than makes up for it, increasing overall
platform revenue.
How much time priority should be allocated, and is allocating time priority to a single trader
the most effective way to mitigate latency races? We extend the model to account for auctions that
award multiple time advantage slots of the same amount. Along the intensive margin, i.e. the size
of the time advantage, we show that broadly, total effort decreases and platform revenue increases
in the amount of time priority given to the winner(s). Along the extensive margin i.e. how many
traders receive a time advantage, we show that when the total number of users in the environment
is large, increasing the number of winners may further reduce total effort and improve platform
revenue.
We empirically test model predictions using transaction-level data across Layer-2 blockchains and
an event-study design around Timeboost’s deployment on Arbitrum, measuring latency effort via
bursts of identical transactions and comparing outcomes to control networks. We find significant
evidence that following adoption, redundant submissions decline and platform revenue increases
relative to benchmark networks. We additionally find that non-priority traders experience higher
failure rates in contested opportunities. These findings match the model’s predictions.
Our results have implications for the improved design of traditional markets. Blockchain mar-
kets make priority valuations observable through on-chain fees, with Timeboost introducing an ex-
4
Revert costs typically go to the blockchain’s sequencer node or associated decentralized autonomous organization
(DAO). These entities may then choose to burn all or part of said fees for tokenomics purposes.
3plicit market for time priority. While institutional details differ between blockchain and traditional
markets—execution speed, asset characteristics, and participant composition—the core economic
question is common to both. Can price-based priority allocation substitute for costly speed com-
petition? Our results suggest that explicit priority pricing can reallocate rents from technology
investment to platform revenue without diminishing trading activity, providing evidence relevant to
broader market design debates about latency races in high-frequency trading environments.
Our findings contribute to the broader debate on the market design of exchanges accommodat-
ing high-frequency trading. First, our model predicts that auctioning time priority reduces latency
investment effort, consistent with theoretical arguments for batch auctions, and providing another
parallel mechanism to reduce latency arms races. Second, we show that platform revenue increases
under the auction. This speaks to concerns that exchanges resist efficiency-improving design be-
cause it takes away co-location and speed-technology revenue (Budish et al. (2020)). Our empirical
analysis provides causal evidence supporting these predictions in a setting where latency competi-
tion is observable, and supports time-priority auctions as a parallel option alongside frequent batch
auctions to mitigate latency races, with the added benefit that exchange platforms can capture this
auction revenue.
Related Literature This paper contributes to three bodies of literature. First, we connect
research on latency competition and market design in traditional HFT to decentralized trading
environments through a common framework of costly time priority acquisition. A large market
microstructure literature studies how HFT and latency competition shape trading strategies and
market outcomes. Hasbrouck and Saar (2013) propose measures of low-latency activity on NAS-
DAQ and document how millisecond-scale response strategies affect spreads, depth, and short-term
volatility. O’Hara (2015) characterizes how technological change and HFT have transformed the
organization of trading, emphasizing that speed and fragmentation alter liquidity provision and
price discovery.
Similar interactions have been documented in decentralized trading environments. Daian et
al. (2020) document priority gas auctions on Ethereum-based decentralized exchanges, in which
arbitrage bots bid up gas prices to obtain favorable transaction ordering, interpreting these races
as a blockchain analogue of HFT latency competition. Subsequent work measures the scale and
4composition of MEV in DeFi: Weintraub et al. (2022) quantify MEV extraction in private relay
pools, and Ferreira Torres et al. (2024) analyze MEV across multiple networks and show that MEV
volume and composition on Layer-2s can rival Ethereum’s. Solmaz et al. (2025) identify optimistic
MEV as a major source of persistent spam-like probing on Layer-2s. Our paper connects these
literatures by placing both traditional HFT and decentralized MEV extraction in a common model
of costly time priority acquisition and by treating Layer-2 sequencers as matching engines whose
design choices shape latency races.
Second, we contribute to market design literature in both traditional and blockchain financial
markets by analyzing an explicit market for time priority and showing how it reallocates surplus
from dissipation to revenue. In traditional settings, Budish et al. (2015) propose batch auctions
to eliminate continuous-time races for queue priority, while Biais et al. (2015) study how slow
markets and taxes on speed can implement socially optimal investment in trading technology. On
blockchains, Flashbots introduced sealed-bid auctions over transaction bundles as a mechanism to
internalize MEV and reduce observable priority gas auctions (Obadia (2020)). Li et al. (2023) and
McLaughlin et al. (2025) propose sequencing rules to reduce MEV based on greedy and volatility-
minimizing heursitics, respectively. Zhu et al. (2026) study how “revert protection,” i.e. a feature
where sequencers simulate transactions and exclude failed ones from the final block, saving users
from paying gas fees on failed transactions, can make priority fee auctions more competitive and
increase sequencer revenue. Mamageishvili et al. (2023) analyze a primitive version of the Timeboost
mechanism that blends bidding and latency to allocate transaction priority. Our paper contributes to
this mechanism-design literature by analyzing single-winner time-priority auctions, as implemented
by Timeboost, and extend it to the multi-winner case. We show that under certain regimes, multi-
winner time-priority auctions may result in better efficiency outcomes.
Finally, we contribute to empirical work on decentralized exchange infrastructure by providing
novel empirical evidence on how auctioning time priority affects order flow duplication and platform
revenue. A growing DeFi microstructure literature studies automated market makers (AMMs),
arbitrage, and liquidity provision Lehar and Parlour (2025); Capponi and Jia (2025). Most closely
related to our work is Messias and Ferreira Torres (2025), which provides a descriptive empirical
analysis of Timeboost, documenting centralization of express-lane usage and high revert rates.
By contrast, we use a difference-in-differences design to estimate the causal impact of Timeboost
5adoption on redundant orderflow and platform revenue.
## 2 Institutional Details
This section describes the institutional features that make blockchain-based trading venues a natural
laboratory for studying time-priority auctions. We first contrast the infrastructure underlying tra-
ditional electronic markets with blockchain platforms, highlighting how differences in connectivity
and network architecture determine the form of latency competition. We then explain the struc-
ture of Layer-2 blockchains, the types of profit opportunities that drive competition for transaction
ordering, and the mechanics of the Timeboost mechanism that we study empirically.
Platform Infrastructure In modern electronic markets, trades occur via a centralized matching
engine housed within a data center. Market participants connect directly to this engine using ded-
icated communication infrastructure, often by co-locating servers inside the exchange facility and
routing orders through private cross-connects and fiber or microwave links. The exchange times-
tamps orders at when they enter its network interface, which determines priority. As connectivity
is tightly engineered and shared routing uncertainty is minimized, latency differences translate di-
rectly into execution priority. As a result, competition centers on capital-intensive investment in
communication technology designed to reduce physical transmission delay.
By contrast, transactions submitted to Layer-2 blockchains traverse heterogeneous paths before
reaching the ordering intermediary, often called the sequencer. Traders typically transmit through
remote procedure call (RPC) gateways, load balancers, and peer-to-peer forwarding layers, all of
which introduce random propagation and queueing delays outside the user and sequencer’s control.
Although the sequencer ultimately processes transactions by timestamp, the arrival time it observes
reflects both physical latency and network randomness. In this setting, marginal improvements
in transmission may not translate directly into improved execution priority. Thus, as observed
empirically (Solmaz et al. (2025),Gogol et al. (2025)), users adapt by submitting multiple attempts
of the same transaction.
Layer-2 Blockchains Ethereum’s consensus and blockspace design prioritize decentralization
and security, which constrains throughput and leads to congestion-induced fee spikes during active
6market periods. Layer-2 (L2) networks address this scalability bottleneck by batching and executing
transactions off-chain before posting aggregated transaction data to Ethereum for settlement.5 This
division of labor allows L2s to offer lower fees, higher transaction rates, and faster execution while
preserving the settlement assurances of the base layer. Users submit signed transactions to a
sequencer, which aggregates and executes them in batches before committing the resulting state
to the underlying “Layer-1” blockchain. The sequencing step determines which transactions obtain
time priority and therefore which traders capture time-sensitive opportunities—such as arbitrage
between automated market makers (AMMs), liquidations in lending protocols, or oracle-based price
updates.
Layer-2 blockchains implement their own transaction sequencing rules prior to settlement on
Ethereum. Most use a priority gas auction (PGA) or a first-come, first-served (FCFS) sequenc-
ing rule. Under the PGA rule, transactions are ordered by a priority fee that users submit along
with their transaction; ties in priority fee are commonly broken by the time at which the se-
quencer received the transaction. While top-of-block MEV (e.g. CEX-DEX arbitrage, liquidations)
on PGA-using networks is contested over via first-price auctions, backruns and optimistic MEV
does not require competition over priority fees, thus falling into the regime where ties are broken
by timestamp. Under the FCFS rule, transactions are ordered directly by the time at which the
sequencer received the transaction.
Sequencing rules on Layer-2 networks determine the relative ordering of transactions and there-
fore which traders capture time-sensitive opportunities. Most L2s use either priority gas auctions
(PGAs) in which users bid higher gas fees to obtain earlier queue positions, creating a fee-based
form of time priority or a first-come, first-served (FCFS) rule in which the sequencer orders transac-
tions according to observed arrival time via public or private RPC endpoints. Under both FCFS and
PGA sequencing, execution outcomes depend on latency races and/or fee bidding. In PGA settings,
when two transactions offer the same priority fee, sequencing falls back to arrival timestamp as a
tie-breaking rule.
Maximal Extractable Value A significant share of economically meaningful trading activity
on Layer-2 networks, also called rollups because they ’roll up’ many transactions into compressed
5
Despite having a centralized sequencer node, L2 networks achieve consensus by either using a dispute period.
7batches posted to Ethereum, is associated with maximal extractable value (MEV): rents that arise
from the ability to influence transaction ordering relative to liquidity, oracle updates, or protocol
state. Many common MEV opportunities consist of CEX-DEX arbitrage and DEX-DEX arbitrage.
These opportunities are strongly time-sensitive: once a profitable mispricing is exploited, the payoff
disappears for all subsequent transactions.
While MEV in the Ethereum mainnet is typically characterized by CEX-DEX arbitrage and
sandwich attacks, the MEV landscape for L2s differs substantially: Gogol et al. (2026) finds that
sandwich attacks are essentially non-existent on L2. Instead L2s exhibit a distinctive pattern of op-
timistic MEV and backruns (Solmaz et al. (2025), Gogol et al. (2025)), in which traders repeatedly
submit transactions that would be profitable conditional on favorable sequencing or oracle updates,
but that frequently revert when the required preconditions fail to materialize. Optimistic MEV
generates large volumes of nearly-identical probing transactions whose result is binary: either cap-
turing the opportunity or reverting at a cost. For the trader, reverts burn gas and sequencing fees,
while for the venue they consume blockspace and network capacity, producing congestion exter-
nalities for other users. Because MEV payoffs are winner-take-all and highly sensitive to ordering,
sequencing rules directly determine who captures MEV and who pays revert costs. Under FCFS or
PGA sequencing, traders must race to obtain time priority through arrival latency or fee bidding,
and in the absence of fine-grained latency tools, duplicate submissions serve as a costly substitute
for speed.
The Timeboost Mechanism Timeboost modifies Arbitrum’s default sequencing rule by intro-
ducing a sealed-bid, second-price auction for 200 milliseconds of transaction time priority. The
mechanism operates at the beginning of each sequencing interval. Traders submit encrypted bids,
denominated in Ether, to an off-chain autonomous auctioneer for access to the Express Lane, a short
artificial time advantage that allows the winner’s transactions to be placed ahead of the first-come,
first-served (FCFS) queue. The auction has a parameterizable reserve price, set to 0.001 ETH at the
time of writing. The auction is resolved, with the winner submitted to Arbitrum’s on-chain auction
contract, where the highest bidder wins the express lane while paying the second-highest bid as an
auction clearing price.6 Auction payments are first transferred from the winner’s address to the
6
In the case where there is only one bidder, the price paid is zero.
8auction contract, and then to a parameterizable beneficiary address, currently set to the Arbitrum
DAO treasury at the time of writing.
Time priority lasts for 60 seconds per auction round. For the auction granting Express Lane
access from time t to t+60 seconds, bidding starts at t−60 seconds and closes at t−15 seconds, with
the remaining 15 seconds used to propagate auction results on-chain. Any transactions submitted via
the Express Lane (which only the winner can submit to) are sequenced according to the timestamp
at which the sequencer receives the transaction, which we henceforth call the arrival timestamp. All
other transactions receive an artificial 200-millisecond delay to their arrival timestamp. Winners
can also “resell” Express Lane access by allowing third parties to route transactions through their
address for side payments on- or off-chain.
## 3 Model and Results
We start with a stylized, yet general model of a contest for a common-value time-sensitive trading
opportunity of value V > 0. Transactions are ordered, e.g. by a matching engine or a sequencer,
according to a first-come, first-served (FCFS) rule applied to the arrival timestamps. There are
N ≥ 3 traders indexed by i ∈ {1,...,N}. Exactly one trader can capture the opportunity, and
all other traders fail to capture the opportunity. Trader i can choose an effort level of ki ≥ 0 into
latency at a cost of C(ki), which determines their probability of successfully winning the opportunity
relative to the other traders’ investments. Specifically, we assume that latency investments result
in a Tullock contest over the opportunity, with trader i’s probability of winning as proportionate to
their investment relative to the total investment:
P(trader i wins | ki,k−i) =
ki
ki +
P
−i k−i
Assumption 1. We additionally assume the following on the cost function C : R+ → R+:
• C is twice-differentiable, strictly increasing, and convex;
• C has log-convex first derivative;
• if C is not linear, then C′(0) is sufficiently small.
9Trader i’s expected payoff is then
ui(ki;k−i) =
ki
ki +
P
−i k−i
· V − C(ki)
We solve for symmetric pure-strategy Nash equilibria in latency technology investment level, which
the following proposition characterizes.
Proposition 3.1. There exists a unique symmetric pure-strategy Nash equilibrium where each trader
chooses investment level k∗ > 0 into latency technology.
We now introduce an auction for artificial time priority T in the matching engine or sequencer
taking place before the arrival of the trading opportunity. The auction format is a sealed-bid second-
price auction where the trader with the highest bid pays the second-highest bid to the auctioneer.
Traders now participate in a sequential game consisting of the following stages:
1. Auction: Trader i submits a bid bi. The highest bidder wins the time priority for this
opportunity and pays the second-highest bid.
2. Latency Race: Trader i chooses the level to invest into latency technology based on the
results of the auction: k
(i)
w if they win, and k
(i)
l if they lose.
Instead of the value of a single profitable opportunity, the value V can now represent the total
expected value of profitable opportunities occurring during the time window in which this time
advantage is to be allocated. We assume that this advantage exponentially tilts the baseline contest
win probabilities for those who did not win the auction by exp(−kwλT) ∈ [0,1], where kw is the
auction winner’s investment level and λ captures the sensitivity of the latency technology to artificial
time priority. Under this setup, a loser j’s expected payoff in the continuation (latency race) game:
u
(j)
l (k
(j)
l ;kw,k
(−j)
l ) = V
k
(j)
l
kw + k
(j)
l +
P
−j k
(−j)
l
· exp(−kwλT)
!
− C(k
(j)
l ).
Adding up each auction loser’s probability of winning the opportunities yields the auction winner’s
probability of winning and continuation payoff:
uw(kw;k
(j)
l ) = V 1 −
P
j k
(j)
l
kw +
P
j k
(j)
l
· exp(−kwλT)
!
− C(kw).
10The following result characterizes the latency race subgame.
Proposition 3.2. There exists a unique symmetric pure-strategy Nash equilibrium (k∗
l ,k∗
w) in the
latency race subgame where k∗
l and k∗
w are the levels invested into latency technology by each trader
conditional on losing and winning the auction, respectively, and satisfy 0 < k∗
l < k∗
w. Moreover,
letting u∗
l and u∗
w denote loser and winner equilibrium continuation payoffs, we have 0 < u∗
l < u∗
w.
Introducing an auctioned time advantage alters the equilibrium of the baseline latency race.
The ordering 0 < k∗
l < k∗
w established by Proposition 3.2 captures the key behavioral response.
Intuitively, conditional on winning the auction, the marginal return to effort is amplified by the
time advantage, so the winner invests more in latency. Conditional on losing, the time advantage
reverses the slope of marginal returns, so the loser scales back effort.
Both types retain positive continuation value in equilibrium. Even the loser obtains a strictly
positive expected payoff, since its probability of winning the contest remains positive absent com-
plete dominance by the advantaged trader. The winner, however, enjoys a strictly larger continua-
tion surplus: at any fixed level of effort, the time advantage increases its contest success probability,
and the resulting gain is not fully dissipated by equilibrium effort adjustments. This surplus gap,
u∗
w − u∗
l , determines willingness to pay for the time advantage in the auction stage. Hence, the
mechanism can extract rents from the latency race while preserving participation incentives for
individual traders.
Proposition 3.3. Let b∗ = u∗
w − u∗
l . Then (b∗,k∗
l ,k∗
w) comprise the unique symmetric subgame-
perfect Nash equilibrium in the full auction-submission sequential game.
Proposition 3.3 ties everything together by showing that the unique equilibrium of the latency
race subgame endogenously pins down a unique equilibrium of the preceding auction. In the sealed-
bid second-price auction, bidding this value is the (unique symmetric) best response: any lower
common bid can be profitably outbid to secure strictly positive surplus, while any higher common
bid yields negative expected surplus relative to losing. As a result, b∗ = u∗
w − u∗
l is the unique
symmetric equilibrium bid, and combining it with the submission strategies (k∗
l ,k∗
w) yields a unique
symmetric subgame-perfect Nash equilibrium of the full sequential game.
Our key result compares the total amount of investment level expended by traders in equilibrium
without and with the time-priority auction, denoted as K∗ and K∗
A, respectively. In the language
11of this section, we can express these as
K∗
= Nk∗
,
K∗
A = k∗
w + (N − 1)k∗
l .
The following result shows that less total effort is spent to achieve latency under a time-priority
auction.
Theorem 3.4. Traders invest less into latency technology under a time-priority auction than with-
out such an auction, i.e. K∗
A < K∗.
Without an auction, priority is determined entirely by latency, so all traders must invest in speed
to remain competitive. This produces a symmetric arms race: each trader’s marginal gain from being
slightly faster is offset by others doing the same, and in equilibrium the surplus associated with
time priority are largely dissipated through latency investment. By contrast, when time priority
is allocated via a single-winner auction, only the winner has strong incentives to invest further
in latency, while the remaining traders face a systematic disadvantage and therefore scale back.
The reduction in additional latency investment by non-winners more than offsets the additional
investment by the winner, lowering aggregate speed expenditure. In effect, the auction compresses
a continuous latency race into a one-shot competition for priority, eliminating secondary races among
disadvantaged traders and converting dissipative investment into auction payments.
## 4 The Blockchain Setting and Platform Revenue
By modeling transaction submissions and random latency delays, we microfound the blockchain
setting as a reduced-form instance of the general model with linear effort costs, linking observable
on-chain behavior to latency investment. Here, the competition is over an MEV opportunity of
common value v > 0. A sequencer orders transactions according to a first-come, first-served (FCFS)
rule applied to their arrival timestamps. Exactly one trader can exploit the MEV opportunity by
being sequenced first with the proper transaction; all other copies revert, failing to capture the
opportunity. Traders can submit multiple copies of the same MEV-exploiting transaction, incurring
12a linear per-copy cost that represents the gas cost of failed attempts. 7
Each submitted transaction experiences a random delay before it is observed by the sequencer
for inclusion. Formally, the timestamp is shifted by an i.i.d. delay ε ∼ F (with density f), capturing
network latency. Suppose that trader i submits ki copies of the transaction. Then the effective
arrival timestamp relevant under FCFS is the minimum of ki i.i.d. draws from F:
Xi(ki) := min{εi1,...,εiki
}.
Under FCFS, trader i captures the opportunity iff Xi(ki) ≤ minj̸=i Xj(kj). Intuitively, submitting
more copies reduces the minimum delay and increases the chance of being first. We assume that
a successful transaction costs g ∈ (0,v) in gas fees, and reverted transactions must pay a fraction
r ∈ (0,1) of the gas fees for a successful transactions.
For tractability, we assume that latency is exponentially distributed: a single copy has a delay
of ε ∼ Exp(λ) with rate λ > 0. Then we have that
Xi(ki) ∼ Exp(kiλ).
In practice, ki should be a nonnegative integer, but for tractability, we relax this and allow traders
to choose fractional amounts for the number of copies to send, expanding their action space to
ki ∈ R+. While this breaks the interpretation that Xi(ki) is the minimum of several i.i.d. draws
from F, we still have that Xi(ki) ∼ Exp(kiλ). Trader i’s expected payoff is then
ui(ki;k−i) = (v − (1 − r)g) · Pr

Xi(ki) ≤ min
j̸=i
Xj(kj)

− rgki
:= V · Pr

Xi(ki) ≤ min
j̸=i
Xj(kj)

− Cki
where we reparameterize with V = v − (1 − r)g and C = rg.8 Under independent exponentially-
7
We assume that traders submit transactions that are identical in recipient address and calldata, but have in-
creasing nonces, meaning that failed attempts appear on-chain, such as the case for backruns and optimistic MEV.
8
Note that the cost accounting is done by adding the revert costs for all transactions plus an additional gas fee if
the transaction is successful.
13distributed latency delays, the win probability simplifies to
Pr

Xi(ki) ≤ min
j̸=i
Xj(kj)

=
ki
ki +
P
j̸=i kj
,
resembling the Tullock contest-like win probability in the general model. Under linear costs, the
equilibrium number of copies has a simple closed form:
k∗
=
N − 1
N2
·
V
C
.
Using this expression, we can compute important equilibrium quantities. Let K∗ be the total
number of transactions submitted in equilibrium. This represents the level of on-chain spam, since
K∗ − 1 of these transactions will revert on-chain, and has formula
K∗
= Nk∗
=
N − 1
N
·
V
C
.
We can also compute an individual trader’s equilibrium utility u∗
i , and how the total value V is
split between users, captured by the term W∗, and revenue R∗ accrued by the sequencer/DAO from
reverted gas fees:9
u∗
i =
V
N
− Ck∗
=
V
N2
,
W∗
= Nu∗
i =
V
N
,
R∗
= V − W∗
=
N − 1
N
· V.
These corollaries highlight the core inefficiency motivating Timeboost-style mechanisms: competi-
tion to be first under FCFS induces redundant transaction copies. In later sections we show how
auctioning a time advantage changes the competitive margin, reducing K∗ and reallocating surplus
away from revert-driven waste and toward auction payments.
We now consider the time-priority auction for a time advantage of T in the blockchain setting.
As in the baseline model, each submitted copy experiences an exponential idiosyncratic latency
9
To be precise in the case of Arbitrum, gas fees not spend on posting block data to the Ethereum mainnet go to
the Arbitrum DAO as well.
14delay before it is observed by the sequencer. Let Xw(kw) ∼ Exp(kwλ) denote the winner’s earliest
timestamp and X
(j)
ℓ ∼ Exp(klλ) denote loser j’s earliest timestamp, with being independent across
arbitrageurs. Now, the winner’s effective arrival time is Xw − T, while each loser’s effective arrival
time is still X
(j)
ℓ . Therefore the winner succeeds if and only if
Xw − T ≤ min
j
X
(j)
ℓ .
Similarly, a particular loser j succeeds if and only if
X
(j)
ℓ < min
−j
X
(−j)
ℓ and X
(j)
ℓ ≤ Xw − T.
Using standard probability calculations and exponential distribution properties, the continuation
payoffs for the winner and loser are, respectively:
uw(kw;k
(j)
l ) = V 1 −
P
j k
(j)
l
kw +
P
j k
(j)
l
· exp(−kwλT)
!
− Ckw
u
(j)
l (k
(j)
l ;kw,k
(−j)
l ) = V
k
(j)
l
kw + k
(j)
l +
P
−j k
(−j)
l
· exp(−kwλT)
!
− Ck
(j)
l ,
coinciding with those of the general model.
Evaluating the same important quantities under Timeboost, we first have that the total number
of transactions submitted in Timeboost equilibrium, denoted K∗
A, is
K∗
A = k∗
w + (N − 1)k∗
l .
Since the winner pays u∗
w − u∗
l in Timeboost equilibrium, all arbitrageurs receive an equilibrium
payoff of u∗
l . The division of the surplus value V between arbitrageurs and sequencer, denoted by
components W∗
A and R∗
A, respectively, is
W∗
K∗ = Nu∗
l ,
R∗
K∗ = V − W∗
= V − Nu∗
l .
15Proposition 4.1. Arbitrageurs send fewer total transactions and the sequencer earns more revenue
in equilibrium under Timeboost than in the baseline setting, i.e. K∗
tb < K∗ and R∗
tb > R∗.
In the blockchain setting with linear costs, latency investment manifests as duplicate transaction
submissions. The efficiency gain from the time-priority auction corresponds to a reduction in re-
dundant submissions, freeing blockspace that would otherwise be consumed by failed race attempts.
Interestingly, when considering sequencer/DAO revenue, one would expect there to be a tradeoff
between auction revenue and less gas fees from reverted duplicate transactions, but Proposition
4.1 shows that equilibrium revenue unambiguously increases under a time-priority auction. Hence,
this result indicates that time-priority auctions in blockchains, such as Timeboost, convert what
would have been dissipated in revert-related costs for incremental latency improvement into direct
payments for a substantial “latency improvement” via artificial time advantages.
## 5 Time-Priority Auctions with Multiple Winners
The analysis thus far has focused on a single-winner auction that allocates a single time advan-
tage. We now generalize the mechanism to allow multiple winners, each receiving the same time
advantage. This extension allows us to study how the allocation of priority along the extensive
margin—the number of traders granted priority—interacts with the intensive margin—the size of
the time advantage, in shaping equilibrium user effort and platform revenue. Additionally, holding
the number of winners fixed, we examine how key equilibrium outcomes vary with the size of the
time advantage. By varying the number of priority slots and the magnitude of each priority slot,
we can characterize how competition, effort, and revenue respond to broader access to priority and
more concentrated priority.
Let nw,nl ∈ N denote the number of winners and losers, respectively, with nw + nl = N. We
now assume that traders participate in a (sealed-bid) generalized second-price auction when there
are multiple winners. In such an auction, the nw highest bids receive the time advantage, and the
i-th highest bidder pays the value of the (i + 1)-th highest bid. While this auction format is not
dominant-strategy incentive compatible, it is the natural extension of the sealed-bid second-price
auction used in the single-winner model and admits weak Nash equilibria where each winner pays
the continuation value of having priority, similarly to the single-winner case.
16Letting Kw = k
(i)
w +
P
−i k
(−i)
w , Kl = k
(j)
l +
P
−j k
(−j)
l , and K = Kw + Kl. Under exponential
random delays, continuation payoffs are given by
u(i)
w (k(i)
w ;k(−i)
w ,k
(j)
l ) = V ·
k
(i)
w
Kw

1 −
Kl
K
· exp(−λTKw)

− Ck(i)
w ,
u
(j)
l (k
(j)
l ;k(i)
w ,k
(−j)
l ) = V
k
(j)
l
K
· exp(−λTKw)
!
− Ck
(j)
l .
Similarly to the previous section, we search for interior type-symmetric equilibria k∗
l ,k∗
w > 0 where
all auction losers choose k∗
l and all auction winners choose k∗
w in the resulting continuation game. We
show that if such an interior type-symmetric equilibrium exists, then 0 < k∗
l < k∗
w and 0 < u∗
l < u∗
w,
extending Proposition 3.2 to the multi-winner case. This places the “value” of the time-priority
slot at u∗
w − u∗
l , and a standard auction theory argument shows that the symmetric bid profile
b∗ = u∗
w −u∗
l constitutes a Nash equilibrium in the generalized second-price auction. The combined
profile (b∗,k∗
l ,k∗
w) is thus type-symmetric a subgame-perfect Nash equilibrium.
Our key results in the section concern the analysis of the multi-winner setting along the intensive
and extensive margins. Proposition 5.1 extends the effort and revenue results from the single-winner
environment to the multi-winner setting. The same economic forces apply here: time-priority
becomes a more reliable determinant of winning the trading opportunity, lowering the marginal
value of additional submission intensity. We expand on this result by examining total effort and
platform revenue as the size of the time advantage itself varies.
The comparative statics on effort and revenue are globally monotonic in advantage size in the
single-winner case, as more time priority further increases the value of the priority slot, redirecting
more financial resources into the auction rather than effort. With multiple winners, we show that
there exists an interval [0,T̄) such that if T ∈ [0,T̄), a unique type-symmetric equilibrium exists.
Along this interval, equilibrium total effort decreases and platform revenue increases in T, indicating
that some advantage is always better than none in terms of mitigating latency races and capturing
revenue.
Proposition 5.1. Suppose that user costs are linear and contribute to platform revenue. For any
number of winners, there exists a range of time advantage sizes for which a unique interior type-
symmetric equilibrium (k∗
l ,k∗
w) exists. In this range, increasing the priority advantage reduces total
17effort and raises platform revenue.10
Proposition 5.2 characterizes the extensive margin of time-priority allocation. Increasing the
number of winners spreads priority across more traders, presenting an interesting tradeoff of in-
centives. On one hand, competition between the loser and winner types is further dampened as
auction losers are facing multiple users with time advantages, rather than just one. Yet, on the
other hand, allowing for multiple winners now introduces competition between winners themselves.
Although priority becomes less exclusive, the aggregate demand for priority remains high because
more traders can benefit from obtaining it. In equilibrium, over a range nw ∈ [1,n̄w) where the
symmetric equilibrium is well behaved, the former force dominates the latter, resulting in a decline
in total effort and increase platform revenue.
Proposition 5.2. Suppose that user costs are linear and contribute to platform revenue. When the
total number of users in the environment is large, for any time advantage size, there exists a range
of winner counts for which a unique type-symmetric equilibrium exists. In this range, increasing the
number of winners reduces total effort and raises platform revenue.
Together, the propositions highlight distinct roles for the intensive and extensive margins. In-
creasing the size of the time advantage primarily weakens incentives to race conditional on priority
allocation, while increasing the number of winners redistributes competitive pressure across traders.
Both channels reduce wasteful competition and convert rent dissipation into platform revenue, but
they operate through different economic mechanisms: the intensive margin changes the saliency of
priority, whereas the extensive margin changes its scope.
## 6 Empirical Analysis
This section evaluates the model’s predictions using the introduction of Timeboost as an empirical
implementation of a time-priority auction. As a market-design intervention that converts latency
competition into explicit price competition for execution priority, the mechanism therefore provides
a setting in which the allocation of time priority changes while trading opportunities and participant
10
In the single-winner case, a unique type-symmetric equilibrium exists for any T ≥ 0. Equilibrium total effort
decreases and platform revenue increases monotonically in T.
18incentives remain otherwise comparable, allowing us to study how equilibrium behavior responds
when priority is priced rather than obtained through racing.
Blockchain markets make this exercise feasible because latency competition is observable. In
traditional HFT environments, investments are privately-held information and unobservable to re-
searchers. By contrast, on blockchain platforms, attempts to win latency races manifest as bursts of
identical transactions submitted within short intervals. We interpret these duplicate submissions as
the on-chain analogue of speed investment and use them as a proxy for effort. Our model predicts
that a time-priority auction should therefore reduce redundant submissions and redirect competition
toward payments for priority.
Timeboost implements precisely such a change. Prior to adoption, transaction ordering on Arbi-
trum followed a first-come, first-served rule, under which traders competed by submitting multiple
copies of the same transaction to increase the probability of early inclusion. Timeboost introduces
a sealed-bid auction that grants a short execution advantage to winning bidders, replacing pure
arrival-time competition with an explicit price-based allocation of priority. In the context of the
model, this corresponds to shifting from a race for execution probability to an auction for execution
rights.
We study this transition using transaction-level data across multiple Layer-2 blockchains as
control groups and an event-study design around Timeboost’s deployment. Despite other Layer-2
blockchains ordering transactions via priority gas fee, ties among priority fees are still broken by
timestamp, and many MEV opportunities on Layer-2 networks rely on being the first to exploit
it in the zero priority fee regime. This results in a latency race in those settings as well for these
MEV opportunities. By comparing outcomes on Arbitrum to other Layer-2 networks that did
not introduce time-priority auctions, we isolate how explicitly pricing execution priority affects
equilibrium behavior. There are three testable implications of our model:
1. Timeboost decreases transaction spamming. (Theorem 3.4)
2. Timeboost increases sequencer/DAO revenue. (Theorem 4.1)
To test these implications, we conduct a panel data analysis using data across Layer 2 blockchains
and a within-Arbitrum analysis.
196.1 Data Collection
We assemble a panel of on-chain activity for Arbitrum and a set of major EVM L2 comparison
networks using Dune Analytics. We collect data from the Arbitrum, Optimism, Polygon, Base, and
Avalanche (C-Chain) blockchains between February 17 and June 17 of 2025, a two-month window
before and after the deployment of Timeboost, which happened on April 17, 2025. Our objective
is to measure spamming and wasteful competition among bots and searchers. This phenomenon is
relevant both in FCFS sequencer settings, where arrival timing drives inclusion, and PGA environ-
ments, where actors repeatedly submit or adjust transactions to win priority.
To measure spamming in a comparable way across chains, we look for bursts of near-identical
transactions within short second-level windows. Setting a window length of 2 seconds, we track the
transaction’s sender, recipient, value, function selector, and calldata. If transactions with these same
characteristics appear multiple times in the same burst window, we label all transactions beyond
the first as repeated (redundant) attempts, interpreting them as a conservative proxy for automated
resubmission and competitive duplication. This is motivated by common bot execution logic: when
inclusion and ordering are uncertain, whether due to FCFS latency dispersion, PGA-style priority
competition, or optimistic MEV transactions Solmaz et al. (2025).
A key challenge is that the objects of interest, i.e. attempts to win ordering priority, are not
easily identifiable in blockchain data. Unlike traditional exchanges, on-chain transactions do not
have a well-labeled field identifying whether an action corresponds to arbitrage, liquidation, and so
on. In particular, economically identical actions can be implemented through arbitrary contracts.
Users frequently deploy custom contracts, proxy contracts, and externally-owned accounts (EOAs)
that encode trading logic internally. Thus, many MEV-related transactions can be executed with
minimal or even empty calldata (i.e. a call that triggers internal state-dependent execution). Since
attempting to manually classify MEV-related transactions using contract allowlists or application
binary interface (ABI) decoding is difficult and could exclude economically relevant activity, biasing
measurement toward more well-established protocols, we adopt a protocol-agnostic approach: rather
than focusing on a narrow set of known MEV contracts or function calls, we identify behavior
consistent with a latency race, i.e. multiple submissions of the same economic action within a short
interval.
20This broader classification introduces potential false positives, such as automated resubmissions
unrelated to strategic activity. Importantly, however, this noise is not specific to the treated chain:
since the same data collection procedure is applied uniformly across all Layer-2 blockchains in
the panel, any automation or wallet retry logic enters both treatment and control groups. In the
difference-in-differences design, this noise will be absorbed by chain and time fixed effects. The
key empirical identification strategy relies on differential changes in outcome variables of interest
after the introduction of Timeboost, rather than on the level of repeated activity. Remaining
misclassification would mainly add noise, in fact attenuating estimates, rather than creating a false
treatment effect.
Recent evidence supports interpreting repeated failed transactions on rollups as strategic com-
petition. Solmaz et al. (2025) find that in L2s, searchers submit transactions that repeatedly probe
liquidity pools for cyclic arbitrage opportunities, executing the trade if profitable and reverting the
transaction otherwise; these types of transactions are responsible for up to 50% of all gas fees on
some networks (e.g. Base and Optimism). Gogol et al. (2025) find similar empirical evidence of
spamming in L2s as an arbitrage strategy, and further document that searchers often prefer sub-
mitting duplicate transactions over bidding priority fees, even on networks using PGAs, indicating
competition over arrival time rather than price. Their findings support that bursts of near-identical
transactions within short time intervals—the behavioral signature that our data collection process
leverages—is indicative of MEV-related competition on L2s.
Another important nuance in the MEV landscape for L2s is how certain types of MEV differ
depending on whether a trader can replace a pending transaction or must submit independent
attempts. In “top-of-block” MEV (e.g. arbitrage or frontruns), traders repeatedly update a single
transaction using the same nonce while adjusting timing or fees; each submission replaces the
previous one, so only one execution can occur and losing attempts leave little on-chain footprint.
In “rest-of-block” MEV (e.g. backruns, optimistic arbitrage), outcomes depend on realized block
state, so replacement is infeasible and traders submit multiple transactions with increasing nonces.
Thus, unsuccessful attempts revert and remain recorded, resulting in costly duplication. Because
this distinction holds across both PGA and FCFS sequencing rules, our data measure a consistent
object across networks: observable contest effort rather than protocol-specific behavior. These
differences are summarized in Table 2.
21Top-of-block MEV (e.g. arbi-
trage, frontruns)
Rest-of-block MEV (e.g. back-
runs, optimistic MEV)
PGA L2s Contested via fee bidding wars;
failed attempts are costless and
leave no on-chain record
Contested via multi-nonce spam-
ming with zero priority fee; failed
attempts are costly and leave an
on-chain record
FCFS L2s Contested via same-nonce spam-
ming; failed attempts are costless
and leave no on-chain record
Contested via multi-nonce spam-
ming; failed attempts are costly
and leave an on-chain record
Table 2: MEV Opportunity Types Across Execution Environments
Our empirical strategy focuses on this observable component of latency competition. While
this does not account for all MEV activity, it measures the subset for which competition requires
multiple independent submissions and therefore appears on chain. Crucially, this subset exists
both on Arbitrum and on comparison Layer-2 networks, where ordering among these transactions
is likewise determined by arrival time. The identification therefore compares how traders adjust
observable effort when priority is priced instead of obtained through racing.
We first record the number of repeated transactions and the gas consumed by failed repeated
transactions, denoted by RepTXsc,t and RepGasc,t, where c indexes a blockchain and t indexes
the time period. On Arbitrum after the implementation of Timeboost, the auction proceeds also
contribute to the revenue. We thus collect data for each Timeboost auction round within our sample
window, focusing on the payment, denoted by AuctionPaymentt, of the winner (the second-highest
bid). The Revenuec,t variable then integrates revenue from gas fees and auctions across Layer 2s:
Revenuec,t = RepGasc,t + AuctionPaymentt · 1{c=Arbitrum}.
We collect a set of controls, including base gas fees and DEX volume on each blockchain, as well as
returns and volatility of Ether (relative to US dollars). While Arbitrum, Optimism, and Base use
ETH for gas payments, Polygon and Avalanche use native tokens; to account for this, we convert
values into ETH. All variables are aggregated at daily frequencies.
Summary statistics in Table 3 show substantial heterogeneity across chains in all three metrics
of interest. Base and Arbitrum exhibit the highest average repeated transaction counts, indicating
22RepTXs Revenue
Chain Mean SD Min Max Mean SD Min Max
Arbitrum 68,416 92,305 2,850 643,983 57.14 78.64 0.322 592.3
Avalanche 2,774 4,625 304 39,127 0.026 0.046 0.001 0.262
Base 216,987 142,519 62,578 857,769 0.503 0.879 0.108 8.215
Optimism 43,092 56,968 2,701 516,531 0.012 0.017 0.002 0.156
Polygon 11,290 7,686 2,577 36,718 0.001 0.002 0.000 0.009
Table 3: Summary statistics by chain for total repeated transactions and sequencer revenue.
more activity and frequent competition over MEV, while Polygon and Avalanche are far lower in
levels. Failure rates also differ markedly: Arbitrum and Polygon have relatively high mean failure
rates while Optimism stands out with a much lower mean failure share. Revenue varies by orders
of magnitude as well, as Arbitrum’s mean is far larger than the other chains, likely due to higher
base gas fees and the magnitude of transactions processed.
## 6.2 Cross-Network Analysis
We estimate the causal effect of Timeboost on transaction spamming and sequencer revenue using
a two-way fixed-effects (TWFE) design that compares changes on Arbitrum (the treated chain)
before and after the Timeboost launch to contemporaneous changes on a set of comparison L2
networks with no major changes to their sequencer ordering rules. The identifying variation is thus
cross-sectional (treated vs. control chains) interacted with time-series variation (post- vs. pre-
implementation). We supplement the baseline specification with controls for fee conditions and
market intensity, respectively: an L2 base fee measure in Ether (BaseGasL2) and within-chain DEX
volume in log USD as a DeFi activity proxy (VolumeDEX).
All outcome variables and time-varying covariates (except for the binary treatment indicator)
are standardized (z-scored) prior to estimation. This choice is practical and methodological: chains
differ by orders of magnitude in baseline transaction counts, gas usage, and revenue, and raw-
unit levels can cause the regression to be dominated by the largest networks, conflating scale with
treatment response. Standardization produces estimates in standard-deviation units, improving
comparability across chains and outcomes and making effect sizes interpretable on a common scale.
Importantly, standardization does not change the sign or statistical significance patterns relative to
23monotone transformations.
Empirical Specification and Identification. Our specification is given by the following model:
Yc,t = β · Post×Treatedc,t + γ⊤
Xc,t + αc + δt + εc,t
where the dependent variable of interest (repeated transactions or revenue) is
Y ∈ {logRepTXs,logRevenue},
Post×Treatedc,t = 1{c=Arbitrum, t≥2025-04-17} denotes the treatment effect (i.e. the differential change
on Arbitrum after Timeboost relative to the change on control chains over the same period),
X ⊆ {BaseGasL2,VolumeDEX}
is a set of controls, and εc,t is idiosyncratic noise. We include chain fixed effects αc that absorb time-
invariant differences across networks (e.g., average activity levels, application mix, sequencer infras-
tructure) and day fixed effects δt that absorb common shocks shared across chains (e.g., market-wide
volatility, macro crypto news, broad changes in user demand).
A key identification assumption is parallel trends conditional on fixed effects and controls: absent
Timeboost, would Arbitrum’s outcomes have behaved similarly to the control L2s, after conditioning
on fixed effects and control variables? This assumption is plausible because all networks share the
same EVM execution environment and no other contemporaneous changes to ordering rules occurred
on the control chains during the sample period. The outcomes we study arise from latency-sensitive
MEV opportunities exist on all rollups, with ordering ultimately depending on arrival time even
under priority-fee mechanisms. Hence, traders face the same competitive environment across chains.
Chain fixed effects absorb persistent differences in scale and application composition, while day fixed
effects absorb market-wide shocks.
Discussion of Results. Table 4 reports two-way fixed-effects estimates of the effect of Timeboost
adoption on repeated transaction activity and sequencer revenue. The coefficient on Post×Treated
is negative and statistically significant (about −0.70 standard deviations), indicating that after
24(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Post×Treated -0.699∗∗
-0.698∗∗∗
0.726∗∗∗
0.711∗∗∗
(0.281) (0.254) (0.123) (0.112)
BaseGasL2 0.096 0.150∗∗
(0.076) (0.071)
VolumeDEX 0.159 0.078
(0.125) (0.150)
Observations 605 605 605 605
N. of groups 5 5 5 5
R2
0.025 0.041 0.001 0.032
Includes chain and day fixed effects. Standard errors are clustered by chain.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table 4: This table reports two-way fixed-effects estimates of the impact of Timeboost adoption on Arbitrum
relative to control Layer-2 blockchains. The sample period spans February 17 to June 17, 2025, with Timeboost
implemented on April 17, 2025. The dependent variables are the natural logarithm of repeated transactions
(columns 1-2) and the natural logarithm of platform revenue in ETH (columns 3-4). Repeated transactions are
defined as bursts of identical transactions (same sender, recipient, value, function selector, and calldata) within 2-
second windows. Platform revenue includes gas fees from reverted transactions and, for Arbitrum post-Timeboost,
auction payments from express lane winners. Post×Treated is an indicator equal to one for Arbitrum observations
after April 17, 2025. BaseGasL2 is the Layer-2 base gas fee in ETH. VolumeDEX is the natural logarithm of DEX
trading volume in USD.
Timeboost implementation, Arbitrum experienced a sizable decline in repeated transactions relative
to the comparison L2s. This estimate is nearly unchanged when adding controls, suggesting that
this reduction is not merely driven by coincident changes in transaction costs or market-wide trading
activity.
The PostTreated coefficient for revenue is positive and significant, implying that after Timeboost,
revenue from reverted transactions and gas fees increased overall. In the appendix, we provide
additional robustness checks: we vary the window of measuring repeated transactions from 2 seconds
to 5 seconds, and change the duration of the window before and after the Timeboost adoption date.
These results carry through, with the decline in repeated transactions and gain in revenue after
Timeboost adoption being significant across these changes. Additionally, as clustered standard
errors may introduce bias when the number of groups is small, we also quantify the uncertainty
of our estimated coefficients using heteroskedasticity-robust standard errors (“HC3”), find that the
empirical results hold under this as well.
256.3 Within-Arbitrum Analysis
Our cross-chain empirical design controlled variation across chains and time by introducing fixed
effects. Now, we complement the analysis with a within-Arbitrum analysis by directly incorporating
variables that would potentially influence transaction volumes. This exercise does not replace the
TWFE identification strategy, as it lacks an external control group, but provides a useful addi-
tional robustness check: if Timeboost meaningfully altered submission behavior, we should observe
significant changes on Arbitrum itself, particularly after conditioning on proxies for activity (DEX
volume) and transaction costs (L1 and L2 base fees).
We estimate a model of the form
Yt = α + β · Postt + γ⊤
Xt + εt
where the dependent variable of interest is
Y ∈ {logRepTXs,logRevenue},
Postt = 1{t≥2025-04-17} is a post-implementation indicator, and
X ⊆ {VolumeDEX,BaseGasMain,BaseGasArb,VolatilityETH}
is a vector of time-varying controls. In all specifications we include a measure of DEX volume and
base gas fees on Ethereum; we additionally include Arbitrum base gas fee and ETH volatility to
capture additional shifts in arbitrage intensity. As a robustness check (reported in the appendix),
we also verify that conclusions are not sensitive to alternative bandwidths around the implementa-
tion date and alternative time intervals for short-window repetition. Here, we do not standardize
variables before estimation.
Results. Table 5 reports the within-Arbitrum estimates. The post-Timeboost indicator is neg-
ative and statistically significant for RepTXs, implying a sizable decrease in repeated submissions
after the implementation date even after controlling for DEX volume and fee conditions; the esti-
mated coefficients remains similar when adding mainnet base fees and market controls. Similarly
26to the cross-chain analysis, there is a positive significant relation between the post-Timeboost pe-
riod and revenue, and the post-Timeboost period is associated with higher failure rates among
non-timeboosted transactions.
(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Intercept -9.423 -8.955 2.621 -4.377
(5.991) (6.110) (7.327) (7.449)
Post -0.578∗∗ -0.453∗ 0.858∗∗ 0.594∗
(0.238) (0.240) (0.354) (0.360)
VolumeDEX 1.004∗∗∗ 0.882∗∗∗ -0.026 0.427
(0.299) (0.312) (0.364) (0.382)
BaseGasMain -0.050 -0.146 0.631∗∗∗ 0.690∗∗∗
(0.158) (0.155) (0.189) (0.198)
BaseGasArb 187.350∗∗∗ -94.886∗
(54.911) (50.138)
VolatilityETH 0.262 -3.216∗∗∗
(0.768) (0.846)
Observations 121 121 121 121
R2 0.173 0.257 0.068 0.141
Adjusted R2 0.152 0.218 0.044 0.096
Standard errors are computed using the Newey-West estimator.
Note: ∗p<0.1; ∗∗p<0.05; ∗∗∗p<0.01
Table 5: This table reports estimates from a within-Arbitrum analysis of the impact of Timeboost adoption
on redundant transactions and platform revenue. The sample consists of daily observations on Arbitrum from
February 17 to June 17, 2025, with Timeboost implemented on April 17, 2025. The dependent variables are
the natural logarithm of repeated transactions (columns 1-2) and the natural logarithm of platform revenue in
ETH (columns 3-4). Repeated transactions are defined as bursts of identical transactions (same sender, recipient,
value, function selector, and calldata) within 2-second windows. Platform revenue includes gas fees from reverted
transactions and, post-Timeboost, auction payments from express lane winners. Post is an indicator equal to one
for observations after April 17, 2025. VolumeDEX is the natural logarithm of DEX trading volume in USD on
Arbitrum. BaseGasMain is the Ethereum mainnet base gas fee in ETH. BaseGasArb is the Arbitrum base gas fee
in ETH. VolatilityETH is the daily return volatility of ETH/USD.
DEX volume is positively related to repeated transactions, consistent with higher trading activity
increasing the number of contested opportunities and associated transaction flow. The coefficient
on BaseGasArb is large and positive in the repeated transactions regressions, which is expected
as Arbitrum gas fees are determined by congestion and would be higher under more spammed
transactions. The coefficients on BaseGasMain and BaseGasArb for the revenue regressions tell a
27more interesting story: revenue from reverted gas fees and auction proceeds appears to be driven by
base gas on Ethereum, with Arbitrum gas fees and volatility having a second-order effect. Overall,
the within-chain estimates provide complementary evidence that Timeboost’s implementation is
associated with a reduction in repeated submissions on Arbitrum.
## 7 Conclusion
This paper studies how explicit markets for time priority reshape competition for time-sensitive trad-
ing opportunities. Our theoretical framework isolates a simple mechanism: when access to a time
advantage is allocated via a market—rather than via a latency race in a public queue—equilibrium
incentives to invest in speed shift from wasteful effort (duplicate submissions or latency technology)
to auction bids. In our general model, a single-winner time-priority mechanism reduces aggre-
gate latency investment and reallocates surplus from dissipation into payments for priority. In
the blockchain specialization, where latency effort manifests as duplicate on-chain transactions, this
translates into less spam, lower revert-driven resource waste, and higher platform-level revenue from
time-priority sales.
We bring this framework to data by exploiting the introduction of Timeboost, an express-lane
time-priority auction on Arbitrum, and combining cross-chain and within-chain empirical designs.
The cross-chain difference-in-differences evidence shows a large and robust post-adoption decline
in repeated transaction activity on Arbitrum relative to comparable Layer-2 networks, consistent
with reduced redundant competition in the public queue. At the same time, we document an
increase in protocol revenue from gas fees and auction proceeds, indicating that a larger share of
MEV-related surplus is captured through explicit payments rather than revert-driven dissipation. A
within-Arbitrum analysis yields qualitatively similar patterns, reinforcing the interpretation that the
introduction of an explicit time-priority mechanism causally reshapes the structure of competition
for MEV. Overall, our theoretical and empirical findings provide novel insights into the design
of exchanges in the world of high-frequency trading, presenting another approach to mitigating
externalities that arise from speed technology competition while improving revenue implications for
the platforms themselves.
28References
Aquilina, Matteo, Eric Budish, and Peter O’Neill, “Quantifying the High-Frequency Trading
“Arms Race”,” The Quarterly Journal of Economics, February 2022, 137 (1), 493–564.
Biais, Bruno, Thierry Foucault, and Sophie Moinas, “Equilibrium Fast Trading,” Journal of
Financial Economics, 2015, 116 (2), 292–313.
Budish, Eric, Peter Cramton, and John Shim, “The High-Frequency Trading Arms Race:
Frequent Batch Auctions as a Market Design Response,” Quarterly Journal of Economics, 2015,
130 (4), 1547–1621.
, Robin S. Lee, and John J. Shim, “Will the Market Fix the Market? A Theory of Stock
Exchange Competition and Innovation,” American Economic Review, 2020, 110 (6), 1607–1635.
Capponi, Agostino and Ruizhe Jia, “Liquidity Provision on Blockchain-Based Decentralized
Exchanges,” Review of Financial Studies, 2025, 38 (10), 3040–3085.
, , and Kanye Ye Wang, “Maximal Extractable Value and Allocative Inefficiencies in Public
Blockchains,” Journal of Financial Economics, 2025, 172, 104132.
Daian, Philip, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan Zhao, Iddo Bentov,
Lorenz Breidenbach, and Ari Juels, “Flash Boys 2.0: Frontrunning, Transaction Reordering,
and Consensus Instability in Decentralized Exchanges,” in “2020 IEEE Symposium on Security
and Privacy (SP)” 2020, pp. 910–927.
Gogol, Krzysztof M., Manvir Schneider, and Claudio J. Tessone, “First-Spammed, First-
Served: MEV Extraction on Fast-Finality Blockchains,” 2025. arXiv:2506.01462.
Gogol, Krzysztof, Manvir Schneider, Jan Gorzny, and Claudio Tessone, “How to Serve
Your Sandwich? MEV Attacks in Private L2 Mempools,” 2026. arXiv:2601.19570.
Hasbrouck, Joel and Gideon Saar, “Low-Latency Trading,” Journal of Financial Markets, 2013,
16 (4), 646–679.
Lehar, Alfred and Christine Parlour, “Decentralized Exchange: The Uniswap Automated Mar-
ket Maker,” Journal of Finance, 2025, 80 (1), 321–374.
29Li, Yuhao, Mengqian Zhang, Jichen Li, Elynn Chen, Xi Chen, and Xiaotie Deng, “MEV
Makes Everyone Happy under Greedy Sequencing Rule,” 2023. arXiv:2309.12640.
Mamageishvili, Akaki, Mahimna Kelkar, Jan Christoph Schlegel, and Edward W. Fel-
ten, “Buying Time: Latency Racing vs. Bidding in Transaction Ordering,” in “5th Conference on
Advances in Financial Technologies (AFT 2023),” Vol. 282 of Leibniz International Proceedings in
Informatics (LIPIcs) Schloss Dagstuhl – Leibniz-Zentrum für Informatik 2023. Preprint available
as arXiv:2306.02179.
McLaughlin, Robert, Nir Chemaya, Dingyue Liu, and Dahlia Malkhi, “CLVR Ordering
of Transactions on AMMs,” 2025. arXiv:2408.02634.
Messias, Johnnatan and Christof Ferreira Torres, “The Express Lane to Spam and Central-
ization: An Empirical Analysis of Arbitrum’s Timeboost,” 2025. arXiv:2509.22143.
Obadia, Alex, “Flashbots: Frontrunning the MEV Crisis,” https://medium.com/flashbots/
frontrunning-the-mev-crisis-40629a613752 2020. Accessed January 26, 2026.
O’Hara, Maureen, “High Frequency Market Microstructure,” Journal of Financial Economics,
2015, 116 (2), 257–270.
Solmaz, Ozan, Lioba Heimbach, Yann Vonlanthen, and Roger Wattenhofer, “Optimistic
MEV in Ethereum Layer 2s: Why Blockspace Is Always in Demand,” in “7th Conference on
Advances in Financial Technologies (AFT 2025)” 2025.
Torres, Christof Ferreira, Albin Mamuti, Ben Weintraub, Cristina Nita-Rotaru, and
Shweta Shinde, “Rolling in the Shadows: Analyzing the Extraction of MEV Across Layer-2
Rollups,” in “Proceedings of the 2024 ACM SIGSAC Conference on Computer and Communica-
tions Security (CCS ’24)” Association for Computing Machinery 2024, pp. 2591–2605.
Weintraub, Ben, Christof Ferreira Torres, Cristina Nita-Rotaru, and Radu State, “A
Flash(bot) in the Pan: Measuring Maximal Extractable Value in Private Pools,” in “Proceed-
ings of the 22nd ACM Internet Measurement Conference (IMC ’22)” Association for Computing
Machinery Nice, France 2022.
30Woodward, Megan, “Bumping Up the Competition: The Influence of IEX’s Speed Bump in US
Financial Markets,” SSRN Electronic Journal, 2018. Available at SSRN: https://ssrn.com/
abstract=3202843.
Zhu, Brian Z., Xin Wan, Ciamac C. Moallemi, Dan Robinson, and Brad Bachu, “Quan-
tifying the Value of Revert Protection,” in Christina Garman and Pedro Moreno-Sanchez, eds.,
Financial Cryptography and Data Security (FC 2025), Vol. 15752 of Lecture Notes in Computer
Science Springer, Cham 2026, pp. 72–88.
31A Proofs of Results
A.1 Proof of Proposition 3.1
Let K−i =
P
−i k−i. Differentiating, we have, for ki > 0
∂ui
∂ki
(ki;k−i) = V
K−i
(ki + K−i)2
− C′
(ki),
∂2ui
∂k2
i
(ki;k−i) = −2V
K−i
(ki + K−i)3
− C′′
(ki) < 0
since C′′ > 0 and K−i ≥ 0. Thus for each fixed K−i ≥ 0, ui(·;K) is strictly concave on (0,∞),
so player i has at most one interior best response. A strategy profile ki = k for all i ∈ [N] is an
interior symmetric equilibrium iff
∂ui
∂ki
(k;(N − 1)k) = 0,
which is exactly
f(k) := V ·
(N − 1)k
(NK)2
− C′
(k)
= V ·
N − 1
N2
·
1
k
− C′
(k) = 0.
We now show f has a unique positive root. Differentiating,
f′
(k) = −V ·
N − 1
N2
·
1
k2
− C′′
(k) < 0 for all k > 0,
so f is strictly decreasing on (0,∞). As k ↓ 0, the term (1/k) dominates while C′(k) remains finite
(by continuity of C′), so limk↓0 f(k) = +∞. As k → ∞, strict convexity and C′(k) increasing imply
C′(k) → ∞, while the first term O(1/k) → 0, hence limk→∞ f(k) = −∞. By continuity and the
intermediate value theorem, there exists at least one k∗ > 0 with f(k∗) = 0. By strict monotonicity,
this root is unique. At that k∗, strict concavity of ui(·;K∗) where K∗ = Nk∗ implies that k∗ is the
unique best response to k∗, so (k∗,...,k∗) is the unique symmetric equilibrium.
32A.2 Proof of Proposition 3.2
For a given loser j, let K−l =
P
−j k
(−j)
l . The loser’s payoff is
uj(k
(j)
l ;kw,k
(−j)
l ) = V e−kwλT k
(j)
l
k
(j)
l + kw + K−l
− C(k
(j)
l ).
Differentiating, we have, for k
(j)
l > 0,
u′
j(k
(j)
l ;kw,k
(−j)
l ) = V e−kwλT K−l
(k
(j)
l + kw + K−l)2
− C′
(k
(j)
l ),
u′′
j (k
(j)
l ;kw,k
(−j)
l ) = −2V e−kwλT K−l
(k
(j)
l + kw + K−l)3
− C′′
(k
(j)
l ) < 0.
Thus uj(·) is strictly concave on (0,∞) when at least two losers are present. Using an argument
analogous to that in the proof of Proposition 3.1, the derivative u′
j(k) is continuous, strictly de-
creasing in k, tends to +∞ as k ↓ 0 and to −∞ as k → ∞, so for each (kw,B,λT) there is a unique
interior maximizer k > 0 solving u′
j(k) = 0.
From the winner’s persepective, let Kl =
P
j k
(j)
l . The winner’s payoff satisfies
u′
w(kw;k
(j)
l ) = V Kle−kwλT λT(kw + Kl) + 1
(kw + Kl)2
− C′
(kw)
u′′
w(kw;k
(j)
l ) = −2V Ke−kwλT λT(kw + Kl) + 1
(kw + Kl)3
− V Ke−kwλT λT2(kw + Kl)2
(kw + Kl)4
− C′′
(kw) < 0
for kw > 0 and Kl > 0. Similarly u′
w is continuous, strictly decreasing in kw, with limit +∞ as
kw ↓ 0 and −∞ as kw → ∞, so there is a unique interior best response kw > 0. For a symmetric
loser profile k = kℓ, set K−l = (N − 2)kℓ and Kl = (N − 1)kℓ. The first-order conditions are then
C′
(kw) = V

(N − 1)kl
((N − 1)kl + kw)2
+
(N − 1)kl
(N − 1)kl + kw
λT

exp(−kwλT),
C′
(kl) = V

(N − 2)kl + kw
((N − 1)kl + kw)2

exp(−kwλT).
Define the right-hand sides as Rw(kl,kw) and Rl(kl,kw).
We first claim that for each fixed kw > 0, at most one kl > 0 solves C′(kl) = Rl(kl,kw). For a
33fixed kw > 0, note that
d
dkl

(N − 2)kl + kw
((N − 1)kl + k2
w

=
−(N − 1)(N − 2)kl − Nkw
((N − 1)kl + kw)2
< 0
so Rl(kw,kw) is decreasing in kl. Since C′(kl) is strictly increasing in kl by convexity of C. Therefore
the equation C′(kl) = Rl(kl,kw) has at most one solution kl > 0 for each kw > 0. Where a solution
exists, denote it by kl = κl(kw). We then show that κl(kw) is strictly decreasing in kw. For fixed
kl = 0, note that
d
dkw
(N − 2)kl + kw
(N − 1)kl + kw
2
!
=
−(N − 3)kl − kw
((N − 1)kl + kw)3
< 0.
Thus, R(kl,kw) is strictly decreasing in kw for each fixed kl > 0. Along the solution curve
C′(κl(kw)) = Rl(κl(kw),kw), if kw increases, the RHS decreases. Since C′ is strictly increasing,
κl(kw) must strictly decrease to maintain equality. Hence, κl(kw) is strictly decreasing.
We then show that kw 7→ Rw(κl(kw),kw) is strictly decreasing. Define
G(kw) := C′
(kw) − ρw(κl(kw),kw).
Because C′ is strictly increasing, kw 7→ C′(kw) is strictly increasing. Let K = (N − 1)kl + kw
and write
Rw(kl,kw) = V (N − 1)kl

1
K2
+
λT
K

e−kwλT
,
Along kl = κl(kw) we have: (i) κl is strictly decreasing, so kl decreases; (ii) K increases in kw (since
kw increases and kl decreases only weakly), and 1
K2 + λT
K is strictly decreasing in K; (iii) e−kwλT
is strictly decreasing in kw. Thus Rw(κl(kw),kw) is strictly decreasing in kw. Therefore G(kw)
is strictly increasing, so G(kw) = 0 has at most one solution k∗
w. Then k∗
l = κl(k∗
w) is uniquely
determined.
We finally show that if a solution to the above system exists, then k∗
l < k∗
w. Let R∗
w = C′(k∗
w),
R∗
l = C′(k∗
l ), and K∗ = (N − 1)k∗
l + k∗
w. Then
R∗
w − ρ∗
l = V e−k∗
wλT

(N − 1)k∗
l − ((N − 2)k∗
l + k∗
w)
(K∗)2
+
(N − 1)k∗
l
K∗
λT

34= V e−k∗
wλT

k∗
l − k∗
w
(K∗)2
+
(N − 1)k∗
l
K∗
λT

.
Assume, towards a contradiction, that k∗
w ≤ k∗
l . Then k∗
l − k∗
w ≥ 0 and the second term is strictly
positive because λT > 0, N −1 > 0, k∗
l > 0, and K∗ > 0. Hence R∗
w −ρ∗
l > 0, i.e. R∗
w > R∗
l . Using
the FOCs this gives C′(k∗
w) > C′(k∗
l ). But C convex implies C′ is nondecreasing, so k∗
w ≤ k∗
l would
imply C′(k∗
w) ≤ C′(k∗
l ), a contradiction. Thus k∗
l < k∗
w.
We finally show that 0 < u∗
l < u∗
w. Write
ul(k∗
l ;kw) = V ·
k∗
l
K(kw)
· e−kwλT
− C(k∗
l )
where K(kw) = (N − 1)k∗
l + kw. Then ∂ul/∂kw < 0, so because k∗
w > k∗
l , so we have
u∗
l = ul(k∗
l ;k∗
w) < ul(k∗
l ;k∗
l )
From strict concavity of uw(·;k∗
l ) and the FOC, k∗
w is the unique maximizer (assuming an equilibrium
exists), so
u∗
w = uw(k∗
w;k∗
l ) ≥ uw(k∗
l ;k∗
l )
At kw = k∗
l we have K(k∗
l ) = Nk∗
l . Therefore
uw(k∗
l ;k∗
l ) = V

1 −
N − 1
N
e−k∗
l λT

− C(k∗
l ),
ul(k∗
l ;k∗
l ) = V

1
N
e−k∗
l λT

− C(k∗
l ).
Subtracting the second equation from the first, we have,
uw(k∗
l ;k∗
l ) − ul(k∗
l ;k∗
l ) = V

1 − e−k∗
l λT

> 0
Combining the chain of inequalities yields
u∗
w − u∗
l ≥ uw(k∗
l ;k∗
l ) − ul(k∗
l ;k∗
l ) = V 1 − e−k∗
l λT

> 0.
35A.3 Proof of Proposition 3.3
Let N ≥ 3 bidders participate in a sealed-bid second-price auction and
vA := u∗
w − u∗
l
denote each bidder’s (common, known) incremental value of winning the Express Lane right, i.e.
the difference between being the winner and being a loser in the continuation game. Conditional
on the submission-subgame equilibrium being played after the auction, a bidder who wins and pays
price p obtains utility u∗
w − p, while a bidder who loses obtains utility u∗
l . Thus the incremental
gain from winning at price p is vA − p.
Consider a symmetric pure bid profile in which all bidders submit the same bid b ≥ 0. Under
uniform tie-breaking, each bidder wins with probability 1/N and pays the (second-highest) price b
whenever they win. Hence each bidder’s expected utility is
U(b) =
1
N
(u∗
w − b) +
N − 1
N
u∗
l = u∗
l +
1
N
(vA − b).
Fix such a symmetric profile and consider a unilateral deviation by bidder i:
1. If b < vA, bidder i can deviate to b + ε for any sufficiently small ε > 0. Then bidder i wins
with probability 1 and pays the second-highest bid, which remains b. The deviation payoff
is therefore u∗
w − b = u∗
l + (vA − b), which strictly exceeds U(b) = u∗
l + (vA − b)/N because
vA − b > 0 and N ≥ 3. Hence no symmetric profile with b < vA can be a Nash equilibrium.
2. If b > vA, bidder i can deviate to a sufficiently low bid (e.g. 0), guaranteeing that they lose
and obtain u∗
l . Under the symmetric profile, their payoff is U(b) = u∗
l + (vA − b)/N < u∗
l .
Thus any symmetric profile with b > vA admits a profitable deviation and cannot be a Nash
equilibrium.
3. If b = vA, then U(vA) = u∗
l . Deviating to any bid bi < vA guarantees losing and yields u∗
l ,
which equals U(vA). Deviating to any bid bi > vA guarantees winning and paying vA, yielding
u∗
w −vA = u∗
l , again equal to U(vA). Therefore no deviation yields a strictly higher payoff, so
b = vA is a best response to the symmetric profile.
36Combining (1)–(3), it follows that the only symmetric pure bid profile that can be a Nash equilibrium
is b∗ = vA, and it is indeed a Nash equilibrium. We proceed to verify sequential rationality in every
subgame.
1. From Proposition 3.2, after any realized auction winner, the continuation strategies form a
Nash equilibrium of the corresponding submission subgame. Hence no player can profitably
deviate after observing the auction outcome.
2. Given that the continuation equilibrium is played after the auction, each bidder’s value for
winning the Express Lane right is vA = u∗
w −u∗
l . By the previous proposition, bidding b∗ = vA
is a best response (indeed, the unique symmetric pure-strategy equilibrium bid) to the others
bidding b∗. Therefore no bidder can profitably deviate in the auction stage.
Thus, the overall strategy profile is subgame-perfect.
A.4 Proof of Theorem 3.4
Multiply the loser’s FOC by (N − 1) and add the winner’s FOC. Using K∗ = (N − 1)k∗
l + k∗
w, we
have
(N − 1) · C′
(k∗
l ) + C′
(k∗
w) = V e−k∗
wλT
"
(N − 1)
(N − 2)k∗
l + k∗
w
(K∗)2
+
(N − 1)k∗
l
(K∗)2
+
(N − 1)k∗
l λT
K∗
#
= V e−k∗
wλT
"
(N − 1) (N − 2)k∗
l + k∗
w + k∗
l

(K∗)2
+
(N − 1)k∗
l λT
K∗
#
= V e−k∗
wλT

(N − 1)D
(K∗)2
+
(N − 1)k∗
l λT
K∗

=
V (N − 1)
K∗
e−k∗
wλT
(1 + k∗
l λT). (1)
Let θ := 1/N. Since K∗
N = θk∗
w + (1 − θ)k∗
l and logC′ is convex,
logC′

K∗
N

≤ θlogC′
(k∗
w) + (1 − θ)logC′
(k∗
l ),
so exponentiating gives
C′

K∗
N

≤ (C′
(k∗
w))1/N
(C′
(k∗
l ))(N−1)/N
. (2)
37By weighted AM–GM,
(C′
(k∗
w))1/N
(C′
(k∗
l ))(N−1)/N
≤
C′(k∗
w) + (N − 1) · C′(k∗
l )
n
. (3)
Combining (2)–(3) with (1) yields
C′

K∗
N

≤
1
n
·
V (N − 1)
K∗
e−k∗
wλT
(1 + k∗
l λT). (4)
For all t ≥ 0, (1+t)e−t ≤ 1, with strict inequality for t > 0. Let t := k∗
wλT > 0. Since k∗
l < k∗
w, we
have 1 + k∗
l λT ≤ 1 + k∗
wλT = 1 + t. Thus
e−k∗
wλT
(1 + k∗
l λT) ≤ e−t
(1 + t) < 1. (5)
Substituting (5) into (4) gives
C′

K∗
N

<
V (N − 1)
NK∗
.
Define, for x > 0,
F(x) := C′
 x
N

−
V (N − 1)
Nx
.
Because C′ is increasing and x 7→ −V (N−1)
Nx is increasing on (0,∞), the function F is increasing.
By the baseline FOC, we have F(K∗
baseline) = 0. By (A.4), F(K) < 0. Since F is increasing,
F(K∗) < F(K∗
baseline) so K∗ < K∗
baseline.
A.5 Proof of Proposition 4.1
Less Redundant Submissions. We show that when C′(k) = C, noting the abuse of notation,
a solution to the equilibrium system always exists. The FOCs are now
C = V

(N − 1)kl
K2
+
(N − 1)kl
K
λT

e−kwλT
,
C = V

(N − 2)kl + kw
K2

e−kwλT
,
38where K := (N − 1)kl + kw.
For kl,kw > 0 both right-hand sides are positive, so dividing the winner’s FOC by the loser’s
FOC cancels c, V , and e−kwλT and yields
1 =
(N−1)kl
K2 + (N−1)kl
K λT
(N−2)kl+kw
K2
=
(N − 1)kl + (N − 1)klKλT
(N − 2)kl + kw
.
Rearranging gives
(N − 1)kl + (N − 1)klKλT = (N − 2)kl + kw =⇒ kw = kl + (N − 1)λT klK.
Substituting K = (N − 1)kl + kw and solving for kw in terms of kl yields
κw(kl) =
kl 1 + (N − 1)2λT kl

1 − (N − 1)λT kl
, kl ∈

0,
1
(N − 1)λT

, (6)
which is strictly positive on the stated interval. Along the curve κw(kl), the two right-hand sides of
the FOCs coincide. Define, for kl ∈ 0, 1
(N−1)λT

,
F(kl) := V
(N − 2)kl + κw(kl)
(N − 1)kl + κw(kl)
2
!
exp −λT κw(kl)

,
so that the loser’s FOC is equivalent to F(kl) = c once kw = κw(kl).
We claim limkl↓0 F(kl) = +∞ and limkl↑ 1
(N−1)λT
F(kl) = 0. First, from (6) one has κw(kl) ∼ kl
as kl ↓ 0. Hence K = (N − 1)kl + κw(kl) ∼ Nkl and (N − 2)kl + κw(kl) ∼ (N − 1)kl, so
(N − 2)kl + κw(kl)
(K∗)2
∼
(N − 1)kl
(Nkl)2
=
N − 1
N2
·
1
kl
→ +∞,
while exp(−λT κw(kl)) → 1. Thus F(kl) → +∞ as kl ↓ 0. Second, as kl ↑ 1
(N−1)λT , the denominator
1 − (N − 1)λTkl ↓ 0 in (6), so κw(kl) → +∞, which implies exp(−λT κw(kl)) → 0. Moreover the
rational factor is O(1/κw(kl)), hence remains bounded and tends to 0. Therefore F(kl) → 0 as
kl ↑ 1
(N−1)λT .
Since F is continuous on 0, 1
(N−1)λT

and takes values from +∞ down to 0, the intermediate
value theorem implies that for every c > 0 there exists k∗
l ∈ 0, 1
(N−1)λT

such that F(k∗
l ) = c.
39Setting k∗
w := kw(k∗
l ) > 0 yields a pair (k∗
l ,k∗
w) ∈ (0,∞)2 satisfying the system. Hence (k∗
l ,k∗
w)
solves the original system. The result follows naturally since a linear cost function C(k) = ck is
weakly convex, increasing, and has a weakly log-convex first-derivative.
More Sequencer Revenue. From our derived formulas for sequencer renuve in both the baseline
setting and under Timeboost, this reduces to showing u∗
l < V/N2 for any T > 0. Let K∗ :=
k∗
w + (N − 1)k∗
l denote total intensity in the Express Lane equilibrium. Using the losers’ FOC to
substitute for C in the loser payoff yields the identity
u∗
l = e−k∗
wλT
V

k∗
l
K∗
2
. (7)
Moreover, since k∗
w > k∗
l when T > 0, hence K∗ = k∗
w +(N −1)k∗
l > Nk∗
l and therefore (k∗
l /K∗)2 <
1/N2. Since e−k∗
wλT < 1 for T > 0 and k∗
w > 0, (7) yields
u∗
l = e−k∗
wλT
V

k∗
l
K∗
2
< V ·
1
N2
.
Thus u∗
l < V/N2, which implies the result.
A.6 Preliminaries for 2-Type Allocations
Suppose that nl,nw ≥ 1. Let Kw = k
(i)
w +
P
−i k
(−i)
w , Kl = k
(j)
l +
P
−j k
(−j)
l , and K = Kw + Kl.
Payoffs are then
u(i)
w (k(i)
w ;k(−i)
w ,k
(j)
l ) = V ·
k
(i)
w
Kw

1 −
Kl
K
· exp(−λTKw)

− Ck(i)
w ,
u
(j)
l (k
(j)
l ;k(i)
w ,k
(−j)
l ) = V
k
(j)
l
K
· exp(−λTKw)
!
− Ck
(j)
l .
For fixed winner i and loser j, let K−w =
P
−i k
(−i)
w and K−l =
P
−j k
(−j)
l . Differentiating, we have
du
(i)
w
dk
(i)
w
= V
"
K−w
K2
w

1 −
Kl
K
e−λTKw

+
k
(i)
w
Kw

Kl
K2
+ λT
Kl
K

e−λTKw
#
− C
du
(j)
l
dk
(j)
l
= V ·
Kw + K−l
K2
· e−λTKw
− C
40Differentiating the loser’s condition again, noting that Kw is constant in k
(j)
l and dK
dk
(j)
l
= 1, we have
d2u
(j)
l
d(k
(j)
l )2
= V (Kw + K−l)e−λTKw
d
dk
(j)
l
(K−2
) = −
2V (Kw + K−l)
K3
e−λTKw
≤ 0.
For the winner’s condition, we have
d2u
(i)
w
d(k
(i)
w )2
< 0.
The proof is given in the Additional Proofs section.
Imposing symmetry, i.e. Kl = nlkl, K−l = (nl − 1)kl, Kw = nwkw, and K−w = (nw − 1)kw, the
FOCs are then
C = V

nw − 1
n2
w kw

1 −
nlkl
nwkw + nlkl
e−λTnwkw

+
1
nw

nlkl
(nwkw + nlkl)2
+ λT
nlkl
nwkw + nlkl

e−λTnwkw

,
C = V
nwkw + (nl − 1)kl
(nwkw + nlkl)2
e−λTnwkw
.
Equilibrium effort is K∗ = nwk∗
w + nlk∗
l and equilibrium continuation payoffs are then
u∗
w = V ·
1
nw

1 −
nlk∗
l
nlk∗
l + nwk∗
w
· exp(−λTnwk∗
w)

− Ck∗
w
u∗
l = V ·
k∗
l
nlk∗
l + nwk∗
w
exp(−λTnwk∗
w) − Ck∗
l
Let W = nwkw, L = nlkl, K = W + L, αl = 1 − n−1
l , αw = 1 − n−1
w , and τ = λT. Assume that
V,C,λ,T > 0 and αl,αw ∈ [0,1). Rewrite the FOCs as
Fw(W,L,T) := αw
 1
W
·
W + L(1 − e−τW )
W + L

+ (1 − αw)
 L
(W + L)2
+
τL
W + L

exp(−τW) − ρ
Fl(W,L,T) :=
W + αlL
(W + L)2
e−τW
− ρ,
αl =
(N − 1)(1 − αw) − 1
N(1 − αw) − 1
u∗
w = V

(1 − αw)

1 −
L
W + L
e−τW

− ρ(1 − αw)W

41u∗
l = V

(1 − αl) ·
L
W + L
e−τW
− ρ(1 − αl)L

A.7 Proof of Proposition 5.1
Less Redundant Submissions. Let K(T) = nwkw(T)+nlkl(T) denote total equilibrium effort
as a function of the advantage difference T = T, where (kw(T),kl(T)) solves the symmetric equilib-
rium first-order conditions. At T = 0, the game is symmetric across all N = nw + nl players, and
the unique interior equilibrium k0 is given by the baseline case.
Differentiating the symmetric equilibrium first-order conditions with respect to T and evaluating
at T = 0 yields
k′
w(0) = λnl(N − 1)k2
0,
k′
l(0) = −λnw(N − 1)k2
0.
so K′(0) = nwk′
w(0) + nlk′
l(0) = 0. Differentiating again and solving for k′′
w(0) and k′′
l (0) yields
k′′
w(0) = −
V 3λ2
C3
nl (N − 1)2
N6

2n3
l + 5n2
l nw − 3n2
l + 4nln2
w − 3nlnw + nl + n3
w

,
k′′
l (0) = −
V 3λ2
C3
nw (N − 1)2
N6

n2
l nw + n2
l + 2nln2
w − nlnw + n3
w − 2n2
w + nw

,
K′′
(0) = nwk′′
w(0) + nlk′′
l (0) = −
V 3λ2
C3
nwnl(N − 1)2
N5
2N(N − 1) + 1

< 0
since nw,nl ≥ 1 and λ > 0. By Taylor’s theorem,
K′
(T) = K′
(0) + K′′
(0)T + o(T) = K′′
(0)T + o(T).
Since K′′(0) < 0, there existsδ > 0 such that K′(T) < 0 for all T ∈ (0,δ). Thus, total equilibrium
effort is locally decreasing in T to the right of 0.
42More Sequencer Revenue. Define L(T) = nlk∗
l (T), W(T) = nwk∗
w(T), K(T) = W(T) + L(T),
and E(T) = e−λTL(T). From earlier, we have
W′
(0) = −λnwnl(N − 1)k2
0, L′
(0) = λnwnl(N − 1)k2
0, E′
(0) = −λB(0) = −λnwk0
Define f(T) = W(T)
K(T) E(T); then for the winner’s payoff:
uw(T) =
V
nw
1 − f(T)

− Ck∗
w(T),
u′
w(T) = −
V
nw
f′
(T) − Ck′
w(T).
Using K′(0) = 0 and E(0) = 1, we have
f′
(0) =
W′(0)
K(0)
+
W(0)
K(0)
· E′
(0) = −λnwnlk0.
so, substituting the expression for k0, it follows that
u′
w(0) = λnl V k0 − C(N − 1)k2
0

∝
V 2
C
(N − 1)(2N − 1)
N4
> 0.
For the loser’s payoff, define g(T) =
k∗
l (T)
K(T) E(T); then
ul(T) = V g(T) − Ck∗
l (T),
u′
l(T) = V g′
(T) − Ck′
l(T)
Again using K′(0) = 0,
g′
(0) =
k′
l(0)
K(0)
+
kl(0)
K(0)
E′
(0) = −λnwk0
Thus u′
l(0) = λnw −V k0 + C(N − 1)k2
0

= −λnw V k0 − C(N − 1)k2
0

< 0. Auction revenue
nw(uw − ul) and sequencer revenue V − Nul are thus increasing in T around a right-neighborhood
of T = 0 for any nw,nl ≥ 1.
43A.8 Proof of Proposition 5.2
Less Redundant Submissions. Fix τ := λT > 0 (slight abuse of notation) and ρ := C/V > 0.
For each N ≥ 2, let (W(αw;N),L(αw;N)) be an equilibrium branch satisfying
Fw(W(αw;N),L(αw;N),αw) = 0,
Fl(W(αw;N),L(αw;N),αw) = 0,
Let J denote the Jacobian of the equilibrium system, i.e.
J =



FwW FwL
FlW FlL


.
From the baseline model with time-priority auction, there exists W,L > 0 satisfying both equations
at αw = 0 for any N ≥ 2. Since the system has at most one interior solution, it follows that J is
nonsingular at αw = 0 for any N ≥ 2 as well. We claim that
lim
N→∞
W′
(0) + L′
(0)

< 0,
where W′(0) = dW
dαw αw=0
and L′(0) = dL
dαw αw=0
. Let K := W + L and E := e−τW . Define
A(W,L) :=
1
W
·
W + L(1 − E)
K
B(W,L) :=
L
K2
+
τL
K
Then FOCs can be written as
Fw(W,L,αw) = αw · A(W,L) + (1 − αw) · B(W,L) · E − ρ
Fl(W,L,αw) =
W + αlL
K2
E − ρ
where αl = (N−1)(1−αw)−1
N(1−αw)−1 . At αw = 0, we denote evaluation by a superscript 0.
44Differentiate the equilibrium conditions with respect to αw:
FwW W′
+ FwLL′
+ Fwαw = 0,
FlW W′
+ FlLL′
+ Flαw = 0.
Then at αw = 0, by Cramer’s rule,
W′
(0) =
F0
wLF0
lαw
− F0
lLF0
wαw
detJ0
,
L′
(0) =
F0
lW F0
wαw
− F0
wW F0
lαw
detJ0
.
Summing yields
K′
(0) =
(F0
lW − F0
lL)F0
wαw
+ (F0
wL − F0
wW )F0
lαw
detJ0
.
From Fw = αwA+(1−αw)BE−ρ, differentiating and evaluating at αw = 0 yields F0
wαw
= A−BE.
At αw = 0, the equilibrium condition Fw = 0 gives BE = ρ, hence
F0
wαw
= A − ρ.
Next, αw enters Fl only through αl, so
Flαw =
∂Fl
∂αl
·
dαl
dαw
= −
L
K2
· E ·
1
(N(1 − αw) − 1)2
.
At αw = 0,
F0
lαw
= −
L
K2
E
(N − 1)2
= O

1
(N − 1)2

.
At αw = 0 we have αl = N−2
N−1 → 1 as N → ∞. For fixed (W,L), the formulas for the (W,L)-partials
of Fl are
F0
lW = E

−W + (1 − 2αl)L
K3
− τ
W + αlL
K2

,
45F0
lL = E

(αl − 2)W − αlL
K3

.
Letting αl → 1 yields
F0
lW → E

−W − L
K3
− τ
W + L
K2

= −E

1
K2
+
τ
K

, F0
lL → E

−W − L
K3

= −
E
K2
.
Along αw = 0, we may pass to the limit (W,L) → (W∞,L∞), so
F0
lW − F0
lL −→ −
Eτ
K
as N → ∞.
Define B(W,L) := L
K2 + τ L
K . Then the winner’s FOC at αw = 0 is
Fw(W,L,0) = B(W,L) · E − ρ
Hence, using the product rule and EW = −τE, EL = 0,
F0
wW =
∂
∂W
BE

= BW E + B EW = E BW − τB

, (8)
F0
wL =
∂
∂L
BE

= BL E + B EL = E BL. (9)
Writing B = LK−2 + τLK−1 and noting that KW ,KL = 1 we have
BW = L · (−2)K−3
· KW + τL · (−1)K−2
· KW −
2L
K3
− τ
L
K2
, (10)
BL =

K−2
+ L · (−2)K−3
· KL

+ τ

K−1
+ L · (−1)K−2
· KL

=
W − L
K3
+ τ
W
K2
. (11)
Substituting (10)–(11) into (8)–(9) gives the explicit Jacobian entries:
F0
wW = E

−
2L
K3
− τ
L
K2
− τ

L
K2
+ τ
L
K

= E

−
2L
K3
− 2τ
L
K2
− τ2 L
K

,
F0
wL = E

W − L
K3
+ τ
W
K2

.
46Since F0
lαw
< 0 and
F0
wL − F0
wW =

1
K2
+ τ
W + 2L
K2
+ τ2 L
K

E > 0,
it follows that (F0
wL − F0
wW )F0
lαw
< 0. Since equilibrium is unique when αw = 0 for any N, detJ0
stays bounded away from 0 for large N:
∃c > 0, ∃N0 such that |detJ0
| ≥ c ∀N ≥ N0. (12)
Next, F0
wW and F0
wL are given explicitly by (A.8)–(A.8). In particular, for fixed (W,L) these
are finite, so there exists M < ∞ such that for all large N,
|F0
wL − F0
wW | ≤ M. (13)
Combining the expressions derived , (12), and (13) yields the explicit estimate
(F0
wL − F0
wW )F0
lαw
detJ0
≤
M
c
F0
lαw
=
M
c
·
L
K2
·
E
(N − 1)2
.
Because L/K2 and E are bounded along the convergent equilibrium sequence, the right-hand side
tends to zero as N → ∞. Therefore,
(F0
wL − F0
wW )F0
lαw
detJ0
→ 0 as N → ∞.
and thus,
lim
N→∞
W′
(0) + L′
(0)

= lim
N→∞
(F0
lW − F0
lL)F0
wαw
detJ0
. (14)
It remains to find the sign of detJ0 and F0
wαw
. Let
detJ0
= E2 e DN,
where e DN is the determinant of the E-free matrix. Let N → ∞, equivalently αl → 1, and define
47e D∞ := limN→∞
e DN. A direct algebraic simplification yields
e D∞ =
1
K4
+
τ(L + 2W)
K4
+
τ2
K2
> 0.
Consequently, for all sufficiently large N,
e DN > 0 =⇒ detJ0
= E2 e DN > 0.
Let N → ∞ so αl → 1. Then the loser’s FOC at αw = 0 is
W + L
K2
E = ρ =⇒ E = ρK.
Combining with the winner’s first-order condition gives BρK = K, i.e. BK = 1. Since B = L
K2 +τL
K ,
this implies
L
K
=
1
1 + τK
,
W = K − L =
τK2
1 + τK
.
By (A.8), F0
wαw
= A − ρ, so dividing by E > 0 and using ρ/E = 1/K (because E = ρK),
F0
wαw
E
=
A
E
−
1
K
.
We also have
A =
1
W
·
W + L(1 − E)
K
=
1
W

1 −
L
K
E

=⇒
A
E
=
1
W

1
E
−
L
K

.
Using E = ρK, L
K = 1
1+τK , and 1
W = 1+τK
τK2 yields
F0
wαw
E
=
1 + τK
τK2

1
ρK
− 1

.
Because W > 0 and T > 0, we have E = e−τW ∈ (0,1), hence ρK = E ∈ (0,1) and thus 1
ρK −1 > 0.
48All remaining factors are positive, so as N → ∞
F0
wαw
E
> 0 =⇒ F0
wαw
> 0
Combining everything meas that for large N, the quotient in (14) converges to a strictly negative
limit, and hence limN→∞ W′(0) + L′(0)

< 0.
More Sequencer Revenue. Using our reparameterizations, we can write a loser’s equilibrium
continuation payoff, which we now denote by U, as
U := V
 L
K

(1 − αl)E − C L(1 − αl) = V (1 − αl)
 L
K
E − ρL

,
and assume the equilibrium path in the (αw,N)-space, given by (W(αw;N),L(αw;N)) satisfies
Fw(W,L,αw) = 0,
Fl(W,L,αw) = 0.
Let H := L
K E − ρL. Then
U = V (1 − αl)H
U′
= V

(1 − αl)H′
− α′
lH

.
Since

L
K
′
=
WL′ − LW′
K2
, E′
= −TW′
E,
we obtain
H′
= E

WL′ − LW′
K2
− τ
L
K
W′

− ρL′
.
49Substituting, we then have
U′
= V

(1 − αl)

E

WL′ − LW′
K2
− τ
L
K
W′

− ρL′

− α′
l

L
K
E − ρL

.
In equilibrium, Fl = 0 implies
W + αlL
K2
E = R =⇒ E =
ρK2
W + αlL
.
Thus, we have
L
K
E − ρL = ρL

K − (W + αlL)
W + αlL

= ρL
(1 − αl)L
W + αlL
.
We can write the loser-type’s equilibrium utility as
U = V (1 − αl)ρL
(1 − αl)L
W + αlL
= C
(1 − αl)2L2
W + αlL
.
Let ε := 1 − αl and D := W + αlL. Then
U = C
ε2L2
D
.
Differentiating with respect to αw gives
U′
= C

2εε′L2 + 2ε2LL′
D
−
ε2L2D′
D2

,
D′
= W′
+ α′
lL + αlL′
.
At αw = 0,
εN := 1 − αl(0) =
1
N − 1
=⇒ ε′
N = ε2
N, α′
l(0) = −ε2
N.
50Substituting into U′ yields
U′
(0) = C ε2
N
2εNL2 + 2L · L′(0)
D0
−
L2 W′(0) + (1 − εN)L′(0)

D2
0
!
+ O(ε4
N),
where D0 = W + (1 − εN)L → S as N → ∞. Dividing by Cε2
N and letting N → ∞ gives
lim
N→∞
U′(0)
Cε2
N
=
2L∞L′
∞
S∞
−
L2
∞(W′
∞ + L′
∞)
S2
∞
. (7)
As N → ∞, αl → 1 and Flαw(0) → 0, so by the Implicit Function Theorem,



F∞
wW F∞
wL
F∞
lW F∞
lL




W′
∞
L′
∞

= −

F∞
wαw
0

.
The second row implies
F∞
lW W′
∞ + F∞
lL L′
∞ = 0.
At αl = 1,
F∞
lW = −E

1
K2
+
T
K

,
F∞
lL = −
E
K2
,
so L′
∞ = −(1 + τK∞)W′
∞. From the limiting αw = 0 equilibrium we also have
L∞
S∞
=
1
1 + τK∞
.
Moreover, since limN→∞(W′(0) + L′(0)) < 0, it follows that W′
∞ > 0. Substituting yields
2L∞L′
∞
K∞
−
L2
∞(W′
∞ + L′
∞)
K2
∞
= W′
∞

−2(1 + x)
1
1 + x
+ x
1
(1 + x)2

,
where we denote x := τK∞ > 0. Simplifying,
= W′
∞

−2 +
x
(1 + x)2

= −W′
∞
2 + 3x + 2x2
(1 + x)2
< 0,
51since W′
∞ > 0 and x > 0. Therefore, limN→∞
U′(0)
Cε2
N
< 0 so it follows that limN→∞ U′(0) = 0−. In
particular, U′(0) < 0 for all sufficiently large N.
B Additional Proofs
B.1 Multiple Winners: Concavity of Winner’s Payoff
Write the winner’s payoff as
u(i)
w (x;a,L) = V ·
x
Kw

1 −
L
K
exp(−τKw)

− Cx.
Since (−Cx)′′ = 0 and V > 0, it suffices to prove concavity of
s(x) :=
x
Kw

1 −
Kl
K
e−τKw

where Kw = K−w + x and K = Kl + K−w + x. A direct differentiation yields the identity
s′′
(x) = −
e−τKw
K3
wK3
P(x;Kl,K−w,τ), (15)
where P(x;K−w,Kl,τ) = eτKwA(x;K−w,Kl) + B(x;K−w,Kl,τ) with
A(x;K−w,Kl) := 2K3
l K−w + 6K2
l K2
−w + 6K2
l K−wx + 6KlK3
−w + 12KlK2
−wx + 6KlK−wx2
+ 2K4
−w + 6K3
−wx + 6K2
−wx2
+ 2K−wx3
,
B(x;K−w,Kl,τ) := K3
l K2
−wτ2
x − 2K3
l K2
−wτ + 2K3
l K−wτ2
x2
− 2K3
l K−wτx − 2K3
l K−w + K3
l τ2
x3
+ 2K2
l K3
−wτ2
x − 4K2
l K3
−wτ + 6K2
l K2
−wτ2
x2
− 6K2
l K2
−wτx − 6K2
l K2
−w
+ 6K2
l K−wτ2
x3
− 6K2
l K−wx + 2K2
l τ2
x4
+ 2K2
l τx3
+ KlK4
−wτ2
x
− 2KlK4
−wτ + 4KlK3
−wτ2
x2
− 4KlK3
−wτx − 4KlK3
−w
+ 6KlK2
−wτ2
x3
− 6KlK2
−wx + 4KlK−wτ2
x4
+ 4KlK−wτx3
+ Klτ2
x5
+ 2Klτx4
+ 2Klx3
.
52Thus s′′(x) ≤ 0 if P(x;K−w,Kl,τ) ≥ 0. Each term in has a nonnegative coefficient, so
A(x;K−w,Kl) ≥ 0.
Moreover, for all t ≥ 0, et ≥ 1 + t (e.g. by convexity of et or by the monotonicity of et − 1 − t).
Applying this with t = τKw ≥ 0 gives
eτKw
≥ 1 + τKw.
so it follows that
P(x;K−w,Kl,τ) ≥ (1 + τKw)A(x;K−w,Kl) + B(x;K−w,Kl,τ).
Define the right-hand side of (??) as
R(x;K−w,Kl,τ) := (1 + τKw) · A(x;K−w,Kl) + B(x;K−w,Kl,τ).
We can write R(x;K−w,Kl,τ) as
R(x;K−w,Kl,τ) = (K−w + x)2
S(x;K−w,Kl,τ),
where
S(x;K−w,Kl,τ) := K3
l τ2
x + 2K2
l K−wτ2
x + 2K2
l K−wτ + 2K2
l τ2
x2
+ 2K2
l τx
+ KlK2
−wτ2
x + 4KlK2
−wτ + 2KlK−wτ2
x2
+ 6KlK−wτx + 2KlK−w
+ Klτ2
x3
+ 2Klτx2
+ 2Klx + 2K3
−wτ + 4K2
−wτx + 2K2
−w
+ 2K−wτx2
+ 2K−wx.
Every term in S has a nonnegative coefficient, so S(x;K−w,Kl,τ) and thus R(x;K−w,Kl,τ) ≥ 0 as
well as P(x;K−w,Kl,τ) are nonnegative. Moreover, if (K−w,Kl) ̸= (0,0) and Kw = K−w + x > 0,
then the inequality is strict, so u
(i)
w is concave in k
(i)
w .
53B.2 Global Monotonicity of K(T) when nw = 1
Fix T ≥ 0. Define E(T) = exp −λT kw

and K(T) = kw(T)+nl ·kl(T). The symmetric equilibrium
FOCs are then
ρ =

nl · kl(T)
K(T)2
+ λT
nlkl(T)
K(T)

E(T),
ρ =
kw(T) + (nl − 1) · kl(T)
K(T)2
E(T).
Suppressing dependence on T, equating the right-hand sides and cancelling E(T) > 0 yields
nlkl
K2
+ λT
nlkl
K
=
kw + (nl − 1)kl
K2
=⇒ K = (nl + 1)kl + λT nlklK.
Defining θ = λTK and D(θ) = (1 + θ)nl + 1, we obtain
kl =
K
D(θ)
,
kw =
(1 + nlθ)K
D(θ)
.
Substituting the above expression for kw into the loser’s FOC, we have
K = kw + (nl − 1)kl =
(1 + nlθ)K
D(θ)
+
(nl − 1)K
D(θ)
=
nl(1 + θ)K
D(θ)
.
so we obtain a single equation in K and T:
H(K,T) :=
nl(1 + θ)
K · D(θ)
exp

−λT
(1 + nlθ)K
D(θ)

= ρ,
Define G(K,T) := H(K,T)−ρ. Along the equilibrium path G(K(T),T) = 0, the implicit-function
theorem yields
K′
(T) = −
GT
GK
= −
HT
HK
.
Thus it suffices to show HT < 0 and HK < 0 for all T > 0.
54We first show that HT < 0. Note that
logH(K,T) = lognl + log(1 + θ) − logK − logD(θ) − λTkw.
Holding K fixed, we have ∂T θ = λK and ∂T D(θ) = nl∂T θ = λnlK. Moreover,
∂kw
∂θ
=
∂
∂θ

(1 + nlθ)K
D(θ)

= K ·
nlD(θ) − (1 + nlθ)nl
D(θ)2
= K ·
n2
l
D(θ)2
,
so we have that
∂kw
∂T
=
∂kw
∂θ
·
∂θ
∂T
= λn2
l
K2
D(θ)2
.
Therefore,
∂
∂T
logH(K,T) =
λK
1 + θ
−
λnlK
D(θ)
− λkw − λT
∂kw
∂T
=
λK
1 + θ
−
λnlK
D(θ)
− λ
(1 + nlθ)K
D(θ)
− λT

λn2
l
K2
D(θ)2

.
Dividing by λK > 0, we have
1
λK
∂
∂T
logH(K,T) =
1
1 + θ
−
nl
D(θ)
−
1 + nlθ
D(θ)
−
θn2
l
D(θ)2
= −
θ
1 + θ
−
θn2
l
D(θ)2
< 0
Hence ∂T logH(K,T) < 0, so HT (K,T) < 0 for all T,K > 0.
We then show that HK < 0, holding T fixed. Note that ∂Kθ = λT = θ/K and ∂KD(θ) =
nl∂Kθ = nlθ/K. Then
∂
∂K
logH(K,T) =
1
1 + θ
∂θ
∂K
−
1
K
−
1
D(θ)
∂D
∂K
− λT
∂kw
∂K
=
a/K
1 + θ
−
1
K
−
nlθ/K
D(θ)
−
a
K

1 + nlθ
D(θ)
+
an2
l
D(θ)2

.
Multiplying by K > 0, we have
K
∂
∂K
logH(K,T) =
θ
1 + θ
− 1 −
nlθ
D(θ)
−
θ(1 + nlθ)
D(θ)
−
θ2n2
l
D(θ)2
= −
1
1 + θ
− θ −
θ2n2
l
D(θ)2
< 0
so HK(K,T) < 0.
55B.3 Multiple Winners: Winner Copies Greater Than Loser Copies
Write W = nwk∗
w, L = nlk∗
l , and E = e−τW . Dividing both equations by V and rewriting them in
terms of (W,L) yields
C
V
=
nw − 1
nwW

1 −
L
W + L
E

+
1
nw

L
(W + L)2
+ τ
L
W + L

E,
C
V
=
W + nl−1
nl
L
(W + L)2
E.
Subtracting the loser’s FOC from the winner’s FOC and multiplying by nlnwW(W +L)2 > 0 yields
nl(nw − 1)(W + L)2
+ E · Ξ(W,L) = 0, (16)
where Ξ(W,L) = −nlnw(W + L)2 + τnlWL(W + L) + 2nlWL + nlL2 + nwWL.
Step 3. Use of E < 1. For nl > 0, nw > 1, and W + L > 0, the first term in above is strictly
positive, so Ξ(W,L) < 0 and
E =
nl(nw − 1)(W + L)2
−Ξ(W,L)
.
Since τ > 0 and W > 0, we have E = e−τW ∈ (0,1), and therefore E < 1 implies
nl(nw − 1)(W + L)2
< −Ξ(W,L).
Expanding Ξ and collecting terms yields
0 < W

nlW − nwL − τnlL(W + L)

.
As W > 0, this implies nlW > nwL + τnlL(W + L) > nwL. Diving by nlnw yields k∗
l < k∗
w.
56B.4 Multiple Winners: Winner Utility Greater Than Loser Utility
Let K = W + L and E = exp−τW . Using the equilibrium condition for ρ, we have
u∗
w − u∗
l = (1 − αw) − [(1 − αl) − (1 − αw)]
L
K
E − [(1 − αw)W + (1 − αl)L]
W + αlL
K2
E
=
1
nw
−

1
nw
+
1
nl

nlkl
K
E − (kw − kl) ·
K − kl
K2
E
Multiplying by nw, it suffices to show that
1 >

1 +
nw
nl

nlkl
nlkl + nwkw
− nw(kw − kl)
K − kl
K2

E.
Since E < 1, it remains to show that the bracketed expression is less than one as well. Note that

1 +
nw
nl

nlkl
nlkl + nwkw
− nw(kw − kl)
K − kl
K2
=
1
K2
[(nlkl − nwkw + 2nwkl)K + nwkl(kw − kl)]
We claim that (nlkl − nwkw + 2nwkl)K + nwkl(kw − kl) < K2. Dividing by K yields
nlkl + 2nwkl − nwkw + nwkl(kw − kl) < nlkl + nwkw
Collecting terms and simplifying yields
kl
K
(kw − kl) < 2(kw − kl)
which holds by construction.
C Robustness Checks
C.1 Prior Treatment Date as Placebo
For a properly identified setup, treatment effects should attenuate or disappear when designating
a date before the actual treatment date. We move the “treatment date” 15 days prior to April 2,
2025.
57(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Post×Treated -0.318 -0.347 0.213 0.158
(0.314) (0.294) (0.144) (0.131)
BaseGasL2 0.097 0.153∗∗
(0.071) (0.069)
VolumeDEX 0.167 0.069
(0.121) (0.160)
Observations 605 605 605 605
N. of groups 5 5 5 5
R2
0.005 0.023 0.003 0.033
Includes chain and day fixed effects. Standard errors are clustered by chain.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.1: This table reports two-way fixed-effects estimates using a placebo treatment date of April 2, 2025—15
days prior to the actual Timeboost implementation on April 17, 2025. The sample period spans February 17
to June 17, 2025. The dependent variables are the natural logarithm of repeated transactions (columns 1-2)
and the natural logarithm of platform revenue in ETH (columns 3-4). Repeated transactions are defined as
bursts of identical transactions (same sender, recipient, value, function selector, and calldata) within 2-second
windows. Platform revenue includes gas fees from reverted transactions and, for Arbitrum after the placebo date,
hypothetical auction payments. Post×Treated is an indicator equal to one for Arbitrum observations after April
2, 2025. BaseGasL2 is the Layer-2 base gas fee in ETH. VolumeDEX is the natural logarithm of DEX trading
volume in USD. All variables except the treatment indicator are standardized (z-scored) prior to estimation. All
specifications include chain and day fixed effects. Standard errors are clustered by chain. Under the parallel trends
assumption, we should not observe significant treatment effects when using a pre-treatment placebo date.
58C.2 Narrower Study Window
We narrow the study window by 15 days on both ends, so that the new sample period is from March
2 to June 2, 2025.
(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Post×Treated -0.564∗∗
-0.587∗∗
0.964∗∗∗
0.924∗∗∗
(0.242) (0.238) (0.044) (0.052)
BaseGasL2 0.059 0.104
(0.050) (0.067)
VolumeDEX 0.058 0.132
(0.091) (0.149)
Observations 465 465 465 465
N. of groups 5 5 5 5
R2
0.016 0.020 0.060 0.081
Includes chain and day fixed effects. Standard errors are clustered by chain.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.2: This table reports two-way fixed-effects estimates using a narrower sample window that excludes the
first and last 15 days of the original sample period. The sample spans March 2 to June 2, 2025, with Timeboost
implemented on April 17, 2025. The dependent variables are the natural logarithm of repeated transactions
(columns 1-2) and the natural logarithm of platform revenue in ETH (columns 3-4). Repeated transactions are
defined as bursts of identical transactions (same sender, recipient, value, function selector, and calldata) within 2-
second windows. Platform revenue includes gas fees from reverted transactions and, for Arbitrum post-Timeboost,
auction payments from express lane winners. Post×Treated is an indicator equal to one for Arbitrum observations
after April 17, 2025. BaseGasL2 is the Layer-2 base gas fee in ETH. VolumeDEX is the natural logarithm of
DEX trading volume in USD. All variables except the treatment indicator are standardized (z-scored) prior to
estimation. All specifications include chain and day fixed effects. Standard errors are clustered by chain. This
narrower window tests whether results are sensitive to the choice of pre- and post-treatment periods.
59(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Intercept -11.000∗
-11.939∗
-3.732 -8.377
(5.681) (6.153) (6.958) (7.223)
Post -0.462∗
-0.390 1.307∗∗∗
1.155∗∗∗
(0.259) (0.263) (0.355) (0.370)
VolumeDEX 1.090∗∗∗
1.053∗∗∗
0.286 0.563
(0.283) (0.315) (0.345) (0.366)
BaseGasMain -0.200 -0.264∗
0.355∗∗
0.376∗∗
(0.149) (0.145) (0.169) (0.175)
BaseGasArb 169.113∗∗∗
-19.931
(52.415) (34.822)
VolatilityETH -0.114 -1.926∗∗
(0.839) (0.775)
Observations 123 123 123 123
R2
0.224 0.255 0.313 0.342
Adjusted R2
0.205 0.224 0.296 0.314
Standard errors are computed using the Newey-West estimator.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.3: This table reports estimates from a within-Arbitrum analysis using a wider 5-second window to identify
repeated transactions. The sample consists of daily observations on Arbitrum from March 2 to June 2, 2025,
with Timeboost implemented on April 17, 2025. The dependent variables are the natural logarithm of repeated
transactions (columns 1-2) and the natural logarithm of platform revenue in ETH (columns 3-4). Repeated
transactions are defined as bursts of identical transactions (same sender, recipient, value, function selector, and
calldata) within 5-second windows, compared to the 2-second baseline. Platform revenue includes gas fees from
reverted transactions and, post-Timeboost, auction payments from express lane winners. Post is an indicator
equal to one for observations after April 17, 2025. VolumeDEX is the natural logarithm of DEX trading volume in
USD on Arbitrum. BaseGasMain is the Ethereum mainnet base gas fee in ETH. BaseGasArb is the Arbitrum base
gas fee in ETH. VolatilityETH is the daily return volatility of ETH/USD. Variables are not standardized in this
specification. Standard errors are computed using the Newey-West estimator to account for heteroskedasticity and
autocorrelation. This specification tests whether results are sensitive to the choice of time window for identifying
repeated transactions.
C.3 Wider Interval for Repeated Transactions
We widen the interval under which we search for repeated transactions from 2 seconds to 5 seconds.
60(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Post×Treated -0.671∗∗∗
-0.673∗∗∗
0.772∗∗∗
0.724∗∗∗
(0.191) (0.159) (0.195) (0.135)
BaseGasL2 0.145∗∗∗
0.403∗∗∗
(0.044) (0.115)
VolumeDEX 0.207∗
0.139
(0.108) (0.128)
Observations 605 605 605 605
N. of groups 5 5 5 5
R2
0.022 0.056 0.033 0.204
Includes chain and day fixed effects. Standard errors are clustered by chain.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.4: This table reports two-way fixed-effects estimates using a wider time interval to detect repeated
identical transactions. The sample period spans February 17 to June 17, 2025, with Timeboost implemented on
Arbitrum on April 17, 2025. Control Layer-2 blockchains include Optimism, Base, Polygon, and Avalanche. The
dependent variables are the natural logarithm of repeated transactions (columns 1-2) and the natural logarithm of
platform revenue in ETH (columns 3-4). Repeated transactions are defined as bursts of identical transactions (same
sender, recipient, value, function selector, and calldata) within 2-second windows. Platform revenue includes gas
fees from reverted transactions and, for Arbitrum post-Timeboost, auction payments from express lane winners.
Post×Treated is an indicator equal to one for Arbitrum observations after April 17, 2025. BaseGasL2 is the
Layer-2 base gas fee in ETH. VolumeDEX is the natural logarithm of DEX trading volume in USD. All variables
except the treatment indicator are standardized (z-scored) prior to estimation. All specifications include chain and
day fixed effects. This specification addresses concerns that cluster-robust standard errors may be biased when
the number of clusters is small (five chains).
61(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Intercept -9.453 -9.028 0.566 -6.362
(5.784) (5.859) (7.011) (7.060)
Post -0.542∗∗
-0.416∗
0.783∗∗
0.527
(0.228) (0.228) (0.344) (0.350)
VolumeDEX 1.015∗∗∗
0.894∗∗∗
0.084 0.529
(0.288) (0.299) (0.348) (0.360)
BaseGasMain -0.062 -0.159 0.608∗∗∗
0.663∗∗∗
(0.152) (0.149) (0.182) (0.191)
BaseGasArb 190.117∗∗∗
-86.322∗
(52.041) (50.565)
VolatilityETH 0.243 -3.182∗∗∗
(0.723) (0.830)
Observations 121 121 121 121
R2
0.262 0.315 0.229 0.313
Adjusted R2
0.243 0.285 0.209 0.283
Standard errors are computed using the Newey-West estimator.
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.5: This table reports two-way fixed-effects estimates of the impact of Timeboost adoption on Arbitrum
relative to control Layer-2 blockchains. The sample period spans February 17 to June 17, 2025, with Timeboost
implemented on April 17, 2025. The dependent variables are the natural logarithm of repeated transactions
(columns 1-2) and the natural logarithm of platform revenue in ETH (columns 3-4). Repeated transactions are
defined as bursts of identical transactions (same sender, recipient, value, function selector, and calldata) within 2-
second windows. Platform revenue includes gas fees from reverted transactions and, for Arbitrum post-Timeboost,
auction payments from express lane winners. Post×Treated is an indicator equal to one for Arbitrum observations
after April 17, 2025. BaseGasL2 is the Layer-2 base gas fee in ETH. VolumeDEX is the natural logarithm of DEX
trading volume in USD.
62C.4 Heteroskedasticity and Autocorrelation Robust Standard Errors
(1) (2) (3) (4)
logRepTXs logRepTXs logRevenue logRevenue
Post×Treated -0.699∗∗∗
-0.698∗∗∗
0.760∗∗∗
0.745∗∗∗
(0.172) (0.170) (0.174) (0.179)
BaseGasL2 0.096∗∗
0.142∗∗∗
(0.041) (0.043)
VolumeDEX 0.159∗∗
0.074
(0.074) (0.061)
Observations 605 605 605 605
N. of groups 5 5 5 5
R2
0.025 0.041 0.037 0.063
Includes chain and day fixed effects. Standard errors are robust (HC3).
Note: ∗
p<0.1; ∗∗
p<0.05; ∗∗∗
p<0.01
Table A.6: This table reports two-way fixed-effects estimates using heteroskedasticity-robust (HC3) standard errors
instead of cluster-robust standard errors. The treatment group is Arbitrum after April 17, 2025, and the control
group consists of other Layer-2 blockchains. The dependent variables are the natural logarithm of repeated
transactions (columns 1–2) and the natural logarithm of platform revenue in ETH (columns 3–4). Repeated
transactions are defined as bursts of identical transactions within 2-second windows. Platform revenue includes
gas fees from reverted transactions and auction payments from express lane winners. BaseGasL2 is the Layer-2
base gas fee in ETH and VolumeDEX is the natural logarithm of DEX trading volume in USD. All specifications
include chain and day fixed effects and use HC3 robust standard errors.
63