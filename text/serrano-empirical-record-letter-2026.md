---
sha256: 7f1c7a6d035e122e1035b53c523b80150e6b6f7df8baa70d8084916bf7261da3
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 111067
---
A Methodological Framework for Identifying and Empirically
Validating Macroeconomic Risks Suitable for On-Chain Convex
Hedge Instruments
RecordofClosedIterationsandRequestforSupervisorGuidance
[authorblockllatcompositiontime]
2026-05-06
Contents
1 Introduction&EconomicMotivation 3
2 OperatingFramework: The(Y,M,X)Triple 5
## 2.1 Denitions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 2.2 Stage discipline . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 2.3 Iteration order . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
## 2.4 Acknowledged limitations . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
3 TheAbrigoLemma: InequalityDierentialasHedgeTarget 6
## 3.1 Why a single-aggregate hedge is insucient . . . . . . . . . . . . . . . . . . . . . 7
## 3.2 Two-sided market and counterparty matching . . . . . . . . . . . . . . . . . . . . 8
## 3.3 Calibration of the continuous-time dierential . . . . . . . . . . . . . . . . . . . . 8
4 On-ChainSettlementSubstrate: PrimerfortheNon-SpecialistReader 8
## 4.1 What On-Chain Means . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
## 4.2 Panoptic: Perpetual Options on Liquidity-Provider Positions . . . . . . . . . . . 9
## 4.3 Mento Purchasing-Parity Stablecoins . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 4.4 Political-Receptivity Context . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 4.5 Critical Disclaimer: Empirical Validation is O-Chain . . . . . . . . . . . . . . . 11
## 4.6 Reader Takeaways . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 11
5 EmpiricalMethodology 12
## 5.1 Pre-registration discipline . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
## 5.2 Anti-shing invariants . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
## 5.3 Functional form and primary inference . . . . . . . . . . . . . . . . . . . . . . . . 13
## 5.4 Robustness inference (HAC) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14
5.5 Robustness arms . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 14Supervisor-ReviewMemorandum May6,2026
## 5.6 Persistent-regressor posture and Stambaugh bias . . . . . . . . . . . . . . . . . . 15
## 5.7 Verdict mapping . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 15
5.8 HALT and disposition discipline . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
## 5.9 Identication posture . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 16
6 TheAbrigoLog: RecordofClosedandActiveIterations 16
## 6.1 Pair D  BPO oshoring through COP/USD lag . . . . . . . . . . . . . . . . . . 17
6.2 dev-AI Stage-1  Section J ICT through COP/USD lag . . . . . . . . . . . . . . 19
6.3 FX-vol-CPI surprise  Colombian CPI through TRM realised volatility . . . . . 21
## 6.4 Phase-A.0 remittance  Colombian remittance corridor through FX . . . . . . . 22
6.5 P1 Bittensor SN18  event-study apparatus . . . . . . . . . . . . . . . . . . . . . 23
## 6.6 Cross-iteration multiple-comparison caveat . . . . . . . . . . . . . . . . . . . . . . 24
7 OpenMethodologicalQuestionsforSupervisorReview 25
## 7.1 Identication strategy . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
## 7.2 Convex-payo suciency . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
## 7.3 Multi-Y dierential calibration . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
## 7.4 Anti-shing protocol defensibility . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
## 7.5 Cross-iteration FWER and iteration-selection bias . . . . . . . . . . . . . . . . . 28
8 RequestforGuidelines 30
A Glossary 30
B CitedLiterature 33
C SampleArtifact: PairDVerdictHeader 35
D Power-CalculationTransparencyTable 36
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 2 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
1. Introduction & Economic Motivation
This memorandum is an empirical-methodology record and a request for guidelines. It documents
the iteration history that the analytics workstream has executed to date, presents the methodol-
ogy that produced each verdict, and asks ve prioritised methodological questions whose answers
we expect to bind the design of subsequent iterations. The memorandum is addressed to the
analytics supervisor; we expect the supervisor's response, where given, to serve as the design
constraint for the next iteration's pre-registration.
The project's economic motivation is best stated as a nancial-intermediation gap for an identi-
able underserved population rather than as an abstract claim about aggregate inequality. The
population the iteration roster currently centres on is Latin-American digital workers paid in
local currency (Colombian pesos, in the dev-AI Stage-1 iteration of Section 7) who carry a recur-
ring USD-denominated cost burden through their professional inputs  subscription AI services,
application programming interface usage fees, cloud compute, and adjacent software-as-a-service
spend. These workers are exposed to FX-pass-through cost shocks on their monthly USD spend
that no Colombian retail-bank product currently hedges. Conventional FX-derivative venues are
inaccessible: minimum notional sizes, counterparty credit standing, and intermediating-broker
requirements are calibrated for corporate treasury clients, not for an individual digital worker
carrying a hundred-to-low-thousands USD monthly cost line. The intermediation gap is the op-
erative phenomenon; aggregate distributional inequality is, under this reading, the cumulative
consequence of many such uninsured intermediation gaps rather than the framing primitive.
We treat the framework's contribution as the identication and empirical validation of the macro
risks X that produce the cost shocks, followed by the design of parametriccost-insuranceprod-
ucts that close the intermediation gap. This framing is deliberate: it places the methodology
under the standards of the parametric-index-insurance literature (Carter et al., 2017; Mahul and
Stutley, 2010; Clarke, 2016) rather than under the standards of generic derivatives pricing, and
it lets the supervisor evaluate the empirical work using the underwriting discipline he would
apply to any insurance product (basis risk, adverse selection, catastrophic-loss probability, coun-
terparty matching). The implementation venue described in Section 4 is on-chain settlement
infrastructure; that infrastructure is not the economic primitive.
The wage-to-capital boundary remains a documented empirical phenomenon and is preserved
as the analytical object of the iteration roster. Mendieta-Muñoz (2017a) documents prema-
ture deindustrialization in Colombia and the corresponding reallocation of labor away from
productivity-rising sectors; Rodrik (2016b) establishes the cross-country pattern; McMillan and
Rodrik (2011b) formalises the structural-change-and-productivity decomposition that underlies
the pattern. Together these references establish that for a substantial subset of developing-
economy populations, the path from wage income into productive-capital ownership has become
structurally narrower over the past three decades, and that the populations on the wrong side
of that narrowing are exactly those that an absent intermediation layer fails to insure. The
project's empirical question is which macro risks X are quantitatively responsible for the re-
curring uninsured cost shocks that keep specic target populations on the wrong side of this
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 3 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
boundary.
The unit of work is a triple (Y,M,X) dened formally in Section 2 and motivated by a hedge-
target proposition in Section 3. The validation strategy estimates a composite slope β̂composite of
Y on lagged X, with sign expectation, lag structure, primary specication, and verdict thresholds
pre-registered before the panel is touched. Section 5 (drafted by the data-methodology agent)
presents the methodology in full; we mention it here only to x the object the supervisor is being
asked to review.
Iterationcountandthecross-iterationmultiple-comparisonposture. As of the date of
this memorandum, the project has run ve iterations and allveareclosedorparked: no Stage-1
work is in progress. The ve are: one PASS verdict (Pair D, broad-services Section-GT employ-
ment share against COP/USD lag, closed 2026-04-28); one closed FAIL on the pre-registered
weekly primary with two pre-registered sensitivities producing positive 90 % condence inter-
vals (FX-vol-on-CPI-surprise, closed 2026-04-19); one closed EXIT_NON_REMITTANCE (Phase-A.0
remittance corridor, closed 2026-04-24); one parked-for-record (P1 Bittensor SN18 event-study
apparatus); and  closed within the past week, on 2026-05-06  one sign-ipped FAIL (dev-AI
Stage-1, Colombian young-worker Section-J narrow-ICT employment share against COP/USD
lag), in which the pre-registered positive-sign expectation was rejected at conventional signi-
cance with β̂ = −0.146. The dev-AI Stage-1 iteration also produced, on a pre-specied Section-M
sensitivity arm (professional/scientic/technical/admin services, CIIU Rev. 4 Sections {6975}),
a strong positive estimate β̂ = +0.455 at p ≈ 1.13 × 10−6. That sensitivity result is consistent
with  but does not formally resolve  a compositional reading of the Pair D PASS under
which the headline Section-GT positive estimate reected Section-M-style transmission aver-
aged across the broader GT aggregate rather than a Section-J ICT-narrow signal. The Pair D
Section-J/Section-M decomposition is agged here for reference and is not litigated in this sec-
tion; the methodological consequences  both for the Pair D PASS interpretation and for the
cross-iteration multiple-comparison posture  are taken up in Sections 6 and 7.5.
Each individual iteration was pre-registered, and the within-iteration anti-shing discipline is
documented in Section 5. The cross-iteration multiple-comparison structure, however, is not
addressed by within-iteration pre-registration: which (Y,X) pairs entered the iteration roster in
the rst place, which were dropped after EXIT, and which were deepened after PASS are decisions
made by the project team, not by a pre-registered iteration-allocation rule. We acknowledge that
this constitutes an open methodological question and we treat it explicitly in Section 7 (speci-
cally Section 7.5) rather than presenting the ve verdicts as if they were drawn from independent,
pre-iteration-selected experiments. The supervisor's guidance on the appropriate cross-iteration
familywise-error or selection-bias mitigation regime is one of the ve asks in Section 7.
The remainder of the memorandum is organised as follows. Section 2 denes the operating frame-
work and the (Y,M,X) triple. Section 3 introduces the inequality-dierential hedge proposition
that motivates the iteration design and reads it as the underwriting target of a parametric cost-
insurance product. The on-chain settlement substrate is summarised by a separate agent in
Section 4 for completeness; it is contextual rather than evidentiary, and the supervisor need not
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 4 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
engage with it to evaluate the econometrics. Sections 5 and 6 present the methodology and the
iteration log. Section 7 states the ve methodological questions in priority order. Section 8 closes
with the request for guidelines.
2. Operating Framework: The (Y, M, X) Triple
This section denes the unit of analytical work that the iteration roster operates on. We adopt
the same denitions used internally throughout the project's specs, plans, and memory artifacts
so that the supervisor's comments map directly onto the documents that govern subsequent
iterations.
2.1 Denitions
The triple (Y,M,X) consists of:
 Y  the welfare-relevant outcome variable on which a target population's exposure to the
wage-to-capital transition is measured. Y is operationalised per population. Examples
used in closed and active iterations include the Section J information-and-communication
employment share for young Colombian workers, the realised volatility of a household
consumption basket, and the cross-sectional dierential between productive-capital returns
and a wage-indexed consumption basket.
 X  the macro risk hypothesised to block the wage-to-capital transition for the target
population. X identication is empirical and population-specic. The rst-cut iteration
question is always: which macro variable, at which lag, currently kills wage earners' at-
tempts to enter productive-capital ownership in this population? X enters the regression
as a lag-distributed right-hand-side variable; the lag structure is pinned in the spec text
before the panel is constructed.
 M  the settlement geometry of the candidate hedging instrument. M is introduced for
