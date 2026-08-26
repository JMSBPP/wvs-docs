
# Introducing The need for Convexity

Ok, I am receiving a recurring endowment of fixed $(\overline{x_{ij}},\overline{x_{ik}})_{0}^{N}$ for $N$ periods.  
The numeraire $\$$ gives me two price parameters $(p^{\$}_{x_{ij}},p^{\$}_{x_{ik}})$.

Then:

$$
\forall\, n \leq N,\qquad 
M_n = p^{\$}_{x_{ij}} \cdot \overline{x_{ij}} + p^{\$}_{x_{ik}} \cdot \overline{x_{ik}}.
$$


Let us fix a period $n$.

During $n$, prices follow some probabilistic joint distribution.  

Now the user is willing to alter his holdings of $(x_{ij},x_{ik})$.  
From a recurring endowment he chooses a portfolio constrained by his wealth.  
The portfolio payoff is:

$$
\Pi^{\text{HODL}} = p^{\$}_{x_{ij}} \cdot x_{ij} + p^{\$}_{x_{ik}} \cdot x_{ik}.
$$

Solving for the set of feasible allocations given current prices at $n$, we obtain the budget curve:

$$
x_{ij} = \frac{M_n}{p^{\$}_{x_{ij}}} - \frac{p^{\$}_{x_{ik}}}{p^{\$}_{x_{ij}}}\, x_{ik}.
$$

How do we arrive at this curve?

Suppose the user believes that prices are equal:
$$
p^{\$}_{x_{ij}} = p^{\$}_{x_{ik}} = p.
$$

He therefore proposes the following rebalancing rule (name it $R$):

``
Anyone who deposits me $p$ units of cash will receive either  
$1$ unit of $x_{ij}$ or $1$ unit of $x_{ik}$.  
The choice is random from now on.''

``

Let me see my opportunity cost, right now I am long on both  $x_{ij}$ and $x_{ik}$ based on my price belief I am (what ? in terms of the risk profile, greeks, etc)

My instantaneous opportunity cost is simply comparing me right know as long of both assets vs the payoff I am inducing on this contract.

$$
C^{\$}_{\text{HODL -R}} =  | \Pi^{\text{HOLD}} - \Pi_S ^{\text{R}} |
$$


Ok, the contract is already written on it's normalized way. Then I need now to make explicit it's instantaneous payoff:
$$
\begin{align*}

    \Pi^{R} = 
    \begin{cases}
      x_{ij}  & \text{prob} = 1/2 \\
        \\
      x_{ik}  & \text{prob} = 1/2
    \end{cases}
\end{align*}

$$


Ok, abstracting away who is my buyer this is what pays him. If I charge $p^{\$}_R$ per unit of $R$ then I have my payoff as seller $\Pi_{S}^{R}$ and the payoff of my buyer $\Pi_{B}^{R}$. This is:

$$
\begin{align*}
    \begin{cases}
        \Pi_{S}^{R} = p^{\$}_R - \Pi^{R} \\
        \\
        \Pi_{B}^{R} = \Pi^{R} - p^{\$}_R 
    \end{cases}
\end{align*}
$$
