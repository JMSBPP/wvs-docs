# Constructing the Trading Function φ from the Pricing Rule P

> **Core Question:** How does the integral construction of P(Δ) lead to the two-dimensional trading function φ(R_X, R_Y)?

---

## 1. Starting Point: The Pricing Rule as a Quotient

### 1.1 The LP's Bid Price

The LP's bid price ψ_bid is a quotient:
$$\psi_{\text{bid}} = \frac{R_Y}{R_X}$$

This represents: total collateral willing to spend (R_Y) per unit of underlying to acquire (R_X).

**Units:** Y per X (collateral per underlying)

### 1.2 The Marginal Price P(Δ)

From the integral safety condition:
$$\int_0^{\Delta} P(u) \, du = \text{collateral spent to acquire } \Delta \text{ units}$$

**Dimensional analysis:**
- Left side: ∫ P du (integrating over X-volume)
- Right side: units of Y (collateral)
- Therefore: P has units **Y/X** — same type as ψ_bid

**Reference:** Angeris, Evans, Chitra (2021) "Replicating Market Makers" [arXiv:2103.14769], Appendix A, p.17:
> *"p(R₁) which is the marginal price of the traded coin. Recalling that R₂ can be thought of as an implicit function of R₁, we have: dR₂/dR₁ = −p(R₁)"*

---

## 2. The Differential Equation

### 2.1 Marginal Exchange Rate

When a trade occurs:
- LP receives: dR_X (underlying)
- LP spends: dR_Y (collateral)

The instantaneous price is:
$$P = -\frac{dR_Y}{dR_X}$$

This is a **first-order ordinary differential equation** in the (R_X, R_Y) plane.

**Reference:** Angeris, Chitra (2020) "Improved Price Oracles: Constant Function Market Makers" [arXiv:2003.10001], §2.1

### 2.2 Solution Curves

Given initial reserves (R_X^0, R_Y^0), solving the ODE:
$$\frac{dR_Y}{dR_X} = -P(R_X, R_Y)$$

produces a **curve** in (R_X, R_Y) space — the set of all reserve states reachable from the initial state.

---

## 3. Path Independence and Level Sets

### 3.1 The Arbitrage-Free Requirement

For the LP's safety guarantee to hold against ALL trading sequences (not just monotonic ones), the total collateral spent must depend **only on endpoints**, not on the path taken.

**Why?** If path A and path B both take you from (R_X, R_Y) to (R_X', R_Y') but involve different collateral transfers, an arbitrageur can:
1. Start at (R_X, R_Y)
2. Take path A to (R_X', R_Y')
3. Reverse along path B back to (R_X, R_Y)
4. Pocket the difference

This drains LP collateral through costless round-trips.

**Reference:** Angeris et al. (2023) "The Geometry of Constant Function Market Makers" [arXiv:2308.08066], §2.3 on path independence

### 3.2 Path Independence Forces a Potential Function

**Fundamental Theorem (Gradient Fields):**
A line integral ∫_γ P dR_X is path-independent if and only if P is the gradient of some scalar function.

**Reference:** This is a standard result from vector calculus. See:
- Marsden & Tromba, "Vector Calculus" (6th ed.), Chapter 8
- Spivak, "Calculus on Manifolds", Chapter 4

In our context: there exists φ(R_X, R_Y) such that valid trades preserve φ = constant.

### 3.3 All Valid States Lie on a Level Set

- The solution curves of dR_Y/dR_X = −P are the **level sets** of φ
- The level set φ(R_X, R_Y) = k contains all reserve states reachable from any point on that curve
- Different initial conditions give different level sets (different values of k)

---

## 4. Constructing φ from P

### 4.1 The Integration Method

**Step 1:** Given P(R_X), define the primitive (antiderivative):
$$\Phi(R_X) := \int_0^{R_X} P(u) \, du$$

**Step 2:** The trading function is:
$$\varphi(R_X, R_Y) := R_Y + \Phi(R_X)$$

