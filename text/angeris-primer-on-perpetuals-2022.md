---
sha256: fbe2fac9dbc10be1a85bac34df6dbf795b30783e88bc38eeadcb9a667ef500f8
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 30829
---
arXiv:2209.03307v1 [q-fin.MF] 7 Sep 2022
A primer on perpetuals
Guillermo Angeris∗ Tarun Chitra† Alex Evans‡ Matthew Lorig§
This version: September 8, 2022
Abstract
We consider a continuous-time financial market with no arbitrage and no transactions costs. In this
setting, we introduce two types of perpetual contracts, one in which the payoff to the long side is a fixed
function of the underlyers and the long side pays a funding rate to the short side, the other in which the
payoff to the long side is a fixed function of the underlyers times a discount factor that changes over time
but no funding payments are required. Assuming asset prices are continuous and strictly positive, we
derive model-free expressions for the funding rate and discount rate of these perpetual contracts as well
as replication strategies for the short side. When asset prices can jump, we derive expressions for the
funding and discount rates, which are semi-robust in the sense that they do not depend on the dynamics
of the volatility process of the underlying risky assets, but do depend on the intensity of jumps under
the market’s pricing measure. When asset prices can jump and the volatility process is independent of
the underlying risky assets, we derive an explicit replication strategy for the short side of a perpetual
contract. Throughout the paper, we illustrate through examples how specific perpetual contracts relate
to traditional financial instruments such as variance swaps and leveraged exchange traded funds.
## 1 Introduction
A perpetual contract (often just perp, for short) is a type of financial contract that enables relatively general
payoffs. At a high level, a perp contract can be described as follows: two parties, which we will call the long
side and the short side, enter into an agreement. The short side agrees to pay the long side some payoff,
which is a function of the prices of the underlying assets, at a time of the long side’s choosing. In exchange
for this, the long side pays a continual cash-flow to the short side up until contract termination. This cash
flow can be implemented in two distinct ways. First, it can be implemented directly as a literal cash flow,
where the long side pays the short side cash at fixed time increments. Second, a sometimes more practical
approach is instead to replace the cash flow by discounting the payoff at contract termination.
Perps were first suggested in Shiller (1993) as a way of approximately measuring the prices of dividend-
yielding assets and also as a tool to hedge certain illiquid assets. But, only the special case where the payoff
∗Bain Capital Crypto. e-mail: gangeris@baincapital.com.
†Gauntlet Networks, Inc. e-mail: tarun@gauntlet.network.
‡Bain Capital Crypto. e-mail: aevans@baincapital.com.
§Department of Applied Mathematics, University of Washington. e-mail: mlorig@uw.edu.
1function was linear in the price of the underlying assets was considered. Perps with linear payoffs later
gained widespread popularity as a way of taking leveraged bets on cryptocurrency markets, where common
derivatives markets were initially relatively illiquid, if available at all. As of 2022, perps are some of the
most actively-traded cryptocurrency derivatives, with daily volume in the tens of billions of dollars (see,
e.g., CoinGecko (2022)).
While perpetual futures never gained traction outside of cryptocurrencies, they were introduced as a conve-
nient way for miners (who produce newly minted tokens or coins) to hedge inherent risks in cryptocurrency
production. The two main risks that miners of currencies such as Bitcoin and Ethereum face are that their
future income (which can be viewed as a dividend-yielding stream) is randomized with variance depending
on their resource contribution to the network (Lewenberg et al. (2015)). To reduce this variance, miners
used two tactics: mining pools (e.g. pooling together resources and distributing dividends pro-rata) and
futures contracts. Initially, miner perpetual futures contracts were over-the-counter quanto futures, where
miners took premiums in cash with strike prices struck denominated in Bitcoin. The failure of the early
quanto derivatives market led to the creation of stablecoins (dollar-pegged demand deposit assets) which
then naturally led to the creation of the crypto perpetuals market in 2016 (Alexander et al. (2020)).
Recently, perps with payoffs that are proportional to some power of the price of an asset have been proposed
(c.f., llllvvuu (2021); White et al. (2021)). This extension led to the creation of a decentralized perps proto-
col on the Ethereum blockchain called Squeeth (short for “Squared ETH”), see Opyn (2021). This protocol
allows users to take long (and short) positions on these power perps without requiring an intermediary such
as a broker or exchange.
The role of this paper is to clearly define perps, show a number of natural generalizations to those known
in the literature, and correct some of the misinformation that exists online as to how the rate of cash-flow
should be computed in a no-arbitrage setting. The rest of the paper proceeds as follows: in Section 2 we
introduce a financial market in which risky assets have continuous price paths. Next, in Section 3, we define
a perpetual contract in which the long side must pay a funding rate to the short side. We derive a model-free
expression for the funding rate as well as a replication strategy for the short side. In Section 4 we define a
second type of perpetual contract in which no funding payments are required but the payoff is discounted
over time. We derive a model-free expression for the discount rate as well as a replication strategy for the
short side. Lastly, in Section 5, we consider a market with a single risky asset whose value may jump. In
this setting, we derive expressions for the funding and discount rates of the two types of perpetual contracts
introduced in Sections 3 and 4. And, under the assumption of an independent volatility process, we derive
a replication strategy for the short side of a perpetual contract.
## 2 Market model and assumptions
In Sections 2, 3, and 4, we consider a continuous-time financial market, defined on a filtered probability space
(Ω,F,F,P), with no arbitrage and no transaction costs. The filtration F = (Ft)t≥0 represents the history of
the market and P represents the real-world probability measure. We suppose that the market contains a risk-
2free money market account, whose value in dollarsis denoted by M = (Mt)t≥0, as well as n ∈ N risky assets
(typically, tokens or cryptocurrencies), whose values in dollars are denoted by S = (S
(1)
t ,S
(2)
t ,...,S
(n)
t )t≥0.
We assume the value of the money market account M is continuous, strictly positive and non-decreasing. As
such, there exists a non-negative F-measurable process r = (rt)t≥0, known as the risk-free rate, such that
dMt = rtMtdt, M0 ≥ 0.
We further assume that the prices of the risky assets are continuous and strictly positive. As such, there
exists an Rn-valued F-measurable drift vector μ = (μ
(1)
t ,μ
(2)
t ,...,μ
(n)
t ) and an Rn×d
+ -valued F-measurable
volatility matrix σ = (σ
(1,1)
t ,σ
(1,2)
t ,...,σ
(n,d)
t ) with d ∈ N, such that, for every i, the value S(i) of the ith
risky asset is given by
dS
(i)
t = μ
(i)
t S
(i)
t dt +
d X
j=1
σ
(i,j)
t S
(i)
t dW
(j)
t , S
(i)
0 ≥ 0,
where W = (W
(1)
t ,W
(2)
t ,...,W
(d)
t ) is a d-dimensional (F,P)-Brownian motion with independent compo-
nents. Lastly, throughout this paper, in order to avoid unnecessary complications, we assume all local
martingales are true martingales.
## 3 Perpetual contracts with funding
We will discuss two types of perpetual contracts in this paper: (i) perpetual contracts with funding and (ii)
perpetual contrast with discounting. In this section, we focus on the former. We begin with a definition.
Definition 1. A perpetual contract with funding (or simply, a perp) written on S with payoff function
ϕ : Rn → R is a agreement between two parties, referred to as the long side and short side. The long
side has the right to terminate the contract at any time t ≥ 0, at which point it will receive a payment of
ϕ(St). In return, the long-side must pay to the short side ϕ(S0) at the time t = 0 of inception as well as a
continuous F-adapted cash-flow of F = (Ft)t≥0 per unit time, referred to as the funding rate, up until the
contract is terminated.
The following theorem gives an expression for the funding rate.
Theorem 2. Consider a perpetual contract as described in Definition 1. Suppose that the function
ϕ ∈ C2(Rd,R). Under the assumptions of Section 2, the funding rate F is given by
Ft =
1
2
n X
i=1
n X
j=1
(σtσ⊤
t )(i,j)
S
(i)
t S
(j)
t ∂i∂j ϕ(St) –

