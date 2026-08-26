
V( L_d, P ) <= Liquididation Threshold (volatility (+))
| -----------------------------------------------
|           Liquidation
|
|
\
\ ------> RiskEngine/Parameters (volatility) ------
                                                      |    --- \phi_D --> \Delta
                                                      |  / 
                                                  L_D --     
                                                         \
                                                           -- \phi_I --> \Delta_I


- lender risk exposure ------(replicate)--------> barrier options
- borrower risk exposure ------(replicate)------> convex payoffs

