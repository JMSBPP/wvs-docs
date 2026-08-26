---
sha256: 57d2be7783eeeb19c99ab164be76be0e48dd8ae995ff940bd6c58cb917b62757
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 292613
---
Structural Econometric Modeling:
Rationales and Examples
from Industrial Organization
by
Peter C. Reiss Frank A. Wolak
Graduate School of Business Department of Economics
Stanford University Stanford University
Stanford, CA 94305-5015 Stanford, CA 94305-6072
preiss@optimum.stanford.edu wolak@zia.stanford.edu
Incomplete Draft | June 13, 2002
NOTE
Prepared for the Handbook of Econometrics. This is a work in progress.
We welcome comments on substance, clarity and style.Contents
## 1 Introduction 1
## 2 Descriptive and Structural Modeling in Econometrics 2
## 3 Putting the `Econ' Back into Econometrics 5
## 3.1 Sources of Structure . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
## 3.2 Why Use Structural Models? . . . . . . . . . . . . . . . . . . . . . . . 9
## 3.3 Regressions and Structural Modeling . . . . . . . . . . . . . . . . . . 13
## 3.4 Structural Models, Simultaneous Equations and Reduced Forms . . . 17
3.4.1 `Magic' Instruments in Simultaneous Equations Models . . . . 20
## 3.4.2 The Role of Non-Experimental Data in Structural Modeling . 25
4 A Framework for Structural Econometric Models in IO 27
## 4.1 The Economic Model . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
## 4.2 The Stochastic Model . . . . . . . . . . . . . . . . . . . . . . . . . . . 30
## 4.2.1 Unobserved Heterogeneity and Agent Uncertainty . . . . . . . 30
## 4.2.2 Optimization Errors . . . . . . . . . . . . . . . . . . . . . . . 34
## 4.2.3 Measurement Error . . . . . . . . . . . . . . . . . . . . . . . . 38
## 4.3 Steps to Estimation . . . . . . . . . . . . . . . . . . . . . . . . . . . . 39
## 4.4 Structural Model Epilogue . . . . . . . . . . . . . . . . . . . . . . . . 41
## 5 Demand and Supply Under Imperfect Competition 41
## 5.1 Using Price and Quantity Data to Diagnose Collusion . . . . . . . . . 42
## 5.2 The Economic Model . . . . . . . . . . . . . . . . . . . . . . . . . . 44
## 5.2.1 Environment and Primitives . . . . . . . . . . . . . . . . . . . 44
## 5.2.2 Behavior and Optimization . . . . . . . . . . . . . . . . . . . 45
## 5.2.3 The Stochastic Model . . . . . . . . . . . . . . . . . . . . . . 47
## 5.3 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 51
## 6 Market Power Models More Generally 52
## 6.1 Estimating Price-Cost Margins . . . . . . . . . . . . . . . . . . . . . 53
## 6.2 Identifying and Interpreting Price-Cost Margins . . . . . . . . . . . . 56
## 6.3 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 61
## 7 Models of Competition in Di erentiated-Product Markets 61
## 7.1 Neoclassical Demand Models . . . . . . . . . . . . . . . . . . . . . . . 61
## 7.2 Micro-Data Models . . . . . . . . . . . . . . . . . . . . . . . . . . . . 67
7.2.1 A Household-Level Demand Model . . . . . . . . . . . . . . . 69
## 7.2.2 Goldberg's Economic Model . . . . . . . . . . . . . . . . . . . 70
## 7.2.3 The Stochastic Model . . . . . . . . . . . . . . . . . . . . . . 72
## 7.2.4 Results . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 75
7.3 A Product-Level Demand Model . . . . . . . . . . . . . . . . . . . . . 76
## 7.3.1 The Economic Model in BLP . . . . . . . . . . . . . . . . . . 78
## 7.3.2 The Stochastic Model . . . . . . . . . . . . . . . . . . . . . . 78
## 7.3.3 More on the Econometric Assumptions . . . . . . . . . . . . . 82
## 7.3.4 Functional Form Assumptions for Price . . . . . . . . . . . . . 82
## 7.3.5 Distribution of Consumer Heterogeneity . . . . . . . . . . . . 84
## 7.3.6 Unobserved \Product Quality" . . . . . . . . . . . . . . . . . 86
## 7.3.7 The Cost Speci cations . . . . . . . . . . . . . . . . . . . . . . 88
## 7.4 Summary . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 89
28 Models with Private Information: Auctions 90
## 9 Econometric Models of Entry, Exit and the
Number of Firms in a Market 90
## 9.1 An Example . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 91
## 9.2 The Economic Model . . . . . . . . . . . . . . . . . . . . . . . . . . . 93
## 9.3 Modeling Pro ts and Competition . . . . . . . . . . . . . . . . . . . . 95
## 9.4 The Econometric Model . . . . . . . . . . . . . . . . . . . . . . . . . 97
## 9.5 Estimation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 101
## 9.6 Epilogue . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 102
## 10 Ending Remarks 102
31 Introduction
The founding members of the Cowles Commissionde ned econometrics as: \a branch
of economics in which economic theory and statistical method are fused in the anal-
ysis of numerical and institutional data" (Hood and Koopmans (1953), page xv).
Many economists today, however, view econometrics as a eld primarily concerned
with statistical issues rather than economic questions. This has led some to draw a
distinction between econometric modeling and structural econometric modeling, the
latter phrase being used to emphasize the original Cowles Foundation mission for
econometric research.
This chapter has three main goals. The rst is to explain both what structural
econometricmodelingisandtodescribethebasicelementsofastructuraleconometric
model. While the process of deriving a coherent statistical models from an economic
model might seem so obvious that it would be routine, nothing could be further
from the truth. Structural econometric models simultaneously must: (1) be exible
statistical descriptions of data; (2) respect the details of economic institutions under
consideration; and (3) be sensitive to the non-experimental nature of economic data.
Moreover, just because an empirical researcher includes errors in an economic model
does not guarantee that the resulting statisticalmodel willbe coherent or realistic. In
thischapterweillustratethesubtletiesanddiÆcultiesinvolvedincombiningeconomic
and statistical models.
Theprocessofbuildingastructuralmodelinvolvesaseriesofinterrelatedsteps. These
steps require empiricists to trade o economic and statistical assumptions. Making
these tradeo s is not straightforward. While most econometrics textbooks do an ex-
cellent job teaching statistical methods, few discuss how to combine economic and
statistical models. Fewer discuss why researchers must trade o economic and sta-
tistical assumptions to construct a structural econometric model. As a consequence,
there is little consensus among economists on how to build and interpret structural
econometricmodels. Thus, asecond goalofthischapter istopropose ageneralframe-
work for developing and evaluating structural econometric models. Although some
elements of this framework originated with the founders of the Econometric Society,
we add elements that are speci c to a eld of interest to us { industrial organization
(IO).
Our third goal is to illustrate how structural modeling tradeo s are made in practice.
Speci cally, we examinedi erenttypes ofstructuraleconometricmodelsdeveloped by
IO researchers. These modelsare used to examinesuch issues as: the extent ofmarket
power possessed by rms; the eÆciency of alternative market allocation mechanisms
(e.g., di erent rules for running single and multi-unit auctions); and the empirical
implications of information and game-theoretic models. We should emphasize that
this chapter is NOT a comprehensive survey of the IO literature or the above topics.
1Rather, we seek to illustrate how IO researchers have used economic structure and
statistical assumptions to identify and estimate economic quantities. Our hope is
that in doing so we can provide a sense of the bene ts and limitations of structural
econometric models generally.
This chapter is organized as follows. We begin with several examples of what we
mean by a structural econometric model. We go on to illustrate the strength and
weaknesses of structural econometric models through an extended series of examples.
These examples provide a context for our structural modeling framework. Follow-
ing a description of this framework, we use the framework to evaluate structural
models from industrial organization. First, we consider models of competition in ho-
mogeneous product markets in which researchers estimate \conduct" or competitive
\conjectural variation" parameters. We then discuss structural approaches to model-
ing competition in di erentiated product markets, private or asymmetric information
in auctions and principal-agent relations, and models of discrete strategic actions,
such as entry and exit.
## 2 Descriptive and Structural Modeling in Econo-
metrics
Empirical work in economics can be divided into two general categories: descriptive
and structural. Descriptive work has a long and respected tradition in economics.
Pure descriptive work can proceed without any reference to an economic model. For
example, economists measure such things as the unemployment rate without relying
on a particular model of the determinants of unemployment. Descriptive work also is
concerned with uncovering time series or cross-section patterns in economic variables.
The primarygoal of most descriptive work in economics is to uncover trends, patterns
or associations that might stimulate additional theoretical or empirical analyses. An
excellent early example is Engel's (1857) work relating commodity budget shares to
total income. Engel's nding that expenditure shares for food were negatively related
to logarithms of total household expenditures has shaped subsequent theoretical and
empiricalworkonhouseholdconsumptionbehavior(seeDeatonandMuelbauer(1980)
and Pollak and Wales (1992)). A somewhat more recent example of descriptive work
is the Phillips curve. Phillips (1958) documented an inverse relationship between
United Kingdom unemployment rates and changes in wage rates. This work inspired
others to document relationships between unemployment rates and changes in prices.
In the ensuing years, many economic theories have been advanced to explain why
Phillips curves are or are not stable economic relations.
Many researchers believe there is an intermediatecategory of empiricalresearch, most
often referred to as \reduced form" analysis. This term is usually used to signal an
2econometric model in which the researcher presumes there is a linear association
between a dependent and one or more independent variables. Economics plays a
role in these regression models to the extent that it suggests which variables are
dependent and which are independent. The term \reduced form" also is meant to
signal to others that the independent variables are presumed exogenous and that the
regression coeÆcients capture by how much the dependent variable will change if the
independent variable changes by one unit { holding everything else constant. One
of the main goals of this chapter is to argue that this use of the term reduced form
is inappropriate and not what members of the Cowles Commission intended. These
regressions are in fact descriptive, and not an intermediate category of empirical
model.
Descriptive work in general is concerned with estimating the joint population density
of x and y, f(x;y), or objects that can be derived from it such as:
f(y jx), the conditional density of y given x;
E(y jx), the conditional expectation of y given x;
Q (y jx) the conditional quantile of y given x; or
BLP(y jx), the best linear predictor (BLP) of y given x.
Recently, statisticians and econometricians have devoted substantial energy to devis-
ing exible methods for estimating joint densities. For example, statisticians have
proposed kernel density techniques and other data smoothing methods for estimating
f(x;y). SeeSilverman(1986)andHardle(1990)forintroductionstotheseprocedures.
Although these non-parametric estimation techniques have the advantage of allow-
ing the researcher to estimate the joint density of x and y while imposing minimal
restrictions, these methods have a cost. Speci cally, to yield much precision, smooth-
ing techniques typically require enormous amounts of data. Moreover, the amount of
data required to obtain precise estimates grows rapidly with the dimension of x and
y. Silverman describes this as a \curse of dimensionality." He presents calculations
that suggest that economists will need hundreds of thousands of observations to have
much faith in these exible techniques for estimating f(x;y).1
Even in those rare circumstances when a researcher has suÆcient data to estimate
f(x;y) exibly, there are still compeling rationales for preferring to estimate a struc-
tural econometric model. A structural econometric model imposes the additional
restriction that the population joint distribution of x and y, f(x;y); re ects the be-
havior of economic actors. This implies that observed data can be used to recover
estimatesofparametersofunderlyingeconomicprimitivesthatareinvarianttotheen-
1Silverman (1986, Table 4.2) shows that more than ten times as much data is required to attain
the same level of precision for a four-dimensional as a two-dimensional joint density. More than 200
times as much data is required for an eight-dimensional as a four-dimensional density.
3vironmentthattheeconomicagentsoperatein. Thus, likedescriptivework, structural
econometric modeling is about characterizing the properties of the joint distribution
of economic data. Unlike descriptive work, structural models seek to estimate eco-
nomic parameters or primitives from the joint distribution of the data. The essential
components of a structural model then are the theoretical and statistical assumptions
that allow a researcher to recover economic primitives from data. These assumptions
minimallymust be economicallyrealistic and statistically sound. For the structure to
be realistic, it must reasonably describe the economic and institutional environments
generating the data. For it to be coherent, it must be possible to recover structural
parameter estimates from all plausible data realizations.
To understand the process of building a structural model, consider a researcher who
wishes to use household consumption, price and demographic data to estimate house-
hold demand for a particular good. The rst step in building a structural model is to
show that economic theory places restrictions on the joint distribution of household
consumption, prices and income. The structural modeler might start by assuming
the existence of a household-level utility function U(x;z;) that is a function of con-
sumption x, taste parameters , and household characteristics z. The modeler might
then use consumer theory to derive a mathematical relationship between household
consumption, prices p and household characteristics: x = h(p;z;). Of course this
theory will not perfectly explain households' consumption. The researcher therefore
must either enrich the economic model or introduce error terms that represent vari-
ables outside the economic theory. These error terms might represent unobserved
di erences among agents, agent optimization errors, or errors introduced during data
collection. For example, a structural modeler might assume that he does not observe
allofthe household characteristics thatdetermine di erences inpreferences. He could
model this incompleteness explicitly by introducing a vector of observed household
characteristics,  directly into the household utility functions: U = U(y;x;;): By
maximizinghousehold utilitysubject tothe household's budget constraint we now ob-
taindemandfunctionsthatdependontheseunobserved characteristics: y = h(x;;).
To estimate the unknown utility (\structural") parameters , the structural modeler
would then add assumptions about the joint population distribution for the unob-
served tastes and the x's. For example, he would assume a speci c joint distribution
for x and . From this joint distribution, he could apply a change of variables to
derive the joint distribution of the observed data f(x;y) or other objects such as
f(yjx). The critical question at this point is: can he now nd a method for estimat-
ing  from the structure of f(x;y)? Ideally, the researcher must demonstrate that his
econometric model is consistent with the observed joint density of x and y and that
he can consistently estimate  using the available data.
To summarize this process, structural econometric modeling involves a sequence of
economic and statistical assumptions that gives rise to a joint density of x and y.
Examples of economic assumptions are: What utility function should be used? What
4is the budget constraint faced by the consumer? Examples of stochastic assumptions
are: What types of errors should be introduced and where should they be introduced?
Do these stochastic assumptions characterize the complete distribution, or might
estimation be based on a statistical object that can be derived from the complete
distribution? In what follows, we discuss these and other choices that structural
modelers make. We loosely group these choices into three main groups: economic,
statistical and tractability assumptions.
In closingthis section, we would liketo emphasize the fundamentaldi erence between
structural and descriptive econometric models. The ultimate goal of descriptive work
is to estimate the joint density of x and y, although most economic researchers focus
on estimating best linear predictor functions or the conditional density of y given
x. Consequently, a descriptive researcher cannot make claims about causation or
economic behavior, because these cannot be inferred from the distribution of data
alone. On the other hand, a structural modeler can recover estimates of economic
magnitudes and determine the extent of causation, but only because he is willing to
make the economic and statistical assumptions necessary to infer these magnitudes
from his econometric model for the joint density of x and y. This is a major strength
of a structural econometric model { by making clear what economic assumptions are
required to draw speci c economic inferences from the data, the structural modeler
makes it possible for others to assess the plausibility and sensitivity of the ndings
to these assumptions. One might think that a descriptive modeler can recover un-
ambiguous estimates of economic magnitudes without making these economic and
statistical assumptions. However, as we show below, this is not in general possible.
In order set the stage for this discussion, we rst need to describe in more detail
where "structure" comes from in structural econometric models.
## 3 Putting the `Econ' Back into Econometrics
## 3.1 Sources of Structure
There are two sources of \structure" in structural models. First, economic theories
deliver mathematical statements about the relationship between x and y. These
mathematical statements often are deterministic, and as such do not speak directly
to the distribution of noisy economic data. It is the applied researcher who adds
the second source of structure, which are statistical sampling and other stochastic
assumptions that specify how data on x and y were generated. This second source
is necessary to transform deterministic models of economic behavior into stochastic
econometric models. Thus, the "structure" in structural models typically comes from
both economics and statistics.
Varying degrees of economic and stochastic structure can be imposed. Purists believe
5that structural models must come from fully-speci ed stochastic economic models.
Others believe that it is acceptable to add structure if that structure facilitates esti-
mation or allows the researcher to recover some economically meaningful parameters.
For example, economic theory may make predictions about the conditional density
of y given x, f(yjx), but may be silent about the marginal density of x, f(x). In
this case, a researcher might assume that the marginal density of x does not con-
tain parameters that appear in the conditional density. Of course, there is nothing
to guarantee that assumptions made to facilitate estimation are in fact reasonable
or true. Put another way, the \structure" in a structural model is there because the
researcher chose explicitlyorimplicitlytoputitthere. Oneoftheadvantagesofstruc-
tural econometric models is that researchers can examine the sensitivity of structural
models and estimators to alternative economic and statistical assumptions. This is,
however, easier said than done.
To illustrate how economists can introduce structure into an econometric model, we
beginbyexaminingtwostylizedeconometricmodels. The purposeofthe rstmodelis
toillustratethedi erencebetween adescriptiveandastructuralmodel. Thisexample
shows that the same linearregression modelcan be adescriptive or a structural model
depending on what economic and statistical assumptions the researcher is willing to
make.
Example 1
We imagine an economist with a cross-section of rm-level data on output, Qt, labor
inputs, Lt, and capital inputs, Kt for rm t. To describe the relationship between
output and inputs, the researcher might estimate the following linear regression by
ordinary least squares (OLS):
lnQt = 0 +1 ln Lt +2 ln Kt +et (1)
where the 's are unknown coeÆcients and the et is an error term that accounts for
the fact that the right-hand side variables do not perfectly predict log output.
What do we learn by estimating this regression? Absent more information we have
estimated a descriptive regression. More precisely, we have estimated the parameters
of the best linear predictor of yt = ln(Qt) given xt = (1;ln(Lt);ln(Kt))0. Goldberger
(1991) Chapter 5 provides an excellent discussion of best linear predictors. The
best linear predictor of y given a univariate x is BLP(y j x) = a + bx, where a =
E(y) bE(x) and b = Cov(y;x)=Var(x). Notice that the coeÆcients, a and b, of
the best linear predictor function are statistical (and not economic) functions of the
population moments of f(x;y).
If we add to our descriptive model the assumption that the sample second moments
6converge to their population counterparts
lim T!1
1
T
T X
t=1
xt x0
t = Mxx; and lim T!1
1
T
T X
t=1
xtyt = Mxy;
and that Mxx is a positive de nitive matrix, then we can show that OLS will deliver
consistent estimates of the parameters of the best linear predictor function. Thus, if
we are interested in predicting the logarithmof output, we do not need to impose any
economic structure and very little statistical structure to consistently estimate the
linear function of the logarithm of labor and logarithm of capital that best predicts
the logarithm of output.
Many economists, however, see regression (1) as being more than a descriptive re-
gression. They would base their reasoning on the observation that (1) is essentially
looks like a logarithmic restatement of a theoretical Cobb-Douglas production func-
tion: Qt = ALt Kt . Because of the close resemblance, they would argue that (1) is
in fact a \structural" and not a descriptive econometric model.
A critical missing step in this logic is that a Cobb-Douglas production function is
deterministic relationship, whereas the regression model (1) includes an error term.
Where did the error term in the empirical model come from? The answer to this
question is critical because it a ects whether OLS will deliver consistent estimates of
the parameters of the Cobb-Douglas production function, as opposed to consistent
estimates of the parameters of the best linear predictor of the logarithm of output
given the logarithm of the two inputs. In other words, it the combination of an
economic assumption (production is truly Cobb-Douglas) and statistical assumptions
(et satis es certain moment conditions) that distinguishes a descriptive model from
a structural model.
Deterministic production function models provide no guidance about the properties
of the disturbance in (1). The researcher thus is left to sort out what properties are
appropriate from the details of the application. One could imagine, for instance, the
modeler declaring that the error is an independently-distributed, mean-zero measure-
ment error in output, and that these errors are distributed independently of the rms'
input choices. In this case, OLS has the potential to deliver consistent estimates of
the production function parameters.
But how did the modeler know that et was all measurement error? As we discuss
later, this is likely too strong an assumption. A more plausible assumption is that the
error, et, also includes unobservable (to the econometrician) di erences in each rm's
productivity (e.g., an unobservable component of A in the Cobb-Douglas function).
This component of A is observed by the rm, before it makes its input choices.
This economic assumption implies that et is correlated with observed input choices.
This correlation necessitates using something other than OLS to recover consistent
estimates of the parameters of the Cobb-Douglas production function.
7Even if one were willing to assume that et is measurement error distributed indepen-
dently of xt, additional economic structure is necessary to interpret the OLS param-
eter estimates as coeÆcients of a Cobb-Douglas production function. By de nition,
a production function gives the maximum technologically feasible amount of output
that can be produced from a vector of inputs. Consequently, under this stochastic
structure, unless the researcher is also willing to assert that the rms in the sample
are producing alongtheir Cobb-Douglasproductionfunction, OLS appliedto (1)does
not yield consistent estimates of the parameters of this production function.
This seemingly innocuous assumption of technologically eÆcient production may be
inappropriate for some industries. There are a number of markets and environments
where rms do not necessarily operate along their production function. For example,
a state-owned rm may use labor in a technologically ineÆcient manner to maximize
its political capital with unions. Regulators also may force rms to operate o their
production functions. Failure to recognize all of the economic and statistical assump-
tions necessary to interpret estimated linear regression coeÆcients as parameters of
an economic primitive is often why researchers claim to nd regression results that
are inconsistent with economic theory.
The following example illustrates the general process of constructing a structural
econometric model by combining a deterministic economic theory with stochastic
assumptions. As in the above example, a linear regression is estimated to recover
the parameters of the underlying economic environment, but this statistical model is
derived from a stochastic equilibrium economic model.
Example 2
Suppose an IO economist has rm output and cost data from di erent geographic
monopoly markets where rms have constant, observable marginal costs ci and face
a linear inverse demand curve, p = a bq, where a and b are constants and q is
output. Static monopoly theory predicts that each monopolist's pro t-maximizing
output willbe: qi = (a ci)=2b. In other words, there willbe a linearrelationbetween
each monopolist's output and its marginal cost, qi = 0 +1ci.
No IO economist would be so naive as to think that this static model will explain
outputdataperfectly. Observed monopolyoutputs willdepartfromthisdeterministic
relation. This leaves the modeler with the choice of abandoning the theory or \ xing"
it to rationalize the model's error. A common response is to presume that the theory
and its associated functional forms are correct, but the empirical economist does not
observe everything that the rm does. This amounts to the empiricalmodeler adding
error terms into the deterministic model to account for di erences between the theory
andthedata. Althoughwediscuss thisprocess morefullybelow, oneway ofdoingthis
inthe present modelisto assume that the rms' demand intercepts di erinways that
are unobserved by the economist, and that these errors have the formai = a+i. This
8speci cation leads to the stochastic (from the perspective of the researcher) relation
between quantities and marginal costs qi = (a ci)=2b+i=2b = 0 +1ci +i. Note
thatthisisnotthe onlypossible x ofthiskind. Thisspeci cationisindistinguishable
from a model where the error comes from unobserved di erences in rms' marginal
costs. That is, assume cTrue
i = cObs
i +i, where cObs
i are observed and cTrue
i are true
costs. Then qi = (a cTrue
i )=2b = (a cObs
i )=2b+i=2b.
While these error structures account for the deterministic economic model not per-
fectly predicting observed prices and quantities, they do not contain enough structure
to justify a particularestimationmethod. This is where the empiricalresearcher must
add assumptions. As we indicated in the rst example, sometimes these assumptions
areamatterofconvenience. Forexample,acommonassumptionhereisE(i jci) = 0,
which also implies E(i) = 0. This assumption justi es using least squares to obtain
consistent estimates of the conditional expectation function E(qi jci) = 1 +2ci and
consistent estimates of . From there, one can use the theory to recover estimates
of the population average inverse demand intercept a = E(ai) = 1=2 and the slope
of inverse demand b = 1=(22). But what justi es the mean independence assump-
tion for the error? The answer hopefully can be justi ed on economic or practical
grounds; absent such answers, the assumption is one of statistical convenience. Is
it bad to make statistical assumptions to facilitate estimation? Not necessarily, but
the researcher must be clear that the assumption is critical to the consistency of the
estimation results.
This example highlightsthe two steps necessary to construct a structural econometric
model. First the researcher speci es an economic model of the phenomenon under
consideration. Second she incorporates unobservables into the economic model. This
second step of incorporating unobservables in economic models should receive sig-
ni cantly more attention than it does. This is both because the assumptions made
about the unobservables will impact estimation and because not any old stochastic
speci cation will do. For instance, for the stochastic speci cation to make sense, it
trivially must be able to rationalize all possible realizations of the observed endoge-
nous variables. Sections 4 and 5 illustrate the importance of stochastic speci cations
in more detail and illustrate potential pitfalls.
## 3.2 Why Use Structural Models?
We see three general reasons to go to the trouble of specifying and estimating a
structural econometric model.
First, a structural model can be used to estimate unobservable economic parameters
or behavioral responses from non-experimental data. In our second example, we used
a pro t-maximizing monopoly model to derive a relationship between output and
9marginal cost. By combining this economic model with statistical assumptions about
unobserved demand di erences, we were able to nd a way to recover consistent
estimates of an average demand function. This function gives the amount consumers
would purchase as a function of a market price, regardless of the number of producers
in the market.
Other examplesofbehavioralorstructuralparameters include: marginalcost, returns
to scale, the price elasticity of demand, and the impact of a change in an exogenous
variable on the amount demanded or on the amount supplied. If a researcher only
observes market-clearing prices and quantities, and exogenous demand and supply
shifters, the impact of a change in an exogenous variable on the unobserved amount
demanded can only be recovered from a structural model. Conversely, a descriptive
OLS regression can only tell us how the best linear predictor of an equilibrium price
or quantity changes in response to a change in one of the regressors. No statements
about the response of the quantity demanded or quantity supplied can be made using
non-experimental data without the researcher specifying a structural econometric
model of supply and demand.
Second, structural models can be used to simulate changes in equilibrium outcomes
resulting from changes in the underlying economic environment. That is, one can
use the estimated structure to predict what would happen if certain elements of the
environment change. For instance, in our monopoly markets example, once we know
the parameters of the demand curve and the rm-level marginalcost function, we can
construct predictions about how the market equilibrium would change aspect of the
economic environment changed. For example, we could predict by how much price
would fall if an identical second rm entered the monopoly market. Economic theory
predicts that if the two rms competed as Cournot duopolists, then each duopolist's
output would be qi = (a ci)=3b, which is two-thirds of the monopoly output. This
is precisely the structure we need to obtain the joint density of rm-level output and
marginal cost for the Cournot duopoly. We would rst use consistent estimates of a
and b to construct f(qi; ci j ), the joint density of rm-level monopoly output and
marginal cost. We would then compute the joint density of rm-level output and
marginal under Cournot duopoly as: f(qi; ci j 0), where 0 = 2=3. It is economics
that links the monopoly density parameters to those of a duopoly.
Another example of how we might use the monopoly model, is to ask what would
happen if we regulated the monopolists' prices. Suppose in fact that the regulator
sets the monopoly price equal to ci. This would imply that qi = (ai ci)=b, which is
twice the unregulated monopoly output. Consequently, f(qi;ci j0) for the regulated
monopoly case is equal to the unregulated monopoly density of qi and ci evaluated
at the point 0 = 2.
These examples illustrate the bene ts of structural modeling relative to descriptive
modeling. To contrast the two approaches, notice that we could use exible density
10estimation techniques to estimate the joint density of f(qi; ci) in monopoly markets.
Because these exible methods do not provide estimates of underlying economic pa-
rameters, they do not allow us to calculate how the density would change in markets
for which we do not have data, such as duopoly or regulated markets. This un-
derscores our point that unless a researcher is willing to make assumptions about
the underlying economic environment, the only inferences that can be drawn from a
descriptive analysis are those that pertain to the joint density of the data.
Third, structural models can be used to compare the predictive performance of two
competing theories. For example, we could compare the performance of quantity-
setting versus price-setting models of competition. It is important to emphasize
that these comparisons do not provide unambiguous tests of the underlying economic
theories. Indeed, these comparisons are always predicated on untestable assumptions
that are not part of the theory. For instance, any \test" of quantity-setting behavior
versus price-setting behavior is predicated on the maintained functional forms for
demand, costs, and the unobservables. Thus, the only sense in which one can \test"
the two theories is to ask whether one of these ways of combining the same economic
and stochastic primitives provides a markedly better description of observed or out-of
sample data.
Because we cannot test economic models independent of functional form assump-
tions, it is important to recognize that structural parameter estimates may well be
very sensitive to these assumptions. For example, if we were trying to estimate con-
sumer surplus from the demand estimates in Example 2, we should be aware that it
might make a tremendous di erence that we assumed demand was linear, as opposed
to constant elasticity. While this sensitivity to functional form can be viewed as a
weakness, italsocan beviewed asastrength. Thisisbecause the \structure" instruc-
tural models forces researchers to grapple directly with the economic consequences
of assumptions. As noted in the previous paragraph, if the applied researcher is
unwilling to make any assumptions about the behavior of economic agents whose ac-
tions produce the observed data, only statements about the properties of best-linear
predictor functions, conditional expectations, conditional quantiles and conditional
densities are possible.
The \structure" in structural models also can a ect the quality of statistical infer-
ences about economicprimitives. Here we have in mindthe impactthat a researcher's
functional form choices can have on the size and power of hypothesis tests. When, as
it usually is, economic theory is silent on which functional form and variable selection
issues, researchers will be forced to make what can appear to be arbitrary choices.
These choices can have a critical impact on inferences about parameters. For exam-
ple, if a researcher wants to fail to reject a null hypothesis, then she should specify
an extremely rich functional form with plenty of variables that are not part of the
economic theory. Such a strategy willlikely decrease the power of the hypothesis test.
For instance, if a reseacher would like to fail to reject the integrability conditions for
11her demand functions, she should include as many demographic variables as possible
in order to soak up across-household variation in consumption. This will tend to re-
duce the apparent precision of the estimated price coeÆcients and make it impossible
to reject the null hypothesis of integrability. Conversely, if she would like to reject
integrability, then she should include few, if any, demographic controls. This would
increase the apparent precision in the price coeÆcients and increase the likelihood
of rejection for two reasons: (1) she has reduced the number of irrelevant variables;
and (2) there is a chance the e ect of price may be exaggerated by the omission of
relevant variables.
This discussion underscores the delicatepositionempiricistsare inwhen they attempt
to\test"aparticularparameterortheory. Forthisreason, structuralmodelersshould
experiment with and report how sensitive their inferences are to sensible changes in
functionalformsortheinclusionandexclusionofvariablesnotcloselytiedtoeconomic
theory.
Finally, we should emphasize here that the advantages of structural models do not
always favor structural models over descriptive models. Indeed, there are many inter-
esting applications where there is little or no useful economic theory to guide empir-
ical work. We certainly do not believe this should stop the collection or description
of data. When a substantial body of economic theory exists, empirical researchers
should as much as possible shape assessments of that theory and its policy-making
implications by estimating the foundations of the theory. These foundations include
such primitives as consumers' utility functions and rms' production sets. Structural
models have the added advantage of making it clear to theorists and other empiricists
what assumptions must be made in order to link theory to data. By being clear about
whateconomictheory andempiricalmodelscanandcannotaddress, itbecomeseasier
for other researchers to evaluate and improve models.
These advantages of course do not come for free. All economic theories contain as-
sumptions that are not easily relaxed. While theorists sometimes have the luxury of
being able to explore stylized models with simplifying assumptions, structural econo-
metric modelers have to worry that when they use stylized or simplifyingassumptions
they will be dismissed as arbitrary, or worse: insensitive to the way the world \really
works." This problem is compounded by the fact that economic data rarely come
from controlled experimental settings. This means that structural econometric mod-
elers often must recognize problems with how data are generated and collected (e.g.,
aggregation and censoring). Such complications may force the structural modeler to
further simplifyor limitmodels. The danger in all of these cases is that the structural
model can then be seen as \too naive" to inform a sophisticated body of theory. We
expect that readers can see this already in our rst two examples.
123.3 Regressions and Structural Modeling
Empirical researchers often mistake statistical structure for economic structure. A
leading example of this confusion is the way some economists interpret the results
of a linear regression. For example, the model, y = + x +  lends an aura of
\structure" as to how y is related to x. It suggests for example that x determines (or
worse \drives") y. However, given a sample of T observations on these two variables,
we can always regress y on x or x on y. The critical question is: What we do make
of each set of coeÆcient estimates? Absent an economic model, the most we can say
aboutthe resultingcoeÆcient estimates comes fromstatistics. As discussed earlier, so
long as the rst two sample moments of the joint distribution of x and y converge to
their population analogues, each least squares regression yields consistent estimates
of a best linear predictor function, in the former case the best linear predictor of y
given x, BLP(yjx), and in the latter case, BLP(xjy).
In spite of this logic, many economists believe linear regression coeÆcients reveal
economic \structure" even when there is no explicit economic model used to justify
the estimated regression. For instance, in the 1960's and 1970's, IO economists were
interested in whether rm pro tability was related to the number and sizes of com-
petitors in an industry. This led to many papers that estimated linear regressions of
rm pro tability (e.g., rates of return on capital) on market concentration measures
(e.g., share of market output produced by the largest four rms) and other controls.
Although these regressions regularly yielded positive estimated coeÆcients on market
concentration, the coeÆcient magnitudes varied considerably from study to study.
How did IO economists interpret these regression results? Many interpreted these
regressions as supporting particular economic models of competition. Some argued
that the positive coeÆcient re ected the ability of rms in highly concentrated mar-
kets to limit competition and thereby raise prices and pro ts. Others argued that,
because more eÆcient rms have larger market shares, the results re ected the rents
earned by eÆcient rms.2
This practice of using regression coeÆcient signs to corroborate economic models is
widespread. It is supported by a belief that multiple regressions allow researchers to
\hold constant" other variables. For example, a researcher might develop a determin-
istic economic model that shows: \when x increases, y increases." This result then
becomes the economic justi cation for regressing y on x and other variables. If the
regression returns a positive coeÆcient on x, then this is seen by some as saying \the
data support the economic theory." If x has the wrong sign, this sometimes leads
the researcher to reject the theory; more often, it spurs the researcher to search for
variables that could mediate the e ect of x on y. Occasionally researchers experiment
2For an extended discussion of these models and the debate see for example Martin (1993),
Chapters 17 and 18.
13with alternative functional forms or di erent measures for y and x in their search for
estimates that con rm a theory.
Critics of an economic theory play the same game. They suggest in seminars or
referee reports that the positive e ect would go away if additional variables were
added. (Proponents try to anticipate this by showing their results are \robust" to
the inclusion of other regressors.) They also suggest alternative functional forms
or measures are more appropriate. Worse, they may label results as \meaningless"
because of \endogeneity problems" which call for instrumental variables. In response,
proponents sometimes assert that x is indeed an exogenous variable and that there
is no endogeneity problem. Sometimes this defense is couched in the language of
\reduced form regressions." Alternatively, endogeneity concerns may lead to a search
for instrumental variables.
It is not surprising to us that these debates invariably generate more heat than light.
The problem with using regression models to validate an economic theory is that,
absent an economic model that delivers a linear conditional mean speci cation for y
given x, it is impossible to connect regression evidence to deterministic comparative
statics predictions. Speci cally, for an econometric model to estimate a magnitude of
economicinterestconsistently, theresearcher must rstuseeconomicsandstatisticsto
demonstrate that the relevant economic quantity can be identi ed using the available
data and estimation technique. To see this point more clearly, consider the following
example.
A microeconomist has cross-section data on a large number of comparable rms. The
data consist of outputs, Q, in physical units, total costs, TC, and the rms' two input
prices, pK and pL. The researcher's goal is to learn about the rms' (by assumption)
common technology of production. The researcher decides to do this by estimating
one of the following regression models:
Model 1: ln TCi = 0 +1 ln Qi +2 ln pKi +3 ln pLi +i
Model 2: ln Qi = 0 + 1 ln TCi + 2 ln pKi + 3 ln pLi +i:
(2)
These speci cations di er according to whether the natural logarithm of output or
the natural logarithm of total costs is a dependent or independent variable.
Which speci cation should the researcher prefer? In an informal poll of colleagues,
four out of ve prefer Model 1 to Model 2. The logic most often given for choosing
Model 1 is that it appears to be a cost function. When asked how to interpret the
parameters of this regression speci cation, most say that 1 is an estimate of the
elasticity of total costs with respect to output. As such, it provides a measure of scale
economies. Those who prefer the second equation seem to base their preference on an
argument that total costs is more likely to be \exogenous". To them this means that
OLS is more likely to deliver consistent estimates of production or cost parameters.
14Which speci cation is correct? A structural modeler answers this question by an-
swering two prior questions: What economic and statistical assumptions justify each
model? And, do these assumptions make sense for the application at hand? In Sec-
tion4, we show that Model1 and 2 can be derived fromcompetingplausibleeconomic
and stochastic assumptions. That is, under one set of economic and stochastic mod-
eling assumptions, we can derive the Model 1 logarithm of total cost regression and
interpret the economic meaning of ordinary least squares parameter estimates. Under
another set of assumptions we can do the same for Model 2. Without knowing the
details of the rms and markets being studied, it is impossible to decide which set of
assumptions is more appropriate.
How does a researcher only interested in data description decide which speci cation
is correct? They too must answer prior questions. But these questions only pertain
to the goals of their statistical analysis. If, for example, their goal is prediction, then
they would choose between Models 1 and 2 based on the variable they are trying to
predict. They then would have to decide which right-hand side variables to use and
how these variables would enter the prediction equation. Here, researchers have to
worry that if their goal is post-sample prediction, they may over- t within sample
by including too many variables. While statistical model selection criteria can help
systematize the process of selecting variables, it is not always clear what one should
make of the resulting model.
In some cases, researchers do not have a clear economic model or descriptive criterion
in mind when they estimate a regression model such as Model 1 by ordinary least
squares. In this case, what can be made of the coeÆcient estimates obtained from
regressing y on the vector x? As discussed above, ordinary least squares delivers
consistent estimates of the coeÆcients in the best linear predictor of y given x. But
what information does the BLP( y j x ) provide about the joint distribution of
y and x? In general, the BLP will di er from the more informative conditional
expectation of y given x, E(yjx), which is obtained from f(x;y) as
R
yf(yjx)dy.
Thus, 1 = @BLP(y jx)=@x1 in Model 1 will not in general equal how much expected
log total costs will increase if we increase log output by one unit (i.e., @E(y jx)=@x1).
Only under certain conditions on the joint density of y and x are the BLP function
and the conditional expectation function the same. Despite this well-known general
lack of equivalence between BLP( y j x ) and E(y j x), many studies treat linear
regression slope coeÆcient estimates as if they were estimates of the derivative of
E(y jx) with respect to x. Occasionally, some studies adopt the position that while
the best linear predictor di ers from the conditional expectation, the signs of the
regression coeÆcients will be the same as those of @E(y jx)=@x provided the signs of
@E(y jx)=@x do not change with x. Unfortunately, there is no reason why this need
be true in general.
When the conditional expectation of y is nonlinear in x, statistical theory tells us
(under certain sampling assumptions) that a regression provides a best (minimum
15expected squared prediction error) linear approximation to the nonlinear conditional
expectation function. It is perhaps this result that some place faith in when they
attempttouseregressionstovalidateaneconomiccomparativestaticresult. However,
absent knowledge from economics or statistics about the joint distribution of y and
x, this approximation result is of limited value. We do not, for example, know how
good the linear approximation is. We do not know x causes y, y causes x, or that the
coeÆcients represent a consistent estimate of what would happen to y if we changed
x by one unit.
By making economic and statistical assumptions, however, we can potentially learn
something from the linear approximation. For example, if we had an economic the-
ory that suggested that there was a negative relationship between y and z, then the
bivariate regression slope coeÆcient's sign might tell us whether the evidence is con-
sistent with the theory. But this may be a weak con rmation of the theory and it
certainly does not provide us with a sense of the strength of the relationship if the
conditional mean function, E(y jz), is nonlinear in z.
Descriptive researchers (and structural modelers) also have to worry about whether
they have collected all of the data needed to examine a particular prediction about a
conditional mean. Consider, for example, the case where an economic theory delivers
a prediction about the conditional mean of y given x and z, E(y j x;z), where x, y
and z are scalars. Suppose that yd is a customer's demand for electricity during day
d, xd is the price of electricity during day d, and zd is average temperature during day
d. Economic theory predicts that electricity demand is decreasing in the daily price
after controlling for the average daily temperature. However, if we do not include
zd on the right hand-side when we regress yd on xd, then we obtain the best linear
approximation to E(y j x), not E(y j x;z). The di erence may be very important.
For instance, the function g(x) = E(y jx) may not depend on x, whereas the function
h(x;z) = E(y jx;z) may depend on both x and z. In this textbook case, regressing
yd, daily electricity demand, on the daily price xd could yield a positive or even zero
estimated coeÆcient on xd, despite the fact that the estimated coeÆcient on price is
large and negative when zd, the average daily temperature is included.
We anticipate that the point of the previous paragraph may seem obvious to many:
omitting a relevant variable can cause bias and produce inconsistent estimates. How-
ever, the reasoning here is not as straightforward as the textbook case of omitted
variablebias. In the textbook case, the functional formof the conditionalexpectation
is presumed correct (e.g., the conditional mean of y is linear in x and the parameters
of interest) and it may be possible to evaluate the bias in OLS coeÆcients from omit-
ting a relevant regressor. The situation referred to in the previous paragraph adds
the complication that we would like to evaluate omitted variable bias when we act as
if a linear regression is appropriate when in fact the conditional expectation function
is nonlinear. Thus, in addition to the omitted variable, we have to worry that even
if we had included the omitted variable in x, that @E(y jx)=@x 6= @BLP(y jx)=@x.
16Absent a theory that says that y is linearly related to x and z, the e ect of omitting
a relevant regressor is much harder to evaluate.
3.4 StructuralModels, Simultaneous Equations and Reduced
Forms
In the remainder of this section, we relate our de nition of a structural model to the
way the term \structural model" is used in simultaneous equations applications. To
begin this discussion, we introduce a textbook linear supply and demand model that
is referenced in later discussions of more complex game-theoretic IO models. This
model is used to illustrate the conditions a variable must satisfy in order to be a
valid instrument in a linear simultaneous equations model. This model also provides
a familiar framework to explain why it is not in general possible to consistently
estimate the parameters of equations describing the behavior of economic agents
from non-experimental data using least squares procedures.
Simultaneous equations models are an important class of structural models in eco-
nomics because they describe equilibrium phenomena. Simultaneous equations mod-
eling proceeds much as we have described above. The researcher identi es a set of
endogenous variables y and exogenous or predetermined variables x. A complete
simultaneous equations model contains one equation for each endogenous variable.
Each equation either represents the behavior of economic agents, an economic prim-
itive or an economic identity. Simultaneity, however, is not necessarily synonymous
with our de nition of a structural model. Two examples may help clarify matters.
Example 3
Our rst example is the classical linear demand and supply model. Each equation
characterizes the behavior of a group of economic agents. The demand curve gives
the quantity of the good that consumers would like to purchase at a given price,
conditional on other variables thought to a ect demand. The supply curve gives how
much rms are willing sell at a given output price, conditional on input prices and
other supply shifters. The most familiar textbook model is:
qs
t = 10 + 12 pt + 11 x1t +1t
pt = 20 + 22 qd
t + 22 x2t +2t
qs
t = qd
t ; (3)
or in matrix notation:
[qt pt ]

