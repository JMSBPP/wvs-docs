# import FINANCIAL_CONTRACT.md
# import STATES.md
z

Security{
	marketObservedPrice: Price
	
    payoffAcrossFutures() -> {}

}


Market {
	const NULL_PRICE = 0
    states     : States
    securities : Vector<N>
    payoffs    : Matrix<M, N>       // D — what each security pays in each state
    prices     : Vector<N>          // p — what each security costs today

	pricingKernel : StatePrices
	
	every_future_is_priced {
		forall(state_price in statePrices(pricingKernel), gt(state_price, NULL_PRICE)
	}
	
	fairPrice(security) -> Price{
	   mul(cost_of_certainty, dot(riskNeutralMeasure(pricingKernel), payoffAccrossFutures(security)))
	}
}

Portfolio {
    const NULL_COST    = 0
    const NULL_PAYOFF   = NULL(Vector<M>)

    market   : Market                          // reference, not owned
    holdings : Quantity<Vector<N>>            // θ — how much of each security you hold

    payoff() -> mul(payoffs(market), holdings) : Vector<M>
    cost()   -> dot(prices(market), holdings)  : Scalar

    NoArbitrage : Proof{
        geq(payoff(), NULL_PAYOFF) ⟹ gt(cost(), NULL_COST)
		                          v
               every_future_is_priced(market)
		
    }
   	
}



------LEAN4---
https://qcaml.com/part-1-foundations/ch01-why-ocaml/index.html


