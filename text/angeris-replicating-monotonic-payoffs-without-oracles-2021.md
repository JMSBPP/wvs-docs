---
sha256: 7fdd4f98a3ed4db3442517471424484a3acaca3f0c6483965ce770474a9b2c15
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 35856
---
arXiv:2111.13740v1 [q-fin.TR] 26 Nov 2021
Replicating Monotonic Payoffs Without Oracles
Guillermo Angeris
angeris@stanford.edu
Alex Evans
ahe4nc@gmail.com
Tarun Chitra
tarun@gauntlet.network
September 2021
Abstract
In this paper, we show that any monotonic payoff can be replicated using only
liquidity provider shares in constant function market makers (CFMMs), without the
need for additional collateral or oracles. Such payoffs include cash-or-nothing calls and
capped calls, among many others, and we give an explicit method for finding a trading
function matching these payoffs. For example, this method provides an easy way to
show that the trading function for maintaining a portfolio where 50% of the portfolio
is allocated in one asset and 50% in the other is exactly the constant product market
maker (e.g., Uniswap) from first principles. We additionally provide a simple formula
for the total earnings of an arbitrageur who is arbitraging against these CFMMs.
Introduction
Constant function market makers (CFMMs) continue to be the most used decentralized ap-
plication, with billions of dollars in daily trading volume. Recently, there has been increased
interest in understanding the space of financial products that can be created with CFMMs.
The main usage of CFMMs, to date, is as decentralized exchanges, or DEXs for short. When
CFMMs are used as DEXs, liquidity providers pool assets into the CFMM contracts with
the aim of earning passive yield on their assets, while traders, who wish to swap one asset for
another, execute trades against this pool while paying a small fee to the liquidity providers
on each trade. To decide which trades to accept, the CFMM contract ensures that a specific
function, known as the trading function, that depends on the current state of the contract
and the traded amounts, is kept constant. An important consequence of this design is that
arbitrageurs will always ensure that the price quoted by CFMM stays synchronized with the
price of other markets that consist of the same asset pairs [AKC+
19, AC20].
Previous work. Another view of a liquidity provider’s shares in a CFMM is as a dynam-
ically adjusted portfolio held by liquidity providers. This portfolio is constantly adjusted by
arbitrageurs [EAC21] as the price of assets in external markets changes. It has been shown
that these portfolios held by liquidity providers can replicate a number of other financial
1payoffs [Cla20, AEC21, Cla21]. Evans [Eva20] was the first to show that CFMMs with dy-
namic trading functions (i.e., where the trading function is allowed to evolve over time) can
replicate any unlevered payoff function. If leverage is available (e.g., if users are allowed
to borrow assets against a liquidity provider’s share of the pool) it is possible to replicate
a number of bounded convex payoffs [CAEK21]. Furthermore, [AEC21] provides a simple
method to construct a CFMM trading function given a desired portfolio value function for
liquidity providers. This method depends on the concavity of the payoff function and uses
some basic properties of convex functions to construct the desired payoffs. However, the pay-
offs that can be generated via this method are restricted — one can only construct a CFMM
whose liquidity provider shares have a portfolio value function that is concave, nonnegative,
nondecreasing, and 1-homogeneous, the so-called ‘consistent’ portfolio values. In fact, the
paper shows that the space of CFMMs and the space of consistent portfolio value functions
are equivalent in that every CFMM has a consistent portfolio value function and vice-versa.
Comparisons and this work. The key insight of this work is to note that liquidity
providers do not have to sell their entire position, but can instead sell off the right to withdraw
individual components of the share. Surprisingly, this small fact allows a much richer set of
payoffs to be replicated without leverage, without additional collateral than what is held in
a CFMM liquidity provider share, and without requiring an external oracle [ESGC21]. More
specifically, we show that any monotonic payoff, in a certain price interval, can be replicated
using this technique by constructing an appropriate trading function. In many practical
cases, we show that these payoffs also yield explicit formulas for the trading function, and,
in some special cases, the total expected arbitrage profit.
Replicating payoffs. Using this method, many of the capped or bounded convex payoffs
of [CAEK21] can be replicated without requiring a CFMM lender. Specifically, we show that
a number of payoffs such as capped calls, logarithmic payoffs, and the cash-or-nothing call
(sometimes called the binary option) can be easily replicated. We also show that one can
uniquely derive the most popular trading function, the constant mean market maker [ZCP18,
AZR20, MM19, Eva20] of Uniswap and Balancer, by requiring that the user’s portfolio
have a constant proportion of their total portfolio value in each asset. This illustrates
that liquidity providers should be assessing the quality of a CFMM pool by assessing the
associated payoffs, rather than just the trading function itself. Provided that a user can
construct smart contracts that securitize a subset of the components of the portfolio in the
liquidity provider share, it is possible to replicate these payoffs. We note that there are live
smart contracts on Ethereum, such as Ondo Finance [All] that allow for liquidity providers
to sell a portion of their yield to other market participants.
Summary. In §1, we present all of the mathematical background needed to construct the
trading function for a given payoff, conditions under which payoffs that span an infinite
interval can be replicated, and a simple formula for the earnings of an arbitrageur for a given
price process. We then provide examples of different payoffs that are useful in practice in §2
2and discuss some interpretations and extensions in §3.
## 1 Replicating payoffs
A payoff is a function f : R+ → R which maps the price p ≥ 0 of some asset, which we will
call the risky asset, to a quantity of the numéraire, f(p). A monotonic payoff is one where
the payoff function f is monotonically nondecreasing; i.e.,
f(p) ≤ f(q),
whenever p ≤ q. In the special case that f is differentiable, this is equivalent to f′
(p) ≥ 0 for
all p ≥ 0. Throughout the rest of this paper, we will be concerned only with the monotonic
payoffs that are nonnegative (i.e., satisfy f(p) ≥ 0) but show some extensions which relax
this latter condition. Additionally, for convenience, we will assume that f is differentiable for
the rest of this section, but we will present results that apply in much more general settings
such as when f is differentiable, except at a countable number of discontinuities, and is lower
semicontinuous.
Portfolio interpretation. We can view the monotonic payoff as a user’s desired portfolio
allocation over two assets: the risky asset and the numéraire, with f(p) denoting how much
of the numéraire the user is holding at price p. In this scenario, the user is continually
rebalancing the portfolio (e.g., by selling or buying the risky asset) as the market price
changes. Using this strategy, if the market price changes from p1 > 0 to p2 > 0, the total
amount of risky asset that the user needs to sell is given by:
Z p2
p1
f′
(p)
p
dp. (1)
A basic argument for this is as follows. Note that, as the price changes from p to p + h, the
user must buy f(p + h) − f(p) of the numéraire (selling if the quantity is negative). If h is
small, this costs approximately (f(p + h) − f(p))/p, and, since f is differentiable, we have:
f(p + h) − f(p)
p
=
f′
(p)h
p
+ o(h).
Dividing the right hand side by h, taking the limit, and integrating over p gives the desired
result. This argument can be made fully airtight, but we omit the details as they are mostly
mechanical and unenlightening.
Required risky asset. A natural question is: at some price α ≤ p ≤ β where α, β satisfy
0 ≤ α ≤ β ≤ ∞ (we allow that β = ∞ for convenience), how much of the risky asset do
users need to hold in their portfolios to be able to trade using this strategy? This follows
from (1), which gives that
g(p) =
Z β
p
f′
(q)
q
dq.
3Therefore, at any price α ≤ p ≤ β, the portfolio under this strategy contains f(p) of the
numéraire, and g(p) of the risky asset. Additionally, we note that, since f′
≥ 0, the function
g is nonincreasing and nonnegative. We call g(p) the ‘replication cost’ at price p.
## 1.1 Desired portfolios and trading functions
We will define the set of desired portfolios as:
S = {(f(p),g(p)) | α ≤ p ≤ β}. (2)
In other words, the set S is the set of all possible portfolio allocations within the replication
interval [α,β].
Portfolio value. A natural question to ask is: what is the portfolio value of S, at some
price p? The portfolio value V (p) at price p is defined as the sum of the total value of all
assets, in terms of the numéraire, i.e.:
V (p) = f(p) + pg(p). (3)
We can also rewrite V in an equivalent, but very useful way:
V (p) = V (α) +
Z p
α
g(q)dq. (4)
To see this, note that:
Z p
α
g(q)dq = pg(p) − αg(α) −
Z p
α
qdg(q),
where the right hand side follows from integration by parts. Since the last term of this
expression is equal to:
−
Z p
α
q dg(q) =
Z p
α
q
df(q)
q
= f(p) − f(α),
then (4) follows from a basic rearrangement.
The portfolio value function has several immediate properties. For example, we can see
from (3) it is nonnegative since f(p),g(p) ≥ 0 whenever 0 ≤ α ≤ p ≤ β. On the other hand,
using (4), we can see that V nondecreasing since g ≥ 0, and concave since g is nonincreasing.
Putting this all together, we see that the portfolio value V is a nonnegative, nondecreasing,
concave function, which implies that there is a constant function market maker with portfolio
value function V [AEC21].
4Trading function. We can construct a trading function for a constant function market
maker whose liquidity provider position at price p is equal to (f(p),g(p)). (For a general
introduction to CFMMs and trading functions, see, e.g., [AAE+
21, §2].) To do this, we use
a simplification of the results from [AEC21], given in appendix A. This simplification shows
that, given the nonnegative, nondecreasing, concave portfolio value function V , we can write
a trading function
ψ(R1,R2) = inf
α≤p≤β
(R1 + pR2 − V (p)), (5)
whose portfolio value is equal to V (p) at price p, for all R1,R2 ≥ 0. Using (4), then
pR2 − V (p) = αR2 − V (α) +
Z p
α
(R2 − g(p))dp.
Since g is nonincreasing, then it is immediate that this expression is minimized by choosing
p to be equal to
g−1
(R2) = sup{α ≤ p ≤ β | g(p) ≥ R2},
if the set is nonempty, and we set g−1
(R2) = α, otherwise. To see this, note that the
integrand of the term Z p
α
(R2 − g(p))dp
is nonpositive for all p ≤ q where q satisfies g(q) ≥ R2, and choosing the largest such q,
i.e., q = g−1
(R2), as defined previously, minimizes the total integral. We use the suggestive
‘inverse’ notation since g−1
is indeed the inverse of g when g is continuous and R2 satisfies
g(β) ≤ R2 ≤ g(α), which is a common case in practice.
Plugging this back into (5), the trading function is given by
ψ(R1,R2) = R1 + g−1
(R2)R2 − V (g−1
(R2)). (6)
In the common special case that g(g−1
(R2)) = R2 (i.e., g−1
(R2) is the ‘true inverse’) then
this simplifies to:
ψ(R1,R2) = R1 − f(g−1
(R2)), (7)
which, from the previous discussion happens when, e.g., g is continuous.
Discussion. The function ψ in (5) is increasing and it is concave as it is the infimum over a
family of functions that are linear in R1 and R2 [BV04, §3.2.3]. Because of this, arbitrageurs
are incentivized to arbitrage against a CFMM using ψ as its trading function, in order to
make its price match that of an external market. From the previous discussion, this ensures
that the liquidity provider’s portfolio, when the external market is at price p, is given by
(f(p),g(p)). We will show a direct proof of this in §1.3 and give a simple expression for the
total earnings of arbitrageurs who arbitrage against CFMMs of this form.
There are a few possible implementations of this system, and we present a very simple
one. In this implementation, a liquidity provider first mints a share on a CFMM whose
trading function is specified above by putting in (f(p),g(p)) of the numéraire and risky
5assets, respectively, when the market price is p. The liquidity provider then sells off the
right to only the numéraire side of the pool, which has value f(p), via some token. This
token grants the buyer the following right: when the token is burned, the liquidity provider
share is also burned, and the amount of numéraire found in the pool is immediately paid
out to the token holder, while the remaining risky asset is paid out to the liquidity provider.
The underlying value of the token is at least (but often close to) f(p), as it can always be
redeemed for that amount at any point, which is the desired monotonic payoff of the price
p.
## 1.2 Replication costs
In the case that β < ∞ and p > 0, the amount of risky asset needed to replicate the
portfolio is always finite when f is finite, but this need not be true as β → ∞. We show
that the growth of f needs to be at most sublinear in order to be finite, while it suffices to
be polynomial of degree (1 − ε) to be finite, for any p > 0.
Necessary conditions. The payoff function f has to exhibit sublinear growth in order to
have a finite replication cost. More specifically, if f is not sublinear in that
f(p) ≥ Cp,
for some C > 0 and for all p ≥ p0 ≥ β (i.e., if f(p) = Ω(p)) then, for any p
g(p) =
Z β
p
f′
(p)
p
dp ≥
Z β
p0
f′
(p)
p
dp ≥
Z β
p0
C
p
dp → ∞,
as β → ∞. So it is necessary that f grows slower than any linear function in order for
the risky side of the portfolio to be finite for any p. In other words, we must have that f is
little-oh of p, i.e., f(p) = o(p) as p → ∞. This means that, e.g., it is not possible to replicate
a call option with a finite amount of risky asset.
Sufficient condition. In order to have finite replication cost for all prices p > 0, it suffices
for the payoff function f to have α > 0 and a growth of at most
f(p) ≤ Cp1−ε
,
for some C > 0, ε > 0 and for all p ≥ p0. The proof is nearly identical to the previous, since,
for any p > 0,
g(p) ≤
Z p0
p
f′
(p)
p
dp +
Z β
p0
f′
(p)
p
dp ≤ D + C(1 − ε)
Z β
p0
p−(1+ε)
dp → D + C(1 − ε)
1
pε
0ε
,
where D =
Rp0
p
f′
(p)/pdp is finite since p > 0, and we assume ε < 1 for convenience. (If
ε ≥ 1 in the original statement, then we can always choose ε < 1 as it is a strictly worse
bound.)
61.3 Arbitrageur earnings
From §1.1, we know that, because the portfolio given by (f(p),g(p)) yields a concave payoff,
then arbitrageurs will be incentivized to arbitrage against it and will make the price of the
CFMM match that of an external market (see, e.g., [AC20]). We prove this directly here,
using a slightly different method.
More specifically, given that the arbitrageur is able to choose any q which leads to a
portfolio allocation of (f(q),g(q)) for the liquidity provider, we show that, if an external
market has price α ≤ p ≤ β, then p is an optimal choice for the portfolio allocation in that
it maximizes the arbitrageur’s earnings.
Maximum profit. Arbitrageurs seek to maximize their own profit and therefore minimize
the portfolio value of the liquidity provider. This is expressed by the following problem:
minimize f(q) + pg(q), (8)
with variable α ≤ q ≤ β. Taking the derivative of the objective and using the definition of
g, this can be written
f′
(q) + pg′
(q) = f′
(q) − p
f′
(q)
q
= f′
(q)

