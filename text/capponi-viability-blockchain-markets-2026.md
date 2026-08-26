---
sha256: 8ee2a1fe8dfc099ed03eee1fbe21d494cca6096880a61fcf0f2f2840e24aca5a
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 121259
---
The Viability of Blockchain Markets under
Discrete Clearing and Paid Priority
Agostino Capponi∗
Álvaro Cartea†
Fayçal Drissi‡
Latest version.
This version: May 19, 2026.
First version: March 21, 2025.
ABSTRACT
This paper develops a model to evaluate the viability of blockchain markets as the sole venue
for price formation. Blockchains clear at discrete intervals called block time, and transactions are
executed sequentially according to priority fees paid by traders who compete for queue position.
We show that these features undermine the viability of markets. Paid-priority ordering induces
endogenous selection, where only traders with sufficiently high valuations participate. The par-
ticipation cutoff rises with competition, which intensifies with lower information costs or higher
liquidity demand. This hinders price discovery and biases prices. It also impairs liquidity: the
cutoff concentrates trading among aggressive traders and increases adverse selection that liquidity
suppliers absorb in a single clearing round. Although longer block times enhance consensus security,
they amplify these effects and can cause markets to shut down.
∗
A. Capponi is with the Industrial Engineering and Operations Research, Columbia University.
†
Á. Cartea is with the Oxford-Man Institute and the Mathematical Institute, University of Oxford.
‡
F. Drissi is with the Oxford-Man Institute, University of Oxford.
Acknowledgments: We are grateful to Bruno Biais, Patrick Chang, Zachary Feinstein, Joel Hasbrouck,
Sebastian Jaimungal, Olga Klein, Igor Makarov, Katya Malinova, Andreas Park, Fahad Saleh, and Basil
Williams for their valuable comments. We are grateful to the organizers of the NBER Summer Institute
2026, Financial Market Structure, and the 41st Meeting of the European Economic Association and 77th
European Meeting of the Econometric Society (EEA-ESEM 2026) for accepting the paper in their programs.
We are also thankful to participants of the CBER Conference at Columbia University, the Oxford-Harvard
Conference on Decentralised Finance and Market Microstructure, the Stevens Institute of Technology’s DeFi
Seminar, the SEEM Seminar at the Chinese University of Hong Kong, the 2025 Warwick Business School
Workshop on Financial Technology, the session on Blockchain Economics and Decentralized Finance of the
INFORMS 2025 annual meeting, and the Oxford-Princeton Workshop for insightful discussions.
arXiv:2605.17425v1 [q-fin.GN] 17 May 2026A central ambition of blockchain technology is to provide a decentralized infrastructure
to organize economic activity at scale. The viability of financial markets within this infras-
tructure is therefore a fundamental test of that ambition. This paper develops a theoretical
framework that models the blockchain as the sole venue for price formation to assess its
viability as an infrastructure to support markets. The model endogenizes liquidity supply,
trading volumes, and information revealed in equilibrium. It incorporates three defining
features of blockchain infrastructure: clearing occurs discretely in a single round within each
block; block time determines the length of the round and is necessary to conduct secu-
rity consensus and preserve decentralization; transactions are ordered through paid-priority
discriminatory pricing.
Blockchains operate in discrete time, and information is revealed through an auction
with discriminatory pricing. Orders are recorded into blocks built at regular intervals, called
slots, and the duration of a slot is referred to as block time. At the end of a slot, a builder is
selected by the blockchain’s protocol to build the next block. Once the block is created, the
transactions composing the block are executed in order of inclusion. The builder sequences
transactions in the block according to priority fees paid by traders who compete for queue
position. Consequently, traders engage in priority gas auctions (PGAs) to optimize their
queue positions in the block. Blockchain trading contrasts with traditional markets with
continuous trading. In the latter, trading unfolds over multiple short clearing rounds, and in
the former, trading unfolds over relatively long clearing rounds with discriminatory prices.
We model the strategic interaction between liquidity suppliers and liquidity takers for a
risky asset on a blockchain in three stages. In stage one, traders decide whether to enter the
blockchain and acquire information at a cost. In stage two, a liquidity supplier sets the depth
of a decentralized exchange (DEX) by balancing revenue from price-sensitive uninformed de-
mand against expected losses to informed traders.1
In stage three, informed traders with
1
The DEX operates as a smart contract under the blockchain protocol. DEXs are the most widely used
type of blockchain market and employ algorithms to price and trade digital assets. In 2025, DEXs support
monthly trading volumes of approximately $420 billion. A growing literature studies their microstructure
(Lehar and Parlour (2025); Capponi and Jia (2021); Barbon and Ranaldo (2021); John, Kogan, and Saleh
2private valuations compete in the PGA to buy or to sell the asset, and price-sensitive un-
informed traders submit transactions. In our model, informed traders are either all buyers
or all sellers. Block time is long enough for substantial price movements to occur, so most
private valuations observed at the end of block time take a definite sign. The remainder of
the introduction considers buyers; the seller case is symmetric.
Traders compete for block priority to avoid worse execution prices resulting from the
adverse price impact of preceding orders in the block. We propose and solve a special form
of multi-prize auction for the PGA in which each trader’s payoff depends on the rank of
their bid relative to that of others. Specifically, the surplus from bidding a priority fee is
the expected price impact that a trader avoids by improving queue position. In the perfect
Bayesian equilibrium of the PGA, informed traders determine both their priority fees and
their trading volumes. To determine priority fees, they balance profits from better execution
prices against the fee paid to the builder. To determine volumes, they balance increased
expected profits from larger positions against slippage that increases with order size.
We show that the defining features of blockchains fundamentally determine market out-
comes and undermine market viability. Our main findings are threefold. First, competition
in paid-priority contests generates endogenous selection, where only traders with sufficiently
high valuations participate, which hinders price discovery by truncating information and
biasing prices towards extreme values. Second, this selection mechanism raises adverse se-
lection costs for liquidity providers and decreases liquidity in equilibrium, potentially leading
to a market shutdown. Third, the very feature that supports decentralization, namely block
time for consensus, amplifies these effects and tightens the constraints for viable markets.
We elaborate on each of these findings below.
Our first two findings indicate that increased competition between informed traders in
blockchains generates adverse effects for both liquidity and price discovery. First, we show
(2023); Klein, Kozhan, Viswanath-Natraj, and Wang (2023)) and compares them with traditional exchanges;
see Barbon and Ranaldo (2021); Aoyagi and Ito (2021). The blockchain protocol defines the rules governing
how transactions are recorded and determines the lifecycle of orders.
3that there exists a cutoff for private valuations below which traders choose not to participate
in the PGA, so only aggressive traders with high valuations transact in the blockchain.
The intuition is as follows. Low valuations correspond to low desired volumes and less
aggressiveness in priority fee bidding. This results in worse queue positions within the block
and, consequently, higher adverse price impact from traders with better positions in the block
and larger volumes. For traders with sufficiently low valuations, the adverse price impact
associated with high-valuation traders will discourage participation because expected wealth
from trading is negative. Hence, only a small fraction of traders in the blockchain with high
enough valuations participate in the PGA.
Two factors exacerbate these negative effects on markets. First, as the number of com-
petitors increases, the participation cutoff rises, so increasingly higher valuations are required
to participate in the PGA. Thus, competition limits the amount of information that is dis-
seminated: it narrows the range of private valuations revealed to the market, and skews it
towards extreme values. Second, competition also impairs liquidity. Although the fraction
of informed traders submitting transactions becomes smaller with competition, trading con-
centrates among the most aggressive traders, and the resulting adverse selection costs per
unit of liquidity supply eventually increase.
These findings contrast with market outcomes in traditional markets where trading un-
folds over multiple short clearing rounds. There, greater competition among informed traders
accelerates the incorporation of information in the early rounds, and market depth typically
improves thereafter; see Holden and Subrahmanyam (1992). The mechanism behind our
result is fundamentally different. Blockchain block times are long, so each blockchain round
of clearing aggregates the trading activity that, in traditional markets, would unfold over
multiple successive rounds. Two consequences follow. First, the liquidity supplier must
absorb the adverse-selection risk from aggregate informed flow in a single decision, rather
than adjusting liquidity across successive rounds. Second, paid-priority induces endogenous
selection and only the most aggressive informed traders participate, pushing prices toward
4extreme values and increasing adverse-selection costs. As a result, competition decreases
liquidity.2
Our model shows that a larger mass of uninformed demand and lower information costs
increase the equilibrium number of informed traders who enter the blockchain and participate
in the PGA. This would improve market efficiency in traditional electronic markets. The
effect is reversed under paid-priority pricing. In blockchains, an increased number of informed
traders raises the participation cutoff, so information becomes more truncated, and price
efficiency deteriorates.
Our third main finding is that block time creates a tradeoff between security and ef-
ficiency. Longer blocks increase the dispersion of private valuations and intensify adverse
selection, while simultaneously reducing the effective mass of price-sensitive uninformed de-
mand. As a result, with many informed traders, liquidity decreases and there is a critical
block time beyond which the market collapses.
Our model implies several stylized facts that we take to the data. First, empirical ev-
idence shows that per-transaction volumes in blockchain markets are significantly higher
than those in electronic limit order books for similar assets. This provides empirical support
to the endogenous selection mechanism, whereby mostly high-valuation traders participate.
Second, our model predicts that both trading volumes and priority fees increase with private
valuations, and that higher private valuations correspond to better positions in the block.
Using historical data from the DEX Uniswap v3 on Ethereum, we document that transaction
volumes decrease with queue position, providing empirical support for this prediction.
Literature review. The tradeoff faced by informed traders in PGAs is analogous to that
faced by political contestants or researchers in R&D races; see Lazear and Rosen (1981);
Hillman and Riley (1989); Barut and Kovenock (1998). In such contests, the cost of the
2
When information is long-lived over multiple blocks, priority fees reveal valuations within the first block.
Thus, blending with noise traders over multiple blocks would require a zero priority fee. This can be shown
to be dominated by any positive fee that improves queue position. Hence informed traders do not delay
revelation across blocks.
5effort exerted by contestants corresponds to the priority fee paid by traders, and the payoff
linked to achieving a particular rank in the race corresponds to the surplus in the PGA; see
also Klose and Kovenock (2015). Multi-prize contests are typically modeled as independent
private cost contests, where the cost of effort is private but the prize vector is known ex
ante; see Moldovanu and Sela (2001). In contrast, in the PGA, the prize from attaining
a given position is not fixed but depends on the private valuations and trading volumes of
competitors. In the PGA, the value of a given position corresponds to the adverse price
impact that a trader avoids by securing that position within the block.
The model of this paper is related to the literature that studies the properties of price
and liquidity. Our model is information based, however, it shares features of the multi-
stage inventory-based models in Biais (1993); De Frutos and Manzano (2002). We adapt
these models to account for information dissemination, DEX algorithmic pricing, and the
blockchain protocol whereby traders compete for queue position instead of speed (O’Hara
(1998)). Our model is also related to the theory on the costs of information processing such
as that in Grossman and Stiglitz (1980), Verrecchia (1982), Kyle (1989), and Baldauf and
Mollner (2020).
Some studies examine periodic uniform price auctions for market clearing (Madhavan
(1992); Budish, Cramton, and Shim (2015)), and they show that these auctions enhance
price efficiency but impose higher information costs on traders. Instead, our model considers
discriminatory auctions in which liquidity suppliers do not participate.
Several studies assume an information monopolist (Kyle (1985)). In blockchains, monopo-
listic information would drive priority fees to zero in equilibrium, which contradicts empirical
evidence showing that priority fees increase with the informational content of transactions;
see Capponi, Jia, and Yu (2024). We therefore consider competition among multiple in-
formed traders. Models with competition, such as Holden and Subrahmanyam (1992) and
Foster and Viswanathan (1996), lead to revealing equilibria where prices fully reflect private
information. Our findings mirror this result, because traders submit fully revealing priority
6fees. However, blockchains operate with periodic clearing, and the revealing equilibrium is
delayed until the end of block time.
Trading in blockchains resembles trading in preopening sessions of traditional electronic
exchanges, where markets clear only at the end of a short period. Unlike preopening sessions,
where orders execute at a uniform clearing price that maximizes volume, blockchain orders
are priced by priority fees, and volume is not maximized. Moreover, traders in preopening
sessions observe partial information about the market, such as liquidity at the best prices or
a virtual clearing price; see Van Bommel and Hoffmann (2011).3
Our work is also related to the literature on the microstructure of DEXs.4
In contrast to
this literature, we study DEXs as the interplay of a smart contract and the blockchain on
which it operates. The economic tradeoffs for liquidity supply are similar to those in market
making within limit order books and dealer markets, and insights from classical models
apply (e.g., Ho and Stoll (1983), Glosten and Milgrom (1985)). In particular, the trading
function of a DEX can be viewed as a parameterized price schedule in electronic exchanges;
see Glosten (1994); Biais, Martimort, and Rochet (2000). As a consequence, the conclusions
of our model apply if the blockchain runs other market infrastructures.
He, Yang, and Zhou (2025) study the role of priority fees when arbitrageurs trade between
a blockchain and a competing venue where prices are formed. In contrast, this paper studies
theoretically whether the blockchain itself can serve as the primary venue for price formation.
3
Biais, Hillion, and Spatt (1999) propose several hypotheses regarding the informativeness of preopening
prices; our empirical results in Appendix A show that information revelation is delayed in public memory
pools, which supports their pure-noise hypothesis, under which trading activity before clearing contains no
new information. Similarly, Medrano and Vives (2001) find that trading volumes and information revelation
accelerate toward the end of preopening sessions.
4
See Hasbrouck, Rivera, and Saleh (2022); Angeris, Evans, and Chitra (2021); Capponi, Iyengar, Sethura-
man, et al. (2023a); Milionis, Moallemi, Roughgarden, and Zhang (2022); Cartea, Drissi, and Monga (2023,
2024a) who show that DEXs cause losses to liquidity suppliers. Drissi, Wu, and Jaimungal (2025) study
DEXs as secondary trading venues. Lehar and Parlour (2025) describe competition between DEXs and order
books. Klein et al. (2023) study the role of informed liquidity supply in price discovery. Park (2023) studies
the different types of cost when trading in DEXs. Hasbrouck, Rivera, and Saleh (2023) study concentrated
liquidity DEXs. Malinova and Park (2024) examine the potential of DEXs to organize trading for equity.
Capponi et al. (2024) study the empirical influence of gas fees on the informativeness of trades. Cartea,
Drissi, Sánchez-Betancourt, Siska, and Szpruch (2024b) propose AMM designs to mitigate losses of liquidity
suppliers.
7Blockchain technology is profoundly reshaping the financial landscape (Harvey (2016);
Cong and He (2019)), and blockchain economics are a growing topic in the literature (Biais,
Capponi, Cong, Gaur, and Giesecke (2023b) and Petryk, Müller-Bloch, Hahn, Halaburda,
Henfridsson, Obermeier, and Yoo (2025)). John, Rivera, and Saleh (2020) study the equi-
librium security of blockchains. Cong, Li, and Wang (2021) analyze the adoption of digital
platforms. Biais, Bisiere, Bouvard, Casamatta, and Menkveld (2023a) study the drivers
of cryptocurrency prices and risks. Cong, Hui, Tucker, and Zhou (2023); Harvey, Saleh,
and Sverchkov (2025) study the economic implications of layer-2 blockchains. Harvey and
Rabetti (2024) explore how investors and regulators engage effectively with blockchains. Fi-
nally, the applications of decentralized finance extend beyond DEXs. They include asset to-
kenization (Heines, Dick, Pohle, and Jung (2021)), central bank digital currencies (Fung and
Halaburda (2016); Auer, Frost, Gambacorta, Monnet, Rice, and Shin (2022)), cross-border
settlement (Harvey (2021); Hub (2023); Cardozo, Fernández, Jiang, and Rojas (2024)).
The remainder of this paper proceeds as follows. In Section I, we present notation,
assumptions, and structure of the model. In Section II, we study the priority fee bidding
strategies and trading volumes of informed traders. In Section III, we analyze the liquidity
supply. In Section IV, we study incentives to acquire information at a cost. In Section V,
we study the economic effects of block time. In Appendix A, we describe the features of
blockchains that underpin our model. Finally, Appendix B collects the proofs.
I. General features of the model
In this section, we introduce the features of our model for the strategic interactions of
market participants in blockchain-based markets. A decentralized exchange (DEX) supplies
liquidity in a reference asset X (e.g., dollar) and in a risky asset Y.5
There are three types of
agent, a representative liquidity supplier (he), informed traders (she), and noise traders with
5
See Appendix A.B and Capponi and Jia (2021); Cartea et al. (2024a); Lehar and Parlour (2025) for
more details on the mechanics of DEXs.
8price-sensitive demand. The entry to blockchain markets, liquidity supply, and the trading
process are modeled as a game that proceeds as follows.
• Stage one: M traders decide whether to pay a fixed information cost C to enter
the blockchain and to observe private information. This choice depends on whether
informed trading yields an expected future payoff higher than C.
• Stage two: the liquidity supplier sets the liquidity reserves in the DEX by balancing
expected losses to informed traders and expected fee revenue from noise traders. The
level of reserves determines the cost of liquidity.
• Stage three: Informed traders hold long-lived private and incomplete information about
the future liquidation value of the asset. Based on valuations, traders compete for queue
priority in the next block, and they determine their priority fee bids and their trading
volumes. In contrast, noise traders submit transactions with zero priority fees.6
After the three stages, a builder constructs the block by sorting transactions according
to their priority fees. Specifically, the block executes the transactions of informed traders
first, followed by those from noise traders who only pay the base fee.7
After the liquidity supplier sets the DEX’s liquidity in stage two, we assume for sim-
plicity that he remains passive and does not compete with traders for queue priority in the
subsequent block. Although the liquidity supplier does not compete directly, his strategy
depends indirectly on the behavior of informed traders: he chooses the cost of liquidity in
the DEX based on rational expectations about their best response in the next stage.
At the start of the PGA in stage three, each informed trader observes a private valuation,
drawn from a common and known distribution. Next, they set priority fees and trading
6
Builders are paid gas fees by agents to include their transactions in a block. Gas fees consist of two
components: the base fee and the priority fee. The base fee is mandatory for inclusion and is paid by all
traders. We assume that noise traders pay the base fee only, which we normalize to zero without loss of
generality, because the base fee does not affect ordering within the block. See Appendix A.A for further
institutional details on the blockchain protocol.
7
In blockchains, informed traders do not profitably blend with noise traders to conceal their orders, as
they would in Kyle (1985). Specifically, blending would require paying a zero priority fee. Submitting an
arbitrarily small positive priority fee is a profitable deviation, because it secures a better queue position and
execution price. In equilibrium, informed traders pay priority fees which reveal valuations; see Proposition 4.
9volumes by balancing expected profits against (i) the adverse price impact generated by
traders with better positions in the block and (ii) slippage in the DEX.
A key assumption of the model is that all informed traders know whether the price
innovation is positive or negative. This determines the sign of all valuations and whether
traders are buyers or sellers.8
We motivate this assumption as follows. Informed traders
submit their transactions near the end of the blockchain slot and rely on private information
observed at that time.9
Blockchains that host decentralized markets, such as Ethereum,
operate with slots of twelve seconds or longer to build blocks securely.10
Thus, substantial
price movements can occur during this period and cause most private valuations to take a
definite sign. Our focus is on price discovery and liquidity in settings where the liquidation
value of the asset is likely to change significantly in the DEX, so most informed traders are
either buyers or sellers, and the PGA serves as the mechanism through which information is
incorporated into prices.11
We solve for a perfect Bayesian equilibrium of this game by backward induction. At
stage three (Section II), given a known level of liquidity supply L and a known number M
of competing informed traders, the bidding strategies and trading volumes are determined.
At stage two (Section III), given a known number M of competing informed traders, the
liquidity supply L is determined based on the supplier’s rational expectations of future
trading volumes and noise trading activity. At stage one (Section IV), the number M of
8
More precisely, the conditional information structure is as follows. At the beginning of the PGA, a
public indicator reveals the direction of the price innovation, after which each informed trader observes a
private and independent valuation regarding the magnitude of the innovation. As detailed below, positive
valuations are drawn from a distribution with positive support, while negative valuations follow a symmetric
distribution with negative support.
9
Informed traders transact through private memory pools or wait until the end of block time in public
memory pools, consistent with the empirical evidence reported in Appendix A.A.
10
Layer-two blockchains achieve shorter block times by relying on centralized sequencers, and thus do not
qualify as decentralized.
11
In contrast, when the future liquidation value of the asset is close to its initial value, private valuations
are more dispersed in direction. In such situations, if an informed buyer and an informed seller both submit
transactions within the same block, each has an incentive for the other’s trade to be executed first, because
this improves their own execution price. Consequently, the expected value of queue priority becomes non-
positive for both traders, leading to zero equilibrium bids and limited informational content in the auction
outcome.
10informed traders who pay the cost of information is determined. The sequence of events is
described in more detail in the next sections.
II. Stage three: priority fees and trading volumes
This section studies the priority fee bidding strategies and trading volumes of informed
traders who compete for queue priority in stage three. Traders take as given the liquidity
supply in the DEX and the number M of competitors. Assume that informed traders know
the liquidation value V is positive, so they wish to buy the asset. The case in which informed
traders are sellers is symmetric and yields identical equilibrium priority fee bidding strategies,
and trading volumes of opposite sign.
A. Assumptions
In stage three, M risk-neutral informed traders compete for queue priority in the next
block. We assume that the DEX offers a linear price schedule, and implements a linear price
update rule. Let L denote the depth of liquidity in the DEX determined in stage two.12
An
order of size Q is executed with slippage Q/L per unit of the asset, and, after execution, the
price updates linearly by 2Q/L in the direction of the trade. This assumption is a first-order
approximation of the pricing mechanism in standard DEXs; see Appendix A.B for details.
Traders compete to avoid potentially worse execution prices resulting from the adverse
price impact of preceding orders in the block. Thus, the supply L influences competition
outcomes because it determines execution prices and the magnitude of price impact. Consider
two traders, 1 and 2, who sequentially buy quantities Q1 > 0 and Q2 > 0 of asset Y . We
normalize the DEX’s initial price at the start of the blockchain slot to zero, without loss of
generality. Thus, the execution price for trader 1, assuming she has queue priority, is Q1/L,
after which the DEX price updates to 2Q1/L. Consequently, the execution price for trader
12
The depth L is determined by the by the reserves deposited in the DEX’s liquidity pool, and by the
shape of the bonding curve implemented in the DEX’s smart contract; see Appendix A.B for details.
112, who trades second in the block, is Q2/L + 2Q1/L.13
The PGA among traders is a multi-prize contest in which each competitor’s payoff de-
pends on the rank of her priority fee relative to others. As discussed in Appendix A.A, the
PGA is blind because traders either compete in the private memory pool or submit their
transactions to the public memory pool immediately before block creation. Moreover, the
PGA is all-pay because traders’ transactions are all executed and builders collect priority
fees regardless of relative ranks within the block.
Before submitting their transactions, traders know whether they are all buyers or all
sellers, and they observe private valuations {v1,...,vM} used to assess the asset’s worth.
Specifically, from the perspective of trader i, the expected liquidation value is
Ei[V ] = vi . (1)
Valuations are independent and identically distributed (i.i.d.) with continuous cumula-
tive distribution function F on [0,v], admitting a continuous density f. In the perfect
Bayesian equilibrium of the PGA, the M risk-neutral traders determine their priority fees
{Φ1,··· ,ΦM} and their trading volumes {Q1,··· ,QM}.
B. The priority gas auction
This section derives the expected utility of competing traders in the PGA. The contest
is symmetric, and we describe it from the perspective of trader i ∈ {1,...,M}. Trader i
competes with M −1 other traders in the PGA. From her perspective, the M −1 valuations
of her competitors are i.i.d. draws from the same distribution; likewise, the M − 1 trading
volumes of her competitors are i.i.d. draws from the same distribution. We denote by
Φ(j), for j ∈ {1,...,M − 1}, the j-th smallest bid among the M − 1 competitors, so that
Φ(j) < Φ(j+1) and Φ(M−1) is the largest competing priority fee. We denote by v(j) and Q(j)
13
See Appendix A.B for more details on execution prices and price impact in DEXs.
12the valuation and trading volume, respectively, of the competitor submitting the priority fee
ranked j-th.
If trader i wins priority in the block, i.e., if Φi > Φ(M−1), her buy order is executed first
in the next block at the price Qi/L + π per unit of the asset, where π is a proportional
fee paid to the DEX; see (A2).14
In this case, the trader’s terminal wealth depends on the
priority fee paid to the builder, the cash paid to the DEX to purchase Qi units of the asset,
the proportional DEX fee π, the information cost C incurred in stage one, and the terminal
value of her holdings:
Wi,(M−1) = −Φi
|{z}
priority fee
−Qi