ϕ(St) –
n X
i=1
S
(i)
t ∂iϕ(St)

rt. (1)
where (σtσ⊤
t )(i,j) denotes the of (i,j)-th component of σtσ⊤
t and ∂j := ∂
∂sj
.
Proof. We will show that, with Ft given by (1), the short side can create a self-financing portfolio whose
value X = (Xt)t≥0 satisfies
Xt = ϕ(St), (2)
3for all t ≥ 0. To begin, we note that the value of the short side’s portfolio must be of the form
dXt =
n X
i=1
Δ
(i)
t dSi
t +

Xt –
n X
i=1
Δ
(i)
t S
(i)
t
 1
Mt
dMt + Ftdt
=
n X
i=1
Δ
(i)
t dSi
t +

Xt –
n X
i=1
Δ
(i)
t S
(i)
t

rtdt + Ftdt, (3)
where Δ
(i)
t denotes the number of shares of invested in asset i at time t. Next, we have by Itô’s Lemma that
dϕ(St) =
n X
i=1
∂iϕ(St)dS
(i)
t +
1
2
n X
i=1
n X
j=1
∂i∂j ϕ(St)dhS(i)
,S(i)
it
=
n X
i=1
∂iϕ(St)dS
(i)
t +
1
2
n X
i=1
n X
j=1
(σtσ⊤
t )(i,j)
S
(i)
t S
(j)
t ∂i∂j ϕ(St)dt. (4)
Now, note that (2) holds for all t ≥ 0 if and only if X0 = ϕ(S0) and dXt = dϕ(St). Comparing (3) with (4),
we see that the dS
(i)
t terms will be equal if we set
Δ
(i)
t = ∂iϕ(St).
Next, using Xt = ϕ(St) and Δ
(i)
t = ∂iϕ(St), we see that the dt terms in (3) and (4) will be equal if Ft is
given by (1).
Remark 3. Note that the funding rate can be positive or negative. If at time t the funding rate is negative,
then short side pays the long side at a rate of –Ft.
Remark 4. Observe that precise knowledge of r, μ and σ is not needed to determine the funding rate Ft.
Indeed, using
rt =
d
dt
logMt, (σtσ⊤
t )(i,j)
=
d
dt
hlogS(i)
,logS(j)
it,
we can express F in the following model-free form
Ftdt =
1
2
n X
i=1
n X
j=1
S(i)
S(j)
∂i∂j ϕ(St)dhlogS(i)
,logS(j)
it –

