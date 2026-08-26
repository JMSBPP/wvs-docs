---
sha256: 125d4ef5f1ceb853bb78d14486eaae18dedc6056d4cc31293558401a1fd4c103
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 101111
---
A Demand System Approach to Asset Pricing
Ralph S. J. Koijen
University of Chicago, National Bureau of Economic Research,
and Center for Economic and Policy Research
Motohiro Yogo
Princeton University and National Bureau of Economic Research
We develop an asset pricing model with flexible heterogeneity in asset
demand across investors, designed to match institutional and house-
hold holdings. A portfolio choice model implies characteristics-based
demand when returns have a factor structure and expected returns
and factor loadings depend on the assets’ own characteristics. We pro-
pose an instrumental variables estimator for the characteristics-based
demandsystemtoaddress theendogeneityofdemandandassetprices.
Using US stock market data, we illustrate how the model could be used
to understand the role of institutions in asset market movements, vol-
atility, and predictability.
I. Introduction
Modernassetpricingmodelsarebuiltonassetdemand,derivedfromop-
timal portfolio choice and market clearing. However, the common prac-
tice is to ignore institutional or household holdings data in estimating
these models, even though these data are direct observations of asset de-
Electronically published June 19, 2019
[Journal of Political Economy, 2019, vol. 127, no. 4]
© 2019 by The University of Chicago. All rights reserved. 0022-3808/2019/12704-0012$10.00
An earlier version was titled “An Equilibrium Model of Institutional Demand and Asset
Prices.” Koijen acknowledges financial support from the European Research Council
(grant 338082) and the Center for Research in Security Prices at the University of Chicago
BoothSchoolofBusiness.Forcommentsanddiscussions,wethankMarianneAndries,Mal-
colm Baker, Markus Brunnermeier, John Campbell, Joost Driessen, Stefano Giglio, Valen-
000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).mand. The predominant methodology for estimating asset pricing mod-
els,based on simplifying assumptions, uses portfolio returns alone or the
joint moments of returns and aggregate or individual consumption. Al-
though institutional holdings data have been used in the empirical asset
pricing literature, an equilibrium model that simultaneously matches as-
set demand and imposes market clearing does not exist.
Wedevelopanassetpricingmodelfromtheoptimalportfoliochoiceof
investors that have heterogeneous beliefs and face short-sale constraints.
The investor’s first-order condition is a constrained Euler equation that
relates the intertemporal marginal rate of substitution to asset returns
(Lucas 1978). An approximate solution to the portfolio choice problem
isthemean-varianceportfolio(Markowitz1952),wheretheoptimalport-
folio varies across investors because of heterogeneous beliefs. Following
theempiricalassetpricingliterature(e.g.,FamaandFrench1993),weas-
sume that returns have a factor structure and that expected returns and
factor loadings depend on the assets’ own characteristics. Under this as-
sumption, the optimal portfolio simplifies to a characteristics-based de-
mandfunctionthatdependsonobservedcharacteristics(e.g.,marketeq-
uity, book equity, profitability, investment, dividends, and market beta)
and latent demand (i.e., characteristics unobserved by the econometri-
cian). We estimate the optimal portfolio on stock market data to show the
empiricalrelevanceoftheassumptionsunder whichtheoptimalportfolio
simplifies tocharacteristics-based demand.
Characteristics-based demand allows for flexible heterogeneity in as-
set demand across investors and matches institutional and household
holdings, including zero holdings and index strategies. We allow the co-
efficients on characteristics to vary across investors so that the aggregate
tin Haddad, Ali Hortaçsu, Michael Johannes, Dong Lou, Tobias Moskowitz, Anna Pavlova,
Hélène Rey, Andrea Vedolin, Pierre-Olivier Weill, and four referees. We thank Joseph
Abadi and Mu Zhang for research assistance on some proofs. We also thank seminar par-
ticipants at Bank of Canada, Bank of England, Banque de France, Baruch College, Bocconi
University, Boston University, Duke University, Federal Reserve Banks of Minneapolis and
New York, Harvard University, HEC Paris, Hitotsubashi University, Imperial College Lon-
don, London Business School, London Quant Group, London School of Economics, Mas-
sachusettsInstituteofTechnology,OxfordUniversity,PennsylvaniaStateUniversity,Prince-
ton University, Stanford University, Texas A&M University, Toulouse School of Economics,
University of California Los Angeles, University College London, University of Chicago,
University of Michigan, University of Minnesota, University ofNorth Carolina, University of
Notre Dame, University of Texas at Austin, Yale University, 2015 Banque de France–Toulouse
School of Economics Conference on Monetary Economics and Finance, 2015 Four Nations
Conference, 2015 Annual Conference of Paul Woolley Centre, 2015 European Financial
Management Association annual meeting, 2015 Annual Society for Financial Econometrics
Conference, 2015 NBER Summer Institute Forecasting and Empirical Methods in Macro
and Finance, 2015 Brazilian Finance Meeting, 2015 European Finance Association annual
meeting, 2015 New York University Stern Five-Star Conference, 2015 NBER Market Micro-
structure Meeting, 2016 NBER New Developments in Long-Term Asset Management Con-
ference, and 2017 American Finance Association annual meeting. Data are provided as sup-
plementary material online.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).demand elasticity varies across assets that are held by different sets of
investors. Characteristics-based demand allows for more flexible cross-
elasticities across assets than traditional models based on simplifying as-
sumptions that imply homogeneous asset demand across investors (To-
bin 1958). In that sense, our approach is related to an older literature on
macroeconomic models of asset demand (Brainard and Tobin 1968; To-
bin 1969) and differentiated product demand systems (Lancaster 1966;
Rosen 1974), but a contribution is to derive asset demand from optimal
portfolio choice in the tradition of modern asset pricing theory. We show
that the equilibrium pricevector isuniquely determined by market clear-
ingacross institutions and households, undera simple conditionthat de-
mand is downward sloping for all investors.
We illustrate demand system asset pricing using US stock market and
institutional holdings data, based on Securities and Exchange Commis-
sion Form 13F. The 13F data contain quarterly stock holdings of institu-
tionsthatmanagemorethan$100millionsince1980.Thetypesof13Fin-
stitutionsarebanks,insurancecompanies,investmentadvisors(including
hedge funds), mutual funds, pension funds, and other 13F institutions
(i.e., endowments, foundations, and nonfinancial corporations). These
institutions collectively manage 68 percent of the US stock market, with
the remaining 32 percent attributed to direct household holdings and
non-13F institutions.
To identify the characteristics-based demand system, we start with the
traditional assumption in asset pricing that shares outstanding and char-
acteristics other than price are exogenous, determined by an exogenous
endowment process. To relax the traditional assumption that investors
are atomistic and that demand shocks are uncorrelated across investors,
we propose an instrumental variables estimator to address the endogene-
ity of latent demand and asset prices. Our identifying strategy is moti-
vatedbyanobservationthatinstitutionsholdasmallsetofstocksandthat
the set of stocks that they have held in the recent past (e.g., over the past
3 years) hardly changes over time. This observation is consistent with the
fact that many institutions are subject to an investment mandate (i.e., a
predetermined rule exogenous to current demand shocks) that limits
their investment universe (i.e., the set of stocks that they are allowed to
hold). An asset that is included in the investment universe of more inves-
tors, especially if those investors are large, has a larger exogenous com-
ponent of demand. With downward-sloping demand, a larger exogenous
component of demand generates higher prices that are unrelated to la-
tent demand. A potential threat to identification is that we cannot mea-
suretheinvestmentuniverseperfectly,butfutureresearchcouldimprove
on our framework through new data or methodology that leads to better
measurement of the investment universe. For example, the secular trend
fromactivetopassiveassetmanagement,especiallythegrowthofexchange-
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).traded funds,could simplifythemeasurementoftheinvestment universe
for a large share of institutions in thefuture.
After estimating the characteristics-based demand system, we illustrate
theempiricalrelevanceofourapproachthroughfourassetpricingappli-
cations. First, we estimate the price impact of demand shocks for all insti-
tutionsandstocks,whicharisesfromimperfectlyelasticaggregatedemand.
We find that the price impact for the average institution has decreased
from1980to2017,especiallyfortheleastliquidstocksatthe90thpercen-
tile of the distribution. This means that the cross-sectional distribution of
price impact has significantly compressed over this period. For example,
the price impact for the average investment advisor with a 10 percent de-
mand shock on the least liquid stocks has decreased from 0.64 percent in
1980 to 0.22 percent in 2017.
Second, we use demand system asset pricing to decompose the cross-
sectional variance of stock returns into supply- and demand-side effects.
Thesupply-sideeffectsarechangesinsharesoutstanding,changesinchar-
acteristics,and the dividendyield. These threeeffects together explain only
12percentofthecross-sectionalvarianceofstockreturns.Thedemand-side
effects are changes in assets under management, the coefficientsonchar-
acteristics,andlatentdemand.Ofthesethreeeffects,changesinlatentde-
mandarethemostimportant,explaining81percentofthecross-sectional
variance of stock returns. Thus, stock returns are mostly explained by de-
mand shocks that are unrelated to changes in observed characteristics
(i.e., “excess volatility” according to Shiller [1981]). These moments es-
tablishanewsetoftargetsforagrowingliteratureonassetpricing models
with institutional investors, just as the variance decomposition of Camp-
bell (1991) has beena useful guide for consumption-based asset pricing.1
Third, we use a similar variance decomposition to examine whether
larger institutions explain a disproportionate share of the stock market
volatility in 2008. We find that the 30 largest institutions, which man-
age about a third of the stock market, explain only 4 percent of the
cross-sectional variance of stock returns. Smaller institutions, which also
manageaboutathirdofthestockmarket,explain41percentofthecross-
sectional variance of stock returns. Direct household holdings and non-
13F institutions, which account for the remaining third of the stock mar-
ket, explain 47 percent of the cross-sectional variance of stock returns.
The largest institutions explain a relatively small share of stock market
volatility because they tend to be diversified buy-and-hold investors that
hold more liquid stocks with a smaller price impact.
Fourth, we use demand system asset pricing to predict cross-sectional
variation in stock returns. The model implies mean reversion in stock
1
See Dasgupta, Prat, and Verardo (2011), Basak and Pavlova (2013), He and Krishna-
murthy (2013), Vayanos and Woolley (2013), and Vayanos (2016).
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).prices if latent demand is mean reverting. Under the assumption that la-
tent demand reverts to its unconditional mean in the long run, we esti-
mate a long-run expected return for each stock. We then test whether
our estimate of the long-run expected return predicts the cross section
of stock returns through a Fama-MacBeth (1973) regression of monthly
excess returns onto lagged characteristics, including all characteristics in
the Fama-French (2015) five-factor model and momentum. We find that
our estimate of the long-run expected return uncovers a new source of
predictability from mean reversion in latent demand. Expected monthly
returns increase by 0.18 percent per one standard deviation in the long-
run expected return with a t-statistic of 4.80.
The remainder of the paper is organized as follows. Section II derives
characteristics-based demand from optimal portfolio choice. Section III de-
scribesthestockmarketandinstitutionalholdingsdata.SectionIVexplains
our identifying assumptions and presents estimates of the characteristics-
baseddemandsystem.SectionVpresentstheempiricalfindingsontherole
of institutions in stock market movements, volatility, and predictability. Sec-
tion VI discusses several extensions and open issues for future research.
Section VII presents conclusions.
II. Asset Pricing Model
We develop an asset pricing model from the optimal portfolio choice of
investors that have heterogeneous beliefs and face short-sale constraints.
The optimal portfolio varies across investors because of heterogeneous
beliefs, and the portfolio weights are nonnegative because of short-sale
constraints. Following the empirical asset pricing literature, we assume
that returns have a factor structure and that expected returns and factor
loadings depend on the assets’ own characteristics. Under this assump-
tion, we derive the main result that the optimal portfolio simplifies to
characteristics-based demand, in which the portfolio weights depend on
theassets’ own characteristics.
A. Financial Assets
There are N financial assets indexed by n 5 1, …,N. Let St(n) be the
number of shares outstanding of asset n at date t. Let Pt(n) and Dt(n) be
the price and dividend per share for asset n at date t. Then MEtðnÞ 5
PtðnÞStðnÞ is market equity at date t, and RtðnÞ 5 ½PtðnÞ 1 DtðnÞ=Pt21ðnÞ
is the gross return from date t 2 1 to t. Let lowercase letters denote
the logarithm of the corresponding uppercase variables. That is, stðnÞ 5
logðStðnÞÞ, ptðnÞ 5 logðPtðnÞÞ, metðnÞ 5 logðMEtðnÞÞ, and rtðnÞ 5
logðRtðnÞÞ.WedenotetheN-dimensionalvectorscorrespondingtothese
variables in bold as st 5 logðStÞ, pt 5 logðPtÞ, and rt 5 logðRtÞ. We de-
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).noteavectorofonesas1,avectorofzerosas0,anidentitymatrixasI,and
a diagonal matrix as diag(⋅) (e.g., diagð1Þ 5 I).
In addition to price and shares outstanding, the assets are differenti-
ated along K characteristics. In the case of stocks, for example, these
characteristics could include various measures of fundamentals such as
dividends, book equity, profitability, and investment. We denote charac-
teristic k of asset n at date t as xk,t(n). We stack these characteristics in an
N  K matrix as xt, whose nth row is xt(n)0
and (n, k)th element is xk,t(n).
Tosimplify notation, we follow the convention that the Kthcharacteristic
is a constant (i.e., xK,tðnÞ 5 1). Following the literature on asset pricing
in endowment economies (Lucas 1978), we assume that shares outstand-
ing, dividends, and other characteristics are exogenous. That is, only as-
set prices are endogenously determined in the model. Shares outstand-
ing and characteristics could be endogenized in a production economy,
as we discuss in Section VI.
B. Optimal Portfolio Choice
The financial assets are held by I investors, indexed by i 5 1, …,I. Each
investor allocates wealth Ai,t at date t across assets in its investment uni-
verse Ni,t ⊆f1, …,Ng and an outside asset. The investment universe is
a subset of assets that the investor is allowed to hold, which in practice
is determined by an investment mandate. For example, the investment
universe of an index fund is the set of assets that compose the index. We
denote the number of assets in the investment universe as jNi,tj. The out-
side asset represents all wealth outside the N assets that are the subject
of our study.
Let wi,t be an jNi,tj-dimensional vector of portfolio weights that investor
i chooses at date t.2
The investor chooses the portfolio weights at each
date to maximize expected log utility over terminal wealth at date T:
max
wi,t
Ei,t½logðAi,T Þ,
where Ei,t denotes investor i’s expectation at date t.3
The intertemporal
budget constraint is
Ai,t11 5 Ai,tðRt11ð0Þ 1 w0
i,tðRt11 2 Rt11ð0Þ1ÞÞ, (1)
where Rt11ð0Þ is the gross return on the outside asset. The investor also
faces short-sale constraints:
2
Our notation presupposes that positions in redundant assets (with collinear payoffs)
have been eliminated through aggregation so that the covariance matrix of log excess re-
turns is invertible.
3
We assume log utility for expositional purposes because the multiperiod portfolio
choice problem reduces to a one-period problem in which hedging demand is absent
(Samuelson 1969).
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).wi,t ≥ 0, (2)
10
wi,t < 1: (3)
The Lagrangian for the portfolio choice problem is
Li,t 5 Ei,t logðAi,T Þ 1 o
T21
s5t
½L0
i,swi,s 1 li,sð1 2 10
wi,sÞ
 