Qi
L
+ π

| {z }
cash paid to DEX
+ Qi V
|{z}
terminal value of holdings
− C |{z}
information cost
. (2)
If trader i’s priority fee Φi lies between the j-th and (j + 1)-th smallest priority fees
among her competitors, i.e.,
Φ(j) < Φi < Φ(j+1) ,
then exactly M − 1 − j traders, with trading volumes {Q(j+1),...,Q(M−1)}, are executed in
the block before trader i’s buy order. The price impact in the DEX when trading a volume Q
is 2Q/L. Hence, trader i’s execution price per unit of the risky asset is
Qi
L |{z}
slippage
+
2
L
M−1 X
ℓ=j+1
Q(ℓ)
| {z }
impact of traders with higher priority fees
+ π |{z}
DEX fee
.
Accordingly, trader i’s terminal wealth in this case is
Wi,(j) = −Φi
|{z}
priority fee
−Qi

Qi
L
+
2
L
∆(j+1:M−1) + π

| {z }
cash paid to DEX
+ QiV
|{z}
terminal value of holdings
− C |{z}
information cost
, (3)
14
We assume that π < v < ∞ to ensure that the probability of non-zero trading volumes is positive; see
Section II.D.
13where, for convenience, we define
∆(l:L) =
L X
ℓ=l
Q(ℓ).
Finally, if trader i’s priority fee is lower than the lowest competing fee, i.e.,
Φi < Φ(1) ,
then her terminal wealth is
Wi,(0) = −Φi − Qi

Qi
L
+
2
L
∆(1:M−1) + π

+ QiV − C .
Using the cases above, the expected utility of trader i can be written as
Ei[Wi] =
M−1 X
j=0
Ei
h
1Φ(j)<Φi<Φ(j+1)
Wi,(j)
i
=
M−1 X
j=0
Ei

1Φ(j)<Φi<Φ(j+1)

−Φi − Qi

Qi
L
+
2
L
∆(j+1:M−1) + π

+ QiV − C

,
with the conventions
∆(l:L) = 0 whenever l > L, Φ(M) = ∞, Φ(0) = −∞.
At stage three, trader i’s valuation of the asset is vi, and she knows the DEX supply L,
the number of competing traders M, her trading volume Qi, and her priority fee Φi. She
understands that her queue position depends on the rank of Φi relative to her competitors.
Hence the expected wealth of trader i can be written as
Ei

Wi

= −Φi + Qi

vi − π −
Qi
L

− C −
2Qi
L
M−1 X
j=0
Ei
h
1{Φ(j)<Φi<Φ(j+1)} ∆(j+1:M−1)
i
. (4)
14The expected wealth (4) consists of (i) the expected profit Qi vi and (ii) several trading costs.
These costs include the priority fee paid to builders, the DEX fee, the information cost, the
expected adverse price impact generated by trader i’s competitors, and the execution price
paid to the DEX.
When submitting a transaction, trader i determines both the priority fee and the volume,
thus she solves the problem15
sup
Qi
sup
Φi
Ei [Wi] . (5)
Intuitively, traders buy and sell volumes proportional to their private valuations of the
asset. In the optimization problem (5), the trading volume Qi for trader i depends on
vi. Similarly, the priority fee Φi depends on the trading volume Qi. Thus, in equilibrium,
both the volume Qi and the priority fee Φi are functions of the private valuation vi .16
Section II.C derives the equilibrium priority fees for a fixed distribution of trading volumes,
and Section II.D then derives the equilibrium trading volumes given these priority fees.
C. Priority fees
Here, we solve for the equilibrium priority fee under an arbitrary distribution of trading
volumes. Let Qj denote the random variable representing the trading volume of trader j ̸= i,
drawn from the interval [0,Q] according to a density function g with finite first and second
moments, which may include an atom p = G({0}) at zero volume. We denote by G the
cumulative distribution function of volumes. At zero volume, traders submit the minimum
zero priority fee. Equivalently, they do not participate in the PGA, and their expected wealth
equals −C.17
The equilibrium distribution of trading volumes is derived in Section II.D.
When solving for the equilibrium at stage three, informed traders take the depth L as
15
The order of the two suprema can be interchanged.
16
Specifically, note that ∂Qi
Ei [Wi] is a function vi, i.e., ∂Qivi
Ei [Wi] ̸= 0. Thus, the optimal trading
volume argmaxQi
Ei [Wi] is a function of the valuation vi. Similarly, ∂Φivi
Ei [Wi] ̸= 0, so the priority fee
also depends on the private valuation.
17
In particular, no tie-breaking rule is required for zero volumes. Note also that a zero trading volume
generates no adverse price impact on subsequent transactions within the block.
15fixed and independent of the priority fee Φi. Although the priority fee does not directly affect
liquidity supply, it exerts an indirect influence. As shown in Section III, the liquidity supplier
anticipates the priority fees and trading volumes of informed traders when determining the
depth of the DEX’s pool.
To better characterize the economic object of competition in the PGA, we rewrite
trader i’s expected wealth in (4) as
Ei[Wi] = Ei

Wi,(0)

+
2Qi
L
M−1 X
j=0
Ei
h
1{Φ(j)<Φi<Φ(j+1)} ∆(1:j)
i
, (6)
which has the following economic interpretation. The term Ei

Wi,(0)

represents trader i’s
expected wealth if she is executed last in the block. By submitting a positive priority fee Φi,
she obtains, with positive probability, an additional surplus. This surplus,
2Qi
L
M−1 X
j=0
Ei
h
1{Φ(j)<Φi<Φ(j+1)} ∆(1:j)
i
, (7)
represents the expected price impact that trader i avoids by improving her queue position.
The magnitude of this surplus increases with the rank of Φi among competitors and with
the quantity demanded by the trader.
Trader i expects her competitors to employ a continuous and differentiable priority fee
bidding strategy Φ(·) which is increasing in the trading volume Q. Therefore, the probability
of submitting the j + 1-th largest priority fee is
Pi

