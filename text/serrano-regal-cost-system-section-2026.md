---
sha256: 83a245479f2309e583fa1fbf9403fbefc11a9788ac4e87f67e72a677c405ac48
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 14529
---
The Regal Cost System for a Web3 Representative Analyst:
Primal/Dual Decomposition over Somnia Agent Calls and x402
Data Fetches
DRAFT v0.1 — first synthesis of Wave-A (Somnia) and Wave-B (x402) extractions
Abrigo Analytics — Iteration regal cost system v0.1
2026-05-23
Abstract
This section formalizes the cost system faced by a Web3 representative analyst whose pro-
duction function consumes two strictly disjoint resource classes: on-chain data fetched via
x402-metered microtransactions, and AI-agent compute invoked via Somnia’s three published
agent primitives (json-fetch, llm-inference, llm-parse-website). We decompose the ana-
lyst’s cashflow into a primal capital-consumption vector (KD,KAI) and a dual unit-cost vector
(cD,cAI) linked by an exchange-rate market M, then state the joint conditions on the resulting
cashflow process under which a long-gamma convex perpetual instrument strictly dominates any
linear hedge. Every empirical constant carries a primary-source citation; the four dominance
conditions are stated as a falsifiable joint test, not a marketing claim.
## 1 Motivation and contribution
The analyst’s cost stream is the composition of two distinct volatility channels: exchange-rate vol
(in ρX/YD
and ρYAI/YD
) and arrival-rate vol (in the count processes KD and KAI). When both
channels carry fat tails, vol-of-vol, and self-excitation, the joint cashflow distribution is positively
skewed in a way that a linear FX forward or a streaming swap cannot hedge without a costly
basis. The contribution of this section is a generic notation under which any (YD,YAI,X) cohort
drops into the same four-condition convex-hedge dominance test. The Somnia + x402 instantiation
studied below is one such cohort; the notation extends without rewriting.
## 2 Primal-space resource consumption
Let N ∈ N index the distinct data-fetch endpoints (subgraphs, RPC, REST). Fix the three Somnia
agent primitives published as of 2026-05-231:
KD =



K
(1)
D
. . .
K
(N)
D


, KAI =



K
(json-fetch)
AI
K
(llm-inference)
AI
K
(llm-parse-website)
AI


.
KD is measured in queries per period; KAI in agent-call-count per period, one row per primitive.
1
The published primitive set is explicitly labelled a “stop-gap” to be replaced by consumption-based pricing; see
https://docs.somnia.network/agents/invoking-agents/gas-fees. Future primitives append rows; the method-
ology is invariant.
13 Dual-space cost system
Let X denote the analyst’s unit-of-account, YD the data-side payment unit (USDC for every pro-
duction x402 facilitator surveyed: The Graph Gateway, Stellar, Eco MCP, generic Base merchants),
and YAI the agent-side payment unit. We adopt the normalization YAI ≡ 1 SOMI throughout; YD
is the contract-denominated USDC unit. The exchange-rate market is
M =

ρX/YD
ρYAI/YD

