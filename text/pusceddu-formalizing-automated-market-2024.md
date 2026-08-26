---
sha256: bf15d2060e55d9d136f8971970447845066633fe7551891a07277f38eb8a979d
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 41105
---
Formalizing Automated Market Makers in the
Lean 4 Theorem Prover
Daniele Pusceddu #
ETH Zurich, Switzerland
University of Cagliari, Italy
Massimo Bartoletti # Ñ
University of Cagliari, Italy
Abstract
Automated Market Makers (AMMs) are an integral component of the decentralized finance (DeFi)
ecosystem, as they allow users to exchange crypto-assets without the need for trusted authorities
or external price oracles. Although these protocols are based on relatively simple mechanisms, e.g.
to algorithmically determine the exchange rate between crypto-assets, they give rise to complex
economic behaviours. This complexity is witnessed by the proliferation of models that study their
structural and economic properties. Currently, most of theoretical results obtained on these models
are supported by pen-and-paper proofs. This work proposes a formalization of constant-product
AMMs in the Lean 4 Theorem Prover. To demonstrate the utility of our model, we provide
mechanized proofs of key economic properties like arbitrage, that at the best of our knowledge have
only been proved by pen-and-paper before.
2012 ACM Subject Classification Software and its engineering → Formal methods; Software and its
engineering → Formal software verification
Keywords and phrases Smart contracts, Ethereum, Verification, Blockchain
Digital Object Identifier 10.4230/OASIcs...
Funding Massimo Bartoletti: Partially supported by project SERICS (PE00000014) and PRIN 2022
DeLiCE (F53D23009130001) under the MUR National Recovery and Resilience Plan funded by the
European Union – NextGenerationEU.
## 1 Introduction
Automated Market Makers (AMMs) are one of the key applications in the Decentralized
Finance (DeFi) ecosystem, as they allow users to trade crypto-assets without the need for
trusted intermediaries [13]. Unlike traditional order-book exchanges, where buyers and sellers
must find a counterpart, AMMs enable traders to autonomously swap assets deposited in
liquidity pools contributed by other users, who are incentivized to provide liquidity by a
complex reward mechanism. At the time of writing, there are multiple AMM protocols
controlling several billions of dollars worth of assets1
. This has made AMMs an appealing
target for attacks, resulting in losses worth billions of dollars over time2
.
The security of AMMs depends on several factors: besides the absence of traditional
programming bugs, it is crucial that their economic mechanism gives rise to a rational
behaviour of its users that aligns with the AMM ideal functionality, i.e. providing an
algorithmic exchange rate coherent with the one given by trusted price oracles. Therefore, it
is important to obtain strong guarantees about the economic mechanisms of these protocols.
While formal verification tools for smart contracts based on model-checking are useful in
1
https://defillama.com/protocols/Dexes
2
https://chainsec.io/defi-hacks/
© Daniele Pusceddu and Massimo Bartoletti;
licensed under Creative Commons License CC-BY 4.0
OpenAccess Series in Informatics
Schloss Dagstuhl – Leibniz-Zentrum für Informatik, Dagstuhl Publishing, Germany
arXiv:2402.06064v1 [cs.LO] 8 Feb 2024XX:2 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
detecting programming bugs and even in proving some structural properties of AMMs [8, 10],
they are not suitable for verifying, or even expressing more complex properties regarding
the economic mechanism of AMMs. These economic mechanisms have been studied in
several research works, which, in most cases, provide pen-and-paper proofs of the obtained
properties. Given the complexity of the studied models, it would be desirable to also provide
machine-verified proofs, so that we may rely on the proven properties beyond any reasonable
doubt. To the best of our knowledge, existing mechanized formalizations [12] focus on
verifying relevant structural properties of AMMs like their state consistency, and not on
studying the economic mechanism of AMMs (see Section 4 for a detailed comparison).
Contributions
In this paper we formalize Automated Market Makers in the Lean 4 theorem prover. Our
model is based on a slightly simplified version of the Uniswap v2 protocol (one of the leading
AMMs), which was studied in [7] with a pen-and-paper formalization. We provide a Lean
specification of blockchain states, abstracted from any factors that are immaterial to the study
of AMMs. Then, we model the fundamental interactions that users may have with AMMs as
well as the economic notions of price, networth and gain. Finally, we build machine-checked
proofs of economic properties of constant-product AMMs. In particular, we derive an explicit
formula for the economic gain obtained by a user after an exchange with an AMM. Building
upon this formula we prove that, from a trader’s perspective, aligning a constant-product
AMM’s internal exchange rate with the rate given by the trader’s price oracle implies the
optimal gain from that AMM. This results in the fundamental property of AMMs acting as
price oracles themselves [4]. We then construct the optimal swap transaction that a rational
user can perform to maximize their gain, solving the arbitrage problem. Our formalization
and proofs3
are made available in a public GitHub repository. At the best of our knowledge,
this is the first mechanized formalization of the economic mechanism of AMMs. We finally
discuss some open issues, and alternative design choices for formalizing AMMs.
## 2 Formalization
An Automated Market Maker implements a decentralized exchange between two different
token types. The exchange rate is determined by a smart contract, which also takes care of
performing the exchange itself: namely, the contract receives from a trader some amount of
the input token type, and sends back the correct amount of the output token type, which
is taken from the AMM reserves. A single smart contract can control many instances of
AMMs (also called AMM pairs): we may have a pair for each possible unordered pair of
token types. To create an AMM instance, a user must provide the initial liquidity for the
reserves of that pair of tokens. Liquidity providers are rewarded with a type of token that
specifically represents shares in that AMM’s reserves: we call these minted token types, while
any other token type will be called atomic.
Blockchain State
We begin by formalizing the blockchain state, abstracting from the details that are immaterial
to the study of AMMs. Then, our model includes the users’ wallets, the AMMs and their
reserves (see Listing 1). We formalize the universes of users and atomic token types as the
3
https://github.com/danielepusceddu/lean4-ammD. Pusceddu and M. Bartoletti XX:3
types A and T, respectively, as structures that encapsulate a natural number. Hereafter,
we use a,b,... to denote users in A, and τ,τ0,τ1,... to denote tokens in T. Minted token
types are pairs of T. We represent the funds owned by a user by a wallet that maps token
types to non-negative reals. To rule out wallets with infinite tokens, we use Mathlib’s finitely
supported functions4
: in general, given any type α and any type M with a 0 element,
f ∈ α →0 M if supp(f) = {x ∈ α | f (x) ̸= 0} is finite.
We define the type W0 of wallets of atomic tokens as a structure encapsulating T →0 R≥0.
This definition induces an element 0 ∈ W0 such that supp(0) = ∅: this is the empty wallet,
which enables us to form the type T →0 W0. We define the type W1 of wallets of minted tokens
as a structure that encapsulates a function bal ∈ T →0 W0. The intuition is that bal τ0 τ1
gives the owned amount of the minted token type created by the AMM pair with tokens τ0
and τ1. Consistently, the function bal must satisfy two conditions: bal τ0 τ1 = bal τ1 τ0,
meaning that the order of atomic tokens is irrelevant, and bal τ τ = 0, meaning that the
two token types in an AMM must be distinct. Our definition of W1 encapsulates proofs of
these two properties, called unord and distinct, respectively.
We map users to their wallets with the types S0 and S1, which account for the atomic
tokens and for the minted tokens, respectively. Finally, we formalize sets of AMM pairs
with the type AMMs. The definition is strikingly similar to that of W1, but with a changed
constraint. The intuition is that res τ0 τ1 gives the reserves of τ0 in the AMM pair (τ0, τ1),
while res τ1 τ0 gives the reserves of τ1 in the same AMM pair. For uninitialized AMM pairs,
the obtained reserves must be 0. The property posres ensures that either an AMM pair
has no reserves of both token types (i.e., the AMM has not been created yet), or both token
types have strictly positive reserves (i.e., one cannot deplete the reserves of a single token
type in an AMM pair). We combine the previous definitions in the type Γ, which represents
the state of a blockchain (note that Γ abstracts from all the details immaterial for AMMs).
Token supply
Given a blockchain state s ∈ Γ, we define the supply of an atomic token type τ0 as:
atomsupplys (τ0) =
X
a∈supp(s.atoms)
(s.atoms a) τ0 +
X
τ1∈supp(s.ammsτ0)
(s.amms τ0) τ1
where the partial application s.amms τ0 gives a map with all AMM pairs with τ0 as one of
their token types. We define the supply of a minted token type (τ0,τ1) as follows:
mintsupplys (τ0,τ1) =
X
a∈supp(s.mints)
(s.mints a) τ0 τ1
The corresponding Lean definitions (in Listing 2) have been split in order to facilitate
theorem proving and, in particular, the use of Lean’s simplifier.
AMM reserves
Given a blockchain state s and two token types τ0, τ1, the terms s.amms τ0 τ1 and s.amms τ1 τ0
denote, respectively, the reserves of τ0 and τ1 in the AMM pair (τ0,τ1). This way of accessing
the AMM reserves is a bit impractical: when writing proofs, using s.amms τ0 τ1 carries an
obligation to provide the functions distinct and posres. In particular, this requires the
4
https://leanprover-community.github.io/mathlib4_docs/Mathlib/Data/Finsupp/Defs.htmlXX:4 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
Listing 1 Fundamental Lean definitions for the state of an AMM system.
structure A where
n: N
structure T where
n: N
structure W0 where
bal: T →0 R≥0
structure S0 where
map: A →0 W0
structure W1 where
bal: T →0 W0
unord: ∀ (τ0 τ1: T),
bal τ0 τ1 = f τ1 τ0
distinct: ∀ (τ: T),
bal τ τ = 0
structure S1 where
map: A →0 W1
structure AMMs where
res: T →0 W0
distinct: ∀ (τ: T),
res τ τ = 0
posres: ∀ (τ0 τ1: T),
res τ0 τ1 ̸= 0 ↔ f τ1 τ0 ̸= 0
structure Γ where
atoms: S0
mints: S1
amms: AMMs
Listing 2 Supply of atomic token types and of minted token types.
1 noncomputable def S0.supply (s: S0) (τ: T): R≥0 := s.map.sum (λ _ w => w τ)
2
3 noncomputable def S1.supply (s: S1) (τ0 τ1: T): R≥0 :=
4 s.map.sum (λ _ w => w.get τ0 τ1)
5
6 noncomputable def AMMs.supply (amms: AMMs) (τ: T): R≥0 :=
7 (amms.res τ).sum λ _ x => x
8
9 noncomputable def Γ.atomsupply (s: Γ) (τ: T): R≥0 :=
10 (s.atoms.supply τ) + (s.amms.supply τ)
11
12 noncomputable def Γ.mintsupply (s: Γ) (τ0 τ1: T): R≥0 := s.mints.supply τ0 τ1
user to explicitly add, in any theorem using the reserves, the assumption that the reserves
are strictly positive to indicate the AMM pair has been created. Furthermore, this way of
accessing the reserves hides the fact that when one of the reserves is strictly positive, also
the other one is such, which again should be made explicit when writing proofs.
To cope with these issues, we build a Lean API that allows for hiding these implementation
details (see Listing 3). For example, given an AMM pair (τ0,τ1) in a state s, the expression
s.amms.r0 τ0 τ1 init give the reserves of token τ0 in the AMM, which are guaranteed to be
strictly positive under the initialization precondition init ∈ (s.amms.init).
Transactions
Our model encompasses all the main types of transactions supported by AMMs: creating an
AMM, adding/removing liquidity, and swapping a token for another. Swaps are parameterised
by a swap rate function, which determines the exchange rate. We use the formalization of
swap transactions (Listing 4) to exemplify the scheme we used for all the transaction types.
The type Swap(sx,s,a,τ0,τ1,x) represents valid swap transactions in a blockchain state
s, with the swap rate function sx, performed by user a to exchange x amount of the input
token τ0 for a certain amount of the output token τ1 (Line 2). Each element of this type
is a structure containing a proof of the validity of the transaction. For example, for swap
transactions we must prove that the user has enough amount of τ0 (condition enough), thatD. Pusceddu and M. Bartoletti XX:5
Listing 3 Fragment of the AMM API: AMM reserves.
1 def AMMs.init (amms: AMMs) (τ0 τ1: T): Prop := amms.res τ0 τ1 ̸= 0
2
3 def AMMs.r0 (amms: AMMs) (τ0 τ1: T) (h: amms.init τ0 τ1): R>0 := ⟨ amms.res τ0 τ1,
4 by unfold init at h; exact NNReal.neq_zero_imp_gt h ⟩
5
6 def AMMs.r1 (amms: AMMs) (τ0 τ1: T) (h: amms.init τ0 τ1): R>0 := ⟨ amms.res τ1 τ0,
7 by unfold init at h; exact NNReal.neq_zero_imp_gt ((amms.posres τ0 τ1).mp h) ⟩
the AMM pair with tokens τ0 and τ1 exists (condition exi), and it has enough reserves
of τ1 to give as output (condition nodrain). Since the type Swap(···) is empty when the
parameters do not satisfy the above conditions, invalid transactions are not really expressible
in our model. Instead, if Swap(···) represents a valid transaction, it will be a singleton type
due to proof irrelevance (i.e., any two proofs of the same proposition are equal).
Each transaction is equipped with an apply function that yields the state reached by
executing the transaction in the given state. For example, for sw ∈ Swap(sx,s,a,τ0,τ1,x),
apply sw yields a state where: (i) a’s atomic tokens wallet is updated by removing x units
of τ0 and adding sw.y units of τ1 (Line 12), where sw.y is the amount of tokens outputted
by the AMM pair; (ii) accordingly, the AMM reserves are updated by removing sw.y units of
τ1 and adding x units of τ0 (Line 14); (iii) the minted token wallets is unchanged (Line 13).
These definitions use functions and proofs not included in Listing 4 for brevity, such as sub
and sub_r1. These are designed with the same spirit of allowing only valid operations, and
so require suitable proofs. For example, sub_r1 requires a proof of the existence of the AMM
we are removing liquidity from, and a proof that the AMM pair has enough liquidity to
retain a positive amount of reserves. We build these proofs inline using those contained in
the structure: for instance, the parameter sw.exi passed to sub_r1 at line 11 is a proof that
the AMM pair exists. Then, at line 16 we define the constant-product swap rate function,
that is the swap rate function used by Uniswap v2. From Lemma 5 onwards, our results will
focus on AMMs using this swap rate function.
Price, networth and Gain
An important aim of our model is to state and prove economic properties of AMMs related
to the networth of their users. The fundamental definitions are in Listing 5. Given a wallet
w ∈ W0 and an atomic token price oracle o ∈ T → R>0, we define the value of w in Line 2 as:
value(w,o) =
X
τ∈supp(w)
w(τ) · o(τ)
The value of a wallet of minted tokens w ∈ W1 is defined similarly, except that: (i) the
summation ranges over supp(w.u), with w.u ∈ T2
→0 R≥0 representing the uncurrying of w;
(ii) the summation is divided by 2 since, if (τ0,τ1) is in the support of w, then also (τ1,τ0) is
in its support. For uniformity with the definition of value of atomic wallets, also here we
assume an oracle that gives the price of (minted) tokens. However, while for pricing atomic
tokens we indeed resort to an oracle, for minted tokens this oracle is instantiated to a specific
function, coherently with [7]:
mintedprices(o,τ0,τ1) =
(s.amms.r0 τ0 τ1) · o(τ0) + (s.amms.r1 τ0 τ1) · o(τ1)
mintsupplys(τ0,τ1)XX:6 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
Listing 4 Definition of the swap transaction type and of its application, as well as the constant-
product swap rate function.
1 abbrev SX := R>0 → R>0 → R>0 → R>0
2 structure Swap (sx: SX) (s: Γ) (a: A) (τ0 τ1: T) (x: R>0) where
3 enough: x ≤ s.atoms.get a τ0 -- user a has at least x τ0
4 exi: s.amms.init τ0 τ1 -- AMM pair τ0 τ1 exists in s
5 nodrain: x*(sx x (s.amms.r0 τ0 τ1 exi) (s.amms.r1 τ0 τ1 exi))
6 < (s.amms.r1 τ0 τ1 exi) -- AMM has enough output tokens
7
8 def Swap.y (sw: Swap sx s a τ0 τ1 x): R>0 :=
9 x*(sx x (s.amms.r0 τ0 τ1 sw.exi) (s.amms.r1 τ0 τ1 sw.exi))
10
11 noncomputable def Swap.apply (sw: Swap sx s a τ0 τ1 x): Γ := {
12 atoms := (s.atoms.sub a τ0 x sw.enough).add a τ1 sw.y,
13 mints := s.mints,
14 amms := (s.amms.sub_r1 τ0 τ1 sw.exi sw.y sw.nodrain).add_r0 τ0 τ1 (by
simp[sw.exi]) x }
15
16 noncomputable def SX.constprod: SX := λ (x r0 r1: R+) => r1/(r0 + x)
where we have omitted the initialization precondition h for brevity.
We then define the networth of a user as the sum of the value of their two types of wallets
(Line 12). The gain of a user upon an update of the blockchain state is the difference between
the networth in the new state and that in the old state (Line 16).
Reachable states
To formalize reachable states, we begin by defining sequences of transactions (Listing 6).
Tx(sx,s,s′
) is the type of sequences of valid transactions (of any kind) starting from state s
and leading to s′
. The parameter sx is the swap rate function used in swap transactions.
Technically, Tx(sx,s,s′
) is an instance of the indexed family of dependent types Tx, dependent
on sx and s, and indexed by s′
. In practice, this means that the constructors must preserve
the values of sx and s (building upon the sequence of transactions does not change the
swap rate function being used nor the originating state), while s′
may change after each
construction (the state resulting from the sequence changes with each transaction that is
added to it). A state s′
is reachable if there exists a valid sequence of transactions that
reaches s′
starting from a valid initial state s, i.e. a state with no initialized AMMs or minted
token types in circulation.
## 3 Results
We now present some noteworthy properties of AMMs that we have proven in Lean.
Proposition 1 ensures that, in any reachable state, there exists an AMM with token types
τ0 and τ1 if and only if the minted token type (τ0,τ1) is in circulation, i.e. it has a strictly
positive supply. This result showcases the validity of our model with regards to reasoning
about reachable states. Technically, it also allows us to prove that mintedprices(o,τ0,τ1) is
strictly positive for any initialized AMM pair (τ0,τ1) in any reachable state s.D. Pusceddu and M. Bartoletti XX:7
Listing 5 Users’ networth and gain.
1 noncomputable def W0.value (w: W0) (o: T → R>0): R≥0 :=
2 w.sum (λ τ x => x*(o τ))
3
4 noncomputable def W1.value (w: W1) (o: T → T → R≥0): R≥0 :=
5 (w.u.sum (λ p x => x*(o p.fst p.snd))) / 2
6
7 noncomputable def Γ.mintedprice (s: Γ) (o: T → R>0) (τ0 τ1: T): R≥0 :=
8 if h:s.amms.init τ0 τ1 then
9 ((s.amms.r0 τ0 τ1 h)*(o τ0)+(s.amms.r1 τ0 τ1 h)*(o τ1)) / (s.mints.supply τ0 τ1)
10 else 0 -- price is zero if AMM is not initialized
11
12 noncomputable def Γ.networth (s: Γ) (a: A) (o: T → R>0): R≥0 :=
13 (W0.value (s.atoms.get a) o) + (W1.value (s.mints.get a) (s.mintedprice o))
14
15 noncomputable def A.gain (a: A) (o: T → R>0) (s s’: Γ): R :=
16 ((s’.networth a o): R) - ((s.networth a o): R)
Listing 6 Sequences of transactions and reachable states.
1 inductive Tx (sx: SX) (init: Γ): Γ → Type where
2 | empty: Tx sx init init
3
4 | swap (s’: Γ) (rs: Tx sx init s’)
5 (sw: Swap sx s’ a τ0 τ1 v0):
## 6 Tx sx init sw.apply
7 -- Other constructors omitted for brevity
8
9 def validInit (s: Γ): Prop :=
10 (s.amms = AMMs.empty ∧ s.mints = S1.empty)
11
12 def reachable (sx: SX) (s: Γ): Prop :=
13 ∃ (init: Γ) (tx: Tx sx init s), validInit init
▶ Proposition 1 (Existence of AMMs vs. minted token supply). Let s′
∈ Γ be a reachable
blockchain state. Then, for any minted token type (τ0,τ1), its supply in s′
is strictly positive
if and only if s′
has an AMM with token types τ0 and τ1.
Proof. By induction on the length of the sequence of transactions leading to s′
:
Base case: empty transaction sequence. The proof is trivial for both directions, since a
valid starting state has no initialized AMMs and no minted tokens in circulation.
Inductive case: there are several subcases depending on the last transaction fired in the
sequence. Here we consider the creation of the AMM (τ′
0,τ′
1) in reachable state s′
. We
proceed by cases on the truth of the equality {τ0,τ1} = {τ′
0,τ′
1}. If it is a different token
pair, then the supply remains unchanged along with the initialization status, and we
can conclude by the induction hypothesis. If it is the same token pair, then we just
incremented its minted token supply (which is non-negative, so after incrementing it, it
must be strictly positive), and we just initialized the AMM.
See source code for the other cases. AMMLib/Transaction/Trace.lean:275 ◀XX:8 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
Lemma 2 allows us to determine the change in the value of a wallet after it has been
updated in some way: the resulting equality is the basis for all the subsequent proofs. To
illustrate it, we briefly introduce two definitions that have been omitted before: drain0(w0,τ0)
is the atomic token wallet such that drain0(w0,τ0)(τ0) = 0 and drain0(w0,τ0)(τ1) = w0(τ1)
for every other token τ1 ̸= τ0. We define drain1(w1,(τ0,τ0)) ∈ W1 similarly.
▶ Lemma 2 (Value expansion). Let w0 ∈ W0, o0 ∈ T → R>0, and τ0,τ1 ∈ T. Then,
value(w0,o0) = w0(τ0) · o(τ0) + value(drain0(w0,τ0),o0)
and, with w1 ∈ W1 and o1 ∈ T2
→ R>0 such that o1(τ0,τ1) = o1(τ1,τ0),
value(w1,o1) = w1(τ0,τ1) · o1(τ0,τ1) + value(drain1(w1,τ0,τ1),o1)
Proof. By definition of value and by properties of the sum over a finite support. Full Lean
proof at AMMLib/State/AtomicWall.lean:116 ◀
Lemma 3 gives an explicit formula for the gain obtained by a user upon firing a swap
transaction. It is fundamental to all proofs involving gain.
▶ Lemma 3 (Gain of a swap). Let sw ∈ Swap(sx,s,a,τ0,τ1,x) and let o ∈ T → R>0. Then,
gain(a,o,s,apply sw) = (sw.y · o(τ1) − x · o(τ0)) ·

