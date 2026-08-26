---
sha256: 7eaf916594ad0069df6952eac345c67b787bf19861c410de2336322dea59e346
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 66723
---
Equilibrium Reward for Liquidity Providers in Automated
Market Makers
Alif Aqshaa,b
, Philippe Bergaultc
, Leandro Sánchez-Betancourta,b
aMathematical Institute, University of Oxford
bOxford-Man Institute of Quantitative Finance
cCeremade, Université Paris Dauphine-PSL
Abstract
We find the equilibrium contract that an automated market maker (AMM) offers to their strategic liquidity
providers (LPs) in order to maximize the order flow that gets processed by the venue. Our model is formulated
as a leader-follower stochastic game, where the venue is the leader and a representative LP is the follower.
We derive approximate closed-form equilibrium solutions to the stochastic game and analyze the reward
structure. Our findings suggest that under the equilibrium contract, LPs have incentives to add liquidity
to the pool only when higher liquidity on average attracts more noise trading. The equilibrium contract
depends on the external price, the pool reference price, and the pool reserves. Our framework offers insights
into AMM design for maximizing order flow while ensuring LP profitability.
Keywords: automated market makers; design; fees; leader-follower games; Stackelberg equilibrium; optimal
contract; noise trading; arbitrageurs; principal agent.
1. Introduction
Automated market makers (AMMs) are one of the latest developments in financial technology. An AMM
is a venue with predefined trading rules where liquidity takers (LTs) and liquidity providers (LPs) trade.
These venues became popular after Uniswap V2 was released in May 2020. As of 2025, the fourth version of
the protocol has already been announced; see Adams et al. (2021, 2023).
The academic literature on AMMs is still young but already quite rich. The first papers studying the mech-
anisms of AMMs are in Chiu and Koeppl (2019); Angeris and Chitra (2020); Angeris et al. (2021); Capponi
and Jia (2021); Lipton and Treccani (2021), the arbitrage between AMMs and external centralized venues
is studied in Cartea et al. (2023a,b), and price formation in AMMs is studied in Capponi et al. (2024). It
is now well-known that, in the absence of fees, an agent providing liquidity in a standard constant function
market (CFM) —where prices are only determined as a function of the reserves— are exposed to a concave
payoff that is inferior to that of holding coins outside of the pool, a phenomenon called impermanent loss
(IL). In fact, empirical studies such as Loesch et al. (2021) show that currently, even in the presence of fees,
LPs are on average incurring a loss. Recently, Fukasawa et al. (2023) study the hedging of this impermanent
loss and Milionis et al. (2022) introduce the notion of loss-versus-rebalancing —see also Milionis et al. (2023).
Lastly, Cartea et al. (2024a) consider a more general notion of predictable loss and derive optimal liquidity
provision strategies.
In order to tackle the IL issue, another active area of research is that of AMM design. Bergault et al. (2024a)
proposes an alternative mechanism in which the pricing function uses external information about the current
market exchange rates, allowing the AMM to update its bid and offer prices not only after a trade but also
after a price oracle has fired an update.1
Cartea et al. (2024b) introduce a new family of AMMs that they
1Models with more complex price dynamics have been considered in Bergault et al. (2024c); recently, Bergault et al. (2024b)
study the dynamics of stablecoins.
Preprint submitted to TBA March 31, 2025
arXiv:2503.22502v1 [q-fin.TR] 28 Mar 2025call decentralized liquidity pools (DLPs). In their paper they optimize a range of performance criteria in-
volving the profitability of LPs. The optimal policy of a given performance criterion gives rise to a new DLP
design. Depending on the model, the resulting DLP could monitor external prices or even filter arrivals in
search of fundamental values.2
Lastly, Adams et al. (2024) introduce the so-called ‘auction-managed AMM’,
that reduces losses to informed order flow, and maximizes revenue from uninformed order flow. With the
exception of Adams et al. (2024), these designs do not aim to maximize the trading activity in the venue.
In this paper we find the optimal contract that a CFM should offer to their strategic LPs in order to attract
the maximum amount of order flow to the CFM. We formulate the design as the solution to a leader-follower
stochastic game in which the venue is the leader and the representative LP is the follower.3
Closest to
our paper is El Euch et al. (2021) who work in a centralized limit order book (LOB) and find the optimal
make-take fees in such a setting;4
see also Baldacci et al. (2021) for a multi-player version of the model, and
Baldacci and Bergault (2024) for a different approach to make-take fees. In our paper, the entity designing
the contract is the CFM. We find approximate closed-form solutions to the stochastic game and obtain
insights into the reward structure that attracts, in equilibrium, the highest possible order flow to the venue.
To the best of our knowledge, this is the first article to study the design of AMMs as a leader-follower stochas-
tic game. In our framework, LPs aim to maximize exponential utility of wealth and the venue wishes to
maximize trading activity. As customary in leader-follower games, for a given reward structure, we compute
the optimal liquidity providing strategy from the representative LP (follower), and using this, we compute
the optimal reward structure to be provided by the venue (leader). The new design comes in the form of a
“contract” that encodes the reward structure obtained in the second optimization. We find that if higher
liquidity (in the pool) does not attract noise trading, then LPs do not have incentives to add liquidity to the
pool. On the other hand, if higher liquidity attracts noise trading, then, the optimal contract incentivises LPs
to add liquidity to the pool in order to benefit from the noise order flow. In such a scenario, the transaction
costs in the external market scale the amount that the representative LP adds to the pool. In equilibrium,
the optimal contract depends on the external price, the pool’s reference price, and the reserves in the pool.
Our equilibrium solutions provide insights into the design of these emerging venues.
The remainder of the paper proceeds as follows. Section 2 introduces the probabilistic framework of the
model. In particular, Section 2.3 introduces the problem of the representative LP and Section 2.4 introduces
the problem of the venue. The solutions to these two problems are derived in Sections 3 and 4, respectively.
Finally, Section 5 presents the numerical results and we collect proofs in the appendix.
2. The model
## 2.1 Probabilistic framework
Let T > 0 be a trading horizon (e.g., one day), Ωc the set of continuous functions from T = [0,T] into R, Ωd
the set of piecewise constant càdlàg functions from T into N, and Ω = Ωc
2
× Ωd
2
with the corresponding
Borel algebra F. The observable state is the canonical process (χt)t∈T = Wt,Bt,N̂+
t ,N̂−
t

t∈T
of the
measurable space (Ω,F), with
Wt(ω) := w(t), Bt(ω) := b(t), N̂+
t (ω) := n̂+
(t), N̂−
t (ω) := n̂−
(t), for all t ∈ T,
where ω := (w,b,n̂+
,n̂−
) ∈ Ω.
We introduce a probability measure P such that W and B are Brownian motions and N̂−
, N̂+
are Poisson
processes with intensity a0 > 0. In this probability measure, W, B, N̂−
and N̂+
are independent.5
2Cartea et al. (2023c) is an earlier version of this paper where arithmetic liquidity pools were introduced.
3Similar to Fukasawa et al. (2025), we study an aggregate of LPs as a representative provider.
4In their paper, the regulator is the leader and the LPs are the followers.
5The independence assumption between W and B can be relaxed.
2We study trading in a pair of assets X and Y (e.g., USDC and ETH) that takes place in a constant function
market (CFM). In addition to the CFM, there is an external limit order book (LOB) venue where trading
in X and Y occurs. We let S = (St)t∈T be the external midprice of asset Y in terms of asset X. Within
the CFM, we let Xt and Yt be the quantities of assets X and Y in the pool at time t ∈ T. The CFM has
trading function f(x,y) = xy; this is the most popular choice of f and is known as the constant product
market (CPM). We let the function φct
(y) be the level function of f such that φct
(Yt) = Xt with
ct = f(Xt9,Yt9) = Xt9 Yt9 .
More precisely, we have that
φc(y) =
c
y
, (φc)′
(y) = −
c
y2
.
The external midprice satisfies
dSt = σ dWt , S0 ∈ R+
,
where σ > 0 is the volatility parameter. We think of the external price as that of a venue where price
formation takes place (e.g., Binance, Kraken).
In the CFM, liquidity takers arrive according to the counting processes N−
(LT buys) and N+
(LT sells)
that model the number of trades of size ξ > 0 through time. We denote Z = (Zt)t∈T as the marginal price
of Y in terms of X in the venue. We follow the characterization of CFMs in Cartea et al. (2024b) that
describes the mechanics of the reserves (Xt)t∈T, (Yt)t∈T, and the instantaneous rate (Zt)t∈T, according to
the arrival of orders N−
and N+
, and extend it to include stochastic pool depths (given by ct) due to the
activity of LPs. In our model we write
dXt = Zt η dBt
| {z }
activity from LPs
−[φct(Yt9) − φct(Yt9 + ξ)] dN+
t + [φct(Yt9 − ξ) − φct(Yt9)] dN−
t
| {z }
activity from LTs
,
dYt = η dBt
| {z }
activity from LPs
+ξ dN+
t − ξ dN−
t
| {z }
activity from LTs
,
dZt = [−(φct
)′
(Yt9 + ξ) + (φct
)′
(Yt9)] dN+
t + [−(φct
)′
(Yt9 − ξ) + (φct
)′
(Yt9)] dN−
t
| {z }
activity from LTs
,
dN−
t = 1Yt9>ξ dN̂−
t ,
dN+
t = dN̂+
t ,
with η > 0 representing the volatility in liquidity provision, N+
0 = N−
0 = 0, X0 ∈ R+
, Y0 ∈ (ξ,∞), and
Z0 = X0/Y0. The constraint 1{Yt9>ξ} is to guarantee that there is a strong solution to the above dynamics;
in practical applications this indicator is always equal to one. The interpretation of the above equations
is as follows, given a liquidity taking buy order (resp. sell order), the quantity Yt goes down (resp. up) by
ξ, the quantity in Xt increases (resp. decreases) to its new level φct(Yt9 − ξ) (resp. φct(Yt9 + ξ)), and the
instantaneous rate moves to its new level φ′
ct
(Yt9 − ξ) (resp. φ′
ct
(Yt9 + ξ)).
Finally, we endow the space (Ω,F) with the P−augmented canonical filtration F := (Ft)t∈T generated by
(χt)t∈T.
## 2.2 The weak formulation
We introduce (Lt)t∈T as the Doléans-Dade exponential of
Z t
0
(λ−
u − a0)dÑ−
u +
Z t
0
(λ+
u − a0)dÑ+
u ,
3where
λ±
t = λ̄±
(Zt9,Yt9,St), dÑ±
t = dN̂±
t − λ±
t dt,
with
λ̄±
(Z,Y,S) = max{a0,a1 + a2 Y ± a3 (Z − S)} , a0 > 0, a1,a2,a3 ≥ 0. (2.1)
The linear model for the intensities (inspired by Stoikov and Sağlam (2009)) tries to capture three stylized
facts: (i) a1 is the baseline intensity of order arrivals of liquidity motivated trades, (ii) a2 models the rela-
tionship between arrivals and depth (locally, all else being the same, higher depth may imply more arrivals),6
and (iii) a3 captures the impact of trading by the arbitrageurs that align the quotes between the external
LOB venue and the CFM. The effect of S − Z in the intensities is asymmetric, this is because when S > Z
(resp. S < Z), all else being equal, we expect a higher (resp. lower) buying intensity and a lower (resp. higher)
selling intensity given that the instantaneous rate in the pool is underpriced (resp. overpriced). The mini-
mum intensity a0 > 0 is a technical condition to keep the intensity away from zero. This is non-restrictive
and in practice we expect both intensities to be bounded away from zero. In Subsection 4.3 we carry out
experiments with market data to support these claims.
Let ν∞ > 0 be a bound for the speed at which the representative LP adds or subtracts liquidity from the
pool. The set of admissible strategies of the representative LP is
A := {ν = (νt)t∈T : ν is F-progressively measurable and |νt| ≤ ν∞ P ⊗ dt a.e.} ,
and for each ν ∈ A we introduce the Radon-Nikodym derivative (Kν
t )t given by
Kν
t := exp
Z t
0
νs
η
dBs −
1
2
Z t
0