Φ(j) < Φi < Φ(j+1)

= Pi

Q(j) < Φ−1
(Φi) < Q(j+1)

.
To determine her optimal priority fee, trader i solves the optimization problem
sup
Φi
Ei [Wi] , (8)
16which is equivalent to solving
sup
Φi
(
−Φi +
2Qi
L
M−1 X
j=0
Ei
h
1Φ(j)<Φi<Φ(j+1)
∆(1:j)
i
)
. (9)
That is, trader i chooses her priority fee to maximize the sum of (i) the loss from paying
the priority fee to the builder and (ii) the gain from the surplus. Trader i therefore faces a
tradeoff: lowering the priority fee increases expected wealth but decreases the probability of
attaining a higher position in the queue.
To further analyze the optimization problem, the following lemma is useful, because it
simplifies trader i’s estimation of the expected surplus from the PGA.
LEMMA 1: Assume M ≥ 2. The surplus (7) is
2Qi
L
M−1 X
j=0
Ei
h
1{Φ(j)<Φi<Φ(j+1)} ∆(1:j)
i
=
2Qi
L
(M − 1)
Z Φ−1(Φi)
0
xdG(x) . (10)
Lemma 1 shows that the surplus is obtained by averaging the price impact of transactions
with volumes lower than trader i’s inverse bid. This result follows from the structure of the
PGA. First, it arises from our assumption of additive and linear price impact in the DEX.
In practice, nonlinearities exist in the impact of consecutive trades; see Cartea et al. (2023).
However, we model competition within a block whose duration is short enough for our linear
approximation (A3) to be accurate. Second, the result of Lemma 1 also relies on the strict
ordering of transactions by priority fee within the block. In practice, while builders have
reputational incentives to maintain strict ordering, they are not required to do so by the
blockchain protocol. Such strategic considerations are beyond the scope of this work.
In a Bayesian-Nash equilibrium, trader i finds it optimal to adopt the same differen-
tiable and increasing strategy Φ, which pins down the equilibrium strategy. The solution is
characterized in the following result.
17PROPOSITION 1: The equilibrium priority fee is
Φ(Qi) =
2
L
(M − 1)
Z Qi
0
x2
dG(x) . (11)
The priority fee is increasing in the trading volume Qi, increasing in the number of informed
traders M, and decreasing in the liquidity depth L. Finally, trader i’s objective (9) is
2
L
(M − 1)
Z Qi
0
x (Qi − x) dG(x) . (12)
To set her priority fee, trader i uses the reservation priority fee
2Qi
L
(M − 1)
Z Qi
0
xdG(x)
as a baseline when computing her optimal fee. This reservation priority fee is the level that
makes trader i indifferent between participating in the PGA and abstaining, that is, it sets
her objective (12) equal to zero. Trader i then applies a discount to this baseline to capture
a surplus. In particular, as trader i’s trading volume Qi increases, the likelihood that her
reservation fee exceeds those of other traders also rises. Consequently, trader i applies a
larger discount as the value of her private volume increases.
For a fixed arbitrary distribution of trading volumes, equilibrium priority fees increase
with the number of competitors. Specifically, as the number of informed traders rises, the
expected adverse price impact becomes larger, incentivizing each trader to raise her priority
fee. Conversely, equilibrium priority fees decrease with liquidity supply. Specifically, when
L is large, price impact is low and the cost of losing queue priority becomes less significant.
As we show below, however, these relationships do not necessarily hold (i) when informed
traders choose their trading volumes strategically as a function of anticipated priority fees,
and (ii) when liquidity suppliers set their supply strategically as a function of anticipated
trading volumes.
18D. Trading volumes and participation cutoff
The section above derived the equilibrium priority fees of informed traders for an arbitrary
distribution g of trading volumes with support

0,Q

. We now endogenize this distribution
by determining the volumes that maximize the informed traders’ objective. Substituting
the optimal priority fee Φi from (11) into the objective function (5), we express trader i’s
optimization problem as
sup
Qi
(
−
2
L
(M − 1)
Z Qi
0
x2
dG(x) + Qi
Z Q
Qi
xdG(x)
!
+ Qi

vi − π −
Qi
L
)
. (13)
The programme (13) is interpreted as follows. In equilibrium, all traders employ the same
priority fee bidding strategy, allowing them to estimate, on average, the expected costs of the
PGA in the form of expected adverse price impact and priority fees. Additional trading costs
incurred by trader i include (i) the slippage −Q2
i /L, (ii) the DEX’s fee −π Qi, and (iii) the
cost of information −C. Both trading costs and infrastructure costs increase with trading
volume, creating an incentive for trader i to reduce her trading volume Qi. However, trader
i’s expected trading profits are Qi vi. This provides an incentive for trader i to increase her
holdings in the asset.
We look for equilibria in which trading volumes are a weakly monotone function of private
valuations and we write Qi = Q(vi) for vi ∈ [0,v]. In particular, the minimum and maximum
trading volumes satisfy
Q(0) = 0 and Q = Q(v).
We later verify that the monotonicity property holds in equilibrium. The distribution of
trading volumes, expressed as a function of F, is given by
G(x) = F Q−1
(x)

, (14)
where Q−1
(·) denotes the generalized inverse of the function Q(·).
19The adverse price impact of competing traders depends on trader i’s private valuation
of the asset. Lower valuations correspond to lower volumes and to worse queue positions
within the block, and consequently, to higher adverse price impact from traders with better
positions. For sufficiently low valuations, the adverse price impact associated with high-
valuation traders may discourage trader i from submitting a transaction if doing so results in
a negative objective (13). In what follows, we show that there indeed exists a participation
cutoff vM for private valuations below which trader i optimally chooses not to submit a
transaction.
Using (14), the first-order condition (FOC) derived from the optimization problem (13)
yields the following implicit integral equation for trader i’s optimal trading volume
(vi − π)L − 2Q(vi) − 2(M − 1)
Z v
vi
Q(x)dF(x) = 0. (15)
Next, Lemma 2 characterizes the participation cutoff, and Proposition 2 derives the
equilibrium trading volumes and their distribution.
LEMMA 2: Fix M ≥ 2. There exists a unique vM ∈ (0,v) which satisfies
vM − π −
Z v
vM
e(1−F(u))(M−1)
− 1

du = 0. (16)
Moreover, vM is strictly increasing in M and limM→∞ vM = v.
PROPOSITION 2: Fix M ≥ 2. If vi < vM, where vM is defined in (16), then trader
i’s optimal trading volume is Q(vi) = 0. If vi ≥ vM, then the optimal trading volume is
proportional to the liquidity supply L,
Q(vi) = LQ̃(vi), (17)
20where
Q̃(vi) =
1
2
(v − π)e−(M−1)(1−F(vi))
−
Z v
vi
e−(M−1)(F(u)−F(vi))
du
!
. (18)
Moreover,
Q(vM) = 0 and Q = Q(v) = L
v − π
2
.
The trading volume Q(vi) is increasing in the private valuation vi, decreasing in the number
of informed traders M with limit limM→∞ Q(vi) = 0 for every vi < v.
Lemma 2 shows that there is a participation cutoff vM for private valuations: informed
traders with valuations below vM find it unprofitable to trade and abstain from submitting a
transaction. The cutoff is strictly increasing in the number of competitors M and converges
to the upper bound v as M → ∞.
When a trader’s valuation exceeds the participation cutoff vM, Proposition 2 shows
that her trading volume is proportional to the liquidity supply L, with proportionality
factor Q̃(vi). Thus, deeper liquidity reserves allow traders to extract greater profits from
private information. In contrast, trading volumes decrease with the number of traders in
anticipation of higher expected PGA costs.
Moreover, the factor Q̃(vi) increases with the private valuation vi. This occurs for two
reasons. One, a higher valuation strengthens the incentive to trade, and two, it increases
the expected surplus from the PGA. Thus, higher private valuations correspond to larger
trading volumes, and as shown in Proposition 1, they are also associated with better queue
positions. To test this prediction, Figure 1 shows the average trading volume across multiple
DEX pools on Ethereum as a function of their queue position within the block. The figure
indicates that the volume of transactions decreases with queue position, and lends empirical
support to the findings of our model.
Proposition 2 also shows that the participation cutoff vM for profitable informed trad-
ing increases with M. Therefore, as the number of competitors grows, increasingly higher
valuations are required to participate. Because only high-valuation traders ultimately sub-
210.00 0.25 0.50 0.75 1.00
queue position
0.75
1.00
1.25
1.50
1.75
trading volume
0.00 0.25 0.50 0.75 1.00
queue position
0.8
0.9
1.0
1.1
1.2
## 1.3 Median
25th–75th percentile
USDC WETH 500
USDC WETH 100
LINK WETH 3000
USDC WETH 3000
DAI WETH 500
WETH RPL 3000
MKR WETH 3000
WETH LOOKS 3000
USDC USDT 500
WETH USDT 500
LDO WETH 3000
WBTC WETH 500
WETH USDT 3000
HEX USDC 3000
PEPES WETH 10000
Figure 1. Left panel: Average absolute trading volume as a function of queue position in
the block for transactions in multiple Uniswap v3 pools; 0 corresponds to first position and
1 to last position. The transactions are between 1 January 2023 and 31 December 2023 in
15 different Uniswap v3 pools with multiple transactions in at least 10 different blocks. For
each pool, the trading volumes are normalized by the standard deviation of trading volumes.
Right panel: average and inter-quartile trading volumes across the 15 pools.
mit transactions in blockchains, higher trading volumes, associated with higher valuations,
should be more frequently observed on blockchains. This prediction is consistent with em-
pirical evidence showing that per-transaction trading volumes in blockchain markets are
significantly higher than those in traditional electronic limit order books. For instance, be-
tween 1 July 2021 and 31 December 2023, the average size of liquidity-taking trades in the
most active DEX on Ethereum was approximately $70,000, compared with about $1,200 for
the same pair of assets on Binance; see Cartea, Drissi, and Monga (2025).
Competition and price efficiency. Proposition 2 shows that the equilibrium distribution
of trading volumes is a transformation of the truncated distribution of valuations over [vM,v]:
G({0}) = F(vM) and G Q(v)

= F(v) for v ∈ [vM,v]. (19)
22For a given number M of competing traders, the expected number of traders with sufficiently
high valuations for the asset to submit non-zero trading volumes is M 1−F(vM)

. We refer
to these traders as active traders.
In what follows, we assume that the probability density function of valuations f does not
exceed the uniform density in a (left) neighborhood of v.18
The next result characterizes the
behavior of price and volume in blockchain markets as competition intensifies.
PROPOSITION 3: The expected aggregate trading volume of active informed traders admits
the closed form
LM
Z v
vM
Q̃(x)dF(x) =
LM (vM − π)
2(M − 1)
. (20)
The aggregate trading volume admits the limit L
v − π
2
= LQ̃(v) as competition intensifies
(M → ∞). Moreover, the expected price at the end of the block admits the closed form
M (vM − π)
M − 1
(21)
and converges to v − π. Both limits are approached from below.
Proposition 3 shows that, as competition intensifies, a growing mass of active traders
with increasingly high valuations participate in the PGA. For instance, when valuations are
uniformly distributed, the participation cutoff admits the form vM = v−(v−π)logM/(M −
1), so the range [vM,v] of active traders’ valuations shrinks at rate logM/M. Yet the
expected number of active traders M(1−F(vM)) = M logM/(M −1), the aggregate trading
volume in (20), and the expected price at the end of the block in (21) all increase strictly
with M.
In the limit when M → ∞, aggregate volume converges to the volume LQ̃(v) associated
with an informed trader holding the maximal valuation v. Moreover, the expected price
at the end of the block converges to v − π, which corresponds to the upper bound of the
18
The upper bound v on valuations can be taken arbitrarily large to accommodate extreme valuations and
ensure right-tail decay, so the condition holds for most standard distributions on compact support.
23valuation support net of fees.
The economic mechanism behind our result is endogenous selection. As M increases,
participation requires progressively more aggressive bidding to remain competitive. Traders
anticipate both higher expected priority fees and the adverse price impact generated by
participants with larger valuations. This raises the cutoff vM and excludes traders with
moderate valuations from the market. In equilibrium, only the most aggressive traders
remain active. Their aggregate trading volume therefore reflects valuations arbitrarily close
to v, pushing the execution price toward its maximal feasible level net of fees.
These results have direct implications for price efficiency on a blockchain that serves as
the venue for price formation. From the perspective of an uninformed observer, only non-zero
priority fees and executed volumes reveal private information. As competition increases, the
fraction of the valuation distribution that generates transactions shrinks. Price formation
is thus driven by an increasingly thin upper tail of the distribution. Thus, the transaction
price becomes systematically biased upward (downward if traders are selling).
As we discuss below, an increase in block time, that is, the time required for a block to
be created and markets to clear, may raise the upper bound of possible valuations v and
amplify the upward price bias. These effects play a role in shaping the equilibrium supply
of liquidity, which we characterize in Section III.
E. Equilibrium priority fees
For a fixed arbitrary distribution of trading volumes, Proposition 1 showed that higher
competition in the PGA increases priority fees and that deeper liquidity decreases them.
However, trading volumes are part of the traders’ equilibrium strategy. The next result
derives the equilibrium priority fee accounting for strategic trading volumes.
PROPOSITION 4: The equilibrium priority fee is zero if vi < vM. For vi ≥ vM, the
24equilibrium priority fee accounting for strategically adjusted trading volumes, is
Φ(vi) = 2L(M − 1)
Z vi
vM
Q̃(x)2
dF (x) . (22)
The equilibrium priority fee is increasing in the depth of liquidity L, and, for every vi < v,
it admits the limit
lim
M→∞
Φ(vi) = 0.
Proposition 4 shows that the equilibrium priority fees Φ(Q(v)), accounting for strategi-
cally adjusted volumes, converge monotonically to zero with the number of informed traders
in the memory pool. The intuition is that increased competition raises anticipated PGA
costs and expected adverse price impact, which induces a down scaling in equilibrium trad-
ing volumes. As M → ∞, both trading volumes and priority fees converge to zero.
Similar arguments to those above show that the equilibrium priority fees and trading
volumes derived earlier also apply when traders wish to sell the asset. As a consequence,
traders are symmetrically aggressive in equilibrium, i.e., they buy and sell the same volumes
for valuations of equal absolute value and opposite signs.
III. Stage two: liquidity supply
A. Assumptions
The level of reserves deposited in the DEX determines the execution costs and the price
impact of liquidity taking trades. At stage two, a risk-neutral representative liquidity supplier
sets the DEX reserves by balancing losses to informed traders with fee revenue from noise
traders.19
Liquidity supply is competitive and is determined by a zero-profit condition:
19
Unlike traditional venues such as limit order books or dealer markets, the permissionless nature of
blockchains facilitates entry to liquidity provision, particularly by less sophisticated participants. As a
result, strategic liquidity suppliers cannot freely set the price of liquidity because of noise liquidity suppliers.
This feature of blockchains may explain the losses observed in practice; see Cartea et al. (2024a).
25expected fee revenue from noise traders equals expected losses to informed traders.20
For simplicity, we assume that noise traders transact a net volume that sums to zero
in expectation, but an absolute expected volume which is price-sensitive. Specifically, the
liquidity demanded by buyers is decreasing in the price 1/L and its expected volume is
N
2
×
1
1 + θ/L
,
and the expected liquidity demanded by sellers is symmetric.
Demand on each side is therefore characterized by two parameters: N/2, the aggregate
positive (resp. negative) liquidity needs over the blockchain slot, and θ, which governs the
sensitivity of realized demand to liquidity depth L. When L ≪ θ, demand responds ap-
proximately linearly to liquidity, with slope proportional to 1/θ. As L increases, marginal
gains from additional liquidity diminish. Smaller values of θ imply that most of the available
demand is captured at relatively modest depth, whereas larger values imply that demand is
more sensitive and requires substantial liquidity to materialize. Our specification is bounded,
so realized demand does not exceed the available mass N. Liquidity demand follows, in spirit,
the reduced-form models of demand in Garman (1976); Ho and Stoll (1981); Hendershott
and Menkveld (2014). The liquidity supplier’s expected fee revenue is therefore
πN
L
L + θ
. (23)
The liquidity supplier does not hold the same information about the future liquidation
value V of the asset as that of informed traders. At stage two, he assumes that with
probability 1/2, the liquidation value V of the asset is positive, in which case the informed
traders buy the asset and their private valuations are drawn independently from the interval
[0,v] according to the continuous and differentiable density f. Similarly, with probability
20
This views the representative liquidity supplier as a continuum of competitive, atomistic, price-taking
liquidity suppliers operating under free entry.
261/2, the liquidation value of the asset is negative, in which case the informed traders sell the
asset and their valuations are drawn independently from the interval [−v,0], according to
the symmetric density f(−x).
Recall that only traders who value the asset above the cutoff (16) submit transactions
with volumes (17). We denote the total trading volume of informed traders by
∆M =
M X
k=1
Q(vk). (24)
From the perspective of the supplier, ∆M is a random variable, whose expected value is zero,
and which is assumed to be independent of the noise liquidity demand.
The liquidity supplier balances fee revenue with expected losses to informed traders.
Next, we derive the expected adverse selection cost. Let X0 and Y0 denote the initial cash and
risky asset reserves deposited by the liquidity supplier, so his initial wealth is X0+Y0 V0 = X0.
Under the DEX’s linear price schedule, the aggregate informed flow ∆M executes at price
∆M/L. The liquidity supplier’s cash therefore changes by ∆M (∆M/L) = ∆2
M/L.21
The
liquidity supplier marks his position at the end of the block, after trading unfolds, at the
prevalent DEX price 2∆M/L.22
. Thus, his wealth becomes
X0 +
∆2
M
L
+ (Y0 − ∆M)
2∆M
L
,
and the change in wealth attributable to informed trading is
∆2
M
L
+ (Y0 − ∆M)
2∆M
L
= −
∆2
M
L
+
2Y0 ∆M
L
. (25)
The first term in (25) is the adverse selection cost. It is non-positive because the liquidity
supplier holds more reserves of the asset whose price has decreased, or less of the asset whose
21
The change is similar whether informed traders buy or sell.
22
Each infinitesimal liquidity supplier marks wealth at the DEX’s price because the DEX is the only venue
to unwind inventory. Thus, a cash-out trade executes at the marginal price.
27price has increased. The second term in (25) is the change in value of the liquidity supplier’s
initial inventory. Under the prior E[∆M] = 0, the term has zero expectation. Hence the
expected change in the wealth attributable to informed trading at stage three is
−
1
L
E

