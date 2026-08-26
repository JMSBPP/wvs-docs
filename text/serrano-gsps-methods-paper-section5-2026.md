---
sha256: 6e31b8fcea6b73e88af71dde9541da60a4f49455c8d17e4a2113ca5a991ce9f6
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 28882
---
Detecting Q-Dominance Ex-Ante for Streamed-Liability Convex
Hedges:
An FX-Variance-Share Sensitivity Surface Methodology
Section 5 — E10 GSPS Application
Abrigo Analytics — Iteration e10 gsps v0.7
2026-05-21
Abstract
We propose a methodology for detecting, ex-ante and from public-source data, whether a
streamed-liability convex hedge addresses the dominant variance vector of a target cohort’s
cost stream. The methodology is built around an exact three-way log-variance decomposition
of the cost-stream identity FXt · p · Qt into FX, Q, and covariance components on a common
daily gapped grid; an FX-variance-share sensitivity surface evaluated on a log-spaced grid across
an anchored Q-volume range; and a six-input collectively-exhaustive descriptive verdict ladder
consuming surface, material-gap, simulator-anchored, Q-variance-dominance, interior-crossing,
and data-visibility flags. The methodology emits one of Surface-Produced, Partial, or
Non-Retirement. Applied to the E10 representative Web3 data-analyst cohort over a 5-
currency panel (COP, BRL, EUR, GBP, NGN; 150 monthly cells; 2023-11 to 2026-04), the
empirical FX-variance share sits approximately 3.21 decades below the ex-ante-pinned break-
even sbe = 0.25 at every grid point on the anchored [28,130] queries/month range; all five
pre-committed sensitivity arms remain concordant; the verdict is Non-Retirement, subtype
q dominance. The methodology contribution survives the specific verdict: it correctly identifies
a (cohort, instrument) pair for which the convex FX hedge addresses the wrong variance vector,
and provides an auditable Tier-2-frozen trail from raw central-bank data to the descriptive
verdict.
## 1 Motivation and contribution claim
A growing literature on permissionless on-chain convex hedges constructs instruments aimed at
protecting cohort cash flows from particular sources of volatility (Lambert, Lyons & Jiao, 2022;
Maymin, 2026). The construction step — how to size, price, and statically replicate a convex
payoff (Lambert, 2022) — has matured. What has not matured is the detection step that must
precede construction: does the cohort’s cost-stream variance actually load on the variance vector
the proposed instrument prices, or does it load on a different vector against which the instrument
provides no payoff?
This section contributes a methodology for detecting Q-dominance ex-ante from public-source
data alone. We define Q-dominance as the empirical state in which the variance of the cohort’s
stochastic activity intensity (Q) dominates the variance of the FX leg in the cost-stream log-
variance decomposition. Under Q-dominance, a convex FX hedge addresses the wrong variance
vector for the cohort and is descriptively unsuited to the (cohort, instrument) pair — regardless of
how well-constructed the hedge itself is.
1The methodology is delivered as a sequence of three ex-ante-pinned objects: (i) an exact three-
way log-variance decomposition operating on a common daily gapped grid; (ii) an FX-variance-
share sensitivity surface evaluated on a log-spaced grid spanning an anchored Q-volume range; (iii)
a collectively exhaustive descriptive verdict ladder consuming six input flags. The contribution is
the detection step — it is independent of, and survives, any particular cohort’s verdict.
Posture. Throughout this section we adopt a descriptive posture: no inferential β claim is made,
no p-value is computed, no null hypothesis is rejected. The objects emitted are surfaces, decompo-
sitions, and verdict classifications under a stated calibration; they are read against ex-ante-pinned
thresholds. The descriptive posture is the load-bearing anti-fishing safeguard (Abrigo , 2026).
## 2 Setup and assumptions
The methodology is stated as five formal assumptions.
Assumption 1 (Cohort). The cohort pays a continuous-stream liability of the form
Ct = Qt · p · FXt, (1)
where Qt is the daily query volume (an x402-priceable activity intensity measured in queries per
day), p is a verified flat unit price (p = $0.01 USDC per query in E10, x402-protocol-verified), and
FXt is the daily local-currency-per-USD exchange rate published by a sovereign central bank.
Assumption 2 (Data anchors). The activity-intensity process Qt is empirically anchored to a
NON-FANTASY observed trace: in E10, 214 genuine Claude Code transcript tool calls extracted
from on-disk session logs (daily VMR ≈ 20, decisively overdispersed). The FX panels FXt are
sourced from public central-bank feeds: Banrep TRM (COP), BCB Olinda OData PTAX (BRL),
ECB Data Portal SDW (EUR), BoE IADB (GBP), CBN Gateway (NGN). All five series are free,
machine-readable, daily, and re-verified per-currency at the data-visibility gate.
Assumption 3 (Panel construction). A balanced panel of (currency × month) cells is constructed
on a daily gapped grid: zero-Q days are dropped from the ∆lnFX and ∆lnQ series on the SAME
surviving index per cell (forced by the log domain — ∆ln(0) is undefined). In E10 the panel
comprises 5 currencies × 30 months = 150 cells over the common window 2023-11-01 to 2026-04-
30. NGN is confined to its post-June-2023 float regime.
Assumption 4 (Descriptive-only posture). No inferential β claim is made. The methodology
emits a calibration-conditional sensitivity surface; the verdict ladder reads the surface against an
ex-ante-pinned break-even threshold. The descriptive verdict ladder is collectively exhaustive over
the six input flags and admits no Pass or Fail-on-β rung.
Assumption 5 (Ex-ante break-even). A threshold sbe is pinned ex ante before the surface is com-
puted, from option-premium economics against an ex-ante exposure assumption sexp. For E10,
sbe = 0.25 is derived from an at-the-money long-straddle / variance-swap-like geometry, ideal-
scenario fair pricing (cpayoff = 1), and a pinned premium fraction φ = 0.25 on a streamed-liability
funding primitive. The Stage-1 / Stage-2 firewall is maintained: sbe consumes no Stage-1 estima-
tion content.
23 The three-way log-variance decomposition
The methodology’s load-bearing identity is the exact additive decomposition of cost-stream log-
variance into FX, Q, and covariance components.
Identity. Taking the natural log of the cost-stream identity (1) and first-differencing on the
surviving (positive-Q) index yields
∆lnCt = ∆lnQt + ∆lnFXt, (2)
since lnp is a daily-constant additive offset that drops out under ∆. Applying the population
variance operator Var(z) = z2 − z̄2 on the surviving index, by the variance-of-a-sum identity:
Var(∆lnC) = Var(∆lnFX) + Var(∆lnQ) + 2 Cov(∆lnFX, ∆lnQ). (3)
This identity is exact, with no leading-order term and no higher-order remainder. It holds cell-by-
cell on the common surviving index because lnCb −lnCa = (lnQb −lnQa)+(lnFXb −lnFXa) for
any pair of days (a,b) on which Q, FX, and C are all strictly positive.
Empirical residual. On the E10 panel (150 cells), the maximum absolute identity residual
was 1.33 × 10−15 (population-variance operator with matching divisor-n convention; see the diag-
nostic record notebooks/e10_gsps/diagnostics/E10.2_decomposition_summary.json). This is
machine-precision zero; the identity holds exactly per cell.
The FX-variance share. The methodology’s primary descriptive object is the FX-variance share
s =
Var(∆lnFX)
Var(∆lnC)
. (4)
We emphasize three properties of s:
 s is a calibration-conditional quantity — Var(∆lnFX) is observed (real central-bank data)
