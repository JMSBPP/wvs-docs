

> PROMPT: We are extending https://github.com/benedictbrady/amm-challenge.git to the math on the README that is not on the current written math COnsidering the discrete calculus framework we are working with as the base

import [$\lambda_{\mathrm{tick}}$ / $\Delta_i$ / tick $i$ / $\sigma_X$ / $\phi=\bar\phi^{\star}+\phi_Z(\,;\sigma_X)$](../../cfmm-discrete/FINANCE.md)

import [realized $\sigma_X$ (the $\phi$ input, $\ne$ the GBM fair-vol $\bar\sigma_X$)](../IMPLIED_VOLATILITY.md)

import [$\Delta_X$ trade-flow](../../cfmm-dgp/TRADING_FLOW.md)

**Convention:** integer tick $i$ with **$P_X(i)=\lambda_{\mathrm{tick}}^{\,i\,\Delta_i}$** ($\Delta_i$ = tick
spacing, $\lambda_{\mathrm{tick}}>1$ — the FINANCE tick multiplier).
$\lambda_{\mathrm{tick}}$ is **distinct from the Poisson arrival rate** $\lambda_t\in(0.6,1)$ below.
The fair price $p$ below is the exogenous README GBM ($\mu=0$) and
the pool spot $P_X$ tracks it via arbitrage. $\bar\sigma_X$ = fair-price per-step vol; $\sigma_X$ = the
pool's realized vol (the adaptive-fee input).

Note:

\[
	\begin{aligned}
		p \, (t+1) \, &= p \, (t)\, \exp \, \Big (- \bar \sigma_X^2 /2 + \bar \sigma_X \, \varepsilon \Big); \quad  \varepsilon \, \sim N (0,1) \quad (\text{fair price, } \mu=0) \\
		\implies \\
		i_p \, (t+1) \, &= i_p(t) \, - \, \frac{\bar \sigma_X^2}{2\, \ln (\lambda_{\text{tick}}) \, \Delta_i}\, + \, \frac{\bar \sigma_X \, \varepsilon}{\ln (\lambda_{\text{tick}}) \, \Delta_i} 
	\end{aligned}
\]

where:

\[
	\begin{aligned}
		\bar \sigma_X \sim U [0.088 \% , 0.101 \%]
	\end{aligned}
\] (varies accross simulations)


Consider the region:

\[
\begin{aligned}
\varphi \, (L;P_X^{(l)},P_X^{(u)})
&\overset{D}{=}
\left(
X(\cdot)
+
L(\cdot)\sqrt{P_X^{(u)}}
\right)
\left(
Y(\cdot)
+
\frac{L(\cdot)}{\sqrt{P_X^{(l)}}}
\right).
\end{aligned}
\]

**Liquidity exponent.** $\varphi=x_v y_v$ is homogeneous of degree $1/\eta$ in the virtual reserves
with $\eta=\tfrac12$, so $\varphi=L^{1/\eta}=L^{2}$ and the liquidity level is $L=\varphi^{\eta}=\sqrt\varphi$.
Here $L=L(i)$ is the **active in-range (tick) liquidity** — constant within a tick interval, with
$\varphi(i)=L(i)^{2}$ jumping across initialized ticks (NOT the pool-wide $L=\sum_{i,j}L(i,j)\,\mathbf{e}_{(i,j)}$
of [FINANCE](../../cfmm-discrete/FINANCE.md)). The same $\eta$ is the **price exponent**:
$x_v=L\,P_X^{-\eta}$, $y_v=L\,P_X^{\eta}$, which is why the arbitrage size below carries
$\sqrt{\varphi/((1-\phi) p)}=L\,((1-\phi) p)^{-\eta}$ — the post-arb virtual $x$-reserve at the
fee-adjusted price. The closed-form arb sizes assume no tick-boundary crossing ($L$ fixed).

The DGP is the **cash-flow** $\Delta Y$ (retail is Y-denominated, README); $\Delta X$ is **induced** by the
bonding curve $\varphi$. In discrete block-time $t=1,\dots,10^4$ the per-block Y-flow splits into an
exogenous (retail) and an endogenous (arb) stream:

\[
\Delta Y(t) \;\overset{D}{=}\; \underbrace{\Delta Y^{\text{ret}}(t)}_{\text{retail, exogenous}} \;+\;
\underbrace{\Delta Y^{\text{arb}}(t)}_{\text{arb, endogenous}} .
\]