.
## 3.1 Data-side unit cost (x402)
The baseline per-query cost takes the form
cD(YD,κ) =
YD
100
· f(κ), f(1) = 1, (1)
where κ is a server-side complexity index. Two facts about f(κ):
(i) No first-class complexity field in the protocol. The x402 v2 PaymentRequirements
schema carries no complexity, weight, or κ field. Pricing latitude enters via the upto scheme,
which enforces only the inequality2
settled amount ≤ authorized maximum. (2)
Equation (2) is the only protocol-level statement about f(κ). Any closed-form f is a provider-
specific overlay.
(ii) The upstream pricing rule (The Graph → Agora). For The Graph endpoints, the
Agora pricing language3 decomposes a query Q into its top-level GraphQL fields and prices each
independently:
Cost(Q) =
X
q ∈top-level(Q)
Cost(q), (3)
with each Cost(q) determined by the indexer’s first matching Statement in an ordered Agora model.
The candidate drivers of κ extractable from the public surface are: number of top-level fields,
named-argument bindings ($first, $skip, $where), indexer SYSTEM LOAD and INDEXER COST glob-
als, response bytes, and the time-window of historical state queried.
Per-provider price table. The YD/100 = $0.01 USDC anchor is confirmed at the un-aggregated
per-query tier; the GraphTally aggregation layer compresses the effective rate to $4/105 ≈ $4×10−5
per query via Receipt Aggregate Vouchers redeemed at ≈$0.015 each.
Provider Quoted price Source
The Graph (unbatched) $0.01 / query E10 empirical anchor, 2026-04
The Graph (GraphTally) $4 × 10−5 / query thegraph.com blog, 2026-05-23
Generic x402 scrape $0.01 structured extraction simplescraper.io
Generic x402 feed $0.005 curated feed simplescraper.io
x402 testnet starter $0.001 simplescraper.io
2
See https://github.com/coinbase/x402/blob/main/specs/schemes/upto/scheme_upto_evm.md, fetched 2026-
05-23.
3
See https://github.com/graphprotocol/agora/blob/main/docs/reference/models.md, fetched 2026-05-23.
23.2 Agent-side unit cost (Somnia)
The three published per-call fees in absolute SOMI are
cAI(YAI) = YAI ·


0.03
0.07
0.10

 =


0.03
0.07
0.10

 SOMI/call, (4)
