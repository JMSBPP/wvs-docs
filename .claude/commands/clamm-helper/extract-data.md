Extract DEX data from subgraph GraphQL endpoints for research analysis.

## Prerequisites

1. Verify `questions.md` exists with research questions defined
2. Confirm Docker is running with `docker ps` (pg_duckdb container)
3. Check target subgraph is accessible (Uniswap v4, Balancer v3, or Algebra)

## Workflow

### Step 1: Analyze Research Questions

Read `questions.md` and identify:
- Which DEX protocols are relevant (Uniswap, Balancer, Algebra)
- What data entities are needed (pools, swaps, liquidity positions, ticks)
- Time range requirements
- Granularity needs (per-block, hourly, daily)

Present findings to user and get approval before proceeding.

### Step 2: Design GraphQL Queries

For each data requirement, draft GraphQL queries targeting:
- `Uniswap/v4-subgraph` - Concentrated liquidity pools, swaps, positions
- `balancer/balancer-subgraph-v3` - Weighted pools, stable pools, liquidity
- `cryptoalgebra/Algebra_Subgraph` - Dynamic fee pools, farming positions

Show proposed queries to user. Explain what each query extracts.

### Step 3: User Requirements Check

If any tools require user setup:
- API keys for rate-limited endpoints
- VPN for geo-restricted subgraphs
- Additional Python packages

List requirements clearly. Wait for user confirmation.

### Step 4: Execute Extraction

With user permission:
1. Run GraphQL queries against subgraph endpoints
2. Transform JSON responses to DataFrames
3. Store raw data to pg_duckdb (`raw_` prefixed tables)
4. Export backup to `agents/out/*.parquet`

Report extraction results: row counts, date ranges, any errors.

### Step 5: Confirm Completion

Summarize:
- Tables created in pg_duckdb
- Files exported to `agents/out/`
- Suggest next command: `/project:clamm-helper:transform-data`

## Subgraph Endpoints Reference

```
uniswap_v4: https://api.thegraph.com/subgraphs/name/uniswap/uniswap-v4
balancer_v3: https://api.thegraph.com/subgraphs/name/balancer-labs/balancer-v3
algebra: https://api.thegraph.com/subgraphs/name/cryptoalgebra/algebra
```

## Output Locations

- Database: `dex_amm` (pg_duckdb container)
- Parquet backups: `agents/out/raw_*.parquet`
- Query logs: `agents/out/extraction_log.md`