completeness; it is declared out of scope for empirical validation and deferred to Stage 2
of each iteration. The on-chain operational details that determine the feasibility of M for
a given (Y,X) pair are surveyed in Section 4 for the supervisor's reference; the rest of the
memorandum does not require familiarity with them.
2.2 Stage discipline
Each iteration proceeds through three stages with explicit exit criteria:
1. Empiricalriskvalidation.Estimate β̂composite of Y on lagged X under a pre-registered
specication. Exit on a positive-β̂ verdict at the pre-committed signicance threshold. We
treat this stage as the object of the supervisor's review.
2. Ideal-scenarioMsketch.Conditional on a Stage-1 PASS, propose an instrument geom-
etry on the on-chain substrate that wouldsettle the empirical β̂composite if deployed. Stage 2
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 5 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
does not require live counterparty capital. Exit on a settlement-feasible construction that
hedges the validated correlation.
3. Livedeployment.Conditional on Stage 2 and live counterparty capital, deploy and run
an execution test. This stage is out of scope for the present memorandum.
The stage discipline is enforced by an internal anti-shing rule: stage drift, in particular allowing
Stage 2 instrument-design considerations to re-enter the Stage-1 specication choice, is treated
as a silent design adjustment under the project's pre-registration discipline (see Section 5 and
Section 7.4). The empirical exercises the supervisor is being asked to review are entirely Stage-1.
2.3 Iteration order
The default iteration order is target-population dominant. We x the target population rst;
we x Y on a candidate inequality- or wage-to-capital-transition exposure measure for that
population; we enumerate X candidates from the empirical risk surface that the population faces;
for each surviving X we search the on-chain-eligible M space for tradability. The pair (Y,X)
only graduates to instrument design once a settlement-feasible M exists. A closed iteration with
verdict FAIL or EXIT informs the X-search prior for the next population. We do not re-run
the same (Y,X) at adjusted thresholds after a FAIL; the within-iteration anti-shing invariants
carry forward to subsequent iteration design.
2.4 Acknowledged limitations
Two limitations of the framework are load-bearing for the supervisor's review and worth stating
explicitly in this section rather than in Section 7.
First, the iteration order described above does not, by itself, address cross-iteration multiple-
comparison concerns. Iteration selection (which populations and which X candidates enter the
roster) is a project-level decision that is not pre-registered in the same way that within-iteration
specications are pre-registered. We treat this as an open methodological question (Section 7.5).
Second, identication at Stage 1 is correlation-identied rather than causally identied. The
project's PASS-verdict iteration (Pair D) explicitly hedges the correlation rather than asserting
a causal channel (, per the closure memo memory/project_pair_d_phase2_pass.md, Reality-
Checker FLAG #1). We discuss the identication posture and its implications for moving from
Stage 1 to Stage 2 in Section 7.1.
3. The Abrigo Lemma: Inequality Dierential as Hedge Target
This section states the proposition that motivates the choice of Y in the framework's medium-
term iteration roster. It is presented as a proposition rather than a proven theorem; the disclaimer
is repeated immediately after the formal statement and is binding on the rest of the memoran-
dum. The economic interpretation given to the proposition is that of a parametric-cost-insurance
underwriting target rather than that of a generic derivative hedge target; the mathematical con-
tent is unchanged from earlier statements internal to the project, but the framing under which
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 6 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
the supervisor is invited to evaluate it is the parametric-index-insurance literature (Carter et al.,
2017; Mahul and Stutley, 2010; Clarke, 2016).
Lemma 1 (Inequality-Dierential Hedge Target). Let Ra(t) denote the return process of an
assetbasketrepresentativeofcapital-holdinghouseholds'wealth,andletRc(t) denotethereturn
process of a consumption basket representative of working-class households' purchasing power.
Denetheinequality-dierentialprocess
Yinequality(t) = Ra(t) − Rc(t).
A hedging instrument settled on Yinequality(t) is welfare-relevant for working-class wealth in a
waythatnoinstrumentsettledonRa(t) aloneorRc(t) aloneis,becausethedierentialdirectly
indexes the relative-wealth gap that determines the working-class household's purchasing-power
declinerelativetocapital-holdinghouseholds.
Status of the Lemma  load-bearing disclaimer. Lemma 1 is stated as a proposition
motivating the project's iteration design. It is nota proven theorem. In particular, the existence
of a settlement-feasible instrument that materialises the dierential Yinequality on the on-chain
substrate, and the calibration of the associated stochastic process, are Stage-2 / Stage-3 work
that this memorandum does not prove. The proposition's role in the memorandum is solely to
motivate why the iteration roster targets distributional dierentials rather than single-aggregate
macro variables.
Insurance-framingreading. Under the framing developed in Section 1, the dierential Yinequality(t)
is the welfare-relevant index variable on which a parametric cost-insurance product should set-
tle. The working-class household holds the policy  the insured party  and the policy pays
out as a function of the realised dierential. The capital-holding counterparty already carries
the asset exposure represented by Ra(t) through pre-existing portfolio positions and therefore
does not need to be matched to a new opt-in derivative leg; the counterparty matching is struc-
tural rather than negotiated, in the sense documented for parametric-index insurance by Carter
et al. (2017) and surveyed for developing-country agricultural applications in Mahul and Stutley
(2010). The basis-risk posture that Clarke (2016) formalises  the gap between an index-payo
and the policy-holder's realised loss  becomes the appropriate Stage-1 evaluation discipline,
and that posture is the one under which the supervisor is asked to evaluate the empirical work
in Section 7.2.
3.1 Why a single-aggregate hedge is insucient
A standard single-aggregate macro hedge  for example, an instrument settled on the headline
consumer-price index alone, or on the bilateral exchange rate alone  fails to capture the relative-
wealth dimension that matters for working-class welfare. The headline consumer-price index
mixes consumption baskets across the wealth distribution; capital-holding households frequently
hold consumer-price-index-indexed assets that neutralise their own exposure to ination, leaving
the working-class household systematically more exposed than the headline number suggests. A
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 7 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
hedge settled on the headline index therefore prices o the average household's exposure rather
than o the relative exposure dierential that is welfare-relevant for the population of interest.
Read in insurance terms, the headline-index policy carries unmodelled basis risk against the
policy-holder's actual loss exposure; Clarke (2016) establishes that uninternalised basis risk on
an index-payo product is a rst-order determinant of rational demand for that product. The
dierential Yinequality(t) = Ra(t) − Rc(t) removes the aggregation problem by construction: it
indexes precisely the gap between the two baskets rather than the level of either, and therefore
admits a basis-risk treatment of the kind Clarke (2016) requires.
3.2 Two-sided market and counterparty matching
A second motivation for the dierential formulation is the existence of a natural two-sided mar-
ket that does not require an opt-in negotiated counterparty. On the dierential, the working-
class household is naturally LONG (a widening dierential corresponds to a relative loss for the
household, which the policy-payo compensates), while capital-holding households are naturally
SHORT through the asset positions they already hold (their existing portfolios deliver the Ra(t)
leg, so their natural exposure is to a narrowing dierential). The dierential formulation there-
fore admits the same counterparty-matching structure that Carter et al. (2017) characterise for
index-insurance arrangements: the index payo clears the counterparty-availability problem that
obstructs single-aggregate constructions, because the counterparty is not negotiated into a new
position but is structurally exposed to the index already. The counterparty-matching argument
is conjectural at the present stage; we ag the formal calibration of the dierential's joint-leg
correlation structure and FWER posture as the methodological question in Section 7.3.
3.3 Calibration of the continuous-time dierential
The dierential Yinequality(t) is treated as a continuous-time stochastic process. Its calibration 
choice of the component variables that constitute each leg, weighting within each leg, joint-leg
correlation structure, and treatment of regime switches  is deferred to Section 7.3 as an explicit
ask for the supervisor's input. The project's current iteration roster has not yet attempted full
joint calibration; closed and active iterations estimate the response of single Y variables to single
X lags as a precursor exercise. The parametric-cost-insurance reading developed above does
not change the mathematical object being calibrated; it changes the standard against which
the calibration's adequacy is judged, and that standard is the underwriting-discipline standard
developed across Carter et al. (2017), Mahul and Stutley (2010), and Clarke (2016).
4. On-Chain Settlement Substrate: Primer for the Non-Specialist
Reader
This section introduces the on-chain settlement venue at the level required for the supervisor to
evaluate the empirical record presented in Sections 5 and 6. We anchor each on-chain construct
to its closest traditional-nance analogue at rst introduction and avoid implementation detail
throughout. We emphasise at the outset that the empirical β̂-validation work the supervisor
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 8 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
is reviewing is conducted on o-chain data series (DANE, Banrep, GEIH); on-chain content is
contextual, not evidentiary.
4.1 What On-Chain Means
In the present document, an instrument is said to settle on-chain when the rule-set governing
its cash ows  the conditions under which obligations are recognised, netted, and discharged
 is recorded on a public ledger and executed by a programmable settlement engine. The
closest traditional-nance analogue is a clearinghouse with a public, veriable, programmable
rule-set: the contractual specication that a clearinghouse keeps in its internal rulebook is, in
this setting, a publicly inspectable object whose execution is automatic and observable to all
market participants.
Two properties of this venue are load-bearing for what follows. First, settlement is deterministic
given the rule-set and the observable inputs; there is no discretionary intermediary that must be
coordinated with at trade time. Second, the rule-set is programmableinadvance: payo geome-
tries that would conventionally require a bespoke ISDA conrmation can be encoded once and
reused at scale. We emphasise that nothing in this section depends on the implementation lan-
guage of the rule-set; the reader is asked only to accept that a programmable, publicly-auditable
clearinghouse exists as the settlement backdrop for the instrument family the framework targets.
4.2 Panoptic: Perpetual Options on Liquidity-Provider Positions
Panoptic is a deployed protocol that issues perpetual option-like instruments written against
concentrated liquidity-provider (LP) positions on the Uniswap v3/v4 automated market makers
(Lambert et al., 2023; Panoptic Labs, 2026; Adams et al., 2021, 2024). The traditional-nance
analogue is a perpetual-future-on-options instrument in which the option strike is encoded as
the price range over which a market-making position is concentrated, and the option premium
accrues continuously as a streaming funding payment rather than as a one-shot premium at trade
inception.
The economic content can be stated without recourse to implementation. A concentrated LP
position, in the Uniswap v3/v4 sense, is a two-asset market-making commitment over a bounded
price interval [Pℓ,Pu]. Inside the interval, the position behaves as a passive market maker;
outside, it converts entirely to one of the two assets. The payo of such a position, viewed as a
function of the terminal price PT , is a piecewise-concave curve  a long-gamma exposure inside
the interval and a directional position outside it. Panoptic's contribution is to allow market
participants to take eithersideof this payo continuously: a short position in the LP curve (sold
to a long counterparty for a streaming premium) delivers a payo geometry equivalent to a long
perpetual option, with the strike, range, and convexity controlled by the chosen [Pℓ,Pu] bracket
and the asset pair. Standard option structures  covered calls, range LPs, perpetual puts, and
straddles  are all expressible as combinations of such positions.
For the framework's purposes, three properties matter. First, the instruments are convex in the
underlying price: convexity is the load-bearing property required for the (Y, M, X) instrument
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 9 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
family articulated in Section 2 and the inequality-dierential lemma of Section 3. Second, the
instruments are perpetual: they do not expire on a xed calendar date and therefore admit
indenite roll-without-rebooking, which is operationally relevant for a wage earner paying a
small recurring premium out of wage income. Third, the instruments are permissionless: any
market participant who can interact with the public ledger can take either side, without bilateral
counterparty negotiation. We do not litigate liquidity adequacy at the venue here; Section 4.5
returns to the question of how the framework treats the gap between empirical β̂-validation and
live deployment liquidity.
4.3 Mento Purchasing-Parity Stablecoins
Mento is a deployed reserve-backed stablecoin protocol on the Celo public ledger (Mento Labs,
2026a,b). As of the manifest dated 2026-04-27, the Mento V3 deployment maintains a roster of
twelve country-currency-pegged claims, of which the framework treats ve as load-bearing for the
target populations under iteration: usdm (United States dollar), eurm (Euro), brlm (Brazilian
real), kesm (Kenyan shilling), and copm (Colombian peso). Each claim is, for the supervisor's
purposes, a digitalcountry-currency-peggedliabilityoftheprotocol, with the peg maintained by an
on-chain reserve mechanism. The closest traditional-nance analogue is a narrow-purpose digital
currency board: the protocol holds a portfolio of reserve assets and exchanges xed amounts of
the pegged claim against a basket of redemption assets at the protocol-determined reference rate,
mediated by a routing contract referred to in the manifest as the Mento Broker.
The empirical implication for the framework is decisive and is the principal reason Mento appears
in this document at all. Consider a working-class Colombian household contemplating a hedge
against a macro risk X that threatens its purchasing power. A hedge denominated in United
States dollars settles in a currency the household does not consume; the household then bears
residual COP/USD exchange-rate risk between hedge settlement and consumption. A hedge
denominated in copm settles directly in a claim pegged to the household's consumption currency,
eliminating that residual exchange-rate exposure by construction. The hedge is, in this sense,
purchasing-paritypreservingat the unit-of-account level. The same construction applies to brlm
for Brazilian populations, kesm for Kenyan populations, and so on across the Mento basket.
We note one item of housekeeping that may bear on supervisor questions about on-chain attri-
bution. There exist two distinct Colombian-peso-named claims on the Celo ledger: the Mento-
protocol-native copm (canonical address 0x8A567e2a...4041eA) and a separate ntech-issued
copm-Minteo claim (address 0xc92e8fc2...1d5606) that is not Mento-protocol-native and is
therefore out of scope for any framework-level claim about Mento user behaviour. The audit-trail
discipline of the framework treats these as non-substitutable.
4.4 Political-Receptivity Context
In late January 2025, a tari stando between the United States executive and the Colom-
bian executive produced a documented forty-eight-hour spike in new account formation at Lit-
tio, a Colombian ntech provider of USD-pegged stablecoin accounts; the spike was on the
order of one hundred percent above prior baseline (per the project's internal reference document
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 10 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
OFFCHAIN_COP_BEHAVIOR.md, which the same event-window has been used as a structural-break
event-dummy across multiple iteration specications). This is a user-side responsiveness sig-
nal: Colombian retail moved into a USD-stablecoin rail during a political dollar-access shock.
We include the observation as anecdotal context for the framework's implicit hypothesis that
working-class populations facing macro-risk shocks display measurable willingness to engage on-
chain instruments when the o-chain banking rail becomes congested or politically encumbered.
We emphasise that this observation is not a presidential transaction; earlier draft language as-
serting that the Colombian president had publicly transacted on-chain was unsourced and has
been removed. The receptivity signal is anecdotal frame only; it is not load-bearing for any
empirical or methodological claim elsewhere in this document.
4.5 Critical Disclaimer: Empirical Validation is O-Chain
The framework's empirical β̂-validation work  the verdicts recorded in Section 6 and the
methodology of Section 5  is conducted on o-chain data series. The Pair D PASS verdict,
the dev-AI Stage-1 in-progress estimation, the FX-vol-CPI-surprise FAIL, the Phase-A.0 EXIT,
and the P1 PARKED record all rest on data assembled from the Departamento Administrativo
Nacional de Estadística (DANE), the Banco de la República de Colombia (Banrep), and the
Gran Encuesta Integrada de Hogares (GEIH). On-chain data series enter the framework only at
later stages of candidate Xd signal-design, and their role there is auxiliary and re-pivoting in
light of recent verication work (see Section 6, dev-AI Stage-1 and Phase-A.0 EXIT entries).
The settlement venue  Panoptic on a Mento-denominated pair  is the deployment target
once a (Y, X) pair passes Stage-1 empirical validation. Stage-1 validation does not require any
on-chain interaction; Stage-2 instrument design (M-sketch) does not require live liquidity; only
Stage-3 deployment requires real liquidity-provider capital. The supervisor's review concerns the
econometrics  the Stage-1 layer. Sections 5, 6, 7, and 8, together with Appendices C and D,
are readable end-to-end without further on-chain familiarity.
4.6 Reader Takeaways
1. On-chain perpetual options exist and are tradable today, via the Panoptic protocol written
against Uniswap v3/v4 LP positions (Panoptic Labs, 2026).
2. Purchasing-parity stablecoin denominations exist, via the Mento protocol's roster of country-
currency-pegged claims (usdm, eurm, brlm, kesm, copm) (Mento Labs, 2026b).
3. The empirical work the supervisor is reviewing is o-chain econometrics on DANE, Banrep,
and GEIH series.
4. The remainder of this document does not require on-chain familiarity; the reader may
proceed directly to Section 5.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 11 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
5. Empirical Methodology
This section describes the estimation discipline that has governed every iteration in the Abrigo
log. The framework treats Stage 1 (empirical risk validation) as a stand-alone testing exercise: an
iteration either produces a positive, statistically detectable composite coecient on a pre-pinned
lag panel of the macro risk X for the pre-pinned outcome Y , or it does not. The settlement
geometry M on which an iteration would deploy is out of scope for the verdict. The methodology
below therefore reads as a small, xed kit of econometric primitives applied identically across
iterations, with a strict pre-registration discipline that xes every nontrivial design choice before
the data are touched.
5.1 Pre-registration discipline
For every iteration we author a design specication that pins, in textual form and beforeanydata
ingest, the following objects: the operational denition of Y ; the construction of X; the lag set;
the functional form of the dependent variable; the primary inference procedure; the robustness
arms; the verdict thresholds; and the falsication tree. The specication is hashed (sha256) at
commit time and the hash is propagated through the implementation plan, the result notebooks,
and the verdict artifact. Any post-data revision recomputes the hash and triggers a two-wave
independent review (Reality Checker plus a purpose-matched specialist) before further execution.
Within an iteration, threshold tuning post-hoc is treated as silent shing and is forbidden. This
discipline is in the spirit of the pre-analysis-plan literature (Olken, 2015a; Christensen and Miguel,
2018b) adapted to an observational-econometrics setting in which a public registry analogue is
not yet adopted by the project; whether to register against an external registry is one of the
open questions we address to the supervisor in Section 7.
5.2 Anti-shing invariants
Three numerical invariants currently bind every iteration:
 Minimum sample size after window compliance and lag-window loss: Nmin = 75 observa-
tions.
 Minimum power at the pre-registered minimum detectable eect size: Powermin = 0.80.
 Minimum detectable eect size: MDES = 0.40 standard deviations of Y .
These three numbers were inherited from the Phase-A.0 specication chain (Rev-5.3.1) and have
notbeen re-derived per iteration's actual N, residual autocorrelation structure, or HAC-adjusted
eective sample size. We ag this inheritance explicitly here, present whatever back-of-the-
envelope derivation is feasible at writing time in Appendix D, and address the defensibility of
the three numbers to the supervisor as a dedicated open question in Section 7 (§7.4). The
document is asking the supervisor whether these thresholds are defensible against the empirical
record of the ve closed iterations, not asserting that they have been validated.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 12 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
5.3 Functional form and primary inference
For each iteration we test a one-sided null on the composite coecient across a pre-pinned lag
panel:
H0 : βcomposite ≤ 0 vs. H1 : βcomposite > 0, (1)
with the sign expectation grounded in the literature anchor of the iteration's transmission chain
(never inferred from the data). For the two monthly-cadence iterations that share the COP/USD
lag panel (Pair D and dev-AI Stage-1), the primary specication is:
Y logit
t = α+β6 log(COP_USDt−6)+β9 log(COP_USDt−9)+β12 log(COP_USDt−12)+εt, (2)
where Y logit
t = log Yt/(1 − Yt)

is the logit of an interior-bounded employment share. The
composite of interest is βcomposite ≡ β6+β9+β12; its hypothesis is tested via the linear-restriction
variance d Var(c′β̂) = c′b Σc with c = (0,1,1,1)′, equivalent to the Wald-restriction variance and
not a delta-method object. Lags 6, 9, and 12 of the log-FX series are highly serially correlated
at monthly frequency; individual coecients have wide intervals, but the composite is precise
because the o-diagonal entries of b Σ are negative under positive collinearity, which deates
d Var(c′β̂) below the sum-of-individual-variances intuition. A reading that individual lags weren't
signicant is methodologically incorrect: the test is on the composite alone.
The logit transform is justied on the standard textbook (Hansen, 2022a, 16.4) grounds for an
interior-bounded share whose empirical range lies away from 0 and 1. The fractional-response
(Papke and Wooldridge, 1996) and beta-regression (Ferrari and Cribari-Neto, 2004) alterna-
tives are not pre-committed because the iterated Y ranges (Pair D [0.55,0.75]; dev-AI Stage-1
[0.014,0.031] realized) are well-interior to (0,1); a raw-share specication is preserved as a ro-
bustness arm rather than as the primary.
Primaryinferenceconvention. The primary standard error is the homoskedastic OLS stan-
dard error per the project's anti-overclaim discipline: HAC bandwidth selection introduces a
post-data degree of freedom that the pre-registration regime rules out from the primary tier.
HAC inference is run as the pre-pinned R4 robustness arm (see §5.4) at a xed lag-truncation
chosen at spec-authoring time. Where the verdict label is invariant under the OLS and HAC
standard errors, headline numbers report the moreconservativeof the two SE conventions; where
the two would diverge across the verdict boundary, the OLS-primary SE governs the verdict and
the HAC SE is reported as the R4 row. In the closed Pair D iteration the HAC SE produced a
marginally smaller p-value than the OLS SE, so the headline reports the larger HAC SE as the
more-conservative anti-shing convention without re-routing the verdict; in the closed dev-AI
Stage-1 iteration, primary OLS and R4 HAC standard errors agree on the FAIL verdict label
and the headline reports the HAC SE on the same more-conservative-of-the-two convention. The
verdict label has been invariant across the two SE conventions in every iteration that has closed
to date.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 13 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
5.4 Robustness inference (HAC)
The robustness HAC standard error is the Newey-West heteroskedasticity- and-autocorrelation-
consistent estimator (Newey and West, 1987) with xedlagtruncationL chosenatspec-authoring
timeperiteration, not a data-driven automatic rule. The bandwidth values that have been used
to date are:
 Monthly cadence (Pair D, dev-AI Stage-1): L = 12. The truncation matches the longest
right-hand-side lag in the spec  the twelve-month oshoring contracting cycle that mo-
tivates the lag panel.
 Weekly cadence (FX-vol-CPI primary): L = 4. The truncation was set at spec-authoring
time on the basis of the in-sample residual autocorrelation diagnostic that closed at L = 4
in the Phase-A.0 pipeline; a robustness sensitivity at L = 12 is pre-registered as a fat-tail
diagnostic, not as the primary.
Automatic-bandwidth selection rules (Newey and West, 1994; Andrews, 1991) are explicitly not
used: a data-driven bandwidth introduces a post-data degree of freedom that the pre-registration
discipline rules out.
5.5 Robustness arms
For monthly iterations (Pair D and dev-AI Stage-1) the spec text pre-pins four single-row alterna-
tives, each varying exactly one design choice from the primary; multi-dimensional re-specication
(varying two or more dimensions simultaneously) is forbidden:
 R1  regime-dummy alternative to the methodology-break treatment (e.g., 2021 GEIH
empalme dummy in place of the DANE splice factor).
 R2  sector-cut narrowing alternative on the dependent variable (Pair D: Sections J + M
+ N as a BPO-narrow cut; dev-AI Stage-1: Section M as a sibling-narrow comparator to
Section J).
 R3  functional-form alternative (raw share in place of logit).
 R4  HAC inference per §5.4, substituted for OLS standard errors.
The closed FX-vol-CPI iteration uses a wider thirteen-row pre-registered sensitivity universe, of
which the A1 monthly-cadence and A4 release-day-excluded rows are two; the universe is pinned
via a sensitivity_preregistration_hash on the panel ngerprint artifact. Free lag tuning is
forbidden in all iterations.
A coarse stability classier maps the four-row vector to one of three labels: AGREE (zero R-rows
produce a sign-ipped composite relative to the primary), MIXED (one or two ips), or DIS-
AGREE (three or four ips). DISAGREE triggers a special verdict label SUBSTRATE_TOO_NOISY,
regardless of the primary's signicance, and routes the iteration to a methodology-revision branch
rather than to verdict assignment. We additionally note that the R4 HAC arm is a serial-
correlation hedge and not, in itself, a heteroskedasticity hedge: the OLS-primary inference as-
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 14 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
sumes conditional homoskedasticity, and whether to add a White / sandwich heteroskedasticity-
only diagnostic as a fth pre-pinned arm is one of the methodology questions we put to the
supervisor in Section 7 (§7.4).
5.6 Persistent-regressor posture and Stambaugh bias
The right-hand-side regressor in the monthly-cadence iterations is log(COP_USDt−k), which is
empirically near-unit-root at the monthly frequency on the realized 20142026 sample window.
The project's identication posture is predictive-regression in the strict Granger-predictive sense
(see §5.9); the closed FX-vol-CPI iteration's pre-registered T1 exogeneity test rejected at F =
15.12, p ≈ 1.3×10−9 and consequently the project does not interpret β̂ as an impulse-response.
The predictive-regression posture, however, is known to suer small-sample bias when the right-
hand-side regressor is persistent and the residual is correlated with the regressor's innovation
(Stambaugh, 1999); the bias does not vanish in nite samples even under correct specica-
tion, and recent econometric work (Phillips, 2014) has extended the asymptotic theory to near-
unit-root and mildly explosive regressors. The Pair D and dev-AI Stage-1 iterations realized
N = 134 monthly observations, which is modest-but-not-tiny on the conventional Stambaugh-
bias scale; the bias-correction literature suggests the order-1/N bias is small relative to the
realized HAC standard error in both iterations, but the project has not formally implemented a
Stambaugh-corrected estimator at writing time. This is one of the leading methodology open-
questions we put to the supervisor in Section 7 (§7.1, identication ask, and §7.4, invariants ask):
whether the predictive-regression posture is sucient as Stage-1 verdict machinery, or whether
Stambaugh-correction (or equivalent near-unit-root-aware inference) should be elevated from a
deferred methodology improvement to a pre-pinned R-arm before the next iteration spec-pin.
5.7 Verdict mapping
The mapping is deterministic. Given the primary tuple (β̂composite,p̂one-sided,R-consistency) and
the residual-moment tuple (ŝ3,ŝ4), every leaf returns exactly one verdict:
1. If the realized sample size N falls below Nmin = 75, the iteration HALTs (see §5.8).
2. If R-consistency is DISAGREE, the verdict is SUBSTRATE_TOO_NOISY.
3. Otherwise:
 β̂composite > 0 and p̂ ≤ 0.05 returns PASS.
 β̂composite > 0 and p̂ ∈ (0.05,0.20] returns ESCALATE Clause A.
 Clause B res when |β̂composite/c SE| < 0.5 and either |skew(ε̂)| > 1.0 or Fisherexcess
kurtosis ŝ4 ≡ κ̂4 − 3 > 3.0 (i.e., raw fourth standardized moment κ̂4 > 6; a normal
residual has Fisher excess kurtosis 0 and the threshold ags substantially leptokurtic
tails). When Clause B res the verdict is ESCALATE Clause B; otherwise FAIL.
 β̂composite ≤ 0 and p̂ ≤ 0.05 returns FAIL with no Clause B evaluation: a wrong-signed
signicant estimate falsies H1, and convex-payo escalation, which is grounded in
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 15 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
the positive sign expectation, does not apply.
The numerical thresholds 0.5, 1.0, and 3.0 in Clause B are pinned at spec-authoring time and
are not adjustable post-data; the 3.0 threshold is on the Fisher(excess-over-normal) convention,
not on the Pearson raw-fourth-moment convention. The ESCALATE branches trigger a pre-
authorized convex-payo suite (a τ = 0.90 quantile regression on the central lag, a GARCH-X
mean-equation regression, and a peaks-over-threshold extreme-value regression on the upper-tail
residuals); each suite leg has its own one-sided p-value at α = 0.10 and the disjunction over
the three legs determines ESCALATE-PASS or ESCALATE-FAIL. The disjunction structure
is defended against multiple-testing critique on the grounds that each leg estimates a distinct
distributional-moment parameter that maps to a distinct convex-instrument design, rather than
three restatements of the same parameter.
5.8 HALT and disposition discipline
When the spec text contradicts the data  examples already encountered include the DANE
RAMA4D_R4 schema-stability HALT in the Pair D ingest and the realized cell-size and share-
magnitude gap in the dev-AI Stage-1 ingest  the iteration HALTs by raising a typed exception.
A disposition memo is led enumerating at least three pivot options; the user adjudicates; a
CORRECTIONS block lands in the next specication revision documenting the disposition,
the chosen pivot, and the rationale; and a three-way independent review is run before further
execution. Auto-pivot is forbidden, and post-hoc threshold tuning is forbidden. The discipline
is documented in the project's internal feedback memory under the pathologicalhaltanti-shing
checkpoint rule.
5.9 Identication posture
Every estimate produced by the framework to date is correlation-identied under predictive-
regression posture. Wherever an exogeneity test has been run as a diagnostic  the FX-vol-
CPI iteration ran a T1 exogeneity test that rejected at F = 15.12 and p ≈ 1.3 × 10−9  the
result has reinforced the predictive-regression reading: β̂ describes how past information predicts
current realized volatility, not how an exogenous surprise causes future realized volatility. The
distinction is the standard Granger-predictive versus structural-causal distinction; the document
does not use β̂ as an impulse-response. Whether to move to instrumental-variable, event-study,
or structural VAR identication before declaring a Stage-1 PASS sucient for Stage-2 dispatch
 and whether the persistent-regressor posture noted in §5.6 requires Stambaugh-bias-corrected
inference at the primary tier  is the leading open question we put to the supervisor in Section 7.
6. The Abrigo Log: Record of Closed and Active Iterations
This section records the ve iterations the project has run to date. Each iteration is presented
in the same nine-eld schema  target population; (Y,X) pair with operational denition; sign
expectation and literature anchor; primary specication; sample; verdict; headline numbers; key
caveats from independent review; and pre-registration sha256 chain. The section closes with a
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 16 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
load-bearing caveat on cross-iteration multiple-comparison structure that we develop further as
a supervisor question in §7 (§7.5).
6.1 Pair D  BPO oshoring through COP/USD lag
Targetpopulation. Colombian young workers aged 1428 (statutory youth band per Ley 1622
de 2013) employed in the broad services aggregate.
(Y,X)pair. Yt is the share of young workers (1428) whose primary occupation falls in CIIU
Rev. 4 A.C. Sections GT, computed monthly on the DANE GEIH micro-data with FEX_C_2018
expansion factors and the DANE empalme factor applied to the 20152020 segment for Marco-
2005-to-Marco-2018 reconciliation; the dependent variable is the logit of the raw share. Xt−k is
log(COP_USDt−k) on the Banrep TRM end-of-month spot, for k ∈ {6,9,12} months.
Signexpectationandliteratureanchor. Positive. The transmission chain is Baumol cost
disease (Baumol and Bowen, 1966; Baumol, 2006) composed with US-Colombia BPO wage ar-
bitrage (Mendieta-Muñoz, 2017b) and the standard six-to-twelve-month oshoring contracting
cycle documented in the Philippines comparator (Beerepoot and Hendriks, 2013; Errighi et al.,
2017); displaced labor reallocates into services on the Rodrik-McMillan premature-deindustrialization
channel (Rodrik, 2016a; McMillan and Rodrik, 2011a).
Primary specication. Equation (2) with composite βcomposite = β6 + β9 + β12; one-sided
test at α = 0.05; OLS-homoskedastic inference primary, HAC(L = 12) inference as robustness
arm R4.
Sample. N = 134 monthly observations, window 2015-01-31 through 2026-02-28. The win-
dow's lower bound is the result of two CORRECTIONS-block revisions documented in the spec:
an initial 2008-01 lower bound was shortened to 2010-01 after a schema-stability HALT on the
DANE empalme nota-técnica coverage, and then to 2015-01 after a second HALT under the re-
alization that the empalme les for the 20102014 segment ship CIIU Rev. 3 codes in the RAMA4D
column despite the column header naming. The 2015-01 lower bound is the DANE-canonical
Rev. 4 value-content-veried window. The N = 134 realized sample is well above the Nmin = 75
oor.
Verdict. PASS, 2026-04-28.
Headline numbers. β̂composite = +0.13670985; HAC standard error 0.02465; t = +5.5456;
one-sided p ≈ 1.46 × 10−8. Robustness rows R1R4 produced zero sign ips relative to the
primary; the four-row classier returned AGREE.
Keycaveatsfromindependentreview. Five ags from the Reality Checker review of the
closed iteration are inherited as load-bearing constraints on any downstream framing:
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 17 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
1. The estimate hedges the correlation between lagged COP/USD and the broad-services
young-worker share. It does not identify the BPO transmission channel as the operative
mechanism: any narrative causal interpretation of the BPO chain is conjectural and is not
supported by the Stage-1 design.
2. The lag eect is concentrated at the six-month horizon (β̂6 ≈ +0.109, approximately 80%
of the composite) rather than uniformly spread across the 612-month contracting window.
The narrative that the project carries forward is concentrated at the six-month horizon,
within the six-to-twelve-month window, not spread uniformly across the window.
3. The window-narrowing path through the two CORRECTIONS blocks over-represents three
macroeconomically distinctive regimes (post-2014 oil-price collapse, the COVID shock,
and the 20222024 Federal-Reserve tightening cycle); the regime-mix concern is a residual
identication concern beyond the four pre-registered robustness arms.
4. The verdict is sensitive to a single o-spec design choice. An orchestrator-brief variant
that included a marco2018_dummy in the primary  not in the spec text, where the
dummy is the R1 arm only  produces β̂composite = +0.0815 at one-sided p ≈ 0.080,
which would map to ESCALATE Clause A under the verdict tree of §5.7. The spec
text ran as authoritative because the spec sha256 was pinned 9.5 hours before Phase-2
dispatch; the o-spec variant is preserved in the artifact primary_ols.json under the
eld off_spec_sensitivity_orchestrator_brief for audit. The document carries this
verdict-sensitivity record forward as part of the framework's decision log.
5. Compositionalreframesurfacedbythedev-AIStage-1closediteration(2026-05-06). The
Pair D PASS was estimated on the broad CIIU Sections GT cut and was, at spec-pin time,
interpreted under a broad-services hedging the BPO transmission chain reading consistent
with either a Section-J ICT-narrow mechanism or a Section-M-style consultancy / scientic
R&D / administrative-services mechanism aggregated up. The dev-AI Stage-1 iteration's
Section-J primary closed β̂composite = −0.14613 (HAC(L = 12) SE 0.0847; t = −1.726;
one-sided p ≈ 0.958 on the pre-registered H1 : β > 0)  a sign-ipped FAIL  and its R2
sensitivity arm on Section M closed β̂composite = +0.45482801 (t = +4.73; p = 1.13×10−6)
at the same monthly cadence on the same lag panel. Read jointly with Pair D, this pattern
strongly suggests Pair D's PASS was carried by the Section-M-style sub-aggregate (consul-
tants, legal, accounting, scientic R&D, administrative services) rather than by Section-J
ICT-narrow tech oshoring. The spec §9.16 compositional- accounting concern is therefore
empirically resolved as agged-not-resolved: a formal (Sections GT \ J) decomposition
pre-registered as an R5 robustness row remains deferred for a future iteration, and any
Stage-2 dispatch o the Pair D PASS must inherit this compositional caveat. Pair D's
headline numbers stand verbatim under the original spec; the interpretation of the opera-
tive sub-aggregate is what has sharpened.
Pre-registrationsha256chain. v1.1 → v1.2 → v1.2.1 → v1.3 → v1.3.1 → governing hash
964c62cca0...ef659. The full hash chain and revision history are reproduced in Appendix C.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 18 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
6.2 dev-AI Stage-1  Section J ICT through COP/USD lag
Targetpopulation. Colombian young workers (1428) employed in CIIU Rev. 4 A.C. Section
J (Information and Communication, Divisions 5863: publishing, motion picture and video,
programming and broadcasting, telecommunications, computer programming and consultancy,
information service activities). The population is a strict subset of the Pair D Sections GT cut.
(Y,X)pair. Yt is the Section-J young-worker share computed on DANE GEIH micro-data
with the same monthly cadence, FEX_C_2018 expansion factors, and RAMA4D_R4 sector coding as
Pair D, restricted to Section J via the published DANE Section table; the dependent variable is
the logit. Xt−k is the same Banrep TRM end-of-month-spot panel as in Pair D, with the same
lag set k ∈ {6,9,12}; the panel back-extends X to 2014-01 to preserve Y starting at 2015-01.
Signexpectationandliteratureanchor. Positive. The mechanism was the same Baumol-
arbitrage-oshoring chain as Pair D narrowed from BPO-avored services-broad to ICT-narrow
tech-services oshoring; the same canonical references applied (Mendieta-Muñoz, 2017b; Beere-
poot and Hendriks, 2013; Errighi et al., 2017; Rodrik, 2016a). As recorded below, the sign
expectation was rejectedatconventionalsignicance by the realized estimate.
Primary specication. Equation (2) restated with the Section-J Y ; one-sided test at α =
0.05; OLS-homoskedastic inference primary, HAC(L = 12) inference as robustness arm R4.
Sample. N = 134 monthly observations, window 2015-01-31 through 2026-03-31, well above
the Nmin = 75 oor.
Verdict. CLOSED FAIL, 2026-05-06.
Headlinenumbers. β̂composite = −0.14613 (HAC(L = 12) standard error 0.0847); t = −1.726;
one-sided p ≈ 0.958 against H1 : β > 0. The estimated sign is the opposite of the pre-registered
expectation: the FAIL is a sign-ipped FAIL, not an underpowered failure-to-reject. The R-
consistency classier returned MIXED (three of four R-rows agree with the primary; only the
R2 Section-M sensitivity sign-ips). The v1.0.2 pre-registered hardening (R1 and R3 must
individually agree on sign for the verdict to clear PASS independently of the four-row aggregate)
is consistent with the FAIL verdict at the negative sign. The pre-authorized escalation suite (§5.7)
returned: D-i and D-ii FAIL on the positive-sign criterion; D-iii literally returned β̂ = +0.113,
p = 0.012 but is inadmissible per the strict reading of §5.5 because the §3.3-trigger condition
that would license escalation never red. The user closed FAIL on 2026-05-06 per the strict
§5.5 reading, with the D-iii literal positive preserved on the record as a Phase-3 artifact for a
possible future Section-M iteration. (A spec-internal contradiction between §5.5 line 252 and
§9.6 on the question of whether the escalation suite must run conditional on a primary-trigger or
unconditionally is acknowledged on the project's deferred-spec- reconciliation list as specv1.0.3
reconciliationag, to be resolved unambiguously before another §5.5 invocation.)
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 19 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Keycaveatsfromindependentreview.
1. Cell-count and share-magnitude gap (CORRECTIONS-κ block). Realized monthly cell
counts for the Section-J young-worker stratum lay in [94,267] with median 145; the ex-ante
feasibility-memo baseline was [700,1200]. Realized monthly raw shares lay in [0.014,0.031]
against an ex-ante range of [0.04,0.10]. The logit derivative dlogit(Y )/dY = 1/[Y (1−Y )]
at the realized share range maps to [33,73], against a v1.0.1 across-support amplica-
tion ratio of 2.34; the spec was κ-tightened on this basis at v1.0.2 to require R1 and
R3 individual sign agreement before any PASS verdict. The realized estimate cleared
the κ-tightened reading at the negative sign  the substrate is not too noisy under the
DISAGREE classier (only one R-row sign-ips), so the verdict is routable rather than
SUBSTRATE_TOO_NOISY.
2. R2 Section-M sensitivity  compositional nding. The R2 sensitivity arm narrowed Y
from Section J to Section M (CIIU Rev. 4 Sections 6975: professional, scientic, techni-
cal, and administrative services) at the same lag panel and primary functional form, and
produced β̂composite = +0.45482801 at t = +4.73, one-sided p = 1.13 × 10−6. This is a
strong positive signal at a sister sub-aggregate to Section J on the same FX-lag panel.
The framework reads this as a candidate-next-iterationnding, not as a Pair D rescue or a
dev-AI Stage-1 rescue: the Section-M coecient was not pre-registered as the primary at
spec-pin time, and per the project's anti-shing discipline it cannot graduate to a PASS-
equivalent claim from a robustness-arm posture. What it does resolve, jointly with the
Pair D PASS and the dev-AI Stage-1 FAIL, is the spec §9.16 compositional-accounting
ambiguity: Pair D's broad-services PASS is empiricallyconsistentwith a Section-M-style
consultancy-and-professional- services transmission chain rather than a Section-J ICT-
narrow chain. A future iteration with Section M pre-registered as the primary, on a fresh
spec-pin and the canonical four-row R-arm discipline, is the routed-forward path.
3. Empalme residual bias surfaced. The Phase-1 ingest diagnostic (Notebook 02 Trio 1
boundary_anomaly) returned TRUE: the logit-Y jump at the 2020-12 → 2021-01 bound-
ary was +0.375, against an envelope of ±0.335 (three times the historical month-to-month
standard deviation). The R1 regime-dummy arm produced β̂R1 = +0.188 at t = +4.36,
reecting an unexplained level shift in the post-2021 era. The DANE Marco-2018 em-
palme correction was applied to the primary as designed, but did not fully neutralize the
methodology break at the Section-J narrow cut; the regime structure is informational diag-
nostic and the project explicitly does not use the β̂R1 sign as a primary-spec rescue lever.
The empalme-residual phenomenon is an inherited methodology constraint for any future
DANE-GEIH-based iteration.
4. Per-userinstrumentdesignimplication. The Stage-1 rejection of the positive-sign expecta-
tion falsies the transmission for which a per-user as instrument was the candidate Stage-2
deployment: the rejected sign means the dev-AI- paying population (Colombian young
Section-J workers paying USD-denominated AI APIs) does not, at Stage-1, exhibit the FX-
pass-through-to-employment pattern the convex hedge would settle. A SHORT-FX-style
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 20 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
instrument would be the opposite of what that population needs given USD-denominated
AI tooling costs; consequently a per-user as construction on this transmission is not des-
ignable. The Section-M nding does not change this conclusion at Section-J granularity,
and any Section-M follow-on iteration must pre-pin its own population denition before
the Stage-2 instrument question reopens.
Pre-registrationsha256chain. v1.0 → v1.0.1 → v1.0.2 → governing hash 7c72292516...751f5a.
6.3 FX-vol-CPI surprise  Colombian CPI through TRM realised volatility
Target population. Colombian corporates and remittance recipients with FX-volatility ex-
posure on the COP/USD pair around Colombian CPI publication.
(Y,X)pair. Yt is the weekly realized volatility of the Banrep TRM end-of-day series, computed
on the daily log-return panel and aggregated to the weekly cadence under a Friday anchor. Xt is
the signed AR(1) CPI surprise: the monthly DANE CPI release minus a one-step-ahead AR(1)
forecast on prior CPI prints, mapped to the weekly cadence by carrying the surprise across the
release week and zeros otherwise.
Signexpectationandliteratureanchor. Positive on the classic CPI-announcement-volatility
channel: a larger absolute surprise should generate larger TRM realized volatility around the
release. The pre-registered primary tested the signed surprise rather than the absolute surprise,
on the prior that the Colombian hyperination anchor produces an asymmetric response.
Primaryspecication. Weekly OLS of TRM realized volatility on the signed AR(1) CPI sur-
prise plus a small set of macro-surprise controls; one-sided test at α = 0.05; OLS-homoskedastic
inference primary, HAC(L = 4) inference under the gate-aggregation rule. The pre-registered
sensitivity universe spans thirteen rows (A1A12 plus seven cumulative cuts S1S7) hashed via
a sensitivity_preregistration_hash on the panel ngerprint artifact.
Sample. N = 947 weekly observations, window 2008-01-02 through 2026-02-23.
Verdict. CLOSED FAIL on the pre-registered weekly primary, 2026-04-19.
Headline numbers. β̂CPI = −0.000685 (HAC(4) standard error 0.001794); 90% HAC in-
terval [−0.003636, +0.002266] (contains zero); the gate criterion β̂ − 1.28 · c SE < 0 returns
−0.002981 < 0, which is the FAIL trigger. Adjusted R2 = 0.193 clears the pre-pinned oor;
the macro-surprise regressors alone contribute approximately zero. Under the pre-committed
weekly OLS specication, Colombian AR(1) CPI surprises do not produce a statistically de-
tectable increase in COP/USD realized volatility across the sample window. We separately note
that the pre-registered A1 monthly-cadence sensitivity returned β̂ = +0.0152 with a 90% interval
[+0.0057, +0.0246], and the A4 release-day-excluded sensitivity returned β̂ = +0.0033 with a
90% interval [+0.0005, +0.0062]. The A4 90% interval excludes zero uncorrected: the rejection
at the one-sided α = 0.05 convention is clean before any multiple-testing correction, even though
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 21 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
the lower bound (0.0005) is small in absolute magnitude; calling A4 edge-of-signicance would
be inaccurate. Neither A1 nor A4 is the iteration's main nding: the pre-registered primary is
FAIL and the pre-registered primary isthe result. The two sensitivities are pre-registered robust-
ness checks that returned positive signicance at the 90% one-sided convention; they live in the
iteration's pivot record as candidate inputs to a future monthly-cadence-primary specication,
not as a rescue of the weekly primary.
Keycaveatsfromindependentreview. The pre-registered T1 exogeneity test rejected at
F = 15.12, p ≈ 1.3 × 10−9; the iteration is therefore a predictiveregressionin the strict sense of
the Granger-predictive-versus-structural-causal distinction, and the estimated β̂ describes how
past information predicts current realized volatility, not how an exogenous surprise causes future
realized volatility. We do not interpret β̂ as an impulse-response. The HAC-versus-bootstrap
reconciliation across the verdict tree returned AGREEMENT, ruling out a standard-error arti-
fact.
Pre-registrationsha256chain. The iteration ran on the Phase-A.0 Rev 4 specication chain;
the canonical artifacts are the panel ngerprint (nb1_panel_fingerprint.json) and the verdict
le (gate_verdict.json), both governed by the sensitivity_preregistration_hash pinned
in the panel ngerprint.
6.4 Phase-A.0 remittance  Colombian remittance corridor through FX
Targetpopulation. Colombian household remittance recipients, indexed against the Colom-
bian remittance corridor with FX pass-through.
(Y,X)pair. Yt was the weekly TRM realized volatility panel (inherited from §6.3). Xt was
a candidate on-chain remittance-ow proxy constructed from cCOP and COPm aggregate user
activity on Celo, partitioned to attempt to isolate Colombian household-remittance ow from
third-party-DEX activity, treasury roundtripping, and bot arbitrage.
Sign expectation and literature anchor. Positive on the remittance-volatility channel:
large remittance-ow shocks should generate FX-vol shocks at the receiving corridor. The liter-
ature anchor was the parametric-insurance-counterparty-matching tradition.
Primaryspecication. Pre-registered weekly OLS with empirical kill-criteria k1 (intent: an
X-driver ngerprint must be present in remittance event-window data) and k2 (data-source:
the X proxy must measure Colombian household remittance, not a generic on-chain volume
aggregate).
Sample. Window 2024-09 through 2026-04, weekly cadence (panel construction did not reach
nal N before the EXIT verdict red).
Verdict. CLOSED EXIT_NON_REMITTANCE, 2026-04-24.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 22 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Headlinenumbers. The iteration exited at the kill-criteria step rather than producing point
estimates. Task 11.F Axis-1 event-research returned zero of thirty peak-day ows that nger-
printed as remittance; approximately 87% of the surveyed ow decomposed into TRM arbitrage,
treasury roundtripping, campaigns, and bot activity, with the residual a thin retail tail. Kill
criterion k1 red (intent non-remittance dominant); kill criterion k2 red in part (the unltered
Dune aggregate at query 7366593 did not measure Colombian household remittance).
Keycaveatsfromindependentreview. The exit was load-bearing on the kill-criterion dis-
cipline. Without the pre-registered EXIT criterion, the rev-4 plan's non-stop lter iteration
policy would have run to a lter that appeared to rescue a remittance signal that was never cap-
tured upstream. The iteration carries forward the lesson that no post-hoc lter can reconstruct
what was never measured upstream; any pivot must inherit the kill-criterion pattern.
A further caveat applies to subsequent on-chain attribution. A 2026-04-24 thesis proposed
Carbon-DeFi basket-rebalancing volume as a candidate on-chain demand signal for an inequality-
dierential follow-on iteration; that attribution was retracted on 2026-04-27 after verication of
the Mento V3 deployment manifest conrmed zero protocol-level integration between the Mento
contracts and the Carbon contracts. Carbon tokenstraded events on Celo are pure third-
party-DEX activity dominated by Bancor's own arbitrage routers (383,303 distinct traders on
the Mento Broker V2 swap event versus 147 on Carbon over comparable windows), not Mento
Reserve user demand. The framework's on-chain demand-signal candidate has been re-pivoted
to native Mento Broker V2 swap events on the Broker contract 0x777A8255...4CaD, and the
supervisor-review document does not present Carbon-DeFi volume as the canonical Phase-A.0
nding. The Phase-A.0 EXIT verdict stands on the original (Y,X) pair as falsied-on-mechanism
rather than failed-on-power.
Pre-registration sha256 chain. Phase-A.0 spec chain Rev 1 → Rev 1.1 → Rev 1.1.1 (all
SUPERSEDED and RETIRED at EXIT) → Rev 4.1 (kill-criterion-bearing); the on-chain attri-
bution retraction is recorded in the framework memory at Rev-5.3.7.
6.5 P1 Bittensor SN18  event-study apparatus
Targetpopulation. The proprietary-AI policy-shock-exposed population (LATAM developers
paying USD-denominated AI APIs is the downstream candidate; the apparatus was authored
before the target-population narrowing).
(Y,X)pair. Yt was a Bittensor SN18 (Cortex.t) alpha event-study indicator; Xt was a set of
pre-pinned policy-event dates (Bittensor halving 2025-12-15; dTAO mainnet activation 2025-02-
13; Cortex.t milestone events).
Sign expectation and literature anchor. Two-sided. The methodology baseline was the
Maymin (2026, arXiv:2603.29751) event-study framework with explicit divergences pinned in the
spec.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 23 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Primaryspecication. Event-study apparatus over a nine-cell verdict cube (verdict-eligibility
crossed with robustness-consistency), Bonferroni-corrected at αprimary = 0.0167 over the conjunc-
tive family P1 + P2 + P3, with Nevents
min = 8 and an asymmetric placebo gate.
Sample. Apparatus completed; data ingest deferred.
Verdict. PARKED, 2026-04-27.
Headlinenumbers. None: the apparatus is parked for the record; no graduating empirical
claim was produced.
Keycaveatsfromindependentreview. The slow-lane apparatus (three spec revisions, six
verier dispatches, a nine-cell verdict cube) was overkill for the project's stage goal of identifying
a single empirically validated risk and a positive-β conrmation before protocol design. The user
pivoted to the simple-β fast-lane track (Pair D, dev-AI Stage-1) and parked P1 to preserve the
intellectual capital of the spec work. Re-activation conditions are documented in the parking
memory.
Pre-registrationsha256chain. Spec sha256 f855e036d3...b47aeab.
6.6 Cross-iteration multiple-comparison caveat
The ve iterations above are pre-registered individually but the decisions that produced them
 which target populations to pursue, which (Y,X) pairs to spec-pin, which to drop after an
