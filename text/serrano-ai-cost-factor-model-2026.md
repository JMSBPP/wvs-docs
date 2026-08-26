---
sha256: b66246a0afc4e099aa5bbfa65cf823a570fd2532a5bd308fce3a90a4c19aa7ff
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 15947
---
AI-Cost Factor Model — Counterfactual Risk Quantification
(Subscription-Aware Pilot, v0.2.10)
Demonstration-Grade Pilot Iteration Closure
Abrigo Analytics — Iteration dev ai cost v2
2026-05-18
Abstract
We report the closure of the dev ai cost v2 iteration under spec v0.2.10 (post audit-
econ Delphi). On a single-user Claude Code JSONL panel covering 2026-01-06 to 2026-05-
14 (N = 28 weekday rows after first-differencing), the FX-vol contribution to AI-cost vari-
ance is empirically approximately zero: under the conservative covariance-attribution rule of
Politis and Romano (1994), the FX share of Var(∆lnNotionalCostCOP
) point-estimates to
0.0000277 with a 90% stationary-bootstrap confidence interval of [−3.4×10−6
, +4.1×10−5
].
The pre-registered behavioral subscription-inelasticity test (R4-S3-USD), an HAC-OLS regres-
sion of |∆lnNotionalCostUSD
| on lagged |∆lnUSDCOP| and |∆lnTokens| with Newey and
West (1987) bandwidth L = ⌊T1/3
⌋ = 3, is POWER-HALTED under the canonical lagged-
tokens partialling recipe: measured power at MDES = 0.40 residual-SD is 0.1745, below the
demonstration-grade floor of 0.50 (Nmin = 38, POWER MIN = 0.50 — below project defaults
N = 75 / 0.80). The iteration is paused pending an N ≥ 75 panel and makes no population-level
transmission claim. We recommend the framework owner pivot to (i) data accumulation, (ii)
the R6 continuous-stream sibling iteration, or (iii) a target population where the FX channel is
ex-ante stronger.
## 1 Introduction
The Abrigo project’s operating framework studies permissionless on-chain convex hedges aimed at
the Latin American wage-earner-to-capital transition. Each iteration is a (Y,M,X) triple in which
Y is an outcome surfacing the target population’s exposure, M is a Panoptic-eligible position
settling the empirical risk, and X is the major risk currently blocking the transition. The present
iteration is a candidate-X identification step: does FX volatility (USDCOP) materially drive AI-
cost burden risk for LATAM developers? The R5 PRIMARY arm answers a descriptive risk-
decomposition question (FX share of cost-burden variance); the R4-S3-USD AUXILIARY arm
answers a behavioral question (does USD-side cost vol respond to FX vol despite zero marginal
cost under a subscription regime).
Subscription-aware proxy. The pilot subject (the repo maintainer) is on a Claude Pro/Max
subscription. Their realized USD cost is approximately flat per month and FX exposure collapses
to a single billing-day point. Their notional cost path — rate-card price × token usage per the
LiteLLM SHA-pinned rate table (LiteLLM, 2025) — serves as a fair proxy for what a non-subscribed
pay-per-API LATAM developer would have paid. This is a strong assumption (equivalent demand
under both billing regimes) and is documented as a Section 6 threat.
1v0.2.10 audit-closure context. The v0.2.9 verdict (PARTIAL-FAIL TO REJECT under a con-
temporaneous power-recipe pin) was withdrawn following an audit-econ Delphi (2026-05-18). Four
critical / high-severity amendments enter v0.2.10: (#4) Z-arms relabeled as same-ratio corrobo-
rations of R5 rather than independent measurements; (#5) demonstration-grade vs. verdict-grade
scope split with mandatory headline disclosure; (#6/#7) R4-S3-COP’s REGIME-CONDITIONAL
FAIL removed from the corroboration list as uninformative; (#8) the canonical power-calculation
recipe reverted to lagged-tokens partialling, matching the regression’s own k = 1 lag structure.
Under the lagged recipe, the power gate fires and routes R4-S3-USD to POWER-HALT.
## 2 Data
The panel is constructed from local Claude Code JSONL session logs on the pilot subject’s machine.
Costs are computed as rate-card × token-counter usage across the five preserved token categories
(input, output, cache-creation-ephemeral-5m, cache-creation-ephemeral-1h, cache-read) using the
LiteLLM rate table pinned by both commit SHA and file SHA-256 (dual-pin enforcement, audit-
econ closure #3). USDCOP is the Banrep daily TRM. The build window observed is 2026-01-06
to 2026-05-14.
Counters and parity. Per audit-econ closures #1, #9, and #10, the row-drop bookkeeping is
split into named counters (Codex-commingling filter at parse, non-Anthropic-model upstream filter,
holiday-Monday weekday-mask surfacing). ccusage cost-parity on the build window is 0.9994×
on raw cost totals; the combined-window aggregate ratio of 0.5386× reflects the audit-disclosed
treatment of historical Codex commingling outside the build window and is documented separately
in DATA PROVENANCE.md.
Demonstration-grade pin. The project-level anti-fishing invariants pin Nmin = 75, POWER MIN =
0.80, MDES SD = 0.40. v0.2.0 CORRECTIONS-G + CORRECTIONS-J relaxed the first two
to 38 and 0.50 without a Pair-D–style preserved-power proof. v0.2.10 Amendment #5 formalizes
this as a separate demonstration-grade surface: relaxed floors are permitted, but every consumer
(verdict memo, this write-up, downstream M-design hand-off) must disclose the relaxation in the
headline. The present iteration is demonstration-grade with N = 28 observed (sub-floor relative to
the demonstration-grade Nmin = 38). No verdict-grade claim is made.
## 3 Methodology
3.1 R5 PRIMARY: descriptive counterfactual risk quantification
The realized COP-denominated cost-burden return is the log first-difference of NotionalCostCOP
t =
NotionalCostUSD
t · USDCOPt. Under Politis and Romano (1994) stationary bootstrap with ex-
pected block length ⌈T1/3⌉ and B = 10,000 replicates, we report the variance decomposition with
conservative covariance attribution (CORRECTIONS-Q):
Var(∆lnNotionalCostCOP
) = Var(∆lnNotionalCostUSD
) + Var(∆lnUSDCOP) + 2 Cov(∆lnNotionalCostUSD
(1)
The headline FX share is Var(∆lnUSDCOP)/Var(∆lnNotionalCostCOP
) excluding the covari-
ance term, which is reported separately as a diagnostic with its own bootstrap CI. The covariance-
exclusion rule is conservative for the M-design gate: positive covariance under alternative attribu-
tion schemes would inflate the apparent FX share.
2R5 verdict logic. None. R5 is descriptive — it produces a number with bootstrap CI consumed
by the M-design step. The only pre-pinned quality threshold is the CI half-width on the FX share
≤ 0.15, an M-design usability gate (CORRECTIONS-T), not a verdict gate.
3.2 R4-S3-USD AUXILIARY: behavioral subscription-inelasticity
The R4-S3-USD specification is
|∆lnNotionalCostUSD
t | = αUSD
0 + αUSD
1 |∆lnUSDCOPt−k| + αUSD
2 |∆lnTokenst−k| + uUSD
t ,
(2)
with k = 1 primary and k = 5 sensitivity. The pre-pinned null is αUSD
1 = 0 under a two-sided test
(CORRECTIONS-S): under the subscription regime, marginal USD cost is zero, so the behavioral
channel should produce no response in either direction; rejection either way is the informative
finding. HAC standard errors follow Newey and West (1987) with the Andrews (1991, Andrews)-
style data-dependent bandwidth L = ⌊T
1/3
lag ⌋, automated per Newey and West (1994).
Power-HALT checkpoint. Power is Monte-Carlo’d at MDES = 0.40 residual-SD on the post-
control residual variance of |∆lnNotionalCostUSD
| after partialling |∆lnTokens|. Per CORRECTIONS-
U the power-HALT was expected to fire at T = 38. The canonical partialling-regressor recipe is
lagged tokens (matching the regression’s own k = 1 lag structure), per v0.2.10 Amendment #8; the
contemporaneous-tokens recipe is reported for transparency but does not gate the verdict.
3.3 Z-arms sensitivity (diagnostic only)
Z-1 aggregates the same variance ratio at weekly (Z-1a) and monthly (Z-1b) horizons. Z-2-main
back-casts the observed ∆lnNotionalCostUSD
distribution onto the 2024–2025 daily TRM via
stationary bootstrap (Bpaths = 1,000); Z-2-null repeats the loop with the 2026-Q1-Q2 TRM only
for null calibration; Z-2-W conditionally activates a Winsorized robustness sub-arm if observed
excess kurtosis exceeds 3.0. Z-3 is the escalation gate (OR over relative-5×-baseline and absolute-
0.05 thresholds, with null-calibration suppression). Per v0.2.10 Amendment #4, all Z-arms
decompose the same algebraic variance ratio across different horizons / TRM windows
and are same-ratio corroborations of R5, not independent measurements.
## 4 Results
4.1 R5 PRIMARY
The headline FX share over the daily 2026-Q1-Q2 window (T = 29 daily rows, N = 28 post-first-
diff) is reported in Table 1. The FX share’s stationary-bootstrap CI half-width is 2.2×10−5, three
orders of magnitude inside the 0.15 M-design usability threshold. The covariance term is small,
negative (−0.002924), and its CI crosses zero — consistent with a weak natural-hedge effect within
the developer’s behavior, but not significant.
4.2 R4-S3-USD: POWER-HALT
The R4-S3-USD primary regression at k = 1 yields α̂USD
1 = −18.116, HAC SE = 40.221, t =
−0.450, two-sided p = 0.6524, with HAC bandwidth L = ⌊281/3⌋ = 3. These coefficients
are reported for the record only; they do not adjudicate the null. Under the canoni-
cal lagged-tokens partialling recipe, the measured power at MDES = 0.40 residual-SD is 0.1745,
3Table 1: R5 PRIMARY variance decomposition — conservative attribution (CORRECTIONS-
Q). 90% stationary-bootstrap CI, Politis and Romano (1994), B = 10,000, expected block length
⌈T1/3⌉ = 4.
Component Point estimate 90% CI lower 90% CI upper
FX share (excl. cov) 0.0000277 −3.4 × 10−6 +4.1 × 10−5
Usage share (excl. cov) 1.001078 0.998897 1.003730
2 × Cov (diagnostic) −0.002924 −0.008650 +0.002815
σ̂∆lnNotionalCostCOP 1.659 1.216 2.125
below the demonstration-grade floor of 0.50. The contemporaneous-tokens recipe (diagnostic
only) yields 0.7115. The verdict label is POWER-HALT; PARTIAL-REJECT and PARTIAL-
FAIL TO REJECT are not applicable because the power gate fires before the N-floor gate. Table 2
summarizes.
Table 2: R4-S3-USD HAC-OLS results (k = 1 primary, k = 5 sensitivity) and power gate. Reported
coefficients are for-the-record only; the verdict is POWER-HALT.
k = 1 (primary) k = 5 (sensitivity)
α̂USD
1 −18.116 −35.750
HAC SE 40.221 —
t-statistic −0.450 —
Two-sided p 0.6524 —
HAC bandwidth L 3 2
Residual SD (lagged partialling) 1.156
MDES effect 0.40 × σe 0.462
Power (lagged, canonical) 0.1745 (gate: FAIL)
Power (contemporaneous, diagnostic) 0.7115 (gate: pass)
Verdict POWER-HALT
4.3 Z-arms (diagnostic, same-ratio)
Table 3 reports the same-ratio Z-arms. The Z-3 verdict is NOT ESCALATE: no Z-arm trips the OR-rule
(≥ 5× baseline or ≥ 0.05 absolute). Per v0.2.10 Amendment #4, these arms are not independent
measurements and are not counted as corroborating evidence for the headline R5 finding.
## 5 Discussion
Regime-conditional reading. For this user × this 2026-Q1-Q2 window, individual cost-burden
volatility is dominated by token-burst usage variance, not by FX moves. The usage-share point
estimate of 1.001 (with its CI tightly around 1.0) and the FX-share point of 2.77×10−5 (CI containing
zero on the lower end) together imply that the cost panel’s variance, on this window, is algebraically
explained by USD-side variance with a small negative covariance adjustment. The reading is
descriptive, regime-conditional, and bounded to the n=1 proxy subject.
4Table 3: Z-arms (same-ratio corroborations of R5; diagnostic-only).
Arm FX share Notes
Daily baseline (R5) 0.0000277 primary
Z-1a weekly 0.000073 Tw ≈ 9
Z-1b monthly 0.000099 Tm = 4, TAGGED uninformative
Z-2-main backcast median near baseline 2024–2025 TRM, Bpaths = 1,000
Z-2-W (Winsorized) conditional activates iff excess kurtosis > 3.0
Z-3 verdict NOT ESCALATE
What R5 does and does not say. R5 is Role A (individual-sizing) per CORRECTIONS-R.
The implication for the M-design step is that an individual hedge for this user, at this notional
burn rate, should be dominated by token-volume risk exposure rather than FX exposure. This is
not a population-level channel-existence claim. Channel existence under the framework requires
the R4-S3-USD behavioral test, which here POWER-HALTs.
Why R4-S3-USD cannot be adjudicated. The behavioral channel asks whether a subscrip-
tion user nevertheless shifts token consumption in response to FX volatility (e.g., defensively re-
ducing usage when COP weakens, despite the flat USD invoice). At N = 28 and HAC-corrected
SE of 40.2 on α̂USD
1 , the regression cannot distinguish meaningful behavioral response from noise.
The high p = 0.6524 is uninformative once the power gate has failed: with B = 2,000 simulated
draws at MDES 0.40σe, only 17% of draws reject under the lagged canonical recipe. The honest
reading is ”insufficient data,” not ”no effect.”
Why Z-arms cannot rescue R4-S3-USD. Z-arms re-decompose the same R5 ratio across
alternate time horizons and TRM windows. They corroborate the descriptive small-FX-share find-
ing (regime-conditional) but carry no independent inferential weight on the behavioral channel.
Counting them as independent evidence is fishing-by-redundancy under §7’s anti-fishing invariants.
## 6 Limitations
1. Sub-floor N. Observed N = 28 is below the demonstration-grade Nmin = 38 (itself below the
project default of 75). All findings are pilot-grade.
2. Single-user pilot. The panel is a single-user JSONL trace. No population-level inference is
admissible.
3. Subscription-as-proxy. The notional-cost path substitutes for what a non-subscribed pay-
per-API LATAM developer would have paid for equivalent usage. Equal demand under both
billing regimes is a strong assumption.
4. v0.2.10 audit-econ corrections context. The withdrawn v0.2.9 verdict (PARTIAL-FAIL TO REJECT
under the contemporaneous power-recipe pin) remains in git history for audit trail. The current
write-up reports the lagged canonical recipe per Amendment #8.
5. Regime-conditional reading. The small-FX-share finding is conditional on the 2026-Q1-Q2
USDCOP regime and on the pilot subject’s usage pattern. Generalization is not claimed.
6. Same-ratio corroboration discipline. Z-arms are not independent inferential evidence; they
are reported as diagnostic-only.
57 Conclusion
The dev ai cost v2 iteration is paused at demonstration-grade pending an N ≥ 75 panel —
explicitly not closed-PASS and explicitly not closed-FAIL. The R5 descriptive finding (FX share ≈
0%, regime-conditional) informs M-design priors under Role A but is not a framework-level channel-
existence statement. The R4-S3-USD behavioral test POWER-HALTs; it cannot be adjudicated
at current sample size and power.
Three pre-enumerated pivots are available to the framework owner: (i) continue accumulating
data on the pilot subject (∼ 12–18 months to reach N ≥ 75 at observed cadence; regime-change risk
material); (ii) pivot within the same Y to the R6 sibling iteration on continuous-stream simulation,
parked at v0.1.3 and ready for dispatch; or (iii) pivot to a different Y (target population) where
the FX channel is ex-ante stronger. The choice is the framework owner’s. None of the three implies
that the FX-channel hypothesis has been disconfirmed; only that this particular pilot, on this
subscription user and this window, cannot adjudicate it.
References
Andrews, D.W.K. (1991). Heteroskedasticity and Autocorrelation Consistent Covariance Matrix
Estimation. Econometrica 59(3), 817–858.
LiteLLM. (2025). Model price and context-window registry. https://github.com/BerriAI/
litellm (commit SHA + file SHA-256 pinned in DATA PROVENANCE.md).
Newey, W.K., and K.D. West (1987). A Simple, Positive Semi-Definite, Heteroskedasticity and
Autocorrelation Consistent Covariance Matrix. Econometrica 55(3), 703–708.
Newey, W.K., and K.D. West (1994). Automatic Lag Selection in Covariance Matrix Estimation.
Review of Economic Studies 61(4), 631–653.
Politis, D.N., and J.P. Romano (1994). The Stationary Bootstrap. Journal of the American Sta-
tistical Association 89(428), 1303–1313.
6