---
sha256: 0a3acb9f68654a3b1b4a69ed183e9fff232a7843216becadb807926b5087a570
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 103864
---
BIS Working Papers
No 1265
DeFiying gravity? An empirical
analysis of cross-border Bitcoin,
Ether and stablecoin flows
by Raphael Auer, Ulf Lewrick and Jan Paulick
Monetary and Economic Department
May 2025
JEL classification: F24, F32, F38, G15, G23
Keywords: cryptocurrency, payments, cross-border
flows, blockchain, decentralised finance, capital flow
management, Bitcoin, Ether, USD Coin, Tether,
stablecoins, remittancesBIS Working Papers are written by members of the Monetary and Economic
Department of the Bank for International Settlements, and from time to time by other
economists, and are published by the Bank. The papers are on subjects of topical
interest and are technical in character. The views expressed in them are those of their
authors and not necessarily the views of the BIS.
This publication is available on the BIS website (www.bis.org).
© Bank for International Settlements 2025. All rights reserved. Brief excerpts may be
reproduced or translated provided the source is stated.
ISSN 1020-0959 (print)
ISSN 1682-7678 (online)DeFiying Gravity? An Empirical Analysis of
Cross-Border Bitcoin, Ether and Stablecoin Flows∗
Raphael Auer†
, Ulf Lewrick‡
, Jan Paulick§
May 2025
Abstract
We investigate trends and drivers of cross-border flows of the two major native cryp-
toassets (Bitcoin and Ether) and the two major asset-backed stablecoins (Tether
and USD Coin) between 184 countries from 2017 to 2024. These flows are substan-
tial, peaking at around USD 2.6 trillion in 2021, with stablecoins accounting for
close to half the volume. The unique bilateral data allow us to estimate the drivers
of these flows in a gravity framework, and how they differ across different types
of crypto assets. Our findings highlight speculative motives and global funding
conditions as key drivers of native crypto asset flows. Transactional motives play
a significant role in cross-border flows for stablecoins and low-value Bitcoin trans-
actions, where we further find a strong association with higher costs of traditional
remittances. Geographic barriers play a diminished role compared to traditional
financial flows, and capital flow management measures appear ineffective.
JEL Codes: F24, F32, F38, G15, G23
Keywords: Cryptocurrency; payments; cross-border flows; blockchain; decentralised finance;
capital flow management; Bitcoin; Ether; USD Coin; Tether; stablecoins; remittances.
∗
For helpful comments, we thank Matteo Aquilina, Martin Diehl, Jon Frost, Ronald Heijmans,
William Zhang and seminar participants at the Bank for International Settlements (BIS), UC Santa
Barbara, and at the Bank of Canada and Deutsche Bundesbank international conference on payments
and securities settlement. We thank Sally Dubach, Maximilian Schrader and Violeta Vuletic for expert
assistance with the data. Disclaimer: The views expressed in this paper are those of the authors and not
necessarily those of the BIS or of the Deutsche Bundesbank. The use of any maps in this paper does
not constitute, and should not be construed as constituting, an expression of a position by the BIS or
the Deutsche Bundesbank regarding the legal status of, or sovereignty of any territory or its authorities,
to the delimitation of international frontiers and boundaries and/or to the name and designation of any
territory, city or area.
†
BIS and CEPR. raphael.auer@bis.org
‡
BIS and University of Basel. ulf.lewrick@bis.org (corresponding author)
§
BIS and Deutsche Bundesbank. jan.paulick@bis.org
11 Introduction
Gauging cryptoasset flows across borders remains a huge gap in international finance.
The crypto and decentralised finance (DeFi) ecosystem has grown rapidly, spurred by
speculation and rising acceptance of cryptoassets in mainstream finance. Cryptoassets
are increasingly being integrated into exchange-traded funds, futures and other conven-
tional financial instruments. However, despite total market capitalisation exceeding that
of large national stock markets, the macroeconomic implications of cryptoassets – in-
cluding their underlying use cases and risks during market turmoil – remain poorly un-
derstood. A key challenge is that cryptoassets operate on decentralised infrastructure
transcending national boundaries, unlike conventional financial networks governed by in-
termediary institutions and established regulations. In this context, new types of often
elusive intermediaries have emerged in crypto markets.
In this paper, we shed light on a key type of crypto flows: cross-border transactions.
We investigate the trends and drivers of these flows using novel bilateral cross-country
data covering both native cryptoassets and asset-backed stablecoins across up to 184
countries from Q1 2017 to Q2 2024. The data allow us to document the geography of
crypto flows and to uncover the underlying drivers of crypto transactions across distinct
cryptoassets. Specifically, the dataset encompasses Bitcoin (BTC), Ethereum’s native
asset Ether (ETH) and the two largest stablecoins by market capitalisation: Tether
(USDT) and USD Coin (USDC). Including these heterogeneous cryptoassets makes it
possible to capture distinct use cases.1
We begin by documenting the magnitude, time variation and geography of global
crypto flows. Across the four cryptoassets, international flows reached a peak of US$ 2.6
trillion in 2021, roughly equivalent to 12% of global trade in goods at the time. Of this
amount, US$ 1.2 trillion was accounted for by stablecoins. Although transaction volumes
fell back to US$ 1.8 trillion in 2023, they have since resurged, indicating a continued,
albeit uneven, expansion of the crypto ecosystem. We show that the United States,
United Kingdom and major emerging markets represent key nodes in the different crypto
networks. We also document significant geographical shifts in cross-border activity, par-
ticularly from China to other major emerging markets like India, Indonesia and Türkiye,
amidst tighter crypto regulation in China. We find that network concentration varies
across cryptoassets but is notably lower than for cross-border banking, whereas network
density is considerably higher.
Building on a gravity framework as our analytical lens, we investigate various drivers
to shed light on the multifaceted nature of cryptoassets’ utility as both a speculative
financial asset and a medium of exchange. Comparing with traditional financial flows
1
For this analysis, we rely on two datasets that have been complied by commercial data providers and
specify aggregated quarterly flows between major crypto exchanges. These entity-level flows are then
allocated to individual countries based on statistics on the location of app usage or web traffic.
2across borders and its determinants, we highlight the diminishing significance of geo-
graphical proximity in crypto flows, particularly for stablecoins, which appear to largely
“defy” these traditional frictions. Concurrently, we observe that tighter global funding
conditions, known to curtail risk-taking in traditional asset classes, are associated with
reduced flows. This indicates increasing interconnectedness between cryptoassets as spec-
ulative assets and mainstream finance. Furthermore, we identify crypto market-specific
risk factors alongside heightened public awareness of cryptoassets as strong drivers of
crypto flows, illustrating cryptoassets’ role for speculation.
Our analysis points to cryptoassets also being used as a transactional medium. This
is most apparent for stablecoins and low-value BTC payments. Higher opportunity costs
of fiat currency usage, such as high inflation, spur bilateral cross-border transactions in
both unbacked cryptoassets and stablecoins. Likewise, greater economic activity within
both sender and receiver countries is often linked to increased crypto flows in most cases.
Moreover, high costs of remittance payments through traditional financial intermediaries
are associated with significantly larger cross-border flows in stablecoins and low-value
BTC payments from advanced economies to emerging market and developing markets.
Finally, on the efficacy of capital flow management measures (CFMs) governing cross-
border transactions, our analysis suggests that CFMs targeting the reduction of outflows
from the sender country and the limitation of inflows into the recipient country have
little impact on crypto flows. Indeed, CFMs may even correlate with an increase in
cross-border flows of some cryptoassets, hinting at circumvention.
Our contribution to the literature is twofold. First, we present a comprehensive
dataset of the four most important cryptoassets, covering both the leading unbacked
cryptoassets and stablecoins. This allows us to investigate differences and commonalities
across drivers of cross-border crypto flows, indicative of the varied use cases of different
cryptoassets.
In doing so, our analysis of the global network of cross-border flows in cryptoassets ex-
pands the scope fo prior research focussing on individual market segments. Measurement
of cross-border crypto flows can be done based on off-chain transactions (e.g. through ex-
ternal channels like exchanges) or on-chain transactions (i.e. directly on the blockchain).
Our work complements analysis in von Luckner et al. (2023), who explore off-chain BTC
activity using data from two peer-to-peer crypto exchanges. Their findings suggest usage
of BTC for remittances and evading capital controls, resonating with our on-chain data
results. We broaden the analysis by assessing on-chain flows, which are several orders of
magnitude larger, and including additional cryptoassets. The addition of stablecoins is
particularly relevant since these serve different use cases than unbacked cryptoassets.2
2
von Luckner et al. (2023) identify cross-border flows based on the fiat currency used, linking it to
transaction origination and destination. While this works well for emerging market currencies, it is less
suitable for global currencies like the US dollar. Our approach weights business entity flows, capturing
global user engagement, including in the United States, one of the largest crypto markets.
3For example, Moreover, the authors highlight that regulatory uncertainty and limited
financial inclusion are also associated with increased crypto adoption. Our work also
complements related studies of on-chain BTC activity.3
We show that on-chain cross-
border flows are negatively related to broad dollar appreciation but react positively to
changes in global risk aversion. One of our datasets includes BTC flows categorised
by transaction sizes, which allow us to examine the role of cryptoassets as a potential
alternative to low-value remittances processed by traditional financial intermediaries.
Leveraging the richness of the two datasets, we assess drivers and policy measures affecting
the network of directional bilateral flows between countries.
Our second contribution leverages the unique bilateral nature of the data, which allows
for a novel empirical approach to uncover drivers of bilateral relations.4
We unpack the key drivers of bilateral cross-border crypto transactions, drawing a
comparison with the established determinants of traditional flows, namely, trade in goods,
interbank lending and remittances. In this regards, our paper combines insights from
the literature on international capital flows (e.g. Beck et al., 2024, Coppola et al., 2021,
Miranda-Agrippino and Rey, 2020, Hoffmann et al., 2019 and Forbes and Warnock, 2012)
and on global factors (e.g. Obstfeld and Zhou, 2023 and Bruno and Shin, 2015) and in
applications of gravity models to finance (e.g. Badarinza et al., 2022, Brei and von Peter,
2018, and Portes et al., 2001). By examining crypto-specific drivers, we link our paper
to the research in Pagnotta (2022), Liu and Tsyvinksi (2021) and, in particular, Liu
et al. (2022), who identify a set of factors specific to crypto markets that help predict
returns. We provide a detailed discussion of determinants and respective data sources in
Section 2.2.
Moreover, we provide two specific applications that build on bilateral flow data: a
comparison to traditional remittances and an assessment of the impact of CFMs. In
this regard, our findings contribute to the literature on remittance flows, as discussed
among others by Yang (2011) and in the context of financial development by Aggarwal
et al. (2011). In a similar empirical vein to work on remittances by Lueth and Ruiz-
3
See, for example, Makarov and Schoar (2021) for an analysis of the BTC network at the entity level,
and Feyen et al. (2022), who document the evolution of cryptoasset adoption and observe that aggregate
activity is higher in countries with high inflation, currency depreciation and weak institutional quality.
Cerutti et al. (2024) explore cross-border BTC inflows and outflows at the country level to examine
differences in on-chain and off-chain flow patterns. Cardozo et al. (2024) explore global crypto flows and
associated measurement challenges.
4
From a broader perspective, our paper also relates to the growing body of literature on the economics
of cryptoassets. Böhme et al. (2015) provide a comprehensive overview of BTC’s economic significance.
Athey et al. (2016) investigate early adoption and usage patterns, predicting that an increase in users
correlates with a rise in BTC’s price. Halaburda et al. (2022) provide an overview of the literature, focus-
ing on the microeconomics of cryptoassets including drivers of trading and pricing. Using a theoretical
model, Hinzen et al. (2022) demonstrate that BTC’s limited adoption is an equilibrium outcome result-
ing from its design. Another strand of literature focuses on the returns and pricing of BTC. Schilling
and Uhlig (2019b), for example, analyse BTC pricing and its implications for monetary policy within a
currency competition model. Biais et al. (2023) develop a framework to model BTC prices in relation to
transactional benefits and extrinsic volatility.
4Arranz (2008), we employ a gravity framework leveraging bilateral flows. We estimate
determinants of crypto flows likely to reflect remittances. In particular, we find signs that
crypto transactions emerge as a substitute for remittance payments. Country corridors
characterised by high remittance costs or slow processing exhibit larger cryptoasset flows.
This relationship is more pronounced for stablecoins than for unbacked cryptoassets. It
is also more pronounced for low-value BTC transfers than for large value ones (BTC is
the only cryptoasset for which we have data by transaction bands).
Our findings on the ineffectiveness of CFMs resonate with prior research on tradi-
tional capital flows (e.g. Forbes et al., 2015) and associated risks of policy circumvention
(e.g. Cerutti et al., 2017). They also relate to the nascent literature on the impact of
policy measures on crypto activity. Hu et al. (2023) estimate that capital flight accounts
for over one-quarter of Chinese BTC exchange volume, with transactions motivated by
circumvention of restrictions on capital outflows rather than trade in illegal goods or ser-
vices. Other studies infer the impact of capital controls from the persistence of arbitrage
opportunities across BTC markets (e.g. Makarov and Schoar, 2021, Choi et al., 2022).
The remainder of this paper is organised in four sections. In Section 2, we map
out global crypto flows, discuss their key characteristics, and identify potential drivers
to guide our selection of control variables. Section 3 details the key specifications of
the gravity equations central to our empirical approach. Section 4 presents the results,
starting with gravity and global drivers, moving to country-specific drivers and a compar-
ative analysis of remittances, and concluding with an assessment of the impact of policy
interventions on crypto flows. Section 5 concludes.
## 2 Global crypto maps and underlying drivers
## 2.1 Cross-border crypto flows
Mapping cryptoasset flows to countries presents a unique challenge for two reasons. First,
addresses in borderless blockchain networks are public but the ultimate owners are un-
known, making them “pseudonymous”. Second, entities such as crypto exchanges operate
globally. However, they are often elusive in terms of both their geographic domicile and
the location of their customers.5
To bridge these two gaps, we combine two types of data to derive cross-border flows
between countries. First, we use flows in cryptoassets between crypto exchanges from
external data providers.6
These data providers link pseudonymous blockchain addresses
5
For a more detailed discussion of measurement challenges in this context see, for instance, Cardozo
et al. (2024) and Feyen et al. (2022). Notably, the presence of global firms and offshore centres in the
traditional financial system brings about similar attribution challenges as studied in Coppola et al. (2021)
and Beck et al. (2024).
6
The datasets are provided by Chainalysis and Iknaio and have been prepared for this study. These do
5and their transactions to entities such as crypto exchanges using proprietary attribution
data.7
In a second step, we allocate entity flows to locations based on statistics on their
user base.8
To calculate the geographic profile of crypto flows, the entity-to-entity data
are complemented by the geographic distribution of app usage of the respective exchange
or the web traffic of a crypto exchange’s website. For example, if 56% of usage of the
app of a specific exchange originates from the US, 56% of all crypto in- and outflows to
this exchange are allocated to the US. By aggregating over all crypto exchanges, bilateral
cross-country data are obtained.
The first dataset we create in this manner – covering aggregate bilateral BTC flows
and low-value BTC flows – combines exchange-to-exchange flows from Iknaio with Sen-
sorTower app usage statistics.9
SensorTower provides aggregate app download and usage
statistics by country for crypto exchanges. This dataset captures flows within and be-
tween exchanges and includes a breakdown of transfers below US$ 500 and US$ 200 per
transaction. The data vendor (Iknaio) employs restrictive assumptions for on-chain ex-
change flows to reduce false identification, which limits the covered volume and number
of countries. We allocate crypto exchange flows to countries using app usage statistics
and the weighting methodology detailed in Annex A.2.
The second dataset draws on entity flow data from Chainalysis, which allocates coun-
try weights based on web traffic. The resulting dataset encompasses all four major cryp-
toassets: BTC and ETH, the two largest unbacked cryptoassets with freely floating val-
ues, and USDT and USDC, the two largest stablecoins with a peg to the US dollar.10
While BTC and ETH are native assets on their respective blockchains, USDC and USDT
are issued as tokens via smart contracts across multiple chains. Chainalysis data cover
USDC flows on the Ethereum blockchain and USDT flows on both the Ethereum and
Tron blockchains, covering about 67% of USDC issuance and 98% of USDT issuance.11
The entity data construction applies less restrictive assumptions on clustering addresses
and includes a wider range of business entities, such as miners and other services.12
Figure A.2 in the Annex provides graphical evidence to affirm the accuracy of the
not include transaction-level data but instead offer aggregated flows at the quarterly and entity-to-entity
level, along with a breakdown by value bands in the case of Iknaio.
7
In addition, they rely on clustering heuristics to support attribution by grouping addresses that
belong to the same entity (see Möser and Narayanan, 2022). Cerutti et al. (2024) provide a non-technical
overview of how on-chain or off-chain flows can be allocated to exchanges and similar entities.
8
This approach differs from assigning locations based on entities’ headquarters, as is done in the
preparation of international banking statistics. Headquarters are often strategically chosen according to
the regulatory environment and other factors. Our approach better reflects the global reach of crypto
exchanges and other services and where flows originate.
9
SensorTower gathers app usage and download statistics. However, not all crypto exchanges offer an
app, and data may not always be available for all apps via SensorTower.
10
As of January 2025, USDT and USDC accounted for almost 90% of the global market capitalisation
of issued stablecoins, according to data from DeFiLlama.
11
According to data from Circle and Tether as of January 2025.
12
Crypto exchanges account, on average, for about 80% of entity flows in BTC. See also Figure A.1
for a graphical comparison of the aggregate BTC flows obtained from the two data sources.
6approximated flows. Clearly, the pseudo-anonymity of the ledgers implies that a compre-
hensive attribution of transactions to users is impossible, such that a mapping of flows
to countries will always remain an approximation. Even so, our measure of cross-border
flows is tightly linked to the number of crypto exchange users at the country-level, with
variation in the latter accounting for about 64% of the variation in country-level flows.
Moreover, flows show a highly significant and positive correlation with the level of cryp-
toasset adoption across countries obtained from survey data.13
The resulting country-level data highlight the significant growth of cross-border flows
for the major cryptoassets, particularly at the start of 2021 (Figure 1, which is based
on the Chainalysis data). These flows started from less than US$7 billion in Q1 2017
and surged to over US$800 billion by Q4 2021. After declining back to approximately
US$400 billion in 2022 amidst crypto market turmoil, flows picked up again, amounting
to about US$600 billion at the end of our observation period in Q2 2024. Initially, BTC
dominated transaction volumes, accounting for roughly 80% up to Q2 2019. By Q2 2024,
however, its share fell to less than 25% as transactions in stablecoins expanded strongly.
Figure 1: Cross-border crypto flows (US$ billions)
800
600
400
200
0
2024 2023 2022 2021 2020 2019 2018 2017
BTC ETH USDC USDT
Note: The graph presents quarterly aggregates of cross-border flows for four cryptoassets from Q1 2017 to Q2 2024.
We map out a global network of cross-border BTC and USDT flows to visualise the
key nodes and edges, i.e. directional links between two countries, in the first half of 2024,
the two most recent quarters of our period of observation (Figure 2 and Figure 3). Corre-
sponding maps for the other two cryptoassets are provided in Figure A.3 and Figure A.4
in Annex A.1. This BTC network spans 180 countries spread across all continents, nearly
all the 184 countries with non-zero flows in at least one of the cryptoassets in our dataset.
We highlight flows of at least one billion US dollars with black arrows to indicate impor-
13
Given that survey data on cryptoasset adoption captures ownership and general usage of these assets
rather than the intensity of activity, it is intuitive that the correlation with flows is weaker compared to
measures of crypto exchange usage.
7tant edges. These flows accounted for nearly 25% of the total cross-border transaction
volume, even though they represented only 0.15% of the total number of flows. In com-
parison to BTC, the global USDT map is less centered on the United States, with flows
more evenly spread across a few large countries as discussed below.
Figure 2: A Global Bitcoin Map
Cross-border Bitcoin
flows (USD millions)
less than 100
100−250
250−500
500−750
750−1,000
1,000−2,000
2,000−4,000
more than 4,000
no data
Note: Country colours represent the total US$ equivalent of Bitcoin (BTC) sent abroad in the first half of 2024, with
countries grouped into eight categories. The arrows represent bilateral flows equivalent to at least $US 1 billion.
Figure 3: Global Tether (USDT) Map
Cross-border Tether
flows (USD millions)
less than 100
100−250
250−500
500−750
750−1,000
1,000−2,000
2,000−4,000
more than 4,000
no data
Note: Country colours represent the total US$ equivalent of USDT sent abroad in the first half of 2024, with countries
grouped into eight categories. Black arrows represent bilateral flows equivalent to at least $US 1 billion.
The United States, the United Kingdom and major emerging markets represent key
nodes of the networks in leading cryptoassets. BTC flows between the United States
and the United Kingdom grew about tenfold from 2019 (bottom panel of Table 1) to
2023–24 (top panel), outpacing the overall increase in BTC cross-border volumes. These
bilateral links were also the two largest edges in the ETH and USDC network in 2023–24,
respectively. Overall, the United States and the United Kingdom accounted for about
820% of cross-border activity in BTC and ETH, and close to 30% for USDC (Table 2).
Common across all three networks was the geographical shift in flows during this time.
Cross-border activity has moved from China to other major emerging markets, notably
India and Indonesia, against the backdrop of tighter crypto regulation and bans imposed
by Chinese authorities (Auer and Claessens, 2018 and Auer et al., 2022).
Table 1: Largest bilateral flows point to changing geographical patterns
Q3 2023 to Q2 2024
BTC ETH USDC USDT
Pair Flows Share Pair Flows Share Pair Flows Share Pair Flows Share
GB→US 9.89 1.7 US→GB 2.23 1.0 US→GB 6.33 1.9 US→TR 5.89 0.5
US→GB 9.28 1.6 GB→US 2.09 0.9 GB→US 6.23 1.8 US→RU 5.47 0.5
CA→US 4.94 0.8 US→ID 1.30 0.6 IN→US 4.21 1.2 TR→US 5.24 0.5
DE→US 4.89 0.8 US→TR 1.27 0.6 US→IN 4.18 1.2 RU→US 5.00 0.4
US→CA 4.87 0.8 RU→US 1.26 0.6 ID→US 3.85 1.1 GB→US 4.79 0.4
All 592.99 100.0 All 225.54 100.0 All 338.14 100.0 All 1,158.56 100.0
Q1 2019 to Q4 2019
BTC ETH USDC USDT
Pair Flows Share Pair Flows Share Pair Flows Share Pair Flows Share
US→GB 1.02 1.0 US→KR 0.15 0.9 CN→US 0.19 3.2 US→CN 0.08 0.6
CN→US 1.01 1.0 KR→CN 0.14 0.8 US→CN 0.13 2.3 CN→US 0.08 0.6
US→CN 0.91 0.9 KR→US 0.14 0.8 GB→US 0.10 1.8 US→RU 0.07 0.6
GB→US 0.91 0.9 CN→KR 0.13 0.8 US→GB 0.10 1.8 CN→RU 0.07 0.5
RU→US 0.77 0.7 RU→US 0.11 0.7 US→RU 0.06 1.1 US→IN 0.06 0.5
All 105.38 100.0 All 17.00 100.0 All 5.72 100.0 All 12.71 100.0
Note: The top and bottom panels present, for each cryptoasset, the five largest bilateral flows and the sum of all flows in
US$ billions as well as the corresponding percentage share of total flows for the period from Q3 2023 to Q2 2024 and for
the four quarters of 2019, respectively. For USDT, flows are available from Q2 2019. Country abbreviations are based on
the official (ISO 3166-1) alpha-2 codes.
Geographical patterns differ for USDT, with a stronger presence of Türkiye and Russia
(Figure 3). As cross-border volumes jumped from US$ 13 billion in 2019 to more than
US$ 1,100 billion in 2023–24, Türkiye became the second largest sender and receiver of
USDT according to the Chainalysis data. Together with Russia, it represented about
12% of USDT cross-border volume (Table 1 and Table 2). Overall, these observations
highlight the dynamic nature of the global crypto market, with significant changes in the
geographical distribution and volume of cross-border flows over the observed period.
Following years of expansion, network density has recently declined in all four crypto
networks. We record non-zero flows for around 55% of all possible directional links in 2024,
down from more than 60% in 2023 (see Table 3). This follows years of rising density, with
stablecoins experiencing a particularly rapid increase immediately after their inception.
As such, crypto network density is comparable to the density of the global trade network
and significantly more dense than the cross-border banking network (Table 3).14
Network concentration varies across cryptoassets but is notably lower than for cross-
border banking. The top-5 bilateral flows, for instance, accounted for around 2% and
14
For consistency, we calculate network density based on 225 countries, which yields 225×224 = 50,400
theoretically possible directional flows. For inclusion in the sample, we require that a country reports
at least one non-zero cross-border crypto flow, export flow, or cross-border interbank claim. Non-zero
crypto flows were reported by 184 countries during the period of observation.
9Table 2: Major participants (flows in US$ billions, shares in %)
BTC Flows sent Share Flows received Share ETH Flows sent Share Flows received Share
US 102.3 17.3 110.9 18.7 US 30.4 13.5 27.4 12.2
GB 29.6 5.0 30.2 5.1 GB 10.8 4.8 10.5 4.6
RU 23.1 3.9 20.8 3.5 TR 9.9 4.4 10.2 4.5
TR 21.3 3.6 20.1 3.4 RU 9.7 4.3 9.9 4.4
KR 19.2 3.2 21.7 3.7 ID 8.1 3.6 8.9 3.9
USDC USDT
US 82.3 24.3 81.8 24.2 US 98.1 8.5 92.5 8.0
GB 18.5 5.5 18.3 5.4 TR 67.9 5.9 69.5 6.0
IN 13.2 3.9 12.9 3.8 RU 66.1 5.7 66.8 5.8
ID 11.8 3.5 11.6 3.4 VN 44.1 3.8 45.1 3.9
CA 9.9 2.9 9.6 2.8 GB 42.9 3.7 41.2 3.6
Note: The panel depicts the top-5 countries in terms of cross-border flows sent in BTC, ETH, USDC and USDT, respectively,
from Q3 2023 to Q2 2024. It reports the amount of flows sent and received for these countries in US$ billions and as a
percentage share of the total amount of flows, respectively. Country abbreviations are based on the official (ISO 3166-1)
alpha-2 codes.
7% of cross-border transaction volume in USDT and USDC, respectively (Table 3), com-
pared to around 9% and 15% for exports and cross-border interbank claims at the end
of our sample period. Moreover, all top-10 interbank claims were among large advanced
economies, in contrast to the comparatively strong footprint of major emerging market
economies in each of the four cryptoasset networks. These differences motivate our analy-
sis of the various drivers of cross-border crypto flows in comparison to those underpinning
traditional finance.
Table 3: Network density and concentration (in %)
BTC ETH USDC USDT Exports IB claims
Network density
Q1 2018 52.3 51.6 NA 38.3 53.5 12.8
Q1 2019 53.0 52.4 49.0 43.6 53.8 12.7
Q1 2020 53.0 52.6 51.0 50.8 53.6 12.7
Q1 2021 60.9 60.0 58.5 59.3 54.4 12.4
Q1 2022 59.0 57.6 57.5 57.7 55.0 12.2
Q1 2023 63.4 62.4 61.3 61.1 54.9 12.0
Q1 2024 56.6 55.1 53.7 54.5 53.8 11.8
Concentration (2023–24)
Top-5 5.7 3.6 7.3 2.3 9.4 15.1
Top-10 9.2 6.2 12.1 4.1 14.6 23.0
Top-50 24.4 18.2 33.1 13.5 32.4 50.8
Note: The top panel depicts the network density for each cryptoasset, defined as the number of non-zero flows as a percent-
age share of the maximum number of possible directional flows between the 225 reporting countries in the network. The
bottom panel presents the flows accounted for by the top-5, top-10 and top-50 directional country-pair links, respectively,
as a percentage share of all flows from Q3 2023 to Q2 2024. For interbank (IB) claims, we report the shares based on the
average stock of claim from Q3 2023 to Q1 2024 (the latest available data point).
## 2.2 Potential drivers of cross-border crypto flows
Cryptoassets can serve multiple purposes, which in turn affect drivers of cross-border
flows. Unbacked cryptoassets can be viewed as financial assets, sought after for investment
or speculation, but also as a digital medium of exchange offering transactional benefits
(Biais et al., 2023, Schilling and Uhlig, 2019b). Stablecoins like USDC and USDT derive
10stability by being pegged to the US dollar via off-chain reserves. They often serve as
substitutes for fiat currencies in DeFi protocols, such as token swaps, liquidity pools and
lending platforms. This gives rise to their different geographic profiles in cross-border
flows compared to unbacked cryptoassets.
The sensitivity of cross-border flows to different drivers is expected to vary with their
usage patterns. Speculative activity, for instance, would likely depend on global condi-
tions for funding in major crypto markets. Conversely, use of cryptoassets as a medium of
exchange could depend more strongly on conditions in the sending and receiving country,
such as the stability of the local fiat currencies. Policy interventions, such as capital con-
trols, could also influence cryptoasset usage, either by constraining cross-border activity
as generally intended by the measures or by incentivising circumvention of the controls
on traditional financial flows through cryptoassets. To determine drivers of cross-border
crypto flows, we therefore consider a broad range of metrics at global, country, and
country-pair levels. Table 4 provides summary statistics of the crypto flow variables and
controls used in our regression analysis in the next sections.
First, we supplement our dataset with measures of financial activity through tradi-
tional intermediaries to benchmark against crypto flows. Specifically, we gather data
on bilateral interbank cross-border claims from the BIS international banking statistics.
We also estimate annual bilateral remittances following the World Bank’s methodology.15
For a subset of countries, bilateral data on remittance cost is available from the World
Bank’s remittance prices database. High costs of processing transactions through tradi-
tional intermediaries provide additional incentives to rely on cryptoassets for cross-border
payments, in particular related to remittances (Schilling and Uhlig, 2019a). We also use
quarterly bilateral merchandise exports from the IMF’s Direction of Trade dataset to
compare crypto flows with cross-border flows in goods.
We consider traditional measures of frictions, such as physical distance or information
asymmetry. The impact of these measures is a priori unclear. On the one hand, they could
be expected to have little impact on cross-border crypto activity, given the design and
ambition of the decentralised ledger technology that underpins these networks. On the
other hand, if seen from the perspective of crypto networks as facilitators of transactions
tied to real economic activity, offering substitutes for traditional payment methods in the
financial system (Athey et al., 2016; von Luckner et al., 2023), factors that hinder cross-
border economic activity, such as physical distance or language barriers, would similarly
influence cross-border crypto flows that mimic the payment leg of economic transactions.
To examine these dynamics, we include proxies for frictions in bilateral flows widely used
in international trade and capital flow studies, so-called “gravity” measures (Badarinza
15
The methodology in Ratha and Shaw (2007) converts aggregate data on remittances received at the
country level into bilateral remittance flows based on migrant stocks and income levels in the origin and
destination country.
11et al., 2022, Brei and von Peter, 2018, Portes et al., 2001). Specifically, we use the
log distance between the most populated cities of each country pair, a binary variable
indicating shared borders, and a binary variable for common official or primary languages.
These data are sourced from the CEPII gravity database (Conte et al., 2022).
Global factors influence investors’ risk-taking capacity and sentiment in other asset
classes. Tightening global financial conditions, such as US dollar appreciation (Obstfeld
and Zhou, 2023, Bruno and Shin, 2015) or rising corporate credit spreads (Gelos et al.,
2022), could reduce cross-border crypto flows. Rising market volatility may attract spec-
ulative traders and boost transaction volumes. Accordingly, we examine several global
factors (Miranda-Agrippino and Rey, 2020) to assess their impact on crypto flows. We
use the log of the CBOE Volatility Index (VIX), which reflects expected volatility in US
equity markets, as a proxy for global financial market volatility. Additionally, we control
for changes in credit risk pricing using option-adjusted spreads tracked by the ICE BofA
BBB US corporate index (Gelos et al., 2022). We also test the effect of a rise in the broad
nominal dollar index. Global monetary conditions are gauged via the Federal funds rate,
and quarterly real US GDP growth approximates the global economic backdrop.
Crypto’s usage as a speculative asset implies that risk factors driving cryptoasset
returns (Liu et al., 2023, Liu and Tsyvinksi, 2021) likely affect transaction volumes.
These factors are distinct from other macroeconomic factors (Liu et al., 2023), providing
complementary explanatory power. We thus expand global factors to include “crypto risk
factors”. We calculate the relative volatility of the BTC price in US dollars over the past
quarter. Additionally, we utilise the three global crypto risk factors developed by Liu
et al. (2023) – market, size, and momentum – which explain significant cross-sectional
variation in cryptoasset returns.
Economic factors specific to the sending or receiving country could also incentivise
cryptoassets usage, particularly for payments. High exchange rate volatility, for instance,
could drive such usage (see e.g. Feyen et al., 2022). To assess the relevance of these
country-specific factors, we consider CPI inflation and real GDP growth rates compiled
by the World Bank and the BIS based on national statistics.16
We also obtain from the
BIS bilateral exchange rate volatility for each country-pair over the past quarter. Addi-
tionally, we measure cryptoasset awareness through country-level Google search indices
for “Bitcoin”, “Ethereum,” and “Stablecoin” (see e.g. Liu et al., 2022). These factors are
expected to influence crypto flows when exceptionally high, such as during local currency
pressures or surges in public interest. To capture this, we define a binary variable set to
one (zero otherwise) for quarters where the factor exceeds the 75th
percentile of its pooled
distribution. For Google searches, standardised nationally, we set the binary variable to
one for observations surpassing the 75th
percentile of the country’s own time series.
16
For countries without quarterly data, we interpolate quarterly inflation and GDP growth rates from
annual figures.
12Table 4: Summary statistics
Mean St.dev. P10 P25 P50 P75 P90 N Mean St.dev. P10 P25 P50 P75 P90 N
Cross-border crypto flows Global factors
BTC ($ ’000) 3,267.38 29,039.10 0.08 2.16 40.67 501.00 3,686.17 846,414 VIX (log) 2.89 0.32 2.45 2.65 2.83 3.21 3.28 30
ETH ($ ’000) 1,569.45 15,913.54 0.02 0.62 13.40 189.49 1,520.53 833,470 High-yield spread (log of %) 0.44 0.19 0.18 0.36 0.43 0.55 0.63 30
USDC ($ ’000) 2,162.38 27,509.73 0.00 0.26 10.07 198.80 1,830.66 637,874 Federal funds rate (%) 1.83 1.75 0.12 0.17 1.35 2.38 5.17 30
USDT ($ ’000) 4,816.42 33,386.86 0.00 0.31 21.07 526.28 5,363.44 704,617 U.S. growth (%) 2.49 2.94 0.13 2.09 2.44 3.24 4.50 30
BTC between exchanges ($ ’000) 3,128.56 22,221.52 0.95 27.59 226.22 1,158.15 4,537.51 205,309 Dollar index (log) 4.59 0.04 4.54 4.57 4.59 4.63 4.65 30
of which < $500 ($ ’000) 5.05 39.10 0.00 0.04 0.32 1.68 6.58 205,309
of which < $200 ($ ’000) 1.97 15.81 0.00 0.01 0.11 0.60 2.47 205,309
Gravity Crypto risk factors
Distance (log km) 8.71 0.80 7.57 8.36 8.91 9.27 9.54 30,937 BTC-USD volatility (coeff. of variation) 0.17 0.10 0.07 0.09 0.14 0.23 0.28 30
Common border (binary) 0.02 0.13 0.00 0.00 0.00 0.00 0.00 30,937 Crypto market 0.02 0.04 −0.04 −0.01 0.01 0.03 0.08 26
Common language (binary) 0.14 0.34 0.00 0.00 0.00 0.00 1.00 29,935 Crypto size 0.03 0.05 −0.02 0.00 0.02 0.05 0.12 26
Crypto momentum 0.01 0.02 −0.01 −0.00 0.01 0.02 0.04 26
Traditional finance Country-level factors
Interbank claims ($ mn) 2,698.37 18,757.36 0.09 1.45 26.80 306.00 2,350.00 182,508 Inflation (%) 143.16 5,162.72 0.42 1.45 3.26 6.72 13.39 5,200
Exports ($ mn) 189.14 1,944.40 0.00 0.02 0.56 12.10 131.70 819,932 GDP growth (%) 2.64 7.58 −3.09 0.41 2.92 5.10 7.37 5,915
Remittances ($ mn) 61.84 646.15 0.00 0.02 0.46 6.02 52.48 79,190 Bilateral FX volatility (coeff. of variation) 3.55 15.10 0.40 0.90 1.63 2.86 5.31 256,174
Remittance cost (log of pp of transaction) 1.53 0.59 0.83 1.16 1.52 1.92 2.25 10,692 Google searches: Bitcoin (index) 25.56 18.20 7.00 12.33 21.00 34.67 52.67 6,043
Capital flow measures (categorical) −0.01 0.21 0.00 0.00 0.00 0.00 0.00 896,525 Google searches: Ethereum (index) 15.00 18.64 0.00 0.00 8.00 23.33 44.00 6,262
Google searches: Stablecoin (index) 4.38 11.18 0.00 0.00 0.00 0.00 18.33 3,809
Note: The table presents summary statistics for the dependent variables and controls. Data sources are reported in parentheses at the end of each definition in the following. Cross-border
crypto flows: US$ equivalent of all quarterly country-to-country flows in Bitcoin (BTC), Ether (ETH), USD Coin (USDC) and Tether (USDT), respectively (Chainalysis). The table also
reports the cross-border BTC flows including only transactions among crypto exchanges, including for transactions of less than US$ 500 or US$ 200, respectively (Iknaio, SensorTower, World
Bank; see also Annex A.2). Distance: log distance in kilometers between the most populated city of each country (CEPII). Common border (language): binary variable equal to one and
zero otherwise for countries with common border (official or primary language) (CEPII). Interbank claims: total amount of cross-border interbank claim, e.g. loans, deposits (BIS). Exports:
quarterly value of country-to-country merchandise exports (IMF). Remittances: annual bilateral remittances, estimated based on the methodology in Ratha and Shaw (2007), using migrant
stocks and remittances (World Bank). Remittance cost: log of the average percentage total cost of the transaction (World Bank – Remittance Prices Worldwide). Capital flow measures:
categorical variable that is equal to +1 (−1) if either the sending country tightened (loosened) net outflow restrictions or the receiving country tightened (loosened) inflow restrictions or
both occurred in a given quarter; and zero otherwise. CFM data are from Binici et al. (2023). VIX: CBOE Volatility Index (FRED). High-yield spread: ICE BofA BBB US Corporate
Index option-adjusted spread (FRED). Federal funds rate: quarterly average Federal funds rate (FRED). US growth: US real GDP growth rate (FRED). Dollar index: log of the broad (i.e.
covering 64 economies) effective nominal US dollar exchange rate index, normalised to an average of 100 units in 2020 (BIS). BTC-USD volatility: quarterly coefficient of variation of the
US$ price of BTC (Investing.com). Crypto risk factors: common risk factors for market, size and momentum as provided by Liu et al. (2022). Inflation: consumer price inflation rate (BIS
and World Bank). GDP growth: real GDP growth rate (BIS and World Bank). Bilateral FX volatility: quarterly coefficient of variation of the bilateral exchange rate of the sending and
receiving country-pair (BIS). Google searches: national index of Google searches of the term “Bitcoin”, “Ethereum”, and “Stablecoin”, respectively (Google).
13The pseudo-anonymity of the crypto network could be exploited to circumvent policy
measures restricting cross-border capital flows, such as CFMs. Transactions motivated by
evading these measures are driven by alternative incentives, with senders and recipients
willing to incur additional costs to move funds across borders (Hu et al., 2023). That
said, even if policy measures predominantly target traditional financial flows, limits to
cross-border arbitrage in crypto markets (e.g. Makarov and Schoar, 2020) suggest that
national restrictions on capital flows could nevertheless hamper crypto activity.
We investigate the impact of policy measures on crypto flows by considering CFMs,
using the dataset by Binici et al. (2023). We calculate quarterly changes in sending
(receiving) countries’ measures to control capital outflows (inflows). Based on this, we
construct a categorical variable measuring directional changes in CFM tightness for each
country-pair. Values for CFMt of +1 indicate a net tightening of outflow restrictions by
the sending country or inflow restrictions by the receiving country (or both) in quarter
t. Conversely, values of −1 indicate loosening of restrictions by either the sending or
receiving country (or both). All other observations are assigned a zero value.17
## 3 Empirical approach
Our empirical approach leverages the directed bilateral flow data to investigate the drivers
of cross-border crypto flows. This allows us to take advantage of the richness of the
network data and to examine factors at the global, country and country-pair level.
We assess these drivers building on the extant literature on gravity equations (e.g.
Anderson and Yotov, 2016 and Anderson and van Wincoop, 2003) and assume that
cross-border crypto flows, fijt, from sending country i (henceforth “senders”) to receiving
country j (henceforth “receivers”) in quarter t can be represented as follows:
fijt =
fit
Π−θ
it
fjt
P−θ
jt
τ−θ
ijt , (1)
where fit :=
P
j fijt and fjt :=
P
i fijt represent the total cross-border transaction volume
of the two countries, respectively. The term τijt accounts for bilateral frictions that
could hinder cross-border crypto transactions, whereas θ is the associated transaction
elasticity. Πit and Pjt represent the Anderson and van Wincoop (2003) outward and
inward multilateral resistance terms, which follow from the workhorse general equilibrium
gravity model as (e.g Weidner and Zylkin, 2021):
17
Unlike indices that track the cumulative number of measures implemented or lifted, changes in CFMs
capture shifts in the policy stance without assuming the relative tightness or importance of individual
measures.
14Π−θ
it =
N X
j=1
fjt
P−θ
jt
τ−θ
ijt , P−θ
jt =
N X
i=1
fit
Π−θ
it
τ−θ
ijt . (2)
Applied to the case of crypto flows, Πit summarises the sender’s ability to transact in
cryptoassets with more crypto-affine receivers, whereas Pjt captures the receiver’s ability
to transact with more crypto-affine senders. Seen through the lens of cryptoassets being
used as a medium of exchange, the corresponding flows represent the payment leg of
real and financial transactions, providing a direct analogue to the application of gravity
equations in trade (e.g. Anderson and Yotov, 2016 or Anderson and van Wincoop, 2003)
and finance (e.g. Badarinza et al., 2022, Brei and von Peter, 2018 or Portes et al., 2001).
Following the literature, we parameterise the bilateral frictions τijt as an exponential
function of observable explanatory variables, xijt, and the unobservable ωijt:
τ−θ
ijt = exp(xijt β)ωijt. (3)
Substituting the above into (1) and defining sender-time and receiver-time fixed effects
as αit = ln

