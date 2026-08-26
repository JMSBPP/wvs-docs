
# import STATES.md
# import CURRENCY.md
# import SECURITY.md
# import OBSERVABLES.md

FinancialContract{
	lib PricingKernel	

	futureStates: States   // Vector<M>
	unitOfAccount: Currency
	securities: Security<Vector<N>>	

    payoffs :Scalar <Matrix < Scalar<Vector<M>>, N > >
	statePrices : Price<Vector<M>>
	
    constructor() {
		statePrices <- denominate(unitOfAccount, futureStates)
		payoffs <- matrix(statePrices,securities)
	}
}

// note: identity

null_contract:: Contract
one: Currency -> FinancialContract { one id Currency }

and :: FinancialContract -> FinancialContract -> FinancialContract
or :: FinancialContract -> FinancialContract -> FinancialContract
then :: FinancialContract -> FinancialContract -> FinancialContract
acquire:: FinancialContract -> FinancialContract

give:: FinancialContract -> FinancialContract


// note: trims c's horizon so it cannot be acquired any later than State
truncate:: Date<State> -> FinancialContract -> FinancialContract 

// note: scale the contract size, by an Observable quantity

scale: Obs Scalar -> FinancialContract -> FinancialContract

// note: when acquired this contract, acquires the underlying contract and truncate horizon

redeemsUnderlying:: truncate -> FinancialContract

// NOTE: The above are all constructors of the FinancialContract 

perhaps::  date, financialContract = truncate date (financialContract or null_contract)
exerciseStyle:: Date<State> -> FinancialContract -> FinancialContract
	european date, financialContract :: redeemsUnderlying(
                                          perhaps date, financialContract                     
									    )
	american startDate, endDate, financialContract :: redeemsUnderlying(
	                                                     truncate startDate anytime(
														    perhaps endDate
															financialContract
													     ) 'then'
														 anytime(
														    perhaps endDate
															financialContract
													     )		 
                                                     ) 								 

