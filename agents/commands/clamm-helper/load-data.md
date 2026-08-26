Load existing data into pg_duckdb for analysis or restore from previous extractions.

## Prerequisites

1. Docker container `dex-research-db` is running
2. Data files exist in `agents/out/` (Parquet, CSV, or JSON)
3. Connection to pg_duckdb is verified

## Workflow

### Step 1: Inventory Available Data

Scan for loadable data:
- `agents/out/*.parquet` - Previously extracted DEX data
- `agents/out/*.csv` - Exported analysis results
- `agents/out/*.json` - Raw GraphQL responses
- `refs/agents/*.pdf` - Research papers (metadata only)

Present inventory to user with file sizes and modification dates.

### Step 2: Determine Load Strategy

Ask user:
- Load all available data or select specific files?
- Append to existing tables or replace?
- Create new schema or use existing?

### Step 3: Validate Data Structure

Before loading, inspect:
- Column names and types
- Null values and data quality
- Date/timestamp formats
- Numeric precision (important for token amounts)

Report any issues. Suggest transformations if needed.

### Step 4: Execute Load

With user permission:
1. Connect to pg_duckdb container
2. Create tables if they don't exist
3. Load data with appropriate type casting
4. Create indexes on common query columns (timestamp, pool_id, token addresses)

Show progress for large files.

### Step 5: Verify Load

Run validation queries:
```sql
SELECT table_name, row_count FROM information_schema.tables WHERE table_schema = 'public';
```

Report:
- Tables loaded
- Row counts per table
- Any load errors or warnings

### Step 6: Confirm Completion

Summarize loaded data. Suggest next command:
- `/project:clamm-helper:transform-data` if raw data needs processing
- `/project:clamm-helper:visualize-data` if data is analysis-ready

## Database Connection

```
Host: localhost
Port: 5432
Database: dex_amm
User: researcher
Password: dex_research_2024
```

## Common Load Patterns

**Parquet to Table:**
```sql
CREATE TABLE swaps AS SELECT * FROM read_parquet('agents/out/raw_swaps.parquet');
```

**CSV with Headers:**
```sql
CREATE TABLE pools AS SELECT * FROM read_csv_auto('agents/out/pools.csv');
```

**Append Mode:**
```sql
INSERT INTO swaps SELECT * FROM read_parquet('agents/out/new_swaps.parquet');
```
