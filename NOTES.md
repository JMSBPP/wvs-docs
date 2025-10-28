# Design
- Ticks are defined over realized volatility

# Theory

## Volatility
- is a measure of uncertainty of underlying asset value
- $\big ( \sigma_R \big )_{t\to T}$ is the annualized standard deviation of $\Delta P$ during the period of interest from $t$ to $T$


## Characteristics

- Increasing on:
    - Uncertainty

- Mean reverting
- Uncorrelated with:
    - $P_{Y/X}$

### Requirements

- uniform observation freaquency, annualization factor


## Volatility Market
- individual who thinks current volatility is low given current prices might wnant to take a position that profits if volatility increases

### Use Cases
- Directional trading on $\sigma$
- Trading the spread $\sigma - \hat{\sigma}$


### Options

- Are impure for trading volaitily as they provide exposure to $P \wedge \sigma$
    - Removing exposure to $P$ involves delta-hediging subject to the accuracy of the delta-hedging method
- **Call**
$$
\begin{align*}
    \Pi^{\text{\texttt{call}}} \big( P, \hat{P}, \sigma\sqrt{t}\big) \\
    \\
    \partial_{\sigma} \, \Pi^{\text{\texttt{call}}} \bigg (P, \sigma\bigg)
\end{align*}
$$
- Implies an option is not appropiate for exposure to volatiliy as it's payof is also dependant on $P$

- __To build a portafolio that response to variance independent of moves in $P$, you need to combine options of many strikes__

$$
\begin{align*}
    \Pi^{\sigma-\text{\texttt{call}}} = \int_{P} \, \Pi \bigg ( \hat{P}\bigg) dP 
\end{align*}
$$

Then our interest is 
$$
\partial_{\hat{P}} \, \Pi^{\sigma- \text{\texttt{call}}}
$$




## Forward Contracts
### Fair Value
### Strike Price

## Variance Swap
- VS __is__ a forward contract on $(\sigma^R_X)_T$ of underlying asset $X$
- Traders __swap__ the spread between $\big |(\sigma^I_X)_T - (\sigma^R_X)_T \big |$
- VS __hedges__ $IL(X)$
- $P_{Y/\sigma} (\text{\texttt{skew}})$
$$\Pi^{\text{\texttt{VS}}} \bigg (\sigma \bigg) = P_{Y/\sigma} (\text{\texttt{skew}})\cdot \bigg ( (\sigma^R_X)_T - \hat{\sigma}  \bigg)
$$

- pays $P_{Y/\sigma}$ of $Y$ for every point $(\sigma^R_X)_T > \hat{\sigma}$

- swaps a fixed volatility $\hat{\sigma}$ for the actual future volatility $(\sigma^R_X)_T$

### Fair Value
$\Pi^{\text{\text{\texttt{VS}}}} \big (\hat{\sigma}^*\big ) = 0$

### Valuation Method




## Volatility Swap (Realized Volaitility forward contracts)


-----------------------

wvs_AMM -- > pg 6
wvs --> pg 11
