---
sha256: bbf891cbde2618857596937387d8851a6566b35c9ffd860090d7a83d9acbe37e
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 27712
---
Identification of the Subnet Demand Elasticity ηX/P
via Structural SMM on the CEV(1
2) Price Drift
cfmm-playground / btt-subnet-calibration
Phase 03.0 — 2026-06-21
Abstract
We identify the investor/staker demand elasticity ηX/P := dlogX(α)
/dlogPα of a Bittensor
dTAO subnet from on-chain price and flow data. The price of a subnet’s alpha token is governed
solely by its constant-product pool, so under a diffusion model for net staking flow it follows a
constant-elasticity-of-variance (CEV) process whose exponent β = w(d)
= 1
2 is the mechanical
pool weight, not a behavioral object (Maymin, 2026a). We pin β from the diffusion side with
Maymin’s return-variance price-elasticity test and leave ηX/P to the drift. The load-bearing step
is a TAO-denominated closure: the net flow into the pool is µF (P;η) = P I(α)
= BD P+AP1−η
,
so the CEV drift carries an η-specific price exponent P3/2−η
, separable from the base term P3/2
.
This makes ηX/P locally identified on a price-dispersed cross-section — by structural simulated
method of moments (SMM) on the drift (PRIMARY) — with the cross-subnet flow shift-share
IV demoted to a caveated, selection-corrected corroboration on the (endogenously selected)
capped subnets. Identification is stated as conditional on an explicit assumption list, never as
unqualified point identification.
## 1 Setup and Notation
We ground every symbol in the corrected BITTENSOR.md (Project (author’s model), 2026). Index
the digital-commodity subnets by i ∈ Dc = {1,...,N}. Subnet i runs a constant-weighted-product
pool with bonding curve
φ

η; X(α)
(i), Y (τ)
(i)

= X(α)
(i)η
Y (τ)
(i)1−η
, (1)
where X(α)(i) is the alpha holdings/stock and Y (τ)(i) the TAO reserve. The protocol fixes the
constant-product design, so the diffusion-side curve weight is w(d) = 1
2. The marginal (spot) price
is the price-impact identity of BITTENSOR.md,
Pαi + dPαi ≡
Y (τ)(i) + dY (τ)(i)
X(α)(i) + dX(α)(i)
, (2)
which under (1) with w(d) = 1
2 is the constant-product spot P = y/x. The object we estimate is
the behavioral demand elasticity of alpha holdings with respect to the subnet’s own price,
ηX/P [i] :=
dlogX(α)(i)
dlogPαi
(the DRIFT/demand side — the free structural parameter). (3)
1Remark 1 (The load-bearing 1
2 vs ηX/P distinction). The curve weight w(d) = 1
2 in (1) is the
mechanical constant-product exponent: it sets the diffusion/variance side of the price process (Sec-
tion 3), where it appears as the CEV exponent β = w(d) = 1
2. It is not the demand elasticity. The
demand elasticity ηX/P of (3) governs the drift. These two halves of the model are kept typograph-
ically and semantically distinct throughout: β = 1
2 (variance) versus ηX/P (drift). Confounding
them is the central error this account avoids. Notation exception (notation-clean): β here denotes
the CEV exponent, a structural parameter (Maymin’s usage), not the discount factor; this is a
literature-standard break, flagged once here.
The three flow objects (disambiguated once, carried consistently). The account turns
on keeping three distinct “flow” quantities apart:
F : cumulative net staking flow (TAO-denominated) that DRIVES the CEV; (4)
X(α)
(i) : alpha holdings / stock in subnet i;
I(α)
(i) := ∂tX(α)
(i) : the demand FLOW (rate of change of the stock).
We adopt the TAO-denominated closure F for the pool: the per-unit-time TAO value of the demand
flow is Pαi I(α)(i), the quantity that moves the constant-product reserve Y (τ)(i) and hence drives
the CEV diffusion of Section 3.
The corrected emission schedule. Per-block network emission is E = 1·2−⌊halvings⌋ TAO/block
(halved 1→0.5 in December 2025) (Project (verified ground truth), 2026a; Maymin, 2026b). The
per-subnet TAO emission is Ei = E si with the flow-based share
si =
zp
i P
j∈Dc
zp
j
, zi = max

