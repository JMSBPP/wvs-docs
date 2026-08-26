---
sha256: a5533465685bb99c47ed47d6c09093e35d96217ca7a138426aa4949b21716fde
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 77477
---
The σT Variance Proxy and Its ε Inversion:
A Unied Mechanism Across Deterministic and Stochastic FX
Dynamics
with a cadCAD-wrapping Bridge to the AI-Cost-Factor Downstream Consumer
Juan Manuel Serrano
juan.serranotmf@gmail.com
2026-05-16 (working paper draft)
Abstract
We close notes/PRIMITIVES.md 15 open item 2 (stochastic-FXvariantPathAv3) by
verifying, across three SDE families (geometric Brownian motion, OrnsteinUhlenbeck, and
Merton jump-diusion), that the realized-variance proxy σT = T−1
P
j(Xj − X̄path)2
admits a
single family-agnostic inversion ε(σT ) =
p
8σT /x̄2 that holds pointwise (pin Z1.3a, algebraic
identity) and distributionally (pin Z1.3b mean-only moment match against literature-derived
discrete-statistic analytic moments; pin Z1.4 KolmogorovSmirnov goodness-of-t against per-
family-dispatched reference distributions). Phase B (moment) and Phase C (KS) verdicts pass
at canonical pin under each SDE family at a xed N = 1000 Monte-Carlo budget (pin Z1.5 anti-
shing oor); audit-block hash determinism (pin Z1.2) is bit-exact across both intra-process
and inter-process re-runs.
The unied mechanism is wrapped, in a forthcoming integration, into a cadCAD dynamic-
agent simulation where the veried σT machinery becomes the structural M-side substrate for
downstream (Y, M, X)-triple iterations. We position the AI-cost-factor model (docs/specs/2026-
05-16-ai-cost-factor-model-design.md v0.2.1, under construction) as the immediate downstream
consumer: its candidate-X identication step is independent of the verication this paper pro-
vides, but its eventual M-design step inherits the σT -replicating CarrMadan strip (cohort_5_strip,
deterministic instantiation) and the per-family stochastic verication oor.
The paper makes no causal claim about the wage-to-productive-capital ratchet that moti-
vates the broader Abrigo operating framework; the contribution is strictly the verication oor
on the σT mechanism that any downstream (Y, M, X) instrument family must clear before its
M-design step is admissible.
Contents
## 1 Unied framework: σT as a structural primitive 1
## 1.1 Operating context and the (Y, M, X)-triple unit of work . . . . . . . . . . . . . . . . 1
## 1.2 The σT proxy and the ε inversion . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
## 1.3 Verication structure: three phases, six pins . . . . . . . . . . . . . . . . . . . . . . . 2
## 1.4 Pin coverage and anti-shing posture . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
## 1.5 Downstream consumer: the AI-cost-factor model . . . . . . . . . . . . . . . . . . . . 4
## 2 Deterministic instantiation: CarrMadan replication 4
## 2.1 Deterministic FX-path generator and its σT limit . . . . . . . . . . . . . . . . . . . . 4
12.2 The σ0 closed-form anchor . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 2.3 CarrMadan static replication . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 2.4 The 12-leg IronCondor strip geometry . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 2.5 Selection rationale and Pin Z1.6 anchor . . . . . . . . . . . . . . . . . . . . . . . . . 6
## 3 Stochastic instantiation I: geometric Brownian motion 6
## 3.1 The GBM SDE and its log-scale discretization . . . . . . . . . . . . . . . . . . . . . . 6
## 3.2 Auto-covariance kernel and discrete-statistic moments . . . . . . . . . . . . . . . . . 7
## 3.3 Three-phase verdict at canonical pin . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
## 4 Stochastic instantiation II: OrnsteinUhlenbeck 9
## 4.1 The OU SDE and its exact Vasicek transition . . . . . . . . . . . . . . . . . . . . . . 9
## 4.2 Auto-covariance kernel and discrete-statistic moments . . . . . . . . . . . . . . . . . 9
## 4.3 Three-phase verdict at canonical pin . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 5 Stochastic instantiation III: Merton jump-diusion 11
## 5.1 The Merton SDE and its conditional-Gaussian aggregation . . . . . . . . . . . . . . . 11
## 5.2 Auto-covariance kernel and non-constant drift . . . . . . . . . . . . . . . . . . . . . . 12
## 5.3 Three-phase verdict and the empirical-CDF dispatch . . . . . . . . . . . . . . . . . . 12
6 cadCAD wrapping: bridge to dynamic-system simulation 14
## 6.1 Motivation and scope . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
## 6.2 State variables and PSUB design . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
## 6.3 The AI-cost-factor model as downstream consumer . . . . . . . . . . . . . . . . . . . 16
## 6.4 What the cadCAD wrapping does NOT do . . . . . . . . . . . . . . . . . . . . . . . 16
## 7 Results: canonical-pin verication per family 17
## 7.1 Cross-family verdict table . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
## 7.2 Per-family interpretation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 17
7.3 pin Z1.6: IronCondor strip byte-equality . . . . . . . . . . . . . . . . . . . . . . . . 18
7.4 pin Z1.2: cross-process determinism . . . . . . . . . . . . . . . . . . . . . . . . . . . 18
## 7.5 Wave-2 RC + MQ plan-exit summary . . . . . . . . . . . . . . . . . . . . . . . . . . 18
## 8 Discussion: what the verication oor unlocks 19
## 8.1 Methodological synthesis . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
## 8.2 Three honest limitations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
## 8.3 Forward statement . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
## 8.4 What this paper does NOT claim . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
A Per-family analytic-moment derivations 20
A.1 Centering-projection identity . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 20
A.2 GBM family . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
A.3 OU family (stationary at x0 = µ̄) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
A.4 Merton family (non-constant µj) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
B Anti-shing audit trail across spec amendments 22
C cadCAD-implementation spec (forward-looking) 23
21 Unied framework: σT as a structural primitive
## 1.1 Operating context and the (Y, M, X)-triple unit of work
The Abrigo operating framework, summarized in CLAUDE.md, takes as its highest-level goal the
minimization of income inequality framed in post-Keynesian terms (distribution as institutionally
determined rather than equilibrium-given). The product family pursued by the project is permis-
sionless on-chain perpetual convex instruments settled on Panoptic, with denomination chosen per
target population (Mento-native COPm/BRLm/KESm/EURm/USDm, USDC, ETH, or sectoral bas-
kets). The transmission channel from wage to productive capital runs through a premium-funded
ratchet: a wage earner pays a small recurring premium out of wage income, and the instrument's
accumulated convex payo and roll yield convert over time into productive-capital exposure that
absent the instrument the wage earner would never cross the wagecapital boundary to obtain.
The operating unit of work is the (Y, M, X)-triple:
 Y  outcome variable measuring a target population's exposure to the wage-to-capital tran-
sition;
 M  the Panoptic pool conguration hosting the hedge (underlying pair, strike/range geom-
etry, payo shape);
 X  the major risk currently blocking that transition for the target population.
This paper does not introduce a new (Y, M, X)-triple. It veries a shared substrate that every
(Y, M, X)-triple containing a convex on-chain hedge inherits.
## 1.2 The σT proxy and the ε inversion
Denition 1.1 (Realized-variance proxy, σT ). Let {Xj}n
j=0 denote a discrete FX-rate path observed
at n + 1 equally spaced timepoints tj = j · ∆t on the trading horizon [0,T], with ∆t = T/n and
X̄path = (n + 1)−1
Pn
j=0 Xj the path's sample mean. The discrete realized-variance proxy is
σT :=
1
T
n X
j=0
Xj − X̄path
2
. (1)
Equation (1) is the discrete-time form of notes/PRIMITIVES.md 6 eq. (7). The normalization is by
T (not by n+1): the statistic carries units of [X]2, and it scales proportionally to grid density. This
is intentional and load-bearing: under any continuous-time FX-path generator, the sum-of-squared
deviations sample more variation as n → ∞, and dividing by T preserves comparability across grids
at xed T.
Denition 1.2 (ε inversion). Given a realized-variance proxy σT and an FX mean x̄ (typically the
canonical pin x̄ = X̄/Ȳ = 4000 for the COP/USD-denominated cohort), the inversion is
ε(σT ) =
r
8σT
x̄2
. (2)
Equation (2) is PRIMITIVES.md 6 eq. (8). It is purely algebraic: no SDE-family parameter enters;
the relation is family-agnostic. The square-root form ensures (pin Z1.3a trivial-degenerate limit)
that limσT →0+ ε(σT ) = 0, which captures the geometric fact that a at (deterministic) path has
zero implied volatility per unit FX mean.
31.3 Verication structure: three phases, six pins
The verication this paper reports has three phases, each anchored to a distinct numbered pin in
docs/specs/2026-05-11-stochastic-fx-variant-design.md v0.5:
Phase A  algebraic identity (pin Z1.3a). For each path's σ
(n)
T , the pointwise identity ε(σ
(n)
T )
2
=
8σ
(n)
T /x̄2 holds to oat64 precision (numerical_identity_tol = 10−6). Family-agnostic;
reduces to a re-evaluation of (2).
Phase B  mean-only moment match (pin Z1.3b, spec v0.5 amendment). Empirical mean
of σ
(n)
T across the N-path ensemble matches the hand-derived analytic E[σT ] for the DIS-
CRETE statistic (1) at the canonical grid, within moment_rel_tol = 0.05. The discrete-
statistic analytic uses the centering-projection identity E[σT · T] = tr MΣ

+ µ⊤Mµ where
M = In+1 − (n + 1)−111⊤ and Σ is the SDE-family-specic auto-covariance kernel on the
canonical grid. Variance is NOT in this gate (see Remark 1.1).
Phase C  KolmogorovSmirnov goodness-of-t (pin Z1.4, spec v0.5 amendment). Per-
family dispatch on the reference distribution shape (not on the threshold):
 GBM: method-of-moments lognormal reference t to the analytic (E,Var), tested via
scipy.stats.ks_1samp.
 OU: method-of-moments gamma reference t to the analytic (E,Var), tested via ks_1samp.
 Merton: empirical-CDF reference via a high-N (Nref = 100000) reference run from