∆2
M

= −LM SM , (26)
where we define
SM =
Z v
vM
Q̃(u)2
dF(u) +
(vM − π)2
4(M − 1)
, (27)
and the volume function Q̃ is defined in (17).23
B. Equilibrium liquidity supply
The aggregate equilibrium liquidity supply L⋆
satisfies a zero-profit condition: expected
fee revenue from noise traders equals expected losses to informed traders.
π N
L⋆
L⋆ + θ
= L⋆
M SM . (28)
The next proposition derives the equilibrium DEX liquidity supply.
PROPOSITION 5: In equilibrium, the supply of liquidity is
L⋆
(M) =
π N
M SM
− θ, (29)
where SM is defined in (27). Liquidity supply increases in the profitability π N of noise
trading flow, and admits the limit
lim
M→∞
L⋆
(M) =
8π N
3(v − π)2
− θ, (30)
23
The first term in (27) is the expected squared volume of an active trader. The second term reflects the
positive correlation between any two traders’ volumes. Equations (26) and (27) are derived in the proof of
Proposition 5.
28which is approached from above. The condition for markets to remain open is
M SM ≤
π N
θ
. (31)
Trading volumes in stage three are strategically set by informed traders to be proportional
to the liquidity depth L. Thus, greater liquidity provision in stage two amplifies, on average,
the dollar value of informed trading profits and, consequently, the expected losses (26) of
the liquidity supplier. The liquidity supplier anticipates that the dispersion SM of aggregate
trading volumes determines these losses and decreases supply accordingly. Conversely, he
anticipates that noise demand is profitable and increases supply in response.
We now discuss how liquidity supply depends on the degree of competition in the PGA.
As the number of competitors M increases, the aggregate trading volume (20) and the
expected price (21) at the end of the block both rise toward their limits (Proposition 3).
As a consequence, the expected adverse selection cost per unit of supplied liquidity also
rises. The liquidity supplier anticipates this and decreases DEX liquidity. In the limit when
M → ∞, the price is most biased, liquidity is smallest, and only a small portion of private
information is revealed. When valuations are uniformly distributed, liquidity supply admits
the closed form
L⋆
(M) =
8πN(M − 1)3
M(v − π)2
h
(M − 1)(3M − 5) − 2(2M − 3)logM + 2(logM)2
i − θ, (32)
which is strictly decreasing in M.
Our results stand in sharp contrast to the effect of competition among informed traders in
traditional markets with continuous trading and multiple clearing rounds. In such markets,
as the number of informed traders tends to infinity, prices become fully revealing in early
rounds and adverse selection premia vanish later; see Holden and Subrahmanyam (1992).
Market depth increases as private information is incorporated through successive rounds of
trading.
29The mechanism behind our result is fundamentally different. In blockchains, trades are
executed in a single discrete clearing round and priced according to priority fees. Traders
pay both the cost of market impact and the priority bid required to secure queue position.
Because clearing occurs in one round, the liquidity supplier must absorb the full adverse
selection risk from aggregate trading volume in a single decision, rather than adjusting
liquidity across successive rounds.
C. Market viability
Under the zero-profit condition (28), the equilibrium liquidity supply L⋆
is nonnegative
only if expected fee revenue from noise traders can cover expected losses to informed traders.
This requires the condition (31) for the viability of blockchain markets. Condition (31) is
standard, it states that if the fee revenue from liquidity demand is less than the expected
losses to informed traders, liquidity provision is unsustainable. The degree to which this
condition must hold depends on the price-sensitivity parameter θ. All else being equal, as
demand becomes more sensitive to the price of liquidity, the viability of liquidity provision
requires either greater liquidity demand N, higher fee rates π, or reduced variance in informed
trading volumes. This condition mirrors that in Glosten and Milgrom (1985) where markets
shut down due to liquidity freeze if the valuation of informed traders is too precise relative
to the price-sensitivity of liquidity demand.
When the variance of trading volumes is maximal, i.e., when
SM =
π N
M θ
, (33)
then the liquidity depth is L⋆
= 0.
Our analysis in this section treats the number M of informed traders as exogenous. In the
next section, we endogenize entry into blockchains. The equilibrium number of competing
traders in the PGA is constrained by the cost of acquiring information and by the limited
30profitability induced by defensive liquidity supply.
IV. Stage one: information acquisition
Our results in Section III show that, upon observing their private valuations, traders with
low valuations submit zero trading volumes, while traders with high valuations participate
in the PGA. At stage one, however, traders must decide whether to incur the information
cost C to acquire private information before observing their valuations. These costs include
expenditures on proprietary blockchain data, centralized exchange data, searcher contract
deployment, and blockchain monitoring tools.
Assume that the total number of traders eligible to acquire information is arbitrarily large,
and let M denote the subset that chooses to do so. In equilibrium, entry into informed trading
is determined by the comparison between the expected profitability of informed trading and
the information cost C. At stage one, the equilibrium number of informed traders M is the
largest integer value such that the marginal trader’s expected profit is at least the information
cost. We characterize this equilibrium number in the following result.
PROPOSITION 6: The equilibrium number of informed traders is the largest integer M such
that
C ≤ H(M), H(M) := L⋆
(M)
Z v
vM
Q̃(v)2

1 − 2(M − 1)(1 − F(v))

