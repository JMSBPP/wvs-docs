# From Constraints to Curvature Design

> **How the AMM-SDR derives curvature from safety and participation constraints**

---

## Context

The LP has been convinced of:
1. **Monotonicity** — price decreases as volume accumulates
2. **Continuity** — no jumps in the price curve
3. **Convexity** — path safety, not just terminal safety

The LP now asks:

> "Great, your mechanism is safe. But traders won't sell me $dX$ if external price exceeds your price plus fee. Why would anyone trade with me?"

---

## The Participation Constraint

**SDR acknowledges:**

> "Yes, the participation constraint is:
> $$P(\Delta) - \text{fee}(\Delta) \geq P_{\text{ext}}(\Delta) \quad \forall \Delta \in [0, R_X]$$
>
> Let me show you how this, combined with your safety requirement, *determines* the curvature."

---

## Step 1: The Two Constraints Define a Corridor

**Safety (already accepted):**
$$P(\Delta) \leq C_{\text{bid}}$$

**Participation (new concern):**
$$P(\Delta) \geq P_{\text{ext}}(\Delta) + \text{fee}(\Delta)$$

Combining:
$$\boxed{P_{\text{ext}}(\Delta) + \text{fee}(\Delta) \leq P(\Delta) \leq C_{\text{bid}}}$$

The price curve must live in this **corridor** — above the participation floor, below the safety ceiling.

---

## Step 2: When Is the Corridor Non-Empty?

For a feasible design to exist:
$$P_{\text{ext}}(\Delta) + \text{fee}(\Delta) \leq C_{\text{bid}}$$

Rearranging:
$$C_{\text{bid}} - P_{\text{ext}}(\Delta) \geq \text{fee}(\Delta)$$

**Interpretation:** The spread between your bid and the external price must exceed the fee. Otherwise, no design can satisfy both constraints.

**This is your first axiom:**

> **Axiom 1 (Feasibility):** The LP's bid must be sufficiently above the external market price to accommodate fees.

---

## Step 3: Curvature Bounds from the Corridor

The corridor itself has shape. Let's differentiate both bounds.

**Ceiling (safety):**
$$\frac{dP}{d\Delta} \leq \frac{dC_{\text{bid}}}{d\Delta} = 0$$

Price must be non-increasing (you already knew this — monotonicity).

**Floor (participation):**
$$\frac{dP}{d\Delta} \geq \frac{dP_{\text{ext}}}{d\Delta} + \frac{d(\text{fee})}{d\Delta}$$

**Interpretation:** Your price can't fall faster than the external price falls (adjusted for fee changes), or traders will leave.

---

## Step 4: Second Derivative — The Curvature Axiom

Differentiate again to get curvature constraints.

Let $\kappa(\Delta) = \frac{d^2 P}{d\Delta^2}$ (your curvature) and $\kappa_{\text{ext}}(\Delta) = \frac{d^2 P_{\text{ext}}}{d\Delta^2}$ (external curvature).

From convexity (safety): $\kappa(\Delta) \geq 0$

From participation floor:
$$\kappa(\Delta) \geq \kappa_{\text{ext}}(\Delta) + \frac{d^2(\text{fee})}{d\Delta^2}$$

> **Axiom 2 (Curvature Lower Bound):** Your curve must be *at least as convex* as the external market (adjusted for fee structure).

If external markets are convex and fees are constant, then:
$$\kappa(\Delta) \geq \kappa_{\text{ext}}(\Delta)$$

---

## Step 5: The Optimal Curve Hugs the Floor

**LP's objective:** Maximize premium collected.

$$\max_{P(\cdot)} \int_0^{\bar{\Delta}} \text{fee}(\Delta) \, d\Delta$$

Subject to the corridor constraints.

**Key insight:** To maximize volume (and thus total fees), set $P(\Delta)$ as low as possible while remaining feasible.

**Optimal design:**
$$P^*(\Delta) = P_{\text{ext}}(\Delta) + \text{fee}(\Delta)$$

Hug the participation floor — be maximally competitive.

**But wait:** This must also satisfy $P^*(\Delta) \leq C_{\text{bid}}$.

So the optimal curve is:
$$P^*(\Delta) = \min\left( C_{\text{bid}}, \, P_{\text{ext}}(\Delta) + \text{fee}(\Delta) \right)$$

---

## Step 6: The Invariant Emerges

From the optimal design, define:

$$\boxed{\phi(\Delta) := C_{\text{bid}} - P(\Delta) \geq 0}$$

This is the **safety margin** — how far below your bid the current price sits.

**Invariant:**
$$\phi(\Delta) = C_{\text{bid}} - P_{\text{ext}}(\Delta) - \text{fee}(\Delta) \geq 0$$

**In words:** At every point along the curve, your remaining "headroom" to the bid must be non-negative.

---

## Step 7: What Curvature Achieves

| Property | What It Guarantees |
|----------|-------------------|
| $P(\Delta) \leq C_{\text{bid}}$ | You never buy above your bid |
| $P(\Delta) \geq P_{\text{ext}} + \text{fee}$ | Traders always prefer you (or are indifferent) |
| $\kappa \geq 0$ | Path safety — no intermediate insolvency |
| $\kappa \geq \kappa_{\text{ext}}$ | You don't lose traders as volume accumulates |

---

## Summary

**SDR concludes:**

> "Your curve must live in the corridor between participation floor and safety ceiling. The curvature is not arbitrary — it's *derived* from:
>
> 1. External market structure (their curvature $\kappa_{\text{ext}}$)
> 2. Your safety requirement ($P \leq C_{\text{bid}}$)
> 3. Your desire to maximize volume (hug the floor)
>
> The invariant $\phi(\Delta) \geq 0$ guarantees both safety and participation at every $\Delta$.
>
> **You are safe. Traders will come. The curvature makes both true simultaneously.**"

---

## Next Steps

Possible extensions:
- How specific fee structures (constant, proportional, convex) affect optimal curvature
- Explicit construction of $P(\Delta)$ for common external market models
- Dynamic adjustment when $P_{\text{ext}}$ changes