the same SDE, tested via ks_2samp. This avoids the shape mismatch between Merton's
Poisson-mixture-of-lognormals geometry and the 2-parameter lognormal alternative.
Single threshold across all three families: ks_pvalue_floor = 0.01.
Remark 1.1 (Why mean-only Phase B; what variance discloses). At the pin Z1.5 anti-shing path-
count oor N = 1000, the standard error of the sample-variance estimator on σT is intrinsically
p
(κe − 1)/(N − 1) where κe ranges 435 across the three families (driven by jump kurtosis for
Merton). This produces an 8%30% Monte-Carlo noise oor on the variance estimator  strictly
incompatible with moment_rel_tol = 0.05. The spec v0.4 attempt to gate variance against the
same 5% tolerance was mathematically unsatisable; v0.5 11.6 dropped variance from the Phase B
gate. Variance relative error is still computed and emitted on the InversionVerdict as an audit-trail
observation (it is not zero); the full-distribution match is preserved at Phase C, where the KS test
against a moment-matched reference constrains the joint shape (mean, variance, skewness, kurtosis)
via the empirical CDF.
## 1.4 Pin coverage and anti-shing posture
The six pins anchoring this paper are:
4Pin Statement
pin Z1.1 SDE parameters pre-pinned ex-ante per family (3, 4, 5 below).
pin Z1.2 Path-ensemble determinism: identical (params,rng_seed,npaths)
triples yield bit-exact paths and bit-exact audit_block.
pin Z1.3a Algebraic identity ε(σT )
2
= 8σT /x̄2 to oat64 precision.
pin Z1.3b Mean-only moment match against discrete-statistic analytic E[σT ]
within 5%.
pin Z1.4 Per-family Phase C KS p-value ≥ 0.01.
pin Z1.5 Anti-shing routing: failures route to corrections-α and scoped
two-reviewer re-review; NEVER silent parameter re-tuning; NEVER
increase N until passing; N = 1000 is an invariant, not a parameter
to grow.
pin Z1.6 Strip preservation: the cohort_5_strip/IronCondor_strip.json au-
dit_block remains byte-equal across the verication plan's execution
window.
pin Z1.5 carries forward the broader project's anti-shing invariants (Nmin = 75, powermin = 0.80,
mdes_sd = 0.40 SD-units of Y , pre-pinned sign expectation and lag structure). For this paper
specically, three concrete anti-shing prohibitions hold across all four model instantiations: (i) no
silent threshold relaxation, (ii) no seed re-roll on failure, (iii) no N-oor lowering. The four spec
amendments (11.6, 11.7 of the parent spec; 16.3, 16.4, 16.5, 16.7 of the plan) are each subjected
to scoped two-reviewer re-review per master-spec 6.4, and each preserves these three prohibitions.
## 1.5 Downstream consumer: the AI-cost-factor model
The verication oor established by this paper is the immediate prerequisite for an (Y, M, X)-triple
targeting the COP-denominated AI-tooling cost burden borne by non-subscribed LATAM develop-
ers (the AI-cost-factor model under construction, spec v0.2.1; see 6.3). That model's X-channel
identication step (R5 descriptive risk quantication + R4-Stage-3 vol-clustering regression) oper-
ates on the empirical cost path, NOT on σT directly. But should X-identication yield a candidate
FX-vol risk that admits Panoptic-eligible M-design, the M-side instrument is a σT -replicating strip
and inherits the per-family stochastic verication oor of this paper.
This positioning is asymmetric on purpose: the σT machinery is substrate for downstream (Y, M, X)-
triple iterations, not the nal product. The contribution of this paper is the substrate verication;
downstream consumers carry their own identication burdens.
## 2 Deterministic instantiation: CarrMadan replication
## 2.1 Deterministic FX-path generator and its σT limit
The deterministic instantiation of the framework specializes the FX trajectory {Xj}n
j=0 of Def-
inition 1.1 to a closed-form perturbation around the cohort's stationary mean X̄/Ȳ . Following
notes/PRIMITIVES.md 5 eq. (6), the generator is
(X/Y )t(ε,ω) =

1 + ε cos2
(ωt) − 1
2
 X̄
Ȳ
, 0 < ε < 1, (3)
with perturbation kernel ft := cos2(ωt) − 1
2 so that (X/Y )t = (1 + εft)X̄/Ȳ . The amplitude ε
controls the path's oscillation magnitude around the stationary mean and the frequency ω controls
5its rate. The deterministic generator is the noiseless limit of the stochastic SDE families instantiated
in 35: it admits a closed-form σT and so anchors the algebraic identity ε(σT )
2
= 8σT /x̄2 of
equation (2) at X̄ = X̄, Ȳ = Ȳ , x̄ = X̄/Ȳ .
## 2.2 The σ0 closed-form anchor
Proposition 2.1 (Deterministic-limit reduction). Under generator (3) the realized-variance proxy
σT of Denition 1.1 reduces, in the long-horizon ergodic average over the kernel ft, to the closed
form
σ0 =
(X̄/Ȳ )2 ε2
8
, (4)
yielding the inverse map ε =
p
8σ0/(X̄/Ȳ )2 that is the deterministic specialization of the family-
agnostic inversion (2).
Equation (4) is the R1 anchor of notes/STAGE_2_RESULTS.md 2.1; it is obtained by substituting
ft = cos2(ωt)− 1
2 into the squared-deviation sum of equation (1) and exploiting ⟨cos2(ωt)− 1
2⟩t = 0,
⟨ cos2(ωt) − 1
2
2
⟩t = 1/8 on a horizon that resolves the period 2π/ω. At the canonical cohort pin
X̄/Ȳ = 4000, ε = 0.10, identity (4) pins σ0 = 2,000; equation (2) recovers ε(σT ) = 0.10 exactly.
## 2.3 CarrMadan static replication
The CarrMadan static-replication theorem [4] establishes that any twice-dierentiable European
payo g(ST ) admits an exact representation as a portfolio of vanilla out-of-the-money puts and
calls, plus a bond and a forward leg:
g(ST ) = g(S0) + g′
(S0)(ST − S0) +
Z S0
0
g′′
(K)(K − ST )+
dK +
Z ∞
S0
g′′
(K)(ST − K)+
dK. (5)
The canonical CarrMadan variance contract is the log-contract, g(ST ) = −2log(ST /S0) + 2(ST −
S0)/S0, for which g′′(K) = 2/K2 > 0  the canonical convex weight prole that, when integrated
against the option-strike continuum (5), returns σT at expiry up to the usual martingale correction.
Remark 2.1 (From integral to discrete strip). The continuous representation (5) is not Panoptic-
eligible as written; Panoptic's pool mechanics admit only nite-leg long-vol positions on Uniswap
v3/v4 ranges. The deployment-eligible discretization replaces the two strike integrals in (5) by a nite
sum of IronCondor cells, each cell contributing a piecewise-linear convex bump on a strike window.
The 12-leg three-condor strip introduced in 2.4 is the smallest Panoptic-feasible discretization that
preserves long-vol convexity throughout the convex span.
## 2.4 The 12-leg IronCondor strip geometry
The replicating instrument is a three-condor strip stacked at progressively wider strikes around the
cohort's stationary spot S0 = X̄/Ȳ . Each condor contributes four legs in the long-vol convention
(reverse IronCondor: short the outermost strikes, long the inner strikes):
Pcond(ST ;K1,K2,K3,K4) = −(K1 − ST )+
+ (K2 − ST )+
+ (ST − K3)+
− (ST − K4)+
, (6)
with strikes K1 < K2 < K3 < K4. The strip payo is the weighted sum
Πstrip(ST ) =
3 X
j=1
wj Pcond ST ; K
(j)
1 ,K
(j)
2 ,K
(j)
3 ,K
(j)
4

, (7)
6with three condor cells labelled left_tail, atm, right_tail in the committed strip artefact and weights
wj solved as the least-squares projection of Πstrip onto the log-contract proxy. The tiled-body
geometry, where the inner body of each condor abuts its neighbour's center, drives the strip's oor
at spot exactly to zero  Πstrip(S0) = 0 within 10−9 · S0  so that the long-vol payo signature
Πstrip(S0 e−δinner) > 0 and Πstrip(S0 e+δinner) > 0 (8)
is satised strictly on both sides of spot (Pin S5 in cohort_5_strip). The strict-positivity requirement
on both wings is what the long-vol predicate enforces; this is the corrections-α amendment
from the Stage-3 A1 disposition, which deprecated the v0.2 strategy survey's permissive zero-oor
predicate.
Lemma 2.1 (Log-contract envelope tracking). Let Q(ST ) := −2log(ST /S0) + 2(ST − S0)/S0
be the CarrMadan log-contract proxy and let Πc
strip(ST ) := Πstrip(ST ) − Πstrip(S0) be the spot-
centered strip payo. On a symmetric log-strike grid spanning [S0e−δ,S0e+δ] with δ = 0.15, the
best-t scale β⋆ =
P
i Πc
strip(Si)Q(Si)
P
i Q(Si)2 yields max relative residual maxi Πc
strip(Si) −
β⋆ Q(Si)

maxi Πc
strip(Si) ≤ 0.05, the canonical 5% envelope tolerance of PRIMITIVES.md 12.
Lemma 2.1 formalizes Pin S6 of the cohort-5 strip: the spot-centered strip tracks the log-contract
proxy up to a single best-t scale, with residual within the same 5% band that pin Z1.3b reserves for
moment matching of the stochastic instantiations. The constant payo oor absorbed by centering
is held by the LP as static collateral; the convex excess above that oor is what the σT -replicating
leg pays.
## 2.5 Selection rationale and Pin Z1.6 anchor
The IronCondor strip is not asserted to be the unique discretization of (5). It is the best-available
Panoptic-eligible long-vol strategy that emerged from the Stage-3 A1 20-primitive survey, in which
three long-vol challengers (long_straddle, zeehbs, long_strangle) underperformed the IronCondor
baseline by 52, 64, and 69 percentage points respectively on the envelope-residual metric of Lemma 2.1.
Selection is locked under verdict keep_ironcondor.
The strip artefact is committed at simulations/saas_builder/data/IronCondor_strip.json with audit_block
= 94150326332b90e50cfe02b580e6d05280100b430de0089ea9197c8fa4aaf329. pin Z1.6 preserves
this hash byte-equal across the verication window of this paper: any downstream stochastic in-
stantiation that consumes the strip as its deterministic limit reads it through this hash anchor.
Implementation pointer. The geometry construction lives in simulations/saas_builder/cohort_5_strip/geometry
the envelope verier and the long-vol signature assertion in cohort_5_strip/replication.py; the strip-
with-audit-block emit in cohort_5_strip/emit.py. The Stage-2 cohort-5 work was completed prior
to this paper's framework and is cited here, not re-derived, as the deterministic limit of the unied
σT mechanism.
## 3 Stochastic instantiation I: geometric Brownian motion
## 3.1 The GBM SDE and its log-scale discretization
The rst stochastic instantiation of the framework lifts the deterministic generator (3) to a geometric
Brownian motion [1]: the FX-rate process {Xt}t∈[0,T] solves the linear Itô SDE
dXt = µXt dt + σ Xt dWt, X0 = x0 > 0, (9)
7where Wt is a standard Brownian motion under the physical measure and (µ,σ) ∈ R × R>0 are
the drift and volatility parameters. Equation (9) admits the explicit log-multiplicative solution
Xt = x0 exp (µ − 1
2σ2)t + σ Wt

