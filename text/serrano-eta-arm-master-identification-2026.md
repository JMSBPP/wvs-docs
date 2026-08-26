---
sha256: 688b908febf4532be4565177c37cb5fa86934d5375c722a3259fd529977fb694
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 29046
---
eta-arm-master: �_D Identification Arc — Five
Identification Lenses
Demand Elasticity in dTAO Subnet Alpha Tokens (Phases 3.5–3.8)
btt-subnet-calibration project
2026-06-27
Table of contents
## 1 Introduction 1
1.1 Behavioral Demand Law: 𝐼(𝛼𝑖)
= 𝐴 ⋅ 𝑃
−𝜂𝐷
𝛼𝑖
and the A·� Bound . . . . . . . . . . . . 2
1.2 CEV Variance Model: 𝛽 and Maymin’s Estimand . . . . . . . . . . . . . . . . . . . . 3
## 1.3 Holdings Arm / Koijen-Yogo: Step B Power Bound . . . . . . . . . . . . . . . . . . . 5
## 1.4 Within-Subnet Panel: Lagged-Price IV and the UNIDENTIFIED Result . . . . . . . 6
## 1.5 Supply-Instrument Re-identification: Halving Correction and ALL-BOUND . . . . . 7
1.6 IV-Tries Table: Relevance, Exclusion, Verdict . . . . . . . . . . . . . . . . . . . . . . 9
## 2 Summary and Honest Deliverable 13
## 1 Introduction
This notebook documents the complete �\_D identification arc (Phases 3.5–3.8) as a unified
economic-analysis artifact. All notation follows docs/equation_audit/glossary.md.
The behavioral spine. Every section is a different lens on ONE parameter: the demand price
elasticity
𝜂𝐷 ≡ 𝜂𝑋(𝛼𝑖)/𝑃𝛼𝑖
∶=
𝑑log𝑋(𝛼𝑖)
𝑑log𝑃𝛼𝑖
defined in the flow demand law:
𝐼(𝛼𝑖)
= 𝐴 ⋅ 𝑃
−𝜂𝐷
𝛼𝑖
[exponent: −𝜂𝐷]
and its drift closure (exponent differs by 1 — the §3a-F2 error class):
𝜇𝐹 = 𝐵𝐷 ⋅ 𝑃𝛼𝑖
+ 𝐴 ⋅ 𝑃
1−𝜂𝐷
𝛼𝑖
[exponent: 1 − 𝜂𝐷]
1Bridge identity (ties the two exponents):
𝜇𝐹 − 𝐵𝐷 ⋅ 𝑃𝛼𝑖
= 𝑃𝛼𝑖
⋅ 𝐼(𝛼𝑖)
The CEV variance exponent 𝛽 = 𝑤(𝑑)
= 1 − 𝑤𝜑 is a distinct mechanical pool parameter; it enters
𝑑𝑃 = 𝜇(𝑃)𝑑𝑡+𝛿 𝑃𝛽
𝑑𝑊 and is estimated independently (Section 2). 𝜂𝐷 does not enter the CEMM
invariant families.
Honest resolved answer. 𝜂𝐷 is BOUNDED, not point-identified, across every identification
route tried in Phases 3.5–3.8. Each IV attempt failed on relevance or exclusion. The deliverable is a
one-sided bound; no 𝜂𝐷 point is manufactured.
Reproduce/attest discipline. Every headline number in this notebook is sourced from one of
two named tiers:
• RECOMPUTE — re-runs arithmetic from the committed input log or arc FINDINGS via
analysis.etapaper.* wrappers. Called at notebook execution time.
• ATTEST-FROZEN — parses commit-hash-pinned FINDINGS; labelled “frozen result, not
re-executed”. Source: docs/equation_audit/eta-identification-arc-FINDINGS.md.
1.1 Behavioral Demand Law: 𝐼(𝛼𝑖)
= 𝐴 ⋅ 𝑃
−𝜂𝐷
𝛼𝑖
and the A·� Bound
Model family. The behavioral demand law adds a price-elastic staking flow to the BITTENSOR.md
structural model (apps L223 ASSET-DEMAND TODO):
𝐼(𝛼𝑖)
= 𝐴 ⋅ 𝑃
−𝜂𝐷
𝛼𝑖
where 𝐴 is the demand amplitude (alpha/time per TAO−𝜂𝐷) and 𝜂𝐷 is the price elasticity. The
structural obstruction (Aristotle A2, (630f2d4c?)): 𝜂𝐷 enters only through 𝐴 ⋅ 𝑃
−𝜂𝐷
𝛼𝑖
, so every
price-only moment gradient 𝜕/𝜕𝜂𝐷 ∝ 𝐴. The identified object from price-only moments is the
linear combination 𝑠 = 𝑐1 log𝐴 − 𝜂𝐷 ⋅ 𝑐2, not 𝜂𝐷 separately. Rank(𝐺) ≤ 1 for any price-only GMM
Jacobian. The four-arm GMM triage ((dcd5b9b0?)) confirms only one arm (Arm-1a relative-price)
is constructible offline — and it does not restore rank.
# RECOMPUTE: re-runs A·� arithmetic from committed amplitude log + eta deliverable log.
# Calls analysis.etapaper.{eta,demand}.* which parse docs/research/*.log (fast-lane parsers).
d = headlines.demand_bound()
print(f"tier: {d['tier']}")
print(f"on_bound: {d['on_bound']}")
print(f"eta_hat: {d['eta_hat']}")
print(f"A_hat: {d['A_hat']}")
print()
print("Identification summary:")
print(" A_hat = 0 from NNLS on net delegation flow (net flow cancels; NNLS drives A → 0).")
2print(" A·P_alpha^{-eta_D} = 0 for ANY eta_D at A=0 → eta_D not separable from A.")
print(" Result: on_bound = True; eta_hat = None (one-sided bound, not a point).")
print()
print("Four-arm GMM triage (dcd5b9b0) — identification routes:")
print(" Arm-1a relative-price: rank � 1 (A2 obstruction; NOT standalone identifier)")
print(" Arm-2 holdings/KY: DATA_BLOCKED offline → Step B live backfill")
print(" Arm-3 emission-IV: PERM_BLOCKED (structural excess absent from taostats)")
print(" Arm-4 variance-�: CTEST_ONLY (A4 economically falsified @630f2d4c)")
tier: RECOMPUTE
on_bound: True
eta_hat: None
A_hat: 0.0
Identification summary:
A_hat = 0 from NNLS on net delegation flow (net flow cancels; NNLS drives A → 0).
A·P_alpha^{-eta_D} = 0 for ANY eta_D at A=0 → eta_D not separable from A.
Result: on_bound = True; eta_hat = None (one-sided bound, not a point).
Four-arm GMM triage (dcd5b9b0) — identification routes:
Arm-1a relative-price: rank � 1 (A2 obstruction; NOT standalone identifier)
Arm-2 holdings/KY: DATA_BLOCKED offline → Step B live backfill
Arm-3 emission-IV: PERM_BLOCKED (structural excess absent from taostats)
Arm-4 variance-�: CTEST_ONLY (A4 economically falsified @630f2d4c)
Three-way confirmation of the bound ((889d12f5?)):
1. ̂ 𝐴 = 0 (net delegation flow cancels; NNLS zeros both 𝐴 and 𝐵𝐷).
2. ̂ 𝛽 ≠ 1
2 (CEV-basis misspecification; see Section 2 for the computed value).
3. Four-arm GMM triage: no arm restores rank offline.
1.2 CEV Variance Model: 𝛽 and Maymin’s Estimand
Model family. The alpha token price follows the CEV diffusion:
𝑑𝑃𝛼𝑖
= 𝜇(𝑃𝛼𝑖
)𝑑𝑡 + 𝛿 𝑃𝛽
𝛼𝑖
𝑑𝑊
where 𝛽 = 𝑤(𝑑)
is the protocol mechanical weight (the CEV exponent) and 𝛿 is the vol scale. The
structural identity 𝛽 = 1 − 𝑤𝜑 ties it to the CEMM pool weight. Maymin’s Eq. 43 (Maymin 2026)
estimates 𝛽 from the within-subnet variance regression:
log(
𝑅𝑉14 ⋅ 𝑘
𝜎2
𝐹
) = 𝑐 + 2(𝛽 − 1) log𝑃𝛼𝑖
,
3where 𝑅𝑉14 is the 14-day realised return variance, 𝑘 is the pool constant, and 𝜎𝐹 is the flow volatility
(std of daily ΔTAO reserve). The slope 𝑠 = 2(𝛽 − 1) identifies 𝛽.
The 𝛽 ↔ 𝜂𝐷 bridge (Aristotle A4, (630f2d4c?)): 𝜂𝐷 = 1−2𝛽 is economically falsified — it yields
negative (upward-sloping) demand. 𝛽 remains a C-test-only estimand; it does NOT point-identify
𝜂𝐷.
# RECOMPUTE: re-parses data/panels/recon_t0_2026-06-22-widened.log @e29e5a03
# via analysis.etapaper.beta.powered_within_beta() -> scripts.recon_verdict.parse_verdict_input
# The in-repo constant in beta.py is NOT read; the log IS the RECOMPUTE source.
b = headlines.beta_headline()
print(f"tier: {b['tier']}")
print(f"beta_hat: {b['beta_hat']:.4f} [= 1 + c2_median/2]")
print(f"beta_ci: [{b['beta_ci'][0]:.4f}, {b['beta_ci'][1]:.4f}] [in beta-units]")
print(f"excludes_half: {b['excludes_half']} [DERIVED: beta_ci[0] > 0.5]")
print()
print("Interpretation:")
print(f" beta_hat = {b['beta_hat']:.4f}: intermediate leverage between CEV-1/2 and GBM.")
print(f" CI [{b['beta_ci'][0]:.4f}, {b['beta_ci'][1]:.4f}] excludes 0 (GBM refuted)")
print(f" and excludes_half={b['excludes_half']}: not pinned at exact CEV-1/2.")
print(f" Maymin external beta_hat approx 0.57 is inside the widened CI.")
print(f" Regime-heterogeneous: 70/70 powered sub-windows are UNSTABLE (T1 widened).")
print()
print(f"A4 bridge (eta_D = 1 - 2*beta_hat):")
eta_bridge = 1 - 2 * b['beta_hat']
print(f" eta_D = 1 - 2 * {b['beta_hat']:.4f} = {eta_bridge:.4f}")
print(f" => uneconomic (upward-sloping demand); beta remains C-test-only. @630f2d4c")
tier: RECOMPUTE
beta_hat: 0.6469 [= 1 + c2_median/2]
beta_ci: [0.5489, 0.6981] [in beta-units]
excludes_half: True [DERIVED: beta_ci[0] > 0.5]
Interpretation:
beta_hat = 0.6469: intermediate leverage between CEV-1/2 and GBM.
CI [0.5489, 0.6981] excludes 0 (GBM refuted)
and excludes_half=True: not pinned at exact CEV-1/2.
Maymin external beta_hat approx 0.57 is inside the widened CI.
Regime-heterogeneous: 70/70 powered sub-windows are UNSTABLE (T1 widened).
A4 bridge (eta_D = 1 - 2*beta_hat):
eta_D = 1 - 2 * 0.6469 = -0.2938
=> uneconomic (upward-sloping demand); beta remains C-test-only. @630f2d4c
41.3 Holdings Arm / Koijen-Yogo: Step B Power Bound
Model family. The Koijen and Yogo (2019) demand system approach identifies demand parameters
from the cross-section of asset holdings via the stock-level moment:
𝜓(𝐴,𝜂𝐷) ∶= 𝔼[log𝐻𝑤,𝑖,𝑡] = log𝐴𝑖 − 𝜂𝐷 ⋅ log𝑃𝛼𝑖,𝑡 + 𝜀𝑤,𝑖,𝑡,
where 𝐻𝑤,𝑖,𝑡 is wallet 𝑤’s holdings in subnet 𝑖 at time 𝑡. The key rank-restoring property: 𝜕𝜓/𝜕𝐴 ≠ 0
and is 𝜂𝐷-independent, so the holdings moment restores rank(𝐺) = 2 in the (𝐴,𝜂𝐷) parameter
space (Aristotle A2).
Step B (live backfill). The holdings arm (Arm-2) populated using the live metagraph backfill.
The six-gate verdict:
# MIXED tier: demand_bound()['on_bound'] is RECOMPUTE (re-run from committed logs);
# the Step-B N / dof / SE / R² / eta_hat figures are ATTEST-FROZEN via holdings_stepb()
# (parsed from eta-identification-arc-FINDINGS.md §3.5.3 @503a672b — no inline regex).
d2 = headlines.demand_bound()
hb = headlines.holdings_stepb()
print(f"on_bound tier: {d2['tier']} (RECOMPUTE)")
print(f"on_bound: {d2['on_bound']} (consistent with Step B: N=4 power starvation)")
print(f"eta_hat: {d2['eta_hat']} (deliverable: not point-identified)")
print()
print(f"Step-B stats tier: {hb['tier']} pin={hb['pin']}")
print("Step B gate summary (parsed from arc FINDINGS §3.5.3 @503a672b):")
print(f" N subnets (backfill): {hb['N']}, dof: {hb['dof']}")
print(f" SE(eta_D) approx {hb['SE_eta_D']}")
print(f" R^2 = {hb['R2']} at N = {hb['N']}")
print(f" Spec-1 point eta_hat_stepb = {hb['eta_hat_stepb']} "
f"(power-starved; NOT the deliverable, which stays eta_hat = None)")
print()
print("Gate results:")
print(" Gates (i)–(iv): PASS (moment existence, rank, netting, non-classical ME)")
print(" Gate (v) power: FAIL (N=4 => dof=2; SE(eta_D) >> 0 at N=4)")
print(" Gate (vi) excl.: n/a (Arm-3 permanently blocked)")
print()
print("Verdict: POWER_BOUND @503a672b")
print(" Bound character: structural (A=0, unfixable) -> power/N-starvation (fixable in princip
print(" Fill-to-N~92 (Maymin scale) gives CI half-width approx 0.71.")
print(" eta_hat = None; on_bound = True.")
on_bound tier: RECOMPUTE (RECOMPUTE)
on_bound: True (consistent with Step B: N=4 power starvation)
eta_hat: None (deliverable: not point-identified)
Step-B stats tier: ATTEST-FROZEN pin=503a672b
5Step B gate summary (parsed from arc FINDINGS §3.5.3 @503a672b):
N subnets (backfill): 4, dof: 2
SE(eta_D) approx 2.0
R^2 = 0.36 at N = 4
Spec-1 point eta_hat_stepb = 2.12 (power-starved; NOT the deliverable, which stays eta_hat =
Gate results:
Gates (i)–(iv): PASS (moment existence, rank, netting, non-classical ME)
Gate (v) power: FAIL (N=4 => dof=2; SE(eta_D) >> 0 at N=4)
Gate (vi) excl.: n/a (Arm-3 permanently blocked)
Verdict: POWER_BOUND @503a672b
Bound character: structural (A=0, unfixable) -> power/N-starvation (fixable in principle).
Fill-to-N~92 (Maymin scale) gives CI half-width approx 0.71.
eta_hat = None; on_bound = True.
## 1.4 Within-Subnet Panel: Lagged-Price IV and the UNIDENTIFIED Result
Model family. Within-subnet FE-2SLS on the wallet×subnet holdings panel:
log𝐻𝑤,𝑖,𝑡 = log𝐴𝑖 − 𝜂𝐷 ⋅ log𝑃𝛼𝑖,𝑡 + 𝜀𝑤,𝑖,𝑡
estimated with wallet×subnet fixed effects (demeaned). The candidate IV: lagged prices 𝑃𝛼𝑖,𝑡−𝑘 for
𝑘 = 1,…,4.
AR(k) exclusion gate. The AR(k) autocorrelation of the demeaned demand innovation 𝜀𝑤,𝑖,𝑡 is
tested with cluster-robust 𝑡-statistics. The exclusion condition requires 𝜌𝑘 ≈ 0 (no serial correlation
in the error). A near-unit-root demand shock propagates to every lagged price, violating exclusion
for all lags.
FE-OLS interpretation. The FE-OLS slope ̂ 𝛽OLS on demeaned log-holdings regressed on demeaned
log-price satisfies:
plim( ̂ 𝛽OLS) = −𝜂𝐷 +
Cov(log𝑃𝑑𝑚, 𝜀𝑑𝑚)
Var(log𝑃𝑑𝑚) ⏟⏟ ⏟ ⏟⏟⏟ ⏟ ⏟⏟
𝛿>0 (simultaneity)
When ̂ 𝛽OLS > 0, we have 𝛿 > 𝜂𝐷 — pure simultaneity domination. This does not give a bound on
|𝜂𝐷| (the retracted |𝜂𝐷| ≥ | ̂ 𝛽| claim was FALSE; corrected (12ad8b9b?)).
# ATTEST-FROZEN: parses eta-identification-arc-FINDINGS.md §3.6 @c55f9ddc.
# Frozen db/live result (taostats.db is NOT git-tracked; run_within_panel.py is print-only).
# Every number below comes from headlines.* (no inline literals / no inline regex).
w = headlines.within_panel_verdict()
diag = headlines.arc_diagnostics() # AR(k) rho/t-stats parsed from FINDINGS §3.6.2
6print(f"tier: {w['tier']}")
print(f"note: {w['note']}")
print(f"pin: {w['pin']}")
print()
print(f"verdict: {w['verdict']}")
print(f"beta_ols: {w['beta_ols']:+.4f} (FE-OLS slope logH_dm ~ logP_dm; sign is load-bear
print()
print("AR(k) exclusion gate @c55f9ddc (parsed from FINDINGS §3.6.2):")
for k in sorted(diag["ar_k"]):
rho = diag["ar_k"][k]["rho"]
tcl = diag["ar_k"][k]["t_cluster"]
print(f" lag-{k}: rho_{k} = {rho:.4f}, t_cluster = {tcl} -> REJECT exclusion")
print()
print(f"FE-OLS: beta_ols = {w['beta_ols']:+.4f} > 0 => simultaneity domination (delta > eta_D)"
print(" plim(beta_ols) = -eta_D + delta, delta > 0 (Cov(logP_dm, eps_dm) > 0)")
print(" Result: eta_D in [0, delta) with delta UNKNOWN => NO usable bound on |eta_D|")
print()
print("RETRACTION @12ad8b9b: |eta_D| >= 1.04 was FALSE (wrong-sign = simultaneity, not attenuat
tier: ATTEST-FROZEN
note: frozen db/live result, not re-executed
pin: c55f9ddc
verdict: UNIDENTIFIED
beta_ols: +1.0395 (FE-OLS slope logH_dm ~ logP_dm; sign is load-bearing)
AR(k) exclusion gate @c55f9ddc (parsed from FINDINGS §3.6.2):
lag-1: rho_1 = 0.8526, t_cluster = +9.72 -> REJECT exclusion
lag-2: rho_2 = 0.7454, t_cluster = +8.50 -> REJECT exclusion
lag-3: rho_3 = 0.6226, t_cluster = �1.96 -> REJECT exclusion
lag-4: rho_4 = 0.4830, t_cluster = �1.96 -> REJECT exclusion
FE-OLS: beta_ols = +1.0395 > 0 => simultaneity domination (delta > eta_D)
plim(beta_ols) = -eta_D + delta, delta > 0 (Cov(logP_dm, eps_dm) > 0)
Result: eta_D in [0, delta) with delta UNKNOWN => NO usable bound on |eta_D|
RETRACTION @12ad8b9b: |eta_D| >= 1.04 was FALSE (wrong-sign = simultaneity, not attenuation)
## 1.5 Supply-Instrument Re-identification: Halving Correction and ALL-BOUND
Model family. The 3.7 halving correction establishes that:
• BlockEmission storage field is stale (constant 1.0); halving is detected only via ΔTotalIssuance
flow.
7• The real global halving fired at block ≈ 7.1 × 106
(TAO issuance crossed 𝑆∗
/2, detected
(1c20eb76?)).
• Per-subnet alpha halving is keyed to each subnet’s alpha issuance total (≈ 5−5.6M alpha per
subnet ≪ the 10.5M threshold) — instrument absent in the panel.
The 3.8 multi-instrument re-identification tests three candidate instruments (C1, C4, C6-b) through
CONFIRM-FIRST gates. All instruments were pre-registered with fixed thresholds before any
diagnostic ran.
C1 — Global TAO halving × exposure: proxy-only (structural excess 𝑠𝑖 absent from taostats);
yield→demand channel (halving cuts 𝑟(𝛼)
→ yield-chasing = same demand-contamination pathology
as §4’s lagged-price IV); first-stage 𝐹 = 0.
C4 — Burn/Recycle (RAORecycledForRegistration): genuine first stage with 211 live
RPC reads; 70 netuids; confirmed cross-sectional variation; first-stage 𝐹 = 0 (genuine zero —
RAORecycledForRegistration has no relevance to AMM price changes).
C6-b — Staggered launch cohort × C1: inherits C1’s bound automatically via C1-dependency
gate; first-stage 𝐹 = 0.
# ATTEST-FROZEN: parses eta-identification-arc-FINDINGS.md §3.8 @2c53a56d.
# Frozen: 229 live RPC reads (8 storage-shape + 211 genuine C4 + 10 original).
# C4 reads/variation and the pre-registered thresholds come from headlines.arc_diagnostics()
# (parsed from FINDINGS §3.8.3 / §3.8.5 — no inline literals).
a = headlines.arm_confirmation_verdict()
diag = headlines.arc_diagnostics()
th = diag["thresholds"]
print(f"tier: {a['tier']}")
print(f"note: {a['note']}")
print(f"pin: {a['pin']}")
print()
print(f"all_bound: {a['all_bound']}")
print(f"arms: {a['arms']}")
print(f"c4_first_stage_F: {a['c4_first_stage_F']} "
f"(genuine: {diag['c4_live_reads']} reads; {diag['c4_variation_x']}x variation; zero rele
print(f"manifest_sha256: {a['manifest_sha256'][:16]}... (starts with {a['manifest_sha256'][:
print()
print("C1 routing:")
print(" proxy_only=True (structural excess absent; interaction F=0.0)")
print(" yield->demand threat (same AR-demand pathology as Phase 3.6 lagged-price IV)")
print(" => BOUND")
print()
print("C4 routing (genuine first stage — not a false positive):")
print(f" RAORecycledForRegistration: {diag['c4_variation_x']}x cross-sectional variation over
print(f" first_stage_F = {a['c4_first_stage_F']} (GENUINE zero — not connected to AMM price)")
print(" => BOUND")
print()
print("C6-b routing:")
8print(" C1 routes to bound => C6-b routes to bound automatically (C1-dependency gate)")
print(f" first_stage_F = 0.0; placebo_p = 1.0")
print(" => BOUND")
print()
print("Pre-registered thresholds (frozen before diagnostics ran; parsed from FINDINGS §3.8.5):"
print(f" F_MIN={th['F_MIN']}; C4_MIN_VARYING_DAYS={th['C4_MIN_VARYING_DAYS']}; "
f"PLACEBO_ALPHA={th['PLACEBO_ALPHA']}; STRUCTURAL_EXCESS_AVAILABLE={th['STRUCTURAL_EXCESS
print()
print(f"ALL arms (C1 / C4 / C6-b) -> BOUND. all_bound={a['all_bound']} @{a['pin']}")
tier: ATTEST-FROZEN
note: frozen: 229 live RPC reads, not re-executed
pin: 2c53a56d
all_bound: True
arms: {'C1': 'bound', 'C4': 'bound', 'C6-b': 'bound'}
c4_first_stage_F: 0.0 (genuine: 211 reads; 258x variation; zero relevance)
manifest_sha256: 7f582a86ad3b37f0... (starts with 7f582a86)
C1 routing:
proxy_only=True (structural excess absent; interaction F=0.0)
yield->demand threat (same AR-demand pathology as Phase 3.6 lagged-price IV)
=> BOUND
C4 routing (genuine first stage — not a false positive):
RAORecycledForRegistration: 258x cross-sectional variation over 70 netuids
first_stage_F = 0.0 (GENUINE zero — not connected to AMM price)
=> BOUND
C6-b routing:
C1 routes to bound => C6-b routes to bound automatically (C1-dependency gate)
first_stage_F = 0.0; placebo_p = 1.0
=> BOUND
Pre-registered thresholds (frozen before diagnostics ran; parsed from FINDINGS §3.8.5):
F_MIN=10.0; C4_MIN_VARYING_DAYS=8; PLACEBO_ALPHA=0.05; STRUCTURAL_EXCESS_AVAILABLE=False
ALL arms (C1 / C4 / C6-b) -> BOUND. all_bound=True @2c53a56d
1.6 IV-Tries Table: Relevance, Exclusion, Verdict
The following table covers every identification attempt (Phases 3.5–3.8). Each row is reproduced or
attested from docs/equation_audit/eta-identification-arc-FINDINGS.md.
9# Assemble the IV-tries table from attested/recomputed headline results.
# Rows sourced from eta-identification-arc-FINDINGS.md (ATTEST-FROZEN).
# Fetch attested verdicts
w_v = headlines.within_panel_verdict()
a_v = headlines.arm_confirmation_verdict()
d_v = headlines.demand_bound()
b_v = headlines.beta_headline()
diag_v = headlines.arc_diagnostics() # C4 258x variation / 211 reads (parsed §3.8.3)
# Build the IV-tries table as a list of dicts (all values from attested/recomputed sources)
iv_tries = [
{
"IV Try": "Relative-price Arm-1a (D'Haultfœuille)",
"Phase": "3.5",
"Relevance": "rank(G) <= 1 (A2; price-only does NOT restore rank @630f2d4c)",
"Exclusion": "n/a",
"Verdict": "BOUND (usable in GMM stack, not standalone identifier)",
},
{
"IV Try": "Holdings / Koijen-Yogo Arm-2",
"Phase": "3.5",
"Relevance": "Would restore rank at larger N (holdings level moment; psi'(A) != 0)",
"Exclusion": "5/6 gates PASS (exclusion holds; universe persistence = 0.995 @503a672b)"
"Verdict": f"POWER_BOUND @503a672b (on_bound={d_v['on_bound']})",
},
{
"IV Try": "Variance-� Arm-4",
"Phase": "3.5",
"Relevance": f"C-test only (A4 bridge: eta_D = 1 - 2*beta_hat = {1 - 2*b_v['beta_hat']:
"Exclusion": "n/a (A4 economically falsified @630f2d4c)",
"Verdict": "CTEST_ONLY (beta stays C-test-only)",
},
{
"IV Try": "Structural emission-IV Arm-3",
"Phase": "3.5",
"Relevance": "UNTESTABLE (s_i and alpha_emission_i absent from taostats committed store
"Exclusion": "n/a",
"Verdict": "PERM_BLOCKED @dcd5b9b0",
},
{
"IV Try": "Lagged-price FE-2SLS (lags 1-4)",
"Phase": "3.6",
"Relevance": "Strong first stage (F >> 10 at lag-1)",
"Exclusion": f"FAILS: all lags reject exclusion (near-unit-root demand shock; verdict={
"Verdict": f"UNIDENTIFIED (beta_ols={w_v['beta_ols']:.4f} wrong-signed; NO bound on |et
},
10{
"IV Try": "Global TAO halving x exposure C1",
"Phase": "3.7/3.8",
"Relevance": "proxy_only (structural excess absent; interaction F=0.0)",
"Exclusion": "yield->demand threat (same AR-demand pathology as lagged-price IV @2c53a5
"Verdict": f"BOUND (arms={a_v['arms']['C1']}; proxy_only; F=0.0)",
},
{
"IV Try": "Burn / recycle C4 (RAORecycledForRegistration)",
"Phase": "3.8",
"Relevance": f"FAILS: first_stage_F={a_v['c4_first_stage_F']} (genuine; {diag_v['c4_liv
"Exclusion": "n/a (first stage zero; moot)",
"Verdict": f"BOUND (arms={a_v['arms']['C4']}; F=0.0)",
},
{
"IV Try": "Staggered launch cohort C6-b",
"Phase": "3.8",
"Relevance": f"FAILS: first_stage_F=0.0; inherits C1 bound (C1-dependency gate)",
"Exclusion": "n/a (C1 dependency gate fails)",
"Verdict": f"BOUND (arms={a_v['arms']['C6-b']}; inherits C1 bound)",
},
]
# Print the table
print("=" * 100)
print("IV TRIES × {RELEVANCE, EXCLUSION, VERDICT} — full arc (Phases 3.5-3.8)")
print("Source: eta-identification-arc-FINDINGS.md (ATTEST-FROZEN from per-phase artifacts)")
print("=" * 100)
for row in iv_tries:
print(f"\n[Phase {row['Phase']}] {row['IV Try']}")
print(f" Relevance: {row['Relevance']}")
print(f" Exclusion: {row['Exclusion']}")
print(f" Verdict: {row['Verdict']}")
print()
print("=" * 100)
print(f"UNIFYING VERDICT: eta_D BOUNDED (not point-identified) across ALL {len(iv_tries)} route
print(" each IV try failed relevance OR exclusion OR power.")
print(" Coverage note: 3 further candidates were pre-screened DEAD in §3.7.3 and never reached
print(" instrument construction — C2 (TaoWeight constant 0.18), C3 (dTAO regime break pre-pa
print(" C5 (Tempo constant 360): no in-panel variation, so no first stage to test.")
print(f" eta_hat = {d_v['eta_hat']} | on_bound = {d_v['on_bound']}")
print(" Tier mix: RECOMPUTE (Arm-2/A4 via demand_bound/beta_headline) +")
print(" ATTEST-FROZEN (within-panel @c55f9ddc; arm-confirmation @2c53a56d)")
===============================================================================================
IV TRIES × {RELEVANCE, EXCLUSION, VERDICT} — full arc (Phases 3.5-3.8)
11Source: eta-identification-arc-FINDINGS.md (ATTEST-FROZEN from per-phase artifacts)
===============================================================================================
[Phase 3.5] Relative-price Arm-1a (D'Haultfœuille)
Relevance: rank(G) <= 1 (A2; price-only does NOT restore rank @630f2d4c)
Exclusion: n/a
Verdict: BOUND (usable in GMM stack, not standalone identifier)
[Phase 3.5] Holdings / Koijen-Yogo Arm-2
Relevance: Would restore rank at larger N (holdings level moment; psi'(A) != 0)
Exclusion: 5/6 gates PASS (exclusion holds; universe persistence = 0.995 @503a672b)
Verdict: POWER_BOUND @503a672b (on_bound=True)
[Phase 3.5] Variance-� Arm-4
Relevance: C-test only (A4 bridge: eta_D = 1 - 2*beta_hat = -0.2938; uneconomic)
Exclusion: n/a (A4 economically falsified @630f2d4c)
Verdict: CTEST_ONLY (beta stays C-test-only)
[Phase 3.5] Structural emission-IV Arm-3
Relevance: UNTESTABLE (s_i and alpha_emission_i absent from taostats committed store)
Exclusion: n/a
Verdict: PERM_BLOCKED @dcd5b9b0
[Phase 3.6] Lagged-price FE-2SLS (lags 1-4)
Relevance: Strong first stage (F >> 10 at lag-1)
Exclusion: FAILS: all lags reject exclusion (near-unit-root demand shock; verdict=UNIDENTIFI
Verdict: UNIDENTIFIED (beta_ols=1.0395 wrong-signed; NO bound on |eta_D|)
[Phase 3.7/3.8] Global TAO halving x exposure C1
Relevance: proxy_only (structural excess absent; interaction F=0.0)
Exclusion: yield->demand threat (same AR-demand pathology as lagged-price IV @2c53a56d)
Verdict: BOUND (arms=bound; proxy_only; F=0.0)
[Phase 3.8] Burn / recycle C4 (RAORecycledForRegistration)
Relevance: FAILS: first_stage_F=0.0 (genuine; 211 reads; 258x variation; zero AMM relevance)
Exclusion: n/a (first stage zero; moot)
Verdict: BOUND (arms=bound; F=0.0)
[Phase 3.8] Staggered launch cohort C6-b
Relevance: FAILS: first_stage_F=0.0; inherits C1 bound (C1-dependency gate)
Exclusion: n/a (C1 dependency gate fails)
Verdict: BOUND (arms=bound; inherits C1 bound)
===============================================================================================
UNIFYING VERDICT: eta_D BOUNDED (not point-identified) across ALL 8 routes tried.
each IV try failed relevance OR exclusion OR power.
Coverage note: 3 further candidates were pre-screened DEAD in §3.7.3 and never reached
instrument construction — C2 (TaoWeight constant 0.18), C3 (dTAO regime break pre-
12panel),
C5 (Tempo constant 360): no in-panel variation, so no first stage to test.
eta_hat = None | on_bound = True
Tier mix: RECOMPUTE (Arm-2/A4 via demand_bound/beta_headline) +
ATTEST-FROZEN (within-panel @c55f9ddc; arm-confirmation @2c53a56d)
## 2 Summary and Honest Deliverable
Every identification attempt for 𝜂𝐷 across Phases 3.5–3.8 is documented above. The arc covers
eight IV routes; each failed on relevance, exclusion, or statistical power:
• Relevance failures: relative-price rank ≤ 1 (A2); structural emission permanently blocked;
C4 genuine 𝐹first-stage = 0; C6-b inherits C1’s bound.
• Exclusion failures: lagged-price IV (near-unit-root demand shock; all lags reject exclusion);
C1 yield→demand channel.
• Power failures: N = 4 subnets in the holdings arm (fixable in principle, unlike relevance/ex-
clusion failures).
Open off-ramps (documented, not executed here):
1. Aristotle A5 (GF-deconvolution escape, (22d1eec3?)): conditional proof (� time-invariant
• ̂ 𝐼 non-degenerate); submission deferred (service outage).
2. Substrate-RPC archive (Dwellir): provides structural excess 𝑠𝑖 for Arm-3 emission-IV
(Dwellir Bittensor MAINNET ARCHIVE; 10 req/s; SubtensorModule:: AlphaOut/Halv-
ing/Tempo/TaoWeight).
BITTENSOR.md ASSET-DEMAND resolution (apps L223): the honest answer is 𝜂𝐷 is
BOUNDED ∈ [0,𝛿) where 𝛿 is unknown. No point estimate is produced. Resolution note lives
under docs/equation_audit/; canonical BITTENSOR.md is not edited.
# Final summary — all values from headline calls (no hardcoded numbers).
print("===== HONEST DELIVERABLE =====")
print(f"beta tier: {b_v['tier']} | beta_hat = {b_v['beta_hat']:.4f}")
print(f" CI = [{b_v['beta_ci'][0]:.4f}, {b_v['beta_ci'][1]:.4f}]")
print(f" excludes_half = {b_v['excludes_half']} (DERIVED: CI[0] > 0.5)")
print()
print(f"demand tier: {d_v['tier']} | A_hat = {d_v['A_hat']} | on_bound = {d_v['on_bound']
print(f" eta_hat = {d_v['eta_hat']}")
print()
print(f"within-panel: {w_v['tier']} | verdict = {w_v['verdict']}")
print(f" beta_ols = {w_v['beta_ols']:.4f} | pin = {w_v['pin']}")
print()
print(f"arm-confirm: {a_v['tier']} | all_bound = {a_v['all_bound']}")
print(f" arms = {a_v['arms']}")
13print(f" c4_first_stage_F = {a_v['c4_first_stage_F']} | pin = {a_v['pin']}")
print()
print(f"BITTENSOR.md ASSET-DEMAND TODO (apps L223):")
print(f" eta_D = eta_{{X^(alpha_i)/P_{{alpha_i}}}} is BOUNDED, not point-identified.")
print(f" Honest deliverable: on_bound = {d_v['on_bound']}, eta_hat = {d_v['eta_hat']}.")
print(f" All {len(iv_tries)} IV routes failed. arc pinned @2c53a56d.")
===== HONEST DELIVERABLE =====
beta tier: RECOMPUTE | beta_hat = 0.6469
CI = [0.5489, 0.6981]
excludes_half = True (DERIVED: CI[0] > 0.5)
demand tier: RECOMPUTE | A_hat = 0.0 | on_bound = True
eta_hat = None
within-panel: ATTEST-FROZEN | verdict = UNIDENTIFIED
beta_ols = 1.0395 | pin = c55f9ddc
arm-confirm: ATTEST-FROZEN | all_bound = True
arms = {'C1': 'bound', 'C4': 'bound', 'C6-b': 'bound'}
c4_first_stage_F = 0.0 | pin = 2c53a56d
BITTENSOR.md ASSET-DEMAND TODO (apps L223):
eta_D = eta_{X^(alpha_i)/P_{alpha_i}} is BOUNDED, not point-identified.
Honest deliverable: on_bound = True, eta_hat = None.
All 8 IV routes failed. arc pinned @2c53a56d.
Notation: all symbols from docs/equation_audit/glossary.md. sha256 guard: docs/equation_audit/pins/bitt
md-sha256.txt (unchanged — BITTENSOR.md read-only). Reproduce command (Wave 2):
quarto render notebooks/eta-arm-master.qmd --to pdf.
Koijen, Ralph S. J., and Motohiro Yogo. 2019. “A Demand System Approach to Asset Pricing.”
Journal of Political Economy 127 (4): 1475–515. https://doi.org/10.1086/701683.
Maymin, Philip Z. 2026. “Option Pricing on Automated Market Maker Tokens.” arXiv. https:
//arxiv.org/abs/2603.29763.
14