EMA

Ḟ(τi)

− L, 0

, Ḟ(τi)
driven by I(α)
(i), (5)
with protocol defaults p = 1 (linear share) and lower clip L = 0, and an EMA half-life ∼ 1 month
(Project (verified ground truth), 2026a). The matching alpha inject is price-preserving,
dL(αi)
= dL(τi)
/pαi, holding Pαi fixed, (6)
where pαi is the V3 spot price = sqrt-price2. The reward emission dM
αi
is split w(s) : w(v) :
w(m) = 0.41:0.41:0.18 (staker:validator:miner, pinned constants), with the root proportion λi =
γ̄(τ)/(γ̄(τ)S(τ) + S(αi)) a protocol-given parameter we instantiate, not a knob of this calibration.
## 2 The Live Mechanism and the Pinned Pass-Through
We state the correction explicitly. The price-weighted split ∆τi = pi/
P
j pj (subtensor get shares price ema)
is dead code; the live share is the flow-based (5) (subtensor get shares flow, verified against
opentensor/subtensor@main and Maymin, 2026a) (Project (verified ground truth), 2026a,b). The
retired closed-form mechanical bump ∆pmech
i = pi(1/
P
j pj −ᾱi)/(αi +ᾱi) is likewise built on that
dead mechanism and is not used here.
Proposition 1 (Injection-path pass-through is zero, by V3 invariance). On an uncapped subnet
(tao ini/pαi ≤ alpha emissioni), the entire tao ini is matched by alpha ini = tao ini/pαi and
added as a V3 proportional liquidity position at the current sqrt-price. A proportional add scales
liquidity without moving AlphaSqrtPrice, so the mechanical emission→price pass-through is
∂Pαi
∂Ei inject, uncapped
= 0 (price-preserving by construction, not by cancellation). (7)
2Proposition 2 (The only mechanical price move: the capped excess-swap). The injection cap
is alpha ini = min(tao ini/pαi, alpha emissioni). When it binds (capped, high-price subnets,
tao ini/pαi > alpha emissioni), the leftover excess taoi = tao ini − pαi alpha emissioni > 0
is swapped for alpha against the pool. The mechanical price move is the slippage of that swap,
∆pmech
i = swap slippage(excess taoi; pool liquidity at pαi) > 0, CAPPED subnets only,
(8)
a deterministic function of pool state with no free coefficient. The emission→price coupling is
therefore exactly pinned: zero through the injection path (7), strictly positive only via (8). The
single free structural parameter is the demand elasticity ηX/P (the demand nuisances BD,A of
Section 4 aside).
## 3 The Price Process and the Variance-Elasticity Test
Let Ft be the cumulative net staking inflow of TAO (the numeraire), so dx = dF in the absence of
emissions, modeled as a diffusion (Maymin, 2026a, Thm 1)
dFt = µF dt + σF dWt, (9)
with σF a maintained constant (a control, not a tested object). Applying Itô’s lemma to the
constant-product price map gives the CEV identity (Maymin, 2026a, Thm 1, Cor 2):
dPαi = µ(Pαi)dt + δ P β
αi
dWt, β = w(d)
= 1
2, δ =
2σF
√
k
, (10)
with k = xy the constant-product invariant. The diffusion constant δ and the flow volatility are
the same σF . Writing the constant-product drift explicitly (Maymin, 2026a, Cor 2),
µ(P) =
2µF
√
k
√
P +
σ2
F
k
. (11)
The falsifiable test (pins β from the variance side). By Maymin (2026a, Prop 4) the
instantaneous return volatility is σret(P) = δ Pβ−1, so the level and the normalized (return) variance
scale with different exponents:
Var(dP) ∝ P2β
, Var(dP/P) = σ2
ret(P) ∝ P2β−2
. (12)
The return-variance object Var(dP/P) has price-elasticity 2(β−1). The test regresses the log con-
ditional return variance (controlling for pool depth k and flow volatility σ2
F ) on log price (Maymin,
2026a, Eq. 15–16):
log

c RV · k/σ̂2
F