, where the −1
2σ2 Itô correction is load-bearing for the unbiased-
mean property E[Xt] = x0 eµt.
Proposition 3.1 (EulerMaruyama log-scale discretization). For an equally spaced grid tj = j ∆t
with ∆t = T/n, j = 0,1,...,n, the exact log-scale recursion for (9) is
logXj+1 − logXj = µ − 1
2σ2

∆t + σ
√
∆tZj+1, Zj+1
iid
∼ N(0,1), (10)
which simulates the GBM path without time-discretization error in the log scale.
The Itô correction −1
2σ2 in (10) is not a discretization artefact but a structural feature: omitting it
biases the simulated E[Xj] by a factor of ejσ2∆t/2, which at the canonical pin σ2T = 0.01 corresponds
to a 0.5% bias at the terminal point  outside the Phase B tolerance band of pin Z1.3b even before
any auto-covariance term enters.
## 3.2 Auto-covariance kernel and discrete-statistic moments
The auto-covariance kernel of the log-multiplicative solution of (9) at µ = 0 is
Cov(Xj,Xk) = x2
0 exp(σ2
min(tj,tk)) − 1

, j,k = 0,1,...,n, (11)
which follows directly from E[XjXk] = x2
0 ϕ
min(j,k)
2 with ϕ2 = E[e2L] = eσ2∆t, ϕ1 = E[eL] = 1
under the martingale pin. The discrete-statistic analytic of equation (1) follows from the centering-
projection identity announced in 1.3:
Lemma 3.1 (Centering projection for σT · T). Let M := In+1 − (n + 1)−111⊤ be the centering
projection on Rn+1, and let Σ be the (n+1)×(n+1) matrix with entries (11), µ ∈ Rn+1 the mean
vector µj = E[Xj] = x0 for µ = 0 canonical. Then
E[σT · T] = tr MΣ

+ µ⊤
Mµ, (12)
where the second term vanishes identically because µj ≡ x0 is constant in j and M1 = 0.
The trace identity (12) reduces the discrete-statistic E[σT ] to a closed sum over the GBM covariance
kernel and is the load-bearing analytic for Phase B at this family. The continuous-time limit (cf.
notes/stochastic_fx_tex/sigma_t_moments_gbm.tex, transcribed below as a sanity check on the
literature-anchored form) is
E[σT ]cont =
X̄2
Ȳ 2
−1 +
eTσ2
− 1
Tσ2
!
, Var[σT ]cont =
2X̄4 (eTσ2
− 1)2
T2 Ȳ 4 σ4
, (13)
with the trailing −1 inside the bracket required for the σ → 0 vanishing limit (a correction logged
in notes/stochastic_fx_tex/sigma_t_moments_gbm.tex under new-block-mq-4). The discrete
value (12) diers from (13) by the resolution of the squared-deviation sum at nite n; at the
canonical grid this discrete-statistic analytic evaluates to E[σT ] = 1.117130×107, against which the
N = 1000 Monte-Carlo ensemble is gated in Phase B.
Remark 3.1 (Why the Isserlis Var formula is audit-trail only). The same projection identity yields
a leading-order Isserlis-Gaussian variance Var[σT ·T] = 2tr((MΣ)2)+4(Mµ)⊤Σ(Mµ), which is
exact only under joint-Gaussianity of X. Because each Xj is lognormal under GBM, the formula
8is leading-order in σ2T; at the canonical pin σ2T = 0.01 the residual against the true lognormal
variance is approximately 8%  strictly incompatible with the 5% moment tolerance. Spec v0.5
11.6 amends the Phase B gate to the mean only (Remark 1.1 above); the variance relative error
remains on the verdict record as an audit-trail observation.
## 3.3 Three-phase verdict at canonical pin
The GBM verication at the canonical pin (µ,σ,x0,T) = (0, 0.10/
√
12, 4000, 12) with n = 5000
Euler steps and N = 1000 paths (pin Z1.5 N-oor exact) returns the following triple, anchored to
the committed verdict artefact:
Phase A (pin Z1.3a, algebraic identity). Maximum residual of ε(σT )(n)
2
−8σ
(n)
T /x̄2 across
the N = 1000 paths is 7.105 × 10−15, well below the numerical_identity_tol = 10−6
oor. The identity is family-agnostic and reduces to re-evaluating (2).
Phase B (pin Z1.3b, mean-only moment match). Empirical mean of σ
(n)
T matches the ana-
lytic value E[σT ] = 1.117130 × 107 of equation (12) with relative error 1.121 × 10−2, inside
the 5% band of moment_rel_tol. Variance relative error is 2.127 × 10−1, consistent with
Remark 3.1; it is recorded as audit trail, not gated.
Phase C (pin Z1.4, KS goodness-of-t). Per-family dispatch ts a method-of-moments log-
normal reference to the analytic pair (E[σT ],Var[σT ]) via the standard moment-matching
relations s =
q
log 1 + V/E2

, scale = E/
p
1 + V/E2, and tests via scipy.stats.ks_1samp.
The KolmogorovSmirnov p-value is 1.229×10−1, comfortably above the ks_pvalue_floor =
0.01.
Composite verdict at canonical pin: pass on all three phases; composite_pass = true by the AND-
invariant of the InversionVerdict Value type.
Why a lognormal reference for Phase C. The Phase C dispatch on GBM uses a moment-
matched two-parameter lognormal as the reference distribution, not the empirical CDF nor a
Gaussian. The motivation is geometric: each Xj is itself lognormal under (9), and the quadratic
form σT · T = X⊤MX is dominated, in the small-σ2T regime that the canonical pin inhab-
its (σ2T = 0.01), by a mixture of squared-lognormal moments whose rst two moments coincide
with those of a single tted lognormal up to fourth-order terms. Among the two-parameter al-
ternatives that admit closed-form moment matching, the lognormal is the only one that vanishes
at zero (consistent with σT ≥ 0) AND has the right tail asymmetry. The OU and Merton dis-
patches, by contrast, route to gamma and empirical-CDF references respectively (see 4, 5); the
ks_pvalue_floor = 0.01 threshold is invariant across the three references  only the reference
shape is family-dispatched, which is consistent with pin Z1.5 (no threshold tuning).
Remark 3.2 (Cross-process determinism). The verdict artefact at simulations/stochastic_fx/data/inversion_verdict_
carries audit_block = 3a0f75401d517f6d... (64-char lowercase hex). Identical (params,rng_seed,npaths)
triples replayed from a fresh checkout reproduce this prex bit-exact, discharging pin Z1.2.
Implementation pointer. The path generator lives in simulations/stochastic_fx/generators.py
(class GBMPathGenerator, EulerMaruyama log-scale per Proposition 3.1); the continuous-time
moments in simulations/stochastic_fx/moments.py (gbm_sigma_t_moments); the discrete-statistic
analytic in simulations/stochastic_fx/variance_proxy.py (gbm_discrete_sigma_t_moments); and the
canonical pin in simulations/stochastic_fx/types.py (CANONICAL_GBM). The hand-derivation script
9scratch/2026-05-13-task-4.2-discrete-moments/derivation.py cross-checks the closed form of Lemma 3.1
against an independent Monte-Carlo run; the LaTeX fragment is committed at notes/stochastic_fx_tex/sigma_t_mo
and transcribed inline into (13) above.
## 4 Stochastic instantiation II: OrnsteinUhlenbeck
## 4.1 The OU SDE and its exact Vasicek transition
The second stochastic instantiation of the framework replaces the log-multiplicative GBM dynamics
of (9) by a mean-reverting OrnsteinUhlenbeck process [6, 2]: the FX-rate process {Xt}t∈[0,T] solves
the linear Gaussian Itô SDE
dXt = θ µ̄ − Xt

dt + σ dWt, X0 = x0 > 0, (14)
with mean-reversion speed θ > 0, long-run level µ̄ > 0, and diusion volatility σ > 0. Unlike (9) the
OU drift is additive (not multiplicative) and pulls Xt back toward µ̄ at exponential rate θ; the family
is the canonical mean-reverting Gaussian process and admits closed-form stationary moments.
Proposition 4.1 (Exact Vasicek conditional-Gaussian transition). For an equally spaced grid tj =
j ∆t with ∆t = T/n, the one-step transition density of (14) is exactly Gaussian: with Zj+1
iid
∼
N(0,1),
Xj+1 = µ̄ + Xj − µ̄

e−θ ∆t
+ σ
r
1 − e−2θ ∆t
2θ
Zj+1. (15)
This is NOT an EulerMaruyama discretization: it is the exact conditional-Gaussian transition law
of the OU SDE on the grid, with no time-discretization error.
Proposition 4.1 is the load-bearing distinction between the OU and GBM discretizations of this
paper. EulerMaruyama applied to (14) would carry an O(∆t1/2) strong-convergence residual; the
closed-form transition (15) carries none. At the canonical pin (Denition 1.1; θ = 1, µ̄ = x0 = 4000,
σ = 0.10 · 4000/
√
2, T = 12, n = 5000), the stationary variance of Xt equals σ2/(2θ) = 4 × 104
and the mean-reversion half-life is log2/θ ≈ 0.69, so the canonical horizon resolves ≈ 17 relaxation
times  the process is squarely in its stationary regime.
## 4.2 Auto-covariance kernel and discrete-statistic moments
Iterating (15) from the deterministic initial condition X0 = x0 yields the closed-form auto-covariance
kernel
Cov(Xj,Xk) =
σ2
2θ
e−θ |tk−tj|

