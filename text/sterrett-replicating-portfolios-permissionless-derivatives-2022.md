---
sha256: 40575ef528807bd1dbaf544c3e58932d7e21f2ec8a1b643a9d5de4c2475e3be8
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 35065
---
Replicating Portfolios: Constructing Permissionless
Derivatives
Estelle Sterrett
estelle@primitive.xyz
Waylon Jepsen
jepsen@primitive.xyz
Evan Kim
evan@primitive.xyz
May 2022
Abstract
The current design space of derivatives in Decentralized Finance (DeFi) relies heav-
ily on oracle systems. Replicating market makers (RMMs) provide a mechanism for
converting specific payoff functions to an associated Constant Function Market Makers
(CFMMs). We leverage RMMs to replicate the approximate payoff of a Black-Scholes
covered call option. RMM-01 allows access to Black-Scholes pricing on-chain without
oracles and with the robustness of CFMMs. We provide frameworks for derivative
instruments and structured products achievable on-chain structured around RMM-01.
We construct long and binary options and briefly discuss perpetual covered call strate-
gies commonly referred to as "theta vaults". Moreover, we introduce a procedure to
eliminate liquidation risk in lending markets. The results suggest that CFMMs are
essential for structured product design with minimized trust dependencies.
Introduction
Order Books. Traditional exchanges used for trading stocks, commodities, and even dig-
ital assets follow a continuous-limit order book design. This market design consists of a list
of open buy and sells orders. Buyers and sellers place order limits that specify the maximum
or minimum price at which they are willing to buy or sell an asset. A centralized counter-
party then matches the buy and sell orders automatically and profits on making the market.
Contrasting the centralized exchange, decentralized exchanges (DEXs) manage trades on-
chain with a smart contract. This design provides a transparent and censorship-resistant
marketplace [12, 5].
CFMMs. Constant Function Market Makers (CFMMs) dominate the design space of
DEXs [5, 2, 3]. CFMMs account for tens of billions of liquidity and trillions in trading
volume [22]. In a CFMM, users provide liquidity to a vector of asset reserves R ∈ Rn
+ where
n ≥ 2 in exchange for a liquidity provider token (LPT) representing their share of the total
reserves. The LPTs serve as an immutable claim to the proportion of the liquidity pool a
1
arXiv:2205.09890v2 [q-fin.CP] 2 Jun 2022user owns. A trading function ϕ : Rn
+ → R governs the CFMM where a trade impacts the
reserves ϕ(R0
) ≥ ϕ(R) so that the value of the function after a trade is greater than or equal
to the value of the function before [4]. For example, the trading function of Uniswap V2 is
represented by the the function ϕ(Rx,Ry) = RxRy [25].
Oracles. Until RMM-01, the methodology for providing financial derivative products in-
volved the oracle dependency. Oracle dependencies introduce a centralization attack vector
that significantly increases risk [8]. These price oracle attacks have been orchestrated in
production environments [1] and can be detrimental to protocol users. Recent work [2]
leverages arbitrage for price alignment [11] unveiling how to mitigate oracle dependencies.
Oracle dependencies dissuade protocol users from allocating more liquidity than the oracle
source.
RMMs. Replicating Market Makers (RMMs) allow protocol designers to directly provide
a 1-homogeneous, concave, non-negative, non-decreasing payoff function to the liquidity
providers via a replicating portfolio [4]. Financial derivatives have been prevalent throughout
history in traditional finance, allowing individuals to take leveraged or hedged directional
views of different markets. As of March 2022, the derivative market on centralized exchanges
represents 62.8% of trading volume [24] expressing an apparent demand. We can construct a
collection of financial products familiar to traditional financial market participants by using
the liquidity tokens from RMM-01 and the underlying risky and stable assets.
RMM-01. RMM-01 [22] is a time-sensitive trading function
ϕ(Rx,Ry) = Ry − KΦ(Φ−1
(1 − Rx) − σ
√
τ) (1)
where K, σ, and τ are the options parameters, and Rx and Ry are the risky and stable asset
reserves. Without a fee regime on trades, the LPTs fail to replicate a Black-Scholes covered
call due to the external funding required to capture theta decay. The unique optimal fee
regime in [14] reduces the difference between the payoff of the LPT and that of a Black-
Scholes covered call option to a near negligible margin. K is the strike price in traditional
option literature [7], while k = ϕ(Rx,Ry) is the invariant as specified commonly in CFMM
literature [5]. Let Vcc denote the value of a Black-Scholes covered call. In RMM-01, the
invariant k can take either a negative or positive value representing VLPT − Vcc. At k = 0,
the RMM-01 pool is replicating a covered call exactly.
Liquidity Provider Tokens. RMM-01 LPTs are tokenized under the ERC-1155 stan-
dard [13]. The composable nature of ERC-1155 tokens and the oracle-free Black-Scholes
covered call from RMM-01 allow for the construction of every other Black-Scholes options
instrument barring liquidity constraints. RMM-01 native derivatives are subject to a termi-
nal error defined in more detail in [14]. Some of these RMM-01 based mechanisms require
an incentive for LPT holders to create available liquidity and consequently may be slightly
2overpriced with respect to Black-Scholes pricing [7]. Overpricing is proportional to the in-
centives for liquidity providers. Within the same pool, additional layers of composability
create liquidity fragmentation, rendering the implementation of short options unrealistic.
Outline. In §1 we show the construction of vanilla options. In §2 we move into the exotic
Binary European Options. In §3 we introduce a construction of the transparent structured
product [?] theta vaults introduced by the Opyn protocol [17]. Next, in §4 we introduce
a mechanism for a liquidation-free lending market that leverages RMM-01 constructions
to ensure a hedged health factor. The last section §5 combines some of the potentially
existing constructions to replicate the payoff of a straddle and a futures contract payoff.
This approach to derivative products is more secure than oracle-based systems under the
condition of sufficient liquidity in the underlying RMM-01. Each mechanism that involves
a lending flow assumes no swap friction. To account for swap friction, over-collateralize
proportionally to the slippage of the underlying market.
## 1 Vanilla Options
We can achieve long options through a borrowing and shorting flow on the LPTs. Applying
a theoretical examination to long options, suppose there is an RMM-01 pool with the strike,
expiry, and implied volatility K,T,σ, respectively. The payoff of the LPTs denominated in
the cash asset follows
VLPT (S(t)) = S(t)(Φ(−d1)) + KΦ(d2) + k, (2)
where S(t) is the reported price of the underlying pool at time t < T,
d0
1 =
ln(S(t)
K
) + (σ2
/2)τ
σ
√
τ
, (3)
and d0
2 = d0
1 − σ
√
τ with τ = T − t and Φ is the standard normal cumulative distribution
function. The payoff of a long call follows Vcall = Φ(d1(t)) − K
S(t)
Φ(d2(t)) and the payoff of a
long put follows Vput = KΦ(−d2(t)) − S(t)Φ(−d1(t)) [7].
To obtain either of the long options, we need to short the LPT for either the cash asset
or risky asset, the first leading to a long put and the latter leading to a long call. To achieve
this without oracle dependencies [8] or a liquidation framework [19], we need to maintain
enough collateral to cover the maximum possible debt of K +k units of stable assets. Since
the invariant k is unknown prior to expiry, the maximum debt is variable [22]. If k is strongly
positive, the value of the LPTs is significantly greater than that of a Black-Scholes covered
call [7], which could lead to a lack of available collateral liquidity to fund the repayment.
We suggest a repayment amount based on the covered call value, simply neglecting
the invariant k. By forcing this constraint, the borrower’s debt is capped at K worth of
LPTs while still allowing the lender to receive the payoff of the underlying derivative. This
3constraint guarantees the lender that they receive a covered call payoff by introducing a buy-
side to the system. The assurance of this repayment depends on implementation details. To
incentivize this lending further, we suggest implementing an interest rate for borrowing.
Additionally, an Ante Finance Ante Test [6] on the value of the invariant k ensuring k ≤ 0
may be beneficial, allowing the lender to hedge the loss of additional swap fees by challenging
the test on the associated trust market.
Long Call
Proposition. Borrowing 1 LPT and selling the underlying assets for the risky asset results
in 1 Black-Scholes call option.
Proof. Let t0 be the time of borrow and t0 < tf ≤ T be the time of repayment. In this case,
we are borrowing the LPT and denominating it in the risky asset, which involves breaking
the LPT into its underlying assets and selling the stable for the risky. The repayment amount
is given by R and the required collateral to cover the maximum debt is given by C:
R =
S(t)Φ(−d1(tf)) + KΦ(d2(tf))
S(t)
C = 1 −
S(t)Φ(−d1(t0)) + KΦ(d2(t0))
S(t)
.
The net payoff of the borrower, denoted by V , is then
V = 1 −
S(t)Φ(−d1(tf)) + KΦ(d2(tf))
S(t)
V = Φ(d1(tf)) −
K
S(t)
Φ(d2(tf)) (by symmetry of Φ)
We can see the borrower is receiving Vcall.
Long Put
We now turn to the construction of long puts.
Proposition. Borrowing 1 LPT and selling the underlying assets for the cash asset results
in 1 Black-Scholes put option.
Proof. Let t0 be the time of borrow and t0 < tf ≤ T be the time of repayment. In this case,
we are borrowing the LPT and denominating it in the stable asset, which involves breaking
4the LPT into its underlying assets and selling the risky for the stable. The repayment amount
is given by R and the required collateral to cover the maximum debt is given by C:
R = S(t)Φ(−d1(tf)) + KΦ(d2(tf))
C = K − S(t)Φ(−d1(t0)) − KΦ(d2(t0))
The net payoff of the borrower is denoted by V is thus
V = K − S(t)Φ(−d1(tf)) − KΦ(d2(tf))
V = KΦ(−d2(tf)) − S(t)Φ(−d1(tf)) (by symmetry of Φ)
We can see the borrower is receiving Vput.
## 2 Binary Options
The following most immediate derivative product built on RMM-01 are binary options [20].
The viability of this construction within the EVM depends on the implementation of the
redemption mechanism. Using the LPTs, one can sell the rights to either asset in the liquidity
position for an upfront premium, resulting in binary options. Specifically, the cash asset
in the LPT replicates a cash-or-nothing call option payoff closely, whereas the risky asset
replicates an asset-or-nothing put option closely. This mechanism acts seamlessly concerning
the performance of the LPTs, as it does not require removing any LPTs from the underlying
RMM-01 pool.
The payoff of a Black-Scholes cash-or-nothing call denominated in the cash asset follows
value function
Vconc = Φ(d2).
Similarly the payoff of a Black-Scholes asset-or-nothing put denominated in the cash asset
follows the value function
Vaonp = S(t)Φ(−d1).
Given an RMM-01 pool with the strike, expiry, and implied volatility K,T,σ, we know
the payoff of this pool follows the value,
VLPT = S(t)(1 − Φ(d1)) + KΦ(d2) + k
Suppose a liquidity provider is willing to sell the rights to one of the assets in 1 LPT. We
show that selling the rights to one of the assets simultaneously creates an asset-or-nothing
put and a cash-or-nothing call. The buyer receives the position corresponding to the sold
asset.
5Construction from RMM-01
Proposition. Selling the rights to either of the underlying assets in an LPT leads to the
creation of both an asset-or-nothing put and an cash-or-nothing call, to within a range of
error defined by the invariant k.
Proof. Let t0 be the time of sale of one of the reserves. Given equation (1), it is shown
in [22] that the cash reserve follows Ry = KΦ(Φ−1
(1 − Rx) − σ
√
τ) + k and the spot price
follows S(Rx) = KeΦ−1(1−Rx)σ
√
τ
e−1
2
σ2τ
. Isolating for S−1
(Rx) to determine the payoffs of
both reserves yields
S = KeΦ−1(1−Rx)σ
√
τ
e−1
2
σ2τ
ln