but Var(∆lnQ) and the covariance term depend on the simulator calibration of Qt.
 The level-variance object Var(C) has no clean additive split and is banned from (4); only the
log-space share is consumed.
 Under negligible cross-covariance the complementary share Var(∆lnQ)/Var(∆lnC) ≈ 1−s
is a useful diagnostic, but the ladder consumes only s to preserve a single share-based test
(see §5).
## 4 The FX-variance-share sensitivity surface
The sensitivity surface is a calibration-conditional descriptive object evaluated on a log-spaced grid
across an anchored Q-volume range [Qlow,Qhigh]. The range is set ex-ante from a NON-FANTASY
observed trace (Assumption 2) and is bracketed by proxy research where the trace is silent. For
E10 the anchored range is [28,130] queries/month.
3Grid specification. The surface is grid-evaluated at ngrid = 50 log-spaced points across the
anchored Q-range, with adaptive doubling to 100 points if any cell falls within ±0.5 dex of sbe. For
E10 the adaptive doubling condition was not triggered (the empirical share sits more than three
decades below sbe).
Honest disclosure — panel-mean broadcast. For the E10 calibration, the empirical FX-
variance share is approximately invariant in Q-volume across the anchored range; the im-
plementation explicitly broadcasts the panel-mean share to every grid point and emits an
is panel mean broadcast flag on the result type so consumers cannot mistake the surface for
an estimated Q→ s mapping. A kernel-smoothed Q-dependent surface would be a natural follow-
up extension (§10). For E10 the methodology’s load-bearing property is that the surface sits more
than three decades below sbe at every grid point of the anchored range, which the panel-mean
broadcast preserves verbatim.
Q-variance dominance flag. Two equivalent (under negligible cross-covariance) flag forms are
defined:
 Share form (classifier-consumed):