νs
η
2
ds
!
.
Given that ν ∈ A, the process (Kν
t )t∈T is a martingale (by Novikov’s condition using that ν is bounded)
and we define the probability measure Pν
given by
dPν
dP
:= Kν
T LT .
Given that all the probability measures (Pν
)ν∈A are equivalent, we use the notation a.s. for almost surely
without ambiguity.
In summary, under Pν
, the processes N̂+
and N̂−
have respective intensities λ+
t

t∈T
and λ−
t

t∈T
, the
process
Bν
t = Bt −
Z t
0
νs
η
ds
is a standard Brownian motion, and W is a standard Brownian motion with ⟨W,Bν
⟩ = 0. Thus, under Pν
6The rationale for this is that more depth implies less slippage for any liquidity taking trade executed in the pool. Thus,
all else being the same, it is more desirable to trade in a pool with more depth. For mathematical tractability, we employ the
quantity a2 Yt as a proxy for the depth. This is a reasonable approximation over a short time horizon, during which large moves
in Yt are mainly driven by LPs activity.
4we write
dSt = σ dWt ,
dXt = Zt νtdt
| {z }
representative LP
+Zt η dBν
t
| {z }
other LPs
−[φct(Yt9) − φct(Yt9 + ξ)] dN+
t + [φct(Yt9 − ξ) − φct(Yt9)] dN−
t
| {z }
activity from LTs
,
dYt = νtdt
|{z}
representative LP
+ η dBν
t
| {z }
other LPs
+ξ dN+
t − ξ dN−
t
| {z }
activity from LTs
,
dZt = [−(φct
)′
(Yt9 + ξ) + (φct
)′
(Yt9)] dN+
t + [−(φct
)′
(Yt9 − ξ) + (φct
)′
(Yt9)] dN−
t
| {z }
activity from LTs
.
## 2.3 The problem of the follower: the representative LP
The representative LP finances her stake in the pool by trading in the external market. That is, to add
(resp. subtract) νt dt units of Y in (resp. from) the pool at time t, the representative LP purchases (resp. sells)
νt dt units in the external market at price (St+aνt)νt dt where a is the temporary price impact in the external
venue. Thus, for 0 ≤ s ≤ t ≤ T, the performance criterion of the representative LP is defined as
Qν
s,t : = (Zt Yt + Yt St) − (Zs Ys + Ys Ss)
| {z }
(Xt+Yt St)−(Xs+Ys Ss)
−
Z t
s
Zu9 νu9 du −
Z t
s
(Su + aνu9)νu9 du .
The first two terms account for the mark-to-market of the stake in the pool, with the quantity Yt valued at
the external price St. The term −
Rt
s
Zu9 νu9 du is the financing of the units added or subtracted in asset X.7
Lastly, the term −
Rt
s
(Su+aνu9)νu9 du is the financing of the units added or subtracted in asset Y —the rep-
resentative LP pays the costs of trading (e.g., walking the LOB and spread) through the quadratic term aν2
t .
The above can be written as
Qν
s,t = −
Z t
s
aν2
u9 du + η
Z t
s
(Su9 + Zu9)dBν
u
+ σ
Z t
s
Yu9 dWu +
Z t
s
∆−
u dN−
u +
Z t
s
∆+
u dN+
u ,
for s < t where
∆±
u := ±ξ

Su −
Zu9 Yu9
Yu9 ± ξ

.
Thus, the control problem that the representative LP wishes to solve is given by
Vt(R) = sup
ν∈A
Eν
t

−exp

−γ (R + Qν
t,T )

,
where R ∈ L2
(Ω,FT ,Pν
) is the reward offered by the venue to the representative LP and γ > 0 is the risk
aversion parameter of the representative LP.8
To ensure that the above expectation is well-defined, we need
the following technical condition.
Condition 1. There exists γ′
> γ such that
sup
ν∈A
Eν
[exp{−γ′
R}] < +∞.
In Section 3, for each reward R, we prove that there exists a unique optimal response ν∗
(R).
7The calculations below can be carried out if one also includes a running penalty of the form −
R t
s p(u,Zu,Yu,Su)du. For
simplicity of formulae, we do not include the running penalty.
8Eν
t represents the conditional expectation with respect to the sigma-algebra Ft under the probability measure Pν.
52.4 The problem of the leader: the venue
The venue provides a contract R to the representative LP and wishes to attract as much order flow as possible
to the venue (i.e., N−
T + N+
T ). Thus, the venue wishes to maximize the following performance criterion
Eν∗
(R)

−exp

−ζ r(N−
T + N+
T ) − R
 
,
where ζ > 0 is the venue’s risk aversion parameter and r > 0 is a constant transaction fee paid by LTs to
the venue. For the above expectation to be well-defined, we need the following technical condition.
Condition 2. There exists ζ′
> ζ such that
sup
ν∈A
Eν
[exp{ζ′
R}] < +∞.
The set of admissible contracts is given by
AR
= {R, FT − measurable, such that V0(R) ≥ R and Conditions 1 and 2 are satisfied} ,
where R < 0 is the reservation level of the LP, i.e. the smallest acceptable utility level, in the sense that the
LP refuses the contract if it doesn’t allow them to reach this utility level; see Remark 1 below for a more
detailed discussion.
Next, we characterize the solution to the leader-follower game between the venue and the representative LP.
Section 3 studies the optimal response of the follower ν∗
(R) and Section 4 finds the optimal contract R∗
.
3. Solving the problem of the LP
For any (ν,A) ∈ [−ν∞,ν∞] × R4
, with A = AW
,AB
,A+
,A−

, we define
h(ν,A) = −aν2
+
1
η
AB
ν .
It is easy to see that for any A ∈ R4
, the maximizer of h(·,A) is reached at
ν̄(A) =

AB
2aη
∨ −ν∞

∧ ν∞ .
We then define
H(A) = sup
|ν|≤ν∞
h(ν,A) = h(ν̄(A),A).
For any constant P0 ∈ R and predictable process (At)t∈T = AW
t ,AB
t ,A+
t ,A−
t

t∈T
satisfying that
sup
ν∈A
Eν
"Z T
0
AB
t
2
+ AW
t
2
dt
#
< ∞,
and
Z T
0
γ
2
h
AW
s + σ Ys9
2
+ AB
s + η (Ss9 + Zs9)
2
i
−
X
i∈{+,−}
λi
s (1 − e−γ(Ai
s+∆i
s)
)
γ
− H(As) ds < ∞ P-a.s.,
6we introduce the process
PP0,A
t = P0 +
X
i∈{+,−}
Z t
0
Ai
s dN̂i
s +
Z t
0
AW
s dWs +
Z t
0
AB
s dBs
+
Z t
0
(
γ
2
h
AW
s + σ Ys9
2
+ AB
s + η (Ss9 + Zs9)
2
i
−
X
i∈{+,−}
λi
s (1 − e−γ(Ai
s+∆i
s)
)
γ
− H(As)
)
ds,
and we denote by Λ the set of all processes (At)t∈T such that Conditions 1 and 2 are satisfied with reward
R = P0,A
T and
sup
ν∈A
sup
t∈T
Eν
h
exp
n
−γ′
P0,A
t
oi
< ∞ for some γ′
> γ .
We denote by P the set
P =
n
PP0,A
T such that P0 ∈ R, A ∈ Λ, and V0

PP0,A
T

≥ R
o
.
It is clear that P ⊂ AR
. The next two theorems are proved in Appendix A.
Theorem 1. For any R ∈ AR
, there exists a unique (P0,A) ∈ R × Λ such that R = PP0,A
T . In particular,
AR
= P.
Theorem 2. For any reward structure R = PP0,A
T as stated in Theorem 1, the LP’s value function is
V0 PP0,A
T

= −exp(−γ P0),
with optimal liquidity providing speed
ν∗
t = ν̄(At) =

AB
t
2aη
∨ −ν∞

∧ ν∞ .
Remark 1. Theorem 2 shows that P0 is the certainty equivalent of an LP that faces contract PP0,A
T and
trades optimally; it also shows that any admissible contract must satisfy −exp(−γP0) ≥ R. In papers such
as El Euch et al. (2021), the reservation level R is chosen to be the utility level of the agent in the absence
of a contract. This is reasonable in their framework since an agent behaving in an optimal way is already
profitable even without a contract. This is not the case in our paper: it is well-known that, in the absence of
fees, an agent providing liquidity for a CPM is exposed to a concave and negative payoff. Therefore, if the
venue wants to attract LPs, it should redistribute some of the fees. More precisely, since the LP can simply
choose not to participate in the pool, if the venue wants to retain them it should at least offer a contract that
will allow the LP to have a non-negative certainty equivalent, i.e., P0 should be non-negative. It is therefore
reasonable to consider −1 ≤ R < 0. Competition between venues in order to attract LPs should tend to
increase this value. In the numerical examples below, we choose R so that the representative LP and the
venue share the profits collected from fees.
4. Solving the problem of the venue
Here, we formulate the control problem of the venue. First, we discuss the risk-neutral case in Subsection
4.1 and then the exponential utility case in Subsection 4.2.
## 4.1 Risk-neutral venue
We first consider the case where ζ ↓ 0, in which case the venue’s optimization problem amounts to
sup
R∈AR
Eν∗
(R)

r(N−
T + N+
T ) − R