**Retail** $\Delta Y^{\text{ret}}$ — the uninformed Poisson cash-flow:

\[
\begin{aligned}
\lambda_t &\sim \mathcal U(0.6,1.0)
\\
N_t \mid \lambda_t &\sim \mathrm{Poisson}(\lambda_t)
\end{aligned}
\]


\[
\begin{aligned}
\bar \Delta y_t &\sim \mathcal U(19,21)
\\
\Delta y_{n,t} &\sim \mathrm{LogNormal}(\mu_t,\sigma_{\Delta y}^2),
\qquad
\sigma_{\Delta y}=1.2
\end{aligned}
\]


\[
\mathbb E[\Delta \, y_{n,t}]
=
\exp\!\left(\mu_t+\frac{\sigma_{\Delta y}^2}{2}\right)
=
\bar \Delta y_t.
\]

\[
\mu_t
=
\ln(\bar \Delta y_t)-\frac{\sigma_{\Delta y}^2}{2}.
\]

\[
\mathbb{I}_{n,t}
=
\begin{cases}
+1, & \text{buy } X \text{ with } Y,\\
-1, & \text{sell } X \text{ for } Y,
\end{cases}
\qquad
\mathbb P(\mathbb{I}_{n,t}=1)=\mathbb P(\mathbb{I}_{n,t}=-1)=\frac12.
\]

\[
\Delta Y^{\text{ret}} \, (t)
=
\sum_{n=1}^{N_t}
\mathbb{I}_{(n,t)} \, \Delta y_{(n,t)}.
\]

**Retail flow in matrix form.** Stack the $T=10^4$ blocks as rows and the within-block arrival
slots as columns ($N^{*}=\max_t N_t$); slots past each block's own count $N_t$ are zero-padded.
With the **size** matrix $D_{t,n}=\Delta y_{n,t}>0$ (lognormal magnitudes) and the **sign** matrix
$S_{t,n}=\mathbb{I}_{n,t}\in\{\pm1\}$ (buy/sell direction), the **signed-flow tape** is the Hadamard
product $F=S\circ D$:

\[
F=S\circ D=
\begin{bmatrix}
\mathbb{I}_{1,1}\Delta y_{1,1} & \cdots & \mathbb{I}_{N_1,1}\Delta y_{N_1,1} & 0 & \cdots & 0\\
\mathbb{I}_{1,2}\Delta y_{1,2} & \cdots & \cdots & \mathbb{I}_{N_2,2}\Delta y_{N_2,2} & \cdots & 0\\
\vdots & & & & & \vdots\\
\mathbb{I}_{1,T}\Delta y_{1,T} & \cdots & \cdots & \cdots & \mathbb{I}_{N_T,T}\Delta y_{N_T,T} & 0
\end{bmatrix}.
\]

Right-multiplying by the ones-vector $\mathbf 1_{N^{*}}$ performs the inner sum $\sum_{n=1}^{N_t}$
(the zeros kill the padding), collapsing the tape to the per-block retail cash-flow vector:

\[
\Delta Y^{\text{ret}}
=F\,\mathbf 1_{N^{*}}
=
\begin{bmatrix}
\displaystyle\sum_{n=1}^{N_1}\mathbb{I}_{n,1}\,\Delta y_{n,1}\\[6pt]
\displaystyle\sum_{n=1}^{N_2}\mathbb{I}_{n,2}\,\Delta y_{n,2}\\[2pt]
\vdots\\[2pt]
\displaystyle\sum_{n=1}^{N_T}\mathbb{I}_{n,T}\,\Delta y_{n,T}
\end{bmatrix}
=
\begin{bmatrix}
\Delta Y^{\text{ret}}(1)\\ \Delta Y^{\text{ret}}(2)\\ \vdots\\ \Delta Y^{\text{ret}}(T)
\end{bmatrix}.
\]

The ragged staircase of nonzeros (row $t$ filled only up to column $N_t$, then $0$) is the signature
of the random counts $N_t\sim\mathrm{Poisson}(\lambda_t)$, $\mathbb E[N_t]\approx0.8$: $F$ is the retail
**order-flow tape** and $\Delta Y^{\text{ret}}=F\,\mathbf 1$ its per-block aggregate — the exogenous
half of $\Delta Y=\Delta Y^{\text{ret}}+\Delta Y^{\text{arb}}$, fed into the induced $\Delta X(t)$ below.