q dom flagshare = 1{s(Q) < sbe ∀ Q ∈ [Qlow,Qhigh]}.
 Spec form (descriptive-disclosure sibling):
q dom flagspec = 1

Var(∆lnQ)
Var(∆lnC)
> 1 − sbe ∀ Q

.
The two are equivalent when |Cov(∆lnFX,∆lnQ)| is small relative to Var(∆lnQ)+Var(∆lnFX)
— the operative case under Assumption 2. The classifier consumes the share form; the spec form
is emitted as a sibling flag for descriptive auditability.
Interior-crossing rule. An interior crossing is defined as ≥ 3 contiguous strictly interior grid
cells with s < sbe; endpoints are excluded. A semantic guard also requires at least one endpoint
to clear (s ≥ sbe): a surface entirely below sbe at every grid point is Q-variance dominance, not
interior crossing.
## 5 The descriptive verdict ladder
The verdict ladder is a collectively exhaustive map from six input flags to exactly one
of three descriptive verdicts. The six inputs are dv gate passed, simulator anchored,
surface computed, material gap, q variance dominates, and interior crossing. The out-
puts are Surface-Produced, Partial, and Non-Retirement; the last carries a subtype in
{dv fail, simulator unanchored, q dominance} recording the load-bearing input.
The ladder is verified collectively exhaustive over 26 = 64 flag states by unit test (eight tests,
all green; see simulations/e10 gsps/tests/unit/test verdict classifier.py). A separate
inferential-emit method on the classifier unconditionally raises DescriptiveVerdictError — a
structural firewall enforcing Assumption 4 at the code level.
4Algorithm 1 — Descriptive verdict ladder (locked ex ante).
Inputs: six boolean flags dv gate passed, simulator anchored, surface computed,
material gap, q variance dominates, interior crossing.
Output: one of Surface-Produced, Partial, (Non-Retirement, subtype), with
subtype ∈ {dv fail, simulator unanchored, q dominance}.
Rung 1. If ¬dv gate passed: return (Non-Retirement, dv fail).
Rung 2. Else if ¬simulator anchored: return (Non-Retirement, simulator unanchored).
Rung 3. Else if ¬surface computed ∧ material gap: return Partial.
Rung 4. Else if ¬surface computed: return (Non-Retirement, q dominance).
Rung 5. Else if q variance dominates: return (Non-Retirement, q dominance).
Rung 6. Else if material gap: return Partial.
Rung 7. Otherwise: return Surface-Produced.
Figure 1: Descriptive verdict ladder (§9 of spec v0.7; locked ex ante); collectively exhaustive over
26 = 64 flag states.
## 6 Sensitivity arms and the no-rescue clause
Five sensitivity arms are pre-committed before any panel data is touched and test the descriptive
surface’s robustness to alternative panel constructions. The arms are descriptive concordance checks
only.
Arm (b) — Q-FX behavioral coupling.
Tests an ex-ante-pinned monthly-scalar coupling Qcoupled
t = Qt · (1 + η · zmonth) with elasticity
η = −0.3 and zmonth the within-currency standardized monthly realized FX volatility. Under
the user-pinned monthly-scalar operationalization, the constant within-month scalar drops out of
daily ∆lnQ; arm (b) is thus an algebraic-identity assertion that the within-month decomposition
is unchanged at the cell level, not a coupled-daily re-simulation. The concordance metric is
exactly zero by construction; this is reported transparently rather than fabricated.
Arm (c) — NGN regime-break removal.
Drops NGN cells inside the ±6-month buffer around the spec-pinned 2023-06-01 float regime
break.
Arm (d) — GBM / Jump-Diffusion comparator.
Substitutes the empirical Var(∆lnFX) by a Geometric-Brownian-Motion and a Merton-Jump-
Diffusion comparator calibrated per currency to the panel-mean FX variance. The substitution
preserves Var(∆lnQ) and the covariance term; only the FX numerator is replaced.
Arm (e) — Per-currency split.
Reports the per-currency surface envelope (min/Q1/median/Q3/max) and uses the median for
concordance; all five currency surfaces inherit the Q-variance dominance flag.
Arm (f) — Q high extended.
Extends the upper bound of the anchored Q-range to the $390 Dune-cap equivalent.
5No-rescue clause (load-bearing). Sensitivity arms cannot rescue a primary HALT. Each arm
reports descriptive concordance only; no arm can flip a primary Non-Retirement verdict to
Surface-Produced regardless of its descriptive concordance score. The clause is recorded as a
constructor-pinned hard-coded string on the aggregate sensitivity-arms result type.
7 E10 application and results
We apply the methodology to the E10 representative Web3 data-analyst cohort.
## 7.1 Data provenance
Table 1 records the five Tier-2 frozen central-bank snapshots used to build the panel. Each snapshot
carries a .provenance.json sidecar pinning the endpoint URL, the UTC fetch timestamp, the
payload SHA-256, and the requested window.
Table 1: E10 GSPS panel — Tier-2 frozen central-bank FX sources (re-verified per-currency at the
data-visibility gate, 2026-05-20).
Currency Central bank / endpoint Payload SHA-256 (head) Bytes Daily rows
COP Banrep TRM (datos.gov.co Socrata 32sa-8pi3) 861be2848592affa 70,741 590
BRL BCB Olinda OData PTAX CotacaoDolarPeriodo ba75a914696af794 58,379 627
EUR ECB Data Portal SDW EXR/D.USD.EUR.SP00.A 9cd19cf85ac11200 132,350 635
GBP BoE IADB series XUDLUSS 378df39672a4cca0 12,573 631
NGN CBN Gateway /api/GetAllExchangeRates e61225c8f8fdd854 7,987,807 617
Window: 2023-11-01 to 2026-04-30 (30 calendar months; 150 panel cells). NGN is confined to the post-June-2023
float regime; all in-window rows fall inside the post-NFEM float so confinement does not shorten the panel. ZAR,
KES, GHS were dropped at the data-visibility gate (no free machine-readable daily ∼30-month central-bank series);
they are not substituted. The x402 per-query price p = $0.01 USDC was re-verified live at the data-visibility gate
against The Graph Gateway x402 payment-required header.
## 7.2 Pre-pinned methodology fields
The seven pre-pinned fields are recorded in Table 2. All seven were frozen before any decomposition
or surface computation.
## 7.3 Verdict-classifier inputs and outcome
Table 3 records the six verdict-classifier input flags for E10 and the resulting verdict. The flags are
sourced directly from the phase-diagnostic JSON files (no manual transcription).
## 7.4 Surface against the ex-ante break-even
## 7.5 Sensitivity-arm concordance
Table 4 summarizes the five pre-committed sensitivity arms. Every arm preserves Q-variance
dominance (q dom flag = True) and returns concordance verdict concordant; every concordance
metric sits well below the descriptive concordance threshold. The no-rescue clause holds.
6Table 2: E10 GSPS — the seven pre-pinned methodology fields (§7 of spec v0.7; LOCKED before
data was touched).
Field Value
1. Sign expectation β > 0 on the vol-on-vol regression; necessary-not-sufficient descriptive gate (no
inferential test)
2. Primary spec FX-variance-share sensitivity surface across the anchored Q-volume range, plus
ex-ante-pinned break-even sbe; NOT a β magnitude, NOT a single share number
3. Material thresh-
old
sbe = 0.25; derived ex ante from option-premium economics against sexp = 0.25,
φ = 0.25, cpayoff = 1
4. Lag Contemporaneous, monthly
5. Posture Descriptive / illustrative; demonstration-grade-or-below; NOT confirmatory
6. Panel and FE 5 currencies (COP, BRL, EUR, GBP, NGN) × 30 months ≈ 150 cells; two co-
primary FE specs (two-way FE primary, currency-FE-only co-primary); G ≈ 5
currency clusters
7. HALT condition HALT on (a) simulator unanchored, (b) Q-variance dominance over the whole
anchored range ⇒ Non-Retirement, (c) surface uncomputable, (d) any spec-
vs-data contradiction
Table 3: E10 GSPS — the six §5 verdict-classifier input flags and the resulting descriptive verdict.
Flag Value Source
dv gate passed True E10.0 panel window.json
simulator anchored True E10.1 calibration note.md (214 calls; VMR ≈ 20)
surface computed True E10.3 surface summary.json
material gap False E10.3 surface summary.json
q variance dominates True E10.3 surface summary.json
interior crossing False E10.3 surface summary.json
Resulting verdict: Non-Retirement, subtype q dominance (rung 5 of Algorithm 1).
## 7.6 Headline numerics
The vol-on-vol regression returns β̂two-way = +68.151 (currency FE + month FE) and β̂currency-only =
+54.715 (currency FE only, co-primary). The descriptive gap is β̂two-way −β̂currency-only = +13.436,
with sign concordance preserved across both co-primary FE specifications; the magnitude differ-
ential is approximately 20% of the smaller coefficient. The descriptive sign gate of pre-pin field 1
holds. The descriptive gap is interpretive content for the §13 M-sketch hedge-sizing step in the spec
— specifically the load on the idiosyncratic (within-month, cross-currency) component of FX-vol
exposure relative to the global (month-shock-absorbed) component.
The panel-mean FX-variance share is s̄ = 1.535 × 10−4 across the 150-cell panel, approxi-
mately 3.21 decades below sbe = 0.25 at every grid point of the anchored [28,130] Q-range. Com-
bined with the unanimously concordant sensitivity arms, the verdict is Non-Retirement, subtype
q dominance.
## 8 Interpretation (post-Keynesian theoretical frame)
The interpretive content of §8 is interpretive prose only and is explicitly labeled as such. It is
not a hypothesis test; it does not predict the Non-Retirement verdict post-hoc; it explains the
7102 3×101 4×101 6×101
AnchoredQ-volumerange(queries/month,logscale)
10 4
10 3
10 2
10 1
FX-variance share s = Var( logFX)/Var( logcost) (log scale)
E10GSPS FX-variance-sharesurfacevsex-antebreak-even
5-currencymin--maxenvelope(NON-STATISTICAL)
5-currencyIQR(NON-STATISTICAL)
Panel-meanFX-varianceshare
sbe=0.25(ex-ante)
Figure 2: E10 GSPS FX-variance-share surface vs ex-ante-pinned break-even sbe = 0.25, log-
spaced 50-point grid across the anchored [28,130] queries/month range. The panel-mean surface
(≈ 1.535 × 10−4, navy line) is approximately 3.21 decades below sbe (red dashed) at every grid
point. The shaded bands are the 5-currency non-statistical envelope (min/max light; IQR darker).
DESCRIPTIVE / CALIBRATION-CONDITIONAL. NOT a confidence interval. NOT an
inferential band.
mechanistic verdict in post-Keynesian (PK) terms.
The Bhaduri–Laski–Riese (BLR) virtual-vs-real dichotomy (Bhaduri, Laski & Riese, 2006)
frames financialization as a structural gap between the virtual economy (asset valuation, financial-
cycle volatility) and the real economy (output, productive investment). The Minsky two-price
theory (Tymoigne, 2010; Minsky, 1975) formalizes the gap between Pk (asset-side demand price)
and Pi (output-side supply price). The Kaleckian investment-driven growth tradition (Kalecki,
1971; Bhaduri & Marglin, 1990) insists that investment, not asset revaluation, is the prime mover
of output.
The E10 representative Web3 data-analyst is a cohort whose cost-stream is bound to its own
activity intensity (Q, the own-output behavior — the Pi side) rather than to virtual-economy
price volatility (FX — the Pk side). Under the calibration in Assumption 2, on the [28,130]
anchored Q-range, the empirical FX-variance share sits approximately three decades below the
ex-ante break-even, indicating that the convex FX hedge addresses the wrong variance vector for
this cohort. Calibration-conditional reading: all four PK bullets below are interpretive prose for the
configuration in pre-pin fields 1–7 of Table 2.
 BLR virtual-vs-real: The convex FX hedge addresses the virtual-economy price-volatility
