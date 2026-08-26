---
sha256: 6149c42f24a212a57c2638c76a7cca13846de5c808771ed2eb05e8f935f22643
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 48376
---
Formal State-Machine Models for Uniswap v3
Concentrated-Liquidity AMMs: Priced Timed
Automata, Finite-State Transducers, and Provable
Rounding Bounds
Julius Tranquilli† and Dr. Naman Gupta†
†Black Meridian Research
julius@blackmeridianresearch.com
naman@blackmeridianresearch.com
Abstract—Concentrated-liquidity automated market makers
(CLAMMs), as exemplified by Uniswap v3, are now a common
primitive in decentralized finance frameworks. Their design
combines continuous trading on constant-function curves with
discrete tick boundaries at which liquidity positions change and
rounding effects accumulate. While there is a body of economic
and game-theoretic analysis of CLAMMs, there is negligible work
that treats Uniswap v3 at the level of formal state machines
amenable to model checking or theorem proving.
In this paper we propose a formal modeling approach for
Uniswap v3-style CLAMMs using (i) networks of priced timed
automata (PTA), and (ii) finite-state transducers (FST) over
discrete ticks. Positions are treated as stateful objects that
transition only when the pool price crosses the ticks that bound
their active range. We show how to encode the piecewise constant-
product invariant, fee-growth variables, and tick-crossing rules
in a PTA suitable for tools such as UPPAAL, and how to derive
a tick-level FST abstraction for specification in TLA+.
We define an explicit tick-wise invariant for a discretized, single-
tick CLAMM model and prove that it is preserved up to a tight
additive rounding bound under fee-free swaps. This provides a
formal justification for the “ϵ-slack” used in invariance properties
and shows how rounding enters as a controlled perturbation. We
then instantiate these models in TLA+ and use TLC to exhaustively
check the resulting invariants on structurally faithful instances,
including a three-tick concentrated-liquidity configuration and a
bounded no-rounding-only-arbitrage property in a bidirectional
single-tick model. We discuss how these constructions lift to the
tick-wise structure of Uniswap v3 via virtual reserves, and how
the resulting properties can be phrased as PTA/TLA+ invariants
about cross-tick behaviour and rounding safety.
I. INTRODUCTION
Automated market makers (AMMs) are a core building
block of decentralized finance, enabling on-chain swaps via
constant-function pricing rather than order books. Uniswap v3
introduced concentrated liquidity, allowing liquidity providers
(LPs) to allocate capital to bounded price intervals rather than
over the full price range [1]. This design increases capital
efficiency but complicates both economic analysis and security
reasoning: liquidity is now piecewise, tick-driven, and stateful.
Existing work on Uniswap v3 has focused primarily on
economic aspects: strategic liquidity provision [2], expected
fees and impermanent loss [3], or the exact liquidity mathe-
matics of ticks [4]. Simultaneously, there is increasing interest
in mechanized reasoning about AMMs, for example the Lean
4 formalization of constant-product AMMs by Pusceddu and
Bartoletti [5]. However, there is no work that captures Uniswap
v3 as an explicit transition system suitable for off-the-shelf
model checkers such as UPPAAL or TLA+ model checking.
This paper argues that Uniswap v3 and related CLAMMs
are viewed as:
• a network of priced timed automata (PTA) [6] capturing
both discrete tick-crossing events and temporal aspects
(e.g. gas cost budgets, time-weighted liquidity measures),
and
• a finite-state transducer (FST) on discrete ticks and
bounded balances, expressing swap and liquidity actions
as input symbols and pool/LP outputs as output symbols.
Within this framework we sketch a verification agenda that
includes:
1) Invariance: a pool-specific constant-function quantity
remains invariant under swaps and tick-crossings, modulo
bounded rounding error.
2) Reachability: checking whether certain adverse price
states (e.g. extreme ticks) are reachable under specified
adversary and LP strategies.
3) Rounding safety: establishing the absence of round-
trip trading cycles that extract positive value purely from
rounding behaviour, in the spirit of economic no-arbitrage
conditions.
We construct a core object: a tick-wise invariant Ki and
its behaviour under discrete swaps. We define and analyze
a simplified, single-tick CLAMM model that captures the
arithmetic structure (constant product plus flooring) without
the complication of multiple ticks. For this model we prove
an explicit bound on the deviation of XY (the usual constant-
product invariant) due to rounding, for arbitrary fee-free swaps
within the tick.
Contributions.: The contributions of this paper are:
arXiv:2512.06203v1 [cs.LO] 5 Dec 2025• A self-contained state-machine model of a Uniswap
v3 pool and its positions in terms of PTA and FSTs,
parameterized by ticks and bounded balances.
• A concrete definition of a tick-wise invariant Ki consistent
with Uniswap-style constant-product math, together with
a proved bound on its change under discretized swaps in
a single-tick model. Mathematically this bound is elemen-
tary; the contribution lies in turning it into an explicit,
parameterised rounding core (Definition 4, Theorem 1)
that can be instantiated in mechanised models.
• Formal definitions of invariance and safety properties
relevant to CLAMM correctness, including a “k-invariance
across ticks” property and a notion of rounding-arbitrage-
freeness, together with fully explored TLA+ instances that
check these properties under explicit bounds.
• A mapping of this model into UPPAAL (for PTA-
based model checking) and into TLA+ (for discrete state
exploration), with example queries and invariants, showing
how the rounding core and its bound thread through
the specifications and support exhaustive exploration for
bounded parameter regimes.
• A discussion of how this approach relates to and comple-
ments existing theorem-proving work on AMMs in Lean
and general surveys of timed automata in security [8],
and how the same templates apply to constant-product
AMMs beyond Uniswap v3.
II. BACKGROUND
A. Uniswap v3 Concentrated Liquidity
At a high level, a Uniswap v3 pool manages reserves (x,y)
of two ERC-20 tokens (A,B) and supports swaps subject to a
constant-function pricing rule, but with liquidity concentrated
in one or more price intervals [1], [4]. Price is represented
via a discrete tick index i ∈ Z and a geometric tick-to-price
mapping
Pi = λi
, λ > 1,
with λ ≈ 1.0001 in the deployed protocol.
Each LP position is specified by a lower tick iℓ, an upper
tick iu, and a liquidity amount L > 0. The position’s liquidity
contributes to the pool’s active liquidity only when the current
tick ic lies within the half-open interval [iℓ,iu).
Inside a single tick interval [Pi,Pi+1) with active liquidity
L, the pool behaves like a standard constant-product AMM
in terms of the relationship between price and reserves, but
expressed in terms of
√
P and L rather than explicit reserves [4].
When swaps drive the price to the boundary Pi+1, a tick
crossing occurs, adjusting active liquidity by the net liquidity
of all positions whose lower or upper bounds equal i + 1.
Economically-focused work has analyzed fees, impermanent
loss, and optimal LP strategies under this design [2], [3].
B. Timed and Priced Timed Automata
Timed automata, introduced by Alur and Dill [7] and later
surveyed by Bengtsson and Yi [6], extend finite-state automata
with real-valued clocks that evolve continuously with time.
Guards involving clock inequalities control when transitions
may fire; invariants on locations bound dwelling time.
Priced timed automata (PTA) further attach costs (or prices)
to locations and transitions, enabling model checking of tem-
poral properties that involve accumulated resource usage, such
as “minimal expected cost” or “maximal reward” [9]. Tools
such as UPPAAL and its SMC extension support networks
of PTA and queries in a fragment of timed computation tree
logic (TCTL) [10].
Recent surveys show that timed automata are a natural fit
for security protocols and resource-sensitive systems, captur-
ing both functional and temporal/quantitative properties [8].
CLAMMs are similarly resource-sensitive: tokens and fees are
conserved (up to rounding), while gas consumption and time
in-range are important quantities.
C. TLA+ and Model Checking of Blockchain Protocols
TLA+ is a state-based formal specification language based
on actions and temporal logic [11]. It has been used to
model and verify blockchain protocols such as cross-chain
swaps and consensus algorithms [12], [13]. In TLA+, systems
are described via a state space of variable valuations and a
next-state relation Next, together with invariants and liveness
properties.
A CLAMM like Uniswap v3 fits this style of modeling: pool
reserves, active liquidity, fee-growth variables, and positions all
contribute to a finite (or finitely bounded) state vector. Swaps,
mint-burn operations, and tick crossings are actions.
III. UNISWAP V3 AS A STATE MACHINE
We now define a simplified operational model of a Uniswap
v3-style CLAMM, separating out the discrete tick dimension
and the continuous-time dimension.
A. Discrete Pool State
We fix:
• a finite tick range Tick = {imin,...,imax} ⊂ Z,
• a tick-to-price mapping P : Tick → R>0, Pi = λi
,
• a finite index set of positions I = {1,...,N}.
Definition 1 (Pool Configuration). A pool configuration is a
tuple
cfg = (ic,X,Y,Lact,L,Fx,Fy)
where
• ic ∈ Tick is the current tick index,
• X,Y ∈ N are token reserves of A and B in minimal
units,
• Lact ∈ N is the active liquidity at tick ic,
• L : I → N × Tick × Tick maps a position index k to
(Lk,ik
ℓ ,ik
u) such that ik
ℓ < ik
u and Lk ≥ 0,
• Fx,Fy ∈ N are fee-growth variables tracking cumulative
fees in token units, as in the Uniswap v3 whitepaper [1].
The active liquidity Lact is derived from positions:
Lact =
X
k∈I:ik
ℓ ≤ic<ik
u
Lk.In the actual protocol, reserves and prices are represented
in fixed-point formats with specific Q64.96 encodings [4];
we abstract this as integer amounts with a fixed scale factor
and a rounding operator ⌊·⌉ capturing rounding to the nearest
representable value.
B. Swap and Tick-Crossing Transitions
We distinguish three classes of atomic pool transitions:
1) SWAP(δ): swap an input amount δ > 0 of one token for
the other, modifying (X,Y ) and potentially changing ic.
2) MINT(k,...) / BURN(k): add or remove a position k
with certain (Lk,ik
ℓ ,ik
u).
3) CROSS(±): pure tick-crossing events where the price
moves from Pi to Pi±1 and Lact is updated.
We assume swaps are decomposed into infinitesimal steps
that move the price along the curve up to a tick boundary; at
the boundary a CROSS transition updates Lact and the swap
continues in the next tick interval if needed [1], [4]. For the
purposes of model checking, we discretize swaps into single-
tick swaps that never cross more than one tick, and represent
multi-tick swaps as finite sequences of these.
Let State denote the set of all pool configurations. Then
the transition relation Next ⊆ State × State is the smallest
relation satisfying:
(Swap within tick) Given cfg with tick ic and active liquidity
Lact > 0, an input δx > 0 of token A yields a new
configuration cfg′
with:
X′
= X + δx,
Y ′
= Y − ⌊ϕ(δx,Lact,ic)⌉,
i′
c = ic, L′
act = Lact,
where ϕ encodes the constant-product pricing function on
the interval [Pic
,Pic+1) as in [4], and the rounding operator
captures Uniswap v3’s fixed-point arithmetic. We require Y ′
≥
0.
A symmetrical rule applies for token B inputs.
(Tick crossing) If a swap drives the price exactly to Pic+1 (or
Pic−1), a CROSS transition updates:
i′
c = ic + 1,
L′
act = Lact + ∆Lic+1,
where ∆Lj is the net liquidity added or removed at tick
boundary j by positions whose range starts or ends at
j [1]. Reserves (X,Y ) and fee-growth variables (Fx,Fy)
are unchanged by pure crossings. Analogous rules apply for
downward crossings.
(Mint/Burn) Minting and burning adjust L and implicitly Lact
when ic falls inside or outside the new range.
C. Piecewise Constant-Function Invariant
A core correctness property of constant-product AMMs is
that, in absence of fees, swaps preserve the product k = XY
(after discrete rounding). In Uniswap v3, the invariant is defined
in terms of virtual reserves computed from Lact and price;
see [4]. For our purposes, we separate two levels: (i) a concrete
constant-product invariant on per-tick virtual reserves, and (ii)
a derived tick-wise invariant Ki on the actual pool state.
Definition 2 (Tick-wise Invariant). For a tick i and active
liquidity L > 0, define
Ki(X,Y,L) := X · Y,
the product of (virtual) reserves in the tick. In a faithful
Uniswap v3 model, X and Y can be instantiated as the virtual
reserves induced by L and the current price in [Pi,Pi+1) [4].
In the simplified models below, we identify X,Y with the actual
reserves.
Within a single tick where no mint-burn or tick-crossing
occurs, idealized fee-free swaps preserve Ki exactly at the
real-valued level; discretization introduces bounded slack.
Section IV proves an explicit bound for a single-tick model.
The cross-tick behaviour can then be expressed as a global
invariant:
Definition 3 (Cross-Tick k-Invariance). A CLAMM satisfies
cross-tick k-invariance if for any sequence of swaps and tick
crossings that does not mint or burn liquidity, there exists a
constant k and a bound ϵ ≥ 0 such that
|Kic
(X,Y,Lact) − k| ≤ ϵ
for all reachable configurations.
The explicit bound in the single-tick model will motivate
concrete candidates for ϵ.
IV. A TOY SINGLE-TICK MODEL AND A k-INVARIANCE
THEOREM
To ground the abstract invariant in a concrete calculation,
we now analyze a simplified, single-tick CLAMM model. The
goal is to exhibit a proved lemma about discretized swaps
and rounding. This lemma can be understood as a local
approximation of Uniswap v3 behaviour within a single tick,
and provides a formally justified choice of the ϵ bound in
invariance properties.
A. Toy Model
Fix a single tick (so price is constant within this model)
and consider a fee-free constant-product AMM with integer
reserves (X,Y ) ∈ N2
, where X and Y count minimal token
units. Let
K := X · Y
be the usual constant-product invariant.
We define a discretized swap rule for a token-A input δ ∈ N:
X′
= X + δ,
Y ′
=