**Arb** $\Delta Y^{\text{arb}}$ — the price-correcting Y-leg conjugate to $\Delta X^{\text{arb}}$
(§Arbitrage). The fee is on the **input**, so the two branches are asymmetric; the gate fires when
$|i_p-i|>\log_{\lambda_{\mathrm{tick}}}(1/(1-\phi))/\Delta_i$ (invariant $\varphi=L^{1/\eta}$, $\eta=\tfrac12$; fee-on-input factor $1-\phi$, $\phi$ the fee rate):

\[
\Delta Y^{\text{arb}}(t)\;\overset{D}{=}\;
\begin{cases}
\dfrac{1}{1-\phi}\Big(\dfrac{L^{1/\eta}}{x_v-\Delta X^{\text{arb}}}-y_v\Big)>0,
  & i_p>i\ \ (P_X<p,\ \text{arb buys }X;\ Y\text{ is taxed input})\\[8pt]
\dfrac{L^{1/\eta}}{x_v+(1-\phi)\,\Delta X^{\text{arb}}_{\text{in}}}-y_v<0,
  & i_p<i\ \ (P_X>p,\ \text{arb sells }X;\ Y\text{ is untaxed output})\\[8pt]
0, & |i_p-i|\le \log_{\lambda_{\mathrm{tick}}}(1/(1-\phi))/\Delta_i .
\end{cases}
\]

Then $\Delta X$ is **induced** by the bonding curve (NOT a DGP) — $\varphi$-conservation,
fee-on-input factor $1-\phi$:

\[
\Delta X(t)\;\overset{D}{=}\;\frac{\varphi}{\,y_v+(1-\phi)\,\Delta Y(t)\,}-x_v
\;=\;-\,\frac{x_v\,(1-\phi)\,\Delta Y(t)}{\,y_v+(1-\phi)\,\Delta Y(t)\,}
\qquad(\Delta Y>0\Rightarrow\Delta X<0).
\]

Reserves update **once**, via the induced $\Delta X(t)$: the $\Delta X^{\text{arb}}$ of §Arbitrage
is the X-projection of the $\Delta Y^{\text{arb}}$ already inside $\Delta Y(t)$ (verified
$L^{1/\eta}/(y_v+(1-\phi)\,\Delta Y^{\text{arb}})-x_v=-\Delta X^{\text{arb}}$) — a labeling for the Edge
buy/sell partition, not a second state move.

## Arbitrage

The pool spot is $P_X = y_v/x_v$ (integer tick $i$, $P_X=\lambda_{\mathrm{tick}}^{\,i\Delta_i}$ per the
convention above), with virtual reserves $x_v = X+L\sqrt{P_X^{(u)}}$, $y_v = Y+\tfrac{L}{\sqrt{P_X^{(l)}}}$,
$x_v y_v=L^{1/\eta}$ (the invariant $\varphi$ of the region above, $\eta=\tfrac12$). Against the fair price $p$ (fair tick $i_p=(\log_{\lambda_{\mathrm{tick}}} p)/\Delta_i$, from the GBM
above), with **fee-on-input** factor $1-\phi(\,;\sigma_X)$ ($\phi$ the fee rate):

\[
\begin{aligned}
P_X < p\ (\text{pool underprices }X):&\quad
\Delta X^{\text{arb}} \overset{D}{=} x_v - \sqrt{\tfrac{L^{1/\eta}}{(1-\phi)\,p}}
= x_v\Big(1-\sqrt{\tfrac{P_X}{(1-\phi)\,p}}\Big) \ (\text{arb buys }X)
\\[2pt]
P_X > p\ (\text{pool overprices }X):&\quad
\Delta X^{\text{arb}}_{\text{in}} \overset{D}{=} \tfrac{1}{1-\phi}\Big(\sqrt{\tfrac{L^{1/\eta}\,(1-\phi)}{p}}-x_v\Big)\ (\text{arb sells }X)
\end{aligned}
\]