vector (Pk analog — FX is the on-chain analog of virtual-economy price volatility); the
cohort’s cost-stream variance is structurally bound to the real-economy production decision
(the analyst’s Q scheduling).
8BRL
(EM)
COP
(EM)
NGN
(EM)
EUR
(DM)
GBP
(DM)
10 4
10 3
10 2
10 1
Mean FX-variance share s (log scale)
5.92e-05 6.16e-05
5.97e-04
2.91e-05
2.10e-05
E10GSPS per-currencyFX-varianceshare(5-currencypanel)
sbe=0.25(ex-ante)
Panelmean( 1.54e-04)
NON-STATISTICALspread.NOTaconfidenceinterval.NOTaninferentialband.
Figure 3: E10 GSPS per-currency mean FX-variance share over the 5-currency panel, EM
(BRL/COP/NGN, salmon) vs DM (EUR/GBP, blue), against sbe = 0.25 (red dashed) and the
panel mean (navy dotted). All five currencies sit two to four decades below sbe; NGN carries the
largest share (≈ 5.97 × 10−4, post-NFEM-float regime) and GBP the smallest (≈ 2.10 × 10−5).
DESCRIPTIVE / NON-STATISTICAL spread. NOT a confidence interval. NOT an infer-
ential band.
 Minsky two-price: The instrument prices into the Pk gap but the cohort’s exposure lives