dF(v), (34)
where vM and Q̃ are defined in (16) and (18), respectively. The function H(M) is the ex-
ante trading profit per informed trader, net of execution costs and priority fees, and satisfies
limsupM→∞ H(M) ≤ 0. If C > 0 and H(2) > C, then an equilibrium number M⋆
≥ 2 of
informed traders exists and is given by the largest integer M satisfying (34). Moreover, M⋆
is non-decreasing in the noise-trading mass N, and non-increasing in the information cost
C.
31In the equilibrium condition (34), the integrand on the right-hand side represents the
expected profit from participating in the PGA when a trader observes a valuation v > vM
and liquidity supply is set at its equilibrium level (29). These expected profits are weighted
by the likelihood dF(v) of observing valuation v in stage three. Proposition 6 also shows
that the mass of informed traders decreases with the cost of information and increases with
the size of uninformed demand.
In markets, price efficiency is directly related to the number of traders who incur the cost
of acquiring information. Each revealed valuation reduces the conditional variance of the
fundamental price from the perspective of an uninformed observer. Thus, lower information
costs C and greater noise trading improve price efficiency. However, under paid-priority
discriminatory pricing of blockchains, price efficiency is also related to the participation
cutoff (16) below which traders abstain from the PGA. An increase in entry raises the
participation cutoff, so that only increasingly high valuations are revealed. Information
becomes more truncated, and price efficiency deteriorates.
V. Block time
Our model endogenizes trading volumes, entry into the blockchain, participation in the
PGA, liquidity supply, and the amount of information in the market. The primitives are the
price-sensitivity and total mass of noise trading flow, the distribution of private valuations,
and the cost of acquiring information. An additional primitive specific to blockchains is the
length of the slot, i.e., block time.
Block time is the delay traders must wait before the market clears, and it is necessary
to secure the blockchain. It therefore shapes both the distribution of private valuations at
clearing and the intensity of uninformed trading within a block. Specifically, longer blocks
increase the likelihood of large innovations in prices and widen the dispersion of private
valuations, and they also deteriorate execution quality for uninformed traders within the
32block.
Let T denote block time, which is common knowledge to all competitive agents. We
make the following assumptions to formalize the effect of block time on the primitives of our
model.
ASSUMPTION 1: (i) The distribution F(·;T) of private valuations has support [0,v(T)]
where v(T) is strictly increasing in block time T, with limT→∞ v(T) = ∞. For any
T′
> T, F(·;T′
) strictly first-order stochastically dominates F(·;T) on (0,v(T)], i.e.,
F(v;T′
) < F(v;T) for all v ∈ (0,v(T)].
(ii) The mass of noise trading flow N(T) is decreasing in T and nonnegative.
Assumption 1(i) states that longer block times widen the support of private valuations
and make extreme valuations more likely. Assumption 1(ii) states that longer block times
reduce the mass of noise trading flow. This reflects greater uncertainty about execution
prices within longer blocks. The following corollary presents the comparative statics implied
by these assumptions and the results derived in the previous sections.
COROLLARY 1: Fix M ≥ 2 and let Assumption 1 hold. The participation cutoff vM(T)
in (16) is increasing in T. With many informed traders (M → ∞), the DEX price v(T)−π
at the end of the block is increasing in T, the equilibrium liquidity
8π N(T)
3(v(T) − π)2
− θ is
decreasing in T, and markets shut down for sufficiently large T.
Corollary 1 shows that longer block times discourage participation in informed trading
and push prices to more extreme levels, which impairs price discovery. The result also shows
that, when many traders compete, longer blocks reduce liquidity, and beyond a critical block
time, the market collapses.
Longer block times reduce uninformed demand, by Assumption 1(ii). Holding the valu-
ation distribution fixed, this channel lowers DEX liquidity for any fixed number of informed
traders, tightens the market viability condition (31), and reduces the number of informed
traders M⋆
.
33In traditional markets with continuous trading, transactions that would be aggregated
within a single blockchain slot of duration T instead unfold over multiple short clearing
rounds. Greater competition among informed traders in such markets accelerates the in-
corporation of information in early rounds, and market depth typically improves thereafter;
see Holden and Subrahmanyam (1992). By contrast, blockchain markets aggregate the en-
tire interval T into a single trading round with a priority gas auction. Our results show
that longer block times, although they enhance security, decrease liquidity, deter entry, and
impair price efficiency.
VI. Conclusions
The stated ambition of blockchains is to provide a decentralized alternative to intermedi-
aries and to organize economic activity at scale. Financial markets are a central component
of that ambition. We proposed a theoretical model of price formation and liquidity in a
blockchain market with discriminatory pricing based on paid-priority queues and discrete
clearing. The model endogenized trading volumes, entry into informed trading, participa-
tion in the priority gas auction, liquidity supply, and payment for information. We showed
that market outcomes are governed by three key primitives: the distribution of private val-
uations, the mass of uninformed trading flow, and the length of the blockchain slot.
Our analysis showed that the very features that secure decentralization, most notably
block time to conduct consensus and priority fees to compensate block builders, can under-
mine market viability. In general, under these design features, blockchains are not viable for
price discovery. If blockchains are to become a credible infrastructure for price discovery,
protocol design must carefully address how transactions are organized and prioritized within
each block.
34Appendix A. Institutional details
The microstructure of DEXs differs fundamentally from that of traditional financial mar-
kets due to the unique infrastructure on which they operate. In this section, we outline some
institutional features of blockchains that underpin the framework of our model.
Appendix A. Ethereum, memory pools, and priority gas auctions
The Ethereum blockchain is a distributed and public digital ledger stored by nodes.
Blocks of transactions are sequentially added to the ledger at regular intervals called block
time. Block time must be long enough to allow for secure confirmation of blocks because
this process requires aggregating a large number of cryptographic signatures in multiple
rounds of network communications. Shortening block time excludes slower participants and
concentrates rewards among those with superior connectivity, which would undermine de-
centralization. For example, block time on Ethereum is deterministic and fixed to 12-second.
When an agent submits a transaction, it is not immediately included in a block. Instead,
the pending transaction is stored in a memory pool until the end of block time. For a pending
transaction to be executed, it must be included in a block created by a builder. Builders are
paid gas fees by agents. Gas fees consist of a mandatory base fee and an optional priority
fee. The priority fee incentivizes quick inclusion and priority in the block. Thus, agents
compete in PGAs for better execution prices or to exploit arbitrage opportunities.
Accordingly, there are three stages in the lifecycle of a transaction: (i) submission, where
an agent specifies the transaction details and sets a gas fee; (ii) storage in the memory pool,
where the pending transaction awaits selection by a builder; and (iii) inclusion in a block,
which corresponds to the execution of the transaction. Transaction submission may occur
at any time within the blockchain slot, and it is executed provided the transaction reaches
the builder’s memory pool before block creation.24
24
In practice, if there are too many transactions in the memory pool, only a fraction of all transactions is
executed.
35Memory pools and PGAs. There are two types of memory pools: public and private.
Pending transactions in the public memory pool are visible prior to execution, so agents op-
erating on the Ethereum blockchain are exposed to arbitrage and predatory attacks. Private
memory pools have recently emerged in the blockchain ecosystem to protect users; see Cap-
poni (2024); Wang, Huang, Zhang, Huang, Wang, and Tang (2025).25
Agents in these private
channels send their transactions directly to builders to conceal transaction details and avoid
attacks. At present, the vast majority of trading flow in Ethereum DEXs passes through
private memory pools.26
For additional details on blockchain protocols, see John, Monnot,
Mueller, Saleh, and Schwarz-Schilling (2025).
Next, we argue that our model is suitable for PGAs among informed traders in both
types of memory pools when the blockchain is the sole venue for price formation.
PGAs differ across public and private memory pools. In private memory pools, traders
do not observe each other’s bids before block creation, so the PGA is sealed-bid as described
in our model above. In contrast, in public memory pools, bids are visible prior to execution,
and traders compete in an online auction throughout the blockchain slot.27
In public memory pools, informed traders benefit from waiting until the end of block
time to submit their transactions for three reasons. First, early bids reveal information to
competitors, second, early bids set a minimum fee due to the account nonce;28
and third, late
bidding allows users to incorporate the most up-to-date information. As a result, late bidding
has emerged as the dominant strategy in public memory pools. We study the distribution of
transaction submission time in the public memory pool of Ethereum in Figure 2 to support
this claim empirically. Therefore, our model is suitable to model PGAs in public memory
pools.
25
www.flashbots.net
26
See www.dune.com/queries/5184076/8532375.
27
Another difference between both types of memory pools is that in public memory pools, failed transac-
tions are paid regardless of execution, whereas in private memory pools, transactions that are not executed
do not pay priority fees.
28
A nonce tracks the number of transactions and it is assigned to each user to prevent replay and double-
spending attacks; see Vujičić, Jagodić, and Ranđić (2018). Users can only modify pending transactions by
submitting a new one with the same nonce and a higher gas fee.
36At present, PGAs are mainly between specialized users (searchers or bots) who compete
[0,1]
[1,2]
[2,3]
[3,4]
[4,5]
[5,6]
[6,7]
[7,8]
[8,9]
[9,10]
[10,11]
Secondsbeforeblockcreation
0.0
0.5
1.0
1.5
2.0
2.5
3.0
3.5
Priority fee in Gwei
1e10
25th 75thpercentile
Median
Figure 2. Distribution of priority fees as a function of timing within the blockchain slot.
Informed traders are typically associated with higher priority fees, as shown empirically
in Capponi et al. (2023b) and theoretically in our model below. The figure shows that they
tend to submit their transactions very close to the end of the blockchain slot. The data is
from EthPandaOps and it includes 107
transactions observed in the public memory pool of
Ethereum between 20 March 2024, 00:00, and 21 March 2024, 17:08. This data corresponds
to a period when the public memory pool accounted for approximately 60% of DEX trading
volumes. At present (November 2025), this share is about 16%. The SQL data tables and
other details are here. See Liu et al. (2022); Mizrach and Yoshida (2025) for a more detailed
empirical analysis.
to exploit the discrete-time structure of blockchains through two types of strategies: attacks
on transactions in public memory pools,29
and arbitrage opportunities across DEXs or be-
tween a DEX and a competing centralized venue such as Binance; see Heimbach, Pahari,
and Schertenleib (2024). Effectively, this type of PGA is a first-price sealed-bid auction in
which the value of the item is public and known to all competitors. As predicted by stan-
dard theory and as observed empirically, the majority of the revenue from such PGAs is
ultimately paid back to builders in priority fees. The objective of this paper is not to study
PGAs for arbitrage. Instead, we focus on market outcomes when PGAs are the means for
29
These include frontrunning, backrunning, and sandwich attacks.
37price formation and private information is incomplete.
Sequential market clearing. In our model, we make the simplifying assumption that
builders strictly sort transactions in the block only by priority fee. In practice, they are not
required by the blockchain protocol to do so. However, failing to do so harms reputation
and weakens agents’ incentive to pay priority fees. Moreover, the Ethereum Foundation is
actively improving the blockchain protocol to impose rules for the behavior of builders to
reduce censorship and rent extraction; see Thiery, D’Amato, Ma, Monnot, Tsao, Kaufmann,
and Song (2024); Wadhwa, Ma, Thiery, Monnot, Zanolini, Zhang, and Nayak (2025).
Appendix B. Automated market makers
In this section, we show how the market frictions assumed in our model above apply
to automated market makers (AMMs). In AMMs, algorithmic rules specify how liquidity
supply, in the form of aggregated reserves in a liquidity pool, determines execution prices
and price impact; see Lehar and Parlour (2025), Capponi and Jia (2021), and Cartea et al.
(2025).
Assume an AMM that supplies liquidity x in the reference asset X and y in the risky
asset Y. A convex trading function Γ defines the combinations of reserves {x = Γ(y),y}
that make LPs indifferent, i.e., an iso-liquidity curve. Let Q > 0 denote a quantity of Y
that a trader wishes to buy (resp. sell). The trader pays (resp. receives) Γ(y − Q) − Γ(y)
(resp. Γ(y + Q) − Γ(y)) in asset X. Thus, execution prices per unit of asset Y are
price to sell Q :
Γ(y) − Γ(y + Q)
Q
, price to buy Q :
Γ(y − Q) − Γ(y)
Q
. (A1)
Moreover, execution prices for an infinitesimal volume Q → 0 converge to V = −Γ′
(y), which
is referred to as the marginal price. The difference between execution and marginal prices
are execution costs, and they are determined by the reserves y. The reserves also determine
the impact −Γ′
(y ± Q) − V of a trade on the marginal price.
38Our model assumes a linear price schedule and a linear price update rule in the DEX.
These are nonlinear in an AMM. Consider the following approximations of execution prices:
Γ(y) − Γ(y + Q)
Q
≈ V −
QΓ′′
(y)
2
,
Γ(y − Q) − Γ(y)
Q
≈ V +
QΓ′′
(y)
2
, (A2)
and price impact:
−Γ′
(y + Q) − V ≈ −QΓ′′
(y), −Γ′
(y − Q) − V ≈ QΓ′′
(y). (A3)
The depth L of the DEX in our model depends on the convexity Γ′′
(y) of the AMM’s
trading function in (A2) and (A3):30
L = 2/Γ′′
(y). (A4)
The convexity of trading functions is a key determinant of liquidity; see Milionis et al.
(2022); Cartea et al. (2023). Akin to traditional electronic markets, market frictions in
AMMs increase with the traded volume Q and decrease with the depth L. Figure 3 uses
DEX data from the Ethereum blockchain to show that approximating the AMM’s pricing
rule with a linear schedule is accurate in practice because trading volumes represent a small
fraction of total liquidity supply.
30
For example, the trading function for constant product markets like Uniswap, which are the most popular
DEXs, is Γ(y) = L2
/y, where L =
√
xy is the pool’s liquidity parameter, so Γ′′
(y) = 2V 3/2
/L, and by (A4)
the model’s depth is L = 2/Γ′′
(y) = L/V 3/2
= y2
/x.
39Figure 3. Scatter plots of the slippage and the price impact of 2.622 million LT transactions
against the approximations (A2) and (A3). The transactions are between 1 January 2023
and 31 December 2023 in 38 different Uniswap v3 pools. For each pool, the slippages and
price impacts are scaled between [0,1] for buy orders and [−1,0] for sell orders.
40Appendix B. Proofs
Appendix A. Proof of Lemma 1
Fix trader i. Since G is continuous on (0,Q], the events {Q(j) < Φ−1
(Φi) < Q(j+1)} for
j = 0,...,M −1 form an almost-sure partition of the sample space, with the boundary cases
understood as {Φ−1
(Φi) < Q(1)} for j = 0 and {Q(M−1) < Φ−1
(Φi)} for j = M − 1.
Whenever Q(j) < Φ−1
(Φi) < Q(j+1), exactly j of the M − 1 competitor volumes fall
below Φ−1
(Φi), and these are precisely the volumes entering the lower partial sum ∆(1:j).
Therefore, on this event,
∆(1:j) =
M−1 X
k=1
Qk 1{Qk<Φ−1(Φi)} ,
and the right-hand side does not depend on j. Multiplying by the corresponding indicator
and summing over j, the partition property collapses the left-hand side:
M−1 X
j=0
1{Q(j)<Φ−1(Φi)<Q(j+1)} ∆(1:j) =
M−1 X
k=1
Qk 1{Qk<Φ−1(Φi)} .
Taking expectations and using that Q1,...,QM−1 are i.i.d. with distribution G, we obtain
M−1 X
j=0
Ei
h
1Φ(j)<Φi<Φ(j+1)
∆(1:j)
i
= (M − 1) E

Q1{Q<Φ−1(Φi)}

= (M − 1)
Z Φ−1(Φi)
0
xdG(x) .
Appendix B. Proof of Proposition 1
First, consider the function
E[Q | Q > x] = τ (x) ,
41for the random variable Q with continuous distribution g. Write
τ (x) =
RQ
x
ug (u) du
1 − G(x)
,
to obtain
τ′
(x) =
−xg (x)
1 − G(x)
+ g (x)
RQ
x
ug (u) du
(1 − G(x))2
=
g (x)
1 − G(x)
(τ (x) − x) .
Thus, the FOC derived from the optimization problem in (9) is
Φ
′
Φ−1
(Φi)

=

2Qi
.
L

(M − 1)g Φ−1
(Φi)

τ Φ−1
(Φi)

−

2Qi
.
L

(M − 1) 1 − G Φ−1
(Φi)

τ′
Φ−1
(Φi)

=
2Qi
L
(M − 1)g Φ−1
(Φi)

E

Q | Q > Φ−1
(Φi)

−
2Qi
L
(M − 1)g Φ−1
(Φi)

E

Q | Q > Φ−1
(Φi)

− Φ−1
(Φi)

=
2Qi
L
(M − 1) Φ−1
(Φi) g Φ−1
(Φi)

.
In equilibrium, trader i finds it optimal to adopt the same strategy Φ, so Φ−1
(Φi) = Qi, so
the FOC becomes
Φ
′
(Qi) =
2
L
(M − 1) Q2
i g (Qi),
with boundary condition Φ(0) = 0, which establishes (11). Substituting Φi = Φ(Qi) into (9)
and applying Lemma 1 with Φ−1
(Φi) = Qi yields
−Φ(Qi) +
2Qi
L
(M − 1)
Z Qi
0
xdG(x) =
2
L
(M − 1)
Z Qi
0
x(Qi − x)dG(x),
which is (12).
It remains to verify global optimality. Reparametrizing the objective (9) in the bid x⋆
=
42Φ−1
(Φi) gives U(x⋆
) = −Φ(x⋆
) + 2Qi
L
(M − 1)
Rx⋆
0
xdG(x). Using the closed form Φ′
(y) =
(2/L)(M − 1)y2
g(y) just derived,
U′
(x⋆
) = −Φ′
(x⋆
) +
2Qi
L
(M − 1)x⋆
g(x⋆
) =
2(M − 1)
L
x⋆
g(x⋆
)(Qi − x⋆
),
which is strictly positive on (0,Qi) and strictly negative on (Qi,Q] whenever g > 0. Bidding
Φi > Φ(Q) wins against all competitors with probability one and yields payoff −Φi+2Qi
L
(M−
1)
RQ
0
xdG(x), strictly decreasing in Φi, so it is dominated by Φi = Φ(Q). Hence x⋆
= Qi is
the unique global maximizer and the FOC’s solution characterizes the global optimum.
Appendix C. Proof of Lemma 2
For M ≥ 2 and v ∈ [0,v], define the function
hM(v) = v − π −
Z v
v
e(1−F(u))(M−1)
− 1

du, v ∈ [0,v]. (B1)
First, we show that the function hM is increasing in v. Note that the integrand e(1−F(u))(M−1)
−
1 is continuous and nonnegative. Thus, hM is continuous and differentiable on (0,v) with
derivative
h′
M(v) = e(1−F(v))(M−1)
> 1.
Thus hM is strictly increasing.
Next we show the existence and uniqueness of the root. Because hM is strictly increasing, it
can have at most one root. Use the endpoint conditions
hM(0) < 0 and hM(v) = v − π > 0.
By continuity of hM, we obtain existence of a unique vM ∈ (0,v) satisfying hM(vM) = 0.
Since hM(v) > 0, the root cannot equal v and thus vM < v.
43Next, we show that the root, i.e., the valuation cutoff, is increasing in the number of informed
traders M that paid the cost of acquiring information in stage one. For fixed v, differentiate
hM(v) with respect to M to obtain:
∂MhM(v) = −
Z v
v
(1 − F(u))e(1−F(u))(M−1)
du < 0.
Thus for every v, the function M 7→ hM(v) is strictly decreasing. Use the identity hM(vM) =
0 and the implicit function theorem31
to write
∂MvM = −
∂MhM(vM)
∂vhM(vM)
> 0,
because ∂MhM(vM) < 0 and h′
M(vM) > 0. Therefore, the cutoff vM is strictly increasing in
M.
Finally, we show that limM→∞ vM = v. First, we use (B1) to obtain that for all v < v,
limM→∞ hM(v) = −∞.32
Thus, for each ϵ > 0, there exists a large enough M(ϵ) such that
for all M > M(ϵ), hM(v − ϵ) < 0. Use that (i) hM(·) is increasing, (ii) hM(v − ϵ) < 0, and
(iii) the definition of the cutoff hM(vM) = 0, to obtain that for all ϵ > 0 and M > M(ϵ),
v − ϵ ≤ vM. Next, we showed earlier that for all M, vM ≤ v. Thus, for all M > M(ϵ),
v − ϵ ≤ vM ≤ v,
and we conclude that limM→∞ vM = v.
31
Although M takes integer values, hM(v) is well-defined for any real M ≥ 2, so the implicit function
theorem applies. Equivalently, for integer M, hM+1(vM) < hM(vM) = 0 because the integrand in (B1) is
strictly increasing in M on the set where F < 1; combined with strict increasingness of hM+1 in v, this yields
vM+1 > vM.
32
For u ∈ [v,v), 1 − F(u) > 0, so e(1−F(u))(M−1)
→ +∞ pointwise and the integrand in (B1) diverges to
+∞ on a set of positive Lebesgue measure. By monotone convergence,
Rv
v
e(1−F(u))(M−1)
−1

du → +∞ as
M → ∞, hence hM(v) → −∞.
44Appendix D. Proof of Proposition 2
Use the optimal priority fee (11) in the objective (13) to write the expected wealth of trader
i as
Ei [Wi] = −
2
L
(M − 1)
Z Qi
0
x2
dG(x) + Qi
Z Q
Qi
xdG(x)
!
+ Qi

vi − π −
Qi
L

− C .
The optimal trading volume is the solution of ∂Qi
E[Wi] = 0 or
0 = (vi − π)L − 2Qi − 2 (M − 1)
Z Q
Qi
xdG(x) . (B2)
Differentiating (B2) in Qi yields the second-order condition
∂2
Qi
Ei [Wi] =
2
L

(M − 1)Qi g(Qi) − 1

