---
sha256: edce174878ed7edbab8458d72e87422833d50a6395d8fa71c615f43ea271733b
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 169180
---
IMF Working Papers describe research in
progress by the author(s) and are published
to elicit comments and to encourage debate.
The views expressed in IMF Working Papers
are those of the author(s) and do not necessarily
represent the views of the IMF, its Executive
Board, or IMF management.
2026
MAR
Stablecoin Inflows and
Spillovers to FX Markets
Prepared by Iñaki Aldasoro, Paula Beltran, and Federico Grinberg
WP/26/56©2026 International Monetary Fund WP/26/56
IMF Working Paper
Monetary and Capital Markets Department
Stablecoin Inflows and Spillovers to FX Markets
Prepared by Iñaki Aldasoro, Paula Beltran, and Federico Grinberg*
Authorized for distribution by Tobias Adrian
March 2026
IMF Working Papers describe research in progress by the author(s) and are published to elicit
comments and to encourage debate. The views expressed in IMF Working Papers are those of the
author(s) and do not necessarily represent the views of the IMF, its Executive Board, or IMF management.
ABSTRACT: Using data on four USD-pegged stablecoins and 27 fiat currencies, this paper documents
spillovers from stablecoin-based foreign exchange (FX) to traditional FX markets. We document
a gap between the cost of acquiring dollars via stablecoins and via the spot FX market (parity
deviations). To establish a causal link between stablecoin flows and FX markets, we use a
granular instrumental variable that exploits idiosyncratic shocks to stablecoin net inflows in
other currencies. Our estimates indicate that a 1% exogenous increase in net stablecoin inflows
raises parity deviations by 40 basis points, depreciates the local currency, and widens the dollar
premium in synthetic funding markets (covered interest parity (CIP) deviations). A model
of constrained arbitrage rationalizes these findings and provides structural foundations for the
identification strategy. Counterfactual simulations show that halving cross-market frictions
would attenuate CIP spillovers by roughly one-half and cut exchange rate effects by nearly
one-third. A dynamic extension that closely matches the empirical impulse responses shows
that spillovers grow disproportionately when intermediaries suffer losses, as depleted capital
reduces their capacity to absorb further shocks. Our results establish stablecoins as an emerging
segment of global currency markets with direct implications for financial stability.
JEL Classification Numbers: F31, G15, G12, G23, F38.
Keywords: Stablecoins, foreign exchange, market segmentation, capital flows,
arbitrage
Authors’ email addresses: inaki.aldasoro@bis.org
pbeltransaavedra@IMF.org
fgrinberg@imf.org
* Aldasoro is with the Bank for International Settlements (BIS). Beltran and Grinberg are with the International Monetary Fund
(IMF). The views expressed herein are those of the authors and should not be attributed to the BIS, the IMF, the IMF Executive
Board, or IMF management. We thank Hiroyuki Kubota for outstanding support with the data in the early stages of this project.
The paper has benefited from insightful comments by Tobias Adrian, Chris Erceg, Jon Frost, Marcello Miccoli, Andrew Usher,
seminar participants at the IMF and participants at the thematic group meeting on financial innovation at the BIS. All remaining
errors are our own. Declarations of interest: none.Stablecoin flows and spillovers to FX markets1
Iñaki Aldasoro Paula Beltran Federico Grinberg
BIS IMF IMF
Abstract
Using data on four USD-pegged stablecoins and 27 fiat currencies, this paper documents
spilloversfromstablecoin-basedforeignexchange(FX)totraditionalFXmarkets. Wedocument
a gap between the cost of acquiring dollars via stablecoins and via the spot FX market (parity
deviations). To establish a causal link between stablecoin flows and FX markets, we use a
granular instrumental variable that exploits idiosyncratic shocks to stablecoin net inflows in
other currencies. Our estimates indicate that a 1% exogenous increase in net stablecoin inflows
raises parity deviations by 40 basis points, depreciates the local currency, and widens the dollar
premium in synthetic funding markets (covered interest parity (CIP) deviations). A model
of constrained arbitrage rationalizes these findings and provides structural foundations for the
identification strategy. Counterfactual simulations show that halving cross-market frictions
would attenuate CIP spillovers by roughly one-half and cut exchange rate effects by nearly
one-third. A dynamic extension that closely matches the empirical impulse responses shows
that spillovers grow disproportionately when intermediaries suffer losses, as depleted capital
reducestheircapacitytoabsorbfurthershocks. Ourresultsestablishstablecoinsasanemerging
segment of global currency markets with direct implications for financial stability.
Keywords: Stablecoins, foreign exchange, market segmentation, capital flows, arbitrage.
JEL Classification: F31, G15, G12, G23, F38.
1Aldasoro is with the Bank for International Settlements (BIS). Corresponding author: inaki.aldasoro@bis.org.
Beltran and Grinberg are with the International Monetary Fund (IMF). The views expressed herein are those of
the authors and should not be attributed to the BIS, the IMF, the IMF Executive Board, or IMF management. We
thank Hiroyuki Kubota for outstanding support with the data in the early stages of this project. The paper has
benefited from insightful comments by Tobias Adrian, Chris Erceg, Jon Frost, Marcello Miccoli, Andrew Usher,
seminar participants at the IMF and participants at the thematic group meeting on financial innovation at the BIS.
All remaining errors are our own. Declarations of interest: none.1 Introduction
Stablecoin markets have experienced rapid growth and their potential impact on the financial
system has placed them at the center of policy discussions. Stablecoins are overwhelmingly
denominated in United States dollars (USD). But they also have global reach: Figure 1 shows
thatmorethan70percentofcumulativenetinflowsfromfiatcurrenciesintostablecoinsoriginate
from non-USD currencies. This implies that a majority of stablecoin transactions inherently
involve a foreign exchange (FX) conversion relative to USD, creating a parallel, stablecoin-
based FX ecosystem. This observation raises important questions: how integrated are these
stablecoin-based FX markets with their traditional, off-chain counterparts, and what are the
consequences of this new venue for traditional FX markets and global capital flows?
Figure 1: Cumulative net inflows from fiat currencies to stablecoins
Note: This figure shows the cumulative sum of daily net inflows from fiat currencies into USD-pegged stablecoins (USDT, USDC, DAI, and
BUSD), measured in billions of USD. The sample covers all exchanges and fiat currencies available in our dataset from 2021 to 2025.
Source: Authors’ calculations based on Crypto Compare exchange-level trading data.
Thispaperprovidesasystematicanalysisoftheroleofstablecoinsinglobalcurrencymarkets.
We make four contributions. First, using daily data on four USD-pegged stablecoins traded
against27fiatcurrencies,wedocumentsubstantialpricegapsbetweenacquiringdollarexposure
via stablecoins and via traditional FX markets — what we term parity deviations — and show
that these co-move with stablecoin flows and local currency depreciation. Second, we develop
a model of segmented arbitrage in which a globally fixed stablecoin supply is allocated across
countries by balance-sheet-constrained intermediaries, generating spillovers from stablecoins
to covered interest parity (CIP) deviations and exchange rates, and motivating the instrument
we use for causal identification. Third, using a granular instrumental variable that exploits
idiosyncratic flow shocks to stablecoin net inflows in other currencies, we establish that a one
percent exogenous increase in net stablecoin inflows raises parity deviations by approximately
40 basis points (bp), depreciates the local currency by 5 bp, and widens the short-term dollar
1premium by 5-10 bp. Fourth, counterfactual exercises show that cross-market frictions are the
primary driver of spillovers. A dynamic extension with intermediary wealth dynamics matches
the empiricalimpulse responses while revealingscopefornonlinearamplificationduringstress.
Understanding these mechanisms requires data on where and how stablecoins interface
with fiat currencies. Conversion between stablecoins and fiat currencies occurs primarily on
centralized exchanges (CEXs) and regulated on- and off-ramp providers (Azar et al., 2022;
Baughman et al., 2022).2 These platforms serve as the principal interface between traditional
money systems and stablecoin markets, and form a new type of parallel FX ecosystem that
differs from traditional markets in its participant base, regulatory oversight and susceptibility
to official intervention.
We build a novel dataset from 64 CEXs for the four major USD-pegged stablecoins traded
against 27 fiat currencies. Our daily data span January 2021 to November 2025 and include
both prices and flows. As a new parallel ecosystem that interfaces with traditional FX markets,
stablecoinsgiverisetono-arbitrageconditionssimilartotraditionalfinancialmarkets. Consider
an agent in an emerging market seeking to acquire a stablecoin using the local currency: she
can do this directly by using the local currency to purchase the stablecoin on a CEX at a price in
unitsoflocalcurrencyperstablecoin; oralternativelyshecandothisindirectlybyfirstusingthe
local currency to buy dollars at the spot FX rate and then using the dollars to buy the stablecoin
at a price quoted in dollars per stablecoin. In a frictionless and fully integrated market, the law
of one price dictates that the cost of the two routes should be equivalent. When these two routes
yield different prices, we refer to the existence of parity deviations.
We start by providing evidence of substantial parity deviations for the currencies in our
sample. For some currencies, these deviations average several percentage points and exhibit
significant volatility. These parity deviations from no-arbitrage conditions are systematically
larger for currencies of economies experiencing macroeconomic instability, such as high infla-
tion, or those that employ capital flow management measures. This pattern suggests that the
crypto-based FX market may provide a distinct venue for currency transactions that reflects
local funding stresses and offers an alternative channel for capital movements. The existence
of these sizable and heterogeneous deviations is the first of our three stylized facts, pointing to
frictions in arbitrage between crypto and traditional FX venues.
These parity deviations, as well as traditional FX rates and no arbitrage conditions such as
CIP, correlate with currency-specific stablecoin flows. For each stablecoin-fiat currency pair
and each period 𝑡 we define a measure of net inflows that captures net new funding from a
2Recent industry market data indicate that the vast majority of observable stablecoin trading occurs on centralized
trading venues: one aggregated liquidity analysis finds that only around 5% of stablecoin trades are executed on
decentralized exchanges, with the remaining 9̃5% falling on centralized exchanges and associated order books.
This figure is a proxy for venue concentration in stablecoin markets (and does not isolate strictly stablecoin-to-fiat
pairs, which depend on proprietary data on fiat rails), but it illustrates the dominance of centralized platforms in
facilitating stablecoin trades. See Kaiko Research (2025).
2specific fiat currency into the stablecoin ecosystem. In our second and third stylized facts,
we show that large net inflows are linked with larger parity deviations and local currency FX
depreciation. These stylized facts underscore the presence of frictions to arbitrage and seem to
validate policy-makers concerns, especially in emerging markets, about the potential impact of
stablecoins in their domestic FX markets.
A central challenge in establishing a causal link from stablecoin flows to parity deviations
and traditional FX markets is endogeneity. For example, an anticipated depreciation of a
local currency could simultaneously drive capital flight into stablecoins (increasing measured
inflows) and cause the depreciation and parity deviations themselves. This reverse causality,
alongside potential omitted variables such as unobserved global risk factors, confounds a naïve
regression of parity deviations on stablecoin flows. Consequently, the correlated relationships
we document as stylized facts cannot be directly interpreted as causal.
We develop a theoretical model to rationalize these findings through a unified framework.
We then provide a structural instrument to identify causal effects from stablecoin flow shocks
to parity deviations. The model features home households who demand both stablecoins and
synthetic dollars via FX swaps, which serve different functions and are therefore imperfect
substitutes. A balance-sheet-constrained intermediary connects the two markets, facing costs
that depend on total currency exposure. Stablecoin issuers’ supply is treated as perfectly
elastic at the dollar peg. Cross-country linkages arise instead from cross-book traders active
on multiple fiat-stablecoin exchange books, who allocate a finite conversion budget across
countries. This reallocation channel creates the cross-country linkages that justify our granular
instrument. When conversion urgency declines in country 𝐴, cross-book participants redirect
activity to country 𝐵. As such, demand for stablecoins in Country 𝐵 increases and stablecoin
parity deviation rise even if local demand conditions are unchanged.
Beyond the stablecoin parity deviation, additional channels operate through the intermedi-
ary’s balance sheet. Expanding stablecoin positions raises the marginal cost of swap provision,
loweringCIPdeviations(increasingthedollarpremium). Throughstandardchannels,lowerCIP
deviations (more expensive synthetic dollars) reduce synthetic dollar borrowing and increase
spot dollar purchases, depreciating the local currency. The model thus endogenously generates
the precise triad of effects we estimate empirically: higher stablecoin parity deviations, lower
CIP deviations (a higher dollar premium), and local currency depreciation.
Crucially, the model also provides the structural foundation for our identification strategy.
We show that ordinary least squares (OLS) regressions of prices on stablecoin flows are biased
due to correlation between local demand and unobserved factors (both global shocks that
affect all markets and local confounders). The granular instrumental variable (GIV) strategy,
using demand shocks in other currencies as instruments, identifies the causal effects because
these shocks affect local outcomes through reduced relative supply but are uncorrelated with
local demand conditions. We characterize exactly which structural parameters are identified
3by instrumented regressions, including the marginal cost of intermediation, the cross-market
spillover intensity, and the exchange rate sensitivity to stablecoin flows. The ratio of the
estimated coefficients for deviations in CIP and stablecoin parity provides a direct test of
market integration: values close to zero indicate segmented markets, while values close to
one indicate highly integrated markets where stablecoin stress transmits strongly to traditional
funding conditions.
Building on these insights, we construct a granular instrumental variable from idiosyncratic
flow shocks to stablecoin-fiat pairs in other currencies, purged of common global factors. The
IV estimates confirm the model’s predictions: a one percent shock to net stablecoin inflows
raises parity deviations (by approximately 40 basis points), depreciates the local currency (by
5 basis points), and widens the short-term dollar premium (by 5-10 basis points), providing
evidenceofcausalspilloversfromthecryptoecosystemtotraditionalforeignexchangemarkets.
Beyond providing a rationale for our causal identification, the structural model enables
counterfactualanalysesofalternativemarketconfigurations. Wefindthatcross-marketfrictions
(thecostthatarbitrageursfacewhenholdingmismatchedpositionsacrossstablecoinsandswaps)
are the primary driver of spillovers to traditional FX markets. Halving these costs would reduce
stablecoin parity deviation responses by around 10 percent, attenuate CIP spillovers by roughly
half, and cut exchange rate depreciation effects by one-third. In contrast, lowering stablecoin-
specific costs primarily compresses parity deviations, with limited pass-through to CIP or spot
rates.
A dynamic extension of the model, in which intermediary risk-bearing capacity varies with
wealth, generates impulse responses whose shape and persistence closely match our empirical
estimates. The dynamic framework reveals an additional channel: adverse shocks deplete in-
termediary capital, reducing risk-bearing capacity and amplifying subsequent price responses.
When flow shocks coincide with redemption frictions — as during episodes such as the May
## 2022 Terra/Luna collapse — this amplification can multiply baseline spillover effects several-
fold, underscoring that spillovers can escalate sharply during stress episodes.
These counterfactuals reveal a policy-relevant asymmetry. Interventions that ease stablecoin
market access, such as regulatory clarity or improved on-ramp infrastructure, would reduce par-
ity deviations without destabilizing traditional FX markets, whereas tightening of arbitrageur
constraintsacrossalldollarfundingvenuescouldamplifycross-markettransmission. Thecoun-
terfactuals also speak to the consequences of stablecoin market growth: as demand elasticity
rises with market maturation, the same flow shocks generate larger price responses, suggesting
that spillover risks may increase as the market develops.
Our findings demonstrate that stablecoin markets are already linked to traditional finance,
withspilloversthataffectcurrencystabilityandfundingconditions. Thishasdirectimplications
for policymakers concerned with monetary policy autonomy and financial stability, particularly
in emerging markets where these effects are most pronounced. Looking ahead, our work opens
4severalavenuesforfutureresearch,includingadeeperinvestigationoftheheterogeneityofthese
effects across country characteristics, the role of specific stablecoin governance structures, and
the potential for these new markets to alter the international transmission of financial shocks.
Related literature. Our paper connects to four strands of literature. First, work on CIP
deviations and segmented FX markets (Sushko et al., 2016; Du et al., 2018; Rime et al.,
2022), understood theoretically through limits to arbitrage (Shleifer and Vishny, 1997) and the
risk-bearing capacity of specialized intermediaries (Gabaix and Maggiori, 2015; Itskhoki and
Mukhin, 2021). We embed a new, crypto-based segment into this market structure and show
that it generates measurable spillovers to traditional FX parity conditions.
Second, research on arbitrage in cryptocurrency markets, including cross-exchange price
disparities (Makarov and Schoar, 2020), triangular arbitrage (Franz and Valentin, 2020), crypto
carry trades (Schmeling et al., 2023), and crypto-facilitated capital flows (Graf von Luckner
et al., 2024). We extend this work by systematically quantifying the price gaps between
stablecoinsandtraditionalFXvenuesandestablishingtheircausaleffectsontraditionalmarkets.
Third, a rapidly expanding literature on stablecoins covering stability (D’Avernas et al., 2023;
LyonsandViswanath-Natraj,2023),adoption(Bertsch,2023),runs(Ahmedetal.,2025;Gorton
et al., 2026), regulation (Goel et al., 2025), market structure (Ma et al., 2023), capital flows
(Reuter, 2025; Auer et al., 2025),3 effects on commercial paper markets (Barthelemy et al.,
2023; Kim, 2025a), and Treasury yields (Ahmed and Aldasoro, 2025; Kim, 2025b). Relatedly,
Gorton et al. (2025) study how stablecoins develop a convenience yield, documenting that most
stablecoinscarryanegativeconvenienceyieldandidentifyingaggregateconditions,technology,
reputation, and dollar demand as key drivers of stablecoins’ distance to “no-questions-asked”
status. We contribute by providing the first structural framework linking stablecoin markets to
traditional FX outcomes.
Fourth, our identification strategy builds on the GIV approach of Gabaix and Koijen (2024),
which we apply to the multi-currency stablecoin market to isolate exogenous variation from
idiosyncratic,high-frequency shocks in other currency pairs.
Roadmap. The rest of the paper is organized as follows. Section 2 introduces the main data
sources used in the paper and lays out the key definitions needed. Section 3 presents three
stylized facts we uncover for the link between stablecoins and FX markets and briefly discusses
identification challenges. In Section 4 we present a model of segmented arbitrage that provides
a structural identification framework and derives our strategy for identifying causal effects.
Section 5 presents the empirical specification, our empirical approach, our main results, and
their structural interpretation. Section 6 presents counterfactuals grounded on the model’s
3See also Graf von Luckner et al. (2023) for related work on bitcoin and capital flows.
5estimated parameters, including a dynamic extension that characterizes impulse responses and
balance-sheet amplification. Finally, Section 7 concludes.
## 2 Data and definitions
Data. Our analysis leverages a novel dataset to study the intersection of crypto-based and
traditional FX markets. The primary data source is CryptoCompare, from which we collect
daily, exchange-level data from the secondary market for cryptoassets (including stablecoins).
Our sample encompasses 64 centralized exchanges (CEXs), including the largest and most
liquid venues such as Binance, Coinbase, and Kraken.
We focus on four major USD-pegged stablecoins (USDT, USDC, DAI, and BUSD) that are
tradedagainstthebroadsetof27fiatcurrenciesavailableinourdataset. Foreachstablecoin-fiat
currencypaironeachexchange,wecollectdailyclosingprices,tradingvolumes,andgrossflows
(inflows from fiat to stablecoin and outflows from stablecoin to fiat). To construct currency-
level aggregates, we calculate volume-weighted averages of prices and sum flows across all
exchanges where a given stablecoin-fiat pair is traded. Our sample period spans from January
2021 to November 2025, capturing a period of significant growth and volatility in both crypto
and traditional finance.
This granular data structure allows us to observe a parallel, stablecoin-based FX ecosystem.
Akeyinstitutionalfeatureisthatstablecoininflowsfromnon-USDcurrenciesembedanimplicit
FXconversion. TheresultingparallelFXecosystemstandsincontrasttotraditional, "off-chain"
FX markets, which are characterized by different participants, regulatory oversight, and policy
interventions (including applying capital flow management measures).
Table 1 provides descriptive statistics for USDT, the dominant stablecoin in our sample,
traded against 27 fiat currencies. For each fiat currency listed in the table, we report the number
of exchanges (𝑁), the average daily trading volume in millions of USD, the annualized price
volatility, and summary statistics for the parity deviations (defined below). The table reveals
substantial heterogeneity. Trades with the USD as the quoted currency exhibit by far the largest
volume and the lowest volatility. In contrast, pairs involving currencies like the Argentine peso
(ARS) or Nigerian naira (NGN) show lower volumes but dramatically higher volatility and
larger average parity deviations.
Definitions. We define a measure of price disparity between the stablecoin-based and tradi-
tional FX markets. Consider an agent seeking to acquire a stablecoin 𝑠 using local fiat currency
𝑓. She has two routes. The direct route involves purchasing the stablecoin directly on a CEX at
price 𝑃
𝑠,𝑓
𝑡 (units of 𝑓 per 𝑠). The indirect (synthetic) route involves first converting currency 𝑓
into USD at the traditional spot FX rate 𝑒
USD,𝑓
𝑡 (units of 𝑓 per USD), and then using the USD to
6Table 1: Descriptive statistics for USDT
Stablecoin parity deviations Stablecoin parity deviations
Quote 𝑁 Volume Volatility Mean Median Max Quote 𝑁 Volume Volatility Mean Median Max
USD 20 333.13 0.76% 0.05% 0.03% 0.80% PHP 1 1.45 5.21% 0.27% 0.22% 1.80%
KRW 4 123.73 11.50% 2.51% 1.90% 10.53% UAH 2 1.18 9.59% 1.67% 0.85% 10.28%
EUR 15 123.27 10.81% 0.31% 0.23% 2.21% COP 2 1.15 12.25% 1.49% 1.44% 5.56%
TRY 6 77.07 6.28% 1.08% 0.68% 20.98% CAD 2 0.89 7.27% 0.34% 0.25% 8.37%
BRL 10 16.02 13.80% 0.81% 0.71% 3.80% PLN 3 0.72 13.92% 2.32% 0.64% 40.94%
THB 1 14.16 11.02% 0.77% 0.43% 8.50% AED 1 0.71 1.82% 0.14% 0.12% 0.92%
GBP 8 12.24 9.16% 0.30% 0.22% 2.99% INR 3 0.63 14.09% 4.83% 4.78% 13.19%
MXN 2 7.48 11.36% 0.48% 0.37% 2.97% ZAR 2 0.23 12.06% 2.05% 1.96% 11.38%
TWD 1 5.60 15.60% 0.52% 0.43% 2.52% SGD 2 0.12 6.68% 1.59% 0.26% 24.11%
IDR 2 3.56 8.55% 0.36% 0.28% 2.70% JPY 2 0.09 29.12% 0.41% 0.23% 13.81%
ARS 2 2.59 23.10% 1.06% 0.61% 14.80% NZD 1 0.05 15.63% 1.59% 0.46% 16.51%
CHF 1 2.27 14.68% 0.31% 0.23% 3.35% NGN 2 0.04 13.68% 4.54% 3.44% 24.39%
HKD 1 2.20 2.26% 0.20% 0.15% 1.26% KES 1 0.00 83.38% 3.25% 1.26% 13.74%
AUD 5 2.07 14.45% 0.40% 0.29% 8.05%
Note: 𝑁 denotes the number of exchanges included in the sample. Volume refers to daily trading volume measured
in million USD, averaged over 2025Q2. Volatility is reported for 2025Q2, expressed at an annualized percentage
rate. The mean, median, and maximum of parity deviations are computed using observations after 2021, following
equation (1). All series are constructed from exchange-level data. Parity deviations for ARS, NGN, and UAH are
measured based on parallel rates estimated by Graf von Luckner et al. (2024).
Source: Authors’ calculations based on Crypto Compare exchange-level trading data.
purchase stablecoin 𝑠 at price 𝑃𝑠,USD
𝑡 . In a frictionless, fully integrated market, the law of one
price should hold, and the cost of both routes should be identical. We formalize the deviation
from this parity as:
𝐷
𝑠,𝑓
𝑡 ≡
𝑃
𝑠,𝑓
𝑡
𝑃𝑠,USD
𝑡 𝑒
USD,𝑓
𝑡
×100 (1)
which compares the cost of the direct purchase (numerator) to the cost of the indirect purchase
(denominator). The interpretation is as follows: By construction, 𝐷
𝑠,𝑓
𝑡 = 1 implies that there
are no arbitrage opportunities between the two routes. That is, the stablecoin commands the
same price regardless of the purchase route. If instead 𝐷
𝑠,𝑓
𝑡 > 1, then stablecoin 𝑠 is relatively
expensiveintermsoffiatcurrency 𝑓 relativetothesyntheticUSDroute, suggestinganarbitrage
strategy of buying stablecoin 𝑠 in USD and selling them in currency 𝑓. Conversely, if 𝐷
𝑠,𝑓
𝑡 < 1,
𝑠 the stablecoin is relatively cheap in local currency 𝑓, favoring the opposite arbitrage direction
(buy in 𝑓, sell in USD).
We compute this parity deviation for all stablecoin-fiat pairs in our sample. Specifically, for
each fiat currency-stablecoin pair, we calculate the deviation measure 𝐷
𝑠,𝑓
𝑡 as defined above,
and then summarize these deviations across countries. In our sample, the Argentine Peso
(ARS), Nigerian Naira (NGN), and Ukranian Hryvnia (UAH) had periods with active on-shore
parallel exchange rate markets that deviated from the official rate. For these currencies we use
parallel exchange rates as reported by Haver and IMF country desks to capture effective trading
7conditions, as these are more representative for agents without access to a rationed official
exchange rate.4 In Table 1, we also report descriptive statistics based on country-level average
parity deviations, where each observation is weighted by trading volume in the corresponding
fiat-stablecoin market.
To capture funding dynamics, for each fiat–stablecoin pair ( 𝑓,𝑠) and period 𝑡, we define the
net inflow rate as:
𝑔𝑓,𝑠,𝑡 =
inflows𝑓,𝑠,𝑡 −outflows𝑓,𝑠,𝑡
market size𝑓,𝑠,𝑡−1
, (2)
whereinflows𝑓,𝑠,𝑡 andoutflows𝑓,𝑠,𝑡 arethetotalvolumesflowingbetweenfiat 𝑓 andstablecoin
𝑠 across the relevant exchanges, and market size𝑓,𝑠,𝑡−1 isoutstandingstockofthatstablecoin-fiat
pair at the end of the previous period. This measure is expressed in percentage terms and
winsorized at the 1/99th percentile to mitigate the influence of outliers. It represents net new
funding from a specific fiat currency into the stablecoin ecosystem, i.e. net inflows are recorded
when fiat currency is exchanged for stablecoins – equivalent to fiat-to-stablecoin conversion.
To connect our analysis to the extensive literature on frictions in traditional FX markets,
we construct measures of CIP deviations. CIP is a fundamental no-arbitrage condition linking
interest rates and spot and forward exchange rates. The CIP deviation, 𝛿, measures the cost
of obtaining dollars synthetically (via FX swaps) relative to borrowing dollars directly. When
𝛿 < 0, synthetic dollar funding is more expensive than direct dollar borrowing; in other words,
there is a dollar premium in the swap market.5
AsdocumentedbyDuetal.(2018), CIPdeviationswerenegligiblebeforetheGreatFinancial
Crisis but have become a persistent feature of FX markets since then, reflecting factors such as
bank balance sheet costs and market segmentation. In the context of our paper, we investigate
whethershocksoriginatinginthestablecoinmarketspilloverandaffectthesetraditionalfunding
arbitrage conditions. We construct this measure for 25 currencies in our sample at 3-month and
12-month maturities.
## 3 Stylized facts
Armed with our key variable definitions, we now document three novel stylized facts that
characterize the relationship between stablecoin flows and traditional FX markets. These facts
provide the initial, reduced-form evidence of a link between the crypto-based and traditional
4This is also a conservative stance that reduces the magnitude of parity deviations.
5This matches the empirical definition in Section 4: 𝛿 ≡ (𝐹 − 𝑆)/𝑆 − (𝑖𝐻 −𝑖𝑈𝑆𝐷), where 𝑖𝐻 and 𝑖𝑈𝑆𝐷 are interest
rates and 𝐹 is the forward rate.
8FX ecosystems, setting the stage for our causal identification strategy.
Stylized fact #1: There are sizable parity deviations between stablecoin and traditional FX
markets, with significant heterogeneity across currencies.
Using the definition in equation (1), our first stylized fact is the existence of non-trivial and
persistent price gaps between the direct purchase of a stablecoin in a local currency and the
indirect route mediated by the USD.
Figure 2 plots the distribution of time-averaged parity deviations for USDT across the fiat
currencies in our sample.The left panel shows that for a set of major and highly liquid curren-
cies (e.g., USD, EUR, GBP), parity deviations are small and tightly distributed around zero.
This suggests that arbitrage between the crypto and traditional markets for these currencies is
relatively effective. For other currencies the distribution is more skewed (e.g. the Colombian
peso (COP), the South African rand (ZAR), the Brazilian real (BRL), and the Turkish lira
(TRY). For the currencies on the right panel, average parity deviations are considerably larger
(even up to one order of magnitude) and dispersion can be quite large – hence why we plot
them separately.6 This stylized fact echoes findings in the literature on traditional FX markets
(Kalemli-Özcan and Varela, 2024), extending them to the emerging stablecoin system and, as
discussed later, highlighting similar underlying frictions. A related measure appears in Gorton
et al. (2025), who construct a “stablecoin basis” comparing stablecoin-implied and traditional
FX rates. Their focus is on how this basis reflects foreign dollar demand that makes individual
stablecoins more money-like; our interest is instead in parity deviations as a price of segmenta-
tion between crypto and traditional FX venues and in their causal spillovers to CIP deviations
and exchange rates.
To establish our second stylized fact, we estimate linear projection regressions that trace out
the dynamic impact of net stablecoin inflows (𝑔𝑓,𝑠,𝑡) on our variables of interest. The baseline
pools all four USD-pegged stablecoins (USDT, USDC, DAI, and BUSD) traded against the fiat
currencies in our sample. We estimate the following specification for horizons ℎ = 0,1,...,10:
𝑌𝑓,𝑠,𝑡+ℎ = 𝛽ℎ
𝑔𝑓,𝑠,𝑡 + 𝛾X𝑓,𝑠,𝑡 + 𝛿𝑓,𝑠 + 𝜁𝑓,𝑠,𝑡+ℎ, (3)
where𝑌𝑓,𝑠,𝑡+ℎ represent our three outcome variables of interest (parity deviations, the change
in exchange rates, and CIP deviations) for domestic currency 𝑓 and stablecoin 𝑠 at horizon
ℎ, 𝑔𝑓,𝑠,𝑡 denote net inflows into stablecoins as defined in equation (2), 𝛿𝑓,𝑠 are stablecoin-fiat
fixed effects, 𝑋 captures controls and 𝜁𝑓,𝑠,𝑡+ℎ is an error term. The coefficient 𝛽ℎ traces out the
conditional projection of𝑌 at horizon ℎ to a unit inflow change.7
6The heterogeneity in the sample maybe reflecting different exchange rate regimes, degrees of capital account
openness, and/or levels of macroeconomic volatility. We leave a deeper analysis of this heterogeneity for further
research.
7We scale 𝑔𝑓,𝑠,𝑡 in percentage terms and winsorize at the 1st and 99th percentiles to mitigate the influence of
outliers.
9Figure 2: Distribution of parity deviations by currency (in percent)
Note: This figure shows the distribution of parity deviations against the USD by fiat currency (black median line
with interquartile range boxes, with whiskers denoting the 5th–95th percentiles). The sample includes all pairs of
fiat currencies and USD-pegged stablecoins between 2021 and 2025. All series are constructed from data at the
fiat-stablecoin level with volume-weighted averages across exchanges. Parity deviations for the Argentinean peso
(ARS), the Nigerian naira (NGN), and Ukrainian hryvnia (UAH) are measured based on parallel rates.
Our second stylized fact links net inflows into stablecoins with developments in parity
deviations, exchange rates and CIP deviations:
Stylized fact #2: Net inflows into stablecoins are correlated with: (2a) parity deviations, (2b)
(non-crypto) exchange rate depreciation and (2c) a decline in CIP deviations (a higher dollar
premium).
Figure 3 presents the results from estimating the linear projection regressions to support
the stylized fact. Stablecoin inflows are associated with a contemporaneous increase in parity
deviations (first panel). A positive increase to net stablecoin inflows is associated with an
immediateandstatisticallysignificantjumpinparitydeviations. Thisisconsistentwithamodel
of segmented markets where increased demand for stablecoins in a local currency pushes up
theirpriceoncryptoexchangesrelativetotheindirectprice(𝑃𝑠,𝑈𝑆𝐷
𝑡 𝑒
𝑈𝑆𝐷,𝑓
𝑡 ),andwherearbitrage
forces are insufficient to instantly close the gap.
Perhaps more strikingly, net stablecoin inflows are associated with a subsequent depreciation
of the domestic currency in the traditional spot FX market (middle panel). This provides
suggestive evidence that flows into stablecoins are not confined to the crypto ecosystem but can
generate tangible pressures in traditional FX markets, potentially by increasing the net supply
of the local currency in the spot market as users sell local currency to buy stablecoins.
Finally, stablecoin inflows are correlated with a decline in CIP deviations, indicating a higher
dollar premium. This pattern suggests that net stablecoin inflows may also generate pressures
in the FX swap market, impairing the mechanism of synthetic USD creation to some extent.
The effect on short-term CIP deviations is consistent with arbitrageurs facing balance sheet
10constraints that are more binding at shorter horizons, a channel our model in Section 4 will
formalize.
Figure3:Theeffectofstablecoininflowsonparitydeviations,exchangeratesandCIPdeviations
Parity deviations Cumulative FX depreciation
CIP deviations
Note: This figure shows the cumulative impact of a one-standard deviation increase in stablecoin net inflows as
defined in equation (2) (dots) and its 95% confidence interval (lines) on fiat-stablecoin parity deviation, exchange
rates and CIP deviations (all in basis points) over horizons h=0,. . . ,15 days. Sample includes all four
USD-pegged stablecoins.
These reduced-form correlations establish an empirical link between stablecoin activity and
a range of traditional financial variables. However, interpreting these patterns causally is
challenging due to endogeneity concerns. For instance, an anticipated depreciation of the local
currency could simultaneously drive investors to seek refuge in stablecoins (increasing 𝑔𝑓,𝑠,𝑡)
and cause the depreciation and CIP deviations. The following section presents a model that
provides a structural identification framework to estimate causal effects of stablecoin inflows.
## 4 Structural model and identification
Thissectiondevelopsamodelthatprovidesstructuralfoundationsforouridentificationstrategy
and for the counterfactual exercises in Section 6. The argument proceeds in four steps.
First, in a single Home-country setting, we show that an intermediary who connects the
stablecoin and FX swap markets generates exactly the triad of effects documented in Section 3:
higher stablecoin demand raises parity deviations, widens CIP deviations (a higher dollar
premium), and depreciates the local currency (Sections 4.1–4.2).
Second, we show that the cross-market cost parameter Γ× (the cost the intermediary faces
on its total currency exposure) is the sole channel through which stablecoin stress spills over to
CIP deviations. When Γ× = 0, the two markets decouple entirely.
11Third, we extend the model to multiple countries. Cross-book participants (i.e. traders active
on several fiat-stablecoin exchange books) allocate a finite conversion budget across countries.
Their reallocation in response to local shocks elsewhere creates the cross-country linkages
needed for identification (Section 4.2).
Fourth, we derive what the IV coefficients identify in terms of structural parameters: the
marginal cost of intermediation, the cross-market spillover intensity, and a direct test of market
integration (Section 4.2).8
## 4.1 The model
## 4.1.1 Environment
Hereweillustratethemainmechanisms,beforeextendingtoamoregeneralmulticountrysetting
that allows us to construct a structural GIV in section 4.2.
We consider an economy with only two countries: Home, with currency 𝐻, and the United
States (U.S.), with currency USD. Let 𝑆 denote the spot exchange rate, quoted as units of 𝐻 per
USD (local currency per dollar). We normalize 𝑆 = 1 as reference. The analysis is conducted
in log deviations 𝑠 = log𝑆, so that 𝑠 > 0 corresponds to depreciation and 𝑠 < 0 corresponds to
appreciation of the local currency.
Two prices are central to our analysis. The stablecoin parity deviation is defined as
𝑦 ≡ 𝑝𝑠𝑐
− 𝑠, (4)
where 𝑝𝑠𝑐 = log𝑃𝑠𝑐 is the log stablecoin price in currency 𝐻. When 𝑦 > 0, acquiring dollar
exposure via stablecoins costs more than via spot FX; that is, stablecoins trade at a premium.
The CIP deviation is defined as
𝛿 ≡ (𝐹 − 𝑆)/𝑆 − (𝑖𝐻
−𝑖𝑈𝑆𝐷
), (5)
where 𝑖𝐻 and 𝑖𝑈𝑆𝐷 are interest rates and 𝐹 is the forward rate. When 𝛿 < 0, the forward
premium is insufficient to compensate for the interest differential. 𝛿 measures the cost of
obtaining dollars synthetically (via FX swaps) relative to borrowing dollars directly. We adopt
the sign convention that 𝛿 < 0 indicates a dollar premium in the swap market, i.e., synthetic
dollar funding is more expensive than direct dollar borrowing.
8The model we present here is static. Section 6.3 extends it to incorporate persistent demand shocks and
intermediary balance sheet dynamics, following He and Krishnamurthy (2013) and Gabaix and Maggiori (2015),
so that adverse shocks that deplete capital generate amplified and persistent price responses.
124.1.2 Home households
Home households demand stablecoins (for on-chain dollar access) and synthetic dollars via
FX swaps (for hedging and trade finance). Because these serve different functions, they are
imperfect substitutes. Demand for each asset is linear in its cost:9
𝐷𝑠𝑐
= ¯ 𝐷𝑠𝑐
− 𝛼𝑠𝑐 𝑦 (6)
𝐷𝑠𝑦𝑛
= ¯ 𝐷𝑠𝑦𝑛
+ 𝛼𝛿 𝛿 (7)
where ¯ 𝐷𝑠𝑐 and ¯ 𝐷𝑠𝑦𝑛 are baseline demands, and 𝛼𝑠𝑐,𝛼𝛿 > 0 are demand elasticities. The
baseline demand ¯ 𝐷𝑠𝑐 captures stablecoin demand shocks (e.g. capital flight, growth in crypto
commerce, or regulatory changes affecting traditional dollar access), which are the key drivers
of our empirical analysis.
## 4.1.3 Global stablecoin supply and relative supply
Stablecoins are issued by entities that maintain reserves of dollar-denominated assets. At the
daily frequency relevant for our analysis, stablecoin supply is highly elastic. We therefore set
𝑃𝑠,USD
𝑡 = 1.10
4.1.4 US dollar supply to FX swap markets
US investors supply dollars to Home FX swap markets to earn the CIP basis.11 We model this
supply as:
We model US dollar supply to the swap market as:
𝐿𝑈𝑆
= ¯ 𝐿 − 𝛼𝐿 𝛿 (8)
where ¯ 𝐿 > 0 is baseline supply and 𝛼𝐿 > 0 is the supply elasticity (supply increases when the
dollar premium widens).
9These demand functions can be derived from a household problem that maximizes convenience yields net
of acquisition costs. Specifically, households maximize 𝑉(𝐷𝑠𝑐, 𝐷𝑠𝑦𝑛) − 𝑦 · 𝐷𝑠𝑐 + 𝛿 · 𝐷𝑠𝑦𝑛, where 𝑉(·) is an
additively separable, quadratic convenience yield. Note the positive sign on 𝛿: when 𝛿 < 0 (dollar premium),
households face a cost |𝛿| for synthetic dollars. The first-order conditions yield the demand functions in (6)–(7).
See Appendix D for an alternative specification with segmented household types.
10Wetreatstablecoinsupplyasperfectlyelastic, so 𝑃𝑠,USD
𝑡 = 1. Empirically, USDT/USDdeviatesfromparbyonly
0.05% on average (Table 1). If supply were finitely elastic (𝑆𝑠𝑐 = 𝑆0 + 𝜅𝜇, 𝜇 = 𝑃𝑠,USD
𝑡 −1), a demand increase
would push 𝑃𝑠,USD
𝑡 above par, partially dampening the parity deviation response. This effect is isomorphic to a
higher effective demand elasticity 𝛼𝑠𝑐: the qualitative structure of the model is unchanged, and 𝛼𝑠𝑐 should be
interpreted as capturing both household price sensitivity and any supply-side adjustment.
11This supply-side behavior is well-documented in the CIP literature. See Du et al. (2018) and Rime et al. (2022)
for evidence on the role of US financial institutions in FX swap market intermediation.
134.1.5 Intermediary
A representative intermediary (capturing the aggregate activity of FX dealers, crypto market
makers, and arbitrageurs) facilitates both stablecoin allocation and FX swap provision.
Stablecoin market activity. The intermediary acquires stablecoins from the global pool
(where they trade near par in USD) and sells them to Home households, who pay in local
currency 𝐻. The intermediary earns the stablecoin parity deviation 𝑦 per unit. We denote the
intermediary’s stablecoin position by 𝐵𝑠𝑐.12
FX swap market activity. The intermediary facilitates synthetic dollar funding for Home
households by intermediating FX swaps. Concretely, when a Home firm wants synthetic
dollars, the firm borrows in local currency 𝐻, the intermediary arranges the swap so that the
firm delivers 𝐻 spot and receives USD with a forward contract to reverse at maturity, and the
intermediary stands between Home borrowers (who need dollars) and US dollar lenders (who
supply dollars to earn the basis). The intermediary earns |𝛿| (the absolute value of the CIP
deviation) as compensation for bearing balance sheet costs and counterparty risk. We denote
the intermediary’s swap market position by 𝐵𝑠𝑦𝑛.
Cost structure. The intermediary faces costs that depend on positions in both markets, based
on a quadratic form with convex marginal costs, where Γ𝛿, Γ𝑠𝑐, and Γ× are non-negative cost
parameters governing the curvature of costs in each market:
C(𝐵𝑠𝑦𝑛
, 𝐵𝑠𝑐
) =
Γ𝛿
2
(𝐵𝑠𝑦𝑛
)2
+
Γ𝑠𝑐
2
(𝐵𝑠𝑐
)2
+
Γ×
2
(𝐵𝑠𝑦𝑛
+ 𝐵𝑠𝑐
)2
(9)
The first term captures swap-specific costs from balance sheet constraints (regulatory capital
requirements such as the leverage ratio or internal value-at-risk type constraints), counterparty
credit risk, and margin funding costs. The second term captures stablecoin-specific costs from
on-ramp/off-ramp frictions, operational expenses, and issuer counterparty risk. The third term
is the cross-market cost, depending on total currency 𝐻 exposure. This term captures the key
friction: when the intermediary expands its stablecoin position (acquiring local currency from
households), it increases its overall exposure to currency 𝐻, raising the marginal cost of also
takingonswappositions(whichalsoinvolvelocalcurrencyexposure). WhenΓ× > 0,expanding
the stablecoin positionraises the marginalcostofswapprovision, generatingspilloversbetween
markets.
12The stablecoin inflows defined in equation (2) map into 𝐵𝑠𝑐. When 𝐵𝑠𝑐 > 0, the intermediary sells stablecoins
to households, receiving local local currency in exchange.
14The intermediary maximizes profits:
max
𝐵𝑠𝑦𝑛,𝐵𝑠𝑐
(−𝛿) · 𝐵𝑠𝑦𝑛
+ 𝑦 · 𝐵𝑠𝑐
− C(𝐵𝑠𝑦𝑛
, 𝐵𝑠𝑐
) (10)
Note that since 𝛿 < 0 in equilibrium (dollar premium), the intermediary’s revenue from swap
intermediation is (−𝛿) · 𝐵𝑠𝑦𝑛 = |𝛿| · 𝐵𝑠𝑦𝑛 > 0.
## 4.1.6 Market clearing
Stablecoin market. The intermediary absorbs net demand on the Home exchange book:
𝐵𝑠𝑐
= 𝐷𝑠𝑐
+ 𝑆𝑠𝑐
(11)
where 𝐷𝑠𝑐 = ¯ 𝐷𝑠𝑐 − 𝛼𝑠𝑐 𝑦 is household demand and 𝑆𝑠𝑐 represents additional demand from
other market participants.13 Defining net demand pressure as ¯ 𝜌𝑠𝑐 ≡ ¯ 𝐷𝑠𝑐 + 𝑆𝑠𝑐, we obtain
𝐵𝑠𝑐 = ¯ 𝜌𝑠𝑐 − 𝛼𝑠𝑐. A household demand shock (higher ¯ 𝐷𝑠𝑐) or an increase in other participants’
demand (higher 𝑆𝑠𝑐) both raise ¯ 𝜌𝑠𝑐, increasing the quantity the intermediary must absorb and
the premium it requires.
FX swap market. Home demand for synthetic dollars equals US supply plus intermediary
provision:
𝐷𝑠𝑦𝑛
= 𝐿𝑈𝑆
+ 𝐵𝑠𝑦𝑛
(12)
Defining ¯ 𝜌𝑠𝑦𝑛 ≡ ¯ 𝐷𝑠𝑦𝑛 − ¯ 𝐿 and ˜ 𝛼𝛿 ≡ 𝛼𝛿 + 𝛼𝐿, we obtain 𝐵𝑠𝑦𝑛 = ¯ 𝜌𝑠𝑦𝑛 + ˜ 𝛼𝛿 𝛿
Spot market. The spot exchange rate, 𝑄𝑠𝑝𝑜𝑡, is determined by:
𝑄𝑠𝑝𝑜𝑡
= ¯ 𝑄 −𝜂𝛿 𝛿 +𝜂𝑦 𝑦 − 𝜈𝑠 𝑠 = 0 (13)
where ¯ 𝑄 capturesbaselinenetdollardemandinthespotmarketarisingfromfundamentalfactors
that are independent of stablecoin and swap market conditions, 𝜂𝛿,𝜂𝑦 > 0 capture substitution
towardspotwhenswapsorstablecoinsbecomeexpensive,and 𝜈𝑠 > 0reflectsstandardexchange
rate elasticities. Note the sign on 𝜂𝛿: when 𝛿 becomes more negative (dollar premium widens),
households substitute toward spot dollar purchases, increasing 𝑄𝑠𝑝𝑜𝑡.14
13This term captures demand from participants whose behavior we do not micro-found in the single-country
model. For instance, traders active on multiple exchange books, over-the-counter (OTC) desks, or agents using
stablecoins for remittances. In Section 4.2 we provide structure for 𝑆𝑠𝑐, where cross-book participants allocate
a finite conversion budget across markets.
14A more structural specification links spot market clearing directly to intermediary positions: 𝑄𝑠𝑝𝑜𝑡 = ¯ 𝑄 +
𝛽𝑠𝑦𝑛𝐵𝑠𝑦𝑛 − 𝛽𝑠𝑐𝐵𝑠𝑐 + 𝜈𝑠𝑠 = 0, where 𝛽𝑠𝑦𝑛 and 𝛽𝑠𝑐 capture the spot market flows generated by swap and
stablecoin intermediation respectively. When the intermediary expands 𝐵𝑠𝑐, it receives currency 𝐻 from
households and may hedge this exposure by selling 𝐻 in the spot market; similarly, swap positions have spot legs
that affect market clearing. Using the market clearing conditions 𝐵𝑠𝑐 = ¯ 𝜌𝑠𝑐 − 𝛼𝑠𝑐𝑦 and 𝐵𝑠𝑦𝑛 = ¯ 𝜌𝑠𝑦𝑛 + ˜ 𝛼𝑠𝑦𝑛𝛿,
154.1.7 Equilibrium and comparative statics
Intermediary optimality. The first-order conditions for the intermediary equate marginal
revenue to marginal cost:
−𝛿 = (Γ𝛿 + Γ×)𝐵𝑠𝑦𝑛
+ Γ×𝐵𝑠𝑐
(14)
𝑦 = Γ×𝐵𝑠𝑦𝑛
+ (Γ𝑠𝑐 + Γ×)𝐵𝑠𝑐
(15)
The key feature is that each market’s marginal cost depends on the position in both markets
through Γ×. Note that the left-hand side of (14) is −𝛿 > 0 since 𝛿 < 0 in equilibrium.
Equilibrium characterization. Substituting market clearing into the first-order conditions
yields a linear system in (−𝛿, 𝑦).
Proposition 1 (Equilibrium). The unique equilibrium is characterized by:
𝑦∗
=
1
Δ







𝑁𝑦 · ¯ 𝜌𝑠𝑐
| {z }
stablecoin demand pressure
+ Γ× · ¯ 𝜌𝑠𝑦𝑛
| {z }
swap spillover







(16)
−𝛿∗
=
1
Δ







𝑁𝛿 · ¯ 𝜌𝑠𝑦𝑛
| {z }
swap demand pressure
+ Γ× · ¯ 𝜌𝑠𝑐
| {z }
stablecoin spillover







(17)
𝑠∗
=
1
𝜈𝑠
−𝜂𝛿𝛿∗
+𝜂𝑦𝑦∗
+ ¯ 𝑄

(18)
where 𝐴𝛿 ≡ 1 + ˜ 𝛼𝛿(Γ𝛿 + Γ×), 𝐴𝑠𝑐 ≡ 1 + 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×), 𝐵 ≡ 𝛼𝑠𝑐Γ×, 𝐶 ≡ ˜ 𝛼𝛿Γ×, 𝑁𝑦 ≡ 𝐴𝛿(Γ𝑠𝑐 +
Γ×) − ˜ 𝛼𝛿Γ2
×, 𝑁𝛿 ≡ 𝐴𝑠𝑐(Γ𝛿 + Γ×) − 𝛼𝑠𝑐Γ2
×, and Δ ≡ 𝐴𝛿𝐴𝑠𝑐 − 𝐵𝐶 > 0.
Proof. See Appendix C.
In the equilibrium, each price is driven by own-market demand pressure (weighted by 𝑁𝑦
or 𝑁𝛿, which capture own-market intermediation costs net of cross-market feedbacks) and by
a spillover from the other market, weighted by the cross market spillover, Γ×. In particular,
higher stablecoin demand raises the dollar premium through the intermediaries’ balance sheet
constraint,Γ×. When Γ× = 0, the two markets decouple.
Figure 4 provides a visual overview of the model’s structure.
the structural specification reduces to the form in the text, with 𝜂𝑦 = 𝛽𝑠𝑐𝛼𝑠𝑐 and 𝜂𝛿 = 𝛽𝑠𝑦𝑛 ˜ 𝛼𝑠𝑦𝑛. The reduced-
form coefficients thus combine the intermediary’s spot market footprint with demand elasticities. We use the
reduced-form approach to minimize notation while preserving the key comparative statics.
16Figure 4: Schematic of the model
Stablecoin market
price: 𝑦 (parity deviation)
FX swap market
price: 𝛿 (CIP deviation)
Spot FX market
price: 𝑠 (exchange rate)
Intermediary
(dealers, market makers, arbitrageurs)
𝐵𝑠𝑐 position 𝐵𝑠𝑦𝑛 position
Γ×
Home households
stablecoin & synth. $ demand
USD lenders
supply: 𝐿𝑈𝑆
Cross-book
participants
budget:
Í
𝑓 𝑆𝑠𝑐
𝑓
=𝑊
Other countries’ stablecoin markets
idiosyncratic shocks 𝜃𝐴, 𝜃𝐵,. .. −→ GIV instrument 𝑍𝑓
reallocation
𝑆𝑠𝑐
𝑓
earns 𝑦 earns |𝛿|
𝐿𝑈𝑆
𝐷𝑠𝑐
𝐷𝑠𝑦𝑛
𝜂𝑦 𝜂𝛿
Note: This figure illustrates the model’s structure. The intermediary connects the stablecoin and FX swap
markets through two positions (𝐵𝑠𝑐 and 𝐵𝑠𝑦𝑛) linked by the cross-market cost Γ× (red dashed line). When
Γ× > 0, expanding the stablecoin position raises the marginal cost of swap provision, generating spillovers from
stablecoinstoCIPdeviationsand, throughsubstitutiontowardthespotmarket(𝜂𝑦, 𝜂𝛿), totheexchangerate. Home
households demand both stablecoins and synthetic dollars. Cross-book participants allocate a finite conversion
budget (
Í
𝑓 𝑆𝑠𝑐
𝑓 = 𝑊) across countries; idiosyncratic shocks in other countries (dashed orange box) provide the
identifying variation for the GIV instrument. US dollar lenders supply funds to the swap market.
Comparativestatics. Theequilibriumcharacterizationrevealshowstablecoindemandshocks
propagatethroughthesystem. Threequestionsarecentral: doeshigherstablecoindemandraise
parity deviations? Does it spill over to CIP? How do these effects aggregate into exchange rate
movements? Proposition 2 and corollary 1 summarize the comparative statics results from our
model addressing these questions.
Proposition 2 (Comparative statics). An increase in stablecoin net demand ¯ 𝜌𝑠𝑐:
(i) raises the stablecoin parity deviation (own-market effect):
𝜕𝑦∗
𝜕 ¯ 𝜌𝑠𝑐
=
𝑁𝑦
Δ
> 0 (19)
17(ii) widens the CIP deviation (cross-market spillover):
𝜕𝛿∗
𝜕 ¯ 𝜌𝑠𝑐
= −
Γ×
Δ
≤ 0 (20)
with strict inequality when Γ× > 0, and equality when Γ× = 0;
(iii) depreciates the local currency (total FX impact):
𝜕𝑠∗
𝜕 ¯ 𝜌𝑠𝑐
=
1
𝜈𝑠