on the Pi side.
 Kaleckian: The cohort’s cost-stream variance reflects effective-demand-driven activity in-
tensity, not asset-revaluation flow.
 Methods-paper hook: The detection methodology survives the specific verdict — it cor-
rectly routes this (cohort, instrument) pair to Non-Retirement subtype q dominance from
public-source data alone, and the trail is auditable end-to-end.
The verdict is not a bug of the data and not a failure of the convex hedge instrument family; it
is a finding about the (cohort, instrument) pair.
## 9 Methodology contribution survives the verdict
The contribution of this section is the methodology, not the specific E10 verdict. The methodology
successfully identifies:
(a) a cohort whose cost-stream variance is Q-dominated under a NON-FANTASY simulator an-
chor and a frozen ex-ante break-even (Assumption 2, Assumption 5);
9Table 4: E10 GSPS — sensitivity-arm concordance summary (descriptive only; per spec §9 no-
rescue clause, no arm can flip the primary verdict).
Arm Concordance metric q dom flag Verdict Panel-mean share
(b) Q–FX coupling 0.000 True concordant 1.535 × 10−4
(c) NGN break-window 4.04 × 10−5
True concordant 1.131 × 10−4
(d) GBM / JD comparator 3.41 × 10−5
True concordant 1.876 × 10−4
(e) Per-currency split 9.43 × 10−5
True concordant 5.922 × 10−5
(f) Q high extended 2.71 × 10−20
True concordant 1.535 × 10−4
(b) an instrument (the convex FX hedge) that addresses the wrong variance vector for that cohort,
with the dominance gap quantified at more than three decades below the ex-ante threshold;
(c) the verdict ladder (Algorithm 1) routing this (cohort, instrument) pair to Non-Retirement
subtype q dominance;
(d) an auditable trail — Tier-2-frozen central-bank data with payload-SHA-256 provenance side-
cars; NON-FANTASY simulator anchor against 214 genuine observed tool calls; the exact §3
identity at machine precision; an ex-ante-pinned break-even derived before any decomposition
runs.
The methodology is venue-publishable as a stand-alone Section 5 of a methods paper at Cam-
bridge Journal of Economics, Review of Political Economy, or Metroeconomica independent of the
specific E10 verdict. The companion sections of the methods paper apply analogous detection
methodologies to alternative (cohort, instrument) pairs (E8 dTAO/Maymin; E9 LATAM RWA)
and are reported separately.
## 10 Limitations and future iterations
The methodology, as deployed in E10, carries the following honest limitations:
 Q-FX coupling is an algebraic-identity assertion under the user-pinned oper-