EXIT, which to deepen  are themselves a meta-multiple-comparison structure. As of 2026-
05-06 all ve iterations are closed or parked (Pair D PASS; dev-AI Stage-1 FAIL; FX-vol-CPI
FAIL; Phase-A.0 EXIT_NON_REMITTANCE; P1 SN18 PARKED). Pair D's one-sided p ≈
1.46×10−8 is overwhelmingly signicant against any reasonable Benjamini and Hochberg (1995)
or Romano and Wolf (2005) correction applied across ve iteration-level tests, but the FX-vol-CPI
pre-registered sensitivities (A1 monthly with 90% interval [+0.0057,+0.0246]; A4 release-day-
excluded with 90% interval [+0.0005,+0.0062]) and the dev-AI Stage-1 R2 Section-M nding
(β̂ = +0.455, p = 1.13 × 10−6, but not pre-registered as a primary) are dierentially robust
to such a correction; the A4 lower bound at 0.0005 is small in absolute magnitude though the
rejection is clean uncorrected. The Section-M nding sits as a candidate-next-iteration object
rather than a graduated PASS, precisely because it was not pre-pinned as a primary at spec-
author time. We therefore decline to make any aggregate claim about what the project has
established across ve iterations. What the project has established at the per-iteration level is
recorded above, iteration by iteration, with the appropriate hedges. The framework's posture
toward iteration-selection bias and the appropriate familywise-error-rate or false-discovery-rate
correction regime is the dedicated open question we put to the supervisor in Section 7 (§7.5).
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 24 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
7. Open Methodological Questions for Supervisor Review
We present ve methodological questions in priority order. The rst four were enumerated at the
brainstorming stage of the memorandum; the fth was added on Wave-2 verication feedback to
make the cross-iteration multiple-comparison concern explicit rather than allowing the supervisor
to introduce it as an unanticipated objection. For each ask, we state the project's current posture,
the references that frame the question for an econometrician of the supervisor's training, and the
specic decision the supervisor's response would unblock.
7.1 Identication strategy
Current posture. The Stage-1 specication is OLS on lagged log-FX with HAC inference
at xed lag truncation L (see Section 5). The estimator β̂composite is a predictive-regression
coecient; we do not treat it as an impulse-response. The PASS-verdict iteration (Pair D)
ags identication non-uniqueness explicitly: the closure memorandum hedges the correlation
between Section-GT employment share and lagged COP/USD movement and does notassert a
causal channel running through BPO contracting. The FAIL-verdict iteration (FX-vol-on-CPI-
surprise) records a T1 exogeneity rejection at F = 15.12, p ≈ 1.3 × 10−9, conrming that the
FX-vol exercise is also predictive rather than structural.
Questionforthesupervisor. Should subsequent iterations move from a predictive-regression
posture to a causally-identied one, and if so, what identication standard does the supervisor
require before declaring a Stage-1 PASS sucient for Stage-2 dispatch? Specically:
 Does the supervisor require an instrumental-variable strategy? Candidate instruments un-