−𝜂𝛿
𝜕𝛿∗
𝜕 ¯ 𝜌𝑠𝑐
+𝜂𝑦
𝜕𝑦∗
𝜕 ¯ 𝜌𝑠𝑐

> 0 (21)
Corollary 1 (Segmentation). When Γ× = 0, the CIP spillover vanishes and the two markets
decouple (𝜕𝛿∗/𝜕 ¯ 𝜌𝑠𝑐 = 0).
Proof. See Appendix C.
Thethreeeffectsshareacommonorigin. Higherdemandforcestheintermediarytoexpandits
stablecoin position 𝐵𝑠𝑐, raising marginal costs. The parity deviation 𝑦 must rise to compensate
(part i). If Γ× > 0, the expanded stablecoin position also raises the cost of swap provision
— even with unchanged swap demand — widening the CIP deviation through a balance sheet
externality (part ii). Both channels feed into spot depreciation: households substitute toward
spot dollar purchases when stablecoins become expensive (weighted by 𝜂𝑦) and when synthetic
funding costs rise (weighted by 𝜂𝛿), with both effects working in the same direction (part iii).
Importantly, stablecoin market stress can thereby affect exchange rates even for agents who do
not participate in crypto markets, since the CIP channel raises funding costs for any firm relying
on FX swaps for trade finance or hedging.
Finding a non-zero CIP spillover in the data constitutes direct evidence of balance sheet
linkages (Γ× > 0) between stablecoin and traditional FX markets. Our empirical strategy is
designed precisely to test this prediction.
## 4.2 Multiple currencies and identification
We now extend the model to 𝐹 home countries to study cross-country spillovers and provide
structural foundations for our identification strategy. The extension serves two purposes. First,
it formalizes how stablecoin demand shocks transmit across countries, which underpins our
identification strategy. Second, it allows us to be explicit about the sources of endogeneity that
bias OLS estimates and to show how our granularinstrumentalvariableovercomesthesebiases.
Multi-currency setup. Consider 𝐹 home countries indexed by 𝑓 ∈ {1,...,𝐹}. Each country
has local households with stablecoin demand 𝐷𝑠𝑐
𝑓 = ¯ 𝐷𝑠𝑐
𝑓 − 𝛼𝑠𝑐 𝑦𝑓 and an intermediary facing
the cost structure from Section 4.1.5. Within each country, equilibrium is characterized by
18Proposition 1, with prices determined by net demand pressure ¯ 𝜌𝑠𝑐
𝑓 = ¯ 𝐷𝑠𝑐
𝑓 + 𝑆𝑠𝑐
𝑓 .
We now give structure to the additional demand 𝑆𝑠𝑐
𝑓 introduced in Section 4.1.6. These par-
ticipants are cross-book participants: traders and entities active across multiple fiat-stablecoin
exchange books. A crypto-native trader on Binance with verified accounts for BRL/USDT,
TRY/USDT, and KRW/USDT is a canonical example. These agents hold fiat balances in
several currencies and choose how much to convert on each book in each period.
Crucially, cross-book participants face a finite total conversion budget:
𝐹 ∑︁
𝑓=1
𝑆𝑠𝑐
𝑓 = 𝑊 (22)
reflecting operational constraints such as exchange limits, know-your-customer (KYC) process-
ing bandwidth, fiat settlement capacity, and total fiat holdings. This budget constraint is the
source of cross-country linkages in stablecoin markets.
Cross-book participant behavior. Cross-book participants allocate their budget based on
local conditions across markets. We summarize the attractiveness of converting currency 𝑓 by
a conversion urgency parameter 𝜃𝑓 > 0, which captures expected depreciation, regulatory risk,
banking disruptions, and capital control tightening. Appendix H derives the optimal allocation
from a portfolio-choice problem. The key result is:
𝑆𝑠𝑐
𝑓 = ¯ 𝑆𝑠𝑐
𝑓 + 𝑣𝑓 ,
∑︁
𝑓
𝑣𝑓 = 0 (23)
where 𝑣𝑓 is the idiosyncratic component of reallocation, driven by urgency shocks elsewhere.
Cross-book participants convert more from currencies with higher urgency, and the zero-sum
property follows from the budget constraint: higher conversion in one country mechanically
reduces conversion in others.
Cross-countrytransmission. Whencross-bookparticipantsredirectconversiontowardcoun-
try 𝐴’s book (𝑆𝑠𝑐
𝐴 rises due to higher 𝜃𝐴), their participation on other books must decline (𝑆𝑠𝑐
𝐵
falls for 𝐵 ≠ 𝐴). From country 𝐵’s perspective, demand pressure falls ( ¯ 𝜌𝑠𝑐
𝐵 declines) even
though local household demand ¯ 𝐷𝑠𝑐
𝐵 is unchanged.
Proposition 3 (Cross-country spillovers). A reallocation of cross-book participants from coun-
try 𝐵 to country 𝐴 (𝑆𝑠𝑐
𝐴 increases, 𝑆𝑠𝑐
𝐵 decreases,
Í
𝑓 𝑆𝑠𝑐
𝑓 = 𝑊) affects country 𝐵:
𝜕𝑦𝐵
𝜕𝑆𝑠𝑐
𝐵
> 0,
𝜕𝛿𝐵
𝜕𝑆𝑠𝑐
𝐵
< 0,
𝜕𝑠𝐵
𝜕𝑆𝑠𝑐
𝐵
> 0 for 𝐴 ≠ 𝐵 (24)
Areductionincross-bookparticipantdemandoncountry𝐵’sbooklowerscountry𝐵’sstablecoin
19parity deviation, narrows country 𝐵’s CIP deviation (a lower dollar premium), and appreciates
country 𝐵’s currency.
Proof. See Appendix C. □
Proposition3establishesthatdemandshocksinonecountryspillovertoaffectpricesinother
countries. This cross-country transmission is the foundation of our identification strategy: we
use demand shocks in other countries as instruments for local stablecoin flows. The proposition
guarantees that these external shocks are relevant, as they move local prices through the relative
supply and balance sheet channels.
## 4.3 An identification strategy with Granular Instrumental Variables
This subsection formalizes our identification strategy. We first show why OLS is biased, then
construct the granular instrumental variable, and finally characterize what the IV coefficients
identify in terms of the model’s structural parameters (Proposition 4).
ThemodelclarifieswhyOLSregressionsofpricesonstablecoinflowsarebiasedandhowthe
multi-currencystructurecanovercomethisbias. Localstablecoindemandshocksarecorrelated
with unobserved factors that independently affect parity deviations, CIP, and exchange rates —
for instance, anticipated depreciation simultaneously drives capital flight into stablecoins and
causes the depreciation itself. This correlation between 𝑢𝑓 and the local error terms 𝜀
𝑦
𝑓 , 𝜀𝛿
𝑓 , and
𝜀𝑠
𝑓 (formalized in Appendix A) renders OLS inconsistent. However, Proposition 3 establishes
thatdemandshocksinothercountriesaffectlocalpriceswhileremaininguncorrelatedwithlocal
confounders. This cross-country transmission provides the basis for a granular instrumental
variable. The following proposition formalizes what such an instrument identifies in terms of
the model’s structural parameters. In particular, Proposition 4 shows that the IV coefficients
identify key structural objects: the marginal cost of intermediation, the cross-market spillover
intensity, and a direct test of market integration.
Define total demand on book 𝑓 as ˜ 𝐷𝑠𝑐
𝑓 ≡ ¯ 𝐷𝑠𝑐
𝑓 + 𝑆𝑠𝑐
𝑓 , which combines household demand and
cross-book participant demand. Our GIV isolates exogenous variation in ˜ 𝐷𝑠𝑐
𝑓 that is uncor-
related with local confounders. We decompose total demand into common and idiosyncratic
components:
˜ 𝐷𝑠𝑐
𝑓 = ¯ 𝐷0 + ¯ 𝑆𝑠𝑐
𝑓 + 𝜙𝜇 +𝑢𝐷
𝑓 + 𝑣𝑓
| {z }
≡ ˜ 𝑢𝑓
, (25)
where ˜ 𝑢𝑓 is the idiosyncratic component of total demand on book 𝑓, combining local
household shocks (𝑢𝐷
𝑓 ) and cross-book reallocation (𝑣𝑓 ). We estimate ˜ 𝑢𝑓 as the residual from
a factor model applied to observed net inflow rates (equation 31). The instrument for country
20𝑓 is:
𝑍𝑓 ≡
∑︁
𝑓′≠𝑓
𝑤𝑓′ ˆ ˜ 𝑢𝑓′, (26)
where ˆ ˜ 𝑢𝑓′ are factor-model residuals from total flows and 𝑤𝑓′ ≡ ¯ 𝐷𝑠𝑐
𝑓′/
Í
𝑘≠𝑓
¯ 𝐷𝑠𝑐
𝑘 are demand-
weighted shares. The instrument aggregates idiosyncratic total demand shocks from other
countries, excluding country 𝑓’s own shock.15
Under reasonable assumptions on the shocks, the usual requirements for instruments are
met. Assuming that the shocks to stablecoin demand that are idiosyncratic to country 𝑓 are
correlated with local unobservable factors affecting parity deviations, the instrument satisfies
relevance (Cov(𝑔𝑓 , 𝑍𝑓 ) ≠ 0 because demand elsewhere reduces demand to 𝑓), exogeneity
(Cov(𝑍𝑓 ,𝜀𝑓 ) = 0 because idiosyncratic shocks in other countries are uncorrelated with local
unobservables), and exclusion (as 𝑍𝑓 affects outcomes only through the stablecoin channel).
Appendix A formalizes this.
Proposition 4 (IV identification). Under Assumption 1, the IV coefficients identify the causal
effects of stablecoin flows on prices:
(i) Stablecoin parity deviation coefficient 𝛽𝐼𝑉
𝑦 — marginal cost of intermediation (Table 2,
row (i)):
𝛽𝐼𝑉
𝑦 =
Cov(𝑦𝑓 , 𝑍𝑓 )
Cov(𝑔𝑓 , 𝑍𝑓 )
=
𝜕𝑦𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔
=
𝑁𝑦
𝐴𝛿
(27)
(ii) CIP spillover coefficient 𝛽𝐼𝑉
𝛿 — cross-market externality (Table 2, row (ii)):
𝛽𝐼𝑉
𝛿 =
Cov(𝛿𝑓 , 𝑍𝑓 )
Cov(𝑔𝑓 , 𝑍𝑓 )
=
𝜕𝛿𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔
= −
Γ×
𝐴𝛿
(28)
(iii) Exchange rate coefficient 𝛽𝐼𝑉
𝑠 — total FX impact (Table 2, row (iii)):
𝛽𝐼𝑉
𝑠 =
𝜕𝑠𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔
=
1
𝜈𝑠