, (4)
where Li,t ≥ 0 and li,t ≥ 0 are the Lagrange multipliers on the short-sale
constraints (2)and(3) at date t. We denote the conditional mean andco-
variance of log excess returns, relative to the outside asset, as
mi,t 5 Ei,t½rt11 2 rt11ð0Þ1 1
j2
i,t
2
,
Σi,t 5 Ei,t½ðrt11 2 rt11ð0Þ1 2 Ei,t½rt11 2 rt11ð0Þ1Þðrt11 2 rt11ð0Þ1Þ0
,
where j2
i,t is a vector of the diagonal elements of Σi,t. Without loss of gen-
erality, we group the assets into those for which the short-sale constraint
is not binding versus binding as
wi,t 5
w
ð1Þ
i,t
0
2
4
3
5,
mi,t 5
mð1Þ
i,t
m
ð2Þ
i,t
2
4
3
5,
Σi,t 5
Σ
ð1,1Þ
i,t Σ
ð1,2Þ
i,t
Σ
ð2,1Þ
i,t Σ
ð2,2Þ
i,t
2
4
3
5:
(5)
Lemma 1, proved in online appendix A, describes the solution to the
portfolio choice problem.
Lemma 1. The first-order condition for the portfolio choice problem
is the constrained Euler equation:
Ei,t
Ai,t11
Ai,t
 21
Rt11
 
5 1 2 ðI 2 1w0
i,tÞðLi,t 2 li,t1Þ: (6)
An approximate solution to the portfolio choice problem is
wð1Þ
i,t ≈ Σð1,1Þ21
i,t mð1Þ
i,t 2 li,t1
 
, (7)
where li,t is given by equation (A5) in appendix A.4
4
Equation(7)isbasedonanapproximationofexpectedlogutilityaroundmean-variance
utility.Therefore,wecouldjustifyeq.(7)asanexactsolutionifwestartedwithmean-variance
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).Lemma 1 summarizes the known relation between Euler equations in
assetpricing (6)andoptimalportfolio choice(7).Theright sideofequa-
tion (6) simplifies to 1 when the investor is unconstrained (i.e., Li,t 5 0
and li,t 5 0). Under this frictionless benchmark, we impose rational ex-
pectations to obtain
Et
Ai,t11
Ai,t
 21
Rt11
 
5 1:
The literature on consumption-based asset pricing tests this moment
condition on both aggregate and household consumption data (Mankiw
andZeldes1991;Brav,Constantinides,andGeczy2002;Vissing-Jørgensen
2002). Thistest does not require household holdings data under the null
that investors are unconstrained and have rational expectations.
C. Characteristics-Based Demand
Motivatedbytheintertemporalcapitalassetpricingmodel(Merton1973)
and arbitrage pricing theory (Ross 1976), a large literature has searched
for a low-dimensional factor structure in returns. A notable contribution
to this literature is the three-factor model of Fama and French (1993), in
which the factors are excess market returns, small minus big portfolio re-
turns, and high minus low book-to-market portfolio returns. The three-
factor model suggests that expected returns and factor loadings are well
captured by three characteristics: market beta, market equity (i.e., a
measure of size), and book-to-market equity (i.e., a measure of value).
A more recent five-factor model of Fama and French (2015) augments
this model with two additional factors, which are robust minus weak
profitability portfolio returns and conservative minus aggressive invest-
ment portfolio returns. Thus, profitability and investment are two addi-
tional characteristics that are relevant for expected returns and factor
loadings. We let xt(n) denote a vector of observed characteristics of asset
n at date t, which includes log book equity, profitability, investment, and
market beta.
Under heterogeneous beliefs, different investors could form different
expectations about returns based on the same observed characteristics.
Furthermore, investor i could form expectations about returns based on
characteristics of asset n at date t that are unobserved by the econome-
trician, which we denote as log(ei,t(n)). We stack investor i’s information
set for asset n at date t as
utility, following a long tradition in portfolio choice (Markowitz 1952). Another common
justification is that eq. (7) is an exact solution in the continuous-time limit (Campbell and
Viceira 2002, 28–29).
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).^ xi,tðnÞ 5
metðnÞ
xtðnÞ
logðei,tðnÞÞ
2
6
6
4
3
7
7
5,
which consists of log market equity, other observed characteristics, and
unobserved characteristics. We then form an Mth-order polynomial of
these characteristics through a oM
m51ðK 1 2Þm
–dimensional vector:
yi,tðnÞ 5
b xi,tðnÞ
vecðb xi,tðnÞb xi,tðnÞ0
Þ
⋮
2
6
6
4
3
7
7
5:
Motivatedbyourpreviousdiscussionoftheempiricalassetpricingliter-
ature,weassumethatreturnshaveaone-factorstructureandthatexpected
returns andfactor loadings depend on the assets’ own characteristics.5
Assumption 1. The covariance matrix of log excess returns is Σi,t 5
Gi,tG0
i,t 1 gi,tI, where Гi,t is a vector of factor loadings and gi,t > 0 is idiosyn-
cratic variance. Expected excess returns and factor loadings are polyno-
mial functions of characteristics:
mi,tðnÞ 5 yi,tðnÞ0
Fi,t 1 fi,t,
Gi,tðnÞ 5 yi,tðnÞ0
Wi,t 1 wi,t,
where Fi,t and Wi,t are vectors and fi,t and wi,t are scalars that are constant
across assets.
The key content of assumption 1 is that an asset’s own characteristics
are sufficient for its factor loadings, which also implies that they are suf-
ficient for the variance of the optimal portfolio. The following proposi-
tion, proved in appendix A, shows that the optimal portfolio simplifies to
a polynomial function of characteristics under assumption 1.
Proposition 1. Under assumption 1, the optimal portfolio weight
(7) on each asset n for which the short-sale constraint is not binding is
wi,tðnÞ 5 yi,tðnÞ0
Pi,t 1 pi,t, (8)
where
Pi,t 5
1
gi,t
Fi,t 2 Wi,tki,t ð Þ,
pi,t 5
1
gi,t
fi,t 2 li,t 2 wi,tki,t ð Þ
(9)
5
We could relax the one-factor assumption and generalize to a multifactor case, but the
resulting expressions are less intuitive and less preferable for expositional purposes.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).are constant across assets. The expressions for li,t and ki,t are given by
equations (A5) and (A6) in appendix A.
The investor ultimately cares about the trade-off between risk (i.e., the
covariance matrix) and expected return. Under assumption 1, however,
the investor indirectly cares about characteristics because they are suffi-
cient for the covariance matrix and expected returns. As we show in ap-
pendix A, the scalars li,t and ki,t ultimately depend on the characteristics
of all assets. However, the key content of equation (8) is that the vec-
tor Pi,t and scalar pi,t are constant across assets. Therefore, variation in
characteristics yi,t(n) across assets is the only source of variation in the
portfolio weights.
The expression for the coefficients on characteristics (9) has an intui-
tive interpretation. Because ki,t is a scalar, the investor’s demand for char-
acteristics is simply a linear combination of the vectors on expected re-
turns Fi,t and factor loadings Wi,t. That is, the investor prefers assets with
characteristicsthatareassociatedwithhigherexpectedreturnsorsmaller
factor loadings (i.e., less risk).
In appendix A, we show that a particular coefficient restriction implies
that equation (8) is an Mth-order polynomial expansion of the exponen-
tialfunction.Asamatterofspecification,amodelofportfolioweightsthat
is exponential linear in characteristics is parsimonious and pairs nicely
with the fact that portfolio weights appear lognormal in the 13F data.
Thus, we have the following corollary to proposition 1.
Corollary 1. Arestricted version oftheoptimalportfolio (8)under
assumption 1 is characteristics-based demand:
wi,tðnÞ
wi,tð0Þ
5 di,tðnÞ
5 exp b0,i,tmetðnÞ 1 o
K21
k51
bk,i,txk,tðnÞ 1 bK,i,t

