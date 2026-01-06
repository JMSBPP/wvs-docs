

Advantages:

- We are not optimizing for LP's but making explicit the risks of  being LP'S in traditional finance in a custom way

Let's start with the question, If LP'S are tough as short straddles. How to build an abstraction that makes more explict such profile.

In the same sense anyone buying such straddle's has the opposing profile.


The protocol under consideration is building on top of uniswap giving users a explicit interface for shorting and longing straddles


What questions can be asked ?

- Abstraction methods:

    - The payoff of longing and shorting straddles can be mapped to what game psychological reward profile ?

    - Using the same logic, what is the abstraction method, gamification, other ...



Then our approach is bottom up.

From Uniswap trading function we derive the financial instrument and the strategy over such instrument that matches the payoff function corresponding to such trading function  (Based on the papers this is a isomorphism)

The financial instrument is perpetual covered amererican options

The strategy:
    - short straddle at strike $\psi = \sqrt{\psi_b\cdot\psi_a}$


The mapping is not direct as some caveats are introduced, but one can show the payoff of the LP matches at some degree the pay off of a short straddle trader


We have the trading function
$$
\varphi^{\text{\texttt{cl}}} \to \Pi_{\varphi^{\text{\texttt{cl}}}}
$$

And there is already literature for the underlying payoff

The payoff of a short straddle is knokn $\Pi_{\text{\texttt{s-st}}}$

Then let's build:

$$
\hat{\Pi}_{\text{\texttt{s-st}}}: \Pi_{\varphi^{\text{\texttt{cl}}}} \to \Pi_{\text{\texttt{s-st}}}
$$


From some papers we gather:

$$
\varphi_{\text{\texttt{s-st}}}
$$

And the final task is:

$$
\hat{\varphi_{\text{\texttt{s-st}}}}:\varphi_{\text{\texttt{s-st}}} \to \varphi^{\text{\texttt{cl}}}
$$