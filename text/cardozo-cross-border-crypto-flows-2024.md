---
sha256: 1734b4c669d6d4a1329f8804948c9ed7a47d1761a642b25b46c11634f1a5a036
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 134190
---
On Cross-Border Crypto
Flows:
Measurement, Drivers, and
Policy Implications
Pamela Cardozo (IMF), Andrés Fernández (IMF), Jerzy Jiang (SAFE), Felipe Rojas
(IMF)
WP/24/261
IMF Working Papers describe research in
progress by the author(s) and are published to
elicit comments and to encourage debate.
The views expressed in IMF Working Papers are
those of the author(s) and do not necessarily
represent the views of the IMF, its Executive Board,
or IMF management.
2024
DEC* We thank comments by Eugenio Cerutti, Dimitris Drakopoulous, Chris Erceg, Clemens Graf von Luckner, Dong He,
Martina Hengge, Tommaso Mancini Griffoli, Venkateswarlu Josyula, Jose Carlos Moreno, Tjoervi Olafsson, Marco
Reuter, Puja Singh, Tatsuya Sugiura, and participants in seminars held at the International Monetary Fund (IMF) and
the IMF 11th
Statistical Forum. We also thank Chainalysis and Crystal Intelligence for providing data and discussing
their methodologies with us. Cerutti et.al (2024) also generously provided the peer-to-peer data for Brazil. Likewise,
we benefited from conversations with the staff from the Central Bank of Brazil. This work was largely completed while
Jerzy Jiang was affiliated with the IMF. Any errors and omissions are ours. The views expressed in this paper are
those of the authors and do not necessarily represent those of the IMF, its Executive Board, or IMF Management, nor
those of the State Administration of Foreign Exchange (SAFE) in China.
© 2024 International Monetary Fund WP/24/261
IMF Working Paper
Monetary and Capital Markets Department
On Cross-Border Crypto Flows: Measurement, Drivers, and Policy Implications
Prepared by Pamela Cardozo, Andrés Fernández, Jerzy Jiang, Felipe Rojas*
Authorized for distribution by Tjoervi Olafsson
December 2024
IMF Working Papers describe research in progress by the author(s) and are published to elicit
comments and to encourage debate. The views expressed in IMF Working Papers are those of the
author(s) and do not necessarily represent the views of the IMF, its Executive Board, or IMF management.
ABSTRACT: Cross-border crypto flows (CBCFs) are not systematically measured and are poorly
understood. After defining CBCFs and the channels through which they materialize, we review the
various approaches to measure them through two case studies. We also quantify the dynamics and
drivers of CBCFs through a push/pull factor SVAR model. We find an increasingly large volume of
CBCFs, although considerable heterogeneity remains across estimates. Furthermore, CBCFs are more
sensitive to push factors than regular capital flows. Our findings call for accurate and comprehensive
measurement and monitoring of CBCFs and the need to rethink capital account restrictions in a more
digitalized world.
JEL Classification Numbers:
F3 (International Finance); F4 (Macro. Aspects of Intl. Trade and
Finance
Keywords:
Crypto assets; cross-border flows; capital flows; measurement;
push-pull factors; capital account restrictions
Author’s E-Mail Address:
PCardozo@imf.org, AFernandez3@imf.org, FRojas@imf.org,
zjiang71@jh.eduIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 1
WORKING PAPERS
On Cross-Border Crypto Flows:
Measurement, Drivers, and Policy
Implications
Prepared by Pamela Cardozo (IMF), Andrés Fernández (IMF), Jerzy Jiang
(SAFE), Felipe Rojas (IMF)1
## 1 We thank comments by Eugenio Cerutti, Dimitris Drakopoulous, Chris Erceg, Clemens Graf von Luckner, Dong He,
Martina Hengge, Tommaso Mancini Griffoli, Venkateswarlu Josyula, Jose Carlos Moreno, Tjoervi Olafsson, Marco
Reuter, Puja Singh, Tatsuya Sugiura, and participants in seminars held at the International Monetary Fund (IMF) and
the IMF 11th
Statistical Forum. We also thank Chainalysis and Crystal Intelligence for providing data and discussing
their methodologies with us. Cerutti et.al (2024) also generously provided the peer-to-peer data for Brazil. Likewise,
we benefited from conversations with the staff from the Central Bank of Brazil. This work was largely completed while
Jerzy Jiang was affiliated with the IMF. Any errors and omissions are ours. The views expressed in this paper are
those of the authors and do not necessarily represent those of the IMF, its Executive Board, or IMF Management, nor
those of the State Administration of Foreign Exchange (SAFE) in China.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 2
Contents
Glossary.......................................................................................................................................................2
1. Introduction .............................................................................................................................................3
2. Measurements of Cross Border Crypto Flows: A Literature Review ................................................6
3. Cross-Border Crypto Flows: Definition & Measurement ....................................................................9
4. Case Study 1: Brazil .............................................................................................................................13
5. Case Study 2: Global Cross-Border Crypto Flows............................................................................23
6. Dynamics and Drivers of Cross-Border Crypto Flows......................................................................26
7. Policy Implications................................................................................................................................32
8. Concluding Remarks............................................................................................................................34
References.................................................................................................................................................50
FIGURES
1. Crypto Asset Market Capitalization...........................................................................................................3
2. Cross-Border Crypto Flows in Practice: A Conceptual Diagram ............................................................11
3. Brazil CBCFs—Official Data (Method 3).................................................................................................15
4. Brazil CBCFs Compared to Traditional Capital Flows............................................................................16
5. Brazil CBCFs—Official Data and Method 2............................................................................................18
6. Brazil CBCFs for Chainalysis and Crystal...............................................................................................19
7. Brazil Cumulative CBCFs—Official Data and Method 2.........................................................................20
8. Brazil CBCFs—Official Data and Method 1............................................................................................21
9. Global CBCFs .........................................................................................................................................24
10. Global CBCFs as Share of Total Capital Flows: April 2022—March 2023...........................................25
11. CBCFs and Capital Flows Volatility ......................................................................................................27
12. Remittances and CBCFs.......................................................................................................................29IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 1
TABLES
1. Correlation Coefficients for Domestic and Global Variables...................................................................28
2. Variance Share Analysis on Outflows.....................................................................................................31
3. Variance Share Analysis on Net Outflows ..............................................................................................32IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 2
Glossary
AEMS Advanced Economies Monetary Stance
AML/CTF Anti-Money Laundering and Combating the Financing of Terrorism
BIS Bank for International Settlements
CBB Central Bank of Brazil
CBCF Cross-border Crypto Flows
CNY Chinese Yuan Renminbi
DGI Data Gaps Initiative
EME Emerging-Market Economy
FDI Foreign Direct Investment
FRED Federal Reserve Bank of St. Louis
FX Foreign Exchange
IEA Economic Activity Index
MFSMCG Monetary and Financial Statistics Manual and Compilation Guide
MPR Monetary Policy Rate
NER Nominal Exchange Rate
PF Portfolio
RMB Renminbi
SD Standard Deviation
SVAR Structural Vector Autoregressive
USD United States Dollar
VIX Volatility Index
WIP World Industrial ProductionIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 3
1. Introduction
The rise and subsequent variability in the capitalization of crypto markets in recent years has been
remarkable (Figure 1). One dimension that remains to be well understood from these developments in
crypto markets is the cross-border aspect of these transactions. Our work aims to contribute to a better
understanding of this dimension by shedding light on three aspects of cross-border crypto flows (CBCFs):
their measurement, their drivers, and the related policy implications that they entail.
Our work can be further motivated by the following four observations on CBCFs. First, it is well-known
that financial cross-border flows can bring benefits but may also pose risks (IMF, 2012, 2022a). Crypto
assets have the potential to alter considerably the balance between the benefits and costs of cross-
border flows, mainly via their impact on cross-border flows’ volumes and volatility. On one hand, their
volume may increase as digital assets become more easily accessible and decrease the costs of
transactions across countries, potentially reshaping the global allocation of capital worldwide.1 On the
other hand, crypto assets may also increase the volatility of cross-border flows if CBCFs respond more to
external conditions, thereby amplifying the destabilizing macro and financial impacts of these movements.
Second, the policy challenges entailed by the increased volumes and volatility of cross-border flows are
further compounded by CBCFs potentially serving as vehicles to circumvent capital flow management
measures (CFMs) that aim at helping economies reap the benefits of cross-border flows while minimizing
their risks (Hu et.al, 2022, Graf von Luckner et.al, 2023; Chen and Sarkar, 2022).
Figure 1: Crypto Asset Market Capitalization
Note: Figure depicts monthly averages of weekly worldwide crypto assets market capitalization. It is calculated as the price of the
crypto assets times the number of coins in the market in any given week. It tracks 14,690 crypto assets, across 1,186 exchanges.
Source: CoinGecko.
## 1 Conceptually, blockchain technologies have the potential to reduce transaction costs by their impact in two costs: verification and
networking (Catalini and Gans, 2016). A particular dimension where digitalization may have large impact in reducing transaction
costs across countries is remittances (Nicoli and Ahmed, 2019).IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 4
Third, no official data on CBCFs exist for cross country analysis as they are not measured by statistical
agencies around the world—Brazil being a notable exception that we will study in detail. This fact is
related to the intrinsic pseudonymity of crypto markets which makes data collection challenging,
particularly on the residency of transacting parties. The lack of a regulatory framework with stricter and
systematic reporting and collecting effort requirements by crypto exchanges is further compounded by the
fact that many of them operate across borders, making measurement and supervision by national
authorities more difficult.
The lack of official statistics has motivated practitioners, academics and data providers to formulate a
variety of methods to identify and measure CBCFs, our fourth observation. These range from indirect
inferences (Alnasaa et al., 2022; Bao et al., 2022; Cheng and Dai, 2020; Ju et al., 2016) to using direct
inference methods from off- and on-chain data (Graf von Luckner et al., 2023; Cerutti et al., 2024;
Chainalysis 2022; Crystal Intelligence 2021; Hu et al., 2022).2 These various methodological approaches
have not been contrasted and may substantially differ due to the alternative assumptions that they rely
upon and may lack representativeness relative to the overall level of CBCFs. Hence, their usefulness for
policy analysis may thus be limited.
Motivated by these observations, our work addresses four angles related to CBCFs. The first one relates
to providing a working definition of what CBCFs are and how they occur in practice. The second
addresses the measurement of CBCFs by documenting the various methodologies that exist for
estimating these flows, the differences in the assumptions that they rely upon, how much they can
account for the aggregate flows that materialize via CBCFs, and how large they are relative to traditional
financial flows. A third angle that we explore is the dynamics and drivers of CBCFs by contrasting the
volatility and cyclicality of CBCFs against other financial flows (including remittances) and, through a more
structural analysis, quantifying the role of push vs. pull factors in accounting for the dynamics of CBCFs.
Lastly, we address the normative angle of CBCFs by relating our findings to the set of policy
recommendations that can be drawn from our findings.3
The methodological approach that we follow to address these four angles begins by providing a working
definition of what a CBCF is and how it occurs in practice. It argues that a CBCF can be thought of as a
change in ownership of a crypto asset between a resident and a non-resident in exchange for a flow of
resources. In practice, such transactions can occur off the blockchain, or on the blockchain.4
Next, we address the measurement analysis through two case studies that allow us to describe and
compare the various alternative proxies for CBCFs that are available. The first case study is that of Brazil,
which offers a unique opportunity to contrast the entire set of methodologies available to quantify CBCFs.
We focus on three proxies that estimated CBCF transactions in Brazil at the monthly frequency: i) from
peer-to-peer exchanges; ii) from centralized exchanges; and iii) official estimates by the Central Bank of
## 2 The next section provides further details of on-chain and off-chain transactions.
## 3 There is a literature on systemic risk related to crypto assets and the optimal macroprudential responses that is out of the scope of
our work. See Hacibedel and Perez-Saiz (2023) for an analysis.
## 4 Transactions in decentralized peer-to-peer exchanges may occur off chain or on chain, for example the trade of assets in smart-
contract based decentralized exchanges. Likewise, trade in centralized exchanges can take place occur on chain, or off chain, e.g.
when one user exchanges assets with another user on the same exchange. Transactions between exchanges occur on chain.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 5
Brazil (CBB) using the universe of contracts in the FX market. We compare estimates across the three
methodologies and contrast them with monthly official balance of payments (BoP) flows. A second case
study aims at quantifying global CBCFs across the world, by adding the flows across the various (on-
chain) exchanges at the transaction level, excluding those that are estimated to occur within countries.
Finally, to document the drivers of CBCFs we come back to the official data in Brazil and begin the
analysis through simple correlations and other second moments of CBCFs with other domestic and
external variables. We then build a structural vector autoregressive (SVAR) model that allows us to pin
down the share of CBCFs´ volatility that can be accounted for by external variables. We contrast this with
the same exercise performed on regular financial flows.
Our main findings can be classified in three areas that relate to the size of CBCFs, their volatility and
drivers, and the assumptions underlying their estimation. Regarding size, we document an increasingly
large volume of CBCFs. In the case study of Brazil, there is a steady increase in CBC outflows since late
2017 as residents have bought crypto assets much more than what they have sold them, reaching a flow
that is 25 percent of gross portfolio outflows at the end of our data in October 2023, or about 70 percent
of the cumulative net portfolio flows since 2020.5 A similar upward trend in volumes is observed in our
estimates of global CBCFs, reaching levels of up to 22 percent of total capital flows worldwide, if one
looks at the main 7 crypto assets traded in 2022-23. This number can increase up to 35 percent if one
adds more crypto assets and exchanges, as alternative sources allow us to do.
Our analysis of the volatility and drivers of CBCFs from and to the Brazilian economy suggests that such
flows are as volatile as regular portfolio and foreign direct investment (FDI) flows, when measured as
deviations from trend. Furthermore, they do not display any statistically significant correlation with regular
(net) capital flows, nor with remittances, although they do strongly comove with a vector of external
variables that includes the price of Bitcoin, the S&P 500, world industrial production, the VIX index, and a
measure of the monetary policy stance in advanced economies. In fact, the SVAR model associates
about a third of CBCFs’ variance to this vector of external (push) factors, after correcting for any small
sample bias. This is 3 to 6 times the share explained by this same vector when it comes to regular
financial flows’ variability such as portfolio and FDI. Thus, our findings indicate that CBCFs are
considerably more sensitive to external factors than traditional financial flows.
Regarding measurement, our results indicate a substantial heterogeneity in CBCF estimates across the
various methodologies. A particular problem is that bilateral CBCFs can be very poorly estimated as the
pseudonymity and opacity in crypto markets makes it difficult to trace the residency of market participants,
rendering the methodologies too imprecise to accurately pin down the receiver and sender countries.
Official estimates may be more reliable, provided that they follow standard balance of payment
procedures, yet they are quite scarce, being the Brazilian case a notable exception.6 Global measures of
CBCFs that sum across all countries—thus not taking a stance of the particular sender/receiver country—
may be less imprecise.
## 5 As mentioned in Section 4.1. in this document CBC outflows refer to outflows of FX from purchases of crypto assets.
6 Another country that provides official BoP data on CBCFs is El Salvador, but its coverage is quarterly and only from 2021-Q3.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 6
The policy implications from these findings fall within two related areas. First and foremost, there is an
evident and urgent need for better, more accurate and comparable measurement and monitoring of the
increasing volume of CBCFs by country authorities, as it is done with regular capital flows, regardless of
where the regulatory perimeter to these markets is ultimately set. While industry and academic estimates
of CBCFs can provide a broad indication of trend activities for policy analysis, they can be limited in
providing more precise measurements of crypto flows and can vary considerably among them. Crypto
exchanges and platforms should gather residency information and report bilateral flows across countries
to authorities so that proper accounting of CBCFs can be done. Second, the increase in the size of
CBCFs, coupled with the possibility of further volatility linked to their heightened sensitivity to external
factors and their use as way to circumvent traditional CFMs illustrate the need to think about the optimal
redesign of these policy instruments in a more digitalized world where CBCFs are poorly measured. The
paper describes four cases on the use of crypto assets to circumvent outflows CFMs and touches briefly
on how to tackle this circumvention.
The rest of this work is divided as follows. Section 2 presents a literature review. Section 3 introduces the
working definition of CBCFs and their measurement in practice. Sections 4 and 5 present the two case
studies of Brazil and of global CBCFs, respectively. Section 6 conducts the analysis of the dynamics and
drivers of CBCFs. Section 7 discusses the policy implications of our findings. And Section 8 presents
some concluding remarks. Further technical material is gathered in an Appendix at the end.
2. Measurements of Cross Border Crypto Flows:
A Literature Review
The challenges in identifying crypto asset owners in transactions and the absence of standardized
statistics for capturing cross-border crypto flows (CBCFs) has led practitioners and academics to come up
with alternative ad hoc methods to measure these flows that include direct and indirect measurements. In
addition to this, some international organizations are summing efforts to standardize practices on CBCF
statistics. This section reviews the related literature.
2.1. Direct measurements
Direct measurements of CBCFs have involved parsing raw transaction data among different exchanges
or users from anonymous wallet addresses (Fujiwara and Islam, 2021). Such initiatives necessitate
substantial data or sophisticated algorithms to discern between addresses, predominantly relying on
platform-provided data. Crypto platforms are commonly categorized as on-chain or off-chain (BIS, 2023)
and, in turn, they can operate through centralized or decentralized protocols.
On-chain crypto transactions are treated via the blockchain network, they need to be confirmed by
validators and are usually traded in decentralized platforms. Off-chain crypto transactions take place
outside the traditional blockchain, typically traded via peer-to-peer (P2P) platforms or centralized
exchanges that provide matchmaking trading. Transactions on centralized exchanges often dominate in
terms of volume compared to the on-chain transactions (Igor and Scholar, 2022). Lack of official data on
CBCF has led researchers to rely on P2P platforms that have made their data available. Graf VonIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 7
Luckner et al. (2023) employs high-frequency transaction data from two decentralized P2P Bitcoin
platforms (LocalBticoins and Paxful). This methodology involves matching Bitcoin transactions within a 5-
hour timeframe to identify capital movement across borders. The work underscores the growing
importance of Bitcoin as a conduit for remittances and to circumvent capital controls, especially in some
emerging markets.7 The direct measurement through off-chain crypto transactions has garnered attention
in subsequent works. Cerutti et al. (2024) study cross-border Bitcoin off-chain flows from LocalBitcoins.
Their findings suggest the off-chain cross-border flows seem to be correlated with incentives to avoid
capital flow restrictions.
Another work that offers an estimate of CBCFs is Hu et al. (2022). The authors offer an innovative
method that exploits blockchain data to pinpoint cross-border flows evading China's capital controls
through cryptocurrencies. They match wallets to exchanges through Wallet Explorer, which collects
exchange wallet data from public sites and internal sources when trading with the exchanges. Their work
indicates that capital flight´s volume constituted over one-quarter of the total Chinese Bitcoin exchanged,
and that capital flight from China via Bitcoin is positively related with Chinese economic policy uncertainty
and the Bitcoin premium in Chinese RMB.
Given the challenges individuals face in obtaining comprehensive and detailed cryptocurrency transaction
data, third-party companies such as Crystal Intelligence, and Chainalysis have stepped in to collect on-
chain crypto transactions between exchanges, enabling them to capture and assess on-chain crypto
flows across different countries. For example, Crystal Intelligence (2021) released an analytical report on
the geography of Bitcoin transactions which provides a detailed analysis of these flows across 694
international exchanges from 82 countries, showcasing interactive visualized fund flows among different
countries from 2013 to 2021.8 Consequently, third-party on-chain crypto flow data have become
instrumental for researchers seeking to comprehend the global dynamics of cryptocurrency flows. For
instance, Cerutti et al. (2024) construct a dataset of on-chain transactions across exchanges,
complemented by on-chain cross-country flows estimated by Chainalysis.
Another notable effort in measuring CBCFs directly is the Atlas database, spearheaded by the Bank for
International Settlements (BIS) in collaboration with the central banks of the Netherlands and Germany.
Launched in 2023, this project combines diverse sources of data from various crypto exchanges (off-
chain data) with data from the public blockchain (on-chain data) to measure cross-border flows (BIS,
2023).
Our work contributes to this strand of literature by comparing these direct measurements of CBCFs as
well as their underlying assumptions.
## 7 Building on this work, Graf von Luckner et al. (2024) argue that crypto exchanges act as efficient marketplaces for capital flight,
whereby underlying capital movements still occur via traditional channels and serve as liquidity providers for the crypto exchange.
They suggest crypto shadow premia, defined as the relative price of crypto currencies, is an important indicator of the demand for
(and the marginal cost of) capital flight.
8 Other third-party companies like CryptoCompare and the BLOCK offer data related to crypto transactions.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 8
2.2. Indirect measurements
As mentioned, measuring CBCFs directly and accurately is a challenge due to the large data limitations.
Consequently, some researchers have opted for indirect approaches to measure CBCFs. This approach
has often involved the use of various indicators and/or the application of arbitrage theory in diverse
markets to infer the scale of crypto transactions employed for cross-border capital transfers.
Alnasaa et al. (2022) document the correlation between crypto-asset usage with survey-based data and
indicators of corruption, capital controls and other factors. Utilizing a general-to-specific approach, they
empirically link an increased crypto usage with higher perceived corruption and more stringent capital
controls. Chen and Sarker (2022) offer evidence based on arbitrage transactions that is consistent with
Chinese residents buying Bitcoin in China and selling it for USD in foreign exchanges, thereby using
Bitcoin to evade capital controls, notably during the stringent restrictions in China from 2014 to 2016.
Cheng and Dai (2020) find evidence of carry trade activities through Bitcoin transactions between CNY
and USD platforms, as well as a relationship between crackdowns of Bitcoin transactions by Chinese
authorities and a significantly weaker response of Bitcoin carry trade returns. Ju et al. (2016) propose a
Bitcoin-implied exchange rate discount indicator, using BTC China and Bitstamp data to detect capital
flight from China via Bitcoin. They provide evidence consistent with capital flight from Chinese CNY to
USD via Bitcoin before China officially banned Bitcoin trade in 2013, which was successfully halted after
the ban.
2.3. The Route to Official Statistics
There are evident limitations in measuring CBCFs through both indirect and direct methods. To tackle
these technical challenges, some international organizations and central banks have undertaken
initiatives to enhance the quality of relevant statistics and improve data availability. Among central banks,
the Central Bank of Brazil stands out for its effort to measure Brazil’s CBCFs, relying on the FX contracts
that FX intermediaries must submit when transferring/receiving funds from abroad for crypto transactions.
This will be analyzed in detail in the subsequent sections.
Among international organizations, two notable efforts in this regard are the IMF’s proposed treatment of
crypto assets in the BPM7 statistics and, in parallel, the Data Gaps Initiative (DGI). The IMF is working on
detailing definitions and changes that would allow the treatment of crypto assets in statistics in the
proposed BPM7 chapters.9 The DGI was launched in 2009 by the G20 Finance Ministers and Central
Bank Governors and has evolved into its third phase (DGI-3), aiming to establish a data collection
framework and gather information on digital money. This effort assists policymakers in monitoring
developments related to Central Bank Digital Currencies (CBDCs), stablecoins, and other types of crypto
assets used for payment. Currently DGI-3 is preparing its Recommendation 11 on how to measure
“currency substitution” and “cross-border usage” in the context of digital money. It clearly emphasizes that
data collection should focus on both positions and transactions, including cross-border transactions, with
two key breakdowns (counterpart economy and institutional sector); identification of relevant data
9 BPM7: List of Proposed BPM7 Chapters (imf.org)IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 9
providers (e.g., e-wallets, service providers, exchanges) and their data provision capabilities considering
privacy and other limitations of crypto-assets. Both initiatives may pave the road to having official cross-
country statistics on CBCFs in the future.
Despite commendable efforts by academics and public institutions to standardize data and address
related issues, ongoing research in this field encounters limitations due to the constrained availability of
reliable CBCF data. The overall scope of research in these domains remains somewhat restricted,
emphasizing the need for continuous efforts to overcome data challenges and broaden the understanding
of CBCFs. Our work contributes to these efforts by, first, documenting the existing measurements of
CBCFs through two case studies and comparing them to traditional financial flows, thereby shedding light
on both the advantages and limitations of the ad hoc methods available in measuring CBCFs. Our work
also explores the dynamics and drivers of CBCFs by contrasting the volatility and cyclicality of CBCFs
against other financial flows and, through a more structural analysis, quantifying the role of push vs. pull
factors in accounting for the dynamics of CBCFs. Lastly, we contribute to the literature by addressing the
normative angle of CBCFs by relating our findings to the set of policy recommendations that can be
drawn from our findings.
3. Cross-Border Crypto Flows: Definition &
Measurement
3.1. Defining Cross-Border Crypto Flows
Crypto assets were not included in the latest revision of the official macroeconomic statistical manuals
(BPM6). Consequently, no international guidelines are available, except for a reference in the Monetary
and Financial Statistics Manual and Compilation Guide (MFSMCG), clarifying that Bitcoin-like crypto
assets are nonfinancial assets (IMF, 2019), and that therefore crypto assets flows should be included in
the current account.10
Following the definition of cross-border flows in the BoP, we define CBCFs as a change in ownership of a
crypto asset between a resident and a nonresident. Residents can purchase crypto assets from
nonresidents for various reasons, including investment, anticipating higher prices in crypto assets;
avoiding regulation (capital controls, anti-money laundering regulation, taxes);11 or for transactional
purposes, to be able to buy other products with crypto assets. In all cases, the transaction constitutes a
CBCF. The changes in ownership are likely to imply a flow of FX, thereby impacting the exchange rate.
## 10 For further details, see “Treatment of Crypto Assets in Macroeconomic Statistics (Treatment of Crypto Assets in Macroeconomic
Statistics (imf.org))”. It should be noted, however, that from June 2024 the IMF, jointly with other international organizations and
after a global consultation with compilers of external sector statistics, changed the methodological treatment for the balance of
payment statistics regarding crypto assets in the context of the BPM7 implementation. It was decided that crypto assets without an
issuer would be considered as nonfinancial assets and, within this group, as non-produced nonfinancial assets. Therefore, these
transactions will no longer be included in the current account but in the capital account.
11 Method 1, explained below, measures this type of CBCF.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 10
However, this might not be the case if the transaction is conducted abroad12 or if the crypto flow
constitutes a remittance, a gift/donation, or if it is swapped with another crypto. Like BoP data, the
accurate measurement of CBCF requires information of the residency of the two parties involved in the
transaction. In practice, this has been an important challenge when measuring CBCFs, as we explain
below.
3.2. Measuring Cross-Border Crypto Flows
How can residents purchase crypto assets from nonresidents? A resident might use the local financial
system to transfer money abroad to the nonresident to obtain the crypto assets (Figure 2), either by
approaching the financial system directly or through an exchange in their country. The recipient of the
transfer abroad could be either an exchange or the nonresident. In the latter case, the transaction will
involve a peer-to-peer (P2P) platform.
If residents aim to exchange their local currency for FX avoiding the financial system to circumvent capital
controls or AML/CTF controls they will conduct the transaction directly through a P2P platform by, first,
buying cryptos from a resident (paying for the purchase in local currency; in cash in case of avoiding
AML/CTF controls) and then selling the cryptos to a nonresident (through the P2P), receiving the FX
abroad.13 This mechanism—the use of cryptos as vehicles to circumvent capital controls or AML/CTF
controls to obtain FX—is referred to in this paper as Method 1.14 Graph von Luckner et al. (2023)
measured these CBCF (Method 1) using Bitcoin data from two P2P platforms (LocalBitcoins and Paxful)
within a 5-hour window between the purchase and the sale.15 Cerutti et al. (2024) replicated Graph von
Luckner et al. (2023)’s methodology on LocalBitcoins.
## 12 As in Method 1.
## 13 Section 7 explains how the resident who is selling the crypto assets could have obtained them.
## 14 To be precise, Method 1 in the figure also captures residents buying cryptos from non-residents as an investment and avoiding
capital controls, but in this document, we referred to Method 1 as the CBCF measured by Graph von Luckner et al. 2023.
15 A crucial element in their identification method is that the amount purchased and sold must identical.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 11
Figure 2: Cross-Border Crypto Flows in Practice: A Conceptual Diagram
Note: The diagram depicts how CBCFs occur in practice and the three alternative methods available for measuring them.
Method 1 may significantly underestimate the true extent of CBCFs, focusing solely on cases
circumventing capital controls to obtain FX and disregarding those going through the local financial
system. Additionally, so far Method 1 has only concentrated on a subset of P2P platforms for which data
on Bitcoin transactions exist, and even there it excludes transactions where Bitcoin serves as an
investment rather than a means to obtain FX (the resident would not sell the Bitcoins right after the
purchase). Moreover, Method 1 overlooks transactions with a delay of more than 5 hours.
Specialized firms in the crypto industry, namely Crystal Intelligence (Crystal) and Chainalysis, estimate
CBCF through flows between exchanges—which we label Method 2.16 To obtain these flows they get
blockchain transactions (on-chain) and attribute them to crypto exchanges as described by Hu et al.
(2022). The difference between Crystal’s and Chainalysis’ methodology lies in the way each assigns the
exchanges to countries to determine between which countries the CBCFs occur. Crystal assigns
exchanges according to the country where the exchange is registered. Exchanges that are registered in
more than one country (for example Binance) are not assigned to any country. Chainalysis distributes the
flows between exchanges according to the countries from which the exchange’s web traffic comes from.
## 16 There are at least two reasons why flows can occur between two exchanges. The first occurs when someone owning crypto
assets wants to transfer money to another country. To do so, the person moves the crypto assets to an exchange in the other
country to sell them, receiving the other country’s local currency. The person would use this route, instead of directly acquiring the
other country’s local currency, if crypto transaction costs are lower than the other channels. The second case is driven by different
liquidity conditions in exchanges. If a person owning crypto assets wants to sell them and liquidity in the exchange where the
cryptos are held is low, then she could transfer the cryptos and sell them in an exchange with higher liquidity. Liquidity conditions
can also drive exchanges to purchase crypto assets from other exchanges to meet the demand from their customers.
Resident in
countryA
Resident in
country B
Financial
System A
p2p
Financial
System B
Exchange 2
(out of
countryA,
in country
C)
Exchange 3
(out of
country B,
in country
D)
Exchange 1
(in country
A)
Exchange 4
(in country
B)
Method 1
(Graph von Luckner et.al, 2023; Cerutti et.al, 2023)
Method 3
(Central Bank of Brazil)
Method 2
(Chainalysis; Crystal Blockchain)IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 12
Method 2’s two main potential drawbacks lie in the accuracy of mapping exchanges to countries, and the
omission of CBCF between residents and nonresidents within a single exchange. Crystal’s methodology
also neglects CBCFs from exchanges registered in multiple countries as well as exchanges not registered
in any country. Chainalysis’ use of web traffic assumes all website entries as transactions and treats all
entries equally, regardless of individual wealth, potentially biasing the estimated flows.17
Method 3, the last method we have identified for measuring CBCF, has been pioneered by the CBB. It
utilizes information from the universe of FX contracts in Brazil, which must be filled for FX transfers in and
out of the country. The FX contracts include the identification of the parties (resident and nonresident), a
code identifying the purpose of the FX transaction, and a free text field for other information that the
resident party or settling bank may wish to provide. In 2017, the CBB instructed FX operators to classify
FX contracts related to crypto assets under the category “acquisition of goods delivered abroad”. To
distinguish crypto assets from other goods delivered without crossing borders, the CBB relies on the free
text field (Central Bank of Brazil (2023)).18
Method 3 is a methodology that follows closely best practices in measuring balance of payments’ flows,
although it cannot capture flows bypassing the local financial system. In countries without capital controls
on outward transfers this may not be an issue due to the absence of incentives to bypass the financial
system. For ease of purpose, FX contracts in Brazil do not cover credit or debit card FX transactions, so
Brazil’s CBCFs measured by the CBB are missing this information, but the CBB estimates they represent
a relatively small share of the total volume of CBCFs.19 The measurement of crypto flows by the CBB also
suffers the same issues as some other capital flows registered in the BoP: FX payments executed from
accounts abroad are not captured, as the CBB does not receive this data. Additionally, the classification
of the type of transaction relies on self-reporting by residents. However, this latter concern may be less
significant for cryptocurrency transactions in Brazil, as, according to CBB staff, the majority of these are
carried out through exchanges regulated within the country, which are likely to provide more reliable
information.
It is also worth mentioning that forex transactions carried out for the acquisition of virtual assets abroad,
as well as other foreign exchange market operations, are subject to monitoring by the CBB using a Risk-
Based Approach tool, with parameters previously defined in a risk matrix. Under the scope of the
monitoring procedures, the buyer of virtual assets must settle a forex transaction with an institution
## 17 According to Chainalysis staff, their methodology is designed to be an indicator of trends and not to be specific measures of, for
example, individual country to country flows.
## 18 Concretely, the CBB includes in a list the resident and nonresident parties of identified crypto FX contracts. Additionally, the CBB
collects participants in the crypto assets market from the press and from other studies. When a FX contract in category “acquisition
of goods delivered abroad” has the free text field blank, these lists are used to decide whether the transaction is classified as crypto
assets trade.
## 19 In the case of Brazil, given the difference in the tax on financial transactions (IOF for its name in Portuguese) for FX transfers to
accounts abroad (0.38 percent; 1.1 percent if to the same accountholder´s name) and for purchases abroad through credit and debit
cards (decreased to 5.38 percent from 6.38 percent on January 2, 2023), purchases of crypto assets abroad through credit and
debit cards should be low.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 13
authorized by the CBB to enable the transfer of foreign currency to the seller of the virtual asset abroad.
In this sense, the buyer of virtual assets informs to the authorized institution that the purpose of the forex
transaction is the acquisition of virtual assets. The authorized institution transfers the foreign currency to
the seller of the virtual asset abroad. Authorized institutions must send to the CBB information about each
forex transaction (including its purpose and names of parties involved, among other information) and
have in place controls to prevent illegal activities and ensure compliance with Brazilian forex market
regulations.
4. Case Study 1: Brazil
Brazil offers a unique opportunity for an in-depth case study on CBCF for at least two reasons. Firstly, it is
the only country where the three methods estimating CBCFs outlined in the previous section could be
compared at a monthly frequency and over a relatively extended period. Secondly, Brazil publishes
monthly official BoP statistics against which the measurement of CBCF from the three methodologies can
be contrasted with, enabling a comparison between regular capital flows (portfolio and FDI) and CBCFs
at this higher frequency. In this section, we document CBCFs for Brazil measured by the CBB (Method 3)
and compare them with traditional capital flows (portfolio and FDI), and estimates coming from the
methodologies used in the industry (Method 2) and the literature (Method 1).
4.1. Official Data (Method 3)
The CBB publishes monthly CBCF data starting from January 2016.20 In accordance with the IMF’s
recommendation, the CBB classifies purchases of crypto assets from nonresidents as imports of crypto
assets and sales as exports.21 22 Here, we refer to imports of crypto assets as “crypto outflows”, as they
imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs.
Brazil’s crypto outflows have an upward trend since the end of 2017, reaching monthly flows of about
$1300 million by the end of 2023, while crypto inflows remain much lower, peaking at $200 million in the
end of the sample (Figure 3, Panel a). Consequently, net crypto outflows closely mirror crypto outflows
(Figure 3, Panel b).23 To gauge the magnitude of Brazil’s crypto outflows, we compare them to traditional
## 20 The data can be accessed at this link: Reconciliation between merchandise source data and total goods on a balance of
payments basis.
## 21 According to the IMF, backed crypto assets, such as stablecoins, should be reported in the financial account. The CBB so far is
not separating backed and un-backed crypto assets as it is working on the means to do so. Thus, the data provided by the CBB and
analyzed in our work include both unbacked crypto assets and stablecoins. The Appendix (Figure A.2) presents a decomposition
between backed and unbacked cryptos for the case of Brazil from Chainalysis and Crystal. While the former points to roughly an
equal share across the two, the latter assigns a very small share to backed crypto assets. This can be due to the fact that Crystal
has a considerably fewer number of unbacked cryptos, as it is also documented in the Appendix (Table A.1).
## 22 As mentioned above, from June 2024 the IMF changed the methodological treatment for the balance of payment statistics
regarding crypto assets in the context of the BPM7 implementation, deciding that crypto assets without an issuer would be
considered as nonfinancial assets.
## 23 The considerably smaller volume of crypto inflows relative to outflows is unlikely due to residents under-reporting of crypto sales
from e.g. them not selling their FX proceeds for local currency. This comes from the fact that if a resident in Brazil sells cryptos in an
exchange in Brazil, as established by Brazilian forex regulation, such transaction must be settled in Brazilian Reais (BRL), i.e. theIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 14
capital outflows (portfolio [PF] and FDI) .24 The upward trend persists, with crypto outflows over portfolio
outflows reaching nearly 25 percent in October 2023; and 14 percent relative to the sum of portfolio and
FDI outflows (Figure 4, Panel a and b).25 Examining cumulative net outflows from January 2020 to
October 2023 (Figure 4, Panel c), the share of crypto net outflows attains even higher values: 82 and 40
percent relative to PF and FDI net outflows 26, respectively, and 14 percent relative to net exports. To
complement this, Figure A.1 in the Appendix scales these CBCF by the Brazilian GDP, finding again a
clear upward trend for CBC outflows, reaching close to one half of a percentage point of annual GDP by
the end of the sample in 2022. These figures illustrate that, over the past few years, residents in Brazil
have been purchasing an increasing volume of crypto assets relative to other financial assets abroad.
Determining the exact motivations behind Brazilians’ acquisition of crypto assets can be challenging due
to the lack of data needed to formally test the various hypotheses. One is the desire to diversify
investment portfolios by Brazilians. Furthermore, due to regulations preventing Brazilians from opening
FX accounts within the country, those seeking to maintain savings in FX may find it more convenient to
invest in crypto assets rather than establishing an account abroad, despite the higher risk exposure.
Formally exploring the drivers of the considerable increase in CBC outflows in Brazil is an obvious area
for further research.27
seller will necessarily receive BRL in this case. Likewise, if a Brazilian resident has an account abroad, she cannot sell cryptos in a
Brazilian exchange and receive USD in her foreign account. For that, she would have to transfer the funds to her foreign account,
for which she must first carry out a forex operation with an institution authorized to operate in the Brazilian FX market.
24 PF outflows refer to acquisition of nonresidents’ portfolio assets by Brazilian residents, while FDI outflows refer to acquisition of
FDI abroad by Brazilian residents. Hence when comparing PF and FDI outflows with CBCFs we are comparing flows from residents.
Although up until now the IMF has recommended to treat Bitcoin-like crypto assets as nonfinancial assets, and therefore to include
them in the current account of the BoP, we compare CBCFs with PF and FDI because crypto assets could be seen as an
investment.
## 25 Variation in the price of crypto assets affect the volume of CBCFs reported in this figure. The same applies for the price of
portfolio and FDI assets that are used as baseline.
## 26 Residents’ outflows—residents’ inflows.
## 27 The tax on financial operations (IOF for its name in Portuguese) cannot explain the upward trend on purchases of crypto assets,
as for these purchases the FX transfers are going through the financial system and subject to the IOF—the IOF for FX transfers to
accounts abroad is 0.38 percent since 2010 (the IOF on transfers to same accountholder’s name is 1.1 percent).IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 15
Figure 3: Brazil CBCFs—Official Data (Method 3)
Panel a): CBC Outflows and Inflows
Panel b): CBC Net Outflows
Note: Panel a) reports the official monthly CBB data of imports of crypto assets (“crypto outflows”) and exports of crypto
(“crypto inflows”). Panel b) reports net outflows computed as crypto outflows minus inflows. Hodrick-Prescott trends are
reported using a smoothing parameter of 14400. Imports of crypto assets are referred as “crypto outflows”, as they imply
an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: Central Bank of Brazil and
authors’ calculationsIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 16
Figure 4: Brazil CBCFs Compared to Traditional Capital Flows
Panel a): As Share of Portfolio Flows
Panel b): As Share of Portfolio and FDI Flows
Panel c): CBC Cumulative Net Outflows Compared to Other Net Cumulative Flows
Note: Panel a) and b) show 12-month moving averages. PF outflows (PF inflows) refers to acquisition (sales) abroad of portfolio assets by Brazilian
residents. Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an
FX inflow occurs. FDI outflows (FDI inflows) refers to acquisition (sales) abroad of direct investment assets by Brazilian residents. Panel c) displays
accumulated flows between January 2020 - October 2023. FDI Net Outflows = Net acquisition of FDI (outflows - inflows). PF Net Outflows = Net
acquisition of portfolio financial assets (outflows - inflows). Net Exports do not include crypto assets. For panels a) and b), the PF and FDI shares are
first calculated monthly, and then averaged in 12-months windows. For panel c), monthly flows between January 2020 and October 2023 are summed.
Source: CBB and authors’ calculationsIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 17
4.2. Alternative Methodologies
A comparison between Brazil’s CBCFs compiled by the CBB and those estimates reported by the industry
(Crystal and Chainalysis) reveals significant differences across methodologies (Figure 5). First,
Chainalysis’ estimated flows exhibit much higher magnitudes in both outflows and inflows. While CBC
outflows from the CBB data reach around 25 percent of portfolio outflows towards the end of our sample,
those from Chainalysis are an order of magnitude higher, around 200 to 300 percent in the last two years
of the period analyzed. An even wider difference between Chainalysis’ estimates and the other two
sources can be seen for CBC inflows. Second, there are also important differences across CBB and
Crystal data. Regarding CBC outflows, while CBB data reveal that they have averaged around 25 percent
of portfolio outflows, Crystal´s data indicates that these flows have not been larger than 1.9 percent. In
contrast, CBC inflows relative to portfolio inflows in Crystal peak at 3.3 percent, while those from the CBB
peak only at 1.3 percent.
Figure 5 also documents the correlation between the CBB data and the two additional sources of data from
the crypto industry. While the data from Crystal and Chainalysis are positively correlated in both outflows
(panel b) and inflows (panel d), both stand largely at odds with the CBB data. Chainalysis outflows positively
correlate with those from the CBB (0.6; panel b) but display a negative and insignificant correlation on
inflows (-0.1; panel d). Crystal’s outflows and inflows display a negative correlation with the CBB data (panel
b and panel d).
We now contrast methodologies in terms of the correlation across inflows and outflows. A noticeable
property of the two industry proxies is their high correlation. Indeed, Chainalysis´ inflows and outflows stand
out due to their similarity, displaying a near perfect correlation (0.99; Figure 6, Panel a).28 The correlation
across gross flows in Crystal´s data is also high, though not perfect (0.71; Figure 6, Panel b). Crystal’s
outflows exceeded inflows until 2021 when the relationship reversed. In contrast, the correlation between
inflows and outflows reported by the CBB (see previous Figure 3) is 0.54, similar to the correlation for
traditional capital flows (PF, PF+FDI), as documented in panel c (0.53).
## 28 According to Chainalysis staff, the high correlation of inflows and outflows data for Brazil is expected based on the methodology
to estimate country data using a single web-traffic value for every inflow and outflow, and the typical tendency of exchanges to
exhibit similar on-chain inflows and outflows.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 18
Figure 5: Brazil CBCFs—Official Data and Method 2
Panel a): CBC Outflows / PF Outflows
Panel b): Outflows: correlation across methodologies
Panel c): CBC Inflows / PF Inflows
Panel d): Inflows: correlation across methodologies
Note: Panel a) displays 12-month moving average of the share of CBC outflows over PF outflows. Panel c) displays 12-month moving
average of the share of CBC inflows over PF inflows. PF outflows (PF inflows) refers to acquisition (sales) abroad of portfolio assets
by Brazilian resident. Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto
as “crypto inflows”, as an FX inflow occurs. Cryptocurrencies included in Crystal and Chainalysis series can be found in Table A.1.
Source: Central Bank of Brazil, Chainalysis, Crystal and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 19
Figure 6: Brazil CBCFs for Chainalysis and Crystal
Panel a): CBC Outflows and Inflows - Chainalysis Panel b): CBC Outflows and Inflows - Crystal
Panel c): Correlation coefficients
Note: Panel c) shows the correlation coefficients between outflows and inflows within the same data source, for crypto flows, and
within the same financial flow for PF and PF+FDI. Each correlation coefficient is calculated restricted to the availability of each series.
Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”,
as an FX inflow occurs. Cryptocurrencies included in Crystal and Chainalysis series can be found in Table A.1. Source: Chainalysis,
Crystal Intelligence and authors’ calculations
A complementary way to contrast the various sources of CBCFs is by studying the cumulative flows, as
documented in Figure 7, again using portfolio flows as benchmark, between 2020 and 2022. The upper
two plots in the Figure reveal that, by and large, Chainalysis´ cumulative gross flows surpass those from
the other two sources by at least an order of magnitude, in both inflows and outflows, consistent with the
evidence presented in Figure 5. It further documents that, while Crystal´s cumulative inflows are larger
than those in the CBB data, the reverse occurs for outflows. In net terms, the differences are also striking,
as depicted in the lower panel c. CBB net outflows represent 63.3 percent of net PF outflows, while
Chainalysis’ data is only 0.2 percent. Crystal’s net outflows are negative and represent 2 percent of net
PF outflows.
Figure 8 extends this analysis by contrasting CBB data (Method 3) with data from one P2P exchange
(Method 1), differentiating between inflows and outflows. The figure displays the raw data and documents
the correlation between the flows across the two sources. The P2P data for Brazil was provided by Cerutti
et al. (2024) from their analysis of LocalBitcoins and follows the approach in Graph von Luckner et.al
(2023). Two facts readily stand out from the figure. First, the volume of the flows from the two sources are
largely at odds, with CBB volumes being several orders of magnitude larger than those registered in
LocalBitcoins, regardless of the direction of the flow. From April 2017 to February 2023, CBB’s CBCIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 20
inflows and outflows were USD228 million and USD22.276 million, respectively, while Method 1
registered inflows for USD0.1 million and outflows for USD0.2 million.
Figure 7: Brazil Cumulative CBCFs—Official Data and Method 2
Panel a): CBC Outflows Panel b): CBC Inflows
Panel c): CBC Net Outflows
Note: Figure displays accumulated flows between 2020 - 2022. Values are scaled by PF flows. PF outflows (PF inflows) refers to
acquisition (sales) abroad of portfolio assets by Brazilian resident, while PF net outflows is PF outflows—PF inflows. Imports of
crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an
FX inflow occurs. We first sumthe flows (both CBCFs andPF flows) between January 2020 and December 2022, and then calculate
the share of CBCFs over PF flows. Cryptocurrencies included in Crystal and Chainalysis series can be found in Table A.1. Source:
Central Bank of Brazil, Chainalysis, Crystal Intelligence and authors’ calculations.
Second, the dynamics of flows are also largely at odds across the two sources, displaying either no
statistically significant correlation on CBC outflows (-0.1) or a negative and statistically significant for
inflows (0.2). These facts are largely expected, given that the two methodologies do not overlap, for they
measure different types of crypto flows: the CBB method measures flows that go through the financial
system, while the one studying P2P flows focuses on those that bypass the financial system. Although
Brazil has a CFM on outflows (a tax of 0.38 percent on FX transfers to accounts abroad), its small
magnitude is not an incentive to bypass the financial system to circumvent it, given the difficulty of findingIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 21
bilaterally Brazilian residents willing to sell their cryptos for local currency and the high costs of P2P
platforms such as LocalBitcoins.29
Figure 8: Brazil CBCFs—Official Data and Method 1
Panel a): CBC Outflows
Panel b): CBC Inflows
Note: Each figure displays the correlation coefficient (ρ) between LocalBitcoins data (Method 1) against CBB data (Method 3). A star
(*) shows a 10 percent statistical significance. Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow
of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. LocalBitcoins flows are from Cerutti et.al (2024). Source:
Central Bank of Brazil, Cerutti et.al (2024) and authors’ calculations.
29 Graph von Luckner et.al (2023) report that the transaction cost in LocalBitcoins is 1 percent (2 percent to both buy and sell).IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 22
4.3. Taking stock
In sum, the case study of Brazil allows us to conclude that the three methods exhibit important
differences:
• Crypto inflows and outflows are orders of magnitude larger in Chainalysis relative to the others.
• Crypto outflows (inflows) in Crystal are considerably below (above) those reported by the CBB.
• The correlation between inflows and outflows in Chainalysis and Crystal is much higher than in
regular flows.
• Net flows are near zero in both Chainalysis and Crystal, while CBB net outflows are substantial.
• Information from P2P (Method 1) is several orders of magnitude lower than all other measures and
does not correlate with the official data reported by the CBB.
Why do flows differ so much among sources? There are several confounding factors that can explain the
differences documented:
• The process of assigning wallets to exchanges can produce biases. For example, Cerutti et al. (2024)
report that WalletExplorer cannot provide information on all available wallets and exchanges. It
allowed them to identify just about 5 percent of the addresses in their dataset, which is in line with
Liang et al. (2019) who show that, as of 2018, WalletExplorer detects 4.3 percent of addresses in the
Bitcoin blockchain.
• CBCFs in Crystal only capture transactions among registered exchanges across countries and such
exchanges need to be registered only in one country. Therefore, when a Brazilian buys/sells crypto
assets in a registered exchange outside of Brazil without going through an exchange in Brazil, this
transaction is not recorded by Crystal, whereas it is reported to the CBB when the Brazilian
transfers/receives FX from/to Brazil. This could lead to an understatement of outflows in the Crystal
data relative to that in the CBB data. In an extreme case, if no exchanges were registered only in
Brazil, Crystal’s outflows and inflows would be zero.
• Chainalysis’ use of web traffic to allocate CBCFs across countries could be
overestimating/underestimating their volumes by assuming all website entries as transactions and
treating all entries equally, regardless of individual wealth. An example is Binance. Given the large
flows registered in this platform, Chainalysis’ methodology of mapping web traffic from Brazil in this
platform to actual CBCFs may be overestimating the actual flows to and from this country.
• Method 1´s approach of identifying CBCFs through P2P exchanges is missing flows that go through
the financial system. Furthermore, this method is constrained by the data that is discretionally made
available by the P2P exchanges. For example, the reported flows in Graph von Luckner et al. (2023)
and Cerutti et al. (2024) are restricted to LocalBitcoins and Paxful, the only P2P exchanges that, to
the best of our knowledge, have allowed externals to access data from their transactions. To the
extent that CBCFs materialize through a multiplicity of these platforms that do not make their data
available, Method 1 would be missing these flows.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 23
5. Case Study 2: Global Cross-Border Crypto
Flows
While the previous case study documented an evident increase in the volume of CBCF in Brazil, we
cannot extrapolate its results to other countries. To address this, in this section we estimate the volume of
total cross-border crypto flows around the globe, which we call global CBCFs (G-CBCFs). We do so by
summing up across all crypto transaction and across countries using transactional-level data from the two
industry providers analyzed in the previous sections, Crystal Intelligence and Chainalysis. Our basic
premise is that, while the previous case study illustrates how specific bilateral CBCFs may be biased, the
summation across all country flows may exhibit much less of a bias. In other words, while the two specific
countries through which a CBCF transaction takes place may be hard to pin down, the summation across
all these transactions—excluding those that occur within countries—can offer a less biased estimate of
the total volume of CBCFs around the world. The bias, however, may not disappear insofar as the
transactions within countries removed can still exhibit such bias. Hence the estimates provided should be
taken only as a reference and not as an unbiased estimate. In addition, volumes could be influenced by
wash trades.30
We start by working with the data on CBCFs from Crystal. This provider links every transaction to two
registered exchanges: one from where the crypto flow is coming from, and one from where the flow is
going to. In addition, as explained before, Crystal maps exchanges to countries. This allows us to identify
which crypto transactions are cross-border flows from those that occur between exchanges of the same
country. Having identified these cross-border flows, we sum them up by year, across countries and
different crypto assets. We also include transactions across exchanges that Crystal lists as being
registered in multiple countries.31
Crystal identifies fourteen different crypto assets (the full list can be found in Table A.1). Once we
cumulate the CBCFs by year, we scale them by three alternative flows akin to what we did in the previous
case study, namely portfolio flows, total capital flows and GDP.32 We get financial flows and GDP data
## 30 Wash trading is a form of market manipulation in which one entity simultaneously buys and sells the same asset, creating a false
impression of market activity despite the trade reflecting no change in beneficial ownership. Crypto exchanges may fake transaction
volumes to attract liquidity and customers. According to Cong et al. 2023, wash trading is a prominent issue in centralized
cryptocurrency exchanges: over 70 percent of reported volume on unregulated crypto exchanges consists of such trades. Pennec et
al. 2021 report that exchanges that engaged in wash trading exaggerate their true volume by a factor of 25 to 50. Moreover, around
56 percent of the total number of exchanges (exchanges registered in different countries count as per the number of countries in
which they are registered) in Crystal´s database could be considered as unregulated, however 65 percent of the CBCF volumes
reported by Crystal are between two regulated exchanges. Crystal defines regulated exchanges as one which has at least one legal
entity with a specific crypto license from a regulatory or supervised by an authority that governs crypto activities. For example, if an
entity operates in three different countries and has legal entities in each, it would be considered as the regulated entity if at least one
of these legal entities holds a crypto license or supervised.
## 31 This may bias the results somehow insofar as there can be transactions that occur between borders. We believe, however, that
not including transactions across exchanges that are registered in multiple countries may deliver an even larger downward bias on
G-CBCFs.
## 32 Portfolio flows are net purchases of domestic portfolio assets by foreign residents, and total capital flows are net purchases of
domestic assets (portfolio, FDI, derivatives and other flows) by foreign residents.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 24
from IMF’s Financial Flows Analytics (FFA), summing the flows across 188 countries for which data is
available. We perform this for the years 2014 through 2022.
Figure 9 presents the results of the G-CBCFs using the data from Crystal. Overall, the time series
behavior of the three variables plotted displays a remarkable resemblance to the case study of Brazil.
They are characterized by a clear upward trend with a considerable amount of volatility around it. The
trend begins between 2016 and 2017 and displays a peak in 2021, reaching an overall volume of G-
CBCFs of around 16.2 and 6.6 percent when scaled by portfolio flows and total capital flows, respectively.
The figure also depicts the dynamics when world GDP is used to scale the G-CBCFs on the right vertical
axis. The dynamics are similar and display a peak in 2021, around half of a percentage point of world
GDP.
Figure 9: Global CBCFs
Note: Yearly crypto flows are the sum of every transaction across assets and exchanges in a year from Crystal database, excluding
transactions between exchanges registered in the same country. Yearly financial flows or GDP are the sum across 188 countries in
a year. The 2022 shares use 2021 data in the denominator (PF flows, Total Capital flows and GDP), due to availability of data.
Cryptocurrencies included in each series can be found in Table A.1. Source: Crystal Intelligence, IMF’s FFA and authors’
calculations.
We now complement the analysis of G-CBCFs with the transactional daily data from Chainalysis, which
we have access to only from April 2022. Like the data from Crystal, Chainalysis links every transaction to
two registered exchanges and then maps exchanges to countries. This allows us to identify which crypto
transactions are cross-border flows from those that occur between exchanges of the same country. We
take the entire set of daily transactions in a year (from April 2022 to March 2023) and sum every cross-
border transaction. This is, we exclude every crypto transaction that takes place within the same country.
We do this for the 30 crypto assets that the data has available (including eleven assets that overlap from
Crystal). Then, as in the previous analysis with Crystal data, we scale G-CBCFs by global total capital
flows.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 25
Figure 10 displays the results of this additional exploration. The green bar in the middle depicts the share
of G-CBCFs for all the 30 assets in Chainalysis, which amounts to about one third (35.1 percent) of all
capital flows worldwide registered in the previous 12-month period.33 The blue bar to the right reproduces
this result using only the 9 assets that can be overlapped with the data from Crystal. For comparison the
number from Crystal data for that same period using all the assets available in this dataset is plotted in
yellow at the far left of the figure, while the blue bar uses the 9 assets overlapped with Chainalysis. As per
the Chainalysis data, G-CBCFs in these 9 assets account for 23.6 percent of total capital flows. This is
about an order of magnitude larger than that coming from the Crystal data (2.8 percent). The remaining
two bars depict the values of G-CBCFs that are accounted for by Bitcoin transactions alone, with
Chainalysis data on the right standing at 4.2 percent of total capital flows and 1.3 percent using Crystal.
Figure 10: Global CBCFs as Share of Total Capital Flows: April 2022—March 2023
Note: Figure depicts G-CBCFs as share of capital flows in a 12-month period between April 2022 and March 2023 for CBCFs,
scaled by worldwide capital flows in 2021 (due to lack of data for 2022). G-CBCFs are obtained by summing CBCFs across
countries, excluding flows within the same country. Crystal – All assets bar includes the 14 crypto assets provided by Crystal
Intelligence, while Chainalysis – All assets bar includes the 30 crypto assets provided by Chainalysis (the full list of assets can be
found in Table A.1). The 9 assets that can be overlapped between the two datasets are: BTC, BUSD, DAI, ETH, LTC, USDT, TUSD,
USDC and XRP. Source: Crystal Intelligence, Chainalysis, IMF’s FFA and authors’ calculations.
The discrepancy in G-CBCFs across the measures from Crystal and Chainalysis that remains even after
controlling for the same number of crypto assets can be attributed to the difference in the number of
exchanges covered. While Chainalysis tracks data from 2253 exchanges, Crystal relies on information
from only 703 exchanges, out of which only 367 overlap across the two sources, most likely due to the
33 Due to data availability, our denominator uses capital flows data within the calendar year 2021.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 26
differences in registering criteria of a crypto exchange across the two data providers.34 This creates,
therefore, a notable disparity in coverage that accounts for the discrepancy in the measurement.
Lastly, the data from both Crystal and Chainalysis can also be used to pin down the share of backed to
unbacked cryptos in G-CBCFs. For the sake of space, the Appendix (Figure A.3) reproduces the G-CBCF
estimates from both sources documenting the share of backed stablecoins. From both sources one can
see that this share is considerable and hovers between one third to half of the GCBFs. For the Crystal
source, one can further see that this share begins to grow only in the latter years of our period of analysis.
6. Dynamics and Drivers of Cross-Border Crypto
Flows
This section analyzes the dynamics and drivers of CBCFs. For this, we turn again to the data from the
CBB. Its relatively long time series coverage as well as the higher (monthly) frequency, coupled with the
fact that official balance of payments statistics exists also at that frequency, make Brazil a good subject of
analysis for this purpose. The section begins by documenting the volatility and cyclicality of CBCFs in
Brazil and comparing it against financial flows. It then turns to documenting the drivers behind these
dynamics by, first, exploring any systematic relationship between CBCFs and remittances data and,
second, by building a simple SVAR model of push/pull factors with which the share of variance in crypto
and financial flows that is associated with external variables is quantified.
6.1. Volatility
We start by assessing volatility of CBCFs through a simple analysis of the standard deviations (SDs) of
the time series studied. As before, we use regular capital flows as benchmark. Importantly, because the
series exhibit different scales, to make the comparison across variables meaningful, we detrend the
series using the Hodrick-Prescott filter with the appropriate smoothing parameter. More concretely, using
official monthly data from the CBB, we remove the trend of four series—import of cryptos, PF outflows,
FDI outflows, and the sum of PF and FDI outflows—and compare the volatility of the detrended series.
Our period of analysis covers 2018 through 2022 where we observe the increase in crypto transactions.
Figure 11 presents the results of our analysis. The table in the upper panel reports, in the first row, the SD
of the series, while the second row scales them as a share of the SD of the PF+FDI series. The plot
below depicts the time series of the detrended series. The table shows that CBCFs are roughly as volatile
as regular PF and FDI flows and, if anything, they have displayed slightly less volatility. This is confirmed
in the time series plotted in the chart of the Figure, where CBCFs variability through time does not stand
out as large relative to that of the other financial flows.
## 34 The number of exchanges in Crystal is lower than in Chainalysis as Crystal does not consider the exchanges not registered in a
country. Given the format of the data provided by Chainalysis—which does not contain bilateral flows between exchanges flows—it
is not possible to run a CBCF analysis on the overlapped exchanges in both data providers.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 27
Figure 11: CBCFs and Capital Flows Volatility
Note: Portfolio (FDI) outflows refers to the acquisition of portfolio (FDI) assets abroad by Brazilian residents. CBCFs is the imports of
crypto assets by Brazilian residents. Monthly series are detrended with a Hodrick-Prescott filter with a smoothing parameter of
14400 from 2016. Period for S.D calculations is 2018-2022. Imports of crypto assets are referred to as “crypto outflows”, as they
imply an outflow of FX. Source: CBB and authors’ calculations.
6.2. Correlation
Next, we assess the cyclicality of CBCFs in Brazil through means of simple correlations with other
financial flows and other external variables that are orthogonal to the Brazilian economy. More precisely,
we calculate the correlation for ten variables. Five variables relate to crypto and capital flows: CBC
outflows, CBC inflows, CBC net outflows, PF net outflows and total net capital outflows. The remaining
five are global variables that could impact both crypto and capital flows in the Brazilian economy: the VIX
index, the price of Bitcoin, the S&P 500 index, the World Industrial Production (WIP) index by Baumeister
and Hamilton (2019) and a variable that captures the advanced economies monetary stance (AEMS).
The appendix reports the sources for this data. Except for the price of Bitcoin, these variables are
standard when assessing the role of push factors in EME. All variables have a monthly frequency, and
the correlation is calculated between January 2018 and March 2023.
Two stylized facts stand out from the descriptive statistic in Table 1. First, while inflows and outflows of
CBCFs in Brazil are positively correlated (0.54), neither of these two display any significant correlation
with regular financial flows. Second, CBCFs display a positive and significant correlation with all the
external variables considered (except the VIX). At the same time, regular net flows are not so strongly
correlated with the external variables as the crypto flows are, although a (negative) correlation exists
between total net capital outflows and the WIP and AEMS and between PF net and AEMS. The latter is
nonetheless influenced by the short (balanced) sample considered in Table 1. In the Appendix (TableIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 28
A.2) we present an alternative version of Table 1 where we maximize the (unbalanced) sample when
computing correlations which yields a stronger (negative) correlation with VIX, among others.
Table 1: Correlation Coefficients for Domestic and Global Variables
Note: Period of analysis is January 2018 through March 2023. Out (In) stands for outflows (inflows); PF stands for portfolio flows;
Total stands for total capital flows; PBTC is the price of Bitcoin; S&P is the Standard and Poor´s 500 index; WIP is the world
industrial production index by Baumeister and Hamilton; and AEMS is the advanced economies monetary stance index. Correlations
are computed on the variables in levels. Blue colors denote variables related to crypto flows. Imports of crypto assets are referred to
as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Net CBCFs is
computed as outflows less inflows. Source: Central Bank of Brazil, FRED, Baumeister and Hamilton (2019) and authors’
calculations.
6.3. Remittances
Earlier studies have suggested a potential relationship between crypto adoption and flows of remittances
(Alnasaa et al., 2022; He et al., 2022; Graf von Luckner et al., 2023; IMF, 2023). Graf von Luckner et al.
(2023), for instance, found that the use of Bitcoin has become an increasingly important channel for
receiving remittances and evading capital controls in emerging markets. Motivated by this, we analyze if
CBCFs in Brazil display a systematic correlation with remittances.
Figure 12 plots the official flow of remittances into Brazil as per the balance of payments statistics
together with the various CBCFs across the methodologies explained before. We use the data on
personal transfers—credits as the flow of remittances into Brazil. The upper plot displays the flow of
remittances with the CBC outflows and CBC inflows from the CBB data, and the lower panel reports the
other measures of CBC outflows from the alternative methodologies studied (Figure A.4 reports CBC
inflows from these alternative methodologies). As can be seen from inspecting both plots, there is no
obvious relationship between remittances and any of the CBCFs proxies used.
This is further explored more formally through regression analysis and the results are presented in the
Appendix for the sake of space (see Tables A.9 and A.10). The systematic correlation between
remittances and CBB data on CBCFs is gauged by regressing CBC inflows and outflows, separately,
against current values and four lags of the flow of remittances, after controlling for a trend. In the case of
CBC outflows, results corroborate that, once one controls for trends in remittances and CBCFs, there is
no systemic relationship between the two. Thus, on a first look, changes in remittances do not appear to
be a relevant driver behind the large recent influx of crypto in Brazil. On the other hand, we do find a
contemporaneous and significantly negative relationship between remittances and CBC-inflows, signaling
that part of the increase in sales of crypto assets might be substituting income from remittances. Still, theIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 29
significantly large and upward trend in net crypto purchases is unrelated to remittances. The same
regression analysis using flows from Chainalysis and Crystal is presented in the appendix. It is largely
consistent with these findings.35
Figure 12: Remittances and CBCFs
Panel a): Remittances and CBC Outflows and Inflows from CBB
Panel b): Remittances and CBC Outflows from other methodologies
Note: Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto
inflows”, as an FX inflow occurs. LocalBitcoins data from Cerutti et.al (2024). Cryptocurrencies included in Crystal and Chainalysis
series can be found in Table A.1. Data on remittances into Brazil are proxied as personal transfers—credits. Source: Central Bank
of Brazil, Chainalysis, Crystal Intelligence, Cerutti et.al (2024) and authors’ calculations.
35 Table A.11 in the Appendix presents further analysis of the positive correlation between CBCFs and import and export of goods.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 30
6.4. SVAR
To address what are the drivers behind CBCFs for the Brazilian economy and quantify how much they
originate in domestic (pull) or external (push) factors,36 we calculate the share of the CBCFs´ variance
explained by external factors using a SVAR model. The model follows closely that in Fernández et al.
(2017).37 We adapt this framework to pin down the share of the variance of CBC outflows in Brazil that is
explained by global shocks and transmitted by global variables into the Brazilian economy, thereby
providing a quantification of the relevance of push factors in crypto flows.
While we refer the reader to Fernández et al. (2017) for details, a minimal explanation is presented next.
The model consists of two blocs: one foreign and one domestic. The foreign bloc has five external
variables that are exogeneous to the Brazilian economy and were studied in Table 1: the VIX index, the
price of BTC, the S&P 500 index, the WIP index by Baumeister and Hamilton (2019) and the AEMS. We
assume that the vector 𝑋𝑡 with these five external (detrended) variables evolves according to the first-
order autoregressive system:
𝑋𝑡 = 𝐴 𝑋𝑡−1 + 𝜇𝑡
Where 𝐴 denotes a matrix of coefficients and 𝜇𝑡 is an i.i.d. mean-zero random vector with variance–
covariance matrix Σ𝜇. We interpret the vector 𝜇𝑡 as representing a combination of global shocks (captured
in reduced form) affecting these external variables.38
On the other hand, a domestic bloc postulates a vector 𝑌𝑡 with four (detrended) variables of the Brazilian
economy: CBC outflows, a monthly economic activity index (IEA), the monetary policy rate and the
nominal exchange rate. We assume that 𝑌𝑡 evolves according to the following process:
𝑌𝑡 = 𝐵𝑋𝑡 + 𝐶𝑌𝑡−1 + 𝐷𝑋𝑡−1 + 𝜀𝑡
Where 𝐵 , 𝐶 and 𝐷 denote conformable matrices of coefficients and 𝜀𝑡 is a vector of residuals capturing
(in reduced form) shocks that affect 𝑌𝑡. Note that this bloc relies on two assumptions. First, since Brazil is
a small open economy, 𝑌𝑡 does not impact 𝑋𝑡. Second, 𝜇𝑡 is orthogonal to 𝜀𝑡, thus 𝜇𝑡 captures global
shocks that impact the Brazilian economy via its impact on 𝑌𝑡, mediated by its direct impact on 𝑋𝑡. Note
that 𝜀𝑡 may capture global shocks too, but whose impact on 𝑌𝑡 are not mediated by 𝑋𝑡. The main object of
our analysis is the share of variance in 𝑌𝑡 –CBC outflows, in particular—that can be traced back to the
## 36 For a survey of the push/pull factors literature on EMs as well as its theoretical underpinnings see Koepke (2018). As described
in this work, pull factors can be thought of as factors that affect the expected return and/or risk of EM assets, while push factors
affect primarily the characteristics of other investable assets to which EM assets are being compared by investors. If agents lack
financial diversification options, domestic developments (pull factors) might drive agents to buy crypto assets as a way to diversify
their portfolio. Likewise, global (push) factors might also drive them to trade these digital assets via, e.g. their impact on the world
price of crypto assets.
## 37 Fernandez et.al (2017) quantified how much commodity prices serve as conduits of global shocks in determining the variance of
the business cycle in a set of small open economies.
## 38 Our work is not concerned with the identification of specific global shocks. Instead, we are interested in estimating the joint
contribution of 𝜇𝑡 to Brazilian crypto flows and domestic macro variables. For this purpose, no further identification assumptions on
the system are required. Note that this framework allows to identify the share in the variance of 𝑌𝑡 that can be traced back to global
shocks, not the identification of structural shocks. Therefore, no structural impulse response analysis is derived.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 31
vector of global shocks (𝜇𝑡). For comparison, we will rerun the analysis substituting CBC outflows in 𝑌𝑡 for
financial flows.
We estimate the two blocs on a monthly data over the period January 2018 to March 2023.39 Following
Fernández et al. (2017), we correct for the possibility of a small sample upward bias in the variance share
that we want to quantify. Using Monte Carlo methods, we calculate the bias in the variance share for the
given sample size, which we use to correct the estimation (see Appendix for details). Given the reduced
number of observations, we also consider a sequential estimation alternative where each variable in 𝑌𝑡 is
estimated as the sole variable in the domestic bloc.
Table 2 reports the main results in terms of the share of the variance of the variable of interest, whether a
crypto or a regular capital flow, explained by global factors. Looking at the small sample bias corrected
estimation in the sequential version, 32 percent of the variance of the CBC outflows is explained by
external variables (column 1, upper panel). This is quite close to the near 30 percent share obtained in
the joint estimation (column 1, lower panel). This share is between 6 and 3 times that explained in PF and
PF + FDI outflows presented in the remaining two columns of the table. Both results continue to be robust
to both the sequential and joint analyses.
Table 2: Variance Share Analysis on Outflows
Note: The table depicts the share of the variance of the CBC outflows (column 1), portfolio outflows (column 2), and portfolio and
FDI outflows (column 3) explained by global shocks 𝜇𝑡, and mediated by the push variables in 𝑋𝑡. Sample period is January 2018
to March 2023. The sequential section includes only the first row variable in the domestic bloc, whereas the joint section includes
also the monthly index of economic activity (IEA), the nominal exchange rate, and the monetary policy rate. Whenever the bias is
larger than the non-corrected share, the corrected share shown in the table is 0. All variables are detrended. Imports of crypto
assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow
occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and authors’ calculations.
## 39 Lack of data on CBCFs prior to 2018 prevents us from running a longer time series analysis. In the baseline results reported, the
foreign bloc is estimated on the same time period as that of the domestic bloc. However, the latter could be estimated on a longer
sample. The Appendix (Tables A.3 and A.4) presents results where the foreign bloc is estimated from data that goes as far back as
2015—due to the lack of prior information on the price of Bitcoin, we cannot go further back in time. Results are qualitatively similar.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 32
While the previous analysis focused on gross flows, Table 3 looks at the variance share of net crypto and
capital outflows and finds that the results obtained before are robust. CBC net outflows are around 3
times more sensitive to external factors relative to total net outflows.40
Table 3: Variance Share Analysis on Net Outflows
Note: The table depicts the share of the variance of the variable in the first row explained by global variables. Sample period is
January 2018 to March 2023. The sequential section includes only the first row variable in the Domestic bloc, whereas the Joint
section includes also IEA, NER and MPR. Whenever the bias is larger than the non-corrected share, the corrected share shown in
the table is 0. All variables are detrended. Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of
FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and
authors’ calculations.
7. Policy Implications
This section draws the policy implications from the findings presented in our work. There are two direct
implications that are worth discussing. First, the results presented underscore the need for a better, more
accurate and comprehensive measurement and monitoring of CBCFs by country authorities, as it is
regularly done with other flows in the balance of payment, e.g. capital flows. The increase in the volume
of these new crypto flows across borders implies that their potential role as transmitters and propagators
of external shocks may become more relevant in the years to come. Hence, policymakers ought to be
better equipped with accurate measures of these flows to monitor them in high frequency. In that regard,
while industry and academic estimates of CBCFs can provide a broad indication of trend activities for
policy analysis, they can be limited in providing more precise measurements of crypto flows and can vary
considerably among them. Hence, the need for official statistics that can be comparable across countries
is clear. In that regard, pioneering methods to capture the broad extent of these flows—such as the one
developed by the CBB—offer a useful benchmark that should be explored and enhanced by others.
Likewise, the proposals gathered on how to close data gaps when measuring digital money in the
## 40 As mentioned, our framework does not allow to identify the specific contribution of structural shocks associated to of each of the
variables in the SVAR. Thus, we cannot pin down e.g., the independent importance of structural shocks to the price of Bitcoin.
Nonetheless, the appendix presents sensitivity results where the price of Bitcoin is excluded from the foreign bloc (Tables A.5 and
A.6). Results shows that such exclusion ends up increasing the share of variance associated to foreign shocks. We view this result
as consistent with earlier work that has documented the hedging properties of some crypto assets against stock market volatility
(see Just and Echaust, 2024, and references therein).IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 33
Recommendation 11 of the G20´s Data Gap Initiative are a promising way to achieve this goal. This will
likely entail the need for crypto exchanges and other digital platforms to systematically gather information
on the residency of their clients and report bilateral flows across countries to statistical agencies,
regardless of where the regulatory perimeter of these markets is ultimately set.
The second policy implication that can be derived from our findings is the need to think about the optimal
design of CFMs in an increasingly digitalized world.41 As has been documented extensively, capital flows
may be desirable as they can bring substantial benefits for countries, although they may also entail risks,
and CFMs can help countries reap those benefits while managing the risks to macroeconomic and
financial stability of large and volatile capital flows (IMF´s Institutional View, 2012, 2022a). There is
increasing evidence, however, that CBCFs might have begun to serve as channels to circumvent existing
CFMs (Graf von Luckner et al., 2023, 2024; Cerutti et al., 2024; He et al., 2022; Chen and Sarker, 2022).
This, together with the evidence presented in our work that CBCF volumes are increasing and may be
more sensitive to external factors outside of the control of policymakers, warrants the need to rekindle
CFMs and adapt them to the new digital environment.
Graf von Luckner et al. (2024) assert that crypto markets serve as marketplaces for capital flight through
traditional channels, rather than a novel channel for capital flight. They identify two scenarios in which
crypto assets could facilitate the evasion of outflow CFMs. In the first scenario, an exporter purchases
crypto assets abroad using the FX earnings from exports,42 then transfers these crypto assets to an
exchange in his country to sell the cryptos. A resident aiming to get the money out of the country
circumventing the outflows CFMs buys these cryptos and subsequently transfers them overseas to sell
and acquire FX. In this case, the local crypto exchange acts as a centralized venue facilitating the
transaction between the exporter and the resident, with all dealings conducted through crypto exchanges
(both abroad and local). Without a local exchange to circumvent outflows CFMs, the resident and the
exporter must know each other, and the transaction would be executed directly on the blockchain or in a
P2P platform, relying on mutual trust.
The second method of circumvention identified by Graf von Luckner et al. (2024) involves crypto mining.
Miners can sell newly mined cryptos on the local exchange to other residents who want to move money
out of their country. Like the previous case, these residents then transfer the crypto to foreign exchanges,
selling them to obtain FX. In countries without local exchanges, the newly mined cryptos would be sold
bilaterally.
Crypto assets can serve to bypass CFMs on outflows in at least two more scenarios. First, in a country
that imposes outflow CFMs when residents already possess crypto assets, these assets can be sold on
41 IMF (2022b) discusses how crypto assets could impact the effectiveness of CFMs from a structural and longer-term perspective.
## 42 As mentioned in the IMF’s institutional view on capital flows management (2012), CFMs on outflows should be comprehensive to
minimize circumvention. In the case of the example, if the country has outflow CFMs, the exporter should be subject to a repatriation
or surrender requirement, otherwise the exporter could sell the FX received from the export to a resident that wants to get money
out of the country, depositing the FX abroad, making the CFMs ineffective. With a surrender requirement and through under
invoicing, the exporter could still sell some FX abroad for the resident wanting to take the money out of the country.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 34
the local exchange to residents wishing to transfer money abroad.43 In all these three scenarios, the
motivation for selling cryptos is driven by the premium44 achievable through the transaction. Second,
crypto assets allow exporters to retain their under-invoiced earnings overseas or sell them to a resident,
especially when opening foreign accounts is not feasible or the residents are concerned about foreign
surveillance by authorities. The first three scenarios show that outflows CFMs cannot effectively coexist
with domestic sellers of cryptocurrency assets, such as exchanges, within a country. The circumvention
executed through sellers of crypto assets abroad is harder to tackle as a country would need to ban the
purchases and transfers of crypto assets by and to its residents.
In practice, enhancing the supervision and regulation so that CFMs are not circumvented in the presence
of crypto assets is challenging, and authorities ought to adapt to their idiosyncratic institutional
arrangements and restrictions. An illustrative case study of how such challenges can be addressed is that
of Japan, where regulation on virtual assets was passed into law in 2017 introducing the registration to
competent authority when a service provider conducts a virtual asset transfer to and from a customer in
Japan. Further regulations were introduced in 2022 aiming at preventing the use of crypto assets to
circumvent sanctions (Sugiura, 2023). For this, the law included crypto assets and stablecoins in the
assets subject to capital transactions restrictions, including against North Korea. It also introduced “travel
rules” for transactions with virtual assets through exchanges in response to the FATF Recommendation
15 that requires all jurisdictions to implement the same. Such rules imply that, when an exchange
transfers cryptos in response to a customer´s request, it is required to notify the counterparty exchange to
whom it is being sent of the transaction information, including the names of the customer and the party to
whom it is being sent, akin to the requirements on banks. However, the number of jurisdictions that
implemented the “travel rule” is still limited (FSA, 2024), leaving a loophole in the virtual asset providers
registered in countries without “travel rules”. The presence of asymmetric regulation across countries
underscores the need for countries to work together on a scheme of international information exchange
for tracking CBCFs, preventing a subset of countries from becoming loopholes. Extending regulations
such as the “travel rules” to include information on residency would allow countries to monitor CBCFs and
mitigate their impact on outflow CFMS.
8. Concluding Remarks
Our work has aimed at contributing to a better understanding of the cross-border aspect of crypto flows
by shedding light on three aspects: their measurement, their drivers, and the related policy implications
that they entail. In the case study of Brazil, we document a steady increase in cross-border crypto
outflows since late 2017, comparable to 25 percent of gross portfolio outflows by the end of 2023. A
similar pattern is observed in our estimates of global cross-border crypto flows (G-CBCFs), with a steady
increase, reaching level between 3 percent and 22 percent of total capital flows, increasing up to 35
## 43 In countries without local exchanges, the sale would occur bilaterally in the country and the change of ownership would be done
through an exchange or P2P abroad.
44 The difference between the price of cryptos in the local market and abroad.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 35
percent if one adds more crypto assets, as alternative sources allow us to do. Further analysis indicates
that such flows are as volatile as regular portfolio and FDI flows, and they do not display any statistically
significant correlation with regular (net) capital flows, nor with remittances. They do, however, comove
with a vector of external variables. A SVAR model associates about a third of CBCFs’ variance to this
vector of external (push) factors, this is 3 to 6 times the share explained by this same vector when it
comes to regular financial flows’ variability such as portfolio and FDI, indicating that CBCFs are
considerably more sensitive to external factors than financial flows.
An important problem that our work highlights is that bilateral CBCFs may be very poorly estimated with
the ad hoc methods available, as the pseudonymity and opacity in crypto markets makes it difficult to
trace the residency of market participants, rendering the methodologies too imprecise to accurately pin
down the receiver and sender countries. This explains the substantial heterogeneity in the CBCFs
estimates across the various methodologies. Official estimates can be more reliable, yet they are quite
scarce, being the Brazilian case one notable exception. Global measures of CBCFs that sum across all
countries—thus not taking a stance of the particular sender/receiver country—may be less imprecise.
We think of three extensions of our work that would be worth exploring in the future. First, efforts by the
multilateral community to homogenize national accounting procedures across countries to measure
crypto flows across borders such as those from the G20’s Data Gap Initiatives in their Recommendation
11, will gradually allow researchers and practitioners to systematically analyze patterns in such flows. It
will thus be of interest to contrast our findings against this new and improved data as it becomes
available. Another development that ought to be studied is how CBCFs evolve amid increasing cross-
border flows through central bank digital currencies, as more central banks make their currencies digital
and allow for digital capital flows across borders. Lastly, further research ought to explore ways to
overcome the data challenges and test the validity of the various hypotheses behind the drivers of the
considerable increase in CBCF outflows in Brazil.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 36
Appendix
A.1. Data and sources
Worldwide crypto assets´ market capitalization series can be accessed through CoinGecko and
downloaded from Statista. The series comes in weekly market capitalization, so we average the weeks in
any given month to get the monthly market capitalization. These series are used in Figure 1.
Brazil CBC Outflows and CBC Inflows series are downloaded from the Special series of the CBB (under
the name of Reconciliation between merchandise source data and total goods on a balance of payments
basis). The import (export) of cryptoassets reflects a CBC Outflow (Inflow). CBC Net Outflows are
calculated subtracting CBC Inflows from CBC Outflows. These series are used in Figure 3, Figure 4,
Figure 5, Figure 6 (panel c), Figure 7, Figure 8, Figure 11, Figure 12, Figure A.1, Figure A.2, Figure A.5,
Table 1, Table 2, Table 3,Table A.2, Table A.3, Table A.4, Table A.5, Table A.6, Table A.7, Table A.8,
Table A.9, Table A.10 and Table A.11,.
Brazil Portfolio flows, FDI flows, current account flows, and Remittances series are downloaded from the
Time Series database of the CBB. PF Outflows, PF Inflows and PF Net Outflows have the codes 22908,
22907 and 22906, respectively. FDI Outflows, FDI Inflows and FDI Net Outflows have the codes 22867,
22866 and 22865, respectively. Imports, exports and net exports have the codes 22708, 22709 and
22710, respectively. Note that the Net Exports series includes the net exports of cryptoassets, therefore
we need to remove it by adding the CBC Net Outflows series. The remittances series has the code 22847.
These series are used in Figure 4, Figure 5, Figure 6 (panel c), Figure 7, Figure 11, Figure 12, Figure A.2,
Figure A.4, Figure A.5, Table 1, Table 2, Table 3, Table A.2, Table A.3, Table A.4, Table A.5, Table A.6,
Table A.7, Table A.8 and Table A.11.
Crystal Intelligence provides daily crypto transactions (but identified only by month and year) between
exchanges that are registered in a country (one or more countries) for the following cryptoassets: BTC,
BUSD, DAI, ETH, USDT, TUSD, USDC. Crystal Intelligence also provides the countries in which each
exchange is registered. To get the Brazilian cross-border outflows, we sum all the transactions (within a
month and across every crypto asset) that have an exchange registered only in Brazil as their recipient,
excluding those with an exchange registered only in Brazil as a sender. Similarly, to get the Brazilian
cross-border inflows, we sum all the transactions (within a month and across every crypto asset) that have
an exchange registered only in Brazil as their sender, excluding those with an exchange registered only in
Brazil as a recipient.45 On the other hand, to get the global CBCFs, we sum all the transactions (within a
month and across every crypto asset) and just exclude those that have the same country as their origin
and destination for only exchanges that are registered in only one country. Crystal series are used in
Figure 5, Figure 6, Figure 7, Figure 10, Figure 12, Figure A.2, Figure A.3, Figure A.4, Table A.1, Table A.9
and Table A.10.
## 45 The data reported in this document for Brazil does not exactly match the data reported in the publicly available report by Crystal
Intelligence (2021) “Geography of Bitcoin Transaction Dynamics”, as the data shared with the IMF does not include two exchanges
included in the report as they are now registered in Brazil and other countries (not only Brazil).IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 37
Chainalysis provides daily crypto transactions at country-level, distinguishing both the origin and the
destination country of the flow by geolocating the IP where the transaction is taking place. The raw data is
disaggregated across the 30 crypto assets that Chainalysis tracks. To get the Brazilian cross-border
outflows, we sum all the transactions (within a month and across every crypto asset) that has Brazil as
their destination, excluding those with Brazil as origin too. Similarly, to get the Brazilian cross-border
inflows, we sum all the transactions (within a month and across every crypto asset) that has Brazil as their
origin, excluding those with Brazil as destination too. On the other hand, to get the global CBCFs, we sum
all the transactions (within a month and across every crypto asset) and just exclude those that have the
same country as their origin and destination. Chainalysis series are used in Figure 5, Figure 6, Figure 7,
Figure 10, Figure 12, Figure A.2, Figure A.3, Figure A.4, Table A.1, Table A.9 and Table A.10.
IMF’s Financial Flows Analytics (FFA) dataset provides official yearly Balance of Payments data for 188
countries. The variables used are ipf (as Portfolio inflows), icapfl (as Total Capital Inflows) and gdp (as
Gross Domestic Product). To get the yearly global flows, we sum the series across the 188 countries. It is
worth noting that the last fully updated year (for every country) is 2021. These global flows are used in
Figure 9, Figure 10 and Figure A.3.
The data by Cerutti et al. (2024) provide daily Brazilian outflows and inflows from LocalBitcoins. The unit is
Brazilian real, so we use Datastream to exchange the Reals to US dollars. We sum every daily transaction
within a month to get the monthly flows. These series are used in Figure 8, Figure 12, Table A.9 and
Table A.10.
The SVAR model and Table 1 include five external series. The VIX index is the monthly, not seasonally
adjusted series, and can be accessed through FRED with the code VIXCLS. The price of Bitcoin is the
monthly, not seasonally adjusted series, and can be accessed through FRED with the code CBBTCUSD.
The S&P 500 index is the monthly, not seasonally adjusted series, and can be accessed through FRED
with the code SP500. The World Industrial Production (WIP) index, by Baumeister and Hamilton (2019),
can be accessed through the authors’ website. Finally, the advanced economies monetary stance (AEMS)
is a (GDP) weighted average of the monthly monetary policy rate of Japan, the US, the Euro Area and the
UK.
The SVAR model also includes three domestic variables for Brazil: a seasonally adjusted monthly
economic index activity (under the code 24364), the monetary policy rate (under the code 4189, this
series is accumulated in the month in annual terms) and the nominal exchange rate (under the code 1,
this series is the price of one US dollar). These series can be downloaded from Time Series database of
the CBB.
Brazil GDP data comes from the World Bank. We use the annual current USD series. It is used in Figure
A.1.
A.2. Companion EXCEL
There is a companion Excel file with the data for each figure.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 38
A.3. Additional Figures
Figure A.1: Brazil CBCFs Compared to GDP
Note: Shares are calculated as the sum of CBCFs in a year over the GDP of that year. Imports of crypto assets are referred to as
“crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: Central
Bank of Brazil and World Bank.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 39
Figure A.2: Brazil Cross-Border Stablecoins Flows
Panel a): CBC Outflows / PF Outflows Panel b): CBC Inflows / PF Inflows
Panel c): CBC Outflows and Inflows - Chainalysis Panel d): CBC Outflows and Inflows - Crystal
Panel e): Cumulative CBC Outflows / PF Outflows Panel f): Cumulative CBC Net Outflows / PF Net Outflows
Note: Figure replicates Figures 5, 6 and 7, displaying stablecoins flows for Crystal and Chainalysis separately. Cryptocurrencies and stablecoins
included in Crystal and Chainalysis series can be found in Table A.1. Panels a) and b) display 12-month moving average of the share of CBC
outflows (inflows) over PF outflows (inflows). Panels e) and f) display accumulated flows between June 2020 – December 2022. PF outflows (PF
inflows) refers to acquisition (sales) abroad of portfolio assets by Brazilian resident, while PF net outflows is PF outflows – PF inflows. Imports of
crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs.
Source: Central Bank of Brazil, Chainalysis, Crystal Intelligence and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 40
Figure A.3: Global Cross-Border Stablecoins Flows
Panel a): Global Cross-Border Stablecoins Flows
Panel b): Cumulative as Share of Total Capital Flows
Note: Figure replicates Figures 9 and 10, displaying stablecoins flows for Crystal and Chainalysis separately. Cryptocurrencies and stablecoins
included in Crystal and Chainalysis series can be found in Table A.1. Panel a) displays yearly crypto flows as the sum of every transaction across
assets and exchanges in a year from Crystal database, excluding transactions between exchanges registered in the same country. Yearly financial
flows or GDP are the sum across 188 countries in a year. The 2022 shares use 2021 data in the denominator (PF flows, Total Capital flows and
GDP), due to availability of data. Panel b) depicts G-CBCFs as share of capital flows in a 12-month period between April 2022 and March 2023 for
CBCFs, scaled by worldwide capital flows in 2021 (due to lack of data for 2022). G-CBCFs are obtained by summing CBCFs across countries,
excluding flows within the same country. Source: Central Bank of Brazil, Chainalysis, Crystal Intelligence and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 41
A.4. Additional Tables
Table A.1: Supplied Cryptocurrencies by Chainalysis and Crystal Intelligence
Source: Chainalysis and Crystal Intelligence.
Code Name Stablecoin Chainalysis Crystal
AAVE Aave Unbacked x
BCH Bitcoin Cash Stablecoin x x
BNT Bancor Network Unbacked x
BSC Binance Smart Chain Unbacked x
BTC Bitcoin Unbacked x x
BUSD Binance USD Stablecoin x x
COMP Compound Unbacked x
CRV Curve Unbacked x
DAI Dai Stablecoin x x
DOGE Doge Unbacked x
ETC Ethereum Classic Unbacked x
ETH Ethereum Unbacked x x
GUSD Gemini Dollar Stablecoin x
LRC Loopring Unbacked x
LTC Litecoin Unbacked x x
MKR MakerDAO Unbacked x
RENBTC renBTC Unbacked x
SUSHI SushiSwap Unbacked x
TRX TRON Unbacked x x
TUSD TrueUSD Stablecoin x x
UNI Uniswap Unbacked x
USDC USD Coin Stablecoin x x
USDP Pax Dollar Stablecoin x
USDT Tether Stablecoin x x
USDT_BTC Tether_BTC Stablecoin x
USDT_ETH Tether_ETH Stablecoin x
USDT_TRX Tether_TRX Stablecoin x
WBTC Wrapped Bitcoin Unbacked x
WETH Weth Unbacked x
XLM Stellar Unbacked x
XRP Ripple Unbacked x x
YFI Yeam Finance Unbacked x
ZRX 0x Protocol Unbacked xIMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 42
Table A.2: Correlation Coefficients for Domestic and Global Variables (extended sample)
Note: Period of analysis is January 2018 through March 2023, except for PF Net - Total Net, PF Net – VIX, Total Net – VIX, PF Net
– WIP, Total Net – WIP, PF Net – AEMS and Total Net – AEMS (January 1995-March 2023); PF Net – S&P, Total Net – S&P
(March 2013 – March 2023); and PF Net – PBTC, Total Net – PBTC (January 2015 – March 2023). Out (In) stands for outflows
(inflows); PF stands for portfolio flows; Total stands for total capital flows; PBTC is the price of Bitcoin; S&P is the Standard and
Poor´s 500 index; WIP is the world industrial production index by Baumeister and Hamilton; and AEMS is the advanced economies
monetary stance index. Correlations are computed on the variables in levels. Blue colors denote variables related to crypto flows.
Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto
inflows”, as an FX inflow occurs. Source: Central Bank of Brazil, FRED, Baumeister and Hamilton (2019) and authors’ calculations.
Table A.3: Variance Share Analysis on Outflows (extending foreign bloc sample)
Note: The table depicts the share of the variance of the CBC outflows (column 1), portfolio outflows (column 2), and portfolio and
FDI outflows (column 3) explained by global shocks 𝜇𝑡, and mediated by the push variables in 𝑋𝑡. Sample period is January 2015
to March 2023 for the foreign bloc, and January 2018 to March 2023 for the domestic bloc. The sequential section includes only the
first row variable in the domestic bloc, whereas the joint section includes also the monthly index of economic activity (IEA), the
nominal exchange rate, and the monetary policy rate. Whenever the bias is larger than the non-corrected share, the corrected share
shown in the table is 0. All variables are detrended. Imports of crypto assets are referred to as “crypto outflows”, as they imply an
outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: CBB, FRED, Baumeister and Hamilton
(2019) and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 43
Table A.4: Variance Share Analysis on Net Outflows (extending foreign bloc sample)
Note: The table depicts the share of the variance of the variable in the first row explained by global variables. Sample period is
January 2015 to March 2023 for the foreign bloc, and January 2018 to March 2023 for the domestic bloc. The sequential section
includes only the first row variable in the Domestic bloc, whereas the Joint section includes also IEA, NER and MPR. Whenever the
bias is larger than the non-corrected share, the corrected share shown in the table is 0. All variables are detrended. Imports of
crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX
inflow occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and authors’ calculations.
Table A.5: Variance Share Analysis on Outflows (excluding BTC price)
Note: The table depicts the share of the variance of the CBC outflows (column 1), portfolio outflows (column 2), and portfolio and
FDI outflows (column 3) explained by global shocks 𝜇𝑡, and mediated by the push variables in 𝑋𝑡. Sample period is January 2018
to March 2023. The sequential section includes only the first row variable in the domestic bloc, whereas the joint section includes
also the monthly index of economic activity (IEA), the nominal exchange rate, and the monetary policy rate. Whenever the bias is
larger than the non-corrected share, the corrected share shown in the table is 0. All variables are detrended. Imports of crypto
assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow
occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 44
Table A.6: Variance Share Analysis on Net Outflows (excluding BTC price)
Note: The table depicts the share of the variance of the variable in the first row explained by global variables. Sample period is
January 2018 to March 2023. The sequential section includes only the first row variable in the Domestic bloc, whereas the Joint
section includes also IEA, NER and MPR. Whenever the bias is larger than the non-corrected share, the corrected share shown in
the table is 0. All variables are detrended. Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of
FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and
authors’ calculations.
Table A.7: Variance Share Analysis on Outflows (extending foreign bloc sample, excluding BTC
price)
Note: The table depicts the share of the variance of the CBC outflows (column 1), portfolio outflows (column 2), and portfolio and
FDI outflows (column 3) explained by global shocks 𝜇𝑡, and mediated by the push variables in 𝑋𝑡. Sample period is January 2015
to March 2023 for the foreign bloc, and January 2018 to March 2023 for the domestic bloc. The sequential section includes only the
first row variable in the domestic bloc, whereas the joint section includes also the monthly index of economic activity (IEA), the
nominal exchange rate, and the monetary policy rate. Whenever the bias is larger than the non-corrected share, the corrected share
shown in the table is 0. All variables are detrended. Imports of crypto assets are referred to as “crypto outflows”, as they imply an
outflow of FX, and exports of crypto as “crypto inflows”, as an FX inflow occurs. Source: CBB, FRED, Baumeister and Hamilton
(2019) and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 45
Table A.8: Variance Share Analysis on Net Outflows (extending foreign bloc sample, excluding
BTC price)
Note: The table depicts the share of the variance of the variable in the first row explained by global variables. Sample period is
January 2015 to March 2023 for the foreign bloc, and January 2018 to March 2023 for the domestic bloc. The sequential section
includes only the first row variable in the Domestic bloc, whereas the Joint section includes also IEA, NER and MPR. Whenever the
bias is larger than the non-corrected share, the corrected share shown in the table is 0. All variables are detrended. Imports of
crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX
inflow occurs. Source: CBB, FRED, Baumeister and Hamilton (2019) and authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 46
A.5. Remittances
To assess any systematic relationship between remittances, CBC Outflows and CBC Inflows, we perform
a formal regression analysis using several lags of remittances to explain CBC Outflows and Inflows (from
different sources).
We regress CBCF outflows (𝐶𝐵𝐶𝑂𝑢𝑡𝑡) against current values and four lags of the flow of remittances
(𝑅𝑒𝑚𝑡), in addition to a constant and a trend:
𝐶𝐵𝐶𝑂𝑢𝑡𝑡 = α + γ𝑡 + β0𝑅𝑒𝑚𝑡 + β1𝑅𝑒𝑚𝑡−1 + β2𝑅𝑒𝑚𝑡−2 + β3𝑅𝑒𝑚𝑡−3 + β4𝑅𝑒𝑚𝑡−4 + ϵ𝑡
Table A.9: Remittances regression results (CBC Outflows)
Note: Standard errors in parenthesis. One star (*) means 10 percent statistical significance, two stars (**) means 5 percent and
three stars (***) means 1 percent. The dependent variable is CBC Outflows in every regression. Different sources of the series are
used in every specification. Sample periods are May 2016—October 2023 for CBB, May 2016—March 2023 for Crystal, May 2020—
December 2022 for Chainalysis and August 2017—February 2023 for LocalBitcoins. Imports of crypto assets are referred to as
“crypto outflows”, as they imply an outflow of FX.
Similarly, we regress CBCF inflows (𝐶𝐵𝐶𝐼𝑛𝑡) against current values and four lags of the flow of
remittances (𝑅𝑒𝑚𝑡), in addition to a constant and a trend. We also include a dummy for August 2023 due
to the unusual increase observed in that year (see Figure 12, panel a):
𝐶𝐵𝐶𝐼𝑛𝑡 = α + γ𝑡 + β0𝑅𝑒𝑚𝑡 + β1𝑅𝑒𝑚𝑡−1 + β2𝑅𝑒𝑚𝑡−2 + β3𝑅𝑒𝑚𝑡−3 + β4𝑅𝑒𝑚𝑡−4 + δD[Aug − 23] + ϵ𝑡IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 47
Table A.10: Remittances regression results (CBC Inflows)
Note: Standard errors in parenthesis. One star (*) means 10 percent statistical significance, two stars (**) means 5 percent and
three stars (***) means 1 percent. The dependent variable is CBC Inflows in every regression. Different sources of the series are
used in every specification. Sample periods are May 2016—October 2023 for CBB, May 2016—March 2023 for Crystal, May 2020—
December 2022 for Chainalysis and August 2017—February 2023 for LocalBitcoins. A dummy for August 2023 is included due to an
outlier. Exports of crypto assets are referred to as “crypto inflows”, as they imply an inflow of FX.
Figure A.4: Remittances and CBC Inflows from other methodologies
Note: Exports of crypto assets are referred as “crypto inflows”, as they imply an inflow of FX. LocalBitcoins data from Cerutti et.al
(2024). Cryptocurrencies included in Crystal and Chainalysis series can be found in Table A.1. Data on remittances into Brazil are
proxied as personal transfers—credits. Source: Central Bank of Brazil, Chainalysis, Crystal Intelligence, Cerutti et.al (2024) and
authors’ calculations.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 48
A.6. Current account
This section explores the relationship between current account transactions (imports and exports of
goods) and CBC Outflows and Inflows (from Central Bank of Brazil).
Table A.11: Correlation Coefficients for Current Account Transactions
Note: Period of analysis is January 2018 through October 2023, Blue colors denote variables related to crypto flows. Imports of
crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto inflows”, as an FX
inflow occurs. Source: Central Bank of Brazil.
Figure A.5: Current Account Flows and CBCFs
Note: Imports of crypto assets are referred to as “crypto outflows”, as they imply an outflow of FX, and exports of crypto as “crypto
inflows”, as an FX inflow occurs. Data on current account flows are exports and imports of goods. Source: Central Bank of Brazil.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 49
A.7. SVAR details
This section describes the small-sample bias correction Monte Carlo procedure for the SVAR. It follows
Fernandez et al. (2017).
Given the foreign and domestic blocs:
𝑋𝑡 = 𝐴 𝑋𝑡−1 + 𝜇𝑡
𝑌𝑡 = 𝐵𝑋𝑡 + 𝐶𝑌𝑡−1 + 𝐷𝑋𝑡−1 + 𝜀𝑡
We define:
𝐹 = [
𝐴 ∅
𝐷𝐴 + 𝐵 𝐶
], 𝐺 = [
𝐼 ∅
𝐷 𝐼
], 𝐸 (
𝜇𝑡
𝜀𝑡
) = Σ = [
Σ𝜇 ∅
∅ Σ𝜀
]
So the model can be expressed as:
[
𝑋𝑡
𝑌𝑡
] = 𝐹 [
𝑋𝑡−1
𝑌𝑡−1
] + 𝐺 [
𝜇𝑡
𝜀𝑡
]
The procedure consists of the following steps:
1. Let 𝐹 ̂, 𝐺 ̂, and Σ ̂ denote the estimates of 𝐹, 𝐺, and Σ obtained using actual data. Let 𝜎 ̂ denote the
associated estimate of the share of the variance of 𝑌𝑡 explained by μ𝑡. Use 𝐹 ̂, 𝐺 ̂, and Σ ̂ to
generate artificial time series for 𝑌𝑡 and 𝑋𝑡 of a desired length from the SVAR model (we use 250
months).
2. Let 𝑇 denote the sample size, which is 63 in our sample between January 2018 and March 2023.
Then use the last 𝑇 observations of the artificial time series (of length 250 months) to re estimate
both the foreign and domestic bloc of the SVAR. This is, re estimate the matrices 𝐴, 𝐵, 𝐶, 𝐷, Σ𝜇
and Σ𝜀.
3. Steps 1 and 2 yield an estimate of the matrices 𝐹, 𝐺, and Σ from the simulated data. Use this
estimate to compute the share of the variance of 𝑌𝑡 explained by 𝜇𝑡 shocks, which is denoted by
𝜎
4. Repeat steps 1–3 𝑁 times. We set 𝑁 = 1000. Then compute averages of the resulting estimate
of 𝜎 and denote it by 𝜎 ̅.
5. Define the small-sample bias as 𝜎 ̅ − 𝜎 ̂. The corrected estimate of the share of the variance of 𝑌𝑡
explained by 𝜇𝑡 is then given by 2𝜎 ̂ − 𝜎 ̅.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 50
References
Alnasaa, Marwa, Nikolay Gueorguiev, Jiro Honda, Eslem Imamoglu, Paolo Mauro, Keyra Primus, and
Dmitriy Rozhkov. 2022. ‘Crypto-Assets, Corruption, and Capital Controls: Cross-Country
Correlations’. Economics Letters 215 (06): 110492.
Bao, Hong, Jianjun Li, Yuchao Peng, and Qiang Qu. 2022. ‘Can Bitcoin Help Money Cross the Border:
International Evidence’. Finance Research Letters 49 (10): 103127.
Baumeister, Christiane and James D. Hamilton. 2019. ‘Structural Interpretation of Vector Autoregressions
with Incomplete Identification: Revisiting the Role of Oil Supply and Demand Shocks’. American
Economic Review, 109(5).
BIS. 2023. ‘Project Atlas-Mapping the World of Decentralised Finance’. BIS Innovation Hub.
Catalini, C., and J. S. Gans. 2016. Some Simple Economics of the Blockchain. NBER WP No. 22952.
Central Bank of Brazil. 2023. ‘Measuring Crypto Assets Transactions in the Brazilian External Sector
Statistics’. Mimeo.
Cerutti, Eugenio, Jiaqian Chen, and Martina Hengge. 2024. ‘A Primer on Bitcoin Capital Flows:
Measurement and Drivers’. IMF Working Paper No. 83.
Chainalysis. 2022. ‘The 2022 Geography of Cryptocurrency Report’. www.chainalysis.com.
Chen, Jiakai, and Asani Sarkar. 2022. ‘Slowed-Down Capital: Using Bitcoin to Avoid Capital Controls’.
Cheng, Jiameng, and Yanke Dai. 2020. ‘Is Bitcoin a Channel of Capital Inflow? Evidence from Carry Trade
Activity’. International Review of Economics & Finance 66 (03): 261–78.
Cong, Lin W., Xi Li, Ke Tang and Yang Yang. 2023. ‘Wash Trading in Centralised Crypto Exchanges: The
Need for Transparency and Accountability’. Voxeu column.
Crystal Intelligence. 2021. ‘Geography of Bitcoin Transaction Dynamics 2014—2021’.
www.CrystalIntelligence.com.
Fernández, Andrés, Stephanie Schmitt-Grohé, and Martín Uribe. 2017. ‘World shocks, world prices, and
business cycles: An empirical investigation’. Journal of International Economics.
Fujiwara, Yoshi, and Rubaiyat Islam. 2021. ‘Bitcoin’s Crypto Flow Network’. In Proceedings of Blockchain
in Kyoto 2021 (BCK21). Kyoto, Japan (Hybrid): Journal of the Physical Society of Japan.
Graf Von Luckner, Clemens, Carmen M. Reinhart, and Kenneth Rogoff. 2023. ‘Decrypting New Age
International Capital Flows’. Journal of Monetary Economics 138 (September): 104–22.
Graf Von Luckner, Clemens, Robin Koepke, Silvia Sgherri. 2024. ‘Crypto as a Marketplace for Capital
Flight’. IMF Working Paper No. 133.
Hacibedel, Burcu, and Hector Perez-Saiz. 2023. ‘Assessing Macrofinancial Risks from Crypto Assets’. IMF
WP/23/214.IMF WORKING PAPERS
On Cross-Border Crypto Flows: Measurements, Drivers, and Policy Implications
INTERNATIONAL MONETARY FUND 51
He, Dong, Annamaria Kokenyne Ivanics, Xavier Lavayssiere, Inutu Lukonga, Nadine Schwarz, Nobuyasu
Sugimoto, and Jenne Verrier. 2022. ‘Capital Flow Management Measures in the Digital Age:
Challenges of Crypto Assets’. IMF Fintech Notes.
Hu, Maggie, Adrian D. Lee, and Talis J. Putnins. 2022. ‘Evading Capital Controls via Cryptocurrencies:
Evidence from the Blockchain’. SSRN Electronic Journal.
Igor, M. and Scholar, A. 2022. ‘Blockchain analysis of the bitcoin market’. MIT memo.
IMF. 2012. ‘The Liberalization and Management of Capital Flows: An Institutional View’. Policy Papers.
IMF. 2019. ‘Treatment of Crypto Assets in Macroeconomic Statistics’. Prepared by M.Dinenzon, V. Josyula,
J.C. Moreno-Ramirez, R. Dippelsman, and T. Razin, T, IMF Statistics Department.
IMF. 2022a. ‘Review of The Institutional View on The Liberalization and Management of Capital Flows’.
Policy Paper No. 2022/008.
IMF. 2022b. ‘Capital Flow Management Measures in the Digital Age: Challenges of Crypto Assets’. FinTech
Notes No. 2022/005.
IMF. 2023. ‘Elements of Effective Policies for Crypto Assets’. Policy Papers 2023 (004): 1.
Ju, Lan, Timothy (Jun) Lu, and Zhiyong Tu. 2016. ‘Capital Flight and Bitcoin Regulation’. International
Review of Finance 16 (3): 445–55.
Just, M., and Echaust, K. 2024. ‘Cryptocurrencies Against Stock Market Risk: New Insights into Hedging
Effectiveness’. Research in International Business and Finance, 67: 445–55.
Koepke, R. (2018). ‘What Drives Capital Flows to Emerging Markets? A Survey’. Journal of Economic
Surveys, 33(2): 516-540.
Liang, J., Chen, W., and Zeng, D. (2019). ‘Targeted addresses identification for bitcoin with network
representation learning’. 2019 IEEE International Conference on Intelligence and Security Informatics
(ISI).
Nicoli, M., and Ahmed, U. (2019). ‘How Digital Remittances Can Help Drive Sustainable Development’.
April 15, 2019. Word Bank Blogs.
Pennec, Guénolé Le, Ingo Fiedler, and Lennart Ante. 2021. ‘Wash Trading at Cryptocurrency Exchanges’.
Finance Research Letters 43 (11): 101982.
Sugiura, Tatsuya. 2023. ‘Threats of PF through Virtual Assets and Japan’s Countermeasures’. Mimeo.