ei,tðnÞ:
(10)
We refer to equation (10) as characteristics-based demand because the
portfolioweightsdependonlogmarketequity,otherobservedcharacter-
istics, and unobserved characteristics. An important question is whether
the distributional assumptions and parametric restrictions under which
the optimal portfolio simplifies to characteristics-based demand are em-
pirically relevant. In appendix B, we confirm that a benchmark imple-
mentationthatusestheusualstatisticalformulasforsamplemeanandco-
varianceleadstopoorestimatesofthemean-varianceportfoliobecauseof
samplingerrorovermanyparameters.Wealsoconfirmthatamorerobust
approach to estimating the mean-variance portfolio exploits the factor
structure in returns (MacKinlay and Pástor 2000) and the fact that ex-
pected returns and factor loadings are well captured by a few character-
istics (Brandt, Santa-Clara, and Valkanov 2009).
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).Equation (10) and the budget constraint imply that investor i’s port-
folio weight on asset n ∈ Ni,t at date t is
wi,tðnÞ 5
di,tðnÞ
1 1 om∈Ni,t
di,tðmÞ
: (11)
The portfolio weight on the outside asset is
wi,tð0Þ 5
1
1 1 om∈Ni,t
di,tðmÞ
: (12)
Although there are jNi,tj 1 1 assets including the outside asset, there are
only jNi,tj degrees of freedom because of the budget constraint.
Price per share enters demand only through market equity because
the number of shares outstanding is not economically meaningful. We
follow the notational convention that the Kth characteristic is a constant
(i.e.,xK,tðnÞ 5 1) so that bK,i,t istheintercept.We refer toei,t(n) as latentde-
mand, which captures investor i’s demand for unobserved (by the econo-
metrician) characteristics of asset n. As we discuss in Section III, we do
not observe short positions in our empirical application. Therefore, we
restrict ei,tðnÞ ≥ 0 so that the portfolio weights are nonnegative.
We normalize the mean of latent demand ei,t(n) to one for each inves-
tor, so that the intercept bK,i,t in equation (10) is identified. Then the in-
terceptbK,i,t andlatentdemandei,t(n)playdifferentrolesinequation(10).
On the one hand, bK,i,t determines demand for all assets in the invest-
mentuniverserelativetotheoutsideasset.Inequation(12),theportfolio
weightontheoutsideassetisdecreasinginbK,i,t.Ontheotherhand,cross-
sectional variation in ei,t(n) captures relative demand across assets in the
investment universe. Thus, average latent demand for an asset across in-
vestors, weighted by assets under management, could be constructed as
an asset-level measure of sentiment. Dispersion in latent demand for an
asset across investors could be constructed as an asset-level measure of
disagreement.
Characteristics-based demand easily captures an index fund. If b0,i,t 5
1, bk,i,t 5 0 for k 5 1, …,K 2 1, and ei,tðnÞ 5 1 for all assets n ∈ Ni,t,
equation (11) simplifies to
wi,tðnÞ 5
MEtðnÞ
expf2bK,i,tg 1 om∈Ni,t
MEtðmÞ
: (13)
This investor is an index fund whose portfolio weights are proportional
to market equity, and the intercept bK,i,t determines the weight on the
outside asset (e.g., cash).
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).D. Demand Elasticities
In equation (10), the coefficients on characteristics are indexed by i and
thereforevaryacrossinvestors.Inparticular,investorshaveheterogeneous
demand elasticities. Let qi,t 5 logðAi,twi,tÞ 2 pt be the vector of log shares
heldby investor i,defined only over the subvector ofstrictly positive port-
folio weights. The elasticity of individual demand is
2
∂qi,t
∂p0
t
5 I 2 b0,i,tdiagðwi,tÞ21
Gi,t, (14)
where Gi,t 5 diagðwi,tÞ 2 wi,tw0
i,t. Demand elasticity is decreasing in b0,i,t.
Returning to our example in equation (13), an index fund with b0,i,t 5 1
has inelastic demand.
Let qt 5 logðoI
i51Ai,twi,tÞ 2 pt be the vector of log shares held across all
investors, summed only over the subvectors of strictly positive portfolio
weights. The elasticity of aggregate demand is
2
∂qt
∂p0
t
5 I 2 o
I
i51
b0,i,tAi,tH21
t Gi,t, (15)
whereHt 5 oI
i51Ai,tdiagðwi,tÞ.Thediagonalelementsofmatrices(14)and
(15) are strictly positive when b0,i,t < 1 for all investors. Thus, the follow-
ingassumptionissufficient for both individual andaggregate demand to
be downward sloping.
Assumption 2. The coefficient on log market equity satisfies b0,i,t < 1
for all investors.
In most asset pricing models, demand is downward sloping for vari-
ous reasons including risk aversion, hedging motives (Merton 1973), and
price impact (Wilson 1979; Kyle 1989). As we show next, assumption 2
isalsosufficientforauniqueequilibrium.Therefore,wemaintainassump-
tion 2 for convenience in our implementation of characteristics-based
demand.
E. Market Clearing
We complete the asset pricing model with market clearing for each as-
set n:
MEtðnÞ 5 o
I
i51
Ai,twi,tðnÞ: (16)
That is, the market value of shares outstanding must equal the wealth-
weighted sum of portfolio weights across all investors. In equation (16) and
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).throughout the paper, we follow the notational convention that wi,tðnÞ 5 0
for any asset that is not in investor i’s investment universe (i.e., n ∉ Ni,t).
If asset demand were homogeneous, market clearing (16) implies that all
investorsholdthemarketportfolioinequilibrium,justasinthecapitalas-
setpricingmodel(Sharpe1964;Lintner1965).Incontrast,characteristics-
based demand allows for flexible heterogeneity in asset demand across
investors and matches institutional and household holdings.
We rewrite market clearing (16) in logarithms and vector notation as
p 5 fðpÞ 5 log o
I
i51
AiwiðpÞ
 