ϕ(St) –
n X
i=1
S
(i)
t ∂iϕ(St)

dlogMt. (5)
By contrast, in order to price and replicate most traditional financial derivatives such as European, American,
Bermudan and Barrier options, one requires a parametric model for the underlying S as well as knowledge
of unobservable model parameters.
Example 5. A (continuously monitored) variance swap (VS), written on an asset S ≡ S(1) is an agreement
between two parties, referred to as the long and short sides. At the maturity date T, the short side pays
the long side
Z T
0
dhlogSit – K,
4where the swap rate K is determined at inception t = 0 so that the initial cost to enter the swap is zero.
Under the assumptions of Section 2, the swap rate K is given by –2e Elog(ST/S0), where e E denotes expectation
under the market’s chosen pricing measure e P, which can be deduced by observing implied volatilities of T-
maturity European calls and puts (see, e.g., Carr and Madan (2001)). Because implied volatilities tend to
be higher than realized volatility (this is sometimes known as the volatility premium) taking the long side
of a VS is typically a losing trade. As an alternative to entering the long side of a VS, an investor wishing
to gain exposure to volatility could take a long position in a perp as described in Definition 1 with payoff
ϕ(St) = 2log(St/S0). Like a VS, there is no cost to entering this perp because ϕ(S0) = 2log(S0/S0) = 0.
Moreover, assuming r ≡ 0 for simplicity, we have from (5) that the funding rate is
Ftdt = –dhlogSit.
Therefore, if the long side chooses to terminate the contract at time T, the value of the payoff minus funding
paid is
ϕ(ST) –
Z T
0
Ft dt = 2log
ST
S0

+
Z T
0
dhlogSit.
Thus, by taking a long position in a perp, the investor can achieve the same exposure to volatility that they
would have had they taken the long side of a VS, without paying a volatility premium.
## 4 Perpetual contracts with discounting
One of the problems with a perp with funding is that execution of the contract requires the long side to
place a deposit (e.g., on an exchange or into a smart contract) at inception in order to pay the funding rate.
If the time-integral of the funding rate ever exceeds the deposit, the contract is automatically terminated.
One way to avoid automatic termination of the contract is to consider, instead, a perpetual contract with
discounting, whose mechanics are described in the following definition.
Definition 6. An perpetual contract with discounting (or simply, a perp) written on S with payoff function
ϕ : Rn → R is a agreement between two parties, referred to as the long side and short side. The long
side has the right to terminate the contract at any time t ≥ 0, at which point it will receive a payment of
e
–
Rt
0
Dsds
ϕ(St), where D = (Dt)t≥0 is an F-adapted process known as the discount rate. In return, at the
time of inception t = 0, the long side must pay to the short side a premium ϕ(S0).
The following theorem gives an expression for the discount rate.
Theorem 7. Consider a perpetual contract with discounting as described in Definition 6. Suppose
that the function ϕ ∈ C2(Rd,R) and is either strictly positive or strictly negative. Then, under the
assumptions of Section 2, the discount rate D is given by
Dt =
Ft
ϕ(St)
, (6)
where Ft is given by (1).
5Proof. We will show that, with Dt given by (6), the short side can create a self-financing portfolio whose
value X = (Xt)t≥0 satisfies
Xt = exp(–
Z t
0
Dsds)ϕ(St), (7)
for all t ≥ 0. To begin, we note that the dynamics of the short side’s portfolio X must be of the form
dXt =
n X
i=1
Δ
(i)
t dSi
t +