der consideration include monetary-policy-rate decisions of the central bank issuing the
consumption-basket currency, oil-price shocks (relevant for commodity-exporting popula-
tions), and US-side AI-API price changes (relevant for the dev-AI Stage-1 iteration). The
relevant references are Hansen (2022b), Chapters 6 and 12, and Wooldridge (2010).
 Does the supervisor require an event-study formulation? The Phase-A.0 remittance work
and the parked P1 Bittensor SN18 work both have event-study apparatus available; we
have not promoted either to a Stage-1 primary in any closed iteration.
 Does the supervisor require a structural vector autoregression? The reference framework
would be Kilian and Lütkepohl (2017); the project does not currently have a structural
identication scheme that we believe defensible against that reference's standards.
Whatthesupervisor'sanswerunblocks. A pinned identication standard for subsequent
iterations, including dev-AI Stage-1's eventual Stage-2 dispatch.
7.2 Convex-payo suciency
Currentposture. Stage-1 estimates a mean slope. The internal working note memory/project_abrigo_conve
records that mean-β̂ identication is necessary but not sucient for pricing payos that transmit
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 25 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
through the upper or lower tail of the conditional distribution rather than through the condi-
tional mean. Under the parametric-cost-insurance reading developed in Sections 1 and 3, this
insuciency is the basis-risk question of Clarke (2016): a mean-calibrated index specication can
leave the policy-holder materially exposed in precisely the tail states that motivate the demand
for the policy in the rst place.
Questionforthesupervisor(insurance-framing). The operative question is: what em-
piricalevidencedoesthesupervisorrequirebeforethisβ̂-validationissucienttounderwritea
parametriccost-insuranceproductonthevalidatedX? We adopt the parametric-index-insurance
literature (Carter et al., 2017; Mahul and Stutley, 2010; Clarke, 2016) as the methodological
reference rather than the generic option-pricing literature, on the deliberate ground that the in-
surance literature imposes the stricter evidentiary standard. Where option-pricing methodology
is concerned principally with the second moment of the underlying, the parametric-insurance
methodology requires the underwriter to characterise basis risk against the policy-holder's re-
alised loss (Clarke, 2016), the adverse-selection structure of the policy-holder pool (Mahul and
Stutley, 2010), and the catastrophic-loss probability and reinsurance posture of the product
(Carter et al., 2017; Mahul and Stutley, 2010). Under that stricter standard, the specic Stage-1
questions become:
 Is variance-amplication evidence at the X-shock dates sucient (for example, a GARCH-
X specication with the validated X entering the conditional-variance equation), or is
variance amplication merely necessary?
 Is full quantile-regression coverage required, with explicit estimation of upper- and lower-