= const + 2(β − 1) logP + error. (13)
The CEV identity predicts slope 2(β−1) = −1 at β = 1
2 (the GBM null is slope 0). Maymin (2026a)
report (92 of 128 subnets, up to 442 daily snapshots, Feb 2025–Apr 2026) a median slope −0.96
with interquartile range [−1.07,−0.88], every single subnet negative, and an implied β̂ ≈ 0.52 (their
Figure 4); the estimate is jump-robust (median −0.96 all observations vs −0.95 jumps removed;
paired difference −0.014, t = −1.61, p = 0.11, Wilcoxon p = 0.52, their Table 2). The Monte Carlo
(their Table 1) recovers slopes −0.961 (pure diffusion) to −0.953 (heavy jumps).
3Remark 2 (One-directional, overidentifying — not an iff). The implication runs one way: the
constant-product map plus a constant σF imply β = 1
2 (10). The test (13) therefore furnishes
an overidentifying restriction that pins β from the diffusion side; it is not an “if and only if”
characterization, and it does not test σF (a maintained control). With β thus pinned, the demand
elasticity ηX/P is left entirely to the drift µ(P).
## 4 The Econometric Problem
Between injections, investors swap alpha↔TAO along the pool curve, choosing the demand flow
I(α)(i) = ∂tX(α)(i) in response to price. We model this flow with an additive demand (the author’s
modeling choice, derived here, not inherited verbatim (Ma and Crapis, 2024)):
I(α)
(i) = BD,i + Ai P
−ηX/P
αi + εi, (14)
with BD,i ≥ 0 a price-inelastic base mass, Ai > 0 the price-elastic amplitude, and ηX/P the demand
elasticity (3). The crucial subtlety: the log-log slope of (14) is the attenuated local elasticity, not
−η,
dlogI(α)(i)
dlogPαi
= −η ·
AP−η
BD + AP−η
̸= −η (equals − η only as BD → 0). (15)
The estimator must invert this attenuation to recover the structural −η. Price is endogenous:
shocks to demand move price along the pool, so Cov(Pαi,εi) ̸= 0 and OLS (and naive IV using
own-flow lags) is biased — the demand-side prior attempt returned wrong-signed slopes on the
synthetic DGP (true η = 1.0/1.5/2.5 recovered as −4.18/−0.91/+2.15) (Project (taostats probes),
2026).
Remark 3 (Stationarity / nonlinear-cointegration pretest — a gate, not a caution). The flow
LHS I(α)(i) is plausibly I(0), but AP−η is a nonlinear function of a possibly-I(1) regressor logP
(daily subnet prices are near-unit-root and persistent (Project (taostats probes), 2026)). Estimation
(14)/(15) thus carries a nonlinear-cointegration / spurious-regression hazard. We gate it with a
three-part pretest: (i) a stationarity test on I(α) (ADF/KPSS); (ii) a balanced-order check that
the transformed regressor P−η and the LHS share integration order; (iii) — operationalizing the
gate on the object the SMM actually matches — a stationarity/balanced-order check run on the
primary curvature moment series itself, namely the drift-curvature statistic ∝ P3/2−η, which is a
nonlinear function of the possibly-I(1) logP and so carries the same spurious-regression hazard
at the moment level, not only in the level regression. The SMM of Section 5 sidesteps the level
regression by matching simulated-to-empirical moments, but the pretest still disciplines the moments
chosen (e.g. both the curvature moment and the drift autocorrelation must be computed on a balanced
series).
5 Primary Identification: Structural SMM on the CEV(1
2) Drift
This is the load-bearing step. Compose the demand (14) with the TAO-denominated closure (4)
and the CEV drift (11). The net TAO flow into the pool is
µF (P;η) = P I(α)
= BD P + AP 1−η
, (16)
so substituting µF into (11) gives the η-bearing drift
µ(P;η) =
2
√
k

BD P3/2
+ AP 3/2−η