K
X′

.
That is, we first compute the ideal continuous new reserve
Y ∗
:= K/X′
, then round down to the nearest integer to obtainY ′
. (We ignore underflow cases where Y ′
would be negative;
these are excluded by guards in the transition system.)
This is the continuous constant-product update with a
fixed rounding direction on the output leg; it is the structure
underlying Uniswap v2 and, via virtual reserves, the per-tick
behaviour of Uniswap v3.
B. A Concrete Invariance Bound
We now prove the following statement: under the discretized
swap rule above, the new product K′
:= X′
Y ′
is bounded
between K − X′
and K.
Lemma 1 (Single-Swap Constant-Product Bound). Let
(X,Y ) ∈ N2
with K = XY and let δ ∈ N. Suppose we
perform a fee-free token-A swap according to
X′
= X + δ, Y ′
=

K
X′

.
Then the new product K′
:= X′
Y ′
satisfies
K − X′
≤ K′
≤ K.
In particular,
|K′
− K| ≤ X + δ.
Proof. Let X′
= X + δ and Y ∗
:= K/X′
. By definition of
floor,
Y ∗
− 1 < Y ′
≤ Y ∗
.
Multiply by X′
:
X′
(Y ∗
− 1) < X′
Y ′
≤ X′
Y ∗
.
But X′
Y ∗
= X′
· (K/X′
) = K, so the upper bound gives
K′
= X′
Y ′
≤ K.
For the lower bound,
X′
(Y ∗
− 1) = X′

