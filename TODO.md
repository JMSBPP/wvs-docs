- I need to understant the construction of the Variance swap and how it hedges LiquidityProvisio

- Once this is defined we start

- $w_i$: Given position, calculate the share of its position relative to the total liquidity
in such tick range (or the optimal tick range based on volatility) using the external price 

- $V_{\text{\texttt{LP}}} \big ( [i_l^\star, i_u^\star]\big )$ Calculate the value of the total liquidity on optimal range
- Cal
- $\big (V_{\text{\texttt{LP}}}\big )_i = w_i \cdot V_{\text{\texttt{LP}}} \big ( [i_l^\star, i_u^\star]\big )$

- Once a position is created, for every swap that affects internal price of the pool it computes the HODL value (considering the initial liquidity added) and

- [Approach](./contracts/src/LiquidityOracle.sol)