+
σ2
F
k
, (17)
4where the intercept c := σ2
F /k is pinned, not free: both σF and k = xy come from the variance
side (10), so c is calibrated out of the SMM, not estimated.1 The free structural parameters are
therefore θ = (η,BD,A). The elasticity η enters only the drift, through the price exponent 3/2−η.
Its sensitivity is nonzero and carries a distinct functional signature:
∂µ
∂η
= −
2A
√
k
P 3/2−η
lnP ̸= 0 whenever A ̸= 0 and P ̸= 1. (18)
Proposition 3 (Separability / local non-degeneracy of η). Stack the drift gradient G = ∂µ/∂θ
across the price cross-section for the three free parameters θ = (η,BD,A) — the intercept c = σ2
F /k
being pinned (17), there is no free intercept column. The three columns are
G =
h
− 2A √
k
P3/2−η
lnP, 2 √
k
P3/2
, 2 √
k
P3/2−η
i
. (19)
They are linearly independent on a price-dispersed cross-section — so rank(G) = 3 and η is locally
identified — EXCEPT at the degeneracies η = 0 (where P3/2−η = P3/2 collapses the A-column onto
the BD-column) and A = 0 (where the η-column vanishes and η drops out). With c pinned, η = 3/2
is identified: the columns are then {lnP, P3/2, const}, which are independent — the earlier η = 3/2
degeneracy was a free-intercept (c) artifact (Project (read-only audit), 2026). The real degeneracy
set is thus {η = 0, A = 0}. The separating feature is the price-exponent 3/2 − η of the η-term
against the base term’s 3/2.
This is what makes the account an identification result, not a simulation. The audit (Project
(read-only audit), 2026) confirms rank(G) = 3 numerically on realistic BTT price cross-sections
(N = 90) under the pinned-c design: condition number ≈ 1.2 × 102 at η = 0.5 on a WIDE (two-
decade) support, degrading to ≈ 1.5 × 103 at η = 0.5 on a NARROW (single-day, 0.3-decade)
support; with c pinned the only rank-deficient point is η = 0 (cond ∼ 1017), and η = 3/2 is well
conditioned. (The conservative free-c variant, which adds an estimated intercept column, is worse-
conditioned — WIDE η = 0.5 cond ≈ 2.4×102 — and spuriously fails at η = 3/2; that failure is the
free-intercept artifact.) Identification is therefore weak as η → 0 (the P3/2−η curvature collapses
onto P3/2) and as the price support narrows; it is well conditioned only on the wide cross-subnet
support, not on a single day.
Amplitude weak-identification (a moment-informativeness caveat, not a weighting de-
tail). The η-gradient column (18) has magnitude ∝ A, so η is weakly identified jointly wherever
A is small or the price support is narrow — the moments themselves carry little η-information
there, and no weighting matrix W manufactures information the moments lack (Project (read-only
audit), 2026). This is a property of moment informativeness, stated as a conditional-identification
caveat alongside η ̸= 0, A ̸= 0, and the wide cross-subnet support — not a detail parked in the
weighting step.
The SMM estimator. Simulate the price-preserving CEV(1
2) process (10) with drift (17) and
the endogenous capping threshold (the excess-swap (8) fires when tao in/p > alpha emission),
and match simulated moments msim(θ) to empirical moments memp:
θ̂ = argmin
θ
msim
(θ) − memp
⊤
W msim
(θ) − memp