1 −
(s.mints a τ0 τ1)
mintsupplys (τ0,τ1)

Proof. By repeated application of Lemma 2 in order to isolate the value contributed by
the token types involved in the swap, and by use of Mathlib’s ring_nf simplifier tactic.
AMMLib/Transaction/Swap/Networth.lean:55 ◀
Lemma 4 establishes a correspondence between the profitability of a swap transaction
(i.e., a positive or negative gain) and the order between the swap rate and the exchange rate
given by the price oracle. In particular, assuming a trader a who is not a liquidity provider
(i.e., a has no minted tokens for the AMM pair targeted by the swap), Lemma 4 states that:
gain(a,o,s,apply sw) < 0 ⇐⇒ sx(x,r0,r1) < o(τ0)/o(τ1)
gain(a,o,s,apply sw) = 0 ⇐⇒ sx(x,r0,r1) = o(τ0)/o(τ1)
gain(a,o,s,apply sw) > 0 ⇐⇒ sx(x,r0,r1) > o(τ0)/o(τ1)
Technically, to formalize this result it is convenient to use Mathlib’s cmp5
, which gives the
order between the two parameters.
▶ Lemma 4 (Swap rate vs. exchange rate). Let sw ∈ Swap(sx,s,a,τ0,τ1,x) be a swap
transaction, and let o ∈ T → R>0 be a price oracle. For i ∈ {0,1}, let ri = s.amms.ri (τ0,τ1).
If s.mints(a)(τ0,τ1) = 0, then
cmp(gain(a,o,s,apply sw),0) = cmp

