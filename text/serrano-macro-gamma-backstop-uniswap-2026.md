---
sha256: d516448e359d7f271472ee6046e9b5dfe8ce5c48d99c025dab32d45632f18595
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 1520
---
Macro-Gamma Backstop
A Uniswap v4 hook that hedges LPs from an on-chain macro signal
Juan Manuel Serrano
Atrium UHI Hookathon
June 6, 2026
Serrano Macro-Gamma Backstop June 6, 2026 1/4Every LP is structurally short gamma
Impermanent loss is a short straddle you
never chose to sell.
Existing IL-hedge hooks react to realized
vol − after the move.
But the biggest moves are macro (CPI,
rates) − and they are knowable signals.
→ What if the pool hedged itself, sized by
a live macro view, before the move?
price
LP value
short gamma
IL payoff ≈ a sold straddle
Serrano Macro-Gamma Backstop June 6, 2026 2/4The mechanism, and why it’s new
swap
afterSwap
skim (unspecified)
poolManager
.take
long-gamma
hedge vault
skim size = macro signal × base
Existing IL-hedge hooks Macro-Gamma Backstop
Signal realized vol (after the fact) macro, before the move
Hedge shape varies / linear-ish long gamma (convex)
Sizing static / pool-local macro-signal-sized
Serrano Macro-Gamma Backstop June 6, 2026 3/4Proven, and where it goes
Live test: swaps accrue skim → macro signal flips risk-off → multiplier jumps →
vault grows
Invariants: Σ skims = vault balance | swapper conserved | hook delta ≥ 0
| multiplier bounded
Composable: on the v4 singleton; backs LPs without forking core
Next: wire the Panoptic execution leg; the macro signal is what our separate
Somnia agent already decides on-chain (cross-chain − not yet wired)
Every test green in the public repo.
Serrano Macro-Gamma Backstop June 6, 2026 4/4