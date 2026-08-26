---
sha256: bf79c0bc1e9d4243b78fd8ce8f950944d6086b9ed4c206abad7f3280459dca47
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 80284
---
Optimal Exit Time for Liquidity Providers in Automated Market Makers
Philippe Bergaulta
, Sébastien Biebera
, Leandro Sánchez-Betancourtb,c
aCeremade, Université Paris Dauphine-PSL
bMathematical Institute, University of Oxford
cOxford-Man Institute of Quantitative Finance
Abstract
We study the problem of optimal liquidity withdrawal for a representative liquidity provider (LP) in an auto-
mated market maker (AMM). LPs earn fees from trading activity but are exposed to impermanent loss (IL)
due to price fluctuations. While existing work has focused on static provision and exogenous exit strategies,
we characterise the optimal exit time as the solution to a stochastic control problem with an endogenous
stopping time. Mathematically, the LP’s value function is shown to satisfy a Hamilton–Jacobi–Bellman
quasi-variational inequality, for which we establish uniqueness in the viscosity sense. To solve the problem
numerically, we develop two complementary approaches: a Euler scheme based on operator splitting and a
Longstaff–Schwartz regression method. Calibrated simulations highlight how the LP’s optimal exit strategy
depends on the oracle price volatility, fee levels, and the behaviour of arbitrageurs and noise traders. Our
results show that while arbitrage generates both fees and IL, the LP’s optimal decision balances these op-
posing effects based on the pool state variables and price misalignments. Lastly, we find the optimal fee
level for the representative LP when they play the exit strategy we derived. This work contributes to a
deeper understanding of dynamic liquidity provision in AMMs and provides insights into the sustainability
of passive LP strategies under different market regimes.
Keywords: automated market makers; decentralised finance; liquidity provision; optimal stopping; Longstaff-
Schwartz algorithm; variational inequalities; Hamilton-Jacobi-Bellman equation; viscosity solutions.
Contents
## 1 Introduction 2
## 2 The model 4
## 2.1 Probabilistic framework . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
## 2.2 Problem formulation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 3 Mathematical analysis 6
## 3.1 Value function . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
## 3.2 Viscosity solution . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
## 4 Numerical results 9
## 4.1 Euler scheme and Longstaff-Schwartz algorithm . . . . . . . . . . . . . . . . . . . . . . . . . . 9
## 4.2 Comparative statics . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
## 5 Conclusion 14
Appendix A Risk-averse liquidity provider 15
Appendix B Proof of Theorem 1 16
Appendix B.1 Existence result . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
Appendix B.2 Uniqueness result and continuity . . . . . . . . . . . . . . . . . . . . . . . . . . . 24
arXiv:2509.06510v2 [q-fin.TR] 20 Oct 20251. Introduction
Decentralised finance (DeFi) is evolving rapidly. Since the launch of Uniswap, there is a flurry of innovations
in the DeFi space, many of which revolve around the so-called automated market maker (AMM) technology.
AMMs are decentralised trading venues where liquidity providers (LPs) and liquidity takers (LTs) interact
under pre-defined trading rules; see Adams et al. (2021, 2023); Capponi and Jia (2021). AMMs such as
Uniswap are key to DeFi, enabling users to trade assets without using traditional limit order books. Among
the most prominent AMM designs, the constant function market maker (CFM) maintains an invariant of the
form f(x,y) = k, where x and y denote the reserves of two assets, and f is a fixed function that determines
the trading rules. A key attraction of CFMs is its passive liquidity provision: liquidity providers are able
to supply capital to the pool without the need for continuous rebalancing or active order placement, as is
required in traditional limit order book markets. In return for providing liquidity, LPs earn a pro-rata share
of the fees collected on trades executed in the AMM. However, LPs also face risks, most notably the so-called
impermanent loss (IL), which arises due to price fluctuations between the pooled assets and external market
prices.
Although still in its early stages, the literature on AMMs is rapidly expanding in several key directions. A
foundational contribution is provided by Angeris et al. (2020), who analyse the core properties of CFMs;
see also Angeris and Chitra (2020) for a general multi-coin setting. In particular, they show that, in the
presence of arbitrageurs, the exchange rate proposed by a CFM for small trades remains within a band
around the external market price, where the width of the band is determined by the level of transaction fees.
The authors also establish several fundamental properties of CFMs, such as the no-splitting and no-depletion
properties, and they characterise the payoff of LPs as a function of the external asset price in the absence
of fees; see also Clark (2020), and its extension to concentrated liquidity in Uniswap v3 in Clark (2021).
Generalisations of AMM designs have been proposed in various directions. Cartea et al. (2024b) introduce
decentralised liquidity pools, generalising CFMs and offering LPs a wide range of dynamic bonding curves
to improve capital efficiency, while Bergault et al. (2024a,b,c) propose an oracle-based AMM architecture
aimed at mitigating impermanent loss. More broadly, the problem of hedging impermanent loss is studied
in Fukasawa et al. (2024), where the authors analyse how LPs can reduce their exposure through dynamic
trading strategies, and in Milionis et al. (2022, 2024) where the authors introduce the now well-known con-
cept of Loss-Versus-Rebalancing. The related notion of predictable loss is discussed in Cartea et al. (2024a),
where the authors also analyse liquidity provision and trading strategies; see also Milionis et al. (2023), and
Fan et al. (2021). Arbitrage between centralised and decentralised exchanges have been studied in Cartea
et al. (2025); He et al. (2025), and more generally the competition between limit order books and AMMs
is discussed in Aoyagi and Ito (2025); Barbon and Ranaldo (2021) and Lehar and Parlour (2025). Finally,
equilibrium between LPs is studied in Aoyagi (2020) and Hasbrouck et al. (2022).
It is now well understood that the fees paid to LPs are the main mechanism to compensate for the IL that
arises when arbitrageurs align the pool’s reference price and the external market price. More precisely, in
the absence of fees, an agent providing liquidity in a standard CFM is exposed to a concave payoff that is
strictly dominated by holding the assets outside the pool. Optimal fee structures have been studied in Evans
et al. (2021); Cao et al. (2025); Baggiani et al. (2025); Campbell et al. (2025), while the problem of incentive
design for LPs is addressed in Aqsha et al. (2025) through a game-theoretic argument. The question of take
rate – the proportion of the fees kept by the protocol – has also been studied in Fritsch et al. (2022). While
fees are ideally meant to offset IL, empirical and theoretical studies have shown that LPs often experience
persistent negative returns, particularly in volatile markets; see e.g., Canidio and Fritsch (2023). This poses
a serious challenge to the long-term sustainability of passive liquidity provision; see, e.g., Hasbrouck et al.
(2025).
In this paper, we are interested in studying the optimal exit time from a CFM when the goal is to minimise
IL and to maximise the fees collected. More precisely, the LP can withdraw liquidity at any time before a
fixed terminal horizon T, and aims to maximise the expected value of their position, accounting for both
accrued fees and the realised impermanent loss coming from the price evolution. This naturally leads to a
stochastic control problem, where the exit time is treated as a control variable. Closest to our work is the
2recent preprint by Capponi and Zhu (2025), which also studies the optimal exit time from a CFM.1
This pa-
per provides a tractable framework with closed-form expressions that are easy to implement and to analyse.
In that sense, it offers valuable structural insights into the optimal exit problem. While our work addresses
a similar question, it departs from Capponi and Zhu (2025) in several key directions. First, the optimal
threshold derived in the latter is static, while in our formulation it is dynamic: the exit region evolves over
time and depends on the current (stochastic and controlled) state variables. Second, Capponi and Zhu (2025)
assumes that “the price” follows a geometric Brownian motion, whereas we explicitly distinguish between a
fundamental (external) price – where price formation occurs – and the pool’s internal reference price, which
we derive from a detailed model of order flows within the AMM. Third, while Capponi and Zhu (2025)
abstracts from strategic liquidity takers, our framework models arbitrage activity explicitly. This allows us
to analyse how arbitrageurs align internal and external prices, how their trades generate realised IL, and
how this affects the optimal exit decision. In our setting, the optimal strategy depends not only on the
external price (e.g., on Binance) but also on the state of the pool (e.g., reserves and internal price). Finally,
we extend our analysis to account for risk aversion on the LP’s side — a natural feature in applications and,
to the best of our knowledge, not yet addressed in the existing literature.
Our key contributions are as follows.
1. We characterise the optimal exit time of a liquidity provider from a CFM. Mathematically, we show
that the value function of the corresponding optimal stopping problem is the unique viscosity solution
to a Hamilton–Jacobi–Bellman quasi-variational inequality (HJB QVI) that delineates the optimal exit
region.
2. We propose two numerical approaches to solve the problem: an Euler scheme based on operator
splitting, and a regression-based Longstaff–Schwartz algorithm.
3. We calibrate the model and test the optimal strategy. Our results reveal several key findings:
(a) Both the average fees collected and the average impermanent loss at the optimal exit time are
concave functions of the volatility of the oracle price.
(b) The performance criterion (defined as fees collected minus impermanent loss), which is non-
negative in expectation since exiting the pool immediately is always admissible, increases approx-
imately linearly with the fee level beyond a certain threshold. This is because, once fees are high
enough, LPs optimally choose to remain in the pool until the terminal time.
(c) Higher activity by arbitrageurs and noise traders leads to higher fee revenues. However, arbi-
trageurs also increase the realised impermanent loss at the exit time, up to the maximum loss
implied by the oracle price volatility. In contrast, an increase in noise trader activity raises the
fees collected while leaving impermanent loss unchanged on average.
(d) LPs tend to exit the pool when the misalignment between the oracle price and the pool’s internal
reference price becomes too large. At that point, the expected gains from future arbitrage trades
are outweighed by the associated impermanent loss, prompting LPs to exit before arbitrageurs
align prices.
The remainder of the paper proceeds as follows. Section 2 introduces the probabilistic framework and
formulates the optimal stopping problem. Section 3 analyses the problem using dynamic programming
techniques, and in particular characterises the value function as the unique viscosity solution of an HJB QVI
equation. Section 4 studies the solution of the problem and collects insights on the structure of the optimal
strategy, and Section 5 concludes. Appendix A generalises our result to a risk-averse LP with exponential
utility, while the proof of the main result is reported in Appendix B.
1We are also aware of other concurrent efforts within this general theme. For instance, Ma et al. (2025) study allocation and
exit decisions in a liquid staking protocol and an AMM. Recently, Zachary Feinstein and Marina Georgiou presented related
preliminary results at the 2025 SIAM Conference on Financial Mathematics and Engineering (no preprint available at the time
of writing). See also Agarwal and Gobet (2025).
32. The model
## 2.1 Probabilistic framework
Let T > 0 be a trading horizon, Ωc the set of continuous functions from T = [0,T] into R, Ωd the set of
piecewise constant càdlàg functions from T into N, and Ω = Ωc × Ωd
2
with the corresponding Borel algebra
F. The observable state is the canonical process (χt)t∈T = Wt,N̂b
t ,N̂a
t

