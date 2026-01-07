Create visualizations and analysis notebooks to answer research questions.

## Prerequisites

1. Transformed data available in pg_duckdb or `agents/out/*.parquet`
2. Research questions defined in `questions.md`
3. Python environment with visualization libraries available
4. Run prior commands: `extract-data` → `transform-data`

## Workflow

### Step 1: Review Research Questions

Read `questions.md` and identify visualization needs:
- Time series plots (price, volume, TVL over time)
- Distribution analysis (returns, IL, fee yields)
- Comparative charts (protocol vs protocol, pool vs pool)
- Regression/correlation plots (for econometric analysis)

Present visualization plan to user.

### Step 2: Propose Visualizations

For each research question, suggest chart types:

**AMM Analysis:**
- Liquidity distribution across price ticks (histogram/heatmap)
- Impermanent loss vs holding (line chart comparison)
- Fee APY by pool characteristics (scatter plot)
- Volume/TVL ratio trends (dual-axis time series)

**Econometric Visualizations:**
- Residual plots for regression diagnostics
- ACF/PACF for time series analysis
- QQ plots for distribution testing
- Rolling window statistics

Show mockup descriptions. Get user approval.

### Step 3: Create Jupyter Notebook

With user permission, create notebook in `agents/out/`:

```
agents/out/analysis_{topic}_{date}.ipynb
```

Notebook structure:
1. **Setup** - Imports, database connection, data loading
2. **Data Overview** - Shape, dtypes, summary statistics
3. **Visualizations** - One section per research question
4. **Findings** - Key observations and insights
5. **Next Steps** - Follow-up questions, additional analysis needed

### Step 4: Implement Visualizations

Use Python libraries:
- **matplotlib/seaborn** - Static publication-quality plots
- **plotly** - Interactive charts for exploration
- **pandas** - Quick data exploration plots

Follow financial data conventions:
- Log scale for prices when appropriate
- Basis points for returns/yields
- Proper date formatting on x-axis
- Clear legends and annotations

### Step 5: Run Analysis

Execute notebook cells sequentially:
1. Verify data loads correctly
2. Generate each visualization
3. Add observations as markdown cells
4. Export figures to `agents/out/figures/`

Report any errors or unexpected results.

### Step 6: User Review

Present completed visualizations:
- Summary of key findings
- Notable patterns or anomalies
- Suggested interpretations

Ask user:
- Are visualizations answering the research questions?
- Any additional charts needed?
- Ready to proceed to econometric modeling?

### Step 7: Confirm Completion

Summarize:
- Notebook created: `agents/out/analysis_*.ipynb`
- Figures exported: `agents/out/figures/*.png`
- Key findings documented

Suggest next steps:
- Deeper econometric analysis (reference arXiv papers via researcher skill)
- Export results for presentation
- Refine research questions based on findings

## Visualization Templates

**Time Series with Volume:**
```python
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8), sharex=True)
ax1.plot(df['timestamp'], df['price'], label='Price')
ax2.bar(df['timestamp'], df['volume'], alpha=0.7, label='Volume')
ax1.set_ylabel('Price (USD)')
ax2.set_ylabel('Volume (USD)')
plt.tight_layout()
```

**IL vs Price Change:**
```python
fig, ax = plt.subplots(figsize=(10, 6))
ax.scatter(df['price_change_pct'], df['il_pct'], alpha=0.5)
ax.axhline(0, color='red', linestyle='--', alpha=0.5)
ax.set_xlabel('Price Change (%)')
ax.set_ylabel('Impermanent Loss (%)')
ax.set_title('IL vs Price Movement')
```

**Liquidity Heatmap:**
```python
pivot = df.pivot_table(values='liquidity', index='tick', columns='timestamp')
sns.heatmap(pivot, cmap='YlOrRd', ax=ax)
ax.set_title('Liquidity Distribution Over Time')
```

## Output Locations

- Notebooks: `agents/out/analysis_*.ipynb`
- Figures: `agents/out/figures/*.png`
- Analysis notes: `agents/out/findings.md`

## Required Python Packages

```
pandas
numpy
matplotlib
seaborn
plotly
sqlalchemy
psycopg2-binary
pyarrow
```
