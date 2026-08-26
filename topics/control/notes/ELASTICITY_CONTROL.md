

For a target \(\eta \) starting from the \(1/2\) coordinate, we have:

\[
	\begin{aligned}
		P_X \, (i)^{\eta}  \, &= \, \sqrt{P_X} (\bar i) \, \sqrt{P_X} (2 \eta i \, -  \, \bar i)
	\end{aligned}
\]

And: 

\[
	\begin{aligned}
		L_{\eta} \, &= \, L_{1/2} \, \Big (\frac{\sqrt{P_X} ( i)}{P_X \, (i)^{\eta}} \Big)
	\end{aligned}
\]

From the lens of adaptive and feedbakc control we have \(G_{ff}, G_{fb}\) for feedforward and feedback respectively where at the implementation level feedforward sits on `beforeSwap` and feedback on `afterSwap`

note

```cpp
    function beforeSwap(address sender, PoolKey calldata key, SwapParams calldata params, bytes calldata hookData)
        external
        returns (bytes4, BeforeSwapDelta, uint24);
```

which then we are given as inputs:

\[
	\begin{aligned}
		u := (\Delta^I, \sqrt{P_{X}} \, (\bar i) , \Delta_i)
	\end{aligned}
\] and \(I = \text{hookData} \cup I (u)\);

Since we want to price \(\Delta^I\) with \(\eta\) we need to generate the 1/2 values that enter the core 1/2 swap algorithm to make it produce \(\Delta_{\eta}^O\)

\[
	\begin{aligned}
		G_{ff}: u \, \times I \to \Theta^{ff} \, (t)\\
		\\
		\Theta^{ff} \, = \Big (\,P_X \, (i)^{\eta} , \, L_{\eta},  \Big)\, \cup \,\Big (\, \underbrace{\phi_t}_{\text{possibly maps to parameters of the dynamic fee}}, \, \eta_t  \Big)\,
	\end{aligned}
\]


Then:

\[
	\begin{aligned}
		G_{1/2} : \Big (\Delta^I, \sqrt{P_X} \, (\bar i), \, L_{1/2}, \,  \Delta_i\Big) \, \to \, \tilde \Delta_{1/2}^O
	\end{aligned}
\]


Since we not know \(\Delta_{\eta}^{O}\) off-hand BUT we now the value of some state variable \(K (\Delta_{\eta}^O)\); Then for the feedback input we evaluate:

\[
	\begin{aligned}
		e_t \, &= \,d \Big ( K (\Delta_{\eta}^O)\, , \, K (\bar \Delta_{1/2}^O)\, \Big ) 
	\end{aligned}
\];

\[
	\begin{aligned}
		G_{fb} \, : \, e_t \, \to \, \Delta \Theta_t  
	\end{aligned}
\]


1. \(G_{ff}\)

2. \(d\)

3. \(K\)

4. \(G_{fb}\)

## TEST DRIVEN DEVELOPMENT

1. From the actual swap algorithm enter multiple inputs and record their outputs at the \(1/2\)

2. Implement a GAMS module that does the same but with tunable \(\eta\)

3. Implement scripting for reading the gams output

4. Write tests for inputting same inputs and MUST equal the values read from the gams module

5. Implement the controllers

6. run tests

7. Iterate 5 and 6 until it works
