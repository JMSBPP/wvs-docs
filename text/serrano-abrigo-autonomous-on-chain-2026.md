---
sha256: 060f4676d3362b8a209669a0f413d3ab8e5ad17a325e6483e5617eca52ad3bae
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 1509
---
Abrigo: Autonomous On-Chain Macro Hedging
Consensus-verified AI agents on Somnia
Juan Manuel Serrano
Encode × Somnia Agentathon
June 6, 2026
Serrano Abrigo June 6, 2026 1/4The problem: hedging macro tail risk on-chain
Macro data is paywalled and off-chain. A CPI shock is knowable, but not
natively on-chain.
Tail risk needs a convex hedge. A linear position bleeds; you want small cost,
large payoff in the tail.
Every on-chain oracle is a trusted third party. The decision rests on someone’s
word.
Abrigo removes all three − an agent that reads, reasons, and hedges, verified
by consensus.
Serrano Abrigo June 6, 2026 2/4Architecture: AI verified by consensus, not trusted
Keeper
feeds macro datum
MacroOracle
(Somnia)
Strategist
inferString / inferNumber
Validators re-execute
the LLM inference
→ consensus state
Executor
decision → mint
wCOP-USDC
long-gamma
(Polygon fork)
Settle
residual, fuzz-proven
The decision is consensus state − AI you can verify, not an oracle you must trust.
Serrano Abrigo June 6, 2026 3/4What’s real − and reproducible
Live on Somnia testnet: the decision moves with consensus
→ 0x2a8ec994... ADD LONG GAMMA | 0x5057f803... REDUCE
Full execution: decision → mint → settle on the real wCOP-USDC pool
(Polygon fork)
Settlement fuzz-proven in our v4 / Panoptic fork suite − never over- or
under-pays
Next: a Uniswap v4 hook that auto-hedges LPs from the same macro signal
Public repo − reproduce the decisions yourself.
Serrano Abrigo June 6, 2026 4/4