sx(x,r0,r1),
o(τ0)
o(τ1)

Proof. By algebraic manipulation and application of Lemma 3. AMMLib/Transaction/Swap/Net-
worth.lean:86 ◀
5
https://leanprover-community.github.io/mathlib4_docs/Mathlib/Init/Data/Ordering/Basic.
html#cmpD. Pusceddu and M. Bartoletti XX:9
Lemma 5 establishes that, in a constant-product AMM, there exists only one profitable
direction for a swap. Namely, if swapping τ0 for τ1 gives a positive gain, then swapping in
the other direction (i.e., τ1 for τ0) will give a negative gain. Note that the inverse does not
hold: a negative gain in a direction does not imply a positive gain in the other direction.
▶ Lemma 5 (Unique direction for swap gain). Let sw ∈ Swap(constprod,s,a,τ0,τ1,x) and
sw′
∈ Swap(constprod,s,a,τ1,τ0,x′
) be two swap transactions in opposite directions, and
let o ∈ T → R>0. If gain(a,o,s,apply sw) > 0, then gain(a,o,s,apply sw) < 0.
Proof. By Lemma 4. AMMLib/Transaction/Swap/Constprod.lean:160 ◀
▶ Example 6. Consider a blockchain state s and atomic tokens τ0 and τ1, and assume
that: (i) a is a trader with no minted tokens, i.e. (s.mints a) τ0 τ1 = 0; (ii) the AMM
pair for (τ0,τ1) has been initialized in s and has reserves r0 = (s.amms τ0 τ1) = 18 and
r1 = (s.amms τ1 τ0) = 6; (iii) all the AMMs in s use the constant-product swap rate function;
(iv) o is a price oracle such that o τ0 = 3 and o τ1 = 4. Assume that a wants to sell 6 units of
τ1 for some units of τ0 with the swap transaction sw ∈ Swap(constprod,s,a,τ1,τ0,6). Then,
by Lemma 3, a’s gain is given by 9 · 3 − 24 = 3 > 0. Coherently with Lemma 5, any swap in
the opposite direction would give a negative gain: e.g., if a sells 6 units of τ0, her gain would
be 3/2 · 4 − 18 = −12.
We say that a swap transaction sw ∈ Swap(constprod,s,a,τ0,τ1,x) is optimal for a
given price oracle o when, for all sw′
∈ Swap(constprod,s,a,τ0,τ1,x′
) with x′
̸= x we have
gain(a,o,s,apply sw′
) < gain(a,o,s,apply sw)
Theorem 7 gives a sufficient condition for the optimality of swaps in constant-product
AMMs: it suffices that the ratio of the AMM’s reserves after the swap is equal to the
exchange rate given by the price oracle. Intuitively, the condition in Theorem 7 means that
the exchange rate between the two token types induced by the AMM (i.e., the ration between
the token reserves) is aligned with the exchange rate given by the price oracle, and so further
swaps would yield a negative gain. Note that, by definition, if a swap is optimal then it is
also unique, i.e. swapping any other amount would yield a suboptimal gain.
▶ Theorem 7 (Sufficient condition for optimal swaps). Let sw ∈ Swap(constprod,s,a,τ0,τ1,x)
be a swap transaction on a constant-product AMM, and let o ∈ T → R>0 be a price oracle.
For i ∈ {0,1}, let r′
i = (apply sw).amms.ri (τ0,τ1) be the AMM reserves after the swap. If
r′
1/r′
0 = o(τ0)/o(τ1), then sw is optimal.
Proof. By cases on x < x′
and by application of Lemma 4. AMMLib/Transaction/Swap/-
Constprod.lean:184 ◀
▶ Example 8. Under the assumptions of Example 8, the exchange rate between τ1 and τ0
given by the price oracle is (o τ0)/(o τ1) = 3/4, while the exchange rate induced by the
AMM (i.e., the ratio between the reserves) is r1/r0 = 1/3. Hence, to satisfy the equality
in Theorem 7 we must perform a swap that increases r1 and decreases r0, i.e. a must sell
units of τ1 to buy units of τ0, coherently with the necessary condition for a positive gain
in Example 8. Theorem 9 below will establish exactly how many units of τ1 must be traded.
Theorem 9 gives an explicit formula for the input amount x that yields an optimal swap
transaction for a given AMM pair, under the assumption that the user firing the transaction
does not hold the AMM’s minted token type. The other implicit assumption is that the userXX:10 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
a firing the swap has the needed amount x of units of the sold token, i.e. x ≤ (s.atoms a) τ1.
In practice, this assumption can always be satisfied with flash loans, which allow a to borrow
the amount x, perform the swap, and then return the loan in a single, atomic transaction.
▶ Theorem 9 (Arbitrage for constant-product AMMs). Let sw ∈ Swap(constprod,s,a,τ0,τ1,x)
be a swap transaction on a constant-product AMM, and let o ∈ T → R>0 be a price oracle.
For i ∈ {0,1}, let ri = s.amms.ri (τ0,τ1) be the AMM reserves. If a has no minted tokens
(i.e., s.mints(a)(τ0,τ1) = 0) then sw is optimal if the amount of traded units of τ0 is:
x =
s
o(τ1) · r0 · r1
o(τ0)
− r0
Proof. By algebraic manipulation and Theorem 7. AMMLib/Transaction/Swap/Const-
prod.lean:316 ◀
▶ Example 10. Under the assumptions of Example 8, we know that to perform a profitable
swap the trader must sell units of τ1, i.e. fire a transaction Swap(constprod,s,a,τ1,τ0,x).
Theorem 9 gives the optimal input value x, i.e., the number of sold units of τ1:
x =
r
3 · 6 · 18
4
− 6 = 3
Then, the output amount is given by sw.y = 3·18/(6+3) = 6 and, by Lemma 3, the gain of a
is 6·3−3·4 = 6, which maximizes it. Note that, in the new state, the exchange rate given by
the AMM coincides with that given by the price oracle: (r1 + x)(r0 − sw.y) = (o τ0)/(o τ1).
## 4 Related work
The closest work to ours is [12], which proposes a methodology for developing and verifying
AMMs in the Coq proof assistant. In this approach, an AMM is decomposed into multiple
interacting smart contract: e.g., each minted token is modelled as a single smart contract,
following way fungible tokens are encoded in blockchains platforms that do not provide
custom tokens natively, as e.g. in Ethereum and Tezos. These smart contracts are then
implemented as Coq functions on top of ConCert [6], a generic model of blockchain platforms
and smart contracts mechanized in Coq. Concert is used to verify behavioural properties
of smart contracts, either in isolation or composed with other smart contracts: this is
fundamental for [12], where AMMs are specified as compositions of multiple contracts.
More specifically, [12] applies the proposed methodology to the Dexter2 protocol, which
implements a constant-product AMM based on Uniswap v1 on the Tezos blockchain6
. The
main properties of AMMs proved in [12] are correspondences between the state of AMMs
and the sequences of transactions executed on the blockchain. In particular, they prove that:
the balance recorded in the main AMM contract is coherent with the actual balance
resulting from the execution of the sequence of transactions;
the supply of the minted token recorded in the main AMM contract is equal to the actual
supply resulting from the execution;
the state of the minted token contract is coherent with the execution.
6
https://gitlab.com/dexter2tz/dexter2tz/-/tree/master/D. Pusceddu and M. Bartoletti XX:11
Furthermore, starting from the Coq specification of the Dexter2 AMM, [12] extracts verified
CamlLigo code, which is directly deployable on the Tezos blockchain.
Although both our work and [12] involve AMM formalizations within a proof assistant,
the ultimate goals are quite different. The formalization in [12] closely follows the concrete
implementation of a particular AMM instance (Dexter2) and produces a deployable imple-
mentation that is provably coherent with the proposed Coq specification. By contrast, we
start from a more abstract specification of AMM, with the goal of studying the properties
that must be satisfied by any implementation coherent with the specification. An advantage
of our approach over [12] is that it provides a suitable level of abstraction where proving
properties about the economic mechanisms of AMMs, i.e. properties about the gain of users
and of equilibria among users’ strategies. In particular, Theorem 9 establishes a paradigmatic
property of AMMs, which explains the economic mechanism underlying their design.
Besides these main differences, our AMM model and that in [12] have several differences.
A notable difference is that our model is based on Uniswap v2, while [12] is based on Uniswap
v1. In particular, this means that our AMMs can handle arbitrary token pairs, while in
Dexter2 any AMM pairs a token with the blockchain native crypto-currency.
At the best of our knowledge, [12] and ours are currently the only mechanized formaliza-
tions of AMMs in a proof assistant. Many other works study economic properties of AMMs
that go beyond those proved in this paper. The works [5] and [4] study, respectively, an
AMM model based on Uniswap similar to ours, and a generalization of the model where the
AMM is parameterised over a trading function of the AMM reserves, which must remain
constant before and after any swap transactions (in Uniswap v1 and v2, the trading function
is just the product between the AMM reserves). The work [7] studies another generalization
of Uniswap v2, where the relation between input and output tokens of swap transactions
is determined by an arbitrary swap rate function, studying the properties of this function
that give rise to a sound economic mechanism of AMMs. While both [4] and [7] share
the common goal of providing general models of AMMs wherein to study their economic
behaviour, they largely diverge on the formalization: [4] is based on concepts related to
convex optimization problems, while [7] borrows formalization and reasoning techniques from
concurrency theory. The Lean 4 model proposed in this paper follows the formalization in [7],
which has the advantage of requiring far less mathematical dependencies: although Mathlib
is equipped to reason about convex sets and functions7
, it is currently lacking in advanced
convex optimization definitions and results as those used in [4].
Our AMM model is based on Uniswap v2, one of the most successful AMMs so far. We
briefly discuss some alternative AMM constructions. Balancer [2] generalizes the constant-
product function used by Uniswap to a constant (weighted geometric) mean f(r1,··· ,rn) =
Qn
i=1 rwi
i , where the weight wi reflects the relevance of a token τi in a tuple (τ1,··· ,τn).
Curve [9] mixes constant-sum and constant-product functions, aiming at a swap rate with
small fluctuations for large amounts of swapped tokens. The work [11] studies a variant
of the constant-product swap rate invariant, where the rate adjusts dynamically based on
oracle prices, with the goal of reducing the need for arbitrage transactions. Other approaches
aiming at the same goal are studies in [1, 11], and implemented in [3]. Extending our Lean
formalization and results to these alternative AMM designs would require a substantial
reworking of our model and proofs.
7
https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Convex/FunctionXX:12 Formalizing Automated Market Makers in the Lean 4 Theorem Prover
## 5 Conclusions
In this work we have provided a formalization of AMMs in Lean. Blockchain states are
represented as structures containing wallets and AMMs, and transactions as dependent types
equipped with a function that defines the state resulting from firing the transaction. Based
on this, we have modeled the key economic notions of price, networth and gain. We have
then focused on the economic properties of AMMs, constructing machine-checkable proofs.
In Lemma 3 we have given an explicit formula for the economic gain of a user after firing a
swap transaction. In Theorem 7 we have proved that the rational strategy for traders leads
to the alignment between the AMM internal exchange rate and that given by price oracles.
Finally, in Theorem 9 we have derived the amount of tokens that a trader should sell to
maximize the gain from a constant-product AMM.
Design choices
Before coming up with our Lean formalization, we have experimented with a few alternative
definitions. Currently, we use the two pairs of atomic token types (τ0,τ1) and (τ1,τ0) to
represent the same minted token type. Initially, we used the type M of sets of atomic tokens
of cardinality 2, and modeled wallets of minted tokens by the type M →0 R≥0. However,
using M in the definition of AMMs turned out not to be as easy. The type M →0 R2
≥0 would
obviously not work since we would not know which value corresponds to the reserve of which
token. On the other hand, the dependent type (m : M) →0 Option(m → R>0) would work
after defining 0 := None, at the cost of losing the straightforward definition for supply of
atomic tokens. We have opted for the custom subtype R>0 to represent the positive reals,
since they simplify writing certain definitions and proof passages (e.g., avoiding the use of
garbage outputs in the definitions where negative inputs would not make sense). This choice
however turned out to have some cons, since it makes using Mathlib more complex, and in
some cases we have to coerce back to the reals anyway (e.g. when reasoning about the gain).
Using Mathlib’s reals would perhaps lead to a smoother treatment.
Limitations
Compared to real-world AMM implementations, our Lean formalization introduces a few
simplifications, that overall contribute to keeping our proofs manageable. Bridging the gap
with real AMMs would require several extensions, which we discuss below as directions for
future work. AMMs typically implement a trading fee ϕ ∈ [0,1] that represents the portion
of the swap amount kept by the AMM. While modeling the fee would be easy (ϕ would be an
additional parameter to SX functions, to Swap types, and to transactions Tx), it would require
a major reworking of all the results that deal with swaps. Our swaps have zero-slippage, in
that either a swap gives exactly the amount of tokens required by a user, or they are aborted.
While on the one hand this is desirable (e.g., it rules out sandwich attacks), on the other
hand it has drawbacks related to liveness, since a user may need to repeatedly send swap
transactions until one is accepted. Real-world AMM implementations allow users to specify
a slippage tolerance in the form of the minimum amount of tokens they expect from a swap.
Extending our model to encompass slippage tolerance would require to add a parameter to
each transaction type, and a minor reworking of the results. Some AMM implementations
allow users to create AMMs pairs involving minted token types. Consequently, the tokens
minted by these AMMs in general are “nestings” of token types. Extending our model in this
direction would require to replace price oracles in our results with a suitable price function.D. Pusceddu and M. Bartoletti XX:13
References
## 1 Improving frontrunning resistance of x*y=k market makers, 2018. https://ethresear.ch/t/
improving-front-running-resistance-of-x-y-k-market-makers/1281.
## 2 Balancer whitepaper, 2019. https://balancer.finance/whitepaper/.
## 3 Mooniswap whitepaper, 2020. https://mooniswap.exchange/docs/
MooniswapWhitePaper-v1.0.pdf.
## 4 Guillermo Angeris and Tarun Chitra. Improved price oracles: Constant function market
makers. In ACM Conference on Advances in Financial Technologies (AFT), pages 80–91.
ACM, 2020. https://arxiv.org/abs/2003.10001. doi:10.1145/3419614.3423251.
## 5 Guillermo Angeris, Hsien-Tang Kao, Rei Chiang, Charlie Noyes, and Tarun Chitra. An analysis
of Uniswap markets. Cryptoeconomic Systems, 1(1), 2021. doi:10.21428/58320208.c9738e64.
## 6 Danil Annenkov, Jakob Botsch Nielsen, and Bas Spitters. Concert: a smart contract certifica-
tion framework in Coq. In ACM SIGPLAN International Conference on Certified Programs
and Proofs (CPP), pages 215–228. ACM, 2020. doi:10.1145/3372885.3373829.
## 7 Massimo Bartoletti, James Hsin yu Chiang, and Alberto Lluch-Lafuente. A theory of automated
market makers in DeFi. Logical Methods in Computer Science, Volume 18, Issue 4, dec 2022.
URL: https://doi.org/10.46298%2Flmcs-18%284%3A12%292022, doi:10.46298/lmcs-18(4:
12)2022.
## 8 Certora. Formal verification of Compound’s open-oracle with Uniswap anchor. https://files.
safe.de.fi/safe/files/audit/pdf/CompoundUniswapAnchoredOpenOracleAug2020.pdf,
2020.
## 9 Michael Egorov. Stableswap - efficient mechanism for stablecoin, 2019. https://curve.fi/
files/stableswap-paper.pdf.
## 10 Uri Kirstein. Detecting corner cases in Compound V3
with formal specifications. https://medium.com/certora/
detecting-corner-cases-in-compound-v3-with-formal-specifications-b7abf137fb15,
2022.
## 11 Bhaskar Krishnamachari, Qi Feng, and Eugenio Grippo. Dynamic curves for decentralized
autonomous cryptocurrency exchanges. In International Symposium on Foundations and
Applications of Blockchain (FAB), volume 92 of OASIcs, pages 5:1–5:14. Schloss Dagstuhl -
Leibniz-Zentrum für Informatik, 2021. doi:10.4230/OASIcs.FAB.2021.5.
## 12 Eske Hoy Nielsen, Danil Annenkov, and Bas Spitters. Formalising decentralised exchanges in
Coq. In ACM SIGPLAN International Conference on Certified Programs and Proofs (CPP),
pages 290–302. ACM, 2023. doi:10.1145/3573105.3575685.
## 13 Jiahua Xu, Krzysztof Paruch, Simon Cousaert, and Yebo Feng. Sok: Decentralized exchanges
(DEX) with automated market maker (AMM) protocols. ACM Comput. Surv., 55(11):238:1–
238:50, 2023. doi:10.1145/3570639.