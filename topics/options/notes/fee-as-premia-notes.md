
Let $W_0$ be the wealth of the LP at $t=0$. He is interested in selling $R_X$ at $\psi_{\text{ask}}$ given that the market price is $P_0 < \psi_{\text{ask}}$.

The market is not offering the conditions he requires for selling $R_X$ units of $X$. He does not want to time the market, but wants the market to pay him for the opportunity cost of not selling his $R_X$ units of $X$.

All he can do right now are promises, because no one is buying any $X$ at $\psi_{\text{ask}}$ for any $P < \psi_{\text{ask}}$.

He thinks, well I know some people are willing to enter to buy $X$, and more specifically $R_X$.

- Traders who take directional longs on X right now are not my buyers. They simply buy $P_0 \cdot R_X$ and they are done; anyway, it is cheaper now.

They decide to bear market risk starting from $t=0$

- My buyer is someone who does not have the cash $P_0 \cdot R_X$ BUT is willing to buy $R_X$ progressively in continuous installments $\Delta$, ensuring execution at $\psi_{\text{ask}}$. He is only directional on $X$ after $P$ crosses $\psi_{\text{ask}}$. My buyer persona is buying conditional access to $R_X$, not $R_X$ itself. That condition makes sense: he cannot or is not willing to deploy the full $P_0 \cdot R_X$ upfront and is willing to pay a premium cost in exchange for insurance on execution price, known slippage, and known liquidity.


In other words my buyer is outsourcing execution risk and path risk to the me.

Since I am not selling for $P < \psi_{\text{ask}}$, they are not buying for $P > \psi_{\text{ask}}$. Ok, we have a market. Let me write a contract.

*I offer the right to buy $R_X$ at $\psi_{\text{ask}}$* 

Ok, first thing done. Now how much should I charge for this? 

Well, I am giving price insurance on the price space $P - \psi_{\text{ask}}$. But this is also my opportunity cost—the farther $P$ stays away on the upside from $\psi_{\text{ask}}$, the more opportunity cost I absorb. Therefore, I need to charge for every infinitesimal price movement further on the upside from $\psi_{\text{ask}}$.

For $P$ to move anywhere, supply and demand must kick in with order flow $\hat{\Delta}$. Formally, I am charging per unit of trading volume on the path that makes the price get to $P$.

Now the contract ("promise") is alive $\forall P \in [P_0, \psi_{\text{ask}}]$. So that is the specae where I can charge my buyer.

Okay, the way I am charging him is with a premium $\phi$ per price-unit on that interval. For each infinitesimal trade $\Delta \in \hat{\Delta}$, where $\hat{\Delta}$ is the space of all trading paths that reach to $\psi_{\text{ask}}$, the trade moves the price $\partial_{\Delta} P$ closer to $\psi_{\text{ask}}$ until it reaches $R_X$, starting from 0.

$$
\text{Premium} = \mathbb{E}[\text{slippage avoided} + \text{downside risk avoided} + \text{capital costs avoided}] \\
=\\
\int_{0}^{R_X} (P (\Delta) - \psi_{\text{ask}}) \, d\Delta
$$

I am charging $\phi$ per unit of $d\Delta$.

Thus:

$$
\int_{0}^{R_X} \phi \cdot d\Delta = \int_{0}^{R_X} (P (\Delta) - \psi_{\text{ask}}) \cdot d\Delta
$$

The price is not deterministic, so this needs to converge to the average opportunity cost I would incur under the path space $\hat{\Delta}$ that matches the insurance given to the buyer of my promise.

Then:

$$
\int_{0}^{R_X} \phi \cdot d\Delta = \mathbb{E}^{\hat{\Delta}} \bigg [ \int_{\hat{\Delta}} (P (\Delta) - \psi_{\text{ask}}) \cdot d\Delta\bigg]
$$

Ok, great, so we have a promise to sell and a fair price for that promise... what am I missing?

Ok, let's see the perspective of my option buyer why is he better off buying my option than doing this himself

The question is: What if I were to pay continuous installments $\Delta$ that converge to $R_X$, starting from $P_0$ all the way to $\psi_{\text{ask}}$, such that I guarantee that when I reach $R_X$ I have paid $\psi_{\text{ask}}$ with no slippage, and I have continuously delta hedged all along the path to get there?

That sounds like the portfolio replication of my buyer profile. 

Let's see....

For him to buy my promise, the cost of doing all this needs to be at least as high as the premium I charge. Let's get to this!

He has some wealth measured in cash $\$$, at time $t=0$, $W_0$. There is a primary market $\star$ for buying $R_X$. And he is fully exposed to $P^{\star}$. Now we has access to flash-loans at $i_{\$}$ to borrow.


...