, θ = (η, BD, A). (20)
1
Itô check on the intercept coefficient (auditable, not merely cited (Maymin, 2026a, Cor 2)): from the constant-
product map P = y/x with invariant k = xy, the Itô correction 1
2
σ2
F ∂2
P/∂F2
on the flow diffusion (9) contributes
the drift constant σ2
F /k, so c inherits (σF ,k) from the diffusion side and carries no free coefficient.
5Table 1: SMM parameter–moment map. The free parameters are θ = (η,BD,A); the EMA/capping
parameters are protocol-calibrated constants, not estimated. The drift price-curvature (the P3/2−η
signature) is the PRIMARY η-mover. Order condition: the four identifying moments (drift curva-
ture, drift autocorrelation, net-flow/price comovement, capped-fraction) ≥ the three free params,
so the system is genuinely over-identified; the return-variance-elasticity moment is the separate
β-pin overidentifying check (it pins the variance side, not θ). The Jacobian ∂m/∂θ is full column
rank on a price-dispersed cross-section (Prop. 3, Project (read-only audit), 2026).
Free parameters (primary mover marked •)
Moment η BD A
return-variance elasticity (13) (β-pin check) — — —
drift price-curvature (P3/2−η term) • ◦ ◦
drift autocorrelation ◦ — ◦
net-flow / price comovement ◦ ◦ ◦
capped-fraction — ◦ ◦
The free parameters are exactly the three of (17): η, the price-inelastic base mass BD, and the
price-elastic amplitude A (the µF -level = BDP +AP1−η is (BD,A)). The EMA/capping-dynamics
parameters — the share exponent p = 1, the lower clip L = 0, the EMA half-life (≈ 216k blocks),
and alpha emission from the emission schedule — are protocol-calibrated constants instantiated
in the simulation, calibrated out of the SMM, not estimated. The weighting W (inverse moment
covariance) governs efficiency only; it does not cure the amplitude weak-identification above, which
is a moment-informativeness property. Crucially, the SMM targets the structural −η via the cur-
vature moment, inverting the attenuation (15).
Endogenous capping and the maintained assumptions. The capped/uncapped split is en-
dogenous selection: a subnet is capped because its price is high (the cap binds when tao in/p >
alpha emission). The SMM models the crossing law inside the simulation, conditional on:
Assumption 1 (Capping crossing law). The cap-binding indicator is generated by the correctly
specified crossing tao ini/pαi > alpha emissioni, with tao ini from the live flow share (5) and
the V3 spot price.
Assumption 2 (Disciplined uncapped counterfactual). On uncapped subnets the injection is ex-
actly price-preserving (7), so the simulated price path there is disciplined by the data drift (17) and
contributes the curvature moment without a mechanical-move confound.
Sensitivity check (required). Re-estimate (20) dropping the capped-fraction moment; report
whether η̂ moves materially. A stable η̂ corroborates that identification rests on the drift cur-
vature (18), not on the (selection-driven) capped-fraction. Identification of η is conditional on
Assumptions 1–2 and the non-degeneracy of Prop. 3.
## 6 Secondary / Corroboration: the Flow Shift-Share IV (Caveated,
Selection-Corrected)
The leave-i-out exclusive flow sum, over the global norm factor, is a genuine Bartik instrument
(Goldsmith-Pinkham et al., 2020) — subnet-j-specific flow exposures times common shifts, NOT
6a degenerate common scalar:
Zi =
X
j̸=i
zj
.
norm factor, zj = max EMA[Ḟ(τj)
] − L, 0