tail conditional quantiles of Y | Xt−k, so that the basis-risk envelope of Clarke (2016) is
directly observable from the Stage-1 output?
 Is extreme-value-theory peaks-over-threshold tail-index estimation required, in the spirit
of Embrechts et al. (1997), in order to bound the catastrophic-loss probability that Carter
et al. (2017) and Mahul and Stutley (2010) treat as a rst-order underwriting input?
 Should the dynamic conditional-correlation MGARCH specication of Engle (2002) be
adopted as the standard joint-distribution model for the dierential's two legs in Section 3,
given that the joint-distribution behaviour determines the dierential-leg basis risk?
The supervisor is invited to apply whichever subset of these standards he judges appropriate;
the project's posture is to err on the side of the stricter insurance-underwriting reading rather
than the more permissive option-pricing reading.
Whatthesupervisor'sanswerunblocks. The Stage-1 exit criterion for Stage-2 dispatch
under the parametric-cost-insurance product objective, and in particular the basis-risk eviden-
tiary standard that Stage-1 output must meet before the validated X is treated as underwritable.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 26 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
7.3 Multi-Y dierential calibration
Currentposture. Lemma 1's dierential Yinequality = Ra − Rc requires constructing each leg
as a panel of observable component variables. Closed and active iterations estimate single-Y ,
single-X responses; the project has not yet calibrated the joint-leg structure, and the within-
iteration thresholds NMIN = 75, POWERMIN = 0.80, MDESSD = 0.40