1 22
12 1

[1 x1t x2t ]
2
6
4
10 20
11 0
0 22
3
7
5 = [1t 2t ]
17y0
t x0
tB = 0
t (4)
where and B are matrices containingthe unknown parameters that characterize the
behavior of consumers and producers, qt is quantity at time t, pt is price, yt is a two-
dimensional vector, t is a two-dimensional vector of unobserved random variables,
and the exogenous xt consists of a constant term, a supply shifter x1t (e.g., an input
price) and a demand shifter x2t (e.g., household income).
To complete this structural model, the researcher could specify the joint distribution
ofxandy,oralternatively,asiscommonintheliterature,theconditionaldistribution
ofy givenx. Stillanotherapproachistosacri ceestimationeÆciencybyimposingless
structure on the joint distribution. For example, estimation could proceed assuming
the conditional moment restrictions
E(t jxt) = 0 and E(t0
t jxt) = : (5)
To nd out what restrictions the system (3) imposes on the conditional distribution
of y given x, we can solve for the endogenous variables as a function of exogenous
variables and shocks. Post-multiplying both sides of (4) by 1, and rearranging,
gives the reduced form
y0
t = x0
t+v0
t: (6)
From the conditional moment restrictions imposed on t we have
E(vt jxt) = 0; and E(vtv0
t jxt) = (7)
where
 = B 1; v0
t = 0
t
1; and = 10
 1: (8)
From(8), we see that  and the variance-covariancematrixof the reduced formerrors
provide information about the structural parameters in . Without restrictions on
the elements of , B, and , the only restrictions on the conditional distribution of
yt given xt implied by the linear simultaneous equation model is that the conditional
mean of yt is linear in xt and the conditionalcovariance matrix of yt is constant across
observations.
Withouttheeconomicandstochasticstructurethatdeterminesequilibriumquantities,
qt, and prices, pt, we cannot deduce the conditional means and variances of qt and pt.
In other words, a reduced form model exists only to the extent that the researcher has
derived it from a structural economic model. If the researcher is unwilling to assume
functional forms for the supply and demand equations, then the conditional means
of qt and pt will likely be nonlinear functions of xt, the vector of the demand and
supply shifters. In this case, although we can still perform linear regressions of qt and
pt on xt, these linear regressions are not reduced forms. Instead, as we have argued
before, these regression will deliver consistent estimates of the parameters of the best
linear predictors of the dependent variables given xt. How these parameter estimates
18are related to the price elasticity of demand or supply is unknown. Additionally, as
discussed earlier, unless the researcher is willingto place restrictions on the functional
forms of the conditional means of qt and pt given xt, it will be diÆcult to make even
qualitative statements about the properties of E(pt jxt) or E(qt jxt).
To summarize, it is a researcher's economic assumptions about demand and supply
that permit her to attach meaning to the coeÆcients obtained from linear regressions
of qt and pt on xt. If we assume the linear supply and demand model in (3) is gener-
ating the observed yt, then the estimates of  and can be used to recover consistent
estimates of the parameters of the stochastic supply and demand equations given in
(3). However, if we assume unspeci ed nonlinear supply and demand equations, then
the estimate of  is only a consistent estimate of the parameters of the best linear
predictors of qt and pt given xt. Further, the OLS estimate of now is no longer
the variance of one error but two: (1) the di erence between the dependent variable
and it conditional mean; and, (2) the di erence between the conditional mean and
its best linear predictor.
In summary, it is economic models that make linear regressions economically mean-
ingful. If we assume stochastic linear supply and demand equations generate yt, then
the equations in (8) allow us in principle to recover estimates of economic parameters
from  and . We emphasize in principle because unless the values of B; , and
 can be uniquely recovered from  and , the structural model (3) has no useful