S
K

= Φ−1
(1 − Rx)σ
√
τ −
1
2
σ2
τ
ln(S
K
)
σ
√
τ
+
1
2
σ
√
τ = Φ−1
(1 − Rx)
Φ
ln(S
K
)
σ
√
τ
+
1
2
σ
√
τ
!
= 1 − Rx
Rx = Φ −
ln(S
K
)
σ
√
τ
−
1
2
σ
√
τ
!
(By symmetry of Φ)
S(t)Rx = S(t)Φ(−d1).
The net payoff is
VRx = Vaonp. (4)
Now for the cash reserve,
Φ−1
(1 − Rx) =
ln(S
K
)
σ
√
τ
+
1
2
σ
√
τ
Ry = KΦ(
ln(S
K
)
σ
√
τ
−
1
2
σ
√
τ) + k
Ry = KΦ(d2) + k.
The net payoff is
VRy = KVconc + k (5)
We’ve shown that each reserve individually replicates the payoff of either a cash-or-nothing
call or an asset-or-nothing put, to within a range of error determined by the underlying
invariant k.
As a result, selling the rights to one of these reserves Ri both creates a purchase oppor-
tunity for one of these binaries, while leaving the seller with the other binary option plus
the premium P = Ri at time t0.
6Shorting Binaries
Creating a token market on the binaries opens a vulnerability related to the American
exercise environment. However, a coincidence of wants approach to shorting avoids this
issue and the necessity for tokenization.
By shorting a cash-or-nothing call option for the cash asset, we achieve a cash-or-nothing
put option, or by shorting the asset-or-nothing put option for the risky asset, we obtain an
asset-or-nothing call option [9]. The payoff of a Black-Scholes cash-or-nothing put follows
the value function,
Vconp = Φ(−d2) (6)
Similarly, the payoff of a Black-Scholes asset-or-nothing call denominated in the cash asset
follows the value function,
Vaonc = S(t)Φ(d1) (7)
where S(t) is the spot price of the pair at time t ≤ T.
To short the underlying cash-or-nothing call and asset-or-nothing put positions, there
must be an LPT available for borrow. There must also be a coincidence of wants between
two borrowers looking to short the two positions. The borrower looking to short the cash-
or-nothing call must pay a premium of K − Ry, and the borrower of the asset-or-nothing
put must pay a premium of 1−Rx. This allows the LPT to break into the underlying assets
and distribute the reserves to the associated borrowers.
Remaining Binaries
We can now prove that payoffs similar to Black-Scholes cash-or-nothing puts and asset-or-
nothing calls are achievable through a similar flow to achieving the long options. We will
start with the cash-or-nothing put construction.
Proposition. Shorting the stable reserve position Ry creates a cash-or-nothing put position.
Proof. We can define the repayment amount as Ry at time of expiry T. We bound the
maximum possible debt to K similar to the long options case. Given the borrowed asset’s
value at time of borrow defined as KVconc(t0)+k0 with repayment amount R, and collateral
requirements C
R = KVconc(T)
C = K − KVconc(t0) − k0
To achieve a cash-or-nothing put, we need to claim the rights of the borrowed stable reserve
for the stable asset by removing the LPT. The net position of the borrower is than,
V = K − KVconc(T)
V = KVconp(T) (by symmetry of Φ)
The borrower then is long KVconp.
7Now we move on to the asset-or-nothing call construction.
Proposition. Shorting the risky reserve position Rx creates an asset-or-nothing call position.
Proof. Let t0 be the time of borrow. The repayment amount can be defined as Rx at the
time of expiry T. We bound the maximum possible debt at 1 unit of the risky asset. Given
the borrowed asset’s value at time of borrow defined as Vaonp(t0) with repayment amount R,
and the required collateral C
R = Φ(−d1(T))
C = 1 − Φ(−d1(t0))
The net payoff the borrower receives
V = 1 − Φ(−d1(tf))
V = Φ(d1(tf)) (by symmetry of Φ)
Given the payoff of an asset-or-nothing call denominated in the risky asset is Vaonc = Φ(d1),
we can see the borrower is long Vaonc.
## 3 Theta Vaults
To start, we turn to a structure product known as theta vaults, as they are the most
immediate product one can construct from RMM-01. A theta vault, pioneered by Rib-
bon Finance [10], is a roll-over options strategy of covered call or put selling to earn and
compound yield sourced from theta decay consistently. This strategy traditionally involved
minting the options through the Opyn protocol [17] as oTokens and auctioning them off
to buyers. This mechanism encounters liquidity issues proportional to the size of the theta
vault resulting from the need for a counter-party to take the opposite side of the bet to earn
premiums. Similar liquidity problems would arise from the same mechanism in traditional
equity markets. The more illiquid any market is, the more likely there will be a dependence
on centralized market makers to take the counter-side of the bet. The dependency on market
makers introduces inefficiencies in the market from the lack of diverse liquidity.
The use of RMM-01 mitigates this liquidity problem, allowing the growth of a single
theta vault to grow as large as the spot market for the asset in question. The RMM-01
trading function explicitly captures theta decay through the swap fee [22] on the underlying
spot market, shifting the requirement of a counter-party to option contracts to a need for
spot arbitrage alone. This benefits from being a much stronger dependency as spot arbitrage
will always be profitable, regardless of price action.
RMM-01 is a CFMM and requires two assets to mint an LPT, with each pool configura-
tion requiring a differing amount of each asset. When the vault switches to an RMM-01 pool,
it will need to re-balance the assets in hand before minting the new LPT. When a whole
8vault consisting of many liquidity providers is looking to re-balance, it can have a significant
price impact [5]. Therefore there is a natural upper bound on the liquidity managed by the
vault. Above this liquidity bound, an alternate approach to re-balancing beyond a simple
swap is needed.
We suggest intentionally mispricing the new RMM-01 pool, setting the initial ratio of
reserves equivalent to the vaults’ current liquidity ratio at re-balancing. Thus, there is an
incentive for arbitrage to re-align the price [21, 2] and, consequently, the allocation. The loss
incurred during this re-balance approach scales homogeneously with liquidity. In contrast,
the loss incurred during a swap scales at an increased capacity on every market. This
approach, however, only appears viable for re-balance before expiry. This restriction is due
to the LPT terminally denominating in one of the assets only.
## 4 Liquidation-Free Lending Market
To provide the context of liquidation-free lending, first examine how a lending market defines
a liquidation mechanism. Let Vc ∈ (0,∞) be the value of the collateral of the borrow position,
and let Vdebt ∈ (0,∞) be the value of the borrowed assets. Define the loan-to-value ratio as
LTV = Vdebt
Vc
and the collateral ratio as
C =
Vc
Vdebt
.
Both these terms are called health factors and are central to a lending market’s struc-
ture [19]. A defined minimum collateral ratio or maximum loan-to-value ratio is required
to keep the borrow position open for a particular lending market. If the collateral falls be-
low this ratio, liquidation will occur [19, 18, 16]. A funding source is needed to re-balance
the borrow position, maintaining the health factor in ranges. Consequently, this eliminates
liquidation risk. We can do this through the use of long options. The following approach
applies to lending markets structured around the collateral ratio or the LTV-ratio.
Mechanism
Let Px(t) be the market price of asset x at time t with respect to some numéraire. Sup-
pose a borrower opens a position consisting of n collateral assets and m debt assets, with
prices at the time of borrow t = 0, {PRx1
(0),...,PRxn
(0),PRy1
(0),...,PRym
(0)} and reserves
{Rx1,...,Rxn,Ry1,...,Rym}. The health factor initially reads
C0 =
PRx1
(0)Rx1 + ... + PRxn
(0)Rxn
PRy1
(0)Ry1 + ... + PRym
(0)Rym
We can use at-the-money calls and put options the hedge out unfavourable price action
on the health factor. Suppose PRxi
(t) < PRxi
(0) and PRyj
(t) > PRyj
(0) for i ∈ [1,...,n] and
j ∈ [1,...,m], and t > 0. Both C(t) and LTV (t) are re-balanced if each the term PRxi
(t)Rxi
9and PRyj
(t)Ryj
for i ∈ [1,...,n] and j ∈ [1,...,m] are re-balanced. We’ll start with the
collateral assets,
PRxi
(t)R0
xi
= PRxi
(0)Rxi
Rxi
+ ∆Rxi
=
PRxi
(0)
PRxi
(t)
Rxi
∆Rxi
= Rxi
(
PRxi
(0)
PRxi
(t)
− 1)
We need to source ∆Rxi
units of the i-th collateral asset. We can use put options to source
this funding. Note, a put option’s value follows
Vput = Φ(−d2)K − Φ(−d1)S(t)
where K = S0. On RMM-01, this is denominated in the cash asset of the pool. In terms of
the asset Rxi
,
Vput(PRxi
(t)) =
Pcash(t)
PRxi
(t)
(Φ(−d2)
PRxi
(0)
Pcash(0)
− Φ(−d1)
PRxi
(t)
Pcash(t)
)
We can calculate the amount of puts we need, αi, to source ∆Rxi
units of collateral asset i,
∆Rxi
= Rxi
(
PRxi
(0)
PRxi
(t)
− 1) = αiVput(PRxi
(t))
αi =
xi(
PRxi
(0)
PRxi
(t)
− 1)
Φ(−d2)
PRxi
(0)
Pcash(0)
− Φ(−d1)
PRxi
(t)
Pcash(t)
PRxi
(t)
Pcash(t)
10Figure 1: α(P)
x
with implied volatility σ = 0.85 and 8 months to maturity.
As shown above in Figure 1, these functions αi(PRxi
(t)) are monotonically decreasing
and satisfy the limit
lim
PRxi
(t)→0+
αi = Rxi
This implies simply holding Rxi
amount of at-the-money put options on the i-th collateral
asset is enough to hedge out any amount of downward price action on the terms PRxi
(t)Rxi
.
Now for the debt assets,
PRyj
(t)R0
yj
= PRyj
(0)Ryj
Ryj
− ∆Ryj
=
PRyj
(0)
PRyj
(t)
Ryj
∆Ryj
= Ryj
(1 −
PRyj
(0)
PRyj
(t)
)
Again, we need to source ∆Ryj
units of the j-th debt asset. Note, a call options value follows
Vcall = Φ(d1)S(t) − Φ(d2)K
where again K = S0. On RMM-01, this value is denominated in the volatile asset (a.k.a.
the debt asset),
Vcall(P(Rxi
,t)) =
Pcash(t)
PRyj
(t)
(Φ(d1)
PRyj
(t)
Pcash(t)
− Φ(d2)
PRyj
(0)
Pcash(0)
)
11We can than calculate βj, the amount of call options required to source ∆Ryj
,
∆Ryj
= Ryj
(1 −
PRyj
(0)
PRyj
(t)
) = βjVput
βj =
yj(1 −
Pyj (0)
Pyj (t)
)
Φ(d1)
Pyj (t)
Pcash(t)
− Φ(d2)
Pyj (0)
Pcash(0)
Pyj
(t)
Pcash(t)
Figure 2: β(P)
y
with implied volatility σ = 0.85 and 8 months to maturity.
Similar to the case of the collateral assets, as shown above in Figure 2, these functions
βj(Pyj
(t)) are monotonically increasing and satisfy the limit
lim
Pyj (t)→∞
βj = yj
implying again holding simply yj at-the-money call options on the j-th debt asset is enough
to hedge out any amount of positive price action on the terms PRyj
Ryj
.
Assume the health factor is currently within its limit. Given the reserves of collateral
assets and debt assets, we need to maintain precisely at-the-money put options on the col-
lateral assets respectively and at-the-money call options on the debt assets. The resulting
hedge prevents the health factor from dipping below its value at initial entry.
Suppose adverse price action occurs, and we need to exercise these options. In the case
of RMM-01, this involves repaying the LPT debt and retaining {Rx1 −∆Rx1
,...,Rxn −∆Rxn
}
12of the at-the-money put options and {Ry1 − ∆Ry1
,...,Rym − ∆Rym
} of the at-the-money call
options. In that case, we will no longer have enough open options to hedge out any amount of
adverse price action. One needs to re-insure the position with more opportunities to replace
the exercised positions.
Analysis
The mechanism above assumes that the options in use are at the money, all have the same
implied volatility and time to maturity. Options built on an RMM-01 [22] pool can never
sustain being at the money throughout maturation. Assuming there is sufficient LPT liq-
uidity for lenders, it is reasonable to have options with the same tenor. As a result of the
impracticality of the assumptions in a real-world setting, it is necessary to adjust the above
formulation to account for more realistic conditions.
To determine the impact of moneyness on the mechanism’s efficiency, we varied the
strike price of options in αi and βj. We plotted the resulting surface functions reduced by
their respective reserve quantities. As shown below in Figures 3 and 4, strike variance can
undoubtedly have a widely variable effect on the number of options required. The further
out of the money the options are, the more inefficient the hedging is.
Figure 3: α(P)
Rx
Adjusted to near-the-money strike prices, with implied volatility σ = 0.85
and 8 months to maturity.
13Figure 4: β(P)
Ry
Adjusted to near-the-money strike prices, with implied volatility σ = 0.85
and 8 months to maturity.
There are a few properties to note. Namely, αi and βj are no longer monotonic when
the options are out of the money. They each exhibit a global maximum at a distinct price
point. Consequently, we can no longer look at the values they converge to the ends of their
domains. Now we must look at their global maximums to obtain the required options.
If we expect strike prices to be near the money, τ will be short-dated with a high
probability. Hence, the long options will be much less valuable. Being out-of-the-money on
the number of options required to hold becomes far more pronounced. This mechanism may
be un-viable if the only available long options are significantly out of the money.
The effect of being near the money concludes that the mechanism is still viable for
implementation, as the overall efficiency is not impacted too unreasonably for the borrow
positions so long as the options aren’t deeply out of the money.
## 5 Combined Strategies
The composable nature of the products allows us to create even further derivatives and payoff
structures. Theoretically, we can construct every other payoff function by using strictly cash-
or-nothing calls and puts. This construction assumes liquidity at every possible strike price.
We describe two basic examples below of products composed of the above instruments.
14Straddles
A straddle is a portfolio composed of an equal quantity of long calls and long puts with the
same strike K, expiry T, and implied volatility σ [15]. Both long options require shorting
the LPT with the corresponding option quantities for the stable or risky asset. To borrow
LPTs, we need to provide collateral of either 1 − VLPT
S(t)
risky tokens per LPT or K − VLPT
cash tokens per LPT. The asset this collateral is denominated in determines the type of long
options achieved. Suppose a borrower opens a position of m call options. Meaning they have
contributed m(1 − VLPT
S(t)
) risky tokens to receive a net position of m(1 − VLPT
S(t)
) risky tokens.
This borrower’s position can be turned into a straddle by simply opening m long put options
and holding the m calls.
Thus factoring in the cost of the long puts, the net cost to the borrower for opening a
straddle of m calls and m puts is than given by m(1− VLPT
S(t)
) risky tokens plus m(K −VLPT )
cash tokens, receiving a net payoff of m(1 − VLPT
S(t)
) risky tokens and m(K − VLPT ) stable
tokens.
Given x risky assets, one can determine the maximum amount of straddles obtainable.
x = m(1 −
VLPT
S(t)
+
K − VLPT
S(t)
) (8)
m =
x
1 − VLPT
S(t)
+ K−VLPT
S(t)
(9)
Symmetry in directional exposure depends on an equal quantity of calls and puts[9].
The attraction of this symmetry is long volatility without leaving a directional bias in the
position. If we expect volatility to rise but still have a directional bias, tune these quantities
to fit the bias. For example, suppose we hold a bullish directional bias. It is advantageous
to open more calls than puts to skew the payoff more directionally bullish.
On RMM-01, since both long options only depend on the LPTs, we can effectively take
out any symmetry straddle on whatever K, T, σ configuration pool with LPTs lent.
Futures
A future is a derivative contract that forces two parties to transact an asset with each other
at a pre-set date and price [23]. The nature of parity in options with expiration-dependent
payoffs allows the recreation of futures positions using options. While futures are achievable
on RMM-01, it is prohibitively more expensive than futures on centralized exchanges due to
that lack of available leverage. It is still a worthwhile mechanism to define on RMM-01, as
it provides further insight into the interaction of RMM-01 based derivatives and structured
products.
A long future position payoff resembles holding spot at expiry. To achieve this, we need
to open a covered call and a call option with the same K, T, σ configuration. To open a
covered call position, we need to provide liquidity to the RMM-01 of our choice. The cost
15of which is
x = Φ(−
ln(S/K)
σ
√
τ
−
1
2
σ
√
τ) (10)
risky tokens and y(x) stable tokens, where S(t) is the current spot price of the pool. To
open a call options, the cost is 1 − VLPT
S(t)
, implying a debt of 1 covered call. The net cost of
opening a long future position is
1 (11)
which is where the inefficiency arises as this implies full collateralization for any future
position. Omitting the use of RMM-01, holding 1 unit of the risky until the expiration time
would lead to the same payoff function. Moreover, this is the idealized case with no trade
slippage. Factoring in this additional friction, we conclude that there are significant savings
by staying in the risky asset from the start.
We can extend the above construction to include short future positions by shorting the
long future position. We construct a short future position from a covered put and a long
put with the same K, T, σ configuration. On RMM-01, constructing a short future can be
approached by shorting a call option for the stable asset to achieve a covered put and then
opening a long put position.
This approach requires an additional lending market on the long options, which acts as
another layer of friction and liquidity fragmentation. Thus, significantly increasing the cost
beyond the extent of the long future case. Obtaining a short future position on RMM-01 is
unreasonable due to additional friction.
## 6 Conclusion
We have provided a theoretical demonstration of utilizing RMM-01 to construct a diverse ar-
ray of financial primitives. Vanilla and binary options mechanisms implement financial prim-
itives on-chain familiar to traditional financial marketplaces. Mechanisms for liquidation-free
lending allow for a better user experience by mitigating liquidation risk. The theta vault
framework provides a strategy to maintain vault performance at scale.
Future Work
This paper only briefly constructs each mechanism and does not analyze their behaviors
in real-world market conditions. The capital efficiency of theta vaults and liquidation-free
lending on RMM-01 needs careful evaluation. This work lays the foundation for future work
in permissionless derivative design. Further inquiry into MEV-aware application design,
mechanism architecture, and transparent structured products is necessary.
16References
[1] How $100m got stolen from defi in 2021: Price oracle manipulation and flash loan
attacks explained.
[2] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market
makers. In Proceedings of the 2nd ACM Conference on Advances in Financial Tech-
nologies, pages 80–91, 2020.
[3] Guillermo Angeris, Tarun Chitra, Alex Evans, and Stephen Boyd. Optimal routing for
constant function market makers. arXiv preprint arXiv:2204.05238, 2022.
[4] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers. arXiv
preprint arXiv:2103.14769, 2021.
[5] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An
analysis of uniswap markets, 2019.
[6] AnteBear. Ante protocol v0.5 lite paper, 2021.
[7] Fischer Black and Myron Scholes. The pricing of options and corporate liabilities.
In World Scientific Reference on Contingent Claims Analysis in Corporate Finance:
Volume 1: Foundations of CCA and Equity Valuation, pages 3–21. World Scientific,
2019.
[8] Giulio Caldarelli and Joshua Ellul. The blockchain oracle problem in decentralized
finance—a multivocal approach. Applied Sciences, 11(16), 2021.
[9] Peter Carr, Katrina Ellis, and Vishal Gupta. Static hedging of exotic options. In Quan-
titative Analysis In Financial Markets: Collected Papers of the New York University
Mathematical Finance Seminar, pages 152–176. World Scientific, 1999.
[10] Ken Chan. ribbon-v2. https://github.com/ribbon-finance/ribbon-v2, 5 2022.
[11] John C Cox, Stephen A Ross, and Mark Rubinstein. Option pricing: A simplified
approach. Journal of financial Economics, 7(3):229–263, 1979.
[12] Philip Daian, Steven Goldfeder, Tyler Kell, Yunqi Li, Xueyuan Zhao, Iddo Ben-
tov, Lorenz Breidenbach, and Ari Juels. Flash boys 2.0: Frontrunning, transac-
tion reordering, and consensus instability in decentralized exchanges. arXiv preprint
arXiv:1904.05234, 2019.
[13] Monika di Angelo and Gernot Salzer. Tokens, types, and standards: Identification
and utilization in ethereum. In 2020 IEEE International Conference on Decentralized
Applications and Infrastructures (DAPPS), pages 1–10, 2020.
17[14] Experience. RMMs-py Github Repository. https://github.com/primitivefinance/
rmms-py, 4 2022.
[15] M Barry Goldman, Howard B Sosin, and Mary Ann Gatto. Path dependent options:"
buy at the low, sell at the high". The Journal of Finance, 34(5):1111–1127, 1979.
[16] Lewis Gudgeon, Sam Werner, Daniel Perez, and William J Knottenbelt. Defi protocols
for loanable funds: Interest rates, liquidity and market efficiency. In Proceedings of the
2nd ACM Conference on Advances in Financial Technologies, pages 92–112, 2020.
[17] Zubin Koticha. Building a generalized liquid options protocol in defi. Opyn, 2019.
[18] Daniel Perez, Sam M Werner, Jiahua Xu, and Benjamin Livshits. Liquidations: Defi on
a knife-edge. In International Conference on Financial Cryptography and Data Security,
pages 457–476. Springer, 2021.
[19] Kaihua Qin, Liyi Zhou, Pablo Gamito, Philipp Jovanovic, and Arthur Gervais. An
empirical study of defi liquidations: Incentives, risks, and instabilities. In Proceedings
of the 21st ACM Internet Measurement Conference, pages 336–350, 2021.
[20] Hamish Raw. Binary options: Fixed odds financial bets. Harriman House Limited, 2011.
[21] Stephen A Ross. The arbitrage theory of capital asset pricing. In Handbook of the
fundamentals of financial decision making: Part I, pages 11–30. World Scientific, 2013.
[22] Estelle Sterrett, Alexander Angel, Matt Czernik, and experience. Primitive whitepaper.
PrimitiveXYZ, 2021.
[23] Elizabeth Tashjian. Optimal futures contract design. The Quarterly Review of Eco-
nomics and Finance, 35(2):153–162, 1995.
[24] James Webb. Exchange review march 2022.
[25] Noah Zinsmeister, Hayden Adams, Dan Robinson, and Moody Salem. v2-core. https:
//github.com/Uniswap/v2-core, 5 2019.
18