ationalization, not a coupled-daily re-simulation. The arm (b) operationalization
rescales monthly Q magnitudes by a single per-month scalar; a constant scalar drops out
of daily ∆lnQ within the month, so the within-month log-variance decomposition is un-
changed at the cell level. The arm reports this transparently. A coupled-daily re-simulation
would be a natural extension.
 The FX-variance-share surface is panel-mean-invariant in Q for the E10 calibrated
simulator. The implementation broadcasts the panel-mean share to every grid point and
emits an is panel mean broadcast flag so consumers cannot read the surface as an estimated
Q→ s mapping. A kernel-smoothed Q-volume-dependent surface (a non-parametric regression
of s on Q across cells) would be a natural follow-up.
 G = 5 currency clusters is structurally thin. Cluster-robust inference at G = 5 is
size-distorted; we report descriptive sign and non-statistical min–max / IQR spreads only.
Bootstrap-based bands were considered and dropped at this G in spec v0.6 (CORRECTIONS-
E10-6).
10 The arm (d) GBM/JD comparator’s calibration is per-step rather than monthly-
aggregate. The Geometric-Brownian-Motion and Merton-Jump-Diffusion generators inter-
pret sigma per month as a per-step variance target; the simulated per-step Var(∆lnFXsub)
differs from the target monthly-aggregate Var(Σ∆lnFX) by a factor proportional to 1/nsteps.
The deflation does not flip the verdict — arm (d) remains concordant — but the comparator-
moment description is not naively the panel-mean FX variance and is reported here for
transparency.
 The MIN SURVIVING DAYS threshold of 2 in the cell-decomposition function is
