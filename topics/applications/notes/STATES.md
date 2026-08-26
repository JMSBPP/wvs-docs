States{
	futureStates : Vector<M> // this can incorporate time aware dimensions
	
	likelihood() : (futures-> [0,1]){ 
	   require(likelihood(futures), 1)
	}
}