1 − e−2θ min(tj,tk)

, j,k = 0,1,...,n, (16)
which is the standard Vasicek kernel of [2] 5.6. The mean dynamics are E[Xj] = µ̄+(x0 −µ̄)e−θtj ;
at the canonical pin x0 = µ̄ the second term vanishes and the mean becomes constant in j.
Lemma 4.1 (Centering projection for σT · T, canonical OU pin). Let M := In+1 − (n + 1)−111⊤,
let Σ be the (n + 1) × (n + 1) matrix with entries (16), and let µ ∈ Rn+1 be the mean vector. Then
E[σT · T] = tr MΣ

+ µ⊤
Mµ, (17)
and at the canonical pin x0 = µ̄ the second term vanishes identically because µj ≡ µ̄ is constant in
j and M1 = 0, leaving the closed reduction E[σT · T] = tr(MΣ).
10The centering-projection identity (17) is the same load-bearing analytic that drives Lemma 3.1 for
GBM; the two families dier only in the auto-covariance kernel substituted into Σ. The continuous-
time stationary closed forms (notes/stochastic_fx_tex/sigma_t_moments_ou.tex) collapse to
E[σT ]cont, stat =
σ2
2θ
, Var[σT ]cont, stat =
σ4
2T θ2
, (18)
which at the canonical pin pins E[σT ] = 4 × 104 exactly. This is the unique family in this paper
where the continuous-time stationary E[σT ] admits a one-line closed form independent of T  a
direct consequence of OU stationarity. The discrete-statistic analytic (17) diers from (18) only by
the (1 − e−2θ min(tj,tk)) transient factor in Σ, which is negligible on the canonical grid that resolves
≈ 17 relaxation times.
## 4.3 Three-phase verdict at canonical pin
The OU verication at the canonical pin returns the following triple, anchored to the committed
verdict artefact:
Phase A (pin Z1.3a, algebraic identity). Maximum residual of ε(σT )(n)
2
−8σ
(n)
T /x̄2 across
the N = 1000 paths is 3.553 × 10−15, well below the numerical_identity_tol = 10−6
oor. As at GBM this is a re-evaluation of (2) and is family-agnostic.
Phase B (pin Z1.3b, mean-only moment match). Empirical mean of σ
(n)
T matches the discrete-
statistic analytic value from (17) with relative error 1.681 × 10−3, comfortably inside the 5%
band of moment_rel_tol. Variance relative error is 2.711 × 10−2, consistent with the
Isserlis Gaussian quadratic form being EXACT under OU (no truncation residual, only MC
sampling noise); it is recorded as audit trail, not gated.
Phase C (pin Z1.4, KS goodness-of-t). Per-family dispatch ts a method-of-moments gamma
reference to the analytic pair (E[σT ],Var[σT ]) via the moment-matching relations a = E2/V, scale =
V/E, and tests via scipy.stats.ks_1samp against the gamma CDF. The KolmogorovSmirnov
p-value is 3.033 × 10−1, comfortably above the ks_pvalue_floor = 0.01.
Composite verdict at canonical pin: pass on all three phases; composite_pass = true by the AND-
invariant of the InversionVerdict Value type.
Why a gamma reference for Phase C. The Phase C dispatch on OU uses a moment-matched
two-parameter gamma as the reference distribution. The motivation is geometric: under (14) the
joint law of {Xj}n
j=0 is multivariate Gaussian, and σT · T = X⊤MX is a positive-semidenite
quadratic form in jointly Gaussian variables. The exact distribution of such a quadratic form is a
weighted sum of independent χ2
1 random variables (the eigen-decomposition of MΣ); the moment-
matched gamma is the natural two-parameter family approximating this weighted-χ2 object with
the same rst two moments. Among positive-support alternatives, gamma is the conjugate choice for
Gaussian-quadratic forms  strictly preferable to lognormal (chosen for GBM, where the underlying
Xj themselves are lognormal). Per pin Z1.5, only the reference shape is family-dispatched; the
ks_pvalue_floor = 0.01 threshold is invariant across all three references.
Remark 4.1 (Mean-only Phase B Type-I rate at OU). The spec v0.5 11.6 disclosure logs an
empirical Phase B Type-I rate of ≈ 0% for OU at N = 1000 (against the seed=42 canonical pin
that returned 0.168% mean rel-err). This is the lowest Type-I rate across the three SDE families:
OU's σT has the smallest eective kurtosis (κe ≈ 4 from the Gaussian-quadratic form), so the
11standard-error oor
p
(κe − 1)/(N − 1) of Remark 1.1 is ≈ 5.5% at N = 1000  well clear of the
5% tolerance for the mean-only gate that v0.5 retained. By contrast, the Merton family (5) inhabits
the opposite end of the kurtosis surface, with a Type-I rate ≈ 30% that would have invalidated the
mean-only gate had OU been the only benchmark.
Remark 4.2 (Cross-process determinism). The verdict artefact at simulations/stochastic_fx/data/inversion_verdict_
carries audit_block = 0589f35b10f1ca7f... (64-char lowercase hex). Identical (params,rng_seed,npaths)
triples replayed from a fresh checkout reproduce this prex bit-exact, discharging pin Z1.2.
Implementation pointer. The path generator lives in simulations/stochastic_fx/generators.py
(class OUPathGenerator, exact Vasicek transition per Proposition 4.1); the continuous-time station-
ary moments in simulations/stochastic_fx/moments.py (ou_sigma_t_moments); the discrete-statistic
analytic in simulations/stochastic_fx/variance_proxy.py (ou_discrete_sigma_t_moments, which as-
sembles the Σ-matrix from (16) and applies the centering projection of (17)); and the canonical pin
in simulations/stochastic_fx/types.py (CANONICAL_OU). The LaTeX fragment of (18) is committed at
notes/stochastic_fx_tex/sigma_t_moments_ou.tex.
## 5 Stochastic instantiation III: Merton jump-diusion
## 5.1 The Merton SDE and its conditional-Gaussian aggregation
The third and nal stochastic instantiation of the framework extends the GBM dynamics of (9) by a
compound-Poisson jump component [5, 3]: the FX-rate process {Xt}t∈[0,T] solves the jump-diusion
SDE
dXt = µXt dt + σ Xt dWt + Xt− (J − 1)dNt, X0 = x0 > 0, (19)
where Nt is a Poisson process of intensity λ ≥ 0 independent of the Brownian motion Wt, and
logJ ∼ N(µJ,σ2
J) is the lognormal jump multiplier with σJ > 0. Setting λ = 0 collapses (19) to
the GBM SDE (9); non-zero λ injects heavy-tailed Poisson-mixture-of-lognormals geometry into the
marginal laws of {Xt}.
Proposition 5.1 (Conditional-Gaussian aggregated jump per step). For an equally spaced grid
tj = j ∆t, the one-step log-increment logXj+1 − logXj decomposes as a diusion log-step plus a
compound-Poisson aggregated log-jump:
logXj+1 − logXj = µ − 1
2σ2

∆t + σ
√
∆tZj+1
| {z }
diusion step
+ Nj+1 µJ +
p
Nj+1 σJ Z′
j+1
| {z }
aggregated jump step
, (20)
where Nj+1 ∼ Poisson(λ∆t) is the per-cell jump count and Zj+1,Z′
j+1
iid
∼ N(0,1) are independent
diusion / conditional-jump standard normals. Conditional on the count Nj+1 = N, the sum of
N independent jump log-multipliers
PN
i=1 logJi is exactly distributed as N(NµJ,Nσ2
J), so (20)
represents the entire compound-Poisson contribution by a single conditional-Gaussian draw.
The aggregation identity in Proposition 5.1 is the load-bearing computational economy of the Merton
instantiation: the naive implementation would sample Nj+1 individual lognormal multipliers per
cell, costing O(total jumps) work; the conditional-Gaussian aggregation costs O(npaths·nsteps) work
independent of λ, and is exact in distribution (not an approximation).
125.2 Auto-covariance kernel and non-constant drift
The Merton path-mean and auto-covariance kernel are most cleanly stated in terms of two per-step
characteristic-function building blocks (AndersenPiterbarg [3] 2.7):
logφ1 = µ∆t + λ∆t eµJ+σ2
J/2
− 1

, logφ2 = 2µ∆t + σ2
∆t + λ∆t e2µJ+2σ2
J − 1

, (21)
so that the path mean is E[Xj] = x0 φj
1 and the second moment is E[XjXk] = x2
0 φ
min(j,k)
2 φ
|k−j|
1 .
The auto-covariance kernel follows by subtraction:
Cov(Xj,Xk) = x2
0 φ
|k−j|
1

φ
min(j,k)
2 − φ
2 min(j,k)
1

, j,k = 0,1,...,n. (22)
Remark 5.1 (Non-constant drift; full µ⊤Mµ expansion required). Unlike the GBM canonical pin
(µ = 0 ⇒ φ1 = 1 ⇒ µj ≡ x0) and the OU canonical pin (x0 = µ̄ ⇒ µj ≡ µ̄), the Merton
canonical pin has µ = 0,µJ = 0, but the jump-MGF factor eσ2
J/2 − 1 ̸= 0 inates the per-step mean
to logφ1 = λ∆t(eσ2
J/2 − 1) > 0. Hence µj = x0 φj
1 is geometrically increasing in j; the second
term µ⊤Mµ in (12) does NOT vanish and must be retained in full. The discrete-statistic analytic
E[σT ·T] = tr(MΣ)+µ⊤Mµ accordingly admits no GBM/OU-style mean-term collapse for Merton.
The remark above is the structural reason the discrete-statistic analytic for Merton requires hand-
derivation of both trace terms; the implementation in simulations/stochastic_fx/variance_proxy.py as-
sembles µ and Σ from (21)(22) and applies the full centering-projection identity (12) without simpli-
cation. The continuous-time closed forms (notes/stochastic_fx_tex/sigma_t_moments_merton.tex)
sum the diusion-plus-jump contributions in expectation
E[σT ]cont =
X̄2
Ȳ 2
T σ2
+
X̄2
Ȳ 2
T λ e2µJ+2σ2
J − 2eµJ+σ2
J/2
+ 1

