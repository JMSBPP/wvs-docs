# NUM-04 — Layer-B realized-fee replication on the FROZEN REAL Dune path

**Status:** `fail`  &nbsp; **seed:** 0  &nbsp; **sim_path:** False  
**data_source:** `dune:7717175+7717181`  
**series_sha256:** `41f583aad9a1860e6c389521d1f128fd567533009627c8a44e1f06b91a3aadad`  
**uv_lock_sha256:** `b4f8ac96c98801469246d1b376fd6a3e4df45baeea03786a7224a155e9a088c7`

## What Layer B measures

residual_over_target = |Upsilon_T - Pi^target - r_f*P_LBC(0)| / |Pi^target| <= tau_B on HELD-OUT real-path segments (NUM-03 sec.2.1); NOT a curve-fit to Pi^target — Upsilon_T accrues the REALIZED phi_obs, not phi_bar*.

- Layer-B held-out real-path segments disjoint from the chronological 70% tuning segment (NUM-03 sec.10); residual_over_target reported per held-out segment, worst-case aggregated per pool, then over pools.
- harness: sim_replicate.replicate / lookback_target / accrue_upsilon (built + self-tested in Plan 02-03); this driver imports and runs them on the REAL path (no re-derivation).
- The residual is shown to reduce to the **risk-free term** `r_f * P_LBC(0)` explicitly (reported per held-out segment), so a small residual is demonstrably the risk-free residual — not merely 'small'. This is a held-out replication check, NOT a curve-fit to `Pi^target`.

## Headline gate vs the LITERAL NUM-03 tau_B = 0.25

worst-segment `residual_over_target` (over all pools, all held-out segments) = **108164.08811398761**  &nbsp; vs tau_B = 0.25  => **FAIL**

## Per-pool, per-held-out-segment replication

| Pool | Seg | rows | n | T (s) | Upsilon_T | Pi^target | r_f*P_LBC(0) | residual_over_target | vs tau_B |
|------|-----|------|---|-------|-----------|-----------|--------------|----------------------|----------|
| adverse | 0 | [221, 253] | 32 | 15445409 | 0.0455323 | 0.726275 | 0.0195908 | 0.964282 | FAIL |
| adverse | 1 | [253, 284] | 31 | 14892096 | 1.77245 | 0.906508 | 0.018889 | 0.934414 | FAIL |
| adverse | 2 | [284, 316] | 32 | 21636386 | 1.83647 | 0.837407 | 0.0274434 | 1.16027 | FAIL |
| liquid | 0 | [240, 275] | 35 | 11750398 | 107036 | 0.989557 | 0.0149041 | 108164 | FAIL |
| liquid | 1 | [275, 309] | 34 | 11404601 | 42634.5 | 0.499783 | 0.0144655 | 85305.1 | FAIL |
| liquid | 2 | [309, 344] | 35 | 11750399 | 18914.6 | 0.644878 | 0.0149041 | 29329.6 | FAIL |

## Per-pool verdict

| Pool | Role | n_obs | worst residual_over_target | status |
|------|------|-------|----------------------------|--------|
| adverse | adverse | 316 | 1.1602725892948105 | fail |
| liquid | liquid | 344 | 108164.08811398761 | fail |

## Verdict

Overall Layer-B status: **`fail`** (worst-segment residual_over_target 108164.08811398761 > tau_B 0.25). tau_B was READ from the committed NUM-03-prereg.md, never re-chosen; the gate is the held-out residual-reduces-to-risk-free inequality, not a curve-fit.

## Economic Meaning

Layer B asks whether the *realized fee revenue* `Upsilon_T = sum phi_obs*dW` an LP actually earns on the real QuickSwap-V3-Polygon price path replicates a bank's path-dependent **lookback liability `Pi^target`** down to a pure risk-free residual `r_f*P_LBC(0)` — i.e. whether holding the LP position hedges a running-max payoff. Driving the 02-03 harness with the FROZEN REAL Dune path on held-out segments turns the Shreve replication assertion into a falsifiable, re-runnable empirical check on real market dynamics.

