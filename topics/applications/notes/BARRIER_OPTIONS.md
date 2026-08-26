# import FINANCIAL_CONTRACT.md
# import SECURITY.md
# import STATES.md 

exerciseStyle:: Date<State> -> FinancialContract -> FinancialContract


Option{
   type: {CALL, PUT}
   exerciseStyle: {AMERICAN, EUROPEAN, BERMUDAN}
   barrierType: {UP_AND_OUT, DOWN_AND_OUT, UP_AND_IN, DOWN_AND_IN}
   optionProduct: {ASIAN, VANILLA, BARRIER, LOOKBACK}
   state(price(underlying) : Price, type) : {ATM, OTM, ITM}
   strike : Strike(price(underlying): Price) // requires OTM at creation that is why is a type
   
}

OptionPricingInvariants{
    PUT_CALL_PARITY
	
}

Greeks(op: OptionPricing){

	delta(TimeSeries(price(underlying)), TimeSeries(price(option))) -> Matrix
	gamma(TimeSeries(price(underlying)), TimeSeries(price(option))) -> Matrix
	
}