t∈T
of the measurable space (Ω,F),
with
Wt(ω) := w(t), N̂b
t (ω) := n̂b
(t), N̂a
t (ω) := n̂a
(t), for all t ∈ T,
where ω := (w,n̂b
,n̂a
) ∈ Ω.
We introduce a probability measure P̂ such that W is a Brownian motions and N̂a
, N̂b
are Poisson processes
with intensity a0 > 0. Under this probability measure, W, N̂a
and N̂b
are independent. We endow the space
(Ω,F) with the P̂−augmented canonical filtration F := (Ft)t∈T generated by (χt)t∈T.
We study an automated market maker (AMM) for a pair of assets X and Y (e.g., USDC and ETH) with
trading function f(x,y) = xy. This type of AMM is referred to as constant function market (CFM). We
assume that there exists also an external limit order book (LOB) venue for trading in X and Y , where the
price formation occurs. We let S = (St)t∈T be the external mid-price of asset Y in terms of asset X. Within
the CFM, we let Xt and Yt be the strictly positive quantities of assets X and Y sitting in the pool at time
t ∈ T. We let the function φc(y) be the level function of f given by
φc(y) =
c
y
. (2.1)
The parameter c > 0 in the pool is known as the depth of the pool which we take to be constant throughout
the trading window.
The external mid-price follows the dynamics
St = S0 + σ Wt , with S0 ∈ R+
. (2.2)
In the CFM, liquidity takers arrive according to the counting processes Na
(number of liquidity taking buys)
and Nb
(number of liquidity taking sells) that model the number of trades of size ξ > 0 through time.2
We
denote by Z = (Zt)t∈T = (Xt/Yt)t∈T the marginal price of Y in terms of X in the CFM. We follow the
characterization of CFMs in Cartea et al. (2024b) that describes the mechanics of the reserves X, Y , and
the instantaneous rate Z, according to the arrival of orders Na
and Nb
. We have that
dXt = [φc(Yt9 + ξ) − φc(Yt9)] dNb
t + [φc(Yt9 − ξ) − φc(Yt9)] dNa
t ,
dYt = ξ dNb
t − ξ dNa
t ,
dZt = [−(φc)′
(Yt9 + ξ) + (φc)′
(Yt9)] dNb
t + [−(φc)′
(Yt9 − ξ) + (φc)′
(Yt9)] dNa
t ,
dNb
t = 1{Yt9+ξ≤Y }dN̂b
t ,
dNa
t = 1{Yt9−ξ≥Y }dN̂a
t ,
with Nb
0 = Na
0 = 0, X0 ∈ R+
, Y0 ∈ [Y ,Y ], and Z0 = X0/Y0. The bounds 0 < Y < Y < ∞ are mainly intro-
duced to ease the mathematical analysis. This is not an issue in practice as they can be chosen arbitrarily
small and large, respectively. One can also interpret them as risk limits, i.e. the AMM stops trading when
the instantaneous prices are too low or too high. For the sake of simplicity, we assume that Y0, Y , Y are
multiple of ξ, and introduce the set Q := {Y ,Y + ξ,...,Y − ξ,Y } ⊂ R.
2We assume a constant trade size for the sake of parsimony, but more general models with random trade sizes can be
considered as well within our framework.
4We introduce (Lt)t∈T the Doléans-Dade exponential
Lt = exp



X
i=b,a
Z t
0
log

λi
u
a0

dN̂i
u − λi
u − a0

du



,
where
λa
t = λ̄a
(Yt9,St), λb
t = λ̄b
(Yt9,St), (2.3)
dÑi
t = dN̂i
t − λi
t dt, for i = b,a, (2.4)
with
λ̄a
(y,S) = max

a0,a1 + a2 (S − c/y2
) , (2.5)
λ̄b
(y,S) = max

a0,a1 + a2 (c/y2
− S) , (2.6)
a0 > 0, a1,a2 ≥ 0. (2.7)
The function c/y2
captures the marginal price in the pool because for t ∈ T, we have that Zt = c/Yt. Thus,
all else being equal, if the price difference between the external price S and the pool’s marginal price c/y2
is positive (resp. negative), we expect that the intensity of trades that deposit (resp. withdraw) asset X in
order to withdraw (resp. deposit) asset Y increases; conversely for the other direction.3
We then define the probability measure P given by
dP
dP̂
:= LT .
It follows that under P, the processes N̂b
and N̂a
have respective intensities λb
t

t∈T
and (λa
t )t∈T, and there-
fore, the processes Nb
and Na
have respective intensities (1{Yt9+ξ≤y}λb
t)t∈T and (1{Yt9−ξ≥y}λa
t )t∈T, and W
is a Brownian motion. In the remaining of the paper, we only work under the probability measure P.
## 2.2 Problem formulation
The impermanent loss (IL) at time t ∈ T is defined as
ILt := −

Xt + Yt St − (X0 + Y0 St)

= −
h
Xt − X0
| {z }
PX
t
+St (Yt − Y0)
| {z }
PY
t
i
. (2.8)
To simplify the setup,4
we consider the case of a representative agent who owns the entire liquidity available
in the AMM and wants to close her position before time T. This representative liquidity provider (LP) wants
to maximise her fee revenues while minimizing her IL.
Let Tt,T be set of stopping times taking values in [t,T], and let T := T0,T . We are interested in solving the
optimal stopping problem
sup
τ∈T
E
h
PX
τ + SτPY
τ
| {z }
−ILτ
+Rτ
i
, (2.9)
where
Rt =
Z t
0
r(Ys−) dNb
s + dNa
s

3Modelling the stochastic intensities of trades arriving in the AMM has been done in Cartea et al. (2024b); Aqsha et al.
(2025); Baggiani et al. (2025).
4This approach has been used before, see e.g. Fukasawa et al. (2025), Aqsha et al. (2025).
5with r : R+ → R+ a fee function representing the fees paid by liquidity takers (LTs) for each trade. In what
follows we assume that r has linear growth.5
Notice that we only consider here the case of a risk-neutral liquidity provider. However, the case of a risk-
averse liquidity provider can be treated in a very similar way and we provide the corresponding analysis in
Appendix A, for a liquidity provider with an exponential utility function.
3. Mathematical analysis
In this section we characterise the value function of the optimal stopping problem in (2.9) as the unique
viscosity solution to a Hamilton-Jacobi-Bellman Quasi-Variational Inequality (HJB QVI).
## 3.1 Value function
We write −ILt + Rt as
PX
t + StPY
t + Rt =
Z t
0
(φc(Ys− + ξ) − φc(Ys− ) + ξSs + r(Ys− ))dNb
s
+
Z t
0
(φc(Ys− − ξ) − φc(Ys− ) − ξSs + r(Ys−))dNa
s .
We define the value function v associated with (2.9), as
v : T × Q × R −→ R
(t,y,S) 7−→ sup
τ∈Tt,T
E
Z τ
t
n
βb
Y t,y
s− ,St,S
s

λb
s 1{Y t,y
s9 +ξ≤Y } + βa
Y t,y
s− ,St,S
s

λa
s 1{Y t,y
s9 −ξ≥Y }
o
ds