fit/Π−θ
it

and γjt = ln

fjt/P−θ
jt

, respectively, yields the two-way gravity
equation:
fijt = exp(αit + γjt + xijt β)ωijt. (4)
We estimate equation (4) based on the Poisson pseudo maximum likelihood (PPML)
estimator, which accommodates the presence of zero flows and accounts for heteroskedas-
ticity (Santos Silva and Tenreyro, 2006), and has therefore become the preferred choice
for gravity analysis (Anderson and Yotov, 2016).
We employ several specifications of equation (4) to assess drivers of crypto flows at
the global, country, and country-pair level, respectively.
We begin by gauging the impact of global factors, including global risk factors that
pertain to crypto markets (e.g. Liu et al., 2023). By determining global funding conditions
(e.g. Miranda-Agrippino and Rey, 2020) and investor sentiment, these factors could have
a first-order impact on cross-border crypto flows. Since factors that are common across
all countries, xt, are absorbed by the fixed effects in equation (4), we consider a less
restrictive specification with fixed effects only at the sender and receiver level, αi and
γj, while controlling for time-invariant bilateral frictions, xij, based on a standard set of
gravity controls (as discussed below):
fijt = exp[αi + γj + (xij + xt−1)β]ωijt. (5)
To err on the side of caution, we lag xt by one quarter to address potential endogeneity
concerns that could relate to cross-border crypto flows affecting global factors, notwith-
standing the still modest scale of transaction volume if compared with global traditional
15finance activity. In this specification, the impact on crypto flows of variation in country-
specific factors over time will be subsumed by the effect attributed to the global factors.
As a natural extension of (5), we add to the global factors (lagged) time-varying
controls at the sender level, xit−1, and receiver level, xjt−1, respectively:
fijt = exp[αi + γj + (xij + xt−1 + xit−1 + xjt−1)β]ωijt. (6)
We estimate the effect of time-varying bilateral frictions based on exploiting the rich-
ness of remittances data. Specifically, we employ directional country-pair information,
xijt, available for the cost of sending remittances. This allows us to saturate the model
with sender-time, αit, and receiver-time, γjt, fixed effects. We then estimate the model:
fijt = exp[αit + γjt + (xij + xijt−1)β ]ωijt. (7)
Finally, we move to the fully saturated specification in order to assess the impact of
policy interventions. Specifically, we assess the impact of CFMs on crypto flows. Recent
empirical research on network analysis has underscored the importance of accounting for
time-invariant sender-receiver (“pair”) fixed effects, ηij, in order to address any potential
bias that may arise from the endogeneity of policy choices (e.g. in the case of trade
policy Head and Mayer, 2014, Baier and Bergstrand, 2007). CFMs, for instance, are
often imposed to address financial imbalances, such as excessive capital flows, violating
the assumption of exogeneity in a regression on these flows.
Formally, we expand the parameterisation of the friction term, τ, in (3) as:
τ−θ
ijt = exp(ηij + xijt β)ωijt. (8)
For expositional clarity, we replace the controls, xijt, with a measure of the direction of
(lagged) bilateral policy interventions, cfmijt−1. This measure can take on values of 1
or −1 to indicate a tightening and loosening of policy measures, respectively, and is zero
otherwise. Building on (4), this yields the three-way gravity equation:
fijt = exp(αit + γjt + ηij + cfmijt−1β)ωijt. (9)
Here, all global and national drivers as well as any time-invariant determinants of bilateral
crypto flows are absorbed by the comprehensive set of fixed effects. Any impact of policy
interventions will therefore be identified from time-variation in flows within a sender-
receiver pair.
164 Results
## 4.1 Gravity and global factors as drivers of international crypto
flows
We start our analysis by examining how, based on gravity equations following the specifi-
cation in equation (5), measures of geographical and linguistic distance affect cross-border
BTC flows, as the predominant cryptoasset (Table 5).18
Cross-border interbank claims (column 1) and exports (column 2) serve as our initial
benchmark. Consistent with prior research emphasising the importance of informational
frictions in international finance (e.g. Brei and von Peter, 2018, Portes et al., 2001), banks
from more distant countries maintain lower claims on each other, whereas banks from
neighbouring countries or countries that share a common language exhibit higher claims.
The effects are economically significant: a 1% increase in distance is associated with a
0.6% decline in claims, whereas countries with a common border and common language
exhibit higher claims than otherwise of around 84% (calculated as exp[0.608]−1) and 44%,
respectively. The impact of distance is even more pronounced for exports, consistent with
it implying greater frictions for physical trade than for financial transactions. Here, we
estimate an elasticity of −0.75% and more than a doubling of trade volumes for countries
that share a common border.
Since overcoming information asymmetry is at the core of the decentralised ledger
technology, we expect a diminished role of geographical and linguistic factors on cross-
border BTC flows. In line with this, the estimated elasticity of distance declines to less
than −0.1% and the common border effect becomes both quantitatively and statistically
insignificant (columns 3 to 7 of Table 5). At around 13%, the impact of an increase in
BTC flows associated with a common language is less than one third of the effect observed
in cross-border banking.19
The influence of global factors on cross-border BTC flows tallies with an increasing
integration of the BTC ecosystem into traditional finance (columns 4 to 7). High expected
financial market volatility, as gauged by the VIX, consistently exhibits a strong positive
relationship with BTC flows with an elasticity of around 2%. This finding tallies with
speculative trading motives and also accords with off-chain BTC activity (e.g. Di Casola
et al., 2023) as well as markets dominated by institutional investors, such as FX markets
(e.g. Cespa et al., 2021). Tighter global funding conditions, in turn, hamper cross-border
18
To ensure consistency, the regressions are conducted using data from Q1 2017 to Q2 2023, the period
for which all control variables were available at the time of writing
19
For our alternative measure of BTC flows based on the more narrow sample of exchange-to-exchange
flows and alternative locational weighting (see Annex A.2), we estimate a stronger impact of sharing a
common language, comparable to the estimate for interbank claims. This accords with crypto exchanges
with strong interconnections catering to users with similar native languages, e.g. by advertising their
services in the same language.
17Table 5: Gravity, global and crypto risk factors as drivers of Bitcoin flows
IB claims Exports Bitcoin flows
(1) (2) (3) (4) (5) (6) (7)
Gravity
Distance −0.582∗∗∗
−0.750∗∗∗
−0.080∗∗∗
−0.084∗∗∗
−0.084∗∗∗
−0.084∗∗∗
−0.084∗∗∗
(0.041) (0.027) (0.013) (0.014) (0.014) (0.014) (0.014)
Common border 0.608∗∗∗
0.757∗∗∗
0.002 −0.001 −0.001 −0.001 −0.001
(0.161) (0.083) (0.033) (0.035) (0.035) (0.035) (0.035)
Common language 0.364∗∗∗
−0.029 0.124∗∗∗
0.126∗∗∗
0.126∗∗∗
0.126∗∗∗
0.126∗∗∗
(0.110) (0.072) (0.027) (0.028) (0.028) (0.028) (0.028)
Global factors (t–1)
VIX 2.244∗∗∗
1.699∗∗∗
2.086∗∗∗
2.229∗∗∗
(0.028) (0.019) (0.028) (0.025)
High-yield spread −3.390∗∗∗
−3.781∗∗∗
−3.355∗∗∗
(0.035) (0.032) (0.031)
Dollar index −10.525∗∗∗
(0.136)
Federal funds rate −0.037∗∗∗
−0.023∗∗∗
(0.003) (0.003)
US growth −0.045∗∗∗
0.005∗∗∗
(0.002) (0.002)
Crypto risk factors (t–1)
BTC-USD volatility 1.472∗∗∗
0.870∗∗∗
1.139∗∗∗
(0.037) (0.035) (0.033)
Crypto market 7.470∗∗∗
(0.061)
Crypto size −2.330∗∗∗
(0.080)
Crypto momentum −4.981∗∗∗
(0.178)
N 146,014 582,171 671,794 668,467 668,467 668,467 668,467
Pseudo R2 0.882 0.928 0.992 0.936 0.889 0.938 0.947
FE: sender×t & receiver×t Yes Yes Yes
FE: sender & receiver Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the quarterly US dollar amount of bilateral (1) cross-
border interbank (IB) claims; (2) merchandise exports; and (3–7) bilateral cross-border Bitcoin (BTC) flows. To ensure
comparability across the different specifications, the regressions are estimated based on using observations from Q1 2017
up to Q2 2023, consistent with the last available quarter of observation for the crypto risk factors (i.e. Q1 2023) at the
time of writing. Robust standard errors, clustered by country pairs, in parentheses.
BTC activity. For one, a 1% increase in the credit spread on high-yield debt is associated
with a decline in cross-border BTC transaction volume of more than 3%. Likewise, a 1%
appreciation of the US dollar index is associated with a more than 10% decline in BTC
cross-border flows BTC (column 5). This supports the notion of increased funding of
BTC activity through investors susceptible to financial losses from dollar appreciation,
such as those from major emerging markets with a strong footprint in the BTC network.20
A tightening of global monetary conditions is associated with a reduction in cross-
border BTC transaction volumes. Controlling for variation in the VIX and spreads, we
estimate that an increase in the Federal funds rate by the typical increment of 25 basis
points is associated with a statistically significant but quantitatively modest decline of
about 1% (columns 6 and 7).21
In the same vein, we find that an increase in US growth
20
See e.g. Bruno and Shin (2015) for a discussion of how US dollar appreciation constrains local
currency borrowers’ leverage capacity.
21
Based on column 6 of Table 5, the impact of a 25 basis point change is given by exp(−0.037×0.25)−1.
18rates, a closely watched indication of future monetary policy tightening during the ob-
servation period, is associated with a reduction in cross-border BTC transaction volumes
by 4.5% for a one percentage point rise in the US GDP growth rate (column 6).
We augment our specification by adding risk factors that have been shown to explain
the cross-sectional variation of crypto returns. For one, we find a positive contribution
to cross-border transaction volumes from higher volatility of BTC prices in US$ terms,
indicative of speculation being a driving force of international BTC flows (column 4 to 6).
Building on this, we assess the inclusion of market, size, and momentum factors,
all highly statistically significant (column 7). Cross-border BTC transaction volumes
increase following periods of excess crypto market returns, with a positive, significant
loading on the lagged market factor. Interpreting the size factor as a liquidity premia
gauge per Liu et al. (2022), we observe that volumes decline after episodes of high liquid-
ity demand in crypto markets. As BTC is among the most liquid cryptoassets, this likely
reflects a reversal in elevated BTC transaction volumes during such episodes.22
The neg-
ative momentum factor impact, capturing the investor overreaction premium, indicates
a reversal in transaction volumes after quarters of elevated crypto returns.
We compare these findings to estimates based on flows of the other cryptoassets to
gain insights on potential similarities and differences in their underlying use cases.
Cross-border ETH flows exhibit a similar relationship with the above factors for BTC
(Table 6). This accords with the similarity of their network characteristics (recall Table 1
and Table 2) and the pairwise correlation of bilateral flows of nearly 0.9. Based on the
most comprehensive specifications in columns 6 and 7 of Table 5, we find that the impact
of gravity factors and crypto risk factors declines only modestly for ETH flows compared
to BTC flows. At about 3% and −5%, the estimated elasticities with respect to the VIX
and to high-yield spreads are also broadly equivalent to those for BTC flows. Differences
arise in terms of the impact of increases in US policy rates, for which we do not observe a
decline in ETH flows, whereas our estimates for the impact of US growth on ETH flows
suggest a positive, although quantitatively small, relationship.
Flows in stablecoins across borders share a number of characteristics with unbacked
cryptoassets but differ in several important ways (columns 3 to 6 of Table 6). Common
among all four cryptoassets, and particularly pronounced for stablecoins, is the positive
association of flows with an increase in the VIX and a negative one with a tightening
of global credit conditions as approximated by high-yield spreads. Gravity factors, by
contrast, play a subdued role for stablecoin flows. For one, USDT flows exhibit no
apparent link to linguistic proximity, consistent with none of the top country-pairs of the
USDT network sharing a common language (Table 1).
22
Consistent with this, the coefficient on the contemporaneous (but potentially endogenous) size factor
is positive, aligning with high size factor values during elevated BTC transaction volumes. Results are
available upon request.
19Table 6: Drivers of cross-border flows in ETH, USDC and USDT
ETH ETH USDC USDC USDT USDT
(1) (2) (3) (4) (5) (6)
Gravity
Distance −0.048∗∗∗
−0.048∗∗∗
−0.000 −0.000 −0.025∗∗∗
−0.025∗∗∗
(0.008) (0.008) (0.004) (0.004) (0.004) (0.004)
Common border −0.020 −0.020 0.018 0.018 0.003 0.003
(0.019) (0.019) (0.012) (0.012) (0.012) (0.012)
Common language 0.107∗∗∗
0.107∗∗∗
0.025∗∗∗
0.025∗∗∗
0.003 0.003
(0.020) (0.020) (0.008) (0.008) (0.008) (0.008)
Global factors (t–1)
VIX 3.139∗∗∗
3.244∗∗∗
6.811∗∗∗
6.553∗∗∗
6.810∗∗∗
6.964∗∗∗
(0.039) (0.035) (0.050) (0.069) (0.032) (0.038)
High-yield spread −5.173∗∗∗
−4.777∗∗∗
−6.403∗∗∗
−7.471∗∗∗
−7.757∗∗∗
−8.668∗∗∗
(0.039) (0.046) (0.037) (0.115) (0.039) (0.057)
Federal funds rate −0.005 0.033∗∗∗
0.446∗∗∗
0.508∗∗∗
0.492∗∗∗
0.566∗∗∗
(0.006) (0.005) (0.007) (0.008) (0.003) (0.003)
US growth 0.008∗∗∗
0.061∗∗∗
0.081∗∗∗
0.037∗∗∗
0.066∗∗∗
0.058∗∗∗
(0.001) (0.001) (0.003) (0.002) (0.002) (0.002)
Crypto risk factors (t–1)
BTC-USD volatility 0.502∗∗∗
−5.556∗∗∗
−4.022∗∗∗
(0.045) (0.089) (0.054)
Crypto market 7.513∗∗∗
−5.672∗∗∗
0.629∗∗∗
(0.074) (0.342) (0.091)
Crypto size −2.688∗∗∗
−6.576∗∗∗
−6.747∗∗∗
(0.061) (0.130) (0.096)
Crypto momentum −2.842∗∗∗
12.625∗∗∗
2.083∗∗∗
(0.191) (0.426) (0.218)
N 657,913 657,913 484,419 484,419 547,740 547,740
Pseudo R2 0.936 0.943 0.927 0.923 0.912 0.913
FE: sender & receiver Yes Yes Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the quarterly US dollar equivalent of bilateral
cross-border flows in (1–2) ETH (Ether); (3–4) USDC (USD Coin); (5–6) and USDT (Tether), respectively. To ensure
comparability across the different specifications, the regressions are estimated based on using observations from Q1 2017
up to Q2 2023, consistent with the last available quarter of observation for the crypto risk factors (i.e. Q1 2023) at the
time of writing. Robust standard errors, clustered by country pairs, in parentheses.
Unlike BTC and ETH, stablecoin flows show a strong negative association with BTC-
USD volatility. Crypto risk factors also exhibit significant loadings for stablecoins, with
reversed signs for the momentum factor (USDC and USDT) and market factor (USDC)
compared to unbacked cryptoassets. This aligns with the positive correlation between
BTC-USD volatility and the market factor. Large price movements in unbacked cryptoas-
sets may erode investor confidence in stablecoins’ peg or divert speculative investment.
When market momentum in unbacked cryptoassets reverses, stablecoin transactions rise,
aligning with the positive momentum factor coefficients for stablecoins.
Moreover, stablecoin flows are tightly linked to US monetary conditions, reflecting
their close ties to the currency they are pegged to. A 25 basis point rise in the Fed-
eral funds rate is associated with an increase in cross-border USDC flows of about 12%
and 15% for USDC and USDT, respectively. Moreover, as for ETH, we find a positive
association of flows with US growth, with semi-elasticities of around 4% to 8%.23
23
To affirm the robustness of our findings, we assess flows aggregated at the country level in Annex A.3.
Overall, the findings of this analysis is consistent with the findings presented in our main analysis based
on the much more detailed bilateral country flows.
204.2 Country-specific drivers
We next assess the importance of country-specific drivers of crypto flows at the sending
and receiving country, respectively. Our focus is on conjunctural macroeconomic factors
since slower-moving structural factors, such as demographics and the level of financial
development will be largely absorbed by the comprehensive set of fixed effects we employ
to control for potential confounding factors. In all our specifications, we account for the
global factors and the bilateral gravity controls discussed above (reported in column 6 of
Table 5).24
Table 7: How are crypto flows related to country-specific factors?
BTC ETH USDC USDT USDC USDT
(1) (2) (3) (4) (5) (6)
Sender (t–1)
High inflation 0.033∗∗
0.162∗∗∗
0.428∗∗∗
0.146∗∗∗
0.533∗∗∗
0.176∗∗∗
(0.014) (0.013) (0.036) (0.016) (0.052) (0.018)
High GDP growth 0.103∗∗∗
0.062∗∗∗
0.008 0.063∗∗∗
0.013 0.059∗∗∗
(0.013) (0.012) (0.018) (0.014) (0.022) (0.019)
High Bitcoin awareness 0.096∗∗∗
(0.017)
High Ethereum awareness 0.261∗∗∗
0.361∗∗∗
0.312∗∗∗
(0.020) (0.037) (0.024)
High stablecoin awareness 0.133∗∗∗
0.146∗∗∗
(0.023) (0.018)
Receiver (t–1)
High inflation 0.009 0.159∗∗∗
0.436∗∗∗
0.157∗∗∗
0.547∗∗∗
0.174∗∗∗
(0.015) (0.012) (0.036) (0.016) (0.053) (0.018)
High GDP growth 0.107∗∗∗
0.096∗∗∗
−0.020 0.075∗∗∗
−0.010 0.061∗∗∗
(0.013) (0.012) (0.016) (0.014) (0.018) (0.019)
High Bitcoin awareness 0.082∗∗∗
(0.018)
High Ethereum awareness 0.273∗∗∗
0.327∗∗∗
0.319∗∗∗
(0.020) (0.038) (0.024)
High stablecoin awareness 0.080∗∗∗
0.161∗∗∗
(0.023) (0.018)
High bilateral FX volatility −0.002 −0.015 0.072∗
0.016 0.056 0.076∗∗∗
(0.013) (0.013) (0.038) (0.015) (0.047) (0.020)
N 225,833 221,705 167,386 195,529 27,984 32,896
Pseudo R2 0.905 0.911 0.916 0.868 0.882 0.795
Gravity controls Yes Yes Yes Yes Yes Yes
Global factors Yes Yes Yes Yes Yes Yes
FE: sender & receiver Yes Yes Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the quarterly US dollar equivalent of bilateral cross-
border flows in the cryptoasset reported in the top row. Robust standard errors, clustered by country pairs, in parentheses.
All regressions include controls for gravity (distance, common language and common border), lagged global factors (VIX,
high-yield spreads, US policy rate change and US growth) as defined in Table 4. High inflation and high GDP growth are
binary variables equal to one (zero otherwise) for values in the top quartile of the sample distribution. High awareness is
a binary variable equal to one (zero otherwise) if the number of Google searches for “Bitcoin” (column 1), for “Ethereum”
(columns 2 to 4), and for “Stablecoin” (columns 5 and 6), respectively, are in the top quartile of the country’s own time
series of searches.
24
We do not account for crypto risk factors in order to make use of the full sample length since these
factors were only available up to Q1 2023 at the time of writing.
21High inflation in both the sending and, in most specifications, the receiving country
is associated with more use of cryptoassets in cross-border transactions (Table 7). In line
with our conjecture on the use of cryptoassets as a medium of exchange, we find that high
inflation in the sending or receiving country is associated with an increase in transaction
volumes to the tune of about 50% for USDC and nearly 20% for USDT and ETH.
Our findings for USDC resonate with the attractiveness of stablecoins for international
transactions among countries facing inflationary pressure.25
In line with this, we also
observe increased stablecoin flows following periods of elevated volatility in the bilateral
exchange rate of the sending and receiving country in some of our specifications (columns 3
and 6). This accords with the major emerging market economies representing key nodes
in the USDT network (see Table 2) having experienced bouts of volatility in their home
currencies’ exchange rate during the period of observation.
High economic growth, by comparison, only modestly adds to cross-border crypto
activity. The associated increase is largest for BTC, with an estimated impact of around
10% for high-growth sending and receiving countries, respectively.26
For ETH and sta-
blecoins, our estimates indicate increased transaction volumes of about 6% if the sending
or the receiving country exhibited high GDP growth in the previous quarter.
Notwithstanding indications of crypto usage for transactional purposes, we find that
cross-border activity also hinges on public awareness of cryptoassets, indicative of swings
in investor interest driving transaction volumes. Following quarters of particularly large
search interest in “Ethereum”, volumes increase by up to 30% for ETH as well as for USDC
and USDT, which operate on the Ethereum blockchain (columns 2 to 4 of Table 7). For
BTC, with its longer history of existence and more widespread coverage in media, periods
of higher awareness are associated with an increase in cross-border transactions of close
to 10% (column 1). High search interest in stablecoins, for which data coverage is more
limited, is associated with increased cross-border activity in these coins of around 15%
(columns 5 and 6).
## 4.3 Relation between cross-border crypto flows and remittances
The use case for cryptoassets as a cross-border medium of exchange is particularly evi-
dent for financial transactions burdened by high costs in the traditional financial system.
Remittance fees are a case in point. While international efforts have contributed to re-
ducing fees over the past decade, the cost of sending remittances remains high on average
due to, among other factors, incumbent intermediaries’ market power Beck et al. (2022).
25
High inflation implies an increase in the CPI of at least 6.7% on an annual basis, the threshold
for the top quartile in our sample (see Table 4). Intuitively, raising the threshold to, for instance, the
90th
percentile (equivalent to inflation exceeding 13.4%) yields higher coefficient estimates, indicating a
stronger impact for countries with particularly high inflation. The results are available upon request.
26
High economic growth implies an increase in real GDP of at least 5.1% on an annual basis, which is
the threshold for the top quartile in our sample (see Table 4).
22We test whether high costs of remittances are associated with increased reliance on
cryptoassets for cross-border transactions. In addition to studying the impact on the
total volume of flows, we zoom in on BTC flows related to low-value transactions, i.e.
transfers below the equivalent of US$ 500 and US$ 200, respectively. Despite limitations,
these flows can serve as a proxy of remittances channelled through the BTC network. Our
regressions, presented in the top panel of Table 8, are based on annual flows, consistent
with the available data on remittances. The bottom panel provides the corresponding
estimates for the crypto flows based on quarterly observations. Time-varying information
on the bilateral cost of remittances (as a log percentage share of the transaction value)
allows us to control for confounding factors based on sender-year and receiver-year fixed
effects in addition to pairwise gravity factors as per equation (7). To sharpen our analysis,
we focus on flows from advanced economies to emerging market and developing economies
in all our regressions, in line with the main direction of traditional remittance payments.
Table 8: Crypto as an emerging substitute for remittances?
Remittances BTC ETH USDC USDT BTC<$500 BTC<$200
Annual data (1) (2) (3) (4) (5) (6) (7)
Remittance costt−1 −0.453∗
0.066 0.043 0.084∗∗
0.243∗∗∗
0.253∗∗
0.257∗∗
(0.243) (0.041) (0.031) (0.039) (0.068) (0.123) (0.112)
Distance −0.553∗∗∗
−0.082∗∗∗
−0.012∗
0.006 −0.029 −0.286∗∗∗
−0.280∗∗∗
(0.188) (0.026) (0.007) (0.015) (0.030) (0.069) (0.059)
Common border −0.156 −0.001 −0.008 0.045 −0.041 −0.517∗∗∗
−0.491∗∗
(0.324) (0.062) (0.025) (0.039) (0.044) (0.189) (0.191)
Common language 1.116∗∗∗
0.145∗∗∗
−0.003 0.030∗
−0.034 0.611∗∗∗
0.648∗∗∗
(0.157) (0.033) (0.015) (0.017) (0.027) (0.087) (0.080)
N 1,038 1,043 1,043 751 895 701 701
Pseudo R2 0.928 0.998 0.999 1.000 0.998 0.995 0.995
FE: sender×year, receiver×year Yes Yes Yes Yes Yes Yes Yes
Quarterly data (8) (9) (10) (11) (12) (13)
Remittance costt−1 0.001 0.014 0.055∗∗
0.127∗∗∗
0.228∗∗
0.283∗∗∗
(0.034) (0.024) (0.023) (0.030) (0.107) (0.106)
Distance −0.087∗∗∗
−0.009 0.010 −0.032∗∗
−0.295∗∗∗
−0.296∗∗∗
(0.027) (0.007) (0.015) (0.015) (0.077) (0.062)
Common border −0.030 −0.008 0.036 −0.035 −0.496∗∗∗
−0.470∗∗∗
(0.060) (0.022) (0.039) (0.026) (0.192) (0.181)
Common language 0.139∗∗∗
0.009 0.035∗
−0.005 0.583∗∗∗
0.622∗∗∗
(0.030) (0.012) (0.018) (0.012) (0.088) (0.081)
N 4,451 4,451 3,429 3,965 2,994 2,994
Pseudo R2 0.998 0.999 0.999 0.999 0.995 0.994
FE: sender×quarter, receiver×quarter Yes Yes Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the annual US dollar amount of bilateral remittances in
column (1) and the annual (quarterly) cross-border crypto flows in columns (2) to (7) ((8) to (13)), respectively. Robust
standard errors, clustered by country pairs, in parentheses. Remittance costs are measured based on the log of the (lagged)
mean of the total percentage of the transaction value charged for payments.
We find signs of cross-border crypto transactions emerging as a substitute for remit-
tance payments through traditional intermediaries. Remittance volumes exhibit a highly
negative cost elasticity, close to −45% (column 1). This tallies with a lack of compe-
tition within the traditional financial system, allowing intermediaries to maintain high
23fees in remittance corridors with limited activity.27
Conversely, higher costs of sending
remittances through traditional channels are associated with larger cross-border flows in
stablecoins, notably USDT, and low-value BTC transactions, with elasticities of around
25% (columns 5 to 7 for annual estimates and columns 11 to 13 for quarterly estimates
Table 8). By comparison, BTC flows comprising all transactions as well as flows in ETH,
likely reflecting a variety of user motives, do not exhibit any significant relation to the
cost of sending remittances.
## 4.4 Impact of policy interventions on crypto flows
As cryptoassets become more integrated with the broader financial system, there is a
growing concern about the emergence of financial stability risks. Policymakers have
noted that risks could be particularly relevant in emerging markets, where cryptoassets
could provide avenues to bypass capital flow management measures (CFMs) and other
exchange restrictions (Financial Stability Board, 2022). Hu et al. (2023), for instance,
estimate that capital flight could account for over one-quarter of Chinese BTC exchange
volume, with transactions motivated by circumvention of restrictions on capital outflows.
We explore how CFMs affect cross-border crypto flows by investigating the combined
effects of outflow restrictions in the sending country and of inflow restrictions in the
receiving country. We construct a time-varying country-pair measure of CFM stringency
by combining these restrictions. The measure equals +1 and −1 to indicate a tightening
and loosening, respectively, and zero otherwise. To address endogeneity concerns related
to policy interventions responding to flows, we saturate our specification with the most
comprehensive set of fixed effects, as detailed in equation (8). This accounts for time-
invariant country-pair level effects in addition to fixed effects at the sender-quarter and
receiver-quarter level.
Prior research has pointed to the risk of leakage effects, suggesting that CFMs can
often be circumvented in highly developed markets, whereas they are more effective in
less financially developed countries (e.g. Başkaya et al., 2024). To account for this, we
run our regressions not only on the full sample but also on subsamples that consist only
of flows between emerging market economies (EMEs). Indeed, for cross-border interbank
claims, our estimates suggest that CFMs constrain activity between EMEs, whereas we
find no statistically significant effect in our specification that also includes claims related
to advanced economies (column 2 versus 1 of Table 9).
We find some evidence of circumvention of CFMs through crypto networks (Table 9).
Specifically, a tightening of CFMs is associated with an increase in cross-border transac-
tions in BTC of up to 25% (columns 3 and 4). For USDC, we detect a modest increase at
27
These corridors may also be costly to serve for banks (e.g. due to obstacles to maintaining corre-
spondent banking relationships), which would also explain higher transaction costs.
24Table 9: Effect of capital flow management measures
IB claims IB claims BTC BTC ETH ETH USDC USDC USDT USDT
(1) (2) (3) (4) (5) (6) (7) (8) (9) (10)
CFMst−1 −0.071 −0.102∗∗
0.249∗
0.235∗∗
0.049 0.055 0.048∗∗
0.027 −0.042 −0.031
(0.048) (0.050) (0.138) (0.118) (0.061) (0.059) (0.024) (0.023) (0.029) (0.028)
H0 strict exogeneity:
p-value 0.661 0.261 0.403 0.256 0.634 0.686 0.701 0.075∗
0.145 0.793
N 132,647 31,127 573,331 315,204 564,168 309,746 375,061 208,561 439,883 243,780
Pseudo R2 0.992 0.992 0.996 0.995 0.998 0.997 0.998 0.996 0.999 0.999
Fixed effects:
pair, sender×t, receiver×t Yes Yes Yes Yes Yes Yes Yes Yes Yes Yes
Sample All EMEs All EMEs All EMEs All EMEs All EMEs
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the quarterly US dollar equivalent of bilateral
cross-border interbank (IB) claims (columns 1 and 2) and the quarterly US dollar equivalent of cross-border flows in the
cryptoasset reported in the top row (columns 3 to 10). Robust standard errors, clustered by country pairs, in parentheses.
The bottom row indicates the sample composition, distinguishing between regressions based on all flows and those based
on flows between EMEs, respectively. Capital flow measures (CFMs) are given by a categorical variable with values −1, 0,
and +1, to indicate a loosening, no change, and tightening of CFMs at the country-pair level, respectively. All coefficient
estimates are corrected for potential bias in three-way gravity equations based on the approach in Weidner and Zylkin
(2021). Strict exogeneity of CFMs is tested as in Baier and Bergstrand (2007), based on regressing crypto flows or IB
claims, respectively, on the next period’s capital flow measures (CFMt+1). The null of strict exogeneity can only be rejected
at the 10% level for USDC in specification (8) but not in any other specification.
around 5%. For ETH and USDT the effects are statistically insignificant. This suggests
that these cryptoassets are not responsive to – but also little affected by – CFMs.
To affirm the robustness of our findings, we test for strict exogeneity of CFMs by
using the methodology outlined in Baier and Bergstrand (2007). Our results support the
assumption of exogeneity, as we observe that future changes in CFMs are uncorrelated
with contemporaneous flows. This conclusion holds for all specifications for where a
significant impact of CFMs on flows is identified. These findings align with the notion that
capital controls primarily target cross-border services facilitated by traditional financial
intermediaries.
## 5 Conclusion
This paper maps bilateral flows of major cryptoassets to uncover drivers of cross-border
activity in both unbacked cryptoassets and stablecoins from 2017 to 2024. We document
key nodes and edges of the country-to-country networks, highlighting the central role
of the United States and the pivotal role of major emerging markets. Additionally, we
observe substantial geographical shifts in activity amid significant growth in cross-border
transaction volumes.
We next use a gravity framework to assess whether cross-border transactions in cryp-
toassets can be linked to drivers commonly associated with traditional financial activity.
Our findings reveal that geographical distance curbs cross-border crypto flows far less than
it does traditional financial flows. Indeed, cryptoassets used in decentralised networks
appear to largely defy traditional frictions in capital flows. Conversely, a tightening of
global funding conditions correlates with a decline in cross-border crypto flows, indicative
25of the use of cryptoassets as a risky investment. At the same time, we also find evidence
of stablecoins and low-value BTC payments being used for transactions in the context of
remittances. This is indicative of the multifacetted use cases of different cryptoassets.
Finally, our assessment highlights a continuing need for future research to understand
the dynamics of global crypto flows. Our analysis indicates that policy measures de-
signed to dampen traditional financial flows may have limited impact on constraining
cross-border crypto activity. Yet, as cryptoassets become more integrated with main-
stream finance, understanding the systemic risks and potential contagion effects between
these markets will be essential for policymakers and market participants alike. At the
same time, the socio-economic implications of increased crypto adoption, particularly in
emerging market and developing countries, warrant a deeper examination. This includes
assessing the impact on financial inclusion and economic stability, and the potential for
cryptoassets to serve as a hedge against local currency volatility and weakness.
26References
Aggarwal, R., Demirgüç-Kunt, A., Soledad Martı́nez Perı́a, M., 2011. Do remittances
promote financial development? Journal of Development Economics 96, 255–264.
Anderson, J., van Wincoop, E., 2003. Gravity with gravitas: a solution to the border
puzzle. American Economic Review 93, 170–192.
Anderson, J., Yotov, Y., 2016. Terms of trade and global efficiency effects of free trade
agreements, 1990-2002. Journal of International Economics 99, 279–298.
Athey, S., Parashkevov, I., Sarukkai, V., Xia, J., 2016. Bitcoin pricing, adoption, and
usage: theory and evidence. Stanford University Graduate School of Business Research
Paper, no 16-42.
Auer, R., Claessens, S., 2018. Regulating cryptocurrencies: assessing market reactions.
BIS Quarterly Review.
Auer, R., Cornelli, G., Doerr, S., Frost, J., Gambacorta, L., 2025. Crypto trading and
Bitcoin prices: evidence from a new database of retail adoption. IMF Economic Review,
April.
Auer, R., Farag, M., Lewrick, U., Orazem, L., Zoss, M., 2022. Banking in the shadow
of Bitcoin? The institutional adoption of cryptocurrencies. BIS Working Papers, no
1013.
Başkaya, Y., Shim, I., Turner, P., 2024. Financial development and the effectiveness of
macroprudential an capital flow management measures. BIS Working Papers, no 1158.
Badarinza, C., Ramadorai, T., Shimizu, C., 2022. Gravity, counterparties, and foreign
investment. Journal of Financial Economics 145, 132–152.
Baier, S., Bergstrand, J., 2007. Do free trade agreements actually increase members
international trade? Journal of International Economics 71, 72–95.
Beck, R., Coppola, A., Lewis, A., Maggiori, M., Schmitz, M., Schreger, J., 2024. The
geography of capital allocation in the euro area. NBER Working Paper 32275.
Beck, T., Janfils, M., Kpodar, K., 2022. What explains remittance fees? Panel evidence.
IMF Working Papers 2022/063. International Monetary Fund.
Biais, B., Bisière, C., Bouvard, M., Casamatta, C., Menkveld, A., 2023. Equilibrium
bitcoin pricing. Journal of Finance 78, 967–1014.
Binici, M., Das, M., Pugacheva, E., 2023. The incidence of capital flow management
measures: observations from a new database. IMF Economic Review, June.
27Brei, M., von Peter, G., 2018. The distance effect in banking and trade. Journal of
International Money and Finance, 81, 116–137.
Bruno, V., Shin, H.S., 2015. Capital flows and the risk-taking channel of monetary policy.
Journal of Monetary Economics 71, 119–132.
Böhme, R., Christin, N., Edelman, B., Moore, T., 2015. Bitcoin: economics, technology,
and governance. Journal of Economic Perspectives 29, 213–38.
Cardozo, P., Fernández, A., Jiang, J., Rojas, F., 2024. On cross-border crypto flows:
measurement, drivers, and policy implications. IMF Working Papers, WP/24/261.
Cerutti, E., Chen, J., Hengge, M., 2024. A primer on Bitcoin cross-border flows. IMF
Working Paper, WP/24/85.
Cerutti, E., Claessens, S., Laeven, L., 2017. The use and effectiveness of macroprudential
policies: new evidence. Journal of Financial Stability 28, 203–224.
Cespa, G., Gargano, A., Riddiough, S., Sarno, L., 2021. Foreign exchange volume. The
Review of Financial Studies 35, 2386–2427.
Choi, K., Lehar, A., Stauffer, R., 2022. Bitcoin microstructure and the Kimchi premium.
mimeo.
Conte, M., Cotterlaz, P., Mayer, T., 2022. The CEPII gravity database. CEPII Working
Paper, no 2022-05.
Coppola, A., Maggiori, M., Neiman, B., Schreger, J., 2021. Redrawing the map of global
capital flows: the role of cross-border financing and tax havens. Quarterly Journal of
Economics 136, 1499–1556.
Di Casola, P., Habib, M., Tercero-Lucas, D., 2023. Global and local drivers of Bitcoin
trading vis-à-vis fiat currencies. ECB Working Paper Series, no 2868.
Feyen, E., Kawashima, Y., Mittal, R., 2022. Crypto-asset activity around the world:
evolution and macro-finanial drivers. Policy Research Working Paper, World Bank, no
9962.
Financial Stability Board, 2022. Assessment of risks to financial stability from crypto-
assets. February.
Forbes, K., Fratzscher, M., Straub, R., 2015. Capital-flow management measures: What
are they good for? Journal of International Economics 96, S76–S97.
Forbes, K., Warnock, F., 2012. Capital flow waves: surges, stops, flight, and retrench-
ment. Journal of International Economics 88, 235–251.
28Gelos, G., Gornicka, L., Koepke, R., Sahay, R., Sgherri, S., 2022. Capital flows at risk:
Taming the ebbs and flows. Journal of International Economics 134, 103555.
Halaburda, H., Haeringer, G., Gans, J., Gandal, N., 2022. The microeconomics of cryp-
tocurrencies. Journal of Economic Literature 60, 971–1013.
Head, K., Mayer, T., 2014. Gravity equations: workhorse, toolkit, and cookbook, in:
Gopinath, G., Helpman, E., Rogoff, K. (Eds.), Handbook of International Economics.
Elsevier, pp. 131–195.
Hinzen, F.J., John, K., Saleh, F., 2022. Bitcoin’s limited adoption problem. Journal of
Financial Economics 144, 347–369.
Hoffmann, M., Krause, M., Tillmann, P., 2019. International capital flows, external assets
and output volatility. Journal of International Economics 117, 242–255.
Hu, M., Lee, A., Putniņš, T., 2023. Evading capital controls via cryptocurrencies: evi-
dence from the blockchain. Mimeo.
Koepke, R., 2019. What drives capital flows to emerging markets? A survey of the
empirical literature. Journal of Economic Surveys 33, 516–540.
Liu, Y., Tsyvinksi, A., 2021. Risks and returns in cryptocurrency. Review of Financial
Studies 34, 2689–2727.
Liu, Y., Tsyvinksi, A., Wu, W., 2022. Common risk factors in cryptocurrency. Journal
of Finance 77, 1133–1177.
Liu, Z., Spiegel, M., Zhang, J., 2023. Capital flows and income inequality. Journal of
International Economics 144, 103776.
von Luckner, C., Reinhart, C., Rogoff, K., 2023. Decrypting new age international capital
flows. Journal of Monetary Economics, 138, 104–122.
Lueth, E., Ruiz-Arranz, M., 2008. Determinants of bilateral remittance flows. The B.E.
Journal of Macroeconomics 8.
Makarov, I., Schoar, A., 2020. Trading and arbitrage in cryptocurrency markets. Journal
of Financial Economics 135, 293–319.
Makarov, I., Schoar, A., 2021. Blockchain analysis of the Bitcoin market. NBER Working
Paper, no 29396.
Miranda-Agrippino, S., Rey, H., 2020. U.S. monetary policy and the global financial
cycle. Review of Economic Studies 87, 2754–2776.
29Möser, M., Narayanan, A., 2022. Resurrecting address clustering in Bitcoin, in: Eyal,
I., Garay, J. (Eds.), Financial Cryptography and Data Security, Springer International
Publishing, Cham. pp. 386–403.
Obstfeld, M., Zhou, H., 2023. The global dollar cycle. NBER Working Paper Series, no
31004.
Pagnotta, E., 2022. Decentralized money: Bitcoin prices and blockchain security. Review
of Financial Studies 35, 866–907.
Portes, R.P., Rey, H., Oh, Y., 2001. Information and capital flows: the determinants of
transactions in financial assets. European Economic Review 45, 783–796.
Ratha, D., Shaw, W., 2007. South-south migration and remittances. World Bank Working
Paper, 102.
Santos Silva, J., Tenreyro, S., 2006. The log of gravity. The Review of Economics and
Statistics 88, 641–658.
Schilling, L., Uhlig, H., 2019a. Currency substitution under transaction costs. AEA
Papers and Proceedings 109, 83–87.
Schilling, L., Uhlig, H., 2019b. Some simple bitcoin economics. Journal of Monetary
Economics 106, 16–26.
Weidner, M., Zylkin, T., 2021. Bias and consistency in three-way gravity models. Journal
of International Economics 132, 103513.
Yang, D., 2011. Migrant remittances. Journal of Economic Perspectives 25, 129–52.
30A Appendix
A.1 Figures
Figure A.1: Comparison of cross-border Bitcoin (BTC) flows (US$ billions)
0.25
0.20
0.15
0.10
0.05
0.00
250
200
150
100
50
0
2024 2023 2022 2021 2020 2019 2018 2017
All (right-hand scale)
Less than $500 (left-hand scale)
Less than $200 (left-hand scale)
Iknaio:
All (right-hand scale)
Chainalysis:
Note: The graph presents quarterly cross-border BTC flows in US dollar equivalents from Q1 2017 to Q2 2024. The black
dashed line shows total flows from Chainalysis, while the black solid line shows exchange-to-exchange flows from Iknaio,
derived using the matching and weighting procedure in Annex A.2. The red solid and dashed lines represent flows for
transactions below US$ 500 and US$ 200, respectively.
31Figure A.2: Gauging the accuracy of approximated cross-border flows
6
4
2
0
–2
–4
–6
–8
4 2 0 –2 –4 –6
Users (log of millions)
Cross-border flows (log of US$ billions)
15
10
5
0
50 40 30 20 10
Cryptoasset adoption (% of survey respondents)
Cross-border flows (% of GDP)
(A) Flows vs users (B) Flows vs crypto adoption
Note: Panel A shows the relationship, by country, between the log of average cryptoexchange users (in millions, x-axis)
and the log of total cross-border flows (in US$ billions) of BTC, ETH, USDC, and USDT (y-axis) during Q3 2023 to
Q2 2024. The log number of users explains approximately 64% of the variation in log flows, with a statistically significant
pairwise correlation coefficient of 0.8. Panel B illustrates, by country, the percentage of survey respondents owning or using
cryptoassets in 2023 (or the latest available year, x-axis) against cross-border flows of BTC, ETH, USDC, and USDT (as a
percentage of GDP, y-axis) over the same period. Cryptoasset adoption accounts for roughly 26% of the variation in flows,
with a statistically significant pairwise correlation coefficient of 0.5. Sources: Chainalysis (flow data); SensorTower (user
statistics); Statista (survey data).
32Figure A.3: Global Ether (ETH) Map
Cross-border Ether
flows (USD millions)
less than 100
100−250
250−500
500−750
750−1,000
1,000−2,000
2,000−4,000
more than 4,000
no data
Note: Country colours represent the total US$ equivalent of ETH sent abroad in the first half of 2024, with countries
grouped into eight categories. Black arrows represent bilateral flows equivalent to at least $US 1 billion, light grey arrows
represent flows equivalent at least $US 500 million but less than $US 1 billion.
Figure A.4: Global USD Coin (USDC) Map
Cross-border USD Coin
flows (USD millions)
less than 100
100−250
250−500
500−750
750−1,000
1,000−2,000
2,000−4,000
more than 4,000
no data
Note: Country colours represent the total US$ equivalent of USDC sent abroad in the first half of 2024, with countries
grouped into eight categories. The arrows represent bilateral flows equivalent to at least $US 1 billion.
33A.2 Alternative measures of cross-border Bitcoin flows
This annex describes the construction of the alternative measure of cross-border Bitcoin
(BTC) flows used in the analysis of low-value flows in columns 6 and 7 of Table 8.
This measure is based on data provided by Iknaio, from which we obtain daily data on
BTC flows between up to 303 crypto exchanges. The dataset contains times series for the
US dollar equivalent of all flows, flows with a transaction value of less than US$ 500, and
those of less than US$ 200, respectively. To address concerns about an artificial inflation
of transaction volumes by individual crypto exchanges (so-called “wash trading”), we
exclude daily flows within the same exchange that exceed the 99th
percentile of flows in
the sample.
We employ usage statistics on the crypto exchanges’ smartphone applications from
SensorTower (see Auer et al., 2025, for a discussion) to allocate the BTC flows to countries.
Specifically, we match country-level information on SensorTower’s estimated number of
active exchange users to each crypto exchange-month observation. For the period of
observation (2017–24), our data record up to 170 million active users in a given month,
suggesting broad coverage.
For each exchange, e, we calculate weights for country i in month t as follows:
weightei,t =
Active usersei,t × GDPi,t
P
j∈Ωe
(Active usersej,t × GDPj,t)
, (10)
where Ωe represents the set of all countries j with active users for crypto exchange e.
GDPi,t is country i’s GDP per capita in month t, which we interpolate from annual data
to avoid jumps at year-end. For the months in 2024, we use the year-end value of 2023,
the latest available data point at the time of writing. Weighting by GDP per capita
accounts for differences in wealth and income across users.
As a final step, we employ the weights of the sending and receiving crypto exchanges
to map flows pro rata to the corresponding bilateral flow from country to country. With
user weight weightei,t, for country i at exchange e and weight weightfj,t for country j at
exchange f, flows from exchange e to f in period t, flowef,t, yield an approximated flow
from i to j equal to:
flowij,t = flowef,t × weightei,t × weightfj,t. (11)
We aggregate flows at quarterly and annual frequency to align them with the available
frequency of our controls (see Table A.1) and of the remittances data (see Table 8).
This approach yields cross-border BTC flows for 84 countries, for which we plot total
quarterly US dollar amounts (see the black solid line) alongside those from Chainalysis
(black dashed line) in Figure A.1. On average, the Iknaio data account for about 35% of
the transaction volume reported by Chainalysis, with coverage varying over time.
34To assess the robustness of our main analysis using Chainalysis data, we repeat the
regressions in Table 5 based on using total BTC flows from Iknaio. The results, presented
in Table A.1, affirm the robustness of our main results with two exceptions: First, flows
among crypto exchanges exhibit a tighter link to physical and linguistic proximity than
those based on the broader Chainalysis dataset. Second, we find that a tightening of
the Federal funds rate is associated with an increase in flows among crypto exchanges,
consistent with our findings for stablecoins in Table 6.
Table A.1: Alternative measure of Bitcoin flows: gravity and key global drivers
(1) (2) (3) (4) (5)
Gravity
Distance −0.207∗∗∗
−0.217∗∗∗
−0.218∗∗∗
−0.217∗∗∗
−0.217∗∗∗
(0.024) (0.025) (0.025) (0.025) (0.025)
Common border 0.282∗∗
0.302∗∗
0.302∗∗
0.302∗∗
0.302∗∗
(0.127) (0.131) (0.131) (0.131) (0.131)
Common language 0.418∗∗∗
0.433∗∗∗
0.433∗∗∗
0.433∗∗∗
0.433∗∗∗
(0.059) (0.062) (0.062) (0.062) (0.062)
Global factors (t–1)
VIX 2.003∗∗∗
1.757∗∗∗
1.793∗∗∗
2.001∗∗∗
(0.080) (0.055) (0.072) (0.070)
High-yield spread −2.469∗∗∗
−2.811∗∗∗
−2.387∗∗∗
(0.095) (0.080) (0.063)
Federal funds rate −0.071∗∗∗
−0.073∗∗∗
(0.008) (0.007)
US growth −0.048∗∗∗
−0.005∗∗
(0.002) (0.003)
Crypto risk factors (t–1)
BTC-USD volatility 0.965∗∗∗
0.214∗∗∗
0.567∗∗∗
(0.065) (0.054) (0.055)
Crypto market 6.188∗∗∗
(0.169)
Crypto size −0.885∗∗∗
(0.105)
Crypto momentum −7.347∗∗∗
(0.458)
Dollar index −10.797∗∗∗
(0.332)
N 160,712 163,369 163,369 163,369 163,369
Pseudo R2 0.950 0.848 0.826 0.852 0.860
FE: sender×t & receiver×t Yes
FE: sender & receiver Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the quarterly US dollar amount of bilateral cross-border
Bitcoin (BTC) flows based on measure discussed in Appendix A.2. Robust standard errors, clustered by country pairs, in
parentheses.
35A.3 Aggregate flow measures
This annex uses an alternative empirical approach to assess the robustness of our main
findings. Following the international capital flows literature (see e.g. Koepke, 2019 for
a discussion). we aggregate the flows, fit, received by each country, i, across all sending
countries and scale this measure by the receiving country’s GDP, gdpit. Taking logs, we
regress the following specification:
ln
fit
gdpit
!
= αi + (xit−1 + xt−1)β + εit. (12)
xit−1 represents the country-level factors and xt−1 the global factors and crypto risk factors
employed in our main analysis above, whereas αi accounts for time-invariant country-level
effects and εit is the error term.
Table A.2: Drivers of aggregate crypto flows
BTC BTC ETH ETH USDC USDC USDT USDT
(1) (2) (3) (4) (5) (6) (7) (8)
Global factors (t–1)
VIX 2.707∗∗∗
2.873∗∗∗
3.683∗∗∗
4.071∗∗∗
9.602∗∗∗
7.870∗∗∗
15.378∗∗∗
15.955∗∗∗
(0.141) (0.157) (0.200) (0.207) (0.486) (0.397) (0.290) (0.260)
High-yield spread −4.232∗∗∗
−3.831∗∗∗
−5.725∗∗∗
−5.254∗∗∗
−10.568∗∗∗
−8.037∗∗∗
−11.491∗∗∗
−8.854∗∗∗
(0.154) (0.154) (0.227) (0.218) (0.471) (0.412) (0.337) (0.348)
Federal funds rate −0.029 −0.022 −0.066∗∗
−0.005 0.427∗∗∗
0.358∗∗∗
0.685∗∗∗
0.977∗∗∗
(0.022) (0.026) (0.028) (0.028) (0.043) (0.041) (0.033) (0.032)
US growth −0.013∗
0.050∗∗∗
0.035∗∗∗
0.142∗∗∗
0.107∗∗∗
0.209∗∗∗
0.314∗∗∗
0.628∗∗∗
(0.007) (0.010) (0.007) (0.010) (0.012) (0.018) (0.011) (0.018)
Country-level factors (t–1)
High inflation 0.355∗∗∗
0.312∗∗∗
0.759∗∗∗
0.650∗∗∗
0.991∗∗∗
1.220∗∗∗
0.707∗∗∗
0.391∗
(0.084) (0.084) (0.122) (0.121) (0.144) (0.140) (0.218) (0.235)
High GDP growth 0.060 0.067 0.168∗∗
0.185∗∗
0.107 0.265∗
0.093 0.292
(0.064) (0.061) (0.083) (0.076) (0.149) (0.159) (0.197) (0.193)
Crypto risk factors (t–1)
BTC-USD volatility 1.206∗∗∗
1.831∗∗∗
−6.757∗∗∗
−8.863∗∗∗
(0.100) (0.121) (0.486) (0.692)
Crypto market 12.970∗∗∗
19.376∗∗∗
8.698∗∗∗
28.744∗∗∗
(0.474) (0.527) (1.286) (2.256)
Crypto size −3.623∗∗∗
−4.929∗∗∗
−7.638∗∗∗
−14.938∗∗∗
(0.329) (0.357) (0.728) (0.958)
Crypto momentum −7.660∗∗∗
−4.620∗∗∗
28.107∗∗∗
41.900∗∗∗
(0.721) (0.888) (2.707) (2.786)
N 3,767 3,767 3,760 3,760 2,755 2,755 3,271 3,271
Adjusted R2 0.857 0.873 0.812 0.836 0.766 0.763 0.611 0.624
Fixed effects: country Yes Yes Yes Yes Yes Yes Yes Yes
Note: ∗∗∗p < 0.01,∗∗ p < 0.05,∗ p < 0.1. The dependent variable is the log of the quarterly US dollar equivalent of
country-level cross-border crypto flows as a share of GDP. Robust standard errors, clustered by country, in parentheses.
High inflation and high GDP growth are binary variables that are equal to one (zero otherwise) if the country’s inflation
and GDP growth, respectively, are above the 75th percentile of the sample distribution in a given quarter.
Overall, the findings based on aggregated flows (Table A.2) are qualitatively consistent
with the estimates obtained from the bilateral flows in our main analysis, but quantita-
tive differences underscore the additional insights that can be inferred from using more
granular data.
The estimated effect of global factors on aggregate crypto flows generally tallies with
the estimates based on using bilateral flows. The impact of the VIX and of high-yield
36spreads is qualitatively the same for the aggregate flows. The relative size of the elas-
ticities across cryptoassets is also similar, with USDT flows most sensitive to changes in
these global factors.
Country-level factors confirm the positive association of crypto flows and receiving
countries’ inflation. Likewise, estimates of the impact of high GDP growth point to a
supportive, although statistically often insignificant, effect on flows.
Crypto risk factors, finally, exhibit a qualitatively similar effect on crypto flows when
considered at the country-level and at the more granular bilateral level. Most notably,
our estimates confirm the negative association of flows in unbacked cryptoassets with
past periods of strong crypto momentum based on aggregate data, in difference to the
positive association found for stablecoins.
37Previous volumes in this series
1264
April 2025
Inflation cycles: evidence from international
data
Alberto Americo, Douglas Kiarelly
Godoy de Araujo, Johannes Damp,
Sjur Nilsen, Daniel Rees, Rafael
Schmidt and Christian Schmieder
1263
April 2025
Fragile wholesale deposits, liquidity risk, and
banks’ maturity transformation
Carola Müller, Matias Ossandon
Busch, Miguel Sarmiento and
Freddy Pinzon-Puerto
1262
April 2025
The risk sensitivity of global liquidity flows:
heterogeneity, evolution and drivers
Stefan Avdjiev, Leonardo
Gambacorta, Linda S. Goldberg and
Stefano Schiaffi
1261
April 2025
ETFs as a disciplinary device Yuet Chau, Karamfil Todorov and
Eyub Yegen
1260
April 2025
Supply chain transmission of climate-related
physical risks
Douglas K.G. Araujo, Fernando
Linardi and Luis Vissotto
1259
April 2025
Let’s speak the same language: a formally
defined model to describe and compare
payment system architectures
Kees van Hee, Anneke Kosse, Peter
Wierts and Jacob Wijngaard
1258
April 2025
How accurately do consumers report their
debts in household surveys?
Carlos Madeira
1257
April 2025
Macroprudential and monetary policy
tightening: more than a double whammy?
Markus Behn, Stijn Claessens,
Leonardo Gambacorta and Alessio
Reghezza
1256
April 2025
The disciplining effect of bank supervision:
evidence from SupTech
Hans Degryse, Cédric Huylebroek,
Bernardus Van Doornik
1255
April 2025
Affordable housing, unaffordable credit?
Concentration and high-cost lending for
manufactured homes
Sebastian Doerr and Andreas
Fuster
1254
April 2025
Global or regional safe assets: evidence from
bond substitution patterns
Tsvetelina Nenova
1253
March 2025
Word2Prices: embedding central bank
communications for inflation prediction
Douglas K G Araujo, Nikola Bokan,
Fabio Alberto Comazzi and Michele
Lenza
1252
March 2025
Monetary policy and the secular decline in
long-term interest rates: A global perspective
Boris Hofmann, Zehao Li and Steve
Pak Yeung Wu
All volumes are available on our website www.bis.org.