Xt –
n X
i=1
Δ
(i)
t S
(i)
t
 1
Mt
dMt
=
n X
i=1
Δ
(i)
t dSi
t +

Xt –
n X
i=1
Δ
(i)
t S
(i)
t

rtdt, (8)
where Δ
(i)
t denotes the number of shares of invested in asset i at time t. Next, we have by Itô’s Lemma that
d

e
–
R t
0
Dsds
ϕ(St)

= e
–
Rt
0
Dsds
 n X
i=1
∂iϕ(St)dS
(i)
t +
1
2
n X
i=1
n X
j=1
∂i∂j ϕ(St)dhS(i)
,S(i)
it

– Dte
–
Rt
0
Dsds
ϕ(St)dt
= e
–
Rt
0
Dsds
 n X
i=1
∂iϕ(St)dS
(i)
t +
1
2
n X
i=1
n X
j=1
(σtσ⊤
t )(i,j)
S
(i)
t S
(j)
t ∂i∂j ϕ(St)dt

– Dte
–
Rt
0
Dsds
ϕ(St)dt. (9)
Now, note that (7) will hold for all t ≥ 0 if and only if X0 = ϕ(S0) and dXt = d(e
–
R t
0
Dsds
ϕ(St)). Comparing
(8) with (9), we see that the dS
(i)
t terms will be equal if we set
Δ
(i)
t = e
–
Rt
0
Dsds
∂iϕ(St).
Next, using Xt = exp(–
Rt
0 Dsds)ϕ(St) and Δ
(i)
t = exp(–
Rt
0 Dsds)∂iϕ(St), we see that the dt terms in (8)
and (9) will be equal if Dt is given by (6).
Example 8. Let L = (Lt)t≥0 be the value of a leveraged exchange traded fund (LETF) with underlyer
S ≡ S(1) and leverage ratio γ. The manager of such an LETF seeks to multiply the returns of S by a factor
of γ by holding γLt/St shares of the underlyer for all t ≥ 0 and borrowing from the bank to finance the
position (see, e.g., Leung and Santoli (2016)). Thus, the dynamics of L are as follows
dLt = ΔtdSt + (Xt – ΔtSt)
1
Mt
dMt, Δt = γLt/St.
Solving for Lt one obtains the following expression
Lt = L0
St
S0
γMt
M0
(1–γ)
exp
γ(1 – γ)
2
hlogSit

.
Now, consider a perp as described in Definition 6 with payoff ϕ(St) = L0(St/S0)γ. We have from (5) and
(6) that
Dtdt =
γ(γ – 1)
2
dhlogSit – (1 – γ)dlogMt.
6If the long side terminates the perp at time t it will receive
ϕ(St)e
–
Rt
0
Dsds
= L0
St
S0
γ
exp

–
γ(γ – 1)
2
Z t
0
dhlogSis + (1 – γ)
Z t
0
dlogMs

= L0
St
S0
γMt
M0
(1–γ)
exp
γ(1 – γ)
2
hlogSit

.
Thus, an LETF written on S with leverage ratio γ can be viewed as a special case of a perp with payoff
function ϕ(St) = L0(St/S0)γ. Such perps trade widely on the Ethereum blockchain. Indeed, Squared ETH
or Squeeth, which trades on the Decentralized Finance (DeFi) protocol Opyn, is simply a perp with payoff
function ϕ(St) = S2
t , where St is the value on dollars of Ethereum.
Example 9. If, at time t = 0, one deposits two tokens into a geometric mean constant function market
maker (CFMM), then, ignoring fees collected by the CFMM, the value V = (Vt)t≥0 of this deposit at time
t ≥ 0 is
Vt =
pV0
S
(1)
0
S
(1)
t +
qV0
S
(2)
0
S
(2)
t
 (S
(1)
t /S
(1)
0 )p(S
(2)
t /S
(2)
0 )q
p(S
(1)
t /S
(1)
0 ) + q(S
(2)
t /S
(2)
0 )
= V0
S
(1)
t
S
(1)
0
pS
(2)
t
S
(2)
0
q
,
where p and q are constants satisfying p,q > 0 and p + q = 1 (c.f., Angeris and Chitra (2020); Evans
(2020)).
Now, consider a perp as described in Definition 6 with payoff
ϕ(St) = V0
S
(1)
t
S
(1)
0
pS
(2)
t
S
(2)
0
q
. (10)
We have from (5) and (6) that
Dtdt =
p(p – 1)
2
dhlogS(1)
it +
q(q – 1)
2
dhlogS(2)
it + pqdhlogS(1)
,logS(2)
it.
If the perp is terminated at time t the value of the payoff to the long side is
ϕ(St)e
–
Rt
0
Dsds
= V0
S
(1)
t
S
(1)
0
pS
(2)
t
S
(2)
0
q
× exp
p(1 – p)
2
hlogS(1)
it +
q(1 – q)
2
hlogS(2)
it – pqhlogS(1)
,logS(2)
it

