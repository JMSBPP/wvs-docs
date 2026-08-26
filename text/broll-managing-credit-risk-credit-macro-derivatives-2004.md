---
sha256: 923c098a344e205e383f0457977613c658ac33f93bb4f95944c7c1e742d0d62e
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 54828
---
360 sbr 56 (4/2004)
Udo Broll/Gerhard Schweimayer/Peter Welzel*
MANAGING CREDIT RISK WITH CREDIT AND MACRO
DERIVATIVES**
ABSTRACT
We use the industrial organization approach to the microeconomics of banking, aug-
mented by uncertainty and risk aversion, to examine credit derivatives and macro deriva-
tives as instruments to hedge credit risk for a large commercial bank. In a partial-analytic
framework we distinguish between the probability of default and the loss given default,
model different forms of derivatives, and derive hedge rules and strong and weak separa-
tion properties between deposit and loan decisions on the one hand and hedging deci-
sions on the other. We also suggest how bank-specific macro derivatives could be
designed from common macro indexes which serve as underlyings of recently introduced
financial products.
JEL-Classification: G21.
Keywords: Banking; Credit Derivative; Credit Risk; Macro Derivative; Systematic Risk.
1 INTRODUCTION
Credit risk can be considered the oldest and most significant form of risk faced by
a commercial bank. Large-scale borrower default can force a bank into bank-
ruptcy. Therefore, managing credit risk has always been one of the prime chal-
lenges in running a bank.
For decades this challenge was met mainly through selecting and monitoring bor-
rowers and through creating a well-diversified loan portfolio. More recently, new
financial instruments and risk-sharing markets have evolved (see Neal (1996),
Bank for International Settlements (2001), Deutsche Bundesbank (2004)). Banks
and specialized consulting firms alike put a lot of effort into developing sophisti-
cated models (with fancy names such as Credit Metrics, Credit Monitor, Cred-
Schmalenbach Business Review ◆ Vol. 56 ◆ October 2004 ◆ pp. 360–378
* PD Dr. Udo Broll, Fakultät Wirtschaftswissenschaften, Technical University of Dresden, e-mail:
broll@iwb-dresden.de. Dr. Gerhard Schweimayer, Wirtschaftswissenschaftliche Fakultät, University
of Augsburg, and HypoVereinsbank AG, München, e-mail: gerhard@schweimayer.de. Prof. Dr. Peter
Welzel (corresponding author), Wirtschaftswissenschaftliche Fakultät, University of Augsburg,
e-mail: peter.welzel@wiwi.uni-augsburg.de.
** Paper presented at the 2003 conferences of the European Association for Research in Industrial
Economics, German Finance Association, and German Economic Association for Business Adminis-
tration. We are indebted to conference participants, and to seminar and workshop participants at
ZEW Mannheim, the Universities of Erlangen-Nürnberg and Augsburg and at HypoVereinsbank AG
for helpful comments and suggestions. Financial support of the German Research Foundation
(DFG) for Schweimayer and Welzel is gratefully acknowledged.Credit Risk
sbr 56 (4/2004) 361
itRisk+, or CreditSmartRisk) for measuring credit risk1. Markets for credit deriva-
tives virtually exploded during the 1990s. Data collected by the Bank for Interna-
tional Settlements which are probably broadest in coverage and have been cor-
rected for double-counting indicate an increase from $ 118 billion in mid-1998 to $
693 billion in mid-20012.
In its Credit Derivatives Report 2002, the British Bankers’ Association predicted an
increase of about 400% between the end of 2001 and the end of 2004. In this Lon-
don-dominated market, so-called credit default swaps (CDS) are the most popular
financial contracts, capturing nearly half of the market (British Bankers’ Associa-
tion (2002)). The CDS is a unique contract, based on a specific reference credit or
a pool of credits between a purchaser and a seller of protection against losses
from a credit event (default or other event). The buyer of protection removes
credit exposure while retaining ownership of the asset and paying a premium or
fee to the seller. If there is a credit event, the buyer usually makes a cash payment
to the seller. Following the International Swaps and Derivatives Association’s
(ISDA) conventions, credit events are typically defined as one or more of the fol-
lowing: bankruptcy, failure to pay, restructuring, repudiation, moratorium, obliga-
tion default, or obligation acceleration.
Against the background of this recent surge in the use of credit derivatives as
financial instruments to transfer credit risk from lenders to third parties, we ask
how the availability of such derivatives affects a bank’s decisions concerning inter-
est rates or loan and deposit volumes, and what can be said about the optimal
level of insurance against this type of risk. However, before addressing these
questions, we observe that it is by no means self-evident that credit risk is easy to
transfer. The informational advantage of the risk seller that is implicit in the rela-
tionship with the debtor creates a barrier to this kind of transaction. Furthermore,
capital market theory states that “credit risk has both an idiosyncratic and a sys-
tematic component”3, i.e., there is risk of creditor default that originates with the
creditor and from factors unrelated to the creditor. For example, systematic risk of
a loan may arise from the business cycle or from general political instability.
According to Wilson (1998) only a small number of macroeconomic factors are
sufficient to explain this type of risk, which determines most part of all risk related
to a loan contract.
From the Capital Asset Pricing Model (CAPM) and the Arbitrage Pricing Theory
(APT) we understand that systematic risk can not be diversified away but is trad-
able, but unsystematic risk ought to be eliminated through diversification.
Regional, sector, or institutional constraints may get in the way of this diversifica-
tion of a bank’s loan portfolio. Thus, risk diversification may be far from perfect
for, say, a bank focused on car or real estate financing, or a German savings or
cooperative bank which by its statutes is confined to a local market. Furthermore,
the information asymmetry makes it difficult to substitute risk selling for risk diver-
## 1 For a survey on credit risk measurement see Altman/Saunders (1997).
## 2 See Jeanneau (2002), p. 38.
3 Loubergé/Schlesinger (2002), p. 1.U. Broll/G. Schweimayer/P. Welzel
362 sbr 56 (4/2004)
sification. Seen from this angle, a credit default swap looks like a rather crude
instrument for reducing a bank’s exposure to credit risk.
Macro derivatives (sometimes also called economic derivatives), which are an
even more recent innovation in financial markets, might improve matters. They
enable a bank to sell the systematic, tradable part of a credit risk while retaining
the specific part which lies, due to informational aspects, in the core competence
of the bank4. For example, in October 2002 Deutsche Bank and Goldman Sachs
started to auction off derivatives on an U.S. retail sales index, a manufacturing
index, and on the change in U.S. non-farm payrolls (The Wall Street Journal
(2002)).
In this paper we use the industrial economics approach to the microeconomics of
banking to analyze the management of credit risk for a large bank that is active in
the deposit and loan markets. Although this approach does not explicitly account
for informational problems, our analysis of credit and macro derivatives that do
not exactly offset the bank’s credit risk nevertheless captures in a stylized way fea-
tures of optimal bank behavior under asymmetric information. For example, the
combination of uncertainty and asymmetric information suggests that the bank
retains some of the risk to give it an incentive for proper monitoring. We include
this retention of risk in all but one of our analyses.
We follow Wong (1997) by supplementing the industrial economics approach with
risk aversion and uncertainty, more specifically, by credit risk. For our assumption
of risk aversion and the need for active corporate risk management, we refer our
readers to the seminal work of Froot et al. (1993) and Froot/Stein (1998). Pausch/
Welzel (2002) provide an application to the banking industry, showing that if there
is a minimum capital requirement, even a per se risk-neutral bank exhibits risk-
averse behavior.
Our two main objectives are that first, we want to help close the gap between the-
oretical analysis and practice of credit derivatives as hedging instruments. We
explicitly model a credit default swap as the main instrument traded and show
how the design of the derivative affects its hedge properties and optimal bank
decisions. Second, we divide credit risk into a systematic and a specific part, and
introduce the notion of a macro derivative that can be used to hedge against sys-
tematic risk. Both the credit default swap and the macro derivative extend the
scope of banking from a mere buy-and-hold strategy to active management of
credit risk.
The plan of the paper is as follows: In Section 2 we present the basic model that
we use for an analysis of a credit default swap discussed in Section 3. In Section 4
we introduce a macro derivative as an alternative instrument to hedge against
credit risk. Section 5 concludes.
4 For macro derivatives see Marshall et al. (1992); Topping (2001); Schweimayer (2003).Credit Risk
sbr 56 (4/2004) 363
2 THE MODEL
Within the framework of the industrial economics approach to the microeconom-
ics of banking5, we consider a large bank in a one-period framework. The bank
takes deposits D and makes loans L. By “large” we mean a bank big enough to
influence interest rates both in the deposit and the loan market. Since we are not
interested in the strategic interactions between banks, we focus on a monopolistic
bank. As further motivation, we note the Neven/Röller (1999) estimates of a struc-
tural model of the type used below. These estimates indicate, for seven European
banking industries, that the hypothesis of noncooperative Nash competition can
be rejected and actual competition is closer to the collusive, i.e., monopolistic,
type.
Let the interest rate on loans rL(L) be negatively related to the loan volume L, i.e.,
drL(L)/dL = r′ L < 0. In analogy to this assumption of normal demand behavior we
also assume normal supply conditions that imply a positive relation between the
deposit rate rD(D) and the volume of deposits D, i.e., drD(D)/dD = r′ D > 0. The
bank also faces operational costs C(D,L) with strictly positive marginal costs C′ D
and C′ L.
Wong (1997) may have been the first author to introduce uncertainty and risk
aversion to this framework. We deviate from his analysis of credit risk by using an
endogenously determined non-stochastic deposit rate and adding hedge instru-
ments – a credit derivative or a macro derivative – to the model. We do not con-
sider the potential influence of credit risk through a rating of the bank on the cost
of refinancing, and we neglect a potential direct link between the bank’s decision
on a loan and the volume of deposits held by the loan applicant6.
Loans are subject to credit risk, which we model with a random variable θ ˜∈[0,1].
We want to emphasize the two components of credit risk: the default event
δ ˜∈{0,1} itself and the severity of default, the so-called loss given default (LGD)
λ̃= (θ ˜|δ ˜ = 1) ∈ (0,1]. More precisely,
(1)
Given a credit default, the bank loses a share λ̃ of the payment (1 + rL)L from its
debtors that is due at the end of the period. We note that we use as an implicit,
but important, simplifying assumption that credit risk θ ˜ is not affected by the level
of interest rates rL and rD, which result from the bank’s decisions.
To keep the notation as simple as possible, we do not consider a voluntary or
mandatory holding of reserves on deposits, as we ignore regulatory capital
requirements for loans7. The bank has a given equity capital K. The positive or
negative balance M of capital available, deposits received, and loans made is
˜ ˜ ˜ [ , ]. θ λ δ = ⋅ ∈ 0 1
## 5 See e.g. Freixas/Rochet (1997), chap. 3.
## 6 For a discussion of this kind of link see Chiappori et al. (1995).
## 7 For an analysis of capital requirements issues in the framework of the industrial economics
approach with credit risk see Pausch/Welzel (2002).U. Broll/G. Schweimayer/P. Welzel
364 sbr 56 (4/2004)
invested in or financed from an interbank market at a given deterministic interest
rate r 8. We abstract from a market risk in the bank’s refinancing operations. Capi-
tal, loans, deposits, and position in the interbank market are related via the bal-
ance sheet constraint
(2)
Denoting the uncertain end-of-period profit by Π̃, the bank’s profit function is
given by
(3)
Substituting for M from (2) and rearranging terms yields
(4)
where the first term includes the interest margin from the loan business corrected
for credit default, the second is the loss of principal due to default, the third term
is interest income from investing equity capital at the opportunity interest rate, the
fourth includes the interest margin from the deposit business, and the fifth
accounts for operating costs. The risk-averse bank management maximizes a von
Neumann-Morgenstern utility function U(Π) with U ′ > 0 and U ″ < 0.
3 CREDIT DERIVATIVES
As noted in the introduction, credit derivatives have become increasingly popular
hedges against credit risk. Since credit default swaps are by far the most widely
used, liquid instrument, we focus in this section on a stylized representation of
such a CDS.
We proceed in three steps: Initially a credit default swap is analyzed which pays
the (ex ante) random amount λ̃ per (marginal) contract in case of default, i.e., if
δ ˜ = 1 holds at the end of the period. Initially, we abstract from basis risk, which
amounts to assuming a perfect negative correlation between credit risk and the
credit default swap (3.1). In our second step we relax this assumption and exam-
ine the case of a CDS that carries so-called basis risk because its underlying risk is
not perfectly correlated with the bank’s credit risk (3.2). In step 3, we examine the
case of a CDS in which we replace the random payment by a conditional but con-
tractually pre-determined payment λH, more specifically, λ̃⬅ λ (3.3). We deter-
mine that the ability of a bank to hedge its credit risk depends crucially on the
specifics of the CDS at hand.
˜ ( ˜) ( ) ˜ ( ( )) ( , ), ∏ = − − ( ) − + + − − 1 θ θ r L r L L rK r r D D C D L L D
˜ ( ˜) ( ) ˜ ( ) ( , ). ∏ = − − + − − 1 θ θ r L L L rM r D D C D L L D
M L K D + = + .
## 8 For example, think of banks as local monopolists meeting only in a competitive interbank market.
Other interpretations for this given opportunity rate r found in the literature refer to a central bank
giving and taking money at this rate or to international capital markets offering this rate.Credit Risk
sbr 56 (4/2004) 365
3.1 HEDGING WITHOUT BASIS RISK
Under a typical credit default swap the protection buyer pays a premium to the
protection seller and receives the difference between face value and recovery
value, if the credit event defined by the contract occurs (Prato (2002)).
In our first step, we model this transfer of risk in the following way: As seller of
credit risk and buyer of protection, the bank pays a given premium θ
--
for one unit
of credit risk. By selling a volume H the bank makes a deterministic payment θ
--
H
in exchange for a stochastic claim θ ˜H at the end of the period9. This stochastic
claim offsets the loss due to credit default to an extent that is controlled by the
decision variable H. We note that this interpretation implicitly presumes rational
bank behavior leads to H > 0, which will be shown to be true later. The hedge
operation we describe contributes (θ ˜ − θ
--
)H to the bank’s profit. Therefore we
modify our profit definition (4) to arrive at
(5)
The definition in (5) is a correct representation of the profit, as long as credit
default swaps do not enter the balance sheet and therefore do not affect the bal-
ance sheet constraint (2). The bank management’s decision problem can then be
described in terms of the expected utility maximization problem
(6)
Since we model the bank as a monopolist in both the deposit and the loan mar-
kets, quantity setting is equivalent to setting interest rates in these two markets.
Therefore, we formulate the whole problem in terms of quantities.
To simplify our exposition, we suppress the optimal value arguments of the func-
tions rD, rL and C in the sequel. (6) leads to first-order necessary conditions for D,
L and H:
(7)
(8)
(9)
Inspection of (7), (8) and (9) leads to the following
Proposition 1 Given a credit derivative with perfect negative correlation with the
bank’s exposure to credit risk, (a) the bank can separate its decision on credit risk
E U ′ ∏ − [ ]= ( ˜ *)(˜ ) θ θ 0
E U r r r L C L L L ′ ∏ − − + − ′ − − ′ [ ]= ( ˜ *)(( ˜) ( ˜) * ˜ ) 1 1 0 θ θ θ
E U r r r D C D D D ′ ∏ − − ′ − ′ [ ]= ( ˜ *)(( ) * 0
max ( ˜ ) .
, , D L H
U E ∏ [ ]
˜ ( ˜) ( ) ˜ ( ( )) ( , ) (˜ ) . ∏ = − − ( ) − + + − − + − 1 θ θ θ θ r L r L L rK r r D D C D L H L D
## 9 To keep the model as simple as possible we assume that the premium is paid at the end of the
period, so there is no need for discounting.U. Broll/G. Schweimayer/P. Welzel
366 sbr 56 (4/2004)
management from its decisions on deposit and loan volumes; (b) the bank fully
hedges its credit risk exposure, if the market for the credit default swap used as
hedge instrument is unbiased.
Proof (a) Substituting E[U ′(·)θ
--
] for E[U ′(·)θ ˜] from (9) into (8), rearranging terms,
and dividing by E[U ′(·)] in both (7) and (8) yields two deterministic equations in
D and L which we can solve for the optimal values D* and L*:
(10)
(11) .
As the system (10)–(11) is totally independent from H* and contains no stochastic
term, the “production” decisions on deposit and loan volumes can be separated
from the risk management decision on the hedging volume.
(b) Using the covariance decomposition Cov(X,Y) = E(XY) − E(X)E(Y), we can
write (9) in the form
(12)
If the market for the CDS is unbiased, i.e. E(λ̃· δ ˜) = E(θ ˜) = θ ˜, then (12) is equiva-
lent to Cov[U ′(Π̃*)θ ˜] = 0, which can only be true for a deterministic bank profit
Π*. This in turn implies that the bank has no exposure to risk. From (5) we con-
clude that H* = rLL* + L*, i.e., the bank in the optimum completely hedges its risky
position in the loan market, it uses a full hedge. q.e.d.
Part (a) of Proposition 1 is an example for the well-known (Fisher) separation
property in the presence of a hedging instrument without basis risk. This insight is
familiar from analyses of optimal firm behavior under uncertainty. Thus, the bank
will choose the same volumes of deposits and loans under uncertainty as it will in
the case of a deterministic default rate at level θ
--
= E(θ ˜) (certainty equivalence). In
contrast to a weaker notion of separation that we derive later in our paper, we call
this “strong” separation. Our analysis includes as a special case the situation with a
deterministic default rate E(θ ˜). First-order conditions for this case are given by (7)
for D* (after dividing by E[U ′(·)], and (1− E(θ ˜))(rL + r′ LL*) − E(θ ˜) = r + CL′ for L*).
These are the familiar conditions of equality between marginal revenues and mar-
ginal costs in the deposit and loan markets. A stochastic default rate affects only
the latter optimality condition by an additive term Cov[U ′(·),θ ˜] · (rL + r′ LL* + 1)/
E[U ′(·)] on the right-hand side. Due to U ′′ < 0, the sign of this covariance is posi-
tive.
Closer inspection shows that under increasing marginal costs and in the absence
of an instrument to hedge credit risk, uncertainty about the default rate unambigu-
ously implies a lower loan volume. However, the impact on the deposit volume
depends on the cross derivative C′′ DL, i.e., on economies or diseconomies of
scope between taking deposits and giving loans.
Cov
E[
E
′ ⋅ [ ]
′ ⋅
+ =
U
U
( ), ˜
( )]
(˜) .
θ
θ θ
( )( *) 1− + ′ − = + ′ θ θ r r L r C L L L
r r r D C D D D = + ′ + ′ *Credit Risk
sbr 56 (4/2004) 367
Returning briefly to our separation result, we note that the optimality conditions
(10) and (11) contain the familiar Lerner Index (price minus marginal cost divided
by price) formulation10.
(13)
(14)
where εD = (dD/drD)rD/D and εL = −(dL/drL)(rL/L) are the elasticities of deposit
supply and loan demand, respectively, and the term −θ
--
on the left-hand side of
(14) accounts for the marginal loss of principal if there is loan default.
The assumption of unbiasedness of the hedging market that we use in part (b) of
Proposition 1 is a simplifying one. It defines a benchmark case in a derivatives
market where buyers of risk are a large number of well-diversified investors. Intro-
ducing a constant risk premium would lead to an optimal hedge below the full
hedge, and would do so without substantially changing our analysis. The more
challenging task of endogenizing the price of the credit derivative, i.e., explicitly
including the derivatives market in the model, is beyond the scope of this paper.
However, this is an issue which ought to be addressed in future research because
market data shows that banks which we consider sellers of risk also play a major
role on the buying side of the derivatives market.
3.2 HEDGING WITH BASIS RISK
In our introduction we mentioned that a complete transfer of credit risk from the
bank as initial lender to a third party is hard to imagine. We capture the notion of
nontradable risk by introducing so-called basis risk into our model.
The most important causes of basis risk discussed in the literature are differences
in the maturities of the hedging instrument and the bank’s risky position, and dif-
ferences in the stochastic properties between the underlying risk of the hedging
instrument and the risk the bank faces. In the case of credit risk, the first problem
could arise when the derivatives contract matures at an earlier date than the
underlying loan contract. However, this mismatch is not only beyond the scope of
our one-period model, but should also be of relatively minor importance, since
credit derivatives are traded over the counter, enabling the contracting parties to
adequately match maturity dates.
We believe that the second cause of basis risk is more relevant in our framework.
Information asymmetries related to the individual loan contract create an unsys-
tematic component of credit risk, put potential buyers of credit risk at an informa-
tional disadvantage, and make a complete transfer of credit risk to a third party
( )
( )
,
1
1
1 − − − − ′
−
=
θ θ
θ ε
r r C
r
L L
L L
r r C
r
D D
D D
− − ′
=
1
ε
,
10 See Freixas/Rochet (1997), p. 58.U. Broll/G. Schweimayer/P. Welzel
368 sbr 56 (4/2004)
hard to imagine. This problem is augmented by the fact that the unsystematic part
of credit risk may be hard to diversify for the institutional reasons mentioned ear-
lier. In essence, this means that a bank will not be able to find a hedging instru-
ment that perfectly offsets the credit risk it currently holds. Our approach to mod-
eling this in a stylized way is to add basis risk to our model.
We consider the availability of a credit default swap at a given price as before. To
model basis risk we introduce the following modification: The market no longer
uses the share of nonperforming loans θ ˜, but a share g̃ as underlying of the deriv-
atives contract. g̃ can be interpreted as the portion of loans that are nonperforming
due to systematic risk. From this definition we see that the two risks are not nec-
essarily independent. We assume regression dependence between the two random
variables (see Benninga et al. (1984)), i.e.,
(15)
where b ≥ 0, β > 0, and s̃ is a zero mean noise term stochastically independent
from g̃ 11. For each unit of the credit derivative sold, the bank makes a determinis-
tic payment g - - in exchange for the stochastic amount g̃.
We assume that the derivatives market is unbiased, i.e., E(g̃) = g - - with g - - denoting
the market price of the underlying chosen by the contracting parties. This prop-
erty implies θ
--
= βg g - -, where we assume b = 0 without loss of generality.
Suppressing arguments of rD and rL, we can now rewrite the bank’s profit as
(16)
Maximization of expected utility yields (7) and (8) as in the case without basis
risk. However, we replace condition (9) for the optimal hedge volume with
(17)
Inspection of the first-order conditions leads us to
Proposition 2 (a) In the presence of basis risk in an unbiased CDS market, the
bank hedges a portion β of its risky position rLL* + L* (beta-hedge rule). (b) The
usual separation property no longer exists. Instead, a weaker notion of separation
holds. (c) In the absence of economies or diseconomies of scope, the optimal vol-
ume of deposits D* can be determined as in the case of certainty.
Proof (a) Unbiasedness of the derivatives market implies that (17) can be written
as [U ′(Π̃*),g̃ ] = 0. Replacing Π̃* by (16) and using (15) yields
(18)
Cov const ′ − + − + − + [ ]= U s r L L g r L L H g L L ( ˜( * *) ˜( * * *) ), ˜ . β β 0
E ′ ∏ − [ ]= U g g ( ˜ *)(˜ ) . 0
˜ ( ˜) ˜ ( ) ( , ) (˜ ) . ∏ = − − ( ) − + + − − + − 1 θ θ r r L L rK r r D C D L g g H L D
˜ ˜ ˜, θ β = + + b g s
## 11 One of our referees pointed out that the level of unsystematic risk might be negatively related to
the loan volume or the number of loans due to diversification effects within the bank’s loan portfo-
lio. We acknowledge this point in principle, but stress that a dependence of Var(s ˜) on L does not
affect our hedge rule derived below.Credit Risk
sbr 56 (4/2004) 369
Due to the stochastic independence of s̃ and g̃ this can only be true, if
(19)
(b) Inserting (15) and the optimal hedge rule (19) into the first-order condition (8)
for loans shows that L* still depends on probabilities and risk preferences, even if
D* were known. This in turn implies from (7) that D* also cannot be determined
unless we know the probabilities and risk preferences. We need more than market
data to decide the optimal loan and deposit volumes. Therefore, the traditional
result of separation of production and risk management no longer holds. How-
ever, we note that the optimal hedge rule derived holds for any pair (D,L). There-
fore, we can imagine a bank choosing loan and deposit volumes arbitrarily (or on
the basis of a simulation) and still minimizing its risk exposure by applying the
beta-hedge. Although the bank may find it impossible to determine the optimal
values of D* and L* in the presence of basis risk, it can still separate its hedging
decision from its production decisions. We call this a weak notion of separation.
(c) Inspection of (7) shows that for C″
DL = 0, i.e., neither economies nor disec-
onomies of scope, D* can be determined on the basis of market data alone, i.e.,
without knowledge of probabilities, risk preferences, or the bank’s hedging deci-
sion. q.e.d.
3.3 HEDGING WITH A FIXED PRE-DETERMINED PAYMENT
We now examine another situation in which the bank cannot perfectly sell all its
credit risk even if it wishes to do so. We consider the case of an insurance seller’s
fixed predetermined payment to the insurance buyer, i.e., the bank, if the seller
defaults. This is a situation we can find in real-world CDS markets, particularly
when the bank transfers the risk of individual loans, a situation in which a deter-
ministic recovery value is included in the CDS contract, making the payment,
defined as face value minus recovery value in case of default, also deterministic.
We denote this payment by the deterministic variable λ, which we normalize to 1.
This assumption creates no loss of generality because H can always be adjusted to
meet the bank’s preferences. After replacing θ ˜ in (5) by λδ ˜ = δ ˜ the profit function
can be rewritten as
(20)
where θ
--
again denotes the given price of the (modified) CDS. The optimality con-
dition (9) is replaced by
(21)
(22)
Cov
E
E
′ ⋅ [ ]
′ ⋅ [ ]
+ =
U
U
( ), ˜
( )
(˜) ,
δ
δ θ
E ′ ⋅ − [ ]= ⇔ U ( )(˜ ) δ θ 0
˜ ( ˜) ˜ ( ) ( , ) (˜ ) , ∏ = − − ( ) − + + − − + − 1 θ θ δ θ r r L L rK r r D C D L H L D
β =
+
H
r L L L
*
* *
.U. Broll/G. Schweimayer/P. Welzel
370 sbr 56 (4/2004)
where E(δ ˜) is equal to the probability of the default event Pr(δ ˜ = 1) because
δ ˜∈{0,1}.
Condition (22) explicitly accounts for the role of the default probability when
determining the optimal hedge against credit risk.
We are now in a position to prove
Proposition 3 An optimal decision D*,L*,H* with a CDS paying a pre-determined
fixed amount in the credit event has the following properties:
(a) A perfect hedge is not possible, i.e., even with the optimal hedge position in
the derivatives market, the bank still retains credit risk.
(b) There is no simple hedge rule even for an unbiased CDS market. Neither
strong nor weak separation between deposit and loan volumes on the one hand
and hedging volume on the other holds. The optimal values of all three decision
variables depend on probabilities and risk preferences.
(c) If the market for the credit derivative is unbiased, the optimal hedge volume
H* is (i) in the interval (E(λ̃ )(1 + rL)L*,(1 + rL)L*], if the utility function has the
property U ′″ > 0 (prudence), (ii) in the interval [0,E(λ̃)(1 + rL)L* for U ′″ = 0, and
(iii) equal to E(λ̃)(1 + rL)L*, if U ′″ = 0 (quadratic utility function).
Proof (a) Clearly, with a fixed amount to be paid to the bank in case of default
and a stochastic loss given default, there can be no perfect hedge that eliminates
all risk.
(b) Using unbiasedness (E(δ ˜) = θ
--
), we can simplify (22) to Cov[U ′(Π̃*),δ ˜] = 0,
which in turn can be written as
(23)
Contrary to (18) where we examined basis risk, (23) does not lend itself to the
derivation of a simple, general hedge rule. We can no longer use the first-order
condition (21) for H* to eliminate E[U ′(·)θ ˜] from (8). L* depends on probabilities
and risk preferences, and on the optimal value H*, implying that for C″
DL ≠ 0 D*
also cannot be determined unless we know the probabilities, risk preferences, and
H*. As we noted earlier, more than market data is required to decide the optimal
deposit, loan, and hedging volumes in this fully interdependent system.
(c) For a given L* and for arbitrarily fixed U ′(·) we show that we can choose a
volume H* such as to obtain Cov[U′(Π̃),δ ˜] = 0 even though U ′(Π̃) obviously
depends onδ ˜12. Moreover, an optimal value H* must lie in the superset
[0,(1 + rL)L*] which can be narrowed down by applying Jensen’s Inequality when
Cov const ′ − + − + ( ) [ ]= U H r L H L
˜ * ( )˜˜ * * , ˜ . δ λδ θ δ 1 0
## 12 We note that independence implies Cov(·,·) = 0, but the converse is not true in general. The proof
exploits the relation E[U ′(∏
∼
|δ̃=0)] = E[U ′(∏
∼
|δ̃=1)]⇔Cov[U′(∏
∼
),δ ˜] = 0.Credit Risk
sbr 56 (4/2004) 371
we impose appropriate conditions on the third derivative of the utility function.
We write the profit definition (20) in the form Π̃= δ ˜H − (1 + rL)λ̃δ ˜L* − θ
--
H. For
given values δ ˜ = 0 and δ ˜ = 1 we conclude
(24)
We assume that E[U ′(Π̃|δ ˜ = 1)] is a twice differentiable and strictly decreasing func-
tion f(H). Further, we consider g(H) = E[U ′(const − θ
--
H)] as a twice differentiable
function that is strictly increasing, as θ
--
> 0. Let H1 = 0 and H2 = (1 + rL)L*. For these
values we get
(25)
By the intermediate value theorem of Bolzano ∃H ∈[0,(1 + rL)L*]: f(H) − g(H) = 0,
i.e., E[U ′(Π̃|δ ˜ = 0)] = E[U ′(Π̃|δ ˜ = 1)]. In addition, ∀H ∉[0,(1 + rL)L*] the necessary con-
dition Cov[U ′(Π̃),δ ˜] = 0 does not hold, because f − g is strictly decreasing. There-
fore, as H* is an optimal value, we obtain [0,(1 + rL)L*] as a superset. This interval
can be further narrowed by using Jensen’s Inequality E[U ′(X)] > U ′[E(X)],
E[U ′(X)] < U ′E(X)], and E[U ′(X)] = U ′E(X)] for U ′″ > 0, U ′″ < 0, and U ′″ = 0, res-
pectively. We focus our interest on the case of prudence, i.e., U ′″ = 0; we can
obtain the results for the other two cases analogously. For arbitrary H and δ ˜ = 0.
(26)
holds. Setting again H = E(λ̃)(1 + rL)L* + ε with ε ∈⺢, and δ ˜ = 1 leads to
(27)
Thus, equality can be achieved with ε > 0 only. Therefore, H > E(λ̃ )(1 + rL)L*
holds. Taking into account the superset determined before, we arrive at H ∈(Ε(λ̃)
(1 + rL)L*,(1 + rL)L*]. q.e.d.
Despite this rather pessimistic result for simple rules for the production and hedg-
ing decisions of a commercial bank, we note that our first-order conditions sug-
gest a numerical or simulation approach that could lead to deposit, loan, and
hedging volumes. (22) implicitly defines an optimal hedge H* as a function of
deposit and loan volumes. That is influenced by risk preferences and probabilities.
E E const
E const
const E const
′ ∏ 




 

  = ′ − + + − ( ) [ ]