K
X′
− 1

= K − X′
.
Since X′
(Y ∗
− 1) < X′
Y ′
, we have K − X′
< K′
, and
because K′
is integer this implies
K − X′
≤ K′
.
Finally, X′
= X + δ, so
|K′
− K| = K − K′
≤ X′
= X + δ.
This lemma isolates the effect of the floor operation on
the constant-product invariant. The upper bound K′
≤ K is
expected: rounding down can only reduce the product. The
error is bounded linearly in X′
.
Remark 1 (Multiple Swaps). For a sequence of swaps with
inputs δ1,...,δn and corresponding intermediate reserves Xj,
repeated application of Lemma 1 yields
Kn ≥ K0 −
n X
j=1
Xj,
j
Kj
K0
K0 − ϵ
0 1 2 3 n
Fig. 1. Schematic illustration of the discretized constant-product core. Each
swap step moves from Kj to Kj+1, remaining within an ϵ-band [K0 −ϵ,K0]
with ϵ = nB as in Theorem 1.
where Kj = XjYj. In particular, if Xj ≤ B for all j, then
|Kn − K0| ≤ nB.
For bounded reserves and bounded swap length n, the deviation
from the initial K is therefore uniformly bounded, justifying
an ϵ in the invariance property that depends only on these
bounds.
Definition 4 (Discretized Constant-Product Core). A discretized
constant-product core consists of integer reserves (X,Y ) ∈ N2
,
a product K = XY , and a family of swap steps of the form
X′
= X + δ, Y ′
=

K
X′

