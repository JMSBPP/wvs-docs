---
sha256: d7cfc0985bf629ec6f7792d1a9b1dcaf009cff628b3854068342380d3b7ff3f0
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 18786
---
On-Chain Parametric Cost Insurance for Underserved
Latin-American Digital Workers
Record of Closed Iterations and Request for Methodological Guidance
d2
nance
github.com/wvs-finance
2026-05-06
1. Motivation, problem, suggested solution, challenges
Motivation. We study Latin-American digital workers paid in Colombian pesos who carry
recurring USD-denominated professional-input obligations (subscription AI services, API
usage fees, cloud compute, software-as-a-service spend), a population whose macro-risk
exposure is dominated by FX volatility: for the Colombian case specically, the FX market
is the ecient aggregator of macro shocks, with TES yields and core ination operating
as followers of the COP/USD path (Rincón-Torres et al., 2021, 2023; Rincón-Castro et al.,
2021; Fuentes et al., 2014); the same FX-as-primary-transmission pattern is documented
across emerging markets generally (Calvo and Reinhart, 2002; Rey, 2015; Bruno and Shin,
2015).
Problem. When the COP weakens against the USD, the USD-denominated cost line translates
into unbudgeted COP expenditure. Existing risk-management practice for this population
is indirect: USD hoarding via neo-bank dollar-savings products (e.g., Littio, Global66,
Nubank's USD wallet pilot) and informal hard-currency holdings, rather than a direct
convex hedge on the COP/USD path. To the project's knowledge, no Colombian retail-
bank or ntech product currently oers a parametric FX-call-option-style cost-insurance
contract at the hundred-to-low-thousands-USD monthly notional these workers carry; the
indirect substitutes charge no explicit premium for convexity and provide no claim-on-
realisation against an exchange-rate threshold. The supervisor is invited to ag any product
the project has missed in this scan.
Suggestedsolution. We identify the macro risks X that quantitatively produce these cost
shocks, validate them empirically, and design parametric cost-insurance products that com-
pensate for the FX-pass-through exposure (Carter et al., 2017; Mahul and Stutley, 2010;
Clarke, 2016). The demand pattern we target  underserved-country households purchas-
ing depreciation insurance in the form of a call option on the foreign-exchange rate  is
documented in a recent practitioner interview (Leifke, 2026): the instrument that people
really care about, especially in emerging markets, is more of like a devaluation insuranceSupervisor-Review Memorandum May 7, 2026
policy . . . call options are kind of perfect for this because you don't need a credit rela-
tionship. You just pay a premium upfront. The intermediation product compensates the
worker in a unit she actually spends (COP, or a COP-pegged purchasing-parity stablecoin);
the implementation venue is on-chain settlement infrastructure (described in the 37-page
technical companion 4), not the economic primitive.
Challenges.
 Identication posture  predictive versus causal (see 4.2).
 Convex-payo suciency under insurance-underwriting standard (see 4.2).
 Multi-Y dierential calibration; familywise versus false-discovery correction across
legs (see 4.2).
 Anti-shing protocol defensibility  pre-registration thresholds NMIN = 75, POWERMIN =
0.80, MDESSD = 0.40 (see 4.2).
 Cross-iteration familywise error and iteration-selection bias (see 4.2).
Bridgeto2. We have run four iterations to date, all closed or parked; the model specications,
results, and failure post-mortems follow in Section 2. (A fth iteration  Pair D, on
Colombian young-worker employment in the broad services aggregate  closed PASS but
is omitted here on population-orthogonality grounds: its target population is BPO young-
worker employment, not the digital-worker FX-pass-through cost-shock population in scope
for the present letter; that iteration's record is preserved in the 37-page technical companion
and in the project memory.)
2. Four iterations
dev-AIStage-1SectionJICTthroughCOP/USDlag(FAIL). Colombian young
workers (1428) restricted to CIIU Rev. 4 Section J (Information and Communication, Divisions
5863), with monthly cadence, FEX_C_2018 expansion factors, and the lag panel detailed below.
Yt = α + β6 Xt−6 + β9 Xt−9 + β12 Xt−12 + εt
where Yt = logit(shareJ
t ) and Xt−k = log(COP/USDt−k); pre-registered H1 : βcomposite > 0.
Data. Source: DANE GEIH micro-data restricted to CIIU Rev. 4 Section J (Divisions 58
63); Banrep TRM. Frequency: monthly. Window: 2015-01-31 through 2026-03-31. Sample:
N = 134 monthly. Transformations:logit on Section-J share; log-level on FX; same lag panel
as Pair D; HAC(L = 12); FEX_C_2018; empalme residual-bias diagnostic at the 2020-12 → 2021-
01 Marco-2018 boundary. Repo:notebooks/dev_ai_cost. Specsha:7c72292516...751f5a.
Result. β̂composite = −0.14613, HAC SE 0.0847, t = −1.726, one-sided p ≈ 0.958 against
H1 : β > 0; R-classier MIXED (3 of 4 R-rows agree on negative sign). Interpretation. FAIL
 sign-ipped at Section-J narrow cut. Why it fails. The Section-J substrate does not exhibit
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 2 built May 7, 2026Supervisor-Review Memorandum May 7, 2026
the lagged-FX-pass-through-to-employment pattern the BPO-oshoring narrative pre-supposed;
an empalme-residual bias surfaced (the Phase-1 boundary diagnostic returned a +0.375 logit-Y
jump at the 2020-12 → 2021-01 Marco-2018 boundary against a ±0.335 envelope), so the post-
2021 level shift is not fully neutralized at the Section-J cut. The R2 Section-M sensitivity arm
(CIIU Sections 6975) returned β̂composite = +0.45482801, t = +4.73, p = 1.13×10−6, but this is
a not-pre-registered candidate-next-iteration object, not a graduated PASS, and the rejection at
Section-J falsies the per-user instrument design that the dev-AI-paying population would have
hosted.
FX-vol-CPI surprise  Colombian CPI through TRM realised volatility (FAIL).
Colombian corporates and remittance recipients with FX-volatility exposure on COP/USD around
DANE CPI publication, weekly cadence on a Friday anchor, with Yw the weekly realised volatil-
ity of the Banrep TRM daily log-return panel and the regressor the lagged signed AR(1) CPI
surprise.
RVCOP/USD
w = α + β SurpCPI
w−1 + εw
where RVw is realised volatility in week w and SurpCPI
w−1 is the lagged signed monthly CPI surprise
mapped to weekly cadence (carried across the release week, zero otherwise), with a small set of
macro-surprise controls in the primary. Data. Source: Banrep TRM daily log-return panel;
DANE CPI release calendar + realized values for AR(1) surprise construction. Frequency:
weekly (Friday anchor). Window: 2008-01-02 through 2026-02-23. Sample: N = 947 weekly.
Transformations: weekly RV from daily log-returns; signed AR(1) CPI surprise mapped to
weekly cadence (carried across release week, zero otherwise); HAC(4) Newey-West SE; small
set of macro-surprise controls. Repo: notebooks/fx_vol_cpi_surprise. Specngerprint:
nb1_panel_fingerprint.json. Result. β̂CPI = −0.000685, HAC(4) SE 0.001794, 90% interval
[−0.003636, +0.002266] contains zero; gate criterion β̂−1.28·c SE = −0.002981 < 0 res the FAIL.
Interpretation. FAIL  no weekly-RV response to CPI surprises. Why it fails and sensitivity
caveat. The pre-registered T1 exogeneity test rejects at F = 15.12, p ≈ 1.3 × 10−9, so the
iteration is a predictive regression rather than a structural-causal one and β̂ cannot be read as an
impulse-response. Two pre-registered sensitivities returned positive signicant 90% intervals at
the one-sided α = 0.05 convention  A1 monthly cadence β̂ = +0.0152 on [+0.0057, +0.0246];
A4 release-day-excluded β̂ = +0.0033 on [+0.0005, +0.0062]  but neither is the iteration's
main nding: the pre-registered weekly primary is the result, and A1/A4 sit as candidate inputs
to a possible future monthly-cadence-primary specication rather than as a rescue of the weekly
primary.
Phase-A.0RemittanceColombianremittancecorridorthroughFX(EXIT_NON_REMITTAN
Colombian household remittance recipients indexed against the Colombian remittance corridor
with FX pass-through, with Yw inherited from the FX-vol weekly panel and Xw−1 a candidate
on-chain remittance-ow proxy constructed from cCOP and COPm aggregate user activity on
Celo.
RVCOP/USD
w = α + β ∆RemitCol
w−1 + εw
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 3 built May 7, 2026Supervisor-Review Memorandum May 7, 2026
where ∆RemitCol
w−1 is the lagged Colombian household-remittance ow change as proxied on
Celo on-chain activity, partitioned to attempt to isolate household remittance from third-party-
DEX activity, treasury roundtripping, and bot arbitrage. Data. Source (planned): Ban-
rep monthly remittance + Celo on-chain cCOP / COPm aggregate user activity. Frequency:
weekly (planned; never reached nal N). Window:2024-09 through 2026-04 (planned). Sam-
ple:not produced  exited pre-estimation. Transformations:pre-registered partition rule for
household remittance vs third-party-DEX activity, treasury roundtripping, bot arbitrage; never
executed. Spec:docs/specs/2026-04-20-remittance-surprise-trm-rv-design.md (no note-
book directory  spec exited pre-estimation). Specchain: Phase-A.0 Rev 4.1 (kill-criterion-
bearing). Result. No empirical estimate produced  exited on kill criteria pre-estimation 2026-
04-24. Interpretation. EXIT  never estimated; killed by k1 + partial-k2. Why it exits.
Task 11.F Axis-1 event research returned zero of thirty peak-day ows ngerprinting as remit-
tance, with approximately 87% of surveyed ow decomposing into TRM arbitrage, treasury
roundtripping, campaigns, and bot activity; the cCOP/COPM aggregate user activity on Celo
is third-party-DEX volume, not Colombian household remittance, so no post-hoc lter could
reconstruct an X-driver that was never measured upstream. The exit is load-bearing on the
kill-criterion discipline: absent the pre-registered EXIT, the rev-4 plan's non-stop lter iteration
would have run to a lter that appeared to rescue a signal that was never captured.
P1BittensorSN18event-studyapparatus(PARKED). The proprietary-AI policy-
shock-exposed population (LATAM developers paying USD-denominated AI APIs as the down-
stream candidate; the apparatus pre-dates target-population narrowing), with Yt a Bittensor
SN18 (Cortex.t) alpha event-study indicator and Xt a set of pre-pinned policy-event dates (Bit-
tensor halving 2025-12-15; dTAO mainnet activation 2025-02-13; Cortex.t milestones).
ARi,τ = αi +
+L X
τ=−L
γτ 1{ti + τ ∈ E} + εi,τ
where ARi,τ is the event-window abnormal alpha indicator at relative time τ for event i, E is the
pre-pinned policy-event set, and the apparatus is evaluated over a nine-cell verdict cube (verdict-
eligibility crossed with robustness-consistency), Bonferroni-corrected at αprimary = 0.0167 over
the conjunctive family P1+P2+P3 with Nevents
min = 8 and an asymmetric placebo gate. Data.
Source:Bittensor SN18 (Cortex.t) alpha event-study; pre-pinned policy-event dates (Bittensor
halving 2025-12-15; dTAO mainnet 2025-02-13; Cortex.t milestones). Frequency:event-window
(asymmetric L). Window:per-event ±L. Sample:planned Nevents
min = 8; data ingest deferred.
Transformations: event-window abnormal-alpha indicator; nine-cell verdict cube; Bonferroni
at αprimary = 0.0167 over P1+P2+P3. Spec:docs/specs/2026-04-27-p1-sn18-event-study-design.md
(no notebook directory  apparatus parked pre-ingest). Spec sha: f855e036d3...b47aeab.
Result. None  apparatus parked for the record on 2026-04-27; no graduating empirical claim
produced. Interpretation. PARKED  apparatus complete, no claim graduated. Why parked.
Apparatus complete; no graduating empirical claim. The user pivoted to the simple-composite-β
fast-lane track (Pair D, dev-AI Stage-1) and parked P1 to preserve the intellectual capital of the
spec work, with re-activation conditions documented in the parking memory.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 4 built May 7, 2026Supervisor-Review Memorandum May 7, 2026
3. Risk-target framing
The risk target is FX-volatility exposure for a specic population: Latin-American digital workers
paid in Colombian pesos (COP cash-ows) but carrying recurring USD-denominated professional-
input obligations. When the COP weakens against the USD, the USD-denominated cost line
translates into an unbudgeted COP-expenditure increase. The intermediation product target is a
contract that compensates for this FX-pass-through cost shock, denominated in a unit the worker
actually spends (COP, or a COP-pegged purchasing-parity stablecoin). The Abrigo Lemma's
abstract Yinequality(t) = Ra(t) − Rc(t) framing  present in the 37-page technical companion 3
 is the eventual analytical generalisation; the entry-point letter introduces the concrete target
only.
4. Asks
4.1 Suggested specications
We invite the supervisor to suggest the (Y,X) pair, lag structure, sample window, primary
inference convention, and robustness arms for the next iteration. Specically: which sectoral cut
should follow the dev-AI Section J FAIL given the R2 Section M sensitivity signal (CIIU Rev. 4
Sections 6975: consultancy, scientic, administrative); whether to repeat the FX-vol-on-CPI-
surprise primary at A1 monthly cadence as the next pre-registration; or whether to pivot to a
non-Colombian LATAM panel.
4.2 Risks
The bullets below are risks the project has already identied; we ask the supervisor to add risks
we have not agged.
 Identication posture  predictive-regression versus structural-causal; T1 exogeneity re-
jected on FX-vol; HAC xed-L per iteration.
 Convex-payo suciency under insurance-underwriting standard  mean-β̂ is necessary
but not sucient; Carter et al. (2017), Mahul and Stutley (2010), and Clarke (2016) set
the standards.
 Multi-Y dierential calibration  joint-leg correlation, FWER versus FDR, regime-switching.
 Anti-shing protocol defensibility  NMIN = 75, POWERMIN = 0.80, MDESSD = 0.40
inherited from Phase-A.0 Rev-5.3.1, not re-derived.
 Cross-iteration FWER and iteration-selection bias  ve closed iterations across the
project roster (the four presented here plus Pair D, omitted on population-orthogonality
grounds); meta-multiple-comparison concern; Heckman (1979) as candidate frame.
 Stambaugh small-sample bias on persistent-regressor predictive regressions  Stambaugh
(1999), Phillips (2014); log-FX is near-unit-root at monthly frequency.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 5 built May 7, 2026Supervisor-Review Memorandum May 7, 2026
 Empalme residual bias  DANE Marco-2018 methodology break not fully neutralised;
surfaced in dev-AI Stage-1 NB02 Trio 1 boundary anomaly.
4.3 Bibliography
The current bibliography is documented in the 37-page companion's Appendix B and is repro-
duced as refs.bib. We invite the supervisor to recommend additional references he considers
load-bearing for the framework's empirical work, particularly on (a) parametric-index insurance
pricing in low-counterparty-credit-standing populations, (b) sectoral employment-share predic-
tive regressions on real-eective-exchange-rate panels, and (c) cross-iteration false-discovery-rate
correction regimes for observational pre-registration.
4.4 Connections
We invite the supervisor to introduce the project to other researchers, practitioners, or insti-
tutions whose work might complement this iteration roster  including but not limited to
parametric-insurance underwriters with LATAM exposure, FX-derivatives operators serving sub-
corporate notionals, on-chain settlement engineers, and applied econometricians working on pre-
mature deindustrialization in Latin America. The framework's empirical work is open to col-
laboration; the supervisor's network is the most ecient channel for identifying complementary
contributors.
References
Valentina Bruno and Hyun Song Shin. Cross-border banking and global liquidity. The Review
of Economic Studies, 82(2):535564, 2015.
Guillermo A. Calvo and Carmen M. Reinhart. Fear of oating. The Quarterly Journal of
Economics, 117(2):379408, 2002.
Michael R. Carter, Alain de Janvry, Elisabeth Sadoulet, and Alexandros Sarris. Index insurance
for developing country agriculture: A reassessment. World Development, 94:199216, 2017.
Daniel J. Clarke. A theory of rational demand for index insurance. American Economic Journal:
Microeconomics, 8(1):283306, 2016.
Miguel Fuentes, Pablo Pincheira, Juan Manuel Julio, Hernán Rincón, Santiago García-Verdú,
Miguel Zerecero, Marco Vega, Erick Lahura, and Ramon Moreno. The eects of intraday
foreign exchange market operations in Latin America: results for Chile, Colombia, Mexico
and Peru. Borradores de Economía 849, Banco de la República, Bogotá, 2014. Co-indexed as
BIS Working Paper No. 462.
James J. Heckman. Sample selection bias as a specication error. Econometrica, 47(1):153161,
1979. doi: 10.2307/1912352.
Robert Leifke. Builder stories: Inside numo. Interview, Atrium Academy (YouTube), https:
//www.youtube.com/watch?v=-nPTjKRMSK8&t=1115s, March 2026. Streamed live 2026-03-18.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 6 built May 7, 2026Supervisor-Review Memorandum May 7, 2026
Quote on emerging-market demand for FX-depreciation insurance as a call option at 18:35
19:20.
Olivier Mahul and Charles J. Stutley. Government Support to Agricultural Insurance: Challenges
and Options for Developing Countries. World Bank, Washington, DC, 2010.
Peter C. B. Phillips. On condence intervals for autoregressive roots and predictive regression.
Econometric Theory, 30(3), 2014.
Hélène Rey. Dilemma not trilemma: The global nancial cycle and monetary policy indepen-
dence. NBER Working Paper No. 21162, 2015.
Hernán Rincón-Castro, Norberto Rubiano-López, Julián Yaya-Garzón, and Héctor Zárate-
Solano. Traspaso de la tasa de cambio a la inación básica en Colombia. Borradores de
economía, Banco de la República, Bogotá, 2021.
Andrés Rincón-Torres, Nicolás Rojas-Silva, and Juan Manuel Julio-Román. The interdependence
of FX and Treasury bonds markets: The case of Colombia. Borradores de Economía 1171,
Banco de la República, Bogotá, 2021.
Andrés Rincón-Torres, Daniel De la Hortúa-Pulido, Nicolás Rojas-Silva, and Juan Manuel Julio-
Román. The low frequency eect of macroeconomic news on Colombian government bond
yields. Borradores de economía, Banco de la República, Bogotá, 2023.
Robert F. Stambaugh. Predictive regressions. Journal of Financial Economics, 54(3), 1999.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 7 built May 7, 2026