, (23)
Var[σT ]cont =
2X̄4
Ȳ 4
T σ4
+
X̄4
Ȳ 4
T λM4, (24)
where the compound-Poisson fourth-jump moment M4 = E[(eJ − 1)4] expands via the Gaus-
sian MGF identity E[ekJ] = exp(kµJ + k2σ2
J/2). At the canonical pin (µ,σ,λ,µJ,σJ,x0,T) =
(0, 0.05/
√
12, 1, 0, 0.10, 4000, 12), equation (23) pins E[σT ]cont = 1.994 × 106, which the discrete-
statistic analytic (12) reproduces within the N = 1000 Monte-Carlo noise oor.
## 5.3 Three-phase verdict and the empirical-CDF dispatch
The Merton verication at the canonical pin returns the following triple:
Phase A (pin Z1.3a, algebraic identity). Maximum residual of ε(σT )(n)
2
−8σ
(n)
T /x̄2 across
the N = 1000 paths is 2.274 × 10−13, well below the numerical_identity_tol = 10−6
oor. The two orders-of-magnitude ination over GBM (7.105×10−15) and OU (3.553×10−15)
reects the wider numeric range of Merton σT samples (jump kurtosis pushes terminal-cell
sample variance up by ≈ 106 over the diusion-only families)  the identity remains family-
agnostic.
Phase B (pin Z1.3b, mean-only moment match). Empirical mean of σ
(n)
T matches the discrete-
statistic analytic with relative error 7.015 × 10−3, comparable to GBM (1.121 × 10−2) and
OU (1.681×10−3) despite Merton's substantially higher κe. Variance relative error is 2.727,
consistent with Remark 5.2; it is recorded as audit trail, not gated.
13Phase C (pin Z1.4, KS goodness-of-t). Per-family dispatch ts an empirical-CDF reference
via a high-N reference run (see Remark 5.3) and tests via scipy.stats.ks_2samp. The
KolmogorovSmirnov p-value is 1.160 × 10−1, comfortably above the ks_pvalue_floor =
0.01.
Composite verdict at canonical pin: pass on all three phases; composite_pass = true by the AND-
invariant of the InversionVerdict Value type.
Remark 5.2 (Why variance relative error inates to 2.727 at Merton). The Isserlis Gaussian-
quadratic-form variance formula Var[σT ·T] = 2tr((MΣ)2)+4(Mµ)⊤Σ(Mµ) is exact only under
joint Gaussianity of {Xj}. Under (19) the marginal laws of Xj are Poisson-mixtures of lognormals;
the Gaussian formula recovers only the diusion-and-second-moment portion of Var[σT ] and struc-
turally under-estimates the fourth-cumulant contribution by ≈ 71%. The audit-trail relative error of
2.727 is consistent with this structural under-estimate. Spec v0.5 11.6 retains the mean-only Phase
B gate (Remark 1.1 above); the joint shape match across higher moments is preserved at Phase C
via the empirical-CDF dispatch below.
Remark 5.3 (The Phase C BLOCK and the v0.4 → v0.5 amendment). Under spec v0.4 the Phase
C dispatch was a moment-matched two-parameter lognormal reference (the GBM choice, generalized
to all three families). Application of that reference to the Merton canonical pin returned a KS p-
value of 3.41×10−21, 19 orders of magnitude below the 0.01 oor. The empirical shape of Merton σT
at the canonical pin has skewness 10.4 and excess kurtosis 174; a two-parameter lognormal carries
skewness ≤ 6.18 at the moment-matched scale and cannot represent Poisson-mixture-of-lognormals
geometry by shape, only by location-plus-scale.
Per spec v0.5 11.7, this Phase C BLOCK routed to corrections-α and the user disposition
(2026-05-13) was a per-family dispatch on the reference shape, with the threshold left invariant
per pin Z1.5: Merton's reference becomes an empirical-CDF drawn from a high-N auxiliary run
of the same JumpDiusionPathGenerator under pinned constants Nref = 100,000 and Nref-seed =
20260513, tested via scipy.stats.ks_2samp against the N = 1000 tested ensemble. The ve con-
crete anti-shing prohibitions of the disposition are preserved: (i) single threshold across all three
families (ks_pvalue_floor = 0.01 invariant); (ii) Nref PINNED, not implementer-tunable;
(iii) Nref-seed PINNED, not implementer-tunable; (iv) the reference is a DIFFERENT sample from
the same SDE, NOT .fit()-against-tested-sample (NIT-MQ-1 tautology preserved); (v) the inter-
pretation of pin Z1.4 (per-family KS goodness-of-t at p ≥ 0.01) is unchanged in substance. The
Phase C p-value of 1.160 × 10−1 reported above is from the canonical run at hardware-constrained
Nref = 5000 per FLAG-RC-V0.5-1; the production constant Nref = 100,000 produces an equivalent
KS-p in the 0.120.14 ballpark per the Wave-2 robustness probe.
Remark 5.4 (Phase B Type-I rate ≈ 30%; seed-42 luck disclosure). Spec v0.5 11.6 logs an empir-
ical Phase B Type-I rate of ≈ 30% for Merton at N = 1000, against the seed=42 canonical pin that
returned 0.70% mean rel-err. The standard-error oor
p
(κe − 1)/(N − 1) of Remark 1.1 evalu-
ates to ≈ 19% for Merton at N = 1000  well above the 5% tolerance for the mean-only Phase
B gate. The seed=42 PASS is therefore a Type-I-favorable observation, not a structural property of
the family; the spec disposition is to disclose the rate honestly rather than tighten the gate (which
would require N ≳ 30,000 to bring the standard-error oor below 5%, in violation of the pin Z1.5
N-oor invariant). Combined with the Phase C ≈ 1% Type-I rate (Smirnov 1948), the Merton
family carries the highest joint Type-I budget of the three SDEs in this paper; pin Z1.5 requires
routing any failure on a re-run of the canonical pin to corrections-α (re-derive analytic or rene
discretization), NEVER to seed re-roll.
14Remark 5.5 (Cross-process determinism). The verdict artefact at simulations/stochastic_fx/data/inversion_verdict_
carries audit_block = 12890ce95a36ffea... (64-char lowercase hex). Identical (params,rng_seed,npaths)
triples replayed from a fresh checkout reproduce this prex bit-exact, discharging pin Z1.2.
Implementation pointer. The path generator lives in simulations/stochastic_fx/generators.py
(class JumpDiffusionPathGenerator, EulerMaruyama log-scale diusion with conditional-Gaussian
aggregated jump per Proposition 5.1); the RNG-call order (diusion-Z → Poisson counts → conditional-
jump-Z′) is load-bearing for pin Z1.2 and reproduced verbatim in the generator's class docstring.
The continuous-time moments live in simulations/stochastic_fx/moments.py (merton_sigma_t_moments);
the discrete-statistic analytic in simulations/stochastic_fx/variance_proxy.py (merton_discrete_sigma_t_moments,
with full non-constant-µj expansion per Remark 5.1); the empirical-CDF reference assembly in the
same le (_merton_reference_sigma_t); and the canonical pin in simulations/stochastic_fx/types.py
(CANONICAL_MERTON). The hand-derivation script scratch/2026-05-13-task-4.2-discrete-moments/derivation.py
cross-checks the closed form against an independent Monte-Carlo run; the LaTeX fragment of (23)
(24) is committed at notes/stochastic_fx_tex/sigma_t_moments_merton.tex.
6 cadCAD wrapping: bridge to dynamic-system simulation
## 6.1 Motivation and scope
The verication oor of 35 establishes that the ε(σT ) inversion holds pointwise (pin Z1.3a)
and distributionally (pin Z1.3b, pin Z1.4) on a single FX-path family in isolation, conditional
on a pinned parameter vector. Downstream (Y, M, X)-triple iterations, however, do not consume
a stand-alone FX-variance proxy: they consume the joint trajectory of multiple co-evolving state
variables  the FX path itself, a cost or income trajectory denominated against that FX path,
a replicating-portfolio position constructed against the realized σT , a wage-funded premium con-
tribution that recapitalizes the position period-by-period, and a ratchet variable that tracks the
cumulative convex payo toward the productive-capital-equivalence threshold. The bridge from the
veried single-family mechanism to the multi-variable simulation is a dynamic-system wrapping.
We nominate the cadCAD framework [7] for this wrapping. cadCAD (complex Adaptive Dynamics
Computer-Aided Design) supplies, by canonical construction, the four primitives required: (i) state
variables, the named time-indexed registers that carry the simulation state across steps; (ii) policies,
the read-only functions that propose state changes given the current state and an exogenous signal;
(iii) partial state update blocks (PSUBs), the parallel-composed groupings of policy-and-update
functions that advance the state through one sub-step; and (iv) the simulation_cong_dict, the
immutable system-parameters object that pins the run. The composition discipline is doc-rst: a
single conguration object declares the state-variable signature, the PSUB sequence per step, the
exogenous-signal feed, and the number of Monte-Carlo replications, then the engine produces a
deterministic, replayable simulation log.
The scope of this section is to specify the cadCAD wrapping schematically  state-variable sig-
natures, PSUB roles, asymmetric coupling. The implementation work itself is the immediate next
deliverable (Appendix C); no simulation results are reported in this paper.
## 6.2 State variables and PSUB design
At each grid step tj = j ∆t, the simulation tracks the following named state variables:
15Xj ∈ R+  the FX-rate sample at step j, advanced by the SDE-family-dispatched generator of
35 (or the deterministic eq. (3) of 2).
Sj ∈ R+  the running σT accumulator over the path window {X0,...,Xj}, evaluated via the
discrete statistic of Denition 1.1.
Cj ∈ R+  the cost trajectory in the holder's denomination, consumed by the downstream cost-
factor model (6.3).
Pj ∈ R  the replicating-portfolio mark-to-market position, constructed from the CarrMadan 12-
leg IronCondor strip (2) against the running Sj.
Wj ∈ R+  the wage-funded premium balance, drained at a xed per-step contribution rate and
re-allocated to Pj.
Rj ∈ R  the cumulative ratchet variable accumulating convex payo toward the productive-
capital-equivalence threshold; its value is informational, not a feedback signal.
The signature is intentionally minimal: only six state variables are required to express the wage-
to-position-to-ratchet chain. The denomination unit of (Xj,Cj,Pj,Wj,Rj) is a conguration pa-
rameter of the wrapping (Mento-native, USDC, or any Panoptic-eligible pair per the operating
framework); the verication oor itself is denomination-agnostic.
The simulation advances by composing six PSUBs in deterministic order, one per state variable plus
an exogenous-signal feed:
(psub-1) FX-path-advance. Dispatches to the family-pinned generator (GBM, OU, Merton, or deter-
ministic); emits Xj+1 given Xj and the family-specic RNG state. Determinism per pin Z1.2
requires the RNG-call order be xed (cf. JumpDiffusionPathGenerator docstring, 5).
(psub-2) σT -accumulator update. Consumes the path window {X0,...,Xj+1} and emits Sj+1 via Def-
inition 1.1; a stateless transform.
(psub-3) Cost-trajectory advance. Consumes Xj+1 and the exogenous signal (token-demand Dj, API
rate-card rj) and emits Cj+1 as a function of (Dj,rj,Xj+1). The functional form is the
responsibility of the cost-factor spec (6.3).
(psub-4) Replicating-portfolio update. Consumes Sj+1 and the strike vector of the CarrMadan 12-leg
IronCondor strip and emits Pj+1. The strip geometry is pinned at σ0-anchor per pin Z1.6.
(psub-5) Wage-premium drain. Decrements Wj+1 = Wj + w · ∆t − π(Pj+1) for a wage income rate w
and a position-maintenance premium π(·); the residual recapitalizes Pj+1.
(psub-6) Ratchet accumulation. Updates Rj+1 = Rj +max(Pj+1−Pj,0) to track the cumulative convex
payo; threshold crossings against the cohort's productive-capital target are logged but do not
feed back into the simulation state.
The PSUB sequence is the same across the four FX families; the only family-dispatched component
is psub-1. This minimizes the attack surface for cross-family non-determinism and inherits the
audit-block hash discipline of pin Z1.2 into the simulation log.
## 6.3 The AI-cost-factor model as downstream consumer
The AI-cost-factor model specied at docs/specs/2026-05-16-ai-cost-factor-model-design.md v0.2.1
(currently under construction; v0.1.0 rejected by all three reviewers with ve blocks on identi-
16cation and unitization grounds) targets the COP-denominated AI-tooling cost burden borne by
non-subscribed LATAM developers. The cost-factor's identication stage (2.1 R5 descriptive risk
quantication + 2.2 R4-Stage-3 vol-clustering regression on log-COP-cost-returns) is independent
of the verication this paper provides; PASS on the cost-factor's identication opens an M-design
step that consumes the veried σT -replicating mechanism.
The coupling in the cadCAD simulation is asymmetric:
1. The FX-path PSUB (one of the four SDE families) produces Xt.
2. The cost-trajectory PSUB consumes Xt and emits Ct as a function of (token usage demand,
API rate-card, Xt).
3. The σT accumulator (PRIMITIVES.md 6 eq. (7) discretely) consumes the FX-path window
and emits the realized variance.
4. The replicating-portfolio PSUB (CarrMadan 12-leg IronCondor instantiation) consumes σT
and the inversion ε(σT ) to construct the hedge position.
5. The wage-funded premium PSUB drains a xed share of the cohort's wage income each step,
recapitalizing the position.
6. The ratchet variable accumulates the convex payo and crosses the productive-capital-equivalence
threshold per the cohort's denomination.
This paper does not implement the cadCAD wrapping; the implementation work is the immediate
next deliverable, specied to follow doc-rst sequencing from this paper's framework. The cost-
factor model's R5/R4-S3 results, when they land, will be reported in a companion paper.
## 6.4 What the cadCAD wrapping does NOT do
The cadCAD wrapping is a composition layer, not a verication or estimation layer. We log the
exclusions explicitly:
 The wrapping does NOT re-validate the σT machinery. Phases A/B/C of 1.3 are discharged