−𝜂𝛿𝛽𝐼𝑉
𝛿 +𝜂𝑦𝛽𝐼𝑉
𝑦

=
𝜂𝛿Γ× +𝜂𝑦𝑁𝑦
𝜈𝑠𝐴𝛿
(29)
(iv) Spillover ratio |𝛽𝐼𝑉
𝛿 |/𝛽𝐼𝑉
𝑦 — market integration test (Table 2, row (iv)):
|𝛽𝐼𝑉
𝛿 |
𝛽𝐼𝑉
𝑦
=
|𝜕𝛿𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐|
𝜕𝑦𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
=
Γ×
𝑁𝑦
∈ (0,1) (30)
15Under perfectly elastic supply, the instrument picks up variation from cross-book demand reallocation. If supply
elasticity is finite, idiosyncratic household shocks 𝑢𝐷
𝑓′ provide an additional source of variation through the
dollar price 𝑃𝑠,USD
𝑡 . Appendix G shows that the IV coefficient identifies the same structural object — 𝑁𝑦/𝐴𝛿
— under both mechanisms; only the instrument’s statistical power differs. Given that USDT/USD deviates from
par by only 0.05% on average, the cross-book reallocation channel is likely the dominant source of identifying
variation.
21Theidentifiedcoefficientsenablequantitativepolicyanalysis: givenapolicy-induceddemand
shift Δ𝑔, the IV responses predict equilibrium price changes accounting for the intermediary’s
endogenous response and cross-market spillovers. Appendix B formalizes the OLS bias that
the IV overcomes.
Table 2: Summary of IV-identified structural objects
Coefficient Formula Economic interpretation
(i) 𝛽𝐼𝑉
𝑦
𝑁𝑦
𝐴𝛿
Marginal cost of stablecoin intermediation: how much 𝑦 must
rise to clear one additional unit. Larger when Γ𝑠𝑐, Γ×
are high or demand elasticity 𝛼𝑠𝑐 is low.
(ii) 𝛽𝐼𝑉
𝛿 −
Γ×
𝐴𝛿
Cross-market externality: CIP widening per unit of stablecoin
flow. Zero when Γ× = 0 (segmented markets).
(iii) 𝛽𝐼𝑉
𝑠
𝜂𝛿Γ× +𝜂𝑦𝑁𝑦
𝜈𝑠𝐴𝛿
Total exchange rate impact: combines direct substitution from
stablecoins to spot (𝜂𝑦) and indirect CIP channel (𝜂𝛿).
(iv)
|𝛽𝐼𝑉
𝛿 |
𝛽𝐼𝑉
𝑦
Γ×
𝑁𝑦
∈ (0,1) Market integration test: share of stablecoin price pressure that
transmits to CIP. Near 0 = segmented; near 1 = integrated.
Note: Each row reports the structural object identified by the corresponding IV coefficient from Proposition 4. All
expressions are functions of the intermediation cost parameters (Γ𝑠𝑐, Γ𝛿, Γ×), demand elasticities (𝛼𝑠𝑐, ˜ 𝛼𝛿), and
substitution parameters (𝜂𝑦, 𝜂𝛿, 𝜈𝑠).
## 5 Empirical implementation and estimation results
This section takes the identification strategy derived in Section 4 to the data. We first describe
the construction of the GIV instrument, then present the first-stage and second-stage results,
and finally map the estimated IV coefficients back to the model’s structural parameters.
## 5.1 Implementing GIV
We construct our granular instrument in two steps. First, we isolate idiosyncratic shocks by
purging the net inflow rate 𝑔𝑓,𝑠,𝑡 of common global factors by estimating the following equation
for each stablecoin 𝑠:
𝑔𝑓,𝑠,𝑡 = 𝜆′
𝑓,𝑠F𝑡 +FE𝑠,𝑡 +FE𝑓,𝑠 +𝑢𝑓,𝑠,𝑡 (31)
where F𝑡 represents a vector of common factors (e.g., global risk appetite, broad crypto market
trends), 𝜆′
𝑓,𝑠 captures heterogeneous sensitivities to these factors, FE𝑠,𝑡 are stablecoin-time
fixed effects to absorb coin-specific common shocks, and FE𝑓,𝑠 are currency-coin fixed effects
(partially capturing e.g. regional idiosyncrasies and absorbing level differences across coins).
22The residual 𝑢𝑓,𝑠,𝑡 represents the idiosyncratic component of the net inflow rate for pair (𝑓,𝑠)
at time 𝑡, orthogonal to global and coin-wide factors.
In a second step, we construct the granular instrument as follows. For a given currency 𝑗 and
stablecoin 𝑠, the granular instrument is a size-weighted sum of the idiosyncratic shocks for all
other currencies 𝑘 ≠ 𝑗:
𝑍GIV
𝑗,𝑠,𝑡 =
∑︁
𝑘≠𝑗
𝜔𝑘,𝑠 · 𝑢𝑘,𝑠,𝑡 (32)
The weights 𝜔𝑘,𝑠 are the market shares of currency 𝑘 for stablecoin 𝑠, measured by market
capitalization in the sample period. This construction ensures that the instrument is dominated
by shocks to large, influential currency pairs, supporting the relevance condition. By excluding
currency 𝑗’s own shocks, we ensure that the instrument is uncorrelated with local, idiosyncratic
demand shocks in 𝑗, supporting the exclusion restriction.16
We then estimate a two-stage least squares procedure. In the first stage we regress the net
inflow rate on the instrument and controls:
𝑔𝑗,𝑠,𝑡 = 𝜃 𝑍GIV
𝑗,𝑠,𝑡 + 𝜅′
X𝑗,𝑡 + 𝜈𝑗,𝑠,𝑡 (33)
where X𝑗,𝑡 includes controls such as the Chicago Board Options Exchange Volatility Index
(VIX), dollar index, Bitcoin returns, USDT average price in dollars, estimated factors, and
coin-currency fixed effects.
In the second stage we then regress the outcome variable𝑌𝑗,𝑠,𝑡+ℎ on the predicted values ˆ 𝑔𝑗,𝑠,𝑡
in the first stage:
𝑌𝑗,𝑠,𝑡+ℎ = 𝛽ℎ
ˆ 𝑔𝑗,𝑠,𝑡 + 𝛾X𝑗,𝑠,𝑡 + 𝜙𝑗,𝑠 + 𝜁𝑗,𝑠,𝑡+ℎ (34)
Thekeyidentifyingassumptionisthatthegranularinstrument 𝑍GIV
𝑗,𝑠,𝑡 affectsthelocaloutcome
𝑌𝑗,𝑠,𝑡+ℎ only through its impact on the local stablecoin inflow rate 𝑔𝑗,𝑠,𝑡, conditional on controls.
This exclusion restriction is plausible because the instrument is built from idiosyncratic shocks
in other currencies, purged of common factors, and should have no direct channel to affect
the local FX market except via the equilibrium of the global stablecoin market. We assess the
strength of the first stage with standard F-statistics and conduct robustness checks by varying
the construction of the instrument, using alternative exclusion restrictions (e.g., leave-one-out
by coin or by region), and controlling for factors that could produce endogenous local flow
responses.
16A potential threat to the exclusion restriction could arise if for example global crypto developments would
propagate to FX markets independently of stablecoin relative supply factor, e.g. a Bitcoin crash affecting FX
through risk sentiment. While such a scenario is highly unlikely, the purging we do in terms of factors and fixed
effects, as well as the controls included (e.g. VIX, dollar index, BTC returns) are a first line defense.
23GIVrelevance. Theresultsofthefirst-stageregressionarepresentedinTable3. Ourgranular
instrument is a strong and highly significant predictor of net stablecoin inflows across all
specifications, which vary the number of factors used to construct the instrument (columns
1-3) and the set of controls (columns 4-6). The robust F-statistics are well above conventional
thresholds, indicating a strong instrument and mitigating concerns about weak identification.
Table 3: First-stage regressions results
(1) (2) (3) (4) (5) (6)
GIV -0.153*** -0.111*** -0.067*** -0.152*** -0.113*** -0.070***
(0.0160) (0.0151) (0.0164) (0.0169) (0.0160) (0.0169)
Fiat-specific factor 1 1.054*** 1.051*** 1.036*** 1.049*** 1.049*** 1.036***
(0.0063) (0.0040) (0.0042) (0.0061) (0.0039) (0.0043)
Observations 42,142 42,142 42,142 40,160 40,160 40,160
R-squared 0.215 0.312 0.358 0.219 0.315 0.362
Number of factors 1 2 3 1 2 3
Additional controls No No No Yes Yes Yes
Robust F 14353.5 24058.2 15647.6 2839.0 6324.9 4759.7
K-P rk Wald F 90.46 53.55 16.71 80.50 49.44 17.23
Cragg-Donald F 164.4 99.2 29.4 153.8 98.3 30.8
Adj. R2 0.214 0.311 0.357 0.218 0.314 0.361
Standard errors clustered by date in parentheses. * p<0.10, ** p<0.05, *** p<0.01
Additional controls include log VIX, log of nominal broad dollar index, monthly bitcoin return
measured by 30-day change in price, and USDT price in USD (with 5 days of lags).
Note: This table shows the results of regressing net inflow rates of stablecoins (percentage) on our granular instru-
mental variable. Robust standard errors in parentheses; ***, ** and * respectively denote statistical significance at
the 1%, 5% and 10% level. The baseline pools all four USD-pegged stablecoins (USDT, USDC, DAI, and BUSD).
## 5.2 Estimation of causal effects
Figure 5 presents the core results. The panels plot the dynamic response of our key outcome
variables to a one standard deviation shock to the net stablecoin inflow rate, instrumented by
our GIV.
Apositiveshocktostablecoininflowscausesanimmediate,sharpincreaseinparitydeviations
of approximately 40 basis points on impact. This effect is highly persistent, decaying only
gradually over the following ten days. The persistence of these deviations is consistent with
impaired arbitrage of the type that characterizes segmented markets (Gabaix and Maggiori,
2015).
Stablecoin inflows also lead to a statistically significant depreciation of the local currency in
24the traditional spot market. The magnitude of the effect declines over time and loses statistical
significance after a few days. This confirms that shocks originating in the stablecoin market
spill over into traditional FX markets, exerting tangible pressure on the local currency.
Finally, the shock to stablecoin inflows causes a significant decline in 3-month CIP devia-
tions, indicating a deterioration in synthetic funding conditions (a higher dollar premium). In
contrast, the effect on 12-month CIP deviations is negligible in the short-term and statistically
insignificant. Thistenor-specificpatternsuggeststhatarbitrageurs’constraintsaremorebinding
at shorter horizons, making short-term CIP deviations more sensitive.17
Figure 5: Effect of a one percent increase in instrumented stablecoin net inflows.
Parity deviations Cumulative FX depreciation
CIP 3m deviations CIP 12m deviations
The estimated coefficients have direct structural interpretations through Proposition 4. The
parity deviation response ˆ 𝛽𝐼𝑉
𝑦 ≈ 40 basis points per one percent flow shock measures the
marginal cost of stablecoin intermediation: the premium the intermediary requires to absorb an
additional unit of stablecoins when facing a supply reduction. The CIP response ˆ 𝛽𝐼𝑉
𝛿 ≈ −17.5
basispointsmeasuresthecross-marketexternality: theextenttowhichstablecoinintermediation
crowds out synthetic dollar provision through the intermediary’s balance sheet. That this
coefficient is significantly different from zero constitutes direct evidence against full market
segmentation — under Γ× = 0 , Proposition 4(ii) predicts no CIP response to stablecoin flow
17It is possible that there is heterogeneity across different dimensions in countries’ fundamentals. These could
include the type of exchange rate regime, the degree of capital account openness or exchange rate restrictions,
and the level of financial development. We leave such analysis to further research.
25shocks. The exchange rate response ˆ 𝛽𝐼𝑉
𝑠 ≈ 5 − 10 basis points captures the total FX impact,
combining substitution away from stablecoins toward spot dollar purchases (weighted by 𝜂𝑦)
and substitution away from swaps toward spot purchases driven by the CIP widening (weighted
by 𝜂𝛿).
The ratio of the CIP to parity deviation coefficients provides a model-free test of market
integration (Proposition 4(iv)). Our estimates yield | ˆ 𝛽𝐼𝑉
𝛿 |/ ˆ 𝛽𝐼𝑉
𝑦 ≈ 0.44, indicating that roughly
44 percent of the stablecoin parity deviation response transmits to CIP deviations through
the balance sheet channel. This value lies well between the polar cases of fully segmented
markets (ratio of zero, where stablecoin stress remains contained) and fully integrated markets
(ratio approaching one, where stablecoin and swap markets move nearly in lockstep). The
intermediate value is consistent with cross-market frictions that are economically significant
but do not fully segregate the two markets – a finding we exploit in the counterfactual exercises
of Section 6.
The model in Section 4 is static and therefore speaks directly to the effects at impact (i.e.,
ℎ = 0). The persistence of the empirical responses over subsequent days is consistent with two
forces that the static framework abstracts from: autocorrelation in stablecoin demand shocks
and intermediary balance sheet dynamics that propagate initial shocks over time. We formalize
both channels in the dynamic extension of Section 6.3, which generates impulse responses
whose shape and half-life closely match the empirical patterns in Figure 5.
## 6 Counterfactuals
In this section we use the model to conduct counterfactual exercises to quantify how market
structure affects the transmission of stablecoin demand shocks to traditional foreign exchange
markets. We present the calibration strategy, counterfactuals using the baseline model above,
and then the main results of a dynamic extension of the model that generates persistent effects
via balance sheet dynamics.18
## 6.1 Calibration
Wecalibratethemodeltomatchtwosetsofempiricalmoments. ThefirstsetconsistsofourGIV
estimates of the effects of stablecoin flow shocks on the stablecoin premium, the CIP deviation,
and the exchange rate. The second set draws on estimates from the CIP microstructure literature
regarding swap market intermediation frictions. We proceed by first fixing the demand-side
and pass-through parameters from the literature, and then using the empirical targets to identify
the supply-side cost parameters that govern intermediation and cross-market spillovers.
18Mappingtheeffectsofthemechanismsweunveiltorealmacroeconomicdataatamonthlyorquarterlyfrequency
is left for future research.
26Demand-side and pass-through parameters. We set the stablecoin demand elasticity 𝛼𝑠𝑐 =
0.55, the midpoint of own-price elasticities (−0.29 to −0.83) estimated by Benetton and
Compiani (2024) for differentiated cryptocurrencies, consistent with the relatively inelastic,
necessity-driven demand documented in developing economies (Ahmad et al., 2025). Since
𝛼𝑠𝑐 does not enter any IV coefficient (Proposition 4), it plays no role in pinning down cost
parameters but does affect equilibrium responses through the split between price and quantity
adjustment.
The composite swap demand elasticity ˜ 𝛼𝛿 ≡ 𝛼𝛿 + 𝛼𝐿 = 0.50 reflects the institutional nature
of FX swap demand, where banks and corporates hedge under regulatory mandates that render
demand largely insensitive to the prevailing basis (Sushko et al., 2016; Borio et al., 2016),
consistent with the sub-unity elasticities in ?. Although ˜ 𝛼𝛿 enters the IV coefficients through
𝐴𝛿, its effect is negligible: varying it across [0.25,0.75] shifts 𝛽𝐼𝑉
𝛿 by less than half a basis
point.
The swap-to-spot pass-through 𝜂𝛿 ≈ 0.48 is calibrated from the triangular relationship in
Avdjiev et al. (2019), who estimate that a one percentage point broad dollar appreciation is
associated with a 2.1 basis point widening of the cross-currency basis; inverting this and
normalizing spot market depth 𝜈𝑠 = 1 yields the reported value. This parameter is not precisely
identified in the data and should be interpreted as capturing average pass-through, a channel
likely stronger in emerging markets with thinner spot liquidity.
Swap market intermediation cost. We calibrate Γ𝛿 using the microstructure estimates of
Rime et al. (2022), who find that a one standard deviation order flow shock widens the cross-
currency basis by 0.4–2.7 basis points (normal to stress conditions). Scaling to 1% of daily
inter-dealer volume yields a semi-elasticity of 4–27 basis points per percentage point of flow.
Wetargetthemid-rangeof15.5basispointsfortheswapmarket’sown-priceresponse 𝑁𝛿/𝐴𝑠𝑐.19
This near-vertical supply schedule is consistent with the quarter-end basis spikes documented
by Du et al. (2018).
Supply-side parameters from the GIV identification. The remaining three parameters,
the stablecoin-specific intermediation cost Γ𝑠𝑐, the cross-market intermediation cost Γ×, and
the stablecoin-to-spot substitution elasticity 𝜂𝑦, are pinned down by the three IV coefficients
estimated in Section 5. A 1% instrumented stablecoin flow shock produces a stablecoin parity
deviation of 40 basis points, a CIP deviation of −6 basis points, and a spot depreciation of
approximately 6 basis points. Together with the structural expressions in Proposition 4, these
threemomentsyieldasystemofthreeequationsinthreeunknowns. Intuitively,theCIPspillover
coefficient is most informative about the cross-market cost Γ×, as shared balance sheet frictions
19The own-price response 𝑁𝛿/𝐴𝑠𝑐 captures the total equilibrium effect of a swap demand shock on the CIP
deviation, incorporating both the direct cost of expanding swap intermediation and the general-equilibrium
feedback through cross-market linkages.
27are the sole channel through which stablecoin shocks transmit to the basis. The stablecoin
own-price coefficient then primarily identifies the stablecoin-specific cost Γ𝑠𝑐, which governs
how costly it is to intermediate stablecoins per se. Finally, the exchange rate coefficient pins
downthe stablecoin-to-spotsubstitution𝜂𝑦, sincetheotherquantitiesenteringtheexchangerate
expression are already determined. The resulting 𝜂𝑦 = 0.078 is an order of magnitude smaller
than the swap-to-spot substitution 𝜂𝛿, consistent with stablecoin markets having a much smaller
footprint in spot FX turnover than the swap market.
Table 4 reports the full set of parameters. Several features of the calibration merit discussion.
The stablecoin-specific intermediation cost Γ𝑠𝑐 = 0.337 is roughly 3.6 times larger than the
swap-specific cost Γ𝛿 = 0.093. This ordering is consistent with stablecoin markets involving
additional frictions relative to the mature and liquid FX swap infrastructure, including on-ramp
and off-ramp costs, blockchain transaction fees, and issuer counterparty risk. The cross-
market intermediation cost Γ× = 0.065 is smaller than either own-market cost, implying that
intermediaries face larger frictions within each market segment than across them. The ratio
Γ×/Γ𝛿 ≈ 0.70nonethelessindicatesthatcross-marketspilloversrepresentameaningfulchannel
through which stablecoin activity affects traditional funding conditions.
Table 4: Model calibration
Parameter Value Source Target / Rationale
Panel A: Supply-side parameters from GIV identification
Γ𝑠𝑐 Stablecoin interm. cost 0.337 GIV 𝛽𝐼𝑉
𝑦 = 40 bps
Γ× Cross-mkt interm. cost 0.065 GIV |𝛽𝐼𝑉
𝛿 | = 6 bps
𝜂𝑦 SC-to-spot subst. 0.078 GIV 𝛽𝐼𝑉
𝑠 ≈ 6 bps
Panel B: Supply-side parameter from CIP literature
Γ𝛿 Swap interm. cost 0.093 RSS22 𝑁𝛿/𝐴𝑠𝑐 = 15.5 bps
Panel C: Demand-side and pass-through parameters
𝛼𝑠𝑐 SC demand elasticity 0.55 BKS24 Midpoint of [0.29,0.83]
˜ 𝛼𝛿 Swap demand elasticity 0.50 GM24 Sub-unity; inelastic demand
𝜂𝛿 Swap-to-spot subst. 0.48 AHR19 Triangular relationship
𝜈𝑠 Spot market depth 1.00 — Normalization
Notes: Panel A reports parameters identified from the three GIV coefficients estimated in Section 5.
Panel B reports the swap-specific intermediation cost calibrated to match microstructure estimates
of the CIP semi-elasticity. Panel C reports demand-side and pass-through parameters fixed from the
literature. RSS22: Rime et al. (2022); BKS24: Benetton and Compiani (2024); GM24: ?; AHR19:
Avdjiev et al. (2019). See text for details.
## 6.2 Counterfactual analysis
In this subsection we examine how price responses to stablecoin demand shocks vary with
market structure. For each counterfactual exercise, we vary one parameter while holding all
28others at their calibrated values and compute the resulting price responses to a 1% stablecoin
flow shock.
Baseline results. Under the calibrated parameters, a 1% stablecoin flow shock, supply re-
sponse generates a stablecoin parity deviation of Δ𝑦 = 40 basis points, a CIP deviation of
Δ𝛿 = −6 basis points (a higher dollar premium), and an exchange rate depreciation of Δ𝑠 = 6
basis points. Table 5 reports counterfactual results for variations in the key parameters.
Panel A: Counterfactual equilibrium (𝜕price/𝜕 ¯ 𝜌𝑠𝑐, per 1% demand shock)
Table5:Responseto1%StablecoinFlowShockunderDifferentCross-Market
Costs (Γ×)
Scenario Δ𝑦 (bps) Δ𝛿 (bps) Δ𝑠 (bps) Interpretation
Baseline 32.8 −4.9 4.9 Calibrated model
2× Γ× 36.7 −9.3 7.3 Higher balance sheet linkages
0.5× Γ× 30.7 −2.5 3.6 Lower balance sheet linkages
Γ× = 0 28.4 0.0 2.2 Segmented markets
Panel B: Supply response (𝛽𝐼𝑉, per 1% instrumented flow)
Scenario 𝛽𝐼𝑉
𝑦 (bps) 𝛽𝐼𝑉
𝛿 (bps) 𝛽𝐼𝑉
𝑠 (bps) |𝛽𝛿|/𝛽𝑦 Interpretation
Baseline 40.0 −6.0 6.0 0.151 Calibrated model
2× Γ× 45.9 −11.7 9.2 0.255 Higher balance sheet linkages
0.5× Γ× 36.9 −3.1 4.3 0.083 Lower balance sheet linkages
Γ× = 0 33.7 0.0 2.6 0.000 Segmented markets
Notes: This table reports price responses to a 1% stablecoin flow shock under alternative
values of the cross-market cost Γ×, holding all other parameters at their calibrated values.
Panel A reports equilibrium price derivatives with respect to the exogenous demand shifter
¯ 𝜌𝑠𝑐. Panel B reports IV coefficients, to express supply responses per unit of flow 𝑔. Δ𝑦 denotes
the stablecoin parity deviation, Δ𝛿 denotes the CIP deviation (negative values indicate a higher
dollar premium), and Δ𝑠 denotes the exchange rate depreciation, all in basis points.
Cross-marketcosts. Table5showsthatcross-marketcostsaretheprimarydriverofspillovers
to traditional foreign exchange markets. Doubling Γ× nearly doubles the CIP spillover and
substantially increases all price responses. Concretely, doubling Γ× corresponds to a scenario
in which intermediaries face twice the marginal cost of holding combined stablecoin and swap
positions in the same currency — for example, because tighter regulatory capital rules treat
stablecoin exposures and FX swap exposures as additive rather than diversifiable, or because a
deterioration in counterparty credit conditions raises the cost of netting across desks. In such
an environment, every additional dollar of stablecoin intermediation crowds out swap provision
more aggressively. As a result, Δ𝑦 rises from 40 to 46 basis points, Δ𝛿 falls from −6 to −12
basis points (a larger dollar premium), and Δ𝑠 rises from 6 to 9 basis points. In contrast, if
29markets were fully segmented (Γ× → 0), the CIP spillover would vanish completely, while the
exchange rate spillover would half.
The intuition follows directly from the model structure. When Γ× > 0, intermediaries face a
cost that depends on their total currency exposure across both stablecoin and swap markets. A
stablecoin demand shock that expands intermediaries’ stablecoin positions therefore raises the
marginal cost of swap provision, reducing swap supply and lowering CIP deviations (increasing
the dollar premium). The larger is Γ×, the stronger this balance sheet channel becomes. In the
limiting case where Γ× = 0, the two markets are effectively segmented, and stablecoin shocks
affect stablecoin prices but do not transmit to swap markets.
Figure 6 illustrates these effects. The stablecoin parity deviation and exchange rate depreci-
ation increase monotonically in Γ×, while the CIP deviation becomes more negative (a larger
dollar premium). The CIP deviation exhibits the steepest response. This pattern confirms that
spillovers to traditional foreign exchange markets operate primarily through the cross-market
cost channel.
Figure 6: Effect of cross-market costs (Γ×) on Price Responses.
Notes: This figure displays equilibrium price responses to a 1% stablecoin flow shock across
different cross-market cost parameter Γ×. The left panel shows the stablecoin parity deviation
(Δ𝑦), the middle panel shows the CIP deviation (Δ𝛿, where more negative values indicate a
higher dollar premium), and the right panel shows the exchange rate depreciation (Δ𝑠). The
horizontal axis measures Γ× relative to its calibrated baseline value. Dots indicate baseline
values.
The cross-market cost parameter Γ× also provides a natural interpretation for cross-country
heterogeneity. The cross-country heterogeneity documented in our stylized facts can be ra-
tionalized through variation in effective Γ× across countries. In economies with open capital
accounts, global intermediaries can offset locally-acquired currency exposure through their
international operations. This ability to manage currency risk globally reduces the effective
cross-market cost. By contrast, in economies with binding capital controls, intermediaries face
regulatory and legal barriers to transferring positions offshore. Capital controls therefore raise
the effective Γ× by preventing the international diversification of intermediary balance sheets.
The counterfactual results in Panel A indicate that such variation in Γ× can generate substantial
differences in spillover magnitudes: moving from a low-Γ× environment (open capital account)
30to a high-Γ× environment (binding capital controls) could more than double the CIP spillover
from stablecoin shocks.
Appendix E discusses the effects of increasing stablecoin-specific costs (Γ𝑠𝑐 ) and of increas-
ing stablecoin demand elasticity (𝛼𝑠𝑐).
Policy implications. The counterfactual analysis yields two policy implications. First, the
magnitude of spillovers depends critically on intermediary balance sheet linkages. Policies that
affect Γ×, such as capital requirements that treat stablecoin and swap exposures as substitutes,
will directly influence how stablecoin market stress transmits to traditional foreign exchange
markets. Specifically, capital frameworks that permit netting of stablecoin and FX swap
exposures would lower the effective Γ× and dampen spillovers, while ring-fencing crypto
activities into separately capitalized entities would eliminate the balance sheet link altogether
(atthecostofreducingcross-marketliquidityprovision). Second,thefindingthatCIPspillovers
nearlyvanishwhen Γ× → 0suggeststhatmarketsegmentation, whilepotentiallycostlyinterms
ofallocativeefficiency,wouldlimitcontagionfromstablecoinmarketstotraditionalFXmarkets.
## 6.3 Dynamic counterfactuals
Dynamic model. This subsection extends the baseline model to incorporate demand persis-
tence and intermediary balance sheet dynamics,20 delivering three results. First, the dynamic
model generates impulse responses whose shape and persistence closely match our empiri-
cal estimates. Second, it shows that spillovers are state-dependent: identical shocks produce
larger effects when intermediary balance sheets are impaired. Third, doubling cross-market
frictions amplifies spillovers more than proportionally through a feedback loop between prices
and wealth. Appendix F provides the full specification.
There are two new assumptions. First, stablecoin demand ¯ 𝐷𝑠𝑐
𝑡 follow an AR(1) process that
generates autocorrelation so shocks decay gradually rather than revert immediately. Second,
wealth (𝑊𝑡) is a key state variable for the intermediary’s problem: she evaluates her portfolio
composition in synthetic dollars and stablecoins relative to capital and constrained by the law
of motion of wealth.
Intermediary problem with wealth-dependent risk capacity. The representative interme-
diary enters period 𝑡 with wealth 𝑊𝑡 and chooses positions in synthetic dollar intermediation
20The extension draws on the intermediary asset pricing literature, particularly He and Krishnamurthy (2013),
who demonstrate that when financial intermediaries face equity capital constraints, risk premia become state-
dependent and exhibit nonlinear dynamics during crises. In the international finance context, Gabaix and
Maggiori (2015) show that capital flows drive exchange rates by altering the balance sheets of financiers who
bear currency risk, while Du et al. (2018) document that CIP deviations reflect the shadow cost of intermediary
balancesheetcapacity. Ourdynamicextensioncapturesthesemechanismsinatractableframeworkthatgenerates
persistent spillovers and state-dependent amplification.
31(𝐵
𝑠𝑦𝑛
𝑡 ) and stablecoin intermediation (𝐵𝑠𝑐
𝑡 ). The key departure from the static model is that the
intermediary’s costs are scaled by wealth, capturing the idea that positions must be evaluated
relative to capital. The intermediary solves:
max
𝐵
𝑠𝑦𝑛
𝑡 ,𝐵𝑠𝑐
𝑡
𝛿𝑡𝐵
𝑠𝑦𝑛
𝑡 + 𝑦𝑡𝐵𝑠𝑐
𝑡 −
Γ𝛿
2𝑊𝑡
(𝐵
𝑠𝑦𝑛
𝑡 )2
−
Γ𝑠𝑐
2𝑊𝑡
(𝐵𝑠𝑐
𝑡 )2
−
Γ×
2𝑊𝑡
(𝐵
𝑠𝑦𝑛
𝑡 + 𝐵𝑠𝑐
𝑡 )2
(35)
The scaling by 𝑊𝑡 in the cost terms admits a natural interpretation: a given dollar position
representsgreaterriskexposurewhenmeasuredagainstasmallercapitalbase. Anintermediary
with $10 billion in capital can comfortably absorb losses on a $1 billion position; the same
position would be precarious for an intermediary with only $2 billion. This formulation
is analogous to measuring portfolio risk relative to equity, as in the Value-at-Risk (VaR)-
constraint literature (Brunnermeier and Pedersen, 2009; Adrian and Shin, 2014), and captures
the risk-bearing capacity mechanism emphasized by Gabaix and Maggiori (2015).
Wealth dynamics. Intermediary wealth evolves with portfolio returns:
𝑊𝑡+1 = 𝑊𝑡