empirical content. It only delivers the result that conditional mean of yt is linear in
xt and the conditional variance is constant. This leads to the question: How do we
know that the structural model given in equation (3) is generating the observed yt?
The answer is hopefully by now familiar: Because economic theory tells us so! Eco-
nomic theory tells us what elements of xt belong in just the supply and just the
demand equations. The same theory also resolves the problem of how to identify
;B; and  from the reduced form parameters  and . Absent restrictions from
economic theory, there are many di erent simultaneous equations models that can
give rise to the same reduced form parameters  and . These models may contain
radically di erent restrictions on the structural coeÆcients and impose radically dif-
ferent restrictions on the behavior of economic agents, yet no amount of data will
allow us to distinguish among them. For economic theory to be useful, it minimally
must deliver enough restrictions on ;B; and  so that the empiricist can uniquely
recover the remaining unrestricted elements of ;B; and  from estimates of  and
. Thus, any defense of the researcher's identi cation restrictions can be seen as a
defense of the researcher's economic theory. Without a clearly argued and convincing
economic theory to justify the restrictions imposed, there is little reason to attempt
a structural econometric model.
In defense of structural modeling, one might think that an explicit economic theory is
unnecessary if the researcher just \lets the data talk," and performs a purely descrip-
19tive analysis. Once again we emphasize that such linear regressions will only produce
consistent estimates of best linear predictor functions of the left-hand-side variables
given the observed right-hand-side variables. Thus, when a researcher says he would
only like to \let the data talk," the data can only speak the language of statistics,
informing us about the properties of best linear predictor functions or at best joint
and conditional densities.
Itiswell-known toeconomictheoriststhatwithoutassumptionsitisimpossiblederive
predictions about economic behavior. For example, consumers may have preference
functions and producers access to technologies. However, unless we are willing to
assume, for example, that consumers maximize utility subject to budget constraints
and producers maximize pro ts subject to technological constraints, it is impossible
to derive any results about how rms and consumers might respond to changes in the
underlyingeconomic environment. An empiricalresearcher faces this same limitation:
\Without assumptions, it is impossible to derive empirical results." From a purely
descriptive perspective, unless a researcher is willing to assume that the joint density
of x and y satis es certain conditions, he cannot consistently estimate this joint
density. Unless this empirical researcher is willing to make assumptions about the
underlying economic environment and the form and distribution of unobservables, he
cannot estimate economically meaningful magnitudes from the resulting econometric
model. So it is only the combination of economic and statistical assumptions that
allow conclusions about economic magnitudes to be drawn from the results of an
econometric modeling exercise.
3.4.1 `Magic' Instruments in Simultaneous Equations Models
Econometrics texts are fond of emphasizing the importance of exclusion restrictions
for identi cation. Yet in applied work, most researchers think of simultaneous equa-
tions identi cation problems as one of inclusion { What instruments should I use for
my right hand side endogenous variables?
Thisdi erenceusuallyariseswhen appliedresearchers areinitiallyunwillingorunable
to specify all the equations in their simultaneous equations system. This incomplete-
ness in the econometric modelre ects an incompleteness in the economic model. This
incompleteness can and should raise doubts about instruments. To see why, suppose
economic theory delivers the following linear simultaneous equations model
y1 = y2 +x1 +1
y2 = x121 +2
(9)
where the 's are independent identically distributed contemporaneously correlated
errors and x1 is an variable that is uncorrelated with 1 and 2. Suppose that a
researcher is interested in estimating the structural parameters and in the rst
20equation. As it stands, these parameters are not identi ed. The problem is that we
are missing an instrument for y2.
Whattodo? Oneapproachistorevisittheeconomictheoryinane orttounderstand
where additional instruments might come from. An alternative approach that is all
too common is the wisdom: \ nd an exogenous variable that is uncorrelated with the
's but at the same time correlated with the right hand side endogenous variable y2."
While these two approaches are not necessarily incompatible, the second approach
does not seem to involve any economics. (This should sound a warning bell!) All
one needs to nd is a variable that meets a statistical criterion. In some instances,
researchers do this by culling their data sets for variables that might reasonably be
viewed as satisfying this criterion.
Is this purely statistical approach valid? The following parable suggests why it is not.
We imagine a research assistant who, in an e ort to nd instruments for the rst
equation, hits upon the following creative idea. They instruct a computer to create
an instrumental variable, x2, as the sum of x1 plus computer-generated independent
identically distributed random noise. The noise is generated independently of the
model errors and x1 (i.e., they set x2 = x1 +, where  is independent of 1, 2 and
x1). This new variable satis es the statistical criteria to be a valid instrument: it is
by construction uncorrelated with the structural errors and yet correlated with y2.
Thus, itwouldappearthatthe research assistant has hituponamethodwhereby they
could always identify the coeÆcients in the rst equation as long as they initiallyhad
at least one exogenous variable and a good random number generator. No economics
is required!
We hope that the reader's instincts are that something is amiss here. To see what,
recall that it is the matrix of reduced form coeÆcients  and the variance of the
reduced form errors that we must use to recover the structural parameters. By
\ nding" x2 it is as though we have added another variable to the second equation
(which already is in reduced form)
y1 = y2 +x1 +1
y2 = x121 +x222 +2
(10)
We now appear to have identi cation because we have an exogenous variable (x2)
that predicts another endogenous variable in the system (y2) that is excluded from
the equation of interest.3 The problem with this logic is that economic theory and
3More formally, we would estimate the reduced form
y1 = x111 +x212 +v1
y2 = x121 +x222 +v2
(11)
and use the four reduced form coeÆcients to obtain consistent estimates of the four structural
parameters: ; ;21 and 22:
21common sense tell us that x2 does not enter the reduced form. Put another way, the
population value of 22 is zero! Thus, our computer-generated instrument does not
help us (asymptotically) to identify the structural coeÆcients in the rst equation.
To understand formally why this estimation strategy fails to produce consistent esti-
matesof and ,considertheindirectleastsquares(instrumentalvariables)estimator
for these two parameters. This estimator uses the instruments (x1;x2)0:

^
^

=
1
T
 PT
t=1 y2tx1t
PT
t=1 x2
1t PT
t=1 y2tx2t
PT
t=1 x1tx2t
 1 1
T
 PT
t=1 x1ty1t PT
t=1 x2ty1t

:
A necessary condition for the consistency of this instrumental variables estimator is
that the matrix
1
T
 PT
t=1 y2tx1t
PT
t=1 x2
1t PT
t=1 y2tx1t
PT
t=1 x1tx2t

;
converges in probability to a nite nonsingular matrix. Assume that
lim T!1
1
T
T X
t=1
x2
1t = M2:
Because x2t = x1t + t and t is distributed independently of 1t, 2t, and x1t, the
probability limit of this matrix is equal to:

M221 M2
M221 M2

; (12)
which is a singular matrix. This result follows from substituting x1t +t for x2t and
x1t21 +2t for y2t and then applying the appropriate laws of large numbers to each
element of the matrix. The singularity of (12) is just another way of saying that the
rank condition for identi cation of the rst equation of the structural model fails.
At rst, this example may seem extreme. No economist would use a random number
generator to create instruments { but this is our point! The researcher is informed
not to do this by economics. In practice, a researcher will never know whether a
speci c instrument is valid. For example, our students sometimes insist the computer
generatedinstrumentexampleisextreme, butthatmorecleverchoicesforinstruments
would work. After some thought, many suggest that setting x2 = x2
1 would work.
Their logic is that if x1 is independent of the errors, so must x2
1. Following the
derivations above, and assuming that limT!1
1
T
PT
t=1 x3
1t = M3, a nite, positive
constant, we again obtain a singular matrix similar to (12).
The value of economic theory is that it provides a defense for why the reduced form
coeÆcient on a prospective instrument is not zero. The statistical advice that led to
22computer-generated instruments and x2
1 does not do this.4
Some might argue that our example above ignores the fact that in most economic
applications, one can nd exogenous economic variables that satisfy our statistical
criterion. The argument then goes on to argue that because these variables are
economically related, we do not need a complete simultaneous equations model. The
following example discusses this possibility.
Example 4
Consider a researcher who has data on the prices rms charge in di erent geographic
markets, pi, the number of potential demanders (population) in that market POPi,
and whether or not the rm faces competition, COMPi. The researcher seeks to
measure the "e ect" of competition on prices by regressing price on market size as
measured by the number of potential demanders and the competition dummy. That
is, they estimate the regression
pi = POPi 1 +COMPi 2 +i: (13)
Without an underlying economic model, the OLS estimate of 2 on COMPi provides
a descriptive estimate of the coeÆcient in the best linear predictor of how prices and
change with the presence of competition.
The researcher might, however, claim that equation (13) has a structural economic
interpretation{namelythat2 measures byhowmuchpriceswouldchangeifwecould
introduce competition. One problem with this interpretation is that itis unlikely that
the presence of competition is determined independently of price. (See Section 10.)
In most entry models, competitors' decisions to enter a market are simultaneously
determinedwithpricesandquantities. Insuchcases, iftheresearcherdoesnotobserve
critical demand or supply variables, then OLS OLS will deliver inconsistent estimates
of 2.
One possible solution to this problem is to nd an instrumental variable for the pres-
ence of competitors. Suppose that the researcher claims that the average income of
residents in the market, Yi, is such an instrument. This claim might be justi ed by
statements to the e ect that the instrument is clearly correlated with the presence of
competitors, as an increase in average income, holding population xed, will increase
demand. The researcher also might assert that average income is determined inde-
pendently of demand for the good and thus will be uncorrelated with the error i in
equation (13).
4An element of xt is a valid instrument in linear simultaneous equations model if it satis es the
conditional moment restrictions (5), limT !1 1
T
PT
t=1 xt x0t
= Q, where Q is a positive de nite
matrix, and it enters at least one of the equations of the structural model. Our computer generated
instrument failed this last requirement.
23Does this make average income a valid instrument? Our answer is that the researcher
has yet to make a case. All the researcher has done is provide a statistical rationale
for the use of Yi as an instrument exactly analogous to the argument used to justify
the computer-generated instrument in Example 3. However, as this example shows,
the researcher needs to do more. Speci cally, to be convincing, the researcher must
do two more things. First, the researcher has to explain why it makes sense to
exclude average income from equation (13). To do this, the researcher will have
to provide a more complete economic justi cation for equation (13). What type of
equilibriumrelationshipdoes equation(13)characterize? Why isthe demand variable
POPi in this equation but average income, which also might be considered a demand
variable, not? Second, the researcher also will have to make a case that Yi enters the
reduced form for COMPi with a non-zero coeÆcient, or else the rank condition for
identi cation will fail by the logic presented in Example 3. The researcher will have
to be clearer about the form of the complete system of equations determining prices
and the presence of competitors. This will also require the researcher to spell out the
economic model underlying the simultaneous system of equations.
This next example reiterates our point that the results of a structural modeling exer-
cise are only as credible as the economic theory underlying it. One can always impose
inclusion and exclusion restrictions, but the resulting simultaneous equations model
need not have meaningful economic structure.
Example 5
The 1960's and 1970's IO literature contains many studies which regressed rm or
industry pro t rates (\performance") on market concentration measures (\market
structure"). In the late 1960's and early 1970's, many IO economists observed that
while concentration could increase pro ts, there could be the reverse causation: high
(low) pro ts would induce entry (exit). This led some to estimate linear simultaneous
equations models of the form:
PROFIT = 0 + 1 CONC +x1 2 +1
CONC = 0 + 1 PROFIT +x2 2 +2
(14)
wherePROFIT measuresindustrypro tability,CONCmeasuresindustryconcentra-
tion, the 's are errors and the 's and 's are parameters to be estimated. Particular
attention was paid to estimating the e ect of simultaneity bias on the signs and
magnitudes of 1 and 1.
Debates about the merits of these models often centered on what variables should be
included or excluded from each equation. What proved unsatisfactory about these
debates was that there were no clear answers. Put another way, although these were
called \structural" models of performance and market concentration, there was no
one theoretical model that provided a speci c economic interpretation of 1 and 1.
24Thus, even though instrumental variable methods might deliver consistent estimates
of 1 and 1, itwas never very clearwhat these estimatestoldus abouttheunderlying
theories.
To understand why we would not call this a structural model (even though it looks
like a \structural" model in the sense of having multiple endogenous variables in
a single equation), consider these questions: How do we know the rst equation
is a behavioral relation describing how industry pro tability responds to industry
concentration? And, How do we know the second equation describes the way rm
pro tability responds to industry concentration? The population values of 1 and 1,
the parameters that characterize how PROFIT responds to CONC and how CONC
responds to PROFIT, depend crucially on which elements of xt are included and
excluded from each equation of the structural model. Unless we have an economic
theorytellinguswhichelementsofxt doanddonotbelongineachbehavioralrelation,
whichequationwe designateasthe \pro tequation"andwhich equationwe designate
as a \concentration equation" is completely arbitrary. That is, like inclusion and
exclusion restrictions, the decisions about which elements of to normalize to one
are decisions that need to come from economic theory if they are to have a economic
interpretation.
In his criticism of large-scale macroeconometric models Sims (1980) referred to many
of the restrictions used to identify macro models as \incredible". He observed: \the
extent to which the distinctions among equations in large macro models are result
of normalizations, rather than truly structural distinctions, has not received much
emphasis." (Sims 1980, p. 3). By truly structural distinctions Sims meant exclusion
and other functional form restriction derived from economic theory. This same crit-
icism clearly applies to structural modeling of the relationship between pro ts and
concentration. As we describe in later sections, the lack of satisfactory answers to
such questions is what led some empirical IO economists to look more closely at what
economic theory had to say about rm pro tability and market concentration.
## 3.4.2 The Role of Non-Experimental Data in Structural Modeling
Virtually all data used in empirical economic research comes from non-experimental
settings. The use of non-experimental data can raise signi cant additional modeling
issues for descriptive and structural modelers. In descriptive models, the use of non-
experimental data usually raises purely statistical issues. For instance, a researcher
may want to describe the relationship between the prices of rms subject to a price
cap and the number of competitors. The most general approach to describing this
relationship would be to estimate exibly the joint distribution of prices and com-
petitors. Provided the cap is binding for some rms, the researcher would obtain a
density that had a spike of observations at the cap.
25Instead of exibly estimating the joint distribution of prices and competitors, the
researcher could instead use a regression to describe the relationship. As we argued
earlier, OLS will deliver consistent estimates of the best linear predictor provided the
error term has a conditional mean of zero. In this case, however, the presence of rms
at the cap, particularly when there are few competitors, may lead the researcher to
question the conditional mean of zero assumption. In response, the researcher might
instead use a Tobit or other limited dependent variable formulation of the linear
regression model to account for the fact that prices cannot exceed the cap.
Althoughsimilarstatisticalsamplingissuescanariseinstructuralmodels,astructural
econometric modeler would view the presence of a price cap as more than a statistical
nuisance. Rather, the cap is somethingthatneeds to be accounted forinthe modeling
of rm behavior and the unobservables.
To illustrate how structural models can account for non-experimental data, let us
return to the simultaneous equations demand and supply model for prices and quan-
tities. Suppose the researcher observes price, quantity consumers demand at that
price and consumer income (x1), and that the researcher has estimated the regression
qs
t = 0 + 1 pt + 2 x1t +1t
by OLS. For the researcher to be able to assert that they have estimated a demand
curve, as opposed to a descriptive best linear predictor, they must be able to argue
thatpriceandincomeareuncorrelatedwiththe error. When isthislikelythe case? In
principle, it would be the case if the researcher could perform experiments where they
faced all consumers with a random series of prices. The same experiment also could
be used to estimate a supply equation using OLS, provided the researcher observed
the quantity supplied at the randomly chosen price.
The key feature of the experiment that makes it possible to estimate both the de-
mand and supply equations by OLS is that the researcher observes both the quantity
demanded and the quantity supplied at each randomly chosen price. In general, the
the quantity demanded will not equal the quantity supplied at a randomly chosen
price. This is because the observed price is experimentally (randomly) determined
and it will not in general be the price that equates the quantity demanded with the
quantity supplied.
This discussion highlights the importance of the third equation in the demand and
supplysystem(3). Inprinciple,withnonexperimentaldataaresearchercouldobserve
how much demanders demand at an observed price p and how much suppliers would
supply { and these might be di erent amounts. In practice, researchers typically
do not observe the quantity demanded and supplied. They might for example only
observed the number of apartments in a city. If there are no regulations restricting
supply and demand, then the structural modeler might reasonably account for the
non-experimental nature of the price data by assuming that the observed prices are
26such that they equate demand and supply. In other words, the researcher might
impose the structural demand equals supply equation (3).
How does this non-experimental modeling of price determination compare to the ex-
perimental case? One way is view the non-experimental data is that it came from
a grand experiment. Imagine that in this grander experiment, the experimentalist
had collected data for a vast range of randomly selected prices, incomes and input
prices. Imagine now someone else extracts from the experimentalist's data only those
observations in which the experimenter's randomly chosen prices, incomes and input
prices resulted in the quantities supplied exactly equaling the quantities demanded.
This nonrandom sample selection criterion would yield a data set with signi cantly
less information and, more importantly, nonrandom prices. Thus, even though the
original data came from an experiment, OLS would no longer deliver consistent es-
timates of the supply and demand parameters. On the other hand, if the researcher
were to apply instrumental variable techniques appropriate for a structural simul-
taneous equations model that (correctly) imposed the market clearing equation (3),
they would obtain consistent estimates.
Our general point here is that structural models are valuable in non-experimental
contexts because they force the researcher to grapple directly with non-experimental
aspects of data. Consider again the demand and supply model above. How did we
know it was appropriate to impose qs = qd? The answer came not from a statis-
tical model of the nonrandomness, but from our economic perspective on the non-
experimental data { we assumed that the data came from cities where there were no
rent oors or ceilings. Had there been rent oors or ceilings, this would change the
third equation in our econometric model. For example, with binding rent ceilings,
we might assume that the quantity we observe is quantity supplied. (With a bind-
ing ceiling, quantity demanded exceeds supply, but we typically would not know by
how much.) Our econometric model now would have to account for this selection of
quantities. A variety of such \disequilibrium" demand and supply models exist are
reviewed in Madalla (19XX).
4 A Framework for Structural Econometric Mod-
els in IO
Having described di erences between descriptive and structural models, we now pro-
vide a framework for building and evaluating structural econometric models. While
in principle it would seem easy for empiricists to recast an economic model as an
econometric model, this has not proven true in practice. This process of combining
economics and statistics is by no means formulaic. We do, however, believe that
there are certain general guidelines and procedures one can follow. In this section,
27we propose a framework for constructing and evaluating structural econometric IO
models. This framework provides a lens through which we can view the progress of
structural modeling in IO.
Structuralmodeling,andtheelementsofourframework,arenotnewtoIOormostap-
plied elds in economics. More than fty years ago, Trygve Haavelmo and economists
at the Cowles Foundation began combining models of individual agent behavior with
stochastic speci cations describing what the econometrician does not know:
The method of econometric research aims, essentially, at a conjunction
of economic theory and actual measurements, using the theory and tech-
nique of statistical inference as a bridge pier. ... So far, the common
procedure has been to rst construct an economic theory involving ex-
act functional relationships, then to compare this theory with some ac-
tual measurements, and nally \to judge" whether the correspondence is
\good" or \bad." Tools of statistical inference have been introduced, in
some degree, to support such judgment... [Haavelmo (1944), p. iii]
While the general principle of combiningmodels of economic behavior with stochastic
speci cations has been around for some time, each eld of economics has had to
confront its own problems of how best to combine models with data. Often the desire
to have a simple, well-de ned probability model of the endogenous variables forces
compromises. Earlyon, Hoodand Koopmansdescribed the challengefacingempirical
economists as:
In reality, unobserved randomvariablesneed tobe introduced torepresent
\shocks" in behavior relations (i.e., the aggregate e ects of on economic
decisions of numerous variables that are not separately observed) and \er-
rors" of measurement. The choice of assumptions as to the distribution of
these random variables is further complicated by the fact that the behav-
ior equations in question are often aggregated over rms or individuals.
The implications of this fact are insuÆciently explored so far. [Hood and
Koopmans (1953), page xv]
Following in this tradition, we describe a procedure for structural economic modeling
that contains three basic steps. The rst step is a well-de ned economic model of the
environmentunderconsideration. ThesecondstepinvolvesaddingasuÆcientnumber
of stochastic unobservables to the economic model, so that its solution produces a
joint density for all observables that has positive support on all possible realizations
of these variables. The nal step involves verifying the adequacy of the resulting
structural econometric model as a statistical description of the observed data.
284.1 The Economic Model
The rst main component of a structural model is a complete speci cation of the
equations describing economic behavior, what we call the economic model. Almost
all economic models in IO have the following ve components:
1. A description of the economic environment, including
(a) The extent of the market and its institutions
(b) The economic actors
(c) The information available to actors
2. A list of primitives, including:
(a) Technologies (e.g., production sets)
(b) Preferences (e.g., utility functions)
(c) Endowments (e.g., assets)
3. Variables exogenous to agents and the economic environment, including:
(a) Constraints on agents' behavior
(b) Variables outside the model that alter the behavior of economic agents
4. The decision variables, time horizons and objective functions of agents, such as:
(a) Utility maximization by consumers; quantity demanded
(b) Pro t maximization by rms; quantity supplied
5. An equilibrium solution concept, such as:
(a) Walrasian equilibrium with price-taking behavior by consumers
(b) Nash equilibrium with strategic quantity or price selection by rms
While the rigor of mathematics forces theorists to be clear about these components
whentheybuildaneconomicmodel,structuraleconometricmodelsdi erconsiderably
in the extent to which they spell out these components. Our later discussions will
illustrate the value of trying to make these components clear. In particular, we will
focus attention on component 5, the equilibrium solution concept, because this is the
most critical and speci c to IO models.
294.2 The Stochastic Model
The next step in structural modelingis unique to empiricalresearch. It receives much
less attention than it deserves. This step is the process by which one transforms a
deterministic (or stochastic) economic model into an econometric model. An econo-
metric model is distinct from an economic model in that it includes unobservables
that account for the fact that the economic model does not perfectly t observed
data. Our main point is that the process of introducing errors should not be arbi-
trary. Both the source and properties of these errors can have a critical impact on
the distribution of the observed endogenous variables and estimation.
The four principal ways in which a researcher can introduce stochastic components
into a deterministic economic model are:
1. Researcher uncertainty about the economic environment
2. Agent uncertainty about the economic environment
3. Optimization errors on the part of economic agents
4. Measurement errors in observed variables
This subsection emphasizes how these stochastic speci cations di er, and in partic-
ular how they can a ect the manner by which the researcher goes about estimating
structural parameters.
## 4.2.1 Unobserved Heterogeneity and Agent Uncertainty
A researcher's uncertainty about the economic environment can take a variety of
forms. These di erent forms can have dramatically di erent implications for identi -
cation and estimation. For this reason it is critical for structural modelers to explain
where error terms come from and whose uncertainty they represent. A critical dis-
tinction that needs to be drawn in almost every instance is: Is the uncertainty being
introduced shared by the economic actors?
A common assumption is that the researcher knows much less about the economic
environment than the economic agents. In this case, the economic agents base their
decisions on information that the researcher can only include in an error term. For
example, if the researcher did not observe auction bidders' private information about
an object, then the researcher would be forced to model how this unobservable in-
formation impacted bids. Similarly in Example 2, because the researcher did not
observe how demand intercepts di ered across markets, they were forced to model
how the di erences in the demand intercepts would impact rms' output decisions.
30In general, situations in which economic agents base their decisions on something the
researcher does not observed are termed cases of unobserved heterogeneity.
Of course researchers and economic agents can share uncertainty about the economic
environmentunderstudy. Forexample, inExample2, the rmcouldalsobeuncertain
about the demand intercept. This case di ers from the case of pure unobserved
heterogeneity in that now rms' quantity decisions are based on their expected (as
opposed to realized) demand.5 A structural auction modelcould have a similar avor.
Forinstance, the bidder mayknow theirvalueforanobject, but notthe privatevalues
of the other bidders. In each of these cases, the rm or agent is presumed to know
the distribution of uncertainty and make decisions that optimize the expected value
of an objective function.
It might seem that because the econometrician is ignorant in both cases that unob-
served heterogeneity and agent uncertainty are two sides of the same coin { they both
rationalize introducing error terms in a structural model. The distinction, however,
often is important for determining which estimation procedure is appropriate. To
underscore this point, we now return to the two models described in (2). We shall
show that, depending on our assumptions about the source of the errors, it may be
appropriate to regress lnTC on lnQ and other controls, or lnQ on lnTC and these
same controls.
Example 5
Imagine that we have cross-section data on comparable rms consisting of output, Q,
total costs, TC, and input prices, pK and pL. Our goal is to consistently estimation
and in the Cobb-Douglas production function:
Qi = Ai Li Ki :
Since we do not have labor and capital information, we need to derive a relationship
between total costs and output. There are many possible ways of doing this, each
depending on what additionalassumptions we make about the economic environment
in which rms their make decisions.
Suppose, forexample, thatthe rmsareinaregulatedindustry, and have di erent Ai.
For the purposes of exposition, assume that demand is completely inelastic. Consider
now the case of pure unobserved heterogeneity (Type 1 shocks), where Ai is observed
by the rm and the regulator, but not the econometrician. In this case, pro ts equal:
(pi ;Ki ;Li ) = pi Ai Li Ki pKi Ki pLi Li
5We presume that upon learning the demand intercept the rm cannot instantaneously adjust
output to maximize pro ts.
31Suppose that the regulator chooses pi, the price of rm i's output rst, and the
rm then chooses Ki and Li. Because demand is inelastic, a regulator interested in
consumer welfare will set the rm's output price equal to the minimum average cost
of producing Qi. At this price, pr
i, the rm chooses its inputs to minimize costs given
the regulator's price and Qi. That is, the rm maximizes
(Ki ;Li ) = pr
i Ai Li Ki pKi Ki pLi Li
Solving the rm's pro t-maximizing problem, yields the total cost function:
TCi = C0 pKi p1
Li QÆ
i A Æ
i ; (15)
relating rm i's observed total cost data to its output. In this equation, Æ = 1=( + )
and = =( + ). We can transform this total cost function into a regression
equation using natural logarithms:
ln TCi = ln C0 + ln pKi +(1 )lnpLi +Æ ln Qi Æ ln Ai (16)
While this equation holds exactly for the rm, the researcher does not observe the
Ai. The researcher thus must treat the eÆciency di erences as unobservable in this
logarithm of total cost regression:
ln TCi = C1 + ln pKi +(1 )ln pLi +Æ ln Qi Æln ui: (17)
This regression equation contains the mean zero error term
ln ui = ln Ai E[ln Ai j ln pKi;ln pLi; ln Qi]:
The new constant term C1 = ln C0 + E[ln Ai j ln pKi; ln pLi; ln Qi] absorbs the
nonzero conditional mean of the eÆciency di erences.
To summarize, we have derived a regression equation that is linear in functions of
the (regulated) rm's production parameters. The relationshipincludes an error term
that represents the rms' unobserved productive eÆciencies. This error term explains
why, at the same output level and input prices, the rms could have di erent total
costs. What is left to explain, is how a researcher would estimate the production
parameters. This is a non-trivial issue in general. Here it is possible to argue that
under fairly weak assumptions on the distribution of the ui we can use ordinary least
squares (OLS) to recover the production parameters. Note that OLS is appropriate
because we have assumed that the regulator (and not the rm) picks price to recover
the rm's minimumproduction cost to serve output Qi. Put another way, OLS works
because the unobserved heterogeneity in rms' production eÆciencies is unrelated to
the left hand side regressors: rm output (which is inelasticallydemanded) and input
prices (inputs are elastically supplied).
32Now suppose that we observe the same data, but that the rm, like the econometri-
cian, does not know its productive eÆciency, Ai. This assumption leads to a di erent
estimation strategy. In this case, the rm now must make its input decisions before
it knows Ai. As long as the rm cannot undo this choice once Ai is realized, the rm
maximizes expected pro ts taking into account the distribution of Ai. Now the rm
i's expected pro t function is:
E[(pi;Li;Ki)] = E[piAiLi Ki ] pKiKi pLiLi (18)
We should note here that the expectation operator represents the rm's expectation.
Assume that the regulator again chooses pi; the rm then chooses Ki and Li. For
simplicity, suppose that the regulator and the rm have the same uncertainty about
the rm's productive eÆciency. Suppose additionally that the regulator sets price,
per
i , such that the rm earns zero pro ts in expectation. The rm then maximizes:
E[(per
i Ki;Li)] = per
i E[AiLi Ki ] pKiKi pLiLi: (19)
The rst-order conditions for expected pro t maximization imply
Li =
"
pKi
pLi
#
Ki (20)
Observed total costs therefore equal
TCi =
+
pKi Ki (21)
and do not depend on the rm's (random) eÆciency parameter Ai. Substituting
these two expressions into the production function, we obtain an equation relating
the observed (random) output Qa
i to the rm's input prices and total costs
Qa
i = D0 TC +
i pKi pLi Ai (22)
From both the rms' and the econometrician's perspective, the sole source of ran-
domness here is the eÆciency parameter Ai. Taking natural logarithms of both sides
we obtain a regression equation that is linear in the production parameters
ln Qa
i = ln D0 +( + ) ln TCi ln pKi ln pLi +ln Ai: (23)
This equation exactly explains rm i's realized production Qa
i (which di ers from the
inelastically demanded quantity Qi). Neither the rms nor the econometrician knows
the Ai ex ante. Because the researcher also does not observe the eÆciencies ex post,
33she must treat the eÆciencies as random errors. She thus estimates the regression
ln Qi = D1 ( + ) ln TCi ln pKi ln pLi +i: (24)
where i = ln Ai E[ln Ai j ln pKi; ln pLi; ln TCi ]. The constant term D1 =
ln D0 +E[ln Ai j ln pKi; ln pLi; ln Qi ] absorbs the nonzero conditional mean of the
eÆciency di erences. We can now use OLS to estimate the production parameters
because by assumption the uncertainty in production is realized after the rm makes
its production decision and is unrelated to total costs and input prices.
This example illustrates how the structural model's economic and stochastic assump-
tionscan have a criticalbearingon the consistency of aparticularestimationstrategy.
Under one set of economic and stochastic assumptions, OLS applied to equation (17)
yields consistent estimates of the parameters of the rm's production function; under
another set, we swap the dependent variablefor one independent variable. Both mod-
els assumed (expected) pro t-maximizing rms and (expected) welfare-maximizing
regulators. In the rst case, the stochastic shock represented only the researcher's
ignorance about the productivity of rms. In the second, case, it represented uncer-
tainty on the part of the rm, the regulator and the researcher about the productivity
of the rm.
We now can better understand our initial point that a researcher should decide be-
tween models based upon how well their economic and stochastic assumptions match
the environment in which the reseacher's data were generated. Since no economic
model is perfect in practice, the researcher often will be left choosing among imper-
fect assumptions and models. No statisticaltest can automatethe process ofchoosing
amongmodels. In latersections, we willdiscuss in moredetailhow a researcher might
go about choosing among competing models.
## 4.2.2 Optimization Errors
The third type of error listed above, optimization error, has received the least atten-
tionfromstructuralmodelers. Inpart, optimizationerrorshavereceivedlessattention
because there are few formal decision-theoretic models of optimization errors. The
errors we have in mind are best illustrated by the behavior of economic agents in
experiments. Experimental subjects often make errors, even when faced with rela-
tively simple tasks. Experimentalists' interpretations of these errors has been the
source of considerable debate (e.g., see Camerer's (1995) survey). Here, we adopt a
narrow view of what optimization error means so that we can illustrate the potential
34signi cance of such errors for structural models.
Example 6
Thisexamplenarrowlyinterpretsoptimizationerrorsasthefailureofagents'decisions
to satisfy rst-order necessary conditions for optimal decisions exactly. We are silent
hereonwhatcausesthisfailure,andfocusinsteadonitsconsequences. Asanexample,
consider the standard consumer demand problem with unobserved heterogeneity in
the utility function:
min 0

max x0
U(x;)+(M p0x);

(25)
where x is an n-dimensional vector of consumption goods, p is the vector of prices,
and M is the consumer's total budget. The vector  represents elements of individual
tastes that the researcher does not observe. The normal rst-order condition for xi,
assuming  is known is:
@U
@xi
(xi;i) i pi = 0: (26)
These equations yield the i = 1;:::;n Marshallian demands, xi (p;M;). In this case,
the agent's rst- order conditions are assumed to hold with probability one, so that
for all realizations of  all of the integrability conditions hold for the xi(p;M;).
Nowsuppose thatwe introduceanadditionalsource oferrorintotheagent'sdemands.
Although there are several ways to introduce error, imagine the errors do not impact
the consumer's budget constraint (i.e., we still have M =
Pn
i=1 pi xi), but do impact
the rst-order conditions (26). Speci cally, suppose
@U
@xi
(x;)  pi i = 0: (27)
The researcher does not observe the i, and thus treats them as random variables.
Supposeforconvenience thattheresearcher believesthese errorshavepositivesupport
and a mean of one in the population, so that on average the rst-order conditions are
correct.
How do the i impact agents' decisions? If we solve the rst-order conditions, and use
the budget constraint, we obtain the Marshallian demands functions xi(p;M;;).
Although the \demand curves" that result from this process satisfy homogeneity of
degree zero in prices and total expenditure, they do not necessarily have a negative
semi-de nite Slutsky matrix for all realizations of the vector .
The next example shows how optimization errors can be used to rationalize why
two seemingly identical consumers who face the same prices may purchase di erent
35amounts of x and y.
Example 7
Imagine that we have demand data from a cross-section of similar consumers, all
of whom have the same budget M, which they spend on two goods x and y. How
shouldwemodelthedi erencesintheirconsumption? Onepossiblemodelingstrategy
would be to say consumers have di erent preferences. Another would be to assume
consumers have the same preference function, but that they make optimizationerrors
when they make decisions.
Following equation (27), we might assume each consumer has the utility function is
U(x;y) = xa yb. Solving the rst-order conditions we obtain
a
x
=  px xi;
b
y
=  py yi; px x+py y = M; (28)
where  is the Lagrange multiplier associated with the budget constraint and xi and
yi are positive random variables representing optimization errors. Further algebra
yields
 = i + i
M
with i =
a
xi
and i =
b
yi
; (29)
x = i
i + i
M
px
and y = i
i + i
M
py
: (30)
These demand functions look exactly like what we would get if there were no opti-
mization error, and we had instead started with the Cobb-Douglas utility function
U(x;y) = x i y i . In other words, if we had started the modeling exercise by assum-
ing that consumers did not make optimization errors, but instead had Cobb-Douglas
preferences with heterogeneous utility parameters, we would have obtained an obser-
vationally equivalent demand model. The only way we might be able to distinguish
between the two views would be to have data on consumers' choices across di erent
purchase occasions. In this case, if consumers' tastes were time invariant, but their
optimizationerrors varied intertemporarlly, we could in principle distinguish between
optimization error and unobserved heterogeneity in tastes.
Optimizationerrors also can reduce the perceived rationalityof agents' behavior. The
followingexampleshows that the way inwhich optimizationerrors are introduced can
a ect the extent to which rms are observed to be optimizing according to standard
producer theory.
Example 7
Consider a set of rms that have the common production function Q = L K .
Supposeeach rmmakesoptimizationerrorswhenitattemptstominimizeproduction
36costs. Speci cally, assume that the factor demand functions are generated by solving
the following three equations:
pL L =  K L 1; pK K =  K 1 L and Q = K L ; (31)
where  is the Lagrange multiplier associated with the constraint that the rm pro-
duce using the production function, and Li and vKi are unit mean, positive random
variables representing optimization errors. Solving these three equations yields fol-
lowing two factor demands:
L = Q
1
+
"
pK
pL
#
+
"
K
L
#
+
(32)
K = Q
1
+
"
pK
pL
#
+
"
K
L
#
+
: (33)
An implicationofthe optimizationerrors, xi and yi, isthatthe symmetry restriction
implied by cost-minimization behavior fails. Speci cally, the restriction
@L
@pK
=
@K
@pL
(34)
doesnothold. Consequently, despitethefactthatfactordemandshonorthefeasibility
constraintimpliedbytheproductionfunction,theydonotsatisfyalloftherestrictions
implied by optimizing behavior.
Depending on how optimization errors are introduced, varying degrees of rationality
can be imposed on factor demand and consumer demand systems. For example,
optimization errors can be introduced in such a way as to yield demands that satisfy
the budget constraint and nothing else. This is another way of making Gary Becker's
(1962) point that much of the apparent rationality in economic behavior comes from
imposingabudgetconstraintoratechnologicalconstraintonwhatotherwiseamounts
to irrational behavior.
This discussion of optimization errors has hopefully demonstrated the extremely im-
portant and often overlooked point: the addition of disturbances to deterministic be-
havioral relationshipsis not innocuous. Depending on how this is done, a well-de ned
deterministiceconomicmodelcanbetransformedintoanincoherentstatisticalmodel.
For example, if the random disturbances in equation (27) are allowed to take on val-
ues less than zero, for certain realizations of  this system of rst-order conditions
may not have a solution in x and , or may have multiple solutions. Because of
these concerns, we recommend that the underlying economic model be formulated
with the stochastic structure included, rather than including random shocks into a
deterministic model as an afterthought.
374.2.3 Measurement Error
Besides thesesources oferror, structuralmodelsalsomayincludemeasurementerrors.
Measurement errors occur when the variables the researcher observes are di erent
from those the agents observe because of data reporting and collection errors. In
most cases, it is impossible for researchers to distinguish measurement error from the
three other sources of error. As we shall see below, this distinction is nevertheless
important, having signi cant implications not only for estimation and testing, but
also for policy evaluations.
Measurement errors also occur in exogenous variables. Unfortunately, these mea-
surement errors often are ignored even though they can be a much greater source
of concern. For example, measurement errors in the regressors of a linear regression
model will destroy the consistency of OLS. Attempts to handle measurement error
in exogenous variables often are frustrated by the fact that there often is little prior
information about the properties of the measurement error. This means that the
researcher typically must predicate any solution on untestable assumptions about the
measurement error. As a result, most researchers only acknowledge measurement er-
ror in an exogenous variable when they think that the measurement error constitutes
a large component of the variation in the exogenous variable.
Measurement error can serve useful purposes in structural econometric modeling.
For example, measurement error can make what would otherwise be an incoherent
structural model coherent. Consider the case where consumers face nonlinear budget
sets. Suppose a consumer must pay $ 1 per unit for the rst 10 units consumed and
then $ 10 per unit for all units beyond the tenth unit consumed. Given the large
di erence in price between the tenth and eleventh units, we would expect that many
consumers would purchase exactly 10units. In realdata, we oftendo notsee dramatic
spikes in consumption when marginal prices increase. One way to account for this is
to assume that actual consumption is measured with error. This is consistent with
the theoretical model's prediction of a probability mass at exactly 10 units, but our
not observing a strong spike at ten units.
Measurement error also is is a straightforward way of converting a deterministic eco-
nomic model into a statistical model. In Example 1, for instance, we introduced
measurement errors to justify apply OLS to what otherwise should have been a de-
terministic relation. However, as we also noted in Example 1, it is usually unrealistic
toassumethatmeasurementerroristheonlysourceoferror. Ingeneral, measurement
error should be introduced as one of several possible sources of error.
384.3 Steps to Estimation
Given a well-de ned stochastic model, the next part of our framework is to add
any parametric and distributional assumptions necessary to nalize the model. The
researcher then is in a position to select an estimation technique and to formulate,
where possible, tests of maintained assumptions. We think of this process as having
four interrelated selections:
1. Selection of functional forms
2. Selection of distributional assumptions
3. Selection of an estimation technique
4. Selection of speci cation tests
There are several criteria a researcher should keep in mind when choosing a func-
tional form. One of the most important is that there is tradeo between data and
parametric exibility. Larger datasets usually allow greater parametric exibility. A
second criterion is that the functional form should permit exibility when estimating
economic quantities of interest. To take an extreme example, if we are interested in
estimating an input elasticity of substitution, then a Cobb-Douglas production func-
tion will not work. While this is an extreme case, the structural modeling literature
contains nontrivial examples where the functional form almost entirely delivers the
desired empirical result.
A third criterion is ease of estimation. If a speci c functional form results in a model
that is easier to estimate, that should certainly be a factor in its favor. Similarly,
if one functional form makes it easier to impose economic restrictions than another,
then that too should favor its selection. As an example, it is very easy to impose ho-
mogeneity of degree one in input prices on a translog production function. This is not
the case for a quadratic cost function. A nal criterion is estimation transparency. In
some cases, it pays to select a functional form that leads to simpler estimation tech-
niques. This has the advantage of making iteasier for other researchers to understand
how the researcher arrived at their estimates.
Turning now to the choice of distributional assumptions, a researcher's stochastic
speci cation may or may not involve a complete set of distributional assumptions.
Totheextentthattheresearcher iswillingtocompletelyspecifythedistributionofthe
model errors, the structural model implies a conditional distribution of the observed
endogenous variables given the exogenous variables. At this point the researcher can
consider using maximum likelihood, or a similar technique (e.g., simulated maximum
likelihood or the EM algorithm) to estimate the parameters of interest.
39As a speci c example, consider an optimizing model of producer behavior. Suppose
the economic model speci es a functional form for (y;x;; ) { a rm's expected
pro t function as a function of outputs produced and inputs consumed, y; a vector
of input and output prices, x; the vector of rm characteristics observable to the rm
but not the researcher, ; and a vector of parameters to be estimated, . If the rm
maximizes pro ts by choosing y, we have the rst-order conditions
@(y;x;; )
@y
= 0: (35)
Assuming that the inverse function y = h(x;; ) exists and assuming the only source
of error, , has the density, f(;), we can apply the change of variables formula to
compute the density of y from the density of the unobservable 
p(y jx;; ) = f(h 1(y;x; );)
@h 1(y;x; )
@y
(36)
This density can be used to construct the likelihood function for each observation of
y.
The nal two items on our list include familiar issues in estimation and testing. An
advantage of using maximum likelihood in the previous example, is that it would be
clear to other researchers how the elements of the economic and stochastic models
led to the estimation method. There are of course costs to being this complete. One
is that maximum likelihood estimators may be diÆcult to compute. A second is
that there is a tradeo between eÆciency and robustness. Maximum likelihood tech-
niques may be inconsistent if not all of the distributional assumptions hold. Method
of moments and other estimation techniques may impose fewer restrictions on the
distribution of , but also may yield less eÆcient estimates. It also is the case that
alternatives to maximum likelihood may not allow the estimation of some parame-
ters. This is a corollary to our earlier point about structure. In some instances, the
researcher's economic structure exists only because of distributional assumptions. In
subsequent sections, we will illustrate how distributional assumptions can be what
identi es economic structure.
Once the researcher obtains estimates of the structural model, it is important to
examine, where possible, any restrictions implied by a structural model's economic
and stochastic assumptions. In addition, it is useful to examine, where possible, how
sensitive estimates are to particular assumptions. Thus, if the researcher has used
instrumental variable methods to estimate a model, and there are over-identifying
restrictions, then these restrictions should be tested. If a researcher assumes an error
term is white noise, then tests for heteroscedastic and/or autocorrelated errors are
appropriate. As for the sensitivity of estimates, the researcher can check whether ad-
ditional variables should be included, or whether other functional form assumptions
40are too restrictive. Although it is extremely diÆcult to determine the appropriate
nominal size for these speci cation tests, it is still worthwhile to compute the mag-
nitude of these test statistics to assess the extent to which the structural model
estimated is inconsistent with the observed data. Once the structural model is shown
not to be wildly inconsistent with the observed data, the researcher is ready to use
this structural model to answer the sorts of questions discussed in section 2 and this
section.
## 4.4 Structural Model Epilogue
An important premise in what follows is that no structural analysis should go forward
without a convincing argument that the potential insights of the structural model
exceed the costs of restrictive or untestable assumptions. Knowing how to trade
o these costs and bene ts is critical to knowing whether it makes sense to develop
and estimate a structural econometric model. We hope that our framework and our
discussion ofthe IO literaturewillprovide somesense ofthe \art"involved inbuilding
and evaluating structural models.
In what follows, we propose to show how researchers in IO have used structural
econometric models. Our purpose is not to provide a complete survey of IO. There
already are several excellent literature surveys of areas such as auctions and rm
competition. We propose instead to provide a sense of how IO empiricists have gone
about combining game- theoretic economic and statistical models. We also aim to
provide a sense of how far IO researchers are in solving important econometric issues
posed by gametheoreticmodels. Inourdiscussions, we hopetoconvey thatstructural
modeling should be more than high-tech statistics applied to economic data. Indeed,
we aim to show through examples how the economic question being answered should
motivate the choice of technique (rather than the other way around).
## 5 Demand and Supply Under Imperfect Competi-
tion
In this section, we discuss Porter's (1983) empirical model of competition in an
oligopoly market. We begin with Porter's model for several reasons. First, it was
one of the rst to estimate a complex game-theoretic model of competition. Second,
the model bears a strong resemblance to the classical demand and supply model we
discussed in section 3. Third, we think it is an excellent example of how structural
econometric modeling should be undertaken. In the process of reviewing his model,
we hope to illustrate how our framework can help identify the essential ingredients of
a structural model.
415.1 Using Price and Quantity Data to Diagnose Collusion
One of the most important research topics in IO is how to measure the extent of
competition in an industry. This question is of more than academic interest, as
policy makers and the courts often are called upon to assess the extent of intra-
industry competition. Additionally, when policymakers or the courts nd there is
insuÆcient competition, they must go a step further and propose remedies that will
prevent rms from colluding or otherwise exercising excessive market power.
Most researchers studying competition do not know when rms are competing or
colluding. Instead, they seek to infer the presence or absence of competition from
other data, most frequently data on prices and quantities. Sometimes these studies
are conducted using rm-level or product-level price and quantity information, and
sometimes they only have industry price and quantity data. The central message of
the next several sections is:
TheinferencesthatIOresearchers' drawaboutcompetitionfrompriceand
quantity data rest heavily on what the researchers assume about demand,
costs, and the nature of rms' unobservable strategic interactions.
It is therefore essential to evaluate how each of these components a ects aresearcher's
ability to use non-experimental price and quantity data to identify the extent of
industry competition.
The demand speci cation plays a critical role in competition models because its po-
sition, shape and sensitivity to competitors' actions a ects a rm's ability to markup
price above cost. The IO literature typically draws a distinction between demand
models for homogeneous product markets and di erentiated product markets. In this
section we consider homogeneous product models in which rms' products are perfect
substitutes and there is a single industry price. In this case, industry demand has the
general form:
Market Demand Q = h(P;Z; ;) (37)
where Q is total industry quantity, P is industry price, Z are market demand vari-
ables, are parameters that a ect the shape and position of market demand, and 
is a market demand error. This demand function is an economic primitive. By itself
it tells us nothing about rm behavior or the extent of competition. Inferences about
competition, however, inextricably linked to what the researcher assumes about de-
mand. Thisisbecause the demandcurve enters into rms'pro t-maximizingquantity
or price decisions.
To model rms' price or quantity decisions, the researcher must rst take a stand
on the form of rms' pro t functions. Once these are speci ed, the researcher must
thenintroduceassumptionsabouthow rmsinteract. These assumptionsabout rms'
42strategicinteractionsa ectthestructureofthe rst-orderconditionsthatcharacterize
rms' optimizing price or quantity decisions. This \structure" in turn a ects the
industry \supply" equation that the researcher would use to draw inferences about
competition.
In some, but not all, cases it is possible to parameterize the impact of competition on
rms' rst-order conditions in such a way that they aggregate to an industry price or
\supply" equation:
\Industry Supply" P = g(Q;W;;) (38)
where W are variables that enter the rms' cost functions,  are parameters that
a ect the shape and position of the rms' cost curves and possibly describe their
competitive interactions, and  is a error term for market supply.
Equations (37) and (38) look like nonlinear versions of the simultaneous linear equa-
tions in (3) of Example 3. Both sets of equations describe equilibrium industry prices
and quantities. The chief di erence is that in an oligopolistic setting, the \supply"
equation is not a competitive supply equation but an aggregation of rm rst-order
conditions for pro t-maximization in which rms mark price up above marginal cost.
The extent to which price is above marginal cost depends on rms' competitive in-
teractions. The critical issue is: What about the demand and \supply" equations
identi es the extent of competition from observations on prices and quantities?
Porter's study provides a useful vehicle for understanding the assumptions necessary
to identify the extent of competition from industry price and quantity data. In
particular, his study makes it clear that without imposing speci c functional form
restrictions on market demand and industry supply, we have no hope of estimating
the market demand curve or rm cost curves. This is because the researcher only
observes pairs of prices and quantities that solve (37) and (38). Even the researcher is
willingto make distributionalassumptions about the joint density of  and , without
assumptions on the functional form of (37) and (38), the assumption that P and Q
are equilibrium magnitudes only implies that there is conditional density of P and Q
given Z and W. Consequently, if the researcher is unwilling to make any parametric
assumptions for the demand and supply equations, he would, at best, be able to only
recover the joint density of P and Q given Z and W using the exible smoothing
techniques described earlier. Only by making parametric assumptions for the supply
and demand equations can these two equations be separately identi ed and estimated
from market-clearing prices and quantities. This is precisely the strategy that Porter
(1983) and all subsequent researchers take in estimating the competitiveness of a
market from equilibrium price and quantity data.
Rosse (1972) rst estimated the extent of market power possessed by a rm from
market-clearing price and quantity, using a sample of monopoly markets. Porter's
1983 study of nineteenth century U.S. railroad cartels is one of the rst papers in IO
43to devise a sophisticated structural econometric model of a cartelized industry.6 The
economic logic for Porter's empirical model comes from Green and Porter (1983).
Green and Porter explore the idea that cartels might use price wars to discipline
members who deviate from cartel prices or output quotas. Speci cally, Green and
Porter develop a dynamic model of a homogeneous product market in which potential
cartel members face random shocks to industry demand. By assumption, rms never
perfectly observe demand or other rms' output decisions. In this noisy environment,
cartel participants have trouble identifying whether lower prices are the result of a
breakdown in the cartel or low demand. Green and Porter's work shows that rms
cansupport acartelby agreeingtoaperiodofcompetitivepricingofapre-determined
length whenever market prices fall below a trigger price.
In what follows, we use our framework to discuss the components of Porter's model.
In particular, we focus on the assumptions that allow Porter to identify competitive
pricing regimes. In the process, we hope to illustrate many of our earlier points about
structural models. The main lessons we take away from Porter's analysis is that it is
impossibleto identify the extent of market power exercised by a rm or in an industry
fromadescriptivedataanalysis. Itisalsoimpossibletodeterminede nitivelywhether
rms are colluding from this sort of data analysis. Inferences about the extent of
market power exercised, or the presence and pervasiveness of collusion, rest heavily
oneconomic, functionalformandstochasticassumptions. Ingeneral, itisnotpossible
to test all these assumptions. The strength of Porter's equilibrium model in which
the cartel switches between monopoly and competitive prices is that it is possible to
see what is needed to identify monopoly versus competitive regimes.
## 5.2 The Economic Model
## 5.2.1 Environment and Primitives
Porter begins, as does most of the structural IO literature, by outlining a static,
homogeneous product oligopoly model where the number of rms (entrants) N is
exogenously given. All rms know the functional form of market demand and each
others' costs. In Porter's homogeneous product model, there is a single, constant
elasticity industry demand curve at each period t:
lnQt = + ln Pt +Zt +t; (39)
where Q is industry output, P is industry price, Z is a vector of exogenous demand
shifters, is a conformable vector of unknown coeÆcients,  is a time-invariant price
elasticity of demand, and t is an error term. It appears that Porter uses a constant
6See Bresnahan (1989) for a detailed survey of early work on estimating market power.
44elasticity demand function because it considerably simpli es subsequent calculations
and estimation. Data limitations also limit Zt to one exogenous variable, a dummy
for whether competing shipping routes on the Great Lakes were free of ice. Although
he does not discuss the source of the demand error term, it plausible to imagine that
it is included to account for demand factors observable to rms but not to Porter.
Each rm has xed costs of Fi and a constant elasticity variable cost function of the
form
Ci(qit) = ai qÆ
it (40)
where i indexes rms, t indexes time and q is rm-level output. The motivation for
this rm-level cost function appears to be that it delivers a rm-level \supply" of
output curve for a range models of competition that can be aggregated and to obtain
an industry-level \supply" curve.
Porter leaves portions of the economic environment unspeci ed. Although, compet-
ing shippers are mentioned, their impact on the railroads is not explicitly modeled.
Similarly, although entry by railroads occurs during the sample, the entry decisions
are not modeled, but this entry is accounted for by an exogenous shift in the industry
supply curve. Finally, although Porter does not include unobservables in the individ-
ual cost functions, it is possible to rationalize part of the error term that he includes
in the industry supply curve as a variable cost component common to all rms that
he does not observe.
## 5.2.2 Behavior and Optimization
Porter assumes that each period (one week), rms maximize their per-period pro ts
choosing shipping quantities, qit. Additionally, each rm forms a conjecture about
how other rms will respond to changes in its quantity during that week, it. From
these behavioral assumptions, Porter derives the standard marginal revenue equals
marginal cost quantity-setting rst-order conditions for pro t maximization by each
rm:
pit 1+
it

!
= ai Æ qÆ 1
it (41)
Here,
it =
@Qit
@qit
qit
Qit
= 1+
@Q it
@qit
!
qit
Qit
and Q it =
PM
k6=i qkt is the total amount supplied by all rms besides rm i, and
the term @Q it
@qit
is referred to as rm i's conjectural variation about its competitors
response to a one unit change in rm i's output level.
Many economists argue that it is impossible to interpret the conjectural variation
parameter independent of its value. Although we discuss conjectural parameters in
45more detail in the next section, one way to think about the conjectural variation
parameter is that it indexes how far price is from marginal cost. If the rm chooses
its output assuming it has no in uence on market price, then it perceives that any
increase in output will be met with an equal and opposite change in the aggregate
output of its competitors so that market prices are unchanged. This means @Q it
@qit
=
1, so that it equals zero and price equals marginal cost, which implies that the rm
assumes it is unable to a ect the market price through its quantity-setting actions.
For static Cournot-Nash competitors, the rm believes that any change in its output
will be met with no change in the output of its competitors, so that @Q it
@qit
= 0,
which implies that it equals rm i's quantity share of the market. For a quantity or
price-setting monopolyor cartel, the rm perceives that all rms willrespond one-for-
one with its output change from their current level of output, so that @Q it
@qit
= Q it
qit
,
and it equals one. This value of it implies monopoly pricing on the part of the
cartel. Although in principle conjectural variationparameters can continuously range
between zero and one, it is unclear what behavioral meaning one would attach to all
other values of it in this interval besides the three values described above.
While Porter's economic model applies to individual rm decisions, he chooses not
to estimate rm-level models. This decision appears to be made because estimating
rm-level speci cations would add signi cantly to his computations, particularly if
he estimated conjectural variation and cost parameters for each rm. Given the state
of computing power at the time he estimated his model, we doubt this would have
been computationally feasible. Additionally, such an approach would require him to
model new entry during the sample period.
As is common when only industry-level price and quantity data are available, Porter
instead aggregates the rm-level rst-order conditions to obtain an industry supply
equation of the form (38). This approach, while reducing the number of estimating
equations, is not without limitations. In aggregating the rst-order conditions, it
quickly becomes clear that one cannot estimate separate conjectural and cost param-
eters for each rm and time period. To reduce the dimensionality of the parameters
in the industry supply function, Porter assumes that the rm-level values of it times
the associated market shares are the same (unknown) constant. This assumption has
the important computational advantage of reducing the number of conjectural and
cost parameters to two. Moreover, it makes it easy to calculate equilibrium prices
and quantities in perfectly competitive and monopoly (collusive) markets. It should
not be surprising that this simplifying assumption has disadvantages. The two main
ones are that the model is now inconsistent with a Cournot market outcome and it
is unclear why conjectural parameters should vary inversely with market shares.
Porter obtains his supply equation by weighting each rm's rst-order condition in
(41) by its quantity,
pt
"
1+
t

#
= D QÆ 1
t ; (42)
46where
D = Æ
N X
i=1
a1=(1 Æ)
i
!1 Æ
; (43)
t =
N X
i=1
sit it; (44)
and sit = qit=Qt is the quantity share of rm i in time t. Taking the natural log of
this equation yields the aggregate supply function that Porter estimates, apart from
the addition of an error term.
At this point, it is useful to summarize Porter's structural model. The main at-
traction of Porter's assumptions are that they result in a two-equation linear (in the
parameters) system that explains equilibrium industry price and quantity data:
ln Qt ln pt = +Zt +t Demand Equation
(Æ 1)ln(Qt)+ln pt = + It +Wt+t Supply Equation (45)
where  = lnD; = ln(1+=);It is an indicator random variable which takes on
thevalue1whentheindustryisinacooperativeregimeand0whentheindustryisina
competitiveregime, Wt isa set ofexplanatory variablesthatcapture aggregatesupply
shifts due to such events as the entry of new rms, and is an unknown parameter
that measures the extent to which price and quantities sold during the collusive
regime approach the joint pro t-maximizing monopoly solution. For example, if =
ln(1+1=), the collusive regime involves joint pro t maximization. Lower values
of , however, imply higher output in the collusive regime. Porter argues based on
his work with Green, that the true should be less that the joint pro t-maximizing
value.
## 5.2.3 The Stochastic Model
Porter completes the economic model above with two sets of stochastic assumptions.
The rst set is fairly standard: he assumes the errors in the demand and industry
supply equations are additive, mean zero, homoscedastic normal errors. The source
of these errors is left unspeci ed. One presumes that each error represents demand
and cost factors unobservable to modern researchers, but observable to the rms
at the time. Were it otherwise, the rail rms would have optimized against the
distribution of these errors rather than the errors themselves and the endogenous
variables of the model would no longer be functions of the realized errors. Porter
also assumes the demand and supply errors are uncorrelated with the right-hand-side
exogenous variables. By inspection of the aggregated rst-order conditions for pro t-
maximization in equation (42), we can see that the supply shock can be rationalized
as a common multiplicative supply shock to all rms' variable cost functions. For
47example, if we rede ne ai in the variable cost function for rm i as it = ai exp(t),
then solving the rst-order conditions for each rm and solving for the aggregate
supply function, would yield supply functions with the stochastic shock, t, given
above.
The second stochastic speci cation Porter adds is less conventional and is motivated
by an identi cation problem. In principle Porter would like to use data on It, which
indicates when the cartel was e ective, to estimate (and thereby recover the price-
cost markup parameter  ). Unfortunately, he has incomplete historical information
on when the cartel was e ective. Although he uses some of this information to
compare prices and evaluate his model ex post, in his main estimations he treats It as
a random variable that is observable to the rms but not to him. Thus, in e ect the
error term in the supply equation becomes It + t. Absent further information on
It, it is clear that we have an identi cation problem { we cannot separately recover
the key parameters  and . This problem is akin to having two constant terms in
the same regression. To see the problem, notice that the expected value of the error
(assuming t has mean zero) is E(It). This expectation is by assumption non-zero
because E(It) is the expected value of It, which equals the probability that the rms
are colluding. Assuming this probability does not change over the sample, which is
consistent with Porter's formulation, the nonzero average error is absorbed into the
supply equation's constant term, giving +E(It) = + . The supply disturbance
becomes (It )+t. As we can see from the constant term, even if we know the
constant , we cannot separately estimate  and .
To gain another perspective on identi cation issues in Porter's model, it is useful to
compare Porter's model to the linear demand and supply and demand model (3),
discussed in the previous section. Porter's demand and supply system has the form
y0
t +x0
tB = E0
t (46)
[ln Qt ln pt]

1 (1 Æ)
 1

+[1 Z0
t W0
t ]
2
6
4
(+ )
0
0 
3
7
5 = [t; (It )+t]
At this point, we might be tempted to use the assumptions we applied there, namely
that Zt and Wt are uncorrelated with (It )+t and t and that the disturbances
have a constant covariance matrix. Under these assumptions, we could obtain consis-
tent estimates of the structural parameters, , B and E(EtE0
t) =  in equation (46)
by three-stage least squares.
Notice, however, that absent distributional assumptions for It and t, we have no
hope of estimatingthe probabilityof regimeshifts, , or the magnitudeofthe conduct
parameter during these collusive regimes, , which is a nonlinear function of , from
the joint distributionof price and quantity data. To identify these parameters, Porter
needs to add assumptions. This should not be too surprising given that he does not
48observe It. His strategy for achieving identi cationis to parameterize the distribution
of the unobservable regimes. Speci cally, he assumes that It follows an independent
and identically distributed (iid) Bernoulli process, independently distributed of the
normally distributed demand and supply errors.
The advantage of Porter's structural framework is that we can explore how these
assumptions facilitate identi cation and estimation. By modeling It as an unobserv-
able Bernoulli, Porter has introduced a potential asymmetry into the distribution
of the structural model's errors. To see this, notice that conditional on the regime,
the second element of Et possesses a symmetric normal distribution. Uncondition-
ally, however, the distribution of Et now is composed of a (centered) Bernoulli and
a normal random variable. Consequently, unlike the traditional demand and supply
model (3), where we could use standard instrumental variables to recover the relevant
structural parameters from conditional mean functions, here we must use more in-
formation about the joint distribution of prices and quantities to estimate the model
parameters. Put another way, it is the non-normality of the reduced form errors that
determines the extent to which one can identify empirically. This then raises the
delicate question: How comfortable are we with the assumption that t and t are
normally distributed? Unless there is a compelling economic reason for assuming
normality, we have to regard (as Porter does) any inference about regime shifts as
potentially hinging critically on this maintained assumption. Fortunately, in Porter's
case he does have some regime classi cation data from Ulen (1978) that agrees with
his model's classi cation of regimes.
At this point it is useful to recall our notion of structure in a simultaneous equations
model. As discussed in Section 3, the most that can be identi ed from descriptive
analysis is the conditional density of price and quantity yt = (lnpt;lnQ0
t) given the
vector of exogenous variables, xt = (1;W0
t;Z0
t)0 ; that is, f(yt j xt). According to
Porter's theoretical model, this observed conditional density is the result of the inter-
action of industry demand and an industry `supply' that switches between collusive
and revisionary regimes. However, no amount of data will allow the reseacher to
distinguish between this regime-switching structural model and a conventional linear
simultaneous equations model with no regime switching. Speci cally, suppose Et has
the density
g(Et) =  1
2 jj 1=2 exp( F0 1t 1F1t
2 )
+(1 ) 1
2 jj 1=2 exp( F0 2t 1F2t
2 )
where
F1t =

