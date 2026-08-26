---
sha256: 636285a2d646750fb7a2d8c3a0556a2d44c541fc5fd9f27231d64cb3ad52df13
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 663610
---
RaymondH.Chan·YvesZY.Guo
SpikeT.Lee·XunLi
Financial
Mathematics,
Derivatives
andStructured
ProductsFinancial Mathematics, Derivatives
and Structured ProductsRaymond H. Chan • Yves ZY. Guo • Spike T. Lee
Xun Li
Financial Mathematics,
Derivatives and Structured
Products
123Raymond H. Chan
City University of Hong Kong
Kowloon Tong, Hong Kong
Yves ZY. Guo
BNP Paribas CIB
Central, Hong Kong
Spike T. Lee
The Chinese University of Hong Kong
Sha Tin, Hong Kong
Xun Li
The Hong Kong Polytechnic University
Hung Hom, Hong Kong
ISBN 978-981-13-3695-9 ISBN 978-981-13-3696-6 (eBook)
https://doi.org/10.1007/978-981-13-3696-6
Library of Congress Control Number: 2019932819
© Springer Nature Singapore Pte Ltd. 2019
This work is subject to copyright. All rights are reserved by the Publisher, whether the whole or part of
thematerialisconcerned,specifically therightsoftranslation,reprinting,reuseofillustrations, recitation,
broadcasting, reproduction on microfilms or in any other physical way, and transmission or information
storage and retrieval, electronic adaptation, computer software, or by similar or dissimilar methodology
now known or hereafter developed.
Theuseofgeneraldescriptivenames,registerednames,trademarks,servicemarks,etc.inthispublication
does not imply, even in the absence of a specific statement, that such names are exempt from the relevant
protective laws and regulations and therefore free for general use.
The publisher, the authors, and the editors are safe to assume that the advice and information in this book
are believed to be true and accurate at the date of publication. Neither the publisher nor the authors or
the editors give a warranty, express or implied, with respect to the material contained herein or for any
errors or omissions that may have been made. The publisher remains neutral with regard to jurisdictional
claims in published maps and institutional affiliations.
This Springer imprint is published by the registered company Springer Nature Singapore Pte Ltd.
The registered company address is: 152 Beach Road, #21-01/04 Gateway East, Singapore 189721,
SingaporeDedicated to our loved ones,
Raymond: to Katharine
Yves: to Véronique, Antoine, Céline, and Sophie
Spike: to Carie
Xun: to YunPreface
This book originates from different courses taught by the authors:
– “Financial Mathematics” (undergraduate course) at The Chinese University of
Hong Kong by the first author
– “Financial Mathematics I” (undergraduate course) at the National University of
Singapore and Hong Kong Polytechnic University by the fourth author
– “MathematicalFinancialModelling”(master’scourse)atTheChineseUniversity
of Hong Kong by the second and third authors
– “Mathematical Investment Models” and “Structured Products and Solutions”
(master’s courses) at Hong Kong University of Science and Technology by the
second author.
Many examples and analysis from industry’s point of view are featured in this
book and provided by the second author who has 20+ years banking experience
in financial engineering for his work in a large French bank and two other top
investment banks. At the same time, the book also contains theoretical content and
bridges the gap between theory and practice. It takes a different route from the
existing financial mathematics books and will attract both students and practitioners
with or without science or finance background.
The primary audience would be undergraduate and postgraduate students. The
book can also be used as a textbook for the following courses:
– Financial Mathematics (undergraduate level)
– Stochastic Modelling in Finance (postgraduate level)
– Financial Markets and Derivatives (undergraduate level)
– Structured Products and Solutions (undergraduate/postgraduate level).
This book aims to equip readers with the necessary knowledge of financial
markets for working as product structurers, traders, sales, or risk managers. Both
viiviii Preface
financial practitioners and academic people may find interests in this book because
it intends to unify the derivatives modelling and the financial engineering practice
in the market.
Hong Kong Raymond H. Chan
Sep 2018 Yves ZY. Guo
Spike T. Lee
Xun LiAcknowledgments
The authors are grateful for students from The Chinese University of Hong Kong,
the National University of Singapore, Hong Kong Polytechnic University, and Hong
Kong University of Science and Technology, who took the classes using the raw
materials from the book.
The authors also thank the referees for their valuable comments and Ramon Peng
for his continuous editorial support. The second author would like to thank Laurent
Bouaziz, Haitao Xie, Shukang Chen, Xiaolan Zhang, and Zhen Wei for their help
and the inspiring discussions. The third author would like to thank Rui Zhao and
Teng Chen for giving seminars on related subjects.
ixContents
Part I Financial Markets
1 Introduction to Financial Markets ....................................... 3
1.1 Investable Assets and Instruments ................................. 3
1.2 Investment Returns and Risks ...................................... 4
1.3 Performance Measures.............................................. 6
1.4 Financial Markets ................................................... 7
1.4.1 Centralized Clearing..................................... 8
1.4.2 OTC Derivatives Documentation and
Counterparty Risk Management ........................ 8
1.5 Securities Borrowing & Lending and Repo ....................... 9
1.6 Derivatives Activities ............................................... 11
2 Interest Rate Instruments ................................................. 13
2.1 Interest Rate Conventions .......................................... 13
2.1.1 Day Count Convention .................................. 13
2.1.2 Business Day Convention ............................... 14
2.2 Interest Rate Types and Zero Coupon Bond....................... 14
2.2.1 Simple Rate .............................................. 15
2.2.2 Compound Rate.......................................... 15
2.2.3 Continuous Rate ......................................... 15
2.2.4 Relationship Between Interest Rates.................... 16
2.2.5 Zero Coupon Bond....................................... 16
2.3 Money Market ...................................................... 17
2.3.1 Money Market Instruments.............................. 17
2.3.2 Interbank Lending Market............................... 17
2.4 Bonds................................................................ 18
2.4.1 Bond Features and Types................................ 18
2.4.2 Main Risks for a Bond................................... 19
2.4.3 Bond Quotation and Yield to Maturity ................. 19
2.4.4 Duration and Modified Duration ........................ 21
2.5 Credit Rating ........................................................ 21
xixii Contents
2.6 Forward Rate Agreement........................................... 22
2.7 Interest Rate Futures................................................ 23
2.7.1 Short-Term Interest Rate (STIR) Futures............... 23
2.7.2 Treasury Bond Futures .................................. 24
2.8 Interest Rate Swap .................................................. 25
2.8.1 Standard Swap ........................................... 27
2.8.2 Overnight Indexed Swap (OIS) ......................... 27
2.8.3 Other Swaps.............................................. 28
2.9 Yield Curve Construction........................................... 29
2.9.1 Yield Curve .............................................. 29
2.9.2 Interpolation Method for Yield Curve .................. 29
2.9.3 Bootstrapping Method................................... 29
2.9.4 Illustration Example for Yield Curve Construction .... 30
3 Equities and Equity Indices ............................................... 35
3.1 Equity................................................................ 35
3.2 Stock Dividend...................................................... 36
3.3 Stock Split, Reverse Stock Split, Rights Issue..................... 36
3.4 Equity Index......................................................... 37
3.5 Equity Forward, Cash & Carry and Reverse Cash & Carry....... 38
3.6 Equity Index Futures................................................ 40
3.7 Equity Swap......................................................... 40
4 Foreign Exchange Instruments ........................................... 43
4.1 Quotation Conventions ............................................. 43
4.2 FX Spot, Forward, Swap, Non-deliverable Forward (NDF) ...... 44
4.3 Interest Rate Parity for FX Forward ............................... 45
4.4 Cross Currency Swap and Non-deliverable Swap (NDS)......... 46
5 Commodities ................................................................ 49
5.1 Commodities Overview............................................. 49
5.2 Commodity Forward and Futures .................................. 50
5.3 A Special Commodity: Gold ....................................... 52
6 Credit Derivatives .......................................................... 55
6.1 Credit Default Swap (CDS) ........................................ 55
6.2 CLN (Credit Linked Note) ......................................... 56
6.3 Credit Index ......................................................... 57
6.4 Collateralized Debt Obligation (CDO) ............................ 58
7 Investment Funds........................................................... 61
7.1 Funds ................................................................ 61
7.1.1 Fund Price and Fees ..................................... 61
7.1.2 Fund Organization ....................................... 62
7.1.3 Share Classes............................................. 62
7.1.4 Fund Derivatives ......................................... 63
7.2 Mutual Funds ....................................................... 63
7.3 Hedge Funds ........................................................ 64Contents xiii
8 Options....................................................................... 67
8.1 Option Features ..................................................... 68
8.1.1 Option Style.............................................. 68
## 8.1.2 Mark-to-Market Price, Intrinsic Value and Time Value 68
8.1.3 Moneyness of an Option................................. 69
8.1.4 Notional Amount Definition ............................ 69
8.2 Vanilla Options...................................................... 69
8.2.1 Equity Options ........................................... 70
8.2.2 Foreign Exchange Options .............................. 70
8.2.3 Commodity Options ..................................... 70
8.2.4 Interest Rate Options .................................... 71
8.2.5 Option Pricing, Hedging and Execution ................ 72
8.2.6 Implied Volatility ........................................ 73
8.2.7 Put-Call Parity ........................................... 74
8.2.8 Popular Strategies with European Options ............. 75
8.2.9 American Options........................................ 77
8.3 Exotic Options ...................................................... 78
8.3.1 Barrier Option............................................ 79
8.3.2 Binary (or Digital) Option............................... 80
8.3.3 In-Out Parity ............................................. 80
8.3.4 Asian Option or Average Option........................ 81
8.3.5 Lookback Option ........................................ 81
8.3.6 Quanto Option and Composite Option.................. 81
8.3.7 Basket Option, Worst-of and Best-of Options.......... 82
8.4 Derivatives Modelling Framework................................. 83
8.4.1 Purpose of Derivatives Modelling....................... 83
8.4.2 Model Input Parameters and Calibration ............... 83
Part II Stochastic Calculus and Financial Modelling
9 Elements of Probability .................................................... 89
9.1 Probability Space, Measure and Properties........................ 89
9.2 Independence and Conditional Probability ........................ 90
9.3 Random Variable and Distribution ................................. 92
9.3.1 Distribution............................................... 92
9.3.2 Expectation............................................... 93
9.3.3 Variance and Covariance ................................ 95
9.3.4 Independent Random Variables ......................... 96
9.3.5 Conditional Probability Distribution.................... 96
9.3.6 Characteristic Functions................................. 97
9.3.7 Normal Distribution ..................................... 97
9.3.8 Exponential Distribution ................................ 100
9.3.9 Poisson Distribution ..................................... 100
9.4 Limit Theorems ..................................................... 101
9.4.1 Law of Large Numbers .................................. 101
9.4.2 Central Limit Theorem .................................. 101xiv Contents
10 Stochastic Calculus Part I ................................................. 103
10.1 Stochastic Process .................................................. 103
10.2 Conditional Expectation ............................................ 104
10.3 Martingale........................................................... 108
10.4 Markov Property .................................................... 108
10.5 Quadratic Variation ................................................. 108
10.6 Brownian Motion ................................................... 109
10.7 Itô Integral........................................................... 113
10.8 Itô Calculus.......................................................... 114
10.9 Poisson Process ..................................................... 116
11 Black–Scholes–Merton Model for Option Pricing ...................... 119
11.1 The Black–Scholes–Merton Model ................................ 119
11.2 Derivation of the Black–Scholes Equation ........................ 121
11.3 Black–Scholes Formulas for Vanilla Options ..................... 124
11.4 Discussion on Hedging Issues...................................... 126
11.4.1 Sensitivities (Greeks) .................................... 126
11.4.2 Practical Issues in Hedging.............................. 129
12 Stochastic Calculus Part II ................................................ 135
12.1 Change of Probability............................................... 135
12.2 Predictable Martingale Representation ............................ 139
12.3 Stochastic Differential Equations .................................. 139
13 Risk-Neutral Pricing Framework......................................... 145
13.1 Money Market Account ............................................ 145
13.2 Risk-Neutral Probability Measure ................................. 146
13.3 Self-Financing Portfolio ............................................ 147
13.3.1 Discounting, Excess Return and Self-Financing ....... 148
13.4 Fundamental Theorems of Asset Pricing .......................... 149
13.5 Hedging and Pricing in Complete Market ......................... 149
13.5.1 General Pricing Formula ................................ 150
13.5.2 Determination of Hedging Parameter Δt ............... 151
13.6 Discussion on Hedging, Pricing and Risk-Neutral Framework... 151
13.7 Black–Scholes–Merton Model Revisited .......................... 153
13.7.1 Closed-Form Solution for Call Option.................. 153
13.8 Dividend Modelling ................................................ 155
13.8.1 Risk-Neutral SDE with Continuous Dividend.......... 156
13.8.2 Vanilla Option Pricing Formula ......................... 157
## 13.8.3 Option Adjustment for Exceptional Dividend
and Right Issuance....................................... 157
13.9 Collateralized Derivative Pricing and FVA ........................ 158
14 Numerical Methods for Option Pricing .................................. 161
14.1 The Binomial Tree .................................................. 161
14.1.1 Tree Construction ........................................ 162
14.1.2 Determination of the Parameters........................ 164Contents xv
14.2 Monte Carlo Method................................................ 165
14.2.1 Monte Carlo Simulation for Option Pricing ............ 165
14.2.2 Generating One-Dimensional Random Variates........ 166
14.2.3 Generating Multivariate Randoms ...................... 169
14.3 PDE Method with Finite Difference Approximation.............. 172
14.3.1 Explicit Scheme.......................................... 175
14.3.2 Implicit Scheme.......................................... 176
14.3.3 Crank-Nicolson Scheme................................. 176
14.3.4 Alternating Direction Implicit (ADI) Method.......... 176
15 American Options .......................................................... 179
15.1 Stopping Time....................................................... 179
15.2 Backward Pricing ................................................... 179
15.3 Methods for Pricing American Options............................ 180
15.3.1 Binomial Tree ............................................ 181
15.3.2 Partial Differential Inequality ........................... 182
15.3.3 Least-Square American Monte Carlo Method.......... 189
16 Exotic Options Pricing and Hedging ..................................... 195
16.1 Further Properties of Brownian Motion ........................... 195
16.1.1 Covariance of Brownian Motions ....................... 195
16.1.2 First Passage Time ....................................... 196
16.1.3 Extremum to Date ....................................... 196
16.1.4 Reflection Principle...................................... 197
16.1.5 Distribution of First Passage Time ...................... 198
## 16.1.6 Joint Distribution with Extremum of Brownian Motion 198
16.2 Pricing of Exotic Options Under BSM Model..................... 201
16.2.1 European Binary Options................................ 201
16.2.2 American Binary and Barrier Options .................. 202
16.2.3 Asian Options ............................................ 205
16.2.4 Basket Options, Worst-of, Best-of Options............. 207
16.3 Hedging Issues and Practical Solutions............................ 207
16.3.1 Gap Risk ................................................. 207
16.3.2 Large Delta Issue ........................................ 210
16.3.3 Correlation Risk ......................................... 211
17 Numéraires and the Pricing of Vanilla Interest Rate Options ......... 213
17.1 Introduction of Numéraire.......................................... 213
17.2 Change of Numéraire ............................................... 213
17.3 Self-Financing Condition........................................... 215
## 17.4 Usual Numéraires and the Pricing of Vanilla Interest Rate
Options .............................................................. 216
17.4.1 Money Market Account ................................. 216
17.4.2 Zero Coupon Bond....................................... 217
17.4.3 Annuity Factor ........................................... 218
17.4.4 SABR Model for Vanilla Interest Rate Options ........ 220xvi Contents
18 Foreign Exchange Modelling .............................................. 223
18.1 Stochastic Model for Foreign Exchange Rate ..................... 223
18.2 Pricing Formulas for Vanilla Options and FX Option Duality.... 224
18.3 SDE for Foreign Asset Under Domestic Measure................. 225
18.4 Composite Option................................................... 227
18.5 Quanto Option ...................................................... 228
18.6 Discussions on Hedging ............................................ 228
Part III Extensions to Financial Modelling
## 19 Local, Stochastic Volatility Models, Static Hedging and
Variance Swap .............................................................. 233
19.1 Introduction ......................................................... 233
19.2 Local Volatility Model.............................................. 236
19.3 Stochastic Volatility Model......................................... 240
19.4 Static Hedging for European Style Options ....................... 243
19.5 Variance Swap ...................................................... 244
20 Jump-Diffusion Models .................................................... 249
20.1 Compound Poisson Process ........................................ 249
## 20.1.1 Simulating a Poisson Process and Compound
Poisson Process .......................................... 250
20.2 Stochastic Calculus for Jump-Diffusion Processes................ 250
20.3 Jump-Diffusion Asset Pricing Model .............................. 252
20.4 European Call or Put Option Pricing............................... 253
20.5 PIDE for a European Style Option................................. 255
20.6 Discussion on Hedging Under Jump-Diffusion Model ........... 256
21 Interest Rate Term Structure Modelling................................. 259
21.1 Continuous-Time Modelling of Interest Rate...................... 259
21.1.1 Zero Coupon Bond....................................... 260
21.1.2 Short Rate rt ............................................. 260
21.1.3 Forward Rate ft(T)...................................... 260
21.2 Heath–Jarrow–Morton Framework ................................ 261
21.2.1 No-Arbitrage Short Rate Model......................... 263
21.2.2 Markovian Characterization for Short Rate Models ... 263
21.3 Short Rate Models .................................................. 266
21.3.1 Hull–White One-Factor Model.......................... 267
21.3.2 Two-Factor LGM (Linear Gaussian Model)............ 268
21.3.3 CIR (Cox-Ingersoll-Ross) One-Factor Model.......... 269
21.3.4 Affine-Yield Models ..................................... 270
21.4 Libor Market Model (LMM) ....................................... 271
21.5 Convexity Adjustment .............................................. 273
22 Credit Modelling............................................................ 277
22.1 Credit Modelling.................................................... 277
22.1.1 Structural Models ........................................ 277
22.1.2 Intensity Models ......................................... 278Contents xvii
22.2 CDS (Credit Default Swap) ........................................ 280
22.2.1 Credit Triangle ........................................... 281
22.3 Pricing and Hedging of Basket Credit Derivatives ................ 281
22.3.1 Copula.................................................... 281
22.3.2 One-Factor Gaussian Copula Model.................... 282
22.3.3 Pricing of Basket Credit Derivatives.................... 283
22.4 Counterparty Risk Measures ....................................... 284
23 Commodity Modelling ..................................................... 291
Part IV Structured Products and Solutions
24 Structured Products........................................................ 297
24.1 Introduction ......................................................... 297
24.2 Assets................................................................ 298
24.3 Payoff................................................................ 299
24.3.1 Principal Protected Products ............................ 299
24.3.2 Principal Non Protected Products....................... 300
24.4 Wrapper or Instrument.............................................. 301
24.5 Risks of Structured Products ....................................... 302
24.6 Funding Management for Structured Notes ....................... 303
24.7 Back-Testing ........................................................ 304
24.8 Business Organization .............................................. 305
24.9 Payoff Structuring Techniques ..................................... 305
24.10 Pricing and Hedging ................................................ 307
25 Popular Structured Products.............................................. 309
25.1 Equity Structured Products ......................................... 309
## 25.1.1 Equity Linked Note (ELN) or Reverse
Convertible Note......................................... 310
## 25.1.2 Fixed Coupon Callable Note (FCN) and Daily
Accrual Callable (DAC) ................................. 312
25.1.3 Phoenix Callable Note................................... 313
25.1.4 Autocallable Structure................................... 314
25.1.5 Issuer Callable Structure................................. 315
25.1.6 Wedding Cake............................................ 317
25.1.7 Bonus Enhanced Note (BEN) ........................... 317
25.1.8 Accumulator ............................................. 318
25.1.9 Decumulator ............................................. 320
25.1.10 Shark-Fin................................................. 320
25.1.11 Twin-Win................................................. 321
25.1.12 Tracker+ Note............................................ 322
25.1.13 Leveraged Structures .................................... 323
25.1.14 Booster Note ............................................. 324
25.1.15 Stellar Note............................................... 324
25.1.16 Cliquet Option ........................................... 325
25.1.17 Himalaya ................................................. 325xviii Contents
25.2 Fixed-Income Structured Products................................. 326
25.2.1 Range Accrual ........................................... 326
25.2.2 Inverse Floater ........................................... 328
25.2.3 Zero Coupon Callable Note ............................. 328
25.2.4 Reverse Convertible Note on Rate ...................... 328
25.2.5 Yield Spread Structure................................... 329
25.3 Foreign-Exchange Structured Products ............................ 330
25.3.1 Dual Currency Investment (DCI) ....................... 330
25.3.2 FX Accumulator ......................................... 331
25.3.3 Target Redemption Forward (TRF) ..................... 331
25.4 Commodities Structured Products ................................. 334
25.5 Hybrid Structured Products......................................... 335
25.5.1 Callable Daily Range Accrual........................... 335
25.5.2 Best-of Profile............................................ 336
25.5.3 ASCOT: Asset Swapped Convertible Option
Transaction ............................................... 336
25.5.4 Gap Note ................................................. 337
25.6 Fund Linked Structured Products .................................. 338
25.6.1 Bullish Note.............................................. 339
25.6.2 Bullish Coupon Note .................................... 340
25.7 Credit Linked Structured Products ................................. 340
25.7.1 Credit Linked Note (CLN) .............................. 340
25.7.2 CLN on Credit Index .................................... 341
25.8 Equity Derivatives for Corporates.................................. 341
25.8.1 Financing................................................. 342
25.8.2 Shares Buy-Back......................................... 345
25.8.3 Shares Disposal .......................................... 346
26 Dynamic Asset Allocation.................................................. 351
26.1 Volatility Target for Risk Control .................................. 352
26.2 Gap Risk Based Asset Allocation.................................. 353
26.2.1 CPPI (Constant Proportion Portfolio Insurance) ....... 355
26.2.2 TIPP (Time Invariant Portfolio Protection)............. 356
26.3 Portfolio Asset Allocation.......................................... 356
26.3.1 Risk-Based Methods..................................... 358
26.3.2 Modern Portfolio Theory................................ 359
26.3.3 Black–Litterman Model ................................. 363
27 Systematic Strategy......................................................... 367
27.1 Introduction ......................................................... 367
27.2 Asset Pricing Models ............................................... 368
27.2.1 Capital Asset Pricing Model (CAPM) .................. 368
27.2.2 Arbitrage Pricing Theory (APT) ........................ 370
27.3 Factors and Factor-Based Strategies ............................... 371
27.4 Other Systematic Strategies ........................................ 374
27.5 Performance Measuring ............................................ 374
27.6 Customized Index................................................... 375Contents xix
A Theorems in Probability Theory.......................................... 377
A.1 Law of Total Covariance............................................ 377
A.2 Multivariate Random Variable ..................................... 378
A.3 Multivariate Normal Distribution .................................. 378
A.4 Conditional Normal Distribution................................... 379
B Representation of CIR Process as a Squared Bessel Process .......... 383
B.1 Squared Bessel Process............................................. 383
B.2 Representation of CIR Process..................................... 384
References......................................................................... 387
Index............................................................................... 391Acronyms
ABS Asset-backed securities
ADI Alternating direction implicit
ADTV Average daily trading volume
AKI American Knock-In
ALM Asset liability management
APT Arbitrage pricing theory
ASB Accelerated Share Buy-Back
ASCOT Asset Swapped Convertible Option Transaction
ATM At-the-money
ATMF At-the-money forward
ATMS At-the-money spot
AUM Assets under management
AXKI At Expiry Knock-In
BA Banker’s acceptance
BBM Buy below the market
BCBS Basel Committee on Banking Supervision
BEN Bonus Enhanced Note
BGM Brace–Ga̧tarek–Musiela
BPV Basis point value
BSM Black–Scholes–Merton
CAL Capital allocation line
CAPM Capital asset pricing model
CB Convertible bond
CBBC Callable bull/bear contract
CBOE Chicago Board Options Exchange
CCS Cross-currency swap
CD Certificate of deposit
CDO Collateralized debt obligation
CDS Credit default swap
CET Central European time
xxixxii Acronyms
CEV Constant elasticity of variance
CIR Cox–Ingersoll–Ross
CLN Credit-linked note
CME Chicago Mercantile Exchange
CMS Constant maturity swap
CP Commercial paper
CPPI Constant proportion portfolio insurance
CSA Credit support annex
CTA Commodity trading advisor
CTD Cheapest-to-deliver
CVA Credit valuation adjustment
DAC Daily Range Accrual Callable Note
DCI Dual Currency Investment
DCM Debt capital market
DVA Debit valuation adjustment
DVP Delivery versus payment
EAD Exposure at default
ECM Equity capital market
ELN Equity-linked note
EPE Expected positive exposure
ERR Expiry reference rate
ETF Exchange-traded fund
Eonia Euro Overnight Index Average
EPS Earnings-per-share
Euribor Euro Interbank Offered Rate
FCN Fixed Coupon Callable Note
FRA Forward rate agreement
FRN Floating rate note
FX Foreign exchange
GMRA Global Master Repurchase Agreement
GMSLA Global Master Securities Lending Agreement
HJM Heath–Jarrow–Morton
HNW High net worth
HWM High water mark
IA Independent amount
ICE Intercontinental Exchange
ICMA International Capital Market Association
IIC International Index Company
IPO Initial public offering
IRB Internal ratings-based
IRR Internal rate of return
IRS Interest rate swap
ISDA International Swaps and Derivatives Association
ITM In-the-moneyAcronyms xxiii
KMV Kealhofer, McQuown, and Vašíček
KO Knock-Out
LGD Loss given default
LGM Linear Gaussian model
Libor London Interbank Offered Rate
LMM Libor market model
LTV Loan-to-value
MD Modified duration
MPT Modern Portfolio Theory
MTA Minimum transfer amount
MtM Mark-to-market
MVO Mean-variance optimization
NAV Net asset value
NDF Non-deliverable forward
NDS Non-deliverable swap
NPV Net present value
OBPI Option-based portfolio insurance
OIS Overnight indexed swap
O/N Overnight (as in deposit rate)
OTC Over-the-counter
OTM Out-of-the-money
PCA Principal component analysis
PD Participating dealer
PDE Partial differential equation
PFE Potential future exposure
PIDE Partial integro-differential equation
P/L Profit & Loss
PnL Profit & Loss
PR Participation rate
PV Present value
Repo Repurchase agreement
RICI Rogers International Commodity Index
RWA Risk-weighted asset
SAM Sell above the market
SBL Securities borrowing and lending
SDE Stochastic differential equation
SPV Special purpose vehicle
STIR Short-term interest rate
T-bills Treasury bills
TER Total expense ratio
TIPS Treasury inflation-protected securities
TIPP Time invariant portfolio protection
T/N Tomorrow/Next (as in deposit rate)
TRF Target redemption forward
TRS Total return swapxxiv Acronyms
WTI West Texas Intermediate
VaR Value at risk
VWAP Volume-weighted average price
ZC(B) Zero coupon (bond)Notation
W week, e.g., 1W means a 1-week tenor
M month, e.g., 3M means a 3-month tenor
Y year, e.g., 1Y means a 1-year tenor
k thousand, e.g., USD50k
m/mio million, e.g., USD10m
a.s. almost surely
bn billion, e.g., USD1bn
bps basis point, which is 0.01% = 0.0001
c.d.f. cumulative distribution function
i.i.d. independent and identically distributed
LHS left-hand side of an equation
RHS right-hand side of an equation
r.v. random variable
s.t. such that
p.a. per annum
p.d.f. probability density function
w.r.t. with respect to
(d)
⇐⇒ equivalence in distribution
a ∧ b min{a,b}
a ∨ b max{a,b}
(X)+ max{0,X}
· vector inner product
e, exp exponential function
ln, log natural logarithm
xxvPart I
Financial MarketsChapter 1
Introduction to Financial Markets
There are a few objectives in this book. The first is to study the main properties
of basic derivatives such as forward/futures, swaps, vanilla and exotic options. The
second is to provide a modelling framework within which those derivatives can
be priced and hedged. The third is to introduce the structured products, which are
customized solutions offered to investors.
## 1.1 Investable Assets and Instruments
The assets for investors in the financial market are mainly liquid investable assets
such as bonds, stocks, foreign currencies and commodities. The liquidity of an
asset is measured by the easiness and cost to convert it into cash. Not all assets
are transferable, for instance, the bank deposits. A transferable asset traded in the
market is often identified by a code given by a well-recognized institution.1
The basic types of assets are debts and equities which are directly linked to the
economical activities. The debt securities take the form of bonds, bills, deposits,
etc. Equity securities issued by corporations are called stocks or shares representing
claims of the ownership of the corporation. One can invest directly in a certain asset
and receive the return or performance of the asset. For taking benefit of the price
drop of an asset, one may borrow the asset, sell it at its current price and then, buy
the asset back in the future (hopefully at a lower price) and return it to the lender.
1Taking the BNP Paribas SA stock as example, there are RIC (Reuters Instrument Code)
“bnpp.pa”, ISIN (International Securities Identification Number) code “FR0000131104” and
BBGID (Bloomberg Global Identifier) “BNP FP Equity”, etc. In the financial market, terminals
from Bloomberg, Reuters are currently the most used ones providing real-time market data, news,
trading/pricing platform and other services.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_1
34 1 Introduction to Financial Markets
A derivative contract (or simply, derivative) is a financial instrument that derives
its value from the price(s) of some specific transferable asset(s) or security(ies)
(called underlying asset(s) or simply underlying(s)) such as equity securities,
fixed-income securities, foreign currencies, or commodities. The most common
derivatives are forward/futures contracts, swaps and options.
A forward is an agreement between two parties in which the buyer will purchase
a certain asset from the seller at a pre-agreed price, called strike price or exercise
price, at a future time (called expiry date or maturity date). Mathematically, the
payoff for the buyer is St − K, where St is the asset’s price at expiry time t and K
is the delivery price. The level K which makes the forward contract value at zero is
called the (market) forward price of the underlying asset.
A futures contract is a standardized forward contract listed at an organized
market such as a stock exchange.
A swap is a derivative contract whereby two counterparties exchange cash flows
or securities. The standard interest rate swap (IRS) is a typical example in which
one party will pay the cash flows based on a pre-agreed fixed rate and receive the
floating rate based cash flows applied to a specified notional amount.
Roughly speaking, an option is a financial instrument which offers a return
(calledpayofforpayout)thatisasymmetrictotheupsideanddownsideperformance
of the underlying asset(s). The basic options (nicknamed as Vanilla options) are call
optionsandputoptions.Acalloptiongivestheownertherightbutnottheobligation
to buy a certain asset from the seller at a pre-agreed price, called the strike price or
exercise price. The payoff at expiry t of a call option is max{St − K,0}. Similarly,
a put option gives the owner the right but not the obligation to sell the underlying
asset at the strike price (or exercise price). The payoff at expiry t is max{K −St,0}.
Any option other than a Vanilla option is referred to as an exotic option, for instance,
Barrier option, Asian option, etc.
A structured product is a pre-packaged investment strategy based on derivatives
which offers a customized risk-return objective. In the past two decades, we have
witnessed a revolutionary development for structured products and derivatives in
financial markets around the world.
## 1.2 Investment Returns and Risks
The investment return of a non-dividend paying asset for the period between time s
and time t (s < t), is defined as:
R =
Pt − Ps
Ps
or R =
Pt
Ps
− 1, where Pt is the price of the asset at time t.1.2 Investment Returns and Risks 5
The return rate is an annualized concept in general. There are different types of
return rates. For instance, the IRR (Internal Rate of Return) is the value of r which
makes the following equality:
Pt = Ps(1 + r)τ
, where τ represents the number of years for the period [s,t].
Usual measures for the rate of return of an asset or a portfolio are
Price return: it is measured by the portfolio’s value at the beginning and the end of
the period. The dividend payments during the period are ignored.
Total return: it is obtained with all the dividends re-invested back into the assets of
the portfolio with the same proportion. It represents the return of a fully funded
portfolio.
Excess return: It is defined as the portfolio’s total return minus the financing cost
or a relevant interest rate reference. It represents the return of a self-financed
portfolio.
Example 1.1 Consider two assets: Asset 1 and Asset 2. Asset 2 pays a $1 dividend
per unit at time t. The financing cost is 1% on the borrowed amount.
Ps Pt Price return Total return Excess return
Asset 1 19 20 5.26% 5.26% 4.26%
Asset 2 90 99 10% 11.11% 10.11%
Note that the total return for Asset 2 is calculated from 99+1
90 − 1, i.e., assuming
that the $1 dividend per unit of the asset is reinvested.
In financial market, the term long means “in the possession of” and the term
short means the opposite. A long position of an asset will realize a profit if the asset
price goes up and suffer a loss if the asset price drops. The short position of an asset
will realize a profit if the asset’s price drops and lose money if the asset’s price goes
up. The short position can be built by borrowing the asset and then selling it to the
market. For closing the short position, the asset must be bought back and returned to
the asset lender. Financial analysts use the words “bull/bullish” and “bear/bearish”
for describing the rising trend and falling trend of the price of the assets. The term
arbitrage used in finance refers to the transactions leading to a risk-free profit.
Example 1.2 If a trader observes three foreign exchange prices USD/JPY=113.65
(i.e. 113.65 Yen per US dollar), EUR/USD=1.0922, EUR/JPY=124.23, he can
make a risk-free profit of about 0.10 JPY per EUR by the following transactions2:
2For illustration purpose, we assume zero bid/ask spread and zero transaction cost.6 1 Introduction to Financial Markets
– sell EUR/buy JPY at 124.23, and simultaneously,
– buy EUR/sell USD at 1.0922 and buy USD/sell JPY at 113.65.
The most important risks for the financial products include
MarketRisk:itistheriskonthereturnormark-to-market(MtM)priceoftheproduct
caused by the changes of the market price of the related financial assets and other
financial factors;
Counterparty Risk: it arises when one of the parties fails to fulfill obligation towards
the other party;
Liquidity Risk: the uncertainty about the terms and ability to make, unwind or hedge
a transaction.
## 1.3 Performance Measures
There are many indicators that are used for measuring the performance of an
investment strategy or an investment fund (aggregated form of investment) other
than its total return R. The most popular ones include
Sharpe ratio = (R − r)/“standard deviation of (R − r)”, where r is the return of a
risk-free investment.3 It is the most used measure for risk-adjusted excess return.
Information ratio = (R − RBM)/“standard deviation of (R − RBM)”, where RBM
is the return of the relevant benchmark (e.g. an equity index, if the investment
portfolio is composed of stocks).
Sortino ratio = (R − r)/“downside deviation”, where “downside deviation” is
the standard deviation obtained with negative returns only.4 This measure is
preferred by people who consider that the Sharpe ratio punishes the “good risk”
as the positive returns are also used in its standard deviation calculation.
Maximum drawdown: the peak-to-trough decline in percentage during the consid-
ered period of an investment. For the considered period [t1,t2], it is defined as
m(ˆ t,t2)
M(t1,t2)
− 1, where M(t1,t2) is the highest price which is achieved at time ˆ t,
and m(ˆ t,t2) is the lowest price after ˆ t.
3Strictly speaking, there is no such thing as risk-free investment or risk-free asset. People often
approximate it by the return of government debt or bank deposit. The real financing rate can also
be used in certain circumstances.
4Downside deviation can be calculated by

252
n
n
i=1 min{Ri,0}2 where Ri represents the return
of the i-th business day, n the total number of business days for the considered period, and 252 the
number of business days in a year.1.4 Financial Markets 7
## 1.4 Financial Markets
A financial market designates the aggregate of participants, organizations and facil-
ities in which people trade financial securities (e.g. stocks and bonds), currencies
and commodities at prices that reflect supply and demand. The participants include
financial institutions (such as banks, insurance companies, pension funds, mutual
funds, hedge funds), individual investors and corporations.
The financial market can be detailed by the type of services it offers:
Capital markets: which provide financing through the issuance of shares and debts,
and enable the subsequent trading thereof. Capital markets include debt and
equity markets.
– Equity market (also known as Stock market) allows the participants to buy
and sell stocks of (publicly traded) companies. The value of a stock reflects
theviewabout theexpected dividend payments, futureearnings,and resources
that the company will control.
– Debt market (or Fixed-income market) includes bond market which deals in
government, corporate and other bonds for long term financing, and money
market for short term (up to 1 year) debt securities such as bank deposits,
treasury bills, certificates of deposit, commercial papers, etc.
Foreign exchange market: where currencies are bought and sold.
Commodity market: where commodities such as precious metals, industrial metals,
energy products and agricultural products are traded. Futures contracts are
the most convenient instruments for commodities trading activities. A futures
contract may be sold out before the commodity is due to be delivered.
Derivatives market: where futures, swaps, options and other derivatives are trans-
acted.
The financial market can also be classified with other criteria, such as
Primary market: where new issues are first sold through IPOs (Initial Public Offer-
ings). The primary market business for debts and stocks is covered respectively
by DCM (Debt Capital Market) and ECM (Equity Capital Market) divisions of
the Corporate Finance entity in the investment banks.
Secondary market: for all subsequent trading after IPO between market participants.
It constitutes the support for the financial products for investment and risk
management.
When classified by market organization, there are
Listed market: public auction market such as Stock Exchanges, e.g. Euronext,
New York Exchange, Nasdaq, Hong Kong Exchange; The exchanges are usually
private companies and may be listed themselves.
OTC (Over-The-Counter) market: where buy/sell contracts are made between the
two counterparties. OTC market is often animated by brokers as intermediary
agents.8 1 Introduction to Financial Markets
## 1.4.1 Centralized Clearing
As an OTC derivative involves potential payments between the parties in the future,
the counterparty risk that one party does not pay as obligated in the contract can
not be neglected. To mitigate the counterparty risk, the long and short parties of a
derivative contract may transact with the “Central Clearing House” which covers
the risk by a collateral deposit system known as the margining system.
For illustration purpose, we take the case of futures contracts transacted at a
Futures Exchange serving as the central clearing house.
– The buyer and seller should have their “margin account” in place before trading
futures.
– At the contract inception, both parties will deposit an “initial margin”, fixed by
the exchange according to the type and price of futures, as collateral which are
typically cash or government bonds.
– At the end of each trading session, each party will have their margin account
debited or credited for the daily P/L (Profit and Loss, or PnL).
– A minimum margin level called “maintenance margin” is required for every
margin account. If the account value is below this level, a “margin call” will
be issued for bringing back the account to the level of initial margin.
Seller
Clearing House
of the Exchange
Buyer
N contracts N contracts
daily margin daily margin
1.4.2 OTC Derivatives Documentation and Counterparty
Risk Management
The financial institutions offering derivative products and services control and
monitor their counterparty risk with the trading counterparty. Some products such
as a deposit or a structured note imply one-way counterparty risk where the end
investor takes the counterparty risk of the financial institution but the financial
institution has no risk from the end investor. However, in some other products such
as forward and swap, both parties are taking counterparty risk. The growth of OTC
derivatives business prompted the standardization for the contract terms as well as
the counterparty credit risk management which are widely used by the institutions
and corporates actively involved in financial market.1.5 Securities Borrowing & Lending and Repo 9
ISDA (International Swaps and Derivatives Association) Master Agreement,
initially developed in the 1980s to cover the IRS and currency swaps, has been
progressively updated to include the derivatives such as forward, swap and option
linked to equities, commodities and funds. It sets out standard terms applied to all
trades between the two parties.
In general, two parties set up their trading relationship for OTC derivatives by
negotiating the applicability and eventual adjustment of the standard terms. The
document containing the agreed terms is the ISDA Master Agreement signed by
both parties.
CSA (Credit Support Annex) is the document for credit support (i.e. collateral)
for derivative transactions. It defines the acceptable collaterals with the “haircuts”.
In particular, it defines the “Threshold” which is the consolidated MtM level of
all the trades to trigger the margin call. The “Independent Amount (IA)” is the
initial margin (collateral) required by one party (usually the dealer) to the other
party (usually the end user) for mitigating the counterparty risk linked to an OTC
transaction. It is returned only after the termination of the transaction. Its level
depends on the volatility of the mark-to-market value of the trade as well as the
credit worthiness of the counterparty. During the life of the trade, “variation margin”
will be exchanged according to its mark-to-market.
The institutions and corporates actively transacting derivatives usually establish
an ISDA/CSA Master Agreement with their counterparties. Normally, the credit
agreement between two financial institutions is a two-way CSA in which both
parties may post margins for their OTC trades. Between a financial institution and a
corporate (especially the small ones), the credit agreement may be a one-way CSA,
meaning that only the corporate posts margins to the financial institution. Under a
master agreement (ISDA/CSA or any bespoke master agreement), the specific terms
and conditions of each OTC derivative trade will take a short form called term sheet
or transaction supplement. The individual investors, small corporates and other non-
active entities involved in financial market normally trade with financial institutions
with a bespoke agreement or a long form confirmation which contains all terms and
conditions for each trade.
## 1.5 Securities Borrowing & Lending and Repo
A repurchase agreement is a contract for the sale of a security (e.g. stock or bond)
with a commitment by the seller to buy the same security back from the buyer at
a specified price at a future date. During the tenor of the trade, the seller (also
called the lender) of the security surrenders the legal ownership of the security.
There are two activities based on the repurchase agreement: Securities Lending
and Repo.10 1 Introduction to Financial Markets
Securities Borrowing & Lending (SBL) transaction allows the lender to lend
securities to the borrower on either “Open” (i.e. anytime callable) or “Term” (a
fixed tenor) basis. Upon the trade termination, the securities will be returned to
the lender. The borrower posts collateral with daily adjustment and pays fees to
the lender. The fee rate depends on the borrow supply/demand for the underlying
security. The eligible collateral can be cash or other securities negotiated by the
parties. The cash collateral level is usually ∼105% of the latest closing price of the
security. The International Securities Lending Association has developed a standard
agreement called Global Master Securities Lending Agreement (GMSLA) which is
followed by most of the institutions. The motivation for the borrower includes short
position recovering, hedging of derivatives, corporate action arbitrage, etc.
In a sale and repurchase agreement (Repo), one counterparty (the repo seller) is
borrowing money and providing collateral (mostly fixed-income assets) for the loan.
See Fig.1.1 for reference. The seller gains access to funds at lower funding costs
than are typically available elsewhere as the loan is collateralized. The collateral
eligibility and haircuts are negotiable between the repo counterparties. The standard
agreement for Repo is Global Master Repurchase Agreement (GMRA), published
by the International Capital Market Association (ICMA). A Reverse Repo is the
opposite transaction seen by the other counterparty of the Repo trade. Some central
banks use Repo/Reverse Repo operations to regulate the money supply in the
financial system.
Ifthecollateralisheldatathirdparty,usuallyacustodianbankoraninternational
central securities depository, the transaction is call a Tri-Party Repo or Tri-Party
Securities Lending. The third party will provide services such as the valuation
and adjustment of the collateral. The risk in a Tri-Party Repo transaction is the
correlation of the default probability of the counterparty and the value of the
collateral in custody.
Although most Repo activities take place on the OTC market, there exists
Stock Exchange Repo (e.g. Shanghai Stock Exchange Repo) whereby the exchange
determines the collateral pool and haircuts, standardizes the contract features such
as size and tenor, and facilitates clearing and pledge of collateral.
Inception:
Party A
(Seller)
Party B
(Buyer)
Party B
(Buyer)
Collateral
Cash
GMRA
Termination:
Party A
(Seller)
Collateral
Cash + Interest
Fig. 1.1 Illustration of a Repo transaction1.6 Derivatives Activities 11
## 1.6 Derivatives Activities
The derivative instruments are used by the end-users for various purposes including
but not limited to
Exposure for a specific view: derivatives can be used for gaining exposure to a
specific view on future price changes. For instance, one believes that the price
of an equity index will move significantly in either direction for a certain time
horizon, he/she may buy a call and a put at the same time.
Hedging: which means offsetting or reducing the impact of the price change of the
considered asset or product. For instance, a US dollar based company is expected
to receive a cash flow in Euro in 3 months. The company, concerned by the
currency exchange rate risk, may choose to short a 3 month EUR/USD forward
transaction for selling the cash flow in Euro into US dollars at a fixed exchange
rate. So, at any time until the expiry of the forward contract, the change of the
USD value of the future cash flow in Euro will be offset by the value change of
the forward contract.
Leverage: derivatives allowleveraged exposuretotheunderlyingasset.Forinstance,
an investor has a bullish view on a stock for a horizon of one month. But instead
of investing for N stocks, the investor chooses to buy a 1-month call option. He
then obtains the upside exposure for the N stocks with only the premium of, say,
3% of value of the stocks. In that sense, his investment is leveraged.
The investment banks as well as some other financial institutions offer the
derivative products as a service to the clients (end-users) and earn commissions
for their service. Their business model is to offer products with none or limited
risk taking by replicating the payoffs of the products with other liquid securities so
that the profit or loss of the clients will be offset by the replication position. It is
a common mis-understanding that the derivative provider (underwriter, issuer) and
the client are playing a zero-sum game where the client makes money when the
provider loses money and vice versa. Derivative is a double-edged sword: it can
help to hedge out risks but it may also allow the user to increase the risk exposure.
The risk of some derivatives may be complex and difficult to understand for non
sophisticated investors. The regulators for financial industry as well as the financial
institutions keep implementing measures to prevent selling products that are not
matching the profile of investors.
The pricing of a derivative product is based on its replication cost which has no
or limited impact from the demand or offer for the product. The pricing and hedging
(replication) of derivatives are based on the same techniques which constitute one of
the main purposes of this book. In contrast, the price of a basic asset such as stock,
currency, commodity is driven by the long term fundamentals and the short term
demand/offer. There are abundant literature and textbooks on the pricing of these
assets. Readers may refer to [64].12 1 Introduction to Financial Markets
Exercises
1. An order book contains a list of buy (known as bid) orders with corresponding
buy sizes and sell (known as ask) orders with corresponding sell sizes raised by
market participants. The following is an order book for a security A.
Bid volume Bid price Ask price Ask volume
500 100 101 500
1000 99 102 500
1500 98 103 1000
. . .
. . .
. . .
. . .
An investor wants to buy 2000 shares of security A using a market order, i.e.,
regardless of price level. Calculate the average price of their total positions in
security A.
2. Let Pt be the price of a non-dividend paying asset at time t. Find out under what
condition the log-return defined as ln(Pt/Ps) for s < t is a close approximate of
the standard return (Pt − Ps)/Ps.
3. Investors are becoming more aware of alternative asset classes for diversifying
risk. Look up the one known as aircraft leasing and describe its characteristics.
4. Consider a new private fund with initial NAV (Net Asset Value) of 100. The
investment started on 2 Jan 2017 and is fully invested in Stock A. On 15 April
2017, the fund switched all the investment into Stock B. On 3 July 2017, fund
paid a cash dividend of 3% of the fund NAV. The interest rate is 3% applicable
with the formula 3% × number of days/365 for calculating the interest. For
simplifying the exercise, we make the assumptions of zero transaction cost, zero
management fee and that we can trade a fraction of a stock. The stock prices are
given as follows
Date Price of Stock A Price of Stock B
## 2 Jan 2017 20 180
## 15 Apr 2017 22 160
## 3 Jul 2017 21.5 190
## 15 Sep 2017 23 198
Calculate the below values at 15 Sep 2017:
• Fund NAV
• Total Return
• Price Return
• Excess ReturnChapter 2
Interest Rate Instruments
In this chapter, we will cover the well-known fixed-income instruments and their
derivatives, and most importantly, how to construct a yield curve from liquid market
products. The yield curve serves as the foundation for extracting interest rates that
are used in financial calculation.
A fixed-income instrument, also referred to as a debt security, generally pays
the return on a fixed schedule, though the amount of the payments can vary. The
risks of debt securities are mainly interest rate risk, credit risk and liquidity risk.
Fixed-income instruments can be classified by their maturities (defined at the time
of issuance):
short term: money market instruments including treasury bill, commercial paper
(CP), bank deposit, and etc.;
long term: bonds, notes, asset-backed securities (ABS), and etc.
## 2.1 Interest Rate Conventions
The maturity, a time measure with units in years, is an important parameter in fixed-
income products. The financial calculation in each fixed-income instrument follows
specific conventions.
## 2.1.1 Day Count Convention
The day count convention determines the time period in years to be used for
calculating the interest for the investment in financial instruments. It is also used
for calculating the present value of financial assets through discounting. Generally,
the first day (d1/m1/y1) of the considered period is included and the last day
(d2/m2/y2) is excluded.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_2
1314 2 Interest Rate Instruments
1. 30/360 methods are a class of calculation methods with the following general
formula
Day Count Fraction =
360 × (y2 − y1) + 30 × (m2 − m1) + (d2 − d1)
360
,
where y, m, and d stand for year, month, and day respectively as in a calendar
system.
A non-exhaustive list includes “30/360 US” (also called “bond basis”),
“30E/360” (also called “Eurobond basis”), in which different treatment of d1
and d2 is involved.1
2. ACT methods, where ACT stands for actual, are widely-used and mainly utilize
the number of days between two dates, denoted by d2 − d1. For instance,
ACT/360 (also called “money market basis”):
d2 − d1
360
ACT/365 (also called “English money market basis”):
d2 − d1
365
ACT/ACT ISDA:
Days in a non-leap year
365
+
Days in a leap year
366
.
## 2.1.2 Business Day Convention
A business day convention specifies the adjustment when a date used in calculation
is not a business day. The most common ones are: Following – the following
business day; Preceding – the preceding business day; Modified Following – the
following business day unless the day is in the next calendar month, in which case
the adjusted date is the preceding business day; End-of-Month – where the start date
of a period is on the final business day of a particular calendar month, the end date
is on the final business day of the end month.2
## 2.2 Interest Rate Types and Zero Coupon Bond
An interest rate represents the time value of money, measured as the value change
per annum (e.g. 2.10% p.a.). It is the cost of borrowing money or the return for
lending money. There are several types of interest rate. Some of them are used in
1For instance, in 30/360, if d1 is 31, then change d1 to 30. If d2 is 31 and d1 is 30 or 31, then
change d2 to 30. But under 30E/360, if d1 is 31, then change d1 to 30. If d2 is 31, then change d2
to 30.
2E.g. Start date Friday, 29-Apr-2011, period 1 month: end date will be 31-May-2011 (29-Apr is
the last business day of the month).2.2 Interest Rate Types and Zero Coupon Bond 15
the financial contracts for the determination of cashflows; Some others, e.g. the
continuous interest rate, are not directly used in real financial contracts and have
been introduced for comparison and calculation purposes.
## 2.2.1 Simple Rate
Simple interest rate (rm) is applied to calculate the terminal amount MT based on
the initial amount M according to the following formula:
MT = M(1 + rmT).
In the money market, the interest-bearing instruments (e.g. bank deposit, certificate
of deposit, etc.) use this type of interest rate. Hence, it is also referred to as money
market rate.
On the other hand, a non-interest-bearing instrument in the money market such
as a treasury bill and a commercial paper is quoted in price for receiving a fixed
amount at maturity. The implied rate measuring the discount is called discount rate
(rd) which satisfies: M = MT (1 − rdT).
## 2.2.2 Compound Rate
A compound rate assumes the re-investment of the interests from the investment.
Suppose you deposit M in a bank at the interest rate of r with annual payments.
At the end of year one, the bank account value will become M(1 + r). After two
years, you will have M(1 + r) · (1 + r) = M(1 + r)2. After T years, your account
value will be MT = M(1 + r)T . If it is compounded m times per annum (i.e. the
interests are paid m times a year), the terminal value of the investment after T years
will be
MT = M

1 +
r
m
m×T
. (2.1)
## 2.2.3 Continuous Rate
The pricing of financial derivatives often involves continuous-time modelling. The
interest rate used in continuous time modelling is a compound rate applied to
infinitesimal time intervals.16 2 Interest Rate Instruments
In (2.1) for compound interest rate, if we apply compounding with very small
time intervals of Δt per annum, we obtain the continuous interest rate r as the
limiting case:
MT = lim
Δt→0
M

1 +
r
1/Δt
(1/Δt)×T
= MerT
.
Alternatively, we can assume the differential equation dMt = rMtdt which is the
limiting expression of ΔMt = rMt−ΔtΔt with Δt → 0. Its resolution shows the
same result: MT = MerT .
More generally, if the continuous rate is a function of time, the term instanta-
neous interest rate will be used. It is denoted as rt. The resolution of dMt = rtMtdt
over the time period [t,T] leads to
MT = Mte
T
t rsds
.
The constant rate rt = r can be considered as a particular case:
MT = Mter(T−t)
.
## 2.2.4 Relationship Between Interest Rates
One can easily transform rates of different types through the equivalence in cash-
flow value. For instance, the continuous rate r is not directly observable from the
financial instruments in the market. However, r can be derived from the money
market rate rm by
1 + rmTm = erT
, or equivalently r = ln(1 + rmTm)/T,
where Tm is the day count fraction under the day count convention of the money
market instrument while T usually follows ACT/365 or ACT/ACT.
Due to the interchangeability of the interest rate types, we are indifferent
regarding the choice of the rate type to be used in financial calculation.
## 2.2.5 Zero Coupon Bond
A zero coupon (ZC) bond (also called discount bond), denoted by Pt(T), represents
the time-t value of an instrument paying out $1 value at maturity T. For simplifying
the notation, we will use P(T) for P0(T). The zero coupon bonds constitute the
building blocks for financial calculation. It can be used as a discount factor for
calculating the present value of future cashflows.2.3 Money Market 17
Zero coupon bonds for different maturities can be extracted from market traded
instruments (the extraction process, known as bootstrapping, will be explained in
the last section). Conversely, the interest rate for a specific instrument in the market
can be represented by zero coupon bonds. Since the interest rates embedded in
different instruments follow different calculation conventions which may not be
compared in a straightforward way, it is convenient to use zero coupon bonds as
the base tradable assets in financial calculation.
The market price (or fair value) of a future cash-flow MT is called the present
value (PV) of MT . It can be expressed as
PV = P(T) × MT .
Note that the term zero coupon bond under modelling context is an abstraction
of the zero coupon bond issued by a real entity to be presented in the next section.
## 2.3 Money Market
## 2.3.1 Money Market Instruments
Money market instruments are short term fixed-income securities with tenor up to 1
year, typically,
– Deposit: issued by deposit taking institutions such as banks and credit unions;
Deposits are not transferable.
– Treasury Bills (T-Bills): transferable short term government debt;
– Certificate of Deposit (CD): transferable short term debt issued by banks;
– Commercial Paper (CP): transferable short term debt issued by corporates;
– Banker’s Acceptance (BA): involved in international trade transactions, it is a
promised future payment, or time draft, which is accepted and guaranteed by a
bank. After acceptance, the holder of the draft can hold it to maturity or sell it at
the discounted value. It is a transferable instrument.
– Repo: a collateralized loan which is not transferable.
## 2.3.2 Interbank Lending Market
It is a market for the short term lending/loan between banks for various purposes
including the regulatory capital requirement. The interest rates in the interbank
market are published every day. Financial institutions including banks, mortgage
lenders and credit card agencies set their own rates relative to them.
Financial products often use these reference rates for their returns. The most used
reference rates include18 2 Interest Rate Instruments
Libor (London Interbank Offered Rate): it is a daily indicator for the average offered
interest rates from the contributor banks in London published at around 11:55am
London time by ICE (Intercontinental Exchange). So far, the major convertible
currencies (currently, USD, EUR, GBP, JPY, CHF) are covered for the tenors:
overnight, one week, 1M, 2M, 3M, 6M and 12M.
Euribor (Euro Interbank Offered Rate): similar to Libor, Euribor is a daily indicator
for the average offered interest rates from the panel banks in Eurozone published
by the European Money Markets Institute at around 11:02am CET (Central
European Time).
Eonia (Euro Overnight Index Average): computed as a weighted average of all
overnight unsecured lending transactions in the Euro interbank market.
Fed funds rate (Federal funds rate): the effective fed funds rate is the weighted
average overnight rate at which depository banks in US lend to each other.
The overnight rate in a country is monitored by the central bank, which may
influence the rate level according to its monetary policy.
## 2.4 Bonds
## 2.4.1 Bond Features and Types
Bond is a long term debt security. It has a face or par value (also called the principal
amount) which is the payment promised by the bond issuer. Bonds may be classified
according to the coupon payments:
coupon bearing bond making periodic payments known as coupons over the
lifetime of the bond, plus the repayment of the face value (usually at maturity).
Typically, the coupon payment frequency is every 6 months or every year. The
fixed rate bond pays coupons with a fixed rate. It is the most common bond type.
The floating rate note (FRN) pays coupons linked to a reference rate, e.g., 6M
USD Libor+spread.
zero coupon bond which does not pay any coupon and only pays the bondholder
the face value at maturity. Its sensitivity to interest rate is higher than a coupon
bearing bond of the same maturity. Zero coupon bonds can be stripped from a
coupon-bearing bond.
Bonds can also be classified according to other criteria such as the type of issuer,
special features:
Issuer:Treasurybonds(Govies)–issuedbygovernments, oftenconsideredascredit
risk free instruments; Corporate bonds – usually with higher yield than Treasury
bonds; Municipal bonds – often give tax benefits to interest income; Foreign
bonds – issued by foreign corporates, e.g.: samurai bonds (issued in Japan,
denominated in JPY), dim-sum bonds (in Hong Kong, CNH), panda bonds (in
China, CNY), masala bonds (outside of India, INR), and etc.;2.4 Bonds 19
Seniority: Senior bonds have higher priority than Subordinated bonds for repay-
ment and claim on the asset in case of issuer’s liquidation;
Others: A convertible bond (CB) can be converted into a predetermined amount of
the issuing company’s equity at the discretion of the bondholder; Inflation index
bond has its coupons and principal indexed on an inflation index, e.g., treasury
inflation protected securities (TIPS).
Some bonds embed the callable feature giving the issuer the right to buy back
the bond at a predefined price on the “call dates”, or the puttable feature which
allows the bondholder the right to sell back the bond at a predefined price on the
“put dates”.
## 2.4.2 Main Risks for a Bond
The main risks for a bond are
– credit risk which is linked to the probability of default of the issuer before the
maturity of the bond; Higher the default risk, lower the price of the bond;
– market risk which is linked to the interest rate changes. Higher interest rate will
result in lower bond price because the future cashflows will be less valuable;
– liquidity risk which is linked to the transaction bid/ask spread. A bond with
smaller issuance size tends to have higher liquidity risk.
## 2.4.3 Bond Quotation and Yield to Maturity
The bond price is the sum of present values of all the expected future cash flows.3
In the market, bonds are quoted in either of the units below:
Dirty price (also called full price or invoice price), which is commonly used in the
European bond markets, is the price that the buyer will pay to the seller. For a
fixed coupon bond, it is simply
Bond Dirty Price =
n
i=1
CFi × P(ti),
where CFi is the future cash flow of the bond payable at time ti, i = 1,...,n;
Clean price, which is mostly used in the US bond markets and is defined as
Clean Price = Dirty Price − Accrued Coupon.
3The expectation is calculated with the “risk-neutral probability measure” which will be presented
in the modelling part of the book.20 2 Interest Rate Instruments
The accrued coupon is the interest that has been earned but not yet paid. The coupon
calculation method is described in the bond prospectus which usually follows the
money market convention.
We note that
(1) Transaction settlement is always done at dirty price;
(2) Clean price is more stable over time than dirty price which changes its value
due to the accrued coupon, in addition to any economic reasons.
Yield to maturity (also called IRR, the Internal Rate of Return) of a fixed coupon
bond is the unique yield y which satisfies the following relationship:
Bond Full Price =
n
i=1
CFi
(1 + y/q)ti
,
where
q: number of coupon payments per year, e.g. 2 for half-yearly coupon payments;
ti: the number of periods from settlement date to the i-th coupon payment date. For
instance, with ACT/ACT convention, t1 = τ/m1 and ti = i − 1 + τ/m1 for
i > 1 where τ is the number of calendar days from the settlement date to the 1st
future coupon payment date and m1 is the total number of days from the previous
coupon payment (or the bond settlement date at issuance) date to the 1st coupon
payment date.
If a bond pays a constant yearly fixed coupon rate C with final redemption at par,
the yield to maturity satisfies
Bond Full Price =
n−1
i=1
C
(1 + y)ti
+
1 + C
(1 + y)tn
,
where n is the number of coupon payments.
In the market, there are several other measures used for the return of the bond
investment, e.g., current yield, simple yield (also called Japanese yield),4 etc.
Example 2.1 Consider a fixed coupon bond in the secondary market:
Face value: $1,000 Maturity date: 15 Nov 2017
Coupon rate: 3% p.a. Day count: ACT/ACT
Coupon frequency: semi-annual
4Current Yield = Coupon Rate/Clean Price, which does not reflect the price impact on disposal
of the bond. Simple Yield = (C + Adj)/Clean Price, where Adj = (Final Redemption Value –
Clean Price)/Life to Maturity.2.5 Credit Rating 21
An investor bought the bond at 99.583% of the face value (or $995.83) with
settlement date at 05 Jan 2017. The future coupon dates are on 15 May and 15 Nov.
There are 130 days between the settlement date and the next coupon date (15 May
2017). The total number of days between the previous coupon date (15 Nov 2016)
and the next coupon date is 181.
The yield to maturity is 4% because 3%/2
(1+4%/2)
130
181
+ 1+3%/2
(1+4%/2)
1+130
181
=
99.583% = Price of the bond. There are 51 days from the previous coupon
date to settlement date 05 Jan 2017. Hence, AccruedCoupon = 3%
2 × 51
181 =
0.4227% and CleanPrice = 99.583% − 0.4227% = 99.160%.
## 2.4.4 Duration and Modified Duration
Duration (also called Macaulay Duration) is defined to be the averaged life of
present value of all future cash flows from the bond:
Duration =
n
i=1
ti ×
CFi
(1 + y)ti
/Price.
Modified Duration (MD) measures the percentage change of price w.r.t. the yield
change which is defined to be
MD = −
dPrice
dy
/Price.
The direct calculation of the derivative leads to
MD = Duration/(1 + y).
## 2.5 Credit Rating
Credit rating is a measure for the riskiness of the bond given by a credit rating
agency. The three major agencies are Standard & Poor’s, Moody’s and Fitch. For
instance, the decreasing credit rating levels from S&P are AAA, AA, A, BBB, BB,
B, CCC, CC, C.5 Each category has three notches, e.g. A+, A, A−. The bonds with
ratings at or above BBB− are called investment grade (IG) bonds.
5For AAA bonds, the averaged default probability in 5 years is ∼0.10%. For BBB bonds, the default
probability in 5 years is ∼1.9%.22 2 Interest Rate Instruments
## 2.6 Forward Rate Agreement
The forward rate agreement (FRA) is a loan/deposit engagement with a pre-agreed
fixed rate (K) which will start at a time in the future T1 and will terminate at time
T2. There are 3 dates in an FRA contract (T0 < T1 < T2):
T0: inception date;
T1: expiry (or effective date) of the forward contract;
T2: termination date.
The notation T1×T2 isused toput emphasison theeffective dateand thetermination
date for an FRA contract.
Example 2.2 The following is a 3 × 6 FRA trade.
Notional amount: USD10m Fixed rate: 1%
Effective date: in 3 months Reference rate: USD 3M Libor
Terminal date: in 6 months
The settlement to the long position of an FRA may be either of the below
amounts:
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
Notional Amount ×
(r − K)δ
1 + rδ
, for settlement at T1, which is the market
practice for FRA
Notional Amount × (r − K)δ, for settlement at T2,
where
r: the reference rate (e.g. Libor) fixed at T1 for the period T1 → T2;
δ: day count fraction calculated with the applicable convention;
K: fixed rate in the FRA contract.
Proposition 2.1 For the market FRA with zero PV at inception, the fixed rate K is
K =
1
δ

P(T1)
P(T2)
− 1

.
Proof The proof is done by replication (i.e. hedging) with zero coupon bonds of
maturities T2 and T1. The short position of FRA for 1 dollar notional amount can be
hedged with the below self-financing transactions.2.7 Interest Rate Futures 23
At inception T0: Short T2-ZC bond A of P(T1)
P(T2) dollars nominal. Its PV is
P(T1)
P(T2)P(T2) = P(T1); Long a T1-ZC bond B of 1 dollar
nominal. Its PV is also P(T1). Hence the total investment
is flat.
At effective date T1: Buy back A at its market price 1
1+rδ
P(T1)
P(T2), in which 1
1+rδ is
the PV of 1 dollar at T2; Receive 1 dollar as B matures at T1.
In the absence of arbitrage, the PnL at T2 should be equal to the FRA settlement
amount:
PnL = 1 −
1
1 + rδ
P(T1)
P(T2)
=
(r − K)δ
1 + rδ
.
We obtain hence K = 1
δ

P(T1)
P(T2) − 1

. 
## 2.7 Interest Rate Futures
Interest rate futures are exchange listed forward contracts with standardized fea-
tures. Their prices reflect market expectation for interest rates and constitute a
building block of the interest rate market. The main advantages of futures contracts
are
– mitigated counterparty risk
– leveraged exposure
– high liquidity
– price transparency
– low transaction cost
Interest rate futures are actively used for hedging interest rate risks. They are
also preferred instruments for market participants to get exposure for their view on
interest rate market.
## 2.7.1 Short-Term Interest Rate (STIR) Futures
STIR futures are standardized FRAs listed at the exchange. The time-t quotation of
the futures contract with expiry at T is
Price(t,T) = 100 × [1 − r(t,T)],24 2 Interest Rate Instruments
where r(t,T) is the forward rate which is normally the time-t market expected value
of the interest rate (e.g. USD 3M Libor) to be observed at T. The Eurodollar futures,
launched by the Chicago Mercantile Exchange (CME) in 1981, is a typical example
of STIR futures.
Example 2.3 The following is a Eurodollar futures contract. The PnL per contract
for the investor will be determined by the purchase and sale price difference in basis
points times the BPV in the table.
Contract unit USD 1 million face value, 90-day Eurodollar time deposits
Quotation 99.250
Final settlement Cash settlement for the price difference
Contract months Nearest 40 months (i.e., 10 years) in the March quarterly
cycle (Mar, Jun, Sep, Dec), plus the nearest 40 months not
in the March quarterly cycle e.g. on Jan 30, 2016, we see
the contracts: Feb-16, Mar-16, Apr-16, May-16, Jun-16,...
Last trading day 2nd London business day prior to the 3rd Wednesday of
contract month
Trading in expiring contract closes at 11:00 a.m.
Margin Daily margin settlement for MtM P/L
Basis point value(BPV) $1,000,000 × ( 90
360) × 0.01% = $25
## 2.7.2 Treasury Bond Futures
The underlying of a Treasury Bond Futures contract is a virtual (or “notional”)
security with standardized features for the coupon rate, the maturity and the
size. The futures contract applies physical delivery at the expiry. There is a set
of deliverable bonds associated with each contract which is determined by the
exchange.
For example, the most active futures in Europe is of 10Y maturity with EUR
100,000 size and 6% coupon.6 The set of deliverable bonds is published by EUREX
with remaining maturities of 8.5Y → 10.5Y. In US, there are 2Y, 3Y, 5Y, 10Y
Treasury Note Futures, Treasury Bond Futures (deliverable bonds of 15Y → 25Y)
and Ultra T-Bond Futures (deliverable bonds of >25Y).
6The coupon level may be subject to change in order to be close to the market yield levels at the
launch of new contracts.2.8 Interest Rate Swap 25
Treasury bond futures are related to notional bonds but delivered with real bonds
from a pool of eligible bonds and notes. For each deliverable bond, a conversion
factor (CF)7 is applied to convert the futures contract price into the “price for the
bond”:
Price for the Bond = CF × Futures Price+Accrued Coupon.
At settlement, for each deliverable bond, the short party will
– receive the cash amount based on “price for the bond”
– deliver the bond from the pool of eligible ones.
The market price of the bond to be delivered and the “price for the bond”
will be normally different. The bond showing the lowest value of “market price”
minus “price for the bond” is called the Cheapest-To-Deliver (CTD) bond. This
phenomenon is due to the fact that the market yield curve is not 6% flat in general.
Moreover, the bonds have different sensitivities to the yield curve change due to the
different characteristics including coupon and time to maturity.
## 2.8 Interest Rate Swap
An interest rate swap (IRS) is a contract that entails periodic payments between two
counterparties for the term of the trade. The swap market is very large and liquid.
Swaps are used to hedge long term interest rate risks. The market standard IRS (or
plain vanilla IRS) is the “Fixed-Floating” trade with two legs:
Fixed leg: one party will pay the cash-flows calculated with a fixed interest rate as
predetermined in the contract;
Floating leg (or Variable leg): the other party will pay the cash-flows calculated
with a reference (e.g. USD 3M Libor)+spread. For each period, the Libor rate
based floating rate will be fixed at the beginning of the period and the cashflow
will be paid at the end of the period.
7For US Treasury Bond Futures, the conversion factor is calculated as the clean price of the
delivered bond as if it were yielding 6%. (Note that the price of the Futures contract is at par
of the face value if the market yield is 6% flat.)
For example, the CF for a 5% bond with 15 years and 3 months remaining maturity is
CF =
 30
i=0
2.5%
(1 + 3%)i
+
100%
(1 + 3%)30

/(1 + 3%)
3
6 − 2.5% ×
3
6
.26 2 Interest Rate Instruments
In the market vocabulary, the fixed rate payer (receiver) is referred to as the “swap
payer” (“swap receiver”). Other combinations (“Fixed-Fixed”, “Floating-Floating”)
can be composed by “Fixed-Floating” trades.
An illustration example of a swap is as follows:
Maturity: 5 years
Notional Amount: USD 10m
Fixed Leg: 1.208775%, payable at the end of each semi-annually period
Floating Leg: USD 3M Libor, payable at each quarter end
Inception Maturity
3M Libor
1.
...
208775%p.a.
Swap Receiver
Swap Payer
The valuation of an interest rate swap in general is based on the cost of
replication. The time-0 PV of a receiver swap is simply the PV of the cash-flows
of fixed leg minus the PV of the cash-flows of floating leg:
Swap PV = PVf
− PVv
=
m
j=1
P(tj)sδj −
n
i=1
P(ti)F(ti−1,ti)δi,
where
m,n: respective number of remaining cash-flows for the fixed leg and the floating
leg;
s: rate of the fixed leg;
F(ti−1,ti): expected forward rate8 for the i-th period (ti−1,ti);
δi: the day count fraction for the i-th period (ti−1,ti).
8The expectation needs to be calculated under risk-neutral probability measure as explained in
modelling part of the book.2.8 Interest Rate Swap 27
## 2.8.1 Standard Swap
For standard (Vanilla) IRS, the valuation can be further simplified. From Proposi-
tion 2.1, the market quote for the floating rate is F(ti−1,ti) = 1
δi

P(ti−1)
P(ti) − 1

.
Replacing F(ti−1,ti) in the PV of the floating leg:
PVv
=
n
i=1
P(ti)F(ti−1,ti)δi
= [P(t0) − P(t1)] + [P(t1) − P(t2)]··· + [P(tn−2) − P(tn−1)]
+ [P(tn−1) − P(tn)]
= P(t0) − P(tn).
At the inception of the swap, P(t0) = 1. Hence, we obtain PVv = 1 − P(tn).
This can be understood by the fact that the PV of an investment receiving regular
market floating rate based interests and the initial investment back at the end should
just be the value of the initial investment. A market swap is quoted with the fixed
rate level which makes the swap valuation at zero at inception, i.e. PVf = PVv.
From the above, we have
m
j=1
P(tj)sδj = 1 − P(tn).
Hence the rate is given as
s =
1 − P(tn)
A(tm)
.
where A(tm) =
m
j=1
P(tj)δj is called the annuity factor.
## 2.8.2 Overnight Indexed Swap (OIS)
An overnight indexed swap (OIS) is an interest rate swap where the cash-flow of the
floating leg is based on a floating rate calculated from the overnight rates such as
Eonia or effective fed funds rate for the concerned period.
Consider the example of Eonia which is quoted on ACT/360. The floating rate
for OIS of the k-th period (tk−1,tk) will be calculated as the geometric average of
Eonia fixings:28 2 Interest Rate Instruments
Rk =
⎡
⎢
⎣
Nk
fix

i=1

1 +
ri × ni
360

− 1
⎤
⎥
⎦
360
Nk
,
where
Rk: rate for OIS of the k-th period
Nk
fix: total number of fixings of the overnight rate for the k-th period
ri: Eonia fixing rate for day i
ni: number of calendar days covered by ri
Nk: total number of calendar days for the k-th period
The rate of OIS implies less risk than the corresponding interbank lending rate
such as Libor and Euribor because OIS rate is based on actual trades, which makes
it more difficult to be manipulated.
Because of counterparty risk, the derivatives trades are normally collateralized.
The cash collaterals are in general paid with overnight interest rate. As a conse-
quence, it is considered as a secured lending rate, i.e. a proxy of risk-free rate. It
is natural to apply OIS implied rates for discounting in financial calculation. Even
though Libor and Euribor are widely used as reference for swaps, OIS is gaining
increasing popularity. The OIS yield curve construction is similar to that for Libor
rate based instruments.
## 2.8.3 Other Swaps
There are other types of interest rate swap (called exotic swaps in general). Their
valuation methods usually involve interest rate term structure modelling. The exotic
swap valuation is often found to be the valuation of the comparable standard swap
plus an extra term known as the convexity adjustment. We will mention only two of
the most popular ones: constant maturity swap and in-arrears swap.
A constant maturity swap (CMS) is a swap in which the reference floating
rate used for each settlement is the prevailing market rate of the standard swap
of a specified fixed tenor. For example, in a 2 year maturity CMS swap linked to
USD10Y swap rate, the cash flow for the floating leg is based on the market rate of
the USD10Y swap rate observed at each settlement.
It is worth highlighting that the name CMS rate in a structured product refers
to the swap rate of specified tenor (e.g. USD20Y swap rate) to be observed on the
scheduled date(s) of the product.
The in-arrears swap is a swap in which the floating rate is determined at the end
of the period, instead of observing at the beginning for a standard swap.2.9 Yield Curve Construction 29
## 2.9 Yield Curve Construction
## 2.9.1 Yield Curve
A yield curve is a set of interest rate levels with equivalent credit quality across
different tenors (also called pillars) in the same currency.9 The relationship between
the interest rate levels of different tenors is called interest rate term structure.
The yield curve used in the financial market is also called zero coupon curve or
simply zero curve because each point shows the market interest rate for a ZC bond
(i.e. discount factor) of the related pillar. The zero coupon curve is built with the
most liquid financial market instruments which are involved in the interest rate risk
hedging. The interest rate level in any basis (e.g. continuous, money market, etc.)
can be implied from the ZC bonds.
## 2.9.2 Interpolation Method for Yield Curve
For any date t which is not on the pillars of the curve, the zero coupon bond
P(t) can be calculated by interpolation from its neighbouring dates t1 and t2 where
t1 < t < t2.
One commonly used interpolation method consists of assuming a constant
forward rate r between t1 and t2, such that P(t2) = P(t1) × e−r(t2−t1)/365, i.e.
r = ln P(t1)
P(t2) × 365
t2−t1
. The interpolation formula for the zero coupon bond is then
P(t) = P(t1) × e−r(t−t1)/365
.
## 2.9.3 Bootstrapping Method
Bootstrapping consists of calculating the ZC bonds implied by the instruments step-
by-step, from the shortest tenor to the longest. The ZC bond at time t is calculated
from the already known ZC bonds for the dates prior to t and the rates implied from
market instruments covering the tenor until time t. The calculation depends on the
type of instrument. For instance, if we know P(t1) and the money market rate r
applied from t1 to t2 (t1 < t2), then the bootstrapping procedure gives P(t2) =
P(t1)
1+r T , where T is the day count fraction for t2 − t1.
We note that one can also solve a system of equations instead of using
bootstrapping iterations.
9For currencies other than the funding currency of the institution, it makes sense to include the
impact from Cross Currency Swaps (CCS) of the market; see Chap.4 for the product.30 2 Interest Rate Instruments
Table 2.1 Instruments for Euro rates – 27 Nov 2014
Instrument Tenor Expiry date Begin End Rate or Price
Deposit O/N 27 Nov 14 28 Nov 14 0.0000%
Deposit T/N 28 Nov 14 01 Dec 14 0.1500%
Deposit 1M 01 Dec 14 02 Jan 15 0.0400%
Deposit 2M 01 Dec 14 02 Feb 15 0.0400%
Deposit 3M 01 Dec 14 02 Mar 15 0.1400%
Futures 15-Dec-14 17 Dec 14 17 Mar 15 99.910
Futures 16-Mar-15 18 Mar 15 18 Jun 15 99.915
Futures 15-Jun-15 17 Jun 15 17 Sep 15 99.930
Futures 14-Sep-15 16 Sep 15 16 Dec 15 99.925
Futures 14-Dec-15 16 Dec 15 16 Mar 16 99.910
Futures 14-Mar-16 16 Mar 16 16 Jun 16 99.890
Futures 13-Jun-16 15 Jun 16 15 Sep 16 99.870
Futures 19-Sep-16 21 Sep 16 21 Dec 16 99.840
Swap 3Y 01 Dec 14 01 Dec 17 0.2570%
Swap 4Y 01 Dec 14 03 Dec 18 0.3208%
Swap 5Y 01 Dec 14 02 Dec 19 0.3960%
Swap 6Y 01 Dec 14 01 Dec 20 0.4840%
Swap 7Y 01 Dec 14 01 Dec 21 0.5830%
## 2.9.4 Illustration Example for Yield Curve Construction
We illustrate the methodology through an example of Euro zero curve with the
instruments in Table 2.1.
Deposit Instruments
Bootstrapping starts from the instrument with the shortest tenor, i.e., the O/N
deposit rate.
Overnight (O/N) deposit rate
Convention ACT/360
Rate r r = 0.0000%
Day count t1: today t1 = 27 Nov 14
t2: next business day t2 = 28 Nov 14
T = (t2 − t1)/360 T = 1/360
P(t1) P(t1) = 1
P(t2) P(t1)/(1 + r × T) P(t2) = 12.9 Yield Curve Construction 31
Next we move on to the T/N deposit rate. Here we have to pay attention to the
weekend involved (29 Nov 2014 was a Saturday) leading to 3 calendar days in the
calculation.
T/N deposit rate
Convention ACT/360
Rate r r = 0.1500%
Day count t1: business day after today t1 = 28 Nov 14
t2: business day after t1 t2 = 01 Dec 14
T = (t2 − t1)/360 T = 3/360
P(t1) P(t1) = 1
P(t2) P(t1)/(1 + r × T) P(t2) = 0.9999875
Then, we consider other deposit rates with longer tenor. In our example, the
calculation for the 1M tenor is
1-Month deposit rate
Convention ACT/360
Rate r r = 0.0400%
Day count t1: settlement date t1 = 01 Dec 14
t2: one month after t1 t2 = 02 Jan 15
T = (t2 − t1)/360 T = 32/360
P(t1) P(t1) = 0.9999875
P(t2) P(t1)/(1 + r × T) P(t2) = 0.9999519
Similarly, calculations for 2M and 3M tenor can be done.
Short Term Interest Rate Futures
In our example, the interest rate futures are being used which are quoted in price
at the exchange, i.e. Price = 1 − r where r is 3M Euribor observed at the expiry
date of the contract. We use the term “Termination Date (TD)” for date which is 3
months after the expiry date of the contract.
For the first futures contract, we need to find the ZC bond at the beginning
date of the contract, i.e., 17 Dec 14, which is not yet available. This term has to
be interpolated from the nearby P(T/N) and P(1M).
From the second futures contract onward, the calculation will be P(t2) = P(t1)
1+r×T ,
where t2 and t1 are the Termination Dates of Current Contract and the Preceding
Contract, r being the implied rate for the current contract.
In case that the periods covered by two successive futures overlap or have a hole
in between, any smooth treatment may be applied for this joining period. If the32 2 Interest Rate Instruments
First futures contract
Convention ACT/360
Price P Price=99.91%
Implied rate r = 1 − P r = 1 − 99.91% = 0.09%
Day count t1: TD of the proceeding contract t1 = 17 Dec 14
t2: TD of the current contract t2 = 17 Mar 15
T = (t2 − t1)/360 T = 90/360 = 0.25
P(t1) Interpolated P(t1) = 0.9999797
P(t2) P(t1)/(1 + r × T) P(t2) = 0.9997448
impact is negligible, one may choose to simply adjust the period length of one of
the contracts by keeping the implied rate unchanged.
Swaps
Features of standard EUR swaps
Fixed leg Variable leg
Day count: ACT/360 Day count: ACT/360
Frequency: annual Frequency: semi-annual
The bootstrapping of swap contracts is based on the below no-arbitrage relation-
ship:
P(Settlement Date) − P(tn) = s
n
i=1
δiP(ti).
We take the ZC bond for the 3Y pillar as example where we have already
obtained the following numbers through bootstrapping of instruments with shorter
tenors:
P(Settlement Date) = 0.9999875,P(1Y) = 0.9991986,δ1 = 1,
P(2Y) = 0.9979836,δ2 = 1,δ3 = 1,s = 0.2570%.
We can solve for P(3Y) which makes the following equality hold:
P(Settlement Date) − P(3Y) = s × [δ1 × P(1Y) + δ2 × P(2Y) + δ3 × P(3Y)].
Applying the numerical numbers, we obtain P(3Y) = 0.9923045.2.9 Yield Curve Construction 33
Exercises
1. Measure the year fraction from 2 Jan 2017 to 1 Mar 2017 with each of
the following day count conventions: 30/360, ACT/365 and ACT/ACT ISDA.
Modified Following is applied for business day convention.
2. For the period from 2 Jan 2014 to 31 Dec 2014, the money market interest rate
for a certain currency is 2% under the day count convention ACT/360, what is
the equivalent rate level under ACT/365 day count convention?
3. From the data in theyield curve example presented inthe lastsection, calculate
(i) 4M deposit rate (for the period 2 Dec 2014 – 2 Apr 2015)
(ii) zero coupon bond values for 13 Feb 2014 and 2 May 2016 using the
interpolation method presented in the last section
4. Consider the following 3×6 FRA contract issued on Tuesday, 8 May 2018:
Notional amount USD 30 million
Expiry (i.e. Effective date) 3 months (8 August 2018, Wed)
Termination date 6 months (8 November 2018, Thu)
USD 3M Libor 2.36%
USD 6M Libor 2.52%
Day count convention ACT/360
(i) Calculate the market forward rate for the FRA contract (i.e. the rate at which
the contract value is zero at inception);
(ii) At expiry, the 3M Libor on the settlement date is 2.60%, what is the P/L for
the long party?
5. An institution has obtained a loan of USD10mio for 3 years at the interest rate
of USD 6M Libor+1.5% with semi-annual interest payments. With this loan,
the institution decided to invest into a high yield bond paying 5% p.a. with semi-
annual coupon payments.
Describe the risks for the institution.
The institution decided to enter into a 3Y standard IRS (Interest Rate Swap)
transaction with a bank in which the institution receives USD 6M Libor and pays
1.70% fixed rate with zero cost. The payment dates coincide for the bond, the
loan and the IRS.
(i) Has the IRS reduced the interest rate risk for the institution?
(ii) Who is the payer of the swap transaction? (institution or the bank)?
(iii) Calculate the net cash flow amount the institution will receive every 6
months.
(iv) For the floating leg of this standard IRS, when is the floating rate fixed for
each 6 month period (i.e. at the beginning or the end)? when is the floating
coupon paid (at the beginning or the end)?Chapter 3
Equities and Equity Indices
## 3.1 Equity
Equity is the claim of the ownership of a firm. Equity securities issued by
corporations are called stocks or shares.1 The securities traded in the equity market
can be publicly traded stocks, which are listed on the stock exchange, or privately
traded stocks.
The two main equity securities are
Common stock (ordinary stock): a common shareholder has the voting right and is
entitled to the dividend. In case of liquidation of the company, the shareholder of
a common share has the lowest priority for the assets.
Preferred stock: the holder of a preferred stock has no voting right but has the
priority for the dividend payment and liquidation assets over the common
share. Many preferred shares pay dividends in the form of fixed coupons, like
a perpetual bond. There are several types of preferred shares: a convertible
preferred share gives right to its holder to convert the preferred share to a
common share; a cumulative preferred share allows the dividends omitted in the
past (e.g. due to profitability issue) to be paid later.
A company’s free float refers to the number of shares that are immediately
tradable in the public market. A restricted share, usually held by an insider (such
as company’s executive officer and employee), is not fully transferable until certain
conditions are met. We have
Free Float = Outstanding Shares − Restricted Shares.
The market capitalization of a company is then defined as the market price
multiplied by the number of outstanding shares.
1In the context of this book, the words stock and share are used interchangeably.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_3
3536 3 Equities and Equity Indices
## 3.2 Stock Dividend
A stock dividend is a payment (e.g. yearly or quarterly) made by a corporation to
its shareholders as a distribution of profits. The dividend amount is decided by the
Board of the company at each time. For a detailed discussion on the dividend policy
and practice, we refer to [72].
When a dividend is declared, an ex-dividend date is specified. It is the date on
which shares bought no longer come attached with the right to be paid the declared
dividend. Other factors remaining equal, the share price will normally drop on the
ex-dividend date by the amount equivalent to the after-tax dividend. Before ex-
dividend date, the stock is said to trade cum dividend.
A stock dividend can be either a cash dividend in monetary form, or a stock div-
idend which involves the company issuing more shares to its existing shareholders.
Forexample,a5%stockdividendmeansthattheshareholdersreceiveonenewshare
for every twenty already owned shares. Unlike the cash dividend, the stock dividend
does not change the company’s market capitalization. In modelling, stock dividends
are also called proportional dividends.
Suppose that a stock pays a dividend value of D with ex-dividend date td. Let
St−
d
be the stock price just before the ex-dividend date. The quantity d = D/St−
d
is
called the dividend yield.
Obviously, St−
d
cannot be equal to Std . If it was, the strategy of buying the stock
immediately before td, collecting the dividend, and selling straight away, would
yield a risk-free profit. In fact, in the absence of other factors such as taxes, the asset
price must fall by exactly the amount of the dividend payment. That is, for a stock
paying both proportional dividend at rate dprop and cash dividend amount Dcash,
we have
Std = St−
d
(1 − dprop
) − Dcash
.
In continuous-time modelling, the proportional divided rate is the value d such that
e−d = 1 − dprop. Hence,
Std = St−
d
e−d
− Dcash
.
## 3.3 Stock Split, Reverse Stock Split, Rights Issue
A stock split is a corporate action in which a company divides each existing share
into multiple shares which impacts the share price by the same ratio. It increases the
numberofthecompany’soutstandingshareswhilekeepingthemarketcapitalization
unchanged. If a stock’s price has reached such a high level making it unaffordable
to small investors, the stock split helps to increase the stock’s liquidity.3.4 Equity Index 37
A reverse stock split is the opposite of stock split. A company having its stock
price dropped to a very low level such that one tic (i.e. the minimum quotation unit)
for its price becomes significant may consider undertaking a reverse stock split for
bringing back the price to a normal unit.
A company can raise money through a rights issue which is offered to existing
shareholders for purchasing new shares in the company with a subscription price at
a discount to the market price. The right can be either renounceable, allowing the
shareholder to trade it in the market, or non-renounceable which is not tradable.
## 3.4 Equity Index
A stock market index is a measurement targeting to describe the performance of
the stock market. It is computed from the price of selected stocks. An index is a
mathematical construct which does not allow direct investment. People may invest
through index futures, mutual funds or exchange-traded funds (ETFs) tracking the
index.
An equity index may be classified according to its calculation method. Let k be
the number of stocks included in the index, ni
t the total number of outstanding (free-
float) shares for stock i on day t, and Si
t the stock price. The two main classes of
index are as follows:
• Capitalization Weighted Index:
The majority of the equity indices belongs to this type, e.g. S&P 500, Euro
Stoxx 50. The calculation for each index is a variation of the below general
method:
Indext = Indext−1 ×
k 
i=1
ni
tSi
t
k 
i=1
ni
tSi
t−1
.
• Price Weighted Index:
There are only a few equity indices of this type. Dow Jones Industrial Average
and Nikkei Index are the most well-known ones. The calculation is as follows:
Indext =
k 
i=1
Si
t
Divisort
,
where Divisort serves for scaling the price continuity by adjusting its value in
case of some corporate actions and other external factors. As the stock price
alone does not contain any particular information, the methodology of relating
the weight to its price level is obviously not a rational approach.38 3 Equities and Equity Indices
## 3.5 Equity Forward, Cash & Carry and Reverse Cash &
Carry
An equity forward on a single stock is an OTC contract between two parties where
the long party is engaged to buy from the short party a certain quantity N (called
notional) of the stock at a pre-agreed delivery price K at the expiry of the contract.
The payoff of the long party is
Payoff = N × (ST − K),
where ST is the stock price at expiry T.
The market forward price (denoted as F, the value of K such that the forward
contract value is zero) for equities can be derived with no-arbitrage condition. In its
general form, a stock is assumed to pay both cash and proportional dividend. The
stock borrow/lending fee rate is called repo rate2 in modelling for equities.
Proposition 3.1 Let S0 be stock price at time 0.
(1) For a non-dividend paying stock with zero repo rate and constant interest rate
r, the forward price F is
F = S0erT
.
(2) For the general case, let rt be the instantaneous interest rate, λt the instanta-
neous repo rate and dtk the rate for the proportional dividend at time tk.3 The
forward price F is
F = S0e
T
0 (rt−λt)dt−

tk≤T
dtk
.
Proof
(1) The short party can hedge the forward contract by the Cash & Carry Strategy
which consists of buying one stock at time 0 financed by a loan and holding
the stock until the expiry. The table shows that, by setting K = S0erT , the total
P/L of the short forward position and the long stock position with a loan is zero
which means perfect hedging.
2The repo rate may be an abused vocabulary. Actually, Repo rate in fixed-income repo trade refers
to the rate at which money is borrowed/lent with collateral.
3For the case including cash dividends, we refer to [61], Chapter 1, which includes also the
presence of credit risk.3.5 Equity Forward, Cash & Carry and Reverse Cash & Carry 39
Time Value of the forward Stock position Monetary position Net position
0 0 S0 −S0 0
T −(ST − S0erT ) ST −S0erT 0
(2) We choose to re-invest all the repo return4 into the stock. In this case, one
stock at time 0 will become e
T
0 λtdt+

tk≤T
dtk
stocks at time T. For hedging the
forward on one stock, the short party needs to buy e
−
T
0 λtdt−

tk≤T
dtk
stocks at
the inception.
Net
Time Value of the forward Stock position Monetary position position
0 0
S0e
−
T
0 λtdt−

tk≤T
dtk
−S0e
−
T
0 λtdt−

tk≤T
dtk 0
T
−(ST −S0e
T
0 (rt−λt)dt−

tk≤T
dtk
)
ST
−S0e
T
0 (rt−λt)dt−

tk≤T
dtk 0
Similarly, the long position of a forward can be hedged with Reverse Cash &
Carry Strategy which consists of selling the stocks borrowed in the SBL (stock
borrowing/lending) market. The cash from the stock short-selling is invested in
money market to earn interests. For taking into account the repo and dividends,
the long party borrows e
−
T
0 λtdt−

tk≤T
dtk
stocks at inception but returns 1 stock
at T. Hence,
Net
Time Value of the forward Stock position Monetary position position
0 0
−S0e
−
T
0 λtdt−

tk≤T
dtk
S0e
−
T
0 λtdt−

tk≤T
dtk 0
T ST − S0e
T
0 (rt−λt)dt−

tk≤T
dtk
−ST S0e
T
0 (rt−λt)dt−

tk≤T
dtk 0

Remark 3.1 For a forward contract with K = F, the value at the inception can be
derived by
ST − K = (ST − F) + (F − K).
4The repo rate is normally positive. But under certain special market environment, it can be
negative.40 3 Equities and Equity Indices
The first term ST − F is the payoff of the market forward contract which has zero
initial value. So, for a non-dividend paying stock with zero repo rate and constant
interest rate r, the initial value of the forward contract is
S0 − e−rT
K.
For the general case, the contract initial value is
Forward Initial Value = e−
T
0 rtdt
(F − K) = S0e
−
T
0 λtdt−

tk≤T
dtk
− e−
T
0 rtdt
K.
## 3.6 Equity Index Futures
An equity index futures contract is a standardized equity forward linked to an
underlying equity index listed at an exchange. The contract is usually defined by
index point value which is the P/L per unit change of the underlying equity index. At
thecontractexpiry,thefuturespricecoincideswiththeindexpriceandthe“implied”
P/L of the long party is (Index Price − Initial Futures Price) × Index Point Value.
Actually, on daily basis, there is a P/L adjustment through the margin payment
between the exchange and the investor with a methodology from the exchange.
Example 3.1 E-mini S&P500 futures contracts have an index point value of $50.
An investor has bought 100 contracts at the price of 2,010.50. If S&P500 index
price is 2,001.00 at the contract expiry, then, the investor’s implied P/L will be
100 × (2,001.00 − 2,010.50) × $50 = −$47,500.00, which means a loss to the
investor.
The quotation for futures is usually subject to a minimum value called the
tick (e.g. 0.25, or $12.5 for E-mini S&P 500 futures). The observed difference
(Futures Price − current Index Price) is called the basis of the futures contract.
## 3.7 Equity Swap
The equity swap is an OTC contract between two parties where one party will
receive cash flows linked to the performance of underlying equity securities and
pay the funding in cash form, usually linked to a fixed or floating rate (e.g. 3M
Libor+spread). It is normally a total return swap (TRS) where the benefits from
the dividends as well as any other income/capital gain are paid to the receiver of the
equity performance.
The equity swap can be used to obtain leveraged exposure to the underlying if
the long party does not fully collateralize the trade. Swaps with regular settlements
known as resettable swaps have lower counterparty risk and require lower IA
(independent amount), which implies higher leverage.3.7 Equity Swap 41
Exercises
1. Consider the stock CCB listed in the Hong Kong market (ticker: 0939.HK). It
had announced a cash dividend of $0.2780 in RMB (or $0.319504 in HKD) for
the year 2017 and the ex-dividend date is 22 June 2017. The closing price on 21
June 2017 is 6.42. The market information on 22 June 2017 is
Date Open High Low Close
2017-06-22 6.11 6.21 6.1 6.12
(i) Explain why the opening price on 22 June 2017 is not 6.42 − 0.319504?
(ii) Calculate the daily total return for 22 June 2017.
(iii) An investor considers adjusting the historical price on 21 June 2017 by
6.42 − 0.319504. Another investor argues that it should be done by 6.42 ×
6.12
6.12+0.319504. Compare the two approaches.
2. Given a non-dividend paying stock with its current price at $100. The interest
rate in the market is 2% p.a. (ACT/365).
(i) Calculatethe1Year Forwardprice,stocklendingrateis2%p.a.(ACT/365).
(ii) Assume that an investor is long a 6-month forward at the forward price of
$101 for 10,000 stocks. At the expiry date, the stock price is $115, what is
the P/L of the investor?
(iii) Describe how to hedge a long position of an equity forward contract.
3. Explain the sentence “Unlike the cash dividend, the stock dividend does not
change the company’s market capitalization.”
4. An investor has bought one front-month mini Hang Seng Index futures contract
at the price of 30,000 and wants to unwind the position before expiry. Suppose
the exchange fee is $3.5, commission levy $0.1 and broker commission $5 per
contract. At one moment the bid and ask prices for the futures contract are quoted
as 30,020 and 30,021. What is the P/L for the investor?
5. The P&L of Equity futures contract is determined by an index point value. It is
useful to measure the performance of a position in futures with the usual method,
i.e. Notional × (PriceT
Price0
− 1).
For E-mini S&P Futures contracts presented in the example of the section of
Equity Index Futures, determine the equivalent Notional for 1,000 contracts.Chapter 4
Foreign Exchange Instruments
The FX (foreign exchange) market (also called Forex or currency market) facilitates
the trading of currencies. It starts from Monday morning in Wellington (New
Zealand) and closes on Friday evening in New York (USA).
## 4.1 Quotation Conventions
A currency is represented by a three letter ISO code with the first two letters for the
country and the last letter, in most of the cases, for the currency name, e.g. USD,
CNY.1
The currency exchange rate is quoted as the units of a “counter currency” (also
called “domestic” currency or ccy2) per “base currency” (also called “foreign”
currency or ccy1). In the market, the default order for being the base currency
is EUR, GBP, AUD, NZD, USD, CAD, CHF, JPY, etc (for instance, EUR/USD,
USD/JPY).
The FX rate between any two non-USD currencies is called cross-
rate which can be implied from the quotes against USD for each cur-
rency. For example, USD/CHF=0.9973 and USD/JPY=112.74 implies
CHF/JPY=112.74/0.9973=113.045.
In the market, the term pip is used in quotations for the last meaningful digit: 1
pip for EUR/USD and most of the other pairs is 0.0001; 1 pip for USD/JPY is 0.01.
100 pips is one big figure.
1Financial market practitioners sometimes use informal vocabularies for currency name: “Cable”
or Sterling for GBP, “Kiwi” for New Zealand Dollar, etc. [21].
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_4
4344 4 Foreign Exchange Instruments
4.2 FX Spot, Forward, Swap, Non-deliverable Forward
(NDF)
A spot transaction is an immediate purchase or sales of one currency for another
currency for delivery in usually two working days which is known as T+2 (T+1 for
some pairs, e.g. USD/CAD).
A forward (also called outright) is an OTC contract between two parties to
exchange currencies on a future date at a pre-set rate (called forward rate or strike
rate). The P/L for the long party can be calculated mathematically by an (implicit)
payoff in domestic currency as
Payoff = Notional × (XT − K),
where
Notional: notional amount in foreign currency
XT : foreign exchange rate at expiry
K: pre-agreed rate of the contract
The forward rate is the rate K at which, the initial valuation of the forward
contract is zero. In the market, the forward is quoted by the so-called “forward
points” or “swap points” which equals to (Market Forward Rate − Spot Rate).
The non-convertible currencies (e.g. CNY, KRW) can not be delivered in
an offshore country outside the (onshore) country of the currency. There is a
special instrument called NDF (Non-Deliverable Forward) used in the market
for hedging FX risk. It is an outright contract quoted for a non-convertible
currency against a convertible currency (typically USD). At maturity, the coun-
terparties settle, in the convertible currency, only the difference between the
contracted NDF rate and the prevailing spot rate on the agreed notional amount
(typically in USD).
An FX futures contract is a standardized forward listed at the Exchange.2 The
currency futures are far less popular than forward in OTC market.
An FX swap is an OTC agreement and is a combination of two transactions:
(1) a spot transaction (buy or sell) at spot rate
(2) a forward transaction (sell or buy) at the pre-agreed FX swap rate (by arbitrage,
market FX swap rate which makes the value of the FX swap at zero is also the
market forward rate).
2For instance, the E-mini Euro FX Futures of CME has the contract unit of 125,000 euros and the
expiries on the first 3 immediate consecutive months and 20 months in the March quarterly cycle
(Mar, Jun, Sep, Dec).4.3 Interest Rate Parity for FX Forward 45
## 4.3 Interest Rate Parity for FX Forward
Proposition 4.1 The market forward rate F(T) is
F(T) = X0
Pf (T)
Pd(T)
,
where
X0: current foreign exchange rate (i.e. the spot rate)
Pf (T): zero coupon bond in foreign currency (base currency)
Pd(T): zero coupon bond in domestic currency (counter currency)
or, equivalently,
• with money market rates (Rd and Rf for domestic and foreign currencies
respectively):
F(T) = X0
1 + RdTd
1 + Rf Tf
,
where Td and Tf are calculated with the day count conventions of domestic and
foreign currencies respectively;
• with continuous rates (rd and rf for domestic and foreign currencies respec-
tively, and Tc for the day count fraction using ACT/365):
F(T) = X0e(rd−rf )Tc.
Proof There will be an arbitrage if the above relationship is not satisfied. If F(T) >
X0
Pf (T)
Pd(T)
, then, one can build the following arbitrage position at inception:
– sell one unit of forward at F(T)
– buy Pf (T) foreign currency, financed by a loan of X0Pf (T) in domestic
currency
At maturity, we have
• from the forward position: short 1 unit of foreign currency, long F(T) units of
domestic currency
• from the hedging position: long 1 unit of foreign currency, short X0
Pf (T)
Pd(T)
in
domestic currency
⇒ The total P/L will be F(T) − X0
Pf (T)
Pd(T)
> 0 which is an arbitrage.
Similarly, we can prove the case for F(T) < X0
Pf (T)
Pd(T)
. 46 4 Foreign Exchange Instruments
## 4.4 Cross Currency Swap and Non-deliverable Swap (NDS)
The CCS (Cross Currency Swap) consists of exchanging the principals at the begin-
ning with the spot rate, exchanging the interests during the tenor and exchanging
the principals back at maturity.
Example of a USD/JPY cross currency swap assuming USD/JPY Spot
rate=110.03:
At Inception:
– Party A pays party B USD10m
– Party B pays party A USD10m × 110.03=JPY1, 100.3m
During the Trade Life:
– Party A pays party B JPY Libor −36bps (if it is negative, party B will pay
party A) on JPY notional amount
– Party B pays party A interest of USD Libor on USD notional amount
At Maturity:
– Party B pays party A USD10m
– Party A pays party B JPY1,100.3m
Inception Maturity
JPY1,100.3m
USD10m
JPY1,100.3m
USD10m
JPY 3M Libor -36bps
USD 3M Libor
...
CCS is a very useful instrument. As an example of its application, please refer to
Chap.24 for “Funding Management for Structured Notes”.
For non-convertible currencies (e.g. KRW, CNY), there is a non-deliverable
instrument which is used in the market for hedging FX rate risks. It is called4.4 Cross Currency Swap and Non-deliverable Swap (NDS) 47
NDS (Non-Deliverable Swap), a cross currency swap where one currency is non-
convertibleandtheotheroneisconvertible(typicallyUSD).Theparticularfeatureis
that all cash-flows are settled in the convertible currency by applying the prevailing
exchange rate at the payment time. This implies that
• at inception: no initial notional exchange
• at maturity: settlement in the convertible currency for (Notional × Difference
between FX Rate at Maturity and FX Rate at Inception).
The interest rate on the non-convertible currency is normally a fixed rate instead
of floating rate for a cross currency swap.
Graphical Illustration of NDS on USD/KRW
Inception Maturity
(as if M = N×X0 KRW settled in USD) (USD N)
(USD N)
KRW Fixed Rate, settled in USD
USD 3M Libor
...
Exercises
1. A student wants his HKD100,000 converted into CNY at a money exchange
where the bid/ask for CNY/HKD are shown as 1.2 and 1.25 respectively. How
much CNY will he get?
2. A linked exchange rate system is set up between HKD and USD. In 2015,
Hong Kong Monetary Authority (HKMA, the de facto central bank in Hong
Kong) announced to implement the “Convertibility Undertaking” which buys
USDinthemarketatUSD/HKD= 7.75 andsellsUSDatUSD/HKD=7.85.Are
7.75 and 7.85 bid or ask prices such that the necessary condition for triggering
“Convertibility Undertaking” is satisfied?
3. Though USD/JPY trades for most of the time in a trading day but there are
certain periods during which USD/JPY is significantly more volatile. Explain
this phenomenon.48 4 Foreign Exchange Instruments
4. Assume that the spot price of USD/CNH is 6.6741 (meaning 6.6741 CNH per
USD). The 3-month money market rates are 4.2% for CNH (ACT/360) and
1.17% for USD (ACT/360).
(i) What is the base currency for the pair USD/CNH?
(ii) If the spot price has increased by 20 pips, what is the new spot price?
(iii) If the forward price for 3M tenor is 6.6751, what is the swap point?
(iv) What is the 3-month forward price of USD/CNH, assuming the period has
90 calendar days?
(v) Someone is willing to buy or sell a 3-month USD/CNH forward at the rate
of 6.6800. How can I build an arbitrage position of USD20m notional to get
a profit? And what is the P/L?Chapter 5
Commodities
Inthischapterweoutlinethebasicconceptsandinstrumentsrelatedtocommodities.
For a more detailed introduction, we refer to [22, 75].
## 5.1 Commodities Overview
Commodity is raw or processed goods that are used in the production of other goods
or for direct consumption. We list the major commodity categories with examples:
Precious Metals: Gold, Silver, Platinum
Energy: Crude Oil (WTI-West Texas Intermediate and Brent), Natural Gas, Elec-
tricity
Metals: Base (copper, zinc, nickel, aluminium), Ferrous (iron, steel, iron ore)
Agricultural: Grain/Seeds (wheat, corn, soybean, rice, oats), Soft commodities
(coffee, sugar, cocoa, cotton, rubber), Livestock (live cattle, lean hogs, pork
bellies)
A commodity index tracks the weighted average price of a basket of commodities,
which may be based on spot or futures prices. The below ones are well-known
commodity indices, and each applies its specific methodology and diversified
exposure1: S&P GSCI Index, Dow Jones-UBS Index, Thomson Reuters/Jefferies
CRB Index, Rogers International Commodity Index (RICI).
The investment exposure to commodity asset class is usually realized through the
following instruments:
– Commodity futures listed at the exchange
– Mutual fund making commodity related investments, or commodity ETF
1Actually, the diversification is limited for most of the commodity indices. Energy often represents
a heavy weight.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_5
4950 5 Commodities
– OTC swap, option with commodity underlying
– Structured product linked to commodity or commodity index
## 5.2 Commodity Forward and Futures
The shortest dated market commodity transaction is normally considered as the Spot
transaction. A commodity Forward is an OTC contract between two parties. The
Long party is engaged to buy from the Short party a certain quantity (Notional) of
the underlying commodity at a pre-defined price (called Strike Price or Forward
Price) at the expiry date of the contract. Mathematically, the payoff of the long
party is
Payoff = Notional × (ST − K),
where
Notional: quantity of the commodity
ST : commodity price at expiry
K: delivery price which is agreed at the inception of the contract
The settlement of the final payoff may be either of the below methods
– Physical Delivery: only real commodity users may choose physical settlement
– Cash Settlement: this is the most common for financial market participants
Commodity Futures contracts are standardized forward contracts that are actively
transacted at an Exchange. Holders of the contracts need to sell their holding to the
market before expiry if they do not want the delivery of the physical commodity.
Example 5.1 2 The Coffee C contract is the world benchmark for Arabica coffee.
The contract prices physical delivery of exchange-grade green beans, from one of
20 countries of origin in a licensed warehouse to one of several ports in the U.S. and
Europe, and etc.
Contract size 37,500 pounds
Price quotation Cents and hundredths of a cent up to two decimal places
Contract listing March, May, July, September, December
Settlement Physical delivery
Min. price movement 5/100 cent/lb., equivalent to $18.75 per contract
Grade/standards A Notice of Certification is issued based on testing the grade of the
beans and the flavor
Deliverable growths Mexico, Salvador, Guatemala, Costa Rica, Nicaragua, Kenya, New
Guinea, ...
Deliverable points Exchange licensed warehouses in the Port of New York District
and the Port of Virginia (each at par), the Port of Antwerp, ...
...
2Source: extracted from Intercontinental Exchange (ICE) Website.5.2 Commodity Forward and Futures 51
Spot-Forward Relationship
Except precious metals, it is difficult to implement Cash-and-Carry strategies for
hedging forward contracts. Actually, the forward/futures prices depend on several
factors including demand/offer, geopolitical and environmental changes.
In modelling, the below concepts are used for establishing the relationship
between Spot and Forward:
interest rate (denoted by r): the financing rate
storage cost (denoted by c): actually r + c represents the carry cost
convenience yield (denoted by y): it represents the benefit for holding the physical
commodities instead of the holding of forward/futures contracts. Its value can be
positive or negative.
The relationship between the forward price expiring at time T, F(T), and the spot
price S0 is then
F(T) = S0e(r+c−y)Tc.
Commodity Price Term Structure
In commodities market, people often observe two typical shapes for the futures price
curve:
Backwardation: the downward sloping curve for forward/futures is called Backwar-
dation.
Contango: The upward sloping curve for forward/futures is called Contango.
The futures price eventually converges to the spot price by construction. For a
contango market, the futures contracts are trading at premium to the spot price. It
may imply that the carry cost increases with time. The reason for backwardation
may be shortages, political events or weather concerns. Due to the difficulties
for implementing arbitrage strategies, the futures prices are mostly driven by
supply/demand. Contango is the situation where the future price is anticipated to
be higher than the spot price while the backwardation is the situation where the
future price is expected to be less expensive than the spot price.
From the spot forward relationship, a large spread between c and y will give the
contango structure while a negative one the backwardation.
Seasonality
Some of the commodities, e.g. natural gas, electricity, show strong patterns of
seasonality due to the consumption seasonality and storage difficulties.52 5 Commodities
Roll-Over of Futures
A Futures contract has a fixed expiry date on which the price of the futures contract
converges to the Spot price of the commodity. An investor may choose to “roll” his
futures contract (i.e. close the contract about to expire and enter into a new contract
with a later expiry date) before its expiration to the futures in a further-out month.
It is customary to roll the front month contract to the second nearest contract
because the near contracts are more liquid. If the spot price of the commodity stays
constant, the “roll yield” for the investor will be
• positive: in a backwardated futures market
• negative: in a contango futures market
Instead of rolling the front month futures to the second nearest futures, more
sophisticated rolling strategies can be used according to the dynamic term structure
of the commodity.
5.3 A Special Commodity: Gold
Gold is the most popular precious metal for jewelleries and investment. It is
considered as
– a “currency”: relatively independent of the interest rate policies of any govern-
ment. In some of the investment banks, the trading of gold is carried out by the
FX trading team.
– a safe-haven asset: throughout history gold has been a safe-haven asset providing
shelter in periods of financial crisis or turmoil.
– an inflation hedging asset: the gold price is intimately linked to the real inflation
rate of the economy.
The price reference largely used by the financial market is the London Gold
Fixing by LBMA (London Bullion Market Association). It is a gold price auction
taking place twice daily at 10:30am and 3:00pm London time with the price set in
US dollars per fine troy ounce. The spot transaction is settled at T+2.
Gold is virtually an indestructible metal as it does not corrode. This helps to
develop a special type of transaction called gold lease through which the lender of
gold earns an income which can be paid in cash or in gold. For instance, a central
bank may have interest to lend out the physical gold to a jewellery manufacturer.
The market forward price is F(T) = S0e(r−rgl)Tc where rgl is the continuous
gold lease rate. This is easily understood because r − rgl is the real carry cost rate.
For a gold swap, it consists of buying physical gold at spot price and selling back at
forward price from the borrower’s perspective. For physically settled transactions,
Loco represents the place at which gold with a certain grade is physically held and
to which a particular price applies. Examples are loco London, loco Zurich, and etc.5.3 A Special Commodity: Gold 53
Exercises
1. Explain why commodities are known to bring diversification benefits for
investors.
2. Name the differences between a stock market index and a commodity index.
3. The forward curve is a graph that displays futures prices against futures
maturities.
(i) Plot the forward curves for backwardation and contango structure;
(ii) From a graphical point of view, explain which one benefits the futures roll-
over and how the slope of the forward curve comes into play?
4. The current price of a commodity is $50, the continuous interest rate is 1.50%
flat, the storage cost is 0.32% p.a. (continuous rate), and convenience yield is
0.60% p.a. (continuous rate).
(i) What is the forward price for a 2-year maturity contract with zero cost? Is it
a Backwardation or Contango?
(ii) An investor islong 50,000 commodity forward withthe forwardprice at$52.
Assume commodity price at expiry $52, what is the investor’s payoff?Chapter 6
Credit Derivatives
## 6.1 Credit Default Swap (CDS)
First introduced by JP Morgan in 1997, CDS (Credit Default Swap) remains the
most widely used credit derivative instrument despite the negative reputation in the
wake of the 2008 financial crisis.
CDS is an OTC transaction where the protection buyer (CDS Buyer)
– makesperiodicpayments(calledCDSspreadorpremium)totheprotectionseller
(CDS Seller) until either the credit event or the trade tenor if no credit event
occurred
– will be made whole for their exposure on the related bonds of the reference
entity.
There are several standard credit events which are typically referred to in credit
derivative transactions under ISDA definitions: “Bankruptcy”, “Failure to Pay”,
“Restructuring” as well as “Repudiation/Moratorium”, “Obligation Acceleration”,
“Obligation Default”. There are two types of settlement in case of a credit
event:
Physical Settlement: the protection buyer has to deliver a bond of seniority at least
equal to that of the reference obligation plus the accrued CDS interest to the
protection seller for receiving the face value of the bonds (Notional Amount) in
return
Cash Settlement: the protection buyer will receive “Notional×(1−Recovery Rate)”.
The recovery rate will be determined by the Credit Event Auction.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_6
5556 6 Credit Derivatives
Inception Trade Tenor
Premium (e.g. = N ×120 bps p.a.)
Credit Event
Payout (= N (1 R)) Protection Buyer
Protection Seller
...
N: Notional amount
R: Recovery Rate; For senior unsecured debt, R is assumed to be around 40% in
general.
General relationship between the default probability λ and the spread s is s ≈
(1 − R)λ.1
6.2 CLN (Credit Linked Note)
A Credit Linked Note (CLN) is a debt instrument whose value is linked to credit
events of one or a basket of reference entities. In case of a Credit Event, there could
be a physical or cash settlement based on recovery rate from the credit auction.
A CLN can be structured with a short position of the CDS on the reference entity
for receiving the premium and an investment into safe assets which may serve as
collateral for the CDS and may also generate income. The net income will be used
to pay to the CLN investor.
Investor Issuer
Protection Buyer
Collateral
Notional
Coupon
Termination Payment
Conditional Payment Premium
Notional
Collateral Coupon
1The proof will be given in Chap.22.6.3 Credit Index 57
The most popular CLN linked to a basket of reference entities is the FTD (First-
To-Default)NotewhichoffersahigheryieldthansinglereferenceentitylinkedCLN
by taking the risk of the first credit event which has a higher probability to occur.
An example is a 3Y USD Note paying 5% p.a. coupons until the first credit event
for any of the 5 companies in the basket.
## 6.3 Credit Index
A credit default swap index is a standardized credit security which offers the credit
exposure of a portfolio of reference entities. For example:
– CDX NA IG: 125 investment grade (IG) companies in North America (NA),
administered by CDS Index Company and marketed by Markit Group Limited,
– iTraxx Europe: 125 investment grade companies in Europe, managed by the
International Index Company (IIC), also owned by Markit.
These portfolios are updated (rolled over) on March 20 and September 20 every
year.
Credit indices are OTC products and can be traded with licensed dealers
providing liquidity. The indices trade with a fixed coupon (e.g. 1%) that is usually
paid quarterly (20th of Mar, Jun, Sep, Dec). The coupon is paid by the buyer
of protection on the index (who is taking a short position of the index). Upfront
payments are made at the initiation and the close of the trade to reflect the change
in price of the index. The indices are quoted on a clean basis.
Example 6.1 The following is an illustration example from “Markit Credit Indices
– A Primer, 2013”: An index is launched with the price of 100 on Sep 20th, fixed
coupon of 60bps, 5Y tenor.
On Nov 30th, an investor buys USD10m protection on the index when the spread
has moved to 90 and corresponding price is 98.67 (the price is par minus the PV of
the spread differences).
Upfront payment: USD10m×(100 − 98.67)/100 = USD133,000
Receiving the accrual up to trade date: 71/360×USD10m×0.0060 =
USD11,833.33
Net Outflow = USD133,000−USD11,833.33=USD121,166.67
On Dec 20th, the investor pays the fixed coupon: 0.0060×USD10m×91/360 =
USD15,166.67.
On Mar 13th, he closes the trade when the spread is 120 and the price
is 97.44 and pays the accrued interest up to trade date and receives payment:
Inflow=USD10m×[(100 − 97.44)/100 − 0.0060 × 84/360] = USD242,000.58 6 Credit Derivatives
Upon credit event, the protection buyer obtains the payout for the relevant
reference entity according to its weight in the index:
Notional × Weight × (1 − Recovery Rate).
Cash settlement is normally the default settlement mechanism.
Followingacrediteventofaconstituentintheindex,anewversionoftheindexis
published which assigns a zero percent weight on the defaulted entity. The notional
amount on the index trade is reduced by its weight in the index. For instance,
consider a USD10m trade on an index with 100 names. After one default occurred,
the new version of the index will contain 99 names and will have a revised notional
of USD9.9m.
## 6.4 Collateralized Debt Obligation (CDO)
The ABS (Asset-Backed Security) with Bonds and Loans as underlying assets is
known as a Cash CDO (Collateralized Debt Obligation). A CDO is commonly
structured through an SPV (Special Purpose Vehicle, in the form of a company)
which buys bonds/loans as assets financed by the debts and equities of the SPV sold
to investors. The net revenue (after all costs and losses due to defaults) from the
assets is distributed to the debt and equity investors of the SPV.
MultipletranchescorrespondingtothedebtandequityoftheSPVareissuedwith
different payment priorities. The tranches are categorized as Senior debt, Mezzanine
debt and Equity with increasing level of risk compensated by increasing return rate.
Atrancheisassociatedwithacertainreturnandtwothresholdlevelsfordetermining
the principal loss:
– attachment point: the default ratio of the portfolio for triggering loss in this
tranche
– detachment point: it is the attachment point of the next tranche
An illustration example of a CDO with 4 tranches is as follows:
Credit Return
Tranche rating rate Attachment Detachment Absorbing portfolio loss
Senior AAA 1% 20% 100% from 20% until 100%
Mezzanine AA 1.6% 10% 20% from 10% until 20%
Mezzanine BBB 4% 3% 10% from 3% until 10%
Equity not rated variable,
e.g. 12%
0% 3% from 0% until 3%6.4 Collateralized Debt Obligation (CDO) 59
Assets
Bonds/Loans
Liabilities
Equity (3%) - Unrated Investor
Variable Return
BBB Debt
Mezzanine Tranche (7%)
Investor
Fixed Return
A Debt
Mezzanine Tranche (10%)
Investor
Fixed Return
AAA Debt
Senior Tranche (80%) Investor
Fixed Return
Synthetic CDO
If credit default swaps are used instead of bonds for the credit exposure, the CDO
is called a synthetic CDO. The premiums from the component CDS’s constitute the
revenue cash flow for the structure. Synthetic CDOs may be easier and less costly
to create than the Cash CDO if there is the CDS supply. However, as the synthetic
CDO is built with CDS instead of bonds, its size is not limited by the available
bonds and may be out of control.
Single Tranche CDO on Credit Index
CDO tranches are traded on some of the credit indices. An investor can choose
the exposure to a particular portion of the index loss distribution. For example, the
tranches for CDX NA IG are 0–3%, 3–7%, 7–10%, 10–15%, 15–30%, 30–100%.
Theprotectionbuyerofatranchemakesregular(e.g.quarterly)couponpayments
to the protection seller and receives a payment in case of a credit event. Like the
credit index trade, upfront payments are made at initiation and close of a single
tranche trade to reflect the change in price. Coupon payments (e.g. 500 or 100bps
per annum) are made on the remaining notional until the tranche gets fully written
down due to credit events or until maturity.
Following a credit event, the equity tranche is reduced by (100−Recovery Rate)
while the notional of the super senior tranche is reduced by the recovery rate
(because the recovered amount on the defaulted entity can no longer be lost). The
principal of any other tranche except the super senior tranche is unaffected but will
have a smaller cushion protecting them against further losses. Readers can refer to
[52] for detailed explanation with illustration examples.60 6 Credit Derivatives
Exercises
1. What is a naked CDS and what type of investors is more likely to be interested
in them?
2. Consider an investment grade company and its corresponding 5Y CDS contract.
Are the equity price and the CDS spread mostly moving in tandem or inversely
related? Explain your rationale.
3. Explain why an FTD Note (say, on a basket of 5 names) is often said to be a
leveraged investment.
4. Assume a CDO of a total asset value of USD500m invested in high yield bonds
with weighted average return of 5%. The total annual fee (management fees +
other fees/charges) is 1% on the total asset value.
Tranches Notional in M USD Interest rate
AAA rated N 2.5%
A rated 150 3.5%
BBB rated 100 R
Equity (unrated) 50 9.5%
Please determine the “N” and “R” in the above table after 1Y investment.
5. On Dec 1, 2017, the five-year CDS spread on corporate bond of A is 3.0%.
The same corporate bond’s yield is 6% and 5-year treasury bond yield is 2.58%.
Calculate the basis and explain how can you arbitrage this opportunity.Chapter 7
Investment Funds
## 7.1 Funds
A fund is a collective investment scheme that pools money from investors. It is
managed by investment advisors known as fund managers from a management firm
which is legally and financially distinct from the fund and its assets. A fund has
the objective to produce higher risk adjusted returns than its benchmark (usually an
index).
There are two main types of funds: mutual funds which are open to all investors,
and hedge funds for sophisticated and accredited investors.
## 7.1.1 Fund Price and Fees
The value of a fund unit is represented by its net asset value (NAV) which is defined
as
NAV =
Value of the assets held by the fund − Liabilities
Number of shares (or units)
.
There are different charges linked to the investment in a fund:
– management fee: a fixed percentage applied to the NAV (e.g. 1.2% p.a.); the fee
level depends on the skill/involvement/added value of the fund manager
– custodian fee: e.g. 0.05% of the fund NAV
– sales charges or loads: front-end load for subscription, back-end load for
redemption
– other expenses including distribution and marketing costs.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_7
6162 7 Investment Funds
The Total Expense Ratio (TER) measures the total cost to the investor. It is defined as
TER =
Management fee + All the other fund expenses
Total asset value
.
## 7.1.2 Fund Organization
A fund can be legally set up as
– a unit trust: the investors are trust beneficiaries
– a corporation: the investors are shareholders
– a limited partnership: the fund manager is the general partner and investors are
limited partners. It is mostly used for hedge funds and private equity funds.
There are different forms for a fund, including
open-end fund: all buy/sell trades are realized in the primary market through
subscription and redemption. The open-end funds constitute the majority of the
funds.
closed-end fund: a fixed number of non-redeemable shares are issued at initial
offering. The shares are then traded in the secondary market. The share price
may deviate from NAV of the fund because of demand/supply (often at discount
of the fund NAV).
exchange-traded fund (ETF): an index tracking fund listed at an exchange. Its price
may be influenced by demand/offer but with limited deviation from its NAV
because the ETF shares may be created or redeemed at NAV by the ETF PD
(Participating Dealer) if there is an arbitrage opportunity.
fixed maturity fund: a fund having a fixed maturity. It targets to invest in the bonds
with similar maturity as the fund itself. So, the fund is close to a principal
protected income product (subject to no default).
## 7.1.3 Share Classes
One may invest in a mutual fund through a certain share class which, usually named
by a single letter, offers a type of exposure with its fee/cost structure and NAV.
For instance, based on the same investment fund, “A” may be the share class with
USD denomination while “B” is the share class with EUR denomination; “I” is
often used for institutional share class which has a lower management fee but higher
minimum subscription amount; “Distribution” share class pays regular dividends
whilst “Accumulation” share class does not pay dividends but reinvests them.7.2 Mutual Funds 63
## 7.1.4 Fund Derivatives
Investors can get exposure through derivative structures usually provided by an
investment bank who has an agreement with the fund under which, the investment
bank trades at NAV and sometimes receives a rebate of part of the management fee.
The most common structures are as follows:
– Leveraged exposure: total return swap, leveraged Note, etc.
– Protected exposure1:
• option based structure: the investor may purchase a call option or a Note with
an embedded call option with the fund as underlying. The volatility target
mechanism is often necessary for avoiding the option provider to hedge the
fund volatility risk.
• gap risk based structure: Constant Proportion Portfolio Insurance (CPPI) or
Time Invariant Portfolio Protection (TIPP) which applies dynamic investment
allocation between risky and low-risk assets for mitigating gap risk.
## 7.2 Mutual Funds
Mutual funds are usually accessible to all types of investors including individuals.
They are highly regulated and supervised with high standard of transparency and
diversification:
– in US, regulated by Investment Company Act of 1940
– in Hong Kong, by SFC (Securities and Futures Commission)
– in Europe, the UCITS qualification offers the passport for selling the fund across
European countries
Mutual funds are also managed by licensed investment advisers (i.e. fund man-
agers): e.g. in Hong Kong, the license Type 9 of SFC covers asset management.
A mutual fund’s assets are usually safeguarded by a custodian bank. For open-
ended funds (excluding the sales charge), there is daily liquidity for subscrip-
tion/redemption. A prospectus (or explanatory memorandum) is required for each
fund. A mutual fund is overseen by a board of directors for funds set-up as a
corporation and an annual report to fund investors is required.
Mutual funds are generally classified by the focus of investments which is
described in the prospectus:
– money market fund: investing in money market instruments and bonds with short
expiration date
– bond fund: e.g. emerging market bond fund, high yield bond fund, senior loan
bond fund
1cf. Chap.8 for options and Chap.26 for volatility target mechanism and gap risk structures.64 7 Investment Funds
– equity fund: such as mid-cap fund, high dividend yield fund
– hybrid fund: with its investment allocated to several asset classes
The management fees for an actively managed mutual fund may range from
0.25% to 1.50% of the NAV. For passive funds such as ETFs and index funds, the
management fee level is lower (e.g. 0.15%).
## 7.3 Hedge Funds
A hedge fund aims to achieve an absolute return by investing in a range of
markets with a wide variety of styles and financial instruments. It is restricted to
sophisticated or accredited investors with a minimum investment size.2 The hedge
fund managers often have significant stakes in the funds, which serves to align their
own interests with those of the investors.
The hedge funds and their managers have historically been less regulated
compared to mutual funds. A hedge fund is normally not very transparent, offering
limited liquidity for subscription/redemption (e.g. monthly, semi-annually). This
makes it difficult to create structured products linked to hedge funds.
The legal structure of a hedge fund varies depending on its location and investors.
In the US, they are generally structured as limited partnerships so that the investors
are not subject to both entity-level and personal-level taxation. Many hedge funds
are established in offshore financial centres to avoid adverse tax consequences for
investors.
A hedge fund has one or more prime brokers providing execution, custodian,
leverage and short-term financing, securities lending. Prime brokers may even help
fund managers to meet potential investors.
Fees charged by hedge fund management firms are as follows:
– Management fees: typically 2% on NAV
– Early redemption fee (or early withdrawal fee)
– Performance fee: typically 20% on the out-performance above its HWM (High
Water Mark) which is the highest NAV level (after fees) over a specified past
period or Hurdle which is a benchmark rate (e.g. Libor+spread).
Examples of hedge fund strategies are:
• global macro: investment strategy in share, bond or currency markets in antici-
pation of global macroeconomic events;
• event-driven: seeking investment opportunities in corporate events;
2For instance, the minimum subscription size is USD50k for a single hedge fund in Hong Kong.7.3 Hedge Funds 65
– distressed securities: traded at a deep discount due to restructuring,
bankruptcy, etc.
– risk arbitrage: buying and selling the stocks of two or more merging compa-
nies.
– special situations: spin-off, share buy-back, security issuance, asset sales, etc.
• relative value: it is a market neutral strategy taking advantage of relative
discrepancies in price between securities. The list of such strategy includes
fixed-income arbitrage, equity market neutral, convertible bond arbitrage, capital
structure arbitrage and regulatory arbitrage;
• managed futures fund (also known as CTA – Commodity Trading Advisor):
trades mainly futures in commodities, stock indices, forex, etc. The fund uses
quantitative techniques, such as trend-following, technical pattern recognition, to
take long and/or short positions.
An efficient way to offer products linked to a hedge fund consists of setting up
a managed account, typically through the asset management arm of an investment
bank. The hedge fund manager will be mandated as investment advisor for making
the same investment as the hedge fund. But the managed account is transparent with
improved liquidity and smaller entry size. The investment bank may offer structured
products on the managed account because the hedging (or more specifically, delta
hedging, which will be introduced in the next chapter) can be done with the
constituent investments in the account. To financial institutions, the regulatory risk
weight for the investment in a managed account is often lower than the risk weight
for the investment in the hedge fund itself.
Exercises
1. Find out what are target-date funds and list their pros and cons.
2. An open-end fund has reported a net asset value of $1 per share for all
the historical trading days. Find out the type of this fund and explain such
phenomenon.
3. InvestorsarebecomingmoreawareoftheEnvironmental,SocialandGovernance
(ESG) criteria in an investment process. Explain how such criteria make an
impact on index funds.Chapter 8
Options
An option is a financial instrument which may offer an asymmetrical exposure to
the performance of the underlying. There is a large variety of options. But the call
and put options are the most basic ones.
We recall that the call option gives the owner the right but not the obligation to
buy the underlying asset from the seller at a pre-agreed price, called the strike price
or exercise price. The payoff of a call option at expiry T is max{ST − K,0} where
ST , K represent respectively the final underlying’s price and the strike price of the
option. Similarly, a put option gives the owner the right but not the obligation to
sell a certain asset at the strike price. The payoff at expiry T is max{K − ST ,0}.
Graphically,
Long Call
ST
Payoff
K
Long Put
ST
Payoff
K
Short Call
ST
Payoff
K
Short Put
ST
Payoff
K
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_8
6768 8 Options
Options can be used for several purposes including
• hedging: for instance, if an investor holding XYZ share is concerned by its price
drop in the short term, he may buy a put option to hedge his long position of the
stock.
• leverage: for instance, instead of investing directly N dollars into an asset, one
can choose to buy a call offering the same upside exposure by paying the option
premium which is a fraction of N.
• directional exposure with protection: for speculating with a bearish view, one
maybuildashortpositionwithaforwardorbyshort-sellingtheunderlyingwhich
will incur a loss if the underlying price rises instead of falling. But if he buys a
put instead, the upside risk will be mitigated.
• specific view: we will see later that a combination of call and put options allows
to take advantage of any market view for the considered horizon.
## 8.1 Option Features
## 8.1.1 Option Style
There are two styles related to options:
European Option: an option that may be exercised only at the maturity of the option
American Option: an option that may be exercised at any time before the matu-
rity date.
## 8.1.2 Mark-to-Market Price, Intrinsic Value and Time Value
The mark-to-market price (MtM), or simply option price, is the price at which the
option can be bought or sold in the market before its expiry. It is made up of two
components:
intrinsic value: the payoff that would be received if the underlying asset is at its
current level St when the option expires. It is defined to be max{St − K,0} for a
call and max{K − St,0} for a put.
time value: the difference between the MtM price and the intrinsic value. It will be
zero at maturity.
See Fig.8.1 for an illustration with call option.
Fig. 8.1 Illustration of
Intrinsic value and Time value
St
Option Price
K Spot
Price
Time Value
Intrinsic Value8.2 Vanilla Options 69
## 8.1.3 Moneyness of an Option
An option at time t is said to be
in-the-money (ITM): if its intrinsic value is positive at t; It means K < St for a call
and K > St for a put where St is the underlying price.
at-the-money (ATM): if its intrinsic value is zero and that St is at the limit of being
ITM; For a call or put option, it means K = St.
out of-the-money (OTM): if it is neither ATM nor ITM. It means K > St for a call
and K < St for a put.
We say that the strike of an option is ATM (or ATMS, at-the-money spot) if the
strike price is the initial price of the underlying. The strike price is called ATMF
(at-the-money forward) if it is equal to the forward price of the underlying for the
tenor of the option at its inception.
## 8.1.4 Notional Amount Definition
Each option contract has a notional amount used to calculate the payoff. There are
two methods to define the option notional amount:
1. in number of units of the underlying (e.g. number of shares): For instance, the
maturity payoff of an ATMS call option is
N × max{ST − S0,0},
where N represents the number of shares.
2. in monetary unit (e.g. EUR amount): this method is used in structured products.
For instance, the maturity payoff of an ATMS call is written as
N × max

ST
S0
− 1,0

,
where N is in EUR.
We often omit the notional amount N when it is not important for the analysis.
## 8.2 Vanilla Options
Vanilla options refer to the most liquid and basic options traded in the market which
are call or put options. Any option that is not a vanilla option is an exotic option.
In this section, we will introduce the vanilla options for the main tradable asset
classes, namely, equities, interest rates, currencies and commodities. The market70 8 Options
quotations for Vanilla options are based on BSM (Black–Scholes–Merton) type of
models (which will be introduced in Sect. 8.2.5).
## 8.2.1 Equity Options
Vanilla options linked to equities are call and put options of either European or
American style on a single stock or an index. For Payoff, there are respectively
Call = max{ST − K,0} or Put = max{K − ST ,0}, where St is the time-t price of
the underlying stock or equity index.
Equity index options are actively traded in the market. Many exchanges have
listed equity index options which are traded with decent volume. For single stock
options, even though listed at some of the exchanges (e.g. CBOE–Chicago Board
Options Exchange since 1973), they are still traded mainly in OTC market with a far
lower volume compared to index options. Single stock options listed at CBOE have
American style and have physical settlement at expiration (securities are delivered),
whereas the index options have cash settlement at expiration, and often are larger
sized contracts.
Example 8.1 The S&P500 option at CBOE is $100 ×max{Final Index−Strike,0}.
If the value of the index is 2100 at expiry and the strike price is 2000, the option
will be exercised. The option holder will receive $100×(2100−2000) = $10,000.
## 8.2.2 Foreign Exchange Options
The vanilla FX options are the call/put options giving the right to buy/sell the base
currency with the counter currency. Let Xt be the exchange rate. For Payoff, there
are FX Call = max{0,XT − K} and FX Put = max{0,K − XT }.
One particular feature of an FX option (known as FX Option Duality, see
Sect.18.3) is that for a pair Ccy1/Ccy2, a call option on Ccy1 (the right to buy
Ccy1 with Ccy2) is actually the put option on Ccy2 (the right to sell Ccy2 against
Ccy1) with nominal amount of KX0. That is why practitioners use the language
like: buying USD50m, 1-month, at-the-money forward dollar Call, yen Put.
## 8.2.3 Commodity Options
Depending on the commodity, the vanilla option is linked to either the spot price
(e.g. Gold), or the most nearby futures contract’s price (e.g. WTI) at expiration of
the option. For Payoff, there are Call = max{0,ST −K} or Put = max{0,K −ST },
where ST is the underlying price at maturity. At some of the exchanges (e.g. CME,
ICE), both European and American options on futures contracts are listed.8.2 Vanilla Options 71
## 8.2.4 Interest Rate Options
For interest rate underlying, there are two types of Vanilla options: Cap/Floor and
Swaption.
Cap/Floor
A European call option on a floating interest rate (e.g. 3M USD Libor) for a
considered period (Ti−1,Ti) is called a caplet which takes the form
Caplet Payoff = N × δi × max{Ri − K,0},
where N,δi,Ri represent respectively, the notional amount, the day count fraction
and the reference interest rate covering (Ti−1,Ti). The caplet buyer is entitled
to receive a payment at the end of the period if the interest rate observed at the
beginning of the period exceeds the agreed strike price.
An Interest Rate Cap is a sum of consecutive caplets in which the buyer receives
payments at the end of each period where the interest rate exceeds the agreed strike
price common for all caplets:
Cap Payoff = N
m
i=1
δi max{Ri − K,0}.
Example 8.2 Someone obtained a USD 1m, 10 year mortgage from a bank with
monthly interest payments at 1 month USD Libor +2%. Concerned by the risk of
interest rate increase in the future, he decided to buy a USD 1m, 10Y Cap with the
strike of 5%. Now, his effective monthly interest cost will be limited by 5% because
the impact from the 1 month USD Libor above 3% will be compensated by the short
party of the Cap.
Similarly, the European put option on interest rate is known as a floorlet when
it is applied to a specific period. An Interest Rate Floor is a sum of floorlets in
which the buyer receives payments at the end of each period where the interest rate
is below the agreed strike price:
Floor Payoff = N
m
i=1
δi max{K − Ri,0}.
Swaption
A swaption is an option giving the option holder the right but not the obligation to
enter into an IRS (Interest Rate Swap) which starts at T0 and matures at Tn, at a pre-
agreed swap rate K at the option expiry date T0. The option’s tenor is from today t0
until the expiry date T0. The swaption’s final payoff at T0 is72 8 Options
Payoff = N × A(T0,Tn)max{s(T0,Tn) − K,0},
where
s(T0,Tn) is the market swap rate at T0 of the IRS;
A(T0,Tn) is the annuity factor for the IRS.
Example 8.3 A 1Y, 2.5% strike call swaption linked to 10Y USD Swap rate gives
its holder the right but not the obligation for entering into the Swap with the short
party at the fixed rate of 2.5% at the expiry date in one year.
## 8.2.5 Option Pricing, Hedging and Execution
Option Hedging/Pricing
The price of an option is the cost of replicating the payoff. In other terms, option
price is its hedging cost. As seen from studies in the modelling part of the book,
the replication/hedging in complete market1 is based on the sensitivity of the option
price (Vt) with respect to the underlying’s price (St) change which is called delta
(Δt = dVt
dSt
). The option hedging consists of dynamically buying or selling the
underlying according to Δt, which is called delta hedging.
Black–Scholes–Merton (BSM) model2 is the first and the most popular model for
optionhedgingandpricing.Underthismodel,theasset’spricefollowsthestochastic
differential equation: dSt/St = μdt + σdWt, where μ represents the drift, σ is
called the volatility for the underlying asset representing the annualized standard
deviation of its log return, and Wt is known as the Brownian motion which depicts
randomness in asset prices [74].
Option Execution
The option execution is directly based on the hedging of the option. The trade order
is said to be “done” (or “filled”) when the initial delta is executed by the option
writer or issuer in the market. The execution of the delta means the buying or selling
of the underlying according to the quantity indicated by the delta. The price at
which the delta is executed will serve as initial spot reference in the option contract.
For placing a limit order for a trade with more than one underlying, the limit will be
set for one underlying and the initial delta for other underlyings will be executed at
Market.
1Roughly speaking, in a complete market, all contingent claims can be replicated with (dynamic)
positions of underlying assets.
2In fact, BSM model has been adapted for different asset classes which carry different names:
Garman–Kohlhagen model for currencies and Black model for interest rates.8.2 Vanilla Options 73
Vanilla Option Pricing
For vanilla options of European style, the market participants use mainly the so-
called Black&Scholes (B&S) formula3 derived in BSM model:
c0 = S0N(d1) − e−rT
KN(d2), p0 = e−rT
KN(−d2) − S0N(−d1),
where c0 and p0 are the call and put option prices with maturity T and strike K,
r is the continuous interest rate, S0 is the spot price of the underlying asset with
volatility σ,
d1 =
ln S0
K + (r + 1
2σ2)T
σ
√
T
and d2 = d1 − σ
√
T
N(z) =
1
√
2π
 z
0
e−x2
2 dx is the standard Normal cumulative distribution function
Apart from the option features such as its tenor and strike price, other factors
impacting the option price in BSM model are the volatility of the underlying and the
interest rate. Volatility is the most important parameter for an option trader or risk
manager as the impact from interest rate is relatively small. From Black&Scholes
formula, we can see the one-to-one relationship between the option price and the
volatility σ of the underlying with the other parameters fixed.
Option Quotation
Equity options are quoted by strike and by tenor in the market. The strike is
expressed as a percentage of the initial spot reference which depends on the type of
the order. FX options are quoted by delta (Δ) and tenor. In FX option market, people
prefer toquote thevanilla options by itsdelta(calculated withB&S formula) instead
of its strike.4 The benchmark market quotes are ATM 50%Δ,25%Δ,10%Δ. Bisesti
etal.[9]givesagood overview ofmarketpractice forFXoptions.For Cap/Floor,the
market quotes are available by strike and by tenor. For Swaptions, they are quoted
in the market by strike, option tenor and the underlying swap tenor.
## 8.2.6 Implied Volatility
The implied volatility of an option is the volatility value derived from the option
price quoted in the market. Even though the volatility has a unique value in BSM
model given the underlying, the implied volatility may be different for options with
3The Black&Scholes formula presented here is for non dividend paying stocks with zero repo rate.
Similar formulas can be derived for the general case as well as other asset classes.
4Given the price of an option, there is a one-to-one relationship between delta and strike using the
B&S formula.74 8 Options
Fig. 8.2 Example of
volatility smile for equity
options
80 85 90 95 100 105 110 115 120
16
17
18
19
20
21
22
Strike (%)
Volatility (%)
different tenors and strikes. For the same expiration date, the implied volatilities
from the options of different strike prices show a pattern which is called volatility
smile or volatility skew. For equity options, the smile normally takes the shape
shown in Fig.8.2.
There are various reasons for explaining the volatility smile for equity underly-
ing, including
1. imperfection of the BSM model: BSM model implies log normal distribution
for the return of the underlying. The historical data confirm that the “real”
distribution shows fatter tails (kurtosis) and steeper asymmetry (skewness).
Market participants use the adjusted volatility for matching the “correct” option
price observed in the market.
2. demand/offer: the demand/offer for options of different strike prices influences
the market prices. For instance, institutional investors such as insurance compa-
nies and fund managers tend to buy OTM equity index put options for hedging
the long exposure on equities. This results in higher prices for OTM put options
implying higher implied volatility compared to the implied volatility for strike
prices above the current spot.
The volatility for a future period [t1,t2], 0 = t0 < t1 < t2, can be derived with
the additivity of variance: σ(t1,t2)2(t2 − t1) = σ2
2 t2 − σ2
1 t1. It may be used for
pricing forward starting options.
## 8.2.7 Put-Call Parity
Proposition 8.1 (Put-Call Parity) Let ct, pt and Ft be respectively the time-t
prices for the European call, European put and forward with the same maturity
T and strike K. Then, we have8.2 Vanilla Options 75
ct(T,K) − pt(T,K) = Ft(T,K), ∀t ≤ T.
Proof It is obvious that max{ST − K,0} − max{K − ST ,0} = ST − K, ∀T > 0.
If Put-Call Parity is not verified, we then have an arbitrage opportunity by selling
the over valued leg and buying the other two legs with lower price. The payoff at
maturity will be 0 for the sum of all the legs. 
For a non-dividend-paying stock with zero repo rate, we have Ft = St −
e−r(T−t)K (See the remark in Proposition 3.1 in Chap.3) leading to
ct(T,K) − pt(T,K) = St − e−r(T−t)
K.
Put-Call Parity Illustration
ST
Payoff
K
Call
Put
Remark 8.1
• This arbitrage forces the vanilla call and put options with the same strike level to
have the same implied volatility value.
• It illustrates an interesting case that the combination of two options is no more
an option.
## 8.2.8 Popular Strategies with European Options
European options can be used to take advantage of specific views on the future
prices of the underlying asset. It can be proved that any option payoff of European
style can be represented as the combination of European call and put options (cf.
Sect.19.4 “Static Hedging for European Style Options” in Chap.19) of the same
maturity.5
5The call and put payoffs are half-lines with slope ±1 (related to 45◦ angle). For the graphical
representation based on a fixed notional, the slope will change if we change the exposure (effective
notional) to the option. It is not difficult to imagine that any payoff at a given maturity date can be
presented by a combination of call and put options with different levels of exposure.76 8 Options
Without loss of generality, we assume that the underlying asset is a stock, but
similar patterns can be obtained for any other underlying such as a foreign exchange
rate, a stock index, and a futures contract. Below is a list of well-known option
strategies:
Call Spread
ST
Payoff Put Spread
ST
Payoff
Call Ratio 1 × 2
ST
Payoff
0
Risk Reversal
ST
Payoff
0
Butterfly
ST
Payoff
0
Straddle
ST
Payoff
0
Call Spread (also called Vertical Bull Spread): It is a position of long 1 call at K1,
short 1 call at K2 (K1 < K2). It is a cheap way to take advantage of bullish view.
The price of the whole package is sensitive to the Skew instead of volatility if K1
and K2 are close.
Put Spread: It is a position of long 1 put at K1, short 1 put at K2 (K1 > K2). It is a
cheap way to take advantage of bearish view.
Risk Reversal: long 1 OTM call at Kcall and short 1 OTM put at Kput (Kput <
Kcall) such that the option premium at inception is close to zero.
Butterfly: long call at strike K1, short 2 calls at strike K2 and long call at strike K3
where K1 < K3 and K2 = (K1 + K3)/2. A butterfly spread leads to a profit if
the stock price stays close to K2.
Collar: the position of being long share, long OTM put option and short OTM call
option
Straddle: long call and long put with same strike (usually ATM) and the same
maturity
Strangle: long OTM call and long OTM put with the same maturity
Call Ratio: a popular strategy used by hedge funds is one-by-two (1 × 2) i.e. long
one call at strike K1 and short two calls at strike K2 where K1 < K28.2 Vanilla Options 77
Covered call (also called Buy/Write): a strategy where the investor has a long
position of the underlying asset and a short position of an OTM call on the asset.
In a covered call, the underlying asset of the investor may serve as collateral for
his short call position, which mitigates the counterparty credit risk for the long
party (usually an investment bank). It is a popular strategy for monetizing the
stock holding when the view on the underlying is not strongly bullish for the
short term.
Calendar Spread: it is formed by options with different expiration dates. Since we
usually use x-axis to denote time, it is also called horizontal spread. It can be
used for forward volatilities arbitrage.
Hedge funds often trade slightly OTM call/put options for getting the directional
exposure by paying less timevalue. Very often they unwind theoption before expiry.
That is why hedge funds tend to trade more liquid options instead of customized
exotic options which are more difficult to unwind in the market.
## 8.2.9 American Options
An American option is one that may be exercised at any time prior to expiry by its
holder. If the option can be exercised only at discrete time points (e.g. every month),
it is called a Bermuda option. But sometimes Bermuda options are called American
options as well.
An American option holder must assess when it is the best time to exercise the
option. Actually, as we will see in the modelling part, the optimal decision is when
the exercise payoff is higher than the price of the remaining American option if the
holder does not exercise.
Let ct(K,T) and pt(K,T) denote the time-t price of the European call option
and put option with strike K and expiry T, respectively while Ct(K,T) and
Pt(K,T) denote that of the American call option and put option, respectively. Due
to its exercise right at the discretion of the option holder, an American option’s price
should be at least the price of its counterpart European option, i.e.,
Proposition 8.2 Ct(K,T) ≥ ct(K,T) and Pt(K,T) ≥ pt(K,T).
However, there is a particular case where the American call is worth the same as
the European call.
Proposition 8.3 The price of an American call is equal to the price of the
corresponding European call if
– zero dividend and zero repo rate for the underlying during the tenor of the option
are assumed, and
– the interest rate r is nonnegative.78 8 Options
Proof We first show that
ct(K,T) ≥ max{0,St − e−r(T−t)
K}, ∀t < T.
Define two portfolios at date t:
Portfolio A: Long ct(K,T) + a bond with the value of e−r(T−t)K
Portfolio B: Long one share St
At maturity T, we have
Portfolio A: max{0,ST − K} + K = max{ST ,K}
Portfolio B: ST (no dividend payment)
Hence, we should have A ≥ B, for any time until maturity, i.e. ct(K,T) +
e−r(T−t)K ≥ St, or
ct(K,T) ≥ max{0,St − e−r(T−t)
K} (because ct(K,T) ≥ 0).
Consequently, we have the following inequalities
Ct(K,T) ≥ ct(K,T) ≥ max{0,St − e−r(T−t)
K} ≥ max{0,St − K} (as r ≥ 0).
Because the early exercise price is max{0,St − K}, it is not optimal for the option
holder to exercise the option before the maturity (the option holder should sell the
option instead of exercising it). Therefore,
Ct(K,T) = ct(K,T). 
Proposition 8.3 implies that one should not exercise an American call option on
a non-dividend paying stock with zero repo rate before its expiry, if the interest rate
is nonnegative. If the option holder thinks that the stock is currently overpriced and
wants to lock in his gain, he is better off selling the option rather than exercising it.6
For investors, with the same option premium, it is always more advantageous to
hold the American option instead of the European one because, if ever he wants to
early terminate the option, he has the certainty of receiving the intrinsic value. With
the European option, the option seller usually charges an unwinding fee which may
lead to an unwind value lower than the intrinsic value.
## 8.3 Exotic Options
Any option that is not a vanilla option is an exotic option. Each exotic option offers
a specific exposure to the performance of the underlying. The exotic options are
6Nevertheless, it may be optimal to exercise an American put option on a non-dividend-paying
stock before its maturity.8.3 Exotic Options 79
often used as part of a structured product or a customized solution. If the payoff is
determined by more than one price of a single underlying in the future, the option is
called path-dependent.
Let us introduce a few notations that will be used in the following context:
1condition is the indicator function which returns 1 if condition = true, else 0
max
t∈[t1,t2]
St is the maximum value of St, ∀t ≥ t1 and t ≤ t2
min
t∈[t1,t2]
St is the minimum value of St, ∀t ≥ t1 and t ≤ t2.
## 8.3.1 Barrier Option
The barrier option is a kind of call or put option which either comes into existence
(“knock-in”) or becomes worthless (“knock-out”) based on a certain condition
linked to the performance of the underlying. The terms such as down-and-in, down-
and-out, up-and-in, up-and-out are used for indicating the condition. For instance,
the payoff of down-and-in put is max{K − ST ,0}1 min
t∈[0,T]
St≤L and the payoff of up-
and-out call is max{ST − K,0}1 max
t∈[0,T]
St<H.
ST
Payoff Up & Out Call
0 ST
Payoff Down & In Call
0 ST
Payoff short Down & In Put
0
Because of the extra condition, either Knock-in or Knock-out, the barrier options
are cheaper than the underlying vanilla options which explains the popularity in
practice. It is easily seen from in-out parity; see Sect.8.3.3.
Example 8.4 One popular derivative product listed at the HK Stock Exchange is the
“callable bull/bear contracts” (CBBC). Consider a Bull CBBC with exercise price
$80, barrier (known as the call price) $83 and the underlying stock price of $100 on
the issue date. If the stock price breached call price at any time before the expiration
date, then the contract is called (i.e. terminated). The residual value of the Bull
CBBC at the call is $83−$80 = $3. If the Bull CBBC has never been called, and if
at expiry, the 5-day average closing price is $120, then the value of the Bull CBBC
at expiry is $120−$80 = $40. It is actually a “down-and-out” call option with ITM
strike.80 8 Options
## 8.3.2 Binary (or Digital) Option
A binary option pays off a fixed amount (either cash or asset) if a certain condition
is met; otherwise, 0. There are two main types of binary options:
• European binary option: the condition depends on the final price of the underly-
ing. For instance, the payoff of a binary call option is 1ST ≥H. The payoff of a
binary put is 1ST ≤L.
• American binary option: the condition depends on the maximum or minimum
price of the underlying observed over a period. It is also called a touch option.
For instance, the payoff of a one-touch option is 1 max
t∈[0,T]
St≥H, S0 < H. The payoff
of a double-no-touch is 1 min
t∈[0,T]
St≥L

max
t∈[0,T]
St≤H, L < S0 < H. In the FX option
market, the touch options are actively traded and considered as vanilla options
for the major currency pairs.
ST
Payoff European
Binary Call
S0
0 ST
Payoff Up & In Binary
(One Touch)
S0
0 ST
Payoff Double No Touch
S0
0
## 8.3.3 In-Out Parity
Similar to put-call parity for European options, there is in-out parity for barrier
options which states that a vanilla option is equivalent to the sum of a knock-in
option and a knock-out option. Actually, from 1 = 1 min
t∈[0,T]
St≥L + 1 min
t∈[0,T]
St<L, we
obtain
Payoff(T) = Payoff(T) · 1 min
t∈[0,T]
St≥L + Payoff(T) · 1 min
t∈[0,T]
St<L.
For instance, a down-and-in put option is equivalent to a vanilla put option minus
a down-and-out put option. Following the same rationale, an up-and-out call option
with rebate c (paying out c when the call option is knocked out) can be seen as
an up-and-out call (without rebate) plus an up-and-in binary option paying c (i.e.
call · 1 max
t∈[0,T]
St<H + c · 1 max
t∈[0,T]
St≥H).8.3 Exotic Options 81
## 8.3.4 Asian Option or Average Option
An Asian option is like a vanilla option except that the final underlying price and/or
the strike price is replaced by the averaged value of the underlying over a predefined
period. For instance, the payoff of an Asian call option with averaging at the end (we
say Asian Tail or Asian Out) is max

1
m
n 
i=n−m+1
Sti − K,0

. When the averaged
price of the underlying is used as strike, the option is called Asian strike option, e.g.
max

Stn − 1
m
m−1 
i=0
Sti ,0

.
The Asian option offers a smoother payoff compared to a European Vanilla
option which depends entirely on the single price of the underlying at maturity.
Another application of Asian option is for managing the risk of “striking” and
“expiry” that will be explained further in Chap.16.
Example 8.5 Warrants in the HK Stock Exchange use the arithmetic average of the
closing prices in the final 5 trading days as the final price reference when computing
the payoff of the warrant.
## 8.3.5 Lookback Option
In this type of option, the maximum or minimum asset price sampled during a
certain period is used as either the performance (lookback spot) or as the initial
reference (lookback strike) in the calculation of the option payoff. For instance, a
call option paying off
max

ST
S∗
0
− 1,0

, S∗
0 = min{St1,St2,...,Stm}, tm ≤ T
is called a lookback strike call. A call option paying off
max

S∗
T
S0
− 1,0

, S∗
T = max{Stn−m+1,...,Stn−1,Stn}, tn = T
is called a lookback spot call.
## 8.3.6 Quanto Option and Composite Option
When the payoff currency is different from the underlying’s currency, there exist
two well-known options called Quanto option and Composite option.82 8 Options
The term quanto is used to indicate that the performance from the underlying is
only measured in its domestic currency without taking into account any impact from
the currency exchange rate. For instance, the payoff for a USD5m, USD Quanto call
option linked to BNP Paribas stock quoted in EUR is simply
USD5m × max

ST
S0
− K,0

paid out in USD. Quanto option is a natural product for investors. It does not require
the investor to have a view on the FX rate changes.
The Composite option (aka Compo) is another type of option for the situation
where the payoff currency is different from the underlying’s currency. In this option,
the performance from the underlying is derived from the underlying price converted
into payoff currency with the prevailing FX rate. For instance, the payoff for a
USD5m, USD Compo call option linked to BNP Paribas stock is
USD5m × max

S$
T
S$
0
− K,0

paid out in USD where S$
t = StXt with St being the price of BNP Paribas stock in
EUR and Xt being the EUR/USD rate at time t. As only StXt is used in the payoff, it
can be considered as the price of a “composite stock” in payoff currency. Hence, the
option price is not sensitive to the future change of the interest rate of the domestic
currency of the stock.
## 8.3.7 Basket Option, Worst-of and Best-of Options
Denote Si
t as the price of stock i at time t. The basket call option takes the form
Payoff = max

1
n
n
i=1
Si
T
Si
0
− K,0

.
Because of the averaging, the basket option is smoother than a single underlying
option in general.
A worst-of option takes the minimum performance of the basket of the underly-
ing assets. The payoff of a worst-of call option is
Payoff = max

min
i

Si
T
Si
0

− K,0

.8.4 Derivatives Modelling Framework 83
Evidently, this option price tends to be low when the size of the basket increases
or the basket has low correlation. Due to its low price, worst-of options are widely
used in structured solutions which often have a tight constraint on cost.
The best-of option takes the maximum performance of the basket of the
underlying assets. A best-of call option has the payoff like
Payoff = max

max
i

Si
T
Si
0

− K,0

.
A rainbow basket takes its performance as the weighted average of the indi-
vidual performance of the underlyings according to their performance ranking. For
instance, one can define a rainbow basket taking 70% of the worst, 30% of the
second worst and 0% for the rest of the underlyings. Worst-of’s and Best-of’s are
special cases of rainbow options.
## 8.4 Derivatives Modelling Framework
## 8.4.1 Purpose of Derivatives Modelling
In its normal course of business, the derivatives provider (i.e. the derivatives writer)
will replicate the P/L of the derivatives based on pricing models. The replication
(known as hedging) is a dynamic process over the whole life of the trade. For
example, the seller of a call option linked to a stock will hold a certain quantity
of stocks for producing the P/L of the option due to the stock price change. The
quantity of stocks to be held at any time is determined by the pricing model. We list
out the main purposes of modelling
– pricing for new transactions (primary market), especially for the OTC derivatives
that do not have liquid market quotations
– pricing for size increase or unwinding of an existing trade (secondary market)
– mark-to-market (MtM) price calculation
– hedging related quantities which are, as we will see, the sensitivities (also called
Greeks) of the derivative product
– risk reporting
– regulatory capital requirement for financial institutions
## 8.4.2 Model Input Parameters and Calibration
The models require specific parameters. The determination of the model parameters
is called calibration or fitting. The calibration targets to minimize the difference
between the prices calculated by the model and the market quoted prices for the84 8 Options
liquid tradable derivatives linked to the considered assets. So, the calibration is an
optimization problem if there is no direct calculation of the model parameters from
market quoted prices of the derivatives.7 If its calculation is fast, the calibration
may be done “on-the-fly”, meaning that the model is re-calibrated just before each
pricing.
Generally, the liquid market quoted derivatives are vanilla options of each asset
class and other basic instruments such as Forward/Futures, Swaps, and CDS. The
vanilla options are normally priced with closed-form solutions in the market. For a
typical financial institution offering and hedging derivatives, the vanilla products
traders are responsible for the market prices of the instruments which are used
for calibrating the models. The exotic option traders, structurers, sales and risk
controllers8 are the main users of the calibrated models for pricing and hedging.
Exercises
1. Choose a trading warrant (can be found on any issuer’s website) and verify how
the gearing ratio and entitlement ratio are calculated.
2. Construct a portfolio of n T-maturity call options with strike prices 0 < K1 <
K2 < ··· < Kn such that its payoff replicates a piecewise linear pattern with line
segment slope mi between break points Ki and Ki+1, for i = 1,2,...,n − 1.
3. The implied volatilities for 30 days and 60 days (assuming same strike) are 15%
and 12% respectively. Calculate the forward volatility between days 31 and 60.
4. An investor is long a call option on a stock which will expire in a month. The
strike is $100, the current stock price is $110.
(i) what is the intrinsic value of the call?
(ii) what is the term given to the difference between the mark-to-market price
and intrinsic value?
(iii) Is the option premium the expected value of the payoff?
5. An investor has bought a 3-month ATM European call option for 10,000 stocks.
The underlying stock does not pay any dividend and the stock lending rate is
zero. Its current stock price is $100. The interest rate in the market is 2% p.a.
(continuous rate, ACT/365). The implied BSM volatility of the stock is 25%.
(i) What is the strike price of the option?
(ii) Calculate the payout for the investor for the stock price at the expiry date at
$120 and $70.
7Levenberg–Marquardt algorithm is the most popular optimization method used in financial
modelling.
8Risk controllers are also responsible for supervising the correctness of the inputs from traders.8.4 Derivatives Modelling Framework 85
(iii) Use the Black–Scholes formula for Call options to calculate the initial call
option price with stock price of $100 and $101. Deduce the approximate
value of the initial delta.
(iv) Based on the above result, how many shares (i.e. delta position) should the
option seller hold for initial delta-hedging?
(v) If the share price moves up by 1%, what is the gain from the delta position?
What is the gain if the option seller holds 10,000 stocks?
(vi) Someone thinks that it is better for the option seller to hold 10,000 stocks
instead of holding the delta amount for hedging as the gain will be higher if
the stock price goes up. Do you agree with this hedging strategy? Why?
(vii) Use the Put-Call parity to deduce the European put option price with the
same strike and tenor from the above result.Part II
Stochastic Calculus and Financial
ModellingChapter 9
Elements of Probability
In this chapter, we introduce the basic concepts and notations in probability that
will be used or referenced to in the following chapters. We refer to [42] for further
studies.
## 9.1 Probability Space, Measure and Properties
A sample space Ω is a nonempty set of all the possible outcomes from a random
experiment. For example, the coin toss of n times has Ω = {ω : ω = ω1ω2 ···ωn}
with 2n elements and ωi is H (head) or T (tail), ∀i = 1,...,n. A subset of Ω,
A ⊆ Ω, is called an event, say, first toss being a head.
A partition of Ω is defined as a collection of nonempty sets of Ω (known as
blocks of the partition), {A1,A2,...,An}, which satisfies the following:
(i) Ai are disjoint: ∀i = j, Ai ∩ Aj = ∅
(ii) A1 ∪ A2 ∪ ··· ∪ An = Ω.
Definition 9.1 (σ-algebra) Let F be a collection of subsets of Ω and it is called a
σ-algebra if it satisfies:
(i) F is closed under complements: A ∈ F ⇒ Ac ∈ F
(ii) F is closed under countable union: ∀A1,A2,... ∈ F ⇒
∞
i=1 Ai ∈ F
(iii) the empty set ∅ is in F: ∅ ∈ F (hence Ω ∈ F as Ω = ∅c).
It can be shown that a σ-algebra is closed under intersections and set differences:
∀A,B ∈ F ⇒ A ∩ B ∈ F and A\B ∈ F (A\B is sometimes noted as A − B).
For finite sample spaces, the notions of partition and σ-algebra are equivalent.
In probability theory, σ-algebra is used to represent a set of events. The smallest
σ-algebra generated by intervals in R is called Borel σ-algebra.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_9
8990 9 Elements of Probability
Definition 9.2 (Probability) Let F be a σ-algebra on Ω. A probability measure P
is a function such that:
(i) 0 ≤ P(A) ≤ 1, ∀A ∈ F
(ii) P(Ω) = 1
(iii) Countable additivity: P(
∞
i=1 Ai) =

i=1
P(Ai), for disjoint sets Ai ∈ F, i =
1,2,....
The triplet (Ω,F,P) is then called a probability space. If P(A) = 1, then, we
say that the event A occurs P-almost surely (or simply, almost surely, a.s.).
Example 9.1 Let Ω = {1,2,...} be the set of all natural numbers, A1 ⊂ Ω the set
of all even numbers, A2 ⊂ Ω the set of all odd numbers, and F = {∅,Ω,A1,A2}
is a σ-algebra. Defining P(A1) = P(A2) = 1
2, then, (Ω,F,P) is a probability
space.
Here are some properties for probability measure:
(i) P(∅) = 0, P(Ω) = 1
(ii) P(Ac) = 1 − P(A)
(iii) P(A ∪ B) = P(A) + P(B) − P(A ∩ B)
(iv) if A and B are disjoint, then P(A ∪ B) = P(A) + P(B)
(v) if A ⊆ B, then P(B\A) = P(B) − P(A)
(vi) if A ⊆ B, then P(A) ≤ P(B).
Theorem 9.1 (Law of Total Probability) Let {B1,B2,...,Bn} be a partition of
Ω. Then, ∀A ∈ F,
P(A) =
n
i=1
P(A ∩ Bi).
## 9.2 Independence and Conditional Probability
Given (Ω,F,P), the events A ∈ F and B ∈ F are independent if
P(A ∩ B) = P(A)P(B).
A collection of events {A1,...,An} are independent if, for every sub-collection of
at least two events {Ai1,Ai2,...,Aik }, k = 2,...,n,
P(Ai1 ∩ Ai2 ∩ ··· ∩ Aik ) = P(Ai1)P(Ai2)···P(Aik ).9.2 Independence and Conditional Probability 91
Example 9.2 Sophie has 3 coins in her pocket, 2 Euro coins and 1 Pound coin. She
takes out randomly one coin, and then takes out another one after putting the first
one back in.
Let A be the event that the first coin is Euro and B the event that the second coin
is Euro. Then,
P(A ∩ B) =
4
9
=
2
3
×
2
3
= P(A)P(B).
The conditional probability of event A ∈ F given event B ∈ F with P(B) > 0
is defined as
P(A|B) =
P(A ∩ B)
P(B)
.
Properties of conditional probability are
(i) 0 ≤ P(A|B) ≤ 1
(ii) P(Ω|B) = 1
(iii) P(Ac|B) = 1 − P(A|B)
(iv) P(A1 ∪ A2|B) = P(A1|B) + P(A2|B) − P(A1 ∩ A2|B)
(v) if A1 and A2 are disjoint, then P(A1 ∪ A2|B) = P(A1|B) + P(A2|B).
Example 9.3 From the previous example, suppose Sophie takes out the second coin
without putting the first one back in. Let A be the event that the first coin is Euro
and B the event that the second coin is Euro. Then,
P(A) = P(B) = 2
3
P(A ∩ B) = 1
3 = P(A)P(B).
Conditional probability for first getting Euro and then Euro again: P(B|A) =
P(A ∩ B)
P(A)
=
1/3
2/3
=
1
2
.
Let {B1,B2,...,Bn} be a partition of Ω and P(Bi) > 0,i = 1,...,n. The
following is a revised version of Theorem 9.1.
Theorem 9.2 (Law of Total Probability) For ∀A ∈ F,
P(A) =
n
i=1
P(A|Bi)P(Bi).
Theorem 9.3 (Bayes’ Rule) For ∀A ∈ F and ∀k = 1,...,n,
P(Bk|A) =
P(A|Bk)P(Bk)
n
i=1 P(A|Bi)P(Bi)
.92 9 Elements of Probability
## 9.3 Random Variable and Distribution
Definition 9.3 (Random Variable) Let (Ω,F,P) be a probability space and B
an interval1 in R. A (real) random variable is a function X(ω) (or, with simplified
notation X): Ω → R such that
{X(ω) ∈ B} ∈ F,
where {X(ω) ∈ B} is the notation for {ω ∈ Ω;X ∈ B}.
It is customary to denote
• P{X = x} (i.e. P{ω ∈ Ω : X(ω) = x}) by P(X = x) or P[X = x]
• P{X ∈ B} (i.e. P{ω ∈ Ω : X(ω) ∈ B}) by P(X ∈ B) or P[X ∈ B].
One particular random variable is the indicator function for A ∈ F:
1A(ω) =

1, if ω ∈ A,
0, if ω ∈ A.
## 9.3.1 Distribution
The function F(x) = P{X ≤ x} for random variable X and x ∈ R is called the
cumulative distribution function (c.d.f.) of X. It has the following properties:
(i) F(x) is nondecreasing of x
(ii) 0 ≤ F(x) ≤ 1, lim
x→−∞
F(x) = 0, lim
x→∞
F(x) = 1
(iii) F is right continuous: lim
y↓x
F(y) = F(x).
For a continuous random variable, there is P{a ≤ X ≤ b} = F(b)−F(a),∀a ≤ b.
For a discrete random variable, P{X = x} = F(x) − F(x−).
The integrable function f is called probability density function (p.d.f.) of X if
F(a) =
 a
−∞
f(x)dx, ∀a ∈ R.
We have P{a ≤ X ≤ b} =
 b
a
f(x)dx. The derivative of c.d.f. gives back the
p.d.f., F(x) = f(x). Moreover, we have
 ∞
−∞
f(x)dx = P{X ∈ R} = 1 which is
the continuous case of probability adding up to 1.
1More generally, a Borel set on the real line.9.3 Random Variable and Distribution 93
Let (X1,X2) ∈ R2 be a vector of two random variables. The joint distribution
function of (X1,X2) is defined as
F(a,b) = P{X1 ≤ a, X2 ≤ b}.
If (X1,X2) is a continuous random vector, then, the joint probability density
function is the function f(x1,x2) such that
F(a,b) =
 b
−∞
 a
−∞
f(x1,x2)dx1dx2.
For (X1,X2) with density f(x1,x2), the marginal cumulative distribution function
of X1 is defined as
FX1(a) =
 a
−∞
fX1(x1)dx1,
where fX1(x1) =
 ∞
−∞
f(x1,x2)dx2 is called the marginal density.
More generally, let (X1,X2,...,Xn) be a vector of random variables. The joint
distribution function of (X1,X2,...,Xn) is defined as
F(a1,a2,...,an) = P{X ≤ a1,X2 ≤ a2,...,Xn ≤ an}.
If (X1,X2,...,Xn) is a continuous random vector, then, the joint probability
density function is the function f(x1,x2,...,xn) such that
F(a1,a2,...,an) =
 an
−∞
 an−1
−∞
···
 a1
−∞
f(x1,x2,...,xn)dx1dx2 ···dxn.
## 9.3.2 Expectation
The expectation of a random variable is the probability weighted average.
For a discrete random variable X ∈ {x1,x2,...,xn} on the probability space
(Ω,F,P), it is defined as
E[X] =
n
i=1
xiP{X = xi} or E[X] =
ω∈Ω
X(ω)P(ω).94 9 Elements of Probability
For a continuous random variable in R with density f(x), the expectation is
defined as
E[X] =
 +∞
−∞
xf(x)dx.
Expectation of a random variable can be denoted by Lebesgue integral. Readers may
refer to [62, 73].
For the traditional Riemann integral
b
a f(x)dx, x is partitioned for the interval
[a,b] with step size Δi and the integral’s value is the limit lim
n→∞
n 
i=1
f(xi)Δi.
The equivalent Lebesgue integral consists of partitioning the value of f(x)
(...,fi,fi+1,...) in the domain D = {f(x),∀x ∈ [a,b]}. The Lebesgue integral
is defined as

D fdx = lim
n→∞
n 
i=1
fiμ{fi} where μ{fi} is the measure of fi which,
in this case, is the sum of lengths of all the disjoint intervals Ii
k,k = 1,2... such
that fi ≤ f(x) < fi+1,∀x ∈ Ii
k. When both can be defined for the same problem,
the two integrals will give the same value.
Example 9.4 Consider the following Lebesgue integral:
0
− y1
− y2
− y3
X
Y
x1x2 x3 x4 x5

R
ydx ≈ y1 × [(x3 − x2) + (x5 − x4)] + y2 × [(x2 − x1) + (x4 − x3)].
Lebesgue integral is more general than the Riemann integral. When the measure
is the probability measure, the Lebesgue integral gives the unified notation of
expectation for a random variable which can be either discrete or continuous:
E[X] =

Ω
X(ω)dP(ω), or simply, E[X] =

Ω
XdP.9.3 Random Variable and Distribution 95
In the above expression, dP(ω) represents the probability measure for X(ω). For the
continuous case, dP(ω) = f(x)dx where f(x) is the probability density function.
We have E[X1A] =

Ω X1AdP =

A XdP. In particular, the expectation of 1A
can be reduced as the probability of A:
E[1A] =

Ω
1A(ω)dP(ω) =

A
dP(ω) = P(A).
## 9.3.3 Variance and Covariance
The variance of a random variable X is defined as
Var(X) = E[(X − E[X])2
],
where σ =
√
Var(X) is called the standard deviation of X.
Properties of variance are
(i) Var(c) = 0, if c is a constant
(ii) Var(cX) = c2Var(X), if c is a constant
(iii) if X,Y are two independent random variables, then Var(X + Y) = Var(X) +
Var(Y).
The i-th moment of the random variable X is defined as E[Xi], i = 1,2,..., if
it exists. For instance, the second moment E[X2] is involved in variance.
The covariance of two random variables X and Y is defined as
Cov(X,Y) = E[(X − E[X])(Y − E[Y])].
The correlation between X and Y is defined as
ρ =
Cov(X,Y)
√
Var(X)Var(Y)
or ρ =
Cov(X,Y)
σXσY
and there is
Var(X + Y) = Var(X) + Var(Y) + 2Cov(X,Y).
Properties of covariance are
(i) Cov(X,Y) = E[XY] − E[X]E[Y]
(ii) Cov(X,Y) = Cov(Y,X)
(iii) Cov(aX,bY) = abCov(X,Y)
(iv) Cov(X + Y,Z) = Cov(X,Z) + Cov(Y,Z)96 9 Elements of Probability
## 9.3.4 Independent Random Variables
The random variables X1,X2,...,Xn are said to be independent if for Borel sets
Bi,
P{X1 ∈ B1,X2 ∈ B2,...,Xn ∈ Bn} = P{X1 ∈ B1}P{X2 ∈ B2}···P{Xn ∈ Bn}.
For independent random variables X1,X2,...,Xn, the following properties hold
Joint cumulative distribution: FX1,X2,...,Xn(a1,a2,...,an) = FX1(a1)FX2(a2)···
FXn(an), where FXi (ai) represents the cumulative distribution function of Xi
Joint density: if X1,X2,...,Xn are continuous random variables with densities
fX1,fX2,...,fXn and joint density fX1,X2,...,Xn(x1,x2,...,xn), then,
fX1,X2,...,Xn(x1,x2,...,xn) = fX1(x1)fX2(x2)···fXn(xn)
Expectation: E[X1X2 ···Xn] = E[X1]E[X2]···E[Xn] for continuous random
variables X1,X2,...,Xn.
## 9.3.5 Conditional Probability Distribution
The conditional cumulative distribution of continuous random variable X given y,
F(a|y) is defined by
F(a|y) = P{X ≤ a|Y = y} = lim
|Y−y|→0
P{X ≤ a|Y ∈ Δy}.
Here Y ∈ Δy means the event that Y is in the small interval including y. If f(x|y)
is a positive function and F(a|y) =
 a
−∞
f(x|y)dx, then, f(x|y) is called the
conditional probability density of X given Y = y. We have
f(x,y) = f(x|y)f(y),
where f(y) is the marginal distribution of Y.
The conditional expectation given Y = y is defined as
E[X|Y = y] =

Ω
xf(x|y)dx.
For discrete random variables X and Y, the conditional expectation of X given Y =
y is defined as
E[X|Y = y] =
i
xiP{X = xi|Y = y}.9.3 Random Variable and Distribution 97
## 9.3.6 Characteristic Functions
The characteristic function (or Fourier transform) of a random variable X is defined
below as, if it exists,
ΦX(t) = E[eitX
], t ∈ R, i2
= −1.
For a vector of random variables (X1,X2,...,Xn), the characteristic function, if it
exists, is defined below for tk ∈ R, k = 1,...,n,
ΦX1,X2,...,Xn(t1,t2,...,tn) = E[ei
n
k=1 tkXk ].
The moment-generating function (or Laplace transform) of a random variable X
is defined below as, if it exists,
MX(t) = E[etX
], t ∈ R.
For a vector of random variables (X1,X2,...,Xn), the moment-generating func-
tion, if it exists, is defined below for tk ∈ R, k = 1,...,n,
MX1,X2,...,Xn(t1,t2,...,tn) = E[e
n
k=1 tkXk ].
As dn
dtn E[etX]



t=0
= E[XnetX]|t=0 = E[Xn], the moment-generating function
can be used to calculate the n-th moment.
## 9.3.7 Normal Distribution
A Standard Normal Distribution X ∼ N (0,1) satisfies
• probability density function: f(x) =
1
√
2π
e−x2
2
• cumulative distribution function: N(a) =
 a
−∞
1
√
2π
e−x2
2 dx
See Fig.9.1 for reference. We have the important property of N(a)+N(−a) = 1.
Also N(−∞) = 0, N(0) = 1
2, and N(∞) = 1.
The probability density function f(x) is the famous “bell curve”. The mean or
expected value of X is E[X] = 0, and the variance of X is Var(X) = 1.98 9 Elements of Probability
−3.5 −2.5 −1.5 −0.5 0.5 1.5 2.5 3.5
0
0.05
0.1
0.15
0.2
0.25
0.3
0.35
0.4
0.45
0.5
Probability Density Function
−3.5 −2.5 −1.5 −0.5 0.5 1.5 2.5 3.5
0
0.2
0.4
0.6
0.8
1
Cumulative Distribution Function
Fig. 9.1 The probability density function (left) and cumulative distribution function (right) for a
standard normal random variable
The moment generating function is
MX(t) = E[etX
] =
1
√
2π
 ∞
−∞
etx
e−x2
2 dx
= e
t2
2
1
√
2π
 ∞
−∞
e−1
2 (x−t)2
dx = e
t2
2 N(∞) = e
t2
2 .
It generates moments of X because its derivatives at 0 give
M
(1)
X = te
1
2 t2
−−−→E[X] = M
(1)
X (0) = 0
M
(2)
X = (1 + t2
)e
1
2 t2
−−−→E[X2
] = M
(2)
X (0) = 1
M
(3)
X = (3t + t3
)e
1
2 t2
−−−→E[X3
] = M
(3)
X (0) = 0
M(4)
X = (3 + 6t2
+ t4
)e
1
2 t2
−−−→E[X4
] = M(4)
X (0) = 3
and etc. In general, the n-th moment can be directly calculated [62]
E[Xn
] =

0, when n is odd,
1 · 3···(n − 1), when n is even.
(9.1)
A General Normal Distribution with mean μ and variance σ2, denoted by Y ∼
N (μ,σ2), satisfies
• probability density function: f(y) =
1
√
2πσ
e
−(y−μ)2
2σ2 , −∞ < y < ∞
• cumulative distribution function: F(a) =
 a
−∞
1
√
2πσ
e
−(y−μ)2
2σ2 dy.9.3 Random Variable and Distribution 99
Note that
X ≡
Y − μ
σ
∼ N (0,1),
or equivalently Y = μ+σX. Then, the moment-generating function can be directly
obtained:
E[etY
] = E[et(μ+σX)
] = eμt
E[e(tσ)X
] = eμt+1
2 σ2t2
.
And by (9.1),
E[(Y − μ)n
] = σn
E[Xn
] =

0, when n is odd,
σn
1 · 3···(n − 1), when n is even.
For 0 < α < 1/2, the 100α percentage point Xα of the standard normal
distribution is defined as the number such that
α = P{X > Xα} =
1
√
2π
 ∞
Xα
e−x2
2 dx.
Referring to a statistical table, we have for examples, X0.050 = 1.6449 and
X0.025 = 1.960. More precisely, if X ∼ N (0,1), then within 95% confidence,
we have −1.96 ≤ X ≤ 1.96. If Y ∼ N (μ,σ2), we have
μ − 1.96σ ≤ Y ≤ μ + 1.96σ.
A vector-valued random variable (X1,X2,...,Xn) is said to follow a Multi-
variate Normal Distribution if every linear combination of Xi follows a Normal
distribution.
For Bivariate Normal Distribution (X1,X2) ∼ N (μ1,μ2;σ1,σ2;ρ), where ρ
is the correlation,
• Probability density function f(x1,x2) equals to
1
2πσ1σ2

1 − ρ2
exp

−
1
2(1 − ρ2)

(x1 − μ1)2
σ2
1
− 2ρ
(x1 − μ1)(x2 − μ2)
σ1σ2
+
(x2 − μ2)2
σ2
2
100 9 Elements of Probability
• Cumulative distribution function:
F(a,b) =
 b
−∞
 a
−∞
f(x1,x2)dx1dx2.
Probability density function of multivariate Normal distribution is
f(x1,x2,...,xn) =
1
√
(2π)n|Σ|
exp

−
1
2
(x − μ)
Σ−1
(x − μ)

,
where x = [x1,x2,...,xn] is a real n-dimensional column vector, μ is the mean
vector, and |Σ| is the determinant of Σ, the n × n covariance matrix which is
symmetric and positive definite.
## 9.3.8 Exponential Distribution
An exponential random variable τ (τ > 0) follows the density below:
f(t) = λe−λt
,
where λ > 0 and it is know as intensity.
Properties of exponential distribution for τ > 0 and 0 < s < t are
Distribution: P{τ ≤ t} =
t
0 f(s)ds = 1 − e−λt and P{τ > t} = e−λt
Expectation: E[τ] =
∞
0 tf(t)dt = 1
λ
Variance: Var(τ) = 1
λ2
Conditional distribution: P{τ > t + s|τ > s} = P{τ>t+s}
P{τ>s} = e−λt = P{τ > t}
(“Memorylessness property”).
## 9.3.9 Poisson Distribution
The Poisson random variable N is a discrete variable for counting the number
of random events within a time interval. Here are some properties of Poisson
distribution for the event number, an integer k ≥ 0 and an event rate λ > 0:
Distribution: P{N = k} =
λk
k!
e−λ
Expectation: E[N] = λ
Variance: Var(N) = λ.9.4 Limit Theorems 101
## 9.4 Limit Theorems
## 9.4.1 Law of Large Numbers
Let X1,X2,... be an infinite sequence of i.i.d. (independent and identically
distributed) Lebesgue integrable random variables with expected value E[X1] =
E[X2] = ··· = μ. Then,
1
n
(X1 + X2 + ··· + Xn) −−−→
n→∞
μ.
## 9.4.2 Central Limit Theorem
Let X1,X2,... be an infinite sequence of i.i.d. random variables with finite mean μ
and variance σ2. Denote a new sequence of random variables as
Sn =
n
i=1 Xi − nμ
√
nσ
.
Then, Sn converges to a standard Normal random variable by
P{Sn ≤ a} −−−→
n→∞
1
√
2π
 a
−∞
e−x2
2 dx.
Exercises
1. Consider X ∼ N (0,2). Obtain the mean, variance, and probability density
function of Y = 3 + 2X.
2. Assume Z ∼ N (0,1). Prove that Z and Z2 are uncorrelated but dependent.
3. Assume Z ∼ N (0,1). Show that
E[e−σ2
2 +σZ
1{Z<x}] = N(x − σ),
where x and σ are real variables.
4. Use the RAND function to generate a number of samples in EXCEL to verify the
mean of standard uniform distribution on [0,1] (equal probability for intervals of
the same length) according to the law of large numbers.Chapter 10
Stochastic Calculus Part I
## 10.1 Stochastic Process
The σ-algebra generated by a random variable X, denoted σ(X), is the σ-algebra
by the collection of {X ∈ B} (i.e. {ω : X(ω) ∈ B}), where B is any interval in R.
Let G be a σ-algebra on Ω. Then X is said to be G-measurable if σ(X) ⊆ G.
Definition 10.1 (Filtration) Given a probability space (Ω,F,P), a filtration Ft
is an increasing collection of σ-algebras on Ω, such that for s,t in a totally ordered
set T (e.g. “time”),
Fs ⊆ Ft, s < t.
Definition 10.2 (Stochastic Process) A stochastic process is a collection of ran-
dom variables indexed by T :
{Xt : t ∈ T }.
Here Xt is short for Xt(ω). For each t, Xt is reduced as a random variable. When
there is no randomness, Xt is called deterministic.
A stochastic process Xt on T is said to be adapted to the filtration if, for every
t ∈ T , Xt is Ft-measurable. Given a stochastic process X = {Xt : t ∈ T },
the natural filtration for this process is the filtration where Ft is generated by
all values of Xs up to s = t. A stochastic process is always adapted to its natural
filtration.
Example 10.1 (Asset Price Example) Assume a simplistic multi-period asset price
model where the price has only two possible movements for each period driven by
a single economic factor with 2 status (“y” – yes or “n” – no):
– “y” drives the price up by a certain amount with probability p, or
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_10
103104 10 Stochastic Calculus Part I
S0( ) = 5
p
1− p
S1(Ay) = 7
S1(An) = 3
p
1− p
S2(Ayy) = 8
S2(Ayn) = 4
p
1− p
S2(Any) = 5
S2(Ann) = 2
Fig. 10.1 A 2-period stock price model
– “n” drives the price down by a certain amount with probability q (q = 1 − p).
Consider a 2-period stock price model St, t = 0,1,2, represented by the tree in
Fig.10.1, where p = 0.5 and q = 1 − p = 0.5.
The sample space of S2 is Ω = {yy,yn,ny,nn}. The events on the tree are
Ayy = {yy},Ayn = {yn},Any = {ny},Ann = {nn}(thesearecalled“atomevents”)
Ay = {yy,yn},An = {ny,nn}
We have Ay = Ac
n,An = Ac
y,Ay = Ayy ∪Ayn,An = Any ∪Ann,Ω = Ay ∪An.
Probabilities for the events are
P(Ayy) = 0.25,P(Ayn) = 0.25,P(Any) = 0.25,P(Ann) = 0.25
P(Ay) = 0.5,P(An) = 0.5
P(Ω) = 1.
And the Filtrations for each period are
F0 = {∅,Ω}
F1 = {∅,Ω,Ay,An}
F2 = {∅,Ω,Ay,An,Ayy,Ayn,Any,Ann,Ac
yy,Ac
yn,Ac
ny,Ac
nn,Ayy ∪ Any,
Ayy ∪ Ann,Ayn ∪ Any,Ayn ∪ Ann}.
## 10.2 Conditional Expectation
Let (Ω,F,P) be a probability space and B an event. The conditional expectation
of random variable X given event B is defined as
E[X|B] =
1
P(B)

B
X(ω)dP(ω).10.2 Conditional Expectation 105
If X is a discrete random variable, the above expression can be also written as:
E[X|B] =
1
P(B)
i
xiP({X = xi} ∩ B).
The conditional expectation given σ-algebra G is the G-measurable random
variable, denoted as E[X|G], which satisfies

B
E[X|G](ω)dP(ω) =

B
X(ω)dP(ω), ∀B ∈ G.
Note that E[X|G] is not a single value in general. It is a variable representing the
“partial averaging” for each B ∈ G. It is a generalization of the single valued
conditional expectation with a single event.
For illustrating the concept, we use the following less general definition of
conditional expectation. Under probability space (Ω,F,P), let {B1,B2,...},
∀i,Bi ∈ F, be a countable partition of Ω and B = σ(Bi,i = 1,2,...), the
σ-algebra generated by all Bi. The conditional expectation of random variable X
conditional by B is defined as
E[X|B] =
i
E[X|Bi]1Bi .
Example 10.2 (Conditional Expectation) In the 2-period asset price example, we
have the following conditional expectation representations on the 3 σ-algebras
F0,F1,F2:
E[S2|F2] = 8 · 1Ayy + 4 · 1Ayn + 5 · 1Any + 2 · 1Ann = S2
E[S2|F1] =
8P(Ayy ∩ Ay)+4P(Ayn ∩ Ay)+5P(Any ∩ Ay)+2P(Ann ∩ Ay)
P(Ay)
1Ay
+
8P(Ayy∩An) + 4P(Ayn∩An) + 5P(Any∩An) + 2P(Ann∩An)
P(An)
1An
=
8P(Ayy)+4P(Ayn)
P(Ay)
1Ay +
5P(Any)+2P(Ann)
P(An)
1An=6 · 1Ay + 3.5 · 1An
E[S2|F0] =
8P(Ayy ∩ Ω) + 4P(Ayn ∩ Ω) + 5P(Any ∩ Ω) + 2P(Ann ∩ Ω)
P(Ω)
1Ω
= [8P(Ayy) + 4P(Ayn) + 5P(Any) + 2P(Ann)]1Ω
= E[S2]1Ω = E[S2] = 4.75.106 10 Stochastic Calculus Part I
Let G,H be two σ-algebras and G ⊂ H . Then, we have the following
properties:
(1) Independence: If X is independent of G, then E[X|G] = E[X]
(2) Law of Total Expectation: E[E[X|G]] = E[X]
(3) TakingoutKnownFactors:IfX isG-measurable,thenE[XY|G] = XE[Y|G]
(4) Tower Property (also known as Iterated Conditioning):
a. E[E[X|H ]|G] = E[X|G]
b. E[E[X|G]|H ] = E[X|G]
Illustration with Asset Price Example for (1) “Independence” Let G be a σ-
algebra which is independent of S2. Assuming that {B1,B2} is a partition of G
(hence 1B1 + 1B2 = 1), then
E[S2|G] = E[S2|B1]1B1 + E[S2|B2]1B2.
The first term is
E[S2|B1] =
8P(Ayy ∩ B1) + 4P(Ayn ∩ B1) + 5P(Any ∩ B1) + 2P(Ann ∩ B1)
P(B1)
=
8P(Ayy)P(B1) + 4P(Ayn)P(B1) + 5P(Any)P(B1) + 2P(Ann)P(B1)
P(B1)
= 8P(Ayy) + 4P(Ayn) + 5P(Any) + 2P(Ann) = E[S2].
We obtain the similar result E[S2|B2] = E[S2] in the second term. Hence,
E[S2|G] = E[S2]1B1 + E[S2]1B2 = E[S2](1B1 + 1B2) = E[S2].
Illustration with Asset Price Example for (2) “Law of Total Expectation”
E[S2|F1] =
8P(Ayy) + 4P(Ayn)
P(Ay)
1Ay +
5P(Any) + 2P(Ann)
P(An)
1An
E[E[S2|F1]] =
8P(Ayy) + 4P(Ayn)
P(Ay)
E[1Ay ] +
5P(Any) + 2P(Ann)
P(An)
E[1An]
=
8P(Ayy) + 4P(Ayn)
P(Ay)
P(Ay) +
5P(Any) + 2P(Ann)
P(An)
P(An)
= 8P(Ayy) + 4P(Ayn) + 5P(Any) + 2P(Ann) = E[S2].
Illustration with Asset Price Example for (3) “Taking out Known Factors”
Consider E[S1S2|F1] where S1 = 7 · 1Ay + 3 · 1An is F1-measurable.10.2 Conditional Expectation 107
E[S1S2|F1]
=
7 · 8P(Ayy) + 7 · 4P(Ayn)
P(Ay)
1Ay +
3 · 5P(Any) + 3 · 2P(Ann)
P(An)
1An
= (7 · 1Ay + 3 · 1An)
8P(Ayy) + 4P(Ayn)
P(Ay)
1Ay +
5P(Any) + 2P(Ann)
P(An)
1An
!
= (7 · 1Ay + 3 · 1An)E[S2|F1] = S1E[S2|F1].
Illustration with Asset Price Example for (4.a) “Tower Property”
E[E[S2|F2]|F1] = E[8 · 1Ayy + 4 · 1Ayn + 5 · 1Any + 2 · 1Ann|F1]
= 8E[1Ayy |F1] + 4E[1Ayn|F1] + 5E[1Any |F1] + 2E[1Ann|F1].
The first term is
8E[1Ayy |F1] = 8
P(Ayy ∩ Ay)
P(Ay)
1Ay + 8
P(Ayy ∩ An)
P(An)
1An = 8
P(Ayy)
P(Ay)
1Ay .
We obtain similar results for the other terms. Hence,
E[E[S2|F2]|F1] = 8
P(Ayy)
P(Ay)
1Ay + 4
P(Ayn)
P(Ay)
1Ay + 5
P(Any)
P(An)
1An + 2
P(Ann)
P(An)
1An
=
8P(Ayy) + 4P(Ayn)
P(Ay)
1Ay +
5P(Any) + 2P(Ann)
P(An)
1An
= 6 · 1Ay + 3.5 · 1An = E[S2|F1].
Illustration with Asset Price Example for (4.b) “Tower Property”
E[E[S2|F1]|F2] = E[6 · 1Ay + 3.5 · 1An|F2] = 6E[1Ay |F2] + 3.5E[1An|F2].
The first term is
6E[1Ay |F2] = 6
P(Ay ∩ Ayy)
P(Ayy)
1Ayy +
P(Ay ∩ Ayn)
P(Ayn)
1Ayn +
P(Ay ∩ Any)
P(Any)
1Any
+
P(Ay ∩ Ann)
P(Ann)
1Ann
!
= 6
P(Ayy)
P(Ayy)
1Ayy +
P(Ayn)
P(Ayn)
1Ayn
!
= 6 · 1Ay .
Similarly, we obtain 3.5E[1An|F2] = 3.5 · 1An. Hence,
E[E[S2|F1]|F2] = 6 · 1Ay + 3.5 · 1An = E[S2|F1].108 10 Stochastic Calculus Part I
## 10.3 Martingale
Let (Ω,F,P) be a probability space with the filtration Ft. Let 0 ≤ s ≤ t. An
Ft-adapted stochastic process Mt is said to be
– a martingale, if E[Mt|Fs] = Ms
– a supermartingale, if E[Mt|Fs] ≤ Ms
– a submartingale, if E[Mt|Fs] ≥ Ms.
Supermartingales tend to fall and submartingales tend to rise. Processes that are
both a supermartingale and a submartingale are martingales, thus they have no
tendency to rise or fall. In particular, the expected value of a martingale Mt is its
initial value M0, i.e., E[Mt] = M0.
Theorem 10.1 (Doob–Meyer Decomposition) A supermartingale (submartin-
gale) Xt admits a unique decomposition: Xt = Yt − At (= Yt + At) where Yt is a
martingale and At is an increasing predictable1 process.
Proof can be found in [66].
## 10.4 Markov Property
TheMarkovpropertyensuresthememorylessnessofaprocess,i.e.,thepastdoesnot
matter when predicting the future, only the present matters. It is defined as follows.
An Ft-measurable stochastic process Xt is said to be a Markov process if, for
any function2 f,
E[f(Xt)|Fs] = E[f(Xt)|Xs] = ϕ(s,Xs), ∀t > s.
A continuous Markov process is called a diffusion.
Proposition 10.1 The stochastic process ϕ(s,Xs) is a martingale.
Proof Let 0 ≤ s ≤ t ≤ T, then
E[ϕ(t,Xt)|Fs] = E[E[f(XT )|Ft]|Fs] = E[f(XT )|Fs] = ϕ(s,Xs). 
## 10.5 Quadratic Variation
The quadratic variation of Xt is defined as, if it exists,
X,Xt = lim
P→0
i
(Xsi+1 − Xsi )2
,
1Left continuous and Ft-adapted.
2To be specific, any Borel measurable function.10.6 Brownian Motion 109
where P = {s0,s1,...,sn} represents a partition of the interval [0,t] and P is
the maximum step size. The quadratic variation is also denoted as Xt.
Remark 10.1 If Xt has a continuous derivative X
t and
t
0 |X
s|2ds is finite, then
X,Xt = 0 which is illustrated in the below:
X,Xt = lim
P→0
i
(Xsi+1 − Xsi )2
= lim
P→0
i
[X
s∗
i
(si+1 − si)]2
,s∗
i ∈ [si,si+1] (by Mean Value Theorem)
≤ lim
P→0
P
i
|X
s∗
i
|2
(si+1 − si) = lim
P→0
P ·
 t
0
|X
s|2
ds = 0.
The last equality holds as
 t
0
|X
s|2
ds is finite.
The cross variation (or quadratic covariation) of two processes, Xt and Yt, is
defined as, if it exists,
X,Yt = lim
P→0
i
(Xsi+1 − Xsi )(Ysi+1 − Ysi ).
The differential of X,Yt is denoted by dX,Yt or dXtdYt in this book.
## 10.6 Brownian Motion
Definition 10.3 (Brownian Motion) A continuous process Wt(ω) is said to be a
standard Brownian Motion if it satisfies
(1) W0(ω) = 0 for all ω
(2) for all ω, the map t → Wt(ω) is a continuous function for t ≥ 0
(3) Wt has independent increments, i.e. Wu(ω) − Wv(ω) and Wt(ω) − Ws(ω) are
independent for all 0 ≤ v ≤ u ≤ s ≤ t
(4) Wt has stationary increments and every increment Wt(ω) − Ws(ω), 0 ≤ s < t,
follows the Normal distribution N (0,t − s).
For simplicity, we will write Wt(ω) as Wt. We have
E[Wt − Ws] = 0
Var(Wt − Ws) = t − s
Wt = 
√
t where  ∼ N (0,1) (because Wt = Wt − W0).
We can see that Wt is not differentiable because
lim
δt→0
Wt+δt − Wt
δt
= lim
δt→0

√
δt
δt
=

lim
δt→0
√
δt
→ ∞.110 10 Stochastic Calculus Part I
Fig. 10.2 Fifty Brownian
paths with probability density
at time 1
0 0.2 0.4 0.6 0.8 1
−4
−3
−2
−1
0
1
2
3
4
Probability
Density
See Fig.10.2 for 50 sample paths of Brownian motion.
A d-dimensional Brownian motion is defined as
Wt = (W1
t ,W2
t ,...,Wd
t ),
where Wi
t , i = 1,...,d, is a standard Brownian motion and Wi
t and W
j
t (∀i = j)
are independent.
Properties of a Brownian Motion
Independence of Brownian increments implies that Wt −Ws (s < t) is independent
of Fs = σ(Wu, u ≤ s). Hence, we have
E[f(Wt − Ws)|Fs] = E[f(Wt − Ws)].
An Ft-adapted Brownian Motion is called Ft-Brownian Motion.
Theorem 10.2 (Properties of Ft-Brownian Motion)
(1) Wt is an Ft-martingale
(2) W2
t − t is an Ft-martingale
(3) e−1
2 σ2t+σWt is an Ft-martingale
(4) time-change or scaling property: cWt
(d)
⇐⇒ Wc2t where the arrow with (d)
means equivalence in terms of distribution.
Proof In the following, we assume that u ≥ t.
(1) E[Wu − Wt|Ft] = E[Wu − Wt] = 0. Hence E[Wu|Ft] = E[Wt|Ft] = Wt (as
Wt is Ft-measurable).10.6 Brownian Motion 111
(2) E[W2
u −W2
t |Ft] = E[(Wu−Wt)2+2Wt(Wu−Wt)|Ft] = E[(Wu−Wt)2|Ft] =
u − t. Hence E[W2
u − u|Ft] = E[W2
t |Ft] − t = W2
t − t (because W2
t is Ft-
measurable).
(3) E[e−1
2 σ2u+σWu|Ft]=e−1
2 σ2u+σWt E[eσ(Wu−Wt)|Ft]=e−1
2 σ2u+σWt E[eσ(Wu−Wt)].
Theexpectationisgivenbythemomentgeneratingfunctionofanormalrandom
variable: E[eσ(Wu−Wt)] = e
1
2 σ2(u−t)
. Hence, we obtain E[e−1
2σ2u+σWu|Ft] =
e−1
2 σ2u+σWt e
1
2 σ2(u−t)
= e−1
2 σ2t+σWt .
(4) can be checked by calculating the first and second order moments. 
Example 10.3 Let Xt = W2
t . The process Xt is a submartingale from the Jensen’s
inequality [79]:
E[Xt|Fs] = E[W2
t |Fs] ≥ (E[Wt|Fs])2
= W2
s = Xs.
The Doob–Meyer decomposition for Xt is
Xt = Yt + At = (W2
t − t) + t,
where Yt = W2
t −t is a martingale and At = t is an increasing predictable process.
Theorem 10.3 (Quadratic Variation of Brownian Motion) Let Wt be a Brow-
nian motion, then W,Wt = t, almost surely. In differential form, we have the
following calculation rules
⎧
⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎩
dWtdWt = dt
dWtdt = 0 (because E[ΔWtΔt] = ΔtE[ΔWt] = 0)
dtdt = 0.
Proof Let P = {s0,s1,...,sn} be a partition of [0,t] with P → 0. We want to
prove that E[W,Wt] = t and Var(W,Wt) = 0. Firstly,
E[W,Wt] = E
"
lim
P→0
i
(Wsi+1 − Wsi )2
#
= lim
P→0
i
Var(ΔWsi ) = lim
P→0
i
Δsi = t,
where ΔWsi = Wsi+1 − Wsi and Δsi = si+1 − si. And,
Var
$
i
(Wsi+1 − Wsi )2
%
= Var
$
i
ΔW2
si
%
=
i
Var
$
ΔW2
si
%
=
i
E[
$
ΔW2
si
− E[ΔW2
si
]
%2
] =
i
E[
$
ΔW2
si
− Δsi
%2
]112 10 Stochastic Calculus Part I
=
i
E
"
ΔW4
si
#
− 2E[ΔW2
si
]Δsi + Δs2
i
=
i
3Δs2
i − 2Δs2
i + Δs2
i =
i
2Δs2
i .
Hence,
Var
$
W,Wt
%
= Var
$
lim
P→0
i
(Wsi+1 − Wsi )2
%
= lim
P→0
Var
$
i
(Wsi+1 − Wsi )2
%
= lim
P→0
i
2Δs2
i ≤ lim
P→0
P
i
2Δsi = lim
P→0
2Pt = 0.
In the above, E
"
ΔW4
si
#
= 3Δs2
i is from the property of normal distribution which
is proved in Sect.9.3.7. The other two properties can be proved by showing that 
i(Wsi+1 − Wsi )(si+1 − si) and

i(si+1 − si)2 directly converge to 0. 
Remark 10.2 It is interesting to note that the Brownian motion is continuous
everywhere but not of finite variation on any interval, i.e.,

i |Wsi+1 − Wsi | → ∞,
which is different from continuous differentiable functions [66].
The following theorem is useful for identifying Brownian motions.
Theorem 10.4 (Lévy’s Theorem) Let Mt be a continuous martingale to its
natural filtration Ft, M0 = 0, and M,Mt = t. Then Mt is a Brownian motion.
We refer to [44] for the proof.
Correlated Brownian Motions
Two Brownian motions Wt and & Wt are correlated by ρ if W, & Wt = ρt. The
parameters ρ = 0 and ρ = 1 give independency and perfect correlation respectively.
We show how to construct correlated Brownians. Consider
Bt = ρWt +

1 − ρ2 & Wt, −1 ≤ ρ ≤ 1,
where Wt and & Wt are independent standard Brownian motions (or equivalently
[Wt, & Wt] a standard two dimensional Brownian motion). Lévy’s Theorem shows
that Bt is a Brownian motion: firstly Bt is a continuous martingale with B0 = 0 and
dB,Bt = dBtdBt = ρ2
dWtdWt +(1−ρ2
)d & Wtd & Wt = ρ2
dt +(1−ρ2
)dt = dt,
since Wt and & Wt are independent. Then dB,Wt = dBtdWt = ρdt and the two
Brownian motions Bt and Wt are correlated with ρ. Note that Bt and & Wt are also
correlated with

1 − ρ2.10.7 Itô Integral 113
## 10.7 Itô Integral
Definition 10.4 (Itô Integral) Let P = {t0,t1,...,tn} be a partition of the interval
[0,T], ft be an Ft-adapted process and E
'T
0 f2
t dt
(
< +∞, the Itô integral is
defined as
 T
0
ftdWt = lim
P→0
n−1
i=0
fti (Wti+1 − Wti ).
Note that the value of ft is known at the beginning of the sub interval. This is
a crucial property for the application of Itô integral in finance. For instance, the
integral can represent the cumulative trading P/L where ft acts as a betting size and
is determined by the trading strategy before each time period. As only Itô integrals
are used in this book, we often use the simple term stochastic integral instead.
Properties of stochastic integral It =
 t
0
fsdWs include
(1) Martingale: It is an Ft-martingale
(2) Itô-Isometry: E[I2
t ] = E
 t
0
f2
s ds
!
(3) Quadratic Variation: I,It =
 t
0
f2
s ds.
Remark 10.3 (1) may be understood from the fact that, for 0 < t ≤ T,
E
 T
0
fsdWs



Ft
!
= E
 t
0
fsdWs



Ft
!
+ E
 T
t
fsdWs



Ft
!
.
The second term is actually zero because the expected value of any future Brownian
increment is zero.
For (2), we notice that
E[(
n−1
i=0
fti (Wti+1 − Wti ))2
] =
n−1
i=0
n−1
j=0
E[fti ftj (Wti+1 − Wti )(Wtj+1 − Wtj )].
For each term of the form i < j:
E[fti ftj ΔWti ΔWtj ] = E[E[fti ftj ΔWti ΔWtj |Ftj ]]
= E[fti ftj ΔWti E[ΔWtj |Ftj ]] = 0 (as E[ΔWtj |Ftj ] = 0).114 10 Stochastic Calculus Part I
For terms with i = j:
E[f2
ti
ΔW2
ti
] = E[E[f2
ti
ΔW2
ti
|Fti ]] = E[f2
ti
E[ΔW2
ti
|Fti ]] = E[f2
ti
Δti].
Hence, E[(
T
0 ftdWt)2] = lim
P→0
n−1
i=0 E[f2
ti
ΔW2
ti
] = lim
P→0
n−1
i=0 E[f2
ti
Δti] =
E[
T
0 f2
t dt].
Lastly,wehaveI,It= lim
P→0
n−1
i=0 (Iti+1−Iti )2= lim
P→0
n−1
i=0 (fti (Wti+1−Wti ))2.
Then, following the proof for Theorem 10.3 for quadratic variation of Brownian
motion, we obtain the result in property (3).
## 10.8 Itô Calculus
Definition 10.5 (One-dimensional Itô Process) The stochastic process Xt is
called an Itô process if it follows:
Xt = X0 +
 t
0
θsds +
 t
0
φsdWs,
where Ws is an Ft-Brownian motion and θs and φs are Ft-adapted processes.
The differential form of Itô process is
dXt = θtdt + φtdWt.
θt is known as the drift of Xt. It is easily seen that Xt is a martingale if its drift
is zero. The below theorem for functions of an Itô process is the key component of
stochastic calculus.
Theorem 10.5 (Itô–Doeblin Formula) Let f(t,x) be a function for which
∂f
∂t
(t,x),
∂f
∂x
(t,x) and
∂2f
∂x2
(t,x) are defined and continuous. Then, for T > 0,
⎧
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
f(T,XT ) = f(0,X0) +
 T
0
∂f
∂t
dt +
 T
0
∂f
∂x
dXt +
1
2
 T
0
∂2f
∂x2
dX,Xt
f(T,XT ) = f(0,X0) +
 T
0
∂f
∂t
dt +
 T
0
∂f
∂x
θtdt +
 T
0
∂f
∂x
φtdWt
+
1
2
 T
0
∂2f
∂x2
φ2
t dt.
The differential form of Itô–Doeblin Formula is written as either of the following
equations:10.8 Itô Calculus 115
⎧
⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎩
df(t,Xt) =
∂f
∂t
dt +
∂f
∂x
dXt +
1
2
∂2f
∂x2
dX,Xt
df(t,Xt) =
∂f
∂t
dt +
∂f
∂x
θtdt +
∂f
∂x
φtdWt +
1
2
∂2f
∂x2
φ2
t dt.
Proof Itô–Doeblin Formula can be understood from the Taylor series of f(t,Xt):
df(t,Xt) =
∂f
∂t
dt +
∂f
∂x
dXt +
1
2
∂2f
∂x2
dXtdXt + [other terms].
Applying the calculation rules of Brownian Motion:
dWtdWt = dt, dWtdt = 0, dtdt = 0,
the value of [other terms] is zero.
From dXt = θtdt + φtdWt, we obtain
dXtdXt = φ2
t dWtdWt + φtθtdWtdt + θtφtdtdWt + θ2
t dtdt = φ2
t dt.
Hence, replacing dXt and dXtdXt in the Taylor series, we obtain
df(t,Xt) =
∂f
∂t
dt+
∂f
∂x
θtdt+
∂f
∂x
φtdWt +
1
2
∂2f
∂x2
φ2
t dt. 
Readers may refer to [60] for the rigorous proof. Note that sometimes we also
write ∂f
∂x as ∂f
∂Xt
and ∂2f
∂x2 as ∂2f
∂X2
t
respectively. Similarly to the one-dimensional Itô–
Doeblin Formula, we can obtain the below two-dimensional Itô–Doeblin formula.
Theorem 10.6 (Two-Dimensional Itô–Doeblin Formula) Let f(t,x,y) be a
function for which the required derivatives are defined and continuous, Xt and Yt
be Itô processes. Then,
df(t,Xt,Yt) =
∂f
∂t
dt +
∂f
∂x
dXt +
∂f
∂y
dYt +
1
2
∂2f
∂x2
dX,Xt
+
∂2f
∂x∂y
dX,Yt +
1
2
∂2f
∂y2
dY,Yt.
Applying the Two-Dimensional Itô–Doeblin Formula to f(t,Xt,Yt) = XtYt we
obtain the very useful result below.
Corollary 10.1 (Itô’s Product Rule) Let Xt and Yt be Itô processes, then
d(XtYt) = XtdYt + YtdXt + dX,Yt.
Notice that X,Yt is an additional term compared to Riemann calculus. The
integral form of the Itô’s product rule can also be regarded as the integration by
parts formula [60].116 10 Stochastic Calculus Part I
Example 10.4 In this example we calculate d(e−
t
0 rsds
Xt) using the Itô’s product
rule, where rt is deterministic and Xt is an adapted process. As a result, the
covariation term in Itô’s product rule is zero and we have
d(e−
t
0 rsds
Xt) = Xtd(e−
t
0 rsds
) + e−
t
0 rsds
dXt + de−
t
0 rsds
,Xt
= −rte−
t
0 rsds
Xtdt + e−
t
0 rsds
dXt
= e−
t
0 rsds
(−rtXtdt + dXt).
The above equation will frequently appear in martingale option pricing framework
later. For instance, it is used later for solving the so-called Ornstein-Uhlenbeck
process. In particular, when rt is a degenerate process rt = r, we have
d(e−rt
Xt) = e−rt
(dXt − rXtdt).
If Xt represents an asset value, the right hand side of the equation is the discounted
value for the increment of self-financing investment.
## 10.9 Poisson Process
Let τk, k = 1,2,... be i.i.d. random variables following the exponential distribu-
tion. Then, τk can be used to define an increasing sequence of random times by
Tn =
n
k=1
τk, which is known as the arrival time of the n-th event. The arrival times
are known to follow the gamma density, see [79].
The Poisson process Nt is a right continuous process which counts the number
of events up to and including t. See Fig.10.3. It is defined as
Nt =
n≥1
1{t≥Tn}.
Fig. 10.3 A sample path for
Poisson process Nt
t
Nt
0
− 1
− 2
• ◦
T1
• ◦
T2
•10.9 Poisson Process 117
Forarightcontinuous process,thereexistsaleftcontinuous versionandthevalue
prior to the jump at time t is denoted by “t−”. For instance, the first jump of Poisson
process happens at t = T1, and hence Nt− = 0, Nt = 1 with δNt ≡ Nt − Nt− = 1.
Here are some properties of Poisson processes for integer k ≥ 0 and 0 ≤ s < t
thatcanbeprovedwithstraightforwardcalculationwhereex =
∞ 
j=0
xj
j!
issometimes
used (cf. [79]):
(1) Distribution: P{Nt = k} =
(λt)k
k!
e−λt
(2) Mean: E[Nt − Ns] = λ(t − s)
(3) Variance: Var(Nt − Ns) = λ(t − s)
(4) Martingale Property: Nt − λt = Nt − E[Nt] is a martingale
(5) Independent and stationary increments:
P{Nt − Ns = k} =
λk(t − s)k
k!
e−λ(t−s)
= P{Nt−s = k}
(6) Moment generating function: E[euNt ] = eλt(eu−1).
Theparameterλistheintensityintheexponentialdistributionforthearrivaltime.
TheindependencefeaturefortheincrementsofPoissonprocessescanbeunderstood
from the memorylessness of the exponential distribution. The other properties can
be obtained by direct calculation.
Note that
P(τ ≤ t + Δt|τ > t) =
P(t < τ ≤ t + Δt)
P(τ > t)
=
e−λt − e−λ(t+Δt)
e−λt
= 1 − e−λΔt
.
Hence, limΔt→0 P(τ ≤ t + Δt|τ > t) = λdt using the Taylor expansion of e−λΔt.
In financial modelling, λdt is often used as the probability of an event in (t,t +dt),
conditioned by no such event happened before t. It can be proved that there can be
at most one event arrival within an infinitesimally small interval (t,t +dt) [66]. So,
in differential notation, the Poisson process is often written as
dNt =

0, with probability 1 − λdt,
1, with probability λdt.
Exercises
1. Let Ω be a infinite coin toss space
Ω = {ω = ω1ω2 ··· ;ωi = y or n, i = 1,2,...}.118 10 Stochastic Calculus Part I
where y stands for a head and n stands for a tail with equal probability. Define
the random variables
Yi(ω) =

1, if ωi = y,
−1, if ωi = n.
Then, the random walk is defined as a discrete stochastic process Xk = Σk
i=1Yi
with initial value X0 = 0. Find σ(X2), the σ-algebra generated by the random
walk at time 2.
2. Consider an Itô process dXt = W2
t dt + W2
t dWt, or
Xt = X0 +
 t
0
W2
s ds +
 t
0
W2
s dWs.
Derive E[Xt].
3. Let σ1
t and σ2
t be non-zero adapted processes and we have two correlated
Brownian motions given by W, & Wt = ρt. Show that
Bt =
 t
0
σ1
s dWs + σ2
s d & Ws

(σ1
s )2 + (σ2
s )2 + 2ρσ1
s σ2
s
is a Brownian motion.Chapter 11
Black–Scholes–Merton Model for Option
Pricing
In this chapter, we start off the discussion of option pricing with the pioneering
work by Black, Scholes and Merton who proposed the first hedging (replication)
framework in 1973. Their work laid the foundation for the rapid growth of derivative
products. In recognition of their contributions, Scholes and Merton received the
## 1997 Nobel Prize in Economics.1
The option pricing and hedging framework of Black–Scholes–Merton Model was
originally derived with PDE (Partial Differential Equation) approach. In later years,
researchers have generalized the model and developed a rigorous and practical
modelling framework with probabilistic approach that will be presented in the next
two chapters.
## 11.1 The Black–Scholes–Merton Model
The option price is sensitive to the change of the underlying’s price. Take the
example of a call option on a certain stock as underlying asset. If the stock price
goes up, the price of the call option will increase, which implies a gain to the option
holder and a loss to the option writer. But if the writer of the call has held a certain
quantity of the stock, the increase of the stock price will result in a gain which may
mitigate or offset perfectly the loss on the option position.
This intuitive analysis gives rise to the question of whether this strategy can
perfectly hedge the option and what quantity of the stock the option writer needs to
hold at a given point in time. The answer was given by Black, Scholes and Merton
in the seminal work on option pricing published in 1973 [10, 55]. The authors
demonstrated that investors can create a riskless hedging portfolio where all market
1Unfortunately, Black passed away in 1995.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_11
119120 11 Black–Scholes–Merton Model for Option Pricing
risks are eliminated under the model now known as the BSM model (Black–Scholes–
Merton Model).
Under the Black–Scholes–Merton model, the price of a non-dividend paying
asset follows the so called geometric Brownian motion:
dSt = μStdt + σStdWt, (11.1)
where μ and σ > 0 are constants, representing the asset’s drift and volatility
respectively.
Proposition 11.1 Let St be the process defined in (11.1). Then,
St = S0e(μ−σ2
2 )t+σWt . (11.2)
Proof Define f(t,x) = lnx. Then
∂f
∂x
=
1
x
,
∂2f
∂x2
= −
1
x2
,
∂f
∂t
= 0.
The Itô’s lemma gives
d ln(St) = df(t,St) = 0 · dt +
∂f
∂x
(t,St)dSt +
1
2
∂2f
∂x2
(t,St)(dSt)2
=
1
St
dSt +
1
2

−
1
S2
t

(dSt)2
= (μ −
σ2
2
)dt + σdWt,
where (11.1) and (dSt)2 = σ2S2
t dt are used.
Integrating from time 0 to t leads to the solution. 
In (11.2), if we neglect the Brownian motion Wt, then St changes geometrically
with a common factor e(μ−σ2
2 )
. This is why St is called a geometric Brownian
motion.
Corollary 11.1 The logarithm of St is an arithmetic Brownian motion
lnSt = lnS0 + (μ −
σ2
2
)t + σWt ∼ N

lnS0 + (μ −
σ2
2
)t,σ2
t

.
Thus, the distribution of St is said to be log-normal. Furthermore,
E[St] = S0eμt
and Var(St) = S2
0e2μt
(eσ2t
− 1).
Proof The normal distribution of lnSt follows from taking the logarithm on both
sides of (11.2). Note that Wt ∼ N (0,t), then Wt =
√
t with  ∼ N (0,1). By the
moment generating function, we have11.2 Derivation of the Black–Scholes Equation 121
E[St] = E S0e(μ−σ2
2 )t+σWt
!
= S0e(μ−σ2
2 )t
E[eσ
√
t
] = S0e(μ−σ2
2 )t
e
σ2
2 t
= S0eμt
.
Similarly,
E[S2
t ] = E
'
S2
0e(2μ−σ2)t+2σWt
(
= S2
0e(2μ−σ2)t
E[e2σ
√
t
] = S2
0e(2μ+σ2)t
.
Hence Var(St) = E[S2
t ] − E[St]2 = S2
0e2μt(eσ2t − 1). 
Equivalently, the lognormal distribution can be written as
ln

St
S0

∼ N

(μ −
σ2
2
)t,σ2
t

.
## 11.2 Derivation of the Black–Scholes Equation
The basic version of the model assumes a “perfect market” in which
– there is no arbitrage possibility
– the asset can be bought or sold at any time for any quantity (including a fraction
of the asset)
– there is no short selling restriction
– there is no transaction cost
– there exists a constant risk-free interest rate r for borrow and lending
Suppose that we have an option V of European style linked to asset S. Actually,
V can be the value of a whole portfolio of a certain asset and European options
linked to that asset. But for simplicity, and without loss of generality, we can think
of a single option linked to a non-dividend paying stock S in the following.
Let Vt = V(t,St) denote the option value process. Using Itô’s lemma, we obtain
Vt as an Itô process
dVt =

μSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
+
∂V
∂t

dt + σSt
∂V
∂S
dWt. (11.3)
Note that ∂V
∂t , ∂V
∂S and ∂2V
∂S2 are abbreviated for convenience. They represent the
processes ∂V
∂t (t,St), ∂V
∂S (t,St) and ∂2V
∂S2 (t,St) respectively.122 11 Black–Scholes–Merton Model for Option Pricing
Next, we construct a portfolio Πt consisting of a long position of one option and
a short position of Δt units2 of the underlying asset at time t.
The value of this portfolio is
Πt = Vt − ΔtSt. (11.4)
The key idea is to find the value of Δt so that the portfolio becomes instan-
taneously deterministic, i.e. without the term dWt representing the stochastic
movement of the stock price. The change in the value of this portfolio in one time-
step dt is
dΠt = dVt − ΔtdSt. (11.5)
Substituting (11.1) and (11.3) into (11.5), we find
dΠt =

μSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
+
∂V
∂t
− μΔtSt

dt + σSt

∂V
∂S
− Δt

dWt.
(11.6)
The first term on the right hand side is “deterministic” while the second term is
stochastic as it involves Wt. By setting Δt = ∂V
∂S (t,St), (11.6) becomes
dΠt =

1
2
σ2
S2
t
∂2V
∂S2
+
∂V
∂t

dt. (11.7)
Under the assumptions stated earlier, we should have dΠt = rΠtdt, or
dVt = ΔtdSt + r(Vt − ΔtSt)dt.
In fact, if dΠt were greater than rΠtdt, an arbitrager could make a riskless profit
by borrowing an amount Πt at rate r to invest in the portfolio. Conversely, dΠ were
less than rΠtdt, then the arbitrager would short the portfolio and invest Πt at the
risk free rate r. Combining with (11.7), we obtain

1
2
σ2
S2
t
∂2V
∂S2
+
∂V
∂t

dt = rΠtdt.
Now replace Πt by Vt − ΔtSt as given in (11.4), and replace Δt by ∂V/∂S. We
arrive at
2Here Δt < 0 together with the minus sign in front implies a long position in underlying asset. For
instance, if the option is a put, we may want to buy certain amount of stock to offset the risk. In
that case, Δt < 0.11.2 Derivation of the Black–Scholes Equation 123
∂Vt
∂t
+
1
2
σ2
S2
t
∂2Vt
∂S2
t
+ rSt
∂Vt
∂St
− rVt = 0. (11.8)
This is the famous Black–Scholes partial differential equation. Any derivative
security whose price depends only on the current value of St and on t must satisfy
the Black–Scholes equation.
Note that the Black–Scholes equation (11.8) does not contain the drift parameter
μ of the underlying asset. The price will depend on the risk-free interest rate r and
the volatility σ however. A consequence of this is that two people may have quite
different views on μ, yet still agree on the value of an option.
For the Black–Scholes equation in (11.8), which is a backward parabolic
equation, we must specify final and boundary conditions, for having a unique
solution. For the moment we restrict our attention to a vanilla European call c(t,S),
with exercise price K and expiry date T.
The final condition of a call is just its payoff at T:
c(T,ST ) = max{ST − K,0}. (11.9)
Our ‘spatial’ or asset-price boundary conditions are applied at zero asset price,
St = 0, and at St → ∞. We can see from (11.1) that if St is ever zero, then dSt is
also zero, and therefore St can never change. Since if St = 0 at expiry, the payoff
will be zero. Thus on St = 0 we have
c(t,0) = 0 for all t ≥ 0. (11.10)
Finally as St → ∞, it becomes ever more likely that the option will be exercised.
Thus, as St → ∞, the value of the option becomes that of the asset minus the
exercise price. Hence we have for all t > 0,
c(t,St) ∼ St − Ke−r(T−t)
, as St → ∞. (11.11)
For a European call option, Black–Scholes equation (11.8) together with the
boundary conditions (11.9)–(11.11) can be solved exactly to give its value. In
Fig.11.1, we give the solution domain (the domain where we want to solve the
call option value) and the boundary conditions.
For a vanilla European put option p(t,St), the final condition is the payoff
p(T,ST ) = max{K − ST ,0}.
For the boundary conditions, we have already mentioned that if St is ever zero, then
it must remain zero. In this case the final payoff for a put is known with certainty
to be K. To determine p(t,0), we simply have to calculate the present value of an
amount K received at time T. Assuming that interest rates are constant we find the
boundary condition at St = 0 to be124 11 Black–Scholes–Merton Model for Option Pricing
Fig. 11.1 Solution domain of
a European call option and
the boundary conditions. Here
S∗ is a sufficiently large value
t
S
0
S∗
c(0 t) = 0 T
c(S∗ t) ∼ S∗ −Ke−r(T−t)
c(S T T ) = max{S T − K 0}
Solution Domain
,
, ,
,
p(t,0) = Ke−rt
, for all t ≥ 0.
As St → ∞, the option is unlikely to be exercised and so for t > 0, we have
p(t,St) → 0, as St → ∞.
## 11.3 Black–Scholes Formulas for Vanilla Options
By solving the PDE, closed-form formulas are obtained for European call and put
options [10]. In this section, we only verify that the formulas are solutions of the
Black–Scholes equation.
Theorem 11.1 (Black–Scholes Formula) The time-t value of the vanilla Euro-
pean call with strike price K and maturity T is given by
c(t,St) = StN(d1) − Ke−r(T−t)
N(d2), (11.12)
where N(x) is the standard normal cumulative distribution function,
d1 =
ln(St/K) + (r + 1
2σ2)(T − t)
σ
√
T − t
and d2 = d1 − σ
√
T − t. (11.13)
Proof Firstly, c(t,St) in (11.12) satisfies the Black–Scholes equation (11.8). This
can be checked by direct calculation of partial derivative terms
∂c
∂t
,
∂c
∂S
,
∂2c
∂S2
in
(11.8).
We note the below for calculating the partial derivatives11.3 Black–Scholes Formulas for Vanilla Options 125
∂N(di)
∂x
=
∂N(di)
∂di
∂di
∂x
=
e−
d2
i
2
√
2π
∂di
∂x
, i = 1,2.
For the boundary condition (11.10), we first note that by (11.13), d1,d2 → −∞
as St → 0. Obviously N(−∞) = 0. Hence
c(t,0) = 0 × N(−∞) − Ke−r(T−t)
N(−∞) = 0.
For the boundary condition (11.11), we note again that d1,d2 → ∞ as St → ∞
where N(∞) = 1. Hence
c(t,St) → StN(∞) − Ke−r(T−t)
N(∞) ∼ St − Ke−r(T−t)
, as St → ∞.
Finally, we consider the final condition (11.9). At t = T, if ST > K, then
d1,d2 → ∞. Hence c(T,ST ) = ST − K. If ST < K, then d1,d2 → −∞. Hence
c(T,ST ) = 0. If ST = K, by continuity, c(T,ST ) = 0. 
Next we give the formula for European put options.
Theorem 11.2 The value of the vanilla European put is given by
p(t,St) = Ke−r(T−t)
N(−d2) − StN(−d1), (11.14)
where d1 and d2 are given in (11.13).
Proof Instead of checking the PDE and boundary, final conditions as we did in the
proof of Theorem 11.1, we can derive (11.14) immediately by using the put-call
parity formula (see Proposition 8.1)
c(t,St) − p(t,St) = St − Ke−r(T−t)
,
Theorem 11.1, and the equality N(d) + N(−d) ≡ 1 for any d. 
We remark that although (11.12) and (11.14) seem to be closed-form solutions
for the vanilla options, one still has to compute the integral N(di) numerically by
quadrature rules such as Simpson’s rule or Gaussian rule.
By straightforward derivation, we can obtain the deltas of vanilla calls and puts:
Δc(t,St) = N(d1) and Δp(t,St) = N(d1) − 1.
A Useful Approximation Formula
For at-the-money forward (ATMF) call/put options, we have the below approxima-
tion formula126 11 Black–Scholes–Merton Model for Option Pricing
c(0,S0) = p(0,S0) ≈ 0.4S0σ
√
T.
It is useful to practitioners for a quick estimation of the option price without using
a pricer.
Proof The strike of an ATMF option is K = erT S0, where S0 is the spot level at
time t = 0. In this case, the European call and put options have the same price
according to put-call parity.
Let us check the approximation formula for the ATMF call option. Firstly,
S0 = e−rT
K, d1 =
σ
√
T
2
and d2 = −
σ
√
T
2
.
From Taylor expansion, we have
N(x) = N(0) + N
(0)x +
1
2
N
(0)x2
+ O(x3
).
Using N(0) = 1 √
2π
≈ 0.4, we obtain
c(0,S0) = S0N(d1) − e−rT
KN(d2) = S0

N
)
σ
√
T
2
*
− N
)
−
σ
√
T
2
*
≈ S0N
(0)σ
√
T ≈ 0.4S0σ
√
T. 
## 11.4 Discussion on Hedging Issues
## 11.4.1 Sensitivities (Greeks)
Consider a portfolio Π which is composed of options linked to a single asset S
and a quantity of the asset itself. In Black–Scholes–Merton model, the price of the
portfolio Πt depends on the stock price, time to maturity, volatility and risk-free
interest rate: Πt = Π(T − t,St,σ,r). We denote these sensitivities with respect to
these parameters by Greek letters3:
• Delta :Δt = ∂Πt
∂St
• Theta :Θt = ∂Πt
∂t • Rho :ρt = ∂Πt
∂r
• Gamma :Γt = ∂2Πt
∂S2
t
• Vega :Vt = ∂Πt
∂σ
3Actually, vega Vt is not a Greek letter.11.4 Discussion on Hedging Issues 127
We can write the Black–Scholes PDE ∂Πt
∂t + rSt
∂Πt
∂St
+ 1
2
∂2Πt
∂S2
t
σ2S2
t = rΠt as
Θt + rStΔt +
1
2
Γtσ2
S2
t = rΠt.
If Πt is delta-neutral (Δt = 0), then
Θt +
1
2
Γtσ2
S2
t = rΠt.
It shows that Gamma and Theta should have opposite signs if their values are large
and rΠt is small:
Θt ≈ −
1
2
Γtσ2
S2
t .
This is known as Gamma-Theta relationship. The decision on the amount of Theta
and Gamma for the portfolio is one of the major concerns for option traders. From
Itô–Doeblin formula, we observe that the price change of an option can be expressed
by the Greeks of the option:
dΠt = Θtdt + ΔtdSt +
1
2
S2
t σ2
Γtdt.
As each Greek represents a certain risk exposure for the portfolio, the derivative
product providers (i.e. hedging party) always apply limits in dollar amount on the
major sensitivity indicators such as Vega, Gamma and (residual) Delta.
See Fig.11.2 and Fig.11.3 for illustrations of call option price, Delta, Gamma,
and Vega.
Delta – Δt
The delta of a portfolio or an option measures the value change w.r.t. the price
change of the underlying. The delta-hedging consists of holding (long or short
depending on the sign of delta) Δt units of the underlying asset (called delta amount
or, simply, delta) at any time t. If Δt is positive, a loan of ΔtSt is necessary for
financing the delta position. If Δt is negative, the underlying assets are borrowed
and sold to the market. As the asset price changes, a P/L will be produced by the
delta. According to BSM model, the cumulative P/L from the delta-hedging for a
single option combined with the option premium will be exactly the option price for
any time t. In particular, when t is the expiry time, the option price is the payoff
amount.
Let us take the example of the hedging of a call sold by an option writer who
borrowed Δ0S0 for the delta at inception. The initial portfolio is composed of the128 11 Black–Scholes–Merton Model for Option Pricing
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
Spot Price
Intrinsic
Call Price
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
0
0.1
0.2
0.3
0.4
0.5
0.6
0.7
0.8
0.9
1
Spot Price
Call Price
Call Delta
Fig. 11.2 Price and Delta of a call option with K = 1, r = 0.01, σ = 0.25 and T = 1
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
0
0.2
0.4
0.6
0.8
Spot Price
Call Price
0
0.5
1
1.5
2
Call Gamma
Call Price
Call Gamma
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
0
0.2
0.4
0.6
0.8
Spot Price
Call Price
0
0.1
0.2
0.3
0.4
Call Vega
Call Price
Call Vega
Fig. 11.3 Gamma and Vega of a call option with K = 1, r = 0.01, σ = 0.25 and T = 1
call option (short), option premium (long), Δ0 units of the asset and a loan of Δ0S0.
As the option premium offsets the value of the short option, we have Π0 = 0 and it
is self-financed. During the life of the trade, Δt units of the underlying asset should
be maintained at any time t. The cash in the portfolio is invested in money market.
We will revisit delta-hedging analysis in the chapter of risk-neutral pricing.
Gamma – Γt
Gamma measures the change of delta w.r.t. the price change of underlying. If
Gamma is zero, the delta amount is constant throughout the entire considered
tenor, i.e. static hedging. In particular, the Gamma of a portfolio of underlying
assets is zero. A non-zero Gamma portfolio implies dynamic hedging instead of
static hedging. Gamma is an important factor for risk management which will
be explained in the discrete hedging section. The Gamma of a portfolio can be
reduced or eliminated by adding other options having the opposite Gamma amount.
Obviously, the resulting additional delta can be hedged by the assets.11.4 Discussion on Hedging Issues 129
Theta – Θt
Theta measures the value change of portfolio or option with time. It is also called
time decay. For a delta-neutral portfolio, Theta is compensated by the Gamma term
in Black–Scholes PDE.
Vega – Vt
In BSM model, the volatility is a constant which is a simplistic assumption. In
practice, it is a parameter that is difficult to estimate, especially when applied to
the future period until the option’s expiry.
The Vega measures the impact of volatility. As for the gamma position for a
portfolio, the vega position can be hedged with other options having the opposite
amount of Vega.
Rho – ρt
In BSM model, the risk-free interest rate is assumed to be constant. The parameter
Rho measures the sensitivity of the portfolio’s value w.r.t. the change of interest rate
level. In practice, the risk-free rate is replaced by the borrow/lending rate available
for hedging transactions. This rate needs to have little or zero credit risk such as the
internal funding rate from the same institution.
The assumptions made previously in Black–Scholes–Merton analysis are over
simplistic. We highlight a few issues related to hedging in practice.
## 11.4.2 Practical Issues in Hedging
Discrete Hedging
Delta hedging can only be done at discrete times (one or a few times a day at most).
If the hedging is not adjusted continuously (or very frequently), a negative Gamma
position will make the portfolio under-hedged while a positive Gamma position will
make the portfolio over-hedged when the underlying price makes large moves.
Recall that for a delta hedged portfolio, Gamma and Theta have opposite signs
when their values are significant which roughly offset each other.
• For Γ > 0, earn from large market moves but lose from Θ < 0
• For Γ < 0, lose from large market moves but earn from Θ > 0.
The Gamma-Theta ratio is an important factor for managing a trading book.130 11 Black–Scholes–Merton Model for Option Pricing
Example 11.1 Consider a long call position with ATMF strike. Thus, we have Γ >
0. At inception, the hedging is done by shorting Δ0 shares at spot price S0, where
Δ0 ≈ 0.5. Then, the next day,
Scenario Hedging Result
St drops and Δt → 0.45 Need to short less, buy back at cheaper price Buy low
St rises and Δt → 0.55 Need to short more, sell at higher price Sell high
Therefore, the Γ > 0 position is beneficial to call option holder when market
moves. However, this is counterbalanced by Θ < 0 as the call is worth less.
The positive Gamma of long call can be explained in Fig.11.4, because it stands
for the difference between the curve ct (option value to the short call party) and the
delta-hedging line at one point in time with slope Δt.
Hedging P/L
Volatility is the most important parameter for the valuation of an option. From the
price of a market traded Vanilla option (i.e. call or put), we can reverse calculate the
so-called implied volatility from Black–Scholes formula.
The realized volatility during the life of an option trade may differ from the
implied volatility used for pricing and hedging. Let us analyze the P/L impact of the
realized volatility assuming a constant implied volatility for pricing and hedging.
For in-depth analysis of hedging P/L under various models, we refer to [8].
Fig. 11.4 Delta-hedging
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
−0.6
−0.5
−0.4
−0.3
−0.2
−0.1
0
0.1
0.2
Spot Price
Call Value (Short Party)
Hedging P/L11.4 Discussion on Hedging Issues 131
Denote
• σH, the constant “hedging volatility” which is used for calculating the Greeks
and the option mark-to-market price;
• σ, as realized volatility during the life of the trade.
Then we have the following important result on option hedging.
Proposition 11.2 The P/L impact at maturity of the inaccurate volatility used for
hedging is
1
2
 T
0
er(T−t)
ΓtS2
t (σ2
− σ2
H)dt.
Proof Applying Itô–Doeblin formula to V and assuming that the underlying St
follows the geometric Brownian motion with realized volatility σ,
dVt =
∂V
∂t
dt +
∂V
∂S
dSt +
1
2
∂2V
∂S2
σ2
S2
t dt.
From the PDE of BSM model, which is related to the hedging volatility σH,
∂V
∂t
= −(rSt
∂V
∂S
+
1
2
∂2V
∂S2
σ2
HS2
t − rVt).
Substituting ∂V
∂t in the formula for dVt, we get
dVt = rVtdt − rSt
∂V
∂S
dt +
∂V
∂S
dSt +
1
2
∂2V
∂S2
S2
t (σ2
− σ2
H)dt
dVt − rVtdt = Δt(−rStdt + dSt) +
1
2
ΓtS2
t (σ2
− σ2
H)dt
d(e−rt
Vt) = Δtd(e−rt
St) +
1
2
e−rt
ΓtS2
t (σ2
− σ2
H)dt
VT = erT
V0 +
 T
0
er(T−t)
Δt(dSt − rStdt)
!
+
1
2
 T
0
er(T−t)
ΓtS2
t (σ2
− σ2
H)dt.
The first bracketed term on RHS is the hedging P/L with σH as the volatility for
hedging and initial pricing (cf. Chap.13, Sect. 6). The second term is the missing
P/L which is the result to be proved. 132 11 Black–Scholes–Merton Model for Option Pricing
Transaction Cost
The framework of option pricing with transaction costs presented here was proposed
by Leland [48]. Let k be the round trip transaction cost per dollar value of the stock.
The self-financing hedging portfolio with no transaction cost satisfies
δV ≈ ΔδS + r(V − ΔS)δt,
where δt is a small discrete change in time. The cost for adjusting the Δ position
during the time interval δt is
δK =
k
2
S|δΔ| ≈
k
2
S|Γ σSδW|.

Γ =
δΔ
δS
, δS ≈ σSδW

In this analysis, E[|δW|] is applied instead of |δW|. By direct integration and the
fact that δW ∼ N (0,δt), we can obtain
E[|δW|] =
 ∞
−∞
|x|
√
2πδt
e− x2
2δt dx = 2
 ∞
0
x
√
2πδt
e− x2
2δt dx
=
+
2δt
π
 ∞
0
e− x2
2δt d(
x2
2δt
) =
+
2δt
π
 ∞
0
e−y
dy =
+
2δt
π
.
Defining Leland number, Le =

2
π

k
σ
√
δt

, we get δK = 1
2σ2S2|Γ |Leδt.
Adding in the cost for rebalancing the delta δK, we obtain
δV ≈ ΔδS + r(V − ΔS)δt −
1
2
σ2
S2
|Γ |Leδt.
From the Itô–Doeblin formula, we have dV = ∂V
∂t dt + ∂V
∂S dS + 1
2σ2S2 ∂2V
∂S2 dt.
Therefore,
∂V
∂t
dt +
∂V
∂S
dS +
1
2
σ2
S2 ∂2V
∂S2
dt = ΔdS + r(V − ΔS)dt −
1
2
σ2
S2
|Γ |Ledt.
Arranging the terms, we obtain the modified BSM model with transaction cost:
∂V
∂t
+
1
2
σ2
S2 ∂2V
∂S2
+
1
2
σ2
S2
|
∂2V
∂S2
|Le + rS
∂V
∂S
− rV = 0.
If 1 + sgn(Γ)Le ≥ 0, we have
∂V
∂t
+
1
2
σ̃2
S2 ∂2V
∂S2
+ rS
∂V
∂S
− rV = 011.4 Discussion on Hedging Issues 133
with adjusted volatility
σ̃2
= σ2
(1 + sgn(Γ )Le).
The impact on option price for small (σ̃ − σ) is roughly Vega × (σ̃ − σ) with
σ̃ − σ ≈ k √
2πδt
sgn(Γ ) (σ̃2 − σ2 = σ2sgn(Γ )Le, σ̃2 − σ2 = (σ̃ + σ)(σ̃ − σ) ≈
2σ(σ̃ − σ)). We can see that the more frequent the rebalancing (smaller δt), the
higher will be the transaction cost.
Exercises
1. Without using the put-call parity, verify that the Black–Scholes put option for-
mula (11.14) satisfies the Black–Scholes equation (11.8) and the corresponding
boundary conditions and terminal condition.
2. Let N(d) denote the derivative of the standard normal c.d.f.. Show that
StN
(d1) = Ke−r(T−t)
N
(d2)
and use this equality to derive the Delta of a vanilla call.
3. Transform the Black–Scholes equation with log price by making the variable
change x = lnS, and obtain the corresponding boundary conditions and terminal
condition.
4. Find the value of Black–Scholes call price when volatility approaches ∞. What
does the corresponding Delta imply?Chapter 12
Stochastic Calculus Part II
## 12.1 Change of Probability
Changing probability measure plays an important role in risk-neutral option pricing.
We first review the following important theorem.
Theorem 12.1 (Radon–Nikodym) Let (Ω,F,P) be a probability space. There
exists a unique Z > 0, E[Z] = 1, P-a.s., such that a new probability measure , P
can be defined
, P(A) =

A
Z(ω)dP(ω), ∀A ∈ F.
Furthermore,
, E[X] = E[ZX] and , E
X
Z
!
= E[X],
Z is called the Radon–Nikodym derivative of , P with respect to P. We often note it
as Z = d, P
dP. Also, , P is equivalent to P (noted as , P ∼ P), i.e., they agree on the
probability zero sets.
The proof can be found in real analysis or probability textbooks such as [73].
We next define the Radon–Nikodym derivative process from the Radon–
Nikodym derivative.
Lemma 12.1 Let Z be the Radon–Nikodym derivative of, P with respect to P. If we
define Zt = E[Z|Ft], then Zt is a P-martingale and
, E[Y] = E[YZt],
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_12
135136 12 Stochastic Calculus Part II
where Y is an Ft-measurable random variable for any t.
Proof For any s < t, the following arguments show that Zt is a martingale:
E[Zt|Fs] = E[E[Z|Ft]|Fs] = E[Z|Fs] = Zs.
For the expectation under, P, the Radon–Nikodym theorem leads to
, E[Y] = E[YZ] = E[E[YZ|Ft]] = E[YE[Z|Ft]] = E[YZt]. 
Zt is called a Radon–Nikodym derivative process and is noted as d, P
dP



Ft
. As
E[Zt|Fs] = Zs implies E[Zt
Zs
|Fs] = 1, it is natural to question the equivalence
between , E[Y|Fs] and E[Y Zt
Zs
|Fs](= 1
Zs
E[YZt|Fs]) which seems to be the “con-
ditioned version” of Radon–Nikodym theorem. This is confirmed by the following
which is a very useful formula when we calculate the conditional expectation under
the new measure, P.
Proposition 12.1 (Bayes’ Formula) Let 0 ≤ s ≤ t, Y be an Ft-measurable
random variable, Zt = d, P
dP



Ft
be a Radon–Nikodym derivative process, then
, E[Y|Fs] =
1
Zs
E[YZt|Fs].
Proof We only need to check the partial averaging property of conditional expecta-
tion. For any A ∈ Fs,

A
1
Zs
E[YZt|Fs]d, P = , E 1A
1
Zs
E[YZt|Fs]
!
= E[1AE[YZt|Fs]]
= E[E[1AYZt|Fs]] = E[1AYZt] = , E[1AY] =

A
Yd, P. 
We introduce here a special type of martingale known as the exponential
martingale. It is an important tool for applying the upcoming Girsanov Theorem.
Proposition 12.2 (Exponential Martingale) Let θt be an Ft-adapted process.1
The stochastic process
Zt = exp
 t
0
θsdWs −
1
2
 t
0
θ2
s ds

is an Ft-martingale and E[Zt] = Z0 = 1.
1Which satisfies the so-called Novikov’s condition.12.1 Change of Probability 137
Proof Let f(x) = ex and Xt =
t
0 θsdWs − 1
2
t
0 θ2
s ds, which implies
dXt = θtdWt −
1
2
θ2
t dt.
By Itô–Doeblin formula, we have
dZt = df(Xt) = f
(Xt)dXt +
1
2
f
(Xt)dXtdXt
= eXt

θtdWt −
1
2
θ2
t dt

+
1
2
eXt θ2
t dt = θtZtdWt.
Hence Zt is an Ft-martingale and E[Zt] = Z0 = 1. 
Theorem 12.2 (Girsanov Theorem) Let Wt be a Brownian motion on (Ω,F,P)
and θt be an adapted process. Then
Zt = exp

−
 t
0
θsdWs −
1
2
 t
0
θ2
s ds

(12.1)
is an exponential martingale such that dZt = −θtZtdWt. Taking Zt as a Radon–
Nikodym derivative process d, P
dP



Ft
, and define
, Wt = Wt +
 t
0
θsds,
then , Wt is a Brownian motion under the probability measure , P, assuming that
E[
T
0 θ2
s Z2
s ds] < ∞.
Note that we write indifferently dZt = −θtZtdWt with Z0 = 1 or (12.1) in the
following context.
Proof It can be proved by the direct application of the upcoming general form of
Girsanov Theorem, i.e., Theorem 12.3 with dZt = −θtZtdWt. 
Let us make an intuitive analysis with constant θt (= θ), Wt =
√
t ( ∼
N (0,1)) and , Wt = Wt + θt. Let ˜  be a random variable such that , Wt =
√
t˜ .
Then, we can check that
1
√
2π
e− ˜ 2
2 =
1
√
2π
e−2
2

e−1
2 θ2t−θ
√
t

=
1
√
2π
e−2
2 Zt.
Due to the appearance of a drift term
t
0 θsds, , Wt is not a martingale under the
original probability measure P in general. However, the Girsanov Theorem states
that , Wt becomes a martingale under , P. As a result, , Wt enjoys all the Brownian
motion properties under, P, for instance, , E[, Wt] = 0 (note that E[, Wt] = 0).138 12 Stochastic Calculus Part II
Next we introduce a more general form of Girsanov theorem, which does not rely
on the explicit form of the Radon–Nikodym derivative.
Lemma 12.2 Suppose , P ∼ P with Radon–Nikodym derivative process Zt
= d, P
dP



Ft
. Then, , Xt is a, P-martingale if and only if , XtZt is a P-martingale.
Proof Let , Xt be a, P-martingale. From Bayes’ formula, we have
, Xs = , E[, Xt|Fs] =
E[Zt , Xt|Fs]
Zs
, ∀0 < s < t,
i.e. Zs , Xs = E[Zt , Xt|Fs]. Conversely, let , XtZt be a P-martingale, then we have
Zs , Xs = E[Zt , Xt|Fs], i.e.
, Xs =
E[Zt , Xt|Fs]
Zs
= , E[, Xt|Fs],
by Bayes’ formula again. 
Theorem 12.3 (Girsanov–Meyer Theorem) Suppose , P ∼ P with Radon–
Nikodym derivative process Zt, which is continuous ( d, P
dP



Ft
= Zt). Moreover, Xt is
a continuous P-martingale. Define , Xt by
d, Xt = dXt −
1
Zt
dX,Zt.
Then , Xt is a continuous, P-martingale.
Proof First,bothXt andZt arecontinuousP-martingales.Thequadraticcovariation
X,Zt is a process without the Itô integral term (actually a finite variation process)
[43] and hence dX,Z,Zt = 0. Then,
d, X,Zt =

dXt −
1
Zt
dX,Zt

dZt = dX,Zt−
1
Zt
dX,Z,Zt = dX,Zt.
Now, according to the Lemma 12.2, it is enough to check that , XtZt is P-
martingale. Note that
d(, XtZt) = Ztd, Xt + , XtdZt + d, X,Zt = Ztd, Xt + , XtdZt + dX,Zt
= ZtdXt − dX,Zt + , XtdZt + dX,Zt = ZtdXt + , XtdZt.
Hence , XtZt is a P-martingale. 
This above theorem is useful when Zt is correlated to the P-martingale Xt, e.g.,
Zt and Xt are driven by different but correlated Brownian motions.12.3 Stochastic Differential Equations 139
## 12.2 Predictable Martingale Representation
An Ft-adapted process is said to be predictable if it is left continuous.
Theorem 12.4 Let Wt be a Brownian with Ft as its natural filtration and Xt be an
Ft-measurable continuous martingale, then, there is a unique predictable process
ζs, such that
Xt = X0 +
 t
0
ζsdWs.
The proof can be found in [44] and [66].
The following illustrations may help to understand the theorem:
• if X,Xt = t for all t, then, Xt = X0 +
t
0 dWs
• if X,Xt = ct for all t, then, Xt = X0 +
t
0
√
cdWs
• if
dX,Xt
dt = λt exists for all t, then, Xt = X0 +
t
0
√
λsdWs.
More generally, let FY
t be the natural filtration of a martingale set Y. The
necessary and sufficient condition for Xt to admit the predictable representation
with the integral of Yt (Xt = X0 +
t
0 ζs · dYs) is that there is a unique probability
measure P under which Xt is an FY
t -martingale [66]. It can be shown that P is
unique if Y is a set of Brownians.
## 12.3 Stochastic Differential Equations
Consider Itô processes of the form:
dXt = b(t,Xt)dt + φ(t,Xt)dWt,
where b(t,x) is considered as the drift coefficient and φ(t,x) the diffusion
coefficient. The above equation is a kind of stochastic differential equation (SDE).
Suppose Xt = x is the initial condition at time t ≥ 0, x ∈ R. Then, the solution
of the SDE is a stochastic process XT , T > t, such that
⎧
⎪ ⎨
⎪ ⎩
Xt = x,
XT = Xt +
 T
t
b(s,Xs)ds +
 T
t
φ(s,Xs)dWs.
(12.2)
Theorem 12.5 (Existence and uniqueness theorem for one dimensional SDE)
Let b and φ be continuous functions such that, there exists a K < +∞, and
1. |b(t,x) − b(t,y)| + |φ(t,x) − φ(t,y)| ≤ K|x − y|
2. |b(t,x)| + |φ(t,x)| ≤ K|1 + x|140 12 Stochastic Calculus Part II
for all t < T. Then, (12.2) admits a unique solution.
Readers are referred to [60].
The following processes are frequently used in financial modelling.
Arithmetic Brownian Motion
The following SDE is used in Bachelier stock price model [5]
dSt = μdt + σdWt,
which gives normally distributed ST = x + μ(T − t) + σ(WT − Wt) with St = x.
Geometric Brownian Motion
Consider the following SDE used in Black–Scholes–Merton model,
dSt = μStdt + σStdWt,
where μ and σ > 0 are constants. Here b(t,x) = μx and φ(x,t) = σx. With
St = x, the unique solution is the lognormally distributed geometric Brownian
motion
ST = xe(μ−1
2 σ2)(T−t)+σ(WT −Wt)
.
Ornstein–Ulhenbeck Process
The OU (Ornstein–Ulhenbeck) process is the unique solution of
dXt = −cXtdt + σdWt, X0 = x.
Let Yt = Xtect. Applying Itô’s product rule, we get dYt = σectdWt. Hence
Xt = xe−ct
+ σe−ct
 t
0
ecs
dWs,
which is a Gaussian process2 with mean E[Xt] = xe−ct. Using Itô isometry,
2For any ti, i = 1,...,n, the random vector (Xt1,Xt2,...,Xtn) follows the multivariate normal
distribution. For instance, the Brownian motion is a Gaussian process.12.3 Stochastic Differential Equations 141
Var(Xt) = E[(Xt − E[Xt])2
] = σ2
e−2ct
E
 t
0
ecs
dWs
2

= σ2
e−2ct
E
 t
0
e2cs
ds
!
= σ2 1 − e−2ct
2c
.
Cox–Ingersoll–Ross Square Root Process
CIR (Cox–Ingersoll–Ross) process is the unique solution of
dXt = (a − bXt)dt + σ

XtdWt, Xt ∈ [0,∞), X0 = x > 0,a > 0,b > 0.
It is a positive process with mean reversion behavior which means that Xt tends to
rise when Xt < a
b and tends to fall when Xt > a
b. The parameter b characterizes the
speed of the mean reversion.
Let τ0 = inf{t ≥ 0|Xt = 0} be the first time of hitting 0 (more generally, a
stopping time; see Chap.15). The properties of CIR process are given below
– if a ≥ σ2
2 , P{τ0 = ∞} = 1
– if 0 ≤ a < σ2
2 , P{τ0 < ∞} = 1.
It is also known that given the current value, the future values of a CIR process
follow a non-central Chi-squared distribution extended to non-integer degrees of
freedom, which can be calculated in closed-form.
The references for the proof are given in Appendix B where we show that the
CIR process can be represented with a Squared Bessel process which is well studied
for its properties. The relevant properties of Squared Bessel are also introduced in
Appendix B.
Proposition 12.3 (Markov Property of SDE Solutions) Let Xu, u ≥ 0 be a
solution to the SDE with initial condition given at time 0. Then for any function
h,
E[h(XT )|Ft] = EXt
t [h(XT )],
where EXt
t [·] denotes an expectation evaluated with initial value Xt at time t.
Proof can be found at [60]. We see that the value of XT should depend on two
things, the initial value Xt, which is Ft-measurable, and the increments of Xu,
t ≤ u ≤ T, which, in turn, are determined by increments of Wu. As increments of
Wu are independent of Ft, it seems natural to drop the conditioning of Ft in the
expectation.
The below theorem links the expectation computation from an SDE related
problem with a PDE problem.142 12 Stochastic Calculus Part II
Theorem 12.6 (Feynman–Kac Theorem) Let Xt follow the following SDE
dXt = b(t,Xt)dt + φ(t,Xt)dWt.
Assume that h satisfies Ex
t [|h(XT )|] < ∞. For any x ∈ R and t < T, let
g(t,x) = Ex
t [h(XT )].
Then, g(t,x) satisfies the below PDE
∂g
∂t
(t,x) + b(t,x)
∂g
∂x
(t,x) +
1
2
φ2
(t,x)
∂2g
∂x2
(t,x) = 0,
and the terminal condition g(T,x) = h(x).
Proof We apply the Itô’s formula and obtain
dg(t,Xt) =
∂g
∂t
dt + b
∂g
∂x
dt + φ
∂g
∂x
dWt +
1
2
φ2 ∂2g
∂x2
dt
=

∂g
∂t
+ b
∂g
∂x
+
1
2
φ2 ∂2g
∂x2

dt + φ
∂g
∂x
dWt.
As g(t,Xt) is a martingale (Proposition 10.1), the dt term should be zero. We
obtain
∂g
∂t
(t,Xt) + b(t,Xt)
∂g
∂x
(t,Xt) +
1
2
φ2
(t,Xt)
∂2g
∂x2
(t,Xt) = 0
along every path of X. Therefore,
∂g
∂t
(t,x) + b(t,x)
∂g
∂x
(t,x) +
1
2
φ2
(t,x)
∂2g
∂x2
(t,x) = 0
at every point (t,x) that can be reached by (t,Xt). 
Exercises
1. Consider a stochastic integral It =
t
0 fsdWs where ft is deterministic, i.e., a
non-random function of t.
(i) Show that E[It] = 0 and Var(It) =
 t
0
f2
s ds.
(ii) Show that the moment generating function of It for any a ∈ R is12.3 Stochastic Differential Equations 143
E[eaIt ] = exp

1
2
a2
 t
0
f2
s ds

= exp

aE[It] +
1
2
a2
Var(It)

,
i.e., it uniquely determines that It is normally distributed with mean 0 and
variance
 t
0
f2
s ds.
2. Let Xt = W2
t − t and recall that it is an Ft-measurable martingale. Find the
unique predictable process ζs as in the predictable martingale representation such
that
Xt = X0 +
 t
0
ζsdWs.
3. Find the value of EWt
t [W2
T ].
4. The following assumes the same notations as in the Feynman–Kac theorem. Let
r be a constant. Define f as a function of t and x with
f(t,x) = e−r(T−t)
Ex
t [h(XT )],
assuming Ex
t [|h(XT )|] < ∞, ∀x and t < T. Show that
(i) e−rtf(t,Xt) is a martingale
(ii) f(t,x) satisfies the PDE
∂f
∂t
(t,x) + θ(t,x)
∂f
∂x
(t,x) +
1
2
φ2
(t,x)
∂2f
∂x2
(t,x) = rf(t,x)
and the terminal condition f(T,x) = h(x).Chapter 13
Risk-Neutral Pricing Framework
The risk-neutral pricing framework is about the analysis and techniques for deriva-
tives hedging and pricing. The pioneer work of Black, Scholes and Merton marked
the beginning of the development of both theory and practice. The no-arbitrage
hedging techniques of cash-and-carry strategy and delta-hedging strategy of BSM
model are examples of risk-neutral hedging.
## 13.1 Money Market Account
Definition 13.1 (Money Market Account Process) Let rt be the interest rate
which may be deterministic or stochastic. The money market account process is
defined as Mt = e
t
0 rsds
, with the properties
dMt = rtMtdt and d
1
Mt
= −
rt
Mt
dt.
The money market process Mt can be considered as the value of a default-free
cash deposit account and 1
Mt
= e−
t
0 rsds
is the discount factor for cashflows at time
t. The discounting of an asset price St can be written as St
Mt
which demonstrates the
price of St in the number of units of the money market account Mt. The role of the
money market account is the so called numéraire which will be revisited in later
chapters as it facilitates the financial modelling for derivatives hedging/pricing.
rt represents the instantaneous interest rate for borrow/lending which may be
stochastic. In this book, if there is no specific statement, we generally assume that
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_13
145146 13 Risk-Neutral Pricing Framework
the correlation between rt and the considered asset is zero. In particular, when rt is
a constant r, we get the familiar notations:
Mt = ert
and
1
Mt
= e−rt
.
## 13.2 Risk-Neutral Probability Measure
Definition 13.2 (Risk-Neutral Probability) A risk-neutral probability measure, P,
is defined as the one under which the discounted price of any tradable non-dividend
paying asset St is a martingale:
, E
St
Mt



F0
!
=
S0
M0
.
For a portfolio of tradable assets, as its price Πt is a linear combination of the
asset prices, Πt
Mt
must be a martingale under the risk-neutral probability, P.
In this chapter, we make continuous-time modelling analysis on non-dividend
paying assets following the stochastic differential equations as the below one:
dSt = μtStdt + σtStdWt, under P,
where μt and σt are Ft-adapted processes. We have assumed the one-factor model
(i.e. with one stochastic variable) for simplifying the presentation. The results can
be generalized to the multi-dimensional case.
Proposition 13.1 There exists a risk-neutral probability measure , P under which
St
Mt
is a martingale and
d
St
Mt
= σt
St
Mt
d , Wt,
or equivalently in the more popular notation,
dSt = rtStdt + σtStd , Wt.
Proof By Itô’s product rule,
d
St
Mt
=
1
Mt
dSt + Std
1
Mt
=
1
Mt
(μtStdt + σtStdWt) − rt
St
Mt
dt
= (μt − rt)
St
Mt
dt + σt
St
Mt
dWt = σt
St
Mt

dWt +
μt − rt
σt
dt

.13.3 Self-Financing Portfolio 147
Applying Girsanov theorem with Zt = d, P
dP



Ft
= exp
-
−
t
0 θsdWs − 1
2
t
0 θ2
s ds
.
,
where θt = (μt − rt)/σt, we obtain d , Wt = dWt + θtdt such that
d
St
Mt
= σt
St
Mt
d , Wt,
which is an exponential martingale under, P.
From d St
Mt
= 1
Mt
(dSt − rtStdt), we obtain
dSt = rtStdt + σtStd , Wt. 
## 13.3 Self-Financing Portfolio
The discounted asset price is a risk-neutral martingale by Proposition 13.1. Next
we study this property for a portfolio of assets and money market account, i.e.,
Πt = ΔtSt+ζtMt whereΔt,ζt (maybenegative) representrespectivelythenumber
of assets and the units in money market account.
Definition 13.3 (Self-financing Portfolio) A self-financing portfolio is defined as
the one satisfying
dΠt = ΔtdSt + ζtdMt.
In the discrete form, it is equivalent to
St+δtΔt+δt + Mt+δtζt+δt = St+δtΔt + Mt+δtζt,
which implies that when one readjusts the portions Δt and ζt in the asset and money
markets respectively, the costs should cancel each other such that no money is
brought in or taken out of the portfolio (see Chapter 4 Exercise 10 in [79]).
We then have the following important theorem.
Theorem 13.1 A portfolio Πt = ΔtSt + ζtMt is self-financing if and only if
Πt
Mt
=
Π0
M0
+
 t
0
Δud
Su
Mu
.
Hence, if St
Mt
is a, P-martingale, Πt
Mt
is also a, P-martingale with
, E
Πt
Mt



Fs
!
=
Πs
Ms
, s ≤ t.148 13 Risk-Neutral Pricing Framework
Proof If Πt is self-financed, then
d
Πt
Mt
= −rt
Πt
Mt
dt +
1
Mt
dΠt = −rt
Πt
Mt
dt +
1
Mt
(ΔtdSt + ζtdMt)
= −rt
Πt
Mt
dt +
1
Mt
[ΔtdSt + rt(Πt − ΔtSt)dt]
= Δt
1
Mt
(dSt − rtStdt) = Δtd
St
Mt
.
Hence, we proved the necessary condition.
Now, assuming Πt = ΔtSt + ζtMt and Πt
Mt
= Π0
M0
+
t
0 Δud Su
Mu
, we first have
d
Πt
Mt
= Δtd
St
Mt
= Δt

Std
1
Mt
+
1
Mt
dSt

.
On the other hand, Itô’s product rule implies
d
Πt
Mt
= Πtd
1
Mt
+
1
Mt
dΠt = (ΔtSt + ζtMt)d
1
Mt
+
1
Mt
dΠt.
Equating the two and then rearranging, we obtain
dΠt = ΔtdSt +ζtdMt. 
## 13.3.1 Discounting, Excess Return and Self-Financing
In finance, the discounting, excess return and self-financing are intimately related
concepts. The interpretation of the term d St
Mt
= d(e−
t
0 rudu
St) = e−
t
0 rudu
(dSt −
rtStdt) can be equivalently expressed as
• increment of discounted asset price for the time interval dt
• present value of the excess return from the asset for the time interval dt
• present value of the return from the self-financing investment in the asset over
time dt.
We highlight that such return corresponds to practical implementation in the
financial market.13.5 Hedging and Pricing in Complete Market 149
## 13.4 Fundamental Theorems of Asset Pricing
Definition 13.4 An arbitrage is a self-financing portfolio Πt such that, with Π0 =
0, it satisfies for some T > 0:
P{ΠT ≥ 0} = 1 and P{ΠT > 0} > 0.
Theorem 13.2 (First Fundamental Theorem of Asset Pricing) If a market
model has a risk-neutral probability measure, then, it does not admit arbitrage.
Proof Let, Pbetherisk-neutralprobabilitymeasurethatisequivalenttoP.LetΠ0 =
0 and P{ΠT ≥ 0} = 1. As P{ΠT ≥ 0} = 1, we have necessarily P{ΠT < 0} = 0
which implies, P{ΠT < 0} = 0 because, P ∼ P.
By Proposition 13.1, we have
, E
Πt
Mt
!
=
Π0
M0
= 0.
Hence, we have, P{ΠT > 0} = 0 (otherwise, we would get a contradiction , E[Πt
Mt
] >
0). As, P ∼ P, we get P{ΠT > 0} = 0 , i.e., no arbitrage exists. 
Definition 13.5 A market model is called complete if every derivative security can
be hedged.
Theorem 13.3 (Second Fundamental Theorem of Asset Pricing) The model is
complete if and only if the risk-neutral probability measure is unique.
We refer to [79] for the proof.
For hedging a contingent claim on tradable assets, we wish to replicate the
contingent claim by a self-financing portfolio of the assets. Under the risk-neutral
probability, P, the discounted value of the portfolio is a martingale. The uniqueness
of , P is the necessary and sufficient condition for the predictable martingale
representation property which implies the existence of the self-financing portfolio
process for replicating the contingent claim. Actually, the integral part in the
martingale representation constitutes the dynamic hedging process.
## 13.5 Hedging and Pricing in Complete Market
Proposition 13.2 In a complete market, the self-financing hedging process for a
short position of a contingent claim paying out VT at T is
Vt
Mt
=
V0
M0
+
 t
0
Δud
Su
Mu
, 0 ≤ t ≤ T (M0 = 1),150 13 Risk-Neutral Pricing Framework
where Δu is a unique predictable process and Su
Mu
is a, P-martingale.
Proof We replicate (hedge) the contingent claim by a self-financing portfolio Πt
with terminal value ΠT = VT . In a complete market, , P is unique and ΠT
MT
is a
, P-martingale. Hence, by the predictable martingale representation property, there
exists a unique predictable process φu, such that
Πt
Mt
=
Π0
M0
+
 t
0
φud , Wu, 0 ≤ t ≤ T.
Defining the unique predictable process as Δu = φu/(σu
Su
Mu
), we obtain
Πt
Mt
=
Π0
M0
+
 t
0
Δuσu
Su
Mu
d , Wu =
Π0
M0
+
 t
0
Δud
Su
Mu
(Proposition 13.1).
By Theorem 13.1, Πt is a self-financing portfolio. Setting Vt = Πt, ∀0 ≤ t ≤ T
finishes the proof. 
## 13.5.1 General Pricing Formula
The general pricing formula for a European option paying out VT at maturity can be
obtained by taking conditional expectation for time-0 (hence M0 = 1):
V0 = , E
VT
MT



F0
!
.
Now, we take conditional expectation for time-t:
, E
VT
MT



Ft
!
=
V0
M0
+, E
 T
0
Δud
Su
Mu



Ft
!
=
V0
M0
+, E
 t
0
Δud
Su
Mu



Ft
!
+, E
 T
t
Δud
Su
Mu



Ft
!
.
The last term is , E
'T
t Δud Su
Mu


Ft
(
= , E
'T
t Δuσu
Su
Mu
d , Wu


Ft
(
= 0. On the
other hand, Proposition 13.2 implies that V0
M0
+ , E
't
0 Δud Su
Mu


Ft
(
= V0
M0
+
t
0 Δud Su
Mu
= Vt
Mt
. Hence, VT /MT is a martingale under , P. We obtain the general
formula for the mark-to-market price (MtM) of the derivative contract at any time t
before its expiry:13.6 Discussion on Hedging, Pricing and Risk-Neutral Framework 151
Vt = Mt, E
VT
MT



Ft
!
. (13.1)
## 13.5.2 Determination of Hedging Parameter Δt
Itô–Doeblin formula and Itô’s product rule give the differential of Vt
Mt
as
d
Vt
Mt
=
1
Mt

−rtVtdt +
∂V
∂t
dt +
∂V
∂S
dSt +
1
2
∂2V
∂S2
dS,St

=
1
Mt

−rtVt +
∂V
∂t
+ rtSt
∂V
∂S
+
1
2
σ2
t S2
t
∂2V
∂S2

dt +
∂V
∂S
σt
St
Mt
d , Wt.
(13.2)
The risk-neutral SDE dSt = rtStdt + σtStd , Wt in Proposition 13.1 is used. We also
know that Vt
Mt
is a , P-martingale from self-financing replication. The drift term in
(13.2) equals to 0 and the remaining term is then
d
Vt
Mt
=
∂V
∂S
σt
St
Mt
d , Wt or
VT
MT
=
V0
M0
+
 T
0
∂V
∂S
d
St
Mt
.
On the other hand, from Proposition 13.2, we have
VT
MT
=
V0
M0
+
 T
0
Δtd
St
Mt
.
Comparing the above equations, we obtain the delta amount
Δt =
∂V
∂S
(t,St).
## 13.6 Discussion on Hedging, Pricing and Risk-Neutral
Framework
The key objective of modelling for derivatives is to determine the self-financing
hedging process and the pricing methodology. The hedging of a European style
option (not limited to vanilla options) with expiry T consists of setting up a self-
financing portfolio for the option with initial value representing the option premium
at inception. By Proposition 13.2, the portfolio will have its final value equal to the
option payoff at expiry. The hedging process consists of holding a quantity of Δt
of underlying assets through self-financing: if Δt ≥ 0, the cash amount of ΔtSt152 13 Risk-Neutral Pricing Framework
is borrowed for financing the purchase of Δt units of underlying asset; otherwise,
|Δt| units of the asset are borrowed and sold at the prevailing asset price St with the
selling proceeds |Δt|St lent to money market. This describes the dynamic hedging
for any time t < T. In particular, expanding d St
Mt
with Mt = ert in Proposition 13.2
leads to
VT = erT
V0 +
 T
0
er(T−t)
Δt(dSt − rStdt),
where the first term is the accrued option premium and the second term is the
accrued hedging profit and loss (P/L). We recall that the term −rStdt can be
regarded as the financing cost per asset unit and (dSt − rStdt) is the return from
the self-financing investment into one asset. Hence, Δt(dSt − rStdt) is the P/L of
holding Δt units of underlying assets with self-financing.
The option price at any time t < T is simply defined as the portfolio’s value
Vt, knowing that at expiry time T, the portfolio’s value VT is the option’s payoff.
The discounted price of the portfolio is a martingale because the discounted prices
of its components (i.e. underlying assets and money market account position) are
martingales. This leads to the general pricing formula (13.1):
Vt = Mt, E
VT
MT



Ft
!
.
By Theorem 13.2, the existence of risk-neutral probability measure ensures no
arbitrage. Risk-neutral framework is characterized by the drift rt for the process
of any tradable non-dividend paying asset when money market account is the
numéraire and is used for financing. The intuitive illustration of the rationale, apart
from arbitrage issue, is that with any other choice for the drift, say μ = r, one
would expect a “hedging process” like VT = eμT V0 +
T
0 eμ(T−t)Δt(dSt −μStdt),
which does not correspond to the money market account accrual and self-financing
implementation under current financial/economic system. On the other hand, the
risk-neutral framework provides the naturally implementable self-financing hedging
process as previously explained.
Example 13.1 (Discrete delta-hedging) Consider the discretized self-financing
portfolio and see how the portfolio approximates the option value. Expanding
d Πt
Mt
= Δtd St
Mt
with Mt = ert, we have
dΠt = ΔtdSt + r(Πt − ΔtSt)dt.
Then, the discrete case corresponds to
Πt+δt ≈ Πt +Δt(St+δt −St)+r(Πt −ΔtSt)δt = (1+rδt)(Πt −ΔtSt)+ΔtSt+δt.13.7 Black–Scholes–Merton Model Revisited 153
This can be understood by owning Δt units of asset and (Πt − ΔtSt) in the money
market at time t. At time t +δt, the asset value becomes St+δt and is worth ΔtSt+δt,
while the cash position grows by the factor (1 + rδt) in the discrete sense.
## 13.7 Black–Scholes–Merton Model Revisited
Recall that the geometric Brownian motion models the asset price and the corre-
sponding SDE is
dSt = μStdt + σStdWt,
where σ is the constant volatility and μ is the drift of the asset in its real probability
P. Let r be the constant money market rate. By Proposition 13.1, we have d St
Mt
=
σ St
Mt
d , Wt, where Zt = d, P
dP



Ft
= exp
-
−θWt − 1
2θ2t
.
, and θ = (μ − r)/σ. Under
, P, St
Mt
is a martingale. Furthermore, the SDE for the asset price process is
dSt = rStdt + σStd , Wt.
LetV(t,S)bethederivativepayingouth(ST )atmaturityT andVt = V(t,St)be
its mark-to-market value. Since Vt
Mt
is a , P-martingale by self-financing replication,
the dt term (drift) in (13.2) should be zero which leads to the so-called Black–
Scholes PDE:
∂V
∂t
+ rS
∂V
∂S
+
1
2
σ2
S2 ∂2V
∂S2
− rV = 0. (13.3)
## 13.7.1 Closed-Form Solution for Call Option
To obtain the price, one can solve the governing PDE (13.3) or resort to the fact that
the discounted option value is a risk-neutral martingale, thus,
V(t,St) = , E[e−r(T−t)
h(ST )|Ft].
For simplicity and without loss of generality, we first consider pricing a European
call option with t = 0 under the Black–Scholes model.
Since the asset price follows the log-normal distribution, the solution for the asset
price is the geometric Brownian motion
ST = S0e(r−1
2 σ2)T+σ , WT .154 13 Risk-Neutral Pricing Framework
The pricing of a European call option paying cT = (ST − K)+ at maturity T is
c0 = , E
cT
MT
|F0
!
= , E
(ST − K)+
erT
|F0
!
= , E[e−rT
(S0e(r−1
2 σ2)T+σ , WT − K)+
|F0]
= , E[e−rT
(ST − K)+
] (, WT − , W0 is independent of F0)
= , E[e−rT
ST 1{ST >K}] −, E[e−rT
K1{ST >K}] ≡ A − B.
The condition ST > K is equivalent to , WT > −d2
√
T, where we define
d2 = ln
S0
K
+ (r −
1
2
σ2
)T
!
/(σ
√
T)
and then
A = S0, E
'
e−1
2 σ2T+σ , WT 1{, WT >−d2
√
T}
(
= S0, E
'
ZT 1{, WT >−d2
√
T}
(
.
The term ZT = e−1
2 σ2T+σ , WT is an exponential martingale. It can be eliminated
by applying Girsanov Theorem with Zt = dQ
d, P



Ft
as Radon–Nikodym derivative
process for defining a new probability Q. Then
A = S0, E[ZT 1{, WT >−d2
√
T}] = S0, EQ
[1{, WQ
T +σT>−d2
√
T}
]
= S0Q{, WQ
T > −d2
√
T − σT} = S0Q{ > −d2 − σ
√
T}
( is standard normal variable)
= S0Q{ < d2 + σ
√
T} (symmetry of normal distribution)
= S0N(d2 + σ
√
T) = S0N
)
ln S0
K + (r + 1
2σ2)T
σ
√
T
*
≡ S0N(d1).
For the second term B, the expectation turns out to be a probability
B = , E[e−rT
K1{ST >K}] = e−rT
K, E[1{, WT >−d2
√
T}] = e−rT
K, P{, WT > −d2
√
T}
= e−rT
K, P{ > −d2} = e−rT
K, P{ < d2} = e−rT
KN(d2).
Hence c0 = A − B = S0N(d1) − e−rT KN(d2), where
d1 =
ln S0
K + (r + 1
2σ2)T
σ
√
T
and d2 = d1 − σ
√
T.13.8 Dividend Modelling 155
In the same way, we can obtain ct = StN(d1) − e−r(T−t)KN(d2), where
d1 =
ln St
K + (r + 1
2σ2)(T − t)
σ
√
T − t
and d2 = d1 − σ
√
T − t.
From the derivation, we see that the term N(d2) is the risk-neutral probability of
a call option ending up in-the-money:
N(d2) = , E[1{ST >K}] = , P{ST > K}.
On the other hand, the delta N(d1) (cf. the exercise on delta calculation in Chap.11)
is the amount of assets needed for hedging. From the relationship d2 = d1 −
σ
√
T − t, there are two scenarios when N(d1) and N(d2) are close to each other,
i.e., either σ → 0 or t → T.
## 13.8 Dividend Modelling
Many assets, such as equities, pay out dividends. The price of an option on an asset
thatpaysdividendsisaffectedbythepayments.Whenwemodeldividendpayments,
we need to consider two issues: (1) When, and how often, are dividend payments
made? (2) How large are the payments?
There are mainly three types of dividend modelling:
Cash dividend dividends are paid as fixed cash amount at discrete times. This is
the most common dividend form.
Proportional dividend dividend amount of qtSt are paid at discrete time
t1,t2,t3,....
Continuous dividend
dSt = μtStdt + σtStdWt − qtStdt,
where qt is the dividend yield and the term qtStdt can be understood as the value
reduction in asset price after dividend. The continuous dividend is the easiest
to model. So, it is applied for options where this approximation does not have
significant impact.
Furthermore we define price return of an asset as the return without adding back
the already paid dividends, and total return reflects the return by reinvesting all the
paid dividends in the same asset.
Fixed cash dividend for long term is not a viable dividend modelling (a stock of
$100 paying $3 dividend will not still pay $3 even when its price drops to $10). In
practice, people often use:
• cash dividends for the short term (e.g. ≤ 2 years)156 13 Risk-Neutral Pricing Framework
• proportional dividends for long term (e.g. ≥ 5 years)
• mixture of cash dividends and proportional dividends in between.
## 13.8.1 Risk-Neutral SDE with Continuous Dividend
The asset price model is
dSt = μtStdt + σtStdWt − qtStdt. (13.4)
Let S∗
t = Ste
t
0 qsds
denote the total price of the asset with dividends reinvested, its
discounted value S∗
t /Mt should be a martingale under the risk-neutral probability, P:
d
S∗
t
Mt
= d

e−
t
0 rsds
e
t
0 qsds
St

= d

e
t
0(qs−rs)ds
St

= e
t
0(qs−rs)ds
[(qt − rt)Stdt + dSt]
= e
t
0(qs−rs)ds
St[(qt − rt)dt + (μt − qt)dt + σtdWt] = σt
S∗
t
Mt
d , Wt,
where d , Wt = μt−rt
σt
dt + dWt. Equating e
t
0(qs−rs)ds
[(qt − rt)Stdt + dSt] =
σt
S∗
t
Mt
d , Wt, we obtain the risk-neutral SDE,
dSt = (rt − qt)Stdt + σtStd , Wt. (13.5)
Next, consider rt = r, qt = q, and σt = σ. For a contingent claim V replicated
by a self-financing portfolio,
d
Vt
Mt
= e−rt

−rVtdt +
∂V
∂t
dt +
∂V
∂S
dSt +
1
2
∂2V
∂S2
dS,St

= e−rt
−rVt +
∂V
∂t
+ (r − q)St
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
!
dt + e−rt ∂V
∂S
σStd , Wt.
Since Vt
Mt
is a , P-martingale, the drift term equals to zero and gives the governing
equation
∂V
∂t
+
1
2
σ2
S2 ∂2V
∂S2
+ (r − q)S
∂V
∂S
− rV = 0.13.8 Dividend Modelling 157
## 13.8.2 Vanilla Option Pricing Formula
Let us consider pricing European call and put options c(t,St) and p(t,St) with
continuous dividend q. The first way is to use the risk-neutral pricing formula with
ST = Ste(r−q−1
2 σ2)(T−t)+σ(WT −Wt)
.
Theorem 13.4 Under continuous dividend yield q,
c(t,St) = e−q(T−t)
StN(d1) − Ke−r(T−t)
N(d2),
p(t,St) = Ke−r(T−t)
N(−d2) − e−q(T−t)
StN(−d1),
where
d1 =
ln(St/K) + (r − q + 1
2σ2)(T − t)
σ
√
T − t
, d2 = d1 − σ
√
T − t.
In PDE approach, the boundary conditions are modified. For the European call
option, the final condition and the boundary condition at St = 0 are the same as the
non-dividend paying case. The only change is the boundary at St → ∞ given by
c(t,St) ∼ Ste−q(T−t)−Ke−r(T−t), which can be verified by no arbitrage argument.
The call and put option prices give the modified version of put-call parity:
Ste−q(T−t)
+ p(t,St) − c(t,St) = Ke−r(T−t)
,
which can also be verified by a no-arbitrage argument.
## 13.8.3 Option Adjustment for Exceptional Dividend and Right
Issuance
In option pricing, assumptions are made for the known and regular future dividends.
The parties of the option trade take dividend risk that the effective paid dividends
may differ from the assumed levels.
However, if there will be an exceptional dividend or right issuance after the
inception of the option, the common market practice consists of adjusting the size
of the option as well as the initial spot related parameters such as strike and barrier
of the option so that the option price remains unchanged. This type of adjustment is
covered in the termsheet and agreed by both parties of the option transaction.
The adjustment factor α is illustrated by the case for a Call option:158 13 Risk-Neutral Pricing Framework
N, E[(ST − K)+
|Ft] = N, E[(Scumdiv
t e(r−1
2σ2)(T−t)+σ , WT−t − K)+
|Ft]
=
N
α
, E[((1 − div)Scumdiv
t e(r−1
2 σ2)(T−t)+σ , WT−t − K̂)+
|Ft],
where α = 1 − div and K̂ = Kα.
Hence, the adjustment consists of changing the notional to N/α and Strike to
Kα.
Similar methods can be deduced for the adjustment factors for other type of
options, such as Asian option which has already started with past known fixings.
Let us take the example of a $2m, 1Y, 110% strike call option linked to a single
stock. The initial spot is $80 and the strike price is $88. A few days after the option
has started, the price of stock is $90 and an exceptional dividend of $4.5 (5%) is paid
on the stock. The adjustment factor will be α = (100% − 5%). The strike price of
the option contract will be adjusted to $88 ×(100%−5%) = $83.6 and the notional
amount of the option will be adjusted to $2m /(100% − 5%) =$2.105m.
## 13.9 Collateralized Derivative Pricing and FVA
As introduced in Chap.1, an OTC derivative may be traded under a master agree-
ment such as ISDA/CSA where the CSA (Credit Support Annex) agreement sets
out the collateral posting terms and conditions. The derivative pricing framework
presented so far has not considered the impact from collateral. In the following, we
will adjust the standard derivative pricing framework with collateral posting.
We consider the situation for an OTC derivative where the CSA agreement
between the two counterparties has the following terms:
• zero threshold for posting collateral
• zero MTA (Minimum Transfer Amount)
• collateral is cash in the same currency as the denomination for the derivative
transaction
• the interest rate applied to the collateral is rc (e.g. OIS based rate, cf. Chap.2)
Under such condition, the party having the positive mark-to-market Vt (say, party
A) will receive the cash collateral from the other party (say, party B) and will pay
the interest for the cash collateral at the rate of rc. If the normal financing rate for
party A is r (which could be internal financing rate or unsecured funding rate),
then the cash collateral with interest rate rc implies a PnL of (rt − rc
t ) × Vt × δt
for the small period δt to party A. Recall that Vt represents the value of the self-
financing portfolio replicating the payoff of the derivative. For taking into account
this PnL impact from rc, we set V∗
t = Vte
t
0(ru−rc
u)du
which is the “total price” of
the derivative. It implies that any interest received/paid will be invested in/divested
from Vt. Under , P, its discounted value V∗
t /Mt should be a martingale. Hence, by
martingale representation property, we have13.9 Collateralized Derivative Pricing and FVA 159
V∗
T
MT
=
V∗
0
M0
+
 T
0
φud , Wu,
where φu is a predictable process,
V∗
T
MT
=
VT e
T
0 (ru−rc
u)du
MT
= VT e−
T
0 rc
udu
and
V∗
0
M0
= V0.
Taking conditional expectation, we obtain
V0 = , E
'
e−
T
0 rc
udu
VT


F0
(
.
We highlight that rc appears only in the discounting term. The interest rate in the
risk-neutral SDE for the underlying is still the financing rate r, i.e. for BSM model,
dSt = rStdt + σStd , Wt.
This pricing framework is known as the method of CSA discounting or OIS
discounting. Its application needs to take into account the CSA terms and conditions
on the collateral type, threshold/MTA and netting, etc. There is an abundance of
literature on this topic after the financial crisis of 2008, e.g. [65].
For counterparties with CSA, the FVA (Funding Value Adjustment) is caused
by the difference between the interest rate for hedging and the interest rate applied
on the collateral for the trade’s MtM exposure. The value of FVA is actually the
expected funding P/L over the life of the trade. It can be calculated as the difference
between the pricing with CSA discounting and the pricing without CSA discounting
on the future cashflows of the transaction.
Exercises
1. Consider the Black–Scholes–Merton model for a non-dividend-paying stock.
Show that the price of a forward start ATM call option (future stock price as
strike) equals to the value of a European ATM call option with the same life.
2. Given the asset process
dSt = μtStdt + σtStdWt,
where μt and σt are non-random functions of t. The risk-free interest rate rt is
also a deterministic function of t.
Derive the SDE and PDE for European options and obtain the closed-form
solution for the time-t price of a vanilla put option paying out pT = (K − ST )+
at maturity T.
3. The futures price with maturity T at time t is defined as Ft(T) = , E[ST |Ft],
despite the modelling of St.160 13 Risk-Neutral Pricing Framework
(i) Show that the futures price Ft(T) is a martingale under the risk-neutral
probability measure.
(ii) Assume by the martingale representation theorem that dFt(T) =
σtFt(T)d , Wt, where σt is deterministic. For 0 ≤ s ≤ t, show the Black’s
formula:
, E[(Ft(T) − K)+
|Fs] = Fs(T)N(d1) − KN(d2)
where
d1 =
ln(Fs(T)
K ) + 1
2
t
s σ2
udu
t
s σ2
udu
and d2 = d1 −
/ t
s
σ2
udu.Chapter 14
Numerical Methods for Option Pricing
Closed-form solutions (e.g. Black–Scholes formula) are accurate and fast to cal-
culate. However, only very few options have had the closed-form solutions found
under simple models such as the Black–Scholes–Merton. Therefore, numerical
methods in the following are necessary for option pricing.
• Numerical integration, which is an efficient method. However, it is only applica-
ble when the asset’s probability of transition is known.
• Tree methods, which assume two or more possible moves for asset price for
each small time step. A tree can be constructed for all possible asset prices until
maturity date of the considered option. The option price can be calculated from
the tree. Tree methods are easy to implement but are limited to options involving
less than two random variables in general.
• PDE methods, which make use of the link between SDE and PDE. Numerical
methods for PDEs are well studied in mathematics and physics. PDE methods
are efficient for options with no more than two underlying assets.
• Monte Carlo method, which is the simplest but the most universal method for
pricing all types of options (excluding American options which require special
treatment). It consists of simulating the random paths and then calculating the
averaged discounted payoff value as the option price.
In this chapter, we will focus on the methods of binomial tree, Monte Carlo, and
finite difference for PDE.
## 14.1 The Binomial Tree
Cox, Ross and Rubinstein pioneered the binomial tree method in 1979 [25]. In
this section, we introduce the binomial tree method for the Black–Scholes–Merton
model under risk-neutral probability, P:
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_14
161162 14 Numerical Methods for Option Pricing
dSt = rStdt + σStd , Wt.
In a binomial tree, we assume that, over a small time step δt, the asset price St
has only two possible moves: “up” by a proportion of u with risk-neutral probability
p, or “down” by a proportion of d with risk-neutral probability 1 − p. Intuitively, u
and d should be related to σ as we will verify later.
## 14.1.1 Tree Construction
We first construct an m-step binomial tree of possible asset prices by dividing [0,T]
into 0 = t0 < t1 < ··· < tm = T, tj = jδt, j = 0,1,...,m and δt = T/m.
Under Black–Scholes–Merton model, the binomial tree must satisfy the martingale
property (i.e. Stj = , E[e−rδtStj+1|Ftj ]) and the variance of Stj+1 − Stj .
Let Si
j denote the i-th asset price at time tj. At time t = 0 we know the asset
price S0. Then at the next time-step δt there are two possible asset prices, S1
1 = dS0
and S2
1 = uS0. At final time mδt, there will be m + 1 possible asset prices Si
m, i =
1,2,...,m + 1. The condition u = 1/d is often applied to maintain the symmetric
structure of the tree. See Fig.14.1.
Next we apply the payoff function for the option on Si
m, the last layer of the tree.
For instance, in case of a call or put option, we have,
Vi
m = max{Si
m − K,0} or Vi
m = max{K − Si
m,0}, i = 1,...,m + 1,
where K is the exercise price and Vi
m denotes the i-th possible value of the call/put
at the last time-step m. We then evaluate the option prices in between, Vi
j , j =
p
1− p
p
1− p
p
1− p
•
•
•
•
•
•
S0
0
V0
0
S2
1
V1
1
S1
1
V0
1
S3
2
V2
2
S2
2
V1
2
S1
2
V0
2
t t
Fig. 14.1 m-step binomial method14.1 The Binomial Tree 163
0,...,m − 1, backward one step at a time using the transition probabilities p and
1 − p. In particular, the time-0 price V0 is the option premium.
Under risk-neutral probability, discounted asset price is a martingale. As we
know the probability for the price move between two successive time steps (p for
moving up and 1 − p for moving down), we have, for a European option,
Vi
j = e−rδt
[pVi+1
j+1 + (1 − p)Vi
j+1], i = 1,...,j + 1.
Example 14.1 Let S0 = 20, u = 1.1, d = 0.9, r = 2% and p = 0.525. Consider
a European call option with K = 21 and T = 0.5 (6 months). We break [0,T] into
two time-steps with δt = 0.25 and construct a two-step binomial tree. See Fig.14.2.
Since we have the stock prices for the nodes D, E and F at the expiry date, we
can obtain the payoffs of the option at these nodes. Then, we compute the value of
the option at node B:
e−0.02×0.25
(0.525 × 3.2 + 0.475 × 0) = 1.6716.
Similarly, option values at nodes E and F give the option value at node C.
Now we repeat the computation once again, using the value of the options at
nodes B and C, we get the option price at node A:
e−0.02×0.25
(0.525 × 1.6716 + 0.475 × 0) = 0.8732.
0.525
0.475
0.525
0.475
0.525
0.475
•
•
•
•
•
•
20
0.8732
A
22
1.6716
B
18
0.0
C
24.2
3.2
D
19.8
0.0
E
16.2
0.0
F
3 months 3 months
Fig. 14.2 Two-step binomial method164 14 Numerical Methods for Option Pricing
## 14.1.2 Determination of the Parameters
Since the moves u and d are independent at each level, the martingale property
Stj = , E[e−rδtStj+1|Ftj ] can be written as S = , E[e−rδtSδt] where S is any tree node
and Sδt is its value after δt. Under the risk-neutral assumption, Serδt = , E[Sδt] =
pSu + (1 − p)Sd, or
erδt
= pu + (1 − p)d. (14.1)
From Corollary 11.1, we have 0 Var(Sδt) = S2e2rδt(eσ2δt − 1). Since 0 Var(Sδt) =
, E[S2
δt] − (, E[Sδt])2, and , E[S2
δt] = p(uS)2 + (1 − p)(dS)2, it follows that
S2
e2rδt
(eσ2δt
− 1) = pu2
S2
+ (1 − p)d2
S2
− S2
(pu + (1 − p)d)2
,
or
e2rδt+σ2δt
= pu2
+ (1 − p)d2
. (14.2)
Equations (14.1) and (14.2) impose two conditions on p, u and d. As discussed
previously, the third condition could be [25]
u =
1
d
. (14.3)
Solving (14.1), (14.2) and (14.3), we obtain
p =
erδt − d
u − d
, u = A +

A2 − 1, d = A −

A2 − 1,
where
A =
1
2

e−rδt
+ e(r+σ2)δt

.
In [25], the choice of the binomial tree of Cox, Ross and Rubinstein is
p =
erδt − d
u − d
, u = eσ
√
δt
, d =
1
u
.
NotethatthefirstthreetermsoftheTaylorexpansion ofu = A+
√
A2 − 1coincides
with those of u = eσ
√
δt, i.e., u = 1+σ
√
δt + 1
2σ2δt +O((
√
δt)3). We remark that
the choice is not unique. For instance, instead of applying u = 1
d, we may choose
p = 1
2, which leads to u = erδt(1 +

eσ2δt − 1) and d = erδt(1 −

eσ2δt − 1).14.2 Monte Carlo Method 165
It can be shown that with δt → 0, the result obtained from binomial tree
converges to that of Black–Scholes equation. Interested readers may refer to [45]
for more details of tree methods for option pricing.
The binomial method is memory efficient with only one underlying. The largest
memory requirement is at the last time-step m, where 2(m + 1) memory locations
are required for the stock and option prices. Memory in the (j +1)-th time-step can
be reused for the j-th time-step. Each node requires O(1) calculations and there are
O(m2) nodes, therefore the execution time grows quadratically as O(m2).
For d underlyings, the binomial method will require O(md) memory locations
and O(md+1) calculations. Thus, it is computationally heavy when d is large.
## 14.2 Monte Carlo Method
## 14.2.1 Monte Carlo Simulation for Option Pricing
Risk-neutral pricing suggests that the European option price can be calculated by
discounting the expected payoff,
V0 = , E[e−rT
VT ].
The Monte Carlo method relies on the Strong Law of Large Numbers, i.e., assum-
ing i.i.d. (independent and identically distributed) random variables X1,X2,..., and
E[|h(X)|] < +∞, then
lim
n→∞
1
n
n
i=1
h(Xi) = E[h(X)] a.s.
Hence, the expected value of the payoff of a European option can be estimated
as the arithmetic average of payoff values Vi
T , i = 1,2,...,n, i.e.
V0 = , E[e−rT
VT ] ≈ e−rT 1
n
n
i=1
Vi
T .
The implementation of Monte Carlo method consists of simulating the underly-
ing price paths under risk-neutral measure in order to get the option payoff values
Vi
T , i = 1,2,...,n. In the following sections, we will present a method for
generating sample paths for one-dimensional case followed by the simulation for
multi-dimensional problems. We refer to [37] for a comprehensive presentation of
Monte Carlo implementation for financial engineering.166 14 Numerical Methods for Option Pricing
## 14.2.2 Generating One-Dimensional Random Variates
We first introduce how to generate a random variate with cumulative distribution
function F.
Denote U [0,1] for the uniform distribution over [0,1]. By definition,
P{u < z} =
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
0, z < 0,
z, 0 ≤ z ≤ 1,
1, z > 1.
Consider a random variable X generated as follows:
1. generate u from U [0,1]
2. calculate X = F−1(u).
Then X follows the distribution of F:
P{X < x} = P{F−1
(u) < x} = P{u < F(x)} = F(x) (u follows U [0,1]).
Note that F−1(u) < x if and only if u < F(x) because F(x) is a strictly increasing
function of x. Consequently, the second equality in the above holds true because
the events for {F−1(u) < x} and {u < F(x)} coincide for all u and x. In the
following, we mainly use F = N for generating normally distributed  = N−1(u).
See Fig.14.3 for reference. The Monte Carlo simulation for Poisson process based
jump models will be presented in Chap.20.
Now, we consider the general Itô process below
Fig. 14.3 Graphical
illustration of normal inverse
transform with u ∈ U [0,1]
−3.5 −2.5 −1.5 −0.5 0.5 1.5 2.5 3.5
0
0.1
0.2
0.3
0
0.5
1
Normal
Distribution
Cumulative
Normal
Distribution
Function
u14.2 Monte Carlo Method 167
dSt = θ(t,St)dt + φ(t,St)dWt,
where the solution of ST , t < T is unknown for a direct simulation from St.
This is generally the case when the pricing model has non constant parameters.
A sample path with intermediary time points is then necessary and can be generated
as described below:
1. Discretize the time period [t,T] into m time intervals: t = t0 < t1 < t2 < ··· <
tm = T. The intervals depend on the option payoff and the model parameters. It
is not necessary to have equally spaced intervals.
2. Generate uj from U [0,1], j = 1,2,...,m
3. Calculate the normal variate j = N−1(uj)
4. Generate a Brownian increment δWj = j

δtj where δtj = tj − tj−1.
5. Calculate the sample path with Euler–Maruyama scheme, i.e.,
Stj = Stj−1 + θ(tj−1,Stj−1)δtj + φ(tj−1,Stj−1)δWj.
The Euler–Maruyama scheme1 is applicable to all different models.
For Black–Scholes–Merton model, there is no need to simulate with small
time steps with an Euler–Maruyama type of scheme. This is because the model
parameters are constant (i.e. volatility and interest rate) and that the future price ST
has a solution under risk-neutral measure
ST = Ste(r−σ2/2)(T−t)+σ
√
T−t
,
where St is the current asset price and  ∼ N (0,1). So, the simulation can be done
with one time step from t to T.
If we need to simulate some asset prices between t and T (e.g. for pricing
path dependant options), the above equation can be used between two consecutive
required dates. The i-th path from t to T is generated by:
Si
tj
= Si
tj−1
e(r−σ2/2)δtj+σi
j
√
δtj
, j = 1,...,m, i = 1,...,n, (14.4)
where i
j are independent random numbers distributed as N (0,1). The number
of paths n usually goes from 10,000 to 1,000,000, depending on the accuracy we
want. In Fig.14.4, we show n = 10 simulated stock price paths using (14.4), with
St = 100, r = 0.01, σ = 0.25, t = 0, T = 1, and equal time-step δtj = 0.01.
If we are only interested in evaluating European options, there is no need to know
what the stock prices are in between t and T. We only need to know the stock price
at T. We can modify (14.4) to get it directly:
1There exist other schemes, e.g. Milstein scheme which contains a second order term for increasing
the accuracy.168 14 Numerical Methods for Option Pricing
Fig. 14.4 Ten simulated
paths of stock prices under
Black–Scholes model
0.2 0.4 0.6 0.8 1
50
60
70
80
90
100
110
120
130
140
150
Time
Stock Price
Table 14.1 Monte Carlo method for European put with K = 10, S0 = 5, r = 0.01 and
σ = 0.25
T − t True n = 10 n = 102 n = 103 n = 104 n = 105
0.25 4.9750 4.4913 4.9211 5.0018 4.9727 4.9751
0.50 4.9501 4.8818 4.9796 4.9510 4.9597 4.9495
0.75 4.9256 5.1352 4.7105 4.9073 4.9094 4.9284
1.00 4.9022 4.4807 4.8380 4.9072 4.8957 4.9015
Si
T = Si
t e(r−σ2/2)(T−t)+σi
√
T−t
, i = 1,...,n,
i.e. for each i sampled, we can generate one sample of Si
T . From each of them, a
payoff for the option can be calculated at expiry. For example, if it is a European
call option, we can compute Vi
T = max{Si
T − K,0}, i = 1,...,n. Then, the option
price is approximated by e−r(T−t) 1
n
n
i=1 Vi
T .
Example 14.2 Consider a European put with K = 10, S0 = 5, r = 0.01 and
σ = 0.25. Table 14.1 shows the comparison of the Monte Carlo method and the
true solution of the Black–Scholes equation for different expiry time and numbers
of paths. We see that the results are more accurate when we increase the number of
paths n.
Consider the n simulations Vi
T , i = 1,...,n and denote their sample mean by
μ̄ and standard deviation by σ̄. The Central Limit Theorem states that the option
price V should be distributed as N (μ̄, σ̄2
n ). Hence a 95% confidence interval for V
is given by
μ̄ −
1.96σ̄
√
n
< V < μ̄ +
1.96σ̄
√
n
.14.2 Monte Carlo Method 169
See Sect.9.3.7. This shows that the uncertainty about the option value is inversely
proportional to
√
n. To halve the confidence interval, we must quadruple the number
of simulations; and to increase the accuracy by a factor of 10, the number of
simulations must be increased by roughly a factor of 100.
To enhance Monte Carlo method’s convergence rate of O( 1 √
n
), we can turn to
useful variance reduction techniques like doubling the simulation trials with the
negation of normal variates [37]. We also highlight that the quasi-Monte Carlo with
Sobol sequences2 is widely used in practice as a general method.
Monte Carlo simulation tends to be numerically more efficient than other
procedures when there are three or more underlying assets. This is because the
time taken to carry out a Monte Carlo simulation increases approximately linearly
with the number of unknown variables. In contrast, the time taken for most other
procedures increases exponentially with the number of unknown variables.
Monte Carlo simulation has the following advantages:
• numerically efficient for high-dimensional case because the complexity increases
linearly with the number of underlyings
• provides standard error for the estimates
• can accommodate complex payoffs and complex stochastic processes.
For pricing American options, special techniques need to be employed because
all the intermediate stock prices in all the paths are involved for estimating the
continuation price and deciding to hold or not. We will return to American options
in the next chapter.
## 14.2.3 Generating Multivariate Randoms
Formulti-assetproductsormulti-factormodelswhichrequiresimulationofmultiple
assets, we also need to take the correlation among assets into consideration. For
example, it may involve generating correlated Brownian motions, or essentially a
normally distributed vector X ∼ N (μ,Σ) with mean vector μ and covariance
matrix Σ which is symmetric and positive semidefinite:
Σ =
⎡
⎢
⎢
⎢
⎣
σ11 σ12 ··· σ1n
σ21 σ22 ··· σ2n
. . .
. . .
...
. . .
σn1 σn2 ··· σnn
⎤
⎥
⎥
⎥
⎦
2Quasi-Monte Carlo method uses deterministic but more evenly dispersed sequence of
numbers instead of randomly generated numbers. Illustratively, a controlled sequence like
{1,2,3,4,5,6,1,2,3,4,5,6,...} may converge faster than {1,6,2,4,3,6,3,5,1,...} for esti-
mating the expectation of casting a die, which is 3.5.170 14 Numerical Methods for Option Pricing
where σij = ρijσiσj for i = j and σii = σ2
i . The correlation matrix for X is
C ≡
⎡
⎢
⎢
⎢
⎣
1 ρ12 ··· ρ1n
ρ21 1 ··· ρ2n
. . .
. . .
...
. . .
ρn1 ρn2 ··· 1
⎤
⎥
⎥
⎥
⎦
and Σ = DCD where D = diag(σ1,σ2,...,σn) is an n × n diagonal matrix.
We have the following result for generating a normal vector from a standard
normal vector.
Proposition 14.1 The normally distributed X ∼ N (μ,Σ) can be generated
through either one of the below methods
(i) X = μ + A
(ii) X = μ + DL
where  ∼ N (0,I) is an n × 1 vector, 0 is an n × 1 vector of all zeros, and I is
an n × n identity matrix, i.e., entries of  are independent standard normals. The
matrices A and L are n × n matrices that decompose, respectively, the covariance
matrix Σ = AA and correlation matrix C = LL.
Proof By the Linear Transformation Property of Multivariate Normal Vector (see
Proposition A.3 in Appendix),
A ∼ N (A0,AIA
) ∼ N (0,Σ).
Therefore X = μ + A ∼ N (μ,Σ).
Similarly, we have
DL ∼ N (DL0,DLIL
D
) ∼ N (0,Σ).
and X = μ + DL ∼ N (μ,Σ). 
Suppose there exists an estimate for the covariance matrix Σ or the correlation
matrix C. The following two methods find the decomposition.
Cholesky Factorization
The Cholesky factorization decomposes Σ or C into the product of a lower triangu-
lar matrix and its transpose. Consider the positive definite covariance matrix Σ,14.2 Monte Carlo Method 171
Σ = AA
=
⎡
⎢
⎢
⎢
⎢
⎣
a11 0 ··· 0
a21 a22
...
. . .
. . .
. . .
... 0
an1 an2 ··· ann
⎤
⎥
⎥
⎥
⎥
⎦
⎡
⎢
⎢
⎢
⎣
a11 a21 ··· an1
0 a22 ··· an2
. . .
...
...
. . .
0 ··· 0 ann
⎤
⎥
⎥
⎥
⎦
.
Given the entries σij of Σ, we can solve A recursively through the following system
of equations:
⎧
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
a2
11 = 1,
a11a21 = σ12,
. . .
an1a11 = σ1n,
a2
21 + a2
22 = 1,
. . .
a2
n1 + a2
n2 + ··· + a2
nn = 1.
Example 14.3 The Cholesky decomposition of a two-dimensional correlation
matrix C is
C =
1 ρ
ρ 1
!
=
1 0
ρ

1 − ρ2
!
1 ρ
0

1 − ρ2
!
= LL
.
To generate two dependent normal variates such that
X1
X2
!
∼ N

μ1
μ2
!
,
σ2
1 ρσ1σ2
ρσ1σ2 σ2
2
!
,
we can carry out3
X1
X2
!
=
μ1
μ2
!
+
σ1 0
0 σ2
!
1 0
ρ

1 − ρ2
!
1
2
!
where 1 and 2 are independent standard normal variates. Readers can compare this
example to the correlated Brownian motions in Chap.10 by setting μ1 = μ2 = 0
and σ1 = σ2 = 1.
3Note that it is not necessary to implement the calculations in matrix form.172 14 Numerical Methods for Option Pricing
Eigenvector Factorization
The Cholesky decomposition is not the only way to have Σ = AA. According to
Spectral Theorem in linear algebra, a symmetric and real valued matrix such as Σ
can be diagonalized as
Σ = UΛU
,
where Λ is a diagonal matrix with eigenvalues λ1,λ2,...,λn, and U is an
orthogonal matrix (UU = I). Setting
A = UΛ1/2
= U
⎡
⎢
⎢
⎢
⎣
√
λ1
√
λ2
...
√
λn
⎤
⎥
⎥
⎥
⎦
,
we have AA = UΛ1/2
Λ1/2
U = UΛU = Σ.
Oneofthevariancereductiontechniques(principalcomponentsmethod)isbased
on the eigenvector factorization.
14.3 PDE Method with Finite Difference Approximation
Besides the Black–Scholes equation, in practice, there are other PDEs derived from
other models that govern option prices. However, not many of them have closed-
form solutions like Black–Scholes formula for call/put options. In this section, we
discuss how to solve PDEs by finite difference approach generally. Finite difference
approaches consist of approximating the differential operators in the differential
equation by difference operators.
Given a function u(x), using Taylor’s expansion, we have
u(x + δx) = u(x) + δx · u
(x) +
δx2
2
u
(x) +
δx3
6
u
(x) + O(δx4
)
u(x − δx) = u(x) − δx · u
(x) +
δx2
2
u
(x) −
δx3
6
u
(x) + O(δx4
). (14.5)
If δx is small, we can approximate u(x) at x by the first order central difference
u
(x) =
u(x + δx) − u(x − δx)
2δx
+ O(δx2
), (14.6)
which is of second order accuracy. From (14.5), we can also approximate the second
order derivative u(x) at x by the second order central difference:14.3 PDE Method with Finite Difference Approximation 173
u
(x) =
u(x + δx) − 2u(x) + u(x − δx)
(δx)2
+ O(δx2
). (14.7)
The forward difference refers to
u
(x) =
u(x + δx) − u(x)
δx
+ O(δx). (14.8)
It is usually used for the differential w.r.t. time in problems of physics.
Suppose we are to solve the Black–Scholes equation. In this case, as it is a log-
normal model, it is more efficient to work with the case after the variable change
x = lnS:
∂V(x,t)
∂t
+
1
2
σ2 ∂2V(x,t)
∂x2
+

r −
σ2
2

∂V(x,t)
∂x
− rV(x,t) = 0, (14.9)
with European-type payoff V(x,T) for −∞ < x < ∞. Since it is impossible to
work with infinity numerically, we first truncate the spatial domain as x ∈ [L1,L2].
Then we replace the boundary conditions V(−∞,t) by V(L1,t) and V(∞,t) by
V(L2,t).
Next we partition the solution domain [L1,L2] × [0,T] by grid lines: [L1,L2]
into n equal sub-intervals, each of length δx and [0,T] into m equal sub-intervals,
each of length δt, see Fig.14.5. Denote xi = L1 + iδx and tj = jδt for 0 ≤ i ≤ n
and 0 ≤ j ≤ m.
Let Vi(t) denote the approximate values to V(xi,t) for i = 1,2,...,n − 1.
The boundary conditions can usually be approximated, e.g. for a European call
option V(x0,t) = V(L1,t) ≈ 0 and V(xn,t) = V(L2,t) ≈ eL2 − Ke−r(T−t).
Fig. 14.5 Solution domain of
European options and the grid
t
x
L1
− L1 + x
− L1 +2 x
− L1 +i x
− L2
t 2 t j t T
•
•
•
• • •
• • •
• • •
V(L2 t)
V (x T )
V(xi tj)
V(L1 t)
,
,
,
,174 14 Numerical Methods for Option Pricing
Let V(t) = [V1(t),...,Vn−1(t)]. Applying the second-order accurate finite
difference schemes (14.6) and (14.7) for
∂V(x,t)
∂x
and
∂2V(x,t)
∂x2
in (14.9) gives
∂Vi(t)
∂t
+
1
2
σ2 Vi+1(t) − 2Vi(t) + Vi−1(t)
δx2
+

r −
σ2
2

Vi+1(t) − Vi−1(t)
2δx
− rVi
(t) = 0
which can be written as a system of equations
⎡
⎢
⎢
⎢
⎢
⎢
⎣
∂tV1(t)
∂tV2(t)
. . .
∂tVn−2(t)
∂tVn−1(t)
⎤
⎥
⎥
⎥
⎥
⎥
⎦
=
⎡
⎢
⎢
⎢
⎢
⎢
⎣
b c
a b c
...
...
...
a b c
a b
⎤
⎥
⎥
⎥
⎥
⎥
⎦
⎡
⎢
⎢
⎢
⎢
⎢
⎣
V1(t)
V2(t)
. . .
Vn−2(t)
Vn−1(t)
⎤
⎥
⎥
⎥
⎥
⎥
⎦
+
⎡
⎢
⎢
⎢
⎢
⎢
⎣
aV(x0,t)
0
. . .
0
cV(xn,t)
⎤
⎥
⎥
⎥
⎥
⎥
⎦
,
or
∂V(t)
∂t
= DV(t) + f(t), (14.10)
where a =
r − σ2/2
2δx
−
σ2
2(δx)2
, b = r +
σ2
(δx)2
, c = −
r − σ2/2
2δx
−
σ2
2(δx)2
, and
f(t) is a known vector at time t owing to boundary conditions. The matrix D has
constant diagonals and it is known as a Toeplitz matrix. Its special structure enjoys
a number of fast numerical algorithms [17, 18].
The following illustration will assume f(t) = 0 and the non-zero case is
straightforward for temporal discretization. Actually, we have f(t) = 0 if we apply
the zero gamma boundary condition, which is a general boundary condition for all
options with natural smoothness (∂xxV = 0). It applies to both upper and lower
bounds, i.e., V(x0,t) = 2V1(t) − V2(t) and V(xn,t) = 2Vn−1(t) − Vn−2(t).
Let Vj be the approximate value for the option value V(tj). Applying forward
difference (14.8) for ∂V(t)
∂t in (14.10) with different treatment on the RHS results in
Explicit scheme:
Vj − Vj−1
δt
= DVj
Implicit scheme:
Vj − Vj−1
δt
= DVj−114.3 PDE Method with Finite Difference Approximation 175
Crank–Nicolson scheme:
Vj − Vj−1
δt
=
1
2
(DVj + DVj−1).
## 14.3.1 Explicit Scheme
The explicit scheme is equivalent to, for j = 0,1,...,m,
Vj−1 = (I − δtD)Vj,
whereIisanidentitymatrixofsizen−1.SinceVm = [V(x1,tm),...,V(xn−1,tm)]
are known values at maturity, a time-marching operation is performed to obtain
Vm−1, Vm−2, and after m times, V0 at time 0.
The accuracy of explicit scheme is O(δt) and O(δx2). One can show that
α ≡ δt/(δx)2 has to be less than a certain constant α0 for convergence. For some
problems, the condition α < α0 will lead to a small δt (hence a large m) and the
method may be too slow to find the solution.
Example 14.4 Consider pricing a European call option by explicit scheme with
K = 1, T = 0.25, r = 0.02, σ = 0.25, L1 = −0.4, L2 = 0.3. We fix n = 70 and
test m = 154 or m = 200, corresponding to α = 16.23 or α = 12.5 respectively.
The finite difference solutions with the two settings are plotted against underlying
performance S = ex in Fig.14.6. We see that the method diverges with α = 16.23
and the solution becomes oscillatory.
Fig. 14.6 Option price
(close-up around strike)
obtained from explicit
scheme with α = 12.5 (solid
line); oscillatory when
α = 16.23 (dashed line)
90% 95% 100% 105% 110%
5%
10%
15%
Underlying Performance
Option Price176 14 Numerical Methods for Option Pricing
## 14.3.2 Implicit Scheme
The implicit scheme is equivalent to, for j = 0,1,...,m,
(I + δtD)Vj−1 = Vj.
The time-marching process starts from the known Vm and a tridiagonal linear
system needs to be solved at each time step, which requires computational cost
of O(n) by Thomas algorithm in numerical linear algebra.
The accuracy of implicit scheme is O(δt) and O(δx2). Compared to the explicit
method before, the implicit method is more robust. It does not suffer from the choice
of δt and δx, which is called unconditional stability in numerical PDE approaches.
## 14.3.3 Crank-Nicolson Scheme
The Crank–Nicolson scheme [28] is the balance between the explicit and implicit
schemes. It is equivalent to

I +
δt
2
D

Vj−1 =

I −
δt
2
D

Vj,
and a tridiagonal system is solved at each time-step during time-marching. The
scheme is second order accurate in both space and time and also unconditionally
stable.
However, the Crank–Nicolson scheme is known to suffer from the non-
smoothness of payoff function, and a technique called Rannacher time stepping
[67] is usually used for the initial time-steps.
## 14.3.4 Alternating Direction Implicit (ADI) Method
For options with two underlyings, the PDE is in 2-D and the ADI method is
commonly used. Here we illustrate the situation without cross derivative term
(correlations between underlying assets). Readers are referred to [27] for the general
case. A half-timestep is incorporated as
⎧
⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎩
Vj+1
2
− Vj
δt/2
= (D1Vj+1
2
+ D2Vj)
Vj+1 − Vj+1
2
δt/2
= (D1Vj+1
2
+ D2Vj+1).14.3 PDE Method with Finite Difference Approximation 177
Here D1 and D2 are the matrices resulting from finite difference schemes for Asset
1 and Asset 2 respectively. Spatial directions are alternately handled at each half-
timestep.
The finite difference method is extremely efficient for options with only one
underlying asset: its computational cost is of O(nm). However, it also has the curse
of dimensionality in that the cost grows like O(mnd) for an option whose price
depends on d assets.
Exercises
1. Suppose the assumption p = 0.5 is used in the binomial model.
(i) Prove that in a risk-neutral world,
u = erδt

1 +

eσ2δt − 1

and d = erδt

1 −

eσ2δt − 1

.
(ii) Find the upper bound for δt such that the binomial model with p = 0.5 is
feasible.
(iii) Show that ud → 1 as δt → 0.
2. Under BSM model for a non-dividend-paying stock, let S0 = 1, r = 0.01, σ =
0.2. Calculate the price of a 1-year ATM call option with the below methods and
compare the results:
(i) Black–Scholes formula
(ii) Monte Carlo based on the direct integration:
ST = S0e(r−σ2
2 )T+σ , WT
(iii) Euler–Maruyama scheme (step size δt = 0.005):
Sti = Sti−1 + rSti−1δt + σSti−1
, Wδt.
3. Consider pricing a European call option using finite difference method with
explicit scheme. The parameters are K = 1, T = 0.25, r = 0.02, σ = 0.25,
L1 = −0.5, L2 = 0.5, and number of time-steps m = 5000. The zero
gammaboundaryconditionsareapplied.Letc1 andc2 denotethefinitedifference
solutions at x = 0 (S = 1) using n = 50 and n = 100 respectively. Compare the
error of c1 and c2 respectively against the Black–Scholes formula at x = 0. How
fast is the error reducing? Explain this phenomenon.Chapter 15
American Options
Inthischapter,theAmericanoptionmodellingisintroducedinasimplewaythrough
Bermudan option which has discrete exercise times. Then, the major applicable
numerical methods are presented for Black–Scholes–Merton model. The general
Partial Differential Inequality is derived and the boundary conditions for American
Put option are analyzed as an illustration example for the methodology.
## 15.1 Stopping Time
A stopping time τ is a random variable taking values in [0,∞] and satisfying {τ ≤
t} ≡ {ω ∈ Ω; τ(ω) ≤ t} ∈ Ft for all t ≥ 0.
Theorem 15.1 (Optional Sampling) A martingale (supermartingale, submartin-
gale) Xt stopped at a stopping time, i.e., Xmin{t,τ} is a martingale (supermartingale,
submartingale).
## 15.2 Backward Pricing
An American option gives the option holder the right to early terminate the option
before its maturity. Upon the option exercise, the option holder will be paid the
intrinsic value or other predefined payout. The early termination time is a stopping
time.
An American option with discrete exercise dates is called Bermudan option. For
illustrating the general results on American options, we consider only Bermudan
options under a complete market. Let {t1,t2,...,tn} be the exercise dates with tn as
the expiry of the option. Denote
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_15
179180 15 American Options
Hti : for the exercise payoff at ti (Htn for the final payoff if no early exercise
happened, for example: Htn = (K − Stn)+ for put)
Vti : for the option value at time ti, 0 ≤ ti ≤ tn, if the option is not exercised before
ti
Mti : for the money market numéraire from 0 to ti.
At maturity tn, we have Vtn = Htn. At the preceding exercise date tn−1, there can
be two cases:
(i) if the option is exercised at tn−1, the option value is Htn−1 (the payout);
(ii) if the option is not exercised at tn−1, the option value Vtn−1 will become Vtn
at time tn. Because there is no exercise date between tn−1 and tn, Vt
Mt
(tn−1 ≤
t ≤ tn) should be a martingale under complete market with the risk-neutral
probability, P and there is a self-financing strategy, following which, the amount
of Mtn−1
, E[
Vtn
Mtn
|Ftn−1] at time tn−1, will become Vtn at time tn. A rational option
holder will make his exercise decision for getting the maximum value:
Vtn−1 = max

Htn−1,Mtn−1
, E
Vtn
Mtn
|Ftn−1
!
.
Denoting the discount processes & Vt = Vt
Mt
, & Ht = Ht
Mt
, we get
& Vtn−1 = max{& Htn−1,, E[& Vtn|Ftn−1]}.
Doing similar analysis recursively backward, we obtain the general result for all
0 ≤ i < n:
& Vti = max{& Hti ,, E[& Vti+1|Fti ]},
and Vti is then the option price at time ti. For a given exercise date ti, we call
• Mti
, E
Vti+1
Mti+1
|Fti
!
the continuation value, and
• Hti the exercise value.
The problem cannot be solved explicitly as there exists no closed-form solution.
One has to use numerical schemes, such as numerical PDE methods or the binomial
tree method in Chap.14, to find the solution.
## 15.3 Methods for Pricing American Options
Sofar,noclosed-formsolutionisknownforAmericanoptionsunderBSMmodel.In
general, backward pricing methods like tree or PDE approach are used for American
options involving one or two dimensions. The standard Monte Carlo method is15.3 Methods for Pricing American Options 181
a forward pricing method starting from time-0. It is not applicable for American
option pricing because of the early termination decision which depends on the
continuation value that is not available. However, special Monte Carlo methods have
beenproposedandusedforAmericanoptionswhichwillbepresentedinthelastpart
of this chapter.
In the following sections, we assume BSM model for presenting the methodolo-
gies that can be extended to other models.
## 15.3.1 Binomial Tree
The tree is constructed in the same way as the European option but the option
calculation is different. With the backward induction, we calculate, at each node:
• the continuation value: the option value
• the exercise value: the payout of the option with early exercise
• the (conditional) option price at the node will be
max{Exercise Value, Continuation Value}.
Consider the situation at time-step j and at asset price Si
j+1. The option can be
exercised prior to expiry to yield a profit determined by the payoff function, e.g.,
call and put respectively
Hi
j = max{Si
j − K,0} or Hi
j = max{K − Si
j,0}, i = 1,...,j + 1.
If the option is retained, its value is, as in the European case,
e−rδt

pVi+1
j+1 + (1 − p)Vi
j+1

, i = 1,...,j + 1.
The value of the American option is the maximum of two choices: the choice of
exercising the option and the choice of keeping the option, i.e.
Vi
j = max
-
Hi
j,e−rδt
(pVi+1
j+1 + (1 − p)Vi
j+1)
.
, i = 1,...,j + 1.
Example 15.1 Let us compute an American put by a 2-step binomial method. We
will use the same data as given in Chap.14, i.e. S0 = 20, K = 21, T = 0.5,
r = 0.02, δt = 0.25, and u = 1.1 and d = 0.9 which gives p = 0.525.
The binomial tree is given in Fig.15.1. The option prices at the expiry nodes D,
E, and F are clear. Next consider node B. If we exercise, we get 0. If we do not
exercise, then the option price is the same as the European one:
e−0.02×0.25
(0.525 × 0 + 0.475 × 1.2) = 0.5672.182 15 American Options
Clearly, in this case, we do not exercise, and the option price is 0.5672. We illustrate
this in Fig.15.1 by underlining the maximum of the two values: 0 and 0.5672.
It is similar for node C. If we exercise, we get 3. If we do not exercise, then the
option price is the same as the European one:
e−0.02×0.25
(0.525 × 1.2 + 0.475 × 4.8) = 2.8955.
Clearly, in this case, we exercise, and the option price is 3. We illustrate this in
Fig.15.1 by underlining the maximum of the two values: 3 and 2.8955. Finally at
t = 0, the option price is given by
e−0.02×0.25
(0.525 × 0.5672 + 0.475 × 3) = 1.7142.
## 15.3.2 Partial Differential Inequality
The pricing of American options can be transformed into a partial differential
inequality problem for which numerical methods are available. We first study the
properties of American option price process and then derive the partial differential
inequality.
Properties of American Option Price Process
Consider a finite time horizon [t0,tn] and discrete stopping times taking values in
{t0,t1,...,tn}. Let ht be an Ft-adapted process. Define a process vt, starting from
vt0, as follows:
3 months
0.525
0.475
0.525
0.475
0.525
0.475
•
•
•
•
•
•
20
1.7142
A
22
{0,0.5672}
B
18
{3,2.8955}
C
24.2
0
D
19.8
1.2
E
16.2
4.8
F
3 months
Fig. 15.1 Two-step binomial method for an American option15.3 Methods for Pricing American Options 183
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
vtn = htn,
vti = max{hti ,E[vti+1|Fti ]}, ∀0 ≤ i < n,
vt = E[vti |Ft], ∀ti−1 ≤ t < ti, 1 ≤ i < n.
Proposition 15.1 The process vt is a supermartingale, i.e., E[vt|Fs] ≤ vs, ∀t0 ≤
s < t ≤ tn.
Proof First, we show that E[vti |Ft] ≥ E[vtm|Ft], ∀t ≤ ti ≤ tm. From definition,
we get
vti = max{hti ,E[vti+1|Fti ]} ≥ E[vti+1|Fti ].
Taking conditional expectation on both sides with Ft, we get
E[vti |Ft] ≥ E[E[vti+1|Fti ]|Ft] = E[vti+1|Ft].
By iteration, we prove that E[vti |Ft] ≥ E[vtm|Ft].
Now, ∀t0 ≤ s < t ≤ tn, we find j,k such that tj−1 ≤ s ≤ tj and tk−1 ≤ t ≤ tk.
We have
E[vt|Fs] = E[E[vtk |Ft]|Fs] = E[vtk |Fs] ≤ E[vtj |Fs] = vs. 
Proposition 15.2 Let 0 ≤ t ≤ tn and τ be a stopping time defined as
τ = min{ti ∈ {t1,t2,...,tn}|vti = hti }.
The stopped process vt∧τ is a martingale.
Proof We observe that for ∀0 ≤ i < j such that tj ≤ τ,
vti = max{hti ,E[vti+1|Fti ]} becomes vti = E[vti+1|Fti ],
or otherwise if vti = hti then τ = ti is a contradiction. Hence,
vti = E[vti+1|Fti ] = E[E[vti+2|Fti+1]|Fti ] = E[vti+2|Fti ], if i + 2 ≤ j.
Continuing the above analysis until tj, we obtain vti = E[vtj |Fti ].
Now, ∀t0 ≤ s < t ≤ τ, we find j,k such that tj−1 ≤ s ≤ tj and tk−1 ≤ t ≤ tk ≤
τ,
E[vt|Fs] = E[E[vtk |Ft]|Fs] = E[vtk |Fs] = E[E[vtk |Ftj ]|Fs] = E[vtj |Fs] = vs.

Proposition 15.3 Let Tt1,tn = {t1,t2,...,tn}. Then,184 15 American Options
vt = max
τ∈Tt1,tn
E[hτ|Ft], t ≤ t1.
Proof Let τ be the first time that vτ = hτ as defined in Proposition 15.2. According
to Proposition 15.1, vt is a supermartingale. The stopped process vt∧τ is also a
supermartingale by Optional Sampling Theorem. And
vt ≥ E[vtn∧τ|Ft] = E[vτ|Ft] = E[hτ|Ft], ∀τ ∈ {t1,t2,...,tn}.
But from Proposition 15.2, the stopped process vt∧τ is martingale,
vt = E[vtn∧τ|Ft] = E[vτ|Ft] = E[hτ|Ft].
Hence, necessarily,
vt = max
τ∈Tt1,tn
E[hτ|Ft]. 
Comparing the definitions of vt and & Vt in Sect.15.2, we can see that vt is
applicable for pricing Bermudan options by setting vt = & Vt, ht = & Ht and E as , E.
It can be shown that, for an American option with continuous time exercise, the
discounted price of the option is
& Vt = max
τ∈Tt,T
E[& Hτ|Ft],
where Tt,T is the set of stopping times taking values in [t,T]. The process & Vt is a
supermartingale and the stopped process & Vt∧τ is a martingale. For a deep analysis
on American options, we refer to [47].
Partial Differential Inequality
Because of the early exercise feature, the Black–Scholes PDE does not apply in
general forAmerican options under BSM model. However, the price ofan American
option satisfies a system of inequality as described in the below with a heuristic
explanation.
From Itô–Doeblin formula, the price of the option with exercise payoff of Ht =
H(t,St)1 gives & Vt = & V(t,St) = max
τ∈Tt,T
E[& Hτ|Ft] which satisfies
1For American call or put options, Ht = H(t,St); for path dependent options, Ht = H(t,St,Yt)
where Yt is an additional state variable.15.3 Methods for Pricing American Options 185
VT
MT
=
V0
M0
+
 T
0
1
Mt
∂V
∂t
+ rSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
− rV
!
dt
+
 T
0
1
Mt
∂V
∂S
σStd , Wt.
As Vt
Mt
is a supermartingale, the term before dt should be ≤ 0. We obtain the
partial differential system for American options:
⎧
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
∂V
∂t
+ rSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
− rV ≤ 0,
V ≥ H,

∂V
∂t
+ rSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
− rV

(V − H) = 0,
VT = HT .
The third equation, called linear complementarity problem, implies that
∂V
∂t
+ rSt
∂V
∂S
+
1
2
σ2
S2
t
∂2V
∂S2
− rV = 0
in the continuation region Vt > Ht with strict inequality.
Free Boundary Condition for American Put Option
The boundary condition for an American option needs to be analyzed according
to the type of option. In this part, we take the vanilla American put option Pt(St)
with continuous exercise as an example to illustratethe boundary condition analysis.
We assume that the interest rate r > 0. See Fig.15.2 for the comparison between
European and American puts.
St
Payoff
0
K A
Pt(St)
St
Payoff
0
K
pt(St)
Fig. 15.2 Payoff functions of American put (left) and European put (right) at time t < T. Note
that Pt(St) ≥ max{K − St,0} and it is not optimal to exercise for St > A186 15 American Options
With European options, we know the boundary conditions on the rectangular
domain {(S,t) : 0 ≤ S < ∞,0 ≤ t ≤ T}, see Fig.15.3 (left).
With American options, we do not know the a priori exercise boundary S
f
t which
is in fact part of the solution that we need to solve together with Pt(St), see Fig.15.3
(right). For every given t, any put option must be exercised if St = 0. This is because
the immediate exercise will allow the option holder to earn the accrued er(T−t)(K −
0) at time T instead of (K − 0) which is the payoff at maturity. Hence, we can
assume that there exists 0 ≤ S
f
t < +∞ such that S
f
t is the optimal exercise point
for the American put option at time t, i.e., from the previous analysis, that first time
τ such that Vτ = Hτ is the optimal exercise point. So, if the American put option
has time value at inception, S
f
t should be the highest among all St that the option
should be exercised and
Pt(S
f
t ) = K − S
f
t > 0, for all 0 ≤ t ≤ T. (15.1)
All the S
f
t ,0 ≤ t ≤ T constitute a boundary condition. As S
f
t is not known a
priori and it is part of the whole problem to solve, we call S
f
t a free boundary and
the whole problem a free boundary problem.
Let us now consider the properties of Pt(St) in the two separate regions: exercise
region (St ≤ S
f
t ) and continuation region (St > S
f
t ).
For the continuation region (St > S
f
t ), as there is no exercising, it is equivalent
to the European option problem. Hence, the Black–Scholes equation holds:
P > K − St,
∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP = 0.
The boundary conditions are the same as for the European option:
t
S
0
Smax
Boundary Condition T
Boundary Condition
Final Condition
Solution Domain
t
S
0
Smax
Boundary Condition T
Boundary Condition
Final Condition
− K
Solution Domain
Option Exercised
Sf
t
Fig. 15.3 Solution domains of European options (left) and American put options (right). Here
Smax is a truncation point approximating ∞ in spatial direction for computational feasibility15.3 Methods for Pricing American Options 187
PT (ST )=max{K−ST ,0}, for all 0≤ST <∞, lim
St→∞
Pt(St) = 0, for all 0≤t ≤T.
For the exercise region (St ≤ S
f
t ),
P = K − St,
∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP < 0.
We need an extra condition on the unknown boundary S
f
t . It is given by the
following proposition and is called the high contact or tangential condition.
Proposition 15.4 On the boundary S
f
t of the exercise region, we have
∂Pt(St)
∂St




St=S
f
t
= −1, for all 0 ≤ t < T. (15.2)
Proof If we denote the solution of the Black–Scholes PDE with a given boundary
bt by PBS
t (St;bt), then we should have
Pt(St) = max
bt
PBS
t (St;bt).
The optimal point is bt = S
f
t ,
Pt(St) = PBS
t (St;S
f
t ) for all 0 ≤ t ≤ T,S
f
t ≤ St < ∞. (15.3)
The first order condition implies
∂PBS
t (St;bt)
∂bt




bt=S
f
t
= 0, for all 0 ≤ t ≤ T,S
f
t ≤ St < ∞. (15.4)
Since bt is the exercise boundary for the option PBS
t (St;bt), by definition we have
PBS
t (bt;bt) = K − bt, for all bt.
Hence
∂PBS
t (bt;bt)
∂bt
= −1, for all bt.
However, by the chain rule for multivariate functions, we also have for all bt,
−1 =
∂PBS
t (bt;bt)
∂bt
=

∂PBS
t (St;bt)
∂St
∂St
∂bt
+
∂PBS
t (St;bt)
∂bt




St=bt188 15 American Options
=
∂PBS
t (St;bt)
∂St




St=bt
+
∂PBS
t (St;bt)
∂bt




St=bt
. (15.5)
Note that (15.5) is true for all bt, in particular bt = S
f
t . Then using (15.4), we
obtain
∂PBS
t (St;bt)
∂bt




St=bt,bt=S
f
t
= 0.
Using (15.3),
∂PBS
t (St;bt)
∂St




St=bt,bt=S
f
t
=
∂Pt(St)
∂St




St=S
f
t
,
and hence we have (15.2). 
Notethatthecondition(15.2)isnotobtaineddirectlybydifferentiatingPt(S
f
t ) =
K − S
f
t > 0 w.r.t S
f
t . Since S
f
t is itself an unknown variable, if we directly
differentiate (15.1), the term ∂St/∂S
f
t will be unaccounted for. By Proposition 15.4,
we also have
Corollary 15.1 Across the exercise boundary S
f
t ,
Pt(St) and
∂Pt(St)
∂St
are continuous.
Proof In the exercise region, Pt(St) ≡ K − St. Therefore
lim
St→(S
f
t )−
Pt(St) = K − S
f
t and lim
St→(S
f
t )−
∂Pt(St)
∂St
= −1,
see Fig.15.2 (left). But comparing with Pt(S
f
t ) = K − S
f
t > 0 and (15.2), these
values are exactly the same as the corresponding values in continuation region. 
In summary, the American put problem is written as a free boundary problem.
Theorem 15.2 For each time t, the stock price axis is divided into two distinct
regions. The first, 0 ≤ St ≤ S
f
t , is where early exercise is optimal and
P = K − St,
∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP < 0.
In the other region, S
f
t < St < ∞, early exercise is not optimal and15.3 Methods for Pricing American Options 189
P > K − St,
∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP = 0.
The boundary conditions are
Pt(S
f
t ) = max{K − S
f
t ,0},
∂Pt(St)
∂St




St=S
f
t
= −1, and lim
St→∞
Pt(St) = 0,
for all 0 ≤ t ≤ T, whereas the final condition at expiry is given by
PT (ST ) = max{K − ST ,0}, for all 0 ≤ ST < ∞.
Actually, we can combine the equations and the inequalities in the two regions
0 ≤ St ≤ S
f
t and S
f
t < St < ∞ into one equality, where the free boundary S
f
t is
eliminated. For all 0 ≤ St < ∞ and 0 ≤ t ≤ T, we have
(K − St − P)

∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP

= 0,
with
K − St − P ≤ 0 and

∂P
∂t
+
1
2
σ2
S2
t
∂2P
∂S2
t
+ rSt
∂P
∂St
− rP

≤ 0.
The above formulation is said to be in the linear complementarity form. Since the
free boundary S
f
t does not appear explicitly, it will not interfere with the solution
process, and it can be recovered from the solution after it has been found. When
solving the linear complementarity form, we are solving the problem in the whole
domain 0 ≤ St < ∞, 0 ≤ t ≤ T which include the free boundary S
f
t .
Similarly,wecan derive thefree boundary problem for American calloption with
the high contact condition
∂Ct(St)
∂St




St=S
f
t
= 1.
It is almost impossible to find a useful explicit solution to any given free
boundary problem, and so, efficient and robust numerical methods are needed for
the computation.
## 15.3.3 Least-Square American Monte Carlo Method
For multi-dimensional problems, it is necessary to price with Monte Carlo. The
usual Monte Carlo method for European options is no more applicable because,190 15 American Options
Table 15.1 Simulated stock
price paths
Path t = 0 t = 1 t = 2 t = 3
1 1 1.09 1.08 1.34
2 1 1.16 1.26 1.54
3 1 1.22 1.07 1.03
4 1 0.93 0.97 0.92
5 1 1.11 1.56 1.52
6 1 0.76 0.77 0.90
7 1 0.92 0.84 1.01
8 1 0.88 1.22 1.34
Table 15.2 Cash-flow
Matrix at Year 3 (Conditional
on No Exercise before Year 3)
Path t = 1 t = 2 t = 3
1
2
3 0.07
4 0.18
5
6 0.20
7 0.09
8
for a single simulated path of the asset price, it is impossible to make the exercise
decision at an exercise date without knowing its continuation value.
Special Monte Carlo algorithms have been proposed for pricing American
options, among which, the Least-Square Method (LSM), proposed by Longstaff
and Schwartz [50], is the most popular and widely used one. The option pricing
with LSM is realized through the following steps:
1. generate the paths of the underlying assets
2. determine the optimal exercise decision on each generated path
– for the exercise decision, we need to compare exercise value and continuation
value
– in LSM, the continuation value is estimated with the least-square method
3. based on the exercise decisions for each generated path fixed in the precedent
step, the option price can be simulated with the normal Monte Carlo.
The method is explained through the following example from the original paper
[50].
Example 15.2 Consider a 3-year put option with 2 exercise dates (year 1 and year
2) with initial spot = 1, strike = 1.1 and one year discount factor = 0.94176.
Table 15.1 shows 8 simulated paths at inception and the end of each year. We can
see the option payoff at year 3 conditional on no early exercise in Table 15.2.
Let X denote the stock price and Y be the discounted cash flow received at the
considered year, conditional on no exercise before that year. In this example, it is15.3 Methods for Pricing American Options 191
Table 15.3 Regression at
year 2
Path Y X
1 0 × 0.94176 1.08
2
3 0.07 × 0.94176 1.07
4 0.18 × 0.94176 0.97
5
6 0.20 × 0.94176 0.77
7 0.09 × 0.94176 0.84
8
Table 15.4 Exercise
decision at year 2
Path Exercise Continuation
1 0.02 0.0369
2
3 0.03 0.0461
4 0.13 0.1176
5
6 0.33 0.1520
7 0.26 0.1565
8
Table 15.5 Cash-flow
matrix at year 2 (Conditional
on no early exercise)
Path t = 1 t = 2 t = 3
1
2
3 0.07
4 0.13
5
6 0.33
7 0.26
8
assumed that , E[Y|X] = a + bX + cX2, where X is used as a state variable for the
regression. It is up to the practitioner to choose the functional and state variable(s)
according to the model/option, for instance, also using the volatility as another state
variable.
The regression variables at year 2 are listed in Table 15.3. The dependent variable
Y contains the discounted values from Table 15.2. Note that for X, only the in-the-
money paths where X < 1.1 are used for the regression. It allows to improve the
efficiency of the algorithm.
From Table 15.3, the regression result is, E[Y|X] = −1.070+2.983X−1.813X2.
It will be used for calculating the continuation values in Table 15.4 for determining
the exercise decisions after comparing with the exercise values. For instance, Path 7
implies exercising as 0.26 > 0.1565 in Table 15.4; see all the exercise decisions at
year 2 in Table 15.5.192 15 American Options
Table 15.6 Regression at
year 1
Path Y X
1 0 × 0.94176 1.09
2
3
4 0.13 × 0.94176 0.93
5
6 0.33 × 0.94176 0.76
7 0.26 × 0.94176 0.92
8 0 × 0.94176 0.88
Table 15.7 Exercise
decision at year 1
Path Exercise Continuation
1 0.01 0.0139
2
3
4 0.17 0.1092
5
6 0.34 0.2866
7 0.18 0.1175
8 0.22 0.1533
Table 15.8 Final stopping
rule
Path t = 1 t = 2 t = 3
1
2
3 Y
4 Y
5
6 Y
7 Y
8 Y
We can repeat the process at year 1 similarly to year 2. Table 15.6 shows the
independent variables X which are in-the-money and also the dependent variables
Y. The corresponding regression result is , E[Y|X] = 2.038−3.335X +1.356X2. It
is used for determining exercise decisions at year 1 in Table 15.7.
With the stopping rule matrix in Table 15.8 and the final option cash flow matrix
in Table 15.9, we can apply the normal Monte Carlo method for pricing the option
using the same simulated paths.
We remark that LSM gives a lower bound of the real option price because the
exercise decision might not be 100% optimal.
• If the option hedger has the exercise right (callable structure), he/she tends to
under-price the option value (conservative for the option hedger).15.3 Methods for Pricing American Options 193
Table 15.9 Final option
cash-flow matrix
Path t = 1 t = 2 t = 3
1
2
3 0.07
4 0.17
5
6 0.34
7 0.18
8 0.22
• If the option hedger is short of the exercise right (puttable structure), he (she) has
the risk of selling the exercise right at a too low price.
Methods have been proposed for giving the upper bound of American options,
e.g., [69]. But they are often not easy to implement in a general way.
Exercises
1. Let Ω be the infinite coin toss space and Fk be the natural filtration generated
by the random walk; see Exercise 1 in Chap.10.
(i) Define τ as the random variable
τ(ω) =

1, if ω = y ··· ,
2, if ω = n··· .
Show that τ is a stopping time.
(ii) Modify τ to be
τ(ω) =

1, if ω = y ··· or ω = ny ··· ,
2, if ω = nn··· .
Show that τ is no longer a stopping time.
2. Compute an American call by a 2-step binomial method with S0 = 20, K = 21,
T = 0.5, r = 0.02, δt = 0.25, u = 1.1 and d = 1
u. Show that at each node of
the tree it is also not optimal to early exercise the American call since the stock
does not give dividends.194 15 American Options
3. Derive the free boundary problem for American call option with the high contact
condition
∂Ct(St)
∂St




St=S
f
t
= 1,
where the notation follows the ones used in this chapter.Chapter 16
Exotic Options Pricing and Hedging
In this chapter, we will first introduce some Brownian motion related distributions
that are useful for pricing exotic options. Then, we will discuss the pricing and
hedging of exotic options presented in Part I, Chap.8 including binary option,
barrier option, and Asian option. Some explicit pricing formulas will be derived
under BSM model. The last section is dedicated to the hedging practice for the
typical risks in exotic options and structured products.
## 16.1 Further Properties of Brownian Motion
For exotic options, their payoff structures are often path-dependent, and therefore
we need more properties of Brownian motion.
## 16.1.1 Covariance of Brownian Motions
Proposition 16.1 For any s,t ≥ 0, Cov(Ws,Wt) = E[WsWt] = min{s,t}.
Proof We only prove the case E[WsWt] = s when s < t because the other case is
symmetric. With the independence between Wt − Ws and Ws,
E[WsWt] = E[Ws(Wt − Ws + Ws)] = E[Ws(Wt − Ws)] + E[W2
s ]
= E[Ws]E[Wt − Ws] + s = s. 
The result can be used in a property of Asian options.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_16
195196 16 Exotic Options Pricing and Hedging
## 16.1.2 First Passage Time
Let x be any real number. The first passage time to level x, also called the first
hitting time, describes the time when the Brownian motion hits the level x for the
first time. It is defined as the following random variable:
τx = min{t ≥ 0; Wt = x},
which is a stopping time. If the Brownian motion never reaches the level x, we set
τx = ∞. Different sample paths of Wt firstly hit x at different moments, making it
a random variable τx(ω) for each ω (sample path). See two realizations of τx shown
in Fig.16.1 (left).
## 16.1.3 Extremum to Date
The maximum to date for Brownian motion starting at 0 is defined as the following
stochastic process:
Mt = max
0≤s≤t
Ws.
Note that Mt is a non-decreasing process, and visually consists of a considerable
amount of flat lines. See Fig.16.1 (right) for reference. Also Mt ≥ W0 = 0.
The minimum to date for Brownian motion starting from 0 is defined as the
following stochastic process:
mt = min
0≤s≤t
Ws.
Fig. 16.1 First passage time and maximum/minimum to date16.1 Further Properties of Brownian Motion 197
It is also easy to see that mt is a non-increasing process with a lot of flat lines. See
Fig.16.1 (right) for reference. Moreover, mt ≤ W0 = 0. Together, the processes Mt
and mt form some sort of envelope around Wt.
## 16.1.4 Reflection Principle
The Brownian motion Wt ∼ N (0,t) is symmetric, i.e., it has an equal chance of
reaching a positive number or its negation at a future time (starting from time 0).
This property can further be elevated and reveals how the Brownian motion has a
mirror image after it hits a certain value; see Fig.16.2.
This can be mathematically described as follows. Suppose x > 0 and time is t.
The set {τx ≤ t} implies that the Brownian motion has already touched x before.
Then, the probability of Wt having retraced to a lower level y ≤ x, should be equal
to the probability of Wt rising above y’s mirror image about x, i.e., 2x − y. Thus,
we first have the heuristic observation below without proof.
Theorem 16.1 (Reflection Principle)
P{τx ≤ t,Wt ≤ y} = P{Wt ≥ 2x − y}, y ≤ x, x > 0, W0 = 0.
The special case when y = x is also useful:
P{τx ≤ t,Wt ≤ x} = P{Wt ≥ x}, x > 0, W0 = 0.
Corollary 16.1 We have P{τx ≤ t} = 2P{Wt ≥ x}.
Proof By the special case of reflection principal, we have
P{τx ≤ t,Wt ≤ x} = P{Wt ≥ x}.
Note that ifWt ≥ x, then τx ≤ t so that P{τx ≤ t,Wt ≥ x} = P{Wt ≥ x}. Therefore
P{τx ≤ t} = P{τx ≤ t,Wt ≤ x}+P{τx ≤ t,Wt ≥ x} = 2P{Wt ≥ x}. 
Fig. 16.2 The reflection
principle: Brownian motion
(solid line) and its reflection
with respect to x (dotted line)198 16 Exotic Options Pricing and Hedging
There is also another version of reflection principle that involves the maximum
to date Mt. The important thing is to realize that the set {τx ≤ t} is equivalent to
{Mt ≥ x}. Then,
P{Mt ≥ x,Wt ≤ y} = P{τx ≤ t,Wt ≤ y} = P{Wt ≥ 2x − y}, y ≤ x, x > 0,
where the second quality is from the reflection principle. From the corollary, we also
have the following useful result:
P{Mt ≥ x} = P{τx ≤ t} = 2P{Wt ≥ x}.
## 16.1.5 Distribution of First Passage Time
The first passage time w.r.t. x is a random variable when we consider a fixed x. It is
interesting to study the distribution of this random variable.
Proposition 16.2 (First Passage Time Distribution) Suppose t > 0 and ∀x =
0. The random variable τx has the following cumulative distribution function and
probability density function
P{τx ≤ t} =
2
√
2π
 ∞
|x| √
t
e−z2
2 dz and fτx (t) =
|x|
t
√
2πt
e−x2
2t .
Proof We first consider the case x > 0. By the Reflection Principle’s corollary, and
the normal density of Brownian motion, we have
P{τx ≤ t} = 2P{Wt ≥ x} =
2
√
2πt
 ∞
x
e−u2
2t du.
Defining z = u √
t
, we get P{τx ≤ t} = 2 √
2π
∞
|x| √
t
e−z2
2 dz. For x < 0, we observe that
τx and τ|x| have the same distribution, and we have the same result. For obtaining
the probability density function, we recall that fτx (t) = d
dt P{τx ≤ t} and direct
differentiation will give the result. 
## 16.1.6 Joint Distribution with Extremum of Brownian Motion
The reflection principle also allows us to derive the joint density of the Brownian
motion and its maximum or minimum.
Proposition 16.3 Let t > 0. The joint density of (Mt,Wt) is16.1 Further Properties of Brownian Motion 199
fMt,Wt (x,y) =
2(2x − y)
t
√
2πt
e−(2x−y)2
2t 1x≥max{y,0}.
The joint density of (mt,Wt) is
fmt,Wt (x̄,ȳ) =
2(ȳ − 2x̄)
t
√
2πt
e−(ȳ−2x̄)2
2t 1x̄≤min{ȳ,0}.
Proof Note that by definition of distribution function
P{Mt ≥ x,Wt ≤ y} =
 ∞
x
 y
−∞
fMt,Wt (u,v)dvdu
and the LHS is equal to P{Wt ≥ 2x − y} by the reflection principle with Mt.
Moreover, by the normal density of Wt we also have
P{Wt ≥ 2x − y} =
1
√
2πt
 ∞
2x−y
e−z2
2t dz.
We get the proof by differentiating the right-hand side of both equations w.r.t. x and
y.
The joint density of (mt,Wt) can be deduced from (Mt,Wt). Defining
Wt = −Wt, x̄ = −x and ȳ = −y,
we have
m̄t = min
0≤s≤t
Ws = − max
0≤s≤t
(−Ws) = − max
0≤s≤t
Ws = −Mt.
The following equivalence
P{m̄t ≤ x̄,Wt ≥ ȳ} = P{Mt ≥ x,Wt ≤ y}
would lead to fmt,Wt (x̄,ȳ) = fm̄t,Wt
(x̄,ȳ) = fMt,Wt (x,y) which is the result to
prove after inserting x = −x̄ and y = −ȳ in fMt,Wt (x,y). 
Note that Mt ≥ 0 and mt ≤ 0 and therefore their state variables inherit the same
ranges. For the state variable of Wt, it can not exceed that of Mt or stay under that
of mt. Therefore the domain of the joint density is not the whole 2D plane.
Let the Brownian motion with drift be defined as & Wt = Wt + μt, 0 ≤ t ≤
T. Evidently, & Wt follows the normal distribution with mean μt and variance t. Its
density is
f& Wt
(y) = fWt (y − μt) =
1
√
2πt
e−(y−μt)2
2t =
1
√
2πt
eμy−1
2 μ2t
e−y2
2t .200 16 Exotic Options Pricing and Hedging
The maximum of Brownian motion with drift is defined as & MT = max
0≤t≤T
& Wt. The
minimum of Brownian motion with drift is defined as m̂T = min
0≤t≤T
& Wt.
Proposition 16.4 The joint density of ( & MT , & WT ) is
f& MT ,& WT
(x,y) =
2(2x − y)
T
√
2πT
eμy−1
2 μ2T−(2x−y)2
2T 1x≥max{y,0}.
The joint density of (m̂T , & WT ) is
fm̂T ,& WT
(x̄,ȳ) =
2(ȳ − 2x̄)
T
√
2πT
eμȳ−1
2 μ2T−(ȳ−2x̄)2
2T 1x̄≤min{ȳ,0}.
The distribution functions for First Passage Time and Maximum of Brownian
motion allow the derivation of closed-form solutions for some of the exotic options.
Proof We apply Girsanov Theorem for removing the drift. Defining & Zt =
e−μ& Wt+1
2 μ2t
and & P =

A
& ZT d, P, then, & Wt is a Brownian motion with zero drift
under& P. Hence, for x ≥ max{y,0},
, P{ & MT ≤ x, & WT ≤ y} = , E
'
1{ & MT ≤x,& WT ≤y}
(
= & E
1
& ZT
1{ & MT ≤x,& WT ≤y}
!
= & E
'
eμ& WT −1
2 μ2T
1{ & MT ≤x,& WT ≤y}
(
=
 y
−∞
 x
−∞
eμv−1
2 μ2T 2(2u − v)
T
√
2πT
e−(2u−v)2
2T
!
dudv,
where the last equality comes from Proposition 16.3. Differentiating w.r.t. y and x,
we get
f& MT ,& WT
(x,y) =
2(2x − y)
T
√
2πT
eμy−1
2 μ2T−(2x−y)2
2T 1x≥max{y,0}.
Similarly, we can prove the joint density of (m̂T , & WT ). 
Proposition 16.5 (Conditional Distribution of & Mt and m̂t) The conditional
distribution of ( & Mt, & Wt) is
f& Mt|& Wt
(x|y) =
2(2x − y)
t
e−2x(x−y)
t 1x≥max{y,0},
P{ & Mt ≤ x|& Wt = y} = (1 − e−2x(x−y)
t )1x≥max{y,0}.
The conditional distribution of (m̂t, & Wt) is16.2 Pricing of Exotic Options Under BSM Model 201
fm̂t|& Wt
(x̄|ȳ) =
2(ȳ − 2x̄)
t
e−2x̄(x̄−ȳ)
t 1x̄≤min{ȳ,0},
P{m̂t ≤ x̄|& Wt = ȳ} = e−2x̄(x̄−ȳ)
t 1x̄≤min{ȳ,0}.
Proof The conditional density f& Mt|& Wt
(x|y) can be obtained with f& Mt|& Wt
(x|y) =
f& Mt,& Wt
(x,y)
f& Wt
(y) . Then,
P{ & Mt ≤ x|& Wt = y} =
 x
0
f& Mt|& Wt
(u,y)du = (1 − e−2x(x−y)
t )1x≥max{y,0}.
Similarly, we can obtain the conditional distribution for (m̂t, & Wt). 
This proposition is useful for Monte Carlo simulations where both the terminal
value and the extremum are needed for the considered period. The simulation of the
paircanbedonewithtwosteps:(1)generatingtheterminalvalue,and(2)generating
the extremum using P−1 (e.g. m̂t = ȳ
2 −

ȳ2
4 − t lnu
2 , u ∈ U [0,1] is a uniform
random variate).
We refer to [7] for generating the triplet (m̂t, & Mt, & Wt) with Monte Carlo.
## 16.2 Pricing of Exotic Options Under BSM Model
In this section we focus on binary, barrier and Asian options. We refer to [45, 79]
for the closed-form solutions under BSM for some other path dependent options.
## 16.2.1 European Binary Options
The binary option is the simplest option with a discontinuous payoff. The contract
rewards the buyer assets or cash if the underlying ends up in-the-money, or nothing
if out-of-the money. Here we consider the normalized cash-or-nothing call option,
and its payoff at maturity T is given by
1{ST >K}.
There is a closed-form formula for theoretically pricing the cash-or-nothing call
option under the BSM model. In reality, one can quickly realize that the desired
price appears as the second term in the derivation of the Black–Scholes formula,
, E
1
MT
1{ST >K}
!
= e−rT, P{ST > K} = e−rT
N(d2),202 16 Exotic Options Pricing and Hedging
where we recall that d1 =
ln
S0
K +(r+1
2 σ2)T
σ
√
T
and d2 = d1 − σ
√
T. As a side note, the
price of an asset-or-nothing call option with payoff ST · 1{ST >K} is given by
, E
1
MT
ST · 1{ST >K}
!
= S0N(d1).
Together they form a typical European call option. This can also be verified by no-
arbitrage argument.
Another interesting property regarding binary options is the relation between the
cash-or-nothing ATMS call option with payoff 1{ST >S0} and the cash-or-nothing
ATMS put option with payoff 1{ST ≤S0}. We know that their prices are
e−rT, P{ST > S0} and e−rT, P{ST ≤ S0}
respectively. Assuming interest rate is zero, the forward price of a non-dividend pay-
ing underlying will be equal to its initial price. One may expect the aforementioned
probabilitieswillbeequal.Actually,sinceST islog-normallydistributedintheBSM
model,itsprobabilitydensityfunctionisskewedtotheleft.So,, P{ST ≤ S0}ishigher
than, P{ST > S0}, and hence the binary put is worth more than the binary call.
Numerical Approaches
Both PDE and Tree methods are directly applicable to binary options. Note that
the discontinuity around K at maturity is known to cause trouble for various finite
difference schemes. For instance, the Crank–Nicolson method will suffer from
oscillatory results and high order differencing techniques in spatial direction will
fail to achieve the supposed accuracy.
Monte Carlo applies directly in the same way as for the case of European Vanilla
options.
The discontinuity creates issues for hedging in practice. We will discuss about it
in the last section of this chapter.
## 16.2.2 American Binary and Barrier Options
Barrier options are widely used path-dependent options with payoff related to the
asset price history during the option life. There are two main categories of barrier
options. A knock-in (also known as kick-in) option becomes existent when the
underlying price crosses a certain barrier level, while a knock-out option becomes
void when the underlying asset price crosses a predetermined level before maturity.
The “in” options and “out” options respect the in-out parity such that one can induce
the other (cf. Sect.8.3.3). Therefore, we only take the up-and-out call option to16.2 Pricing of Exotic Options Under BSM Model 203
illustrate the pricing and hedging of barrier options. The payoff at maturity T can
be written as
(ST − K)+
1{ max
0≤t≤T
St<H},
where H (> K) is the fixed barrier level. Notice that
(ST − K)+
1{ max
0≤t≤T
St<H} ≤ (ST − K)+
.
Therefore, the up-and-out call option is cheaper than the vanilla European call
option, which is attractive to investors who believe in limited upside price moves.
The risk-neutral pricing formula for an up-and-out call is
V0 = , E[e−rT
max{ST − K,0}1 max
t∈[0,T]
St≤H].
Let & WT = , WT + μT where μ = 1
σ (r − 1
2σ2). Then, St = S0eσ & Wt . The joint
distribution of ST and max
t∈[0,T]
St can be represented by the joint distribution of
& WT , & MT .
The region for the integration implied by the expectation is ST ≤ max
t∈[0,T]
St ≤ H,
K ≤ ST ≤ H which is equivalent to
max{& WT ,0} ≤ & MT ≤ h and l ≤ & WT ≤ h
where l = ln K
S0
/σ and h = ln H
S0
/σ. Hence,
V0 = , E[e−rT
max{ST − K,0}1 max
t∈[0,T]
St≤H]
=
 h
l
 h
max{y,0}
e−rT
(S0eσy
− K)
2(2x − y)
T
√
2πT
eμy−1
2 μ2T−(2x−y)2
2T dxdy
=
 h
l
e−rT
(S0eσy
− K)
1
√
2πT
[−eμy−1
2 μ2T−(2x−y)2
2T ]|h
max{y,0}dy
= A + B + C + D,
where
A =
 h
l
e−rT
S0eσy 1
√
2πT
eμy−1
2 μ2T−y2
2T dy
B = −
 h
l
e−rT
K
1
√
2πT
eμy−1
2 μ2T−y2
2T dy204 16 Exotic Options Pricing and Hedging
C = −
 h
l
e−rT
S0eσy 1
√
2πT
eμy−1
2 μ2T−(2h−y)2
2T dy
D =
 h
l
e−rT
K
1
√
2πT
eμy−1
2 μ2T−(2h−y)2
2T dy.
The first term is
A = S0
 h
l
e−rT+σy 1
√
2πT
eμy−1
2 μ2T−y2
2T dy = S0
 h
l
1
√
2πT
e−[y−(σ+μ)T]2
2T dy
= S0
 h−(σ+μ)T √
T
l−(σ+μ)T √
T
1
√
2π
e−z2
2 dz = S0[N(a1) − N(a2)],
where z = y−(σ+μ)T √
T
, a1 =
ln
S0
K +(r+1
2 σ2)T
σ
√
T
, a2 =
ln
S0
H +(r+1
2 σ2)T
σ
√
T
by some algebraic
operations and the property N(−x) = 1 − N(x).
Similarly, we can obtain B,C,D which leads to the formula for an up-and-out
call option:
V0 = S0[N(a1) − N(a2)] − Ke−rT
[N(a3) − N(a4)]
− H

S0
H
− 2r
σ2
[N(a5) − N(a6)] + Ke−rT

S0
H
− 2r
σ2 +1
[N(a7) − N(a8)],
where a3 = a1 − σ
√
T, a4 = a2 − σ
√
T, a5 =
ln H2
KS0
+(r+1
2 σ2)T
σ
√
T
, a6 =
ln H
S0
+(r+1
2σ2)T
σ
√
T
, a7 = a5 − σ
√
T and a8 = a6 − σ
√
T.
Numerical Approaches
Both PDE and tree methods are applicable by condition related to the knock-out
barrier. Consider the up-and-out call with PDE approach. The spatial direction of
the solution domain is now reduced to [0,H] and the spatial truncation naturally
follows. The RHS boundary condition is also updated as c = 0 at H when there is
no rebate upon hitting the barrier. Together with c = 0 at 0, we have the so-called
homogeneous boundary conditions (values are all zeros).
From “in-out” parity, we only need to solve the Black–Scholes equation for an
in-option or an out-option only. Usually we solve for the out-options with zero
boundary conditions in the spatial direction, when the option has no rebate.
For Monte Carlo simulation, there are two cases:16.2 Pricing of Exotic Options Under BSM Model 205
• if the barrier observation is discrete (daily, monthly, quarterly, or etc.), we need to
set the time steps accordingly when generating asset price paths. Such treatment
is for getting the maximum level achieved on these discrete dates
• if the barrier event observation is continuous, Proposition 16.5 can be used for
simulating the extremum between two time points.
The hedging in practice is tricky for Barrier options due to the discontinuity.
We will discuss about it in the last section as well.
## 16.2.3 Asian Options
There are two kinds of averaging, namely the arithmetic average and geometric
average. Their mathematical representations take the following forms for 0 < t1 <
t2 < ··· < tm = T:
– Arithmetic average: YT = 1
m
m
j=1 Stj
– Geometric average: YT = m

St1St2 ···Stm.
The continuous-time approximation will be
– Arithmetic average: YT = 1
T
T
0 Stdt
– Geometric average: YT = exp( 1
T
T
0 lnStdt).
In Part I, we have discussed the purpose of Asian options in practice. One thing
worth noticing is that the averaging mechanism helps to control the delta at the
samplingdatesbecauseoflessvolatility.However,theaveragingdoesnothelpmuch
to control the gamma.
The closed-form formulas of Asian options are not yet known for most cases
except when the payoff uses geometric average and the underlying follows the
log-normal distribution. The pricing utilizes the fact that the product of two log-
normal variates is still log-normal. On the other hand, the arithmetic average makes
use of addition and the sum of log-normal variates does not keep the log-normal
distribution. Therefore, numerical approaches are used for these cases.
Numerical Approaches
Monte Carlo approach is simple and flexible for pricing Asian options. However, the
time steps for generating the paths need to cover all the sampling points specified
by the option.
Things are complicated for PDE and binomial tree methods. Due to the path-
dependency feature of the payoff, the option price at time t depends not only on (t,
St) but also on {Su, u < t}, leading to a non-Markovian problem. We need to add
a new spatial dimension with the variable Yt =
t
0 Sudu (1
t
t
0 Sudu is known as206 16 Exotic Options Pricing and Hedging
running average) so that the option price will be dependent only on (t,St,Yt) and
the problem becomes Markovian. Then, 2-D PDE or binomial tree can be applied.
The hedging in practice for Asian options is similar to vanilla options.
Practitioners often make a quick estimation of Asian option price with the pricer
of Vanilla options by applying the volatility of σ √
3
. This is based on the below
property of Brownian motion.
Proposition 16.6 Consider a process Xt satisfying dXu = σdWu. Then,
Var

1
t − s
 t
s
(Xu − Xs)du

=
σ2(t − s)
3
.
Proof It is equivalent to prove
Var
 t
s
(Wu − Ws)du

=
(t − s)3
3
.
Covariance of Brownian motion and direct calculations give
Var
 t
s
(Wu − Ws)du

= E
 t
s
 t
s
(Wu − Ws)(Wv − Ws)dudv
!
=
 t
s
 t
s
E[(Wu − Ws)(Wv − Ws)]dudv =
 t
s
 t
s
(min{u,v} − s)dudv
=
 t
s
 t
s
(u − s)1{u≤v}dudv +
 t
s
 t
s
(v − s)1{u>v}dudv
= 2
 t
s
 y
s
(x − s)dxdy = 2
 t
s
 y−s
0
zdzdy =
 t
s
(y − s)2
dy =
(t − s)3
3
. 
Let Yt denote arithmetic average of Xt with continuous sampling, i.e., Yt =
1
t
t
0 Xudu with Y0 = 0. Since Var(Xt) = σ2t, we know from above that variance
of Yt becomes one third of the original, i.e.,
Var(Yt) = Var

1
t
 t
0
Xudu

=
σ2t
3
,
by taking s = 0. Equivalently, the volatility of Yt for the time period is σ √
3
.16.3 Hedging Issues and Practical Solutions 207
## 16.2.4 Basket Options, Worst-of, Best-of Options
Numerical Approaches
For options linked to multiple assets, it is difficult to obtain closed-form formulas.
For problems with a dimension of more than two, the PDE or tree methods start to
face issues as well. So, Monte Carlo method is usually applied for such options.
In the market, implied volatilities that are quoted can be hedged for a large range
of assets. However, it is not the case for the correlation between the asset prices.
Practitioners have to take risk of correlation which will be further analyzed in the
next section.
## 16.3 Hedging Issues and Practical Solutions
## 16.3.1 Gap Risk
Some exotic options and structured products offer different payoff levels contingent
on the price level of the underlying assets. This often creates discontinuity in the
price of the product. The delta at the discontinuity point may be very large as it
tends to infinity theoretically. The execution of a delta amount of more than 20%
may start to impact the market price of the underlying. This problem is known as
the gap risk.
The below techniques are usually applied in practice for mitigating the gap
risk:
• call/put spread smoothing: when the barrier is observed at fixed time point
(European Barrier); See Fig.16.3
• barrier shift: when the barrier is observed continuously (American Barrier).
For a European barrier, the Dirac1 behaviour of delta can be resolved by applying
a call/put spread. A call spread smoothing means that instead of using
PT
H H
spread
⎫
⎬
⎭ 1
max is the slope
PT
H H
spread
⎧
⎨
⎩ 1
Fig. 16.3 Smoothing gap risk by call or put spread
1A mathematical concept in which infinity is achieved at one point but zero otherwise.208 16 Exotic Options Pricing and Hedging
N × 1{PT >H}, PT =
ST
S0
is the performance of the underlying
as payout for hedging, the trader uses
N × min{1,max{0,Δmax × (PT − H
)}},
where
N × Δmax is the maximum delta amount the hedger can accept which is normally
less than 20% of the average daily trading volume (ADTV) of the underlying
spread= 1/Δmax and H = H−spread.
Let H be set at a level either higher or lower than H so that the pricing is
always on the conservative side for the product hedging party (i.e. more expensive
to the investor). This is called over-hedging. We note that the product terms for the
investor are not changed by the over-hedging. If the final performance ends up at a
level between H and H, the “over-hedged payout” will belong to the hedging party,
but not to the investor.
The Put Spread smoothing case can be deduced following the same rationale.
For Worst-of or Best-of observations, the call/put spread can be applied to the
worst/best performance.
Example 16.1 Figure 16.4 shows the over-hedging with call spread on a European
binary call.
For large size trades with basket underlyings of low liquidity, the following trick
may be considered for obtaining more aggressive pricing without losing the control
on Δmax. The idea is to transform the payoff conditioned by one event (on worst
or best performance) into a payoff linked to the sum payoffs— performance of all
underlyings.
Consider a contract payoff 1{min
i
{Pi
T }>H}. We apply the transformation
0.9 0.95 1 1.05 1.1 1.15 1.2 1.25 1.3
0
0.2
0.4
0.6
0.8
1
Spot Price
Binary Payoff
Hedging Payoff
0.9 0.95 1 1.05 1.1 1.15 1.2 1.25 1.3
0
0.2
0.4
0.6
0.8
1
Spot Price
Binary Price
Hedging Price
0.9 0.95 1 1.05 1.1 1.15 1.2 1.25 1.3
0
5
10
15
20
25
Spot Price
Binary Delta
Hedging Delta
Fig. 16.4 Delta-hedging a binary call and a call spread16.3 Hedging Issues and Practical Solutions 209
1{min
i
{Pi
T }>H} = 1 − 1{min
i
{Pi
T }<H} = 1 − min

1,
n
i=1
1{Pi
T <H}

.
For each 1{Pi
T <H}, we apply put spread for smoothing:
Smoothed Payoff = 1 − min{1,
n
i=1
Put Spread(i)},
where
Put Spread(i) = max{0,min{1,Δi
max × (H − Pi
T )}}.
Let us assume that the worst performance has very poor liquidity, but the second
worst underlying has very high liquidity. The poor liquidity of the worst results in
a large spread which makes the price quite expensive. However, the second worst
has a very tight spread thanks to its liquidity. In the normal smoothing method,
only the worst performance will be used for the pricing. But with our method, the
second worst performance may play a role in pricing which cheapens the price of
the product.
For smoothing the Gamma/Delta near an American barrier, the technique of
barrier shift may be applied which consists of hedging/pricing the product with a
barrier that is not at the contract barrier described in the product terms. The barrier
shift should put the barrier further from the spot price so that the option will be
knocked out by the contract barrier away from the shifted barrier level used in
hedging. See Fig.16.5 for reference.
For example, the hedging party selling an Up-and-Out Binary option with
contract barrier at 135% of initial price may shift the barrier to 140% for hedg-
ing/pricing. The pricing will be on the conservative side to the hedging party.
However, if the hedging party is selling the Up-and-In Binary option, the hedging
barrier can not be simply shifted closer to the current price because this will not
smooth out Gamma/Delta at the barrier. In this case, the hedging party may apply
call/put spread on the continuous extremum (i.e. Pi
t replaced by the continuous
extremum for the period, either minimum or maximum according to the product).
Another almost equivalent method consists of breaking the trade into n smaller
size trades over a series of shifted barrier levels between the current price and the
contract barrier. See Fig.16.6 for reference.
Fig. 16.5 Barrier shift for
smoothing gamma or delta
PT
H H210 16 Exotic Options Pricing and Hedging
PT
H
m , (0 T) (instead of PT )
Fig. 16.6 Hedging up-and-in binary option (m(0,T) is the minimum performance in the period
[0,T])
0.9 0.95 1 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45
0
0.05
0.1
0.15
0.2
0.25
0.3
0.35
Spot Price
UOC Payoff
Shifted UOC Payoff
1.05 1.1 1.15 1.2 1.25 1.3 1.35
0
0.05
0.1
0.15
0.2
0.25
0.3
0.35
Spot Price
UOC Price
Shifted UOC Price
Fig. 16.7 Delta-hedging up-and-out calls with two different barriers
Example 16.2 Figure 16.7 illustrates “barrier shift” applied to an up-and-out call
with barrier H on the contract. The option writer used H (H > H) for pricing and
hedging.
Notice that over-hedging with a shifted barrier does not bound the delta as the
case in European binary option. The delta and gamma may be still large near H,
but it does not matter any more because the contract is already void after breaking
H and that the hedging stops.
## 16.3.2 Large Delta Issue
For large Delta amount (compared to the liquidity of the underlying) at payoff
expiration or at initial hedging time, the execution of the Delta amount in the market
is exposed to slippage risk. Averaging is often used for mitigating such risk. It
consistsoftakingtheaveragedpriceoverafewdays(e.g.3days)asreference(either
final reference price or initial reference price) to determine the payoff amount.
We note that averaging reduces the Delta at expiration but it does not help much
for reducing the Gamma before expiration unless the averaging is applied for a
significantly long period.16.3 Hedging Issues and Practical Solutions 211
## 16.3.3 Correlation Risk
In general, the correlation risk is difficult to hedge in the market. Sometimes,
correlation exposure may be obtained through outperformance options, correlation
Swaps, etc. on liquid names in the broker market. But the correlation risks from
structured business are not transferred to the market. For the majority of the
structured products, the trading books are selling correlation, i.e. the basket of
underlyings with higher correlations will make the product more expensive.
The trading books take reserves on correlation by conservatively shifting the
correlation levels in pricing. If the shifted correlations are also used for producing
the Greeks for hedging, this reserve will be gradually released through the time
decay.
The correlation parameter is estimated from historical correlation over one or
more time windows, e.g. 3 months or 6 months window rolling over a period of
3 years. Weekly returns are often used for assets from different time zones. For
shifting the correlation parameters, the simple method used by practitioners consists
of interpolating between the estimated historical correlation matrix ΣHistorical and
the perfect correlation matrix I, i.e. the matrix with value 1 for every element:
Shifted Correlation = αΣHistorical + (1 − α)I, α ∈ [0,1].
This method keeps naturally the positive semi-definite property for the shifted
correlation matrix.
Exercises
1. Assume the underlying follows the BSM with no dividend. Let c denote the time-
t Black–Scholes European call price with strike price K and maturity T. Show
that
−
∂c
∂K
= e−r(T−t)
N(d2).
Explain how a bullish call spread and a binary cash-or-nothing call option are
related through the above equation.
2. Assume the underlying follows the BSM with no dividend. Derive the time-t
delta for a binary cash-or-nothing call option with payoff 1{ST >K} where ST is
the asset price at maturity T and K is the strike. Show that the delta approaches
+∞ when t → T.
3. Consider a stock with ADTV (Average Daily Trading Volume) being USD80m.
A client of an investment bank wants to buy a 3 month, 105% Strike Binary Call212 16 Exotic Options Pricing and Hedging
option (European style) which pays a coupon of 10% of the notional amount of
USD10m.
The trader needs to control the maximum delta to be at or below 20% of
ADTV by applying a call-spread type of smoothing as illustrated below:
PT
H H
call spread smoothing
spread
⎫
⎬
⎭10%
Determine the width of spread in percentage (%) of the initial stock price.Chapter 17
Numéraires and the Pricing of Vanilla
Interest Rate Options
## 17.1 Introduction of Numéraire
In this chapter, we will introduce the concept of numéraire and its application in the
modelling and pricing of derivatives. In financial mathematics, a numéraire is the
unit of account for denominating the assets. Any positive and non-dividend paying
process can be used as a numéraire. The risk-neutral measure for a given numéraire
is the probability measure under which any non-dividend paying tradable asset
denominated in this numéraire is a martingale. The techniques related to numéraire
lead to simplification and clarity in financial derivatives modelling.
Actually, we have already encountered a numéraire in previous content, which is
the money market account:
Mt = e
t
0 rsds
.
It is a positive process which has been used as numéraire. Its value at t is the return
of investing $1 with continuous interest rate rs. Furthermore, under the “money
market” risk-neutral probability, P, all non-dividend paying asset price denominated
in units of Mt, that is, St/Mt = e−
t
0 rsds
St is a martingale under, P.
## 17.2 Change of Numéraire
Now, we consider how the change of probability is affected when the original
numéraire is changed to another one. Let N be a numéraire and , PN be the
probability measure under which all non-dividend paying assets denominated in
the units of N (i.e. St/Nt) are, PN-martingales.
Let U be a strictly positive non-dividend paying asset, which can be potentially
another numéraire. Denoting
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_17
213214 17 Numéraires and the Pricing of Vanilla Interest Rate Options
Zt =
Ut/U0
Nt/N0
, (17.1)
we have the following from the martingale property:
, EN
[Zt] =
N0
U0
, EN Ut
Nt
!
= 1.
Then, we define, PU with
d, PU
d, PN





Ft
= Zt as Radon–Nikodym derivative process.
We call the below formula set as the toolkit for numéraire change:
⎧
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
Zt =
Ut/U0
Nt/N0
d , WU
t = d , WN
t −
dZ, , WNt
Zt
(Girsanov Theorem)
, EU
[Y|Fs] =
1
Zs
, EN
[YZt|Fs] (Bayes’ Formula)
for all 0 ≤ s ≤ t and any Ft-measurable variable Y.
Suppose a pricing problem requires evaluation under the measure , PN, as in the
right hand side in Bayes’ formula. There will be one less stochastic term Zt inside
the expectation , EU, after changing the measure from , PN to , PU. This is helpful
for the resolution and may imply a simpler Monte Carlo simulation or an easier
numerical integration.
Example 17.1 (Stock Numéraire) The stock numéraire (non-dividend-paying) has
been implicitly used when deriving the Black–Scholes formulas. Specifically, it is
used for calculating the first term in Black–Scholes formula for call option, i.e.,
, E[ST 1{ST >K}|Ft] (or equivalently pricing an asset-or-nothing call option).
Our aim is to take ST out of the risk-neutral expectation with a measure change,
and thus simplifying the pricing formula. Let Zt be the Radon–Nikodym derivative
for the numéraire change
Zt =
St/S0
Mt/M0
(= e−1
2 σ2t+σ , Wt ).
Then, under the new measure, PS (or Q in Chap.13),
Vt = Mt, E
ST 1{ST >K}
MT



Ft
!
= St
Mt
St
, E
ST 1{ST >K}
MT



Ft
!
= St
1
Zt
, E[ZT 1{ST >K}|Ft] = St, ES
[1{ST >K}|Ft].17.3 Self-Financing Condition 215
## 17.3 Self-Financing Condition
Previously we have seen that the changes in the discounted self-financing portfolio
Πt/Mt are related to the changes in the discounted stock price St/Mt.
In the following, we prove the general case for a self-financing portfolio
denominated in any given numéraire N.
Theorem 17.1 (Self-financing condition under a given numéraire) Let N be a
numéraire. A portfolio Πt = ΔtSt + ζtNt is self-financing, i.e.,
dΠt = ΔtdSt + ζtdNt,
if and only if
d
Πt
Nt
= Δtd
St
Nt
.
Hence, if St
Nt
is a, PN-martingale, Πt
Nt
is also a, PN-martingale such that
, EN Πt
Nt



Fu
!
=
Πu
Nu
.
Proof Suppose we have a self-financing portfolio Πt. Then
d
Πt
Nt
= Πtd
1
Nt
+
1
Nt
dΠt + dΠ,
1
N

t
= (ΔtSt + ζtNt)d
1
Nt
+
1
Nt
(ΔtdSt + ζtdNt) + ΔtdS,
1
N

t
+ ζtdN,
1
N

t
= ζt

Ntd
1
Nt
+
1
Nt
dNt + dN,
1
N

t

+ Δt

Std
1
Nt
+
1
Nt
dSt + dS,
1
N

t

= ζtd(Nt
1
Nt
) + Δtd(St
1
Nt
) = Δtd
St
Nt
.
Here we have made use of the fact that
d(
1
Nt
Nt) = d(1) = 0.
Conversely, suppose we have dΠt
Nt
= Δtd St
Nt
where Πt = ΔtSt + ζtNt, then it
leads to
d
Π
N
,N
t
= Δtd
S
N
,N
t
.216 17 Numéraires and the Pricing of Vanilla Interest Rate Options
Applying Itô’s Product Rule to ( St
Nt
Nt) (= St), we have
d

St
Nt
Nt

=
St
Nt
dNt +Ntd
St
Nt
+d
S
N
,N
t
=
St
Nt
dNt +Ntd
St
Nt
+
1
Δt
d
Π
N
,N
t
.
Then,
d
St
Nt
=
1
Nt

dSt −
St
Nt
dNt −
1
Δt
d
Π
N
,N
t

.
Now, applying Itô’s product rule to (Πt
Nt
Nt) = Πt, we get
d

Πt
Nt
Nt

=
Πt
Nt
dNt + Ntd
Πt
Nt
+ d
Π
N
,N
t
.
Using Πt = ΔtSt + ζtNt, dΠt
Nt
= Δtd St
Nt
and the result above, we get
dΠt =
ΔtSt + ζtNt
Nt
dNt + Δt

dSt −
St
Nt
dNt −
1
Δt
d
Π
N
,N
t

+ d
Π
N
,N
t
= ΔtdSt + ζtdNt,
i.e., Πt is a self-financing portfolio. 
Remark 17.1 The theorem can be extended to a portfolio with n assets (n ≥ 2), i.e.,
Πt =
n 
i=1
Δi
tSi
t + ζtNt. The proof is similar by replacing the St-related parts with a
linear combination.
## 17.4 Usual Numéraires and the Pricing of Vanilla Interest
Rate Options
In the following, we introduce some widely used numéraires and the corresponding
measures. The application of numéraires helps to derive explicit formulas for vanilla
interest rate options under Black models (lognormal model).
## 17.4.1 Money Market Account
The numéraire is
Mt = e
t
0 rsds
,17.4 Usual Numéraires and the Pricing of Vanilla Interest Rate Options 217
where rs is the instantaneous interest rate which may be deterministic or stochastic.
The corresponding measure is the risk-neutral measure used so far in this book. The
pricing of a European derivative paying VT at T is
Vt = Mt, E
VT
MT



Ft
!
.
## 17.4.2 Zero Coupon Bond
A zero coupon bond paying 1 at maturity T is noted as Pt(T) for its value at time
t. The probability measure with zero coupon bond as numéraire is called T-forward
measure. The pricing framework under T-forward measure admits a simple form
which does not contain a discounting term inside the expectation operator.
Proposition 17.1 Thetime-t priceofaEuropean-stylederivativewithmaturityT is
Vt = Pt(T), ET
[VT |Ft],
where , ET is the expectation under the T-forward measure.
Proof We first note that PT (T) = 1. Then,
Vt = Mt, E
VT
MT



Ft
!
= Mt, E
PT (T)VT
MT



Ft
!
= Pt(T)
Mt
Pt(T)
, E
PT (T)VT
MT



Ft
!
= Pt(T)
1
Zt
, E[ZT VT |Ft] = Pt(T), ET
[VT |Ft],
where Zt is the Radon–Nikodym derivative for the numéraire change
Zt =
Pt(T)/P0(T)
Mt/M0
. 
The T-forward measure is also closely related to derivatives written on Libor
rates. Suppose we have the tenor structure
0 ≤ T0 < T1 < T2 < ··· < Tn−1 < Tn.
Denote Lt(Ti) for the Libor rate seen at t for the period Δi = Ti+1 − Ti. From the
arbitrage relationship seen in FRA rate calculation, we have218 17 Numéraires and the Pricing of Vanilla Interest Rate Options
Lt(Ti) =
Pt(Ti) − Pt(Ti+1)
ΔiPt(Ti+1)
.
Proposition 17.2 The Libor rate seen at time t, Lt(Ti) is a martingale under, PTi+1.
Proof Let 0 < s < t. Note that Ps(Ti)−Ps(Ti+1)
Δi
is a portfolio of non-dividend paying
assets. We then have
, ETi+1[Lt(Ti)|Fs]=, ETi+1
Pt(Ti) − Pt(Ti+1)
ΔiPt(Ti+1)



Fs
!
=
Ps(Ti) − Ps(Ti+1)
ΔiPs(Ti+1)
=Ls(Ti).

Pricing of Cap or Floor
An interest rate cap contract is a strip of European call options (each option is called
a caplet) on Libor rate paying Δi(LTi (Ti)−K)+ at time Ti+1. Normally the payoff
is further multiplied by a notional but it is omitted here.
If Lt(Ti) is always positive, then, under, PTi+1, Lt(Ti) is a positive martingale and
we have
dLt(Ti) = Lt(Ti)σi(t)d , W
Ti+1
t ,
in which the volatility σi(t) is assumed to be deterministic.
From Proposition 17.1, the pricing of a caplet can be performed under the Ti+1-
forward measure, which can be solved by Black’s formula (similar to applying the
Black–Scholes formula when the drift of riskless rate is absent):
Vi(t) = Pt(Ti+1), ETi+1[Δi(LTi (Ti)−K)+
|Ft] = ΔiPt(Ti+1)(Lt(Ti)N(d1)−KN(d2)),
with
d1 =
ln Lt(Ti)
K + 1
2
Ti
t σ2
i (u)du
Ti
t σ2
i (u)du
and d2 =
ln Lt(Ti)
K − 1
2
Ti
t σ2
i (u)du
Ti
t σ2
i (u)du
.
Similar results can be obtained for the interest rate floor contract which is a strip
of European put options on Libor rate.
## 17.4.3 Annuity Factor
We recall from Chap.2 Sect.2.8 that Annuity factor is defined as17.4 Usual Numéraires and the Pricing of Vanilla Interest Rate Options 219
At =
n−1
i=0
ΔiPt(Ti+1),
where Ti’s represent the Libor fixing/payment dates. It is a positive linear combina-
tion of zero coupon bonds and hence can be used as numéraire.
For a standard swap contract, the swap rate st is
st =
Pt(T0) − Pt(Tn)
At
.
Proposition 17.3 The swap rate st is a martingale under, PA.
Proof Note that Pu(T0)−Pu(Tn) is a portfolio of non-dividend paying assets. Then,
, EA
[st|Fu] = , EA Pt(T0) − Pt(Tn)
At



Fu
!
=
Pu(T0) − Pu(Tn)
Au
= su. 
Pricing of Swaption
Here we consider pricing a basic swaption, which is essentially a European call
option on a swap. Assume T0 is the time when the swaption expires and the
underlying swap starts. Its payoff function is
AT0(sT0 − K)+
.
We observe that the swap rate is denominated by the annuity factor At, which
can be used as a numéraire. The pricing of a swaption could be simplified when the
risk-neutral measure is changed to a new measure with At as numéraire. Let T0 be
the start date of the underlying swap. Then, for t < T0,
Vt = Mt, E
AT0(sT0 − K)+
MT0



Ft
!
= At, EA
[(sT0 − K)+
|Ft]
where the numéraire change is done with Zt =
At/A0
Mt/M0
.
Now it comes down to the distribution of sT0 under , PA. The swap rate is a
martingale under, PA and now we assume it is positive. By martingale representation
theorem, we have
dst = stσtd , WA
t .
Here once again σt is modelled as deterministic. And then, st is lognormal.220 17 Numéraires and the Pricing of Vanilla Interest Rate Options
Thus, the key term , EA[(sT0 − K)+|Ft] in the pricing formula can be obtained
again by Black’s formula:
, EA
[(sT0 − K)+
|Ft] = stN(d1) − KN(d2)
with
d1 =
ln st
K + 1
2
T0
t σ2
udu
T0
t σ2
udu
and d2 =
ln st
K − 1
2
T0
t σ2
udu
T0
t σ2
udu
.
Therefore the swaption price at time t is
Vt = At(stN(d1) − KN(d2)).
Remark 17.2 As negative interest rates for certain currencies are present around
2010s, the modelling requirement for positive interest rate is no more mandatory.
For vanilla interest rate options (caps, floors, swaptions), some practitioners now
use Bachelier model (dLt = μdt + σdWt) which assumes normal distribution.
17.4.4 SABR Model for Vanilla Interest Rate Options
Similar to the equity options, the market implied volatilities (using Black model
or Bachelier model) for swaptions and caps/floors vary with strike levels. Among
the models allowing to take into account the volatility skew, we mention the
SABR (Stochastic Alpha Beta Rho) model which is a CEV (Constant Elasticity
of Variance) type model with stochastic volatility:

dLt = σtL
β
t d , Wt,
dσt = ασtd , Wσ
t ,
where d , Wtd , Wσ
t = ρdt, α ≥ 0, and 0 < β ≤ 1.
The volatility skew can be produced by both β and ρ.
Exercises
1. Assume we have the following two non-dividend paying asset processes:
dXt = rXtdt + σXXtd , Wt and dYt = rYtdt + σY Ytd , Wt.17.4 Usual Numéraires and the Pricing of Vanilla Interest Rate Options 221
Let Xt be a numéraire and , WX
t its corresponding Brownian motion.
(i) Use the Girsanov Theorem to derive the relation between , WX
t and , Wt.
(ii) Show that
d

Yt
Xt

= (σY − σX)
Yt
Xt
d , WX
t .
2. Let St be a non-dividend paying asset and Pt(T) be a zero coupon bond with
maturity T. Define Fort(T) = St/Pt(T) as the forward price.
(i) Show that Fort(T) = , ET [ST |Ft].
(ii) Recall that the futures price is defined as , E[ST |Ft], a similar structure but
under the basic risk-neutral measure. When will the forward and futures
prices coincide?
3. Let Lt(Ti) be modelled as a positive martingale under, PTi+1,
dLt(Ti) = Lt(Ti)σi(t)d , W
Ti+1
t ,
where σi(t) is deterministic. Derive the time-t value of a floorlet paying
Δi(K − LTi (Ti))+ at time Ti+1.Chapter 18
Foreign Exchange Modelling
In this chapter, we study the modelling of foreign exchange rate for FX options as
well as other derivatives with FX risk exposure. Quanto and composite options are
analyzedindetail.Lastly,wediscussthehedgingofFXriskforderivativesproducts.
## 18.1 Stochastic Model for Foreign Exchange Rate
Assume constant foreign and domestic interest rates rf and rd for simplifying the
notationintheanalysis.Fromthedomesticinvestor’spointofview,foreigncurrency
rate Xt can be considered as an asset paying continuous dividend and erf tXt is
similar to a total asset return process. Hence, under the domestic risk-neutral
measure, Pd (denoted as, P in previous context), the process
erf tXt
erdt
= e−(rd−rf )t
Xt
is a martingale.
Assuming that Xt follows a geometric Brownian motion, its risk-neutral SDE
will be
dXt = (rd
− rf
)Xtdt + σXXtd , Wd,X
t , (18.1)
which is obtained from (13.5).
This model is known as the Garman–Kohlhagen model. The notation , Wd,X
t is
nothing but a Brownian motion under , Pd. The superscript X is used to specify that
the Brownian motion is about Xt as there will be other, Pd-Brownians in this chapter.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_18
223224 18 Foreign Exchange Modelling
As “domestic” and “foreign” are only relative concepts, the same analysis as the
above leads to
d
1
Xt
= (rf
− rd
)
1
Xt
dt − σX
1
Xt
d , W
f, 1
X
t ,
where, Pf is the foreign risk-neutral measure.
It can be checked by applying Itô–Doeblin formula to 1
Xt
in , Pd and the Radon–
Nikodym derivative process for the numéraire change from, Pd to, Pf is
Zt =
erf tXt/X0
erdt
. (18.2)
Cross Rate Volatility
Suppose two foreign exchange rates are given as X1
t and X2
t , say USD/JPY and
USD/CHF, under Garman–Kohlhagen model. The cross rate CHF/JPY, which is
equal to Xt = X1
t /X2
t , satisfies
lnXt = lnX1
t − lnX2
t .
From the normality of lnX1
t and lnX2
t it is easy to find out that the volatility σ of
the cross rate is
σ2
= σ2
1 + σ2
2 − 2ρσ1σ2,
where σ1 and σ2 are the volatilities for X1
t and X2
t and ρ is their correlation.
## 18.2 Pricing Formulas for Vanilla Options and FX Option
Duality
Consider simple call or put options on the FX rate Xt under Garman–Kohlhagen
model. Their payoffs at maturity T are
Nf
(XT − K)+
or Nf
(K − XT )+
respectively. Here Nf is the notional amount in foreign currency written on the
contract, and the payoff is settled in domestic currency. We will drop Nf in the
following because it is just a constant. The closed-form solutions can be derived in
the same way as the BSM formula for stocks paying continuous dividends. They are
also known as the Garman–Kohlhagen formulas:18.3 SDE for Foreign Asset Under Domestic Measure 225
cFX = e−rdT , Ed
[(XT − K)+
|F0] = e−rf T
X0N(d1) − e−rdT
KN(d2),
pFX = e−rdT , Ed
[(K − XT )+
|F0] = e−rdT
KN(−d2) − e−rf T
X0N(−d1),
where
d1 =
ln X0
K +

rd − rf + 1
2σ2
X

T
σX
√
T
and d2 = d1 − σX
√
T.
FX Option Duality
The call option on Ccy1/Ccy2 is actually the put option on Ccy2/Ccy1. This
phenomenon is known as FX Option Duality, which can be verified with the
numéraire change (assuming K = 0):
, Ed
[e−rdT
(XT − K)+
] = , Ed

e−rdT
XT

1 −
K
XT
+

= , Ed

X0e−rf T erf T XT /X0
erdT

1 −
K
XT
+

= KX0e−rf T , Ed

ZT

1
K
−
1
XT
+

= KX0e−rf T , Ef

1
K
−
1
XT
+

. (18.3)
18.3 SDE for Foreign Asset Under Domestic Measure
For pricing certain options linked to foreign assets, it is often necessary to use the
SDE of the foreign assets under the domestic risk-neutral probability measure , Pd.
For instance, for options linked to a basket of assets containing foreign assets, the
option pricing should be using a common risk-neutral measure which is often chosen
as the domestic one. In this section, we will make the analysis and provide the SDE
followed by a foreign asset under, Pd.
Let St be a foreign asset process following the below SDE under the foreign
risk-neutral probability measure, Pf :
dSt = rf
Stdt + σSStd , W
f,S
t , (18.4)226 18 Foreign Exchange Modelling
where , W
f,S
t is a, Pf -Brownian motion. From Girsanov Theorem, there exists θ such
that
, Wd,S
t = , W
f,S
t + θt (18.5)
is a , Pd-Brownian. So, it suffices to determine θ for obtaining the SDE of St under
, Pd.
For the foreign exchange process Xt, we assume (18.1) and d , Wd,S
t d , Wd,X
t =
ρdt.
Proposition 18.1 Under , Pd, the process Yt = XtSt, which can be regarded as a
domestic asset, is given by
dYt = Yt(rd
dt + σY d , Wd,Y
t ),
where σY =

σ2
X + σ2
S + 2ρσXσS and , Wd,Y
t is a, Pd-Brownian.
Proof By Itô’s product rule,
dYt = StdXt + XtdSt + dX,St
= StXt[(rd
− rf
)dt + σXd , Wd,X
t + rf
dt + σSd , W
f,S
t + ρσSσXdt]
= Yt[rd
dt + σXd , Wd,X
t + σS(d , Wd,S
t − θdt) + ρσSσXdt]
= Yt[(rd
+ ρσSσX − θσS)dt + σXd , Wd,X
t + σSd , Wd,S
t ].
Under , Pd, Yt should earn the domestic interest rate rd. From the drift term, we
obtain
rd
+ ρσSσX − θσS = rd
. (18.6)
Furthermore,
σX , Wd,X
t + σS , Wd,S
t =

σ2
X + σ2
S + 2ρσXσS , Wd,Y
t = σY , Wd,Y
t .
Then, we obtain the result. 
Corollary 18.1 The drift θ is determined by
θ = ρσX. (18.7)
This is obtained directly from (18.6).
Now we are ready to give the SDE of foreign asset under, Pd.18.4 Composite Option 227
Proposition 18.2 Under the domestic risk-neutral measure , Pd, the SDE of the
foreign asset St is
dSt = (rf
− ρσSσX)Stdt + σSStd , Wd,S
t . (18.8)
Proof From (18.4), (18.5) and (18.7), we have
dSt = rf
Stdt + σSStd , W
f,S
t = rf
Stdt + σSStd(, Wd,S
t − ρσXdt)
= (rf
− ρσSσX)Stdt + σSStd , Wd,S
t . 
Example 18.1 For options involving XT and ST , Monte Carlo method may be
considered. The simulation of these two processes under , Pd will be based on
Proposition 18.2 and the correlation term embedded. To be specific,
lnSt
lnXt
!
=
lnS0 + (rf − ρσSσX − 1
2σ2
S )t
lnX0 + (rd − rf − 1
2σ2
X)t
!
+
σS
√
t 0
0 σX
√
t
!
1 0
ρ

1 − ρ2
!
1
2
!
where 1 and 2 are independently drawn from a standard normal distribution.
## 18.4 Composite Option
In a composite option, XT ST is in the payoff formula. For instance, the composite
call option has the payoff (XT ST −K)+ at maturity T. Here the strike price K is in
domestic currency.
Obviously, the SDE of Yt = StXt as described in Proposition 18.1 can be used
for option pricing. For example,
ccompo = e−rdT , Ed
[(XT ST − K)+
|F0] = X0S0N(d1) − e−rdT
KN(d2),
where
d1 =
ln X0S0
K + (rd + 1
2σ2
Y )T
σY
√
T
and d2 = d1 − σY
√
T.
One can notice from the composite call option formula that there is no rf
term. Hence there is no foreign interest rate risk in composite options. This is an
important feature for making options on the foreign underlying when there is no
liquid financial instruments in the market for hedging the foreign interest rate risk.228 18 Foreign Exchange Modelling
## 18.5 Quanto Option
In a Quanto option, the payoff is linked to the relative move of the underlying but
paid in domestic currency.
For instance, the quanto call option has the payoff Nd ×

ST
S0
− K
+
at maturity.
For the pricing of the call option, we make use of the stock price process under , Pd
as described in Proposition 18.2. The following assumes Nd = S0 = 1.
cquanto = e−rdT , Ed
[(ST − K)+
|F0] = e−rdT , Ed
[(ST − K)+
]
= e−rdT , Ed
[(S0e(rf −ρσXσS)T−1
2 σ2
S T+σS , Wd,S
T − K)+
]
= e(−rd+rf −ρσXσS)T , Ed
[e−(rf −ρσXσS)T
(S0e(rf −ρσXσS)T−1
2σ2
S T+σS , Wd,S
T − K)+
]
= e(−rd+rf −ρσXσS)T
[S0N(d1) − e−(rf −ρσSσX)T
KN(d2)]
= e−(rd−rf )T
(e−ρσSσXT
S0N(d1) − e−rf T
KN(d2)),
where
d1 =
ln S0
K + (rf − ρσXσS + 1
2σ2
S )T
σS
√
T
and d2 = d1 − σS
√
T.
## 18.6 Discussions on Hedging
For understanding the hedging of an option involving FX risk, we may consider
that the option is linked to a basket of assets and FX rate(s) is part of the underlying
basket. So, the general analysis on basket option should be applicable. Nevertheless,
we provide the below specific analysis due to the importance of such issues.
In the presence of FX risk, the hedging of a short position of a deriva-
tive V(t,St,Xt) is realized through the following self-financing portfolio
Π(t,St,Xt):
• holding ΔS
t units of the asset (stock) St
• holding ΔX
t units of the foreign currency
• financing the position with domestic interest rate rd
• investing the portfolio value Π(t,St,Xt) in money market with rate rd.
In the following, we simplify the notations by dropping the subscript t.
Firstly, the differential of the self-financing portfolio is
dΠ = rd
Πdt + ΔS
d(XS) + ΔX
dX + rf
ΔX
Xdt − rd
(ΔS
XS + ΔX
X)dt,18.6 Discussions on Hedging 229
where the fourth term is the carry return from the holding of foreign currency and
the last term represents the financing cost in domestic currency. Then
dΠ = rd
Πdt + ΔS
[d(XS) − rd
XSdt] + ΔX
[dX − (rd
− rf
)Xdt]
= rd
Πdt + erdt
ΔS
d(e−rdt
XS) + e(rd−rf )t
ΔX
d(e−(rd−rf )t
X)
by reverse-engineering the Itô’s product rule. Hence, denoting & Π = e−rdtΠ and
once again using Itô’s product rule, we obtain
d & Π = ΔS
d(e−rdt
XS) + e−rf t
ΔX
d(e−(rd−rf )t
X). (18.9)
We observe that the discounted portfolio & Π is a martingale because the terms on
the right hand side are martingales under, Pd. From the risk-neutral pricing analysis,
the value of the derivative paying out V(T,ST ,XT ) can be delta-hedged by setting
V(t,St,Xt) = Π(t,St,Xt).
To obtain ΔS and ΔX, we apply Itô–Doeblin formula to & V = e−rdtV and get
d& V =
∂& V
∂S
dS +
∂& V
∂X
dX + [...]dt = e−rdt

∂V
∂S
dS +
∂V
∂X
dX

+ [...]dt,
(18.10)
where the drift term is not our concern and omitted. From (18.9), we have
d & Π = e−rdt
ΔS
[d(XS) − rd
XSdt] + e−rdt
ΔX
[dX − (rd
− rf
)Xdt]
= e−rdt
ΔS
(XdS + SdX) + e−rdt
ΔX
dX + [...]dt,
or,
d & Π = e−rdt
[ΔS
XdS + (ΔX
+ ΔS
S)dX] + [...]dt. (18.11)
From the martingale properties of & Π and & V, the dt terms should be zero. Equating
the dS and dX terms in (18.10) and (18.11), we get:
ΔS
t =
1
Xt
∂V
∂St
and ΔX
t =
∂V
∂Xt
−
St
Xt
∂V
∂St
.
Exercises
1. Assume that the FX rate Xt follows the Garman–Kohlhagen model (18.1) and
the foreign asset process St follows (18.8). Show that for t < T,
, Ed
[XT ST |Ft] = , Ed
[XT |Ft], Ed
[ST |Ft]eρσXσS(T−t)
.230 18 Foreign Exchange Modelling
2. Consider a domestic call option with payoff XT (ST − K)+ at maturity T (here
strikeprice K in foreign currency). Show that its time-0 price equals to the time-0
price of the foreign stock call option multiplied by spot rate X0.
3. Consider a EUR-denominated stock S1, and a USD-denominated stock S2.
EUR/USD represents the exchange rate (units of USD per EUR).
Market data
Name S1 S2 EUR/USD
Volatility 30% 25% 10%
EUR rate (continuous) 0.2%
USD rate (continuous) 0.4%
Correlation S1 ∼ S2 60%
Correlation S1 ∼ EUR/USD −20%
S1 and S2 follow Black–Scholes–Merton model. Assume the below indepen-
dent standard normal variates in the following tables.
Z1 Z2
Trial 1 1.02 0.12
Trial 2 −0.50 −0.10
Trial 3 0.6 0.70
Construct 3 paths in Monte Carlo simulation to price the following 1Y tenor,
USD10m notional amount (N) options:
(i) Call Option: N × max

S2
T
S2
0
− 1,0

(ii) Quanto Call Option: N × max

S1
T
S1
0
− 1,0

(iii) Quanto Worst-of Call Option: N × max

min

S1
T
S1
0
,
S2
T
S2
0

− 1,0

.Part III
Extensions to Financial ModellingChapter 19
Local, Stochastic Volatility Models, Static
Hedging and Variance Swap
## 19.1 Introduction
In this chapter, we first introduce the Kolmogorov equations that describe the
transition probabilities, i.e., how the probability density changes from one time to
another. Next, we talk about asset price models that allow more flexibility in the
volatility term. At last, we discuss how to replicate a European-style option with
call and put options of different strikes. From there, a special contract called the
variance swap will be covered, together with its valuation and hedging. We refer
to [8] for the in-depth analysis on hedging for local volatility model and stochastic
volatility models.
Kolmogorov Equations
Consider the general diffusion process
dXs = θ(s,Xs)ds + φ(s,Xs)dWs.
Let p(t,T;x,y) (0 ≤ t ≤ T) be the transition probability density of Xs. The
forward case assumes t and x “fixed” with Xt = x and p(t,T;x,y) is the
probability density function with state variable y and a future time T. Conversely,
the backward case assumes T and y “fixed” with XT = y and shows the behaviour
of p(t,T;x,y) backwards in time t with state variable x.
The Kolmogorov forward equation, also known as the Fokker–Planck equation,
governs the forward transition probability with t and x fixed.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_19
233234 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
Theorem 19.1 (Kolmogorov Forward Equation)
∂
∂T
p(t,T;x,y) +
∂
∂y
(θ(T,y)p(t,T;x,y)) −
1
2
∂2
∂y2
(φ2
(T,y)p(t,T;x,y)) = 0.
Proof Let h(y) be any C2 function with compact support (such a function vanishes
outside a finite interval).1 From Itô–Doeblin formula,
h(XT ) = h(Xt) +
 T
t
θ(s,Xs)h
(Xs)ds +
 T
t
φ(s,Xs)h
(Xs)dWs
+
1
2
 T
t
φ2
(s,Xs)h
(Xs)ds.
Taking expectation with initial condition Xt = x, we have
Ex
t [h(XT )] = h(x) +
 T
t
Ex
t θ(s,Xs)h
(Xs) +
1
2
φ2
(s,Xs)h
(Xs)
!
ds.
On the other hand, the transition probability is the density that gives
Ex
t [h(XT )] =
 ∞
−∞
h(y)p(t,T;x,y)dy.
Equating the above leads to
 ∞
−∞
h(y)p(t,T;x,y)dy
= h(x) +
 T
t
 ∞
−∞

θ(s,y)h
(y) +
1
2
φ2
(s,y)h
(y)

p(t,s;x,y)dy
!
ds.
From integration by parts and the fact that h and h vanish at ∞:
 ∞
−∞
h(y)p(t,T;x,y)dy = h(x) −
 T
t
 ∞
−∞
h(y)
∂
∂y
(θ(s,y)p(t,s;x,y))dy
!
ds
+
1
2
 T
t
 ∞
−∞
h(y)
∂2
∂y2
(φ2
(s,y)p(t,s;x,y))dy
!
ds.
1For example, the following function h(y) vanishes for y / ∈ (0,b): h(y) = ⎧
⎪ ⎨
⎪ ⎩
e
− 1
1−

2y−b
b
2
, 0 < y < b,
0, otherwise.19.1 Introduction 235
Differentiating w.r.t. T, we obtain that
 ∞
−∞
h(y)
∂
∂T
p(t,T;x,y) +
∂
∂y
(θ(T,y)p(t,T;x,y))
−
1
2
∂2
∂y2
(φ2
(T,y)p(t,T;x,y))
!
dy = 0.
From the arbitrariness of h(y), we get
∂
∂T
p(t,T;x,y)+
∂
∂y
(θ(T,y)p(t,T;x,y))−
1
2
∂2
∂y2
(φ2
(T,y)p(t,T;x,y)) = 0.

The following is the backward case with future time T and state y fixed.
Theorem 19.2 (Kolmogorov Backward Equation)
∂
∂t
p(t,T;x,y) + θ(t,x)
∂
∂x
p(t,T;x,y) +
1
2
φ2
(t,x)
∂2
∂x2
p(t,T;x,y) = 0.
Proof Let h(y) be any C2 function with compact support. From Feynman–Kac
formula, the transition function g(t,x) = Ex
t [h(XT )] =
 ∞
−∞
h(y)p(t,T;x,y)dy
satisfies
∂g
∂t
(t,x) + θ(t,x)
∂g
∂x
(t,x) +
1
2
φ2
(t,x)
∂2g
∂x2
(t,x) = 0,
and hence
 ∞
−∞
h(y)
∂p
∂t
(t,T;x,y) + θ(t,x)
∂p
∂x
(t,T;x,y)
+
1
2
φ2
(t,x)
∂2p
∂x2
(t,T;x,y)
!
dy = 0.
From the arbitrariness of h(y), we obtain
∂p
∂t
(t,T;x,y) + θ(t,x)
∂p
∂x
(t,T;x,y) +
1
2
φ2
(t,x)
∂2p
∂x2
(t,T;x,y) = 0. 236 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
Theorem 19.3 (Breeden–Litzenberger formula) Let c(T,K) be the European
call price with strike K and maturity T. Then
∂2c
∂K2
(T,K) = e−rT
f(T,K),
where f(T,K) is the forward transition probability density, i.e., f(t,x) =
p(0,t;S0,x).
Proof From the risk-neutral representation of the call option price,
c(T,K) = e−rT
 ∞
0
(x − K)+
f(T,x)dx
and hence
c(T,K) = e−rT
 ∞
0
(x − K)+
f(T,x)dx = e−rT
 ∞
K
(x − K)f(T,x)dx
= e−rT
 ∞
K
f(T,x)
 x
K
dydx = e−rT
 ∞
K
 ∞
y
f(T,x)dxdy.
Differentiating w.r.t. K gives
∂c
∂K
(T,K) = −e−rT
 ∞
K
f(T,x)dx,
and differentiating again leads to
∂2c
∂K2
(T,K) = e−rT
f(T,K). 
## 19.2 Local Volatility Model
Compared to BSM model, the local volatility model takes into account the skew and
kurtosis of the distribution of the underlying asset by applying σ(t,St) instead of a
constant σ. Local volatility is widely used for pricing equity derivatives. The SDE
for local volatility model is
dSt = (r − q)Stdt + σ(t,St)Std , Wt,
under risk-neutral probability measure , P, and q is the sum of continuous dividend
yield and repo rate.19.2 Local Volatility Model 237
Theorem 19.4 (Dupire’s formula) For the local volatility model,
σ2
(T,K) = 2
∂T c(T,K) + qc(T,K) + (r − q)K∂Kc(T,K)
K2∂2
KKc(T,K)
.
Proof For notational convenience, we change the notations T and K to t and x
respectively, and hence from Breeden–Litzenberger formula
f(t,x) = ert ∂2c
∂x2
(t,x).
Direct differentiation with respect to t gives
∂f
∂t
= rert ∂2c
∂x2
+ ert ∂
∂t

∂2c
∂x2

.
To further ease the notation, let σ2 denote σ2(t,x) for the time being. The
transition density f satisfies the Kolmogorov forward equation:
∂f
∂t
+
∂
∂x
((r − q)xf(t,x)) −
1
2
∂2
∂x2
(x2
σ2
f(t,x)) = 0
or
∂f
∂t
=
1
2
∂2
∂x2
(x2
σ2
f) − (r − q)

x
∂f
∂x
+ f

.
Replacing f, we get
rert ∂2c
∂x2
+ert ∂
∂t

∂2c
∂x2

= ert 1
2
∂2
∂x2

x2
σ2 ∂2c
∂x2

−(r−q)

xert ∂3c
∂x3
+ ert ∂2c
∂x2

.
Simplifying,
r
∂2c
∂x2
+
∂2
∂x2

∂c
∂t

=
1
2
∂2
∂x2

x2
σ2 ∂2c
∂x2

− (r − q)
∂
∂x

x
∂c
∂x
− c

.
Integrating twice w.r.t x,
rc +
∂c
∂t
=
1
2
x2
σ2
(t,x)
∂2c
∂x2
− (r − q)

x
∂c
∂x
− c

+ αtx + βt.
Assuming that all the terms except αtx + βt in the above go to zero as x goes to
infinity (as the strike price goes to infinity), we get lim
x→∞
(αtx + βt) = 0, ∀t. Hence
αt = βt = 0. We obtain238 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
1
2
x2
σ2
(t,x)
∂2c
∂x2
(t,x) =
∂c
∂t
(t,x) + qc + (r − q)x
∂c
∂x
(t,x),
which is essentially Dupire’s formula. 
Local Volatility in Terms of Implied Volatility and its Derivatives
The Dupire’s formula requires the numerical calculation of the derivatives of call
prices. Actually, Dupire’s formula can be transformed into a function involving the
calculation with implied volatilities instead of the calculation with call option prices
[36, 82, 83]. The calculation with implied volatilities has the advantage of being
more stable.
For calibrating the local volatilities surface with the implied volatilities, it is
convenient to work on an alternative new process defined as & St = St
Ft
where
Ft = S0e(r−q)t. It is easy to see that the SDE for & St is
d& St = σ̂(t,& St)& Std , Wt,
where σ̂(t,& St) = σ(t,Ft& St) and σ is the local volatility for the process St. Let c
denote the call option with payoff max{0,ST − K} at maturity T, and ĉ the call
option with payoff 1
FT
max{0,ST − K} ≡ max{0,& ST − & K} where & K = K
FT
is
the “moneyness” of the option. The time-0 prices of c and ĉ are then related by
c(T,K) = FT e−rT ĉ(T, & K). The Dupire’s formula with ĉ is
σ̂2
(T, & K) =
2∂T ĉ(T, & K)
& K2∂2
& K & K
ĉ(T, & K)
.
In the following, we use t and x to represent T and & K respectively for
brevity. There exists an implied volatility function Σ(t,x) in terms of maturity and
moneyness such that the call price ĉ(t,x) satisfies the Black–Scholes formula,
ĉ(t,x) = N(d1(t,x)) − xN(d2(t,x)),
where d1(t,x) =
−lnx + 1
2Σ(t,x)2t
Σ(t,x)
√
t
and d2(t,x) = d1(t,x) − Σ(t,x)
√
t. Note
that Σ(t,x) equals to the implied volatility parameterized by strike K.
The call price ĉ can be regarded as a function of t, x, and Σ(t,x). Then, the
Dupire’s formula can be revised as σ̂2(t,x) = 2
dĉ
dt
1
x2 d2ĉ
dx2
, where the operator d
stands for total differentiation. The total derivative w.r.t. t is given by19.2 Local Volatility Model 239
dĉ
dt
=
∂ĉ
∂t
+
∂ĉ
∂Σ
∂Σ
∂t
and the second-order total derivative w.r.t. x is
d2ĉ
dx2
=
d
dx

∂ĉ
∂x
+
∂ĉ
∂Σ
∂Σ
∂x

=
d
dx

∂ĉ
∂x

+
d
dx

∂ĉ
∂Σ

∂Σ
∂x
+
∂ĉ
∂Σ
∂2Σ
∂x2
=
∂2ĉ
∂x2
+
∂2ĉ
∂x∂Σ
∂Σ
∂x
+
∂2ĉ
∂Σ∂x
∂Σ
∂x
+
∂2ĉ
∂Σ2

∂Σ
∂x
2
+
∂ĉ
∂Σ
∂2Σ
∂x2
=
∂2ĉ
∂x2
+ 2
∂2ĉ
∂x∂Σ
∂Σ
∂x
+
∂2ĉ
∂Σ2

∂Σ
∂x
2
+
∂ĉ
∂Σ
∂2Σ
∂x2
.
The partial derivatives of ĉ can be obtained from the option formula ĉ(t,x) =
N(d1) − xN(d2), e.g.,
∂ĉ
∂t
= N
(d1)

Σ
2
√
t
+
∂d2
∂t

− xN
(d2)
∂d2
∂t
= N
(d1)
Σ
2
√
t
,
where N(d1) = xN(d2) (see Exercise 2 in Chap.11) is used. Similarly
∂ĉ
∂Σ
= N
(d1)

√
t +
∂d2
∂Σ

− xN
(d2)
∂d2
∂Σ
= N
(d1)
√
t,
∂ĉ
∂x
= N
(d1)
∂d1
∂x
− N(d2) − xN
(d2)
∂d2
∂x
= −N(d2).
And the second-order derivatives are
∂2ĉ
∂Σ2
= N
(d1)
∂d1
∂Σ
√
t = −d1N
(d1)
∂d1
∂Σ
√
t =
d1d2N(d1)
√
t
Σ
,
∂2ĉ
∂x∂Σ
= −N
(d2)
∂d2
∂Σ
= −
N(d1)
x

−
d1
Σ

=
d1N(d1)
xΣ
,
∂2ĉ
∂x2
= −N
(d2)
∂d2
∂x
= −
N(d1)
x

−
1
xΣ
√
t

=
N(d1)
x2Σ
√
t
.
Replacing the partial derivatives of ĉ in
dĉ
dt
and
d2ĉ
dx2
, we have
dĉ
dt
= N
(d1)
Σ
2
√
t
+ N
(d1)
√
t
∂Σ
∂t
=
N(d1)
2Σ
√
t

Σ2
+ 2Σt
∂Σ
∂t

,
d2ĉ
dx2
=
N(d1)
x2Σ
√
t

1 + 2xd1
√
t
∂Σ
∂x
+ x2
d1d2t

∂Σ
∂x
2
+ x2
Σt
∂2Σ
∂x2

.240 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
Hence the calculation formula using the implied volatilities is
σ̂2
(t,x) =
2dĉ
dt
x2 d2ĉ
dx2
=
Σ2 + 2Σt ∂Σ
∂t
1 + 2xd1
√
t ∂Σ
∂x + x2d1d2t
$∂Σ
∂x
%2
+ x2Σt ∂2Σ
∂x2
.
Practical Implementation
The continuum of implied volatilities is needed to calculate the local volatilities.
However, only a set of discrete values is quoted on the market. The following
procedures may be considered for the implementation:
1. For each considered maturity, a smooth, twice differentiable function with few
parameters (say, a quadratic function) is calibrated for representing the implied
volatilities of all strikes. The volatility on both tails can be capped at reasonable
levels
2. The local volatilities are then calculated according to Dupire’s formula with the
parametric function obtained from above.
Because of the asymmetric form of the volatility smile, the parametric function
for the implied volatilities may be composed of two segments, like a quadratic
function calibrated for the left side and another quadratic function calibrated for
the right side, with eventually the forward as the pivoting point.
Remark 19.1 Although the local volatility model is the market standard model for
equity options, it is not suitable for pricing products with forward skew sensitivities
(e.g. the forward starting call-spread or the cliquet options). Suppose the maturity
is T, the option’s starting time is t, and the pricing time is 0. The local volatility
surface is known to become flatter as time goes by. Therefore, the skew will be
progressively lost for the time period [t,T] with increasing t.
## 19.3 Stochastic Volatility Model
Stochastic volatility models take into account the skew/kurtosis of the underlying’s
distribution. They show better dynamics compared to the local volatility model,
which makes them suitable for pricing products with forward skew sensitivities like
cliquet options.
We outline here the Heston model which is one of the most popular stochastic
volatility models [39]. The SDEs of Heston model are

dSt = μStdt +
√
vtStdWt,
dvt = κ(θ − vt)dt + σ
√
vtdXt,19.3 Stochastic Volatility Model 241
where Wt and Xt are correlated Brownians with dW,Xt = ρdt, κ is the mean
reversion speed for the variance vt, θ is the mean reversion level, and σ is the
volatility of volatility (often read as vol of vol).
Denote U(S,v,t) for the option value. The PDE for U can be obtained directly
by applying the following risk premia to produce a “risk-neutral” measure
⎧
⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎩
d , Wt = dWt +
μ − r
√
vt
dt,
d, Xt = dXt +
λ
σ
√
vt
dt,
where λ(S,v,t) is called market price of volatility risk. Applying Itô–Doeblin
formula,
d(e−rt
Ut) = e−rt

∂U
∂t
+
1
2
vS2 ∂2U
∂S2
+ ρσvS
∂2U
∂S∂v
+
1
2
σ2
v
∂2U
∂v2
− rU

dt
+
∂U
∂S
dSt +
∂U
∂v
dvt
!
.
Replacing dSt, dvt and equating [...]dt to 0, we obtain the PDE for Heston model:
∂U
∂t
+
1
2
vS2 ∂2U
∂S2
+ ρσvS
∂2U
∂S∂v
+
1
2
σ2
v
∂2U
∂v2
+ rS
∂U
∂S
− rU
= [−κ(θ − v) + λ(S,v,t)]
∂U
∂v
.
All the parameters in the model are calibrated by the market prices of (vanilla)
options.
The meaning of market price of volatility risk λ(S,v,t) can be shown in the
below. Suppose that we only delta-hedge the option U with the underlying asset:
Πt = Ut − ΔtSt, then
dΠt =

∂U
∂t
+
1
2
vS2 ∂2U
∂S2
+ ρσvS
∂2U
∂S∂v
+
1
2
σ2
v
∂2U
∂v2

dt
+

∂U
∂S
− Δ

dSt +
∂U
∂v
dvt.
Hence, by setting Δt = ∂U
∂S and combining with Heston PDE, we get
dΠt −rΠtdt =
∂U
∂v
dvt +[−κ(θ −v)+λ]
∂U
∂v
dt =
∂U
∂v
[λ(S,v,t)dt +σ
√
vtdXt],242 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
where we have replaced dvt under the actual measure in the Heston model.
We observe that λ(S,v,t) represents the extra return on variance risk through the
term ∂U
∂v .
Closed-Form Solution for European Options Under Heston Model
We outline Heston’s method for the closed-form solution of European call option
price without going into the details. It is based on Fourier transform of the
transitionprobability.Scott,L.generalizedthemethodtojump-diffusionmodelwith
stochastic volatility [77].
Denote τ = T − t.
1. Transform the pricing problem into two probability calculations
Ut = e−rτ, ES,v
t [(ST − K)+
]
= e−rτ, ES,v
t [ST 1{ST >K}] − Ke−rτ, ES,v
t [1{ST >K}]
= SQ{ST > K} − Ke−rτ, P{ST > K} (already presented in BSM model)
= ex
P1(x,v,τ) − Ke−rτ
P2(x,v,τ)
where x = lnS.
2. P1 and P2 are the probabilities (conditional expectations) for the option to
finish in the money when xt and vt follow the stochastic processes in Q and
P. As Feynman–Kac Proposition is applicable to conditional expectations that
are Markovian, we can obtain the PDEs followed by P1 and P2 respectively.
3. Determine the characteristic functions of x at T for Pj (j = 1,2):
fj(x,v;ψ) = , Ej[eiψx
].
As fj(x,v;ψ)(j = 1,2) is a conditional expectation and Markovian, Feynman–
Kac Proposition can be applied to obtain the PDE followed by fj(x,v;ψ). It
can be proved that fj(x,v;ψ) takes the form of eCj(τ;ψ)+Dj(τ;ψ)v+iψx. For
obtaining Cj(τ;ψ) and Dj(τ;ψ), we apply fj(x,v;ψ) to the PDE, which
results in two ODEs (Riccati equations) that can be solved analytically.
4. Calculate Pj with the characteristic functions fj(x,v;ψ),
Pj =
1
2
+
1
π
 ∞
0
Re
)
e−iψ ln(K)fj(x,v;ψ)
iψ
*
dψ.19.4 Static Hedging for European Style Options 243
Numerical Approaches for Closed-Form Solution
The main task is to evaluate P1 and P2. The integrand is calculated using fj at
each discretized ψ and the integral can be approximated by numerical integration
approach like the trapezoidal rule. The two integrals in P1 and P2 can also be
combined to reduce the computational cost.
An alternative approach is to apply the Carr–Madan formula [15], in which the
fast Fourier transform is carried out for the numerical integration and a damping
factor for the option price is used to handle the singularity near ψ = 0.
## 19.4 Static Hedging for European Style Options
Static hedging, which is opposite to dynamic hedging, does not adjust the hedging
portfolio once it has been set up. In this section, an important result is first presented,
i.e., any European style option can be hedged statically by calls and puts provided
that there are calls and puts with any strike price in the market.
Proposition 19.1 Any European style option can be (theoretically) hedged with a
static portfolio of calls and puts:
, ESt
t [e−r(T−t)
h(ST )] (19.1)
= e−r(T−t)
(h(λ) + h
(λ)(F − λ)) +
 ∞
λ
h
(K)c(K)dK +
 λ
0
h
(K)p(K)dK,
where h is a twice differentiable payoff function, St is the asset price at time t,
F = , ESt
t [ST ] is the forward price of the asset, r is the constant interest rate, c(K)
and p(K) are European call and put prices of strike K, and λ is any fixed level of
the asset price. In particular when λ = F, the formula is reduced as
e−r(T−t)
h(F) +
 ∞
F
h
(K)c(K)dK +
 F
0
h
(K)p(K)dK.
Proof We first prove a general decomposition of a twice differentiable function h:
h(S) = h(λ) + 1{S>λ}
 S
λ
h
udu − 1{S<λ}
 λ
S
h
udu
= h(λ) + 1{S>λ}
 S
λ

h
(λ) +
 u
λ
h
(v)dv

du
− 1{S<λ}
 λ
S

h
(λ) −
 λ
u
h
(v)dv

du244 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
= h(λ) + h
(λ)(S − λ) + 1{S>λ}
 S
λ
 u
λ
h
(v)dvdu + 1{S<λ}
 λ
S
 λ
u
h
(v)dvdu
= h(λ) + h
(λ)(S − λ) + 1{S>λ}
 S
λ
 S
v
h
(v)dudv + 1{S<λ}
 λ
S
 v
S
h
(v)dudv
= h(λ) + h
(λ)(S−λ)+1{S>λ}
 S
λ
h
(v)(S−v)dv+1{S<λ}
 λ
S
h
(v)(v − S)dv
= h(λ) + h
(λ)(S − λ) +
 ∞
λ
h
(v)(S − v)+
dv +
 λ
0
h
(v)(v − S)+
dv.
Now, setting S = ST , denoting v = K, multiplying both sides by discount
factor e−r(T−t), and taking conditional expectation, we obtain the static hedging for
a generalized European option:
, ESt
t [e−r(T−t)
h(ST )]
= e−r(T−t)
[h(λ) + h
(λ)(F−λ)]+
 ∞
λ
h
(K)c(K)dK+
 λ
0
h
(K)p(K)dK. 
From the above formula, in order to replicate the contingent claim on the left
hand side, we need a continuously changing value K to complete the two integrals
on the right hand side. In practical implementation, approximations will be applied
because the calls and puts in the market only have a discrete set of strike prices.
A useful special case is the payoff of a log contract, i.e., h(ST ) = ln(ST ). The
static hedging representation is given by
, ESt
t [ln(ST )] = ln(λ) +
F − λ
λ
− er(T−t)
 ∞
λ
c(K)
K2
dK +
 λ
0
p(K)
K2
dK
!
.
(19.2)
The equation (19.2) will be used for pricing and hedging the variance swap.
## 19.5 Variance Swap
A variance swap is an agreement to exchange the realized variance V during a
fixed maturity T with n business days for a pre-specified variance strike Kvar in
the contract. The payoff at maturity is given by
Nvar(V − Kvar),
where Nvar is a notional amount which converts the units from variance to
denominated currency on the contract. One way to calculate V is the estimator for
sample variance19.5 Variance Swap 245
V =
252
n
n
i=1

ln
Si
Si−1
2
,
in which the sample mean is negligible and selected as 0, and the number 252 is the
annualization factor representing the number of business days in a year.
The contract often contains volatility linked quantities that people are more
familiar with (but do not confuse it with volatility swap). Suppose a volatility swap
has volatility strike Kσ, notional amount Nvega, and payoff Nvega(
√
V − Kσ). The
term Nvega is also known as the vega notional because the volatility swap payoff
would be Nvega if the
√
V − Kσ is 1 volatility point. Then we have the following
two relations between variance and volatility swaps:
Kσ =

Kvar and Nvega = Nvar × 2Kσ.
Given Nvega, one can determine the notional number Nvar according to the above
relation. This is done in order to make volatility and variance swaps comparable.
Note that variance swaps usually have a cap in the payoff formula (especially for
single stocks) for controlling the risk to an acceptable level (stock price could
become zero).
Valuation of Variance Swap
Proposition 19.2 Assume that the underlying follows the model
dSt = rStdt + σtStd , Wt,
where there is no dividend but σt can be stochastic itself. We have the valuation of
variance swap which is independent of the modelling for the volatility σt:
Price of Variance Swap = Nvar(, E[V] − Kvar)e−rT
,
where V = 1
T
T
0 σ2
t dt,
, E[V] =
2
T
ln

F
λ

+
λ − F
λ
+ erT
 ∞
λ
c(K)
K2
dK + erT
 λ
0
p(K)
K2
dK
!
.
Inother words,the variance swap can be theoretically priced and hedged by aseries
of calls and puts.
Proof Applying Itô–Doeblin formula to ln(St), we get
d ln(St) =
dSt
St
−
1
2
(dSt)2
S2
t
=
dSt
St
−
1
2
σ2
t dt.246 19 Local, Stochastic Volatility Models, Static Hedging and Variance Swap
After integration it becomes
ln(ST ) = ln(S0) +
 T
0
dSt
St
−
1
2
 T
0
σ2
t dt.
Then the total variance is equal to
V =
1
T
 T
0
σ2
t dt =
2
T
ln(S0) +
 T
0
dSt
St
− ln(ST )
!
=
2
T
ln(S0) + rT +
 T
0
σtd , Wt − ln(ST )
!
=
2
T
ln(F) +
 T
0
σtd , Wt − ln(ST )
!
since the forward value is F = S0erT with constant r. Taking the (conditional)
risk-neutral expectation on both sides and making the substitution (19.2), we obtain
, E[V] =
2
T
"
ln(F) −, E[ln(ST )]
#
=
2
T
ln

F
λ

+
λ − F
λ
+ erT
 ∞
λ
c(K)
K2
dK + erT
 λ
0
p(K)
K2
dK
!
. 
Usually the value λ is chosen to be F = S0erT such that the formula is greatly
simplified as
, E[V] =
2erT
T
 ∞
F
c(K)
K2
dK +
 F
0
p(K)
K2
dK
!
.
Exercises
1. (i) Derive the Kolmogorov forward equation for the Brownian motion Wt.
(ii) Verify that the following transition probability function
p(t,T;x,y) =
1
√
2π(T − t)
e−(y−x)2
2(T−t)
satisfies the equation in (i).
2. Use the Breeden–Litzenberger formula and perform ∂2
∂K2 on the Black–Scholes
call price c (assuming zero dividend) to recover the log-normal probability
density function of the underlying at maturity T, i.e.,
f(T,K) =
1
Kσ
√
2πT
e
−
[lnK−lnS0−(r− 1
2 σ2)T]2
2σ2T ,
where K is also the dummy variable of the underlying.19.5 Variance Swap 247
3. Assume that the underlying follows the classic Black–Scholes–Merton model
dSt = rStdt + σStd , Wt.
Let
f(S,σ) =
2erT
T
 ∞
SerT
c(S,K,σ)
K2
dK +
 SerT
0
p(S,K,σ)
K2
dK

where S is the spot price and σ is the implied volatility of c(S,K,σ) and
p(S,K,σ), the Black–Scholes call and put prices respectively with strike price
K and time to maturity T.
(i) Show that
∂c
∂σ
=
∂p
∂σ
and then derive
∂f
∂σ
.
(ii) Show that
∂2f
∂S∂σ
= 0.Chapter 20
Jump-Diffusion Models
Market prices of financial assets often show jumps caused by unpredictable events
or news. The market closing-opening is also a source of price jumps. The pure
Brownian motion based diffusion models do not admit large asset price move in
a short period of time. Adding jumps to diffusion can show skewed distributions
with fat tail which are difficult to produce from BSM model.
In this chapter, we give an introduction to jump processes and jump-diffusion
models. For detailed mathematical analysis, we refer to [79].
## 20.1 Compound Poisson Process
The jump size for a Poisson process Nt is always 1. The Compound Poisson process
Gt extends the Poisson process by taking i.i.d. random variables for the jump sizes:
Gt =
Nt
i=1
νi, t ≥ 0,
where νi represents the random variable for the i-th jump with E[νi] = η, ∀i. Let λ
denote the intensity for the Poisson process. Here are some properties of compound
Poisson process:
(i) Mean: E[Gt] = ηλt
(ii) Martingale property: Gt − ηλt = Gt − E[Gt] is a martingale
(iii) Independent and stationary increments: Gt − Gs
(d)
⇐⇒ Gt−s.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_20
249250 20 Jump-Diffusion Models
## 20.1.1 Simulating a Poisson Process and Compound Poisson
Process
The key of simulating a Poisson process Nt lies in the arrival times Ti, where
their differences are i.i.d. exponentially distributed random variables. Consider
generating NT , T > 0 starting from N0 = 0. The procedure is as follows (assuming
T0 = 0):
1. generate a uniform variable ui ∈ U [0,1]
2. generate an exponential variable τi = −1
λ lnui and calculate an arrival time by
Ti = Ti−1 + τi (if Ti > T then stop the procedure)
3. let Nt = i for [Ti,Ti+1).
Here the inverse sampling is performed and two facts are used: firstly ui and 1 − ui
are equivalent, and the inverse c.d.f. of exponential distribution is explicit.
Simulating Gt issimilarlydone once thedistributionofjump sizes νi isspecified.
## 20.2 Stochastic Calculus for Jump-Diffusion Processes
Let Ft be the natural filtration generated by Wt and Gt. Next we introduce the
stochastic calculus for jump processes. A pure jump process, denoted by Jt, has
finite jumps in any time interval and is constant between jumps. Also it is assumed
that no jump takes place at time 0 and J0 = 0 is the initial value. The Poisson
process Nt and compound Poisson process Gt are pure jump processes. For pure
jump processes, we have
dJt = δJt = Jt − Jt− = (Jt − Jt−)dNt.
We define a jump-diffusion process as a right continuous process as follows:
Xt = X0 +
 t
0
θudu +
 t
0
φudWu + Jt,
where θu and φu are adapted processes. Note that Xc
t ≡ X0 +
t
0 θudu +
t
0 φudWu
is the continuous Itô process in the earlier context. The addition of Jt introduces a
finite number of jumps to Xc
t in finite time. Since δXt = δJt, the jump process can
also be written as
Xt = Xc
t + Jt = Xc
t +
0<u≤t
δJu = Xc
t +
0<u≤t
δXu.20.2 Stochastic Calculus for Jump-Diffusion Processes 251
In differential form, we have dXt = dXc
t + dJt.
Previously it is shown that a stochastic integration with continuous martingale
integrator and predictable integrand gives a martingale. This property can be
extended when the integrator is a martingale with jumps. See [66] for more details.
The calculus of jump-diffusion processes is given below. The proofs can be found
in [79].
Proposition 20.1 The cross variation for two jump-diffusion processes Xt = Xc
t +
JX
t and Yt = Yc
t + JY
t is given by
X,Yt = Xc
,Yc
t + JX
,JY
t =
 t
0
φX
u φY
u du +
0<u≤t
δJX
u δJY
u ,
or in the differential form dX,Yt = dXc,Yct + dJX,JY t. In particular, the
cross variation of any continuous process Xc
t and pure jump process Jt is zero, i.e.,
Xc
,Jt = 0. (20.1)
Theorem 20.1 (One-Dimensional Itô–Doeblin Formula for Jump-Diffusion
Process) Let f(u,x) be a sufficiently smooth function of real variables u and x.
Suppose Xu is a jump process. Then for u < t,
f(t,Xt) = f(0,X0) +
 t
0
fu(u,Xu)du +
 t
0
fx(u,Xu)dXc
u
+
1
2
 t
0
fxx(u,Xu)dXc
,Xc
u +
0<u≤t
[f(u,Xu) − f(u,Xu−)],
where fu(u,Xu) = ∂f
∂u(u,Xu), fx(u,Xu) = ∂f
∂x (u,Xu) and fxx(u,Xu) =
∂2f
∂x2 (u,Xu).
The difference from the ordinary Itô’s formula lies in the last term.
Theorem 20.2 (Two-Dimensional Itô–Doeblin Formula for Jump-Diffusion
Process) Let Xu and Yu be jump processes and f(u,x,y) whose derivatives
appearing in the below are defined and continuous. Then
f(t,Xt,Yt) = f(0,X0,Y0) +
 t
0
fu(u,Xu,Yu)du +
 t
0
fx(u,Xu,Yu)dXc
u
+
 t
0
fy(u,Xu,Yu)dYc
u +
1
2
 t
0
fxx(u,Xu,Yu)dXc
,Xc
u252 20 Jump-Diffusion Models
+
 t
0
fxy(u,Xu,Yu)dXc
,Yc
u +
1
2
 t
0
fyy(u,Xu,Yu)dYc
,Yc
u
+
0<u≤t
(f(u,Xu,Yu) − f(u,Xu−,Yu−)).
The two dimensional Itô’s formula leads to the following Itô’s product rule.
Corollary 20.1 (Itô’s Product Rule for Jump Processes) Let Xt and Yt be two
jump processes. Then,
XtYt = X0Y0 +
 t
0
YudXc
u +
 t
0
XudYc
u + Xc
,Yc
t +
0<u≤t
(XuYu − Xu−Yu−),
which can be equivalently written as integration by parts:
XtYt = X0Y0 +
 t
0
Yu−dXu +
 t
0
Xu−dYu + X,Yt.
## 20.3 Jump-Diffusion Asset Pricing Model
The jump-diffusion model assumes that, under the original probability measure P,
the SDE for the asset is
dSt = μStdt + σStdWt + St−d(Gt − ηλt).
The diffusion part is the same as Black–Scholes model. The additional jump part
is given by the compensated compound Poisson process Gt − ηλt, which is a P-
martingale. The jump νi’s are i.i.d. random variables and we assume that they have
continuous distribution with density f(y) satisfying νi ≥ −1 (as St becomes 0 for
νi = −1). For example, in Merton’s model [57], νi = Xi − 1 where Xi follows
log-normal distribution. The term η is the expected jump size with η = E[νi] =  ∞
−1
yf(y)dy.
Define, P with a Radon–Nikodym derivative Zt:
d, P
dP





Ft
= Zt = e−θWt−1
2θ2t
, with θ =
μ − r
σ
.
Then, under , P, , Wt = Wt + θt is a Brownian and the discounted asset price is a
martingale. The measure, P implies20.4 European Call or Put Option Pricing 253
dSt = rStdt + σStd , Wt + St−d(Gt − ηλt). (20.2)
Note that, P is not a unique risk-neutral measure. The case presented here states that
the real-world and risk-neutral distribution for the jumps are identical, thus keeping
the intensity and expected jump size, λ and η unchanged.
Proposition 20.2 The solution to (20.2) under, P is
St = S0eσ , Wt+(r−ηλ−1
2 σ2)t
Nt 
i=1
(νi + 1).
Proof Consider the pure jump process Zt =
Nt 
i=1
(νi + 1) =

0<s≤t
(1 + δGs) which
satisfies dZt = Zt−dGt. Define a continuous process Sc
t = S0eσ , Wt+(r−ηλ−1
2 σ2)t
,
which is a geometric Brownian motion solving
dSc
t = (r − ηλ)Sc
t dt + σSc
t d , Wt.
From (20.1), Sc,Zt = 0. Applying Itô’s product rule to St = Sc
t Zt,
St = Sc
t Zt = S0 +
 t
0
Sc
udZu +
 t
0
Zu−dSc
u
= S0 +
 t
0
Sc
uZu−dGu + (r − ηλ)
 t
0
Zu−Sc
udu + σ
 t
0
Zu−Sc
ud , Wu
= S0 + r
 t
0
Sudu + σ
 t
0
Sud , Wu +
 t
0
Su−d(Gu − ηλu).
The differential form of the above is the SDE (20.2). 
The solution St has the jump size of δSt = St − St− = St−δGt, which leads to
(St − St−)dNt = St−dGt. This will be used later for discussion of hedging.
## 20.4 European Call or Put Option Pricing
Consider a European call or put option with strike price K and maturity T.
Theorem 20.3 Assume the stock price follows the jump-diffusion model (20.2).
Then, the risk-neutral price of a European call or put
Vt = , E[e−r(T−t)
h(ST )|Ft], h(ST ) = (ST − K)+
or (K − ST )+
,254 20 Jump-Diffusion Models
is given by
Vt =
∞
n=0
e−λτ (λτ)n
n!
, E[BS(τ,S̄(νi,n))],
where the time to maturity T − t is denoted as τ,
S̄(νi,n) = Ste−ηλτ
n 
i=1
(νi + 1),
and BS(τ,S̄) is the BSM call or put option formula with τ as tenor and S̄ as spot.
Proof
Vt = , E[e−rτ
h(ST )|Ft]
= , E

e−rτ
h
)
Steσ , Wτ +(r−ηλ−1
2 σ2)τ
Nτ 
i=1
(νi + 1)
*
,
where the properties of independent and stationary increments are used. Using the
law of total expectation with the probability of n jumps,
Vt = , E

, E

e−rτ
h
)
Steσ , Wτ +(r−ηλ−1
2 σ2)τ
Nτ 
i=1
(νi + 1)
*




Nτ = n

=
∞
n=0
e−λτ (λτ)n
n!
, E

e−rτ
h
)
Steσ , Wτ +(r−ηλ−1
2 σ2)τ
n 
i=1
(νi + 1)
*
=
∞
n=0
e−λτ (λτ)n
n!
, E[e−rτ
h(S̄(νi,n)eσ , Wτ +(r−1
2 σ2)τ
)]
=
∞
n=0
e−λτ (λτ)n
n!
, E[, E[e−rτ
h(S̄(νi,n)eσ , Wτ +(r−1
2 σ2)τ
)|Ft]]
=
∞
n=0
e−λτ (λτ)n
n!
, E[BS(τ,S̄(νi,n))].

One can see that the pricing formula is a summation of Black–Scholes prices
multiplied by the corresponding probability of jumps, or in other words, an
expectation over all jump occurrences. The pricing formula can be further simplified
as a closed-form solution under Merton’s lognormal jump-diffusion model; see [57]
for reference.20.5 PIDE for a European Style Option 255
20.5 PIDE for a European Style Option
Consider a T-maturity European option price V(t,St) with underlying St at time t.
We have the following theorem for the governing equation of V.
Theorem 20.4 Assume the underlying stock follows the jump-diffusion model
(20.2). The price V(t,St) for a European style option paying out V(T,ST ) at
maturity T satisfies the PIDE (partial integro-differential equation):
∂V
∂t
+ (r − ηλ)St
∂V
∂St
+
1
2
σ2
S2
t
∂2V
∂S2
t
+ λ{, E[V(t,(ν + 1)St−)] −V(t,St−)} = rV,
where , E[V(t,(ν + 1)St−)] =
 ∞
−1
V(t,(z + 1)St−) ˜ f(z)dz if jump density ˜ f is
known.
Proof Denote the process At = −rV +
∂V
∂t
+ (r − ηλ)St
∂V
∂St
+
1
2
σ2
S2
t
∂2V
∂S2
t
.
Applying Itô’s formula and product rule, we have
e−rtVt = V0+
 t
0
e−ruAudu+
 t
0
e−ruσSu
∂V
∂Su
d , Wu+
0<u≤t
e−ru[V(u,Su)−V(u,Su−)].
If the jump happens at time u, then Su = (ν + 1)Su−. Therefore, the last term is
0<u≤t
e−ru
[V(u,Su)−V(u,Su−)] =
 t
0
e−ru
[V(u,(ν+1)Su−)−V(u,Su−)]dNu.
Splitting the integrator into dNu = d(Nu − λu) + λdu,
e−rt
Vt = V0 +
 t
0
e−ru
Audu +
 t
0
e−ru
σSu
∂V
∂Su
d , Wu
+
 t
0
e−ru
[V(u,(ν + 1)Su−) − V(u,Su−)]d(Nu − λu)
+
 t
0
e−ru
[V(u,(ν + 1)Su−) − V(u,Su−)]λdu.
Taking expectation, terms with d , Wu and d(Nu − λu) become 0. Then,
, E[e−rt
Vt|F0] = V0+
 t
0
e−ru
Audu+
 t
0
e−ru
{, E[V(u,(ν+1)Su−)]−V(u,Su−)}λdu.256 20 Jump-Diffusion Models
Because e−rtVt should be a martingale under , P, the du term should be 0, which
proves the result. 
Applying the PIDE, we obtain
e−rt
Vt = V0 −
 t
0
e−ru
λ{, E[V(u,(ν + 1)Su−)] − V(u,Su−)}du
+
 t
0
e−ru
σSu
∂V
∂Su
d , Wu +
 t
0
e−ru
[V(u,Su) − V(u,Su−)]dNu,
(20.3)
which will be later used in the context of hedging.
## 20.6 Discussion on Hedging Under Jump-Diffusion Model
We conduct the analysis on a short call position. The delta hedging portfolio for the
call c(t,St) is Πt which satisfies
dΠt = rΠtdt + Δt(dSt − rStdt),
with Π0 = c(0,S0). Then,
d(e−rt
Πt) = e−rt
(−rΠtdt + dΠt) = e−rt
(ΔtdSt − rΔtStdt)
= e−rt
[ΔtσStd , Wt + ΔtSt−d(Gt − ηλt)]
= e−rt
[ΔtσStd , Wt + Δt(St − St−)dNt − ΔtSt−ηλdt],
where we use dGt =
St − St−
St−
dNt. From (20.3), we have
d(e−rt
c(t,St)) = e−rt

− λ
 ∞
−1
[c(t,(z + 1)St−) − c(t,St−)] ˜ f(z)dz
!
dt
+ σSt
∂c
∂St
(t,St−)d , Wt + [c(t,St) − c(t,St−)]dNt

.
Applying Δt =
∂c
∂St
(t,St−) and η =
∞
−1 z ˜ f(z)dz, the hedging result for time
interval dt is20.6 Discussion on Hedging Under Jump-Diffusion Model 257
d(e−rt
Πt − e−rt
c(t,St))
= e−rt

λ
 ∞
−1
[c(t,(z + 1)St−) − c(t,St−) − zSt−
∂c
∂St
(t,St−)] ˜ f(z)dz
!
dt
− [c(t,St) − c(t,St−) −
∂c
∂St
(t,St−)(St − St−)]dNt

.
As the function c(t,x) is strictly convex in x, we have
c(t,x2) − c(t,x1) > (x2 − x1)
∂c
∂x
(t,x1), for all x2 > x1 ≥ 0.
Therefore,
• between jumps, the hedging portfolio outperforms the option
(in this case, dNt is 0 and c(t,(z + 1)St−) − c(t,St−) > zSt−
∂c
∂St
(t,St−) so
that d(e−rtΠt − e−rtc(t,St)) > 0)
• at jump times, the option outperforms the hedging portfolio
(because c(t,St) − c(t,St−) >
∂c
∂St
(t,St−)(St − St−))
• the expected difference is zero.
Exercises
1. Let Xt and Yt be two jump processes. Show that
 t
0
Yu−dXu +
 t
0
Xu−dYu + X,Yt =
 t
0
YudXc
u +
 t
0
XudYc
u + Xc
,Yc
t
+
0<u≤t
(XuYu − Xu−Yu−).
2. Consider a stock modelled by Merton’s default model [58], which is a special
jump diffusion model with one jump to zero value, i.e., η = −1 in (20.2) and
also ν = −1.
(i) Derive the governing PIDE for a European call option with strike K and
maturity T on this stock.
(ii) Obtain its time-t price.258 20 Jump-Diffusion Models
3. Consider a stock modelled by Merton’s jump-diffusion model [57] where
νi = Xi − 1 and Xi follows i.i.d. log-normal distribution, i.e., log(Xi) ∼
N (μJ ,σ2
J ).
(i) Show that 1 + η = eμJ +1
2 σ2
J .
(ii) Show that the European call/put option price is given as
∞
n=0
e−λ̄τ (λ̄τ)n
n!
BS(τ,St,σn,rn)
where λ̄ = λ(1 + η), BS is the classic Black–Scholes call/put prices with
proxy volatility σn =

σ2 +
nσ2
J
τ and proxy risk-free rate rn = r − λη +
nlog(1+η)
τ .Chapter 21
Interest Rate Term Structure Modelling
In Part II Chap.17, we have presented the pricing for Vanilla interest rate products
which do not require the modelling of interest rate term structure. However,
structures with the features such as path-dependency or callability usually require
the modelling of term structure for pricing and risk management. In this chapter, we
first present the concepts and the relationships between zero coupon bond, short rate
and forward rate which are essential for interest rate term structure modelling. Then
we introduce the Heath–Jarrow–Morton framework with the no-arbitrage condition,
which will give birth to different short rate models. Lastly we study the Libor market
model which is more and more used in practice.
As the interest rate term structure modelling is fairly complicated, we limit the
presentation to the basic concepts and important results. For a comprehensive study
and practical implementation, we refer to [2–4].
## 21.1 Continuous-Time Modelling of Interest Rate
There are different models for describing the dynamics of the term structure of
interest rates. The definition of interest rates used in a model (known as “state-
variables”) is often different from the interest rates implied from the contracts
of financial instruments. Actually, the interest rates related measures can be
constructed from the state variables. The principal component analysis (PCA) on
historical data of interest rates confirmed that the dynamics of the term structure
are mainly explained by 3 factors: the first factor for parallel shift, the second for
yield curve pivoting and the third for curvature change. For describing the dynamics
of the term structure, models with more than 2 factors would give satisfaction if
efficient computation algorithms can be implemented.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_21
259260 21 Interest Rate Term Structure Modelling
## 21.1.1 Zero Coupon Bond
In continuous-time modelling, the zero coupon bonds (also known as discount
bond), denoted by Pt(T), are considered as the base tradable assets. A zero coupon
bond Pt(T) represents the time-t value of an instrument paying out $1 value at
maturity T. The probability, P under which the discounted zero coupon bond prices
are martingales is called the risk-neutral probability measure which allows dynamic
hedging of derivatives instruments.
The zero coupon bonds for different maturities can be extracted from
market traded instruments as explained in Part I, Chap.2, Section “Yield Curve
Construction”. Conversely, any interest rate instrument in the market can be
represented by zero coupon bonds. For pricing interest rate derivatives, we usually
need zero coupon bonds and stochastic discount factors (e.g. e−
t
0 rudu
) under , P
with term structure models.
Example 21.1 The forward USD 3M Libor rate at time T can be represented by
Pt(T)
Pt(T + 3M)
− 1
!1
δ(T,T+3M) ,
where the year fraction δ(T,T+3M) is calculated with the relevant day count
convention.
## 21.1.2 Short Rate rt
Theshortratert isthestochasticinstantaneousinterestratepreviouslyusedtodefine
the money market account numéraire
Mt = e
t
0 rudu
and Mt represents the accrued value of $1 at time t.
Relationship between the market price of zero coupon bond Pt(T) and the short
rate rt is as follows. From the risk-neutral pricing formula Pt(T) = Mt, E[PT (T)
MT
|Ft]
and PT (T) = 1, we obtain
Pt(T) = , E[e−
T
t rudu
|Ft]. (21.1)
21.1.3 Forward Rate ft(T)
The time-t discrete forward rate for the time interval (T,T + δT) is defined by the
following Ft-measurable stochastic process ft(T,T + δT):21.2 Heath–Jarrow–Morton Framework 261
ft(T,T + δT) = −
lnPt(T + δT) − lnPt(T)
δT
,
which satisfies
exp(−ft(T,T + δT)δT) =
Pt(T + δT)
Pt(T)
,
i.e., the interest rate at time t to borrow between T and T + δT. Then, the forward
rate is defined as
ft(T) = lim
δT→0
−
lnPt(T + δT) − lnPt(T)
δT
= −
∂lnPt(T)
∂T
.
Relationship between the market price of zero coupon bond Pt(T) and the forward
rate is
Pt(T) = e−
T
t ft(u)du
.
Note that when t = T, the forward rate is reduced as the short rate rt = ft(t).
## 21.2 Heath–Jarrow–Morton Framework
The Heath–Jarrow–Morton (HJM) framework analyzes the properties of no-
arbitrage interest rate term structure models. It models the dynamics of forward
rate as
ft(T) = f0(T) +
 t
0
αu(T)du +
 t
0
σu(T) · dWu,
whereσt(T)andtheBrownianmotionWt aren-dimensionalprocessesandaninner
product is carried out for the last term. The particular specification of the terms
αt(T) and σt(T) will lead to different modelling choices for ft(T). An assumption
of no-arbitrage will relate αt(T) and σt(T) and give the HJM no-arbitrage model
for ft(T).
Proposition 21.1 (HJM Non-Arbitrage Model)
⎧
⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎩
ft(T) = f0(T) +
 t
0
, αu(T)du +
 t
0
σu(T) · d , Wu,
, αt(T) = σt(T) ·
 T
t
σt(u)du (known as “HJM no-arbitrage condition”),262 21 Interest Rate Term Structure Modelling
where , Wt is an n-dimensional vector of Brownians under , P, the money market
account risk-neutral probability measure.
Proof Under interest rate modelling, the zero coupon bonds are tradable assets
with strictly positive values. Hence, under , P, any zero coupon bond deflated by
the numéraire Mt = e
t
0 rudu
is a martingale, which implies
dPt(T)
Pt(T)
= rtdt − σP
t (T) · d , Wt.
Here the minus sign before σP is for notational convenience because it can be
absorbed into the Brownian motion. Then by Itô’s lemma,
d lnPt(T) = rt −
1
2
σP
t (T) · σP
t (T)
!
dt − σP
t (T) · d , Wt
or
lnPt(T) = lnP0(T) +
 t
0
ru −
1
2
σP
u (T) · σP
u (T)
!
du −
 t
0
σP
u (T) · d , Wu.
From ft(T) = −
∂ lnPt(T)
∂T
, we obtain
dft(T) =
∂σP
t (T)
∂T
· σP
t (T)dt +
∂σP
t (T)
∂T
· d , Wt.
Defining σt(T) =
∂σP
t (T)
∂T
, we have
dft(T) =

σt(T) ·
 T
t
σt(u)du

dt + σt(T) · d , Wt
since
T
t σt(u)du = σP
t (u)|T
t and σP
t (t) = 0. 
We note that f0(T) can be obtained from the market quoted zero coupon prices
P0(T) with f0(T) = −∂lnP0(T)
∂T . It means that at time-0, HJM model is consistent
with the market price for the interest rate instruments which can be composed of
zero coupon bonds. Therefore, HJM model is arbitrage-free by construction.
From the no-arbitrage condition, we see that σt(T) specifies the entire model.
A particular implementation of HJM model consists of a specification of σt(T). In
particular, the risk-neutral SDE for Pt(T) is also specified by σt(T) as
dPt(T)
Pt(T)
= rtdt −
 T
t
σt(u)du · d , Wt. (21.2)21.2 Heath–Jarrow–Morton Framework 263
TheproblemofthegeneralformofHJMmodelisthat,forobtainingthezerocoupon
bonds between (t1,t2), a continuum of ft(s), (t1 ≤ s ≤ t2) is required. In the
practical implementation, the reduction of the dimensions is realized through the
following approaches:
• applying particular specification of σt(T) for obtaining lower dimensional
Markovian models (cf. short rate model);
• modelling the discrete forward rate ft(t1,t2) directly (cf. LMM model in
Sect.21.4).
## 21.2.1 No-Arbitrage Short Rate Model
Under , P, the modelling of short rate rt often requires a few factors for describing
the dynamics of the whole term structure. Any no-arbitrage short rate model should
satisfy the HJM model as
rt = ft(t) = f0(t) +
 t
0
, αu(t)du +
 t
0
σu(t) · d , Wu. (21.3)
It is straightforward to get the mean and variance of rt, when σ is deterministic:
, E[rt] = f0(t) +
 t
0
, αu(t)du and 0 Var(rt) =
 t
0
σu(t) · σu(t)du.
## 21.2.2 Markovian Characterization for Short Rate Models
Performing differential1 on (21.3), we obtain the SDE for rt,
drt = dft(t) = f
0(t)dt+, αt(t)dt+
 t
0
∂, αu(t)
∂t
dudt+σt(t)·d , Wt+
 t
0
∂σu(t)
∂t
·d , Wudt
1We know that d
 t
0
f(t,u)du

= f(t,t)dt +
 t
0
df(t,u)du for any smooth function f(t,u).
Actually,d
 t
0
f(t,u)du

= lim
Δt→0
 t+Δt
0
f(t + Δt,u)du −
 t
0
f(t,u)du
!
= lim
Δt→0
 t+Δt
t
f(t + Δt,u)du +
 t
0
f(t + Δt,u)du −
 t
0
f(t,u)du
!
= f(t,t)dt +
 t
0
df(t,u)du.
Similarly, we have d
 t
0
f(t,u)dWu

= f(t,t)dWt +
 t
0
df(t,u)dWu.264 21 Interest Rate Term Structure Modelling
or
drt = f
0(t) +
 t
0
∂, αu(t)
∂t
du +
 t
0
∂σu(t)
∂t
· d , Wu
!
dt + σt(t) · d , Wt (21.4)
since , αt(t) = 0. The drift contains a stochastic term
 t
0
∂σu(t)
∂t
· d , Wu which is
path dependent. Therefore, rt is not Markovian in general.
The non-Markovian feature makes the implementation difficult. Taking the
example of Tree method, a non-Markovian model may lead to non-recombining
branches, and an explosive number of nodes. The finite difference method is only
applicable under Markovian models. However, by choosing some special function
forms for σu(t), it is possible to obtain Markovian models for rt.
Definition 21.1 (Volatility Separation Condition) The volatility σt(T) is said to
satisfy the separation condition if it takes the form
σt(T) = g(t)h(T), where g(t) is a vector-valued function and h(T) > 0.
Proposition 21.2 If σt(T) satisfies the volatility separation condition, then
drt = κ(t)(θ(t) − rt)dt + σt(t) · d , Wt i.e., rt is Markovian,
where
κ(t) = −
h(t)
h(t)
, θ(t) =
f
0(t)
κ(t)
+
h2(t)
κ(t)
 t
0
g
(u)g(u)du + f0(t).
This result can be extended to the case where h is an n-dimensional vector h, and
g an n × n matrix-valued function.
Proof It suffices to calculate the drift term of drt in (21.4), i.e.,
 t
0
∂, αu(t)
∂t
du and
 t
0
∂σu(t)
∂t
· d , Wu.
Firstly from the definition of, α in the no-arbitrage condition,
, αu(t) = σu(t) ·
 t
u
σu(s)ds = h(t)g
(u)
 t
u
h(s)g(u)ds.
Direct operations give21.2 Heath–Jarrow–Morton Framework 265
 t
0
∂, αu(t)
∂t
du =
 t
0
h
(t)g
(u)
 t
u
h(s)g(u)ds + h2
(t)g
(u)g(u)
!
du
= −κ(t)
 t
0
, αu(t)du +
 t
0
h2
(t)g
(u)g(u)du.
Similarly,
 t
0
∂σu(t)
∂t
· d , Wu = h
(t)
 t
0
g
(u)d , Wu = −κ(t)
 t
0
σu(t) · d , Wu

= −κ(t)

rt − f0(t) −
 t
0
, αu(t)du

.
Hence,
drt =

f
0(t) +
 t
0
∂, αu(t)
∂t
du +
 t
0
∂σu(t)
∂t
· d , Wu

dt + σt(t) · d , Wt
= κ(t)(θ(t) − rt)dt + σt(t) · d , Wt. 
Proposition 21.3 If σt(T) satisfies the volatility separation condition and g,h are
deterministic, then
Pt(T) = eCt(T)−Dt(T)rt ,
where
Ct(T) = ln
P0(T)
P0(t)
−
 T
t
 t
0

h(z)g
(u)
 z
t
h(s)g(u)ds

du
!
dz + Dt(T)f0(t),
Dt(T) =
T
t h(u)du
h(t)
.
Proof Firstly using the volatility separation condition in (21.3) gives
rt = ft(t) = f0(t) +
 t
0

h(t)g
(u)
 t
u
h(s)g(u)ds

du +
 t
0
h(t)g
(u)d , Wu.
Then,266 21 Interest Rate Term Structure Modelling
ft(T) = f0(T) +
 t
0

h(T)g
(u)
 T
u
h(s)g(u)ds

du +
 t
0
h(T)g
(u)d , Wu
= f0(T) +
h(T)
h(t)
 t
0

h(t)g
(u)
 t
u
h(s)g(u)ds

du
+
 t
0
h(t)g
(u)d , Wu
!
+
 t
0

h(T)g
(u)
 T
t
h(s)g(u)ds

du
= f0(T) +
h(T)
h(t)
(rt − f0(t)) +
 t
0

h(T)g
(u)
 T
t
h(s)g(u)ds

du
and
Pt(T) = e−
T
t ft(u)du
= exp

−
 T
t
f0(u)du

exp

−
T
t h(u)du
h(t)
(rt − f0(t))
−
 T
t
 t
0

h(z)g
(u)
 z
t
h(s)g(u)ds

du
!
dz

= eCt(T)−Dt(T)rt .
Note that
exp

−
 T
t
f0(u)du

=
exp{−
T
0 f0(u)du}
exp{−
t
0 f0(u)du}
=
P0(T)
P0(t)
. 
## 21.3 Short Rate Models
One-factor short rate models are the easiest to handle. However, because there
is only one Brownian for the whole term structure, the bond prices for all the
maturities are perfectly correlated. So, the one-factor models are only suitable for
structures which are mainly sensitive to parallel shifts. Two-factor models capture
the yield curve pivoting, which gives satisfaction for the pricing of many interest
rate products.21.3 Short Rate Models 267
## 21.3.1 Hull–White One-Factor Model
In Hull–White (HW) model [41], rt follows an OU process:
drt = κ(t)(θ(t) − rt)dt + σd , Wt.
We consider the widely-used case with deterministic θ(t), and constants κ and σ.
It is a no-arbitrage model because it can be derived from HJM No-Arbitrage Model
by setting σt(T) = σe−κ(T−t).
rt follows an OU process which is a Gaussian process. Its dynamics are known to
be mean reverting which means that, with κ > 0, rt tends to rise when rt < θ(t) and
tends to fall when rt > θ(t). The parameter κ represents the reverting speed. As a
Gaussian process, the model is fully specified by its mean and variance which can be
easily obtained. The zero coupon bonds can be calculated with closed-form formula.
HW model belongs to the so-called arbitrage-free models which can calibrate the
initial term structure of the yield curve of the market thanks to the time-dependent
parameters. HW model is the most applied model in practice for structures which
are mainly sensitive to parallel shifts of the yield curve.
Applying h(T) = σe−κT and g(t) = eκt to the results in Proposition 21.2, we
obtain
Corollary 21.1 For Hull–White model,
θ(t) = f0(t) +
f
0(t)
κ
+
σ2
2κ2
(1 − e−2κt
),
, E[rt] = f0(t) +
σ2
2κ2
(1 − e−κt
)2
,
0 Var(rt) =
σ2
2κ
(1 − e−2κt
),
Pt(T) = eCt(T)+Dt(T)rt ,
where
Ct(T) = ln
P0(T)
P0(t)
− Dt(T)
∂lnP0(t)
∂t
−
σ2
4κ3
(e−κT
− e−κt
)2
(e2κt
− 1),
Dt(T) =
1
κ
[1 − e−κ(T−t)
].
The yield for zero coupon bond is Ct(T) + Dt(T)rt. This implies perfect
correlation of yield levels over all maturities. As a consequence, the model is not
suitable for structures having significant sensitivities to changes other than parallel
shift of the yield curve.268 21 Interest Rate Term Structure Modelling
HW model is equivalent to the one-factor case of LGM (Linear Gaussian Model)
which takes the form rt = f0(t)+xt where xt is the random state variable following
an OU process. Working with xt = rt −f0(t) has the advantage of avoiding the non
smoothness issues of f0(t) from bootstrapped prices of the market zero coupon
bonds.
Remark 21.1 By setting θ(t) to a constant b, we get Vasicek model drt = κ(b −
rt)dt + σd , Wt. Unlike Hull–White model, Vasicek model is an equilibrium model
which is not arbitrage free in the sense that the initial term structure of the market
may not be satisfied.
## 21.3.2 Two-Factor LGM (Linear Gaussian Model)
In one-factor models, the yields of different maturities are perfectly correlated. For
products that are sensitive to the yield curve changes other than parallel shift, more
factors need to be introduced. For most of the interest rate structures, two factors
give satisfaction for capturing the variability of the term structure.
Two-factor LGM is among the most popular ones used in practice. It is a no-
arbitrage model and it allows analytical solution for the zero coupon bonds. A
detailed analysis can be found in [3]. The standard form of two-factor LGM may
be written as follows:
rt = f0(t) + x1
t + x2
t ,
where x1
t ,x2
t are the factors following the mean reverting process
dxt = [yt1 − κ(t)xt]dt + σ(t)
d , Wt,
with
xt = [x1
t ,x2
t ]
, 1 = [1,1]
,
, Wt = [, W1
t , , W2
t ]
, where , W1
t , , W2
t are independent Brownians,
σ(t) =
σ11(t) 0
σ21(t) σ22(t)
!
.
The other parameters are as follows which are derived from HJM model with
separability condition on σ so that the model is Markovian:
κ(t) = diag(κ1(t),κ2(t)),
h(t) =

e−
t
0 κ1(u)du
e−
t
0 κ2(u)du

,21.3 Short Rate Models 269
g(t) =
⎡
⎢
⎣
σ11(t)e
t
0 κ1(u)du
0
σ21(t)e
t
0 κ1(u)du
σ22(t)e
t
0 κ2(u)du
⎤
⎥
⎦,
yt = H(t)
 t
0
g(u)
g(u)du

H(t), H(t) = diag(h(t)).
The model is fully specified by κ1,κ2,σ11,σ21 and σ22.
Extension for Volatility Skew
LGM model (one and two factors) can be extended to take into account the volatility
skew observed in the vanilla instruments for pricing certain structures that are
sensitive to volatility dynamics. One extension applies local volatility to g(t) in
LGM model which assumes the volatility separability:
σt(T) = g(t)h(T) with g(t) = g(t,xt,yt).
A further extension consists of applying a stochastic term to g(t,xt,yt):

z(t)g(t,xt,yt)
where z follows a CIR process which is uncorrelated to xt. We refer to [3] for
detailed discussions.
21.3.3 CIR (Cox-Ingersoll-Ross) One-Factor Model
The original CIR model is given by
drt = κ(θ − rt)dt + σ
√
rtd , Wt,
where κ,θ,σ are all constants.
Similar to Vasicek model, it is an equilibrium model which is not arbitrage-
free. The particular property of the model is that it guarantees the positivity of the
short rate which used to be a much desired feature before the negative interest rates
becoming a reality for several major currencies in the 2010s.
Similar to Hull-White model, CIR model can be derived from HJM No-Arbitrage
Short Rate Model by setting σt(T) = σ
√
rte−κ(T−t). Under CIR model, the zero
coupon bonds admit an analytical solution as follows [26]:
Pt(T) = eAt(T)−Bt(T)rt .270 21 Interest Rate Term Structure Modelling
## 21.3.4 Affine-Yield Models
A model satisfying the below features is called an affine-yield model:
• the short rate rt is an affine function (linear plus translation) of the factors Yt
• the zero coupon bond prices are of the form Pt(T) = eCt(T)−Dt(T)·Yt where
Ct(T) and Dt(T) are nonrandom functions (Dt(T) in vector form).
It can be proved that an affine-yield model takes the below vector form [29]:
dYt = (λ0 + φYt)dt + Σ
⎡
⎢
⎢
⎣

α1 + β

1 Yt ··· 0
. . .
...
. . .
0 ···

αn + β

n Yt
⎤
⎥
⎥
⎦dWt,
where
λ0, βi : vectors αi : scalars
φ, Σ : matrices Yt : vector of factors (state variables)
Wt : Brownian motion vector
The Vasicek and CIR models are affine-yield models.
For aone-factor model,we have rt = Yt (cf.theresultofHWmodel forexample)
which implies that the yields of zero coupon bonds for different maturities are all
linearly dependent on rt, i.e. 100% correlated.
Interest Rate Derivatives Pricing with Short Rate Models
For pricing interest rate derivatives, short rate models can be applied. As usual, the
model parameters are calibrated to match the market price of liquid instruments.
Closed-form solutions for zero coupon bonds exist for the popular one-factor
models. PDE and Tree methods are applicable for low dimension models. In Monte
Carlo simulation, the increments of the short rate and the stochastic discount factor
can be generated for each time-step. The zero coupon bond prices, if required, can
also be simulated by using the solution of (21.2) (cf. the Monte Carlo method for
BSM model). We recall that the price of zero coupon bond is the expected value of
stochastic discount factor as shown by (21.1). For pricing a bond option with Monte
Carlo, the random zero coupon bond prices need to be generated.
Here we take the example of the pricing of a caplet with Monte Carlo method.
Assume that it is a call option on USD 3M Libor.
(i) generate one random path under, P of the applied short rate model;
(ii) calculate the 3M Libor rate with the stochastic discount factor values for this
path;21.4 Libor Market Model (LMM) 271
(iii) calculate the present value of the option payoff for this path;
(iv) repeat the above steps and average the present value of the simulated payoffs
to obtain the option price.
## 21.4 Libor Market Model (LMM)
LMM (also known as BGM, Brace–Ga̧tarek–Musiela) models directly the forward
Libor rates that are observable through FRA and Swap contracts which are replica-
ble by zero coupon bonds. We have seen that each forward Libor rate Lt(Ti) is a
martingale under its natural risk-neutral probability measure , PTi+1. LMM consists
of applying the same numéraire for all the Libor rates when pricing with the term
structure. If we use , PTn+1 (the last one is a common choice known as the terminal
measure, but we may choose any other, PTi ) for all Lt(Tk) (k = 0,1,...,n), we will
need to adjust the drifts accordingly. Assume the following SDE
dLt(Tk) = σk · d , W
Tk+1
t
where the volatility is deterministic and modelled either as
σk =

σk(t)Lt(Tk), for log normal model,
σk(t), for normal model,
and , W
Tk+1
t is a multi-dimensional Brownian motion. By definition, the components
of a multi-dimensional Brownian motion are independent one-dimensional Brown-
ian motions.
Note that each Lt(Tk) can be equivalently expressed with a one-dimensional
Brownian motion
dLt(Tk) = σkd, X
Tk+1
t
where d, X
Tk+1
t = 1
σkσk · d , W
Tk+1
t . However, one-dimensional Brownian terms
, X
Ti+1
t and , X
Tk+1
t (∀i,k) are correlated by
d, X
Ti+1
t d, X
Tk+1
t =
σi · σk
σiσk
dt ≡ ρi,kdt.
According to (17.1) of Sect.17.2, the Radon–Nikodym derivative process for the
numéraire change from, PTi+1 to, PTi is
d, PTi
d, PTi+1





Ft
= Zt(Ti) =
Pt(Ti)/P0(Ti)
Pt(Ti+1)/P0(Ti+1)
=
1 + δiLt(Ti)
1 + δiL0(Ti)
,272 21 Interest Rate Term Structure Modelling
where we have used Lt(Ti) = Pt(Ti)−Pt(Ti+1)
δiPt(Ti+1) and δi is the time fraction δi = Ti+1 −
Ti. The Radon–Nikodym derivative admits to
dZt(Ti) =
δidLt(Ti)
1 + δiL0(Ti)
=
1 + δiLt(Ti)
1 + δiL0(Ti)
δidLt(Ti)
1 + δiLt(Ti)
= Zt(Ti)
δidLt(Ti)
1 + δiLt(Ti)
.
Hence, applying Girsanov theorem in a vectorized fashion gives
d , WTn
t = −
dZt(Tn), , W
Tn+1
t 
Zt(Tn)
+ d , W
Tn+1
t = −
δnσn
1 + δnLt(Tn)
dt + d , W
Tn+1
t ,
d , W
Tn−1
t = −
dZt(Tn−1), , WTn
t 
Zt(Tn−1)
+ d , WTn
t = −
n
i=n−1
δiσi
1 + δiLt(Ti)
dt + d , W
Tn+1
t ,
. . .
d , W
Tk+1
t = −
n
i=k+1
δiσi
1 + δiLt(Ti)
dt + d , W
Tn+1
t , k < n.
We obtain the SDE for Lt(Tk) under the risk-neutral probability measure, PTn+1
dLt(Tk) = σk ·

−
n
i=k+1
δiσi
1 + δiLt(Ti)
dt + d , W
Tn+1
t

, 0 ≤ t ≤ Tk,
or
dLt(Tk) =

−
n
i=k+1
δiρk,iσkσi
1 + δiLt(Ti)
dt + σk · d , W
Tn+1
t

, 0 ≤ t ≤ Tk.
Factor Reduction
For avoiding a too large number of factors (Brownians) for long term products based
on Libor rates, we can apply the factor reduction technique. Let , B
j
t (j = 1,...,d,
typically d < 10) be independent Brownians and replace d, X
Ti+1
t = 1
σiσi ·d , W
Ti+1
t
by
d
j=1 θ
Ti+1
j d, B
j
t .Here,{θ
Ti+1
j }i=0,...,n
j=1,...,d arecalibratedtoproduced, X
Ti+1
t d, X
Tk+1
t =
ρi,kdt,∀i,k.
Readers may refer to [3,84] for further analysis on calibration and rank reduction
for LMM.21.5 Convexity Adjustment 273
Stochastic Volatility
The basic version of LMM does not handle volatility skew. It is possible to extend
the model with a stochastic component in the volatility term like
√
vtσi where vt is
a positive process. The stochastic process on the volatility is often common to all
maturities in the implementation.
## 21.5 Convexity Adjustment
For some of the financial products (e.g. in-arrears swap, CMS), there is incon-
sistency between the “natural” measure of the random variable process and the
measure used for pricing. A so-called convexity adjustment needs to be applied
for the valuation. We take the example of a Libor in-arrears cash flow where both
the Libor fixing and the payment happen at the same time for the period:
PVt = δ · Pt(Ti), ETi [LTi (Ti)|Ft],
where δ = Ti+1 − Ti, and as we know, Lt(Ti) is martingale under , PTi+1 (not , PTi ).
The Radon–Nikodym derivative process for the numéraire change from , PTi+1 to
, PTi is
d, PTi
d, PTi+1





Ft
= Zt(Ti) =
Pt(Ti)/P0(Ti)
Pt(Ti+1)/P0(Ti+1)
=
1 + δLt(Ti)
1 + δL0(Ti)
(t < Ti).
Let σ denote the volatility of the PTi+1 martingale Lt(Ti). The convexity correction
for Lt is defined as:
Δ = , ETi [LTi (Ti)|Ft] −, ETi+1[LTi (Ti)|Ft] =
1
Zt(Ti)
, ETi+1[ZTi (Ti)LTi (Ti)|Ft]
−, ETi+1[LTi (Ti)|Ft]
=
1
1 + δLt(Ti)
, ETi+1[LTi (Ti)(1 + δLTi (Ti))|Ft] − Lt(Ti)
=
1
1 + δLt(Ti)
{Lt(Ti) + δ, ETi+1[L2
Ti
(Ti)|Ft]} − Lt(Ti).
In the above equation,, ETi+1[L2
Ti
(Ti)|Ft] can be priced and hedged using caplets
as explained in Sect. 19.4 “Static Hedging for European Style Options” in Chap.19.
Here, we estimate the convexity adjustment value by assuming the distribution of
Lt(Ti) to be log normal:274 21 Interest Rate Term Structure Modelling
Δ =
1
1 + δLt(Ti)

Lt(Ti) + δ, ETi+1

Lt(Ti)e
−1
2 σ2(Ti−t)+σ(, W
Ti+1
Ti
−, W
Ti+1
t )
2

− Lt(Ti)
= Lt(Ti)
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
1 + δLt(Ti)eσ2(Ti−t), ETi+1 e
−1
2 (2σ)2(Ti−t)+2σ(, W
Ti+1
Ti
−, W
Ti+1
t )
!
1 + δLt(Ti)
− 1
⎫
⎪ ⎪ ⎬
⎪ ⎪ ⎭
= Lt(Ti)

1 + δLt(Ti)eσ2(Ti−t)
1 + δLt(Ti)
− 1

(expectation of exponential martingale is 1)
= Lt(Ti)θ[eσ2(Ti−t)
− 1]

define θ =
δLt(Ti)
1 + δLt(Ti)

≈ Lt(Ti)θσ2
(Ti − t).
Exercises
1. Show that the forward rate is a martingale under the T-forward measure, i.e., for
t ≤ T,
, ET
[fT (T)|Ft] = ft(T).
2. Assume a one-factor short rate model under the HJM framework with constant
volatility, i.e., σt(T) = σ. Show that
ft(T) = f0(T) + σ2
t

T −
t
2

+ σ , Wt
and
drt =

∂f0(t)
∂t
+ σ2
t

dt + σd , Wt
which is a special case of the Ho–Lee model related to the slope of the initial
yield curve.
3. Given the following two models under the risk-neutral measure for asset price
and bond price respectively:
dSt = rtStdt + σSStd , Wt,
dPt(T) = rtPt(T)dt − σP Pt(T)d , Wt,21.5 Convexity Adjustment 275
where rt is a stochastic process of interest rate, σS and σP are positive
constants.
(i) Let Fort(T) = St/Pt(T) be the forward price at time t and denote σ =
σS + σP . Show that dFort(T) = σFort(T)d , WT
t , where , WT
t is the Brownian
motion under the T-forward measure.
(ii) Consider a European cash-or-nothing binary call on the asset St, expiring at
time T with strike price K. Show that its time-t value is given by
Pt(T), ET
[1{ST >K}|Ft] = Pt(T), ET
[1{ForT (T)>K}|Ft] = Pt(T)N(d2),
where
d2 =
log(Fort(T)/K) − 1
2σ2(T − t)
σ
√
T − t
.Chapter 22
Credit Modelling
In this chapter, we study the case of default in credit modelling. Structural models
and intensity models are first covered. We then study the pricing of some basket
credit products, where correlated default is the main issue. Interested readers may
refer to [40] and [12]. The counterparty risk measures are introduced at the end of
the chapter.
## 22.1 Credit Modelling
## 22.1.1 Structural Models
Structural models link the default occurrence to the value of the firm. Merton [56]
pioneered this approach in 1974. Denote At for the asset value at time t. Assume
that the total debt of the firm is L for the considered time horizon T. At time T, the
debt holder (creditor) will receive the full amount L or what is left of the firm, i.e.,
DT (T) = min{L,AT } = L − (L − AT )+. The value of the debt at time t (t < T)
is then
Dt(T) = , E[e−r(T−t)
DT (T)|Ft] = , E[e−r(T−t)
(L − (L − AT )+
)|Ft]
= Le−r(T−t)
− pt(At,L,T).
Here Ft is the natural filtration of At. The term pt(At,L,T) is a put option value
with At as underlying, L as strike and T as maturity. So, the valuation only relies
on a European put option pricing.
Let St be the equity value of the firm at time t. Since At = St + Dt(T), we have
St = At − Dt(T) = At − Le−r(T−t)
+ pt(At,L,T) = ct(At,L,T),
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_22
277278 22 Credit Modelling
where the last equality is obtained by put-call parity. Therefore, the equity is valued
as a European call option (with payoff (AT − L)+ since AT = ST + DT (T) =
(AT − L)+ + min{L,AT }).
The model can be further improved by letting the default time be the first time
that At < L. As the asset value is not observable on daily basis, practitioners favor
intensity models for credit derivatives modelling where the model parameters can
be implied from the markets quotes of liquid credit instruments. As the structural
model links the debt and equity value, it has found its application in the strategy of
capital structure arbitrage. The model can be used for calculating the stock delta for
hedging the position in the debt of the company.
In Moody’s KMV1 and CreditMetrics2 models, the asset value of the i-th firm is
assumed to follow the SDE
dAi
t/Ai
t = μi
dt + σidWi
t .
The probability of default for the period (0,T) is calculated from the distance-to-
default which is defined as
di
(T) =
E[lnAi
T ] − lnLi
σi
√
T
=
ln(Ai
0/Li) + (μi − 1
2σ2
i )T
σi
√
T
,
where Li is the debt of the i-th firm.
## 22.1.2 Intensity Models
In intensity models (also known as reduced-form models), the risk-neutral distribu-
tion of the default time τ is
, P{τ > t} = 1 − F(t) = e−
t
0 λudu
, t > 0,
where , P{τ > t} is the survival probability and F(t) represents the default
probability. When λ is a constant, τ follows the exponential distribution. It is the
first jump time of a Poisson process. Note that λ can be calculated from the market
quote of CDS and be used for pricing other credit derivatives. , P{τ < t} is the
probability of default before t, and
1Founded by Stephen Kealhofer, John McQuown and Oldřich Vašíček and later acquired by
Moody’s.
2RiskMetrics was established in 1989 by J.P. Morgan and acquired by MSCI in 2010.22.1 Credit Modelling 279
, P{t1 < τ < t2} = , P{τ > t1} −, P{τ > t2}
is the marginal probability of default between time t1 and t2(> t1). From the result
in Chap.10 Sect.10.9, λtdt is the probability of default in (t,t + dt), conditioned
by no default before t.
In this chapter, Pt(T) will denote the stochastic discount factor, Pt(T) =
e−
T
t rudu
. Let Ft be the filtration for the information on default free market
until t which includes {τ > t}. In intensity models, the default time τ is not
a stopping time of Ft. However, it is a stopping time of the enlarged filtration
Gt = Ft ∪ σ({τ ≤ s},s < t).
Proposition 22.1 (Filtration Switching Formula) Let X be an integrable random
variable, then
1{τ>t}E[X|Gt] = 1{τ>t}
E[X1{τ>t}|Ft]
E[1{τ>t}|Ft]
a.s.
Sketch of Proof Note that if A ∈ Gt, then A∩{τ > t} = B∩{τ > t} for some event
B ∈ Ft. So, there should exist Ft-measurable r.v. Yt, s.t.
1{τ>t}E[X|Gt] = 1{τ>t}Yt.
Taking conditional expectation E[1{τ>t}E[X|Gt]|Ft] = E[1{τ>t}Yt|Ft], we obtain
Yt =
E[X1{τ>t}|Ft]
E[1{τ>t}|Ft]
. 
Example 22.1 (Zero Coupon Bond Modelling) We take the zero coupon bonds for
illustrating the modelling for bonds. Denote
R: Recovery Rate in case of default (usually, R ≈ 40% for senior bonds)
LGD: Loss Given Default (LGD = 1 − R)
DP: Default Probability (DP = E[1{τ≤T}|Gt]).
The value of a zero coupon bond before default is
Dt(T) = , E[Pt(T)(1{τ>T} + R · 1{τ≤T})|Gt] = , E[Pt(T)(1 − LGD · 1{τ≤T})|Gt].
If the short rate rt is deterministic, we have
Dt(T) = Pt(T)(1 − LGD × DP).280 22 Credit Modelling
If R = 0, from filtration switching formula in Proposition 22.1, we obtain the value
of a zero coupon bond before default
Dt(T) = , E[Pt(T)1{τ>T}|Gt] =
, E[Pt(T)1{τ>T}1{τ>t}|Ft]
, E[1{τ>t}|Ft]
=
, E[Pt(T)1{τ>T}|Ft]
, E[1{τ>t}|Ft]
=
, E[, E[Pt(T)1{τ>T}|FT ]|Ft]
, E[1{τ>t}|Ft]
=
, E[Pt(T)e−
T
0 λudu
|Ft]
e−
t
0 λudu
= , E[e
T
t −(ru+λu)du
|Ft].
22.2 CDS (Credit Default Swap)
As presented in Part I, Chap.6, CDS (Credit Default Swap) remains the most widely
usedcreditderivative instrumentdespitetheissuesinthefinancial crisisof2008.Let
N be the notional amount and R the recovery rate which is usually assumed to be
around 40% for senior debts. Assume that
Ti,i = 1,...,m: dates on which the premium and the protection are paid
Premium Leg:
m
i=1
sN(Ti − Ti−1)1{τ>Ti}, s is the spread
Protection Leg: N(1 − R)1{τ≤Tm} (usually, R ≈ 40% for senior debt).
We have the following
LEGpremium = s, E
 m
i=1
(Ti − Ti−1)1{τ>Ti}P(Ti)

LEGprotection = , E[(1 − R)1{τ≤Tm}P(τ)].
Equating the two legs, we obtain the market pricing of CDS spread
s =
, E[(1 − R)1{τ≤Tm}P(τ)]
, E
 m
i=1
(Ti − Ti−1)1{τ>Ti}P(Ti)
.
In practice, the CDS spread is quoted in the market. By means of intensity model,
we can imply asset’s default probability for other purposes (e.g. convertible bond
pricing).22.3 Pricing and Hedging of Basket Credit Derivatives 281
## 22.2.1 Credit Triangle
Let us assume that the hazard rate λ and risk-free rate r are deterministic and flat.
We have the so-called credit triangle which reveals the relationship between the
CDS spread s, the default rate λ and the recovery rate R:
s = (1 − R)λ.
Proof The PV of the protection leg is
LEGprotection = , E[(1 − R)1{τ≤Tm}P(τ)] = (1 − R)
 Tm
0
e−ru
λe−λu
du
= (1 − R)λ
 Tm
0
e−(r+λ)u
du.
The PV of the premium leg is
LEGpremium = s, E
 m
i=1
(Ti − Ti−1)1{τ>Ti}P(Ti)

= s, E
 m
i=1
, E
'
(Ti − Ti−1)1{τ>Ti}e−rTi |GTi
(

= s, E
 m
i=1
(Ti − Ti−1)e−λTi e−rTi

= s
m
i=1
(Ti − Ti−1)e−(r+λ)Ti .
Assuming further that CDS works in continuous time, we have
LEGpremium → s
 Tm
0
e−(r+λ)t
dt.
Equating the protection and premium legs, we obtain the result to be proved. 
## 22.3 Pricing and Hedging of Basket Credit Derivatives
## 22.3.1 Copula
Copula (Latin: link) describes the dependence structure of random variables in
a general way. It combines univariate distribution functions to form multivariate
distribution functions.282 22 Credit Modelling
Definition 22.1 Let C be a function [0,1]n → [0,1]. It is called “Copula” if
there exists a vector (U1,U2,...,Un) in which each Ui, i = 1,...,n is uniformly
distributed, s.t.,
C(u1,...,un) = P{U1 ≤ u1,...,Un ≤ un},∀(u1,...,un) ∈ [0,1]n
.
Theorem 22.1 (Sklar Theorem) Let F be an n-dimensional cumulative distribu-
tion function with margins Fi. Then there exists a copula C such that
F(x1,...,xn) = C(F1(x1),...,Fn(xn)), ∀x1,...,xn ∈ R.
One can extract a copula from any distribution with Fi(xi) = ui,
C(u1,...,un) = F(F−1
1 (u1),...,F−1
n (un)).
If F(.) is a multivariate normal distribution, then C(.) is called Gaussian copula
which is widely used in pricing portfolio credit structures (CDO, First-To-Default
Note, etc.).
## 22.3.2 One-Factor Gaussian Copula Model
In the one-factor Gaussian Copula model, the latent variables for the issuers are
assumed to be correlated to a common market factor, usually representing the
systemic risk of the economy. Let xi be the latent variable for the i-th issuer which
is a standard normal random. Then,
xi = βiZ̄ +

1 − β2
i Zi,
where
Z̄: common market factor
Zi: idiosyncratic risk of the i-th issuer
βi: correlation of the i-th issuer to Z̄. It may be either estimated with econometric
methods (e.g. correlation derived from the prices of the stock and the index
representing Z̄), or implied from the market quotes of liquid credit derivative
products.
Z1,...,Zn,Z̄: independent standard normal variables.
Note that
• correlation ρi,j between the issuers i and j equals to βiβj
• conditioned by the common market factor Z̄, all latent variables for issuers are
independent.22.3 Pricing and Hedging of Basket Credit Derivatives 283
In the structural approach, the default occurs if xi falls below a certain level γi
at the considered time t. This implies that the probability of default by t is given by
Fi(t) = , P{τi ≤ t} = , P{xi ≤ γi} = N(γi). The conditional probability of default
by time t for issuer i is
, P{τi ≤ t|Z̄} = , P{xi ≤ γi|Z̄} = N

γi − βiZ̄

1 − β2
i

.
If the default time τi follows an exponential distribution with intensity λ, then
γi = N−1
(Fi(t)) = N−1
(1 − e−λt
).
Replacing γi, we have
, P{τi ≤ t|Z̄} = N

N−1(1 − e−λt) − βiZ̄

1 − β2
i

.
Suppose default probabilities are identical for all issuers and let pt = , P{τi ≤ t|Z̄}.
The conditional probability of k defaults by time t can be obtained from binomial
distribution
, P(k,t|Z̄) =
n!
(n − k)!k!
pk
t (1 − pt)n−k
.
## 22.3.3 Pricing of Basket Credit Derivatives
The one-factor copula model is usually employed for pricing portfolio based credit
derivatives, for example, First-To-Default Note and CDO. We illustrate the pricing
of basket credit derivatives through the example of a synthetic CDO tranche with
“Attachment point” A and “Detachment point” D (e.g. A = 3%,D = 6%). Denote
Lt: portfolio loss in percentage of the total notional by time t
LA,D
t : loss between A and D in percentage of the tranche notional by time t
T1,...,Tm: payment times for the interests from the CDO tranche
s: interest rate applied for the CDO tranche.
We have
LA,D
t = [(Lt − A)1{A<Lt≤D} + (D − A)1{Lt>D}]/(D − A)
LEGdefault = , E[
Tm
0 P(t)dLA,D
t ]
LEGpremium = s, E[
m
i=1 P(Ti)(Ti − Ti−1)(1 − LA,D
Ti
)].284 22 Credit Modelling
Assuming that the interest rate for discounting is flat r, the spread of the tranche
will be
s =
Tm
0 e−rtd, E[LA,D
t ]
m
i=1 (Ti − Ti−1)e−rTi (1 −, E[LA,D
Ti
])
.
Assuming that the portfolio is homogeneous, i.e. all the assets have the same
default probability and recovery rate R, then
Lt =
n
i=1
1
n
(1 − Ri)1{τi<t} =
1 − R
n
kt,
where n is the size of the portfolio and kt is number of defaults by time t. The
expected loss conditioned by the market factor Z̄ is
, E[Lt|Z̄] =
1 − R
n
, E[kt|Z̄] =
1 − R
n
n
k=1
, P(k,t|Z̄).
The expression of, P(k,t|Z̄) is given in one-factor copula model analysis. Assuming
that Z̄ follows normal distribution, then
, E[Lt] =
 ∞
−∞
, E[Lt|z]
1
√
2π
e−z2
2 dz,
which can be calculated with Gaussian Quadrature, Monte Carlo or any other
efficient numerical integration methods.
Unlike the derivatives under Complete Market modelled with Brownian motion,
the hedging of basket credit derivatives is challenging mainly due to the jumps. For
example, the issuer of a First-To-Default Note makes Delta-hedging with the CDS
of the single names. However, the hedge will not be sufficient for a default event
which implies a big negative gamma position at default. Before the default happens,
the issuer usually has a position of positive Theta and positive Gamma of the credit
spreads of the single names.
## 22.4 Counterparty Risk Measures
In this section, we will introduce the most applied concepts and measures which
are used for the management of counterparty risks. Many measures and regulatory
requirements related to counterparty risks are being developed and implemented
after the financial crisis of 2008. We refer to [16] for specialized presentation on
counterparty risk management.22.4 Counterparty Risk Measures 285
In the following, Vt stands for the MtM of the considered trade or portfolio.
Monte Carlo simulation based on the physical probability measure is often neces-
sary for calculating the risk measures while option pricing should always be done
under risk-neutral measure.
PFE (Potential Future Exposure)
PFE measures the worst potential loss of a transaction with a given percentile α
(usually 97.5%) during its whole life. Mathematically, PFEα = inf{X|P(Vt ≤
X) ≥ α,t ∈ [0,T]}. PFE is an important measure for counterparty risk
management. A bank may define the credit limit for trades (other than the loans)
with a client by a total PFE amount.3 When the aggregated PFE reaches the limit,
the bank will stop making new trades with the client. Another example of PFE
application is the determination of IA (Independent Amount) for swaps.
Close-Out Risk
It is the potential loss during the period between the time the counterparty is deemed
to default and the time the transaction is unwound. Usually, the considered period is
10 business days. The Close-Out Risk is measured with a similar percentile for PFE
(e.g. 97.5%).
EPE (Expected Positive Exposure)
EPEt = E[V+
t ]. It measures the exposure for the counterparty risk as the negative
MtM does not constitute a risk.
CVA (Credit Value Adjustment)
CVA is market price of the counterparty credit risk for the considered transaction
or portfolio. It is represented mathematically as CVA = LGD ×
T 
t=0
e−rtE[V+
t ] =
(1 − R)
 T
0
e−rt
V+
t λce−λct
dt, where λc is the default intensity of the counterparty
3For a portfolio with tradable transactions only, close-out risk or VaR may be used instead of PFE
for the risk limit, for instance, 10 day 90% VaR.286 22 Credit Modelling
and R the recovery rate. Actually, the CVA represents only the theoretical hedging
cost due to the lack of liquidity for the CDS to be used. In practice, the counterparty
risk is often proxy hedged with the CDS on liquid indices or reference entities
correlated to the target one. The CVA needs to be accounted for the determination
of the profit of a trade’s P/L. For giving the background, CVA was largely ignored
by most of the financial institutions before the financial of 2008.
DVA (Debt Value Adjustment or Debit Value Adjustment)
It is the CVA seen by the counterparty. DVA = (1 − R)
 T
0
e−rt
V−
t λde−λdt
dt, λd
is dealer’s own default intensity.
Wrong-Way Risk
Wrong-Way Riskoccurs when theexposure toacounterparty isadversely correlated
with the credit quality of that counterparty. For example, buying a put option on
gold from a gold producer is a wrong-way risk. Under current practice, the market
risk of a transaction and the counterparty risk are modelled independently. Hence,
an exogenous consideration for wrong-way risk is necessary. While trying to avoid
wrong-way risks, one should not forget to encourage the transactions with “Right-
Way” exposure.
Example 22.2 Consider a long position of an equity call option (assuming BSM
model with zero div, repo) with initial price V0. Recall that the 97.5-th percentile of
a standard normal variate is 1.96. Then,
PFET ≈ S0e(r−1
2 σ2)T+1.96σ
√
T
− K
CloseOutRiskt ≈ Δt(Ste(r−1
2 σ2)δ+1.96σ
√
δ
− St)e−rδ − Vt, δ = 14/365
EPEt = E[V+
t ] = E[, E[e−r(T−t)(ST − K)+|Ft]] ≈ ertV0
CVA ≈ V0scT, sc is the credit spread of the counterparty.
Basel II Risk Weight Function
For cushioning the risks and preventing excessive leverage, banks are required to
hold a certain amount of regulatory capital. In 2004, Basel Committee on Banking
Supervision (BCBS) proposed to set the capital requirement (K) equal to the
Unexpected Loss for the exposure of the bank excluding the extreme losses. It22.4 Counterparty Risk Measures 287
is admitted that the Expected Loss is a business cost which is well managed by
the appropriate pricing and provisioning. VaR (Value at Risk) is a measure for
extreme losses. It is defined as the maximum loss over the considered period given
a certain percentile.4 For banks adopting Internal Ratings-Based (IRB) Approach, it
is allowed to use their own internal measures for key drivers of credit risk as primary
inputs to the capital calculation, which normally leads to lower regulatory capital
amount compared to the Standardized Approach. The general formula proposed by
BCBS is as follows
K = LGD × (P|VaR − PD) × Adj(M,PD), (22.1)
where
LGD: Loss Given Default estimated in a stressed situation, in percentage of the
EAD (Exposure At Default)
P|VaR: probability that the loss is below a threshold αVaR (e.g. 99.9%)
PD: Probability of Default for the period of 1 year; From structural approach,
default happens when latent variable x < γ which implies PD = N(γ)
Adj(M,PD):adjustmentfactorforgivingmoreweightfortransactionswithlonger
maturities M and lower PD.
In (22.1), LGD × P|VaR represents the VaR and LGD × PD the expected loss.
The detailed calculation formula for K, known as Basel II Risk Weight Function, is
given by BCBS as follows:
K = LGD × N

N−1(PD) + βN−1(99.9%)

1 − β2

− PD
!
× Adj(M,PD),
whereAdj(M,PD) = 1+(M−2.5)b(PD)
1−1.5b(PD) ,b(PD) = [0.11852−0.05478×ln(PD)]2.
Now, we show that this formula is related to the one-factor correlation model.5
Assume the asset return x to be
x = βZ̄ +

1 − β2Z, where Z ∼ N (0,1).
Then, we have
P{x < γ|Z̄} = P

Z <
γ − βZ̄

1 − β2



Z̄

= N

γ − βZ̄

1 − β2

= N

N−1(PD) − βZ̄

1 − β2

.
4For instance, the 10 day 90% VaR of USD100m means that there is 10% probability that the loss
will be more than USD100m for the period of 10 (business) days.
5Our simplified analysis may not reflect the rationale of BCBS (cf. [6] and [34]).288 22 Credit Modelling
For the point at percentile αVaR = 99.9%, the market factor satisfies N(Z̄) = 0.1%
or equivalently −Z̄ = N−1(99.9%). Hence,
P|VaR = N

N−1(PD) + βN−1(99.9%)

1 − β2

.
Plugging P|VaR back in (22.1) for K, we obtain the desired result. In Basel II, the
capital requirement is 8% of the RWA (Risk Weighted Asset), i.e. EAD × K =
8%×RWAwhichmeansthatthecapitalrequirementis8%ofthetotalriskweighted
assets. Therefore, we have
RWA = EAD × LGD × N

N−1(PD) + βN−1(99.9%)

1 − β2

− PD
!
×
1 + (M − 2.5)b(PD)
1 − 1.5b(PD)
× 12.5.
The supervisory asset correlation function depends on the type of exposure and is
given by BCBS:
• corporate, bank or sovereign with the size of S million Euros:
β2
= 0.12λ1 + 0.24(1 − λ1) + SizeAdj(S).
where λ1 =
1 − e−50PD
1 − e−50
and SizeAdj(S) =
⎧
⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎩
0, S > 50,
−0.04 ×

1 −
S − 5
45

, S ∈ [5,50],
−0.04, S < 5.
• residential mortgage: β2 = 0.15
• qualifying revolving retail: β2 = 0.04
• other retail: β2 = 0.03λ2 + 0.16(1 − λ2), λ2 =
1 − e−35PD
1 − e−35
.
Exercises
1. Consider Merton’s structural model given by
dAt = rAtdt + σAAtd , Wt
and let St = At − Dt(T) where St represents the equity value and Dt(T) the
debt. Show that the asset volatility σA and the equity volatility σS are related by22.4 Counterparty Risk Measures 289
σS = σAN(d1)
At
St
, d1 =
ln At
L + (r + 1
2σ2
A)(T − t)
σA
√
T − t
.
2. Derive the survival probability by time T, i.e. , P{τ > T}, when the intensity
follows a stochastic CIR process as follows:
dλt = (b − aλt)dt + σ

λtd , Wt,
in which it is assumed that the intensity is positive.
3. Calculate the PFE with α = 97.5% for a long equity put option in which the
asset follows the SDE as
dSt = (r − q)Stdt + σStd , Wt.Chapter 23
Commodity Modelling
From the supply-and-demand relation, the commodity futures price Ft(T) with
maturity T at time t is
Ste(r+y)(T−t)
,
where y is a number reflecting both convenience yield and storage costs so it can be
positive or negative. For simplicity, we still call it convenience yield in modelling.
One direct way for commodity modelling is to assume that the spot price follows
the geometric Brownian motion under the risk-neutral measure
dSt = (r + y)Stdt + σStd , Wt
and direct calculation leads to
dFt(T) = σFt(T)d , Wt,
which satisfies the fact that the futures price Ft(T) is a martingale. It is used for
European options which depend mainly on final distributions. However, for path-
dependent or some other exotic options, more advanced models may be required for
capturing the mean reverting property of some of the commodities as well as the
volatility skew.
Gabillon Spot Model
Gabillon model [33], originally proposed for oil futures, is one of the most popular
models for commodity derivatives. Define the long-term price of a commodity as
the price for delivery at infinite time. Under the risk-neutral probability measure,
the spot price St is modelled along with the long term price process Lt as
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_23
291292 23 Commodity Modelling
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
dSt
St
= (rt + yt)dt + σS
t d , WS
t ,
dLt
Lt
= σL
t d , WL
t ,
wherert istheshortrate,σS
t andσL
t arecorrespondingvolatilities,andd , WS
t d , WL
t =
ρdt. More importantly, the convenience yield yt is totally determined by St and
Lt as
yt = κt ln(Lt/St) + δt,
where κt is a positive process representing the speed of mean reversion and δt is an
extra term.
Gabillon Futures Model
Now, we show how to derive the model for futures Ft(T) from the Gabillon Spot
Model. Applying the Itô’s formula with the functions lnSt and lnLt on the Gabillon
spot model, we obtain the following two SDEs:
⎧
⎪ ⎪ ⎨
⎪ ⎪ ⎩
d lnSt = rt + yt −
1
2
(σS
t )2
!
dt + σS
t d , WS
t
d lnLt = −
1
2
(σL
t )2
dt + σL
t d , WL
t .
Denoting the quotient Xt = St/Lt (such that lnXt = lnSt −lnLt) and plugging
in the convenience term yt, we obtain
d(lnXt) = (at − κt lnXt)dt + σX
t d , WX
t ,
where at = rt + δt + 1
2[(σL
t )2 − (σS
t )2] and σX
t d , WX
t = σS
t d , WS
t − σL
t d , WL
t .
We see that lnXt is an OU process that can be solved with the usual method. Let
Kt(T) = e−
T
t κsds
. Then,
d(Kt(T)lnXt) = Kt(T)(atdt + σX
t d , WX
t )
lnXT = Kt(T)lnXt +
 T
t
Ku(T)(audu + σX
u d , WX
u ).
Putting lnLT = lnLt − 1
2
T
t (σL
u )2du +
T
t σL
u d , WL
u and the expression of , WX
u ,23 Commodity Modelling 293
lnST = Kt(T)lnSt + (1 − Kt(T))lnLt +
 T
t
[Ku(T)au −
1
2
(σL
u )2
]du
+
 T
t
Ku(T)σS
u d , WS
u +
 T
t
(1 − Ku(T))σL
u d , WL
u .
In the following it is assumed that κt, σS
t and σL
t are deterministic. Then, ST
is log-normally distributed, and so is ST |Ft. From the property of log-normal
distribution, we know that , E[ST |Ft] = exp{, E[lnST |Ft] + 1
2
0 Var(lnST |Ft)}.
We have, E[lnST |Ft] = A+
t
0 Ku(T)σS
u d , WS
u +
t
0(1−Ku(T))σL
u d , WL
u because
the expectations of the Brownian integrals from t to T are zero. A is a term
that does not contain Brownians and needs not to be detailed here. The variance
0 Var(lnST |Ft) = B does not contain any Brownian terms either.
The futures price under the risk-neutral measure is given by Ft(T) = , E[ST |Ft].
Hence,
Ft(T) = , E[ST |Ft] = exp

A +
1
2
B

exp
 t
0
Ku(T)σS
u d , WS
u +
 t
0
(1 − Ku(T))σL
u d , WL
u

.
Recall that futures price under the risk-neutral measure is a martingale (i.e. zero
drift). Therefore, we obtain
dFt(T)
Ft(T)
= Kt(T)σS
t d , WS
t + (1 − Kt(T))σL
t d , WL
t ,
which is the Gabillon model for futures.
For modelling the skewed distribution for near expiries for different maturities
Ti, we can add extra terms αS
t (F) and αL
t (F) which enhance and generalize the
original Gabillon model:
dFt(Ti)
Ft(Ti)
= αS
t (F)Kt(Ti)σS
t d , WS
t + αL
t (F)(1 − Kt(Ti))σL
t d , WL
t .
Here αS
t (F) and αL
t (F) can be calibrated from option prices.
Exercises
1. Consider Schwartz one-factor model [76] for commodity spot price
dSt = (b − a lnSt)Stdt + σStd , Wt,294 23 Commodity Modelling
where a, b > 0.
(i) Show that lnSt follows an OU process.
(ii) Show that the futures price satisfies dFt(T) = σe−a(T−t)Ft(T)d , Wt, i.e.,
volatility decreases for longer maturity.
2. Consider the following Gabillon futures model
dFt(T)
Ft(T)
= Kt(T)σS
d , WS
t + (1 − Kt(T))σL
d , WL
t ,
where Kt(T) = e−κ(T−t), σS > 0 and σL > 0.
(i) Derive the volatility of Ft(T).
(ii) Given that κ = 0.5, σS = 0.3, σL = 0.1 and the short and long term prices
are correlated by −0.4. Plot the volatility term structure.Part IV
Structured Products and SolutionsChapter 24
Structured Products
## 24.1 Introduction
The direct investment in an asset offers linear and symmetric exposure to the
performance of the asset. However, an investor’s view on the market may
be more complex than the directional perspective, e.g., performance cycles,
relative performance of several assets, view on volatilities and correlations,
and etc. The risk appetite and tolerance are different according to investors’
profiles.
A structured product is a pre-packaged financial product for facilitating cus-
tomized risk-return objectives based on the returns from certain investable assets.
It is used as an alternative to direct investment. Structured products can offer
the exposure for specific market views and desired risk profile under the con-
straints of financial budget and legal framework for investment. The deriva-
tives hedging (or replication) technology benchmarked by Black–Scholes–Merton
model has made it possible for banks to offer various structured products without
warehousing the market risks. The activity of structured products has expe-
rienced a fantastic development since the late 1990s when the French banks
pioneered the innovative equity-linked products to retail as well as institutional
investors.
The major end investors of structured solutions are retail, high-net-worth (HNW)
individuals and non-bank financial institutions (e.g. insurance or pension funds).
The investment targets may be classified with the following categories:
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_24
297298 24 Structured Products
– Participation: exposure to the performance of the underlying implemented with
tracking/market access structures
– Income: enhanced yield with fixed, variable coupons or capped performance of
the underlying
– Protection: prudent investment with no or limited potential loss
– Leverage: leveraged exposure to the performance of the underlying.
A structured product is composed of three building blocks, as described in the
summary table below.
Asset: any investable asset with high liquidity and low transaction cost may be used
as underlying asset
Payoff: it determines the return/risk of the product based on the performance of the
underlying assets
Wrapper or Instrument: it is the legal form for the product.
Wrapper
Payoff
Asset Class
n o i t p O ) C T O ( r e t n u o C - e h T - r e v O - e t o N d e r u t c u r t S -
t n a r r a W - e t a c fi i t r e C -
- Structured Deposit - Swap
t c u d o r P t n a i l p m o C h a i r a h S c i m a l s I - d n u F d e r u t c u r t S -
- Insurance Policy - ......
Access Product
- Direct Exposure
- Leveraged Exposure
Option Based Structure
- Principal Protected
- Non Principal Protected
Dynamic Portfolio
- Portfolio Insurance
- Dynamic Asset
Allocation
t i d e r C - s e i t i u q E -
d n u F - e t a R t s e r e t n I -
- Foreign Exchange - Customized Index/Strategy
. . . . . . - s e i t i d o m m o C -
## 24.2 Assets
The return of a structured product is linked to the performance of the underlying
assets pre-defined in the contract. We give an overview of the investable assets used
as underlyings in structured products.24.3 Payoff 299
Credit
- Corporate Bond
- Corporate Bonds
Index
- Credit Index
- ......
Fund
- Mutual Fund
- ETF
- Hedge Fund
- Managed Account
- ......
Customized Index/Strategy
- Smart Beta
- Alternative Beta
- Factors
- Multi-Asset Strategy
- ......
Equity
- Single Stock
- Basket of Stocks
- Equity Index
- ......
Interest Rates
- Libor Rate
- Libor Swap Rate
- OIS Rate
- Futures
- ......
Foreign Exchange
- FX Spot Rate
- Basket of Currencies
- ......
Commodities
- Futures
- Index
- Spot Price
- ......
Asset Return
The return rate of a financial asset for the period (s,t), s < t is defined as r =
Pt/Ps −1, where s,t are the indices for the time line and Pt is the price of the asset
at time t. We recall that the usual measures for the rate of return include price return
(dividend payments between (s,t) ignored), total return (all dividends re-invested
back in the asset), and excess return (total return rate minus the effective financing
cost, e.g. USD 3M Libor+0.30%). We refer to Chap.1 for detailed explanation of
the returns.
It is worth highlighting that, in general, the performance for structured products
is measured from the start date of the product. Only in special cases the performance
is not measured from the beginning but the explicit definition for the performance
will be given for such products.
## 24.3 Payoff
There is a wide variety of payoffs and underlying assets for structured products.
The categorization of structured products can be made in different ways. One
categorization criteria is the principal protection level.
## 24.3.1 Principal Protected Products
Principal protection is an important feature for risk averse investors. It may be
achieved by two types of techniques:300 24 Structured Products
– Option based structures, which is also known as OBPI (Option Based Portfolio
Insurance as opposed to CPPI)
– Dynamic asset allocation based structures, i.e. CPPI (Constant Proportion Port-
folio Insurance) and TIPP (Time Invariant Portfolio Insurance) which are risk
management techniques for adjusting investment exposure to mitigate gap risk
and will be explained in Chap.26.
The simplest option-based principal protected structure consists of spending the
available premium (which is from the interest of the investment of the principal in
fixed-incomeinstrument)tobuyacalloptionontheunderlyingasset.Forexample,a
1 year, 100% principal protected Note with notional amount of N may be structured
by the issuer as follows:
– investing in a 1 year discount bond which will be redeemed at N. Assume that
the upfront discount is 3.5% × N
– assuming that 0.5% × N will be used for covering the issuance cost and the
distribution cost, the available premium to spend will be (3.5%–0.5%)×N =
3% × N
– spending the available premium of 3%×N to buy a call option on the underlying
with PR = 37% (Participation Rate, also known as Gearing)
– at maturity, the investor will receive 100% × N + PR × N × max{0, ST
S0
− 1}.
96.5%
3%
100%
X%
Option Premium
Principal Protection 100% – 0.5%
## 24.3.2 Principal Non Protected Products
In a principal non protected product, the client takes certain risk on the performance
of the underlying for a higher investment return. The most common risk taken by
bullish investors consists of selling a put option on the underlying (cf. the analysis
for Equity Linked Note in the next chapter as a typical example). The premium
of the put option will be used to enhance the return. Other types of risk taking
include range view, bearish view, combination of views on different assets, view on
yield curve shape etc. which will be presented through the popular structures in the
following chapter.
The maximum loss for the investor will depend on the structure: e.g. 100% of the
invested amount for Note/Certificate/Warrant/long option, limited loss for a short
put option but unlimited loss for a short call option or a Swap.24.4 Wrapper or Instrument 301
## 24.4 Wrapper or Instrument
The choice for the legal form of a structured product depends on the distribution
channel, regulatory framework, the credit agreement between the counterparties,
etc. The mainly used wrappers are as follows:
– Structured Note: a debt security, in Bearer or Registered form, which pays
the interests and principal according to the performance of valuation assets
(underlying assets) of the product
– Certificate: a registered security which entitles holder to payments linked to the
performance of the underlying assets
– Warrant: it is a securitized option (could be vanilla or exotic option with
European or American style); Warrants can be listed at the exchange (for retail
investors) or issued under private placement (known as OTC Warrant). We note
that the warrant as a structured product does not create dilution to the underlying
stock because it involves only the secondary market shares.
– Swap: it helps to achieve leveraged return because the fund involved is the initial
margin and variation margin. The initial margin is only return at maturity of the
trade. The variation margins are exchanged during the life of the trade according
to MtM of the trade over time. For example, under the ISDA/CSA agreement, the
initial margin is called IA (Independent Amount) which is determined according
to the volatility, liquidity and riskiness of the underlying assets (e.g. 15%). Swaps
with regular settlements (or reset) have lower counterparty risk and require lower
IA which implies higher leverage.
– OTC Option: it is a flexible instrument for options with customized features. The
counterparties need to have a credit agreement in place before transacting OTC
options, similarly to Swaps.
– Structured Deposit: offered by deposit taking institutions. Deposits are not
transferable.
– Structured Fund: issued under the form of fund units which are not transferable
– Insurance Policy: structured product can be included in an insurance product.
There exist transferable insurance policies.
Notes/Certificates/Warrants are transferable securities that are unsubordinated
and unsecured obligations of the issuer and are ranked pari passu among themselves.
The securities may be settled through a clearing house (e.g. Euroclear, Clearstream).
DVP (Delivery Versus Payment) settlement helps to eliminate counterparty risk. For
the investor, a structured product wrapped as a Note or a Certificate from the same
issuer has no real difference.
Institutions normally transact Swaps and OTC options under an ISDA/CSA
agreement (cf. Chap.1, “OTC derivatives documentation and counterparty credit
risk management”).302 24 Structured Products
## 24.5 Risks of Structured Products
For investors, a structured product has the following risks in general:
– Issuer’s Credit Risk: similar to any debt instrument, the credit-worthiness of the
issuer is an important criteria;
– Liquidity Risk: the risk of not being able to early redeem the product at a
reasonable price; For terminating a structured product before its maturity, the
investor needs to “unwind” the product at the bid price (also known as secondary
market bid price) from the product issuer/counterparty. The unwind price will
include the transaction costs (e.g. 0.50% for equity structured products with short
tenor);
– Market Risk: it is the risk from all the market factors (e.g. underlying’s price or
volatility) determining the price of the structured product.
Counterparty Credit Risk Management
For the securitized instruments such as note/certificate and warrants, the investor’s
worstlossisthetotalamountspenttobuytheinstrument.So,theissuerdoesnottake
any counterparty credit risk from the investors. However, the investors are bearing
the credit risk of the issuer.
For OTC transactions between counterparties with an ISDA/CSA agreement,
typically between the institutions, the collateral management is governed by CSA
which contains, in particular, the type of acceptable collateral, the threshold and the
MTA (Minimum Transfer Amount). Margin call will be triggered for one party if
(Positive Net Exposure − Threshold − Collateral Held) > MTA. Let us take an
example of a two-way ISDA/CSA agreement between party A and party B in which
Threshold = USD1m, MTA = USD500k. In the situation where Net Exposure =
USD1.6m and Collateral Held = 0 for party A, a margin call will be triggered and
the Margin amount will be USD600k to be paid by party B.
Financial institutions, e.g. a private bank, may offer credit facilities to their
clients. The credit risk management is often based on deed of charge instead of
ISDA/CSA, in which the client’s assets are used as collateral. The credit risk
monitoring is based on the below quantities in general:
Add-On: specific to each trade for cushioning the forced unwind, it is the estimated
loss for the institution from the trade under stressed scenario (e.g. two standard
deviations of the price change) during a certain period of time (e.g. two weeks)
that is necessary for unwinding the trade.
Negative MtM: it is the absolute value of the total negative mark-to-market value of
allthetradesoftheclient.Thepositivemark-to-marketvalues areoftenneglected
in the calculation which is a common conservative approach in practice.
Whenever (Add-On + Negative MtM) > Held Collateral, a margin call will be
raised to the client for settling the difference.24.6 Funding Management for Structured Notes 303
Netting of the exposure of the trades with the same counterparty/client will be
dependent on the mutual agreement and applicable regulation.
Investment Financing
It is common for the private banks to allow their clients to make investment with
leverage (e.g. investment in bonds, stocks or structured products). The leverage for
a certain investment depends on the volatility of its MtM. The financing is applied
by means of a credit facility on the whole portfolio of the client, in which, each
investment is given three ratios: Financing Ratio (FR), Margin Call Ratio (MR)
and Liquidation Ratio (LR) (e.g. 70%/75%/80%). The bank may apply zero FR
to the investments that the bank is not willing to finance. The cash in portfolio’s
currency is considered to have 100% FR for generalizing the calculation. The limit
of the credit facility is calculated as

i MtMi × FRi. The client has the right to
borrow from the bank up to the limit of the credit facility. Similarly, margin call
level and liquidation level can be calculated from MR and LR. When the financing
from the bank is greater than the margin call level, the bank will issue a margin call.
If the financing from the bank is greater than the liquidation level, the bank may
start to unwind/liquidate some of the investments of the client.
## 24.6 Funding Management for Structured Notes
The proceeds of structured notes are typically managed by the ALM (Asset Liability
Management)/Corporate Treasury of the issuer. Trading book receives the interests
of the proceeds from ALM. The following diagram illustrates the typical funding
management for structured notes.
ALM
(Asset-Liability Mgt)
Note Investor Trading Book
$X
$X+Payoff
$X $Libor+Spread $X
Investment Bank304 24 Structured Products
ALM manages only the domestic currency and eventually some other major
currencies (e.g. USD). If the Note denomination currency is not managed by ALM,
trading needs to make a CCS (Cross Currency Swap) for converting the currency
into a major currency acceptable by ALM.
ALM
(Asset-Liability Mgt)
Note Investor Trading Book
X
X+Payoff
$Y $Libor+Spread $Y
Investment Bank
$Y X
Libor+Spread
$Libor
X $Y
Cashflow at Inception
Periodic Cashflows
Cashflow at Maturity
## 24.7 Back-Testing
Back-testing (also know as historical simulation) consists of simulating the return of
thestructuredproductbyapplyingtherealhistoricalpricesoftheunderlying.People
try to use the time series data from the historical beginning (or from a meaningful
start date if the data history is too long to be relevant). The backtesting process is
described as follows:
– For the first date of the considered period, a back-test is realized by assuming
that the structured product has started at that date. One simulated return of the
product is obtained.
– Then, the following date will be chosen as the start date for the structured product
and another simulated return will be obtained.
– This process is repeated until the expiry date of the product becomes the current
date (in which case, the process cannot continue any further).
A distribution is hence obtained with all the simulated returns. It is customary to
show the following back-testing results:
– Average IRR (Internal Rate of Return), Worst IRR, Best IRR
– Return distribution chart illustrating frequencies for return intervals.
In the product marketing materials, it is often highlighted that “past performance
is not a good indication for future performances”. Unfortunately, this statement
proved to be true with real life cases.24.9 Payoff Structuring Techniques 305
## 24.8 Business Organization
The structured product issuers are mainly investment banks which have the nec-
essary resources: technical skills, systems, risk management capabilities and client
base. There are a number of teams involved in the structured product activities.
The Front-Office teams normally refer to
Sales: advising and servicing clients with the suitable products
Structuring (or Financial Engineering): product solution and pricing
Trading: managing the risk of book of all clients’ trades.
Other functions may include
Quantitative modelling: pricing and hedging systems
Risk: market risk and credit risk monitoring
Back-office: confirmation, settlement, reporting, and etc.
IT: systems for front-office, back-office, and etc.
## 24.9 Payoff Structuring Techniques
The payoff determines how the return is calculated from the performance of the
assets. A rich set of payoffs is being offered in the market for meeting the targets
of investors with specific market view and risk profile. The goal of payoff design
consists of using the market view to offer the target return/risk profile with the price
constraint of investors. For minimizing the cost, the payoff needs to offer attractive
return when the market view is realized but gives little return or even suffers loss for
other market conditions. Therefore, a straddle (long call plus long put) may not be
a tempting payoff because the cost is too high. A structured product called “Twin-
Win” that will be introduced in the next chapter is a more common form of straddle
with an embedded risk-taking component which cheapens the price.
For a bullish structure in general, lower forward of the underlying leads to a
lower price. So, the underlying selection will favor the ones with high dividend, high
repo rate and low correlation for worst-of basket (if applicable). The denomination
currency of the underlying may matter if it is different to the currency of the product.
The spread of cross currency swap market and/or the correlation FX/underlying
contribute to lower forward as well.
According to the investor’s view and the budget for the product, the following
technical features are often employed in the payoff design:
1. Basket Performance Variations
– Worst-of Basket Performance: the most popular multi-underlying structures
are based on the worst performance of the underlyings due to the low cost.
The features of a product based on worst-of basket often look attractive which
may provide a comfortable protection cushion and/or high potential return.306 24 Structured Products
On the other hand, the cost of a “Best-of” based bullish product is normally
too high to get investors interested.
– Rainbow Basket Performance: for multi-underlying structures, the Rainbow
performance is measured as the weighted average of the performances accord-
ing to the performance ranking, e.g. 70% of the worst, 30% of the second
worst. Worst-of performance is a special case of Rainbow performance.
2. Cap on the Return
The binary option is the basic version of products with capped return. It has
the clear return target for the investor. This feature helps to reduce the cost
of the structure. For the multi-underlying structures, the Cap may be applied
to the averaged performance, to the best performance or to the performance of
each underlying (known as Individual Cap, which is an effective mechanism for
reducing cost).
3. Barrier
The barrier feature allows to achieve different purposes:
– providing protection: For example, short position of Down-and-In Put is often
seen in the structured products where the investor takes downside risk to fund
thereturnontheupside.Thebarrierprotectstheinvestoruntilthebarrierlevel.
– price cheapening: If the barrier event reduces the potential gain or even
incurring loss to the investor, the price of the structure will be cheapened
consequently. In the product design, the barrier is set at the level which is
unlikely to achieve according to the market view of the investor. One simple
example is an Up-and-Out call option.
– return lock-in: The barrier applied over a period of time, either continuously
or on discrete points, allows the investor to lock in the return over time. Binary
options or one touch options are simple examples.
The observation for the barrier event can be of American style (sometimes
noted as AKI – American Knock-In) or European style (sometimes noted as
EKI – European Knock-In, or AXKI – At Expiry Knock-In). For basket based
structure, the barrier is often observed on the worst-of performance. The best-of
performance may be applied for range-bound products or bearish products.
Apart from the barrier event observed on specific underlying’s price, there are
other types of barrier events:
– Target Redemption: the barrier event is considered to occur when the accumu-
lated gain for the investor has achieved a certain predefined target. A variation
consists of counting the accumulated number of times that the intrinsic value
has been positive instead of the accumulated gain.
– Memory Touch: forthe considered period, the barrier event isdeemed to occur
if the barrier has been hit by every underlying in a basket but not necessarily at
the same time. This feature is often used as an additional condition for locking
in a benefit for the investor.24.10 Pricing and Hedging 307
4. Averaging
It consists of using the averaged price as reference for the payoff calculation.
The volatility of the averaged price is lower than the volatility of price itself
(e.g. daily closing price). Averaging makes the price cheaper for products selling
volatilities. For the investors, the averaging mitigates the risk of abnormal price
moves.
5. American Option Feature
The American option gives the termination right to the option holder. When the
right is given to the product issuer, it is known as Issuer Callable structure. If
the right is given to the investor, the structure is then known as Puttable. In the
case of issuer callable structure, the premium from the call option is used for
enhancing the product return.
## 24.10 Pricing and Hedging
The standard model for equity-linked products is the local volatility model which
is used for the majority of the products. For interest rate products requiring term
structure modelling, LGM model with one or two factors and Libor Market Model
are the most popular ones. But models with more factors are needed for the
products with more complex risks. For foreign exchange rate linked structures,
stochastic volatility and local volatility models are frequently used in the market.
The parameters for each model should be calibrated with the liquid market traded
instruments. The hedging costs are considered in pricing by shifting the parameters
on the conservative side.
For multi-asset products, Monte Carlo is the usual numerical method which
offers the flexibility for payoff variations. For single underlying products, PDE and
tree methods are more efficient.
The nature of structured products often introduces gap risk and correlation risk
that are difficult or impossible to hedge. The techniques for mitigating these risks
are explained in Chap.16 covering exotic options in Part II.
Exercises
1. Consider the simplest option-based principal protected structure with a long call
option. How will a low interest rate environment affect such a structure?
2. Suppose you are structuring a near-zero-cost risk reversal (short OTM put with
strike K1 and long OTM call with strike K2 with K1 < K2) type of product for
a potential client. The client has a view on the underlying and thinks that the put
strike K1 can be moved further sway from spot, say, to be reduced by half. How
would you modify the risk reversal payoff?
3. Describe the relationship between the price of a worst-of call option and its
component asset volatilities.Chapter 25
Popular Structured Products
With the demand from investors and the increasing hedging capability of the
investment banks, new structured products keep being introduced to the market.
Some of the most popular structures in practice are presented in the sequel for
illustrating the limitless payoff variations. The product categorization is difficult
to make because the same structure may be used for different asset classes and
may offer yield enhancement, participation or leverage depending on the parameter
specifications.
We choose to present the popular structures by the underlying asset class instead
of technical feature, return profile or market view. The categorization by asset class
follows the organization of business lines in practice. The naming of the products
is not standardized across the issuers. There are product names suggesting technical
features (e.g. Fixed Coupon Callable Note) and product names used for marketing
campaigns (e.g. Himalaya, Athena, etc). It is common that the same structure is
named differently by the different issuers.
We highlight that the structures presented in one asset class may be applicable to
the other asset classes. For example, Target Redemption mechanism based products
presented for FX underlyings can be applied to equities as well.
## 25.1 Equity Structured Products
Equity structured products offer the most diversified product types and solutions.
Equity is a preferred asset class for retail investors who often invest in equity linked
products with their views on particular stocks or stock market. On the other hand,
it is relatively easier to structure product variations with equities due to the vast
universe for the underlying as well as the implementation flexibility for hedging
strategies.
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_25
309310 25 Popular Structured Products
## 25.1.1 Equity Linked Note (ELN) or Reverse Convertible Note
The Equity Linked Note (ELN, also known as Reverse Convertible Note) is one of
the most popular wealth management products, especially for private investors. It
offers yield enhancement by taking downside risk on equities. The ELN is often a
short term product (typically, 1 month – 6 months), issued at a discount to the face
value which implies the return of the investment. At maturity,
– iftheunderlyingstockpricehasnotdroppedbeyondacertainlevel(calledStrike)
which is set at a lower level than its initial price at inception, the investor will
receive 100% of the face value of the Note;
– Otherwise, the investor will receive a number of stocks determined by the Strike
price of the stock (physical settlement). Cash settlement with the equivalent value
may also be applied to the trade.
ELN is suitable for stable or bullish view of the underlying stock for the tenor of
the trade. The investor enjoys an attractive return if the stock does not underperform
significantly. In case that the investor will be delivered with stocks, the purchase
price will be the Strike price which is lower than the initial stock price, implying
a better return compared to the direct investment for the same period. On the risk
hand, the investor will be obliged to buy the stocks at the Strike level even though
the stock price dropped below this level. See Table 25.1 for an illustration.
Table 25.1 Illustration example of ELN (Equity Linked Note)
Issuer XYZ bank
Tenor 1 Month
Denomination (N) HKD 1m
Issue price N× (100% – Discount)
Discount 0.85%
Underlying stock [•]
Initial stock price (S0) HKD 102.10
Strike (K) 93%
Maturity payoff If final stock price (ST ) > K ×S0, Investor will receive 100% ×N;
Otherwise, Investor will receive N/(K × S0) stocks
If the currency of the stock (CcyS) is not the same currency for the Note (CcyN),
the final payoff wording will be the following which involves the foreign exchange
rate XT (the number of CcyS for 1 unit of CcyN at time T) for calculating the
number of stocks to be received by the investor:
Maturity payoff If final stock price (ST ) > K × S0, Investor will receive 100% ×N;
Otherwise, Investor will receive XT × N/(K × S0) stocks25.1 Equity Structured Products 311
Equity Linked Note (ELN)
Share Price
P L
0
S0
Strike Price
Initial Price
ELN with Knock-Out
Share Price 0
S0 105%S0
Strike Price
Initial Price
Knock-Out Price
P L
A simple variation of the ELN, called KO ELN, consists of introducing an
Up-and-Out Barrier (e.g. 105% S0) which is typically observed on a daily basis.
Upon Knock-Out event, the structure will be early terminated at par (i.e. 100% of
Denomination).
We show that, in the basic version of ELN, the investor is selling a geared Put.
Firstly, we note that
ST ×
N
K × S0
= N

1 +
1
K
×
ST
S0
− 1

= N 1 −
1
K
×

K −
ST
S0
!
.
Now, denote the investor’s final redemption value as N 1 −
1
K
F(ST ,K)
!
.
According to the terms of the ELN contract, we have
F(ST ,K) =

0, if ST
S0
≥ K,
K − ST
S0
, if ST
S0
< K.
Hence, F(ST ,K) = max{0,K − ST
S0
} which is the Put Option payoff with Strike
K, and 1
K is the “gearing” term in front of the Put Option in the final redemption
formula.
Thesameanalysiscanbemadewhenthecurrencyoftheshare(CcyS)isdifferent
than the currency for the Note (CcyN). The value of the stocks received by the
investor will be ST × [XT × N/(K × S0)] in CcyS, which is equivalent to (ST ×
XT ×N/(K ×S0))/XT = N 1 −
1
K

K −
ST
S0
!
in CcyN. We note that the Put
Option is a Quanto Option in this case.
The Put Option can be priced under the Black–Scholes–Merton model with
the implied volatility for the Strike. The local volatility model is normally used
for pricing the variations. For the ELN structure, the investor is short volatility,
long forward (long forward implies long interest rate, short dividend and repo
rate). So, higher the volatility and lower the forward, lower the issue price of the
product.312 25 Popular Structured Products
## 25.1.2 Fixed Coupon Callable Note (FCN) and Daily Accrual
Callable (DAC)
Fixed Coupon Callable Note (FCN) is gaining increasing popularity as a yield
enhancement product, particularly in low volatility market environment where it
is difficult for ELNs to show attractive yield levels. Compared to ELN, the tenor
is longer for FCN (typically 6M – 2Y). It offers fixed coupons that are paid
periodically to investors. The underlying is typically the worst performer of a basket
of two or three equity underlyings. There is an early termination feature: if the
underlying’spriceisabovetheKnock-Outbarrieratanyoftheobservationdates,the
note will be early redeemed at par (i.e. Denomination or its face value). At maturity
(if not early terminated),
– if the underlying has not underperformed beyond a certain level (called Strike),
the investor will redeem the note at par.
– Otherwise, the investor will receive the worst performing stock. The quantity will
be determined by the Strike price.
See Table 25.2 for an illustration example of FCN.
Table 25.2 Illustration example of FCN (Fixed Coupon Callable Note)
Issuer XYZ bank
Tenor 12 Months
Denomination (N) HKD 1m
Issue price 100% × N
Coupon 12% p.a. payable quarterly
Observations Quarterly
Underlying stocks S1 and S2
Underlying performance
at time t (Pt) Pt = min

S1
t
S1
0
,
S2
t
S2
0

which is the worst of basket
Initial stock price To be fixed at the inception of the trade
Strike level (K) 70%
Knock-Out barrier 100%
Early termination If the stock price has breached Knock-Out barrier at any
observation date, the Note will be early redeemed at par
Maturity payoff If PT > K, Investor will receive 100% ×N;
(if not early terminated) Otherwise, Investor will receive N/(K × S∗
0) stocks of S∗ (S∗ is
the worst performing stock at T)
In case the currency of S∗ is different than the currency of the
note, the number of stocks will be XT × N/(K × S∗
0)
Technically speaking, the perfect underlying for achieving high Coupon with low
Strike is a basket of stocks with high volatility, low correlation and high dividend
yield and repo rate. Evidently, increasing the number of stocks in the underlying25.1 Equity Structured Products 313
basketleadstoahighercouponlevel.Thecorrelationsbetweentheforeignexchange
rate and underlying stocks impact also the conditions of the structure. Readers
can refer to Chap.18 “Foreign Exchange Modelling”, Proposition 18.2 for the
correlation impact on the drift, or “Quanto forward”.
Further variations may be introduced for satisfying the investor’s needs:
• applying ATM Strike for the Put but combined with a Knock-In barrier which
provides a cushion for the downside risk
• Knock-Out barrier stepping down over time for making the early termination
easier (e.g. 100% for the first month, 99% for the second month...)
• Coupon based on floating rate, e.g. 3M Libor+10% p.a., and etc.
For investors who need to pay regular interests on a financing/borrow, FCN may
be used to generate the regular cashflows. For instance, clients of private banks may
use credit facilities (collateralized by clients’ assets) for making certain investment.
The interests are charged on the loan obtained by the clients.
Daily (Range) Accrual Callable Note (DAC) is a variation of FCN in which,
instead of paying a predefined coupon, the coupon payable at the end of each period
(e.g. i-th period) is determined according to the below formula
Couponi = R% ×
ni
Ni
× ti
where
R%: nominal annual interest rate (e.g. 15% p.a.)
ni: number of days in the period that the underlying performance Pti ≥
CouponBarrier; For simplification, CouponBarrier is often set at Strike
level
Ni: total number of days in the period
ti: year fraction for the period
## 25.1.3 Phoenix Callable Note
PhoenixCallableNotetakesthesamedownsideriskasFCNorDAC.Ontheearning
side, the investor will receive either a higher coupon or a lower coupon (often set
at zero) at the end of each period according to the performance of the underlying.
If the performance is at or above the Coupon Barrier (e.g. 80%), the investor will
receive the higher coupon. Otherwise, the investor will receive the lower coupon
for that period. Compared to FCN, the higher coupon level is higher because of the
condition to get the coupon. The pricing and hedging for Phoenix Callable Note is
similar to FCN, except that, due to the digital feature of coupon, payoff smoothing
needs to be applied on the coupon.314 25 Popular Structured Products
Table 25.3 contains an illustration example of Phoenix Callable Note.
Table 25.3 Illustration example of Phoenix Callable Note
Issuer XYZ bank
Tenor 12 Months
Denomination (N) HKD 1m
Issue price 100% × N
Observations Quarterly
Underlying stocks S1 and S2
Underlying performance
at time t (Pt) Pt = min

S1
t
S1
0
,
S2
t
S2
0

which is the worst of basket
Initial stock price To be fixed at the inception of the trade
Strike level (K) 70%
Coupon barrier 80%
Coupon 18% (Higher coupon), if Pti ≥ CouponBarrier;
(for the i-th period) 2% (Lower coupon), otherwise
Knock-Out barrier 100%
Early termination If the stock price has breached Knock-Out barrier at any obser-
vation date, the Note will be early redeemed at par
Maturity payoff If PT > K, Investor will receive 100% ×N;
(if not early terminated) Otherwise, Investor will receive N/(K ×S∗
0) stocks of S∗ (S∗ is
the worst performing stock at T)
In case the currency of S∗ is different from the currency of the
note, the number of stocks will be XT × N/(K × S∗
0)
## 25.1.4 Autocallable Structure
Autocallable products are very popular to retail investors, especially in South Korea
(usually with a basket of two underlyings), in Japan (mostly with one underlying
and is known as Uridashi for the product name) and in Europe (called Athena). It
can be structured as a Note, Certificate or a Swap. The Swap format is used for the
two institutions where one is the hedging party and the other one the distributor who
sells Notes/Certificates to the end investors.
The Autocallable structure is an income product which may be early terminated
if the underlying price satisfies a certain condition predefined in the contract, e.g.
when an Up-and-Out barrier is hit. Upon the termination event, the investor will
receive the principal plus a coupon equal ton×CouponRate where n is the number
of observation periods until the termination event. This type of coupon is known as
a Snowball Coupon. On the other side, the investor takes the downside risk with a
short Put (often with a Knock-In barrier).25.1 Equity Structured Products 315
We note that the word autocallable implies that the early termination is triggered
by the performance of the underlying. It marks the difference with the other types
of early termination determined at the discretion of the product issuer (known as
Issuer Callable) or the investor (known as Puttable). Actually, FCN and DAC are
also autocallable products. The autocallable feature helps to lock in the gain and
eliminate the risk for the investor. At the same time, it cheapens the cost of the
structure because it avoids the potential bigger gain which grows over time with
Snowball effect if the underlying performs well. See Table 25.4 for an example.
Table 25.4 Illustration example of an Autocallable Swap
Structure Swap
Notional KRW20bn
Tenor 3 years
Underlying Worst performer of KOSPI200 Index and HSCEI Index
Funding KRW CD Ratea +0.15% p.a. quarterly
Observation Every 6 months
Knock-Out barrier 90/90/85/85/80/80, in % of initial index levels
(stepping down every 6 months)
KO coupon 6.5% p.a. if Knocked-Out
Put strike 100% (ATM)
Knock-In barrier 60%, daily observation on closing prices
Bonus couponb 3 × 6.5%, if not Knocked-In and not Knocked-Out until maturity
a It is a floating interest rate in the money market of South Korea
b This feature is optional. Careful readers may notice that the Autocallable product with Bonus
Coupon feature offers a similar return to investors as an FCN under most of the scenarios of
underlying performance
The hedging of Autocallable structures is tricky because of the volatility convex-
ity behaviour which may make the product hedger buy volatility when its level rises
and sell volatility when it falls. The local volatility model is widely used for pricing
and hedging autocallable structures. But stochastic volatility models better capture
the risks from the volatility variability. The price discontinuity of the structure due
to the barriers may be smoothed out by the techniques of barrier shift and call/put
spread presented in Chap.16, “Exotic Options Pricing and Hedging”. As to the
numerical method, PDE or tree method are the efficient ones for the structures with
single underlying. Monte Carlo is universal for pricing all autocallable structures,
especially those with a basket underlying.
## 25.1.5 Issuer Callable Structure
Issuer Callable Structure means that the issuer of the product has the right to
early terminate the trade at one of the predefined dates or within the predefined
time windows. Technically speaking, the return for the investor is enhanced by316 25 Popular Structured Products
the “option value” of the early termination right given (or, more precisely, sold)
to the product issuer. The callable structures are usually designed in a way such
that the early termination event provides an attractive benefit to the investors.
The early termination feature is generally perceived by the investors as a lock-in
mechanism for the gain. The drawback of the issuer callable product to the investors
is the uncertainty as to when the product will be called (i.e. early terminated). See
Table 25.5 for an illustration.
The structure where the call right is given to the investor instead of the issuer is
known as a Puttable structure. This type of products is less common in the market
because the call right given to the investor makes the product “more expensive”
leading to reduced returns. As the investors normally determine the early termi-
nation/continuation according to their views on the market instead of the optimal
option exercise time calculated by a pricing tool, the termination/continuation
decision is often not optimal as seen by the hedging party, i.e. the product issuer.
So, the hedging party is likely to realize hedging profit for such products.
The pricing of multi-asset callable structures requires American Monte Carlo
algorithms.TheLeastSquareAmericanMonteCarlomethodproposedbyLongstaff
and Schwartz is widely used in practice (cf. Chap.15 “American Options”). We
highlight that this method gives only the lower bound of the optionality value which
is conservative for the issuer callable products because it implies that the issuer
“buys” the call option at a lower price. However, for Puttable structures, this method
may lead to a too aggressive pricing for the product issuer due to the potential under-
estimation of the option value that the issuer “sells” to the investor.
Table 25.5 Illustration example of Issuer Callable Note
Structure Note
Notional TWD800m
Tenor 2 Years
Underlying performance Worst performance of 5 stocks
High coupon 10% p.a.
Low coupon 2% p.a.
Coupon payment Half yearly
First coupon date High coupon is guaranteed
From second coupon date
onward
→ High Coupon: if no stock has ever traded below Barrier in
the period
→ Low Coupon: otherwise
Barrier 65%
Final redemption → 100%: if Barrier has never been hit (daily monitoring)
→ Min{100%, Final Price/Initial Price}: otherwise
Issuer call Every 6 months, Issuer has the right to early terminate the Note
at par25.1 Equity Structured Products 317
## 25.1.6 Wedding Cake
This payoff is suitable for investors with a range view. The investor will receive a
payoff contingent to the scale of the price change for the observation period. The
observation may be at the end of the period (known as European style) or monitored
over the whole period (known as American style). The underlying for the product
may be a single underlying or a basket of underlyings with observations on the worst
and the best performances of the basket. The performances are measured against
the initial prices at inception. This product is not based on a directional view. The
investor enjoys the absolute return if the price change is moderate. The risk is the
potential low return if the price has moved with a larger scale than expected.
Price
P L
0
S0
For pricing, we may use the same pricing model for standard European or Amer-
ican Binary options. The discontinuity smoothing needs to be applied. Obviously,
the structure is sensitive to the volatility of the underlying.
## 25.1.7 Bonus Enhanced Note (BEN)
Bonus Enhanced Note offers yield enhancement or participation according to the
performance of the underlying. It is a bullish product offering unlimited upside on
the price return of the underlying as shown in the following graph:
Bonus Enhanced Note (BEN)
Share Price
P L
0
S0 S0
Bonus Coupon
Recovery Note
Share Price 100%
Bonus Coupon
P L
Actually, the BEN needs to be structured with stocks showing low forward (high
dividend and repo rate). Technically, the investor forgoes the dividend and the
security lending or repo fees for the benefit shown by the (diagonal) triangle in
the graphic. The tenor should include the next ex-dividend date. See Table 25.6 for
an example.318 25 Popular Structured Products
Table 25.6 Illustration example of Bonus Enhanced Note
Structure Note
Notional (N) USD1m
Tenor 3 months
Underlying A dividend paying stock
Coupon 6.5% flat (i.e. 26% p.a.)
Strike (K) 100%
Final redemption If
ST
S0
≥ K, Investor will receive N × max

1 + Coupon,
ST
S0

;
Otherwise, Investor will receive a number of
N
K × S0
stocks
If a worst-of basket is used as underlying, it may be possible to have the below
variations:
• a floor for limiting the downside risk, or
• a Knock-In barrier for the Put
Another variation, known as Recovery Note, consists of offering a digital payoff
as shown in the graphic. As suggested by its name, it is often proposed to the
investors who have suffered loss from the holding of the underlying stock and wish
to recover the loss if the price of the underlying stock will finish above the Strike
at maturity. In such case, the investor should sell the stocks and buy the Recovery
Note using the sale proceeds.
## 25.1.8 Accumulator
Accumulator is one of the most popular short term products for private investors in
Asia. It also carries other names such as Knock-Out Forward, BBM (Buy Below
the Market), etc. It is an OTC contract between the investor and the product issuer
(e.g. a private bank) in which the investor buys, on a daily basis a certain number
of shares at a fixed price, called Strike Price, which is at discount to the initial
price (e.g. 80%) for the whole tenor of the contract. The shares are delivered to
the investor periodically, e.g. every week or every month. If share price trades
above a pre-defined Knock-Out barrier level (e.g. 105% of initial stock price) on
any day, the investor will stop buying the shares and the trade is early terminated.
The contract starts at the value of zero for both parties, similar to a Swap contract.
However, the investors are normally required to post collateral for the transaction
(e.g. 35% of total exposure) which is a general practice for the OTC transactions
where the product issuer has credit risk exposure of the client. See Table 25.7 for an
illustration.25.1 Equity Structured Products 319
Table 25.7 Illustration example of (non-leveraged) Accumulator
Maturity 52 weeks
Share name [•]
Number of shares per day (n) 1,000
Knock-Out 105% of Initial Share Price, observed intraday
If the share trades at or above 105% of the Initial Share Price
at anytime, the trade will be terminated
Strike price 85% of Initial Share Price
Client purchases n shares every day at Strike price
Settlement Settlement at the end of every week
Termination If no Knock-Out, the structure will terminate at the end of the
Maturity
Inception Maturity
Share Price
105%
100%
85%
Buying Shares
Knock-Out
ForachievingalowerStrikePrice,investorsoftenprefertoinvestintheleveraged
version of Accumulator in which the investor will buy a leveraged number of shares
(e.g. two times) if the stock price is below the Strike Price on the considered date.
For the above example, the terms may be modified as follows:
Strike price 85% of Initial Share Price
Foreachbusinessday,iftheclosingpriceoftheshare>StrikePrice,Client
purchases n shares at Strike Price; Otherwise, Client purchases 2×n shares
at Strike price
Technically, Accumulator is a strip of call and put options with a common
Up-and-Out barrier as illustrated in the graphic. In particular, the non-leveraged
version is a strip of forward contracts with an Up-and-Out barrier. For the two times
leveraged version, it is a strip of option combinations of long 1 call, short 2 puts with
the same Up-and-Out barrier. The local volatility model is normally used for pricing
the Accumulator. For the numerical methods, PDE or tree method are preferred to
Monte Carlo which is less accurate and slower.320 25 Popular Structured Products
Accumulator
Share Price
P L
0
85% 100%105%
Strike Price
Initial Price
Knock-Out Price
Leveraged Accumulator
Share Price 0
85% 100%105%
Strike Price
Initial Price
Knock-Out Price
P L
## 25.1.9 Decumulator
The opposite trade to Accumulator is the so-called Decumulator which consists of
selling shares at premium to the initial share price. It is also known as Reverse
Knock-Out Forward or SAM (Sell Above Market). Similar to the Accumulator, the
investor will stop selling shares if the share price trades below a pre-defined Knock-
Out barrier level on the downside.
Decumulator
Share Price
P L
0
115%
100%
95%
Strike Price
Initial Price
Knock-Out
## 25.1.10 Shark-Fin
Shark-Fin offers limited participation to the upside. Technically, Shark-Fin structure
is just an Up-and-Out Call Option. The barrier observation is usually on continuous
or daily basis. Because of its cheap price, Up-and-Out Call is often used to structure
principal protected products (e.g. offered as a structured deposit in South Korean
retail banks).25.1 Equity Structured Products 321
Share Price
P L
0
S0 Barrier
Rebate
Shark-Fin is in fact a standard Up-and-Out barrier option. For equity underlying,
the local volatility model is a good choice for pricing barrier options.
## 25.1.11 Twin-Win
The basic payoff of Twin-Win consists of a long position of Down-and-Out Straddle
and a short position of Down-and-In Put with the same barrier level. The structure
may be sold either as an option combination at zero cost (illustrated by the P/L
graphic), or as a structured Note issued at par.
Theproductissuitableforadirection-lessbutlimiteddownside marketview.The
investor enjoys the absolute return if the barrier on the downside is not hit. However,
the investor may suffer substantial loss if the underlying price dropped beyond the
barrier level. The structure is cheap when the volatility is high. Hence, it is often
proposed to investors when the market has gone through a significant correction. In
such situation, the volatilities are high but people believe that the market may not
suffer another big downturn beyond the level of the protection (knock-in barrier).
Price
P/L
0
S0
A Twin-Win Note is a further tweak which is presented through the below
example with a single stock as underlying. Worst-of basket may also be used as
underlying. Table 25.8 contains an illustration of a Twin-Win Note.322 25 Popular Structured Products
Table 25.8 Illustration of Twin-Win Note
Structure Note
Notional (N) USD1mio
Tenor 6 months
Underlying Stock A
Performance (at t) Pt = St
S0
, St is the closing price for date t
Observation dates Monthly dates except the last one, i.e. 5 dates in total
KO barrier (H) 100%
KO event Deemed to have occurred if Pti ≥ H on any Observation Date ti
KO coupon 12.5% p.a., i.e. i×12.5%
12 if knocked out at the i-th Observation Date
Strike (K) 100%
KI barrier (L) 75%
KI event Deemed to have occurred if on any date t, Pt < L
Early termination If KO Event occurred, the Note will be early redeemed at
N × (1 + KO Coupon)
Maturity payoff At maturity, if not early terminated, Investor will receive:
→ N × (1 + |PT − 1|), if KI Event has never occurred;
→ N × (1 + max{0,PT − 1}), if KI Event has occurred and PT ≥ K;
→ N/(K × S0) units of stocks, if KI Event has occurred and PT < K
The same pricing model for standard barrier options may be used for pricing
Twin-Win. The price discontinuity of the structure due to the barrier should be
smoothed out by the techniques of barrier shift (for American barrier) or call spread
(for European barrier). The structure is quite sensitive to the volatility and the skew
parameters.
## 25.1.12 Tracker+ Note
This structure offers the underlying’s performance with a conditional protection.
The protection is activated if the underlying’s performance achieved a pre-defined
barrier level during the tenor of the product. The underlying is usually a worst-of
basket.
Performance
Payoff
100%
100%
floor activated if
performance ≥ Barrier25.1 Equity Structured Products 323
A variation consists of offering an additional condition to trigger the protection
with the “memory-touch” mechanism: e.g. the barrier event is also deemed to
happen if each underlying in the basket has breached the barrier at some time,
independently or concurrently, during the observation period.
## 25.1.13 Leveraged Structures
A Leveraged Note offers a leveraged return of an investment with a fixed maturity.
For example, a Note offering 2 times the performance of a stock, either positive or
negative, net of financing cost for the leveraged investment. By the legal nature of
Note, the maximum loss for the Note investor is limited to the purchase price of the
Note (e.g. zero redemption value). So, taking a 2 times leveraged Note as example,
the issuer will start to suffer loss when the stock price drops by more than 50% if
the issuer simply hedged with 2 times investment in the underlying. For addressing
this issue, the issuer usually implements one of the two mechanisms:
• Optional payoff: the Note redemption value is defined as Notional ×
max

1 + PR ×

ST
S0
− 1

,0

which is equivalent to PR × Notional ×
max

ST
S0
− K,0

where K = 1 −
1
PR
. Clearly, it is an ITM call option when
PR > 1. The investment in the underlying will follow the option’s delta.
• Stop-loss: this approach consists of introducing an early termination feature
linked to a pre-agreed stop loss level. As soon as the Note value (or equivalently,
the performance of the investment with leverage minus financing cost) drops
below the stop loss level, the Note will be early redeemed at loss for the Note
investor. For the risk analysis for the issuer, we refer to the gap-risk based asset
allocation techniques in the next chapter.
The ITM (in-the-money) Call option is another structure for getting leveraged
exposure to the performance of the underlying without paying too much time-value
for the option. The popular CBBC warrant is an example of such product. For
active investors, there may be a need to early terminate the trade for locking in
the underlying’s good performance. The American option may be a good choice
due to its transparency of early termination price which is the intrinsic value.
Total Return Swap (TRS) is a preferred trade for institutional investors for
leveraged exposure because the money engaged by the investor is only the initial
margin (called IA – Independent Amount, e.g. 15% of the notional amount) and
the variation margin during the life of the transaction. The ISDA/CSA agreement
is required in general. The IA depends on the PFE (Potential Future Exposure –
introduced in the Chap.22, Sect.22.4) of the TRS. An efficient way for reducing
the IA consists of resetting the P/L regularly, e.g. monthly. The Swap is then called
a resettable TRS.324 25 Popular Structured Products
## 25.1.14 Booster Note
Booster Note is a bullish product offering leveraged upside until the cap level. This
is achieved by giving up the further upside, as shown in the graphic. A floor can
be applied by lowering the cap level. If the underlying is a worst-of basket, it is
possible to have a floor (e.g. 95%) and a high cap or even no cap.
Performance
P L
100%
100%
2× leverage
## 25.1.15 Stellar Note
This is an income structure based on individually capped basket of underlyings. It
pays regular coupons which are the positive basket performances at the observation
dates. For investors who are bullish for the long term but concerned by the near term
market volatility, this structure can be an alternative to fixed-income products.
See Table 25.9 for an illustration example of Stellar Note.
Table 25.9 Illustration example of Stellar Note
Structure Note
Notional (N) EUR10mio
Tenor 10Y
Underlying S1 = EURSTOXX50, S2 = HSCEI, S3 = SPX
Coupon payments Yearly
Coupon(1) 3.5%
Coupon(i), i = 2,...,10 N × max{0,P(t) − K}
Performance P(t) 1
3
3 
i=1
min

Si
t
Si
0
,Cap

Cap 106%
Strike (K) 100%
Final redemption At par25.1 Equity Structured Products 325
## 25.1.16 Cliquet Option
Cliquet Option is an option using the future market prices of the underlying as
references (e.g. option Strike) in the payoff, for example, the call option on the
sum of the intrinsic values of forward starting options. The cap and floor are often
applied on the intrinsic values in a Cliquet option as illustrated by the following
example:
max

0,
12
i=1
max

−4%,min

2%,
Si
Si−1
− 1

,
where Si is the price of the underlying at the end of the i-th month.
Cliquet option’s premium can be very low if the cap level is low. It is sometimes
used for structuring products with tiny premium amount to spend. However, for
obtaining a good return with Cliquet structure, the underlying’s price needs to
continually perform in the right direction for most of the times during the tenor
of the product.
The price of a Cliquet option is sensitive to forward skew due to the cap and
floor levels applied on forward starting options. The local volatility model is not
suitable for pricing Cliquet options because it does not preserve the forward skew
of volatilities. Actually, the local volatility surface tends to flatten for the long
term part. More advanced models with volatility dynamics, e.g. stochastic volatility
models or jump-diffusion models are often used in practice for pricing Cliquet
options. The Cliquet option often gives negative volatility convexity exposure to
the issuer which makes the hedging difficult. The investment banks are cautious for
offering this type of products.
## 25.1.17 Himalaya
Initially created by Société Générale at the time around year 2000, Himalaya
structure is a typical example for demonstrating the flexibility and openness to
imaginationinfinancialengineering.Theprincipalofthestructuremaybedescribed
by the following fictive example of the basic version:
1. Assume 5 yearly observation periods and initially 5 stocks as underlying.
2. At the end of each yearly observation period except the last one:
→ record the performance of the best performing stock in the underlying
basket, and then,
→ remove this stock from the underlying basket for the following observation
periods326 25 Popular Structured Products
3. For the last observation period which is the maturity date of the product, there
will be only one stock remaining in the underlying basket. Its performance is
then recorded for the last period.
4. The payoff of the structure for the investor is the arithmetic average of the
recorded performances.
In a Himalaya structure, the best performances are locked-in at each period.
However,theperformanceinthelastperiodcouldbeverylowwhichmaydragdown
the final payoff. As the performances at the observations are always measured with
the initial stock prices, the performance for the last period might be very negative.
For equity linked products, local volatility model with Monte Carlo implementa-
tion can be used. The stock removing may create a discontinuity but it is normally
small and may be neglected in pricing and hedging.
## 25.2 Fixed-Income Structured Products
Fixed-Income derivatives and structured products offer investment and hedging
solutions linked to rates and credit for both asset and liability management. Fixed-
Income derivatives such as Interest Rate Swap, Swaption, Cap/Floor, CDS are
actively used by the financial market professionals and money managers. Various
structured products have been introduced for financial institutions, corporates as
well as retail investors. The tenors of Fixed-Income products are longer than those
for equity and FX structured products in general.
## 25.2.1 Range Accrual
A (Daily) Range Accrual (also called Corridor) structure has a number of observa-
tion periods (e.g. every 6 months) until maturity of the trade. At the end of each
period, the investor will receive a coupon calculated with the following formula:
Couponi = R% ×
ni
Ni
× Ti
where
R%: nominal annual interest rate (e.g. 8% p.a.)
ni: number of days during the period that the closing price of the underlying has
been within the predefined range [L,H]
Ni: total number of days in the considered period
Ti: time fraction in years for the considered period.25.2 Fixed-Income Structured Products 327
Although, the structure is introduced in this section, it is however applicable
to all asset classes: rates, equities, FX and commodities. For equity (and some
commodities) underlying, it is normally structured with one sided barrier (i.e. the
upper barrier is set to +∞). The reason is that people often have bullish views on
these underlyings due to the (natural) growth perspective. Daily Range Accrual is
also a popular structure for hybrid products where investors have views on assets
from different asset classes (e.g. equity, rate and FX).
For basket underlying, the Range Accrual products can be structured with the
worst performance for the lower barrier observation and the best performance
for the upper barrier observation. It means that the performances of all underly-
ings in the basket should stay within the range for the accrual. With the same
option price, the basket version has wider range levels than the single underlying
case.
Maturity
Price Level
H = 105%
100%
L = 95%
Period 1 Period 2
Technically, a Range Accrual option can be decomposed into a sum of binary
options. The short party of a Range Accrual option is buying volatility (and selling
correlation for the basket version) in general. The pricing model for the binary
options is applicable for Range Accrual options.
There are a few other interesting variations for Range Accrual structures:
– full coupon lock-in: as soon as the number of accrued days breaches a certain
threshold, the full coupon will be paid to the investor;
– “accrual/decrual” structure: it adds a “decrual” feature which consists of
reducing the number of accrued days if the underlying’s price is outside
the range. For instance, we may design a Swap paying a coupon of
max

−2%,R% ×
ni − 3 × (Ni − ni)
Ni

× Ti. This decrual feature helps to
enhance the level of R% when the normal range accrual structure is not attractive
enough. The payoff is less smooth than a normal daily range accrual, but it is
smoother than a binary coupon observed at the period end only.328 25 Popular Structured Products
## 25.2.2 Inverse Floater
The basic payoff of Inverse Floater is
N × max{0,K − leverage × rT },
where K is a constant reference level, leverage is the leverage factor and rT is the
floating rate (e.g. USD 3M Libor) level at maturity date T. It is clearly a European
Put option on the floating rate.
## 25.2.3 Zero Coupon Callable Note
As indicated by its name, the Zero Coupon Callable Note is a zero coupon note
which pays the coupon at the maturity or the early termination time. We illustrate
the structure with a fictive example; see Table 25.10.
Table 25.10 Illustration example of a 10Y (1Y Non Call) Zero Coupon Callable Note
Issuer XYZ
Currency USD
Tenor 10Y
Denomination (N) USD 100,000
Issue price 100% of denomination
IRR 4% p.a.
Early termination At the discretion of the issuer
Callable date Quarterly, starting from Year 2
Early redemption N × (1 + IRR)t, where t is the number of years from inception to
Early Redemption date
Final redemption N × (1 + IRR)10
In this structure, the Note investor is short a call option (Bermudan option) for
earning a higher return than the fixed interest rate from the same issuer for the same
maturity.
## 25.2.4 Reverse Convertible Note on Rate
The Reverse Convertible Note for equities (also known as ELN) has been extended
to rate underlyings recently. We show it through an example in Table 25.11.
With a similar analysis for the ELN, we can find that the final redemption is
N ×(1+Coupon)−N ×min

1,max

0,
1
K

K −
RT
R0

. Hence, the investor25.2 Fixed-Income Structured Products 329
Table 25.11 Illustration example of Reverse Convertible Note on USD CMS (Constant Maturity
Swap) 10Y
Issuer XYZ
Currency USD
Tenor 1 month
Denomination (N) USD 100,000
Issue price 100% of denomination
Underlying USD CMS 10Y
Initial level of CMS 10Y (R0) 1.95%
Coupon 5% p.a. payable at maturity
Strike (K) 75.5% (or CMS 10Y level 1.4723%)
Final USD CMS 10Y (RT ) USD CMS 10Y level observed at maturity
Final redemption if RT ≥ K × R0, Investor will receive N
otherwise, Investor will receive RT ×
N
K × R0
floored at zero
is short a Put option on rate. As the underlying interest rate may become negative,
the option has a cap for limiting the maximum loss to N.
## 25.2.5 Yield Spread Structure
Yield spread (e.g. 20Y CMS rate minus 2Y CMS rate) linked trades are also known
as “Steepeners”. They provide opportunities to generate returns or to effectively
hedge portfolios by taking the exposure on yield difference between the maturities.
In the market, it is frequent to see the spread trades having long tenors and issuer
callable features. See Table 25.12 for an example.
Table 25.12 Illustration example of Callable Steepener Note
Issuer XYZ Bank
Tenor 5 Years, subject to early termination
Denomination (N) USD 20mio
Issue price N × 100%
Final redemption N × 100% (if not called by the issuer before the maturity)
Underlying USD 10-year CMS rate − 2-year CMS rate
Quarterly coupons N × min{6%,max{0,5.6 × (10Y CMS rate − 2Y CMS rate)}}/4,
if the note is not early terminated
Early termination At the end of each quarter, Note issuer has the right to call the Note at par
For European spread options, there exist active broker markets for some pairs.
The modelling can be realized on the two underlying CMS rates separately. Copula
may be used for calibrating the Swaption volatilities of the two CMS rates and
other parameters. For the structure with callable feature, interest rate term structure330 25 Popular Structured Products
modelling is required. At least two factors for the rates are necessary for capturing
the yield spread dynamics and stochastic volatilities.
## 25.3 Foreign-Exchange Structured Products
Foreign exchange instruments and structured products are actively used by financial
institutions and corporates for hedging and investment. Retail investors often use
FX products for yield enhancement.
## 25.3.1 Dual Currency Investment (DCI)
It is a short term (1 week – 12 months) product for yield enhancement which
involves a base currency and an alternative currency. The investor of a DCI with
initial investment in base currency believes that the alternative currency will not
depreciate against the base currency and wants to monetize this view for an
enhanced yield. See Table 25.13 for an illustration example.
The initial investment of the investor is in base currency. At maturity of the
DCI,
– if the FX Spot fixing at maturity is equal or higher than Strike (expressed as
units of alternative currency per base currency): the investor will receive the total
amount of principal plus interest in base currency;
– otherwise, investor will receive the total amount of principal plus interest in
alternative currency converted with Strike.
Table 25.13 Illustration example Dual Currency Investment (DCI)
Base currency USD
Alternative currency JPY
Tenor 2 months
Notional (N) USD 100,000
Spot reference (i.e. initial spot) 111.00
Strike (K) 1/113.01 (USD units per JPY)
Coupon (C) 1% (6% p.a.)
Final spot XT Expressed as USD units per JPY
Final redemption If XT ≥ K, N × (1 + C) = 101,000 in USD
otherwise, N × (1 + C)/K = 11,414,010 in JPY25.3 Foreign-Exchange Structured Products 331
In DCI, the investor’s exposure is short Put option on alternative currency at
Strike as shown by the final value measured in the same currency (which is USD
in our example):
N(1 + C)1XT ≥K + (XT N(1 + C)/K)1XT <K
= N(1 + C)

1 −
1
K
(K − XT )1XT <K

= N(1 + C)

1 −
1
K
max{0,K − XT }

.
25.3.2 FX Accumulator
Accumulators are actively traded on FX rates similarly to equity Accumulators.
The tenors of 3M, 6M and 1 year are actively traded. See Table 25.14 for a
Boosted/Leveraged product example.
Table 25.14 Illustration example of Boosted EUR/USD Accumulator – Daily Accrual, Monthly
Settlement
Currency pair EUR/USD
Tenor 12M
Daily notional N euros
Spot ref 1.1780
Strike (K) 1.1490
Accrual On each business day, Investor buys EUR/USD at Strike. The quantity is N
if the fixing price is above Strike; Otherwise, the quantity will be 2 × N
Settlement Monthly
Knock-Out rate 1.2080
## 25.3.3 Target Redemption Forward (TRF)
TRF (Target Redemption Forward) is a very popular structure for FX investors.
The special feature of a Target Redemption structure is that when the accumulated
coupons or intrinsic value for the investor achieved a certain level, the whole
structure will be early terminated. See Table 25.15 for an illustration of boosted
TRF. A variation consists of counting the accumulated number of times that the
intrinsic value has been positive instead of the accumulated intrinsic value.332 25 Popular Structured Products
Table 25.15 Illustration example of a Boosted TRF
Currency pair EUR/USD
Notional per fixing (N) EUR200k
Tenor 12M, monthly settlement
Spot ref 1.1780
Strike (K) 1.1410
Intrinsic value max{ERR − K,0}
Frequency Monthly fixing and monthly settlement
Target 10 Big Figures (i.e. 0.1000), Exact (meaning that the total payout at
Knock-Out is exactly 10 Big Figures)
Knock-Out event If accumulated Intrinsic Value ≥ Target
Payoff for each fixing
(before Knock-Out)
If ERR ≥ K, investor buys N at K; Otherwise, investor buys 2×N
at K
Where ERR (Expiry Reference Rate) is the fixing at the monthly observation date
The TRF allows the investor to buy a certain currency at discount (or to sell
at premium) until the early termination event which is triggered by the Target
Redemption mechanism. A structured Note with Target Redemption is known as
a TARN.
Boosted TRF
EUR/USD
P L
0
K X0
Target Redemption
Variations of TRF
One popular variation is the Pivot structure where the investor will be buying the
foreign currency at Lower Strike and selling at Higher Strike. It is suitable for clients
believing that the FX rate will be trading in a range for the considered tenor. Target
Redemption is a natural Knock-Out mechanism for Pivot structure. See Table 25.16
for an example.25.3 Foreign-Exchange Structured Products 333
Table 25.16 Illustration
example of Pivot TRF
Currency pair AUD/USD
Notional AUD100k per Month
Tenor 12M, monthly fixing and settlement
Spot ref X0, K1 ≤ X0 ≤ K2
Buy strike K1
Sell strike K2
Pivot strike Kp
Target 0.2000 Exact
Intrinsic value if ERR < Kp: max{ERR − K1,0}
if ERR ≥ Kp: max{K2 − ERR,0}
Knock Out event if accumulated Intrinsic Value ≥ Target
Settlements if ERR ≤ Kp: investor buys at K1
if ERR > Kp: Investor sells at K2
Where ERR (Expiry Reference Rate) is the fixing at the
monthly observation date
Pivot TRF
AUD/USD
P L
0
K1
Kp K2
Target Redemption
We note that in the examples of Pivot, we have chosen Kp − K1 = K2 − Kp (a
butterfly structure). But in general, Kp − K1 may differ from K2 − Kp.
Similar to the Boosted TRF, the boosted version of Pivot TRF allows the investor
to have wider Strike levels. We illustrate with graphics and fictive examples the two
popular variations: Boosted Pivot TRF and One Sided Pivot TRF (Table 25.17).
Boosted Pivot TRF
AUD/USD
P L
0
K1 Kp K2
Target Redemption334 25 Popular Structured Products
Table 25.17 Illustration example of one sided AXKI Pivot TRF
Currency pair AUD/USD
Notional AUD1mio × AUD2mio per Month
Tenor 12M, monthly settlement
Spot ref 1.0359
Lower strike (K1) 0.9900 Upper strike (K2) 1.0700
Pivot strike (Kp) 1.0300 AXKI barrier 0.9100
Target 0.1500 exact
Intrinsic value if ERR < Kp: max{ERR − K1,0}
if ERR ≥ Kp: max{K2 − ERR,0}
Knock Out event if accumulated Intrinsic Value ≥ Target
Settlements if ERR ≥ K1 and ERR ≤ Kp: investor buys AUD1mio at K1
if ERR > Kp and ERR ≤ K2: investor sells AUD1mio at K2
if ERR < AXKI: investor buys AUD2mio at K1
Otherwise, no settlement
Where ERR (Expiry Reference Rate) is the fixing at the monthly observation date
One-sided At Expiry Knock-In Pivot TRF
AUD/USD
P L
0
AXKI Barrier
K1 Kp K2
Target Redemption
## 25.4 Commodities Structured Products
In general, commodities linked structured products are less traded compared to the
ones that are linked to other asset classes. Precious metals, Oil (Brent or WTI) are
more often used as underlyings than other commodities such as the industrial metals
and soft commodities.25.5 Hybrid Structured Products 335
We may list a few examples of structured products linked to commodities:
– Reverse Convertible linked to the price of Oil front-month futures: 6M USD
Note, Put Strike 100%, American Knock-In Barrier at 72% of Initial Spot, 10%
p.a. Coupon;
– DAC (Daily Range Accrual Callable): 2Y USD Note, Worst-of basket
Gold/Silver/Platinum, Nominal Coupon 8%, Accrual Barrier = Put Strike =
87%, Autocall Barrier 100%.
## 25.5 Hybrid Structured Products
When the underlyings belong to different asset classes, the structured product is
called a hybrid product. It allows the investor to take advantage of their views on
more than one asset class. The structures for basket underlying presented so far are
generally applicable to hybrid underlyings. In the following, we will show a few
hybrid structures for illustration purpose.
## 25.5.1 Callable Daily Range Accrual
Table 25.18 illustrates an example with interest rate and equity as underlying. The
interesting feature to observe is that the range for equity and the range for interest
rate are set to their respective levels.
Table 25.18 Illustration example of Callable Daily Range Accrual
Structure Note
Notional (N) USD20mio
Tenor 10Y, NC1Y (No Call for the first year)
Underlying SPX Index, USD Libor 3M
Equity condition SPX Index closes at or above 50% of Initial level
Rate condition USD Libor 3M fixing is below 5% (Spot Rate Ref 1.34%)
Quarterly coupon Notional × 3.35% ×m/M, where
m is the number of days both Equity Condition and Rate Condition
are satisfied, and M is the total number of days in the period
Issuer call Quarterly after Year 1, issuer has the right to early redeem the note
at par
Final redemption 100% of Notional
(if not early redeemed)336 25 Popular Structured Products
## 25.5.2 Best-of Profile
Best-of-Profile delivers the best performance of different asset portfolios. Each
portfolio represents a specific investment profile. The profile of a portfolio can be
achieved by
– choosing the assets from different asset classes
– weighting the assets differently according to the riskiness or geographic expo-
sure.
Table 25.19 Illustration example of Best-of-Profile
Structure Option
Notional USD20mio
Tenor 3 Years
Underlying 3 Portfolios:
Aggressive Portfolio (P1): 50% Equity+30% Commodities+20% Bond
Balanced Portfolio (P2): 33% Equity+33% Commodities+34% Bond
Conservative Portfolio (P3): 20% Equity+30% Commodities+50% Bond
where
Equity=33% S&P Index+33% EuroSTOXX+34% HSCEI
Commodities=GSCI Commodities Index
Bond=iBoxx Investment Grade Bond Index
Maturity payoff max{0,max{Perf(P1),Perf(P2),Perf(P3)} − 1} where
Perf(Pi) = Pi(Final)/Pi(Initial),i = 1,2,3
Best-Of Profile can be sold either as an option (cf. Table 25.19) or as a structured
note.Itissuitableforuncertainmarketviewbyofferingthebestperformanceamong
the investment portfolios. However, the expected gain is often limited because the
portfolios tend to have low volatility.
In general, the product issuer is buying correlation between the portfolios but
selling correlation between the assets within a portfolio. So, the correlation shifts
should be applied accordingly in pricing.
25.5.3 ASCOT: Asset Swapped Convertible Option Transaction
Convertible bonds (CBs) often present opportunities to credit and equity investors
(cf. Sect.25.8 Equity Derivatives for Corporates). But some credit investors may not
be willing to handle the equity risk and vice versa for the equity investors.
ASCOT consists of separating a convertible bond into two related products for
two types of investors:
– credit investor: a note paying attractive floating rate based coupons
– equity investor: an option providing return on the equity upside.25.5 Hybrid Structured Products 337
We illustrate the structure by a fictive example. Let us assume that
– a hedge fund (A), holding a CB, wants to free up the capital but keeps the upside
exposure to the equity;
– an institutional investor (C) is interested by an investment bearing the credit risk
of the CB issuer;
– a Dealer (B), usually an investment bank, arranges the trades with ASCOT.
(C)
Credit Investor
Synthetic FRN
CB
USD 3M Libor +0.50%
100%
2.00% p.a.
(B)
Dealer
ASCOT
100%−NPV0 = 93.60%
CB
(paying 2.00% p.a.)
(A)
ASCOT Investor
ASCOT Strike =
(100%−NPVt of IRS)
2.00% p.a. USD 3M Libor +0.50%
IRS
Counterparty
Investor (C) buys from the Dealer (B) a synthetic FRN (Floating Rate Note) at
100% paying floating coupon (Libor+spread) which is callable by (B) at 100%
plus accrued interest. The FRN is in fact an Asset Swap composed of the CB and an
IRS (Interest Rate Swap). In the IRS, (C) pays to (B) the fixed coupon equal to the
coupon of the CB and receives the floating coupon (Libor+spread). The “spread”
(0.50% in the example) is agreed at inception which is related to the credit risk of
the CB issuer. The initial NPV (Net Present Value) of (Floating Leg – Fixed Leg) of
the IRS is NPV0.
Hedge fund (A) sells to Dealer (B) the CB at (100% − NPV0). In return, (A)
holds the ASCOT which is an American option giving the right to buy back the CB
at (100% − NPVt) where NPVt is the unwind price of the IRS when the option is
exercised.
## 25.5.4 Gap Note
Gap risk refers to the potential loss due to a sudden large move of the underlying’s
price. In some structures such as CPPI or margin loans, the product issuers
are exposed to gap risks. In the broker market, it is sometimes possible to buy
protections on gap risk of equity indices through the product called Stability Note
or Gap Note. See Table 25.20 for an illustration.338 25 Popular Structured Products
Table 25.20 Illustration example of Gap Note
Issuer XYZ Bank
Tenor 6M
Denomination (N) USD2mio
Issue price 100% × N
Underlying index (I) S&P 500 (Bloomberg Code: SPX Index)
Coupon USD 3M Libor+350bps p.a., quarterly payable until maturity or
Trigger Event
Strike (K) 90%
Final redemption If no Trigger Event has occurred: N × 100%
If Trigger Event has occurred: N × (100% − 10 × PutSpread˜ t)
where
·˜ t: the first date where Trigger Event occurred (˜ t−1 represents the
previous business day)
·PutSpread˜ t = min{10%,max{0,K − I˜ t/I˜ t−1}}, It is the Index
closing price at date t
Trigger event Trigger event is deemed to have occurred if It/It−1 < K
This structure cannot be delta-hedged as a normal option. The investor of the
note takes the Gap risk for income. The pricing is mostly driven by demand/offer.
Jump diffusion models may be used for the consistency of the prices across different
strikes/tenors.
## 25.6 Fund Linked Structured Products
Structured products are mostly linked to mutual funds rather than hedge funds.
Mutual funds provide daily liquidity for subscription and redemption and can
be sold to retail investors. They are highly regulated with transparent investment
objectives and risk management methodologies. For being able to offer fund linked
derivatives, the derivatives issuer needs to have an agreement with the fund manager
for transacting the fund units at NAV without the subscription/redemption fees. It
is customary for the fund manager to rebate part of the management fees on the
transacted fund units for delta hedging to the derivatives issuer as an incentive for
helping to increase the fund AUM (Assets Under Management). The rebate will be
fairly priced in the structured products which helps to improve the features.
Hedge funds usually do not provide daily liquidity, which makes the hedging of
options difficult. It is however possible to hedge the option on a managed account
set-up by the derivatives issuer for replicating the hedge fund. The hedge fund
manager will be the investment advisor so that the managed account will contain
the same assets as the hedge fund itself. As the managed account is transparent for
the invested assets, the derivatives issuer can make delta hedging on daily basis by
adjusting the assets in the managed account.25.6 Fund Linked Structured Products 339
In general, the fund linked structured products favor the ones with smooth
gamma, non-negative delta and no discontinuity. Sometimes, for cheapening the
fund linked derivative, a synthetic dividend1 is introduced to accumulation share
class of the fund. The payoff of the product will be linked to the newly created
fund underlying with synthetic dividend which is cheaper in price due to the lower
forward. The volatility market for funds is limited. Hence, the structured products
often require Volatility Target on the underlying funds (cf. Sect.26.1 on asset
allocation). The derivatives issuers are reluctant to sell structures with volatility
target that may require the issuer to buy volatility (e.g. in a call spread, the short
option at the upper Strike makes the issuer buy volatility for this Strike). CPPI/TIPP
which do not require volatility hedging are often used for funds, especially those
with low volatility.
The maximum issue size for a fund linked structured product is limited to a
certain percentage of the AUM ofthe fund. Ifthe delta becomes important compared
totheAUMofthefund,theproductissuer(thehedgingparty)mayhavethemajority
control of the fund and may need to consolidate the fund investment into its balance
sheet. In such case, the issuer may choose to give up the majority control by an
official notice/request.
In the following, we will present a few popular structured products linked to
funds through fictive examples. The most common purpose includes the principal
protection, leveraged return and financing. Total Return Swap is an efficient
derivative for having the exposure to funds’ performance with financing.
## 25.6.1 Bullish Note
This structure offers a geared upside at maturity with a participation rate (PR) which
can be lower or higher than 100%. The underlying can be a single fund or a basket
of funds. The volatility target may be applied in general. The product example in
Table 25.21 can offer leveraged upside due to its very low volatility. The volatility
target is not applied because of the availability for volatility hedging in the market
for this particular fund. The embedded payoff of the structure is a leveraged call
option.
For principal non protected products, the below alternative payoff may be con-
sidered. It provides a geared upside. The downside exposure is not geared, making
it comparable to the direct fund exposure. A floor, represented by “maximum loss”
in the below formula, is often introduced in such type of structures:
PR × max

0,
ST
S0
− 1

− max

0,min

maximum loss,1 −
ST
S0

.
1The concept of synthetic dividend is also applied to total return indices or systematic strategies.340 25 Popular Structured Products
Table 25.21 Illustration
example of Bullish Note
Structure Note
Denomination (N) USD100,000
Currency USD
Tenor 3 Years
Issue price 100%
Underlying (S) A fixed-income fund with low volatility
PR 150%
Redemption
N ×

1 + PR × max

0,
ST
S0
− 1

## 25.6.2 Bullish Coupon Note
For the investors requiring periodic payoffs, we show an example of bullish coupon
notelinkedtotheperformanceofafund;seeTable25.22.Inthisstructure,theyearly
payoff is the performance of the fund, measured from the beginning and divided by
the number of years.
Table 25.22 Illustration
example of Bullish Coupon
Note
Structure Note
Denomination (N) USD100,000
Currency USD
Tenor 3 Years
Issue price 100%
Underlying (S) A fund with volatility target
Coupon for year i
PR × max

0,
Sti
S0
− 1
1
i
PR 100%
Redemption At par
A popular variation to this structure consists of offering the yearly coupon which
is the fund’s performance at the year end reduced by the coupons received previ-
ously: Coupon(i) = max

0,
Sti
S0
− 1 −
i−1 
k=1
Coupon(k)

for i ≥ 2. Actually, this
payoff is equivalent to paying the highest yearly performance to the investor.
## 25.7 Credit Linked Structured Products
## 25.7.1 Credit Linked Note (CLN)
CLN linked to a single reference entity is the most popular credit structured product
sold to investors. Readers can refer to Part I, Chap.6 for the product structuring.
The CLN issuers often offer structures that are tailor made to satisfy the client’s25.8 Equity Derivatives for Corporates 341
need. It is common to see zero recovery in the credit linked notes sold to individual
investors where the implied recovery rate is priced in the structure for yield
enhancement.
In the years shortly before the financial crisis of 2008, CLNs linked to FTD
(first-to-default) basket of reference entities were actively traded. The default event
for FTD basket is the first credit event among all the reference entities in the basket.
Hence,thedefaultcorrelationisanimportantfactorforpricingsuchCLNs.Afterthe
financial crisis of 2008, the implied default correlations have heightened so much
that the product features with first-to-default basket often fail to be attractive enough
for investors.
25.7.2 CLN on Credit Index
The CLN linked to a Credit Index is less risky compared to a single name CLN.
The credit index helps to diversify the risk across the constituent reference entities.
The liquidity on credit index is in general better than the liquidity for a single
reference entity. We give one simple credit index linked note as illustration example;
see Table 25.23. For sophisticated investors, index single tranche linked products
(similar to CDO) can be structured.
Table 25.23 Illustration example of Credit Index Linked Note
Structure Note
Tenor 5 Years
Outstanding princi-
pal amount
Initial value is USD10,000,000
Underlying iTraxx Asia ex Japan IG Index: 40 constituents, each with 2.5%
weighting
Coupon rate USD Libor 3M + 1.5%
Quarterly coupon Outstanding Principal Amount × Coupon Rate × Year Fraction
Credit event Outstanding Principal Amount will be written off by 2.5% for each
credit event (i.e. zero recovery). The Coupon will continue to accrue
based on the reduced Outstanding Principal Amount
Redemption Outstanding principal amount
## 25.8 Equity Derivatives for Corporates
There are several popular strategic solutions using equity derivatives for the
purpose of
Financing equity linked financing structures can be used by corporates or their
major shareholders. The margin loan and collar financing to be presented later
belong to the type of financing known as non-recourse loan, meaning that the342 25 Popular Structured Products
lender can not go after borrower’s other assets except those posted as collateral
for the loan transaction.
Share Buy-Back there are different reasons for a corporate to buy back its own
shares from the market. For example, corporates may need shares to pay the
executive employees as part of their incentive compensation. New issuance of
shares will dilute the value of existing shares. The corporates often choose to
buy back shares from the market.
Share Disposal Corporates may need to sell large quantity of shares that they hold
for strategic reasons.
## 25.8.1 Financing
Convertible Bonds (CB)
A company may raise financing through different channels: direct capital increase,
right issues, preferred shares, bonds, and etc. Convertible Bond is an alternative
to bond. It gives bondholders the right to convert the CB into a fixed number of
common shares of a certain stock. It is a hybrid structure of (Bond+Call) with
early termination feature triggerable by either a Put or a (Soft) Call event.
For investors of convertible bonds, there are the below attractive features
– upside potential of the underlying stock
– downside protection when the underlying stock is performing poorly
– investment or arbitrage opportunity for equity option investors or credit investors
Hedge funds hold an important part of issued convertible bonds because this
hybrid credit/equity instrument allows them to implement various trading strategies.
For derivatives professionals, convertible bonds offer the exposure to the implied
volatility of the underlying stocks (which are often under priced in the CBs) that are
not blue-chips in general.
For fast-growing companies, convertible bond is a preferred instrument for
financing. The advantages for the issuer of the convertible bond include
– lower financing cost because the coupon offered by a convertible bond is lower
compared to a normal bond
– delayed dilution for common stock and the earnings-per-share (EPS)
– issuer is selling at premium to the prevailing stock price
Convertible bond is a hybrid structure involving equity and credit modelling. The
local volatility model for equity part combined with a jump component for credit
modelling is a natural approach. For interested readers, we refer to [1, 14].
InTable25.24,wesummarizethecommonfeaturesofconvertible bondstogether
with an example. The graphics give further illustration for the schedule and the
valuation of the convertible bonds.Issue Date Put Date Maturity Date Soft Call Period
Conversion Period
Typical Schedule for a Convertible Bond
Valuation of a Convertible Bond
100% Share Price
CB Price
Conversion Price
Parity
Credit Equity Call Option
Table 25.24 Main features of a Convertible Bond
Typical features Explanation Example
Issuer XYZ company
Underlying share XYZ common share
Maturity The tenor of the CB 5Y
Denomination Face value of the CB USD10,000
Coupon rate Interest rate offered by the CB 2.75% p.a.
Conversion price Price at which the convertible
bond is converted into common
stocks
10.76
Conversion ratio Number of shares of a com-
mon stock received by the CB
holder when the bond is con-
verted; It is equal to Denomina-
tion/Conversion Price
929.368
Put Investor’s right to redeem the
bond at a pre-determined price
on a pre-determined date prior to
maturity
On April 24, 2011, the bond-
holder will have the right to
redeem the bond at 111.54% of
the principal amount
Soft call The convertible bond may be
called if the underlying share
price breaches a pre-specified
upper limit for at least a pre-
defined number of days during
the soft call period
After April 24, 2011, the Issuer
has the right to early redeem the
bond at 130% of Denomination,
if the share has been traded above
130% of Conversion Price for at
least 20 during 30 consecutive
trading days
Early redemption 100% of denomination
Final redemption 100% of denomination if no early
redemption occurred344 25 Popular Structured Products
Margin Loan
Stock Margin Loan is a simple solution for obtaining financing with the shares of
the corporate or any other tradable shares as collateral. The ratio of the borrowed
amount to the collateral value is called Loan-To-Value (LTV). The LTV is higher
when the collateral has low volatility and high liquidity. For stocks, the LTV often
ranges from 30% to 60%. The size of the loan is conditioned by both the averaged
daily trading turn-over volume (ADTV) and the free-float of the stock.
In a stock margin loan transaction, the margin call mechanism is defined in the
contract. As soon as the collateral value drops by a certain threshold (e.g. 15%), the
margin call (mostly in cash) will be triggered. In case of non payment for margin
call, forced termination is applicable.
The shares used as collateral are kept in a special account (e.g. escrow account).
Hence, the legal ownership of the shares still belongs to the borrower. This leads to
the following advantages of Stock Margin Loan to the borrowers:
– the voting right is retained for the borrower for the shares used as collateral
– there is no regulatory disclosure requirement for the substantial share holders.
The drawbacks of stock margin loan include:
– LTV is often quite low (e.g. below 50%).
– Margin Call which needs to be handled over the whole tenor for the loan.
Collar Financing
Collar Financing is an attractive trade which is applicable if the underlying share
has sufficient liquidity for allowing the hedging of the embedded derivatives. The
word Collar is used due to the long Put and short Call options employed in the
typical structure as explained in the below. Actually, the Call option is introduced
for reducing the financing cost and it is not mandatory. However, the Put option is
mandatory as it “transforms” the Credit Risk into Market Risk for the lender. In a
typical Collar financing trade, the borrower
– purchases a Put Option with Lower Strike (e.g. 80%) from the lender
– optionally, sells a Call Option with Higher Strike (e.g. 115%) to the lender for
lowering the total cost
– delivers shares to the lender as collateral
– obtains a loan (e.g. at a rate of Libor+3.5%).
The lender can lend an amount up to the PV of the Put Strike. At maturity, the
borrowerpaysbacktheloan.Thelenderreturnsthecollateralwhichmaybeadjusted
by the difference between the strike price and the prevailing share price (Collar
payoff).25.8 Equity Derivatives for Corporates 345
For the borrower, the advantages of Collar financing include
– No Margin Call: this is because the value decrease of the shares in collateral is
compensated by the valuation increase of the Put option.
– High LTV (Loan-To-Value): close to the Put Strike
– Low Financing Cost: the Call Option lowers the financing cost and enables
financing at a reasonable interest rate level;
– Downside Protection: the Put Option hedges the downside risk of the shares for
the borrower.
Compared to the stock margin loan structure, the drawbacks of Collar financing
are as follows:
– Upside share performance is capped at the Call Strike
– Voting right is lost during the tenor of the trade
– Potential disclosure requirement for substantial shareholders (according to the
applicable regulation).
Actually, Collar financing may be structured and transacted as an in-the-money
Call Spread (e.g. 80–115%). In this case, the “borrower” needs to sell the stocks and
buy the in-the-money call spread with a fraction of the selling proceeds. The choice
of the structure will depend on the context of the borrower and the lender.
## 25.8.2 Shares Buy-Back
Structures for Fixed Price but Uncertain Quantity
The corporate may use derivatives for buying back shares at discount to initial price.
In the below structures, the price is fixed at discount to the initial price at inception
of the trade. However, the quantity that the corporate will purchase depends on the
future market price of the underlying stock.
– Put Writing: the corporate sells an OTM Put Option, i.e. the obligation to buy
shares at strike price, set at discount to the initial price, if the share price drops
below the strike. The corporate gains the option premium. If the stock price
has not increased more than the option premium in percentage, the corporate
effectively lowered the buy-back cost compared to the straight purchase at initial
price.
– Accumulator: the corporate buys a number of shares at a fixed price at discount
to the initial stock price every day. The trade will be early terminated if share
price trades above a pre-defined Knock-Out barrier on the upside.346 25 Popular Structured Products
Structures for Fixed Quantity but Uncertain Price
Accelerated Share Buy-Back (ASB) is a popular trade used by corporates, especially
in North America, for the buy-back of a fixed quantity of shares within a time
window. The purchase price is uncertain but at a discount to the averaged value
of the share for the purchase period. The trade can be described as follows:
– The corporate enters into a contract, at zero cost, with an investment bank to buy
a fixed number of shares based on the average price over the accumulation period
(equally weighted) with a discount (e.g. 1%). The reference price is usually
VWAP (volume weighted average price).
– The investment bank buys shares gradually from the market but has the discretion
for the effective daily quantities and termination date. Actually, the investment
bank tends to buy more when the price is low, and buy less (or even sell shares)
when the share price is high. As a result, the investment bank guarantees a
final purchase price at a discount to the average price over the accumulation
period.
This structure is a kind of American option. The quantities that the bank buys
over the period are determined by the delta of the option. The vega hedging will
also be necessary because otherwise, the bank would not be able to hedge the trade
should the shareprice keep rising(implyingvery low realized volatility).PDE pricer
under the local volatility model may be used in practice.
Apart from the ASB trade, there is a systematic execution strategy which tends
to outperform the averaged price during the buy-back period with equal weight. It
consists of buying back the quantity that is determined by the running average of
the share price:
– if the current price is higher than the running average, a smaller quantity will be
bought;
– if the current price is lower than the running average, a greater quantity will be
bought.
## 25.8.3 Shares Disposal
The solutions for Shares Disposal are the opposite ones compared to Share Buy-
Back, i.e.
– Writing Call instead of writing Put
– Decumulator instead of Accumulator
– Accelerated Share Disposal which allows to sell a fixed number of shares at
premium of the average price over the disposal period (equally weighted).25.8 Equity Derivatives for Corporates 347
Exercises
1. Implement a Monte Carlo pricer for a standard domestic ELN with an Up-and-
Out barrier and tweak the underlying volatility parameter to study the short
volatility effect. Assume the underlying follows the BSM with no dividend.
2. Consider an accumulator with the following modified structure. Every month,
the client can buy from IB 1/12-th of the total number of shares at a discounted
price of the initial spot price of the share. But if the KO level is achieved at the
settlement day, the structure will be terminated (the client will stop buying share
going forward).
Total number of shares 1 million
Tenor 12 Months
Settlement frequency Monthly
Strike ?% of Initial Spot
Knock out level 105% of Initial Spot
Initial spot HKD 8.8
Interest rate 0.35% per annum
Volatility 27.5%
Solve the Strike (in %, accurate to 2 decimal places) for 0 premium assuming
the Black–Scholes model and continuous compounding.
3. A Chinese bank offers a 2 year, 100% principal protected note to their clients.
The product is described in the below:
– at the inception, the client purchases the note at par (100% notional);
– at the end of i-th quarter,
• if both underlying stocks trade at or above their initial spot levels, the client
will receive a coupon of notional×(100%+i ×Snowball Coupon Rate/4)
and the product is early terminated;
• otherwise, the client receives nothing and the product continues;
– at maturity date, if no early termination happened, the client willreceive 100%
notional.
On the bank side,
– the bank receives the proceeds of 100% notional from the client;
– Treasuries division of the bank pays a funding of 3.5% per annum (quarterly
payable) until the product’s termination date;
– Treasuries division pays back 100% notional to the client at the termination
date;
– The bank makes a back-to-back swap hedge with an IB.348 25 Popular Structured Products
The terms of the swap are as follows: Bank pays funding to IB which is 3.5%
p.a. every quarter.
IB pays the return of the below to the Bank:
Notional xxx
Tenor 2 years
Denomination CNY
Underlying stocks 1 Japanese stock/1 US stock
Initial spot 8975/443
Observation Quarterly, on the worst performance
Knock out level 100% of initial spot levels
Snowball coupon rate ?% per annum
KO coupon if KO at i-th quarter (Snowball coupon rate/4) × i
Market data – US stock Market data – US stock
Volatility of the stock 30% Volatility of the stock 28%
Correlation stock – USD/CNY 10% Correlation stock – JPY/CNY −40%
Volatility of USD/CNY 2% Volatility of JPY/CNY 11%
USD rate 0.38% JPY rate 0.13%
Correlation stock US – stock JP 60%
(i) Implement a Monte Carlo pricer with the above market data;
(ii) Solve for the “Snowball Coupon Rate”.
4.
(i) What is a correlation skew?
(ii) What is the difference between “Issuer Callable” and “Autocallable” struc-
ture?
(iii) Is the local volatility model suitable for pricing a Forward Starting Call
Spread? Why?
(iv) What type of American option that Longstaff–Schwartz (Least-Square)
method is less suitable to apply? Why?
(v) An investment bank (IB) wants to apply Black–Scholes–Merton model to
price a Call option on the excess return of a mutual fund. The IB will receive
a rebate (retrocession) of 0.30% from the management fees charged by fund
manager. Please write down the SDE (Stochastic Differential Equation) to
be used for the pricing.
(vi) What is the risk for the investor in a tri-party repo based product?25.8 Equity Derivatives for Corporates 349
5. For a structured Note, there are time lags between the trade and issue date, final
valuation date and maturity date. In pricing, the actual dates used for the final
valuation and the dates used for discounting are different. In this exercise, the
description as well as the parameters are close to a real FCN product.
Tenor 6 Months+2 Weeks
Trade date 03 Oct 2017 (Tue)
Issue date 17 Oct 2017 (Tue)
Final valuation date (T) 17 Apr 2018 (Tue)
Maturity date 24 Apr 2018 (Tue)
Denomination (N) USD 100k
Currency USD
Issue price 100% of N
Coupon 1% flat paid at each monthly observation (i.e. ∼12% p.a.)
Put Strike (K) To be calculated
Underlying basket Stock A (US stock) and Stock B (Japanese stock)
Performance (P) Worst-of underlying basket
Observation 17 Nov 2017, 19 Dec 2017, 17 Jan 2018, 17 Feb 2018, 17 Mar
2018, 17 Apr 2018
Knock-Out barrier 100% at each monthly observation date
Spot reference – S0 USD 50.00 for Stock A, JPY 20000.00 for stock B
Final redemption at maturity If PT ≥ K then 100% of N
Otherwise, XT × N/(K × S∗
0) shares of S∗, where S∗
0 is the
initial price of the worst performing stock at maturity;
XT = 1 if S∗ is US stock, otherwise, XT is the prevailing
USD/JPY exchange rate at Final Valuation Date
Issuer/Distributor margin 0.60%
Assume BSM model for pricing with the market parameters as follows:
USD interest rate is 1.6% p.a. flat (30/360). JPY interest rate is 0%.
Stock A Stock B
Volatility 38% 40%
Dividend rate 0% 0%
Repo rate (continuous, ACT/365) 2% 4%
The volatility USD/JPY is 9.50%.
Use Excel-VBA coding to do the below:
(i) Estimate Strike K with Monte Carlo Simulation (at least 10,000 paths)
(ii) Calculate the 95% confidence Interval for the issue price with the Strike
fixed at 90%.350 25 Popular Structured Products
Correlation Stock A Stock B USD/JPY
Stock A 1
Stock B 0.50 1
USD/JPY 0.25 0.20 1
Note: It is often useful to use the same seed for the random number generation
in VBA so that the simulation result can be reproduced. In Excel-VBA it can be
done by generating the first random number with Rnd(-2) and the following ones
with Rnd().Chapter 26
Dynamic Asset Allocation
Dynamic asset allocation is the mechanism for controlling the timing and quantity
of tradable assets such as equities, bonds, currencies and commodities. It can be
used to achieve one or more of the following targets:
– reducing the risk
– providing protection
– creating relatively stable returns
– dynamically changing the beta (market) exposure across different assets accord-
ing to the growth/performance cycles.
In this chapter, we will introduce a few popular dynamic asset allocation strate-
gies. Firstly there are methods that mainly involve allocation between risky assets
and nearly risk-free ones, including the volatility target strategy for controlling risk,
and the two important gap risk-based approaches known as CPPI and TIPP. Then,
we will present the allocation methods on a basket of risky assets, such as the classic
mean-variance framework and its extension, the Black–Litterman model. In the
following, the concept of exposure or weight is represented by the percentage of
the total capital invested in a certain asset.
Assume we have n assets, risky or not. Let Pi,t be the price of the i-th asset at
time t, and NAVt be the total net asset value at the same time. If the exposure at
time t − 1 for the i-th asset is wi,t−1 and all exposures add up to 1, then
NAVt
NAVt−1
=
n
i=1
wi,t−1
Pi,t
Pi,t−1
, or
NAVt − NAVt−1
NAVt−1
=
n
i=1
wi,t−1
Pi,t − Pi,t−1
Pi,t−1
,
where the latter format puts emphasis on the return rate.
Consider n = 2 and the second asset Mt is an investment in money market. Then
we have the following relation which is used in the subsequent sections
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_26
351352 26 Dynamic Asset Allocation
NAVt
NAVt−1
= wt−1
Pt
Pt−1
+ (1 − wt−1)
Mt
Mt−1
. (26.1)
Example 26.1 (constant mix strategy) If the exposure is a time-invariant constant
wt = w,thentherebalancingstrategyiscalledconstantmix.Forinstance,w = 80%
implies 80% of capital invested into risky assets and 20% in money market. Note
that it is the exposure that stays constant. Keeping risky assets exposed at 80% level
may require frequent rebalancing. When w = 100%, it is also called the buy-and-
hold strategy.
## 26.1 Volatility Target for Risk Control
Volatility target mechanism aims at controlling the volatility of the exposure to the
underlying asset (or portfolio). It is realized through dynamic adjustment of the
exposure wt according to the following rule:
wt = min

Cap,
σtarget
σrealized

,
where
σtarget: required target level for the volatility of the strategy (e.g. 5%);
σrealized: realized volatility of the asset at time t over an observation window (e.g.
calculated from the daily returns in the past 6 months);
Cap: maximum exposure (e.g. 150%) for limiting the leverage, hence the leveraging
cost.
The global NAVt of the volatility target strategy at time t is based on the asset
portfolioreturnandthereturnontheinvestmentinmoneymarketasshownin(26.1).
A threshold for rebalancing can be introduced to avoid frequent transactions of
small amount for the exposure changes, i.e., there is no adjustment if the adjustment
amount is less than the threshold.
Volatility target has several advantages. It is commonly applied to investment
strategies for
1. controlling the risk, as it tends to
• deleverage when the realized volatility of the asset σrealized increases, leading
to decreased exposure to the asset and increased investment in money market.
• leverage when the realized volatility of the asset σrealized decreases, leading to
increased exposure to the asset and decreased investment in money market. If
wt > 100%, funding cost will be charged for the leverage.
2. offering options on the assets on which we cannot normally trade volatilities
in the market (e.g. mutual funds which have no volatility quote in the market).
Pricing and hedging become possible because of volatility target. However, the26.2 Gap Risk Based Asset Allocation 353
option writers are only comfortable to offer the payoffs with positive Vega (i.e.
option writer sells volatility). This is because the risk is limited for the hedging
party to sell the volatility at a level slightly above the volatility target (e.g. 1.5%
above) but it is difficult to determine the volatility level to buy when the realized
volatility of the asset is very low as the cap prevents the leverage from increasing
for achieving the target volatility.
## 26.2 Gap Risk Based Asset Allocation
A gap risk in portfolio management is the risk caused by a significant asset’s price
changefromoneleveltoanotherwithnotradingpossibilityinbetween,forinstance,
the change between closing and open prices or a sudden large market move due to
an unpredictable event/news.
A gap risk-based asset allocation strategy allows an investor to maintain some
exposure to the risky asset while providing protection against gap risk on the
downside. Denote
Floort: guaranteed minimum level
G: estimated gap risk for the underlying in % (e.g. 25% sudden drop for an equity
index)
Multiplier: it is defined as 1/G, e.g. Multiplier = 1
25% = 4
Cushiont: equals to NAVt −Floort −all costs and fees which is the maximum loss
under the constraint of Floor.
Floort is the level that the product issuer (i.e. hedging party) does not want NAVt
to fall below. It can be a zero coupon bond price at t which allows to get the full
principal back at maturity T, or a percentage of NAVt or even constant levels for
any t (e.g. straight line over time). The choice depends on the product offered to
investors (Fig.26.1).
For protecting the investment to Floort against the gap risk G, the absolute
exposure to risky asset at t can be set at
Et = Multiplier × Cushiont
Fig. 26.1 An increasing floor
with time t
0
time
Portfolio NAV
NAV0
Floor0
t
⎫ ⎬
⎭ Cushiont354 26 Dynamic Asset Allocation
and the relative exposure is wt = Et/NAVt. Should the gap risk occur and the asset
price drop exactly by G, the loss for the investor will be just Cushiont (as the loss
is Et ×G = Multiplier ×Cushiont ×G = 1
G ×Cushiont ×G = Cushiont). In
case that the price drop is more than G, the product issuer will take the loss beyond
Cushiont but not the investor. For this reason, people say that the issuer is shorting
a Gap Put option.
. . .
Cushiont
Cushiont
Cushiont
Leveraged Exposure
Et = Multiplier×Cushiont
⎫ ⎬
⎭
The gap risk-based asset allocation strategy consists of dynamically adjusting the
exposure according to the above formula over time. If Et > NAVt at some time t,
the investor needs to borrow for financing the leveraged investment. Otherwise, the
difference is invested in the fixed income market.
NAVt
Et
Borrow
NAVt Et
Investment in Fixed Income
Market
When NAVt drops to Floort, there will be no more investment in the risky asset
until product maturity T. The strategy is then said to be “cash-locked”, and the
investor has to forfeit any further upside in the risky asset. Note that the gap risk-
basedmethodisdifferentfromtheoption-basedprincipal-protectingstructurewhere
the floor is invested in zero coupon bond for getting back 100% principal at maturity
while the remaining money is invested in an option offering the exposure to the asset
which is not impacted by NAVt.
Example 26.2 Consider G = 25% and Multiplier = 1/G = 4, such that the
exposure is Et = 4 ×Cushiont. Assume there is no cost or fee. Under the exposure
Et, the worst loss caused by G ≥ 25% equals to Cushiont for the investor. Suppose
at inception NAV0 = $100 and Floor0 = $85. Then,
E0 = Multiplier × Cushion0 = 4 × ($100 − $85) = $60.26.2 Gap Risk Based Asset Allocation 355
It means w0 = E0/NAV0 = 60% of the portfolio is invested in the risky asset.
Furthermore, the remaining 40% is invested in risk-free fixed-income assets.
There are two popular structures based on gap risk approach in the market:
CPPI and TIPP which will be presented in the following sections. Assets with low
volatility are more suitable for these structures than the assets with high volatility.
CPPI linked to fixed-income mutual funds is a typical example.
The gap risk-based allocation can be used to provide capital protection without
using options. It is particularly useful when the underlying has no volatility market.
The drawback of this allocation mechanism is that, if the underlying is volatile, it
risks to make the investor “buy high/sell low”, similar to a short Gamma position.
Similar to the volatility target strategy, a threshold is often set for the exposure
adjustment in the gap risk-based approach for reducing the number of small
transactions. One must also pay attention to the timing of rebalancing, as the gap
risk might bring the portfolio below the floor level more easily if the rebalancing
dates are not frequent (e.g. weekly).
There are numerous variations including the aforementioned fixed floor level
for avoiding interest rate impact on the cushion and floor, guaranteed minimum
exposure level to the risky asset for avoiding to be cash-locked, time-dependent
multiplier, or even a volatility target for controlling the exposure. The above
variations may be hybrid options with risks linked to interest rate and the risky
asset for the hedging party.
26.2.1 CPPI (Constant Proportion Portfolio Insurance)
In its basic version, CPPI [63] offers 100% principal protection of notional N (=
NAV0) at product maturity T. A zero coupon bond maturing at T with time-t price
Pt(T) is used for the principal guarantee. See Fig.26.2 for reference.
The implementation is described as follows:
1. Investing Et = Multiplier × Cushiont in the risky asset, where Cushiont =
NAVt − N × Pt(T) − cost and fees.
2. Investing the amount NAVt −Et into some “risk-free” fixed-income assets (bills,
bonds, etc.). If NAVt − Et is negative, borrowing will be needed.
Fig. 26.2 An illustration for
CPPI. Note that the bond
floor may fluctuate because of
interest rate
0
time
Portfolio NAV
N
N·P0(T)
t
⎫ ⎬
⎭
Cushiont
T356 26 Dynamic Asset Allocation
3. If NAVt touches N × Pt(T), the investment will be fully in the T-maturity zero
coupon bond, which costs N × Pt(T) for receiving N at maturity. The CPPI is
said to be cash-locked.
For CPPI modelling, readers are referred to [24] which uses a jump-diffusion
model in continuous-time framework.
26.2.2 TIPP (Time Invariant Portfolio Protection)
TIPP [30] is a structure without the need of a fixed maturity. Based on the Gap risk
based leveraging/deleveraging mechanism, it guarantees a floor percentage p (e.g.
80%) to the running highest NAV (denoted as  NAVt), which is the highest net
asset value since inception until t. The floor level is thus
Floort = p ×  NAVt−1 = p × max
0≤s<t−1
NAVs
which is non-decreasing in time. See Fig.26.3 for reference. The idea resembles the
trailing stop method for securing profit in trading strategies. The implementation of
TIPP is described as follows:
1. Investing Et = Multiplier × Cushiont in the risky asset, where Cushiont =
NAVt−1 − p ×  NAVt−1 − running cost and fees
2. Invest NAVt −Et in money market at overnight rate (borrowing is needed if this
amount is negative).
3. Theoretically speaking, if the interest rate is positive, there will never be a “cash-
locked” situation because the investment of the guaranteed amount will accrue
a small cushion every day. But it will take a long time to obtain any meaningful
cushion.
## 26.3 Portfolio Asset Allocation
In the following, we will turn our focus to how to allocate exposure to multiple risky
assets (classes).
Fig. 26.3 An illustration of
TIPP with p = 80%
0
time
Portfolio NAV
NAV0
80% NAVt
NAVt
t
} Cushiont26.3 Portfolio Asset Allocation 357
We first list below the general notations used throughout this section:
n number of assets in the portfolio
wi weighting/exposure of the i-th asset
w = [w1,...,wn] column vector of weights for the asset allocation
μi return of the i-th asset
ri expected return of the i-th asset (ri = E[μi])
σi standard deviation (volatility) of the i-th asset
ρij correlation between the i-th and the j-th assets
Σ = [ρijσiσj]n×n covariance matrix for the asset returns
1 = [1,...,1] n-dimensional column vector of value 1
The returns μi are random variables of the i-th asset. And the quantities ri = E[μi],
σ2
i = Var(μi), and ρijσiσj = Cov(μi,μj) are assumed to be known.1
To quantify a portfolio, we consider the portfolio return μ =
n
i=1 wiμi, a
random variable with weights w as parameters. Let the expected portfolio return
be r̂ = E[μ] =
n
i=1 wiri. Furthermore, for
σ2 portfolio return variance
Cov(μ,μ̂) Covariance of two portfolio returns μ and μ̂ with weights w and ŵ
The two numbers σ2 and Cov(μ,μ̂) can be represented by a real quadratic form.
Proposition 26.1 The portfolio return variance and the covariance of two portfolio
returns can be given in matrix format as
Var(μ) = σ2
=
n
i=1
n
j=1
wiwjρijσiσj = w
Σw,
Cov(μ,μ̂) =
n
i=1
n
j=1
wiŵjρijσiσj = w
Σŵ.
Proof From the definition of covariance, we have
Cov(μ,μ̂) = E
⎡
⎣
) n
i=1
wiμi − E
 n
i=1
wiμi
*⎛
⎝
n
j=1
ŵjμj − E
⎡
⎣
n
j=1
ŵjμj
⎤
⎦
⎞
⎠
⎤
⎦
= E
⎡
⎣
n
i=1
wi(μi − ri)
n
j=1
ŵj(μj − rj)
⎤
⎦ =
n
i=1
n
j=1
wiŵjρijσiσj.
Letting μ̂ = μ gives the result of the portfolio return variance σ2. 
1For instance, historical data from a window are taken to sample μi, and sample statistics can be
used for ri, σi, and ρij.358 26 Dynamic Asset Allocation
In the following sections, we first introduce a class of allocation methods which
only make use of asset volatilities σi’s and correlations ρij’s and do not involve
estimating the asset returns ri’s. Then, we will present the portfolio approaches
aiming to determine the asset weighting vector w = [w1,...,wn] such that the
portfolio expected return r̂ and the portfolio risk σ are optimized.
## 26.3.1 Risk-Based Methods
The risk of an asset is often measured by its volatility, which can be estimated and
used for asset allocation.
Note that the trivial allocation known as equally weighted portfolio with all
weights equal to wi = 1
n is a special case in this class.
1. Risk parity
The risk parity strategy consists of allocating the same risk quantity (i.e.
volatility) across all the component assets of the portfolio. For instance, it can
be achieved by periodically resetting the weights so that
wiσi = wjσj, ∀i,j = 1,2...,n.
To determine the weighting wi of asset i for achieving risk parity given the
volatilities of each asset, we note that
1 =
n
j=1
wj =
n
j=1
wiσi
σj
.
Pulling wi out of the summation gives
wi =
1/σi
n
j=1(1/σj)
.
Risk parity is easy to implement and particularly convenient for long-only
scenario. When assets go bad, they usually are highly volatile, and risk parity
places less weight on such assets.
2. Risk budgeting
Risk budgeting consists of allocating a risk budget for each asset in the portfolio.
We know that σ2 = wT Σw =
n 
i=1
wi(Σw)i, or, equivalently, 1 =
n 
i=1
wi
(Σw)i
σ2 .
It is intuitive to set the risk budgets pi as
pi = wi
(Σw)i
σ2
,26.3 Portfolio Asset Allocation 359
which satisfies

i pi = 1. Then, one can solve wi’s from the above relation with
the weight constraint

i wi = 1.
The risk budgeting method has the advantage of simplicity. The investor may
achieve the desired return profile through his risk appetite/tolerance. For exam-
ple, one may apply
– 30% on equities,
– 20% on emerging market bonds,
– 40% on investment grade bonds,
– 10% on commodities.
Actually, the weights obtained from Risk Budgeting method can be reduced
to the risk parity weights when all asset pairs are correlated with the same
correlation level ρ and the risk budgets are equal [70].
3. Most diversified portfolio
The method is proposed by Choueifaty and Coignard [20]. The idea is to
determine the weights wi by solving the following maximization problem, in
which the target function is known as the diversification ratio
max
w
n
i=1 wiσi
σ
= max
w
n
i=1 wiσi
√
wΣw
.
Once again the expected returns ri’s are not required in the derivation of wi’s,
and the problem can be solved by numerical methods.
## 26.3.2 Modern Portfolio Theory
The risk-based allocation methods only utilize volatility and, sometimes, the
correlation. On the other hand, the portfolio theory pioneered by Nobel laureate
Harry Markowitz [53] makes use of both portfolio return and portfolio variance.
This problem is named as mean-variance optimization (MVO), or the modern
portfolio theory (MPT). It consists of solving the optimal asset allocation w with
either of the following equivalent problems:
– given the portfolio variance, solving for the highest expected return
– given the portfolio expected return, solving for lowest portfolio variance.
For instance, given an expected portfolio return r̂, the optimal asset allocation is the
solution to the following quadratic programming problem:
min
w
1
2
w
Σw,
subject to the constraints360 26 Dynamic Asset Allocation

r
w = r̂,
1
w = 1,
where r = [r1,...,rn] are the expected returns of the assets.
Proposition 26.2 The solution to the MVO problem is w = h + r̂g (assuming Σ
is invertible), where h, g are vectors and are independent of r̂ (i.e. common to all
solution w) given by
h = Σ−1 b1 − ar
bc − a2
and g = Σ−1 cr − a1
bc − a2
,
where a, b, and c are scalars
a = 1
Σ−1
r, b = r
Σ−1
r, and c = 1
Σ−1
1.
Proof The following proof is extracted from [54].
First order condition on the Lagrangian
L(w,λ1,λ2) =
1
2
w
Σw + λ1(r̂ − r
w) + λ2(1 − 1
w)
implies
∂L
∂w
= Σw − λ1r − λ21 = 0,
∂L
∂λ1
= r̂ − r
w = 0 and
∂L
∂λ2
= 1 − 1
w = 0.
From the first equation, we obtain w = Σ−1(λ1r + λ21). Replacing w in the two
constraint equations, we have
r
w = r
Σ−1
(λ1r + λ21) = r̂,
1
w = 1
Σ−1
(λ1r + λ21) = 1.
Using the notations of a, b, and c, we get
b a
a c
!
λ1
λ2
!
=
r̂
1
!
. Hence,
λ1 =
cr̂ − a
bc − a2
, λ2 =
b − ar̂
bc − a2
,
and
w = Σ−1 r(cr̂ − a) + 1(b − ar̂)
bc − a2
= h+r̂g. 26.3 Portfolio Asset Allocation 361
Fig. 26.4 Illustration of
efficient frontier on the
risk-return plane
The proposition implies that, once Σ and r are estimated and r̂ is specified, the
scalars a, b, and c can be calculated accordingly and used to determine w.
Note that any portfolio can be simply characterized by a pair of numbers (r̂,σ)
and therefore it is convenient to visualize portfolios as a point on the r̂-σ plane. See
Fig.26.4 for reference. In the MVO framework, for each given r̂, the solution h+r̂g
is the set of weights that makes the resulting portfolio have minimum risk σ and
σ2
= w
Σw = (h + r̂g)
Σ(h + r̂g) =
b − 2ar̂ + cr̂2
bc − a2
.
Therefore, the set of MVO solutions for different r̂ constitutes a hyperbola on the
r̂-σ plane, and the upward sloping part is called the efficient frontier. To gain higher
return, risk-averse investors have to move up the efficient frontier and endure more
risk.
If a risk-free asset (with “risk-free” rate rf ) is part of the portfolio [80], the
mean-variance minimization problem becomes
min
w
1
2
w
Σw,
subject to a new target return constraint
r
w + (1 − w
1)rf = r̂.
The weights for risky assets together with the risk-free asset sum up to 1 and this
condition is naturally embedded in the above constraint. Note that w1 > 1 means
borrowing from the money market. The method of Lagrange multiplier gives
w = (r̂ − rf )Σ−1
(r − rf 1)/K,
where K = (r − rf 1)Σ−1(r − rf 1) = b − 2arf + cr2
f is positive because Σ is
positive definite. Using σ2 = wΣw, we obtain362 26 Dynamic Asset Allocation
Fig. 26.5 Illustration of efficient frontier. The terms rm and σm represent respectively the expected
return and volatility of the market portfolio. Sharpe ratio of market portfolio is then
rm−rf
σm
r̂ = rf +
√
Kσ.
Hence, the efficient frontier of the portfolio forms a straight line on the risk-return
plane which is known as the Capital Allocation Line (CAL). The CAL has an
intercept at rf and the slope of the CAL is the Sharpe ratio, i.e., excess return over
volatility
r̂ − rf
σ
.
The CAL happens to be tangential to the efficient frontier of the portfolio without
the risk-free asset (i.e. 1w = 1). In a perfect universe, all investors will like to
hold the tangency portfolio (hence the name Market Portfolio). The part of the line
above Market Portfolio involves borrowing at rf and leveraging the investment in
the Market Portfolio, while the segment of CAL below Market Portfolio implies
investment in both Market Portfolio and the risk-free asset. See Fig.26.5.
In general, an MVO-based strategy is to minimize the portfolio risk
min
w
1
2
w
Σw, subject to w ∈ Ω,
where Ω gives the constraints of the weight w, such as the previously used target
portfolio return rw = r̂ and total weight sum 1w = 1. It is often necessary to set
other (linear) constraints on w, such as a long only scenario (i.e. wi ≥ 0), or certain
weight limits on some of the assets (e.g. w2 + w3 ≤ 30%,0 ≤ w1 + w4 + w5 ≤
100%, etc). The constrained optimization problem can be resolved with numerical
methods.
MVO is an important tool for asset managers who are mandated to make discre-
tionary investment decisions. The business model of investment banks consists of
offering financial services but not discretionary investment management. With the26.3 Portfolio Asset Allocation 363
development of structured business, banks also started to employ MVO approach
to offer products with rule-based strategy investing in the portfolios on the efficient
frontier. The implementation is described as follows:
– The strategy typically invests into an asset universe across different asset classes
(through indices, ETFs or large mutual funds).
– It often applies a fixed target portfolio volatility.
– The portfolio is rebalanced periodically, e.g., every month, quarter or semester.
– Between the rebalancing dates, the volatility target mechanism may be applied
for controlling the portfolio volatility.
– It is possible to write options on the strategy if the volatility target is applied.
## 26.3.3 Black–Litterman Model
The application of modern portfolio theory faces a well-known problem: although
the covariances of the assets can be approximately estimated, it is difficult to come
up with reasonable estimates of the returns. Moreover, it is known that the MVO
weights are very sensitive to the expected returns, and assets with higher return will
be awarded with extremely larger weights.
Black–Litterman (BL) model, which was first proposed by Fischer Black and
Robert Litterman at Goldman Sachs [11], extends the mean-variance analysis
by combining the estimated market returns with user’s view on the estimation
uncertainty as well as the relationships between the returns of the assets. The model
is described as follows. From
– the estimated returns and covariances (“market prior”), and
– the user’s views expressed as linear combinations of the estimated returns,
the BL model determines the input parameters for the MVO problem (“posterior”),
i.e.,
• the expected returns conditioned by user’s views;
• the covariance conditioned by user’s view.
Estimated
- Return
- Covariance
Expected Return
Conditioned by User’s views
Covariance
Conditioned by User’s views
Mean-variance Optimization
User’s View
Asset
Allocation
*
·
6%
Constraints364 26 Dynamic Asset Allocation
The user of BL model can express
• their view on the uncertainty of the estimated returns r by applying a distribution
instead of fixed values: r ∼ N (π,τΣ), where τ is a scalar
• their market view by means of a linear combination of the estimated returns Pr
where P is the pick matrix. For example, with P =
1 0 −1
0 1 0
!
and Pr =
5%
10%
!
,
the user gives the following relative view:
1. Asset 1 outperforms Asset 3 by 5%
2. return of Asset 2 is 10%.
• his uncertainty about the market view, denoted by Ω. The matrix Ω is often
assumed to be diagonal so as to avoid covariance between views. If Ω is the zero
matrix, all the views have 100% certainty.
The expected return and its covariance conditional on user’s views are given
below using a Bayesian approach.
Proposition 26.3 (Black–Litterman) Denote
“market prior” expected return r follows a normal distribution r ∼ N (π,τΣ), in
which τ allows the user to express the estimation uncertainty;
“market views” of the user q|r ∼ N (Pr,Ω).
Then, r|q (“posterior”) follows a multivariate normal distribution with
E[r|q] = π − τΣP
(Ω + τPΣP
)−1
(Pπ − q),
Cov(r,r|q) = τΣ − τ2
ΣP
(Ω + τPΣP
)−1
PΣ.
Proof The proof follows the approach in [46]. Firstly the unbiased estimator gives
E[q] = E[E[q|r]] = E[Pr] = Pπ.
Applying the law of total covariance (see Proposition A.1 in Appendix A), we have
Cov(r,q) = E[Cov(r,q|r)] + Cov(E[r|r],E[q|r])
= E[Cov(r,q|r)] + Cov(r,E[q|r]).
From the definition of conditional covariance (in the multivariate sense), we have
Cov(r,q|r) = E[(r − E[r|r])(q − E[q|r])
|r] = E[(r − r)(q − E[q|r])
|r] = 0.
Hence, we obtain
Cov(r,q) = Cov(r,E[q|r]) = Cov(r,Pr) = Var(r)P
= τΣP
,26.3 Portfolio Asset Allocation 365
where P is taken out of the covariance operator by Proposition A.2 in Appendix A.
And similarly
Cov(q,q) = E[Cov(q,q|r)] + Cov(E[q|r],E[q|r])
= Var(q|r) + Cov(Pr,Pr) = Ω + τPΣP
.
Therefore q ∼ N (Pπ,Ω + τPΣP). Coupling the normally distributed r
and q, and applying the conditional normal distribution (see Proposition A.4 in
Appendix A) with
r
q
!
∼ N

μ1
μ2
!
,
Σ11 Σ12
Σ21 Σ22
!
,
where
⎧
⎪ ⎪ ⎪ ⎪ ⎪ ⎨
⎪ ⎪ ⎪ ⎪ ⎪ ⎩
μ1 = π, μ2 = Pπ,
Σ11 = Var(r) = τΣ,
Σ22 = Cov(q,q) = Ω + τPΣP
,
Σ12 = Cov(r,q) = τΣP
,
we obtain that the posterior r|q follows the multivariate normal distribution with
E[r|q] = π − τΣP
(Ω + τPΣP
)−1
(Pπ − q),
Cov(r,r|q) = τΣ − τ2
ΣP
(Ω + τPΣP
)−1
PΣ. 
Remark 26.1 TheposteriorestimatedreturnE[r|q]alsoadmitsanotherformknown
as the “master formula” given by [38]
E[r|q] = [(τΣ)−1
+ P
Ω−1
P]−1
[(τΣ)−1
π + P
Ω−1
q].
It can also be checked that
Cov(r,r|q) = ((τΣ)−1
+ P
Ω−1
P)−1
.
See Proposition A.5 in Appendix A.
Exercises
1. Show that the equal weighting asset allocation scheme is essentially a “buy
low/sell high” strategy.366 26 Dynamic Asset Allocation
2. Consider a CPPI strategy with a risky asset dSt = μStdt + σStdWt and a risk-
free asset dMt = rMtdt as floor. Let Ct = NAVt − Mt denote the cushion
process and m is the multiplier. Hence, the total return of the portfolio consisting
St and Mt is
dNAVt
NAVt
=
mCt
NAVt
dSt
St
+

1 −
mCt
NAVt

dMt
Mt
.
(i) Show that
dCt
Ct
= [mμ + (1 − m)r]dt + mσdWt.
(ii) Show that for t > 0,
Ct = C0e(1−m)(r+m
2 σ2)t

St
S0
m
.
3. (Global Minimum Variance) When solving the MVO problem, one can remove
theconstraintrw = r̂ andobtaintheGlobalMinimumVarianceportfolio.Using
the method of Lagrange multiplier, prove that the weights take the form of
w =
Σ−11
1Σ−11
.
4. Assume two risky assets with estimated annualized volatility 30% and 10%
respectively. They have a correlation factor of 0.7.
(i) Calculate the weights for a risk parity portfolio
(ii) Calculate the annualized volatility of an equally weighted portfolio
(iii) Calculate the weights for a global minimum variance portfolio.Chapter 27
Systematic Strategy
## 27.1 Introduction
Structured business has experienced a fantastic development since the late 1990s.
At the early stage, much of the effort has been spent on the payoff engineering. In
a few years, the payoff engineering has achieved its maturity stage: some “exotic”
structures are now considered as flow products and the pricing is more and more
efficient.
Guided by the research works in finance and the experience of asset managers,
financial engineers in investment banks start to focus on rule-based investment
strategies known as systematic strategies. The investment allocation in such strate-
gies is rebalanced periodically, e.g. monthly, with an algorithm following a set of
rules. The input data for the algorithm should be publicly available. Also the rules
are disclosed to investors in general. Systematic strategies can be categorized as
follows
Beta strategy: a strategy with its returns correlated to the performance of market
traded assets (e.g., bonds, stocks) or benchmark (indices);
Smart beta strategy: a strategy aiming to provide higher Sharpe ratio than the
market traded assets; Its return is related to the performance of “factors” such as
value or momentum other than just the market traded assets through, typically,
long-only exposure.
Alternative beta strategy: a strategy designed to achieve uncorrelated returns to
the market traded assets with full exposure to “factors”; The strategy is generally
implemented with diversified and/or long-short positions.
The advantage of a systematic strategy includes
– low cost: the management cost is low compared to an actively managed fund;
– transparency: the strategy rules are made transparent to investors;
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6_27
367368 27 Systematic Strategy
– consistency: the investment decisions are algorithm-driven, which avoids the
impact of human behaviours; hence in general they can be backtested and
automated;
– protection: with the techniques of volatility target or CPPI, principal protected
products may be offered with systematic strategies. The traditional actively
managed funds do not offer principal protection.
On the other hand, there are several well-known drawbacks for systematic
strategies:
• non-flexibility: The rulesare never perfect.Amending the rulesisdifficult ifthere
are existing products linked to the strategy. For changing the rules, a new strategy
needs to be set up and the investor should unwind the existing trade for investing
into the new index. In comparison, the fund managers have the flexibility for
making the investment decisions.
• time lag: Most of the strategies use historical data for obtaining signals. The
regime change may be detectable only after a time lag.
• backtesting optimization: If the rebalancing is not on daily basis but on fixed
schedules (e.g. every month end), the strategy parameters are sometimes opti-
mized to these schedules for achieving a nice backtesting result. Using the same
parameters, the results might be quite different if the rebalancing schedules
are shifted to other days. Actually, a systematic strategy may show excellent
backtested performance but deliver poor real performance after its launch.
• pricingrisk:Anyimplementedstrategyisproprietarytoaninvestmentbank.Very
often, only that bank can offer products linked to the strategy. Investors may not
be able to use competition to achieve pricing efficiency.
## 27.2 Asset Pricing Models
Asset pricing models relate asset returns to their driving factors and are useful in
building systematic strategies. Factors may be identified with the techniques of
econometrics. The factor models normally take a linear form.
## 27.2.1 Capital Asset Pricing Model (CAPM)
CAPM, which is proposed by Treynor [81], Sharpe [78], Lintner [49], and Mossin
[59] independently, is based on the modern portfolio theory with the presence of a
risk-free asset and assumes that the market factor is the only source of price risk. In
practice, it is described by a simple linear regression model:
μi − rf = βi(μm − rf ) + i,27.2 Asset Pricing Models 369
where
μi: return of asset i
μm: return of the market factor common to all assets
rf : “risk-free” rate in fixed-income market
βi: represents the correlation of asset i to the market factor, i.e.,
βi =
Cov(μi,μm)
Var(μm)
i: idiosyncratic component which has zero expected value (white noise).
The regression is carried out between the excess returns μi − rf and μm − rf . The
correlation to the market factor βi is also the slope of the regression line. The market
factor brings about the unavoidable systematic risk and i carries the asset-specific
idiosyncratic risk which can be diversified away.
Index Model
It is an extension of CAPM by introducing a non systematic return called Alpha, or
Jensen’s Alpha. Consider a fund manager and their return variable Rfund. Regression
against the market factor gives
Rfund − rf = αfund + βfund(μm − rf ) + fund,
where αfund is the unexplained return which is uncorrelated to μm. The index
model incorporates the impact of the investment skills of a fund manager, which
is quantified by the value αfund.
ThetheoreticalframeworkofCAPMisbasedonmarketequilibriumandassumes
market conditions such as zero transaction cost, arbitrary divisibility of underlying
asset, and etc. It states that the expected return of the non-systematic component is
zero and
E[μi] = rf + βi(E[μm] − rf ),
which gives the theoretical expected return of the i-th asset in an efficient market.
When βi = 0, the i-th asset is uncorrelated to the market and expects to earn the
risk-free rate. Under CAPM, investors share the same beliefs about return and risk
and will be rewarded for the risk taken. They are equally exposed to the risky assets
and hold the same tangency portfolio for the highest Sharpe ratio, which turns out
to be the market portfolio in MVO analysis.370 27 Systematic Strategy
## 27.2.2 Arbitrage Pricing Theory (APT)
The arbitrage pricing theory, proposed by Stephen Ross [71], extends CAPM by
allowing multiple risk factors, resulting in a multiple linear regression formulation,
μi − rf =
K
k=1
βik(Fk − rf ) + i, (27.1)
where μi, rf , i are defined as before, and Fk is the return of the k-th systematic
risk factor which is common to all assets (hence no index i). The i-th asset’s return
is now described by a set of betas βik (also known as factor loadings), generalizing
the single market factor in CAPM.
APT uses fewer assumptions than CAPM. Statistical methods, such as principal
component analysis (PCA), may help to identity the factors in (27.1) from the given
asset returns μi, i = 1,2,...,n. However, the generated factors may sometimes
bear no economic meaning. Alternative methods are as follows.
Time series regression: Consider only the i-th asset and its returns μi’s are
realized in a time series. Let Fk be asset-independent and observable factors
(say, macroeconomic variables such as inflation, GDP or fundamental variables
such as exchange rates) also given as time series. Then, a multiple regression
is performed between μi and the K factors, and the factor loadings βik for
asset i are determined. See the Chen–Roll–Ross [19] macroeconomic model for
reference.
Cross-sectional regression: All assets are considered but only at the same time
point t. Let the asset returns be μ1, μ2, and etc. at t. The factor loadings βik
are assumed to be known in this case, e.g., asset-specific variables such as asset
momentum or industry classification. Then, a multiple regression is employed
to determine the factor realizations Fk at time t. See BARRA approach [35] for
reference.
Others: There are also other approaches, say the Fama–MacBeth regression [31].
Recall that in the mean-variance analysis, the estimation of the input variables
may be heavy when the number of assets n is large. The APT describes the asset
returns by systematic factors, which are usually much smaller in size (known as
dimensionality reduction in machine learning and statistics).The reduced estimation
complexity for covariance Σ is achieved by
Σ = BΣf B
+ D,
where B is the n-by-K matrix of factor loadings, Σf is the K-by-K factor
covariance matrix, and D is the specific risk covariance matrix.27.3 Factors and Factor-Based Strategies 371
## 27.3 Factors and Factor-Based Strategies
In addition to the market factor in CAPM, significant advances have been made over
the past two decades in understanding the factors impacting the risk premium, i.e.,
the return in excess of the risk-free rate through the exposure to the (risk) factors.
As more data are becoming available, the number of such factors is increasing
significantly and this phenomenon is described as a “zoo of new factors” by John
Cochrane [23]. Nowadays, factors are made into indices by index providers such as
MSCI. They are also used as investment strategies in factor-tracking ETFs or mutual
funds.
In the following, we introduce some risk factors which are well studied in
academic research and believed to offer risk premia from empirical tests. Evidently,
the list of factors has no limit.
Momentum
Momentum strategy is based on the belief that increases in the price of a security
will be likely followed by additional gains and vice versa for declining values.
This strategy consists of taking long position in the assets with upward trends (and
eventually short sell securities with downward trends).
For the implementation, practitioners need to make the choices regarding:
– observation window: for calculating price momentum, the common choices are
3 months, 6 months, or 1 year.
– return calculation: the return type may be total return, z-score1 or some other
return types. The historical data may be weighted equally or exponentially for
giving higher importance to recent data.
– other signals: e.g., the crossing of short-term moving average over long-term
moving average.
Value
Value factor investing has long existed and is designed to long the under-valued
assets and eventually short over-valued assets. Prices are not directly used to
represent the factor but instead normalized financial ratios are used, e.g.
– price-to-book (P/B) ratio
– forward price/earnings (P/E) ratio
1z-score is defined as
return − averaged return
standard deviation of the return
.372 27 Systematic Strategy
– dividend yield
– cash-flow to price ratio.
Equity valuation, bond rating and other financial analysis may be found on public
or private sources:
– Bloomberg (“ANR” command, showing buy/sell/hold ratings from analysts)
– Conviction list from research teams of investment banks
– Financial analytics systems, e.g., STARMINE.
Size
Size factor is generally defined by the market capitalization (abbreviated as “cap”)
and aims at investing into either of the following categories:
– small caps
– mid caps (medium size corporates)
– big caps.
A common size strategy is set up by buying small caps and short-selling big caps.
Practical implementation might take into account the liquidity and transaction cost
when trading small caps. The borrow availability and cost also need to be considered
in building the short position.
Carry
Carry trade aims at creating value by carrying over time a certain position and
earning on the accrual (amongst other things). For example, FX carry trade consists
of
– borrowing in a low interest rate currency, e.g., JPY
– investing in a high interest rate currency, e.g., AUD.
This strategy will be a winning trade which earns approximately the interest rate
difference if the FX rate has not changed significantly at the end of the trade tenor.
Volatility
Volatility strategies capture the opportunities from volatility exposures. For
example:
– Receiving implied volatility and paying realized volatility: it is based on the
observation that the implied volatility is often higher than the realized volatility.27.3 Factors and Factor-Based Strategies 373
– Tail-risk hedging strategy based on implied volatility (through trades on VIX or
forward starting variance swaps): it jumps up at extreme market event.
– Call overwriting (or Buy/Write) strategy: it consists of holding a long position
of certain assets and selling (either regularly or opportunistically) short term call
options on (some of) these assets.
Geography
This factor targets to take advantage of either
– the high growth potential of certain geographical regions, or
– the growth differential between different geographical regions.
An example is to long emerging market and short developed market. When used
in a BARRA-type factor model, the “Geography” factor can be represented by a
dummy variable in the regression, i.e., taking the value 1 if belonging to a certain
region and 0 otherwise.
Multi-factor Models
Factors are often combined to alleviate the possible underperformance of a specific
factor during a certain period. The following well-known model is a typical example
of implementable multi-factor models.
Example 27.1 The famous investable “Fama–French three-factor model” [32]
included “Size” and “Value” factors in addition to the “Market” factor of CAPM. It
is later extended by Carhart with an additional “Momentum” factor, leading to the
“Fama–French–Carhart four-factor model” [13]:
μi − rf = αi + βi × (μm − rf ) + si × SMB + hi × HML + wi × WML + i,
where the size factor SMB (Small Minus Big), the value factor HML (High Minus
Low), the momentum factor WML (Winner Minus Loser) are not obtained from
direct observations but from a long-short type of factor mimicking portfolio:
SMB: difference between the returns on diversified portfolios of small stocks and
big stocks;
HML: difference between the returns on diversified portfolios of high book-to-
market stocks and low book-to-market stocks;
WML: difference between the returns on diversified portfolios of the winners and
losers of the past year.374 27 Systematic Strategy
## 27.4 Other Systematic Strategies
Systematic strategies are not limited to factor-based ones. Any rule-based invest-
ment constitutes a systematic strategy.
In the market, we have seen many strategies based on dynamic asset allocation
mechanism applied on a basket of assets from different asset classes. For example,
several investment banks have implemented MVO-based strategies making dynamic
investment on a basket of indices or ETFs covering equity, bond and commodities
market (e.g. a basket of 10 underlyings). Risk parity is also a popular systematic
strategy due to its simplicity.
## 27.5 Performance Measuring
Building systematic strategies is based on the observed daily or monthly returns
of various assets, which are used to estimate the expected returns and covariance
matrix. Once the strategy is set up, we can evaluate its backtested performance for k
days/months. Take the example of global minimum variance strategy for n assets
which determines the asset weights w = [w1,w2,...,wn] via the covariance
matrix such that the expected variance of the portfolio is minimized.
Suppose at time i = 1,2,...,k, the return of the j-th asset is rij, then the
strategy (portfolio) return in the backtesting period is
rs =
⎡
⎢
⎢
⎢
⎣
r1
r2
. . .
rk
⎤
⎥
⎥
⎥
⎦
=
⎡
⎢
⎢
⎢
⎣
r11 r12 ··· r1n
r21 r22 ··· r2n
. . .
. . .
...
. . .
rk1 rk2 ··· rkn
⎤
⎥
⎥
⎥
⎦
⎡
⎢
⎢
⎢
⎣
w1
w2
. . .
wn
⎤
⎥
⎥
⎥
⎦
,
which is the realized version of the random variable rw in Chap.26.
Basic descriptive statistics of rs describe the systematic strategy such as
– mean: measuring the overall profitability
– standard deviation: a commonly accepted measure for risk
– skewness: whether winning small constantly but losing big once in a while, or
the other way around
– kurtosis: tail events, the scenario of having large gain or loss.
The performance of a systematic strategy is generally measured with the same
indicators used for funds. See Chap.1 for the ex-ante definitions of Sharpe ratio,
information ratio, Treynor ratio, Sortino ratio and maximum drawdown.
For instance, the ex-post calculation of Sharpe ratio is as follows. The mean of rs
minus thecorresponding risk-freerate(or,therealfinancing cost) ofthesameperiod27.6 Customized Index 375
gives the excess return, which is then divided by the volatility or sample standard
deviation of rs.
## 27.6 Customized Index
A customized index is an investment strategy with its return values published on a
market data system, e.g. Bloomberg. Any systematic strategy can be presented and
traded as a customized index.
One important type of customized index is the rolling futures index which con-
sists of investing in futures continually. It is an efficient way to gain beta exposure
to the underlying asset. The return of rolling futures is close to excess return due to
the low capital cost for futures transactions. The simplest implementation consists
of investing in the nearest (front-month) futures because of its high liquidity, and
changing (rolling) to the next nearest futures a few days before the expiry date of the
nearest futures. The downward sloping futures price curve (backwardation) makes
“profit” on rolling. Conversely, in the upward sloping (contango) situation, the index
suffers “loss” on rolling.
The investment banks often publish their systematic strategies as customized
indices. The implementation of a customized index includes two documentations.
1. Index Rules: providing all the details including the investment strategy, costs and
the exact actions to take upon eventual events. The below elements are often seen
in the index rules.
– Index fees (management fees)
– Corporate actions treatment: dividend, spin-off, merger, etc.
– Tax: dividend tax, capital gain tax, etc.
– Investmentrestrictions:marketaccess,securitiesborrow,conflictsofinterests,
etc.
– FX exposure: composite return or hedging with FX forward
– Liquidity: caps on each name according to its liquidity
– Transaction cost, funding cost, securities lending benefits
– and etc.
2. Index Risk Disclosure: explaining the risks as well as the investor suitability.
Exercises
1. Find out the definition of turnover rate for a portfolio. Does an actively managed
portfolio or a passively managed one have a larger turnover rate and why is that?
What kind of risk is related to a high turnover rate?376 27 Systematic Strategy
2. Consider CAPM and let wmkt = [w1,w2,...,wn] denote the market capital-
ization weight such that the market return is
μm =
n
j=1
wjμj
and Σ denotes the covariance matrix of asset returns. Show that the expected
excess returns are
[E[μ1] − rf ,E[μ2] − rf ,...,E[μn] − rf ]
=
E[μm] − rf
Var(μm)
Σwmkt.
Note that this formulation can be used for constructing the prior return in the
Black–Litterman model.
3. Suppose the daily returns of a systematic strategy are given by
rs = [2.5986%,−0.4661%,−1.1829%,−1.3517%,0.7311%]
for a certain week. Calculate the maximum drawdown for this period.Appendix A
Theorems in Probability Theory
In this appendix, we have included some theorems in probability theory, especially
ones in multivariate analysis.
A.1 Law of Total Covariance
Let X, Y, and Z be random variables in the same probability space. The conditional
covariance of X and Y given Z is defined as
Cov(X,Y|Z) = E[(X −E[X|Z])(Y −E[Y|Z])|Z] = E[XY|Z]−E[X|Z]E[Y|Z].
Proposition A.1 (Law of Total Covariance)
Cov(X,Y) = E[Cov(X,Y|Z)] + Cov(E[X|Z],E[Y|Z])
Proof Taking E[.] on both sides of Cov(X,Y|Z) gives
E[Cov(X,Y|Z)] = E[XY] − E[E[X|Z]E[Y|Z]].
Then,
Cov(X,Y) = E[XY] − E[X]E[Y]
= E[Cov(X,Y|Z)] + E[E[X|Z]E[Y|Z]] − E[X]E[Y]
= E[Cov(X,Y|Z)] + E[E[X|Z]E[Y|Z]] − E[E[X|Z]]E[E[Y|Z]]
= E[Cov(X,Y|Z)] + Cov(E[X|Z],E[Y|Z]]). 
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6
377378 A Theorems in Probability Theory
A.2 Multivariate Random Variable
Let X be a column vector of random variables [X1,X2,...,Xp] on some
probability space. The expectation E[X] is also a column vector, containing the
expectations in each dimension. The variance Var(X) is a p × p matrix defined as
Var(X) = E[(X − E[X])(X − E[X])
],
which is also known as the variance-covariance matrix. Let Y be another q-
dimensional multivariate random variable. The p × q cross-covariance matrix
between X and Y is defined as
Cov(X,Y) = E[(X − E[X])(Y − E[Y])
] = E[XY
] − E[X]E[Y]
.
Let A and B be non-random n×p and m×q matrices respectively. We have the
following proposition.
Proposition A.2 For the linear transformations AX and BY, we have
E[AX] = AE[X],
Var(AX) = AVar(X)A
,
Cov(AX,BY) = ACov(X,Y)B
.
Proof The expectation follows directly from linearity. Then, we only need to show
the covariance case
Cov(AX,BY) = E[AX(BY)
] − E[AX]E[BY]
= AE[XY
]B
− AE[X]E[Y]
B
= A(E[XY
] − E[X]E[Y]
)B
= ACov(X,Y)B
. 
A.3 Multivariate Normal Distribution
Assume that the multivariate random variable X follows the multivariate normal
distribution with X ∼ N (μ,Σ).
Proposition A.3 (Linear Transformation Property of Multivariate Normal Vec-
tor) Let A be an n × n non-random matrix. The linear transformation AX also
follows the multivariate normal distribution, with
AX ∼ N (Aμ,AΣA
).A Theorems in Probability Theory 379
Proof Denote X as [X1,X2,...,Xn]. By definition of multivariate normal dis-
tribution, any linear combination of Xi, i = 1,...,n is normally distributed. As
each entry of the vector AX is a linear combination of Xi, i = 1,...,n, any linear
combination of the entries must also be normally distributed. Hence, AX follows
the multivariate normal distribution which is fully characterized by the expectation
and covariance. From Proposition A.2, we obtain
E[AX] = AE[X] = Aμ and Cov(AX,AX) = AΣA
. 
A.4 Conditional Normal Distribution
Consider an n-dimensional normally distributed random vector partitioned into two
parts as
X1
X2
!
∼ N (μ,Σ),
where
μ =
μ1
μ2
!
is an n × 1 vector,
Σ =
Σ11 Σ12
Σ21 Σ22
!
is an n × n symmetric positive-semidefinite matrix,
X1,μ1 are p × 1 vectors, X2,μ2 are q × 1 vectors, p + q = n, Σ = Σ, and
Σ21 = Σ

12.
Proposition A.4 (Conditional Normal Distribution) The conditional distribution
of X1 given X2 is normal:
X1|X2 = x2 ∼ N (μX1|X2=x2
,ΣX1|X2=x2),
where
μX1|X2=x2
= μ1 + Σ12Σ−1
22 (x2 − μ2),
ΣX1|X2=x2 = Σ11 − Σ12Σ−1
22 Σ21.
Evidently, we have similar result for X2|X1 = x1.380 A Theorems in Probability Theory
Proof Consider the centered random vectors Y = X1 − μ1 and X = X2 − μ2.
Define Z = Y − AX where A = Σ12Σ−1
22 . From
Z
X
!
=
I −A
0 I
!
Y
X
!
=
I −A
0 I
!
X1 − μ1
X2 − μ2
!
,
we see that Z and X are jointly normally distributed vectors, and so are Z and X2.
The distribution of Z is
Z ∼ N (0,Σ11 − Σ12Σ−1
22 Σ21)
because E[Z] = E[Y − AX] = E[Y] − AE[X] = 0 and
Var(Z) = Var(Y − AX)
= Var(Y) + AVar(X)A
− ACov(X,Y) − Cov(Y,X)A
= Σ11 + Σ12Σ−1
22 Σ22(Σ12Σ−1
22 )
− Σ12Σ−1
22 Σ21 − Σ12(Σ12Σ−1
22 )
= Σ11 − Σ12Σ−1
22 Σ21.
Now, we show that Z and X2 are uncorrelated:
Cov(Z,X2) = Cov(Y,X2) − Cov(AX,X2)
= Cov(X1−μ1,X2)−ACov(X2 −μ2,X2) = Σ12 −Σ12Σ−1
22 Σ22 =0.
Itisaknownpropertythatuncorrelatedjointnormalvectorsareindependent.Hence,
Z and X2 are independent normal vectors. Now, we can determine the distribution
of X1|X2 = x2 by
E[X1|X2 = x2] = E[μ1 + Y|X2 = x2] = E[μ1 + Z + AX|X2 = x2]
= μ1 + E[Z|X2 = x2] + A(x2 − μ2)
= μ1 + E[Z] + Σ12Σ−1
22 (x2 − μ2)
= μ1 + Σ12Σ−1
22 (x2 − μ2)
and
Var(X1|X2 = x2) = Var(Y|X2 = x2) = Var(Z + AX|X2 = x2)
= Var(Z + A(x2 − μ2)|X2 = x2)
= Var(Z) = Σ11 − Σ12Σ−1
22 Σ21. A Theorems in Probability Theory 381
Proposition A.5 (Woodbury matrix identity) Let A,B,C,D be matrices with
compatible dimensions. Then,
(A + CBD)−1
= A−1
− A−1
C(B−1
+ DA−1
C)−1
DA−1
.
Proof Let I be an identity matrix with suitable size. Then,
(A + CBD)(A−1
− A−1
C(B−1
+ DA−1
C)−1
DA−1
)
= (A + CBD)A−1
− (A + CBD)A−1
C(B−1
+ DA−1
C)−1
DA−1
= I + CBDA−1
− (C + CBDA−1
C)(B−1
+ DA−1
C)−1
DA−1
= I + CBDA−1
− CB(B−1
+ DA−1
C)(B−1
+ DA−1
C)−1
DA−1
= I + CBDA−1
− CBDA−1
= I. Appendix B
Representation of CIR Process
as a Squared Bessel Process
Some of the important stochastic processes used in financial modelling such as
CEV process (used in SABR model) and CIR process (used in CIR short rate
model and Heston model) can be represented by a time-changed Squared Bessel
process. This helps to understand the properties of these processes because Squared
Bessel process is well studied and many properties are well known. Here, we will
only illustrate the representation of CIR process. We refer to [43] for rigorous and
detailed presentation in general.
B.1 Squared Bessel Process
Squared Bessel Process is one of the most important one-dimensional stochastic
processes. It is defined as a generalization of the process followed by the squared
norm of a multi-dimensional Brownian motion. Denote Z2
t =
k 
i=1
(Bi
t )2 where Bt =
(B1
t ,...,Bk
t ) is a k-dimensional Brownian motion and Zt = Bt. By Ito–Doeblin
formula, we obtain
dZ2
t =
k
i=1
2Bi
t dBi
t + kdt = 2Zt
k
i=1
Bi
t
Bt
dBi
t + kdt = 2ZtdWt + kdt,
where we use the fact that Wt =
k
i=1
 t
0
Bi
s
Bs
dBi
s is a one-dimensional Brownian
motion which can be verified with Levy’s Theorem.
Squared Bessel Process is defined as the generalization of the process followed
by Z2
t with k extended to non-integer values, i.e. k ∈ R:
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6
383384 B Representation of CIR Process as a Squared Bessel Process
dXt = 2

XtdWt + kdt.
In our context, we only consider k ≥ 0 and strictly positive initial value X0 > 0.
Xt follows Chi-squared distribution extended to non-integer degrees of freedom
(cf. [43]). An important focus is the condition for reaching zero. The following
features are useful for the applications in financial modelling
(i) k > 2: Xt will never reach 0 and Xt → +∞ as t → +∞.
(ii) k = 2: Xt will never reach 0 and Xt is recurrent, meaning that the probability
for Xt to get infinitely close to any non negative value in any finite time is
strictly positive.
(iii) 0 < k < 2: Xt reaches 0 in finite time. However, it leaves 0 instantaneously.
(iv) k = 0: Xt reaches 0 in finite time and will stay at 0 afterwards.
For the proofs, we refer to [44] for k = 2. For a comprehensive analysis, we refer
to [43, 68] and [51]. For helping to understand the properties, we mention some
intuitions. In the case of one dimension (i.e. k = 1),
√
Xt is a standard Brownian
motion before hitting 0. So, it reaches 0 in finite time as it is the case for standard
Brownian motion. For 0 ≤ k < 1, the process can be written as the sum of a
Squared Bessel process with dimension 1 and a strictly decreasing term: dXt =
(2
√
XtdWt + 1dt) + (k − 1)dt. So, Xt reaches 0 for 0 ≤ k < 1. Similarly, for
k > 2 with dXt = (2
√
XtdWt + 2dt) + (k − 2)dt, Xt will never reach 0 if it never
reaches zero for k = 2. Whenever the point 0 is reached, the staying time should
be zero (i.e. it leaves 0 instantaneously). Otherwise, the SDE can not hold because
in such case, the kdt term is strictly positive but all the other terms are zero for the
time period that Xt stayed at zero.
B.2 Representation of CIR Process
Consider the CIR process which follows the below SDE under the assumption that
b > 0,r0 > 0,σ > 0 and a ∈ R,
drt = (a − brt)dt + σ
√
rtdWt.
First, we try to remove rt in the drift. Applying Ito’s Product Rule to Yt = ebtrt,
we have
dYt = ebt
drt + brtebt
dt = ebt
(adt + σ
√
rtdWt) = aebt
dt + σ

ebt

YtdWt.
Denote τ(t) such that t = σ2
4
τ(t)
0 ebsds for any given t. τ(t) exists because
f(x) = σ2
4
x
0 ebsds is an increasing continuous function with f(0) = 0 and
f(+∞) = +∞. Hence, integration from 0 to τ(t) givesB Representation of CIR Process as a Squared Bessel Process 385
Yτ(t) = r0 + a
 τ(t)
0
ebs
ds + 2
 τ(t)
0
σ
2

ebs

YsdWs.
The first integral is equivalent to the following which is straightforward from the
definition of τ(t),
a
 τ(t)
0
ebs
ds =
4a
σ2
t.
For the second integral, we will apply the so-called time-change. Actually, for any
continuous martingale Mt, it is known that Mt = WMt,Mt. This helps to understand
time-change which implies:
 T
0
βtdMt =
 MT ,MT 
0
βu(t)dMu(t) =
 MT ,MT 
0
βu(t)dWt,
where u(t) is the value such that Mu(t),Mu(t) = t.
Now, for our case, denote Mt =
t
0
σ
2
√
ebsdWs. Mt is a continuous martingale
and Mτ(t),Mτ(t) = σ2
4
τ(t)
0 ebsds = t. Applying time-change, we have for the
second integral,
 τ(t)
0
σ
2

ebs

YsdWs =
 τ(t)
0

YsdMs =
 t
0

Yτ(s)dWs.
And all together,
Yτ(t) = r0 +
4a
σ2
t + 2
 t
0

Yτ(s)dWs.
Setting Xt = Yτ(t), X0 = r0 and k = 4a
σ2 , we obtain the representation of CIR
process as a Squared Bessel process
Xt = r0 + kt + 2
 t
0

XsdWs.
From the properties of Squared Bessel process, we obtain the following:
– if a ≥ σ2
2 , then rt will never reach zero.
– if 0 < a < σ2
2 , then rt has a non zero probability to touch 0 in any time interval
but rt will leave 0 instantaneously if it does.References
1. Andersen, L.B.G., Buffum, D.: Calibration and implementation of convertible bond models. J.
Comput. Finance 7(2), 1–34 (2004)
2. Andersen, L.B.G., Piterbarg, V.V.: Interest Rate Modeling. Volume 1: Foundations and Vanilla
Models, 1st edn. Atlantic Financial Press, London (2010)
3. Andersen, L.B.G., Piterbarg, V.V.: Interest Rate Modeling. Volume 2: Term Structure Models,
1st edn. Atlantic Financial Press, London (2010)
4. Andersen, L.B.G., Piterbarg, V.V.: Interest Rate Modeling. Volume 3: Products and Risk
Management, 1st edn. Atlantic Financial Press, London (2010)
5. Bachelier, L.: Théorie de la spéculation. Annales Scientifiques de l’École Normale Supérieure
3(17), 21–86 (1900)
6. Basel Committee on Banking Supervision: An Explanatory Note on the Basel II IRB Risk
Weight Functions. BIS (2005) https://www.bis.org/bcbs/irbriskweight.pdf
7. Becker, M.: Exact simulation of final, minimal and maximal values of Brownian motion and
jump-diffusions with applications to option pricing. Comput. Manage. Sci. 7(1), 1–17 (2010)
8. Bergomi, L.: Stochastic Volatility Modeling, 1st edn. Chapman and Hall/CRC Financial
Mathematics. CRC Press, Boca Raton (2016)
9. Bisesti, L., Castagna, A., Mercurio, F.: Consistent pricing and hedging of an FX options book.
Kyoto Econ. Rev. 74(1), 65–83 (2005)
10. Black, F., Scholes, M.: The pricing of options and corporate liabilities. J. Polit. Econ. 81(3),
637–654 (1973)
11. Black, F., Litterman, R.: Asset allocation: combining investor views with market equilibrium.
Goldman Sachs Fixed Income Research Note (1990)
12. Brigo D., Pallavicini A., Torresetti, R.: Credit Models and the Crisis: A Journey into CDOs,
Copulas, Correlations and Dynamic Models. Wiley, Hoboken (2010)
13. Carhart, M.M.: On persistence in mutual fund performance. J. Finance 52, 57–82 (1997)
14. Carr, P., Javaheri, A.: The forward PDE for European options on stocks with fixed fractional
jumps. Int. J. Theor. Appl. Finance 8(2), 239–253 (2005)
15. Carr, P., Madan, D.B.: Option valuation using the fast Fourier transform. J. Comput. Finance
2(4), 61–73 (1999)
16. Cesari, G., Aquilina, J., Charpillon, N., Filipovic, Z., Lee, G., Manda, I.: Modelling, Pricing,
and Hedging Counterparty Credit Exposure. Springer Finance, Berlin/Heidelberg (2009)
17. Chan, R.H., Ng, M.K.: Conjugate gradient methods for Toeplitz systems. SIAM Rev. 38(3),
427–482 (1996)
18. Chan, R.H., Jin, X.-Q.: An Introduction to Iterative Toeplitz Solvers. SIAM, Philadelphia
(2007)
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6
387388 References
19. Chen,N.-F.,Roll,R.,Ross,S.A.:Economicforcesandthestockmarket.J.Bus.59(3),383–403
(1986)
20. Choueifaty, Y., Coignard, Y.: Toward maximum diversification. J. Portf. Manage. 35(1), 40–51
(2008)
21. Clark, I.J.: Foreign Exchange Option Pricing – A Practitioner’s Guide, 1st edn. Wiley Finance,
Chichester (2011)
22. Clark, I.J.: Commodity Option Pricing – A Practitioner’s Guide, 1st edn. Wiley Finance,
Chichester (2014)
23. Cochrane, J.H.: Presidential address: discount rates. J. Finance 66(4), 1047–1108 (2011)
24. Cont, R., Tankov, P.: Constant proportion portfolio insurance in presence of jumps in asset
prices. Math Finance 19(3), 379–401 (2009)
25. Cox, J.C., Ross, S.A., Rubinstein, M.: Option pricing: a simplified approach. J. Financ. Econ.
7(3), 229–263 (1979)
26. Cox, J.C., Ingersoll, J.E., Ross, S.A.: A theory of the term structure of interest rates.
Econometrica 53, 385–407 (1985)
27. Craig, J.D., Sneyd, A.D.: An alternating-direction implicit scheme for parabolic equations with
mixed derivatives. Comput. Math. Appl. 16(4), 341–350 (1988)
28. Crank, J., Nicolson, P.: A practical method for numerical evaluation of solutions of partial
differential equations of the heat conduction type. Math. Proc. Camb. Philos. Soc. 43(1), 50–
67 (1947)
29. Duffie, D., Kan, R.: A yield-factor model of interest rates. Math. Finance 6(4), 379–406 (1996)
30. Estep, T., Kritzman, M.: TIPP: insurance without complexity. J. Portf. Manage. 14(4), 38–42
(1988)
31. Fama, E.F., MacBeth, J.D.: Risk, return, and equilibrium: empirical tests. J. Polit. Econ. 81(3),
607–636 (1973)
32. Fama, E.F., French, K.R.: Common risk factors in the returns on stocks and bonds. J. Financ.
Econ. 33, 3–56 (1993)
33. Gabillon, J.: The term structures of oil futures prices. Oxford Institute for Energy Studies,
Working paper (1991)
34. Gordy, M.B.: A risk-factor model foundation for ratings-based bank capital rules. J. Financ.
Intermed. 12, 199–232 (2003)
35. Grinold, R., Kahn, R.: Active Portfolio Management: A Quantitative Approach for Producing
Superior Returns and Controlling Risk, 2nd edn. McGraw-Hill, New York (1999)
36. Gatheral, J.: The Volatility Surface – A Practitioner’s Guide, 1st edn. Wiley Finance, Hoboken
(2006)
37. Glasserman, P.: Monte Carlo Methods in Financial Engineering, 1st edn. Springer, New York
(2003)
38. He, G., Litterman, R.: The intuition behind Black–Litterman model portfolios. Goldman Sachs
Quantitative Resources Group Working Paper (1999)
39. Heston, S.L.: A closed-form solution for options with stochastic volatility with applications to
bond and currency options. Rev. Financ. Stud. 6(2), 327–343 (1993)
40. Hull, J.: Options, Futures, and Other Derivatives, 10th edn. Pearson, New York (2017)
41. Hull, J., White, A.: Pricing interest-rate derivative securities. Rev. Financ. Stud. 3(4), 573–592
(1990)
42. Jacod, J., Protter, P.: Probability Essentials, 2nd edn. Springer, Berlin/Heidelberg (2004)
43. Jeanblanc, M., Yor, M., Chesney, M.: Mathematical Methods for Financial Markets, 1st edn.
Springer, London (2009)
44. Karatzas, I., Shreve, S.E.: Brownian Motion and Stochastic Calculus, 2nd edn. Springer, New
York (1988)
45. Kwok, Y.-K.: Mathematical Models of Financial Derivatives, 2nd edn. Springer, New York
(2008)
46. Kolanovic, M., Wei, Z.: Equity Risk Premia Strategies – Risk Factor Approach to Portfolio
Management. J.P. Morgan (2014)References 389
47. Lamberton, D.: Optimal stopping and American options. Ljubljana Summer School on
Financial Mathematics (2009)
48. Leland, H.E.: Option pricing and replication with transactions costs. J. Finance 40(5), 1283–
1301 (1985)
49. Lintner, J.: The valuation of risk assets and the selection of risky investments in stock portfolios
and capital budgets. Rev. Econ. Stat. 47(1), 13–37 (1965)
50. Longstaff, F.A., Schwartz, E.S.: Valuing American options by simulation: a simple least-
squares approach. Rev. Financ. Stud. 14(1), 113–147 (2001)
51. Lowther, G.: Bessel Processes. Almost Sure (2010). https://almostsure.wordpress.com/2010/
07/28/bessel-processes/
52. Markit Group Limited: Markit Credit Indices – A Primer (2013)
53. Markowtiz, H.M.: Portfolio selection. J. Finance 7(1), 77–91 (1952)
54. Merton, R.C.: An analytic derivation of the efficient portfolio frontier. J. Financ. Quant. Anal.
7(4), 1851–1872 (1972)
55. Merton, R.C.: Theory of rational option pricing. Bell J. Econ. Manage. Sci. 4(1), 141–183
(1973). The RAND Corporation
56. Merton, R.C.: On the pricing of corporate debt: The risk structure of interest rates. J. Finance
29(2), 449–470 (1974)
57. Merton,R.C.:Optionpricingwhenunderlyingstockreturnsarediscontinuous.J.Financ.Econ.
3, 125–144 (1976)
58. Merton, R.C.: Continuous-Time Finance. Wiley-Blackwell, Cambridge (1992)
59. Mossin, J.: Equilibrium in a capital asset market. Econometrica 34(4), 768–783 (1966)
60. Øksendal, B.: Stochastic Differential Equations: An Introduction with Applications, 6th edn.
Springer, New York (2003)
61. Overhaus, M., Bermudez, A., Buehler, H., Ferraris, A., Jordinson, C., Lamnouar, A.: Equity
Hybrid Derivatives, 1st edn. Wiley Finance, Hoboken (2007)
62. Papoulis, A.: Probability, Random Variables, and Stochastic Processes, 2nd edn. McGraw-Hill,
New York (1984)
63. Perold, A.F.: Constant proportion portfolio insurance. Harvard Business School, Working
paper (1986)
64. Pinto, J.E., Henry, E., Robinson, T.R., Stowe, J.D.: Equity Asset Valuation, 3rd edn. Wiley,
New York (2015)
65. Piterbarg, V.: Funding beyond discounting: collateral agreements and derivatives pricing,
Risk.net (2010)
66. Protter, P.E.: Stochastic Integration and Differential Equations, 2nd edn. Springer, New York
(2005)
67. Rannacher, R.: Finite element solution of diffusion problems with irregular data. Numer. Math.
43, 309–327 (1984)
68. Revuz, D., Yor, M.: Continuous Martingales and Brownian Motion, 3rd edn. Springer, New
York (1999)
69. Rogers, L.C.G.: Monte Carlo valuation of American options. Math. Finance 12(3), 271–286
(2002)
70. Roncalli, T.: Introduction to Risk Parity and Budgeting, 1st edn. Chapman and Hall/CRC, Boca
Raton (2013)
71. Ross, S.: The arbitrage theory of capital asset pricing. J. Econ. Theory 13(3), 341–360 (1976)
72. Ross, S., Westerfield, R., Jaffe, J.: Corporate Finance, 10th edn. McGraw-Hill, New York
(1976)
73. Rudin, W.: Real and Complex Analysis, 3rd edn. McGraw-Hill Education, Singapore (1986)
74. Samuelson, P.: Rational theory of warrant pricing. Ind. Manage. Rev. 6, 13–31 (1965)
75. Schofield, N.C.: Commodity Derivatives: Markets and Applications, 1st edn. Wiley Finance,
Chichester (2007)
76. Schwartz, E.S.: The stochastic behavior of commodity prices: implications for valuation and
hedging. J. Finance 52(3), 923–973 (1997)390 References
77. Scott, L.O.: Pricing stock options in a jump-diffusion model with stochastic volatility and
interest rates: applications of Fourier inversion methods. Math. Finance 7, 345–358 (1997)
78. Sharpe, W.F.: Capital asset prices: a theory of market equilibrium under conditions of risk. J.
Finance 19(3), 425–442 (1964)
79. Shreve, S.E.: Stochastic Calculus for Finance II: Continuous-Time Models, 1st edn. Springer,
New York (2004)
80. Tobin, J.: Liquidity preference as behavior towards risk. Rev. Econ. Stud. 25(2), 65–86 (1958)
81. Treynor, J.L.: Market value, time, and risk, Unpublished manuscript dated August 8, 1961, no.
95–209 (1961)
82. White, R.: Local Volatility. OpenGamma Quantitative Research (2013)
83. Wilmott, P.: Derivatives: The Theory and Practice of Financial Engineering, 1st edn. Wiley,
New York (1998)
84. Wu, L.: Interest Rate Modeling: Theory and Practice, 1st edn. Chapman & Hall/CRC Financial
Mathematics. CRC Press, Boca Raton (2009)Index
A
Accumulator/decumulator, 318, 320, 331
Adapted process, 103
Affine-yield model, 270
Alternating direction implicit method, 176
Alternative beta, 367
American option, 68, 77, 179
free boundary, 186
Arbitrage, 149
Arbitrage pricing theory, 370
Arithmetic Brownian motion, 140
ASCOT, 336
Asian option, 81, 205
At-the-money forward, 69
At-the-money spot, 69
Autocallable, 314
B
Bachelier model, 140, 220
Backwardation, 51
Barrier option, 79, 202
Basel risk weight function, 286
Basket option, 82, 207
Bayes’ formula, 136, 214
Bermudan option, 179
Best-of profile, 336
Binary option, 80, 201
Binomial tree, 161
American option, 181
pricing formula, 163
Black–Litterman model, 363
Black–Scholes formula, 124, 125, 155
at-the-money forward approximation, 125
Black–Scholes–Merton model, 120, 153
dividend, 155
Black’s formula, 218, 220
Bond, 18
convertible bond, 19, 342
Macaulay duration, 21
price, 19
yield to maturity, 20
Bonus enhanced note, 317
Booster note, 324
Breeden–Litzenberger formula, 236
Brownian motion, 109
correlated, 112
covariance, 195
with drift, 199
first passage time, 196
Lévy’s characterization, 112
maximum to date, 196
minimum to date, 196
reflection principle, 197
scaling, 110
C
Call option, 67
Cap, 71, 218
Capital asset pricing model (CAPM), 368
Caplet, 71, 218
Cash and carry, 38
Central limit theorem, 101
Change of numéraire, 213
annuity, 218
foreign exchange, 224
money market account, 216
stock, 214
zero coupon bond, 217
Change of probability, 135
© Springer Nature Singapore Pte Ltd. 2019
R. H. Chan et al., Financial Mathematics, Derivatives and Structured Products,
https://doi.org/10.1007/978-981-13-3696-6
391392 Index
Cholesky factorization, 170
Cliquet option, 325
Close-out risk, 285
Collar financing, 344
Collateralized debt obligation, 58
Complete market, 149
Composite option, 82, 227
Compound Poisson process, 249
Conditional expectation, 104
partial averaging, 105
tower property, 106
Constant elasticity of variance model, 220
Constant maturity swap, 28
Constant proportion portfolio insurance
(CPPI), 355
Contango, 51
Convertible bond, 19, 342
Copula, 281
Counterparty risk, 284
close-out risk, 285
credit value adjustment (CVA), 285
debt value adjustment (DVA), 286
expected positive exposure (EPE), 285
potential future exposure (PFE), 285
wrong-way risk, 286
Cox–Ingersoll–Ross model, 141, 269
Cox–Ross–Rubinstein model, 161
Crank–Nicolson scheme, 175, 176
Credit default swap, 55, 280
Credit-linked note, 56, 340
Credit support annex (CSA), 9
Credit triangle, 281
Credit value adjustment (CVA), 285
Cross variation, 109
D
Daily accrual callable (DAC), 313, 335
Day count convention, 13
Debt value adjustment (DVA), 286
Diffusion, 108
Discount bond, 260
Dividend, 36, 155
Doob–Meyer decomposition, 108
Dual currency investment, 330
Dupire’s formula, 237
E
Efficient frontier, 361
Equity-linked note (ELN), 310
Euler–Maruyama scheme, 167
European option, 68
Expected positive exposure (EPE), 285
Exponential distribution, 100
memorylessness, 100
Exponential martingale, 136
F
Fama–French–Carhart model, 373
Feynman–Kac theorem, 142
Filtration, 103
Filtration switching formula, 279
Finite difference scheme, 172
First Passage Time, 196
Fixed coupon note (FCN), 312
Floor, 71, 218
Floorlet, 71, 218
Fokker–Planck equation, 233
Forward contract, 4
commodity forward, 50
equity forward, 38
foreign exchange forward, 44
non-deliverable forward, 44
Forward rate, 260
Forward rate agreement, 22
Fundamental theorem of asset pricing, 149
Funding value adjustment (FVA), 159
Futures contract, 4
commodity futures, 50
equity index futures, 40
foreign exchange futures, 44
interest rate futures, 23
roll-over, 52
G
Gabillon futures model, 292
Gabillon spot model, 291
Gap note, 337
Gap risk, 207
Garman–Kohlhagen model, 223
Gaussian process, 140
Geometric Brownian motion, 120, 140
Girsanov theorem, 137, 138, 214
Greeks, 126
Delta, 126, 127
Gamma, 126, 128
Rho, 126, 129
Theta, 126, 129
Vega, 126, 129
H
Heath–Jarrow–Morton framework, 261
no-arbitrage condition, 261
Hedge fund, 64Index 393
Hedging, 11, 149, 151
American option, 192
basket credit derivative, 284
correlation risk, 211
delta hedging, 127, 152
determination of delta, 151
discrete hedging, 129
foreign exchange option, 228
Gamma-Theta relationship, 127
gap risk, 207
large delta, 210
P/L, 130
static, 128, 243
structured product, 307
with transaction cost, 132
under jump-diffusion, 256
Heston model, 240
Himalaya, 325
Ho–Lee model, 274
Hull–White model, 267
I
Implied volatility, 73, 130
In-arrears swap, 28
Independence
for events, 90
for random variables, 96
Index
credit index, 57
equity index, 37
Information ratio, 6
In-out parity, 80
Intensity model, 278
Interest rate
compound rate, 15
continuous rate, 15
forward rate, 260
futures, 23
short rate, 260
simple rate, 15
swap, 25
Interest rate model
affine-yield model, 270
Cox–Ingersoll–Ross model, 269
Heath–Jarrow–Morton framework, 261
Ho–Lee model, 274
Hull–White model, 267
linear Gaussian model, 268
Vasicek model, 268
International Swaps and Derivatives
Association (ISDA), 9
Inverse floater, 328
Inverse sampling, 166
Issuer callable/puttable, 315
Itô–Doeblin formula, 114, 115
for jump-diffusion process, 251
Itô integral, 113
Itô process, 114
J
Jump-diffusion model, 252
Jump-diffusion process, 250
pure jump, 250
K
Kolmogorov backward equation, 235
Kolmogorov forward equation, 234
L
Law of large numbers, 101
Law of total covariance, 377
Law of total probability, 90, 91
Lévy’s characterization, 112
Libor, 18
Libor market model, 271
stochastic volatility, 273
Linear Gaussian model, 268
Linear transformation property, 378
Local volatility model, 236
Longstaff–Schwartz method, 190
Lookback option, 81
M
Macaulay duration, 21
Markov process, 108, 141
Mark-to-market, 68, 150
Martingale, 108
exponential martingale, 136
martingale representation, 139
submartingale, 108
supermartingale, 108
Maximum drawdown, 6
Measurable, 103
Modern portfolio theory, 359
efficient frontier, 361
global minimum variance, 366
Money market account, 145
Monte Carlo method, 165
American option, 189
barrier option, 204
quasi-Monte Carlo method, 169
variance reduction, 169
Mutual fund, 63394 Index
N
Non-recourse, 341
Normal distribution, 97
bivariate, 99
moment generating function, 99
multivariate, 378
O
Option, 4,67
Asian option, 81, 205
barrier option, 79, 202
basket option, 82, 207
binary option, 80, 201
call option, 4, 67
cliquet option, 325
commodity option, 70
composite option, 82, 227
corporate action adjustment, 157
CSA discounting, 158
equity option, 70
foreign exchange option, 70
implied volatility, 73
in-out parity, 80
interest rate option, 71
lookback option, 81
moneyness, 69
OIS discounting, 158
put option, 4, 67
quanto option, 82, 228
spread and combination, 75
swaption, 71
Optional sampling theorem, 179
Ornstein–Ulhenbeck process, 140
Overnight indexed swap, 27
P
Partial differential inequality, 182, 184
Phoenix note, 313
Pivot target redemption, 332
Poisson distribution, 100
Poisson process, 116
compensated, 252
compound, 249
Potential future exposure (PFE), 285
Predictable martingale representation, 139
Principal protected, 299
Put-call duality, 225
Put-call parity, 74
Put option, 67
Q
Quadratic covariation, 109
Quadratic variation, 108
for Brownian motion, 111
for Itô integral, 113
for jump-diffusion process, 251
Quanto option, 82, 228
Quasi-Monte Carlo method, 169
R
Radon–Nikodym derivative, 135
Random variable, 92
covariance, 95
distribution, 92
expectation, 93
variance, 95
Range accrual/decrual, 326
Reflection principle, 197
Repo, 10
Reverse convertible, 310, 328, 335
Risk budgeting, 358
Risk neutral pricing, 145
general formula, 150
Risk-neutral probability, 146
Risk-weighted asset (RWA), 286
Risk parity, 358
S
SABR model, 220
Securities Borrowing & Lending, 10
Self-financing, 147, 215
Share buy-backs, 345
Shark-fin, 320
Sharpe ratio, 6, 362
Short rate, 260
σ-algebra, 89
Sklar theorem, 282
Smart beta, 367
Snowball coupon, 314
Sortino ratio, 6
Steepener, 329
Stella note, 324
Stochastic differential equation, 139
existence and uniqueness, 139
Stochastic process, 103
adapted, 103
diffusion, 108
drift, 114
Gaussian, 140
Itô, 114
Markov, 108, 141
predictable, 139
stopped, 179
Stochastic volatility model, 240Index 395
Stopped process, 179
Stopping time, 179
Structural model, 277
Structured product, 4
accumulator/decumulator, 318, 320, 331
ASCOT, 336
autocallable, 314
best-of profile, 336
bonus enhanced note, 317
booster note, 324
cliquent option, 325
credit-linked note, 340
daily accrual callable (DAC), 313, 335
dual currency investment, 330
equity-linked note (ELN), 310
fixed coupon note (FCN), 312
gap note, 337
Himalaya, 325
inverse floater, 328
issuer callable/puttable, 315
leveraged, 323
phoenix note, 313
pivot target redemption, 332
principal protected, 299
range accrual/decrual, 326
reverse convertible, 310, 328, 335
shark-fin, 320
snowball coupon, 314
steepener, 329
stellar note, 324
target redemption, 331
tracker+ note, 322
twin-win, 321
wedding cake, 317
wrapper, 301
zero coupon callable note, 328
Submartingale, 108
Supermartingale, 108
Survival probability, 278
Swap, 4
constant maturity swap, 28
convexity adjustment, 28, 273
credit default swap, 55, 280
cross currency swap, 46
equity swap, 40
foreign exchange swap, 44
in-arrears swap, 28
interest rate swap, 25
non-deliverable swap, 47
overnight indexed swap, 27
variance swap, 244
volatility swap, 245
Swaption, 71, 219
T
Target redemption, 331
T-forward measure, 217
Time invariant portfolio protection (TIPP), 356
Tower property, 106
Tracker+ note, 322
Twin-win, 321
V
Value at risk (VaR), 287
Variance swap, 244
Vasicek model, 268
Volatility swap, 245
Volatility target, 352
W
Wedding cake, 317
Woodbury matrix identity, 381
Wrong-way risk, 286
Y
Yield curve, 29
bootstrapping, 29
construction, 30
Yield to maturity, 20
Z
Zero coupon bond, 16, 260
Zero coupon callable note, 328