1+
𝐵
𝑠𝑦𝑛
𝑡
𝑊𝑡
𝛿𝑡 +
𝐵𝑠𝑐
𝑡
𝑊𝑡
𝑦𝑡 − 𝜙 · Δ𝑠𝑡

= 𝑊𝑡 1+ 𝑏
𝑠𝑦𝑛
𝑡 𝛿𝑡 + 𝑏𝑠𝑐
𝑡 𝑦𝑡 − 𝜙 · Δ𝑠𝑡

(36)
where 𝜙 captures the intermediary’s net foreign exchange exposure and Δ𝑠𝑡 is the rate of
exchange rate depreciation. The position-to-wealth ratios 𝑏
𝑠𝑦𝑛
𝑡 and 𝑏𝑠𝑐
𝑡 determine how portfolio
returns translate into wealth growth.
This specification creates scope for amplification. Adverse shocks that raise the stablecoin
parity deviation 𝑦𝑡 and lower 𝛿𝑡 (increasing the dollar premium) may generate mark-to-market
losses that deplete wealth. With reduced wealth, the intermediary’s risk-bearing capacity falls,
positions contract, and prices must adjust further to clear markets. This feedback loop is
the central mechanism in He and Krishnamurthy (2013): losses reduce capacity, and reduced
capacity sustains elevated prices.
In equilibrium, prices (𝑦𝑡,𝛿𝑡,𝑠𝑡) are a function of 𝑊𝑡 and stablecoin demand ¯ 𝐷𝑠𝑐
𝑡 given the
cost parameters Γ. The key comparative statics are 𝜕𝑦𝑡/𝜕𝑊𝑡 < 0 and 𝜕𝛿𝑡/𝜕𝑊𝑡 > 0: lower
intermediary wealth implies higher stablecoin parity deviations and lower CIP deviations (a
higher dollar premium). Intuitively, when the intermediary has less capital, it supplies less
risk-bearing capacity to the market. With reduced supply of intermediation, prices must adjust
to equilibrate demand.
Figure 7 displays the impulse response to a one percent stablecoin demand shock relative to
the initial steady state.21 The shock generates impact effects of34 basis points forthe stablecoin
21Appendix F.3 presents the calibration. Static parameters are taken from the main text, while dynamic parameters
(stablecoin demand persistence, FX exposure, and steady-state wealth) are chosen to match empirical features of
stablecoin markets and intermediary balance sheets.
32paritydeviation 𝑦, −5basispointsfortheCIPdeviation 𝛿 (ahigherdollarpremium), and5basis
points for exchange rate depreciation 𝑠. These impact effects equal those of the static model,
since at steady-state wealth the dynamic model nests the static framework.
Figure 7: Impulse response to a one percent stablecoin demand shock from steady state.
Note: The upper panels display the stablecoin parity deviation (left) and CIP deviation (right, where negative
values indicate a higher dollar premium) in basis points. The lower panels show exchange rate depreciation (left,
basis points) and intermediary wealth (right, percent deviation from steady state). The blue shade represents the
direct effect of stablecoin demand shocks, and the pink shade shows the amplification through intermediaries’
wealth effects.
A key prediction of the model is that identical shocks generate larger price responses when
intermediary balance sheets are impaired. This property follows directly from the equilibrium
structure: with the stablecoin parity deviation scaling as 1/𝑊𝑡 and the CIP deviation scaling
as 𝑊𝑡, lower wealth translates mechanically into higher stablecoin parity deviations, larger
dollar premia, and further FX depreciation. Endogenous wealth depletion introduce further
persistence of demand shocks and its spillovers, in line with our empirical findings.
Dynamic response to market friction shocks. The static analysis identified the cross-market
cost Γ× as the key parameter governing spillovers from stablecoin markets to CIP deviations.
The dynamic model amplifies this role through the balance sheet channel. Figure 8 compares
impulse responses under the baseline calibration to a counterfactual with doubled cross-market
costs.
33Figure 8: Impulse responses under baseline and doubled cross-market costs (2× Γ×)
Notes: Solid lines show baseline responses; dashed red lines show responses under higher
cross-market frictions.
Doubling Γ× increases the impact effect on the stablecoin parity deviation by about 5 basis
points. TheCIPspilloverincreasesfrom−6to−9basispoints,nearlya50percentincreaseinthe
dollar premium. The more-than-proportional increase in CIP spillovers reflects compounding
through the balance sheet channel: higher Γ× generates larger initial price responses, which
cause greater wealth depletion, which further amplifies subsequent price dynamics.
The dynamic model strengthens the case for policy attention to cross-market frictions. The
dynamic extension shows that reducing these frictions yields compounding benefits: smaller
spillovers preserve intermediary capital, which sustains risk-bearing capacity, which further
dampens price responses to future shocks.
Rundynamicsandamplification. Inanadditionalextension(AppendixF.8), weincorporate
redemptionfrictionsthatamplifyduringstress. Whenflowshockscoincidewithfrictionshocks
(as during the Terra/Luna collapse or the SVB-induced USDC depeg) the interaction between
redemption costs and balance sheet depletion can multiply baseline spillover effects severalfold,
underscoring that stablecoin-to-FX transmission can escalate sharply during crisis episodes.
347 Conclusion
Thispaperprovidesnewsystematicevidenceofacausallinkbetweenthecrypto-basedfinancial
system and traditional foreign exchange markets. Using granular data on four USD-pegged
stablecoinsand27fiatcurrencies,wedocumentsubstantialparitydeviationsbetweenstablecoin
and traditional FX venues and show that exogenous shocks to stablecoin inflows, identified via
a granular instrumental variable strategy, cause these deviations to widen, depreciate the local
currency, and impair synthetic dollar funding conditions. A model of segmented arbitrage
rationalizes these findings and provides structural foundations for the identification strategy:
theIVcoefficientsmapdirectlytothemarginalcostofintermediation,thecross-marketspillover
intensity, and a market integration test.
The spillover ratio we estimate (approximately 0.15) indicates that roughly one-sixth of sta-
blecoin price pressure transmits to synthetic dollar funding costs, affecting banks, corporates,
and sovereigns that rely on FX swaps regardless of whether they participate in crypto mar-
kets. Counterfactual exercises show that cross-market frictions are the primary determinant
of spillover magnitude, and a dynamic extension reveals that propagation is state-dependent:
depleted intermediary capital amplifies price responses, and when flow shocks coincide with
redemption frictions, spillover effects can reach several multiples of the baseline.
These results point to two policy directions. First, prudential requirements on stablecoin
intermediaries, such as capital buffers, reserve liquidity mandates, and limits on concentrated
currency exposures, would shrink the spillover channel at its source by reducing cross-market
frictions and preserving risk-bearing capacity. Second, policymakers responsible for currency
stability, particularly in emerging markets, could consider incorporating stablecoin market
monitoring into their macroprudential surveillance, since the transmission mechanism runs
through balance sheets that also serve traditional FX swap markets. Monitoring the evolution
of the spillover ratio as stablecoin markets grow would provide an early warning indicator of
increasing interconnectedness.
Our work opens several avenues for future research, including investigating how spillover
magnitudes vary with capital account openness, exchange rate regime, and local FX market
depth; analyzing how stablecoin design features (algorithmic vs. reserve-backed vs. CBDC)
map into different intermediation costs and spillover profiles; tracking the spillover ratio over
time as a gauge of crypto–FX integration; and studying whether stablecoin flows weaken the
effectiveness of monetary policy and capital flow management measures in economies where
they offer an alternative channel for cross-border capital movements.
35References
Adrian, T. and H. S. Shin (2014): “Procyclical Leverage and Value-at-Risk,” Review of
Financial Studies, 27, 373–403.
Ahmad, W., A. M. Kutan, and S. Gupta (2025): “Bitcoin Adoption and Price Elasticity of
Demand: Cross-Country Insights,” Humanities and Social Sciences Communications, 12,
Article 1028.
Ahmed, R. and I. Aldasoro (2025): “Stablecoins and safe asset prices,” BIS Working Paper
1279.
Ahmed, R., I. Aldasoro, and C. Duley (2025): “Public information and stablecoin runs,”
BIS Working Paper 1164.
Auer, R., U. Lewrick, and J. Paulick (2025): “DeFiying gravity? An empirical analysis of
cross-border Bitcoin, Ether and stablecoin flows,” BIS Working Paper 1265.
Avdjiev,S.,W.Du,C.Koch,andH.S.Shin(2019): “Thedollar,bankleverage,anddeviations
from covered interest parity,” American Economic Review: Insights, 1, 193–208.
Azar, P. D., G. Baughman, F. Carapella, J. Gerszten, A. Lubis, J. P. Perez-Sangimino,
D. E. Rappoport, C. Scotti, N. Swem, A. Vardoulakis, et al. (2022): “The financial
stability implications of digital assets,” Tech. rep., Staff Reports.
Barthelemy, J., P. Gardin, and B. Nguyen (2023): “Stablecoins and the Financing of the
Real Economy,” Banque de France Working Paper 908.
Baughman, G., F. Carapella, J. Gerszten, and D. C. Mills (2022): “The Stable in Stable-
coins,” FEDS Notes 2022-12-17, Board of Governors of the Federal Reserve System.
Benetton, M. and G. Compiani (2024): “Investors’ Beliefs and Cryptocurrency Prices,” The
Review of Asset Pricing Studies, 14, 197–236.
Bertsch,C.(2023): “Stablecoins: AdoptionandFragility,”WorkingPaperSeries423,Sveriges
Riksbank (Central Bank of Sweden).
Borio, C., R. McCauley, P. McGuire, and V. Sushko (2016): “Covered interest parity lost:
understanding the cross-currency basis,” BIS Quarterly Review, 45–64.
Brunnermeier, M.K.andL.H.Pedersen(2009): “MarketLiquidityandFundingLiquidity,”
Review of Financial Studies, 22, 2201–2238.
D’Avernas, A., V. Maurin, and Q. Vandeweyer (2023): “Can Stablecoins Be Stable?”
Working paper, (available at SSRN).
Du, W., A. Tepper, and A. Verdelhan (2018): “Deviations from Covered Interest Rate
Parity,” The Journal of Finance, 73, 915–957.
Franz, F.-C. and A. Valentin (2020): “Crypto covered interest parity deviations,” Available
at SSRN 3702212.
Gabaix, X.andR.S.J.Koijen(2024): “GranularInstrumentalVariables,” JournalofPolitical
Economy, 132, 2274–2303.
36Gabaix, X.andM.Maggiori(2015): “InternationalLiquidityandExchangeRateDynamics,”
The Quarterly Journal of Economics, 130, 1369–1420.
Goel, T., U. Lewrick, and I. Agarwal (2025): “Making stablecoins stable(r): Can regulation
help?” Available at SSRN: https://ssrn.com/abstract=5070116.
Gorton, G. B., E. C. Klee, C. P. Ross, S. Y. Ross, and A. P. Vardoulakis (2026): “Leverage
and Stablecoin Pegs,” Journal of Financial and Quantitative Analysis, 61, 99–136.
Gorton, G. B., C. P. Ross, and S. Y. Ross (2025): “Making Money,” Working paper.
Graf von Luckner, C., C. M. Reinhart, and K. Rogoff (2023): “Decrypting new age
international capital flows,” Journal of Monetary Economics, 138, 104–122.
Graf von Luckner, C. M., R. Koepke, and S. Sgherri (2024): “Crypto as a marketplace for
capital flight,” IMF Working Papers 2024/133, International Monetary Fund.
He, Z. and A. Krishnamurthy (2013): “Intermediary Asset Pricing,” American Economic
Review, 103, 732–770.
Itskhoki, O. and D. Mukhin (2021): “Exchange Rate Disconnect in General Equilibrium,”
Journal of Political Economy, 129, 2183–2232.
Kaiko Research (2025): “Stablecoin Dominance & Market Liquidity,” .
Kalemli-Özcan, Ş. and L. Varela (2024): “Five Facts about the UIP Premium,” Mimeo.
Kim, S. (2025a): “How the Cryptocurrency Market is Connected to the Financial Market,”
working paper.
——— (2025b): “Macro-Financial Impact of Stablecoin’s Demand for Treasuries,” working
paper.
Lyons, R. K. and G. Viswanath-Natraj (2023): “What keeps stablecoins stable?” Journal
of International Money and Finance, 131, 102777.
Ma,Y.,Z.Yeng,andA.L.Zhang(2023): “Stablecoinrunsandthecentralizationofarbitrage,”
Working paper, (available at SSRN).
Makarov, I. and A. Schoar (2020): “Trading and arbitrage in cryptocurrency markets,”
Journal of Financial Economics, 135, 293–319.
Reuter, M. (2025): “Decrypting Crypto: How to Estimate International Stablecoin Flows,”
IMF Working Paper 2025/141, International Monetary Fund.
Rime, D., A. Schrimpf, and O. Syrstad (2022): “Covered Interest Parity Arbitrage,” The
Review of Financial Studies, 35, 5185–5227.
Schmeling, M., A. Schrimpf, and K. Todorov (2023): “Crypto carry,” BIS Working Papers
1087, Bank for International Settlements.
Shleifer, A. and R. W. Vishny (1997): “The Limits of Arbitrage,” The Journal of Finance,
52, 35–55.
Sushko, V., C. Borio, R. N. McCauley, and P. McGuire (2016): “The failure of covered
interest parity: FX hedging demand and costly balance sheets,” BIS Working Papers 590,
Bank for International Settlements.
37A Shock structure and endogeneity
To understand why OLS regressions fail to identify causal effects, and why our instrument
succeeds, we must be explicit about the sources of variation driving demand on each stablecoin
exchange book. Recall that net demand pressure on book 𝑓 combines local household demand
and cross-book participant demand,
¯ 𝜌𝑠𝑐
𝑓 = ¯ 𝐷𝑠𝑐
𝑓 + 𝑆𝑠𝑐
𝑓 . (37)
We decompose this into common and idiosyncratic components. Local household demand has
the structure
¯ 𝐷𝑠𝑐
𝑓 = ¯ 𝐷0 + 𝜙𝜇 +𝑢𝐷
𝑓 , (38)
where ¯ 𝐷0 is baseline demand common to all countries, 𝜙𝜇 captures exposure to global shocks
𝜇 that affect all countries simultaneously (such as a flight to dollar safety during global risk-
off episodes or a surge in crypto adoption following a major platform launch), and 𝑢𝐷
𝑓 is an
idiosyncratic local household shock specific to country 𝑓, reflecting local currency instability,
country-specific regulatory changes, or localized growth in crypto payment infrastructure.
Cross-book participant demand on book 𝑓 has the decomposition
𝑆𝑠𝑐
𝑓 = ¯ 𝑆𝑠𝑐
𝑓 + 𝑣𝑓 ,
∑︁
𝑓
𝑣𝑓 = 0, (39)
where ¯ 𝑆𝑠𝑐
𝑓 isthebaselineallocationand 𝑣𝑓 capturesidiosyncraticreallocationdrivenbyurgency
shocks in other countries. The zero-sum property follows from the budget constraint
Í
𝑓 𝑆𝑠𝑐
𝑓 =
𝑊.
Combining these expressions, total demand on book 𝑓 is
˜ 𝐷𝑠𝑐
𝑓 ≡ ¯ 𝐷𝑠𝑐
𝑓 + 𝑆𝑠𝑐
𝑓 = ( ¯ 𝐷0 + ¯ 𝑆𝑠𝑐
𝑓 ) + 𝜙𝜇 + ˜ 𝑢𝑓 , (40)
where ˜ 𝑢𝑓 ≡ 𝑢𝐷
𝑓 + 𝑣𝑓 is the idiosyncratic component of total demand on book 𝑓, combining
local household shocks and cross-book reallocation.
The identification challenge is that stablecoins are not the only channel through which these
shocks affect prices. Global and local shocks also influence stablecoin parity deviations, CIP
38deviations, and exchange rates through channels unrelated to stablecoin intermediation,
𝑦𝑓 = 𝑦𝑠𝑐
𝑓 ( ¯ 𝜌𝑠𝑐
𝑓 )
| {z }
stablecoin channel
+ 𝜉𝑦𝜇
|{z}
global shock
+ 𝜀
𝑦
𝑓
|{z}
local factors
(41)
𝛿𝑓 = 𝛿𝑠𝑐
𝑓 ( ¯ 𝜌𝑠𝑐
𝑓 )
| {z }
stablecoin channel
− 𝜉𝛿𝜇
|{z}
global shock
− 𝜀𝛿
𝑓
|{z}
local factors
(42)
𝑠𝑓 = 𝑠𝑠𝑐
𝑓 ( ¯ 𝜌𝑠𝑐
𝑓 )
| {z }
stablecoin channel
+ 𝜉𝑠𝜇
|{z}
global shock
+ 𝜀𝑠
𝑓
|{z}
local factors
(43)
The first term in each equation, derived from the equilibrium in Proposition 1, captures how
stablecoinmarketconditionsaffectpricesthroughtheintermediary’sbalancesheet. Thesecond
term captures direct effects of global shocks. A flight to safety (𝜇 > 0) may independently
widen CIP deviations (make 𝛿 more negative, hence the negative sign with 𝜉𝛿 > 0) as global
banks reduce dollar lending, and depreciate emerging market currencies (𝜉𝑠 > 0) through
portfolio rebalancing, even holding fixed the stablecoin channel. The third term captures local
factors unrelated to stablecoins, such as domestic monetary policy surprises, local banking
sector stress, or terms-of-trade shocks.
We formalize the correlation structure of these shocks.
Assumption 1 (Shock structure). The shocks satisfy:
(i) Idiosyncratic total demand shocks are independent across countries: Cov(˜ 𝑢𝑓 , ˜ 𝑢𝑓′) = 0
for 𝑓 ≠ 𝑓′.
(ii) Idiosyncratictotaldemandshocksarecorrelatedwithlocalunobservables: Cov(˜ 𝑢𝑓 ,𝜀
𝑦
𝑓 ) =
𝜎
𝑦
˜ 𝑢𝜀 ≠ 0, and similarly for 𝛿 and 𝑠.
(iii) Idiosyncratic total demand shocks in country 𝑓 are uncorrelated with unobservables in
other countries: Cov(˜ 𝑢𝑓 ,𝜀
𝑦
𝑓′) = 0 for 𝑓 ≠ 𝑓′.
Condition (i) states that idiosyncratic events driving total demand on one country’s book are
unrelated to those on another. This follows from two properties. Local household shocks 𝑢𝐷
𝑓
are idiosyncratic by nature. Cross-book reallocation shocks 𝑣𝑓 are driven by urgency in other
countries (𝑣𝑓 = 𝑣𝑓 (𝜃−𝑓 )), so that 𝑣𝑓 and 𝑣𝑓′ are uncorrelated conditional on having purged
the common factor 𝜇.22 Condition (ii) is the source of endogeneity that invalidates OLS. The
same local events that drive stablecoin demand also affect prices through other channels. For
example, an episode of local currency instability may simultaneously trigger capital flight into
stablecoins (raising ˜ 𝑢𝑓 ) and widen CIP deviations through reduced intermediation capacity
(contributing to 𝜀𝛿
𝑓 ). Condition (iii) states that while local shocks create correlation between
22Formally, Cov(˜ 𝑢𝑓 , ˜ 𝑢𝑓′) = Cov(𝑢𝐷
𝑓 ,𝑢𝐷
𝑓′) +Cov(𝑢𝐷
𝑓 ,𝑣𝑓′) +Cov(𝑣𝑓 ,𝑢𝐷
𝑓′) +Cov(𝑣𝑓 ,𝑣𝑓′). The first three terms are
zero by independence of idiosyncratic local shocks and reallocation shocks. The last term is zero after factor
purging removes common components, since 𝑣𝑓 depends on urgency shocks 𝜃− 𝑓 while 𝑣𝑓′ depends on 𝜃− 𝑓′.
39demand and prices within a country, they do not create correlation across countries. This
restriction enables our identification strategy.
B OLS bias
Consider regressing prices on stablecoin flows 𝑔𝑓 ≡ 𝐵𝑠𝑐
𝑓 . To see why OLS is biased, note that
flows depend on both demand conditions and equilibrium prices. From market clearing,
𝑔𝑓 = ¯ 𝜌𝑠𝑐
𝑓 − 𝛼𝑠𝑐𝑦𝑓 . (44)
Substituting the price equation (41) and using 𝜕𝑦𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐 = 𝑁𝑦/Δ from Proposition 1,
𝑔𝑓 = 𝛾𝑔 ¯ 𝜌𝑠𝑐
𝑓 − 𝛼𝑠𝑐(𝜉𝑦𝜇 + 𝜀
𝑦
𝑓 ), (45)
where 𝛾𝑔 ≡ 1− 𝛼𝑠𝑐(𝑁𝑦/Δ) = 𝐴𝛿/Δ > 0 captures how much of a demand shock translates into
flows after accounting for the endogenous price response. Flows thus inherit variation from
three sources: idiosyncratic demand shocks ˜ 𝑢𝑓 (embedded in ¯ 𝜌𝑠𝑐
𝑓 ), global shocks 𝜇, and local
price determinants 𝜀
𝑦
𝑓 . The latter two create bias.
Proposition 5 (OLS bias). Under Assumption 1, the OLS coefficient from regressing 𝛿𝑓 on 𝑔𝑓
is
𝛽𝑂𝐿𝑆
𝛿 = −
Γ×
𝐴𝛿
|{z}
𝛽𝐼𝑉
𝛿
+
−𝜙𝜉𝛿𝜎2
𝜇 − 𝜎𝛿
˜ 𝑢𝜀
Var(𝑔𝑓 )/𝛾𝑔
| {z }
bias
(46)
where 𝜎2
𝜇 = Var(𝜇), 𝜎𝛿
˜ 𝑢𝜀 = Cov(˜ 𝑢𝑓 ,𝜀𝛿
𝑓 ), and 𝛾𝑔 = 𝐴𝛿/Δ. Similarly for the stablecoin parity
deviation and exchange rate with analogous bias terms.
Proof. See Appendix C. □
The OLS bias can be decomposed into two distinct sources of confounding.
The first is global shock bias, arising from the term −𝜙𝜉𝛿𝜎2
𝜇. Global shocks affect both
stablecoin demand and prices through parallel channels. Consider a deterioration in global risk
sentiment (𝜇 > 0) that drives investors worldwide into dollar-denominated safe assets including
stablecoins (𝜙 > 0). The same risk-off environment independently widens CIP deviations
(makes 𝛿 more negative, with 𝜉𝛿 > 0) as global financial institutions tighten dollar lending
and reduce balance sheet exposure to emerging markets. OLS attributes the entire correlation
between flows and CIP to the stablecoin channel, overstating the causal effect.
The second is local confounding bias, arising from the term −𝜎𝛿
˜ 𝑢𝜀. Local factors that drive
total demand on a country’s book are often correlated with local price determinants. This
40correlation operates through two sub-channels. Through household demand (𝑢𝐷
𝑓 component
of ˜ 𝑢𝑓 ), a shock that erodes confidence in the domestic financial system causes households to
increase stablecoin holdings (𝑢𝐷
𝑓 rises) while the same shock widens CIP deviations as local
institutions lose access to dollar funding (𝜀𝛿
𝑓 rises, making 𝛿 more negative). Through cross-
book reallocation (𝑣𝑓 component of ˜ 𝑢𝑓 ), an urgency shock in country 𝑓 draws cross-book
participants toward book 𝑓 (𝑣𝑓 rises) while the same local stress widens CIP. In both cases,
OLS conflates the causal effect of stablecoins with correlated responses to the same underlying
shock.
The direction of OLS bias depends on the sign and magnitude of these correlations. In
crisis episodes, which may generate much of the high-frequency variation in our data, one
would typically expect stablecoin demand to rise with global stress as investors seek dollar
safety (𝜙 > 0), global stress to independently widen CIP as banks reduce dollar intermediation
(𝜉𝛿 > 0), and local stress to simultaneously raise total book demand and widen CIP (𝜎𝛿
˜ 𝑢𝜀 > 0).
This configuration implies that all bias terms push the OLS estimate to be more negative than
the true causal effect, so OLS likely overstates the spillover from stablecoins to CIP. As such,
the estimated effect partially reflects correlated responses to common shocks rather than causal
transmission through the stablecoin channel.
However, the bias could work in the opposite direction in other contexts. If stablecoin
adoption is driven by fintech innovation (𝑢𝐷
𝑓 > 0) in countries experiencing financial deepening
and improved market access (𝜀𝛿
𝑓 < 0, reflecting narrowing CIP), then 𝜎𝛿
˜ 𝑢𝜀 < 0 and OLS would
understate the causal effect. The sign of the bias is ultimately an empirical question, which
motivates our instrumental variable strategy that eliminates bias regardless of its direction.
B.1 Proof of Proposition 5
From the price equation (42) and the flow expression,
𝛿𝑓 = −
Γ×
Δ
¯ 𝜌𝑠𝑐
𝑓 + (terms in ¯ 𝜌𝑠𝑦𝑛
) − 𝜉𝛿𝜇 − 𝜀𝛿
𝑓
𝑔𝑓 = 𝛾𝑔 ¯ 𝜌𝑠𝑐
𝑓 − 𝛼𝑠𝑐(𝜉𝑦𝜇 + 𝜀
𝑦
𝑓 )
where ¯ 𝜌𝑠𝑐
𝑓 = ( ¯ 𝐷0 + ¯ 𝑆𝑠𝑐
𝑓 ) + 𝜙𝜇 + ˜ 𝑢𝑓 from the demand decomposition (40). We treat ¯ 𝜌𝑠𝑦𝑛 and
¯ 𝐷0 + ¯ 𝑆𝑠𝑐
𝑓 as non-stochastic conditional on country 𝑓’s baseline characteristics. The stochastic
components of interest are then
𝛿𝑓 − 𝐸[𝛿𝑓 ] = −
Γ×
Δ
(𝜙𝜇 + ˜ 𝑢𝑓 ) − 𝜉𝛿𝜇 − 𝜀𝛿
𝑓
𝑔𝑓 − 𝐸[𝑔𝑓 ] = 𝛾𝑔(𝜙𝜇 + ˜ 𝑢𝑓 ) − 𝛼𝑠𝑐(𝜉𝑦𝜇 + 𝜀
𝑦
𝑓 ).
41The OLS coefficient is 𝛽𝑂𝐿𝑆
𝛿 = Cov(𝛿𝑓 ,𝑔𝑓 )/Var(𝑔𝑓 ). Computing the numerator,
Cov(𝛿𝑓 ,𝑔𝑓 ) = −
Γ×
Δ
𝛾𝑔(𝜙2
𝜎2
𝜇 + 𝜎2
˜ 𝑢) +
𝛼𝑠𝑐Γ×
Δ
(𝜙𝜉𝑦𝜎2
𝜇 + 𝜎
𝑦
˜ 𝑢𝜀)
− 𝜉𝛿𝛾𝑔𝜙𝜎2
𝜇 + 𝛼𝑠𝑐𝜉𝛿𝜉𝑦𝜎2
𝜇 − 𝛾𝑔𝜎𝛿
˜ 𝑢𝜀 + 𝛼𝑠𝑐Cov(𝜀𝛿
𝑓 ,𝜀
𝑦
𝑓 ),
where 𝜎2
˜ 𝑢 = Var( ˜ 𝑢𝑓 ), 𝜎
𝑦
˜ 𝑢𝜀 = Cov(˜ 𝑢𝑓 ,𝜀
𝑦
𝑓 ), and 𝜎𝛿
˜ 𝑢𝜀 = Cov(˜ 𝑢𝑓 ,𝜀𝛿
𝑓 ).
The variance of flows is
Var(𝑔𝑓 ) = 𝛾2
𝑔(𝜙2
𝜎2
𝜇 + 𝜎2
˜ 𝑢) + 𝛼2
𝑠𝑐(𝜉2
𝑦𝜎2
𝜇 + 𝜎2
𝜀𝑦) −2𝛼𝑠𝑐𝛾𝑔(𝜙𝜉𝑦𝜎2
𝜇 + 𝜎
𝑦
˜ 𝑢𝜀).
To separate the causal component from the bias, write
Cov(𝛿𝑓 ,𝑔𝑓 ) = −
Γ×
Δ
·
Var(𝑔𝑓 )
𝛾𝑔
+