.
One can show that the term in the exponent is positive along every path of (S(1),S(2)). 1 Thus, ignoring
fees, rather than deposit tokens into a CFMM it would always be better to take a long position in a perp
with payoff (10).
1This follows from p(1 – p)dx2 + q(1 – q)dy2 – 2pqdxdy = pqdx2 + pqdy2 – 2pqdxdy = (pdx – qdy)2 ≥ 0.
75 Extension to models with jumps
In this section, we derive funding and discount rates for perpetual contracts as well as replication strategies
for the short side when asset prices are allowed to jump. For simplicity, we will assume the risk-free rate of
interest is zero (rt = 0) and we will consider perpetuals written on a single risky asset S. The extension to
non-zero interest rates and multiple assets it straightforward, but tedious.
Fix a filtered probability space (Ω,F,F, e P) where the filtration F represents the history of the market and
e P denotes the market’s chosen pricing measure. We suppose that the dynamics of the risky asset S are of
the form
dSt = σt–St–df Wt +
Z
St–(eγt–(z)
– 1)e N(dt,dz), (11)
where σ = (σt)t≥0 and γ(z) = (γt(z))t≥0 for every z ∈ R are scalar F-adapted processes, f W = (f Wt)t≥0
is a scalar (e P,F)-Brownian motion and e N(dt,dz) = N(dt,dz) – ν(dz)dt is a compensated Poisson random
measure on R. Observe that S is a (e P,F)-martingale, as it must be in the absence of arbitrage. The following
theorem gives the funding rate F and discount rate D for the perpetual contracts described in Definitions 1
and 6, respectively, when the dynamics of the underlying S are given by (11).
Theorem 10. Suppose the dynamics of a single underlying risky asset are of the form (11) and the
payoff function ϕ of a perpetual satisfies ϕ ∈ C2(R,R) and ϕ 6= 0. Then, the funding rate F of the
perpetual contract described in Definition 1 is given by
Ft =
1
2
σ2
t S2
t ϕ′′
(St) +
Z 
ϕ(Steγt(z)
) – ϕ(St) – St(eγt(z)
– 1)ϕ′
(St)

ν(dz). (12)
and the discount rate D of a perpetual contract described in Definition 6 is given by Dt = Ft/ϕ(St).
Proof. Consider first a perpetual contract with funding, as described in Definition 1. The infinitesimal
change in value of the long side is
dϕ(St) – Ftdt = Atϕ(St)dt + σtStϕ′
(St)df Wt +
Z 
ϕ(St–eγt–(z)
) – ϕ(St–)

e N(dt,dz) – Ftdt, (13)
Atϕ(St) :=
1
2
σ2
t S2
t ϕ′′
(St) +
Z 
ϕ(Steγt(z)
) – ϕ(St) – St(eγt(z)
– 1)ϕ′
(St)

ν(dz).
In the absence of arbitrage, the value of the long-side must be a (e P,F)-martingale. As such, the sum of the
dt terms in (13) must be zero, which leads to the expression (12) for F. Next, consider a perpetual contract
with discounting, as described in Definition 6. The infinitesimal change in value of the long side is given by
d

e
–
Rt
0
Dsds
ϕ(St)

= –Dte
–
Rt
0
Dsds
ϕ(St)dt + e
–
Rt
0
Dsds
dϕ(St)
= –Dte
–
Rt
0
Dsds
ϕ(St)dt + e
–
Rt
0
Dsds
Atϕ(St)dt + e
–
R t
0
Dsds
σtStϕ′′
(St)df Wt
+ e
–
Rt
0
Dsds
Z 
ϕ(St–eγt–(z)
) – ϕ(St–)