2 s: (17)
In this equation and the remainder of this section, we drop time sub-
scripts to simplify notation. Assumption 2 is sufficient for a unique price
vector that solves equation (17). That is, the equilibrium price vector is
well defined regardless of the distribution of characteristics, wealth, and
latent demand.
Proposition 2. Underassumption2,f(p)hasauniquefixedpointin
aconvexcompactdefinedinappendixA.Furthermore,f(p)hasaunique
fixed point in RN
if all assets have at least one investor with b0,i ∈ ð21, 1Þ.
The proof of proposition 2 in appendix A verifies the sufficient condi-
tions for existence and uniqueness under the Brouwer fixed-point theo-
rem. We emphasize that assumption 2 is a sufficient condition and that a
uniqueequilibriumcouldexistevenwhenb0,i ≥ 1forsomeinvestors.The
stronger result for uniqueness in RN
requires that all assets have at least
oneinvestor whosecoefficientonlogmarketequityisstrictlygreaterthan
21. This would be the case, for example, if there were index funds with
relatively inelastic demand that hold each asset. Although proposition 2
guarantees a unique equilibrium, we still need an algorithm for comput-
ing theequilibrium pricevectorinapplications.Appendix C describes an
efficient algorithm for computing the equilibrium in any counterfactual
experiment, which we have developed for the asset pricing applications
in Section V.
Of course, characteristics-based demand can be used for policy exper-
iments only under the null that it is a structural model of asset demand
that is policy invariant. The Lucas (1976) critique applies under the alter-
nativethatthecoefficientsoncharacteristicsandlatentdemandultimately
capture beliefs or constraints that change with policy. Furthermore, we
cannotanswerwelfarequestionswithouttakinganexplicitstanceonpref-
erences, beliefs, and constraints. However, this may not matter for most
asset pricing applications in which price (rather than welfare) is the pri-
mary object of interest. The remainder of the paper proceeds under the
assumption that characteristics-based demand is a structural model of as-
set demand that is motivated by corollary 1.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).III. Stock Market and Institutional Holdings Data
A. Stock Characteristics
The data on stock prices, dividends, returns, and shares outstanding are
from the Center for Research in Security Prices (CRSP) Monthly Stock
Database. We restrict our sample to ordinary common shares (i.e., share
codes 10, 11, 12, and 18) that trade on the New York Stock Exchange, the
AmericanStockExchange,andNasdaq(i.e.,exchangecodes1,2,and3).
Wefurtherrestrict oursampletostockswithnonmissingpriceandshares
outstanding. Accounting data are from the Compustat North America
FundamentalsAnnualandQuarterlyDatabases.WemergetheCRSPdata
with the most recent Compustat data as of at least 6 months and no more
than 18 months prior to the trading date. The lag of at least 6 months en-
sures that the accounting data were public on the trading date.
In addition to log market equity, the characteristics in our specifica-
tion include log book equity, profitability, investment, dividends to book
equity, and market beta. Our choice of book equity, profitability, and in-
vestmentismotivatedby theFama-French five-factormodel that isknown
to describe the cross section of stock returns. Dividends and market beta
have a long tradition in empirical asset pricing as measures of fundamen-
tals and systematic risk, respectively. Our specification is based on a par-
simonious and relevant set of characteristics for explaining expected re-
turns and factor loadings, motivated by assumption 1. We are concerned
about collinearity between characteristics and overfitting if we consider a
largermodelwithmorecharacteristics.Westayawayfromreturnvariables
because they could violate our identifying assumption that characteris-
tics other than price are exogenous to latent demand, as we discuss in
Section IV. In addition, Hou, Xue, and Zhang (2015) find that character-
istics that are already in our specification absorb the explanatory power
of some return variables (e.g., profitability absorbs momentum and book-
to-market equity absorbs long-term reversal).
Our construction of these characteristics follows Fama and French
(2015), which we briefly summarize here. Profitability is the ratio of op-
eratingprofitstobookequity.6
Investmentistheannualloggrowthrateof
assets. Dividends to book equity is the ratio of annual dividends per split-
adjusted share times shares outstanding tobook equity.We estimate mar-
ket beta from a regression of monthly excess returns, over the 1-month
Treasury-bill rate, onto excess market returns using a 60-month moving
window (with at least 24 months of nonmissing returns). At each date,
we winsorize profitability, investment, and market beta at the 2.5th and
6
Operating profits are annual revenues minus the sum of cost of goods sold; selling,
general, and administrative expenses; and interest and related expenses.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).97.5th percentiles to reduce the impact of outliers. Since dividends are
positive, we winsorize dividends to book equity at the 97.5th percentile.
Following Fama and French (1992), our analysis focuses on ordinary
common shares that are not foreign or a real estate investment trust (i.e.,
share code 10 or 11) and have nonmissing characteristics and returns. In
our terminology, these are the stocks that make up the investment uni-
verse. The outside asset includes the complement set of stocks, which ei-
ther are foreign (i.e., share code 12), are real estate investment trusts
(i.e., share code 18), orhave missing characteristics or returns.
B. Institutional Stock Holdings
The data on institutional common stock holdings are from the Thomson
Reuters Institutional Holdings Database (s34 file), which are compiled
from the quarterly filings of Securities and Exchange Commission Form
13F.7
All institutional investment managers that exercise investment dis-
cretion onaccountsholdingSection13(f)securities,exceeding$100mil-
lion in total market value, must file the form. Form 13F reports only long
positionsandnotshortpositions.Wealsodonotknowthecashandbond
positions of institutions because these assets are not 13(f) securities.
We group institutions into six types: banks, insurance companies, in-
vestment advisors, mutual funds, pension funds, and other 13F institu-
tions. An investment advisor is a registered company under Securities
andExchangeCommissionFormADV.Investmentadvisorsincludemany
hedge funds, and we separate investment advisors that are mutual funds
into a different group. The group of other 13F institutions includes en-
dowments, foundations, and nonfinancial corporations. Appendix D con-
tains details of how we construct the institution type.
We merge the institutional holdings data with the CRSP-Compustat
data by CUSIP number and drop any holdings that do not match (i.e.,
13(f) securities whose share codes are not 10, 11, 12, or 18). We compute
the dollar holding for each stock that an institution holds as price times
shares held. Assets under management is the sum of dollar holdings for
each institution. We compute the portfolio weights as the ratio of dollar
holdings to assets under management.
We define the investment universe for each institution at each date as
stocks that are currently held or ever held in the previous 11 quarters.
7
Since June 2013, we use the new version of the data posted on June 11, 2018, that cor-
rects a missing data issue (Wharton Research Data Services 2016). Unfortunately, the new
version has missing data between March 2011 and March 2013 because of migration to a
new data feed (Wharton Research Data Services 2018). Therefore, we use the previous ver-
sion of the data on the WRDS SFTP archive prior to June 2013, consistent with Ben-David
et al. (2017).
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).Thus, the investment universe includes a zero holding whenever a stock
that was held in the previous 11 quarters is no longer in the portfolio. To
motivateourchoiceof11quarters,table1reportsthepercentageofstocks
held in the current quarter that were ever held in the previous one to
11 quarters. For the median institution in assets under management
(AUM), 85 percent of stocks that are currently held were also held in the
previousquarter.Thispercentageincreasesslowlyto94percentat11quar-
ters, so going beyond 11 quarters does not substantively change our mea-
sure of the investment universe.
Marketclearing(16)requiresthatsharesoutstandingequalthesumof
shares held across all investors. For each stock, we define the shares held
by the household sector as the difference between shares outstanding
and the sum of shares held by 13F institutions.8
The household sector
represents direct household holdings and smaller institutions that are
not required to file Form 13F. We also include as part of the household
sector any institution with less than $10 million in assets under manage-
ment, no stocks in the investment universe, or no outside assets.
Table 2 summarizes the 13F institutions in our sample from 1980 to
2017. In the beginning of the sample, 544 institutions managed 35 per-
centofthe stock market. Thisnumbergrowssteadily to3,655institutions
that managed 68 percent of the stock market by the end of the sample.
From 2015 to 2017, the median institution managed $302 million, while
8
In a small number of cases, the sum of shares reported by 13F institutions exceeds
shares outstanding because of shorting or reporting errors (Lewellen 2011). In these cases,
we proportionally scale down the reported holdings of all 13F institutions to ensure that
the sum equals shares outstanding.
TABLE 1
Persistence of the Set of Stocks Held
AUM Percentile
Previous Quarters
1 2 3 4 5 6 7 8 9 10 11
1 82 85 86 88 89 90 91 92 93 93 94
2 85 87 89 91 92 92 93 94 94 95 95
3 85 88 89 90 91 92 93 93 94 94 95
4 85 87 89 90 91 92 92 93 93 94 94
5 85 87 89 90 90 91 92 92 93 93 94
6 85 87 88 89 90 91 92 92 93 93 94
7 84 86 88 89 90 91 91 92 92 93 93
8 84 87 88 90 90 91 92 92 93 93 94
9 87 89 90 91 92 93 93 94 94 94 95
10 92 93 94 95 95 96 96 96 97 97 97
Note.—This table reports the percentage of stocks held in the current quarter that were
ever held in the previous one to 11 quarters. Each cell is a pooled median across time and
all institutions in the given assets under management (AUM) percentile. The quarterly
sample period is from 1980:1 to 2017:4.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).TABLE 2
Summary of 13F Institutions
Period
Number of
Institutions
% of
Market Held
Assets under
Management ($Millions)
Number of
Stocks Held
Number of Stocks in
Investment Universe
Median 90th Percentile Median 90th Percentile Median 90th Percentile
1980–84 544 35 337 2,666 118 386 183 523
1985–89 780 41 400 3,604 116 451 208 692
1990–94 979 46 405 4,566 106 512 192 811
1995–99 1,319 51 465 6,579 102 556 176 943
2000–2004 1,800 57 371 6,095 88 521 165 983
2005–9 2,442 65 333 5,427 73 460 145 923
2010–14 2,879 65 315 5,441 68 447 122 800
2015–17 3,655 68 302 5,204 67 454 112 748
Note.—This table reports the time-series mean of each summary statistic within the given period, based on Securities and Exchange Commission Form
13F. The quarterly sample period is from 1980:1 to 2017:4.
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).larger institutions at the 90th percentile managed $5,204 million. Most
institutionsholdconcentratedportfolios.From2015to2017,themedian
institution held 67 stocks, while the more diversified institutions at the
90th percentile held 454 stocks. Table D1 in appendix D contains a more
detailed breakdown of table 2 by institution type.
IV. Estimating the Characteristics-Based
Demand System
Equation (10) can be interpreted as a nonlinear regression model that
relatesthecrosssectionofportfolioweightstocharacteristics. Alowerco-
efficient on log market equity means that demand is more elastic. For ex-
ample, an investor that tilts its portfolio toward value stocks would have a
low coefficient on log market equity and a high coefficient on log book
equity. The goal of this section is to identify the coefficients on character-
istics in equation (10) for each investor at each date. We drop time sub-
scriptsthroughoutthissectiontosimplifynotationandtoemphasizethat
estimation is on the cross section of assets. We impose the coefficient re-
striction b0,i < 1 to ensure that demand is downward sloping and that
equilibrium is unique (see proposition 2).
A. Identifying Assumptions
1. Exogenous Characteristics
Our starting point is the identifying assumption that is implied by the lit-
erature on asset pricing in endowment economies (Lucas 1978):
E½eiðnÞjmeðnÞ,xðnÞ 5 1: (18)
Equation (10) could be estimated by nonlinear least squares under this
moment condition, which describes most of the empirical literature on
householdportfoliochoiceandcross-border capitalflows ininternational
finance.Followingthisliterature,weretaintheassumptionthatsharesout-
standing and characteristics other than price are exogenous, determined
by an exogenous endowment process.
The usual justification for the exogeneity of prices (or market equity)
in moment condition (18) is that the investor is atomistic so that demand
shocks have negligible price impact. However, even if individual investors
are atomistic, correlated demand shocks could have price impact in the
aggregate, so moment condition (18) rules out any factor structure in la-
tent demand. Because these assumptions are unlikely to hold for institu-
tionsorhouseholds,wedevelopanalternativeidentificationstrategybased
on weaker assumptions.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).2. Investment Mandates and the Wealth Distribution
Let Ii(n) be an indicator function that is equal to one if asset n is in in-
vestor i’s investment universe (i.e., n ∈ Ni). We can trivially rewrite equa-
tion (10) for any asset as
wiðnÞ
wið0Þ
5
IiðnÞexp b0,imeðnÞ 1 o
K21
k51
bk,ixkðnÞ 1 bK,i

