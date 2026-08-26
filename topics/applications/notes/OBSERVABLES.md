# import STATES.md

Obs Scalar represents a time varying quaintiy of type d

Obs Scalar

// same value ofr all states on space and time

konst :: Date<State> ->  Obs a


//========PRIMITIVES

// note f(v) = w ==> f (Obs v) = Obs w
// applyng numericla function on observables 
// 1 is it receives one argument, N is multi-variable

lift1:: (v -> w) -> Obs v -> Obs w


// note (time i) at time x is the number of Days between x and i
time:: Date<State> -> Obs Days