e N(dt,dz). (14)
Once again, in the absence of arbitrage, the value of the long side must be a (e P,F)-martingale. As such, the
sum of the dt terms in (14) must be zero, which leads to Dt = Ft/ϕ(St), where F is given by (12).
8Remark 11. Note that, unlike the proofs of Theorems 2 and 7, which provide expressions for the funding
rate F and discount rate D of the perpetual contracts described in Definitions 1 and 6 as well as replication
strategies for the short-side, the proof of Theorem 10 provides only the funding and discount rates for
perpetual contracts but says nothing about a replication strategy for the short-side. In order to derive a
replication strategy for the short side when the underlying asset S can jump, we will need to make some
additional assumptions.
Henceforth, assume that the dynamics of the risky asset S are of the form
dSt = σt–St–df Wt +
Z
St–(ez
– 1)e N(dt,dz), (15)
where the Lévy measure ν associated with e N is a Dirac comb
ν(dz) =
n X
j=1
λj δzj (z)dz, (16)
and the volatility process σ evolves independently of the Brownian motion f W and the Poisson random
measure e N that appear in (15)
σ ⊥ ⊥ f W, σ ⊥ ⊥ e N. (17)
Assume further that one can trade call and put options with any strike at a fixed maturity T. This is
equivalent to assuming one can trade any T-maturity European option whose payoff can be written as the
difference of convex functions, as these payoffs can be synthesized from call and put payoffs.
Theorem 12. Suppose the dynamics of S satisfy (15), (16) and (17) and consider a perpetual contract
as described in Definition 1. From Theorem 10 the funding rate F is given by
Ft =
1
2
σ2
t S2
t ϕ′′
(St) +
Z 
ϕ(Stez
) – ϕ(St) – St(ez
– 1)ϕ′
(St)

ν(dz). (18)
Let P(p) = (P
(p)
t )0≤t≤T denote the value of a European power contract, which pays Sp
T at time T where
p ∈ R. Fix (p1,p2,...,pn) ∈ Rn such that the (n + 1) × (n + 1) stochastic matrix H = (Ht)0≤t≤T with
entries given by
H
(j,i)
t– = eψ(p̄i)(T–t)
P
(pi)
t– S
p̄i
t–(epizj – 1) – eψ(pi)(T–t)
P
(p̄i)
t– S
pi
t–(ep̄izj – 1), j,i ≤ n,
H
(j,n+1)
t– = St–(ezj – 1), j ≤ n,
H
(n+1,i)
t– = σt–

pieψ(p̄i)(T–t)
P
(pi)
t– Sp̄i
t– – p̄ieψ(pi)(T–t)
P
(p̄i)
t– Spi
t–

, i ≤ n,
H
(n+1,n+1)
t– = σt–St–.

       
       
(19)
is invertible for all t ∈ [0,T], where p̄i := 1 – pi for all i and the function ψ is defined as follows
ψ(p) =
Z 
(epz
– 1) – p(ez
– 1)

ν(dz).
9Let X = (Xt)0≤t≤T be a the value of self-financing portfolio with dynamics of the form
dXt = Δt–dSt +
n X
i=1
Γ
(pi)
t– dY
(pi)
t + Ft–dt, X0 = ϕ(S0), (20)
dY
(pi)
t = eψ(p̄i)(T–t)
Sp̄i
t–dP
(pi)
t – eψ(pi)(T–t)
Spi
t–dP
(p̄i)
t , (21)
where Δ and Γ(p1),...,Γ(pn) are given by







Γ
(p1)
t–
. . .
Γ
(pn)
t–
Δt–







= H–1
t–







ϕ(St–epz1) – ϕ(St–)
. . .
ϕ(St–epzn ) – ϕ(St–)
σt–St–ϕ′(St–)







. (22)
Then the portfolio X replicates the perpetual payoff. That is, the following holds
Xt = ϕ(St), (23)
for all 0 ≤ t ≤ T.
Proof. We begin by computing the dynamics of ϕ(S). Using (15) and Itô’s Lemma we have
dϕ(St) = 1
2σ2
t–S2
t–ϕ′′
(St–)dt + σt–St–ϕ′
(St–)df Wt
+
Z 
ϕ(St–ez
) – ϕ(St–) – St–(ez
– 1)ϕ′
(St–)

ν(ds)dt
+
Z 
ϕ(St–ez
) – ϕ(St–)

