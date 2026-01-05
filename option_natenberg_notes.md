

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


