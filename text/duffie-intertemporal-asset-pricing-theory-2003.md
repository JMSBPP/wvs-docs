---
sha256: 0fa17c0944712b4543cb86e5698de76bbf6d88a2b68c1bb6205a82dc25012f8c
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 271466
---
Intertemporal Asset Pricing Theory
Darrell Duffie
Stanford University1
Draft: July 4, 2002
Contents
## 1 Introduction 3
## 2 Basic Theory 4
## 2.1 Setup . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
## 2.2 Arbitrage, State Prices, and Martingales . . . . . . . . . . . . 5
## 2.3 Individual Agent Optimality . . . . . . . . . . . . . . . . . . . 8
## 2.4 Habit and Recursive Utilities . . . . . . . . . . . . . . . . . . . 9
## 2.5 Equilibrium and Pareto Optimality . . . . . . . . . . . . . . . 12
## 2.6 Equilibrium Asset Pricing . . . . . . . . . . . . . . . . . . . . 14
## 2.7 Breeden’s Consumption-Based CAPM . . . . . . . . . . . . . 16
## 2.8 Arbitrage and Martingale Measures . . . . . . . . . . . . . . . 17
## 2.9 Valuation of Redundant Securities . . . . . . . . . . . . . . . . 19
## 2.10 American Exercise Policies and Valuation . . . . . . . . . . . . 21
## 3 Continuous-Time Modeling 26
## 3.1 Trading Gains for Brownian Prices . . . . . . . . . . . . . . . 26
## 3.2 Martingale Trading Gains . . . . . . . . . . . . . . . . . . . . 28
## 3.3 The Black-Scholes Option-Pricing Formula . . . . . . . . . . . 30
## 3.4 Ito’s Formula . . . . . . . . . . . . . . . . . . . . . . . . . . . 34
## 3.5 Arbitrage Modeling . . . . . . . . . . . . . . . . . . . . . . . . 36
## 3.6 Numeraire Invariance . . . . . . . . . . . . . . . . . . . . . . . 37
## 3.7 State Prices and Doubling Strategies . . . . . . . . . . . . . . 37
1
I am grateful for impetus from George Constantinides and René Stulz, and for inspi-
ration and guidance from many collaborators and Stanford colleagues. Address: Grad-
uate School of Business, Stanford University, Stanford CA 94305-5015 USA; or email at
duffie@stanford.edu. The latest draft can be downloaded at www.stanford.edu/∼duffie/.
Some portions of this survey are revised from original material in Dynamic Asset Pricing
Theory, Third Edition, copyright Princeton University Press, 2002.
13.8 Equivalent Martingale Measures . . . . . . . . . . . . . . . . . 38
## 3.9 Girsanov and Market Prices of Risk . . . . . . . . . . . . . . . 39
## 3.10 Black-Scholes Again . . . . . . . . . . . . . . . . . . . . . . . 43
## 3.11 Complete Markets . . . . . . . . . . . . . . . . . . . . . . . . 44
## 3.12 Optimal Trading and Consumption . . . . . . . . . . . . . . . 46
## 3.13 Martingale Solution to Merton’s Problem . . . . . . . . . . . . 50
## 4 Term-Structure Models 54
## 4.1 One-Factor Models . . . . . . . . . . . . . . . . . . . . . . . . 55
## 4.2 Term-Structure Derivatives . . . . . . . . . . . . . . . . . . . . 60
## 4.3 Fundamental Solution . . . . . . . . . . . . . . . . . . . . . . 63
## 4.4 Multifactor Term-Structure Models . . . . . . . . . . . . . . . 64
## 4.5 Affine Models . . . . . . . . . . . . . . . . . . . . . . . . . . . 66
## 4.6 The HJM Model of Forward Rates . . . . . . . . . . . . . . . 69
## 5 Derivative Pricing 73
## 5.1 Forward and Futures Prices . . . . . . . . . . . . . . . . . . . 73
## 5.2 Options and Stochastic Volatility . . . . . . . . . . . . . . . . 76
## 5.3 Option Valuation by Transform Analysis . . . . . . . . . . . . 80
## 6 Corporate Securities 84
## 6.1 Endogenous Default Timing . . . . . . . . . . . . . . . . . . . 85
## 6.2 Example: Brownian Dividend Growth . . . . . . . . . . . . . . 87
## 6.3 Taxes, Bankruptcy Costs, Capital Structure . . . . . . . . . . 91
## 6.4 Intensity-Based Modeling of Default . . . . . . . . . . . . . . . 93
## 6.5 Zero-Recovery Bond Pricing . . . . . . . . . . . . . . . . . . . 96
## 6.6 Pricing with Recovery at Default . . . . . . . . . . . . . . . . 98
## 6.7 Default-Adjusted Short Rate . . . . . . . . . . . . . . . . . . . 99
21 Introduction
This is a survey of “classical” intertemporal asset pricing theory. A central
objective of this theory is to reduce asset-pricing problems to the identifica-
tion of “state prices,” a notion of Arrow [1953] from which any security has
an implied value as the weighted sum of its future cash flows, state by state,
time by time, with weights given by the associated state prices. Such state
prices may be viewed as the marginal rates of substitution among state-time
consumption opportunities, for any unconstrained investor, with respect to
a numeraire good. Under many types of market imperfections, state prices
may not exist, or may be of relatively less use or meaning. While market im-
perfections constitute an important thrust of recent advances in asset pricing
theory, they will play a limited role in this survey, given the limitations of
space and the priority that should be accorded to first principles based on
perfect markets.
Section 2 of this survey provides the conceptual foundations of the broader
theory in a simple discrete-time setting. After extending the basic modeling
approach to a continuous-time setting in Section 3, we turn in Section 4 to
term-structure modeling, in Section 5 to derivative pricing, and in Section 6
to corporate securities.
The theory of optimal portfolio and consumption choice is closely linked
to the theory of asset pricing, for example through the relationship between
state prices and marginal rates of substitution at optimality. While this
connection is emphasized, for example in Sections 2.3-2.4 and 3.12-3.13, the
theory of optimal portfolio and consumption choice, particularly in dynamic
incomplete-markets settings, has become so extensive as to defy a proper
summary in the context of a reasonably sized survey of asset-pricing theory.
The interested reader is especially directed to the treatments of Karatzas
and Shreve [1998], Schroder and Skiadas [1999], and Schroder and Skiadas
[2000].
For ease of reference, as there is at most one theorem per sub-section, we
refer to a theorem by its subsection number, and likewise for lemmas and
propositions. For example, the unique proposition of Section 2.9 is called
“Proposition 2.9.”
32 Basic Theory
Radner [1967] and Radner [1972] originated our standard approach to a dy-
namic equilibrium of “plans, prices, and expectations,” extending the static
approach of Arrow [1953] and Debreu [1953].2
After formulating this stan-
dard model, this section provides the equivalence of no arbitrage and state
prices, and shows how state prices may be derived from investors’ marginal
rates of substitution among state-time consumption opportunities. Given
state prices, we examine pricing derivative securities, such as European and
American options, whose payoffs can be replicated by trading the underlying
primitive securities.
## 2.1 Setup
We begin for simplicity with a setting in which uncertainty is modeled as
some finite set Ω of states, with associated probabilities. We fix a set F of
events, called a tribe, also known as a σ-algebra, which is the collection of
subsets of Ω that can be assigned a probability. The usual rules of probability
apply.3
We let P(A) denote the probability of an event A.
There are T + 1 dates: 0,1,...,T. At each of these, a tribe Ft ⊂ F
is the set of events corresponding to the information available at time t.
Any event in Ft is known at time t to be true or false. We adopt the
usual convention that Ft ⊂ Fs whenever t ≤ s, meaning that events are
never “forgotten.” For simplicity, we also take it that events in F0 have
probability 0 or 1, meaning roughly that there is no information at time
t = 0. Taken altogether, the filtration F = {F0,...,FT}, sometimes called
an information structure, represents how information is revealed through
time. For any random variable Y , we let Et(Y ) = E(Y |Ft) denote the
conditional expectation of Y given Ft. In order to simplify things, for any
two random variables Y and Z, we always write “Y = Z” if the probability
that Y 6= Z is zero.
An adapted process is a sequence X = {X0,...,XT } such that, for each
t, Xt is a random variable with respect to (Ω, Ft). Informally, this means
2
The model of Debreu [1953] appears in Chapter 7 of Debreu [1959]. For more details
in a finance setting, see Dothan [1990]. The monograph by Magill and Quinzii [1996] is a
comprehensive survey of the theory of general equilibrium in a setting such as this.
3
The triple (Ω, F, P) is a probability space, as defined for example by Jacod and
Protter [2000].
4that Xt is observable at time t. An adapted process X is a martingale if, for
any times t and s > t, we have Et(Xs) = Xt.
A security is a claim to an adapted dividend process, say δ, with δt denot-
ing the dividend paid by the security at time t. Each security has an adapted
security-price process S, so that St is the price of the security, ex dividend, at
time t. That is, at each time t, the security pays its dividend δt and is then
available for trade at the price St. This convention implies that δ0 plays no
role in determining ex-dividend prices. The cum-dividend security price at
time t is St + δt.
We suppose that there are N securities defined by an RN
-valued adapted
dividend process δ = (δ(1)
,...,δ(N)
). These securities have some adapted
price process S = (S(1)
,...,S(N)
). A trading strategy is an adapted process
θ in RN
. Here, θt represents the portfolio held after trading at time t. The
dividend process δθ
generated by a trading strategy θ is defined by
δθ
t = θt−1 · (St + δt) − θt · St, (1)
with “θ−1” taken to be zero by convention.
## 2.2 Arbitrage, State Prices, and Martingales
Given a dividend-price pair (δ,S) for N securities, a trading strategy θ is
an arbitrage if δθ
> 0 (that is, if δθ
≥ 0 and δθ
6= 0). An arbitrage is thus
a trading strategy that costs nothing to form, never generates losses, and,
with positive probability, will produce strictly positive gains at some time.
One of the precepts of modern asset pricing theory is a notion of efficient
markets under which there is no arbitrage. This is reasonable axiom, for in
the presence of an arbitrage, any rational investor who prefers to increase his
dividends would undertake such arbitrages without limit, so markets could
not be in equilibrium, in a sense that we shall see more formally later in
this section. We will first explore the implications of no arbitrage for the
representation of security prices in terms of “state prices,” the first step
toward which is made with the following result.
Proposition. There is no arbitrage if and only if there is a strictly positive
adapted process π such that, for any trading strategy θ,
E
T X
t=0
πtδθ
t
!
= 0.
5Proof: Let Θ denote the space of trading strategies. For any θ and ϕ in Θ
and scalars a and b, we have aδθ
+bδϕ
= δaθ+bϕ
. Thus, the marketed subspace
M = {δθ
: θ ∈ Θ} of dividend processes generated by trading strategies is a
linear subspace of the space L of adapted processes.
Let L+ = {c ∈ L : c ≥ 0}. There is no arbitrage if and only if the cone
L+ and the marketed subspace M intersect precisely at zero. Suppose there
is no arbitrage. The Separating Hyperplane Theorem, in a version for closed
convex cones that is sometimes called Stiemke’s Lemma (see Appendix B
of Duffie [2001]) implies the existence of a nonzero linear functional F such
that F(x) < F(y) for each x in M and each nonzero y in L+. Since M is a
linear subspace, this implies that F(x) = 0 for each x in M, and thus that
F(y) > 0 for each nonzero y in L+. This implies that F is strictly increasing.
By the Riesz representation theorem, for any such linear function F there is
a unique adapted process π, called the Riesz representation of F, such that
F(x) = E
T X
t=0
πtxt
!
, x ∈ L.
As F is strictly increasing, π is strictly positive, that is, P(πt > 0) = 1 for
all t.
The converse follows from the fact that if δθ
> 0 and π is a strictly positive
process, then E
PT
t=0 πtδθ
t

> 0.
For convenience, we call any strictly positive adapted process a deflator.
A deflator π is a state-price density if, for all t,
St =
1
πt
Et
T X
j=t+1
πjδj
!
. (2)
A state-price density is sometimes called a state-price deflator, a pricing
kernel, or a marginal-rate-of-substitution process.
For t = T, the right-hand side of (2) is zero, so ST = 0 whenever there
is a state-price density. It can be shown as an exercise that a deflator π is a
state-price density if and only if, for any trading strategy θ,
θt · St =
1
πt
Et
T X
j=t+1
πjδθ
j
!
, t < T, (3)
6meaning roughly that the market value of a trading strategy is, at any time,
the state-price discounted expected future dividends generated by the strat-
egy.
The gain process G for (δ,S) is defined by Gt = St +
Pt
j=1 δj, the price
plus accumulated dividend. Given a deflator γ, the deflated gain process Gγ
is defined by Gγ
t = γtSt +
Pt
j=1 γjδj. We can think of deflation as a change
of numeraire.
Theorem. The dividend-price pair (δ,S) admits no arbitrage if and only if
there is a state-price density. A deflator π is a state-price density if and only
if ST = 0 and the state-price-deflated gain process Gπ
is a martingale.
Proof: It can be shown as an easy exercise that a deflator π is a state-price
density if and only if ST = 0 and the state-price-deflated gain process Gπ
is
a martingale.
Suppose there is no arbitrage. Then ST = 0, for otherwise the strategy θ
is an arbitrage when defined by θt = 0, t < T, θT = −ST . By the previous
proposition, there is some deflator π such that E(
PT
t=0 δθ
t πt) = 0 for any
strategy θ.
We must prove (2), or equivalently, that Gπ
is a martingale. Doob’s
Optional Sampling Theorem states that an adapted process X is a martingale
if and only if E(Xτ) = X0 for any stopping time τ ≤ T. Consider, for an
arbitrary security n and an arbitrary stopping time τ ≤ T, the trading
strategy θ defined by θ(k)
= 0 for k 6= n and θ
(n)
t = 1, t < τ, with θ
(n)
t =
0, t ≥ τ. Since E(
PT
t=0 πtδθ
t ) = 0, we have
E −S
(n)
0 π0 +
τ X
t=1
πtδ
(n)
t + πτS(n)
τ
!
= 0,
implying that the π-deflated gain process Gn,π
of security n satisfies Gn,π
0 =
E (Gn,π
τ ). Since τ is arbitrary, Gn,π
is a martingale, and since n is arbitrary,
Gπ
is a martingale.
This shows that absence of arbitrage implies the existence of a state-price
density. The converse is easy.
The proof is motivated by those of Harrison and Kreps [1979] and Harri-
son and Pliska [1981] for a similar result to follow in this section regarding the
notion of an “equivalent martingale measure.” Ross [1987], Prisman [1985],
Kabanov and Stricker [2001], and Schachermayer [2001] show the impact of
taxes or transactions costs on the state-pricing model.
72.3 Individual Agent Optimality
We introduce an agent, defined by a strictly increasing4
utility function U
on the set L+ of nonnegative adapted “consumption” processes, and by an
endowment process e in L+. Given a dividend-price process (δ,S), a trading
strategy θ leaves the agent with the total consumption process e + δθ
. Thus
the agent has the budget-feasible consumption set
C = {e + δθ
∈ L+ : θ ∈ Θ},
and the problem
sup
c∈C
U(c). (4)
The existence of a solution to (4) implies the absence of arbitrage. Con-
versely, if U is continuous,5
then the absence of arbitrage implies that there
exists a solution to (4). (This follows from the fact that the feasible con-
sumption set C is compact if and only if there there is no arbitrage.)
Assuming that (4) has a strictly positive solution c∗
and that U is contin-
uously differentiable at c∗
, we can use the first-order conditions for optimality
to characterize security prices in terms of the derivatives of the utility func-
tion U at c∗
. Specifically, for any c in L, the derivative of U at c∗
in the
direction c is g0
(0), where g(α) = U(c∗
+ αc) for any scalar α sufficiently
small in absolute value. That is, g0
(0) is the marginal rate of improvement of
utility as one moves in the direction c away from c∗
. This directional deriva-
tive is denoted ∇U(c∗
;c). Because U is continuously differentiable at c∗
, the
function that maps c to ∇U(c∗
;c) is linear. Since δθ
is a budget-feasible
direction of change for any trading strategy θ, the first-order conditions for
optimality of c∗
imply that
∇U(c∗
;δθ
) = 0, θ ∈ Θ.
We now have a characterization of a state-price density.
Proposition. Suppose that (4) has a strictly positive solution c∗
and that U
has a strictly positive continuous derivative at c∗
. Then there is no arbitrage
4
A function f : L → R is strictly increasing if f(c) > f(b) whenever c > b.
5
For purposes of checking continuity or the closedness of sets in L, we will say that
cn converges to c if E[
PT
t=0 |cn(t) − c(t)|] → 0. Then U is continuous if U(cn) → U(c)
whenever cn → c.
8and a state-price density is given by the Riesz representation π of ∇U(c∗
),
defined by
∇U(c∗
;x) = E
T X
t=0
πtxt
!
, x ∈ L.
The Riesz Rrepresentation of the utility gradient is also sometimes called the
marginal-rates-of-substitution process. Despite our standing assumption that
U is strictly increasing, ∇U(c∗
; ·) need not in general be strictly increasing,
but is so if U is concave.
As an example, suppose U has the additive form
U(c) = E
" T X
t=0
ut(ct)
#
, c ∈ L+, (5)
for some ut : R+ → R, t ≥ 0. It is an exercise to show that if ∇U(c) exists,
then
∇U(c;x) = E
" T X
t=0
u0
t(ct)xt
#
. (6)
If, for all t, ut is concave with an unbounded derivative and e is strictly
positive, then any solution c∗
to (4) is strictly positive.
Corollary. Suppose U is defined by (5). Under the conditions of the Propo-
sition, for any time t < T,
St =
1
u0
t(c∗
t )
Et