,
(3.1)
where (
βb
(y,S) := φc(y + ξ) − φc(y) + ξS + r(y),
βa
(y,S) := φc(y − ξ) − φc(y) − ξS + r(y).
(3.2)
Definition 1. We denote by Ξ the set of functions u : T × Q × R → R that are non-negative, bounded in
their second variable, and with at most quadratic growth in their third variable, i.e. there exists C0 such that
0 ≤ u(t,y,S) ≤ C0(1 + S2
)
for all (t,y,S) ∈ T × Q × R.
Proposition 1. The value function v : T × Q × R → R is in Ξ. In particular, it is well-defined.
Proof. Let (t,y,S) ∈ T × Q × R. The value function is defined as
v(t,y,S) = sup
τ∈Tt,T
E
Z τ
t
n
βb
Y t,y
u9 ,St,S
u

λb
u1{Y t,y
u9 +ξ≤Y } + βa
Y t,y
u9 ,St,S
u

λa
u1{Y t,y
u9 −ξ≥Y }
o
du

. (3.3)
Since we assumed that r has linear growth and that (Yt)t∈T is bounded, it follows that the value function is
bounded in its second variable. Moreover, we can show that both terms inside the integrand exhibit at most
5See Baggiani et al. (2025) for a study on optimal dynamic fees. One of their findings is that linear functions r(y) are
excellent approximations to the optimal fee structure.
6quadratic growth with respect to the third variable. Observe that
βa
Y t,y
u9 ,St,S
u

λ̄a
Y t,y
u9 ,St,S
u

1{Yu9−ξ≥Y }
=

φc Y t,y
u9 − ξ

− φc Y t,y
u9

− ξSt,S
u + r Y t,y
u9

max
(
a0,a1 + a2 St,S
u −
c
Y t,y
u9
2
!)
1{Yu9−ξ≥Y }
≤

c
Y
+
c
Y + ξ
+ ξ St,S
u + max
y∈Q
r(y)
 
a0 + a1 + a2

St,S
u +
c
(Y + ξ)2

≤ Ca
0 + Ca
1 sup
u∈[t,τ]
St,S
u + Ca
2 sup
u∈[t,τ]
St,S
u
2
,
where Ca
0 , Ca
1 , Ca
2 are constant depending on Y , Y , ξ, c, a0, a1 and a2. Similarly,
βb
(Y t,y
u9 ,St,S
u )λ̄b
(Y t,y
u9 ,St,S
u )1{Yu9+ξ≤Y }
=

φc Y t,y
u9 + ξ

− φc Y t,y
u9

+ ξSt,S
u + r(Y t,y
u9 )

max
(
a0,a1 + a2
c
Y t,y
u9
2 − St,S
u
!)
1{Yu9+ξ≤Y }
≤

c
Y + ξ
+
c
Y
+ ξ St,S
u + max
y∈Q
r(y)
 
a0 + a1 + a2

c
Y 2 + St,S
u

≤ Cb
0 + Cb
1 sup
u∈[t,τ]
St,S
u + Cb
2 sup
u∈[t,τ]
St,S
u
2
,
where Cb
0, Cb
1, Cb
2 are constant depending on Y , Y , ξ, c, a0, a1 and a2.
Using Jensen for concave functions and then Doob’s inequality we have that
E
"
sup
u∈[t,T]
St,S
u
#
≤ |S0| + σE

sup
u∈T
|Wu|

= |S0| + σE

sup
u∈T
p
W2
u

≤ |S0| + 2σ
√
T,
E
"
sup
u∈[t,T]
St,S
u
2
#
≤ S2
0 + 2|S0|σE

sup
u∈T
|Wu|

+ σ2
E

sup
u∈T
W2
u

≤ S2
0 + 4|S0|σ
√
T + 4σ2
T.
We conclude that the value function has quadratic growth in its third variable and then is locally bounded
from above.
Furthermore, it is clear in the definition of the value function in (3.1) that v(t,y,S) ≥ 0 (it suffices to consider
the stopping time τ = t). Therefore, the value function is bounded from below by 0.
Following Touzi (2012) (Theorem 4.3), we now state the dynamic programming principle for this optimal
stopping problem.
Lemma 1. Let (t,y,S) ∈ [0,T) × Q × R, then for all θ ∈ Tt,T we have
v(t,y,S) = sup
τ∈Tt,T
E
Z τ∧θ
t
h
1{Yu9+ξ≥Y } βb
(Y t,y
u9 ,St,S
u )λb
u + 1{Yu9−ξ≤Y } βa
(Y t,y
u9 ,St,S
u )λa
u
i
du
+ 1{τ≥θ}v(θ,Y t,y
θ ,St,y
θ )

.
7In particular, the candidate HJB QVI for our problem is
0 = min

−
∂
∂t
v(t,y,S) −
1
2
σ2 ∂2
∂S2
v(t,y,S) − 1{y+ξ≤Y }λ̄b
(y,S)

βb
(y,S) + v(t,y + ξ,S) − v(t,y,S)

− 1{y−ξ≥Y }λ̄a
(y,S)

βa
(y,S) + v(t,y − ξ,S) − v(t,y,S)

, v(t,y,S)

on [0,T) × Q × R,
(3.4)
with terminal condition v(T,y,S) = 0 for all (y,S) ∈ Q × R.
## 3.2 Viscosity solution
In this section, we study the viscosity properties of the value function (3.1). We start by introducing a set
of test functions and defining properly the notion of viscosity solution for the HJB QVI (3.4).
Definition 2. We denote by C the class of functions γ : (t,y,S) ∈ T × Q × R 7→ γ(t,y,S) ∈ R such that γ
is continuously differentiable with respect to the first variable on [0,T), γ is twice continuously differentiable
with respect to the third variable on R and |γ|, ∂
∂S γ are bounded.
Definition 3. For a locally bounded function u : T × Q × R → R, we denote by u∗ and u∗
the lower and
upper semicontinuous envelopes of u, defined as follows:
u∗(t,y,S) = liminf
(t′,S′)→(t,S)
u(t′
,y,S′
), u∗
(t,y,S) = limsup
(t′,S′)→(t,S)
u(t′
,y,S′
) (3.5)
for all (t,y,S) ∈ T × Q × R.
Definition 4. (i) Let u be an upper semicontinuous (USC) function on T × Q × R. We say that u is a
viscosity subsolution to the HJB QVI on [0,T)×Q×R if for all (t̃,ỹ,S̃) ∈ [0,T)×Q×R, and for all
γ ∈ C such that (u − γ)(t̃,ỹ,S̃) = max(t,y,S)∈[0,T)×Q×R(u − γ)(t,y,S) = 0, we have
min
(
−
∂
∂t
γ(t̃,ỹ,S̃) −
1
2
σ2 ∂2
∂S2
γ(t̃,ỹ,S̃)
− 1{y+ξ≤Y }λ̄b
(ỹ,S̃)
h
βb
(ỹ,S̃) + γ(t̃,ỹ + ξ,S̃) − γ(t̃,ỹ,S̃)
i
(3.6)
− 1{y−ξ≥Y }λ̄a
(ỹ,S̃)
h
βa
(ỹ,S̃) + γ(t̃,ỹ − ξ,S̃) − γ(t̃,ỹ,S̃)
i
, γ(t̃,ỹ,S̃)
)
≤ 0.
(ii) Let w be a lower semicontinuous (LSC) function on T×Q×R. We say that w is a viscosity supersolution
to the HJB QVI on [0,T) × Q × R if for all (t̃,ỹ,S̃) ∈ T × Q × R, and for all γ ∈ C such that
(w − γ)(t̃,ỹ,S̃) = min(t,y,S)∈[0,T)×Q×R(w − γ)(t,y,S) = 0, we have
min
(
−
∂
∂t
γ(t̃,ỹ,S̃) −
1
2
σ2 ∂2
∂S2
γ(t̃,ỹ,S̃)
− 1{y+ξ≤Y }λ̄b
(ỹ,S̃)
h
βb
(ỹ,S̃) + γ(t̃,ỹ + ξ,S̃) − γ(t̃,ỹ,S̃)
i
(3.7)
− 1{y−ξ≥Y }λ̄a
(ỹ,S̃)
h
βa
(ỹ,S̃) + γ(t̃,ỹ − ξ,S̃) − γ(t̃,ỹ,S̃)
i
, γ(t̃,ỹ,S̃)
)
≥ 0.
(iii) If v is locally bounded on T×Q×R, we say that v is a viscosity solution to HJB QVI on [0,T)×Q×R if its
upper semicontinuous envelope v∗
and its lower semicontinuous envelope v∗ are respectively subsolution
on [0,T) × Q × R and supersolution on [0,T) × Q × R to the HJB QVI.
We state below the main result of this section. Since the proof is long and technical, we include it in
Appendix B.
8Theorem 1. The value function v defined in (3.1) is the only viscosity solution in Ξ to the HJB QVI (3.4)
with terminal condition v(T,y,S) = 0 for all (y,S) ∈ Q × R. Moreover, it is continuous.
4. Numerical results
## 4.1 Euler scheme and Longstaff-Schwartz algorithm
We design an implicit Euler scheme on a three-dimensional grid – time t, reserve Y , and price S – for the
HJB QVI and apply Neumann conditions at the boundaries in S. The HJB QVI (3.4) features a standard
diffusion term coupled with a jump component. To handle this structure, we employ an operator splitting
method at each time step: the jump terms are treated explicitly, followed by an implicit step for the dif-
fusion part. Finally, the minimum condition is enforced to determine whether it is optimal to stop or continue.
The Euler scheme may become unstable for certain parameter values due to the Courant-Friedrichs-Lewy
condition. To address this instability and enable the analysis of how different parameters influence the
model’s output, we also implement the Longstaff–Schwartz algorithm. This approach allows us to approxi-
mate the solution numerically by leveraging the dynamic programming principle presented in Lemma 1. It
leads to an iterative decision process in which, at each discretised time step, a choice must be made between
continuing or stopping. This process is captured by the following recursive scheme
v̂(t,y,S) =max
(
E
"Z t+δ
t
n
βb
Y t,y
s− ,St,S
s

λb
s 1{Y t,y
s− +ξ≤Y } + βa
Y t,y
s− ,St,S
s

λa
s 1{Y t,y
s− −ξ≥Y }
o
ds
+v̂

t + δ,Y t,y
t+δ,St,S
t+δ
i
,0
)
,
with the terminal condition v̂(T,y,S) = 0, since no further fees are earned and no additional impermanent
loss is incurred when exiting at T. Here δ > 0 denotes the time step of the scheme.
The expression above involves a conditional expectation that must be evaluated at each time step in order
to make an optimal decision. This expectation can be approximated using polynomial regression within
a Monte Carlo simulation framework. The approach was originally introduced in Longstaff and Schwartz
(2001) for pricing American options. Algorithm 4.1 outlines the adapted pseudo-code based on this method-
ology, tailored to our optimal exit time problem.
To test the Longstaff–Schwartz algorithm against a well-known Euler scheme, we employ the following model
parameters: n = 1,440, m = 5,000, T = 1 day, d = 3, σ = 100 $ · day−1/2
, a0 = 4 day−1
, a1 = 8 day−1
,
a2 = 0.04 $−1
· day−1
, ξ = 1, X0 = 1,000 $, and Y0 = 1,000 coins. Here we consider a fictitious representa-
tive cryptocurrency; in the numerical experiments below we deploy the strategies with calibrated parameters.
The right panel in Figure 1 shows that both methods produce similar overall shapes and identical exit
regions. The red curves coincide with different slices of the Euler surface. The black curve shows that the
value function is maximised when S = c/Y 2
(= Z), that is when the AMM price is equal to the external
price. The LP leaves the pool when the value function reaches 0, that is when |S − Z| becomes too large.
This can be interpreted in the following way: in our model, price formation happens on the external venue,
thus, when this price deviates from the internal price, this creates a “potential” impermanent loss that is only
realised once arbitrageurs trade on the AMM to align the internal price with the external price. Therefore,
when large price move happen, LPs might be driven to leave the pool before the IL is realised, that is, before
arbitrageurs can act on the AMM. Lastly, on the right panel, we observe that the value function decreases
with time and the hold region shrinks as we get close to time T. This occurs because as time progresses there
is less expected fees to be collected, reducing the incentives for the LP to tolerate high levels of potential
impermanent loss.
9Algorithm 1 Longstaff-Schwartz Algorithm
Require: n, m, T, d, σ, a0, a1, a3, ξ, X0, Y0
1: Initialise matrix A, S, Y, V, τ with zeros and shape (m,n), to store trajectories of the performance
−IL + R, oracle price S, reserve Y , value function v, and stopping time τ, respectively.
2: Set the time step size at T/n
3: Generate m trajectories for A, S, Y ▷ Matrix A stores the trajectories of 9IL + R
4: Set Vn ← 0 ▷ Terminal condition
5: Set τn ← 1 ▷ Exit at T if not done before
6: for i ← n − 1 to 1 do for all trajectories
7: Generate a polynomial Pi of degree d in Si and Yi
8: Perform polynomial regression of Vi+1 on Pi
9: Estimate continuation value Ci ▷ Approximation of E[Vi+1 Si,Yi]
10: Get trajectories where Ci ≤ 0 ▷ Stopping rule
11: Update value function:
Vi ←
(
0 if the trajectory has stopped,
Ai+1 − Ai + Vi+1 otherwise.
12: Update stopping time: τi ← 1 if the trajectory has stopped
13: end for
14: return V, τ
960
980
1000
1020
1040
Y
700 800 900 1000
1100
1200
1300 S
0
250
500
750
1000
1250
1500
v
960
990
1020
1050
Y
700 800 900 1000 1100 1200 1300
S
0
200
400
600
800
1000
1200
v
Figure 1: Left shows the value function v at t = 0 computed with the Euler method (blue surface) and Longstaff–Schwartz
algorithm (red slices) with the black curve in the S-Y plane representing states where S = c/Y 2, while right shows the Euler
method value function at t = 0 (blue), t = 0.5 (green), and t = 0.9 (purple).
Figure 2 confirms the previous observation. We also see that the Longstaff–Schwartz method underesti-
mates the value function when compared to the Euler method. This discrepancy can be explained by the
discretization of time: the liquidity provider (LP) can only exit the pool at discrete time steps, rather than
continuously. However, the stopping regions defined by the two methods are aligned.
10700 800 900 1000 1100 1200 1300
S (USDC/ETH)
0
200
400
600
800
1000
1200
1400 v
Y0 = 970 vEuler
vLS
700 800 900 1000 1100 1200 1300
S (USDC/ETH)
0
200
400
600
800
1000
1200
1400
v
Y0 = 1000 vEuler
vLS
700 800 900 1000 1100 1200 1300
S (USDC/ETH)
0
200
400
600
800
1000
1200
1400
v
Y0 = 1030 vEuler
vLS
Figure 2: Comparison of the Euler method (blue crosses) and the Longstaff–Schwartz method (red dots) at time t = 0 for
three initial reserve values Y (displayed in the legend). Each plot includes a 5% confidence interval for the Longstaff–Schwartz
method.
## 4.2 Comparative statics
For the experiments below, we discretise T in 1,440 timesteps with T = 1 (one day). All confidence intervals
and averages are computed using 10,000 simulations. We use the model parameters from Aqsha et al. (2025)
who used market data from Binance and Uniswap V2 in the pair ETH-USDC between 1 January 2022 and
30 April 2022 to calibrate model parameters, that is, we take S0 = Z0 = 2820 $, σ = 0.0569S0 $ · day−1/2
,
Y0 = 50,000 ETH, and X0 = Y0 Z0 $. Below, the baseline values for the parameters in the intensities are:
a0 = 1 day−1
, a1 = 10 day−1
, and a2 = 10 $−1
· day−1
; below, we carry out robustness checks where we
stress the key model parameters a1 (modulating noise traders) and a2 (modulating arbitrageurs). Lastly, we
take the fee to be constant and equal to 0.01 × ξ × S0 with ξ = 100.
Figure 3 shows a sample path (together with 5% and 95% quantile bands) for the key processes involved.
As expected, we see that the marginal price in the pool Zt follows closely the external price St. This is due
to the arbitrageurs that align quotes and are modulated through the value of the model parameter a2. The
middle panel shows that increase in prices are accompanied by depletion of reserves and vice-versa. The
right panel shows the fee collected is increasing which is the main mechanism to offset the impermanent loss
also shown in that panel.
0.00 0.25 0.50 0.75 1.00
t
2600
2700
2800
2900
3000
3100
prices (ETH/USDC)
St
Zt
0.00 0.25 0.50 0.75 1.00
t
48000
49000
50000
51000
52000
Y (ETH)
Yt
0.0 0.5 1.0
t
0
100000
200000
300000
fees (USDC)
Rt
ILt
0
100000
200000
300000
400000
IL
Figure 3: Sample paths for the price processes St and Zt, the inventory process Yt (ETH), and the fees collected by the LP.
All processes are accompanied by the running quantiles (5% and 95%) across time.
Next, Table 1 explores the effects of the volatility of the oracle price in the expected exit time E[τ] (here
τ = T = 1 if the LP does not exit the pool before T), the expected total collected fees E[Rτ], and the
expected impermanent loss E[ILτ].
11σnew E[τ] E[Rτ] E[ILτ]
σ/5 1.00 (0.00) 161,765 (22,320) 4,364 (6,419)
σ/4 1.00 (0.00) 168,343 (22,217) 6,912 (10,024)
σ/3 1.00 (0.00) 181,148 (21,806) 12,422 (17,830)
σ/2 1.00 (0.00) 210,406 (22,535) 28,177 (40,154)
σ 1.00 (0.01) 316,222 (26,930) 112,635 (157,844)
2σ 0.51 (0.27) 273,003 (144,005) 202,999 (372,645)
3σ 0.01 (0.01) 3,599 (9,363) 2,449 (13,042)
4σ 0.00 (0.00) 1,794 (3,984) 1,304 (7,411)
5σ 0.00 (0.00) 532 (1,198) 420 (1,401)
Table 1: Summary statistics for the expected (i) exit time, (ii) fees collected, and (iii) impermanent loss, as σ varies. Mean
values (with standard deviation in parenthesis) across 10,000 simulations.
There is a concave relationship between σ and (i) the expected collected fees E[Rτ] together with the (ii)
impermanent loss E[ILτ]. Indeed, for the first half of the table the higher sigma the more fees there are col-
lected because of the fees paid by arbitrageurs. However, as σ becomes large, this effect disappears because
the LPs exits the pool early in all sample paths due to the sharp increase of the impermanent loss (see right
hand side column).
Next, we investigate the role of the fees in the optimal exit time and the profitability of LPs. All else being
equal, as the value of the model parameter r increases, we expect the overall order flow in the market to
decrease. In our model, this implies that the higher the value of r, the lower the values of a0, a1, and a2. To
convey this stylised fact, when we change the value of r to a given r̃, we change the value of ai to be
ai exp(−κ(r̃ − r)), i ∈ {0,1,2},
for κ = 10−4
$−1
. We take this value because in our experiments the unstressed value of r is in the order
of 104
, but the qualitative behaviour we observe is robust to this choice. Similarly, the exponential form is
again for simplicity; we observe a similar pattern when employing a linear decay schedule. In Table 2, we
explore the effect of the fees charged by LPs.
rnew E[τ] E[Rτ] E[ILτ]
r/5 0.01 (0.01) 373 (750) 173 (1,308)
r/4 0.04 (0.05) 3,027 (5,099) 2,239 (11,377)
r/3 0.11 (0.12) 12,578 (14,578) 8,437 (35,736)
r/2 0.96 (0.09) 166,560 (20,956) 105,643 (141,534)
r 1.00 (0.01) 316,222 (26,930) 112,635 (157,844)
2r 1.00 (0.00) 530,160 (50,735) 113,269 (161,299)
3r 1.00 (0.00) 670,137 (71,973) 113,126 (161,712)
4r 1.00 (0.00) 755,901 (91,748) 112,825 (161,819)
5r 1.00 (0.00) 802,518 (109,834) 112,407 (161,782)
Table 2: Summary statistics for the expected (i) exit time, (ii) fees collected, and (iii) impermanent loss, as r varies. Mean
values (with standard deviation in parenthesis) across 10,000 simulations.
In the table above, the fees collected increase monotonically with r. On the bottom half of the table the
scaling appears to be linear because on average the exit time is roughly at T = 1, and the decay from the
exponential term is relatively small, however this is not the case in the upper half of the table due to the
early exit from the pool. The impermanent loss measure converges in the second half of the table because
the LPs do not exit the pool early. From this table we see that the row corresponding to r/2 has an average
exit time of roughly 0.96 (the row below is 1.0 and the one above drops to 0.11). Figure 4 studies this case
in more detail, in particular, we show the points at which the LP exits the pool.
12Figure 4: Exit time for the row in Table 2 corresponding to r/2. The x-axis is time, y-axis is the oracle price, and z-axis is fees
minus impermanent loss.
We observe a quadratic behaviour across various slices of time towards the end of the trading horizon; each
dot represents an early exit time. This is due to the impermanent loss taking a dominating role in the
performance criterion. The plot in Figure 5 shows the relationship between the fees and E[Rτ − ILτ].
r/4 r
fee multiplier
−100000
0
100000
200000
300000
E[R τ − IL τ ]
E[Rτ − ILτ]
r 5r 10r
fee multiplier
200000
400000
600000
800000
E[R τ − IL τ ]
E[Rτ − ILτ]
Figure 5: Relationship between r and performance, measured through E[Rτ − ILτ]. The coloured area shows one standard
deviation around the mean. Left panel is zoomed in for (r/10,r] whereas the right panel shows (r,10r].
From the left panel we see that for some values of r, the uncertainty may take the performance of the LP
to the negative region. Of course, in expectation the performance criterion is always non-negative because
the LP has the option to choose τ = 0 as an admissible control, which means that the optimal exit strategy
should yield a performance satisfying E[Rτ − ILτ] ≥ 0. As the fee increases beyond a given threshold, the
decrease in order flow affects the performance criterion of the LP more than the grains from increasing the
values of fee. We also observe an optimal fee multiplier if the objective is that of maximising the criterion
of the LPs in the market. Next, in Table 3 we study the effect of noise traders (through a1) and in Table 4
the effect of arbitrageurs (through a2).
13anew
1 E[τ] E[Rτ] E[ILτ]
a1/5 1.00 (0.01) 296,407 (26,305) 112,619 (157,946)
a1/4 1.00 (0.01) 297,518 (26,328) 112,633 (157,824)
a1/3 1.00 (0.01) 299,641 (26,392) 112,652 (158,199)
a1/2 1.00 (0.01) 303,577 (26,514) 112,625 (157,865)
a1 1.00 (0.01) 316,222 (26,930) 112,635 (157,844)
2a1 1.00 (0.01) 343,925 (27,871) 112,757 (158,040)
3a1 1.00 (0.01) 373,822 (29,214) 112,910 (158,749)
4a1 1.00 (0.01) 406,551 (30,439) 112,767 (159,015)
5a1 1.00 (0.01) 441,710 (31,530) 112,592 (158,793)
Table 3: Summary statistics for the expected (i) exit time, (ii) fees collected, and (iii) impermanent loss, as a1 varies. Mean
values (with standard deviation in parenthesis) across 10,000 simulations.
anew
2 E[τ] E[Rτ] E[ILτ]
a2/5 0.86 (0.21) 118,244 (33,981) 83,734 (127,349)
a2/4 0.93 (0.13) 142,756 (27,971) 95,493 (139,173)
a2/3 0.98 (0.07) 173,770 (24,588) 104,549 (148,242)
a2/2 0.99 (0.03) 216,953 (24,307) 110,222 (153,239)
a2 1.00 (0.01) 316,222 (26,930) 112,635 (157,844)
2a2 1.00 (0.01) 476,493 (31,957) 113,284 (158,588)
3a2 1.00 (0.01) 618,447 (36,240) 113,564 (159,533)
4a2 1.00 (0.01) 750,774 (40,318) 113,758 (160,513)
5a2 1.00 (0.00) 878,099 (43,924) 113,789 (160,830)
Table 4: Summary statistics for the expected (i) exit time, (ii) fees collected, and (iii) impermanent loss, as a2 varies. Mean
values (with standard deviation in parenthesis) across 10,000 simulations.
As expected, the fees collected are monotonically increasing with respect to both, noise traders and ar-
bitrageurs. The key difference is that across all a1 values we consider, the LPs stay in the pool roughly
until the end, whereas as we decrease the value of a2 (arbitrageurs), LPs exit the pool early because prices
misalign further. Another difference is that with more noise traders the impermanent loss does not change
(on average), whereas when there are more arbitrageurs, LPs realise more of their impermanent loss up to
the maximum level implied by the volatility of the oracle price.
5. Conclusion
We studied the optimal exit problem faced by a liquidity provider in a constant function market, formalised
as an optimal stopping problem. Our theoretical analysis characterises the value function as the unique
viscosity solution to a Hamilton–Jacobi–Bellman quasi-variational inequality (HJB QVI), and we proposed
two numerical approaches to solve the HJB QVI.
We found how the LP’s optimal exit strategy is driven by the interplay between impermanent loss and fees
collected. LPs stay in the pool when the fee income outweighs the potential impermanent loss, which occurs
more frequently when volatility is low, fees are high, or trading activity is high. However, when price dislo-
cations between the AMM price and the oracle price become too large, LPs optimally exit the pool before
arbitrageurs realign prices.
The value function is maximised when the AMM price equals the oracle price, and declines as the two diverge.
In our model, arbitrage activity is not instantaneous: impermanent loss is only realised once arbitrageurs
trade to realign prices. Hence, when large price moves occur, LPs may exit the pool pre-emptively to avoid
bearing this loss, effectively “beating” the arbitrageurs to the exit. While this insight is consistent with the
14model’s dynamics, it is important to note that gas fees would play a key role in this race. In practice, for
arbitrageurs to act faster than LPs, they would likely need to pay higher priority fees. The impact of priority
fees and more detailed transaction cost modelling is a promising direction for future research, which we are
currently investigating.
Appendix A. Risk-averse liquidity provider
Here we provide details for the problem of a risk averse LP wishing to maximise the expected utility of her
PnL. More precisely, we study the problem
sup
τ∈T
E

−exp

−ψ PX
τ + SτPY
τ + Rτ
 
, (A.1)
where ψ > 0 represents the absolute risk aversion of the LP. We introduce the process (Pt)t∈T such that for
all t ∈ T,
Pt = PX
t + StPY
t + Rt.
In particular, using βa,b
from (3.2), we obtain
dPt = βb
(Yt−,St)dNb
t + βa
(Yt−,St)dNa
t .
We define the value function uψ associated with (A.1), as
uψ : T × Q × R × R −→ R
(t,y,S,p) 7−→ sup
τ∈Tt,T
E
"
− exp

− ψPt,y,S,p
τ
#
= sup
τ∈Tt,T
E
"
− exp

− ψ

p +
Z τ
t
βb
(Y t,y
s9 ,St,S
s )dNb
s +
Z τ
t
βa
(Y t,y
s9 ,St,S
s )dNa
s
#
.
(A.2)
The dynamic programming principle for this problem is given in the following lemma.
Lemma 2. Let (t,y,S,p) ∈ [0,T) × Q × R × R, then for all θ ∈ Tt,T we have
uψ(t,y,S,p) = sup
τ∈Tt,T
E

uψ

θ,Y t,y
θ ,St,S
θ ,Pt,p,y,S
θ

1{θ≤τ} − exp

−ψPt,y,S,p
τ 1{θ>τ}

.
In particular, the HJB QVI associated with this problem is
0 = min

−
∂
∂t
uψ(t,y,S,p) −
1
2
σ2 ∂2
∂S2
uψ(t,y,S,p) (A.3)
− 1{y+ξ≤Y }λ̄b
(y,S)

uψ(t,y + ξ,S,p + βb
(y,S)) − uψ(t,y,S,p)

− 1{y−ξ≥Y }λ̄a
(y,S)

uψ(t,y − ξ,S,p + βa
(y,S)) − uψ(t,y,S,p)

,
uψ(t,y,S,p) + e−ψp

on [0,T) × Q × R × R,
with terminal condition uψ(T,y,S,p) = −e−ψp
for all (y,S,p) ∈ Q × R × R.
Next, we use the ansatz
uψ(t,y,S,p) = −exp{−ψ (p + vψ(t,y,S))},
15to obtain the following HJB QVI for the function vψ
0 = min
(
−
∂
∂t
vψ(t,y,S) −
1
2
σ2 ∂2
∂S2
vψ(t,y,S) − ψ

∂
∂S
vψ(t,y,S)
2
!
(A.4)
− 1{y+ξ≤Y }λ̄b
(y,S)
1
ψ

1 − exp
n
− ψ βb
(y,S) + vψ(t,y + ξ,S) − vψ(t,y,S)
o
− 1{y−ξ≥Y }λ̄a
(y,S)
1
ψ

1 − exp
n
− ψ (βa
(y,S) + vψ(t,y − ξ,S) − vψ(t,y,S))
o
,
vψ(t,y,S)
)
on [0,T) × Q × R,
with terminal condition vψ(T,y,S) = 0 for all (y,S) ∈ Q × R.
Remark 2. Notice that, as expected, taking ψ → 0 in the HJB QVI (A.4) we obtain the original risk-neutral
HJB QVI (3.4).
Figure A.6 highlights the difference between a risk-neutral and a risk-averse liquidity provider. When the
liquidity provider is risk-averse, the value function shrinks, indicating that she tolerates much smaller de-
viations of the AMM price from the external price. To obtain a stable and meaningful comparison, the
parameters are chosen to match those used in Figure 1, with ψ = 10−2
.
960
990
1020
1050
Y
700 800 900 1000 1100 1200 1300
S
0
200
400
600
800
v
Figure A.6: Value function v at t = 0 computed using the Euler method for both a risk-neutral (blue surface) and a risk-averse
(orange surface) liquidity provider. The black curve in the S-Y plane represents the states satisfying S = c/Y 2.
Appendix B. Proof of Theorem 1
We report in this section the proof of Theorem 1. In the first part, we prove that the value function (3.1)
is a viscosity solution to the HJB QVI (3.4) with terminal condition v(T,y,S) = 0 for (y,S) ∈ Q × R. In
the second part, we prove a comparison principle for the HJB QVI (3.4) that allows us to establish the
uniqueness and the continuity of the solution.
16Appendix B.1 Existence result
We first prove that the value function is both a viscosity subsolution and supersolution to the HJB QVI
(3.4) on [0,T) × Q × R, and then we show that it satisfies the right terminal condition.
Proposition 2. The function v in (3.1) is a viscosity subsolution to the HJB QVI (3.4) on [0,T)×Q×R.
Proof. Using Proposition 1, v is locally bounded on [0,T)×Q×R, so we let v∗
be its upper semicontinuous
envelope.
Let (t̃,ỹ,S̃) ∈ [0,T)×Q×R and γ ∈ C such that 0 = (v∗
−γ)(t̃,ỹ,S̃) = max(t,y,S)∈[0,T)×Q×R(v∗
−γ)(t,y,S).
As usual, without loss of generality we can assume the maximum to be strict; see for example Lemma 6.1 in
Fleming and Soner (2006). By definition of v∗
(t̃,ỹ,S̃), there exists (tm,Sm)m a sequence in [0,T) × R such
that
(tm,Sm) − − − −→
m→∞
(t̃,S̃),
v(tm,ỹ,Sm) − − − −→
m→∞
v∗
(t̃,ỹ,S̃).
We prove the result by contradiction. Assume there exists η > 0 such that
min
(
−
∂
∂t
γ(t̃,ỹ,S̃) −
1
2
σ2 ∂2
∂S2
γ(t̃,ỹ,S̃)
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,S̃)
h
βb
(ỹ,S̃) + γ(t̃,ỹ + ξ,S̃) − γ(t̃,ỹ,S̃)
i
− 1{ỹ−ξ≥Y }λ̄a
(ỹ,S̃)
h
βa
(ỹ,S̃) + γ(t̃,ỹ − ξ,S̃) − γ(t̃,ỹ,S̃)
i
, γ(t̃,ỹ,S̃)
)
> 2η.
Then, as γ belongs to C, we have
min
(
−
∂
∂t
γ(t,y,S) −
1
2
σ2 ∂2
∂S2
γ(t,y,S)
− 1{y+ξ≤Y }λ̄b
(y,S)

βb
(y,S) + γ(t,y + ξ,S) − γ(t,y,S)

(B.1)
− 1{y−ξ≥Y }λ̄a
(y,S)[βa
(y,S) + γ(t,y − ξ,S) − γ(t,y,S)], γ(t,y,S)
)
≥ η
on B := B
n
(t,ỹ,S) |t − t̃| < ε,|S − S̃| < ε
o
for ε > 0 small enough. Without loss of generality, we assume
that B contains the sequence (tm,Sm)m. Then, by potentially reducing the value of η, we have
v ≤ v∗
≤ γ − η
on the parabolic boundary ∂pB of B, i.e.,
∂pB =

(t̃ − ε,t̃ + ε) ∩ [0,T)

× {ỹ} × {S̃ − ε, S̃ + ε}

∪

{t̃ + ε} × {ỹ} × (S̃ − ε,S̃ + ε)

.
Without loss of generality, we can assume that (B.1) holds on
B̃ = {(t,y ± ξ,S) | (t,y,S) ∈ B}
which is also bounded.
For m ∈ N we introduce a stopping time πm = inf
n
t ≥ tm | (t,Y tm,ỹ
t ,Stm,Sm
t ) / ∈ B
o
and by Itô’s formula
17applied to γ between tm and πm ∧ τ where τ ∈ Ttm,T , we have
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) (B.2)
= γ(tm,ỹ,Sm) +
Z πm∧τ
tm
∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )du
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dNb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dNa
u ,
= γ(tm,ỹ,Sm) +
Z πm∧τ
tm

∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9+ξ≤Y } λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

+ 1{Yu9−ξ≥Y } λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Yu9,Stm,Sm
u )


du
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑa
u
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu,
which we write as
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) = γ(tm,ỹ,Sm)
−
Z πm∧τ
tm
−

∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9+ξ≤Y } λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )

βb
(Y tm,ỹ
u9 ,Stm,Sm
u ) + γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

+ 1{Yu9−ξ≥Y } λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

βa
(Y tm,ỹ
u9 ,Stm,Sm
u ) + γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )


du
−
Z πm∧τ
tm

βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )1{Yt9+ξ≤Y }
+ βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )1{Yt9−ξ≥Y }

du
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑa
u
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu.
Inside the first integrand, we recognise the left part inside the minimum of the HJB QVI, which we have
assumed to be positive on B. Moreover, the last three terms are martingales under the probability measure
P, because γ and its first partial derivative with respect to S are bounded.
Therefore, taking the expectation of the above quantity leads to
18E
h
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
i
≤ γ(tm,ỹ,Sm)
− E
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Su)λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

.
We also have that
γ(tm,ỹ,Sm) ≥E

γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
+
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Su)λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

.
Given that γ belongs to C, then γ(tm,ỹ,Sm) − − − −→
m→∞
γ(t̃,ỹ,S̃) = v∗
(t̃,ỹ,S̃), and we also have that v(tm,ỹ,Sm) − − − −→
m→∞
v∗
(t̃,ỹ,S̃). Therefore, there exists an m sufficiently large such that γ(tm,ỹ,Sm) − v(tm,ỹ,Sm) ≤ η
2, and it
follows that
v(tm,ỹ,Sm) ≥ −
η
2
+ E

γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
+
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Su)λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

.
Morevover,
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) = γ(πm,Y tm,ỹ
πm
,Stm,Sm
πm
)
| {z }
≥v(πm,Y tm,ỹ
πm ,Stm,ỹ
πm )+η
1{πm<τ} + γ(τ,Y tm,ỹ
τ ,Stm,Sm
τ )
| {z }
≥η
1{πm≥τ}.
Putting all things together we have
v(tm,ỹ,Sm) ≥
η
2
+ E
Z πm∧τ
tm

1{Yu9+ξ≥Y } βb
(Y tm,ỹ
u9 ,Su)λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+1{Yu9−ξ≤Y } βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )
i
du
+ v(πm,Y tm,ỹ
πm
,Stm,ỹ
πm
)1{πm<τ}

.
By taking the supremum over all the stopping time in Ttm,T on the right-hand side, we get
v(tm,ỹ,Sm) > sup
τ∈Ttm,T
E
Z πm∧τ
tm

1{Yu9+ξ≥Y } βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Su)
+1{Yu9−ξ≤Y } βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )
i
du
+ v(πm,Y tm,ỹ
πm
,Stm,ỹ
πm
)1{πm<τ}

,
which contradicts the dynamics programming principle.
19In conclusion, we necessarily have
min
(
−
∂
∂t
γ(t,y,S) −
1
2
σ2 ∂2
∂S2
γ(t,y,S)
− 1{y+ξ≤Y }λ̄b
(y,S)

βb
(y,S) + γ(t,y + ξ,S) − γ(t,y,S)

− 1{y−ξ≥Y }λ̄a
(y,S)[βa
(y,S) + γ(t,y − ξ,S) − γ(t,y,S)], γ(t,y,S)
)
≤ 0,
and v is a viscosity subsolution to the HJB QVI on [0,T) × Q × R.
Proposition 3. The function v in (3.1) is a viscosity supersolution to the HJB QVI (3.4) on [0,T)×Q×R.
Proof. Using Proposition 1, v is locally bounded on [0,T)×Q×R, so we define v∗ its lower semicontinuous
envelope.
Let (t̃,ỹ,S̃) ∈ [0,T)×Q×R and γ ∈ C such that 0 = (v∗ −γ)(t̃,ỹ,S̃) = min(t,y,S)∈[0,T)×Q×R(v∗ −γ)(t,y,S)
and assume the minimum to be strict. By definition of v∗(t̃,ỹ,S̃), their exists (tm,Sm)m a sequence of
[0,T) × R such that
(tm,Sm) − − − −→
m→∞
(t̃,S̃),
v(tm,ỹ,Sm) − − − −→
m→∞
v∗(t̃,ỹ,S̃).
We prove the result by contradiction. Assume there exists η > 0 such that
min
(
−
∂
∂t
γ(t̃,ỹ,S̃) −
1
2
σ2 ∂2
∂S2
γ(t̃,ỹ,S̃)
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,S̃)
h
βb
(ỹ,S̃) + γ(t̃,ỹ + ξ,S̃) − γ(t̃,ỹ,S̃)
i
(B.3)
− 1{ỹ−ξ≤Y }λ̄a
(ỹ,S̃)
h
βa
(ỹ,S̃) + γ(t̃,ỹ − ξ,S̃) − γ(t̃,ỹ,S̃)
i
, γ(t̃,ỹ,S̃)
)
< −2η
Since v is non-negative, v∗ is also non-negative. This implies that γ(t̃,ỹ,S̃) should be non-negative to satisfy
(v∗ − γ)(t̃,ỹ,S̃) = 0. Therefore, (B.3) reduces to
−
∂
∂t
γ(t̃,ỹ,S̃) −
1
2
σ2 ∂2
∂S2
γ(t̃,ỹ,S̃) − 1{ỹ+ξ≤Y }λ̄b
(ỹ,S̃)
h
βb
(ỹ,S̃) + γ(t̃,ỹ + ξ,S̃) − γ(t̃,ỹ,S̃)
i
− 1{ỹ−ξ≥Y }λ̄a
(ỹ,S̃)
h
βa
(ỹ,S̃) + γ(t̃,ỹ − ξ,S̃) − γ(t̃,ỹ,S̃)
i
< −2η.
Then, as γ belongs to C, we have
−
∂
∂t
γ(t,ỹ,S) −
1
2
σ2 ∂2
∂S2
γ(t,ỹ,S) − 1{ỹ+ξ≤Y }λ̄b
(ỹ,S)