**Step 3:** Verify conservation: along any valid trade,
$$d\varphi = dR_Y + P(R_X) dR_X = dR_Y - \frac{dR_Y}{dR_X} dR_X = 0$$

So φ is constant along trade paths.

### 4.2 Verification: P as Gradient Quotient

Compute:
- $\frac{\partial \varphi}{\partial R_X} = \Phi'(R_X) = P(R_X)$
- $\frac{\partial \varphi}{\partial R_Y} = 1$

Therefore:
$$P = \frac{\partial \varphi / \partial R_X}{\partial \varphi / \partial R_Y} = \frac{P}{1} = P \quad \checkmark$$

**Reference:** Angeris et al. (2023) "The Geometry of Constant Function Market Makers" [arXiv:2308.08066], §1.3.1 on marginal prices:
> *"Given R with φ(R) = 1, i.e., the starting reserves are 'reasonable' and φ differentiable at R, then, from concavity, φ(R + Δ) ≤ φ(R) + ∇φ(R)ᵀΔ"*

---

## 5. The General Two-Dimensional Case

### 5.1 When P Depends on Both Variables

If P = P(R_X, R_Y), the differential equation is:
$$\frac{dR_Y}{dR_X} = -P(R_X, R_Y)$$

This is a **quasi-linear first-order PDE** when we seek φ such that:
$$P(R_X, R_Y) = \frac{\partial \varphi / \partial R_X}{\partial \varphi / \partial R_Y}$$

### 5.2 Method of Characteristics

The level curves of φ are the **characteristic curves** of this PDE — the integral curves of the vector field (1, −P).

**Reference:** Evans, "Partial Differential Equations" (2nd ed.), Chapter 3 on first-order PDEs and characteristics

### 5.3 Example: Uniswap (Constant Product)

- Empirical observation: P = R_Y / R_X
- Differential equation: dR_Y/dR_X = −R_Y/R_X
- Solution: R_X · R_Y = k (hyperbolas)
- Trading function: φ(R_X, R_Y) = R_X · R_Y

**Reference:** Zhang, Chen, Park (2018) "Formal specification of constant product (x·y=k) market maker model and implementation"

---

## 6. Summary: The Construction Chain

$$\boxed{P(\Delta) \xrightarrow{\text{ODE}} \frac{dR_Y}{dR_X} = -P \xrightarrow{\text{integrate}} \text{curves} \xrightarrow{\text{level sets}} \varphi(R_X, R_Y) = k}$$

| Step | Mathematical Object | Economic Meaning |
|------|---------------------|------------------|
| 1 | P(Δ) | Marginal price at volume Δ |
| 2 | dR_Y/dR_X = −P | Exchange rate ODE |
| 3 | Solution curves | Reachable reserve states |
| 4 | φ(R_X, R_Y) = k | Trading invariant / Level set |

---

## 7. Key Conceptual Building Blocks

### 7.1 From Calculus / Analysis
- **Line integrals and path independence**
- **Gradient fields and potential functions**
- **Implicit function theorem** (relating level sets to functions)

### 7.2 From Differential Equations
- **First-order ODEs** and their solution curves
- **Quasi-linear PDEs** and method of characteristics
- **Conservation laws** and invariants

### 7.3 From Convex Analysis
- **Concave/convex functions** and their level sets
- **Fenchel conjugacy** (duality between trading function and portfolio value)
- **Subgradients** for non-differentiable cases

### 7.4 From Economics / Finance
- **Marginal rate of substitution** (MRS)
- **No-arbitrage conditions**
- **Options payoffs and replication**

---

## 8. References: Papers

### Core CFMM Theory

1. **Angeris, Chitra (2020)** "Improved Price Oracles: Constant Function Market Makers"
   - arXiv:2003.10001
   - Establishes price = gradient quotient, arbitrage bounds

