---
name: data-analyst
description: Guide ETL processes specialized on econometric analysis of DEX data focused on AMM semantics, connection with finance structured products, and financial econometrics.
license: Complete terms in LICENSE.txt
---

This skill guides the whole ETL process specialized on econometric analysis of DEX data focused on AMM semantics, connection with finance structured products, and financial econometrics. Use focused subgraphs leveraging specific SDKs and API endpoints.

The user will provide queries in plain English text that must be fully scoped and clear before running into data exploration.

## DEX Coverage

The DEX coverage limits to:

- cryptoalgebra/Algebra_Subgraph
- Uniswap/v4-subgraph
- balancer/balancer-subgraph-v3

> These are the reference paths for the GitHub repos that must be referenced for documentation, requirements, and debugging.

## Implementation Guidelines

- Prioritize the use of Python
- If there are no SDKs or implemented Python endpoints to the subgraph, default to the available language
- For data storage, rely on Docker container cloud storage

## Research Design

Before coding, understand the context. You must always have a set of research questions to be answered, provided by the user:

- **Purpose**:
    - What is the underlying set of research questions the user needs this data for?
    - What is the underlying model innovation and assumptions, if any?
    - What is the experiment?
    - What are the results?

## Econometric Methodology

For every data analysis task, start with the most minimalistic regression model and build up to more complex models only if necessary.

If any econometric method is more complex, rely on the arXiv MCP server using the following tags to read papers:

### Primary Tags

- **econ.EM (Econometrics)**: Primary tag for econometric theory, micro-econometrics, macro-econometrics, and methodological aspects of statistical inference applied to economic data.
- **q-fin.ST (Statistical Finance)**: Key tag for financial econometrics. Covers statistical and econometric analyses specifically applied to financial markets and economic data.

### Related Quantitative Finance Tags

Financial econometrics papers are often cross-listed or found under these q-fin (Quantitative Finance) sub-categories:

- **q-fin.MF (Mathematical Finance)**: Mathematical and analytical methods, including stochastic and probabilistic analysis.
- **q-fin.PM (Portfolio Management)**: Security selection, capital allocation, and performance measurement.
- **q-fin.RM (Risk Management)**: Measurement and management of financial risks.
- **q-fin.TR (Trading and Market Microstructure)**: Market microstructure, transaction costs, and trading strategies.

## Execution

Choose a clear conceptual direction and execute it with precision. The key is intentionality:

- Start simple, add complexity only when justified by the data or research question
- Document assumptions and model choices
- Validate results against economic intuition
