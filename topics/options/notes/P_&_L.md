

Since \( i_X (P) = \log_{\lambda} (P_X)\); Given a forward rate \(F\);

\[
	\begin{aligned}
		i_X \, (P) - i_X \, (F) \, &= \, \log_{\lambda} (\frac{P_X}{F})
	\end{aligned}
\];

Then is we introduce discrete time steps $t, \{t+1, \cdots, T\}$;

\[
	\begin{aligned}
		\Delta_t i = \log_{\lambda} \, \Big (\frac{P_{t}}{P_{t-1}} \Big )
	\end{aligned}
\];

Which allows to define the **realized volatility tick process** \(\sigma_X \, (\cdot ; t)\) as defined on the algebra whitepaper.

Now. Define a wealth process \(W\, (\cdot)\) s.t :

\[
	\begin{aligned}
		\mathbb{E}_t \, \Big [W \, (T) \, \mid \cdot \, \Big] \, &= \, \nu_t \, \bigg(\sigma^{iv}_X \, (t;\cdot) \, - \, \mathbb{E}_t \, \Big [\sigma_X \, (\cdot; T) \, \mid \cdot \Big ]\, \bigg)
	\end{aligned}
\];

Define the hedge process as:

\[
	\begin{aligned}
		H \, (\cdot ;t) \, \overset{d}{\equiv} \frac{\Delta}{\Delta \, t} \, \bigg [\, \mathbb{E}_t \, \Big [W \, (T) \, \mid \cdot \, \Big] \, \bigg]
	\end{aligned}
\]