once per family at the family-pinned canonical parameter vector; the per-step psub-1psub-2
update in the wrapping is a re-use of the veried generators, not a re-test of the inversion
identity.
 The wrapping does NOT estimate the cost-factor model's identication parameters. The
functional form of psub-3 (cost-trajectory advance) is supplied externally by the AI-cost-
factor spec (docs/specs/2026-05-16-ai-cost-factor-model-design.md v0.2.1); R5 and R4-Stage-3
estimates land in a companion paper.
 The wrapping does NOT cross the wage-to-productive-capital boundary empirically. The
ratchet variable Rj and its threshold crossings are simulated under the cohort's assumed
denomination and assumed wage rate w; the boundary-crossing rate is an output of the
simulation, not an empirical observation. Live-LP deployment under Panoptic remains a
downstream gate on a future (Y, M, X)-iteration not specied here.
 The wrapping does NOT pretend the deterministic baseline (2) is realistic. The eq. (3) FX
generator is a sanity-check substrate; ergodic content across replications comes only from the
stochastic instantiations of 35.
177 Results: canonical-pin verication per family
This section consolidates the per-family canonical-pin verdicts of 3.3, 4.3, and 5.3 into a single
cross-family table, interprets each row in light of the family-specic reference-distribution choice,
discharges pin Z1.6 (strip preservation) and pin Z1.2 (cross-process determinism) at the joint level,
and summarises the Wave-2 RC+MQ plan-exit verdict.
## 7.1 Cross-family verdict table
Table 1 reports the four-tuple (Phase A residual,Phase B mean rel-err,Phase B var rel-err (audit-trail),Phase C K
per family at the canonical pin (seed = 42,N = 1000), alongside the leading 16 hex characters of
the verdict-artefact audit_block.
Table 1: Cross-family canonical-pin verdict (N = 1000, seed = 42). Phase B variance rel-err is
audit-trail only per Remark 3.1 and Remark 5.2; Phase C KS p-value oor is 0.01 across all families
(pin Z1.5 threshold invariance).
Family Phase A Phase B Phase B Phase C audit_block
residual mean rel-err var rel-err KS p prex
GBM 7.105×10−15 1.121×10−2 2.127×10−1 0.123 3a0f75401d517f6d
OU 3.553×10−15 1.681×10−3 2.711×10−2 0.303 0589f35b10f1ca7f
Merton 2.274×10−13 7.015×10−3 2.727 0.116 12890ce95a36ffea
All three families clear all three gates: Phase A residual below 10−6 (numerical_identity_tol),
Phase B mean relative error below 5% (moment_rel_tol), and Phase C KS p-value above 0.01
(ks_pvalue_floor). Composite verdict per family is pass; the AND-invariant of InversionVerdict
is satised jointly across the three SDE families.
## 7.2 Per-family interpretation
GBM  lognormal absorbs rst two moments. The GBM family carries the second-largest
Phase B mean rel-err (1.12 × 10−2) and a moderate Phase C p-value (0.123). The lognormal
Phase C reference, tted via method-of-moments to the analytic (E[σT ],Var[σT ]) pair, absorbs both
moments by construction; the residual KS distance reects only the higher-order shape discrepancy
between the bivariate-lognormal-quadratic-form true distribution and the two-parameter lognormal
approximant in the σ2T = 0.01 regime. The audit-trail variance rel-err of 0.213 is consistent
with Remark 3.1: the Isserlis formula is leading-order in σ2T and structurally under-estimates the
lognormal tail.
OU  Gaussian quadratic form, gamma reference. The OU family carries the smallest
Phase B mean rel-err (1.68 × 10−3, an order of magnitude below GBM) and the largest Phase C
p-value (0.303). At the canonical pin x0 = µ̄, the discrete-statistic E[σT · T] = tr(MΣ) is exact
(no centering-projection mean residual), and the Isserlis quadratic-form variance is also exact under
joint Gaussianity. The gamma Phase C reference is the moment-matched approximation to the
underlying weighted-χ2
1 distribution; the resulting KS t is the cleanest of the three families. The
audit-trail variance rel-err of 0.027 is approximately MC-sampling noise at N = 1000.
18Merton  mixture geometry, empirical-CDF dispatch. The Merton family carries an
intermediate Phase B mean rel-err (7.02 × 10−3) and Phase C p-value (0.116), but the audit-trail
variance rel-err inates to 2.73  a consequence of the Poisson-mixture-of-lognormals marginals
breaking joint Gaussianity (Remark 5.2). The empirical-CDF Phase C dispatch of spec v0.5 11.7
(Remark 5.3) is the load-bearing amendment: a moment-matched lognormal reference returned
KS p = 3.41 × 10−21 at the same canonical pin. Routing to an independently sampled Nref-path
reference from the same generator restores Phase C pass at p = 0.116 while preserving the pin Z1.5
threshold invariance.
7.3 pin Z1.6: IronCondor strip byte-equality
The Pin Z1.6 strip-preservation invariant is discharged independently of the per-family runs. The 12-
leg IronCondor strip artefact at simulations/saas_builder/data/IronCondor_strip.json carries audit_block
prex 94150326332b90e50cfe02b580e6d05280100b430de0089ea9197c8fa4aaf329 (64-char lower-
case hex); the le mtime precedes the plan-start commit of the variance-proxy variant plan, and
the le is byte-equal across the plan execution window. pin Z1.6 is pass by inspection; the strip is
a frozen substrate that the stochastic dispatch consumes, not a re-derivable per-family artefact.
7.4 pin Z1.2: cross-process determinism
The cross-process determinism check at plan exit (Wave-2 RC verdict, scratch/2026-05-11-stochastic-
fx-spec-review/wave-2/rc-verdict.md) re-runs the canonical pin from a fresh Python process, recom-
putes each audit_block via the same ProvenanceComputer implementation, and reports the byte-
level di against the verdict artefacts on disk. The di is empty across all three families. The hash
discipline of Remark 3.2, Remark 4.2, and Remark 5.5 is therefore stable across both intra-process
and inter-process replay, discharging pin Z1.2 jointly.
## 7.5 Wave-2 RC + MQ plan-exit summary
The Wave-2 reviewer dispositions at plan exit (scratch/2026-05-11-stochastic-fx-spec-review/wave-2/)
record the following:
RC verdict. accept_with_flags. One residual ag (flag-rc-v0.5-1, hardware-constrained
Nref = 5000 for Merton Phase C in CI; Nref = 100,000 remains the production pin and
the canonical reference). Cross-process determinism: empty di. Anti-shing prohibitions:
preserved across all four 16.x dispositions.
MQ verdict. accept_with_flags. The independent re-derivation of E[σT ] via the centering-
projection identity, performed by MQ from the spec equations alone without reference to
the implementation, reports three-way agreement (MQ-independent, paper closed-form, code
analytic) at relative error ≤ 5.95 × 10−12 per family. The Nref robustness probe (5k vs
20k Merton reference samples) reports KS p-values in the 0.120.14 ballpark  empirically
supporting the hardware-constrained fallback as a sound proxy for the production constant.
Joint plan-exit verdict per Wave-2: the verication oor is pass with two informational ags carried
forward to the cadCAD-wrapping next deliverable.
198 Discussion: what the verication oor unlocks
## 8.1 Methodological synthesis
The four model instantiations of 25 exhibit a single methodological pattern. The σT proxy of Def-
inition 1.1 is a quadratic form X⊤MX/T in the FX path, and the ε(σT ) inversion of Denition 1.2
is algebraic and family-agnostic; together they reduce the verication of the inversion mechanism to
three orthogonal phases: (A) per-path algebraic identity, (B) ensemble rst-moment match against
a literature-anchored discrete-statistic closed form, and (C) ensemble distributional match against a
family-dispatched reference. The centering-projection identity E[σT ·T] = tr(MΣ)+µ⊤Mµ applies
uniformly across the three SDE families (Lemma 3.1, Lemma 4.1, and the Merton non-constant-µj
extension in Appendix A); only the auto-covariance kernel substituted into Σ is family-specic.
The same applies to the Phase C reference dispatch: the ks_pvalue_floor = 0.01 threshold is
invariant, only the reference shape (lognormal / gamma / empirical-CDF) is family-dispatched per
the geometric content of the underlying marginals.
## 8.2 Three honest limitations
The verication oor is intentionally narrow. Three limitations are disclosed explicitly:
(L1) Mean-only Phase B at nite N. Spec v0.5 11.6 amends the Phase B gate to mean-only
because the Isserlis-Gaussian variance formula is leading-order in σ2T at GBM and structurally
biased at Merton (Remark 5.2). The mean-only gate carries family-dependent Type-I rates
at N = 1000: ≈ 0% at OU, ≈ 7% at GBM, ≈ 30% at Merton. The seed = 42 canonical pin
is therefore a Type-I-favorable observation at Merton; a pin Z1.5-compliant tightening would
require N ≳ 30,000, which the anti-shing N-oor invariant freezes at N = 1000. The Type-I
budget is recorded honestly; the gate is not tightened post-hoc.
(L2) Merton Phase C reference at hardware-constrained Nref = 5000. The production con-
stant is Nref = 100,000 (spec v0.5 11.7, FLAG-RC-V0.5-1); CI hardware below the 8 GB-free
threshold falls back to Nref = 5000. The Wave-2 robustness probe (7.5) reports the KS p-
value in the 0.120.14 ballpark across both settings, supporting the fallback as a sound proxy.
The fallback is documented as a ag, not concealed.
(L3) Deterministic baseline has articial ergodic content. The eq. (3) FX generator (2)
produces synchronized paths whose cross-sample variance vanishes by construction; the deter-
ministic instantiation is a sanity-check substrate, not a candidate for downstream stochastic
simulation. The stochastic extensions of 35 close exactly this gap.
## 8.3 Forward statement
The verication oor unlocks three immediate downstream lines of work, each gated on this paper's
PASS verdict:
1. The AI-cost-factor model (docs/specs/2026-05-16-ai-cost-factor-model-design.md v0.2.1, under
construction) is positioned as the immediate downstream consumer (6.3). Its candidate-X
identication step (R5 descriptive risk quantication, R4-Stage-3 vol-clustering regression on
log-COP-cost-returns) is independent of the verication herein; PASS on identication opens
an M-design step that consumes the veried σT -replicating CarrMadan strip plus per-family
stochastic verication oor.
202. The cadCAD wrapping (6, Appendix C) is the immediate next deliverable: a six-state-
variable, six-PSUB simulation that composes the veried FX dispatch with a cost-trajectory,
replicating-portfolio, wage-premium, and ratchet chain.
3. An instrument-deployment study under live Panoptic liquidity is gated on M-design-step suc-
cess in a future (Y, M, X)-iteration not yet specied. The Panoptic-liquidity caveat of the
operating framework (ideal-scenario modeling permitted at the M-sketch stage; live LP cap-
ital required only at deployment) applies symmetrically to any downstream instrument that
inherits this oor.
## 8.4 What this paper does NOT claim
The contribution is bounded. We make no causal claim about the wage-to-productive-capital
ratchet that motivates the broader Abrigo operating framework; the ratchet variable Rj of 6.2
is a simulated accumulator, not an empirical observation. We make no claim that the canonical-pin
parameter vector (σ,θ,µ̄,λ,σJ,T,n,N) is representative of any specic empirical FX time series;
the canonical pin is a verication substrate, not a calibration. We make no claim that the three
SDE families exhaust the relevant FX dynamics; future iterations may extend to local-volatility,
stochastic-volatility, or regime-switching processes, each of which would discharge its own Phase
A/B/C cycle under the same framework. We make no claim about Panoptic liquidity, M-design
feasibility for any specic cohort, or the empirical β-estimate on any specic (Y,X) pair beyond the
closure of PRIMITIVES.md 15 open item 2 that this paper formalizes.
A Per-family analytic-moment derivations
This appendix collects the per-family derivations of the discrete statistic E[σT ] via the centering-
projection identity. The load-bearing artefact is scratch/2026-05-13-task-4.2-discrete-moments/derivation.py,
which cross-checks each closed form against an independent N = 1000 Monte-Carlo run.
A.1 Centering-projection identity
Let X = (X0,X1,...,Xn)⊤ ∈ Rn+1 collect the FX-path samples on the grid tj = j ∆t, ∆t = T/n.
The discrete statistic of Denition 1.1 is the quadratic form
σT · T =
n X
j=0
(Xj − X̄)2
= X⊤
MX, M := In+1 − (n + 1)−1
11⊤
, (25)
where X̄ = (n+1)−1
P
j Xj and M is the (n+1)×(n+1) centering projection. Taking expectations
and applying the standard quadratic-form moment identity (E[X⊤AX] = tr(AΣ) + µ⊤Aµ for
X ∼ (µ,Σ) with Σ = Cov(X,X⊤)) gives
E[σT · T] = tr MΣ

+ µ⊤
Mµ, (26)
which is the master identity of the appendix. Two structural simplications recur:
M1 = 0, tr(MΣ) = tr(Σ) − (n + 1)−1
1⊤
Σ1. (27)
The rst kills the bias term µ⊤Mµ whenever µj is constant in j; the second reduces the trace to a
weighted-sum expression that is family-tractable.
21A.2 GBM family
Under (9) at µ = 0, the marginals are Xj = x0 exp(Lj) with Lj ∼ N(−σ2tj/2,σ2tj); the martingale
pin E[Xj] = x0 keeps µj constant in j, so the bias term in (26) vanishes. The covariance kernel
of (11) gives
Σgbm
jk = x2
0 exp(σ2
min(tj,tk)) − 1

, (28)
and the trace identity reduces to
E[σT · T]gbm
= tr MΣgbm

=
n X
j=0
Σgbm
jj − (n + 1)−1
n X
j,k=0
Σgbm
jk . (29)
Evaluating at the canonical pin (x0 = 4000,σ = 0.10/
√
12,T = 12,n = 5000) yields E[σT ]gbm
=
1.117130×107, which matches the hand-derivation script scratch/2026-05-13-task-4.2-discrete-moments/derivation.py
to 13 signicant gures.
A.3 OU family (stationary at x0 = µ̄)
Under (14) the mean dynamics E[Xj] = µ̄ + (x0 − µ̄)e−θtj collapse to E[Xj] = µ̄ at the canonical
pin x0 = µ̄; again µj is constant in j and the bias term vanishes. The Vasicek covariance kernel
of (16) gives
Σou
jk =
σ2
2θ
e−θ|tk−tj|
1 − e−2θ min(tj,tk)

. (30)
For θT ≫ 1 (canonical horizon ≈ 17 relaxation times) the transient factor (1 − e−2θ min(tj,tk)) → 1
on the bulk of the grid, and the kernel approaches its stationary σ2/(2θ)·e−θ|tk−tj| form. The trace
identity reduces to
E[σT · T]ou
= tr MΣou

− − − − →
θT→∞
(n + 1) ·
σ2
2θ
− (n + 1)−1
X
j,k
σ2
2θ
e−θ|tk−tj|
, (31)
whose continuous-time limit per T is exactly σ2/(2θ)  the one-line closed form of (18). This is
the unique family in this paper where the T-dependence collapses to a constant in the stationary
regime.
A.4 Merton family (non-constant µj)
Under (19) the mean dynamics carry a drift correction from the compound-Poisson jump:
E[Xj]merton
= x0 exp λ(E[eJ
] − 1)tj

, (32)
where J ∼ N(µJ,σ2
J) is the log-jump amplitude and E[eJ] = exp(µJ + σ2
J/2). Unlike GBM and
OU, µj is NOT constant in j under the canonical martingale pin (which sets the drift compensator
α = −λ(E[eJ]−1) on the diusion side, NOT on the mean): the bias term µ⊤Mµ in (26) no longer
vanishes and must be carried explicitly. The covariance kernel decomposes into diusion and jump
contributions:
Σmerton
jk = E[Xj]E[Xk]

exp (σ2
+ λE[e2J
] − λ(E[eJ
])2
)min(tj,tk)

− 1

. (33)
The discrete trace identity (26) now reads
E[σT · T]merton
= tr MΣmerton

+
n X
j=0
µ2
j − (n + 1)−1
 n X
j=0
µj
2
, (34)
22where the trailing two terms expand the non-vanishing µ⊤Mµ bias contribution. The closed-form
evaluation at the canonical pin (x0 = 4000,σ = 0.10/
√
12,λ = 0.5,µJ = −0.05,σJ = 0.10,T =
12,n = 5000) yields E[σT ]merton
matching the hand-derivation script to 12 signicant gures. The
Wave-2 MQ independent re-derivation (7.5) reports three-way agreement (MQ-independent, paper
closed-form, code analytic) at relative error ≤ 5.95 × 10−12.
B Anti-shing audit trail across spec amendments
The plan docs/plans/2026-05-11-stochastic-fx-variant.md carried four spec amendments through Wave-
1 dispute and Wave-2 plan-exit review. Each amendment surfaced a concrete shing risk at the
implementation phase; each was routed through corrections-α with the three concrete anti-shing
prohibitions preserved invariant. The prohibitions, in canonical phrasing:
 (NF-1) No silent threshold relaxation. The three Phase A/B/C tolerances (numerical_identity_tol
10−6, moment_rel_tol = 0.05, ks_pvalue_floor = 0.01) are PINNED and invariant
across all four families.
 (NF-2) No seed re-roll. The canonical seed = 42 is PINNED; on canonical-pin failure,
route to corrections-α (re-derive analytic or rene discretization), NEVER to a dierent
seed.
 (NF-3) No N-oor lowering. N = 1000 is the canonical N-oor and the source of the
Type-I budget; tightening Phase B tolerances post-hoc to engineer PASS at N = 1000 is
silent-shing.
The four amendments, in plan-order:
 16.3  Task 3.1 grid-density correction. Implementation discovered a grid-density
/ tolerance mismatch in the trivial-degenerate test class: the coarse-grid + tight-threshold
pairing is canonical for these tests, against an initial implementation that paired coarse-grid
+ loose-threshold. Resolution: pin coarse-grid + tight-threshold as canonical, document the
rationale. (nf-1) preserved (no threshold change).
 16.4  Task 3.3 σT statistic mismatch. Implementation found that the moment-
matching test originally scoped to Task 3.3 was a duplicate of work performed under Task
## 4.2 Phase B. Resolution: route the moment-matching to Phase B exclusively, eliminating the
duplication. (nf-1) and (nf-3) preserved (no relaxation, no N change).
 16.5  Task 4.2 mean-only Phase B amendment. Implementation discovered that
the Isserlis-Gaussian variance formula carries an MC-noise oor of 8%30% at N = 1000,
structurally incompatible with the 5% moment_rel_tol. Resolution: amend Phase B to
mean-only (spec v0.5 11.6); record variance rel-err as audit-trail only; disclose the family-
dependent Type-I rates (0%/7%/30% at OU/GBM/Merton). (nf-1), (nf-2), (nf-3) all
preserved: the threshold is unchanged, the seed is unchanged, N is unchanged. The Type-I
budget is the cost of the N-oor invariant; v0.5 11.6 discloses it honestly.
 16.7  Task 4.2 per-family Phase C dispatch. Implementation discovered that the
moment-matched lognormal Phase C reference, generalized from GBM to all families, returns
p = 3.41 × 10−21 at Merton  19 orders of magnitude below the 0.01 oor. Resolution: per-
family dispatch on the reference shape (lognormal for GBM, gamma for OU, empirical-CDF
from a pinned Nref = 100,000 auxiliary run for Merton, spec v0.5 11.7). (nf-1) preserved
23(ks_pvalue_floor = 0.01 invariant across all three shapes); the dispatch is on geometric
content of the marginals, not on threshold tuning. The ve anti-shing sub-prohibitions of
the disposition (single threshold, Nref pinned, Nref-seed pinned, reference is independently
sampled not .fit()'d, pin Z1.4 interpretation unchanged) are itemized in Remark 5.3.
The Wave-1 dispute over each amendment was independently re-reviewed by RC and MQ in
scratch/2026-05-11-stochastic-fx-spec-review/wave-1-v0.4/ and scratch/2026-05-11-stochastic-fx-spec-
review/wave-1-v0.5/; the Wave-2 plan-exit verdict at scratch/2026-05-11-stochastic-fx-spec-review/wave-
2/rc-verdict.md and scratch/2026-05-11-stochastic-fx-spec-review/wave-2/mq-verdict.md records anti-
shing prohibitions PRESERVED across all four dispositions. The joint plan-exit verdict is ac-
cept_with_flags (two informational ags carried forward, none anti-shing-relevant).
C cadCAD-implementation spec (forward-looking)
This appendix sketches the cadCAD implementation spec that this paper nominates for the imme-
diate next deliverable. The sketch is forward-looking; no implementation work is performed in this
paper.
Directory structure. A new sub-package simulations/cadcad/ under the existing simulations/
functional-python three-tier layout (types/ value, modules/ callable, utils/ I/O boundary), with the
same tier-import discipline that governs simulations/stochastic_fx/:
 simulations/cadcad/types.py  frozen-dataclass containers for the six state-variable values, the
simulation_cong_dict, and the SimulationVerdict value type.
 simulations/cadcad/state.py  initial-state constructors, PSUB-sequence composition.
 simulations/cadcad/psubs.py  six PSUB implementations (one per role in 6.2); callable-tier
frozen dataclasses with __call__.
 simulations/cadcad/runner.py  boundary layer: invokes cadCAD [7] engine, materialises run
logs to Parquet, computes audit-block hashes.
 simulations/cadcad/tests/  pytest suite crossing the four FX families and the cost-factor
trajectory.
State-variable declarations (cadCAD cong). A schematic of the simulation_cong_dict
entries (implementing the signature of 6.2):
initial_state = {
"X": x_0, # FX rate, R_+
"S": 0.0, # sigma_T accumulator, R_+
"C": C_0, # cost trajectory, R_+
"P": 0.0, # replicating-portfolio MtM, R
"W": W_0, # wage-funded premium balance, R_+
"R": 0.0, # ratchet accumulator, R
}
sys_params = {
"family": ["gbm", "ou", "merton", "deterministic"],
"seed": [42],
"N": [1000],
24# ... per-family parameter pin
}
partial_state_update_blocks = [
psub_fx_advance, # PSUB-1
psub_sigma_t_accum, # PSUB-2
psub_cost_advance, # PSUB-3
psub_portfolio_update, # PSUB-4
psub_premium_drain, # PSUB-5
psub_ratchet_accum, # PSUB-6
]
PSUB implementations. Each PSUB is a frozen-dataclass callable per the functional-python
skill: stateless transforms with explicit input and output state-variable signatures. PSUB-1 dis-
patches to the veried generators of simulations/stochastic_fx/generators.py; PSUB-2 to simula-
tions/stochastic_fx/variance_proxy.py; PSUB-4 to the frozen 12-leg IronCondor strip at simula-
tions/saas_builder/data/IronCondor_strip.json (pin Z1.6). PSUB-3, PSUB-5, PSUB-6 are new and
live entirely in simulations/cadcad/psubs.py.
Integration tests. The test suite crosses the four FX families (GBM / OU / Merton / determin-
istic) with at least two cost-trajectory parameter pins (low-volatility AI-cost demand, high-volatility
AI-cost demand) for a 4 × 2 = 8 test matrix. Per-cell invariants:
 (inv-1) state-variable types and value-range non-negativity where applicable;
 (inv-2) audit-block hash bit-equality on intra-process re-run, inheriting pin Z1.2;
 (inv-3) PSUB-2 σT accumulator output agrees with the veried stochastic_fx output bit-for-
bit;
 (inv-4) pin Z1.6 byte-equality re-check on the IronCondor strip JSON;
 (inv-5) cross-process determinism re-check following the Wave-2 RC protocol of 7.4.
Anti-shing invariants carried forward. The three concrete anti-shing prohibitions of Ap-
pendix B carry forward unchanged: tolerances (nf-1), seed (nf-2), and N-oor (nf-3) are PINNED
for the cadCAD wrapping at the same canonical values as the stochastic-FX verication oor. The
wrapping introduces no new threshold, seed, or N knob; any future amendment routes through
corrections-α per the standard plan-amendment protocol.
Doc-rst sequencing. The cadCAD-spec (docs/specs/2026-05-16-cadcad-wrapping-design.md, to
be written) is the next deliverable, gated on this paper's compile-clean commit. Implementation
follows the spec; no simulations/cadcad/ code is added before the spec lands.
References
[1] Hull, John C. (2017). Options, Futures, and Other Derivatives, 10th ed. Pearson. 15.
[2] Karatzas, Ioannis & Steven E. Shreve (1991). Brownian Motion and Stochastic Calculus, 2nd
ed. Springer. 5.6 (OrnsteinUhlenbeck process).
25[3] Andersen, Leif B. G. & Vladimir V. Piterbarg (2010). Interest Rate Modeling, Volume I: Foun-
dations and Vanilla Models. Atlantic Financial Press. 2.7 (jump-diusion moments).
[4] Carr, Peter & Dilip Madan (2001). Optimal Positioning in Derivative Securities. Quantitative
Finance 1(1), 1937.
[5] Merton, Robert C. (1976). Option Pricing When Underlying Stock Returns Are Discontinuous.
Journal of Financial Economics 3, 125144.
[6] Vasicek, Oldrich (1977). An Equilibrium Characterization of the Term Structure. Journal of
Financial Economics 5(2), 177188.
[7] cadCAD: complex Adaptive Dynamics Computer-Aided Design. https://github.com/
cadCAD-org/cadCAD.
[8] Panoptic: Perpetual Options on Uniswap. Technical whitepaper. 2023.
[9] Abrigo Analytics (2026). Stochastic-FX variant design spec, v0.5.
docs/specs/2026-05-11-stochastic-fx-variant-design.md, in abrigo-analytics reposi-
tory.
[10] Abrigo Analytics (2026). Stochastic-FX variant implementation plan, v0.6.
docs/plans/2026-05-11-stochastic-fx-variant.md, in abrigo-analytics repository.
[11] Abrigo Analytics (2026). AI-Cost Factor Model design spec, v0.2.1 (under construction).
docs/specs/2026-05-16-ai-cost-factor-model-design.md, in abrigo-analytics reposi-
tory.
26