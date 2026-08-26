---
sha256: b4fc96b816bed18bcae918814a4029ff978d911cc97794ebf8c0b2c2d4c7cc82
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 27669
---
Demand Elasticity in dTAO Subnet Tokens: Why
eta-hat is a Bound
btt-subnet-calibration project
2026-06-23
Table of contents
## 1 Introduction 2
## 2 The 𝛽 Question and the Motivating Artifact 2
## 2.1 The CEV diffusion and the Maymin estimand . . . . . . . . . . . . . . . . . . . . . . 2
## 2.2 The measurement confound: the +2.3894 artifact . . . . . . . . . . . . . . . . . . . . 3
## 3 Within-Subnet + Flow-Vol Reconciliation 3
## 3.1 Correcting to Maymin’s recipe . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
4 The Data Lever: Powered ̂ 𝛽 ≈ 0.65 4
## 4.1 The by_day block-bounds bug and the pagination backfill . . . . . . . . . . . . . . . 4
## 5 From 𝛽 to 𝜂: Misspecification and the Sensitivity Arm 6
## 5.1 The basis-misspecification problem . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
## 6 The A-Arm and Flow Degeneracy 7
## 6.1 The weak-identification structure . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
7 ̂ 𝐴 = 0: Net Delegation Flow Cancellation 9
## 7.1 The NNLS result on net flow . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
## 8 Why: Generic Validator Churn vs the Demand Layer 10
## 8.1 Two-layer structure of staker behavior . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 9 Result: 𝐴 ⋅ 𝜂 / One-Sided Bound 12
## 9.1 The honest deliverable on two independent unidentification legs . . . . . . . . . . . . 12
## 9.2 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 13
## 10 Appendix: Claims ↔ Test Map 13
11 Introduction
This report narrates the full decision-driver chain that leads to the demand-elasticity result for
dTAO subnet alpha tokens. The model under study is the CEV drift closure:
𝑑𝑃 = 𝜇(𝑃)𝑑𝑡 + 𝛿 𝑃𝛽
𝑑𝑊, 𝜇𝐹 (𝑃;𝜂) = 𝐵𝐷 𝑃 + 𝐴𝑃1−𝜂
,
where 𝑃 is the alpha token price in TAO, 𝛽 is the constant-elasticity-of-variance (CEV) exponent
(Cox 1975), 𝜂 is the demand price-elasticity, and 𝐴 is the demand amplitude. The structural goal is
to identify and estimate 𝜂.
The analysis proceeds in eight sections. Each section is a decision driver — a piece of evidence that,
together, determines whether 𝜂 can be estimated, and if not, what the honest deliverable is.
Headline result (preview): 𝛽 is pinned at ̂ 𝛽 ≈ 0.65, intermediate leverage between the constant-
product-AMM prediction (𝛽 = 1
2, Feller (1951)) and GBM (𝛽 = 1). The demand amplitude
̂ 𝐴 = 0 on real net delegation flow: the structural term 𝐴𝑃−𝜂
collapses to zero for any 𝜂, leaving 𝜂
unidentified on two independent legs. The deliverable is an 𝐴 ⋅ 𝜂 / one-sided bound, not an 𝜂
point.
## 2 The 𝛽 Question and the Motivating Artifact
## 2.1 The CEV diffusion and the Maymin estimand
The price process 𝑑𝑃 = 𝜇𝑑𝑡 + 𝛿 𝑃𝛽
𝑑𝑊 belongs to the CKLS / CEV diffusion-elasticity class
(Chan et al. 1992; Cox 1975). The variance elasticity Var(𝑑𝑃/𝑃 |𝑃) ∝ 𝑃2(𝛽−1)
maps onto a linear
regression via Maymin’s Eq. 43 (Maymin 2026):
log(
𝑅𝑉14 ⋅ 𝑘
𝜎2
𝐹
) = 𝑐 + 2(𝛽 − 1)log𝑃,
where 𝑅𝑉14 is the 14-day realised return variance, 𝑘 is the pool constant, 𝜎𝐹 is the daily flow-
volatility (std of ΔTAO reserve), and 𝑐 is a free intercept. The slope 𝑠 = 2(𝛽 − 1) is the verdict
driver:
Table 1: CEV slope table.
𝛽 Slope 2(𝛽 − 1) Interpretation
1 0 GBM / Black–Scholes
1
2 −1 CEV square-root; constant-product-AMM mechanical
prediction (Feller 1951)
1
2 < 𝛽 < 1 (−1,0) Leverage effect (Black 1976)
22.2 The measurement confound: the +2.3894 artifact
An initial analysis using a pooled cross-section estimator with return-volatility 𝜎𝐹 and
√
𝑘 depth
produced a within-subnet median slope of +2.3894 — a super-GBM finding ( ̂ 𝛽 ≈ 2.19) that
appeared to refute the AMM prediction decisively. The function below recovers this committed
artifact.
art = beta.uncontrolled_artifact()
print(f"Committed C4 artifact slope : {art['slope']:+.4f}")
print(f"Implied beta_hat : {art['beta_hat']:.4f} (super-GBM)")
print(f"Role : {art['role']}")
print(f"Source : {art['source']}")
Committed C4 artifact slope : +2.3894
Implied beta_hat : 2.1947 (super-GBM)
Role : CONFOUND, not the verdict
Source : docs/research/beta-reconciliation-FINDINGS.md Table row C4 (99-
day panel, line 64). The committed value is +2.3894. There is NO +2.566 in any committed artifa
The number in the committed artifact is +2.3894. There is no +2.566 in any artifact.
The confound is not a real finding: it arises from three simultaneous mismatches relative to Maymin’s
recipe (pooled-between vs within-subnet; return-vol vs flow-vol;
√
𝑘 vs full 𝑘). Section Section 3
resolves all three.
## 3 Within-Subnet + Flow-Vol Reconciliation
## 3.1 Correcting to Maymin’s recipe
Switching to within-subnet per-subnet OLS slopes (cross-subnet median, distribution-free),
flow-volatility 𝜎𝐹 (std of daily ΔTAO reserve), and full 𝑘 — exactly Maymin’s Eq. 43 recipe
(Maymin 2026) — eliminates the confound. The within-vs-pooled gap is a Simpson / pooling
effect: the pooled estimator conflates within-subnet and between-subnet price variation, and the
between dimension carries the confound (cross-subnet price level differences, not within-subnet
variance).
wvp = beta.within_vs_pooled()
print("--- Widened panel (~5x span) ---")
print(f" Within-subnet median beta_hat : {wvp['within_beta']:.4f}")
print(f" Pooled OLS (C3) beta_hat : {wvp['pooled_beta']:.4f}")
print(f" Within-transformed FE beta_hat: {wvp['fe_beta']:.4f}")
print()
print("--- 99-day baseline ---")
print(f" Within 99-day beta_hat : {wvp['within_beta_99']:.4f}")
3print(f" Pooled 99-day beta_hat : {wvp['pooled_beta_99']:.4f}")
print()
print(f" Converging on wider window : {wvp['converging']}")
print()
print(f" Interpretation: {wvp['description']}")
--- Widened panel (~5x span) ---
Within-subnet median beta_hat : 0.6469
Pooled OLS (C3) beta_hat : 0.4818
Within-transformed FE beta_hat: 0.4555
--- 99-day baseline ---
Within 99-day beta_hat : 0.7717
Pooled 99-day beta_hat : 0.5528
Converging on wider window : True
Interpretation: Widened panel (~5× span): within �̂=0.647, pooled �̂=0.482, FE �̂=0.456. 99-
day: within �̂=0.772, pooled �̂=0.553. Gap compressed from 0.219 to 0.165 — within and pooled esti
subnet is the headline (Maymin estimand); pooled is the cross-sensitivity check.
The within estimator is the headline (Maymin’s estimand); pooled and FE are cross-sensitivity
checks. On the widened panel (∼ 5× span), the two estimators converge — the within–pooled gap
(in ̂ 𝛽-units) compressed from 0.22 (99-day) to 0.17 (widened) — confirming that the historical gap
was primarily a window-length / pooling composition artifact, not a genuine structural difference.
4 The Data Lever: Powered ̂ 𝛽 ≈ 0.65
## 4.1 The by_day block-bounds bug and the pagination backfill
The Taostats by_day endpoint ignores block_number_gte / block_number_lte filters: earlier
history is accessible only via pagination through all available rows. The initial store covered only
the most-recent 99-day window; pagination backfill extended coverage to $�$5× the original span,
reaching the Maymin window (Aug 2025–Feb 2026), at zero additional API quota beyond the backfill
fetch (committed offline thereafter).
The powered result on the widened panel:
pwb = beta.powered_within_beta()
print(f"Slope (C2, widened) : {pwb['slope']:+.6f}")
print(f"beta_hat (widened) : {pwb['beta_hat']:.4f}")
print(f"CI lo (slope units) : {pwb['ci_lo']:+.6f} => beta-CI lo : {pwb['beta_ci'][0
print(f"CI hi (slope units) : {pwb['ci_hi']:+.6f} => beta-CI hi : {pwb['beta_ci'][1
4print()
print("Interpretation:")
print(" CI excludes 0 (ci_hi < 0) => GBM (beta=1) REFUTED")
print(" CI excludes -1 not held => beta not pinned at exactly 1/2")
print(" Maymin beta_hat~0.57 is NOW inside the widened CI [0.55, 0.70]")
print(" => the 99-day window gap (beta_hat 0.77 vs Maymin 0.57) is a window artifact, resolved
Slope (C2, widened) : -0.706211
beta_hat (widened) : 0.6469
CI lo (slope units) : -0.902214 => beta-CI lo : 0.5489
CI hi (slope units) : -0.603770 => beta-CI hi : 0.6981
Interpretation:
CI excludes 0 (ci_hi < 0) => GBM (beta=1) REFUTED
CI excludes -1 not held => beta not pinned at exactly 1/2
Maymin beta_hat~0.57 is NOW inside the widened CI [0.55, 0.70]
=> the 99-day window gap (beta_hat 0.77 vs Maymin 0.57) is a window artifact, resolved.
rh = beta.regime_heterogeneous()
print(f"T1 regime instability: unstable={rh['unstable']}")
print(f" n_unstable / n_powered : {rh['n_unstable']} / {rh['n_powered']}")
print(f" Median |Delta slope| : {rh['delta_slope']:.3f} (vs 0.667 on 99-day)")
print()
print(f" Interpretation: {rh['interpretation']}")
T1 regime instability: unstable=True
n_unstable / n_powered : 70 / 70
Median |Delta slope| : 0.380 (vs 0.667 on 99-day)
Interpretation: T1 widened re-run: ALL 70 powered sub-windows are UNSTABLE (|Δslope| > combin
day, reflecting genuinely different slope regimes, not just sampling noise — n_indep per half �
heterogeneity across the dTAO 2025→2026 window. � is NOT a single constant across the full peri
fig = plots.beta_window_comparison_plot()
plt.tight_layout()
plt.savefig("/tmp/beta_window.pdf", bbox_inches="tight")
plt.show()
Figure 1
Finding: ̂ 𝛽 ≈ 0.647, distribution-free CI [0.55,0.70] in 𝛽-units (source: 𝑐2 median slope = −0.706,
sign CI [−0.902,−0.604] in slope units, 70 per-subnet slopes on the widened panel). GBM (𝛽 ≈ 1)
is firmly refuted as a measurement artifact. ̂ 𝛽 ≈ 0.65 is intermediate leverage: in the (1
2,1)
5leverage-effect region (Black 1976), consistent with the CEV direction but not pinned at the
constant-product-AMM exact value 𝛽 = 1
2.
The T1 instability (all 70 powered sub-windows unstable, median |Δslope| = 0.380) means 𝛽 is
regime-heterogeneous across the 2025–2026 dTAO window: early price-discovery behaviour
differs from later, more-mature AMM dynamics.
## 5 From 𝛽 to 𝜂: Misspecification and the Sensitivity Arm
## 5.1 The basis-misspecification problem
The SMM estimator in calib/smm.py:97 implements the drift basis X = [𝑃3/2
, 𝑃3/2
ln𝑃], which
encodes 𝐴𝑃3/2−𝜂
under the assumption 𝛽 = 1
2 exactly. With ̂ 𝛽 ≈ 0.65 ≠ 1
2, the correct curvature
basis is 𝑃(1+𝛽)−𝜂
— the existing basis is misspecified for a 𝛽-point estimate.
The re-derived 𝛽 = 0.65 basis (LOCKED D1, Plan 03.3-05) constitutes a subordinate sensitivity
arm: conditional on 𝛽 AND on 𝐴 ≠ 0. The honest 𝜂 deliverable is computed from the general-𝛽
basis below.
ed = eta.eta_deliverable()
print(f"eta_hat : {ed['eta_hat']}")
print(f"identified : {ed['identified']}")
print(f"on_bound : {ed['on_bound']}")
print()
print("Deliverable string (verbatim from choose_deliverable() committed log):")
print(f" {ed['deliverable']}")
print()
print("Unidentified legs (COMPUTED from live predicates):")
for i, leg in enumerate(ed['unidentified_legs'], 1):
print(f" Leg {i}: {leg}")
eta_hat : None
identified : False
on_bound : True
Deliverable string (verbatim from choose_deliverable() committed log):
conditional: A·� / one-sided BOUND (NOT ±0.05) — backcheck_ok=False: A unmeasurable; route to
Unidentified legs (COMPUTED from live predicates):
Leg 1: A_hat=0 net flow cancels: real per-day net delegation � 0 (NNLS drives A→0; A·P^{−�}=0
Leg 2: beta!=1/2 basis misspecified: �̂�0.647 (CI [0.55, 0.70]) excludes exact ½; curvature bas
6bsa = eta.beta_sensitivity_arm()
print("�-sensitivity arm — LOCKED D1 (SUBORDINATE):")
print(f" eta_point: {bsa['eta_point']}")
print()
print(" Points (� -> �̂):")
for b, e in bsa['points'].items():
print(f" �={b:.2f} : �̂ = {e}")
print()
print("Reason:")
print(f" {bsa['reason']}")
�-sensitivity arm — LOCKED D1 (SUBORDINATE):
eta_point: None
Points (� -> �̂):
�=0.55 : �̂ = None
�=0.60 : �̂ = None
�=0.65 : �̂ = None
�=0.70 : �̂ = None
Reason:
A=0 � A·P^{−�}=0 for any �. With Â=0 (net delegation flow cancels; NNLS drives A→0), the struc
derive the curvature basis. The A·� / one-sided BOUND is the deliverable (ALIAS for the full ch
sensitivity band to None; the code is correct, the � point is unidentified given Â=0 from Plan-
03.
Key insight (the weak-identification argument): 𝜂 enters the drift 𝜇𝐹 (𝑃;𝜂) = 𝐵𝐷 𝑃 +𝐴𝑃1−𝜂
exclusively via the term 𝐴𝑃−𝜂
. Every moment gradient 𝜕/𝜕𝜂 ∝ 𝐴. With ̂ 𝐴 = 0, the structural
term 𝐴𝑃−𝜂
= 0 for any 𝜂 and any basis exponent (𝛽 = 0.65 or 𝛽 = 0.5 or any other value). The
sensitivity band specified in LOCKED D1 (before the ̂ 𝐴 = 0 backfill landed) vacates to None
everywhere. This is the honest reconciliation of LOCKED D1 — not a silent override — because
the band was specced assuming 𝐴 > 0; the live delegation backfill found ̂ 𝐴 = 0.
No 𝜂 point is manufactured.
## 6 The A-Arm and Flow Degeneracy
## 6.1 The weak-identification structure
𝜂 enters only via 𝐴𝑃−𝜂
. Identifying 𝜂 therefore requires identifying 𝐴 first. The flow-based A-arm
attempts to recover 𝐴 from the net delegation data; this section shows why it fails.
7fcg = demand.flow_completeness_gate()
print(f"Plan-06 completeness gate passed : {fcg['passed']}")
print(f" n_flow_subnets (any flow data) : {fcg['n_flow_subnets']}")
print(f" n_subnets meeting >= 30 flow-days: {fcg['n_ge_30_days']}")
print(f" Gate threshold : >= 8 subnets at >= 30 flow-days")
print()
print(f" Interpretation: {fcg['interpretation']}")
Plan-06 completeness gate passed : False
n_flow_subnets (any flow data) : 27
n_subnets meeting >= 30 flow-days: 1
Gate threshold : >= 8 subnets at >= 30 flow-days
Interpretation: Plan-06 completeness gate FAILED: only 1/8 subnets reach �30 flow-
days out of 27 subnets with any delegation data. The A-arm stays a subnet-104-
anchored honest bound (A·� / one-sided bound, NOT a wide pooled cross-section). Gate threshold:
days.
fds = demand.flow_depth_by_subnet()
print("Per-subnet flow depth (top 5 by flow-days):")
for nu, days in fds.items():
print(f" netuid {nu:3d}: {days:.1f} flow-days")
Per-subnet flow depth (top 5 by flow-days):
netuid 104: 45.4 flow-days
netuid 9: 27.1 flow-days
netuid 42: 4.0 flow-days
netuid 58: 3.9 flow-days
netuid 14: 3.3 flow-days
fig = plots.flow_depth_bar()
plt.tight_layout()
plt.savefig("/tmp/flow_depth.pdf", bbox_inches="tight")
plt.show()
Figure 2
pfc = demand.price_vs_flow_coverage()
print(f"Flow-panel price coverage : {pfc['flow_decades']:.2f} decades")
print(f"Full-store price coverage : {pfc['price_decades']:.2f} decades")
print(f"Coverage asymmetry (ratio) : {pfc['asymmetry']:.2f}x")
print()
print("The flow panel spans only 1.10 price decades (vs 8.64 for the full price store).")
print("A was fit on the flow support, not the full store (RC-M1: cross-support backcheck incohe
8Flow-panel price coverage : 1.10 decades
Full-store price coverage : 8.64 decades
Coverage asymmetry (ratio) : 7.85x
The flow panel spans only 1.10 price decades (vs 8.64 for the full price store).
A was fit on the flow support, not the full store (RC-M1: cross-support backcheck incoherent).
Finding: The Plan-06 completeness gate failed: only 1/8 required subnets reach ≥ 30 flow-days.
The 27 subnets with any delegation data collectively span only ∼ 1.10 price decades on the flow
panel, vs ∼ 8.64 decades on the full price store. The delegation backfill, routed to the A-bound
branch (anti-fishing), confirmed the shallow coverage is a genuine data property, not a collection
failure.
7 ̂ 𝐴 = 0: Net Delegation Flow Cancellation
## 7.1 The NNLS result on net flow
The amplitude fit uses a binned NNLS level fit: 𝐼(𝑃) = 𝐵𝐷 + 𝐴𝑃−𝜂
with 𝐵𝐷,𝐴 ≥ 0, where
𝐼 = net daily TAO flow/(𝑃⋅𝑖scale) is the normalized demand level. With 𝐴,𝐵𝐷 ≥ 0 and the observed
data showing mixed-sign 𝐼 (delegates and undelegates cancel), NNLS drives both coefficients to
zero.
af = demand.amplitude_fit()
print(f"A_hat (net flow NNLS) : {af['A_hat']:.6e}")
print(f"B_D_hat (net flow NNLS): {af['B_D_hat']:.6e}")
print(f"i_scale (pinned) : {af['i_scale']:.3f}")
print(f"unmeasurable : {af['unmeasurable']}")
A_hat (net flow NNLS) : 0.000000e+00
B_D_hat (net flow NNLS): 0.000000e+00
i_scale (pinned) : 4360.452
unmeasurable : True
gvn = demand.gross_vs_net_flow(104)
print(f"Netuid 104 gross TAO flow (delegate + undelegate): {gvn['gross']:.4e}")
print(f"Netuid 104 net TAO flow (delegate - undelegate): {gvn['net']:.4e}")
print(f" |net| / gross ratio : {gvn['ratio']:.5e}")
print()
print("Net flow is ~0.032% of gross. Delegations and undelegations cancel to ~4 sig figures.")
9Netuid 104 gross TAO flow (delegate + undelegate): 7.0777e+14
Netuid 104 net TAO flow (delegate - undelegate): -2.2404e+11
|net| / gross ratio : 3.16537e-04
Net flow is ~0.032% of gross. Delegations and undelegations cancel to ~4 sig figures.
fig = plots.net_flow_cancellation_plot(104)
plt.tight_layout()
plt.savefig("/tmp/net_flow.pdf", bbox_inches="tight")
plt.show()
Figure 3
Finding: ̂ 𝐴 = 0 from net delegation flow. NNLS zeros out both 𝐴 and 𝐵𝐷 because the per-bin
median normalized demand ̄ 𝐼(𝑃𝑗) ≈ 0 across all price bins — the delegates and undelegates in each
bin cancel. This is not a data gap to be filled with more rows; it is a structural property of the
delegation stream (see Section Section 8 for the mechanistic explanation).
## 8 Why: Generic Validator Churn vs the Demand Layer
## 8.1 Two-layer structure of staker behavior
The ̂ 𝐴 = 0 result is explained by the two-layer structure of dTAO staking:
Layer above (price, where 𝜂 acts): Price-elastic demand for a subnet’s ALPHA token is
expressed through swaps — buy/sell pressure that moves the constant-product pool price. This
is where 𝛽 is identified (all 70 subnets; ∼ 400 days per subnet on the widened panel) (Maymin
2026).
Layer below (delegation, where Â = 0): The delegation_events stream records validator-
level stake reshuffling — nominators moving TAO among generic Bittensor validators (Taostats,
tao.bot, Tensorplex, Kraken, etc.) chasing dividend yield. This is not the demand signal for subnet
ALPHA; it is a base-layer dTAO churn behavior that cancels on every sufficiently active subnet.
cr104 = churn.churn_ratio(104)
cr9 = churn.churn_ratio(9)
print(f"churn_ratio(104) = |net|/gross : {cr104:.5e} (~{cr104*100:.4f}%)")
print(f"churn_ratio( 9) = |net|/gross : {cr9:.5e} (~{cr9*100:.4f}%)")
churn_ratio(104) = |net|/gross : 3.16537e-04 (~0.0317%)
churn_ratio( 9) = |net|/gross : 1.04057e-03 (~0.1041%)
10bdc = churn.both_deep_subnets_cancel()
print(f"both_deep_subnets_cancel() : {bdc}")
print()
print("Discriminator: BOTH netuid 104 (most events) AND netuid 9 (2nd most events)")
print("cancel to < 1.5e-3. If the zero were a subnet-104-specific protocol rule,")
print("netuid 9 would NOT match. The cancellation is GENERIC dTAO churn.")
both_deep_subnets_cancel() : True
Discriminator: BOTH netuid 104 (most events) AND netuid 9 (2nd most events)
cancel to < 1.5e-3. If the zero were a subnet-104-specific protocol rule,
netuid 9 would NOT match. The cancellation is GENERIC dTAO churn.
ndb = churn.nominators_doing_both(104)
print(f"Nominators doing BOTH delegate+undelegate on netuid 104: {ndb}")
print(f" ~{ndb}/475 = {ndb/475*100:.0f}% of active nominators reshuffle in both directions.")
print()
print("This is the mechanism: individual nominators simultaneously hold both DELEGATE")
print("and UNDELEGATE records across the observation window (validator reshuffling,")
print("not net accumulation of subnet demand).")
Nominators doing BOTH delegate+undelegate on netuid 104: 332
~332/475 = 70% of active nominators reshuffle in both directions.
This is the mechanism: individual nominators simultaneously hold both DELEGATE
and UNDELEGATE records across the observation window (validator reshuffling,
not net accumulation of subnet demand).
The discriminator: Both deep subnets (104 and 9) cancel to ∼ 10−3
. If the cancellation were
a netuid-104 protocol rule, netuid 9 would not match. The churn is generic dTAO validator-
reshuffling behavior: nominators freely move stake between validators, producing gross flows that
nearly cancel at the net level. On every sufficiently active subnet, the net flow converges to zero as
the observation window grows.
The 𝛽/flow asymmetry is therefore explained structurally: PRICE data is deep and representative
for all 70 subnets, so 𝛽 (the variance/price side, Maymin’s estimand) identifies cleanly. FLOW
data is churn that cancels, so the demand amplitude 𝐴 (our novel arm) returns ̂ 𝐴 = 0. Maymin
used ∼ 90 subnets precisely because 𝛽 only needs the abundant price data; he never attempted the
flow-based 𝐴 arm.
119 Result: 𝐴 ⋅ 𝜂 / One-Sided Bound
## 9.1 The honest deliverable on two independent unidentification legs
ed2 = eta.eta_deliverable()
print("===== HONEST RESULT =====")
print(f"eta_hat : {ed2['eta_hat']} (NOT ESTIMATED)")
print(f"on_bound : {ed2['on_bound']}")
print(f"identified : {ed2['identified']}")
print()
print("Deliverable (verbatim choose_deliverable() string from committed log):")
print(f" {ed2['deliverable']}")
print()
print("Unidentification legs (COMPUTED from live predicates):")
for i, leg in enumerate(ed2['unidentified_legs'], 1):
print(f" Leg {i}: {leg}")
print()
print("beta_sensitivity_arm — all points:")
bsa2 = eta.beta_sensitivity_arm()
for b, e in bsa2['points'].items():
print(f" beta={b:.2f} => eta_hat = {e}")
print()
print("Two-sided summary:")
print(f" beta pinned : ~0.647, CI [0.549, 0.698]")
print(f" A (amplitude) : UNMEASURABLE from net delegation flow")
print(f" eta_hat : NONE (unidentified on 2 independent legs)")
print(f" RDE-01 : PARTIAL (shift-share IV corroboration leg de-scoped)")
===== HONEST RESULT =====
eta_hat : None (NOT ESTIMATED)
on_bound : True
identified : False
Deliverable (verbatim choose_deliverable() string from committed log):
conditional: A·� / one-sided BOUND (NOT ±0.05) — backcheck_ok=False: A unmeasurable; route to
Unidentification legs (COMPUTED from live predicates):
Leg 1: A_hat=0 net flow cancels: real per-day net delegation � 0 (NNLS drives A→0; A·P^{−�}=0
Leg 2: beta!=1/2 basis misspecified: �̂�0.647 (CI [0.55, 0.70]) excludes exact ½; curvature bas
beta_sensitivity_arm — all points:
beta=0.55 => eta_hat = None
beta=0.60 => eta_hat = None
beta=0.65 => eta_hat = None
beta=0.70 => eta_hat = None
12Two-sided summary:
beta pinned : ~0.647, CI [0.549, 0.698]
A (amplitude) : UNMEASURABLE from net delegation flow
eta_hat : NONE (unidentified on 2 independent legs)
RDE-01 : PARTIAL (shift-share IV corroboration leg de-scoped)
## 9.2 Summary
̂ 𝛽 ≈ 0.65, distribution-free CI [0.55,0.70] (controlled within-subnet + flow-vol estimand, 70 subnets,
widened ∼ 400-day panel). GBM (𝛽 ≈ 1) refuted as a measurement artifact. ̂ 𝛽 sits in the
intermediate-leverage region (1
2,1), with Maymin’s external ̂ 𝛽 ≈ 0.57 now inside the widened CI
— the window gap resolved. 𝛽 is regime-heterogeneous (all 70 powered sub-windows unstable,
|Δslope|med = 0.380).
̂ 𝐴 = 0: net delegation flow cancels to ∼ 10−3
of gross on both deep subnets (generic validator-
reshuffling churn, not a subnet rule). NNLS drives 𝐴 → 0. The structural term 𝐴𝑃−𝜂
= 0 for any
𝜂 — 𝜂 is unidentified regardless of the basis exponent. The LOCKED D1 𝛽-sensitivity band
vacates to None everywhere; this is the honest D1 reconciliation (the band was specced before the
̂ 𝐴 = 0 backfill), not a silent override.
Partial RDE-01 closure: The shift-share IV corroboration leg (cross-subnet emission 𝜁-screen)
was de-scoped to a documented future step. RDE-01 is stated PARTIAL.
The delivered object is the 𝐴 ⋅ 𝜂 product / one-sided bound (verbatim: "conditional:
A·� / one-sided BOUND (NOT ±0.05)"). No 𝜂 point is manufactured.
## 9.2.1 Future direction
The honest path toward a quantitative 𝜂 bound passes through the price-variance channel:
̂ 𝛽 ≈ 0.65 (intermediate, between the mechanical-AMM 1
2 and GBM 1) may itself encode the
demand elasticity — if elastic staker demand adds price-level-dependent variance, 𝛽 and 𝜂 are not
independent. Identifying 𝜂 from the variance side (via 𝛽𝑡 or a time-varying CEV regime model) is
the Phase 3.5 𝜂-elasticity roadmap (separate from this phase; referenced, not expanded here).
## 10 Appendix: Claims ↔ Test Map
Every computational claim in this paper is produced by a function in analysis/etapaper/. The
REFLECTION-based completeness guard (tests/test_etapaper_claims_complete.py)
introspects every public callable in the analysis.etapaper package and fails if any function lacks
a CLAIMS.md row, making it impossible to slip an untested claim into the paper.
The full claims ↔ test ledger is at: tests/fixtures/etapaper/CLAIMS.md (18 rows, 8 decision-
driver sections).
13Table 2: Claims-to-test map.
Section API function(s) Backing test(s)
§1 artifact uncontrolled_artifact() test_uncontrolled_artifact_committed_value
§2 reconciliation within_vs_pooled() test_within_vs_pooled_*
§3 powered ̂ 𝛽 powered_within_beta() test_powered_within_beta_*
§4 regime regime_heterogeneous() test_regime_heterogeneous_*
§4 𝜂 deliverable eta_deliverable(),
beta_sensitivity_arm()
test_eta_deliverable_*,
test_beta_sensitivity_arm_all_none
§5 flow depth flow_completeness_gate(),
flow_depth_by_subnet(),
price_vs_flow_coverage()
test_flow_completeness_gate_*,
test_flow_depth_*,
test_price_vs_flow_coverage_*
§6 ̂ 𝐴 = 0 amplitude_fit(),
gross_vs_net_flow()
test_amplitude_fit_*,
test_gross_vs_net_flow_*
§7 churn churn_ratio(),
both_deep_subnets_cancel(),
nominators_doing_both()
test_churn_ratio_*,
test_both_deep_subnets_cancel_*,
test_nominators_doing_both_*
Plots beta_window_comparison_plot(),
net_flow_cancellation_plot(),
flow_depth_bar(),
price_vs_flow_coverage_plot()
test_*_plot_returns_figure
Reproduce all 63 etapaper tests:
import subprocess, sys
result = subprocess.run(
[sys.executable, "-m", "pytest",
"tests/test_etapaper_beta.py",
"tests/test_etapaper_demand.py",
"tests/test_etapaper_churn.py",
"tests/test_etapaper_eta.py",
"tests/test_etapaper_plots.py",
"tests/test_etapaper_claims_complete.py",
"-q", "--tb=short"],
capture_output=True, text=True,
cwd=str(_root)
)
print(result.stdout[-2000:] if len(result.stdout) > 2000 else result.stdout)
if result.returncode != 0:
print("STDERR:", result.stderr[-1000:])
............................................................... [100%]
63 passed in 0.78s
Black, Fischer. 1976. Studies of Stock Price Volatility Changes. 177–81.
14Chan, Kalok, G. Andrew Karolyi, Francis A. Longstaff, and Anthony B. Sanders. 1992. “An
Empirical Comparison of Alternative Models of the Short-Term Interest Rate.” Journal of
Finance 47 (3): 1209–27. https://doi.org/10.1111/j.1540-6261.1992.tb04011.x.
Cox, John C. 1975. “Notes on Option Pricing I: Constant Elasticity of Variance Diffusions.” Working
Paper, Stanford University.
Feller, William. 1951. “Two Singular Diffusion Problems.” Annals of Mathematics 54 (1): 173–82.
https://doi.org/10.2307/1969318.
Maymin, Philip Z. 2026. “Option Pricing on Automated Market Maker Tokens.” arXiv. https:
//arxiv.org/abs/2603.29763.
15