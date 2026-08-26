# import OBSERVABLES.md

A pricing pipeline is a composition of functions:

$$\text{price} = \text{discount} \circ \text{payoff} \circ \text{simulate}$$



lib PricingKernel {
    observedPrices  : Price<Vector<N>>
    otherObservables : ...


    denominate(unitOfAccount: Currency, futureStates: States) -> Scalar<Vector<M>> {
		// ...
	   return statePrices
	}

     toRiskNeutralMeasure(statePrices: Price<Vector<M>>) -> Vector<M-1> { 

       price_per_future  = statePrices[1:len(state_prices)] 
	   cost_of_certainty <- sum(price_per_future)  // discount_factor

       pricing_weights <- norm(futureValue ,by = cost_of_certainty)
	   return pricing_weights
	}
}


process Obs X ::Date<State> -> Random<Variable> Obs X

// note: All times have the same value x
K Obs X :: Obs X -> process  Obs X

time t: Date<State> -> process Obs t

// note: lift is applied similarly ...


process konst Obs X = K Obs X


