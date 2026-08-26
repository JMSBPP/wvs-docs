# BASE-01 LOCKED pre-registration — two-step review record

verdict: approved

> **Status: APPROVED (iteration 2), prose-only minors to apply.** Two parallel reviewers (Reality Checker +
> Model QA Specialist, per CLAUDE.md) reviewed the RE-LOCKED prereg (`prereg_sha256 d7300a8f…`,
> `BASE-noise-floor.json`, frozen `BASE-series.json`). Both independently reproduced all three thresholds +
> the lock hash to the last bit, confirmed outcome-blindness is mechanically enforced and the held-out tail
> untouched, and **converged: no BLOCKER, no run-gating MAJOR.** Approval is conditional on the prose-only
> relabels below (no thresholds / numbers / gate-logic change → fully outcome-blind; the apparatus Υ is still
> a stub, so nothing can be tuned to a result). Iteration 1 (on the prior lock) is preserved below for history.

## Iteration 2 — RE-LOCKED prereg (d7300a8f…) — APPROVE-WITH-MINORS

Both reviewers verified every iteration-1 BLOCKER/MAJOR is resolved with substance (not relabelling):
B1 τ_Υ re-derived WITHIN-day (two same-day referents) → 1.727; B2 split re-cut (liquid E1 runnable, adverse
E1 pre-declared `inconclusive`); M1 A2b `blocked` → μ gate A3-only; M2 A1 gate = beats-constant-G-OOS; M3
τ_IL = 1.03e-4 (price-slip + decimals). Outcome-blind allowlist signature, per-pool numéraire, I-tier
code-correctness, numéraire conversion pinned — all confirmed sound.

**The honest bound both reviewers agree the confirmatory run supports:** *"the apparatus base is INSTANTIABLE
and NOT catastrophically broken"* — `⟨L_K,μ⟩` is not collapsed to `1` (the exact NUM-04 defect), the pairing
matches the AMM's own in-range liquidity (A3), and the identities are code-correct. It does **NOT** certify
graded Υ-faithfulness (E1 is a collapse-detector at τ_Υ=1.727), per-tick μ-shape (A2b blocked), adverse-Υ
(inconclusive), or the lookback (deferred/HALT'd).

### Prose-only minors to apply before the run (both reviewers)
1. **Relabel τ_Υ** as a within-day cross-referent **disagreement** dominated by a ~2.3× definitional scale
   bias (swap-side `φ_obs·dW` is a daily volume PROXY vs the exact fee-growth accrual), NOT a "measurement
   floor"; record the debiased residual ~0.38. Keep τ_Υ=1.727 (conservative).
2. **A3 "designated, not demonstrated"** until the run instantiates it; state per-tick **μ-SHAPE faithfulness
   UNTESTED/DEFERRED** (A2b blocked); pre-declare: `Swap.liquidity` absent/null ⇒ A3 `blocked`, μ gate
   `inconclusive`, NEVER "μ verified".
3. Note `θ_G ≈ block-timing` (decimals negligible); scope E2 sign/directional-only at the top-σ adverse block;
   add the `snapshot/{pool}_daily_raw.json` sha256 hashes to the `## Lock` provenance.

**Reviewer verdicts:** Reality Checker → APPROVE-WITH-MINORS (no BLOCKER, prose-only). Model QA Specialist →
SOUND WITH FINDINGS, no BLOCKERs (the 2 "MAJORs" are text-relabels, no number changes). Both clear the run.

### Prose minors APPLIED + RE-LOCKED (Plan 05 execution, 2026-06-14)

All three prose-only minors were applied to the prereg with NO threshold / number / gate-logic change
(outcome-blind: the apparatus Υ was still a `NotImplementedError` stub at re-lock — no result to tune toward):
1. τ_Υ relabelled a within-day cross-referent DISAGREEMENT dominated by a ~2.3× definitional volume-proxy-vs-exact-accrual
   scale bias (NOT a "measurement floor"); debiased residual ~0.38 recorded; τ_Υ=1.7269 kept.
2. A3 marked "designated, not demonstrated" until the run; per-tick μ-shape UNTESTED/DEFERRED (A2b blocked);
   pre-declared `Swap.liquidity` absent/null ⇒ A3 blocked, μ gate inconclusive, NEVER "μ verified".
3. θ_G≈block-timing noted; E2 sign/directional-only scoped at the top-σ adverse block (82205689); daily_raw sha256
   hashes added to ## Lock provenance.

RE-LOCKED `prereg_sha256 = 065a8ccc72b3e6589d9d47f7b8bf472f49794c32767aeb8a8e8e9a34b95fe269` (supersedes the
Plan-04 lock `d7300a8f…`; placeholder-restored hash, self-consistent and reproducible). Verdict UNCHANGED: approved.

---

## Iteration 1 — first locked prereg (de337149…) — needs-work (RESOLVED in the re-lock)

Both reviewers found: **B1** τ_Υ=0.806 was cross-DAY fee-revenue dispersion, not a within-day measurement
floor (a ~4.5-OOM blind band on E1); **B2** adverse held-out E1 empty (1/4 positive referent); **M1** A2b
unrunnable (no per-tick fee-growth frozen); **M2** θ_G placeholder; **M3** τ_IL too tight → false HALT.
Confirmed sound even then: outcome-blindness real (Υ is a stub), L_K 24/24 exact, per-pool numéraire,
I-tier-not-the-gate. **All B1/B2/M1–M3 were resolved in the re-open + re-lock** (commits 33f47e2/bb548e7),
which iteration 2 above reviewed and approved.