βb
(ỹ,S) + γ(t,ỹ + ξ,S) − γ(t,ỹ,S)

(B.4)
− 1{ỹ−ξ≥Y }λ̄a
(ỹ,S)[βa
(ỹ,S) + γ(t,ỹ − ξ,S) − γ(t,ỹ,S)] ≤ −η
on B := B
n
(t,ỹ,S) |t − t̃| < ε,|S − S̃| < ε
o
for ε > 0 small enough. Without loss of generality, we assume
that B contains the sequence (tm,Sm)m.
Then, as the minimum of v∗ − γ is assumed to be strict at (t̃,ỹ,S̃), by potentially reducing the value of η,
20we have
v ≥ v∗ ≥ γ + η
on the parabolic boundary ∂pB of B, i.e.,
∂pB =

(t̃ − ε,t̃ + ε) ∩ [0,T)

× {ỹ} × {S̃ − ε, S̃ + ε}

∪

{t̃ + ε} × {ỹ} × (S̃ − ε,S̃ + ε)

.
Without loss of generality, we assume that (B.4) holds on
B̃ = {(t,y ± ξ,S) | (t,y,S) ∈ B}
which is also bounded.
For m ∈ N we introduce a stopping time πm = inf
n
t ≥ tm | (t,Y tm,ỹ
t ,Stm,Sm
t ) / ∈ B
o
and by Itô’s formula
applied to γ between tm and πm ∧τ where τ = inf
n
t ≥ tm | γ(t,Y tm,ỹ
t ,Stm,Sm
t ) ≤ −η
o
∧T ∈ Ttm,T , we have
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) (B.5)
= γ(tm,ỹ,Sm) +
Z πm∧τ
tm
∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )du
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dNb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dNa
u ,
= γ(tm,ỹ,Sm) +
Z πm∧τ
tm

∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9+ξ≤Y } λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

+ 1{Yu9−ξ≥Y } λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Yu9,Stm,Sm
u )


du
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑa
u
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu,
21which we write as
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) = γ(tm,ỹ,Sm)
−
Z πm∧τ
tm
−

∂
∂t
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u ) +
1
2
σ2 ∂2
∂S2
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9+ξ≤Y } λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )

βb
(Y tm,ỹ
u9 ,Stm,Sm
u ) + γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

+ 1{Yu9−ξ≥Y } λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

βa
(Y tm,ỹ
u9 ,Stm,Sm
u ) + γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )


du
−
Z πm∧τ
tm

βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )1{Yt9+ξ≤Y }
+ βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )1{Yt9−ξ≥Y }

du
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 + ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑb
u
+
Z πm∧τ
tm

γ(u,Y tm,ỹ
u9 − ξ,Stm,Sm
u ) − γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )

dÑa
u
+
Z πm∧τ
tm
σ
∂
∂S
γ(u,Y tm,ỹ
u9 ,Stm,Sm
u )dWu.
Inside the first integrand, we recognise the left part inside the minimum of the HJB QVI, which we have
assumed to be negative on B. Moreover, the last three terms are martingales under the probability measure
P, because γ and its first partial derivative with respect to S are bounded.
Therefore, taking the expectation of the above quantity leads to
E
h
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
i
≥ γ(tm,ỹ,Sm)
− E
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

.
We write the above as
γ(tm,ỹ,Sm) ≤ E

γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
+
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

.
Given that γ belongs to C, then γ(tm,ỹ,Sm) − − − −→
m→∞
γ(t̃,ỹ,S̃) = v∗(t̃,ỹ,S̃), and we also have that v(tm,ỹ,Sm) − − − −→
m→∞
v∗(t̃,ỹ,S̃). Therefore, there exists an m sufficiently large such that v(tm,ỹ,Sm)−γ(tm,ỹ,Sm) ≤ η
2. It follows
22that
v(tm,ỹ,Sm) ≤
η
2
+ E

γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ )
+
Z πm∧τ
tm

1{Yu9+ξ≤Y }βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≥Y }βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )

du

,
moreover,
γ(πm ∧ τ,Y tm,ỹ
πm∧τ,Stm,Sm
πm∧τ ) = γ(πm,Y tm,ỹ
πm
,Stm,Sm
πm
)
| {z }
≤v(πm,Y tm,ỹ
πm ,Stm,ỹ
πm )−η
1{πm<τ} + γ(τ,Y tm,ỹ
τ ,Stm,Sm
τ )
| {z }
≤−η
1{πm≥τ}.
Combining the above inequalities we have
v(tm,ỹ,Sm) ≤ −
η
2
+ E
Z πm∧τ
tm
h
1{Yu9+ξ≥Y } βb
(Y tm,ỹ
u9 ,Su)λ̄b
(Y tm,ỹ
u9 ,Stm,Sm
u )
+ 1{Yu9−ξ≤Y } βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )
i
du
+ v(πm,Y tm,ỹ
πm
,Stm,ỹ
πm
)1{πm<τ}

.
By taking the supremum over all the stopping time in Ttm,T on the right-hand side, we get
v(tm,ỹ,Sm) < sup
τ∈Ttm,T
E
Z πm∧τ
tm
h
1{Yu9+ξ≥Y } βb
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄b
(Y tm,ỹ
u9 ,Su)
+ 1{Yu9−ξ≤Y } βa
(Y tm,ỹ
u9 ,Stm,Sm
u )λ̄a
(Y tm,ỹ
u9 ,Stm,Sm
u )
i
du
+ v(πm,Y tm,ỹ
πm
,Stm,ỹ
πm
)1{πm<τ}

,
which contradicts the dynamics programming principle.
In conclusion, we necessarily have that
min
(
−
∂
∂t
γ(t,y,S) −
1
2
σ2 ∂2
∂S2
γ(t,y,S)
− 1{y+ξ≤Y }λ̄b
(y,S)

βb
(y,S) + γ(t,y + ξ,S) − γ(t,y,S)

− 1{y−ξ≥Y }λ̄a
(y,S)[βa
(y,S) + γ(t,y − ξ,S) − γ(t,y,S)], γ(t,y,S)
)
≥ 0,
and it follows that v is a viscosity supersolution to the HJB QVI on [0,T) × Q × R.
Proposition 4. For all (y,S) ∈ Q × R, we have v∗(T,y,S) = v∗
(T,y,S) = 0.
Proof. By Proposition 1, we know that v is bounded from below by 0. Therefore, it is also the case for v∗
and v∗
. In particular, we have v∗(T,y,S) ≥ 0 and v∗
(T,y,S) ≥ 0 for all (y,S) ∈ Q × R.
Moreover, by definition, we have v∗ ≤ v ≤ v∗
on T × Q × R. In particular, since v(T,y,S) = 0 for all
(y,S) ∈ Q × R, we have v∗(T,y,S) ≤ 0 for all (y,S) ∈ Q × R, and we can conclude that v∗(T,y,S) = 0.
Finally, we just have to prove that v∗
(T,y,S) ≤ 0 for all (y,S) ∈ Q×R. Let (y,S) ∈ Q×R. Let (tm)m and
23(Sm)m be two sequences, respectively in [0,T) and in R, such that
tm −→
m→∞
T, Sm −→
m→∞
S
and
v(tm,y,Sm) −→
m→∞
v∗
(T,y,S).
Let ε > 0. We introduce a sequence of stopping times (τm)m such that for all m ≥ 0, τm ∈ Ttm,T and τm is
ε−optimal in the sense that
v(tm,y,Sm)≤ε+E
"Z τm
tm

βb
(Y m
u9,Sm
u )λ̄b
(Y m
u9,Sm
u )1{Y m
u9 +ξ≤Y }+βa
(Y m
u9,Sm
u ) λ̄a
(Y m
u9,Sm
u )1{Y m
u9 −ξ≥Y }

du
#
(B.6)
where we denoted Y m
= Y tm,y
and Sm
= Stm,Sm
.
Using that τm takes value in [tm,T], Y m
takes value in the finite set Q, and that the functions βb
,λ̄b
,βa
,λ̄a
have at most linear growth in their second variable, we see that there exists a C̄ > 0 such that, almost surely,
Z τm
tm

βb
(Y m
u9,Sm
u ) λ̄b
(Y m
u9,Sm
u )1{Y m
u9 +ξ≤Y } + βa
(Y m
u9,Sm
u ) λ̄a
(Y m
u9,Sm
u )1{Y m
u9 −ξ≥Y }

du
≤C̄(T − tm) +
Z T
tm
C̄ |Sm
u |
2
du.
Using Doob’s inequality and potentially increasing C̄, we obtain
E
"Z τm
tm

βb
(Y m
u9,Sm
u ) λ̄b
(Y m
u9,Sm
u )1{Y m
u9 +ξ≤Y } + βa
(Y m
u9,Sm
u ) λ̄a
(Y m
u9,Sm
u )1{Y m
u9 −ξ≥Y }

du
#
≤C̄(T − tm) 1 + |Sm|2

.
Therefore the right-hand side in (B.6) goes to ε when m → ∞, but since v(tm,y,Sm) −→
m→∞
v∗
(T,y,S), we
obtain
v∗
(T,y,S) ≤ ε.
We conclude the proof by sending ε to 0.
Appendix B.2 Uniqueness result and continuity
Let us first make a change of variable before proving the main result. For a given ρ > 0, we define the
function ṽ : T × Q × R → R by
ṽ(t,y,S) = eρt
v(t,y,s)
for all (t,y,S) ∈ T × Q × R.
From what precedes, it is clear that ṽ is a viscosity solution to the HJB QVI
0 = min
(
ρṽ(t,y,S) −
∂
∂t
ṽ(t,y,S) −
1
2
σ2 ∂2
∂S2
ṽ(t,y,S) (B.7)
− 1{y+ξ≤Y }λ̄b
(y,S)

β̃b
(t,y,S) + ṽ(t,y + ξ,S) − ṽ(t,y,S)

− 1{y−ξ≥Y }λ̄a
(y,S)

β̃a
(t,y,S) + ṽ(t,y − ξ,S) − ṽ(t,y,S)

, ṽ(t,y,S)
)
on [0,T) × Q × R,
24with terminal condition ṽ(T,y,S) = 0 for all (y,S) ∈ Q × R, where
β̃b
(t,y,S) = eρt
βb
(y,S) and β̃a
(t,y,S) = eρt
βa
(y,S).
We then define the concepts of parabolic superdifferential and subdifferential before introducing an equivalent
characterization of viscosity solution.
Definition 5. Let u : T × Q × R → R be a USC function, w : T × Q × R → R a LSC function, and let
(t̃,ỹ,S̃) ∈ [0,T) × Q × R.
(i) We say that (q,p,A) ∈ R3
is in P+
u(t̃,ỹ,S̃) if
u(t,ỹ,S) ≤ u(t̃,ỹ,S̃) + q(t − t̃) + p(S − S̃) +
1
2
A(S − S̃)2
+ o

|t − t̃| + |S − S̃|2