u0
t+1(c∗
t+1)(St+1 + δt+1

.
This result is often called the stochastic Euler equation, made famous in a
time-homogeneous Markov setting by Lucas [1978]. A precursur is due to
LeRoy [1973].
## 2.4 Habit and Recursive Utilities
The additive utility model is extremely restrictive, and routinely found to
be inconsistent with experimental evidence on choice under uncertainty, as
for example in Plott [1986]. We will illustrate the state pricing associated
with some simple extensions of the additive utility model, such as “habit-
formation” utility and “recursive utility.”
9An example of a habit-formation utility is some U : L+ → R with
U(c) = E
" T X
t=0
u(ct,ht)
#
,
where u : R+ × R → R is continuously differentiable and, for any t, the
“habit” level of consumption is defined by ht =
Pt
j=1 αjct−j for some α ∈ RT
+.
For example, we could take αj = γj
for γ ∈ (0,1), which gives geometrically
declining weights on past consumption. A natural motivation is that the
relative desire to consume may be increased if one has become accustomed to
high levels of consumption. By applying the chain rule, we can calculate the
Riesz representation π of the gradient of U at a strictly positive consumption
process c as
πt = uc(ct,ht) + Et
X
s>t
uh(cs,hs)αs−t
!
,
where uc and uh denote the partial derivatives of u with respect to its first
and second arguments, respectively. The habit-formation utility model was
developed by Dunn and Singleton [1986] and in continuous time by Ryder and
Heal [1973], and has been applied to asset pricing problems by Constantinides
[1990], Sundaresan [1989], and Chapman [1998].
Recursive utility, inspired by Koopmans [1960], Kreps and Porteus [1978],
and Selden [1978], was developed for general discrete-time multi-period asset-
pricing applications by Epstein and Zin [1989], who take a utility of the form
U(c) = V0, where the “utility process” V is defined recursively, backward in
time from T, by
Vt = F(ct,∼ Vt+1 |Ft),
where ∼ Vt+1 |Ft denotes the probability distribution of Vt+1 given Ft, where
F is a measurable real-valued function whose first argument is a non-negative
real number and whose second argument is a probability distribution, and fi-
nally where we take VT+1 to be a fixed exogenously specified random variable.
One may view Vt as the utility at time t for present and future consumption,
noting the dependence on the future consumption stream through the con-
ditional distribution of the following period’s utility. As a special case, for
example, consider
F(x,m) = f (x,E[h(Ym)]), (7)
where f is a function in two real variables, h(·) is a “felicity” function in one
variable, and Ym is any random variable whose probability distribution is m.
10This special case of the “Kreps-Porteus utility” aggregates the role of the
conditional distribution of future consumption through an “expected utility
of next period’s utility.” If h and J are concave and increasing functions,
then U is concave and increasing. If h(v) = v and if f(x,y) = u(x) + βy for
some u : R+ → R and constant β > 0, then (for VT+1 = 0) we recover the
special case of additive utility given by
U(c) = E
"
X
t
βt
u(ct)
#
.
“Non-expected-utility” aggregation of future consumption utility can be
based, for example, upon the local-expected-utility model of Machina [1982]
and the betweenness-certainty-equivalent model of Chew [1983], Chew [1989],
Dekel [1989], and Gul and Lantto [1990]. With recursive utility, as opposed
to additive utility, it need not be the case that the degree of risk aversion is
completely determined by the elasticity of intertemporal substitution.
For the special case (7) of expected-utility aggregation, with differentia-
bility throughout, we have the utility gradient representation
πt = f1 (ct,Et[h(Vt+1)])
Y
s<t
f2 (cs,Es[h(Vs+1)])Es[h0
(Vs+1)],
where fi denotes the partial derivative of f with respect to its i-th argument.
Recursive utility allows for preference over early or late resolution of un-
certainty (which have no impact on additive utility). This is relevant for
asset prices, as for example in the context of remarks by Ross [1989], and as
shown by Skiadas [1998] and Duffie, Schroder, and Skiadas [1997]. Grant,
Kajii, and Polak [2000] have more to say on preferences for the resolution of
information.
The equilibrium state-price density associated with recursive utility is
computed in a Markovian setting by Kan [1995].6
For further justification
and properties of recursive utility, see Chew and Epstein [1991], Skiadas
[1998], and Skiadas [1997]. For further implications for asset pricing, see
Epstein [1988], Epstein [1992], Epstein and Zin [1999], and Giovannini and
Weil [1989].
6
Kan [1993] further explored the utility gradient representation of recursive utility in
this setting.
112.5 Equilibrium and Pareto Optimality
Now, we explore the implications of multi-agent equilibrium for state prices.
A key objective is to link state prices with important macro-economic vari-
ables that are, hopefully, observable, such as total economy-wide consump-
tion.
Suppose there are m agents. Agent i is defined as above by a strictly
increasing utility function Ui : L+ → R and an endowment process e(i)
in
L+. Given a dividend process δ for N securities, an equilibrium is a collection
(θ(1)
,...,θ(m)
,S), where S is a security-price process and, for each agent i,
θ(i)
is a trading strategy solving
sup
θ∈Θ
Ui(e(i)
+ δθ
),
with
Pm
i=1 θ(i)
= 0.
We define markets to be complete if, for each process x in L, there is
some trading strategy θ with δθ
t = xt, t ≥ 1. Complete markets thus means
that any consumption process x can be obtained by investing some amount
at time 0 in a trading strategy that, at each future period t, generates the
dividend xt.
The First Welfare Theorem is that complete-markets equilbria provide
efficient consumption allocations. Specifically, an allocation (c(1)
,...,c(m)
)
of consumption processes to the m agents is feasible if c(1)
+ ··· + c(m)
≤
e(1)
+ ... + e(m)
, and is Pareto optimal if there is no feasible allocation
(b(1)
,...,b(m)
) such that Ui(b(i)
) ≥ Ui(c(i)
) for all i, with strict inequality
for some i. Any equilibrium (θ(1)
,...,θ(m)
,S) has an associated feasible con-
sumption allocation (c(1)
,...,c(m)
) defined by letting c(i)
−e(i)
be the dividend
process generated by θ(i)
.
First Welfare Theorem. Suppose (θ(1)
,...,θ(m)
,S) is an equilibrium and
markets are complete. Then the associated consumption allocation is Pareto
optimal.
An easy proof due to Arrow [1951] is obtained by contradiction. Suppose,
with the objective of obtaining a contradiction, that (c(1)
,...,c(m)
) is the
consumption allocation of a complete-markets equilibrium and that there is
a feasible allocation (b(1)
,...,b(m)
) such that Ui(b(i)
) ≥ Ui(c(i)
) for all i, with
strict inequality for some i. Because of equilibrium, there is no arbitrage,
and therefore a state-price density π. For any consumption process x, let
12π · x = E (
P
t πtxt). We have π · b(i)
≥ π · c(i)
, for otherwise, given complete
markets, the utility of c(i)
can be increased strictly by some feasible trading
strategy generating b(i)
−e(i)
. Similarly, for at least some agent, we also have
π · b(i)
> π · c(i)
. Thus
π ·
X
i
b(i)
> π ·
X
i
c(i)
= π ·
X
i
e(i)
,
the equality from the market-clearing condition
P
i θ(i)
= 0. This is impossi-
ble, however, for feasibility implies that
P
i b(i)
≤
P
i e(i)
. This contradiction
implies the result.
Duffie and Huang [1985] characterize the number of securities necessary
for complete markets. Roughly speaking, extending the spanning insight of
Arrow [1953] to allow for dynamic spanning, it is necessary (and generically
sufficient) that there are at least as many securities as the maximal number
of mutually exclusive events of positive conditional probability that could be
revealed between two dates. For example, if the information generated at
each date is that of a coin toss, then complete markets requires a minimum
of two securities, and almost any two will suffice. Cox, Ross, and Rubinstein
[1979] provide the classical example in which one of the original securities has
“binomial” returns and the other has riskless returns. That is, S = (Y,Z)
is strictly positive, and, for all t < T, we have δt = 0, Yt+1/Yt a Bernoulli
trial, and Zt+1/Zt a constant. More generally, however, to be assured of
complete markets given the minimal number of securities, one must verify
that the price process, which is endogenous, is not among the rare set that is
associated with a reduced market span, a point emphasized by Hart [1975]
and dealt with by Magill and Shafer [1990]. In general, the dependence of
the marketed subspace on endogenous security price processes makes the
demonstration and calculation of an equilibrium problematic. Conditions for
the generic existence of equilibrium in incomplete markets are given by Duffie
and Shafer [1985] and Duffie and Shafer [1986]. The literature on this topic
is extensive.7
7
Bottazzi [1995] has a somewhat more advanced version of existence in single-period
multiple-commodity version. Related existence topics are studied by Bottazzi and Hens
[1996], Hens [1991], and Zhou [1997]. The literature is reviewed in depth by Geanakoplos
[1990]. Alternative proofs of existence of equilibrium are given in the 2-period version of
the model by Geanakoplos and Shafer [1990], Hirsch, Magill, and Mas-Colell [1990], and
Husseini, Lasry, and Magill [1990]; and in a T-period version by Florenzano and Gourdel
[1994]. If one defines security dividends in nominal terms, rather than in units of con-
13Hahn [1994] raises some philosophical issues regarding the possibility of
complete markets and efficiency, in a setting in which endogenous uncertainty
may be of concern to investors. The Pareto inefficiency of incomplete markets
equilibrium consumption allocations, and notions of constrained efficiency,
are discussed by Hart [1975], Kreps [1979] (and references therein), Citanna,
Kajii, and Villanacci [1994], Citanna and Villanacci [1993], Pan [1993], and
Pan [1995].
The optimality of individual portfolio and consumption choices in incom-
plete markets in this setting is given a dual interpretation by He and Pagès
[1993]. (Girotto and Ortu [1994] offer related remarks.) Methods for com-
putation of equilibrium with incomplete markets are developed by Brown,
DeMarzo, and Eaves [1996a], Brown, DeMarzo, and Eaves [1996b], Cuoco
and He [1992], DeMarzo and Eaves [1996], and Dumas and Maenhout [2002].
Kraus and Litzenberger [1975] and Stapleton and Subrahmanyam [1978] gave
early parametric examples of equilibrium.
## 2.6 Equilibrium Asset Pricing
We will review a representative-agent state-pricing model of Constantinides
[1982]. The idea is to deduce a state-price density from aggregate, rather than
individual, consumption behavior. Among other advantages, this allows for
a version of the consumption-based capital asset pricing model of Breeden
[1979] in the special case of locally-quadratic utility.
We define, for each vector λ in Rm
+ of “agent weights,” the utility function
Uλ : L+ → R by
Uλ(x) = sup
(c(1),...,c(m))
m X
i=1
λi Ui(ci
) subject to c(1)
+ ··· + c(m)
≤ x. (8)
Proposition. Suppose for all i that Ui is concave and strictly increasing.
Suppose that (θ(1)
,...,θ(m)
,S) is an equilibrium and that markets are com-
sumption, then equilibria always exist under standard technical conditions on preferences
and endowments, as shown by Cass [1984], Werner [1985], Duffie [1987], and Gottardi
and Hens [1996], although equilibrium may be indeterminate, as shown by Cass [1989]
and Geanakoplos and Mas-Colell [1989]. On this point, see also Kydland and Prescott
[1991], Mas-Colell [1991], and Cass [1991]. Surveys of general equilibrium models in in-
complete markets settings are given by Cass [1991], Duffie [1992], Geanakoplos [1990],
Magill and Quinzii [1996], and Magill and Shafer [1991]. Hindy and Huang [1993] show
the implications of linear collateral constraints on security valuation.
14plete. Then there exists some nonzero λ ∈ Rm
+ such that (0,S) is a (no-trade)
equilibrium for the one-agent economy [(Uλ,e),δ], where e = e(1)
+···+e(m)
.
With this λ and with x = e = e(1)
+ ··· + e(m)
, problem (8) is solved by the
equilibrium consumption allocation.
A method of proof, as well as the intuition for this proposition, is that
with complete markets, a state-price density π represents Lagrange multipli-
ers for consumption in the various periods and states for all of the agents
simultaneously, as well as for some representative agent (Uλ,e), whose agent-
weight vector λ defines a hyperplane separating the set of feasible utility
improvements from Rm
+. (See, for example, Duffie [2001] for details. This
notion of “representative agent” is weaker than that associated with aggre-
gation in the sense of Gorman [1953].)
Corollary 1. If, moreover, Uλ is continuously differentiable at e, then λ can
be chosen so that a state-price density is given by the Riesz representation of
∇Uλ(e).
Corollary 2. Suppose, for each i, that Ui is of the additive form
Ui(c) = E
" T X
t=0
uit(ct)
#
.
Then Uλ is also additive, with
Uλ(c) = E
" T X
t=0
uλt(ct)
#
,
where
uλt(y) = sup
x∈Rm
+
m X
i=1
λi uit(xi) subject to x1 + ··· + xm ≤ y.
In this case, the differentiability of Uλ at e implies that for any times t and
τ ≥ t,
St =
1
u0
λt(et)
Et
"
u0
λτ(eτ)Sτ +
τ X
j=t+1
u0
λj(ej)δj
#
. (9)
152.7 Breeden’s Consumption-Based CAPM
The consumption-based capital asset pricing model (CAPM) of Breeden
[1979] extends the results of Rubinstein [1976] by showing that, if agents
have additive utility that is, locally, quadratic, then expected asset returns
are linear with respect to their covariances with aggregate consumption, as
will be stated more carefully shortly. Notably, the result does not depend
on complete markets. Locally quadratic additive utility is an extremely
strong assumption. (It does not violate monotonicity, as utility need not
be quadratic at all levels.) Breeden actually worked in a continuous-time
setting of Brownian information, reviewed shortly, within which smooth ad-
ditive utility functions are automatically locally quadratic, in a sense that is
sufficient to recover a continuous-time analogue of the following consumption-
based CAPM.8
In a one-period setting, the consumption-based CAPM cor-
responds to the classical CAPM of Sharpe [1964].
First, we need some preliminary definitions. The return at time t + 1 on
a trading strategy θ whose market value θt · St is non-zero is
Rθ
t+1 =
θt · (St+1 + δt+1)
θt · St
.
There is short-term riskless borrowing if, for each given time t < T, there
is a trading strategy θ with Ft-conditionally deterministic return, denoted
rt. We refer to the sequence {r0,r1,...,rT−1} of such short-term risk-free
returns as the associated “short-rate process,” even though rT is not defined.
Conditional on Ft, we let vart(·) and covt(·) denote variance and covariance,
respectively.
Proposition. (Consumption-Based CAPM) Suppose, for each agent i, that
the utility Ui(·) is of the additive form Ui(c) = E
hPT
t=0 uit(ct)
i
, and more-
over that, for equilibrium consumption processes c(1)
,...,c(m)
, we have u0
it(c
(i)
t ) =
ait +bitc
(i)
t , where ait and bit > 0 are constants. Let S be the associated equi-
librium price process of the securities. Then, for any time t,
St = AtEt(δt+1 + St+1) − Bt Et[(St+1 + δt+1)et+1],
for adapted strictly positive scalar processes A and B. For a given time t,
suppose that there is riskless borrowing at the short rate rt. Then there is
8
For a theorem and proof, see Duffie and Zame [1989].
16a trading strategy with the property that its return R∗
t+1 has maximal Ft-
conditional correlation with the aggregate consumption et+1 (among all trad-
ing strategies). Suppose, moreover, that there is riskless borrowing at the
short rate rt and that vart(R∗
t+1) is strictly positive. Then, for any trading
strategy θ with return Rθ
t+1,
Et(Rθ
t+1 − rt) = βθ
t Et(R∗
t+1 − rt),
where
βθ
t =
covt(Rθ
t+1,R∗
t+1)
vart(R∗
t+1)
.
The essence of the result is that expected returns of any security, in excess of
risk-free rates, are increasing in the degree to which the security’s return de-
pends (in the sense of regression) on aggregate consumption. This is natural;
there is an average preference in favor of securities that are hedges against
aggregate economic performance. While the consumption-based CAPM does
not depend on complete markets, its reliance on locally-quadratic expected
utility, and otherwise perfect markets, is limiting, and its empirical perfor-
mance is mixed, at best. For some evidence, see for example Hansen and
Jaganathan [1990].
## 2.8 Arbitrage and Martingale Measures
This section shows the equivalence between the absence of arbitrage and the
existence of a “risk-neutral” probabilities, under which, roughly speaking,
the price of a security is the sum of its expected discounted dividends. This
idea, stemming from Cox and Ross [1976], was developed into the notion of
equivalent martingale measures by Harrison and Kreps [1979].
We suppose throughout this subsection that there is short-term riskless
borrowing at some uniquely defined short-rate process r. We can define, for
any times t and τ ≤ T,
Rt,τ = (1 + rt)(1 + rt+1)···(1 + rτ−1),
the payback at time τ of one unit of account borrowed risklessly at time t
and “rolled over” in short-term borrowing repeatedly until date τ.
It would be a simple situation, both computationally and conceptually,
if any security’s price were merely the expected discounted dividends of the
17security. Of course, this is unlikely to be the case in a market with risk-averse
investors. We can nevertheless come close to this sort of characterization of
security prices by adjusting the original probability measure P. For this, we
define a new probability measure Q to be equivalent to P if Q and P assign
zero probabilities to the same events. An equivalent probability measure Q
is an equivalent martingale measure if
St = EQ
t
T X
j=t+1
δj
Rt,j
!
, t < T,
where EQ
denotes expectation under Q, and EQ
t (X) = EQ
(X |Ft) for any
random variable X.
It is easy to show that Q is an equivalent martingale measure if and only
if, for any trading strategy θ,
θt · St = EQ
t
T X
j=t+1
δθ
j
Rt,j
!
, t < T. (10)
We will show that the absence of arbitrage is equivalent to the existence of
an equivalent martingale measure.
The deflator γ defined by γt = R−1
0,t defines the discounted gain process Gγ
,
by Gγ
t = γtSt +
Pt
j=1 γjδj. The word “martingale” in the term “equivalent
martingale measure” comes from the following equivalence.
Lemma. A probability measure Q equivalent to P is an equivalent martin-
gale measure for (δ,S) if and only if ST = 0 and the discounted gain process
Gγ
is a martingale with respect to Q.
If, for example, a security pays no dividends before T, then the property
described by the lemma is that the discounted price process is a Q-martingale.
We already know that the absence of arbitrage is equivalent to the exis-
tence of a state-price density π. A probability measure Q equivalent to P
can be defined in terms of a Radon-Nikodym derivative, a strictly positive
random variable dQ
dP
with E(dQ
dP
) = 1, via the definition of expectation with
respect to Q given by EQ
(Z) = E(dQ
dP
Z), for any random variable Z. We will
consider the measure Q defined by dQ
dP
= ξT, where
ξT =
πT R0,T
π0
.
18(Indeed, one can check by applying the definition of a state-price density to
the payoff R0,T that ξT is strictly positive and of expectation 1.) The density
process ξ for Q is defined by ξt = Et(ξT ). Bayes Rule implies that for any
times t and j > t, and any Fj-measurable random variable Zj,
EQ
t (Zj) =
1
ξt
Et(ξjZj). (11)
Fixing some time t < T, consider a trading strategy θ that invests one
unit of account at time t and repeatedly rolls the value over in short-term
riskless borrowing until time T, with final value Rt,T . That is, θt ·St = 1 and
δθ
T = Rt,T . Relation (3) then implies that
πt = Et(πT Rt,T ) =
Et(πT R0,T )
R0,t
=
Et(ξTπ0)
R0,t
=
ξtπ0
R0,t
. (12)
From (11), (12), and the definition of a state-price density, (10) is satisfied, so
Q is indeed an equivalent martingale measure. We have shown the following
result.
Theorem. There is no arbitrage if and only if there exists an equivalent
martingale measure. Moreover, π is a state-price density if and only if an
equivalent martingale measure Q has the density process ξ defined by ξt =
R0,tπt/π0.
This martingale approach simplifies many asset-pricing problems that
might otherwise appear to be quite complex, and applies much more generally
than indicated here. For example, the assumption of short-term borrowing is
merely a convenience, and one can typically obtain an equivalent martingale
measure after normalizing prices and dividends by the price of some partic-
ular security (or trading strategy). Girotto and Ortu [1996] present general
results of this type for this finite-dimensional setting. Dalang, Morton, and
Willinger [1990] gave a general discrete-time result on the equivalence of no
arbitrage and the existence of an equivalent martingale measure, covering
even the case with infinitely many states.
## 2.9 Valuation of Redundant Securities
Suppose that the dividend-price pair (δ,S) for the N given securities is
arbitrage-free, with an associated state-price density π. Now consider the
19introduction of a new security with dividend process δ̂ and price process Ŝ.
We say that δ̂ is redundant given (δ,S) if there exists a trading strategy θ,
with respect to only the original security dividend-price process (δ,S), that
replicates δ̂, in the sense that δθ
t = δ̂t, t ≥ 1.
If δ̂ is redundant given (δ,S), then the absence of arbitrage for the “aug-
mented” dividend-price process [(δ,δ̂),(S,Ŝ)] implies that Ŝt = Yt, where
Yt =
1
πt
Et
T X
j=t+1
πjδ̂j
!
, t < T.
If this were not the case, there would be an arbitrage, as follows. For example,
suppose that for some stopping time τ, we have Ŝτ > Yτ, and that τ ≤ T
with strictly positive probability. We can then define the strategy:
(a) Sell the redundant security δ̂ at time τ for Ŝτ, and hold this position
until T.
(b) Invest θτ · Sτ at time τ in the replicating strategy θ, and follow this
strategy until T.
Since the dividends generated by this combined strategy (a)-(b) after τ are
zero, the only dividend is at τ, for the amount Ŝτ − Yτ > 0, which means
that this is an arbitrage. Likewise, if Ŝτ < Yτ for some non-trivial stopping
time τ, the opposite strategy is an arbitrage. We have shown the following.
Proposition. Suppose (δ,S) is arbitrage-free with state-price density π. Let
δ̂ be a redundant dividend process with price process Ŝ. Then the augmented
dividend-price pair [(δ,δ̂),(S,Ŝ)] is arbitrage-free if and only if it has π as a
state-price density.
In applications, it is often assumed that (δ,S) generates complete mar-
kets, in which case any additional security is redundant, as in the classical
“binomial” model of Cox, Ross, and Rubinstein [1979], and its continuous-
time analogue, the Black-Scholes option pricing model, coming up in the next
section.
Complete markets means that every new security is redundant.
Theorem. Suppose that FT = F and there is no arbitrage. Then markets
are complete if and only if there is a unique equivalent martingale measure.
Banz and Miller [1978] and Breeden and Litzenberger [1978] explore the
ability to deduce state prices from the valuation of derivative securities.
202.10 American Exercise Policies and Valuation
We now extend our pricing framework to include a family of securities, called
“American,” for which there is discretion regarding the timing of cash flows.
Given an adapted process X, each finite-valued stopping time τ generates
a dividend process δX,τ
defined by δX,τ
t = 0, t 6= τ, and δX,τ
τ = Xτ. In this
context, a finite-valued stopping time is an exercise policy, determining the
time at which to accept payment. Any exercise policy τ is constrained by
τ ≤ τ, for some expiration time τ ≤ T. (In what follows, we might take τ to
be a stopping time, which is useful for the case of certain knockout options.)
We say that (X,τ) defines an American security. The exercise policy is
selected by the holder of the security. Once exercised, the security has no
remaining cash flows. A standard example is an American put option on
a security with price process p. The American put gives the holder of the
option the right, but not the obligation, to sell the underlying security for a
fixed exercise price at any time before a given expiration time τ. If the option
has an exercise price K and expiration time τ < T, then Xt = (K − pt)+
,
t ≤ τ, and Xt = 0, t > τ.
We will suppose that, in addition to an American security (X,τ), there are
securities with an arbitrage-free dividend-price process (δ,S) that generates
complete markets. The assumption of complete markets will dramatically
simplify our analysis since it implies, for any exercise policy τ, that the
dividend process δX,τ
is redundant given (δ,S). For notational convenience,
we assume that 0 < τ < T.
Let π be a state-price density associated with (δ,S). From Proposition
2.9, given any exercise policy τ, the American security’s dividend process
δX,τ
has an associated cum-dividend price process, say V τ
, which, in the
absence of arbitrage, satisfies
V τ
t =
1
πt
Et (πτXτ), t ≤ τ.
This value does not depend on which state-price density is chosen because,
with complete markets, state-price densities are identical up to a positive
scaling.
We consider the optimal stopping problem
V ∗
0 ≡ max
τ∈T (0)
V τ
0 , (13)
21where, for any time t ≤ τ, we let T (t) denote the set of stopping times
bounded below by t and above by τ. A solution to (13) is called a rational
exercise policy for the American security X, in the sense that it maximizes
the initial arbitrage-free value of the resulting claim. Merton [1973] was the
first to attack American option valuation systematically using this arbitrage-
based viewpoint.
We claim that, in the absence of arbitrage, the actual initial price V0 for
the American security must be V ∗
0 . In order to see this, suppose first that
V ∗
0 > V0. Then one could buy the American security, adopt for it a rational
exercise policy τ, and also undertake a trading strategy replicating −δX,τ
.
Since V ∗
0 = E(πτXτ)/π0, this replication involves an initial payoff of V ∗
0 , and
the net effect is a total initial dividend of V ∗
0 − V0 > 0 and zero dividends
after time 0, which defines an arbitrage. Thus the absence of arbitrage easily
leads to the conclusion that V0 ≥ V ∗
0 . It remains to show that the absence
of arbitrage also implies the opposite inequality V0 ≤ V ∗
0 .
Suppose that V0 > V ∗
0 . One could sell the American security at time 0
for V0. We will show that for an initial investment of V ∗
0 , one can “super-
replicate” the payoff at exercise demanded by the holder of the American
security, regardless of the exercise policy used. Specifically, a super-replicating
trading strategy for (X,τ,δ,S) is a trading strategy θ involving only the
securities with dividend-price process (δ,S) that has the properties:
(a) δθ
t = 0 for 0 < t < τ, and
(b) V θ
t ≥ Xt for all t ≤ τ,
where V θ
t is the cum-dividend market value of θ at time t. Regardless of
the exercise policy τ used by the holder of the security, the payment of
Xτ demanded at time τ is dominated by the market value V θ
t of a super-
replicating strategy θ. (In effect, one modifies θ by liquidating the portfolio θτ
at time τ, so that the actual trading strategy ϕ associated with the arbitrage
is defined by ϕt = θt for t < τ and ϕt = 0 for t ≥ τ.) Now, suppose θ
is super-replicating, with V θ
0 = V ∗
0 . If, indeed, V0 > V ∗
0 then the strategy
of selling the American security and adopting a super-replicating strategy,
liquidating at exercise, effectively defines an arbitrage.
This notion of arbitrage for American securities, an extension of the def-
inition of arbitrage used earlier, is reasonable because a super-replicating
strategy does not depend on the exercise policy adopted by the holder (or
22sequence of holders over time) of the American security. It would be unrea-
sonable to call a strategy involving a short position in the American security
an “arbitrage” if, in carrying it out, one requires knowledge of the exercise
policy for the American security that will be adopted by other agents that
hold the security over time, who may after all act “irrationally.”
The approach to American security valuation given here is similar to the
continuous-time treatments of Bensoussan [1984] and Karatzas [1988], who
do not formally connect the valuation of American securities with the absence
of arbitrage, but rather deal with the similar notion of “fair price.”
Proposition. Given (X,τ,δ,S), suppose (δ,S) is arbitrage free and gener-
ates complete markets. Then there is a super-replicating trading strategy θ
for (X,τ,δ,S) with the initial value V θ
0 = V ∗
0 .
In order to construct a super-replicating strategy with the desired prop-
erty, we will make a short excursion into the theory of optimal stopping. For
any process Y in L, the Snell envelope W of Y is defined by
Wt = max
τ∈T (t)
Et(Yτ), 0 ≤ t ≤ τ.
It can be shown that, naturally, for any t < τ, Wt = max[Yt,Et(Wt+1)],
which can be viewed as the Bellman equation for optimal stopping. Thus
Wt ≥ Et(Wt+1), implying that W is a supermartingale, implying that we can
decompose W in the form W = Z − A, for some martingale Z and some
increasing adapted9
process A with A0 = 0.
In order to prove the above proposition, we define Y by Yt = Xtπt, and
let W, Z, and A be defined as above. By the definition of complete markets,
there is a trading strategy θ with the property that
• δθ
t = 0 for 0 < t < τ;
• δθ
τ = Zτ/πτ;
• δθ
t = 0 for t > τ.
Property (a) defining a super-replicating strategy is satisfied by this strategy
θ. From the fact that Z is a martingale and the definition of a state-price
density, the cum-dividend value V θ
satisfies
πtV θ
t = Et(πτδθ
τ) = Et(Zτ) = Zt, t ≤ τ. (14)
9
More can be said, in that At can be taken to be Ft−1-measurable.
23From (14) and the fact that A0 = 0, we know that V θ
0 = V ∗
0 because Z0 =
W0 = π0V ∗
0 . Since Zt − At = Wt ≥ Yt for all t, from (14) we also know that
V θ
t =
Zt
πt
≥
1
πt
(Yt + At) = Xt +
At
πt
≥ Xt, t ≤ τ,
the last inequality following from the fact that At ≥ 0 for all t. Thus the
dominance property (b) defining a super-replicating strategy is also satisfied,
and θ is indeed a super-replicating strategy with V θ
0 = V ∗
0 . This proves the
proposition and implies that, unless there is an arbitrage, the initial price V0
of the American security is equal to the market value V ∗
0 associated with a
rational exercise policy.
The Snell envelope W is also the key to showing that a rational exercise
policy is given by the the dynamic-programming solution τ0
= min{t : Wt =
Yt}. In order to verify this, suppose that τ is a rational exercise policy. Then
Wτ = Yτ. (This can be seen from the fact that Wτ ≥ Yτ, and if Wτ > Yτ
then τ cannot be rational.) From this fact, any rational exercise policy τ has
the property that τ ≥ τ0
. For any such τ, we have
Eτ0[Y (τ)] ≤ W(τ0
) = Y (τ0
),
and the law of iterated expectations implies that E[Y (τ)] ≤ E[Y (τ0
)], so τ0
is indeed rational. We have shown the following.
Theorem. Given (X,τ,δ,S), suppose that (δ,S) admits no arbitrage and
generates completes markets. Let π be a state-price deflator. Let W be the
Snell envelope of Xπ up to the expiration time τ. Then a rational exercise
policy for (X,τ,δ,S) is given by τ0
= min{t : Wt = πtXt}. The unique initial
cum-dividend arbitrage-free price of the American security is
V ∗
0 =
1
π0
E

X(τ0
)π(τ0
)

.
In terms of the equivalent martingale measure Q defined in Section 2.8,
we can also write the optimal stopping problem (13) in the form
V ∗
0 = max
τ∈T (0)
EQ

Xτ
R0,τ

. (15)
An optimal exercise time is τ0
= min{t : V ∗
t = Xt}, where V ∗
t = Wt/πt is the
price of the American option at time t. This representation of the rational-
exercise problem is sometimes convenient. For example, let us consider the
24case of an American call option on a security with price process p. We
have Xt = (pt − K)+
for some exercise price K. Suppose the underlying
security has no dividends before or at the expiration time τ. We suppose
positive interest rates, meaning that Rt,s ≥ 1 for all t and s ≥ t. With these
assumptions, we will show that it is never optimal to exercise the call option
before its expiration date τ. This property is sometimes called “no early
exercise,” or “better alive than dead.”
We define the “discounted price process” p∗
by p∗
t = pt/R0,t. The fact
that the underlying security pays dividends only after the expiration time τ
implies , by Lemma 2.8, that p∗
is a Q-martingale at least up to the expiration
time τ. That is, for t ≤ s ≤ τ, we have EQ
t (p∗
s) = p∗
t .
With positive interest rates, we have, for any stopping time τ ≤ τ,
EQ

1
R0,τ
(pτ − K)+

= EQ
"
p∗
τ −
K
R0,τ
+
#
= EQ
"
EQ
τ

p∗
τ −
K
R0,τ
+
!#
≤ EQ
"
EQ
τ

p∗
τ −
K
R0,τ
+
!#
= EQ
"
p∗
τ −
K
R0,τ
+
#
≤ EQ
"
p∗
τ −
K
R0,τ
+
#
= EQ

1
R0,τ
(pτ − K)+

,
the first inequality by Jensen’s inequality, the second by the positivity of
interest rates. It follows that τ is a rational exercise policy. In typical cases,
τ is the unique rational exercise policy.
If the underlying security pays dividends before expiration, then early
exercise of the American call is, in certain cases, optimal. From the fact
that the put payoff is increasing in the strike price (as opposed to decreasing
for the call option), the second inequality above is reversed for the case of
a put option, and one can guess that early exercise of the American put is
sometimes optimal.
25Difficulties can arise with the valuation of American securities in incom-
plete markets. For example, the exercise policy may play a role in determin-
ing the marketed subspace, and therefore a role in pricing securities. If the
state-price density depends on the exercise policy, it could even turn out that
the notion of a rational exercise policy is not well defined.
## 3 Continuous-Time Modeling
Many problems are more tractable, or have solutions appearing in a more
natural form, when treated in a continuous-time setting. We first introduce
the Brownian model of uncertainty and continuous security trading, and then
derive partial differential equations for the arbitrage-free prices of derivative
securities. The classic example is the Black-Scholes option-pricing formula.
We then examine the connection between equivalent martingale measures and
the “market price of risk” that arises from Girsanov’s Theorem. Finally, we
briefly connect the theory of security valuation with that of optimal portfolio
and consumption choice, using the elegant martingale approach of Cox and
Huang [1989].
## 3.1 Trading Gains for Brownian Prices
We fix a probability space (Ω,F,P). A process is a measurable10
function on
Ω×[0,∞) into R. The value of a process X at time t is the random variable
variously written as Xt, X(t), or X(·,t) : Ω → R. A standard Brownian
motion is a process B defined by the properties:
(a) B0 = 0 almost surely;
(b) Normality: for any times t and s > t, Bs − Bt is normally distributed
with mean zero and variance s − t;
(c) Independent increments: for any times t0,...,tn such that 0 ≤ t0 < t1 <
··· < tn < ∞, the random variables B(t0), B(t1) − B(t0), ...,B(tn) −
B(tn−1) are independently distributed; and
(d) Continuity: for each ω in Ω, the sample path t 7→ B(ω,t) is continuous.
10
See Duffie [2001] for technical definitions not provided here.
26It is a nontrivial fact, whose proof has a colorful history, that (Ω,F,P) can
be constructed so that there exist standard Brownian motions. In perhaps
the first scientific work involving Brownian motion, Bachelier [1900] proposed
Brownian motion as a model of stock prices. We will follow his lead for the
time being and suppose that a given standard Brownian motion B is the
price process of a security. Later we consider more general classes of price
processes.
We fix the standard filtration F = {Ft : t ≥ 0} of B, defined for example
in Protter [1990]. Roughly speaking,11
Ft is the set of events that can be
distinguished as true or false by observation of B until time t.
Our first task is to build a model of trading gains based on the possibility
of continual adjustment of the position held. A trading strategy is an adapted
process θ specifying at each state ω and time t the number θt(ω) of units of
the security to hold. If a strategy θ is a constant, say θ, between two dates
t and s > t, then the total gain between those two dates is θ(Bs − Bt),
the quantity held multiplied by the price change. So long as the trading
strategy θ is piecewise constant, we would have no difficulty in defining the
total gain between any two times. For example, suppose, for some stopping
times T0,...,TN with 0 = T0 < T1 < ··· < TN = T, and for any n, we have
θ(t) = θ(Tn−1) for all t ∈ [Tn−1,Tn). Then we define the total gain from trade
as
Z T
0
θt dBt =
N X
n=1
θ(Tn−1)[B(Tn) − B(Tn−1)]. (16)
More generally, in order to make for a good model of trading gains for
trading strategies that are not necessarily piecewise constant, a trading strat-
egy θ is required to satisfy the technical condition that
RT
0
θ2
t dt < ∞ almost
surely for each T. We let L2
denote the space of adapted processes satisfying
this integrability restriction. For each θ in L2
there is an adapted process
with continuous sample paths, denoted
R
θdB, that is called the stochastic
integral of θ with respect to B. A full definition of
R
θdB is outlined in a
standard source such as Karatzas and Shreve [1988].
The value of the stochastic integral
R
θdB at time T is usually denoted
RT
0
θt dBt, and represents the total gain generated up to time T by trading
the security with price process B according to the trading strategy θ. The
stochastic integral
R
θdB has the properties that one would expect from a
11
The standard filtation is augmented, so that Ft contains all null sets of F.
27good model of trading gains. In particular, (16) is satisfied for piece-wise
constant θ, and in general the stochastic integral is linear, in that, for any θ
and ϕ in L2
and any scalars a and b, the process aθ + bϕ is also in L2
, and,
for any time T > 0,
Z T
0
(aθt + bϕt)dBt = a
Z T
0
θt dBt + b
Z T
0
ϕt dBt. (17)
## 3.2 Martingale Trading Gains
The properties of standard Brownian motion imply that B is a martingale.
(This follows basically from the property that its increments are independent
and of zero expectation.) One must impose technical conditions on θ, how-
ever, in order to ensure that
R
θdB is also a martingale. This is natural; it
should be impossible to generate an expected profit by trading a security that
never experiences an expected price change. The following basic proposition
can be found, for example, in Protter [1990].
Proposition. If E
RT
0
θ2
t dt
1/2

< ∞ for all T > 0, then
R
θdB is a
martingale.
As a model of security-price processes, standard Brownian motion is too
restrictive for most purposes. Consider, more generally, an Ito process, mean-
ing a process S of the form
St = x +
Z t
0
µs ds +
Z t
0
σs dBs, (17)
where x is a real number, σ is in L2
, and µ is in L1
, meaning that µ is
an adapted process such that
R t
0
|µs|ds < ∞ almost surely for all t. It is
common to write (17) in the informal “differential” form
dSt = µt dt + σt dBt.
One often thinks intuitively of dSt as the “increment” of S at time t, made
up of two parts, the “locally riskless” part µt dt, and the “locally uncertain”
part σt dBt.
28In order to further interpret this differential representation of an Ito pro-
cess, suppose that σ and µ have continuous sample paths and are bounded.
It is then literally the case that for any time t,
d
dτ
Et (Sτ)
τ=t
= µt almost surely (18)
and
d
dτ
vart (Sτ)
τ=t
= σ2
t almost surely, (19)
where the derivatives are taken from the right, and where, for any random
variable X with finite variance, vart(X) ≡ Et(X2
) − [Et(X)]2
is the Ft-
conditional variance of X. In this sense of (18) and (19), we can interpret
µt as the rate of change of the expectation of S, conditional on information
available at time t, and likewise interpret σ2
t as the rate of change of the
conditional variance of S at time t. One sometimes reads the associated
abuses of notation “Et(dSt) = µt dt” and “vart(dSt) = σ2
t dt.” Of course, dSt
is not even a random variable, so this sort of characterization is not rigorously
justified and is used purely for its intuitive content. We will refer to µ and
σ as the drift and diffusion processes of S, respectively.
For an Ito process S of the form (17), let L(S) be the set whose elements
are processes θ with {θt µt : t ≥ 0} in L1
and {θt σt : t ≥ 0} in L2
. For θ in
L(S), we define the stochastic integral
R
θdS as the Ito process
R
θdS given
by Z T
0
θt dSt =
Z T
0
θtµt dt +
Z T
0
θtσt dBt, T ≥ 0.
Assuming no dividends, we also refer to
R
θdS as the gain process generated
by the trading stragegy θ, given the price process S.
We will have occasion to refer to adapted processes θ and ϕ that are equal
almost everywhere, by which we mean that E(
R ∞
0
|θt − ϕt|dt) = 0. In fact,
we shall write “θ = ϕ” whenever θ = ϕ almost everywhere. This is a natural
convention, for suppose that X and Y are Ito processes with X0 = Y0 and
with dXt = µt dt+σt dBt and dYt = at dt+bt dBt. Since stochastic integrals
are defined for our purposes as continuous-sample-path processes, it turns out
that Xt = Yt for all t almost surely if and only if µ = a almost everywhere
and σ = b almost everywhere. We call this the unique decomposition property
of Ito processes.
Ito’s Formula is the basis for explicit solutions to asset-pricing problems
in a continuous-time setting.
29Ito’s Formula. Suppose X is an Ito process with dXt = µt dt + σt dBt and
f : R2
→ R is twice continuously differentiable. Then the process Y , defined
by Yt = f(Xt,t), is an Ito process with
dYt =

fx(Xt,t)µt + ft(Xt,t) +
1
2
fxx(Xt,t)σ2
t

dt + fx(Xt,t)σt dBt.
A generalization of Ito’s Formula appears later in this section.
## 3.3 The Black-Scholes Option-Pricing Formula
We turn to one of the most important ideas in finance theory, the model of
Black and Scholes [1973] for pricing options. Together with the method of
proof provided by Robert Merton, this model revolutionized the practice of
derivative pricing and risk management, and has changed the entire path of
asset-pricing theory.
Consider a security, to be called a stock, with price process
St = xeαt+σB(t)
, t ≥ 0,
where x > 0, α, and σ are constants. Such a process, called a geometric
Brownian motion, is often called log-normal because, for any t, log(St) =
log(x) + αt+σBt is normally distributed. Moreover, since Xt ≡ αt+σBt = Rt
0
αds+
Rt
0
σdBs defines an Ito process X with constant drift α and diffusion
σ, Ito’s Formula implies that S is an Ito process and that
dSt = µSt dt + σSt dBt; S0 = x,
where µ = α+σ2
/2. From (18) and (19), at any time t, the rate of change of
the conditional mean of St is µSt, and the rate of change of the conditional
variance is σ2
S2
t , so that, per dollar invested in this security at time t, one
may think of µ as the “instantaneous” expected rate of return, and σ as
the “instantaneous” standard deviation of the rate of return. The coefficient
σ is also known as the volatility of S. A geometric Brownian motion is
a natural two-parameter model of a security-price process because of these
simple interpretations of µ and σ.
Consider a second security, to be called a bond, with the price process β
defined by
βt = β0 ert
, t ≥ 0,
30for some constants β0 > 0 and r. We have the obvious interpretation of r as
the continually compounding short rate. Since {rt : t ≥ 0} is trivially an Ito
process, β is also an Ito process with
dβt = rβt dt.
A pair (a,b) consisting of trading strategies a for the stock and b for the
bond is said to be self-financing if it generates no dividends before T (either
positive or negative), meaning that, for all t,
atSt + btβt = a0S0 + b0β0 +
Z t
0
au dSu +
Z t
0
bu dβu. (20)
This self-financing condition, conveniently defined by Harrison and Kreps
[1979], is merely a statement that the current portfolio value (on the left-
hand side) is precisely the initial investment plus any trading gains, and
therefore that no dividend “inflow” or “outflow” is generated.
Now consider a third security, an option. We begin with the case of a
European call option on the stock, giving its owner the right, but not the
obligation, to buy the stock at a given exercise price K on a given exercise
date T. The option’s price process Y is as yet unknown except for the fact
that YT = (ST − K)+
≡ max(ST − K, 0), which follows from the fact that
the option is rationally exercised if and only if ST > K.
Suppose that the option is redundant, in that there exists a self-financing
trading strategy (a,b) in the stock and bond with aT ST + bT βT = YT. If
a0S0 + b0β0 < Y0, then one could sell the option for Y0, make an initial
investment of a0S0+b0β0 in the trading strategy (a,b), and at time T liquidate
the entire portfolio (−1,aT ,bT ) of option, stock, and bond with payoff −YT +
aT ST +bTβT = 0. The initial profit Y0−a0S0−b0β0 > 0 is thus riskless, so the
trading strategy (−1,a,b) would be an arbitrage. Likewise, if a0S0 + b0β0 >
Y0, the strategy (1,−a,−b) is an arbitrage. Thus, if there is no arbitrage,
Y0 = a0S0 + b0β0. The same arguments applied at each date t imply that
in the absence of arbitrage, Yt = atSt + btβt. A full and careful definition
of continuous-time arbitrage will be given later, but for now we can proceed
without much ambiguity at this informal level. Our immediate objective is
to show the following.
The Black-Scholes Formula. If there is no arbitrage, then, for all t < T,
Yt = C(St,t), where
C(x,t) = xΦ(z) − e−r(T−t)
KΦ

z − σ
√
T − t

, (21)
31with
z =
log(x/K) + (r + σ2
/2)(T − t)
σ
√
T − t
,
where Φ is the cumulative standard normal distribution function.
The Black and Scholes [1973] formula was extended by Merton [1973]
and Merton [1977], and subsequently given literally hundreds of further ex-
tensions and applications. Cox and Rubinstein [1985] is a standard reference
on options, while Hull [2000] has further applications and references.
We will see different ways to arrive at the Black-Scholes formula. Al-
though not the shortest argument, the following is perhaps the most obvious
and constructive.12
We start by assuming that Yt = C(St,t), t < T, without knowledge
of the function C aside from the assumption that it is twice continuously
differentiable on (0,∞) × [0,T) (allowing an application of Ito’s Formula).
This will lead us to deduce (21), justifying the assumption and proving the
result at the same time.
Based on our assumption that Yt = C(St,t) and Ito’s Formula,
dYt = µY (t)dt + Cx(St,t)σSt dBt, t < T, (22)
where
µY (t) = Cx(St,t)µSt + Ct(St,t) +
1
2
Cxx(St,t)σ2
S2
t .
Now suppose there is a self-financing trading strategy (a,b) with
atSt + btβt = Yt, t ∈ [0,T]. (23)
This assumption will also be justified shortly. Equations (20) and (23), along
with the linearity of stochastic integration, imply that
dYt = at dSt + bt dβt = (atµSt + btβtr)dt + atσSt dBt. (24)
Based on the unique decomposition property of Ito processes, in order that
the trading strategy (a,b) satisfies both (22) and (24), we must “match
coefficients separately in both dBt and dt.” Specifically, we choose at so
12
The line of exposition here is based on Gabay [1982] and Duffie [1988]. Andreasen,
Jensen, and Poulsen [1998] provide numerous alternative methods of deriving the Black-
Scholes Formula. The basic approach of using continuous-time self-financing strategies as
the basis for making arbitrage arguments is due to Merton [1977].
32that atσSt = Cx(St,t)σSt; for this, we let at = Cx(St,t). From (23) and
Yt = C(St,t), we then have Cx(St,t)St + btβt = C(St,t), or
bt =
1
βt
[C(St,t) − Cx(St,t)St]. (25)
Finally, “matching coefficients in dt” from (22) and (24) leaves, for t < T,
−rC(St,t) + Ct(St,t) + rStCx(St,t) +
1
2
σ2
S2
t Cxx(St,t) = 0. (26)
In order for (26) to hold, it is enough that C satisfies the partial differ-
ential equation (PDE)
−rC(x,t) + Ct(x,t) + rxCx(x,t) +
1
2
σ2
x2
Cxx(x,t) = 0, (27)
for (x,t) ∈ (0,∞)×[0,T). The fact that YT = C(ST ,T) = (ST −K)+
supplies
the boundary condition:
C(x,T) = (x − K)+
, x ∈ (0,∞). (28)
By direct calculation of derivatives, one can show as an exercise that (21) is
a solution to (27)-(28). All of this seems to confirm that C(S0,0), with C
defined by the Black-Scholes formula (21), is a good candidate for the initial
price of the option. In order to confirm this pricing, suppose to the con-
trary that Y0 > C(S0,0), where C is defined by (21). Consider the strategy
(−1,a,b) in the option, stock, and bond, with at = Cx(St,t) and bt given by
(25) for t < T. We can choose aT and bT arbitrarily so that (23) is satis-
fied; this does not affect the self-financing condition (20) because the value of
the trading strategy at a single point in time has no effect on the stochastic
integral. The result is that (a,b) is self-financing by construction and that
aT ST + bT βT = YT = (ST − K)+
. This strategy therefore nets an initial
riskless profit of
Y0 − a0S0 − b0β0 = Y0 − C(S0,0) > 0,
which defines an arbitrage. Likewise, if Y0 < C(S0,0), the trading strategy
(+1,−a,−b) is an arbitrage. Thus, it is indeed a necessary condition for
the absence of arbitrage that Y0 = C(S0,0). Sufficiency is a more delicate
matter. Under mild technical conditions on trading strategies that will follow,
33the Black-Scholes formula for the option price is also sufficient for the absence
of arbitrage.
Transactions costs play havoc with the sort of reasoning just applied. For
example, if brokerage fees are any positive fixed fraction of the market value
of stock trades, the stock-trading strategy a constructed above would call
for infinite total brokerage fees, since, in effect, the number of shares traded
is infinite! Leland [1985] has shown, nevertheless, that the Black-Scholes
formula applies approximately, for small proportional transacations costs,
once one artificially elevates the volatility parameter to compensate for the
transactions costs.
## 3.4 Ito’s Formula
Ito’s Formula is extended to the case of multidimensional Brownian motion
as follows. A standard Brownian motion in Rd
is defined by B = (B1
,...,Bd
)
in Rd
, where B1
,...,Bd
are independent standard Brownian motions. We fix
a standard Brownian motion B in Rd
, restricted to some time interval [0,T],
on a given probability space (Ω,F,P). We also fix the standard filtration
F = {Ft : t ∈ [0,T]} of B. For simplicity, we take F to be FT . For an
Rd
-valued process θ = (θ(1)
,...,θ(d)
) with θ(i)
in L2
for each i, the stochastic
integral
R
θdB is defined by
Z t
0
θs dBs =
d X
i=1
Z t
0
θ(i)
s dBi
s. (29)
An Ito process is now defined as one of the form
Xt = x +
Z t
0
µs ds +
Z t
0
θs dBs,
where µ is a drift (with
R t
0
|µs|ds < ∞ almost surely) and
Rt
0
θs dBs is defined
as in (29). In this case, we call θ the diffusion of X.
We say that X = (X(1)
,...,X(N)
) an Ito process in RN
if, for each i,
X(i)
is an Ito process. The drift of X is the RN
-valued process µ whose i-th
coordinate is the drift of X(i)
. The diffusion of X is the RN×d
-matrix-valued
process σ whose i-th row is the diffusion of X(i)
. In this case, we use the
notation
dXt = µt dt + σt dBt. (30)
34Ito’s Formula. Suppose X is the Ito process in RN
given by (30) and f :
RN
× [0,∞) × R is C2,1
; that is, f has at least two continuous derivatives
with respect to its first (x) argument, and at least one continuous derivative
with respect to its second (t) argument. Then {f(Xt,t) : t ≥ 0} is an Ito
process and, for any time t,
f(Xt,t) = f(X0,0) +
Z t
0
Df(Xs,s)ds +
Z t
0
fx(Xs,s)θs dBs,
where
Df(Xt,t) = fx(Xt,t)µt + ft(Xt,t) +
1
2
tr

σtσ>
t fxx(Xt,t)

.
Here, fx, ft, and fxx denote the obvious partial derivatives of f, valued in RN
,
R, and RN×N
respectively, and tr(A) denotes the trace of a square matrix A
(the sum of its diagonal elements).
If X is an Ito process in RN
with dXt = µt dt+σt dBt and θ = (θ1
,...,θN
)
is a vector of adapted processes such that θ · µ is in L1
and, for each i, θ · σi
is in L2
, then we say that θ is in L(X), which means that the stochastic
integral
R
θdX exists as an Ito process when defined by
Z T
0
θt dXt ≡
Z T
0
θt · µt dt +
Z T
0
σ>
t θt dBt, T ≥ 0.
If X and Y are real-valued Ito processes with dXt = µX(t)dt+σX(t)dBt
and dYt = µY (t)dt + σY (t)dBt, then Ito’s Formula (for N = 2) implies that
the product Z = XY is an Ito process, with
dZt = Xt dYt + Yt dXt + σX(t) · σY (t)dt. (31)
If µX, µY , σX, and σY are bounded and have continuous sample paths (weaker
conditions would suffice), then it follows from (31) that
d
ds
covt (Xs,Ys)
s=t
= σX(t) · σY (t) almost surely,
where covt(Xs,Ys) = Et(XsYs) − Et(Xs)Et(Ys), and where the derivative is
taken from the right, extending the intuition developed with (18) and (19).
353.5 Arbitrage Modeling
Now, we turn to a more careful definition of arbitrage for purposes of es-
tablishing a close link between the absence of arbitrage and the existence of
state prices.
Suppose the price processes of N given securities form an Ito process
X = (X(1)
,...,X(N)
) in RN
. We suppose, for technical regularity, that each
security price process is in the space H2
containing any Ito process Y with
dYt = a(t)dt + b(t)dB(t) for which
E
"Z t
0
a(s)ds
2
#
< ∞ and E
Z t
0
b(s) · b(s)ds

< ∞.
We will suppose that the securities pay no dividends during the time interval
[0,T), and that XT is the vector of cum-dividend security prices at time T.
A trading strategy θ is an RN
-valued process θ in L(X), meaning simply
that the stochastic integral
R
θdX defining trading gains is well defined. A
trading strategy θ is self-financing if
θt · Xt = θ0 · X0 +
Z t
0
θs dXs, t ≤ T. (32)
We suppose that there is some process short-rate process, a process r with
the property that
RT
0
|rt|dt is finite almost surely and, for some security with
strictly positive price process β,
βt = β0 exp
Z t
0
rs ds

, t ∈ [0,T]. (33)
In this case, dβt = rtβt dt, allowing us to view rt as the riskless short-term
continuously compounding rate of interest, in an instantaneous sense, and to
view βt as the market value of an account that is continually reinvested at
the short-term interest rate r.
A self-financing strategy θ is an arbitrage if θ0 ·X0 < 0 and θT ·XT ≥ 0, or
if θ0 ·X0 ≤ 0 and θT ·XT > 0. Our first goal is to characterize the properties
of a price process X that admits no arbitrage, at least after placing some
reasonable restrictions on trading strategies.
363.6 Numeraire Invariance
It is often convenient to renormalize all security prices, sometimes relative
to a particular price process. We can deflate the previously given security
price process X by a deflator Y to get the new price process XY
defined by
XY
t = XtYt. Such a renormalization has essentially no economic effects. A
deflator is a strictly positive Ito process, as suggested by the following result.
Numeraire Invariance Theorem. Suppose Y is a deflator. Then a trad-
ing strategy θ is self-financing with respect to X if and only if θ is self-
financing with respect to XY
.
The proof is an application Ito’s Forumla. We have the following corol-
lary, which is immediate from the Numeraire Invariance Theorem, the strict
positivity of Y , and the definition of an arbitrage. On numeraire invariance
in more general settings, see Huang [1985a] and Protter [1999].13
Corollary. Suppose Y is a deflator. A trading strategy is an arbitrage with
respect to X if and only if it is an arbitrage with respect to the deflated price
process XY
.
## 3.7 State Prices and Doubling Strategies
Paralleling the terminology of Section 2.2, a state-price density is a deflator π
with the property that the deflated price process Xπ
is a martingale. Other
terms used for this concept in the literature are state-price deflator, marginal-
rate-of-substitution process, and pricing kernel. In the discrete-state discrete-
time setting of Section 2, we found that there is a state-price density if and
only if there is no arbitrage. In a general continuous-time setting, this result
is “almost” true, up to some technical issues.
A technical nuisance in a continuous-time setting is that, without some
frictions limiting trade, arbitrage is to be expected. For example, one may
think of a series of bets on fair and independent coin tosses at times 1/2,
3/4, 7/8, and so on. Suppose one’s goal is to earn a riskless profit of α by
time 1, where α is some arbitrarily large number. One can bet α on heads
for the first coin toss at time 1/2. If the first toss comes up heads, one stops.
Otherwise, one owes α to one’s opponent. A bet of 2α on heads for the
second toss at time 3/4 produces the desired profit if heads comes up at that
13
For more on the role of numeraire, see Geman, El Karoui, and Rochet [1995].
37time. In that case, one stops. Otherwise, one is down 3α and bets 4α on
the third toss, and so on. Because there is an infinite number of potential
tosses, one will eventually stop with a riskless profit of α (almost surely),
because the probability of losing on every one of an infinite number of tosses
is (1/2) · (1/2) · (1/2)··· = 0. This is a classic “doubling strategy” that
can be ruled out either by a technical limitation, such as limiting the total
number of bets, or by a credit restriction limiting the total amount that one
is allowed to be in debt.
For the case of continuous-time trading strategies,14
we will eliminate the
possibility of “doubling strategies” with a credit constraint, defining the set
Θ(X) of self-financing trading strategies satisfying the non-negative wealth
restriction θt ·Xt ≥ 0 for all t. An alternative is to restrict trading strategies
with a technical integrability condition, as reviewed in Duffie [2001]. The
next result is based on Dybvig and Huang [1988].
Proposition. If there is a state-price density, then there is no arbitrage in
Θ(X).
Weaker no-arbitrage conditions based on a lower bound on wealth or
on integrability conditions, are summarized in Duffie [2001], who provides a
standard proof of this result.
## 3.8 Equivalent Martingale Measures
In the finite-state setting of Section 2, it was shown that the existence of a
state-price deflator is equivalent to the existence of an equivalent martingale
measure (after some deflation). Here, we say that Q is an equivalent martin-
gale measure for the price process X if Q is equivalent to P (they have the
same events of zero probability), and if X is a martingale under Q.
Theorem. If the price process X admits an equivalent martingale measure,
then there is no arbitrage in Θ(X).
In most cases, the theorem is applied along the lines of the following corol-
lary, a consequence of the corollary to the Numeraire Invariance Theorem of
Section 3.6.
Corollary. If there is a deflator Y such that the deflated price process XY
admits an equivalent martingale measure, then there is no arbitrage in Θ(X).
14
An actual continuous-time “doubling” strategy can be found in Karatzas [1993].
38As in the finite-state case, the absence of arbitrage and the existence of
equivalent martingale measures are, in spirit, identical properties, although
there are some technical distinctions in this infinite-dimensional setting. In-
spired from early work by Kreps [1981], Delbaen and Schachermayer [1998]
showed the equivalence, after deflation by a numeraire deflator, between no
free lunch with vanishing risk, a slight strengthening of the notion of no
arbitrage, and the existence of a local martingale measure.15
## 3.9 Girsanov and Market Prices of Risk
We now look for convenient conditions on X supporting the existence of an
equivalent martingale measure. We will also see how to calculate such a
measure, and conditions for the uniqueness of such a measure, which is in
spirit equivalent to complete markets. This is precisely the case for the finite
state setting of Theorem 2.9.
The basic approach is from Harrison and Kreps [1979] and Harrison and
Pliska [1981], who coined most of the terms and developed most of the tech-
niques and basic results. Huang [1985a] and Huang [1985b] generalized the
basic theory. The development here differs in some minor ways. Most of the
results extend to an abstract filtration, not necessarily generated by Brown-
ian motion, but the following important property of Brownian filtrations is
somewhat special.
Martingale Representation Theorem. For any martingale ξ, there ex-
ists some Rd
-valued process θ such that the stochastic integral
R
θdB exists
and such that, for all t,
ξt = ξ0 +
Z t
0
θsdBs.
Now, we consider any given probability measure Q equivalent to P, with
density process ξ. By the martingale representation theorem, we can express
the martingale ξ in terms of a stochastic integral of the form
dξt = γt dBt,
15
For related results, see Ansel and Stricker [1992], Ansel and Stricker [1994], Back and
Pliska [1987], Cassese [1996], Duffie and Huang [1986], El Karoui and Quenez [1995], Frit-
telli and Lakner [1995], Jacod and Shiryaev [1998], Kabanov [1996], Kabanov and Kramkov
[1995], Kusuoka [1992a], Lakner [1993], Levental and Skorohod [1995], Rogers [1994],
Schachermayer [1992], Schachermayer [1994], Schachermayer [1998], Schweizer [1992], and
Stricker [1990].
39for some adapted process γ = (γ(1)
,...,γ(d)
) with
RT
0
γt · γt dt < ∞ almost
surely. Girsanov’s Theorem states that a standard Brownian motion BQ
in
Rd
under Q is defined by BQ
0 = 0 and dBQ
t = dBt +ηt dt, where ηt = −γt/ξt.
Suppose the price process X of the N given securities (possibly after some
change of numeraire) is an Ito process in RN
, with
dXt = µt dt + σt dBt.
We can therefore write
dXt = (µt − σtηt)dt + σt dBQ
t .
If X is to be a Q-martingale, then its drift under Q must be zero, which
means that, almost everywhere,
σ(ω,t)η(ω,t) = µ(ω,t), (ω,t) ∈ Ω × [0,T]. (34)
Thus, the existence of a solution η to the system (34) of linear equations
(almost everywhere) is necessary for the existence of an equivalent martingale
measure for X. Under additional technical conditions, we will find that it is
also sufficient.
We can also view a solution η to (34) as providing a proportional rela-
tionship between mean rates of change of prices (µ) and the amounts (σ) of
“risk” in price changes stemming from the underlying d Brownian motions.
For this reason, any such solution η is called a market-price-of-risk process
for X. The idea is that ηi(t) is the “unit price,” measured in price drift, of
bearing exposure to the increment of B(i)
at time t.
A numeraire deflator is a deflator that is the reciprocal of the price process
of one of the securities. It is usually the case that one first chooses some
numeraire deflator Y , and then calculates the market price of risk for the
deflated price process XY
. This is technically convenient because one of the
securities, the “numeraire,” has a price that is always 1 after such a deflation.
If there is a short-rate process r, a typical numeraire deflator is given by Y ,
where Yt = exp

−
R t
0
rs ds

.
If there is no market price of risk, one may guess that something is
“wrong,” as the following result confirms.
Lemma. Let Y be a numeraire deflator. If there is no market-price-of-risk
process for XY
, then there are arbitrages in Θ(X), and there is no equivalent
martingale measure for XY
.
40Proof: Suppose XY
has drift process µY
and diffusion σY
, and that there
is no solution η to σY
η = µY
. Then, as a matter of linear algebra, there
exists an adapted process θ taking values that are row vectors in RN
such
that θσY
≡ 0 and θµY
6= 0. By replacing θ(ω,t) with zero for any (ω,t)
such that θ(ω,t)µY
(ω,t) < 0, we can arrange to have θµY
> 0. (This works
provided the resulting process θ is not identically zero; in that case the same
procedure applied to −θ works.) Finally, because the numeraire security
associated with the deflator has a price that is identically equal to 1 after
deflation, we can also choose the trading strategy for the numeraire so that,
in addition to the above properties, θ is self-financing. That is, assuming
without loss of generality that the numeraire security is the last security, we
can let
θ
(N)
t =
"
−
N−1 X
i=1
θ
(i)
t X
Y,(i)
t +
Z t
0
θ(i)
s dXY,(i)
s
#
.
It follows that θ is a self-financing trading strategy with θ0 · XY
0 = 0, whose
wealth process W, defined by Wt = θt · XY
t , is increasing and not constant.
In particular, θ is in Θ(XY
). It follows that θ is an arbitrage for XY
, and
therefore (by Numeraire Invariance) for X.
Finally, the reasoning leading to (34) implies that if there is no market-
price-of-risk process, then there can be no equivalent martingale measure for
XY
.
For any Rd
-valued adapted process η in L(B), we let ξη
be defined by
ξη
t = e−
R t
0
ηs dBs−1
2
R t
0
ηs·ηs ds
. (35)
Ito’s Formula implies that dξη
t = −ξη
t ηt dBt. Novikov’s Condition, a sufficient
technical condition for ξ to be a martingale, is that
E

e
1
2
R T
0 ηs·ηs ds

< ∞.
Theorem. If X has a market price of risk process η satisfying Novikov’s
condition, and moreover ξη
T has finite variance, then there is an equivalent
martingale measure for X, and there is no arbitrage in Θ(X).
Proof: By Novikov’s Condition, ξη
is a positive martingale. We have ξη
0 =
e0
= 1, so ξη
is indeed the density process of an equivalent probability mea-
sure Q defined by dQ
dP
= ξη
T .
41By Girsanov’s Theorem, a standard Brownian motion BQ
in Rd
under
Q is defined by dBQ
t = dBt + ηt dt. Thus dXt = σt dBQ
t . As dQ
dP
has finite
variance and each security price process X(i)
is by assumption in H2
, we
know by the Cauchy-Schwartz Inequality that
EQ
"Z T
0
σ(i)
(t) · σ(i)
(t) dt
1/2
#
= EP
"Z T
0
σ(i)
(t) · σ(i)
(t) dt
1/2
dQ
dP
#
is finite. Thus, X(i)
is a Q-martingale by Proposition 3.2, and Q is therefore
an equivalent martingale measure. The lack of arbitrage in Θ(X) follows
from Theorem 3.8.
Putting this result together with the previous lemma, we see that the
existence of a market-price-of-risk process is necessary and, coupled with a
technical integrability condition, sufficient for the absence of “well-behaved”
arbitrages and the existence of an equivalent martingale measure. Huang
and Pagès [1992] give an extension to the case of an infinite-time horizon.
For uniqueness of equivalent martingale measures, we can use the fact
that, for any such measure Q, Girsanov’s Theorem implies that we must
have dQ
dP
= ξη
T , for some market price of risk η. If σ(ω,t) is of maximal rank
d, however, there can be at most one solution η(ω,t) to (34). This maximal
rank condition is equivalent to the condition that the span of the rows of
σ(ω,t) is all of Rd
.
Proposition. If rank(σ) = d almost everywhere, then there is at most one
market price of risk and at most one equivalent martingale measure. If there
is a unique market-price-of-risk process, then rank(σ) = d almost everywhere.
With incomplete markets, significant attention in the literature has been
paid to the issue of “which equivalent martingale measure to use” for the
purpose of pricing contingent claims that are not redundant. Babbs and Selby
[1996], Bühlmann, Delbaen, Embrechts, and Shiryaev [1998], and Föllmer
and Schweizer [1990] suggest some selection criteria or parameterization for
equivalent martingale measures in incomplete markets. In particular, Artzner
[1995], Bajeux-Besnainou and Portait [1997], Dijkstra [1996], Johnson [1994],
and Long [1990], address the numeraire portfolio, also called growth-optimal
portfolio, as a device for selecting a state-price density. Little of this literature
offers an economic theory for the use of a particular measure for pricing new
contingent claims that are not already traded (or replicated) by the given
primitive securities.
423.10 Black-Scholes Again
Suppose the given security-price process is X = (S(1)
,...,S(N−1)
,β), where,
for S = (S(1)
,...,S(N−1)
),
dSt = µt dt + σt dBt
and
dβt = rtβt dt; β0 > 0,
where µ, σ, and r are adapted processes (valued in RN−1
, R(N−1)×d
, and R
respectively). We also suppose for technical convenience that the short-rate
process r is bounded. Then Y = β−1
is a convenient numeraire deflator, and
we let Z = SY . By Ito’s Formula,
dZt =

−rtZt +
µt
βt

dt +
σt
βt
dBt.
In order to apply Theorem 3.9 to the deflated price process X̂ = (Z,1), it
would be enough to know that Z has a market price of risk η and that the
variance of ξη
T is finite. Given this, there would be an equivalent martingale
measure Q and no arbitrage in Θ(X). Suppose, for the moment, that this is
the case. By Girsanov’s Theorem, there is a standard Brownian motion BQ
in Rd
under Q such that
dZt =
σt
βt
dBQ
t .
Because S = βZ, another application of Ito’s Formula yields
dSt = rt St dt + σt dBQ
t . (36)
Equation (36) is an important intermediate result for arbitrage-free asset
pricing, giving an explicit expression for security prices under a probability
measure Q with the property that the “discounted” price process S/β is a
martingale. For example, this leads to an easy recovery of the Black-Scholes
formula, as follows.
Suppose that, of the securities with price processes S(1)
,...,S(N−1)
, one
is a call option on another. For convenience, we denote the price process of
the call option by U and the price process of the underlying security by V ,
so that UT = (VT − K)+
, for expiration at time T with some given exercise
price K. Because UY is by assumption a martingale under Q, we have
Ut = βtEQ
t

UT
βT

= EQ
t
h
e−
R T
t
r(s)ds
(VT − K)+
i
. (37)
43The reader may verify that this is the Black-Scholes formula for the case of
d = 1, V0 > 0, and with constants r and non-zero σ such that for all t, rt = r
and dVt = VtµV (t)dt + Vtσ dBt, where µV is a bounded adapted process.
Indeed, in this case, Z has a market-price-of-risk process η such that ξη
T has
finite variance, an exercise, so the assumption of an equivalent martingale
measure is justified. More precisely, it is sufficient for the absence of arbitrage
that the option-price process is given by (37). Necessity of the Black-Scholes
formula for the absence of arbitrages in Θ(X) is addressed in Duffie [2001].
We can already see, however, that the expectation in (37) defining the Black-
Scholes formula does not depend on which equivalent martingale measure Q
one chooses, so one should expect that the Black-Scholes formula (37) is also
necessary for the absence of arbitrage. If (37) is not satisfied, for instance,
there cannot be an equivalent martingale measure for S/β. Unfortunately,
and for purely technical reasons, this is not enough to imply directly the
necessity of (37) for the absence of well-behaved arbitrage, because we do
not have a precise equivalence between the absence of arbitrage and the
existence of equivalent martingale measures.
In the Black-Scholes setting, σ is of maximal rank d = 1 almost every-
where. Thus, from Proposition 3.9, there is exactly one equivalent martingale
measure.
The detailed calculations of Girsanov’s Theorem appear nowhere in the
actual solution (36) for the “risk-neutral behavior” of arbitrage-free security
prices, which can be given by inspection in terms of σ and r only.
## 3.11 Complete Markets
We say that a random variable W can be replicated by a self-financing trad-
ing strategy θ if it is obtained as the terminal value W = θT · XT . Our
basic objective in this section is to give a simple spanning condition on the
diffusion σ of the price process X under which, up to technical integrabil-
ity conditions, any random variable can be replicated (without resorting to
“doubling strategies”).
Proposition. Suppose Y is a numerator deflator and Q is an equivalent
martingale measure for the deflated price process XY
. Suppose the diffusion
σY
of XY
is of maximal rank d almost everywhere. Let W be any random
variable with EQ
(|WY |) < ∞. Then there is a self-financing trading strategy
θ that replicates W and whose deflated market-value process {θt · XY
t : 0 ≤
44t ≤ T} is a Q-martingale.
Proof: Without loss of generality, the numeraire is the last of the N securi-
ties, so we write XY
= (Z,1). Let BQ
be the standard Brownian motion in
Rd
under Q obtained by Girsanov’s Theorem. The martingale representation
property implies that, for any Q-martingale, there is some ϕ such that
EQ
t (WYT) = EQ
(WYT) +
Z t
0
ϕs dBQ
s , t ∈ [0,T]. (38)
By the rank assumption on σY
and the fact that σY
Nt = 0, there are adapted
processes θ(1)
,...,θ(N−1)
solving
N−1 X
j=1
θ
(j)
t σY
jt = ϕ>
t , t ∈ [0,T]. (39)
Let θ(N)
be defined by
θ
(N)
t = EQ
(WYT) +
N−1 X
i=1
Z t
0
θ(i)
s dZ(i)
s − θ
(i)
t Z
(i)
t

. (40)
Then θ = (θ(1)
,...,θ(N)
) is self-financing and θT · XY
T = WYT. By the
Numeraire Invariance Theorem, θ is also self-financing with respect to X
and θT · XT = W. As
R
ϕdBQ
is by construction a Q-martingale, (38)-(40)
imply that {θt · XY
t : 0 ≤ t ≤ T} is a Q-martingale.
The property that the deflated market-value process {θt·XY
t : 0 ≤ t ≤ T}
is a Q-martingale ensures that there is no use of doubling strategies. For
example, if W ≥ 0, then the martingale property implies that θt ·Xt ≥ 0 for
all t.
Analogues to some of the results in this section for the case of mar-
ket imperfections such as portfolio constraints or transactions costs are pro-
vided by Ahn, Dayal, Grannan, and Swindle [1995], Bergman [1995], Con-
stantinides [1993], Constantinides and Zariphopoulou [1999], Cvitanić and
Karatzas [1993], Davis and Clark [1993], Grannan and Swindle [1996], Hen-
rotte [1991], Jouini and Kallal [1993], Karatzas and Kou [1998], Kusuoka
[1992b], Kusuoka [1993], Soner, Shreve, and Cvitanić [1994], and Whalley
and Wilmott [1997]. Many of these results are asymptotic, for “small” pro-
portional transactions costs, based on the approach of Leland [1985].
453.12 Optimal Trading and Consumption
We now apply the “martingale” characterization of the cost of replicating
an arbitrary payoff, given in the last proposition, to the problem of optimal
portfolio and consumption processes.
The setting is Merton’s problem, as formulated and solved in certain set-
tings, for geometric Brownian prices, by Merton [1971]. Merton used the
method of dynamic programming, solving the associated Hamilton-Jacobi-
Bellman (HJB) equation.16
A major alternative method is the martingale
approach to optimal investment, which reached a key stage of development
with Cox and Huang [1989], who treat the agent’s candidate consumption
choice as though it is a derivative security, and maximize the agent’s utility
subject to a wealth constraint on the arbitrage-free price of the consump-
tion. Since that price can be calculated in terms of the given state-price
density, the result is a simple static optimization problem.17
Karatzas and
Shreve [1998] provide a comprehensive treatment of optimal portfolio and
consumption processes in this setting.
Fixing a probability space (Ω,F,P) and the standard filtration {Ft :
t ≥ 0} of a standard Brownian motion B in Rd
, we suppose that X =
(X(0)
,X(1)
,...,X(N)
) is an Ito process in RN+1
for the prices of N + 1 secu-
rities, with
dX
(i)
t = µ
(i)
t X
(i)
t dt + X
(i)
t σ
(i)
t dBt; X
(i)
0 > 0, (41)
where µ = (µ(0)
,...,µ(N)
) and the RN×d
-valued process σ are bounded
adapted processes. Letting σ(i)
denote the i-th row of σ, we suppose that
σ(0)
= 0, so that we can treat µ(0)
as the short-rate process r. A special case
of this setup is to have geometric Brownian security prices and a constant
short rate, which was the setting of Merton’s original problem.
We assume for simplicity that N = d. The excess expected returns of the
“risky” securities are defined by the RN
-valued process λ given by λ
(i)
t = µ
(i)
t −
16
The book of Fleming and Soner [1993] treats HJB equations, stochastic control prob-
lems, emphasizing the use of viscosity methods.
17
The related literature is immense, and includes Cox [1983], Pliska [1986], Cox and
Huang [1991], Back [1986], Back [1991], Back and Pliska [1987], Duffie and Skiadas [1994],
Foldes [1978a], Foldes [1978b], Foldes [1990], Foldes [1991a], Foldes [1992], Foldes [1991b],
Foldes [1996], Harrison and Kreps [1979], Huang [1985b], Huang Pagès:92, Karatzas,
Lehoczky, and Shreve [1987], Lakner and Slud [1991], Pagès [1987], Xu and Shreve [1992],
and Xu and Shreve [1992].
46rt. A deflated price process X̂ is defined by X̂t = Xt exp

−
Rt
0
rs ds

. We
assume that σ is invertible (almost everywhere) and that the market-price-
of-risk process η for X̂, defined by ηt = σ−1
t λt, is bounded. It follows that
markets are complete (in the sense of Proposition 3.11) and that there are
no arbitrages meeting the standard credit constraint of non-negative wealth.
In this setting, a state-price density π is defined by
πt = exp

−
Z t
0
rs ds

ξt, (42)
where ξη
is the density process defined by (35) for an equivalent martingale
measure Q, after deflation by e
R t
0 −r(s)ds
.
Utility is defined over the space D of consumption pairs (c,Z), where c is
an adapted nonnegative consumption-rate process with
RT
0
ct dt < ∞ almost
surely, and Z is an FT-measurable nonnegative random variable describing
terminal lump-sum consumption. Specifically, U : D → R is defined by
U(c,Z) = E
Z T
0
u(ct,t)dt + F(Z)

, (43)
where
• F : R+ → R is increasing and concave with F(0) = 0;
• u : R+ × [0,T] → R is continuous and, for each t in [0,T], u(·,t) :
R+ → R is increasing and concave, with u(0,t) = 0;
• F is strictly concave or zero, or for each t in [0,T ], u(·,t) is strictly
concave or zero.
• At least one of u and F is non-zero.
A trading strategy is a process θ = (θ(0)
,...,θ(N)
) in L(X), meaning
merely that the gain-from-trade stochastic integral
R
θdX exists. Given an
initial wealth w > 0, we say that (c,Z,θ) is budget-feasible if (c,Z) is a
consumption choice in D and θ is a trading strategy satisfying
θt · Xt = w +
Z t
0
θs dXs −
Z t
0
cs ds ≥ 0, t ∈ [0,T ], (44)
47and
θT · XT ≥ Z. (45)
The first restriction (44) is that the current market value θt ·Xt of the trading
strategy is non-negative, a credit constraint, and is equal to its initial value w,
plus any gains from security trade, less the cumulative consumption to date.
The second restriction (45) is that the terminal portfolio value is sufficient to
cover the terminal consumption. We now have the problem, for each initial
wealth w,
sup
(c,Z,θ)∈Λ(w)
U(c,Z), (46)
where Λ(w) is the set of budget-feasible choices at wealth w. First, we state
an extension of the numeraire invariance result of Section 3.4, which obtains
from an application of Ito’s Formula.
Lemma. Let Y be any deflator. Given an initial wealth w ≥ 0, a strategy
(c,Z,θ) is budget-feasible given price process X if and only if it is budget
feasible after deflation, that is,
θt · XY
t = wY0 +
Z t
0
θs dXY
s −
Z t
0
Yscs ds ≥ 0, t ∈ [0,T ], (47)
and
θT · XY
T ≥ ZYT. (48)
With numeraire invariance, we can reduce the dynamic trading and con-
sumption problem to a static optimization problem subject to an initial
wealth constraint, as follows.
Proposition. Given a consumption choice (c,Z) in D, there exists a trading
strategy θ such that (c,Z,θ) is budget-feasible at initial wealth w if and only
if
E

πT Z +
Z T
0
πtct dt

≤ w. (49)
Proof: Suppose (c,Z,θ) is budget-feasible. Applying the previous numeraire-
invariance lemma to the state-price deflator π, and using the fact that π0 =
ξ0 = 1, we have
w +
Z T
0
θt dXπ
t ≥ πT Z +
Z T
0
πtct dt. (50)
48Because Xπ
is a martingale under P, the process M, defined by Mt =
w +
Rt
0
θs dXπ
s , is a non-negative local martingale, and therefore a super-
martingale. For the definitions of local martingale and supermartingale, and
for this property, see for example Protter [1990]. By the supermartingale
property, M0 ≥ E(MT ). Taking expectations through (50) thus leaves (49).
Conversely, suppose (c,Z) satisfies (49), and let M be the Q-martingale
defined by
Mt = EQ
t

e−rT
Z +
Z T
0
e−rt
ct dt

.
By Girsanov’s Theorem, a standard Brownian motion BQ
in Rd
under Q is
defined by dBQ
t = dBt + ηt dt, and BQ
has the martingale representation
property. Thus, there is some ϕ = (ϕ(1)
,...,ϕ(d)
) in L(BQ
) such that
Mt = M0 +
Z t
0
ϕs dBQ
s , t ∈ [0,T ],
where M0 ≤ w. For the deflator Y defined by Yt = e−
R t
0 r(s)ds
, we also know
that X̂ = XY
is a Q-martingale. From the definitions of the market price of
risk η and of BQ
,
dX̂
(i)
t = X̂
(i)
t σ
(i)
t dBQ
t , 1 ≤ i ≤ N.
Because σt is invertible and X̂ is strictly positive with continuous sample
paths, we can choose θ(i)
in L(X(i)
) for each i ≤ N such that
(θ
(1)
t X̂
(1)
t ,...,θ
(N)
t X̂
(N)
t )σt = ϕ>
t , t ∈ [0,T].
This implies that
Mt = M0 +
N X
i=1
Z t
0
θ(i)
s dX̂(i)
s . (51)
We can also let
θ
(0)
t = w +
N X
i=1
Z t
0
θ(i)
s dX̂(i)
s −
N X
i=1
θ
(i)
t X̂
(i)
t −
Z t
0
e−rs
cs ds. (52)
From (49) and the fact that ξt = πte
R t
0
r(s)ds
defines the density process
for Q,
M0 = EQ

e−rT
Z +
Z T
0
e−rt
ct dt

≤ w. (53)
49From (52), (51), and the fact that
R
θ(0)
dX̂(0)
= 0,
θt · X̂t = w +
Z t
0
θs dX̂s −
Z t
0
e−rs
cs ds
= w + Mt − M0 −
Z t
0
e−rs
cs ds
= w − M0 + EQ
t
Z T
t
e−rs
cs ds + e−rT
Z

≥ 0,
using (53). With numeraire invariance, (44) follows. We can also use the
same inequality for t = T, (53), and the fact that MT = e−
R T
0 r(s)ds
Z +
RT
0
e−
R t
0 r(s)ds
ct dt to obtain (45). Thus, (c,Z,θ) is budget-feasible.
Corollary. Given a consumption choice (c∗
,Z∗
) in D and some initial wealth
w, there exists a trading strategy θ∗
such that (c∗
,Z∗
,θ∗
) solves Merton’s prob-
lem (46) if and only if (c∗
,Z∗
) solves the problem
sup
(c,Z)∈D
U(c,Z) subject to E
Z T
0
πtct dt + πT Z

≤ w. (54)
## 3.13 Martingale Solution to Merton’s Problem
We are now in a position to obtain a relatively explicit solution to Merton’s
problem (46) by using the equivalent formulation (54).
By the Saddle Point Theorem and the strict monotonicity of U, (c∗
,Z∗
)
solves (54) if and only if there is a scalar Lagrange multiplier γ∗
> 0 such
that, first: (c∗
,Z∗
) solves the unconstrained problem
sup
(c,Z)∈D
L(c,Z;γ∗
), (55)
where, for any γ ≥ 0,
L(c,Z;γ) = U(c,Z) − γE

πT Z +
Z T
0
πtct dt − w

, (56)
and second, (c∗
,Z∗
) satisfies the complementary-slackness condition
E

πT Z∗
+
Z T
0
πtc∗
t dt

= w. (57)
We can summarize our progress on Merton’s problem (46) as follows.
50Proposition. Given some (c∗
,Z∗
) in D, there is a trading strategy θ∗
such
that (c∗
,Z∗
,θ∗
) solves Merton’s problem (46) if and only if there is a constant
γ∗
> 0 such that (c∗
,Z∗
) solves (55) and E

πT Z∗
+
RT
0
πtc∗
t dt

= w.
In order to obtain intuition for the solution of (55), we begin with some
arbitrary γ > 0 and treat U(c,Z) = E[
RT
0
u(ct,t)dt + F(Z)] intuitively by
thinking of “E” and “
R
” as finite sums, in which case the first-order con-
ditions for optimality of (c∗
,Z∗
)  0 for the problem sup(c,Z) L(c,Z;γ),
assuming differentiability of u and F, are
uc(c∗
t ,t) − γπt = 0, t ∈ [0,T ], (58)
and
F0
(Z∗
) − γπT = 0. (59)
Solving, we have
c∗
t = I(γπt,t), t ∈ [0,T], (60)
and
Z∗
= IF (γπT ), (61)
where I(·,t) inverts18
uc(·,t) and where IF inverts F0
. We will confirm these
conjectured forms (60) and (61) of the solution in the next theorem. Under
strict concavity of u or F, the inversions I(·,t) and IF , respectively, are
continuous and strictly decreasing. A decreasing function ŵ : (0,∞) → R is
therefore defined by
ŵ(γ) = E
Z T
0
πtI(γπt,t)dt + πT IF (γπT )

. (62)
(We have not yet ruled out the possibility that the expectation may be +∞.)
All of this implies that (c∗
,Z∗
) of (60)-(61) solves (54) provided the required
initial investment ŵ(γ) is equal to the endowed initial wealth w. This leaves
an equation ŵ(γ) = w to solve for the “correct” Lagrange multiplier γ∗
, and
with that an explicit solution to the optimal consumption policy for Merton’s
problem.
We now consider properties of u and F guaranteeing that ŵ(γ) = w
can be solved for a unique γ∗
> 0. A strictly concave increasing function
F : R+ → R that is differentiable on (0,∞) satisfies Inada conditions if
18
If u = 0, we take I = 0. If F = 0, we take IF = 0.
51infx F0
(x) = 0 and supx F0
(x) = +∞. If F satisfies these Inada conditions,
then the inverse IF of F0
is well defined as a strictly decreasing continuous
function on (0,∞) whose image is (0,∞).
Condition A. Either F is zero or F is differentiable on (0,∞), strictly
concave, and satisfies Inada conditions. Either u is zero or, for all t, u(·,t)
is differentiable on (0,∞), strictly concave, and satisfies Inada conditions.
For each γ > 0, ŵ(γ) is finite.
We recall the standing assumption that at least one of u and F is nonzero.
The assumption of finiteness of ŵ(·) has been shown by Kramkov and
Schachermayer [1998] to follow from natural regularity conditions.
Theorem. Under Condition A and the standing conditions on µ, σ, and r,
for any w > 0, Merton’s problem has the optimal consumption policy given
by (60)-(61) for a unique scalar γ > 0.
Proof: Under Condition A, the Dominated Convergence Theorem implies
that ŵ(·) is continuous. Because one or both of I(·,t) and IF (·) have
(0,∞) as their image and are strictly decreasing, ŵ(·) inherits these two
properties. From this, given any initial wealth w > 0, there is a unique
γ∗
with ŵ(γ∗
) = w. Let (c∗
,Z∗
) be defined by (60)-(61), taking γ = γ∗
.
The previous proposition tells us there is a trading strategy θ∗
such that
(c∗
,Z∗
,θ∗
) is budget-feasible. Let (θ,c,Z) be any budget-feasible choice.
The previous proposition also implies that (c,Z) satisfies (49). For each
(ω,t), the first-order conditions (58) and (59) are sufficient (by concavity of
u and F) for optimality of c∗
(ω,t) and Z∗
(ω) in the problems
sup
c∈[0,∞)
u(c,t) − γ∗
π(ω,t)c
and
sup
Z∈[0,∞)
F(Z) − γ∗
π(ω,T)Z,
respectively. Thus,
u(c∗
t ,t) − γ∗
πtc∗
t ≥ u(ct,t) − γ∗
πtct, 0 ≤ t ≤ T, (63)
and
F(Z∗
) − γ∗
πT Z∗
≥ F(Z) − γ∗
πT Z. (64)
52Integrating (63) from 0 to T, adding (64), taking expectations, and then
applying the complementary slackness condition (57) and the budget con-
straint (49), leaves U(c∗
,Z∗
) ≥ U(c,Z). As (c,Z,θ) is arbitrary, this implies
the optimality of (c∗
,Z∗
,θ∗
).
In practice, solving the equation ŵ(γ∗
) = w for γ∗
may require a one-
dimensional numerical search, which is straightforward because ŵ(·) is strictly
monotone.
This result, giving a relatively explicit consumption solution to Merton’s
problem, has been extended in many directions, even generalizing the as-
sumption of additive utility to allow for habit-formation or recursive utility,
as shown by Schroder and Skiadas [1999].
For a specific example, we treat terminal consumption only by taking
u ≡ 0, and we let F(w) = wα
/α for α ∈ (0,1). Then c∗
= 0 and the
calculations above imply that ŵ(γ) = E

πT (γπT )1/(α−1)

. Solving ŵ(γ∗
) = w
for γ∗
leaves
γ∗
= wα−1
E

π
α/(α−1)
T
1−α
.
From (61),
Z∗
= IF (γ∗
πT ).
Although this approach generates a straightforward solution for the op-
timal consumption policy, the form of the optimal trading strategy can be
difficult to determine. For the special case of geometric Brownian price pro-
cesses (constant µ and σ) and a constant short rate r, we can calculate that
Z∗
= WT where W is the geometric Brownian wealth process obtained from
dWt = Wt(r + ϕ · λ)dt + Wtϕ>
σ dBt; W0 = w,
where ϕ = (σσ>
)−1
λ/(1−α) is the vector of fixed optimal portfolio fractions.
More generally, in a Markov setting, one can derive a PDE for the wealth
process, as for the pricing approach to Black-Scholes option pricing formula,
and from the derivatives of the solution function obtain the associated trad-
ing strategy. Merton’s original stochastic-control approach, in a Markov set-
ting, gives explicit solutions for the optimal trading strategy in terms of the
derivatives of the value function solving the HJB equation. Although there
are only a few examples in which these derivatives are known explicitly, they
can be approximated by a numerical solution of the Hamilton-Jacobi-Bellman
equation.
53This martingale approach to solving (46) has been extended with duality
techniques and other methods to cases of investment with constraints, in-
cluding incomplete markets. See, for example, Cvitanić and Karatzas [1996],
Cvitanić, Schachermayer, and Wang [1999], Cuoco [1997], and the many
sources cited by Karatzas and Shreve [1998].
## 4 Term-Structure Models
This section reviews models of the term structure of interest rates. These
models are used to analyze the dynamic behavior of bond yields and their
relationships with macro-economic covariates, and also for the pricing and
hedging of fixed-income securities, those whose future payoffs are contingent
on future interest rates. Term-structure modeling is one of the most active
and sophisticated areas of application of financial theory to everyday business
problems, ranging from managing the risk of a bond portfolio to the design
and pricing of collateralized mortgage obligations. In this section, we treat
default-free instruments. In Section 6, we turn to defaultable bonds. This
section provides only a small skeleton of the extensive literature on term-
structure models. More extensive notes to the literature are found in Duffie
[2001] and in the surveys by Dai and Singleton [2001] and Piazzesi [2002].
We first treat the standard “single-factor” examples of Merton [1974],
Cox, Ingersoll, and Ross [1985a], Dothan [1978], Vasicek [1977], Black, Der-
man, and Toy [1990], and some of their variants. These models treat the
entire term structure of interest rates at any time as a function of a single
state variable, the short rate of interest. We will then turn to multi-factor
models, including multifactor affine models, extending the Cox-Ingersoll-Ross
and Vasicek models. Finally, we turn to the term-structure framework of
Heath, Jarrow, and Morton [1992], which allows, under technical conditions,
any initial term structure of forward interest rates and any process for the
conditional volatilities and correlations of these forward rates.
Numerical tractability is essential for practical and econometric appli-
cations. One must fit model parameters from time-series or cross-sectional
data on bond and derivative prices. A fitted model may be used to price or
hedge related contingent claims. Typical numerical methods include “bino-
mial trees,” Fourier-transform methods, Monte-Carlo simulation, and finite-
difference solution of PDEs. Even the “zero curve” of discounts must be
54fitted to the prices of coupon bonds.19
In econometric applications, bond
or option prices must be solved repeatedly for a large sample of dates and
instruments, for each of many candidate parameter choices.
We fix a probability space (Ω,F,P) and a filtration F = {Ft : 0 ≤ t ≤ T}
satisfying the usual condtions,20
as well as a short-rate process r. We have
departed from a dependence on Brownian information in order to allow for
“surprise jumps,” which are important in certain applications.
A zero-coupon bond maturing at some future time s > t pays no dividends
before time s, and offers a fixed lump-sum payment at time s that we can
take without loss of generality to be 1 unit of account. Although it is not
always essential to do so, we assume throughout that such a bond exists for
each maturity date s. One of our main objectives is to characterize the price
Λt,s at time t of the s-maturity bond, and its behavior over time.
We fix some equivalent martingale measure Q, after taking as a numeraire
for deflation purposes the market value e
R t
0
r(s)ds
of investments rolled over
at the short-rate process r. The price at time t of the zero-coupon bond
maturing at s is then
Λt,s ≡ EQ
t
h
e−
R s
t
r(u)du
i
. (65)
The term structure is often expressed in terms of the yield curve. The
continuously compounding yield yt,τ on a zero-coupon bond maturing at time
t + τ is defined by
yt,τ = −
log(Λt,t+τ)
τ
.
The term structure can also be represented in terms of forward interest rates,
as explained later in this section.
## 4.1 One-Factor Models
A one-factor term-structure model means a model of r that satisfies a stochas-
tic differential equation (SDE) of the form
drt = µ(rt,t)dt + σ(rt,t)dBQ
t , (66)
19
See Adams and Van Deventer [1994], Coleman, Fisher, and Ibbotson [1992], Diament
[1993], Fisher, Nychka, and Zervos [1994], Jaschke [1996], Konno and Takase [1995], Konno
and Takase [1996], and Svensson and Dahlquist [1993]. Consistency of the curve-fitting
method with an underlying term-structure model is examined by Björk and Christensen
[1999], Björk and Gombani [1999], and Filipović [1999b].
20
For these technical conditions, see for example, Protter [1990].
55Table 1. Common Single-Factor Model Parameters, Equation (67)
Model K0 K1 K2 H0 H1 ν
Cox, Ingersoll, and Ross [1985a] • • • 0.5
Pearson and Sun [1994] • • • • 0.5
Dothan [1978] • 1.0
Brennan and Schwartz [1977] • • • 1.0
Merton [1974] and Ho and Lee [1986] • • 1.0
Vasicek [1977] • • • 1.0
Black and Karasinski [1991] • • • 1.0
Constantinides and Ingersoll [1984] • 1.5
where BQ
is a standard Brownian motion under Q and where µ : R×[0,T] →
R and σ : R × [0,T] → Rd
satisfy technical conditions guaranteeing the
existence of a solution to (66) such that, for all t and s ≥ t, the price Λt,s of
the zero-coupon bond maturing at s is finite and well defined by (65).
The one-factor models are so named because the Markov property (under
Q) of the solution r to (66) implies, from (65), that the short rate is the
only state variable, or “factor,” on which the current yield curve depends.
That is, for all t and s ≥ t, we can write yt,s = F(t,s,rt), for some fixed
F : [0,T] × [0,T] × R → R.
Table 1 shows many of the parametric examples of one-factor models
appearing in the literature, with their conventional names. Each of these
models is a special case of the SDE
drt = [K0t + K1trt + K2trt log(rt)] dt + [H0t + H1trt]ν
dBQ
t , (67)
for deterministic coefficients K0t,K1t,K2t,H0t, and H1t depending continu-
ously on t, and for some exponent ν ∈ [0.5,1.5]. Coefficient restrictions, and
restrictions on the space of possible short rates, are needed for the existence
and uniqueness of solutions. For each model, Table 7.1 shows the associ-
ated exponent ν, and uses the symbol “•” to indicate those coefficients that
appear in nonzero form. We can view a negative coefficient K1t as a mean-
reversion parameter, in that a higher short rate generates a lower drift, and
vice versa. Empirically speaking, mean reversion is widely believed to be a
useful attribute to include in single-factor short-rate models.21
21
In most cases, the original versions of these models had constant coefficients, and were
56Non-parametric single-factor models are estimated by Aı̈t-Sahalia [1996b],
Aı̈t-Sahalia [1996c], and Aı̈t-Sahalia [1996a]. The empirical evidence, as ex-
amined for example Dai and Singleton [2000], however, points strongly to-
ward multifactor extensions, to which we will turn shortly.
For essentially any single-factor model, the term structure can be com-
puted (numerically, if not explicitly) by taking advantange of the Feynman-
Kac relationship between SDEs and PDEs. Fixing for convenience the ma-
turity date s, the Feynman-Kac approach implies from (65), under technical
conditions on µ and σ, for all t, that Λt,s = f(rt,t), where f ∈ C2,1
(R×[0,T))
solves the PDE
Df(x,t) − xf(x,t) = 0, (x,t) ∈ R × [0,s), (68)
with boundary condition
f(x,s) = 1, x ∈ R,
where
Df(x,t) = ft(x,t) + fx(x,t)µ(x,t) +
1
2
fxx(x,t)σ(x,t)2
.
This PDE can be quickly solved using standard finite-difference numerical
algorithms.
A subset of the models considered in Table 1, those with K2 = H1 = 0, are
Gaussian.22
Special cases are the models of Merton [1974] (often called “Ho-
Lee”) and Vasicek [1977]. For a Gaussian model, we can show that bond-price
processes are log-normal (under Q) by defining a new process y satisfying
dyt = −rt dt, and noting that (r,y) is a two-dimensional Gaussian Markov
process. Thus, for any t and s ≥ t, the random variable ys − yt = −
Rs
t
ru du
only later extended to allow Kit and Hit to depend on t, for practical reasons, such as
calibration of the model to a given set of bond and option prices. The Gaussian short-rate
model of Merton [1974], who originated much of the approach taken here, was extended by
Ho and Lee [1986], who developed the idea of calibration of the model to the current yield
curve. The calibration idea was further developed by Black, Derman, and Toy [1990], Hull
and White [1990], Hull and White [1993], and Black and Karasinski [1991], among others.
Option evaluation and other applications of the Gaussian model is provided by Carverhill
[1988], Jamshidian [1989b], Jamshidian [1989a], Jamshidian [1989c], Jamshidian [1991a],
Jamshidian [1993b], and El Karoui and Rochet [1989]. A popular special case of the
Black-Karasinski model is the Black-Derman-Toy model.
22
By a Gaussian process, we mean that the short rates r(t1),...,r(tk) at any finite set
{t1,...,tk} of times have a joint normal distribution under Q.
57is normally distributed under Q, with a mean m(s−t) and variance v(s−t),
conditional on Ft, that are easily computed in terms of rt, K0, K1, and H0.
The conditional variance v(s − t) is deterministic. The conditional mean
m(t,s) is of the form a(s−t)+β(s−t)rt, for coefficients a(s−t) and β(s−t)
whose calculation is left to the reader. It follows that
Λt,s = EQ
t

exp

−
Z s
t
ru du

= exp

m(t,s) +
v(s − t)
2

= eα(s−t)+β(s−t)r(t)
,
where α(s−t) = a(s−t)+v(s−t)/2. Because rt is normally distributed under
Q, this means that any zero-coupon bond price is log-normally distributed
under Q. Using this property, one can compute bond-option prices in this
setting using the original Black-Scholes formula. For this, a key simplifying
trick of Jamshidian [1989b] is to adopt as a new numeraire the zero-coupon
bond maturing at the expiration date of the option. The associated equiva-
lent martingale measure is sometimes called the forward measure. Under the
new numeraire and the forward measure, the price of the bond underlying the
option is log-normally distributed with a variance that is easily calculated,
and the Black-Scholes formula can be applied. Aside from the simplicity of
the Gaussian model, this explicit computation is one of its main advantages
in applications.
An undesirable feature of the Gaussian model, however, is that it im-
plies that the short rate and yields on bonds of any maturity are negative
with positive probability at any future date. While negative interest rates
are sometimes plausible when expressed in “real” (consumption numeraire)
terms, it is common in practice to express term structures in nominal terms,
relative to the price of money. In nominal terms, negative bond yields im-
ply a kind of arbitrage. In order to describe this arbitrage, we can formally
view money as a security with no dividends whose price process is identically
equal to 1. (This definition is itself is an arbitrage!) If a particular zero-
coupon bond were to offer a negative yield, consider a short position in the
bond (that is, borrowing) and a long position of an equal number of units
of money, both held to the maturity of the bond. With a negative bond
yield, the initial bond price is larger than 1, implying that this position is an
arbitrage. To address properly the role of money in supporting nonnegative
58interest rates would, however, require a rather wide detour into monetary
theory and the institutional features of money markets. Let us merely leave
this issue with the sense that allowing negative interest rates is not necessar-
ily “wrong,” but is somewhat undesirable. Gaussian short-rate models are
nevertheless frequently used because they are relatively tractable and in light
of the low likelihood that they would assign to negative interest rates within
a reasonably short time, with reasonable choices for the coefficient functions.
One of the best-known single-factor term-structure models is that of Cox,
Ingersoll, and Ross [1985b], the “CIR model,” which exploits the stochastic
properties of the diffusion model of population sizes of Feller [1951]. For
constant coefficient functions K0,K1, and H1, the CIR drift and diffusion
functions, µ and σ, may be written in the form
µ(x,t) = κ(x − x); σ(x,t) = C
√
x, x ≥ 0, (69)
for constants κ, x, and C. Provided κ and x are non-negative, there is
a nonnegative solution to the associated SDE (66). (Karatzas and Shreve
[1988] offer a standard proof.) Given r0, provided κx > C2
, we know that rt
has a non-central χ2
distribution under Q, with parameters that are known
explicitly. The drift κ(x − rt) indicates reversion of rt toward a stationary
risk-neutral mean x at a rate κ, in the sense that
EQ
(rt) = x + e−κt
(r0 − x),
which tends to x as t goes to +∞. Cox, Ingersoll, and Ross [1985b] show
how the coefficients κ, x, and C can be calculated in a general equilibrium
setting in terms of the utility function and endowment of a representative
agent. For the CIR model, it can be verified by direct computation of the
derivatives that the solution for the term-structure PDE (68) is
f(x,t) = eα(s−t)+β(s−t)x
, (70)
where
α(u) =
2κx
C2

log 2γe(γ+κ)u/2

− log((γ + κ)(eγu
− 1) + 2γ)

β(u) =
2(1 − eγu
)
(γ + κ)(eγu − 1) + 2γ
,
for γ = (κ2
+ 2C2
)1/2
.
59The Gaussian and Cox-Ingersoll-Ross models are special cases of single-
factor models with the property that the solution f of the term-structure
PDE (68) is given by the exponential-affine form (70) for some coefficients
α(·) and β(·) that are continuously differentiable. For all t, the yield
−log[f(x,t)]/(s − t) obtained from (70) is affine in x. We therefore call
any such model an affine term-structure model. (A function g : Rk
→ R,
for some k, is affine if there are constants a and b in Rk
such that for all x,
g(x) = a + b · x.)
It turns out that, technicalities aside, µ and σ2
are affine in x if and only if
the term structure is itself affine in x. The idea that an affine term-structure
model is typically associated with affine drift µ and squared diffusion σ2
is
foreshadowed in Cox, Ingersoll, and Ross [1985b] and Hull and White [1990],
and is explicit in Brown and Schaefer [1994]. Filipović [1999a] provides a
definitive result for affine term structure models in a one-dimensional state
space. We will get to multi-factor models shortly. The special cases associ-
ated with the Gaussian model and the CIR model have explicit solutions for
α and β.
Cherif, El Karoui, Myneni, and Viswanathan [1995], Constantinides [1992],
El Karoui, Myneni, and Viswanathan [1992], Jamshidian [1996a], and Rogers
[1993] characterize a model in which the short rate is a linear-quadratic form
in a multivariate Markov Gaussian process. This “LQG” class of models
overlaps with the general affine models, as for example in Piazzesi [1999],
although it remains to be seen how we would maximally nest the affine and
quadratic Gaussian models in a simple and tractable framework.
## 4.2 Term-Structure Derivatives
An important application of term-structure models is the arbitrage-free val-
uation of derivatives. Some of the most common derivatives are listed below,
abstracting from many institutional details that can be found in a standard
reference such as Sundaresan [1997].
(a) A European option expiring at time s on a zero-coupon bond maturing
at some later time u, with strike price p, is a claim to (Λs,u −p)+
at s.
(b) A forward-rate agreement (FRA) calls for a net payment by the fixed-
rate payer of c∗
−c(s) at time s, where c∗
is a fixed payment and c(s) is
a floating-rate payment for a time-to-maturity δ, in arrears, meaning
60that c(s) = Λ−1
s−δ,s −1 is the simple interest rate applying at time s−δ
for loans maturing at time s. In practice, we usually have a time to
maturity, δ, of one quarter or one half year. When originally sold,
the fixed-rate payment c∗
is usually set so that the FRA is at market,
meaning of zero market value. Cox, Ingersoll, and Ross [1981], Duffie
and Stanton [1988], and Grinblatt and Jegadeesh [1996] consider the
relative pricing of futures and forwards.
(c) An interest-rate swap is a portfolio of FRAs maturing at a given in-
creasing sequence t(1),t(2), ...,t(n) of coupon dates. The inter-coupon
interval t(i) − t(i − 1) is usually 3 months or 6 months. The associ-
ated FRA for date t(i) calls for a net payment by the fixed-rate payer
of c∗
− c(t(i)), where the floating-rate payment received is c(t(i)) =
Λ−1
t(i−1),t(i) −1, and the fixed-rate payment c∗
is the same for all coupon
dates. At initiation, the swap is usually at market, meaning that the
fixed rate c∗
is chosen so that the swap is of zero market value. Ignor-
ing default risk and market imperfections, this would imply that the
fixed-rate coupon c∗
is the par coupon rate. That is, the at-market
swap rate c∗
is set at the origination date t of the swap so that
1 = c∗
Λt,t(1) + ··· + Λt,t(n)

+ Λt,t(n),
meaning that c∗
is the coupon rate on a par bond, one whose face value
and initial market value are the same. Swap markets are analyzed
by Brace and Musiela [1994], Carr [1993], Collin-Dufresne and Solnik
[2001], Duffie and Huang [1996], Duffie and Singleton [1997], El Karoui
and Geman [1994], and Sundaresan [1997]. For institutional and gen-
eral economic features of swap markets, see Lang, Litzenberger, and
Liu [1996] and Litzenberger [1992].
(d) A cap can be viewed as portfolio of “caplet” payments of the form
(c(t(i)) − c∗
)+
, for a sequence of payment dates t(1),t(2),...,t(n) and
floating rates c(t(i)) that are defined as for a swap. The fixed rate c∗
is
set with the terms of the cap contract. For the valuation of caps, see, for
example, Chen and Scott [1995], Clewlow, Pang, and Strickland [1997],
Miltersen, Sandmann, and Sondermann [1997], and Scott [1996]. The
basic idea is to view a caplet as a put option on a zero-coupon bond
(e) A floor is defined symmetrically with a cap, replacing (c(t(i)) − c∗
)+
with (c∗
− c(t(i)))+
.
61(f) A swaption is an option to enter into a swap at a given strike rate
c∗
at some exercise time. If the future time is fixed, the swaption
is European. Pricing of European swaptions is developed in Gaus-
sian settings by Jamshidian [1989b], Jamshidian [1989a], Jamshidian
[1989c], Jamshidian [1991a], and more generally in affine settings by
Berndt [2002], Collin-Dufresne and Goldstein [2001a] and Singleton
and Umantsev [2001]. An important variant, the Bermudan swaption,
allows exercise at any of a given set of successive coupon dates. For
valuation methods, see Andersen and Andreasen [1999] and Longstaff
and Schwartz [1998].
Jamshidian [1999], Rutkowski [1996], and Rutkowski [1998] offer general
treatments of LIBOR (London Interbank Offering Rate) derivative model-
ing.23
Path-dependent derivative securities, such as mortgage-backed securi-
ties, sometimes call for additional state variables.24
In a one-factor setting, suppose a derivative has a payoff at some given
time s defined by g(rs). By the definition of an equivalent martingale mea-
sure, the price at time t for such a security is
F(rt,t) ≡ EQ
t

exp

−
Z s
t
ru du

g(rs)

.
Under technical conditions on µ, σ, and g, we know that F solves the PDE,
for (x,t) ∈ R × [0,s),
Ft(x,t) + Fx(x,t)µ(x,t) +
1
2
Fxx(x,t)σ(x,t)2
− xF(x,t) = 0, (71)
23
On the valuation of other specific forms of term-structure derivatives, see Artzner and
Roger [1993], Bajeux-Besnainou and Portait [1998], Brace and Musiela [1994], Chacko
and Das [1998], Chen and Scott [1992], Chen and Scott [1993], Cherubini and Esposito
[1995], Chesney, Elliott, and Gibson [1993], Cohen [1995], Daher, Romano, and Zacklad
[1992], Décamps and Rochet [1997], El Karoui, Lepage, Myneni, Roseau, and Viswanathan
[1991b], El Karoui, Lepage, Myneni, Roseau, and Viswanathan [1991a], and Turnbull
[1993], Fleming and Whaley [1994] (wildcard options), Ingersoll [1977] (convertible bonds),
Jamshidian [1993a]; Jamshidian [1994] (diff swaps and quantos), Jarrow and Turnbull
[1994], Longstaff [1990] (yield options), and Turnbull [1994].
24
The pricing of mortgage-backed securities based on term-structure models is pur-
sued by Boudoukh, Richardson, Stanton, and Whitelaw [1995], Cheyette [1996], Jakobsen
[1992], Stanton [1995], Stanton and Wallace [1995], and Stanton and Wallace [1998], who
also review some of the related literature.
62with boundary condition
F(x,s) = g(x), x ∈ R.
For example, the valuation of a zero-coupon bond option is given, in a
one-factor setting, by the solution F to (71), with boundary value g(x) =
[f(x,s) − p]+
, where f(x,s) is the price at time s of a zero-coupon bond
maturing at u.
## 4.3 Fundamental Solution
Under technical conditions, we can also express the solution F of the PDE
(71) for the value of a derivative term-structure security in the form
F(x,t) =
Z +∞
−∞
G(x,t,y,s)g(y)dy, (72)
where G is the fundamental solution of the PDE (71). One may think of
G(x,t,y,s)dy as the price at time t, state x, of an “infinitesimal security”
paying one unit of account in the event that the state is at level y at time
s, and nothing otherwise. One can compute the fundamental solution G by
solving a PDE that is “dual” to (71), in the following sense. Under technical
conditions, for each (x,t) in R × [0,T), a function ψ ∈ C2,1
(R × (0,T]) is
defined by ψ(y,s) = G(x,t,y,s), and solves the forward Kolmogorov equation
(also known as the Fokker-Planck equation):
D∗
ψ(y,s) − yψ(y,s) = 0, (73)
where
D∗
ψ(y,s) = −ψs(y,s) −
∂
∂y
[ψ(y,s)µ(y,s)] +
1
2
∂2
∂y2

ψ(y,s)σ(y,s)2

.
The “intuitive” boundary condition for (73) is obtained from the role of G
in pricing securities. Imagine that the current short rate at time t is x, and
consider an instrument that pays one unit of account immediately, if and
only if the current short rate is some number y. Presumably this contingent
claim is valued at 1 unit of account if x = y, and otherwise has no value.
From continuity in s, one can thus think of ψ(·,s) as the density at time s
of a measure on R that converges as s ↓ t to a probability measure ν with
63ν({x}) = 1, sometimes called the Dirac measure at x. This initial boundary
condition on ψ can be made more precise. See, for example, Karatzas and
Shreve [1988] for details.
Applications to term-structure modeling of the fundamental solution,
sometimes erroneously called the “Green’s function,” are illustrated by Büttler
and Waldvogel [1996], Dash [1989], Beaglehole [1990], Beaglehole and Ten-
ney [1991], Büttler and Waldvogel [1996], Dai [1994], and Jamshidian [1991b].
For example, Beaglehole and Tenney [1991] show that the fundamental so-
lution G of the Cox-Ingersoll-Ross model (69) is given explicitly in terms of
the parameters κ, x, and C by
G(x,0,y,t) =
ϕ(t)Iq ϕ(t)
√
xye−γt

exp[ϕ(t)(y + xe−γt) − η(x + κxt − y)]

eγt
y
x
q/2
,
where γ = (κ2
+ 2C2
)1/2
, η = (κ − γ)/C2
,
ϕ(t) =
2γ
C2(1 − e−γt)
, q =
2κx
C2
− 1,
and Iq(·) is the modified Bessel function of the first kind of order q. For
time-independent µ and σ, as with the CIR model, we have, for all t and
s > t, G(x,t,y,s) = G(x,0,y,s − t).
The fundamental solution for the Dothan (log-normal) short-rate model
can be deduced from the form of the solution by Hogan [1993] of what he
calls the “conditional discounting function.” Chen [1996] provides the fun-
damental solution for his 3-factor affine model. Van Steenkiste and Foresi
[1999] provide a general treatment of fundamental solutions of the PDE for
affine models. For more technical details and references, see, for example,
Karatzas and Shreve [1988].
Given the fundamental solution G, the derivative asset price function F
is more easily computed by numerically integrating (72) than from a direct
numerical attack on the PDE (71). Thus, given a sufficient number of deriva-
tive securities whose prices must be computed, it may be worth the effort to
compute G.
## 4.4 Multifactor Term-Structure Models
The one-factor model (66) for the short rate is limiting. Even a casual review
of the empirical properties of the term structure, for example as reviewed in
64the surveys of Dai and Singleton [2001] and Piazzesi [2002], shows the sig-
nificant potential improvements in fit offered by a multifactor term-structure
model. While terminology varies from place to place, by a “multifactor”
model, we mean a model in which the short rate is of the form rt = R(Xt,t),
t ≥ 0, where X is a Markov process with a state space D that is some subset
of Rk
, for k > 1. For example, in much of the literature, X is Ito process in
solving a stochastic differential equation of the form
dXt = µ(Xt,t)dt + σ(Xt,t)dBQ
t , (74)
where BQ
is a standard Brownian motion in Rd
under Q and the given
functions R, µ, and σ on D×[0,∞) into R, Rk
, and Rk×d
, respectively, satisfy
enough technical regularity to guarantee that (74) has a unique solution and
that the term structure (65) is well defined.
In empirical applications, one often supposes that the state process X
also satisfies a stochastic differential equation under the probability measure
P, in order to exploit the time-series behavior of observed prices and price-
determining variables in estimating the model.
There are various approaches for identifying the state vector Xt. In cer-
tain models, some or all elements of the state vector Xt are latent, that is,
unobservable to the modeler, except insofar as they can be inferred from
prices that depend on the levels of X. For example, k state variables might
be identified from bond yields at k distinct maturities. Alternatively, one
might use both bond and bond option prices, as in Singleton and Umant-
sev [2001], or Collin-Dufresne and Goldstein [2001a] and Collin-Dufresne and
Goldstein [2001b]. This is typically possible once one knows the parameters,
as explained below, but the parameters must of course be estimated at the
same time as the latent states are estimated. This latent-variable approach
has nevertheless been popular in much of the empirical literature. Notable
examples include Dai and Singleton [2000], and references cited by them.
Another approach is to take some or all of the state variables to be directly
observable variables, such as macro-economic determinants of the business
cycle and inflation, that are thought to play a role in determining the term
structure. This approach has also been explored by Piazzesi [1999], among
others.25
25
See, also Babbs and Webber [1994], Balduzzi, Bertola, Foresi, and Klapper [1998],
and Piazzesi [1997]. On modeling the term-structure of real interest rates, see Brown and
Schaefer [1996] and Pennacchi [1991].
65A derivative security, in this setting, can often be represented in terms of
some real-valued terminal payment function g on Rk
, for some maturity date
s ≤ T. By the definition of an equivalent martingale measure, the associated
derivative security price is
F(Xt,t) = EQ
t

exp

−
Z s
t
R(Xu,u)du

g(Xs)

.
For the case of a diffusion state process X satisfying (74, extending (71),
under technical conditions we have the PDE characterization
DF(x,t) − R(x,t)F(x,t) = 0, (x,t) ∈ D × [0,s), (75)
with boundary condition
F(x,s) = g(x), x ∈ D, (76)
where
DF(x,t) = Ft(x,t) + Fx(x,t)µ(x,t) +
1
2
tr

σ(x,t)σ(x,t)>
Fxx(x,t)

.
The case of a zero-coupon bond is g(x) ≡ 1. Under technical conditions,
we can also express the solution F, as in (72), in terms of the fundamental
solution G of the PDE (75).
## 4.5 Affine Models
Many financial applications including term-structure modeling are based on a
state process that is Markov, under some reference probability measure that,
depending on the application, may or may not be an equivalent martingale
measure. We will fix the probability measure P for the current discussion.
A useful assumption is that the Markov state process is “affine.” While
several equivalent definitions of the class of affine processes can be usefully
applied, perhaps the simplest definition of the affine property for a Markov
process X in a state space D ⊂ Rd
is that its conditional characteristic
function is of the form, for any u ∈ Rd
,
E eiu·X(t)
|X(s)

= eϕ(t−s,u)+ψ(t−s,u)·X(s)
. (77)
66for some deterministic coefficients ϕ(t−s,u) and ϕ(t−s,u). Duffie, Filipović,
and Schachermayer [2001] show that, for a time-homogeneous26
affine process
X with a state space of the form Rn
+ × Rd−n
, provided the coefficients ϕ(·)
and ϕ(·) of the characteristic function are differentiable and their derivatives
are continuous at 0, the affine process X must be a jump-diffusion process,
in that
dXt = µ(Xt)dt + σ(Xt)dBt + dJt, (78)
for a standard Brownian motion B in Rd
and a pure-jump process J, and
moreoever the drift µ(Xt), the “instantaneous” covariance matrix σ(Xt)σ(Xt)0
,
and the jump measure associated with J must all have affine dependence on
the state Xt. This result also provides necessary and sufficient conditions on
the coefficients of the drift, diffusion, and jump measure for the process to be
a well defined affine process, and provides that the coefficients ϕ(·,u) and
ϕ(·,u) of the characteristic function satisfy a certain (generalized Riccati)
ordinary differential equation (ODE), the key to tractability for this class
of processes.27
Conversely, any jump-diffusion whose coefficients are of this
affine class is an affine process in the sense of (77). A complete statement of
this result is found Duffie, Filipović, and Schachermayer [2001].
Simple examples of affine processes used in financial modeling are the
Gaussian Ornstein-Uhlenbeck model, applied to interest rates by Vasicek
[1977], and the Feller [1951] diffusion, applied to interest-rate modeling by
Cox, Ingersoll, and Ross [1985b], as already mentioned in the context of one-
factor models. A general multivariate class of affine term-structure jump-
diffusion models was introduced by Duffie and Kan [1996] for term-structure
modeling. Dai and Singleton [2000] classified 3-dimensional affine diffusion
models, and found evidence in U.S. swap rate data of that both time-varying
conditional variances and negatively correlated state variables are essential
ingredients to explaining the historical behavior of term structures.
For option pricing, there is a substantial literature building on the partic-
ular affine stochastic-volatility model for currency and equity prices proposed
by Heston [1993]. Bates [1997], Bakshi, Cao, and Chen [1997], Bakshi and
Madan [2000], and Duffie, Pan, and Singleton [2000] brought more general
affine models to bear in order to allow for stochastic volatility and jumps,
26
Filipović [2001] extends to the time inhomogeneous case.
27
Recent work, yet to be distributed, by Martino Graselli of CREST, Paris, and Claudio
Tebaldi, provides explicit solutions for the Riccati equations of any multi-factor affine
process.
67while maintaining and exploiting the simple property (77).
A key property related to (77) is that, for any affine function R : D → R
and any w ∈ Rd
, subject only to technical conditions reviewed in Duffie,
Filipović, and Schachermayer [2001],
Et
h
e
R s
t −R(X(u)) du+w·X(s)
i
= eα(s−t)+β(s−t)·X(t)
, (79)
for coefficients α(·) and β(·) that satisfy generalized Riccati ODEs (with real
boundary conditions) of the same type solved by ϕ and ψ of (77), respectively.
In order to get a quick sense of how the Riccati equations for α(·) and
β(·) arise, we consider the special case of an affine diffusion process X solving
the stochastic differential equation (78), with state space D = R+, and with
µ(x) = a+bx and σ2
(x) = cx, for constant coefficients a, b, and c. (This is the
continuous branching process of Feller [1951].) We let R(x) = ρ0 + ρ1x, for
constants ρ0 and ρ1, and apply the Feynman-Kac partial differential equation
(PDE) (68) to the candidate solution eα(s−t)+β(s−t)·x
of (79). After calculating
all terms of the PDE and then dividing each term of the PDE by the common
factor eα(s−t)+β(s−t)·x
, we arrive at
−α0
(z) − β0
(z)x + β(z)(a + bx) +
1
2
β(z)2
c2
x − ρ0 − ρ1x = 0, (80)
for all z ≥ 0. Collecting terms in x, we have
u(z)x + v(z) = 0, (81)
where
u(z) = −β0
(z) + β(z)b +
1
2
β(z)2
c2
− ρ1 (82)
v(z) = −α0
(z) + β(z)a − ρ0. (83)
Because (81) must hold for all x, it must be the case that u(z) = v(z) = 0.
This leaves the Riccati equations:
β0
(z) = β(z)b +
1
2
β(z)2
c2
− ρ1 (84)
α0
(z) = β(z)a − ρ0, (85)
with the boundary conditions α(0) = 0 and β(0) = w, from (79) for s = t.
The explicit solutions for α(z) and β(z) were stated earlier for the CIR model
68(the case w = 0), and are given explcitly in a more general case with jumps,
called a “basic affine process,” in Duffie and Gârleanu [2001].
Beyond the Gaussian case, any Ornstein-Uhlenbeck process, whether
driven by a Brownian motion (as for the Vasicek model) or by a more
general Lévy process with jumps, as in Sato [1999], is affine. Moreover,
any continuous-branching process with immigration (CBI process), includ-
ing multi-type extensions of the Feller process, is affine. (See Kawazu and
Watanabe [1971].) Conversely, as shown by Duffie, Filipović, and Schacher-
mayer [2001], an affine process in Rd
+ is a CBI process.
For term-structure modeling,28
the state process X is typically assumed
to be affine under a given equivalent martingale measure Q. For econometric
modeling of bond yields, the affine assumption is sometimes also made under
the data-generating measure P, although Duffee [1999b] suggests that this is
overly restrictive from an empirical viewpoint, at least for 3-factor models of
U.S. interest rates that do not have jumps. For general reviews of this issue,
and summaries of the empirical evidence on affine term structure models, see
Dai and Singleton [2001] and Piazzesi [2002]. The affine class allows for the
analytic calculation of bond option prices on zero-coupon bonds and other
derivative securities, as reviewed in Section 5, and extends to the case of de-
faultable models, as we show in Section 6. For related computational results,
see Liu, Pan, and Pedersen [1999] and Van Steenkiste and Foresi [1999]. Sin-
gleton [2001] exploits the explicit form of the characteristic function of affine
models to provide a class of moment conditions for econometric estimation.
## 4.6 The HJM Model of Forward Rates
We turn to the term structure model of Heath, Jarrow, and Morton [1992].
Until this point, we have taken as the primitive a model of the short-rate
process of the form rt = R(Xt,t), where (under some equivalent martingale
measure) X is a finite-dimensional Markov process. This approach has ana-
lytical advantages, especially for derivative pricing and statistical modeling.
A more general approach that is especially popular in business applications
28
Special cases of affine term-structure models include those of Balduzzi, Das, and Foresi
[1998], Balduzzi, Das, Foresi, and Sundaram [1996], Baz and Das [1996], Berardi and
Esposito [1999], Chen [1996], Cox, Ingersoll, and Ross [1985b], Das [1993], Das [1995], Das
[1997], Das [1998], Das and Foresi [1996], Duffie and Kan [1996], Duffie, Pedersen, and
Singleton [2000], Heston [1988], Langetieg [1980], Longstaff and Schwartz [1992], Longstaff
and Schwartz [1993], Pang and Hodges [1995], and Selby and Strickland [1993].
69is to directly model the risk-neutral stochastic behavior of the entire term
structure of interest rates. This is the essence of the Heath-Jarrow-Morton
(HJM) model. The remainder of this section is a summary of the basic
elements of the HJM model.
If the discount Λt,s is differentiable with respect to the maturity date s,
a mild regularity, we can write
Λt,s = exp

−
Z s
t
f(t,u)du

,
where
f(t,u) = −
1
Λt,u
∂Λt,u
∂u
.
The term structure can thus be represented in terms of the instantaneous
forward rates, {f(t,u) : u ≥ t}.
The HJM approach is to take as primitive a particular stochastic model
of these forward rates. First, for each fixed maturity date s, one models the
one-dimensional forward-rate process f(·,s) = {f(t,s) : 0 ≤ t ≤ s} as an
Ito process, in that
f(t,s) = f(0,s) +
Z t
0
µ(u,s)du+
Z t
0
σ(u,s)dBQ
u , 0 ≤ t ≤ s, (86)
where µ(·,s) = {µ(t,s) : 0 ≤ t ≤ s} and σ(·,s) = {σ(t,s) : 0 ≤ t ≤ s}
are adapted processes valued in R and Rd
respectively such that (86) is well
defined.29
Under purely technical conditions, it must be the case that
µ(t,s) = σ(t,s) ·
Z s
t
σ(t,u)du. (87)
In order to confirm this key risk-neutral drift restriction (87), consider the
Q-martingale M defined by
Mt = EQ
t

exp

−
Z s
0
ru du

= exp

−
Z t
0
ru du

Λt,s
= exp(Xt + Yt),
29
The necessary and sufficient condition is that, almost surely,
Rs
0 |µ(t,s)|dt < ∞ and
Rs
0
σ(t,s) · σ(t,s)t < ∞.
70where
Xt = −
Z t
0
ru du; Yt = −
Z s
t
f(t,u)du.
We can view Y as an infinite sum of the Ito processes for forward rates
over all maturities ranging from t to s. Under technical conditions30
for
Fubini’s Theorem for stochastic integrals, we thus have
dYt = µY (t)dt + σY (t)dBQ
t ,
where
µY (t) = f(t,t) −
Z s
t
µ(t,u)du,
and
σY (t) = −
Z s
t
σ(t,u)du.
We can then apply Ito’s Formula in the usual way to Mt = eX(t)+Y (t)
and
obtain the drift under Q of M as
µM(t) = Mt

µY (t) +
1
2
σY (t) · σY (t) − rt

.
Because M is a Q-martingale, we must have µM = 0, so, substituting µY (t)
into this equation, we obtain
Z s
t
µ(t,u)du =
1
2
Z s
t
σ(t,u)du

·
Z s
t
σ(t,u)du

.
Taking the derivative of each side with respect to s then leaves the risk-
neutral drift restriction (87) which in turn provides, naturally, the property
that r(t) = f(t,t).
Thus, the initial forward rates {f(0,s) : 0 ≤ s ≤ T} and the forward-
rate “volatility” process σ can be specified with nothing more than technical
restrictions, and these are enough to determine all bond and interest-rate
derivative price processes. Aside from the Gaussian special case associated
with deterministic volatility σ(t,s), however, most valuation work in the
HJM setting is typically done by Monte Carlo simulation. Special cases
30
In addition to measurability, it suffices that µ(t,u,ω) and σ(t,u,ω) are uniformly
bounded and, for each ω, continuous in (t,u). For weaker conditions, see Protter [1990].
71aside,31
there is no finite-dimensional state variable for the HJM model, so
PDE-based computational methods cannot be used.
The HJM model has been extensively treated in the case of Gaussian in-
stantaneous forward rates by Jamshidian [1989b], who developed the forward-
measure approach, and Jamshidian [1989a], Jamshidian [1989c], Jamshidian
[1991a], and El Karoui and Rochet [1989], and extended by El Karoui, Lep-
age, Myneni, Roseau, and Viswanathan [1991b], El Karoui, Lepage, Myneni,
Roseau, and Viswanathan [1991a], El Karoui and Lacoste [1992], Frachot
[1995], Frachot, Janci, and Lacoste [1993], Frachot and Lesne [1993], and Mil-
tersen [1994]. A related model of log-normal discrete-period interest rates,
the “market model,” was developed by Miltersen, Sandmann, and Sonder-
mann [1997].32
Musiela [1994b] suggested treating the entire forward-rate curve
g(t,u) = {f(t,t + u) : 0 ≤ u ≤ ∞}
itself as a Markov process. Here, u indexes time to maturity, not date of
maturity. That is, we treat the term structure g(t) = g(t, ·) as an element
of some convenient state space S of real-valued continuously differentiable
functions on [0,∞). Now, letting v(t,u) = σ(t,t + u), the risk-neutral drift
restriction (87) on f, and enough regularity, imply the stochastic partial
differential equation (SPDE) for g given by
dg(t,u) =
∂g(t,u)
∂u
dt + V (t,u)dt + v(t,u)dBQ
t ,
where
V (t,u) = v(t,u) ·
Z u
0
v(t,z)dz.
This formulation is an example of a rather delicate class of SPDEs that
are called “hyperbolic.” Existence is usually not shown, or shown only in
31
See Au and Thurston [1993] Bhar and Chiarella [1995], Cheyette [1995], Jeffrey [1995],
Musiela [1994b], Ritchken and Sankarasubramaniam [1992], and Ritchken and Trevor
[1993].
32
See also Andersen and Andreasen [1998], Brace and Musiela [1995], Dothan [1978],
Goldberg [1998], Goldys, Musiela, and Sondermann [1994], Hansen and Jorgensen [1998],
Hogan [1993], Jamshidian [1996b], Jamshidian [1997], Jamshidian [1999], Sandmann and
Sondermann [1997], Miltersen, Sandmann, and Sondermann [1997], Sandmann and Son-
dermann [1997], and Musiela [1994a], and Vargiolu [1999]. A related log-normal futures-
price term structure model is due to Heath [1998].
72a “weak sense,” as by Kusuoka [2000]. The idea is nevertheless elegant
and potentially important in getting a parsimonious treatment of the yield
curve as a Markov process. One may even allow the Brownian motion BQ
to be “infinite-dimensional.” For related work in this setting, sometimes
called a string, random field, or SPDE model of the term structure, see
Cont [1998], Jong and Santa-Clara [1999], Goldstein [1997], Goldstein [2000],
Goldys and Musiela [1996], Hamza and Klebaner [1995], Kennedy [1994],
Kusuoka [2000], Musiela and Sondermann [1994], Pang [1996], Santa-Clara
and Sornette [1997], and Sornette [1998].
## 5 Derivative Pricing
We turn to a review of the pricing of derivative securities, taking first futures
and forwards, and then turning to options. The literature is immense, and
we shall again merely provide a brief summary of results. Again, we fix a
probability space (Ω,F,P) and a filtration F = {Ft : 0 ≤ t ≤ T} satisfying
the usual condtions, as well as a short-rate process r.
## 5.1 Forward and Futures Prices
We briefly address the pricing of forward and futures contracts, an important
class of derivatives.
The forward contract is the simpler of these two closely related securities.
Let W be an FT -measurable finite-variance random variable underlying the
claim payable to a holder of the forward contract at its delivery date T. For
example, with a forward contract for delivery of a foreign currency at time T,
the random variable W is the market value at time T of the foreign currency.
The forward-price process F is defined by the fact that one forward contract
at time t is a commitment to pay the net amount Ft − W at time T, with
no other cash flows at any time. In particular, the true price of a forward
contract, at the contract date, is zero.
We fix an equivalent martingale measure Q for the available securities,
after deflation by e−
R t
0
r(u)du
, where r is a short-rate process that, for conve-
nience, is assumed to be bounded. The dividend process H defined by the
forward contract made at time t is given by Hs = 0, s < T, and HT = W −Ft.
73Because the true price of the forward contract at t is zero,
0 = EQ
t

exp

−
Z T
t
rs ds

(W − Ft)

.
Solving for the forward price,
Ft =
EQ
t
h
exp

−
RT
t
rs ds

W
i
EQ
t
h
exp

−
R T
t
rs ds
i .
If we assume that there exists at time t a zero-coupon riskless bond maturing
at time T, then
Ft =
1
Λt,T
EQ
t

exp

−
Z T
t
rs ds

W

.
If r and W are statistically independent with respect to Q, we have the
simplified expression Ft = EQ
t (W), implying that the forward price is a Q-
martingale. This would be true, for instance, if the short-rate process r is
deterministic.
As an example, suppose that the forward contract is for delivery at time
T of one unit of a particular security with price process S and cumulative
dividend process D. In particular, W = ST . We can obtain a more concrete
representation of the forward price, as follows. We have
Ft =
1
Λt,T

St − EQ
t
Z T
t
exp

−
Z s
t
ru du

dDs

.
If the short-rate process r is deterministic, we can simplify further to
Ft =
St
Λt,T
− EQ
t
Z T
t
exp
Z T
s
ru du

dDs

, (88)
which is known as the cost-of-carry formula for forward prices for the case
in which interest rates and dividends are deterministic.
As with a forward contract, a futures contract with delivery date T is
keyed to some delivery value W, which we take to be an FT -measurable
random variable with finite variance. The contract is completely defined
by a futures-price process Φ with the property that ΦT = W. As we shall
74see, the contract is literally a security whose price process is zero and whose
cumulative dividend process is Φ. In other words, changes in the futures
price are credited to the holder of the contract as they occur.
This definition is an abstraction of the traditional notion of a futures
contract, which calls for the holder of one contract at the delivery time T to
accept delivery of some asset (whose spot market value at T is represented
here by W) in return for simultaneous payment of the current futures price
ΦT . Likewise, the holder of −1 contract, also known as a short position of
1 contract, is traditionally obliged to make delivery of the same underlying
assset in exchange for the current futures price ΦT . This informally justifies
the property ΦT = W of the futures-price process Φ given in the definition
above. Roughly speaking, if ΦT is not equal to W (and if we continue to
neglect transactions costs and other details), there is a delivery arbitrage.
We won’t explicitly define a delivery arbitrage since it only complicates the
analysis of futures prices that follows. Informally, however, in the event that
W > ΦT , one could buy at time T the deliverable asset for W, simultaneously
sell one futures contract, and make immediate delivery for a profit of W −ΦT .
Thus the potential of delivery arbitrage will naturally equate ΦT with the
delivery value W. This is sometimes known as the principle of convergence.
Many modern futures contracts have streamlined procedures that avoid
the delivery process. For these, the only link that exists with the notion
of delivery is that the terminal futures price ΦT is contractually equated
to some such variable W, which could be the price of some commodity or
security, or even some abstract variable of general economic interest such as
a price deflator. This procedure, finessing the actual delivery of some asset,
is known as cash settlement. In any case, whether based on cash settlement
or the absence of delivery arbitrage, we shall always take it by definition that
the delivery futures price ΦT is equal to the given delivery value W.
The institutional feature of futures markets that is central to our analy-
sis of futures prices is resettlement, the process that generates daily or even
more frequent payments to and from the holders of futures contracts based
on changes in the futures price. As with the expression “forward price,” the
term “futures price” can be misleading in that the futures price Φt at time t
is not at all the price of the contract. Instead, at each resettlement time t,
an investor who has held θ futures contracts since the last resettlement time,
say s, receives the resettlement payment θ(Φt − Φs), following the simplest
resettlement recipe. More complicated resettlement arrangements often ap-
ply in practice. The continuous-time abstraction is to take the futures-price
75process Φ to be an Ito process and a futures position process to be some
θ in L(Φ) generating the resettlement gain
R
θdΦ as a cumulative-dividend
process. In particular, as we have already stated in its definition, the futures-
price process Φ is itself, formally speaking, the cumulative dividend process
associated with the contract. The true price process is zero, since (again
ignoring some of the detailed institutional procedures), there is no payment
against the contract due at the time a contract is bought or sold.
The futures-price process Φ can now be characterized as follows. We
suppose that the short-rate process r is bounded. For all t, let Yt = e−
R t
0 r(s)ds
.
Because Φ is strictly speaking the cumulative-dividend process associated
with the futures contract, and since the true-price process of the contract is
zero, from the fact that the risk-neutral discounted gain is a martingale,
0 = EQ
t
Z T
t
Ys dΦs

, t ≤ T,
from which it follows that the stochastic integral
R
Y dΦ is a Q-martingale.
Because r is bounded, there are constants k1 > 0 and k2 such that k1 ≤
Yt ≤ k2 for all t. The process
R
Y dΦ is therefore a Q-martingale if and only
if Φ is also a Q-martingale. Since ΦT = W, we have deduced a convenient
representation for the futures-price process:
Φt = EQ
t (W), t ∈ [0,T]. (89)
If r and W are statistically independent under Q, the futures-price pro-
cess Φ and the forward-price process F are thus identical. Otherwise, as
pointed out by Cox, Ingersoll, and Ross [1981], there is a distinction based
on correlation between changes in futures prices and interest rates.
## 5.2 Options and Stochastic Volatility
The Black-Scholes formula, which treats option prices under constant volatil-
ity, can be extended to cases with stochastic volatility, which is crucial in
many markets from an empirical viewpoint. We will briefly examine several
basic approaches, and then turn to the computation of option prices using
the Fourier-transform method introduced by Stein and Stein [1991], and then
first exploited in an affine setting by Heston [1993].
We recall that the Black-Scholes option-pricing formula is of the form
C(x,p,r,t,σ), for C : R5
+ → R+, where x is the current underlying asset
76price, p is the exercise price, r is the constant short rate, t is the time to
expiration, and σ is the volatility coefficient for the underlying asset. For
each fixed (x,p,r,t) with non-zero x and t, the map from σ to C(x,p,r,t,σ)
is strictly increasing, and its range is unbounded. We may therefore invert
and obtain the volatility from the option price. That is, we can define an
implied volatility function I : R5
+ → R+ by
c = C(x,p,r,t,I(x,p,r,t,c)), (90)
for all sufficiently large c ∈ R+.
If c1 is the Black-Scholes price of an option on a given asset at strike p1
and expiration t1, and c2 is the Black-Scholes price of an option on the same
asset at strike p2 and expiration t2, then the associated implied volatilities
I(x,p1,r,t1,c1) and I(x,p2,r,t2,c2) must be identical, if indeed the assump-
tions underlying the Black-Scholes formula apply literally, and in particular
if the underlying asset-price process has the constant volatility of a geomet-
ric Brownian motion. It has been widely noted, however, that actual market
prices for European options on the same underlying asset have associated
Black-Scholes implied volatilities that vary with both exercise price and ex-
piration date. For example, in certain markets at certain times, the implied
volatilities of options with a given exercise date depend on strike prices in a
manner that is often termed a smile curve. Figure 1 illustrates the depen-
dence of Black-Scholes implied volatilities on moneyness (the ratio of strike
price to futures price), for various S-and-P 500 index options on November 2,
1993. Other forms of systematic deviation from constant implied volatilities
have been noted, both over time and across various derivatives at a point in
time.
Three major lines of modeling address these systematic deviations from
the assumptions underlying the Black-Scholes model. In all of these, a key
step is to generalize the underlying log-normal price process by replacing
the constant volatility parameter σ of the Black-Scholes model with
√
Vt, an
adapted non-negative process V with
RT
0
Vt dt < ∞ such that the underlying
asset price process S satisfies
dSt = rtSt dt + St
p
Vt dS
t , (91)
where BQ
is a standard Brownian motion in Rd
under the given equivalent
martingale measure Q, and S
= cS · BQ
is a standard Brownian motion
under Q obtained from any cS in Rd
with unit norm.
77Black-Scholes Implied Vol (%)
Moneyness = Strike/Futures
6
8
10
12
14
16
18
20
22
24
0.6 0.7 0.8 0.9 1 1.1 1.2
17 days
45 days
80 days
136 days
227 days
318 days
Figure1: “Smile curves” implied by SP500 Index options of 6 different times
to expiration, from market data for November 2, 1993.
In the first class of models, Vt = v(St,t), for some function v : R×[0,T] →
R satisfying technical regularity conditions. In practical applications, the
function v, or its discrete-time discrete-state analogue, is often “calibrated”
to the available option prices. This approach, sometimes referred to as the
implied-tree model, was developed by Dupire [1994], Rubinstein [1995], and
Jackwerth and Rubinstein [1996].
For a second class of models, called autoregressive conditional heteroscedas-
tic, or ARCH, the volatility depends on the path of squared returns, as
formulated by Engle [1982]. The GARCH (generalized ARCH) variant has
the the squared volatility Vt at time t of the discrete-period return Rt+1 =
78logSt+1 − logSt adjusting according to the recursive formula
Vt = a + bVt−1 + cR2
t , (92)
for fixed coefficients a, b, and c satisfying regularity conditions. By taking a
time period of length h, normalizing in a natural way, and taking limits, a
natural continous-time limiting behavior for volatility is simply a determin-
istic mean-reverting process V satisfying the ordinary differential equation
dV (t)
dt
= κ(v − V (t)). (93)
Corradi [2000] explains that this deterministic continuous-time limit is more
natural than the stochastic limit of Nelson [1990]. For both the implied-tree
approach and the GARCH approach, the volatility process V depends only
on the underlying asset prices; volatility is not a separate source of risk.
In a third approach, however, the increments of the squared-volatility
process V depend on Brownian motions that are not perfectly correlated
with S
. For example, in a simple “one-factor” setting,
dVt = µV (Vt)dt + σV (Vt)dV
t , (94)
where V
= cV ·BQ
is a standard Brownian motion under Q, for some constant
vector cV of unit norm. As we shall see, the correlation parameter cSV =
cS · cV has an important influence on option prices.
The price of a European option at exercise price p and expiration at time
t is
f(Ss,Vs,s) = EQ
s

e−r(t−s)
(St − p)+

,
which can be solved, for example, by reducing to a PDE and applying, if
necessary, a finite-difference approach.
In many settings, a pronounced skew to the smile, as in Figure 1, indicates
an important potential role for correlation between the increments of the
return-driving and volatility-driving Brownian motions, S
and V
. This
role is borne out directly by the correlation apparent from time-series data
on implied volatilities and returns for certain important asset classes, as
indicated for example by Pan [1999].
A tractable model that allows for the skew effects of correlation is the
Heston model, the special case of (94) for which
dVt = κ(v − Vt)dt + σv
p
Vt dV
t , (95)
79for positive coefficients κ, v, and σv that play the same respective roles for V
as for a Cox-Ingersoll-Ross interest rate model. Indeed, this Feller diffusion
model of volatility (95) is sometimes called a “CIR volatility model.” In the
original Heston model, the short rate is a constant, say r, and option prices
can be computed analytically, using transform methods explained later in
this section, in terms of the parameters (r,cSV ,κ,v,σv) of the Heston model,
as well as the initial volatility V0, the initial underlying price S0, the strike
price, and the expiration time.
Figure 2 shows the “smile curves,” for the same options illustrated in Fig-
ure ??, that are implied by the Heston model for parameters, including V0,
chosen to minimize the sum of squared differences between actual and theo-
retical option prices, a calibration approach popularized for this application
by Bates [1997]. Notably, the distinctly downward slopes, often called skews,
are captured with a negative correlation coefficient cSV . Adopting a short
rate r = 0.0319 that roughly captures the effects of contemporary short-term
interest rates, the remaining coeffcients of the Heston model are calibrated
to cSV = −0.66, κ = 19.66, v = 0.017, σv = 1.516, and
√
V0 = 0.094.
Going beyond the calibration approach, time-series data on both options
and underlying prices have been used simultaneously to fit the parameters
of various stochastic-volatility models, for example by Aı̈t-Sahalia, Wang,
and Yared [1998], Benzoni [1998], Chernov and Ghysels [2000], Guo [1998],
Pan [1999], Poteshman [1998], and Renault and Touzi [1992]. The empirical
evidence for S-and-P 500 index returns and option prices suggests that the
Heston model is overly restrictive for these data. For example, Pan [1999]
rejects the Heston model in favor of a generalization with jumps in returns,
proposed by Bates [1997], that is a special case of the affine model for option
pricing to which we now turn.
## 5.3 Option Valuation by Transform Analysis
We now address the calculation of option prices with stochastic volatility and
jumps in an affine setting of the type already introduced for term-structure
modeling, a special case being the model of Heston [1993]. We use an ap-
proach based on transform analysis that was initiated by Stein and Stein
[1991] and Heston [1993], allowing for relatively rich and tractable specifica-
tions of stochastic interest rates and volatility, and for jumps. This approach
and the underlying stochastic models were subsequently generalized by Bak-
shi, Cao, and Chen [1997], Bakshi and Madan [2000], Bates [1997], and
80Black-Scholes Implied Vol (%)
Moneyness = Strike/Futures
6
8
10
12
14
16
18
20
22
24
0.6 0.7 0.8 0.9 1 1.1
17 days
45 days
80 days
136 days
227 days
318 days
Figure2: “Smile curves” calculated for SP500 Index options of 6 different
exercise dates, November 2, 1993, using the Heston Model.
Duffie, Pan, and Singleton [2000].
We assume that there is a state process X that is affine under Q in a
state space D ⊂ Rk
, and that the short-rate process r is of the affine form
rt = ρ0 + ρ1 · Xt, for coefficients ρ0 in R and ρ1 in Rk
. The price process S
underling the options in question is assumed to be of the exponential-affine
form St = ea(t)+b(t)·X(t)
, for potentially time-dependent coefficients a(t) in
R and b(t) in Rk
. An example would be the price of an equity, a foreign
currency, or, as shown earlier in the context of affine term-structure models,
the price of a zero-coupon bond.
The Heston model (95) is a special case, for an affine process X =
(X(1)
,X(2)
), with X
(1)
t = Yt ≡ log(St), and X
(2)
t = Vt, and with a constant
81short rate r = ρ0. From Ito’s Formula,
dYt =

r −
1
2
Vt

dt +
p
Vt dS
t , (96)
which indeed makes the state vector Xt = (Yt,Vt) an affine process, whose
state space is D = R × [0,∞), as we can see from the fact that the drift
and instantaneous covariance matrix of Xt are affine with respect to Xt. The
underlying asset price is indeed of the desired exponential-affine form because
St = eY (t)
. We will return to the Heston model shortly with some explicit
results on option valuation.
One of the affine models generalizing Heston’s that was tested by Pan
[1999] took
dYt =

r −
1
2
Vt

dt +
p
Vt dS
t + dZt, (97)
where, under the equivalent martingale measure Q, Z is a pure-jump process
whose jump times have an arrival intensity (as defined in Section 6) that
is affine with respect to the volatility process V , and whose jump sizes are
independent normals.
For the general affine case, suppose we are interested in valuing a Euro-
pean call option on the underlying security, with strike price p and exercise
date t. We have the initial option price
U0 = EQ

exp

−
Z t
0
ru du

(Su − p)+

.
Letting A denote the exercise event {ω : S(ω,t) ≥ p}, we have the option
price
U0 = EQ

exp

−
Z t
0
rs ds

(St1A − p1A)

.
Because S(t) = ea(t)+b(t)·X(t)
,
U0 = ea(t)
G(−logp + a(t);t,b(t),−b(t))
−pG(−logp + a(t);t,0,−b(t)), (98)
where, for any y ∈ R and for any coefficient vectors d and δ in Rk
,
G(y;t,d,δ) = EQ

exp

−
Z t
0
rs ds

ed·X(t)
1δ·X(t)≤y

. (99)
82So, if we can compute the function G, we can obtain the prices of op-
tions of any strike and exercise date. Likewise, the prices of European puts,
interest-rate caps, chooser options, and many other derivatives can be de-
rived in terms of G. For example, following this approach of Heston [1993],
the valuation of discount bond options and caps in an affine setting was un-
dertaken by Chen and Scott [1995], Duffie, Pan, and Singleton [2000], Nunes,
Clewlow, and Hodges [1999], and Scaillet [1996].
We note, for fixed (t,d,δ), assuming EQ

e−
R t
0 r(u)du
ed·X(t)

< ∞, that
G(·;t,d,δ) is a bounded increasing function. For any such function g : R →
[0,∞), an associated transform ĝ : R → C, where C is the set of complex
numbers, is defined by
ĝ(z) =
Z +∞
−∞
eizy
dg(y), (100)
where i is the usual imaginary number, often denoted
√
−1. Depending on
one’s conventions, one may refer to ĝ as the Fourier transform of g. Under
the technical condition that
R+∞
−∞
|ĝ(z)|dz < ∞, we have the Lévy Inversion
Formula
g(y) =
ĝ(0)
2
−
1
π
Z ∞
0
1
z
Im[e−izy
ĝ(z)]dz, (101)
where Im(c) denotes the imaginary part of a complex number c.
For the case g(·) = G(·;t,d,δ),with the associated transform Ĝ(·;t,d,δ)
we can compute G(y;t,d,δ) from (101), typically by computing the integral
in (101) numerically, and thereby obtain option prices from (98). Our fi-
nal objective is therefore to compute the transform Ĝ. Fixing z, and ap-
plying Fubini’s Theorem to (100), we have Ĝ(z;t,d,δ) = f(X0,0), where
f : D × [0,t] → C is defined by
f(Xs,s) = EQ
h
e−
R t
s
r(u)du
ed·X(t)
eizδ·X(t)
Xs
i
. (102)
From (102), the same separation-of-variables arguments used to treat the
affine term-structure models imply, under technical regularity conditions,
that
f(x,s) = eα(t−s)+β(t−s)·x
, (103)
where (α,β) solves the generalized Riccati ordinary differential equation
(ODE) associated with the affine model and the coefficients ρ0 and ρ1 of the
83short rate. The solutions for α(·) and β(·) are complex numbers, in light
of the complex boundary condition β(0) = d+izδ. For technical details, see
Duffie, Filipović, and Schachermayer [2001].
Thus, under technical conditions, we have our transform Ĝ(z;t,d,δ), eval-
uated at a particular z. We then have the option-pricing formula (98), where
G(y;t,d,δ) is obtained from the inversion formula (101) applied to the trans-
forms Ĝ(·;t,b(t),−b(t)) and Ĝ(·;t,0,−b(t)).
For option pricing with the Heston model, we require only the transform
ψ(u) = e−rt
EQ
[euY (t)
], for some particular choices of u ∈ C. Heston [1993]
solved the Riccati equation for this case, arriving at
ψ(u) = eᾱ(t,u)+uY (0)+β̄(t,u)V (0)
,
where, letting b = uσvcSV − κ, a = u(1 − u), and γ =
p
b2 + aσ2
v,
β̄(t,u) = −
a(1 − e−γt
)
2γ − (γ + b)(1 − e−γt)
,
ᾱ(t,u) = rt(u − 1) − κv

γ + b
σ2
v
t +
2
σ2
v
log

1 −
γ + b
2γ
1 − e−γt


.
Other special cases for which one can compute explicit solutions are cited in
Duffie, Pan, and Singleton [2000].
## 6 Corporate Securities
This section offers a basic review of the valuation of equities and corporate
liabilities, beginning with some standard issues regarding the capital struc-
ture of a firm. Then, we turn to models of the valuation of defaultable debt
that are based on an assumed stochastic arrival intensity of the stopping
time defining default. The use of intensity-based defaultable bond pricing
models was instigated by Artzner and Delbaen [1990], Artzner and Delbaen
[1992], Artzner and Delbaen [1995], Lando [1994], Lando [1998], and Jarrow
and Turnbull [1995], and has become commonplace in business applications
among banks and investment banks.
We begin with an extremely simple model of the stochastic behavior of
the market values of assets, equity, and debt. We may think of equity and
debt, at this first pass, as derivatives with respect to the total market value
of the firm, as proposed by Black and Scholes [1973] and Merton [1974]. In
84the simplest case, equity is merely a call option on the assets of the firm,
struck at the level of liabilities, with possible exercise at the maturity date
of the debt.33
At first, we are in a setting of perfect capital markets, where the results of
Modigliani and Miller [1958] imply the irrelevance of capital structure for the
total market value of the firm. Later, we introduce market imperfections and
increase the degree of control that may be exercised by holders of equity and
debt. With this, the theory becomes more complex and less like a derivative
valuation model. There are many more interesting variations than could be
addressed well in the space available here. Our objective is merely to convey
some sense of the types of issues and standard modeling approaches.
We let B be a standard Brownian motion in Rd
on a complete probability
space (Ω,F,P), and fix the standard filtration {Ft : t ≥ 0} of B. Later, we
allow for information revealed by “Poisson-like arrivals,” in order to tractably
model “sudden-surprise” defaults that cannot be easily treated in a setting
of Brownian information.
## 6.1 Endogenous Default Timing
We assume a constant short rate r and take as given a martingale measure
Q, in the infinite-horizon sense of Huang and Pagès [1992], after deflation by
e−rt
.
The resources of a given firm are assumed to consist of cash flows at a
rate δt for each time t, where δ is an adapted process with
R t
0
|δs|ds < ∞
almost surely for all t. The market value of the assets of the firm at time t
is defined as the market value At of the future cash flows. That is,
At = EQ
t
Z ∞
t
e−r(s−t)
δs ds

. (104)
We assume that At is well defined and finite for all t. The martingale repre-
sentation theorem implies that
dAt = (rAt − δt)dt + σt dBQ
t , (105)
for some adapted Rd
-valued process σ such that
RT
0
σt · σt dt < ∞ for all
33
Geske [1977] used compound option modeling so as to extend to the Black-Scholes-
Merton model to cases of debt at various maturities.
85T ∈ [0,∞), and where BQ
is the standard Brownian motion in Rd
under Q
obtained from B and Girsanov’s Theorem.34
We suppose that the original owners of the firm chose its capital structure
to consist of a single bond as its debt, and pure equity, defined in detail below.
The bond and equity investors have already paid the original owners for these
securities. Before we consider the effects of market imperfections, the total
of the market values of equity and debt must be the market value A of the
assets, which is a given process, so the design of the capital structure is
irrelevant from the viewpoint of maximizing the total value received by the
original owners of the firm.
For simplicity, we suppose that the bond promises to pay coupons at a
constant total rate c, continually in time, until default. This sort of bond
is sometimes called a consol. Equityholders receive the residual cash flow in
the form of dividends at the rate δt − c at time t, until default. At default,
the firm’s future cash flows are assigned to debtholders.
The equityholders’ dividend rate, δt −c, may have negative outcomes. It
is commonly stipulated, however, that equity claimants have limited liabil-
ity, meaning that they should not experience negative cash flows. One can
arrange for limited liability by dilution of equity.35
Equityholders are assumed to have the contractual right to declare default
at any stopping time T, at which time equityholders give up to debtholders
the rights to all future cash flows, a contractual arrangement termed strict
priority, or sometimes absolute priority. We assume that equityholders are
not permitted to delay liquidation after the value A of the firm reaches 0,
so we ignore the possibility that AT < 0. We could also consider the option
of equityholders to change the firm’s production technology, or to call in the
debt for some price.
34
For an explanation of how Girsanov’s Theorem applies in an infinite-horizon setting,
see for example the last section of Chapter 6 of Duffie [2001], based on Huang and Pagès
[1992].
35
That is, so long as the market value of equity remains strictly positive, newly issued
equity can be sold into the market so as to continually finance the negative portion (c−δt)+
of the residual cash flow. While dilution increases the quantity of shares outstanding, it
does not alter the total market value of all shares, and so is a relatively simple modeling
device. Moreover, dilution is irrelevant to individual shareholders, who would in any case
be in a position to avoid negative cash flows by selling their own shares as necessary to
finance the negative portion of their dividends, with the same effect as if the firm had
diluted their shares for this purpose. We are ignoring here any frictional costs of equity
issuance or trading.
86The bond contract may convey to debtholders, under a protective covenant,
the right to force liquidation at any stopping time τ at which the asset value
Aτ is as low or lower than some stipulated level. We ignore this feature for
brevity.
## 6.2 Example: Brownian Dividend Growth
We turn to a specific model proposed by Fisher, Heinkel, and Zechner [1989],
and explicitly solved by Leland [1994], for optimal default timing and for
the valuation of equity and debt. Once we allow for taxes and bankruptcy
distress costs,36
capital structure matters, and, within the following simple
parametric framework, Leland [1994] calculated the initial capital structure
that maximizes the total initial market value of the firm.
Suppose the cash-flow rate process δ is a geometric Brownian motion
under Q, in that
dδt = µδt dt + σδt dBQ
t ,
for constants µ and σ, where BQ
is a standard Brownian motion under Q.
We assume throughout that µ < r, so that, from (104), A is finite and
dAt = µAt dt + σAt dBQ
t .
We calculate that δt = (r − µ)At.
For any given constant K ∈ (0,A0), the market value of a security that
claims one unit of account at the hitting time τ(K) = inf{t : At ≤ K} is, at
any time t < τ(K),
EQ
t

e−r(τ(K)−t)

=

At
K
−γ
, (106)
where
γ =
m +
√
m2 + 2rσ2
σ2
,
36
The model was further elaborated to treat coupon debt of finite maturity in Leland
and Toft [1996], endogenous calling of debt and re-capitalization in Leland [1998] and
Uhrig-Homburg [1998], incomplete observation by bond investors, with default intensity,
in Duffie and Lando [2001], and alternative approachesto default recoveryby Anderson and
Sundaresan [1996], Anderson, Pan, and Sundaresan [1995], Décamps and Faure-Grimaud
[1998], Décamps and Faure-Grimaud [1999], Fan and Sundaresan [1997], Mella-Barral
[1999], and Mella-Barral and Perraudin [1997].
87and where m = µ − σ2
/2. This can be shown by applying Ito’s Formula to
see that e−rt
(At/K)−γ
is a Q-martingale.
Let us consider for simplicity the case in which bondholders have no
protective covenant. Then, equityholders declare default at a stopping time
that attains the maximum equity valuation
w(A0) ≡ sup
T∈T
EQ
Z T
0
e−rt
(δt − c)dt

, (107)
where T is the set of stopping times.
We naturally conjecture that the maximization problem (107) is solved
by a hitting time of the form τ(AB) = inf{t : At ≤ AB}, for some default-
triggering level AB of assets to be determined. Black and Cox [1976] devel-
oped the idea of default at the first passage of assets to a sufficiently low level,
but used an exogenous default boundary. Longstaff and Schwartz [1995] ex-
tended this approach to allow for stochastic default-free interest rates. Their
work was then refined by Collin-Dufresne and Goldstein [1999].
Given this conjectured form τ(AB) for the optimal default time, we
further conjecture from Ito’s Formula that the equity value function w :
(0,∞) → [0,∞) defined by (107) solves the ODE
Dw(x) − rw(x) + (r − µ)x − c = 0, x > AB, (108)
where
Dw(x) = w0
(x)µx +
1
2
w00
(x)σ2
x2
, (109)
with the absolute-priority boundary condition
w(x) = 0, x ≤ AB. (110)
Finally, we conjecture the smooth-pasting condition
w0
(AB) = 0, (111)
based on (110) and continuity of the first derivative w0
(·) at AB. Although
not an obvious requirement for optimality, the smooth-pasting condition,
sometimes called the high-order-contact condition, has proven to be a fruitful
method by which to conjecture solutions, as follows.
88If we are correct in conjecturing that the optimal default time is of the
form τ(AB) = inf{t : At ≤ AB}, then, given an initial asset level A0 = x >
AB, the value of equity must be
w(x) = x − AB

x
AB
−γ
−
c
r
"
1 −

x
AB
−γ
#
. (112)
This conjectured value of equity is merely the market value x of the total
future cash flows of the firm, less a deduction equal to the market value of the
debtholders’ claim to AB at the default time τ(AB) using (106), less another
deduction equal to the market value of coupon payments to bondholders be-
fore default. The market value of those coupon payments is easily computed
as the present value c/r of coupons paid at the rate c from time 0 to time
+∞, less the present value of coupons paid at the rate c from the default
time τ(AB) until +∞, again using (106). In order to complete our conjec-
ture, we apply the smooth-pasting condition w0
(AB) = 0 to this functional
form (112), and by calculation obtain the conjectured default triggering asset
level as
AB = βc, (113)
where
β =
γ
r(1 + γ)
. (114)
We are ready to state and verify this result of Leland [1994].
Proposition. The default timing problem (107) is solved by inf{t : At ≤
βc}. The associated initial market value w(A0) of equity is W(A0,c), where
W(x,c) = 0, x ≤ βc, (115)
and
W(x,c) = x − βc

x
βc
−γ
−
c
r
"
1 −

x
βc
−γ
#
, x ≥ βc. (116)
The initial value of debt is A0 − W(A0,c).
Proof: First, it may be checked by calcuation that W(·,c) satisfies the
differential equation (108) and the smooth-pasting condition (111). Ito’s
Formula applies to C2
(twice continuously differentiable) functions. In our
89case, although W(·,c) need not be C2
, it is convex, is C1
, and is C2
except
at βc, where Wx(βc,c) = 0. Under these conditions, we obtain the result of
applying Ito’s Formula as
W(As,c) = W(A0,c) +
Z s
0
DW(At,c)dt +
Z s
0
Wx(At,c)σAt dBQ
t ,
where DW(x,c) is defined as usual by
DW(x,c) = Wx(x,c)µx +
1
2
Wxx(x,c)σ2
x2
,
except at x = βc, where we may replace “Wxx(βc,c)” with zero. (This slight
extension of Ito’s Formula is found, for example, in Karatzas and Shreve
[1988], page 219.)
For each time t, let
qt = e−rt
W(At,c) +
Z t
0
e−rs
((r − µ)As − c)ds.
From Ito’s Formula,
dqt = e−rt
f(At)dt + e−rt
Wx(At,c)σAt dBQ
t , (117)
where
f(x) = DW(x,c) − rW(x,c) + (r − µ)x − c.
Because Wx is bounded, the last term of (117) defines a Q-martingale. For
x ≤ βc, we have both W(x,c) = 0 and (r−µ)x−c ≤ 0, so f(x) ≤ 0. For x >
βc, we have (108), and therefore f(x) = 0. The drift of q is therefore never
positive, and for any stopping time T we have q0 ≥ EQ
(qT ), or equivalently,
W(A0,c) ≥ EQ
Z T
0
e−rs
(δs − c)ds + e−rT
W(AT,c)

.
For the particular stopping time τ(βc), we have
W(A0,c) = EQ
"Z τ(βc)
0
e−rs
(δs − c)ds
#
,
90using the boundary condition (115) and the fact that f(x) = 0 for x > βc.
So, for any stopping time T,
W(A0,c) = EQ
"Z τ(βc)
0
e−rs
(δs − c)ds
#
≥ EQ
Z T
0
e−rs
(δs − c)ds + e−rT
W(AT ,c)

≥ EQ
Z T
0
e−rs
(δs − c)ds

,
using the non-negativity of W for the last inequality. This implies the opti-
mality of the stopping time τ(βc) and verification of the proposed solution
W(A0,c) of (107).
Boyarchenko and Levendorskiĭ [2001], Hilberink and Rogers [2000], and
Zhou [2000] extend this first passage model of optimal default timing to the
case of jump-diffusion asset processes.
## 6.3 Taxes, Bankruptcy Costs, Capital Structure
In order to see how the original owners of the firm may have a strict but
limited incentive to issue debt, we introduce two market imperfections:
• A tax deduction, at a tax rate of θ, on interest expense, so that the
after-tax effective coupon rate paid by the firm is (1 − θ)c.
• Bankruptcy costs, so that, with default at time t, the assets of the
firm are disposed of at a salvage value of Ât ≤ At, where Â is a given
continuous adapted process.
We also consider more carefully the formulation of an equilibrium, in
which equityholders and bondholders each exercise their own rights so as to
maximize the market values of their own securities, given correct conjectures
regarding the equilibrium policy of the other claimant. Because the total
of the market values of equity and debt is not the fixed process A, new
considerations arise, including inefficiencies. That is, in an equilibrium, the
total of the market values of equity and bond may be strictly less than
maximal, for example because of default that is premature from the viewpoint
91of maximizing the total value of the firm. An unrestricted central planner
could in such a case split the firm’s cash flows between equityholders and
bondholders so as to achieve strictly larger market values for each than the
equilibrium values of their respective securities.
Absent the tax shield on debt, the original owner of the firm, who selects a
capital structure at time 0 so as to maximize the total initial market value of
all corporate securities, would have avoided a capital structure that involves
an inefficiency of this type. For example, an all-equity firm would avoid
bankruptcy costs.
In order to illustrate the endogenous choice of capital structure based on
the tradeoff between the values of tax shields and of bankruptcy losses, we
extend the example of Section 6.2 by assuming a tax rate of θ ∈ (0,1) and
bankruptcy recovery Â = A, for a constant fractional recovery rate  ∈ [0,1].
For simplicity, we assume no protective covenant.
The equity valuation and optimal default timing problem is identical to
(107), except that equityholders treat the effective coupon rate as the after-
tax rate c(1 −θ). Thus, the optimal equity market value is W(A0,c(1− θ)),
where W(x,y) is given by (115)-(116). The optimal default time is
T∗
= inf{t : At ≤ β(1 − θ)c}.
For a given coupon rate c, the bankruptcy recovery rate  has no effect
on the equity value. The market value U(A0,c) of debt, at asset level A0 and
coupon rate c, is indeed affected by distress costs, in that
U(x,c) = x, x ≤ β(1 − θ)c, (118)
and, for x ≥ β(1 − θ)c,
U(x,c) = βc(1 − θ)

x
βc(1 − θ)
−γ
+
c
r
"
1 −

x
βc(1 − θ)
−γ
#
. (119)
The first term of (119) is the market value of the payment of the recovery
value A(T∗
) = βc(1 − θ) at default, using (106). The second term is the
market value of receiving the coupon rate c until T∗
.
The capital structure that maximizes the market value received by the
initial owners for sale of equity and debt can now be determined from the
coupon rate c∗
solving
sup
c
{U(A0,c) + W(A0,(1 − θ)c)}. (120)
92Leland [1994] provides an explicit solution for c∗
, which then allows one
to easily examine the resolution of the tradeoff between the market value
H(A0,c) =
θc
r
"
1 −

A0
βc(1 − θ)
−γ
#
of tax shields and the market value
h(A0,c) = βc(1 − θ)

A0
βc(1 − θ)
−γ
of financial distress costs associated with bankruptcy. The coupon rate that
solves (120) is that which maximizes H(A0,c) − h(A0,c), the benefit-cost
difference. Although the tax shield is valuable to the firm, it is merely a
transfer from somewhere else in the economy. The bankruptcy distress cost,
however, involves a net social cost, illustrating one of the inefficiencies caused
by taxes.
Leland and Toft [1996] extend the model so as to treat bonds of finite
maturity with discrete coupons. One can also allow for multiple classes of
debtholders, each with its own contractual cash flows and rights. For exam-
ple, bonds are conventionally classified by priority, so that, at liquidation,
senior bondholders are contractually entitled to cash flows resulting from liq-
uidation up to the total face value of senior debt (in proportion to the face
values of the respective senior bonds, and normally without regard to matu-
rity dates). If the most senior class of debtholders can be paid off in full, the
next most senior class is assigned liquidation cash flows, and so on, to the
lowest subordination class. Some bonds may be secured by certain identified
assets, or collateralized, in effect giving them seniority over the liquidation
value resulting from those cash flows, before any unsecured bonds may be
paid according to the seniority of unsecured claims. In practice, the overall
priority structure may be rather complicated. Some implications of seniority
and of relative maturity for bond valuation are explored in exercises.
Corporate bonds are often callable, within certain time restrictions. Not
infrequently, corporate bonds may be converted to equity at pre-arranged
conversion ratios (number of shares for a given face value) at the timing
option of bondholders. Such convertible bonds present a challenging set of
valuation issues, some examined by Brennan and Schwartz [1980] and Nyborg
[1996]. Occasionally, corporate bonds are puttable, that is, may be sold back
to the issuer at a pre-arranged price at the option of bondholders.
93One can also allow for adjustments in capital structure, normally insti-
gated by equityholders, that result in the issuing and retiring of securities,
subject to legal restrictions, some of which may be embedded in debt con-
tracts.
## 6.4 Intensity-Based Modeling of Default
This section introduces a model for a default time as a stopping time τ with
a given intensity process λ, as defined below. From the joint behavior of
λ, the short-rate process r, the promised payment of the security, and the
model of recovery at default, as well as risk premia, one can characterize the
stochastic behavior of the term structure of yields on defaultable bonds.
In applications, default intensities may be modeled as functions of ob-
servable variables that are linked with the likelihood of default, such as
debt-to-equity ratios, asset volatility measures, other accounting measures
of indebtedness, market equity prices, bond yield spreads, industry perfor-
mance measures, and macroeconomic variables related to the business cycle.
This dependence could, but in practice does not usually, arise endogenously
from a model of the ability or incentives of the firm to make payments on
its debt. Because the approach presented here does not depend on the spe-
cific setting of a firm, it has also been applied to the valuation of defaultable
sovereign debt, as in Duffie, Pedersen, and Singleton [2000] and Pagès [2000].
We fix a complete probability space (Ω,F,P) and a filtration {Gt : t ≥ 0}
satisfying the usual conditions. At some points, it will be important to
make a distinction between an adapted process and a predictable process. A
predictable process is, intuitively speaking, one whose value at any time t
depends only on the information in the underlying filtration that is available
up to, but not including, time t. Protter [1990] provides a full definition.
A non-explosive counting process K (for example, a Poisson process) has
an intensity λ if λ is a predictable non-negative process satisfying
Rt
0
λs ds <
∞ almost surely for all t, with the property that a local martingale M, the
compensated counting process, is given by
Mt = Kt −
Z t
0
λs ds. (121)
The compensated counting process M is a martingale if, for all t, we have
E
Rt
0
λs ds

< ∞. A standard reference on counting processes is Brémaud
[1981].
94For simplicity, we will say that a stopping time τ has an intensity λ if
τ is the first jump time of a non-explosive counting process whose intensity
process is λ. The accompanying intuition is that, at any time t and state
ω with t < τ(ω), the Gt-conditional probability of an arrival before t + ∆ is
approximately λ(ω,t)∆, for small ∆. This intuition is justified in the sense
of derivatives if λ is bounded and continuous, and under weaker conditions.
A stopping time τ is non-trivial if P(τ ∈ (0,∞)) > 0. If a stopping time
τ is non-trivial and if the filtration {Gt : t ≥ 0} is the standard filtration
of some Brownian motion B in Rd
, then τ could not have an intensity. We
know this from the fact that, if {Gt : t ≥ 0} is the standard filtration of B,
then the associated compensated counting process M of (121) (indeed, any
local martingale) could be represented as a stochastic integral with respect
to B, and therefore cannot jump, but M must jump at τ. In order to have
an intensity, a stopping time τ must be totally inaccessible, roughly meaning
that it cannot be “foretold” by an increasing sequence of stopping times that
converges to τ. An inaccessible stopping time is a “sudden surprise,” but
there are no such surprises on a Brownian filtration!
As an illustration, we could imagine that the firm’s equityholders or man-
agers are equipped with some Brownian filtration for purposes of determining
their optimal default time τ, but that bondholders have imperfect monitor-
ing, and may view τ as having an intensity with respect to the bondholders’
own filtration {Gt : t ≥ 0}, which contains less information than the Brown-
ian filtration. Such a situation arises in Duffie and Lando [2001].
We say that τ is doubly stochastic with intensity λ if the underlying count-
ing process whose first jump time is τ is doubly stochastic with intensity λ.
This means roughly that, conditional on the intensity process, the counting
process is a Poisson process with that same (conditionally deterministic) in-
tensity. The doubly-stochastic property thus implies that, for t < τ, using
the law of iterated expectations,
P (τ > s | Gt) = E [P (τ > s | Gt,{λu : t ≤ u ≤ s}) | Gt]
= E
h
e−
R s
t λ(u)du
Gt
i
,
using the fact that the probability of no jump between t and s of a Poisson
process with time-varying (deteministic) intensity λ is e−
R s
t λ(u)du
. This prop-
erty (122) is convenient for calculations, because evaluating E
h
e−
R s
t
λ(u)du
Gt
i
95is computationally equivalent to the pricing of a default-free zero-coupon
bond, treating λ as a short rate. Indeed, this analogy is also quite helpful
for intuition and suggests tractable models for intensities based on models of
the short rate that are tractable for default-free term structure modeling.
As we shall see, it would be sufficient for (122) that λt = Λ(Xt,t) for
some measurable Λ : Rn
×[0,∞) → [0,∞), where X in Rd
solves a stochastic
differential equation of the form
dXt = µ(Xt,t)dt + σ(Xt,t)dBt, (122)
for some (Gt)-standard Brownian motion B in Rd
. More generally, (122)
follows from assuming that the doubly-stochastic counting process K whose
first jump time is τ is driven by some filtration {Ft : t ≥ 0}. This means
roughly that, for any t, conditional on Ft, the distribution of K during [0,t]
is that of a Poisson process with time-varying conditionally deterministic
intensity λ. A complete definition is provided in Duffie [2001].37
For purposes of the market valuation of bonds and other securities whose
cash flows are sensitive to default timing, we would want to have a risk-
neutral intensity process, that is, an intensity process λQ
for the default time
τ that is associated with (Ω,F,Q) and the given filtration {Gt : t ≥ 0},
where Q is an equivalent martingale measure. In this case, we call λQ
the Q-
intensity of τ. (As usual, there may be more than one equivalent martingale
measure.) Such an intensity always exists, as shown by Artzner and Delbaen
[1995], but the doubly-stochastic property may be lost with a change of
measure (Kusuoka [1999]). The ratio λQ
/λ (for λ strictly positive) is in some
sense a multiplicative risk premium for the uncertainty associated with the
timing of default. This issue is pursued by Jarrow, Lando, and Yu [1999],
who provide sufficient conditions for no default-timing risk premium (but
allowing nevertheless a default risk premium).
## 6.5 Zero-Recovery Bond Pricing
We fix a short-rate process r and an equivalent martingale measure Q after
deflation by e−
R t
0 r(u)du
. We consider the valuation of a security that pays
F1{τ>s} at a given time s > 0, where F is a GT -measurable bounded random
variable. Because 1{τ>s} is the random variable that is 1 in the event of no
37
Included in the definition is the condition that λ is (Ft)-predictable, that Ft ⊂ Gt,
and that {Ft : t ≥ 0} satisfies the usual conditions.
96default by s and zero otherwise, we may view F as the contractually promised
payment of the security at time s, with default by s leading to no payment.
The case of a defaultable zero-coupon bond is treated by letting F = 1. In
the next sub-section, we will consider recovery at default.
From the definition of Q as an equivalent martingale measure, the price
St of this security at any time t < s is
St = EQ
t
h
e−
R s
t r(u)du
1{τ>s}F
i
, (123)
where EQ
t denotes Gt-conditional expectation under Q. From (123) and the
fact that τ is a stopping time, St must be zero for all t ≥ τ.
Under Q, the default time τ is assumed to have a Q-intensity process λQ
.
Theorem. Suppose that F, r, and λQ
are bounded and that τ is doubly
stochastic under Q driven by a filtration {Ft : t ≥ 0} such that r is (Ft)-
adapted and F is Fs-measurable. Fix any t < s. Then, for t ≥ τ, we have
St = 0, and for t < τ,
St = EQ
t
h
e−
R s
t
(r(u)+λQ(u)du
F
i
. (124)
This theorem is based on Lando [1998].38
The idea of this representation
(124) of the pre-default price is that discounting for default that occurs at
an intensity is analogous to discounting at the short rate r.
Proof: From (123), the law of iterated expectations, and the assumption
that r is (Ft)-adapted and F is Fs-measurable,
St = EQ

EQ
h
e−
R s
t r(u)du
1{τ>s}F Fs ∨ Gt
i
Gt

= EQ

e−
R s
t
r(u)du
FEQ
h
1{τ>s} Fs ∨ Gt
i
Gt

.
The result then follows from the implication of double stochasticity that
Q(τ > s|Fs ∨ Gt) = e
R s
t
λQ(u)du
.
38
Additional work in this vein is by Bielecki and Rutkowski [1999a], Bielecki and
Rutkowski [1999b], Bielecki and Rutkowski [2000], Cooper and Mello [1991], Cooper and
Mello [1992], Das and Sundaram [2000], Das and Tufano [1995], Davydov, Linetsky, and
Lotz [1999], Duffie [1998], Duffie and Huang [1996], Duffie, Schroder, and Skiadas [1996],
Duffie and Singleton [1999], Elliott, Jeanblanc, and Yor [1999], Hull and White [1992],
Hull and White [1995], Jarrow and Yu [1999], Jeanblanc and Rutkowski [1999], Madan
and Unal [1998], and Nielsen and Ronn [1995].
97As a special case, suppose the filtration {Ft : t ≥ 0} is that generated by
a process X that is affine under Q and valued in D ⊂ Rd
. It is natural to
allow dependence of λQ
, r, and F on the state process X in the sense that
λQ
t = Λ(Xt), rt = ρ(Xt), F = ef(X(T))
, (125)
where Λ, ρ, and f are affine on D.
Under the technical regularity in Duffie, Filipović, and Schachermayer
[2001], relation (124) then implies that, for t < τ, we have
St = eα(T−t)+β(T−t)·X(t)
, (126)
for coefficients α(·) and β(·) that are computed from the associated Gener-
alized Riccati equations.
## 6.6 Pricing with Recovery at Default
The next step is to consider the recovery of some random payoff W at the
default time τ, if default occurs before the maturity date s of the security.
We adopt the assumptions of Theorem 6.5, and add the assumption that
W = wτ, where w is a bounded predictable process that is also adapted to
the driving filtration {Ft : t ≥ 0}.
The market value at any time t < min(s,τ) of any default recovery is, by
definition of the equivalent martingale measure Q, given by
Jt = EQ
t
h
e
R τ
t
−r(u)du
1{τ≤s}wτ
i
. (127)
The doubly-stochastic assumption implies that τ has a probability density
under Q, at any time u in [t,s], conditional on Gt ∨Fs, and on the event that
τ > t, of
q(t,u) = e
R u
t
−λQ(z)dz
λQ
(u).
Thus, using the same iterated-expectations argument of the proof of Theorem
6.5, we have, on the event that τ > t,
Jt = EQ

EQ
h
e
R τ
t −r(z)dz
1{τ≤s}wτ Fs ∨ Gt
i
Gt

= EQ
Z s
t
e
R u
t −r(z)dz
q(t,u)wu du Gt

=
Z s
t
Φ(t,u)du,
98using Fubini’s Theorem, where
Φ(t,u) = EQ
t
h
e−
R u
t
[λQ(z)+r(z)]dz
λQ
(u)w(u)
i
. (128)
We summarize the main defaultable valuation result as follows.
Theorem. Consider a security that pays F at s if τ > s, and otherwise pays
wτ at τ. Suppose that w, F, λQ
, and r are bounded. Suppose that τ is doubly
stochastic under Q, driven by a filtration {Ft : t ≥ 0} with the property that
r and w are (Ft)-adapted and F is Fs-measurable.) Then, for t ≥ τ, we have
St = 0, and for t < τ,
St = EQ
t
h
e−
R s
t (r(u)+λQ(u))du
F
i
+
Z s
t
Φ(t,u)du. (129)
These results are based on Duffie, Schroder, and Skiadas [1996], Lando
[1994], and Lando [1998]. Schönbucher [1998] extends to treat the case of
recovery W which is not of the form wτ for some predictable process w, but
rather allows the recovery to be revealed just at the default time τ. For
details on this construction, see Duffie [2002].
In the affine state-space setting described at the end of the previous sec-
tion, Φ(t,u) can be computed by our usual “affine” methods, provided that
w is of form wt = ea+b·X(t)
for constant coefficients a and b. In this case,
under technical regularity,
Φ(t,u) = eα(u−t)+β(u−t)·X(t)
[c(u − t) + C(u − t) · X(t)], (130)
for readily computed deterministic coefficients α, β, c, and C, as in Duffie,
Pan, and Singleton [2000]. This still leaves the task of numerical computation
of the integral
Rs
t
Φ(t,u)du.
For the price of a typical defaultable bond promising periodic coupons
followed by its principal at maturity, one may sum the prices of the coupons
and of the principal, treating each of these payments as though it were a
separate zero-coupon bond. An often-used assumption, although one that
need not apply in practice, is that there is no default recovery for coupons
remaining to be paid as of the time of default, and that bonds of differ-
ent maturities have the same recovery of principal. In any case, convenient
parametric assumptions, based for example on an affine driving process X,
lead to straightforward computation of a term structure of defaultable bond
yields that may be applied in practical situations, such as the valuation of
99credit derivatives, a class of derivative securities designed to transfer credit
risk that is treated in Duffie and Singleton [2002].
For the case of defaultable bonds with embedded American options, the
most typical cases being callable or convertible bonds, the usual resort is
valuation by some numerical implementation of the associated dynamic pro-
gramming problems.
## 6.7 Default-Adjusted Short Rate
In the setting of Theorem 6.6, a particularly simple pricing representation
can be based on the definition of a predictable process ` for the fractional
loss in market value at default, according to
(1 − `τ)(Sτ−) = wτ. (131)
Manipulation left to the reader shows that, under the conditions of Theorem
6.6, for t < τ,
St = EQ
t
h
e
R s
t −(r(u)+`(u)λQ(u))du
F
i
. (132)
This valuation model (132) is from Duffie and Singleton [1999], and based on
a precursor of Pye [1974]. This representation (132) is particularly convenient
if we take ` as an exogenously given fractional loss process, as it allows for the
application of standard valuation methods, treating the payoff F as default-
free, but accounting for the intensity and severity of default losses through
the “default-adjusted” short-rate process r + `λQ
. The adjustment `λQ
is in
fact the risk-neutral mean rate of proportional loss in market value due to
default.
Notably, the dependence of the bond price on the intensity λQ
and frac-
tional loss ` at default is only through the product `λQ
. For example, dou-
bling λQ
and halving ` has no effect on the bond price process.
Suppose, for example, that τ is doubly stochastic driven by the filtration
of a state process X that is affine under Q, and we take rt + `tλQ
t = R(Xt)
and F = ef(X(T))
, for affine R(·) and f ·). Then, under regularity conditions,
we obtain at each time t before default a bond price of the simple form (126),
again for coefficients solving the associated Generalized Riccati equation.
Using this affine approach to default-adjusted short rates, Duffee [1999a]
provides an empirical model of risk-neutral default intensities for corporate
100bonds.39
References
Adams, K. and D. Van Deventer (1994). Fitting Yield Curves and Forward Rate Curves
with Maximum Smoothness. Journal of Fixed Income 4 (June), 52–62.
Ahn, H., M. Dayal, E. Grannan, and G. Swindle (1995). Hedging with Transaction
Costs. Annals of Applied Probability 8, 341–366.
Aı̈t-Sahalia, Y. (1996a). Do Interest Rates Really Follow Continuous-Time Markov Dif-
fusions? Working Paper, Graduate School of Business, University of Chicago and
NBER.
Aı̈t-Sahalia, Y. (1996b). Nonparametric Pricing of Interest Rate Derivative Securities.
Econometrica 64, 527–560.
Aı̈t-Sahalia, Y. (1996c). Testing Continuous-Time Models of the Spot Interest Rate.
Review of Financial Studies 9, 385–342.
Aı̈t-Sahalia, Y., Y. Wang, and F. Yared (1998). Do Option Markets Correctly Price
the Probabilities of Movement of the Underlying Asset? Working Paper, Graduate
School of Business, University of Chicago, forthcoming, Journal of Econometrics.
Andersen, L. and J. Andreasen (1998). Volatility Skew and Extensions of the Libor Mar-
ket Model. Working Paper, General Re Financial Products, New York. Forthcoming
in Applied Mathematical Finance.
Andersen, L. and J. Andreasen (1999). Jump-Diffusion Processes: Volatility Smile Fit-
ting and Numerical Methods for Pricing. Working Paper, General Re Financial
Products. Forthcoming in Review of Derivatives Research.
Anderson, R., Y. Pan, and S. Sundaresan (1995). Corporate Bond Yield Spreads and
the Term Structure. Working Paper, CORE, Belgium.
Anderson, R. and S. Sundaresan (1996). Design and Valuation of Debt Contracts. Re-
view of Financial Studies 9, 37–68.
Andreasen, J., B. Jensen, and R. Poulsen (1998). Eight Valuation Methods in Financial
Mathematics: The Black-Scholes Formula as an Example. Mathematical Scientist
23, 18–40.
Ansel, J. and C. Stricker (1992). Quelques Remarques sur un Theoreme de Yan. Working
Paper, Université de Franche-Comté.
Ansel, J. and C. Stricker (1994). Lois de Martingale, Densités et Decomposition de
Föllmer Schweizer. Working Paper, Université de Franche-Comté.
Arrow, K. (1951). An Extension of the Basic Theorems of Classical Welfare Economics.
In J. Neyman (Ed.), Proceedings of the Second Berkeley Symposium on Mathemati-
cal Statistics and Probability, pp. 507–532. Berkeley: University of California Press.
39
For related empirical work on sovereign debt, see Duffie, Pedersen, and Singleton
[2000] and Pagès [2000].
101Arrow, K. (1953). Le Rôle des Valeurs Boursières pour la Repartition la Meillure des
Risques. Econometrie. Colloq. Internat. Centre National de la Recherche Scien-
tifique 40 (Paris 1952), pp. 41–47; discussion, pp. 47–48, C.N.R.S. (Paris 1953).
English Translation in Review of Economic Studies 31 (1964), 91–96.
Artzner, P. (1995). References for the Numeraire Portfolio. Working Paper, Institut de
Recherche Mathématique Avancée Université Louis Pasteur et CNRS, et Labora-
toire de Recherche en Gestion.
Artzner, P. and F. Delbaen (1990). ‘Finem Lauda’ or the Risk of Swaps. Insurance:
Mathematics and Economics 9, 295–303.
Artzner, P. and F. Delbaen (1992). Credit Risk and Prepayment Option. ASTIN Bul-
letin 22, 81–96.
Artzner, P. and F. Delbaen (1995). Default Risk and Incomplete Insurance Markets.
Mathematical Finance 5, 187–195.
Artzner, P. and P. Roger (1993). Definition and Valuation of Optional Coupon Rein-
vestment Bonds. Finance 14, 7–22.
Au, K. and D. Thurston (1993). Markovian Term Structure Movements. Working Paper,
School of Banking and Finance, University of New South Wales.
Babbs, S. and M. Selby (1996). Pricing by Arbitrage in Incomplete Markets. Mathe-
matical Finance 8, 163–168.
Babbs, S. and N. Webber (1994). A Theory of the Term Structure with an Official Short
Rate. Working Paper, Midland Global Markets and University of Warwick.
Bachelier, L. (1900). Théorie de la Speculation. Annales Scientifiques de L’École Nor-
male Supérieure 3d ser., 17, 21–88. Translation in The Random Character of Stock
Market Prices, ed. Paul Cootner, pp. 17–79. Cambridge, MA: MIT Press, 1964.
Back, K. (1986). Securities Market Equilibrium without Bankruptcy: Contingent Claim
Valuation and the Martingale Property. Working Paper, Center for Mathematical
Studies in Economics and Management Science, Northwestern University.
Back, K. (1991). Asset Pricing for General Processes. Journal of Mathematical Eco-
nomics 20, 371–396.
Back, K. and S. Pliska (1987). The Shadow Price of Information in Continuous Time
Decision Problems. Stochastics 22, 151–186.
Bajeux-Besnainou, I. and R. Portait (1997). The Numeraire Portfolio: A New Method-
ology for Financial Theory. The European Journal of Finance 3, 291–309.
Bajeux-Besnainou, I. and R. Portait (1998). Pricing Derivative Securities with a Multi-
Factor Gaussian Model. Applied Mathematical Finance 5, 1–19.
Bakshi, G., C. Cao, and Z. Chen (1997). Empirical Performance of Alternative Option
Pricing Models. Journal of Finance 52, 2003–2049.
Bakshi, G. and D. Madan (2000). Spanning and Derivative Security Valuation. Journal
of Financial Economics 55, 205–238.
Balduzzi, P., G. Bertola, S. Foresi, and L. Klapper (1998). Interest Rate Targeting and
the Dynamics of Short-Term Interest Rates. Journal of Money, Credit, and Banking
30, 26–50.
102Balduzzi, P., S. Das, and S. Foresi (1998). The Central Tendency: A Second Factor in
Bond Yields. Review of Economics and Statistics 80, 62–72.
Balduzzi, P., S. Das, S. Foresi, and R. Sundaram (1996). A Simple Approach to Three
Factor Affine Term Structure Models. Journal of Fixed Income 6, December, 43–53.
Banz, R. and M. Miller (1978). Prices for State-Contingent Claims: Some Evidence and
Applications. Journal of Business 51, 653–672.
Bates, D. (1997). Post-87’ Crash Fears in S-and-P 500 Futures Options. Journal of
Econometrics 94, 181–238.
Baz, J. and S. Das (1996). Analytical Approximations of the Term Structure for Jump-
Diffusion Processes: A Numerical Analysis. Journal of Fixed Income 6 (1), 78–86.
Beaglehole, D. (1990). Tax Clientele and Stochastic Processes in the Gilt Market. Work-
ing Paper, Graduate School of Business, University of Chicago.
Beaglehole, D. and M. Tenney (1991). General Solutions of Some Interest Rate Contin-
gent Claim Pricing Equations. Journal of Fixed Income 1, 69–84.
Bensoussan, A. (1984). On the Theory of Option Pricing. Acta Applicandae Mathemat-
icae 2, 139–158.
Benzoni, L. (1998). Pricing Options under Stochastic Volatility: An Econnometric Anal-
ysis. Working Paper, J.L. Kellog Graduate School of Management, Northwestern
University.
Berardi, A. and M. Esposito (1999). A Base Model for Multifactor Specifications of the
Term Structure. Economic Notes 28, 145–170.
Bergman, Y. (1995). Option Pricing with Differential Interest Rates. The Reveiw of
Financial Studies 8, 475–500.
Berndt, A. (2002). Estimating the Term Structure of Credit Spreads: Callable Corpo-
rate Debt. Working Paper, Department of Statistics, iversity.
Bhar, R. and C. Chiarella (1995). Transformation of Heath-Jarrow-Morton Models to
Markovian Systems. Working Paper, School of Finance and Economics, University
of Technology, Sydney.
Bielecki, T. and M. Rutkowski (1999a). Credit Risk Modelling: A Multiple Ratings
Case. Working Paper, Northeastern Illinois University and Technical University of
Warsaw.
Bielecki, T. and M. Rutkowski (1999b). Modelling of the Defaultable Term Structure:
Conditionally Markov Approach. Working Paper, Northeastern Illinois University
and Technical University of Warsaw.
Bielecki, T. and M. Rutkowski (2000). Credit Risk Modelling: Intensity Based Ap-
proach. Working Paper, Department of Mathematics, Northeastern Illinois Univer-
sity.
Björk, T. and B. Christensen (1999). Interest Rate Dynamics and Consistent Forward
Rate Curves. Mathematical Finance 22, 17–23.
Björk, T. and A. Gombani (1999). Minimal Realizations of Interest Rate Models. Fi-
nance and Stochastics 3, 413–432.
103Black, F. and J. Cox (1976). Valuing Corporate Securities: Liabilities: Some Effects of
Bond Indenture Provisions. Journal of Finance 31, 351–367.
Black, F., E. Derman, and W. Toy (1990). A One-Factor Model of Interest Rates and
Its Application to Treasury Bond Options. Financial Analysts Journal January–
February, 33–39.
Black, F. and P. Karasinski (1991). Bond and Option Pricing when Short Rates are
Lognormal. Financial Analysts Journal (July–August), 52–59.
Black, F. and M. Scholes (1973). The Pricing of Options and Corporate Liabilities.
Journal of Political Economy 81, 637–654.
Bottazzi, J.-M. (1995). Existence of Equilibria with Incomplete Markets: The Case of
Smooth Returns. Journal of Mathematical Economics 24, 59–72.
Bottazzi, J.-M. and T. Hens (1996). Excess Demand Functions and Incomplete Markets.
Journal of Economic Theory 68, 49–63.
Boudoukh, J., M. Richardson, R. Stanton, and R. Whitelaw (1995). Pricing Mortgage-
Backed Securities in a Multifactor Interest Rate Environment: A Multivariate Den-
sity Estimation Approach. Working Paper, Institute of Business and Economic Re-
search, University of California at Berkeley.
Boyarchenko, S. and S. Levendorskiĭ (2001). Perpetual American Options Under Lévy
Processes. Working Paper, University of Texas at Austin, Department of Economics.
Brace, A. and M. Musiela (1994). Swap Derivatives in a Gaussian HJM Framework.
Working Paper, Treasury Group, Citibank, Sydney, Australia.
Brace, A. and M. Musiela (1995). The Market Model of Interest Rate Dynamics. Math-
ematical Finance 7, 127–155.
Breeden, D. (1979). An Intertemporal Asset Pricing Model with Stochastic Consump-
tion and Investment Opportunities. Journal of Financial Economics 7, 265–296.
Breeden, D. and R. Litzenberger (1978). Prices of State-Contingent Claims Implicit in
Option Prices. Journal of Business 51, 621–651.
Brémaud, P. (1981). Point Processes and Queues: Martingale Dynamics. New York:
Springer.
Brennan, M. and E. Schwartz (1977). Savings Bonds, Retractable Bonds and Callable
Bonds. Journal of Financial Economics 5, 67–88.
Brennan, M. and E. Schwartz (1980). Analyzing Convertible Bonds. Journal of Finan-
cial and Quantitative Analysis 10, 907–929.
Brown, D., P. DeMarzo, and C. Eaves (1996a). Computing Equilibria when Asset Mar-
kets are Incomplete. Econometrica 64, 1–27.
Brown, D., P. DeMarzo, and C. Eaves (1996b). Computing Zeros of Sections Vector
Bundles Using Homotopies and Relocalization. Mathematics of Operations Research
21, 26–43.
Brown, R. and S. Schaefer (1994). Interest Rate Volatility and the Shape of the Term
Structure. Philosophical Transactions of the Royal Society: Physical Sciences and
Engineering 347, 449–598.
104Brown, R. and S. Schaefer (1996). Ten Years of the Real Term Structure: 1984-1994.
Journal of Fixed Income 6 (March), 6–22.
Bühlmann, H., F. Delbaen, P. Embrechts, and A. Shiryaev (1998). On Esscher Trans-
forms in Discrete Finance Models. ASTIN Bulletin 28, 171–186.
Büttler, H. and J. Waldvogel (1996). Pricing Callable Bonds by Means of Green’s Func-
tion. Mathematical Finance 6, 53–88.
Carr, P. (1993). Valuing Bond Futures and the Quality Option. Working Paper, Johnson
Graduate School of Management, Cornell University.
Carverhill, A. (1988). The Ho and Lee Term Structure Theory: A Continuous Time
Version. Working Paper, Financial Options Research Centre, University of Warwick.
Cass, D. (1984). Competitive Equilibria in Incomplete Financial Markets. Working Pa-
per, Center for Analytic Research in Economics and the Social Sciences, University
of Pennsylvania.
Cass, D. (1989). Sunspots and Incomplete Financial Markets: The Leading Example. In
G. Feiwel (Ed.), The Economics of Imperfect Competition and Employment: Joan
Robinson and Beyond, pp. 677–693. London: Macmillan.
Cass, D. (1991). Incomplete Financial Markets and Indeterminacy of Financial Equi-
librium. In J.-J. Laffont (Ed.), Advances in Economic Theory, pp. 263–288. Cam-
bridge: Cambridge University Press.
Cassese, G. (1996). An Elementary Remark on Martingale Equivalence and the Fun-
damental Theorem of Asset Pricing. Working Paper, Istituto di Economia Politica,
Università Commerciale “Luigi Bocconi,” Milan.
Chacko, G. and S. Das (1998). Pricing Average Interest Rate Options: A General
Approach. Working Paper, Harvard Business School.
Chapman, D. (1998). Habit Formation, Consumption, and State-Prices. Econometrica
66, 1223–1230.
Chen, L. (1996). Stochastic Mean and Stochastic Volatility: A Three-Factor Model of
the Term Structure of Interest Rates and Its Application to the Pricing of Interest
Rate Derivatives: Part I. Oxford: Blackwell Publishers.
Chen, R.-R. and L. Scott (1992). Pricing Interest Rate Options in a Two-Factor Cox-
Ingersoll-Ross Model of the Term Structure. Review of Financial Studies 5, 613–
636.
Chen, R.-R. and L. Scott (1993). Pricing Interest Rate Futures Options with Futures-
Style Margining. Journal of Futures Markets 13, 15–22.
Chen, R.-R. and L. Scott (1995). Interest Rate Options in Multifactor Cox-Ingersoll-
Ross Models of the Term Structure. Journal of Derivatives 3, 53–72.
Cherif, T., N. El Karoui, R. Myneni, and R. Viswanathan (1995). Arbitrage Pricing
and Hedging of Quanto Options and Interest Rate Claims with Quadratic Gaussian
State Variables. Working Paper, Laboratoire de Probabilités, Université de Paris,
VI.
105Chernov, M. and E. Ghysels (2000). A Study towards a Unified Approach to the Joint
Estimation of Objective and Risk Neutral Measures for the Purpose of Options
Valuation. Journal of Financial Economics 56, 407–458.
Cherubini, U. and M. Esposito (1995). Options in and on Interest Rate Futures Con-
tracts: Results from Martingale Pricing Theory. Applied Mathematical Finance 2,
1–15.
Chesney, M., R. Elliott, and R. Gibson (1993). Analytical Solution for the Pricing of
American Bond and Yield Options. Mathematical Finance 3, 277–294.
Chew, S.-H. (1983). A Generalization of the Quasilinear Mean with Applications to
the Measurement of Income Inequality and Decision Theory Resolving the Allais
Paradox. Econometrica 51, 1065–1092.
Chew, S.-H. (1989). Axiomatic Utility Theories with the Betweenness Property. Annals
of Operations Research 19, 273–298.
Chew, S.-H. and L. Epstein (1991). Recursive Utility under Uncertainty. In A. Khan and
N. Yannelis (Eds.), Equilibrium Theory with an Infinite Number of Commodities,
pp. 353–369. New York: Springer-Verlag.
Cheyette, O. (1995). MarkovRepresentation of the Heath-Jarrow-Morton Model. Work-
ing Paper, BARRA Inc., Berkeley, California.
Cheyette, O. (1996). Implied Prepayments. Working Paper, BARRA Inc., Berkeley,
California.
Citanna, A., A. Kajii, and A. Villanacci (1994). Constrained Suboptimality in Incom-
plete Markets: A General Approach and Two Applications. Economic Theory 11,
495–521.
Citanna, A. and A. Villanacci (1993). On Generic Pareto Improvement in Competitive
Economies with Incomplete Asset Structure. Working Paper, Center for Analytic
Research in Economics and the Social Sciences, University of Pennsylvania.
Clewlow, L., K. Pang, and C. Strickland (1997). Efficient Pricing of Caps and Swaptions
in a Multi-Factor Gaussian Interest Rate Model. Working Paper, University of
Warwick.
Cohen, H. (1995). Isolating the Wild Card Option. Mathematical Finance 2, 155–166.
Coleman, T., L. Fisher, and R. Ibbotson (1992). Estimating the Term Structure of
Interest Rates from Data that include the Prices of Coupon Bonds. Journal of
Fixed Income 2 (September), 85–116.
Collin-Dufresne, P. and R. Goldstein (1999). Do Credit Spreads Reflect Stationary
Leverage Ratios? Reconciling Structural and Reduced Form Frameworks. Working
Paper, GSIA, Carnegie Mellon.
Collin-Dufresne, P. and R. Goldstein (2001a). Pricing Swaptions within the Affine
Framework. Working Paper, Carnegie Mellon University.
Collin-Dufresne, P. and R. Goldstein (2001b). Stochastic Correlation and the Relative
Pricing of Caps and Swaptions in a Generalized-Affine Framework. Working Paper,
Carnegie Mellon University.
106Collin-Dufresne, P. and B. Solnik (2001). On the Term Structure of Default Permia in
the Swap and LIBOR Markets. Journal of Finance 56, 1095–1116.
Constantinides, G. (1982). Intertemporal Asset Pricing with Heterogeneous Consumers
and without Demand Aggregation. Journal of Business 55, 253–267.
Constantinides, G. (1990). Habit Formation: A Resolution of the Equity Premium
Puzzle. Journal of Political Economy 98, 519–543.
Constantinides, G. (1992). A Theory of the Nominal Term Structure of Interest Rates.
Review of Financial Studies 5, 531–552.
Constantinides, G. (1993). Option Pricing Bounds with Transactions Costs. Working
Paper, Graduate School of Business, University of Chicago.
Constantinides, G. and J. Ingersoll (1984). Optimal Bond Trading with Personal Taxes.
Journal of Financial Economics 13, 299–335.
Constantinides, G. and T. Zariphopoulou (1999). Bounds on Prices of Contingent
Claims in an Intertemporal Economy with Proportional Transaction Costs and
General Preferences. Finance and Stochastics 3, 345–369.
Cont, R. (1998). Modeling Term Structure Dynamics: An Infinite Dimensional Ap-
proach. Working Paper, Centre de Mathématiques Appliquées, Ecole Polytechnique,
Palaiseau, France.
Cooper, I. and A. Mello (1991). The Default Risk of Swaps. Journal of Finance XLVI,
597–620.
Cooper, I. and A. Mello (1992). Pricing and Optimal Use of Forward Contracts with
Default Risk. Working Paper, Department of Finance, London Business School,
University of London.
Corradi, V. (2000). Degenerate Continuous Time Limits of GARCH and GARCH-type
Processes. Journal of Econometrics 96, 145–153.
Cox, J. (1983). Optimal Consumption and Portfolio Rules when Assets Follow a Diffu-
sion Process. Working Paper, Graduate School of Business, Stanford University.
Cox, J. and C.-F. Huang (1989). Optimal Consumption and Portfolio Policies when
Asset Prices Follow a Diffusion Process. Journal of Economic Theory 49, 33–83.
Cox, J. and C.-F. Huang (1991). A Variational Problem Arising in Financial Economics
with an Application to a Portfolio Turnpike Theorem. Journal of Mathematical
Economics 20, 465–488.
Cox, J., J. Ingersoll, and S. Ross (1981). The Relation between Forward Prices and
Futures Prices. Journal of Financial Economics 9, 321–346.
Cox, J., J. Ingersoll, and S. Ross (1985a). An Intertemporal General Equilibrium Model
of Asset Prices. Econometrica 53, 363–384.
Cox, J., J. Ingersoll, and S. Ross (1985b). A Theory of the Term Structure of Interest
Rates. Econometrica 53, 385–408.
Cox, J. and S. Ross (1976). The Valuation of Options for Alternative Stochastic Pro-
cesses. Journal of Financial Economics 3, 145–166.
107Cox, J., S. Ross, and M. Rubinstein (1979). Option Pricing: A Simplified Approach.
Journal of Financial Economics 7, 229–263.
Cox, J. and M. Rubinstein (1985). Options Markets. Englewood Cliffs, N.J.: Prentice-
Hall.
Cuoco, D. (1997). Optimal Consumption and Equilibrium Prices with Portfolio Con-
straints and Stochastic Income. Journal of Economic Theory 72, 33–73.
Cuoco, D. and H. He (1992). Dynamic Aggregation and Computation of Equilibria in
Finite-Dimensional Economies with Incomplete Financial Markets. Working Paper,
Haas School of Business, University of California, Berkeley.
Cvitanić, J. and I. Karatzas (1993). Hedging Contingent Claims with Constrained Port-
folios. Annals of Applied Probability 3, 652–681.
Cvitanić, J. and I. Karatzas (1996). Hedging and Portfolio Optimization under Trans-
action Costs: A Martingale Approach. Mathematical Finance 6, 133–165.
Cvitanić, J., W. Schachermayer, and H. Wang (1999). Utility Maximization in Incom-
plete Markets with Random Endowment. Working Paper, Department of Mathe-
matics, University of Southern California, forthcoming, Finance and Stochastics.
Daher, C., M. Romano, and G. Zacklad (1992). Determination du Prix de Produits
Optionnels Obligatoires à Partir d’un Modèle Multi-Facteurs de la Courbe des Taux.
Working Paper, Caisse Autonome de Refinancement, Paris.
Dai, Q. (1994). Implied Green’s Function in a No-Arbitrage Markov Model of the In-
stantaneous Short Rate. Working Paper, Graduate School of Business, Stanford
University.
Dai, Q. and K. Singleton (2000). Specification Analysis of Affine Term Structure Models.
Journal of Finance 55, 1943–1978.
Dai, Q. and K. Singleton (2001). Term Structure Dynamics in Theory and Reality.
Working Paper, Stern School of Business, New York University.
Dalang, R., A. Morton, and W. Willinger (1990). Equivalent Martingale Measures and
No-Arbitrage in Stochastic Securities Market Models. Stochastics and Stochastic
Reports 29, 185–201.
Das, S. (1993). Mean Rate Shifts and Alternative Models of the Interest Rate: Theory
and Evidence. Working Paper, Department of Finance, New York University.
Das, S. (1995). Pricing Interest Rate Derivatives with Arbitrary Skewness and Kurto-
sis: A Simple Approach to Jump-Diffusion Bond Option Pricing. Working Paper,
Division of Research, Harvard Business School.
Das, S. (1997). Discrete-Time Bond and Option Pricing for Jump-Diffusion Processes.
Review of Derivatives Research 1, 211–243.
Das, S. (1998). Poisson-Gaussian Processes and the Bond Markets. Working Paper,
Department of Finance, Harvard Business School.
Das, S. and S. Foresi (1996). Exact Solutions for Bond and Option Prices with System-
atic Jump Risk. Review of Derivatives Research 1, 7–24.
Das, S. and R. Sundaram (2000). A Discrete-Time Approach to Arbitrage-Free Pricing
of Credit Derivatives. Management Science 46, 46–62.
108Das, S. and P. Tufano (1995). Pricing Credit-Sensitive Debt when Interest Rates, Credit
Ratings and Credit Spreads are Stochastic. Journal of Financial Engineering 5(2),
161–198.
Dash, J. (1989). Path Integrals and Options–I. Working Paper, Financial Strategies
Group, Merrill Lynch Capital Markets, New York.
Davis, M. and M. Clark (1993). Analysis of Financial Models including Transactions
Costs. Working Paper, Imperial College, University of London.
Davydov, D., V. Linetsky, and C. Lotz (1999). The Hazard-Rate Approach to Pricing
Risky Debt: Two Analytically Tractable Examples. Working Paper, Department of
Economics, University of Michigan.
Debreu, G. (1953). Une Economie de l’Incertain. Working Paper, Electricité de France.
Debreu, G. (1959). Theory of Value. Cowles Foundation Monograph 17. New Haven,
CT: Yale University Press.
Décamps, J.-P. and A. Faure-Grimaud (1998). Pricing the Gamble for Resurrection and
the Consequences of Renegotiation and Debt Design. Working Paper, University of
Toulouse.
Décamps, J.-P. and A. Faure-Grimaud (1999). Should I Stay or Should I Go? Excessive
Continuation and Dynamic Agency Costs of Debt. Working Paper, University of
Toulouse.
Décamps, J.-P. and J.-C. Rochet (1997). A Variational Approach for Pricing Options
and Corporate Bonds. Economic Theory 9, 557–569.
Dekel, E. (1989). Asset Demands without the Independence Axiom. Econometrica 57,
163–169.
Delbaen, F. and W. Schachermayer (1998). The Fundamental Theorem of Asset Pricing
for Unbounded Stochastic Processes. Mathematische Annalen 312, 215–250.
DeMarzo, P. and B. Eaves (1996). A Homotopy, Grassmann Manifold, and Relocal-
ization for Computing Equilibria of GEI. Journal of Mathematical Economics 26,
479–497.
Diament, P. (1993). Semi-Empirical Smooth Fit to the Treasury Yield Curve. Working
Paper, Graduate School of Business, Columbia University.
Dijkstra, T. (1996). On Numeraires and Growth-Optimum Portfolios. Working Paper,
Faculty of Economics, University of Groningen.
Dothan, M. (1978). On the Term Structure of Interest Rates. Journal of Financial
Economics 7, 229–264.
Dothan, M. (1990). Prices in Financial Markets. New York: Oxford University Press.
Duffee, G. (1999a). Estimating the Price of Default Risk. Review of Financial Studies
12, 197–226.
Duffee, G. (1999b). Forecasting Future Interest Rates: Are Affine Models Failures?
Working Paper, Federal Reserve Board.
Duffie, D. (1987). Stochastic Equilibria with Incomplete Financial Markets. Journal of
Economic Theory 41, 405–416; Corrigendum 49 (1989): 384.
109Duffie, D. (1988). An Extension of the Black-Scholes Model of Security Valuation. Jour-
nal of Economic Theory 46, 194–204.
Duffie, D. (1992). The Nature of Incomplete Markets, pp. 214–262. Cambridge: Cam-
bridge University Press.
Duffie, D. (1998). Defaultable Term Structures with Fractional Recovery of Par. Work-
ing Paper, Graduate School of Business, Stanford University.
Duffie, D. (2001). Dynamic Asset Pricing Theory, Third Edition. Princeton University
Press.
Duffie, D. (2002). A Short Course on Credit Risk Modeling with Affine Processes.
Working Paper, Graduate School of Business, Stanford University.
Duffie, D., D. Filipović, and W. Schachermayer (2001). Affine Processes and Applica-
tions in Finance. Working Paper, Graduate School of Business, Stanford University.
Duffie, D. and N. Gârleanu (2001). Risk and Valuation of Collateralized Debt Valuation.
Financial Analysts Journal 57, (1) January–February, 41–62.
Duffie, D. and C.-F. Huang (1985). Implementing Arrow-Debreu Equilibria by Contin-
uous Trading of Few Long-Lived Securities. Econometrica 53, 1337–1356.
Duffie, D. and C.-F. Huang (1986). Multiperiod Security Markets with Differential In-
formation: Martingales and Resolution Times. Journal of Mathematical Economics
15, 283–303.
Duffie, D. and M. Huang (1996). Swap Rates and Credit Quality. Journal of Finance
51, 921–949.
Duffie, D. and R. Kan (1996). A Yield-Factor Model of Interest Rates. Mathematical
Finance 6, 379–406.
Duffie, D. and D. Lando (2001). Term Structures of Credit Spreads with Incomplete
Accounting Information. Econometrica 69, 633–664.
Duffie, D., J. Pan, and K. Singleton (2000). Transform Analysis and Asset Pricing for
Affine Jump-Diffusions. Econometrica 68, 1343–1376.
Duffie, D., L. Pedersen, and K. Singleton (2000). Modeling Sovereign Yield Spreads: A
Case Study of Russian Debt. Working Paper, Graduate School of Business, Stanford
University, forthcoming in The Journal of Finance.
Duffie, D., M. Schroder, and C. Skiadas (1996). Recursive Valuation of Defaultable Secu-
rities and the Timing of the Resolution of Uncertainty. Annals of Applied Probability
6, 1075–1090.
Duffie, D., M. Schroder, and C. Skiadas (1997). A Term Structure Model with Prefer-
ences for the Timing of Resolution of Uncertainty. Economic Theory 9, 3–22.
Duffie, D. and W. Shafer (1985). Equilibrium in Incomplete Markets I: A Basic Model
of Generic Existence. Journal of Mathematical Economics 14, 285–300.
Duffie, D. and W. Shafer (1986). Equilibrium in Incomplete Markets II: Generic Exis-
tence in Stochastic Economies. Journal of Mathematical Economics 15, 199–216.
Duffie, D. and K. Singleton (1997). An Econometric Model of the Term Structure of
Interest Rate Swap Yields. Journal of Finance 52, 1287–1321.
110Duffie, D. and K. Singleton (1999). Modeling Term Structures of Defaultable Bonds.
Review of Financial Studies 12, 687–720.
Duffie, D. and K. Singleton (2002). Credit Risk: Pricing, Measurement, and Manage-
ment. Princeton University Press, in press.
Duffie, D. and C. Skiadas (1994). Continuous-Time Security Pricing: A Utility Gradient
Approach. Journal of Mathematical Economics 23, 107–132.
Duffie, D. and R. Stanton (1988). Pricing Continuously Resettled Contingent Claims.
Journal of Economic Dynamics and Control 16, 561–574.
Duffie, D. and W. Zame (1989). The Consumption-Based Capital Asset Pricing Model.
Econometrica 57, 1279–1297.
Dumas, B. and P. Maenhout (2002). A Central Planning Approach to Dynamic Incom-
plete Markets. Working Paper, INSEAD, France.
Dunn, K. and K. Singleton (1986). Modeling the Term Structure of Interest Rates under
Nonseparable Utility and Durability of Goods. Journal of Financial Economics 17,
27–55.
Dupire, B. (1994). Pricing with a Smile. Risk January, 18–20.
Dybvig, P. and C.-F. Huang (1988). Nonnegative Wealth, Absence of Arbitrage, and
Feasible Consumption Plans. Review of Financial Studies 1, 377–401.
El Karoui, N. and H. Geman (1994). A Probabilistic Approach to the Valuation of
General Floating-Rate Notes with an Application to Interest Rate Swaps. Advances
in Futures and Options Research 7, 47–63.
El Karoui, N. and V. Lacoste (1992). Multifactor Models of the Term Structure of
Interest Rates. Working Paper, Laboratoire de Probabilités, Université de Paris VI.
El Karoui, N., C. Lepage, R. Myneni, N. Roseau, and R. Viswanathan (1991a). The
Pricing and Hedging of Interest Rate Claims: Applications. Working Paper, Labo-
ratoire de Probabilités, Université de Paris VI.
El Karoui, N., C. Lepage, R. Myneni, N. Roseau, and R. Viswanathan (1991b). The
Valuation and Hedging of Contingent Claims with Gaussian Markov Interest Rates.
Working Paper, Laboratoire de Probabilités, Université de Paris VI.
El Karoui, N., R. Myneni, and R. Viswanathan (1992). Arbitrage Pricing and Hedging
of Interest Rate Claims with State Variables I: Theory. Working Paper, Laboratoire
de Probabilités, Université de Paris VI.
El Karoui, N. and M. Quenez (1995). Dynamic Programming and Pricing of Contingent
Claims in an Incomplete Market. SIAM Journal of Control and Optimzation 33,
29–66.
El Karoui, N. and J.-C. Rochet (1989). A Pricing Formula for Options on Coupon
Bonds. Working Paper, October, Laboratoire de Probabilités, Université de Paris
VI.
Elliott, R., M. Jeanblanc, and M. Yor (1999). Some Models on Default Risk. Working
Paper, Department of Mathematics, University of Alberta, forthcoming Mathemat-
ical Finance.
111Engle, R. (1982). Autoregressive Conditional Heteroskedasticity with Estimates of the
Variance of United Kingdom Inflation. Econometrica 50, 987–1008.
Epstein, L. (1988). Risk Aversion and Asset Prices. Journal of Monetary Economics
22, 179–192.
Epstein, L. (1992). Behavior under Risk: Recent Developments in Theory and Appli-
cation. In J. Laffont (Ed.), Advances in Economic Theory, pp. 1–63. Cambridge:
Cambridge University Press.
Epstein, L. and S. Zin (1989). Substitution, Risk Aversion and the Temporal Behavior
of Consumption and Asset Returns I: A Theoretical Framework. Econometrica 57,
937–969.
Epstein, L. and S. Zin (1999). Substitution, Risk Aversion and the Temporal Behavior
of Consumption and Asset Returns: An Empirical Analysis. Journal of Political
Economy 99, 263–286.
Fan, H. and S. Sundaresan (1997). Debt Valuation, Strategic Debt Service and Optimal
Dividend Policy. Working Paper, Columbia University.
Feller, W. (1951). Two Singular Diffusion Problems. Annals of Mathematics 54, 173–
182.
Filipović, D. (1999a). A General Characterization of Affine Term Structure Models.
Working Paper, ETH, Zurich, forthcoming, Finance and Stochastics.
Filipović, D. (1999b). A Note on the Nelson-Siegel Family. Mathematical Finance 9,
349–359.
Filipović, D. (2001). Time-Inhomogeneous Affine Processes. Working Paper, Depart-
ment of Operations Research and Financial Engineering, Princeton University.
Fisher, E., R. Heinkel, and J. Zechner (1989). Dynamic Capital Strucutre Choice: The-
ory and Tests. Journal of Finance 44, 19–40.
Fisher, M., D. Nychka, and D. Zervos (1994). Fitting the Term Structure of Interest
Rates with Smoothing Splines. Working Paper, Board of Governors of the Federal
Reserve Board, Washington D.C.
Fleming, J. and R. Whaley (1994). The Value of Wildcard Options. Journal of Finance
1, 215–236.
Fleming, W. and M. Soner (1993). Controlled Markov Processes and Viscosity Solutions.
New York: Springer-Verlag.
Florenzano, M. and P. Gourdel (1994). T-Period Economies with Incomplete Markets.
Economics Letters 44, 91–97.
Foldes, L. (1978a). Martingale Conditions for Optimal Saving–Discrete Time. Journal
of Mathematical Economics 5, 83–96.
Foldes, L. (1978b). Optimal Saving and Risk in Continuous Time. Review of Economic
Studies 45, 39–65.
Foldes, L. (1990). Conditions for Optimality in the Infinite-Horizon Portfolio-Cum-
Saving Problem with Semimartingale Investments. Stochastics and Stochastics Re-
ports 29, 133–170.
112Foldes, L. (1991a). Certainty Equivalence in the Continuous-Time Portfolio-Cum-Saving
Model. In Applied Stochastic Analysis. London: Gordon and Breach.
Foldes, L. (1991b). Optimal Sure Portfolio Plans. Mathematical Finance 1, 15–55.
Foldes, L. (1992). Existence and Uniqueness of an Optimum in the Infinite-Horizon
Portfolio-Cum-Saving Model with Semimartingale Investments. Stochastic and
Stochastic Reports 41, 241–267.
Foldes, L. (1996). The Optimal Consumption Function in a Brownian Model of Ac-
cumulation, Part A: The Consumption Function as Solution of a Boundary Value
Problem. Working Paper, London School of Economics and Political Science.
Föllmer, H. and M. Schweizer (1990). Hedging of Contingent Claims under Incomplete
Information. In M. Davis and R. Elliott (Eds.), Applied Stochastic Analysis, pp.
389–414. London: Gordon and Breach.
Frachot, A. (1995). Factor Models of Domestic and Foreign Interest Rates with Stochas-
tic Volatilities. Mathematical Finance 5, 167–185.
Frachot, A., D. Janci, and V. Lacoste (1993). Factor Analysis of the Term Structure:
A Probabilistic Approach. Working Paper, Banque de France, Paris.
Frachot, A. and J.-P. Lesne (1993). Econometrics of Linear Factor Models of Interest
Rates. Working Paper, Banque de France, Paris.
Frittelli, M. and P. Lakner (1995). Arbitrage and Free Lunch in a General Financial
Market Model; The Fundamental Theorem of Asset Pricing. Mathematical Finance
5, 237–261.
Gabay, D. (1982). Stochastic Processes in Models of Financial Markets. Working Paper,
In Proceedings of the IFIP Conference on Control of Distributed Systems, Toulouse.
Toulouse, France: Pergamon Press.
Geanakoplos, J. (1990). An Introduction to General Equilibrium with Incomplete Asset
Markets. Journal of Mathematical Economics 19, 1–38.
Geanakoplos, J. and A. Mas-Colell (1989). Real Indeterminacy with Financial Assets.
Journal of Economic Theory 47, 22–38.
Geanakoplos, J. and W. Shafer (1990). Solving Systems of Simultaneous Equations in
Economics. Journal of Mathematical Economics 19, 69–94.
Geman, H., N. El Karoui, and J. Rochet (1995). Changes of Numéraire, Changes of
Probability Measure and Option Pricing. Journal of Applied Probability 32, 443–
458.
Geske, R. (1977). The Valuation of Corporate Liabilities as Compound Options. Journal
of Financial Economics 7, 63–81.
Giovannini, A. and P. Weil (1989). Risk Aversion and Intertemporal Substitution in
the Capital Asset Pricing Model. Working Paper, National Bureau of Economic
Research, Cambridge, Massachusetts.
Girotto, B. and F. Ortu (1994). Consumption and Portfolio Policies with Incomplete
Markets and Short-Sale Contraints in the Finite-Dimensional Case: Some Remarks.
Mathematical Finance 4, 69–73.
113Girotto, B. and F. Ortu (1996). Existence of Equivalent Martingale Measures in Finite
Dimensional Securities Markets. Journal of Economic Theory 69, 262–277.
Goldberg, L. (1998). Volatility of the Short Rate in the Rational Lognormal Model.
Finance and Stochastics 2, 199–211.
Goldstein, R. (1997). Beyond HJM: Fitting the Current Term Structure While Main-
taining a Markovian System. Working Paper, Fisher College of Business, The Ohio
State University.
Goldstein, R. (2000). The Term Structure of Interest Rates as a Random Field. Review
of Financial Studies 13, 365–384.
Goldys, B. and M. Musiela (1996). On Partial Differential Equations Related to Term
Structure Models. Working Paper, School of Mathematics, The University of New
South Wales, Sydney, Australia.
Goldys, B., M. Musiela, and D. Sondermann (1994). Lognormality of Rates and Term
Structure Models. Working Paper, School of Mathematics, University of New South
Wales.
Gorman, W. (1953). Community Preference Fields. Econometrica 21, 63–80.
Gottardi, P. and T. Hens (1996). The Survival Assumption and Existence of Compet-
itive Equilibria when Asset Markets are Incomplete. Journal of Economic Theory
71, 313–323.
Grannan, E. and G. Swindle (1996). Minimizing Transaction Costs of Option Hedging
Strategies. Mathematical Finance 6, 341–364.
Grant, S., A. Kajii, and B. Polak (2000). Temporal Resolution of Uncertainty and
Recursive Non-Expected Utility Models. Econometrica 68, 425–434.
Grinblatt, M. and N. Jegadeesh (1996). The Relative Pricing of Eurodollar Futures and
Forward Contracts. Journal of Finance 51, 1499–1522.
Gul, F. and O. Lantto (1990). Betweenness Satisfying Preferences and Dynamic Choice.
Journal of Economic Theory 52, 162–177.
Guo, D. (1998). The Risk Premium of Volatility Implicit in Currency Options. Journal
of Business and Economics Statistics 16, 498–507.
Hahn, F. (1994). On Economies with Arrow Securities. Working Paper, Department of
Economics, Cambridge University.
Hamza, K. and F. Klebaner (1995). A Stochastic Partial Differential Equation for Term
Structure of Interest Rates. Working Paper, Department of Statistics, The Univer-
sity of Melbourne.
Hansen, A. and P. Jorgensen (1998). Exact Analytical Valuation of Bonds when Spot
Interest Rates are Log-Normal. Working Paper, Centre for Analytical Finance, Uni-
versity of Aarhus, Aarhus School of Business.
Hansen, L. and R. Jaganathan (1990). Implications of Security Market Data for Models
of Dynamic Economies. Journal of Political Economy 99, 225–262.
Harrison, M. and D. Kreps (1979). Martingales and Arbitrage in Multiperiod Securities
Markets. Journal of Economic Theory 20, 381–408.
114Harrison, M. and S. Pliska (1981). Martingales and Stochastic Integrals in the Theory
of Continuous Trading. Stochastic Processes and Their Applications 11, 215–260.
Hart, O. (1975). On the Optimality of Equilibrium when the Market Structure is In-
complete. Journal of Economic Theory 11, 418–430.
He, H. and H. Pagès (1993). Labor Income, Borrowing Constraints, and Equilibrium
Asset Prices. Economic Theory 3, 663–696.
Heath, D. (1998). Some New Term Structure Models. Working Paper, Department of
Mathematical Sciences, Carnegie Mellon University.
Heath, D., R. Jarrow, and A. Morton (1992). Bond Pricing and the Term Structure of
Interest Rates: A New Methodology for Contingent Claims Valuation. Economet-
rica 60, 77–106.
Henrotte, P. (1991). Transactions Costs and Duplication Strategies. Working Paper,
Graduate School of Business, Stanford University.
Hens, T. (1991). Structure of General Equilibrium Models with Incomplete Markets.
Working Paper, Department of Economics, University of Bonn.
Heston, S. (1988). Testing Continuous Time Models of the Term Structure of Interest
Rates. Working Paper, Graduate School of Industrial Administration, Carnegie-
Mellon University.
Heston, S. (1993). A Closed-Form Solution for Options with Stochastic Volatility with
Applications to Bond and Currency Options. Review of Financial Studies 6, 327–
344.
Hilberink, B. and L. Rogers (2000). Optimal Capital Structure and Endogenous Default.
Working Paper, University of Bath.
Hindy, A. and M. Huang (1993). Asset Pricing with Linear Collateral Constraints.
Working Paper, Graduate School of Business, Stanford University.
Hirsch, M., M. Magill, and A. Mas-Colell (1990). A Geometric Approach to a Class of
Equilibrium Existence Theorems. Journal of Mathematical Economics 19, 95–106.
Ho, T. and S. Lee (1986). Term Structure Movements and Pricing Interest Rate Con-
tingent Claims. Journal of Finance 41, 1011–1029.
Hogan, M. (1993). The Lognormal Interest Rate Model and Eurodollar Futures. Work-
ing Paper, Citibank, New York.
Huang, C.-F. (1985a). Information Structures and Equilibrium Asset Prices. Journal of
Economic Theory 31, 33–71.
Huang, C.-F. (1985b). Information Structures and Viable Price Systems. Journal of
Mathematical Economics 14, 215–240.
Huang, C.-F. and H. Pagès (1992). Optimal Consumption and Portfolio Policies with
an Infinite Horizon: Existence and Convergence. Annals of Applied Probability 2,
36–64.
Hull, J. (2000). Options, Futures, and Other Derivative Securities (4th ed.). Englewood
Cliffs, N.J.: Prentice-Hall.
115Hull, J. and A. White (1990). Pricing Interest Rate Derivative Securities. Review of
Financial Studies 3, 573–592.
Hull, J. and A. White (1992). The Price of Default. Risk 5, 101–103.
Hull, J. and A. White (1993). One-Factor Interest-Rate Models and the Valuation of
Interest-Rate Derivative Securities. Journal of Financial and Quantitative Analysis
28, 235–254.
Hull, J. and A. White (1995). The Impact of Default Risk on the Prices of Options and
Other Derivative Securities. Journal of Banking and Finance 19, 299–322.
Husseini, S., J.-M. Lasry, and M. Magill (1990). Existence of Equilibrium with Incom-
plete Markets. Journal of Mathematical Economics 19, 39–68.
Ingersoll, J. (1977). An Examination of Corporate Call Policies on Convertible Securi-
ties. Journal of Finance 32, 463–478.
Jackwerth, J. and M. Rubinstein (1996). Recovering Probability Distributions from
Options Prices. Journal of Finance 51, 1611–1631.
Jacod, J. and P. Protter (2000). Probability Essentials. New York: Springer-Verlag.
Jacod, J. and A. Shiryaev (1998). Local Martingales and the Fundamental Asset Pricing
Theorems in the Discrete-Time Case. Finance and Stochastics 2, 259–274.
Jakobsen, S. (1992). Prepayment and the Valuation of Danish Mortgage-Backed Bonds.
Working Paper, Ph.D. diss., Aarhaus School of Business, Denmark.
Jamshidian, F. (1989a). Closed-Form Solution for American Options on Coupon Bonds
in the General Gaussian Interest Rate Model. Working Paper, Financial Strategies
Group, Merrill Lynch Capital Markets, New York.
Jamshidian, F. (1989b). An Exact Bond Option Formula. Journal of Finance 44, 205–
209.
Jamshidian, F. (1989c). The Multifactor Gaussian Interest Rate Model and Implemen-
tation. Working Paper, Financial Strategies Group, Merrill Lynch Capital Markets,
New York.
Jamshidian, F. (1991a). Bond and Option Evaluation in the Gaussian Interest Rate
Model. Research in Finance 9, 131–170.
Jamshidian, F. (1991b). Forward Induction and Construction of Yield Curve Diffusion
Models. Journal of Fixed Income June, 62–74.
Jamshidian, F. (1993a). Hedging and Evaluating Diff Swaps. Working Paper, Fuji In-
ternational Finance PLC, London.
Jamshidian, F. (1993b). Options and Futures Evaluation with Deterministic Volatilities.
Mathematical Finance 3, 149–159.
Jamshidian, F. (1994). Hedging Quantos, Differential Swaps and Ratios. Applied Math-
ematical Finance 1, 1–20.
Jamshidian, F. (1996a). Bond, Futures and Option Evaluation in the Quadratic Interest
Rate Model. Applied Mathematical Finance 3, 93–115.
Jamshidian, F. (1996b). Libor and Swap Market Models and Measures II. Working
Paper, Sakura Global Capital, London.
116Jamshidian, F. (1997). Pricing and Hedging European Swaptions with Deterministic
(Lognormal) Forward Swap Volatility. Finance and Stochastics 1, 293–330.
Jamshidian, F. (1999). Libor Market Model with Semimartingales. Working Paper,
NetAnalytic Limited.
Jarrow, R., D. Lando, and F. Yu (1999). Diversification and Default Risk: An Equiv-
alence Theorem for Martingale and Empirical Default Intensities. Working Paper,
Cornell University.
Jarrow, R. and S. Turnbull (1994). Delta, Gamma and Bucket Hedging of Interest Rate
Derivatives. Applied Mathematical Finance 1, 21–48.
Jarrow, R. and S. Turnbull (1995). Pricing Derivatives on Financial Securities Subject
to Credit Risk. Journal of Finance 50, 53–85.
Jarrow, R. and F. Yu (1999). Counterparty Risk and the Pricing of Defaultable Secu-
rities. Working Paper, Cornell University.
Jaschke, S. (1996). Arbitrage Bounds for the Term Structure of Interest Rates. Finance
and Stochastics 2, 29–40.
Jeanblanc, M. and M. Rutkowski (1999). Modelling of Default Risk: An Overview.
Working Paper, University of Evry Val of Essonne and Technical University of
Warsaw.
Jeffrey, A. (1995). Single Factor Heath-Jarrow-Morton Term Structure Models Based
on Markov Spot Interest Rate. Journal of Financial and Quantitative Analysis 30,
619–643.
Johnson, B. (1994). Dynamic Asset Pricing Theory: The Search for Implementable Re-
sults. Working Paper, Engineering-Economic Systems Department, Stanford Uni-
versity.
Jong, F.D. and P. Santa-Clara (1999). The Dynamics of the Forward Interest Rate
Curve: A Formulation with State Variables. Journal of Financial and Quantitative
Analysis 34, 131–157.
Jouini, E. and H. Kallal (1993). Efficient Trading Strategies in the Presence of Market
Frictions. Working Paper, CREST-ENSAE, Paris.
Kabanov, Y. (1996). On the FTAP of Kreps-Delbaen-Schachermayer. Working Paper,
Laboratoire de Mathématiques, Université de Franche-Comté.
Kabanov, Y. and D. Kramkov (1995). Large Financial Markets: Asymptotic Arbitrage
and Contiguity. Theory of Probability and its Applications 39, 182–187.
Kabanov, Y. and C. Stricker (2001). The Harrison-Pliska Arbitrage Pricing Theorem
under Transactions Costs. Journal of Mathematical Economics 35, 185–196.
Kan, R. (1993). Gradient of the Representative Agent Utility When Agents Have
Stochastic Recursive Preferences. Working Paper, Graduate School of Business,
Stanford University.
Kan, R. (1995). Structure of Pareto Optima when Agents Have Stochastic Recursive
Preferences. Journal of Economic Theory 66, 626–631.
Karatzas, I. (1988). On the Pricing of American Options. Applied Mathematics and
Optimization 17, 37–60.
117Karatzas, I. (1993). IMA Tutorial Lectures 1–3: Minneapolis. Working Paper, Depart-
ment of Statistics, Columbia University.
Karatzas, I. and S.-G. Kou (1998). Hedging American Contingent Claims with Con-
strained Portfolios. Finance and Stochastics 2, 215–258.
Karatzas, I., J. Lehoczky, and S. Shreve (1987). Optimal Portfolio and Consumption
Decisions for a ‘Small Investor’ on a Finite Horizon. SIAM Journal of Control and
Optimization 25, 1157–1186.
Karatzas, I. and S. Shreve (1988). Brownian Motion and Stochastic Calculus. New York:
Springer-Verlag.
Karatzas, I. and S. Shreve (1998). Methods of Mathematical Finance. New York:
Springer-Verlag.
Kawazu, K. and S. Watanabe (1971). Branching Processes with Immigration and Re-
lated Limit Theorems. Theory of Probability and its Applications 16, 36–54.
Kennedy, D. (1994). The Term Structure of Interest Rates as a Gaussian Random Field.
Mathematical Finance 4, 247–258.
Konno, H. and T. Takase (1995). A Constrained Least Square Approach to the Es-
timation of the Term Structure of Interest Rates. Financial Engineering and the
Japanese Markets 2, 169–179.
Konno, H. and T. Takase (1996). On the De-Facto Convex Structure of a Least Square
Problem for Estimating the Term Structure of Interest Rates. Financial Engineering
and the Japanese Market 3, 77–85.
Koopmans, T. (1960). Stationary Utility and Impatience. Econometrica 28, 287–309.
Kramkov, D. and W. Schachermayer (1998). The Asymptotic Elasticity of Utility Func-
tions and Optimal Investment in Incomplete Markets. Working Paper, Universität
Wien, Austria.
Kraus, A. and R. Litzenberger (1975). Market Equilibrium in a Multiperiod State Pref-
erence Model with Logarithmic Utility. Journal of Finance 30, 1213–1227.
Kreps, D. (1979). Three Essays on Capital Markets. Working Paper, Institute for Math-
ematical Studies in the Social Sciences, Stanford University.
Kreps, D. (1981). Arbitrage and Equilibrium in Economies with Infinitely Many Com-
modities. Journal of Mathematical Economics 8, 15–35.
Kreps, D. and E. Porteus (1978). Temporal Resolution of Uncertainty and Dynamic
Choice. Econometrica 46, 185–200.
Kusuoka, S. (1992a). Arbitrage and Martingale Measure. Working Paper, Research
Institute for Mathematical Sciences, Kyoto University.
Kusuoka, S. (1992b). Consistent Price System when Transaction Costs Exist. Working
Paper, Research Institute for Mathematical Sciences, Kyoto University.
Kusuoka, S. (1993). Limit Theorem on Option Replication Cost with Transaction Costs.
Working Paper, Department of Mathematics, University of Tokyo.
Kusuoka, S. (1999). A Remark on Default Risk Models. Advances in Mathematical
Economics 1, 69–82.
118Kusuoka, S. (2000). Term Structure and SPDE. Advances in Mathematical Economics
2, 67–85.
Kydland, F. and E. Prescott (1991). Indeterminacy in Incomplete Market Economies.
Economic Theory 1, 45–62.
Lakner, P. (1993). Equivalent Local Martingale Measures and Free Lunch in a Stochastic
Model of Finance with Continuous Trading. Working Paper, Statistics and Opera-
tion Research Department, New York University.
Lakner, P. and E. Slud (1991). Optimal Consumption by a Bond Investor: The Case of
Random Interest Rate Adapted to a Point Process. SIAM Journal of Control and
Optimization 29, 638–655.
Lando, D. (1994). Three Essays on Contingent Claims Pricing. Working Paper, Ph.D.
Dissertation, Statistics Center, Cornell University.
Lando, D. (1998). On Cox Processes and Credit Risky Securities. Review of Derivatives
Research 2, 99–120.
Lang, L., R. Litzenberger, and A. Liu (1996). Interest Rate Swaps: A Synthesis. Working
Paper, Faculty of Business Administration, The Chinese University of Hong Kong.
Langetieg, T. (1980). A Multivariate Model of the Term Structure. Journal of Finance
35, 71–97.
Leland, H. (1985). Option Pricing and Replication with Transactions Costs. Journal of
Finance 40, 1283–1301.
Leland, H. (1994). Corporate Debt Value, Bond Covenants, and Optimal Capital Struc-
ture. Journal of Finance 49, 1213–1252.
Leland, H. (1998). Agency Costs, Risk Management, and Capital Structure. Journal of
Finance 53, 1213–1242.
Leland, H. and K. Toft (1996). Optimal Capital Structure, Endogenous Bankruptcy,
and the Term Structure of Credit Spreads. Journal of Finance 51, 987–1019.
LeRoy, S. (1973). Risk Aversion and the Martingale Property of Asset Prices. Interna-
tional Economic Review 14, 436–446.
Levental, S. and A. Skorohod (1995). A Necessary and Sufficient Condition for Absence
of Arbitrage with Tame Portfolios. Annals of Applied Probability 5, 906–925.
Litzenberger, R. (1992). Swaps: Plain and Fanciful. Journal of Finance 47, 831–850.
Liu, J., J. Pan, and L. Pedersen (1999). Density-Based Inference in Affine Jump-
Diffusions. Working Paper, Graduate School of Business, Stanford University.
Long, J. (1990). The Numeraire Portfolio. Journal of Financial Economics 26, 29–69.
Longstaff, F. (1990). The Valuation of Options on Yields. Journal of Financial Eco-
nomics 26, 97–121.
Longstaff, F. and E. Schwartz (1992). Interest Rate Volatility and the Term Structure:
A Two-Factor General Equilibrium Model. Journal of Finance 47, 1259–1282.
Longstaff, F. and E. Schwartz (1993). Implementing of the Longstaff-Schwartz Interest
Rate Model. Working Paper, Anderson Graduate School of Management, University
of California, Los Angeles.
119Longstaff, F. and E. Schwartz (1995). A Simple Approach to Valuing Risky Fixed and
Floating Rate Debt. Journal of Finance 50, 789–819.
Longstaff, F. and E. Schwartz (1998). Valuing American Options By Simulation: A Sim-
ple Least-Squares Approach. Working Paper, Anderson Graduate School of Man-
agement, University of California, Los Angeles.
Lucas, R. (1978). Asset Prices in an Exchange Economy. Econometrica 46, 1429–1445.
Machina, M. (1982). ‘Expected Utility’ Analysis without the Independence Axiom.
Econometrica 50, 277–323.
Madan, D. and H. Unal (1998). Pricing the Risks of Default. Review of Derivatives
Research 2, 121–160.
Magill, M. and M. Quinzii (1996). Theory of Incomplete Markets. Cambridge, MA: MIT
Press.
Magill, M. and W. Shafer (1990). Characterization of Generically Complete Real Asset
Structures. Journal of Mathematical Economics 19, 167–194.
Magill, M. and W. Shafer (1991). Incomplete Markets. In Handbook of Mathematical
Economics, Volume 4, pp. 1523–1614. Amsterdam: North-Holland.
Mas-Colell, A. (1991). Indeterminacy in Incomplete Market Economies. Economic The-
ory 1, 45–62.
Mella-Barral, P. (1999). Dynamics of Default and Debt Reorganization. Review of Fi-
nancial Studies 12, 535–578.
Mella-Barral, P. and W. Perraudin (1997). Strategic Debt Service. Journal of Finance
52, 531–556.
Merton, R. (1971). Optimum Consumption and Portfolio Rules in a Continuous Time
Model. Journal of Economic Theory 3, 373–413; Erratum 6 (1973): 213–214.
Merton, R. (1973). The Theory of Rational Option Pricing. Bell Journal of Economics
and Management Science 4, 141–183.
Merton, R. (1974). On the Pricing of Corporate Debt: The Risk Structure of Interest
Rates. Journal of Finance 29, 449–470.
Merton, R. (1977). On the Pricing of Contingent Claims and the Modigliani-Miller
Theorem. Journal of Financial Economics 5, 241–250.
Miltersen, K. (1994). An Arbitrage Theory of the Term Structure of Interest Rates.
Annals of Applied Probability 4, 953–967.
Miltersen, K., K. Sandmann, and D. Sondermann (1997). Closed Form Solutions for
Term Structure Derivatives with Log-Normal Interest Rates. Journal of Finance
52, 409–430.
Modigliani, F. and M. Miller (1958). The Cost of Capital, Corporation Finance, and
the Theory of Investment. American Economic Review 48, 261–297.
Musiela, M. (1994a). Nominal Annual Rates and Lognormal Volatility Structure. Work-
ing Paper, Department of Mathematics, University of New South Wales, Sydney.
Musiela, M. (1994b). Stochastic PDEs and Term Structure Models. Working Paper,
Department of Mathematics, University of New South Wales, Sydney.
120Musiela, M. and D. Sondermann (1994). Different Dynamical Specifications of the Term
Structure of Interest Rates and their Implications. Working Paper, Department of
Mathematics, University of New South Wales, Sydney.
Nelson, D. (1990). ARCH Models as Diffusion Appoximations. Journal of Econometrics
45, 7–38.
Nielsen, S. and E. Ronn (1995). The Valuation of Default Risk in Corporate Bonds
and Interest Rate Swaps. Working Paper, Department of Management Science and
Information Systems, University of Texas at Austin.
Nunes, J., L. Clewlow, and S. Hodges (1999). Interest Rate Derivatives in a Duffie and
Kan Model with Stochastic Volatility: An Arrow-Debreu Pricing Approach. Review
of Derivatives Research 3, 5–66.
Nyborg, K. (1996). The Use and Pricing of Convertible Bonds. Applied Mathematical
Finance 3, 167–190.
Pagès, H. (1987). Optimal Consumption and Portfolio Policies when Markets are In-
complete. Working Paper, Department of Economics, Massachusetts Institute of
Technology.
Pagès, H. (2000). Estimating Brazilian Sovereign Risk from Brady Bond Prices. Working
Paper, Bank of France.
Pan, J. (1999). Integrated Time-Series Analysis of Spot and Options Prices. Working
Paper, Massachusetts Institute of Technology, forthcoming, Journal of Financial
Economics.
Pan, W.-H. (1993). Constrained Efficient Allocations in Incomplete Markets: Character-
ization and Implementation. Working Paper, Department of Economics, University
of Rochester.
Pan, W.-H. (1995). A Second Welfare Theorem for Constrained Efficient Allocations in
Incomplete Markets. Journal of Mathematical Economics 24, 577–599.
Pang, K. (1996). Multi-Factor Gaussian HJM Approximation to Kennedy and Calibra-
tion to Caps and Swaptions Prices. Working Paper, Financial Options Research
Center, Warwick Business School, University of Warwick.
Pang, K. and S. Hodges (1995). Non-Negative Affine Yield Models of the Term Struc-
ture. Working Paper, Financial Options Research Center, Warwick Business School,
University of Warwick.
Pearson, N. and T.-S. Sun (1994). An Empirical Examination of the Cox, Ingersoll, and
Ross Model of the Term Structure of Interest Rates using the Method of Maximum
Likelihood. Journal of Finance 54, 929–959.
Pennacchi, G. (1991). Identifying the Dynamics of Real Interest Rates and Inflation:
Evidence Using Survey Data. Review of Financial Studies 4, 53–86.
Piazzesi, M. (1997). An Affine Model of the Term Structure of Interest Rates with
Macroeconomic Factors. Working Paper, Stanford University.
Piazzesi, M. (1999). A Linear-Quadratic Jump-Diffusion Model with Scheduled and
Unscheduled Announcements. Working Paper, Stanford University.
121Piazzesi, M. (2002). Affine Term Structure Models. Working Paper, Anderson School,
UCLA.
Pliska, S. (1986). A Stochastic Calculus Model of Continuous Trading: Optimal Port-
folios. Mathematics of Operations Research 11, 371–382.
Plott, C. (1986). Rational Choice in Experimental Markets. Journal of Business 59,
S301–S327.
Poteshman, A. (1998). Estimating a General Stochastic Variance Model from Options
Prices. Working Paper, Graduate School of Business, University of Chicago.
Prisman, E. (1985). Valuation of Risky Assets in Arbitrage Free Economies with Fric-
tions. Working Paper, Department of Finance, University of Arizona.
Protter, P. (1990). Stochastic Integration and Differential Equations. New York:
Springer-Verlag.
Protter, P. (1999). A Partial Introduction to Finance. Working Paper, Purdue Univer-
sity, forthcoming in Stochastic Processes and Their Applications.
Pye, G. (1974). Gauging the Default Premium. Financial Analysts Journal (January-
February), 49–52.
Radner, R. (1967). Equilibre des Marchés a Terme et au Comptant en Cas d’Incertitude.
Cahiers d’Econométrie 4, 35–52.
Radner, R. (1972). Existence of Equilibrium of Plans, Prices, and Price Expectations
in a Sequence of Markets. Econometrica 40, 289–303.
Renault, E. and N. Touzi (1992). Stochastic Volatility Models: Statistical Inference
from Implied Volatilities. Working Paper, GREMAQ IDEI, Toulouse, and CREST,
Paris, France.
Ritchken, P. and L. Sankarasubramaniam (1992). Valuing Claims when Interest Rates
have Stochastic Volatility. Working Paper, Department of Finance, University of
Southern California.
Ritchken, P. and R. Trevor (1993). On Finite State Markovian Representations of the
Term Structure. Working Paper, Department of Finance, University of Southern
California.
Rogers, C. (1993). Which Model for Term-Structure of Interest Rates Should One Use?
Working Paper, Department of Mathematics, Queen Mary and Westfield College,
University of London.
Rogers, C. (1994). Equivalent Martingale Measures and No-Arbitrage. Stochastics and
Stochastic Reports 51, 1–9.
Ross, S. (1987). Arbitrage and Martingales with Taxation. Journal of Political Economy
95, 371–393.
Ross, S. (1989). Information and Volatility: The Non-Arbitrage Martingale Approach
to Timing and Resolution Irrelevancy. Journal of Finance 64, 1–17.
Rubinstein, M. (1976). The Valuation of Uncertain Income Streams and the Pricing of
Options. Bell Journal of Economics 7, 407–425.
Rubinstein, M. (1995). As Simple as One, Two, Three. Risk 8 (January), 44–47.
122Rutkowski, M. (1996). Valuation and Hedging of Contingent Claims in the HJM Model
with Deterministic Volatilities. Applied Mathematical Finance 3, 237–267.
Rutkowski, M. (1998). Dynamics of Spot, Forward, and Futures Libor Rates. Interna-
tional Journal of Theoretical and Applied Finance 1, 425–445.
Ryder, H. and G. Heal (1973). Optimal Growth with Intertemporally Dependent Pref-
erences. Review of Economic Studies 40, 1–31.
Sandmann, K. and D. Sondermann (1997). On the Stability of Lognormal Interest Rate
Models. Mathematical Finance 7, 119–125.
Santa-Clara, P. and D. Sornette (1997). The Dynamics of the Forward Interest Rate
Curve with Stochastic String Shocks. Working Paper, University of California, Los
Angeles.
Sato, K. (1999). Lévy processes and infinitely divisible distributions. Cambridge: Cam-
bridge University Press. Translated from the 1990 Japanese original, Revised by
the author.
Scaillet, O. (1996). Compound and Exchange Options in the Affine Term Structure
Model. Applied Mathematical Finance 3, 75–92.
Schachermayer, W. (1992). A Hilbert-Space Proof of the Fundamental Theorem of Asset
Pricing. Insurance Mathematics and Economics 11, 249–257.
Schachermayer, W. (1994). Martingale Measures for Discrete-Time Processes with In-
finite Horizon. Mathematical Finance 4, 25–56.
Schachermayer, W. (1998). Some Remarks on a Paper of David Kreps. Working Paper,
Institut für Statistik der Universität Wien.
Schachermayer, W. (2001). The Fundamental Theorem of Asset Pricing under Pro-
portional Transaction Costs in Finite Discrete Time. Working Paper, Institut für
Statistik der Universität Wien.
Schönbucher, P. (1998). Term Stucture Modelling of Defaultable Bonds. Review of
Derivatives Research 2, 161–192.
Schroder, M. and C. Skiadas (1999). Optimal Consumption and Portfolio Selection with
Stochastic Differential Utility. Journal of Economic Theory 89, 68–126.
Schroder, M. and C. Skiadas (2000). An Isomorphism between Asset Pricing Models
with and without Linear Habit Formation. Working Paper, Eli Broad Graduate
School of Management, Michigan State University.
Schweizer, M. (1992). Martingale Densities for General Asset Prices. Journal of Math-
ematical Economics 21, 363–378.
Scott, L. (1996). The Valuation of Interest Rate Derivatives in a Multi-Factor Cox-
Ingersoll-Ross Model that Matches the Initial Term Structure. Working Paper, De-
partment of Banking and Finance, University of Georgia, Athens.
Selby, M. and C. Strickland (1993). Computing the Fong and Vasicek Pure Discount
Bond Price Formula. Working Paper, FORC Preprint 93/42, October 1993, Uni-
versity of Warwick.
123Selden, L. (1978). A New Representation of Preference over ‘Certain × Uncertain’
Consumption Pairs: The ‘Ordinal Certainty Equivalent’ Hypothesis. Econometrica
46, 1045–1060.
Sharpe, W. (1964). Capital Asset Prices: A Theory of Market Equilibrium under Con-
ditions of Risk. Journal of Finance 19, 425–442.
Singleton, K. (2001). Estimation of Affine Asset Pricing Models Using the Empirical
Characteristic Function. Journal of Econometrics 102, 111–141.
Singleton, K. and L. Umantsev (2001). Pricing Coupon-Bond and Swaptions in Affine
Term Structure Models. Working Paper, Stanford University.
Skiadas, C. (1997). Conditioning and Aggregation of Preferences. Econometrica 65,
347–367.
Skiadas, C. (1998). Recursive Utility and Preferences for Information. Economic Theory
12, 293–312.
Soner, M., S. Shreve, and J. Cvitanić (1994). There is No Nontrivial Hedging Portfolio
for Option Pricing with Transaction Costs. Annals of Applied Probability 5, 327–
355.
Sornette, D. (1998). String Formulation of the Dynamics of the Forward Interest Rate
Curve. Working Paper, Université des Sciences, Parc Valrose, France, and Institute
of Geophysics and Planetary Physics, University of California Los Angeles.
Stanton, R. (1995). Rational Prepayment and the Valuation of Mortgage-Backed Secu-
rities. Review of Financial Studies 8, 677–708.
Stanton, R. and N. Wallace (1995). ARM Wrestling: Valuing Adjustable Rate Mort-
gages Indexed to the Eleventh District Cost of Funds. Real Estate Economics 23,
311–345.
Stanton, R. and N. Wallace (1998). Mortgage Choice: What’s the Point? Real Estate
Economics 26, 173–205.
Stapleton, R. and M. Subrahmanyam (1978). A Multiperiod Equilibrium Asset Pricing
Model. Econometrica 46, 1077–1093.
Stein, E. and J. Stein (1991). Stock Price Distributions with Stochastic Volatility: An
Analytic Approach. Review of Financial Studies 4, 725–752.
Stricker, C. (1990). Arbitrage et Lois de Martingale. Annales de l’Institut Henri
Poincaré 26, 451–460.
Sundaresan, S. (1989). Intertemporally Dependent Preferences in the Theories of Con-
sumption, Portfolio Choice and Equilibrium Asset Pricing. Review of Financial
Studies 2, 73–89.
Sundaresan, S. (1997). Fixed Income Markets and Their Derivatives. Cincinnati: South-
Western.
Svensson, L. and M. Dahlquist (1993). Estimating the Term Structure of Interest Rates
with Simple and Complex Functional Forms: Nelson and Siegel vs. Longstaff and
Schwartz. Working Paper, Institute for International Economic Studies, Stockholm
University.
124Turnbull, S. (1993). Pricing and Hedging Diff Swaps. Working Paper, School of Business,
Queen’s University.
Turnbull, S. (1994). Interest Rate Digital Options and Range Notes. Working Paper,
School of Business, Queen’s University.
Uhrig-Homburg, M. (1998). Endogenous Bankruptcy when Issuance is Costly. Working
Paper, Department of Finance, University of Mannheim.
Van Steenkiste, R. and S. Foresi (1999). Arrow-Debreu Prices for Affine Models. Work-
ing Paper, Salomon Smith Barney, Inc., Goldman Sachs Asset Management.
Vargiolu, T. (1999). Invariant Measures for the Musiela Equation with Deterministic
Diffusion Term. Finance and Stochastics 3, 483–492.
Vasicek, O. (1977). An Equilibrium Characterization of the Term Structure. Journal of
Financial Economics 5, 177–188.
Werner, J. (1985). Equilibrium in Economies with Incomplete Financial Markets. Jour-
nal of Economic Theory 36, 110–119.
Whalley, A. and P. Wilmott (1997). An Asymptotic Analysis of an Optimal Hedging
Model for Options with Transaction Costs. Mathematical Finance 7, 307–324.
Xu, G.-L. and S. Shreve (1992). A Duality Method for Optimal Consumption and
Investment under Short-Selling Prohibition. I. General Market Coefficients. Annals
of Applied Probability 2, 87–112.
Zhou, C.-S. (2000). A Jump-Diffusion Approach to Modeling Credit Risk and Valuing
Defaultable Securities. Working Paper, Federal Reserve Board, Washington, D.C.
Zhou, Y.-Q. (1997). The Global Structure of Equilibrium Manifold in Incomplete Mar-
kets. Journal of Mathematical Economics 27, 91–111.
125