.
7In view of Theorem 2, this is equivalent to
sup
P0≥P̂0
sup
A∈Λ
Eν∗
(P
P0,A
T )
h
r(N−
T + N+
T ) − PP̂0,A
T
i
,
where P̂0 = −1/γ log(−R). For any A ∈ Λ, the supremum over P0 of the objective function is reached at
P0 = P̂0. The problem of the venue is therefore equivalent to
sup
A∈Λ
Eν∗
(P
P̂0,A
T )
"Z T
0
(
−
γ
2
h
AW
s + σ Ys9
2
+ AB
s + η (Ss9 + Zs9)
2
i
+
X
i∈{+,−}
λi
s (1 − e−γ(Ai
s+∆i
s)
)
γ
+ H(As) −
AB
s ν∗
s
η
)
ds +
X
i∈{+,−}
Z T
0
(r − Ai
s)dNi
s −
Z T
0
A−
s 1Ys9≤ξ dN̂−
s
#
.
We define
v(t,z,y,s) = sup
A∈Λ
E
ν∗
(P
P̂0,A
T )
t,z,y,s
"Z T
t
(
−
γ
2
h
AW
s + σ Ys9
2
+ AB
s + η (Ss9 + Zs9)
2
i
+
X
i∈{+,−}
λi
s (1 − e−γ(Ai
s+∆i
s)
)
γ
+ H(As) −
AB
s ν∗
s
η
)
ds
+
X
i∈{+,−}
Z T
t
(r − Ai
s)dNi
s −
Z T
0
A−
s 1Ys9≤ξ dN̂−
s
#
.
We derive the Hamilton–Jacobi–Bellman (HJB) equation and substitute H(A) = h(ν̄(A),A) to obtain
0 = λ̄−

r + v(t,Z−
,Y − ξ,S) − v(t,Z,Y,S)

1Y >ξ + λ̄+

r + v(t,Z+
,Y + ξ,S) − v(t,Z,Y,S)