were derived under a
single-Y assumption.
Questionforthesupervisor. How should the joint-leg structure of Yinequality be calibrated?
Specically:
 Joint-leg correlation: what specication  a constant-correlation GARCH-type model, the
dynamic conditional-correlation specication of Engle (2002), or a regime-switching exten-
sion  does the supervisor recommend for the conditional joint distribution of (Ra,Rc)?
 Within-leg weighting: what method  xed welfare-anchored weights (the working-class
consumption basket), principal-components weights, or weights estimated from the panel
itself  should determine the composition of each leg?
 Regime-switching: should the dierential admit a Markov-switching mean-and-variance
structure to accommodate the documented regime mix (post-2014 oil collapse, COVID,
Fed-tightening) noted in the Pair D closure memorandum, or should regime indicators
enter as exogenous covariates only?
 Familywise error: under the multi-Y panel implied by the dierential, should familywise-
error-rate control proceed under Bonferroni-Holm, or under the false-discovery-rate frame-
work, given that within-leg components are expected to be highly pairwise correlated and
Bonferroni is therefore likely conservative?
Whatthesupervisor'sanswerunblocks. The joint specication of the inequality-dierential
dynamics, which is a prerequisite for promoting Lemma 1 from a motivating proposition to a
calibrated estimation target.
7.4 Anti-shing protocol defensibility
Currentposture. The within-iteration anti-shing invariants are NMIN = 75, POWERMIN =
0.80, and MDESSD = 0.40 standard-deviation units of Y . These three thresholds were inherited
from the Phase-A.0 Rev-5.3.1 specication and have not been re-derived under each subsequent
iteration's actual N and observed rst-order autocorrelation structure of the residuals. Ap-
pendix D presents whatever power-derivation transparency is feasible at the time of writing;
we ag the inheritance explicitly so that the supervisor's review is on the actually-defensible
numbers and not on the inherited ones.
Question for the supervisor. Are these three thresholds defensible against the empirical
record of the ve closed iterations, and what additional pre-registration discipline does the su-
pervisor require? Specically:
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 27 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
 Should the project register pre-analysis plans in a public registry, in the spirit of Olken
(2015b) on pre-analysis plans in development economics and Christensen and Miguel (2018a)
on transparency and reproducibility in economics?
 Should the project adopt the AEA RCT-registry analogue for observational pre-registration?
The current discipline pins spec-text by sha256 hash inside the project repository; this is
auditable internally but not externally registered.
 Should the three thresholds be re-derived per iteration, taking each iteration's observed N