,
with inputs δ ∈ N chosen from some bounded range, together
with a bound B such that X ≤ B holds in all reachable states.
Theorem 1 (Epsilon-Slack Constant-Product Core). Consider
a discretized constant-product core as in Definition 4. For any
finite sequence of fee-free swaps of length at most n starting
from (X0,Y0) with product K0 = X0Y0 and satisfying Xj ≤ B
at each intermediate state, the products Kj = XjYj obey
|Kj − K0| ≤ nB for all j ≤ n.
Equivalently, the core preserves the constant-product invariant
up to an additive slack ϵ = nB determined entirely by the
reserve bound B and the maximal path length n.
The single-swap Lemma 1 and the multi-swap Remark 1
together provide the proof: each step perturbs K by at most its
current Xj ≤ B, and so a path of length n accumulates at most
nB deviation in the downward direction. This abstract rounding
core underlies all of the subsequent PTA, FST, and TLA+
models; Uniswap v3-style virtual reserves simply instantiate
(X,Y ) and (K,B,n) with protocol-specific parameters.
C. Rounding-Core Template for AMMs
Definition 4 and Theorem 1 capture the reusable “rounding
core” that underlies a wide class of constant-product AMMs: a
piece of math that can be dropped into many different models
to obtain an explicit ϵ-slack bound. Informally, any protocol
that:• maintains integer (or fixed-point) reserves (X,Y ) for a
trading pair,
• updates (X,Y ) by first setting X′
= X+δ or Y ′
= Y +δ
for an input δ drawn from a bounded range,
• computes the counter-reserve by dividing the product
K = XY and applying a fixed rounding direction (e.g.
floor),
• and enforces a uniform upper bound B on one side of
the reserves along any admissible execution,
inherits an ϵ-slack invariant of the form |Kj − K0| ≤ nB for
paths of length at most n.
In practice, applying the rounding core to a specific AMM
or DEX proceeds in four steps:
1) Identify reserves and product. Choose a pair of integer
(or scaled fixed-point) reserves (X,Y ) and a product
K = XY that captures the invariant quantity of interest
(e.g. a virtual-reserve product in a Uniswap v3 tick, or
the literal reserve product in a Uniswap v2 pool).
2) Characterize swap updates. Write the swap rule in
the form X′
= X + δ together with Y ′
= ⌊K/X′
⌋ (or
symmetrically for Y input), matching the division-and-
floor pattern of Definition 4.
3) Fix bounds B and n. Establish a bound B on the
relevant reserve (e.g. via protocol limits, liquidity caps,
or a modeling assumption) and a maximal path length n
for the executions of interest (e.g. a bound on the number
of swaps in a scenario or arbitrage search).
4) Instantiate ϵ. Set ϵ := nB and assert an ϵ-slack invariant
|Kj − K0| ≤ ϵ along all such paths, either analytically
or via a model-checking proof in a concrete bounded
instance.
The TLA+ modules in Section VII illustrate this template:
ToyCLAMM, ToyCLAMM2Dir, ToyCLAMM2DirArb, and
ToyCLAMM3Tick differ only in their choice of bounds, swap
directions, and inclusion of traders or ticks, but all instantiate
the same discretized constant-product core.
D. Connecting Back to Ki
In a faithful Uniswap v3 tick, one does not store explicit
per-tick reserves (X,Y ) but liquidity L and square-root
price
√
P; actual amounts of each token are derived from
(L,
√
P,
√
Pℓ,
√
Pu) via the formulas in [4]. However, for any
fixed tick interval [Pi,Pi+1) and price P within that interval,
one can define virtual reserves (Xvirt
,Y virt
) whose continuous
evolution under swaps matches the Uniswap v3 formulas.
If we then discretize the virtual reserves via flooring to
minimal token units, the swap update for (Xvirt
,Y virt
) takes
the form of the single-tick model above, and Lemma 1 applies
with
Ki(X,Y,Lact) := Xvirt
· Y virt
.
This provides an explicit and proved bound on intra-tick
deviations of Ki under discretized swaps, which can then
be used as the per-tick ϵ when stating cross-tick invariants.
E. A Concrete Virtual-Reserve and Fixed-Point Instantiation
To make the link to Uniswap v3’s liquidity math more
explicit, we sketch a concrete virtual-reserve construction on a
single tick together with a fixed-point rounding scheme. Inside
a tick interval [Pi,Pi+1) with mid-price P and active liquidity
Lact, we define continuous virtual reserves
X∗
(P,Lact) :=
Lact
√
P
, Y ∗
(P,Lact) := Lact
√
P,
so that X∗
Y ∗
= L2
act is constant along the idealized price curve.
This is a simplified instance of the virtual-reserve constructions
in [4], focusing on a single active price interval and omitting
explicit lower/upper bounds Pℓ,Pu.
Uniswap v3 represents prices in a Q64.96 fixed-point
encoding and performs arithmetic in scaled integers [4]. To
reflect this, we fix a scaling factor S ∈ N (with S = 296
corresponding to the deployed format) and define discrete
virtual reserves by
Xvirt
:= ⌊S · X∗
(P,Lact)⌋, Y virt
:= ⌊S · Y ∗
(P,Lact)⌋.
Swaps are then executed on (Xvirt
,Y virt
) using the discrete
update rule of Section IV, and actual token transfers are
recovered by rescaling back by S. For any finite choice
of S and bounds on Lact and P, there exist corresponding
bounds Bx,By such that Xvirt
≤ Bx and Y virt
≤ By for all
reachable states. In this regime, Lemma 1 applies verbatim
to (Xvirt
,Y virt
) with Ki := Xvirt
Y virt
, and the ϵ in cross-
tick invariants can be instantiated in terms of S, Lact, and the
maximal number of intra-tick swaps. This construction therefore
realizes, in fixed-point arithmetic, the abstract “rounding core”
used throughout the PTA, FST, and TLA+ models.
Remark 2 (Why a Simplified Single-Tick Model, and How It
Ports to Uniswap v3). The single-tick, fee-free reference model
abstracts away several features of the deployed Uniswap v3
protocol (a large tick range, Q64.96 fixed-point arithmetic, fees,
and many overlapping positions). Including all of these at once
would lead to a large bounded state space for model checking
and obscure the specific contribution of the rounding analysis.
By isolating the floor operation on a constant-product update,
Lemma 1 and its instantiated TLA+ specification capture the
part of the behaviour that depends only on the division-and-
floor pattern, not on the exact price parametrization. The
parameters B (or Bx,By) and nMax in these models and
ToyCLAMM are free bounds that can be calibrated to realistic
reserve sizes and swap lengths, and the same reasoning applies
when X,Y are interpreted as Uniswap v3 virtual reserves
computed from Q64.96 price and liquidity. This makes the
construction a portable “rounding core” that can be embedded
into more faithful, but still finitely bounded, Uniswap v3
specifications in PTA or TLA+.
V. MODELING AS PRICED TIMED AUTOMATA
We now return to the PTA model, this time threading through
the concrete invariant and bound established above.A. PTA Syntax
A (priced) timed automaton [6], [9] is a tuple
A = (L,ℓ0,Xc,E,Inv,C),
where:
• L is a finite set of locations; ℓ0 ∈ L is the initial location.
• Xc is a finite set of real-valued clocks.
• E ⊆ L × G(Xc) × Act × 2Xc
× L is a set of edges,
each with a guard, action label, clock reset set, and target
location.
• Inv : L → G(Xc) assigns an invariant to each location.
• C assigns cost rates to locations and cost weights to edges.
A network of PTA is a parallel composition of such automata
sharing clocks and synchronizing on action labels.
B. Pool Automaton
We represent the pool as an automaton APool with:
• Locations L = {ℓi | i ∈ Tick}, one location per tick.
• A clock t measuring time since the last state update, and
possibly additional clocks for LP-specific timers.
• Integer-valued global variables encoding
(X,Y,Lact,Fx,Fy) and the per-position data L.
Intuitively, the automaton resides in location ℓic when the
current pool tick is ic. Swap requests arrive from a separate
trader automaton via synchronizing channels (e.g. swap0?,
swap1? in UPPAAL syntax), and tick crossings correspond
to edges between adjacent locations.
Locations and Invariants.: For each tick i, location ℓi has
an invariant:
Inv(ℓi) : t ≤ Tmax,
bounding the time the system can remain without processing
a swap or maintenance action. The cost rate C(ℓi) can
encode, for example, the cost of capital (impermanent loss,
opportunity cost) per unit time associated with the current
liquidity configuration.
Swap Edges.: From location ℓi, a token-A swap edge has
the form:
(ℓi, gswap
i , swap0?, {t}, ℓi)
with guard gswap
i expressing:
• the requested input δx is non-zero and within a configured
bound,
• the resulting reserves remain non-negative,
• the post-swap price remains in [Pi,Pi+1) (i.e. no tick
crossing).
The action updates the global variables (X,Y,Fx,Fy) and
resets clock t using the discretized update rule. On the level
of the invariant, this update satisfies the per-tick bound from
Lemma 1; in particular, if we define a derived variable
K := X · Y,
then each such edge satisfies
K − X′
≤ K′
≤ K,
where primes denote post-state variables.
Pool
(PTA)
Trader
(PTA)
LPs
(PTA)
Oracle
(PTA)
Tick-wise FST /
TLA+ rounding core
swaps
liquidity
prices
tick abstraction
+ rounding core
Fig. 2. High-level architecture: the Uniswap v3 pool is modeled as a priced
timed automaton composed with trader, LP, and oracle automata. A tick-wise
finite-state transducer / TLA+ specification abstracts the discrete dynamics
and instantiates the discretized constant-product core of Definition 4.
If the swap would reach the boundary Pi+1 exactly, the edge
instead targets ℓi+1 and updates Lact by ∆Li+1 (the tick-cross
rule). If the swap would overshoot the tick, we split it into a
crossing part and a residual part, encoded as two edges; we
approximate this with a single “crossing” edge that leaves a
bounded rounding slack.
Mint/Burn Edges: Mint and burn operations are modeled
as edges labeled mint! and burn! between locations ℓic
and itself, updating L and, if needed, Lact.
C. Trader and Environment Automata
The pool automaton composes with trader, LP, and oracle
automata as described previously. The main point is that
the concrete invariant K and its bound are now part of the
model: they are expressed as integer-valued state variables and
constraints on edges, rather than left abstract.
D. Properties in TCTL
With this PTA model, we can formulate verification goals
as TCTL queries, as supported by UPPAAL and UPPAAL
SMC [10].
(1) Invariant with Concrete ϵ.: Introduce an integer-valued
variable K and a ghost variable K0 storing its value in the
initial configuration. For per-tick bounds X′
≤ BX and swap
length at most n, Remark 1 yields
|K − K0| ≤ nBX.
In UPPAAL we can express a safety property:
A[] |K − K0| ≤ nBX,
which is a direct translation of the analytic bound into the
model checker.(2) Price Reachability.: As before, we can ask whether
certain “bad” ticks are reachable and whether this remains true
under bounded rounding effects.
(3) Rounding-Arbitrage-Freeness (Local).: One can for-
mulate a local no-arbitrage property stating that any cycle of
swaps that starts and ends at the same reserves (X,Y ) cannot
increase the trader’s mark-to-market value, up to the known
K-slack. For short cycles within a single tick and bounded
X, Lemma 1 implies that the pool’s effective depth always
weakens, which can be used as a potential function argument
against profitable pure-rounding cycles of fixed length in the
PTA model.
VI. FINITE-STATE TRANSDUCER ABSTRACTION
Timed automata are suited to capturing temporal and cost
aspects, but many correctness questions about CLAMMs con-
cern the purely discrete tick-wise dynamics and arithmetic. For
these, a finite-state transducer (FST) abstraction is appropriate.
A. Definition
Fix finite bounds on:
• tick range Tick,
• reserves X,Y ≤ B,
• number and size of positions (via bounds on Lk).
Definition 5 (CLAMM Transducer). A CLAMM FST is a tuple
T = (Q,Σ,Γ,q0,δ,λ),
where:
• Q is a finite set of states, each encoding a bounded pool
configuration cfg,
• Σ is an input alphabet of actions: swap requests, mint-
burn operations, administrative updates,
• Γ is an output alphabet of observed effects: actual trade
amounts, fee updates, tick-crossing indicators,
• q0 ∈ Q is an initial state,
• δ : Q × Σ → Q is a (possibly partial) transition function,
• λ : Q × Σ → Γ is an output function.
As before,
Σ = {Swap0(δx), Swap1(δy), Mint(k,...), Burn(k)},
and
Γ = {Traded(dx,dy), Fees(fx,fy), Crossed(i → j)}.
The discretized update of (X,Y ) inside a tick is the single-
tick model from Section IV. Thus each intra-tick transition
in T satisfies the product bound of Lemma 1. This lifts the
analytic lemma into an automata-theoretic invariant: for any
path of length n consisting solely of intra-tick swaps and with
X ≤ B, we have
|K(qn) − K(q0)| ≤ nB,
where K(q) is the value of XY encoded in state q. This can
be expressed as a CTL or LTL property over T .
VII. TLA+ SPECIFICATION SKETCH
We briefly sketch a TLA+ specification style for the CLAMM
FST that incorporates the invariant and its bound. The concrete
modules introduced below—ToyCLAMM, ToyCLAMM2Dir,
ToyCLAMM2DirArb, and ToyCLAMM3Tick—are instances
of the discretized constant-product core from Definition 4,
and can be viewed as reusable templates for constant-
product+rounding systems beyond Uniswap v3 itself.
A. State Variables
We introduce the following TLA+ variables:
• tick ∈ Tick,
• X,Y ∈ 0...B,
• LAct ∈ 0...Lmax,
• Positions ∈ [1...N → [L : 0...Lmax,Low :
Tick,High : Tick]],
• Fx,Fy ∈ 0...Fmax,
• optional: TraderBal,TraderV al,
• a ghost variable K0 storing the initial product X · Y .
We define
K ≜ X ∗ Y
as a derived expression in TLA+.
B. Next-State Relation
We define actions Swap0(δx), Swap1(δy), CrossUp,
CrossDown, Mint(k,...), Burn(k) analogously to the op-
erational model, using an explicit Floor operator for the
discretized update. For intra-tick swaps, the TLA+ rule for
(X′
,Y ′
) is the one used in Lemma 1.
C. Invariants
The concrete bound from Lemma 1 suggests the following
invariants:
InvNonNeg ≜ X ≥ 0 ∧ Y ≥ 0 ∧ LAct ≥ 0,
Invk,ϵ ≜ K − K0 ≤ nMax ∗ B,
InvBounds ≜ X ≤ B ∧ Y ≤ B ∧ ...
where nMax and B are configuration parameters representing
an upper bound on the length of intra-tick swap sequences and
the maximal X reserve respectively.
A specification
Spec ≜ Init ∧ □[Next]⟨X,Y,LAct,Positions,...⟩
then admits the theorem
THEOREM Spec ⇒ □(InvNonNeg ∧ Invk,ϵ ∧ InvBounds),
which directly corresponds to the analytic reasoning. For finite
bounds Tick,B,nMax, this is amenable to model checking
via TLC.
D. Instantiated TLA+ Modules and TLC Checks
To instantiate the preceding sketch, we implement TLA+
modules that encode bounded instances of the single-tick model
and mechanically check the invariants.Single-direction ToyCLAMM.: The first module
ToyCLAMM encodes the single-tick, fee-free reference model
with bounded integer reserves:
• Constants Bx,By bound the reserves X,Y ; LMax
bounds the active liquidity LAct; NMax bounds the
number of intra-tick swaps.
• Variables X,Y,LAct,step,K0 follow the structure above,
with K ≜ X ∗ Y as a derived expression.
• The Swap0 action implements
X′
= X + δx, Y ′
=