,
where the Q2
i g(Qi) contributions from the two integrals in the objective cancel. Under the
equilibrium relation G(Q(v)) = F(v), the strategy Q : [vM,v] → [0,Q] is a strict bijection
(established below), so every Qi ∈ (0,Q] admits a unique v = Q−1
(Qi). Differentiation then
gives g(Qi) = f(v)/Q′
(v), and the ODE established below implies
(M − 1)Qi g(Qi) =
(M − 1)Q(v)f(v)
L/2 + (M − 1)Q(v)f(v)
< 1,
so ∂2
Qi
Ei [Wi] < 0 for every Qi ∈ (0,Q], and also at Qi = 0 since the factor Qig(Qi) van-
ishes there. Hence the objective is strictly concave on [0,Q]. For Qi > Q, g vanishes and
∂Qi
Ei [Wi] = vi − π − 2Qi/L ≤ vi − v ≤ 0, so the objective is strictly decreasing on [Q,∞).
Combining, the FOC’s solution is the unique global maximizer.
Recall that, in equilibrium, G is the distribution of trading volumes pinned down by the
45equilibrium increasing trading volume function Q, so
G(Qi) = F (vi) .
Rearranging (B2) one obtains the boundary condition
Q = L
v − π
2
and differentiating we find that the trading volumes solve the ODE
Q′
(vi) =
L
2
+ (M − 1)Q(vi) f (vi) ,
whose solution is in the statement of the result. The solution is increasing in v, and trader
i’s optimization problem is over nonnegative volumes. Thus the boundary condition is at
the lowest valuation vM for which the trader optimally chooses a nonnegative volume. This
cutoff is characterized in Lemma 2 and corresponds to when the FOC (B2) is satisfied at vM
with Q(vM) = 0. For vi < vM, evaluating the partial derivative of the objective at Qi = 0
yields
∂Qi
Ei [Wi]
Qi=0
= (vi − π)L − 2(M − 1)
Z Q
0
xdG(x) = (vi − vM)L < 0,
where the second equality uses (16) rewritten as the FOC at Qi = 0, vi = vM. By strict
concavity of the objective on [0,Q], the constrained maximum on Qi ≥ 0 is at Qi = 0, hence
Q(vi) = 0. To obtain the form in Lemma 2, set Q̃(vM) = 0 in (18), which yields
(v − π)e−(M−1)(1−F(vM))
=
Z v
vM
e−(M−1)(F(u)−F(vM))
du.
46Multiplying both sides by e(M−1)(1−F(vM))
gives
v − π =
Z v
vM
e(M−1)(1−F(u))
du,
which, after adding and subtracting v − vM, is equivalent to (16).
It remains to establish the monotonicity and limit properties in the statement. From the
ODE, Q′
(vi) = L/2+(M −1)Q(vi)f(vi) ≥ L/2 > 0 on [vM,v], so Q is strictly increasing in
vi. Next, (18) rewrites as
Q̃(vi) =
e−(M−1)(1−F(vi))
2

(v − π) −
Z v
vi
e(M−1)(1−F(u))
du

,
where the prefactor is positive and decreasing in M since 1 − F(vi) ≥ 0. The bracket
is decreasing in M since its integrand increases in M, and nonnegative on [vM,v] since
it vanishes at vi = vM by (16) and is increasing in vi (its integrand is positive). Hence
Q(vi) = LQ̃(vi) is decreasing in M. Finally, bounding the bracket above by v − π yields
Q̃(vi) ≤
v − π
2
e−(M−1)(1−F(vi))
,
which converges to zero as M → ∞ for every vi < v.
Appendix E. Proof of Proposition 4
Trader i uses the priority fee (11) for an arbitrary distribution of volumes with cumulative
distribution function G:
Φ(Qi) =
2
L
(M − 1)
Z Qi
0
u2
dG(u) . (B3)
The optimal volumes of PGA competitors are distributed according to the distribution G
47described in (19):
G({0}) = F(vM) and G Q(v)

= F(v) for v ∈ [vM,v], (B4)
The priority fee is trivially zero for Qi = 0, i.e., when vi ≤ vM. Next, fix vi ∈ [vM,v]. Note
that the atom at zero causes no problem because the integrand u2
evaluated at zero is zero.
Thus, the mass G({0}) contributes zero to the Stieltjes integral, and we write
Z Qi
0
u2
dG(u) = 0G({0}) +
Z
(0,Qi]
u2
dG(u) =
Z vi
vM
Q(x)2
dF(x). (B5)
where we used that Q : [vM,v] 7→ [0,Q(v)], defined in (17), is increasing and continuous,
hence it is invertible on its image and G(Q(v)) = F(v) for v ≥ vM. Substituting Q(x) =
LQ̃(x), so that Q(x)2
= L2
Q̃(x)2
, and combining with the prefactor 2/L from (11), we
obtain (22).
Since Q̃ in (18) does not depend on L, Φ(vi) is linear in L by (22), hence increasing in L.
Next, we show that for all vi < v, the priority fee tends to zero when the number of
competitors M tends to infinity. For vi ≤ vM, Φ(vi) = 0 by the first part of the proposition.
We therefore consider vi ∈ (vM,v) in what follows. Consider the strategic volumes (18):
Q̃(x) =
1
2

(v − π)e−(M−1)(1−F(x))
−
Z v
x
e−(M−1)(F(u)−F(x))
du

if x ≥ vM,
and zero otherwise. By Proposition 2, Q̃(x) ≥ 0 on [vM,v], and the second term in Q̃(x) is
nonnegative, so
0 ≤ Q̃(x) ≤
v − π
2
e−(M−1)(1−F(x))
=⇒ Q̃(x)2
≤
(v − π)2
4
e−2(M−1)(1−F(x))
.
Fix vi < v. Since F is nondecreasing, for all x ≤ vi we have F(x) ≤ F(vi) and therefore
1 − F(x) ≥ 1 − F(vi) > 0.
48Thus,
Q̃(x)2
≤
(v − π)2
4
e−2(M−1)(1−F(vi))
for all x ∈ [vM,vi].
It follows from the definition of the equilibrium priority fee in (22), accounting for strategic
volumes, that
Φ(vi) = 2L(M −1)
Z vi
vM
Q̃(x)2
dF(x) ≤ 2L(M −1)(F(vi)−F(vM))
(v − π)2
4
e−2(M−1)(1−F(vi))
.
(B6)
Since F(vi) − F(vM) ≤ 1, we obtain
0 ≤ Φ(vi) ≤
L(v − π)2
2
(M − 1)e−2(M−1)(1−F(vi))
.
Because 1 − F(vi) > 0 for all vi < v, we conclude that, for all vi < v,
lim
M→∞
Φ(vi) = 0.
Appendix F. Proof of Proposition 3
We first establish the closed form (20). The first-order condition (B2) characterising the
optimal trading volume reads
0 = (vi − π)L − 2Qi − 2(M − 1)
Z Q
Qi
xdG(x).
Evaluating this condition at vi = vM, and using Q(vM) = 0 from Proposition 2, yields
(vM − π)L = 2(M − 1)
Z Q
0
xdG(x).
49By (19) and (17), the atom G({0}) = F(vM) contributes zero to the Stieltjes integral (the
integrand x vanishes at x = 0), and the change of variable x = Q(v) = LQ̃(v) on [vM,v]
gives
Z Q
0
xdG(x) =
Z v
vM
Q(v)dF(v) = L
Z v
vM
Q̃(v)dF(v).
Combining the two displays,
(vM − π)L = 2(M − 1)L
Z v
vM
Q̃(v)dF(v),
and multiplying by M/(2(M−1)) yields (20). The limit L(v−π)/2 then follows directly from
(20) and Lemma 2, which gives limM→∞ vM = v. We present below an alternative direct
derivation of this limit, which also establishes the auxiliary result limM→∞(M − 1)(1 −
F(vM)) = ∞ used in the proof of Proposition 5.
Recall that for vi ≥ vM,
Q̃(vi) =
1
2
(v − π)e−(M−1)(1−F(vi))
−
Z v
vi
e−(M−1)(F(u)−F(vi))
du
!
.
Factoring out e−(M−1)(1−F(vi))
yields
Q̃(vi) =
1
2
e−(M−1)(1−F(vi))

v − π −
Z v
vi
e(M−1)(1−F(u))
du

.
Hence, the expected total trading volume of informed traders is
M
Z v
vM
Q̃(x)dF(x) =
M(v − π)
2
Z v
vM
e−(M−1)(1−F(x))
dF(x) (B7)
−
M
2
Z v
vM
e−(M−1)(1−F(x))
Z v
x
e(M−1)(1−F(u))
du

dF(x). (B8)
50We first evaluate (B7). Using the change of variable z = 1 − F(x),
M(v − π)
2
Z v
vM
e−(M−1)(1−F(x))
dF(x) =
M(v − π)
2
Z 1−F(vM)
0
e−(M−1)z
dz
=
M(v − π)
2(M − 1)
1 − e−(M−1)(1−F(vM))

. (B9)
We now show that
lim
M→∞
(M − 1) 1 − F(vM)

= ∞.
Suppose instead that this sequence is bounded. Then there exists C > 0 such that
(M − 1) 1 − F(vM)

< C for all M.
Using the definition of vM in (16),
vM − π =
Z v
vM
e(M−1)(1−F(u))
− 1

du,
and the bound 1 − F(u) ≤ 1 − F(vM), we obtain
0 ≤ vM − π ≤ e(M−1)(1−F(vM))
− 1

(v − vM) ≤ eC
− 1

(v − vM).
By Lemma 2, vM → v as M → ∞. The inequality above would then imply vM → π, which
contradicts Lemma 2. Hence,
(M − 1) 1 − F(vM)

→ ∞.
Combining this result with (B9) gives
lim
M→∞
M(v − π)
2
Z v
vM
e−(M−1)(1−F(x))
dF(x) =
v − π
2
.
51We now turn to (B8). Define
I2 =
M
2
Z v
vM
e−(M−1)(1−F(x))
Z v
x
e(M−1)(1−F(u))
du

dF(x).
Reversing the order of integration,
I2 =
M
2
Z v
vM
e(M−1)(1−F(u))
"Z u
vM
e−(M−1)(1−F(x))
dF(x)
#
du.
With the change of variable z = 1 − F(x),
Z u
vM
e−(M−1)(1−F(x))
dF(x) =
Z 1−F(vM)
1−F(u)
e−(M−1)z
dz
=
1
M − 1
e−(M−1)(1−F(u))
− e−(M−1)(1−F(vM))

.
Substituting back,
I2 =
M
2(M − 1)
Z v
vM
1 − e−(M−1)(1−F(vM))
e(M−1)(1−F(u))

du.
Hence,
I2 =
M
2(M − 1)
"
(v − vM) − e−(M−1)(1−F(vM))
Z v
vM
e(M−1)(1−F(u))
du
#
.
Rearranging the cutoff equation (16) yields the exact identity
Z v
vM
e(M−1)(1−F(u))
du = v − π.
Since (M − 1)(1 − F(vM)) → ∞, the exponential term vanishes, and therefore I2 → 0 as
M → ∞.
52Combining the limits of (B7) and (B8), we conclude that
lim
M→∞
M
Z v
vM
Q̃(u)dF(u) =
v − π
2
.
Next, we show that the aggregate trading volume approaches its limit from below; that is,
LM
Z v
vM
Q̃(x)dF(x) < L
v − π
2
(B10)
for all M sufficiently large. By our standing assumption on F, there exists η > 0 such that
f(u) ≤ 1/(v − π) for all u ∈ [v − η,v]. We establish (B10) by comparison with the uniform
distribution on [π,v].
Let FU denote the uniform CDF on [π,v], FU(u) = (u − π)/(v − π), and let vU
M denote
the corresponding cutoff defined by (16) with F replaced by FU.
We first compute the uniform cutoff and the corresponding uniform aggregate volume. Sub-
stituting FU in (16) and using the change of variable s = (v − u)/(v − π),
vU
M − π =
Z v
vU
M
e(M−1)(v−u)/(v−π)
− 1

du =
v − π
M − 1
e(M−1)(v−vU
M)/(v−π)
− 1

− (v − vU
M),
which simplifies to e(M−1)(v−vU
M)/(v−π)
= M, i.e.,
vU
M = v − (v − π)
logM
M − 1
. (B11)
Substituting (B11) into the closed form (20) applied to FU,
LM
Z v
vU
M
Q̃(x)dFU(x) = L
v − π
2
·
M M − 1 − logM

(M − 1)2
. (B12)
The standard inequality logM > 1 − 1/M for M > 1 is equivalent to M(M − 1 − logM) <
53(M − 1)2
. Hence, for all M > 1,
LM
Z v
vU
M
Q̃(x)dFU(x) < L
v − π
2
. (B13)
Next, we establish tail dominance of F over FU. Assume M is large enough that (v −
π)logM/(M − 1) < η, equivalently vU
M > v − η by (B11). For any u ∈ [vU
M,v] ⊂ [v − η,v],
integrating the hypothesis f(u) ≤ 1/(v − π) yields
1 − F(u) =
Z v
u
f(s)ds ≤
v − u
v − π
= 1 − FU(u). (B14)
We now compare the cutoffs vM and vU
M. For any continuous CDF G on [π,v] and v ∈ [π,v],
define
I(v;G) :=
Z v
v
e(M−1)(1−G(u))
− 1

du.
By (16), vM is the unique root in [π,v) of v 7→ I(v;F) − (v − π). This map is strictly
decreasing, since its derivative equals −e(M−1)(1−F(v))
< 0. Evaluating at v = vU
M and using
(B14) together with the monotonicity of x 7→ e(M−1)x
,
I(vU
M;F) ≤ I(vU
M;FU) = vU
M − π,
where the last equality is (16) applied to FU at its own cutoff. Thus I(vU
M;F)−(vU
M −π) ≤ 0,
and the strict monotonicity yields
vM ≤ vU
M. (B15)
We now conclude. Using the closed form (20), (B15), and (B13),
LM
Z v
vM
Q̃(x)dF(x) =
LM (vM − π)
2(M − 1)
≤
LM (vU
M − π)
2(M − 1)
< L
v − π
2
,
which establishes (B10) for every M satisfying (v − π)logM/(M − 1) < η.
54We finally establish convergence of the expected end-of-block price. Each unit of volume
executed in the block moves the DEX price by 2/L; see (A3). Since the initial price is
normalized to zero, the expected end-of-block price is
2
L
M
Z v
vM
Q(v)dF(v) = 2M
Z v
vM
Q̃(v)dF(v) =
M(vM − π)
M − 1
,
where the last equality uses the closed form (20). By Lemma 2, vM → v, so the expected
end-of-block price converges to v−π as M → ∞. Since the expected end-of-block price equals
2/L times the expected aggregate trading volume, (B10) yields M(vM −π)/(M −1) < v−π
for all M sufficiently large; hence the price limit is also approached from below.
Appendix G. Proof of Proposition 5
We first derive V[∆M]. Recall the LP’s stage-two prior stated in Section III: with
probability 1/2, the liquidation value satisfies V > 0 and the informed traders’ valuations
v1,...,vM are i.i.d. from F on [0,v] (each trader buys); with probability 1/2, V < 0 and
valuations are i.i.d. from the symmetric density f(−·) on [−v,0] (each trader sells). Equi-
librium volumes are Q(vk) = LQ̃(vk) on V > 0 by Proposition 2, and −Q(|vk|) on V < 0 by
the buy/sell symmetry recorded after Proposition 4.
By construction, the conditional distribution of Q(vk) on {V < 0} equals the negative of
its conditional distribution on {V > 0}, so
E[Q(vk)] = 1
2
E[Q(vk) | V > 0] + 1
2
E[Q(vk) | V < 0] = 0,
hence E[∆M] = 0 and V[∆M] = E[∆2
M]. Conditional on the sign of V , the vk are i.i.d., so
the Q(vk) are conditionally i.i.d. as well. Expanding the square,
E[∆2
M] = M E[Q(vk)2
] + M(M − 1)E[Q(vk)Q(vl)] (k ̸= l). (B16)
55For the diagonal term, using Q(vk) = LQ̃(vk) on {vk ≥ vM}, Q(vk) = 0 on {vk < vM}
(Proposition 2), and the symmetry of the prior across signs,
E[Q(vk)2
] = E[Q(vk)2
| V > 0] = L2
Z v
vM
Q̃(u)2
dF(u). (B17)
For the cross term, with k ̸= l, conditional independence gives, on each side of the prior,
E[Q(vk)Q(vl) | V > 0] = E[Q(vk) | V > 0]
2
=