e N(dt,dz). (24)
Next, it will be helpful to introduce Z = logS. We will separate Z into a continuous component Zc and a
jump component Zj . Using Itô’s Lemma, we have
dZt = dZc
t + dZ
j
t, dZc
t = –1
2σ2
t–dt + σ–tdf Wt, dZ
j
t = –
Z
(ez
– 1 – z)ν(dz)dt +
Z
z e N(dt,dz).
Note that Zc
T – Zc
t is normally distributed conditional on the path of σ and that Zj is a Lévy process with
characteristic exponent ψ(i·). Thus, conditioning on the path of σ and using the Lévy-Kintchine formula,
we have
e Etep(Zc
T–Zc
t )
= e Ete
1
2(p2–p)(hZciT–hZcit)
, hZc
iT – hZc
it =
Z T
t
σ2
sds, e Etep(Zj
T
–Zj
t )
= e(T–t)ψ(p)
, (25)
where we have introduced the short-hand notation e Et · := e E(·|Ft). Now, using (25) as well as Zc ⊥ ⊥ Zj , we
find that the value of a European power option satisfies
P
(p)
t = e EtS
p
T = epZt e Etep(Zc
T–Zc
t )e Etep(Zj
T–Zj
t )
= S
p
t eψ(p)(T–t)e Ete
1
2(p2–p)(hZciT–hZcit)
.
Next, observe that
de Ete
1
2(p2–p)(hZc
iT–hZc
it)
= (...)dt + de M
(p)
t ,
10where e M
(p)
is a (e P,F)-martingale, which is independent of f W and e N. Thus, using the fact that P(p) is a
(e P,F)-martingale, and thus dP
(p)
t has no dt terms, we have
dP
(p)
t = eψ(p)(T–t)e Et–e
1
2(p2–p)(hZciT–hZcit)
dS
p
t + S
p
t–eψ(p)(T–t)
de Ete
1
2(p2–p)(hZciT–hZcit)
+ Sp
t–
e Ete
1
2(p2–p)(hZc
iT–hZc
it)
deψ(p)(T–t)
= eψ(p)(T–t)e Et–e
1
2(p2–p)(hZciT–hZcit)

pσt–S
p
t–df Wt +
Z
S
p
t–(epz
– 1)e N(dt,dz)

+ Sp
t–eψ(p)(T–t)
de M
(p)
= pσt–P
(p)
t– df Wt +
Z
P
(p)
t– (epz
– 1)e N(dt,dz) + eψ(p)(T–t)
Sp
t–de M
(p)
t . (26)
Now, defining p̄ := 1 – p and noting that p2 – p = p̄2 – p̄, we have e M
(p)
= e M
(p̄)
. Therefore, we have from
(26) that
dP
(p̄)
t = p̄σt–P
(p̄)
t– df Wt +
Z
P
(p̄)
t– (ep̄z
– 1)e N(dt,dz) + eψ(p̄)(T–t)
S
p̄
t–de M
(p)
t . (27)
Thus, using (26) and (27), the process Y(p), defined in (21), is a self-financing portfolio that satisfies
dY
(p)
t = eψ(p̄)(T–t)
S
p̄
t–

pσt–P
(p)
t– df Wt +
Z
P
(p)
t– (epz
– 1)e N(dt,dz)

– eψ(p)(T–t)
Sp
t–

p̄σt–P
(p̄)
t– df Wt +
Z
P
(p̄)
t– (ep̄z
– 1)e N(dt,dz)

. (28)
Now, we wish to create a self-financing portfolio whose value X satisfies (23). As there are at least (n + 1)
sources of uncertainty (due to the Brownian motion f W and the n possible jump sizes ΔZj
t ∈ {z1,z2,...,zn})
the portfolio will need at least (n +1) hedging assets; we will use the underlying S as well as “shares” of Y(pi)
for i ∈ {1,2,...,n}. Thus, the dynamics of X are of the form (20), where, for the moment, the processes Δ
and Γ(p1),...,Γ(pn) are unknown. Using (15), (20) and (28), we have
dXt = Δt–σt–St–df Wt +
n X
i=1
Γ
(pi)
t– σt–

pieψ(p̄i)(T–t)
P
(pi)
t– S
p̄i
t– – p̄ieψ(pi)(T–t)
P
(p̄i)
t– S
pi
t–

df Wt
+
Z
Δt–St–(ez
– 1)e N(dt,dz)+
+
Z n X
i=1
Γ
(pi)
t–

eψ(p̄i)(T–t)
P
(pi)
t– S
p̄i
t–(epiz
– 1) – eψ(pi)(T–t)
P
(p̄i)
t– S
pi
t–(ep̄iz
– 1)

