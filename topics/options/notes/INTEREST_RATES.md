# INTEREST RATE COLLAR ON A DEBT CONTRACT

## Setup

Initial debt contract: $(i_0, B_0)$ with rate $i_0$ and principal $B_0$.

Interval $[\underline{i}, \bar{i}]$ chosen symmetric around $\mathbb{E}[i] = i_0$:
- $\bar{i}$ — cap (lender-side strike, upper)
- $\underline{i}$ — floor (borrower-side strike, lower)

Map to bond price $P(i)$, $P'(i) < 0$:

$$
\underline{P} \;=\; P(\bar{i}), \qquad \overline{P} \;=\; P(\underline{i}), \qquad \underline{P} < P_0 < \overline{P}.
$$

Expected debt variation over the horizon: $\Delta B := \mathbb{E}\!\left[B_t - B_0\right] \approx B_0 \cdot \Delta i \cdot \tau$.

## Positions

| Party    | Position                          | Strike       | Nominal        |
|----------|-----------------------------------|--------------|----------------|
| Borrower | long perpetual **put**            | $\underline{P} = P(\bar{i})$ | $2\,\Delta B$ |
| Lender   | short perpetual **call** (covered) | $\overline{P} = P(\underline{i})$ | $2\,\Delta B$ |

## Why nominal $= 2\,\Delta B$ (not $2 B_0$)

The hedge targets the *variation* in mark-to-market debt from rate moves, not the principal stock. Linearizing, $\Delta B \approx B_0 \cdot \Delta i \cdot \tau$, and the factor of $2$ covers the symmetric two-sided dispersion of $\Delta i$ around $\mathbb{E}[i]$ — the put insures the upper half of the $\pm\Delta i$ band, the call writes away the lower half.

Using $2 B_0$ would over-hedge: bond P&L is locally affine in $\Delta i$ with slope $-\mathrm{Duration} \cdot B_0$, not $B_0$ itself.

## Costless-collar condition

For the lender's short-call premium to finance the borrower's long-put premium:

$$
N_{\text{put}} \cdot \mathrm{Put}(\underline{P}) \;=\; N_{\text{call}} \cdot \mathrm{Call}(\overline{P}).
$$
,
With strikes mirrored around the forward $P_0$, put-call symmetry gives $\mathrm{Put}(\underline{P}) = \mathrm{Call}(\overline{P})$, hence
$$
\boxed{\,N_{\text{call}} \;=\; N_{\text{put}} \;=\; 2\,\Delta B\,}.
$$

## Economic meaning (CFMM frame)
k
- **Borrower's long put** $\equiv$ insurance leg: pays out when bond price drops below $\underline{P}$ (rates spike above cap), compensating the borrower for the rise in rollover cost on principal $B_0$.
- **Lender's short covered call** $\equiv$ yield-enhancement leg: the lender already holds the bond (delta-$+1$ in $P$); writing a call at $\overline{P}$ caps appreciation if rates fall below floor but monetizes that upside today as premium $\Phi$.
- Together: a **synthetic forward-range contract** locking the bond P&L into the corridor $[\underline{P}, \overline{P}]$. In LP-derivative terms (cf. $\Pi^{\text{LP}} = \Phi - \mathrm{UIL}$ in [PAYOFF.md](./PAYOFF.md)), the lender's $\Phi$ funds the borrower's UIL hedge.
- Protocol-level net delta is zero when the two nominals match, so the AMM rebalancing the collar inventok,ry is gamma-neutral around $P_0$.

## Implementation pointer

A perpetual variant of this collar maps naturally to a **two-tick range position** in a clamm-automaton pool ($\underline{P}$ as lower tick, $\overline{P}$ as upper tick), where the LP earns fees that play the role of the collar premium. See `clamm-automaton/src/` once the perpetual-option twin is bootstrapped.

## Open question

When $[\underline{i}, \bar{i}]$ is *not* symmetric around $i_0$, the costless condition forces $N_{\text{call}} \neq N_{\text{put}}$. Then either:
1. fix $N_{\text{call}} = 2\,\Delta B$ and accept a nonzero net premium (paid by borrower or lender), or
2. solve for $N_{\text{call}} = N_{\text{put}} \cdot \mathrm{Put}/\mathrm{Call}$ to preserve zero cost at the price of asymmetric notional exposure.

Choice (1) preserves the symmetry of the *hedged risk*; choice (2) preserves the symmetry of *cashflows*. These are dual.
k