— the concentrated (virtual-reserve $x_v, L^{1/\eta}$) form of the README's $\Delta x = x-\sqrt{k/\gamma p}$
(README's $\gamma\equiv1-\phi$).
**No-arb band (convention-free).** $\Delta X^{\text{arb}}>0$ iff the mispricing exceeds the fee:
\[
|\ln(p/P_X)| \;>\; \ln\tfrac{1}{1-\phi}=-\ln(1-\phi)
\quad\Longleftrightarrow\quad
\tfrac{p}{P_X}>\tfrac1{1-\phi} \ \text{ or }\ \tfrac{P_X}{p}>\tfrac1{1-\phi} .
\]
In integer-tick units ($P_X=\lambda_{\mathrm{tick}}^{\,i\Delta_i}$, $\lambda_{\mathrm{tick}}>1$, $0<1-\phi<1$): $|i_p-i| > \dfrac{\log_{\lambda_{\mathrm{tick}}}(1/(1-\phi))}{\Delta_i} > 0$.
The fee widens the stale band (higher $\phi$ ⟹ wider ⟹ worse edge) — the fee-band analog of the
[DUFFIE](./DUFFIE_EXERCISES.md) no-arb cone $\lambda_{\mathrm{tick}}^{-\Delta_i}<r<\lambda_{\mathrm{tick}}^{\Delta_i}$ (both require $\lambda_{\mathrm{tick}}>1$).

## Order routing

Retail $\Delta Y(t)$ splits across the strategy pool ($k{=}1$, $\gamma_1=1-\phi$) and the 30-bps
normalizer ($k{=}2$, $\gamma_2=1-0.003$) to equalize post-trade marginal prices — here $\gamma_k=1-\phi_k$
is the per-pool fee-on-input factor. With $A_k=\sqrt{x_v^{(k)}\,\gamma_k\,y_v^{(k)}}$
and $r=A_1/A_2$:

\[
\Delta Y_1 \overset{D}{=} \operatorname{clamp}\!\left(\frac{r\big(y_v^{(2)}+\gamma_2\,\Delta Y\big)-y_v^{(1)}}{\gamma_1+r\,\gamma_2},\ 0,\ \Delta Y\right),
\qquad \Delta Y_2 = \Delta Y-\Delta Y_1 .
\]

The interior expression equalizes post-trade **marginal execution** prices; when it falls outside
$[0,\Delta Y]$ (pools far apart) the whole order corner-routes to the cheaper pool — hence the clamp.
Lower $\phi$ ⟹ larger $\gamma_1$ ⟹ larger share (nonlinear): a small fee edge shifts a large volume
fraction. This is the competitive constraint on $\phi=\bar\phi^{\star}+\phi_{Z}(\,;\sigma_X)$.

## Edge

Using the fair price $p$ at trade time, over the $10^4$ steps:

\[
\text{Edge} \overset{D}{=}
\sum_{\text{sells}}\big(\Delta X\cdot p - \Delta Y\big)
+ \sum_{\text{buys}}\big(\Delta Y - \Delta X\cdot p\big),
\]

where **sells/buys are the TAKER's side** (the DFG indicator $\mathbb{I}_{n,t}=+1$ buy $X$ / $-1$ sell $X$).
**Retail** flow contributes $+$edge (spread captured); **arb** flow contributes $-$edge (loss to informed).

So Edge is the net LP P&L, the **aggregate** $\mathrm{RnL}=\Upsilon-\mathrm{IL}$ of
[STREAMING_PREMIUM](../../cfmm-discrete/STREAMING_PREMIUM.md): total fee revenue $\Upsilon$ (the theta leg,
maximized by the adaptive $\phi_{Z}$) minus total arb/LVR loss $\mathrm{IL}$ (the gamma leg). The
identity is the NET aggregate ($\Upsilon=\Upsilon_{\text{retail}}+\Upsilon_{\text{arb}}$; both flows pay
fees and both move price) — predominantly retail$\to\Upsilon$, arb$\to\mathrm{IL}$, not a per-trade
factorization. The challenge = choose $\phi(\,;\sigma_X)$ to maximize $\Upsilon-\mathrm{IL}$ subject to the
routing constraint.

## Economic Meaning

The amm-challenge in the discrete-calculus framework: a V3 concentrated-liquidity pool whose
**fee-on-input** factor $1-\phi$ (fee rate $\phi$) is the control. Arbitrageurs enforce the no-arb band
$|\ln(p/P_X)|>-\ln(1-\phi)$ (in ticks $|i_p-i|>\log_{\lambda_{\mathrm{tick}}}(1/(1-\phi))/\Delta_i$, the $\phi$-widened
stale band); retail routes by $1-\phi$ (competition); **edge $\approx\mathrm{RnL}=\Upsilon-\mathrm{IL}$**
is the theta-leg–minus–gamma-leg P&L (the sample-path realization of the per-liquidity identity) that the
adaptive fee $\phi_{Z}(\,;\sigma_X)$ is built to maximize — closing the loop to FINANCE + STREAMING_PREMIUM.