L
Z v
vM
Q̃(u)dF(u)
2
,
and by the symmetric structure E[Q(vk)Q(vl) | V < 0] = (−1)2
E[Q(vk) | V > 0]
2
equals the same value. Combining and applying the closed form (20),
Rv
vM
Q̃(u)dF(u) =
(vM − π)/(2(M − 1)), yields
E[Q(vk)Q(vl)] = L2 (vM − π)2
4(M − 1)2
. (B18)
Substituting (B17)–(B18) into (B16),
V[∆M] = L2
M
Z v
vM
Q̃(u)2
dF(u) + L2 M (vM − π)2
4(M − 1)
= L2
M SM, (B19)
where the last equality uses the definition (27). Combined with E[∆M] = 0, this gives the
rightmost equality in (26).
Next, we derive the zero-profit closed form. Multiplying the zero-profit condition (28) by
(L⋆
+ θ)/L⋆
(with L⋆
> 0, addressed below) gives
π N = (L⋆
+ θ)M SM,
which rearranges to the closed form (29): L⋆
(M) = π N/(M SM) − θ. The supply increases
in π N, since SM is independent of π N.
We next establish the viability condition. Non-negativity of (29) requires π N/(M SM) ≥
56θ, equivalent to (31): M SM ≤ π N/θ.
We now derive the asymptotic limit. By (27),
M SM = M
Z v
vM
Q̃(u)2
dF(u) +
M (vM − π)2
4(M − 1)
. (B20)
The cross-term contribution converges to (v − π)2
/4 since, by Lemma 2, vM → v and
M/(M − 1) → 1. For the integral, we now show limM→∞ M
Rv
vM
Q̃(u)2
dF(u) = (v − π)2
/8,
which combined with the cross-term limit gives limM→∞ M SM = 3(v−π)2
/8, hence by (29),
lim
M→∞
L⋆
(M) =
8π N
3(v − π)2
− θ,
which is (30). To distinguish the two contributions to M SM, denote
b SM :=
Z v
vM
Q̃(u)2
dF(u), so that SM = b SM +
(vM − π)2
4(M − 1)
. (B21)
It remains to show that limM→∞ M b SM = (v −π)2
/8. Using the factored form of Q̃ from
the proof of Proposition 3,
Q̃(x) =
1
2
e−(M−1)(1−F(x))
((v − π) − B(x)), B(x) ≡
Z v
x
e(M−1)(1−F(u))
du,
so that
M b SM =
M
4
Z v
vM
e−2(M−1)(1−F(x))
((v − π) − B(x))2
dF(x) = T1 + T2 + T3,
57where
T1 =
M(v − π)2
4
Z v
vM
e−2(M−1)(1−F(x))
dF(x),
T2 = −
M(v − π)
2
Z v
vM
e−2(M−1)(1−F(x))
B(x)dF(x),
T3 =
M
4
Z v
vM
e−2(M−1)(1−F(x))
B(x)2
dF(x).
For T1, the change of variable z = 1 − F(x) gives
T1 =
M(v − π)2
4
Z 1−F(vM)
0
e−2(M−1)z
dz =
M(v − π)2
8(M − 1)
1 − e−2(M−1)(1−F(vM))

.
Since (M −1)(1−F(vM)) → ∞ (established in the proof of Proposition 3), the exponential
vanishes and M/(M − 1) → 1, so T1 → (v−π)2
8
.
For T2, reversing the order of integration between x and u,
Z v
vM
e−2(M−1)(1−F(x))
B(x)dF(x) =
Z v
vM
e(M−1)(1−F(u))
"Z u
vM
e−2(M−1)(1−F(x))
dF(x)
#
du.
The inner integral evaluates, via z = 1 − F(x), to
Z u
vM
e−2(M−1)(1−F(x))
dF(x) =
1
2(M − 1)
e−2(M−1)(1−F(u))
− e−2(M−1)(1−F(vM))

.
Substituting back and using the cutoff definition (16), which gives
Rv
vM
e(M−1)(1−F(u))
du =
v − π,
T2 = −
M(v − π)
4(M − 1)
"Z v
vM
e−(M−1)(1−F(u))
du − (v − π)e−2(M−1)(1−F(vM))
#
.
The first term in brackets is bounded by v−vM → 0; the second vanishes since (M −1)(1−
F(vM)) → ∞. Hence T2 → 0.
58For T3, since B is decreasing in x, we have B(x) ≤ B(vM) = v − π for all x ∈ [vM,v], so
0 ≤ T3 ≤
(v − π)
4
· M
Z v
vM
e−2(M−1)(1−F(x))
B(x)dF(x) → 0,
where the last limit follows from the computation for T2.
Combining the three limits gives limM→∞ M b SM = (v−π)2
8
, which together with the cross-term
limit limM→∞ M (vM − π)2
/(4(M − 1)) = (v − π)2
/4 established above completes Step 4.
Finally, we establish convergence from above by showing that
M SM <
3(v − π)2
8
(B22)
for all M sufficiently large, which by (29) is equivalent to L⋆
(M) > limM→∞ L⋆
(M). By (B20),
it suffices to prove the two strict inequalities
M b SM <
(v − π)2
8
, (B23)
M (vM − π)2
4(M − 1)
<
(v − π)2
4
. (B24)
We first prove (B23). Applying the change of variable z = 1 − F(x) to the expression for
M b SM recalled above,
M b SM =
M
4
Z 1−F(vM)
0
e−2(M−1)z
(v − π) − B(x)
2
dz, (B25)
with x = F−1
(1 − z); recall B(v) = 0 and, by (16), B(vM) = v − π. By the standing
assumption, there exists η > 0 such that f ≤ 1/(v −π) on [v −η,v]; since vM → v (proof of
Proposition 3), we assume M large enough that vM ≥ v − η, so that 1/f(u) ≥ v − π for all
u ∈ [vM,v].
We first derive a lower bound on B. For z ∈ [0,1 − F(vM)] and x = F−1
(1 − z), the change
59of variable s = 1 − F(u) in B(x) =
Rv
x
e(M−1)(1−F(u))
du gives
B(x) =
Z z
0
e(M−1)s
f(u)
ds ≥ (v − π)
Z z
0
e(M−1)s
ds =
v − π
M − 1
e(M−1)z
− 1

,
where the inequality uses 1/f(u) ≥ v−π on [vM,v], the range over which u varies as s ranges
over [0,z].
Evaluating the lower bound just derived at z = 1 − F(vM) (so x = vM) and using B(vM) =
v − π yields v − π ≥ (v − π) e(M−1)(1−F(vM))
− 1

/(M − 1), which rearranges to
1 − F(vM) ≤
logM
M − 1
. (B26)
Rearranging the lower bound,
(v − π) − B(x) ≤ (v − π) −
v − π
M − 1
e(M−1)z
− 1

=
(v − π) M − e(M−1)z

M − 1
.
The left-hand side is nonnegative because B(x) ≤ B(vM) = v − π (as B is decreasing in x),
and the right-hand side is nonnegative by (B26). Squaring preserves the inequality:
(v − π) − B(x)
2
≤
(v − π)2
(M − 1)2
M − e(M−1)z
2
on [0,1 − F(vM)]. (B27)
Inserting (B27) into (B25) and extending the integration range from [0,1 − F(vM)] to
[0,logM/(M − 1)] (valid by (B26), since the integrand is nonnegative),
M b SM ≤
M(v − π)2
4(M − 1)2
Z logM/(M−1)
0
e−2(M−1)z
M − e(M−1)z
2
dz.
Direct evaluation of the integral gives
M b SM ≤
(v − π)2
8

M(M − 3)
(M − 1)2
+
2M logM
(M − 1)3

. (B28)
60It remains to verify the strict inequality. Setting ν := M−1 ≥ 1 and g(ν) := ν(ν+2)−2(ν+
1)log(ν +1), the bracketed expression in (B28) is strictly less than 1 if and only if g(ν) > 0.
One has g′
(ν) = 2ν − 2log(ν + 1) with g′
(0) = 0, and g′′
(ν) = 2ν/(ν + 1) ≥ 0; hence g is
non-decreasing on [0,∞). Since g(1) = 3 − 4log2 > 0, monotonicity yields g(ν) ≥ g(1) > 0
for all ν ≥ 1. Combined with (B28), this establishes (B23) for every M with vM ≥ v − η.
We now prove (B24). Working under the same standing assumption vM ≥ v−η, we use (B26)
together with the cutoff identity (16) to bound v −vM from below. For u ∈ [vM,v], F(u) ≥
F(vM), hence (M−1)(1−F(u)) ≤ (M−1)(1−F(vM)) ≤ logM by (B26), so e(M−1)(1−F(u))
−
1 ≤ M − 1. Substituting into (16),
vM − π =
Z v
vM
e(M−1)(1−F(u))
− 1

du ≤ (M − 1)(v − vM),
which rearranges to
v − vM ≥
vM − π
M − 1
. (B29)
Setting γ := (vM −π)/(v−π) ∈ (0,1], inequality (B29) divided by v−π reads 1−γ ≥ γ/(M−
1), equivalently (M − 1)(1 − γ) ≥ γ, i.e., M ≥ Mγ + 1 ≥ Mγ. Hence γ ≤ (M − 1)/M < 1,
so
M (vM − π)2
4(M − 1)
=
M γ2
(v − π)2
4(M − 1)
≤
M (M − 1)2
/M2
(v − π)2
4(M − 1)
=
(M − 1)(v − π)2
4M
<
(v − π)2
4
,
which is (B24). Combining (B23) and (B24) via (B20) yields (B22) for every M with
vM ≥ v − η, hence L⋆
(M) is approached from above as M → ∞.
Appendix H. Proof of Proposition 6
Use the expected wealth of trader i, conditional on observing a signal vi, in (4),
Ei

Wi

= −Φi + Qi

vi − π −
Qi
L

− C −
2Qi
L
M−1 X
j=0
Ei
h
1{Φ(j)<Φi<Φ(j+1)} ∆(j+1:M−1)
i
,
61together with the equilibrium priority fees (Proposition 4), trading volumes (Proposition 2),
and liquidity (Proposition 5), to obtain for each i ∈ {1,...,M}:
E

Wi | vi

= −
2
L⋆
(M − 1)
Z Q⋆(vi)
0
x2
dG(x) + Q⋆
(vi)
Z Q
Q⋆(vi)
xdG(x)
!
+ Q⋆
(vi)

vi − π −
Q⋆
(vi)
L⋆

− C.
Using that Q⋆
(vi) = 0 for vi < vM and Q⋆
(vi) = L⋆
Q̃(vi) for vi ≥ vM, this can be written as
E

Wi | vi

= L⋆
"
Q̃(vi) vi − π − Q̃(vi)

− 2(M − 1)
Z vi
0
Q̃(u)2
dF(u) + Q̃(vi)
Z v
vi
Q̃(u)dF(u)
#
− C.
At stage one, signals have not yet been realized and traders are ex ante symmetric. If
vi < vM, then Q⋆
(vi) = 0 and Φi = 0, so the payoff is −C. Combining with the case
vi ≥ vM, the expected wealth is
E[Wi] = − C + L⋆
Z v
vM
Q̃(v) v − π − Q̃(v)

dF(v)
− 2L⋆
(M − 1)
Z v
vM
"Z v
vM
Q̃(u)2
dF(u) + Q̃(v)
Z v
v
Q̃(u)dF(u)
#
dF(v).
We now show that E[Wi] converges to a finite negative limit as M → ∞. First, by Proposition
5, L⋆
converges to a finite constant as M → ∞.
Consider
(M − 1)
Z v
vM
Z v
vM
Q̃(u)2
dF(u)dF(v).
62Interchanging the order of integration yields
Z v
vM
Z v
vM
Q̃(u)2
dF(u)dF(v) =
Z v
vM
Z v
u
Q̃(u)2
dF(v)dF(u)
=
Z v
vM
Q̃(u)2
1 − F(u)

dF(u).
Since 1 − F(u) ≤ 1, the limit derived in the proof of Proposition 5 implies
0 ≤ limsup
M→∞
(M − 1)
Z v
vM
Z v
vM
Q̃(u)2
dF(u)dF(v) ≤
(v − π)2
8
.
Next, consider
(M − 1)
Z v
vM
Z v
v
Q̃(v)Q̃(u)dF(u)dF(v).
Using the bound Q̃(u) ≤ Q̃(v) = v−π
2
,
Z v
vM
Z v
v
Q̃(v)Q̃(u)dF(u)dF(v) ≤
v − π
2
Z v
vM
Q̃(v)(1 − F(v))dF(v)
≤
v − π
2
Z v
vM
Q̃(v)dF(v).
By the limit derived in Proposition 3,
0 ≤ limsup
M→∞
(M − 1)
Z v
vM
Z v
v
Q̃(v)Q̃(u)dF(u)dF(v) ≤
(v − π)2
4
.
Collecting terms, the indifference condition E[Wi] = 0 rearranges to
C =L⋆
Z v
vM
Q̃(v) v − π − Q̃(v)

dF(v)
− 2L⋆
(M − 1)
Z v
vM
(1 − F(u))Q̃(u)2
dF(u)
− 2L⋆
(M − 1)
Z v
vM
Z v
v
Q̃(v)Q̃(u)dF(u)dF(v).
63The two (M − 1) terms remain bounded as M → ∞, while the first integral term converges
to zero. Hence,
limsup
M→∞
E[Wi] < 0.
Therefore, if E[Wi] > 0 for M = 2, there exists a finite equilibrium number of informed
traders, defined as the largest integer M such that E[Wi] ≥ 0.
Simplification of H(M). The volume FOC (15), after substituting Q = L⋆
Q̃ and multiplying
by Q̃(v), yields the identity
Q̃(v) v − π − Q̃(v)

= Q̃(v)2
+ 2(M − 1)Q̃(v)
Z v
v
Q̃(u)dF(u), v ∈ [vM,v].
Substituting into the first integral of the indifference condition above, the Q̃(v)Q̃(u) cross
term cancels exactly with the third integral, leaving
C = L⋆
Z v
vM
Q̃(v)2

1 − 2(M − 1)(1 − F(v))

