

- underlying
- strike
        |
        |                     -> bond (same expiration)
        \->                   -> futures (same expiration)
            +- expiration   /
            -  underlying---
                            \ --> security 


1 option seller
 
      --> write_sell(option)
  option buyer
 
      --> buy(option, price= premia)
2 option buyer (has right)
 
    - exercise(option)
  option seller (obligated per buyer exercise)
 
    - honor(option)
 
        - trade(underlying(option), strike(option))
 
            - use(margin(option)) 
 
                - transfer(margin ,option buyer)
 
            - transfer(underlying(option), option seller)




            -> intrinsic value (p -strike)
          /
- premia -          +
          \ 
            -> extrinsic value 
                - time value  (p- strike)

- intrinsic: p at exercise
- extrinsic: p at any time during the contract liveness




pg 14

At a current price $P$:

- "call buyer:" We are long volatility (upwards) ($P+\sigma$);
we buy an option that confers the right to buy $X$ at $\psi_{\text{bid}} = P+ \varepsilon < P+\sigma$. 

The option is OTM, then, it does not have intrinsic value, but time value at $\int \phi^E$

We then expect to profit from $\sigma - \varepsilon$—
realized volatility minus forecasted volatility. This is the intrinsic value, thus the intrinsic premium of the option.

$$
\psi_{\text{bid}} - P
$$

If our forecasted volatility matches realized volatility, then

$$
\Pi_{\text{trader}} \big (P \big ) = \big (\psi_{\text{bid}} - P \big ) - \int \phi^E
$$



pg 67 --> volatility