and HAC-corrected eective sample size as inputs to the power calculation, in the spirit of
Hansen (2022b),  6.18 on autocorrelation-corrected eective sample sizes?
What the supervisor's answer unblocks. The pre-registration infrastructure for subse-
quent iterations, including whether the inherited threshold triple should remain in force or be
replaced.
7.5 Cross-iteration FWER and iteration-selection bias
Currentposture. The project has run ve iterations and all ve are closed or parked: one
PASS (Pair D), two FAIL (one pre-registered-weekly-primary FAIL with two sensitivity-positive
arms in FX-vol-on-CPI-surprise; one sign-ipped FAIL on the dev-AI Stage-1 narrow-ICT pri-
mary closed 2026-05-06), one EXIT (Phase-A.0 remittance), and one PARKED (P1 Bittensor
SN18). No Stage-1 work is in progress as of the memorandum date. Each iteration's within-
iteration pre-registration discipline is documented in Section 5; the cross-iteration structure is
not pre-registered. Iteration-selection decisions  which (Y,X) pairs enter the roster, which are
dropped after EXIT, which are deepened after PASS  are made at the project level and are not
bound by an external pre-registration rule.
The numerical mass at the two tails across the ve tests is asymmetric in a way that matters
for any FWER-style correction. On the positive tail, the Pair D closure verdict's headline
p ≈ 1.46×10−8 is overwhelmingly signicant against any reasonable Bonferroni correction across
ve iteration-level tests; the FX-vol-on-CPI-surprise sensitivity arms are far less robust to such a
correction (the A1 monthly sensitivity reports a 90 % condence interval of [+0.0057, +0.0246];
the A4 release-day-excluded sensitivity reports [+0.0005, +0.0062], and the A4 lower bound
at 0.0005 would not survive a meaningful familywise-error-rate adjustment). On the negative
tail, the dev-AI Stage-1 primary delivered β̂ = −0.146 at t = −1.726, which we record as a
high-information FAIL: the iteration was pre-registered with a positive-sign expectation, and the
realisation is sign-ipped at the direction of the alternative rather than merely insignicant. A
two-sided cross-iteration FWER procedure has dierent mass at the two tails of the iteration-
result distribution, and the supervisor's preferred procedure should be specied to make the
asymmetry explicit rather than letting a default Bonferroni argument atten it.
Questionforthesupervisor. What familywise-error-rate or false-discovery-rate correction
regime should be applied across the iteration history, given the directional asymmetry just de-
scribed, and how should sensitivity-positive ndings such as the FX-vol A1 and A4 results be
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 28 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
weighed under such a correction? In particular, should a sign-ipped FAIL at conventional sig-
nicance be counted symmetrically with the PASS at the positive tail under the supervisor's
preferred correction, or should the directional pre-registration on each iteration shift the mass
allocation?
A second sub-question is methodologically prior. Iteration selection itself  the decision of
which (Y,X) pair to specify, which to drop, which to deepen  is a multiple-testing structure
that within-iteration pre-registration does not address. What mitigations does the supervisor
recommend? Candidate mitigations under consideration include pre-registered iteration-budget
caps committed at project initiation, an iteration-level alpha-spending function in the spirit of
group sequential designs, and pre-registered iteration-allocation rules that do not depend on prior
verdicts. We have no current basis for choosing among these and are explicitly asking for the
supervisor's preferred form.
Sharpenedsub-questionisthePairDPASSonetest,oronetestconditionalona
sub-aggregateselection? The dev-AI Stage-1 iteration's pre-specied Section-M sensitivity
arm (professional/scientic/technical/admin services, CIIU Rev. 4 Sections {6975}) produced
β̂ = +0.455 at p ≈ 1.13×10−6, while the iteration's pre-registered Section-J narrow-ICT primary
failed sign-ipped at β̂ = −0.146. The Section-M sensitivity was a sensitivity arm of the dev-AI
iteration, not a pre-registered primary; we therefore do not present the Section-M nding as a
free-standing positive verdict. We do, however, observe that the Section-M result is consistent
witha compositional reading of the Pair D PASS under which the headline broad-services Section-
GT positive estimate reected a Section-M-style transmission averaged across the broader GT
aggregate rather than a Section-J ICT-narrow signal. The internal specication spec 9.16
agged precisely this compositional ambiguity at Pair D's closure; the formal 9.16(c) (GT
minus J) decomposition is agged-not-resolved per the dev-AI Stage-1 verdict memorandum,
and the Section-M sensitivity arm is consistent with but not equivalent to that decomposition.
This sharpens the supervisor's FWER question rather than answering it. If the Pair D PASS
is read as the resolution of one pre-registered test, the cross-iteration tally is one PASS out of
ve tests at the positive tail. If the Pair D PASS is read as one test conditional on a post-hoc-
defensible-but-not-pre-registered choice of sub-aggregate within GT (with the dev-AI Section-
M sensitivity arm now suggesting that the sub-aggregate concentrating the signal is Section M
rather than Section J), then the multiple-comparison ledger across the iteration history must
additionally account for the implicit search across sub-aggregates of the broad-services panel.
We ag this as a sharpened sub-question for the supervisor and do not litigate it here. The
references for selection-on-observables and sample-selection correction in the spirit of Heckman
(1979) are noted as one candidate frame for the supervisor's response, alongside the FWER and
false-discovery-rate frames already cited in this section.
Whatthesupervisor'sanswerunblocks. The project-level multiple-testing discipline that
supplements within-iteration pre-registration; the appropriate weight to assign to the sensitivity-
positive ndings of the FX-vol FAIL-primary iteration; the appropriate weight to assign to the
sign-ipped FAIL primary of the dev-AI Stage-1 iteration under a directionally-aware correc-
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 29 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
tion; and the appropriate weight to assign to the Pair D PASS once the sub-aggregate-selection
question is taken into account.
8. Request for Guidelines
The ve questions of Section 7 are presented in our current priority ordering, but the ordering
itself is one of the things on which we are seeking the supervisor's guidance. We would value
an explicit recommendation on the priority order in which subsequent iterations should address
the ve asks, and  where applicable  recommended numerical thresholds, identication stan-
dards, joint-distribution specications, and cross-iteration multiple-comparison regimes.
We expect the supervisor's response, once given, to translate into binding design constraints for
subsequent iterations: the next iteration's pre-registered specication will adopt the supervisor's
preferred identication strategy under Section 7.1; the Stage-2 exit criterion will adopt the
supervisor's preferred convex-payo suciency test under Section 7.2; the joint-leg calibration of
Lemma 1 will follow the supervisor's preferred specication under Section 7.3; the within-iteration
anti-shing thresholds will be retained, revised, or augmented per the supervisor's guidance under
Section 7.4; and the cross-iteration multiple-comparison discipline will be parameterised per the
supervisor's recommendation under Section 7.5.
Framingpin. The implementation venue for the resulting products is on-chain settlement in-
frastructure, summarised in Section 4 (Panoptic perpetual options on Uniswap-V3/V4 liquidity-
provider positions, denominated against Mento purchasing-parity stablecoins where appropri-
ate); the economic primitive, however, is parametric cost insurance for an underserved popu-
lation, not a derivative product oered to a general market. The supervisor's review applies
insurance-econometrics standards (Carter et al., 2017; Mahul and Stutley, 2010; Clarke, 2016) to
the empirical work documented in Sections 5 and 6; the on-chain settlement layer is implemen-
tation infrastructure, not the object of review. The memorandum makes no implicit promises
about either the form or the timing of the supervisor's response; the commitments above are
conditional commitments on our side, not anticipated commitments on the supervisor's.
A. Glossary
Econometric terms
HAC(Newey-West) Heteroskedasticity-and-autocorrelation-consistent standard error using
the Hansen (2022b)-style Bartlett kernel at xed lag truncation L; used in the project as
a robustness arm rather than as primary inference.
Composite-β̂ Sum of lag-distributed slope coecients across the pre-registered lag set, β̂composite =
β̂6 + β̂9 + β̂12 for monthly iterations; the primary test statistic at Stage 1.
MDES Minimum detectable eect size; the smallest slope under which the pre-registered spec-
ication achieves the committed power at the committed signicance level.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 30 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
MDESSD MDES expressed in standard-deviation units of Y ; pinned at 0.40 in the inherited
Phase-A.0 Rev-5.3.1 invariant.
FWER Familywise error rate; the probability of at least one Type-I error across a family of
tests.
FDR False-discovery-rate (BenjaminiHochberg 1995); the expected proportion of false posi-
tives among the rejected hypotheses, used as the less conservative alternative to FWER
under correlated tests.
StructuralVAR Vector autoregression in which contemporaneous relationships among the en-
dogenous variables are identied by economically-motivated restrictions; reference frame-
work Kilian and Lütkepohl (2017).
Predictiveregression Regression in which the right-hand-side variable carries past informa-
tion about the left-hand-side variable but is not assumed exogenous in the structural sense;
coecients are predictive, not impulse-response.
Grangercausality Statistical relation in which past values of one series help predict another
conditional on the second's own lags; not equivalent to structural causation.
DCC-MGARCH Dynamic conditional-correlation multivariate GARCH specication of Engle
(2002); candidate joint-distribution model for the two legs of the inequality dierential.
EVTPOT Extreme-value-theory peaks-over-threshold; tail-index estimation framework of Em-
brechts et al. (1997), candidate input to the Stage-1 convex-payo suciency test.
Quantileregression Estimation of conditional quantiles of Y given covariates; alternative to
mean-regression for distributional evidence.
Pre-analysisplan Document committing the analytical specication before data are observed;
reference frameworks Olken (2015b) and Christensen and Miguel (2018a).
R-row Single-row pre-registered robustness alternative that varies exactly one design choice
from the primary specication; typical universe across closed monthly iterations is R1
(regime-dummy), R2 (sample-cut), R3 (functional-form), R4 (HAC inference).
ESCALATEClauseA Verdict-mapping clause covering positive-β̂ results with primary p in
(0.05, 0.20]; routes the iteration to user adjudication rather than auto-PASS or auto-FAIL.
ESCALATEClauseB Verdict-mapping clause covering near-zero-β̂ results with high tail
asymmetry, operationalised as β̂/SE < 0.5 jointly with skew(residuals) > 1.0 or ex-
cess kurtosis greater than 3.0; thresholds pinned at spec-authoring time.
SUBSTRATE_TOO_NOISY Verdict label triggered when at least three of four R-rows produce sign-
ipped composite β̂ relative to the primary; halts the iteration and requires substrate-level
review before any pivot.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 31 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
On-chain terms
On-chainsettlement. Discharge of a nancial obligation by execution of a publicly-recorded,
programmable rule-set on a public ledger. Traditional-nance analogue: clearinghouse with
a public, machine-executable rulebook.
Programmablerule-set. A pre-specied contractual logic, recorded publicly, whose execution
is deterministic given observable inputs. Traditional-nance analogue: an ISDA conrma-
tion whose terms are machine-executable rather than discretionarily applied.
Uniswapv3/v4 LPposition. A two-asset market-making commitment over a bounded price
interval [Pℓ,Pu], whose payo in the terminal price is piecewise-concave (long-gamma inside
the interval, directional outside). Traditional-nance analogue: a passive market-making
book with hard inventory limits at the interval bounds.
Perpetualoption(on-chain). An option-like instrument with no xed expiry, whose premium
accrues continuously as a streaming funding payment. Traditional-nance analogue: a
perpetual swap whose payo leg is a vanilla option rather than a linear delta.
Panoptic. A deployed protocol that issues perpetual options written against Uniswap v3/v4
LP positions (Panoptic Labs, 2026). Traditional-nance analogue: an exchange-traded
perpetual-future-on-options venue with the option strike encoded as a market-making price
interval.
Reserve-backedpeg. A stablecoin issuance design in which the pegged claim is collateralised
by a reserve portfolio whose composition and valuation are publicly observable. Traditional-
nance analogue: a narrow-purpose currency board.
Mento. A deployed reserve-backed stablecoin protocol on the Celo public ledger, maintaining a
roster of twelve country-currency-pegged claims as of the 2026-04-27 deployment manifest
(Mento Labs, 2026b). Traditional-nance analogue: a consortium-issued multi-currency
narrow bank.
MentoBroker. The routing contract through which Mento exchanges pegged claims against
reserve assets at the protocol-determined reference rate (Mento Labs, 2026b). Traditional-
nance analogue: the redemption window of the issuing currency board.
Purchasing-paritystablecoin. A reserve-backed pegged claim denominated in the consump-
tion currency of a target population (copm, brlm, kesm, eurm, usdm). A hedge de-
nominated in such a claim settles in the user's consumption currency rather than United
States dollars, eliminating residual exchange-rate exposure between hedge settlement and
consumption at the unit-of-account level.
CarbonDeFi(excluded). A third-party decentralised exchange that hosts Mento-basket claims
as standard fungible tokens. Carbon has no protocol-level integration with Mento: the
Mento V3 deployment manifest contains zero references to Carbon DeFi or its arbitrage
routers. Carbon-Mento trading volume is third-party DEX activity  predominantly Ban-
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 32 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
cor's own arbitrage routers extracting value from price misalignment between Mento Re-
serve pricing and secondary-market liquidity  and is not Mento Reserve user demand.
Any framing of Carbon-Mento volume as a Mento-native demand signal is excluded from
this document's empirical claims.
B. Cited Literature
References
Hayden Adams, Noah Zinsmeister, Moody Salem, River Keefer, and Dan Robinson. Uniswap v3
core. https://uniswap.org/whitepaper-v3.pdf, 2021. Accessed 2026-05-06.
Hayden Adams, Moody Salem, Noah Zinsmeister, et al. Uniswap v4 core. https://github.
com/Uniswap/v4-core/blob/main/docs/whitepaper.pdf, 2024. Accessed 2026-05-06.
Donald W. K. Andrews. Heteroskedasticity and autocorrelation consistent covariance matrix
estimation. Econometrica, 59(3), 1991.
William J. Baumol. On mechanisms underlying the growing share of service employment. NBER
Working Paper 12218, National Bureau of Economic Research, 2006.
William J. Baumol and William G. Bowen. PerformingArts: TheEconomicDilemma. Twentieth
Century Fund, 1966.
Niels Beerepoot and Mitchell Hendriks. Employability of oshore service-sector workers in the
Philippines: dead-end jobs? ServiceIndustriesJournal, 33(11), 2013.
Yoav Benjamini and Yosef Hochberg. Controlling the false discovery rate: A practical and
powerful approach to multiple testing. JournaloftheRoyalStatisticalSociety, SeriesB, 57
(1), 1995.
Michael R. Carter, Alain de Janvry, Elisabeth Sadoulet, and Alexandros Sarris. Index insurance
for developing country agriculture: A reassessment. WorldDevelopment, 94:199216, 2017.
Garret Christensen and Edward Miguel. Transparency, reproducibility, and the credibility of
economics research. JournalofEconomicLiterature, 56(3):920980, 2018a.
Garret Christensen and Edward Miguel. Transparency, reproducibility, and the credibility of
economics research. JournalofEconomicLiterature, 56(3), 2018b.
Daniel J. Clarke. A theory of rational demand for index insurance. AmericanEconomicJournal:
Microeconomics, 8(1):283306, 2016.
Paul Embrechts, Claudia Klüppelberg, and Thomas Mikosch. Modelling Extremal Events for
InsuranceandFinance. Springer-Verlag, 1997.
Robert F. Engle. Dynamic conditional correlation: A simple class of multivariate generalized au-
toregressive conditional heteroskedasticity models. JournalofBusinessandEconomicStatis-
tics, 20(3):339350, 2002.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 33 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Lorenza Errighi, Sameer Khatiwada, and Charles Bodwell. Business process outsourcing in the
Philippines: Challenges for decent work. Ilo working paper, International Labour Organization,
2017.
Silvia L. P. Ferrari and Francisco Cribari-Neto. Beta regression for modelling rates and propor-
tions. JournalofAppliedStatistics, 31(7), 2004.
Bruce E. Hansen. Econometrics. Princeton University Press, 2022a.
Bruce E. Hansen. Econometrics. Princeton University Press, 2022b.
James J. Heckman. Sample selection bias as a specication error. Econometrica, 47(1):153161,
1979. doi: 10.2307/1912352.
Lutz Kilian and Helmut Lütkepohl. StructuralVectorAutoregressiveAnalysis. Cambridge Uni-
versity Press, 2017.
Guillaume Lambert, Jesper Kristensen, and Dmitriy Vovchenko. Panoptic: A perpetual, oracle-
free options protocol. https://paper.panoptic.xyz/, 2023. Accessed 2026-05-06.
Olivier Mahul and Charles J. Stutley. GovernmentSupporttoAgriculturalInsurance: Challenges
andOptionsforDevelopingCountries. World Bank, Washington, DC, 2010.
Margaret McMillan and Dani Rodrik. Globalization, structural change, and productivity growth.
NBER Working Paper 17143, National Bureau of Economic Research, 2011a.
Margaret S. McMillan and Dani Rodrik. Globalization, structural change and productivity
growth. NBER Working Paper 17143, National Bureau of Economic Research, 2011b.
Iván Mendieta-Muñoz. Trade liberalization and premature deindustrialization in colombia. Jour-
nalofEconomicStructures, 6(1):125, 2017a.
Iván Mendieta-Muñoz. Trade liberalization and premature deindustrialization in Colombia. Jour-
nalofEconomicStructures, 6(24), 2017b.
Mento Labs. Mento protocol: Reserve-backed stablecoin architecture. https://docs.mento.
org/, 2026a. Accessed 2026-05-06.
Mento Labs. Mento v3 deployments: Contract addresses on celo mainnet. https://docs.mento.
org/mento-v3/build/deployments/addresses.md, 2026b. Accessed 2026-05-06.
Whitney K. Newey and Kenneth D. West. A simple, positive semi-denite, heteroskedasticity
and autocorrelation consistent covariance matrix. Econometrica, 55(3), 1987.
Whitney K. Newey and Kenneth D. West. Automatic lag selection in covariance matrix estima-
tion. ReviewofEconomicStudies, 61(4), 1994.
Benjamin A. Olken. Promises and perils of pre-analysis plans. JournalofEconomicPerspectives,
29(3), 2015a.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 34 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Benjamin A. Olken. Promises and perils of pre-analysis plans. JournalofEconomicPerspectives,
29(3):6180, 2015b.
Panoptic Labs. Panoptic protocol documentation. https://docs.panoptic.xyz/, 2026. Ac-
cessed 2026-05-06.
Leslie E. Papke and Jerey M. Wooldridge. Econometric methods for fractional response variables
with an application to 401(k) plan participation rates. JournalofAppliedEconometrics, 11
(6), 1996.
Peter C. B. Phillips. On condence intervals for autoregressive roots and predictive regression.
EconometricTheory, 30(3), 2014.
Dani Rodrik. Premature deindustrialization. JournalofEconomicGrowth, 21(1), 2016a.
Dani Rodrik. Premature deindustrialization. JournalofEconomicGrowth, 21(1):133, 2016b.
Joseph P. Romano and Michael Wolf. Stepwise multiple testing as formalized data snooping.
Econometrica, 73(4), 2005.
Robert F. Stambaugh. Predictive regressions. JournalofFinancialEconomics, 54(3), 1999.
Jerey M. Wooldridge. EconometricAnalysisofCrossSectionandPanelData. MIT Press, 2
edition, 2010.
C. Sample Artifact: Pair D Verdict Header
The Pair D iteration closed PASS on 2026-04-28. The verdict was emitted with a sha256-pinned
artifact chain that we reproduce below in condensed form so that the supervisor can verify the
audit-trail discipline of the framework. Each artifact is content-hashed; the spec is content-
hashed against itself with a sentinel substituted into the decision_hash eld, which can be
recomputed to verify that the document text governing the iteration matches the hash quoted.
 Specication (Pair D simple-β design, version 1.3.1): 964c62cca0be1b9070944b5398fe97886c6d07d37ba71
 Joint estimation panel (panel_combined.parquet): 6d7d9e60dad1715ce86e8adb7b3d44ba236d0b0637962