dF(v) = H(M),
the form in (34).
We now establish the comparative statics. Decreasing C weakly enlarges the set {M ≥ 2 :
C ≤ H(M)}, so M⋆
is weakly decreasing in C. By Proposition 5, L⋆
(M) is increasing in N
(with π fixed), while the bracketed integrand in (34) does not depend on N. At any M with
H(M) ≥ C ≥ 0 and L⋆
(M) > 0, the integral over that bracket is nonnegative, so raising N
weakly raises H(M) and thus weakly raises M⋆
.
Appendix I. Proof of Corollary 1
Throughout, F(·;T) denotes the distribution of private valuations with support [0,v(T)]
and N(T) the mass of noise-trading flow.
64We first show that the participation cutoff vM(T) is strictly increasing in T. Define
G(v;T) := v − π −
Z v(T)
v

e(1−F(u;T))(M−1)
− 1

du,
so that the cutoff vM(T) satisfies G(vM(T);T) = 0 by (16). Differentiating in v,
∂vG(v;T) = 1 +

e(1−F(v;T))(M−1)
− 1

= e(1−F(v;T))(M−1)
> 0.
For T′
> T, the FOSD ordering in Assumption 1(i) yields F(u;T′
) < F(u;T) on [0,v(T)],
so
e(1−F(u;T′))(M−1)
− 1 > e(1−F(u;T))(M−1)
− 1 for u ∈ (0,v(T)].
Moreover, on (v(T),v(T′
)] one has F(u;T′
) < 1, hence e(1−F(u;T′))(M−1)
−1 > 0. Combining,
Z v(T′)
v

e(1−F(u;T′))(M−1)
− 1

du >
Z v(T)
v

e(1−F(u;T))(M−1)
− 1

du,
so G(v;T′
) < G(v;T) for every v ∈ [0,v(T)]. Since ∂vG > 0, the unique solution of G(·;T′
) =
0 satisfies vM(T′
) > vM(T).
We now show that the end-of-block price is strictly increasing in T in the regime with
many informed traders. From Proposition 3, as M → ∞ the end-of-block price converges
to v − π. With v = v(T), the limit equals v(T) − π, which is strictly increasing in T by
Assumption 1(i).
Next, we show that the equilibrium liquidity L∞
(T) is decreasing in T. From (30) in
Proposition 5,
L∞
(T) =
8π N(T)
3(v(T) − π)2
− θ.
By Assumption 1(i), v(T)−π is strictly increasing in T, so the denominator 3(v(T)−π)2
is
strictly increasing; by Assumption 1(ii), the numerator 8π N(T) is decreasing in T. Hence
L∞
(T) is strictly decreasing in T.
65Finally, we show that markets shut down for sufficiently large T. Since N(T) ≥ 0 is
decreasing, 8π N(T) ≤ 8π N(0) is bounded. Since v(T) − π → ∞ by Assumption 1(i),
3(v(T) − π)2
→ ∞, so the first term in L∞
(T) tends to zero, hence L∞
(T) → −θ < 0.
Hence there exists T < ∞ such that L∞
(T) ≤ 0 for all T ≥ T.
REFERENCES
Angeris, Guillermo, Alex Evans, and Tarun Chitra, 2021, Replicating market makers, arXiv
preprint arXiv:2103.14769 .
Aoyagi, Jun, and Yuki Ito, 2021, Coexisting exchange platforms: Limit order books and
automated market makers .
Auer, Raphael, Jon Frost, Leonardo Gambacorta, Cyril Monnet, Tara Rice, and Hyun Song
Shin, 2022, Central bank digital currencies: motives, economic implications, and the re-
search frontier, Annual review of economics 14, 697–721.
Baldauf, Markus, and Joshua Mollner, 2020, High-frequency trading and market perfor-
mance, The Journal of Finance 75, 1495–1526.
Barbon, Andrea, and Angelo Ranaldo, 2021, On the quality of cryptocurrency markets:
Centralized versus decentralized exchanges, arXiv preprint arXiv:2112.07386 .
Barut, Yasar, and Dan Kovenock, 1998, The symmetric multiple prize all-pay auction with
complete information, European Journal of Political Economy 14, 627–644.
Biais, Bruno, 1993, Price formation and equilibrium liquidity in fragmented and centralized
markets, The Journal of Finance 48, 157–185.
Biais, Bruno, Christophe Bisiere, Matthieu Bouvard, Catherine Casamatta, and Albert J
Menkveld, 2023a, Equilibrium bitcoin pricing, The Journal of Finance 78, 967–1014.
66Biais, Bruno, Agostino Capponi, Lin William Cong, Vishal Gaur, and Kay Giesecke, 2023b,
Advances in blockchain and crypto economics, Management Science 69, 6417–6426.
Biais, Bruno, Pierre Hillion, and Chester Spatt, 1999, Price discovery and learning during
the preopening period in the paris bourse, Journal of Political Economy 107, 1218–1248.
Biais, Bruno, David Martimort, and Jean-Charles Rochet, 2000, Competing mechanisms in
a common value environment, Econometrica 68, 799–837.
Budish, Eric, Peter Cramton, and John Shim, 2015, The high-frequency trading arms race:
Frequent batch auctions as a market design response, The Quarterly Journal of Economics
130, 1547–1621.
Capponi, Agostino, 2024, Maximal extractable value and allocative inefficiencies in public
blockchains, Available at SSRN 4931619 .
Capponi, Agostino, Garud Iyengar, Jay Sethuraman, et al., 2023a, Decentralized finance:
Protocols, risks, and governance, Foundations and Trends® in Privacy and Security 5,
144–188.
Capponi, Agostino, and Ruizhe Jia, 2021, The adoption of blockchain-based decentralized
exchanges, arXiv preprint arXiv:2103.08842 .
Capponi, Agostino, Ruizhe Jia, and Shihao Yu, 2023b, Price discovery on decentralized
exchanges, Available at SSRN 4236993 .
Capponi, Agostino, Ruizhe Jia, and Shihao Yu, 2024, Price discovery on decentralized ex-
changes, Available at SSRN 4236993 .
Cardozo, Pamela, Andrés Fernández, Jerzy Jiang, and Felipe Rojas, 2024, On cross-border
crypto flows .
67Cartea, Álvaro, Fayçal Drissi, and Marcello Monga, 2023, Predictable losses of liquidity
provision in constant function markets and concentrated liquidity markets, Applied Math-
ematical Finance 30, 69–93.
Cartea, Álvaro, Fayçal Drissi, and Marcello Monga, 2024a, Decentralized finance and auto-
mated market making: Predictable loss and optimal liquidity provision, SIAM Journal on
Financial Mathematics 15, 931–959.
Cartea, Álvaro, Fayçal Drissi, and Marcello Monga, 2025, Decentralised finance and auto-
mated market making: Execution and speculation, Journal of Economic Dynamics and
Control 105134.
Cartea, Álvaro, Fayçal Drissi, Leandro Sánchez-Betancourt, David Siska, and Lukasz
Szpruch, 2024b, Strategic bonding curves in automated market makers, Available at SSRN
5018420 .
Cong, Lin William, and Zhiguo He, 2019, Blockchain disruption and smart contracts, The
Review of Financial Studies 32, 1754–1797.
Cong, Lin William, Xiang Hui, Catherine Tucker, and Luofeng Zhou, 2023, Scaling smart
contracts via layer-2 technologies: Some empirical evidence, Management Science 69,
7306–7316.
Cong, Lin William, Ye Li, and Neng Wang, 2021, Tokenomics: Dynamic adoption and
valuation, The Review of Financial Studies 34, 1105–1155.
De Frutos, M Ángeles, and Carolina Manzano, 2002, Risk aversion, transparency, and market
performance, The Journal of Finance 57, 959–984.
Drissi, Fayçal, Xuchen Wu, and Sebastian Jaimungal, 2025, Equilibrium liquidity and risk
offsetting in decentralised markets, arXiv preprint arXiv:2512.19838 .
68Foster, F Douglas, and S Viswanathan, 1996, Strategic trading when agents forecast the
forecasts of others, The Journal of Finance 51, 1437–1478.
Fung, Ben Siu-cheong, and Hanna Halaburda, 2016, Central bank digital currencies: a frame-
work for assessing why and how, Technical report, Bank of Canada Staff Discussion Paper.
Garman, Mark B, 1976, Market microstructure, Journal of financial Economics 3, 257–275.
Glosten, Lawrence R, 1994, Is the electronic open limit order book inevitable?, The Journal
of Finance 49, 1127–1161.
Glosten, Lawrence R, and Paul R Milgrom, 1985, Bid, ask and transaction prices in a
specialist market with heterogeneously informed traders, Journal of Financial Economics
14, 71–100.
Grossman, Sanford J, and Joseph E Stiglitz, 1980, On the impossibility of informationally
efficient markets, The American economic review 70, 393–408.
Harvey, Campbell R, 2016, Cryptofinance, Available at SSRN 2438299 .
Harvey, Campbell R, 2021, DeFi and the Future of Finance (John Wiley & Sons).
Harvey, Campbell R, and Daniel Rabetti, 2024, International business and decentralized
finance, Journal of International Business Studies 1–24.
Harvey, Campbell R, Fahad Saleh, and Ruslan Sverchkov, 2025, An economic model of the
l1-l2 interaction, Available at SSRN 5163823 .
Hasbrouck, Joel, Thomas J Rivera, and Fahad Saleh, 2022, The need for fees at a dex: How
increases in fees can increase dex trading volume, Available at SSRN 4192925 .
Hasbrouck, Joel, Thomas J Rivera, and Fahad Saleh, 2023, An economic model of a decen-
tralized exchange with concentrated liquidity, Available at SSRN 4529513 .
69He, Xue Dong, Chen Yang, and Yutian Zhou, 2025, Arbitrage on decentralized exchanges,
arXiv preprint arXiv:2507.08302 .
Heimbach, Lioba, Vabuk Pahari, and Eric Schertenleib, 2024, Non-atomic arbitrage in de-
centralized finance, in 2024 IEEE Symposium on Security and Privacy (SP), 3866–3884,
IEEE.
Heines, Roger, Christian Dick, Christian Pohle, and Reinhard Jung, 2021, The tokenization
of everything: Towards a framework for understanding the potentials of tokenized assets.,
PACIS 40.
Hendershott, Terrence, and Albert J Menkveld, 2014, Price pressures, Journal of Financial
economics 114, 405–423.
Hillman, Arye L, and John G Riley, 1989, Politically contestable rents and transfers, Eco-
nomics & Politics 1, 17–39.
Ho, Thomas, and Hans R Stoll, 1981, Optimal dealer pricing under transactions and return
uncertainty, Journal of Financial economics 9, 47–73.
Ho, Thomas SY, and Hans R Stoll, 1983, The dynamics of dealer markets under competition,
The Journal of Finance 38, 1053–1074.
Holden, Craig W, and Avanidhar Subrahmanyam, 1992, Long-lived private information and
imperfect competition, The Journal of Finance 47, 247–270.
Hub, BIS Innovation, 2023, Project mariana: Cross-border exchange of wholesale cbdcs
using automated market-makers.
John, Kose, Leonid Kogan, and Fahad Saleh, 2023, Smart contracts and decentralized fi-
nance, Annual Review of Financial Economics 15, 523–542.
John, Kose, Barnabé Monnot, Peter Mueller, Fahad Saleh, and Caspar Schwarz-Schilling,
2025, Economics of ethereum, Journal of Corporate Finance 91, 102718.
70John, Kose, Thomas J Rivera, and Fahad Saleh, 2020, Proof-of-work versus proof-of-stake:
A comparative economic analysis, Available at SSRN 3750467 .
Klein, Olga, Roman Kozhan, Ganesh Viswanath-Natraj, and Junxuan Wang, 2023, Informed
liquidity provision on decentralized exchanges, Available at SSRN 4642411 .
Klose, Bettina, and Dan Kovenock, 2015, The all-pay auction with complete information
and identity-dependent externalities, Economic Theory 59, 1–19.
Kyle, A. S., 1985, Continuous auctions and insider trading, Econometrica 53, 1315–1335.
Kyle, Albert S, 1989, Informed speculation with imperfect competition, The Review of Eco-
nomic Studies 56, 317–355.
Lazear, Edward P, and Sherwin Rosen, 1981, Rank-order tournaments as optimum labor
contracts, Journal of political Economy 89, 841–864.
Lehar, Alfred, and Christine Parlour, 2025, Decentralized exchange: The uniswap automated
market maker, The Journal of Finance 80, 321–374.
Liu, Yulin, Yuxuan Lu, Kartik Nayak, Fan Zhang, Luyao Zhang, and Yinhong Zhao, 2022,
Empirical analysis of eip-1559: Transaction fees, waiting times, and consensus security,
in Proceedings of the 2022 ACM SIGSAC Conference on Computer and Communications
Security, 2099–2113.
Madhavan, Ananth, 1992, Trading mechanisms in securities markets, the Journal of Finance
47, 607–641.
Malinova, Katya, and Andreas Park, 2024, Learning from defi: Would automated market
makers improve equity trading?, Available at SSRN 4531670 .
Medrano, Luis Angel, and Xavier Vives, 2001, Strategic behavior and price discovery, RAND
Journal of Economics 221–248.
71Milionis, Jason, Ciamac C Moallemi, Tim Roughgarden, and Anthony Lee Zhang, 2022,
Automated market making and loss-versus-rebalancing, arXiv preprint arXiv:2208.06046
.
Mizrach, Bruce, and Nathaniel Yoshida, 2025, The marginal effects of ethereum network
mev transaction re-ordering, arXiv preprint arXiv:2508.04003 .
Moldovanu, Benny, and Aner Sela, 2001, The optimal allocation of prizes in contests, Amer-
ican Economic Review 91, 542–558.
O’Hara, Maureen, 1998, Market microstructure theory (John Wiley & Sons).
Park, Andreas, 2023, The conceptual flaws of decentralized automated market making, Man-
agement Science 69, 6731–6751.
Petryk, Mariia, Christoph Müller-Bloch, Jungpil Hahn, Hanna Halaburda, Ola Henfridsson,
Daniel Obermeier, and Youngjin Yoo, 2025, Promises and perils of decentralization in the
blockchain age .
Thiery, Thomas, Francesco D’Amato, Julian Ma, Barnabé Monnot, Terence Tsao, Ja-
cob Kaufmann, and Jihoon Song, 2024, EIP-7805: Fork-choice enforced inclusion lists
(FOCIL), Ethereum Improvement Proposals, no. 7805, Draft. Available: https://eips.
ethereum.org/EIPS/eip-7805.
Van Bommel, Jos, and Peter Hoffmann, 2011, Transparency and ending times of call auctions:
a comparison of euronext and xetra, Technical report, Luxembourg School of Finance,
University of Luxembourg.
Verrecchia, Robert E, 1982, Information acquisition in a noisy rational expectations economy,
Econometrica: Journal of the Econometric Society 1415–1430.
Vujičić, Dejan, Dijana Jagodić, and Siniša Ranđić, 2018, Blockchain technology, bitcoin,
72and ethereum: A brief overview, in 2018 17th international symposium infoteh-jahorina
(infoteh), 1–6, IEEE.
Wadhwa, Sarisht, Julian Ma, Thomas Thiery, Barnabe Monnot, Luca Zanolini, Fan Zhang,
and Kartik Nayak, 2025, Aucil: An inclusion list design for rational parties, Cryptology
ePrint Archive .
Wang, Shuzheng, Yue Huang, Wenqin Zhang, Yuming Huang, Xuechao Wang, and Jing
Tang, 2025, Private order flows and builder bidding dynamics: The road to monopoly in
ethereum’s block building market, in Proceedings of the ACM on Web Conference 2025,
2144–2157.
73