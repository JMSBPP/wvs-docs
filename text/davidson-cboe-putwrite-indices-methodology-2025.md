---
sha256: 3ba819cecfb7d3ed5757e3088c2be8c73c4f986c4b29dfe89302243de15c203d
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 34666
---
Cboe PutWrite Indices
METHODOLOGY
© Cboe Global Indices, LLC. All rights reserved.Page 1
Cboe Global Indices CONFIDENTIAL
Contents
1 Introduction..................................................................................................................................................2
1.1 Index Objective.....................................................................................................................................2
1.2 Supporting Documentation ................................................................................................................2
2 Index Construction.......................................................................................................................................3
2.1 Index Constituents...............................................................................................................................3
2.2 Index Rebalance...................................................................................................................................3
2.2.1. RebalanceDetailsPUTY & PUTR...............................................................................................4
2.2.2. RebalanceDetailsPTLT.............................................................................................................4
2.2.3. RebalanceDetailsWPTR & WPUT.............................................................................................5
2.3 Options Pricing.....................................................................................................................................5
3 Index Calculations........................................................................................................................................6
3.1 Non-RollDate Calculations .................................................................................................................6
3.1.1. Non-RollDate Calculations PUTR, PUTY,WPTR&WPUT .......................................................6
3.1.2. Non-RollDate Calculations PTLT..............................................................................................7
3.2 RollDate Calculations..........................................................................................................................7
3.2.1. RollDateCalculations PUTR &PUTY........................................................................................7
3.2.2. RollDateCalculations PTLT......................................................................................................8
3.2.3. RollDateCalculations WPTR&WPUT......................................................................................9
3.3 Intraday Calculations.........................................................................................................................10
4 Calculation andDissemination.................................................................................................................10
5 Index Information ......................................................................................................................................11
6 Appendix 1 -Changes.................................................................................................................................11
7 Appendix 2 -Document Information........................................................................................................11Page 2
Cboe Global Indices CONFIDENTIAL
## 1 Introduction
This document provides a transparent and easily accessible view of the methodology used to calculate select
Cboe PutWrite Indices, referred to in this document as "the Indices”.
1.1 IndexObjective
The index objectives of the Indices covered by this document are as follows:
• The Cboe Russell 2000 PutWrite Index (PUTR) is designed to track the performance of a hypothetical
passiveinvestmentstrategythatcollectsoptionpremiumsfromwritinganAt-the-Money(ATM)RUTPut
optiononamonthlybasisandholdsaTreasurybillaccountinvestedinone-monthTreasurybillstocover
the liability from the short RUT Put option position.
• The Cboe S&P 500 2% OTM PutWrite Index (PUTY) is designed to measure and track the performance
of a hypothetical passive investment strategy that collects option contract premiums from writing a 2%
Out-of-the-Money(“OTM”)SPXputoption on amonthlybasisandholdsa Treasurybillaccountinvested
in one-month T-bills to cover any liability from the short SPX Put option position.
• The Cboe 20+ Year Treasury Bond PutWrite Index (PTLT) is designed to track the performance of a
hypothetical passive investment strategy that collects option premiums from writing an At-the-Money
(ATM) TLT Put option on a monthly basis and holds a Treasury bill account invested in one-month
Treasury bills to cover the liability from the short TLT Put option position.
• The Cboe Russell 2000 One-Week PutWrite Index (WPTR) is designed to track the performance of a
hypothetical passive investment strategy that collects option premiums from writing an At-the-Money
(ATM) RUT Put option on a weekly basis and holds a Treasury bill account invested in one-month
Treasury bills to cover the liability from the short RUT Put option position.
• The Cboe S&P 500 One-Week PutWrite Index (WPUT) is designed to track the performance of a
hypothetical passive investment strategy that collects option premiums from writing an At-the-Money
(ATM)SPXPutoptiononaweeklybasisandholdsaTreasurybillaccountinvestedinone-monthTreasury
bills to cover the liability from the short SPX Put option position.
1.2 SupportingDocumentation
This Methodology should be read in conjunction with the following document:
Cboe_Index_Policies_PracticesPage 3
Cboe Global Indices CONFIDENTIAL
2 IndexConstruction
2.1 IndexConstituents
The Indices consist of the components as listed below.
Index Type Position Ticker Underlying Name Expiration Option Type
Cboe Russell 2000
PutWrite Index (PUTR)
T-bills Long n/a n/a 4 weeks n/a
Option Short RUT Russell 2000 1 month Put
Cboe S&P 500 2%
OTM PutWrite Index
(PUTY)
T-bills Long n/a n/a 4 weeks n/a
Option Short SPX S&P 500 1 month Put
Cboe 20+ Year
Treasury Bond
PutWrite Index (PTLT)
T-bills Long n/a n/a 4 weeks n/a
Option Short TLT iShares 20+ Year
Treasury Bond ETF
1 month Put
Cboe Russell 2000
One-Week PutWrite
Index (WPTR)
T-bills Long n/a n/a 4 weeks n/a
Option Short RUT Russell 2000 1 week Put
Cboe S&P 500 One-
Week PutWrite Index
(WPUT)
T-bills Long n/a n/a 4 weeks n/a
Option Short SPX S&P 500 1 week Put
2.2 IndexRebalance
Rebalances are performed according to the following table.
Index Name
Index
Ticker
Roll Date
Strike
Determination
Strike Price Selection (K)
Cboe Russell 2000
PutWrite Index
PUTR
Roll date is the third Friday of
each month. Should the third
Friday fall on an exchange
holiday, the roll date is the
preceding business day.
Roll Date
The first available strike below
the last disseminated value of
the Russell 2000 Index before
11:00 a.m. ET.
Cboe S&P 500 2%
OTM PutWrite
Index
PUTY
Roll date is the third Friday of
each month. Should the third
Friday fall on an exchange
holiday, the roll date is the
preceding business day.
Roll Date
The first available strike below
the 98% of the last
disseminated value of the S&P
## 500 Index before 11:00 a.m. ET.
Cboe 20+ Year
Treasury Bond
PutWrite Index
PTLT
Roll date is the third Friday of
each month. Should the third
Friday fall on an exchange
holiday, the roll date is the
preceding business day.
Roll Date
The first available strike lower
than or equal to the last
disseminated value of the TLT
ETF before 4:00 p.m. ET.
Cboe Russell 2000
One-Week
PutWrite Index
WPTR
Roll date is every Friday. Should
an exchange holiday fall on a
Friday, the roll date is the
preceding business day.
Roll Date
The first available RUT Put
option strike below the Special
Opening Quotation (SOQ) of
the Russell 2000 Index.Page 4
Cboe Global Indices CONFIDENTIAL
Cboe S&P 500
One-Week
PutWrite Index
WPUT
Roll date is every Friday. Should
an exchange holiday fall on a
Friday, the roll date is the
preceding business day.
Roll Date
The first available SPX Put
option strike below the Special
Opening Quotation (SOQ) of
the S&P 500 Index (SPX Index)
2.2.1.Rebalance DetailsPUTY&PUTR
On the initial roll date of the Indices, a monthly put option is written. At the same time, a notional amount
equal to the strike (K) of the put option is invested in a treasury bill account to cover the liability of the short
put option position.
The Indices require that the put options in the hypothetical portfolio be held to maturity. The Special Opening
Quotation (“SOQ”) of the underlying index is used as the final settlement price of the index put options. The
SOQ is a special calculation of the underlying index that is compiled from the opening prices of component
stocks underlying the index. The SOQ calculation is performed when all the constituents underlying the equity
index have opened for trading and is usually determined before 11:00 a.m. ET. The final settlement price of the
put option at maturity is the greater of 0 and the strike price of the expiring put option minus the SOQ.
Subsequent to the settlement of the expiring put option, a new put option expiring in the next month is then
deemed written, or sold, a transaction commonly referred to as a “roll.” The option is selected in line with the
rules described in inthetable above. Simultaneously, a notionalamountequal to the strike (K)oftheput option
is invested in a Treasury bill account. The Treasury bill account will accumulate interest at the 4-week Bank
discount rate.
Once the strike price of the new put option has been identified, the new put option is deemed sold at a price
equaltothevolume-weightedaverageofthetradedprices(“VWAP”)ofthenew putoptionbetween11:30a.m.
and 12:00 p.m. ET. Cboe Global Indices uses the transaction prices and trade codes from the Options Price
Reporting Authority (OPRA) feed to calculate the VWAP. The VWAP is calculated in two steps:
1. Orders categorized by OPRA as uppercase A – H and lowercase f – t in the new Put option that occur
during the VWAP period are excluded to remove late, cancel, and spread orders.
2. Theweightedaveragefor allremainingtransactionpricesofthenewPutoptionduringtheVWAPperiod
iscalculated,withweightsequaltothefractionoftotalremainingvolumetransactedateachpriceduring
this period. If no transactions occur in the new put option during the VWAP period, then the new put
option is deemed sold at the last bid price reported before the end of the VWAP period.
2.2.2.Rebalance DetailsPTLT
On January 21, 2005, the initial rolldate of the PTLT Index, an ATM monthly TLT Put option iswritten. The strike
price of the ATM TLT Put option is the first available strike lower than or equal to the last disseminated value of
the TLT ETF before 4:00 p.m. ET. The premium collected from writing the TLT option is the last NBBO bid price
of the day on the written option. Typically, on the third Friday (Roll Day) of every month since the initial roll
date, the TLT Put option settles and subsequently, a new monthly ATM TLT Put is written. Following the same
rule as the initial roll date, the strike price of the ATM TLT Put option is the first available strike lower than or
equaltothe last disseminated valueoftheTLT ETF before 4:00p.m.ET.Thepremium collectedfrom writingthe
TLT Put option is the last NBBO bid price of the day on the written option. The Treasury bill account will
accumulate interest at the 4-week Bank discount rate.Page 5
Cboe Global Indices CONFIDENTIAL
2.2.3.Rebalance DetailsWPTR &WPUT
On the initial roll date of the Indices, an ATM one week put option is written after the market opens (9:30 a.m.
ET). The strike is selected in line with the rules described in the table above. The first bid quote after the market
opens is the option premium collected from the written put option. At the same time, a notional amount equal
to the strike (K) of the put option is invested in a Treasury bill account to cover the liability of the short put
optionposition.Theseactionsarerepeatedoneveryrolldatesincetheinitialrolldate.TheTreasurybillaccount
will accumulate interest at the 4-week Bank discount rate.
As the expiring put option can be either an AM-settlement or PM-settlement on the Roll Date, thiswould affect
the settlement procedure of the expiring put option. If the expiring put option is AM-settlement on the Roll
Date, the expiring put option settles against the SOQ. If the expiring put option is PM-settlement on the Roll
Date, the expiring put option is purchased back at the last ask price of the put option before 4:00 p.m. ET. For
AM-settlement,thefirstavailableputoptionstrikebelowtheSOQisselected,andtheoptionpremiumcollected
is the first bid quote of the put option after 9:30 a.m. ET. For PM-settlement, the first available put option strike
below the last disseminated value of the underlying index before 4:00 p.m. ET is selected, and the option
premium collected is the last bid quote of the put option before 4:00 p.m. ET. In either case, a Treasury bill
account with initial cash equal to the strike (K) of the put option is set up simultaneously to cover the potential
liability of the short put option position.
2.3 OptionsPricing
The put option quotes are sourced from one or multiple Cboe Options Exchanges, via the Options Price
Reporting Authority (OPRA) feed, as per the table below. For Indices where option prices are sourced from
multiple Cboe Options Exchanges, the Best Bid and Offer prices are used.
Index Name Index Ticker Cboe Options Exchange Cboe C2 Options Exchange
Cboe Russell 2000 PutWrite Index PUTR X
Cboe S&P 500 2% OTM PutWrite Index PUTY X
Cboe 20+ Year Treasury Bond PutWrite Index PTLT X X
Cboe Russell 2000 One-Week PutWrite Index WPTR X
Cboe S&P 500 One-Week PutWrite Index WPUT XPage 6
Cboe Global Indices CONFIDENTIAL
3 IndexCalculations
The Indices covered by this document, apart from PTLT, are calculated according to the following formula:
𝐼𝑛𝑑𝑒𝑥𝑡 = 𝐼𝑛𝑑𝑒𝑥𝑡−1 ∗ (1 + 𝑅𝑡)
where:
• 𝐼𝑛𝑑𝑒𝑥𝑡 is the level of the Index;
• 𝐼𝑛𝑑𝑒𝑥𝑡−1 is the level of the Index on the previous day; and
• 𝑅𝑡 is the return of the Index.
## 3.1 Non-Roll Date Calculations
3.1.1. Non-Roll Date CalculationsPUTR,PUTY,WPTR &WPUT
The non-roll date return of the index is calculated as:
(1 + 𝑅𝑡) =
(𝑀𝑡−𝑃𝑢𝑡𝑡)
(𝑀𝑡−1−𝑃𝑢𝑡𝑡−1)
𝑅𝑓 =
(
1
1 −
28
360
∗ USB4WTA
)
𝑡−(𝑡−1)
28
𝑀𝑡 = (1 + 𝑅𝑓) ∗ 𝑀𝑡−1
where:
• 𝑀𝑡 and 𝑀𝑡−1 are the values of the Treasury bill account on day t and t-1, respectively;
• 𝑅𝑓 is the 4-Week Bank discount rate de-annualized to the daily rate. The 4-week Bank discount rate is
obtained from the website of the U.S. Department of the Treasury;
• 𝑃𝑢𝑡𝑡 is the average of the last bid-ask quote of the Put option before 4:00 p.m. ET on date t for the
closing value. For intraday calculations, the average of the current reported bid and ask prices of the
put option is used; and
• 𝑃𝑢𝑡𝑡−1 is the average of the last bid-ask quote of the Put option before 4:00 p.m. ET on the previous
day.Page 7
Cboe Global Indices CONFIDENTIAL
3.1.2.Non-Roll Date CalculationsPTLT
The non-roll date return of the index is calculated as:
𝐼𝑛𝑑𝑒𝑥𝑡 = 𝑀𝑡 − 𝑁 ∗ 𝑃𝑡
𝑀𝑡 = (1 + 𝑅𝑓) ∗ 𝑀𝑡−1
𝑅𝑓 =
(
1
1 −
28
360
∗ USB4WTA
)
𝑡−(𝑡−1)
28
where:
• 𝑀𝑡 and 𝑀𝑡−1are the values of the Treasury bill account on day t and t-1, respectively;
• 𝑅𝑓 is the 4-Week Bank discount rate de-annualized to the daily rate. The 4-week Bank discount rate is
obtained from the website of the U.S. Department of the Treasury;
• N is the unit of TLT Put options sold on the previous roll date; and
• 𝑃𝑡 is the average of the last NBBO quote of the TLT Put option before 4:00 pm ET for the closing value.
For intraday calculations, the average of the current reported NBBO prices of the put option is used.
## 3.2 Roll Date Calculations
3.2.1. RollDateCalculationsPUTR &PUTY
The roll date return of the index is calculated in two steps using the following formulas.
The following formula is used to calculate the return from the previous day’s market close to present day’s
morning settlement:
(1 + 𝑅1) =
(𝑀_𝑜𝑙𝑑𝑡−1−𝑃𝑢𝑡_𝑜𝑙𝑑𝑠𝑒𝑡𝑡𝑙𝑒)
(𝑀_𝑜𝑙𝑑𝑡−1−𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1)
where:
• 𝑀_𝑜𝑙𝑑𝑡−1 is the value of the Treasury bill account on the previous day;
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑠𝑒𝑡𝑡𝑙𝑒 = 𝑀𝑎𝑥(0,𝐾𝑜𝑙𝑑 − 𝑆𝑂𝑄𝑡) is the settlement value of the expiring Put option, where 𝐾𝑜𝑙𝑑
the strike of the expiring option; and
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1 is the average of the last bid-ask quote of the expiring Put option before 4:00 p.m. ET on
the previous day.Page 8
Cboe Global Indices CONFIDENTIAL
The following formula is used to calculate the return from the moment the new Put option is deemed sold to
market close:
(1 + 𝑅2) =
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑡)
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑣𝑤𝑎𝑝)
where:
• 𝑀_𝑛𝑒𝑤𝑡 is the cash allocated to cover the potential loss of the new Put option on the roll day;
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑡 is the average of the last bid-ask quote of the new Put option before 4:00 p.m. ET; and
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑣𝑤𝑎𝑝 is the volume weighted average price (“VWAP”) of the new Put option.
Note: interest is not accumulated in the Treasury bill account on the roll day.
The product of the two parts is the total return of the roll day:
(1 + 𝑅𝑡) = (1 + 𝑅1) × (1 + 𝑅2)
3.2.2. RollDateCalculations PTLT
𝐼𝑛𝑑𝑒𝑥𝑡 = 𝑀𝑡 − 𝑁𝑛𝑒𝑤 ∗ 𝑃_𝑛𝑒𝑤𝑡
𝑀𝑡 = 𝑅𝑓 ∗ 𝑀𝑡−1 − 𝑁𝑜𝑙𝑑 ∗ 𝑃𝑠𝑒𝑡𝑡𝑙𝑒+ 𝑁𝑛𝑒𝑤 ∗ 𝑃_𝑛𝑒𝑤𝑏𝑖𝑑
𝑁𝑛𝑒𝑤 =
(𝐼𝑛𝑑𝑒𝑥𝑡−1)
(𝑆𝑡−1)
where:
• P_newt is the average of the last NBBO quote of the new Put option before 4:00 p.m. ET;
• 𝑁𝑛𝑒𝑤 is the unit of TLT Put options sold on the roll date;
• 𝑁𝑜𝑙𝑑 is the unit of the expiring TLT Put option;
• Psettle = Max (0, K_old - St) is the final settlement price of the expiring Put option, where
K_old is the strike of the expiring Put option;
• 𝑃_𝑛𝑒𝑤𝑏𝑖𝑑 is the last NBBO bid quote of the new Put option before 4:00 p.m.ET; and
• 𝑆𝑡 𝑎𝑛𝑑 𝑆𝑡−1 is the closing price of TLT on day t and t-1, respectively.Page 9
Cboe Global Indices CONFIDENTIAL
3.2.3. RollDateCalculations WPTR &WPUT
AM-settlement roll days
For AM-settlement roll days, the following formula is used to calculate the return from the previous day’s
market close to present day’s morning settlement:
(1 + 𝑅1) =
(𝑀𝑡−𝑃𝑢𝑡_𝑜𝑙𝑑𝑠𝑒𝑡𝑡𝑙𝑒)
(𝑀𝑡−1 −𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1)
where:
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑠𝑒𝑡𝑡𝑙𝑒 = 𝑀𝑎𝑥(0,𝐾𝑜𝑙𝑑 − 𝑆𝑂𝑄𝑡) is the settlement value of the expiring put option;
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1 is the average of the last bid-ask quote of the expiring put option before 4:00 p.m. ET on
the previous day.
The following formula is used to calculate the return from the moment the new put option is deemed sold to
market close:
(1 + 𝑅2) =
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑡)
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑏𝑖𝑑 930)
where:
• 𝑀_𝑛𝑒𝑤𝑡 is the cash allocated to cover the potential loss of the new put option on the roll day;
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑡 is the average of the last bid-ask quote of the new put option before 4:00 p.m. ET; and
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑏𝑖𝑑 930 is the first bid quote of the new put option after 9:30 a.m. ET.
Note: interest is not accumulated in the Treasury bill account on roll day.
PM-settlement roll days
For PM-settlement roll days, the following formula is used to calculate the return from the previous day’s
market close to 4:00 p.m. ET:
(1 + 𝑅1) =
(𝑀𝑡−1 −𝑃𝑢𝑡_𝑜𝑙𝑑𝑎𝑠𝑘 4𝑝𝑚)
(𝑀𝑡−1−𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1)
where:
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑎𝑠𝑘 4𝑝𝑚 is the last ask quote of the expiring put option before 4:00 p.m. ET;
• 𝑃𝑢𝑡_𝑜𝑙𝑑𝑡−1 is the average of the last bid-ask quote of the expiring put option before 4:00 p.m. ET on
the previous day.Page 10
Cboe Global Indices CONFIDENTIAL
The following formula is used to calculate the return from 4:00 p.m. ET to market close (4:15 p.m. ET):
(1 + 𝑅2) =
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑡)
(𝑀_𝑛𝑒𝑤𝑡−𝑃𝑢𝑡_𝑛𝑒𝑤𝑏𝑖𝑑 4𝑝𝑚)
where:
• 𝑀_𝑛𝑒𝑤𝑡 is the cash allocated to cover the potential loss of the new put option on the roll day;
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑡 is the average of the last bid-ask quote of the new put option before 4:00 p.m. ET; and
• 𝑃𝑢𝑡_𝑛𝑒𝑤𝑏𝑖𝑑 4𝑝𝑚 is the last bid quote of the new put option before 4:00 p.m. ET.
Note: interest is not accumulated in the Treasury bill account on roll day.
The product of the two parts is the total return of the Roll Day:
(1 + Rt) = (1 + R1) * (1 + R2)
3.3 IntradayCalculations
On non-roll dates, the intraday calculations follow the non-roll date calculations.
Onrolldates,thePUTRandPUTYIndiceswillnotbedisseminatedintradayuntilaftereachindices’VWAPperiod
has ended and the SOQ value has been made available. On roll dates, PTLT will not be disseminated intraday.
On a.m. settlement roll days, the WPUT and WPTR indices will not be disseminated intraday until the SOQ is
determined.
## 4 Calculation and Dissemination
The Indices are calculated and disseminated as follows on each Business Day. A Business Day is defined as a day
whentheCboeOptionsExchangesareopenfortheCboeRegularTradingHours(RTH)session.TheIndicesfollow
the Cboe Options Exchange holiday schedule.
Index Name
Index
Ticker
Dissemination Frequency Dissemination Hours
Cboe Russell 2000 PutWrite Index PUTR 15 seconds 9:30 a.m. – 4:00 p.m. ET
Cboe S&P 500 2% OTM PutWrite Index PUTY 15 seconds 9:30 a.m. – 4:00 p.m. ET
Cboe 20+ Year Treasury Bond PutWrite Index PTLT 15 seconds 9:30 a.m. – 4:00 p.m. ET
Cboe Russell 2000 One-Week PutWrite Index WPTR 15 seconds 9:30 a.m. – 4:00 p.m. ET
Cboe S&P 500 One-Week PutWrite Index WPUT 15 seconds 9:30 a.m. – 4:00 p.m. ETPage 11
Cboe Global Indices CONFIDENTIAL
5 IndexInformation
Index Name Index Ticker Base Date Launch Date Base Value Currency
Cboe Russell 2000 PutWrite
Index
PUTR January 31, 2001
November 23,
2015
100 USD
Cboe S&P 500 2% OTM
PutWrite Index
PUTY June 30, 1986 February 15, 2019 100 USD
Cboe 20+ Year Treasury Bond
PutWrite Index
PTLT January 21, 2005 March 31, 2021 100 USD
Cboe Russell 2000 One-Week
PutWrite Index
WPTR
February 28,
2011
November 23,
2015
100 USD
Cboe S&P 500 One-Week
PutWrite Index
WPUT January 31, 2006 August 3, 2015 100 USD
6 Appendix 1 -Changes
Major changes described in this document since October 14, 2024, are as follows:
Change Summary Effective
Date
Previous Language Updated Language
- - - -
7 Appendix2 -Document Information
Version Number1
2.0
Last Revised Date October 15, 2025
1
PriortoOctober14,2024,themethodologiesoftheIndicescoveredbythisdocumentwere separatelymaintainedinalegacyformat.Disclosures and Disclaimers Related to Cboe Indices
Cboe Global Indices, LLC and Cboe Europe Indices, B.V. (collectively, the “Cboe Index Providers”, and individually a “Cboe Index Provider”), are both
subsidiariesofCboeGlobalMarkets,Inc.(CboeGlobalMarkets,Inc.,theCboeIndexProviders,and theothersubsidiariesandaffiliatesofCboeGlobal
Markets, Inc. are collectively referred to herein as the “Cboe Companies” and those entities are individually referred to as a “Cboe Company”).
TheCboeIndex Providersare eachanindex providerthatadministers, calculates and distributes indicesandothervalues(as applicable) (collectively,
“Cboe Indices” and individually a “Cboe Index”). Additional information regarding the Cboe Index Providers and their operations is available at
www.cboe.com/indices/.
Nothing hereinconstitutesanofferof services. Theinformationherein is provided solely for informationalpurposes. CboeIndices are calculatedand
administered (as described in relevant methodologies, rules and other information) without regard to the needs of any particular person, entity, or
group of persons, using market information, including, without limitation, market data from exchanges owned and operated by other Cboe
Companies.
Indexandbenchmarkvaluesfordatesortimeperiodspriortoanindexlaunchdate,if any,arecalculated usinga theoreticalapproachinvolvingback-
testinghistoricaldatainaccordancewiththemethodologyinplaceonthelaunchdate(unlessotherwisestated). Back-testinginvolvesthetheoretical
application of the index methodology in hindsight and therefore does not involve actual performance and may not produce performance
commensurate with prospective application of the methodology. No back-tested approach can completely account for the impact of decisions that
might have been made if calculations were made at the same time as certain underlying market conditions occurred. Supporting documentation for
statements, comparisons, statistics or other technical data provided in this document is available by request at www.cboe.com/contact/.
Past performance of an index orfinancial product is not indicative of future results. Indices are not financial products that can be invested in directly,
but they can be used as the basis for financial products (for example, without limitation, options, futures, mutual funds or exchange-traded funds)
or to help manage portfolios.
TheCboeIndexProvidersarenotinvestmentadvisersortaxadvisers.Nodecisiontobuy,hold,orsellanyfinancialproduct shouldbemadeinreliance
onanyof theinformationprovidedherein, andno representationismaderegardingtheadvisability or tax consequencesof any investment, whether
based on an index or not. Nothing herein should be construed as investment advice. No representation or assurance is made that any financial
productwillaccurately trackthe performanceofanunderlyingindexor providepositiveinvestmentreturns. Indexvaluesandreturnsaretheoretical,
and do not reflect the results of actual trading of financial products, nor the value of an actual portfolio, and may not reflect the fees, taxes or other
expensesassociatedwithbuying, holdingorsellinginvestmentsor theeffect of actualmarket conditionsorevents. The CboeIndex Providersare not
broker-dealers, intermediaries, investment firms or securities exchanges and they do not manage actual financial products. None of the Cboe
Companies sponsor, endorse, promote, manage, sell or administer any financial product that is created, sponsored, issued or sold by a third-party,
whether based on any Cboe Index or not.
No data, values, or other content contained herein (“Content”) may be copied, modified, reverse-engineered, reproduced, distributed, or stored in
a database or retrieval system, in any form or by any means, nor may any Content be used to create a derivative work (e.g., a financial product,
service or index) or used to verify or correct other data or information, without the Cboe Index Provider’s prior written consent. Without derogating
from the aforementioned, Content shall not be used for any unlawful or unauthorized purposes.
The Cboe Companies, their third-party service or data providers, or any party from whom they have licensed trademarks or indices (collectively, the
“Cboe Parties”) do not guarantee the accuracy, completeness, or timeliness of the Content, trademarks, strategies or values, or the methodologies
or input data used to calculate index values. The Cboe Parties are not responsible for any errors or omissions, regardless of the cause, or for the
results obtained from the use of the Content, index strategies or values, methodologies or input data. THE CONTENT, INDICES AND RELATED
STRATEGIESANDMETHODOLOGIESARE PROVIDED“ASIS”WITHOUT WARRANTY OFANY KIND, EITHER EXPRESSOR IMPLIED, INCLUDING, WITHOUT
LIMITATION, ANY WARRANTY WITH RESPECT TO MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE OR USE. USERS OF CONTENT AND/OR
THE CBOE INDICES BEAR ALL RISKS OF LOSS.
WITHOUT LIMITING THE FOREGOING AND TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL THE CBOE PARTIES BE
RESPONSIBLEORLIABLETOANYPERSONORENTITYFORANYDAMAGESOFANYKIND,INCLUDING,BUTNOTLIMITEDTO,DIRECT,INDIRECT,SPECIAL,
INCIDENTAL, CONSEQUENTIAL, PUNITIVE, LOST PROFITS OR LOST OPPORTUNITIES, WHETHER OR NOT A CBOE PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES. THE FOREGOING LIMITATIONS SHALL APPLY REGARDLESS OF WHETHER A CLAIM ARISES IN CONTRACT, TORT,
NEGLIGENCE, STRICT LIABILITY, OR OTHERWISE.
The Cboe Index Providers receive compensation in connection with licensing Cboe Indices to third parties and providing calculation services to third
parties. Some Cboe Companies operate markets for the trading of financial products and provide services to many organizations, including issuers of
securities, investment advisers, broker-dealers, investment banks, other financial institutions and financial intermediaries, and accordingly may
provide or receive fees or other economic benefits to or from those organizations. These organizations may also be Cboe Index Provider licensees or
customers, and the Cboe Index Providers may include securities of or relating to such organizations in Cboe Indices.Page 1
Cboe Global Indices CONFIDENTIAL
Cboe®, C2SM, Cboe ClearSM, Cboe Closing Cross®, Cboe DigitalSM, Cboe LIS®, Cboe Futures ExchangeSM, Cboe Global IndicesSM, Cboe Global Markets®,
CboeOptionsInstitute®,CboeVolatilityIndex®,Bats®,BIDSTrading®,BufferProtectSM,BuyWriteSM,BYX®,BZX®,CFE®,EDGA®,EDGX®,ErisExchange®,
ErisX®, f(t)optionsSM, FLEX®, FLexible EXchange®, HanweckSM, Hybrid®, LiveVol®, NANO®, Options Institute®, PutWriteSM, Silexx®, SRVIXSM, Trade
AlertSM,VIX®,andXSPSM aretrademarksandservicemarksoftheCboeCompanies.TrademarksoftheCboeCompaniesmayonlybeusedwithwritten
permission, subject to applicable Cboe Company trademark usage guidelines as published from time to time. Third-party trademarks and service
marks used in this document are described below. The values and methodologies for indices branded with the “Cboe” trademark are the property
of the relevant Cboe Index Provider.
The Cboe Companies have licensed several trademarks from third parties from whom they have also licensed indices which may be included in this
document or in other materials related to Cboe Indices, as follows:
• Dow Jones®, Dow Jones Industrial Average® and DJIA® are trademarks or service marks of Dow Jones Trademark Holdings LLC (“Dow
Jones”), have been licensed for use for certain purposes by the Cboe Companies. Derivative indices created, used and distributed by Cboe
Companies and any investment products based thereon are not sponsored, endorsed, sold or promoted by Dow Jones, and Dow Jones
makes no representation regarding the advisability of investing in any investment product that is based on any such derivative indices.
• FTSE® and the FTSE indices are trademarks and service marks of FTSE International Limited, used under license.
• IHS, IHS Markit, CDX, iBoxx, and iTraxx are trademarks of IHS Markit Limited and its affiliates (“IHS”) and have been licensed for use by the
Cboe Companies. Any IHS Markit index referenced herein is the property of IHS Markit and is used under license. Any products that have
an IHS Markit index as their underlying interest are not sponsored, endorsed, or promoted by IHS Markit.
• MSCI and the MSCI index names are service marks of MSCI Inc. (“MSCI”) or its affiliates and have been licensed for use by the Cboe
Companies. Any derivative indexes and any financial products based on the derivative indexes (“Products”) are not sponsored, guaranteed
or endorsed by MSCI, its affiliates or any other party involved in, or related to, making or compiling such MSCI index. Neither MSCI, its
affiliates nor any other party involved in, or related to, making or compiling any MSCI index makes any representations regarding the
advisability of investing in such Products; or any warranty, express or implied; or bears any liability as to the results to be obtained by any
person or any entity from the use of any such MSCI index or any data included therein. No purchaser, seller or holder of any Product, or
any otherpersonorentity, shoulduseorreferto any MSCI tradename, trademarkorservicemarkto sponsor, endorse, market orpromote
Products without first contacting MSCI to determine whether MSCI’s permission is required.
• Nasdaq®, Nasdaq-100®, and Nasdaq-100 Index®, are trademarks of Nasdaq, Inc. (together with its affiliates, the “Corporations”) and are
licensedforusebyCboeExchange, Inc. TheCBOE Nasdaq-100VolatilityIndex (the“VolatilityIndex”) andCBOE Nasdaq-100BuyWriteIndex
(the“BuyWriteIndex”)arenotderived,maintained,published,calculatedordisseminatedbytheCorporations.NeithertheVolatilityIndex,
the BuyWrite Index nor any product based on such indexes have been passed on by the Corporations as to their legality or suitability. Such
products are not issued, endorsed, sold, or promoted by the Corporations. THE CORPORATIONS MAKE NO WARRANTIES AND BEAR NO
LIABILITY WITH RESPECT TO THE VOLATILITY INDEX OR BUYWRITE INDEX.
• Russell, Russell 1000®, Russell 2000®, Russell 3000® and Russell MidCap® are registered trademarks of the Frank Russell Company, used
under license.
• S&P, S&P 500, US500, 500, THE 500, SPDR, SPX, and DSPX are trade names or trademarks of S&P Dow Jones Indices, LLC or its affiliates
(“S&P”). Any products that have an S&P index as their underlying interest are not sponsored, endorsed, sold or promoted by S&P and S&P
makes no representation regarding the advisability of investing in any investment product that is based on any such indices.
© 2025 Cboe Exchange, Inc. and its affiliates. All Rights Reserved.
v20230405Page 2
Cboe Global Indices CONFIDENTIAL
CONTACT US
IndexSupport@cboe.com
www.cboe.com/indices