+
1
4
"
− 2γ η2
S2
− 4γ η2
S Z − 2γ η2
Z2
− 2γ σ2
Y 2
+ 2σ2
∂SSv + 2η2
∂Y Y v + 4∂tv
#
+ sup
A
(
−
γ
2
(AW
)2
− Y γ σ AW

+
"
−
γ
2
(AB
)2
+ h(ν̄(A),A) −
AB
ν̄(A)
η
− (S + Z)γ η AB
+ ∂Y v ν̄(A)
#
+ λ̄−
(Z,Y,S)
"
−A−
+
1 − e−γ (A−
+∆−
)
γ
#
1Y >ξ + λ̄−
"
−A−
+
1 − e−γ A−
γ
#
1Y ≤ξ
+ λ̄+
(Z,Y,S)
"
−A+
+
1 − e−γ (A+
+∆+
)
γ
#)
, (4.1)
where Z−
= Z Y 2
/(Y − ξ)2
, Z+
= Z Y 2
/(Y + ξ)2
. We define a new function
α(t,Z,Y,S) =
∂Y v
aη − 2(S + Z)γ η
2γ + 1
aη2
.
8Then the supremum in the HJB equation is attained at
(AW
)∗
= −Y σ , (4.2)
(AB
)∗
=
(
α(t,Z,Y,Z) if α(t,Z,Y,S) ∈ [−2aη ν∞,2aη ν∞],
−(S + Z)η otherwise,
(4.3)
(A−
)∗
= −∆−
1Y >ξ , (4.4)
(A+
)∗
= −∆+
. (4.5)
Observe that with this optimal reward structure, the venue compensate any risk that the LPs face from the
external price movement and liquidity taking. The PDE obtained from the HJB equation (4.1) and substitut-
ing (A−
,A+
,AW
,AB
) as in (4.2)–(4.5) is difficult to solve, and we propose in Section 4.3 an approximation
technique. However, following Pham (2009), we employ the below verification theorem assuming that the
solution exists in the classical sense.
Proposition 1. If there exists a function v ∈ C1,2
([0,T] × R3
;R) such that v has quadratic growth in
(Z,Y,S) (uniformly in t) and it satisfies the HJB equation (4.1) with v(T,·,·,·) = 0, then
v(t,Zt,Yt,St) = sup
A∈Λ
E
ν∗
(P
P0,A
T )
t
h
r(N−
T + N+
T ) − PP0,A
T
i
dt ⊗ dP-a.e.,
with optimal (A−
)∗
,(A+
)∗
,(AW
)∗
,(AB
)∗
as in (4.2)–(4.5).
## 4.2 Risk-averse venue
Observe that under Pν
, we have
Pt = P0 +
Z t
0
(
γ
2
h
AW
s + σ Ys9
2
+ AB
s + η (Ss9 + Zs9)
2
i
−
X
i∈{+,−}
λi
s (1 − e−γ(Ai
s+∆i
s)
)
γ
− H(As) +
AB
s ν̄(As)
η
)
ds
+
X
i∈{+,−}
Z t
0
Ai
s dNi
s +
Z t
0
A−
s 1Ys9≤ξ dN̂−
s +
Z t
0
AW
s dWs +
Z t
0
AB
s dBν∗
s .
We let V be the value function of the risk averse venue, given by
V (t,Zt,Yt,St,N̂−
t ,N−
t ,N+
t ,PP0,A
t ) = sup
A∈Λ
E
ν∗
(R)
t

−exp

−ζ r(N−
T + N+
T ) − R
 
.
The full HJB equation for the above control problem is
0 = sup
A−,A+,AW ,AB
∂tV + (∂Y V )ν̄(A) + (∂P V )
(
γ
2
h
AW
+ σ Y
2
+ AB
+ η (S + Z)
2
i
−
X
i∈{+,−}
λ̄i
(Z,Y,S)(1 − e−γ(Ai
+∆i
)
)
γ
− H(A) +
AB
ν̄(A)
η
)
+ (∂Y Y V )
η2
2
+ (∂Y P V )AB
η
+ (∂SSV )
σ2
2
+ (∂SP V )AW
σ + (∂PP V )
(AW
)2
+ (AB
)2
2
+
X
i∈{+,−}
λ̄i
(Z,Y,S)

V i
− V

!
,
9with
V −
= V (t,Z Y 2
/(Y − ξ1Y >ξ)2
,Y − ξ1Y >ξ,S,N̂−
+ 1,N−
+ 1Y >ξ,N+
,P + A−
),
V +
= V (t,Z Y 2
/(Y + ξ)2
,Y + ξ,S,N̂−
,N−
,N+
+ 1,P + A+
).
By taking the ansatz
V (t,Z,Y,S,N̂−
,N−
,N+
,P) = −e−ζ[r(N−
+N+
)−P+v(t,Z,Y,S)]
and dividing the HJB equation by ζ V (t,Z,Y,S, ˆ N−,N−
,N+
,P), we obtain
0 =
1
2
inf
AB
(
(γ + ζ)(AB
)2
+ 2aν̄(A)2
+ 2 [γ η (S + Z) − ζ γ ∂Y v] AB
− 2(∂Y v)ν̄(A)
)
+
1
4
inf
AW
(
2(γ + ζ)(AW
)2
+ 4σ (γ Y − ζ ∂Sv)AW
)
− sup
A−
(
λ̄−
(Z,Y,S)
1 − e−ζ (v−
−v+r−A−
)
ζ
1Y >ξ +
1 − eζ A−
ζ
1Y ≤ξ +
1 − e−γ(A−
+∆−
)
γ
!)
− sup
A+
(
λ̄+
(Z,Y,S)
1 − e−ζ (v+
−v+r−A+
)
ζ
+
1 − e−γ(A+
+∆+
)
γ
!)
+
1
2
γ η2
S2
+ γ η2
S Z +
1
2
γ η2
Z2
+
1
2
γ σ2
Y 2
+
1
2
ζ σ2
(∂Sv)2
−
1
2
σ2
∂SSv +
1
2
ζ η2
(∂Y v)2
−
1
2
η2
∂Y Y v − ∂tv , (4.6)
with
v−
= v(t,Z Y 2
/(Y − ξ1Y >ξ)2
,Y − ξ1Y >ξ,S),
v+
= v(t,Z Y 2
/(Y + ξ)2
,Y + ξ,S)
and terminal condition v(T,Z,Y,S) = 0.
We define
αζ(t,Z,Y,S) =

1
aη + 2ζ η

∂Y v − 2γ η (S + Z)
2(γ + ζ) + 1
aη2
.
The optimal values for AB
, AW
, A−
, and A+
are
(AB
t )∗
=
(
αζ(t,Zt9,Yt9,St) if αζ(t,Zt9,Yt9,St) ∈ [−2aη ν∞,2aη ν∞]
ζ γ ∂Y v−γ η (S+Z)
γ+ζ otherwise
, (4.7)
(AW
t )∗
=
σ (ζ ∂Sv − γ Y )
γ + ζ
, (4.8)
(A−
t )∗
=
(
−γ ∆−
+ζ (v−
−v+r)
γ+ζ if Yt9 > ξ,
0 otherwise,
(4.9)
(A+
t )∗
=
−γ ∆+
+ ζ (v+
− v + r)
γ + ζ
. (4.10)
As before, we state the following standard verification theorem.
10Proposition 2. If there exists a function v ∈ C1,2
([0,T] × R3
;R) such that v has quadratic growth in
(Z,Y,S) (uniformly in t) and it satisfies the HJB equation (4.6) with v(T,·,·,·) = 0, then
v(t,Zt,Yt,St) = sup
A∈Λ
E
ν∗
(P
P0,A
T )
t
h
−exp
n
−ζ

r(N−
T + N+
T ) − PP0,A
T
oi
dt ⊗ dP-a.e.,
with optimal (A−
)∗
,(A+
)∗
,(AW
)∗
,(AB
)∗
as in (4.7)–(4.10).
## 4.3 Approximate closed-form solutions
The HJB equations above are difficult to solve. Next, we carry out approximations that make the above
equations more tractable.
4.3.1. Risk-neutral venue
First, we ignore the boundary imposed on the control, that is, we take ν∞ ↑ ∞ so that (AB
t )∗
= α(t,Zt,Yt,St).
Furthermore, we only consider the case where Y > ξ. Substituting this, we obtain
0 =
X
i∈{+,−}
λi

r + h(t,Zi
,Y + δi
ξ,S) − h(t,Z,Y,S)

+
1
4
"
− 2γ η2
S2
− 4γ η2
S Z − 2γ η2
Z2
+ 2σ2
∂SSh + 2η2
∂Y Y h + 4∂th
#
+
1
4
(
∂Y h
aη − 2(S + Z)γ η
2
2γ + 1
aη2
+ 4
X
i∈{+,−}
λ̄i
(Z,Y,S)

δi
ξ

S −
Z Y
Y + δi ξ
)
,
with δ−
= −1, and δ+
= 1. Next, we remove the indicator 1Yt>ξ from the stochastic intensities to obtain
λ−
t ≈ max{a0,a1 + a2 Yt + a3 (St − Zt)} , λ+
t ≈ max{a0,a1 + a2 Yt + a3 (Zt − St)} .
We have four possibilities: (i) λ−
,λ+
> a0, (ii) λ−
= a0, λ+
> a0, (iii) λ−
> a0, λ+
= a0, and (iv)
λ−
,λ+
= a0. In what follows, we work under the assumption that model parameters are such that one is
always in scenario (i), which helps us to obtain approximate closed-form solutions. First, we justify (with
market data) that the above assumption is a good proxy for reality.
We employ market data from Uniswap V2 and from Binance for the pair ETH-USDC between 1 January
2022 and 30 April 2022. During these four months, we monitor the exchange rate in Binance (the midprice
St), the instantaneous exchange rate in the Uniswap pool (Zt), and the trading activity (liquidity taking
orders) in the pool. We split the data into 10-minute buckets, and within a given 10-minute window, we
compute the aggregate of the buy-initiated trades and sell-initiated trades.9
We think of these aggregates
as a rough estimate for the intensities λ±
t . Finally, we perform a linear regression that explains λ±
t in terms
of the average differences ±(St −Zt); for now, we set a2 = 0 for simplicity.10
We use the estimates â1,â3 to
compute the boundaries ±d such that 0 = â1 +â3 d. If St −Zt < d or St −Zt > −d then λ−
t = 0 or λ+
t = 0,
respectively. Figure 1 shows the boundaries ±d (in red dotted vertical lines) together with market data on
St − Zt.
9Using a five-minute or a fifteen-minutes window yields similar results.
10The coefficients â1, â3 are both significative with a p-value p ≪ 0.01.
11−10 0 10
price difference
0
500
1000
1500
count
violations
market data
Figure 1: Histogram of price differences between Binance and Uniswap V2 for ETH-USDC between 1 January 2022 and 30 April
2022. The red shaded area represents the region in which a1 ± a3(St − Zt) becomes negative. We take a2 = 0 for simplicity so
that the violation boundary is fixed and does not depend on the number of ETH units in the pool.
We find that of the 17,131 data points in the histogram above, the boundaries are breached 30 times to the
left and 34 times to the right. Thus, 0.37% of the data points violate the assumption that in our model
â1 ± â3 (St − Zt) > 0.
Next, we use Laurent series to approximate the following terms
Y
Y + δ± ξ
=
∞ X
n=0
(−1)n

δ±
ξ
Y
n
= 1 + O

ξ
Y

,
Y 2
Y + δ± ξ
= Y +
∞ X
n=1
(−1)n

(δ±
ξ)n
Y n−1

= Y − δ±
ξ + O

ξ2
Y

,
Y 2
(Y + δ± ξ)2
=
∞ X
n=0
(n + 1)(−1)n

δ±
ξ
Y
n
= 1 + O

ξ
Y

,
Y 3
(Y + δ± ξ)2
=
∞ X
n=0
Y (n + 1)(−1)n

δ±
ξ
Y
n
= Y − 2δ±
ξ + O

ξ2
Y

.
Given that Z±
= Z Y 2
/(Y + δ±
ξ)2
, and using the above approximations, we have that
h(t,Zi
,Y + δ±
ξ,S) = h(t,Z,Y + δ±
ξ,S) + Z

Y 2
(Y + δ± ξ)2
− 1

∂Zh(t,Z,Y + δ±
ξ,S) + O

ξ2
Y 2

≈ h(t,Z,Y + δ±
ξ,S),
Y h(t,Zi
,Y + δ±
ξ,S) = Y h(t,Z,Y + δ±
ξ,S) + Z

Y 3
(Y + δ± ξ)2
− Y

∂Zh(t,Z,Y + δ±
ξ,S) + O

ξ2
Y

≈ Y h(t,Z,Y + δ±
ξ,S) − 2δ±
ξ Z ∂Zh(t,Z,Y + δ±
ξ,S).
12Thus, the approximated HJB equation becomes
0 ≈ ∂th +
X
i∈{+,−}
λi

r + h(t,Z,Y + δi
ξ,S) − h(t,Z,Y,S)

+
1
4
"
− 2γ η2
S2
− 4γ η2
S Z − 2γ η2
Z2
+ 2σ2
∂SSh + 2η2
∂Y Y h
#
+
1
4
(
∂Y h
aη − 2(S + Z)γ η
2
2γ + 1
aη2
+ 4
X
i∈{+,−}
λ̄i
(Z,Y,S)

δi
ξ (S − Z)
)
+ a2
X
i∈{+,−}

ξ2
Z − 2δi
ξ Z ∂Zg(t,Z,Y + δi
ξ,S)

. (4.11)
Let ĥ be the approximation of h such that sign ‘≈’ in (4.11) turns into an equality. By taking the ansatz
ĥ(t,Z,Y,S) = h0(t,Y ) + h1(t,Y )Z + h2(t,Y )S + h3(t)Z2
+ h4(t)Z S + h5(t)S2
,
where
hi(t,Y ) = hi0(t) + hi1(t)Y, i = 0,1,2,
we obtain
∂Y ĥ(t,Z,Y,S) = h01(t) + h11(t)Z + h21(t)S = 2a2 r(T − t).
Substituting this into (AB
)∗
, we obtain
(AB
t )∗
≈
1
2γ + 1
aη2

2a2 r(T − t)
aη
− 2(S + Z)γ η

.
Let ν̂∗
be the approximation of ν∗
(where we replace h with ĥ); we obtain that
ν̂∗
t =
1
4η aγ + 2
η

2a2 r(T − t)
aη
− 2(S + Z)γ η

=
2a2 r(T − t) − 2(S + Z)γ aη2
4η2 a2 γ + 2a
.
Remark 2. For a risk-neutral venue, if the noise in the liquidity provision is small (η ↓ 0), we have that
ν̂∗
t →
a2 r(T − t)
a
.
That is, the provision of liquidity is inversely proportional to the transaction costs in the external venue a,
and directly proportional to (i) the fees collected by the venue r and (ii) the sensitivity of order flow to the
depth of the pool a2. In particular, if a2 = 0, the LP does not add nor remove liquidity from the pool in
equilibrium.
4.3.2. Risk-averse venue
Here we work out the approximate solution when the venue is risk-averse. We take ν∞ ↑ ∞ such that
ν∗
(At) = AB
t /(2aη). We also employ the approximation e−x
≈ 1 − x and we only consider the case where
13Yt9 > ξ. We obtain that
0 ≈ −
1
4
h
1
aη + 2ζ η

∂Y v − 2γ η (S + Z)
i2
2(γ + ζ) + 1
aη2
−
1
2
σ2
(ζ ∂Sv − γ Y )2
γ + ζ
−
X
i∈{+,−}
λ̄i
(Z,Y,S)

vi
− v + r + δi
ξ

S −
Z Y
Y + δi ξ

+
1
2
γ η2
S2
+ γ η2
S Z +
1
2
γ η2
Z2
+
1
2
γ σ2
Y 2
+
1
2
ζ σ2
(∂Sv)2
−
1
2
σ2
∂SSv +
1
2
ζ η2
(∂Y v)2
−
1
2
η2
∂Y Y v − ∂tv ,
where v±
= v(t,Z,Y + δ±
ξ,S).
We focus on the regime where λ̄±
(t,Zt9,Yt9,St) > a0. Furthermore, we make the following approximations
Y
Y + δ± ξ
=
∞ X
n=0
(−1)n

δ±
ξ
Y
n
= 1 + O

ξ
Y

,
Y 2
Y + δ± ξ
= Y +
∞ X
n=1
(−1)n

(δ±
ξ)n
Y n−1

= Y − δ±
ξ + O

ξ2
Y

,
Y 2
(Y + δ± ξ)2
=
∞ X
n=0
(n + 1)(−1)n

δ±
ξ
Y
n
= 1 + O

ξ
Y

,
Y 3
(Y + δ± ξ)2
=
∞ X
n=0
Y (n + 1)(−1)n

δ±
ξ
Y
n
= Y − 2δ±
ξ + O

ξ2
Y

,
which implies that
v(t,Z Y 2
/(Y + δ±
ξ)2
,Y + δ±
ξ,S)
= v(t,Z,Y + δ±
ξ,S) + Z

Y 2
(Y + δ± ξ)2
− 1

∂Zv(t,Z,Y + δ±
ξ,S) + O

ξ
Y

≈ v(t,Z,Y + δ±
ξ,S),
and
Y v(t,Z±
,Y + δ±
ξ,S)
= Y v(t,Z,Y + δ±
ξ,S) + Z

Y 3
(Y + δ± ξ)2
− Y

∂Zv(t,Z,Y + δ±
ξ,S) + O

ξ
Y

≈ Y v(t,Z,Y + δ±
ξ,S) − 2δ±
ξ Z ∂Zv(t,Z,Y + δ±
ξ,S).
14We obtain that
0 ≈ −
1
4
h
1
aη + 2ζ η

∂Y v − 2γ η (S + Z)
i2
2(γ + ζ) + 1
aη2
−
1
2
σ2
(ζ ∂Sv − γ Y )2
γ + ζ
−
X
i∈{+,−}
a1 + a2 Y + a3 δi
(Z − S)

(vi
− v) − 2a1 r − 2a2 rY
− 2a2 ξ2
Z + 2a3 ξ (S − Z)2
+ a2
X
i∈{+,−}

2δi
ξ Z ∂Zv(t,Z,Y + δi
ξ,S)

+
1
2
γ η2
S2
+ γ η2
S Z +
1
2
γ η2
Z2
+
1
2
γ σ2
Y 2
+
1
2
ζ σ2
(∂Sv)2
−
1
2
σ2
∂SSv +
1
2
ζ η2
(∂Y v)2
−
1
2
η2
∂Y Y v − ∂tv .
We let v̂ be the approximation of v such that the sign ≈ above turns into an equality, and employ the ansatz
v̂(t,Z,Y,S) = g11(t) + 2y⊤
G1(t) + y⊤
G2(t)y,
where y = Z Y S
⊤
and
G1(t) = g12(t) g13(t) g14(t)
⊤
,
G2(t) =


g22(t) g23(t) g24(t)
g23(t) g33(t) g34(t)
g24(t) g34(t) g44(t)

 ,
with terminal conditions gij(T) = 0 for i,j ∈ {1,2,3,4}.
We obtain the following system of differential equations:
0 = −G2
′
(t) + G2(t)U G2(t) + V ⊤
G2(t) + G2(t)V + R,
0 = G1
′
(t) + C(t)G1(t)⊤
+ E(t),
0 = g11
′
(t) + 2a1 r +
1 + 2aζ η2
− 4a2
γ ζ η4

g13(t)2
a(1 + 2a(γ + ζ)η2
−
2γ ζ σ2
g14(t)2
γ + ζ
+ (2a1 ξ2
+ η2
)g33(t) + σ2
g44(t),
where for the first equation, U,V , and R are given by
U =



0 0 0
0 −1+2aζ η2
−4a2
γ ζ η4
a(1+2a(γ+ζ)η2) 0
0 0 2γ ζ σ2
γ+ζ


 ,
V =



0 0 0
−2a3 ξ + γ η2
(1+2aζ η2
)
1+2a(γ+ζ)η2 0 2a3 ξ + γ η2
(1+2aζ η2
)
1+2a(γ+ζ)η2
0 γ ζ σ2
γ+ζ 0


 ,
R =




2a3 + γ η2
(1+2aζ η2
)
2+4a(γ+ζ)η2 0 −2a3 + γ η2
(1+2aζ η2
)
2+4a(γ+ζ)η2
0 γ ζ σ2
2(γ+ζ) 0
−2a3 + γ η2
(1+2aζ η2
)
2+4a(γ+ζ)η2 0 2a3 + γ η2
(1+2aζ η2
)
2+4a(γ+ζ)η2



 ,
15and for the second equation, C(t) and E(t) are
C(t) =






0 −aγ η2
(1+2aζ η2
)+2a3 aξ (1+2a(γ+ζ)η2
)+(1+2aζ η2
−4a2
γ ζ η4
)g23(t)
a(1+2a(γ+ζ)η2) −2γ ζ σ2
g24(t)
γ+ζ
0 (1+2aζ η2
−4a2
γ ζ η4
)g33(t)
a(1+2a(γ+ζ)η2) −γ ζ σ2
(1+2g24(t))
γ+ζ
0 −a(γ η2
(1+2aζ η2
)+2a3 ξ (1+2a(γ+ζ)η2
))+(1+2aζ η2
−4a2
γ ζ η4
)g34(t)
a(1+2a(γ+ζ)η2) −2γ ζ σ2
g44(t)
γ+ζ






,
E(t) = a2 ξ2
(1 − 4g23(t)) a2 (r + ξ2
g33(t)) 0
⊤
.
The equation for G2 is a matrix Riccati equation. Let us introduce the matrices C = I3 and D = 0, where
I3 denotes the identity matrix in R3×3
and 0 denotes the zero matrix in the same space. The terminal
condition of the equation is G2(T) = 0, and it is therefore clear that C + DG2(T) + G2(T)D = C > 0. We
now introduce the matrix Θ given by
Θ =

−CV −CU − V ⊤
D + DV ⊤
0 −U⊤
D

.
After some calculations we see that Θ + Θ⊤
is equal to 











0 2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1 0 0 0 0
2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1 0 −2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1 − γs2
ζ
γ+ζ 0 −4a2
η4
γζ−2aη2
ζ−1
a(2aη2(γ+ζ)+1) 0
0 −2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1 − γs2
ζ
γ+ζ 0 0 0 −2γs2
ζ
γ+ζ
0 0 0 0 0 0
0 −4a2
η4
γζ−2aη2
ζ−1
a(2aη2(γ+ζ)+1) 0 0 0 0
0 0 −2γs2
ζ
γ+ζ 0 0 0












.
It is then clear that all the leading principal minors of the above matrix are non-positive; in particular, they
are all equal to zero, except for the determinant of


0 2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1
2a3ξ −
η2
γ(2aη2
ζ+1)
2aη2(γ+ζ)+1 0


which is given by
− 2a3ξ −
η2
γ 2aη2
ζ + 1

2aη2 (γ + ζ) + 1
!2
≤ 0.
Therefore, the matrix Θ + Θ⊤
is negative semi-definite, and Theorem 3.6.6 in Abou-Kandil et al. (2012)
implies that there exists a well-defined solution of the Riccati equation on (−∞,T].
5. Numerical results
For the experiments below, we discretize [0,T] in 10,000 timesteps with T = 1 (one day). We employ market
data from Binance and Uniswap V2 in the pair ETH-USDC between 1 January 2022 and 30 April 2022 to cal-
ibrate model parameters. The initial exchange rate is S0 = Z0 = 2820 in the ETH-USDC pair and the daily
volatility in Binance is σ = 0.0569 × S0.11
The average traded quantity in a ten minute window is ξ = 300,
and the fee collected by the venue per transaction is approximated by the constant fee r = 0.01 × ξ × Z0.
Here, each jump in N±
captures the aggregate trading that happened in a ten-minute window. The initial
position in the pool is Y0 = 50,000 ETH,12
and the depth of the pool is c0 = Y0 × (Y0 × Z0). We use
η = 10−10
ETH as the volatility of the Brownian motion used in the provision of liquidity. For t ∈ T, we
estimate λ±
t using data from the previous ten minutes. We then fit a linear regression to calibrate a1,a3
11We obtained the volatility estimate from market-milk daily volatility.
12This value is motivated by those in Uniswap’s ETH-USDC pool —accessed 20 February 2025.
16in (2.1); for now, we set a2 = 0. We obtain the estimates a1 = 142.7 and a3 = 13.6. These values were
scaled so that a jump corresponds to the activity in a ten-minute window in line with ξ. Below, we study
the strategies for the risk-averse case. The LP’s risk aversion parameter is γ = 10−18
and the venue’s risk
aversion is ζ = 10−6
. Lastly, for the figures below we let the temporary price impact parameter in Binance be
a = 10−14
(negligible walking the book costs in the external venue). Below, we show that as we increase the
value of this parameter, the strategy collapses around zero and the representative LP does not add liquidity
to the pool.
Figure 2 shows the violations to the approximation assumption within the simulation. That is, the violations
to the assumption that both λ−
,λ+
> 0. We observe that there are no violations to the non-negative
assumption in the simulations.
−10 0 10
price difference
0.00
0.25
0.50
0.75
1.00
count
×106
violations
simulated data
Figure 2: Histogram of simulated price differences between Binance and Uniswap V2 for ETH-USDC using 1,000 simulations
and the model parameters at the start of the section. The red shaded area represents the region in which a1 ± a3(St − Zt)
becomes negative. We take a2 = 0 for simplicity so that the violation boundary is fixed and does not depend on the number of
ETH units in the pool.
Figure 3 shows a sample path for the inventory Yt, together with the prices St (external) and Zt (pool).
0.00 0.25 0.50 0.75 1.00
t
48000
49000
50000
51000
52000
Y t (ETH)
0.00 0.25 0.50 0.75 1.00
t
2600
2700
2800
2900
3000
3100
prices (ETH/USDC)
S
Z
Figure 3: Sample path (with 90% bands across time) for the inventory of ETH in the pool (left panel), and the instantaneous
exchange rate in the pool and outside (right panel).
As expected, arbitrageurs keep the prices in the pool aligned to those outside of the pool. For these parame-
ters, with a2 = 0, the changes in Y are relatively small and seem to be driven mostly by the liquidity taking
activity; we confirm this below. Figure 4 shows the speed νt at which the LP adds or subtracts liquidity
from the pool, and the cumulative liquidity provided (given by
Rt
0
νs ds).
170.00 0.25 0.50 0.75 1.00
t
−1000
−500
0
500
1000
1500
ν ∗
t (ETH/day)
0.00 0.25 0.50 0.75 1.00
t
−20
−10
0
10
20
change in liquidity provided (ETH)
Figure 4: Sample path (with 90% bands across time) for the speed at which the LP adds/removes liquidity from the pool (left
panel), and the cumulative change in liquidity provided (right panels), given by
R t
0 νs ds.
Next, we study the optimal strategy ν∗
t of the LP in more detail. Figure 5 shows a sample path of the optimal
strategy as we stress the values of model parameters (the randomness is the same for all simulations).
0.00 0.25 0.50 0.75 1.00
t
−2000
0
2000
ν ∗
t
a∗0.5
a∗2.0
0.00 0.25 0.50 0.75 1.00
t
−5000
0
5000
ν ∗
t
σ∗0.5
σ∗2
Figure 5: Sample path of the optimal strategy of the LP as model parameters a and σ change.
As expected, the higher the volatility, the higher the variability of the strategy of the the representative LP.
The smaller the temporary price impact in the external venue a, the more trading activity the representa-
tive LP can afford. When we increase the transaction cost parameter for trading in the external venue to
a ∈ {10−13
,10−12
}, we obtain that the strategy of the representative LP collapses around zero, as shown in
Figure 6.
0.00 0.25 0.50 0.75 1.00
t
−30
−20
−10
0
10
20
30
change in liquidity provided (ETH)
0.00 0.25 0.50 0.75 1.00
t
−30
−20
−10
0
10
20
30
change in liquidity provided (ETH)
Figure 6: Sample path (with 90% bands across time) for the cumulative change in liquidity provided given by
R t
0 νs ds. The
first plot is for a = 10−13 and the second plots is for a = 10−12.
185.1 Distributing the fees collected
The starting point of the contract representation, i.e., P0, shifts the profitability of the LP to the right (the
higher P0 the more profitable), and it shifts the profitability of the venue to the left (the higher P0 the less
profitable). Here, we take P0 such that both the venue and the representative LP have the same average
wealth.
Figure 7 shows 10,000 Monte-Carlo simulations of the the equilibrium of the model. We report the distri-
bution of the final reward R and the venue’s PnL. The red line is the mean of the distribution. On both
sides, the mean is positive. The higher the right aversion of the venue, the more concentrated these profits
would be.
−2 0 2
wealthLP ×107
0
200
400
600
count
1.5 1.6 1.7
venue performance ×106
0
200
400
600
count
Figure 7: Histograms for the reward R paid to the representative LP (left panel) and the performance of the venue r(N−
T +
N+
T ) − R (right panel). The mean values are in vertical dotted lines.
The optimal contract benefits both the LPs and the venue. This can be seen in the positive values of the
means of both histograms.
## 5.2 Attracting noise trading
In the analysis we carried out so far, the intensity of order arrivals does not react to the quantity of asset Y
in the pool, i.e. a2 = 0. As shown above, this implies that the strategy of the representative LP collapses
around zero for meaningful values of the transaction cost parameter for trading in the external venue. Here,
we show that this is no longer the case if a2 > 0. In what follows, we use a2 = 10−5
and a = 5×10−6
. Note
that this value of a2 only represents around 0.5 ETH/10-minutes of added intensity (given that the amount
of ETH in the pool is around 50,000).
Figure 8 shows a trajectory with their confidence bands of the quantity of ETH in the pool, the optimal
speed at which the representative LP adds liquidity to the pool, the cumulative liquidity provided, and the
cumulative fees paid to the external venue.
190.00 0.25 0.50 0.75 1.00
t
50000
52000
54000
56000
58000
60000
62000
Y t (ETH)
0.00 0.25 0.50 0.75 1.00
t
0
5000
10000
15000
ν ∗
t (ETH/day)
0.00 0.25 0.50 0.75 1.00
t
0
2000
4000
6000
8000
change in liquidity provided (ETH)
0.00 0.25 0.50 0.75 1.00
t
0
100
200
300
400
500
fees Binance (USD)
Figure 8: Sample path (together with 90% confidence bands) of the (i) quantity of ETH in the pool (top left panel), (ii) the
optimal speed at which the representative LP adds liquidity to the pool (top right panel), (iii) the cumulative liquidity provided
(bottom left panel), and (iv) the cumulative fees paid to the external venue, given by
R t
0 a(ν∗
u)2 du (bottom right panel).
With these model parameters, the representative LP adds roughly 8000 ETH to the pool for which she pays
500 USDT in fees; for comparison, the spread in Binance for ETH-USDT is typically 0.01 which implies that
the trading costs in Binance are in the correct order of magnitude. Unlike the case in the previous section,
to the naked eye, there is no variability in the trading speed. The confidence bands in the amount of ETH in
the pool is due to the trading activity of liquidity takers. Next, we study the effect of r and a in the optimal
trading strategy of the representative LP in Figure 9.
0.00 0.25 0.50 0.75 1.00
t
0
10000
20000
30000
ν ∗
t
r∗0.5
r∗2.0
0.00 0.25 0.50 0.75 1.00
t
0
10000
20000
30000
ν ∗
t
a∗0.5
a∗2.0
Figure 9: Sample path of the optimal strategy of the LP as model parameters r and a change.
As expected, all else being equal, the higher the fee charged to LTs, the more the venue collects and the
better the contract that the venue offers the representative LP, which translates in more liquidity added to
20the pool. The effect of the transaction cost parameter is similar to that in the previous section. Higher
transaction costs in the external venue diminish the activity in the pool.
Finally, we repeat the analysis in Figure 7 for this new set of model parameters in Figure 10.
−2 0 2
wealthLP ×107
0
200
400
600
count
1.5 1.6 1.7 1.8
venue performance ×106
0
200
400
600
800
count
Figure 10: Histograms for the reward R paid to the representative LP (left panel) and the performance of the venue r(N−
T +
N+
T ) − R (right panel). The mean values are in vertical dotted lines.
We see that the performance of both players is still positive in line with the results in Figure 7. All else
being equal, when a2 > 0, both buy order arrivals and sell order arrivals increase with the liquidity in the
pool, and this additional order flow is not directional (noise trading). The representative LP exploits this
by adding liquidity to the pool and attracting more of these type of trades, which in turn allows the venue
to offer a higher reward to the representative LP. We remark that for the above histogram, the transaction
cost parameter for trading in the external venue is much higher than the one used in Figure 7.
6. Conclusion
We characterized the Stackelberg equilibrium of a venue and the representative LP. Trading took place in an
AMM and while the representative LP aims to maximize profitability, the venue wishes to collect as much
fees and order flow as possible. We find that if higher liquidity does not attract noise trading, even when
the venue employs the optimal contract, the representative LP does not have incentives to add liquidity to
the pool. On the other hand, if higher liquidity in the AMM attracts noise trading, then the representative
LP adds as much liquidity as the transaction costs in the external venue allow. Using data from 1 January
2022 to 30 April 2022, we find a positive correlation of 11% between the daily average depth in Y for the
ETH-USDC pool and the daily order flow, furthermore, the slope of the linear regression is positive but
there is no evidence to reject the hypothesis that the slope is equal to zero (the p-value is 0.232). Our work
provides insights into the optimal design of these venues going forward and the testable conditions for the
well functioning of these venues.
Acknowledgments:
We are grateful to the Oxford-Man Institute of Quantitative Finance and the Fintech Chair at Université
Paris-Dauphine for support. We thank Fayçal Drissi for providing us with data.
For the purpose of open access, the authors have applied a CC BY public copyright license to any author
accepted manuscript arising from this submission.
References
Abou-Kandil, H., Freiling, G., Ionescu, V., and Jank, G. (2012). Matrix Riccati equations in control and systems theory.
Birkhäuser.
Adams, A., Moallemi, C. C., Reynolds, S., and Robinson, D. (2024). am-amm: An auction-managed automated market maker.
arXiv preprint arXiv:2403.03367.
21Adams, H., Salem, M., Zinsmeister, N., Reynolds, S., Adams, A., Pote, W., Toda, M., Henshaw, A., Williams, E., and Robinson,
D. (2023). Uniswap v4 core [draft].
Adams, H., Zinsmeister, N., Salem, M., Keefer, R., and Robinson, D. (2021). Uniswap v3 core. Tech. rep., Uniswap, Tech.
Rep.
Angeris, G. and Chitra, T. (2020). Improved price oracles: Constant function market makers. In Proceedings of the 2nd ACM
Conference on Advances in Financial Technologies, pages 80–91.
Angeris, G., Kao, H.-T., Chiang, R., Noyes, C., and Chitra, T. (2021). An analysis of uniswap markets.
Baldacci, B. and Bergault, P. (2024). Optimal incentives in a limit order book: a spde control approach. Market Microstructure
and Liquidity, page 2050012.
Baldacci, B., Possamaı̈, D., and Rosenbaum, M. (2021). Optimal make-take fees in a multi market-maker environment. SIAM
Journal on Financial Mathematics, 12(1):446–486.
Bergault, P., Bertucci, L., Bouba, D., and Guéant, O. (2024a). Automated market makers: Mean-variance analysis of lps
payoffs and design of pricing functions. Digital Finance, 6(2):225–247.
Bergault, P., Bertucci, L., Bouba, D., Guéant, O., and Guilbert, J. (2024b). Automated market making: the case of pegged
assets. arXiv preprint arXiv:2411.08145.
Bergault, P., Bertucci, L., Bouba, D., Guéant, O., and Guilbert, J. (2024c). Price-aware automated market makers: Models
beyond brownian prices and static liquidity. arXiv preprint arXiv:2405.03496.
Capponi, A. and Jia, R. (2021). The adoption of blockchain-based decentralized exchanges. arXiv preprint arXiv:2103.08842.
Capponi, A., Jia, R., and Yu, S. (2024). Price discovery on decentralized exchanges. Available at SSRN 4236993.
Cartea, Á., Drissi, F., and Monga, M. (2023a). Decentralised finance and automated market making: Execution and speculation.
arXiv preprint arXiv:2307.03499.
Cartea, Á., Drissi, F., and Monga, M. (2023b). Execution and statistical arbitrage with signals in multiple automated market
makers. In 2023 IEEE 43rd International Conference on Distributed Computing Systems Workshops (ICDCSW), pages
37–42. IEEE.
Cartea, Á., Drissi, F., and Monga, M. (2024a). Decentralized finance and automated market making: Predictable loss and
optimal liquidity provision. SIAM Journal on Financial Mathematics, 15(3):931–959.
Cartea, Á., Drissi, F., Sánchez-Betancourt, L., Siska, D., and Szpruch, L. (2023c). Automated market makers designs beyond
constant functions. Available at SSRN 4459177.
Cartea, Á., Drissi, F., Sánchez-Betancourt, L., Siska, D., and Szpruch, L. (2024b). Strategic bonding curves in automated
market makers. Available at SSRN 5018420.
Chiu, J. and Koeppl, T. V. (2019). Blockchain-based settlement for asset trading. The Review of Financial Studies, 32(5):1716–
1753.
El Euch, O., Mastrolia, T., Rosenbaum, M., and Touzi, N. (2021). Optimal make–take fees for market making regulation.
Mathematical Finance, 31(1):109–148.
Fukasawa, M., Maire, B., and Wunsch, M. (2023). Model-free hedging of impermanent loss in geometric mean market makers.
arXiv preprint arXiv:2303.11118.
Fukasawa, M., Maire, B., and Wunsch, M. (2025). Liquidity provision of utility indifference type in decentralized exchanges.
arXiv preprint.
Lipton, A. and Treccani, A. (2021). Blockchain and distributed ledgers: Mathematics, technology, and economics. World
Scientific.
Loesch, S., Hindman, N., Richardson, M. B., and Welch, N. (2021). Impermanent loss in uniswap v3. arXiv preprint
arXiv:2111.09192.
Milionis, J., Moallemi, C. C., and Roughgarden, T. (2023). Automated market making and arbitrage profits in the presence of
fees. arXiv preprint arXiv:2305.14604.
Milionis, J., Moallemi, C. C., Roughgarden, T., and Zhang, A. L. (2022). Automated market making and loss-versus-rebalancing.
arXiv preprint arXiv:2208.06046.
Neveu, J. (1972). Martingales à temps discret. Masson.
Pham, H. (2009). Continuous-time Stochastic Control and Optimization with Financial Applications. Springer.
Stoikov, S. and Sağlam, M. (2009). Option market making under inventory risk. Review of Derivatives Research, 12:55–79.
22Appendix A. Proof of Theorem 1 and 2
Appendix A.1 Lemmas
For any stopping time τ valued in [0,T], we define
J(τ,ν) := Eν
τ

−exp

−γ R + Qν
τ,T
 
,
where ν is in Aτ,T (the restriction of A on time horizon [τ,T]) and Q is the running wealth
Qν
s,t = −
Z t
s

aν2
u9 du + η
Z t
s
(Su9 + Zu9)dBν
u
+ σ
Z t
s
Yu9 dWu +
X
i∈{+,−}
Z t
s

δi
ξ

Su −
Zu9 Yu9
Yu9 + δi ξ

dNi
u .
Recall that the value function V is defined as
Vτ = esssup
ν∈Aτ,T
J(τ,ν).
Lemma 1. Let τ be a stopping time valued in [t,T]. Then
Vt = esssup
ν∈At,τ
Eν
t

exp{−γ Qν
t,τ}Vτ

,
Proof. By tower property and the definition of the value function Vt, we have that
Vt = esssup
ν∈At,τ
Eν
t

exp

−γ Qν
t,τ Eν
τ

−exp

−γ R + Qν
τ,T
 
≤ esssup
ν∈At,τ
Eν
t

exp

−γ Qν
t,τ Vτ

.
For the other direction, by Proposition VI-1-1 in Neveu (1972), there exists (ν̃k
)k∈N ⊂ Aτ,T such that
J(τ,ν̃k
) ↑ Vτ. By defining νk
s = νs 1t≤s<τ + ν̃k
1τ≤s≤T , we obtain
Kνk
T
Kνk
τ
=
Kν̃k
T
Kν̃k
τ
and Qνk
τ,T = Qν̃k
τ,T .
Thus, it follows that
Eνk
τ
h
−exp
n
−γ

R + Qνk
τ,T
oi
= Eτ
"
−
Kνk
T
Kνk
τ
exp
n
−γ

R + Qνk
τ,T
o
#
= Eτ
"
−
Kν̃k
T
Kν̃k
τ
exp
n
−γ

R + Qν̃k
τ,T
o
#
= J(τ,ν̃k
).
23We then obtain
J(t,νk
) = Et
"
−
Kνk
T
Kνk
τ
Kνk
τ
Kνk
t
exp
n
−γ Qνk
t,τ
o
exp
n
−γ

R + Qνk
τ,T
o
#
= Et
"
Kνk
τ
Kνk
t
exp
n
−γ Qνk
t,τ
o
Eτ
"
−
Kνk
T
Kνk
τ
exp
n
−γ

R + Qνk
τ,T
o
##
= Et

Kν
τ
Kν
t
exp

−γ Qν
t,τ Eνk
τ
h
−exp
n
−γ

R + Qνk
τ,T
oi
= Et

Kν
τ
Kν
t
exp

−γ Qν
t,τ J(τ,ν̃k
)

.
Note that Kν
T /Kν
τ has mean of unity and is independent of Fτ. Thus,
Et

Kν
τ
Kν
t
exp

−γ Qν
t,τ J(τ,ν̃k
)

= Et

Kν
τ
Kν
t
exp

−γ Qν
t,τ J(τ,ν̃k
)

Et

Kν
T
Kν
τ

= Et

Kν
T
Kν
t
exp

−γ Qν
t,τ J(τ,ν̃k
)

= Eν
t

exp

−γ Qν
t,τ J(τ,ν̃k
)

Due to Condition 1, the expression Eν
t

exp

−γ Qν
t,τ J(τ,ν̃1
)

is finite and we can use monotone convergence
theorem to obtain
lim
k↑∞
J(t,νk
) = Eν
t

exp

−γ Qν
t,τ lim
k→∞
J(τ,ν̃k
)

= Eν
t

exp

−γ Qν
t,τ Vτ

.
Thus, we obtain
Vt ≥ lim
k↑∞
J(t,νk
)
= Eν
t

exp

−γ Qν
t,τ Vτ

,
which concludes the proof.
Lemma 2. Let Γ ∈ F such that P(Γ) > 0. Then there exists ε > 0 such that
Pν
(Γ) > ε ∀ν ∈ A.
Proof. We will prove this by contradiction. Assume there exists νk

k∈N
a sequence in A such that
limn→∞ Pνn
(Γ) = 0. Thus,
0 = lim
n→∞
Eνn
[1Γ]
= lim
n→∞
E
h
Kνn
T 1Γ
i
.
Then we can take a subsequence (nk)k∈N ⊆ (n)n∈N such that limk→∞ Kνnk
T 1Γ = 0 P-almost surely. Because
Γ has P-positive probability, then P(limk→∞ Kνnk
T = 0) > 0, or equivalently,
P lim
k→∞
Z T
0
νnk
t
η
dBt −
1
2
Z T
0
(νnk
t )2
η2
dt = −∞
!
> 0,
⇔ P lim
k→∞
Z T
0
νnk
t
η
dBt = −∞
!
> 0. (A.1)
24However, by Ito isometry,
E


Z T
0
νnk
u
η
dBu
!2

 = E
"Z T
0
(νnk
u )2
η2
du
#
≤
T (ν∞)2
η2
,
because νnk
is bounded by ν∞ dP ⊗ dt a.e. given that νnk
t ∈ A. Thus, the collection of random variables nRT
0
ν
nk
u
η dBu
o
k∈N
is bounded in L2
(Ω,FT ,P). From Equation (A.1), we have
P

liminf
k→∞
Z T
0
νnk
t
η
dBt
2
= ∞

 > 0
⇒ E

liminf
k→∞
Z T
0
νnk
t
η
dBt
2

 = ∞.
However, by Fatou’s lemma,
∞ = E

liminf
k→∞
Z T
0
νnk
t
η
dBt
2


≤ liminf
k→∞
E


Z T
0
νnk
t
η
dBt
2


≤
T (ν∞)2
η2
,
which is a contradiction.
Lemma 3. For all t ∈ T, we have Vt < 0 P-almost surely.
Proof. Let Γ = {Vt = 0}. By Neveu (1972), there exists νk

k∈N
a sequence in At,T such that J(t,νk
) ↑ 0
on Γ. From monotone convergence theorem, E

1Γ J(t,νk
)

→ 0. Then, there is a subsequence k1,k2,···
such that
Kνkm
T exp
n
−γ

R + Qνkm
0,T
o
→ 0 P − a.s. on Γ.
This implies
Z T
0
νkm
u
η
dBu +
Z T
0
−γ η(Su9 + Zu9)dBu +
Z T
0
γ η νkm
u (Su9 + Zu9)
η
ds
−
Z T
0
γ σ Yu9 dWu −
X
i∈{+,−}
Z T
0
γ

δi
ξ

Su −
Zu9 Yu9
Yu9 + δi ξ

dNi
u → −∞
P-almost surely on Γ. However,
sup
t∈T
Yt ≤ Y0 + ξ (N̂−
T + N̂+
T ) + sup
t∈T
Bt , and sup
t∈T
Zt ≤ Z0 4N̂−
T +N̂+
t .
Moreover, given that νkm
is bounded and using the above inequalities, we conclude that the last four terms
in the above expression are finite a.s., therefore, it has to be the case that
Z T
0
νkm
u
η
dBu → −∞ P − a.s. on Γ.
25From Lemma 2, we should have P(Γ) = 0. Thus, we have Vt < 0 P-almost surely.
Appendix A.2 Contract representation
Proof of Theorem 1. By the DPP in Lemma 1, one can show that for any t ≥ s
Vs = sup
ν∈A
Eν
s

exp

−γ Qν
s,t Vt

.
Then, Uν
defined as
Uν
t = exp

−γ Qν
0,t Vt
is a Pν
-supermartingale. By Doob-Meyer decomposition, we can write Uν
as
dUν
t = dMν
t − dAν,c
t − dAν,d
t ,
where Mν
is a (F,Pν
)-martingale, Aν,c
is a continuous non-decreasing process, Aν,d
is a pure-jump non-
decreasing process, and Aν,c
0 = Aν,d
0 = 0. By Martingale Representation Theorem, there exists a F-predictable
process (Ãν,W
,Ãν,B
,Ãν,−
,Ãν,+
) such that
dMν
t = Ãν,W
t dWt + Ãν,B
t dBν
t +
X
i∈{+,−}
Ãν,i
t dÑi
t .
By Ito’s formula, we have that
dVt = Uν
t9 d exp

γ Qν
0,t

+ exp

γ Qν
0,t9 dUν
t
+
X
i∈{+,−}
(Uν
t − Uν
t9) exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t
+ d⟨Uν,c
,exp

γ Qν,c
0,· ⟩t
where Uν,c
and Qν,c
0,· are the continuous parts of Uν
and Qν
0,· respectively. As ⟨N̂i,Aν,d
⟩ = 0, we have
(Uν
t − Uν
t9) exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t = Ãν,i
t exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t .
We also calculate
d exp

γ Qν
0,t

= γ exp

γ Qν
0,t9

dQν,c
0,t +
γ2
2
exp

γ Qν
0,t9

d⟨Qν,c
0,· ⟩t
+
X
i∈{+,−}

exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t ,13
and finally,
d⟨Uν,c
,exp

γ Qν,c
0,· ⟩t = γ exp

γ Qν
0,t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt
=
γ Vt9
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt.
13Note that even though the jump processes included in Qν
0,· are N− and not N̂−, we have Qν
0,t = Qν
0,t9 and ∆−
t = 0 on the
event {N−
t = N−
t9 + 1,Yt9 ≤ ξ}.
26Thus, we are able to rewrite dVt as
dVt = γ Uν
t9 exp

γ Qν
0,t9

dQν,c
0,t +
γ2
Uν
t9
2
exp

γ Qν
0,9

d⟨Qν,c
0,· ⟩t
+
X
i∈{+,−}
Uν
t9

exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t
+ exp

γ Qν
0,t9 Ãν,W
t dWt + exp

γ Qν
0,t9 Ãν,B
t dBν
t +
X
i∈{+,−}
exp

γ Qν
0,t9 Ãν,i
t

dN̂i
t − λi
t dt

− exp

γ Qν
0,t9 dAν,c
t − exp

γ Qν
0,t9 dAν,d
t +
X
i∈{+,−}
Ãν,i
t exp

γ Qν
0,t − exp

γ Qν
0,t9

dN̂i
t
+
γ Vt9
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt,
= γ Vt9 dQν,c
0,t +
γ2
Vt9
2
d⟨Qν,c
0,· ⟩t
+
X
i∈{+,−}
Vt9 exp

γ ∆i
t − 1

dN̂i
t
+
Vt9 Ãν,W
t
Uν
t9
dWt +
Vt9 Ãν,B
t
Uν
t9
dBν
t +
X
i∈{+,−}
Vt9 Ãν,i
t
Uν
t9

dN̂i
t − λi
t dt

−
Vt9
Uν
t9
dAν,c
t −
Vt9
Uν
t9
dAν,d
t +
X
i∈{+,−}
Vt9 Ãν,i
t
Uν
t9
exp

γ ∆i
t − 1

dN̂i
t
+
γ Vt9
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt.
Let Pt = −1
γ log(−Vt). Then, by Ito’s formula
dPt = −
1
γ Vt9
dV c
t +
1
2γ V 2
t9
d⟨V c
⟩t −
1
γ
X
i∈{+,−}
log

Vt
Vt9

dN̂i
t −
1
γ ∆Aν,d
t
log

Vt
Vt9

dAν,d
t
= −
1
γ Vt9
dV c
t +
1
2γ V 2
t9
d⟨V c
⟩t −
1
γ
X
i∈{+,−}
log

1 +
∆i
Vt
Vt9

dN̂i
t −
1
γ ∆Aν,d
t
log

1 +
∆d
Vt
Vt9

dAν,d
t ,
with V c
is the continuous part of V and YT = R. We calculate
d⟨V c
⟩t
dt
=
Vt9 Ãν,W
t
Uν
t9
+ γ Vt9 σ Yt9
!2
+
Vt9 Ãν,B
t
Uν
t9
+ γ Vt9 η (St + Zt9)
!2
,
∆i
Vt = 1 +
Ãν,i
t
Uν
t9
!
Vt9 exp

γ ∆i
t − Vt9 ,
∆d
Vt = −
Vt9 ∆Aν,d
t
Uν
t9
,
dV c
t = γ Vt9 dQν,c
0,t +
γ2
Vt9
2
d⟨Qν,c
0,· ⟩t +
γ Vt9
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt
+
Vt9 Ãν,W
t
Uν
t9
dWt +
Vt9 Ãν,B
t
Uν
t9
dBν
t −
X
i∈{+,−}
λi
t Vt9 Ãν,i
t
Uν
t9
dt −
Vt9
Uν
t9
dAν,c
t .
27We may rewrite dPt as
dPt = −dQν,c
0,t −
γ
2
d⟨Qν,c
0,· ⟩t −
Ãν,W
t
γ Uν
t9
dWt −
Ãν,B
t
γ Uν
t9
dBν
t +
X
i∈{+,−}
λi
t Ãν,i
t
γ Uν
t9
dt +
1
γ Uν
t9
dAν,c
t
+
1
2γ

 Ãν,W
t
Uν
t9
+ γ σ Yt9
!2
+
Ãν,B
t
Uν
t9
+ γ η (St + Zt9)
!2

 dt
−
1
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

dt
−
1
γ
X
i∈{+,−}
(
log 1 +
Ãν,i
t
Uν
t9
!
+ γ ∆i
t
)
dN̂i
t
−
1
γ ∆Aν,d
t
log 1 −
∆Aν,d
t
Uν
t9
!
dAν,d
t
=
(
aν2
t9 +
1
2γ

 Ãν,W
t
Uν
t9
+ γ σ Yt9
!2
+
Ãν,B
t
Uν
t9
+ γ η (St + Zt9)
!2


−
γ
2

(σ Yt9)2
+ η2
(St + Zt9)2

+
X
i∈{+,−}
λi
t Ãν,i
t
γ Uν
t9
+
1
γ Uν
t9
dAν,c
t
dt
−
1
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

)
dt
−
1
γ
X
i∈{+,−}
(
log 1 +
Ãν,i
t
Uν
t9
!
+ γ ∆i
t
)
dN̂i
t
−
1
γ ∆Aν,d
t
log 1 −
∆Aν,d
t
Uν
t9
!
dAν,d
t
−
(
σ Yt9 +
Ãν,W
t
γ Uν
t9
)
dWt −
(
η (St9 + Zt9) +
Ãν,B
t
γ Uν
t9
)
dBν
t
=
(
aν2
t9 +
1
2γ

 Ãν,W
t
Uν
t9
+ γ σ Yt9
!2
+
Ãν,B
t
Uν
t9
+ γ η (St + Zt9)
!2


−
γ
2

(σ Yt9)2
+ η2
(St + Zt9)2

+
X
i∈{+,−}
λi
t Ãν,i
t
γ Uν
t9
+
1
γ Uν
t9
dAν,c
t
dt
−
1
Uν
t9

σ Yt9 Ãν,W
t + η (St9 + Zt9)Ãν B
t

− νt9 (St9 + Zt9) −
Ãν,B
t νt9
γ η Uν
t9
)
dt
−
1
γ
X
i∈{+,−}
(
log 1 +
Ãν,i
t
Uν
t9
!
+ γ ∆i
t
)
dN̂i
t
−
1
γ ∆Aν,d
t
log 1 −
∆Aν,d
t
Uν
t9
!
dAν,d
t
−
(
σ Yt9 +
Ãν,W
t
γ Uν
t9
)
dWt −
(
η (St9 + Zt9) +
Ãν,B
t
γ Uν
t9
)
dBt .
28Simplifying the above equations, we get
dPt =
(
aν2
t9 +
1
2γ

 Ãν,W
t
Uν
t9
!2
+
Ãν,B
t
Uν
t9
!2


+
X
i∈{+,−}
λi
t Ãν,i
t
γ Uν
t9
+
1
γ Uν
t9
dAν,c
t
dt
+ νt9 (St9 + Zt9) +
Ãν,B
t νt9
γ η Uν
t9
)
dt
−
1
γ
X
i∈{+,−}
(
log 1 +
Ãν,i
t
Uν
t9
!
+ γ ∆i
t
)
dN̂i
t
−
1
γ ∆Aν,d
t
log 1 −
∆Aν,d
t
Uν
t9
!
dAν,d
t
−
(
σ Yt9 +
Ãν,W
t
γ Uν
t9
)
dWt −
(
η (St9 + Zt9) +
Ãν,B
t
γ Uν
t9
)
dBt .
If we rewrite
Ai
t = −
1
γ
log 1 +
Ãν,i
t
Uν
t9
!
+ γ ∆i
t
!
AW
t = − σ Yt9 +
Ãν,W
t
γ Uν
t9
!
AB
t = − η (St9 + Zt9) +
Ãν,B
t
γ Uν
t9
!
where i ∈ {+,−}, we have
dPt =
(
aν2
t9 +
γ
2
h
AW
t + σ Yt9
2
+ AB
t + η (St9 + Zt9)
2
i
−
X
i∈{+,−}
λi
t (1 − e−γ(Ai
t+∆i
t)
)
γ
+
1
γ Uν
t9
dAν,c
t
dt
−
AB
t νt9
η
)
dt
+
X
i∈{+,−}
Ai
t dN̂i
t −
1
γ ∆Aν,d
t
log 1 −
∆Aν,d
t
Uν
t9
!
dAν,d
t
+ AW
t dWt + AB
t dBt .
Note that
Pu = R −
Z T
u
(
aν2
t9 +
γ
2
h
AW
t + σ Yt9
2
+ AB
t + η (St9 + Zt9)
2
i
−
X
i∈{+,−}
λi
t (1 − e−γ(Ai
t+∆i
t)
)
γ
+
1
γ Uν
t9
dAν,c
t
dt
−
AB
t νt9
η
)
dt
−
X
i∈{+,−}
Z T
u
Ai
t dN̂i
t −
Z T
u
AW
t dWt −
Z T
u
AB
t dBt +
Z T
u
dAd
t ,
29with dAd
t = 1
γ ∆Aν,d
t
log

1 −
∆Aν,d
t
Uν
t9

dAν,d
t , i.e.
Ad
t =
1
γ
X
s≤t
log 1 −
∆Aν,d
t
Uν
t9
!
.
This shows in particular that ∆at =
−∆Aν,d
t
Uν
t−
≥ 0 is independent from ν ∈ A.
Therefore, we have PT = R and
dPt = −
(
h̄(νt,At,Zt,Yt,St) −
1
γ Uν
t9
dAν,c
t
dt
)
dt +
X
i∈{+,−}
Ai
t dN̂i
t + AW
t dWt + AB
t dBt − dAd
t
with
h̄(ν,A,Z,Y,S) = h(ν,A) +
X
i∈{+,−}
λ̄i
(Z,Y,S)(1 − e−γ(Ai
+∆i
)
)
γ
−
γ
2
h
AW
+ σ Y
2
+ AB
+ η (S + Z)
2
i
.
We introduce the process I given by
It =
Z t
0
(
h̄(νs,As,Zs,Ys,Ss)ds −
1
γ Uν
s9
dAν,c
s
)
.
By the DPP, we have
0 = sup
ν∈A
Eν
[Uν
T ] − V0 = sup
ν∈A
Eν
[Uν
T − Mν
T ] = sup
ν∈A
Eν
"Z T
0

−dAν,c
t − dAν,d
t

#
= γ sup
ν∈A
Eν
"Z T
0
Uν
t−

dIt − h̄(νt,At,Zt,Yt,St)dt +
dat
γ
#
where dat =
−dAν,d
t
Uν
t−
≥ 0.
Moreover, by Lemma 3, we have
Uν
t = e−γQν
0,tVt ≤ −βtVt < 0,
where we write
βt = −e
−γ +η
R t
0
(Su+Zu9)dBu+
R t
0
|Su+Zu9|ν∞du+σ
R t
0
Yt9dWu+
P
i=a,b
R t
0
n
δi
ξ

Su− Zu9 Yu9
Yu9+δi ξ
o
dNi
u
!
.
Therefore we have
0 ≤ sup
ν∈A
Eν
"Z T
0
−βtVt

dIt − h̄(νt,At,Zt,Yt,St)dt +
dat
γ
#
≤ sup
ν∈A
Eν
"Z T
0
−βtVt

dIt − H̄ (At,Zt,Yt,St)dt +
dat
γ
#
.
30Let us denote by Θ the random variable
Θ =
Z T
0
−βtVt

dIt − H̄ (At,Zt,Yt,St)dt +
dat
γ

≤ 0.
We then have
0 ≤ sup
ν∈A
Eν
[Θ].
Let ε > 0. For all ν ∈ A, we have
Eν
[Θ] = Eν
[Θ1Θ≤−ε + Θ1Θ>ε] ≤ −εPν
(Θ ≤ −ε).
Therefore,
0 ≤ sup
ν∈A
−εPν
(Θ ≤ −ε),
which implies that
inf
ν∈A
Pν
(Θ ≤ −ε) = 0.
By Lemma 2, this implies that
P(Θ ≤ −ε) = 0.
This is true for all ε > 0, therefore we have that
Θ =
Z T
0
−βtVt

dIt − H̄ (At,Zt,Yt,St)dt +
dat
γ

= 0 a.s.
Since βV > 0, dIt − H̄ (At,Zt,Yt,St)dt ≥ 0, and dat ≥ 0, this finally implies that
dIt = H̄ (At,Zt,Yt,St)dt and dat = dAd
t = 0.
It remains to prove that A ∈ Λ, i.e.
sup
ν∈A
sup
t∈T
Eν
[exp{−γ′
Pt}] < ∞ for some γ′
> γ .
Condition 1 together with Hölder inequality guarantees that there exists r > 0 such that
sup
ν∈A
Eν

|Uν
T |r+1

< ∞.
Therefore, as Uν
is a negative Pν
−supermartingale, we get
sup
ν∈A
sup
t∈T
Eν

|Uν
t |r+1

= sup
ν∈A
Eν

|Uν
T |r+1

< ∞,
which leads to the result by using again Hölder inequality and the fact that e−γPt
= Uν
t eγQν
0,t.
Proof of Theorem 2. Let R = PP0,A
T , P̄t = PP0,A
t + Qν
0,t. Then
de−γ P̄t
= γ e−γ P̄t9
(
H(At) − h(νt,At)

dt − AW
t dWt − AB
t dBν
t +
X
i∈{+,−}
e−γ (∆i
t+Ai
t)
− 1
γ
dÑi
t
)
.
We observe that H(A) ≥ h(ν,A). As A ∈ Λ, the process (−e−γ P̄t
)t∈T is a Pν
-supermartingale. Thus,
Eν
h
−e−γ P̄T
i
≤ −e−γ P0
.
Equality applies if and only if H(At) = h(νt,At), dt ⊗ dP a.s., i.e. νt = ν̄(At).
31