E1t
E2t (1 )

and F2t =

E1t
E2t + 

Both models give rise to the same conditional density f(yt jxt), but have very di er-
ent economic implications. The rst modelimpliesrandom switches fromcompetitive
to collusive pricing regimes; the other implies a single pricing regime. Consequently,
any test for regime shifts must be conditional on the assumed supply and demand
49functions, and more importantly, the assumed distributions for It and t. Because
these distributionalassumptions areuntestable, as thisexampleillustrates, we believe
that any test for stochastic regime shifts, should be interpreted with caution. One
might view this result as a criticism of structural modeling. To so would miss our
earlier points about the strengths of a structural model. In particular, a key strength
of a structural model is that it permits other researchers to ask how the modeler's as-
sumptions a ect results. This example also illustrates our earlier meta-theorem that:
absent assumptions about the economic model generating the observed data, the re-
searcher can not do much beyond describing the properties of the joint distribution
of xt and yt.
To understand allof the implicationsof this point, we re-write Porter's regime switch-
ing model as:
y0
t = x0
tD +It+U0
t (47)
where
=

1 (1 Æ)
 1

;  =

0
;D =
2
6
4

0
0 
3
7
5 ;Ut =

t
t

; and Ut  N(0;):
(48)
In terms of this notation, the conditional density of yt given xt and It is:
h(ytjIt;xt) =
1
2
jj 1=2 exp
(y0
t x0
tD It)0 1(y0
t x0
tD It)
2
!
:
Using the assumption that It is an iid Bernoulli random variable distributed indepen-
dent of Ut and xt yields the following conditional density of yt given xt:
f(ytjxt) =  h(ytjIt = 1;xt)+(1 )h(ytjIt = 0;xt)
As has been emphasized above and in Section 3, all that can be estimated from a
statisticalanalysis of observations on xt and yt is the true joint density of ftrue(yt;xt),
fromwhichcanderive, theconditionaldensityofyt givenxt. Thefactthatftrue(ytjxt),
the true conditional density, can be factored into the product of two conditional
normal densities of yt given xt and It times the probability of the associated value
of It is due solely to the functional form and distributional assumptions underlying
Porter's stochastic economic model for the underlying economic interaction.
Withoutimposingthis economicstructure on f(ytjxt), the researcher would be unable
to estimate underlying economic primitivessuch as the price elasticity of demand, the
price elasticity of supply, the probability of a collusive versus a competitive regime,
and the magnitude of the di erence in prices between the collusive and competitive
regimes. Even the best descriptive analysis would yield little economic information
if the true data-generation process was Porter's structural model. Suppose that one
50had suÆcient data to obtain a precise estimate of ftrue(yt;xt) using the techniques
in Silverman (1986). From this estimate, the researcher could compute an estimate
of E(ytjxt) or the conditional density of yt given xt. However, suppose the researcher
computed @E(ytjxt)
@xit
for the ith element of xt. If Porter's model were correct, this
expectation would equal

