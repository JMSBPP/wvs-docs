---
sha256: 6792f1554cf4d2a896b5f71126133a19d201df161dd5dd0cd8c10f13aa626109
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 74511
---
VOLATILITY_INSTRUMENTS
NOTE: CALCULUS IS THIS ONE . We need to fgind the discrete ficnacnial caluclus pdf byut
Frogy eithr online or locally
PAYOFF
Definition 1 (Volatility option). Fix a strike variance 𝜎2
𝐾. The volatility option with vega notional
∆𝑄𝑣 is the contract paying
𝜋𝜎 = ∆𝑄𝑣
(
𝜎2 (𝑖(𝑡)) − 𝜎2
𝐾
)+
where 𝜎2(𝑖(𝑡)) is the realized tick variance. Consequently ∆𝑄𝑣 ≡ ∆𝜋𝜎∕∆
(
𝜎2(𝑖(𝑡)) − 𝜎2
𝐾
)+
: the notional is
the option’s vega.
Convention 2 (Volatility tick argument). Volatility always takes a tick argument: 𝜎2(𝑖(𝑡)) is the
variance along the tick path at calendar time 𝑡, 𝜎2(𝑖(𝑇)) its value at the horizon 𝑇, and 𝜎2(𝑖𝐾) ≡ 𝜎2
𝐾 the
strike variance at the strike tick — the subscript form is declared shorthand for the tick-argument form, as
is 𝜎2
𝑅(𝑇) ≡ 𝜎2(𝑖(𝑇)). A bare 𝜎2 is not well-formed. (Adopted from the converted region upward; the sections
below are swept as the pair pass reaches them.)
Settlement form of Definition 1. At unit notional, the contract settles on realized variance at the
horizon:
𝜋𝜎 (𝜎𝐾,𝑇;𝑡) =
(
𝜎2(𝑖(𝑇)) − 𝜎2(𝑖𝐾)
)+
Following VOL_SWAPS, the price of the volatility option is the cost of replicating it with options. This is
where panoptic enters. The replication proved in-tree is the ladder form (the 𝜉⋆ log-contract weights,
variancePortfolio_upsilon); whether it collapses to a two-instrument affine form 𝑝𝜋𝜎 = 𝑝0 +
𝑎1 𝑝𝜋call + 𝑎2 𝑝𝜋put is OPEN — statement parked pending the liquidity-side definitions, per the 12.1 ledger.
Definition2(Theta). Thetheta ofthecall(resp. put)atstriketick𝑖𝐾 istheper-time-steppayoffvariation
𝜃
(
𝑝(𝜂,∆𝑖) (𝑖;𝑡),𝑝(𝜂,∆𝑖) (𝑖𝐾),𝜎(𝑖(𝑡))
)
≡
∆𝜋call | put
∆𝑡
The strike is the price at the STRIKE TICK 𝑖𝐾, on the price grid 𝑝(𝜂,∆𝑖) defined under the pricing geometry
below (VolInstrument.priceEta).
Proposition 2 (Closed form of 𝜃). Under the price grid 𝑝(𝜂,∆𝑖),
𝜃 =
𝑝(𝜂,∆𝑖) (⋅)𝜎(𝑖(𝑡))
√
8𝜋𝑡
exp
(
−
[
− ln
(𝑝(𝜂,∆𝑖) (𝑖(𝑡0))
𝑝(𝜂,∆𝑖) (𝑖𝐾)
)
+
𝜎2(𝑖(𝑡))𝑡
2
]2
2𝜎2(𝑖(𝑡))𝑡
)
Rule 1 (Option pricing). The protocol prices the call (resp. put) at strike tick 𝑖𝐾 as accumulated theta
along the realized tick path:
𝑝𝜋call | put (𝑡) ← ∫
𝑡
𝑡0
𝜃
(
𝑝(𝜂,∆𝑖) (𝑖;𝑠),𝑝(𝜂,∆𝑖) (𝑖𝐾),𝜎(𝑖(𝑠))
)
⫌𝑠
The left arrow marks a Rule, not an identity: this is a stipulation of the protocol, and the implementation
either complies with it or does not.
1RESOLVED (user ruling, 2026-08-03): exponent sign is NEGATIVE. Two-part justification:
(i) with the display’s own prefactor 𝑝(⋅)𝜎∕
√
8𝜋𝑡, the bracket is −𝜎
√
𝑡𝑑2, so the negative
sign gives 𝑒−𝑑2
2
∕2
∝ 𝜑(𝑑2) — exactly the 𝑟 = 0 Black–Scholes dt-leg 𝜃 = 𝑆𝜎𝜑(𝑑1)∕(2
√
𝑡) via
𝑆𝜑(𝑑1) = 𝐾𝜑(𝑑2); (ii)DECISIVEandinternal: 𝑝𝜋call|put ← ∫ 𝜃 overthepricegridCONVERGES
only with the negative sign (Gaussian tails) — under + the assignment defining the option
prices diverges. The ATM form cannot discriminate (theta_atm_closed_form, exponent
vanishes ATM); the tails do.
Definition 4 (Upsilon). The upsilon of a premium or payoff functional at strike tick 𝑖𝐾 is its per-unit-
variance sensitivity, as a lattice finite difference in the variance argument:
𝜐
(
𝑝(𝜂,∆𝑖) (𝑖;𝑡),𝑝(𝜂,∆𝑖) (𝑖𝐾)
)
≡
∆𝜋call | put
∆𝜎2 (⋅)
Proposition 3 (Vega bridge). On the region where the volatility option is in-the-money at both variance
endpoints (𝜎2(𝑖𝐾) ≤ 𝜎2(𝑖(𝑡)) and 𝜎2(𝑖𝐾) ≤ 𝜎2(𝑖(𝑡)) + ∆𝑠), its upsilon is its vega notional:
𝜐
(
𝜋𝜎
)
= ∆𝑄𝑣
— the dimensional bridge the identification sought: 𝜐 occupies the ∆𝑄𝑣 slot (= ∆𝑄𝑀∕𝑝risk via
Flow.deltaShares). Off that region the recovery FAILS by construction (the kink); the ATM/OTM null
is recorded as a conjecture, unproven.
Definition 5 (Replicating portfolio). The replicating portfolio Πcall|put(𝜎;𝑝(𝜂,∆𝑖)(𝑖;𝑡)) is the option
portfolio whose sensitivity to realized variance is independent of the underlying price PG7 — a single
option cannot serve, since a price move alters its variance sensitivity.
Convention 1 (Replication relation). For payoff claims 𝐴,𝐵 we write 𝐴 ≡𝑅 𝐵 — “𝐴 is replicated
by 𝐵” — when 𝐵’s payoff reproduces 𝐴’s. This is a claim about two objects, not a definitional identity:
each instance must be proved, and until it is, it is stated OPEN. (This is the relation the two-instrument
question above is posed in.)
Definition 6 (Log portfolio). For 𝑝⋆ the approximate at-the-money forward level marking the boundary
between liquid puts and liquid calls PG9, the log portfolio and its running form are
Πcall|put
(
𝜎;𝑝(𝜂,∆𝑖)(𝑖;𝑡)
)
=
𝑝(𝜂,∆𝑖)(𝑖;𝑡) − 𝑝⋆
𝑝⋆
− log
(𝑝(𝜂,∆𝑖)(𝑖;𝑡)
𝑝⋆
)
+
𝜎2(𝑖(𝑡))𝑡
2
(at 𝑡 = 0 the running term vanishes; Π ≥ 0 with Π(𝑝⋆) = 0). Its unit-vega normalized form (Theorem
3’s Id𝑁𝜎
), with the remaining-variance tail:
Πcall | put (𝜎;𝑝(𝜂,∆𝑖) (𝑖;𝑡);𝑇) = Id𝑁𝜎
[𝑝(𝜂,∆𝑖) − 𝑝⋆
𝑝⋆
− log(
𝑝(𝜂,∆𝑖)
𝑝⋆
)
]
+
𝑇 − 𝑡
𝑇
𝜎2(𝑖(𝑡))
Settlement instantiation (Convention 2): Πcall|put
(
𝜎2(𝑖(𝑇)); 𝑝(𝜂,∆𝑖)(𝑖;𝑡); 𝑇
)
= Id𝑁𝜎
[𝑝(𝜂,∆𝑖)−𝑝⋆
𝑝⋆
−
log(
𝑝(𝜂,∆𝑖)
𝑝⋆
)
]
+
𝑇−𝑡
𝑇
𝜎2(𝑖(𝑡)).
Proposition 4 (Ladder replication). The volatility option is replicated by the log portfolio:
𝜋𝜎(𝑡) ≡𝑅 Πcall|put
(
𝜎;𝑝(𝜂,∆𝑖)(𝑖;𝑡)
)
and Π has Definition 5’s defining property: its variance sensitivity is constant in the underlying price,
𝜐(Π) = 𝑇∕2.
2Status: the ≡𝑅 core is adapted from the variance-swap text Demeterfi and is OPEN in-tree — Conven-
tion 1’s discipline applies. PROVED: the sensitivity half. OWED: the payoff-reproduction step connecting
variancePortfolio to volOptionPayoff — an Aristotle target.
Rule 3 (Ladder allocation). The protocol realizes the log portfolio on the grid as the strike ladder — the
weight profile 𝓁(𝜉⋆,𝜄;𝑖𝐾) being a geometric liquidity distribution in the sense of the Bunni v2 whitepaper
(whose general LDFs 𝓁LDF(𝜃LDF;𝑖𝐾) are the declared FUTURE MILESTONE, G4):
Πcall|put
(
𝜎;𝑝(𝜂,∆𝑖)(𝑖;𝑡)
)
←
∑
𝑖𝐾
𝐿(𝑖𝐾)Πcall|put
(
𝜎𝐾;𝑝(𝜂,∆𝑖)(𝑖;𝑡)
)
, 𝐿(𝑖𝐾) = ̄ 𝐿𝓁(𝜉⋆,𝜄;𝑖𝐾)
The left arrow marks the Rule: an allocation the protocol enforces, not an equality — Πcall|put(𝜎𝐾;⋅)
is the per-strike member at strike tick 𝑖𝐾, and 𝐿 is Definition 7’s ladder. Whether the enforced ladder’s
payoff reproduces the log contract is part of Proposition 4’s OPEN core, not asserted here.
Definition 7 (Liquidity ladder). Per strike tick 𝑖𝐾, the ladder allocates the total liquidity ̄ 𝐿 by the
geometric weight profile
𝐿(𝑖𝐾) = ̄ 𝐿𝓁(𝜉,𝜄;𝑖𝐾), ̄ 𝐿 =
𝑖max ∑
𝑖𝐾=𝑖min
𝐿(𝑖𝐾), 𝓁(𝜉,𝜄;𝑖𝐾) =
𝜉𝑖𝐾
(1−𝜉𝜄
1−𝜉
)
with ladder parameter set Θ𝓁 = {𝜉,𝜄} — see PROTOCOL_PARAMETERS (Θ𝓁).
Theorem 2 (Partition of unity). The weights are a partition of unity and the 𝛿-neutral ratio is pinned:
∑
𝑖𝐾
𝓁(𝜉,𝜄;𝑖𝐾) = 1, 𝓁 > 0 (𝜉 ∈ (0,1) ∪ (1,∞)), lim
𝜉→1
𝓁 =
1
𝜄
PROTOCOL_PARAMETERS
Every parameter of the protocol enters here as a Protocol Parameter — a special definition that fully
specifies its domain, its purpose, and its economic meaning, indexed by its parameter set. A parameter
not listed here is not a parameter of the protocol.
Protocol Parameter (Θ𝓁 = {𝜉,𝜄} — the ladder).
• 𝜉 — the liquidity ratio. Domain: 𝜉 ∈ (0,1) ∪ (1,∞); 𝜉 = 1 is reached by limit only (Theorem 2).
Purpose: sets the geometric decay of per-strike liquidity in the ladder (Definition 7); with 𝜄, encodes
the strike weights that make the portfolio delta-neutral. Economic meaning: the ratio of liquidity
between adjacent strikes; pinned at 𝜉⋆ = 𝜆−∆𝑖∕2, the log-contract weight law under which the ladder
replicates the variance payoff (Proposition 4).
• 𝜄 — the ladder resolution. Domain: 𝜄 ∈ ℕ, 𝜄 ≥ 1. Purpose: the number of strikes carrying the
ladder (Definition 7); the weight profile lives on the simplex ∆𝜄−1; with 𝜉, encodes the delta-neutral
strike weighting. Economic meaning: the resolution at which the continuous log-contract strip is
discretized — the finite-strip replication error and the G4 underspecification deficit (𝜄 − 2) are both
functions of it.
Protocol Parameter (Θ𝑝 = {𝜂,∆𝑖} — the pricing geometry).
• 𝜂 — the grid exponent. Domain: 𝜂 > 0 (jointly with ∆𝑖 > 0 this is exactly the strict-monotonicity
hypothesis 𝜂∆𝑖 > 0, priceEta_strictMono; 𝜂 = 1 is the canonical grid). Purpose: the one-
parameter deformation of the tick-price law (Definition 8) — the exponent tilting the grid away from
3the square-root-price member. Economic meaning: the grid-side tilt dial. It is not the trading-curve
share: 𝜂 enters the curve only through the proven bridge 𝜒𝑋∕𝑀(𝜂) = Λ(𝜂∆𝑖 ln𝜆∕2), and the genuine
curvature 𝜅𝜑 does not depend on it at all (a function of 𝜖𝑋∕𝑀 alone).
• ∆𝑖 — the tick spacing. Domain: ∆𝑖 > 0 (the Lean leg-nonnegativity theorem needs ∆𝑖 ≥ 0 in
addition to 𝜂∆𝑖 > 0; on-chain it is the positive integer tick spacing of UNI_V3). Purpose: grid
granularity — the quantization step at which strikes, hence ladder legs, may sit (Definition 8).
Economic meaning: the spacing pins the ladder ratio 𝜉⋆ = 𝜆−∆𝑖∕2 (Θ𝓁 entry) and sets the per-spacing
price step 𝜆𝜂∆𝑖∕2 — the coarseness lever coupling the pricing geometry to the replication ladder.
On the grid, 𝜂 and ∆𝑖 are REDUNDANT — they enter only through the product 𝜂∆𝑖 (Theorem
21); they separate off-grid (𝜉⋆, Proposition 6).
Protocol Parameter (Θ𝜑 = {𝜒𝑋∕𝑀,𝜖𝑋∕𝑀} — the trading curve).
• 𝜒𝑋∕𝑀 — the share parameter. Domain: 𝜒𝑋∕𝑀 ∈ (0,1) (Definition 12). Purpose: the exponent
weighting the ∆𝑄𝑀 leg of the trading function (Definition 12); first slot of the subscript tuple
(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀). Economic meaning: the SHARE (distribution) parameter — the fraction of pool value
held in the ∆𝑄𝑀 leg; it says WHERE the value sits. 𝜒𝑋∕𝑀 = 1∕2 is the balanced pool; moving it tilts
inventory toward one leg WITHOUT changing how the curve resists trade. Via the proven bridge
𝜒𝑋∕𝑀∕(1 − 𝜒𝑋∕𝑀) = 𝜆𝜂∆𝑖∕2 it is an observable of the price grid, not an independent primitive —
subject to the OPEN leg-orientation FLAG (Definition 12), which flips the bridge.
• 𝜖𝑋∕𝑀 — the substitution parameter. Domain: 𝜖𝑋∕𝑀 ∈ (−∞,1] — 𝜖𝑋∕𝑀 = 1 the linear member
(perfect substitutes, ̄ 𝜖𝑋∕𝑀 = ∞); 𝜖𝑋∕𝑀 = 0 the defined Cobb–Douglas case (constant product);
𝜖𝑋∕𝑀 → −∞ the Leontief limit (no trade). Purpose: the substitution axis of Definition 13, second
slot of the subscript tuple; the elasticity of substitution is ̄ 𝜖𝑋∕𝑀 = 1∕(1 − 𝜖𝑋∕𝑀), and the genuine
curvature 𝜅𝜑 is a function of this axis ALONE. Proven orthogonal to the share axis (phiCES_rho_ne_
eps_axis; 𝜍𝑋∕𝑀 factors through the share, curvIndex_is_rho_zero_slice). Economic meaning:
the slippage dial — HOW HARD the pool resists being moved. This is what an arbitrageur pays for:
less substitutability means more price impact per unit extracted — and equally worse execution for
the ordinary investor, which is why both effects move together and produce an interior optimum.
Protocol Parameter (Θ𝜙 = {𝛾, ̄ 𝜙,𝛽,𝛼} — the fee schedule).
• ̄ 𝜙 — the fee floor. Domain: ̄ 𝜙 ≥ 0. Purpose: the unconditional base of the schedule (Definition 18).
Economic meaning: LPs take a base fee at every volatility — the schedule never degenerates to free
execution (Theorem 1’s lower envelope).
• 𝛼 = {𝛼𝑗,𝛼𝑅} — the surcharge scales. Domain: 𝛼𝑗 ≥ 0, 𝛼𝑅 ≥ 0. Purpose: scale each sigmoid’s
maximum(ALGEBRAeq. (4));
∑
𝑗
𝛼𝑗 timesthegateceiling𝛼𝑅 setsthewidthofTheorem1’sfeeband.
Economic meaning: the volatility surcharge budget — what heavy trading in volatile conditions can
add above the floor.
• 𝛽 = {𝛽𝑗,𝛽𝑅} — the transition midpoints. Domain: real. Purpose: place each sigmoid’s transition;
they position the ramp inside the band without moving its edges. Economic meaning: the volatility
(resp. utilization) levels at which the surcharge switches on — G3’s placement-not-level reading.
• 𝛾 = {𝛾𝑗,𝛾𝑅} — the steepnesses. Domain: 𝛾𝑗 > 0 (Theorem 1’s monotonicity hypothesis). Purpose:
the ramp steepness (single-term case: 𝑠𝑓 = 1∕𝛾0). Economic meaning: how sharply the schedule
reacts near its midpoint — the dial between smooth repricing and a near-step surcharge.
Parameter registry COMPLETE: Θ𝓁, Θ𝑝, Θ𝜑, Θ𝜙. The former Θord is NOT a parameter set — it
is user-supplied per order and lives as ℐord under # PROTOCOL_INPUTS (the third registry
class).
4PROTOCOL_CONSTANTS
Every fixed numeral of the protocol enters here as a Protocol Constant — a value the protocol fixes once,
not a design dial: it belongs to no Θ∙, and no statement may treat it as free. Indexed by its constant set.
Protocol Constant (𝒞𝑝 = {𝜆} — the pricing geometry).
• 𝜆 — the tick base. Value: 𝜆 = 1.0001 (UNI_V3). Purpose: the base of the price grid (Definition 8);
every grid ratio in the document — 𝜆−∆𝑖 (Theorem 4), 𝜉⋆ = 𝜆−∆𝑖∕2 (Proposition 6, Θ𝓁) — is a power
of it. Economic meaning: one tick = one basis point of price — the minimal price quantum of the
underlying market.
Proposition5(Single-legdirectionsensitivity). Asingleleg’svariancesensitivityisdirection-sensitive:
∆𝜋call | put
∆𝜎
≈
∆𝜃
∆𝜎
inheriting the sign of ln
(
𝑝(𝜂,∆𝑖)(𝑖;𝑡)∕𝑝(𝜂,∆𝑖)(𝑖𝐾)
)
— a single option cannot carry Definition 5’s price-
independence, which is why the ladder exists.
Status: OPEN — pinned in-tree as Upsilon.ATMOTMNullHypothesis, a Prop conjecture, no proof,
no axiom. One correction is machine-recorded and travels with it: the naive strike-centered envelope
𝑒−𝑐|𝑖−𝑖𝐾| is FALSE on the entire left branch for every 𝑐 > 0 (the forward difference is right-shifted; a
parameter-independent obstruction) — the honest envelope is centered on the peak pair {𝑖𝐾−1,𝑖𝐾}. The
conjecture’s originally named test avenue (the econometric track) is CLOSED-terminal, so it either gets a
formal proof or stays open.
Theorem 3 (Unit vega).
∆Πcall | put (⋅)
∆𝜎2
𝑁𝜎 = 𝑇∕2𝑁𝜎 ⇐⇒ Id𝑁𝜎
≡
2
𝑇
Theorem 13 (Maturity equivalence). (Moved here from # PROTOCOL_INPUTS, user ruling 2026-08-04
— both premises are this section’s results; ∆𝑄⋆
𝑣 is the target-vega Protocol Input, # PROTOCOL_INPUTS.)
From 𝜐 = 𝑇∕2 (variancePortfolio_upsilon) and Id𝑁𝜎
= 2∕𝑇 (variancePortfolio_unit_upsilon):
𝑇⋆ = 2
∆𝑄⋆
𝑣
𝑁𝜎
⇐⇒ ∆𝑄⋆
𝑣 =
𝑇⋆
2
𝑁𝜎
with ∆𝑄⋆
𝑣 ,𝑁𝜎 > 0 ⇐⇒ 𝑇⋆ > 0, and 𝑇⋆ strictly increasing in ∆𝑄⋆
𝑣 , strictly decreasing in 𝑁𝜎. The perpetual
order specifies no 𝑇; 𝑇⋆ is the implied maturity of the equivalent dated variance contract — derived from
∆𝑄⋆
𝑣 , never stored.
Rule 4 (Position ledger). The protocol books a position as its net signed liquidity per strike: each leg
carries the direction sign 𝕀long|short, and the ladder’s ledger is
𝜋𝜎 (𝜎𝐾,𝑇;𝑡) ←
∑
𝑖𝐾
𝐿(𝑖𝐾)𝕀long|short, 𝕀long|short ≡ {
−1 long (liquidity removed — burn)
1 short (liquidity minted)
The sign is per leg (isLong in the Panoptic tokenId), so mixed-direction ladders are expressible. Leg type
is not an index here: put or call is determined structurally by the strike against 𝑝⋆ — puts below, calls
above (Definition 6) — and is carried by tokenType.
5PRICING_GEOMETRY
Definition 8 (Price grid). The price grid is the map assigning to each tick 𝑖 the value
𝑝(𝜂,∆𝑖)(𝑖) ≡ 𝜆𝑖∕2∆𝑖 𝜂
where 𝜆 is the fixed tick base — a Protocol Constant (see PROTOCOL_CONSTANTS (𝒞𝑝)), not a
member of Θ𝑝 — and (𝜂,∆𝑖) = Θ𝑝 are Protocol Parameters (see PROTOCOL_PARAMETERS (Θ𝑝)). At
𝜂 = 1 the grid is the canonical square-root-price tick law of UNI_V3 (priceEta_one); the strike price of
Definition 1 is the grid at the strike tick, 𝑝(𝜂,∆𝑖)(𝑖𝐾).
𝜂 (pricegrid)and𝜒𝑋∕𝑀 (tradingcurve,𝜑(𝜒𝑋∕𝑀,0))areDISTINCTparametersondistinctobjects; theyarenot
two names for one exponent. Their relation is a THEOREM, not a definition — see the 𝜒𝑋∕𝑀 ↔ 𝜂 ↔ 𝜍𝑋∕𝑀
block.
Theorem 21 (Half-kernel factorization: rescaling and partition change). Definition 8’s grid factors
through the canonical geometry in two ways.
(i) Rescaling: 𝑝(𝜂,∆𝑖) = 𝑝(1,𝜂∆𝑖) — on the grid, 𝜂 and ∆𝑖 enter ONLY through the product 𝜂∆𝑖; the grid
alone cannot identify them separately (they separate off-grid: 𝜉⋆ = 𝜆−∆𝑖∕2, Proposition 6, depends
on ∆𝑖 alone).
(ii) Partition change (the pricing-implementation theorem): for ANY admissible (𝜂,∆𝑖) and any
reference spacing ̄ ∆𝑖 ≠ 0, the price is a PRODUCT of two canonical-geometry prices whose tick
arguments are functions of the current tick:
𝑝(𝜂,∆𝑖)(𝑖) = 𝑝(1,̄ ∆𝑖)(𝑖⋆) ⋅ 𝑝(1,̄ ∆𝑖)(𝑖◦), 𝑖⋆ = 𝑖◦ =
𝑖 ∆𝑖 𝜂
2 ̄ ∆𝑖
exactly on integer ticks under the commensurability (𝑖⋆ + 𝑖◦) ̄ ∆𝑖 = 𝑖 ∆𝑖 𝜂; an Int24-windowed split with
witnesses 𝑖− = ⌊𝜂𝑖⌋, 𝑖+ = 𝑖 − 𝑖− realizes it inside the Uniswap/Plank tick domain. This is why the
1
2
sqrt-price algebra CLOSES under 𝜂 — the plank implementation prices every 𝜂 member using only
canonical-kernelevaluations. Conventionbridge: theexplayerstatestheseonits ̄ 𝜂-kernel,whosecanonical
member is written ̄ 𝜂 = 1∕2; by T28’a’s factor two that member IS Definition 8’s 𝜂 = 1 grid, and the identity
makes no factor-share identification.
Theorem 4 (Geometric strike-notional weights). On the price grid 𝜆𝑖 ∆𝑖 — the square of Definition 8’s
grid at 𝜂 = 1 (priceGrid_eq_tickPrice_sq) — the discretized strike-notional weights of the log contract
are exactly geometric:
𝜆(𝑖+1)∆𝑖 − 𝜆𝑖 ∆𝑖
(
𝜆𝑖 ∆𝑖
)2
= (𝜆∆𝑖 − 1)
(
𝜆−∆𝑖
)𝑖
with ratio 𝜆−∆𝑖 — 𝜆 the fixed tick base (Protocol Constant 𝒞𝑝), so the ratio is a function of the protocol
parameter ∆𝑖 alone. Normalized, the weights are the geometric profile at that ratio, and Theorem 2’s
partition of unity applies.
Proposition 6 (The liquidity ratio 𝜉⋆). The per-tick liquidity replicating the log contract scales as the
inverse square root of that grid, hence
𝜉⋆ = 𝜆−∆𝑖∕2 (NOT 𝜆−∆𝑖 ; the two differ by the tranche-gamma Jacobian)
6𝜆 being fixed (𝒞𝑝), 𝜉⋆ is pinned by ∆𝑖 alone — consistent with the Θ𝓁 registry entry, where 𝜉 is the
parameter and 𝜉⋆ = 𝜆−∆𝑖∕2 its pinned value.
Status: thesamplinghalfisproved—𝐾−1∕2 onthegridisgeometricwithratio𝜆−∆𝑖∕2 (logContractLiquidity_
geometric). The replication premise — 𝓁(𝐾) ∝ 𝐾−1∕2 from the curvature relation 𝓁(𝑃) = −2𝑃3∕2𝑉′′(𝑃),
𝑉′′(𝑃) = −1∕𝑃2, adapted from VOL_SWAPS — is OPEN in-tree (the payoff-level curvature bridge is
future work).
TRADING_REGION
Definition 9 (Per-strike amounts). On the underlying market (𝑋,𝑀), the liquidity 𝐿(𝑖𝐾) at strike tick
𝑖𝐾 holds the per-strike token amounts
∆𝑄𝐿
𝑀(𝑖𝐾) ≡ 𝐿(𝑖𝐾)
[𝑝(𝜂,∆𝑖)(𝑖𝐾 + ∆𝑖) − 𝑝(𝜂,∆𝑖)(𝑖𝐾)
𝑝(𝜂,∆𝑖)(𝑖𝐾)𝑝(𝜂,∆𝑖)(𝑖𝐾 + ∆𝑖)
]
∆𝑄𝐿
𝑋 (𝑖𝐾) ≡ 𝐿(𝑖𝐾)
[
𝑝(𝜂,∆𝑖)(𝑖𝐾 + ∆𝑖) − 𝑝(𝜂,∆𝑖)(𝑖𝐾)
]
identical to the per-rick amounts of BUNNI_V2 §2.3, eqs. (10)–(13), at 𝜂 = 1 — stated here on the general
grid 𝑝(𝜂,∆𝑖) (Definition 8). 𝑀 ↔ token0, 𝑋 ↔ token1. PR-REGION OPEN: the legs are stated unsigned;
the admissibility region of signed flows is not yet defined — Theorem 5’s ∆𝑖 ≥ 0 hypothesis currently
stands in for it.
Theorem 5 (Leg nonnegativity, reciprocal money leg). Nonnegativity of both legs requires ∆𝑖 ≥ 0
in addition to 𝜂∆𝑖 > 0 (𝜂,∆𝑖 < 0 makes 𝑖𝐾 + ∆𝑖 < 𝑖𝐾 and reverses signs), and the money leg is the
reciprocal-price difference:
0 ≤ 𝐿, 𝜂∆𝑖 > 0, ∆𝑖 ≥ 0 ⇐⇒ ∆𝑄𝐿
𝑀,∆𝑄𝐿
𝑋 ≥ 0; ∆𝑄𝐿
𝑀(𝑖𝐾) = 𝐿(𝑖𝐾)
[ 1
𝑝(𝜂,∆𝑖)(𝑖𝐾)
−
1
𝑝(𝜂,∆𝑖)(𝑖𝐾 + ∆𝑖)
]
The reciprocal form is exactly BUNNI_V2 eq. (10)’s shape.
Definition 10 (Cumulative amounts). The cumulative amounts aggregate the per-strike amounts
from the money side down and the asset side up:
𝑄𝐿
𝑀(𝑖𝐾) ≡
𝑖max ∑
𝑖=𝑖𝐾
∆𝑄𝐿
𝑀 (𝑖)
𝑄𝐿
𝑋 (𝑖𝐾) ≡
𝑖𝐾 ∑
𝑖=𝑖min
∆𝑄𝐿
𝑋 (𝑖)
identical to the cumulative amount functions of BUNNI_V2 §2.3, eqs. (14)–(15).
Definition 11 (Inverse cumulative amounts). The inverse cumulative amounts map a target
amount back to the extremal strike tick attaining it:
𝑄𝐿
𝑀( ̄ 𝑄𝑀)−1 ≡ arg max𝑖
{
𝑄𝐿
𝑀(𝑖𝐾) ∶ 𝑄𝐿
𝑀(𝑖𝐾) ≥ ̄ 𝑄𝑀
}
𝑄𝐿
𝑋( ̄ 𝑄𝑋)−1 ≡ arg min𝑖
{
𝑄𝐿
𝑋(𝑖𝐾) ∶ 𝑄𝐿
𝑋(𝑖𝐾) ≥ ̄ 𝑄𝑋
}
7identical to the inverse cumulative amount functions of BUNNI_V2 §2.4, eqs. (22)–(23) — including the
arg max/arg min asymmetry, which mirrors the opposed summation directions of Definition 10.
Theorem 6 (Monotonicity and telescoping). Both cumulatives are monotone in the step count (for
𝐿 ≥ 0), so the inverse cumulatives of Definition 11 are well-defined least attaining steps; for the constant
ladder 𝐿 ≡ ̄ 𝐿 they telescope to closed form:
𝑄𝐿
𝑋 = ̄ 𝐿
[
𝑝(𝜂,∆𝑖)(𝑖min + 𝑛∆𝑖) − 𝑝(𝜂,∆𝑖)(𝑖min)
]
, 𝑄𝐿
𝑀 = ̄ 𝐿
[ 1
𝑝(𝜂,∆𝑖)(𝑖min)
−
1
𝑝(𝜂,∆𝑖)(𝑖min + 𝑛∆𝑖)
]
Notationmap(Bunniv2remap—collision-driven). BUNNI_V2’ssymbolsdonotenterthisdocument
because 𝑎0,𝑎1 collide with the replication weights 𝑎1,𝑎2 (Settlement form of Definition 1). The remap:
𝑎0 ↦→ ∆𝑄𝐿
𝑀, 𝑎1 ↦→ ∆𝑄𝐿
𝑋, 𝐴0 ↦→ 𝑄𝐿
𝑀, 𝐴1 ↦→ 𝑄𝐿
𝑋, 𝐴−1
0
↦→ 𝑄𝐿
𝑀(⋅)−1, 𝐴−1
1
↦→ 𝑄𝐿
𝑋(⋅)−1, 𝑤 ↦→ ∆𝑖,
𝑟 ↦→ 𝑖𝐾, 𝑙𝑟 ↦→ 𝐿(𝑖𝐾), 1.0001 ↦→ 𝜆 (𝒞𝑝). Structural identification: Definition 7’s weight profile 𝓁 is
Bunni’s geometric LDF 𝑑𝛼,𝑙 (§2.2.1, eq. (9)) under 𝛼 ↦→ 𝜉, 𝑙 ↦→ 𝜄, and Definition 7’s 𝐿(𝑖𝐾) = ̄ 𝐿𝓁(⋅) is his
𝑙𝑟 = 𝐿 ⋅ 𝐿𝐷𝐹𝑤(𝑟) (eq. (5)).
Definition 12 (Weighted-geometric-mean trading function). For share parameter 𝜒𝑋∕𝑀 ∈ (0,1), the
trading function at strike tick 𝑖𝐾 takes as exogenous a trading flow ∆𝑄 = (∆𝑄𝑀,∆𝑄𝑋) and returns
𝜑(𝜒𝑋∕𝑀,0) (𝑖𝐾;∆𝑄,𝐿) ≡
(
∆𝑄𝐿
𝑀(𝑖𝐾) + ∆𝑄𝑀
)𝜒𝑋∕𝑀
⋅
(
∆𝑄𝐿
𝑋 (𝑖𝐾) + ∆𝑄𝑋
)1−𝜒𝑋∕𝑀
The flow is exogenous — trade legs arriving against the endowed per-strike amounts of Definition 9:
the endowments are the state, the flow is the input. It is a trading function in the sense of CFMM_
GEOMETRY, already in canonical form (nondecreasing, concave, homogeneous); its logarithm is the
weighted logarithmic utility of AMM_AXIOMS App. B.2 (their weight 𝑤 ↦→ 𝜒𝑋∕𝑀; the former collision
with the order width is MOOT — the width is now #𝜎 ∈ ℐord), evaluated on per-strike virtual reserves
in the sense of their App. B.3 (𝛼,𝛽 ↦→ ∆𝑄𝐿
𝑀(𝑖𝐾),∆𝑄𝐿
𝑋(𝑖𝐾)).
The display is one member of a parameterized class: the subscript tuple is (𝜒𝑋∕𝑀,𝜖𝑋∕𝑀), the second slot
the substitution parameter, with 𝜖𝑋∕𝑀 = 0 the Cobb–Douglas member. Whether 𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀) satisfies the
Bichuch–Feinstein axioms is not asserted here — their B.2 alone satisfies all of them (Table 1), but its
composition with B.3 virtual reserves is unverified (a later Proposition). The domain of the flow is
OPEN (PR-REGION): the region over which ∆𝑄 ranges — signedness of the legs and the admissibility
set — is not yet defined; no region symbol is minted pending that ruling.
FLAG (open, 2026-08-03): LEG ORIENTATION OF 𝜒𝑋∕𝑀. The display above puts
𝜒𝑋∕𝑀 on the ∆𝑄𝑀 leg; the CES definition below puts it on the 𝑄𝑋 leg (and matches Lean
PhiCES.phiCES). One of the two must change, and the choice flips the 𝜒∕(1 − 𝜒) = 𝜆𝜂∆𝑖∕2
bridge and the reading of curvIndex_is_rho_zero_slice. Theorem 1 consumes the
∆𝑄𝑀-leg form. AUTHOR DECISION REQUIRED — not resolved by the rename.
BINDING (user, 2026-08-03): 𝜖 is reserved for ELASTICITIES, always subscripted to differentiate;
𝜎 is reserved for VOLATILITIES and VARIANCES and is never an elasticity.
Definition 13 (CES trading-function family). Every trading function in this document is a member of
ONE two-parameter CES family — 𝜒𝑋∕𝑀 the SHARE axis, 𝜖𝑋∕𝑀 the SUBSTITUTION axis:
𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀) (𝑄𝑋,𝑄𝑀) ≡
⎧
⎨
⎩
(
𝜒𝑋∕𝑀 𝑄
𝜖𝑋∕𝑀
𝑋 + (1 − 𝜒𝑋∕𝑀)𝑄
𝜖𝑋∕𝑀
𝑀
)1∕𝜖𝑋∕𝑀
, 𝜖𝑋∕𝑀 ≠ 0
𝑄
𝜒𝑋∕𝑀
𝑋 𝑄
1−𝜒𝑋∕𝑀
𝑀 , 𝜖𝑋∕𝑀 = 0
𝜒𝑋∕𝑀 ∈ (0,1)
𝜖𝑋∕𝑀 = 0 is a DEFINED CASE, not an evaluation — 1∕𝜖𝑋∕𝑀 is undefined there, so the Cobb–Douglas
branch is supplied by definition and CONTINUITY at 𝜖𝑋∕𝑀 = 0 is a theorem (phiCES_tendsto_phiEps),
8not a substitution. Every display in this document sits on the 𝜖𝑋∕𝑀 = 0 slice and is subscripted accordingly;
Definition 12 is the 𝜖𝑋∕𝑀 = 0 member evaluated on the per-strike virtual reserves. ORIENTATION
(PR-ORIENT, OPEN): this display carries 𝜒𝑋∕𝑀 on the 𝑄𝑋 leg — the opposite of Definition 12’s ∆𝑄𝑀-leg
placement; the FLAG applies to the pair and one of the two must eventually change.
Definition 14 (Curvature). The curvature 𝜅𝜑 of a trading function is the price-impact elasticity of
its marginal price along the trading curve, normalized against the constant-product member: with the
marginal price minted as its own object — 𝑝𝜑 ≡ 𝜕𝑄𝑋
𝜑∕𝜕𝑄𝑀
𝜑, the quotient of partials of the trading
function (bare 𝑝 is not used; the subscript 𝑝 in 𝜖𝑝∕𝑋 names this object; Lean CurvatureTwo.margPrice,
subject to the PR-ORIENT argument-order FLAG) — and
𝜖𝑝∕𝑋 ≡
𝑑ln𝑝𝜑
𝑑ln𝑄𝑋
| | | | |𝜑=const
, 𝜅𝜑 ≡
|𝜖𝑝∕𝑋|
|𝜖𝑝∕𝑋| + |𝜖0
𝑝∕𝑋
|
where 𝜖0
𝑝∕𝑋
is the same elasticity for the 𝜖𝑋∕𝑀 = 0 (constant-product) member at the same point. 𝜖𝑝∕𝑋 is
an observable of any member of the trading-function class (Definition 12), not a parameter: the second
derivative of 𝜑 enters through it (the derivative of the marginal price), and the benchmark normalization
makes 𝜅𝜑 scale-free, with theconstant-productpoolat 𝜅𝜑 = 1∕2. Notationbinding: 𝜅𝜑 namesthegenuine
curvature (𝜑 the quote function, never the fee 𝜙); the share-asymmetry index 𝜍𝑋∕𝑀 is NOT a curvature.
(Thegrid–marginal-pricerelationisProposition10,statedwiththeportfolio-valuemachineryin#CONTROL_
OPERATORS.)
Proposition 7 (CES curvature closed form). For the CES family (Definition 13), at the balanced point
|𝜖𝑝∕𝑋| =
1 − 𝜖𝑋∕𝑀
1 − 𝜒𝑋∕𝑀
, and
𝜅𝜑(𝜖𝑋∕𝑀) =
1 − 𝜖𝑋∕𝑀
2 − 𝜖𝑋∕𝑀
∈ [0,1), 𝜖𝑋∕𝑀(𝜅𝜑) =
1 − 2𝜅𝜑
1 − 𝜅𝜑
—the𝜒𝑋∕𝑀-dependencecancelsidentically: 𝜅𝜑 isafunctionoftheSUBSTITUTIONaxisalone(equivalently
𝜅𝜑 = 1∕(1+̄ 𝜖𝑋∕𝑀)). TheinverseistheDESIGNDIAL—chooseatargetcurvature,readoffthesubstitution
exponent. Status: OPENin-tree—Aristotletarget: (i)theelasticitycomputation|𝜖𝑝∕𝑋| = (1−𝜖𝑋∕𝑀)∕(1−
𝜒𝑋∕𝑀), (ii) the normalization identity.
Theorem 8 (Properties of the closed form). The closed form is zero exactly at the linear member
(𝜖𝑋∕𝑀 = 1), strictly positive below it, strictly decreasing in 𝜖𝑋∕𝑀, with range [0,1); 𝜒𝑋∕𝑀 and ∆𝑖 do NOT
enter it; both round trips with the inverse hold.
Refutation note (what curvature is NOT). The Gaussian curvature of 𝜑’s graph is identically zero
for every member — 1-homogeneity forces Hess𝜑 ⋅ (𝑄𝑋,𝑄𝑀)⊤ = 0, so detHess ≡ 0 and the graph is a
ruled surface; the Gaussian reading cannot distinguish linear from Leontief. The un-normalized planar
curvature of the trading curve is scale-dependent ((1−𝜖𝑋∕𝑀)∕(
√
2𝑡) at the symmetric point 𝑄𝑋 = 𝑄𝑀 = 𝑡,
𝜒𝑋∕𝑀 = 1∕2) and cannot equal a constant. The normalization of Definition 14 is what makes Proposition
7 well-posed. Status: unformalized (cheap machine-check; rider on the Proposition 7 Aristotle bundle).
Definition 15 (Share asymmetry). The share asymmetry (grid tilt) of the trading-function family is
𝜍𝑋∕𝑀 ≡ 1 −
(1 − 𝜒𝑋∕𝑀
𝜒𝑋∕𝑀
)∆𝑖
zero exactly at 𝜒𝑋∕𝑀 = 1∕2. It is a derived observable — a function of the registered parameters
𝜒𝑋∕𝑀 ∈ Θ𝜑 and ∆𝑖 ∈ Θ𝑝, adding no degree of freedom; hence no registry entry.
Theorem 9 (𝜍𝑋∕𝑀 is not a curvature). At equal shares 𝜍𝑋∕𝑀 vanishes both at the constant-product
member and at the linear member — although the former has 𝜅𝜑 = 1∕2 > 0 (Proposition 7) and only
the latter is flat. So 𝜍𝑋∕𝑀 measures SHARE asymmetry (the grid-price tilt), not curvature across the
9substitution axis. Blocks E1–E7 are theorems about 𝜍𝑋∕𝑀: their mathematics stands; their reading is about
SHARE, not curvature.
Rule 5 (Current trading curve). The protocol pins the balanced Cobb–Douglas member:
𝜒𝑋∕𝑀 ←
1
2
, 𝜖𝑋∕𝑀 ← 0 ∶ 𝜑(1∕2,0) (𝑖𝐾;∆𝑄,𝐿) = (∆𝑄𝐿
𝑀(𝑖𝐾) + ∆𝑄𝑀)1∕2 ⋅ (∆𝑄𝐿
𝑋 (𝑖𝐾) + ∆𝑄𝑋)1∕2
The leg reading — 𝜒𝑋∕𝑀 as the ∆𝑄𝑀-leg exponent (the 1∕𝑝(𝜂,∆𝑖) leg), that leg’s share of pool value — is
Definition 12’s orientation. At 𝜒𝑋∕𝑀 = 1∕2 the two orientations of the OPEN FLAG coincide, so the
current case is orientation-blind — which is why the Definition 12 / Definition 13 contradiction stayed
invisible in practice.
Theorem 10 (The bridge 𝜒𝑋∕𝑀 ↔ 𝜂 ↔ 𝜍𝑋∕𝑀). The weight ratio IS the per-TICK square-root-price step —
so 𝜒𝑋∕𝑀 is an OBSERVABLE of the grid already defined, not a new primitive:
𝜒𝑋∕𝑀
1 − 𝜒𝑋∕𝑀
=
𝑝(𝜂,∆𝑖)(𝑖 + 1)
𝑝(𝜂,∆𝑖)(𝑖)
= 𝜆𝜂∆𝑖∕2
Both directions, both round trips; and the share asymmetry (Definition 15) factors through the share, the
per-SPACING step being the per-TICK step raised to ∆𝑖 — with Λ the logistic, Λ(𝑧) = 1∕(1 + 𝑒−𝑧) (the
same Λ the fee schedule uses below):
𝜒𝑋∕𝑀(𝜂) = Λ
(𝜂∆𝑖 ln𝜆
2
)
∈ (0,1) ∀𝜂, 𝜂(𝜒𝑋∕𝑀) =
2
∆𝑖 ln𝜆
ln
𝜒𝑋∕𝑀
1 − 𝜒𝑋∕𝑀
𝜍𝑋∕𝑀(𝜂,∆𝑖) = 1 −
(1 − 𝜒𝑋∕𝑀
𝜒𝑋∕𝑀
)∆𝑖
, 𝜒𝑋∕𝑀(𝜍𝑋∕𝑀) =
1
1 + (1 − 𝜍𝑋∕𝑀)1∕∆𝑖
Theorem 11 (Domain coincidence). Three conditions stated independently, in different blocks, are
one:
0 < 𝜂∆𝑖 ⇐⇒ 𝜒𝑋∕𝑀 >
1
2
⇐⇒ 𝜍𝑋∕𝑀 ∈ (0,1)
𝜂 = 0 ⇐⇒ 𝜒𝑋∕𝑀 =
1
2
⇐⇒ 𝜍𝑋∕𝑀 = 0
The first line is exactly the hypothesis Theorem 5’s deltaQM_nonneg requires — an analytic guard that IS
the economic condition “the pool is asset-heavy in value”; the second says flat grid = symmetric pool =
zero tilt.
Theorem 12 (Share-asymmetry monotonicity; the antitone reading is REFUTED). 𝜍𝑋∕𝑀 is strictly
INCREASING in 𝜒𝑋∕𝑀 on (0,1), vanishing exactly at 𝜒𝑋∕𝑀 =
1
2
. The opposite reading — a larger asset
share means LESS tilt — is FALSE:
∆𝑖 = 1 ∶ 𝜒𝑋∕𝑀 =
1
4
<
3
4
but 𝜍𝑋∕𝑀
(1
4
)
< 𝜍𝑋∕𝑀
(3
4
)
(raising 𝜒𝑋∕𝑀 shrinks (1 − 𝜒𝑋∕𝑀)∕𝜒𝑋∕𝑀, hence RAISES 1 − (⋅)∆𝑖 .)
CONSEQUENCEFORE8(6): thefactor-sharereadingwasrecordedUNAVAILABLEbecause𝜂⋆ ≈ 458∕∆2
𝑖
cannot be a Cobb–Douglas share. It never had to be — the share is 𝜒𝑋∕𝑀(𝜂⋆) ∈ (0,1) for EVERY 𝜂
(Theorem 10), so the identification is reachable through 𝜒𝑋∕𝑀, not through 𝜂 directly. Carriers: etaStar_
tilde_mem_Ioo, curvIndex_etaStar_via_tilde. (E-block cross-note; converts when the E-blocks are
swept.)
10Provenance: EtaTilde 23/23 axiom-clean, project 67b1c841 (doc 𝜒𝑋∕𝑀 ↔ Lean etaTilde,
the Lean name fixed by the bundle and never hand-edited); PhiCES12/12 axiom-clean, project
cd3558f7. Carriers not yet attached to a numbered statement: phiCES_agreement_point
(evaluation form, scope declared in-file); CONDITIONAL, NOT an identification: phiCES_
rho_vs_pi_eta_trader gives 1∕(1 − 𝜖𝑋∕𝑀) = 1∕(1 − 𝜂) ⇐⇒ 𝜖𝑋∕𝑀 = 𝜂 away from the poles
for exp/CESLongVolPayoff’s 𝜂, and its docstring states outright that this does NOT identify
the payoff parameter with the trading-function parameter — E8(6) untouched.
FEE_ALGEBRA
Rule 6 (Per-leg fee split). Each incoming trade leg is split by its leg fee 𝜙𝑀,𝜙𝑋 ∈ (0,1) (the M9 leg fees
— fee variables, produced by the schedule below, not members of Θ𝜙): the trading function is quoted on
the net flow, and the fee fraction accrues to the per-strike reserves —
∆𝑄𝑀 = (1 − 𝜙𝑀)∆𝑄𝑀 + 𝜙𝑀 ∆𝑄𝑀
∆𝑄𝑋 = (1 − 𝜙𝑋)∆𝑄𝑋 + 𝜙𝑋 ∆𝑄𝑋
∆𝑄𝐿
𝑀(𝑖𝐾) ← ∆𝑄𝐿
𝑀(𝑖𝐾) + 𝜙𝑀 ∆𝑄𝑀
∆𝑄𝐿
𝑋(𝑖𝐾) ← ∆𝑄𝐿
𝑋(𝑖𝐾) + 𝜙𝑋 ∆𝑄𝑋
The first display is an identity (the decomposition); the Rule is the second — the accrual assignment:
fees deposit into Definition 9’s endowments at the strike where they are charged.
Definition 17 (Fee composition). The fee-composition law on the carrier [0,1) is
𝜙𝑀 ⊗𝜙 𝜙𝑋 ≡ 1 − (1 − 𝜙𝑀)(1 − 𝜙𝑋), 𝒢𝜙 ≡
(
[0,1], ⊗𝜙, 0
)
𝒢𝜙 is an Abelian monoid — identity 𝜙 = 0, no inverses (a charged fee cannot be un-charged) — not a
group,and⊗𝜙 isacompositionlaw,notaninnerproduct(correctingthenote’soriginalwording). The
monoid axioms are machine-proved — Theorem 14 (probOr_comm, probOr_assoc, probOr_zero, closure
probOr_mem_Icc). The carrier is [0,1] as proved; the boundary 𝜙 = 1 (full confiscation) is admitted by
the algebra and excluded economically by Rule 6’s domain 𝜙∙ ∈ (0,1).
Rule 7 (Trader-paid fee). The protocol composes the leg fees into the trader-paid fee by the monoid law:
𝜙 ← 𝜙𝑀 ⊗𝜙 𝜙𝑋
This is the [M9] DECIDED entry — enacted as Rule 12, with its algebra as Theorem 20 (TauMevAlgebra
carriers), inside the MEV subsection of # CONTROL_OPERATORS, where hazards are introduced.
Design menu. Row 1 is the DECIDED structure — Rules 6–7 enact it; the remaining rows are alternative
composition structures considered and not adopted (candidate Rules never enacted):
Economic process Operator Structure
Sequential fee charging (1 − (1 − 𝜙𝑀)(1 − 𝜙𝑋)) Abelian monoid
Strongest policy wins (max) Join semilattice
Cheapest route wins (min) Meet semilattice
Liquidity aggregation Weighted average Convex algebra
Feature flags OR Monoid
Permission intersection AND Monoid
Bit toggling XOR Abelian group
Cyclic governance states Addition mod (N) Finite abelian group
11Economic process Operator Structure
Definition 18 (Dynamic fee schedule). The fee level is produced by the volatility-and-utilization
schedule — the sum-of-sigmoids dynamic fee of ALGEBRA (their eq. (4)–(5); 𝛼 scales, 𝛾 steepens, 𝛽
centers), gated by utilization:
𝜙(𝜎(𝑖(𝑡));𝑡) ≡ ̄ 𝜙 +
(∑
𝑗
𝛼𝑗
1 + exp(𝛾𝑗 (𝛽𝑗 − 𝜎(𝑖(𝑡))))
)
⋅
𝛼𝑅
1 + exp(𝛾𝑅 (𝛽𝑅 −
𝜑(1∕2,0) (𝑖𝐾;∆𝑄,0;𝑡)
𝜑(1∕2,0) (𝑖𝐾;0,𝐿;𝑡)
))
The gate’s argument is the utilization ratio — the trading function evaluated on flow alone over its
evaluation on the endowments alone (Theorem 1’s 𝑢 is the gate’s value). The parameters Θ𝜙 = {𝛾, ̄ 𝜙,𝛽,𝛼}
are Protocol Parameters (see PROTOCOL_PARAMETERS (Θ𝜙)); the R-suffixed trio (𝛼𝑅,𝛽𝑅,𝛾𝑅) enters
as members of the 𝛼∕𝛽∕𝛾 families. Signature note: the 𝑡 argument extends Definition 12’s (𝑖𝐾;∆𝑄,𝐿)
signature — the time dependence enters through the flow and endowments at 𝑡; flagged, not silently
repaired.
Theorem 1 (Fee Envelope). Writing 𝑢 = 𝛼𝑅
/(
1+exp
(
𝛾𝑅
(
𝛽𝑅 −
𝜑(1∕2,0)(𝑖𝐾;∆𝑄,0;𝑡)
𝜑(1∕2,0)(𝑖𝐾;0,𝐿;𝑡)
)))
— the utilization gate
of Definition 18:
0 ≤ 𝑢 ≤ 𝛼𝑅, ̄ 𝜙 ≤ 𝜙(𝜎) ≤ ̄ 𝜙 +
(∑
𝑗
𝛼𝑗
)
𝑢, 𝜎 ↦→ 𝜙(𝜎) monotone (𝛾𝑗 > 0,𝛼𝑗 ≥ 0,𝑢 ≥ 0)
The single-term case is the sigmoid fee schedule with steepness 𝑠𝑓 = 1∕𝛾0, where Λ is the logistic
Λ(𝑧) = 1∕(1 + 𝑒−𝑧):
̄ 𝜙 + 𝛼0 Λ(𝛾0(𝜎 − 𝛽0)) = 𝑓
(
𝜎; 𝑓min = ̄ 𝜙, 𝑓max = ̄ 𝜙 + 𝛼0, ̄ 𝜎𝑓 = 𝛽0, 𝑠𝑓 = 𝛾−1
0
)
VolInstrument.sigmoidR_mem, multiFee_bounds, multiFee_monotone, multiFee_
single_bridge.
ECONOMIC CONTENT OF THEOREM 1. The floor ̄ 𝜙 is unconditional — LPs take a base fee at every
volatility, so the schedule never degenerates to free execution. The ceiling is NOT a constant: it is
̄ 𝜙 + (
∑
𝑗
𝛼𝑗)𝑢, GATED by the utilization factor 𝑢 ∈ [0,𝛼𝑅], so a pool nobody is trading against cannot
levy the volatility surcharge at all — at 𝑢 = 0 the band collapses to the floor, and the surcharge is
earned only where flow exists to earn it on. Monotonicity in 𝜎 is what makes the schedule a genuine
VOLATILITY SURCHARGE rather than an arbitrary function of state: higher realized volatility always
coststhetraderweaklymore. ThatisthepropertytheFLAIRidentificationconsumes—Θ𝜆FLAIR
= { ̄ 𝜙,𝛼,𝑢}
is a LEVEL block precisely because the band’s two edges are the level parameters, while (𝛽𝑗,𝛾𝑗) only place
the transition inside the band (G3).
Rule 2 (Streamia). Assign the per-time-step payoff variation to the trading fee — the streamia of the
Panoptic whitepaper:
𝜙(𝜎(𝑖(𝑡));𝑡)
streamia
←, 𝜃
(
𝑝(𝜂,∆𝑖) (𝑖;𝑡),𝑝(𝜂,∆𝑖) (𝑖𝐾),𝜎(𝑖(𝑡))
)
streamia
←, denotes this Rule throughout.
Definition 3 (Streaming premium). The streaming premium over 𝑁 steps of length ∆𝑡 is the
accumulated streamia
∑
𝑗<𝑁
𝜃𝑗 ∆𝑡 — the seller’s fee income under Rule 2. It replicates the option’s time
decay, which is exactly why the perpetual instrument needs no expiry: the decay that a dated option pays
out at 𝑇 is instead streamed continuously.
12PROTOCOL_INPUTS
Every Protocol Input is a quantity supplied by the USER, per order, at interaction time — the third
registry class. The classifying test across the three registries is who sets it, and when: a Protocol Constant
(𝒞𝑝) is fixed by the design once and forever; a Protocol Parameter (Θ∙) is set by the protocol, uniformly for
all users; a Protocol Input is chosen by the user for each interaction. Input entries carry a Carrier line
— inputs are calldata, and the on-chain field is part of their definition. The input set of the vol order
(retiring the former Θord symbol: inputs are not parameters, so the index letter changes):
ℐord = {𝜎2
𝐾, #𝜎, 𝑠𝜐}
(strike, width, skew) pins only the scale-free leg shape 𝓁(𝜉,𝜄;𝑖𝐾).
Rule 8 (Target-vega completion — DECIDED, 2026-07-30). The order is completed with the target
vega:
ℐord ← ℐord ∪ {∆𝑄⋆
𝑣 }
Protocol Input (ℐord = {𝜎2
𝐾,#𝜎,𝑠𝜐,∆𝑄⋆
𝑣 } — the vol order).
• 𝜎2
𝐾 —thestrikevariance. Domain: avariancelevel(Convention2: 𝜎2(𝑖𝐾) ≡ 𝜎2
𝐾); on-chainpacking
per VolOrderValidationLib. Purpose: the strike of the volatility option (Definition 1). Economic
meaning: the variance level above which the option pays. Carrier: create_order(strike, ...).
• #𝜎 — the width (symbol per user ruling 2026-08-04; formerly 𝑤, retired — the AMM_AXIOMS
𝑤-collision noted at Definition 12 is thereby MOOT). Domain: the packed order field (validation
predicate in VolOrderValidationLib). Purpose: with 𝑠𝜐, pins the scale-free leg shape 𝓁(𝜉,𝜄;𝑖𝐾).
Economic meaning: the strike-band width of the replication ladder. Carrier: create_order(...,
width, ...).
• 𝑠𝜐 — the skew (symbol per user ruling 2026-08-04; formerly bare 𝑠, retired — it collided
with the fee-schedule steepness 𝑠𝑓). Domain: the packed order field (validation predicate in
VolOrderValidationLib). Purpose: with #𝜎, pins the leg shape. Economic meaning: the
asymmetry of the ladder around the strike. Carrier: create_order(..., skew, ...).
• ∆𝑄⋆
𝑣 — the target vega (enters by Rule 8). Domain: u96, RAW LIQUIDITY units — ∆𝑄⋆
𝑣 carries
the dimension of the replication carrier 𝐿 (the DECIDED dimension ruling below). Purpose: sizes
the ladder and induces the implied maturity (Theorem 13, # PAYOFF). Economic meaning: the vega
notional the user targets — the one sizing decision the order stores. Carrier: targetVega : u96 at
bits152..247ofthepackedVolOrderword(plankfeat/plank);targetVega= ∆𝑄⋆
𝑣 exactly;emitted
by VolOrderCreated(orderId, strike, width, skew, targetVega); fits-packed predicate in
VolOrderValidationLib.
Convention3(Vegadimension—storedtargetvslensreadout; DECIDED2026-07-30). ∆𝑄⋆
𝑣 carries
the dimension of the REPLICATION CARRIER — liquidity 𝐿, the quantity of the priced vol asset, per
Rule 4’s ledger
𝜋𝜎 =
∑
𝑖𝐾
𝐿(𝑖𝐾)𝕀long|short
The quotient ∆𝑄𝑣 ≡ ∆𝜋𝜎∕∆(𝜎2 − 𝜎2
𝐾)+ (collateral per vol unit, Definition 1) is the LENS READOUT —
computed from a position through the 𝑄𝐿
𝑀 range conversion (Definition 10), never stored. One instrument,
13two views: the ℐord entry names the stored quantity, Definition 1’s quotient names the measured
sensitivity.
Rule 9 (Sizing — quantity-exact, no price in the map). The mint sizes the ladder from the target vega
alone:
𝐿(𝑖𝐾) ← ∆𝑄⋆
𝑣 𝓁(𝜉⋆,𝜄;𝑖𝐾),
∑
𝑖𝐾
𝐿(𝑖𝐾) = ∆𝑄⋆
𝑣
(∑
𝑖𝐾
𝓁 = 1, Theorem 2
)
𝑝vol,𝑝risk enter at the ISSUANCE/ADMISSIBILITY layer (shares, deleverage — Rule 10), never the sizing
map; the mint’s collateral requirement is the actual replication cost, slippage-bounded.
Proposition 8 (The lens obligation). Delivered quantity recovers the stored target, one-sided under
per-leg floor rounding:
∑
𝑖𝐾
𝐿(𝑖𝐾) ≤ ∆𝑄⋆
𝑣
Status: OPENin-tree—theper-legfloorroundingofRule9’smaphasnoLeancarrier(theinduced-ladder
floor-maximal construction is plank-side). The adjacent rounding conservativity that IS proved is the
funded-cap side of Rule 10: dQvFunded_roundDown, roundDown_preserves_invariant — related, not
carriers of this statement.
Rule 10 (Collateral channel and auto-deleverage; DECIDED 2026-07-30). The contract holds ∆𝑄⋆
𝑣
fixed, so all adaptation lands on collateral. The live backing requirement, and the (division-free) admissi-
bility condition:
∆𝑀req(𝑡) ← ∆𝑄⋆
𝑣 ⋅ 𝑝vol( ̄ 𝜎;𝑡), ∆𝑄𝑣 ⋅ 𝑝risk(𝑡) ≤ 𝑄𝑀
On violation the position is NOT hard-liquidated: the enforced exposure contracts to the funded level,
∆𝑄𝑣(𝑡) ← min
(
∆𝑄⋆
𝑣 ,
𝑄𝑀(𝑡)
𝑝risk(𝑡)
)
(floor), 𝑇⋆(𝑡) ← 2
∆𝑄𝑣(𝑡)
𝑁𝜎
so the implied maturity CONTRACTS continuously with the funded exposure instead of truncating; a
top-up restores both. Liquidation is the degenerate case 𝑄𝑀 → 0, where the realized life [𝑡mint,𝑡liq] is the
maturity the position actually had. FLAG (define-before-use, OPEN): 𝑝vol, 𝑝risk, and the reference
volatility ̄ 𝜎 are consumed here but not yet defined in the converted region — they are plank-side price
feeds (the priceOfRisk entry point); their formal definitions are owed before this Rule’s symbols close.
∀𝑥, 0 ≤ 𝑥 ≤ ∆𝑄⋆
𝑣 ∧ 𝑥𝑝risk ≤ 𝑄𝑀 ⇐⇒ 𝑥 ≤ ∆𝑄𝑣(𝑡), ∆𝑄𝑣(𝑡)𝑝risk ≤ 𝑄𝑀 (on violation)
dQvFunded_maximal; dQvFunded_admissible(_iff_mul), _mul_le_of_violation, _eq_of_no_
violation; 𝑇⋆(𝑡) ↑ 𝑄𝑀, ↓ 𝑝risk: tStarFunded_mono_QM, _antitone_prisk; 𝑄𝑀 ≥ ∆𝑄⋆
𝑣 𝑝risk ⇐⇒
𝑇⋆(𝑡) = 𝑇⋆: _eq_tStar_of_topup; 𝑄𝑀 = 0 ⇐⇒ 𝑇⋆(𝑡) = 0: dQvFunded_zero_QM; floor rounding
conservative (min-monotone).
Rule 11 (Recalibration law; DECIDED 2026-07-30: multiplicative). The joint evolution of the implied
maturity under the collateral channel AND realized variance 𝜎2
𝑅(𝑡) accruing against the strike:
𝑇⋆
joint
(𝑡) ← 𝑇⋆(𝑡) ⋅
(
1 −
𝜎2
𝑅(𝑡)
𝜎2
𝐾
)+
=
2∆𝑄⋆
𝑣
𝑁𝜎
⏟⏟⏟
𝑇⋆
⋅
min
(
∆𝑄⋆
𝑣 , 𝑄𝑀∕𝑝risk
)
∆𝑄⋆
𝑣
⏟⎴⎴⎴⎴⎴⎴⏟⎴⎴⎴⎴⎴⎴⏟
funding factor
⋅
(
1 −
𝜎2
𝑅
𝜎2
𝐾
)+
⏟⎴⎴⏟⎴⎴⏟
budget factor
14The arrow is the Rule (the enacted law); the second equality is the factorization identity. Rationale
(recorded): 𝜐 = 𝑇∕2 ⇐⇒ 𝜎2-budget ∝ 𝑇 (bijection preserved); 𝑇⋆
joint
= 𝑇⋆ ⋅ 𝑓fund ⋅ 𝑓budget (monotonicities
chain); burn rate constant (no cliff).
NOTE (cascade, recorded): ∆𝑄⋆
𝑣 on-chain lands on the PAIR (PanopticTokenId, positionSize)
— the tokenId is scale-free (strikes, widths, per-leg optionRatio); positionSize is an SFPM mint
argument. The ratio-vs-size split of 𝓁(𝜉⋆,𝜄;𝑖𝐾) across the pair is the task-#14 sizing decision.
Spec: .planning/vol-order-v2-target-vega-SPEC.md.
CONTROL_OPERATORS
These are the instruments mapping behavior objectives to protocol parameters — all of Θ∙, not only
the fee schedule Θ𝜙.
Convention 4 (Hazard rate vs incidence operator). The control operators come in two types, distin-
guished by the glyph: plain 𝜆∙ names a hazard rate — an arrival intensity (probability per unit time)
of a behavior (arb toxicity, LP competition); tilde ̃ 𝜆∙ names an incidence operator — a re-routing of
already-arriving flow that leaves the total invariant. A hazard adds under composition (
⨁
, Definition 19);
an incidence operator applies — it changes who bears the flow, not how much arrives. The distinction is
proved, not stylistic: the JIT operator leaves mevTotal invariant while FLAIR falls and the toxicity ratio
rises (JitLiquidity carriers) — it cannot be a hazard.
Definition 19 (Hazard aggregation). The aggregate hazard is the composition of the behavior hazards,
and
⨁
on hazard rates is addition (the hazard-coordinate image of ⊗𝜙 — Theorem 14):
𝜆 ≡
𝑛
⨁
𝑖=1
𝜆𝑖 𝑖 ∈ {lp-competition (FLAIR),arb toxicity,TBD,⋯}
𝜆 ≡ 𝜆𝑀 + 𝜆𝑋
MEV is struck from the index set (correcting the note’s original listing): 𝜆ARB — already a member — is
𝜆MEV’s SUMMAND (Definition 23), so listing MEV double-counts; and the MEV tax enters the trader-paid
fee through the ⊗𝜙 monoid (Rule 12), never through
⨁
. The second line is the per-leg split, mirroring
the leg fees of Rule 6.
Theorem 14 (Fee monoid and hazard exactness). 𝒢𝜙 =
(
[0,1], ⊗𝜙, 0
)
is an Abelian monoid —
commutative, associative, identity 0, closed on [0,1], monotone — and the hazard correspondence is
exact under 𝜙 = 1 − 𝑒−𝜆:
(
1 − 𝑒−𝜆𝑀
)
⊗𝜙
(
1 − 𝑒−𝜆𝑋
)
= 1 − 𝑒−(𝜆𝑀+𝜆𝑋) ⇐⇒ 𝜆 ≡ 𝜆𝑀 + 𝜆𝑋
Definition 19’s
⨁
-is-addition is exactly this exactness: fee composition and hazard addition are the same
law in two coordinate systems.
Definition 24 (Linear pool value). The linear pool value is the pool’s holdings marked at spot — the
money-units valuation with no curvature adjustment:
𝜋linear(𝑡) ≡ 𝑝(𝜂,∆𝑖)(𝑖(𝑡)) 𝑄𝐿
𝑋
(∑#LP
𝑗
𝐿𝑗(𝑖(𝑡);⋅)
)
+ 𝑄𝐿
𝑀
(∑#LP
𝑗
𝐿𝑗(𝑖(𝑡);⋅)
)
(Symbol per user rulings 2026-08-04: values are 𝜋-objects and this valuation is linear; the former ad-hoc 𝐷𝑡 is
retired — 𝐷 reads as debt.)
15Recall (the marginal price). 𝑝𝜑 ≡ 𝜕𝑄𝑋
𝜑∕𝜕𝑄𝑀
𝜑 — the quotient of partials of the trading function,
minted at Definition 14; its relation to the grid is the next statement, placed here because Definitions
25–26 consume both objects (user ruling 2026-08-04).
Proposition 10 (Grid–marginal-price relation). The grid map and the marginal price are DISTINCT
objects — the identification 𝑝(𝜂,∆𝑖) ≡ 𝑝𝜑 is NOT admissible. At Definition 9’s reserves, for the 𝜒𝑋∕𝑀 = 1∕2
member,
𝑝𝜑(𝑖𝐾) =
∆𝑄𝐿
𝑀(𝑖𝐾)
∆𝑄𝐿
𝑋(𝑖𝐾)
=
1
𝑝(𝜂,∆𝑖)(𝑖𝐾) 𝑝(𝜂,∆𝑖)(𝑖𝐾 + ∆𝑖)
—thegridentersthemarginalpriceastheINVERSEPRODUCTofadjacentgridvalues: the
√
price-vs-price
gap Theorem 4 already flags (priceGrid_eq_tickPrice_sq), plus the leg orientation. Status: elementary
algebra from Theorem 5’s reciprocal form; unproved in-tree (cheap Aristotle rider on the Proposition 7
bundle).
Definition 25 (Portfolio value function). With (𝑄𝐿
𝑋(𝑝𝜑),𝑄𝐿
𝑀(𝑝𝜑)) the point of the trading curve
𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀) = const at which the marginal price 𝑝𝜑 (Definition 14) attains a given value, the portfolio
value function is the on-curve valuation of the RESERVES — the 𝐿-superscripted quantities (Definition
10): bare 𝑄𝑋,𝑄𝑀 remain the trading-side arguments of Definition 13, while the reserves derived from
liquidity are what the pool holds and what is valued here —
𝜋𝜑(𝑝𝜑) ≡ 𝑝𝜑 𝑄𝐿
𝑋(𝑝𝜑) + 𝑄𝐿
𝑀(𝑝𝜑)
— the portfolio value function of CFMM_GEOMETRY, the conic dual of the trading function (their equiv-
alence theorem); concave and nondecreasing in 𝑝𝜑. Relation to Definition 24: 𝜋linear marks FIXED
holdings at spot; 𝜋𝜑 moves holdings ALONG the curve — at the current price the two coincide, away from
it 𝜋𝜑 falls below the fixed-holdings line, and that concavity gap is what LVR prices. Status: UNFORMAL-
IZED — no Lean carrier (exp/CESLongVolPayoff.pi_eta_trader is the trader-side Bregman object,
distinct).
Definition 26 (LVR rate). The loss-versus-rebalancing rate is a PAYOFF-shaped object — a loss — hence
the𝜋 glyph(userruling2026-08-04): 𝜋LVR, carryingNOtimeargument(itisastatefunctionofthecurrent
tick); the time-argument form 𝜋LVR(𝑡) is the per-block realized loss below, so no bar normalization is
needed. Per MMR, with the second derivative well-defined on Definition 25’s object — and the evaluation
point CORRECTED (user-exposed 2026-08-04) to the current MARGINAL price 𝑝𝜑(𝑖(𝑡)), not the grid
value, the two differing by Proposition 10’s relation:
𝜋LVR ≡
𝜎2(𝑖(𝑡))𝑝2
𝜑
2
| | | | |
𝑑2𝜋𝜑
𝑑𝑝2
𝜑
| | | | |
| | | | |𝑝𝜑=𝑝𝜑(𝑖(𝑡))
(
CPMM: 𝜋LVR =
𝜎2
8
𝜋𝜑
)
Discretization frame (𝑡-indexed, shared by FLAIR and MEV; the Lean carriers keep their w_t/D_t/a_t
names — standing doc-glyph/Lean-name split). Time is stepped by the cadence ∆𝑡; per step 𝑡:
• theper-steptradedVOLUMEinLIQUIDITYUNITSis𝜑(1∕2,0)
(
𝑖(𝑡); ∆𝑄(𝑡), 0
)
=
√
∆𝑄𝑀(𝑡)∆𝑄𝑋(𝑡) ≥
0 — Definition 18’s zero-liquidity convention: the symmetric geometric mean of the two legs,
neither money nor asset alone, commensurable with 𝐿 and ∆𝑄⋆
𝑣 ; NO alias symbol is minted for it
(the former ∆𝑄⋅(𝑡) is retired — user ruling 2026-08-04);
• 𝜋linear(𝑡) > 0 — the per-step capital in MONEY units (Definition 24), serving the MEV/LVR side,
where LVR is intrinsically a money rate;
• 𝜋LVR(𝑡) ≡ 𝜋LVR ⋅ ∆𝑡 ≥ 0 — the per-block arb-opportunity weight: the rate (Definition 26, no
time argument) over one block; the time argument itself marks the per-block object, so no bar
normalization is needed (user ruling 2026-08-04);
16• 𝜈𝑡 ≡ 𝜑(1∕2,0)
(
𝑖(𝑡); ∆𝑄(𝑡), 0
)/
𝜑(1∕2,0)
(
𝑖(𝑡); 0, 𝐿
)
— the PER-STEP UTILIZATION RATIO, exactly
Definition 18’s gate argument: FLAIR’s capital-normalized flow, dimensionless with no numéraire
choice.
Coordinates (user ruling (i), 2026-08-04): FLAIR runs in UTILIZATION coordinates (𝜈𝑡); MEV runs in
MONEY coordinates (𝜋LVR(𝑡)∕𝜋linear(𝑡)). No other 𝑡-indexed symbols are introduced in this section.
Definition 30 (HODL value). The inception basket marked at the current price — the tangent line to 𝜋𝜑
at 𝑝𝜑(𝑡0):
𝜋HODL(𝑡) ≡ 𝑝(𝜂,∆𝑖)(𝑖(𝑡))𝑄𝐿
𝑋(𝑡0) + 𝑄𝐿
𝑀(𝑡0)
𝜋HODL(𝑡0) = 𝜋linear(𝑡0), and thereafter 𝜋HODL(𝑡) ≥ 𝜋𝜑(𝑝𝜑(𝑡)) = 𝜋linear(𝑡) (tangent above the concave
curve) — the gap’s expected rate is 𝜋LVR (Definition 26).
Definition31(Returns). Grossreturnsintheformof[DUFFIE](D.Duffie,DynamicAssetPricingTheory,
3rd ed., Princeton UP, 2001 — the book is copyrighted and not vendored; author-hosted companions:
survey, revisions): payoff over INCEPTION capital — the denominator must be 𝑡0 (a contemporaneous
denominator makes 𝑅𝜑 ≡ 1 by tangency):
𝑅𝜑(𝑡) ≡
𝜋𝜑(𝑝𝜑(𝑡))
𝜋linear(𝑡0)
, 𝑅HODL(𝑡) ≡
𝜋HODL(𝑡)
𝜋linear(𝑡0)
FLAIR
Definition 20 (FLAIR). The LP-competition hazard 𝜆FLAIR is the time-integrated fee yield per unit of
pooled capital — the FLAIR metric of FLAIR, instantiated on this document’s objects:
𝜆FLAIR (𝑡) ≡ ∫
𝑡
𝑡0
∫
𝑝(𝜂,∆𝑖) (𝑖(𝑡))
𝜙(𝜎(𝑖(𝑡));𝑡)𝑑𝑝(𝜂,∆𝑖) (𝑡)
𝜑(1∕2,0)
(
𝑖(𝑡); 0,
∑#LP
𝑗
𝐿𝑗 (𝑖(𝑡);⋅)
) 𝑑𝑡
—numerator: thefeedensitycollectedacrossthepricerange;denominator: thepoolcapitalinLIQUIDITY
UNITS — the trading function at zero flow on the aggregate liquidity, per Definition 18’s utilization
convention (user ruling (i), 2026-08-04: FLAIR is utilization-based; the money-units 𝜋linear serves the
LVR/MEV and ADL layers). It is a plain-𝜆 hazard (Convention 4): fee income arrives; nothing is re-routed.
Tworepairsvstherawnote(user-approved2026-08-04): theundeclared𝑝(⋅) contractionisexpandedto
𝑝(𝜂,∆𝑖) (no new shorthand minted), and the denominator’s first term was corrected 𝑄𝐿
𝑀 → 𝑄𝐿
𝑋 (both terms
were the money leg) — that money-units form was then SUPERSEDED by the utilization-coordinates
restatement above.
Theorem 15 (FLAIR identification and corner solution). The program supΘ𝜆FLAIR
𝜆FLAIR over a sub-
block Θ𝜆FLAIR
⊂ Θ𝜙 is identified and solved. Discretizing per the frame (𝜈𝑡 the per-step utilization ratio;
Λ the logistic of Theorem 10):
𝜆FLAIR = ̄ 𝜙𝑊 + 𝑢
∑
𝑗
𝛼𝑗 𝑊𝑗, 𝑊 =
∑
𝑡
𝜈𝑡, 𝑊𝑗 =
∑
𝑡
Λ
(
𝛾𝑗(𝜎(𝑖(𝑡)) − 𝛽𝑗)
)
𝜈𝑡, 0 ≤ 𝑊𝑗 < 𝑊
Θ𝜆FLAIR
= { ̄ 𝜙, 𝛼, 𝑢(𝛼𝑅)} ∶ 𝜆FLAIR ≤
(
̄ 𝜙max + 𝑢max
∑
𝑗
𝛼𝑗,max
)
𝑊
17attained bang-bang at the level corner for any fixed (𝛽,𝛾); in (𝛽,𝛾) the bound is approached only as
𝛽 → −∞ — a saturation boundary, not a maximum: the shape parameters never attain it (strict gap at
every finite 𝛽). This is the G3 level/shape split: Θ𝜆FLAIR
is a LEVEL block; (𝛽𝑗,𝛾𝑗) only place the transition.
Caveat (kept): this functional has no demand elasticity — the fee–volume trade-off lives in the optimal-fee
layer (FeeSchedule, arXiv:2508.08152). Note (OPEN): Rule 6 charges fees PER LEG; the discretization
applies the composed fee (Rule 7) to volume — the leading-order equivalence of per-leg fee income and
composed-fee-on-volume is assumed, unformalized.
MEV
Sources, allvendored: MMR(theanchor—arbprofitswithfees), MEV_THEORY_I(arXiv2207.11835, the
sandwichchannel),OPT_FEES(arXiv2508.08152,theoptimal-feelayer). Angstromistheimplementation
reference (batch auction / uniform clearing). Statements below carry their provenance tags [M0]–[M10];
the former standalone M-blocks are consumed by this section (byte-pins on them are invalidated by the
move — disclosed).
Convention 5 (Event probabilities) [M0]. Probabilities are written ℙevent: ℙ∆ARB
= arbitrage-trade
probability (the paper’s P_trade; Lean MevOptimization.ptrade), ℙ𝐿JIT
= JIT-arrival probability (CJZ’s
𝜋; Lean 𝜋J).
Notation map [M0]. MMR’s fee symbol 𝛾 is transcribed as this document’s fee 𝜙; this document’s 𝛾_j
stays the sigmoid steepness. The paper’s Poisson block rate 𝜆 is transcribed through its own primitive ∆t
≜ 𝜆-1, because this document’s 𝜆 is the hazard rate (Convention 4). The paper’s composite parameter 𝜂
≜ 𝛾
√
(2𝜆)/𝜎 is deliberately never named — 𝜂 is reserved project-wide for the pricing grid (Definition 8).
Root-block-rate factor:
√
2∕∆𝑡 throughout, no composite abbreviation. Fee = 𝜙 (ceiling ̄ 𝜙, set Θ𝜙); the
quote function is 𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀) (Definition 13), currently 𝜑(1∕2,0) (Rule 5); bare 𝜑 is NOT used.
∆𝑡: mean interblock time (Angstrom: 1 bundle/block/pair ⇐⇒ batch cadence = ∆𝑡). 𝜎(𝑖(𝑡)) enters BOTH
the fee and ℙ∆ARB
— always written in full tick-argument form (Convention 2; no 𝜎𝑡 shorthand). The
𝑡-indexed symbols 𝜋linear(𝑡), 𝜋LVR(𝑡), 𝜈𝑡 (and the unaliased traded volume 𝜑(1∕2,0)(𝑖(𝑡);∆𝑄(𝑡),0)) are
the discretization frame at the head of this section (FLAIR in utilization coordinates, MEV in money
coordinates — user ruling (i), 2026-08-04).
𝜆ARB (Definition 22) ⊊ 𝜆MEV (Definition 23): SUMMAND, not sibling — Definition 19’s index set carries
one, never both (double-count); 𝜆ARB absorbs the “arb toxicity” entry. The paper’s FEE ⊊ 𝜆FLAIR (noise
flow excluded there). Standing hypotheses: the paper’s Assumption 2 (symmetric driftless mispricing,
two-sided fee; non-symmetric variant App. C); Proposition 9 additionally: regularity (13), (15).
Definition 21 (Arbitrage-trade probability) [M1]. Per MMR Thm 1 (§4.1, Assumption 2) — the
long-run fraction of blocks with a profitable arb; bonding-function-independent, only the fee enters:
ℙ∆ARB
(
𝜙(𝜎(𝑖(𝑡));𝑡),𝜎(𝑖(𝑡)),∆𝑡
)
≡
𝜎(𝑖(𝑡))
𝜎(𝑖(𝑡)) + 𝜙(𝜎(𝑖(𝑡));𝑡)
√
2∕∆𝑡
Both slots are instantiated (user comments 2026-08-04): the 𝜎 slot at the realized tick volatility 𝜎(𝑖(𝑡))
(Convention 2), the 𝜙 slot at the schedule value 𝜙(𝜎(𝑖(𝑡));𝑡) (Definition 18). Lean’s ptrade keeps both
slots abstract — Theorem 16’s monotonicities and convexity are statements in the abstract 𝜙 slot.
Theorem 16 (Properties of ℙ∆ARB
) [M1]. ℙ∆ARB
∈ (0,1], with ℙ∆ARB
= 1 ⇐⇒ 𝜙 = 0; strictly decreasing
AND strictly convex in 𝜙; increasing in ∆𝑡 and in 𝜎; → 0 as 𝜙 → ∞. (The strict convexity is what
Theorem 19’s strict half consumes.)
Proposition 9 (The MMR split) [M2]. At fast-block small-fee leading order (≈ inherited by everything
below), the rebalancing loss splits by the trade probability. In this document’s 𝜋-convention (payoff/value
objects; user ruling 2026-08-04): the paper’s ARB is the arb-extracted payoff 𝜋ARB, its FEE is the fee-income
18payoff 𝜋𝜙 (fee glyph 𝜙 — DISTINCT from 𝜋𝜑, the trading-function glyph, per the standing 𝜙/𝜑 split), and
its LVR is the loss payoff 𝜋LVR (Definition 26):
𝜋ARB ≈ 𝜋LVR ⋅ ℙ∆ARB
, 𝜋𝜙 ≈ 𝜋LVR ⋅ (1 − ℙ∆ARB
), 𝜋ARB + 𝜋𝜙 ≈ 𝜋LVR
Status: asserted from MMR Thm 3 + eq. (12), Thm 4 — a Proposition, not a Theorem: the in-tree arb_
add_fee_eq_lvr is a bridge identity only and is never to be cited as MMR Thm 3 formalized.
Definition 22 (The discrete 𝜆ARB) [M3]. The ARB-channel hazard, on the SAME Θ𝜙 as FLAIR (𝜙(𝜎) =
multiFee(𝑛,𝛾,𝛽,𝛼, ̄ 𝜙,𝑢)):
𝜆ARB(𝑡) ≡
∑
𝑠<𝑡
ℙ∆ARB
(
𝜙(𝜎(𝑖(𝑠))),𝜎(𝑖(𝑠)),∆𝑡
) 𝜋LVR(𝑠)
𝜋linear(𝑠)
The running-time argument mirrors 𝜆FLAIR(𝑡) (Definition 20); 𝑠 is the step dummy (user comment 2026-
08-04).
CPMM instantiation — NOT a new definition: both tiers instantiate Definition 26’s object on the CPMM
member, per MMR §7.1 (leading order) and Corollary 2 (exact). Two tiers: (i) the LEADING-ORDER
per-step weight
𝜋LVR(𝑡) =
𝜎2(𝑖(𝑡))
8
𝜋𝜑(𝑡)∆𝑡
(Definition 26’s CPMM case — 𝜋LVR is a RATE ⇐⇒ ⋅∆𝑡 per block; summand ∝ ∆𝑡3∕2 = MMR §7.1 per-block
scaling; no guard needed); (ii) the EXACT Corollary-2 kernel, restated in this document’s objects (𝜋ARB,
𝜋𝜑, Convention 2 — the paper’s ARB/V form was stale notation):
(
𝜋ARB∕𝜋𝜑
)
exact
=
(
𝜎2(𝑖(𝑡))∕8
)
ℙ∆ARB
𝑒𝜙∕2
1 − 𝜎2(𝑖(𝑡))∆𝑡∕8
— the ONLY object carrying the guard 𝜎2(𝑖(𝑡))∆𝑡 < 8; reuse this symbol downstream.
Theorem 17 (Identification of Θ𝜆ARB
) [M4]. For 𝛾𝑗 > 0: 𝜆ARB is decreasing in ̄ 𝜙, 𝛼𝑗, 𝑢, increasing in 𝛽𝑗,
convex in 𝜙; and there is no affine analogue of Theorem 15’s flairMulti_affine — ℙ∆ARB
is non-affine,
level/shape do not separate, Theorem 18’s bound is a SUM, not scalar × path weight. The identified block:
Θ𝜆ARB
= { ̄ 𝜙, 𝛼, 𝑢}
Batch clearing (Definition 23, 𝜆sandwich = 0) ⇐⇒ Θ𝜆MEV
= Θ𝜆ARB
= { ̄ 𝜙,𝛼,𝑢}.
Theorem 18 (The infimum program on 𝜆ARB) [M5].
𝜆ARB(𝑡) ≥
∑
𝑠<𝑡
ℙ∆ARB
(
̄ 𝜙max + 𝑢max
∑
𝑗
𝛼max,𝑗, 𝜎(𝑖(𝑠)), ∆𝑡
) 𝜋LVR(𝑠)
𝜋linear(𝑠)
Three attainment statements (the RHS uses the fee CEILING — unreachable at finite shape): (i) fixed
shape ⇐⇒ the level-block infimum is attained bang-bang at the corner TOP; (ii) the bound is approached
only as 𝛽𝑗 → −∞, with a STRICT gap at every finite 𝛽 (a saturation boundary, not a minimum); (iii) on a
compact box a minimizer exists, with value strictly above the bound.
Annotation [M6a] (internal reference — deliberately not a numbered statement, user ruling 2026-08-04):
over Θ𝜙 unconstrained there is NO trade-off — max 𝜆FLAIR and min𝜆ARB sit at the SAME level corner,
saturate along the SAME 𝛽𝑗 → −∞, robustly to every linear scalarization; (𝛽,𝛾𝑗) are NOT essential.
19Carriers: joint_corner_degeneracy, joint_beta_degeneracy, joint_scalarization_degeneracy
(MevJointProgram.lean). The degeneracy-breaker must come from OUTSIDE Θ𝜙.
Theorem 19 (Flat-path optimality at constant 𝜎; the 𝜎-varying comparison is REFUTED) [M6b].
Over arbitrary nonnegative fee PATHS {𝜙𝑡} — NOT Θ𝜙 schedules — with 𝜈𝑡 per the frame, 𝑊 =
∑
𝑡
𝜈𝑡 > 0,
the FLAIR fee budget 𝐵 ≡
∑
𝑡
𝜙𝑡𝜈𝑡 (the fee income the path is constrained to deliver), aligned measure
𝜋LVR(𝑡) ≡ 𝜑(1∕2,0)(𝑖(𝑡);∆𝑄(𝑡),0), and constant volatility 𝜎(𝑖(𝑡)) ≡ 𝜎(𝑖(𝑡0)):
𝜆ARB ≥ 𝑊 ⋅ ℙ∆ARB
(
𝐵
𝑊
, 𝜎(𝑖(𝑡0)), ∆𝑡), equality ⇐⇒ 𝜙𝑡 constant on {𝑡 ∶ 𝜈𝑡 > 0}
𝐵∕𝑊 is the budget-mean fee — the flat fee delivering the same FLAIR income as the path (flair_
budget_pins_mean_fee) — the flat path minimizes 𝜆ARB at equal FLAIR income; non-constant on
{𝜈𝑡 > 0} is strictly worse (the strict half consumes Theorem 16’s strict convexity). The alignment
𝜋LVR(𝑡) ≡ 𝜑(1∕2,0)(𝑖(𝑡);∆𝑄(𝑡),0) is STRONG (traded volume ∝ LVR path block-by-block — and CROSS-
COORDINATE under ruling (i): a liquidity-units path proportional to a money-units path); without it
Jensen is inapplicable and the conclusion can reverse. REFUTED for 𝜎-varying schedules (mev_ge_
flat_under_flair_budget_false): ∃𝜙(⋅) ≥ 0 with 𝜆flat
ARB > 𝜆
𝜙
ARB at equal FLAIR income — witness
𝑇=2, ∆𝑡=2, 𝐵=2, 𝜎 = (1,10), fees (2,0):
31
22
>
4
3
(𝜎-varying ⇐⇒ different convex summands, Jensen inap-
plicable). OPEN — the Θ𝜙-restricted case: the witness is 𝜎-DEcreasing while Θ𝜙-reachable schedules
are isotone (multiFee_monotone); the refutation settles only the general claim.
Definition 28 (Forward exchange function) [M7]. 𝒮(∆𝑄𝑀) is the output delivered against the money-
leg input ∆𝑄𝑀 at constant trading function — stated in Definition 12’s signature (tick slot first, flow in
the middle slot, 𝐿 in the last slot; function signatures are never changed — user ruling 2026-08-04); the
input rides the money leg of the flow, the output 𝒮(∆𝑄𝑀) is withdrawn from the asset leg (orientation per
Definition 12, subject to the PR-ORIENT FLAG):
𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀)
(
𝑖(𝑡);
(
∆𝑄𝑀, −𝒮(∆𝑄𝑀)
)
, 𝐿
)
= 𝜑(𝜒𝑋∕𝑀,𝜖𝑋∕𝑀)
(
𝑖(𝑡); 0, 𝐿
)
𝒮−1 is the reverse exchange function (CFMM_GEOMETRY); the source’s glyph 𝐺 enters as 𝒮 (user ruling
2026-08-04 — sandwich semantics; also avoids any confusion with the G0–G6 block labels).
Definition 27 (Sandwich hazard) [M7]. Per MEV_THEORY_I eqs. (4)–(6) — the paper’s slippage
limit 𝜂 enters as tolslip (𝜂 is the grid exponent, Definition 8; tol is the tolerance family), its user trade ∆ is
the money-leg flow ∆𝑄𝑀, and its PNL is the sandwich payoff 𝜋sandwich (𝜋-convention) . For a user trade
∆𝑄𝑀 withslippagefloor(1−tolslip)𝒮(∆𝑄𝑀), thefront-run∆𝑄sand
𝑀 (∆𝑄𝑀,tolslip)solvestheslippage-binding
equation, the back-run recovers the position, and the attacker’s payoff is:
𝒮(∆𝑄sand
𝑀 + ∆𝑄𝑀) − 𝒮(∆𝑄sand
𝑀 ) = (1 − tolslip)𝒮(∆𝑄𝑀)
∆𝑄sand′
𝑀 = ∆𝑄sand
𝑀 + ∆𝑄𝑀 − 𝒮−1
(
𝒮(∆𝑄𝑀 + ∆𝑄sand
𝑀 ) − 𝒮(∆𝑄sand
𝑀 )
)
𝜋sandwich(∆𝑄𝑀,tolslip) = ∆𝑄sand′
𝑀 − ∆𝑄sand
𝑀 = ∆𝑄𝑀 − 𝒮−1
(
𝒮(∆𝑄𝑀 + ∆𝑄sand
𝑀 ) − 𝒮(∆𝑄sand
𝑀 )
)
,
𝜋sandwich(∆𝑄𝑀,0) = 0
The sandwich hazard mirrors Definition 22’s shape — extracted sandwich value per unit capital:
𝜆sandwich(𝑡) ≡
∑
𝑠<𝑡
𝜋sandwich
(
∆𝑄𝑀(𝑠),tolslip
)
𝜋linear(𝑠)
≥ 0
Under uniform batch clearing there is no ordering to exploit: ∆𝑄sand
𝑀 = 0 ⇐⇒ 𝜋sandwich = 0 ⇐⇒
𝜆sandwich = 0 (the Angstrom regime). Status: UNFORMALIZED — no Lean carrier; the paper’s profit
bound (linear in tolslip, with a liquidity hurdle) is cited, not transcribed. tolslip — the conjecture is
RESOLVED, split (SandwichTol.lean, CPMM member, all axiom-clean):
20• Θ𝜙 branch REFUTED (sandwich_fee_hurdle_false, 30 bp witness): the exact profitability fron-
tier is 0 < 𝜋sandwich
𝜙
⇐⇒ 𝜙(1 − 𝜙)∆𝑄sand
𝑀 < (1 − 𝜙)(𝑄𝐿
𝑀 + ∆𝑄𝑀) − 𝑄𝐿
𝑀 (pnlFee_pos_iff) —
tolslip does not enter. The fee’s true relationship pins an admissible TRADE SIZE, not the tolerance:
∆𝑄𝑀 ≤
𝜙
1−𝜙
𝑄𝐿
𝑀 ⇐⇒ 𝜋sandwich
𝜙
≤ 0 for every front-run (sandwich_fee_hurdle_corrected); above
it, NO positive tolslip closes the channel.
• Θ𝑝 branch PROVED as stated (sandwich_grid_cap): within one spacing of the MARGINAL
price (priceRatio ≤ 𝑟, 𝑟 = 𝜆𝜂∆𝑖 — the marginal-price step, the SQUARE of the grid step per
Proposition 10), the binding tolerance is capped: tolslip ≤ 1 − 𝑟−1.
So tolslip is functionally BOUNDED by Θ𝑝 and unconstrained by Θ𝜙; it remains a free tolerance of the
tol family inside the Θ𝑝 cap. Supporting: pnl_pos (feeless sandwiches always profit), slip_strictMono
(binding bijection), closed forms slip_eq/pnl_eq/priceRatio_eq/pnlFee_eq (𝑄𝐿
𝑋 cancels in every pay-
off).
Definition 23 (Aggregate MEV hazard) [M7]. The aggregate extraction hazard is the hazard-side sum
𝜆MEV ≡ 𝜆ARB ⊕ 𝜆sandwich
with ⊕ per Definition 19 / Theorem 14 (⊗𝜙 acts on [0,1], NEVER on unbounded hazards). 𝜆sandwich =
0 ⇐⇒ 𝜆MEV = 𝜆ARB — uniform clearing delivers this by construction, so Definition 22 through Theorem
19 transfer to 𝜆MEV verbatim in the Angstrom regime; the sandwich channel is a distinct object (MEV_
THEORY_I), unmodelled here. Protocol choice (DECIDED 2026-08-04): MEV is controlled by the
TAX — Rule 12’s monoid entry (and the JIT liquidity tax when that section converts); auction-recycling
mechanisms (ToB rebates) are NOT part of this protocol and are removed from this document — their
formalized-not-adopted carriers remain in-tree. One parametric lever OUTSIDE Θ𝜙:
Cadence = ∆𝑡: moves 𝜆ARB monotonically, absent from 𝜆FLAIR — the non-degenerate lever outside Θ𝜙.
Caveats [M8] (annotations, no statement class): LEADING ORDER — everything rests on eq. (12)
fast-block small-fee asymptotics; only Definition 22(ii), under its guard, is exact. QUASI-STATIC — ℙ∆ARB
is steady-state, applied per step on a 𝜎-varying path (this document’s extension; valid iff parameters
are slow vs mispricing mixing). NO DEMAND ELASTICITY — the missing term is MMR §7.3 eq.
(27); corner solutions are objective properties, NOT equilibrium claims (the elasticity layer is OPT_
FEES). AGGREGATE SCOPE — two channels only; unmodelled: noise backruns, multi-block censoring
(lengthens ∆𝑡), JIT (taxed separately), gas (additive fee). CADENCE VALIDITY — the ∆𝑡 law is validated
for block times ≳ 1s; sub-second needs jump-diffusion, out of scope. The Theorem 19 𝜎-varying/Θ𝜙-
restricted split stands as labelled there.
Rule 12 (𝜏MEV entry — monoid channel; DECIDED 2026-07-31) [M9]. The MEV tax enters the
trader-paid fee through the proven Abelian monoid (Definition 17 / Theorem 14):
𝜙total ← 𝜙𝑀 ⊗𝜙 𝜙𝑋 ⊗𝜙 𝜏MEV, 𝜙 ⊗𝜙 𝜏MEV ≥ 𝜙 (𝜏MEV ≥ 0, 𝜙 ≤ 1)
Alternatesformalized, NOTadopted: (B)convexseparation𝜙 = (1−𝜏MEV)𝜙+𝜏MEV𝜙 (incidence-targeting,
intensity-neutral); (C) auction lump-sum ToB recycling (taxFraction, mevNet — mechanism not part of
this protocol; removed from the document 2026-08-04).
Theorem 20 (The discriminating algebra — what the monoid entry buys and cannot buy) [M10].
(A) intensity: ℙ∆ARB
(
𝜙 ⊗𝜙 𝜏MEV
)
≤ ℙ∆ARB
(𝜙) (strict for 𝜏MEV > 0, 𝜙 < 1)
(A) no targeting: (𝜙𝑀 ⊗𝜙 𝜏MEV) ⊗𝜙 𝜙𝑋 = 𝜙𝑀 ⊗𝜙 (𝜙𝑋 ⊗𝜙 𝜏MEV) (aggregate leg-invariant)
(A) hazard-exact: (1 − 𝑒−𝜆𝑀 ) ⊗𝜙 (1 − 𝑒−𝜆𝑋 ) ⊗𝜙 (1 − 𝑒−𝜆𝜏) = 1 − 𝑒−(𝜆𝑀+𝜆𝑋+𝜆𝜏)
(A ≠ B): ∃𝜙,𝜏 ∶ (1 − 𝜏)
(
𝜙𝑀 ⊗𝜙 𝜙𝑋
)
≠
(
(1 − 𝜏)𝜙𝑀
)
⊗𝜙
(
(1 − 𝜏)𝜙𝑋
)
(B breaks hazard): ∃𝜏,𝜆 ∶ 1 − 𝑒−𝜏𝜆 ≠ 𝜏(1 − 𝑒−𝜆)
21Consequences (proved): 𝜆𝜏 is a genuine ⊕-summand (hazard-exact); the intensity effect is STRICT ⇐⇒
𝜆ARB ↓; NO leg-targeting (benign flow pays); NO compensation routed (donation ⇐⇒ compose with (B)/(C),
ORDER-SENSITIVE: tax-then-compose ≠ compose-then-split); 𝜙 ⊗𝜙 𝜏 moves the level direction jointly
(𝜆FLAIR ↑, 𝜆ARB ↓).
Goal:
𝜋𝜎 = ∆𝑄𝑣
(
𝜎2(𝑖(𝑡)) − 𝜎2
𝐾
)+
22