eiðnÞ if n ∈ Ni
IiðnÞ 5 0 if n ∉ Ni:
8
> <
> :
This notation emphasizes that an investor does not hold an asset for two
possible reasons. The first reason is that the investor is not allowed to
hold the asset because it is not in its investment universe (i.e., IiðnÞ 5 0).
Forexample,anindexfundcannotholdassetsthatareoutsidetheindex.
The second reason is that the investor chooses not to hold an asset even
though it could (i.e., eiðnÞ 5 0). For example, an index fund may choose
not to hold an asset in the index that is perceived to be overvalued. Thus,
Ii(n) is exogenous under the maintained assumption that the investment
universe is exogenous, while ei(n) is endogenous through the portfolio
choice problem.
In practice, the investment universe is defined by an investment man-
date, which is a predetermined rule on the set of investable assets. For
example, the investment mandate of a technology fund limits the invest-
ment universe to technology stocks. The key economic property of an in-
vestment mandate is that it is a predetermined rule that is plausibly exog-
enoustocurrentdemandshocks.AppendixEcontainssomeexamplesof
mutual funds for which the prospectus clearly states the investment man-
date. Other types of institutions such as insurance companies, pension
funds, and hedge funds also use investment mandates even though they
are usually not publicly disclosed (Sharpe 1981; van Binsbergen, Brandt,
and Koijen 2008; Blake et al. 2013).
In addition to the investment universe, we maintain the assumption
that the wealth distribution across other investors is predetermined and
exogenous to current demand shocks. While this assumption ultimately
appeals to a static view of portfolio choice, it has some empirical content.
Hortaçsu and Syverson (2004) find significant variation in assets under
management across similar mutual funds that remains unexplained by
differences in fees (or expected returns).
3. Instrumental Variables
We describe how to construct a valid instrument for log market equity in
an ideal scenario in which the investment universe isperfectly measured.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).In the following section, we will come back to the issue of measuring the
investment universe in practice.
In estimating investor i’s asset demand, the instrument for log market
equity of asset n is
c meiðnÞ 5 log o j≠i
Aj
IjðnÞ
1 1 o
N
m51IjðmÞ
!
: (19)
This instrument depends only on the investment universe of other inves-
tors and the wealth distribution, which are exogenous under our identi-
fying assumptions. The instrument can be interpreted as the counterfac-
tual market equity, at the market clearing price, if other investors were to
hold an equal-weighted portfolio within their investment universe.9
For
example, technology funds hold an equal-weighted portfolio of technol-
ogy stocks, health care funds hold an equal-weighted portfolio of health
care stocks, and so on.
The instrument exploits variation in the investment universe across in-
vestors and the size of potential investors across assets. An asset that is
included in the investment universe of more investors, especially if those
investors are large, has a larger exogenous component of demand. For
example, a stock that is included in the S&P 500 index has a larger exog-
enous component of demand coming from S&P 500 index funds (Harris
andGurel1986;Shleifer1986).Withdownward-slopingdemand,alarger
exogenous component of demand generates higher prices that are un-
related to latent demand. Our identification comes from cross-sectional
variation in the investment universe and not from time-series variation
in assets moving in and out of the investment universe.
The instrument allows us to weaken moment condition (18) to
E½eiðnÞjc meiðnÞ,xðnÞ 5 1: (20)
This moment condition does not impose any assumptions on the corre-
lation of latent demand across investors or over time. Given the presence
of zero holdings in the data, latent demand has a positive mass at zero.
9
To check the robustness of our results, we have tried an alternative instrument based
on book equity weights:
c meiðnÞ 5 log o j≠i
Aj
IjðnÞBEðnÞ
o
N
m51
IjðmÞBEðmÞ
!
:
This instrument has an advantage that the cross-sectional distribution is closer to normal.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).However, a conditional mean of one in moment condition (20) is a nor-
malization that is fully consistent with the presence of zero holdings.10
B. Implementation Issues
1. Measuring the Investment Universe
With the exception of some mutual funds for which the investment man-
date is clearly stated (see app. E), most institutions do not publicly dis-
close investment mandates. We must therefore measure the investment
universeonthebasisofobservedholdings.AswedescribedinSectionIII,
we measure the investment universe as stocks that are currently held or
ever held in the previous 11 quarters.
The ideal scenario for arguing the exogeneity of the measured invest-
ment universe is the case in which it did not change over time. A time-
invariant investment universe lends credibility to our identifying assump-
tion that it is predetermined and exogenous to current demand shocks.
Table 1 shows that the investment universe is not very far from the ideal
scenario, especially for larger institutions. For a larger institution at the
90th percentile in assets under management, 97 percent of stocks that
are currently held were also held in the previous 11 quarters. This means
that at least 97 percent of stocks in the investment universe this quarter
were also part of the investment universe in the previous quarter. Thus,
the potential threat to identification is isolated to the 3 percent of stocks
that newly entered the investment universe. The fact that the set of stocks
held hardly changes over time is consistent with the presence of invest-
ment mandates.
On the basis of this fact, we refine the instrument to be more robust to
thepotentialthreattoidentification.Inconstructingtheinstrument(19),
weexcludethehouseholdsectorandaggregateonlyoverinstitutionswith
little variation in the investment universe, for which at least 95 percent
ofstocksthatarecurrentlyheldwerealsoheldintheprevious11quarters.
Onthe basis oftable1, most (especially larger) institutions have little var-
iation in the investment universe, so we are excluding only those institu-
tions for which our identifying assumption is most challenged.
Althoughwehavetriedtomakethebestcaseforidentification,wewant
to summarize our remaining concerns with the hope that future research
could make further progress. By definition, the investment universe is a
10
In particular, the probability that latent demand is zero depends on characteristics,
which is consistent with the portfolio choice model in Sec. II. To see this, we can rewrite
moment condition (18) as
E½eiðnÞjc meiðnÞ, xðnÞ 5 PrðeiðnÞ 5 0jc meiðnÞ, xðnÞÞE½eiðnÞjc meiðnÞ, xðnÞ, eiðnÞ 5 0
|ﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ{zﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄﬄ}
0
1 PrðeiðnÞ > 0 c meiðnÞ, xðnÞÞE½eiðnÞ j jc meiðnÞ, xðnÞ, eiðnÞ > 0 5 1:
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).broader set of stocks than those that are held in the recent past. There-
fore, we are concerned that our definition of the investment universe
may miss some stocks that could be held but have not been held in the re-
cent past. Any correlation between this mismeasurement and latent de-
mand through correlated demand shocks across investors could threaten
identification.
Future research could improve on our framework through new data
or methodology that leads to better measurement of the investment uni-
verse. For example, exchange-traded funds have been historically small
in our sample, so we cannot reliably construct the instrument on the ba-
sis of only exchange-traded funds. However, exchange-traded funds have
been growing and now account for 21 percent of domestic equity mutual
funds and exchange-traded funds combined (Board of Governors of the
Federal Reserve System 2017). The secular trend from active to passive
management and the growth of exchange-traded funds could simplify
the measurement of the investment universe for a large share of institu-
tions in the future.
2. Pooled Estimation
Table 2 shows that many institutions have concentrated portfolios, so the
cross section of an institution’s holdings may not be large enough to ac-
curately estimate equation (10). We estimate the coefficients by institu-
tion whenever there are more than 1,000 strictly positive holdings in the
crosssection.Forinstitutionswithfewerthan1,000holdings,wepoolthem
with similar institutions in order to estimate their coefficients. As we pre-
viously described, we group institutions by type and quantiles of assets
under management conditional on type. While the cutoff of 1,000 is arbi-
trary, a lower cutoff of 500 causes convergence problems for our estima-
tor insome cases.Wesetthetotalnumberofgroupsateachdatetotarget
2,000 strictly positive holdings on average per group.
3. Weak Instruments
Cross-sectionalvariation inthe instrument(19) isprimarilydrivenby var-
iation in the investment universe across investors. Put differently, the in-
strument would have no variation if the investment universe were identi-
cal across investors. Fortunately, from an identification perspective, table 2
shows that the investment universe is typically a small set of stocks. From
2015 to 2017, the median institution had only 112 stocksin theinvestment
universe, and even institutions at the 90th percentile had only 748 stocks.
A way to quantify the strength of the instrument is through a first-stage
regression of log market equity onto the instrument and other character-
istics. We estimate the first-stage regression for each institution at each
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).date.Figure1reportstheminimumfirst-staget-statisticacrossinstitutions
ateachdate.Thatis,allinstitutionshaveafirst-staget-statisticthatisabove
the lower bound in the figure. For all institutions throughout the sample
period, the first-stage t-statistic is well above the critical value of 4.05 for
rejecting the null of weak instruments at the 5 percent level (Stock and
Yogo 2005, table 5.2).11
C. Estimation on a Hypothetical Index Fund
We test the validity of our estimator for characteristics-based demand
(10) on a hypothetical index fund. We start with the portfolio weights of
the Vanguard Group (manager number 90457), which has a fully diversi-
fied portfolio, and replace them with exact market weights. That is, we
constructanindexfundthatisthesamesizeandhasthesameinvestment
universe as the Vanguard Group, whose portfolio weights are given by
wiðnÞ
wið0Þ
5 exp meðnÞ 1 bK,i f g
5 exp ½meðnÞ 2 beðnÞ 1 beðnÞ 1 bK,i f g,
(21)
wherebe(n)islogbookequity.Wethenestimatecharacteristics-basedde-
mand (10) by generalized method of moments (GMM) under moment
condition (20). If our estimator is valid, we should recover a coefficient
of one on log market equity and zero on the other characteristics. Equiv-
alently,weshouldrecoveracoefficientofoneonbothlogmarket-to-book
equity and log book equity on the basis of the alternative normalization
(21).
Figure 2 reports the estimated coefficients for the hypothetical index
fund. As expected, we recover a coefficient of one on both log market-to-
book equity and log book equity and zero on the other characteristics,
except for small deviations because of estimation error.
D. Estimated Demand System
Figure 3 summarizes the coefficients for characteristics-based demand
(10), estimated by GMM under moment condition (20). We report the
cross-sectional mean of the estimated coefficients by institution type,
weighted by assets under management. For ease of interpretation, figure 3
11
Underthenullofweakinstruments,theprobabilitythattheminimumfirst-staget-statistic
isabovethecriticalvalueisatmost5percent,whichattainsonlyifthet-statisticsareperfectly
positively correlated across institutions.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).ison thesame scaleas figure2 and reports thecoefficients on logmarket-
to-book equity b0,i and log book equity b0,i 1 b1,i instead of b0,i and b1,i.
A lower coefficient on log market-to-book equity implies a higher de-
mandelasticity(14).Thus,figure3showsthatmutualfundshavelesselas-
tic demand than other types of institutions orhouseholds for most of the
sample period. Banks, insurance companies, and pension funds have be-
come less elasticfrom1980 to2017, while householdshavebecome more
elasticduringthesameperiod.In2017,banks,insurancecompanies,mu-
tual funds, and pension funds have less elastic demand than investment
advisors and households. This finding is consistent with the view that large
institutions cannot deviate too far from market weights because of bench-
marking or price impact.
Thecoefficientonlogbookequitycapturesdemandforsize.Especially
in the second half of the sample period, banks and insurance companies
tilt their portfolio more toward larger stocks than other types of institu-
tions. In contrast, investment advisors tilt their portfolio toward smaller
stocks.TableD1ofappendixDshowsthatthelargest investment advisors
are an order of magnitude smaller than other types of large institutions.
Therefore, our findings are consistent with the fact that the size of insti-
tutions is positively related to the average size of stocks in their portfolio
(Blume and Keim 2012).
FIG. 1.—First-stage t-statistic on the instrument for log market equity. This figure reports
the minimum first-stage t-statistic across institutions at each date. The critical value for re-
jecting the null of weak instruments is 4.05 (Stock and Yogo 2005, table 5.2). The quarterly
sample period is from 1980:1 to 2017:4.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).On average, investment advisors tilt their portfolio more toward stocks
with lower market-to-book equity, higher profitability, lower investment,
and lower market beta than households. As we discussed in Section II,
these characteristics enter the Fama-French five-factor model and are
FIG. 2.—Coefficients on characteristics for an index fund. Characteristics-based de-
mand (10) is estimated for a hypothetical index fund, which is the same size and has the
same investment universe as the Vanguard Group, at each date by GMM under moment
condition (20). The quarterly sample period is from 1997:1 to 2017:4.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).known to generate positive abnormal returns relative to the capital asset
pricing model. Therefore, this finding is consistent with the view that
some institutions are “smart money” investors. The coefficient on market
beta for institutions tends to fall in recessions, which means that the
FIG. 3.—Coefficients on characteristics. Characteristics-based demand (10) is estimated
for each institution at each date by GMM under moment condition (20). This figure re-
ports the cross-sectional mean of the estimated coefficients by institution type, weighted
by assets under management. The quarterly sample period is from 1980:1 to 2017:4.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).demand for market risk is procyclical. For example, the coefficient on
market beta for investment advisors is especially low in 1982:3, 2001:3,
and 2009:1. Finally, households tilt their portfolio more toward higher-
dividend stocks than institutions. Among institutions, banks tilt their port-
folio more toward higher-dividend stocks than other types of institutions.
Giventheestimatedcoefficients,werecoverestimatesoflatentdemand
byequation(10).Figure4reportsthecross-sectionalstandarddeviationof
log latent demand by institution type, weighted by assets under manage-
ment.Ahigherstandarddeviationimpliesmoreextremeportfolioweights
that are tilted away from observed characteristics. For most of the sample
period,householdshavelessvariationinlatentdemandthaninstitutions.
The only exception is during the financial crisis, when the standard devi-
ation of latent demand for households peaked in 2008:2.
InappendixF,weshowthatourbenchmarkestimatesdifferfromthose
estimated by alternative estimators. We show the importance of the in-
strument by considering a restricted least squares estimator that is biased
if latent demand and asset prices are jointly endogenous. We also show
the importance of estimating in levels with zero holdings by considering
estimation of equation (10) in logarithms, which is less efficient and po-
tentially biased.
FIG. 4.—Standard deviation of latent demand. Characteristics-based demand (10) is
estimated for each institution at each date by GMM under moment condition (20). This
figure reports the cross-sectional standard deviation of log latent demand by institution
type, weighted by assets under management. The quarterly sample period is from 1980:1 to
2017:4.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).V. Asset Pricing Applications
Let At be an I-dimensional vector of investors’ wealth, whose ith element
is Ai,t. Let bt be a ðK 1 1Þ  I matrix of coefficients on characteristics,
whose (k, i)th element is bk21,i,t. Let et be an N  I matrix of latent de-
mand, whose (n, i)th element is ei,t(n). Market clearing (17) defines an
implicit function for log price:
pt 5 gðst,xt,At,bt, etÞ: (22)
Thatis,assetpricesarefullydeterminedbysharesoutstanding,character-
istics, the wealth distribution, the coefficients on characteristics, and la-
tent demand.
We use equation (22) in four asset pricing applications. First, we use
themodeltoestimatethepriceimpactofdemandshocksforallinstitutions
andstocks.Second,weusethemodeltodecomposethecross-sectionalvar-
ianceofstockreturnsintosupply-anddemand-sideeffects.Third,weusea
similar variance decomposition to see whether larger institutions explain
a disproportionate share of the stock market volatility in 2008. Finally, we
use the model to predict cross-sectional variation in stock returns.
A. Price Impact of Demand Shocks
If the aggregate demand for stocks is downward sloping, demand shocks
could have persistent effects on prices. For example, an empirical liter-
aturedocumentsthepriceimpactofdemandshocksthatarisefromindex
additions and deletions (see Wurgler and Zhuravskaya [2002] for a re-
view). The estimated demand system in Section IV allows us to estimate
the price impact of demand shocks for all stocks, not just for those that
are added or deleted from an index.
We define the coliquidity matrix for investor i as
∂pt
∂ logðei,tÞ0 5 I 2 o
I
j51
Aj,tH21
t
∂wj,t
∂pt0
! 21
Ai,tH21
t
∂wi,t
∂ logðei,tÞ0
5 I 2 o
I
j51
Aj,tb0,j,tH21
t Gj,t
! 21
Ai,tH21
t Gi,t:
(23)
The (n, m)th element of this matrix is the elasticity of asset price n with
respect to investor i’s latent demand for asset m.12
The coliquidity matrix
12
Kondor and Vayanos (2014) propose a liquidity measure that is a monotonic transfor-
mation of our measure:
∂qi,tðnÞ
∂logðei,tðnÞÞ
 21