e N(dt,dz) + Ft–dt.(29)
Equation (23) will be satisfied if and only if the dt, df Wt and e N(dt,dz) terms in (24) and (29) are equal. As
such, the funding rate F must be given by (18) and the processes Δ and Γ(p1),...,Γ(pn) must satisfy
σt–St–ϕ′
(St–) = Δt–σt–St– +
n X
i=1
Γ
(pi)
t– σt–

pieψ(p̄i)(T–t)
P
(pi)
t– S
p̄i
t– – p̄ieψ(pi)(T–t)
P
(p̄i)
t– S
pi
t–

ϕ(St–ezj ) – ϕ(St–) = Δt–St–(ezj – 1)
+
n X
i=1
Γ
(pi)
t–

eψ(p̄i)(T–t)
P
(pi)
t– S
p̄i
t–(epizj – 1) – eψ(pi)(T–t)
P
(p̄i)
t– S
pi
t–(ep̄izj – 1)

,
11where the last equation must hold for all zj ∈ {z1,z2,...,zn}. In matrix form, we have







ϕ(St–ez1) – ϕ(St–)
. . .
ϕ(St–ezn ) – ϕ(St–)
σt–St–ϕ′(St–)







= Ht–







Γ
(p1)
t–
. . .
Γ
(pn)
t–
Δt–







,
where the entries of H are given by (19). Using the fact that H is invertible, we find that (23) will hold if Δ
and Γ(p1),...,Γ(pn) are given by (22).
Remark 13. The replication strategy described in Theorem 12 works only up until the maturity date T
of the European power contracts. However, at time T one can continue the replication strategy by trading
European power contracts with a maturity date T > T.
Remark 14. Note that St–, P
(pi)
t– for all i and σt– = d
dt hZcit are observable. Thus, no assumptions about
the dynamics of the volatility process σ are needed for the replication strategy to work. We do, however,
require knowledge of the possible jump-sizes {z1,z2,...,zn} and jump intensities under the pricing measure
{λ1,λ2,...,λn} as these appear in ν and ψ.
References
C. Alexander, J. Choi, H. Park, and S. Sohn. Bitmex bitcoin derivatives: Price discovery, informational
efficiency, and hedging effectiveness. Journal of Futures Markets, 40(1):23–43, 2020.
G. Angeris and T. Chitra. Improved price oracles: Constant function market makers. In Proceedings of the
2nd ACM Conference on Advances in Financial Technologies, AFT ’20, page 80–91, New York, NY,
USA, 2020. Association for Computing Machinery. ISBN 9781450381390.
P. Carr and D. Madan. Towards a theory of volatility trading. Option Pricing, Interest Rates and Risk
Management, Handbooks in Mathematical Finance, 22(7):458–476, 2001.
CoinGecko. Cryptocurrency derivatives (perpetual contract) by volume, 2022. URL
https://urldefense.com/v3/__https://www.coingecko.com/en/derivatives__;!!CX2e5RWqcItE!rVO_khNmJf1jE4zB
A. Evans. Liquidity provider returns in geometric mean markets. arXiv preprint arXiv:2006.08806, 2020.
T. Leung and M. Santoli. Leveraged Exchange-Traded Funds: Price Dynamics and Options Valuation.
Springer International Publishing, 2016.
Y. Lewenberg, Y. Bachrach, Y. Sompolinsky, A. Zohar, and J. S. Rosenschein. Bitcoin mining pools: A co-
operative game theoretic analysis. In Proceedings of the 2015 international conference on autonomous
agents and multiagent systems, pages 919–927. Citeseer, 2015.
llllvvuu. Rawmoment derivatives, 2021. URL https://urldefense.com/v3/__https://llllvvuu.dev/blog/raw-moments_
12Opyn. Squeeth, 2021. URL https://urldefense.com/v3/__https://squeeth.opyn.co/__;!!CX2e5RWqcItE!rVO_khNmJf1
R. J. Shiller. Measuring asset values for cash settlement in derivative markets: Hedonic repeated measures
indices and perpetual futures. The Journal of Finance, 48(3):911–931, July 1993. ISSN 00221082. doi:
10.1111/j.1540-6261.1993.tb04024.x.
D. White, D. Robinson, Z. Koticha, A. Leone, A. Gauba, and A. Krishnan. Power perpetuals, Aug. 2021. URL
https://urldefense.com/v3/__https://www.paradigm.xyz/2021/08/power-perpetuals__;!!CX2e5RWqcItE!rVO_khN
13