K
X′

,
for a nondeterministically chosen δx in a bounded range,
and increments step up to NMax.
For a concrete instantiation we take
Bx = By = 10, LMax = 0, NMax = 3,
which bounds the state space and fixes an explicit ϵ for the
product invariant. In this setting we define the combined
invariant
InvAll ≜ (X ≥ 0 ∧ Y ≥ 0 ∧ LAct ≥ 0)
∧ (X ≤ Bx ∧ Y ≤ By ∧ LAct ≤ LMax)
∧ (K0 − NMax ∗ Bx ≤ K ≤ K0),
which is a direct instantiation of InvNonNeg, InvBounds, and
Invk,ϵ with ϵ = NMax · Bx = 30. The corresponding TLA+
specification
SpecToy ≜ Init ∧ □[Next]⟨X,Y,LAct,step,K0⟩
is accompanied, in TLA+ syntax, by the theorem
THEOREM SpecToy ⇒ □(InvAll),
which we have model checked with TLC using a standard
configuration file and the constants above. In this instance,
TLC explores 855 distinct reachable states (2818 generated in
total) with search depth 4 and reports no counterexample to
InvAll. This leads to the following named result.
Proposition 1 (Instantiated Single-Tick Invariant). For Bx =
By = 10, LMax = 0, and NMax = 3, every behaviour of
SpecToy satisfies □(InvAll), i.e. the non-negativity, bounded-
ness, and ϵ-bounded product constraints with ϵ = 30 hold in
all reachable states.
Bidirectional ToyCLAMM2Dir.: To move slightly closer to
an actual AMM while keeping the model finite and analyzable,
we introduce a second module ToyCLAMM2Dir that allows
swaps in both token directions. It reuses the same constants
and variables (Bx,By,LMax,NMax,X,Y,LAct,step,K0)
and invariant InvAll, but extends the next-state relation with a
symmetric token-B swap:
• Swap0 is as above.
• Swap1 nondeterministically chooses an input δy, updates
Y ′
= Y + δy (bounded by By), and sets X′
= ⌊K/Y ′
⌋,
incrementing step up to NMax.
The Stop action again stutters once the swap budget is
exhausted. For the same concrete bounds Bx = By = 10,
LMax = 0, NMax = 3, TLC explores 2542 distinct states
(16950 generated in total) with search depth 4 and reports no
counterexample to InvAll.
Proposition 2 (Bidirectional Single-Tick Invariant). For Bx =
By = 10, LMax = 0, and NMax = 3, every behaviour
of the bidirectional specification based on ToyCLAMM2Dir
satisfies □(InvAll), so the same ϵ-bounded product invariant
remains stable under both token-A and token-B discretized
swaps.
This shows that the invariant structure persists under bidi-
rectional discretized constant-product swaps, which is closer
to the behaviour of a real AMM pool while still fitting into a
fully explored state space.
Rounding-Only Arbitrage Search in ToyCLAMM2DirArb.:
To probe an economically meaningful property, we further ex-
tend the bidirectional single-tick model with explicit trader bal-
ances in tokens X and Y . The module ToyCLAMM2DirArb
introduces variables TraderX,TraderY and a derived mark-
to-market value V al := TraderX + TraderY under a fixed
external price normalization, together with ghost variables
X0,Y0,V al0 storing the initial pool state and trader value.
Swap actions now transfer tokens between the trader and the
pool while still using the discretized constant-product update
on (X,Y ). A rounding-only arbitrage state is defined by
BadArb ≜ (X = X0) ∧ (Y = Y0) ∧ (V al > V al0),
meaning that the pool has returned exactly to its initial reserves
while the trader has strictly increased her value, without any
change in external prices. For concrete bounds we take Bx =
By = 10, LMax = 0, NMax = 4, T0x = 10, and T0y = 0.
TLC explores 10,849 distinct states (73,826 generated in total)
with search depth 7 and reports no reachable state satisfying
BadArb.
Proposition 3 (No Short Rounding-Only Arbitrage). For Bx =
By = 10, LMax = 0, NMax = 6, T0x = 10, and T0y = 0,
there is no behaviour of the ToyCLAMM2DirArb specification
that both returns the pool from (X0,Y0) to (X0,Y0) and strictly
increases the trader’s value V al. Equivalently, there is no
rounding-only arbitrage cycle of length at most six under these
bounds.
In other words, within this bounded model there is no short
rounding-only arbitrage cycle: no sequence of at most four
bidirectional swaps returns the pool to its initial configuration
while strictly increasing the trader’s mark-to-market value.
Three-tick ToyCLAMM3Tick.: As a minimal struc-
tural approximation of concentrated liquidity, we further
define a three-tick module ToyCLAMM3Tick with ticks
{TickMin,TickMid,TickMax} representing a bounded
tick range. The state now includes a tick index and an active-
liquidity variable LAct, while (X,Y ) continue to represent inte-
ger “virtual” reserves updated by the same discretized constant-
product swaps as above. In addition to Swap0 and Swap1, weadd tick-crossing actions CrossUp and CrossDown that move
the tick between neighbouring values and adjust LAct within
a fixed bound, leaving (X,Y ) unchanged. For concrete bounds
we take Bx = By = 10, LMax = 5, NMax = 4, and
(TickMin,TickMid,TickMax) = (0,1,2). We equip the
model with an invariant InvAll3 that combines non-negativity,
bounded tick range, bounded reserves/liquidity, and the same
product bound K0 − NMax · Bx ≤ K ≤ K0. TLC then
explores 54,756 distinct states (674,604 generated in total)
with search depth 5 and reports no counterexample to InvAll3.
Proposition 4 (Three-Tick Cross-Tick Invariant). For
Bx = By = 10, LMax = 5, NMax = 4, and
(TickMin,TickMid,TickMax) = (0,1,2), every behaviour
of the ToyCLAMM3Tick specification satisfies □(InvAll3), so
the ϵ-bounded product invariant is preserved across both intra-
tick swaps and bounded sequences of tick-crossing steps.
This provides a fully explored three-tick model in which the
ϵ-bounded product invariant remains stable not only under intra-
tick swaps but also under bounded sequences of tick crossings,
mirroring the cross-tick k-invariance property discussed at the
semantic level. For example, if we interpret a unit of X as a
single minimal token unit and bound B = 106
and n = 100 in
Theorem 1, then the cumulative slack ϵ = nB corresponds to
at most 108
token units of deviation in K, which in a pool with
K on the order of 1018
translates to a deviation on the order
of 10−10
in relative terms (i.e. at most a few nano-basis-points
of invariant drift). Although our instantiated TLA+ models use
smaller bounds to keep the state space finite, the parameterised
theorem explicitly shows how to scale ϵ with realistic reserve
and path-length choices.
E. A Non-Uniswap Constant-Product Example
To emphasize that the discretized constant-product core is
not specific to Uniswap v3, consider a standard Uniswap v2-
style pool for tokens (A,B) with integer reserves (X,Y ) ∈ N2
and the usual constant-product invariant K = XY . Fees aside,
the idealized continuous swap rule for an input δ of token A
sets X′
= X + δ and Y ′
= K/X′
, with the trader receiving
Y − Y ′
. In an on-chain implementation based on fixed-point
integers, this update is realized as
X′
= X + δ, Y ′
=