1 −
p
q

.
Note that, since f′
≥ 0 by definition, then the objective is unimodal as its derivative changes
signs at most once. Additionally, the first order optimality condition,
f′
(q)

1 −
p
q

= 0,
implies that choosing p/q = 1 (that is, p = q) is a solution with portfolio value f(p)+pg(p),
when the market price is p.
Nonnegativity of profit. The profit of an arbitrageur is the negative of the change in
the portfolio value when the price changes from p to p′
, which is
p′
(g(p) − g(p′
)) + f(p) − f(p′
). (9)
Because p is a feasible point for the original problem (8), then we have that
f(p′
) + p′
g(p′
) ≤ f(p) + p′
g(p),
which yields, after rearrangement:
p′
(g(p) − g(p′
)) + f(p) − f(p′
) ≥ 0.
7Total earnings. Given a sequence of price changes p0,p1,...,pn, the total earnings, us-
ing (9), are
n X
i=1
pi(g(pi−1) − g(pi)) + f(pi−1) − f(pi) = f(p0) − f(pn) −
n X
i=1
pi(g(pi) − g(pi−1)).
Taking limits, we find that the total earnings are
W = f(P0) − f(PT ) −
Z T
0
Pt dg(Pt),
where Pt is a price process with 0 ≤ t ≤ T, and the integral is to be interpreted in the Itô
sense. Integrating by parts, we can write this as the slightly more interpretable form:
W = V (P0) − V (PT) +
Z T
0
g(Pt)dPt, (10)
where V is the portfolio value function described in (3). From the previous discussion, we
know that the total arbitrageur profit is nonnegative, W ≥ 0, for any price process Pt.
Discussion. We can interpret the individual terms in the arbitrageur’s total earnings,
equation (10), in a simple way. The first term, V (P0) − V (PT ) is the negative of the payoff
to the liquidity provider, which is received from having the underlying portfolio rebalanced as
the price of the asset changes from time t = 0 to time t = T. The second term,
R T
0
g(Pt)dPt,
is a ‘path-dependent’ term that comes from the arbitrageur performing arbitrage at each
time period.
## 2 Examples
In this section, we provide a few useful examples of payoffs which can easily be implemented
in practice using the methods presented in the previous section.
## 2.1 Cash-or-nothing call
The simplest monotonic function which can be replicated is perhaps the cash-or-nothing call,
which has payoff:
f(p) =
(
0 p ≤ p0
1 p > p0,
for some p0 > 0 and all p ≥ 0 (i.e., α = 0 and β = ∞). The amount of risky asset is given
by:
g(p) =
Z ∞
p
df(q)
q
=
1 − f(p)
p0
.
(This integral can be interpreted in many ways, as the derivative of f doesn’t exist at p = p0,
with perhaps the simplest being a Riemann–Stieltjes integral since f is monotonic and 1/p
is differentiable.)
8Interpretation. In fact, because the cash-or-nothing call is so simple, the functions f and
g can be intuited and proven without needing the explicit formula given in (1). Since every
nonnegative, monotonic function can be written as the limit of the sum of a number of cash-
or-nothing calls, we can recover (1) using only this reasoning. This provides an alternative
method for recovering most of the results provided in this paper and is very similar in spirit
to the Carr–Madan replication method in finance [CM01, App. 1].
Trading function. Because g is not continuous, there is no guarantee that there exists a
p ≥ 0 such that g(p) = R2, even when 0 ≤ R2 ≤ 1/p0, so the simplification in (7) does not
apply. On the other hand, it is not hard to show that
g−1
(R2) =
(
p0 R2 > 0
+∞ otherwise,
and therefore that V (g−1
(R2)) = 1 for any R2 ≥ 0. The resulting trading function is then
ψ(R1,R2) = R1 + p0R2 − 1,
where we have defined 0 · ∞ = 0 for convenience. Note that this is just the linear market
maker, defined in [AAE+
21, §2.4].
## 2.2 Capped call
Another example of a payoff is that of the capped call, whose payoff function is defined as
f(p) =

 
 
0 p ≤ p0
p − p0 p0 < p ≤ p1
p1 − p0 p > p1,
where 0 < p0 ≤ p1 are user-defined constants. In this case, we have that
g(p) =

 
 
log(p1/p0) p ≤ p0
log(p1/p) p0 < p ≤ p1
0 p > p1.
Trading function. The trading function for a capped call can be easily computed using
the simplification provided in (7), because the function g is continuous. Using the definition
of g, we have
g−1
(x) = p1e−x
whenever 0 ≤ x ≤ log(p1/p0). The trading function can then be written
ψ(R1,R2) = R1 − f(g−1
(R2)) = R1 + p0 − p1e−R2
,
when 0 ≤ R2 ≤ log(p1/p0), and the reserves are otherwise invalid.
92.3 Black-Scholes cash-or-nothing call
The preceding examples give conditions for the terminal payoffs of binary and capped calls,
respectively. As discussed in [AEC21], it is often more useful to work with the price of
a derivative contract under a parametric model. This typically requires significantly lower
collateral to achieve a similar terminal payoff. One such model is that of Black-Scholes. Here
we derive the payoff the a binary call under this model. In this case the payoff is defined as
f(p) = Φ(d(p))
where Φ(·) is the normal CDF and
d(p) =
log(p/K) − τσ2
/2
σ
√
τ
.
Here, τ > 0 is the time to maturity, K ≥ 0 is the strike price and σ ≥ 0 is the implied
volatility (we assume zero interest rates to minimize notation).
Integral simplification. There is a simple but very useful ‘trick’ to evaluate payoffs of
the form
f(p) = r(s(p)),
where s is a monotonically increasing function. Given that we want to evaluate g, then:
g(p) =
Z ∞
p
r′
(s(q))s′
(q)
q
dq =
Z s(∞)
s(p)
r′
(u)
s−1(u)
du,
where the last equality follows by using the u-substitution u = s(q).
Replication cost. Using this trick, we have that the amount of risky asset is given by:
g(p) =
1
K
Z ∞
d(p)
φ(u)
exp(σ
√
τu + τσ2/2)
du =
1
K
1 − Φ(d(p) + σ
√
τ)

,
where φ(q) = Φ′
(q) = exp(−q2
/2)/
√
2π. As before, we may use (7), because the function g
is continuous. Using the definition of g, we have
g−1
(x) = Keσ
√
τΦ−1(1−Kx)−τσ2/2
From (7), after some cancellations we have
ψ(R1,R2) = R1 − Φ(Φ−1
(1 − KR2) − σ
√
τ)
which coincides with the trading function derived in [AEC21] for a covered call under Black-
Scholes. (As noted in [AEC21], replicating in this manner requires additional capital as the
portfolio value function is pointwise strictly decreasing in the time to maturity, τ. This ‘gain’
as τ ↓ 0 is sometimes called “theta” in finance.)
102.4 Logarithmic payoff
It is also possible to replicate more complicated payoffs. One such example is the logarithmic
payoff which is given by
f(p) =
(
0 p < p0
log(p/p0) p ≥ p0.
Using the above, then the replication cost at p is:
g(p) =
(
1/p0 p < p0
1/p p ≥ p0.
Note that the total amount to cover goes to infinity as p0 ↓ 0.
Trading function. The trading function is also an exercise in algebra, since the function
g is continuous and we can use (7):
ψ(R1,R2) = R1 + log(p0R2),
where the range of valid reserves is 0 ≤ R2 ≤ 1/p0.
Arbitrageur earnings. Using equation (10), we can find how much an arbitrageur should
expect to earn when the price of the risky asset follows a geometric Brownian motion with
stochastic differential
dPt = PtσdWt,
where Wt is a standard Brownian motion. The true portfolio value function is given by
V (p) =
(
p/p0 p < p0
1 + log(p/p0) p ≥ p0.
This portfolio value function is difficult to handle directly, so we will consider the following
portfolio value function:
V (p) = 1 + log(p/p0),
which is ‘approximately’ equal to the true portfolio value function when p0 is small. Using
this latter approximation, we then have:
W = log[P0/PT ] +
Z T
0
σdWt.
Taking expectations gives
E[W] =
1
2
σ2
T.
In other words, the arbitrageur’s expected payoff (approximately) matches that of a variance
swap [Neu94]. Loosely speaking, the right to arbitrage a no-fee CFMM with a logarithmic
payoff may be used to replicate a variance swap without an oracle. Of course, in practice,
the above argument is impractical as it requires unbounded capital (as p0 ↓ 0 is required),
but we expect that finite reserve amounts will suffice to provide similar payoffs.
112.5 Capped power payoffs
Given any power, we can find the market maker for the payoff
f(p) =

 
 
0 p < p0
pα
− pα
0 p0 ≤ p ≤ p1
pα
1 − pα
0 p > p1,
where 0 ≤ p0 ≤ p1 ≤ ∞ and α ∈ R is a real number. It is an exercise in integration to show
g(p) =
α
α − 1
(pα−1
1 − pα−1
),
if p0 ≤ p ≤ p1, while g(p) = g(p0) if p < p0 and g(p) = 0, otherwise. Note that p1 < ∞ is
necessary if α ≥ 1 in order to have a finite replication cost. This portfolio generalizes that
of the the capped call presented in §2.2 as the special case when α = 1.
Trading function. We can write
g−1
(x) =

pα−1
1 +
1 − α
α
x
1/(α−1)
,
with domain 0 ≤ x ≤ g(p0). Because g is continuous, we can use the simplification in (7),
so the trading function can be written as:
ψ(R1,R2) = R1 + pα
0 −

pα−1
1 +
1 − α
α
R2
α/(α−1)
,
where the reserves are valid only when 0 ≤ R2 ≤ g(p0).
## 2.6 Constant proportion portfolios
What happens if a liquidity provider is seeking a constant proportion of their wealth to be
in one asset or the other? As is well known from the literature, this is done by the class of
constant mean market makers [MM19, AZR20], but we can also easily recover this from first
principles using this framework.
Requirements. In this problem, a user wishes to have a portfolio allocation (f(p),g(p))
of the numéraire and risky assets at each price p such that 0 < w < 1 of the portfolio value
is in the numéraire, while (1−w) of the portfolio value is in the risky asset; in other words,
f and g must satisfy
wf(p) = (1 − w)pg(p).
Dividing by p, taking the derivative of both sides, and using the definition of g, we have:
pf′
(p) = wf(p),
12after some simplifications. It is a standard exercise to show that the unique family of solutions
f to this problem is given by
f(p) = Cpw
,
where C ≥ 0 is a constant that determines the total portfolio value. This implies that the
function g is given by:
g(p) = C
w
1 − w
1
p1−w
.
Note that g is a continuous function on the positive reals.
Trading function. Using the definition of g above, we can write
g−1
(x) =

1 − w
w
x
C
− 1
1−w
,
which implies
ψ(R1,R2) = R1 − f(g−1
(R2)) = R1 −

R2
C
1 − w
w
− w
1−w
.
By multiplying both sides of the equation by the right-most term and taking the (1 − w)th
power, we can write the equivalent trading function:
ψ̃(R1,R2) = R1−w
1 Rw
2 − C′
,
where C′
= (Cw/(1 − w))w/(1−w)
. The trading functions are equivalent in the sense that
R1 and R2 satisfy ψ(R1,R2) ≥ 0 if, and only if, ψ̃(R1,R2) ≥ 0. This is the classic trading
function for constant mean market makers.
## 3 Further discussion
In this section, we share some further thoughts and (nearly immediate) extensions of the
method presented above.
Staking. Proof of Stake (PoS) protocols allow a user to lock a digital asset into a pool
(a process known as staking) in order to provide a service to the network. In return, the
network distributes block rewards (a form of subsidy) and collected fees to stakers. The
most popular usage of PoS networks is executing consensus algorithms of replicating state
machines, such as blockchains. Many CFMMs exist as contracts whose state updates and
execution are maintained by a decentralized PoS network.
A number of protocols such as Osmosis [AO21] and Penumbra [dV21] allow users to
stake not only the underlying staking asset but the liquidity provider shares that contain the
staking asset to receive consensus rewards. For instance, if a network uses a risky asset A
13for staking, such networks would allow users to stake any A-numéraire LP share to receive
rewards. One reason a network might want to incentivize such a pool is to ensure that there
is sufficient on-chain liquidity to purchase asset A with the numéraire, regardless of external
market liquidity. The rewards earned by liquidity provider share stakers would be lower than
those earned by those staking the base asset. However, liquidity providers would effectively
be compounding their returns as they get both CFMM fees and staking rewards.
A PoS system with liquidity provider share staking also can be used to construct staking
derivatives, which allows for improved capital efficiency. This capital efficiency comes from
allowing liquidity providers to borrow against their locked shares, provided that price of the
underlying is above a certain threshold. Staking derivatives can be constructed as capped
monotone payoffs [CE20] and the construction of monotone replication in §1.1 can be enforced
by a consensus protocol. In particular, while the right to execute the option to liquidate
an LP share and realize a position of f(p) unit of numéraire is only bounded below by f(p)
in general, it can be made to exactly equal f(p) when a consensus protocol buys the right
to execute an LP share liquidation. This is because a consensus protocol controls when the
precise liquidation occurs and if added as a consensus rule, will only happen exactly when
the portfolio value dropped below a threshold. This suggests that staking derivatives are
natural consumers of monotone replication.
Continuous liquidation interpretation. Another interpretation of monotone replica-
tion via a token that allows for one side of the LP share to be liquidated is as a loan that
is being continuously liquidated as the price changes. More specifically, suppose that an
LP share is created with (f(p0),g(p0)) units of the risky asset and numéraire, respectively.
Further, suppose that rights to the numéraire portion of the pool are sold (as in §1.1).
Now, if the price changes from p0 to p1 over a time interval of length h, then holding share
through the price change is the same as selling the option for g(p0) units of numéraire, hav-
ing it executed at p1, and using the proceeds to mint a new share which has the allocation
(f(p1),g(p1)). If we take h → 0, then this equivalence can be viewed as saying that holding
the liquidity provider share is equivalent to continuously rebalancing by selling numéraire
rights and using the proceeds upon execution to recreate another share and resell numéraire
rights.
Negative reserves. Note that we do not require that f be nonnegative at any point in
the presentation except to assert that the portfolio value function is nonnegative. We can,
instead, allow f(p) to be negative in so far as the portfolio value function is nonnegative
at all times. This idea corresponds to the fact that the portfolio is allowed to short an
asset, so long as the position remains solvent, i.e., so long as the portfolio value function
is nonnegative. We can relax this further by requiring only that the portfolio position is
nonnegative in an interval of prices, while making sure that the portfolio holder’s collateral
is liquidated when the price leaves this interval.
144 Conclusion
We have shown how to replicate nonnegative, monotonic payoff functions (somewhat gener-
alizing the result of [AEC21]) by allowing liquidity providers to sell the rights to a specific
component of their portfolio, rather than their entire portfolio. This generalization allows
us to realize a number of payoffs that were previously thought to require explicit leverage
to replicate with CFMM liquidity provider shares. Such a replication increases the space of
unlevered structured products that can be created with liquidity provider shares which don’t
require additional collateral. Our results are likely best implemented in proof-of-stake (PoS)
systems that interact with liquidity provider shares to construct simple staking derivatives.
Here, the PoS network is the buyer of numéraire exposure. Possible future work directions
include adding the effect of fees on monotone replications and computing expected liquidity
provider profits in different fee regimes after selling a component of the underlying portfolio.
References
[AAE+
21] Guillermo Angeris, Akshay Agrawal, Alex Evans, Tarun Chitra, and Stephen
Boyd. Constant function market makers: Multi-asset trades via convex opti-
mization. arXiv preprint arXiv:2107.12484, 2021.
[AC20] Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant func-
tion market makers. In Proceedings of the 2nd ACM Conference on Advances
in Financial Technologies, AFT ’20, page 80–91, New York, NY, USA, 2020.
Association for Computing Machinery.
[AEC21] Guillermo Angeris, Alex Evans, and Tarun Chitra. Replicating market makers.
arXiv preprint arXiv:2103.14769, 2021.
[AKC+
19] Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chi-
tra. An analysis of Uniswap markets. Cryptoeconomic Systems, 2019.
[All] Nathan Allman. Ondo Vault.
[AO21] Sunny Agrawal and Dev Ojha. Vision for Osmosis, May 2021.
[AZR20] Hayden Adams, Noah Zinsmeister, and Dan Robinson. Uniswap v2 core. 2020.
[BV04] Stephen Boyd and Lieven Vandenberghe. Convex Optimization. Cambridge Uni-
versity Press, Cambridge, UK ; New York, 2004.
[CAEK21] Tarun Chitra, Guillermo Angeris, Alex Evans, and Hsien-Tang Kao. A note on
borrowing constant function market maker shares. 2021.
[CE20] Tarun Chitra and Alex Evans. Why stake when you can borrow? Available at
SSRN 3629988, 2020.
15[Cla20] Joseph Clark. The replicating portfolio of a constant product market. Available
at SSRN 3550601, 2020.
[Cla21] Joseph Clark. The replicating portfolio of a constant product market with
bounded liquidity. Available at SSRN 3898384, 2021.
[CM01] Peter Carr and Dilip Madan. Towards a theory of volatility trading. Option Pric-
ing, Interest Rates and Risk Management, Handbooks in Mathematical Finance,
pages 458–476, 2001.
[dV21] Henry de Valence. Sealed-bid batch auctions, 2021.
[EAC21] Alex Evans, Guillermo Angeris, and Tarun Chitra. Optimal fees for geometric
mean market makers. arXiv preprint arXiv:2104.00446, 2021.
[ESGC21] Shayan Eskandari, Mehdi Salehi, Wanyun Catherine Gu, and Jeremy Clark. SoK:
Oracles from the ground truth to market manipulation. ACMAdvances in Finan-
cial Technology, 2021.
[Eva20] Alex Evans. Liquidity provider returns in geometric mean markets. arXiv preprint
arXiv:2006.08806, 2020.
[MM19] Fernando Martinelli and Nikolai Mushegian. Balancer: A non-custodial portfolio
manager, liquidity provider, and price sensor. 2019.
[Neu94] Anthony Neuberger. The log contract. The Journal of Portfolio Management,
20(2):74–80, 1994.
[ZCP18] Yi Zhang, Xiaohong Chen, and Daejun Park. Formal specification of constant
product xy = k market maker model and implementation. 2018.
A RMMs simplification
In [AEC21], it is shown that, given a portfolio value function U : R2
+ → R which is nonneg-
ative, nondecreasing, concave, and 1-homogeneous, the trading function defined as
ψ(R1,R2) = inf
c1,c2
(c1R1 + c2R2 − U(c1,c2))
has U as its portfolio value function. Additionally, given a scalar portfolio value function
V , that is nonnegative, nondecreasing, concave, and depends only on the relative price p
of asset 1 to asset 2, it can be turned to a 1-homogeneous function U that depends on the
prices of both assets, by use of the perspective transform:
U(c1,c2) = c1V (c2/c1)
16where we assume that U(0,0) = 0 and U(0,c2) = −∞ for c2 > 0. So, we can write:
ψ(R1,R2) = inf
c1,c2
(c1R1 + c2R2 − c1V (c2/c1)).
Noting that
ψ(R1,R2) = inf
c1
c1

inf
c2
(R1 + (c2/c1)R2 − V (c2/c1))

and letting p = c2/c1 we get
ψ(R1,R2) = inf
c1
c1

inf
p
(R1 + pR2 − V (p))

=
(
0 infp (R1 + pR2 − V (p)) ≥ 0
−∞ otherwise.
It is nearly immediate that
ψ̃(R1,R2) = inf
p
(R1 + pR2 − V (p)),
is equivalent to ψ in that ψ(R1,R2) ≥ 0 if, and only if, ψ̃(R1,R2) ≥ 0. The proof holds
throughout even if p is constrained to lie in the interval [α,β] for 0 ≤ α ≤ β ≤ +∞.
17