. (21)
It avoids the single-common-shock (halving) trap. Its first stage bites only on CAPPED subnets:
the price-preserving inject (7) gives no first stage on uncapped subnets, so the IV operates on a
selected subsample (capped because price is high).
Remark 4 (Selection threat — a bound or Heckman correction, not a bare caveat). Because
the subsample is selected on the outcome (price), a bare caveat is insufficient: the IV could dis-
agree with the SMM η̂ through selection, not through estimation error. A Heckman-type selection
correction (Heckman, 1979) needs a named selection-equation exclusion instrument — a determi-
nant of capping that is excluded from the price equation. The natural candidate is the subnet’s
alpha emission schedule (and, via the cap crossing tao in/p > alpha emission, the EMA-flow
level relative to that schedule): it shifts the probability of capping but does not enter the demand
drift (17) except through price. Absent a credibly excluded such instrument, the correction reduces
to a functional-form (inverse-Mills) bound: the selection bias is then point-bounded under the
joint-normal selection model rather than removed, and we report the bound, not a corrected point
estimate. The reduced-form cross-subnet co-movement ρ (measured idiosyncratic, ρ̄ = +0.011,
median|ρ| = 0.033, PCA-1 share 0.158; see Appendix A) is not the structural cross-elasticity.
Assumption 3 (Exclusion — to be tested at 3.3, not assumed). The instrument (21) is valid only if
cross-subnet substitution is negligible for the relevant clientele. Write the cross-subnet substitution
coefficient as ζ — the loading of other subnets’ (log) prices in subnet i’s own demand, i.e. a ζ logP−i
cross-term appended to (14) — so the requirement is ζ ≈ 0 (the cross-term in the λi channel of
BITTENSOR.md). We deliberately name it ζ, not β: in this account β ≡ 1
2 is the CEV exponent
alone (Rem. 1) and is never the substitution coefficient. Other subnets’ flows must not enter subnet
i’s own demand (14). This is the unresolved channel of INJECT-DERIVATION.md (lines 104–109)
(Project (verified ground truth), 2026b) and is an assumption to be tested at Phase 3.3, not a
property the instrument confers.
## 7 Conclusion
The demand elasticity ηX/P is identified by structural SMM on the CEV(1
2) price drift (PRIMARY),
through the TAO-denominated η →drift map (17) and its non-degeneracy (18)/Prop. 3; the me-
chanical exponent β = 1
2 is pinned from the diffusion side by the return-variance price-elasticity test
(13); and the cross-subnet flow shift-share IV (21) is a caveated, selection-corrected corroboration
on the endogenously selected capped subnets. Identification is conditional on the explicit list:
1. β = 1
2 and σF pinned from the variance side (Rem. 2); σF a control.
2. The capping crossing law correctly simulated (Assumptions 1–2), with the capped-fraction
sensitivity check passing.
3. The η →drift separability holding on a price-dispersed cross-section: η ̸= 0, A ̸= 0 (the
degeneracy set is {η = 0,A = 0}; with c = σ2
F /k pinned, η = 3/2 is identified), estimated
on the WIDE cross-subnet support, not a single day, and not where A is so small that η is
weakly identified regardless of weighting (Prop. 3, Project (read-only audit), 2026).
74. The IV exclusion ζ ≈ 0 (cross-subnet substitution negligible) tested at Phase 3.3 (Assump-
tion 3), with a selection correction for the capped subsample.
We never claim unqualified “point identification.” This account grounds the re-pointed Phase 3.1
SMM gate (recover a known η from simulated CEV(1
2) data) and Phase 3.3 (estimate η on the real
taostats daily cross-section).
A Reproducibility Appendix: taostats Queries
Every empirical number that informs the account traces to a logged, read-only query honoring the
taostats free-tier limits (≥ 8s spacing, limit≤ 200, blind exponential backoff on 429, non-default
User-Agent, key from a gitignored .env never printed) (Project (empirical, this key), 2026). The
monthly quota is unknown and treated as a hard risk (cache-once, gap-only, panel-grid Σpj).
Table 2: Logged taostats probes (read-only, 2026-06-21).
Probe / script Endpoint,
params
Date Measured
Return-variance
elasticity
measure return
variance
elasticity.py
dtao/pool/
{latest,history}/v1,
by day, limit=200
2026-06-21 Reproduction harness
for (13): pooled OLS
logVar(dlogP) on logP,
CEV target slope −1
(β = 1
2); reference
(Maymin, 2026a) median
−0.96, β̂ ≈ 0.52, ∼ 90
subnets. Quota-blocked at
live run; partial / harness
only.
Frequency realism
measure price var.py
dtao/pool/history/v1,
per-block &
by day, limit=200
2026-06-21 Per-block Var(logp) ≈
2.8 × 10−10/2.1 × 10−8
(sn104/sn84, flat); daily
0.055/0.376 (price range
×2.5/ × 10.6). Identifying
variation is daily (Project
(taostats probes), 2026).
Exclusion / co-
movement
measure exclusion.py
dtao/pool/{latest,history}/v1,
by day, 8 subnets,
200 days
2026-06-21 Mean pairwise corr
+0.011; median |ρ|0.033;
PCA-1 share 0.158
(1/K = 0.125). Idiosyn-
cratic ⇒ shift-share has
bite (Rem. 4).
Provenance note. The fully verified ground truth is the dTAO emission mechanism itself
(EMISSION-LAYER.md, INJECT-DERIVATION.md, line-level vs opentensor/subtensor@main); the
taostats numbers above are reproduction probes whose live runs are quota-constrained and are
tabled honestly as partial where blocked.
8References
Paul Goldsmith-Pinkham, Isaac Sorkin, and Henry Swift. Bartik instruments: What, when, why,
and how. American Economic Review, 110(8):2586–2624, 2020. Bartik = sum of exposure-
weighted common shifts; exogeneity from the exposure shares.
James J. Heckman. Sample selection bias as a specification error. Econometrica, 47(1):153–161,
1979. The selection correction invoked for the capped-subsample IV.
Julian Ma and Davide Crapis. The cost of permissionless liquidity provision in automated market
makers, 2024. Elastic vs inelastic liquidity demand; motivates the additive price-inelastic base
mass.
Philip Z. Maymin. Option pricing on automated market maker tokens, 2026a. PRIMARY. Journal
version titled “The Pricing of Options on AMM-Native Tokens: Theory and Evidence from
Bittensor”; arXiv 2603.29763 is canonical. Thm 1: AMM token price is CEV with exponent
equal to the numeraire weight. Cor 2 (constant product): CEV exponent one-half, volatility
two sigma over root-k. Prop 4: return volatility scales as price to the (exponent minus one).
Sec 6 return-variance elasticity test: regress log conditional return variance (depth- and flow-vol-
controlled) on log price; CEV slope minus one; median minus 0.96, IQR minus 1.07 to minus 0.88,
implied exponent 0.52, 92 of 128 subnets, 442 daily snapshots Feb 2025 to Apr 2026; jump-robust
paired diff minus 0.014, p 0.11, Wilcoxon 0.52.
Philip Z. Maymin. Common risk factors in decentralized ai subnets, 2026b. SECONDARY. Size
premium across subnets; the December 2025 emission halving (per-block rate 1 -¿ 0.5) as a rare
common shock. Cited for the halving / emission-level context, NOT for the CEV identity.
Project (author’s model). The dTAO subnet bonding-curve model (BITTENSOR.md). cfmm-
theory/cfmm-applications/BITTENSOR.md (corrected 2026-06-21 to the flow mechanism), 2026.
The bonding curve (alpha holdings to the eta times TAO reserve to the one-minus-eta) and the
target demand elasticity (d log holdings over d log price). Notation source.
Project (empirical, this key). Taostats api — free-tier constraints. experiments/btt-subnet-
calibration/docs/research/TAOSTATS-API-LIMITS.md, 2026. About 5-request burst then 429,
no Retry-After, at least 8s spacing, limit at most 200, blind backoff, unknown monthly quota.
Project (read-only audit). Identification audit — the η →drift map (structural-estimation
step 1). experiments/btt-subnet-calibration/docs/research/IDENTIFICATION-AUDIT.md,
2026. Pinned-c design (theta is eta, B-D, A; intercept c equals sigma-F squared over k, pinned
from the variance side): the three-column drift gradient has rank three, so eta is separably
identified except at the degeneracy set eta zero and A zero; with c pinned, eta three-halves is
IDENTIFIED (the prior three-halves degeneracy was a free-intercept artifact). Wide eta one-half
condition number about one hundred twenty; narrow about fifteen hundred; weak as eta tends
to zero or as the price support narrows; amplitude weak-id (eta-column magnitude proportional
to A) is a moment-informativeness fact no weighting cures.
Project (taostats probes). Frequency realism — why η is estimated daily, on a cross-section.
experiments/btt-subnet-calibration/docs/research/FREQUENCY-REALISM.md, 2026. Per-
block price is flat (variance order 1e-10 to 1e-8); daily price swings 2.5 to 10 times (variance
0.055 and 0.376), so the identifying variation is daily, on the cross-section.
9Project (verified ground truth). EMISSION-LAYER.md — the live flow-based dTAO emission,
faithfully. experiments/btt-subnet-calibration/docs/EMISSION-LAYER.md, 2026a. Verified vs
opentensor/subtensor@main: get shares flow (live) vs get shares price ema (dead); current price
as sqrt-price squared; adjust protocol liquidity (proportional add). Flow share is the clipped-
EMA share.
Project (verified ground truth). INJECT-DERIVATION.md — what the dTAO emission pins vs
leaves free. experiments/btt-subnet-calibration/docs/INJECT-DERIVATION.md, 2026b. Result
1 (price-preserving inject, V3 invariance, pass-through 0); Result 2 (excess-TAO swap on capped
subnets, the only mechanical move); the leave-i-out flow shift-share IV and the exclusion caveat
(lines 104-109).
10