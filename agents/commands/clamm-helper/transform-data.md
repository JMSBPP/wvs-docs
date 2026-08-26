Transform raw DEX data into analysis-ready datasets aligned with research questions.

## Prerequisites

1. Raw data loaded in pg_duckdb (run `/project:clamm-helper:extract-data` or `/project:clamm-helper:load-data` first)
2. Research questions defined in `questions.md`
3. Verify data tables exist: `SELECT table_name FROM information_schema.tables;`

## Workflow

### Step 1: Review Research Requirements

Read `questions.md` and identify required transformations:
- Aggregations (OHLCV, volume by period, TVL snapshots)
- Calculations (impermanent loss, LP returns, fee accrual)
- Joins (pools ↔ swaps ↔ positions)
- Filters (date ranges, token pairs, minimum liquidity)

Present transformation plan to user for approval.

### Step 2: Propose Derived Tables

For each research question, design output schema:

**Example transformations:**
- `pool_hourly_stats` - Aggregated pool metrics per hour
- `lp_position_returns` - Position-level P&L with IL decomposition
- `swap_price_impact` - Price movement per swap with slippage
- `liquidity_distribution` - Tick-level liquidity across price ranges

Show column definitions. Explain calculation logic.

### Step 3: User Approval

Before executing:
- Confirm transformation logic is correct
- Verify output granularity meets research needs
- Check for any edge cases (zero liquidity, extreme prices)

Wait for explicit user approval.

### Step 4: Execute Transformations

With permission:
1. Create derived tables in pg_duckdb
2. Run transformation queries (show SQL for transparency)
3. Validate output row counts and value ranges
4. Export results to `agents/out/transformed_*.parquet`

Report progress for long-running transformations.

### Step 5: Quality Checks

Run validation:
- No NULL values in critical columns
- Numeric values within expected ranges
- Timestamps are continuous (no gaps)
- Aggregations sum correctly

Report any data quality issues.

### Step 6: Confirm Completion

Summarize:
- Derived tables created
- Files exported
- Data quality status

Suggest next command: `/project:clamm-helper:visualize-data`

## Common Transformations

**Hourly OHLCV:**
```sql
CREATE TABLE pool_hourly AS
SELECT
    pool_id,
    date_trunc('hour', timestamp) as hour,
    first(price) as open,
    max(price) as high,
    min(price) as low,
    last(price) as close,
    sum(volume_usd) as volume
FROM swaps
GROUP BY pool_id, date_trunc('hour', timestamp);
```

**Impermanent Loss:**
```sql
-- IL = 2 * sqrt(price_ratio) / (1 + price_ratio) - 1
SELECT
    position_id,
    2 * sqrt(current_price / entry_price) / (1 + current_price / entry_price) - 1 as il_pct
FROM positions;
```

**LP Returns with Fees:**
```sql
SELECT
    position_id,
    (fees_earned_usd + value_change_usd) / initial_value_usd as total_return,
    fees_earned_usd / initial_value_usd as fee_return,
    value_change_usd / initial_value_usd as il_return
FROM position_snapshots;
```

## Output Locations

- Derived tables: `dex_amm` database
- Parquet exports: `agents/out/transformed_*.parquet`
- Transformation log: `agents/out/transform_log.md`