@E(ytjIt = 1;xt)
@xit
+(1 )
@E(ytjIt = 0;xt)
@xit
;
so that any partial derivative of the conditional mean is an unknown weighted sum
of partial derivatives of the conditional means under the competitive and collusive
regimes. The researcher would therefore have a diÆcult time examining the validity
of comparative statics predictions concerning signs of these partial derivatives un-
der competition versus collusion, unless the sign predictions were the same under
both regimes. Inferring magnitudes of the competitive or collusive comparative static
e ects, would be impossible without additional information.
This last observation raises an important point about the success we would have in
trying to enrich the economic model of regime shifts. Imagine, as some have, that
there are more than two regimes. We might attempt to model this possibility by as-
suming that It has multiple points of support. This seemingly more reasonable model
imposes greater demands on the data, as now the extent to which these additional
supply regimes are \identi ed" is determined by a more complicated non-normal
structure of the reduced form errors.
One nal point about the estimation of is that care must be exercised in drawing
inferences about the presence of multiple regimes. Under the null hypothesis that
there are no regime shifts, standard likelihood ratio tests are invalid. The problem
that arises is that under the null of no regime shifts, , the probability of the collusive
regime, is equal zero and is no longer identi ed. Technically this causes problems
because the information matrix is singular when  = 0. It is unclear then what
meaning we can attach to standard tests of the hypothesis that there are distinct
regimes.
## 5.3 Summary
Our analysis of Porter's model leads us to conclude that demand and supply models
for oligopolistic industries pose special identi cation and applied econometric prob-
lems. More importantly, the parameters describing competitive conjectures or the
degree of competition are not necessarily identi ed with commonly available data. In
general, theresearcher willhave tohavewithin-samplevariationindemandorcostpa-
rameters, or make speci c distributional assumptions and apply speci c estimation
techniques, to identify how competitive conduct a ects industry supply behavior.
51This identi cation problem is common to all industrial organization models of rm
and industry behavior models, as we shall see.
The strength of Porter's model is that it both identi es potential identi cation and
estimation problems posed by the standard theory and commonly available industry
data. It also provides a strategy for recovering informationabout competitive regimes
from limited information about the prevailing competitive regime. Although one
could consider alternative strategies for identifying the competitive regimes, Porter
compares his estimates of the probabilityof collusionto informationfromUlen (1978)
onwhen the cartelwas actuallye ective. This isaniceexampleofhow other evidence
can be brought to bear to check whether the results of the structural model make
sense. Porter nds a remarkable amount of agreement between the two measures. His
model also provides an economicallyplausible explanation for the enormous variation
in grain prices over his sample period. It would be diÆcult to imagine how one could
rationalize this variation with a descriptive model of prices and quantities.
## 6 Market Power Models More Generally
Porter's model is an example of IO models that draw inferences about competition
from data on market-clearing prices and outputs. Because these are among the most
widely used empirical models in industrial organization, it is worth going beyond
Porter's model to consider strategies that other studies have used to identify market
power. There are an enormous number of market power studies, many more than we
can do justice to here. Bresnahan (1989) surveys the early papers in this area. Our
focus is on illustrating the critical modeling issues that arise in the identi cation and
estimation of these models.
Most empirical researchers in IO equate competition with price equal to marginal
cost. When price is above marginal cost, rms are said to have \market power".
While some studies are content simply to estimate price-cost margins, many go fur-
ther and attempt to infer what types of rm behavior (\conduct") are associated
with prices that exceed marginal costs. A rst observation we make below is: ab-
sent a structural model, one cannot infer the extent of competition from the joint
distribution of market-clearing price and quantity. Put another way, one needs an
economic model to estimate marginal costs (and hence price-cost margins) from the
joint distribution of market-clearing prices and quantities. This structural model will
involve functionalformassumptions and often distributionalassumptions that cannot
be tested independently of hypotheses about competition.
While this observation may seem obvious from our discussion of Porter's model, there
are plenty of examples in the literature where researchers draw unconditional infer-
ences about the extent of competition. That is, they draw inferences about price-cost
52margins without acknowledging that their inferences depend critically on their eco-
nomic assumptions, or even an explicit statement of what the economic assumptions
are underlying the interpretation of a vector of estimated parameters. As we have
shown in a number of previous examples, economicassumptions typicallycan and will
alter inferences one might draw about the extent of competition. The debate about
whether the estimates are believable then hinges on the plausibility of maintained
assumptions or, as in Porter's case, the availability of alternative evidence.
A second observation below is: while one can estimate price-cost margins using a
structural model, it is problematic to link these margins to more than a few speci c
models of rm behavior. In particular, many studies estimate a continuous-valued
parameter that they claim represents rm \conjectures" about how competitors will
react in equilibrium. Currently there is no satisfactory economic interpretation of
this parameter as a measure rm behavior { save for rms in perfectly competitive,
monopoly,Cournot-Nashandafewotherspecialmarkets. Wethereforeseelittleorno
value to drawing economic inferences about rm conduct from conjectural variation
parameter estimates.
In what follows we discuss these two observations in more detail. We rst discuss how
the literature identi es and interprets market power within the con nes of static, ho-
mogenous goods models where rms choose quantities. We then discuss at a broader
level what market power models can tell us in di erentiated product markets or mar-
kets where rms choose supply schedules (prices and quantities).
## 6.1 Estimating Price-Cost Margins
Since the late 1970's, many papers in IO have used rm and industry price and
quantity data to describe competition in homogeneous product markets. The typical
paper begins, as Porter did, by specifying a demand function and writing down the
rst-order condition:
P + i qi
@P
@Q
= MCi(qi); (49)
The goal of these papers is to estimate the `conduct' parameter i. Most authors
assert that this parameter measures rm \conjectures" about competitor behavior.
As such, it would seem to be a structural parameter that comes from an economic
theory. Is this the case?
Isolating i in equation (49), we obtain
i =
P MCi(qi)
qi
@P
@Q
=
P MCi(qi)
P
1
i 
: (50)
From this equation, we see that i provides essentially the same descriptive informa-
53tion as Lerner's (1934) index. That is, it provides an idea of how far a rm's price
is from its marginal cost. To the extent that price is above marginal cost (i.e., the
Lerner index is positive), IO economists claim that the rm has `market power'.
Equation (50) is useful because it identi es two critical structural quantities that a
researcher must have to estimate i. These are the price elasticity of demand and
marginal cost. Following Porter, a researcher could in principle separately estimate
the price elasticity of demand from price and quantity data. In developing such an
estimate, the researcher would of course have to worry that the demand function's
form may critically impact the estimated elasticity. The marginal cost term in equa-
tion (50) poses a more diÆcult estimation problem. Equation (50) tells us that with
just price and quantity data, we cannot separate the estimation of marginalcost from
the estimation of i. Even if we have observations on total or even variable cost as-
sociated with this level of output, we are unable to separate them without making
speci c function form assumptions for demand and marginal cost. Put another way,
the identi cation of i hinges on how we choose to estimate marginal cost and the
aggregate demand curve. Changing the marginal cost and demand speci cation will
change our estimate of i. The usual case in practice is that we have little reason to
prefer one parametric marginal cost or demand speci cation to another.
Despite the diÆculty of inferring marginal costs from price and quantity data alone,
many studies go further, choosing to interpret i as a measure of rm behavior.
To understand where this behavioral interpretation comes from, we return to the
economic rationale underlying equation (49). In equation (49), i is a placeholder for
the derivative:
i =
dQ
dqi
;: (51)
According to this de nition, i is not a statement about how far prices are from
marginal costs, but rather a \variational" concept associated with rm behavior.
Speci cally, equation (49) sometimes is interpreted as saying: the rm \conjectures"
industry outputwillincreaseby i shoulditincrease itsoutput by oneunit. The prob-
lem with this interpretation is that there are only a few values of i where economists
have a good explanation for how rms arrived at such a conjecture. This leads to
our second observation above. We know of no satisfactory static model that allows
for arbitrary values of i. Empirical models that treat i as a continuous value to be
estimated thus are on shaky economic ground, particularly since estimates of i are
predicated on a speci c functional form for marginal costs.
To emphasize the danger inherent in associating residually determined i with behav-
ior, imagine observing two rms producing di erent quantities who otherwise appear
identical. The conjectural variation approach would explain the di erence by saying
rms simply \expect" or \conjecture" that their competitors will react di erently to
a change in output. Yet there is no supporting story for how otherwise rms arrived
at these di erent conjectures. On the other hand, even though the rms appear iden-
54tical, one might wonder whether their marginal costs are identical. It seems plausible
to us that unobservable di erences in marginal costs, rather than behavior, could ex-
plain the di erence in output. Absent a richer model of behavior that explains where
conjectures come from, it is anyone's guess.
To summarize our discussion so far, we have provided two possible interpretations of
i. Only the descriptive interpretation makes much sense to us. There are, however,
a few instances in which i sensibly corresponds to a speci c model of rm behavior.
The leading case is perfect competition, where i = 0 and price equals marginal
cost. Cournot (i = 1), Stackleberg and monopoly are three other well known cases.
While there has been some debate in the theoretical literature about whether these
models are internally \consistent" static behavioral models (e.g., Lindh (1992)), each
ofthese modelslendsitselftoanaturalinterpretationofwhati meansasaconjecture
about competitor behavior. Thus, it seems to us sensible to imagine imposing these
conjecturesinthe rst-ordercondition(49)andusingthemtoestimatetheparameters
of demand and cost functions. One can then use non-nested tests, as in Bresnahan
(1987), to compare these di erent models of behavior.
Having said this, we realize that some might argue that one loses little by treating i
as a continuous parameter to be estimated. After estimating it the argument goes,
one can still compare it to the benchmark values. For example, suppose one precisely
estimated i = 1:7, and could reject perfect competition and Cournot. One might
think it reasonable to conclude the market is \less competitive than Cournot." But
does this make much sense? According to the conjectural variations story, and equa-
tion (49), an estimate of 1.7 implies that rm i believes that if it increases output
by one unit, industry output will increase by 1.7 units. What type of behavior or
expectations leads to rm i maximizing its pro ts by maintaining i = 1:7? The
problem here is that the theory underlying rm i's behavior (and those of its com-
petitors' behavior) is static. There is no obvious explanation for why rm i has this
behavior. Moreover, as we show in the next section, in order to identify an estimate
of i, a researcher must select a parametric aggregate demand curve and rule out
several types of functional forms for aggregate demand. Otherwise it is impossible to
identify i from market-clearing price and quantity data.
If there is an answer to the question of where a rm's conjectures comes from, it must
come from a dynamic model of \conjectures" formation. Riordan (1985) provides
one such model. Given the subtleties involved with reasoning through how today's
competitive interactions might a ect future beliefs, it seems unlikely dynamic models
will produce simple parameterizations of conjectures or easily estimated rst-order
conditions. Moreover, theliteratureonrepeatedgameshasshownthatwhenmodeling
current behavior, one has to recognize that threats or promises about future behavior
can in uence current behavior. This observation points to a distinctionbetween what
rms do inequilibrium(how they appear to \behave") and what they conjecture their
55competitors' would do in response to a change in each rm's output.7 This also is a
distinction that Stigler(1964) used to criticize static conjectural variationmodels. To
understandhowthisdistinctiona ectsempiricalmodelers,consideracartelcomposed
of N symmetric rms, each of whom charges the monopoly price. In this case, one
would estimate i equal to the number of rms. If we gave this estimate a behavioral
interpretation, we would report that in this industry, rms conjecture or expect other
rms to change their outputs one-for-one. Yet this may not be the case at all, as
some recent theories have emphasized. The rms may be charging the monopoly
price because they expect that if they defect from the monopoly price by producing
a little more, each of their competitors may punish them by producing much more.
This distinction between the \beliefs" that economic agents hold and what they ul-
timately may do in equilibrium is critical for exactly the reasons we outlined in our
introductory framework. If one wants to describe where price is in relation to a rm's
marginal cost, then i provides a descriptive measure of that, but not a statement
about behavior. If, however, one wants to use the estimated parameters to predict
what would happen if the rms' economic environment changes, then one either must
have a theory in which beliefs and equilibrium behavior coincide, or one must ask
which of a small set of values of i, corresponding to perfect competition, monopoly,
Cournot and the like, best explains the data.
## 6.2 Identifying and Interpreting Price-Cost Margins
In the previous subsection we emphasized that while one could relate  to price-
cost margins, one could not separately estimate  and marginal costs from price and
quantity data alone. Despite occasional claims to the contrary, assumptions about
the functional form of marginal costs are likely to a ect estimates of  and vice
versa. This section illustrates how assumptions about the structure of demand and
marginal costs impact the estimation of the descriptive parameter . (Throughout
this subsection, we think of  as providing descriptive information about price-cost
margins.)
The IO literature has adopted di erent approaches to estimating price-cost margins
depending upon whether or not they have individual rm or industry price and quan-
tity data. When only industry-level data are available, researchers typically use the
following equation
P + Q
@P
@Q
= MC(Q) (52)
to estimate a single industry . James Rosse's (1970) paper is the rst to estimate
the degree of market power (the price-cost markup), or equivalently a rm's marginal
7Corts (1999) makes a similar argument.
56cost curve. He used observations on market-clearing prices and quantities from a
cross-section of U.S. monopoly newspaper markets. Rosse's procedure uses this rst-
order condition with  set equal to 1, along with an assumed parametric aggregate
demand curve to estimate the marginal cost curve. This procedure works for the
following reason. Once a parametric functional form for demand is selected, this can
be used to compute @P
@Q for each observation in the sample. Setting the value of  for
each observation to 1, guarantees that we have the information necessary to compute
the left-hand side of equation (52) for each observation. This provides an implied
value of marginal cost for every output level in the sample. Combining this data
with a parametric speci cation for the rm's marginal cost function, we can estimate
marginal cost parameters.
To extend equation (52) to an oligopoly market requires further assumptions. This
equation would appear to mimic a single rm's rst-order condition, and thus we
might think of it as linked to the price-cost margins of a \representative" rm. But
this is not generally true. Starting as Porter did from the individual rm pro t
maximizationconditions, we can sum equation (49)across rms to obtainthe relation
P +
@P
@Q
N X
i=1
i qi
N
=
N X
i=1
MC(qi)
N
(53)
which we can rewrite as
P + 
@P
@Q
Q = MC(qi): (54)
Here,  = 1
N
PN
i=1
iqi
Q is an average of rm market shares times the individual rm
margin parameters, and MC(qi) is the average of the N rms' marginal costs. While
this equation \looks" like the industry aggregate equation (52) used in many studies,
it is not the same without further assumptions. Note, for example, that if i varies
across rms, then changes in rms' market shares will generally change . Thus, if
one is analyzing time series data on prices and output, it may make little sense to
treat  in equation (52) as a constant. An exception is when one assumes all rms
have the same i. But in this case, one must have the same number of rms in the
industry for  to remain constant through time.
The assumption that all rms have the same i amounts to assuming that at the same
production level, all rms in the industry would have similarly sloped rm demand
curves and the same marginal revenues. This is a non-trivial restriction which would
require justi cation on a case by case basis. A number of studies, beginning with
Gollop and Roberts (1979), Appelbaum (1982) and Spiller and Favaro (1984), have
argued that one should relax this restriction by making  a function of di erent
variables, including output. To date, however, there is very little economic theory
to guide structural models of how i varies across rms. The most widely adopted
speci cations are ad hoc, with  depending on rm output, market share or a rm's
57size rank.
Another consequence of assumingall rms have the same  is that di erences in rms'
outputs now are a function solely of di erences in marginal costs. In some instances,
this leads to a monotonicrelationshipbetween the eÆciency of a rm and its observed
production. For example, if we assume marginal costs are increasing in output, then
there is an inverse relationship between output and marginal costs. Thus, the rm
with the largest output has the lowest marginal cost, the rm with the second largest
output the second lowest marginal cost, and so on. While this relationship may be
entirely reasonable for many industries, it may not be for all.
Turning now to the right hand side of equation (52), we see that the notation MC(Q)
gives the impression that only industry output enters the industry supply relation.
Put another way, areallocationofoutput fromone rminthe industry toanotherwill
not change the right hand side of the industry supply relation (49). This obviously
cannot generally be true. Equation (54) shows why this is so. To explore this point
further, it is useful to assume that rms have linear marginal costs of the form:
MC(qi) = c0i + c1i qi (55)
In this case, we can rewrite equation (54) as
P + ~ Q
@P
@Q
=  co +  c1 Q + (56)
where
~  =
PN
i=1
i
N
N
(57)
 c0 =
1
N
N X
i=1
c0i  c1 =
1
N
N X
i=1
c1i (58)
= Cov(c1i;qi) Cov(i;qi)
@P
@Q
(59)
and Cov(x;y) equals the covariance (calculated over rms in the industry) between
x and y. If the term is zero, then equation (54) and equation (52) are indistin-
guishable. This happens for example when rms have similarly sloped marginal cost
functions and the same  . In general, however, we can think of equation (52) as
having an error term that includes . To the extent that is nonzero and varies sys-
tematically in the researcher's sample, the researcher will obtain biased estimates of
the demand, cost and  parameters by ignoring .
We now turn to considering whether and how functional form assumptions might
e ect inferences about  from industry price and quantity data. Both Bresnahan
(1982) and Lau (1982) consider the issue of identi cationin detailusing the aggregate
equation (52). Since their results apply to a special aggregation of individual rm
58rst-order conditions, it is useful to revisit their discussion in the context of the
individual rm marginal revenue equal to marginal cost conditions. To facilitate
this discussion, let each rm face the demand function Q = D(P;Y; ), where
is a vector of demand parameters and Y is a set of exogenous variables that shift
demand but not cost. Suppose also that each rm has the marginal cost function
MCi = c0 + c1 qi + c2 wi; where wi is an exogenous cost shifter. If a researcher had
time series data on market prices, rm i's output, Y and wi over time, the researcher
could estimate rm i's market power parameter i using the two equation system
Q = D(P; Y; )
P = c0 + (c1 + @D 1
@Q i )qi + c2 wi
(60)
once some assumption had been made about unobservables. The second equation
shows that by assuming marginal costs are linear in output, we have potentially
destroyed the identi cation of i. Consider, for example, what happens when demand
has the form Q = 0 + 1 P + 2 Y. In this case, rm i's supply relation is:
P = c0 + c1 +
i
1
!
qi + c2 wi : (61)
Hence, even though we can obtain a consistent estimate of the demand parameter 1
from the demand equation, we cannot separate c1 from a constant i. Of course, if we
are willing to restrict , we can identify the marginal cost parameters and price-cost
margins.
It is tempting to identify i in this case by assuming that marginalcosts are constant.
Unfortunately, researchers rarely have independent information that would support
this assumption. Alternatively, following Bresnahan (1982), one could identify i by
allowing the slope of market demand to vary over time in an observable way. For
instance, one might interact price with income (Y) in the demand equation to obtain
the supply equation
P = c0 + c1 +
i
1 + 2 Y
!
qi + c2 wi (62)
Although i is formally identi ed in this speci cation, its identi cation in practice
depends heavilyonhavingvariables, such asincome, thatinteractorotherwise cannot
be separated from price (e.g., Lau (1982)). In other words, the value of  is identi ed
o of a functional form assumption for aggregate demand.
Yet another approach to identifying i that has not been fully explored is to add
information from other rms' supply relations. Returning to the speci cation in
equation (54), if we added a supply curve for a second rm j, we still would not be
able to identify i or j. We would, however, be able to identify the di erence if we
59assumed that both rms' marginal cost functions had the same slope. Alternatively,
we could identify the di erence in the slopes of the rms' marginal cost functions if
we assumed that the rms had the same .
Our discussion so far has suggested that  is identi ed by the functional form as-
sumptions one makes about market demand and rms' costs. This dependence seems
to not always be appreciated in the literature, where cost and demand functions are
sometimes written down without much discussion of how their structure might a ect
estimates of . A useful example of how the functional form of demand a ects the
identi cation of  is provided by the inverse demand function:
P = Q1= (63)
This inverse demand function leads to the direct estimator (equation (50) above)
1 =
P c
P
(64)
which illustrates how the demand parameters a ect the direct estimate. This inverse
demand function also yields a transformed equation (52)
Pt =
ct
+ 
+

+ 
where the subscript t denotes variables that are naturally thought of as time vary-
ing. Critical to most applications is what one assumes about marginal costs. In the
simplest case, one can think of rms as having constant, but time-varying marginal
costs ct which depend linearly on some time-varying exogenous covariates, i.e.,
ct = c0 + Wt !
where ! is a vector of parameters. Substitution of this relationship into (20) gives
the equation
Pt =

+ 
+
c0
+ 
+
+ 
Wt !
This equation makes it clear that absent further assumptions, we cannot identify  if
itisaconstant parameter. One way aroundthisproblemistorecognizefromequation
(54) that  depends on market shares and the number of rms, both of which are
potentially time varying. This, however, is not the usual approach. Instead, most
studies follow the advice of Bresnahan and Lau and identify  by assuming that the
demand parameters and/or contain a demand covariate. For example, if we
assume that the inverse demand intercept equals
t = 0 + Dt 1 :
60then equation (20) becomes
Pt = 0 
+ 
+
c0
+ 
+ 1 
+ 
Dt +
+ 
Wt !
This equation and the demand equation now exactly identify . But note that the
estimate of  depends critically on the e ect of D on demand and on the curvature
of demand. If we had started out, as many studies do, by assuming linear demand
then we could well draw poor estimates of  if in fact 6= 1:
## 6.3 Summary
In this section we have discussed how IO researchers use price and quantity data to
estimate price-cost margins. We also have questioned the value of static conjectural
variation parameters. Apart from these observations, we have tried to underscore
one of the key observations of our framework, which is that functional form assump-
tions play a critical role in inferences about margins and the appropriate model of
competition.
7 ModelsofCompetitioninDi erentiated-Product
Markets
The previous two sections discussed how IO economists have used price and quantity
data to draw inferences about strategic interactions among oligopolists selling ho-
mogeneous products. These empirical models parallel textbook demand and supply
models. The chief di erence is in an oligopoly model, the supply equation is replaced
by a price equation derived from rst-order conditions that describe how oligopolists
maximize pro ts. Because IO economists do not observe the marginal costs that
enter these rst-order conditions, IO economists are forced to estimate them along
with other structural parameters. It should not be too surprising that a researcher's
stochastic and functional form assumptions have a critical impact on the resulting
estimates, as the researcher is simultaneously trying to draw inferences about unob-
served demand, costs and competition from just data on prices and quantities.
## 7.1 Neoclassical Demand Models
In the late 1980s and 1990s, empirical IO economists began to focus on modeling
competition in di erentiated products markets such as cars, computers and break-
61fast cereals. These models also use price and quantity data to draw inferences about
oligopolists' strategic interactions and price-cost markups. The main di erence be-
tween these models and models for homogeneous products is that the researcher must
specify separate \demand" and \supply" equations for each product. Thus, instead
of working with two-equation systems such as (37) and (38), the researcher has a
J-product demand system:
Qd
1 = h1(P1;P2;:::;PJ;Z1; 1;1)
. . . =
. . .
. . .
. . .
Qd
J = hJ(P1;P2;:::;PJ;ZJ; J;J)
(65)
and a J-equation system of rst-order pro t maximization conditions:
P1 = g1(Qs
1;Qs
2;:::;Qs
J;W1;1;1)
. . . =
. . .
. . .
. . .
PJ = gJ(Qs
1;Qs
2;:::;Qs
J;WJ;J;J):
(66)
Althoughthese systems lookmuchmorecomplicatedthan thesimultaneousequations
in the homogenous product case, they pose the same basic modeling issue: unless the
researcher is willing to make speci c functional form assumptions for rms' demand
and costs, the researcher will be unable to draw inferences about rms' markups or
competition. This, again, is because the researcher does not have information about
costs and competition. Thus, absent economic assumptions about the structure of
demand and costs, the most the researcher can do is use exible data smoothing
techniques to recover the conditional joint density of the J prices and J quantities
given some demand and cost variables W and Z. Only by making functional form as-
sumptionsfordemand andcosts, andmakingassumptionsaboutunobserved strategic
interactions, can the researcher recover information about demand and cost primi-
tives. This means that we again have to consider how speci c functional form and
other assumptions a ect a researcher's ability to use price and quantity data to draw
inferences about markups and competition.
The main new issue posed by di erentiated products is one of scale. In particular,
now the researcher has to specify a set of demand functions { potentially involving
dozens or hundreds of products. Absent restrictions on demand and rm behavior,
the number of parameters in these equations easily outnumbers the number of obser-
vations in conventional market-level price and quantity datasets. This problem has
led IO researchers to focus on the problem of how best to formulate parsimonius, yet
exible, demand systems.
To appreciate the practical issues involved, consider the challenge IO economists
or antitrust authorities face in trying to assess the competitiveness of US ready-to-
eat breakfast cereal makers. Absent cost data, inferences about price-cost margins
and competition have to drawn from the prices and quantities of di erent cereal
62brands. As there are over 50 major brands of cereals, a researcher has to formulate
a 100 equation structural equation model. Each equation of the model conceivably
could contain dozens of parameters. For instance, paralleling Porter's homogeneous
speci cation, if the researcher adopted the log-linear demand system:
ln Q1 = 10 + 11 lny + 12 lnP1 + 13 lnP2 +:::+ 1;50 lnP50 +Z1 1 +1
ln Q2 = 20 + 21 lny + 22 lnP1 + 23 lnP2 +:::+ 2;50 lnP50 +Z2 2 +2
. . . =
. . .
. . .
. . .
. . .
. . .
ln Q50 = 50;0 + 50;1 lny + 50;2 lnP1 + 50;3 lnP2 +:::+ 50;;50 lnP50 +Z50 50 +50;
(67)
they would have to estimate at least 2,600 parameters! Such unrestricted parameter-
izations easily exceed the number of observations obtainable from public sources.
The scale of di erentiated product models also raises signi cant econometric and
computational challenges. When the equations in (65) and (66) are nonlinear in the
demand and cost errors, it is diÆcult to devise computationally convenient and con-
sistent estimators. For instance, to use maximum likelihood, the researcher would
have to work with the Jacobian of 100 demand and markup equations. Nonlineari-
ties in the system also can present nontrivial computational issues. For instance, the
system need not have a unique solution, or any real-valued solution, for all error and
parameter values. Although these complications can sometimes be dealt with in esti-
mation, they may still reappear should the researcher wish to perform counterfactual
calculations. For instance, there may be no real-valued prices that solve (66) for a
particular counterfactual.
Both the scale of these systems and these econometric issues have prompted IO re-
searchers to look for ways to simplify di erentiated product models. Initial e orts
focused on trying to simplify traditional Marshallian demand systems as a way of
limiting parameters. Many early simpli cations relied on ad hoc parameter restric-
tions or the aggregation of products.8 For example, to estimate (67) a researcher
might constrain a product's cross-price elasticities to all be the same.9 Assumptions
such as this, while computationally convenient, can have unattractive economic con-
sequences, as the own-price and cross-price elasticities of demand enter the mark-up
equations (66) that determine how far price is above marginalcost. Such ad hoc price
elasticity restrictions can result in the serious misestimation of price-cost margins.
Multi-level demand speci cations provide a somewhat more exible method for re-
stricting demand parameterizations.10 In a multi-level demand speci cation, the re-
8Bresnahan's (1989) section 4 reviews early e orts. Deaton and Muelbauer (1980) provide a
survey of neoclassical demand models.
9One utility-theoretic framework that produces this restriction is to assume that there is a repre-
sentative agent with the constant elasticity of substitution utility function used in Dixit and Stiglitz
(1977).
10See, for example, Hausman, Leonard and Zona (1994).
63searcher separates the demand estimation problem into several stages or levels. At
the highest level, consumers are viewed as choosing how much of their budget they
wish to allocate to a type of product (e.g., cereal). At the next stage, the consumer
decides how much of their budget they will divide among di erent categories of the
product (e.g., categories of cereal such as kids', adult and natural cereals). At the
nal stage, the consumer allocates the budget for a category among the products in
that category (e.g., within kids' cereals, spending on Trix, Count Chocola, etc.).
Although multi-stage models also restrict price elasticities, they permit exible cross-
price elasticities for products within a particular product category. For example, the
researcher can estimatea exible Marshalliandemand system describing the demands
for kids' cereal products. Changes in the prices of products in other categories (e.g.,
adultcereals) willstilla ectthe demandsforkids' cereals, butonlyindirectlythrough
their e ect on consumers' overall kids' cereals spending. These indirect price e ects
are therefore not as exible as the within category cross-price e ects. Whether this
lack of exibilitymatters much for estimates of price-cost margins, is as yet unclear.11
A series of theoretical papers beginning with Gorman (1959) have, however, explored
the restrictions that multi-stage budgeting models place on consumer preferences,
and how these restrictions a ect compensated and uncompensated price e ects.12
Other recent work in the Marshallian demand system tradition has explored reducing
the number of demand parameters by working with reduced forms or constraining
cross-price e ects to depend on estimable functions of covariates.13 Pinske, Slade
and Brett (2000) and Pinske and Slade (2002), for example, constrain the coeÆcients
entering rms' price elasticities to be functions of a small set of product attributes.
While this strategy facilitates estimation and allows exibility in own and cross-price
e ects, it has the disadvantage of being ad hoc. For instance, it is not clear where
the list of attributes comes from or how the functional form of demand re ects the
way consumers evaluate product attributes. (See also Davis (2000).)
Besides having to grapple with how best to restrict parameters, each of the above
approaches also has to address the endogeneity of prices and quantities. As in homo-
geneous product models, the presence of right-hand side endogenous variables raises
delicate identi cation and estimation issues. Applied researchers can most easily ad-
dress identi cation and estimation issues in demand and mark-up systems that are
linear in the parameters. In more nonlinear systems, identi cation and estimation
questions become much more complicated. For example, the implicit \reduced form"
11Nevo (1997).
12See for example Gorman (1970), Blacorby et al. (1978) and Hausman et al. (1994).
13An early example is Baker and Bresnahan (1988). They propose a \residual" demand approach
which forsakes identi cation of the original structural parameters in favor of amalgams of structural
parameters.
64for the nonlinear (65) and (66) system:
Q1 = k1(Z;W; ;;;)
. . . =
. . .
. . .
QJ = kJ(Z;W; ;;;)
P1 = l1(Z;W; ;;;)
. . . =
. . .
. . .
PJ = lJ(Z;W; ;;;)
(68)
may not be available in closed form. (Here Z = (Z1;:::;ZJ) and W; ;; and 
are similarly de ned collections.) These equations also need not have a solution or a
unique solution for all values of the right hand side variables and errors.
Large demand systems also pose diÆcult computational and estimation issues. For
example, system estimation methods, such as full information maximum likelihood
applied to (68) may prove infeasible simply because of the number of parameters,
Alternatively, single equation methods such as generalized method of moments and
nonlinear instrumental variable methods raise eÆciency issues. Often, eÆciency, and
indeed consistency, is tied to the selection of instruments for prices and quantities.
The reduced forms (68) suggest many possible instruments, including a product's
own attributes and cost variables, and other products' attributes and cost variables.
Unfortunately, most IO data sets do not have product-speci c or rm-speci c cost
information. Even when they do, they cannot make use the information because it is
extremely highly correlated or collinear. The lack of good cost covariates has forced
most researchers to use non-price attributes as instruments, or in some panel data
contexts, the prices of products in other markets as instruments.
The use of other prices and non-price attributes as instruments raises delicate iden-
ti cation issues. Consider, for instance, how one might use panel data on prices and
quantities in di erent geographic markets. Several researchers have proposed using
prices in nearby markets as instruments for prices. Thus, to estimate cereal demand
in San Francisco, the researcher might use contemporaneous cereal prices in Los An-
geles as instruments. The key modeling question here is the same as in Section 4:
How do we know prices in other markets are valid instruments? The answer again
has to come from economics.
Hausman (1996) uses economics to motivate his use of nearby price instruments to
model cereal demand. He assumes that the price for brand j in market m has the
form
lnpjmt = Æj lncjt + jm +jmt;
where cjt are product-speci c costs that do not vary across geographic areas, the
jm are time invariant product-city (m) speci c markups, and jmt are idiosyncratic
65markups. Althoughhe does not spellout the underlying economicmodelthat delivers
this equation, it clearly parallels the rst-order conditions for pro t maximization
found in equations such as (49).
For prices in market n to be valid instruments for prices in market m, they must
be correlated with prices in market m and uncorrelated with the demand error for
product j in market m. Because the 's represent unobserved product and market-
speci c factors that a ect mark ups they could well be correlated with the demand
errors. As an example, one could imagine San Franciscans' unobserved health con-
scious attitudes leading them to have a higher demand for organic cereals and, as a
result, them paying higher markups on average. Hausman deals with this concern by
removing the brand-market 's using product-market xed e ects. Letting e denote
the residual prices from these regressions, his adjusted prices have the form:
g
lnpjnt = g
Æj lncjt + g jnt: (69)
That is, they contain only adjusted national marginal costs and residual cost and de-
mand factors a ecting markups. At this point, Hausman makes two critical assump-
tions: (1) the adjusted time-varying national marginal costs lncjt are uncorrelated
with the demand errors in other cities; and (2) the residual demand and cost factors
a ecting markups are uncorrelated with the demand errors in other cities.
How likely is it that these two assumptions are satis ed? Economics can provide no
general answer here. Indeed, these issues have been vigorously debated by Hausman
and Bresnahan (1997). The advantage of Hausman's model for prices is it helps focus
thedebateontheinstitutionalfeaturesofthemarketthatmightmakehisassumptions
valid. For example, one could criticize Hausman's assumptions by saying that there
are common national unobserved seasonal factors that a ect both the demand and
marginal cost of cereal brands. Such factors would invalidate assumption (1), unless
one included (as Hausman did) monthly dummy variables in the instrument list.
Condition (2) could fail for similar reasons, but to know for sure whether this is a
problem, one has to use economic arguments to understand when unobserved demand
factors might a ect the residual mark up terms in g jnt. Bresnahan (1996) provides
such a model in which a rm's periodic national advertising campaigns translate into
increased demands and markups in all markets. This results in correlation between
the idiosyncraticmarkup terms inother markets and demand errors.14 Whether these
advertising campaigns are of great consequence for demand and price-cost estimates
in a particular application is not something that can be decided in the abstract.
Rather it will depend on the marketing setting and the economic behavior of the
14The criticism that advertising in uences demand amounts to an attack on demand speci cations
that ignore advertising. As Hausman's empirical model does include a variable measuring whether
the product is on display, the question then becomes whether the display variable captures all
common promotional activity.
66rms under study.
IO economists also have sought to use non-price attributes as instruments for prices
and quantities. Similarconcerns, however, can be raised aboutnon-price instruments.
Consider, for example, the problem of trying to model airline travel demand along
speci c city-pairs. In such a model, the researcher might use a ight's departure time
as a non-price attribute that explains demand. The reduced form expressions in (68)
suggest that besides the carrier's own departure time, measures of competingcarriers'
departure times could serve as instruments. But what makes' the characteristics of
carriers' schedules' valid instruments? They may well not be if the carriers choose
departure times. For example, carriers may choose di erent departure times so as to
di erentiate their ights and charge higher prices.
If rms set non-price attributes using information unavailable to the econometrician,
then we can no longer be certain that product attributes are validinstruments. While
in principle we might follow Hausman's example, and use other products' character-
istics as instruments, we would, like Hausman, have to develop an economic model
of product characteristic choice. Such an approach would signi cantly complicate a
di erentiated product model.
In some applications, researchers have defended the use of non-price attributes as
demand instruments with the argument that they are \predetermined". Implicit in
this defense is the claim that rms nd it prohibitively expensive to change non-price
attributes once set. As a result, non-price product characteristics can reasonably
thought of as being uncorrelated with short run unobserved demand variables that
a ect prices. For example, a researcher modeling the annual demand for new cars
might argue that the size of a car is unlikely correlated with short-run changes in
demandthat woulda ect new car prices. Whilethislogichassome appeal, itrelieson
the assumption that the unobserved factors that in uenced the manufacturer's initial
choice of characteristics do not persist through time. These and other endogeneity
problems continue to make the search for identifying assumptions in di erentiated
product models an active area of research.
## 7.2 Micro-Data Models
Our discussion of the product-level demand speci cations in (65) so far has focused
on using product-level price and quantity data to draw inferences about competition
and price-cost margins. Product-level demand speci cations, however, potentially
obscure important di erences among consumers that impact rms' price and quan-
tity decisions and competition. For example, the recognition that consumers have
di erent willingnesses to pay immediately raises the question of why rms would
not attempt to price discriminate or otherwise segment consumers. Frequent buyer
67discounts are a ready example of this. More sophisticated bundling strategies, such
as o ering options packages on new cars also come to mind. Demand systems that
do not model heterogeneity in consumer tastes cannot begin to contemplate these
possibilities, or indeed what would happen if a new product were introduced into a
market. These possibilitiessuggest that accounting for consumer heterogeneity ought
to be an important part of di erentiated product models. Most neoclassical demand
system models, however, explicitly adopt a representative consumer framework.
When, as is sometimes the case, researchers have individual-level consumption data,
they can model the heterogeneity that rms may perceive in consumers' tastes. Al-
though such demand data ideally would come from the rms making pricing and
production decisions, in practice IO researchers have had to rely on government data
and non-proprietary marketing surveys. The main modeling issue that researchers
face in using such data is how to go from individual-level demand speci cations to
the product-level demand functions that rms are presumed to use when formulating
price and quantity decisions.
Prior research has taken one of two approaches to this problem. The rst estimates
consumer-level demand models using representative samples of consumers. The re-
searcher then uses sample weights to aggregate consumer demands to product-level
estimates of rm demand curves. The second approach does not have information on
the distribution of individual consumer tastes. Instead, it estimates the distribution
of consumer tastes along with other demand and supply parameters from aggregate
price and quantity information.
In what follows, we explore some of the advantages and disadvantages of these two
approaches. To focus our discussion, we follow the existing literature and consider
discrete demand speci cations. Speci cally, these models presume that consumers
buy at most one unit of one product from among J products o ered.15 While these
unitarydemandmodelsareliterallyapplicabletoonlyafewproducts, such asnew car
purchases, they have been applied to estimate the demands for a range of products.
The distinguishing feature of a discrete choice demand model is that consumer de-
mands are probability statements. Once the researcher adopts a speci c probability
model for choice, product-level demands simply are sums of consumers' purchase
probabilities. These highly nonlinear demand systems have two compensating ad-
vantages. First, the discrete choice framework readily allows the researcher to model
how product attributes a ect consumer tastes and decision making. In particular,
consumers preferences over a large number of products now can be reduced to a
short list of product attributes. Thus, instead of trying to model 50 cereal products
directly, a researcher can reduce the consumers' choice problem to a choice over a
15There are continuous choice multi-product demand models. These models are better termed
mixed discrete-continuous models because they have to recognize that consumers rarely purchase
more than a few of the many products o ered. See, for example, Hanemann (1984).
68cereal's sweetness, crunchiness and ber content. A second advantage is that discrete
choice models can generate rich substitution patterns for products. These patterns
can change depending on the proximities of product attributes.
As with homogeneous-product structural competition models, di erentiated product
models contain many economic, functional form and stochastic assumptions that
will a ect the researcher's inferences about demand, consumer preferences and price-
cost margins. In what follows we use our framework for building structural models
to evaluate two early di erentiated product models describing US new-car price-
cost margins. The rst, by Goldberg (1995), uses representative household new-car
purchase data to estimate household-level purchase probabilities for di erent new car
models. Shethensumsthesehousehold-levelprobabilitiestoobtaindemandestimates
at the market level. Assuming these market-level estimates are what rms use when
determining prices, she uses them in rms' pro t-maximization conditions to draw
inferences about products' unobserved marginalcosts and new car price-cost margins.
The second approach we consider is by Berry, Levinsohn and Pakes (1995). They do
not have household-level data. Instead, they construct their demand system from
product-level price and quantity data. Like Goldberg, they too base their demand
estimates on sums of individual purchase probabilities. Unlike Goldberg, they match
the parameters of this sum to realized new car market shares.
7.2.1 A Household-Level Demand Model
Goldberg's model of prices and quantities in the US new car market follows the logic
of a homogeneous product competition model. Her estimation strategy is divided
into three steps. In the rst step, Goldberg estimates household-level demand func-
tions. In the second, the household-level demand functions are aggregated to form
estimates of rms' expected demand curves. In the third step, Goldberg uses the
estimated expected demand curves to calculate rms' rst-order conditions under the
assumption that new car manufacturers are Bertrand-Nash competitors. From these
rst-order conditions, she can then estimate price-cost markups for each new car
model. The main novelty of Goldberg's paper is that she uses consumer-level data
to estimate rms' expected new car demands. The supply side of her model, which
develops price-cost markup equations, follows conventional oligopoly models, albeit
it is computationally more diÆcult because the demands and derivatives for all the
cars sold by a manufacturer enter the price-cost margin equation for any one new car
it sells.
697.2.2 Goldberg's Economic Model
Goldberg's economic model treats consumers as static utility maximizers. Consumer
i posses the time t conditional indirect utility function:
Uijt = U(xjt;pjt;!ijt);
where xjt is a K 1 vector of non-price attributes of car j (such as size and horse-
power), pjt isthecar'sprice, and!ijt represents consumer-levelvariables. Sheassumes
that consumer i purchases at most one new or used car. In particular, consumer i
chooses new car j provided U (xjt;pjt;!ijt)  maxk6=j U (xkt;pkt;!ijt;): If rms
knew everything about consumers' tastes, they would calculate product demand as
Demand for Product j =
Mt X
i=1
I( i buys new car j) (70)
where Mt is the number of potentialnew car buyers at timet and I(Arg) is a zero-one
discrete indicator function that is one when Arg is true. Of course, neither Goldberg
or the new car manufacturers observe everything relevant to consumers' decisions.
Firms instead base pricing decisions on what they expect demand to be:
Expected Demand = qe
jt =
Mt X
i=1
E

U (xjt;pjt;!ijt)  max k6=j
U (xkt;pkt;!ikt;)

:
(71)
In this expression, E is the rm's expectation over the unobservables in !ijt. The
rm is assumed to know the size of the market Mt. The expectation in (70) can
equivalently be expressed as the sum of rms' probabilityassessments that consumers
will buy model j:
qe
jt =
Mt X
i=1
Pr( i buys new car j): (72)
Goldberg of course does not observe rms' expectations. The initial step of her
estimation procedure therefore seeks to approximate Pr() with probability estimates
from a discrete choice model. The validity of this approach hinges both on how close
her discrete-choice probability model is to rms' assessments and how accurately she
is able to approximate the sum of probability estimates.
Toestimatehouseholdprobabilities,GoldbergusesdatafromtheUSBureauofStatis-
tics Consumer Expenditure Survey. This survey is a strati ed random sample of ap-
proximately 4,500 to 5,000 US households per quarter. By pooling data for 1983 to
## 1987 Goldberg is able to assemble data on roughly 32,000 households purchase deci-
sions. In her data she observes the vehicles a household purchases and the transaction
price. She augments this consumer-level data with trade information about new car
attributes.
70A critical component of her expected demand model is the list of attributes that
enter consumers' utility functions. While economics provides clear guidance that the
transactions price is a relevant attribute, economics provides little guidance about
the other attributes that might enter consumers' utilities. Goldberg's approach is
to rely on numerical measures found in car buyer guides. These measures include
horsepower, fuel economy, size, and dummy variables describing options. The two
questions that cannot easily be answered by this approach are whether these are the
only attributes consumers care about and how consumers trade o the availability
and prices of vehicle options.
In estimating the expected demands faced by new car manufacturers, Goldberg re-
lies on the representativeness and accuracy of Consumer Expenditure Survey. Her
assumption that her probability model replicates the rms' assessments of consumer
behavior allows her to replace Pr(i buys new car j) in (72) with an econometric
estimate, ^ Pr(k buys new car j) { sample household k's purchase probability. The
assumption that the CES sample is representative of the Mt consumers permits her
to replace the sum over consumers in (71) with a weighted sum of the estimated
household purchase probabilities: (73) by
Estimated Demand for Product j =
St X
k=1
wkt ^ Pr( k buys new car j) (73)
where the wkt are CES sampling weights for sample household k and St is the number
of sample households in year t.
On the production side, Goldberg assumes that new car manufacturers maximize
static expected pro ts by choosing a wholesale price. Unfortunately Goldberg does
not observe manufacturers' wholesale prices. Instead, she observes the transactions
prices consumers paid dealers. In the US, new car dealers are independent of the
manufacturer. The di erence between the retail transaction price and the wholesale
pricethus re ects the independent dealer's markupon the car. The dealer's incentives
are not modeled in the paper for lack of data. Instead, Goldberg uses manufactur-
ers' suggested retail (\list") prices to construct proxies for the unobserved wholesale
prices. Speci cally, she assumes that the manufacturer's wholesale price is a constant
percentage of a new car's suggested list price. While this assumption facilitates esti-
mation, it is unclear exactly what behavior leads manufacturers to set suggested list
prices in this way.16
Goldberg models manufacturers' decisions about wholesale prices as outcomes of a
static Bertrand-Nash pricing game in which manufacturers maximize expected U.S.
pro ts. The expectation in pro ts istaken over the demanduncertainty in each !ijt.17
16For more discussion of dealer behavior see Bresnahan and Reiss (1985).
17In principle, the rm also might be uncertain about its marginal cost of production. Goldberg
71Thus, rm f maximizes
max
pW
jt
nft X
i=1
(pW
it cit)E(qit) (74)
where pW is wholesale price, nft is the number of new car models o ered by rm f
and the cit are constant marginal production costs.
The rst-orderconditionsthatcharacterizemanufacturers'wholesalepricingdecisions
have the form:
pW
jt qe
jt +
nft X
i=1
pW
it cit
pW
it
qe
it ijt = 0 (75)
where qe
it = E(qit), and ijt =
pW
jt @qe
it
qe
it@pW
jt
is the cross-price elasticity of expected demand.
This equation shows that in order to obtain accurate estimates of the rm's price-cost
margins, we need to have accurate estimates of the rms' perceived cross-price elas-
ticities. Changes in the demand model, say by changing the modelof rm uncertainty
about consumer tastes, will likely change the estimated cross-price elasticities, and
thus in turn estimates of price-cost markups.
Once Goldberg has estimated her demand model and obtained expressions for the
cross-price elasticities, the only remaining unknowns in the rms' rst-order condi-
tions are their marginal costs, the cjt. Because Goldberg has one rst-order condition
for each product, she can in principle solve the system of equations exactly to ob-
tain estimates of the cjt and price-cost margins. In practice, Goldberg's supply side
rst-order conditions are further complicated by the reality that Japanese manufac-
turers during the early and mid-1980s faced voluntary export restraints. Goldberg
models these voluntary restraints as potentially binding constraints on rms' quan-
tities. Their introduction considerably complicates matters because Goldberg must
worry that they may cause there to be no pure-strategy pricing equilibrium. In an
attempt to overcome this problem, she assumes that excess demand for Japanese
imports would not generate extra demand for domestic vehicles. She claims this as-
sumption is necessary but not suÆcient to guarantee that her economic model has a
pure strategy Bertrand-Nash equilibrium.
## 7.2.3 The Stochastic Model
To estimate sample household purchase probabilities, Goldberg employs a nested
logit model discrete choice model. She assumes consumers' indirect utilities have the
additive form
Uijt = U(xjt;pjt;  !ijt)+ijt
can allow for this possibility only if the cost uncertainty is independent of the demand uncertainty.
Otherwise, Goldberg would have to account for the covariance of demand and costs in (74).
72where  !ijt are observable household and product characteristics and ijt is a general-
ized extreme value error. Goldberg goes on to assume that the indirect utility func-
tion is linear in unknown taste parameters, and that these taste parameters weight
household characteristics, vehicle attributes and interactions of the two. The general-
ized extreme value error assumption appears to be made because it results in simple
expressions for the rms' expectations about consumer purchase behavior found in
equation (72).
The generalized extreme value error results in a nested logitmodel. Goldberg's choice
of logit nests follows a particular sequential model of household decision making.
Speci cally, she expresses the probability that household k buys model j as a product
of conditional logit probabilities:
Pr( k buys new car j)
= Pr(k buys a car) Pr(k buys a new carjk buys a car)
 Pr(k buys new in segment containing j jk buys a new car)
 Pr(k buys new from j0s origin and segment jk buys new in segment containing j)
 Pr(k buys j jk buys new from j0s origin and segment):
(76)
This particular structure mirrors a decision tree in which household k rst decides
whether to buy a car, then to buy new versus used, then to buy a car in j's segment
(e.g., compact versus intermediate size), then whether to buy from j's manufacturer
{ foreign or domestic, and then to buy model j.
Goldberg appears to favor the nested logit model because she is uncomfortable with
the logit model's independence of irrelevant alternatives (IIA) property. The IIA
propertyoftheconventionallogitmodelimpliesthatifsheaddedacartoaconsumer's
choice set, it would not impact the relative odds of them buying any two cars already
in the choice set. Thus, the odds of a household buying a Honda Civic relative to a
Toyota Tercel are una ected by the presence or absence of the Honda Accord. The
nested logitattempts to correct this problem by limitingthe IIA property to products
within a nest.
In principle, Goldberg could have chosen a di erent stochastic distribution for con-
sumers' unobserved tastes, such as the multivariate normal, and avoided the IIA
problem all together. Goldberg makes it clear that she prefers generalized extreme
value errors because they allow her to use make maximum likelihood methods that
directly deliver purchase probability estimates. Speci cally, the nested logit model
permits her to compute the right hand side probabilities in (76) sequentially using
conventional multinomial logit software. Although Goldberg is clear that the gener-
alized extreme value assumption is made to facilitate estimation, it is less clear how
73she arrived at the particular conditioningand nesting structures that she adopts. Her
choice of nesting structure is important here because the IIA property holds at the
household level for each new car within a nest. Changes in the nests in principlecould
a ect her estimates of cross-price elasticities. Unfortunately, economic theory cannot
guide Goldberg's nesting structure. This ambiguity motivates Goldberg to explore at
length whether her results are sensitive to alternative nesting structures.
While the independence of irrelevant alternatives applies to some household choices,
it does not at the market demand level. This is because Goldberg interacts income
and price with household characteristics. By using interactions and aggregatingusing
household sampling weights, Goldberg insures that her product-level demand func-
tions do not have the economically unattractive IIA structure.18
Goldberg makes two other key stochastic assumptions when she estimates her nested
logit model. The rst is that new car prices and non-price attributes are independent
of consumers' unobserved tastes, the ijt. This is a critical modeling assumption, as
it is possible to imagine cases where it would not hold. Suppose, for instance, that
the ijt includes consumer perceptions about a car's quality, and that rms know
consumers perceptions. In this case, rms' pricing decisions will depend on the car's
quality. Because Goldbergdoes not observe quality, her econometric speci cation will
attribute the e ects of quality to price and non-price attributes. This results in the
same endogeneity problem found in neoclassical demand models. To see the parallel,
imagine that ijt consists of a product-time xed e ect (\quality") and noise. That
is, ijt = jt +ijt. Since jt is common to all households and known to the rm, it
will appear in the aggregate demand curve
qe
jt(jt) =
Mt X
i=1
Pr( i buys new car j jjt )
that the rm uses when maximizing pro ts. Because Goldberg does not observe
product quality, she would need to devise a strategy for removing it from the demand
curve.
The best way toaccount forthisunobserved heterogeneity withinanested logitmodel
would be to add behavioral equations to the model that would explain how manu-
facturers jointly choose price and quality. Such a formulation unfortunately compli-
cates estimation considerably, as quality and the determinants of quality are likely
to be unobserved. As an alternative, Goldberg could simply assume a distribution
for quality and then integrate quality out of aggregate demand using this assumed
distribution. This strategy is economically unattractive, however, since one would
have to recognize the unknown correlation of prices and qualities when specifying
the joint distribution. What Goldberg does instead is she assumes that unobserved
18This can seen by examining the population odds of buying two di erent vehicles.
74quality is perfectly explained by a short list of time-invariant product characteristics,
such as the manufacturer's identity (e.g., Toyota), the country of origin (e.g., Japan)
and the car's segment (e.g., compact). The assumption of time invariance allows her
to use xed e ects to capture these components. The ultimate question with this
strategy that cannot be easily answered is: Do these xed e ects capture all the
product-speci c unobservables that might introduce correlation between prices and
consumers' unobserved preferences?
A nal stochastic component of the model pertains to manufacturers' marginal costs.
Ignoring the issue of voluntary export restraints, the system (75) exactly identi-
es each product's marginal costs. Following Hausman et al (1994), she uses these
marginalcost estimatestocalculateproduct price-cost markups, which she nds tobe
somewhat on the high end of those reported in other studies. It is criticalto note that
Goldberg's marginal costs contain several types of error. They re ect the sampling
error of the CES and they contain the estimation error in the purchase probabilities.
In addition, for unexplained reasons, Goldberg assumes that the costs contain an ad-
ditional source of error. Speci cally, she assumes that each product's marginal costs
can be represented by the same linear function of product characteristics
cjt = c0 +Zjt +ujt
where the Zjt are observable product characteristics and ujt are unobserved marginal
costs. Goldberg does not motivate what it is about the production technology of car
manufacturing that would lead to this linear conditional expectation. Following our
discussion insection 4, ofthe di erence between best linearpredictors and conditional
expectations, it seems that this is more a descriptive model than a structural model
of costs.
## 7.2.4 Results
If we compare Goldberg's model to homogeneous product competition and neoclas-
sical di erentiated product models, we see that Goldberg's competition model is
considerably richer. Her demand system (73) admits complicated substitution pat-
terns among products. These substitution patterns depend, as one might hope for,
on the proximity of products' attributes. There are two main costs to this richness.
First, she must introduce many functional form and stochastic assumptions to limit
the scale and computational complexity of the model. As we argued earlier, struc-
tural modelers often must introduce assumptions to obtain results. Without these
assumptions and restrictions, it would be diÆcult for Goldberg to estimate demand
and costs, or evaluate the impact of the voluntary export restraints. She also might
not be able to argue convincingly that her estimates make sense (e.g., that they imply
a pure-strategy equilibrium exists or is unique).
75A second cost of the richness of her model is that it becomes diÆcult for her to
summarize exactly how each economic and stochastic assumption impacts her con-
clusions. For example, at the household level, IIA is presumed within nests. Her
utility speci cations and method of aggregation, however, imply that IIA will not
hold at the aggregate level. But just how much exibility is there to the aggregate
demand system and the cross-price elasticities? Questions about the role of struc-
tural assumptions such as this are very diÆcult to answer in complex models such
as this. For this reason Goldberg, as other structural modelers in the same position,
must extensively evaluate the economic implications of her estimates. For instance,
Goldberg spends considerable time exploring whether her parameter estimates and
implied markups agree with other industry sources and whether the estimates are
sensitive to alternative plausible structural assumptions.
While structural researchers can in many cases evaluate the sensitivity of their esti-
mates to speci c modeling assumptions, some aspects of structure are not so easily
evaluated. For example, Goldberg's model relies on the maintained assumption that
weighted sum of estimated CES sample purchase probabilities accurately measures
rms' expectations about product demand. If there is something systematic about
rms' expectations that her household model does not capture, then this will mean
she is not solving the same rst-order pro t maximization problems that the rms
were when they set prices. Her reliance on this assumption is nothing new. The cor-
rect speci cation of demand is implicit in most other papers in this area (e.g., Porter
and Hausman et al.). As we argued earlier in laying out our framework, all structural
models base their inferences on functional form and stochastic assumptions that are
in principle untestable. In this case, Goldberg's problem is that she does not observe
rms' expectations. Consequently, when she nds that her model underpredicts total
new car sales, she cannot know whether this is because rms underpredicted demand
or there is a problem with her speci cation or data.19
7.3 A Product-Level Demand Model
Berry (1994), Berry, Levinsohn and Pakes (BLP, 1995), and many others also have
constructed di erentiated product demand systems from discrete-choice models. In
what follows, we describe BLP's (1995) original model and compare it to Goldberg's
model and the neoclassical demand systems discussed earlier. Unlike Goldberg, BLP
(1995) only have access to product-level data. Speci cally, they know a new car
model's: unit sales, list price, and attributes. In all, they have twenty years of data
covering2,217newcarmodels. Theirde nitionofanew carmodel(e.g., FordTaurus)
is rich enough to describe important dimensions along which new cars di er. Their
19Goldberg's chief hypothesis is that the household CES data under-represent total sales because
they do not include government, business or other institutional sales.
76data, however, do not capture all dimensions, such as two-door versus four-door cars
and standard versus luxury-equipped cars.
BLP use these product-level price and quantity data to draw inferences about con-
sumer behavior and automobile manufacturers' margins. Like Goldberg, they base
theirdemand system on adiscrete choice modelof consumer choices. At rst thismay
seem odd { How can they estimate a consumer choice model with aggregate data?
The answer lies in the structural assumptions that permit them to relate household
decisions to product-level price and quantity data.
We can informally contrast Goldberg and BLP's approaches by comparing how they
model the product demands on which rms base their pricing decisions. Recall Gold-
berg computes rms' expected product demands as follows:
qe
jt =
Mt X
i=1
Pr( i buys new car j) =
Mt X
i=1
Pr(P1t;:::;PJt;x1t;:::;xJt;  !ijt ; ) (77)
whereshereplacesPr(P;x; !ij;)withhereconometricmodelestimatesofhowhouse-
hold i's choices vary with their observable characteristics  !ijt. Because Goldberg only
uses household-level data, there is no guarantee that when she aggregates her proba-
bility estimates to form qe
jt that they will match aggregate purchases, qjt.
BLP (1995) on the other hand do not have the household-level data required to es-
timate how household choice probabilities vary with  !ijt. Instead, they treat actual
sales, qjt, as though it is a realization from the demand curve that the rm uses to
set price. In essence, it is as though they assume qjt = qe
jt. BLP then replace the
household-speci c probabilities Pr(P;x; !ij;) on the right hand side with uncondi-
tional purchase probabilities Sj(P;x;). They do this by assuming a distribution,
P( !ijt;Æ), for the household variables that they do not observe. Formally, they com-
pute the unconditional demand functions
qe
jt =
PMt
i=1
R
! Pr(P1t;:::;PJt;x1t;:::;xJt;!;) dP(!;Æ)
= Mt Sj(P1t;:::;PJt;x1t;:::;xJt ; ;Æ);
(78)
where the second equality follows because the distribution of consumer variables is
the same for each of the Mt households in the market for a new car. To estimate
the demand parameter vector  and distribution parameter vector Æ, BLP match the
model's predicted expected sales qe
jt = MtSj to observed sales qit. (This is the same as
matching expected product shares Sj to realized product market shares, qit=Mt.) As
in Goldberg's econometric model, the economic and stochastic assumptions that go
into the construction of Pr() and Sj have a critical bearing on the resulting demand
and markup estimates.
777.3.1 The Economic Model in BLP
In BLPs model, rms sell new cars directly to consumers. Firms do not price dis-
criminate and consumers are assumed to know the prices and attributes of all new
cars. There are no inter-temporal considerations for either rms or consumers. In
particular, there is no model of how rms choose product attributes, and consumers
do not trade o prices and product attributes today with those in the future.
As before, consumer i's conditionalindirect utilityfunction for new cars has the form:
Uijt = U(xjt;pjt;!ijt):
Consumers decide to buy at most one new car per household. There are no corporate,
government or institutional sales. In contrast to Goldberg, BLP do not model the
choice to buy a new versus a used car. Instead, purchases of used vehicles are grouped
with the decision to purchase a hypothetical composite outside good labeled product
0. The demand for the outside good is by assumption determined residually by the
assumption that households buy at most one new car per year Thus, if
PJ
j=1qjt is
the observed number of new cars bought in year t, q0t = Mt
PJ
j=1qjt is the number
choosing to purchase the outside good.
The rm side of the market in BLP is similarly straightforward. Sellers know the
demand functions calculated above and each others' constant marginal costs of pro-
duction. Sellers maximize static pro t functions by choosing the price of each model
they produce. When choosing price, sellers act as Bertrand-Nash competitors, as in
Goldberg.
## 7.3.2 The Stochastic Model
There are three key sets of unknowns in BLP's model: the number of consumers
in each year, Mt; the distribution of consumer characteristics Pr(!;Æ); and sellers'
manufacturing costs. We consider each in turn.
Not knowing Mt, the overall size of the market, is a potential problem because it
relates the choice probabilities described in equation (78) to unit sales. BLP could
either estimate Mt as part of their econometric model or base estimation on some
observable proxy for Mt. Although the rst of these approaches has reportedly been
tried, few if any studies have had much success in estimating the overall size of the
market. This diÆculty should not be too surprising, since the absence of data on the
outside good means that the additional assumptions will have to be introduced to
identify the overall size of the market.
One way to develop intuition for the assumptions needed to estimate Mt in a general
model is to consider the role Mt plays in a cross-section logit model. Speci cally,
78suppose that utility consists of an unobserved product attribute j and an extreme
value error ij:
Uij = j +ij (79)
To obtain the unconditional purchase probabilities Sj(p;x;;Æ) we integrate out the
consumer-level unobservables
Sj =
Z 1
1
k6=j Pr(j + > k) f()d; (80)
to obtain the familiar logit probabilities
Sjt =
exp(j )
PJ
k=0 exp(k )
: (81)
In this formulation, the demand functions are
qj = M Sj(1;:::;J) (82)
or
lnqj = lnM +j ln(
J X
k=0
k) (83)
and the demand parameters are  = (0;1;:::;J;M). As a simple counting exercise,
we have J equations in J observed new vehicle quantities, and J + 2 unknowns,
 = (0;1;:::;J;M). Adding a quantity equation for the unobserved quantity of the
outside good, q0, does not change the di erence between knowns and unknowns, but
does allow us to collapse the log-quantity equations to:
lnqj lnq0 = j 0: (84)
Since by de nition q0 = M
PJ
j=1 qj, we can rewrite the J equations as:
lnqj ln
0
@M
J X
j=1
qj
1
A = j 0: (85)
In general, we require at least two restrictions on the J +2 unknown demand param-
eters (0;1;:::;J;M) to be able to solve these J equations. Since the outside good is
not observed, we can without loss of generality normalize 0 to zero. This still leaves
us one normalization short if we have to estimate M.
In their empirical work, BLP choose to x Mt rather than restrict the 's or other
parameters. Speci cally, BLP rely on the same assumption as Goldberg and assume
that Mt is the total number of US households in year t. This choice has some po-
tential shortcomings. Not all households can a ord a new car, and entities other
than households purchase new vehicles. In principle, one could model these discrep-
79ancies by assuming that the total number of US households is a noisy measure of
Mt. The impact of this measurement error on the demand parameters could then be
explored. To illustrate, suppose that we mistakenly use f
Mt = Mt +t in place of Mt.
Substituting f
Mt into (85) with 0 = 0 gives
lnqj ln
0
@ f
Mt
J X
j=1
qj
1
A = e
j: (86)
If we overestimate the size of the market (i.e., f
Mt > Mt) then the left hand side is
smaller than it would otherwise be by the same amount for each product. This will
make the average (unobserved) j seem lower, or in other words that all new cars that
year are worse than average. In essence, the unobserved product qualities would act
as a residual and capture both true quality di erences and measurement error in the
size of the market.
Unfortunately in an actual application, we will typically not know whether we have
over or underestimated Mt. This means that we will not know in which direction
the bias goes on the estimated product qualities, the j's. While the availability of
panel data might allow us to attempt developing a random measurement error model
for Mt, in practice the nonlinearity of the demand functions in the measurement
error will make it diÆcult in short panels to draw precise conclusions about how this
measurement error impacts demand estimates. Thus, one is left with using a proxy
for Mt as though it had no error or imposing enough additional restrictions on the
demand model so that Mt can be estimated.
The second set ofunobservables that enter BLP's demand functionsare the household
variables, !ijt. Formally, BLP assume household i's indirect utility for new car j has
the two-part structure:
Uijt = Æjt + !ijt
=
z }| {
xjt +jt +
z }| {
xjt ~ i +ln(iy pjt)+ijt
(87)
The Æjt includes only terms that are not household-speci c. For BLP it consists of
a linear function of observed (x) and unobserved () variables describing products.
In this formulation, the elements of K  1 parameter vector are interpreted as
population average marginal utilities for the observed attributes, xjt.
The !ijt contain three separate household-level terms. The familiar extreme value
error term ijt allows for unobserved household-speci c tastes for each model in each
year. The interaction of the household variables ~ i with the product attributes al-
lows for the possibility that households do not have the same marginal utilities for
attributes. While in principle one might expect that households' marginal utilities
would depend on a household's income and other demographic characteristics, the
lack of household data forces BLP to assume that the i's are independent normal
80random variables that are identically distributed in the population.20 In addition,
they assume that a household's unobserved marginal utility for attribute k is inde-
pendent of their marginal utility for attribute h. The unboundedness of the support
of the normal distribution implies that some households will prefer attribute k and
some will have an adversion to it. Speci cally, the fraction that dislike attribute
k is given by ( k=ik), where () is the standard normal cumulative distribution
function and ik is the standard deviation of ik.
The nal stochastic component of ! is the natural logarithm of a household's ex-
penditure on the outside good, ln(yi pjt). BLP include this term so that they
can interpret Uijt() as a conditional indirect utility function. Once again they need
to make some distributional assumption on the unobserved yi in order to compute
expected demand. In their empirical work they assume that the natural logarithm
has a log-normal distribution. However, the lognormal distribution must be trun-
cated di erently for each model to account for the fact that the expenditure on the
outside good must be positive. Put di erently, their stochastic structure must have
all households' incomes exceeding the price of the highest price car in their data.
A nal element of the preference speci cation is BLP's treatment of the outside good.
BLP assume that the utility for the outside good has the form:
Ui0t = ln yi +0 i0 +i0t:
Unobserved income appears here because that is the amount spent on the outside
good when no new car is purchased. The parameter 0 is new; it represents the
standard deviation of the household's unobserved preference for the outside good,
i0. To appreciate the role of i0, recall that only di erences in utilities and not
utility levels are identi ed. In the logit model this means that the logit population
shares will have the form:
Sjt =
exp(Æjt +  !ijt )
exp(Æ0t +  !i0t )+
PJ
k=j exp(Æk +  !ikt)
: (88)
which is equivalent to (assuming without loss of generality = 0)
Sjt =
exp((jt 00i)+( !ijt ln yi))
1+
PJ
k=j exp((kt 00i)+( !ikt ln yi))
: (89)
This expression reveals that including an idiosyncratic taste for the outside good
is equivalent to a model in which we included a household-speci c constant in the
unobserved jt. Thus, if the unobserved attribute were product quality, the 0i would
20BLP and students have in follow on papers explored alternatives to this structure. Using micro
data, as in Goldberg (1995), BLP (1998) allow consumers' marginal utilities to depend on observable
and unobservable household attributes.
81linearly translate each household's quality ratings. Households therefore would all
agree on the di erence in any two cars' qualities, but households would disagree on
the overall quality of new cars. In particular, households with large values of 0i do
not think that the quality of new cars is very high and consequently are more likely to
opt for the outside good. Thus, holding the population average qualities of new cars
xed, increases in the standard deviation of i0 have the e ect of forcing substitution
away from all new car models toward the outside good.
## 7.3.3 More on the Econometric Assumptions
Now that we have provided an overview of BLP's many economic and stochastic
assumptions, it is useful to revisit some of them to understand further why BLP
adopt these assumptions.
## 7.3.4 Functional Form Assumptions for Price
A rst critical component of the speci cation of any choice model is the assumption
made about how product prices a ect utility. Consider what would happen, for
example, if BLP had entered (as some studies do) price as an additive function in
Æjt rather than in !ijt. In a standard logit choice model, with Æjt = g(pjt)+ ~ Æjt, the
demand equations have the form:
lnqjt = lnMt +g(pjt)+ ~ Æjt ln 1+
J X
k=1
exp(g(pkt)+ ~ Ækt
!
(90)
The implied own and cross-price elasticities for these demands are:
@lnqjt
@lnpkt
=
8
<
:
@g(Æjt)
@pjt
pjt (1 Sjt) k = j
@g(Æjt)
@pkt
pkt Skt k 6= j
(91)
These expressions reveal how the extreme value error assumption and the choice
of g() can dramatically impact the structure of the own-price and cross-price elas-
ticities that enter the price-markup equations. If price enters logarithmically (e.g.,
g(pjt) = lnpjt), then the own- and cross-price elasticities only depend on product
market shares. In this case, an increase in the price of a Jaguar would cause the
demand for BMWs and Kias, which have roughly similar shares, to increase roughly
the same amount, even though BMWs and Kias are hardly substitutes. To some
extent, one could consider xing this problem by changing the way price enters Æjt
or by interacting functions of price with other vehicle attributes. Such an approach,
however, ultimately may not capture what one might expect, which is that products
with similar attributes will have higher cross-price elasticities.
82The use of the extreme value error can also have some other unattractive economic
consequences. One consequence of the error's unbounded support is that for nite
attributes there always be someone who will buy a make { no matter how inferior
the car is to other cars. Suppose, for example, that instead of having price enter
logarithmically, the function g(p) is bounded above. In this case, product demands
willasymptote to zero instead ofintersecting the price axis. This asymptoticbehavior
can have an unfortunate impact on global welfare and counterfactual calculations.
Petrin (2001), for example, nds that when price is entered linearly that one can
obtain implausibly large estimates of the value of Minivans. Figure 1 illustrates this
problem for two alternative speci cations of g() using a standard logit model for
shares. The demand curve labeled A assumes price enters Æ as p. The concave
demand curve B adopts a logarithmicspeci cation parallelingBLP, g(p) = ln(100
p). The constant  is selected so that each curve predicts roughly the same demand
for a range of prices between 60 and 90. (One might think of this as approximating
a range of data that the researcher would use to estimate .) Comparing the two
demand curves, we can see that there would not be too much of a di erence inthe two
models' predicted demands or local consumer surplus calculations for prices between
60 and 90. But if the researcher is making predictions or performing counterfactual
calculations for prices outside this range of prices, the di erence between the two
demand curves can be dramatic. For example, Demand Curve A estimates that there
are many consumers with reservation prices above 100, while Demand Curve B says
there are none.
0 10 20 30 40 50 60 70
0
50
100
150
200
250
300
Two Demand Curves
Quantity
Price
Demand A
Demand B
Demand A
Demand B
837.3.5 Distribution of Consumer Heterogeneity
In their empirical work, BLP emphasize that they are uncomfortable with the IIA
property of the standard logit choice model, and for this reason they add unobserv-
able household-car attribute interactions. To gain some understanding of what these
unobservables add, consider the following three good market:
 there are two types ofcars available: large(LARGE=2)andsmall(LARGE=1);
 utility for the large and small cars have the form
Uij = 0 + L LARGE +ij
 the large car has 15 percent of the market, the small car 5 percent and the
outside good the remaining 80 percent.
This two-parameterutilityspeci cationperfectly explainsthe largecarout-sellingthe
smallcar 3-to-1by assigninga positive marginalutilityto size of the car ( 0 = 3:871
and 1 = 1:098).21 Although the mean utility speci cation predicts consumers prefer
larger to smaller cars, the in nite support of the extreme value error ijt results in
some consumers having an idiosyncratic preference for small cars.
Now consider what happens with these datawhen we add heterogeneity inconsumers'
marginal utilities for size. In lieu of assuming a continuous distribution of marginal
utilities, suppose for simplicitythat there are just two types of consumers: those with
a taste 1 for size and those with a taste 2. Because we can potentially explain the
three market shares with just two parameters, set 0 = 0. In addition, to avoid the
complication of having to estimate the entire distribution of consumer preferences,
suppose we know that 15 percent of consumers are of type 1 and the remaining 85
percent are type 2.
How does this two-type model explain the market share of the small car? It seems
in principle that the two-type model could t the market share data in the same
way that the single type model did. Both types of consumers would have positive
but di erent marginal utilities for vehicle size, and the unbounded support of the
extreme value error would account for why some fraction of each type would buy an
otherwise inferior car. When we t the predicted shares to the actual shares in this
case, however, we nd that the type 1 consumers have a negative marginal utility
for size ( 2 = 2:829) and the type 2 consumers have a positive marginal utility to
size ( 1 = 3:9836). Thus, when consumers' marginal utilities are unconstrained, the
choice modelmay explainthe purchase of an inferiorproduct by estimatingthat some
consumers have negative marginal utilities for otherwise attractive attributes.
21Explain two parameters.
84This example gets at the heart of IO economists' distinction between vertical and
horizontal product di erentiation models. In vertical models, consumers share sim-
ilar opinions about an attribute, and thus will rank products the same. They may,
however, di er in the strength of their preferences. Thus, at the same price, Peter
and Frank may both want faster computers, but speed is much more important to
Frank. In the utility speci cations above, we can think of a pure vertical model as
one in which consumers have positive, but not necessarily the same marginal utility
for the size of a car. In horizontal di erentiation models, consumers di er in their
opinion about an attribute, and thus rank products di erently. For example, at the
same price, Peter and Frank would have di erent views on the desirability of high
cholesterol snacks.
In multi-attribute models, the relation between vertical and horizontal product dif-
ferences and product rankings becomes more complex. For instance, even though
consumers may all have positive marginal utilities for all attributes, they may rank
products di erently. For instance, Peter and Frank might both want fast comput-
ers loaded with memory. They may choose di erent computers because Peter cares
more intensely about memory while Frank cares more intensely about speed. Al-
ternatively, di erences in rankings also can be explained by some consumers having
negative marginal utilities for some attributes. Peter and Frank again might both
want fast computers loaded with memory, but computers also come with di erent op-
erating capabilities (e.g., Macintosh OS versus Windows) for which Peter and Frank
might have opposing preferences.
In most applications, researchers will have only a few attributes that they can use to
explainwhyconsumerspreferoneproductoverothers. Whentherearemanyproducts
compared to attributes, a large number of products may appear \dominated" accord-
ing to a pure vertical model. For example, the Volkswagen Beetle is a small car, has
a small engine, slightly higher than average fuel economy, etc., and yet at times sold
relatively well in the US. One way BLP's model could explain the apparent relative
success of the Beetle would be to assign it a high unobserved quality, . Alternatively,
as we have seen above, the introduction of heterogeneous tastes can account for why
consumers might prefer an otherwise \average" or \dominated" product. While the
introduction of consumer heterogeneity can increase the exibility of a discrete choice
model, this increased exibility may or may not lead to results that are economically
plausible. For instance, in BLP's econometric results, the mean marginal utility for
miles per dollar is -.122 with an estimated standard deviation of 1.050. Thus, roughly
54 percent of consumers \dislike" this fuel economy attribute. While it is debatable
whether this estimate is high or low, the critical observation is that to explain the
aggregate sales data, their model ascribes considerable heterogeneity to consumers'
tastes.
Since inferences about consumer heterogeneity are predicated on maintained func-
tional form assumptions, it seems imperative that some e ort should go into explor-
85ing the robustness of ndings to distributional assumptions. To date, there has been
only a modest amount of e ort along these lines (see Ackerberg and Rysman (2000),
Berry (2001), Bajari and Benkard (2001a and 2001b) and the references therein),
and much more work remains to be done. In their empirical work, BLP appear to
prefer the use of normal distributions because it simpli es computations. However,
their computations appear to be simpli ed more by their assumption that marginal
utilities are independent, than their assumption of normality.
To see what is involved computationally, recall that the unconditional purchase prob-
abilities have the form:
Sjt =
Z

exp(Æjt +!j())
1+
PJ
k=1 exp(Ækt +!k())
(;Æ)d (92)
In BLP's case, () is a product of standard normal densities and Æ is a parameter
vector containing the standard deviations of the unobserved marginal utilities.22 As
there is no analytic simpli cation for this integral, BLP use simulation methods to
evaluate it. Their paper contains a lengthy treatment of the simulation methods use
to evaluate this integral, and the signi cance of simulation error for their estimates.
The fact that one cannot analytically evaluate consumers' choice probabilities is not
a problem in and of itself. It does, however, make it more diÆcult for the researcher
to evaluate and report to other researchers just how exibile the choice model is over
and above a conventional logit model.
## 7.3.6 Unobserved \Product Quality"
The unobserved car attributes, the jt, are critical stochastic components of BLP's
random utility model. Although the literature sometimes refers to the jt as unob-
served quality, they can be any combination of product-speci c unobservables that
enter consumers' utility in the same way. The relevance of the jt is perhaps best
understood by returning to the cross-section logit model where Æj = j and 0 = 0.
In this case, demands have the form
lnqj ln
0
@M
J X
j=1
qj
1
A = j: (93)
From this equation we see that the jt act as demand \errors" that insure that
the econometric choice model's predicted market shares match the observed mar-
ket shares. In BLP's model it is essential that the predicted and observed market
shares match. This is because BLP's theoretical model presumes that (uncondition-
22This \mixed normal-logit model" has a prior history. See McFadden and Train (1998) for an
overview of early work.
86ally) each consumer's decision can be represented by the same multinomial choice
probabilities: (S0;S1;:::;SJ): Thus, with a sample size, M, of approximately 100 mil-
lion, there should be no di erence between their model's predictions and observed
market shares. The only way to guarantee that there will be no di erence is to have
a suÆciently rich parameterization of demand. The 's achieve just this.
As errors, the  are subject to arbitrary normalizations. To understand better why
normalizations are necessary, let us return to the cross section logit model. Assume
that Æj = xj + j, where xj is a K 1 vector of product attributes. Now, the J
equations in (85) become
lnqj ln
0
@M
J X
j=1
qj
1
A = xj +j: (94)
Assuming M is known, we have J linear equations in J+K unknowns: (1;:::;J; ).
We therefore require K linearly independent restrictions in order to estimate the
marginal utility parameters uniquely. One choice would be to set K of the 's to
zero. BLP instead opt to place moment restrictions on the distribution of the .23
Although they do not motivate their restrictions in any detail, the computational
rationale for the restrictions is readily apparent. Speci cally, BLP assume that the 
are mean independent of the observed characteristics of new cars: E(jjx1;:::;xJ) =
0. This moment condition is useful because it suggests least squares can be used
to estimate the marginal utilities in (94). With least squares, the K population
moment conditions E(jjxj) = 0 are replaced by the K sample moment conditions PJ
t=1 xtj = 0. These K sample moments result in the estimated product qualities
having J K degrees of freedom.
While imposing the population moment condition E(jjx1;:::;xJ) = 0 has a useful
computational rationale, it also has nontrivial economic implications. In particular,
if we view  as an unobserved product attribute such as product quality, then we
have to wonder why it would not be correlated with observable attributes. While
we can think of some attributes that might be uncorrelated, such as the number
of doors on a car, if xj were to include the new car's price, then there would be a
clear cause for concern. The concern is one of unobserved heterogeneity { the rms
observe the quality that consumers assign to cars and use this information to set
price. (Intuitively, rms will set higher prices for cars with higher quality.)
BLP explicitly recognize this problem and do not include price in the list of condi-
23In principle, BLP also could have considered other restrictions on the distribution of the . For
example, BLP could integrate out the population market share conditions over a distribution for
the j . Such an approach is problematic when the j are correlated with observables such as price
because the supply side of their model suggests a complex equilibrium relationship between price
and the j .
87tioning variables x1;:::;xJ. Of course, this means that they must introduce another
moment condition to estimate the price coeÆcient. As in the Marshallian demand
case, BLP in principle have many candidate variables they can use to form moment
conditions, including the attributes of other vehicles. These other attributes e ec-
tively act as \instruments" for price and any other endogenous attributes.24 Indeed,
given the JK attributes in x1;:::;xJ, BLP BLP have many choices for instruments,
making their model highly over-identi ed. Because of concerns with near collinear-
ity (which recall were also are present in neoclassical demand systems), BLP limit
the number of instruments they use in forming their moment conditions for the 's.
In particular, they use: all non-price attributes of the car; the sum of all non-price
attributes of cars made by the same manufacturer; and the sum of all non-price
attributes of cars made by competing manufacturers. As BLP have ve non-price
attributes, these choices provide 15 moment conditions.
One question that BLP do not explicitly address is why it is acceptable to use non-
price attributes to construct instruments. This is the same issue that arose in our
discussion of neoclassical demand systems. One might well imagine here that car
manufacturers choose attributes such as air conditioning and size in concert with a
new car's quality (or other unobservable characteristics). If this is the case, then
these attributes would require instruments as well.
In their empiricalwork, BLP base estimation on sample moment conditions involving
the demand and marginal cost errors (discussed below). As can be seen from the
market share expressions in equation (92), in general it is not possible to compute
closed form expressions for the jt that enter the population moment conditions. This
means in practice that the researcher must numerically invert equation (80) to solve
for the jt. While the integral in (92) is straightforward conceptually, it is diÆcult to
compute in practice. As an alternative, BLP use Monte Carlo simulation methods to
approximate the right hand side integral. Speci cally, they use importance sampling
methods to estimate the integral in (92), which they then invert to obtain the jt for
candidate values of the taste parameters.
## 7.3.7 The Cost Speci cations
To this point, we have said little about the cost side. In principle, one could estimate
thedemandparameterswithoutusinginformationaboutthesupplyside. BLPappear
to add the supply side for two reasons. First, it contributes variables that can be used
intheorthogonalityconditionsthatidentifythedemandparameters. Second, itallows
24For example in the cross section logit model we can replace the moment condition E(j jpj ) = 0
with E(j jxk1) = 0, where xk1 is an exogenous characteristic of car k. This again gives us K moment
equations. The resulting estimator is indirect least squares, in which xk1 serves as an instrument
for price.
88them to estimate markups for di erent models and calculate the pro t potential of
attributes, just as Hausman and Goldberg do. The latter bene t seems much more
importantthan the formersince the cost side contributes just two additionalvariables
to the model (a Time Trend and Miles per gallon). Following the approach discussed
above for constructing demand error instruments, BLP potentially can add 21 (seven
instruments times 3) sample moment conditions for the cost-side error. Because of
collinearity concerns, they drop two of these moment conditions in estimation.25
The stochastic speci cation of the cost-side is fairly straightforward. Sellers equate
the marginal revenues for each model with the constant marginal costs of producing
that model. The researcher estimates sellers' marginal revenues by di erentiating
the market share functions. As in other oligopoly models, BLP decompose product
marginal cost into an observable and an unobservable component. Speci cally, they
assume that the natural logarithm of marginal costs depends linearly on a set of cost
variables and an additive error. This error is also used to form moment conditions
under the assumption that its mean does not depend on new car attributes or cost
variables.
## 7.4 Summary
BLP report estimates for several demand models. They also provide elasticity and
markup estimates for di erent new car models. They argue that these estimates
roughly accord with intuition. They also make a case for their unobserved hetero-
geneity speci cation. It is much more diÆcult for the authors to provide a sense for
their various maintained assumptions impact their results. For instance, the markups
are predicated on the Bertrand-Nash assumption, the choice of instruments, the at-
tribute exogeneity restrictions, the stationarity and commonalityof unobserved prod-
uct attributes. Subsequent work, including work by BLP individually and jointly has
sought to relax some of these restrictions.26 Ongoing work by others is exploring
the consequences of other assumptions in these models, and we leave it to others to
survey this work.27
In concluding this section on di erentiated product demand estimation, we want to
come back to some of the themes of our structural estimation framework. Previously
we emphasized that researchers should evaluate structural models in part by how
well the economic and statistical assumptions match the economic environment being
studied. Di erentiated product models pose an interesting challenge in this regard,
25That is, they base estimation on the 5 times 3 (=15) demand instruments plus 2 times 3 (= 6)
cost instruments less two demand-side instruments.
26For example, Berry(2001) and Berry, Levinsohn and Pakes (1998).
27For example, Ackerberg and Rysman (2000), Bajari and Benkard (2001a), and Bajari and
Benkard (2001b).
89both because they are diÆcult to formulate and because data limitations often limit
the exibility that one can allow in any particular modeling format. At present, there
arefew standards, otherthancrude sanity checks, thatresearchers can use tocompare
the wide array of assumptions and estimation procedures in use. This is true both
on economic and statistical grounds. For example, to date researchers have used
both neoclassical demand and discrete-choice models to estimate price elasticities
and markups for ready-to-eat cereal products. Ready-to-eat cereal products would
hardly seem to t the single purchase assumption of current discrete choice models.
Neoclassical models su er from their grounding in representative agent formulations.
There also to date there have been few attempts made to investigate the nite sample
or asymptotic performance of di erent estimation procedures.28 Despite these open
issues, academicsandantitrustauthoritiescurrentlyareusingthesemodelstoperform
welfare calculations, and evaluate mergers and other antitrust issues.
## 8 Models with Private Information: Auctions
[Section not yet in this draft.]
## 9 Econometric Models of Entry, Exit and the
Number of Firms in a Market
IO economists have long been fascinated with measuring industrial concentration
(e.g., NBER 1955). This work has played critical roles in the development of US
trade policy, tax policy and, in particular, antitrust and merger policy. For example,
recent US antitrust and merger guidelines have partly assessed the competitiveness
of markets using market concentration measures.
Debates in the 1970s and 1980s about the usefulness of market concentration mea-
sures led IO economists to think more deeply about connections between competition
and market concentration. Two related theoretical literatures emerged from these
explorations. One literature addresses the question: \How many rms must be in a
market to have e ective competition?" The second asks: \What factors encourage or
deter rms to enter and exit markets?" Both literatures emphasize that in oligopoly
markets, the answers to these questions often hinge delicately on what one assumes
about rms' strategic interactions. Indeed, much of the recent theoretical literature
28Indeed, with panel data on products, where new products are being introduced and old ones
abandoned, it is unclear what would constitute a large sample argument for consistency or eÆciency.
See, however, Berry, Linton and Pakes (2002).
90in this area has tended to emphasize that it is strategic behavior, rather than rather
than technological or other factors, that has the greatest impact on market structure.
Unfortunately, very little empirical work exists that attempts to separate out the
importance of technological, demand and strategic factors for rms' incentives to
enter markets and compete. In large part this is because to do so, one requires a
much more complicated oligopoly model than those considered in Sections 5, 6 and
7. Only recently have empirical researchers begun to make progress in developing
structural econometric models that can speak to strategic models of entry and entry
deterrence. In this subsection we outline some of the econometric issues that arise in
modeling oligopolisticmarkets where strategic behavior may be a factor.29 The main
point of this section is to show that the potential for strategic behavior introduces
complex structural modeling issues. Several of these issues are generic, such as the
possible multiplicity of equilibrium market structure outcomes, and these issues have
only begun to be addressed by the literature.
Before exploring a speci c structural model of market concentration, it is useful to
have a broader sense of the economic issues that models of market concentration and
competition might address.
## 9.1 An Example
Since the deregulation of US passenger airlinemarkets in the late 1970s, travelers and
economists have speculated about whether suÆcient competition exists in di erent
city-pair markets.30 One does not have to look far to understand why. Even though
travelers often encounter wide disparities in fares (per seat miles) over time, across
routes and even for seats on the same ight, fares do not vary as much across com-
peting carriers. Industry critics contend that such patterns are obvious evidence of
ine ective competition. They also argue that the high concentration on some individ-
ual city-pair routes contributes to the problem. Some industry advocates argue the
opposite. They contend that fare matching is evidence of competition, and that fare
di erences at worst re ect normal price discrimination. Some also claim that high
concentration is evidence of economies of scale and route density, and that entry (or
the threat of entry) of small upstart carriers is enough to insure e ective competition.
These two views provide a challenge to IO economists, and there have been many
attempts to distinguish between them. To delve deeper, it is useful to imagine that
we have data (consistent with the US experience) indicating that short haul routes
between small cities tend to be highly concentrated and to have high (per seat mile)
29See also Berry and Reiss (2002).
30See for example Borenstein (1992), Brueckner (1992), Morrison (1996), Ott (1990), and Windle
(1993).
91fares. The technological and demand explanation for this correlation is that the costs
of service on these routes is high relative to demand. Thus, some routes will have so
little demand relative to costs, that at most one rm can pro tably serve the market.
This one rm would behave as a monopolist and charge high prices to recover its
costs. The anti-competitive explanation for the observed correlation is that high
concentration and fares are the result of strategic behavior. For example, even if the
small market could support many carriers, dominant carriers can convince potential
entrants that entry would be met with sti competition.
Can we distinguish between these explanations? Our answer is: given the current
state of the theory, econometric models and data, we can't generally. The main
reason is that much of what the theory points us toward is unobservable. We (the
researchers) do not observe the marginal and xed costs that are central to techno-
logical explanations. We also do not observe potential entrants' expectations about
incumbent behavior, which are central to strategic explanations. Does this mean we
cannot learn anything from a structural model of market structure? The answer to
this is no.
What we can imagine doing in principle is building structural models that would
examine how alternative competitive models t the data. For instance, we might
begin in the spirit of the models in Sections 5, 6 and 7 by writing down functional
forms for city-pair demand, and rms' xed and variable costs. This is not, however,
as easy as it sounds. Prior studies have documented that airlines' costs of service
depend in complex ways not only on route-speci c factors such as miles traveled,
airportfees, etc., but also on network and eet characteristics (e.g., whether the plane
will carry passengers beyond a city or transfer passengers at a hub and code-sharing
agreements). Nevertheless, we might attempt a parametric model of demand and
costs. At that point, unlike most of the models in Sections 5, 6 and 7, we would have
to grapple with the problem that the number of carriers in a market is endogenous:
it is a ected by demand and supply conditions. We therefore also have to model how
xed and marginal costs impact the number of rms in the market (and possibly the
identities of those rms).
Here, we encounter tricky speci cation issues. The theory says that to model the
number of rms we need to model why (and possibly which) rms did not enter. But
thisinvolvesmodelingpotentialentrants' expectationsaboutwhatwouldhappenpost
entry, somethingwe never observe. Moreover, because the samecarrierscompetewith
each other in other markets, we may have to model how actions in any one market
a ect outcomes in other markets.
At this point, it might seem that a complete structural model of airline competition
is hopeless. There is, however, something that we can learn with the right data.
The critical events that tell us something about competition and market structure
are instances of entry and exit. Consider, for example, our sample of small markets.
92In principle, we observe some city-pair markets in which there is no (direct) service,
others inwhich there is amonopoly, a duopoly, and so on. If (and this is an important
if) we can control for factors that might lead to cost of service and demand di erences
among markets, then we can ask how much demand does it take to support at least
one carrier. This level of demand tells us something about a single carrier's xed
and marginal costs relative to demand. We can then compare this level of demand to
what it takes to support a second rm in the market. This level of demand tells us
more about costs and potentially behavior. Suppose, for instance, we do not observe
a second carrier enter a city-pair market until demand is roughly twenty times what
it takes to support a single carrier. One's intuition is that if the second carrier has
the same costs and product as the rst, that this di erence must re ect pessimism
on the part of the second carrier as to value of entering a monopoly market.
It is this type of intuition that structural models of the number of rms, or entry and
exit, seek to make more precise. That is, the goalof a structural modelis to show how
changes in population and other exogenous market conditions a ect the (apparent)
ability of potential entrants to cover costs. The primary value of a formal model is
that it makes clear what economic and stochastic assumptions are necessary, given
the available data, to isolate di erences between rms' costs and the expectations
they may have about post-entry competition.
## 9.2 The Economic Model
Our airlineexample makes three points that are worth re-emphasizing. First, debates
about the competitiveness of markets often hinge on assumptions about what deter-
mines a market's structure (e.g., the number of rms). Second, some of the most
critical factors a ecting the ease of entry and exit are unobservable (e.g., rms' xed
and marginal costs, and expectations about post-entry competition). Third, while
we can potentially use structural models to draw inferences about the unobservables
present in IO theories, these models, like allstructural models, willcontain untestable
assumptions. These assumptions may be too numerous to be credible.
An important corollary to this third point is that the form of the data available will
have an important impact on what we can estimate. In our airline example, for
instance, it is important for us to have suÆcient data on a cross section of city-pair
markets where rms have similar costs and face similar demands. One also could
imagine as an alternative assembling time series data on the same market over time.
Such data would have the advantage of holding constant market-speci c conditions.
The use of time series data, however, raises new modeling issues. Now researchers
must worry about whether rms' decisions are linked through time. When they are,
it makes sense to model rms' decisions using dynamic games. While some progress
has been made in formulating and solving such games, to date their computational
93demands have largely made them impractical for empirical work. As a consequence,
almost all structural market structure models are static, and as such they tend to use
cross-section data on the number of rms in di erent, related markets. That is, most
market structure models explain the number of rms in a market rather than rm
turnover.
A typical static model follows the approach of the competition models discussed in
Sections 5, 6 and 7. The researcher builds a model of competition from primitive
demand, cost and behavioral assumptions. Unlike the models in prior sections, as-
sumptions about xed costs now play an important role in these models, as they
help determine which set of rms will produce, and therefore which set of marginal
conditions to analyze. Additionally, assumptions about the timing of rms' decisions
and the amount of information they possess become critical. These assumptions are
important because, unlike in previous models, they have a critical impact on whether
the empirical model has a pure-strategy equilibrium and whether any pure-strategy
equilibrium is unique. In what follows, we use a series of models advanced by Bresna-
han and Reiss (1991, 1991b) to highlight some of these issues and the strengths and
weaknesses of structural models.
Bresnahan and Reiss develop econometric models to explain the number of sellers in
several di erent localized product markets (such as dental services, new car dealers
and movie theaters). For each product, they model how the number of sellers in a
town varies with the town's population, and other demand and cost variables. The
goal of their work is to understand how technological, demand and strategic factors
a ect market structure and competition. Like the airlineexample, they propose to do
this by estimating how much demand it takes to support di erent numbers of rms.
Unlikethe airlineexample, however, the authorsonlyhave informationonthe number
of rms in each market; they do not have price or quantity information. Thus, absent
a structural model, the best they can do is summarize how the joint distribution
of entry and exit rates vary with industry characteristics. (See for example Dunne,
Roberts and Samuelson (1988).) In adopting a structural approach, Bresnahan and
Reiss' modeling is complicated by the fact that entry and exit are discrete events.
Thus, their structural models will not typically involve marginal conditions, such as
is done in the models discussed in Sections 5, 6 and 7. Instead, they must base their
inferences solely on threshold conditions for entrants' unobserved pro ts.
The threshold conditions that Bresnahan and Reiss use come from simple static,
perfect information entry games. An example of such a game is the standard two-
94rm, simultaneous-move entry game. This payo s to the players of the game are:
Stay Out (0) Enter (1)
Stay Out (0) 1(0;0) 2(0;0) 1(0;1) 2(0;1)
Enter (1) 1(1;0) 2(1;0) 1(1;1) 2(1;1)
where the k(i;j) represent the pro ts rm k earns when rm 1 plays i and rm
2 plays j (a zero denotes the action \Stay Out" and a one denotes \Enter"). In
most textbook examples, the numbers in the payo matrix are hypothetical. The
economist then adds assumptions about players' information and a solution concept.
Bresnahan and Reiss' structural models build on this strategic representation of an
entry game. Their econometric models postulate that the researcher observes the
players' equilibrium action(s) in each sample market (e.g., rm 1 enters and rm 2
stays out) but does not observe the rms' economic pro ts (the k(i;j)). The logicof
their models is to use a speci c equilibrium solution concept to work backward from
the observed equilibriumaction(s) to statements about unobserved pro ts. Thus, the
\structure" in their structural model are the economic and stochastic assumptions
that allow them to go from discrete data to statements about continuous-valued
pro ts. It should not be too surprising given our discussions in Sections 5, 6 and 7,
that Bresnahan and Reiss will have to introduce considerable structure in order to
draw inferences about rm pro ts and behavior from discrete outcomes.
## 9.3 Modeling Pro ts and Competition
To understand the process by which Bresnahan and Reiss work from rms' observed
actions back to statements about rms' unobserved pro ts, and to see what one can
hope to estimate, it is useful to work with a speci c entry model. To keep matters
simple, imaginethat we are modelingthe number of symmetric rms, n, that produce
a homogeneous good. The goal of the empirical analysis is to use the information in
the zero-one entry indicators a1;a2;:::;aN of the N  n potential entrants to draw
inferences about rms' pro t functions, i.e.,
k(a1;a2;:::;aN;Z;): (95)
Here Z represents exogenous observables a ectingdemand andcosts, and  represents
parameters of the pro t function (e.g., demand and cost function parameters) that
we wish to estimate. While the rms' pro t functions could in principle include
prices and quantities, Bresnahan and Reiss do not have this information. They thus
are forced to work with pro t functions where these endogenous variables have been
substituted out.
The rst step in the modeling process is to use assumptions about demand, costs and
95how rms compete to derive the functional form of equation (95). Here Bresnahan
and Reiss are helped by the presumption that if a potential entrant does not enter,
it likely will earn zero pro t { regardless of what the other potential entrants do.
If rm i does enter, its pro ts depend on the number of other rms that enter (as
summarized in the aj). The exact way in which the number of other rms a ects
pro ts depends on what one assumes about demand, costs and competition. If, for
example, rms have the same constant marginalcost c, have xed costs ofF, compete
as Cournot competitors, and market demand is p = bQ, then one can show
k(a1;a2;:::;aN;Z;) = b
S
PN
j=1 aj +1
!2
F (96)
where S = ( c)=b is a measure of the potential size of the market. For rm i to
have entered along with n 1 other rms it must be the case that i 0. Similarly,
if there is free entry, then it must be that the n + 1st entrant found it unpro table
to enter. These two bounds imply
S2
(n+1)2  F
b
 S2
(n+2)2:
These inequalities provide useful information. For instance, if we know or could
estimate the size of the market S and the slope of demand b, then we can place
a bound on rms' unobserved xed costs. While it is plausible to imagine having
external measures of the market's size S, it is much less likely one would have prior
informationaboutb. Onesolutionwouldbetouse priceandquantitydatatoestimate
b, yet this is exactly the problem that Bresnahan and Reiss have { they do not have
price and quantity information.
The question then is what can one infer about demand and cost conditions from
a cross section of markets? Bresnahan and Reiss' idea is to use information on the
number of rms invery smallto very large markets to estimate a sequence of so-called
entry thresholds. These thresholds are a simple transformation of the market sizes
S1;S2;::: above, where Si represents the size of the market just needed to support i
rms. While the entry threshold levels are of limited use, their ratios are revealing.
For example, if we take the ratio of the duopoly to the monopoly entry threshold
assuming rms are Cournot competitors we get
S2
2
S2
1
=
9
4
= 2:25 (97)
That is, we should observe a second rm entering at 2.25 the size of the market
required to support one rm. Similar calculations can be done for entry threshold
ratios involving higher numbers of identical rms.
96Ofcourse, we need notobserve the estimated(orobserved) duopoly-monopolythresh-
old ratio equal to 2.25 (or the higher-order ratios consistent with this symmetric
Cournot model). The question then is what should we infer? The answer is that
economic theory can provide some suggestions. We can consider, for example, what
happens when we change the assumption about how the duopolists compete. If the
second entrant expects the monopolistto collude with it after entry, then the duopoly
to monopoly ratio would equal 2.0. The three- rm to monopoly entry threshold ratio
would be 3.0, and so on. Alternatively, if the second rm expected perfect competi-
tion (or Bertrand competition) post entry, we would never observe the second rm
enter this natural monopoly. Thus, we can see that the degree of competition a ects
the entry threshold ratio. While we might be tempted to think the entry threshold
ratio then is indicative of the degree of competition, with larger ratios suggesting
more competition post entry, this is only true if we maintain our other assumptions.
If, for example, we had used a quadratic cost function with increasing marginal costs,
we also would see changes in the entry threshold ratios as minimum eÆcient scale
changes (see Bresnahan and Reiss (1991)).
This last point brings us back to a point we made in the introduction: inferences in
structural models typically depend heavily on maintained functional form assump-
tions. We often do not have the data to test these assumptions. In this application,
for example, the absence of price and quantity data considerably limit what we can
infer. Does this suggest that this structural model has little value because we have
to make untestable assumptions? Our answer is no. The model has value because
it makes clear what one can and cannot infer from the data. It also points future
research toward what it is that one need to observe to draw sharper inferences.
## 9.4 The Econometric Model
Our discussion so far has largely been based on an economic model with symmetric
rms. We have yet to introduce stochastic assumptions or discuss the more realis-
tic cases where there are observed and unobserved di erences among rms. These
additions introduce further complexities.
Recall that the data Bresnahan and Reiss have are the number of potential entrants
N, the number (and possibly the identities) of the actual entrants, and demand and
cost variables. Starting from primitive demand and cost function assumptions, they
build a model of rms' equilibrium pro ts, which consist of a variable pro t and a
xed cost term
 k(a;Z;) = VPi(a;Z;) Fi(a;Z;): (98)
Here, a is a vector describing the N potential entrants' entry actions, VP denotes
variable pro ts and F xed costs. Although this expression depends on observable
variables, the econometrician does not typically observe everything the rm does.
97Following the discrete choice literature popularized by McFadden, Heckman, and
others, we might simply add an error term, , to pro ts to account for what we
do not observe. Notice, however, that by assuming that the error is additive, we
have placed structure on what it is about pro ts that the econometrician does not
observe. Speci cally, whatever it is that the econometrician does not observe, it
enters the rms' optimal choices of prices and quantities in such a way that we obtain
an additive error in equation (98). What types of unobservables do and do not t
this speci cation? If we assume that the rms have unobserved di erences in their
constant marginal costs, then we will not obtain an additive error speci cation. On
the other hand, if we assume that rms have di erent xed costs, then we will. (This
is because the marginal conditions for prices or quantities do not depend on the
unobservable xed cost.) Thus, while it is possible to justify the unrestricted additive
structure in(98), it may make more economic sense to entertain alternative stochastic
speci cations for pro ts.
Assuming that the unobserved portion of pro ts is additive, we are now in a position
to write down expressions for the equilibrium threshold conditions on rm pro ts.
Following the discrete choice literature, we might consider modeling entry as the
event that the rm i's latent pro ts exceeds 0, or
VPi(a;Z;) ~ Fi(a;Z;) i(a) (99)
whereatilde(~ )aboveavariabledenotestheeconomicquantityuptoanadditivemean
zero error. This model looks like a standard threshold condition in a conventional
discrete choice model. The key di erence is that the threshold conditions in the entry
model contain the endogenous ai variables. In other words, unlike in the standard
discrete choice model, here agents' discrete decisions are interrelated. We therefore
have to model simultaneously the N potential entrants' threshold conditions. This is
the source of the additional complications.
There is some precedent in the discrete choice literature for threshold conditions that
include dummy endogenous variables (the ai). For example, the household labor sup-
ply literature sometimes descriptively models the dependence of a household head's
labor supply decision on their spouse's labor supply decision. Amemiya (1974) and
others have studied the econometric properties of latent variable models that include
dummy endogenous variables. Heckman (1978) introduced a systematic formulation
of linear dummy endogenous variable models and discussed a variety of econometric
issues associated with the formulation and estimation of such models. In particular,
he and others have noted that arbitrary speci cations of dummy endogenous variable
models can lead to \coherency" and identi cation problems.
Bresnahan and Reiss showed that one could use the economic structure of discrete
games to produce structural choice models with Heckman's econometric structure.
Moreover, the identi cation issues that arise in Heckman's models often have natural
98economic interpretations. To see some of the connections, let us return to the normal
form entry game above. Recall that the idea of Bresnahan and Reiss is to draw
inferences about the unobserved payo s from the observed equilibrium actions of
the entrants. To link the observed actions to the payo s, we employ an equilibrium
solution concept. An obvious one to employ in analyzing an entry game is that of a
Nash equilibrium. An outcome fa
1;a
2g of the entry game is a Nash equilibrium if
1(a
1;a
2)  1(a1;a
2)
and
2(a
1;a
2)  2(a
1;a2)
(100)
for any a1 and a2. To make clear the connection between the Nash equilibrium
outcomes and payo s, we can rewrite the two-by-two entry game as:
Stay Out (0) Enter (1)
Stay Out (0) 1(0;0) 2(0;0) 1(0;1) 2(0;0)+2
0
Enter (1) 1(0;0)+1
0 2(1;0) 1(0;1)+1
0 +1
1 2(1;0)+2
0 +2
1
where the  's represent the incremental pro ts to each rm of entry. From the
de nition of a Nash equilibrium and the above payo matrix we can deduce
a1 = 0 () 1
0 +a2 1
1 0
a2 = 0 () 2
0 +a1 2
1 0 (101)
These conditions link the observed actions to pro ts. Speci cally, they tell us that
all that the econometrician can infer from the observed equilibrium actions are state-
ments about the  terms. In the case of a Nash equilibrium, we see this means that
the econometrician cannot estimate 1(0;1) and 2(1;0), which are the pro ts the
rms earn when it is out of the market. This makes perfect sense, as we can only
learn about pro ts when a rm enters. To understand what we can estimate, it is
useful to analyze the 's. The i
0 term are the incremental pro ts that rm i earns
in a monopoly. We might naturally think of this incremental pro t as monopoly vari-
able pro ts minus xed costs, net of opportunity costs. The i
1 terms are the pro ts
that rm i gains (loses) relative to its incremental monopoly pro t when it enters its
competitor's monopoly market. This pro t is most naturally thought of as the loss
in variable pro t from moving from a monopoly to a duopoly.
From assumptions about the structure of demand and costs, we can relate the incre-
mental pro t terms to underlying demand and cost variables and parameters. For ex-
ample, inthe symmetric lineardemand and cost Cournot example, where i(0;0) = 0
we have
i
0 = ( c)2
4b F = g( ;c) F
i
1 = 5( c)2
36b = h( ;c)
(102)
99Knowing this relationship between the 's and the underlying economic parameters,
we can proceed to add error terms to the model to generate stochastic speci cations.
Assuming Fi = F +i gives the following latent variable system
ai =
(
1 if y
i = g( ;c) F +aj h( ;c) i 0
0 if y
i = g( ;c) F +aj h( ;c) i < 0 (103)
for i = 1;2 and i 6= j. This system bears a resemblance to Heckman's (1978) linear
dummy endogenous variable systems. For instance, if we ignore the demand and cost
parameters in g() and h(), assume i
1 is a constant, and i
0 = X i , where X is a
vector of observable variables and i is a vector of parameters, then we obtain the
linear dummy endogenous variable system
ai =

1 if y
i = X i +aj Æ i 0
0 if y
i = X i F +ajÆ i < 0 (104)
Amemiya, Heckman, Maddala and others have noted we cannot estimate the above
systems in general if the errors have unbounded support. The reason for this is that
the reduced form is not always well-de ned for all values of the errors. Bresnahan
and Reiss show that this econometric problem has a natural economic interpretation:
namely, it is indicative of two types of problems with the underlying game. First,
if the errors are unrestricted. the underlying game may have multiple pure strategy
equilibria. Second, the underlying game may have no pure strategy equilibria. These
existence and uniqueness problems cause havoc with pure strategy reduced forms.
One proposed solution to these problems is to assume that the model is recursive.
This econometric solution, however, has unattractive economic implications for an
entry game. Speci cally, it amounts to assuming that a competitor's entry into a
monopoly market does not a ect the monopolist's pro ts. Thus, while this assump-
tion is computationally attractive, it is economically and empirically unrealistic.
Bresnahan and Reiss go on to suggest how one can impose restrictions on pro ts
that remove existence problems. They also suggest a solution for the non-uniqueness
problem, which is to aggregate the non-unique outcomes (in this case the non-unique
outcomes occur when one rm or the other rm could be a pro table monopolist) to
obtain an economic model of the number of rms in the market, rather than a model
of which rms are in the market. Bresnahan and Reiss also explore how changing the
solution concept for the entry model changes the econometric structure of the game.
The main one they explore is how changing the game from simultaneous-move Nash
to sequential-move Stackleberg. In the latter case, the entry game generically has a
unique equilibrium. The econometric model of this equilibrium also has a threshold
interpretation, but it is more complicated than the simple linear structure above.
1009.5 Estimation
Turning now to estimation, Bresnahan and Reiss (1991) propose maximum likelihood
methods for estimating the parameters of pro ts. In their empirical work, they focus
on estimating models where the number of potential entrants is small. A key assump-
tion in their work is that they actually know the number of potential entrants, and
therefore the number of threshold conditions to impose. In much of their work, they
ignore systematic di erences in rms' pro ts and focus instead on modeling the num-
ber of rms that will enter each of a number of geographically distinct markets. In
particular, Bresnahan and Reiss assume that the demand for the products they look
at is proportional to a town's current and future population size, and that the per
capita demands for these products does not depend on population. This allows them
to express market demand as Q = D(Z;P)S, where S is the \size" of the market.
To simplify the analysis, Bresnahan and Reiss assume that sellers are the same, apart
from potential di erences in xed costs.
Using these assumptions, Bresnahan and Reiss derive expressions for equilibrium
monopoly and duopoly pro ts as a function of the size of the market S, other demand
variables and cost variables. A key observation is that the size of the market S enters
linearly into rm pro ts. Assuming there are only two possible entrants, rm 1 has
post-entry pro ts
i(1;a2) = (g(Z; )+a2 h(Z;Æ)) S F(a2)  (105)
From this relation, Bresnahan and Reiss identify entry thresholds for a monopolist
and a duopoly. That is, the entry thresholds equal
S(a2) =
F(a2) 
g(Z; )+a2 h(Z;Æ)
(106)
The entry thresholds are of interest because they tell us something about unobserved
xed costs relative to the variable pro t parameters. While in principle, Bresnahan
and Reiss should motivate the functions h(Z;Æ) and g(Z; ) from a speci c model of
demand and variable costs, in their empirical work they assume that these functions
are linear in the Z variables (or constants). Bresnahan and Reiss make these assump-
tions both to simplify estimation and because they cannot easily separate cost and
demand variables.
In most of their work, Bresnahan and Reiss focus on estimatingratios of entry thresh-
olds. In their model, the ratio of the monopoly to the duopoly entry threshold equals:
S(1)
S(0)
=
F(1)
F(0)
g(Z; )
g(Z; )+h(Z;Æ)
(107)
This expression shows that the ratio depends on the extent to which the second
101entrant has higher xed costs than if it were a monopolist and the extent to which
duopoly pro ts are less than monopoly pro ts (here h(Z;Æ) < 0). Bresnahan and
Reiss estimate the left hand side by rst estimating the parameters of the pro t
functions (98) and then forming the ratio (107). They then draw inferences about
competition based on maintained demand and cost assumptions, much as we have
discussed above. For example, they observe that entry threshold ratios in several
di erent product markets are not dramaticallydi erent from that impliedby a model
where rms act as Cournot competitors. Again, however, their inferences about
product market competition rest heavily on their assumptions about demand and
costs, and they onlyexplore a limitedset ofalternativedemand and cost assumptions.
## 9.6 Epilogue
A number of researchers have extended Bresnahan and Reiss' models and explored
alternatives. In many respects these models share a common feature: to draw eco-
nomic inferences from qualitative data on entry and exit, they have to impose consid-
erable economic structure and in many cases sacri ce realism to obtain empirically
tractable speci cations. So what does this say about IO economists' progress in de-
veloping structural models of oligopolistic market structure? The bad news is that
the underlying economics can make the empirical models extremely complex. The
good news is that the attempts so far have begun to de ne the issues that need to be
addressed. They also have clari ed why simple reduced form probit models and the
like are inadequate for modeling entry and exit decisions.
## 10 Ending Remarks
More than fty years ago, members of the Cowles Commission began a push to es-
timate empirical models that combined economic models with probability models.
They labeled this enterprise econometrics. In the intervening years, some economists
have come to think of econometrics as high-tech statistics applied to economic data.
That is, that econometrics as a eld mainly focuses on the development of statistical
techniques. While this may be true of some of econometrics, much of the Cowles
Commission's original vision is alive and well. In this chapter, we have tried to pro-
vide a sense of how structural modeling proceeds in industrial organization. We used
\structural modeling" as opposed to \econometric modeling" in our title to empha-
size that an application's setting and economics should motivate speci c probability
models and estimation strategies, and not the other way around.
We began by comparing descriptive and structural models. We should emphasize
once more that we see great value in both of these enterprises. IO economists, for
example, have learned much about the sources of competition from case studies of
102competition in speci c industries. Our introductory sections tried to provide a sense
of the bene ts and costs associated with developing and estimating descriptive and
structural models. An important bene t of a structural model is that it allows the
researcher to make clear how economics a ects the conditional distribution of the
data. For example, we can always regress market quantity on price, but this does not
necessarily mean we have estimated the parameters of a market demand function. To
know whether we have or have not, we need to be clear about supply and the sources
of error in the estimating equation.
While economic theory can help guide the speci cation and estimation of economic
quantities, there is no simple recipe for developing structural econometric models.
There are a variety of factors that make structural modeling diÆcult. First, eco-
nomic theories often are suÆciently complex that it is diÆcult to translate them into
estimable relations. In this case, structural modelers who opt to estimate simpler
models often are subject to the criticism that their models are too naive to inform
the theory. Second, structural modelers often lack data on all of the constructs or
quantities in an economic theory. The absence of relevant data can considerably
complicate estimation and limit what it is that the researcher can estimate with the
available data. Third, economic theory rarely delivers all that the structural modeler
needs to estimate a model. Much is left to the modeler's discretion. The structural
modeler, for example, typically must pick functional forms, decide how to measure
theoretical constructs, decide whether to include and how to include variables not
explicitly part of the theory, how to introduce errors into the model and decide on
the properties of errors. Each of these decisions involve judgments that cannot be
tested. Thus, these maintained assumptions need to be kept in mind when inter-
preting structural model estimates, parameter tests and performing counterfactual
calculations.
In our selective tour, we have tried to provide a sense of how IO researchers have
dealt with some of these issues. Our intent was not to be a comprehensive review of
all that has been done on a particular topic, but rather to provide a vision for some
of the general modeling issues IO researchers face in linking IO theories to data. We
hope that our Chapter has conveyed a sense of progress, and also a sense that much
remains for IO economists to explore.
103REFERENCES
Ackerberg, D. and M. Rysman (2000). \Unobserved Product Di erentiation in
Discrete Choice Models: Estimating Price Elasticities and Welfare E ects".
Boston University Department of Economics Working Paper.
Amemiya, T. (1974), \Multivariate Regression and Simultaneous Equation Models
When the Dependent Variables are Truncated Normal," Econometrica, 42, 999-
1012.
Applebaum, E. (1982), \Estimation of the Degree of Oligopoly Power," Journal of
Econometrics, 19, 287-299.
Bain, J. S. (1956), Barriers to New Competition, Their Character and Consequences
in Manufacturing Industries. Harvard University Press, Cambridge.
Baker, J. and Bresnahan, T. (1988), \Estimating the Demand Curve Facing a Single
Firm", International Journal of Industrial Organization, 6, 283-300.
Bajari, P. and L. Benkard. (2001a), \Discrete Choice Models as Structural Models
of Demand: Some Economic Implications of Common Approaches". Stanford
Graduate School of Business Working Paper.
Bajari, P. and L. Benkard. (2001b), \Demand Estimation with Heterogeneous Con-
sumers and Unobserved product Characteristics: A Hedonic Approach". Stan-
ford Graduate School of Business Working Paper.
Becker, G. (1962), \Irrational Behavior and Economic Theory," Journal of Political
Economy, 70, 1-13.
Berry, S. (1994), \Estimating Discrete-Choice Models of Product Di erentiation,"
RAND Journal of Economics, 25(2), 242-262.
Berry, S. (2001), \Estimating the Pure Hedonic Choice Model", Yale Department
of Economics Working Paper.
Berry, S., J. Levinsohn and A. Pakes (1995), \Automobile Prices in Market Equi-
librium," Econometrica, 63(4), 841-890.
Berry, S., J. Levinsohn and A. Pakes (1998), \Di erentiated Products Demand Sys-
tems from a Combination of Micro and Macro Data: The New Car Market,"
NBER Working Paper # 6481.
Berry, S., O. Linton and A. Pakes (2002), \Limit Theorems for Estimating the
Parameters of Di erentiated Products Demand Systems". Yale Department of
Economics Working Paper.
104Berry, S., P. Reiss (2002), \Empirical Models of Entry and Exit". In process.
Blackorby, C., D. Primont and R. Russell (1978), Duality, Separability and Func-
tional Structure. North Holland, Amsterdam.
Borenstein, S. (1992), \The Evolution of U.S. Airline Competition," Journal of Eco-
nomic Perspectives.
Bresnahan, T. (1981), \Departures from Marginal-Cost Pricing in the American
Automobile Industry," Journal of Econometrics, 17, 201-227.
Bresnahan, T. (1982), \The Oligopoly Solution Concept is Identi ed," Economics
Letters, 10, 87-92.
Bresnahan, T. (1987), \Competition and Collusion in the American Automobile
Market: The 1955 Price War," Journal of Industrial Economics, 45(4, June)
(special issue), 457-482.
Bresnahan, T. (1996), \Comment", in T. Bresnahan and R. Gordon, The Economics
of New Goods. NBERStudiesinIncomeandWealthVolume58. TheUniversity
of Chicago Press, Chicago.
Bresnahan, T. (1997), \The Apple-Cinnamon Cheerios War: Valuing New Goods,
Identifying Market Power, and Economic Measurement." Stanford University
mimeograph.
Bresnahan, T. (1989), \Empirical Studies of Industries with Market Power", R.
Schmalensee and R. Willig, eds., The Handbook of Industrial Organization,
North Holland, Amsterdam.
Bresnahan, T. and P.C. Reiss (1985), \Manufacturer and Dealer Margins," Rand
Journal of Economics, , 309-323.
Bresnahan, T. and P.C. Reiss (1991), \Entry and Competition in Concentrated
Markets," Journal of Political Economy, 99(5), 977-1009.
Bresnahan, T. and P.C. Reiss (1991b), \EmpiricalModels of Discrete Games," Jour-
nal of Econometrics, 48, 57-81.
Brown, A. and A. Deaton (1972), \Models of Consumer Behavior: A Survey," Eco-
nomic Journal, 82, 1145-1236.
Brueckner, J.K. (1992), \Fare Determination in Hub and Spoke Networks," Rand
Journal of Economics, 23 #3, 309-323.
Burns, A.F. and W.C. Mitchell (1946), Measuring Business Cycles, NBER, New
York.
105Camerer, Colin (1995), \Individual Decision Making," Chapter 8 in J. Kagel and A.
Roth, eds., The Handbook of Experimental Economics, Princeton University
Press, Princeton.
Caves, R., Whinston, M., Hurwitz, M. (1991), \Patent Expiration, Entry, and Com-
petition in the U.S. Pharmaceutical Industry," Brookings Papers on Economic
Activity: Microeconomics, 1-48.
Comanor, W.S. and Wilson, T.A. (1967), \Advertising, Market Structure and Per-
formance," Review of Economics and Statistics, 49, 423-40.
Corts, K. (1999), "Conduct Parameters and the Measurement of Market Power,
Journal of Econometrics, 88 (2), 227-250.
Davis, P. (2000), \Demand Models for Market-Level Data", MIT Sloan Working
Paper.
Deaton,A.andJ.Muelbauer(1980),Economic and Consumer Behavior, Cambridge:
Cambridge University Press.
Demsetz,H.(1973),\IndustryStructure, MarketRivalryandPublicPolicy,"Journal
of Law and Economics, 16, 1-9.
Dixit, A. and J. Stiglitz, (1977), \Monopolistic Competition and Optimum Product
Diversity", American Economic Review, 67, 297-308.
Dunne, Roberts & Samuelson (1988), \Patterns of Firm Entry and Exit in U. S.
Manufacturing Industries," RAND Journal of Economics, 19(4, Winter), 495-
515.
Engel, E. (1857), \Die Productions-und Consumptionsverhltnisse des Knigreichs
Schsen," in Zeitschrift des Statischen Bureaus des Kniglich S chsischen Minis-
terium des Inneren, Nos. 8 and 9.
Goldberg, Penny K., (1995), \Product Di erentiation & Oligopoly in International
Markets: The Case of the U.S. Automobile Industry," Econometrica, 63(4),
891-952.
Goldberger, Art (1991), A Course in Econometrics, Harvard University Press, Cam-
bridge, MA.
Gollop,F.andRoberts,M.(1979),\FirmInterdependence inOligopolisticMarkets,"
Journal of Econometrics, 10, pp. 313-331.
Gorman, W. (1959), \Separable Utility and Aggregation", Econometrica, 27, 469-
481.
106Gorman, W. (1970), \Two-Stage Budgeting", in C. Blackorby and A. Shorrocks,
eds., Separability and Aggregation. Collected Works of W.M. Gorman. Volume
I. Clarendon Press, Oxford.
Green, J. and R. Porter (1984), \Noncooperative Collusion Under Imperfect Price
Information," Econometrica, 52, 87-100.
Griliches, Z. (1957), \Hybrid Corn: An Exploration into the Economics of Technical
Change," Econometrica, 25, 331-346.
Griliches, Z. (1986), \Economic Data Issues," Chapter 25 in Z. Griliches and M.D.
Intriligatoreds., HandbookofEconometrics,Vol3.,NorthHolland,Amsterdam.
Haile, P. (2001), \Auctions with Resale Markets: An Application to U.S. Forest
Service Timber Sales," American Economic Review, 91, 399-427.
Haavelmo, T. (1944), \The Probability Approach in Economics," Econometrica, iii-
vi, and 1-115.
Hanemann,W.(1984),\Discrete/ContinuousModelsofConsumerDemand",Econo-
metrica, 52, 541-561.
Hausman, J., (1996), \Valuationof New Goodsunder Perfect and Imperfect Compe-
tition," in T. Bresnahan and R. Gordon, The Economics of New Goods. NBER
Studies in Income and Wealth Volume 58. The University of Chicago Press,
Chicago.
Hausman, J., G. Leonard, and D. Zona. (1994), \Competitive Analysis with Di er-
entiated Products", Annales dEconometrie et de Statistique, 34, 159-180.
Heckman, J. (1978), \Dummy Endogenous Variables in a Simultaneous Equation
System," Econometrica, 46, 931-959.
Hendricks & Porter (1988), \An Empirical Study of an Auction with Asymmetric
Information," American Economic Review, 78(5, December), 865-883.
Hood, W.C. and T.C. Koopmans (1953), Studies in Econometric Method, Cowles
Commission Monograph No. 14, John Wiley & Sons, New York.
La ont, Ossard, and Vuong, (1995), \Econometrics of First-Price Auctions," Econo-
metrica, 63(4), 953- 980.
Lau, L. (1982), \On Identifying the Degree of Industry Competitiveness From In-
dustry Price and Output Data," Economics Letters, 10, 93-99.
Lerner, A. (1934), \The Concept of Monopoly and the Measurement of Monopoly
Power," Review of Economic Studies, 11, 157-175.
107Lindh, T. (1992), \The Inconsistency of Consistent Conjectures," Journal of Eco-
nomic Behavior and Organization, 18, 69-90.
Markham, J.W. (1952), Competition in the Rayon Industry, Harvard University
Press, Cambridge.
Martin, Stephen (1993), Advanced Industrial Economics, Blackwell, Oxford.
Mitchell, W.C. (1926), Business Cycles: The Problem and Its Setting, NBER, New
York.
Morrison, S.A. (1996), \Causes and Consequences of Airline Fare Wars," Brookings
Papers on Economic Activity: Microeconomics, 85-124.
National Bureau of Economic Research, Business Concentration and Price Policy,
Princeton University Press, Princeton, NJ.
Nevo, A. (1997), \Mergers with Di erentiated Products: The Case of Ready-to-Eat
Cereal Industry", Rand Journal of Economics, 31, 395-421.
Ott,J.(1990),\JusticeDept. InvestigatesCarriers'PricingPolicies,"AviationWeek
and Space Technology, 133 #3, 18-20.
Paarsch, H. (1992) \Deciding Between the Common and Private Values Paradigms
in Empirical Models of Auctions," Journal of Econometrics, 51(1/2), 191-216.
Paarsch, H. (1997), \Deriving an Estimate of the Optimal Reserve Price: An Appli-
cationtoBritishColumbiaTimberSales,"JournalofEconometrics,78, 333-357.
Pinske, J., M. Slade and C. Brett (2000), "Spatial Price Competition," University
of British Columbia Department of Economics Working Paper; forthcoming in
Econometrica.
Pinske, J., and M. Slade (2001), "Mergers, Brand Competition, and the Price of
a Pint", University of British Columbia Department of Economics Working
Paper.
Polak, R.A., and Wales, T.J. (1992), Demand System Speci cation and Estimation,
Oxford University Press, New York.
Porter, R.. (1983), \A Study of Cartel Stability: The Joint Executive Committee,
1880-1886," Bell Journal of Economics, 14(2, Autumn), 301-314.
Reiss, P.C. and P. Spiller (1989), \Competition & Entry in Small Airline Markets,"
Journal of Law & Economics, 32(2, October, part 2), S179-S202.
Riordan, M. (1985), \Imperfect Information and Dynamic Conjectural Variations,"
Rand Journal of Economics, 16, 41-50.
108Rosse, J. (1970), Estimating Cost Function Parameters Without Using Cost Data:
Illustrated Methodology," Econometrica, 38, 256-275.
Silverman, B.W., Density Estimation for Statistics and Data Analysis, Chapman
and Hall, London.
Sims, C. A. (1980), "Macroeconomics and Reality," Econometrica, 48, 1-47.
Spiller, P. and Favaro, E. (1984), \The E ects of Entry Regulation on Oligopolistic
Interaction: The Uruguayan Banking Sector," Rand Journal of Economics, 15,
244-254.
Stigler, G. (1964), \A Theory of Oligopoly",Journalof PoliticalEconomy, 93, 44-61.
Trajtenberg, M. (1989), \The Welfare Analysis of Product Innovations, with an
Application to CAT Scanners," Journal of Political Economy, 97(2), 444-479.
Ulen, T.S. (1978) Cartels and Regulation. Unpublished Ph.D. dissertation, Stanford
University.
Waterson, M. (1984) Economic Theory of the Industry, Cambridge University Press:
Cambridge.
Windle, R. (1993), \Competition at `Duopoly' Airline Hubs in the U.S.," Trans-
portation Journal, 33 #2, 22-30.
Wolak,F.(1994),\AnEconometricAnalysisoftheAsymmetricInformationRegulator-
Utility Interaction, Annales D'Economie et de Statistique, 34, 12-69.
Wolak, F. (1997), "The Welfare Impacts of Competitive Telecommunications Sup-
ply: A Household-Level Analysis,\ Brookings Papers on Economic Activity:
Microeconomics,269-340.
109