−𝜙𝜉𝛿𝜎2
𝜇 − 𝜎𝛿
˜ 𝑢𝜀 +h.o.t.

where the first term uses the identity Var(𝑔𝑓 )/𝛾𝑔 = 𝛾𝑔(𝜙2𝜎2
𝜇 + 𝜎2
˜ 𝑢) − 𝛼𝑠𝑐(𝜙𝜉𝑦𝜎2
𝜇 + 𝜎
𝑦
˜ 𝑢𝜀) +
(𝛼2
𝑠𝑐/𝛾𝑔)(𝜉2
𝑦𝜎2
𝜇 + 𝜎2
𝜀𝑦) and the higher-order terms (involving products of global and local pa-
rameters) are absorbed into Var(𝑔𝑓 ) upon division. Dividing through,
𝛽𝑂𝐿𝑆
𝛿 =
−Γ×/Δ
𝛾𝑔
+
−𝜙𝜉𝛿𝜎2
𝜇 − 𝜎𝛿
˜ 𝑢𝜀
Var(𝑔𝑓 )/𝛾𝑔
.
Using 𝛾𝑔 = 𝐴𝛿/Δ, the first term simplifies to −Γ×/𝐴𝛿 = 𝛽𝐼𝑉
𝛿 , yielding the stated expression.
□
Remark. The OLS bias for the parity deviation regression follows analogously. The coefficient
from regressing 𝑦𝑓 on 𝑔𝑓 is
𝛽𝑂𝐿𝑆
𝑦 =
𝑁𝑦
𝐴𝛿
|{z}
𝛽𝐼𝑉
𝑦
+
𝜙𝜉𝑦𝜎2
𝜇 + 𝜎
𝑦
˜ 𝑢𝜀
Var(𝑔𝑓 )/𝛾𝑔
. (47)
The sign of the global bias differs from the CIP case. Global risk-off shocks (𝜙 > 0, 𝜉𝑦 > 0)
push the OLS estimate above the true causaleffect forthe paritydeviation, sinceboth stablecoin
demand and parity deviations rise with global stress. The exchange rate OLS bias has structure
analogous to the CIP case.
42C Proofs
C.1 Proof of Proposition 1
Substituting market clearing 𝐵𝑠𝑐 = ¯ 𝜌𝑠𝑐 − 𝛼𝑠𝑐𝑦 and 𝐵𝑠𝑦𝑛 = ¯ 𝜌𝑠𝑦𝑛 + ˜ 𝛼𝛿𝛿 into the first-order
conditions (14)–(15):
−𝛿 = (Γ𝛿 + Γ×)( ¯ 𝜌𝑠𝑦𝑛
+ ˜ 𝛼𝛿𝛿) + Γ×( ¯ 𝜌𝑠𝑐
− 𝛼𝑠𝑐𝑦)
𝑦 = Γ×( ¯ 𝜌𝑠𝑦𝑛
+ ˜ 𝛼𝛿𝛿) + (Γ𝑠𝑐 + Γ×)( ¯ 𝜌𝑠𝑐
− 𝛼𝑠𝑐𝑦)
Expanding and collecting terms in the first equation:
−𝛿 − ˜ 𝛼𝛿(Γ𝛿 + Γ×)𝛿 = (Γ𝛿 + Γ×) ¯ 𝜌𝑠𝑦𝑛
+ Γ× ¯ 𝜌𝑠𝑐
− 𝛼𝑠𝑐Γ×𝑦
[1+ ˜ 𝛼𝛿(Γ𝛿 + Γ×)](−𝛿) = (Γ𝛿 + Γ×) ¯ 𝜌𝑠𝑦𝑛
+ Γ× ¯ 𝜌𝑠𝑐
− 𝛼𝑠𝑐Γ×𝑦
In the second equation:
𝑦 + 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×)𝑦 = (Γ𝑠𝑐 + Γ×) ¯ 𝜌𝑠𝑐
+ Γ× ¯ 𝜌𝑠𝑦𝑛
+ ˜ 𝛼𝛿Γ×𝛿
Using the definitions 𝐴𝛿 ≡ 1+ ˜ 𝛼𝛿(Γ𝛿 + Γ×), 𝐴𝑠𝑐 ≡ 1+ 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×), 𝐵 ≡ 𝛼𝑠𝑐Γ×, 𝐶 ≡ ˜ 𝛼𝛿Γ×,
and writing 𝛿 = −(−𝛿):
𝐴𝛿(−𝛿) + 𝐵 𝑦 = (Γ𝛿 + Γ×) ¯ 𝜌𝑠𝑦𝑛
+ Γ× ¯ 𝜌𝑠𝑐
≡ 𝑅𝛿
−𝐶 (−𝛿) + 𝐴𝑠𝑐 𝑦 = (Γ𝑠𝑐 + Γ×) ¯ 𝜌𝑠𝑐
+ Γ× ¯ 𝜌𝑠𝑦𝑛
≡ 𝑅𝑠𝑐
The determinant is Δ = 𝐴𝛿𝐴𝑠𝑐 − 𝐵𝐶 > 0. By Cramer’s rule:
(−𝛿)∗
=
𝐴𝑠𝑐𝑅𝛿 − 𝐵 𝑅𝑠𝑐
Δ
, 𝑦∗
=
𝐴𝛿𝑅𝑠𝑐 +𝐶 𝑅𝛿
Δ
Expanding 𝑦∗, the coefficient of ¯ 𝜌𝑠𝑐 is 𝐴𝛿(Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
× ≡ 𝑁𝑦. The coefficient of ¯ 𝜌𝑠𝑦𝑛
simplifies to:
𝐴𝛿Γ× − ˜ 𝛼𝛿Γ×(Γ𝛿 + Γ×) = Γ×[𝐴𝛿 − ˜ 𝛼𝛿(Γ𝛿 + Γ×)] = Γ×
Expanding (−𝛿)∗, the coefficient of ¯ 𝜌𝑠𝑦𝑛 is 𝐴𝑠𝑐(Γ𝛿 + Γ×) − 𝛼𝑠𝑐Γ2
× ≡ 𝑁𝛿. The coefficient of
¯ 𝜌𝑠𝑐 simplifies to:
𝐴𝑠𝑐Γ× − 𝛼𝑠𝑐Γ×(Γ𝑠𝑐 + Γ×) = Γ×[𝐴𝑠𝑐 − 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×)] = Γ×
This yields equations (16)–(17). The exchange rate follows from (13). □
43C.2 Proof of Proposition 2
Differentiating 𝑦∗ with respect to ¯ 𝜌𝑠𝑐:
𝜕𝑦∗
𝜕 ¯ 𝜌𝑠𝑐
=
𝑁𝑦
Δ
=
𝐴𝛿(Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
×
Δ
To verify 𝑁𝑦 > 0, expand:
𝑁𝑦 = [1+ ˜ 𝛼𝛿(Γ𝛿 + Γ×)](Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
×
= (Γ𝑠𝑐 + Γ×) + ˜ 𝛼𝛿

(Γ𝛿 + Γ×)(Γ𝑠𝑐 + Γ×) − Γ2
×

= (Γ𝑠𝑐 + Γ×) + ˜ 𝛼𝛿 [Γ𝛿Γ𝑠𝑐 + Γ𝛿Γ× + Γ×Γ𝑠𝑐] > 0
since all cost parameters and elasticities are non-negative. This proves Proposition 2 (i). □
Differentiating (−𝛿)∗ with respect to ¯ 𝜌𝑠𝑐:
𝜕(−𝛿)∗
𝜕 ¯ 𝜌𝑠𝑐
=
Γ×
Δ
so that:
𝜕𝛿∗
𝜕 ¯ 𝜌𝑠𝑐
= −
Γ×
Δ
This is strictly negative when Γ× > 0 (since Δ > 0) and zero when Γ× = 0, proving Proposition
2 (ii) and Corollary 1. □
For the exchange rate, differentiating (18) with respect to ¯ 𝜌𝑠𝑐:
𝜕𝑠∗
𝜕 ¯ 𝜌𝑠𝑐
=
1
𝜈𝑠

−𝜂𝛿
𝜕𝛿∗
𝜕 ¯ 𝜌𝑠𝑐
+𝜂𝑦
𝜕𝑦∗
𝜕 ¯ 𝜌𝑠𝑐

=
1
𝜈𝑠

𝜂𝛿
Γ×
Δ
+𝜂𝑦
𝑁𝑦
Δ

=
𝜂𝛿Γ× +𝜂𝑦𝑁𝑦
𝜈𝑠Δ
> 0
since 𝜂𝛿,𝜂𝑦,Γ×, 𝑁𝑦,𝜈𝑠,Δ are all positive. This proves Proposition 2 (ii). □
Proof of Proposition 3
Since ¯ 𝜌𝑠𝑐
𝐵 = ¯ 𝐷𝑠𝑐
𝐵 + 𝑆𝑠𝑐
𝐵 and ¯ 𝐷𝑠𝑐
𝐵 is unaffected by cross-book participant reallocation:
𝜕 ¯ 𝜌𝑠𝑐
𝐵
𝜕𝑆𝑠𝑐
𝐵
= 1
The results then follow directly from Proposition 2:
𝜕𝑦𝐵
𝜕𝑆𝑠𝑐
𝐵
=
𝜕𝑦∗
𝜕 ¯ 𝜌𝑠𝑐
> 0,
𝜕𝛿𝐵
𝜕𝑆𝑠𝑐
𝐵
=
𝜕𝛿∗
𝜕 ¯ 𝜌𝑠𝑐
< 0,
𝜕𝑠𝐵
𝜕𝑆𝑠𝑐
𝐵
=
𝜕𝑠∗
𝜕 ¯ 𝜌𝑠𝑐
> 0
44When 𝑆𝑠𝑐
𝐵 falls due to reallocation toward country 𝐴, all effects reverse sign: country 𝐵’s
stablecoin parity deviation falls, its CIP deviation narrows (lower dollar premium), and its
currency appreciates. □
C.3 Proof of Proposition 5
From the model with shock structure (38)–(43):
𝑦𝑓 =
𝜕𝑦𝑠𝑐
𝜕 ¯ 𝜌𝑠𝑐
( ¯ 𝐷0 + 𝜙𝜇 +𝑢𝑓 − ˜ 𝑆𝑠𝑐
𝑓 ) + 𝜉𝑦𝜇 + 𝜀
𝑦
𝑓
𝑔𝑓 = 𝛾𝑔( ¯ 𝐷0 + 𝜙𝜇 +𝑢𝑓 − ˜ 𝑆𝑠𝑐
𝑓 ) − 𝛼𝑠𝑐(𝜉𝑦𝜇 + 𝜀
𝑦
𝑓 )
The OLS coefficient is 𝛽𝑂𝐿𝑆
𝑦 = Cov(𝑦𝑓 ,𝑔𝑓 )/Var(𝑔𝑓 ). Computing:
Cov(𝑦𝑓 ,𝑔𝑓 ) =
𝜕𝑦𝑠𝑐
𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔(𝜙2
𝜎2
𝜇 + 𝜎2
𝑢) + 𝜙𝜉𝑦𝛾𝑔𝜎2
𝜇
− 𝛼𝑠𝑐
𝜕𝑦𝑠𝑐
𝜕 ¯ 𝜌𝑠𝑐
(𝜉𝑦𝜙𝜎2
𝜇 + 𝜎
𝑦
𝑢𝜀) +other terms
After simplification, the bias terms emerge as stated. □
C.4 Proof of Proposition 4
TheGIV𝑍𝑓 =
Í
𝑓′≠𝑓 𝑤𝑓′ ˜ 𝑢𝑓′ satisfiesCov(𝑍𝑓 , 𝜇) = 0(excludescommonshock),Cov(𝑍𝑓 ,𝑢𝑓 ) =
0 (excludes own shock), and Cov(𝑍𝑓 ,𝜀𝑓 ) = 0 (Assumption 1(iii)).
Therefore:
Cov(𝑦𝑓 , 𝑍𝑓 ) =
𝜕𝑦𝑠𝑐
𝜕 ¯ 𝜌𝑠𝑐
· Cov( ¯ 𝜌𝑠𝑐
𝑓 , 𝑍𝑓 )
Cov(𝑔𝑓 , 𝑍𝑓 ) = 𝛾𝑔 · Cov( ¯ 𝜌𝑠𝑐
𝑓 , 𝑍𝑓 )
where 𝛾𝑔 ≡ 1− 𝛼𝑠𝑐(𝜕𝑦𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐) = 1− 𝛼𝑠𝑐𝑁𝑦/Δ = (Δ− 𝛼𝑠𝑐𝑁𝑦)/Δ.
We show that Δ− 𝛼𝑠𝑐𝑁𝑦 = 𝐴𝛿:
Δ− 𝛼𝑠𝑐𝑁𝑦 = 𝐴𝛿𝐴𝑠𝑐 − 𝐵𝐶 − 𝛼𝑠𝑐

𝐴𝛿(Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
×

= 𝐴𝛿 [𝐴𝑠𝑐 − 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×)] − 𝛼𝑠𝑐 ˜ 𝛼𝛿Γ2
× + 𝛼𝑠𝑐 ˜ 𝛼𝛿Γ2
×
= 𝐴𝛿 · 1 = 𝐴𝛿
using 𝐴𝑠𝑐 − 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×) = 1 and 𝐵𝐶 = 𝛼𝑠𝑐 ˜ 𝛼𝛿Γ2
×.
Therefore 𝛾𝑔 = 𝐴𝛿/Δ, and the IV coefficients are:
45Part (i).
𝛽𝐼𝑉
𝑦 =
𝜕𝑦𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔
=
𝑁𝑦/Δ
𝐴𝛿/Δ
=
𝑁𝑦
𝐴𝛿
Part (ii).
𝛽𝐼𝑉
𝛿 =
𝜕𝛿𝑠𝑐/𝜕 ¯ 𝜌𝑠𝑐
𝛾𝑔
=
−Γ×/Δ
𝐴𝛿/Δ
= −
Γ×
𝐴𝛿
Part (iii). Follows from the exchange rate equation and parts (i)–(ii).
Part (iv). The ratio:
|𝛽𝐼𝑉
𝛿 |
𝛽𝐼𝑉
𝑦
=
Γ×/𝐴𝛿
𝑁𝑦/𝐴𝛿
=
Γ×
𝑁𝑦
To verify Γ×/𝑁𝑦 < 1, note that:
𝑁𝑦 = (Γ𝑠𝑐 + Γ×) + ˜ 𝛼𝛿(Γ𝛿Γ𝑠𝑐 + Γ𝛿Γ× + Γ×Γ𝑠𝑐) > Γ×
since Γ𝑠𝑐 > 0, so Γ×/𝑁𝑦 < 1. The ratio is strictly positive when Γ× > 0 and zero when Γ× = 0.
□
D Alternative model specification: Segmented households
This appendix develops an alternative specification in which households are segmented into
two types: traditional households who access only the spot and swap market, and crypto-native
households who access only the stablecoin market. This specification may be appropriate when
institutional barriers prevent certain households from accessing certain markets.
D.1 Setup
Traditional households. Traditional households (mass 𝜇𝑇) have access to spot FX and FX
swaps but cannot hold stablecoins. This may reflect regulatory restrictions on cryptocurrency
holdings in certain jurisdictions, lack of access to crypto infrastructure (wallets, exchanges,
on-ramps), institutional mandates that prohibit digital asset exposure, or simple unfamiliarity
with blockchain technology. These households demand synthetic dollars for hedging, trade
finance and treasury management:
𝐷𝑇
= ¯ 𝐷𝑇
+ 𝛼𝑇𝛿 (48)
where ¯ 𝐷𝑇 captures baseline hedging needs and 𝛼𝑇 > 0 is the demand elasticity with respect
to the CIP deviation. When 𝛿 falls (synthetic dollars become more expensive), demand for
synthetic dollars decreases.
46Crypto-native households. Crypto-native households (mass 𝜇𝐶) have access to spot FX and
stablecoins but cannot access swap markets. This may reflect lack of banking relationships re-
quiredforswapmarketparticipation,failuretomeetminimumsizerequirementsforinstitutional
FX markets, exclusion from traditional financial infrastructure due to informal employment or
lack of credit history, or preference for decentralized financial infrastructure. These house-
holds demand stablecoins for remittances, e-commerce, capital preservation, and participation
in decentralized finance:
𝐷𝐶
= ¯ 𝐷𝐶
− 𝛼𝐶𝑦 (49)
where ¯ 𝐷𝐶 captures baseline demand for on-chain dollar access and 𝛼𝐶 is the demand elasticity
with respect to the stablecoin parity deviation.
D.2 Market clearing
The stablecoin market clears when crypto-native demand equals relative supply plus interme-
diary provision:
𝐷𝐶
= ˜ 𝑆𝑠𝑐
+ 𝐵𝑠𝑐
(50)
Substituting the demand function and defining ¯ 𝜌𝑠𝑐 ≡ ¯ 𝐷𝐶 − ˜ 𝑆𝑠𝑐:
𝐵𝑠𝑐
= ¯ 𝜌𝑠𝑐
− 𝛼𝐶𝑦 (51)
The swap market clears when traditional demand equals US supply plus intermediary provi-
sion:
𝐷𝑇
= 𝐿𝑈𝑆
+ 𝐵𝑠𝑦𝑛
(52)
Defining ¯ 𝜌𝑠𝑦𝑛 ≡ ¯ 𝐷𝑇 − ¯ 𝐿 and ˜ 𝛼𝛿 ≡ 𝛼𝑇 + 𝛼𝐿:
𝐵𝑠𝑦𝑛
= ¯ 𝜌𝑠𝑦𝑛
+ ˜ 𝛼𝛿𝛿 (53)
The spot market clears as before, with both household types participating:
𝑄𝑠𝑝𝑜𝑡
= ¯ 𝑄 −𝜂𝛿𝛿 +𝜂𝑦𝑦 − 𝜈𝑠𝑠 = 0 (54)
47D.3 Equilibrium
With the same intermediary cost function as in the main text, the intermediary’s first-order
conditions are unchanged. The equilibrium therefore has identical mathematical structure:
𝛿∗
=
𝐴𝑠𝑐𝑅𝛿 − 𝐵𝑅𝑠𝑐
Δ
(55)
𝑦∗
=
𝐴𝛿𝑅𝑠𝑐 +𝐶𝑅𝛿
Δ
(56)
where now 𝛼𝑠𝑐 = 𝛼𝐶, ˜ 𝛼𝛿 = 𝛼𝑇 + 𝛼𝐿, and all composite parameters are defined as before with
these substitutions.
All comparative statics results from Section 4 carry over. In particular, stablecoin demand
shocks (now interpreted as shocks to crypto-native demand ¯ 𝐷𝐶) raise stablecoin parity devia-
tions, lower CIP deviations (increasing the dollar premium) when Γ× > 0, and depreciate the
local currency.
D.4 Equivalence of reduced forms
The segmented and integrated specification in the main text yield identical reduced-form equi-
librium conditions. The demand functions have the same linear form, and the intermediary’s
problem is unchanged. Consequently, the equilibrium prices (𝛿∗, 𝑦∗,𝑠∗) respond identically to
demand shocks in both specifications.
In the integrated specification, a shock to ¯ 𝐷𝑠𝑐 represents a change in the representative
household’sdemandforstablecoins(becauseofe.g. increaseduseofstablecoinsforremittances
or a shift toward crypto-based commerce). In the segmented specification, a shock to ¯ 𝐷𝐶
represents either a change in crypto-native households’ demand intensity or a change in the
mass 𝜇𝐶 of crypto-native households (e.g., due to broader adoption of cryptocurrency).
In the integrated specification, households substitute between stablecoins and synthetic dol-
lars in response to relative price changes. If stablecoin parity deviations rise, households shift
toward swaps; if CIP falls (dollar premium rises), households shift toward stablecoins. This
substitution dampens price movements and provides a form of market integration even absent
intermediary linkages.
In the segmented specification, no such substitution occurs. Traditional households cannot
shift to stablecoins when CIP falls; crypto-native households cannot shift to swaps when
stablecoin parity deviations rise. Price movements are therefore larger for a given shock, and
the markets are more fragile.
The choice between specifications should depend on the empirical context. The integrated
specification presented in the main text may be more appropriate for developed markets or for
institutional investors who can access multiple channels. Large corporations, for instance, can
48choose between hedging via FX swaps and holding stablecoins for treasury management. For
these agents, the two channels are genuine substitutes.
The segmented specification may be more appropriate for emerging markets where institu-
tionalbarriersaremorebinding, orforretailinvestorswhofacesignificantfrictionsinaccessing
traditional FX markets. In these contexts, the assumption that households are confined to spe-
cific market segments may be more realistic.
E Additional counterfactuals
Stablecoin-specific costs. Figure 9 reveals that stablecoin-specific costs primarily affect the
own-market response rather than the spillover. Specifically, doubling Γ𝑠𝑐 more than doubles the
elasticity of parity deviations. However, the effect on CIP is muted.
This asymmetry arises because Γ𝑠𝑐 affects only stablecoin intermediation and only affecting
CIPthroughtheequilibriumbalancesheeteffects. HighervaluesofΓ𝑠𝑐 implythatintermediaries
require a larger premium to absorb a given level of stablecoin demand, which amplifies Δ𝑦. The
modestdeclineinthedollarpremiumreflectsthatlargerstablecoinparitydeviationsinducesome
substitution toward swaps. This suggests that policies targeting stablecoin market efficiency
may not substantially reduce systemic risk transmission to traditional markets.
Stablecoin demand elasticity. Figure 10 shows the equilibrium responses under alternative
demand elasticities. Counterfactuals show larger responses for lower elasticities, which ap-
proach to the identified supply responses in the limit to fully inelastic demand. Nevertheless,
the range of parity deviations response goes from 40 to 26 under different parameterizations.
Spillovers are also in a tight range.
49Figure 9: Effect of stablecoin-specific costs (Γ𝑠𝑐) on price responses.
Notes: This figure displays equilibrium price responses to a 1% stablecoin flow shock across
different stablecoin-specific cost parameter Γ𝑠𝑐. The left panel shows the stablecoin parity
deviation (Δ𝑦), the middle panel shows the CIP deviation (Δ𝛿, where more negative values
indicate a higher dollar premium), and the right panel shows the exchange rate depreciation
(Δ𝑠). The horizontal axis measures Γ𝑠𝑐 relative to its calibrated baseline value. Dots indicate
baseline values.
Figure 10: Effect of stablecoin demand elasticity (𝛼𝑠𝑐) on Price Responses.
Notes: This figure displays equilibrium price responses to a 1% stablecoin flow shock across
different stablecoin demand elasticity 𝛼𝑠𝑐. The left panel shows the stablecoin parity deviation
(Δ𝑦), the middle panel shows the CIP deviation (Δ𝛿, where more negative values indicate a
higher dollar premium), and the right panel shows the exchange rate depreciation (Δ𝑠). The
horizontal axis measures 𝛼𝑠𝑐 relative to its calibrated baseline value. Dots indicate baseline
values.
50F Dynamic model extension
This appendix extends the static model to incorporate persistence in demand shocks and in-
termediary balance sheet dynamics. The extension draws on the intermediary asset pricing
literature, particularly He and Krishnamurthy (2013), who demonstrate that when financial
intermediaries face equity capital constraints, risk premia become state-dependent and exhibit
nonlinear dynamics during crises. In the international finance context, Gabaix and Maggiori
(2015) show that capital flows drive exchange rates by altering the balance sheets of financiers
who bear currency risk, while Du et al. (2018) document that CIP deviations reflect the shadow
cost of intermediary balance sheet capacity. Our dynamic extension captures these mechanisms
in a tractable framework that generates persistent spillovers and state-dependent amplification.
We develop the full extension here, and refer to Figures reproduced in the main text.
F.1 Environment
Time is discrete and indexed by 𝑡 = 0,1,2,.... The structure of markets and agents follows
the static model, with two key additions: demand shocks exhibit persistence, and intermediary
risk-bearing capacity varies with wealth.
Demand dynamics. Stablecoin demand follows an AR(1) process:
¯ 𝐷𝑠𝑐
𝑡 = 𝜌 ¯ 𝐷𝑠𝑐
𝑡−1 + 𝜀𝑡, 𝜀𝑡 ∼ N(0,𝜎2
𝜀) (57)
where 𝜌 ∈ (0,1) governs persistence. This specification captures the empirical observation
that stablecoin flows exhibit positive autocorrelation, with demand shocks decaying gradually
rather than reverting immediately. We calibrate 𝜌 = 0.8, implying a half-life of approximately
three days, consistent with the observed persistence in stablecoin trading volumes.
Intermediary problem with wealth-dependent risk capacity. The representative interme-
diary enters period 𝑡 with wealth 𝑊𝑡 and chooses positions in synthetic dollar intermediation
(𝐵
𝑠𝑦𝑛
𝑡 ) and stablecoin intermediation (𝐵𝑠𝑐
𝑡 ). The key departure from the static model is that the
intermediary’s costs are scaled by wealth, capturing the idea that positions must be evaluated
relative to capital. The intermediary solves:
max
𝐵
𝑠𝑦𝑛
𝑡 ,𝐵𝑠𝑐
𝑡
𝛿𝑡𝐵
𝑠𝑦𝑛
𝑡 + 𝑦𝑡𝐵𝑠𝑐
𝑡 −
Γ𝛿
2𝑊𝑡
(𝐵
𝑠𝑦𝑛
𝑡 )2
−
Γ𝑠𝑐
2𝑊𝑡
(𝐵𝑠𝑐
𝑡 )2
−
Γ×
2𝑊𝑡
(𝐵
𝑠𝑦𝑛
𝑡 + 𝐵𝑠𝑐
𝑡 )2
(58)
The scaling by 𝑊𝑡 in the cost terms admits a natural interpretation: a given dollar position
representsgreaterriskexposurewhenmeasuredagainstasmallercapitalbase. Anintermediary
51with $10 billion in capital can comfortably absorb losses on a $1 billion position; the same
position would be precarious for an intermediary with only $2 billion. This formulation is
analogous to measuring portfolio risk relative to equity, as in the VaR-constraint literature
(Brunnermeier and Pedersen, 2009; Adrian and Shin, 2014), and captures the risk-bearing
capacity mechanism emphasized by Gabaix and Maggiori (2015).
The first-order conditions yield optimal positions that scale linearly with wealth:
𝐵
𝑠𝑦𝑛
𝑡 = 𝑊𝑡 · 𝑏𝑠𝑦𝑛
(𝛿𝑡, 𝑦𝑡;Γ) (59)
𝐵𝑠𝑐
𝑡 = 𝑊𝑡 · 𝑏𝑠𝑐
(𝛿𝑡, 𝑦𝑡;Γ) (60)
where 𝑏𝑠𝑦𝑛(·) and 𝑏𝑠𝑐(·) are the position-per-unit-wealth functions derived from the static
model’s first-order conditions. When wealth falls, the intermediary endogenously reduces
positions, withdrawing risk-bearing capacity from both markets.
Wealth dynamics. Intermediary wealth evolves with portfolio returns:
𝑊𝑡+1 = 𝑊𝑡

1+
𝐵
𝑠𝑦𝑛
𝑡
𝑊𝑡
𝛿𝑡 +
𝐵𝑠𝑐
𝑡
𝑊𝑡
𝑦𝑡 − 𝜙 · Δ𝑠𝑡

= 𝑊𝑡 1+ 𝑏
𝑠𝑦𝑛
𝑡 𝛿𝑡 + 𝑏𝑠𝑐
𝑡 𝑦𝑡 − 𝜙 · Δ𝑠𝑡

(61)
where 𝜙 captures the intermediary’s net foreign exchange exposure and Δ𝑠𝑡 is the rate of
exchange rate depreciation. The position-to-wealth ratios 𝑏
𝑠𝑦𝑛
𝑡 and 𝑏𝑠𝑐
𝑡 determine how portfolio
returns translate into wealth growth.
This specification creates scope for amplification. Adverse shocks that raise the stablecoin
parity deviation 𝑦𝑡 and lower 𝛿𝑡 (increasing the dollar premium) may generate mark-to-market
losses that deplete wealth. With reduced wealth, the intermediary’s risk-bearing capacity falls,
positions contract, and prices must adjust further to clear markets. This feedback loop is
the central mechanism in He and Krishnamurthy (2013): losses reduce capacity, and reduced
capacity sustains elevated prices.
F.2 Equilibrium
Within each period, given the state variables (𝑊𝑡, ¯ 𝐷𝑠𝑐
𝑡 ), equilibrium prices clear markets with
intermediary positions scaling with wealth. Market clearing requires:
𝑊𝑡 · 𝑏𝑠𝑦𝑛
(𝛿𝑡, 𝑦𝑡) = ¯ 𝜌𝑠𝑦𝑛
+ ˜ 𝛼𝛿𝛿𝑡 (62)
𝑊𝑡 · 𝑏𝑠𝑐
(𝛿𝑡, 𝑦𝑡) = ¯ 𝜌𝑠𝑐
𝑡 − 𝛼𝑠𝑐𝑦𝑡 (63)
52where ¯ 𝜌𝑠𝑐
𝑡 incorporates the time-varying demand shock. These conditions implicitly define
equilibrium prices as functions of the state:
𝑦𝑡 = 𝑓𝑦(𝑊𝑡, ¯ 𝐷𝑠𝑐
𝑡 ;Γ) (64)
𝛿𝑡 = 𝑓𝛿(𝑊𝑡, ¯ 𝐷𝑠𝑐
𝑡 ;Γ) (65)
𝑠𝑡 = 𝑓𝑠(𝑊𝑡, ¯ 𝐷𝑠𝑐
𝑡 ;Γ) (66)
The key comparative static are 𝜕𝑦𝑡/𝜕𝑊𝑡 < 0 and 𝜕𝛿𝑡/𝜕𝑊𝑡 > 0: lower intermediary wealth
implies higher stablecoin parity deviations and lower CIP deviations (a higher dollar premium).
Intuitively, when the intermediary has less capital, it supplies less risk-bearing capacity to the
market. With reduced supply of intermediation, prices must adjust to equilibrate demand.
To characterize the equilibrium more explicitly, we normalize steady-state wealth to ¯ 𝑊 = 1.
At steady state, the model reduces to the static framework analyzed in the main text. Away from
steady state, we can write the equilibrium price functions as:
𝑦𝑡 =
1
𝑊𝑡
· ˜ 𝑓𝑦( ¯ 𝐷𝑠𝑐
𝑡 ;Γ) (67)
𝛿𝑡 = 𝑊𝑡 · ˜ 𝑓𝛿( ¯ 𝐷𝑠𝑐
𝑡 ;Γ) (68)
where ˜ 𝑓𝑦 and ˜ 𝑓𝛿 are the static equilibrium functions. The stablecoin parity deviation scales
inversely with wealth, while the CIP deviation scales positively: a 50 percent reduction in inter-
mediary capital doubles the stablecoin parity deviation and halves the CIP deviation (doubling
the dollar premium in absolute terms) for a given demand shock.
Proposition 6 (Dynamic amplification). Consider an impulse response to a demand shock
𝜀0 > 0 from steady state (𝑊0 = ¯ 𝑊, ¯ 𝐷𝑠𝑐
0 = 0). Let A𝑦 ≡
Í∞
𝑡=0 𝑦𝑡/𝑦0 denote the cumulative
amplification factor for the stablecoin parity deviation. Then:
(i) A𝑦 > 1/(1 − 𝜌) when the balance sheet channel is active, exceeding the amplification
from demand persistence alone.
(ii) 𝜕A𝑦/𝜕𝑊0 < 0: lower initial wealth increases cumulative amplification.
(iii) Analogous results hold for the CIP deviation 𝛿 and exchange rate 𝑠.
The proof follows from iterating the equilibrium conditions forward. With 𝜌 > 0, demand
shocks persist, sustaining elevated prices. Simultaneously, if the shock depletes wealth (𝑊1 <
𝑊0), reduced risk-bearing capacity amplifies the price response in subsequent periods. The two
channels compound: persistent demand meets diminished intermediation capacity, generating
cumulative effects that exceed what either channel would produce in isolation.
53F.3 Calibration
Wecalibratethedynamicmodeltomatchthestaticcalibrationatsteadystate,addingparameters
governing dynamics. Table 6 reports the parameter values.
Parameter Description Value Source
Static parameters (from main calibration)
Γ𝛿 Swap market cost 0.023 CIP literature
Γ𝑠𝑐 Stablecoin market cost 0.194 Match Δ𝑦
Γ× Cross-market cost 0.148 Match Δ𝛿
Dynamic parameters
𝜌 Demand persistence 0.80 Stablecoin flow autocorrelation
𝜙 FX exposure 150 Intermediary hedging ratios
¯ 𝑊 Steady-state wealth 1 Normalization
Table 6: Dynamic model calibration. Static parameters are taken from the main text. With
steady-state wealth normalized to unity, the static model emerges as the 𝑊𝑡 = 1 case. Dynamic
parameters are chosen to match empirical features of stablecoin markets and intermediary
balance sheets.
The persistence parameter 𝜌 = 0.8 implies that demand shocks have a half-life of approx-
imately three days. The FX exposure parameter 𝜙 governs how exchange rate movements
feed back into intermediary wealth; we calibrate it to match evidence on intermediary hedging
practices in foreign exchange markets.
F.4 Impulse response analysis
Figure 7 displays the impulse response to a one percent stablecoin demand shock, starting from
steady state. The shock generates impact effects of 34 basis points for the stablecoin parity
deviation 𝑦, −15 basis points for the CIP deviation 𝛿 (a higher dollar premium), and 3.5 basis
points for exchange rate depreciation 𝑠. These impact effects coincide with the static model, as
the economy begins at steady-state wealth.
The dynamic responses reveal the interaction between demand persistence and balance sheet
effects. On impact, intermediary wealth drops by approximately 5 percent as mark-to-market
losses materialize. This wealth depletion reduces risk-bearing capacity in subsequent periods,
amplifying the price response relative to what demand persistence alone would generate. Prices
decay gradually, with a half-life of roughly four days, somewhat longer than the three-day
half-life implied by the AR(1) demand process. The additional persistence reflects the balance
sheet channel: even as demand shocks fade, depleted wealth sustains elevated stablecoin parity
deviations and depressed CIP deviations.
Cumulating the impulse responses yields amplification factors of 5.4 for the stablecoin parity
deviation and 5.6 for the CIP deviation. These figures indicate that static analysis, which
54captures only impact effects, understates the true spillover costs by a factor of five to six.
Demand persistence alone would generate amplification of 1/(1 − 𝜌) = 5; the additional 8 to
12 percent comes from the wealth channel.
F.5 State-dependent amplification
A key prediction of the model is that identical shocks generate larger price responses when
intermediary balance sheets are impaired. This property follows directly from the equilibrium
structure: with the stablecoin parity deviation scaling as 1/𝑊𝑡 and the CIP deviation scaling
as 𝑊𝑡, lower wealth translates mechanically into higher stablecoin parity deviations and larger
dollar premia. Table 7 reports impact effects for the same demand shock under alternative
assumptions about initial wealth. The table reports price responses to a one percent demand
shock under alternative assumptions about initial intermediary wealth. Negative values of
Δ𝛿 indicate a higher dollar premium. Amplification is computed relative to the steady-state
baseline.
Initial Wealth Δ𝑦 (bps) Δ𝛿 (bps) Δ𝑠 (bps) Amplification
𝑊0 = ¯ 𝑊 (steady state) 34 −15 3.5 1.0×
𝑊0 = 0.75 ¯ 𝑊 45 −20 4.7 1.3×
𝑊0 = 0.50 ¯ 𝑊 (stressed) 68 −30 7.0 2.0×
Table 7: State-dependent impact effects
When intermediary wealth is 50 percent below steady state, impact effects double relative to
the baseline. This proportionality (stablecoin parity deviations scaling inversely with wealth,
dollar premia scaling inversely with wealth) is a direct consequence of the risk-bearing capacity
formulation. Theeconomiccontentisthatagivendemandshockrequiresmorepriceadjustment
to clear markets when intermediation capacity is scarce.
The state dependence has important implications for crisis dynamics. An initial shock
depletesintermediarycapital,reducingrisk-bearingcapacity. Subsequentshocksthenencounter
a more constrained intermediary sector and generate amplified price responses, which may
cause further wealth depletion. This feedback mechanism can produce destabilizing dynamics
in which crises become self-reinforcing, as in He and Krishnamurthy (2013).
F.6 Counterfactual: Cross-market frictions
The static analysis identified the cross-market cost Γ× as the key parameter governing spillovers
from stablecoin markets to CIP deviations. The dynamic model amplifies this role through the
balance sheet channel. Figure 8 compares impulse responses under the baseline calibration to
a counterfactual with doubled cross-market costs.
55Doubling Γ× increases the impact effect on the stablecoin parity deviation from 34 to 78
basis points, a factor of 2.3. The CIP spillover increases from −15 to −58 basis points, nearly a
fourfold increase in the dollar premium. The more-than-proportional increase in CIP spillovers
reflects compounding through the balance sheet channel: higher Γ× generates larger initial
price responses, which cause greater wealth depletion, which further amplifies subsequent
price dynamics.
These findings reinforce the policy implications from the static analysis. Cross-market
frictions, whether arising from balance sheet linkages, regulatory constraints, or market seg-
mentation, aretheprimarydeterminantofspillovermagnitude. Thedynamicmodelrevealsthat
reducing these frictions yields compounding benefits: smaller spillovers preserve intermediary
capital, which sustains risk-bearing capacity, which further dampens price responses to future
shocks.
F.7 Discussion
The dynamic extension connects our analysis of stablecoin-FX spillovers to several strands of
the literature on financial frictions and international finance.
The model provides a specific application of the intermediary asset pricing framework de-
veloped by He and Krishnamurthy (2013). In their setting, intermediaries face an equity capital
constraint that limits positions to a multiple of wealth. When binding, this constraint creates
state-dependent risk premia: intermediation capacity becomes scarce, and the marginal inter-
mediary demands higher compensation for bearing risk. Our formulation captures the same
economic force through a different modeling device (wealth-scaled costs rather than a hard
constraint) but delivers the same qualitative predictions. Risk premia rise when intermediary
wealth falls, and the amplification is nonlinear, with crises generating disproportionately large
effects.
The framework also speaks to the literature on CIP deviations and limits to arbitrage. Du
et al. (2018) document that CIP violations reflect binding balance sheet constraints, particularly
around regulatory reporting dates when banks face pressure to reduce positions. In their
interpretation, the cross-currency basis represents the shadow value of balance sheet space:
arbitrageurs could eliminate CIP deviations, but doing so requires capital that is costly to
deploy. Our model formalizes this mechanism. The term Γ/𝑊𝑡 in the intermediary’s cost
function captures exactly this shadow value, the effective price of deploying a unit of balance
sheet capacity. When wealth is depleted, this shadow price rises, and CIP deviations persist
even in the presence of apparent arbitrage opportunities.
OuranalysiscomplementsGabaixandMaggiori(2015),whomodelexchangeratedetermina-
tion through the balance sheets of financiers intermediating international capital flows. In their
framework, capitalflowsalterintermediarywealthandtherebyaffectthecompensationrequired
56for bearing currency risk. Our contribution is to incorporate stablecoins as an additional market
and trace how shocks propagate to traditional FX pricing through shared intermediary balance
sheets. The risk-bearing capacity formulation we adopt is closely related to their approach, with
the Γ parameter playing an analogous role in governing how balance sheet conditions translate
into price dynamics.
Finally, the state-dependent amplification documented here has implications for financial
stability. The potential for destabilizing feedback, in which shocks deplete capital, reduce
intermediation capacity, amplify price responses, and further deplete capital, creates fragility
in the system. As stablecoin markets grow and their integration with traditinal finance deep-
ens, this feedback channel may become increasingly important. Prudential policies targeting
intermediary capital buffers could dampen the amplification mechanism, though at the cost of
reduced intermediation in normal times.
F.8 Redemption frictions and run dynamics
We extend the model to incorporate redemption frictions that amplify during stress, providing
a framework for analyzing run dynamics in stablecoin markets. The key insight is that large
redemptions relative to intermediary capacity impose additional costs, creating a feedback loop
that can destabilize the system.
Haircut structure. We introduce a redemption haircut ℎ𝑡 ∈ (0,1] that reduces the effective
value recovered by the intermediary on each unit of stablecoin position during large redemption
episodes. Specifically, ℎ𝑡 captures the combination of fire-sale discounts (reserve assets sold
at below-par prices to meet redemptions), settlement frictions (delays in converting illiquid
reserves to cash), and issuer liquidity risk (the risk that the stablecoin issuer cannot honor
redemptions at par). The haircut is borne by the intermediary who holds the stablecoin position
𝐵𝑠𝑐
𝑡 : whenhouseholdsredeem,theintermediaryreceivesonly ℎ𝑡 dollarsperdollaroffacevalue.
We parameterize it as:
ℎ𝑡 = 1−𝜂
|𝐵𝑠𝑐
𝑡 |
𝑊𝑡
(69)
where𝜂 ≥ 0governstheseverityofredemptionfrictionsand |𝐵𝑠𝑐
𝑡 |/𝑊𝑡 istheredemptionvolume
scaled by intermediary capital. When 𝜂 = 0, we recover the baseline model with no redemption
costs. When 𝜂 > 0, larger redemption volumes relative to the intermediary’s capital base imply
steeper haircuts, reflecting that forced asset sales become costlier as they grow relative to the
intermediary’s ability to absorb losses.
Modified wealth dynamics. Intermediary wealth evolves as:
𝑊𝑡+1 = 𝑊𝑡 1+ 𝑏
𝑠𝑦𝑛
𝑡 𝛿𝑡 + 𝑏𝑠𝑐
𝑡 𝑦𝑡 · ℎ𝑡 − 𝜙Δ𝑠𝑡

(70)
57The haircut reduces the effective return on stablecoin intermediation. During redemption
episodes (𝑏𝑠𝑐
𝑡 < 0), the intermediary faces losses that are amplified by the factor (2 − ℎ𝑡): as
the haircut rises (lower ℎ𝑡), losses mount nonlinearly.
Run threshold. The solvency constraint ℎ𝑡 > 0 defines a critical threshold. Substituting (69)
and using |𝑏𝑠𝑐
𝑡 | = |𝐵𝑠𝑐
𝑡 |/𝑊𝑡, the constraint becomes:
𝜂 · |𝑏𝑠𝑐
𝑡 | < 1 ⇐⇒ 𝜂 <
𝑊𝑡
|𝐵𝑠𝑐
𝑡 |
(71)
For a given shock that generates position |𝐵𝑠𝑐
𝑡 |, the run threshold is:
¯ 𝜂 =
𝑊𝑡
shock size
(72)
When redemption frictions exceed this threshold, the haircut turns negative, the intermediary
cannot honor redemptions at any positive value, and the system breaks down.
Feedback mechanism. The interaction between haircuts and wealth creates a destabilizing
feedback loop:
1. A redemption shock increases |𝑏𝑠𝑐
𝑡 |
2. The haircut rises (lower ℎ𝑡), reducing value recovered
3. Wealth 𝑊𝑡+1 falls more than in the baseline model
4. Lower wealth raises effective costs (Γ/𝑊𝑡+1), widening spreads
5. The run threshold ¯ 𝜂 = 𝑊𝑡+1/shock falls, making the system more fragile
This mechanism captures the classic ingredients of a bank run applied to stablecoin intermedi-
ation: sequential service constraints (early redeemers get better terms), strategic complemen-
tarities (my incentive to redeem rises if others redeem), and the possibility of self-fulfilling
crises.
Counterfactual analysis. Figure 11 illustrates how redemption frictions amplify price re-
sponses for different levels of intermediary capitalization. Each curve shows the impact effect
ofa1%redemptionshockasafunctionof𝜂, withverticaldottedlinesmarkingtherunthreshold
¯ 𝜂 = 𝑊0 for each case.
Threefeaturesemergefromthefigure. First,amplificationisconvex: priceresponsesincrease
slowly for low 𝜂 but accelerate sharply as frictions approach the threshold. At 𝜂 = 0.9¯ 𝜂, impact
effects are roughly ten times larger than in the frictionless baseline. Second, capitalization
determines fragility: a well-capitalized intermediary (𝑊0 = 1) can tolerate frictions up to 𝜂 = 1,
whileastressedintermediary(𝑊0 = 0.5)hitstherunregionat𝜂 = 0.5. Thesamelevelofreserve
58Figure11:Effectofredemptionfrictions(𝜂)onimpactresponsestoa1%stablecoinredemption
shock. Panels show the stablecoin parity deviation (left), CIP deviation (middle), and exchange
rate depreciation (right). Each curve corresponds to a different initial wealth level 𝑊0. Dotted
vertical lines mark the run threshold ¯ 𝜂 = 𝑊0 for each case; effects diverge to infinity as 𝜂
approaches the threshold.
illiquidity that is manageable in normal times becomes catastrophic when balance sheets are
impaired. Third, spillovers scale proportionally: the ratio of CIP response to stablecoin parity
deviation response remains approximately constant as 𝜂 varies, implying that the cross-market
spillover channel operates similarly across the friction spectrum.
Policy implications. The analysis yields two policy-relevant insights. First, reserve liquidity
requirements (reducing 𝜂) provide a buffer against runs by keeping the system away from the
threshold. Mandating that stablecoin issuers hold liquid reserves,such as Treasury bills rather
thancommercialpaperorcryptoassets,directlylowers𝜂 andexpandsthestableregion. Second,
intermediarycapitalrequirements(raising𝑊𝑡)increasetherunthreshold ¯ 𝜂,allowingthesystem
to tolerate higher frictions without destabilizing. The two policies are complementary: liquid
reserves reduce the severity of redemption costs conditional on a run, while adequate capital
reduces the probability of approaching run conditions in the first place.
Combined shocks and crisis amplification. The amplifying role of redemption frictions
is most apparent when flow shocks and friction shocks occur simultaneously—as would be
expected during a crisis episode. Figure 12 illustrates this by comparing the impulse response
to a 1% flow shock under three scenarios: no friction (𝜂 = 0), moderate friction (𝜂 = 0.4),
and severe friction (𝜂 = 0.8). In the frictionless baseline, the flow shock generates a 40
basis point increase in the stablecoin parity deviation and a 17.5 basis point widening of
the CIP deviation, consistent with our empirical estimates. When the same flow shock is
accompanied by a moderate friction shock, impact effects rise by a factor of 1.7; under severe
frictions, the amplification reaches 5 times the baseline. This pattern captures the dynamics
of a crisis episode such as the Terra/Luna collapse or the SVB-induced USDC depeg: bad
59news triggers redemptions while simultaneously raising the cost of those redemptions, as
counterpartiesbecomecautious,liquidityevaporates,andreserveassetsfacefire-salediscounts.
The interaction between flow and friction shocks is central to understanding why stablecoin
stress events can generate outsized spillovers to traditional FX markets.
Figure 12: Impulse response to a 1% stablecoin flow shock with and without a simultaneous
shock to redemption frictions 𝜂.
0 2 4 6 8 10 12 14
0
20
40
60
80
100
Basis points
y(stablecoin premium)
0 2 4 6 8 10 12 14
16
14
12
10
8
6
4
2
0
Basis points
(CIP deviation)
0 2 4 6 8 10 12 14
0
2
4
6
8
10
12
14
16
Basis points
s(exchange rate depreciation)
0 2 4 6 8 10 12 14
Days
0.825
0.850
0.875
0.900
0.925
0.950
0.975
1.000
Wealth
Intermediary wealth (Wt)
0 2 4 6 8 10 12 14
Days
0.0
0.2
0.4
0.6
0.8
1.0
Haircut factor
Haircut (ht)
0 2 4 6 8 10 12 14
Days
0
5
10
15
20
t
Redemption friction ( t)
IRF to 1% flow shock with and without simultaneous shock
Flow shock only ( =0) Flow + moderate ( max=10) Flow + severe ( max=22)
Notes: The blue solid line shows the baseline response (𝜂 = 0); the orange dashed line adds a moderate
friction shock; the red dotted line adds a severe friction shock. Upper panels show price responses
(stablecoin parity deviation, CIP deviation, exchange rate); lower panels show intermediary wealth, the
haircut factor, and the friction path. Both shocks decay over time.
G Finite supply elasticity
This appendix shows that relaxing the perfectly elastic supply assumption does not affect the
identified structural object. We considera model withoutcross-book participantsbutwith finite
supply elasticity and household demand that depends on the absolute stablecoin price.
60G.1 Setup
Stablecoin supply responds to the dollar price deviation 𝜇 ≡ 𝑃𝑠,USD
𝑡 −1:
𝑆𝑠𝑐
= 𝑆0 + 𝜅 𝜇 (73)
Household demand in country 𝑓 depends on the absolute price 𝑃𝑓 = 1+ 𝜇 + 𝑦𝑓 :
𝐷𝑠𝑐
𝑓 = ¯ 𝐷𝑠𝑐
𝑓 − 𝛼𝑠𝑐(1+ 𝜇 + 𝑦𝑓 ) (74)
All other elements — the intermediary cost function, swap market, and spot market — are as
in the main text.
G.2 Local equilibrium given 𝜇
Define effective local demand ¯ 𝜌𝑠𝑐
𝑓 (𝜇) ≡ ˜ 𝐷𝑠𝑐
𝑓 − 𝛼𝑠𝑐𝜇, where ˜ 𝐷𝑠𝑐
𝑓 ≡ ¯ 𝐷𝑠𝑐
𝑓 − 𝛼𝑠𝑐. Market clearing
on book 𝑓 requires 𝐵𝑠𝑐
𝑓 = ¯ 𝜌𝑠𝑐
𝑓 (𝜇) − 𝛼𝑠𝑐 𝑦𝑓 . Substituting into the intermediary’s first-order
conditions and solving yields:
𝑦𝑓 =
𝑁𝑦 ¯ 𝜌𝑠𝑐
𝑓 (𝜇) + 𝑁𝑠𝑦𝑛 ¯ 𝜌𝑠𝑦𝑛
Δ
(75)
−𝛿𝑓 =
Γ× ¯ 𝜌𝑠𝑐
𝑓 (𝜇) + 𝑀𝛿 ¯ 𝜌𝑠𝑦𝑛
Δ
(76)
where 𝑁𝑦, 𝑁𝑠𝑦𝑛, 𝑀𝛿, and Δ are as defined in the main text.
G.3 Global clearing
The aggregate condition
Í
𝑓 𝐵𝑠𝑐
𝑓 + 𝐷𝑈𝑆 = 𝑆0 + 𝜅𝜇 pins 𝜇 as a function of all demand shocks
{ ˜ 𝐷𝑠𝑐
𝑓 }.
G.4 Cross-country transmission and IV coefficient
An idiosyncratic shock 𝑢𝐴 in country 𝐴 ( ˜ 𝐷𝑠𝑐
𝐴 → ˜ 𝐷𝑠𝑐
𝐴 +𝑢𝐴) affects country 𝐵 by raising 𝜇. With
˜ 𝐷𝑠𝑐
𝐵 unchanged, let 𝑚 ≡ 𝜕𝜇/𝜕𝑢𝐴 > 0:
𝜕𝑦𝐵
𝜕𝑢𝐴
= −
𝑁𝑦 𝛼𝑠𝑐
Δ
· 𝑚 (77)
𝜕𝐵𝑠𝑐
𝐵
𝜕𝑢𝐴
= −𝛼𝑠𝑐 𝑚 − 𝛼𝑠𝑐
𝜕𝑦𝐵
𝜕𝑢𝐴
(78)
61Taking the ratio:
𝛽𝐼𝑉
𝑦 =
𝜕𝑦𝐵/𝜕𝑢𝐴
𝜕𝐵𝑠𝑐
𝐵 /𝜕𝑢𝐴
=
−𝑁𝑦𝛼𝑠𝑐 𝑚/Δ
−𝛼𝑠𝑐 𝑚(1+ 𝑁𝑦𝛼𝑠𝑐/Δ)
(79)
The factor 𝑚 cancels from numerator and denominator:
𝛽𝐼𝑉
𝑦 =
𝑁𝑦/Δ
(Δ+ 𝑁𝑦𝛼𝑠𝑐)/Δ
=
𝑁𝑦
Δ− 𝛼𝑠𝑐𝑁𝑦
(80)
Using the identity Δ− 𝛼𝑠𝑐𝑁𝑦 = 𝐴𝛿 (proved below):
𝛽𝐼𝑉
𝑦 =
𝑁𝑦
𝐴𝛿
(81)
This is identical to the coefficient identified under the cross-book participant specification
in the main text. The result holds for any 𝜅 ∈ (0,∞): the supply elasticity does not enter the
identified object.
Proof that Δ− 𝛼𝑠𝑐𝑁𝑦 = 𝐴𝛿. Recall:
Δ = 𝐴𝛿𝐴𝑠𝑐 − 𝐵𝐶
𝑁𝑦 = 𝐴𝛿(Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
×
𝐴𝑠𝑐 = 1+ 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×), 𝐵 = 𝛼𝑠𝑐Γ×, 𝐶 = ˜ 𝛼𝛿Γ×
Then:
Δ− 𝛼𝑠𝑐𝑁𝑦 = 𝐴𝛿𝐴𝑠𝑐 − 𝐵𝐶 − 𝛼𝑠𝑐[𝐴𝛿(Γ𝑠𝑐 + Γ×) − ˜ 𝛼𝛿Γ2
×]
= 𝐴𝛿[𝐴𝑠𝑐 − 𝛼𝑠𝑐(Γ𝑠𝑐 + Γ×)] − 𝐵𝐶 + 𝛼𝑠𝑐 ˜ 𝛼𝛿Γ2
×
= 𝐴𝛿 · 1− 𝛼𝑠𝑐Γ× · ˜ 𝛼𝛿Γ× + 𝛼𝑠𝑐 ˜ 𝛼𝛿Γ2
×
= 𝐴𝛿 □
G.5 Instrument power
While the identified object is invariant to 𝜅, the instrument’s statistical power is not. The
first-stage coefficient is proportional to:
Cov(𝑔𝐵, 𝑍) ∝
𝜕𝐵𝑠𝑐
𝐵
𝜕𝑢𝐴
= −𝛼𝑠𝑐 𝑚

1+
𝑁𝑦𝛼𝑠𝑐
Δ

(82)
As 𝜅 → ∞, 𝑚 = 𝜕𝜇/𝜕𝑢𝐴 → 0, and the first stage vanishes. In this limit, the 𝑃𝑠,USD
𝑡
channel provides no identifying variation; only cross-book participant reallocation can generate
62a non-degenerate first stage.
G.6 Equivalence result
Proposition 7 (Equivalence of microfoundations). The following two specifications identify the
same structural object 𝑁𝑦/𝐴𝛿:
(i) Elastic supply (𝑃𝑠,USD
𝑡 = 1) with cross-book participant demand (𝑆𝑠𝑐
𝑓 ,
Í
𝑓 𝑆𝑠𝑐
𝑓 = 𝑊);
(ii) Finite supply elasticity (𝜅 < ∞) with price-sensitive demand 𝐷𝑠𝑐
𝑓 (𝑃𝑓 ) and no cross-book
participants.
In specification (i), the instrument derives power from the budget constraint
Í
𝑓 𝑆𝑠𝑐
𝑓 = 𝑊.
In specification (ii), the instrument derives power from the supply constraint 𝑆𝑠𝑐 = 𝑆0 + 𝜅𝜇.
Both generate cross-country co-movement in flows through different economic mechanisms but
identify the same combination of intermediation cost parameters.
When both channels operate simultaneously (cross-book participants with finite 𝜅), the
identified object remains 𝑁𝑦/𝐴𝛿, with instrument power reflecting the sum of both channels.
H Microfoundation for cross-book participants
This appendix provides a portfolio-theoretic microfoundation for the cross-book participant
demand introduced in Section 3.8. We show that agents who hold fiat balances across multiple
currencies optimally reallocate their stablecoin conversions toward currencies experiencing
adverse local conditions, generating the cross-country demand reallocation that underpins our
identification strategy.
H.1 Agent problem
A representative cross-book participant holds fiat balances {𝑁0
𝑓 }𝐹
𝑓=1 across 𝐹 currencies. Each
currency 𝑓 issubjecttoastochasticlocalshockwithconversionurgency𝜃𝑓 > 0. Thisparameter
captures the expected benefit of converting currency 𝑓 into stablecoins, encompassing expected
depreciation, regulatory risk, banking access disruptions, or tightening of capital controls. The
residual (unconverted) fiat position in currency 𝑓 carries variance 𝜎2
𝑓 .
Theagentconverts𝑐𝑓 unitsofcurrency 𝑓 intoUSDTatcost 𝑦𝑓 perunit(theparitydeviation).
Total conversion is limited by operational capacity:
∑︁
𝑓
𝑐𝑓 ≤ 𝑊 (83)
reflecting exchange limits, KYC processing bandwidth, and settlement constraints.
63The agent maximizes expected wealth net of residual risk:
max
{𝑐𝑓 ≥0}
∑︁
𝑓
𝑐𝑓 𝜃𝑓 −
∑︁
𝑓
𝑐𝑓 𝑦𝑓 −
𝛾
2
∑︁
𝑓
(𝑁0
𝑓 − 𝑐𝑓 )2
𝜎2
𝑓 s.t.
∑︁
𝑓
𝑐𝑓 ≤ 𝑊 (84)
The first term captures the expected benefit of conversion: each unit converted avoids the
adverse local shock. The second is the premium cost. The third penalizes remaining fiat
exposure, weighted by local risk. The parameter 𝛾 > 0 governs risk aversion.
H.2 Optimal allocation
The first-order condition with Lagrange multiplier 𝜆 on the budget constraint yields:
𝑐𝑓 = 𝑁0
𝑓 +
𝜃𝑓 − 𝑦𝑓 −𝜆
𝛾𝜎2
𝑓
(85)
The agent converts more from currency 𝑓 when conversion urgency 𝜃𝑓 is high, the stablecoin
premium 𝑦𝑓 is low, local risk 𝜎2
𝑓 is high, and initial holdings 𝑁0
𝑓 are large.
Imposing
Í
𝑓 𝑐𝑓 = 𝑊 and defining Φ ≡
Í
𝑓 (𝛾𝜎2
𝑓 )−1 and the risk-weighted average 𝜃 − 𝑦 ≡
Φ−1 Í
𝑓 (𝜃𝑓 − 𝑦𝑓 )/(𝛾𝜎2
𝑓 ):
𝑆𝑠𝑐
𝑓 ≡ 𝑐𝑓 = ¯ 𝑆𝑠𝑐
𝑓 +
1
𝛾𝜎2
𝑓
h
(𝜃𝑓 − 𝑦𝑓 ) − 𝜃 − 𝑦
i
(86)
where ¯ 𝑆𝑠𝑐
𝑓 absorbs the baseline allocation.
H.3 Cross-country transmission
An idiosyncratic shock that raises conversion urgency in country 𝐴 (𝜃𝐴 increases) has the
following effects:
Own effect:
𝜕𝑆𝑠𝑐
𝐴
𝜕𝜃𝐴
=
1
𝛾𝜎2
𝐴
1−
(𝛾𝜎2
𝐴)−1
Φ
!
> 0 (87)
Cross-country effect (𝐵 ≠ 𝐴):
𝜕𝑆𝑠𝑐
𝐵
𝜕𝜃𝐴
= −
1
𝛾𝜎2
𝐵
·
(𝛾𝜎2
𝐴)−1
Φ
< 0 (88)
Cross-book participants redirect conversion capacity from country 𝐵 to country 𝐴. The
64budget constraint
Í
𝑓 𝑆𝑠𝑐
𝑓 = 𝑊 forces the reallocation. The spillover magnitude is proportional
to (𝛾2𝜎2
𝐴𝜎2
𝐵Φ)−1: larger when risk aversion is low, both countries’ volatilities are low, and
fewer currencies compete for conversion capacity.
H.4 Urgency versus premium-chasing
Theoptimalallocation(86)respondstobothurgency(𝜃𝑓 )andthepremium(𝑦𝑓 ),buttheseforces
drive reallocation in opposite directions during crisis episodes. When 𝜃𝐴 surges, the urgency
channel directs agents to convert more of currency 𝐴, drawing resources from other books (𝑆𝑠𝑐
𝐵
falls). The resulting rise in 𝑦𝐴 simultaneously discourages conversion from 𝐴 through the −𝑦𝑓
term (a premium-chasing effect that would push agents toward cheaper books). In practice, the
urgency channel dominates: expected losses from holding a depreciating or at-risk currency
(potentially tens of percentage points during a crisis) far exceed stablecoin premia (typically a
few percentage points even under stress).
This has a direct empirical implication. If premium-chasing dominated, a crisis in country
𝐴 that raises 𝑦𝐴 would redirect agents toward books with lower premia, increasing 𝑆𝑠𝑐
𝐵 and
generating a positive first stage. The observed negative first stage confirms that urgency-driven
reallocation is the primary force.
H.5 Reduced form
For the main text, the microfoundation delivers:
𝑆𝑠𝑐
𝑓 = ¯ 𝑆𝑠𝑐
𝑓 + 𝑣𝑓 ,
∑︁
𝑓
𝑣𝑓 = 0 (89)
where 𝑣𝑓 captures idiosyncratic reallocation driven by local conversion urgency. The zero-sum
property follows from the finite conversion budget. The main text treats the 𝑣𝑓 as given from
the stablecoin market’s perspective; this appendix establishes that the reallocation is optimal
for agents managing fiat risk across multiple currencies.
H.6 Connection to identification
The GIV 𝑍𝑓 =
Í
𝑓′≠𝑓 𝑤𝑓′ ˆ ˜ 𝑢𝑓′ captures idiosyncratic urgency shocks 𝜃𝑓′ in other countries (after
factorpurgingabsorbscommoncomponents). Theseaffectcountry 𝑓’sbookthroughthebudget
constraint: higher 𝜃𝑓′ draws conversion activity from 𝑓, lowering 𝑆𝑠𝑐
𝑓 . The exclusion restriction
requires that 𝜃𝑓′ is uncorrelated with country 𝑓’s local fundamentals. This is plausible because
𝜃𝑓 captures idiosyncratic local conditions rather than global factors, which are removed by the
factor-purging step in the instrument construction.
65Stablecoin Flows and Spillovers to FX Markets
Working Paper No. WP/2026/056