∂ptðnÞ
∂logðei,tðnÞÞ
5 ½1 2 wi,tðnÞ bi 1
∂ptðnÞ
∂logðei,tðnÞÞ
  21  
2 1
 21
:
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).measures the price impact of idiosyncratic shocks to an investor’s latent
demand.Thematrixinsidetheinverseinequation(23)istheaggregatede-
mandelasticity (15),whichimplies a largerprice impact for assets that are
held by less elastic investors. The nth diagonal element of the matrix out-
side the inverse in equation (23) is Ai,twi,tðnÞ½1 2 wi,tðnÞ=½oI
j51Aj,twj,tðnÞ.
This expression implies a larger price impact for investors whose hold-
ings are large relative to other investors that hold the asset.
Weestimatethepriceimpactforeachstockandinstitutionthroughthe
diagonalelementsofmatrix(23)andthenaveragebyinstitutiontype.Fig-
ure 5 summarizes the cross-sectional distribution of price impact across
stocks for the average bank, insurance company, investment advisor, mu-
tual fund, and pension fund. Average price impact has decreased from
1980 to 2017, especially for the least liquid stocks at the 90th percentile
ofthedistribution.Thismeansthatthecross-sectionaldistributionofprice
impact has significantly compressed over this period. For example, the
priceimpactfortheaverageinvestmentadvisorwitha10percentdemand
shockontheleastliquidstocks(atthe90thpercentile)hasdecreasedfrom
0.64 percent in 1980:2 to 0.22 percent in 2017:2.
Summing equation (23) across all investors, we define the aggregate
coliquidity matrix as
o
I
i51
∂pt
∂ log ðei,tÞ0 5 I 2 o
I
i51
b0,i,tAi,tH21
t Gi,t
 21