for all (t,S) ∈ [0,T) × R.
(ii) We say that (q,p,A) ∈ R3
is in P−
w(t̃,ỹ,S̃) if
w(t,ỹ,S) ≥ w(t̃,ỹ,S̃) + q(t − t̃) + p(S − S̃) +
1
2
A(S − S̃)2
+ o

|t − t̃| + |S − S̃|2

for all (t,S) ∈ [0,T) × R.
(iii) We also define P̄+
u(t̃,ỹ,S̃) as the set of (q,p,A) ∈ R3
such that the exists a sequence (tn,Sn)n in
[0,T) × R and a sequence (qn,pn,An)n in R3
such that we have (qn,pn,An) ∈ P+
u(tn,ỹ,Sn) for all
n ∈ N∗
, and
(qn,pn,An) −→
n→∞
(q,p,A).
(iv) Similarly, P̄−
w(t̃,ỹ,S̃) is the set of (q,p,A) ∈ R3
such that the exists a sequence (tn,Sn)n in [0,T)×R
and a sequence (qn,pn,An)n in R3
such that we have (qn,pn,An) ∈ P−
w(tn,ỹ,Sn) for all n ∈ N∗
, and
(qn,pn,An) −→
n→∞
(q,p,A).
Lemma 3. (i) Let ũ be a USC function on T × Q × R. Then ũ is a subsolution to the HJB QVI (B.7)
on [0,T) × Q × R if and only if for all (t̃,ỹ,S̃) ∈ [0,T) × Q × R and (q̃,p̃,Ã) ∈ P̄+
u(t̃,ỹ,S̃), we have
0 ≥ min
(
ρũ(t̃,ỹ,S̃) − q̃ −
1
2
σ2
Ã
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,S̃)

β̃b
(t̃,ỹ,S̃) + ũ(t̃,ỹ + ξ,S̃) − ũ(t̃,ỹ,S̃)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,S̃)

β̃a
(t̃,ỹ,S̃) + ũ(t̃,ỹ − ξ,S̃) − ũ(t̃,ỹ,S̃)

, ũ(t̃,ỹ,S̃)
)
.
(ii) Let w̃ be a LSC function on T×Q×R. Then ũ is a supersolution to the HJB QVI (B.7) on [0,T)×Q×R
if and only if for all (t̃,ỹ,S̃) ∈ [0,T) × Q × R and (q̃,p̃,Ã) ∈ P̄−
w(t̃,ỹ,S̃), we have
0 ≤ min
(
ρw̃(t̃,ỹ,S̃) − q̃ −
1
2
σ2
Ã
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,S̃)

β̃b
(t̃,ỹ,S̃) + w̃(t̃,ỹ + ξ,S̃) − w̃(t̃,ỹ,S̃)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,S̃)

β̃a
(t̃,ỹ,S̃) + w̃(t̃,ỹ − ξ,S̃) − w̃(t̃,ỹ,S̃)

, w̃(t̃,ỹ,S̃)
)
.
This is a classical result, and we refer the reader to Proposition 4.1 in Fleming and Soner (2006) for a detailed
proof. We can now state the comparison principle.
25Proposition 5. Let u ∈ Ξ (resp. w ∈ Ξ) be a USC subsolution (resp. LSC supersolution) to the HJB QVI
(3.4) with w ≥ u on {T} × Q × R. Then we have w ≥ u on T × Q × R.
Proof. The proof is technical and we decompose it in several steps.
Step 1: Change of variable.
We introduce the functions ũ,w̃ ∈ Ξ given by
ũ(t,y,S) = eρt
u(t,y,S) and w̃(t,y,S) = eρt
w(t,y,S) ∀(t,y,S) ∈ T × Q × R.
Then ũ and w̃ are respectively subsolution and supersolution to the HJB QVI (B.7) on [0,T) × Q × R with
w̃ ≥ ũ on {T} × Q × R. It suffices to prove that w̃ ≥ ũ on T × Q × R.
Step 2: Doubling variables.
By contradiction, assume sup
T×Q×R
ũ − w̃ > 0. Then for ε,µ > 0 with ε small enough, there exists (t̃,ỹ,S̃) ∈
T × Q × R such that
0 < ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) (B.8)
= sup
(t,y,S)∈[0,T)×Q×R
ũ(t,y,S) − w̃(t,y,S) − ϕ(t,S,S),
where
ϕ(t,S,R) = εe−µt
1 + S4
+ R4

∀ (t,S,R) ∈ T × R2
.
The choice of ϕ adds some coercivity and allows to look for the supremum in a bounded set. Moreover,
t̃ < T as w̃ ≥ ũ on {T} × Q × R.
Then for all n ∈ N∗
, we can find (tn,Sn,Rn) ∈ T × R2
such that
0 < ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn) − ϕ(tn,Sn,Rn) − n(Sn − Rn)2
−

(tn − t̃)2
+ (Sn − S̃)4

(B.9)
= sup
(t,S,R)∈T×R2
ũ(t,ỹ,S) − w̃(t,ỹ,R) − ϕ(t,S,R) − n(S − R)2
−

(t − t̃)2
+ (S − S̃)4

.
It is clear the |Sn − Rn| −→
n→∞
0, and up to a subsequence there exists (t̂,Ŝ) ∈ T × R such that
tn −→
n→∞
t̂ and Sn,Rn −→
n→∞
Ŝ.
Moreover, we clearly have
ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) (B.10)
≤ ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn) − ϕ(tn,Sn,Rn) − n(Sn − Rn)2
−

(tn − t̃)2
+ (Sn − S̃)4

,
so in particular
ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) ≤ ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn) − ϕ(tn,Sn,Rn),
and therefore
ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) ≤ liminf
n→∞
(ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn)) − ϕ(t̂,Ŝ,Ŝ).
26However, by definition,
limsup
n→∞
(ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn)) ≤ ũ(t̂,ỹ,Ŝ) − w̃(t̂,ỹ,Ŝ),
so
ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) ≤ ũ(t̂,ỹ,Ŝ) − w̃(t̂,ỹ,Ŝ) − ϕ(t̂,Ŝ,Ŝ).
This implies by (B.8) that
lim
n→∞
ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn) − ϕ(tn,Sn,Rn) = ũ(t̂,ỹ,Ŝ) − w̃(t̂,ỹ,Ŝ) − ϕ(t̂,Ŝ,Ŝ)
= ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃).
Going back to (B.8), we get
ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) ≤ ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃) − ϕ(t̃,S̃,S̃) −

(t̂ − t̃)2
+ (Ŝ − S̃)4

,
which can only hold if t̂ = t̃ and Ŝ = S̃, and we necessarily have
lim
n→∞
ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn) = ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃).
Step 3: Ishii’s lemma.
For all n ∈ N∗
, let us define the function φn by
φn(t,S,R) = ϕ(t,S,R) + n(S − R)2
+

(t − t̃)2
+ (S − S̃)2

∀(t,S,R) ∈ T × R2
.
Then, by Ishii’s lemma (see for instance Fleming and Soner (2006) Theorem 6.1), we know that for η > 0
there exist (q1
n,p1
n,A1
n) ∈ P̄+
ũ(tn,ỹ,Sn) and (q2
n,p2
n,A2
n) ∈ P̄−
w̃(tn,ỹ,Rn) such that
q1
n − q2
n =
∂
∂t
φn(tn,Sn,Rn), p1
n,p2
n

=

∂
∂S
φn(tn,Sn,Rn),−
∂
∂R
φn(tn,Sn,Rn)

,
and 
A1
n 0
0 −A2
n

≤ Hφn(tn,Sn,Rn) + η (Hφn(tn,Sn,Rn))
2
,
where Hφn(t,S,R) denotes the Hessian matrix of φn with respect to (S,R).
Step 4: Viscosity properties.
We can now apply Lemma 3 to see that, on the one hand,
0 ≥ min
(
ρũ(tn,ỹ,Sn) − q1
n −
1
2
σ2
A1
n
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Sn)

β̃b
(tn,ỹ,Sn) + ũ(tn,ỹ + ξ,Sn) − ũ(tn,ỹ,Sn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Sn)

β̃a
(tn,ỹ,Sn) + ũ(tn,ỹ − ξ,Sn) − ũ(tn,ỹ,Sn)

, ũ(tn,ỹ,Sn)
)
,
27but by (B.9) and the fact that w̃ ∈ Ξ, we know that ũ(tn,ỹ,Sn) > 0, so necessarily
0 ≥ ρũ(tn,ỹ,Sn) − q1
n −
1
2
σ2
A1
n (B.11)
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Sn)

β̃b
(tn,ỹ,Sn) + ũ(tn,ỹ + ξ,Sn) − ũ(tn,ỹ,Sn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Sn)

β̃a
(tn,ỹ,Sn) + ũ(tn,ỹ − ξ,Sn) − ũ(tn,ỹ,Sn)

.
On the other hand, still applying Lemma 3, we have
0 ≤ min
(
ρw̃(tn,ỹ,Rn) − q2
n −
1
2
σ2
A2
n
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Rn)

β̃b
(tn,ỹ,Rn) + w̃(tn,ỹ + ξ,Rn) − w̃(tn,ỹ,Rn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Rn)

β̃a
(tn,ỹ,Rn) + w̃(tn,ỹ − ξ,Rn) − w̃(tn,ỹ,Rn)

, w̃(tn,ỹ,Sn)
)
,
which implies
0 ≤ ρw̃(tn,ỹ,Rn) − q2
n −
1
2
σ2
A2
n (B.12)
− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Rn)

β̃b
(tn,ỹ,Rn) + w̃(tn,ỹ + ξ,Rn) − w̃(tn,ỹ,Rn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Rn)

β̃a
(tn,ỹ,Rn) + w̃(tn,ỹ − ξ,Rn) − w̃(tn,ỹ,Rn)

.
From (B.11) and (B.12), we get
ρ(ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn)) ≤ q1
n − q2
n +
1
2
σ2
A1
n − A2
n

+ 1{ỹ+ξ≤Y }λ̄b
(ỹ,Sn)

β̃b
(tn,ỹ,Sn) + ũ(tn,ỹ + ξ,Sn) − ũ(tn,ỹ,Sn)

+ 1{ỹ−ξ≥Y }λ̄a
(ỹ,Sn)

β̃a
(tn,ỹ,Sn) + ũ(tn,ỹ − ξ,Sn) − ũ(tn,ỹ,Sn)

− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Rn)

β̃b
(tn,ỹ,Rn) + w̃(tn,ỹ + ξ,Rn) − w̃(tn,ỹ,Rn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Rn)

β̃a
(tn,ỹ,Rn) + w̃(tn,ỹ − ξ,Rn) − w̃(tn,ỹ,Rn)

.
Moreover,
Hφn(tn,Sn,Rn) =
∂2
∂S2 ϕ(tn,Sn,Rn) + 2n + 12(Sn − S̃)2 ∂2
∂S∂Rϕ(tn,Sn,Rn) − 2n
∂2
∂S∂Rϕ(tn,Sn,Rn) − 2n ∂2
∂R2 ϕ(tn,Sn,Rn) + 2n
!
,
and we get
ρ(ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn)) ≤
∂
∂t
ϕ(tn,Sn,Rn) + 2(tn − t̃) + ηCn
+
1
2
σ2

∂2
∂S2
ϕ(tn,Sn,Rn) +
∂2
∂R2
ϕ(tn,Sn,Rn)
+ 12(Sn − S̃)2
+ 2
∂2
∂S∂R
ϕ(tn,Sn,Rn)

+ 1{ỹ+ξ≤Y }λ̄b
(ỹ,Sn)

β̃b
(tn,ỹ,Sn) + ũ(tn,ỹ + ξ,Sn) − ũ(tn,ỹ,Sn)

+ 1{ỹ−ξ≥Y }λ̄a
(ỹ,Sn)