covering json-fetch, llm-inference, and llm-parse-website respectively.4 An earlier draft
inadvertently encoded these as YAI/30, YAI/70, YAI/10, which fails to reconcile (the correct re-
ciprocals would be 33.33, 14.29, 10 with YAI ≡ 1 SOMI); the absolute-price form (4) avoids that
confusion.
The on-chain deposit semantics are governed by the IAgentRequester interface5. The required
message value satisfies the inequality
msg.value ≥ minPerAgentDeposit · subSize + pi · subSize, (5)
with minPerAgentDeposit = 0.01 SOMI, default subSize = 3, and pi ∈ {0.03, 0.07, 0.10} the per-
primitive price. The interface call getRequestDeposit() returns only the operations-reserve floor
minPerAgentDeposit · subSize, not the practical deposit.
## 3.3 Net-cost adjustment from Somnia tokenomics
Equation (4) is the gross cost; the analyst’s net cost is reduced by the fee-burn channel. The
published rule6 splits every paid fee 50/50 between burn and validator payouts:
1 SOMI in fees −→ 0.5 SOMI burnt | {z }
supply contraction
+ 0.5 SOMI to validators | {z }
stake-weighted
. (6)
The holder-level rebate per unit fee is b·(analyst balance/circulating supply) with b = 0.5, negligible
for any non-whale analyst but material at the aggregate demand-modeling layer. The net-cost upper
bound is therefore
cnet
AI (YAI;θ) ≤ cAI(YAI) − r(YAI;θ), r(YAI;θ) ≥ 0, (7)
where r aggregates burn-induced supply rebate, validator payout (if the analyst stakes), and
per-request escrow refunds. The escrow-refund channel is exposed in the interface via the
NativeTransferFailed event but the closed-form refund equation is not in the interface file; it
lives in the mainnet implementation contract and is left UNVERIFIED in this draft.
## 3.4 Base EVM gas (stack-on under the fixed fee)
The gas paid under the agent-fee envelope satisfies7
TotalFee = GasUsage · GasUnitPrice, GasUsage ≥ 21,000. (8)
4
See https://docs.somnia.network/agents/invoking-agents/gas-fees, fetched 2026-05-23. The page is the
canonical current rate sheet; no effective-date metadata is published, and the docs label the per-type fixed pricing as
a “stop-gap” to be replaced by consumption-based pricing.
5
https://github.com/emrestay/somnia-agents-skills/blob/main/references/interfaces/
IAgentRequester.sol, commit e15d4e9, fetched 2026-05-23. Mainnet implementation:
0x5E5205CF39E766118C01636bED000A54D93163E6.
6
See https://docs.somnia.network/concepts/tokenomics/gas-fees, fetched 2026-05-23.
7
See https://docs.somnia.network/concepts/tokenomics/gas-fees, fetched 2026-05-23.
3The base gas unit price is $6.16×10−9 per gas with a $6.16×10−10 floor at ≥400 TPS sustained.
A validator-vote congestion adjuster halves or doubles the base fee at a 95 ms block-execution
threshold over a 10-block window.
3.5 The cross-rates ρX/YD
and ρYAI/YD
With YD = USDC, the cross-rate ρX/YD
is unity in baseline: ρUSD/USDC = 1 + εt with empirical
deviation εt. Treat εt as a left-skewed jump process parameterized against the USDC depeg of
March 2023; Wu & Liu (2026)8 classify USDC as a “stability anchor” with regulatory capital
buffers 2–3× lower than non-fiat-backed stablecoins.
The agent-side cross-rate ρYAI/YD
= ρSOMI/USDC has no on-chain oracle as of 2026-05-23.
Protofire-Chainlink publishes USDC/USD, ETH/USD, and BTC/USD on Somnia mainnet but
no SOMI/USD feed; DIA and API3 do not publish SOMI/USD either. The methods-paper analyst
must source ρYAI/YD
off-chain (CoinGecko, CoinMarketCap, or Messari aggregator) until a native
oracle ships — a real modeling gap, flagged here for closure in the deployment phase.
## 4 The cashflow process
Per period [t, t + dt] the analyst’s gross cashflow in unit-of-account X is
dCt = ρX/YD
· cD(YD, κt) · dKD,t
| {z }
data leg
+ ρX/YD
· ρYAI/YD
· cAI(YAI) · dKAI,t
| {z }
Somnia leg
. (9)
## 4.1 Arrival-process specification
The null specification for dKD,t and dKAI,t is a non-homogeneous Poisson process (NHPP) on a
daily grid, calibrated using the Kirchner (2015) INAR(p) bin-count estimator9. The alternative is
a multivariate Hawkes process with per-endpoint kernels: foundational moment formulas in Daw
& Pender (2017)10 establish that under self-excitation Var(KD(t)) ≫ E[KD(t)], producing super-
linear cashflow-variance growth a Poisson model misses. Direct evidence that on-chain arrival
processes reject Poisson in favor of Hawkes is given by Luo et al. (2022) for Bitcoin block arrivals11.
Model selection between NHPP and Hawkes proceeds via the likelihood-ratio test of Chen et al.
(2017)12; the methods paper should report both fits.
## 5 Convex-hedge dominance: the four-condition joint test
The settlement primitive is the perpetual oracle-free option of Lambert & Kristensen (2022)13;
convexity comes from the option payoff’s positive gamma. A long-gamma convex perpetual written
on Ct strictly dominates any linear hedge (FX forward, streaming swap) under the following four
conditions on the joint cashflow distribution.
8
https://arxiv.org/pdf/2602.18820v1
9
https://arxiv.org/pdf/1509.02017v2
10
https://arxiv.org/pdf/1707.05143v3
11
https://arxiv.org/pdf/2203.16666v1
12
https://arxiv.org/pdf/1702.06055v2
13
https://arxiv.org/pdf/2204.14232v3
4Assumption 1 (Vol-of-vol > 0). The realized variance of dCt is itself stochastic, with
Var(Var(Ct,t+h)) bounded away from zero for the holding interval h. Akdogan (2019)14 and Rolloos
(2020)15 show the leading correction to forward-style pricing is convex in the underlying under this
regime, so a long-gamma instrument captures vol-of-vol risk a linear forward cannot.
Assumption 2 (Positive skew / fat tails in cD ·N(t)). The cashflow unit cost times arrival count
has positive skewness and a tail heavier than the lognormal. Selmi & Bouchaud (2000)16 establish
that under such tails, a tail-sensitive risk measure strictly decreases both the probability of extreme
losses and the sensitivity of the hedge to the underlying, requiring positive gamma.
Assumption 3 (Hawkes self-excitation in arrivals). At least one of dKD,t, dKAI,t admits a
Hawkes-type self-exciting intensity. The Daw & Pender (2017) moment formulas show Var(N(t))
grows super-linearly in t under self-excitation; a linear hedge sized on E[N(t)] underprovisions.
Assumption 4 (Stablecoin depeg jump risk). The cross-rate ρX/YD
admits a left-skewed jump
component εt empirically anchored on the USDC depeg of 2023. Wu & Liu (2026)17 and Hernandez
Cruz et al. (2024)18 document measurable Uniswap MCI shocks from the event; a linear forward
cannot hedge a one-sided jump without a costly basis.
Proposition 1 (Convex-hedge dominance). Under Assumptions ??–??, a long-gamma convex per-
petual written on Ct strictly dominates any linear hedge in second-order-stochastic-dominance sense
for the analyst’s risk-neutralized P&L. Constructive replication follows the Carr–Madan strip of Ma
et al. (2014)19 and its FX-tail update of De Vries (2026)20; the variance-optimal semi-static hedge
of Di Tella, Haubold & Keller-Ressel (2017)21 formalizes the dominance result under stochastic
volatility.
Remark 1 (Falsification, not marketing). If any of ??–?? fails empirically, the convex framing
is unjustified and the analyst should reach for a linear instrument. The methods paper reports the
joint test as a four-arm robustness check; a single failure suffices to halt instrument deployment.
## 6 Items left UNVERIFIED in this draft
The following are gaps requiring follow-up before peer-review submission, in descending order of
impact:
1. Exact rebate formula in the deployed AgentRequester implementation at mainnet
0x5E5205CF39E766118C01636bED000A54D93163E6 — only the existence of a rebate path is
verified (NativeTransferFailed event); the closed-form refund is not in the interface.
2. Agora globals.md reference — SYSTEM LOAD, INDEXER COST, and per-query bind variables
would tighten the κ-decomposition in §3.1.
14
https://arxiv.org/pdf/1910.03245v4
15
https://arxiv.org/pdf/2001.02404v4
16
https://arxiv.org/pdf/cond-mat/0005148v1
17
https://arxiv.org/pdf/2602.18820v1
18
https://arxiv.org/pdf/2407.11716v1
19
https://arxiv.org/pdf/1406.5430v1
20
https://arxiv.org/pdf/2601.14852v1
21
https://arxiv.org/pdf/1709.05527v1
53. The Graph’s pricing-page reconciliation of the $0.01 vs $4 × 10−5 tiers — needed to fix the
per-provider table.
4. Cloudflare deferred-payment scheme — referenced in 2026-05 search results but absent from
the stable v2 spec; if Cloudflare publishes complexity-indexed pricing, it becomes a second
provider for §3.1.
5. Empirical Hawkes-vs-Poisson test on actual x402 call logs — no public dataset of x402 call
timestamps was located; Abrigo’s own E10 dataset is the most direct empirical anchor for the
Assumption ?? test.
6. Validator-emission 10% cap — attested in Bitget/OKX/Messari secondary sources but not
directly verified on docs.somnia.network.
7. x402 whitepaper PDF and scheme exact evm.md — not parsed in this draft; should be re-
trieved if the methods paper contrasts EIP-3009 and Permit2 settlement primitives.
Primary-source citation inventory
All claims above resolve to URL-bearing entries in notes/somnia cost extraction.md (Wave A,
2026-05-23) and notes/x402 cost extraction.md (Wave B, 2026-05-23). Each cited equation,
constant, and inequality carries a primary-source URL and a UTC fetch timestamp in those files.
A consolidated .bib for peer-review submission is left for the v0.2 pass once the gaps in §?? are
closed.
6