o
I
i51
Ai,tH21
t Gi,t: (24)
The aggregate coliquidity matrix measures the price impact of systematic
shocks to latentdemand across all investors.The nth diagonal element of
the matrix outside the inverse in equation (24) is a holdings-weighted av-
erage of 1 2 wi,tðnÞ across investors. This implies a larger price impact for
assets that are smaller shares of investors’ wealth, which are effectively as-
sets with a lower market cap.
We estimate the aggregate price impact for each stock through the di-
agonal elements of matrix (24). Figure 6 summarizes the cross-sectional
distribution of aggregate price impact across stocks and how that distri-
bution has changed over time. Aggregate price impact for the median
stock has generally decreased from 1980 to 2017. The price impact of
a 10 percent aggregate demand shock for the median stock was 26 per-
cent in 2017:2. Aggregate price impact is countercyclical around the low-
frequencytrend,peakingduringrecessionsin1980:1,1982:1,1991:1,and
2009:1.
B. Variance Decomposition of Stock Returns
Following Fama and MacBeth (1973), a large literature asks to what ex-
tent characteristics explain the cross-sectional variance of stock returns.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).FIG. 5.—Price impact across stocks and institutions. Price impact for each stock and in-
stitution is estimated through the diagonal elements of matrix (23) and then averaged by
institution type. This figure summarizes the cross-sectional distribution of price impact
across stocks for the average bank, insurance company, investment advisor, mutual fund,
and pension fund. The quarterly sample period is from 1980:1 to 2017:4.
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).A more recent literature asks whether institutional demand explains the
significant variation in stock returns that remains unexplained by char-
acteristics (Nofsinger and Sias 1999; Gompers and Metrick 2001). We in-
troduce a variance decomposition of stock returns that offers a precise
answer to this question.
We start with the definition of log returns:
rt11 5 pt11 2 pt 1 vt11,
where vt11 5 logð1 1 expfdt11 2 pt11gÞ. We then decompose the capital
gain as
pt11 2 pt 5 Dpt11ðsÞ 1 Dpt11ðxÞ 1 Dpt11ðAÞ 1 Dpt11ðbÞ 1 Dpt11ðeÞ,
where
Dpt11ðsÞ 5 gðst11,xt,At,bt,etÞ 2 gðst,xt,At,bt, etÞ,
Dpt11ðxÞ 5 gðst11,xt11, At,bt,etÞ 2 gðst11,xt,At,bt,etÞ,
Dpt11ðAÞ 5 gðst11,xt11, At11, bt,etÞ 2 gðst11,xt11,At,bt,etÞ,
Dpt11ðbÞ 5 gðst11,xt11, At11, bt11,etÞ 2 gðst11,xt11,At11,bt,etÞ,
Dpt11ðeÞ 5 gðst11,xt11, At11, bt11,et11Þ 2 gðst11, xt11,At11,bt11,etÞ:
FIG. 6.—Aggregate price impact across stocks. Aggregate price impact for each stock is
estimated through the diagonal elements of matrix (24). This figure summarizes the cross-
sectional distribution of aggregate price impact across stocks. The quarterly sample period
is from 1980:1 to 2017:4.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).We compute each of these counterfactual price vectors through the algo-
rithm in appendix C. We then decompose the cross-sectional variance of
log returns as
Varðrt11Þ 5 CovðDpt11ðsÞ,rt11Þ 1 CovðDpt11ðxÞ, rt11Þ 1 Covðvt11,rt11Þ
1 CovðDpt11ðAÞ,rt11Þ 1 CovðDpt11ðbÞ,rt11Þ
1 CovðDpt11ðeÞ,rt11Þ:
(25)
According to equation (25), variation in asset returns must be ex-
plainedbysupply-ordemand-sideeffects.Thefirstthreetermsrepresent
the supply-side effects due to changes in shares outstanding, changes in
characteristics, andthedividendyield.Thelastthreetermsrepresentthe
demand-side effects due to changes in assets under management, the co-
efficients on characteristics, and latent demand.
Table 3 presents the variance decomposition of annual stock returns,
pooled over 1981–2017. Because characteristics are updated in June for
many stocks whose fiscal years end in December, we use annual stock re-
turns at the end of June to give characteristics the best chance of explain-
ing stock returns. On the supply side, shares outstanding explain 2.1 per-
cent, and characteristics explain 9.7 percent of the cross-sectional variance
of stock returns. Dividend yield explains only 0.4 percent, which means
thatcapitalgaindrivesmostofthecross-sectionalvarianceofstockreturns.
TABLE 3
Variance Decomposition of Stock Returns
% of Variance
Supply:
Shares outstanding 2.1
(.2)
Stock characteristics 9.7
(.3)
Dividend yield .4
(.0)
Demand:
Assets under management 2.3
(.1)
Coefficients on characteristics 4.7
(.2)
Latent demand: extensive margin 23.3
(.3)
Latent demand: intensive margin 57.5
(.4)
Observations 134,328
Note.—Thecross-sectionalvariance of annualstock returns isde-
composed into supply- and demand-side effects. Heteroskedasticity-
robuststandarderrorsarereportedinparentheses.Theannualsam-
ple period is from 1981 to 2017.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).On the demand side, assets under management explain 2.3 percent,
and the coefficients on characteristics explain 4.7 percent of the cross-
sectional variance of stock returns. Latent demand is clearly the most im-
portant, explaining most of the cross-sectional variance of stock returns.
The extensive margin of latent demand that captures changes in the set
of stocks held explains 23.3 percent. The intensive margin of latent de-
mand that captures changes in portfolio weights within the set of stocks
held explains 57.5 percent. Thus, stock returns are mostly explained by
demand shocks that are unrelated to changes in observed characteristics.
This finding is consistent with the fact that cross-sectional regressions of
stock returns on characteristics have low explanatory power (Fama and
French 2008; Asness, Frazzini, and Pedersen 2013).
Our variance decomposition establishes a new set of targets for a grow-
ingliteratureonassetpricingmodelswithinstitutionalinvestors(seen.1).
Because stock prices are a nonlinear function of latent demand, our vari-
ance decomposition quantifies the importance of changes in the distribu-
tion of latent demand for the cross section of stock returns. Stock returns
depend on changes in average latent demand across investors, weighted
byassetsundermanagement,whichcaptureschangesinsentiment.Inad-
dition, stock returns depend on changes in the dispersion of latent de-
mand across investors, which captures changes in disagreement. The im-
portance of latent demand in our variance decomposition highlights the
importance of sentiment and disagreement for explaining the cross sec-
tion of stock returns.
C. Stock Market Volatility in 2008
In the aftermath of the financial crisis, various regulators have expressed
concerns that large investment managers could amplify volatility in bad
times (Office of Financial Research 2013; Haldane 2014). The underly-
ingintuitionisthatevensmallshockscouldtranslatetolargepricemove-
ments through the sheer size of their balance sheets. Going against this
intuition, however, is the fact that large institutions tend to be diversified
buy-and-hold investors that hold more liquid stocks. We use demand sys-
tem asset pricing to better understand the relative contributions of insti-
tutions and households in explaining the stock market volatility in 2008.
We modify the variance decomposition (25) as
Varðrt11Þ 5 CovðDpt11ðsÞ 1 Dpt11ðxÞ 1 vt11,rt11Þ
1 o
I
i51
CovðDpt11ðAiÞ 1 Dpt11ðbiÞ 1 Dpt11ðeiÞ,rt11Þ:
The first term is the total supply-side effect due to changes in shares out-
standing, changes in characteristics, and the dividend yield. The second
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).termisthesumofthedemand-sideeffectsacrossallinvestorsduetochanges
in assets under management, the coefficients on characteristics, and latent
demand. In our implementation of the variance decomposition, we first
order the 30 largest institutions by their assets under management at the
end of 2007, then smaller institutions, and then households.
Table 4 presents the variance decomposition of stock returns in 2008.
Thesupply-side effects explain8.1 percentofthe cross-sectional variance
TABLE 4
Variance Decomposition of Stock Returns in 2008
AUM
Ranking Institution
AUM
($Billions)
Change in
AUM (%)
% of
Variance
Supply: shares outstanding, stock
characteristics and dividend yield 8.1 (1.0)
## 1 Barclays Bank 699 241 .3 (.1)
## 2 Fidelity Management & Research 577 263 .9 (.2)
## 3 State Street Corp. 547 237 .3 (.0)
## 4 Vanguard Group 486 241 .4 (.0)
5 AXA Financial 309 270 .3 (.1)
## 6 Capital World Investors 309 244 .1 (.1)
## 7 Wellington Management Co. 272 251 .4 (.1)
## 8 Capital Research Global Investors 270 253 .1 (.1)
9 T. Rowe Price Assoc. 233 244 2.2 (.1)
## 10 Goldman Sachs & Co. 182 259 .1 (.1)
## 11 Northern Trust Corp. 180 246 .1 (.0)
## 12 Bank of America Corp. 159 250 .0 (.1)
13 J.P. Morgan Chase & Co. 153 251 .1 (.1)
## 14 Deutsche Bank 136 286 .3 (.1)
## 15 Franklin Resources 135 260 .2 (.1)
## 16 College Retire Equities 135 255 .0 (.0)
## 17 Janus Capital Management 134 253 .3 (.1)
18 MSDW & Co. 133 45 .1 (.1)
## 19 Amvescap London 110 242 .0 (.1)
## 20 Dodge & Co. 93 265 .0 (.0)
21 UBS Global Asset Management 90 263 .0 (.1)
## 22 Davis Selected Advisers 87 254 .0 (.0)
## 23 Neuberger Berman 86 273 .0 (.1)
## 24 Blackrock Investment Management 86 269 .0 (.0)
## 25 Oppenheimer Funds 83 264 .2 (.1)
## 26 Wells Fargo & Norwest Corp. 75 256 .1 (.1)
27 MFS Investment Management 73 244 .0 (.0)
## 28 Putnam Investment Management 73 276 .1 (.1)
## 29 Marsico Capital Management 73 256 .0 (.0)
## 30 Lord, Abbett & Co. 72 261 .3 (.1)
Subtotal: 30 largest institutions 6,050 248 4.4
Smaller institutions 6,127 253 40.7 (2.3)
Households 6,322 247 46.9 (2.6)
Total 18,499 249 100.0
Note.—The cross-sectional variance of annual stock returns in 2008 is decomposed into
supply- and demand-side effects. This table reports the total demand-side effect for each
institution due to changes in assets under management (AUM), the coefficients on char-
acteristics, and latent demand. The 30 largest institutions are ranked by AUM in 2007:4.
Heteroskedasticity-robust standard errors are reported in parentheses.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).ofstockreturns,whichmeansthatthedemand-sideeffectsexplainthere-
mainder of the variance. Barclays Bank (now part of Blackrock) was the
largestinstitutionin2007:4,managing$699billion.Itsassetsfellby41per-
cent from 2007:4 to 2008:4. During this period, its contribution to the
cross-sectional variance ofstock returns was 0.3percent. Summing across
the30largestinstitutions,theiroverallcontributiontothecross-sectional
variance of stock returns was 4.4 percent. Smaller institutions explain
40.7 percent, and households explain 46.9 percent of the cross-sectional
variance of stock returns. The three groups of investors each managed
about a third of the stock market, and their assets fell by nearly identical
shares in 2008. However, the relative contribution of the 30 largest insti-
tutions to stock market volatility was much smaller than that of smaller
institutions and households. In unreported results, we find that the var-
iance decomposition in table 4 is remarkably stable over time and is not
particular to the financial crisis.
This finding is driven by two important aspects of larger institutions.
First, largerinstitutionsarediversifiedbuy-and-holdinvestors.Therefore,
their latent demand is more stable over time than that of smaller institu-
tions andhouseholds.Second,larger institutions hold more liquid stocks
with higher aggregate demand elasticity, for which demand shocks have
less price impact.
D. Predictability of Stock Returns
WeapproximatepT 5 gðsT ,xT ,AT ,bT ,eT Þtoafirstorderaroundthecon-
ditional expectation of its arguments at date t. Then the conditional ex-
pectation of the long-run capital gain is
Et½pT 2 pt ≈ gðEt½sT ,Et½xT ,Et½AT ,Et½bT , Et½eT Þ 2 pt:
This equation implies that asset returns are predictable if any of its de-
terminants are predictable.
Because of the importance of latent demand in table 3, we isolate
mean reversion in latent demand as a potential source of predictability in
stock returns. We assume that latent demand reverts to its unconditional
mean of one in the long run and that all other determinants of stock re-
turns are random walks. That is, we assume that
Et½pT 2 pt 5 gðst,xt, At, bt,1Þ 2 pt,
wherewecomputethecounterfactualpricevectorthroughthealgorithm
inappendixC.Thus,wehaveanestimateofthelong-runexpectedreturn
for each stock based on mean reversion in latent demand. Intuitively,
stockswithhighlatentdemand,astock-level measureofsentiment, trade
at high prices and have low expected returns in the future.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).To test whether our estimate of the long-run expected return predicts
the cross section of stock returns, we run a Fama-MacBeth regression of
monthly excess returns, over the 1-month T-bill rate, onto lagged charac-
teristics.Thatis,weestimateacross-sectional regressionofexcessreturns
onto lagged characteristics and then average the estimated coefficients
in the time series over our sample period from June 1980 to December
2017. To control for known sources of predictability, we control for all
characteristics in the Fama-French five-factor model (i.e., log market eq-
uity, book-to-market equity, profitability, investment, and market beta)
andmomentum(i.e.,11-monthreturn,skippingthemostrecentmonth).
Weusedatathatwerepublicinmontht topredictstockreturnsinmonth
t 1 1. For example, our estimate of the long-run expected return in June
uses the accounting data for the prior December and the 13F filing for
March to leave an adequate window for reporting delays.
Table 5 shows that expected monthly returns increase by 0.18 per-
cent per one standard deviation in the long-run expected return with a
t-statistic of 4.80. Our estimate of the long-run expected return uncovers
anewsourceofpredictabilityfrommeanreversioninlatentdemandthat
is similar in magnitude to other characteristics that are known to predict
stock returns. To check the robustness of our results, we rerun the Fama-
MacBeth regression excluding microcaps, defined as stocks whose mar-
ket equityis below the 20thpercentile for NYSEstocks (Fama and French
2008). We continue to find predictability with a statistically significant co-
efficient of 0.11 percent. The smaller coefficient, however, implies that
TABLE 5
Relation between Stock Returns and Characteristics
Characteristic All Stocks Excluding Microcaps
Expected return .18 .11
(.04) (.04)
Log market equity 2.25 2.15
(.08) (.08)
Book-to-market equity .04 .06
(.04) (.05)
Profitability .30 .29
(.06) (.06)
Investment 2.38 2.21
(.03) (.03)
Market beta .08 .01
(.08) (.10)
Momentum .24 .37
(.08) (.10)
Note.—Monthly excess returns, over the 1-month T-bill rate, are re-
gressedontolaggedcharacteristics.Thistablereportsthetime-seriesmean
and standard errors of the estimated coefficients. Microcaps are stocks
whose market equity is below the 20th percentile for NYSE stocks. The
monthly sample period is from June 1980 to December 2017.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).thehigh returnsduetomean reversion inlatentdemandaremoreprom-
inent for smaller stocks.
VI. Extensions and Open Issues
We briefly discuss potential extensions and open issues that are beyond
the scope of this paper, which we leave for future research.
A. Endogenizing Supply and the Wealth Distribution
We have assumed that shares outstanding and asset characteristics are
exogenous.However,wecouldendogenizethesupplysideofdemandsys-
tem asset pricing, just as asset pricing in endowment economies has been
extendedtoproductioneconomies.13
Onceweendogenizecorporatepol-
iciessuchasinvestmentandcapitalstructure,wecouldanswerabroadset
ofquestionsattheintersectionofassetpricingandcorporatefinance.For
example, how do the portfolio decisions of institutions affect real invest-
ment at the business cycle frequency and growth at lower frequencies?
We have also assumed that the wealth distribution is exogenous or,
more fundamentally, that net capital flows between institutions are exog-
enous. By modeling how households allocate wealth across institutions
(e.g., Hortaçsu and Syverson 2004; Shin 2014), we could have a more re-
alistic demand system to better understand the relative importance of
substitution across institutions versus substitution across assets within an
institution.
B. Other Holdings Data
The 13F data do not contain short positions, so we do not know short in-
terest at the institution level. However, data on aggregate short interest
for each stock are available. Therefore, we could construct an aggregate
shortinterestsectorandmodelitasoneoftheinvestorsthatentermarket
clearing(16).Whilethisapproachislessidealthanhavingshortpositions
attheinstitutionlevel,it couldguideusonwhethershortinterestmatters
for our empirical results.
Using the 13F data, we can compute only aggregate household hold-
ingsas the residual of institutional holdings. Incountries such as Sweden
with complete household holdings data (Calvet, Campbell, and Sodini
2007), asset demand for households could be estimated at a more disag-
gregated level. We could then see whether households have correlated
13
Recent work on incorporating institutional investors in production economies in-
cludes Gertler and Karadi (2011), Adrian and Boyarchenko (2013), Brunnermeier and
Sannikov (2014), and Coimbra and Rey (2017).
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).demandshocksespeciallyinbadtimes,whichwouldexplainwhythestan-
dard deviation of latent demand increased significantly for households
during the financial crisis (see fig. 4).
In principle, estimation of the characteristics-based demand system
would improve if we could incorporate other asset classes such as cash
andfixedincome.Unfortunately,USdataoninstitutionalbondholdings
are incomplete because only insurance companies and mutual funds are
required to file theirholdings. In addition, the bond holdings data (e.g.,
Thomson Reuters eMAXX) are not easy to merge with the 13F data. Se-
curitiesHoldingsStatisticsoftheEuropeanCentralBankcontainthecom-
pleteinstitutionalholdingsacrossallassetclassesintheeuroarea(Koijen
et al. 2017). These data could be used to estimate a characteristics-based
demand system for both equities and fixed income in the euro area.
VII. Conclusion
Traditional asset pricing models make strong assumptions that are not
suitable for modeling the asset demand of institutional investors. First,
assumptions about preferences, beliefs, and constraints imply asset de-
mand with little heterogeneity across investors. Second, these models as-
sume that investors have no price impact because they are atomistic and
theirdemandshocksareuncorrelated.Amorerecentliteratureallowsfor
some heterogeneity in asset demand by modeling institutional investors
explicitly (see n. 1). However, it has not been clear how to operationalize
these models to take full advantage of institutional holdings data. Our
contribution is to develop an asset pricing model with flexible heteroge-
neityinassetdemandthatmatchesinstitutionalandhouseholdholdings.
Wealsoproposeaninstrumentalvariableestimatorforthecharacteristics-
based demand system to address the endogeneity of demand and asset
prices.
Demand system asset pricing could answer a broad set of questions re-
lated to the role of institutions in asset markets, which are difficult to an-
swer withreduced-formregressionsoreventstudies.Forexample,howdo
large-scale asset purchases affect asset prices through substitution effects
in institutional holdings? How would regulatory reform of banks and in-
surance companies affect asset prices and real investment? How does the
secular shift from defined-benefit to defined-contribution plans affect as-
setprices,ascapitalmovesfrompensionfundstomutualfundsandinsur-
ance companies? Which institutions drive asset pricing anomalies? We
hope that our framework is useful for answering these types of questions.
References
Adrian, Tobias, and Nina Boyarchenko. 2013. “Intermediary Leverage Cycles
and Financial Stability.” Manuscript, Fed. Reserve Bank New York.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).Asness, Clifford S., Andrea Frazzini, and Lasse H. Pedersen. 2013. “Quality Mi-
nus Junk.” Manuscript, AQR Capital Management, Greenwich, CT.
Basak, Suleyman, and Anna Pavlova. 2013. “Asset Prices and Institutional Inves-
tors.” A.E.R. 103 (5): 1728–58.
Ben-David, Itzhak, Francesco Franzoni, Rabih Moussawi, and John Sedunov.
2017. “The Granular Nature of Large Institutional Investors.” Working Paper
no. 22247, NBER, Cambridge, MA.
Blake, David, Alberto G. Rossi, Allan Timmermann, Ian Tonks, and Russ Wer-
mers. 2013. “Decentralized Investment Management: Evidence from the Pen-
sion Fund Industry.” J. Finance 68 (3): 1133–78.
Blume, Marshall E., and Donald B. Keim. 2012. “Institutional Investors and Stock
Market Liquidity: Trends and Relationships.” Manuscript, Univ. Pennsylvania.
Board of Governors of the Federal Reserve System. 2017. Financial Accounts of the
United States: Flow of Funds, Balance Sheets, and Integrated Macroeconomic Accounts.
Statistical Release no. Z.1. Washington, DC: Board Governors, Fed. Reserve
System.
Brainard, William C., and James Tobin. 1968. “Pitfalls in Financial Model Build-
ing.” A.E.R. Papers and Proc. 58 (2): 99–122.
Brandt, Michael W., Pedro Santa-Clara, and Rossen Valkanov. 2009. “Parametric
Portfolio Policies: Exploiting Characteristics in the Cross-Section of Equity Re-
turns.” Rev. Financial Studies 22 (9): 3411–47.
Brav, Alon, George M. Constantinides, and Christopher C. Geczy. 2002. “Asset
Pricing with Heterogeneous Consumers and Limited Participation: Empirical
Evidence.” J.P.E. 110 (4): 793–824.
Brunnermeier, Markus K., and Yuliy Sannikov. 2014. “A Macroeconomic Model
with a Financial Sector.” A.E.R. 104 (2): 379–421.
Calvet,LaurentE.,JohnY.Campbell,andPaoloSodini.2007.“DownorOut:Assess-
ingtheWelfare Costs of Household Investment Mistakes.” J.P.E. 115 (5): 707–47.
Campbell, John Y. 1991. “A Variance Decomposition for Stock Returns.” Econ. J.
101 (405): 157–79.
Campbell, John Y., and Luis M. Viceira. 2002. Strategic Asset Allocation: Portfolio
Choice for Long-Term Investors. Clarendon Lectures in Economics. New York: Ox-
ford Univ. Press.
Coimbra, Nuno, and Hélène Rey. 2017. “Financial Cycles with Heterogeneous
Intermediaries.” Working Paper no. 23245, NBER, Cambridge, MA.
Dasgupta, Amil, Andrea Prat, and Michela Verardo. 2011. “The Price Impact of
Institutional Herding.” Rev. Financial Studies 24 (3): 892–925.
Fama, Eugene F., and Kenneth R. French. 1992. “The Cross-Section of Expected
Stock Returns.” J. Finance 47 (2): 427–65.
———. 1993. “Common Risk Factors in the Returns on Stocks and Bonds.” J. Fi-
nancial Econ. 33 (1): 3–56.
———. 2008. “Dissecting Anomalies.” J. Finance 63 (4): 1653–78.
———. 2015.“AFive-Factor AssetPricingModel.”J.FinancialEcon.116(1):1–22.
Fama, Eugene F., and James D. MacBeth. 1973. “Risk, Return, and Equilibrium:
Empirical Tests.” J.P.E. 81 (3): 607–36.
Gertler, Mark, and Peter Karadi. 2011. “A Model of Unconventional Monetary
Policy.” J. Monetary Econ. 58 (1): 17–34.
Gompers, Paul A., and Andrew Metrick. 2001. “Institutional Investors and Equity
Prices.” Q.J.E. 116 (1): 229–59.
Haldane, Andrew G. 2014. “The Age of Asset Management?” Manuscript, Bank
of England, London.
Harris, Lawrence, and Eitan Gurel. 1986. “Price and Volume Effects Associated
with Changes in the S&P 500 List: New Evidence for the Existence of Price
Pressures.” J. Finance 41 (4): 815–29.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).He, Zhiguo, and Arvind Krishnamurthy. 2013. “Intermediary Asset Pricing.”
A.E.R. 103 (2): 732–70.
Hortaçsu, Ali, and Chad Syverson. 2004. “Product Differentiation, Search Costs,
and Competition in the Mutual Fund Industry: A Case Study of S&P 500 Index
Funds.” Q.J.E. 119 (2): 403–56.
Hou, Kewei, Chen Xue, and Lu Zhang. 2015. “Digesting Anomalies: An Invest-
ment Approach.” Rev. Financial Studies 28 (3): 650–705.
Koijen, Ralph S. J., François Koulischer, Benoît Nguyen, and Motohiro Yogo.
2017. “Euro-Area Quantitative Easing and Portfolio Rebalancing.” A.E.R. Pa-
pers and Proc. 107 (5): 621–27.
Kondor, Péter, and Dimitri Vayanos. 2014. “Liquidity Risk and the Dynamics of
Arbitrage Capital.” Working Paper no. 19931, NBER, Cambridge, MA.
Kyle, Albert S. 1989. “Informed Speculation with Imperfect Competition.”
Rev. Econ. Studies 56 (3): 317–55.
Lancaster, Kelvin J. 1966. “A New Approach to Consumer Theory.” J.P.E. 74 (2):
132–57.
Lewellen, Jonathan. 2011. “Institutional Investors and the Limits of Arbitrage.”
J. Financial Econ. 102 (1): 62–80.
Lintner, John. 1965. “The Valuation of Risk Assets and the Selection of Risky In-
vestments in Stock Portfolios and Capital Budgets.” Rev. Econ. and Statis. 47 (1):
13–37.
Lucas, Robert E., Jr. 1976. “Econometric Policy Evaluation: A Critique.” Carnegie-
Rochester Conf. Ser. Public Policy 1:19–46.
———. 1978. “Asset Prices in an Exchange Economy.” Econometrica 46 (6): 1429–
45.
MacKinlay, A. Craig, and Ľuboš Pástor. 2000. “Asset Pricing Models: Implications
for Expected Returns and Portfolio Selection.” Rev. Financial Studies 13 (4):
883–916.
Mankiw, N. Gregory, and Stephen P. Zeldes. 1991. “The Consumption of Stock-
holders and Nonstockholders.” J. Financial Econ. 29 (1): 97–112.
Markowitz, Harry. 1952. “Portfolio Selection.” J. Finance 7 (1): 77–91.
Merton, Robert C. 1973. “An Intertemporal Capital Asset Pricing Model.”
Econometrica 41 (5): 867–87.
Nofsinger, John R., and Richard W. Sias. 1999. “Herding and Feedback Trading
by Institutional and Individual Investors.” J. Finance 54 (6): 2263–95.
Office of Financial Research. 2013. “Asset Management and Financial Stability.”
Manuscript, US Dept. Treasury, Washington, DC.
Rosen, Sherwin. 1974. “Hedonic Prices and Implicit Markets: Product Differen-
tiation in Pure Competition.” J.P.E. 82 (1): 34–55.
Ross, Stephen A. 1976. “The Arbitrage Theory of Capital Asset Pricing.” J. Econ.
Theory 13 (3): 341–60.
Samuelson, Paul A. 1969. “Lifetime Portfolio Selection by Dynamic Stochastic
Programming.” Rev. Econ. and Statis. 51 (3): 239–46.
Sharpe, William F. 1964. “Capital Asset Prices: A Theory of Market Equilibrium
under Conditions of Risk.” J. Finance 19 (3): 425–42.
———. 1981.“DecentralizedInvestmentManagement.” J. Finance 36 (2): 217–34.
Shiller, Robert J. 1981. “Do Stock Prices Move Too Much to Be Justified by Sub-
sequent Changes in Dividends?” A.E.R. 71 (3): 421–36.
Shin, Chae Hee. 2014. “An Industrial Organization Approach to International
Portfolio Diversification: Evidence from the U.S. Mutual Fund Families.”
Manuscript, Fed. Reserve Board, Washington, DC.
Shleifer, Andrei. 1986. “Do Demand Curves for Stocks Slope Down?” J. Finance
41 (3): 579–90.
000 journal of political economy
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).Stock, James H., and Motohiro Yogo. 2005. “Testing for Weak Instruments in Lin-
ear IV Regression.” In Identification and Inference for Econometric Models: Essays
in Honor of Thomas Rothenberg, edited by Donald W. K. Andrews and James H.
Stock, chap. 5. Cambridge: Cambridge Univ. Press.
Tobin, James. 1958. “Liquidity Preference as Behavior Towards Risk.” Rev. Econ.
Studies 25 (2): 65–86.
———. 1969. “A General Equilibrium Approach to Monetary Theory.” J. Money,
Credit and Banking 1 (1): 15–29.
van Binsbergen, Jules H., Michael W. Brandt, and Ralph S. J. Koijen. 2008. “Op-
timal Decentralized Investment Management.” J. Finance 63 (4): 1849–95.
Vayanos, Dimitri. 2016. “Flight to Quality, Flight to Liquidity, and the Pricing of
Risk.” Working Paper no. 10327, NBER, Cambridge, MA.
Vayanos, Dimitri, and Paul Woolley. 2013. “An Institutional Theory of Momen-
tum and Reversal.” Rev. Financial Studies 26 (5): 1087–1145.
Vissing-Jørgensen, Annette. 2002. “Limited Asset Market Participation and the
Elasticity of Intertemporal Substitution.” J.P.E. 110 (4): 825–53.
Wharton Research Data Services. 2016. “Research Note Regarding Thomson-
Reuters Ownership Data Issues.” Manuscript, Univ. Pennsylvania.
———. 2018. “S12/S34 Regenerated Data (2010–2016).” Manuscript, Univ.
Pennsylvania.
Wilson, Robert. 1979. “Auctions of Shares.” Q.J.E. 93 (4): 675–89.
Wurgler, Jeffrey, and Ekaterina Zhuravskaya. 2002. “Does Arbitrage Flatten De-
mand Curves for Stocks?” J. Bus. 75 (4): 583–608.
demand system approach to asset pricing 000
This content downloaded from 128.112.200.220 on July 08, 2019 12:17:13 PM
All use subject to University of Chicago Press Terms and Conditions (http://www.journals.uchicago.edu/t-and-c).