β̃a
(tn,ỹ,Sn) + ũ(tn,ỹ − ξ,Sn) − ũ(tn,ỹ,Sn)

− 1{ỹ+ξ≤Y }λ̄b
(ỹ,Rn)

β̃b
(tn,ỹ,Rn) + w̃(tn,ỹ + ξ,Rn) − w̃(tn,ỹ,Rn)

− 1{ỹ−ξ≥Y }λ̄a
(ỹ,Rn)

β̃a
(tn,ỹ,Rn) + w̃(tn,ỹ − ξ,Rn) − w̃(tn,ỹ,Rn)

,
28where Cn does not depend on η. Notice also that, by (B.8), we have
limsup
n→∞
ũ(tn,ỹ + ξ,Sn) − w̃(tn,ỹ + ξ,Rn) ≤ ũ(t̃,ỹ + ξ,S̃) − w̃(t̃,ỹ + ξ,S̃) ≤ ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃),
and similarly
limsup
n→∞
ũ(tn,ỹ − ξ,Sn) − w̃(tn,ỹ − ξ,Rn) ≤ ũ(t̃,ỹ − ξ,S̃) − w̃(t̃,ỹ − ξ,S̃) ≤ ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃).
Therefore, sending η to 0 and using the facts that ũ,w̃ ∈ Ξ and the functions β̃b
,β̃a
,λ̄b
,λ̄a
are continuous,
we can find a sequence (ζn)n such that ζn −→ 0 as n → ∞ and
ρ(ũ(tn,ỹ,Sn) − w̃(tn,ỹ,Rn)) ≤ ζn +
∂
∂t
ϕ(tn,Sn,Rn)
+
1
2
σ2

∂2
∂S2
ϕ(tn,Sn,Rn) +
∂2
∂R2
ϕ(tn,Sn,Rn) + 2
∂2
∂S∂R
ϕ(tn,Sn,Rn)

.
Now sending n → ∞ yields
ρ

ũ(t̃,ỹ,S̃) − w̃(t̃,ỹ,S̃)

≤
∂
∂t
ϕ(t̃,S̃,S̃) +
1
2
σ2

∂2
∂S2
ϕ(t̃,S̃,S̃) +
∂2
∂R2
ϕ(t̃,S̃,S̃) + 2
∂2
∂S∂R
ϕ(t̃,S̃,S̃)

.
But it is clear that for µ > 0 large enough, the right-hand side of this inequality is negative, which contradicts
(B.8) as ρ > 0.
We conclude this section with the following result.
Corollary 1. The value function v is continuous. Moreover, it is the only viscosity solution to the HJB
QVI (3.4) in Ξ with terminal condition v(T,y,S) = 0 for (y,S) ∈ Q × R.
Proof. We know that v is in Ξ and is a viscosity solution to the HJB QVI (3.4). In particular, v∗
is a
viscosity subsolution to (3.4) and v∗ is a viscosity supersolution to (3.4). We also know from Propositon 4
that v∗
(T,y,S) = v∗(T,y,S) = 0 for all (y,S) ∈ Q × R.
Hence v∗
and v∗ verify the assumptions of Proposition 5 and we obtain v∗ ≥ v∗
on T×Q×R. But by definition
we also have v∗ ≤ v ≤ v∗
on T×Q×R, so we can conclude that v∗ = v = v∗
, and in particular v is continuous.
Let us now assume that we have an other viscosity solution V ∈ Ξ to the HJB QVI (3.4) with terminal
condition V (T,y,S) = 0 for all (y,S) ∈ Q × R. Using the same reasoning, V is necessarily continuous.
Because V is a subsolution to (3.4) and v is a supersolution to (3.4), and as v(T,y,S) = V (T,y,S) = 0 for
all (y,S) ∈ Q × R, we know by Proposition 5 that V ≤ v on T × Q × R. But we also have that V is a
supersolution and v a subsolution to (3.4), which gives us V ≥ v on T×Q×R. Therefore, we obtain V = v,
which proves the result.
References
Adams, H., Salem, M., Zinsmeister, N., Reynolds, S., Adams, A., Pote, W., Toda, M., Henshaw, A., Williams,
E., and Robinson, D. (2023). Uniswap v4 core [draft].
Adams, H., Zinsmeister, N., Salem, M., Keefer, R., and Robinson, D. (2021). Uniswap v3 core. Tech. rep.,
Uniswap, Tech. Rep.
Agarwal, A. and Gobet, E. (2025). Optimal exit from uniswap v3 and best expected return for a liquidity
provider.
Angeris, G. and Chitra, T. (2020). Improved price oracles: Constant function market makers. In Proceedings
of the 2nd ACM Conference on Advances in Financial Technologies, pages 80–91.
29Angeris, G., Kao, H.-T., Chiang, R., Noyes, C., and Chitra, T. (2020). An analysis of uniswap markets.
Cryptoeconomic Systems Journal.
Aoyagi, J. (2020). Liquidity provision by automated market makers. Available at SSRN 3674178.
Aoyagi, J. and Ito, Y. (2025). Coexisting exchange platforms: Limit order books and automated market
makers. Journal of Political Economy Microeconomics, 3(3):000–000.
Aqsha, A., Bergault, P., and Sánchez-Betancourt, L. (2025). Equilibrium reward for liquidity providers in
automated market makers. arXiv preprint arXiv:2503.22502.
Baggiani, L., Herdegen, M., and Sánchez-Betancourt, L. (2025). Optimal dynamic fees in automated market
makers. arXiv preprint arXiv:2506.02869.
Barbon, A. and Ranaldo, A. (2021). On the quality of cryptocurrency markets: Centralized versus decen-
tralized exchanges. arXiv preprint arXiv:2112.07386.
Bergault, P., Bertucci, L., Bouba, D., and Guéant, O. (2024a). Automated market makers: Mean-variance
analysis of lps payoffs and design of pricing functions. Digital Finance, 6(2):225–247.
Bergault, P., Bertucci, L., Bouba, D., Guéant, O., and Guilbert, J. (2024b). Automated market making:
the case of pegged assets. arXiv preprint arXiv:2411.08145.
Bergault, P., Bertucci, L., Bouba, D., Guéant, O., and Guilbert, J. (2024c). Price-aware automated market
makers: Models beyond brownian prices and static liquidity. arXiv preprint arXiv:2405.03496.
Campbell, S., Bergault, P., Milionis, J., and Nutz, M. (2025). Optimal fees for liquidity provision in auto-
mated market makers. arXiv preprint arXiv:2508.08152.
Canidio, A. and Fritsch, R. (2023). Arbitrageurs’ profits, lvr, and sandwich attacks: batch trading as an
amm design response. arXiv preprint arXiv:2307.02074.
Cao, D., Falk, B. H., Kogan, L., and Tsoukalas, G. (2025). A structural model of automated market making.
Available at SSRN 4591447.
Capponi, A. and Jia, R. (2021). The adoption of blockchain-based decentralized exchanges. arXiv preprint
arXiv:2103.08842.
Capponi, A. and Zhu, B. (2025). Optimal exiting for liquidity provision in constant function market makers.
Available at SSRN 5148585.
Cartea, Á., Drissi, F., and Monga, M. (2024a). Decentralized finance and automated market making:
Predictable loss and optimal liquidity provision. SIAM Journal on Financial Mathematics, 15(3):931–959.
Cartea, Á., Drissi, F., and Monga, M. (2025). Decentralised finance and automated market making: Execu-
tion and speculation. Journal of Economic Dynamics and Control, page 105134.
Cartea, Á., Drissi, F., Sánchez-Betancourt, L., Siska, D., and Szpruch, L. (2024b). Strategic bonding curves
in automated market makers. Available at SSRN 5018420.
Clark, J. (2020). The replicating portfolio of a constant product market. Available at SSRN 3550601.
Clark, J. (2021). The replicating portfolio of a constant product market with bounded liquidity. Available
at SSRN 3898384.
Evans, A., Angeris, G., and Chitra, T. (2021). Optimal fees for geometric mean market makers. In Interna-
tional Conference on Financial Cryptography and Data Security, pages 65–79. Springer.
Fan, Z., Marmolejo-Cossio, F., Moroz, D. J., Neuder, M., Rao, R., and Parkes, D. C. (2021). Strategic
liquidity provision in uniswap v3. arXiv preprint arXiv:2106.12033.
30Fleming, W. H. and Soner, H. M. (2006). Controlled Markov Processes and Viscosity Solutions. Springer.
Fritsch, R., Käser, S., and Wattenhofer, R. (2022). The economics of automated market makers. In Pro-
ceedings of the 4th ACM Conference on Advances in Financial Technologies, pages 102–110.
Fukasawa, M., Maire, B., and Wunsch, M. (2024). Model-free hedging of impermanent loss in geometric
mean market makers with proportional transaction fees. Applied Mathematical Finance, 31(2):108–129.
Fukasawa, M., Maire, B., and Wunsch, M. (2025). Liquidity provision of utility indifference type in decen-
tralized exchanges. Digital Finance, pages 1–19.
Hasbrouck, J., Rivera, T. J., and Saleh, F. (2022). The need for fees at a dex: How increases in fees can
increase dex trading volume. Available at SSRN, 4192925.
Hasbrouck, J., Rivera, T. J., and Saleh, F. (2025). An economic model of a decentralized exchange with
concentrated liquidity. Management Science.
He, X. D., Yang, C., and Zhou, Y. (2025). Arbitrage on decentralized exchanges. arXiv preprint
arXiv:2507.08302.
Lehar, A. and Parlour, C. (2025). Decentralized exchange: The uniswap automated market maker. The
Journal of Finance, 80(1):321–374.
Longstaff, F. A. and Schwartz, E. S. (2001). Valuing american options by simulation: A simple least-squares
approach. The Review of Financial Studies, 14(1):113–147.
Ma, R., Cai, Z., Tang, W., and Yao, D. (2025). Optimal decisions for liquid staking: Allocation and exit
timing. arXiv preprint arXiv:2507.14810.
Milionis, J., Moallemi, C. C., and Roughgarden, T. (2023). A myersonian framework for optimal liquidity
provision in automated market makers. arXiv preprint arXiv:2303.00208.
Milionis, J., Moallemi, C. C., and Roughgarden, T. (2024). Automated market making and arbitrage profits
in the presence of fees. In International Conference on Financial Cryptography and Data Security, pages
159–171. Springer.
Milionis, J., Moallemi, C. C., Roughgarden, T., and Zhang, A. L. (2022). Automated market making and
loss-versus-rebalancing. arXiv preprint arXiv:2208.06046.
Touzi, N. (2012). Optimal stochastic control, stochastic target problems, and backward SDE, volume 29.
Springer Science & Business Media.
Acknowledgment
The authors would like to thank Bruno Bouchard and Olivier Guéant for their insightful comments.
Statement on Potential Conflicts of Interest
The second author is a PhD student at Université Paris Dauphine–PSL, funded by the Research Initiative
“Blockchain et Intelligence Artificielle pour les infrastructures de marché,” under the aegis of the Institut
Europlace de Finance, in partnership with LCH SA (an LSEG business). The authors bear sole responsibility
for the content of this publication, which does not reflect the views or practices of LCH SA.
Statement on Data Availability
The data that support the findings of this study are available from the authors upon reasonable request.
31Statement on ChatGPT Usage
ChatGPT was used solely for language refinement and editing. All content, ideas, and analyses are original
and remain the sole responsibility of the authors.
Statement on open access
For the purpose of open access, the authors have applied a CC BY public copyright licence to any author
accepted manuscript version arising from this submission.
32