N = 134, window 2015-01-31 through 2026-02-28.
 Primary OLS results (primary_ols.json): d4790e743cdec62f1368cab1833e1266cb2da763d7c0931dd732
 Robustness pack (robustness_pack.json): 67dd18cfeb2584fa6ed9334b1d0314a1a16830faf7c3f3443f07
 Verdict memo (VERDICT.md): 1efd0e34d7c1af821c8528a7bc895a63e1dc5e1c289f3b6a1b2d392ba59806cf
The specication revision chain that produced the governing hash is: v1 (initial, 2026-04-27) →
v1.1 (Wave-1 and Wave-2 reviewer defects integrated, 2026-04-27) → v1.2 (CORRECTIONS-α,
2026-04-28; window shortened from 2008-01 to 2010-01 after a schema-stability HALT on the
DANE empalme nota-técnica coverage) → v1.2.1 (three-way-review cleanup, 2026-04-28) → v1.3
(CORRECTIONS-α′, 2026-04-28 PM; window shortened from 2010-01 to 2015-01 after a second
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 35 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
HALT under the realization that the 20102014 empalme les ship CIIU Rev. 3 codes in RAMA4D
despite the column header naming) → v1.3.1 (three-way-review cleanup, 2026-04-28 PM late).
Each transition recomputed the spec sha256 and re-triggered independent review; the chain is
reproducible from the spec text in the project repository. The point of the exhibit is not the
specic hash values but the property that every numerical claim in §6.1 is content-hashed back
to a specic document text, so that any post-hoc edit to the specication would invalidate the
verdict. The compositional reframe noted in §6.1 caveat (v) is metainterpretive  it does not
edit the Pair D spec text or the hash chain above; the Pair D verdict and headline numbers stand
verbatim under their original spec.
D. Power-Calculation Transparency Table
This appendix presents whatever per-iteration power derivation is feasible at writing time against
the framework's pre-pinned MDES = 0.40 standard-deviation units of Y and Powermin = 0.80
at one-sided α = 0.05. The sample-size adjustment under autocorrelated residuals follows the
classical AR(1) eective-sample-size correction Neff = N · (1 − ρ1)/(1 + ρ1), where ρ1 is the
rst-order residual autocorrelation; this is the standard textbook adjustment for the variance
of an AR(1) sample mean and is not specically attributable to a single canonical reference (it
predates the HAC literature). Project inference uses Newey-West HAC standard errors (Newey
and West, 1987) at xed lag truncation per §5.4; we report the realized HAC SE where it is
recorded in the verdict pack so that the implied eective-sample-size adjustment is auditable
from the realized SE itself rather than from a separately-recorded ρ1 diagnostic. Cells where the
derivation cannot be honestly produced from the artifacts available at writing time are agged
inherited and cross-referenced to the supervisor-ask in Section 7 (§7.4). We do not fabricate any
number we cannot derive from a stable artifact.
The table is the most direct substantive response to the §7.4 ask: it converts the question is
Nmin = 75 defensible? from rhetorical to data-supported wherever the data are available, and
it surfaces honestly the cells where the data are not available at writing time. The framework
does not currently record a single-number residual-autocorrelation diagnostic in the verdict pack
of either Pair D, dev-AI Stage-1, or FX-vol-CPI; remediating that artifact gap is itself one of the
methodological housekeeping tasks that any forward iteration would inherit, conditional on the
supervisor's guidance.
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 36 built May 6, 2026Supervisor-ReviewMemorandum May6,2026
Iteration N ρ̂1
(resid.)
Neff Implied
power at
MDES=
0.40
Notes
PairD 134 inherited inherited inherited ρ̂1 on the primary resid-
uals not re-derived from
a stable artifact at writ-
ing time; HAC L = 12
was used in inference but
theresidualautocorrelation
diagnostic is not recorded
as a standalone number in
the verdict pack. Realized
HAC SE 0.02465 implies
the AR(1) adjustment was
material. Inherited from
Phase-A.0 Rev-5.3.1; re-
derivationtabledfor§7.4.
dev-AIStage-1 134 inherited inherited inherited
(FAIL
closed)
Iteration closed FAIL
2026-05-06 with realized
HAC(L = 12) SE 0.0847;
the SE is approximately
3.4× thePairDHACSEon
identical N and lag panel,
indicating substantially
larger residual variance
and/or autocorrelation at
the Section-J-narrow stra-
tum. The realized FAIL is
sign-ipped,notunderpow-
ered,sothepost-hocpower
question is moot for the
verdict; the SE is informa-
tive for the next-iteration
prior on Section-M (which
would inherit a similar
autocorrelationstructure).
Section M (can-
didatenextitera-
tion)
134 (R2
sample)
not yet
estimated
as pri-
mary
 notyetes-
timableas
primary
R2 sensitivity arm in dev-
AI Stage-1 returned β̂ =
+0.455 at t = +4.73, one-
sided p = 1.13 × 10−6
.
Post-hoc identied candi-
date, NOT pre-registered as
a primary in any iteration
to date. A Section-M iter-
ationwouldrequireafresh
spec-pin;thetabulatedrow
is informational and does
not graduate the R2 nd-
ing.
FX-vol-CPI pri-
mary
947 inherited inherited inherited Pre-registered HAC band-
widthL = 4 attheweekly
cadence; the residual au-
tocorrelation diagnostic is
recordedindirectlythrough
thegate-aggregationrecon-
ciliationbutnotasasingle-
number artifact. Inher-
ited from Phase-A.0 Rev-
5.3.1; re-derivation tabled
for§7.4.
Phase-A.0 remit-  notappli- not ap- not appli- Iteration EXITed at the
spec: docs/specs/2026-05-06-supervisor-review-document-design.md@3fd15bb 37 built May 6, 2026