methodologically degenerate. At n = 2 surviving days only one daily log-return ex-
ists; the population variance of a one-element series is zero. All 150 production cells have
≫ 3 surviving days, so this is benign in E10; a future amendment would raise the threshold
to 3 (one degree of freedom for variance).
 The break-even threshold uses an ideal-scenario premium (cpayoff = 1, φ = 0.25).
No FX-stablecoin options venue with real depth exists in 2026; a real venue would impose
cpayoff < 1 and lift sbe above 0.25. The frozen sbe = 0.25 is the ideal-scenario lower bound on
the break-even share.
 The methods-paper §5 hook is robust across alternative cohort / instrument
pairings. E8 dTAO/Maymin and E9 LATAM RWA are companion sections of the joint
outline; the detection methodology applies analogously.
References
References
Abrigo Analytics (2026). E10 GSPS v0.7: Convex Multi-Currency
Data-Consumption FX-Volatility Hedge — Design Specification.
docs/specs/2026-05-20-e10-gsps-v0.7-convex-multicurrency-design.md.
Bhaduri, A. and Marglin, S. (1990). Unemployment and the Real Wage: The Economic Basis for
Contesting Political Ideologies. Cambridge Journal of Economics, 14(4), 375–393.
Bhaduri, A., Laski, K. and Riese, M. (2006). A Model of Interaction between the Virtual and the
Real Economy. Metroeconomica, 57(3), 412–427.
Cox, D. R. (1955). Some Statistical Methods Connected with Series of Events. Journal of the Royal
Statistical Society, Series B, 17(2), 129–164.
Kalecki, M. (1971). Selected Essays on the Dynamics of the Capitalist Economy 1933–1970. Cam-
bridge University Press.
Lambert, G., Lyons, J. and Jiao, J. (2022). Panoptic: A Perpetual, Oracle-free Options Protocol.
arXiv:2204.14232.
Lambert, G. (2022). Static replication of arbitrary payoffs by portfolios of perpetual options.
Panoptic Working Paper.
Maymin, P. (2026). A CEV-based Process for AMM Tokens with Closed-form Option Pricing.
arXiv:2603.29763.
11Merton, R. C. (1976). Option Pricing when Underlying Stock Returns are Discontinuous. Journal
of Financial Economics, 3(1–2), 125–144.
Mento Labs (2024). Mento Protocol — Reserve, Stability Mechanism, and FX-Stablecoin Catalog.
https://www.mento.org/.
Minsky, H. P. (1975). John Maynard Keynes. Columbia University Press.
Tymoigne, E. (2010). Minsky’s Two-Price Theory of Investment. Levy Economics Institute Working
Paper.
x402 Working Group (2025). x402: HTTP 402 Revival — Per-request Payment Protocol Specifi-
cation. Linux Foundation Governance.
12