> ′ − + + − ( )
= ′ + − ( ) ′ − ( ) [ ]
| = ′′′ > ∀
≥
<
≤
>
U U H r L H
U H r L H
U H U H
U
L
L
˜ ˜( ) *
( ˜)( ) *
.
˜
, δ ε
λ θ
λ θ
ε θ θ
ε
ε
1 0
1
1
0
0
E E Const [ ( ˜ )] [ ( )] ˜ ′ ∏ = ′ − | =
U U H δ
θ 0
f H U H r L
U H g H
f H U r L H
U H g H
L
U
L
U
( ) ( ) *
( ) ( )
( ) )( ) *
( ) (
˜ ( , ],
˜ ( , ],
1 1
0 1 0
1 1
2 2
0 1 0
2 2
1
1
= ′ − − + ( ) [ ]
> ′ − =
= ′ − + + − ( ) [ ]
≤ ′ − =
∈ ′′ ′ <
∈ ′′<
E const
const
E (1 const
const
θ λ
θ
λ θ
θ
λ
λ
) ).
˜ ˜
˜ ˜ ( ) * .
˜
˜
δ θ
δ λ θ
δ
δ
= ⇒ ∏ = −
= ⇒ ∏ = − + + −
| =
| =
0
1 1
0
1
const
const
H
H r L H LU. Broll/G. Schweimayer/P. Welzel
372 sbr 56 (4/2004)
We denote this hedge volume by a function H(D*,L*) and replace H* in (8) by
this function. (7) – (8) is then a system in D* and L*. However, it depends on the
utility function (risk preference) and the probability distributions of δ ˜ and λ̃. In a
very weak sense we could interpret this result as the return of our weak separa-
tion property, now in the framework of a simulation approach. But we need to
emphasize that to make practical use of this insight, we would have to specify the
bank management’s von Neumann-Morgenstern utility function and to simulate
the distributions of credit event and loss given default.
Although we are not able to theoretically identify an intuitive hedge rule (like the
beta-hedge before) for a CDS with a pre-determined fixed payment in case of
default, we can at least present intervals for the optimal hedge volume, and if
there is prior knowledge about the third derivative of the utility function, narrow
the bank’s choice. We note that this derivative has meaningful and intuitive inter-
pretation: The term “prudence” was introduced by Kimball (1990) for U ′″ > 0 to
capture the “propensity to prepare and forearm oneself in the face of uncertainty”.
Menezes/Wang (2002) emphasize that prudence is equivalent to downside-risk
aversion. Huang (2002) offers a further useful interpretation. Huang relates “risk
aversion” to investment, “prudence” to the incentive for saving, and “cautiousness”
to the hedging of risk. He posits that “if an investor is always more prudent than
the others, given that her marginal utility of infinite consumption is zero, then
he/she will be always more risk-averse than the others”. We can regard an
investor with U ′″ > 0 as downside-risk averse, U ′″ = 0 as downside-risk neutral,
and U ′″ < 0 as downside-risk loving. We note that U ′″ = 0 implies a quadratic
utility function, and U ′″ > 0 should be considered the normal case.
We conclude this section by observing that optimal decisions become much more
difficult if credit default swaps offer a predetermined fixed payment rather than a
payment (perfectly or imperfectly) correlated with the risky position. Readers may
wonder why, if it makes optimal behavior so cumbersome, there can be such a
design of credit derivatives in real-world markets.
For an intuitive explanation, we return to the issues of the information asymme-
tries that are tied to loan contracts. If there is a joint problem of sharing uncer-
tainty (between the bank and the third party willing to take on credit risk) and
providing incentives (for proper monitoring of the loan), then conventional wis-
dom from incentive theory suggests that in an optimal arrangement the bank
ought to retain some of the risk. This type of behavior is exactly what our analysis
suggests for the form of CDS that we have examined in this section.
4 MACRO DERIVATIVES
It is commonly acknowledged that systematic credit risk is primarily driven by
macroeconomic conditions (see Wilson (1998)), but unsystematic risk arises from
specific properties of the debtor that are independent of the market. Since the
bank normally has a close relationship with a debtor, there is information asym-
metry vis-à-vis the capital market, and thus the bank has a comparative advantageCredit Risk
sbr 56 (4/2004) 373
in managing specific credit risk. Because of these information problems, specific
credit risk should not, and probably cannot be, sold.
To capture this idea, we now split up our random variable θ ˜, capturing a system-
atic and a specific part of credit risk
(28)
where, in analogy to capital market theory, we include a parameter β to describe
how closely the credit risk of a given loan or loan portfolio follows systematic
risk. Unfortunately, these components in general, and θ ˜syst in particular, are not
directly observable, but must be inferred from macroeconomic indicators.
Suppose there is a vector of observable macroeconomic variables (x̃1,…x̃k) that
can be aggregated into a macroeconomic index g̃ by an aggregation function A(·)
such that
. (29)
For the moment we take this aggregation as given and carry on with the variable
g̃. We interpret g̃ as systematic risk, i.e., θ ˜syst = g̃ and introduce a random variable s̃
stochastically independent from g̃ to capture specific risk, i.e., θ ˜spec = s̃. Our speci-
fication of credit risk is then
(30)
Although this is an idealized assumption, in reality there should be at least a suffi-
cient approximation θ ˜syst ≈ g̃ at hand. Since in our model of credit risk we require
θ ˜ ∈[0,1], the logistic distribution looks like a natural choice, leading to the logistic
regression.
We now consider a macro derivative that we call a “macro default swap” (MDS)
with underlying g̃. The bank’s profit function is13
(31)
where g - - is the given market price of the hedge instrument. We note that (31) is
identical to (16), i.e., the bank’s decision problem with the macro derivative MDS
is formally equivalent to the one with the credit default swap with basis risk.
Assuming unbiasedness in the derivatives market, which means E(g̃) = g - -, the first-
order conditions are then given by (7), (8), and (17), where we need to replace θ ˜
in (8) by βg̃ + s̃. This immediately leads to our
Proposition 4 Given an unbiased market and a macro derivative with an underly-
ing that matches the systematic part of credit risk (a) a perfect hedge is not possi-
ble because the specific part of credit risk is not sold, (b) the bank hedges a por-
tion β of its risky position rLL* + L* (beta-hedge rule), if β describes the influence
of systematic risk on total credit risk according to (30). (c) Weak separation holds,
i.e., the bank is able to decide deposit and loan volumes first, and then use opti-
˜ ( ˜) ˜ ( ) ( , ) (˜ ) , ∏ = − − ( ) − + + − − + − 1 θ θ r r L L rK r r D C D L g g H L D
˜ ˜ ˜. θ β = + g s
˜ (˜ , , ˜ ) [ , ]) g A x xk = … ∈ 1 0 1
˜ ˜ ˜ , θ βθ θ = + syst spec
13 We assume an MDS is treated as an off-balance-sheet product like the CDS considered earlier.U. Broll/G. Schweimayer/P. Welzel
374 sbr 56 (4/2004)
mal risk management. (d) In the absence of economies or diseconomies of scope,
the optimal volume of deposits D* can be determined as in the case of certainty.
Proof Given the perfect analogy to Proposition 2, the proof is almost identical to
the one for Proposition 2.
(a) Since only a derivative on the systematic part of credit risk is traded, the bank
retains risk even if it uses its optimal hedge.
(b) Unbiasedness of the derivatives market, i.e., E(g̃) = g - - implies Cov[U ′(Π̃*),g̃] = 0
which, after inserting (31) and using (30), implies (18) as in the proof of Proposi-
tion 2. As long as g̃ and s̃ are independent, this condition for the covariance can
only be true, if H* is chosen such that (19) holds.
(c) See proof of part (b) of Proposition 2.
(d) See proof of part (c) of Proposition 2. q.e.d.
We conclude that macro derivatives that capture the systematic component of
credit risk from a bank’s point of view create a setup analogous to the one with a
credit derivative carrying basis risk. The full optimum (D*,L*,H*) depends on
probabilities and risk preferences. Separation in the strong sense does not hold.
However, again there is the weaker notion of separation that enables the bank to
fix deposit and loan volumes, and to use the beta-hedge rule afterwards no matter
how deposits and loans were determined. In our model, the bank can hedge sys-
tematic credit risk directly and retain the specific part of risk. Because the macro
index used as the underlying of the MDS is publicly observable, no information
asymmetry arises. Macro derivatives seem to be an innovation in financial markets
that extend existing credit risk products in an interesting way.
Finally, we turn to the issues of liquidity in the markets for macro derivatives and
of generating a macro index from macroeconomic indicators. We introduced the
aggregation function A(·) to map observable macroeconomic variables (x̃1,…x̃k)
into the macroeconomic index g̃ used as the underlying of the macro derivative.
Although liquidity in these new markets for macro derivatives is a problem that
solves over time as a consequence of increased market demand, it will always be
a challenging task to evaluate and maintain the optimal structure of a macro
index, i.e., specify the aggregation function A(·) and its arguments.
We note first that different banks may need different macro indexes (and β’s)
because they may have different notions of systematic risk. We take banks focused
on specific sectors of the economy as an example: Systematic risk for a bank
financing car sales will not be the same as systematic risk from the point of view
of a bank giving housing loans. A standardized derivative on g̃ for all banks is
hard to imagine, but bank-specific underlyings g̃ would lead to very illiquid mar-
kets for macro derivatives.
One way to get around this problem is to establish standardized financial products
on single macroeconomic indicators and let banks individually aggregate theseCredit Risk
sbr 56 (4/2004) 375
indicators into their own macro indexes. There could be reasonable liquidity in
the markets for the single indicators and, if the number and variety of macroeco-
nomic indicators traded are sufficiently high and trading is sufficiently frequent, a
bank would be able to dynamically replicate its individually optimal macro index
by trading on the components of this index. Technically, a bank could use the fol-
lowing approximation of the aggregation function A(·):
(32)
where m denotes the constant vector of the gradient ∇ and ∆ is a delta-difference.
This separation enables risk management to trade on the single indicators. Thus,
each economic indicator xi contributes the volume mi · H to the bank’s macro
index.
A bank would now need to determine empirically the weights mT most appropri-
ate for its macro index. When determining the macro index we can distinguish
causally and statistically motivated relations θ ˜ = βA(x̃1,…, x̃k) + s̃. A causal relation
allows us to evaluate the relevant economic variables and the functional form of
A(·) based on a theoretical model such as the CAPM. In this case, only the para-
meter estimation requires statistical methods. A statistical relation does not allow
us to determine the functional form and variables exactly, based on qualitative
reasoning. This failure may be due to a lack of theoretical insight, as no adequate
theory has yet been developed. In this second case, the selection of proper
explanatory variables, and sometimes even the decision for a functional relation-
ship, must be based on statistical methods.
The explanation of credit risk is an example for the second case. More precisely,
even though we have already suggested that we can use the logistic regression
and that we may have preselected a set of potential variables (x̃1,…, x̃n), with
n ≥ k, by qualitative reasoning, we need to further narrow down this set in order
to receive an optimal vector of economic indicators. The logistic distribution
allows for a linear transformation yielding the logistic regression model14:
(33)
A bank would use its internal data on credit depreciation as observations of θ ˜ and
use (33) to estimate optimal weights for macroeconomic indicators.
To keep the exposition simple, we assume that s̃ is normally distributed in a
homoskedastic manner, and additionally θ ˜ ∈(0,1). Under these assumptions we
are able to apply ordinary least squares15. The restriction θ ˜ ∈{0,1} means that even
ln
˜
˜
˜ ˜.
θ
θ 1 1 −







 = + ⋅ + ∑