2. **Angeris, Evans, Chitra (2021)** "Replicating Market Makers"
   - arXiv:2103.14769
   - **Appendix A, p.17:** Explicit derivation of P = dR_Y/dR_X
   - Fenchel conjugacy between trading function and payoff

3. **Angeris, Chitra, Diamandis, Evans, Kulkarni (2023)** "The Geometry of Constant Function Market Makers"
   - arXiv:2308.08066
   - **§1.3.1:** Marginal prices as gradients
   - **§2.3:** Path independence and reachable sets
   - Canonical trading function construction

4. **Angeris, Evans, Chitra (2020)** "When does the tail wag the dog? Curvature and market making"
   - arXiv:2012.08040
   - Curvature = gamma exposure, connection to volatility

### LP Returns and Impermanent Loss

5. **Milionis, Moallemi, Roughgarden, Zhang (2022)** "Automated Market Making and Loss-Versus-Rebalancing"
   - arXiv:2208.06046
   - LVR framework, LP losses from arbitrage

6. **Cartea, Drissi, Monga (2023)** "Decentralized Finance and Automated Market Making"
   - arXiv:2307.03499
   - Execution costs, convexity analysis

### Options Interpretation

7. **Clark (2020)** "The Replicating Portfolio of a Constant Product Market"
   - Shows LP position replicates a portfolio of options

8. **Evans (2020)** "Liquidity Provider Returns in Geometric Mean Markets"
   - Connection to covered call strategies

---

## 9. Recommended Resources for Further Study

### 9.1 Mathematics

**Vector Calculus & Differential Forms:**
- Marsden & Tromba, *Vector Calculus* (6th ed.) — Chapters 7-8 on line integrals, Green's theorem
- Spivak, *Calculus on Manifolds* — Rigorous treatment of differential forms

**Ordinary Differential Equations:**
- Hirsch, Smale, Devaney, *Differential Equations, Dynamical Systems, and an Introduction to Chaos* — Geometric approach to ODEs

**Partial Differential Equations:**
- Evans, *Partial Differential Equations* (2nd ed.) — Chapter 3 on first-order PDEs, characteristics

**Convex Analysis:**
- Boyd & Vandenberghe, *Convex Optimization* — Free online, excellent for Fenchel duality
- Rockafellar, *Convex Analysis* — The classic reference

### 9.2 Economics / Finance

**Microeconomics (for MRS, indifference curves):**
- Mas-Colell, Whinston, Green, *Microeconomic Theory* — Chapter 3 on consumer theory

**Derivatives Pricing:**
- Hull, *Options, Futures, and Other Derivatives* — Standard reference
- Shreve, *Stochastic Calculus for Finance II* — Rigorous continuous-time finance

**Market Microstructure:**
- O'Hara, *Market Microstructure Theory* — Classical market making
- Cartea, Jaimungal, Penalva, *Algorithmic and High-Frequency Trading* — Modern treatment

### 9.3 DeFi-Specific

**Survey Papers:**
- Mohan (2022) "Automated Market Makers and Decentralized Exchanges: A DeFi Primer" — Good introduction
- Xu, Vadgama (2021) "DeFi Protocols for Loanable Funds" — Broader DeFi context

**Online Resources:**
- Paradigm Research Blog (paradigm.xyz/writing) — Deep technical posts on AMMs
- Uniswap v3 Whitepaper — Concentrated liquidity mechanics
- Curve Finance Whitepaper — StableSwap invariant

---

## 10. Open Questions for Further Research

1. **Non-path-independent CFMMs:** How does the construction change when fees break path independence?

2. **Dynamic trading functions:** Can φ evolve over time while maintaining safety guarantees?

3. **Multi-asset generalization:** How does the gradient quotient generalize to n > 2 assets?

4. **Optimal curvature:** Given LP beliefs about volatility, what is the optimal shape of φ?

---

*Document generated: 2026-01-03*
*Part of the CLAMM research project*