K
X′

,
matching the division-and-floor pattern in Definition 4. If we
assume that X ≤ B holds along all executions of interest
(e.g. by restricting attention to a range of pool sizes or by
instrumenting the TLA+ model with an explicit bound), then
Theorem 1 applies directly: any sequence of at most n fee-
free swaps in such a Uniswap v2-style pool satisfies |Kj −
K0| ≤ nB. Thus the ϵ-slack constant-product invariant and its
TLA+ instantiations can be reused for constant-product AMMs
more broadly, with Uniswap v3’s tick structure providing one
particular way of organizing the state space.
F. Summary of TLA+ Model Parameters
Table I summarizes the main TLA+ instances used in
this paper, including their bounds, the corresponding ϵ from
Theorem 1, and the size of the state space explored by TLC.
G. A Calibrated Rounding-Only Profit Bound
To give the rounding core an explicit economic reading,
consider a single tick of a Uniswap-style ETH/USDC pool
whose virtual reserves on each side lie between 106
and 107
minimal units, so that K0 = X0Y0 is on the order of 1012
to 1014
. If we conservatively bound the relevant reserve by
B = 106
units and restrict attention to cycles of at most
n = 6 swaps (a handful of swaps in a typical MEV bundle),
Theorem 1 yields
|Kj − K0| ≤ ϵ = nB = 6 · 106
for all j ≤ 6. In relative terms this gives
ϵ
K0
≤
6 · 106
1012
= 6 · 10−6
,
that is, at most 0.0006% or 0.06 basis points of invariant drift
for six-step paths in such a tick.
Since a change ∆K in the product translates into a change
of order ∆K/X or ∆K/Y in one of the reserves, the
corresponding upper bound on a trader’s mark-to-market gain
from a rounding-only six-swap cycle is on the order of a
few minimal token units, i.e. well below a basis point of
the pool’s notional value in this regime. Our TLC search in
ToyCLAMM2DirArb with Bx = By = 10 and NMax = 6
should be read as a scaled instance of this argument: each
integer reserve unit can be interpreted as a fixed block of
physical token units, and the absence of rounding-only arbitrage
cycles of length at most six in the finite model is consistent with
the analytic bound that any such cycle would be economically
negligible under these parameters.
VIII. RELATION TO EXISTING FORMAL WORK
Our automata-based approach is complementary to theorem-
proving work in Lean [5] and economic analyses of
CLAMMs [3], [2].
Pusceddu and Bartoletti mechanize the correctness of
constant-product AMMs in Lean [5], proving properties such as
arbitrage behaviour and optimal swaps in a general mathemati-
cal framework. Their model focuses on the v2-style, full-range
constant-product construction. Our model, by contrast, aims
at the piecewise-constant, tick-driven structure of v3, with
explicit state-machine semantics suitable for model checking.
Lemma 1 is a self-contained result in the same spirit as Lean-
level reasoning but tailored to the discretized invariant we feed
into automata-based tools.
Timed automata have already been used extensively for
verifying security and resource properties in other domains [8],
[10]. Our use of PTA to reason about CLAMM fees, gas, and
liquidity costs fits neatly into this tradition. Similarly, TLA+
has been applied to blockchain protocols such as cross-chain
swaps [12] and CBC Casper consensus [13]; a CLAMM TLA+specification can reuse many of the same modeling patterns (e.g.
action decomposition, fairness constraints, ghost variables for
invariants), but now grounded in an explicit, proved arithmetic
bound on the core invariant.
IX. LIMITATIONS AND FUTURE WORK
The models described in this paper remain simplified:
• We bound ticks, reserves, and position counts to achieve
finiteness, whereas real deployments are unbounded
(within gas limits).
• We abstract away EVM-level implementation details,
event ordering, and reentrancy, focusing on the idealized
CLAMM logic.
• Our invariant analysis is currently local to a single tick
and fee-free swaps; extending Lemma 1 to include fees
and multi-tick paths via virtual reserves is a natural next
step.
• We do not yet instantiate a full Q64.96 fixed-point
semantics; doing so would sharpen the rounding bounds
but also enlarge the state space.
Several directions for future work are immediate:
• Instantiate the PTA model in UPPAAL for bounded
parameters and check the k-invariance property with a
concrete ϵ, using Lemma 1 as a sanity check on reported
counterexamples.
• Develop a library of TLA+ modules for CLAMMs,
including parameterized Uniswap v2/v3 specifications,
and mechanically check InvNonNeg and Invk,ϵ for finite
instances.
• Integrate the CLAMM model with cross-chain bridges
or L2 sequencers modeled in TLA+, to study end-to-end
correctness of rollups or bridges that rely on CLAMM-
based price oracles.
• Refine the single-tick model to capture known classes
of rounding exploits (e.g. multi-hop paths that amplify
rounding) and prove, under explicit parameter bounds,
that no such exploit exists up to a given path length.
X. CONCLUSION
We have argued that Uniswap v3-style concentrated-liquidity
AMMs can be effectively modeled as networks of priced
timed automata and finite-state transducers, with positions
as stateful objects whose behaviour is driven by tick crossings.
Within this view, important correctness questions such as cross-
tick invariance, price-state reachability, and rounding-arbitrage
absence, become standard safety and liveness properties for
which mature model-checking tools exist.
To ensure that this perspective is not purely aspirational,
we isolated and proved a concrete lemma about the behaviour
of the constant-product invariant under discretized swaps in
a single-tick model. This lemma provides a mathematically
justified ϵ-slack for invariance properties and demonstrates
how the rounding behaviour can be reasoned about explicitly.
Lifting such local results to full CLAMM specifications in
PTA and TLA+ remains a substantial but, we believe, tractable
research program.
REFERENCES
[1] H. Adams, N. Zinsmeister, M. Salem, R. Keefer, and D. Robinson.
Uniswap v3 Core. Technical report, Uniswap Labs, 2021. https://
uniswap.org/whitepaper-v3.pdf.
[2] Z. Fan, F. Marmolejo-Cossío, D. J. Moroz, M. Neuder, R. Rao, and D. C.
Parkes. Strategic Liquidity Provision in Uniswap v3. In 5th Conference
on Advances in Financial Technologies (AFT 2023), volume 282 of
LIPIcs, pages 25:1–25:22. Schloss Dagstuhl, 2023.
[3] S. Hashemseresht and M. Pourpouneh. Concentrated Liquidity Analysis
in Uniswap V3. In Proceedings of the 2022 ACM CCS Workshop on
Decentralized Finance and Security (DeFi’22), pages 63–70. ACM, 2022.
[4] A. Elsts. Liquidity Math in Uniswap v3. Technical report, 2021. https:
//atiselsts.github.io/pdfs/uniswap-v3-liquidity-math.pdf.
[5] D. Pusceddu and M. Bartoletti. Formalizing Automated Market Makers
in the Lean 4 Theorem Prover. In 5th International Workshop on Formal
Methods for Blockchains (FMBC 2024), volume 118 of OASIcs, pages
5:1–5:13. Schloss Dagstuhl, 2024.
[6] J. Bengtsson and W. Yi. Timed Automata: Semantics, Algorithms and
Tools. In J. Desel, W. Reisig, and G. Rozenberg, editors, Lectures
on Concurrency and Petri Nets, volume 3098 of LNCS, pages 87–124.
Springer, 2004.
[7] R. Alur and D. L. Dill. A Theory of Timed Automata. Theoretical
Computer Science, 126(2):183–235, 1994.
[8] J. Arcile and É. André. Timed Automata as a Formalism for Expressing
Security: A Survey on Theory and Practice. ACM Computing Surveys,
55(6):1–37, 2022.
[9] A. David, P. G. Jensen, K. G. Larsen, A. Legay, D. Lime, M. G. Sørensen,
and J. H. Taankvist. On Time with Minimal Expected Cost! In F. Cassez
and J.-F. Raskin, editors, Automated Technology for Verification and
Analysis (ATVA), volume 8837 of LNCS, pages 129–145. Springer, 2014.
[10] A. David, K. G. Larsen, A. Legay, M. Mikučionis, and D. B. Poulsen.
Uppaal SMC Tutorial. International Journal on Software Tools for
Technology Transfer, 17(4):397–415, 2015.
[11] L. Lamport. Specifying Systems: The TLA+ Language and Tools for
Hardware and Software Engineers. Addison-Wesley, 2002.
[12] Z. Nehaï, F. Bobot, S. Tucci-Piergiovanni, C. Delporte-Gallet, and
H. Fauconnier. A TLA+ Formal Proof of a Cross-Chain Swap. In 23rd
International Conference on Distributed Computing and Networking
(ICDCN 2022), pages 148–159. ACM, 2022.
[13] A. Ouyang. Formal Analysis of the CBC Casper Consensus Algorithm
with TLA+. Trail of Bits Blog, 2019. https://blog.trailofbits.com/2019/
10/25/formal-analysis-of-the-cbc-casper-consensus-algorithm-with-tla/.TABLE I
PARAMETERS AND TLC STATISTICS FOR TLA+ MODELS
Model (Bx,LMax,NMax) ϵ = NMax · Bx Distinct states Depth
ToyCLAMM (10,0,3) 30 855 4
ToyCLAMM2Dir (10,0,3) 30 2542 4
ToyCLAMM2DirArb (10,0,6) 60 10,849 7
ToyCLAMM3Tick (10,5,4) 40 54,756 5