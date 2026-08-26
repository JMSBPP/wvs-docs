


The constant variance asset-flow dgp:

\[
	\begin{aligned}
		\Delta_X \, (i) \, &= \, \mu_X \, \Delta i \, + \sigma_X \, \Delta \hat{W} \, (i)
	\end{aligned}
\]

Given reserves on the bonding curve. For $\bar L_i$ tick-liquidity level:

\[
	\begin{aligned}
		\bar L_i \, &= X(i)^\eta \, Y(i)^{1-\eta} ; \quad L(i) = \bar L_i \, \ell (\cdot ; i) \, \implies \varphi \, (X, Y)
	\end{aligned}
\]



The induced discrete cash-flow is derived as:

\[
	\begin{aligned}
		\Delta Y (\Delta_X, \eta ;i) \, &\overset{d}{\equiv} \Delta Y (i) \,\\
		\\
		&= \, \frac{\Delta}{\Delta i} \bigg [ \Big (\frac{\bar L_i}{X\, (i)^{\eta}}\Big)^{1/1-\eta}\bigg]
	\end{aligned}
\]


For the underlying price process, since is endogenously priced. It's dynamics are defined after the selection of the *volatility-term structure*:

\[
	\begin{aligned}
		\sigma_X \, (\eta\, ; P_X) \, &= \, \delta \, P_X^\eta
	\end{aligned}
\]

Given that fixing a \(\lambda\); \(P_X \, (i) \, = \lambda^i\);

\[
	\begin{aligned}
		\sigma_X \, (\eta \, ;i) \, = \frac{\delta}{\ln \, (\lambda)} \, \lambda^{i \, (\eta -1)}
	\end{aligned}
\];



For any convex payoff \(\pi\):

\[
	\begin{aligned}
		\pi \, (\beta; \, P_X) = \, P_X \, (i)^\beta; \quad \, |\beta| > 1 \, \implies  \, \pi \, (\beta \, ; i) \, &= \, \lambda^{\beta \, (i \, - i_\mu)}
	\end{aligned}
\];