=
c m x s i i
i
n
∆ ∆ ∆
∆ ∆
A x x
A
x
x A x
A x x m x A x x m x c
k
i
i
T
i
k A
k
T
k
T
( , , )
( , , ) ( , , ) ,
1
1
1 1
… ≈ ⋅ = ∇ ⋅ ∑ ⇔
… = ⋅ ⇔ … = ⋅ +
=
∂
∂
linear
## 14 See Gujarati (1995), p. 554.
## 15 The critical assumption of a homoskedastic disturbance can be relaxed by the use of WLS. See
Gujarati (1995), p. 557.U. Broll/G. Schweimayer/P. Welzel
376 sbr 56 (4/2004)
though there is always some default, the bank will be able to recover a non-zero
portion of its exposure. An efficient procedure that uses (33) as a tool for the
selection of proper indicators is a stepwise backward elimination of nonsignificant
variables. The decision whether to eliminate a variable from further regressions
can be based on the t2 statistics of the regression parameters.
5 CONCLUSION
Using the industrial organization approach to the microeconomics of banking, we
analyze the implications of credit risk, credit derivatives, and macro derivatives on
the optimal behavior of a single large bank under risk aversion. In modeling credit
risk, we distinguish between the probability of a credit default and the loss given
default.
We derive separation results and – in most cases – hedge rules. For a credit
default swap perfectly correlated with the credit risk, decisions on deposit and
loan volumes on the one hand and hedge volume on the other are (strongly) sep-
arable and can be made without knowledge of risk preferences and probabilities.
In this situation, if the derivatives market is unbiased, the bank optimally chooses
to fully hedge its credit risk exposure.
For the case of a credit derivative with basis risk, we find that a beta-hedge rule is
optimal, regardless of the volumes of deposits and loans chosen. Although a full
optimum now depends on risk preferences and probabilities, there is still a
(weak) form of separation between deposits and loans on the one hand and
hedging on the other. If the derivative in case of default pays a predetermined
fixed amount, no simple hedge rule exists and neither weak nor strong separation
holds, but we can relate optimal hedging to the notion of “prudence” and give
intervals for the optimal hedge.
We then examine macro derivatives as one very recent innovation in financial
markets. We argue that macro derivatives are a valuable tool because, as opposed
to normal credit derivatives, they enable lenders to sell the systematic part of
credit risk, which is what capital market theory suggests. The implications of a
macro derivative for optimal bank behavior are formally equivalent to those of a
credit derivative with basis risk.
Finally, we discuss how macro indexes as underlyings of macro derivatives could
be optimally designed from financial products, using macroeconomics indicators
such as the products traded since fall 2002 mentioned in the introduction.
Although the industrial economics approach to the bank does not consider issues
of asymmetric information explicitly, we are able at several stages of our analysis
to point out that aspects of asymmetric information were included in an implicit
way.
Further work should be directed to generalizing the framework by modeling the
derivatives market and moving closer to a general equilibrium framework. ThisCredit Risk
sbr 56 (4/2004) 377
approach should answer the question of whether or not the existence of credit
derivatives and macro derivatives leads to more or less risk in the financial system
(see e.g. Instelfjord (2000), and Prato (2002) for some insights on this question).
REFERENCES
Altman, Edward/Saunders, Anthony (1997), Credit Risk Measurement: Development Over the Last 20
Years, in: Journal of Banking and Finance, Vol. 21, pp. 1721–1742.
Bank for International Settlements (2001), Triennial Central Bank Survey. Foreign Exchange and Deriv-
atives Market Activity in 2001.
Benninga, Simon/Eldor, Rafael/Zilcha, Itzhak (1984), The Optimal Hedge Ratio in Unbiased Futures
Markets, in: Journal of Futures Markets, Vol. 4, pp. 155–161.
British Bankers’ Association (2002), Credit Derivatives Report 2002,
www.bba.org.uk/public/services/publications.
Chiappori, Pierre-André/Pérez-Castrillo, David/Verdier, Thierry (1995), Spatial Competition in the Bank-
ing System: Localization, Cross Subsidies and the Regulation of Deposit Rates, in: European Eco-
nomic Review, Vol. 39, pp. 889–918.
Deutsche Bundesbank (2004), Instrumente zum Kreditrisikotransfer: Einsatz bei deutschen Banken und
Aspekte der Finanzstabilität, Monatsbericht April 2004, pp. 27–45.
Freixas, Xavier/Rochet, Jean-Charles (1997), Microeconomics of Banking.
Froot, Kenneth/Scharfstein, David/Stein, Jeremy (1993), Risk Management: Coordinating Corporate
Investment and Financing Policies, in: Journal of Finance, Vol. 48, pp. 1629–1658.
Froot, Kenneth/Stein, Jeremy (1998), Risk Management, Capital Budgeting, and Capital Structure for
Financial Institutions: An Integrated Approach, in: Journal of Financial Economics, Vol. 47, pp. 55–
82.
Gujarati, Damodar (1995), Basic Econometrics, 2. ed.
Huang, James (2002), Relationships Between Risk Aversion, Prudence, and Cautiousness, Working
Paper, Lancaster University.
Instelfjord, Norvald (2000), Risk and Hedging: Do Credit Derivatives Increase Bank Risk?, Discussion
Paper, Fondation Banque de France.
Jeanneau, Serge (2002), Derivatives Markets, BIS Quarterly Review.
Kimball, Miles (1990), Precautionary Saving in the Small and in the Large, in: Econometrica, Vol. 58,
pp. 53–73.
Loubergé, Henri/Schlesinger, Harris (2002), Coping with Credit Risk, Working Paper No. 36, Depart-
ment of Economics, University of Manitoba.
Marshall, John/Bansal, Vipul/Herbst, Anthony/Tucker, Alan (1992), Hedging Business Cycle Risk with
Macro Swaps and Options, in: Journal of Applied Corporate Finance, Vol. 4, pp. 103–108.
Menezes, Carmen/Wang, Henry (2002), The Precautionary Premium and the Risk-downside Risk Trade-
off, Working Paper, Department of Economics, University of Missouri-Columbia.
Neal, Robert (1996), Credit Derivatives: New Financial Instruments for Controlling Credit Risk, in: Fed-
eral Reserve Bank of Kansas City Economic Review, pp. 15–27.
Neven, Damien/Röller, Lars-Hendrik (1999), An Aggregate Structural Model of Competition in the Euro-
pean Banking Industry, in: International Journal of Industrial Organization, Vol. 17, pp. 1059–1074.
Pausch, Thilo/Welzel, Peter (2002), Credit Risk and the Role of Capital Adequacy Regulation, Volks-
wirtschaftliche Diskussionsreihe, Beitrag Nr. 224, Institut für Volkswirtschaftslehre, Universität Augs-
burg.
Prato, Olivier (2002), Credit Derivatives: A New Source of Financial Instability?, in: Financial Stability
Review, pp. 69–83.
Schweimayer, Gerhard (2003), Risikomanagement mit Makroderivaten auf Basis zeitdiskreter stochastis-
cher Prozesse.
The Wall Street Journal (2002), New Futures Could Help Folks Insure Against Economic Risks, Septem-
ber 05, 2002.Topping, Michael (2001), Banks to Launch Derivatives on Economics Statistics, in: Futures and Options
Week, October 10, 2001, p. 12.
Wilson, Thomas (1998), Portfolio Credit Risk, in: Federal Reserve Bank of New York Economic Policy
Review, Vol. 4, pp. 71–82.
Wong, Keith (1997), On the Determinants of Bank Interest Margins Under Credit and Interest Rate Risk,
in: Journal of Banking and Finance, Vol. 21, pp. 251–271.
U. Broll/G. Schweimayer/P. Welzel
378 sbr 56 (4/2004)Order form –
Order now!
Order form –
Order now!
Verlagsgruppe Handelsblatt GmbH
Abo-Service Ausland
Postfach 10 27 53
## 40018 Düsseldorf
Germany
Fon: 0049 211 887 1730
Fax: 0049 211 887 1738
e-mail: abo-service@vhb.de
Internet: www.sbr-online.com
Use this form to order your free sample copy and to subscribe to sbr!
Free sample copy
 Please send me a free sample copy of sbr
PB-ZFSBRPH1
Subscription
 Open ended subscription*
 One-Year subscription
PB-ZFSBRO15
* In case of open-ended subscription an invoice will be
issued at the end of each subscription year to cover the next
year. Cancellation within a period of at least 21 days before
the new subscription year begins.
Subscription rates**
Schmalenbach Business Review (sbr),
ISSN: 1439-2917, Quaterly
Institutions:  $ 95.00  £ 60.00  € 91.00
Individuals:  $ 48.00  £ 30.00  € 45.00
Students*:  $ 24.00  £ 50.00  € 21.00
* Student rate only accepted with copy of validated ID.
** Postage rates are – depending on the currency you want
to be charged in – $ 14, £ 8, € 12.
Payment
Payment is due within 14 days on receipt of invoice. You will
receive the invoice directly from Verlagsgruppe Handelsblatt
GmbH in Düsseldorf.
Address
Institute/Company
Position/Department
First and Surname
Street and Number
Zip Code City
State Country
Fon
Fax
e-mail
Signature Date
✘
sbr simply the best research.