---
sha256: 9209c6a749b703bf538a150b83dae5520a4dcaf33157855a6377f6f91157c259
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 886498
---
THE COMPLETE GUIDE TO
Option
Pricing
Formulas
SECOND EDITION
ESPEN GAARDER HAUG
McGraw-Hill
New York Chicago San Francisco
Lisbon London Madrid
Mexico City Milan Seoul New Delhi San Juan
Singapore Sydney TorontoThis book is for my mother and father, who gave me all I needed to
write this book—a pen and a mind—the rest was discipline, hard work,
and patience. We are all standing on the shoulders of our parents. With
this book, hopefully I can give back a fraction of all the knowledge I
have received from this miraculous journey called life. Life is full of
options. I was given the option to write this book, and I exercised that
option. Whether it was optimal for me to exercise it, only time can
tell. You now have the option to read this book. Whether it is optimal
for you to exercise that option is hard to say without a good option
formula. This book is full of option formulas, so what are you waiting
for?
Espen Gaarder HaugCONTENTS
Introduction xvii
Acknowledgments xix
What Is New in the Second Edition? xxi
Option Pricing Formulas Overview xxiii
Glossary of Notations XXXV
## 1 Black-Scholes-Merton 1
## 1.1 Black-Scholes-Merton 2
## 1.1.1 The Black-Scholes Option Pricing Formula 2
## 1.1.2 Options on Stock Indexes 4
## 1.1.3 Options on Futures 4
## 1.1.4 Margined Options on Futures 5
## 1.1.5 Currency Options 6
## 1.1.6 The Generalized Black-Scholes-Merton
Option Pricing Formula 7
## 1.2 Parities and Symmetries 9
## 1.2.1 Put-Call Parity for European Options 9
## 1.2.2 At-the-Money Forward Value Symmetry 10
## 1.2.3 Put-Call Symmetry 10
## 1.2.4 Put-Call Supersymmetry 11
## 1.2.5 Black-Scholes-Merton on Variance Form 11
## 1.3 Before Black-Scholes-Merton 12
## 1.3.1 The Bachelier Model 12
## 1.3.2 The Sprenkle Model 13
## 1.3.3 The Boness Model 14
## 1.3.4 The Samuelson Model 14
## 1.4 Appendix A: The Black-Scholes-Merton PDE 15
viiviii CONTENTS
## 1.4.1 Ito's Lemma 15
## 1.4.2 Dynamic Hedging 16
## 2 Black-Scholes-Merton Greeks 21
## 2.1 Delta Greeks 21
## 2.1.1 Delta 21
## 2.1.2 Delta Mirror Strikes and Assets 29
## 2.1.3 Strike from Delta 30
## 2.1.4 Futures Delta from Spot Delta 31
## 2.1.5 DdeltaDvol and DvegaDspot 32
## 2.1.6 DvannaDvol 34
## 2.1.7 DdeltaDtime, Charm 35
## 2.1.8 Elasticity 36
## 2.2 Gamma Greeks 38
## 2.2.1 Gamma 38
## 2.2.2 Maximal Gamma and the Illusions of Risk 39
## 2.2.3 GammaP 42
## 2.2.4 Gamma Symmetry 45
## 2.2.5 DgammaDvol, Zomma 45
## 2.2.6 DgammaDspot, Speed 47
## 2.2.7 DgammaDtime, Color 49
## 2.3 Vega Greeks 50
## 2.3.1 Vega 50
## 2.3.2 Vega Symmetry 55
## 2.3.3 Vega-Gamma Relationship 55
## 2.3.4 Vega from Delta 56
## 2.3.5 VegaP 56
## 2.3.6 Vega Leverage, Vega Elasticity 57
## 2.3.7 DvegaDvol, Vomma 57
## 2.3.8 DvommaDvol, Ultima 60
## 2.3.9 DvegaDtime 61
## 2.4 Variance Greeks 62
## 2.4.1 Variance Vega 62
## 2.4.2 DdeltaDvar 63
## 2.4.3 Variance Vomma 63
## 2.4.4 Variance Ultima 63
## 2.5 Volatility-Time Greeks 64
## 2.6 Theta Greeks 64
## 2.6.1 Theta 64
## 2.6.2 Theta Symmetry 68
## 2.7 Rho Greeks 68
## 2.7.1 Rho 68
## 2.7.2 Phi/Rho-2 71
2.7.3 Carry Rho 73CONTENTS
2.8 Probability Greeks
## 2.8.1 In-the-Money Probability
## 2.8.2 DzetaDvol
## 2.8.3 DzetaDtime
2.8.4 Risk-Neutral Probability Density
2.8.5 From in-the-Money Probability to Density
## 2.8.6 Probability of Ever Getting in-the-Money
2.9 Greeks Aggregations
## 2.9.1 Net Weighted Vega Exposure
ix
75
76
79
80
80
80
80
81
82
## 2.10 At-the-Money Forward Approximations 84
## 2.10.1 Approximation of the Black-Scholes-Merton
Formula 84
## 2.10.2 Delta 84
## 2.10.3 Gamma 84
## 2.10.4 Vega 84
## 2.10.5 Theta 84
## 2.10.6 Rho 85
## 2.10.7 Cost-of-Carry 85
## 2.11 Numerical Greeks 85
## 2.11.1 First-Order Greeks 85
## 2.11.2 Second-Order Greeks 86
## 2.11.3 Third-Order Greeks 86
## 2.11.4 Mixed Greeks 87
## 2.11.5 Third-Order Mixed Greeks 87
## 2.12 Greeks from Closed-Form Approximations 89
## 2.13 Appendix B: Taking Partial Derivatives 90
## 3 Analytical Formulas for American Options 97
## 3.1 The Barone-Adesi and Whaley Approximation 97
## 3.2 The Bjerksund and Stensland (1993) Approximation • 101
## 3.3 The Bjerksund and Stensland (2002) Approximation . 104
## 3.4 Put-Call Transformation American Options 109
## 3.5 American Perpetual Options 109
## 4 Exotic Options—Single Asset 111
## 4.1 Variable Purchase Options 111
## 4.2 Executive Stock Options 114
## 4.3 Moneyness Options 114
## 4.4 Power Contracts and Power Options 115
## 4.4.1 Power Contracts 115
## 4.4.2 Standard Power Option 116
## 4.4.3 Capped Power Option 117
## 4.4.4 Powered Option 118
## 4.5 Log Contracts 119
4.5.1 Log(S) Contract 120CONTENTS
## 4.5.2 Log Option 121
## 4.6 Forward Start Options 121
## 4.7 Fade-in Option 122
## 4.8 Ratchet Options 124
## 4.9 Reset Strike Options—Type 1 124
## 4.10 Reset Strike Options—Type 2 125
## 4.11 Time-Switch Options 127
## 4.12 Chooser Options 128
## 4.12.1 Simple Chooser Options 128
## 4.12.2 Complex Chooser Options 129
## 4.13 Options on Options 132
## 4.13.1 Put–Call Parity Compound Options 135
## 4.13.2 Compound Option Approximation 136
## 4.14 Options with Extendible Maturities 138
## 4.14.1 Options That Can Be Extended by the Holder 138
## 4.14.2 Writer-Extendible Options 140
## 4.15 Lookback Options 141
## 4.15.1 Floating-Strike Lookback Options 141
## 4.15.2 Fixed-Strike Lookback Options 143
## 4.15.3 Partial-Time Floating-Strike Lookback
Options 144
## 4.15.4 Partial-Time Fixed-Strike Lookback Options 147
## 4.15.5 Extreme-Spread Options 148
## 4.16 Mirror Options 150
## 4.17 Barrier Options 152
## 4.17.1 Standard Barrier Options 152
## 4.17.2 Standard American Barrier Options 154
## 4.17.3 Double-Barrier Options 156
## 4.17.4 Partial-Time Single-Asset Barrier Options 160
## 4.17.5 Look-Barrier Options 163
## 4.17.6 Discrete-Barrier Options 164
## 4.17.7 Soft-Barrier Options 165
## 4.17.8 Use of Put-Call Symmetry for Barrier Options 167
## 4.18 Barrier Option Symmetries 168
## 4.18.1 First-Then-Barrier Options 169
## 4.18.2 Double-Barrier Option Using
Barrier Symmetry 171
## 4.18.3 Dual Double-Barrier Options 172
## 4.19 Binary Options 174
## 4.19.1 Gap Options 174
## 4.19.2 Cash-or-Nothing Options 174
## 4.19.3 Asset-or-Nothing Options 175
## 4.19.4 Supershare Options 176
## 4.19.5 Binary Barrier Options 176
4.19.6 Double-Barrier Binary Options 180CONTENTS xi
## 4.19.7 Double-Barrier Binary Asymmetrical 181
## 4.20 Asian Options 182
## 4.20.1 Geometric Average-Rate Options 182
## 4.20.2 Arithmetic Average-Rate Options 186
## 4.20.3 Discrete Arithmetic Average-Rate Options 192
## 4.20.4 Equivalence of Floating-Strike and Fixed-Strike
Asian Options 199
## 4.20.5 Asian Options with Volatility Term-Structure . 199
## 5 Exotic Options on Two Assets 203
## 5.1 Relative Outperformance Options 203
## 5.2 Product Options 205
## 5.3 Two-Asset Correlation Options 205
## 5.4 Exchange-One-Asset-for-Another Options 206
## 5.5 American Exchange-One-Asset-for-Another Option 208
## 5.6 Exchange Options on Exchange Options 209
## 5.7 Options on the Maximum or the Minimum of
Two Risky Assets 211
## 5.8 Spread-Option Approximation 213
## 5.9 Two-Asset Barrier Options 215
## 5.10 Partial-Time Two-Asset Barrier Options 217
## 5.11 Margrabe Barrier Options 219
## 5.12 Discrete-Barrier Options 221
## 5.13 Two-Asset Cash-or-Nothing Options 221
## 5.14 Best or Worst Cash-or-Nothing Options 223
## 5.15 Options on the Minimum or Maximum of Two
Averages 224
## 5.16 Currency-Translated Options 226
## 5.16.1 Foreign Equity Options Struck in
Domestic Currency 226
## 5.16.2 Fixed Exchange Rate Foreign Equity Options 228
## 5.16.3 Equity Linked Foreign Exchange Options 230
## 5.16.4 Takeover Foreign Exchange Options 232
## 5.17 Greeks for Two-Asset Options 232
## 6 Black-Scholes-Merton Adjustments and Alternatives 233
## 6.1 The Black-Scholes-Merton Model with Delayed
Settlement 234
## 6.2 The Black-Scholes-Merton Model Adjusted for
Trading Day Volatility 235
## 6.3 Discrete Hedging 236
## 6.3.1 Hedging Error 236
## 6.3.2 Discrete-Time Option Valuation and
Delta Hedging 237
6.3.3 Discrete-Time Hedging with Transaction Cost . 238xii CONTENTS
## 6.4 Option Pricing in Trending Markets 240
## 6.5 Alternative Stochastic Processes 242
## 6.6 Constant Elasticity of Variance 242
## 6.7 Skewness-Kurtosis Models 244
## 6.7.1 Definition of Skewness and Kurtosis 244
## 6.7.2 The Skewness and Kurtosis for a Lognormal
Distribution 245
## 6.7.3 Jarrow and Rudd Skewness and Kurtosis Model 246
## 6.7.4 The Corrado and Su Skewness and
Kurtosis Model 247
## 6.7.5 Modified Corrado-Su Skewness-Kurtosis Model 250
## 6.7.6 Skewness-Kurtosis Put-Call Supersymmetry.. . 252
## 6.7.7 Skewness-Kurtosis Equivalent
Black-Scholes-Merton Volatility 252
## 6.7.8 Gram Charlier Density 252
## 6.7.9 Skewness-Kurtosis Trees 253
## 6.8 Pascal Distribution and Option Pricing 253
## 6.9 Jump-Diffusion Models 253
## 6.9.1 The Merton Jump-Diffusion Model 253
## 6.9.2 Bates Generalized Jump-Diffusion Model 255
## 6.10 Stochastic Volatility Models 258
## 6.10.1 Hull-White Uncorrelated Stochastic
Volatility Model 259
## 6.10.2 Hull-White Correlated Stochastic
Volatility Model 261
## 6.10.3 The SABR Model 265
## 6.11 Variance and Volatility Swaps 271
## 6.11.1 Variance Swaps 271
## 6.11.2 Volatility Swaps 274
## 6.12 More Information 278
## 7 Trees and Finite Difference Methods 279
## 7.1 Binomial Option Pricing 279
## 7.1.1 Cox-Ross-Rubinstein American Binomial Tree 284
## 7.1.2 Greeks in CRR Binomial Tree 287
## 7.1.3 Rendleman Bartter Binomial Tree 289
## 7.1.4 Leisen-Reimer Binomial Tree 290
## 7.1.5 Convertible Bonds in Binomial Trees 292
## 7.2 Binomial Model with Skewness and Kurtosis 297
## 7.3 Trinomial Trees 299
## 7.4 Exotic Options in Tree Models 303
## 7.4.1 Options on Options 303
## 7.4.2 Barrier Options Using Brownian Bridge
Probabilities 305CONTENTS
## 7.4.3 American Barrier Options in CRR
Binomial Tree
## 7.4.4 European Reset Options Binomial
## 7.4.5 American Asian Options in a Tree
xiii
307
308
314
## 7.5 Three-Dimensional Binomial Trees 315
## 7.6 Implied Tree Models 321
## 7.6.1 Implied Binomial Trees 321
## 7.6.2 Implied Trinomial Trees 327
## 7.7 Finite Difference Methods 334
## 7.7.1 Explicit Finite Difference 335
## 7.7.2 Implicit Finite Difference 338
## 7.7.3 Finite Difference in in(S) 340
## 7.7.4 The Crank-Nicolson Method 342
## 8 Monte Carlo Simulation 345
## 8.1 Standard Monte Carlo Simulation 345
## 8.1.1 Greeks in Monte Carlo 347
## 8.1.2 Monte Carlo for Callable Options 349
## 8.1.3 Two Assets 350
## 8.1.4 Three Assets 352
8.1.5 NAssets, Cholesky Decomposition 353
## 8.2 Monte Carlo of Mean Reversion 355
## 8.3 Generating Pseudo-Random Numbers 356
## 8.4 Variance Reduction Techniques 358
## 8.4.1 Antithetic Variance Reduction 358
8.4.2 IQ-MC/Importance Sampling 359
8.4.3 IQ-MC Two Correlated Assets 361
## 8.4.4 Quasi-Random Monte Carlo 362
## 8.5 American Option Monte Carlo 364
## 9 Options on Stocks That Pay Discrete Dividends 367
## 9.1 European Options on Stock with Discrete Cash
Dividend 368
## 9.1.1 The Escrowed Dividend Model 368
## 9.1.2 Simple Volatility Adjustment 369
## 9.1.3 Haug-Haug Volatility Adjustment 369
## 9.1.4 Bos-Gairat-Shepeleva Volatility Adjustment 370
## 9.1.5 Bos-Vandermark 371
## 9.2 Non-Recombining Tree 372
## 9.3 Black's Method for Calls on Stocks with Known
Dividends 375
## 9.4 The Roll, Geske, and Whaley Model 375
## 9.5 Benchmark Model for Discrete Cash Dividend 378
9.5.1 A Single Dividend 378
9.5.2 Multiple Dividends 382xiv CONTENTS
## 9.5.3 Applications 382
## 9.6 Options on Stocks with Discrete Dividend Yield 390
## 9.6.1 European with Discrete Dividend Yield 390
## 9.6.2 Closed-Form American Call 390
## 9.6.3 Recombining Tree Model 393
## 10 Commodity and Energy Options 397
## 10.1 Energy Swaps/Forwards 397
## 10.2 Energy Options 400
## 10.2.1 Options on Forwards, Black-76F 400
## 10.2.2 Energy Swaptions 401
## 10.2.3 Hybrid Payoff Energy Swaptions 405
## 10.3 The Miltersen-Schwartz Model 406
## 10.4 Mean Reversion Model 410
## 10.5 Seasonality 411
## 11 Interest Rate Derivatives 413
11.1 FRAs and Money Market Instruments 413
11.1.1 FRAs From Cash Deposits 413
## 11.1.2 The Relationship between FRAs and
Currency Forwards 414
## 11.1.3 Convexity Adjustment Money Market Futures. 415
## 11.2 Simple Bond Mathematics 417
## 11.2.1 Dirty and Clean Bond Price 417
## 11.2.2 Current Yield 417
## 11.2.3 Modified Duration and BPV 417
## 11.2.4 Bond Price and Yield Relationship 418
## 11.2.5 Price and Yield Relationship for a Bond 418
## 11.2.6 From Bond Price to Yield 419
## 11.3 Pricing Interest Rate Options Using Black-76 419
## 11.3.1 Options on Money Market Futures 420
## 11.3.2 Price and Yield Volatility in Money
Market Futures 421
## 11.3.3 Caps and Floors 421
## 11.3.4 Swaptions 422
## 11.3.5 Swaption Volatilities from Caps or FRA
Volatilities 424
## 11.3.6 Swaptions with Stochastic Volatility 425
## 11.3.7 Convexity Adjustments 425
## 11.3.8 European Short-Term Bond Options 427
## 11.3.9 From Price to Yield Volatility in Bonds 428
## 11.3.10 The Schaefer and Schwartz Model 428
## 11.4 One-Factor Term Structure Models 429
## 11.4.1 The Rendleman and Bartter Model 429
11.4.2 The Vasicek Model 430CONTENTS XV
## 11.4.3 The Ho and Lee Model 432
## 11.4.4 The Hull and White Model 433
## 11.4.5 The Black-Derman-Toy Model 434
## 12 Volatility and Correlation 445
## 12.1 Historical Volatility 445
## 12.1.1 Historical Volatility from Close Prices 445
## 12.1.2 High-Low Volatility 447
## 12.1.3 High-Low-Close Volatility 448
## 12.1.4 Exponential Weighted Historical Volatility 449
## 12.1.5 From Annual Volatility to Daily Volatility 450
## 12.1.6 Confidence Intervals for the Volatility Estimate 451
## 12.1.7 Volatility Cones 452
## 12.2 Implied Volatility 453
## 12.2.1 The Newton-Raphson Method 453
## 12.2.2 The Bisection Method 455
## 12.2.3 Implied Volatility Approximations 456
## 12.2.4 Implied Forward Volatility 458
## 12.2.5 From Implied Volatility Surface to Local
Volatility Surface 458
## 12.3 Confidence Interval for the Asset Price 459
## 12.4 Basket Volatility 460
## 12.5 Historical Correlation 460
## 12.5.1 Distribution of Historical Correlation Coefficient 461
## 12.6 Implied Correlations 462
## 12.6.1 Implied Correlation from Currency Options. . . 462
## 12.6.2 Average Implied Index Correlation 462
## 12.7 Various Formulas 463
## 12.7.1 Probability of High or Low,
the Arctangent Rule 463
## 12.7.2 Siegel's Paradox and Volatility Ratio Effect . . . 464
## 13 Distributions 465
## 13.1 The Cumulative Normal Distribution Function 465
## 13.1.1 The Hart Algorithm 465
## 13.1.2 Polynomial Approximations 467
## 13.2 The Inverse Cumulative Normal Distribution
Function 469
## 13.3 The Bivariate Normal Density Function 470
## 13.3.1 The Cumulative Bivariate Normal
Distribution Function 470
## 13.4 The Trivariate Cumulative Normal Distribution
Function 482xvi CONTENTS
## 14 Some Useful Formulas 487
## 14.1 Interpolation 487
## 14.1.1 Linear Interpolation 487
## 14.1.2 Log-Linear Interpolation 487
## 14.1.3 Exponential Interpolation 487
## 14.1.4 Cubic Interpolation: Lagrange's Formula 488
## 14.1.5 Cubic-Spline Interpolation 488
## 14.1.6 Two-Dimensional Interpolation 490
## 14.2 Interest Rates 491
## 14.2.1 Future Value of Annuity 491
## 14.2.2 Net Present Value of Annuity 491
## 14.2.3 Continuous Compounding 491
## 14.2.4 Compounding Frequency 491
## 14.2.5 Zero-Coupon Rates from
Par Bonds/Par Swaps 492
## 14.3 Risk-Reward Measures 493
## 14.3.1 Treynor's Measure 493
## 14.3.2 Sharpe Ratio 494
## 14.3.3 Confidence Ratio 494
## 14.3.4 Sortino Ratio 495
## 14.3.5 Burke Ratio 495
## 14.3.6 Return on VaR 495
## 14.3.7 Jensen's Measure 496
## 14.4 Appendix C: Basic Useful Information 496
The Option Pricing Software 497
Bibliography 499
Index 521INTRODUCTION
Some people collect stamps; others collect coins, matchboxes, but-
terflies, or cars. I collect option pricing formulas. The book you have
before you is a copy of this collection. As opposed to cars, one can easily
share a collection of option pricing formulas with others. A collection
like this would naturally not have been possible if it weren't for all
the excellent researchers both in academia and in the industry who
willingly share their knowledge in various publications.
Persons who collect stamps usually arrange their stamps under
some kind of system—their issue year, what country they come from,
and so on. I have organized my collection of option pricing formulas in
a similar fashion. Each formula is given a reference and the year when
it was first published. 1 With a few exceptions, I have also included
a numerical example or a table with values for each option pricing
formula. This should make it easier to understand the various option
pricing models, as well as be of value to anyone who wants to check
his or her computer implementation of an option pricing formula.
To better illustrate the use and implementation of option pricing
formulas, I have included examples of programming codes for sev-
eral of them. Programming codes for most of the formulas, together
with ready-to-use spreadsheets, are included on the accompanying
CD. Most of the formulas implemented also contains 3-D charts to
illustrate the value or the various risk parameters of the option. By
using this computer code in combination with the book, you should
no longer view options pricing as a black box. The book differs from
other texts on options pricing in the way I have tried to cut accompa-
nying text to the bone. Text is included to illuminate the essence of
implementing and applying the option pricing formulas. This should
make it easy and efficient to find the formula you need, whether it is
to close a multimillion-dollar options contract (without being ripped
1To the best given by my knowledge, that naturally is incomplete.
xviixviii INTRODUCTION
off) or to see if someone has already solved your problem of finding
the value of some exotic options.
This collection of option pricing formulas is not intended as a
textbook in option pricing theory but rather as a reference book for
those who are already familiar with basic finance theory. However,
if you think that a collection of option pricing formulas is useful
only to theoreticians, you are wrong. The collection does not contain
lengthy deductions of option pricing formulas 2 but rather the essence
of options pricing. Most of these formulas are used daily by some of the
best talent on Wall Street and by traders in financial centers world-
wide. The collection of option pricing formulas is an ideal supplement
for quants, quant traders, financial engineers, students taking courses
in option pricing theory, or anyone else working with financial options.
The collection came out of my many years of work in option trading
and derivatives research at the Den norske Bank, Chemical Bank,
Tempus Financial Engineering, Paloma Partners, Amaranth Advisors,
and J.P. Morgan Chase. Over many years, I collected everything I
came across on the valuation of options. My collection of articles and
books on the subject has increased every year. In order to see the
large picture of the various option pricing models, as well as to avoid
carrying around a heap of books and papers, I decided to compile the
most central option pricing formulas into a book: The Complete Guide
to Option Pricing Formulas.
Few, if any, financial markets have seen such explosive growth
and new developments as the options markets. Continuously, new
products are under development. With a few exceptions, I have chosen
to collect option pricing models that can be used by practitioners. In a
collection of formulas such as this, errors are particularly destructive.
A great deal of effort has been put into minimizing typing errors. I
hope that readers who find any remaining errors will call them to my
attention so that they may be purged from any future editions. You
can find my e-mail at www.espenhaug.com .
A table of all the option pricing formulas is included following the
table of contents, giving an overview for easy reference. The table gives
a short description of the key characteristics of all the option pricing
formulas included in this book. If you are working with an option
pricing problem, this table should be a natural starting point. Defini-
tions of symbols are naturally important in a collection such as this. I
have tried to define symbols in accordance with the modern literature.
Currently, use of symbols in the theory of options pricing is far from
standardized. Following the Option Pricing Overview is a Glossary of
Notations, which you will find useful when using this collection.
2All material contains references to the originators, in case you wish to have all the
details.ACKNOWLEDGMENTS
Several individuals have helped improve the quality and complete-
ness of the book. I appreciate the discussions, suggestions, and help
contributed by Alexander Adamchuk, Ferdinando Ametrano, Grant
Armstrong, Rainer Baule, Hans-Peter Bermin, Petter Bjerksund,
Jeremy Bradley, Aaron Brown, Christine Brown, Don Chance, Tony
Corso, Daniel Duffy, Christopher W. Edge, Steinar Ekern, Stein Eric
Fleten, Stein Frydenberg, Teniel Gordon, Jorgen Haug, Alex Huang,
Cho H. Hui, P. Kearney, Marisa Khan, Simon Launonen, Morten
Lindeman, Lisa Majmin, Kristian Miltersen, Maurizio Mondello,
Hicharn Mouline, Michael Ross, Fabrice Douglas Rouah, Gunnar
Stensland, Erik Stettler, Svein Stokke, Robert Thoren, Jurgen Topper,
Igor Tsatskis, Dan Tudball, Thijs van den Berg, Nico van der Wijst,
Tobias Voigt, Sjur Westgaard, Zvi Wiener, W2, Yuxing Yan—as well as,
all the great people at the Wilmott forum.
A special thanks to some of the people who gave me considerable
inputs to the second edition: David Bates, Jorgen Haug, Alireza Java-
hen, Alan Lewis, William Margrabe, Silvian Mayer, Paul Wilmott,
and Graeme West. I also had some fruitful discussions and received
inspiration from the masters Bruno Dupire, Emanuel Derman, Nepse
Guah, Nassim Taleb, and Peter Carr.
I would also like to thank some of the people in the derivatives
industry with whom I worked closely together since the first edition
and who kept inspiring me in my trading as well as my academic work,
the original golden boys team at Paloma Partners Lauren Rose, Dr.
Wu, Todor Delev, Stan Metelits (the Wizard), Patrick Morris Suzuki,
and Tom Ku, Robert Jones and Nicolas Maounis. In J.P. Morgan, New
York, I have been lucky to work as a trader in one of the most success-
ful proprietary trading groups that at its last peak was best known
as the dream team: Alex Gurevich, Ali Feroze, Andy Fell, Boutros
Klink, Dean Williams, Even Berntsen, Gabriel Sod-Hoffs, Gregg Parr,
John Stevenson, Joseph Choi, Lucky Sunder, Richard Tchenberdjian,
xixXX ACKNOWLEDGMENTS
Nanette Yang, Vinay Pande, and Vee Lung Phan. I would also like to
thank all the people I have forgotten to thank.
It has been a pleasure to work with the people at McGraw-Hill. In
particular, I'm grateful for many helpful suggestions and assistance
from Stephen Isaacs and Kevin Thornton.
Enjoy the world of option formulas and option trading; must the
most powerful formulas be on your side in good and bad times!
Espen Gaarder HaugWHAT IS NEW IN THE SECOND EDITION?
Ifyou already have the first edition, you probably wonder what is new
in the second edition. Even before the first edition was published, I
started working on the second edition. First, my plan was to make a
few improvements and add a couple of formulas. But over the years
the number of new formulas and improvements just took off. As you
will see, the second edition contains more than double the amount of
information and formulas as the first edition. In fact, writing the sec-
ond edition involved more work than writing the first edition itself. In
particular, the second edition contains much more coverage on option
Greeks (option sensitivities), while the first edition just touched upon
this topic, as have most other option textbooks. You'll find the sec-
ond edition goes far beyond anything you have seen published on this
topic. The number of new exotic options and derivatives that I have
added to the second edition is astonishing. Just to mention a few:
power options, powered options, log options, reset options, Margrabe
barrier options, double barrier binary options, and dual double bar-
rier options. The book also contains descriptions and implementations
of stochastic volatility models, variance and volatility swaps, general-
ized jump diffusion models, and skewness and kurtosis models, among
other nonstandard models and products.
With regard to numerical methods, I have added a lot of informa-
tion in how to use tree models—for example, to value a lot of different
complex exotic options. The second edition also covers finite differ-
ence methods and Monte Carlo simulation. The second edition also
contains many new formulas and implementations for calculating
volatility and risk parameters.
The accompanying CD-ROM contains much, much more than that
provided with the first edition. In this version you can calculate almost
any Greek for almost any option, as well as graph the value or the
xxixxii WHAT IS NEW IN THE SECOND EDITION?
various option sensitivities in 3-D surface charts. It also contains
sophisticated stochastic volatility models, as well as advanced Monte
Carlo methods.OPTIONS PRICING FORMULAS OVERVIEW
Politics is for the present, but an equation is for eternity.
Albert Einstein
The table on the next few pages offers an overview of the options
pricing formulas presented in this book. For easy reference, each for-
mula in the table is accompanied by a set of letters signifying key
characteristics.
Type of formula: Type of underlying asset:
C: Closed-form solution. S: Stock.
P: Closed-form
approximation.
I: Stock/index paying a
dividend yield.
N: Numerical method. F: Futures or forward contract.
E: European option. C: Currency.
A: American option. R: Interest rate or debt.
In the column "Computer code," a bullet (.) indicates that computer
code for the formula is included in the book or on the accompanying
CD-ROM.Option Pricing
Formula
Type of
Formula
Type of
Underlying Asset
Distribution of
Underlying Asset
Computer
Code
Short Description
Black—Scholes—Merton: Chapter 1
Black—Scholes (1973) C, E S Lognormal • The breakthrough in option pricing.
Merton (1973) C, E S, 1 Lognormal • Extension of Black—Scholes formula
including a dividend yield.
Black (1976) C, E F Lognormal • Modified Black—Scholes for options on
forward or futures.
Asay (1982) C, E F Lognormal • Modified Black-76 for options that are fully
margined.
Garman and
Kohlhagen (1983) and
C, E C Lognormal • Modified Black—Scholes for options on
currencies.
Grabbe (1983)
Generalized
Black—Scholes and
C, E S, I, F, C Lognormal • Combines all the models above into one
formula.
Merton
Black—Scholes—
Merton on variance
form
C, E S, I, F, C Lognormal • Use variance as input instead of standard
deviation.
Bachelier (1900) C, E S Normal • The first breakthrough in option valuation.
Sprenkle (1964) C, E S Lognormal • Precursor to Black—Scholes—Merton.
Boness (1964) C, E S Lognormal • Precursor to Black—Scholes—Merton.
Samuelson (1965) C, E S Lognormal • Precursor to Black—Scholes—Merton, takes
into account that the expected return for
call option is greater than for stock.
AI3 JA 113A0 S V7I 1M10,1 DNIDMIcl SNOLLc10S, I, F, C
S, I
S, I, F, C
S, I, F, C
S, I, F, C
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
S, I, F, C Lognormal
S, I, F, C Lognormal
S, I, F, C Lognormal
S, I, F, C Lognormal
Analytical Approximations for American Options: Chapter 3
OPTIONS PRICING FORMULA S OVE RVIEW
Barone-Adesi and P, A
Whaley (1987)
Bjerksund and P, A
Stensland (1993)
Bjerksund and P, A
Stensland (2002)
American Perpetual C, A
Exotic Options—Single Asset: Chapter 4
Variable Purchase C, E
Options
Executive stock option C, E
Moneyness option C, E
Power contract C, E
Standard power option C, E
(Asymmetric power
option)
Capped power option C, E
(Capped asymmetric
option)
Powered option C, E
(Symmetric power
option)
Log contract C, E
Log option C, E
Approximation much used in practice.
Extremely computer efficient.
Accurate and efficient.
Infinite time to maturity.
Number of underlying shares deterministic
function of the asset price.
Take into account the probability that the
executive will stay with the firm until the
option expires.
Premium in percent of forward, strike in
percentage in- or out-of-the money.
Contract where payoff is powered.
Option where asset is powered, gives high
leverage.
Option where asset is powered, but
maximum payoff is capped.
Option where payoff is powered, gives high
leverage.
Contract where payoff is natural logarithm of
asset. Building block in var and vol swaps.
Option where payoff is natural logarithm of
asset.
S, I, F, C Lognormal
S, I, F, C Lognormal
S, I, F, C Lognormal
S, I, F, C Lognormal
(continued)Option Pricing
Formula
Type of Type of Distribution of Computer Short Description
Formula Underlying Asset Underlying Asset Code
C, E
C, E
C, E
C, E
Ratchet option (Cliquet
option)
Reset strike option
Forward start option
Fade-in option
C, E
C, E
C, E
C, E
C, E
Options on options
(compound options)
Buyer-extendible option
Writer-extendible
option
Floating strike lookback
option (no-regrets
option)
Fixed strike lookback
option (hindsight
option)
Option on a plain vanilla option: call on call,
call on put, put on call, and put on put.
S, I, F, C Lognormal Option that can be extended by the option
holder.
S, I, F, C Lognormal • Option that will be extended by the writer if
the option is out-of-the-money.
S, I, F, C Lognormal • Options to sell at maximum or buy at
minimum observed price.
S, I, F, C Lognormal • Strike is reset to the asset price at a
predetermined future time.
S, I, F, C Lognormal • Accumulates cash for every time unit the
option is in-the-money.
S, I, F, C Lognormal • Gives the right to choose between a call and
put option.
S, I, F, C Lognormal • Offers more flexibility than a simple chooser
option.
S, I, F, C Lognormal •
Discrete time-switch C, E
option
Simple chooser option C, E
(as-you-like-it option)
Complex chooser option C, E
S, I, F, C Lognormal • Starts at-the-money or proportionally in- or
out-of-the-money after a known elapsed
time into the future.
S, I, F, C Lognormal • Payoff weighted by how many fixings the
asset inside a predefined range.
S, I, F, C Lognormal A series of forward starting options.
S, I, C Lognormal • An observed maximum or minimum asset
price against a fixed strike.
OPTIONS PRICING FORMULAS OVERVI EWSame as floating strike lookback except
lookback monitoring only in parts of the
option's lifetime.
Same as fixed strike lookback except
lookback monitoring only in parts of the
option's lifetime.
Option on the difference between the
observed maximum or minimum from two
different time periods.
Options where holder can choose to mirror
the path of the underlying asset.
Options where existence is dependent
whenever the asset price hits a barrier level
before expiration.
Same as above, but American style.
Options with two barriers, one above and one
below the current asset price.
Barrier hits are only monitored in a part of
the options' lifetime.
Adjustment that can be used for pricing
barrier options with discrete barrier
monitoring.
Combination of a partial time barrier option
and a forward start fixed strike lookback
option.
The option has a barrier range and is
knocked in or out partially.
Dependent on lower and upper barrier.
OPTIONS PRICING FORM ULAS OVER VIEW
Partial-time floating
strike lookback option
C, E S, I, C Lognormal
Partial-time fixed strike
lookback option
C, E S, I, C Lognormal
Extreme spread option C, E S, I, C Lognormal
Mirror option C, E S, I, F, C Lognormal
Standard barrier option
(inside barrier option)
C, E S, I, F, C Lognormal
American barrier option C, A S, I, F, C Lognormal
Double barrier option C, E S, I, F, C Lognormal
Partial-time
single-asset barrier
option
C, E S, I, F, C Lognormal
Discrete barrier option C, E S, I, F, C Lognormal
Look-barrier option C, E S, I, C Lognormal
Soft-barrier option C, E S, I, C Lognormal
First-then-barrier
options
C, A F Lognormal
(continued)Option Pricing Type of Type of Distribution of Computer Short Description
Formula Formula Underlying Asset Underlying Asset Code
Double barrier option C, E
using symmetry
Dual double barrier C, E
option using symmetry
Gap option (pay-later C, E
option)
Cash-or-nothing option C, E
Asset-or-nothing option C, E
Supershare option C, E
Binary barrier options C, E
(digital option)
Double Barrier Binary C, E
Options
Geometric average option C, E
(Asian option)
Arithmetic average P, A
option (Asian option)
Exotic Options on Two Assets: Chapter 5
Relative outperformance
option
Product option
Two-asset correlation
option
Options with two barriers, one above and
one below the current asset price.
Gives call if hitting upper barrier, and put
if lower barrier or vice versa.
One strike decides if the option is in or
out-of-the-money; another strike decides
the size of the payoff.
Pays out cash if in-the-money and zero if
out-of-the-money.
Pays out asset if in-the-money; otherwise
pays zero.
Pays out (Asset/Low strike) if the asset
falls between a lower and higher strike.
Can price 28 different binary barrier
options.
Binary option with two barriers, one above
and one below the current asset price.
Option on a geometric average: (xi • • • X)1 /n •
Options on an arithmetic average:
+ • • • + An )/ n.
Option on the relative performance of two
assets.
Option on the product of two assets.
One asset decides if the option is in or
out-of-the-money. Another asset with its
own strike decides the payoff.
S, I, F, C
S, I, F, C
S, I, F, C
S, I, F, C
S, I, F, C
S, I, F, C
S, I, F, C
S, I, F, C
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
C, E S, I, F, C
C, E S, I, F, C
C, E S, I, F, C
Atammano SV71 111 110,Y DNIDIMI SNOL MOOPTIONS PRICING FORMULAS OVERVIEW
Exchange one asset for C, E, A S, I, F, C Lognormal Option to exchange one asset for another.
another option
Exchange option on C, E S, I, F, C Lognormal Can be used to value sequential exchange
exchange option opportunities.
Option on the maximum C, E S, I, F, C Lognormal Call or put options on the maximum or
or minimum of two minimum of two assets.
assets
Spread option P, E S, I, F, C Lognormal Option on the difference between two assets.
Two-asset barrier option C, E S, I, F, C Lognormal One asset decides barrier hits; the other
(outside barrier option) asset decides payoff.
Partial-time two-asset C, E S, I, F, C Lognormal Barrier hits are only monitored in a part of
barrier option the option's lifetime.
Margrabe barrier option C, E S, I, F, C Lognormal Barrier option on ratio of two assets.
Two-asset C, E S, I, F, C Lognormal Two assets and two strikes decide if the
cash-or-nothing option option pays out a cash amount or nothing.
Best or worst C, E S, I, F, C Lognormal Pays predefined cash amount depending on
cash-or-nothing option two asset.
Option on the minimum C, E S, I, F, C Lognormal Max-mM option, but on two averages.
and maximum of two
averages
Foreign equity option C, E S and C Lognormal Options on foreign equity in domestic
stuck in domestic currency.
currency
Fixed exchange rate C, E S and C Lognormal • Foreign equity option with fixed exchange
foreign equity option rate.
(Quantos)
Equity linked foreign C, E S and C Lognormal • FX option where quantity depends on foreign
exchange option equity price.
Takeover foreign C, E S and C Lognormal • FX option that only can be exercised if
exchange option takeover is successful.
(continued) MC, E S, I, F, C
C, E S, I, F, C
C, E S, I, F, C
C, E S, I, F, C
C, E S, I, F, C
P, E
P, E
P, E
P, E
C, E
C, E
P, E
P, E
Option Pricing
Formula
Type of Type of Distribution of Computer Short Description
Formula Underlying Asset Underlying Asset Code
•
Chapter 6
Settlement adjusted
BSD
French (1984) trading
day adjusted
Wilmott (2000)
discrete hedging
Leland (1985)
transaction costs
Lo and Wang (1995)
trending markets
Hagan and Woodward
(1999) (Cox and Ross
(1976)) CEV
Jarrow and Rudd
(1982) skewness and
kurtosis
Corrado and Su (1996)
skewness and
kurtosis
Ray (1993) Pascal
distribution
Merton (1976) Jump
Diffusion
Bates (1991) Jump
Diffusion
Hull and White (1987)
stochastic volatility
Hull and White (1988)
stochastic volatility
Lognormal
Lognormal
Lognormal
Lognormal
Lognormal
Constant elasticity
of variance
Various
Non-specified
Various
Non-specified
Pascal
Jump diffusionl
Jump diffusion'
Stochastic
volatility
Stochastic
volatility
Black—Scholes adjusted for non-instant
settlement.
Black—Scholes adjusted for trading day
volatility.
Black—Scholes adjusted for discrete
hedging.
Black—Scholes adjusted for hedging with
transaction cost.
Black—Scholes adjusted for trending
markets.
Black—Scholes adjusted for constant
elasticity of variance.
Black—Scholes adjusted for skewness and
kurtosis.
Black—Scholes adjusted for skewness and
kurtosis.
Black—Scholes type model b ut with Pascal
distribution.
First jump-diffusion process model.
Generalized jump-diffusion model.
Stochastic volatility model based on
Taylor series.
Stochastic volatility model based on
Taylor series.
OPTIONS PRICING FORMULAS OVERVIEWOPTIONS PRICING FORMULA S OVE RVIEW
SABR model P, E
stochastic volatility
Variance swap
Volatility swap
Trees and Finite Difference Methods: Chapter 7
Binomial trees N, E, and A S, I, F, C
Barrier option in
binomial trees
Convertible bonds in
binomial trees
Trinomial trees
Three-dimensional
binomial trees
Implied binomial trees
Implied trinomial N, E, and A S, I, F, C
trees
Explicit finite N, E, and A S, I, F, C
difference
Implicit finite N, E, and A S, I, F, C
difference
Crank-Nicholson N, E, and A S, I, F, C
method
Stochastic Practical and promising stochastic
volatility volatility model.
Stochastic Variance swap based on static hedging.
volatility
Garch(1,1) Volatility swap based on Garch(1,1) model.
Lognormal Can be used to value most types of single
asset options.
Lognormal A "standard" binomial tree where the
number of time steps is adjusted so the
barrier falls on the nodes.
Lognormal Stock Convertible bond valuation with variable
credit adjusted discount rate.
Lognormal More computer efficient and gives better
flexibility than binomial trees.
Lognormal • Can be used for valuation of most options
on two correlated assets
Implied Especially useful for valuation of exotic
distribution from options consistent with more liquid plain
market data vanilla European options.
Implied • Offers more flexibility than implied
distribution from binomial trees.
market data
Lognormal • Can be used to value most types of single
asset options.
Lognormal • Can be used to value most types of single
asset options.
Lognormal • Can be used to value most types of single
asset options.
N, E, and A S, I, F, C
N, E, and A Stock and bond
N, E, and A S, I, F, C
N, E, and A S, I, F, C
N, E, and A S, I, F, C
(continued)N, E S, I, F, C, R Dependent on the
simulated process
S, I, F, C, R Dependent on the
simulated process
S, I, F', C, R Dependent on the
simulated process
S, I, F, C, R Dependent on the
simulated process
S, I, F, C, R Dependent on the
simulated process
N, E
N, E
N, E
N, E, A
Options on Stocks that Pay Discrete Dividends: Chapter 9
C, E Lognormal
C, E Lognormal
C, E Lognormal
OPTIONS PRICING FORM ULAS OVERVI EW
Standard Monte Carlo
simulation
Antithetic Monte Carlo
simulation
IQMC (Importance
sampling)
Quasi Random Monte
Carlo simulation
American Monte Carlo
simulation
Simple vol adjustment
Chriss (1997)
Haug and Haug (1998)
Beneder and Vorst
(2001) volatility
adjustment.
Bos, Gairat, and
Shepeleva (2003)
volatility adjustment.
• Very flexible but relatively slow in
computer time.
• Very flexible and more accurate than
standard MC.
• Very flexible and much faster than
standard MC.
• Very flexible and much faster than
standard MC.
Can be used for American options, but
very slow in computer time.
The model is flawed and leads to arbitrage
opportunities.
The approximation is good for most cases,
but can be inaccurate in some cases.
The approximation is good for most cases,
but can be inaccurate in some cases.
Option Pricing Type of Type of Distribution of Computer Short Description
Formula Formula Underlying Asset Underlying Asset Code
Monte Carlo Simulation: Chapter 8The approximation is one of the best but
can be inaccurate in some special cases.
The model is flawed and leads to arbitrage
opportunities.
Robust and accurate but slow and
theoretically not very sound.
Robust and accurate and theoretically
sound; should be benchmark model.
Closed form, computer efficient, and
theoretically sound.
Robust and accurate, computer efficient,
and theoretically sound.
Black-76 adjusted for options on forwards
expiring after the option.
Black-76 adjusted for options on
commodity/energy swaps.
Three-factor model with stochastic term
structures of convenience yields and
forward interest rates.
Seasonality adjustment that can be
applied to Monte Carlo.
OPTIONS PRICING FORMULAS OVERVI EW
Bos and Vandermark C, E Lognormal •
(2002) volatility
adjustment.
Roll—Geske—Whaley C, A "Lognormal" •
American call
Non-recombining tree N, E, A Lognormal •
Haug, Haug, and Lewis C, E, A Various
(2003)
Villiger (2005) discrete C, E
dividend yield
Lognormal •
Recombining tree N, E, A
discrete dividend yield
Lognormal
Commodity and Energy Options: Chapter 10
Black-1976F adjusted C, E Forward Lognormal
Energy swaption C, E Swap(Forward) Lognormal
Miltersen and Schwartz C, E Forward Lognormal'
(1998) commodity
option model.
Pilipovie (1997) N, E, and A
seasonal
S, I, C, F AnyOption Pricing
Formula
Type of
Formula
Type of
Underlying Asset
Distribution of
Underlying Asset
Computer
Code
Short Description
Interest Rate Derivatives: Chapter 11
Black-76 for options
on money market
futures
C, E Implied forward rates Lognormal forward
rates
• Value call on futures as put on implied
yield and vice versa.
Black-76 cap and floor
model
C, E Implied forward rates Lognormal forward
rates
A whole series of options on implied
forward rates.
Modified Black-76
swaption model
C, E Swap rate Lognormal swap
rate
• Options on interest-rate swaps: payer
and receiver swaptions.
Black-76 for options
on bonds
C, E Forward price of bond Lognormal bond
forward price
• Often used when time to maturity on
the option is short relative to the time
to maturity on the underlying bond.
Schaefer and
Schwartz (1987)
adjusted
C, E Bond price Lognormal Allows the price volatility of the bond
to be a function of the bond duration.
Black—Scholes model
Rendleman and
Barter (1980)
N, E, and A Lognormal interest
rate
No arbitrage-free equilibrium model.
Vasicek (1977) C, E, N, A Normal interest
rate mean
reversion
• No arbitrage-free equilibrium model.
Ho and Lee (1986) C, E, N, A Normal interest
rate
Arbitrage-free with respect to
underlying zero coupon rates.
Hull and White (1990) C, E, N, A Normal interest
rate mean
reversion
Arbitrage-free with respect to
underlying zero coupon rates.
Black, Derman, and
Toy (1990)
N, E, and A Lognormal interest
rate
• Arbitrage-free with respect to
underlying zero coupon rates.
iLognormal futures price and normal distributed convenience yields and interest rates.
A4glAllgA0 SV rII1N 1Og DNIDIUd SNOLLd0GLOSSARY OF NOTATIONS
The following list is in alphabetical order, ending with non-Latin
symbols.
A Accumulated amount in time-switch options.
Cost of carry rate (i.e., the cost of interest plus any
additional costs). In every formula, it is continuously
compounded.
BSM Generalized Black-Scholes-Merton formula des-
cribed in Chapter 1.
Price of European call option.
Price of American call option.
CBSM Call option value using the generalized Black-
Scholes-Merton formula.
CEV Constant elasticity of variance model.
CRR Cox-Ross-Rubinstein binomial tree described in
Chapter 7.
The size of the downward movement of the underly-
ing asset in a binomial or trinomial tree.
Cash dividend.
Spot exchange rate of a currency.
Derivatives value, for example, an option.
Forward price or futures price.
GBM Geometric Brownian motion.
Barrier (only used for barrier options).
Predetermined cash payoff.
Lower barrier in a barrier option.
M (a , b; p) The cumulative bivariate normal distribution func-
tion described in Chapter 13.
Number of time steps in lattice or tree model.xxxvi GLOSSARY OF NOTATIONS
n (x) The standardized normal density function described
in Chapter 13.
N (x) The cumulative normal distribution function des-
cribed in Chapter 13.
PBSM Put option value using the generalized Black-
Scholes-Merton formula.
Price of European put option. Up probability in tree
or lattice models.
Price of American put option, also used as bond price.
PDE Partial differential equation.
Instantaneous proportional dividend yield rate of
the underlying asset. Down probability in implied
trinomial tree.
Fixed quantity of asset.
Risk-free interest rate. In general, this is a contin-
uously compounded rate. An exception is the Black-
Derman—Toy model in Chapter 11 and some of
the formulas in the section on interest rates in
Chapter 11.
f Foreign risk-free interest rate.
Price of underlying asset.
Time to expiration of an option or other derivative
security in number of years.
The size of the up movement of the underlying asset
in a binomial or trinomial tree.
Upper barrier in barrier option.
Value of European option.
Value of American option.
X Strike price of option.
Bond or swap yield.
Percentage of the total volatility explained by the
jump in the jump-diffusion model.
Gamma of option.
## 5 Discrete dividend yield.
Delta of option.
t Size of time step in a tree model.
Mean reversion level.
## 0 Theta of option.
IC Speed of mean reversion ("gravity").
Arrow-Debreu prices in the implied tree model.
Expected number of jumps per year in the jump-
diffusion model.GLOSSARY OF NOTATIONS XXXVil
A Elasticity of a plain vanilla European option (options
sensitivity in percent with respect to a percent move-
ment in the underlying asset).
P Drift of underlying asset (also used in other contexts).
4. Volatility of volatility in most stochastic volatility
models.
## 7 The constant Pi ,'--,' 3.14159265359.
p Correlation coefficient.
a Volatility of the relative price change of the underly-
ing asset.
4) Phi of option.CHAPTER
1
6 BLACK-SCHOLES-MERTON
Everything that can be counted does not necessarily count;
everything that counts cannot necessarily be counted.
Albert Einstein
The first part of this chapter covers the Black-Scholes-Merton (BSM)
formula and its close relatives. The last part offers a quick look at
some of the most important precursors to the BSM model.
The BSM formula and its binomial counterpart may easily be the
most used "probability model/tool" in everyday use — even if we con-
sider all other scientific disciplines. Literally tens of thousands of
people, including traders, market makers, and salespeople, use option
formulas several times a day. Hardly any other area has seen such
dramatic growth as the options and derivatives businesses. In this
chapter we look at the various versions of the basic option formula.
In 1997 Myron Scholes and Robert Merton were awarded the Nobel
Prize (The Bank of Sweden Prize in Economic Sciences in Memory
of Alfred Nobel). Unfortunately, Fischer Black died of cancer in 1995
before he also would have received the prize.
It is worth mentioning that it was not the option formula itself
that Myron Scholes and Robert Merton were awarded the Nobel Prize
for, the formula was actually already invented, but rather for the
way they derived it — the replicating portfolio argument, continuous-
time dynamic delta hedging, as well as making the formula consistent
with the capital asset pricing model (CAPM). The continuous dynamic
replication argument is unfortunately far from robust. The popularity
among traders for using option formulas heavily relies on hedging
options with options and on the top of this dynamic delta hedging, see
Higgins (1902), Nelson (1904), Mello and Neuhaus (1998), Derman
and Taleb (2005), as well as Haug (2006) for more details on this
topic. In any case, this book is about option formulas and not so much
about how to derive them.
12 CHAPTER 1. BLACK-SCHOLES-MERTON
1.1 BLACK-SCHOLES-MERTON
Provided here are the various versions of the Black-Scholes-Merton
formula presented in the literature. All formulas in this section are
originally derived based on the underlying asset S follows a geometric
Brownian motion
dS = p.Sdt o- Sdz,
where t is the expected instantaneous rate of return on the underlying
asset, a is the instantaneous volatility of the rate of return, and dz is
a Wiener process.
1.1.1 The Black- Scholes Option Pricing Formula
The formula derived by Black and Scholes (1973) can be used to value
a European option on a stock that does not pay dividends before the
option's expiration date. 1 Letting c and p denote the price of European
call and put options, respectively, the formula states that
C --= S N (di) - Xe -rT N(d2) (1.1)
p = Xe-rT N(-d2) - SN(-d1), (1.2)
where
ln(S / X) ± (r a2/2)T
-
o-Nif
, ln(S / X) ± (r -a2/2)T
d2
aNil"
S = Stock price.
X = Strike price of option.
r =Risk-free interest rate.
T = Time to expiration in years.
a =Volatility of the relative price change of the underlying
stock price.
N (x) = The cumulative normal distribution function, described in
Chapter 13.
1The Black-Scholes formula can also be used to price American call options on a
nondividend-paying stock, since it will never be optimal to exercise the option before
expiration.1.1. BLACK-SCHOLES-MERTON 3
Example
Consider a European call option with three months to expiry. The
stock price is 60, the strike price is 65, the risk-free interest rate is
8% per year, and the volatility is 30% per annum. Thus, S = 60, X = 65,
T = 0.25, r =0.08, a = 0.3,
, ln(60/65) + (0.08 + 0.3 2/2)0.25
al = = 0.3253
0.3,/0.25
d2 = di — 0.3N/0.25 = —0.4753
The value of the cumulative normal distribution N(.) can be found
using the approximation function in Chapter 13:
N(di) = N(-0.3253) = 0.3725 N(d2) = N(-0.4753) = 0.3173
c = 60N(d1) _ 65e-0.08 x 0.25 N(d2) = 2.1334
Computer algorithm
The BlackScholes(.) function returns the call price if the CallPutFlagis
set equal to "c" or the put price when set equal to "p." In the computer
code v = a.
Function BlackScholes( CallPutFlag As String, S As Double, X _
As Double, T As Double, r As Double, v As Double) As Double
Dim dl As Double, d2 As Double
dl = (Log(S / X) + (r + 102 / 2) * T) / ( v * Sqr(T))
d2 = dl — v * Sqr(T)
If CallPutFlag "c" Then
BlackScholes = S * CND(d1) — X * Exp(—r * T) * CND(d2)
ElseIf CallPutFlag = "p" Then
BlackScholes = X * Exp(—r * T) * CND(—d2) — S * CND(—d1)
End If
End Function
where CND() is the cumulative normal distribution function
described in Chapter 13. Example: BlackScholes("c", 60, 65, 0.25, 0.08,
0.3) will return a call price of 2.1334 as in the numerical example
above.
Black-Scholes PDE
An alternative way to find the Black-Scholes option value is to solve
the Black-Scholes partial differential equation (PDE). This can be
done numerically using several different methods and is covered in
Chapter 7. The PDE is given by
[
ac
ac 1 82c
a
2
S2 + r—S dt = rc
at 28S2 as4 CHAPTER 1. BLACK-SCHOLES-MERTON
The Black-Scholes formula is a closed-form solution to this PDE given
the payoff function (boundary condition) of a plain vanilla option.
## 1.1.2 Options on Stock Indexes
Merton (1973) extended the Black-Scholes model to allow for a con-
tinuous dividend yield, in addition to several other extensions. The
model can be used to price European call and put options on a stock
or stock index paying a known dividend yield equal to q:
c = se—qr N(do — xe —rrN(d2) (1.3)
p = Xe'T N(-d2)- Se -qT (1.4)
where
In(SIX)±(r -g ±a212)T
-
aN/T"
ln(SIX)±(r - q -a212)T
d2 = = c11
ciif
Example
Consider a European put option with six months to expiration. The
stock index is 100, the strike price is 95, the risk-free interest rate is
10% per year, the dividend yield is 5% per year, and the volatility is
20% per year. S = 100, X = 95, T = 0.5, r =0.1, q = 0.05, and a = 0.2:
ln(100/95) + (0.1 -0.05 ± 0.2 2/2)0.5
di = = 0.6102
d2 = d1 - 0.207). = 0.4688
N(d1 ) = N(0.6102) = 0.7291 N(d2) = N(0.4688) = 0.6804
N(-d1)= N(-0.6102) = 0.2709 N(-d2)= N(-0.4688) = 0.3196
p _ 95e-0.1 x0.5N(__d') 100e di) = 2.4648
Merton PDE
The PDE behind the Merton formula is
[ac 1a2,
a
at
+
2 as2
2S
2
+ (r - g)— ac S] dt =rc
as
## 1.1.3 Options on Futures
The formula of Black (1976) gives the price of European options when
the underlying security is a forward or futures contract with initial1.1. BLACK-SCHOLES-MERTON 5
price F:
c = e-1T [FN(di)—XN(d2)]
p =e—rT [XN(—d2)— FN(—d1)],
where
ln(FIX)-1- (a 212)T
ln(FIX)— (a 212)T
,./T d2 = =-
Example
Consider a European option on the Brent Blend futures with nine
months to expiration. The futures price is USD 19, the strike price is
USD 19, the risk-free interest rate is 10% per year, and the volatility
is 28% per year. F = 19, X = 19, T = 0.75, r =0.1, and a =0.28:
ln(19/19) + (0.282/2)0.75
— =0.1212
d2 = d1 — = —0.1212
N(di) = N(0.1212) = 0.5483 N(d2) = N(-0.1212) = 0.4517
N(—di)= N(-0.1212) = 0.4517 N(—d2)= N(0.1212) = 0.5483
c = c-0.1x0.750NA _ 19N(d2)] = 1.7011
p = C0.1X0.75[1 .'
9111 d2 19N(—d1)] = 1.7011
Black-76 PDE
The PDE behind the Black-76 formula is
[ac I 82c a , F 2 21dt =rc
at
+
2 aFL
See Appendix A at the end of this chapter for more information on
how to derive this PDE.
## 1.1.4 Margined Options on Futures
Asay (1982) has modified the Black-76 model for options on futures
contracts where the premium is fully margined; see also Lieu (1990).
The option premium is then paid into a margin account which accrues
interest while the option is alive. Such contracts trade on, for example,
the Sydney Futures Exchange. The Asay formula is like the Black-76
(1.5)
(1.6)
=6 CHAPTER 1. BLACK-SCHOLES-MERTON
formula, but without the interest rate terms:
c = FN (di) - XN(d2) (1.7)
p = XN(-d2) - FN(-d1), (1.8)
where
ln(F/ X) ± (a2/2)T
=
a-,/7
ln(F/ X) - (a2/2)T
d2 - = - a Aft
a-Aft
Example
Consider a nine-month put option on a futures contract with price
4200 and volatility 15%, with strike 3800. What is the option value
when the option premium is fully margined? S = 4200, X = 3800, T =
0.75, a =0.15:
1n(4200/3800) ± (0.152/2)0.75
di = = 0.8354
0.15T.T5-
d2 = di - = 0.7055
N(-d1)= N(-0.8354) = 0.2017, N(-d2)= N(-0.7055) = 0.2403
p = 3800N(-d2) - 4200N(-d1) = 65.6185
Asay PDE
The PDE behind the Asay formula is
[8c 182c __a2F21 dt =
at 28F2
## 1.1.5 Currency Options
The Garman and Kohlhagen (1983) modified Black-Scholes model can
be used to price European currency options; see also Grabbe (1983).
The model is mathematically equivalent to the Merton (1973) model
presented earlier. The only difference is that the dividend yield is
replaced by the risk-free rate of the foreign currency r f:
c = Se-rf TN(d ) ) - Xe -rTN(d2) (1.9)
p = Xe -rT N(--d2)- Se -rf T (1.10)1.1. BLACK-SCHOLES-MERTON 7
where
ln(S I X) ± (r - r f a2 /2)T
=
aNii"
ln(S I X) ± (r - r f - a2/2)T
d2= = - aNrf
a ff
For more information on currency options, see DeRosa (2000).
Example
Consider a European USD-call/ELTR-put option with six months to
expiration. The USD/EUR exchange rate is 1.56, the strike is 1.6, the
domestic risk-free interest rate in EUR is 8% per year, the foreign risk-
free interest rate in the United States is 6% per year, and the volatility
is 12% per year. S = 1.56, X = 1.6, T = 0.5, r =0.06, r f = 0.08, a =0.12.
16(1.56/1.6) ± (0.06 - 0.08+ 0.122/2)0.5
= = -0.3738
f`, /3
d2 = d1 - 0.12,./= -0.4587
N(d1) = N(-0.3738) = 0.3543 N(d2)= N(-0.4587) = 0.3232
-0.08x0.5N(di) _ - 0.06x0.5 c = 1.56e 1.6e N(d2) = 0.0291
The option premium is thus 0.0291 USD per EUR. Alternatively, the
premium can be quoted in EUR per USD 0.0291/1.56 2 = 0.0120—or
as percent of spot, 0.0291/1.56 = 0.0186538, or 1.8654% of EUR (or
the spot price). Hence, if the option has a notional of 100 million EUR,
the total option premium is 1,865,384.62 EUR, or 1,865,384.62 x
1.56 = 2,910,000.00 in USD.
Currency Option PDE
The partial differential equation behind the Garman and Kohlhagen
formula is
ac 1 a2c 2 c2 , t- — r
[ ac
± a a -1- 0 f)—S dt = rc
at 2 as2 -, as
## 1.1.6 The Generalized Black-Scholes-Merton
Option Pricing Formula
The Black-Scholes-Merton model can be "generalized" by incorporat-
ing a cost-of-carry rate b. This model can be used to price European
options on stocks, stocks paying a continuous dividend yield, options8 CHAPTER I. BLACK-SCHOLES-MERTON
on futures, and currency options:
cBSM = Se (b—r)T N (di) — Xe —rT N(d2) (1.11)
PBSM = Xe —rT N( — d2) — Se
(b— r)T N( _d1), (1.12)
where
In(SIX)± (b+o-212)T
=
a
d2 = di —
b = r gives the Black and Scholes (1973) stock option
model.
b = r — q gives the Merton (1973) stock option model with
continuous dividend yield q.
b = 0 gives the Black (1976) futures option model.
b = 0 and r =0 gives the Asay (1982) margined futures option
model.
b=r— rf gives the Garman and Kohlhagen (1983) currency
option model.
Computer algorithm
The GBlackScholes(.) function returns the call price if the CallPutFlag
is set equal to "c" or the put price when set equal to "p."
Function GBlackScholes(CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, v As Double) As Do
Dim dl As Double, d2 As Double
dl = (Log(S / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
If CallPutFlag = "c" Then
GBlackScholes = S * Exp((b r) * T) * CND(d1) — X * Exp(—r * T) _
* CND( d2 )
ElseIf CallPutFlag = "p" Then
GBlackScholes = X * Exp( — r * T) * CND(—d2) — S * Exp((b — r) * T)
* CND(—d1)
End If
End Function
where CND(.) is the cumulative normal distribution function
described in Chapter 13. Example: GBlackScholes(" p," 75, 70, 0.5, 0.1,
0.05, 0.35) returns a put price of 4.0870.1.2. PARITIES AND SYMMETRIES 9
Generalized Black-Scholes-Merton PDE
The Black-Scholes-Merton (BSM) PDE in terms of asset price S
[Pc 82c
a
2 Pc
S' + b— Sidt = rc
at 2 S2 as
Solving the PDE with the appropriate boundary condition yields the
BSM formula. An alternative is to solve the PDE numerically. This
method is slower but more flexible. It is covered in Chapter 7. See
Appendix A at the end of this chapter for more information about how
to derive this PDE.
One can alternatively rewrite this PDE in terms of ln(S). Letting
x = in(S) yields
Pc 1 2 82c ac
—
at + - 2a x2
+ (b - a2/2)T
x
= rc
In Chapter 7 we will also look at how to solve this PDE using finite
difference methods.
1.2 PARITIES AND SYMMETRIES
This section presents several useful parity and symmetry relation-
ships for the BSM formula.
1.2.1 Put- Call Parity for European Options
The put-call parity described in detail by Higgins (1902) and Nelson
(1904) gives the value of a put option with the same strike price,
and vice versa. An arbitrage opportunity exists if the parity does not
hold. This is based on several assumptions—for instance, that we can
easily short the underlying asset, no bid-ask spreads, and no trans-
action costs. It does not, however, rely on any assumptions about the
distribution of the price of the underlying security.
Stock Options
c = p+ S - Xe-rr p = c S +Xe-rr (1.13)
Example
Consider a European call option on a nondividend-paying stock with
a time to maturity of six months. The stock price is 100, the strike
price is 105, the risk-free rate is 10% per year, and the call value is
8.5. What is the value of a put with the same parameters? S = 100,
X = 105, T = 0.5, r = 0.1, c =8.5.
p = 8.5 - 100 + 105e- 0.1x0.5= 8.379110 CHAPTER 1. BLACK-SCHOLES-MERTON
Options on a Stock Paying Continuous Dividend Yield
c = p Se —qT — Xe —rT , p = c — Se —qT Xe —rT (1.14)
Option on Futures
c = p (F — X)e —rT p = c — (F — X)e —rT (1.15)
Fully Margined Options on Futures
c= p-I-F —X, p=c—F±X (1.16)
Currency Option
c p + se—r T Xe —rT p = c — Se —r-f T Xe —rT (1.17)
The Put-Call Parity for the Generalized
Black-Scholes Formula
(6—r)T p = c _ se(b—r)T c — p ± Se _T Xe —rT Xe —rT (1.18)
where b is the cost-of-carry of the underlying security.
b = r=Cost-of-carry on a nondividend-paying stock.
b = r—q=Cost-of-carry on a stock that pays a continuous
dividend yield equal to q.
b = 0 =Cost-of-carry on a future contract.
b = 0 and r=0 Gives the Asay (1982) margined futures option
model.
b =r—rf= Cost-of-carry on a currency position.
1.2.2 At-the-Money Forward Value Symmetry
Put and call options will have value symmetry (identical values) when
they are at-the-money forward Nelson (1904), defined as
sebT = x or S = Xe —bT
At this strike, put and call options will also have rho and theta symme-
try, but not delta symmetry (see next chapter). The result is naturally
based on using the same volatility for call and put options. Put-call
parity will normally ensure this symmetry, but it may not hold in
markets where there are restrictions on short selling, or other market
imperfections.
1.2.3 Put-Call Symmetry
There is also a put-call value symmetry for puts and calls with differ-
ent strikes, first described by Bates (1991), and in more detail by Carr
(1994) and Carr and Bowie (1994)
(sebT )2
c(S, X. T. r, b, a) =
sebT
p S,
x
, T, r, b, a) (1.19)1.2. PARITIES AND SYMMETRIES 11
A call with strike X is thus equivalent to puts with strike (5ex
bT)2.
This symmetry is useful for hedging and pricing barrier options, as
shown in Chapter 4.
1.2.4 Put- Call Supersymmetry
Another useful symmetry between call and put options is given by
c(S, X, T. r, b, a) = p(-S, -X, T, r, b, -a)
—that is, inputting negative asset price, strike, and volatility for a
put option yields the same value as a call option. Consider next the
following state space transformation:
k x c(S, X, T, r, b, a) = c(k x S, k x X, T, r, b, a),
which together with the above symmetry implies the put-call
supersymmetry
c(S, X, T, r, b, a) = -p(S, X, T, r, b, -a), (1.20)
and naturally
p(S, X, T, r, b, a) = -c(S, X, T, r, b, -a) (1.21)
The value of a call is thus equal to the value of minus a put with
negative volatility, and vice versa. The result simplifies coding and
implementation of many option calculations. There is no longer a need
to develop or to code separate formulas for put and call options.
The put-call supersymmetry can be extended to many exotic
options and holds also for American options. See Adamchuk (1998),
Peskir and Shiryaev (2001), Haug (2002), and Aase (2004) for
more details on supersymmetry as well as a discussion on negative
volatility.
1.2.5 Black- Scholes- Merton on Variance Form
In some circumstances, it is useful to rewrite the BSM formula using
variance as input instead of volatility, V = a2:
c = Se(b-r)T N (di) - Xe -rT N(d2) (1.22)
p Xe -rT N(-d2) - Se (b-r)T N(-di), (1.23)12 CHAPTER 1. BLACK-SCHOLES-MERTON
where
ln(S I X) ± (b ± V I2)T
A/V T
d2 = d1 —
BSM on variance form clearly gives the same price as when written
on volatility form. The variance form is used indirectly in terms of
its partial derivatives in some stochastic variance models, as well
as for hedging of variance swaps, described in Chapter 6. The BSM
on variance form moreover admits an interesting symmetry between
put and call options as discussed by Adamchuk and Haug (2005) at
www.wilmott.com.
c(S, X, T, r, b, V) = —c(--S, —X, —T, —r, —b, —V) (1.24)
and
p(S, X, T, r, b, V) = —p(—S, —X, —T, —r, —b, —V) (1.25)
It is possible to find several similar symmetries if we introduce
imaginary numbers.
1.3 BEFORE BLACK- SCHOLES-MERTON
The curious reader may be asking how people priced options before
the BSM breakthrough was published in 1973. This section offers a
quick overview of some of the most important precursors to the BSM
model.
## 1.3.1 The Bachelier Model
As early as 1900, Louis Bachelier published his now famous work on
option pricing. In contrast to Black, Scholes, and Merton, Bachelier
assumed a normal distribution for the asset price—in other words, an
arithmetic Brownian motion process
dS .-- adz
where S is the asset price and dz is a Winer process. This implies
a positive probability for observing a negative asset price—a feature
that is not popular for stocks and any other asset with limited liability
features.
The current call price is the expected price at expiration. This
argument yields
d1 —
c= (S — X)N (di) ± a .../T n(di), (1.26)1.3. BEFORE BLACK-SCHOLES-MERTON 13
and for a put option we get
P = (X — S)N(—d1) o-A/Tn(di), (1.27)
where
S — X
=
a A/7
S = Stock price.
X = Strike price of option.
T = Time to expiration in years.
a =Volatility of the underlying asset price
N (x) = The cumulative normal distribution function, described in
Chapter 13.
n(x) = The standard normal density function.
At-the-Money Approximation
In case the option is at-the-money, S = X, a good approximation for
the Bachelier formula is given by
c = p (3-1,Iyr o-0.4A/T'
Modified Bachelier Model
By using the arguments of BSM but now with arithmetic Brownian
motion (normal distributed stock price), we can easily correct the
Bachelier model to take into account the time value of money in a
risk-neutral world. This yields
C = SN(cli)— Xe —rT N(di) ci-A5n(d1) (1.28)
p = Xe—rT SN(—di)+a/n(d1) (1.29)
S — X
=
## 1.3.2 The Sprenkle Model
Sprenkle (1964) assumed the stock price was lognormally distributed
and thus that the asset price followed a geometric Brownian motion,
just as in the Black and Scholes (1973) analysis. In this way he ruled
out the possibility of negative stock prices, consistent with limited
liability. Sprenkle moreover allowed for a drift in the asset price,
thus allowing positive interest rates and risk aversion (Smith, 1976).
Sprenkle assumed today's value was equal to the expected value14 CHAPTER I. BLACK-SCHOLES-MERTON
at maturity.
c SePT N (di) — (1 — k)XN(d2)
d
ln(SI X) (p cr2 12)T
i —
c ,/7
d2 = d1 -
where p is the average rate of growth of the asset price and k is the
adjustment for the degree of market risk aversion.
## 1.3.3 The Boness Model
Boness (1964) assumed a lognormal asset price. Boness derives the
following value for a call option:
C = SN(di)— Xe —PT N(d2)
d =
ln(S IX) (p cr2 12)T
i
aIf
d2 = d1 - ,
where p is the expected rate of return to the asset.
## 1.3.4 The Samuelson Model
Samuelson (1965; see also Smith, 1976) assumed the asset price fol-
lows a geometric Brownian motion with positive drift, p. In this way
he allowed for positive interest rates and a risk premium.
c = Se (P—w)T N (di) — Xe —u' T N(d2)
d =
ln(S I X) + (p cr2 12)T
i
c
d2 = d1 - ,
(1.32)
where p is the average rate of growth of the share price and w is the
average rate of growth in the value of the call. This is different from
the Boness model in that the Samuelson model can take into account
that the expected return from the option is larger than that of the
underlying asset w > p.
(1.30)
(1.31)1.4. APPENDIX A: THE BLACK-SCHOLES-MERTON PDE 15
1.4 APPENDIX A:
THE BLACK-SCHOLES-MERTON PDE
## 1.4.1 Ito's Lemma
Ito's lemma basically states that if an asset price follows the Ito
process
dS = it(S, t)dt + o- (S, t)dz,
then a derivative security f that is a function of S and time t must
follow the Ito process
(af af 1 a2f 2) af
This Ito process has a drift equal to g ,i, + Piii + aa24 2cr2 and a dispersion
equal to gadz. Ito's lemma is a powerful tool to value derivative
securities, for example, by helping us find a BSM partial differential
equation (PDE) that can solved for the price, with the appropriate
boundary conditions.
Ito's Lemma and the Black-Scholes-Merton Option Model
A call must be a function of the process of the underlying asset price S.
Assuming that the asset price follows a geometric Brownian motion,
dS = P Sdt ± o- Sdz (1.33)
ac I a2c. ac a
[— —1,(S 0.2s21 c
dc = + + dt + —o- Sdz
at as 2 as2 as
The objective is to eliminate all risk with an combination of b in
the asset and short one option.
The value of the portfolio:
ac
V = –c +—s
as
The change in the portfolio value becomes:
Dc
dV = –dc + —dS
as
(1.35)
(1.34)16 CHAPTER 1. BLACK-SCHOLES-MERTON
Substituting (1.33) and (1.34) into (1.35):
dV = -[— + +
a
BC ac
n2
Ca2s2] ac
2 s2
dt - —aSdz
at as as
ac
+ —CuSdt + a Sdz)
as
ac ac 182c 22 ac = - — as tiSdt - - 2 — 8s2 a S dt - Ts aSdz
ac ac
+ —tiSdt + —a Sdz
as as
= dt ,a2S2dt
at 2 as,
This equation does not include the stochastic Winer process dz. In
time dt, the portfolio earns capital gains dV and income from the
underlying assets S equal to
ac
(r - b)—Sdt
as
Change in the wealth of the portfolio dW in time di' is
dW =
ac
dt
1 82c
a2S2dt + (r - b)—
ac
Sdt
at 2 8S2 as
thus dW is risk-free over di':
dW = rVdt
_ 1___ a2c a2s2di. ± (r ac ac
- 19-
c
dt - b)—Sdt =r -c + —S dt
at 2 as2 as dS
ac 1 82c 1 1
—dt + --a -S-dt + bi a Sdt = rc
Bt 2 852 as
[ac 1 a2c
at + 2 as2
2 2 ac
a 5 +b Ts,S dt = rc
The BSM call option pricing formula is found by using the boundary
condition at option expiration:
c = max(S - X; 0).
## 1.4.2 Dynamic Hedging
The idea of market neutral static delta hedging goes all the way back
to Higgins (1902) and Nelson (1904). The idea was later extended by
Thorp and Kaussof (1967) and Thorp (1969) and was further extended
ac ia2c1.4. APPENDIX A: THE BLACK-SCHOLES-MERTON PDE 17
to continuous time dynamic delta hedging by Black and Scholes (1973)
and Merton (1973). Continuous time delta hedging as just described is
removing all risk all the time under some strict theoretical assump-
tions. Unfortunately continuous dynamic delta hedging is far from
robust in practice. Dynamic delta hedging removes a lot of risk com-
pared to not hedging or even static delta hedging. Unfortunately,
options are extremely risky instruments, and even after removing
a lot of risk there is more than plenty of risk left. That is, in prac-
tice dynamic delta hedging alone cannot be used as an argument
for risk-neutral valuation. See Haug (2006) for more references and
detailed discussion on this topic. We will here just briefly discuss a
more robust alternative to the dynamic hedging argument, namely,
the Derman-Taleb method.
Derman-Taleb Method
Derman and Taleb (2005) describes an interesting way to come up with
the Black-Scholes-Merton formula, but without relaying on dynamic
delta hedging and neither on the Capital Asset Pricing Model (CAPM).
They are starting out by the valuation methods used before Black-
Scholes-Merton, simply by discounting the expected pay off ffom an
option based on an assumption on the distribution of the underly-
ing asset at maturity. Assuming the underlying stock is log-normal
distributed we get
c = e-RT (E[S - X]+)
= e-RT iseAT N (di) - XN(d2)l,
ln(S I X) ± a2 I2)T
=
and for a put we have
p = e-RT (E[X - Sl+)
= e-RT [XN( -d2) - SeA T N( -di)].
where it is the average rate of growth of the share price over the
lifetime of the option. R is the discount rate including a unknown risk
premium.
Next assuming the forward price is strictly based on arbitrage
pricing. Based on this we know the forward price of a stock not is
dependent on the real expected drift in the stock, but simply on the
risk-free rate and naturally dividend, but here we for simplicity skip
dividend even if the conclusions would be the same. The current value
of the forward price with delivery price X must then be
= S - Xe-rT
(1.36)
(1.37)18 CHAPTER 1. BLACK-SCHOLES-MERTON
where r is the risk-free zero coupon rate covering the period from now
until the expiration of the forward contract T. Second Derman-Taleb
takes advantage of the put-call parity, see Nelson (1904):
Fy = c - p
That is a forward expiring at the same time as the option must be equal
to a long European call, c, plus a short put p. Combining equation 1.36
with 1.37 we get
Fii = C _ p =e-RT [seta' _ xi
To avoid arbitrage opportunities both p, and R must be set equal to
the risk free rate r. Another way to think about this is that we now
have removed all risk in the option and that we, therefore, can use
risk-neutral valuation of the options, we end up with
c = S N (di) — Xe —rT N (d2),
1n(S 1X)+ (r + o -2 12)T
d1= ,
o- if
d2 = di.—
This is identical to the Black and Scholes (1973) and Merton 1973 for-
mula. The formula is no longer dependent on dynamic delta hedging,
neither directly on the CAPM formula. The method is based on a pure
arbitrage argument and is extremely robust and is fully consistent
with continuous-time as well as discrete-time trading.
This method is also the simplest method consistent with the volatil-
ity smile, see Haug (2006). The Derman-Taleb method is in this
respect not a model that directly describes the stochastic process of the
underlying asset or the dynamics of the volatility. It is a pure arbitrage
argument as well as relative value arbitrage argument that actually
is extremely robust and basically is how options traders operate by
hedging away most option risk with other options, and on top of this
are using dynamic delta hedging. A consequence of this argument as
discussed by Haug (2006) is that option valuation also must be depen-
dent on supply and demand of options. There is still a link towards
the underlying asset, but this link is only of the weak form, and not
of the strong form assumed by Black, Scholes and Merton where all
derivatives can be created synthetically without taking risk. In other
words, option traders need to take into account both the dynamic pro-
cess of the underlying asset as well as the supply and demand for
options when valuing options. This is actually the way option trader's
use option formulas.1.4. APPENDIX A: THE BLACK-SCHOLES-MERTON PDE 19
Forward Price
The forward price of a financial asset and also many commodities are
purely based on arbitrage and not on expectations, for an early indica-
tion on this see Keynes (1924) and Blau (1944-1945). The fair initial
contract price F that makes the initial value of a forward contract
zero is
F = SebT
The fair value of a forward contract just at the time of initiating is
zero, but then after initiated the forward contract the value is now
naturally related to the difference between the current spot price and
the agreed upon forward price FA. FA was initially equal to F, the fair
arbitrage value of a forward contract after initialized must be
Fit = e—rT [SebT — FA]
That is simply the discounted difference between the current spot
price and the agreed upon forward price, but taking into account the
cost-of-carry of holding the underlying asset.CHAPTER
2
BLACK-SCHOLES-MERTON
GREEKS
The next step was automatic for a trained scientist: analyze the
relation between the price of the warrant and the price of its
associated common stock. Find the rules, or 'laws,' connecting the
two prices.
Edward Thorp
The options sensitivities (Greeks) below are the partial derivatives
of the Black-Scholes-Merton (BSM) formula introduced in Chapter 1.
The partial derivative is a measure of the sensitivity of the option price
to a small change in a parameter of the formula. Appendix B at the
end of this chapter contains more details on how to derive the partial
derivatives. The second part of this chapter covers how to numerically
compute option sensitivities. A large part of this chapter is based on
Haug (2003).
For a quick reference, many of the option sensitivities described in
this chapter are listed in Table 2-1.
2.1 DELTA GREEKS
## 2.1.1 Delta
Delta is the option's sensitivity to small changes in the underlying
asset price.
Call
Put
Dc bT
Acall = — = ew —r" N(d1)>O
as
A _ e = — aP ,0-0TEN(di) 1] , 0
put as
Figure 1 illustrates the delta of a call option for varying asset prices
and times to maturity. Figure 2 similarly illustrates the delta of a put
option.
(2.1)
(2.2)
21TABLE 2-1
Black-Scholes-Merton Option Greeks (Partial Derivatives) Summary
Name Symbol Derivative Other name Formula
Acall
At
rp
Delta call
Delta put
DdeltaDvol
DvannaDvol
DdeltaDtime call
DdeltaDtime put
Elasticity call
Elasticity put
Gamma
GammaP
DgammaDvol
ac
as
ap
as
a2c a2p
aSacr aSacr
a3c a3p
asaa2 asaa2
a2c
asaT
a2p
asaT
ac s
as call
ap s
asput
a2c a2p
as2 as2
S 82c. s 82p
100 as2 100 as2
a3c a3p
as2aa as2a0-
Spot delta
Spot delta
Vanna, DvegaDspot
Charm, delta bleed
Charm, delta bleed
Lambda, leverage
Lambda, leverage
Convexity
Gamma percent
Zomma
e(b—r)T N (d i )
e(b—r)T [N (di) — 1]
_e(b—OTd2
n(di)
Vanua (— I ) (d1d2 — — I)
d2
e(b— r)T [n(d1)( b d2
(b — ON(di)1
sif 2T
e(b— r)T [n(di)
S11
e(b—r)T N (d i ) c
e(b—r)T [N (di) 1] S t
n(di)e(b—r)T
sif
sr
loo
r (did2 —1
)
call
Apia
lb d2
sif 2T
(b (—did
CHA PTER 2. BLA CK-S CHOLES -MERTON G REEKSEXHH IID V17 ga 1 *g
a3c a3p
as2au 8528u
a3c a3p
as3 = as3
rp
as
a3c a3p
8528T as2aT
rp
--
aT
ac _ap
au au
ac ap
10 au 10 au
82c 82p
8,2 — aa2
a a2c. a a2p
10 aa2 — 10 8a2
a3c a3p
aa3 = aa3
a2c a2p
aCT a
= -
aCraT
aC aP
av av
['p(di d2 — 1
a )
r ( i ±
Nif
di
100a'if
bdi 1—d1d2
F b +
aNIT' 2T )
bdi 1 — did2
a NIT' 2T )
Se(b—r)T n(di ) ,177
—Se (b—r)T n(d1),if
10
Vega ( di d2 )
VegaP (—
a
Vomma (- 1 ) (did2 — — t ' — 1)
a d2 di
Vega (r b ±
NI
6d1 1 + di d2
aT' 2T )
NIT' se(b,r)Tn(di)
DgammaPDvol
DgammaDspot
DgammaPDspot
DgammaDtime
DgammaPDtime
Vega
VegaP
DvegaDvol
DvegaPDvol
DvommaDvol
DVegaDTime
Variance vega
ZommaP
Speed
Speed percent
Colour, gamma bleed
Gamma percent bleed
Zeta
Percentage vega
Vomma, volga
VommaP, volgaP
Ultima
Vega bleed
(Continued)TABLE 2-1 (Continued)
Name Symbol Derivative Other name Formula
DdeltaDv ar
Variance vomma
Variance ultima
Expected bleed
Expected bleed
Pure bleed (b = 0, r =0)
a2c a2 p
asav asav
a2c a2 p
av2 av2
a3c _B3 p
av3 av3
Dc
DT
Bp
DT
Dc _ ap
aT aT
Dc
Dr
Dc
Dr
Bp
Br
ap
Dr
d2
—Se(b—r ) n (d,)_
\ 2a2
n(d1)(d1d2 — 1)
4a3
se(b—OT s/T.
8a5
n(d1)[(d1d2— 1)(d1d2 — 3) — (dj
d2)] 2
Se(b r)T n(d1)a (b r)Se(b—r)T N(di)
2.-f7
—rXe —rT N(d2)
Se(b—r)T n(doo ±
r)Se(b—r)T N(—di)
2,/7
±rXe'T N(—d2)
Sn(di)a
2-V7
TXe —rT N(d2)
—Tc
—TXe —rT N(—d2)
—Tp
Theta call °call
Theta put Oput
Driftless theta 0
Rho call Pcall
Rho call futures option Peal!
Rho put Pput
Rho put futures option Pput
Se(b—r)TPhi call (Dcall
Phi put (1)put
Carry rho call
Carry rho put
Rho-2
Rho-2
sxaaup V,L7a7
Zeta call In-the-money prob.
- T Se (b-r)T N(di)
TSe (b-r)T N(-d1)
TSe (b-r)T N(di)
- TSe (b-r)T N(-di)
N(d2)
Zeta put
DzetaDvol call
DZetaDVol put
DZetaDTime call
DZetaDTime put
Strike delta call
Strike delta put
Strike gamma
put
80'
aput
a°.
aT
aqmt
aT
ac
ax
ap
ax
a2c a2p
ax2 ax2
N(-d2)
n(d2)(d
-n(d2)( a )
In- the-money prob.
(L . b d1
n(d2)
2T )
b di)
- n(d2)
2T )
_e-rT : Cf :
e—rT N(—d2)
Discounted probability
Discounted probability
n(d2)e -rT
RND
XaVT'26 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
FIGURE 1 Spot delta call: X = 100, r =7%, b = 4%, a =30%.
Example
Consider a futures option with six months to expiration. The futures
price is 105, the strike price is 100, the risk-free interest rate is 10%
per year, and the volatility is 36% per year. Thus, S = 105, X = 100,
T = 0.5, r = 0.1, b = 0, and a =0.36.
ln(105/100) (0 ± 0.362/2)0.5
(It = = 0.3189
N(di) = N(0.3189) = 0.6251
Acall =
eN ,di s
) = 0.5946
(0-0.1)0.5[At(do
A t = e pu — 11 = —0.35662.1. DELTA GREEKS 27
FIGURE 2 Spot delta put: X = 100, r =7%, b = 4%, a =30%.
Computer algorithm
Function GDelta(CallPutFlag As String, S As Double, X As Double, T As Double,
r As Double, b As Double, v As Double) As Double
Dim dl As Double
dl = (Log(S / X) + (b + v^2 / 2) * T) / (v * Sqr(T))
If CallPutFlag = "c" Then
GDelta = Exp(( b — r) * T) * CND(d1)
Else
GDelta = —Exp((b — r) * T) * CND(—d1)
End If
End Function1.6
28 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
The Behavior of Delta
As a call option gets deep-in-the-money, N(di) approaches 1, but it
never exceeds 1 (since it's a cumulative distribution function). For a
European call option on a nondividend-paying stock, N(di) is more-
over equal to the option's delta. Delta can therefore never exceed 1
for this option. For general European call options, delta is given by
e(b—r)T Md1). If the term e(b—r)T is larger than 1 and the option is deep-
in-the-money, the delta can thus become considerably larger than 1.
This occurs if the cost-of-carry is larger than the interest rate, or if
interest rates are negative. Figure 3 illustrates the delta of a call
option. As expected the delta exceeds 1 when time to maturity is large
and the option is deep-in-the-money.
FIGURE 3 Spot delta call: X = 100, r = 5%, b =30%, a = 25%.2.1. DELTA GREEKS 29
Example
Consider a commodity option with two years to expiration. The com-
modity price is 90, the strike price is 40, the risk-free interest rate
is 3% per year, the cost-of-carry is 9% per year, and the volatility is
20%. What is the delta of a call option? S = 90, X = 40, T = 2, r =0.03,
b = 0.09, and a =0.2.
ln(90/40) ± (0.09 ± 0.22/2)2
d1 = = 3.6449
0.2,/2
N(d1) = N(3.6449) = 0.9999
p (3.6449) = 1.1273 i
= e(0.09-0.03)2 —
kali
The delta of this option is about 112.73%, which implies that the call
price will increase (decrease) with about 1.13 dollars if the spot price
increases (decreases) by one dollar.
## 2.1.2 Delta Mirror Strikes and Assets
The following strikes equalize the absolute values of deltas of put and
call options:
S2 S2
e(2b+c).2)T X put = — e(2b-l-a2)T
Xcall
Xcall =
Xput
That is
, _ s2 e(2b-I-a2)T,
LXuall(S, Xcall , T, r, b, (7) = —
s
A _put T, r, b, o-
Xcall
(2.3)
These relationships are useful to determine strikes for delta-neutral
option strategies, especially for strangles, straddles, and butterflies.
The weakness of this approach is that it works only for symmetric
volatility smiles. In practice, you still often need only an approxi-
mately delta neutral strangle. Moreover, volatility smiles are often
more or less symmetric in the currency market.
In the special case of a straddle-symmetric-delta strike, described
by Wystrup (1999), the formulas above simplify to
,7.
&all = Xput = Se cr
,2
"' ' "
A related concept is the straddle-symmetric-asset price. Given
identical strikes for a put and a call, what asset price will yield the
same absolute delta value? This asset price is given by
S = X e(—b— `72 12)T30 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
At this strike and delta-symmetric-asset price, the delta is given
0-nT
by e 2 for the call, and 9 for the put. Only options on
nondividend-paying stocks (b = rT can simultaneously have an abso-
lute delta of 0.5 (50%) for a put and a cal1. 1 Moreover, the delta-
symmetric strike is also the strike where gamma and vega attain their
maximum, ceteris paribus. Notice that the maximal gamma and vega,
as well as the delta-neutral strikes, are not at-the-money forward
(as assumed by many traders). Moreover, an in-the-money put can
naturally have absolute delta lower than 0.5, while an out-of-the-
money call can have delta higher than 0.5.
For an option that is at the straddle-symmetric-delta strike, the
BSM formula can be simplified to
se(b—r)T
c =
2
Xe—rT N(—aN/T)
and
Se(b—r)T
p Xe —rT N(a
2
At this point the option value will not change based on changes in
cost-of-carry (dividend yield, etc.). This is as expected, as we have to
adjust the strike accordingly.
Example
What should the strike be for a delta-neutral straddle with nine
months to maturity, the risk-free rate 10%, volatility 60%, for a stock
trading at 100? S = 100, T = 0.75, r - -= 0.1, b = 0.1, and a = 0.6.
Xcall = Xput = 100e(0.1+0.62/210.75 _
123.3678
## 2.1.3 Strike from Delta
Options are quoted by delta rather than strike in several OTC (over-
the-counter) markets. This is a common quotation method in, for
instance, the OTC currency options market, where one typically asks
for a delta and expects the salesperson to return a price (in terms of
volatility or pips) as well as the strike, given a spot reference. In these
cases, one needs to find the strike that corresponds to a given delta.
Several option software systems solve this numerically using Newton-
Raphson or bisection. This is actually not necessary, however. With
an inverted cumulative normal distribution function N -1 0, the strike
1This clearly also applies to commodity options when the cost-of-carry is r.2.1. DELTA GREEKS 31
can be derived from the delta analytically, as described by Wystrup
(1999). For a call option
Xca = S exp[—N—1 (—Acalle(r—b)T)cr‘/T. ± ± cr2/2)Ti (2.4)
and for a put we have
xput = S exp[N-1 (—Apute(r—b)T)a-JT + (b a2/2)71 (2.5)
To get a robust and accurate implementation of this formula, it is
necessary to use an accurate approximation of the inverse cumula-
tive normal distribution. The algorithm of Moro (1995) is one possible
implementation; this is given in Chapter 13.
Example
What should the strike be for a three-month call stock index option
to get a delta of 0.25, the risk-free rate 7%, dividend yield 3%, and
volatility 50%, and with the stock index trading at 1800? S = 1800,
T = 0.25, r =0.07, b = 0.07 – 0.03 = 0.04, a =0.5, and thus
N — I( e
(r— b)T = N - 1 (0.25e(0.07— 0.04)0
)
.25 , = — 0.6686
Xcaii = 1800 x exp[0.6686 x 0.5-V0.25 + (0.04 + 0.52/2)0.25] = 2217.0587
That is, to get a delta of 0.25, we need to set the strike to 2217.0587.
## 2.1.4 Futures Delta from Spot Delta
The delta we have looked at above is known as spot delta—that is, the
delta of the option in terms of the underlying asset, we are inputting
into the model. Sometimes when we, for example, value an option on
a stock inputting the stock price, we can in some markets choose if
we want to hedge with the stock itself or alternatively hedge with the
stock futures. In that case it is useful to go from spot delta to futures
delta
F = Ae—bT
where A is the delta given earlier. Alternatively, you could naturally
have inputted the futures price directly into the BSM formula, and
the spot delta would in that case be equal to the futures delta. In the
case where you hedge with a forward contract with same expiration as
the option, the formula above also holds. This is particularly useful in
the FX market, where you typically can choose between hedging with
the currency spot or alternatively a forward with expiration matching
the option expiration.32 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
## 2.1.5 DdeltaDvol and DvegaDspot
DdeltaDvol, defined as1- ' 7' , is mathematically the same as Dvega-
Dspot, defined as 17 (aka vanna). They both measure approximately
how much delta will change due to a small change in the volatility,
and how much vega will change due to a small change in the asset
price:
82c 82p _e(b—r)T d2
aSaa aSaa a
(2.6)
where n(x) is the standard normal density
1 -x2/2 n(x)=
-V27
Figure 4 illustrates the DdeltaDvol. The DdeltaDvol can evidently
assume positive and negative values. It attains its maximal value at
St. = x e —bT —a 4+Tcr2 /2
and attains its minimal value at
su = xe—bT+cr-s5V4+Tcr2/2
Similarly, given the asset price, options with strike XL attain minimal
DdeltaDvol at
XL = SebT—cr,FTN/4+Ta2/2
and options with strike Xu attain maximum DdeltaDvol at
Xu =
A natural question is whether these measures have any real
meaning? Recall that Black and Scholes assumed constant volatility
when deriving their formula. Despite being theoretically inconsistent
with the Black-Scholes analysis, the measures may well represent
good approximations. Webb (1999) has more practical information on
DvegaDspot and vanna.
Example
Consider a put option on a stock trading at 90, with three months
to maturity, strike 80, three month risk-free interest rate of 5%, and55
2.1. DELTA GREEKS 33
FIGURE 4 DdeltaDvol: X = 100, r =5%, b =0%, o =20%.
volatility of 20%. What is the DdeltaDvol? S = 90, X = 80, T = 0.25,
r =0.05, b = 0.05, a = 0.2, thus
ln(90/80) + (0.05 + 0.22/2)0.25
= = 1.3528
0.2,./0.25
d2 = d1 — a = 1.3528 — 0.2,./0.25 = 1.2528
n(di) = n (1.3528) = 0.1598
a 2 p — e0050050251.2528 01598 =
— 1.0008
Saa 0.2
If the volatility increases from 20% to 21%, the delta of the put
will thus decrease by about one percentage point -13°8 . Similarly,
if the volatility decreases from 20% to 19%, delta will increase by0.00025
-0.0002
0.00015
0.0001
0.00005
0
-0.00005
-0.0001
-0.00015
-0.0002
-0.00025
34 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
one percent point. Alternatively, this shows that the options vega will
decrease by –0.0100 if the stock price increases by one.
## 2.1.6 DvannaDvol
The second-order partial derivative of delta with respect to volatility,
also known as DvannaDvol, is given by
83c 83 p _e(b- r)Td2 1
n(di)- (did2 c-11 - 1)
aSaa2 aSaa2 a a d2
= vanna (
1
W
) (did2 - — - 1) (2.7)
d2
It is necessary to divide by 10,000 to get this Greek on the metric of a
one point change in volatility—for example, from 20% to 21%.
Figure 5 illustrates DvannaDvol for varying asset price and time
to maturity.
72 N
10 0
0 (0
0 co N-
0 N-
N
0 csj N-
Tt N-
1—
Asset price
FIGURE 5 DvannaDvol: X = 100, r = 7%, b = 4%, a = 40%.2.1. DELTA GREEKS 35
## 2.1.7 DdeltaDtime, Charm
DdeltatDtime, also known as charm (Garman, 1992) or Delta Bleed,
a term used in the excellent book by Taleb (1997), measures the
sensitivity of delta to changes in time,
aAcall _ _e(b-r)T[n(di) b d2\
aT aNIT' 2T )
(b - r)N (di)] >o
and
_8 put
= -e(b-r)T [n(di)
b d2\
aT aVT 2T )
- (b - r)N (-di)] <>0
This Greek indicates what happens with delta when we move closer
to maturity. Figure 6 illustrates the charm value for different values
of the underlying asset and different times to maturity.
a, I
(2.8)
(2.9)
-- ,,
•,:r 0 cn 0-1 - -
_ u.) __. r ,
• .
-
- rr) T 1
.- .-
o co r 1 0 co - . qtr
.- cr) co o 11 -I il cr)
- ..-
co c"' Lo N Asset price
Lo
4L
3+
FIGURE 6 Charm: X = 100, r =5%, b = 0%, o- =30%.36 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
One can have both forward and backward bleed; see Taleb (1997).
Taleb also points out the importance of taking into account how
expected changes in volatility over the given time period affect delta.
All partial derivatives with respect to time have the advantage
over other Greeks that we know which direction time moves. We more-
over know that time moves at a constant rate. This is in contrast to,
for instance, the spot price, volatility, or interest rate.
Example
Consider a European put option on a futures currently priced at 105.
The strike price is 90, the time to expiration is three months, the risk-
free interest is 14% per year, and the volatility is 24% per year. What
is the charm of the option? S = 105, X = 90, T = 0.25, r =0.14, b = 0,
a =0.24, and thus
ln(105/90) + 0.25 x 0.242/2
= 1.3446
0.24,V0.25
d2 = d1 — = 1.3446 — 0.24,V0.25 = 1.2246
n(di) = n(1.3446) = 0.1616
N(—d1) = N (— 1.3446) = 0.0894
aAput
aT =
4)0.25 [0.1616 ( 0 1 . 2246
e 0.24,/0.25 2 x 0.25)
—(0 — 0.14)0.0894] = 0.3700
The DdeltaDtime for one day is thereby °Z° = 0.0010.
## 2.1.8 Elasticity
The elasticity of an option is its sensitivity in percent to a percent
change in the underlying asset price.
Call
Put
Acall = AcalI > 1
c11
= e(b—r)T N(di)—
call
(2.10)
At --= Aput — =
etb—r)T [N(di) .< 0 (2.11)
put put
The option's elasticity is a useful measure on its own, as well as a good
method to estimate the volatility, beta, and expected return from an
option.2.1. DELTA GREEKS 37
Example
What is the elasticity of a put option with the same parameters as
in the delta example? S = 105, X = 100, T = 0.5, r =0.1, b =0, and
a =0.36.
105 e(0-0 1)0 5[N(di
11 76767 = 4.8775
Option Volatility
The volatility of an option over a short period of time is approximately
equal to the elasticity of the option multiplied by the volatility of the
underlying asset a:2
cro °HAI (2.12)
As the lambda (elasticity) of the option will change with both the
underlying asset price and time, we can easily see that this at best is
an approximation. It still offers some intuition on leverage and risk
effects associated with options.
Option Beta
The elasticity also allows us to easily compute an option's beta. If
asset prices follow geometric Brownian motions, the continuous-time
capital asset pricing model of Merton (1971) holds. Expected return
on a generic asset, its, then satisfy the intertemporal CAPM equation
Us =r (rm — r)05
where r is the risk-free rate, rn, is the expected return on the market
portfolio, and /3s is the beta of the asset. To determine the expected
return of an option, we need its beta. The beta of a call is given by
Black and Scholes (1973):
Scan =
all
AcallfiS, (2.13)
while the beta of a put
Pput =
p
—
ut
AputfiS (2.14)
The expected return on a beta neutral option strategy should be equal
to the risk-free rate.
2Bensoussan, Crouhy, and Galai (1995) apply this approximation to find an approxi-
mate price for a compound option; see Chapter 4.38 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Option Sharpe Ratios
The Sharpe (1966) ratio is independent of leverage. The Sharpe ratio
of an option is therefore identical to that of the underlying asset:
110 — r As — r
=
Cro a
where [to is the expected return of the option. This relationship
indicates the limited usefulness of the Sharpe ratio as a risk-return
measure for options. For instance, shorting a large amount of deep
out-of-the-money options may result in a "nice" Sharpe ratio, but, it
represents a high-risk strategy. A relevant question is whether you
should use the same volatility for all strikes. For instance, deep out-
of-the-money stock options typically trade for much higher implied
volatility than at-the-money options. Using the volatility smile when
computing Sharpe ratios for deep out-of-the-money options can make
the Sharpe ratio work, slightly better for options. McDonald (2002)
offers a more detailed discussion of option Sharpe ratios.
2.2 GAMMA GREEKS
## 2.2.1 Gamma
Gamma is the delta's sensitivity to small changes in the underlying
asset price. Gamma is identical for put and call options:
82c 82p n (doe(b—r)T
rca//,put — — > 0
as2 as2 SaVT'
(2.15)
This is the standard gamma measure given in most textbooks like
Hull (2005) and Wilmott (2000). It measures the change in delta for a
one-unit change in the price of the underlying asset price.
Figure 7 illustrates the gamma of a call for different values of the
underlying asset and different times to maturity.
Example
Consider a stock option with nine months to expiration. The stock
price is 55, the strike price is 60, the risk-free interest rate is 10%
per year, and the volatility is 30% per year. S = 55, X = 60, T = 0.75,2.2. GAMMA GREEKS 39
0.09
0.08
0.07
0.06
0.05
0.04
0.03
0.02
0.01
0
to o
• '4' 0
CO 0
EN 0
Asset price
J•4 40.%
"%OA,
321
1 41%V
s • ..a&
44,4W.
"414444
VO 44:4
46••••4•42NIP 4.4•441........
0,4 1:444044%.
op 0 10
• 0
CO 0
LU
FIGURE 7 Gamma: X = 100, r =5%, b = 5%, a =30%.
r =0.1, b = 0.1, a --= 0.3, which yields
ln(55/60) ± (0.1 ± 0.32/2)0.75
d1 — = 0.0837
0.3N/0.75
1
n(di) = n(0.0837) — e- 0.08372/2 0.3975
0.3975e(0.1 —0.1)0.75
rcall,put — = 0.0278
55 x 0.1/0.75
## 2.2.2 Maximal Gamma and the Illusions of Risk
A popular rule of thumb is that gamma is largest for at-the-money or
at-the-money-forward options. How good is this rule of thumb? Given
a strike price and time to maturity, gamma attains its maximum when
the asset price is3
S1, Xe(
b-3a2/2)T
—
3Rubinstein (1990) indicates that this maximum may explain why the greatest
demand for calls tend to be just slightly out-of-the money.40 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Given the asset price and time to maturity, gamma attains its
maximum when the strike is
= Se(b±a2/2)T
Several large investment firms impose risk limits on how much
gamma their trades' portfolios can have. In the equity market it is
common to use the standard textbook approach to compute gamma,
as shown above.
Shorting a long-term call (put) option that later is deep-out-of-the-
money (in-the-money) can blow up the gamma risk limits, even if you
actually have close to zero gamma risk. The high gamma risk for long-
dated deep-out-of-the-money options typically is only an illusion. This
illusion of risk can be avoided by looking at percentage changes in the
underlying asset (gammaP), as is typically done for FX options.
Gamma Saddle Alexander Adamchuk was the first to make me
aware of the fact that gamma has a saddle point. 4 The saddle point is
attained for the time to expiry 5
Ts =
and at asset price
2(02 2b — r)
xe(-b-3a 2/2)Ts
The gamma at this point is given by
/2b—r
1,/ + 1
X
(2.16)
Figure 8 illustrates the gamma's saddle point. The saddle point is
between the two gamma "mountaintops." This graph also illustrates
one of the big limitations in the textbook gamma definition, which is in
active use by many option systems and traders. The gamma increases
dramatically when we have a long time to maturity and the asset price
is close to zero. How can the gamma be larger than for an option closer
to at-the-money? Is the real gamma risk that big? No, this is in most
4Described by Adamchuk at the Wilmott forum located at www.wilmott.com , Febru-
ary 6, 2002, and even earlier on his Web page.
51t is worth mentioning that Ts must be larger than zero for the gamma to have a
a2
saddle point. That means b must be larger than r-2 , or r must be smaller than
a2 2b.o
o o 487 Days to maturity
N 0
•- o 249
—
Asset price
2.2. GAMMA GREEKS 41
FIGURE 8 Saddle Gamma: X = 100, r = 5%, b = 5%, a = 80%.
cases simply an illusion, due to the above unmotivated definition of
gamma. Gamma is typically defined as the change in delta for a one-
unit change in the asset price. When the asset price is close to zero, a
one-unit change is naturally enormous in percent of the asset price.
In this case it is also highly unlikely that the asset price will change
by one dollar in an instant. In other words, the gamma measurement
should be reformulated, as many option systems already have done.
It makes far more sense to look at percentage moves in the underlying
assets than unit moves. To compare gamma risk from different under-
lying assets, one should also adjust for the volatility in the underlying
assets.
Example
Consider a stock option with strike 500, risk-free rate 8%, and volatil-
ity 40%. For what time and stock price does gamma have a saddle
point, and what is the gamma at this point? With X 500, r = 0.08,42 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
b = 0.08, and a =0.4, the saddle time must be (in number of years)
1
Ts = = 2.0833
2(0.42 ± 2 x 0.08 —0.08)
the saddle point stock price must be
s- — 500e(-0.08-3 x 0.42/2)2.0833 =
256.7086 r —
and the gamma at this point is
rs = r(256.7086, 2.0833) =
e 2 x 0.08-0.08
± 1 Jr V 0.42
= 0.0023
500
That is, for the saddle point (S = 256.7086, T = 2.0833), we have a
gamma of 0.0023.
## 2.2.3 GammaP
As mentioned, there are several problems with the traditional defini-
tion of gamma. A better measure is to look at percentage changes
in delta for percentage changes in the underlying asset (gamma
percent).6 This definition yields
(2.17)
SF n(dl)é(— '"
r p = =
100 100o -,/T' >0
GammaP attains a maximum at an asset price of
sr - =
Alternatively, given the asset price, the maximal Fp occurs at strike
= se(b+62/2)T
This is also where we have a straddle-symmetric asset price as well
as maximal gamma. This implies that a delta-neutral straddle has
maximal ['p. In most circumstances, measuring the gamma risk as
Fp instead of as gamma avoids the illusion of a high gamma risk when
the option is far out-of-the-money and the asset price is low. Figure 9
is an illustration of this, using the same parameters as in Figure 8.
6Wystrup (1999) also describes how this redefinition of gamma removes the depen-
dence on the spot level S. He calls it "traders' gamma." This measure of gamma has
for a long time been popular, particularly in the FX market, but it is still absent in
options textbooks, until now!2.2. GAMMA GREEKS 43
If the cost-of-carry is very high, it is still possible to experience
high rp for deep-out-of-the-money call options with a low asset price
and a long time to maturity. This occurs because a high cost-of-carry
can make the ratio of a deep-out-of-the money call to the spot close
to the at-the-money forward. At this point the spot delta will be close
to 50%, and so the rp will be large. This is not an illusion of gamma
risk, but a reality. Figure 10 shows Fp with the same parameters as
in Figure 9, with a cost-of-carry of 60%.
To makes things even more complicated, the high Fp for deep-
out-of-the-money calls (in-the-money puts) applies only in the case
when we are dealing with spot gammaP (changes in spot delta). We
can avoid this by looking at future/forward gammaP. However, if you
hedge with spot, then spot gammaP is the relevant metric. Only if you
hedge with the future/forward, the forward gammaP is the relevant
metric.
The forward gammaP we have when the underlying asset is a
future/forward and the cost-of-carry is set to zero.
0.035
0.03
0.025
0.02
0.015
0.01
0.005'
FIGURE 9 GammaP: X = 100, r = 5%, b = 5%, a = 80%.CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS 44
0 025
0 02
0.015
FIGURE 10 Saddle GammaP: X = 100, r =5%, b =60%, a =80%.
Ex ample
What is the gammaP for an option on a stock with price 50, strike
50, time to maturity 8 days, risk-free rate 12%, and volatility 15%?
S = 50, X = 50, T = 8/365, r =0.12, b =0.12, and a = 0.15 yields
In(50/50) + (0.12 + 0.152/2)8/365
= = 0.1295
0.15.0/365
—0.12952/2 _ n(d) ) =n(0.1295) = 0.3956
0.3956 x e(0.12-0.12)87365
[00 x 0.150/365
p = 0.1781
That is, for a 1% move in the underlying asset, in this case a 50 x
0.01 = 0.5 move, the delta will change by about 0.1781.2.2. GAMMA GREEKS 45
## 2.2.4 Gamma Symmetry
Given the same strike, the gamma is identical for both put and call
options. Although this equality breaks down when the strikes differ,
there is a useful put and call gamma symmetry. The put-call symmetry
of Bates (1991) and Carr and Bowie (1994) is given by
p (sebT )2 s,
c(S. X, T, r, b, a) =
sebT
(
T"
r b, cs)
x '
This put-call value symmetry yields the gamma symmetry. The
gamma symmetry is more general, however, since it is independent
of whether the option is a put or a call. It could, for example, be two
calls, two puts, or a put and a call.
F(S, X, T, r, b, a) =
sebT
,T, r, b, a)
x
(s, (sebT )2
(2.18)
The put-call symmetry also gives us vega and cost-of-carry symme-
tries, and in the case of zero cost-of-carry, also theta and rho symmetry.
Delta symmetry, however, does not obtain.
## 2.2.5 DgammaDvol, Zomma
DgammaDvol (aka zomma) is the sensitivity of gamma with respect
to changes in implied volatility. DgammaDvol is in my view one of the
more important Greeks for options trading. It is given by
ar
DgammaDvol„ii, put = T o. = F (
did2 —1) <> _
-- 0 (2.19)
where F is the textbook gamma of the option. For the gammaP, we
have DgammaPDvol
DgarnmaPDvolca, put = P
(di d2 – 1)
<> o (2.20)
For practical purposes, where one typically wants to look at
DgammaDvol for a one-unit volatility change—for example, from
30% to 31%—one should divide the DgammaDvol by 100. More-
over, DgammaDvol and DgammaPDvol are negative for asset prices
between SL and Su and positive outside this interval, where
SL = Xe—bT —a 4+T0-212
= Xe—bT +o srTN/4+T0212316
255
194
133 Days to maturity
0.15
0.05
Or
-0.05
-0 1
-0.15
-0.2
-0.25
0.3
46 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
For a given asset price, the DgammaDvol and DgammaPDvol are
negative for strikes between
XL =SebT Ts/ 4+Tu2/2
X u sebT±cr,/7,/4+Ta2/2
and positive for strikes above Xu or below XL, ceteris paribus. In
practice, these points will change with other variables and parame-
ters. These levels should therefore be considered good approximations
at best.
In general, you want positive DgammaDvol—especially if you don't
need to pay for it (flat-volatility smile). In this respect, DgammaDvol
actually offers a lot of intuition for how stochastic volatility should
affect the BSM values (?). Figure 11 illustrates this point. The Dgam-
maDvol is positive for deep-out-of-the-money options, outside the
SL and Su interval. For at-the money options and slightly in- or
out-of-the-money options, the DgammaDvol is negative.
co 71
10
Asset price
(0 1.0 co cp
FIGURE 11 DgammaDvol: X = 100, r =5%, b = 0%, a =30%.2.2. GAMMA GREEKS 47
If the volatility is stochastic and uncorrelated with the asset price,
then this offers a good indication of which strikes you should use
higher/lower implied volatility for when valuing your options. This
naturally becomes more complicated in a situation where volatility is
correlated with the asset price.
Example
Consider a put option on a futures contract trading at 100, with three
months to expiration, strike 80, three-month risk-free interest rate
of 5%, and volatility of 26%. What is the DgammaDvol/zomma and
also the zommaP? Letting S = 100, X -= 80, T = 0.25, r =0.05, b = 0,
a = 0.26, we have
ln(100/80) + 0.262/2 x 0.25
di — = 1.7815
0.26,A5
d2 = di — -17 = 1.7815 — 0.26,5E = 1.6515
n(di) = n(1.7815) = 0.0816
n(d1)e(0-0.05)0.25
rcall,put =
100 x 0.26J
= 0.0062
ar (1.7815 x 1.6515 — 1)
Dgama
rn Dvolcan, put = = 0.0062
0.26
= 0.0463
In practice, one would typically like to look at the change in gamma
for a 1 percent point change in volatility. To do this, we need to to
divide by 100. So for a 1 percent point increase (decrease) in volatil-
ity, the gamma will increase (decrease) with about 4.63%. To find the
DgammaPDvol, we can multiply DgammaDvol with 1 + 0 . In this par-
ticular example, the asset price is 100, so DgammaPDv -61 will be equal
to DgammaDvol.
## 2.2.6 DgammaDspot, Speed
The third derivative of the option price with respect to spot is known
as speed. Speed was probably first mentioned by Garman (1992).
For the BSM formula we get
a3c r +a v T
as3 =
(2.21)
A high-speed value indicates that the gamma is very sensitive to
changes in the underlying asset. Academics typically claim that third0,0006
aceas
0.0024.
0 0003,
0.0002.
0.0001 •
0,
-0.0001
-0.0002 ;
-0. 0003-
-0.0004
-0. 00,05 -
co
‘r
Days to maturity
115
53
f ai
(•,), 10
Asset price ...r> 0
.48 CHAPTER 2. BLACKSCHOLES-MERTON 61RE.EKS
FIGURE 12 Speed: X = 100, r = 5%, b = 0%,Cr = 30%.
or higher order "'Greeks" are of no use. For an option trader, on the
other hand, it can definitely make sense to have a sense of an option's
speed. Interestingly, speed is used by Fouque, Papanicolaga, and
Sircar (29,N) as a part of a stochastic. volatility model adjustment.
More to the point, speed is useful when gamma is at its maximum
with respect to the asset price. Figure 12 shows the graph of speed
with respect to the asset price and time to maturity.
For Fp we have an even simplex expression for speed—that is,
speedP (speed for percentage gamma)
di
Speed? = F
10077v T
(2.22)
Example
Consider an option (call or put) with one month to expiration and a
strike, of 48 on a stock index contract trading at 50„ Assume moreover
the one-month risk-free interest rate of ,6%, a dividend yield of 5%,
and a volatility of 20%. What is the speed and. speedP of the option?
S = 50, X = 48, T = = 0.0833, r =0.06, b = 0.06 – 0.05 = 0.01,2.2. GAMMA GREEKS 49
a = 0.2, and thus
in(50/48) ± (0.01 + 0.22/2) x 0.0833
= = 0.7504
0.2N/0.0833
n(di) = 11(0.7504) = 0.3011
n(d1)e(0.01 —0.05) x 0.0833
rcall,put = 0.1039
50 x 0.2N/0.0833
0.1039 (1 + 0.7504
a3c ) 0.20.0833
= -0.0291
as3 50
The gamma will thus decrease (increase) with approximately 2.9
percentage points for a unit increase (decrease) in the stock index.
The speedP can be found by multiplying the speed by 1 ÷ 0 , which in
this case yields as SpeedP of —0.0135.
## 2.2.7 DgammaDtime, Color
The change in gamma with respect to small changes in time to matu-
rity, DGammaDtime—also called GammaTheta or color (Garman,
1992)—is given by (assuming we get closer to maturity):
ar e(b-r)T n(di) bdi 1 - did2
r
aT b crff 2T )
bdi 1 - did2\
r - b
2T ) T
Divide by 365 to get the sensitivity for a one-day move. In practice,
you typically also take into account the expected change in volatility
with respect to time. If you, for example, on Friday wonder how your
gamma will be on Monday, you typically will assume a higher implied
volatility on Monday morning. For rp we have DgammaPDtime
ar p bdi 1 - did2)
= p b <>0
aT 2T
(2.24)
(2.23)
Figure 13 illustrates the DgammaDtime of an option with respect to
varying asset price and time to maturity.50 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
1 5-
0 5
-0.5
101
•zr
r
°3 0
Asset price
CO
co
co co co 0
“-)
10
40
Days to maturity
FIGURE 13 DgammaDtime: X = 100, r =5%, b = 0%, a = 30%.
2.3 'VEGA GREEKS
## 2.3.1 Vega
Vega7 is the option's sensitivity to a small change in the volatility of
the underlying asset. Vega is identical for put and call options.
aze 2 d p ( T Vegacall, put = 00.2 = ao_2 _ Se )Tn (b ai ) > 0 (2.25)
Figure 14 graphs the yega of an option with respect to varying
asset price and time to maturity.
Example
Consider a stock index option with nine months to expiration. The
stock index price is 55, the strike price is 60, the risk-free interest
7While the names of many other options sensitivities have corresponding Greek
letters, vega is the name of a star also known as Alpha Lyrae.2.3. VEGA GREEKS 51
04Ck-
0 35'
0.3O
0 25
0.20
0 15
0 10
0.05
0 00
CD
FIGURE 14 Vega: X = 100, r =5%, b = 5%, a = 30%.
rate is 10.50% per year, the dividend yield 3.55%, and the volatility
is 30% per year. What is the vega? S = 55, X = 60, T = 0.75, r =0.105,
b = 0.105 — 0.0355 = 0.0695, a =0.3, which yields
In(55/60) + (0.0695 + 0.32/2)0.75
0.3,s/CM5
n(di)= —0.0044) = 0.3989
( 0695 105)0.75
Vega„H,put = 55e 0 0
x 0.3989.70.75 = 18.5027
To convert this into a vega number for a one-percent point volatil-
ity move, we need to divide the vega number by 100. So if the
volatility goes from 30% to 31%, the option value will increase by
approximately 0.1850.
di — — 0.0044T=
8r -1- a2
2 [1 + 1/1 + (8r 1)1n(S/X)2 ]
52 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Vega Local MaX111111111
When you are trying to profit from moves in implied volatility, it is
useful to know where the option attains its maximum vega. For a
given strike price, vega attains its maximum when the asset price is
S = Xe(–b±a212)T
At this asset price we also have in-the-money risk-neutral probability
symmetry (treated later in this chapter). Moreover, at this asset price
the Black-Scholes-Merton (BSM) formula simplifies to
e–rT c _ se(b–r)TN(cr,s5)
Xe–rT se(b–r)TN( _047)
P = 2
Similarly, the strike that maximizes vega given the asset price is
X = se(b±a212)T
Vega Maximum Time
In the Black-76 model (b = 0), vega attains its maximum when the
time to maturity is equal to
2
Example
Assume a option on a futures contract trading at 80, with a strike
price of 65. The risk-free rate is 5% and the volatility is 30%. For
what time does this option have its maximum vega, ceteris paribus?
S 80, X = 65, r =0.05, b = 0 , cr =0.3.
2 [1 + + (8 x 0.05 x 1)1n(80/65)2
T= = 8.6171
8 x 0.05 + 0.32
Vega Global Maximum
For options with a long time to maturity, the maximum vega is not
necessarily increasing with the time to maturity, as many traders
believe. Indeed, vega has a global maximum at time
1
T- = —
V 2rtf)
CN
2.3. VEGA GREEKS 53
and asset price
- —X (-b±c"212)7 = Xe -b+ 2:-212 v — e
At this global maximum, vega itself, described by Alexander Adam-
chuk,8 is equal to the following simple expression:
Vega(S, 7-17) =
X
Figure 15 shows the graph of vega with respect to the asset price
and time. The intuition behind the vega-top/mountain is that the
effect of discounting at some point in time dominates volatility (vega):
The lower the interest rate, the lower the effect of discounting, and
the higher the relative effect of volatility on the option price. As the
0.45
FIGURE 15 Vega: X = 100, r = 15%, b = 0%, o = 12%.
2,/ r e7r
(2.26)
8Described by Adamchuk at the Wilmott forum located at www.wilmott.com on
February 6, 2002.54 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
180
1.60
140-
1.20.
1.00'
0.80
0 60
0.40
00
/14
, , 0010 I 4110 14
;;;;;;;;;;;
4i Ai Vit)
AI .1 osie\
; ; 9e**1\
" 14W
/4/1
;;;;; Ilft‘ 07
,,,,,,,,, At
ig‘ 0$7 0 20 ,, ,,,,,,,
. V 4.
LC)
.411441:434.r ..44.1.5.70111 /4 1111\ 4 1110414%..11.4; • 1104.4, '
,,,,,,,, •
0 00 a. •.•■••■ •2■••■•••.,/, .
•••,, • ,,,,,,,, 411441:77
, ,,
0
cy L.r)
4. _ • •04,,
4. 4 4.4 4. 41r t L'it .44 44414:7. 41. 4"412''.....''1 r) 155 r
CD
Asset price Li)
CD
FIGURE 16 Vega: X = 100, r =0%, b = 0%, a = 12%.
risk-free rate goes to zero, the time for the global maximum goes
to infinity—that is, we will have no global maximum when the risk-
free rate is zero. Figure 16 is the same as Figure 15 but with zero
interest rate.
The effect of vega being a decreasing function of time to maturity
typically kicks in only for options with very long times to maturity—
unless the interest rate is very high. It is not, however, uncommon for
caps and floors traders to use the Black-76 formula to compute vegas
for options with 10 to 15 years to expiration (caplets).
Example
Consider a stock option with strike 500, risk-free rate 8%, and volatil-
ity 40%. For what time and stock price do we have the global maximum
vega point, and what is the vega at this point? Thus, X 500, r =0.08,2.3. VEGA GREEKS 55
b = 0.08, a =0.4. The time must be (in number of years)
1
Tv 2 x0.08
= 6.2500
and the stock price must be
= 500e(-0.08+0.42/2)6.2500 500
and at this stock price and time to maturity, the global maximum
vega is
500
Vega(500, 6.2500) — = 302.4634
2,/0.08e7r
To get the global max vega on the metric of one-percent-point
volatility, we need to divide it by 100.
## 2.3.2 Vega Symmetry
For options with different strikes, we have the following vega
symmetry:
X (sebT)2
Vega(S, X, T, r, b, cr) = Vega S„ sebT (2.27)
As for the gamma symmetry, see Haug (2003). This symmetry is in
theory independent of the options being calls or puts.
## 2.3.3 Vega-Gamma Relationship
Following is a simple and useful relationship between vega and
gamma, described by Taleb (1997), among others:
Vega = r sT
Example
Consider a stock option with nine months to expiration. The stock
price is 55, the strike price is 60, the risk-free interest rate is 10%
per year, and the volatility is 30% per year. Moreover, the gamma of
the option is 0.0278 (as we calculated in the gamma example above).
What is the vega? S = 55, X = 60, T 0.75, r =0.1, b = 0.1, a =0.3,
F = 0.0278, and
Vega = 0.0278 x 0.3 x 552 x 0.75 = 18.9358
To look at vega for a one-percent-point move in implied volatility,
we need to divide it by 100, so the vega of the option is 0.1894.56 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
## 2.3.4 Vega from Delta
Given that we know the delta, what is the vega? Vega and delta are
related by a simple formula described by Wystrup (2002):
Vega = Se(b —r)T n[N-1 (e(r— b)T A Di, (2.28)
where N-1 (.) is the inverted cumulative normal distribution, n(.) is
the normal density function, and A is the delta of a call or put option.
Using the vega-gamma relationship we can rewrite this relationship
to express gamma as a function of the delta
r =
e(b-r)Triusi-i (efr-bv- IAD]
scr„,/7
(2.29)
Relationships, such as those above, between delta and other option
sensitivities are particularly useful in the FX options markets, where
one often considers a particular delta rather than a strike.
## 2.3.5 VegaP
The traditional textbook vega measures the dollar change in
the option price for a percentage point change in volatility. When you
are comparing the vega risk of options on different assets, it makes
more sense to look at percentage changes in volatility. This metric
can be constructed simply by multiplying the standard vega with
which gives what is known as vegaP (percentage change in option
price for a 10-percent change in volatility):
VegaP = TaoSe(b—r)T n(di)„,77 0
(2.30)
VegaP attains its global maximum at the same asset price and time as
for vega. Some options systems use traditional textbook vega, while
others use vegaP.
When you are comparing vegas for options with different matu-
rities (calendar spreads), it makes more sense to look at some kind
of weighted vega, or alternatively, vega bucketing, 9 because short-
term implied volatilities are typically more volatile than long-term
implied volatilities. Several options systems implement some type of
vega weighting described later in this chapter or vega bucketing. See
Haug (1993) and Taleb (1997) for more details.
9Vega bucketing simply refers to dividing the vega risk into time buckets.n.45
0.40
. 0.35
0.30
0.25
0.20
0.15
0.10
0.05
10.00
•-0.05 266
2.3. VEGA GREEKS 57
## 2.3.6 Vega Leverage, Vega Elasticity
The percentage change in option value with respect to percentage
point change in volatility is given by
VegaLeverage„ll = Vega— >0 (2.31)
—
VegaLevera,geput = Vega— > 0 (2.32)
put —
The vega elasticity is highest for out-of-the-money options.
Figure 17 illustrates the vega leverage of a put option.
## 2.3.7 DvegaDvol, Vomma
DvegaDvol (aka vega convexity, vomma; see Webb, 1999, or Volga) is
the sensitivity of vega to changes in implied volatility. Together with
DgammaDvol, vomma is in my view one of the most important Greeks.
30
FIGURE 17 Vega leverage put option: X = 100, r = 5%, b =0%,
o = 60%.58 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
DvegaDvol is given by
a2c. a2p
DvegaDvol
(di (/2)
=Vega < > 0 8,2 aa2
For practical purposes, where one "typically" wants to look at vomma
for the change of one percentage point in the volatility, one should
divide vomma by 10,000.
In case of DvegaPDvol, we have
(di d2
DvegaPDvol = VegaP < > 0 __
a
(2.34)
Options far out-of-the-money have the highest vomma. More
precisely, given the strike price, vomma is positive outside the interval
(SL = ,(_a2 /2)T ,
Su Xe (-6+0•2/2)T )
Given the asset price, the vomma is positive outside the interval
(XL = Se(b—`72/2)T xu
— Se(b±a2 /2)T )
Notice that this is relevant only before conducting the trade.
If you are long options, you typically want to have as high a positive
DvegaDvol as possible. If short options, you typically want negative
DvegaDvol. Positive DvegaDvol tells you that you will earn more for
every percentage point increase in volatility, and if implied volatility
is falling, you will lose less and less—that is, you have positive vega
convexity.
While DgammaDvol is most relevant for the volatility of the
actual volatility of the underlying asset, DvegaDvol is more relevant
for the volatility of the implied volatility. Although the volatility of
implied volatility and the volatility of actual volatility will typically
have high correlation, this is not always the case. DgammaDvol is rele-
vant for traditional dynamic delta hedging under stochastic volatility.
DvegaDvol trading has little to do with traditional dynamic delta
hedging. DvegaDvol trading is a bet on changes on the price (i.e.,
changes in implied volatility) for uncertainty in supply and demand,
stochastic actual volatility (remember, this is correlated to implied
volatility), jumps and any other model risk, and factors that affect the
option price but that are not taken into account in the BSM formula.
A DvegaDvol trader does not necessarily need to identify the exact
reason for the implied volatility to change. If you think the implied
volatility will be volatile in the short term, you should typically try
to find options with high DvegaDvol. Figure 18 shows the graph of
DvegaDvol for changes in asset price and time to maturity.
(2.33)CO 1.0 co CO
IC)
0
Lc)
00
CO C7)
0.016
0.014'
0.012
0 01
0.008
0 006-,
0 004
0 002-
Asset price
cc CD CO
CD
2.3. VEGA GREEKS 59
FIGURE 18 DvegaDvol: X = 100, r =5%, b =0%, a = 20%.
Example
Consider a put option with nine months to expiration and strike 130
on a futures contract trading at 90, and assume moreover the nine-
month risk-free interest rate is 5% and volatility is 28%. What is
the DvegaDvol/vomma and also the vommaP? With S = 90, X = 130,
T = 0.75, r = 0.05, b 0, and a = 0.28, we have
In (90/130) + 0.282/2 x 0.75
di = = —1.3952
0.28‘s/0.75
d2 = di — viT = —1.3952 — 0.28N/0.75 = —1.6377
n (d I) = n (- 1.3952) =0.1507
Vega /1 = 90e 005075—
0.05)0.75 x 0.1507./0.75 = 11.3158
a2c a2 p 1.3952 x —1.6377)
DvegaDvo1 = — = = 11.3158 = 92.34 80,2 44
0.2803 03 CO
0-)
03
0
o
Asset price
-0.0001
-0.0002
-0.0003:
-0 0004
-0.0005
-0.0006.
-0 0007
320
256
192
Days to maturity
128
65
60 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
For every percentage point increase (decrease) in implied volatility,
the vega of the option will increase (decrease) by = 0.0092—that
is, we have a positive DvegaDvol/vomma. The DvegaPDvol is given
simply by
0.28
—
a
DvegaDvol = x 92.3444 = 2.5856
10 10
## 2.3.8 DvonunaDvol, Ultima
The vomma's sensitivity to a change in volatility (ultima) is given by
a3c a3p
aa3 aa3
a2c di d2
— — -- Ta (did2 — —1 (T2 611
d1 "2 ,)
= Vomma (—
_
a
) d2 — 7 - di I (2.35)
To get this sensitivity in the metric of a one volatility point move, we
have to divide it by 1,000,000.
Figure 19 illustrates DvommaDvol.
FIGURE 19 DvommaDvol: X = 100, r =5%, b = 5%, a = 30%.50
CO
qr. 0
. 334
286
239
## 192 Days to maturity
! 145
97
Cr) cO
c0 CO CO C)
N N cO Nt co
—
Asset price
LC)
CO
2.3. VEGA GREEKS 61
## 2.3.9 DvegaDtime
DvegaDtime is the change in vega with respect to changes in time.
Since we typically are looking at decreasing time to maturity, we
express this as minus the partial derivative
aVega bdi 1 +dic/2)
DvegaDtime = = Vega (r b <> 0
8 T cr,./T 2T
(2.36)
For practical purposes, where one typically wants to express the
sensitivity for a one percentage point change in volatility to a one-
day change in time, one should divide the DVegaDtime by 36500, or
25200 if you look at trading days only. Figure 20 illustrates DVegaD-
time. Figure 21 shows DvegaDtime for a wider range of parameters
FIGURE 20 DvegaDtime: X = 100, r =5%, b = 0%, a = 50%.5450
4625
3800
## 2975 Days to maturity
2150
1325
500
CO
CO
CD
0,1
CN1 CD
CO
CD
CV
N- CO C)
0.0001
-0.0005
,cr
62 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Asset price
FIGURE 21 DvegaDtime: X = 100, r = 12%, b = 0%, o - = 12%.
and a lower implied volatility. As expected from Figure 15, we can
here see that DvegaDtime can be positive.
2.4 VARIANCE GREEKS
Instead of looking at partial derivatives with respect to the volatil-
ity g, we can look at the sensitivity with respect to the variance
V = o-2. These sensitivities play a part in several stochastic volatil-
ity models—for instance, Hull and White (1987) and Hull and White
(1988), covered in Chapter 6: "Black-Scholes-Merton Alternatives."
## 2.4.1 Variance Vega
Variance vega is the BSM formula's sensitivity to a small change in
the variance of the underlying assets' instantaneous rate of return.2.4. VARIANCE GREEKS 63
Assume the variance is given by V ( V = cr2)
../7
a ac = :P v = Sen(di ) ,_ =Se(b—r)T n(do ../7 > 0
2 V ,/ 2a '
v
where
d
ln(S IX) + (b + V/2)T ln(S IX) + (b + a2/2)T
1— —
The variance vega is simply equal to the standard vega divided by 2cr..
## 2.4.2 DdeltaDvar
DdeltaDvar is the change in delta for a change in the variance
(variance vanna)
a2c 82p P = se(19—r)T n (di) d2
a sav a sav 2V
= _se(b—r)Tn(di) d2
2cr2
## 2.4.3 Variance Vomma
Variance vomma is the variance vega's sensitivity to a small change
in the variance.
n(d1)(did2 — 1)
av2 = 41/3/2
se(b—r)T N/T-
= n(d1)(d1d2 — 1)
4cr3
## 2.4.4 Variance Ultima
Variance ultima is the BSM formulas' third derivative with respect to
variance.
83c Se(b—r)T
8 v5/
2N/T
av3
= n (di )[(//1 c/2 — 1)(did2 — 3) — (cif + din
se(b-r)TN/T
=
8a5
n(di)Rd id2 — 1)(did2 — 3) — (cif + 4)] (2.40)
(2.37)
(2.38)
82c se(b—r)T,./f
(2.39)64 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
2.5 VOLATILITY - TIME GREEKS
What if we want to look at the sensitivity of the Black-Scholes-Merton
formula with respect to a change in volatility-time, Q, defined as
Q = a /—the standard deviation of the rate of return of the under-
lying asset over a time period T? Assuming zero cost-of-carry and zero
interest rate yields
ac
Vega' -- = Sn(cli),
where
ln(S I X) + Q2/2 ln(S IX) + T o-2 12
d1= _
2.6 THETA GREEKS
## 2.6.1 Theta
Theta is the option's sensitivity to a small change in time to maturity.
As time to maturity decreases, 10 it is common to express theta as
minus the partial derivative with respect to time.
Call
ac Se(b— r)Tn(di)a
2,5
(b — r)Se (b—r)T = = N(di) Ocall — .W,
— rXe—rT N(d2) '5.' 0 (2.41)
Put
ap se(b—r)T n(di)0.
()put = --
aT
= + 0 - ose(b-r)T N(-di)
2,5'
+ rXe—rT N(—d2) <> 0 (2.42)
Figures 22 and 23 graph the theta of, respectively, a call and put
option.
10This is in contrast to the other option sensitivities where the underlying variable
can move in either direction, see also Draper (1721).170 Days to maturity
117
63
CO
C)
1 0
in co
co
00 0 0)
C70 CO
2.6. THETA GREEKS 65
Asset price
FIGURE 22 Theta call option: X = 100, r = 5%, b = 5%, a = 30%.
Example
Consider a European put option on a stock index currently priced at
430. The strike price is 405, the time to expiration is one month, the
risk-free interest rate is 7% per year, the dividend yield is 5% per
year, and the volatility is 20% per year. S -- 430, X = 405, T = 0.0833,
r = 0.07, b = 0.07 — 0.05 = 0.02, and a = 0.2 yields
[n(430/405) + (0.02 -I- 0.22/2)0.0833
di = = 1.0952
0.2N/0.0833
d2 = I 0952 — 0.2"s/0.0833 = 1.0375
1 no
it (di ) = n(1.0952) = e— ''-'5`214 =0.2190
,N/Yr0.0200
0.0000:
-0.0200'
-0.0400.
-0.0600
-0.0800
-0.1000
op
330
276
223
## 170 Days to maturity
117
63
Oput =--
2A/0.0833
—430e(0.02-0.07)0.0833n (di )0.2
66 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
‘:r Cc)
LU CO
ol
op c.)
CO co
10
Asset price
FIGURE 23 Theta put option: X = 100, r =5%, b = 5%, a =30%,
N (—di) = N (-1.0952) = 0.1367 N (—d2) = N(-1.0375) = 0.1498
-I- (0.02— 0.07)430e (0.02-0.07)0.0833 N (—d
— 0.07 x 0.0833 N
+ 0.07 x 405e (—di) =- —31.1924
Theta for a one-day time decay is thus —31.1924/365 = —0.0855
Driftless Theta
In practice, it is often also of interest to know the driftless theta,
9, which measures time decay without taking into account the drift
of the underlying or discounting. The driftless theta thereby isolates
the effect time decay has on uncertainty, assuming constant volatility.72 -0 1000-
co CO
C7,
CNI 10 - 7--
0
LO co
(O
co c)
• 7
-
—
-
o 0.) 11) co w
CO
CD
0.0000
-0.0100-
-0 0200.
-0.0300-
-0.0400
-0,0500
-0.0600.
-0.0700
-0.0800.
-0.0900'
## 196 Days to
134 maturity
2.6. THETA GREEKS 67
Uncertainty affects the option through both time and volatility, since
the latter is a measure of uncertainty during an infinitesimal time
period. We have
Sn(d )0-
°call = Oput = 6 = < 0 (2.43)
Figure 24 graphs the driftless theta of an option.
Asset price
FIGURE 24 Driftless theta: X = 100, r =0%, b =0%, o = 30%.
Example
What is the driftless theta with the same input parameters as in
the theta example above? With S = 430, X = 405, T = 0.0833, r =0.07,
b = 0.07 — 0.05 = 0.02, and a =0.2, we get
1n(430/405) + (0.02 + 0.22/2)0.0833
d _ = 1.0952
0.2-,70.083368 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
n(c11) = n(1.0952) = 1 27.e-1.09522/2 = 0.2190
430 x 0.2190 x 0.2
Ocall = Oput = 0 =
2V0.0833
=-- 32.4862
32.4862
For a one-day move, the driftless theta is - 365 — —0.0890.
## 2.6.2 Theta Symmetry
In the case of driftless theta for options with different strikes, we have
the following symmetry that holds for puts and calls:
X S2
O(S, X, T, 0, 0, a) == —0 (s —,T, 0, 0, a
S X
(2.44)
Theta-Vega Relationship
Vega and driftless theta have the simple relationship:
Vega x a
9 =
2T
Bleed-Offset Volatility
A more practical relationship between theta and vega is what is known
as bleed-offset volatility. It measures how much the volatility must
increase to offset the theta-bleed/time decay. Bleed-offset volatility
can be found simply by dividing the one-day theta by vega, . In the
case of positive theta, you can actually have negative offset volatility.
Deep-in-the-money European options can have positive theta, and in
this case the offset volatility will be negative.
Theta-Gamma Relationship
There is a simple relationship between driftless gamma and driftless
theta:
—29
=
S2a2
2.7 RHO GREEKS
## 2.7.1 Rho
Rho is the option's sensitivity to small changes in the risk-free interest
rate.0.9000
0.8000
0.7000
0.6000
.0.5000
.0.4000
0.3000
0.2000
0.1000
Days to
maturity
2.7. RHO GREEKS
Call
ac
Pcalt = — lAe
—rT
N(d2):--- 0
Figure 25 graphs the rho of a call option. In the case of an option
on a futures, we have
ac
Pcall == —TC <0
ar
Figure 26 graphs the rho of a call option on a futures contract.
Put
ap
Pput = = — TXe —rT N ( —d2) <0 (2.47)
69
(2.45)
(2.46)
FIGURE 25 Rho call option: X = 100, r =5%, b = 5%, a = 30%.70 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
0.0500
0.0000-
-0.0500
-0.1000
-0.1500
-0.2000
-0.2500
-0.3000
-0.3500
-0 4000
-0.4500
CO
Co
CO
LU
CO
Days to maturity
Co
Co
Co
Asset price
Co 0
Co ‘zr
FIGURE 26 Rho call option on futures: X = 100, r 5%, b =0%,
0 = 30%.
Figure 27 graphs the rho of a put option. In the case of an option
on a futures, we have
ac
PPut = —7.1) <
Figure 28 graphs the rho of a put option on a futures contract.
Example
Consider a European call option on a stock currently priced at 72.
The strike price is 75, the time to expiration is one year, the risk-free
interest rate is 9% per year and the volatility is 19% per year. Thus,
S = 72, X = 75, T = 1, r = 0.09, b = 0.09, a =0.19, and
1(1(72/75) + (0.09 — 0.19 2/2)1
d2= =0.1638
0.19„/T
N(c12) = N(0.1638) = 0.5651
Pcall = I
x 75,, -0.09x I N(d2) = 38.7325
(2.48)0.00001
-0.1000
-0.2000
-0.3000-
-0.4000
-0.5000
-0.6000'
-0.7000
-0 8000-
-0.9000
-1.0000-
c)
al 0
50
CsJ LLI
Cn CO
2.7. RHO GREEKS 71
FIGURE 27 Rho put option: X = 100, r = 5%, b = 5%,a = 30%.
If the risk-free interest rate goes from 9% to 10%, the call price will
thus increase by approximately 0.3873.
2.7.2 Phi/Rho- 2
Phi (also known as rho-2) is the option's sensitivity to a change in the
dividend yield, or the foreign interest rate in the case of a currency
option. For a call it is given by
0c
'call —
_Tse(b--r)TN(di) < 0, `Tr q
and for a put option we have
ap
PL
—r)T N(_di) > 0 cl) — =TSe(b
(2.49)
(2.50)Asset price
CD
CD
CO
co
CO
C\I
CO
Days to maturity
co
0.0500
-0.0000
-0.0500
-0.1000
-0.1500
-0.2000
-0.2500
-0:3000
-0.3500
-0.4000
-0.4500
-0.5000
L()
CO
72 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
FIGURE 28 Rho put option on futures: X = 100, r =5%, b = 0%,
= 30%.
As discussed in the presentation of the BSM formula (Chapter 1), the
dividend yield or foreign interest rate enters the equation indirectly
through b.
Figures 29 and 30 graph the phi/rho-2 for, respectively, a call and
a put option.
Example
Consider a put option on a stock index currently trading at 733, with
six months to expiration, a strike price of 453, a dividend yield of
7.68%, a volatility of the index of 28%, and a risk-free rate of 10.68%.
What is the sensitivity of the option to a one-percentage-point change
in the dividend yield? With S = 733, X = 453, T = 0.5, r =0.1068,
b = 0.1068 — 0.0768 = 0.03, and cr = 0.28, we get
, In(733/453) + (0.03 + 0.282/2)0.5
a =_- 2.6055
0.28N/0.5
N(-611)= N(-2.6055) = 0.0046I IGURE 29•i ca oI tion: X= 100, r = 5%, b = 4%, = 30%
ost-of- arr a
A
c4-1CO
0 CO
cc
(3)
co
CO c0 cc CO 0
CO LO Lc)
74 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
0.6000
0.5000
0.4000
0.3000
0.2000
(1.1000
365
294
223
41k
i541%44rOA44184
mialltillii -111
155-stkii1:04:0100,°0-81
smnissanita
— n. —
..,
0
0.40:4141,1111
7.10!goll 0000-
---
o
tco v-
‘"-
Days to
152 maturity
81
10
Asset price
FIGURE 30 Phi put option: X = 100, r =5%, b =4%, a =30%.
Cost-of-Carry Put
ab
= -TSe(b-r)T N (-di) < 0 (2.52)
Figures 31 and 32 graph the sensitivity to change in carry for,
respectively, a call and a put option.
Example
What is the sensitivity to cost-of-carry for a put option on a stock index
with a current price of 500, three months to expiration, a strike price
of 490, a risk-free interest rate of 8% per year, a dividend yield of 5%
per year, and a volatility of 15% per year? S = 500, X = 490, T = 0.25,
r =0.08, b = 0.08 — 0.05 = 0.03, o- = 0.15, and thus
ln(500/490) + (0.03 + 0.152/2)0.25
di = = 0.4069
0.15,N/0.25
N(-di) -= N(-0.4069) = 0.34210.0000
-0.1000
-0.2000
-0.3000
-0.4000
-0.5000
-D.6000
07) r- ,- LO CO
00 CO
C3)
CN L() Nt
Days to maturity o C CO LO
co up
Co
Asset price
70
50
2.8. PROBABILITY GREEKS 75
FIGURE 31 Carry call option: X = 100, r =5%, b = 4%, cr = 30%.
ap
- -0.25 x 500e(003-00810•25 N(-d1) - -42.2254
For a one-percentage-point sensitivity, we have to divide this by 100.
If the cost-of-carry should increase from 3% to 4%, then the option
value will fall by approximately —0.4223.
2.8 PROBABILITY GREEKS
In this section we look at risk-neutral probabilities in relation to the
BSM formula. Keep in mind that such risk-adjusted probabilities
could be very different from real-world probabilities. 11
## 11 Risk-neutral probabilities are simply real-world probabilities that have been
adjusted for risk. It is therefore not necessary to adjust for risk also in the dis-
count factor for cash flows. This makes it valid to compute market prices as simple
expectations of cash flows, with the risk-adjusted probabilities, discounted at the
riskless interest rate—hence the common name "risk-neutral" probabilities, which is
somewhat of a misnomer.- 10.0000
-01000
-0.2000
. -0.3000
-0.4000
-0.5000
Days to maturity
Asset price
CD
CO
ND
CD
76 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
FIGURE 32 Carry put option: X = 100, r = 5%, b = 4%, a = 30%.
## 2.8.1 In-the-Money Probability
In the Black and Scholes (1973)/Merton (1973) model, the risk-neutral
probability for a call option finishing in-the-money is
= N(d)) > 0 (2.53)
and for a put option
= N(—d2) > 0 (2.54)
This is the risk-neutral probability of ending up in-the-money at
maturity. It is not identical to the real-world probability of ending
up in-the-money The real probability we simply cannot extract from
options prices alone. Figures 33 and 34 graph the risk-neutral prob-
ability of ending up in-the-money for, respectively, a call and a put
option.1.0000
0.90001
0.8000
0.7000
0 6000
0.5000
0.4000
0.3000
0.2000
0.1000
[Jiys to maturity
2.8. PROBABILITY GREEKS 77
FIGURE 33 In-the-money probability call option: X =100, r = 5%,
b = 4%, a = 30%.
A related sensitivity is the strike delta, which is the partial
derivatives of the option formula with respect to the strike price
ac = _e—rT N(d2) 0
ax
aP e—rT N(_d2) 0
ax
This can be interpreted as the discounted risk-neutral probability of
ending up in-the-money (assuming you take the absolute value of the
call strike delta).
Example
Consider a put futures option with three months to expiration. The
futures price is 100, the strike price is 95, the risk-free interest rate is
8% per year, and the volatility is 12% per year. Thus, S = 100, X = 95,
(2.55)
(2.56)78 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
365
1.0000
.0.9000
.0.8000
: 0.7000
!0.6000
0.5000
0.4000
:0.3000
0.2000
'0.1000
FIGURE 34 In-the-money probability put option: X = 100, r = 5%,
b =4%, a = 30%,
T 0.25, r = 0.08, b = 0, and a = 0.12.
In(100/95) —0.25 x 0.122/2
di — =- 0.8249
0.12N/0.25
N(—d2) = N(-0.8249) = 0.2047
That is, the risk-neutral probability for the put to end up in-the-money
is about 20.47%. For a call option with the same input parameters,
the risk-neutral probability for ending up in the money at maturity is
N(d2) = N(0.8249) = 0.7953
Probability Mirror Strikes
For a put and a call to have the same risk-neutral probability of
finishing in-the-money, we can find the probability symmetric strikes
S
e(2b-o-2)T e(2b-o-2)T
Xcaii
Xput = Xcall
Xput
(2.57)2.8. PROBABILITY GREEKS 79
where Xput is the put strike and Xcall is the call strike. This naturally
reduces to N[d2(Xcall)1 = Alld2(Xput)1• A special case is Xcall = Xput, a
probability mirror straddle (probability-neutral straddle). We have
this at
Xput = Se(b—a2 /2)T
At this point the risk-neutral probability of ending up in-the-money
is 0.5 for both the put and the call. Standard puts and calls will not
have the same value at this point. The same value for a put and a call
occurs when the options are at-the-money forward, X = SbT . However,
for a cash-or-nothing option (see Chapter 4), we will also have value-
symmetry for puts and calls at the risk-neutral probability strike.
Moreover, at the probability-neutral straddle, we will also have vega
symmetry as well as zero vomma.
Strikes from Probability
Another interesting formula returns the strike of an option, given the
risk-neutral probability pi of ending up in-the-money. The strike of a
call is given by
Xc = S exp [—N -1 (Pi)0",./T (b — a 2 12)71 (2.58)
where N-1 0 is the inverse cumulative normal distribution described
in Chapter 13. The strike for a put is given by
Xp = S exp [N-1 (m)a NJ . + (b — a 2 12)71 (2.59)
## 2.8.2 DzetaDvol
Zeta's sensitivity to a small change in the implied volatility is given by
= _
n(d2) (—
di
) <> 0
a 0-
and for a put
N-put n(d2) (cA) <> 0
‘\ a )
(2.60)
(2.61)
Divide by 100 to get the associated measure for percentage point
volatility changes.80 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
## 2.8.3 DzetaDtime
The in-the-money risk-neutral probability's sensitivity to moving
closer to maturity is given by
8 caii
= n(d2)
b di
<>0 (2.62)
aT ../7 2T) –
and for a put
aput b
= n(d2) <> 0
aT o- N/7 2T) —
Divide by 365 to get the sensitivity for a one-day move.
2.8.4 Risk-Neutral Probability Density
The second-order partial derivative of the BSM formula with respect
to the strike price yields the risk-neutral probability density of the
underlying asset; see Breeden and Litzenberger (1978) (aka the strike
gamma).
82c 82p
n(d2)e—rT
RND = = = >0
ax2 ax2 xo-,/7
(2.64)
Figure 35 illustrates the risk-neutral probability density with respect
to time and asset price. With the same volatility for any asset price,
this is naturally the lognormal distribution of the asset price.
2.8.5 From in- the- Money Probability to Density
Given the in-the-money risk-neutral probability, pi, the risk-neutral
probability density is given by
(2.63)
RND —
e-rT n [N-
( n
)]
(2.65)
XaVT
where n(.) is the normal density given in Chapter 13.
## 2.8.6 Probability of Ever Getting in-the-Money
For in-the-money options the probability of ever getting in-the-money
(hitting the strike) before maturity naturally equals unity. The risk-
neutral probability for an out-of-the-money call ever getting in-the-
money is
Pc = (XIS)4+ X N (–z) ± (XI N(–z 2Ao- .5) (2.66)LC)
LC)
CO
81
,0.045
jO.04
0.035
.0 03
4.025
- ;0 02
0.015
0.005
Asset price
Lf)
2.9. GREEKS AGGREGATIONS
FIGURE 35 Risk-neutral-density: X = 100, r =5%, b = 0%, = 20%.
Similarly, the risk-neutral probability for an out-of-the-money put
ever getting in-the-money (hitting the strike) before maturity is
pp = (x/s) 4±A N(z)+ (x/s)P -AN(z - 2xasif ), (2.67)
where
ln(X/S) b — a2 /2 2r
0 2 crAii " a 2
This is equal to the barrier hit probability used for computing the
value of a rebate, developed by Reiner and Rubinstein (1991a),
described in Chapter 4. Alternatively, the probability of ever getting
in-the-money before maturity can be calculated in a very simple way
in a binomial tree, using Brownian bridge probabilities.
2.9 GREEKS AGGREGATIONS
When adding up option sensitivities from different options, we must
be careful. In the case of options on the same underlying asset, we82 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
can typically add together the deltas and gammas and thetas. When
it comes to any sensitivity related to volatility, we must also be
careful, because implied volatilities from options with different matu-
rities do not move parallel; in general, short-term volatilities tend to
move much more around than long-term volatilities. Most experienced
traders for this reason use some type of weighting of the vega. The
same is true with anything related to sensitivities to interest-rate
moves; for this reason, one also needs to do similar weighting for rho
and phi.
## 2.9.1 Net Weighted Vega Exposure
In the formula for net weighted vega, Haug (1993) takes into account
the fact that the term structure of volatility does not shift in a parallel
fashion. This can be useful when adding the vega risk of a portfolio of
options on the same underlying security where the time to maturity
of the options differ.
m n
NWV = E EQi,Tvegai Pa (T),a(R) , (2.68)
T=1 i=1
where
m = Number of different maturities in the option portfolio.
n = Number of different strikes with time to maturity T.
vega,,T =Vega value of an option with strike i and time to
maturity T.
=Number or quantity of options in the portfolio with
vega i, T .
1 =Volatility of volatility with time to maturity T.
4IR= Volatility of reference volatility.
Pa (T),a (R) = Correlation between the volatility with time to
maturity T and the reference volatility.
Example
Let us assume that we own the portfolio shown in Table 2-2. How
will the portfolio react to shifts in the term structure of volatility? To
calculate NWV, we need estimates of future volatility of volatilities
with different maturities, and correlation coefficients between differ-
ent volatilities. We chose a reference volatility equal to the volatility of
the option with the longest time to maturity, that is, 120-day volatility
today, 119-day volatility tomorrow, and so on. Assume we have calcu-
lated the following historical volatilities of volatilities: 6.5 percentage
points 30-day, 5.5 percentage points 60-day, 4.0 percentage points2.9. GREEKS AGGREGATIONS 83
TABLE 2-2
Option Portfolio
(S = 100, a =0.25, r =0.1, b =0.1)
Days to maturity 120 60 60 30
Strike 105.00 85.00 100.00 100.00
Call price 4.99 16.53 4.88 3.27
Vega 22.86 3.11 15.81 11.31
Number of contracts 450 100 -400 -300
Volatility of volatility 4.00% 5.50% 5.50% 6.50%
Correlation coefficients 1.00 0.85 0.85 0.65
Espen Gaarder Haug, "Opportunities and Perils of Using Option Sensitivities,"
Journal of Financial Engineering,vol. 2, no. 3, September 1993. Used by
permission.
120-day, and correlation coefficients of 0.65 between 30-day volatility
and the reference volatility (120-day), 0.85 for the 60-day volatil-
ity and, naturally, 1.0 between 120-day volatility and the reference
volatility. It follows that II/1 = 6.5, = 5.5, 1P3 -= 4.0, 'PR = 4.0, PLR =
0.65, ,02,R = 0.85, ,03,R = 1.0.
M It
/WV = E EQi,T vegai, T - Pa(T),a(R)
4112
T=1 i=1
= -300 x 11.31 x -
6.5
x 0.65 - 400 x 15.81 x -
5.5
x 0.85
4.0 4.0
4.0
100 x 3.11 x -
5.5
x 0.85 450 x 22.86 x - x 1.0
4.0 4.0
= -324.55
Hence, for each percentage point rise in the reference volatility (120-
day), we will lose approximately $325.
Application
Several investment banks and commercial derivatives software sys-
tems use some form of weighted vega measure. There are several
variants of how to compute the weighted measure, some preferring to
use weights based on historical data, others preferring to specify their
own subjective weights based on their expectations. Taleb (1997) also
describes several ways to calculate weighted vega.84 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
2.10 AT-THE-MONEY FORWARD APPROXIMATIONS
The at-the-money forward approximations published by Brenner and
Subrahmanyam (1994) can be used for options that are at-the-money
forward. To be at-the-money forward is defined as S = X e-bT or
X = Se/IT = F (strike price equals the forward price of the underlying
asset).
## 2.10.1 Approximation of the Black-Scholes-Merton
Formula
c 0.4Se(b—r)T a -Nri" , p 0.4Se(b — r)T ,./y
(2.69)
Example
Consider a put option with three months to expiration. The futures
price is 70, the strike price is 70, the risk-free interest rate is 5% per
year, the cost-of-carry is 0%, and the volatility is 28% per year. S = 70,
X = 70, T = 0.25, r 0.05, b = 0, a =0.28, and
p 0.4 x 7Oe _ 5)T0.28iJö 3.8713
For comparison, the exact Black-76 price is 3.8579.
## 2.10.2 Delta
'can e(b-1)T (1/2 0.2a $./T), Aput e(b—
r)T (0.2a,./T — 1/2) (2.70)
## 2.10.3 Gamma
e(b—r)T 0 .4
rcaI1,put (2.71)
so-.,/T.
## 2.10.4 Vega
Vegacall Se(b—r)T 0.4../7 (2.72) ,put
## 2.10.5 Theta
Se(b—r)T 0.4a (1, vr
ecall [b(1/2 0.2a,,q) — (2.73)
2.17
Se(L -1 )T 0.40.
eput Se(b—r)T [b(112 — 0.2cx,./f) 0.4ra.../7] (2.74)
2.1T2.11. NUMERICAL GREEKS
## 2.10.6 Rho
Pcall TXe —rT (1/2 — 0.2a VT)
•
Pput
_Dce—rT (I /2 ± 0.2aVT)
For options on futures:
Pcail = —Tc
Pput = —TP
## 2.10.7 Cost-of-Carry
ac TSe(1/2 0.2c)
ab
aP —TSe (b—r)T (1 /2 —
ab
85
(2.75)
(2.76)
(2.77)
(2.78)
(2.79)
(2.80)
2.11 NUMERICAL GREEKS
So far we have looked only at analytical Greeks. A frequently used
alternative is to use numerical Greeks, also known as finite difference
approximations. One of the main strength of numerical Greeks is that
their computation is independent of the model under consideration.
The finite difference approximation will give us the Greeks we need
as long as we have an accurate model to compute the value of the
derivative.
2.11.1 First- Order Greeks
First-order partial derivatives, a--ra 4 ) , can be approximated by the two-
sided finite difference method:
cs + S. X, T, r, b, a) — c(S — AS, X, T, r, b, a)
2AS
In the case of derivatives with respect to time, we know what direc-
tion time will move and it is more accurate (for what is happening
in the "real" world) to use a backward derivative (a one-sided finite
difference):
c(S, X, T, r, b, a) — c(S, X, T — AT, r, b, a)
0 —
AT
(2.81)
(2.82)call--='
2AS
c(S + AS, X, T, r, b, o-i) — c(S — AS, X, T, r, b, a2)
(2.83)
86 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Numerical Greeks have several advantages over analytical ones.
If, for instance, we have a sticky delta volatility smile, then we can
change the volatilities accordingly when calculating the numerical
delta. (We have a sticky delta volatility smile when the shape of the
volatility smile sticks to the deltas but not to the strike; in other words,
the volatility for a given strike will move as the underlying moves.)
Numerical Greeks are moreover model-independent, while the ana-
lytical Greeks presented above are specific to the BSM model.
2.11.2 Second- Order Greeks
For gamma and other second-order derivatives' ax282 f(x) , (for example,
gamma or DvegaDvol), we can use the central finite difference method:
AS2
If the option is very close to maturity (a few hours) and approximately
at-the-money, the analytical gamma can approach oo, which is natu-
rally an illusion of your real risk. The reason is simply that analytical
partial derivatives are accurate only for infinite small changes, while
in practice one sees only discrete changes. The numerical gamma
solves this problem and offers a more accurate gamma in these cases.
This is particularly true with regard to barrier options; see Taleb
(1997).
## 2.11.3 Third-Order Greeks
a3f (x)
For speed and other third-order derivatives, , we can, for
example, use the following approximation:
1
Speed --:,'
AS3
[c(S ± 2AS, ...) — 3c(S + AS, . . .)
(2.84)
+ 3c(S, . . .) — c(S — AS, . ..)1 (2.85)2.11. NUMERICAL GREEKS 87
## 2.11.4 Mixed Greeks
What about mixed derivatives, af ax (xa';) , for example, DdeltaDvol and
charm? These can be calculated numerically by
DdeltaDvol
4ASAa
x [c(S + AS, . . , a + Aa) — c(S + AS, . , a — Aa)
— c(S — AS, . ,a + Acr) + c(S — AS, . , a — Aa)] (2.86)
In the case of DdeltaDvol, one would typically divide it by 100 to get
the "right" notation—that is, for a one-point change in volatility.
2.11.5 Third-Order Mixed Greeks
In the case of Greeks like DgammaDvol, we need the third-order
mixed Greek 83f(xJ)• ax 2 By •
DgammaDvol
2Aa AS2
x rc(S + AS, . , a ± Aa) — 2c(S, , a ± Aa)
c(S — AS, . , a ± Aa) — c(S + AS, . , a — Acr)
2c(S, , a — Aa) — c(S — AS, . , a — Aa)] (2.87)
In the case of DgammaDvol, one would again typically divide it by
100 to get the "right" notation.
Computer algorithm
The code below illustrates how to use numerical Greeks to calculate
the sensitivities of the Black-Scholes-Merton formula. The dS variable
is equivalent to AS in the formulas above. The user can supply its
value or let it default to 0.01. The function calls the GBlackScholes(.)
algorithm described in Chapter 1.
Function GBlackScholesNGreeks(OutPutFlag As String, CallPutFlag As string, _
S As Double, X As Double, T As Double, r As Double, b As Double, _
v As Double, Optional dS)
If IsMissing(dS) Then
dS = 0.01
End If
If OutPutFlag = "p" Then ' Value
GBlackScholesNGreeks = GBlackScholes(CallPutFlag , S, X, T, r, b, v)
ElseIf OutPutFlag = "d" Then 'Delta88 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S + dS , X, T, r, b, v) _
— GBlackScholes (CallPutFlag , S — dS, X, T, r, b, v)) / (2 * dS)
ElseIf OutPutFlag = "e" Then 'Elasticity
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S + dS , X, T, r, b, v) _
— GBlackScholes ( CallPutFlag , S — dS, X, T, r, b, v)) / (2 * dS) _
* S / GBlackScholes ( CallPutFlag , S, X, T, r, b, v)
ElseIf OutPutFlag = "g" Then 'Gamma
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S + dS, X, T, r, b, v) _
— 2 * GBlackScholes ( CallPutFlag , S, X, T, r, b, v) _
+ GBlackScholes(CallPutFlag , S — dS, X, T, r, b, v)) / dS^2
ElseIf OutPutFlag = "gv " Then 'DGammaDVol
GBlackScholesNGreeks = (GBlackScholes ( CallPutFlag , S + dS, X, T, r, b, v + 0.01) _
_
_
/ (2 * 0.01 * dS" 2) / 100
ElseIf OutPutFlag = "gp" Then 'GammaP
GBlackScholesNGreeks = S / 100 * ( GBlackScholes ( CallPutFlag , _
S + dS, X, T, r, b, v) — 2 * GBlackScholes ( CallPutFlag , S, X, T, r, b, v)
+ GBlackScholes ( CallPutFlag , S — dS , X, T, r, b, v)) / dSA2
ElseIf OutPutFlag = "dddu" Then 'DDeltaDuol
GBlackScholesNGreeks = 1 / (4 * dS * 0.01) _
* ( GBlackScholes ( CallPutFlag , S + dS , X, T, r, b, v + 0.01) _
— GBlackScholes ( CallPutFlag , S + dS , X, T, r, b, v — 0.01) _
— GBlackScholes ( CallPutFlag , S — dS , X, T, r, b, v + 0.01) _
+ GBlackScholes (CallPutFlag , S dS , X, T, r, b, v — 0.01)) / 100
ElseIf OutPutFlag = u' Then 'Vega
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r, b, v + 0.01) _
— GBlackScholes ( CallPutFlag , 5, X, T, r, b, v — 0.01)) / 2
ElseIf OutPutFlag = "uu" Then 'DuegaDuolluomma
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r, b, v + 0.01) _
— 2 * GBlackScholes ( CallPutFlag , S, X, T, r, b, v) _
+ GBlackScholes ( CallPutFlag , 5, X, T, r, b, v — 0.01)) / 0.012 / 10000
E Ise If OutPutFlag = "up" Then 'VegaP
GBlackScholesNGreeks = v / 0.1 _
* ( GBlackScholes ( CallPutFlag , S, X, T, r, b, v + 0.01) _
— GBlackScholes ( CallPutFlag , S, X, T, r, b, v — 0.01)) / 2
ElseIf OutPutFlag = "dudu" Then 'DuegaDuol
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r, b, v + 0.01) _
— 2 * GBlackScholes ( CallPutFlag , S, X, T, r, b, v) _
+ GBlackScholes ( CallPutFlag , S, X, T, r, b, v — 0.01))
ElseIf OutPutFlag = "t" Then 'Theta
If T <= 1 / 365 Then
GBlackScholesNGreeks = GBlackScholes ( CallPutFlag , S, X, le-05, r, b, v) _
— GBlackScholes (CallPutFlag , S, X, T, r, b, v)
Else
GBlackScholesNGreeks = GBlackScholes ( CallPutFlag , S, X, T — 1 / 365, r, b, v) _
— GBlackScholes ( CallPutFlag , S, X, T, r, b, v)
End If
ElseIf OutPutFlag = 'r' Then 'Rho
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r + 0.01 , b + 0.01 , v) _
— GBlackScholes ( CallPutFlag , 5, X, T, r — 0.01 , b — 0.01 , v)) / (2)
E Ise If OutPutFlag = "fr" Then 'Futures options rho
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r + 0.01 , b, v) _
— GBlackScholes ( CallPutFlag , S, X, T, r — 0.01 , b, v)) / (2)
ElseIf OutPutFlag = "f" Then 'Rho2
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r, b — 0.01 , v) _
— GBlackScholes ( CallPutFlag , 5, X, T, r, b + 0.01 , v)) / (2)
ElseIf OutPutFlag = "b" Then 'Carry
GBlackScholesNGreeks = ( GBlackScholes ( CallPutFlag , S, X, T, r, b + 0.01 , v) _
— GBlackScholes ( CallPutFlag , S, X, T, r, b — 0.01 , v)) / (2)
ElseIf OutPutFlag = "s" Then 'Speed
GBlackScholesNGreeks = 1 / dSA3 _
* (GBlackScholes( CallPutFlag , S + 2 * dS , X, T, r, b, v) —
— 2 * GBlackScholes (CallPutFlag , S, X, T, r, b, v + 0.01) _
+ GBlackScholes ( CallPutFlag , S — dS, X,
— GBlackScholes ( CallPutFlag , S + dS,
T,
X,
r,
T,
b,
r,
v + 0.01) _
b, v — 0.01)
+ 2 * GBlackScholes ( CallPutFlag , S, X, T, r, b, v — 0.01) _
— GBlackScholes ( CallPutFlag , S — dS , X, T, r, b, v — 0.01))2.12. GREEKS FROM CLOSED-FORM APPROXIMATIONS 89
TABLE 2-3
(S = 98, X = 100, T = 0.25, r = 0.1, b =0.05, a = 0.3)
Analytical Numerical
Delta A 0.503105 0.503105
Elasticity 9.059951 9.059951
Gamma l' 0.026794 0.026794
DGammaDvol -0.000896 -0.000897
GammaP l'p 0.026258 0.026258
Vega 0.192999 0.192999
DvegaDvol -0.000019 -0.000019
VegaP 0.578998 0.578997
Theta 0 (1 day) -0.036989 -0.037080
Rho p 0.109656 0.109655
Rho futures option -0.012124 -0.012124
Phi/Rho2 -0.123261 -0.123262
Carry Rho 0.123261 0.123262
DDeltaDvol 0.001659 0.001660
Strike delta -0.438623 -0.438623
Speed -0.000317 -0.000317
Risk Neutral Density 0.025733 0.025733
- 3 * GBlackScholes(CallPutFlag, S + dS, X, T, r, b, v) _
+ 3 * GBlackScholes(CallPutFlag , S, X, T, r, b, v) _
- GBlackScholes(CallPutFlag , S - dS, X, T, r, b, v))
ElseIf OutPutFlag = "dx" Then 'Strike Delta
GBlackScholesNGreeks = (GBlackScholes(CallPutFlag , S, X + dS, T, r, b, v) _
- GBlackScholes(CallPutFlag , S, X - dS, T, r, b, v)) / (2 * dS)
ElseIf OutPutFlag = "dxdx" Then 'Gamma
GBlackScholesNGreeks = (GBlackScholes(CallPutFlag , S, X + dS, T, r, b, v) _
- 2 * GBlackScholes(CallPutFlag , S, X, T, r, b, v) _
+ GBlackScholes(CallPutFlag , S, X - dS, T, r, b, v)) / dS^2
End If
End Function
Table 2-3 shows numerical and analytical Greeks from the BSM
formula.
2.12 GREEKS FROM CLOSED-FORM
APPROXIMATIONS
Even if a closed-form approximation may be sufficiently accurate to
calculate an option price, the accuracy will generally decrease as we
move on to the Greeks. The closed-form approximation can thus be
good enough to calculate the price, but the gamma can be highly
inaccurate, and the third derivative like speed even more so.90 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
2.13 APPENDIX B: TAKING PARTIAL DERIVATIVES
This appendix shows in detail how to find some of the most common
partial derivatives of the BSM formula. In today's age of computers,
one will typically solve such partial derivatives using mathematical
software, like Mathematica or Maple. We first repeat the BSM formula
for easy reference:
c = Se—TN(di) — Xe —rT N(d2)
p = Xe—rT N(—d2)— Se (b—r)T N(—di)
ln(SI X) ± (b a2 /2)T
=
(
ln(SI X) ± (b — a2/2)T
= = di — cr,if
b = r Gives the Black and Scholes (1973) stock option
model.
b = r - q Gives the Merton (1973) stock option model with
continuous dividend yield q.
b = 0 Gives the Black (1976) futures option model.
b = 0 and r =0 Gives the Asay (1982) margined futures option
model.
b = r - rf Gives the Garman and Kohlhagen (1983) currency
option model.
The following relationships are also useful:
d2 = d1 - cvs/7
=d? —2d1cr,./T cr 2T
= df —2[1n(S/ X) + (b cr212)71+ cr2T
= df —21n(Se bT I X)
N
n(dD= —e 2
N/Yr
1 -d2
n(d2)= e 12+1n(S ebT IX)
A/Yr
1 —d2I2 1n(SebT IX) = —e e
N/Yr
= n(di)SebT 1 X2.13. APPENDIX B: TAKING PARTIAL DERIVATIVES 91
n(di) = 1 e-d212
,N/Yr
n(di) = n(d2)XISebT
Partial Derivatives
1x
N(x) =
f-oo
exp(-z2/2)dz
N/27
8N(x) ax
= n(x)—
as as
Delta
ac
call = =
as
e
(b-riT
N (di) ±
e(b-r)T mdi)
e(b-r)T A (do ±
e
(b-r)T
N(di)-1-
Se(b-r)T
a N (di)
Xe-rT
aN(d
2
)
as as
se(b_r)T a',Iwo adi
Xe-rT
amd2) adz
adi as ad2 as
ad2
(b-r)Tn(do adi — xe-rT n(d2)= se
as as
se(b—r)Tri(di adi _ Xe-rT n(di)SebT / X - ad1
as
= e(b-r)T N(di) > 0
am—do ,T aAl(—d2) am—do
e
ap
Aput = = Xe-"
as as
di) Se(b—r)T
as
ad2 m_di) 00T aas d1
= Xe-rT n(-d2) - - se —
as
= xe—rT n(—di)SebTIX w -
e(b-riTiw_ di)-1- Se -r'
iT
(b
ad] ad,
as
= -e
(b-r)T Aq_do
<0
Gamma
a2C aAcall
ae(b—r)Tmdo
'call = a Ts72 — as = as
ri(doe(b—r)T
s 047
>092 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
82 p a Aput -ae -r)TN(-di )
ut = =
P as2 as as
n(d1)e
(b—r)T
>0
SaiT
Strike
aC = Se(b—rg
aN(di)
e—rT N(d2) Xe—rT k (c
12)
ax ax ax
= Se(b-
= Se(b-
= Se(b-
07. a N (do adi
ad 1 ax
r)T adi n(cli)-- ax —
r)Tn(cli)—
adi
ax
e rT N(d2) xe—rT amd
2) ad2
ad2 ax
—rT
e N(d2) — xe—rTn(d2) 8d2
ax
adi e—rTN(d2)— Xe —rT
n(cli)Se
bT IX —
ax
= —e —rT N(d2) <0
8N(—d2)
Se (b—r)T ap rT
ax ax ax
— d2) Xe
= e—r N( —d2) Xe —rT n( d2)8d2 (b—r)T an N
ax
d
ax
—r r = e T Xe
—T n(—di)Se
bT I x _ adi seo—r)Te_d ,
ax 11 ax
e—rT N(—d2)> 0
82c
ax2
—ae—rTN(d2)
ax
n(d2)e—rT
>0
Xcx VT
82p ae—r N d2)
ax2 ax
n(d2)e—rT
>0
Xrr2.13. APPENDIX B: TAKING PARTIAL DERIVATIVES 93
Rho
Pcall =
Pc br)
= TSe(b-r)T N(di)- TSe (b-r)T N (di) ± Se(
- T aN(di)
ar Br
Txe -rT N(a ) _ Xe-rT
aN(d2)
Br
- Se(b-r)T n(dodl IXe -rT N(d2)
Br
– Xe –rTn(cli)SebT 1 X — ad'
Br
= Txe–rT N(d2) 0
Bp _ = ar Pput – — N(–d2) Xe–"
B (-d2
)
Br
- TSe(b-r)T N( - di)± TSe(b-r)T Se(b-r)T aN(-di)
Br
= -TXe-rT N(-d2) <0
For options on futures, where the cost-of-carry is zero, b = 0, we have
ac aN(di)
ar
T NW)) Se (b–r)T Pcall = — = --Tseo-r)
ar
7Xe –r N(d2) –
Xe–rT 3N(d2)
Br
–r)T MC+ Se(b = -TSe(b
-r)T n(do ad1
ar
+7Xe-rT N(d2)- Xe -rT n(cli )SebT I X ad'
ar
= -TSe(b-r)T N(di) 7Xe -rT N (d2)
= -Tc <0
ap yve T — r N(–d2)± Xe –rT
8N(—
`12)
vput – – rs-
ar
±TSe–r)T m – Se(b– _di) r)T aN(–di)
(b
ar
= -Tp <094 CHAPTER 2. BLACK-SCHOLES-MERTON GREEKS
Cost-of-Carry
ac _ Tse(b—r)TN(di) ± se(b—r)T a N (C11) Xe— rT a N (CID
ab ab ab
= Tse(b-r)T N (do + seo-oT n(di) — adl - Xe —rT n(di)SebT IX adl
ab ab
= TSe(b—r)T N (di) > 0
ap
Xe
-
—rT a Al TSe —
(-d2)r)TN(—cli) (b—r)T a N (—d1)
— (b
ab ab
se
ab
= —TSe (b—r)T N(—di) > 0
Vega
Vegacaii =
(b_r)Ta Ar(do ac
- .9-7„= Se Xe—r
T a N (d2)
ao- ao-
ad1 _ se(b-r)Tn(do _
ao-
= seo-r)Tn(d ) .9d1
1 ao-
- xe-rT n(d2) 8 8d2
cr
- xe-rT n(dosebT 1 x— ad2
r ad' _ 8d2 1
- seo-oT n(do
L ao- ao- i
= seo—r)Tn(di),./7 > o
Vega = Xe —rT S e(/_T (b—rg a N (-di)
—
ap
au au ao-
= xe-rT n(-d2)[
ad
- 2 1- se(b-r)T n(-d1)[- adi 1 ao- ao-
_ seo-oT n(do [adi _ ad2i
ao-
= seo-oT n(di)-17 > 0
adi ad2 [ ln (SebTlX) + 1 NIT,1 [ ln (SebTlX) 1 1—
—
au
— —
au
=
0-2.,5" 0-2.17 2
V d= 22.13. APPENDIX B: TAKING PARTIAL DERIVATIVES 95
Theta
ac
°call = - , = -(b - r)Se(b-r)T
mill) (b-r)T 8N(d1)
- se
aT
- rXe -rT N(d2)-1- Xe-rT
a N (di)
= -(b - r)se(b-r)TN(eli)- Se(b-r)Tn(di) adi
- rXe
-rT
N(d2) ± Xe -rT n(di)SebT I X— ad ;
[adz ad1 ]
= se(b—r)T n(d- — — —
aT aT
- (b - r)Se(b-r)T N(di)- rXe -rT N(d2)
Se(b-r)T n(di)a
(b - r)Se(b-r)T N(di)
- rXe-rT N(d2) <> 0
ap
aN(—d2) Oput =
aT
= r xe—rT m—d2) — xe —rT
aT
(b - r)Se(b-r)T N(-di)+ se(b-r)T 8N(—d1)
aT
=rxe-rT N( d2)-F - r)Se(b-r)T N(-di)
[adz adi ] (b—r)Tn(do x se
aT aT
se(b-r)Tn(di)a
(b - r)Se(b-r)T N(-di)
2../7
-FrXe-rT N(-d2)<> 0
adz adi r ln(SI X)
aT aT L 2o- T3/2
ln(SI X)
[-
2o- T 3I2
b
a
2a,5
b
a 4,5
a
2a,5
+ ]=
4,5' 2,5'CHAPTER
3
ANALYTICAL FORMULAS FOR
AMERICAN OPTIONS
Nowadays people know the price of everything, and the value of
nothing
Oscar Wilde
An American option can be exercised at any time up to its expira-
tion date. This added freedom complicates the valuation of American
options relative to their European counterparts. With a few excep-
tions, it is not possible to find an exact formula for the value of
American options. Several researchers have, however, come up with
excellent closed-form approximations. These approximations have
become especially popular because they execute quickly on computers
compared to numerical techniques. At the end of the chapter, we look
at closed-form solutions for perpetual American options.
3.1 THE BARONE-ADESI AND WHALEY
APPROXIMATION
The quadratic approximation method by Barone-Adesi and Whaley
(1987) can be used to price American call and put options on an
underlying asset with cost-of-carry rate b. When b > r,the American
call value is equal to the European call value and can then be found
by using the generalized Black-Scholes-Merton (BSM) formula. The
model is fast and accurate for most practical input values.
American Call
'
caw (S , X, T) ± A2(S I S*)q2 when S < S*
S — X when S > S* '
where cBsm(S, X, T) is the general Black-Scholes-Merton call
formula, and
s* A2 (1 e(b—r)T N[di (s*)]).
92
C(S, X. T) =
9798 CHAPTER 3. ANALYTICAL FORMULAS
ln(S I X) + (b + a2 /2)T
(S) --=
a If
–(N – 1) + 1(N – 1)2 + 4M/K
R2 =
2
N =2b1a2, K = 1 _ e– rT
American Put
PBSM(S , X, T) + A (S S**)qi
P(S, X, T) =
X – S
when S > S**
when S < S**
where pBsm(S, X, T) is the generalized BSM put option formula, and
s**
Ai = {1 e(b–r)T N (S**)11
qi
–(N – 1) – -1(N – 1) 2 ± 4M/K
ql =
2
where S* is the critical commodity price for the call option that
satisfies
S* – X = c(S* , X, T) (1 –
R2
LHS(Se) = Si – X
1
RHS(Se) = c(Se, X, T) 11 – e(b–r)T N[di(Si)])Si —
R2
This equation can be solved by using a Newton—Raphson algorithm.
The slope of RHS at Si is
aRHS e(b-r)T n n [di(si
— be = e(b—r)T [di(Si )1(1 1 / R2) ± 1
as, ,ff q2
Given an initial value Si, it follows directly from the Newton-
Raphson method that the next and better estimate, S i+i , is
[X – RHS(Se) – be Se]
(1 – be)
The iterative procedure should continue until the relative absolute
error falls within an acceptable tolerance level. For instance:
– RHS(S i )II X < 0.00001,
M =2r1a2,3.1. BARONE-ADESI AND WHALEY APPROXIMATION 99
and S** is the critical commodity price for the put option that satisfies
X — S ** = p(S** , X, T) — {1 e(b—r)T Nr_di(S**]]}S**
1
qi
VS(Si) = X — Si
HS(S1) = p(Sj, X, T) — {1 — e(h—r)T N[—d1(Si)])Sj*
pHs
as;
= b = _e(b—r)T — r_ [ cli(Sj)](1 — 1Iq]) — 1 +
e(b—r)T n[___
(Sj)]
ql
[X — HS(Sj) b151]
S j+] =
(1 + b1)
As always with the use of the Newton—Raphson method, we need
a seed value. Barone-Adesi and Whaley suggest using
= X ± [S* (co) — X][1 — e h2 ] 112 = —(bT 2o-,5) 15,*(c0 X ) x
Sr = 5** (co) + [X — S** ()]e h] = (bT — 2a-17)[ x s x ** (00) ],
where S(a)) is the critical price when time to expiration is infinite:
S* (co) =
1 — 2[—(N — 1) ± \ AN — 1) 2 ± 4M]-1
X
1 — 2[—(N — 1) — ,AN — 1) 2 ± 4M]-1
Table 3-1 compares option values given by the Barone-Adesi and
Whaley Approximation (American style) and by the Black-76 formula
(European style).
Computer algorithm
The BAWAmericanCallApprox(.) function can be used to calculate the
value of an American call option using the Barone-Adesi and Whaley
formula.
Function BAWAmericanCallApprox(S As Double, X As Double, T As Double,
r As Double, b As Double, v As Double) As Double
Dim Sk As Double, N As Double, K As Double
Dim dl As Double, Q2 As Double, a2 As Double
If b >= r Then
BAWAmericanCallApprox = GBlackScholes( "c", S, X, T, r, b, v)
Else
s** (co)(X = 100, r =0.1, b =0)
90 100 110 90 100 110
BAW Black-76
0.15 0.0206 1.8771 10.0089 0.0205 1.8734 9.9413
0.25 0.3159 3.1280 10.3919 0.3150 3.1217 10.3556
0.35 0.9495 4.3777 11.1679 0.9474 4.3693 11.1381
0.15 0.8208 4.0842 10.8087 0.8069 4.0232 10.5769
0.25 2.7437 6.8015 13.0170 2.7026 6.6997 12.7857
0.35 5.0063 9.5106 15.5689 4.9329 9.3679 15.3080
BAW Black-76
0.15 10.0000 1.8770 0.0410 9.9210 1.8734 0.0408
0.25 10.2533 3.1277 0.4562 10.2155 3.1217 0.4551
0.35 10.8787 4.3777 1.2402 10.8479 4.3693 1.2376
0.15 10.5595 4.0842 1.0822 10.3192 4.0232 1.0646
0.25 12.4419 6.8014 3.3226 12.2149 6.6997 3.2734
0.35 14.6945 9.5104 5.8823 14.4452 9.3679 5.7963
Futures price:
Call Options
T = 0.1 a =
a =
a =
T = 0.5 a =
a =
a =
Put Options
T = 0.1 a =
a =
a =
T = 0.5 a =
a =
a =
100 CHAPTER 3. ANALYTICAL FORMULAS
TABLE 3-1
Comparison of the Barone-Adesi and Whaley American
Approximation and the Black-Scholes/Black-76
European Model
Sk = Kc(X, T, r, b, v)
N = 2 * b / vA2
K = 2 * r / (vA2 * (1 - Exp(-r * T)))
dl = (Log(Sk / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
Q2 = (-(N - 1) + Sqr( (N - 1)^2 + 4 * K)) / 2
a2 = (Sk / Q2) * (1 - Exp((b - r) * T) * CND(d1))
If S < Sk Then
BAWAmericanCallApprox = GBlackScholes( "c ", S, X, T, r, b, v) -
+ a2 * (S / Sk)AQ2
Else
BAWAmericanCallApprox = S - X
End If
End If
End Function
The Kc (.) function below uses a Newton-Raphson algorithm to solve
for the critical commodity price for a call option.
Function Kc(X As Double, T As Double, _
r As Double, b As Double, v As Double) As Double
Dim N As Double, m As Double
Dim su As Double, Si As Double
Dim h2 As Double, K As Double
Dim dl As Double, Q2 As Double, q2u As Double3.2. BJERKSUND AND STENSLAND (1993) APPROXIMATION 101
Dim LHS As Double, REIS As Double
Dim bi As Double, E As Double
'II Calculation of seed value, Si
N = 2 * b / v"2
m = 2 * r / vA2
q2u = (—(N — 1) + Sqr((N — 1)^2 + 4 * m)) / 2
su = X / (1 — 1 / q2u)
h2 = —(b * T + 2 * v * Sqr(T)) * X / (su — X)
Si = X + (su — X) * (1 — Exp(h2))
K = 2 * r / (vA2 * (1 — Exp(—r * T)))
dl = (Log(Si / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
Q2 = (—(N — 1) + Sqr((N — 1) 1'2 + 4 * K)) / 2
LHS = Si — X
REIS = GBlackScholes("c", Si, X, T, r, b, v) _
+ (1 — Exp((b — r) * T) * CND(d1)) * Si / Q2
bi = Exp((b — r) * T) *CND(d1) * (1 — 1 / Q2) _
+ (1 — Exp((b — r) *T) *CND(d1) / (v * Sqr(T))) / Q 2
E=le-06
'II Newton Raphson algorithm for finding critical price Si
While Abs(LHS — REIS) / X > E
Si = (X + REIS — bi * Si) / (1— bi)
dl = (Log(Si / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
IRS = Si — X
REIS = GBlackScholes("c", Si, X, T, r, b, v) _
+ (1 — Exp((b — r) * T) * CND(d1)) * Si / Q2
bi = Exp((b — r) * T) * CND(d1) * (1 — 1 / Q2) _
+ (1 — Exp((b — r) * T) *ND(d1) / (v * Sqr(T))) / Q2
Wend
Kc = Si
End Function
3.2 THE BJERKSUND AND STENSLAND (1993)
APPROXIMATION
The Bjerksund and Stensland (1993b) approximation can be used to
price American options on stocks, futures, and currencies. The method
is analytical and extremely computer-efficient. Bjerksund and Stens-
land's approximation is based on an exercise strategy corresponding
to a flat boundary / (trigger price). Numerical investigation indicates
that the Bjerksund and Stensland model is somewhat more accurate
for long-term options than the Barone-Adesi and Whaley model pre-
sented earlier; however, an even more precise approximation is the
Bjerksund and Stendsland (2002) approximation soon to be presented.
C = ctS. — a0(S, T, 13,1, 1)
+0(S, T, 1, 1, 1) — 0(S, T, 1, X, 1)
— X0(S, T, 0, 1, 1) + X0(S,T, 0, X, 1), (3.1)102 CHAPTER 3. ANALYTICAL FORMULAS
where
a = (I — ,
( 1 b b 1) 2
11(0-2 — + ,2
The function Ø(S, T, y, H, I) is given by
(S , T, y, H, I) = eX SY [N (d) — (O K N
1
=[—r + yb y(y - 1)(7 2] T
d = ln(S H) [b (y
o
2b
K= ±(2y — 1),
o-L
and the trigger price I is defined as
21n(//S))1
cr
I = 130 + (Boo — 130)(1 eh(T))
h(T) = —(bT ± 2a/) VT) ( )
Boo — 130
Boo = X
B0 = max [X , r r — ) X]
b
Ifs > I, itis optimal to exercise the option immediately, and the value
must be equal to the intrinsic value of S - X. On the other hand, if
b > r, it will never be optimal to exercise the American call option
before expiration, and the value can be found using the generalized
BSM formula. The value of the American put is given by the Bjerksund
and Stensland put-call transformation
P(S, X, T, r, b, o-) = C(X, S,T,r — b, —b, cr),
where CO is the value of the American call with risk-free rate r - b
and drift -b. With the use of this transformation, it is not necessary
to develop a separate formula for an American put option.3.2. BJERKSUND AND STENSLAND (1993) APPROXIMATION 103
Example
Consider an American-style call option with nine months to expiry.
The stock price is 42, the strike price is 40, the risk-free rate is 4% per
year, the dividend yield is 8% per year and the volatility is 35% per
year. S = 42, X = 40, T = 0.75, r =0.04, b = 0.04 — 0.08 = —0.04, and
a =0.35.
(1 —0.04 ) A-0.04 1) ±
2
2 0.04
2 0.352 0.352 2
0.352 = 1.9825,
and the trigger price / is
Boo =-- 40 = 80.7134
—1
0.04
Bp = max [40, ( ) 40] = 40
0.04 — (-0.04)
h(T) = —(-0.04 x 0.75 -I- 2 x 0.35-V0.75) t30 ) = —0.5661
/ = B0 ± (Boo — B0)(1 — eh(T) ) = 57.5994
a = (/ — 40)/ —fi = 0.005695,
and finally the American call value is
C = a4213 — a0(42, 0.75, )5, /, /)
± 0(42, 0.75, 1, /, /) — 0(42, 0.75,
— 400(42, 0.75, 0, /, /) 400(42,
1, 40, /)
0.75, 0, 40, /) = 5.2704
The value of a similar European call is 5.0975.
Computer algorithm
The computer code for the Bjerksund and Stensland American option
approximation consists of three functions. The first one checks if
the option is a call or put. If the option is a put, the function uses
the American put-call transformation. The function then calls the
main function BSAmericanCallApprox(.), which calculates the option
value. The main function uses two other functions: the phi•) func-
tion, which in the formula above is described as 0(S, T, y, H, I), and
the GBlackScholes() function, which is the generalized BSM formula
described in Chapter 1.
Function BSAmericanCallApprox(S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double) As Double
Dim BInfinity As Double, BO As Double104 CHAPTER 3. ANALYTICAL FORMULAS
Dim ht As Double, i As Double
Dim Alpha As Double, Beta As Double
If b >= r Then 'II Never optimal to exersice before maturity
BSAmericanCallApprox = GBlackScholes("c", S, X, T, r, b, v)
Else
Beta = (1 / 2 — b / v^2) + Sqr((b / vA2 — 1 / 2)^2 + 2 * r / v^2)
BInfinity = Beta / (Beta — 1) * X
BO = Max(X, r / (r — b) * X)
ht = —(b * T + 2 * v * Sqr(T)) * BO / (BInfinity — BO)
i = BO + (BInfinity — BO) * (1 — Exp(ht))
Alpha = (i — X) * iA(—Beta)
If S >= i Then
BSAmericanCallApprox = S — X
Else
BSAmericanCallApprox = Alpha * S A Beta
— Alpha * phi(S, T, Beta, i , i, r, b, v) _
+ phi(S, T, 1, i, i, r, b, v) — phi(S, T, 1, X, i, r, b, v) _
— X * phi(S, T, 0, i , i , r, b, v) + X * phi(S, T, 0, X, i, r, b, v)
End If
End If
End Function
Function phi (S As Double, T As Double, gamma As Double, h As Dcuble, i As Double
r As Double, b As Double, v As Double) As Double
Dim lambda As Double, kappa As Double
Dim d As Double
lambda = (—r + gamma * b + 0.5 * gamma * (gamma — 1) * vA2) * T
d = —(Log(S/h) + (b + (gamma — 0.5) * vA2) * T) / (v * Sqr(T))
kappa = 2 * b / (vA2) + (2 * gamma — 1)
phi = Exp(lambda) * SAgamma * (CND(d) — (i / S)Akappa _
* CND(d — 2 * Log( i / S) / (v * Sqr(T))))
End Function
where CND() is the cumulative normal distribution function
described in Appendix A at the end of Chapter 1. Example:
BSAmericanApprox("c", 42, 40, 0.75, 0.04, —0.04, 0.35) returns an
American call value of 5.2704 as in the numerical example above.
3.3 THE BJERKSUND AND STENSLAND (2002)
APPROXIMATION
The Bjerksund and Stensland (2002) approximation divides the time
to maturity into two parts, each with a separate flat exercise boundary.
It is thus a straightforward generalization of the Bjerksund-Stensland
1993 algorithm. The method is fast and efficient and should be
more accurate than the Barone-Adesi and Whaley (1987) and the
Bjerksund and Stensland (1993b) approximations. The algorithm
requires an accurate cumulative bivariate normal approximation.3.3. BJERKSUND AND STENSLAND (2002) APPROXIMATION 105
Several approximations that are described in the literature are
not sufficiently accurate, but the Genze algorithm presented in
Chapter 13 should do.
C = a2SS - a20(S, tl.0, 12, 12)
+ (/)(S, /1, 1, 12, 12) - (P(S, ti, 1, 11, 12)
- (S, ti , 0, 12, 12) ± (S t1 , 0, 11, 12)
a10(S, 11, 16, 11, 12) - 1KS,T, 0, 11, 12, 11, II)
± (S, T, 1, li, 12, 11, ti) - (S, 1, X, I2, 11, ti)
- 0, Ii , /2,11, /1) + (S, T, 0, X, 12, 11, t1), (3.2)
where
= (I - X)I ,
= a b2 ) ±
az = (12 - x)12-$
( b 1) 2
+ 2 ,2
The function 4)(S, T, y, H, I) is given by
4)(S, T, y, H, I) = eA SY[N(-d)- N( -d2)]
ln(S/ H) -
2b
K = - + (2y - 1), a2
and the trigger price / is defined as
12B0+(Bc'oBO)(l - e h2 )
=- - B0 ± (Boo - B0)(1 - eh l)
=--
hi = -(bti ± 2a ) (
X 2 )
(Boo - Bo)Bo
h2 = -(bT -I-2a T)
r- (X2 )
(Boo - Bo) Bo
d -
a ,,rf
d
ln(I2 1 (SH))± [b (y -
2 -
1
= -r yb -
2
y (y - 1)a 2ln(SI H)± (b (y —
=
f3=
c
1n(111(S H)) (b (y — )cr 2)T
106 CHAPTER 3. ANALYTICAL FORMULAS
1
= -(V5 — 1)T
2
Boo = X
— I
Bo = max [X, ( 7, r ) X]
Moreover, the function 41(S, T, y, H, 12, ti) is given by
(S, T, y, H, 12, II, r1, r, b, a) = eAT SY [M( —el, —fit P) — (121 S)" A 1( —e2, —f2, P)
—(111S)" M( —e3, —f3, — P)+(11112)K M(—e4, —f4, —1,)],
where
ei =
a
In(S//i) — (b (y— )a 2)t1
e3 =
VT'
In(11. 1(S11))± (b + (y — 4)(1 2ft'
c
In(111(Sli)) (b +(y — )(72)t1
In(111(SH))± (b (y — )cr 2)T
cr,ff
In(SI?1(H (b (y — )cr 2)T
(7,5'
e2 =
e4 =
f2 =
fa =
1 2 In(S//i) + (b + ()/ — 1)a )t1
Table 3-2 gives numerical values for the Bjerksund-Stensland
(2002) approximation and also their 1993 approximation. The 2002
version of their model is more accurate but slightly more computer-
intensive.
Computer algorithm
The computer code for the Bjerksund and Stensland 2002 American
option approximation consists of four functions. The first one checks
if the option is a call or a put. If the option is a put, the function
uses the American put-call transformation. The function then calls
the main function BSAmericanCallApprox20020, which calculates the
option value. The main function uses two other functions: the phi()
function, which in the formula above is described as CS, T, y, H, 1)
and the ksi•) function described as xli(S,T,y, H, 12, Ii, Ii, r, b, cr), and
the GBlackScholes(.) function, which is the generalized BSM formula
described in Chapter 1.
Function SSAmericanApprox2002( CallPutFlag As String , S As Double, X As Double, _
T As Double. r As Double, b As Double , v As Double ) As Double
If CallPutFlag = "c" Then
BSAmericanApprox2002 BSAmericanCallApprox2002(S, X, T, r, b, v)3.3. BJERKSUND AND STENSLAND (2002) APPROXIMATION 107
TABLE 3-2
Comparison of Values from the Bjerksund and Stensland
(2002) and (1993) Models
(x =_- 100, r = 0.1, b = 0)
Futures price: 90 100 110 90 100 110
Call Options Bjerksund-Stensland-02 Bjerksund-Stensland-93
T = 0.1 a -= 0.15 0.0205 1.8757 10.0000 0.0206 1.8769 10.0061
= 0.25 0.3151 3.1256 10.3725 0.3159 3.1277 10.3901
a = 0.35 0.9479 4.3746 11.1578 0.9495 4.3777 11.1678
T = 0.5 a = 0.15 0.8099 4.0628 10.7898 0.8208 4.0841 10.8085
a = 0.25 2.7180 6.7661 12.9814 2.7436 6.8013 13.0167
a = 0.35 4.9665 9.4608 15.5137 5.0062 9.5103 15.5684
Put Options Bjerksund-Stensland-02 Bjerksund-Stensland-93
T = 0.1 a = 0.15 10.0000 1.8757 0.0408 10.0000 1.8769 0.0410
= 0.25 10.2280 3.1256 0.4552 10.2530 3.1277 0.4562
a = 0.35 10.8663 4.3746 1.2383 10.8785 4.3777 1.2402
T = 0.5 a = 0.15 10.5400 4.0628 1.0689 10.5592 4.0841 1.0822
= 0.25 12.4097 6.7661 3.2932 12.4417 6.8014 3.3226
a = 0.35 14.6445 9.4608 5.8374 14.6943 9.5103 5.8822
ElseIf CallPutFlag = "p" Then '11 Use put-call transformation
BSAmericanApprox2002 = BSAmericanCallApprox2002(X, S, T, r - b, -b, v)
End If
End Function
Function BSAmericanCallApprox2002(S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double) As Double
Dbn BInfinity As Double, BO As Double
Dim htl As Double, ht2 As Double, Ii As Double, 12 As Double
Dim alfal As Double, alfa2 As Double, Beta As Double, ti As Double
= 1 / 2 * (Sqr(5) - 1) * T
If b >= r Then 'I I Never optimal to exersice before maturity
BSAmericanCallApprox2002 = GBlackScholes("c", S. X, T, r, b, v)
Else
Beta = (1/2-b/vA2) + Sqr((b/v^2-1/2)^2+2*r/v^2)
BInfinity = Beta/(Beta-I)*X
BO = Max(X, r/(r-b)*X)
htl = -(b*t1+2*v*Sqr(t1))*X^2/((BInfinity-B0) • BO)
ht2 = -(b * T + 2 * v Sqr(T )) * XA2 / ((BInfinity - BO) * BO)
Ii = BO + (BInfinity - BO) • (1 - Exp(ht1))
12 = BO + (BInfinity - BO) * (1 - Exp(ht2))
alfal = (II - X) • I1^(-Beta)
alfa2 = (12 - X) • I2"(-Beta)
If S >= 12 Then
BSAmericanCaIlApprox2002 S - X
Else
BSAmericanCaIlApprox2002 = aIfa2 * S^Beta - alfa2 • phi(S, tl, Beta, 12, 12, r, b, v) _
+ phi(S, ti, 1, 12, 12, r, b, v) - phi(S, ti, 1, II, 12, r, b, v) _
- X* phi(S, ti, 0, 12, 12, r, b, v) + X* phi(S, ti, 0, II, 12, r, b, v) _
+ aIfal * phi(S, tl, Beta, 11, 12, r, b, v) - alfal * ksi(S, T, Beta, II, 12, II, U , r, b,
+ ksi(S, T, 1, 11, 12, II, ti, r, b, v) - ksi(S, T, 1, X, 12, II, ti, r, b, v) -108 CHAPTER 3. ANALYTICAL FORMULAS
- X* ksi(S, T, 0, Ii, 12, Ii, tl, r, b, v) + X* ksi(S, T, 0, X, 12, Ii, tl, r, b, v)
End If
End If
End Function
Public Function BSAmericanCallApprox2002(S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double) As Double
Dim BInfinity As Double, BO As Double
Dim htl As Double, ht2 As Double, Ii As Double, 12 As Double
Dim alfal As Double, alfa2 As Double, Beta As Double, ti As Double
ti = 1 / 2 * (Sqr(5) - 1) * T
If b >= r Then 'II Never optimal to exersice before maturity
BSAmericanCallApprox2002 = GBlackScholes("c", S, X, T, r, b, v)
Else
Beta = (1/2-b/v^2) + Sqr((b/v"2-1/2)^2+2*r/v^2)
Blnfinity = Beta /( Beta -1)*X
BO = Max(X, r/(r-b)*X)
htl = -(b*t1+2*v*Sqr( tl ))*X." 2/(( BInfinity -BO) * BO)
ht2 = -(b * T + 2 * v * Sqr(T)) * X^2 / ((BInfinity - BO) * BO)
Ii = BO + (Blnfinity - BO) * (1 - Exp(ht1))
12 = BO + (Blnfinity - BO) * (1 - Exp(ht2))
alfal = (II - X) * 11^(-Beta
alfa2 = (12 - X) * I2(-Beta)
If S >. 12 Then
BSAmericanCallApprox2002 = S - X
Else
BSAmericanCallApprox2002 = alfa2 * SABeta - alfa2 * phi (5, tl, Beta, 12, 12, r b, v) _
+ phi(S, tl, 1, 12, 12, r, b, v) - phi(S, tl, 1, Ii, 12, r, b, v) _
- X* phi(S, tl, 0, 12, 12, r, b, v) + X* phi(S, tl, 0, Ii, 12, r, b, v) _
+ alfal * phi(S, tl, Beta, Ii, 12, r, b, v) - alfal * ksi(S, T, Beta, Ii, 12, 11, tl, r, b, v) _
+ ksi(S, T, 1, 11, 12, 11, tl, r, b, v) - ksi(S, T, 1, X, 12, Ii, tl, r, b, v) _
- X* ksi(S, T, 0, 11, 12, 11, tl, r, b, v) + X* ksi(S, T, 0, X, 12, 11, tl, r, b, v)
End If
End If
End Function
Function ksi(S As Double, T2 As Double, gamma As Double, h As Double, 12 As Double, _
Ii As Double, ti As Double, r As Double, b As Double, v As Double) As Double
Dim el As Double, e2 As Double, e3 As Double, e4 As Double
Dim fl As Double, f2 As Double, f3 As Double, f4 As Double
Dim rho As Double, kappa As Double, lambda As Double
el = (Log( S/ )-(-( b+(gamma- 0.5 )4(v^ 2)*t1 )/( v*Sqr(
e2 = (Log( 12 2/(S*11 ))+( b +(gamma-0.5 )*v "2)*t1 )/( v*Sqr( ti ))
e3 = (Log(S/11)-(b+(gamma-0 5)*v^2)*t1)/(v*Sqr(t1))
e4 = (Log( 12 2/(S*11 )) -(b+(gamma- 0.5 )*v^2)*t1 )/( v*Sqr( ti ))
fl = (Log(S/h)+(b+(gamma-0 5)*vA2)*T2)/(v*Sqr(T2))
f2 = (Log(12"2/(S*h))+(b+(gamma-0 5)*vA2)*T2)/( v*Sqr(T2))
f3 = (Log(I1"2/(S*h))+(b+(gamma-0.5)*v^2)*T2)/(v*Sqr(T2))
f4 = (Log((S*11^2)/(h*12^2)) _
+ (b+(gamma-0.5)*vA2)*T2)/(v*Sqr(T2))
rho = Sqr( tl /T2)
lambda = -r+gamma*b + 0.5*gamma* ( gamma- 1 )*v 2
kappa = 2s*b/(v"2)+(2*gamma-1)
ksi = Exp(lambda * T2) * S"gamma * (CBNDr-el, -fl, rho)
- (12 / S)"kappa * CBN1r-e2, -f2, rho) _
- (II / S)Akappa * CBND(-e3, -f3, -rho) _
+ (I1 / 12)"kappa * CBND(-e4, -f4, -rho))
End Function3.5. AMERICAN PERPETUAL OPTIONS 109
Function phi (S As Double, T As Double, gamma As Double, h As Double, i As Double,
r As Double, b As Double, v As Double) As Double
Dim lambda As Double, kappa As Double
Dim d As Double
lambda = (—r + gamma • b + 0.5 • gamma * (gamma — 1) * v^2) * T
d = —(Log(S / h) + (b + (gamma — 0.5) * v"2) * T) / (v * Sqr(T))
kappa = 2 * b / (v^2) + (2 • gamma — 1)
phi = Exp(lambda) * SAgamma * (CND(d) — ( / S) ^ kappa _
* CriD(d — 2 * Log( / S) / (v * Sqr(T))))
End Function
3.4 PUT-CALL TRANSFORMATION AMERICAN
OPTIONS
The Bjerksund and Stensland (1993a) put-call transformation is very
useful when calculatingAmerican option values. If you have a formula
for an American call, the relationship below will give the value for the
American put.
P(S, X, T, r, b, = C(X, S,T,r — b, —b, a)
3.5 AMERICAN PERPETUAL OPTIONS
While there in general is no closed-form solution for American options
(except for nondividend-paying stock call options) it is possible to find
a closed-form solution for options with an infinite time to expiration.
The reason is that the time to expiration will always be the same: infi-
nite. The time to maturity, therefore, does not depend on at what point
in time we look at the valuation problem, which makes the valuation
problem independent of time McKean (1965) and Merton (1973) 1 gives
closed-form solutions for American perpetual options. For a call option
we have
X (y1-1 S
c
yi — 1 k. yi )
where
1 b b 1\ 2 2r
Y1 =
If b >=r, then there is never optimal to exercise a call option. In
the case of an American perpetual put, we have
X (y2-1 S)Y 2
P ,
— Y2 Y2 X
1See also Aase (2005) and Gerber and Shiu (1994).
(3.3)110 CHAPTER 3. ANALYTICAL FORMULAS
where
1 b 1 b 1\2 2r
± 0.2
In practice, one can naturally discuss if there is such a thing as infi-
nite time to maturity. For instance, credit risk could play an important
role: Even when you are buying an option from an AAA bank, there
is no guarantee the bank will be around forever.
Table 3-3 shows values of perpetual American call option values.
TABLE 3-3
Examples of American Perpetual Call Options Values
(X = 100, r =0.1, b =0.02)
a S =70 S = 80 S = 90 S = 100 S = 110 S = 120 S = 130
10% 4.3229 6.6426 9.7027 13.6174 18.5035 24.4804 31.6700
15% 6.8933 9.7777 13.3089 17.5358 22.5052 28.2622 34.8503
20% 9.6812 13.0497 16.9817 21.4931 26.5984 32.3112 38.6441
25% 12.5392 16.3295 20.6133 25.3893 30.6563 36.4134 42.6597
30% 15.3861 19.5513 24.1519 29.1774 34.6188 40.4679 46.7174
Example
Consider a perpetual call option with strike 100, risk-free rate 10%,
on a stock index trading at 90 with continuous dividend yield 8%
and volatility 25%. What is the value of the option? S = 90, X = 100,
r =0.1, b =0.1 -0.08 = 0.02, a =0.25, which yields
1 0.02 /0.02 1 V
2)
90
100)
2 x 0.1 ±
Y1 =
2 0.25L
100
0.252
(1.9779 - 1
1.9779
0.252
=
1 '9779
= 20.6133 c =
1.9779 - 1 1.9779CHAPTER
4
(434 EXOTIC OPTIONS SINGLE
ASSET
With derivatives you can have almost any payoff pattern you
want. If you can draw it on paper, or describe it in words, someone
can design a derivative that gives you that payoff
Fischer Black
In this chapter I present a large class of analytical formulas for
so-called exotic options on one underlying asset. The underlying asset
is assumed to follow a geometric Brownian motion dS = itSdt + a Sdz,
where is the expected instantaneous rate of return on the underly-
ing asset, a is the instantaneous volatility of the rate of return, and
dz is a Wiener process. The volatility and risk-free rate is assumed
to be constant throughout the life of the option. Most of the formulas
are written on a general form, including a cost-of-carry term, which
makes it possible to use the same formula to price options on a large
class of underlying assets: stocks, stock indices paying a dividend
yield, currencies, and futures. Since the formulas are closed-form
solutions, they can, in general, only be used to price European-style
options. A few cases admit closed-form solutions or approximations
for the American counterpart. See Chapter 7 for more on pricing
American-style exotic options.
4.1 VARIABLE PURCHASE OPTIONS
Handley (2001) describes how to value variable purchase options
(VPO). A VPO is basically a call option, but where the number of
underlying shares is stochastic rather than fixed, or more precisely,
a deterministic function of the asset price. The strike price of a VPO
is typically a fixed discount to the underlying share price at matu-
rity. The payoff at maturity is equal to max[N x S — X], where N is
the number of shares. VPOs may be an interesting tool for firms that
need to raise capital relatively far into the future at a given time.
The number of underlying shares N is decided on at maturity and is
111112 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
equal to
N=
ST(1 - D)'
where X is the strike price, ST is the asset price at maturity, and D is
the fixed discount expressed as a proportion 0 > D < 1. The number
of shares is in this way a deterministic function of the asset price.
Further, the number of shares is often subjected to a minimum and
maximum. In this case, we will limit the minimum number of shares
to N,„„ = ox D) if, the asset price at maturity is above a predefined
level U at maturity. Similarly, we will reach the maximum num-
ber of shares A T = x LO-D)if the stock price at maturity is equal
or lower than a predefined level L. Based on Handley (2001), we get
the following closed-form solution:
XD
CrT N (d2)]
b-r)TN( c =
1 - D
e-rT +
- Nmax [Le-rT d4) - Se (b')T N( -d3)1
+ Nmax [L(1 - D)e-rT N(_ a ) Se (b-r)T N( -d5)1, (4.1)
where
1n(S/ U) + (b +a2/ 2)T
=
ln(S/ L)+ (b +a2 /2)T
d3 =
In(S/(L(1 - D))) + (b +a2/2)T
d5 =
(7,5'
Table 4-1 shows values for variable purchase options, for two
different discount values D, different choices of volatility a, as well as
cap and floor levels: L and U.
Example
Consider a variable purchase option with six months to expiration
and a strike price of 101. The current stock price is 100, the risk-free
rate is 5%, the volatility is 20%, and the discount is 10%. Further,
the number of shares is capped at stock price 90 and has a floor at
stock price of 110. S = 100, X = 101, T = 0.5, r =0.05, b = 0.05, a =0.2,
D = 0.1, L = 90, and U = 110. What is the value of the VPO? First, the4.1. VARIABLE PURCHASE OPTIONS 113
TABLE 4-1
Variable Purchase Options Values
(S = 100, X = 101, T = 0.5, r = 0.05, b = 0.05)
D =0% D =20%
L U a = 10% a = 20% a = 30% a = 10% a = 20% a = 30%
101 101 3.6093 6.3735 9.1518 26.4945 26.7913 28.0316
95 105 1.7415 4.4071 7.1166 26.1568 26.8766 27.7651
90 110 0.5661 2.6687 5.1300 25.2155 26.2052 26.9532
85 115 0.1447 1.5471 3.6483 24.7956 25.7473 26.4874
BSM: 3.6093 6.3735 9.1518 3.6093 6.3735 9.1518
maximum number of shares we can get if the asset price is 90 or lower
at expiration is
= 1.2469
NMax = L(1 X - D) 90(110 -10.1)
Similarly, the minimum number of shares we get if the stock is 110
or higher at maturity is
Nmin = (10 D)
X 101
= 1.0202
110(1 - 0.1)
Further
In(100/110) + (0.05 + 0.22/2)0.5
= = -0.4265
0.2f0- .3
d2 = -0.4265 - = -0.5679
In(100/90) ± (0.05 ± 0.22/2)0.5
d3 = = 0.9925
d4 = 0.9925 - 0.2Jö = 0.8511
In (100/(90(1 - 0.1))) + (0.05 + 0.22/2)0.5
d5- =1.7375
d6= 1.7375 - -= 1.5961
N(d1 ) =- N (-0.4265) = 0.3349 N(d2) = N(-0.5679) -= 0.2851
N(-d3) =-_ N(-0.9925) = 0.1605 N (-d4) = N(-0.8511) = 0.1974
N(-d5) N (- 1.7375) = 0.0411 N(-d6) = N(-1.5961) = 0.0552114 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
This gives us a VPO value of
101 x 0.1_ e 0.05x0.5 ± 1.0202[100e(0.05- 0.05)0.5 N (di ) _ 110e—0.05x0.5 N ((ID] c--=
1 — 0.1
— 1.2469[90e—o.o.5xo.5m_d4, _ ) 100e(0.05-0.0505N(_d3)]
± 1.2469[90(1 — 0.1)e -0.05x0.5m_d6) _ 100e0.05-0.0505N (—d5)]
-= 12.6288
4.2 EXECUTIVE STOCK OPTIONS
The Jennergren and Naslund (1993) formula takes into account that
an employee or executive often loses her options if she has to leave
the company before the option's expiration:
c = e-AT[se (b-r)TN(d i ) - xe -rTN(d2)1 (4.2)
p = e—AT [Xe —rT N( — d2) — Se (b—r)T N ( —
di)I, (4.3)
where
ln(S/X)-1-- (b a2 /2)T
di = d2 = di — cr,VT
aN/7
(A) is the jump rate per year. The value of the executive option equals
the ordinary Black-Scholes option price multiplied by the probability
e—AT that the executive will stay with the firm until the option expires.
Example
What is the value of an executive call option when the stock price is
60, the strike price is 64, the time to maturity is two years, the risk-
free rate is 7%, the dividend yield is 3%, the stock volatility is 38%,
and the jump rate per year is 15%? S = 60, X = 64, T = 2, r =0.07,
b = 0.07 -0.03 = 0.04, a =0.38, A = 0.15, and
ln(60/64)± (0.04 ± 0.38 2/2)2
di — = 0.2975
0.38,12
d2 = di — 0.38,,i21= —0.2399
N(di)= N(0.2975) = 0.6169, N(d2) = N(—0.2399) = 0.4052
c = e-0.15x2 [60e(0.04-0.07)2 N( .1. a ) 64e-0.07x2Au
9.1244
4.3 MONEYNESS OPTIONS
A moneyness option is basically a plain vanilla option where the strike
is set to a percentage of the future/forward price. For example, a 120%4.4. POWER CONTRACTS AND POWER OPTIONS 115
moneyness call would have a strike equal to 120% of the forward price.
A 120% moneyness put would have a spot equal to 120% of the strike.
The value of this option is given in percent of the forward. The value
of a moneyness call or put is thus given by
c =p e—rT
mdi) -(d2)I, (4.4)
where L = XIF for a call and L FIX for a put, and
-1n(L) a2 T/2
d1 = , d2 = d1 - a N/7
a N/T
Example
What is the value of a call option that is 120% out-of-the-money, with
nine months to maturity, risk-free rate of 8%, and volatility of 30%?
L XIF = 1.2, T = 0.75, r=-- 0.08, a =0.3, and thus
-1n(1.2)± 0.32 x 0.75/2
d1 = = 0.5719
0.3,./0.75
d2 = d1 - 0.3J0.75 = -0.8317
N (d i) = N(-0.5719) = 0.2837
N(d2) = N(-0.8317) = 0.2028
c = c-0.08x0.75[Ar(d1) _ 1.2N(d2)] = 0.0380
A call that is 120% out-of the money relative to the forward price will
thus have a value equal to 3.8% of the forward price.
4.4 POWER CONTRACTS AND POWER OPTIONS
There are two main categories of power options. Standard power
options' payoff depends on the price of the underlying asset raised to
some power. For powered options, the "standard" payoff (stock price
in excess of the exercise price) is raised to some power. While it is
possible to come up with lots of variants within these two categories,
we cover the most common types. Additional types of powered options
are covered in Chapter 7.
## 4.4.1 Power Contracts
A power contract is a simple derivative instrument paying (S/ X)' at
maturity, where i is some fixed power. The value of such a power
contract is given by Shaw (1998) as
vPower = )1
(,[b—o 2/2±i2o 2121T (4.5)116 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
Example
What is the current value of a power contract with a power of 2, six
months to expiration, on a stock index trading at 400, with strike
price of 450, risk-free rate of 8%, dividend yield of 2%, and volatility
of 25%? S = 400, X = 450, T = 0.5, r =0.08, b = 0.08 - 0.02 = 0.06, a =
0.25, i = 2 yields
400
Vpower =
2
e
[(0.06- 0.252/2)2- 0.08+22 x 0.252/210.5 = 0.8317
\ 450)
## 4.4.2 Standard Power Option
Standard power options (aka asymmetric power options) have nonlin-
ear payoff at maturity. For a call, the payoff is max[S' - X, 01, and for
a put, it is max[X - S', 0], where i is some power (i > 0). The value of
this power call is given by (see Heynen and Kat, 1996c; Zhang, 1998;
and Esser, 2003)
c - s'e[(1- mr+'62/2)-1(r-bAT WO- Xe -rT N(d2), (4.6)
while the value of a put is
p = Xe-rT N(-d2) - SeR i-1)(r (4.7)
where
ln(S I X'l i) (b (i -
(7,5'
d2 = di -
Table 4-2 shows values for call and put power options, for different
values of power i, and volatility a.
Example
Consider a standard power option with three months to expiration,
current stock price of 10, power of 2, strike price of 100, risk-free
interest rate of 8%, continuous dividend yield of 6%, and expected
volatility of the stock of 30%. With S = 10, i = 2, X = 100, T = 0.5,
r = 0.08, b =0.08 - 0.06 = 0.02, and a =0.3, we get
1 ln(10/1001/2) ± (0.02 ± (2 - )0.5
di = =0.3653
d2 = 0.3653 - 2 x 0.3 ,01 / = -0.0589
N(di) = N(0.3653) = 0.6426, N(d2) = N(-0.0589) = 0.4765
c = 102e
[(2- 1)(0.08+2 x0.32/2) - 2(0.08- 0.02)10.5
N(di )
- 100e-0.08x0.5N( ) = 20.1016
di =4.4. POWER CONTRACTS AND POWER OPTIONS 117
TABLE 4-2
Examples of Power Option Values
(S = 10, X = 100, T = 0.5, r = 0.08, b = 0.02)
Call Power Option Values
i=10% a = 15% a =20% i=25% i=30%
1.90 0.3102 1.4522 3.2047 5.3446 7.7621
1.95 1.9320 4.2990 6.9724 9.8596 12.9351
2.00 6.7862 9.8585 13.0957 16.5057 20.1016
2.05 15.8587 18.6126 21.8980 25.5429 29.4939
2.10 28.4341 30.4628 33.4555 37.1126 41.2849
Put Power Option Values
1.90 18.2738 18.9972 20.1600 21.5351 23.0079
1.95 10.2890 12.1467 14.1021 16.0575 17.9810
2.00 4.3539 6.8086 9.1746 11.4533 13.6490
2.05 1.3089 3.3161 5.5476 7.8230 10.0774
2.10 0.2745 1.4031 3.1247 5.1286 7.2508
## 4.4.3 Capped Power Option
Power options can lead to very high leverage and thus entail poten-
tially very large losses for short positions in these options. It is
therefore common to cap the payoff. The maximum payoff is set to
some predefined level C . The payoff at maturity for a capped power call
is min[max(S1 - X, 0), C]. Esser (2003) gives the closed-form solution:
c - Si eRi-1)(r+ia212)-i(r-b)1T[111(el) - N (e3)]
- e-rT [X N (e2) - + X)N (e4)l, (4.8)
where
ln(S/X l ii ) (b (i -
-
aN/7
e2 = -
ln(S 1(e ± X) 11i) (b (i -
e3 =
a
e4 = e3 - i a N/7
In the case of a capped power put, we have
p = e-rT [X N (-e2) - (X - oN(-,4)]
- si eRi-1)(r+ia212)-i(r-b)1T [N(_ el ) N(-e3)], (4.9)118 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
where ei and e2 is as before. e3 and e4 has to be changed to
ln(S / (X — 00)+ (b (i — )cr 2)T
e3 =
a ../T
e4 = e3 —
## 4.4.4 Powered Option
At maturity, a powered call option pays off max[S – X, Or and a put
pays off max[X – S, 011 . Esser (2003) describes how to value these
options (see also Jarrow and Turnbull, 1996, Brockhaus, Ferraris,
Gallus, Long, Martin, and Overhaus, 1999)
=
j
.
i!
.
j
e
(i— j-1)(r±(i— 2 /2)T —(i — j)(r—b)T N (di, j)
j=0 1(1 -1)!
and
(4.10)
p = s)i—j xje(i—j-1)(r±(i—Da2/2)T — (i — j)(r—b)T N ( _di
.1!0 J)!
where
) (4.11)
ln(S I X) (b (i — j — )a 2)T
d,,j —
r.sif
In this formula, i can take integer values only; for noninteger values,
the binomial tree in Chapter 7 can be used.
Table 4-3 shows values for powered call and put options, for
different values of power i, and volatility a.
TABLE 4-3
Powered Option Values
(S = 100, X = 100, T = 0.5, r =0.1, b = 0.07)
Call Put
i = 1 i =2 i = 3 i = 1 i = 2 i = 3
a = 10% 4.7524 53.4487 758.8427 1.3641 9.7580 89.6287
a =20% 7.3179 160.2955 4,608.7213 3.9296 57.8677 1,061.2120
a = 30% 9.9829 339.3731 15,624.1041 6.5946 142.2726 3,745.1853
Computer algorithm
The computer code returns the value of a powered call or put option.
Function PoweredOption(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, _
v As Double, i As Double) As Double4.5. LOG CONTRACTS 119
Dim dl As Double, sum As Double
Dim j As Integer
If CallPutFlag = "c" Then
sum = 0
For j = 0 To i Step 1
dl = (Log(S/X) + (b + (i — j — 0.5) * vA2)*T) / (v*Sqr(T))
sum = sum + Application.Combin(i , j) _
* SA(i — j) * (—X)Aj * Exp(( i j — 1) _
* (r + (i — j) * vA2 / 2) * T — (i — j) * (r — b) *T) _
* CND(d1)
Next
PoweredOption = sum
ElseIf CallPutFlag = "p" Then
sum = 0
For j = 0 To i Step 1
dl = (Log(S/X) + (b + (i — j — 0.5) * v^2) * T) / (v * Sqr(T))
sum = sum + Application.Combin(i, j) _
* (—S)^(i — j) * Xt`j * Exp(( i — j — 1) _
* (r + (i — j) * v^2 / 2) *T — (i — j) * (r — b) *T)
* CND(—d1)
Next
PoweredOption = sum
End If
End Function
Special Case Powered to the Second
In the special case of a powered option with a power of 2, the formulas
above simplify to Crack (1997, 2004)
c = S2e(2b—r+a2)7.N (do) — 2X Se —1-)T N (di) ± X2e-rTN(d2), (b
where
3 ln(SIX)+(b+ 2-a 2 )T
do —
ln(S 1 X) + (b + a2 12)T
d2 = d1 — N/T
and the put value is given by
p = s2e(2b—r+a2)T 2e—rT N( _d2) - N (—do) — 2X Se (b—r)T N (—di) ± X
4.5 LOG CONTRACTS
A log contract, first introduced by Neuberger (1994) and Neuberger
(1996), is not strictly an option. It is, however, an important building
block in volatility derivatives (see Chapter 6 as well as Demeterfi,
Derman, Kamal, and Zou, 1999). The payoff from a log contract at
maturity T is simply the natural logarithm of the underlying asset
(4.12)
(4.13)120 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
divided by the strike price, ln(S/ X). The payoff is thus nonlinear and
has many similarities with options. The value of this contract is
L = e-rT [ln(S / X) + (b - o 2/2)T] (4.14)
The delta of a log contract is
A =
e-rT
and the gamma is
r =
e-rT
s2
Example
What is the current value of a log contract with three months to expi-
ration on a stock trading at 90, with strike 80, risk-free rate 8%,
and volatility 35%? S = 90, X = 80, T -= 0.25, r = 0.08, b = 0.08, and
a =0.35
L = e-0.08x0.25 [1n(90/80) + (0.08 - 0.352/2)0.25] = 0.1200
## 4.5.1 Log(S) Contract
An even simpler version of the log contract is when the payoff simply
is ln(S). The payoff is clearly still nonlinear in the underlying asset.
It follows that the value of this contract is
L = e-rT [In(S) (b - o-2 12)71 (4.15)
The theta/time decay of a log contract is
=0-2
and its exposure to the stock price, delta, is
21
A
TS
This basically tells you that you need to be long stocks to be delta-
neutral at any time. Moreover, the gamma is
2
r = —
Ts2
Example
What is the current value of a Log(S) contract with the same para-
meters used in the previous log contract example?
L = e- 0.08x0.25 woo) ± (0.08 - 0.352/2)0.5] = 4.41534.6. FORWARD START OPTIONS 121
TABLE 4-4
Log Option Values
(s = 100, T = 0.75, r =0.08, b = 0.04)
a X =70 X =80 X = 90 X=100 X=110 X = 120 X = 130
20% 0.3510 0.2306 0.1369 0.0724 0.0341 0.0145 0.0056
30% 0.3422 0.2338 0.1528 0.0959 0.0580 0.0340 0.0195
40% 0.3379 0.2408 0.1687 0.1165 0.0796 0.0539 0.0363
50% 0.3365 0.2486 0.1830 0.1344 0.0986 0.0724 0.0532
60% 0.3362 0.2559 0.1954 0.1498 0.1152 0.0890 0.0691
## 4.5.2 Log Option
A log option introduced by Wilmott (2000) has a payoff at maturity
equal to max[In(S/X), 01, which is basically an option on the rate of
return on the underlying asset with strike ln(X). The value of a log
option is given byl
c = e-rTn(d2)a + e-rT [1n(S I X) + (b - a2/2)T1N(d2), (4.16)
where Ar(.) is the cumulative normal distribution function, n() is the
normal density function, and
ln(S/ X) ± (b- a2/2)T
d2=
a -if
Table 4-4 shows values of log options for various strikes and
volatilities.
4.6 FORWARD START OPTIONS
A forward start option with time to maturity T starts at-the-money
or proportionally in- or out-of-the-money after a known elapsed time
t in the future. The strike is set equal to a positive constant a
times the asset price S after the known time t. If a is less than
unity, the call (put) will start 1 - a percent in-the-money (out-of-the-
money); if a is unity, the option will start at-the-money; and if a is
larger than unity, the call (put) will start a - 1 percentage out-of-the-
money (in-the-money).A forward start option can be priced using the
1The formula presented here is slightly different due to a minor typo in the formula
in Paul Wilmott's brilliant book on Quantitative Finance.122 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
Rubinstein (1990) formula:
c = Se(b—r)t
[e(b—r)(T —t)
— ae—
r(T —t) N(d2 )1
(4.17)
p = Se(b—r)t
kee —r(T—t) N ( _d2) e T —t) N
(4.18)
where
WI/a) + (b + cr2 12)(T — t)
=
cr,s/T — t
d2 = di — — t
Application
Employee options are often of the forward starting type. Ratchet
options (aka cliquet options) consist of a series of forward starting
options.
Example
Consider an employee who receives a call option with forward start
three months from today. The option starts 10% out-of-the-money,
time to maturity is one year from today, the stock price is 60, the
risk-free interest rate is 8%, the continuous dividend yield is 4%, and
the expected volatility of the stock is 30%. S = 60, a = 1.1, t = 0.25,
T = 1, r =0.08, b = 0.08 – 0.04 = 0.04, a = 0.3.
ln(1/1.1)+ (0.04 + 0.32/2)(1 — 0.25)
di = = —0.1215
0.3,/(1 — 0.25)
d2 = di — 0.3-,/(1 — 0.25) = —0.3813
N(di) = N(-0.1215) = 0.4517 N(d2) = N(-0.3813) = 0.3515
c = 60e0 — 1.1e .04-0.08)0.25 [e . .08(1 - 0.25) (0 04-0.08)(1-0.25)
N(di) —° iv w = 4.4064
4.7 FADE-IN OPTION
A fade-in call has the same payoff as a standard call except the
size of the payoff is weighted by how many fixings the asset price
were inside a predefined range (L, U). If the asset price is inside
the range for every fixing, the payoff will be identical to a plain
vanilla option. More precisely, for a call option, the payoff will be
max(ST – X, 0) x 1 E7=1 n(i), where n is the total number of fixings
and 17(0= 1 if at fixing i the asset price is inside the range, and
0 otherwise. Similarly, for a put, the payoff is max[X – ST, 0] x
Brockhaus, Ferraris, Gallus, Long, Martin, and Overhaus (1999) 2
describeaclosed-formformulaforfade-inoptions.Foracallthevalue
2But I think they have a typo in their formula, so here is my version.d5 =
a ,N
In(S U) + (b + a212)ti
4.7. FADE-IN OPTION 123
is given by
I n th IT
c = - E d1; -P) - M(-d3, d1; -01
- Xe -rT 1M( --d6, d2; - M(-d, d2; (4.19)
where n is the number of fixings, p = ti
In(S I X) + (b + a2 /2)T
- di -
o
d3 =
ln(S I L) + (b + a2/2)t1
0"..X
The value of a put is similarly
d4 = d3 Nlij
d6 d5 - crN/ri
p = - EXe -rT [M(-d6, -C12; - “-d4, -d2;
n 1=1
- S (b-r)T [A ( -d5, -d1; - M( -d3, -d]; 141 (4.20)
Table 4-5 shows some possible values of fade-in call options. When
we have a wide range far away from the current asset price and the
volatility is relatively low, the fade-in value converges to the value of
a plain vanilla option. The latter is given in the last row (BSM: Black-
Scholes-Merton values). For simplicity, we are assuming a leap year,
as this makes 183 fixings equal to half a year. We moreover ignore
adjustments for the market being closed during weekends.
TABLE 4-5
Examples of Fade-in Call Option Values
(S =icto, x = 100, T = 0.5, r = 0.1, b = 0, n =183)
IJ a =0.1 a =0.15 a =0.2 a =0.25 a =0.3 a =0.35 a =0.4
95 105 1.5427 1.7228 1.8353 1.9118 1.9663 2.0064 2.0364
90 110 2.2929 2.7573 3.0387 3.2410 3.3968 3.5206 3.6207
85 115 2.5864 3.4034 3.8948 4.2314 4.4887 4.6974 4.8716
80 120 2.6649 3.7549 4.4901 4.9887 5.3564 5.6489 5.8931
75 125 2.6802 3.9189 4.8735 5.5533 6.0497 6.4344 6.7493
50 150 2.6828 4.0229 5.3479 6.5956 7.6934 8.6153 9.3749
BSM: 2.6828 4.0232 5.3623 6.6997 8.0350 9.3679 10.6978124 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
4.8 RATCHET OPTIONS
A ratchet option (aka moving strike option or cliquet option) consists
of a series of forward starting options. The strike price for the next
exercise date equals a positive constant times the asset price as of the
previous exercise date. For instance, a one-year ratchet call option
with quarterly payments will normally have four payments (exercise
dates) equal to the difference between the asset price and the strike
price fixed at the previous exercise date. The strike price of the first
option is usually set equal to the asset price at the time the contract is
initiated. A ratchet option can be priced as the sum of forward starting
options.
-r)t,[e(b-r)(T,-t,)N(cli) - ae-r(T,-tg)N(d2)], c = seo (4.21)
t=1
where n is the number of settlements, ti is the time to the forward
start or strike fixing, and Ti is the time to maturity of the forward
starting option. A ratchet put is similar to a sum of forward starting
puts.
4.9 RESET STRIKE OPTIONS—TYPE 1
In a reset call (put) option, the strike is reset to the asset price at
a predetermined future time, if the asset price is below (above) the
initial strike price. This makes the strike path-dependent. The payoff
for a call at maturity is equal to max[, 0], where is equal to
the original strike X if not reset, and equal to the reset strike if reset.
Similarly, for a put, the payoff is max, { 0] Gray and Whaley (1997)
x
have derived a closed-form solution for such an option. For a call, we
have
c = e(b-r)(T-r)N(-a2)N(zi)e - e-rT./V
-
a2)N(z2) rr -
S ,
- e-rT
M(a2, Y2; P) + (—
X
) eT M(ai, yi; p)
and for a put,
p e-rT
N(a2)N(-z2) - e (b-r)(T-r) N(a2)N( -zi)e -rr
b-r
P) + e
-rT
M(—a2, —Y2; P) (— x) e
)T
- al, —Yl; (
where b is the cost-of-carry of the underlying asset, a is the volatil-
ity of the relative price changes in the asset, and r is the risk-free
interest rate. X is the strike price of the option, r the time to reset (in
(4.22)
(4.23)4.10. RESET STRIKE OPTIONS-TYPE 2 125
TABLE 4-6
Examples of Reset Strike Option Type 1 Values
(S = ioo, x = 100, T= 1, r = 0.1, b = 0.1)
r=0.1 r0.2 r=0.3 r=0.4 r=0.5 r=0.6 r=0.7 r=0.8 r0.9
Call Option Values
10% 0.1095 0.1102 0.1100 0.1095 0.1089 0.1082 0.1073 0.1064 0.1053
20% 0.1459 0.1484 0.1493 0.1492 0.1485 0.1473 0.1457 0.1435 0.1404
30% 0.1871 0.1916 0.1935 0.1940 0.1934 0.1919 0.1896 0.1862 0.1811
40% 0.2300 0.2365 0.2395 0.2405 0.2400 0.2382 0.2352 0.2306 0.2235
Put Option Values
10% 0.0100 0.0110 0.0118 0.0125 0.0132 0.0137 0.0141 0.0142 0.0136
20% 0.0441 0.0466 0.0484 0.0497 0.0505 0.0510 0.0510 0.0503 0.0482
30% 0.0830 0.0867 0.0891 0.0907 0.0916 0.0920 0.0916 0.0901 0.0868
40% 0.1225 0.1272 0.1301 0.1320 0.1330 0.1332 0.1325 0.1305 0.1261
years), and T is its time to expiration. N (x) and M (a , b; p) are, respec-
tively, the univariate and bivariate cumulative normal distribution
functions. The remaining parameters are p = ./r/ T and
In(S/X) (b a2/2)r
aj =
cr,Fr
(b o-2 I2)(T - r)
o- T - r
ln(S/X) (b a 2/2)T
a../T
Z I =
yl =
Z2 = Z1 - aN/T -
Y2 = Y1 -
Table 4-6 shows reset strike type 1 option values for various time
to reset r and volatilities a.
4.10 RESET STRIKE OPTIONS-TYPE 2
For a reset option type 2, the strike is reset in a similar way as a reset
option 1. That is, the strike is reset to the asset price at a predeter-
mined future time, if the asset price is below (above) the initial strike
price for a call (put). The payoff for such a reset call is max[S - X, 0],
and inax[i - S, 01 for a put, where X is equal to the original strike X
if not reset, and equal to the reset strike if reset. Gray and Whaley
(1999) have derived a closed-form solution for the price of European
reset strike options. The price of the call option is then given by
c = Se(b-r)T M (ai , yi; P) - Xe -rTM(a2, y2; P)
- Se(b-r)T N(-ai)N (z2)e-r(T-T)
+Se(b-r)TN(-ai)N(zi),
a2 = al - a,Fr126 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
while the price of the put option is given by
p = Se(b-r)T N(ai)N(-z2)e -r(T-T) - Se(b-r)T N(ai)N( -z])
+ Xe rT M(-a2, -y2; p)- Se(b r)T M p),
where b is the cost-of-carry of the underlying asset, a is the volatility
of the relative price changes in the asset, and r is the risk-free
interest rate. X is the strike price of the option, r the time to
reset (in years), and T is its time to expiration. N(x) and M(a,b; p)
are, respectively, the univariate and bivariate cumulative normal
distribution functions. Further
ln(S I X) + (b +a2/2)t
aNff
(b +a2 /2)(T - r)
aNIT -
ln(SIX) + (b +a 2/2)T
a-IT
a2 = al -
z2 = z1 - 'N/T -
Y1 Y2 = yj - c
and p = N/rIT. For reset options with multiple reset rights, see Dai,
Kwok, and Wu (2003) and Liao and Wang (2003).
Table 4-7 shows reset strike type 2 option values for various time
to reset r, and volatilities a.
TABLE 4-7
Examples of Reset Strike Option Type 2 Values
(S = 100, X = 100, T = 1, r =0.1, b =0.1)
=0.1 r =0.2 r =0.3 r =0.4 r =-0.5 r =0.6 r =0.7 r =0.8 r =0.9
Call Option Values
10% 10.8771 10.9340 10.9248 10.8870 10.8332 10.7690 10.6960 10.6132 10.5135
20% 14.3348 14.5434 14.6162 14.6176 14.5700 14.4822 14.3551 14.1810 13.9311
30% 18.1993 18.5294 18.6722 18.7122 18.6788 18.5822 18.4215 18.1817 17.8121
40% 22.1289 22.5615 22.7635 22.8372 22.8175 22.7159 22.5294 22.2364 21.7663
Put Option Values
10% 1.0123 1.1224 1.2156 1.2991 1.3739 1.4378 1.4845 1.4991 1.4382
20% 4.5280 4.8344 5.0537 5.2180 5.3353 5.4032 5.4098 5.3261 5.0706
30% 8.5981 9.1012 9.4388 9.6728 9.8202 9.8801 9.8367 9.6484 9.1981
40% 12.8305 13.5408 14.0016 14.3066 14.4832 14.5324 14.4344 14.1348 13.47914.11. TIME-SWITCH OPTIONS 127
4.11 TIME-SWITCH OPTIONS
In a discrete time-switch call option, introduced by Pechtl (1995), 3
theinvestorreceivesanamount A At at maturity T for each time
interval At the corresponding asset price Si pt has exceeded the strike
price X. The discrete time-switch put option gives a similar payoff
A At at maturity for each time interval the asset price Stpt has been
below the strike price X.
c =Ae—rr
N (1n(S / X) + (b — At2 /2)iAt
E n (4.24)
1=1
T 2 /2)i At)
p =Ae—r' EN At
oVIEi
i=1
where n=TIAt. If some of the option's total lifetime has already
passed, it is necessary to add a fixed amount At Ae -rT m to the option-
pricing formula, where m is the number of time units where the option
already has fulfilled its condition.
Example
What is the price of a call time-switch option with one year to expira-
tion, where the investor accumulates 5 x 1/365 for each day the stock
price exceeds the strike price of 110? The stock price is currently 100,
the risk-free rate is 6%, and the volatility is 26%. S = 100, A = 5,
X = 110, T = 1, At = 1/365, r = b =0.06, a =0.26, n = T I At = 365,
m = 0 yields
c 5c-0.06x 1
65
N ln(100/110) + (0.05— 0.262/2)i x 1/365 1
= 1.3750
i=1
x 1/365 365
Computer algorithm
Function TimeSwitchOption( CallPutFlag As String, S As Double, _
X As Double, a As Double, T As Double, m As Integer, dt As Double, _
r As Double, b As Double, v As Double) As Double
Dim sum As Double, d As Double
Dim i As Integer , n As Integer , Z As Integer
n = T / dt
sum = 0
If CallPutFlag = "c" Then
Z= 1
(4.25)
3In the same paper Pechtl (1995) shows how to value continuous time-switch options.128 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
ElseIf CallPutFlag = "p" Then
Z = -1
End If
For i = 1 To n
d = (Log(S/X) + (b - vA2 / 2) * i * dt) / (v * Sqr(i * dt))
sum = sum + CND(Z * d) * dt
Next
TimeSwitchOption = a * Exp(-r * T) * sum + dt * a * Exp(-r * T) * m
End Function
Application
Discrete time-switch options have recently become quite popular in
the interest rate markets in the form of so-called accrual swaps. In a
typical accrual swap, the fixed-rate receiver accumulates an amount
equal to the notional of the swap times the fixed rate only for days
when the floating rate is below or above a certain level. Accrual swaps
can easily be priced as the sum of discrete time-switch options under
the assumptions of lognormally distributed forward rates with zero
drift.
4.12 CHOOSER OPTIONS
## 4.12.1 Simple Chooser Options
A simple chooser option gives the holder the right to choose whether
the option is to be a standard call or put after a time ti , with strike X
and time to maturity T2. The payoff from a simple chooser option at
time t1 (ti < T2) is
w(S, X, t1 , T2) = max[cBsm(S, X, T2), PBsm(S, X, T2)1,
where cBsm(S, X, T2) and pBsm(S, X, T2) are the general Black-Scholes-
Merton call and put formulas. A simple chooser option can be priced
using the formula originally published by Rubinstein (1991c):
w = Se(b-r)T2 N (d) - Xe -rT2 N(d - a/) - Se (6-07'2 m_ y)
± Xe-rT2 N(-y ±a,/tT), (4.26)
where
d = ln(S I X) ± (b ±a2/2) T2
a .../r2
ln(S I X) ± bT2 ± a2ti /2
Y -
Cr VII
Example
Consider a simple chooser option with six months to expiration and
three months to choose between a put or call. The underlying stock
price is 50, the strike price is 50, the risk-free interest rate is 8%4.12. CHOOSER OPTIONS 129
per year, and the volatility per year is 25%. S = 50, X = 50, T2 = 0.5,
= 0.25, r =0.08, b = 0.08, and a = 0.25.
In(50/50) + (0.08 + 0.25 2/2)0.5
d = = 0.3147
ln(50/50) + 0.08 x 0.5 + 0.25 2 x 0.25/2
Y — = 0.3825
0.25,/0.25
N(d) = N(0.3147) = 0.6235
N(d — aN/f2) = N(0.3147 — 0.25,i0-3) = 0.5548
N(—y) = N(-0.3825) = 0.3510
N(—y + a = N (—0.3825 + 0.25-V0.25) = 0.3984
w _ 50e(0.08-0.08)0.5 _ 50e-0.0s x0.5N N(d) — 0 .25,./i53)
_ 50e(0.08-0.08)0.5 N(_y) 50e -0085 N (—y 0.25,/0.25) = 6.1071
## 4.12.2 Complex Chooser Options
A complex chooser option, introduced by Rubinstein (1991c), 4 gives
the holder the right to choose whether the option is to be a standard
call option after a time t, with time to expiration Tc and strike X, or
a put option with time to maturity Tp and strike X. The payoff from
a complex chooser option at time t (t < T, T) is
W(S, Xc, X p, t, Tc, Tp) = MaX[CBSM Xc, Tc), PBSM(S, X p,Tp)i,
where cBsm(S, X, T) and pBsm(S, X, T) are the BSM call and put
formulas, respectively.
w = Se(b—r)Tc M(di, yi; P1)
— X ce rT( M (d2, yi — a - N/T c; PI) — Se (b r)TP A1( —dl, — Y2; P2)
± X pe—rTP M (—d2, —Y2 ± oVTp; P2), (4.27)
4See also Nelken (1993).130 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
where Tc is the time to maturity on the call, and Tp is the time to
maturity on the put.
in(S II) ± (b a2 /2)t
= d2 = —aVi
in(S I 'Cc) (b a2 I2)Tc in(S I X p) (b a2 I2)Tp
P1= N/t1Tc P2=
and / is the solution to
le(b— )( —`) N(z ) — Xe e —`) N(z — aN/Te — t)±
le(b—r)(TP—t) N (—z2) — X pe —r(TP—t) N (—Z2 ± a N/T p — t) = 0
Y1= Y2 =
ln(I IXc) (b a2 12)(Tc — t) 1n(I/X) (b a 2 /2)(Tp — t)
Z1 =
cr Tc — t
Z2 =
a.\1Tp — t
Example
Consider a complex chooser option that gives the holder the right to
choose whether the option is to be a call with six months to expiration
and strike price 55, or a put with seven months to expiration and
strike price 48. The time to choose between a put or call is in three
months, the underlying stock price is 50, the risk-free interest rate per
year is 10%, the dividend yield is 5% per year, and the volatility per
year is 35%. S = 50, Xc = 55, Xp = 48, Tc = 0.5, Tp = 0.5833, t = 0.25,
r =0.1, b = 0.1 —0.05 = 0.05, and a =0.35.
16(50/51.1158) + (0.05 + 0.35 2/2)0.25
= = 0.0328,
where a Newton-Raphson search gives the solution to the critical
value / = 51.1158, and
d2 = d1 — O.35.Jö = —0.1422
ln(50/55) + (0.05 + 0.35 2/2)0.5
= .Y1 = —0.1604
ln(50/48) + (0.05 + 0.35 2/2)0.5833
Y2 = = 0.3955
0.35,./0.5833
= N/0.25/0.5 = 0.7071 p2 = N/0.25/0.5833 = 0.6547
M (di , yi; pi) =0.3464 M(d2, — --= 0.26604.12. CHOOSER OPTIONS 131
M(—di, —Y2;P2)==0.2725 M(—d2, —Y2-1-035 ,015833;P2)=03601
w = 50e(0.05-0 .00 .5m
(di , Yi; P1)
_.55e—oAxo.511/(,12,yi_ cr-,177; P1)
50e(0.05-0.1)0.5833 ' °5833M( —d1, —Y2; P2)
+ 48e-0.05 x0.5833 A,//
/V1 k-u2, — Y2 + 0.-X; P2) = 6.0508
Computer algorithm
The computer code returns the value of a complex chooser option.
Function ComplexChooser(S As Double, Xc As Double, Xp As Double, _
T As Double, Tc As Double, Tp As Double, _
r As Double, b As Double, v As Double) As Double
Dim dl As Double, d2 As Double, yl As Double, y2 As Double
Dim rhol As Double, rho2 As Double, i As Double
i = CriticalValueChooser(S, Xc, Xp, T, Tc, Tp, r, b, v)
dl = (Log(S/i) + (b + vA2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
yl = (Log(S/Xc) + (b + vA2 / 2) * Tc) / (v * Sqr(Tc))
y2 = (Log(S/Xp) + (b + vA2 / 2) * Tp) / (v * Sqr(Tp))
rhol = Sqr(T / Tc)
rho2 = Sqr(T / Tp)
ComplexChooser = S * Exp((b — r) * Tc) * CBND(dl, yl, rhol) _
— Xc * Exp(—r * Pc) * CIESND(d2, yl — v * Sqr(Tc), rhol) _
— S * Exp((b — r) * Tp) * CEINID(—dl, —y2, rho2) _
+ Xp * Exp(—r * Tp) * CMIX—d2, —y2 + v * Sqr(Tp), rho2)
End Function
The critical stock value / is found by calling the function
CriticalValueChooser(•) below, which is based on the Newton-Raphson
algorithm.
Function CriticalValueChooser(S As Double, Xc As Double, _
Xp As Double, T As Double, Tc As Double, Tp As Double, _
r As Double, b As Double, v As Double) As Double
Dim Sv As Double, ci As Double, Pi As Double, epsilon As Double
Dim dc As Double, dp As Double, yi As Double, di As Double
Sv = S
ci = GBlackScholes("c", Sv, Xc, Tc — T, r, b, v)
Pi = GBlackScholes("p", Sv, Xp, Tp — T, r, b, v)
dc = GDelta("c" , Sv, Xc, Tc — T, r, b, v)
dp = GDelta("p" , Sv, Xp, Tp — T, r, b, v)
yi = ci — Pi132 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
di = de — dp
epsilon = 0.001
'Newton —Raphson s kep roses s
While Abs(yi) > epsilon
Sv = Sv — yi / di
ci = GBlackScholes("c", Sv, Xc, Tc — T, r, b, v)
Pi = GBlackScholes("p", Sv, Xp, Tp — T, r, b, v)
dc = GDelta("c", SY, Xc, Tc — T, r, b, v)
dp = GDelta("p", SY, Xp, T.p — T, r, b, v)
yi = ci — Pi
di = de — dp
Wend
CriticalValueChooser = Sv
End Function
where CND() is the cumulative normal distribution function, and
CBND(•) is the cumulative bivariate normal distribution function
described in Chapter 13. Example: Comp/exChooser(50, 55, 48, 0.25,
0.5, 0.5833, 0.1, 0.05, 0.35) returns a chooser value of 6.0508 as in the
numerical example above.
4.13 OPTIONS ON OPTIONS
A model for pricing options on options was first published by Geske
(1977). It was later extended and discussed by Geske (1979), Hodges
and Selby (1987), and Rubinstein (1991a), among others.
Call on Call
Payoff: max[cBsm(S, X1, T2) — X2; 01, where Xi is the strike price of the
underlying option, X2 is the strike price of the option on the option,
and cBsm(S, Xi, T2) is the generalized BSM call option formula with
strike Xi and time to maturity T2. The value is
ccan =
se(b-r)T2m(zi, yi; p) ) Xie —rT2 M(Z2, Y2; P)
— X2e —rtl N(Y2), (4.28)
where
ln(S I I) + (b o-2/2)t1
Y2 = yi Y1 =
a
ln(S / Xi) + ±a
2
/2/T2
41 =
a 17— '2
Z2 = Z1 — a -VT2
P = 0117.2,
where T2 is the time to maturity on the underlying option, and ti is
the time to maturity on the option on the option.4.13. OPTIONS ON OPTIONS 133
Put on Call
Payoff: max[X2 — CBSM ( X1, T2); 0]
Peall = X te—rT2 An( —y2; — 14 — Se ° r)T2 M(Z), — Y1; P)
X2e —rt1 N(—y2),
where the value of I is found by solving the equation
cBsM(I, X1, T2 — tl) = X2
Call on Put
Payoff: max[PBsm(S, X1, T2) — X2; 0]
rCpur = X le T2 — z2, —Y2; p) — Se(b r)T2 1(— Z1, — Y1; 14
—X2e ni
N ( —y2)
Put on Put
Payoff: max[X2 — PBSM (S X1, T2); 0]
P put = Se(b—r)T2 M( —Z1, Yl; — 14 — X le —rT2 Al( —Z2, Y2; — 14
X2e —rt1 N(2),
where the value of I is found by solving the equation
PBSM(I, X1, T2 — t1) = X2
Example
Consider a put-on-call option that gives the option holder the right
to sell a call option for 50, three months from today. The strike on
the underlying call option is 520, the time to maturity on the call
is six months from today, the price on the underlying stock index
is 500, the risk-free interest rate is 8%, and the stock index pays
dividends at a rate of 3% annually and has a volatility of 35%. S = 500,
X1 = 520, X2 = 50, t1 = 0.25, T2 = 0.5, r =0.08, b = 0.08 — 0.03 = 0.05,
and a =0.35.
The critical value I is
cBsM(I, X1, T2 — t1) = X2
cBsM(I, 520, 0.5 —0.25) = 50
/ = 538.3165
ln(500/538.3165) + (0.05 + 0.35 2/2)0.25
Y1 = = 0.2630
0.35,425
Y2 = Yi — 0.35,./0.25 = —0.4380
ln(500/520) + (0.05 + 0.352/2)0.5
Z1 = = 0.0663
0.35,/r3
(4.29)
(4.30)
(4.31)134 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
Z2 = zi —0.35A./(= —0.1812
p = V0.25/0.5 =0.7071
m(z2, —y2; —p) = 0.1736 M(zi, —)1; — P) = 0.1996
N ( —Y2) = 0.6693
Pcall =520e 8 x0.5
— y2; — P)
— 500e ("5—0.08)0.5 m —yi ; —P)
506H0.08 X 0.25 N ) = 21.1965
Computer algorithm
The computer algorithm OptionsOnOptions(.) returns the value of an
option on an option. Setting the TypeFlag equal to "cc" gives a call on
call, "cp" gives a call on a put, "pp" gives a put on a put, and "pc" gives
a put on a call.
Function OptionsOnOptions(TypeFlag As String, S As Double, X1 As Double, _
X2 As Double, ti As Double, T2 As Double, r As Double, _
b As Double, v As Double) As Double
Dim yl As Double, y2 As Double, zl As Double, z2 As Double
Dim i As Double, rho As Double, CallPutFlag As String
If TypeFlag = "cc" Or TypeFlag = "pc" Then
CallPutFlag = "c"
Else
CallPutFlag = "p"
End If
i = CriticalValueOptionsOnOptions(CallPutFlag, Xl, X2, T2 ti , r, b, v)
rho = Sqr(t1 / T2)
yl = (Log(S/i) + (b + vA2 / 2) * ti) / (v * Sqr(t1))
y2 = yl — v * Sqr(t1)
zl = (Log(S/X1) + (b + vA2 / 2) * T2) / (v * Sqr(T2))
z2 = zl — v * Sqr(T2)
If TypeFlag = "cc" Then
OptionsOnOptions = S * Exp(( b — r) * T2) * CBND(z1, yl, rho)
— X1 * Exp(—r * T2) * CBND(z2, y2, rho)
— X2 * Exp(—r * ti) * CND(y2)
ElseIf TypeFlag = "pc" Then
OptionsOnOptions = X1 * Exp(—r * T2) * CBND(z2, —y2, —rho)
— S * Exp(( b — r) * T2) * CBND(z1, —yl, —rho) _
+ X2 * Exp(—r * ti) * CND(—y2)
ElseIf TypeFlag = "cp" Then
OptionsOnOptions = X1 * Exp(—r * T2) * CBND(—z2, —y2, rho) _
— S * Exp((b — r) * 12) * CBND(—z1, rho) _
— X2 * Exp(—r * ti) * CND(—y2)
ElseIf TypeFlag = "pp" Then
OptionsOnOptions = S * Exp(( b — r) * T2) * CBND(—z1, yl, —rho)
— X1 * Ep(—r * T2) * CBND(—z2, y2, —rho) -4.13. OPTIONS ON OPTIONS 135
+ Exp( — r * ti) * X2 * CND( y2 )
End If
End Function
Function CriticalValueOptionsOnOptions(CallPutFlag As String, X1 As Double,
X2 As Double, T As Double, r As Double, b As Double, v As Double) As Double
Dim Si As Double, ci As Double, di As Double, epsilon As Double
Si = X1
ci = GBlackScholes(CallPutFlag, Si, Xl, T, r, b, v)
di = GDelta(CallPutFlag, Si, Xl, T, r, b, v)
epsilon = le-06
'II Newton —Raphson algorithm
While Abs( ci — X2) > epsilon
Si = Si — (ci — X2) / di
ci = GBlackScholes(CallPutFlag, Si, Xl, T, r, b, v)
di = GDelta(CallPutFlag, Si, Xl, T, r, b, v)
Wend
CriticalValueOptionsOnOptions = Si
End Function
where CND() is the cumulative normal distribution function and
CBND(.) is the cumulative bivariate normal distribution function
described in Chapter 13. Example: OptionsOnOptions ("pc", 500, 520,
50, 0.25, 0.5, 0.08, 0.05, 0.35) returns a put-on-call price of 21.1965,
as in the numerical example above.
4.13.1 Put—Call Parity Compound Options
Shilling (2001) gives the put-call parity between options on options
ccall(S , X 1, X2, ti, T2, r, b, ) X2e —rt — Pcall(S , Xi, X2, ti , T2, r, b, o-)
cBsM(S, Xi, T2, r, b, a) (4.32)
That is, a call on a call plus the discounted strike price of the compound
options is equal in value to a put on a call plus a standard call with
strike X1 and time to maturity T2. Similar we have
cput (S , X1, X2,11, T2, r, b, a) + X2e —rti = Ppw(S, X1, X2, t1, T2, r, b, a)
PBSM(S., Xi, T2, r, b, a). (4.33)
That is, a call on a put plus the discounted strike price of the compound
options is equal in value to a put on a put plus a standard put with
strike Xi and time to maturity T2.136 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
## 4.13.2 Compound Option Approximation
Bensoussan, Crouhy, and Galai (1995), show how to approximate the
value of a call on call option using the Black-Scholes-Merton formula;
see also Bensoussan, Crouhy, and Galai (1997). The approximate
value is given by
ccall CBSM N (di) — X2e—rt1 N (d2)
d
ln(cBsm IX2) ± +er212)(i i =
N/T-T
d2 = di — a Nfiri-,
(4.34)
and the volatility of the underlying option can be approximated by
IABSMIS
a
cBSM
where
cBSM = cBSM(S. X1, T2, r, b, ABSM = ABSM(S, X1, T2, r, b, a)
For a put on a call, the approximate value is
Peal! X2e
rti N(d_ ) cBSMN(dI)
The approximation is quite accurate for at- and in-the-money
options. It is less accurate for out-of-the-money options. The formula
approximates the volatility of the underlying call option by a. The
formulas would have been exact closed-form solutions if the volatility
of the underlying option was constant through time. We know from
a simple application of Ito's lemma, however, that the volatility of
the underlying option will change through time, even if the volatility
of the underlying asset is assumed to be constant. The a is thus an
approximating average volatility of the underlying option.
Example
Consider the same example as used to illustrate the exact compound
option formula: a put-on-call option that gives the option holder the
right to sell a call option for 50, three months from today. The strike
on the underlying call option is 520, the time to maturity on the call
is six months from today, the price on the underlying stock index
is 500, the risk-free interest rate is 8%, and the stock index pays
dividends at a rate of 3% annually and has a volatility of 35%. S =
500, X1 = 520, X2 = 50, ti = 0.25, T2 = 0.5, r =0.08, b = 0.08 — 0.03 =
0.05, a =0.35. First we have to calculate the value of the call option4.13. OPTIONS ON OPTIONS 137
CBSM(S, Xl, T2, r, b, cr):
In(500/520)± (0.05 ± 0.352/2)0.5
- = 0.0663
0.35,
d2 = - .1f2 = 0.0663 - -0.1812
N(di)= N(0.0663) = 0.5264 N(d2) = N(-0.1812) --= 0.4281
c = 500e(0.05-0.08)0.5 N(di)- 520e-0.08x0.5Nz = 45.4081
Next we calculate the volatility of the underlying option:
I Aesm(s, X1, T2, r, b, a)IS e(0.05-0.08)0.5N(d1) x 500
6- = 0.35 x
Now we can calculate the option on option value:
d =
In(45.4081/50) ± (0.05 ± 1.99862/2)0.25
= 0.4158 1
1.9986 JO
d2 - -= di - =0.4158 - 1.9986 Jö -0.5835
N (-di) = N(-0.4158) = 0.3388 N(-d2) = N(0.5835) = 0.7202
This gives us a put on call value of
.08x0.25 N ._
Pcall 45.4081 x N(-d1) _ xe- 0 d2) = 19.9147
The exact value is 21.1965, so in this case, the approximation is
not very good. However, this approach at least gives us quite good
intuition behind the basics of compound option valuation.
ATM-ATM Approximate Compound Option
In the special case of an at-the-money compound option on an at-the
money forward underlying option, the value can be approximated by
col!! Pcall So Nfii-(0.08cr .1f2 + 0.2)
or
S0.40,./4-(0.2a N/T2 ± 0.5) = BS(ti)ATMF x 6,(T2)ATmF
The value is thus approximately equal to Black-Scholes at-the-money
forward with time to maturity ti (BS(ti )AimF), multiplied by the
Black-Scholes delta for an option at-the-money forward with time to
maturity T2 (A(TDATMF). Similarly, for a call on a put or a put on a
put, we have
cput pput S0.4aji:(0.5 - 0.2oVf2) = BS(tl)ATm X (-A(TDATMF)
cBsm(S, Xi, r, a) 45.4081
1.9986z1 = Z2 =
a N/T- '2 a-16
ln(S 1 X2) + (b + a2 12)T2 ln(S 1 Xi) + (b + a2/2)t1
138 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
4.14 OPTIONS WITH EXTENDIBLE MATURITIES
Valuation of extendible options was introduced by Longstaff (1990).
Extendible options can be found embedded in several financial con-
tracts. For example, corporate warrants have frequently given the
corporate issuer the right to extend the life of the warrants. Firms
involved in leveraged buyouts from time to time issue extendible
bonds where maturity can be extended at the firm's discretion.
Another example is options on real estate where the holder can extend
the expiration by paying an additional fee.
## 4.14.1 Options That Can Be Extended by the Holder
These are options that can be exercised at their maturity date ti but
that also allow the holder at that time to extend the life of the option
until T2 by paying an additional premium A to the writer of the option.
The strike price of the option can be adjusted from Xi to X2 at the time
of the extension. The payoff from options that can be extended by the
holder at time t1 (t1 < T2) is
c(S, X], X2, t], T2) = max[S — X1; cBsm(S, X2, T2 — t]) — A; 0]
P(S, X1, X2, t], T2) = max[X] — S; PBSM(S, X2, T2 — t1) — A; 0],
where cBsm (S, X2, T2 — t1) is the general Black-Scholes-Merton call for-
mula, and pBsm(S , X2 , T2 — t1) is the general Black-Scholes-Merton put
formula.
Extendible Call
C = cBsm(S, X1, tl) Se (b—r)T2 Al2(Yi, Y2, —00, Zi; P)
—X2e rT2 M2 (y] — y2 — —00, zi — 0"1/T2; p)
—Se(b—r)t1 N2(yi, z2) + Xi e—rtl N2 (yi — cr,V6, z2 —
—Ae "I N2(Y1 — a/6, Y2 — (4.35)
where
1MS/ /2) (b + a2 12)ti ln(S/ /i ) (b + a212)ti
Y1 = Y2 =
cf.,/6
P = 0117'2,
where /1 is the critical value of S at time ti , below which the option is
not extended. 12 is the critical value of S at time ti , where the option4.14. OPTIONS WITH EXTENDIBLE MATURITIES 139
will be exercised rather than extended. The critical values I j and 12
are the respective solutions to
cBSM ( 11, X2, T2 - t1) = A cBSM(12, X2, T2 - t1) = - X1 ± A
If A = 0 then Ii = 0, and if A < X - X2e -r(T2-t1) then 12 = oo. The call
is extended only if I < S < 12. IfS < /1 at ti , the option expires out-of-
the-money, and if S> 12 at ti it is optimal to exercise the option rather
than extend it. The extendible call has several special cases:
• If Ii = 0 and 12 = oo, the call will always be extended.
• If Ii > 0 and 12 = oo, the value of the extendible call reduces to
a standard call on a call with strike equal to A. The underlying
call has strike X2 and time to maturity (7'2 - t1).
• If Ii > X1, the extendible call will never be extended.
The probability M2(a, b, c, d; p) and N2(a, b) can be determined
directly from the standard bivariate normal distribution and the
standard normal distribution
M2(a, b, c, d; p) = M(b, d; p) - M (a , d; p) - M(b, c; p) + M (a, c; p)
N2(a, b) = N(b) - N(a)
Extendible Put
P = PBSM(S , X1, t1) - Se"' r)T2 M2(Y1, Y2, -co, -Zi; P)
X2e -rT2 M2(Y1 - aNgi., Y2 - a Ngi, -Zi a\/; P)
Se(b-r)t1 N2(Z2, Y2) - Xie -r tl N2(Z2 - a Y2 - N,(ii)
- Ae " I N2(Y) T Y2 - (4.36)
where the variables Ii and 12 are solutions to
pgsm (11, X2, T2 - 11) = Xi - 11 ± A, PBSM( 12, X2, T2 - 14) = A
If A = 0, then 12 = 0G. The put is extended only if ii < S < I. The
extendible put has several special cases:
• If A = 0 and /1 = 0, the put will always be extended.
• If A > 0 and ii = 0, the value of the extendible put reduces to
a standard call on a put with strike A. The underlying put has
strike X2 and time to maturity (7'2 - t1).
• If 12 < Xi or 1 = X1, the extendible put will never be extended.140 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
Example
Consider an extendible call with initial time to maturity six months,
extendible for an additional three months. The stock price is 100, the
initial strike price is 100, the extended strike price is 105, the risk-
free interest rate is 8% per year, the volatility is 25% per year, and
the extension fee is 1. S = 100, X1 = 100, X2 = 105, t1 = 0.5, T2 = 0.75,
r =0.08, b = 0.08, a =0.25, and A = 1.
ln(100/105.7138) + (0.08 + 0.25 2/2)0.5
= = 0.0003 Y1
The critical values Ii and 12 can easily be found by the Newton-
Raphson algorithm. It gives /1 = 86.7406 and 12 = 105.7138.
ln(100/86.7406) + (0.08 + 0.25 2/2)0.5
Y2= =1.1193
ln(100/105) + (0.08 + 0.252/2)0.75
z1 = = 0.1600
0.25.75
ln(100/100) + (0.08 + 0.252/2)0.5
Z2 = = 0.3147
p = \/0.5/0.75 = 0.8165
M2(Y1, Y2, —10, zi; P) = 0.1277
M2(Y1 — 0.25, y2 — 0.25, —10, zi — 0.25,./(75; p)= 0.1181
N2 (yi, z2) = 0.1234, N2 (y1 — 0.25,k, y2 — 0.25 = 0.3971
N2 (yi — 0.25Jö, z2 — 0.25, 1: /1) = 0.1249
cBsm(100, 100, 0.5) = 9.0412
c = 9.0412 + 100e(0.08-0.08)0.75
114 2)Y1 , Y2, —00, Z1; P)
— 105e-0.08x0.75
ivi2(Y1 aViT, Y2 — a ViT, —00, zi — aff2; P)
100e(0.08-0.08)0.5
/v2(y1, Z2) — 100e
-0.08x0.5 N2 ,...1 _ r—
ky Cry , Z2 — aViT)
_ le-0.08 x0.5 N2 (yi -
a /ij, Y2 - a NitT) = 9.4029
## 4.14.2 Writer-Extendible Options
These options can be exercised at their initial maturity date /I but are
extended to T2 if the option is out-of-the-money at ti. The payoff from
a writer-extendible call option at time ti (ti < T2) is
c(s, xi , X2, T2) = (S - X1) if S Xi else cBsm(S, X2, T2 /1),4.15. LOOKBACK OPTIONS 141
and for a writer-extendible put is
p(S. Xi, X2, ti, T2) = (Xi - S) if S <Xi else
Writer-Extendible Call
Pesm (S. X2, T2 — r1)
C = cBSM(S, XI, ti) + Se(b-r)T2,,,, 1)1 kZ1, -Z2; -P)
_ x2e -rT2 m (_ 1 z a 17-7 2, -z2 + a Vii; -P)
Writer-Extendible Put
P = PBSM(S. X1, t1) + X2e -rT2 M (-zi +oT2, z2 - -P)
- Se(b-r)T2 M( -zi. z2; -P)
Example
Consider a writer-extendible call on a stock with original time to matu-
rity six months, that will be extended three months if the option is
out-of-the-money at ti . The stock price is 80, and the initial strike
price is 90. If the option is extended, the strike price is adjusted to 82.
The risk-free interest rate is 10%, and the volatility is 30%. S = 80,
X1 = 90, X2 = 82, t1 = 0.5, T2 = 0.75, r =0.1, b = 0.1, and a = 0.3.
ln(80/82) +(0.1 + 0.32/2)0.75
— = 0.3235
0.3,/0.75
ln(80/90) + (0.1 + 0.32/2)0.5
Z2 = = 0.2135
p = N/0.5/0.75 = 0.8165
M(zi , —z2; — P) = 0.2369, M(zi — 0.3,/0.75, —z2 + — p) = 0.2192
cBsm(80, 90, 0.5) = 4.5418
c — 4.5418 + 80e(" —°.1)°35 M(zi —z2; — P)
— 82e-0.1x0.7534(7,1 /
0.3v 0.75, —z2 + 0.3 ,/0; — P) =6.8238
4.15 LOOKBACK OPTIONS
## 4.15.1 Floating-Strike Lookback Options
A floating-strike lookback call gives the holder of the option the right
to buy the underlying security at the lowest price observed, Smin,
during the option's lifetime. Similarly, a floating-strike lookback put
gives the option holder the right to sell the underlying security at the
(4.37)
(4.38)142 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
highest price observed, Smax , during the option's lifetime. The payoff
from a standard floating-strike lookback call option is
c(s, Smin , T) = max(S – Smin; 0) = S –
and for a put it is
P(S Smax, T) = max(S max – S; 0) = Smax – S
Floating-strike lookback options were originally introduced by
Goldman, Sosin, and Gatto (1979). 5
Floating-Strike Lookback Call
If b 0 then
c— Se(b–r)T N(ai) – Smine
rT N(a2)
2h
Se–rT [( N (--ai —
2b
-\5") – ebT N ( –ai)1
2b Smin
2 e —
and if b = Owe have
c = Se- rT N (al) – Smin e rT N(a2)
Se-rT IT [n(a1)-1- ai(N(ai) – 1)1,
where
ln(S/Smin ) + (b a2/2)T
al =
a -VT
a = al – aN/T
Floating-Strike Lookback Put
If b 0 then
p = Smax e–rT N(–b2) – Se (b–r)T N( –bi)
2b
2b T " v T )
+ Se Nbi ebT N (bi) –r [ ) (
Smax
and if b = 0 we have
J) = smax e-rT N(-b2)- se(b-r)T N(-bi)
+ Se-rTaN/T[n(bi)+
where
b
ln(S I Smax) (72 I2)T
1=
b2 = -
(4.39)
(4.40)
(4.41)
(4.42)
5See also Garman (1989).4.15. LOOKBACK OPTIONS 143
Example
Consider a lookback call option with six months left to expiration.
Assume it gives the right to buy the underlying stock index at the
lowest price recorded during the life of the option and that the mini-
mum stock index price observed so far is 100, the stock price is 120, the
risk-free interest rate is 10%, the dividend yield is 6%, and the volatil-
ity is 30%. S = 120, Smin = 100, T = 0.5, r = 0.1,b = 0.1 — 0.06 = 0.04,
a =0.3.
ln(120/100) ± (0.04 ± 0.32/2)0.5
at - = 1.0598
a2 = al - = 0.8477
N(a1) = N(1.0598) = 0.8554
N (a2) = N(0.8477) = 0.8017
N(-a1) = N (-1.0598) = 0.1446
2 x 0.04 I—
N (-al ± V0.5) = 0.1918
0.3
c = 120e("4-°'1)115N(al) - 100e-0.1x0.5 N(a2) 120e-0.1 x0.5
012
2 x 0.04
120 [
100
- 2x0.04/0.32 2 x 0. /—
°4
x N _al ±
03 - e"4".5N(-ai) = 25.3533
Application
Floating-strike lookback options can be used to construct what is
sometimes marketed as a range or hi—low option. A range option guar-
antees a payout equal to the observed range of the underlying asset,
through the life of the option. This is actually just a lookback straddle:
a long lookback call plus a long lookback put with the same time to
maturity.
## 4.15.2 Fixed-Strike Lookback Options
In a fixed-strike lookback call, the strike is fixed in advance. At expi-
ration, the option pays out the maximum of the difference between
the highest observed price during the option's lifetime, Sm ax, and the
strike X, and 0. Similarly, a put at expiration pays out the maximum of
the difference between the fixed-strike X and the minimum observed
price, Smin , and 0. Fixed-strike lookback options can be priced using
the Conze and Viswanathan (1991) formula.
Fixed-Strike Lookback Call
c = Se(b-r)T N (di) - Xe -rT N (d2)
2b
„.2 2b wr
4- Se-rT [ N (di - —V
0+ pi(di) (4.43)
2b X a144 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
where
In(S / X) + (b +a2/2)T
cr,if
d2 =- - d1 — a
When X < Smax
c e—rT (smax _ X) ± Se (b—r)T N(ei)— Smaxe —rT N(e2)
rT 2bE x
0.2 (
+ Se— Y N (ei — —
2b ebTmei) ,
where
In(S/Smax)+ a2 /2)T
aNif
e2 = ei — a Nif
Fixed-Strike Lookback Put
p = Xe—rT N(—d2)— Se (b—r)T N (—di)
+ Se [( N
—rT a2 N(—di) (4.44) = S
2b X a
When X > Smin
p = e—rT (X — Smin) — Se (b—r)T N( — f1)± Smine—rT N(__f2)
26
a2 2b r— ;, T
2bkSmin
N (— + T) — N(— fi) ,
where
In(S1Smin ) + (b +a2/2)T
fl — f2=
aff
Table 4-8 shows values for fixed-strike lookback call and put
options, for different values of time to maturity T, strike price X,
and volatility a.
## 4.15.3 Partial-Time Floating-Strike Lookback
Options
In the partial-time floating-strike lookback options, the lookback
period is at the beginning of the option's lifetime. Time to expiration
is T2, and time to the end of the lookback period is t1 (t1 < T2). Except
for the partial lookback period, the partial-time floating-strike look-
back option is similar to a standard floating-strike lookback option.
However, a partial lookback option must naturally be cheaper than
a similar standard floating-strike lookback option. Heynen and Kat
(1994c) have developed formulas for pricing these options.
264.15. LOOKBACK OPTIONS 145
TABLE 4-8
Fixed-Strike Lookback Option Values
(s = Smin = Smax = 100, r = 0.1, b = 0.1)
Call Put
X o =0.1 a=0.2 a = C.3 a = 0.1 a = 0.2 a = 0.3
T =0.5 95 13.2687 18.9263 24.9857 0.6899 4.4448 8.9213
100 8.5126 14.1702 20.2296 3.3917 8.3177 13.1579
105 4.3908 9.8905 15.8512 8.1478 13.0739 17.9140
T = 1 95 18.3241 26.0731 34.7116 1.0534 6.2813 12.2376
100 13.8000 21.5489 30.1874 3.8079 10.1294 16.3889
105 9.5445 17.2965 25.9002 8.3321 14.6536 20.9130
Partial-Time Floating-Strike Lookback Call
C = Se(b-r)T2N(d1 gi) _A5mine -rT2 N(d2 gi)
2b
[
2bA/ri
± ASe-rT2 e_ _s (72- m _f, +
2b Smin (7
A/r2
-
2b
+ gi; ■/tilT2)
a
2b
- ebT2 XjA1( -d1 gl el g2; - tl T2)]
+ se(b-r)T2 A4(_di el - 82; - t1/T2)
+ ASmine -rT2 M(- f2, d2 - 81; ---011T2)
- e
-b(T2 --to 1 ± (72 Ase(b-r)T2N(e2 - g2)N(- fi)
2b
(4.45)
The factor A enables the creation of so-called "fractional" lookback
options where the strike is fixed at some percentage above or below
the actual extreme, A > 1 for calls and 0 <A < 1 for puts.
ln(S/Mo) (b a2/2)T2
d1=
crA/r 2
(b (7 212)(T2 - 1'1)
ln(S 1 MO (b ± a212)1.1
f2 =
ln(X) ln(X)
ei -
N/T2 -
e2 = el - CY 0.2 t1S = Smin = Smax =90 S - Smin = SMaX = 110
ti = 0.25 ti = 0.5 ti = 0.75 ti = 0.25 ti = 0.5 i = 0.75
0.1 8.6524 9.2128 9.5567 10.5751 11.2601 11.6804
0.2 13.3402 14.5121 15.3140 16.3047 17.7370 18.7171
0.3 17.9831 19.6618 20.8493 21.9793 24.0311 25.4825
0.1 2.7189 3.4639 4.1912 3.3231 4.2336 5.1226
0.2 7.9153 9.5825 11.0362 9.6743 11.7119 13.4887
0.3 13.4719 16.1495 18.4071 16.4657 19.7383 22.4976
call a =
call a =
call a =
put a =
put a =
put a =
146 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
where
Smin if call
Mo=
Sraax if put
Partial-Time Floating-Strike Lookback Put
p = AS,nax e-rT2 N (-d2 + 81) - Se(b-r)T2 N(_di + 81)
2
ASe -rT2Cr
c
[ max )
[
2b
2b
M (fl
2bdri
v
a
2b,/r2
+ 81; VtliT2)
6
2b
ebT2 A -T °. M(di + 81, -el - 82; r1/ T2)]
- Se(b-or2m (di - -el + 82; -t1/T2)
- AS max e-rT2 M(f2, -d2 +g1; -./(1/ T2)
e
-b(T2 -(i) 1 ASe(b -
r)T2 N (-
e2 g2)N(f1)
2b
(4.46)
Table 4-9 shows values for partial-time floating-strike lookback call
and put options. Different input parameters are used for the volatility
a, the asset price S, and the time to the end of the lookback period t1.
TABLE 4-9
Partial-Time Floating-Strike Lookback Option Values
(T2 = 1, r = 0.06, b = 0.06, A = 1)4.15. LOOKBACK OPTIONS 147
4.15.4 Partial- Time Fixed- Strike Lookback Options
For the option described here the lookback period starts at a prede-
termined date t1 after the option contract is initiated. The partial-
time fixed-strike lookback call pays off the maximum of the highest
observed price of the underlying asset in the lookback period,
in excess of the strike price X, and 0. The put pays off the maximum
of the fixed-strike price X minus the minimum observed asset price
in the lookback period (T2 — t1), Smin , and 0. This option is naturally
cheaper than a similar standard fixed-strike lookback option. Heynen
and Kat (1994c) have published closed-form solutions for these types
of options.
Partial-Time Fixed-Strike Lookback Call
c = Se(b-r)T2 N (di) - Xe-rT2 N (d2)
2b
+ Se- rT2 :-[- ( = S )
2b X
x M (di
2b,/r2 2b../1T
,
, ^ ebT2m ,ei ( di; — T2)
— Se(b—r)T2 M( —ei, di; t1/T2)
—Xe —rT2 M(f2, —d2; --Vt1/ 7.2)
rr2
^ e- b(T2 - ti) (1 se(b-r)T2 N(A )N (_e2),
2b
where d1, el, fi are defined under the floating-strike lookback options.
Partial-Time Fixed-Strike Lookback Put
p =xe-rT2 N(_d2) - Se -r N (-di) + Se-rT2 (b)T2
2b
_di + 21,N/T'2 itT
x[(-- x - S "71
(
f
2b
ti/T2)
0-
_ebT2 m(_ei ,_d1;\/1- T2)
(4.47)
2b148 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-10
Partial-Time Fixed-Strike Lookback Option Values
(s = 100, T2 = 1, r =0.06, b = 0.06)
X = 90 X = 110
ti = 0.25 t1 = 0.5 ti = 0.75 t1 = 0.25 t1 = 0.5 t1 = 0.75
call a =0.1 20.2845 19.6239 18.6244 4.0432 3.9580 3.7015
call a =0.2 27.5385 25.8126 23.4957 11.4895 10.8995 9.8244
call a = 0.3 35.4578 32.7172 29.1473 19.7250 18.4025 16.2976
put a = 0.1 0.4973 0.4632 0.3863 12.6978 10.9492 9.1555
put a = 0.2 4.5863 4.1925 3.5831 19.0255 16.9433 14.6505
put a = 0.3 9.9348 9.1111 7.9267 25.2112 22.8217 20.0566
se(b-r)T2
M(e1, -d1; - 07'2)
Xe -rT2 M( -f2, d2; -1(1/ T2)
2
_ e-b(T2-/1) _ c t) se(b-r)T2N(- fON(e2)
2b
(4.48)
Table 4-10 shows examples of partial-time fixed-strike look-
back call and put option values. The input parameters vary as in
Table 4-9.
## 4.15.5 Extreme-Spread Options
The time to maturity of an extreme-spread option is divided into two
periods: one period starting today and ending at time ti, and another
period starting at t1 and ending at the maturity of the option T2. The
payoff at maturity of a call (put) equals the positive part of the differ-
ence between the maximum (minimum) value of the underlying asset
of the second (first) period, Smax , and the maximum (minimum) value
of the underlying asset of the first (second) period. Likewise, the payoff
at maturity of a reverse extreme spread call (put) equals the posi-
tive part of the difference between the minimum (maximum) of the
underlying asset of the second (first) period, Smin , and the minimum
(maximum) value of the underlying asset of the second (first) period.
Formulas for valuation of these types of options were introduced by
Bermin (1996b).4.16. LOOKBACK OPTIONS 149
Extreme-Spread Option Values
( e a2 ( –m 2 7'2 –b(T2–ti)se(b–r)T2 N 11 )
26 ri N/T2
x (1 a2 N ( –rn e –rT2 AI- m Jul T2
26 '? a '"u'vr7
a-17'2
–/n – Jul T2) (m – Alt!) _ e—rT2 m0 — e a2 N71 e —rT2 moNn
## 26 Cf fr2
2 241m
e–rT2 a tl )]
añ
Mo—e
26
(4.49)
where N(x) = N(ix), and
m = In(Mo/S) = b – a2/2 /12 = b a2/2
1 if call 1 if extreme spread
= =
–1 if put –1 if reverse extreme spread
{ Smax if =
MO =
Smin if = -1
where Smin is the observed minimum, and Smax
maximum.
Reverse Extreme-Spread Option Values
W = [se(b-7 )T2 (1 N (m 112 T2 )
26 7/
e– rT2moNli ( –m T2 )
a N/r2
e–rT2 m
rr
0 -2 e 2 N71
2141",
m Pi T2
26 a N/T2
is the observed
2
_ se(b-r)T2 (1 ± a ) N ( -1i2(72 - ti))
26 7) -
_ e-b(T2-t1)se(b-r)T2 1 a2 N til(T2 - tl)
2b a.,/T2-
(4.50)
Table 4-11 shows values for extreme and reverse extreme call
options for a range of input parameter values.I
stist- 2 2 ...st- 2n 2 st
st- 2 2 st2 2n st- 1
to < ti < • • • < t2n < t
t0 <t1 < < t2n+1 < t
sr =
150 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-11
Extreme and Reverse Extreme Call Option Values
(S= 100, T2 = 1, r =b =0.1)
0.00
Initial time period ti
0.25 0.5 0.75
Smax Extreme-Spread Values
a =0.15 100
110
120
17.5212
9.6924
4.6135
10.6618
8.4878
4.5235
6.7967
5.8519
3.6613
3.3218
2.9676
2.0566
a =0.3 100 30.1874 17.4998 10.9444 5.2735
110 22.0828 16.3674 10.4668 5.0942
120 15.7847 13.5892 9.2051 4.6071
Smin Reverse Extreme-Spread Values
a =0.15 100 0.0000 2.7046 5.7250 9.3347
90 3.6267 6.3314 9.3517 12.9615
80 11.3474 14.0521 17.0724 20.6821
a =0.3 100 0.0000 3.6120 7.8702 13.3404
90 1.4769 5.0890 9.3471 14.8173
80 5.7133 9.3253 13.5835 19.0537
4.16 MIRROR OPTIONS
Mirror options introduced by Manzano (2001) has the same payoff at
maturity as a standard option, but in addition the owner has the right
to mirror the future path of the underlying asset an undetermined
number of times in the option's lifetime. To understand the mirroring,
first assume the case of one mirror path. By mirroring the underlying
asset St at a given time tm , we will get a a mirror path S* that is defined
as St* = St2m /St, where Stm is the asset price at the mirror time and St is
the asset price thereafter. With discrete monitored prices, that would
be St' = S_/St. After a second mirroring, the path would be just as for
St but with a multiplicative factor. For several consecutive mirroring
times ti < t2 < • • • < tm, we will have
In general for an even number of mirrorings, the mirror path equals
the path for St but with a multiplicative factor dependent on the
historical value of the asset price at the mirroring times selected by
the option holder. For an odd number of mirrorings, we also have a4.16. MIRROR OPTIONS 151
path-dependent factor, but now multiplying with the inverse value of
the underlying S' .
The owner of the mirror option is not allowed to mirror the past
history Only future, nonpredictable history is therefore affected by
the mirroring. Moreover, the value of a short position in a mirror
option is not equivalent to the value of selling a mirror option, since
only the owner of the option has the right to make the mirror decision.
The value of a mirror call is given by
c = [F N (d - X N (d2)], (4.51)
where
d
ln(S 1 X) ± T a 2 12
-
d2 = d1 - cr
F Se(a2/2±Ib-a2/21)T ,
where ± is equal to plus for a long option and minus for a short option.
For a put we have
p = e-rT [X N (-d2) - FN( -d1)] (4.52)
Table 4-12 shows values for mirror options for different choices of
strike price X and volatility a.
TABLE 4-12
Value of Mirror Options
(s = 100, T = 1, r =0.1, b = 0)
X a = 2 a = 3 0 = 4 0 =0.2 a = 0.3
Long Call Options Long Put Options
90 15.1251 21.7207 30.3377 3.2476 6.3455 9.5653
95 12.0145 18.7393 27.3809 4.9943 8.4092 11.8360
100 9.3471 16.0579 24.6489 7.2075 10.7889 14.3434
105 7.1263 13.6733 22.1377 9.8678 13.4655 17.0719
110 5.3293 11.5746 19.8406 12.9319 16.4147 20.0043
Short Call Options Short Put Options
90 -12.2959 -15.3939 -18.6137 -2.3841 -4.1511 -5.5894
95 -9.5185 -12.9334 -16.3602 -3.7976 -5.6939 -7.1568
100 -7.2075 -10.7889 -14.3434 -5.6544 -7.5366 -8.9490
105 -5.3436 -8.9413 -12.5477 -7.9578 -9.6762 -10.9620
110 -3.8836 -7.3663 -10.9559 -10.6849 -12.1017 -13.1891
aN/7152 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
4.17 BARRIER OPTIONS
Barrier options on stocks are known to have been traded in the OTC
market since 1967. Barrier options have become extremely popu-
lar and are certainly the most popular class of exotic options. The
Chicago Board Option Exchange and the American Option Exchange
now list up-and-out call options and down-and-out put options on
stock indexes. Several barrier options are traded actively in the OTC
market: currency, interest rate, and commodity options.
## 4.17.1 Standard Barrier Options
Merton (1973) and Reiner and Rubinstein (1991a) have developed
formulas for pricing standard barrier options. 6 The different formulas
use a common set of factors:
A = 0Se(b—r)T N(Oxi) — 0Xe —rT N(Oxi —
B = 0Se(b—r)T N (02) — 0Xe —rT N(0x2 —
C = 0Se(b—r)T (H 1 S)2(4+1)N(7)Y1) — 0Xe rT (H I 5)211 N (7)Y1 710- Vi")
D — 0Se (b—r)T (H 1 S)2(P"+"N (7)Y2) — ae —rT (H 1 S)24 V ( 7)Y2 —
E = Ke—rT [N(qx2 — 710 - — (H 1 S) 211 N (7)Y2 71a VT)]
F = KRH 1 S)/1±)` NON) (H 1 S)/ 1—)` N (I)z — 271),crJ7")]
where
ln(S/ X)
— ( , ± 1 + pt)cr
aN/T
ln(H2 1(S X))
± (1 ± pt)a
a if
ln(S/H)
X2 — ±(1 ± pt)a
cr-VT
ln(H/S)
Y2— ± (1 ± pt)aff
aif
z = A.ff Pt =
ln(H/S) b — o-2/2 2r
a a2 aif a2
"In" Barriers
In options are paid for today but first come into existence if the asset
price S hits the barrier H before expiration. It is possible to include
a prespecified cash rebate K, which is paid out at option expiration if
the option has not been knocked in during its lifetime.
6See also Rich (1994).4.17. BARRIER OPTIONS 153
Down-and-in call S > H
Payoff: max(S — X; 0) if S < H before T else K at expiration.
Cdi(X>H) = C E 77=1,45=1
cdi(x<H) = A B - D E n= 1 , 0= 1
Up-and-in call S < H
Payoff: max (S — X; 0) if S > H before T else K at expiration.
Cui(X>H) = A+ E
Cui(X <H) = B—C±D±E = —1, 0= 1
Down-and-in put S > H
Payoff: max(X — S; 0) if S < H before T else K at expiration.
Pdi(X>H) = C D E n=1, 5=-1
Pdi(X<H) = A E
Up-and-in put S < H
Payoff: max(X — S; 0) if S > H before T else K at expiration.
Pui (X>H) =A—B±D±E 77=-1, 0=-1
Pui(X <H) = C E 77= —1, 5=-1
"Out" Barriers
Out options are similar to standard options except that the option
becomes worthless if the asset price S hits the barrier before expira-
tion. It is possible to include a prespecified cash rebate K, which is
paid out if the option is knocked out before expiration.
Down-and-out call S > H
Payoff: max(S — X; 0) if S > H before T else K at hit.
Cdo(X>H) 71=1, 0=1
cdo(x<H) =B—D+F n=1, 0= 1
Up-and-out call S < H
Payoff: max(S — X; 0) if S < H before T else K at hit.
Cuo(X>H) F
cuo(x<m= A—B-1-C—D±F 77= —1, 0= 1
Down-and-out put 5 > H
Payoff: max(X — S; 0) if S > H before T else K at hit.
Pdo(X>H) A—B-1-C—D±F = 0=-1
Pdo(X<H) F
Up-and-out put S < H
Payoff: max(X — S; 0) if S < H before T else K at hit.
Puo(x›H) =--B—D+F = —1, = —1
Puo(X <H) A — C F 17= -1 , 0=-1154 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-13
Value of Standard Barrier Options
(s = 100, K = 3, T = 0.5, r = 0.08, b = 0.04)
Type X H a =0.25 a =0.3 Type X H a =0.25 a =0.3
cdo 90 95 9.0246 8.8334 Pdo 90 95 2.2798 2.4170
cdo 100 95 6.7924 7.0285 Pdo 100 95 2.2947 2.4258
cdo 110 95 4.8759 5.4137 Pdo 110 95 2.6252 2.6246
cdo 90 100 3.0000 3.0000 Pdo 90 100 3.0000 3.0000
cdo 100 100 3.0000 3.0000 Pdo 100 100 3.0000 3.0000
cdo 110 100 3.0000 3.0000 pdo 110 100 3.0000 3.0000
(Ito 90 105 2.6789 2.6341 Puo 90 105 3.7760 4.2293
Co 100 105 2.3580 2.4389 puo 100 105 5.4932 5.8032
cuo 110 105 2.3453 2.4315 Puo 110 105 7.5187 7.5649
cdi 90 95 7.7627 9.0093 Pdi 90 95 2.9586 3.8769
cdi 100 95 4.0109 5.1370 Pdi 100 95 6.5677 7.7989
cdi 110 95 2.0576 2.8517 Pdi 110 95 11.9752 13.3078
cdi 90 100 13.8333 14.8816 Pdi 90 100 2.2845 3.3328
cdi 100 100 7.8494 9.2045 Pdi 100 100 5.9085 7.2636
cdi 110 100 3.9795 5.3043 Pdi 110 100 11.6465 12.9713
cui 90 105 14.1112 15.2098 Pui 90 105 1.4653 2.0658
Cu' 100 105 8.4482 9.7278 Pui 100 105 3.3721 4.4226
Clii 110 105 4.5910 5.8350 Pui 110 105 7.0846 8.3686
Table 4-13 shows values for standard barrier options. Values are
tabulated with different values for the strike price X, barrier H, and
volatility a.
## 4.17.2 Standard American Barrier Options
Haug (2001a) utilizes the reflection principle to give closed-form solu-
tions for an American call down-and-in option when the barrier H is
below the strike price X. When H < X, the value is given by
2b
Cdi(S. X, H, T, r, b, a) = ( ) (4.53)
where C(.) is the value of a plain vanilla American call option. For
instance, the Bjerksund-Stensland approximation can be used to
value the American call, or any other valuation method for Ameri-
can options (tree models, finite difference). In the case of an American
put, Haug (2001c) gives the solution, when H > X, as
2b
Pu,(S, X. H. T, r, b, a)
7S
\'H2 P , X, T, r, b, a (4.54)4.17. BARRIER OPTIONS 155
Dai and Kwok (2004) generalize this result for a call when H <
max (X, r_rb X):
s 4 H2
Cdi(S,X,H,T, r, b, = ( 1- [c K . a C X, T, r, b, a)
S
H2
- c135M
s
, X,T, r, b, cy)1
cdi(S, X, H, T, r, b, a) (4.55)
The American down-and-in call can thus be decomposed into sim-
pler options—in this case, plain vanilla American C(.) and European
calls CBsm•) plus a European standard barrier option cdi (.). For a put
when H > min (X, r r b X), we have
1-17 [ (H2
Pui(S, X,H,T, r, b, = (Ti S ° P , X, T, r, b, a)
H2
PBSM ( — , X,T, r, b, a
pui(S, X, H,T,b, r, (4.56)
Table 4-14 shows values for American down-and-in calls, for
different values of barrier price H, and time to maturity T
In-Out Parity for American Barrier Options
We have already presented the in-out barrier parity for European bar-
rier options. For example, the sum of a European call and a European
knock-in call with identical strikes is equal to a European knock-out
call. As mentioned by Haug (2001a) and discussed in more detail by
Dai and Kwok (2004), the in-out parity will, in general, not hold for
American barrier options.
TABLE 4-14
Value of Knock-in American Call Options
Using Bjerksund-Stensland (2002)
Approximation
(S = 100.5, X = 100, r =0.1, b = 0.02, a =0.3)
T =0.25 T =0.5 T = 0.75 T=1
95 2.1023 4.1636 5.8274 7.2314
99 4.8961 7.3529 9.1900 10.6908
100 5.8488 8.3314 10.1777 11.6823(Ln+1 ) 43
Un s
[N(d3) – N(4)11
x [N (di — cr ) — N (d2 — ff .)]
(
Ln+1 ) 43—2
U nS
I [N (d3 — cr f 17' ) — N (d4 — cr ff.' )] , (4.57)
156 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
## 4.17.3 Double-Barrier Options
A double-barrier option is knocked either in or out if the underlying
price touches the lower boundary L or the upper boundary U prior
to expiration. The formulas below pertain only to double knock-out
options. The price of a double knock-in call is equal to the portfolio of
a long standard call and a short double knock-out call, with identical
strikes and time to expiration. Similarly, a double knock-in put is
equal to a long standard put and a short double knock-out put. Double-
barrier options can be priced using the Ikeda and Kuintomo (1992)
formula.7
Call Up-and-Out-Down-and-Out
Payoff: c(S, U, L, T)= max(S — X; 0) if L <S < U before T else 0.
co
Un L
c = Se(b—r)T E I(-n) (-
s
) [1‘1 — N (d2)]
L
n=—Do
n ) 41-2 (
— Xe —rT E ( U
Ln Yr. $) n=—Do
where
1n(SU2n I (X L 2n)) (b cr2/2)T
=
cr
In(SU2n/(FL2n))± (b o-2 /2)T
d2 =
cr
in(L 2n+2I (X SU 2n )) (b a2/2)T
cr
1n(L2n+2/(FSU2n )) (b cr2 I2)T
d4 —
cr
d3 =
7For the valuation of double-barrier options, see also Bhagavatula and Carr (1995)
and Geman and Yor (1996).Put Up-and-Out-Down-and-Out
Payoff: p(S,U, L, T) = max(X — S; 0) if L < S < U before T else 0.
p — ±Xe —rr irn ) 41-2 ( L ) 142
Ln
n=—co
x [N (y1 — '11;) — N (Y2 — cvlf
Ln+1\
[N(y3 — a VT) — N (y4 — cvli 7)]
Un S
4.17. BARRIER OPTIONS 157
2[b — 82 — n(81 —82)]
+ 1 42 = 2n
a2
(81 —82)
Ai = a2
21b — 82 + n(S1 — 32)]
± 1 F = U e8I T ,
a2
where Si and 32 determine the curvature L and U. The case of
1. 31 = 32 = 0 corresponds to two flat boundaries.
2. 31 < 0 < 32 corresponds to a lower boundary exponentially
growing as time elapses, while the upper boundary will be
exponentially decaying.
3. Si > 0 > 62 corresponds to a convex downward lower boundary
and a convex upward upper boundary
— Se (b—r)T E I(— unr(—s-T[N(Yi) — N (Y2)1
Ln
n=—co
/L1 \ u3
Un S )
[N(y3 )
N (Y4)l1 , (4.58)
where
1n(SU2n 1 (EL2n )) (b a2/2)T
y1—
Nif
1n(SU2n (xL2n)) + (b a2/2)T
Y2 =
a ff
1n(L2n+21(ESU2n)) (b a21 2)T
Y3—
a ff
1n(L2n+21(XSU 2n )) (b a21 2)T
Y4—
E = Le82T
The double-barrier options are expressed as infinite series of
weighted normal distribution functions. However, numerical studies158 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-15
Examples of Call Up-and-Out-Down-and-Out Values
(S = 100, X = 100, r =0.1, b =0.1)
L U 82
T 0.25 T = 0.5
= 0.15 a =0.25 a =0.35 a =0.15 a =0.25 a =0.35
50 150 0 0 4.3515 6.1644 7.0373 6.9853 7.9336 6.5088
60 140 0 0 4.3505 5.8500 5.7726 6.8082 6.3383 4.3841
70 130 0 0 4.3139 4.8293 3.7765 5.9697 4.0004 2.2563
80 120 0 0 3.7516 2.6387 1.4903 3.5805 1.5098 0.5635
90 110 0 0 1.2055 0.3098 0.0477 0.5537 0.0441 0.0011
50 150 -0.1 0.1 4.3514 6.0997 6.6987 6.8974 6.9821 5.2107
60 140 -0.1 0.1 4.3478 5.6351 5.2463 6.4094 5.0199 3.1503
70 130 -0.1 0.1 4.2558 4.3291 3.1540 4.8182 2.6259 1.3424
80 120 -0.1 0.1 3.2953 1.9868 1.0351 1.9245 0.6455 0.1817
90 110 -0.1 0.1 0.5887 0.1016 0.0085 0.0398 0.0002 0.0000
50 150 0.1 -0.1 4.3515 6.2040 7.3151 7.0086 8.6080 7.7218
60 140 0.1 -0.1 4.3512 5.9998 6.2395 6.9572 7.4267 5.6620
70 130 0.1 -0.1 4.3382 5.2358 4.3859 6.6058 5.3761 3.3446
80 120 0.1 -0.1 4.0428 3.2872 2.0048 5.0718 2.6591 1.1871
90 110 0.1 -0.1 1.9229 0.6451 0.1441 1.7079 0.3038 0.0255
show that the convergence of the formulas is rapid. The numerical
study of Ikeda and Kuintomo (1992) suggests that it suffices to cal-
culate the leading two or three terms for most cases. The Ikeda and
Kuntomo formula only holds when the strike price is inside the bar-
rier range. For double barrier options when the strike is outside the
barrier range see section on "Double-Barrier Option Using Barrier
Symmetry."
Table 4-15 gives examples of call-up-and-out-down-and-out option
values for different choices of lower L and upper U barrier, barrier
curvatures 31 and 31, volatility a, and time to maturity T.
Computer algorithm
The DoubleBarrier(.) function can be used to value four types of double
barrier options:
1. TypeFlag set equal to "co" gives the value of an up-and-out-down-
and-out call.
2. TypeFlag set equal to "ci" gives the value of an up-and-in-down-
and-in call.
3. TypeFlag set equal to "po" gives the value of an up-and-out-down-
and-out put.4.17. BARRIER OPTIONS 159
4. TypeFlag set equal to "pi" gives the value of an up-and-in-down-
and-in put.
Function DoubleBarrier(TypeFlag As String, S As Double, X As Double, L As Double, _
U As Double, T As Double, r As Double, b As Double, v As Double, _
deltal As Double, delta2 As Double) As Double
Dim E As Double, F As Double
Dim Suml As Double, Sum2 As Double
Dim d1 As Double, d2 As Double
Dim d3 As Double, d4 As Double
Dim mul As Double, mu2 As Double, mu3 As Double
Dim OutValue As Double, n As Integer
F = U * Exp(deltal * T)
E = L * Exp(delta2 * T)
Suml = 0
Sum2 = 0
If TypeFlag = "co" Or TypeFlag = "ci" Then
For n = —5 To 5
dl = (Log(S * UA(2 * n)/(X * LA(2 * n))) + (b + 102 / 2) * T) / (v * Sqr(T))
d2 = (Log(S *U^(2 * n)/(F * LA(2 * n))) + (b + vA2 / 2) * T) / (v * Sqr(T))
d3 = (Log(LA(2 * n + 2)/(X * S * U^(2 * n))) _
+ (b + vA2 / 2) * T) / (v * Sqr(T))
d4 = (Log(LA(2 * n + 2)/(F * S * U^(2 * n))) _
+ (b + 102 / 2) * T) / (v * Sqr(T))
mul = 2 * (b — delta2 — n * (deltal — delta2)) / vA2 + 1
mu2 = 2 * n * (deltal — delta2) / vA2
mu3 = 2 * (b — delta2 + n * (deltal — delta2)) / 102 + 1
Suml = Suml + (UAn / LAn)Amul * (L / S)Amu2 * (CND(d1) — CND(d2)) _
— (LA(n + 1) / (UAn * S))Ainu3 * (CND(d3) — CND(d4))
Sum2 = Sum2 + (UAn / LAn)^(mul — 2) * (L / S)Amu2 _
* (CND(d1 — v * Sqr(T)) — CND(d2 — v * Sqr(T))) — (L A (n + 1) _
/ (UAn * S))^(mu3 — 2) * (CND(d3 — v * Sqr(T)) — CND(d4 — v * Sqr(T)))
Next
OutValue = S * Exp((b — r) * T) * Suml — X * Exp(—r * T) * Sum2
ElseIf TypeFlag = "po" Or TypeFlag = "pi" Then
For n = —5 To 5
dl = (Log(S *UA(2 * n)/(E * LA(2 * n))) _
+ (b + vA2 / 2) * T) / (v * Sqr(T))
d2 = (Log(S * U^(2 * n)/(X * LA(2 * n))) _
+ (b + 102 / 2) * T) / (v * Sqr(T))
d3 = (Log(LA(2 * n + 2)/(E * S * U^(2 * n))) _
+ (b + vA2 / 2) * T) / (v * Sqr(T))
d4 = (Log(LA(2 * n + 2)/(X * S * U^(2 * n))) _
+ (b + 102 / 2) * T) / (v * Sqr(T))
mul = 2 * (b — delta2 — n * (deltal — delta2)) / vA2 + 1
mu2 = 2 * n * (deltal — delta2) / 102
mu3 = 2 * (b — delta2 + n * (deltal — delta2)) / 102 + 1
Suml = Suml + (UAn / LAn)Amul * (L / S)Amu2 _
* (CND(d1) — CND(d2)) — (LA(n + 1) / (UAn * S))^mu3 _
* (CND( d3 ) — CND( d4 ))
Sum2 = Sum2 + (UAn / LAn)^(mul — 2) * (L / S)Amu2 _
* (CND(d1 — v * Sqr(T)) — CNID(d2 — v * Sqr(T))) — (LA(n + 1) _
/ (UAn * S))^(mu3 — 2) _
* (CND(d3 — v * Sqr(T)) — CND(d4 — v * Sqr(T)))
Next
OutValue = X * Exp(—r * T) * Sum2 — S * Exp((b — r) * T) * Sumlfi =
In(S/X) 21n(H/S) + (b + a2 /2)T2
ei —
f2 = — a 0'2
fri
In(S/H) (b +a2 /2)t1
e2 = el —
160 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
End If
If TypeFlag " co" Or TypeFlag = "po" Then
DoubleBarrier = OutValue
ElseIf TypeFlag = " ci " Then
DoubleBarrier = GBlackScholes ("C , S, X, T, r, b, v) — OutValue
ElseIf TypeFlag = "pi" Then
DoubleBarrier = GBlackScholes( "p" , S, X, T, r, b, v) — OutValue
End If
End Function
The computer code calculates the value of a double-out barrier
option. If the option is a double-in option, the computer code uses
the barrier parity. An up-and-in-down-and-in call can, for instance, be
constructed by going long a standard call option and going short an up-
and-out-down-and-out call. The GBlackScholes(.) function at the end
of the DoubleBarrier(-) function calls the generalized Black-Scholes-
Merton function from Chapter 1.
4.17.4 Partial-Time Single-Asset Barrier Options
In single-asset partial-time barrier options, the period during which
the underlying price is monitored for hitting the barrier is restricted to
only a fraction of the option's lifetime. For partial-time-start barrier
options, which we call type A options, the monitoring period starts
when the option is initiated and ends at an arbitrary date t i before
expiration. The monitoring period of partial-time-end-barrier options
starts at an arbitrary date ti before expiration and ends at expiration
T2. Formulas for pricing this type of options were originally published
by Heynen and Kat (1994b).
Partial-Time-Start-Out Options
)202+1)
71e3;
0-072 m (di , ?lei; 7/P) s
CA = Se T2
7 1 — Xe—rT2 m (d2, qe2; 7/P) — (—s
H )24
M(f2, e4;
where n = —1 for an up-and-out call (CA) and 7/ = 1 for a down-and-
out call (cd0A ), and
In(S/X) (b + a2/2)T2
— , d2 = — 0".ff2
(3"
(4.59)4.17. BARRIER OPTIONS 161
2.1n(H/S)
e3 = ei , e4 = e3 — crNitT
ViT
b — a2/2
P = ./t1 I T2
Partial-Time-Start-In Options
The price of "in" options of type A can be found using "out" options in
combination with plain vanilla call options.
Up-and-In Call
cui A = call — cuoA
Down-and-In Call
= call cdi A cd0A
Partial-Time-End-Out Calls
There are two types of partial-time-end barrier options. Type B1 is
defined such that only a barrier hit or crossing causes the option to
be knocked out. We do not distinguish between the asset price hitting
the barrier from above or below. In this case, there is no difference
between up and down options.
When X > H, the knock-out call value is given by
= se(b-r)T2 m(di, ei ; P) — 57 CoB1
H )201+ 1)
M(fl, —e3; — P)
— Xe —rT2 M(d2, e2; p) — ( [
H ) 24'
M(f2, —e4; —P) ,
and when X < H, the knock-out call value is given by
H)201+1)
Coll) = Se — T2 M( -81, —el; P) — — s M(—g3, e3; —p)
24 - Xe —rT2 —e2; P) — (y)A 4(—g4,e4; —13')
H
r)T2 Af(_di; p)
20,t+1)
—Se(b— M(— fl, e3; — P)
[
H 24
± Xe —rT2 M(—d2, —e2; 0 — (
)
T, M(—f2, e4; —p) 0
H 2(ju+1)
^ Se(b—r)T2 m(gi, el; P) s )
M(g3, —e3; —P)
—Xe —rT2 [M(g2,e2; 1,) — (7424 M(g4, —e4; —P)],
(4.60)
(4.61)162 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
TABLE 4-16
Partial-Time-End Barrier Call Type B1 Option Values
(H = 100, r = b =0.1, a =0.25, T2 = 1)
Barrier Monitoring Time t1
X 0 0.25 0.5 0.75 1
95 90 0.0393 6.2747 10.3345 13.4342 17.1612
95 110 0.0000 3.7352 5.8712 7.1270 7.5763
105 90 9.8751 15.6324 19.2896 22.0753 25.4213
105 110 6.2303 9.6812 11.6055 12.7342 13.1376
where
ln(S I H) (b a2/2)T2
g i = , g2 = gi — a Nrf,2
a ,fr2
21n(H/S)
g3 = gi + ,= g3 – a-11'2
aNifi
Table 4-16 shows values for partial-time-end-barrier call options
for a range of input parameters.
Type B2 partial-end barrier options are defined such that a down-
and-out call is knocked out as soon as the underlying price is below
the barrier. Similarly, an up-and-out call is knocked out as soon as the
underlying price is above the barrier.
Down-and-Out Call X < H
H \202+1)
cd0B2 — Se(b—r )T2 m(gi, el; P) s ) M(g3, —e3; — p)
_ xe—rT2[M(g2, e2; (T)
2/2
M (g4, — e4; mod
Up-and-Out Call X < H
(b—r)T2 m(_ gi, _el; p) _ 7 -- M(—g3, e3; —p)
H 202+1)
euoB2 = Se
H 2p,
— Xe —r T2 [Al( -g2, —e2; 1,) — (—) M( — g4, e4; _P)]
S
202+1)
—) –P)1 – Se — T2 m(_di , —el; 13) M(e3, – f ; s
2/2
Xe rT2 [M(– d2, – e2; p) – (7) M(ea, f2; P)]
(4.62)
(4.63)7/ =
—1 if down-and-out put
{ 1 if up-and-out call
4.17. BARRIER OPTIONS 163
## 4.17.5 Look-Barrier Options
Look-barrier options can be regarded as a combination of a partial-
time barrier option and a forward starting fixed-strike lookback option
(Bermin, 1996a). The option's barrier monitoring period starts at the
option's starting date and ends at an arbitrary date t i before expi-
ration. If the barrier is not hit during the monitoring period, the
fixed-strike lookback option will be initiated at the same time the
barrier ceases to exist. Because a knock-out barrier is introduced in
the first part of the option's lifetime, the option will be cheaper than
a standard partial-time fixed-strike lookback option.
w =iiise(b—r)T2 ( 1+62 )[m (n1 11,2t1 —k +11,2 7'2.
2b a .07 a fr2 ; P
—e
242'11,2 m (m —2h — ii2t1 2h — k 112 T2 )1
; P
a .07 a fr2
e—rT2 x [m... (In Alt] -k /L1T2.
a P
—
e22Mj7 (m —2h — 2h — k A1T2 )1
P
a 60— '2
_ e—rT2 (62 )[, (s )— ? 2' m —k P1T2
Mn ; p
2b " '( 0".0 - 1
2b
_H It ( —2h- I - giti 2h — k giT2
X ) a .0 - 1 aN/T2
se(b— r)T2 [(1 + 62) iv (A2(T2
a2) +e (T2—ti) 1_ -
2b —71 A/T2 — 2b
xN
a(
-41(7'2-1'1)
e
—rT2
Xg2} ,/T2— t1)1 g1
(4.64)
where N,7 (x) = N(qx), and Mq(a, b; p) = M(qa, qb; p),
p)]
imin(h, k) when ii = 1
max(h, k) when 77 = —1
h = ln(H IS), k = ln(X IS)
m =
hi = b — 62/2, 112 = b (72/2, p=\IT2164 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-17
Look-Barrier Up-and-Out Call Values
(s = x = 100, T2 = 1, r = b = 0.1)
Barrier Monitoring Time tl
0 0.25 0.5 0.75 1
110 17.5212 9.6529 4.2419 1.7112 0.2388
= 0.15 120 17.5212 16.0504 11.0593 6.4404 2.1866
130 17.5212 17.0597 14.9975 11.1547 5.5255
110 30.1874 7.4146 2.7025 0.8896 0.0357
a =0.3 120 30.1874 16.4987 7.5509 3.1682 0.4259
130 30.1874 23.1605 13.1118 6.6034 1.5180
(h - /1211)
e
21,2h10-2 ( -h kt2t1
gi = {[N "71
a a
)]
_ iN e22h,,,,
a
(m_ 2h - i-t2t )1
'"'71 L ,/r1
g2 = I[Nq (h - e2ttihkr2 N ( -h -
Cl y
- [N
2„, h /0.2 (m - 2h - ti )1
e vh ( a ,./ri a ,./ri
Table 4-17 shows examples of look-barrier up-and-out call option
values. It reports values for different choices of barrier H, barrier
monitoring time ti, and volatility a.
## 4.17.6 Discrete-Barrier Options
All the barrier option pricing formulas presented so far assume con-
tinuous monitoring of the barrier. In practice, the barrier is normally
monitored only at discrete points in time. An exception is the currency
options market, where the barrier is frequently monitored almost con-
tinuously. For equity, commodity, and interest rate options, the barrier
is typically monitored against an official daily closing price. Discrete
monitoring will naturally lower the probability of barrier hits com-
pared with continuous barrier monitoring. Broadie, Glasserman, and
Kou (1995) have developed an approximation for a continuity correc-
tion for discrete barrier options. The correction shifts the barrier (or
the barriers) away from the underlying asset. The probability of bar-
rier hits is thus reduced in the model. To price any discrete barrier
option, it is sufficient to replace the continuously monitored barrier4.17. BARRIER OPTIONS 165
H in continuous barrier options formulas with a discrete barrier level
HD equal to
HD = Hefkl "
if the barrier is above the underlying security, and to
HD = He-t3a
if the barrier is below the underlying security. At is the time
between monitoring events, and /3 = 0.5826, where is
the Riemann zeta function. Broadie, Glasserman, and Kou (1995)
show both theoretically and through examples that discrete barrier
options can be priced with remarkable accuracy using this simple
correction. Other methods for pricing discrete barrier options have
been published by Kat and Verdonk (1995), Reimer and Sandemann
(1995), and Heynen and Kat (1996b).
4.17.7 Soft- Barrier Options
A soft-barrier option is similar to a standard barrier option, except
that the barrier is no longer a single level. Rather, it's a soft range
between an upper level U and a lower level L. Soft-barrier options are
knocked in or out proportionally. For instance, consider a soft down-
and-out call with a current asset price 100, with a soft-barrier range
from U = 90 to L = 80. If the lowest asset price during the lifetime is
86, then 40% of the call will be knocked out. The valuation formula
originally introduced by Hart and Ross (1994) can be used to price
soft-down-and-in-call and soft-up-and-in-put options:
1
w =
U _ L nSe(b-r)T s_24,(SX)+0.5
u2 11+0•5
2(4 ± 0.5) I 57(
( , 2 ) li+0.5
N(d1 ) - A 1 N(71d2) - 1" -
SX
N(nel ) ± Ai Al(ne2)
-
11Xe-rT s-201-1)(SX)11-0.5 [(u2)11-0.5
2(4
- 0.5)
(
N(nd3)
(4.65) -A2N( 11d4) —
SX
N(11e3)+ A2N( 11e4)
L2 ) 4-° '5166 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
where n is set to 1 for a call and -1 for a put, and
ln(U2/(SX))
+
tia
/ d2 = - ± 0.5)a =
ln(U2/(SX)) (tt
d4 = d3 - (tt - 0.5)a d3 =
ln(L2/(SX)) ttaNr
el = 1' e2 = e - ± 0.5)a
a
ln(L2 / (S X)) ±
1)a ,./T' e4 = e3 - (tt - 0.5)a
A = e-0.51-0-2 T0/ +0.5)02-0.5)1 A2 = e-0.5fa2T02-0.5)02-1.5)]
b a2/2
1-1 - 2 a
The value of a soft down-and-out call is equal to the value of a
standard call minus the value of a soft down-and-in call. Similarly,
the value of a soft up-and-out put is equal to the value of a standard
put minus a soft up-and-in put.
Application
Standard barrier options are hard to delta hedge when the asset
price is close to the barrier. The barrier option will then have a high
gamma risk. Soft-barrier options will typically have a significantly
lower gamma risk and will for that reason also be easier to hedge.
TABLE 4-18
Soft-Barrier Down-and-Out Call Values
(S = 100,X= 100, u = 95, r = 0.1, b =0.05)
T = 0.5 T = 1
L o0.1 a =0.2 a =0.3 a =0.1 a =0.2 a =0.3
95 3.8075 4.5263 4.7297 5.4187 5.3614 5.2300
90 4.0175 5.5615 6.2595 6.0758 6.9776 7.2046
85 4.0529 6.0394 7.2496 6.2641 7.9662 8.7092
80 4.0648 6.2594 7.8567 6.3336 8.5432 9.8118
75 4.0708 6.3740 8.2253 6.3685 8.8822 10.5964
70 4.0744 6.4429 8.4578 6.3894 9.0931 11.1476
65 4.0768 6.4889 8.6142 6.4034 9.2343 11.5384
60 4.0785 6.5217 8.7260 6.4133 9.3353 11.8228
55 4.0798 6.5463 8.8099 6.4208 9.4110 12.0369
50 4.0808 6.5654 8.8751 6.4266 9.4698 12.20364.17. BARRIER OPTIONS 167
Table 4-18 shows values for soft-barrier down-and-out call options.
Different choices for time to maturity T, lower barrier level L, and
volatility a are reported.
4.17.8 Use of Put-Call Symmetry for Barrier Options
The European put-call value symmetry first published by Bates (1991)
and later applied for static replication of barrier options by Carr
(1994), Carr and Bowie (1994), and Carr, Ellis, and Gupta (1998)
states that a call with strike X when the spot is atbH must have
the same value as — number of puts with strike (flexT) .8 HX ebT
sebT )2
c(S, X, T, r, b, a) =
SebT x -p S, x
, T, r, b, a)
The put-call symmetry is useful to construct a static hedge consist-
ing of standard options when one is hedging exotic options, such as
barrier options. Barrier options often have complex and high gamma
risk when the asset is close to the barrier. In that case, a static hedge
consisting of plain vanilla options will cover the risk far better than
dynamic delta hedging.
The put-call symmetry is based on assumptions that the volatility
smile (implied volatilities for different strikes) is symmetricT in the
natural logarithm of s ÷, T . As a result, a put with strike (Hex ) will
have the same volatility as a call with strike X. Put options will have
higher volatility than calls equidistant from the forward price.
Example
Consider a down-and-in call option on a futures contract with barrier
H = 120 and strike X = 140. A static hedge can be constructed by using
the put-call symmetry:
• Buy laietT = 1.1667 standard put options.
iezto x
• Choose a strike of ( 1 20o T )2
= 102.8571.
If the asset price closes above the barrier, both the down-and-out call
and the standard put option will expire worthless. If the asset price
hits the barrier before expiration, the puts will have the same value
as one standard call option with strike 140. Because the put options
are sold at a barrier hit and at the same time the call option is bought,
the put-call symmetry will ensure a zero net cost.
8For more on static option replication, see Derman, Ergener, and Kani (1995).168 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
4.18 BARRIER OPTION SYMMETRIES
Haug (1998) and Gao, Huang, and Subrahmanyam (2000) have
described symmetries between put and call barrier options. As
described by Haug (1998) and Haug (2001b), these symmetries can
be useful to value many exotic barrier options—discussed in more
detail below.
For standard barrier options, the symmetry between standard
in-call and in-put options is
SX
Cdi(S, X, H, r, b, a) = Pui (X, S, r – b, –b, a)
H
( S
XH
2 S2
= Pui S, —
'
—,r – b. –b, a
St
SX
CLi(S, X, H, r, b, a) = Pdi (X, S, r – b, –b, a)
( S2 S2
= Pdi S, — , r – b, –b, a ,
S X H
where Cdi is a down-and-in call, and Cui is an up-and-in call (simi-
larly for puts). The put-call symmetry between out barrier options is
given by
SX
Cdo (S, X, H, r, b, a) = Puo (X , S, r – b, –b, a)
x 52 S2
= P
X
uo (S, —
H
r – b, –b, a)
S
SX
Cuo (S, X, H, r, b, a) = Pdo (X, S, r – b, –b, a)
X ( S
2 s2
= Pdo S, —
X
,
H
r – b, –b,
and for double barrier options, we have
po (x,
'
sx sx r _1,,a)
U L
x i , s2 s2 s2 po s
S V' 7' r
bb
' a
SX SX
Ci (S, X, L, U, r, b, =- Pi (X, S, — r – b, –b, a)
U L
x (s 52 s2 s2
r b'
b
' a)
(4.66)
(4.67)
Co (S, X, L, U, r, b, =
(4.68)
(4.69)
(4.70)
(4.71)4.18. BARRIER OPTION SYMMETRIES 169
where L is the lower barrier and U is the upper barrier. These transfor-
mations also hold for partial-time single- and double-barrier options
described by Heynen and Kat (1994b) and Hui (1997).
4.18.1 First- Then- Barrier Options
Haug (1998) used put-call barrier symmetry to design first-then-
barrier options on futures/forwards (cost-of-carry zero). An example is
a first-down-then-up-and-in call cdui (S, X, L, U), for which the owner
receives a standard up-and-in call with barrier U(U > S) and strike X
if the asset first hits a lower barrier L(L < S < U). The asset price can
naturally hit the lower barrier several times before it hits the upper
barrier. To be knocked in, the asset price has to hit the lower barrier
at least once before an upper barrier hit has any effect. Using the up-
and-in call/down-and-in put barrier symmetry described above, we
can simply construct a static hedge, and thereby a valuation formula:
x L2 L2
Qui (s, X, L, U, T, r, a) = Pdt —' —,T, r, a (4.72)
L X U
Hence, to hedge a first-down-then-up-and-in barrier call option,
we simply need to buy f number of standard down-and-in puts with
strike /,4 and barrier It; .9 Both the first-down-then-up-and-in call and
the standard down-and-in put will expire worthless if the asset price
never touches L. On the other hand, if the asset price hits the lower
barrier L, the value of the down-and-in puts will exactly match
the value of the up-and-in call. In this case, we just need to sell the
down-and-in put while buying the up-and-in call. Evidently, we have
created a "perfect" static hedge for this new barrier option using only
standard barrier options and the barrier transformation principle.
One can easily construct static hedges and valuation formulas for
a large class of first-then-barrier options in a similar fashion.
First-up-then-down-and-in call:
cud, (s, X, L,U,T, r, = Put
X ( U 2 U2
S — X '
First-down-then-up-and-in put:
X ( L 2 L 2
Pudi(S, X, L,U,T, r, a) = —
L
cdi !\S
' ' T' r'
91t is not necessary to be able to actually carry out such a static hedge. As long as
the underlying asset price follows a geometric Brownian motion, we can still derive
a valuation formula. From the formula we can easily derive the delta to dynamically
replicate the option.
(4.73)
(4.74)170 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
First-up-then-down-and-in put:
X ( U2 U2
Pudi(S, X, L,U,T, r, cr) = —c ui S, 1 7, T, r, ci (4.75)
For out options we can use the well-known in-out parity: out-
barrier-option = long plain vanilla option + short in-barrier option.
This yields
First-down-then-up-and-out call:
cd1a(S,X,L,U,T, r, cr) = c(S, X, T, r, cr) — cdui(S, X, L,U,T, r, cr) (4.76)
First-up-then-down-and-out call:
cuda(S,X,L,U,T,r. = c(S, X, T, r, a) — cudi(S, X, L,U,T,r,cr) (4.77)
Table 4-19 compares plain vanilla options with a standard-up-and-
out call and a first-down-then-up-and-out call, for different choices for
volatility a, and barrier levels L and U.
The value of the first-up-then-up-and-out call is evidently higher
or equal to the standard barrier option. This is natural since the asset
price has to hit the lower barrier before it hits the upper barrier for
the option to be knocked out. The further the barriers are away from
the current asset price, the less likely are barrier hits, and the option
value converges to a plain vanilla call option. Low volatility has a sim-
ilar effect on barrier hit probability. However, a first-then-out barrier
option will always be less (or equal) in value to a similar plain vanilla
option.
TABLE 4-19
Comparison of Plain Vanilla Call, Standard Down-and-Out
Call, and First-Down-Then-Up-and-Out Call Option Values
for Different Barrier Levels and Volatility
(s = 100, x = 100,T = 0.5, r = 0.1)
Plain Vanilla I Standard Barrier2 First-Then-Barrier
U a = 10% a = 30% a = 10% a =30% a = 10% a =30%
50 150 2.6828 8.0350 2.6828 8.0350 2.6828 8.0350
80 120 2.6828 8.0350 2.6828 7.9065 2.6828 7.9821
90 110 2.6828 8.0350 2.6801 6.3385 2.6827 6.4607
95 105 2.6828 8.0350 2.4626 3.9523 2.5284 3.9702
1. Using the Black (1976) formula.
2. Using the Reiner and Rubinstein (1991a) formula.4.18. BARRIER OPTION SYMMETRIES 171
## 4.18.2 Double-Barrier Option Using
Barrier Symmetry
Haug (1998) shows how to value a double-barrier option using only
single-barrier option formulas in combination with put-call barrier
symmetry (described in the end of the barrier option section). For
options on an underlying asset with cost-of-carry zero (option on
futures), we can accurately approximate the value of a double knock-in
call barrier option with
ci (S, X, L, U, T, r, a) (4.78)
[
min c(S, X, T); c ui(S, X, U, T, r, a) ± cdi(S, X, L, T, r, a)
( U2 U2
Pui S, , T, r, a) — — p
X di s, L 2
L2 T r a
U XL L X
^ —cdi
u
L
(
S,
L2x L3
L c • S,
u2x u3
u2 ' u2 u u' L2 ' L2 ' ' r'
LX U4 U4 UX ( L4 L 4
— ( 7 2 pui S, — ox , L 7 3 , T, r, a L2 pdi S, —,T, r, a
U2 X U 3
L2 ( u4x u5 U2 ( L 4 X L 5
L4 , L4 , T , r, a ,
± • cdi Y 5' — U4 U4 T r' a ± cui
where c(S, X, T) is a standard call option and cui is a standard down-
and-in barrier option etc. For a double knock-in put barrier option, we
have
pz (S, X, L,U,T, r, a) (4.79)
[
min p(S, X, T , r, a); Pui(St, X, U, T , r, a) + Pdi(S, X, L, T, r, a)
X di s, L2L2
, T , r, o- —
U c
(
S,
X
u2 u2
, T, r,o- — —c
u ' L XU
U L2 X L 3 L U2 X U 3
^ — pdi S, „ T , r, a ±17 pui s, , , T , r, a
U2 U2
LX U4 U4 U X ( L 4 L 4
— '
—c ui S, — — , T , r, a
U2 L2 X L3
L2
s' U2 X U 3 r'
u2 (L4 x L5 L2 U4 X U 5
^ —2 - L, pdi S, —u - 4—, , T , r, a ±172 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-20
Examples of Up-and-Out-Down-and-Out Call Values
(s = 100, x = 100,r = 0.1,b =0)
T= 0.25 T = 1
a =0.15 a =0.25 a 0.35 a =0.15 a =0.25 a =0.35
Haug Method Values
50 150 2.9175 4.8136 5.9864 5.1564 5.1455 3.4284
60 140 2.9173 4.6265 5.0077 4.6500 3.5477 2.0222
70 130 2.9055 3.9425 3.3685 3.5014 1.8739 0.8131
80 120 2.6495 2.2807 1.3757 1.6735 0.4754 0.0778
90 110 1.0053 0.2882 0.0457 0.1150 0.0008 0.0000
Ikeda Kunitomo Method Values
50 150 2.9175 4.8136 5.9864 5.1564 5.1455 3.4284
60 140 2.9173 4.6265 5.0077 4.6500 3.5477 2.0222
70 130 2.9055 3.9425 3.3685 3.5014 1.8739 0.8131
80 120 2.6495 2.2807 1.3757 1.6735 0.4754 0.0778
90 110 1.0053 0.2882 0.0457 0.1150 0.0009 0.0000
Table 4-20 compares double-barrier option values calculated with
the Haug formula with the Ikeda and Kunitomo formula. They are
evidently close to identical for these parameters.
4.18.3 Dual Double- Barrier Options
The owner of a standard double knock-in call option receives a call
if either the upper or the lower barrier is hit. It may be desirable,
however, to get a put if the asset price hits the lower barrier and
a call if the asset price hits the upper barrier-a knock-in double-
barrier put-down-call-up. Using the technique described above, we
can easily value the latter option. We limit ourselves also here to dual
double-barrier options on futures or forwards. Haug (2005b) gives the
following approximation:
ci,p(S, X, L, U, T, r, a) min [max[c(S, X, T, r, a);
P(S, X, T, r, cui(S, X, U, T, r, a) + Pdi(S,X, L, T, r, a)
2 Pui (
u2 u2
S, T r a) - -
x
c d ,
L2 L2
T a)
U X ' L X ' U
L
L2x L 3 L u2x
(S, -y- u2
- ' U
T, r, a) + - Pui (S, - -
'
T, r, a)
' u2 L2 L2
(4.80)4.18. BARRIER OPTION SYMMETRIES 173
LX I U 4 U4 U X ( L4 L4
)
U2 Pui
S,
2, L 3 r' a - L2 cdi U2X' U3'
T r
'
a
U2 L4X L5 L2 ( u 4 x
cdi S, , , T, r, a ± p„i S,
U4 U4 L4 ' L4 '
T
,r' a
Similarly, the formula for a knock-in double barrier call-down-put-
up is
cicd(S, X, L,U,T,r, a) %%', min [max[c(S, X, T, r, a);
P(S, X, T, r, Pui(S, X, U,T,r, a) ± cdi(S, X, L,T,r, a)
(
„
U2 U2 X
- c IS, - T, r, a - -
pd L2
L2 3 T r a
U u XL L X U
Pdi
( Lx L
L
u2 x u3
S,
2 3
,T, r, a ± c • S,
L u2 ' u2 u 1" L2 ' L2 ' T' r'
Lx u4 u4 ux ( L4 L 4
_ r s
U2 L2X' L3 '
T, r, a L2 Pdi S,
U2 X' U3
T, r, a
u2 ( L4 x L5 L2 U4 X U 5
^ Pdi S, u4 u4 , r, a) ± cui (S, , -T IL,T, r, a)1
A call-down-put-up knock-in option naturally has considerably
lower value than a call-up-put-down knock-in option. The latter can
be seen as a "poor man's" double-barrier option. These barrier options
have traded in the OTC FX market.
Table 4-21 shows values for dual double-barrier options, with
different choices for barriers L and U, and volatilities Gr.
TABLE 4-21
Dual Double-Barrier Options
(S= 100, X = 100, T =0.25, r =0.08, b =0)
call-up-put-down put-up-call-down
L U cr =0.1 a= 0.2 cr = 0.3 a = 0.1 cr = 0.2 a = 0.3
70 130 0.0000 0.2368 2.6778 0.0000 0.0000 0.0009
75 125 0.0002 0.6753 4.5569 0.0000 0.0000 0.0063
80 120 0.0049 1.7827 5.8601 0.0000 0.0003 0.0400
85 115 0.0895 3.8906 5.8601 0.0000 0.0089 0.1791
90 110 0.8917 3.9088 5.8601 0.0001 0.1161 0.3405
95 105 1.9550 3.9088 5.8601 0.0570 0.2814 1.0719
(4.81)
a)174 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
4.19 BINARY OPTIONS
Binary options, aka digital options, are popular in the OTC markets
for hedging and speculation. They are also important to financial engi-
neers as building blocks for constructing more complex derivatives
products.
## 4.19.1 Gap Options
The payoff from a call is 0 if S < XI and S — X2 if S> X1. Similarly,
the payoff from a put is 0 if S > Xi and X2 — S if S < Xi. The Reiner
and Rubinstein (1991b) formula can be used to price these options:
c = Se(b-r)T N (di) - X2e -rT N(d2) (4.82)
p = X2e-rT N(-d2)- Se(b-r)T N (_di ) (4.83)
ln(S/X ) + (b a2 / 2)T
d1= = - o-N/7
Notice that the payoff from this option can be negative, depending on
the settings of Xi and X2. When the difference between X1 and X2 is
such that the value of the option is zero, the option is often referred
to as a pay-later option.
Example
Consider a gap call option with six months to expiration. The stock
price is 50, the first strike is 50, the payoff strike is 57, the risk-free
interest rate is 9% per year, and the volatility is 20% per year. S = 50,
X1 = 50, X2 = 57, T = 0.5, r = b =0.09, and a = 0.2.
ln(50/50) + (0.09 + 0.22/2)0.5
= = 0.3889 d2 = d1 -C / = 0.2475
N(d1 ) = 0.6513. N (d2) = 0.5977
50e (0.09- 0.09)0.5
I)/ — D le
- 0.09 x 0.5 N (d2) _ 0.0053
## 4.19.2 Cash-or-Nothing Options
The cash-or-nothing options pay an amount K at expiration if the
option is in-the-money. The payoff from a call is 0 if S < X and K if
S > X. The payoff from a put is 0 if S > X and K if S < X. Valuation of
cash-or-nothing options can be made using the formula described by
Reiner and Rubinstein (1991b):
c = K e-rT N (d) (4.84)
p = Ke-rT N(-d) (4.85)
where4.19. BINARY OPTIONS 175
This is nothing but the last part of the Black-Scholes formula, where
d = ln(S / X) + -
a
Example
What is the value of a cash-or-nothing put option with nine months
to expiration? The futures price is 100, the strike price is 80, the
cash payout is 10, the risk-free interest rate is 6% per year, and the
volatility is 35% per year. S = 100, X = 80, K = 10, T = 0.75, r =0.06,
b = 0, and a =0.35.
ln(100/80) + (0 - 0.352/2)0.75
d - = 0.5846
N(-d) = N(-0.5846) = 0.2794
-0.06x0.75 N ,- p = 10e d) = 2.6710
## 4.19.3 Asset-or-Nothing Options
At expiration, the asset-or-nothing call option pays 0 if S < X and S
if 5> X. Similarly, a put option pays 0 if S > X and S if S < X. The
option can be valued using the Cox and Rubinstein (1985) formula: 10
c = Se(b-r)T N(d) (4.86)
p = se(b-r)T N(_d), (4.87)
where
d = ln(S I X) + (b + a2 /2)T
a
Example
Consider an asset-or-nothing put option with six months to expiration.
The stock price is 70, the strike price is 65, the dividend yield is 5%
per year, the risk-free interest rate is 7% per year, and the volatility is
27% per year. S = 70, X = 65, T = 0.5, r =0.07, b = 0.07 — 0.05 = 0.02,
and a =0.27.
ln(70/65) + (0.02 + 0.272/2)0.5
d - = 0.5360
N(-d) = N(-0.5360) = 0.2960
p = 70e,(0.02-0.07)0.5 N (-d) = 20.2069
10See also Reiner and Rubinstein (199113).176 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
## 4.19.4 Supershare Options
A supershare option, originally introduced by Hakansson (1976),
entitles its holder to a payoff of S/ X L ifXL < S < X H and 0 otherwise.
w = (se(b-r)T/XL)[N(di) - N(d2)l, (4.88)
where
ln(S 1 X L) + (b + 212)T ln(S 1 X H) + (b + 212)T
=d2 =
Application
A portfolio of supershare options can be used to construct what is
known as a superfund—traded at the American Stock Exchange under
the name SuperUnits and at the Chicago Board Options Exchange as
SuperShares. 11
Example
Consider a supershare option with three months to expiration. The
futures price is 100, the lower boundary XL is 90, the upper boundary
XH is 110, the risk-free interest rate is 10% per year, and the volatility
is 20% per year. S = 100, XL = 90, X H = 110, T = 0.25, r =0.1, b = 0,
and a =0.2.
in(100/90) + (0 + 0.22/2)0.25
d1 - = 1.1036
0.2-V0.25
in(100/110) + (0 + 0.22/2)0.25
d2 - = 0.9031
0.2-V0.25
N(di) = N(1.1036) = 0.8651 N(d2) = N(-0.9031) = 0.1832
w = (100e(0-0.00.25 190)N ( _ a ) N(d2)1= 0.7389
## 4.19.5 Binary Barrier Options
Reiner and Rubinstein (1991b) present a set of formulas that can be
used to price 28 different types of so-called binary barrier options. The
binary barrier options presented here can be divided into two main
categories:
1. Cash-or-nothing barrier options. These pay out either a prespec-
ified cash amount or nothing, depending on whether the asset
price has hit the barrier or not.
liFor more on supershares, see the articles by Cox and Rubinstein (1985), Hakansson
(1991), and Rubinstein (1995b).ln(S 1 X)
xi = + (A +
c
ln(H21(SX))
Y1 =
ln(S1 H)
X2 = + 1)(7,5
a N/T
ln(H IS)
Y2= + +1)a..5 + +
4.19. BINARY OPTIONS 177
2. Asset-or-nothing barrier options. These pay out the value of the
asset or nothing, depending on whether the asset price has hit
the barrier or not.
We start by introducing nine factors:
A1 = se(b-r)TN(Oxi)
B1 = Ke—rT N(Oxi — 0,5)
A2 = Se(b r)T N(0x2)
B2 = Ke—rT N(0x2 —Ocf'%/T)
A3 = Se(b—r)T (H 1 S)2(it+1)N(71Y1)
B3 = Ke—rT (H 1 S) 24 N (71Y1—
(H 1 S) 2(4±1)N(7)Y2) A4 = Se (b-r)
/34 = Ke -rT (HIS) 24N(7)Y2 - 71(7 ,5)
A5 = K[(11 1 S)." ±A N(N) + (H 1 S)l t—A Niqz — 271Aa,5)
where K is a prespecified cash amount. The binary variables Ti and
0 each take the value 1 or —1. Moreover:
ln(H IS)
z = Acr,5
a
b — a2 /2 2r =
= a2 a2
By using A1 to A5 and B1 to B4 in different combinations, one can price
the 28 binary barrier options described below:
1. Down-and-in cash-(at-hit)-or-nothing (S > H):
Value: A5 Ti = 1
2. Up-and-in cash-(at-hit)-or-nothing (S < H):
Value: A5 = —1
3. Down-and-in asset-(at-hit)-or-nothing (S > H):
Value: (K = H): A5 Ti = 1
4. Up-and-in asset-(at-hit)-or-nothing (S < H):
Value: (K H): A5 = —1178 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
5. Down-and-in cash-(at-expiration)-or-nothing (S > H):
Value: B2 ± B4
6. Up-and-in cash-(at-expiration)-or-nothing (S < H):
Value: B2 ± B4 = -1, =
7. Down-and-in asset-(at-expiration)-or-nothing (S > H):
Value: A2 ± A4
8. Up-and-in asset-(at-expiration)-or-nothing (S < H):
Value: A2 ± A4
9. Down-and-out cash-or-nothing (5 > H):
= -1, q=1
Value: B2 - B4 = 1, = 1
10. Up-and-out cash-or-nothing (S < H):
Value: B2 - B4 = -1, =-1
11. Down-and-out asset-or-nothing (5 > H):
Value: A2 - A4
12. Up-and-out asset-or-nothing (S < H):
Value: A2 - A4 = -1, =-1
13. Down-and-in cash-or-nothing call (5 > H):
Value: (X > H): B3 = 1
Value: (X < H): B1 — B2 ± B4 = 1, = 1
14. Up-and-in cash-or-nothing call (S < H):
Value: (X > H): Bi =
Value: (X < H): B2 - B3 ± B4 = -1, =
15. Down-and-in asset-or-nothing call (5 > H):
Value: (X > H): A3 =
Value: (X < H): A1 — A2 ± A4 = 1, = 1
16. Up-and-in asset-or-nothing call (S < H):
Value: (X > H): A1 =
Value: (X < H): A2 - A3 ± A4 = -1, =4.19. BINARY OPTIONS
17. Down-and-in cash-or-nothing put (S > H):
179
Value: (X > H): B2 - B3 ± B4 = 1, = —1
Value: (X < H): R1 = —1
18. Up-and-in cash-or-nothing put (S < H):
Value: (X > H): Bi — B2 ± B4 - 1) =
Value: (X < H): B3
19. Down-and-in asset-or-nothing put (S > H):
Value: (X> H): A2 - A3 ± A4 = 1,
Value: (X < H): A1
20. Up-and-in asset-or-nothing put (S < H):
(1) = -I
= —1
Value: (X> H): A1 — A2 ± A3 = —1, =-1
Value: (X < H): A3 = —1
21. Down- and- out cash- or-nothing call (5 > H):
Value: (X> H): B1— B3 77 = 1, = 1
Value: (X < H): B2 — B4 z 1, = 1
22. Up-and-out cash-or-nothing call (S < H):
Value: (X < H): Bi — B2 ± B3 - B4 =
Value: (X> H): 0
77 —i, 51
23. Down-and-out asset-or-nothing call (S > H):
Value: (X > H): A1 — A3 z 1, = 1
Value: (X < H): A2 — A4 77 :=1, = 1
24. Up-and-out asset-or-nothing call (S < H):
Value: (X> H): 0
Value: (X < H): Ai — A2 ± A3 - A4 = —1, =1
25. Down-and-out cash-or-nothing put (5 > H):
Value: (X > H): Bi — B2 ± B3 - B4 = 1, (1) =
Value: (X < H): 0
26. Up-and-out cash-or-nothing put (S < H):
Value: (X > H): B2 ± B4 = -1
Value: (X < H): B1 — B3 = —1, = —1180 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-22
Binary Barrier Option Values
(H = 100, T = 0.5, r = 0.1, b =0 .1, a = 0.2)
K = 15, except for option numbers (3) and (4) where K = H
Option # S X = 102 X = 98 Option # S X = 102 X = 98
(1) 105 9.7264 9.7264 (15) 105 37.2782 45.8530
(2) 95 11.6553 11.6553 (16) 95 44.5294 54.9262
(3) 105 68.0848 68.0848 (17) 105 4.4314 3.1454
(4) 95 11.6553 11.6553 (18) 95 5.3297 3.7704
(5) 105 9.3604 9.3604 (19) 105 27.5644 18.9896
(6) 95 11.2223 11.2223 (20) 95 38.7533 22.7755
(7) 105 64.8426 64.8426 (21) 105 4.8758 4.9081
(8) 95 77.7017 77.7017 (22) 95 0.0000 0.0407
(9) 105 4.9081 4.9081 (23) 105 39.9391 40.1574
(10) 95 3.0461 3.0461 (24) 95 0.0000 0.2676
(11) 105 40.1574 40.1574 (25) 105 0.0323 0.0000
(12) 95 17.2983 17.2983 (26) 95 3.0461 3.0054
(13) 105 4.9289 6.2150 (27) 105 0.2183 0.0000
(14) 95 5.3710 7.4519 (28) 95 17.2983 17.0306
27. Down-and-out asset-or-nothing put (S > H):
Value: (X > H): Ai - A2 + A3 - A4 =1, = -1
Value: (X < H): 0
28. Up-and-out asset-or-nothing put (S < H):
Value: (X > H): A2 - A4 = -1, q5=-1
Value: (X < H): A1 - A3 = -1, q5=-1
Table 4-22 gives examples of values for 28 different types of binary
barrier options.
4.19.6 Double-Barrier Binary Options
Hui (1996) has published closed-form formulas for the valuation of
one-touch double-barrier binary options. A knock-in one-touch double-
barrier pays off a cash amount K at maturity if the asset price touches
the lower L or upper U barrier before expiration. The option pays off
zero if the barriers are not hit during the lifetime of the option. Simi-
larly, a knock-out pays out a predefined cash amount K at maturity if
the lower or upper barriers are not hit during the lifetime of the option.
If the asset price touches any of the barriers, the option vanishes. The4.19. BINARY OPTIONS 181
TABLE 4-23
Double-Barrier Binary Option Values
(s = 100, T = 0.25, r =0.05, b = 0.03, K = 10)
o = 0.1 o = 0.2 o = 0.3 o = 0.5
80 120 9.8716 8.9307 6.3272 1.9094
85 115 9.7961 7.2300 3.7100 0.4271
90 110 8.9054 3.6752 0.7960 0.0059
95 105 3.6323 0.0911 0.0002 0.0000
formula for the knock-out variant is
c° 2n- K [(Oa(-1)i Ma c = E Z2 a2 + (4)2 i=1
2 1 i7r
x sin C-7 - 1- 1n(S/L)) e- [( da2T
where
Z = ln(U / L), a = - (
2 a2
1 (213
1)
2
- 2 —
4 a2 a2
The option formula is an infinite series. Hui (1996) claims that the
series converges very fast and that a few terms are sufficient in most
situations. A knock-in can be valued as a short double-barrier binary
option plus the cash amount Ke -rT.
Table 4-23 gives examples of values for double-barrier binary
options for different choices of barriers and volatility.
4.19.7 Double- Barrier Binary Asymmetrical
This double-barrier binary option is knocked out if the asset price hits
the upper barrier U. If the asset price hits the lower barrier L, the
option pays out at hit (immediately) the prespecified rebate R— thus
the name. Hui (1996) shows that the value is
= R
x sin (±- zi z
2
Ein-
1=i
1n(S/L))
I
2 - [(0
2
-dO2T
(li r) e
(4.90)
± (1
(1)2 fi
ln(S/L)1
Z )]
(4.89)182 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
TABLE 4-24
Double-Barrier Binary Option Values
(S = 100, T = 0.25, r =0.05, b = 0.03, K = 10)
= 0.1 a =0.2 a =0.3 a =0.5
80 120 0.0000 0.2402 1.4076 3.8160
85 115 0.0075 0.9910 2.8098 4.6612
90 110 0.2656 2.7954 4.4024 4.9266
95 105 2.6285 4.7523 4.9096 4.9675
where
Z = ln(U/L),
1 (2b
a = —
1 2b ) 2
0-2
Also, this formula contains an infinite series. It exhibits rapid con-
vergence in most cases. Suppose, alternatively, the option is knocked
out if the lower barrier is hit and pays out rebate at upper-barrier hit.
In that case, the same formula can be used simply by exchanging the
two barriers, setting U = L and L = U.
Table 4-24 gives examples of values for double-barrier binary, cash
at lower barrier, and knock out at upper barrier hit.
4.20 ASIAN OPTIONS
Asian options are especially popular in the energy over the counter
(OTC) market and many commodity markets. An average is less
volatile than the underlying asset itself and will lower the price of
an average-rate option compared with a similar standard option. 12
Iftheoptionisbasedonanaverage,anattempttomanipulatethe
asset price just before expiration will normally have little or no effect
on the option's value. Asian options should therefore be of particular
interest in markets for thinly traded assets.
4.20.1 Geometric Average-Rate Options
If the underlying asset is assumed to be lognormally distributed, the
geometric average ((xi • • xn) 1/n) of the asset will itself be lognormally
distributed.
12If the option is into the average period, the value of an average-rate option can nat-
urally be higher than that of a similar standard option, depending on the realization
of the asset price.where
d1 =
aA -N/7
and the adjusted volatility is equal to
2 / In(SIX) + OA+ a l
1 \ T
A d2 =d1 - a A-N/T ,
4.20. ASIAN OPTIONS 183
Geometric Continuous Average-Rate Options
As originally shown by Kemna and Vorst (1990), the geometric average
option can be priced as a standard option by changing the volatility
and cost-of-carry term:
= Se(bA -r)T N(di)- Xe -rT N(d2) (4.91)
p = Xe-rT N(-d2)- Se (bA -r)T N(-di), (4.92)
Moreover, the adjusted cost-of-carry is set to
bA = - 1 (b - a )
2 6 •
Example
What is the value of a geometric average-rate put option with three
months to maturity? The strike is 85, the asset price is 80, the risk-free
rate is 5%, the cost-of-carry is 8%, and the volatility is 20%. S = 80,
X = 85, T = 0.25, r =0.05, b = 0.08, and a =0.2.
0.2 1
aA = = 0.1155 = 0.08
0.22
6 = 0.0366
ln(80/85) + (0.0366 + 0.11552/2)0.25
= = -0.8624
0.1155N/0.25
d2 = d1 - 0.1155,/0.25 = -0.9201
N(-d1)= N(0.8624) = 0.8058 N(-d2)= N(0.9201) = 0.8213
p = 85e-0.05x0.25 d2) _ 80e(0.0366-0.05)0.25m _d1) = 4.6922
The value of a similar standard European put option is 5.2186.
Geometric Discrete Average-Rate Options
In practice, all Asian options have discrete monitoring of the aver-
age. We now show how to value geometric average-rate options with
discrete monitoring. We will present the more general case where we
2184 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
can calibrate the geometric average volatility to a term structure of
implied volatilities from plain vanilla options. We are thus assuming
a spot rate process with time dependent deterministic volatility:
dSt = 1.1Sr dr + yr St dzt
The formula for the geometric average volatility, described in detail
by Haug, Haug, and Margrabe (2003), is
n— 1
2 1 2 2 crG = --,i E(n —i) vi
n"
i=0
where v, vt, is the local volatility between each fixing. For each time
step, we need the local volatility. The local implied forward volatil-
ities can be computed from global implied BSM volatilities by the
formula
2 2 Cfi - Cfi _ i ti_l
ti - ti_l
where a, is the implied global volatility for an option expiring at time
ti , and ai_I is the implied volatility for an option expiring at time
ti_1 < ti.
Computer algorithm
Function GeometricVolFromLocalVolTermStructure(v As Object , n As Long) As Double
Dim sum As Double
Dim i As Long
For i = 0 To n — 1
sum = sum + v(i + 1)^2 * (n
Next
GeometricVolFromLocalVolTermStructure = Sqr(sum / n^3)
End Function
Alternatively, we can find the Asian geometric volatility directly
from the plain vanilla global volatilities shown by Levy (1997):
n2T
[n n-1
0-i2ti +2 E(n — i)o-i2ti , (4.94)
where ai now is the implied BSM global volatility from an option that
expires at ti , and ti is the time to fixing i.
(4.93)
vi
i=1 1=14.20. ASIAN OPTIONS 185
Computer algorithm
Function GeometricVolFromGlobalVol(T As Double, v As Object, n As Long) As Double
Dim sum As Double, dt As Double
Dim i As Long
dt = T / n
For i = 1 To n — 1
mmn = mmn + v(i)A2 * dt * i + 2 * (n — i) * v(i)A2 * dt * i
Next
mmn = stun + v(n)A2 * T
GeometricVolFromGlobalVol = Sqr(sum / (nA2 * T))
End Function
Formulas (4.93) and (4.94) both yield the same result; the only
difference is that one of them takes local volatilities as input, while
the other takes global volatilities as input. As global volatilities are
the ones observable in the market, formula (4.94) seems to be the most
practical—saving you some calculations.
The value of geometric average options that are calibrated to the
term structure can now be computed with the BSM formula:
c = Se(bG —r)T N(di)— Xe —rT N(d2), (4.95)
where X is the strike price, N (.) is the cumulative normal distribution,
ln(S / X) + (bG oi/2)T
di =
aGA/7
and
d2 = di— G
This is the BSM formula where we have replaced the volatility with
aG, and the cost-of-carry with
a2
, n
bG = — G E(b —cr7/2)ti
2 nT
i=1
Here ti is the time to each fixing, T is the time to maturity, and cri is
the global BSM volatility for an option with expiration ti.
Variable Time between Fixings
We have so far assumed equal time between fixings. In real applica-
tions the time between fixings can vary Consider the case of daily
fixings. Most markets are closed on weekends, which results in186 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
longer time periods over weekends. The formula for calculation of the
variance for a geometric average with variable time between fixings is
n—1
a2 = (n - i)2 Ativ? (4.96)
We have simply assigned a variable time to each fixing, At, .
## 4.20.2 Arithmetic Average-Rate Options
It is not possible (or very hard) to find a closed-form solution for
the value of options on an arithmetic average (x' ±.n. ±xn).13 The main
reason is that when the asset is assumed to be lognormally
distributed, the arithmetic average will not itself have a lognor-
mal distribution. Arithmetic average rate options can be priced by
analytical approximations, as presented below, or with Monte Carlo
simulations, presented in Chapter 8.
The Turnbull and Wakeman Approximation
The approximation formula below is based on the work of Turnbull
and Wakeman (1991). The approximation adjusts the mean and vari-
ance so that they are consistent with the exact moments of the
arithmetic average. The adjusted mean, bA , and variance, o , are
then used as input in the generalized BSM formula:
)
c Se — rT (bA N(di) — Xe rT N(d2)
p Xe -rT N(d2)- S e - TN(d l )
d = ln(S/ X) ± (bA o-i/2)T
1
O' AN/7
d2 = d1 — aA'17,
where T is the time to maturity in years. The volatility and the cost-
of-carry of the average are given by
' in (M2)
aA wit
in(M1)
bA _ T
13A possible exception is a recent paper by Linetsky (2004) with a "closed-form solu-
tion" for the continuously sampled arithmetic option. One of the solutions requires an
infinite series of terms that involves Whittaker functions, and will by most practition-
ers not be considered "closed form." The method may still serve as a good benchmark
to test simpler implementations against.
(4.97)
(4.98)4.20. ASIAN OPTIONS 187
The exact first and second moments of the arithmetic average are
ebT _ ebti
M I —
b(T — t1)
2e(2b+02)T 2e(2b+a2)ti
M2=
(b a2)(2b a2)(T — t1) 2 — t1)2
where in the case of b 0 we have
[2b a2
eb(T—ti)
b a2
M1 = 1
2ea2T — 2ea2t1 [1 -4- a2(T — t1)]
M2 —
a4(T — ti)2
where t1 is the time to the beginning of the average period. If the
option is into the average period, the strike price must be replaced by
X, and the option value must be multiplied by , where
T2 — T SA
where SA is the average asset price during the realized or observed
time period so far. r is the reminding time in the average period r =
T2 — T.
If we are into the average period, r > 0, and X — SA < 0, then
a call option will for certain be exercised and is equal to the expected
value of the average at maturity minus the strike price e-rT (E[SA] —
X). The expected average at maturity is equal to 14
T2 — T
E[SAl — SA SMi —
T2 T2
The put will in this case for certain not be in-the-money and will have
value zero.
Computer algorithm
The computer code below calculates an adjusted cost-of-carry term, bA
and volatility, VA, and then calls the general BSM formula described
in Chapter 1.
Function TurnbullWakemanAsian( CallPutFlag As String, S As Double, _
SA As Double, X As Double, T As Double, T2 As Double, r As Double, _
b As Double, v As Double ) As Double
141n a risk-neutral world.188 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
' II CallPutFlag = "c" for call and "p" for put option
' II S = Asset price
' II SA= Realized average so far
' II X = Strike price
' II ti = Time to start of average period in years
' II T = Time to maturity in years of option T
' II T2 = Original time in average period in years,
'II constant over life of option
' II r = risk—free rate
' II b = cost—of—carry underlying asset can be positive and negative
' II v = annualized volatility of asset price
Dim ml As Double, m2 As Double, tau As Double, ti As Double
Dim bA As Double, vA As Double
'//tau: reminding time of average perios
ti = Max(0, T — T2)
tau = T2 — T
If b = 0 Then
ml = 1
Else
ml = (Exp(b * T) — Exp(b * ti)) / (b * (T — t1))
End If
'I/Take into account when option wil be exercised
If tau > 0 Then
If T2 /T*X—tau /T*SA<0 Then
If CallPutFlag = "c" Then
' I 'Expected average at maturity:
SA = SA * (T2 — T) / T2 + S * * T / T2
TurnbullWakemanAsian = Max(0, SA — X) * Exp(—r * T)
Else
TurnbullWakemanAsian = 0
End If
Exit Function
End If
End If
'II Extended to hold for options on futures May 16, 1999 Espen G. Haug
If b = 0 Then
m2 = 2 * Exp(v * v * T) / (1,04 * (T — t1)^2) _
— 2 * Exp(v * v * t1) * (1 + v * v * (T — t1)) _
/ (v^4 * (T — t1)^2)
Else
m2 = 2 * Exp((2 * b + v * v) * T) / ((b + v * v) _
* (2 * b + v * v) * (T — t1)^2)
+ 2 * Exp((2 * b + v * v) * tl) / (b * (T — t1)^2) —4.20. ASIAN OPTIONS 189
* (1 / (2 * b + v * v) — Exp(b * (T — t1)) / (b + v * v))
End If
bA = Log(m1) / T
vA = Sqr(Log(m2) / T — 2 * bA)
If tau > 0 Then
X = T2 / T * X— tau / T * SA
TurnbullWakemanAsian = GBIackSeholes(CallPutFlag, S, X, T, r, _
bA, vA) * T / T2
Else
TurnbullWakemanAsian = GBlackScholes(CallPutFlag, S, X, T, r, bA, vA)
End If
End Function
Example: TurnbullWakemanAsian("p", 90, 88, 95, 0, 0.25, 0.25, 0.07, 0.02, 0.25) will
return an arithmetic average put value of 5.6093.
Asian Futures Options
In the case of Asian options on futures, only the formulas above can be
simplified. If we assume the arithmetic average is approximately log-
normally distributed, all we need to value an Asian futures option is to
adjust the volatility of the Black-76 formula. This entails replacing the
futures volatility a with the volatility of the average on the futures o-A :
CA e —rT [F N (di) — XN(d2)] (4.99)
PA e—rT [X N ( — d2) — FN(—(11))], (4.100)
where T is the time to maturity, r is the risk-free rate, F is the futures
price, and X is the strike price.
In(F/ X) ± Tai/2
d1= d2 = — %/T .,
aA
where
a A —
1/1n(M)
M=
2e
2T
' ' — 2e'
2
[1 ± a2(T — -c)]
where r is the time to the beginning of the average period. If the option
is into the average period, the strike price must be replaced by X and
the option value must be multiplied by L_,where
X —
T2 F (T2 — T)
T A T
where T2 is the original time in the average period and FA is the aver-
age futures price during the realized or observed time period T2 — T.
If X should be negative, the call option will for sure be exercised at
maturity and the value becomes the discounted value of the expected190 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
average at maturity EQ [A] minus the strike price: EQ [A] — X. The
expected average is equal to
FA(T2- T) _T
EOM= T2 + F— T2
For a put, the value will be 0 if 5( should be negative. This is basi-
cally the Turnbull-Wakeman formula extended to Asian options on
futures.
Levy's Approximation
An alternative to the Turnbull and Wakeman formula is the Levy
(1992) Asian option approximation:
cAsLan sEN(do - x*e -rT2N(d2), (4.101)
where
x* = x
SE
S /L. NT = 2 e -rT2)
Tb
## 1 Fln(D)
=
[
2
ln(X*)] d2 = d1 - -f17
SA V = ln(D) - 2[r T2 ± ln(SE)] D =
T2
2S2 e(2b+72)T2 1 ebT2 1
M =
6+0.2 2b+ 2
The Asian put value can be found by using the following put-call
parity:
PAsian = cAsian
x*e-rT2
where
SA = Arithmetic average of the known asset price fixings.
S = Asset price.
X = Strike price of option.
r =Risk-free interest rate.
b = Cost-of-carry rate.
T2 = Remaining time to maturity.
T = Original time to maturity.
a =Volatility of natural logarithms of return of the
underlying asset.
The formula does not allow for b = 0. Table 4-25 illustrates this. 15
15For more comparisons between Asian option approximations, see Levy and
Turnbull (1992).4.20. ASIAN OPTIONS 191
TABLE 4-25
Examples of Arithmetic Average Call
Option Values
(s = SA = 100, T2 =-- 0.75, r = 0.1, b =0.05)
X
=0.15 ci =0.35
T 0.75 T =0.5 T =0.25 T =0.75 T =0.5 T =0.25
Turnbull and Wakeman Approximation
95 7.0544 5.6731 5.0806 10.1213 6.9705 5.1411
100 3.7845 1.9964 0.6722 7.5038 4.0687 1.4222
105 1.6729 0.3565 0.0004 5.4071 2.1359 0.1552
Levy's Approximation
95 7.0544 5.6731 5.0806 10.1213 6.9705 5.1411
100 3.7845 1.9964 0.6722 7.5038 4.0687 1.4222
105 1.6729 0.3565 0.0004 5.4071 2.1359 0.1552
Example
Consider an arithmetic average currency option with a time to expi-
ration of six months. The spot price is 6.80, the strike is 6.90, the
domestic risk-free interest rate is 7% per year, the foreign interest
rate is 9% per year, and the volatility of the spot rate is 14%. The
option is on the average of the next six months. S = 6.80,SA = 6.80,
X = 6.90, T = 0.5, T2 = 0.5, r =0.07, b=r- rf = 0.07 - 0.09 = -0.02,
and a =0.14.
6.8 sr
0.5( -0.02)
(e(-0.02-0.07) x 0.5 _ e-0.07x0 ) = .5. 6.5334
E'
= 6.90 0.5 -
0.5
6.80 = 6.9000 X *
0.5
2 x 6.802
-0.02 ± 0.142
e(2(-0.02)+0.142)0.5 _ 1 e(- 0.02)0.5 1 =
2(-0.02) + 0.142 -0.02
11.4825
D = =45.9298
0.52
V = In (45.9298) - 2[0.07 x 0.5 + ln (6.5334)] = 0.0033
## 1 Fln(45.9298)
/0.0033 L 2
= ln(6.9000)] = -0.3146
A
d2 = - N10.0033 = -0.3717
M =
11.4825192 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
N(di)= N(-0.3146) = 0.3765 N(d2) = N(-0.3717) = 0.3551
c;,- - 6.5334N(d1) - 6.9000e-0.07x0.5N, ,2, (a ) ••-- 0.0944
p ,',- 0.0944 - 6.5334 + 6.9000e-0.07x0.5 ,- r , 0.2237
## 4.20.3 Discrete Arithmetic Average-Rate Options
In practice, all traded Asian options have discrete fixings of their
average, for instance, every day or week. We next present several
approximations for discrete average Asian options. The first method
is basically a discrete average version of the Turnbull-Wakeman for-
mula. The next method is the Curran approximation. Both of these
implementations assume a flat term structure of volatility for plain
vanilla options. In practice, there is often an upward- or downward-
sloping volatility term structure. The last method implements a
volatility term structure.
Discrete Asian Approximation
The value of a Asian call can be valued as (see Levy, 1997, and Haug,
Haug, and Margrabe, 2003)
CA
,.... .,,, c—rT [FAN • ' (a is
)— XN(d2)1,
and the value of a Asian put as
PA "-- e
-rT
XN(-d2) - [FAN(-d1)],
where
2
d1=
-
ln(FA/X) ± To-A /z
d2 = di - CIA ',if
FA is defined as E[A T], and
1n(E[4]) - 21n(E[A7])
T
ebhn
E1AT1=
S
—e
b 1'1 1 _
n 1 — ebh
(7A -17
Q4 =
(4.102)
(4.103)
and
E[4] =
s2e(2b+a 2)ti 2)hn 1 — e(2b+6
n2 1 — e(21 +cr2 )h
2 fi _ ebhn 1 - e(21 +62)hn
±
1 — e(b-Pb2 )h 1 — ebh 1 _4.20. ASIAN OPTIONS 193
T-t,
where h = In the case of b = Owe have n-1 '
E[AT1 = S
2 S2eg2ti 1 — ea2h" 2 1 — ea2")]
E[A 71—
1— ea
2
h
±
1—eg 2h — ea2h
If we are inside the average period, m > 0, then the strike price
should be replaced by
nX — mSA
n
rn
x=
n — m n — m
Moreover, if SA > X then the exercise is certain for a call, and in
the case of a put, it must end up out-of-the-money. So the value of the
put must be zero, while the value of the call must be
CA = c—rT (s ^A _
where SA = SA t-L i n E[A] n— nin
If there is only one fixing left to maturity, then the value can be
calculated using the BSM formula weighted with time left to maturity
and an adjusted strike price. The value of an Asian call option is then
CA = cBSM(S,i,T, r, b, a)1 ,
where CBsm the generalized BSM call formula, and
= nX — (n —1)SA,
and SA is the realized average so far. Similarly, the value of a Asian
put with one fixing left is
PA = PBSM(S, T, r,b,a)- 1 ,
where pBsm the generalized BSM put formula.
Table 4-26 gives values for discrete arithmetic average call options.
Different choices for time to next average point ti and volatility a are
reported.
Computer algorithm
Function DiscreteAsianHHM(CallPutFlag As String, S As Double, SA As Double, _
X As Double, ti As Double, T As Double, n As Double, m As Double, _
r As Double, b As Double, v As Double) As Double
'II This is a modified version of the Levy formula published in194 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
TABLE 4-26
Discrete Arithmetic Average Call Option Values
(X = 100, T = 0.5 + t1, At = 1/51 r =0.08, b = 0.03,n = 27, m = 0)
S a =0.1 a = 0.2 a = 0.3 a = 0.4 a = 0.5
0 weeks 95 0.2719 1.4166 2.8005 4.2572 5.7480
100 1.9484 3.4961 5.0557 6.6219 8.1951
105 5.7150 6.7212 8.0874 9.5713 11.1094
10/52 95 0.8805 2.8800 5.0164 7.1874 9.3708
(10 weeks) 100 2.9570 5.1974 7.4551 9.7156 11.9757
105 6.5087 8.2935 10.4171 12.6364 14.8936
20/52 95 1.4839 4.0658 6.7249 9.3973 12.0679
(20 weeks) 100 3.7669 6.4983 9.2546 12.0106 14.7590
105 7.2363 9.5520 12.2008 14.9356 17.6981
'II "Asian Pyramid Power" By Haug, Haug and Margrabe
Dim dl As Double, d2 As Double, h As Double, EA As Double, EA2 As Double
Dim vA As Double, OptionValue As Double
h = (T - ti) / (n - 1)
If b = 0 Then
EA = S
Else
EA = S / n * Exp(b ti) * (1 - Exp(b h
End If
* n)) / (1 - Exp(b h))
If m > 0 Then
'II Exercise is certain for call , put must be out-of-the-money
If SA>n/m*XThen
If CallPutFlag = "p" Then
DiscreteAsianHHM = 0
ElseIf CallPutFlag = "c" Then
SA = SA * m / n + EA * (n - m) / n
DiscreteAsianHHM = (SA - X) * Exp(-r T)
End If
Exit Function
End If
End If
' /1 Only one fix left use Black-Scholes weighted with time
If m = n - 1 Then
X = n * X - (n - 1) * SA
DiscreteAsianHHM = GBlackScholes(CallPutFlag , S, X, T, r, b, v) _
* 1 / n
Exit Function
End If4.20. ASIAN OPTIONS 195
If b = 0 Then
EA2 = S * S * Exp(v * v * t1) / (n * n) _
* (( 1 - Exp(v * v * h * n)) / (1 - Exp(v * v * h)) _
+ 2 / (1 - Exp(v * v * h)) _
* (n - (1 - Exp(v * v * h * n)) / (1 - Exp(v * v * h))))
Else
EA2 = S * S * Exp((2 * b + v * v) * ti) / (n * n)
* ((I - Exp((2 * b + v * v) * h * n)) _
/ (1 - Exp((2 * b + v * v) * h)) _
+ 2 / (1 - Exp((b + v * v) * h)) * ((I - Exp(h * h * n))
/ (1 - Exp(b * h)) - (1 - Exp((2 * b + v * v) * h * n))
/ (1 - Exp((2 *b+v*v)*h))))
End If
vA = Sqr((Log(EA2) - 2 * Log(EA)) / T)
OptionValue = 0
If m > 0 Then
X = n / (n - m) * X - m / (n - m) * SA
End If
dl = (Log(EA / X) + vAA2 / 2 * T) / (vA * Sqr(T))
d2 = dl - vA * Sqr(T)
If CallPutFlag = "c" Then
OptionValue = Exp(-r * T) * (EA * CND(d1) - X * CND(d2))
ElseIf (CallPutFlag = "p") Then
OptionValue = Exp(-r * T) * (X * CNIX-d2) - FA * CND(-d1))
End If
DiscreteAsianHHM = OptionValue * (n - m) / n
End Function
Example: DiscreteAsianHHM(c,100,110,105,0,0.5,360,180,0.07,0.02,0.25) will
return an arithmetic average call value of 2.0971.
Curran's Approximation
Curran (1992) has developed an approximation method for pric-
ing Asian options based on the geometric conditioning approach. 16
Curran(1992)claimsthatthismethodismoreaccuratethanother
16For more on Asian options valuation, see Geman and Yor (1993), Haykov (1993),
Curran (1994), Bouaziz, Briys, and Grouhy (1994), Zhang (1994), Geman and
Eydeland (1995), and Zhang (1995b).c,,,__, e—rT [
1 E n e4,±0.
7/2N ii, — 1n(i) ,
± —
n i=1 (Tx (Tx
—XN
(p,
ax
(4.104)
196 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
closed-form approximations presented earlier.
where
S = Initial asset price.
X = Strike price of option.
r =Risk-free interest rate.
b = Cost-of-carry
T = Time to expiration in years.
ti = Time to first averaging point.
At = Time between averaging points.
n = Number of averaging points.
CT =Volatility of asset.
N(x) = The cumulative normal distribution function.
= In(S) (b — a 2/2)ti
Nia 2 [ti (i — 1) At]
crxi = a 2 {ti AtRi —1)— i(i — 1)/(2n)]}
ii = in(S) (b — a2/2)[t1 (n — 1)t/2]
ax = At(n — 1)(2n — 1)/6n]
1 n 2 2 2
axi [1n(X) — Al ± ai — aXi /ax
i = 2X — — E exp Ai ±
n al. 2
1=1
If we are inside the average period, m > 0, then the strike price
should be replaced by
nX — mSA
x=
n — m n —m
Further, if SA > i ni L l X, then exercise is certain for a call, and in the case
of a put, it must end up out-of-the-money. So the value of the put must
be zero, while the value of the call must be
CA = e—rT (5, "A )0,
where &'A =-- SA? E[A] i m . fl
and4.20. ASIAN OPTIONS 197
TABLE 4-27
Asian Call Options Using the Geometric
Conditioning Approach
(X = 100,T = 26 weeks, At = 1 week, r = 0.08, b = 0.03, n=27)
S a = 0.1 a= 0.2 a= 0.3 a= 0.4 a= 0.5
0 95 0.2758 1.4262 2.8099 4.2581 5.7298
100 1.9466 3.4899 5.0395 6.5878 8.1320
105 5.7110 6.7024 8.0489 9.5053 11.0051
10/52 95 0.8819 2.8814 5.0139 7.1753 9.3417
(10 weeks) 100 2.9560 5.1934 7.4443 9.6923 11.9321
105 6.5066 8.2852 10.3991 12.6029 14.8369
20/52 95 1.4844 4.0655 6.7207 9.3847 12.0409
(20 weeks) 100 3.7661 6.4952 9.2461 11.9920 14.7243
105 7.2348 9.5466 12.1885 14.9116 17.6564
If there is only one fixing left to maturity, then the value can be
calculated using the generalized BSM formula weighted with time
left to maturity and an adjusted strike price. The value of an Asian
call option is then
CA = cBsm(S, ,T, r, b,a)- 1 ,
where CBsm is the generalized BSM call formula
= nX - (n - OSA,
and SA is the realized average so far. Similarly, the value of an Asian
put with one fixing left is
PA = PBSM (S, b,a)-1,
where pBsm the generalized BSM put formula.
Table 4-27 reports Asian option values based on Curran's approx-
imation method.
Computer algorithm
The computer code below calculates the Asian option value using
Curran's approximation.
Function AsianCurranApprox ( CallPutFlag As String, S As Double, _
SA As Double, X As Double, t 1 As Double, T As Double, n As Long, _
m As Long, r As Double, b As Double, v As Double ) As Double
Dim dt As Double, my As Double, myi As Double198 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
Dim vxi As Double, vi As Double, vx As Double
Dim Km As Double, suml As Double, sum2 As Double
Dim ti As Double, EA As Double
Dim z As Integer, i As Long
z = 1
If CallPutFlag = "p" Then
z = —1
End If
dt = (T — ti) / (n — 1)
If b = 0 Then
EA = S
Ease
EA = S / n * Exp(b * ti) * (1 — Exp(b * dt * n)) / (1 — Exp(b * dt ))
End If
If m > 0 Then
IfSA>n/m*XThen
'I/Exercise is certain for call , put must be out—of—the—money:
If CallPutFlag = "p" Then
AsianCurranApprox = 0
ElseIf CallPutFlag = "c" Then
SA = SA * m / n + EA * (n — ni) / n
AsianCurranApprox = (SA — X) * Divr(—r * T)
End If
Exit Function
End If
End If
If m = n — 1 Then
' // Only one fix left use Black—Scholes weighted with time
X = n * X — (n — 1) * SA
AsianCurranApprox = GBlackScholes(CallPutFlag , S, X, T, r, b, v) _
* 1 / n
Exit Function
End If
If m > 0 Then
X = n / (n — m) * X — m / (n — m) *SA
End If
vx = v * Sqral + dt * (n — 1) * (2 * n — 1) / (6 * n))
ffw = Log(S) + ( b — v v * 0.5) * (t1 + (n — 1) * dt / 2)
small = 0
For i = 1 To n Step 1
ti = dt * i + ti — dt
vi = v * Sqr(t1 + (i — 1) * dt)
vxi = v * v * (t1 + dt * (( i — 1)
rnyi = Log(S) + ( b — v * v * 0.5)
— i *
* ti
(i — 1) / (2 * n)))
sum]. = suml + Ilqp(myi + vxi / (vx * vx) * _
(bog(K) — nly) + (vi * vi — vxi * vxi / (vx * vx)) * 0.5)
Next
= 2 * X — 1 / n * suml
sum2 = 04.20. ASIAN OPTIONS 199
For i = 1 To n Step 1
ti = dt * i + ti — dt
vi = v * Sqr(t1 + (i — 1) * dt)
vxi = v * v * (ti + dt * ((i — 1) — i * (i — 1) / (2 * a)))
myi = Log(S) + (b — v * v * 0.5) * ti
sum2 = sum2 + Exp(myi + vi * vi * 0.5) _
* CND(z * ((my — Log(Km)) / vx + vxi / vx))
Next
AsianCurranApprox = Exp(—r * T) * z * (1 / n * sum2 — X _
* CND(z * (my — Log(Km)) / vx)) * (n — m) / n
End Function
Example: AsianCurranApprox(c",100,110,105,0,0.5,360,180,0.07,0.02,0.25) will
return an arithmetic average call value of 2.0928.
## 4.20.4 Equivalence of Floating-Strike and Fixed-Strike
Asian Options
We have mainly been looking at how to value what is known as fixed-
strike Asian options. In a floating-strike Asian option, the strike is set
equal to the average, and a floating-strike call option will at maturity
pay out the maximum of the spot price minus the realized average and
zero, max] S — A, 01. Similarly, a floating-strike put will at maturity pay
out max[il — S, 01. One way to find the value of a floating-strike Asian
option, or vice versa, is by using what is known as fixed-floating Asian
value symmetry, aka fixed-floating Asian Symmetry. Henderson and
Wojakowski (2001) describe how to go from the value of a fixed-strike
Asian option to a floating-strike Asian option, and vice versa.
c f = (S,1,T, r, b, a) r--- - px (S, S, T, r — b,—b, a), (4.105)
where cf stands for a floating-strike Asian call and px stands for
fixed-strike Asian put. Similarly, we have
X
cx = (X, S,T , r, b, a) = pf (s, —
s
,T, r — b,—b, a) (4.106)
This result holds for arithmetic Asian options when we are still not in
the average period.
4.20.5 Asian Options with Volatility Term- Structure
Plain vanilla options on the same security but with different time to
maturity typically trade at different (implied) volatilities. In other
words, we typically observe a nontrivial volatility term structure. The200 CHAPTER 4. EXOTIC OPTIONS—SINGLE ASSET
Asian option formulas mentioned so far assume a flat term structure
of volatility. We now describe a more realistic model that can be cal-
ibrated to the term structure of plain vanilla option volatilities as
described by Haug, Haug, and Margrabe (2003); see also Levy (1997).
The volatility of an arithmetic discrete average, calibrated to the
term structure of implied volatilities, can be found as
aA =
1n(E[4]) — 21n(E[AT])
(4.107)
where n
E[AT]=
where Fi is the forward price at fixing i. Moreover,
n n
E[4] = Ene(2b±cri2)t, ± 2 e u2)t bt E E s- ' e
nz i=1
i=1 j=i+1
ai is the plain vanilla BSM volatility for an option with expiration
ti, where ti is the time to fixing i. Defining FA = EMT], we can now
approximate the value of the arithmetic call option as 17
e—rT [FAN(di) — XN(d2)] (4.108)
and a put option as
p e—rT [XN(—d2)— FAN( — di)j.
where NO is the cumulative normal distribution function,
ln(FA /X) ± Tail2
and
d2 = d1— 0AsiT
d1 =
(TAN/7
(4.109)
Even if this basically is the Black-76 formula with a modified asset
price and volatility, it still holds for Asian options on stocks, stock
indexes, and futures.
It is well known that this type of model works best for reasonably
low volatilities—for instance, spot volatility less than 30%. However,
it is in general far better to use a relatively simple approximation that
takes into account the term structure of volatility than using a more
accurate model that does not calibrate to the term structure.
17The Levy formula is unnecessarily complex. Haug, Haug, and Margrabe (2003)
simplify it.4.20. ASIAN OPTIONS 201
TABLE 4-28
Arithmetic Asian Options with Vol atility Term
Structure
(S = 100, ti = 1/52, T = 0.5, r =0.05, b = 0, a = 0.2, n = 26. in = 0)
Call Values Put Values
X Flat Up +0.5% Down -0.5% Flat Up +0.5% Down -0.5%
80 19.5152 19.5063 19.5885 0.0090 0.0001 0.0823
90 10.1437 9.8313 10.7062 0.3906 0.0782 0.9531
100 3.2700 2.2819 4.3370 3.2700 2.2819 4.3370
110 0.5515 0.1314 1.2429 10.3046 9.8845 10.9960
120 0.0479 0.0016 0.2547 19.5541 19.5078 19.7609
Table 4-28 shows arithmetic Asian option values. The first col-
umn is values using 20% fiat volatility term structure, while the
next column is an upward-sloping term structure. We assume the
plain vanilla implied volatility is increasing with 0.5% for every week
to maturity. A six-month plain vanilla option thus trades for 20%
implied Black-Scholes volatility, and a one-week option trades at
7.5% volatility. The third column is calibrated to a downward-sloping
volatility term structure where the plain vanilla volatility for a one-
week option trades at 32.5% volatility and a six-month option trades
at 20% volatility.
Computer algorithm
Function AsianDiscreteTermStructure ( CallPutFlag As String, S As Double, _
SA As Double, X As Double, ti As Double, T As Double, n As Long, _
m As Long, r As Double, b As Double, v As Object ) As Double
Dim dl As Double, d2 As Double, h As Double, EA As Double, EA2 As Double
Dim vA As Double, OptionValue As Double
Dim i As Long, j As Long
Dim suml As Double, sum2 As Double
h = (T - ti) / (n - 1)
If b = 0 Then
EA = S
Else
EA = S / n * Exp(b * ) * (1 - Exp(b * h * n)) / (1 - Exp(b * h))
End If
If m > 0 Then
IfSA>n/m*XThen
'II Exercise is certain for call, put must be out-of-the-money
If CallPutFlag = "p" Then202 CHAPTER 4. EXOTIC OPTIONS-SINGLE ASSET
AsianDiscreteTermStructure = 0
ElseIf CallPutFlag = "c" Then
SA = SA * / n + EA * (n — m) / n
AsianDiscreteTermStructure = (SA — X) * Exp(—r * T)
End If
Exit Function
End If
End If
If m = n — 1 Then
' II Only one fix left use Black—Scholes weighted with time:
X = n * X — (n — 1) * SA
AsianDiscreteTermStructure = GBlackScholes(CallPutFlag, S, X, _
T, r, b, v(n)) * 1/n
Exit Function
End If
suml = 0
sum2 = 0
For i = 1 To n — 1
suml = suml + Exp((2 * b + v(i)^2) * (t1 + (i — 1) * h))
For j = i + 1 To n
sum2 = sum2 + Exp((b + v(i)^2) * + ( i — 1) * h)) _
* Exp(b * + (j — 1) * h))
Next
Next
suml = suml + Exp((2 * b + v(n)^2) * (ti + (n — 1) * h))
EA2 = SA2 / (n^2) * (suml + 2 * sum2)
vA = Sqr((Log(EA2) — 2 * Log(EA)) / T)
If (m > 0) Then
X = n / (n — m) * X — / (n— *5A
End If
dl = (Log(EA / X) + vAA2 / 2 * T) / (vA * Sqr(T))
d2 = dl — vA * Sqr(T)
If CallPutFlag = "c" Then
OptionValue = Exp(—r * T) * (EA * CND(d1) — X * CND(d2))
ElseIf (CallPutFlag = "p") Then
OptionValue = Exp(—r * T) * (X * CND(—d2) — EA * CND(—d1))
End If
AsianDiscreteTermStructure = OptionValue * (n — m) / n
End FunctionCHAPTER
EXOTIC OPTIONS ON
TWO ASSETS
Trading exotic options is the most fun you can have with your
pants on.
Exotic options trader
In this chapter I present a large class of analytical formulas for exotic
options on two or more assets. The exotic option pricing formulas
presented here are based on the Black-Scholes-Merton (BSM) econ-
omy, meaning that the underlying asset prices are assumed to follow
geometric Brownian motions
= + aiSidz
dS2 = bt2S2dt + a2S2dw,
where pii and 42 are the expected instantaneous rates of return of the
two assets, and ai and a2 are the corresponding instantaneous volatili-
ties. dz and dw are two correlated Wiener processes. The volatility
and risk-free rate is assumed to be constant throughout the life of
the option. This can in many cases be generalized to deterministic
volatility and rates. Most of the formulas are written on a general form
that include a cost-of-carry term, which makes it possible to use the
same formula to price options on a wide variety of underlying assets:
stocks, stock indexes paying a dividend yield, currencies, and futures.
Since the formulas are closed-form solutions, they can in general only
be used to price European-style options. See Chapter 7, "Trees and
Finite Difference Methods," for information on how to value American-
style exotic options.
5.1 RELATIVE OUTPERFORMANCE OPTIONS
Relative outperformance options, aka quotient options, are described
by Derman (1992) and Zhang (1998). A relative outperformance call
gives a payoff max [i — X, 0] at maturity. A put similarly pays off
203204 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
max [X - 0]. The value of a call is
L S2
c = e-rT [FN(d2) - XN (din (5.1)
and for a put we have
p = e-rT VW!) - FN (d2)1, (5.2)
where F = - 1
s Puiu2)T
S2
ln(F / X) ± T '3-2 /2
d1 =
aN/7
d2 = - o-J7
= aF + _ 2paia2
This is basically the Black-76 formula with the forward price and
volatility replaced.
Table 5-1 gives examples of relative outperformance option values
for different values of strike price X, time to maturity T, and
correlation p.
TABLE 5-1
Examples of Relative Outperformance Option
Values
(Si = 130, S2=100, r = 0.07, b1 = 0.05, b2 = 0.03, al = 0.3, a2 = 0.4)
X
T = 0.25 T =0.5
p = - 0.5 p =0 p = 0.5 p = - 0.5 p =0 p =0.5
0.1 1.2582 1.2380 1.2181 1.3188 1.2769 1.2363
0.2 1.1599 1.1397 1.1198 1.2222 1.1804 1.1398
0.3 1.0616 1.0415 1.0216 1.1257 1.0838 1.0432
0.4 0.9634 0.9432 0.9233 1.0292 0.9873 0.9467
0.5 0.8651 0.8449 0.8250 0.9332 0.8908 0.8501
0.6 0.7671 0.7467 0.7268 0.8386 0.7949 0.7536
0.7 0.6699 0.6487 0.6285 0.7466 0.7004 0.6573
0.8 0.5748 0.5517 0.5303 0.6588 0.6089 0.5619
0.9 0.4840 0.4574 0.4329 0.5764 0.5221 0.4691
1.0 0.3997 0.3686 0.3382 0.5005 0.4417 0.3814
2.0 0.0266 0.0107 0.0013 0.0965 0.0509 0.0132
3.0 0.0010 0.0001 0.0000 0.0170 0.0044 0.00025.3. TWO-ASSET CORRELATION OPTIONS 205
TABLE 5-2
Examples of Product Option Call Values
(Si = 100, S2 = 105, X = 15000, r = 0.07, b1 = 0.02, b2 = 0.05)
T = 0.1 T = 0.5
cr1 62 p = -0.5 p = 0 p = 0.5 p = -0.5 p = 0 p = 0.5
0.2 0.3 0.0028 0.4289 3.2956 32.6132 154.3380 319.7141
0.3 0.3 0.0267 2.4026 13.2618 56.7733 266.1594 531.7894
0.4 0.3 0.3535 9.3273 35.4908 118.1504 425.9402 787.9742
5.2 PRODUCT OPTIONS
Zhang (1998) describes formulas for product options. A product call
has payoff max[Si S2 - X, 01, while a put pays off max[X - S1 S2, 01. The
value of a call is given by
c = e'T [FN(d2) - XN WO] (5.3)
and for a put we have
p = e-r T [XN (cli) - F N(d2)1, (5.4)
where F = SiS2e(bi-F)2+ paia2)T
ln(FIX) + T a212
=
d2 = di -
= Ia? + +2pericr2
Table 5-2 shows product option values, for different values of volatility
cr, time to maturity T, and correlation p.
5.3 TWO-ASSET CORRELATION OPTIONS
This call option pays off max(S2 - X2; 0) if Si > Xi and 0 otherwise. The
put pays off max(X2 - 52) if S1 < X1 and 0 otherwise. These options can
be priced using the formulas of Zhang (1995a):
c = S2e(b2-r)T M(Y2 YI Pa2',5; P)
X2e -rT M (Y2, Yl; P) (5.5)206 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
P = X2e—rT M(—Y2, —Y1; P)
— S2e(b2 r)T M (— Y2 — a2lf, —Y1 — P(721 77; P), (5.6)
where p is the correlation coefficient between the returns on the two
assets and
111(S1 /Xi) ± (bi —a?/2)T
Y1 = Y2 =
2
111(S2/X2) (1)2 — cr
plyr 2
Example
Consider a call with six months to expiration. The price of stock A is
52, the price of stock B is 65, the strike price is 50, the payout level
is 70, the volatility of stock A is 20%, the volatility of stock B is 30%,
the risk-free interest rate is 10%, and the correlation between the
two stocks is 0.75. With Si = 52, S2 = 65, T = 0.5, Xi = 50, X2 = 70,
al = 0.2, az. = 0.3, r =0.1, bi = b2 = 0.1, and p = 0.75, we get
16(52/50) ± (0.1 — 0.22/2)0.5
Y1 = = 0.5602
16(65/70) ± (0.1 — 0.3 2/2)0.5
Y2 = = —0.2197
M(Y2 (721f, Yi + Pa2I ; P) =0.4753 M(Y2, Yl; 19) = 0.3933
c = 65e(0.1-0.1)0.5 m(y2 yi per2,177; p)
70e-0.1X0.5 M(y2, yi ; p) = 4.7073
5.4 EXCHANGE-ONE-ASSET-FOR-ANOTHER
OPTIONS
An exchange-one-asset-for-another option, originally introduced by
Margrabe (1978), gives the holder the right to exchange asset S2 for
Si at expiration. The payoff from an exchange-one-asset-for-another
option is
max(Qi — Q2S2; 0),
where Qi is the quantity of asset Si and Q2 is the quantity of asset
S2. The current value of the option is
C Exchange = Q1 Si e(bI r)T N WI) — Q2S2e (b2—r)T N (d2), (5.7)5.4. EXCHANGE-ONE-ASSET-FOR-ANOTHER OPTIONS 207
where
d=
In(Qi S1 /(Q2S2)) + (b1 -b2 a"212)T
1
d2 = d1-
= 1/a2 + c72 2
2 Palcr2'
where p is the correlation between the two assets. Table 5-3 shows
values for European exchange options. Different values are given
for time to maturity T, the volatility of the second asset cr2, and the
correlation between the two assets p.
Application
Exchange options are embedded in several financial contracts. One
example is when a corporation bids on another corporation by offering
its own shares in exchange for the stocks in the takeover candidate.
The owners of the takeover candidate receive an option to exchange
their stocks for the stocks in the acquiring corporation.
There are also exchange options that are embedded in short bond
or note futures contracts. If you are short a bond future, you have
to deliver a bond to the counterparty that is long the future at the
expiration of the future's contract. However, the counterparty that is
short the future can normally choose from a whole class of bonds to
deliver. Such bonds can be valued as exchange options.
Example
Consider a European option to exchange bond B for bond A with six
months to expiration. Bond A is currently priced at 101, the coupon
rate is 8%, and the volatility per year is 18%. Bond B is currently
priced at 104, the coupon rate is 6%, and the volatility per year is
12%. The risk-free interest rate is 10%. The correlation between their
rates of return is 0.8, Si = 101, S2 = 104, T = 0.5, r =0.1, bi = 0.02,
TABLE 5-3
Examples of European Exchange Options Values
(Si = 22, S2 = 20, Qi= Q2 = 1, r =0.1, b1 = 0.04, b2 = 0.06, ai = 0.2)
T=0.1 T =0.5
a2 p = -0.5 p =0 p = 0.5 p = -0.5 p = 0 p = 0.5
0.15 2.1251 2.0446 1.9736 2.7619 2.4793 2.1378
0.20 2.1986 2.0913 1.9891 2.9881 2.6496 2.2306
0.25 2.2827 2.1520 2.0189 3.2272 2.8472 2.3736208 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
b2 = 0.04, ai = 0.18, a2 = 0.12, p = 0.8. Thus:
= VO.182 + 0.122 -2 x 0.8 x 0.18 x 0.12 = 0.1106
16(101/104) + (0.02 - 0.04 + 0.11062/2)0.5
d1 = = 0.4629
0.1106N/675
d2 = - 0.1106,./(T5 = -0.5411
N(cli)= N( -0.4629) = 0.3217 N(d2) = N( -0.5411) = 0.2942
c = 101e(0.02-0.1)0.5 N (di) _ 104e
(0.04-0.1)0.5 N (d2) = 1.5260
5.5 AMERICAN
EXCHANGE-ONE-ASSET-FOR-ANOTHER OPTION
Bjerksund and Stensland (1993b) show that an American option to
exchange asset S2 for asset Si can be simplified to the problem of
pricing a standard American call with underlying asset Si with risk-
adjusted drift equal to bi - b2, strike price S2, time to maturity T,
risk-free rate equal to r - b2, and the volatility replaced by 6.1
CExchange C(Q1S1, Q2S2, T , r - b2, 1,1 -b2, (5.8)
where C(S, X, T, r, b, a) is the value of a plain vanilla American call
option-for example, the Bjerksund and Stensland (1993a) closed-
form approximation. 6. is defined as in the case of the European
exchange option. Table 5-4 gives values of an American exchange
option using different input parameters. The input parameters are as
in Table 5-3 and illustrate that the American-style exchange option is
more valuable than its European counterpart.
TABLE 5-4
Examples of American Exchange Options Values
(Si = 22, S2 = 20, Qi= Q2 = 1, r = 0.1, 61 = 0.04, 62 = 0.06, ai = 0.2)
T = 0.1 T = 0.5
a2 p= - 0.5 p=0 p= 0.5 p= -0.5 p=0 p= 0.5
0.15 2.1357 2.0592 2.0001 2.8051 2.5282 2.2053
0.20 2.2074 2.1032 2.0110 3.0288 2.6945 2.2906
0.25 2.2902 2.1618 2.0359 3.2664 2.8893 2.4261
1An alternative is to price the option in a binomial tree using the technique described
by Rubinstein (1991b).5.6. EXCHANGE OPTIONS ON EXCHANGE OPTIONS 209
5.6 EXCHANGE OPTIONS ON EXCHANGE OPTIONS
Exchange options on exchange options can be found embedded in
sequential exchange opportunities. An example described by Carr
(1988) is a bond holder converting into a stock and later exchang-
ing the shares received for stocks of an acquiring firm. Carr also
introduces formulas for pricing this type of rather complex option.
The value of the option to exchange the option to exchange a fixed
quantity Q of asset S2 for the option to exchange asset S2 for Si is
r2
= SI e(bi—07.2 M(d1 , yi; -11-1/T2) — S2e(b2 -)T
k.
AA1A
2., Y2;
Qs2e(b2-r)tl A i(d2) (5.9)
The value of the option to exchange asset S2 for Si in return for a
fixed quantity Q of asset S2 is
r) C = S2e(b2-r)T2 M(d3, y2; —01/T2) — e T2
M(d4, Yi; - 01/T2) (bi
s2e(b2-r)tI (5.10)
where
In(S1/(1S2)) + (61 - b2 + a
2
/2)t1
= -
ln(1S2/S1) + (b2 - bi ± 2/2)/1
= d3 - aN/Ii
111(S1 /S2) + (bi - b2 + a
2
/2)7'2
y1 = Y2 =Y1 - al/T2
a N/T2
111(S2/S1) + (b2 - bi + a
2
/2)T2
y3= Y4 = Y3 - aN/T2
N/T2
2 2
a = 1/al a2 2Pala2
I is the unique critical price ratio Ii
e(bi-r)(T2-0)
r)(T2-,i) solving
IiN (zi) - N (z2) = Q
in(/' ) ± (T2 - ti)cr 2/2
Z2 -= Zi a,./T2 tl,
cr.\/T2 -
where
Si = Asset 1.
S2 = Asset 2.
ti = Time to expiration of the "original" option.210 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
T2 = Time to expiration of the underlying option (T2 > t1).
b = Cost-of-carry rate, asset Si.
b2 = Cost-of-carry rate, asset S2.
al =Volatility of asset Si
cr2 = Volatility of asset S2.
p = Correlation between asset Si and S2.
Q = Quantity of asset delivered if option is exercised.
The value of the option to exchange a fixed quantity Q of asset S2 for
the option to exchange asset Si for S2 is
2 Ant-, c = S2e(b2-r)T2 M(d3, Y3; Vt1/T) -
Sie_r)T
ta (b1 4, Y4; 1'1 I T2)
- QS2e(b2-
r)ti N(d3)
(5.11)
The value of the option to exchange the option to exchange asset Si
for S2 in return for a fixed quantity Q of asset S2 is
C = e (b1 r)T2 M(d1 , Y4; -011 72) S2e (b2-r)T2 M(d2, Y3; -011 7'2)
+ QS2e(b2-r)t1 N(d2), (5.12)
TABLE 5-5
Exchange Options on Exchange Options Values
(s2 = 100, t1 = 0.75, T2 = 1, r = 0.1, b1 = 0.1, b2 = 0.1 ,Q = 0.1)
0-2
p = - 0.5 p = 0 p =0.5
S = 100 S1 = 105 S = 100 Si = 105 Si = 100 Si = 105
Option to exchange QS2 for the option to exchange S2 for Si
0.20 0.20 8.5403 10.9076 6.2333 8.4333 3.3923 5.2802
0.20 0.25 10.1756 12.6391 7.5787 9.8819 4.3605 6.3758
0.25 0.20 10.1756 12.6391 7.5787 9.8819 4.3605 6.3758
Option to exchange the option to exchange S2 for Si in return for QS2
0.20 0.20 4.7893 4.1747 4.9870 4.2359 5.4267 4.3746
0.20 0.25 4.6948 4.1492 4.8607 4.1961 5.2395 4.3166
0.25 0.20 4.6948 4.1492 4.8607 4.1961 5.2395 4.3166
Option to exchange QS2 for the option to exchange Si for S2
0.20 0.20 7.3679 5.9428 5.3005 3.9927 2.7895 1.7663
0.20 0.25 8.8426 7.3670 6.5040 5.1199 3.6392 2.4929
0.25 0.20 8.8426 7.3670 6.5040 5.1199 3.6392 2.4929
Option to exchange the option to exchange Si for S2 in return for QS2
0.20 0.20 3.6169 4.2099 4.0542 4.7954 4.8239 5.8607
0.20 0.25 3.3619 3.8771 3.7859 4.4341 4.5182 5.4337
0.25 0.20 3.3619 3.8771 3.7859 4.4341 4.5182 5.43375.7. OPTIONS ON MAX OR MIN OF TWO RISKY ASSETS 211
S2e (b2-r)(T2-ti ) where I is now the unique critical price ratio 12 = e(bi_0(T2-t1
thatsolves
N (z i) - 12N (z 2) = Q
ln(12) + (T2 - )a 2/2
Z2 = z - 0.0.2 tl Z1 =
a,/T2 -
Table 5-5 shows values of an exchange option on an exchange option.
Values are given for a range of volatilities, correlations, and asset
prices.
5.7 OPTIONS ON THE MAXIMUM OR THE MINIMUM
OF TWO RISKY ASSETS
Formulas for pricing options on the minimum or maximum of two
risky assets were originally introduced by Stulz (1982) and have later
been extended and discussed by Johnson (1987); Boyle, Evnine, and
Gibbs (1989); Boyle and Tse (1990); Rubinstein (1991d); Rich and
Chance (1993); and others.
Call on the Minimum of Two Assets
Payoff: max[min(Si , S2) — X, 01
cmin(Si, S2, X, T) = Sie (bl —r)T M(yi, —d; — P1)
S2e (b2—r)T M(y2, d — T.; —P2)
— Xe rT M(YI 01'V Y2 — 0.2'1 P),
where
ln(Si /S2) + (bi - b2 cr2/2)T
d=
a If
ln(S1 / X) + a?/2)T ln(S2/ X) + (b2 a1/2)T
Y1 =
s,ff
Y2 -
, 0.2'sj
2 2 al - Pa2 a2 Pal
P1 = P2 — = a 1 + cr2 2, 1' 010.2
a a
Call on the Maximum of Two Assets
Payoff: max[max(Si , S2) — X, 01
cmax (Si, S2, X, T) = e (b1 r)T M (Y1, d; P1)
S2e (b2-r)T M (Y2, —d + a ; P2) — X e -r T
x[1 — M ( —Y1 + al -VT ., —y2 + 0"2'VT.;
(5.13)
(5.14)212 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
Put on the Minimum of Two Assets
Payoff: max[X — min(Si , S2), 01
Pmm (si , S2, X, T) = Xe —rT — cmin(S1, S2, 0, T) cmin(S1, S2, X, T), (5.15)
where
c01in(S1, S2,0, T) = Sie(b'')T
— Sie (bi—r)T N(d) S2e(b2—r)T N(d — fi")
Put on the Maximum of Two Assets
Payoff: max[X — max(Si, S2), 01,
Pmax(Si, S2, X, T) = Xe —rT — cmax (S), S2, 0, T) cmax (S , S2, X, T), (5.16)
where
cmax(SI,S2,0,T) = S2e(b2
—r)T
) N(d) — S2e(b2— ± e(b1—rT r)T N(d — Alf)
Example
Consider a put option that gives the holder the right to sell the
maximum of stock index A and stock index B at a strike price of
98. Time to maturity is six months, stock index A pays a dividend
yield of 6%, stock index B pays a dividend yield of 9%, the price of
index A is currently 100, the price of index B is 105, the volatility
of index A is 11%, the volatility of index B is 16%, the risk-free
interest rate is 5%, and the correlation between the return on the
two stock indexes is 0.63. S1 = 100, S2 = 105, X = 98, T = 0.5, r =0.05,
b1 = 0.05 — 0.06 = —0.01,b2 = 0.05 — 0.09 = —0.04, al = 0.11,a2 = 0.16,
and p = 0.63.
=./0.112 + 0.162 — 2 x 0.63 x 0.11 x 0.16 = 0.1246
0.11 —0.63 x 0.16
= 0.0738 P2 =
0.16 —0.63 x 0.11
= 0.7280
0.1246 0.1246
ln(100/105) + (-0.01 + 0.04 + 0.12462/2)0.5
d = = —0.3395
0.1246.JöT
ln(100/98) + (-0.01 + 0.11 2/2)0.5
Y t = = 0.2343
0.11,A3
ln(105/98) + (-0.04 + 0.162/2)0.5
= 0.4896 Y2 =
P15.8. SPREAD-OPTION APPROXIMATION 213
(—
cmax(Si, S2, 0, T) = 105e 00.05)0.5 + 100e -0.01-0.05)0.5 N (d)
(
— 105e 0.04- 0.05)0 N (d .5(— — 0.1246A5.3) = 102.4324
—6.05)0.5 m(yi, d; ,91 CMaX (SI S2, X, T) = 100e(-0.0!
(- 0.05)0.5m ' y2
+ 105e 0
d 0.1246A53; P2)
_ 98e—o.05x0.5 [1
— /1“—Yi + 0.11A, —y2 -I- 0.16AF:33; = 8.0700
Pmax (Si , S2, X, T) = 98e-0.05x0.5 _ 102.4324 + 8.0701 = 1.2181
Options on the Maximum or the Minimum of Several Assets
For an extension of options on the maximum or the minimum on
several assets, we refer to Johnson (1987).
5.8 SPREAD- OPTION APPROXIMATION
The payoff from a European call spread option on two underlying
assets is max(Si — S2 — X, 0). The payoff from a put option is similarly
max(X — Si + S2, 0). A European spread option can be valued using the
standard Black and Scholes (1973) model by performing the following
transformation, as originally shown by Kirk (1995) (here generalized
to options on "any" asset):2
( Si
c = max(Si — S2 — X, 0) = max 1, x (S2 + X)
S2+ X
p = max(X — + S2, 0) = max (1 ,0 x (S2 + X)
S2 + X
The value of a call or put is given by
c (Q2S2e(b2—r)T Xe—rT ON (di) — N (d2)]
(Q2S2e
— r)T Xe
—rT AN(— d2) — SN ( —din P (b2
where
in(S) + (0-2/2)T
=
()VT
—r)T
S=
Q S e(in
Q2S2e02-0T xe—rT '
(5.17)
(5.18)
2For valuation of spread options see also Boyle (1988), Wilcox (1991), Bjerksund and
Stensland (1994), Rubinstein (1994b), Shimko (1994), and Pearson (1995).214 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
and the volatility can be approximated by
2 \ 2 '1
- 4)0.1 (72F
where
Q2 s2e(b2 --r)T
Q2S2e02-0T xe-rT '
where
Si =-- Price on asset one.
S2 == Price on asset two.
Q i=-- Quantity of asset one.
Q2 Quantity of asset two.
X = Strike price.
T=-- Time to expiration of the option in years.
b1 =-- Cost-of-carry asset 1.
b2 == Cost-of-carry asset 2.
r=-- Risk-free interest rate.
Volatility of asset 1.
a2 == Volatility of asset 2.
p =-- Correlation between the two assets.
Table 5-6 illustrates how call spread option values vary with changes
in correlation p, volatilities o-i and a2, and time to maturity T.
Example
Consider a call option on the spread between two futures contracts,
with three months to expiration. The price of futures contract 1 is
28, the price of futures contract 2 is 20, the strike is 7, the risk-free
interest rate is 5% per year, the volatility of futures 1 is 29% per year,
the volatility of futures 2 is 36%, and the correlation between the
TABLE 5-6
Examples of Call Spread Options on Futures
Values
(S1 = 122, S2 = 120, X =3, r =0.1, b1 = b2 = 0)
T =0.1 T =0.5
Cf I Ci2 p=-0.5 p=0 p= 0.5 p=-0.5 p=0 p=0.5
0.20 0.20 4.7530 3.7970 2.5537 10.7517 8.7020 6.0257
0.25 0.20 5.4275 4.3712 3.0086 12.1941 9.9340 7.0067
0.20 0.25 5.4061 4.3451 2.9723 12.1483 9.8780 6.9284
F -5.9. TWO-ASSET BARRIER OPTIONS 215
instantaneous returns on the two futures is 0.42. Si = 28, S2 = 20, X =
7, T = 0.25, r =0.05, bi = b2 0, o = 0.29, cr2 = 0.36, and p = 0.42.
28e(0-0.05)0.25
F = = 1.0370
20e(0-0.05)0.25 7e(0- 0.05)0.25
2 20
a 0.292 + [0.36
20
20 2 x 0.42 x 0.29 x 0.36 x
+ 7
20 + 7 = 0.3004
In(1.0370) + (0.30042/2)0.25
= = 0.3172
0.3004-V0.25
d2 = d1 - 0.3004-V0.25 = 0.1670
N(d1) = N(0.3172) = 0.6245, N(d2) = N(0.1670) = 0.5663
c (20 + 7)(e -0.05 x0.25[1.0370N(di ) - N(d2)J) = 2.1670
5.9 TWO-ASSET BARRIER OPTIONS
In a two-asset barrier option, one of the underlying assets, Si, deter-
mines how much the option is in- or out-of-the-money, and the other
asset, S2, is linked to barrier hits. Heynen and Kat (1994b) have
developed the following pricing formula:
w = { nSie (bl -r)T2 M(01, (Pei ; - Op)
[2(A2 ± Pa 0-2)1n(H / S2)] „ ,
- exp
„.2 (7013, We3;
-2
- riXe I -rTM 07112, 0e2; —OP)
- exp
[2g2In(H/S2)
]
„,„
2 We4;
a2
where
ln(SI/X) ± ±a?)T
al VT.
2p1n(H /S2) 2p1n(H /S2)
d3 = + d4 = d2
a 2 VT' a-2NIT"
(5.19)ln(H/S2) — (//2 + Pal a2)T
el =
a2-07
21n(H/S2)
e2 = el + pai
21n(H/S2)
a2
e3 = et
a2 '177
e4 = e2
216 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
= — a?/2 =b2—a1/2
Two-Asset "Out" Barriers
Down-and-out call (cdo) = 1, q, =—1
Payoff: max(Si — X; 0) if S2 > H before T else 0 at hit
Up-and-out call (c o) = 1, = 1
Payoff: max(Si — X; 0) if S2 < H before T else 0 at hit
Down-and-out put (pdo) = — 1, = —1
Payoff: max(X — S1; 0) if S2 > H before T else 0 at hit
Up-and-out put (Puo) = — 1, = 1
Payoff: max(X — S1; 0) if S2 < H before T else 0
Two-Asset "In" Barriers
Down-and-in call Cdi = call — Cdo
Payoff: max(SI — X; 0) if S2 > H before T else 0 at expiration.
Up-and-in call cu, = call — cuo
Payoff: max(S1 — X; 0) if S2 <H before T else 0 at expiration.
Down-and-in put pdi = put — Pdo
Payoff: max(X — S2; 0) if S2 > H before T else 0 at expiration.
Up-and-in put pui = put — puo
Payoff: max(X — S2; 0) if S2 <H before T else 0 at expiration.
Table 5-7 shows values for two-asset barrier call and put options for
different choices of strike price X, barrier H, and the correlation
between the two assets p.
Application
To illustrate the use of two-asset barrier options, consider a
Norwegian oil producer. As oil is typically sold for USD per barrel, the
producer's income in Norwegian currency (NOK) depends on not only
the oil price but also the currency price NOK per USD. The oil producer
may wish to hedge the currency risk by using currency options. Should
the oil price (dollar per barrel) increase, however, the producer can5.10. PARTIAL-TIME TWO-ASSET BARRIER OPTIONS 217
TABLE 5-7
Two-Asset Barrier Option Values
(Si = S2 = 100, T = 0.5, o = cr2 = 0.2, r = 0.08, b1 = b2 = 0.08)
Type X H p = -0.5 p = 0
cdo 90 95 3.2941 4.9485 6.6592
cdo 100 95 1.4173 2.6150 3.8906
cdo 110 95 0.4737 1.1482 1.8949
cuo 90 105 4.6670 3.1827 1.8356
cuo 100 105 2.8198 1.6819 0.7367
cuo 110 105 1.4285 0.7385 0.2263
Pdo 90 95 0.6184 0.3498 0.1141
Pilo 100 95 2.0075 1.2821 0.6114
Pdo 110 95 4.3298 3.0813 1.8816
Puo 90 105 0.0509 0.2250 0.4795
Puo 100 105 0.3042 0.8246 1.4811
Puo 110 105 1.0134 1.9818 3.0712
afford a lower exchange rate. An ideal option would therefore be
a currency option that is knocked out if the oil price increases to
a particular level. This two-asset barrier option will naturally be
cheaper than a similar standard currency option.
5.10 PARTIAL-TIME TWO-ASSET BARRIER OPTIONS
A partial-time two-asset barrier option is similar to a standard two-
asset barrier option, except that the barrier hits are monitored only
for a fraction of the option's lifetime. The option is knocked "in" or "out"
if asset S2 hits the barrier H during the monitoring period, while the
payoff depends on asset Si and the strike price X. The formula of
Bermin (1996c) can be used to price European partial-time two-asset
barrier options, where the barrier monitoring is set to cover the first
part ti of the full time to expiration T2:
I w = 71,51e(b1-`)T2 MO7di, Oei; --710P ti I T2)
[20/2 + pc7icr2)1n(H/S2)
- exp M(703, 03; -77001 / T2)
2218 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
I - liXe -rT2 M(nd2,0e2; -OP-N/411'2)
[ 2/121n(H/S2)
- exp
a2 M(04, 0e4; --710PVti 1 T2) ,
2
(5.20)
where
=
al ,s/T2
2p ln(H/S2)
a2N/r2
ln(H/S2) - (h,t2 + Pala2)ti
21n(H/S2)
e3 = ei
=b1 - 4/2
d2 = d1 - al
2p ln(H/S2)
0.2,s/r2
e2 = ei pai
ln(Si I + + a?)T2
d3=dl +
el -
d4 = d2 +
ect = e2
= b2 -
?I is set equal to 1 for a call option and -1 for a put option. 0 is set
equal to 1 if the option is an up-and-out and equal to -1 if the option
is a down-and-out.
Table 5-8 gives examples of partial-time two-asset barrier option
values. The values are given for a range of input parameters.
TABLE 5-8
Partial-time Two-Asset Barrier Option Values
(s1 = 52 = X = 100, H =85, T2 = 1, r = b1 = b2 =0.1, al = 0.25, cr2 = 0.3)
Type
Barrier Monitoring Time t1
0.25 0.5 0.75 1
cdo 0.5 14.9758 12.3793 10.9409 10.2337 9.8185
Pdo 0.5 5.4595 3.5109 2.3609 1.7502 1.3607
cdo 0.0 14.9758 11.2067 8.9828 7.8016 7.0480
Pdo 0.0 5.4595 4.0855 3.2747 2.8441 2.5694
cdo -0.5 14.9758 9.8818 6.8660 5.2576 4.2271
Pdo -0.5 5.4595 4.5801 4.1043 3.8778 3.7497
cd, and pd, indicate down-and-out call and put, respectively.5.11. MARGRABE BARRIER OPTIONS 219
5.11 MARGRABE BARRIER OPTIONS
A down-and-in exchange-one-asset-for-another option (down-and-in
Margrabe) is knocked in if the ratio of the two asset prices S = Si/S2
hits the barrier H before maturity. Haug and Haug (2002) derives a
closed-form formula for these options:
2b
1 H2
ce di = S2e(b2-07. (
S
-) cBSA1 (-S ,1,T, 0, b, a , (5.21)
where CBsm is the BSM call option with current price of underlying
S, strike 1, time to maturity T, risk-free rate r, cost-of-carry b, and
volatility a . In the down-and-in Margrabe, b =b1 - b2. Similarly, the
value of an up-and-in Margrabe put option is given by
14- r)T S ' H2
pu e = S2e(b2- PBSM 7 , 1, T, 0, b, as) , (5.22)
where pBsm is the BSM put option.
Table 5-9 shows down-and-in Margrabe values. The first row
shows plain vanilla Margrabe prices. It is evident that the barrier
option values converge to the Margrabe option values when the
barrier converges to the current price ratio G = 1.25, because the
probability of a barrier hit converges to unity.
The value of down-and-out Margrabe options follows from the in-
out parity. A down-and-out Margrabe option is simply equal to a long
plain Margrabe option plus a short down-and-in Margrabe option.
In the special case when H = 1 and b1 = b2 the formula for a down-
and-out Margrabe can be simplified to <10 = e(bi-r)T (si -
S2). For such
parameters this option is "surprisingly" unaffected by volatility and
TABLE 5-9
Down-and-In Margrabe Values
For comparison, the first line shows plain Margrabe
values without barriers (S1 = 125, S2 = 100, T = 1,
r =0.07, b1 = 0.03, b2 = 0.05, (71 = 0.45, (72 = 0.47)
p = -0.5 p = 0
45.8421 40.1508 32.7530
1.2499 45.8318 40.1401 32.7417
1.2000 40.7303 34.9214 27.2639
1.1500 35.7986 29.9309 22.1338
1.1000 31.0790 25.2257 17.4500
1.0500 26.6049 20.8523 13.2922
1.0000 22.4108 16.8553 9.7238220 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
correlation. If b1 = b2 = r we naturally get an even simpler formula;
ce do = Si - S2, this is the world's simplest two-asset option formula,
see Lindset and Persson (2006).
Lastly, consider an up-and-out Margrabe option. Its price is
given by
ce = Sie(bl-r)T
(ki) (k3 ,
)
2b
) 1+7/1 (757 (k2) (k4)11
1 2b
1 [ , - S2e (b 2- r)T "1) - N (k3) -
uv (k2) - N (k4)}
(II
(5.23)
where N(x) = N(x - oVT)
ln(H I S) - (b - (7 2) T ln(S I H) - (b - a 2) T
k1 = k2 -
a ff a ff
-1n(S) - (b - 4 a2) T ln(S/H2) - (b - cr2) T
k3= k4= ,
cr-Nif cr ,,ii"
and as before, b = b1 - b2. An up-and-in Margrabe can be valued as
a plain Margrabe option plus a short up-and-out Margrabe option.
Table 5-10 confirms that its price converges to zero as the barrier
converges to the current price ratio. Moreover, the price converges
TABLE 5-10
Up-and-Out Margrabe Values
For comparison, the first line shows plain Margrabe
values without barrier (Si = 125, S2 = 100, T = 1,
r =0.07, b1 = 0.03, b2 = 0.05, al = 0.45, a2 = 0.47)
p = -0.5 p = 0 p = 0.5
45.8421 40.1508 32.7530
1.2599 0.0025 0.0048 0.0136
1.5000 0.3011 0.5503 1.4583
2.0000 3.1487 5.2288 10.7486
2.5000 8.3667 12.5473 20.3393
3.0000 14.2419 19.5300 26.3218
3.5000 19.7277 25.1056 29.5072
5.0000 31.5188 34.3892 32.3216
25.0000 45.7671 40.1490 32.7530
50.0000 45.8399 40.1508 32.75305.13. TWO-ASSET CASH-OR-NOTHING OPTIONS 221
to the price of a plain vanilla Margrabe as the barrier increases.
This is also as expected, since the probability of knocking out the
option contract diminishes as the barrier increases.
Applications
Margrabe barrier options are relevant to investors and traders that
are concerned with the relative performance of stocks, or, for instance,
a stock versus a stock index. Moreover, Margrabe (1978) indicated
that exchange-one-asset-for-another options are often embedded in
financial contracts, and thereby also relevant to corporate finance. An
important case is when a firm bids for another firm by offering its own
shares in exchange for shares of the target. The owners of the target
in effect receive an option to exchange their shares for shares in the
acquiring firm. This is only part of the story, however, as many bidding
firms use explicit or implicit walk-away covenants that render the
offer void if the share price of the target company drops significantly
in relation to that of the acquiring firm. In this case, Margrabe barrier
options as presented here should be of interest.
5.12 DISCRETE- BARRIER OPTIONS
For discrete-barrier options the barrier can in general be adjusted
in the same way as for single-asset barrier options—see Chapter 4,
"Exotic Options Single Asset," for more information on this.
5.13 TWO-ASSET CASH- OR-NOTHING OPTIONS
Four types of two-asset cash-or-nothing options exist:
1. A two-asset cash-or-nothing call pays out a fixed cash amount
K if asset one, Si, is above the strike X 1 and asset two, 52, is
above strike X2 at expiration.
2. A two-asset cash-or-nothing put pays out a fixed cash amount if
asset one, S1 , is below the strike X1 and asset two, S2, is below
strike X2 at expiration.
3. A two-asset cash-or-nothing up-down pays out a fixed cash
amount if asset one, S1, is above the strike X 1 and asset two,
52, is below strike X2 at expiration.
4. A two-asset cash-or-nothing down-up pays out a fixed cash
amount if asset one, Si, is below the strike Xi and asset two,
S2, is above strike X2 at expiration.222 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
The formulas published by Heynen and Kat (1996a) can be used to
price these binary options:
[1] = Ke-rT M (du, d2,2; P) (5.24)
[2]= Ke' T M (-du , -d2,2; P) (5.25)
[3]= Ke -rT A 1(41, -d2,2; -P) (5.26)
[4]= K e' T M (-41 , d2,2; -P), (5.27)
where
ch
ln(S, / Xj ) (bi - o-12 /2)T
,j -
If
Table 5-11 reports values for two-asset cash-or-nothing options of
types 1, 2, 3, and 4, for different choices of time to maturity T and
correlation p.
Application
Two-asset cash-or-nothing options can be useful building blocks for
constructing more complex exotic option products. One example is a
C-Brick option, which pays out a prespecified cash amount K if asset
S1 is between X i and X2 and asset S2 is between X3 and X4. This option
can be engineered by using four type [1] two-asset cash-or-nothing call
options with different strikes:
C- Brick = Ke -rT [M (di 1,d23; P) - M (di 2,d23; P)
- M (du, d2,4; P) ± M(42, d2,4; P)1
In a similar way, Heynen and Kat (1996a) show how to value four
types of bivariate asset-or-nothing options.
TABLE 5-11
Two-Asset Cash-or-Nothing Options
(St = S2 = 100, X1 = 110, X2 = 90, K = 10,r = 0,1, 1,1 =0.05, b2 = 0.06,
cri = 0.2, 0-2 = 0.25)
T =0.5 T=1
Type p = —0.5 p = 0 p = 0.5 p = —0.5 p = 0 p =0.5
1 1.45845 2.03611 2.49875 1.73130 2.37027 2.94710
2 1.11639 1.69406 2.15669 1.04202 1.68099 2.25782
3 1.25311 0.67545 0.21281 1.63473 0.99576 0.41893
4 5.68434 5.10667 4.64404 4.64032 4.00136 3.424525.14. BEST OR WORST CASH-OR-NOTHING OPTIONS 223
5.14 BEST OR WORST CASH-OR-NOTHING
OPTIONS
Brockhaus, Farkas, Ferraris, Long, and Overhaus (2000) shows how to
value best or worst cash-or-nothing options on two assets. At maturity
a best of two asset call option pays out a predefined cash amount K if
asset Si or S2 is above or equal to the strike price X. A best of two asset
put similarly pays out K at maturity if Si or S2 is below or equal to X.
A worst of two asset call option pays out a predefined cash amount if
asset Si and S2 is above or equal to the strike. Similarly, a put pays
out if both the assets are below or equal to the strike. The value of a
best of two asset cash-or-nothing call is
Chest =Ke-rT [m(y,zi; -P1) + M(-y, z2; —P2)]
=.10-;+0-1.._ 2po-1a2
ln(Si/X)+ (bi +af./2)T ln(S2/X) + (b2 +o-1./2)T
Z1 = Z2=
cri N/7 ,77
al — Pa2 a2 - Pal
PI = P2=
a a
and for the put
Pbest = Ke-
Tr [i
(y, zi; -Pi) - M(-y , z2; - P2)1
The formula for a worst of two assets cash-or-nothing call is
cworst = Ke—rT [A1(— )), Zi; P1) ± M(Y, Z2; P2)1, (5.30)
and the worst of two assets cash-or-nothing put value is given by
Pworst = K e—rT [I — M (—y, Z1; Pl) ± A 1(Y Z2; P2)] (5.31)
(5.28)
(5.29)
Table 5-12 shows values of best or worst two asset cash-or-nothing
options for different choices of strike price X and correlation p.224 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
TABLE 5-12
Examples of Best or Worst Two Asset Cash-or-Nothing
Options Values
(s1 = 105, S2 = 100, K =5, T =0.5, r = 0.08, b1 =0.06, b2 = 0.02, al = 0.3, a2 =0.2)
X p = - 0.75 p = - 0.5 p = - 0.25 p =0 p 0.25 p = 0.5 p =0.75
Best of two asset cash-or-nothing call
90 3.1495 3.2280 3.3131 3.4058 3.5114 3.6394 3.8121
100 1.7329 1.8770 2.0175 2.1652 2.3291 2.5244 2.7939
110 0.7782 0.8659 0.9809 1.1136 1.2661 1.4506 1.7089
Best of two asset cash-or-nothing put
90 1.6544 1.5759 1.4908 1.3981 1.2925 1.1645 0.9919
100 3.0710 2.9269 2.7865 2.6387 2.4749 2.2796 2.0100
110 4.0258 3.9380 3.8231 3.6904 3.5379 3.3534 3.0950
Worst of two asset cash-or-nothing call
90 4.7641 4.6856 4.6005 4.5078 4.4022 4.2742 4.1015
100 4.2226 4.0785 3.9381 3.7903 3.6265 3.4312 3.1616
110 3.1055 3.0177 2.9027 2.7701 2.6176 2.4331 2.1747
Worst of two asset cash-or-nothing put
90 0.0398 0.1183 0.2034 0.2961 0.4018 0.5298 0.'r 024
100 0.5813 0.7254 0.8659 1.0136 1.1775 1.3728 1.6423
110 1.6985 1.7862 1.9012 2.0339 2.1864 2.3709 2.6292
5.15 OPTIONS ON THE MINIMUM OR MAXIMUM
OF TWO AVERAGES
Wu and Zhang (1999) have developed closed-form formulas for
European options on the minimum or maximum of two geometric
average prices. Assume T is the reminding time to maturity and To
is the original time to maturity when the option was issued. A call on
the minimum of two averages gives the holder at expiration the right
to receive max[min(GI, G2) - X, 0], where G1 and G2 are the realized
geometric average of, respectively, asset one Si and asset two S2. Its
option value is given by
CminAsian = §1M(a1 , a5; P1) ±§2M(a3, a6; P2) - Xe -rTM(a2, a4; P), (5.32)
where p is the correlation between the return on the two assets and
111(571/X) (b1 6 2/2)T
a2 = ai
= a3 -
=
ln(§21x)+ (b2 0'22 12)T
a3 -a T
= — — a = 1/0712 + (72 2 2071a2
.0 To
5.15. OPTIONS ON THE MIN OR MAX OF TWO AVERAGES 225
a5 a6 =
ln(§1 [5'2) - T62/2
al
al = _
„Ij To
T
=
To
siT/T, e(pci—r)T GI
= s2 T/To e(pc2—r)T G2
2 T 1 2 T2
kt1 = (b1 — /2) + 0361
2 T 1 2 T2
kt2 = (b2 - a2 /2) — + -(72
2T0 6 To'
P(12 Pd1
= P2=
a
Even if geometric averages are not used much in practice, the closed-
form solution for this case is useful in implementing a variance
reduction technique for valuation of arithmetic average options, using
Monte Carlo simulation.
The formula above holds for the case where the average covers the
option's entire lifetime. Wu and Zhang (1999) discusses how to extend
it to a forward starting average.
Table 5-13 gives values for a call on the minimum of two geometric
averages for different choices of strike X, time to maturity T, and
correlation p.
Call on the Maximum of Two Averages
This is equivalent to a long position in two ordinary geometric aver-
age call options and a short call on the minimum of two geometric
averages.
Put on the Minimum of Two Averages
This is equivalent to a long discount bond with face value X and a
short call on the minimum of two averages with zero strike, and a
long call on the minimum of two assets with strike X:
PMinAsian = Xe rT — CmiriAsian(Gi , G2, 0) CMinAsian (Gi, G2, X) (5.33)226 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
TABLE 5-13
Examples of Call on the Minimum of Two Geometric
Averages Values
(Si 100, 52 = 105,11 = 0, r =0.05, b] =b2 =0.05, c)-1 = 0.3, c)-2 = 0.4)
T = 0.25 T = 0.5
X p = -0.5 p =0 p =0.5 p = -0.5 p =0 p = 0.5
80 15.2652 16.4730 17.9827 12.9408 14.6644 16.8381
85 10.5019 11.7079 13.2051 8.7259 10.4274 12.5329
90 6.1880 7.3733 8.8061 5.2044 6.8204 8.7668
95 2.8580 3.9291 5.1737 2.6449 4.0492 5.7199
100 0.9279 1.7007 2.6131 1.1062 2.1627 3.4656
105 0.1919 0.5822 1.1187 0.3714 1.0351 1.9476
110 0.0238 0.1560 0.4044 0.0989 0.4441 1.0165
115 0.0017 0.0327 0.1240 0.0209 0.1714 0.4942
120 0.0001 0.0054 0.0325 0.0035 0.0598 0.2249
Put on the Maximum of Two Averages
A put on the maximum of two averages can be constructed from a
long discount bond with face value X, short a call on the maximum
of two averages with strike 0, and long a call on the maximum of two
averages with strike X:
PMtnAstan = Xe rT - CMax4sian(G1, G2,0) ± CMaxAsian (Gi, G2, X) (5.34)
5.16 CURRENCY-TRANSLATED OPTIONS
## 5.16.1 Foreign Equity Options Struck in
Domestic Currency
As the name indicates, these are options on foreign equity where the
strike is denominated in domestic currency. At expiration, the foreign
equity is translated into the domestic currency.
The payoff to a U.S. investor for an option linked to the Nikkei
index is
E = max( (slyen) S'(;en c($1share) 'share) - X($/share), CI)
P($1share) =max(X,d, , w share) - E ($1 yen) S' en1 sha reP 13)
Valuation of these options is achieved using the formula attributed to
Reiner (1992).3
3Valuation of this option is based on the same technique as developed by Margrabe
(1978).5.16. CURRENCY-TRANSLATED OPTIONS 227
Option Value in Domestic Currency (i.e., USD)
c = Es*e-qTN(do- X e rT N (d2) (5.35)
p = Xe-rT N(-d2) - Ere -qT N( -d1), (5.36)
where
In(E S* I X) ± (r - q
-
cris*/2)T
aES*N/7
d2 = d1 - aES. ff
2 2
aES*= aE ± as*
2
PES*aEaS*
Option Value in Foreign Currency (i.e., JPY)
c = S*e—qT WO— E*Xe -rT N(d2) (5.37)
p = E* Xe -rT N(-d2)- (5.38)
where
In(S* I (E* X)) (r - q ai *s* /2)T
d1 =
crE* S* Nri"
d2 = d1 - aE*S*If
aE*S* = IaE* S* 2 ± a2 - 2pE*s*aE*a s*
S* = Underlying asset price in foreign currency.
X = Delivery price in domestic currency.
r =Domestic interest rate.
q = Instantaneous proportional dividend payout rate
of the underlying asset.
E = Spot exchange rate specified in units of the domestic
currency per unit of the foreign currency.
E* = Spot exchange rate specified in units of the foreign
currency per unit of the domestic currency.
as* = Volatility of the underlying asset.
aE = Volatility of the domestic exchange rate.
= Volatility of the foreign exchange rate.
PES* = Correlation between asset and domestic exchange rate.
pE.s* = Correlation between asset and foreign exchange rate.228 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
Example
Consider a foreign equity call option struck in domestic currency with
six months to expiration. The stock index is 100, the strike is 160, the
spot exchange rate is 1.5, the domestic interest rate is 8% per year,
the dividend yield is 5% per year, the volatility of the stock index is
20%, the volatility of the currency is 12% per year, and the correlation
between the stock index and the currency rate is 0.45. S* = 100, X =
160, T = 0.5, E = 1.5, r =0.08, q = 0.05, as, 0.2, aE =0.12, PE,S* =
0.45. Thus:
a E S* = 10.122 + 0.22 + 2 x 0.45 x 0.12 x 0.2 = 0.2757
ln(1.5 x 100/160) + (0.08 — 0.05 + 0.27572/2)0.5
= = 0.1567
0.2757,
d2 = d1 — 0.2757, = —0.3516
N(di) = N(-0.1567) = 0.4378 N(d2) = N(-0.3516) = 0.3626
c =- 1.5 x 100e-0.05x0.5N(a ) 160e-0.08x0.5N , (a ) = 8.3056
## 5.16.2 Fixed Exchange Rate Foreign Equity Options
A fixed exchange rate foreign equity option (quanto) is denominated
in another currency than that of the underlying equity exposure. The
face value of the currency protection expands or contracts to cover
changes in the foreign currency value of the underlying asset. Quanto
options are traded on stock indexes on several exchanges as well as
in the OTC equity market.
The payoff to a U.S. investor for an option linked to the Nikkei
index is
= p(sLyen) max(S:K.. ($/ E share) kyen/ share) — X (*yen/share) 0)
= p(sLyen) max(;11. P($ / share) E X kyen/ share) — S ven/share)' 0)
Valuation of quanto options was originally introduced by Derman,
Karasinski, and Wecker (1990) and was later extended and discussed
by Reiner (1992), Dravid, Richardson, and Sun (1993), and others.
Option Value in Domestic Currency (i.e., USD)
C = E p[S* efr f —r— q— Pcrs""E)T N (di) — X * e— rT N (d2)1 (5.39)
p = E p[X * ( d2) — S * efrf —r—q—Pcrs*°E)T N( —d1)1 (5.40)5.16. CURRENCY-TRANSLATED OPTIONS 229
Option Value in Foreign Currency (i.e., JPY)
C= E* Ep[refr f —r—q —Pas*adT N (di) — X *e—rT N(d2)1 (5.41)
efrf—r—q—pers*crE)T N(—di)J *e—rT p = E* E p[X d2) — S* (5.42)
where
ln(S* I X*)-1- (r f — q — po-s*o-E o- s 2* 12)T
di =
d2 = di —
S* = Underlying asset price in foreign currency.
X* = Delivery price in foreign currency.
r =Domestic interest rate.
r f = Foreign interest rate.
q = Instantaneous proportional dividend payout rate
of the underlying asset.
Ep = Predetermined exchange rate specified in units of domestic
currency per unit of foreign currency.
E* = Spot exchange rate specified in units of foreign
currency per unit of domestic currency.
as* = Volatility of the underlying asset.
crE = Volatility of the domestic exchange rate.
p = Correlation between asset and domestic exchange rate.
Note that if the exchange rate had been specified in, for example, yen
per dollar, the sign of p would be reversed: P(Nikkei,)'en/$) = — P(Nikkei,$/yen)•
Example
Consider a fixed exchange rate foreign equity call option with six
months to expiration. The stock index is 100, the strike is 105, the
predetermined exchange rate is 1.5, the domestic interest rate is 8%
per year, the foreign interest rate is 5% per year, the average dividend
yield is 4% per year, the volatility of the stock index is 20%, the volatil-
ity of the currency is 10% per year, and the correlation between the
stock index and the currency rate is 0.3, S* = 100, X* = 105, T = - 0.5,
Ep = 1.5, r =0.08, r f = 0.05, q = 0.04, cr,; = 0.2, crE = 0.1, and p = 0.3.
What is the value in domestic currency?
In(100/105) + (0.05 —0.04 — 0.3 x 0.2 x 0.1 + 0.2 2/2)0.5
— = 0.2601
d2 = d1 — 0.2,0:= —0.4016230 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
N(d1) --= N (-0.2601)=0.3974, N(d2)= N (- 0.4016)=0.3440
c- 1.5[100eM.05-0.08-0.04-0.3 x0.2x0.1)0.5N(d1)
_ 105e -0.08x0.5 N(d2)] = 5.3280
Computer algorithm
The code returns the value of a call or put quanto option quoted in
domestic currency.
Function Quanto(CallPutFlag As String, Ep As Double, S As Double, _
X As Double, T As Double, r As Double, rf As Double, q As Double, _
vS As Double, vE As Double, rho As Double) As Double
Dim dl As Double, d2 As Double
dl = (Log(S/X) + (rf - q - rho * vS * vE + vSA2 / 2) * T) / (vS * Sqr(T))
d2 = dl - vS * Sqr(T)
If CallPutFlag = "e" Then
Qaanto = Ep * (S * Ekp((rf - r - q - rho * vS * vE) * T) * CND(d1) _
- X * METio(-r * T) * CND(d2))
ElseIf CallPutFlag = "p" Then
Qaanto = Ep * (X * * T) * NIX-d2) _
- S * IXp((rf - r - q - rho * vS * vE) * T) * CND-d1))
End If
End Function
## 5.16.3 Equity Linked Foreign Exchange Options
In an equity linked foreign exchange option, the quantity of the face
value is linked to the level of the forward price of a stock or equity
index. This is an ideal option for an investor who wants to speculate
directly in a foreign equity market but wishes to place a floor on the
currency exposure.
The payoff to a U.S. investor for an option linked to the Nikkei
index is
c($1share) = 5. ven Ishare) max(E ($IYen)— X ($1yen) ,
P($1 share) = S (* yen Ishare) ma" ($1yen) E ($1 yen)'
Valuation of these options has been described by Reiner (1992).
Option Value in Domestic Currency (i.e., USD)
c = Es*e-qTN(ci i) — xs*e(rf -r -q -Pas*cjE )T N(d2) (5.43)
p = XS* efr —r— q —Pas*aE)T — ES *e—qT N (—di) (5.44)5.16. CURRENCY-TRANSLATED OPTIONS 231
Option Value in Foreign Currency (i.e., JPY)
c = S*e—QT — E *XS *efri—r— g—Pas"E)T N(d2)
p = E* XS *e(rf —r—q —Pas*aE)T — S*e—qT N (—di) (5.46)
(5.45)
where
d
ln(E I X) + (r — r f + pas*aE ±ail2)T
i —
d2 = — (TEVY
S* = Underlying asset price in foreign currency.
X = Currency strike price in domestic currency.
r =Domestic interest rate.
rf = Foreign interest rate.
q = Instantaneous proportional dividend payout rate
of the underlying asset.
E = Spot exchange rate specified in units of the domestic
currency per unit of the foreign currency.
E* = Spot exchange rate specified in units of the foreign
currency per unit of the domestic currency.
as* =Volatility of the underlying asset.
o-E =- Volatility of the domestic exchange rate.
p = Correlation between asset and the domestic exchange rate.
Example
Consider an equity linked foreign exchange put option with three
months to expiration. The stock index is 100, the exchange rate is
1.5, the strike is 1.52, the domestic interest rate is 8% per year, the
foreign interest rate is 5% per year, the dividend yield is 4% per year,
the volatility of the stock index is 20%, the volatility of the currency
is 12% per year, and the correlation between the stock index and the
currency rate is —0.4. S* = 100, E = 1.5, X = 1.52, T = 0.25, r =0.08,
r f = 0.05, q = 0.04, o-: 5' = 0.2, o-E = 0.12, and p = —0.4. What is the
value in domestic currency?
ln(1.5/1.52) + (0.08 — 0.05 — 0.4 x 0.2 x 0.12 + 0.12 2/2)0.25
= = 0.1057
0.12N/0.25
d2 = — 0.12N/F iCS = —0.1657
N(—d1) = N(0.1057) =- 0.5421 N(—d2) = N(0.1657) = 0.5658232 CHAPTER 5. EXOTIC OPTIONS ON TWO ASSETS
p = 1.52 x 100e(0.05-0.08-0.04+0.4 x0.2 x0.12)0 25
• • N(-d)
- 1.50 x 100e-0.04x0.25
N(-di)= 4.2089
## 5.16.4 Takeover Foreign Exchange Options
A takeover foreign exchange call gives the buyer the right to buy N
units of a foreign currency at the strike price X if and only if the
corporate takeover is successful. A successful takeover is defined as
having occurred when the value of the foreign firm V in the foreign
currency is less than or equal to the number of currency units B at
the option expiration. The value of this option can be found by using
the Schnabel and Wei (1994) formula:
c = N[Ee-rf T M(a2+ °Elf , -al - PaEff; -P)
- Xe -rT M(-ai, a2; (5.47)
where
In( V At) (r — Pa EaV — 0' 13 /2)T
ai =
0-V
ln(E/X)± (r - r1 - cri12)T
a2 =
a E
Both the strike price X and the currency price E are quoted in units
of the domestic currency per unit of the foreign currency.
5.17 GREEKS FOR TWO-ASSET OPTIONS
To calculate option sensitivities for options on two assets, some ana-
lytical partial derivatives are given in some of the papers referred to
in this chapter. Alternatively one can use numerical approximations.
Any numeric Greek of interest for two-asset options can be calcu-
lated using the approach described in Chapter 2. In addition to the
Greeks mentioned in that chapter, traders involved in options on two
or more assets often consider cross-Greeks, like cross-gamma asai2acs2 ,
o2„ a2c. a2c.
cross-vanna as",a',2 or as2a,, , cross-vomma cross-zomma as
or a3c and cross-speed a23' or '92'` . All such cross-Greeks can
as2aa, 2 • asi as2 as2as1
be calculated by the mixed numerical Greeks given in Chapter 2. The
accompanying CD implements all of these and more, using numerical
approximations. The included code also implements the ability to plot
the Greeks in three dimensions.CHAPTER
6
6 BLACK-SCHOLES-MERTON
ADJUSTMENTS AND
ALTERNATWES
Life is just one damn trade after another.
Trader
A model is only a simplified representation of an aspect of the
real world. Models are typically developed by starting out with very
simple representations that are later generalized to accommodate
more detail. In this chapter we loosen up many of the assumptions
originally made by Black and Scholes, and Merton back in 1973, and
consider how it affects the option value. We first consider small adjust-
ments of the Black-Scholes-Merton (BSM) formula, that take into
account the following aspects:
• Delayed settlement
• Trading-day volatility versus calendar day volatility
• Discrete time hedging
• Transaction cost
• Trending markets
We will subsequently move on to alternative models that take into
account non-normal distributed returns such as:
• Generalized constant elasticity of variance
• Skewness and Kurtosis
• Merton's jump-diffusion model
• Bates' generalized jump-diffusion model
• The Hull-White 1987 stochastic volatility model
• The Hull-White 1988 stochastic volatility model
• SABR 2001 stochastic volatility model
233234 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
6.1 THE BLACK-SCHOLES-MERTON MODEL WITH
DELAYED SETTLEMENT
The original BSM formula assumes one pays for the option imme-
diately or at least the same day as one buys the option—immediate
settlement. In practice, this is often not the case. In many markets
like foreign exchange or for OTC bond options, one typically pays (gets
paid) two to three days after entering into the agreement to buy (sell).
This leads to a simple adjustment that can be economically significant
in some market situations:
c = eriti e—r2T2,, ebT
N(C/1) XN(d2)] (6.1)
p = er e—r2T2 [XN(—d2)— Se bT N(—di)1 (6.2)
ln(SI X)+ (b a 2/2)T
c
where t1 is the time in years until payment for the option (t1 <= T).
T2 is the time in years until settlement of the option's payoff if in-
the-money at maturity (T2 > T). T is, as usual, the option's number
of years until maturity. Taking into account delays of settlement can
be important in circumstances where the short-term rate is very high
compared to long-term rates. Setting ti = 0, T2 = T, and ri = r2 yields
the standard BSM formula, with instant settlement.
Example
Consider a call option with a strike price of 120 and six months to
expiration. Settlement is two days, and the underlying stock trades
at 130 and has a volatility of 12%. The short continuous zero coupon
rate with two days to maturity is 50%, while the rate until expiration
settlement is 10%. Also, the rate to option expiration is 10%. With
S = 130, X = 120, t1 = 2/365 = 0.0055, T2 = 0.5 + 2/365 = 0.5055, T =
0.5, ri = 0.5, r2 = 0.1, b = 0.1, and a = 0.12 we get
In(130/120) ± (0.1 ± 0.12 2/2)0.5
= = 1.5750
d2 = 1.5209 — 0.12, = 1.4901
N(c/i) = N(1.5750) = 0.9424 N(d2) = N(1.4901) = 0.9319
c = e0.5 x 0.0055 e-0.1 x 0.5055 [1 30e0.1 x0.5
N(di )
The value of 16.1688 compares to 16.1334 using the standard BSM
formula. For a large position, this difference can represent a nontrivial
amount of money.
120N(d2)] = 16.16886.2. THE BLACK-SCHOLES-MERTON MODEL 235
6.2 THE BLACK-SCHOLES-MERTON MODEL
ADJUSTED FOR TRADING DAY VOLATILITY
The formula of French (1984) takes into consideration that volatility
is usually higher on trading days than on nontrading days. 1
= smdi - Xe —rT N(d2) (6.3)
p = Xe—rT N(—d2)— SN(—di) (6.4)
where
ln(SI X) ± rT a2t 12
di =
a .1i
ln(SI X) ± rT — a 2t 12
d2= = di — a,/t
Trading days until maturity
t =
Trading days per year
and
T
Calendar days until maturity
=
Calendar days per year
Example
Consider a European put option with 146 calendar days and 104 trad-
ing days to expiration, and assume there are 365 calendar days and
253 trading days per year. The stock price is 70, the strike price is 75,
the risk-free interest rate is 8% per year, and the volatility is 30% per
year. S = 70, X = 75, T = 0.4(146/365), t = 0.4111(104/253), r =0.08,
and a = 0.3. Thus:
d =
ln(70/75) + 0.08 x 0.4 + 0.32 x 0.4111/2
0.0962 = 1
0.3,/0.4111
d2 = — 0.3,/0.4111 = —0.2885
N(—d1) - -= N(0.0962) = 0.5383 N(—d2) = N(0.2885) = 0.6135
p _ 75- 0.08x0.4N(_ d2) _ 70N(—d1) = 6.8836
iThis has been supported by several empirical studies, for example, French (1980),
Gibbons and Hess (1981), and French and Roll (1986).236 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
6.3 DISCRETE HEDGING
The main idea of Black, Scholes, and Merton was that by holding
an option and continuously delta hedging it, one removes all of the
portfolio's market risk. The expected return on the portfolio should
therefore be equal to the risk-free rate. It is not possible, however,
to delta hedge in continuous time. 2 In the case of discrete-time delta
hedging, one has to be careful, as the BSM risk-neutral valuation
argument no longer holds. We will here look at some insights into
how discrete-time hedging causes hedging errors, and how to value
and optimally hedge options with discrete-time hedging.
## 6.3.1 Hedging Error
A discrete-time hedge is imperfect and, consequently, the dynamic
portfolio is no longer risk-free. Derman and Kamal (1999) have pub-
lished a couple of useful formulas that give an idea of some of the
effects from discrete-time hedging. They assume geometric Brownian
motion and delta hedging using the BSM delta updated at discrete,
evenly spaced time intervals. The standard deviation of the final profit
and loss (P&L) given N number of rebalances during the option's
lifetime is given by the following approximation:
°P&L
n-
- jr Se(b—r)T n(cli)V T = Vega
4 vN 4 VN
(6.5)
where Vega is the sensitivity with respect to changes in volatility.
If the option is approximately at-the-money forward (SebT = X), the
expression can be simplified. In that case, the option value is approx-
imately linear with respect to changes in volatility. We can then
express the standard deviation in P&L in percent of the initial option
premium as
op&L \r , 1
(6.6)
4 4N
where c is the initial option price. The right-hand side of this equation
now depends only on the number of rebalances. The formulas above
assume constant volatility, while in practice one observes stochastic
volatility. With this in mind, the formulas above can be seen as a
lower boundary for the standard deviation in P&L for an option being
hedged in the market. Notice, moreover, that one typically does not
2Even if one did manage to update the portfolio continuously in time, the trading
activity would incur infinite transactions costs.6.3. DISCRETE HEDGING 237
rebalance the hedge at even intervals. The decision to rebalance is
typically based on the values of the option's delta and gamma. A higher
gamma generally necessitates more frequent rebalancing.
Example
Consider a futures option with three months to expiration. The stock
price is 60, the strike price is 60, the risk-free interest rate is 6%
per year, and the volatility is 30% per year. Assuming we rebalance
the hedge 20 times, what is the standard deviation in P&L? S = 60,
X = 60, T = 0.25, r =0.06, b = 0, a = 0.3, and N = 20. Given these
parameters, the vega of the option is
ln(60/60) ± (0.3 2/2)0.25
di = = 0.0750
0.3,/0.25
n(di) --= n(0.0750) = 0.3978
0- 0.06)0.25 vega 60e 0006025 0.3978-%/0.25 = 11.7570
The standard deviation in terms of dollars is then given by
0.3
— x 11.7570x =0.6990
../Y)
The one standard deviation in our expected profit and loss is thus
±0.6990 dollars. This is independent of a call or a put option.
Without going through the calculations, we can say the call or put
option3 value with these parameters is 3.5337. This gives us a stan-
dard deviation in percent of option value of 0.6990/3.5337 = 19.78%.
We could alternatively have calculated this using formula (6.6):
aP&L
4 x 20
- 19.82%
As pointed out earlier, stochastic volatility, jumps, and other real
market effects will in general increase the standard deviation of the
profit and loss from the discrete hedge.
## 6.3.2 Discrete-Time Option Valuation and
Delta Hedging
We have seen how discrete-time hedging causes hedging errors.
Although there is no way we can eliminate all risk for discrete-time
hedging in the BSM economy, we can find a better hedge than the
cfP&L
3From Chapter 1 we know an option in the Black-Scholes-Merton world where
SebT = X must have value symmetry—that is, the same value for call and put options.238 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
BSM delta. One intuitive criteria is that the hedge should minimize
the variance of profit/loss over the next time step At . By identifying
the delta that satisfies this criterion, we will also be able to find the
fair price of the option contract, taking into account discrete hedging.
Assuming hedging takes place at regular times At apart, Wilmott
(2000) shows that the optimal delta is
Ao
82c
t = — At( — r a
2
/2)S p ion as
as2
(6.7)
This expression shows that the optimal delta consists of the standard
delta plus a correction term multiplied by the option's standard
a2c,
gamma -d7 5, . An important point to notice is that the delta now depends
also on the expected growth rate of the asset A. It is therefore clear
that the idea of risk-neutral valuation does not hold for discrete-time
hedging. If it is large, the discrete-time delta can be significantly
different from the standard risk-neutral BSM delta.
Based on the optimal delta, Wilmott (2000) shows how we can still
value the option with the BSM formula, but now with an adjusted
volatility equal to
At
= a (1 ± (1,1,
2a2
r)(r — — a
2
)
)
(6.8)
Again, the expected growth rate of the asset turns up.
Example
Consider an option that we delta hedge once a week. Assume the
expected volatility of the asset is 50%, the risk-free rate is 5%, and
the expected growth rate of the stock is 20%. What is the volatility we
should use in the BSM formula to value the option? At = 311, a = 0.5,
r =0.05, and it =- - 0.2 yields
I
er = a ( 1+ 2 x.52 (0.2 — 0.05)(0.05 — 0.2 — 0.52) = 49.88%
An adjustment of 0.12 percentage points to the volatility may seem
trivial. In a competitive options market, this may still be of economic
consequence.
6.3.3 Discrete-Time Hedging with Transaction Cost
Leland (1985) looks at how hedging with transactions costs affects the
BSM formula, assuming the hedge is rebalanced at evenly spaced time6.3. DISCRETE HEDGING 239
intervals At apart. He moreover assumes that transactions cost are
proportional to the value of the transaction in the underlying shares.
Ifn shares are bought (n > 0) or sold (n < 0), then the transaction cost
is K inIS, where K is some positive constant. Leland finds that a long
option can be valued with the BSM formula but now with an adjusted
volatility of
1
K .1 2
along = ( 1
8
0" 7 At )
and in the case of short options the volatility adjustment is
K a 1
ashort = a 1 2 (1 + —
a 7 At
It is worth mentioning that the approach of Leland (1985) holds
only for plain vanilla calls and puts. It does in general not hold for
option portfolios or exotic options. Further, Kabanov and Safarian
(1997) shows that the Leland approach has several problems in the
case of a constant level of transaction costs. See also Grandits and
Schachinger (2001).
Hoggard, Whalley, and Wilmott (1994) look at discrete hedging
for more general cases. See also Wilmott (2000) for more details on
transaction costs and derivatives valuation.
Example
Assume the transaction costs are 0.1% of the stock value, that we
rebalance the hedge daily, and that the expected volatility of the stock
is 30%. What volatility should be used to price plain vanilla options?
With a=-- 0.3, K =0.001, and At = th, the volatility we should use for
long options is
2 )
1
= 28.43%,
= 31.49%
0.001
0.3
8
along = (1 , 0.3 ,.
"
while for short options we should use
365
.
0 001
0.3 1
8 ) 2
ashort = +
0.3 7
(
—
1
365
These volatilities are then to be used as input in the BSM formula.
(6.9)
(6.10)240 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
6.4 OPTION PRICING IN TRENDING MARKETS
Many different and complex price processes fit into the category of
"trending" or "predictable" markets. Lo and Wang (1995) look at the
special case of a trending Ornstein-Uhlenbeck process that implies
serially correlated asset returns.
Lo and Wang shows how to adjust the BSM formula to take into
account the trending market:
c se(b—r)T N a ) _ Xe —rT N (d2) (6.11)
p = Xe—rT N(—d2)— Se (b—r)T N (6.12)
where
ln(S I X) ± (b & 212)T
di =
a if
d2 = di —
a2 ln(1 +2p)
At (1 +2p) 1/At —1
The adjustment for autocorrelation in the returns is done through
the input volatility, er , where a is the unconditional volatility esti-
mate and p e , 01 is the first-order autocorrelation over the holding
period At which in turn is measured in units of the holding period.
Since p is restricted to the interval —0.5 to zero, the adjustment works
for negative autocorrelation. The adjustment for drift in the volatil-
ity is related to the fact that volatility has to be estimated based on
discretely sampled data, while the BSM model is based on continuous
delta hedging. Even if the true continuous volatility was constant, as
first assumed by Black and Scholes, the sampling error from any esti-
mate will be related to two sources: the discreteness of the sampling
interval and misspecifications of the drift. As we increase the sam-
pling interval, both of these sources of sampling error will diminish.
As the holding period At goes to zero, the autocorrelation effect on the
volatility approaches zero.
An increase in the absolute value of the autocorrelation will always
increase the adjusted, volatility. For this reason, it should not come as
a surprise that the options sensitivity to autocorrelation is also related
to the vega from the BSM formula. An increase in the absolute value
of autocorrelation always increases the option value, as the vega is
always positive and since we consider only negative autocorrelation.
This holds for the trending Ornstein-Uhlenbeck process as well as for
other types of trending processes.
and
=6.4. OPTION PRICING IN TRENDING MARKETS 241
TABLE 6-1
Call Option Values under a Trending Ornstein-Uhlenbeck
Process
(S = 100, a = 0.3, r = 0.08, b = 0.08, At = 1)
BSM p = -0.05 p = - 0.1 p --0.2 p = -0.3 p - 0.4 p - 0.45
Time to Maturity 7 days
80 20.1226 20.1226 20.1226 20.1226 20.1227 20.1227 20.1232
90 10.1443 10.1459 10.1481 10.1554 10.1710 10.2149 10.2814
100 1.7338 1.7776 1.8269 1.9491 2.1240 2.4262 2.7259
110 0.0181 0.0219 0.0268 0.0421 0.0718 0.1464 0.2490
120 0.0000 0.0000 0.0000 0.0001 0.0003 0.0019 0.0072
Time to Maturity 182 days
80 24.0808 24.1728 24.2807 24.5655 25.0132 25.8767 26.8203
90 16.3942 16.5585 16.7461 17.2193 17.9159 19.1585 20.4257
100 10.3714 10.5856 10.8271 11.4255 12.2834 13.7661 15.2361
110 6.1206 6.3416 6 5912 7.2101 8.0993 9.6399 11.1704
120 3.3945 3.5860 3.8044 4.3549 5.1645 6.6068 8.0758
Time to Maturity 365 days
80 28.2411 28.4046 28.5938 29.0822 29.8248 31.2010 32.6510
90 21.3720 21.6088 21.8783 22.5553 23.5454 25.2968 27.0673
100 15.7113 16.0018 16.3296 17.1423 18.3087 20.3258 22.3244
110 11.2596 11.5746 11.9295 12.8067 14.0604 16.2177 18.3457
120 7.8966 8.2078 8.5595 9.4331 10.6903 12.8716 15.0392
Table 6-1 shows call option values that are adjusted according to
the above recipe. The column marked BSM is option values calculated
with the Black-Scholes-Merton formula. As we can see from the table,
the values adjusted for autocorrelation are always larger than (or
equal to) the BSM values.
Example
Consider a one-year call option on a stock currently trading at 100.
The volatility is 30%, the risk-free rate is 8%, the strike is 120, and
the one-day autocorrelation is -0.2. What is the option value? With
S = 100, X = 120, T = 1, r 0.08, b = 0.08, and a =0.3 we get
0.32 ln(1 2(-0.2))
= = 0.3390
1 (I ± 2(-0.2)) 10 - 1
We can now calculate the option value:
In(100/120) + (0.08 + 0.33902/2)1
d1 = = -0.1323
0.3390../I242 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
d2 = —0.1323 — 0.3390-T1 = —0.4713
N(d1) = N(-0.1323) = 0.4474, N(d2) = N(-0.4713) = 0.3187
which gives a call option value of
c _ 100e(0.08-0.08)1 N(d1 _ ) 120e8x 1 N(d2 .) = 9.4331
That is, a value of 9.4331 versus only 7.8966 (as seen from Table 6-1)
when not adjusting for autocorrelation. In practice, far more complex
stochastic processes can be causing trends.
6.5 ALTERNATIVE STOCHASTIC PROCESSES
Most option pricing formulas in the literature (including most formu-
las in this book) assume the asset price follows a geometric Brownian
motion. This implies that the asset price is lognormally distributed
and consistent with limited liability for stocks, and that the returns
are normally distributed. This is naturally a simplification of real-
ity. Observed stock return distributions typically have fatter tails
and higher peaks, first pointed out by Mitchell (1915), than what
the lognormal BSM stock price model implies. There are two main
approaches to get around this problem. The first approach is to sim-
ply try to "fudge" the BSM model or its numerical equivalent binomial,
trinomial, or finite difference implementation. This can be achieved
by using different volatilities for every strike and time to maturity.
The second approach is to use more complex and hopefully also more
realistic models for the stock price process.
We will look at four different adjustments:
1. Constant elasticity of variance (CEV)
2. BSM adjusted for excess skewness and kurtosis
3. Jump-diffusions (JD)
4. Stochastic volatility (SV)
In the following sections, I present closed-form option pricing mod-
els for these adjustments. It is, of course, possible to implement the
adjustments using numerical methods for option pricing.
6.6 CONSTANT ELASTICITY OF VARIANCE
The BSM formula assumes volatility is constant for the duration of
the option contract. Empirical evidence from stock markets shows,
however, that the volatility is often negatively correlated with the
stock price level. In other words, volatility tends to increase as the
stock price decreases. Cox (1975) and Cox and Ross (1976) built such± 24 f2-20
(1 _ p)2 ,27,
(6.13)
6.6. CONSTANT ELASTICITY OF VARIANCE 243
an effect into what is known as the constant elasticity of variance
model,
dS = p,Sdt + o SSdz,
where a is the instantaneous volatility of the asset price returns, )5 is
the elasticity parameter, and dz is a Wiener process. Some well-known
special cases for this model obtain for different values off. )5 = 0 gives
a normally distributed asset price. )5 = 0.5 results in a square root
constant elasticity of variance model (SRCEV), equivalent to the Cox,
Ingersoll, and Ross (1985) model without the mean reverting part.
Finally, )5 = 1 yields the BSM stock price model.
CEV for Futures and Forwards
Let's assume the future/forward follows a general constant elasticity
of variance model. See Cox (1975) and Cox and Ross (1976).
dF = a FS dz
Hagan and Woodward (1999) shows how to approximate the value of
options with this price process as underlying assets. Their approach is
to use a Black-equivalent volatility that corresponds to a CEV model:
a [1 4. (1 — #)(2 + #) (F — X 2
P—15 24 f )
C71, =
where ".. ." represents additional "negligible" terms, and f = 1- (F ±
X). This volatility can then simply be used as input in the Black-76
model.
In the special case when the option is at-the-money forward, this
Black-equivalent volatility can be simplified further to (see Haug,
2001c):
a
"a ••-, '
F1-13
Feeding this equivalent volatility into the Brenner and Subrah-
manyam (1988) at-the-money forward approximation yields a gener-
alized CEV approximation for options that are at-the-money forward:
rT
FS0-0.4N/T call = put ',-:,' e—
With this simple expression, we can value at-the-money forward
options with remarkable accuracy. With access to a computer power,
it is, of course, better to use formula (6.13), as it is more accurate.
The at-the-money forward approximation still gives simple access to
some intuition about the behavior of the option value and is useful for
back-of-the-envelope calculations.244 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-2
Constant Elasticity of Variance Call
Option Values
(S = 100, T = 0.25, r = 0.1, p =0.5)
a X =90 X = 95 X = i00 X = 105 X = 110
0.50 9.7531 4.8956 0.9727 0.0224 0.0000
1.00 9.7881 5.2679 1.9453 0.4209 0.0028
2.00 10.5052 6.7612 3.8897 1.9705 0.3330
3.00 11.8414 8.5222 5.8323 3.7838 1.3468
4.00 13.4270 10.3571 7.7721 5.6693 2.7660
5.00 15.1240 12.2200 9.7083 7.5823 4.3931
Table 6-2 shows call option values from the constant elasticity of
variance model with 16 = 0.5, for different choices of strikes X and
volatility a.
6.7 SKEWNESS- KURTOSIS MODELS
We now consider option pricing models that directly adjust the BSM
model to take into account the third and fourth moment of the
distribution-skewness and kurtosis.
## 6.7.1 Definition of Skewness and Kurtosis
The skewness of a series of price data can be measured in terms of
the third moment about the mean. If the distribution is symmetric,
the skewness will be zero.
r ti E =1(xl
Skewness = (6.14)
a3
where is the mean of the observations, a is the standard deviation,
and n is the number of observations. A normal distribution always
has zero skewness, being a symmetric distribution.
The kurtosis describes the relative peakedness of a distribution.
The kurtosis is measured by the fourth moment about the mean.
To make things more confusing, there is more than one definition
of kurtosis. Pearson kurtosis is defined as
E7=i(xl i)4 n
4
Fisher kurtosis, on the other hand, is defined as
Erii=, (xi - .i)4/n 3
a4
(6.15)
(6.16)6.7. SKEWNESS-KURTOSIS MODELS 245
Fisher kurtosis is thus simply Pearson kurtosis minus 3. The nor-
mal distribution has a Pearson kurtosis of 3 (Fischer kurtosis of 0)
and is called mesokurtic. Distributions with Pearson kurtosis larger
than 3 (Fisher higher than 0) are called leptokurtic, indicating higher
peaks and fatter tails than the normal distribution. Pearson kurtosis
smaller than 3 (Fischer lower than 0) is termed playakurtic. Pearson
kurtosis higher than 3 is also called excess kurtosis, or simply "fat
tails." Before calculating skewness and kurtosis from asset prices,
make sure you know if the software you use returns Pearson or Fischer
kurtosis.
## 6.7.2 The Skewness and Kurtosis for a Lognormal
Distribution
The skewness and kurtosis of a lognormal distribution will vary
across different lognormal distributions depending on the volatility
and time horizon. The skewness and kurtosis for different lognormal
distribution can be calculated by the following expressions:
Skewness = 3y + y3
Fischerkurtosis=16y 2 15y4 6y6 ± y8 ,
where
y = jecT2T _
a is the annualized volatility, and T is the time horizon for our anal-
ysis (typically the expiration of a derivative contract). Notice that all
lognormal distributions have a positive skewness. In other words, the
lognormal distribution is always skewed to the right.
Example
What is the skewness and kurtosis for the stock price in a BSM econ-
omy, where the stock price follows a geometric Brownian motion?
Consider a volatility of 30% and a time horizon of three months.
a =0.3, and T = 0.25 yields
y = e0.32 x 0.25 1 = 0.1508
Skewness = 3 x 0.1508 ± 0.15083 = 0.4560
Fischer kurtosis = 16 x 0.1508 2 ± 15 x 0.15084 1-6 x 0.15086 + 0.15088 = 0.3719
The skewness and Fischer kurtosis of the asset returns are still
zero, since the returns are normal' fed when the asset price
is lognormally distributed.246 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
## 6.7.3 Jarrow and Rudd Skewness and Kurtosis Model
The Jarrow and Rudd (1982) model is basically the BSM model
adjusted for skewness and kurtosis that are different from the lognor-
mal distribution. The model thus adjusts for skewness and kurtosis
in the asset price directly (and not in the return distribution):
C cBSM +X1Q3 +X2Q4,
where CBSM are the standard BSM formula. Moreover,
In(S I X) (r a2/2)T
di
aN/T
(6.17)
6 dS
rT (ea2 T 1)2
e—rT d2a(x)
Q4 = (Se
24 dS2
X1 = Y1(F) — Y1(A) X2 = Y2(F) — y2(A)
yi (A) and y2(A) represent the skewness and kurtosis from the lognor-
mal distribution, while yi (F) and y2(F) represent the skewness and
kurtosis from the distribution we want to approximate. 1■4 and A2 are
therefore the excess skewness and kurtosis.
1
a(X) —
Xa,s/T2n-
da(X) a(X)(d2 —
dS Xa N/7
d2a(X) a(X)
x [(d2 — aN/T)2 —a ,./T(d2 —-1]
dS2 X2a2 T
The put can be found by put-call supersymmetry, or by put-call
parity.
Computer algorithm
The computer code for the Jarrow-Rudd skewness-kurtosis model
follows.
Function JarrowRuddSkewKurt(CallPutFlag As String, S As Double, X _
As Double, T As Double, r As Double, b As Double, _
v As Double, Skew As Double, Kurt As Double) As Double
Dim Q3 As Double, Q4 As Double
Dim dl As Double, d2 As Double
Dim CallValue As Double
rT )3 (ea2 T 1)312 e'T da(X)
= —(Se — Q36.7. SKEWNESS-KURTOSIS MODELS 247
Dim aX As Double, daX As Double, daXX As Double
Dim q As Double, GA As Double, gAA As Double
Dim Lambdal As Double, Lambda2 As Double
dl = (Log(S / X) + (b + v^2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
aX = (X * v * Sqr(T * 2 * Pi))^(-1) * Exp(—d2^2 / 2)
daX = aX * (d2 — v * Sqr(T)) / (X * v * Sqr(T))
daXX = aX / (X^2 * v * Sqr(T)) _
* ((d2 — v * Sqr(T))^2 — v * Sqr(T) * (d2 — v * Sqr(T)) — 1)
q = Sqr(Exp(vA2 * T) — 1)
GA = 3 * q + q^3
gAA = 16 * q^2 + 15 * q^4 + 6 * q^6 + q^8 + 3
Lambdal = Skew — GA
Lambda2 = Kurt — gAA
Q3 = —(S * Exp(r * T))^3 _
* (Exp(vA2 * T) — 1) A (3 / 2) * Exp(—r * T) / 6 * daX
Q4 = (S * Exp(r * T))^4 * (Exp(vA2 * T) — 1) A 2 _
* Exp(—r * T) / 24 * daXX
CallValue = (GBlackScholes("c", S, X, T, r, b, v) _
+ Lambdal * Q3 + Lambda2 * Q4)
If CallPutFlag = "c" Then
JarrowRuddSkewKurt = CallValue
Else 'II Use put—call parity to find put value
JarrowRuddSkewKurt = CallValue — S * Exp((b — r) * T)
+ X * Exp(—r * T)
End If
End Function
## 6.7.4 The Corrado and Su Skewness and
Kurtosis Model
Corrado and Su (1996) (including a correction by Brown and Robinson,
2002) has published a model somewhat similar to the Jarrow and
Rudd (1982) model. Corrado and Su extend the BSM model for non-
normal skewness and kurtosis in the stock return distribution rather
than through the stock price. This has the advantage that the para-
meters typically are time-invariant for returns, but not for price levels.
Mathematically, Corrado and Su use a Gram-Charlier series
expansion for the probability density to come up with a closed-form
adjustment to the BSM formula. The expansion results in
C=--- cBSM + /13Q3 + (14 — 3)Q4, (6.18)
where ii,3 is the skewness and ii,4 is the Pearson kurtosis of the asset
returns, Cgsm is the plain vanilla BSM value, and
1
Q3 = —
6
SaNif[(2o-VT — cli)n (di) + o- 2TN(di)1248 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-3
Call and Put Option Values from the
Corrado-Su Skewness-Kurtosis Model
(S = 100, T =0.25, r = 0.07, b =0.07, a =0.35)
=3 fL4 =3.5 44 = 4 44 = 4.5 = 5 /..(4 = 5.5
Put option with strike 75
-0.2 0.2932 0.3354 0.3776 0.4199 0.4621 0.5044
-0.1 0.2696 0.3118 0.3541 0.3963 0.4386 0.4808
0 0.2460 0.2882 0.3305 0.3727 0.4150 0.4572
0.1 0.2224 0.2646 0.3069 0.3491 0.3914 0.4336
0.2 0.1988 0.2410 0.2833 0.3255 0.3678 0.4100
Put option with strike 100
-0.2 6.0317 5.8940 5.7563 5.6186 5.4809 5.3432
-0.1 6.0555 5.9177 5.7800 5.6423 5.5046 5.3669
0 6.0792 5.9415 5.8038 5.6660 5.5283 5.3906
0.1 6.1029 5.9652 5.8275 5.6898 5.5521 5.4143
0.2 6.1266 5.9889 5.8512 5.7135 5.5758 5.4381
Call option with strike 100
-0.2 7.7665 7.6288 7.4911 7.3534 7.2157 7.0780
-0.1 7.7902 7.6525 7.5148 7.3771 7.2394 7.1017
0 7.8139 7.6762 7.5385 7.4008 7.2631 7.1254
0.1 7.8376 7.6999 7.5622 7.4245 7.2868 7.1491
0.2 7.8614 7.7237 7.5859 7.4482 7.3105 7.1728
Call option with strike 125
-0.2 0.9543 1.0226 1.0910 1.1593 1.2277 1.2961
-0.1 1.0481 1.1165 1.1848 1.2532 1.3215 1.3899
0 1.1419 1.2103 1.2786 1.3470 1.4154 1.4837
0.1 1.2357 1.3041 1.3725 1.4408 1.5092 1.5776
0.2 1.3296 1.3979 1.4663 1.5347 1.6030 1.6714
1
Q4 = -
24
Sa N/T' Rd? - 1 - 3a ,/7' d2)n(di) + a3 T312 N (di)]
d2 = di -
Table 6-3 gives call and put values from the Corrado-Su model for
different choices of skewness and kurtosis.
Example
Consider a European call option on a stock with three months to expi-
ration. The current stock price is 100, the strike price is 125, the
risk-free rate is 7%, the volatility is 35%, the skewness is 0.1, and
the Pearson kurtosis is 5.5 of the expected returns. Hence, S = 100,6.7. SKEWNESS-KURTOSIS MODELS 249
X = 125, T = 0.25, r =- - 0.07, b =- 0.07, a =0.35, ,u3 = 0.1, ,24 = 5.5,
which yields
ln(100/125) ± (0.07 ± 0.35 2/2)0.25
= —1.0876
0.35,/0.25
d2 =d1 —0.35J0.25 = —1.2626
n(di) = n(-1.0876) = 0.2208
N(di ) = N(-1.0876) = 0.1384
1
Q3 = g x 100 x 0.350.25[(2 x 0.350.25 — di)n(di)± 0•352 x 0.25N (di)1= 0.9383
Qa = 2 - 4100x 0.35'N/0.25[(df —1-3 x 0.35'.10.25d2)n(d1) ± 0.35 3 x 0.25312N(di)] = 0.1367
Moreover, the Black-Scholes value is cBsivi(c,100,125,0.25,0.07,
0.07,0.35) = 1.1419, which gives us the skewness and kurtosis
adjusted call value of
c = 1.1419 + 0.1 x Q3 ± (5.5— 3)Q4 = 1.5776
Skewness and kurtosis can evidently have significant impact on the
option value, in this case, 1.5776 versus only 1.1419 for the BSM
formula.
Computer algorithm
The computer code for the Corrado-Su skewness-kurtosis model
follows.
Function SkewKurtCorradoSu( CallPutFlag As String, S As Double, X _
As Double, T As Double, r As Double, b As Double, _
✓ As Double, Skew As Double, Kurt As Double) As Double
Dim Q3 As Double, Q4 As Double
Dim dl As Double, d2 As Double
Dim CallValue As Double
dl = (Log(S / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
Q4 = 1 / 24 * S * v * Sqr(T) * ((d1^2 — 1 — 3 * v * Sqr(T) * d2)
* ND(d1) + vA3 * TA1.5 * CND(di ))
Q3 = 1 / 6 * S * v * Sqr(T) * ((2 * v * Sqr(T) — dl) _
* ND(d1) + vA2 * T * CND(d1))
CallValue = GBlackScholes("c" , S, X, T, r, b, v) _
+ Skew * Q3 + (Kurt — 3) * Q4
If CallPutFlag = "c" Then
SkewKurtCorradoSu = CallValue
Else '// Use put—call parity to find put value
SkewKurtCorradoSu = CallValue — S * Exp((b — r) * T) —
di250 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
+ X * Exp( — r * T)
End If
End Function
Example: SkewKurtCorradoSu("c",100 , 125, 0.25, 0.07, 0.07, 0.35, 0.1, 5.5) will return a
call option value of 1.5776.
## 6.7.5 Modified Corrado-Su Skewness-Kurtosis Model
For an option model to be arbitrage-free, it must satisfy a martingale
restriction (see, for instance, Longstaff, 1995). Jurczenko, Maillet, and
Negrea (2004) show that the Corrado-Su formula does not satisfy the
martingale restriction and modify it accordingly. This gives the call
value
C =-- cBsw k(3Q3 (i1,4 – 3)Q4, (6.19)
where ,u3 is the skewness, 1a4 is the Pearson kurtosis of the asset
returns, CBSM is the plain vanilla BSM value, and
Q3 = I Sa -s/T(2047 — d)n (d)
6(1 + w)
1
Q4 =
24(1+
Sa (d2 – 3do47 3a2T – 1)n(d)
w)
d =
ln(S/X) (b a2/2)T — ln(1+ w)
a if
w = —
P3
o-
3
T
3/2
+ — kt4 o-
4
T2,
6 24
where, as before, n(.) is the normal density function, ,u3 is the
skewness, and /./.4 is the Pearson kurtosis of the return distribution.
The put value can be found by put-call supersymmetry or put-call
parity.
Table 6-4 gives call and put values from the modified Corrado-Su
model for different choices of skewness and kurtosis.
Computer algorithm
The computer code for the modified Corrado-Su skewness-kurtosis
model follows.
Function SkewKurtCorradoSuModified(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, _
v As Double, Skew As Double, Kurt As Double) As Double
Dim Q3 As Double, Q4 As Double6.7. SKEWNESS-KURTOSIS MODELS 251
TABLE 6-4
Call and Put Option Values from the
Modified Corrado-Su Skewness-Kurtosis
Model
(s = 100, T = 0.25, r =0.07, b = 0.07, ti = 0.35)
11,3 1L4 = 3 it4 = 3.5 L4 = 4 pt4 = 4.5 pt4 5 it4 = 5.5
Put option with strike 75
-0.2 0.3104 0.3508 0.3911 0.4315 0.4719 0.5122
-0.1 0.2782 0.3186 0.3589 0.3993 0.4396 0.4800
0 0.2460 0.2863 0.3267 0.3670 0.4074 0.4477
0.1 0.2137 0.2541 0.2944 0.3347 0.3751 0.4154
0.2 0.1814 0.2218 0.2621 0.3024 0.3427 0.3831
Put option with strike 100
-0.2 6.0421 5.9032 5.7644 5.6255 5.4867 5.3478
-0.1 6.0606 5.9217 5.7829 5.6440 5.5052 5.3664
0 6.0792 5.9403 5.8015 5.6627 5.5238 5.3850
0.1 6.0979 5.9591 5.8202 5.6814 5.5426 5.4038
0.2 6.1167 5.9779 5.8391 5.7003 5.5615 5.4227
Call option with strike 100
-0.2 7.7769 7.6380 7.4992 7.3603 7.2215 7.0826
-0.1 7.7953 7.6565 7.5177 7.3788 7.2400 7.1011
0 7.8139 7.6751 7.5363 7.3974 7.2586 7.1198
0.1 7.8327 7.6938 7.5550 7.4162 7.2774 7.1386
0.2 7.8515 7.7127 7.5739 7.4351 7.2963 7.1574
Call option with strike 125
-0.2 0.9567 1.0248 1.0929 1.1610 1.2292 1.2974
-0.1 1.0493 1.1175 1.1856 1.2538 1.3221 1.3903
0 1.1419 1.2101 1.2784 1.3466 1.4149 1.4833
0.1 1.2344 1.3027 1.3710 1.4394 1.5077 1.5761
0.2 1.3269 1.3953 1.4636 1.5320 1.6005 1.6689
Dim d As Double, w As Double
Dim CallValue As Double
w = Skew / 6 * vA3 * TA 1.5 + Kurt / 24 * vA4 * TA2
d = (Log(S / X) + (b + vA2 / 2) * T - Log(1 + w)) / (v * Sqr(T))
Q3 = 1 / (6 * (1 + w)) * S * v * Sqr(T) * (2 * v * Sqr(T) - d) * ND(d)
Q4 = 1 / (24 * 1 + w) * S * v * Sqr(T) _
* (dA2 - 3 * d *v * Sqr(T) +3 * vA2 * T - 1) * ND(d)
CallValue = GBlackScholes( "c" , S, X, T, r, b, v) + Skew * Q3 + (Kurt - 3
If CallPutFlag = "c" Then
SkewKurtCorradoSuModified = CallValue
Else '// Use put-call parity to find put value
SkewKurtCorradoSuModified = CallValue - S * Exp((b - r) * T) _
+ X * Exp(-r * T)
End If
End Function252 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
Example: SkewKurtCorradoSuModzfied("c", 100, 125, 0.25, 0.07, 0.07, 0.35, 0.1, 5.5) will
return a call option value of 1.5761.
## 6.7.6 Skewness-Kurtosis Put-Call Supersymmetry
Haug (2002) extends the standard supersymmetry introduced in
Chapter 1 to also hold between puts and calls with skewness and
kurtosis taken into account:
c(S, X, T. r, b, a, 113, /14) = —p(S, X, T, r, b, —a, — 124) (6.20)
and naturally also
P(S, X. T, r, b, a, /23, /14) = —c(S, X, T, r, b, —a, — /23, /24), (6.21)
where ,u3 is the skewness and itzt is the kurtosis. This result holds
for Edgeworth and Gram-Charlie expansions of the BSM formula, as
well as for many discrete implementations.
## 6.7.7 Skewness-Kurtosis Equivalent
Black-Scholes-Merton Volatility
Backus, Foresi, and Wu (1997) show how one can adjust the volatility
in a BSM model to take skewness and kurtosis into account:
a [1
/23
di
—3
24(1 4)] , (6.22)
6
where
ln(S I X) ± (b a2/2)T
=
To value the option simply input the skewness and kurtosis
adjusted volatility & into the BSM formula. The adjustment seems
to be quite consistent with the Corrado and Su (1996) model as long
as the option is at-the-money forward (or at least close to at-the-money
forward). For out-of-the-money options, this approach does not seem
very accurate.
## 6.7.8 Gram Charlier Density
Knight and Satchell (2001) show how to turn the normal density
function --e-x2/2 into a density function that takes into account
non-normal skewness and kurtosis:
n,(x) = e_x2/2 (i it3 (x3 3x) ± — 3 (x4 — 6x2 ± 3)) , (6.23)
,/Yr 6 24
where /13 is the skewness and itzt is the Pearson kurtosis.
a ,56.9. JUMP-DIFFUSION MODELS 253
## 6.7.9 Skewness-Kurtosis Trees
I present a binomial model in Chapter 7 that takes skewness and
kurtosis into account.
6.8 PASCAL DISTRIBUTION AND OPTION PRICING
To incorporate fat tails in the distribution, Ray (1993) suggests switch-
ing from normal distributed returns to the Pascal distribution. The
probability density of the Pascal distribution is given by
e-lxl/P
f (x) =
2,6
P = f Ix'f (x)dx,
where x is the change in price and p is the mean absolute deviation
of change in price (MAD). The value of a call and put option is then
given by
C = e
-rT±(F-X)IP P
2
p e-rT +(X- F)II3 P
2 '
where F is the forward price of the underlying asset. Ray (1993)
offers little explanation of what type of stochastic process results in
this distribution. She considers multiple examples where the Pas-
cal distribution fits historical bond yields better than the normal
distribution.
6.9 JUMP-DIFFUSION MODELS
Observed asset prices do not move continuously in time. A reasonable
model is therefore to let prices make discrete jumps from time to time.
Since jumps can have important effects on the option value, we will
look at two of the better known jump-diffusion models described in
the literature.
6.9.1 The Merton Jump-Diffusion Model
An example of such a model is the Merton (1976) jump-diffusion
model. The model assumes that the underlying asset price follows
the jump-diffusion process:
dS = (b - Ak)Sdt + a Sdz + kdq,
(6.24)
(6.25)254 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
where dz is a Brownian motion as before, while dq is the jump com-
ponent. The two stochastic processes dz and dq are assumed to be
uncorrelated. The model now requires two additional parameters to
be estimated, over and above the BSM model: the expected number of
jumps per year A and the percentage of the total volatility explained
by jumps y. Merton then shows that
e—XT (XT ) 1
c = E . c,(s, X, T, r, o-,) (6.26)
t!
c)°
=
e—XT (XT) i
P E i!
p,(S, X, T, r, at),
i =0
(6.27)
where
= z2 82 (iin
yv 2
8= Z = Vv2— A.82
Where v is the total volatility including jumps. Merton (1976) assumes
that the jump risk can be fully diversified by holding a stock portfolio,
that some stocks will always jump in opposite direction, and that the
jump risk in this way is nonsystematic.
Any of the option Greeks can be found by simply replacing the
ci (S, X, T, r, cr,) or pi (S, X, T, r, ai) option formula in (6.26) or (6.27)
with the any of the BSM Greek formulas given in Chapter 2.
Computer algorithm
Function JumpDiffusionMerton(CallPutFlag As String, S As Double,
X As Double, T As Double, r As Double, v As Double, _
lambda As Double, gamma As Double) As Double
Dim delta As Double, Sum As Double
Dim Z As Double, vi As Double
Dim i As Integer
delta = Sqr(gamma * vA2 / lambda)
Z = Sqr(vA2 — lambda * delta ^2)
Sum = 0
For i = 0 To 50
vi = Sqr(ZA2 + delta^2 * ( i / T))
Sum = Sum + Exp(-1ambda*T)*( lambda * T)^ i / Application . Fact ( ) _
* GBlackScholes(CallPutFlag , S, X, T, r, r, vi )
Next
JumpDiffusionMerton = Sum
i=0
End Function6.9. JUMP-DIFFUSION MODELS 255
TABLE 6-5
Merton-76 Jump-Diffusion Call Values
(S = 100, a =0.25, r =0.08)
Strike
= 1
Time to Maturity
= 5
Time to Maturity
X=10
Time to Maturity
0.1 0.25 0.5 0.1 0.25 0.5 0.1 0.25 0.5
80 20.67 21.74 23.63 20.65 21.70 23.61 20.64 21.70 23.61
90 11.00 12.74 15.40 10.98 12.75 15.42 10.98 12.75 15.42
0.25 100 3.42 5.88 8.95 3.51 5.96 9.02 3.53 5.97 9.03
110 0.55 2.11 4.67 0.56 2.16 4.73 0.56 2.17 4.74
120 0.10 0.64 2.23 0.06 0.63 2.25 0.05 0.62 2.25
80 20.72 21.83 23.71 20.66 21.73 23.63 20.65 21.71 23.62
90 11.04 12.72 15.34 11.02 12.76 15.41 11.00 12.75 15.41
0.50 100 3.14 5.58 8.71 3.39 5.87 8.96 3.46 5.93 9.00
110 0.53 1.93 4.42 0.58 2.11 4.67 0.57 2.15 4.71
120 0.19 0.71 2.15 0.10 0.66 2.23 0.07 0.64 2.24
80 20.79 21.96 23.86 20.68 21.78 23.67 20.66 21.74 23.64
90 11.11 12.75 15.30 11.09 12.78 15.39 11.04 12.76 15.41
0.75 100 2.70 5.08 8.24 3.16 5.71 8.85 3.33 5.85 8.95
110 0.54 1.69 3.99 0.62 2.05 4.57 0.60 2.11 4.66
120 0.29 0.84 2.09 0.15 0.71 2.22 0.11 0.67 2.23
where CND() is the cumulative normal distribution function and the function
GBlackScholes() is the generalized BSM function.
Example: JumpDiffusion("c", 45, 55, 0.25, 0.1, 0.25, 3, 0.4) returns a call value of 0.2417.
Table 6-5 shows call option values from the Merton jump-diffusion
model. Values are tabulated with different values for the option's
gamma y, strike, number of jumps per year A, and time to maturity.
6.9.2 Bates Generalized Jump-Diffusion Model
In the footsteps of the Merton-76 model, Bates (1991) published
a more general jump-diffusion mode1. 4 His work differs from the
Merton (1976), Ball and Torous (1983), and Ball and Torous (1985)
jump-diffusion models in several important ways:
• Jumps are allowed to be asymmetric-in other words, with
nonzero mean.
4For more on option pricing under the assumptions of jump diffusion, see also Ball
and Torous (1983), Ball and Torous (1985), Aase (1988), and Amin (1993).256 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
• Since we often have to deal with options on stock index futures
(e.g., S&P index options), it is hardly plausible to maintain
Merton's simplifying assumption that jump risk is idiosyncratic
and thus fully diversifiable.
The Bates (1991) jump-diffusion model is consistent with an asym-
metric volatility smile (generated from a BSM-type model). This is
often what we observe in practice.
Bates assumes that consumers have time-separable power util-
ity and that optimally invested wealth follows a jump-diffusion. He
moreover assumes jump risk is systematic: all asset prices and wealth
jump simultaneously, possibly by different amounts. This seems to be
much closer to reality than the Merton (1976) model, especially for
stock index options during a market crash. Bates (1991) prescribes
the following jump-diffusion process under a risk-neutral probability
measure:
dS = (b - ),,k)Sdt ± a Sdz kdq
The process resembles geometric Brownian motion most of the time,
but on average A times per year, the price jumps discretely by a random
amount.
S = Asset.
b = Cost-of-carry.
a = Volatility of the relative price change based on no jumps.
k =Random percentage jump conditional upon a Poisson-
distributed event occurring, where 1 + k is lognormal
distributed.
=Expected jump size.
A = Frequency of Poisson events.
q = Poisson counter with intensity A.
From this process, Bates develops the following formulas for
European call and put options:
C = E . ci (s, X, T, r, b, , a,) (6.28)
!
cc
=
e-AT tAn i
P E ." t!
pi (S , X, T, r, bi, at),
i=0
(6.29)
where
i=0
b =b - +
cyi6.9. JUMP-DIFFUSION MODELS 257
where = 111(1 + k) and 8 is the standard deviation of log asset price
jumps. Input of the expected jump size k greater (smaller) than zero
implies that the distribution is positively (negatively) skewed relative
to geometric Brownian motion. The option formula is in the form of
an infinite sum. One can show that it converges rather fast.
Any of the Bates jump-diffusion option Greeks can be found by
replacing the BSM formula c1 (S, X, T, r, b, ai) in (6.28) or (6.29) with
any of the BSM Greeks, but with the same input parameters. VBA
code for the Bates jump-diffusion and all its Greeks are included on
the accompanying CD.
From the model, we can also find several interesting implicit
parameters like implied total annual volatility.
v = 1a2 + A(:2 + 82),
where j; = — 82/2. From this we can easily compare jump-diffusion
values with BSM values. Moreover, the skewness (third moment)
and Pearson kurtosis (fourth moment) of this jump-diffusion model
is given by
Skewness —
v3
Kurtosis = 3 ±
Au4 6222 3B4)T-1
v4
An alternative way to value options under a jump-diffusion pro-
cess is to approximate the jump-diffusion value using the skewness
and kurtosis adjusted BSM model described earlier in this chapter.
It is evident from the above expressions that the kurtosis and skew-
ness we get from a jump-diffusion model can be quite large though,
especially for options with short time to maturity. The Edgeworth
and Gram-Charlier expansion methods presented above have limited
ability to match distributions with high kurtosis and large skewness.
This can easily be tested by using the skewness and kurtosis from the
jump-diffusion process as input to the skewness-kurtosis models. We
will then often see that the skewness-kurtosis models have problems
matching the jump-diffusion model.
Table 6-6 shows call option values from the Bates jump-diffusion
model. Values are tabulated with different values for the option's delta
8, strike, number of jumps per year A, and time to maturity.
Computer algorithm
VBA code for the Bates generalized jump-diffusion model follows.
Ap(p2 ± 382)T-7
Function JumpDiffusionBates(CallPutFlag As String, S As Double, X As Double, _258 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-6
Bates-91 Jump-Diffusion Call Values
(S = 100, a = 0.25, r = 0.08, k = -0.04)
Strike
= 1
Time to Maturity
A =5
Time to Maturity
A=10
Time to Maturity
0.1 0.25 0.5 0.1 0.25 0.5 0.1 0.25 0.5
80 20.67 21.81 23.86 20.83 22.32 24.85 21.05 22.97 25.88
90 11.12 13.06 15.88 11.68 14.13 17.50 12.30 15.28 19.08
0.10 100 3.77 6.38 9.61 4.59 7.77 11.60 5.49 9.23 13.55
110 0.67 2.48 5.29 1.14 3.67 7.25 1.75 5.04 9.28
120 0.07 0.78 2.67 0.22 1.52 4.30 0.46 2.51 6.16
80 20.95 22.45 24.97 22.11 25.12 29.48 23.46 27.95 33.58
90 11.57 14.00 17.44 13.69 18.03 23.42 15.88 21.78 28.41
0.25 100 4.27 7.46 11.40 6.88 12.25 18.34 9.61 16.63 23.97
110 1.10 3.49 7.07 3.17 8.05 14.21 5.57 12.53 20.20
120 0.37 1.58 4.25 1.74 5.31 10.97 3.49 9.43 17.01
80 21.66 24.08 27.84 25.31 31.66 39.68 29.16 38.58 48.67
90 12.41 15.93 20.83 17.45 25.62 34.99 22.52 33.83 45.11
0.50 100 5.18 9.55 15.11 10.93 20.48 30.89 16.78 29.85 41.92
110 1.99 5.59 10.88 7.25 16.52 27.35 12.87 26.10 39.06
120 1.21 3.60 8.00 5.64 13.69 24.35 10.60 23.15 36.49
T As Double, r As Double, b As Double, v As Double, _
lambda As Double, avgk As Double, delta As Double ) As Double
Dim Sum As Double, game( As Double, gambar As Double
Dim bi As Double, vi As Double
Dim i As Integer
gam() = Log( 1 + avgk )
Sum = 0
For i = 0 To 50
bi = b - lambda * avgk + gam() * ( i / T)
vi = Sqr(vA2 + delta^2 * ( i / T))
Sum = Sum + Exp(-lambda * T) * (lambda * T)^ i / Application . Fact( i) _
* GBlackScholes(CallPutFlag , S, X, T, r, bi , vi )
Next
JumpDiffusionBates = Sum
End Function
6.10 STOCHASTIC VOLATILITY MODELS
Observed volatility is not constant but rather contains some deter-
ministic part and some stochastic parts. We now look at a couple6.10. STOCHASTIC VOLATILITY MODELS 259
of stochastic volatility models, meaning that the volatility itself is
modeled as a stochastic process.
## 6.10.1 Hull-White Uncorrelated Stochastic
Volatility Model
Hull and White (1987) discuss option valuation under stochastic
volatility for the special case where the volatility is uncorrelated with
the asset price. Assume the asset price and the instantaneous vari-
ance V = a2 follow the following stochastic processes in a risk neutral
world:
dS = bStdt +aStdz
dV --=aV +4Vdw,
where the drift of the variance a and the volatility of the variance
do not depend on S. Moreover, dz and dw are independent Wiener
processes, meaning that the asset price and volatility are uncorre-
lated. b is the cost-of-carry of the asset as before. Hull and White
(1987) show that the option value is then simply given as an integral
over the BSM formula, over the distribution of the mean volatility:
cHwr = f c(17)12(1, 1at2)dfl (6.30)
where 17 is the mean variance over the lifetime of the option,
- 1 f T
V = — cr2(t)dt,
T
and c(17) is the BSM formula, here written in the notation of variance
instead of standard deviation:
c( -') = sA(d i ) - Xe -rT N(d2)
ln(SIX)± (b +1212)T
d2= d1- -VVT
Although it does not seem possible to find a simple closed-form
solution for the option price, it is still possible to find relatively simple
formulas for the moments of V (see Hull and White, 1987). When
it A 0:
_ epf _ 1
E[V] = Vo
pT
2e(2412)T 2 1 ±
pT2 (2p, + 42
eptT
V2 E[V2] = [ p + 42)] 0 '
d1=260 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
and if it --= 0 we have
E[V] = V0
The second moment (the variance of the variance) is as follows.
- 2 2(eeT — 2T — 1) 2
E[V 1 = Vo , 4T,2
and the third moment (skewness) is
e34.2T _ 9eeT ± 6eT ± 8 3
vo E[1731 = 307-3
In the case of sufficiently small values of , Hull and White (1987)
indicate that a Taylor series converges quickly and in this case can be
used to approximate the option value. In the case of it = 0, we get a
call value of
1 a2 c(7) (2,4 (ek _ k _ 1) 4 1 a3 c(V)
cHwuSV cBSM (Cr ) ± _ x CT ±
2 av2 k2 6 av3
X CT
(
6 e3k— (9 + 18k)ek ± 8+ 24k + 18k2 + 6k3
3k3
(6.31)
where k = 2T and
826.(7) _ seo—r)TA/7
8172 — 4,3 n(d1)(dId2 — 1)
83 c(17) Se(b—r)T A/7 = n(di)Rdid2 — 1)(d id2 — 3) — (df +4)1
8173 8a5
The value of a put option we can simply find by using put-call
parity:
PHW87 = cHW87 — Se (b—r)T ± Xe—rT
Computer algorithm
Here is a computer algorithm of the Hull and White (1987) stochastic
volatility model. The algorithm is fast and efficient even in VBA, as
the model is a closed-form approximation.
Function Hul1White87SV(CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, _
v As Double, Vvol As Double) As Double6.10. STOCHASTIC VOLATILITY MODELS 261
'II v: intitial volatility I standard deviation
'II VVol: volatility of volatility
'II rho: correlation between asset price and volatility
Dim dl As Double, d2 As Double, k As Double
Dim CallValue As Double, cgbs As Double, ek As Double
Dim cW As Double, cVVV As Double
k = VvolA2 * T
ek = Exp(k)
dl = (Log(S / X) + (b + vA2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
cgbs = GBlackScholes("c", S, X, T, r, b, v)
'I/Partial derivatives
cVV = S * Exp((b — r) * T) * Sqr(T) *ND(d1) _
* (dl * d2 — 1) / (4 * v A3)
cVVV = S * Exp((b — r) * T) * Sqr(T) *ND(d1) _
• ((dl * d2 — 1) * (dl * d2 — 3) — (d1"2 + d2A2)) / (8 * vA5)
CallValue = cgbs + 1 / 2 * cW * (2 * vA4 * (ek — k — 1) / 102 — vA4) _
+ 1 / 6 * cVVV * vA6 * (ek A 3 — (9 + 18 * k) * ek + 8 _
+ 24 * k + 18 * kA2 + 6 * kA3) / (3 * kA3)
If CallPutFlag = "c" Then
Hul1White87SV = CallValue
ElseIf CallPutFlag = "p" Then 'II Use put call parity to find put
Hul1White87SV = CallValue — S * Exp((b — r) * T) + X * Exp(—r * T)
End If
End Function
## 6.10.2 Hull-White Correlated Stochastic
Volatility Model
Hull and White (1988) develop a closed-form approximation for Euro-
pean option values under stochastic volatility. Unlike the Hull and
White (1987) model, their 1988 model opens up for volatility to be
instantaneously correlated to the asset price. More precisely, they
assume a square-root stochastic volatility process
dS = fiSdt S-Vi7dz
dV = (a + OV)dt
where V is the stochastic variance of the underlying asset, 4 is the
volatility of the volatility (standard deviation of N/V), and a and p are
constants that determine the drift of the variance. To ensure that V
remains positive, a >0. When a > 0 and p < 0, this is a mean revert-
ing stochastic volatility process is the mean reversion level of V,
with speed of mean reversion -p. dz and dw are two correlated Wienern(d1)(d1d2—
al72 4173/2
03c(7) seo— oT
asav2 = 4172 n(d1)(—di4 + +242)
= v ± a) e6 —1 a
)
a2c(17) = se(b—OT nwo d2
asav 2V
02c(V) Se(b—r)T ,./7
262 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
processes, thus making it possible for the volatility to be correlated
with the asset price.
The time required for the expected deviation to be halved, the half-
life, is given by Hi, = -1(2) or alternatively we can find the /3 given
the half-life /3 = - in(2)
The mean reversion level of the variance is '
given by 17 =-aI13. Assuming we know the mean reversion level of
the variance V, we can naturally solve for the constant a: a =- MV.
Hull and White (1988) are able to come up with a closed-form
approximation (series solution) for plain vanilla European calls under
stochastic volatility cHwas:
cm4,88 fo + fish + f2e (6.32)
where, in the case /3 0 0
fo = c(v)
a2c( 7)
fi = P + fiV)(1— e 6 + 3e6) + a(1+ 3 — e6)]
I33 T asafi
e a2c(17)
+
02 a2c( 7) 03 a3c(7) 04 a3c(7)
J2 = T asaf, T2 a172 + T2 asa172 T3
where5
01
02
03c( 7) se(b—r)T A5,
+ 3)11
± 3))
P2
=
= 201+
3) _ 0512 n(di)Rdid2-1)(did2— — (d? +
(32
{(a ± I3V)[e° — 8+1) —1]+ a[e6 (2 — 8)— (2
1
c ±(e26 4e6 23 — ((a + I3V)(e 26 —28e 6 —1) — — +
2/34 2
5In their 1987 model no mixed derivatives are used. The reason is that Hull and White
here assume zero correlation between spot and variance. In their 1988 extension they
add correlation, and now mixed derivatives are necessary6.10. STOCHASTIC VOLATILITY MODELS 263
P
2
03 = [(a
2136
+,f3V)(e 8 — 3e8 — 1) — a(1± 3 — e8)12
04 = 203
ln(S I X) ± (b ± V 'I2)T
d1 —
-e.1- / -
d2=d1— A/17T,
and 3 = 13 T, V = a2. In the special case when /3 = 0 we get
aT
V = V ± T
aT ) T 82c(v)
f 1 = p (v +
3 2 aso7
and
01= p2 (1/ + a4 T )T63
02 = (2+
1
) 01
P
(
aT \ 2 T4
03 = P2 V ± )
---
04 = 203
When the volatility is constant 17 = V, we get the BSM formula. The
value of a put option can be found from the put-call parity
PHW88 = c'HW88 — Se (b—r)T + Xe—rT
Comments
The Hull and White (1988) is a great model to play around with to get
some intuition on how stochastic volatility can affect option values.
The closed-form approximation is not used much in practice, however,
as there are several limits to what values of parameters it accepts.
Moreover it is not a very robust approximation, and for some input
parameters, the model can even return negative option values.
Table 6-7 reports call and put values generated by the Hull and
White (1988) stochastic volatility model. The values with strike below
100 are put options, and the values with strike above 100 are call
options. In the case of strike 100, call options and put options will
have the same value due to put-call parity. Table 6-8 shows how these
values are reflected in implied BSM volatilities. We can easily see
the impact on correlation between the volatility and the asset price
showing up in the BSM volatility smile.264 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-7
Hull and White (1988) Stochastic Volatility Model Option
Values
(s = 100,T = 0.25, r = 0.08, b = 0,a(i= V= 0.09, 12 = 0.0625, HL = 0.1, = 0.5)
Put Values Call =Put Call Values
X = 70 X = 80 X = 90 X = 100 X = 110 X = 120 X = 130
-0.75 0.0904 0.4942 1.8559 5.2591 1.6192 0.2705 0.0110
-0.50 0.0646 0.4278 1.7809 5.2765 1.7568 0.4039 0.0678
-0.25 0.0436 0.3596 1.6982 5.2921 1.8874 0.5323 0.1298
0.00 0.0273 0.2895 1.6078 5.3061 2.0110 0.6559 0.1968
0.25 0.0158 0.2175 1.5098 5.3183 2.1274 0.7745 0.2690
0.50 0.0090 0.1436 1.4040 5.3289 2.2368 0.8881 0.3463
0.75 0.0069 0.0678 1.2906 5.3378 2.3391 0.9968 0.4287
Computer algorithm
Here is a computer algorithm of the Hull and White (1988) stochastic
volatility model. As the model is a closed-form approximation, it is
fast and efficient even in VBA.
Function Hul1White88SV( CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, sig0 As Double, sigLR As Double,
HL As Double, Vvol As Double, rho As Double ) As Double
'11 sig0 : initial volatility
'II sigLR: the long run mean reversion level of volatility
'11 HL: half-life of volatility deviation
'11 VVol : volatility of volatility
'11 rho : correlation between asset price and volatility
Dim phil As Double, phi2 As Double, phi3 As Double, phi4 As Double
Dim f0 As Double, fl As Double, f2 As Double
Dim dl As Double, d2 As Double
Dim cSV As Double, cVV As Double, cSVV As Double, cVVV As Double
Dim ed As Double, delta As Double, Beta As Double, a As Double
Dim v As Double, Vbar As Double, CallValue As Double
Beta = -Log(2) / HL 'II Find constant, beta, from Half Life
a = -Beta * sigLRA2 'II Find constant, a, from long run volatility
delta = Beta * T
ed = Exp( delta )
v = sig0
If Abs(Beta) < 0.0001 Then
Vbar = v + 0.5 * a * T '/ / Average expected variance
Else
' I I Average expected variance :
Vbar = (v + a / Beta) * (ed - 1) / delta - a / Beta
End If
dl = (Log( S / X) + (b + Vbar / 2) * T) / Sqr(Vbar * T)6.10. STOCHASTIC VOLATILITY MODELS 265
d2 = dl — Sqr(Vbar * T)
'I I Partial derivatives
cSV = —S * Exp((b — r) * T) *ND(d1) * d2 / (2 * Vbar)
cVV = S * Exp((b — r) * T) *ND(d1) * Sqr(T) _
/ (4 * Vbar^1.5) * (dl * d2 — 1)
cSVV = S * Exp((b — r) * T) / (4 * VbarA2) *ND(d1) * _
(—dl * d2^2 + dl + 2 * d2)
cVVV = S * Exp((b — r) * T) *ND(d1) * Sqr(T) / (8 * Vbar^2.5) _
* ((dl * d2 — 1) * (dl * d2 — 3) — (d1^2 + d2 ^ 2))
If Abs(Beta) < 0.0001 Then
fl = rho * (a *T /3 + v) *T /2 * cSV
phil = rho^2 * (a * T / 4 + v) * TA3 / 6
phi2 = (2 + 1 / rho^2) * phil
phi3 = rho^2 * (a * T / 3 + v)^2 * TALI / 8
phi4 = 2 * phi3
Else '// Beta different from zero
phil = rho^2 / Bete,' * ((a + Beta * v) _
* (ed * (delta^2 / 2 — delta + 1) — 1) _
+ a * (ed * (2 — delta) — (2 + delta)))
phi2 = 2 * phil + 1 / (2 * Beta^4) * ((a + Beta * v) _
* (ed^2 — 2 * delta * ed — 1) _
— a / 2 * (ed^2 — 4 * ed + 2 * delta + 3))
phi3 = rho^2 / (2 * Beta^6) * ((a + Beta * v) _
* (ed — delta * ed — 1) — a * (1 + delta — ed))^2
phi4 = 2 * phi3
fl = rho / (Beta^3 * T) * ((a + Beta * v) * (1 — ed + delta * ed) _
+ a * (1 + delta — ed)) * cSV
End If
f0 = S * Exp((b — r) * T) * CND(d1) — X * Exp(—r * T) * CND(d2)
f2 = phil / T * cSV + phi2 / TA2 * cVV _
+ phi3 / TA2 * cSVV + phi4 / TA3 * cVVV
CallValue = f0 + fl * Vvol + f2 * VvolA2
If CallPutFlag = "c" Then
Hul1White88SV = CallValue
ElseIf CallPutFlag = "p" Then 'II Use put call parity to find put
Hul1White88SV = CallValue — S * Exp((b — r) * T) + X * Exp(—r * T)
End If
End Function
## 6.10.3 The SABR Model
The SABR model (Stochastic, a, /3, p model) published by Hagan,
Kumar, Lesniewski, and Woodward (2002) is an interesting model
from an option trader's perspective. The Black-76 model has for years
been the benchmark model for most European options on currency,
interest rates, and stock indices, as well as on commodity and energy
futures. The main drawback of the Black-76 (Black-Scholes-Merton)
model has been the assumption of constant volatility, or at best a deter-
ministic time varying volatility. Traders have naturally been aware266 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-8
Hull and White (1988) Stochastic Volatility Model in Form
of Black-Scholes-Merton Implied Volatilities
(s = 100, T =0.25, r =0.08, b =0, a(j = V = 0.09, 177 = 0.0625, HL, = 0.1, = 0.5)
X =70 X = 80 X = 90 X = 100 X = 110 X = 120 X = 130
- 0.75 34.00% 31.61% 29.12% 26.92% 24.81% 22.56% 19.34%
-0.50 32.41% 30.55% 28.59% 27.01% 25.71% 24.62% 23.99%
-0.25 30.76% 29.36% 28.00% 27.09% 26.54% 26.30% 26.42%
0.00 29.05% 28.01% 27.35% 27.16% 27.32% 27.74% 28.31%
0.25 27.32% 26.43% 26.63% 27.22% 28.04% 29.00% 29.95%
0.50 25.78% 24.46% 25.84% 27.28% 28.71% 30.14% 31.45%
0.75 25.14% 21.63% 24.98% 27.32% 29.33% 31.17% 32.86%
of this weakness and have been adjusting the BSM formula by using
different volatilities for every strike and maturity, which is reflected
in the market as a volatility smile. The SABR model is an extension
of the Black-76 model to include an easily implementable stochastic
volatility model. The SABR model is a two-factor model:
dF = a F13 dz
da = adw,
where F is the future/forward price, $ is a constant deciding the dis-
tribution of the asset price, a is the volatility of the forward price, and
4. is the volatility of the volatility. dz and dw are two correlated Wiener
processes. Using a singular perturbation technique, Hagan, Kumar,
Lesniewski, and Woodward (2002) obtain an analytical solution for an
input volatility as a function of the current forward price. The ana-
lytical input volatility can then be plugged directly into the Black-76
formula. The Black-76 equivalent volatility is given by
ae =
(FX)(1- )/2 (1 ± (1 2V2 1n(F/X)2 1 (F/ X)4)
x (z)
_ /5)2 a2 1 pif3ot 2 - 3 p2
(6.33) x [1+
(FX)1-13
+
4 (FX)(1-13)12
+ T ,
24 24
where
z = -(FX) (1-8)12 ln(F I X)
a
x (z) = in
( N/1 - 2 pz + z2 +z - p)
- p6.10. STOCHASTIC VOLATILITY MODELS 267
In the case where the option is at-the-money forward (F = X), the
formula above reduces to
a ( 0 fi)2 a2 1 pa 2 - 3p2 2) T
aBATA! = F1-- 24 F2-2 4- 4 24
Special Cases
In the special case of 13 = 1, formula (6.33) can be simplified to
z
a B = a
x(z)
)[1 + pa + yr 4 (2 - 3p2)e) T -4- —1,
where x (z) is as before and
z = -ln(F/X)
a
In the special case where /3 = 0, formula (6.33) can be simplified to
ln(F I X) z
a2 2 _ 3p2 2
aB = a F - X x(z) j[' 4- (24FX
+
24
T + . .1.
where x (z) is as before and
= -
a
v FX1n(F I X)
Calibration
The beta parameter will typically be chosen a priori according to how
the traders prefer to observe their market prices. For example, in the
FX markets it is standard to assume lognormal terms, ,t3 = 1,while in
some fixed-income markets traders prefer to assume normal terms,
/3 = 0.
To calibrate the model, one will typically want the SABR equivalent
Black-76 volatility to match the at-the-money volatility in the market.
This involves calibrating the a based on the at-the-money volatility.
As discussed in detail by West (2005a), it is important to recognize that
the a is not the same as the at-the-money implied Black-76 volatility.
Assuming the at-the-money Black-76 volatility is crat,,, West (2005a)
shows that a is the root of the cubic of
(1 - fi)2 T 3 pfiuT 2 2 - 3p2 2
a + T - aatm F = 0,
24F2-2# 4F1--fi
a + 1 +
24
where we assume we already have solved for p and v. For typical
inputs, this cubic has only one root. It is, however, possible for it to
have as many as three roots, in which case we can use the small-.
est positive root. We want a fast and efficient algorithm to find the268 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
root. West (2005a) suggests the Viete method (from 1916) for this
job, using the implementation in Press, Teukolsky, Vetterling, and
Flannery (1992). Any decent root finding algorithm will do though.
The correlation between asset prices and volatility can be cali-
brated to be consistent with the current volatility smile, or chosen
by the trader based on his or her view of the market.
Application
Even if this model is relatively new, it is already in use by traders to
manage and hedge option portfolios. For options with very short time
to maturity, the volatility of volatility often has to be set to extreme
levels to fit commonly observed volatility smiles. In that case, a model
combining jumps with stochastic volatility would probably fit better.
Computer algorithm
The computer code below consists of several functions. SABRVolatility(.)
returns the Black-76 equivalent SABR volatility. alphaSABRO and
CRoot(-) are used to calibrate the a to the at-the-money Black-76
market volatility.
Function SABRVolatility(F As Double, X As Double, T As Double, _
ATMvol As Double, Beta As Double, _
VolVol As Double, rho As Double) As Double
SABRVolatility = alphaSABR(F, X, T, FindAlpha(F, X, T, ATMvol,
Beta, VolVol , rho), Beta, VolVol , rho)
End Function
Function alphaSABR(F As Double, X As Double, T As Double, Alpha As Double, _
Beta As Double, VolVol As Double, rho As Double) As Double
'the SABR skew vol function
Dim dSABR(1 To 3) As Double
Dim sabrz As Double, y As Double
dSABR(1) = Alpha / ((F * X)^((1 — Beta) / 2) * (1 + (((1 — Beta)^2) / 24) _
* (Log(F / X)^2) + ((I — Beta)^4 / 1920) * (Log(F / X)^4)))
If Abs(F — X) > 10A-8 Then
sabrz = (VolVol / Alpha) * (F * X)^((1 — Beta) / 2) * Log(F / X)
y = (Sqr(1 — 2 * rho * sabrz + sabrzA2) + sabrz — rho) / (1 — rho)
If Abs(y — 1) < 10A-8 Then
dSABR(2) = 1
ElseIf y > 0 Then
dSABR(2) = sabrz / Log(y)
Else
dSABR( 2 ) = 1
End If
Else6.10. STOCHASTIC VOLATILITY MODELS 269
dSABR(2) = 1
End If
cLSABR(3) = 1 + ((((1 — Beta)^2 / 24) * AlphaA2 / ((F * X)^(1 — Beta))) _
+ 0.25 * rho * Beta * VolVol * Alpha / ((F * X)^((1 — Beta) / 2)) _
+ (2 — 3 * rho^2) * V01V01A2 / 24) * T
alphaSABR = cLSABR( 1) * cLSABR( 2 ) * cLSABR( 3 )
End Function
Function FindAlpha(F As Double, X As Double, T As Double, ATMvol As Double, _
Beta As Double, VolVol As Double, rho As Double) As Double
'alpha is a function of atmvol etc.
FindAlpha = CRoot((1 — Beta)^2 * T / (24 * FA(2 — 2 * Beta)), _
0.25 * rho * VolVol * Beta * T / FA(1 — Beta), 1_
+ (2 — 3 * rho^2) / 24 * Vo1Vo1A2 * T, —ATMvol * FA(1 — Beta))
End Function
Function CRoot( cubic As Double, quadratic As Double, _
linear As Double, constant As Double) As Double
'finds the smallest positive root of the input cubic polynomial
'algorithm from Numerical Recipes
Dim roots(1 To 3) As Double
Dim a As Double, b As Double, C As Double
Dim r As Double, Q As Double
Dim capA As Double, capB As Double, theta As Double
a = quadratic / cubic
b = linear / cubic
C = constant / cubic
Q = (a^2 — 3 * b) / 9
r = (2 * a^3 — 9 * a * b +27 *C) / 54
If rA2 — QA3 >= 0 Then
capA = —Sgn(r) * (Abs(r) + Sqr(rA2 — QA3))^(1 / 3)
If capA = 0 Then capB = 0 Else capB = Q / capA
CRoot = capA + capB — a / 3
Else
theta = ArcCos(r / Q^1.5)
' The three roots;
roots(1) = —2 * Sqr(Q) * Cos(theta / 3) — a / 3
roots(2) = —2 * Sqr(Q) * Cos(theta / 3 + 2.0943951023932) — a / 3
roots (3) = —2 * Sqr(Q) * Cos( theta / 3 — 2.0943951023932) — a / 3
'locate that one which is the smallest positive root
'assumes there is such a root (true for SABR model)
'there is always a small positive root
If roots(1) > 0 Then
CRoot = roots(1)270 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
ElseIf roots (2) > 0 Then
CRoot = roots (2)
ElseIf roots (3) > 0 Then
CRoot = roots (3)
End If
If roots (2) > 0 And roots (2) < CRoot Then
CRoot = roots (2)
End If
If roots (3) > 0 And roots (3) < CRoot Then
CRoot = roots (3)
End If
End If
End Function
Function AreCos(y As Double ) As Double
AreCos = Atn(-y / Sqr(-y * y + 1)) + 2 * Atn(1)
End Function
Table 6-9 shows volatilities generated by the SABR model for vary-
ing correlations between the asset price and volatility. As expected, a
negative correlation yields a negatively sloped volatility skew, while
a positive correlation yields a positive skew. The a in the model is
calibrated to the at-the-money volatility.
Example
Consider a European put option on a forward with forward price at
100. The strike is 70, time to maturity is six months, and the risk-free
rate is 5%. Assume the a is found to be 30%, the volatility of the
volatility is 50%, and the correlation between the volatility and the
underlying asset is -0.4. What is the value of the option assuming
a lognormal stochastic volatility model (8 = 1)? F = 100, X = 70, T =
0.5, r =0.05, a =0.3, = 0.5, p = -0.4.
TABLE 6-9
SABR Black-76 Equivalent Volatilities
(S = 100, T =0.5, °atm = 30%, /3 = 0.999, 4 = 50%)
X = 70 X = 80 X = 90 X = 100 X = 110 X = 120 X = 130
-0.75 36.68% 34.18% 31.97% 30.00% 28.26% 26.74% 25.46%
-0.50 35.17% 33.11% 31.40% 30.00% 28.90% 28.07% 27.51%
-0.25 33.51% 31.95% 30.80% 30.00% 29.52% 29.31% 29.30%
0.00 31.65% 30.68% 30.16% 30.00% 30.13% 30.46% 30.92%
0.25 29.55% 29.29% 29.48% 30.00% 30.71% 31.54% 32.41%
0.50 27.09% 27.74% 28.78% 30.00% 31.28% 32.55% 33.78%
0.75 24.04% 25.98% 28.03% 30.00% 31.83% 33.51% 35.05%6.11. VARIANCE AND VOLATILITY SWAPS 271
First, we calculate the SABR Black-76 equivalent volatility:
0.5
z = —(100 x 70) (1-1)121n(100/70) = 0.5945
0.3
(V1 -2 x (-0.4) x 0.5945 + 0.59452 + 0.5945 - (-0.4))
x(z) = x(0.5945) = in = 0.5166
1 - (-0.4)
cri3 0.3 (0.5945 _
x(z) )1_ 4 ( 0.4) x 0.3 x 0.5 + —(2 - 3(-0.4) 2)0.52) 0.5] = 0.3454
24
Next, we simply plug this volatility into the Black-76 formula:
ln(100/75) + 0.5 x 0.34542/2
= = 1.5827
0.3454,/
d2 = 1.5827 - = 1.3385
N(-d1) = N(-1.5827) = 0.0567, N(-d2) = N(-1.3385) = 0.0904
p = e-0.05x0.5 [70N(_
6.11 VARIANCE AND VOLATILITY SWAPS
Variance and volatility swaps are excellent derivatives for hedging
and speculation on the realized volatility levels of an asset, as well
as for trading the spread between realized and implied volatility. In
the equity market there is a relatively liquid market for OTC variance
swaps. In the interbank currency market, most investment banks and
larger commercial banks are quoting volatility swaps. We will take a
quick look at how to value both variance and volatility swaps.
## 6.11.1 Variance Swaps
A variance swap offers a payoff at maturity equal to the difference
between the realized variance over the swap period and the contract
variance, multiplied by a notional. To hedge a variance swap with
plain vanilla options, we want to keep exposure to variance invariant
to the level of the spot—spot-independent variance vega. From the
BSM formula we know that the variance vega of a plain European
option is given by6
(b
Variance vega = Se - r ) Tn(di)
2a
6See Chapter 2 for more details on variance vega.
d2) - 100N(-d1)] = 0.6352272 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
From this formula it is apparent that the variance vega of a plain
option can be highly sensitive to changes in spot, and that we cannot
hedge a variance swap with an option with a single strike. What we
need is an option portfolio that gives us a portfolio variance vega that
is independent of the spot level. Based on this idea, Carr and Madan
(1998) and Demeterifi, Derman, Kamal, and Zou (1999) have come up
with a hedge and a fair variance, X var, for a variance swap:
2 _, S erT in(31s) XVar = (r T —
T
S'1 1
+ erT fo p(x)dX + erT _ x2c(x)dX , (6.34)
where is an asset price level typically selected to be equal to current
spot, or alternatively at-the-money forward SbT. This can be regarded
as the market's expectation of future realized volatilities. The vari-
ance swap can be hedged by a short forward contract and a portfolio
of options all expiring at the same time as the variance-swap T:
• A short position in 1 forward contracts struck at ,§
• A long position in — I put options with strike X, for all strikes x2
from 0 to
• A long position in I call options with strike X, for all strikes
from to infinite
Even if equation (6.34) and its hedge involves the BSM formula,
it actually holds also in the presence of a volatility smile or skew.
Unfortunately, the perfect hedge requires a portfolio of options with
an infinite number of strikes (from zero to oo), which is not practi-
cally possible. In reality, we have only a few strikes to select from.
Demeterifi, Derman, Kamal, and Zou (1999) describe a practical
approximation for replicating a variance swap using a limited number
of options. Rewriting equation (6.34), we have
2
XVar =
(rT _ erT 4
- 1 — In(./S)) + erT ncP, (6.35)
7 s
where flcp is the value of the portfolio of options with payoff at
expiration equal to
2 (ST_
f(sT)– ln(ST
T 3
Suppose you can trade call options with strikes Xi x such that
X0,c S < xi < X2,, < X3... <X, and put options with strikes6.11. VARIANCE AND VOLATILITY SWAPS 273
X such that X0,p = > X i, > X2,,, > X3,... Xn,p. The weights
given to each strike in the replicating portfolio is given by
n—I
f(Xn+1,c) — f (xn,c)
wc(xn,c) = Ewc(X)
Xn+1,c — Xn,c
i=0
n-1
f(xn+i,p) —
wp(xn,p) —
Ewp (Xi,p)
Xn,p — Xn+1,p i=0
We can now simply find the value of the portfolio as
nr np -1
nCP Ewp(Xi,p)PBSM(S, Xi,p)± E wc(xi,c),Bsm(s,
1=0 i=0
where n, is number of call options used and np is number of put options
used. The best way to understand how to calculate the fair value of
the variance swap is by taking a look at the example below together
with the Excel spreadsheet on the accompanying CD.
Example
Assume we want to value a variance swap with three months to matu-
rity on a stock currently trading at 100. The strikes and implied
volatilities for plain vanilla options is given in Table 6-10. For sim-
plicity, we have a linear volatility skew where the volatility increases
by one percentage point for every strike we move downward. The con-
tribution column is the weights multiplied by the option values. The
sum of the contribution column is the value of the option portfolio,
ncp = 419.6756. We now have all we need to find the fair variance
using equation (6.35): S = 100, T = 0.25, r =0.05, b = 0.05,
xvar =
100 2 (
0.05 x 0.25 — —e 005025
x
0.25 100
+ 1 — ln(100/100)) + e°.°5".25 x 419.6756 = 424.9539
Converted into an "equivalent" fair volatility, we have N/424.9539/100 =
20.61%—that is, the fair variance of the variance-swap is a2 =
0.20612.
Practical Tip When trading variance or volatility swaps in the
OTC market, make sure you ask for the exact terms before you com-
pare prices from different banks. This naturally holds for any OTC
derivatives contract but is particularly true for variance and volatility
swaps, since at current writing (2006), banks do not seem to have set-
tled on a set of standardized contracts. For instance, how many days
they use for annualization, and the exact formula used for calculating
the realized variance or volatility, are typically important.
(6.36)274 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
TABLE 6-10
Variance Swap Calculation
(S = 100, T = 0.25, r = 0.05, b = 0.05)
Strike Implied Weights Option f (S, X, T) Contribution Variance
Volatility Value Vega
Put options:
45 1.9881
50 30.00% 160.8054 0.000003 1.5452 0.0004 0.0000
55 29.00% 132.7808 0.00003 1.1827 0.0039 0.0000
60 28.00% 111.4987 0.0002 0.8866 0.0265 0.0003
65 27.00% 94.9558 0.0015 0.6463 0.1387 0.0013
70 26.00% 81.8416 0.0072 0.4534 0.5874 0.0046
75 25.00% 71.2696 0.0291 0.3015 2.0732 0.0137
80 24.00% 62.6224 0.0996 0.1851 6.2387 0.0336
85 23.00% 55.4593 0.2933 0.1002 16.2687 0.0691
90 22.00% 49.4591 0.7520 0.0429 37.1913 0.1189
95 21.00% 44.3828 1.6932 0.0103 75.1503 0.1695
100 20.00% 20.6927 3.3728 0.0000 69.7918 0.1016
Call options:
100 20.00% 19.3574 4.6150 0.0000 89.3341 0.0951
105 19.00% 36.3224 2.2886 0.0097 83.1277 0.1803
110 18.00% 33.0920 0.9073 0.0375 30.0243 0.1250
115 17.00% 30.2744 0.2670 0.0819 8.0833 0.0617
120 16.00% 27.8019 0.0529 0.1414 1.4694 0.0198
125 15.00% 25.6205 0.0062 0.2149 0.1577 0.0037
130 14.00% 23.6862 0.0004 0.3011 0.0083 0.0003
135 13.00% 21.9629 0.000007 0.3992 0.0002 0.0000
140 0.5082
Sum: 419.6756 0.9984
## 6.11.2 Volatility Swaps
At expiration a volatility swap pays out the difference between the
realized volatility covered by the swap and the contract volatility. In
contrast to a variance swap, a volatility swap is linear in payoff as
a function of the realized volatility. As has been noted previously in
the literature (see, for example, Demeterifi, Derman, Kamal, and Zou,
1999; Brockhaus and Long, 2000), a convexity adjustment is needed
to value a volatility swap, compared to a variance swap. Here we will
limit ourselves to a closed-form valuation method for variance and
volatility swaps assuming the variance follows a GARCH(1,1) process,
based on a paper by Haug, Javaheri, and Wilmott (2004).
GARCH Volatility Swaps
Even when there is no closed-form solution for the expected volatility,
one can use the Brockhaus and Long (2000) approximation (which is a6.11. VARIANCE AND VOLATILITY SWAPS 275
Taylor expansion of order two, of the square-root function on variable
v around the point vo = E[v]) to calculate
Var[v]
ETA,/E[v]
8E[v]312
The GARCH Process
Let us assume the variance in a continuous version is defined by the
GARCH(1,1) process:
dv = K (0 — v)dt yv dX,
where v is the variance, K is the speed of mean reversion, 0 is the mean
reversion level, and y is the volatility of volatility, or more precisely,
the volatility of the square of volatility. The discrete version of the
GARCH(1,1) process is described in Engle and Mezrich (1995) as
vn+1 =(1 0)V au2 , Ovn,
where V is the long-term variance, un is the drift adjusted stock return
at time n, a is the weight assigned to u2 n , and /3 is the weight assigned
to vn.7 We moreover have the following relationship
V
=— dt
1 — a —
K =
dt
Y =
dt
where8 is the Pearson kurtosis (fourth moment) of u[n].
The problem for F can be written as
aF 1 2 2a2F
± 2 -Y — Ta u KO9 v) LF v aF— 0
ay dl —
7The GARCH(1,1) model implies that the stock price process and the volatility process
contain two uncorrelated Brownian motions. In an NGARCH process, described by
Engle and Ng (1993), we have
Vn+1 = (1 — Ot — #) 17 Ce(Un -1- thin
where c is another parameter to be estimated and creates the correlation between
the two processes. This will not, however, affect the results we present, and we con-
centrate on the GARCH(1,1). The NGARCH process is discussed, for instance, in
Ritchken and Trevor (1997).
8The y in the Engle and Mezrich (1995) paper is y = — 1)dt, which is different
from the one presented here. This is likely due to a small typo in their paper. See also
Nelson (1990).276 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
with F(v, I, t) = I, where
It =- - vudu
0
The solution for F(v, I, t) is now
(
e-K(T-t) _ 1 ) 1
F(v, I, t) = 0 T - t ± ± _ 0 _ e-K(T-t)) v ± 1
K K
Similarly, G(v, I, t) has solution
G(v, I, t) = f (t) + g(t)v + h(t)v 2 1(t)I + n(t)v I + I2
with
402(y2 -
K(T - t) _ 1
f (t) = 02(T - 2 K) T t + t) e
K (y- - 2K)
K(T -r) 1 - e- 462K2 ( 1 _ e(y2-20(T -r)
(y2 02 (y2 2K) (y2 - 2K) ±
262 (y2 ± K) (
e
_K(T --t) T t 1 -K(T-t) p) ±
2 (e - ) y2 - K K K
20 49(y 2 - K)
g(t) = —(T - t) 1 e-K(T -0 )
K 2 (y 2 2K )
40K (e(y2-2)c)(T-t) _ e-K(T-t))
+
(y 2 _ (y 2 _ 2K ) k.
29(y 2 + K)
(T t)e
-K(T _t)
K (y 2 _ K )
h(t) = 2 (e(y2 -2K)(T-t) 1 )
K (y 2 - 2K) I\
1(t) = 20 (T t+
e-K (T _ 1
n(t) = -
2
(1 - e—K (7. —t) )
Numerical Examples
Let us assume we are calibrating the GARCH parameters from five
years of daily historic S&P 500 (SPX) prices (from 01/10/1996 to
09/28/2001). This gives us a long-term variance of V = 0.00015763
2 (e(y 2-2K)(T -t) e -K(T-t))
K (y2 K)6.11. VARIANCE AND VOLATILITY SWAPS 277
(so the annualized long-term volatility is around 19.93%) and a Pear-
son kurtosis of 5.81175. The discrete GARCH(1,1) parameters are
a =0.127455 and $ = 0.7896510. We take for inputs v = 0.0361 (corre-
sponding to a volatility of 19%) and I =0 (on the issue date of volatility
swap). We use business daily data and, therefore, dt = 1/252. Further,
let us assume six months to swap maturity. We now have the input
we need to calculate the diffusion limit parameters 0, K, and y:
V 0.00015763
0 =
1/252
-0.0397228
dt
1 - a -
K =
dr
1 - 0.127455 - 0.7896510
= 20.889288
1/252
Y = = 0.127455
dt
5.81175 - 1
= 4.4382185
1/252
and
4 x 0.039722(4.43822 - 20.8893) - 1
f (t) = 0.039722 x 0.5'
20.8893(4.43822 - 2 x 20.8893) 13.5 ±
e- 20.8893x0.5
20.8893
4 x 0.03972 x 20.88932
(4.43822 - 20.8893)2(4.43822 - 2 x 20.8893)
1 _ e(4.43822 - 2x20.8893)0.5 1 e- 20.8893x0.5
(4.43822 - 2 x 20.8893) 20.8893
2 x 0.03972(4.43822 + 20.8893)
4.43822 - 20.8893
g(t) =
x (e
-208893x0.5 0-5 1
± (e-208893x05 - 1)) = 0.000368
20.8893 20.88932
2 x 0.03974 x 0.0397(4.43822 - 20.8893) (
1 e_208893>(5) 0.5
20.8893 20.88932(4.43822 - 2 x 20.8893)
4 x 0.0397 x 20.8893
(4.43822 - 20.8893)2(4.43822 - 2 x 20.8893)
x (e(4.43822 - 2x20.8893)0.5 e- 20.8893x0.5)
22 + 20.8893)0.5e-20.8893x0.5 = 0.001881
2 - 20.8893)
2 x 0.0397(4.438
20.8893(4.4382
2
h(t) -
20.8893(4.43822 -
2
20.8893(4.43822
(e(4.43822 -2x20.8893)0.5 e-20.8893x0.5)
= 0.004335,
- 20.8893)
(e(4.43822 -2x20.8893)0.5
- 1)
2 x 20.8893)(
F(v, I, t) = 0.0397 0.5 ±
)
e -20.8893x0.5 _ 1
20.8893
278 CHAPTER 6. BSM ADJUSTMENTS AND ALTERNATIVES
1(t) = 2 x 0.03970.5 ± (
e- 20.8893x0.5
20.8893 — 1 = 0.035920
2
n(t) = e-20.8893 x0.5) = 0.095740
20.8893
The result for F(v, I, t) is now
1
20.8893
(1 e- 20.8893x0.5) 0.0361 ± 0 = 0.039376
Similarly, G(v,, I, t) returns
G(v, I, t) = f (t) g(t)v h(t)v 2 1(t) x 0 n(t)0.0361 x 0 ± 02 = 0.001765
We now have all we need to calculate the convexity adjustment,
and we can find the fair GARCH(1,1) value of the volatility swap. The
variance is given by
Var[i] = G — F2 = 0.001765 — 0.0393762 = 0.000215
The unadjusted volatility swap is thus given by ,/Var[i] = 0.1984337.
Further, the volatility swap with convexity adjustment is given by
0.000215
Et,5] ••aa N/0.039376 = 0.1949984
8 x 0.0393763/2
The fair value of the volatility swap is thus 19.50% versus the unad-
justed volatility of 19.84%. An Excel spreadsheet with VBA code
to perform such calculation is included on the accompanying CD.
See Haug, Javaheri, and Wilmott (2004) for more information on how
to value and hedge volatility swaps.
6.12 MORE INFORMATION
The number of papers on stochastic volatility and jump-diffusion
models is huge. A good start for more information about and refer-
ences to stochastic volatility models are the excellent books by Fouque,
Papanicolaou, and Sircar (2000), Lewis (2000), Rebonato (2004),
Javaheri (2005), and Gatheral (2006).CHAPTER
7
@ TREES AND FINITE
DIFFERENCE METHODS
If you are continuously confused it's a state you should get
used to.
Finance Professor
This chapter describes numerical methods that are useful to price
options and other derivative securities. The numerical methods are
more flexible than analytical solutions and can be used to price a wide
range of options contracts for which there are no known analytical
solutions. The chapter starts out with binomial and trinomial trees
for pricing options that depend on one underlying asset. The chapter
next covers a method for pricing options on two correlated assets:
the three-dimensional binomial model. The chapter then moves on
to option pricing using so-called implied trees. The last part of the
chapter describes finite difference methods, including explicit and
implicit methods, and the the Crank-Nicolson method.
7.1 BINOMIAL OPTION PRICING
The binomial method is certainly the most widely used numerical
method to price American options on stocks, futures, and currencies.
The binomial method was first published by Cox, Ross, and Rubinstein
(1979) and Rendleman and Bartter (1979). They explained how to con-
struct a recombining binomial tree that discretizes and approximates
the geometric Brownian motion. At the limit, a binomial tree (with a
very large number of time steps) is equivalent to the continuous-time
Black-Scholes-Merton formula used when pricing European options.
Of more interest, the binomial model easily handles the pricing of
American options, where no closed-form solution exists, as well as
many exotic options.
The asset price in a binomial tree can over a time step At either
increase by a fixed amount u with a probability p or decrease by a fixed
amount d with a probability 1 — p. The number of time steps is n. In
all the tree models of this chapter, we start counting the first node as
279280 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
zero. The number of time steps to a node in the tree we define as j.
The number of times the asset price has gone up to reach a node we
will define as i (price step). The first node in the tree will be assigned
(j = 0, i = 0). If the asset price goes up at the second node, it will be
assigned (j = 1, i = 1). If the asset price went down at the first time
step, we have (j = 1, i = 0), this is best illustrated in a figure:
The number of paths leading to a node (j, i) is equal to
i!
i!(j — i)!
and the corresponding probability of reaching node (j, i) is
j! •
i!(j — i)!
PI ( 1 — P)f
To price European plain vanilla call or put options, we are only
concerned about the end nodes, n, and the binomial model can be
expressed as
c = e—rT
!(n —
n! i)!p- (1 — p) n—i max[Sui — X, 0] (7.1)
p = e— rT E
i=0
n!
! fl(ti
p` (1 — p)n—i max[X — Suidn—i , 0] (7.2)
— i)
Many of the nodes will be out-of-the-money, and instead of starting
to count from the lowest node i = 0, we can make the algorithm more
efficient and count from a, (for a call option), the smallest nonnegative7.1. BINOMIAL OPTION PRICING 281
In(Xl(Sd"))
integer greater than In(uld) "• This gives us
c = e—rT E i), ) pi
— X)
i=a
( 7.3)
a-1
p = r
i =0
n!
) pi (1 — — Su' d) (7.4)
i!(n-i)!
The up and down jump factors and corresponding probabilities are
chosen to match the first two moments of the stock price distribution
(mean and variance). There are, however, more unknowns than there
are equations in this set of restrictions, implying that there are many
ways of choosing the parameters and still satisfy the moment restric-
tions. Cox, Ross, and Rubinstein (1979) (CRR) set the up and down
parameters to
U =e
aNFA7
d =e-a‘ ( 7.5)
where At = T I n is the length of each time step (time between price
movements) and n is the number of time steps. The probability of the
stock price increasing at the next time step is
ebAt d
(7.6)
u — d
Computer algorithm
This computer code implements a binomial tree for standard Euro-
pean options, using the CRR parameterization.
Function EuropeanBinomialPlainVanilla(CallPutFlag As String, S As Double,
X As Double, T As Double, r As Double, _
b As Double, v As Double, n As Long) As Double
Dim u As Double, d As Double, p As Double
Dim sum As Double, dt As Double, a As Double
Dim j As Integer
dt = T / n
u = Exp(v * Sqr(dt))
d= 1 / u
p = (Exp(b * dt) - d) / (u -
a = Int(Log(X / (S * dAn)) / Log(u / d)) + 1
sum = 0
If CallPutFlag = "c" Then
For j a To n
sum = sum + Application Combin(n, * pAj * (1 - p)^(n- j) _
* (S * u^j * dA(n - j) - X)
Next
ElseIf CallPutFlag = "p" Then
For j = 0 To a - 1
sum = sum + Application Combin(n, j) * pAj * (1 - p)^(n - j) -282 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
* (X - S * u^j * ciA(n - j ))
Next
End If
EuropeanBinomialPlainVanilla = Exp(- r * T) * sum
End Function
Generalized European Binomial
The more general case of the European binomial model is
c = c-rT r'N (
i!(n i)!p (1 - p) n-i g[S(T), X]
-
i=0
(7.7)
p = e
n! ;
p` (1 - p)n-i g[S(T), X],
i=0
where S(T) = Su i and g[S(T), X] is any given payoff function at
maturity. This illustrates how powerful the simple binomial model is.
It is capable of pricing any European option on a single asset, whose
payoff is not path-dependent. If we, for instance, want to find the
value of a power option where the payoff at maturity is max[5 2 - X, 0],
then we simply replace g [S(T), X] with max[(Su' dn-1 )2 - X, 0]. We will
later also discuss how this model can be used to price many path-
dependent options. The following payoff table gives some examples of
options that can be valued with the above expressions (all included
on the accompanying CD). The variable z equals 1 if the contract is a
call, and -1 if it is a put. A * next to a payoff signifies that a closed-
form solution for the option is included in this book. A ** signifies that
a closed-form solution is included in the book but that the binomial
method is more flexible. For instance, the closed-form solution for
powered options restricts i to be an integer, while the binomial method
allows i to take any real value. The Cap means that the payoff is
capped, with maximum payoff equal to Cap.
Power contract:
Capped power contract:
Power contract*:
Power contract:
Standard power option*:
Capped standard power option*:
Powered option**:
Capped powered option:
Sinus option:
Si
min[Si , Cap]
(S/X) i
(S — X) i
max[z(Si — X), 0]
min[max[z(Si — X), 0], Cap]
max[z(S — X), Of
min[max[z(S — X), Of , Cap]
max[z(sin(S) — X), 0]
(7.8)7.1. BINOMIAL OPTION PRICING 283
Cosinus option:
Tangens option:
Log contract*:
Log contract*:
Log option*:
Square root contract:
Square root contract:
Square root option:
max[z(cos(S) — X), 01
max[z(tan(S) — X), 01
in(S)
ln(S/X)
max[ln(S/X), 0]
V- S-
,17/X
,/max[z(S — X), 01
Computer algorithm
Here is the VBA code for a flexible European binomial valuation
model. It can value 18 different derivatives contracts, and you can
easily add a new derivatives instrument by simply adding a line in
the payoff function. The TypeFlag takes integer values that decide what
type of option should be valued. You set the CallPutFlag = "c"for a call
option and to " p" for a put option. pow is the power the power options
are raised to. cap is the cap on the payoff for any capped option. n is
the number of time steps used for valuation. Noncapped power options
are in general very slow to converge.
Function EuropeanBinomial(TypeFlag As Integer , CallPutFlag As String, _
S As Double, X As Double, T As Double, r As Double, b As Double, _
v As Double, pow As Double, cap As Double, n As Long) As Double
Dim u As Double, d As Double, p As Double
Dim sum As Double, dt As Double, Si As Double, z As Integer
Dim j As Long
z = 1
If CallPutFlag = "p" Then z = —1
dt = T / n
u = Exp(v * Sqr(dt))
d= 1 / u
p = (Exp(b * dt) — d) / (u — d)
SUM = 0
For j = 0 To n
Si = S * utsj * clA(n — j)
sum = sum + Application .Combin(n, j)
* (1 — p)^(n — j) * BinomialPayoff(TypeFlag,
Next
EuropeanBinomial = Exp(—r * T) * sum
End Function
* pAj
z, Si, X, pow, cap)
Function BinomialPayoff(TypeFlag As Integer z As Integer , _
S As Double, X As Double, pow As Double, cap As Double) As Double284 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
If TypeFlag = 1 Then 'Plain Vanilla
BinomialPayoff = Max(z * (S — X), 0)
ElseIf TypeFlag = 2 Then ' Power contract
BinomialPayoff = SApow
ElseIf TypeFlag = 3 Then ' Capped Power contract
BinomialPayoff = Min(SApow, cap)
ElseIf TypeFlag = 4 Then ' Power contract
BinomialPayoff = (S / X)Apow
ElseIf TypeFlag = 5 Then ' Power contract
BinomialPayoff = z * (S — X)Apow
ElseIf TypeFlag = 6 Then 'Standard power option
BinomialPayoff = Max(z * (SApow — X), 0)
ElseIf TypeFlag = 7 Then 'Capped power option
BinomialPayoff = Min(Max(z * (SApow — X), 0), cap)
ElseIf TypeFlag = 8 Then ' Powered option
BinomialPayoff = Max(( z * (S — X)), 0)Apow
ElseIf TypeFlag = 9 Then ' Capped powered option
BinomialPayoff = Min(Max((z * (S — X)), 0)Apow, cap)
ElseIf TypeFlag = 10 Then ' Sinus option
BinomialPayoff = Max(z * (Sin(S) — X), 0)
ElseIf TypeFlag = 11 Then ' Cosinus option
BinomialPayoff = Max(z * (Cos(S) — X), 0)
ElseIf TypeFlag = 12 Then ' Tangens option
BinomialPayoff = Max(z * (Tan(S) — X), 0)
ElseIf TypeFlag = 13 Then ' Log contract
BinomialPayoff = Log(S)
ElseIf TypeFlag = 14 Then ' Log contract
BinomialPayoff = Log(S 1 X)
ElseIf TypeFlag = 15 Then ' Log option
BinomialPayoff = Max(Log(S / X), 0)
ElseIf TypeFlag = 16 Then 'Square root contract
BinomialPayoff = Sqr(S)
ElseIf TypeFlag = 17 Then 'Square root contract
BinomialPayoff = Sqr(S / X)
ElseIf TypeFlag = 18 Then 'Square root option
BinomialPayoff = Sqr(Max(z * (S — X), 0))
End If
End Function
## 7.1.1 Cox-Ross-Rubinstein American Binomial Tree
Here we will look at how to use the Cox-Ross-Rubinstein binomial
tree to value American-style options. The asset price at each node is
set equal to
su -t, i = 0, 1.....
where the up and down jump factors for a time interval At =Tin
is given by (7.5), where n is the number of time steps, as before. The
probability of the stock price increasing by the factor u is now given by
equation (7.6). Since probabilities must sum to unity, the probability
of the stock price decreasing by the factor d must be 1 — p. Again,
the up and down factors and probabilities are chosen to match the
first two moments of the stock price distribution. This ensures that7.1. BINOMIAL OPTION PRICING 285
the probability distribution implied by the binomial tree converges to
geometric Brownian motion when At goes to zero.
Su5
Example
Consider an American stock put option with six months to expiration.
The stock price is 100, the strike price is 95, the risk-free interest rate
is 8%, and the volatility is 30%. The option is priced in a binomial tree
with five time steps. S = 100, X = 95, T = 0.5, r = b =0.08, a =0.3,
and n = 5.
0.5
At = = 0.1
5
u = = 1.0995 d =e_03— 0.9095
e0.08x0.1 — 0.9095
P —
1.0995 — 0.9095
First, we start at the end of the tree to see if it is optimal to exer-
cise the option max[X — S, 01. For example, in the end node with asset
price 62.23, it is naturally optimal to exercise the put option: max[95 —
62.23, 0] = 32.77, while at, for example, the end node with asset price
= 0.5186286 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
100.95, it is not optimal to exercise the option max[95 — 100.95, 0] = 0.
After checking for optimal exercise at each end node, we can now eas-
ily find the value of the American put option by standard backward
induction (rolling back through the tree), where we check at each node
if it is optimal with early exercise:
Pj.; = max{X — Suid e—r At
[PP j+1,i+1 ± P)Pj+1,ii)
The value of the American put option is therefore approximately 4.92.
Number of Nodes in a Binomial Tree
The number of nodes in the binomial tree is " ("2+1) when we count the
number of time steps from 1. When we count the number of time steps
from 0, as we have done in this chapter, the number of nodes in the
binomial tree is (n+1) 2(n+2)
Local Volatility
The local volatility in a standard CRR binomial tree is naturally
constant for each time step and is given by
Ojj = — p)ln(u 2)
The local volatility is generally different from the input volatility.
It converges to the global input volatility as the number of time steps
becomes large.
Negative Probabilities in the CRR Tree
A low volatility and relatively high cost-of-carry can induce negative
risk-neutral probabilities in the CRR tree; see Chriss (1997). More7.1. BINOMIAL OPTION PRICING 287
precisely, we will get negative risk-neutral probabilities whenl
a < pb,./Tal
Negative probabilities are not necessarily a bad thing, despite
being inconsistent with the basic axioms of probability. Allowing neg-
ative probabilities in a model will in general increase its flexibility
(Haug, 2004). The problem with the CRR model is not negative prob-
abilities per se, but rather that the state space is not large enough to
cover all relevant events when a < 013,71.
## 7.1.2 Greeks in CRR Binomial Tree
We now look at how to calculate the most basic Greeks in a binomial
tree.
The delta, the change in option price for a one unit change in asset
price, is given by
A =
—
(7.9)
Su — Sd
where fj,i is the price of the derivative security in the binomial tree
at node (j, i). The gamma, the change in delta for a one unit change
in asset price, is given by
f2,2 f2, 1 12,1 - 12,0
S
r _ d2
The theta, the change in option value for a one-day closer to
maturity, ceteris paribus,is given by
8 =
f2 — fo,o
2At365
(7.11)
where f2,1 is the derivative's price in the tree at time step j = 2 and
number of up-steps i = 1. Similarly, fro is the derivatives price at
time step j =0 and number of up-steps i 0 (very first node). The
current asset price is S, and u and d is the up and down jump sizes.
The delta, gamma, and theta calculations just presented are
incorporated in the computer code below. An efficient incorporation
of all of these sensitivities can be achieved by running through the
binomial tree only once. Calculation of vega and rho, on the other
1See also Hull (2005).
(Su2 — Sd2)
(7.10)288 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
hand, is less efficient:
f (a + La) — f (a — Au)
Vega =
2Acr
We thus need to calculate the option value twice in the bino-
mial tree to get an estimate of the sensitivity to changes in implied
volatility (vega). The same is true for rho.
Computer algorithm
The computer code returns the value of European and American call
or put options. Setting the OutputFlag ="p" returns the option price,
OutputFlag = "d" returns the option's delta, OutputFlag = "g" yields
the option's gamma, OutputFlag = "t" yields the theta, OutputFlag =
"a" returns an array containing the option value, delta, gamma,
and theta. Setting the AmeEurFlag = "a" gives American option val-
ues: AmeEurFlag ="e" gives European values. Similarly, setting the
CallPutFlag = Vreturns a call value, and CallPutFlag = 'p'returns a
put value. In the computer code, v = a and dt = At.
Function CRRBinomial(OutputFlag As String, AmeEurFlag As String ,_
CallPutFlag As String, S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double, n As Integer) As Variant
Dim OptionValue() As Double
Dim u As Double, d As Double, p As Double
Dim ReturnValue(4) As Double
Dim dt As Double, Df As Double
Dim i As Integer , j As Integer , z As Integer
ReDim OptionValue(0 To n + 1)
If CallPutFlag = "c" Then
z= 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
dt = T / n
u = Exp(v * Sqr(dt))
d = 1 / u
P = (Exp(b * dt) — d) / (u
Df = Exp(—r * dt)
For i = 0 To n
OptionValue(i) = Max(0 , z * (S * uAi * dA(n — i) — X))
Next
For j = n — 1 To 0 Step —1
For i = 0 To j
If AmeEurFlag = "e " Then
OptionValue(i) = (p * OptionValue(i + 1) _
+ (1 — p) * OptionValue(i)) * Df
ElseIf AmeEurFlag = "a" Then7.1. BINOMIAL OPTION PRICING 289
OptionValue ( i ) = Max( ( z * (S * u^ * dA( j — i ) — X)) , _
( p * OptionValue ( i + 1) + (1 — p) * OptionValue( i )) * Df)
End If
Next
If j = 2 Then
ReturnValue (2) = (( OptionValue (2 ) — OptionValue ( 1 ))
/ (S * u^2 — S) — ( OptionValue (1 ) — OptionValue ( 0 ))
/ (S — S * d's 2)) / (0.5 * (S * 1.02 — S * dA 2))
ReturnValue (3) = OptionValue (1)
End If
If j = 1 Then
ReturnValue (1) = (OptionValue (1) — OptionValue ( 0 )) _
/ (S * u — S * d)
End If
Next
ReturnValue (3) = (ReturnValue (3) — OptionValue (0 )) / (2 * dt ) / 365
ReturnValue (0) = OptionValue (0)
If OutputFlag = "p" Then 'Option value
CRRBinomial = ReturnValue (0 )
ElseIf OutputFlag = "d" Then 'Delta
CRRBinomial = ReturnValue (1 )
ElseIf OutputFlag = "g" Then 'Gamma
CRRBinomial = ReturnValue ( 2 )
ElseIf OutputFlag = "t" Then 'Theta
CRRBinomial = ReturnValue (3 )
ElseIf OutputFlag = a ' Then
CRRBinomial = Application . Transpose (ReturnValue Q))
End If
End Function
## 7.1.3 Rendleman Bartter Binomial Tree
Rendleman and Bartter (1979) suggested setting the up probability
in the tree equal to p = 0.5. This gives us
u e(b—c1212)At+cr../Yt d = e(b—u212)At—crt
This set of parameters is discussed in more detail in Jarrow and Rudd
(1982).
The local volatility in this binomial tree is naturally constant for
each time step and is given by
a • • = — p(1 — p)ln(uld)
At
Greeks in the Rendleman Bartter Tree
The delta is given by
A = fl
'
1
Su— Sd290 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
1 (Su2 — Sd 2) 7
where fi,, is the derivatives price in the tree at time step j and number
of up-steps i. The current asset price is S, and u and d are the up and
down jump factors.
7.1.4 Leisen- Reimer Binomial Tree
Leisen and Reimer (1996) set the u and d factors in such a way that the
tree centers around the strike price. This makes the tree converges
"smoothly." This makes their tree more efficient for valuation of stan-
dard options relative to the CRR and Rendleman-Bartter trees. The
probability of going up is set to
p = h(d2),
where the probability of going down is naturally given by 1 — p.
Moreover, the up and down factors are set to
U = e h(d1)
h(d2)
e - pu
d =
1 — p
where, as usual, At = T In and
In(SIX) + (b + a2/2)T
cr,,/7
d2 = d1 —
There are two alternatives to calculate h(x). The first is the Preizer-
Pratt inversion method 1:
h(x) = 0.5 ± 7) 10.25 — 0.25 exp (n: )
2
(n + 0 1/2
The second is the Preizer-Pratt inversion method 2:
x \2/ ± 1 1/2,
h(x) = 0.5 ± 7)10.25 —0.25 exp[ (
1 0.1 6
where n =1 if x >=0 and —1 if x <0. Further, the number of time
steps n should be odd to ensure the exercise price falls on a set of nodes.
Delta and gamma can be calculated in the same way as for the
Rendleman-Bartter binomial tree.
which is the same expression as in the CRR binomial tree. The
calculation of gamma is slightly different though:
f2,2-f2,1 f2,1-f2,0
= sisud
r
d1 =7.1. BINOMIAL OPTION PRICING 291
Computer algorithm
The computer code returns the value of European and American call or
put options using the Leisen-Reimer binomial algorithm with Preizer-
Pratt inversion method 2. Setting the OutputFlag = "p' returns the
option price. OutputFlag = "d"returns the option's delta. OutputFlag =
"g" yields the option's gamma. OutputFlag = "a"returns an array con-
taining the option value, delta, and gamma. Setting the AmeEurFlag =
"a" gives American option values; AmeEurFlag = "e" gives European
values. Similarly, setting the CallPutFlag = "c"returns a call value,
and CallPutFlag = "p'returns a put value. In the computer code, v = a
and dt = At.
Option Base 0
Function LeisenReimerBinomial ( OutputFlag As String, _
AmeEurFlag As String, CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, _
v As Double, n As Integer) As Variant
Dim OptionValue() As Double
Dim ReturnValue(3) As Double
Dim dl As Double, d2 As Double
Dim hdl As Double, hd2 As Double
Dim u As Double, d As Double, p As Double
Dim dt As Double, Df As Double
Dim i As Integer , j As Integer , z As Integer
n = Application .Odd(n)
ReDim OptionValue(0 To n)
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
dl = (Log(S / X) + (b + v^2 / 2) * T) / (v * Sqr(T))
d2 = dl — v * Sqr(T)
hdl = 0.5 + Sgn(d1) * (0.25 — 0.25
* Exp(—(d1 / (n + 1 / 3 + 0.1 / (n + 1)))^2 * (n + 1 / 6)))^0.5
hd2 = 0.5 + Sgri(d2) * (0.25 — 0.25
* Exp(—(d2 / (n + 1 / 3 + 0.1 / (n + 1)))^2 * (n + 1 / 6)))^0.5
dt = T / n
p = hd2
u = Exp(b * dt) * hdl / hd2
d = (Exp(b * dt) — p * u) / (1 — p)
Df = Exp(—r * dt)
For i = 0 To n
OptionValue(i) = Max(0, z * (S * u^i * dA(n — i) — X))
Next
For j = n — 1 To 0 Step —1
For i = 0 To j( ( OptionValue (2) — OptionValue ( 1))
) — OptionValue ( 0))
/ (0.5 * (S *
OptionValue ( 1)
— S * dA2))
292 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
If AmeEurFlag = "e" Then
OptionValue ( i ) = (p * OptionValue ( i +
* OptionValue ( i )) * Df
Els eIf AmeEurFlag = "a " Then
OptionValue ( i ) = Max( ( z *
(p * OptionValue ( i + 1) +
End If
1) + (1 — p) _
(S uAi dA(j — i ) — X)) ,
(1 — p) * OptionValue ( i )) Df)
Next
If j = 2 Then
ReturnValue ( 2 ) =
/ (S * uA2 — S * u * d)
— ( OptionValue ( 1
/ (S*u*d—S*dA2))
ReturnValue (3) =
End If
If j = 1 Then
ReturnValue ( 1)
/ (S*u— S* d)
End If
Next
ReturnValue ( 0) = OptionValue ( 0)
If OutputFlag = "p" Then 'Option value
LeisenReimerBinomial = ReturnValue
ElseIf OutputFlag = "d" Then 'Delta
LeisenReimerBinomial = ReturnValue
Els eIf OutputFlag = "g" Then 'Gcunnia
LeisenReimerBinomial = ReturnValue
Els eIf OutputFlag = a" Then
LeisenReimerBinomial = Application
End If
( 0)
( 1)
(2)
. Transpose ( ReturnValue 0 )
= ( OptionValue (1) — OptionValue ( 0 )) _
End Function
## 7.1.5 Convertible Bonds in Binomial Trees
A convertible bond can be seen as a combination of a plain bond and
a stock option. If the stock price is far below the strike (conversion
price), the convertible behaves like a straight bond. If the stock price
is far above the strike, the convertible behaves like a stock. This should
also affect the discounting of the cash flows. When the convertible is
deep-out-of-the-money, the future cash flows should be discounted by
a rate that takes into account the credit spread k above the treasury
rate of the particular bond. If the convertible is deep-in-the-money,
it is almost certain to be converted, and the cash flows should be
discounted at the risk-free rate.
Bardhan, Bergier, Derman, Dosembet, and Kani (1994) have incor-
porated these effects by using a discounting rate that is a function of a
variable conversion probability. The model starts out with a standard
binomial stock price tree. The convertible bond price is then found
by starting at the end of the stock price tree. At each end node, the
convertible value must be equal to the maximum of the value of con-
verting the bond into stocks or the face value plus the final coupon.7.1. BINOMIAL OPTION PRICING 293
One next rolls backward through the tree, using backward induction.
If it is optimal to convert the bond, the value is set equal to the con-
version value at that node, or else the convertible bond value Pn,i is
set equal to
= max[mS, PPn+i,i+te
—rn+116,( _ p)pe—r.+1,;Ati, (7.12)
where m is the conversion ratio. Some convertible bonds have an
initial lockout period during which the investor is not allowed to
convert the bond. The convertible bond value at these nodes can be
simplified to
= At
( — P)Pn+l,ie_rn+1 Lt
Instead of using a constant discount rate r, the discount rate rn,i is set
to fluctuate with the conversion probability qn,i at each node.
The conversion probabilities .7,4 , where n is the time step and i the
number of up moves (the state), are calculated by starting at the end of
the stock price tree. If it is optimal to convert the bond, the conversion
probability is set to 1; otherwise, the conversion probability is set to
0. For time steps before the end of the tree, the conversion probability
is set equal to 1 if it is optimal to convert at that node; otherwise,
qn,i = Pqn+1,i+1 (1 — P)9r1+1,i (7.13)
The credit-adjusted discount rate is set equal to a conversion prob-
ability weighted mixture of the risk-free rate and the credit-adjusted
rate. This gives a discount rate for up moves equal to
= qor + (1 - qo )(r k) (7.14)
The discount rate is thus set equal to the constant risk-free rate r
when the conversion probability is 1, and set equal to the risk-free
rate plus the credit spread r + kwhen the conversion probability is 0.
The discount rate moves smoothly between the risk-free rate and the
credit-adjusted rate for conversion probabilities between 0 and 1.
Example
Consider a convertible corporate bond with five years to maturity.
The continuously compounding yield on a five-year treasury bond is
7%, the credit spread on the corporate bond is 3% above treasury, the
face value is 100, the annual coupon is 6, the conversion ratio is 1,
the current stock price is 75, and the volatility of the stock is 20%.
What is the value of the convertible bond? S =75,T =5, r = b =0.07,
k = 0.03, m = 1, and a =0.2.294 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
To price the convertible bond, we need to build a standard binomial
stock price tree. With the number of time steps n = 5, we get At = 1
and up and down factors
u = = = 1.2214,
1
d= — = 0.8187
The probability of an increase in price is thus given by
ebAt d e0.07 x 1 0.8187
P= =0.6302,
u—d 1.2214 — 0.8187
and we obtain the following binomial stock price tree:
The next step is to find the convertible bond values and the con-
version probabilities at each node in the tree. To see how this works,
let's look at the calculation of several nodes.
At the end node with stock price 203.87, it is better to convert the
bond into one stock and receive the stock price 203.87 than to get
the notional plus the coupon 100 + 6. The probability of conversion
at this node, q5,5, is 100%, which we write as 1.00 in the conversion
probability tree.
At the end node, with a stock price of 91.61, it is better not to
convert the bond and receive the face value plus the coupon of 106.
The probability of conversion is 475,3 = 0.
For the node at year four (n =4) with stock price 111.89, the
convertible bond value of 121.77 is found by using equation (7.12):
P4,4 = max[l x 111.89, 0.6302 x 136.66e —rn+1,'±I xI + (1 — 0.6302)106.00e—rn+1, x
The credit-adjusted discount rates are found by using equation
(7.14):
= 1 x 0.07 + (1 — 1)(0.07 + 0.03) = 0.07
rn+1,1 = 0 x 0.07 + (1 — 0)(0.07 + 0.03) = 0.11.00
7.1. BINOMIAL OPTION PRICING 295
The conversion probability of 0.63 at this node is given by equation
(7.13):
q4,4 = 0.6302 x 1 + (1 - 0.6302) x 0
The same procedure can be used to find any convertible bond value
and conversion probability.
Convertible Bond Tree
203.87
In the above section the main principles of how to incorporate a
convertible bond model were outlined. In practice, there are many
additional issues to take into account. Some convertible bonds allow
the issuer to force investors to convert the bond if the stock price
reaches a certain prespecified level (barrier). To include a barrier in
the convertible binomial model, the number of time steps should be
chosen to make the barrier fall exactly on the nodes. The conversion
probability is then set to 1 if the stock price is larger than or equal to
the barrier. The issuer of the convertible bond also often has the right
to call the bond, and the investor has the right to put the bond. The
paper of Bardhan, Bergier, Derman, Dosembet, and Kani (1994) is a
good start to look into such practicalities.296 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
Computer algorithm
Function ConvertibleBond(AmeEurFlag As String, S As Double, X As Double, _
t2 As Double, ti As Double, r As Double, k As Double, _
q As Double, v As Double, F As Double, _
Coupon As Double, n As Integer) As Double
'T2: Time to maturity
't I : Time to to first conversion date, only used when the option is Amer*
'k Issuer 's credit spread above risk—free return ( similar Treasuries).
Stock dividend yield
'v: Stock volatility
Number of time—steps in the tree
'F Bond face value
Dim OptionValue() As Double 'Option Value at each node
Dim ConversionProbability() As Double 'Conversion probability at each node
Dim dt As Double
Dim u As Double, d As Double, p As Double
Dim ru As Double, rd As Double
Dim CouponValue As Double
Dim CouponTime As Double 'Time to last coupon payment from today
Dim Time As Double
Dim StockPrice As Double
Dim CRatio As Double 'Conversion Ratio= FaceValue I Strike
Dim i As Integer, j As Integer, CouponPayment As Integer
CRatio = F / X
ReDim OptionValue(n + 1)
ReDim ConversionProbability(n + 1)
dt = t2 / n
u = Exp(v * Sqr(dt ))
d= 1 / u
p = (Exp((r — q) * dt) — d) / (u —
For i = 0 To n
StockPrice = S * u^i * dA(n — i)
OptionValue(i) = Max(F + Coupon, CRatio * StockPrice)
If OptionValue(i ) = F + Coupon Then
ConversionProbability(i) = 0
Else
ConversionProbability(i) = 1
End If
Next
CouponTime = t2
For j = n — 1 To 0 Step —1:
If CouponTime <> t2 — Int((n — j) * dt) Then
CouponPayment = 1
CouponTime = t2 — Int((n — j) * dt)
Time = CouponTime — dt * j
Else
CouponPayment = 0
End If
For i = 0 To j7.2. BINOMIAL MODEL WITH SKEWNESS AND KURTOSIS 297
ru = ConversionProbability ( + 1) * r _
+ (1 — ConversionProbability ( i + 1)) * ( r + k)
rd = ConversionProbability ( i ) * r _
+ (1 — ConversionProbability ( i )) * ( r + k)
StockPrice = S * It^ * d A Abs( i — j )
If CouponPayment = 1 Then
CouponValue = Coupon * ( p * Exp(—ru * Time) _
+ ( 1 — p) * Exp( — rd * Time ) )
Else
CouponValue = 0
End If
If AmeEurFlag = "e" Or AmeEurFlag = "a " And dt * j <= ti Then
OptionValue( i ) = CouponValue + p * OptionValue( + 1)_
* Exp(—ru * dt ) + (1 — p) * OptionValue( i ) * Exp(—rd * dt )
ConversionProbability ( i ) = p * ConversionProbability ( i + 1)
+ (1 — p) * ConversionProbability ( i )
E Ise If AmeEurFlag = "a " Then
OptionValue ( ) = Max( CRatio * ( StockPrice — X) + F, _
CouponValue + p * OptionValue( + 1) * Exp(—ru * dt ) _
+ (1 — p) * OptionValue( i ) * Exp(—rd * dt ))
If OptionValue( ) = CRatio * ( StockPrice — X) + F Then
ConversionProbability ( i ) = 1
Else
ConversionProbability ( ) = p * ConversionProbability( i + 1)
+ (1 — p) * ConversionProbability( i)
End If
End If
Next
Next
ConvertibleBond = OptionValue (0)
End Function
7.2 BINOMIAL MODEL WITH SKEWNESS AND
KURTOSIS
Rubinstein (1998) use an Edgeworth expansion to take into account
skewness and kurtosis in a standard discrete binomial probability dis-
tribution. This generalized binomial model is naturally more flexible
than a closed-form solution (Chapter 6) and can be used to value a
variety of options.
The method takes the Rendelman-Bartter node probability as a
primitive:
b(x) =
n! (1V
i!(n — i)!
To get a skewness-kurtosis tree, multiply the path probability with
either the Edgeworth expansion
1 3 1 I 2 6 1 ± — ott3(x — 3x) ± —
24
014 — 3)(x
4
— 6x
2
± 3) + —
72
/13(x — 15x
4 ± 45x2 — 15)
6298 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
or the Gram-Charlier expansion
3 1
1 ± —
6
ft3 (x — 3x) ± —
24
(IL4 — 3)(x
4
— 6x
2
± 3),
where is the skewness and ti,4 is the Pearson kurtosis. Let's call
this new skewness and kurtosis adjusted path probability for f (xi).
Because this approach is only an approximation, the sum of path pro-
babilities will not necessarily add up to 1: f (xi) 1 and we need to
rescale so we get the sum of probabilities equal to unity. This is done
by simply replacing f (x,) with f(x' . See also Jackson and Staunton
(2001) for more information on implementing such binomial trees.
Computer algorithm
The computer code returns the value of a European call or put option
from a Rubinstein skewness and kurtosis adjusted binomial tree
(RubinsteinSKB). Setting the Expansion = "e" gives the value using
Edgeworth expansion: Expansion = "c" gives the values using Gram-
Charlier expansion. Similarly, setting the CallPutFlag = "c" returns
a call value, and CallPutFlag = "p' returns a put value. Setting the
OutputFlag = "p' returns the option value, OutputFlag = "prob"returns
the probability distribution, and OutputFlag = "St" returns the node
values(geometry of the tree). In the computer code v = a- and dt = At .
Function RubinsteinSKB( Expansion As String, OutputFLag As String, _
CallPutFlag As String, S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double, _
Skew As Double, Kurt As Double, n As Double) As Variant
Dim u As Double, d As Double, p() As Double
Dim Sum As Double, PSurn As Double, dt As Double, A As Double
Dim i As Integer , z As Integer
Dim xi As Double
Dim St() As Double
z = 1
If CallPutFlag = "p" Then
z = —1
End If
ReDim p(0 To n)
ReDim St(0 To n)
dt = (T / n)
u = Exp(( b — v^2 / 2) * dt + v * Sqr( dt ) )
d = Exp((b — v^2 / 2) * dt — v * Sqr( dt ))
Sum = 0
PSum = 0
For i = 0 To n Step 1
xi = (2 * i — n) I Sqr(n)
If Expansion = "e" Then 'Edgworth—Expansion7.3. TRINOMIAL TREES 299
p(i) = Application.Combin(n, i) * 0.5An _
* (1 + 1 / 6 * Skew * (xiA3 — 3 * xi) _
+ 1 / 24 * (Kurt — 3) * (xiA4 — 6 * xiA2 + 3) _
+ SkewA2 * (xiA6 — 15 * xi A 4 + 45 * xiA2 — 15) / 72)
Else 'Gram —Charlier
p(i) = Application.Combin(n, i) * 0.5An _
* (1 + 1 / 6 * Skew * (xiA3 — 3 * xi) _
+ 1 / 24 * (Kurt — 3) * (xiA4 — 6 * xiA2 + 3))
End If
PSum = PSum + p(i )
St(i) = S * uAi * dA(n — i)
Next
For i = 0 To n Step 1
p(i) = p(i) / PSum
Sum = Sum + p(i) * Max(z * (S * uAi * dA(n — i) — X), 0)
Next
If OutputFLag = "p" Then
RubinsteinSKB = Exp(—r * T) * Sum
ElseIf OutputFLag = "prob" Then
RubinsteinSKB = Application Transpose(p0)
ElseIf OutputFLag = "St" Then
RubinsteinSKB = Application.Transpose(St())
End If
End Function
7.3 TRINOMIAL TREES
Trinomial trees were introduced in option pricing by Boyle (1986) and
are similar to binomial trees. Trinomial trees can be used to price both
European and American options on a single underlying asset. 2
so
Su 2 _i Su
Su
Sd
Sd2
Sd3
Because the asset price can move in three directions from a given
node, compared with only two in a binomial tree, the number of time
steps can be reduced and still attain the same accuracy as in the bino-
mial tree. The main advantage is that trinomial trees offer more
20ne-dimensional trinomial trees can also be used to price some derivatives on two
correlated assets. However, a more efficient method, the three-dimensional lattice
model, will be discussed later.300 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
flexibility than binomial trees. The extra flexibility is useful when
pricing complex derivatives, such as American barrier options. 3
There are several ways to choose jump size and corresponding prob-
abilities in a trinomial tree that will all give the same result when
the number of time steps is large. To discretize a geometric Brownian
motion, the jump sizes and probabilities must match the first two
moments of the distribution (the mean and variance). One possibility
is to build a trinomial tree where the asset price at each node can go
up, stay at the same level, or go down. In that case, the up and down
jump sizes are
u=e
a.,At d =
and the probability of going up and down respectively are
( eb4tI2 _ e -0,./AtI2 ) 2
Pd =
ea,/AtI2 _ e—cr,/At12
The probabilities must sum to unity. Thus, the probability of the
asset price remaining unchanged is
Pm = 1— Pu Pd
T is the time to maturity in years, b is the cost-of-carry, At = I is
the length of each time step, and n is the number of time steps. Aher
building the asset price tree, the value of the option can be found in
the standard way by using backward induction. When the volatility
a- is very low and the cost-of-carry is very high, pi, and pd can sum to
more than unity, and then naturally pm will become negative. More
precisely, we will get a negative probability pm < 0 when
<
b2 At
2
Using this inequality, we can also find that we need to set the number
of time steps to n > Integer[] ± 1 to avoid negative probabilities.
We can alternatively avoid negative probabilities by choosing a more
optimal state space. See Haug (2004) for a more detailed discussion
on negative probabilities in tree models.
3See Ritchken (1995) and Cheuk and Vorst (1996).
Pu =
ecr,lAt12
ea,1AtI2 _ ebAt12 ) 27.3. TRINOMIAL TREES 301
Computer algorithm
The computer code returns the value of European and American call
or put options. Setting the OutputFlag = "p' returns the option price,
OutputFlag = "d"returns the option's delta, OutputFlag = "g"yields the
option's gamma, OutputFlag "t" yields the theta, OutputFlag = "a"
returns an array containing the option value, delta, gamma, and
theta. Setting the AmeEurFlag = "a" gives American option values,
and AmeEurFlag = "e" gives European values. Similarly, setting the
CallPutFlag = "c"returns a call value, and CallPutFlag = "p"returns a
put value. In the computer code, v = a and dt = At.
Function TrinomialTree(OutputFlag As String, AmeEurFlag As String, _
CallPutFlag As String, S As Double, X As Double, T As Double, r As Double, _
b As Double, v As Double, n As Integer) As Variant
Dim OptionValue() As Double
ReDim OptionValue(0 To n * 2 + 1)
Dim ReturnValue(3) As Double
Dim dt As Double, u As Double, d As Double
Dim pu As Double, pd As Double, pm As Double, Df As Double
Dim i As Long, j As Long, z As Integer
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
dt = T / n
u = Exp(v * Sqr(2 * dt ))
d = Exp(—v * Sqr(2 * dt ))
pu = ((Exp(b * dt / 2) — Exp(—v * Sqr(dt / 2))) _
/ (Exp(v * Sqr(dt / 2)) — Exp(—v * Sqr(dt / 2))))^2
Pd = ((Exp(v * Sqr(dt / 2)) — Exp(b * dt / 2)) _
/ (Exp(v * Sqr(dt / 2)) — Exp(—v * Sqr(dt / 2))))^2
pm = 1 — pu — pd
Df = Exp(—r * dt)
For i = 0 To (2 * n)
OptionValue(i) = Max(0 , z * (S * u^Max(i — n, 0) _
* dAMax(n — i , 0) — X))
Next
For j = n — 1 To 0 Step —1
For i = 0 To (j * 2)
OptionValue( i) = (pu * OptionValue(i + 2) _
+ pm * OptionValue ( i + 1) + pd * OptionValue ( i )) * Df
If AmeEurFlag = "a" Then
OptionValue(i) = Max( z * (S * &Max( i — j , 0) _
* &Max( j — i , 0) — X), OptionValue(i ))302 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
End If
Next
If j = 1 Then
ReturnValue( 1 ) =
/ (S*u—S*d
ReturnValue (2 ) =
— ( OptionValue
/ (0.5 * (S
ReturnValue ( 3 ) =
End If
Next
( OptionValue (2 ) — OptionValue ( 0 )) _
( ( OptionValue (2 ) — OptionValue ( 1 )) / (S
(1 ) — OptionValue ( 0 )) / (S — S * d)) _
u — S ))
OptionValue ( 1)
* u — S)
ReturnValue (3 ) = (ReturnValue (3 ) — OptionValue ( 0 )) / dt / 365
ReturnValue ( 0) = OptionValue (0 )
If OutputFlag = "p" Then 'Option value
TrinomialTree = ReturnValue (0 )
ElseIf OutputFlag = "d" Then 'Delta
TrinomialTree = ReturnValue ( 1)
ElseIf OutputFlag = "g" Then 'Gamma
TrinomialTree = ReturnValue (2 )
ElseIf OutputFlag = "t" Then 'Theta
TrinomialTree = ReturnValue ( 3 )
ElseIf OutputFlag = a" Then ' All
TrinomialTree = Application . Transpose (ReturnValue )
End If
End Function
Example
To price an American put option with stock price 100, strike price
110, time to maturity of six months, risk-free rate equal to the cost-of-
carry of 10%, volatility 27%, and 30 time steps: TrinomialTree(" p", "a",
"p", 100, 110, 0.5, 0.1, 0.1, 0.27, 30) returns an American put value of
11.6493.
Alternative Trinomial Tree
The above tree was a CRR-equivalent trinomial tree. As already
indicated, there is an unlimited number of sample spaces and cor-
responding probability parameters that can be used to consistently
price an option. Following is another popular set of parameters often
used in the literature:
## 1 At
Pu = g (b — 0-2 12)1
1202
1
Pd = g — (b — 0
2/2)
## 1 At
12a2
2
Pm = 57.4. EXOTIC OPTIONS IN TREE MODELS 303
This implementation yields a negative up probability pu if
a> 2b +
2 2,0 + 6bAt
3A
+
t 3At
and a negative down probability pd if
< '2/3+
3At 3At •
The up probability pu becomes larger than unity if
50 108/25 + 6bAr
0' <
3At 3At
and similarly for the down probability when
50 108/25 + 6bAr
a > 2b + +
3At 3At
For example, cost-of-carry 20%, 20 time steps, and one year to
maturity results in a negative down probability if the volatility is
below 7.63%. This is a realistic scenario, although not a frequently
occurring one. To avoid negative proabilities with this set of param-
eters, we can set the number of time steps n equal to or higher
than
b a2
Integer [3 b T (-1+ —
## 02 Zb ± 1
7.4 EXOTIC OPTIONS IN TREE MODELS
## 7.4.1 Options on Options
In Chapter 4 we looked at analytical formulas for options on European
options. The underlying option can naturally be American style, and
the option on the option can be either European or American. We can,
for example, have an American option on a European option. We thus
have four combinations in total:
• European on European
• European on American
• American on European
• American on American
American on American is naturally the most valuable, ceteris paribus.
Any of these combinations can easily be valued in a binomial or
trinomial tree. Basically all we need to do is to add a few lines of code.
2 2N/1 + 6bAt304 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
Computer algorithm
The algorithm can be used to calculate the value and greeks for options
on options. OutputFlag ="p" returns the option value, OutputFlag
"d" gives the delta, OutputFlag ="g" gives the gamma, OutputFlag =
"t" gives the theta, and OutputFlag = "a" returns a column array
with the price, delta, gamma, and theta. CompoundEurAmeFlag ="e"
gives a European-style compound option; CompoundEurAmeFlag = "a"
gives an American-style compound option. AmeEurFlag = "e" sets
the underlying option to European, and AmeEurFlag = "a" sets the
underlying option to American. CompoundTypeFlag = "cc" gives a call
on a call option, Compound TypeFlag = "cp" gives a call on a put
option, CompoundTypeFlag = "pc" gives a put on a call option, while
CompoundTypeFlag = "pp" gives a put on a put option.
Function BinomialCompoundOption ( OutputFlag As String, _
CompoundEurAmeFlag As String, AmeEurFlag As String, _
CompoundTypeFlag As String, S As Double, X1 As Double, _
X2 As Double, ti As Double, T2 As Double, r As Double, _
b As Double, v As Double, n As Integer ) As Variant
Dim OptionValue ( ) As Double, ReturnValue ( 3 ) As Double
Dim u As Double, d As Double, p As Double
Dim dt As Double, Df As Double
Dim i As Integer , j As Integer , z As Integer, y As Integer , w As Integer
ReDim OptionValue (0 To n + 1)
If CompoundTypeFlag = Or CompoundTypeFlag Then
z = 1
Else
z = —1
End If
If CompoundTypeFlag = "cc " Or CompoundTypeFlag = "cp " Then
y= 1
Else
y = —1
End If
w= 1
dt = T2 / n
u = Exp(v * Sqr( dt ) )
d= 1 / u
p = (Exp(b * dt) — d) / (u — d)
Df = Exp( — r * dt )
For i = 0 To n
OptionValue( i ) = Max( 0 , z * (S * uAi * dA(n — i ) — X1))
Next
For j = n — 1 To 0 Step —1
For i = 0 To j
OptionValue ( i ) = ( p * OptionValue ( i + 1) + ( 1 p) -7.4. EXOTIC OPTIONS IN TREE MODELS 305
OptionValue ( i )) * Df
If AmeEurFlag = "a " Then
OptionValue ( i ) = Max( ( z * (S * u" * d"(j —
— X1 )) , OptionValue ( i ))
End If
If ti >= dt * j And w = 1 Then
OptionValue ( i ) = Max( y * ( OptionValue ( i ) — X2) , 0)
If i = j Then
w = —1
End If
End If
If w = —1 And CompoundEurAmeFlag = "a " Then
OptionValue ( i ) = Max( y * ( OptionValue ( i )
— X2) , OptionValue ( ))
End If
Next
If j = 2 Then
ReturnValue (2 ) = (( OptionValue (2) — OptionValue ( 1))
/ (S * — S ) — ( OptionValue (1) — OptionValue ( 0 ))
/ (S — S * dA2)) / (0.5 * (S * 102 — S * dA2))
ReturnValue (3 ) = OptionValue (1 )
End If
If j = 1 Then
ReturnValue (1 ) = (OptionValue (1 ) — OptionValue ( 0 ))
/ (S * u — S * d)
End If
Next
ReturnValue (3) = (ReturnValue (3) — OptionValue ( 0 )) / (2 * dt ) / 365
ReturnValue (0) = OptionValue (0)
If OutputFlag = "p" Then 'Option value
BinomialCompoundOption = ReturnValue (0 )
ElseIf OutputFlag = "d" Then 'Delta
BinomialCompoundOption = ReturnValue (1 )
ElseIf OutputFlag = "g" Then 'Gamma
BinomialCompoundOption = ReturnValue (2 )
ElseIf OutputFlag = "t " Then 'Theta
BinomialCompoundOption = ReturnValue (3 )
ElseIf OutputFlag = "a" Then
BinomialCompoundOption = Application . Transpose( ReturnValue 0)
End If
End Function
## 7.4.2 Barrier Options Using Brownian Bridge
Probabilities
We can easily value a large number of barrier options combining
Brownian bridge barrier hit probabilities in a binomial or trinomial
tree. The probability that the asset has hit a barrier when it reaches a
given end node in a binomial tree is equal to the probability of reaching
the end node multiplied by the barrier hit probability for that node.306 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
The probability of reaching an end node is
n!
p' (l
i!(n — i)!
and the probability of hitting a barrier from below is
pH =
lexpi
o-LnAt
—2
ln( S
H
)1n( Suidn—i
H
when Suidn—i < H
when Suidn—i > H
The probability of a barrier hit in the option's lifetime for a given
node is given by
n! ; pH
1!(n — i)!
In the case where the barrier is initially lower than the asset price
and the option is down-and-in or down-and-out, simply replace the
barrier hit probability for each node by
i=0
PH ft) =
I expi
o-Ln
—2
In(
SH)
In
(Sui dr")
H ) I when Suidn—i > H
1 when Sui <H
This is a very accurate way to take into account barriers in a binomial
or trinomial tree, and it is also very easy to implement.
Computer algorithm
The code below is a binomial tree that can be used to calculate Euro-
pean up-and-out options as well as down-and-out options. By changing
the payoff function slightly you will be able to value all types of exotic
options with a barrier, for example, powered barrier options. The code
below also takes into account a cash rebate that you get at maturity
if the option is knocked-out.
Function BinomialBridgeBarrier( CallPutFlag As String, S As Double, _
X As Double, H As Double, Rebate As Double, T As Double, _
r As Double, b As Double, v As Double, n As Integer ) As Double
Dim OptionValue As Double
Dim u As Double, d As Double, p As Double
Dim dt As Double
Dim i As Integer , z As Integer
Dim BarrierHitProb As Double, RebateValue As Double
Dim St As Double, PathProb As Double
If CallPutFlag = "c" Then
z = 17.4. EXOTIC OPTIONS IN TREE MODELS 307
ElseIf CallPutFlag = "p" Then
z = —1
End If
dt = T / n
u = Exp((b — v^2 / 2) * dt + v * Sqr(dt))
d = Exp((b — v^2 / 2) * dt — v * Sqr(dt))
p = 0.5
OptionValue = 0
PathProb = 0
For i = 0 To n
St = S * u^i * dA(n — i)
If S > H Then
'I/Probability of hitting barrier below
If St <= H Then
BarrierHitProb = 1
Else
BarrierHitProb = Exp(-2 / (v02 * T)
* Abs(Log(H / S) * Log(H / St )))
End If
ElseIf S < H Then
'11 Probability of hitting the barrier above
If St >= H Then
BarrierHitProb = 1
Else
BarrierHitProb = Exp(-2 / (v^2 * T)
* Abs(Log(S / H) * Log( St / H)))
End If
End If
PathProb = Application.Combin(n, i) * pAi * (1 — p)^(n — i)
OptionValue = OptionValue + (1 — BarrierHitProb)
* PathProb * Max(0, z * (St — X))
RebateValue = RebateValue + BarrierHitProb * Rebate * PathProb
Next
BinomialBridgeBarrier = (OptionValue + RebateValue) * Exp(—r * T)
End Function
## 7.4.3 American Barrier Options in CRR
Binomial Tree
The analytical barrier option pricing formulas presented in Chapter 4
are applicable only to European options. As demonstrated above, it is
straightforward to value a large variety of complex European barrier
options in a European binomial tree.
American barrier options, on the other hand, can only be priced in
full-grown binomial trees. The reason is that we need to check if the
option is optimal to exercise at any node when rolling back through the
tree. For European options, we are only concerned by the end nodes.
The accuracy will, in general, increase with the number of time steps308 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
TABLE 7-1
Number of Time Steps to Use in a
Down-and-Out Option
(s = 50, H = 45, T = 0.5, a = 0.36)
1 2 3 4 5 6 7 8 9 10
F(i) 5 23 52 93 145 210 286 373 472 583
in the tree when you are pricing standard options in binomial trees.
However, when you are pricing barrier options, this is not necessarily
true. If the barrier does not coincide with the nodes, monitoring of the
barrier in the tree will be inaccurate. Boyle and Lau (1994) show that
it is possible to adjust the number of time steps in a CRR binomial
tree to make the barrier fall exactly on or very close to the nodes. To
achieve this, the number of time steps should be set equal to
uaT
F (i) =
[1n( 14)]2
Example
Consider pricing a down-and-out option in a CRR binomial tree. Time
to expiration is six months, the stock price is 50, the barrier is 45,
and the volatility is 36%. How many time steps should you use to get
an accurate value? Using Equation (7.15) and the input parameters
above results in the values shown in Table 7-1. To attain maximum
accuracy for the value of this specific barrier option, one should use
5, 23, 52, ... time steps for the corresponding 1, 2, 3, ... steps i used.
There are several limitations to this method: It works only for
options with a single barrier, and the published approach admits only
constant volatility. Also, if the barrier level varies over time or we are
using a tree with other parameters than the CRR tree, the Boyle and
Lau (1994) method will not work properly. In such cases there is a
much more flexible method developed by Derman, Bardhan, Ergener,
and Kani (1995) that can be used for almost any tree model.
For an American-style down-and-in call option or up-and-in put
(standard barrier option) the method described under the section
"Standard American Barrier Options" in Chapter 4, can be used
in combination with binomial or trinomial trees. Computer code
and Excel spreadsheet using a trinomial tree are included on the
accompanying CD.
## 7.4.4 European Reset Options Binomial
Haug and Haug (2001) developed a modified binomial tree that can
be used to value various reset options. In the setting of Rendleman
i = 1, 2, 3 ... (7.15)7.4. EXOTIC OPTIONS IN TREE MODELS 309
and Bartter (1979), the probability of going up or down in a node
is set equal to One could alternatively have used the approach of
Cox, Ross, and Rubinstein (1979). With the former choice, if p is the
probability that the asset price moves up and (1 - p) is the probability
it moves down, then p = = (1- p). The corresponding sizes of the
up and down moves at each time step, At apart, are
U = e(b—a 2 /2)At+a,176,7 d =
Let n denote the number of time steps and i the state.
European Reset Strike Options
In a plain vanilla reset call (put) option, the strike is reset to the
asset price at a predetermined future time if the asset price is below
(above) the initial strike price. The strike can more generally be reset
to any function of the asset price at future dates. This makes the strike
path-dependent.
For a European reset strike option, the value is simply equal to the
sum of the payoffs multiplied by the corresponding path-dependent
probabilities, discounted at the risk-free interest rate:
m ( i) g(Su
l , c),
n
cr(S, X) = e—rT E y
P(m — j)!(i — j)!(n — — i + j)! 2
j=o i=j
where m is the number of time steps until the reset time, n is the
number of time steps to maturity and g(S, X) = max[S - X, 01, and
Xc = min[aSuidm -J, X]. The constant a determines how much in- or
out-of-the-money the reset strike is.
The method can be made more efficient by considering only paths
that are in-the-money at maturity. This is achieved by replacing
—m+J • x—,n—m+J
witn L where ac( j) = j max[0, aj +1],
Iln(Xc)— ln(Suj d n— j)1
and Int(x) is the integer part of any real number x. 4
A put reset option pr is valued by the same expression as for Cr,
but with g(S, X) = max[X - S, 01 and X p = max[aSuidm -i, X]. Similar
4To derive ac(/), consider the security price at state (j,m), Sr = Suj dm- j, and solve
for those i that ensure that ST > X c: At the subtree starting at (j, m), we initially
sum overj<i<n- m+ j. Substituting k = i - j, ST = Srukd(n—m)—k where 0 <k<
n - m. The truncation aj is obtained by solving the inequality ST > X c for k, ensuring
it is an integer.
a • = Int
ln(u) — ln(d)310 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
TABLE 7-2
Comparison of Closed-Form Solution and the Binomial
Reset Strike Method
The parameters used are S = 100, X = 100, T = 1, r =0.1, b =0.1, and
n = 150. BS denotes the formula of Black and Scholes, for plain vanilla
options; GW denotes the reset formula of Gray and Whaley; HH denotes
the binomial reset method of Haug and Haug.
Volatility
T = 0.25 r = 0.75
BS GW HH GW HH GW HH
Call options
10% 10.3081 10.9337 10.9293 10.8329 10.8384 10.6559 10.6626
20% 13.2697 14.5827 14.5935 14.5658 14.5846 14.2735 14.2936
30% 16.7341 18.5853 18.6258 18.6627 18.6637 18.3078 18.3288
Put options
10% 0.7919 1.1690 1.1649 1.3729 1.3794 1.4969 1.5063
20% 3.7534 4.9384 4.9539 5.3269 5.3511 5.3790 5.4064
30% 7.2179 9.2388 9.2876 9.7922 9.8030 9.7543 9.7854
to the call, the formula for the put can be made more efficient by only
taking into account paths that are in-the-money at maturity: replace
E7=jm+j with Ea , P( ;) , where ap (j) = minimn - m j, j max[0, aj]]
For a standard reset strike option, one could have used the closed-
form formula published by Gray and Whaley (1999); see Chapter 4 on
exotic options. The main advantage of the approach suggested here is
its flexibility. Consider, for instance, a reset power option, with payoff
at maturity equal to g(S, X) = max[S2 - X2, 01. This contract is easily
valued by simply replacing the payoff function.
Table 7-2 compares the closed-form solution of Gray and Whaley
with the Haug and Haug (2001) binomial method, using 150 time
steps. The first column reports values of plain vanilla options, using
the formula of Black and Scholes (1973). It is clear that the Haug
and Haug method yields values that are very close to those of the
closed-form solution.
Reset Strike Barrier Options
We now consider barrier options with strikes that are reset. These are
standard reset options where the strike can be reset at a predefined
future date, with one or more predefined barriers that can knock the
option in or out.
To value these options it is necessary to compute the probability
of hitting a barrier H. The probability of hitting the barrier along7.4. EXOTIC OPTIONS IN TREE MODELS 311
each path can be found analytically using Brownian bridge probabil-
ities; see Brockhaus, Ferraris, Gallus, Long, Martin, and Overhaus
(1999). Consider first an up-and-out call option where the barrier cov-
ers the entire life of the option. If the asset price hits the barrier before
maturity, the option expires worthless. Its value is given by
m n-m+j
m!(n — in)!
E crb(S, X)
= e-rT
j!(m - j)!(i - - m - i j)!
j=0 i=j
)
n
x g(Su l d" , X)[ 1 — p H (j, rn i. n — m)]
2
(7.16)
where m is the number of time steps until the reset time, n is
the number of time steps to maturity, and g(S, X) = max[S — X, 01,
X, = min[aSui , Xi, P H n — m) = PH (i, n1) ± pH (i,n — m) —
PH(f, m)p H (i, n — m) is the probability of hitting the barrier when
going through (j, m) and ending up in (i, n), and
=
I expl
Ln At
The probability of hitting a barrier that covers only the period after
the reset is given by pH (i, n — m). Similarly, the probability for hitting
a barrier that covers only the time period before the reset time is given
by pH (i, m).
Down-and-out barriers can be incorporated in the same way, by
using the appropriate probabilities of barrier hits. Simply define
PH('. n) =
I expl —2
Ln At
S) (Su idn—i )
ln ln
H H ) I when Suidn—i > H
when Sui dn-i < H,
and pH(j,m; i, n — m) as above. Now simply substitute the latter in
place of pH (j,m; i, n — m). For a barrier that covers only the period
after the reset, the probability of hitting the barrier is given by
pH(i, n — m). A barrier that covers only the period before the reset
induces a hit probability equal to pH(j,m).
If the contract specifies different barriers Hs and HE for the periods
before and after reset, respectively, the probability of not hitting any of
the barriers is 1 — pHs (j, m) — pHE (i,n — m) pHs (j,m)pHE (i,n — m)
(this works for up-and-out options too, of course). For barrier put
options, it is only necessary to change the payoff function g(S, X) from
max[S — X, 01 to max[X — S, 01, in the usual way.
—2 in ( S') in ( Sui
V- ) H )
when Suidn —i < H
1 when Suidn—i > H312 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
To value in-options one can use the in/out barrier parity:
In-barrier option = Long out-barrier option — Short plain vanilla option
Consider next a cash rebate K that is paid out at maturity to
the holder of the option if the barrier is hit during its lifetime. We
take this into account by multiplying the rebate by the probability of
hitting the barrier, and then discount the product at the risk-free rate:
e-rTKp li , ,• (i n). Use pH() for a down-and-out option. Use the probabil-
ity of the complementary event to price a rebate that is paid if the
barrier is not hit during the option's lifetime.
In practice, the barrier is monitored at discrete points in time.
Discrete monitoring will naturally decrease the probability of barrier
hits, relative to continuous monitoring. Broadie, Glasserman, and
Kou (1997) developed an approximate correction for pricing formu-
las for discrete barrier options, as discussed in Chapter 4 on exotic
options. It can also be used for our reset binomial method.
Reset Barrier Options
Rather than resetting the strike, we can just as easily reset the barrier.
Consider the case of an up-and-out reset barrier option, where the
barrier is reset the first time it is hit. If the initial barrier covers the
entire lifetime of the option, the option price is given by
m n—m-pj
m!(n — m)! e V V
L-• - j)!(i - j)!(n - m - i j)! (21 )n
-rT
j- =0 1= - J
x g(Su i , X)[1 - pH(1) (j, m; i, n - m)],
where H(j) = min(aSui dm--1 , H), H is the original barrier, and a is a
positive constant that determines how the barrier is reset as a func-
tion of St (this can easily be generalized). Other types of reset barrier
options can be valued in a similar way. The necessary adjustments
are similar to those in the previous discussion.
Reset Time Options
Someone who is long a call or put when the underlying moves are
in an unfavorable direction will benefit from extending the time to
maturity of the option. With the above reset binomial method, it is
easy to value options where the time to maturity is reset. Consider a
call option, and assume the time to maturity is reset at a future date
r =m At if the asset price is a predetermined percent out-of-the-moneym n_m±i
(s, x) = E E
.J=0
(Onmax[Sc(i, j)— X, 0],
m
Dc "1 (i, j!( _jwi._";(n m)! — m — .. 1)!
(7.17)
Dc (i, j)=
For a put option, the price is given by
i
e—rnAt when aSui < X
e—rmAt when aSui > X
where
and
and
when aSuj > X
when aSuj < X
Suidn—i when aSuid'i > X
Sp(i, j) = I . . Sul dm— i when aSu1 dm1 <X
e—rmAt
l
e—rnAt
7.4. EXOTIC OPTIONS IN TREE MODELS 313
(alternatively, in-the-money). Its price is given by
where
Suidn—i when aSuidm— i < X
Sc(i, D = dm—i when aSu1 dm1 > X
and
m n—m+.1
m!(n — m)!
13,7 - (S , X) = E E Dp(i, Dpon _ — j)!(n — m — i
j=0 i=j
x max[X — Sp(i,
2
(7.18)
le—rnAt when aSui dm— i > X
e—rmAt when aSuidm— .1 < X
Dp (i, j) =
Longstaff (1990) derives a closed-form solution for these reset time
options, known as writer-extendible options and covered in Chapter 4.
As before, the binomial reset method offers more flexibility and can
be used to value a larger class of reset time options. With the latter
method, reset time options can be combined with reset strikes and
barriers. One can, for instance, extend the method to a call where
the time, strike, and barrier are reset as a function of the asset price
at a predetermined future date. Table 7-3 gives an indication of how
accurate this method is. It compares the method just presented to
Longstaff's closed-form solution.
For a given number of time steps, the reset time method is some-
what less accurate than the reset strike method. In other words, it314 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
TABLE 7-3
Comparison of Closed-Form Solution and the
Binomial Reset Time Method
The parameters used are S = 100, X = 100, T = 1, r =0.1, b = 0.1, and
n = 200. Longstaff denotes the formula of Longstaff (1990). HH
denotes the binomial reset time method of Haug and Haug.
Volatility
r =0.25 r =0.5 r =0.75
Longstaff HH Longstaff HH Longstaff HH
Call options
10% 5.2526 5.4007 6.6644 6.6167 8. 3941 8.3271
20% 8.1299 8.3793 9.7562 9.7096 11.4691 11.3562
30% 10.9954 10.7393 12.9565 13.0889 14.8446 15.0490
Put options
10% 1.2216 1.2112 1.1417 1.1532 0.9844 1.0015
20% 3.8839 3.8111 4.0780 4.1074 3.9962 4.0557
30% 6.7096 6.8574 7.2482 7.1952 7.3589 7.2203
is slower to converge. This is especially pronounced when the time to
reset is short relative to the time to maturity. In this case, the grid
is too coarse at the time of reset. This can be ameliorated either by
increasing the total number of time steps in the tree or by locally
making the grid finer (Figlewski and Gao, 1999). The latter tech-
nique offers better computational efficiency but is more complex to
implement.
## 7.4.5 American Asian Options in a Tree
Valuing an arithmetic average rate option in a standard lattice will,
under normal circumstances, lead to a nonrecombining tree. The num-
ber of nodes in nonrecombining trees grows exponentially with the
number of time steps. These trees, therefore, tend to be slow in many
applications. To my knowledge, no closed-form solution has been pub-
lished for American Asian options. 5 Valuing American-style Asian
options (aka Hawaiian options) requires a special tree implementa-
tion, first described by Hull and White (1993) and later improved by
Cho and Lee (1997), and Chalasani, Jha, Egriboyun, and Varikooty
(1999). The method reduces the number of states by using an inter-
polation technique when "rolling back" through the tree. The method
is reasonably efficient but is still only an approximation that does
5Hansen and Jorgensen (1997) have published a model for American Asian options
using numerical integration.7.5. THREE-DIMENSIONAL BINOMIAL TREES 315
not necessarily converge to the analytical solution as the number
of time steps is increased. Dai, Huang, and Lyuu (2002) claim that
the Hull and White (1993) value represents an upper bound for the
option value. Computer code in VBA and an Excel spreadsheet for the
Hull-White Asian option tree is included on the accompanying CD.
See also the book of Clewelow and Strickland (1998) for more details
on implementing the method. Dai and Lyuu (2002) have developed a
more accurate method that seems to be preferable to the methods just
discussed.
7.5 THREE- DIMENSIONAL BINOMIAL TREES
Rubinstein (1994b) has published a method to construct a three-
dimensional binomial model that can be used to price most types of
options that depend on two assets—both European and American. 6
Examplesofoptionsthatcanbevaluedareasfollows:
Spread options:
Options on the maximum:
Options on the minimum:
Dual-strike options:
Reverse dual-strike options:
Portfolio options:
Options to exchange
one asset for another:
call: max[0, Q1 S1 — Q2S2 — X]
put: max [0, X + Q2S2 — QiSil
call: max[0, max( Qi Si , Q2S2) — XI
put: max[0, X — max(Qi Si , Q2 S2)1
call: max[0, min( Qi Si , Q2S2) — X]
put: max[0, X — min(Qi Si , Q2S2)]
call: max[0, (Q1 S1 — X1), ( Q2 S2 — X2)]
put: max[0, (Xi — Q1 S1), (X2 — Q2 ,52)]
call: max[0, (Q t Si — X1), (X2 — Q2 S2)]
put: max[0, (Xi — Q1 S1), ( Q2 S2 — X2)]
call: max[0, (Q1 S1 + Q2S2) — X]
put: max[0, X — (Q 1 Si + Q2S2)]
max[0, Q2S2 — Qi Si l
Relative performance
options:
Product options:
call: max [0, S'2s s2 ' X]
put: max [0, X Ss2 I2s1 ]
call: max[0, Q1 S1 Q2S2 — X]
put: max[0, X — QiSi Q2S2]
where Qi and Q2 are the fixed quantities of the two different assets.
In the three-dimensional binomial model, asset 1 can increase with
a factor of u or decrease with a factor of d at each time step. If asset
6An alternative would be to use a three-dimensional trinomial tree as described by
Boyle (1988) and later simplified by Cho and Lee (1995).316 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
TABLE 7-4
Examples of Call Values
The parameters used are Si = 122, S2 = 120,
X = 3, r =0.1, b1 = b2 = 0, and n =100
a1 a2
T = 0.1 T = 0.5
P = -0.5 p = 0 p = 0.5 p = -0.5 p = 0 p = 0.5
European Values
0.20 0.20 4.7554 3.8008 2.5551 10.7566 8.7080 6.0286
0.25 0.20 5.4297 4.3732 3.0098 12.2031 9.9377 7.0097
0.20 0.25 5.4079 4.3469 2.9743 12.1521 9.8811 6.9323
American Values
0.20 0.20 4.7630 3.8067 2.5590 10.8754 8.8029 6.0939
0.25 0.20 5.4385 4.3802 3.0145 12.3383 10.0468 7.0858
0.20 0.25 5.4166 4.3538 2.9790 12.2867 9.9897 7.0082
1 increases with u, asset 2's price can change by A or B. If asset 1
decreases with d, asset 2's price can change by C or D. By setting
A 0 C and B D, one can construct nonzero correlation between the
two assets.
u = exp(gi At ± ai,s/Tt) d = exp(gi At - /K),
where
jt = b - 01/2 ott2 = b2 - q/2
and
A = exp[it2At ± 02,17 t (p II 1 - p2)]
B = exp[ft2At a2N/Tt(p - 111 - p2)]
C = exp[ft2At - a2,1 t(p -111 - p2)]
D = exp[plAt - 02,1,7d (p - p2)]
Table 7-4 shows European and American spread option values
generated using a three-dimensional binomial tree with 100 time
steps.
Number of Nodes in Two-Factor Binomial Tree
By counting the number of time steps from 0, as we have been doing
above, we find that the number of nodes in the two-factor binomial
(n-1-1)(n-1- 62)(2n-1-3)
tree is Similarly, counting the number of time steps
n+1)6(2n-I-1)
from 1 results in n(
nodes.7.5. THREE-DIMENSIONAL BINOMIAL TREES 317
Application
American spread options are traded on the New York Mercantile
Exchange on oil products. The heating oil crack is an option on the
spread between heating oil and crude oil. The gasoline crack is an
option on the spread between unleaded gasoline and crude oil. Crack
spread options are useful to oil refineries for hedging purposes.
Maximum, minimum, and dual-strike options have been traded
in the OTC market on commodities and stock indexes. The three-
dimensional binomial model is extremely flexible. Adding a new type
of option to the model can, in most cases, be achieved by a small
adjustment in the payoff function.
Computer algorithm
The function can be used to build a complete three-dimensional bino-
mial tree. Setting the value of TypeFlag determines what kind of
option value that is estimated: TypeFlag = 1 returns the value of a
spread option, TypeFlag = 2 returns the value of an option on the max-
imum of two assets, TypeFlag = 3 returns the value of an option on
the minimum of two assets, TypeFlag = 4 returns the value of a dual-
strike option, TypeFlag = 5 returns the value of a reverse dual-strike
option, TypeFlag = 6 gives the value of a two-asset portfolio option,
TypeFlag =7 returns the value of an option to exchange one asset for
another, TypeFlag = 8 gives the value of an outperformance option,
while TypeFlag = 9 returns the value of an product option. Setting the
AmeEurFlag equal to "e" gives European option values, and "a" gives
American option values. Setting the CallPutFlag equal to "c" or "p"
gives a call or put value, respectively.
Public Function ThreeDimensionalBinomial(TypeFlag As Integer, _
AmeEurFlag As String, CallPutFlag As String, Si As Double,
S2 As Double, Q1 As Double, Q2 As Double, X1 As Double, _
X2 As Double, T As Double, r As Double, _
bl As Double, b2 As Double, vi As Double, v2 As Double, _
rho As Double , n As Integer) As Double
Dim OptionValue() As Double
Dim dt As Double, u As Double, d As Double
Dim mul As Double, mu2 As Double
Dim Y1 As Double, y2 As Double
Dim NodeValueS1 As Double, NodeValueS2 As Double
Dim i As Integer , j As Integer , m As Integer
ReDim OptionValue(0 To n + 1, 0 To n + 1)
dt = T / n
mul = bl — v1^2 / 2
mu2 = b2 — v2^2 / 2
u = Exp(mul * dt + vi * Sqr(dt))
d = Exp(mul * dt — vi * Sqr(dt))
For j = 0 To n318 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
Y1 = (2 * j — n) * Sqr(dt)
NodeValueS1 = Si * u^j * d A (n — j)
For i = 0 To n
NodeValueS2 = S2 * Exp(mu2 * n * dt) * Exp(v2 * (rho * Yl_
+ Sqr(1 — rho^2) * (2 * i — n) * Sqr(dt)))
OptionValue(j , i) = PayoffFunction(TypeFlag, _
CallPutFlag , NodeValueS1, NodeValueS2, Ql, Q2, Xl, X2)
Next
Next
For m = n — 1 To 0 Step —1
For j = 0 To m
Y1 = (2 * j — m) * Sqr(dt)
NodeValueS1 = Si * u^j * clA(m — j)
For i = 0 To m
y2 = rho * Y1 + Sqr(1 — rho^2) * (2 * i — m) * Sqr(dt)
NodeValueS2 = S2 * Exp(mu2 * m * dt) * Exp(v2 * y2)
OptionValue(j , i) = 0.25 * (OptionValue(j , i) _
+ OptionValue(j + 1, i) + OptionValue(j , i + 1) _
+ OptionValue(j + 1, i + 1)) * Exp(—r * dt)
If ArneEurFlag = "a" Then
OptionValue ( j , i ) = Max( OptionValue ( j , i ) , _
PayoffFunction (TypeFlag , CallPutFlag , NodeValueS1, _
NodeValueS2 , Qi , Q2, Xl, X2))
End If
Next
Next
Next
ThreeDimensionalBinomial = OptionValue(0, 0)
End Function
Function PayoffFunction(TypeFlag As Integer, CallPutFlag As String, _
## 51 As Double, S2 As Double, Q1 As Double, Q2 As Double, _
X1 As Double, X2 As Double) As Double
Dim z As Integer
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
If TypeFlag = 1 Then 'II Spread option
PayoffFunction = Max(0 , z * (Q1 * Si — Q2 * S2) — z * X1)
ElseIf TypeFlag = 2 Then 'II Option on the maximum of two assets
PayoffFunction = Max(0 , z * Max(Q1 * Si, Q2 * S2) — z * X1)
ElseIf TypeFlag = 3 Then 'II Option on the minimum of two assets
PayoffFunction = Max(0 , z * Min(Q1 * Si, Q2 * S2) — z * X1)
ElseIf TypeFlag = 4 Then 'II Dual strike option
PayoffFunction = Application .Max(0 , z * (Q1 * Si — X1) _
z * (Q2 * S2 — X2))
ElseIf TypeFlag = 5 Then 'II Reverse—dual strike option
PayoffFunction = Application .Max(0 , z * (Q1 * Si — X1), _
z * (X2 — Q2 * S2))
ElseIf TypeFlag = 6 Then 'II Portfolio option
PayoffFunction = Max(0, z * (Q1 * Si + Q2 * S2) — z * X1)7.5. THREE-DIMENSIONAL BINOMIAL TREES 319
ElseIf TypeFlag = 7 Then 'II Exchange option
PayoffFunction = PayoffFunction = Max( 0 , Q2 * S2 — Ql * Si)
Els eIf TypeFlag = 8 Then 'II Outperformance option
PayoffFunction = Max( 0 , z * (QI * Si / (Q2 * S2) — Xi))
Els eI f TypeFlag = 9 Then 'II Product option
PayoffFunction = Max( 0 , z * (QI * Si * Q2 * S2 — X1))
End If
End Function
Two-Asset European Binomial
For non-path-dependent European options, it is possible to simplify
Rubinstein's three-dimensional binomial tree. In this case, we need
only be concerned with the end nodes of the tree when computing
option values. This makes the implementation simpler and thus more
efficient than for the full version of the method.
The number of paths to a node when counting from zero is
n!n!
i!(n — i)!j!(n — j)!'
where j is the number of price increases of asset one and i is the
number of price increases of asset two. The probability of ending at a
specific end node is
n!n!
0.25n
i!(n — j!(n — j)!
The value of any non-path-dependent European two-asset option
can then simply be computed as
n!n!
i!(n — i)!P(n — j)!
f=0i=0
0.25n g[Si(T), S2( 7')],
n n
C = e—rT EE
where
(T) = Siu- dn— i
S2(T) = S2 exPrit2 ±a2(/)(2/ — n) + 111 — p2(2i —
where
u = exp(it At + d = exp(it lAt — ,s/Ya )
kt1 = — 412 kt2 = b2 —
and
g[Si(T), S2(7')]
can be any payoff at maturity that depends on the price of the two
assets.320 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
Computer algorithm
The following algorithm implements a three-dimensional European
binomial tree. The value of TypeFlag determines what kind of option
value is being estimated: TypeFlag = 1 returns the value of a spread
option, TypeFlag = 2 returns the value of an option on the maximum
of two assets, TypeFlag = 3 returns the value of an option on the
minimum of two assets, TypeFlag = 4 returns the value of a dual-
strike option, TypeFlag = 5 returns the value of a reverse dual-strike
option, TypeFlag = 6 gives the value of a two-asset portfolio option,
TypeFlag = 7 returns the value of an option to exchange one asset for
another, TypeFlag = 8 gives the value of an outperformance option,
while TypeFlag = 9 returns the value of an product option. Setting the
CallPutFlagequal to "c" or "p" gives a call or put value, respectively.
Function ThreeDimensionalBinomiaEuropean(TypeFlag As Integer, _
AmeEurFlag As String, CallPutFlag As String, Si As Double, S2 As Double,
Q1 As Double, Q2 As Double, X1 As Double, X2 As Double, T As Double, _
r As Double, bl As Double, b2 As Double, vi As Double, v2 As Double, _
rho As Double, n As Integer) As Double
Dim dt As Double, u As Double, d As Double
Dim myl As Double, my2 As Double
Dim Y1 As Double, y2
Dim NodeValue51 As Double, NodeValue52 As Double
Dim i As Integer , j As Integer
Dim sum As Double
Dim PatheProbability As Double
dt = T / n
myl = bl — v1^2 / 2
my2 = b2 — v2^2 / 2
u = Exp(myl * dt + vi * Sqr(dt))
d = Exp(myl * dt — vi * Sqr(dt))
For j = 0 To n
NodeValueS1 = Si * u^j * dA(n — j)
For i = 0 To n
NodeValueS2 = S2 * Exp(my2 * T + v2 * (rho * (2 * j — n) _
+ Sqr(1 — rho^2) * (2 * i — n)) * Sqr(dt))
PatheProbability = Application .Combin(n, i) _
* Application.Combin(n, j) * 0.25An
sum = sum + PatheProbability _
* PayoffFunction (TypeFlag , CallPutFlag ,
NodeValueS1, NodeValueS2, Ql, Q2, Xl, X2)
Next
Next
ThreeDimensionalBinomiaEuropean = sum * Exp(—r * T)
End Function7.6. IMPLIED TREE MODELS 321
7.6 IMPLIED TREE MODELS
The implied tree model represents a development in option pricing
that has received much attention both from practitioners and
academics. The main idea is to use information from liquid options
with different strikes and maturities to build an arbitrage-free model
that contains all relevant valuation information implied by market
prices. The idea of implied tree models was published in 1994 by
Dupire (1994), Derman and Kani (1994), and Rubinstein (1994a). The
method was later discussed and extended by Barle and Cakici (1995),
Rubinstein (1995a), Derman, Kani, and Chriss (1996), Buchen and
Kelly (1996), Chriss (1996), Jackwerth and Rubinstein (1996), and
others.
The implied tree model discretizes an asset price process and lets
the local volatility be a function of both the price level of the underlying
asset and time:
dS = it(t)Sdt +a(S,t)Sdz
This differs from the geometric Brownian motion used in the Black-
Scholes-Merton (BSM) economy:
dS = btSdt +aSdz
The local volatility in the BSM economy is constant throughout the
lifetime of the option. The volatility function in the implied tree a (S, t)
is estimated numerically from the volatility smile given by the prices
of liquid options. In this way, the implied tree model is calibrated to
be arbitrage-free relative to observed options prices. The model can
be used to price exotic options and other derivatives whose prices are
not used to calibrate the model. The next two subsections show how
to build implied binomial and trinomial trees.
## 7.6.1 Implied Binomial Trees
In this section we concentrate on the Derman and Kani (1994) implied
binomial model. The following figure illustrates an implied binomial
tree where the asset prices for time step n = 1 has already been
solved for.322 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
In general, if we at time n wish to find the unknown parameters at
time n 1, then there are 2n ± 3 unknown parameters to solve for: 7
• n ±2 asset prices Sn+1,i
• n 1 unknown risk-neutral transition probabilities p,,, from
node (n, i) to node (n 1, i 1)
There are 2n ± 2 known quantities:
• n 1 forward prices F, z__ sn,iebAt
• n 1 option prices c,,,i expiring at time Tn±i
where n is the time step and i is the state. The remaining degree of
freedom is used to center the implied binomial tree around the center
of the standard Cox, Ross, and Rubinstein (1979) binomial tree.
The implied binomial tree is constructed by forward induction
and the use of Arrow-Debreu prices A. Arrow-Debreu prices repre-
sent prices of primitive securities: A n•, is the price today of a security
that has a cash flow of unity in state i at time n and a cash flow of
zero elsewhere. The Arrow-Debreu prices for the next step n 1 are
given by
Pn,n)Lti,ri when i = n +1
er At =
— when 1 < i < n +1
(1 — Pn,014,0 when i = 0
A2,2
0
By solving for the (2n ± 3) unknown parameters using the (2n + 2)
known parameters and by centering the tree around the center of the
CRR tree, Derman and Kani get the following equations for the asset
prices above the central node:
Sn+1,i[er'At c(Sn,t;Tn+1) — El — Xn,iSn,t(F0,1 S,,+1,1)
Sn+1,1+1 =
7This is somewhat different from the Derman and Kani (1994) paper, which has 2n 1
unknown parameters. The reason is that we start counting the initial node as time
step 0, not 1 as in the Derman and Kani paper. The result is, of course, the same. We
do this to be consistent with the other tree models described in this chapter.
[erAt c(sn,i; (7.19)
T,,+1) Sn+1,i)7.6. IMPLIED TREE MODELS 323
where E = En. . •(F • — S •) and Fn,1 j=i+1 n,j n,t
= sn,jebAt The term
c(Sn,i ; Tn+1) is the price of a European call with strike equal to the
known asset price So and time to maturity Tn±i. The asset prices
below the central node is given by
sn+1,i+1 [erAt p(Sn,i; Tn+i) - E] + An,i F ( n,i
Sn+i,i =
Sn+1,i+1)
(7.20) [erAt p(sn, .. . (P
n+1) — n,i — S+1+1)
where E = Ej=0Xn,i(So — Fn,1), and p(Sn,i; Tn+1) is the price of a
European put with strike equal to the known asset price So and time
to maturity Tn+1 (not to be confused with the probability po). The
transition probability at any time step is given by
— Sn+i,i
= (7.21)
an+1,i+1 Sn+1,i
How to Start Building a New Level of the Tree
If we know Sn+ ,, at one initial node, we can use these equations to
find the implied asset price for all nodes above and below the center
of the tree.
1. If the number of time steps n already solved for is odd: The
initial central node Sn+ is set equal to the central node of the
CRR tree.
2. If the number of time steps n already solved for is even: Use the
logarithmic CRR centering condition Sn+ = S2/Sn+i,i+ , where
S is today's asset price. Substituting this relation into (7.19)
gives
Sn+1,1-1-1
S[er At c(S; Tn+1) An,iS E]
An,i Fn,i — er At C(S; T+1) E
where
E = E A(F Sn,i)
j=i+1
From the implied asset prices and probabilities, we can find the
implied local volatilities at each node:
crn,i = Pn,i(1 — Pn,i)in(Sn-1-1,i-1-1
Implied Binomial Tree Example
Construct a five-year implied binomial tree with annual time steps.
Assume that the stock price is 100, the risk-free rate is 5%, and the
at-the-money volatility is 15% and increases (decreases) 0.5% with
every 10-point drop (rise) in the strike price. The 90 strike will trade
(7.22)324 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
for 15.5% volatility, and the 110 strike for 14.5% volatility. The results
below show a standard binomial tree together with the implied bino-
mial tree, its transition probabilities, Arrow-Debreu prices, and local
volatilities at each node.
CRR binomial tree with constant volatility 15% where u = eo.15,/i
1.162, d = =0 . 8 6 1 , and a constant up probability equal to p
eo05)(1_0.861
= 0.633:
Derman-Kani Implied Binomial Tree
Transition Probabilities
1.162-0.861Local Volatilities
7.6. IMPLIED TREE MODELS 325
Arrow-Debreu Price Tree
To illustrate the procedure of constructing an implied binomial
tree, let's look at the calculations of a few nodes in detail. We start
with the calculation of the implied stock price at node A:
oo[eo.o5x1c(s; Tn+1) lx 100 — E] =
116.18, SA = S1, 1 =
1 x F — e° °5x 1c(S; Tn+i) + E
where c(X = 100; T =1; a = 15%) = 9.74 and Fn,i = F0,0 = 100e 5x I =
105.13. Since there are no stock prices above this node, the s-term is
zero. The implied stock price at node B is
SB = S1,0 = S2/S1,1 = 1002/116.18 = 86.07,
while the up transition probability leading to node A is
105.13 — 86.07
P00— =0.633
116.18 — 86.07
The Arrow-Debreu prices are thus
0.051 X1,1 = 0.633 x 1e 5> —= 0.602326 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
and
= (1 — 0.633)1e-0 05x1 _ 0.349
We can now solve for the stock prices and transition probabilities
at the next time step. Since the number of time steps n = 1 already
solved for is odd, the initial stock price is set equal to the central node
of the CRR tree S2,1 = 100. The stock prices above the center node can
now easily be found by using equation (7.19).
100 [e0.05x1 c(so; Tn+1, _ ) E] — 0.602 x 116.18(F0 — 100)
Sc = S2,2 = [e0.05 x 1 c(so Tn+i) — El — 0.0602(F,0 — 100)
= 131.94,
where c(X = 116.18; T = 2; a = 14.19%) = 6.25, and Fo = F1,1 =
116.18e0.05x 1 = 122.14. Since there are no stock prices above this node,
the E-term is zero. Below the central node we get
100 [e° °5x1 p(Sn,i; Tn+1) — E] ± 0.349 x 86.07(Fn,, — 100)
= 70.49,
where p(X = 86.07; T = 2; a = 15.7%) =1.67 and F,,, = F1,0 =
86.07e0.05 x 1 = 90.48. Since there are no stock prices below this node,
the s-term is zero. The two transition probabilities leading to these
nodes are
122.14— 100.00
=0.693 P1,1 = 131.94— 100.00
90.48 — 70.49
= 0.678 P1,0 =
100.00 — 70.49
At node E, the number of time steps n 1 = 5 is odd. We can now
find the implied stock price using equation (7.22):
100[e0.05x1 c(s;
SE = S5,3 =
Tn+i) +0.227 x 100 — ]
116.47,
0.227Fn,i — e0.05x 1 c(S; Tn+i)± E
where c(X = 100.00; T =5; a =15%) =26.17 and F,,,i = 100e°.°5 x 1 =
105.13. Since there are two nodes above this node, the s-term is
equal to
4
E = E =0.294(132.13e0.05xi _ 100)
j=2+1
0.191(163.24e"5x1 — 100) = 25.15
SD = S2,0 = [e0.05x 1 p(smi Tn+i) — E] +0.349(F, — 100)7.6. IMPLIED TREE MODELS 327
## 7.6.2 Implied Trinomial Trees
The implied binomial model can run into problems when one is
matching some common volatility structures. In particular, negative
transition probabilities can occur in several cases. One will then need
to override the input data. However, the more data one overrides the
less information from market prices will be reflected in the model.
A trinomial tree offers more flexibility and can match a larger class
of volatility structures than its binomial counterpart. In an implied
trinomial model, the state space can be chosen independently of the
probabilities. The option prices are then used only to solve for the
transition probabilities. We concentrate on constructing an implied
trinomial tree using the method described by Derman, Kani, and
Chriss (1996).
The transition probabilities above the center node of the tree are
given by
er AT c(snni Tn+i) _ X1 (F,1 1 —
Xn.i (Sn+1,i +2 — Sn+1,i +1)
Pn,i (Sn+1.i +2 — Sn+1,i+1) Sn+1,i+1
Sn+1,i+1
The transition probabilities below and including the center node of
the tree are given by
er4Tp(So, Tn+1)
i-1
EJ--o xn,i (sn±l'i+1 Fn'1)
Xn,i (Sn+1,i +1 — Sn+1,i)
F,1,1 qn,i (Sn+1,i +1 — Sn+1,1) Sn +1.1+1
Sn+1,i+2 Sn+1,i +1
In case of negative transition probabilities, one should try to choose
another state space that better fits the volatility structure. Alter-
natively, one can override the negative probabilities. One way to
ensure that the probabilities lie between zero and one is to set the
probabilities equal to
If S,1+ 1,j+ 1 < F,1, < +2
F,,,Sn+1,i+1 Fn,i Sn+1,i
z (3n +1,i+2 — Sn+i,j+1 Sn+1,i+2 Sn+1,i
Pn,i = 1
1 ( Sn-4-1,i +2 — F,,1
q" — 2 S,1+) +2 — Sn+1,i
q11,1
(7.23)
(7.24)
qn,i
Pn,i =
(7.25)
(7.26)328 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
and if Sn +la < F,, < Sn+14+1, then
1 (' Fn,i — Sn+1,i
Pn'i = 2 1%, Sn+1,i+2 Sn+1,i
1 ( Sn+1,0-2— Fn,i Sn-1-1,0-1
qn,i =
2 Sn+i,i+2 Sn+1,i Sn±] ,i+i — Sn+Li
The transition probabilities at each time step can be used to
calculate implied local volatilities for corresponding nodes in the tree.
and [Pn,r (5,1+1,1+2 — F0)2 + (1 — Pn,i qn,t)(Sn+1,t+1 — F0)2
qn i(Sn+1,1 — F0)211(F0 At)1 1/2 (7.27)
where Fo =-- p, Sn+1,/ +2 ± ( 1 — Pn,1 — qn,I)Sn+1,i +1 ± qn,z Sn+i,i •
Example
Assume the stock price is 100, the time to maturity is two years,
the risk-free rate is 8%, the dividend yield is 6%, the at-the-money
volatility is 12%. Assume moreover a volatility structure where
the volatility increases (decreases) with 0.04% for every one-point
decrease (increase) in the strike price. A strike price of 110 would
then trade for 11.6% and a strike of 90 for 12.4% volatility. Build a
two-year implied trinomial tree model with four time steps. S = 100,
T = 2, r =0.08, b = 0.08 — 0.06 = 0.02, a =0.12, n = 4, At = 2/4 = 0.5.
By choosing a trinomial equivalent CRR binomial tree (u =
and d = we get the following stock price tree (state space):
By using equations (7.23), (7.24), (7.25), and (7.26), we can solve
for the transition probabilities, the Arrow-Debreu prices, and the local7.6. IMPLIED TREE MODELS 329
volatilities at each node. To illustrate the calculation procedure, let's
look at the calculation at node A:
e0.08x0.5 p(100, 0.5) — • (S • — F .1=o n+1,i+1 n,
1(100 — 88.69)
The put price with strike 100, time to maturity six months, and volatil-
ity 12% is equal to 2.4333 in a standard trinomial tree with the same
state space. The summation term ri .-110 j(Sn+1,i+1 — is equal
to zero, since there are no nodes below this node.
Fn ±0.2240(100.00 — 88.69) — 100.00
P0,0 — = 0.2775
112.75 — 100.00
= F0,0 = 00e0.02 x0.5 = 101.01. The local volatility at this node is
a0,0 = 1[0.2775(112.75 — F0) 2 ± (1 — 0.2775 — 0.2240)(100.00 — F0)2
± 0.2240(88.69 — F0) 2]/(F(j x 0.5)1
1/2
= 0.1194,
where
F0 = (0.2775 x 112.75 ± 0.2240 x 88.69
± (1 — 0.2775 — 0.2240)100.00)e002x" = 102.02
As a last example, let's look at the calculations at node B:
eo.o8xo.5c(112.75, 2) — E.In _i+1An,j(Fnj S 0- n+1,1)
= 0.2476 P3,4 =
0.2440(127.12 — 112.75)
The price of a call option with strike 112.75, time to maturity two
years, and volatility 0.12 + (100.00 — 112.75)0.0004 = 0.1149 is equal to
2.8198. j 2.n i+1 xn,
2x3
E =0.1024(127.12e0.02x0.5_ 112.75)
1=4+1
0.0145(143.33e 2x" —112.75) = 2.07,
while the down probability equals
F — 0.2476(127.12 — 112.75) — 112.75
43,4 = n' — 0.1903,
100.00 — 112.75
and Fn,i =
F3,4 = 112.750.02x0.5 = 113.88. The local volatility is
=110.2476(127.12 — F0)2 + (1 — 0,2476 — 0.1903)(112.75 — F0) 2
+0.1903(100.00—F0) 21/(FP x 0.5)1 = 0.1116,
= 0.2240
j(Fn ,j — is equal to
(7.28)Down-Transition Probabilities
330 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
where
F0 = (0.2476 x 127.12 + 0.1903 x 100.00
± (1 — 0.2476 — 0.1903)112.75)e"2x 5 = 115.03
Up-Transition Probabilities
0.1703
0.2224
B : 0.2476
0.2717
0.3109
0.4048
0.4692
0.1032
0.1619
B : 0.1903
0.2175
0.2617
0.3675
0.4402
Arrow-Debreu Price Tree7.6. IMPLIED TREE MODELS 331
Implied Local Volatilities
Computer algorithm
The computer code can be used to build a complete implied trinomial
tree. For simplicity, the volatility smile is set to be a linear function of
the strike price. The input parameter Skew will decide the steepness
of the volatility smile/skew. For instance, setting the Skew equal to
0.0004 will give a volatility smile/skew as in the numerical example
above. In practice, the volatility function should naturally be adjusted
to reflect the real implied volatilities. By specifying the "ReturnFlag,"
the code will return
"TJPM' A matrix of implied up transition probabilities.
"DPM" A matrix of implied down transition probabilities.
"LVM" A matrix of implied local volatilities.
"ADM" A matrix of Arrow-Debreu prices at a single node.
"DPni" The implied down transition probability at a single node.
"ADni" The Arrow-Debreu price at a single node (at time step STEPn and state STATEn).
"LVni" The local volatility at a single node.
"c" The value of a European call option.
"p" The value of a European put option.
The code calls the TrinomialTree(.) function to calculate option prices used to calibrate the implied trinomial
tree. The chosen state space in the computer code is the trinomial equivalent CRR binomial state space.
However, the state space could easily be changed by modifying the code slightly.
Function ImpliedTrinomialTree(ReturnFlag As String, S.I.EPn As Integer, _
STATEi As Integer, S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double, _
Skew As Double, nSteps As Integer)
Dim ArrowDebreu() As Double
Dim LocalVolatility() As Double
Dim UpProbability() As Double
Dim DownProbability() As Double
Dim OptionValueNode() As Double
Dim dt As Double, u As Double, d As Double
Dim Df As Double, pi As Double, qi As Double
Dim Sil As Double, Si As Double, 5i2 As Double332 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
Dim vi As Double, Fj As Double, Fi As Double, Fo As Double
Dim sum As Double, OptionValue As Double
Dim i As Integer , j As Integer , n As Integer , z As Integer
ReDim OptionValueNode(0 To nSteps * 2) As Double
ReDim ArrowDebreu(0 To nSteps, 0 To nSteps * 2) As Double
ReDim UpProbability(0 To nSteps — 1 , 0 To nSteps * 2 — 2) As Double
ReDfin DownProbability(0 To nSteps — 1, 0 To nSteps * 2 — 2) As Double
ReDirn LocalVolatility(0 To nSteps — 1, 0 To nSteps * 2 — 2) As Double
dt = T / nSteps
u = Exp(v * Sqr(2 * dt))
d = 1 / u
Df = Exp(—r * dt)
ArrowDebreu(0, 0) = 1
For n = 0 To nSteps — 1
For i = 0 To n * 2
sum = 0
Sil = S * u^Max(i — n, 0) * d^Max(n * 2 — n — i , 0)
Si = Si! * d
5i2 = Sil * u
Fi = Sil * Exp(b * dt)
vi = v + (5— Sil) * Skew
If i < (n * 2) / 2 + 1 Then
For j = 0 To i — 1
Fj = S * u^Max(j — n, 0) * d^Max(n * 2 — n — j , 0) _
* Exp(b * dt)
sum = sum + ArrowDebreu(n, j) * (Sil — Fj)
Next
OptionValue = TrinomialTree("e", "p", S, Sil , (n + 1) _
* dt, r, b, vi, n + 1)
qi = (Exp(r * dt) * OptionValue — sum) _
/ (ArrowDebreu(n, i) * (Sil — Si))
pi = (Fi + qi * (Sil — Si) — Sil) / (5i2 — Sil)
Else
OptionValue = TrinomialTree("e", "c" , S, Sil, (n + 1) _
* dt, r, b, vi, n + 1)
sum = 0
For j = i + 1 To n * 2
Fj = S * u^Max(j — n, 0) _
* d^Max(n * 2 — n — j , 0) * Exp(b * dt)
sum = sum + ArrowDebreu(n, j) * (Fj — Sil)
Next
pi = (Exp(r * dt) * OptionValue — sum) _
/ (ArrowDebreu(n, i) * (5i2 — Sil))
qi = (Fi — pi * (5i2 — Sil) — Sil) / (Si — Sil)
End If
'II Replacing negative probabilities
If pi < 0 Or pi > 1 Or qi < 0 Or qi > 1 Then
If Fi > Sil And Fi < Si2 Then
pi = 1 / 2 * (( Fi — Sil) / (5i2 — Sil) _
+ (Fi — Si) / (5i2 — Si))
qi = 1 / 2 * (( 5i2 — Fi) / (5i2 — Si))
ElseIf Fi > Si And Fi < Sil Then
pi = 1 / 2 * (( Fi — Si) / (5i2 — Si))
qi = 1 / 2 * (( 5i2 — Fi) / (5i2 — Si) _
+ (Sil — Fi) / (Sil — Si))
End If7.6. IMPLIED TREE MODELS 333
End If
DownProbability (n , i ) = qi
UpProbability (n, i ) = pi
'II Calculating local volatilities
Fo = ( pi * Si2 + qi * Si + (1 — pi — qi ) * Sil )
LocalVolatility (n, i ) = Sqr(( pi * (5i2 — Fo)A2 _
+ (1 — pi — qi) * (Sil — Fo)A2 + qi _
* (Si — Fo)A2) / (FoA2 * dt ))
'II Calculating Arrow—Debreu prices
If n = 0 Then
ArrowDebreu(n + 1, i ) = qi * ArrowDebreu(n , i ) * Df
ArrowDebreu(n + 1, i + 1) = (1 — pi — qi) _
* ArrowDebreu(n , i ) * Df
ArrowDebreu(n + 1, i + 2) = pi * ArrowDebreu(n, i ) * Df
ElseIf n > 0 And i = 0 Then
ArrowDebreu(n + 1, i ) = qi * ArrowDebreu(n, i ) * Df
ElseIf n > 0 And i = n * 2 Then
ArrowDebreu(n + 1, i ) = UpProbability (n, i — 2) _
* ArrowDebreu(n, i — 2) * Df + (1 — UpProbability (n, i — 1) _
— DownProbability (n, i — 1)) * ArrowDebreu(n , i — 1) * Df _
+ qi * ArrowDebreu(n, i ) * Df
ArrowDebreu(n + 1, i + 1) = UpProbability(n, i — 1) _
* ArrowDebreu(n , i — 1) * Df + (1 — pi — qi ) _
* ArrowDebreu(n, i ) * Df
ArrowDebreu(n + 1, i + 2) = pi * ArrowDebreu(n, i * Df
ElseIf n > 0 And i = 1 Then
ArrowDebreu(n + 1, i ) = (1 — UpProbability(n, i — 1) _
— DownProbability(n, i — 1)) * ArrowDebreu(n, i — 1) * Df _
* qi * ArrowDebreu(n, i ) * Df
Else
ArrowDebreu(n + 1, i ) = UpProbability (n, i — 2) _
* ArrowDebreu(n, i — 2) * Df _
+ (1 — UpProbability (n, i — 1) — DownProbability(n, i — 1)) _
* ArrowDebreu(n , i — 1) * Df + qi * ArrowDebreu(n, i ) * Df
End If
Next
Next
If ReturnFlag = "DPM" Then
ImpliedTrinomialTree = Application . Transpose ( DownProbability)
ElseIf ReturnFlag = "UM" Then
ImpliedTrinomialTree = Application . Transpose( UpProbability )
ElseIf ReturnFlag = "DPni" Then
ImpliedTrinomialTree = ( DownProbability(STEPn, STATEi))
ElseIf ReturnFlag = "UPni" Then
ImpliedTrinomialTree = ( UpProbability (STEPn, STATEi))
ElseIf ReturnFlag = "ADM" Then
ImpliedTrinomialTree = Application .Transpose(ArrowDebreu)
ElseIf ReturnFlag = "LVM" Then
ImpliedTrinomialTree = Application . Transpose ( LocalVolatility )
ElseIf ReturnFlag = "LVni" Then
ImpliedTrinomialTree = Application . Transpose _
( LocalVolatility(STEPn, STATEi))
ElseIf ReturnFlag = "ADni" Then
ImpliedTrinomialTree = (ArrowDebreu(STEPn, STATEi))
Else
'II Calculation of option price using the implied trinomial tree334 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
If ReturnFlag = "c " Then
z = 1
ElseIf ReturnFlag = "p'' Then
z = —1
End If
For i = 0 To (2 * nSteps)
OptionValueNode( i ) = Max( 0 , z * (S * u^Max( i — nSteps , 0)
* &Max( nSteps — i , 0) — X))
Next
For n = nSteps — 1 To 0 Step —1
For i = 0 To (n * 2)
OptionValueNode( i ) = ( UpProbability(n, i ) _
* OptionValueNode( i + 2) + (1 — UpProbability(n, i ) _
— DownProbability(n, i )) * OptionValueNode( i + 1) _
+ DownProbability(n, i ) * OptionValueNode( i )) * Df
Next
Next
ImpliedTrinomialTree = OptionValueNode (0 )
End If
End Function
Smile Dynamics
The implied tree models offer useful intuition on how local and global
volatilities are connected. The implied tree models mentioned so far
all assume the local volatility is a deterministic function of time and
the asset price. In practice, the volatility is typically partly deter-
ministic and partly stochastic. One natural extension is therefore
stochastic implied trees, where the volatility is stochastic. For more on
this extension see Derman and Kani (1997). Another factor one needs
to consider before using a volatility model in practice is the dynam-
ics of the smile. The literature distinguishes between two main types
of models, so called sticky strike and sticky delta. In a sticky-strike
model the volatility for a given strike will stay the same as the asset
price moves, while in a sticky-delta model the volatility for a given
delta will stay the same. Which of the two models is best varies, see
Derman (1999) for more details.
7.7 FINITE DIFFERENCE METHODS
The use of finite difference methods in finance was first described by
Brennan and Schwartz (1978). Finite difference models, also called
grid models, are simply a numerical technique to solve partial dif-
ferential equations (PDE). Different finite difference methods can be
used to price European and American options, as well as many types
of exotic options.
Finite difference models are as we soon will see very similar to
tree models. The finite difference method is basically a numerical7.7. FINITE DIFFERENCE METHODS 335
approximation of the PDE. Here we will give an overview of the three
most common finite difference techniques in option pricing:
• Explicit finite difference
• Implicit finite difference
• Crank-Nicolson finite difference
All the finite difference models described here build on the same
main principle. First we build a grid with time along one
dimension/axis and price along the other dimension/axis. Just as in
a tree model, the time and price movements are discretized. Time
increases in increments of At, while the asset changes in amounts of
AS. These increments are then used to construct a grid of possible
combinations of time and asset price levels. The finite difference tech-
nique is then used to approximately solve the relevant PDE on this
grid. Just as in a tree model one starts at the "end" of the grid, at time
T, and rolls back through the grid. The calculations done on the grid
are a bit different, however.
The finite difference models can be used to solve a large class of
PDEs, and thereby a large class of options. If we assume that the
underlying asset follows a geometric Brownian motion, we get the
following Black-Scholes-Merton PDE for any single asset derivatives
(see Appendix A in Chapter 1 for how to come up with this PDE):
af 1 a2 f 2 c2 af — + +u - o = rj , (7.29)
at 2 as, as
where f is the value of a derivative security for example a Euro-
pean call c or an American call C or some type of exotic option. We
want to solve this PDE along the grid for the particular derivative
instrument under consideration. How this is done depends on the cho-
sen finite difference technique, as well as the derivative's contractual
details. We start with the explicit finite difference method. Wilmott
(2000), Randall and Tavella (2000), Topper (2005) and Duffy (2006)
offer more detailed coverage of finite difference methods applied to
option pricing.
## 7.7.1 Explicit Finite Difference
The explicit finite difference method is more or less a generalization
of the trinomial tree. The method approximates the PDE in equation
(7.29) by using numerical differentiation, Hull and White (1990). The
2L is approximated by using the forward difference (this naturally at
because time can only move forward):
af ff +1 4 -
81 At336 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
where fLi is the value of the derivative instrument at time step j and
price level i. The delta, g, and the gamma, M, are approximated
by central differences (the asset price can naturally move in both
directions):
- fi+i,i-1 821 f j+1,i+1 - +
OS 2AS as2 As2
Replacing the partial derivatives in equation (7.29) with these
approximations, we get
fi+i,i — 1 fj+1,i+1 + f+1,-1 22 4_
At 2 AS2
cr
ij+i i+i ij+i,i
= —i „
b ,
2AS
which can be rewritten as
1
1-1-rAt(Puij+1,i+1-1- Pmij+1,i Pdij+1,i-1),
where
1 • •
Pu = —
2
(a2c2 4-13c)At
Pm
=1 _ 0.242At
1 L,•\
Pd = —
2
ko-2.2
This is very similar to the trinomial tree backward equations, and
it can be shown that both a trinomial and also binomial tree actually
is a special case of a finite difference method. See, for example, Heston
and Zhou (2000) and James (2003).
Explicit Finite Difference Implementation
First we have to decide on the price step and time step sizes. A good
size of price and time steps seems to be AS = - 2 -2- c n and At = cNx2 where
n is chosen by the user. The number of time steps is then set to
N = Integer(L) +1.
The current asset price will often fall between the nodes of the
finite difference grid. To get accurate option values, we need to adjust
for this. One way to do this is simply to interpolate the current value
from the two closest grid points (Wilmott, 2000). Let us define the
nearest grid point below the current asset price as Z = integer().
After rolling back through the grid, we can find the current option
value as a weighted sum (interpolation) of the two closest grid points,7.7. FINITE DIFFERENCE METHODS 337
where the weight given to the nearest grid points, respectively, just
above, and below the current asset price is
S — zAS
—
AS
The current option value at time zero is therefore
c = (1 - oc(0, z) + wc(0, z +
Alternatively, using the interpolation method just described,
we can ensure that a grid point always falls exactly on the current
asset price.8 This can easily be done by, for example, setting AS = n
where n is given by the user, and after this, setting n integer(A)2.
Computer algorithm
The computer code returns the value of a European or American
call or put option using the explicit finite difference method. Setting
the AmeEurFlag = "a" gives American option values, AmeEurFlag = "e"
gives European values. Similarly, setting the CallPutFlag = "c"returns
a call value, and CallPutFlag = "p'returns a put value. In the computer
code, v = a and dt = At. In this implementation we make sure a grid
point corresponds to the current asset price.
Function ExplicitFiniteDifference(AmeEurFlag As String, _
CallPutFlag As String, S As Double, X As Double, T As Double, _
r As Double, b As Double, v As Double, M As Integer) As Double
Dim C() As Double, St() As Double
Dim dt As Double, dS As Double
Dim pu As Double, pm As Double, pd As Double, Df As Double
Dim i As Integer , j As Integer , N As Integer , z As Integer
Dim SGridPt As Integer
z = 1
If CallPutFlag = "p" Then z = —1
dS = S / M
M = Int(X / dS) * 2
ReDim St(0 To M + 1)
SGridPt = S / dS
dt = dSA2 / (vA2 * 4 * X^2)
N = Int(T / dt) + 1
ReDim C(0 To N, 0 To M + 1)
dt = T / N
Df = 1 / (1 + r * dt)
8Thanks to Sam at the Wilmott forum for pointing this out to me, www.wilmott.com .338 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
For i = 0 To M
St(i) = i * dS ' // Asset price at maturity
C(N, i) = Max(0, z * (St(i) — X)) '// At maturity
Next
For j = N — 1 To 0 Step —1
For i = 1 To M — 1
pu = 0.5 * (102 * i^2 + b * i) * dt
pm = 1 — v^2 * i^2 * dt
pd = 0.5 * (v02 * i^2 — b * i) * dt
C(j , i) = Df * (pu * C(j + 1, i + 1)
+ pm * C(j + 1, i) + pd * C(j + 1, i — 1))
If AmeEurFlag = "a" Then
C(j, i) = Max(z * (St(i) — X), C(j, i))
End If
Next
If z = 1 Then ' I ICall option
C(j , 0) = 0
C(j, M) = (St(i) — X)
Else
C(j , 0) = X
C(j , M) = 0
End If
Next
ExplicitFiniteDifference = C(0, SGridPt)
End Function
## 7.7.2 Implicit Finite Difference
The implicit finite difference method is closely related to the explicit
finite difference method. The main difference is that we approximate
2,L and a2f in PDE (7.29) by central differentiation at time step j as as2
instead at j 1 as in the explicit finite difference method. This gives
- ± 1 f+i - 240fj,i-1 0.2s
At 2 AS2
+b
fj
'
i+i
AS
— fj
' S = rfj,i,
2
which can be rewritten as
f j+1,i = Pu f j,i+1 4 - Pm fj,i 4- Pd fj,i-1
1
Pu = —
2
i(b + -v2i)At
Pm =1+(r v2i2)At
1
Pd = —i(—b — v 2i)At
2
If we use M as the number of price steps in the grid, we now
need to solve for M — 1 unknown derivatives values, fi,i, on the grid7.7. FINITE DIFFERENCE METHODS 339
simultaneously:
1
pu(0),
0
pm(1)
0
pd (2)
o -
o
fi,A4 fr+i,A4
0 pu(1) pm (2) Pd(3) 0 A4-2 M-2
• • •
0 0 0 pu(3) Pm(4) Pd(5) 0 M-5 1,M-5
0 0 0 0 pu(4) Pm(6) Pd(7) M-6 fj+1,M-6
0 0 0 0 0 0 _fj+1,M-7—
We can now easily find the option value by inverting the tridiagonal
matrix. This gives us the European option values. To find the value
of an American option, we now need to roll back through the grid and
check if the exercise value at each grid point is higher than the already
calculated grid option values.
Computer algorithm
The computer code returns the value of a European call or put option
using the implicit finite difference method. Setting the CallPutFlag =
"c" returns a call value, and CallPutFlag ="p"returns a put value. In
the computer code v o- and dt = At. M is the number of price steps
used and N is the number of time steps.
Function I m pl icitFiniteD ifference (AmeEurFlag As String, _
CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, v As Double, _
N As Integer , M As Integer ) As Double
Dim p() As Variant, CTO As Variant, C As Variant
Dim dS As Double, dt As Double
Dim i As Integer , z As Integer , j As Integer
Dim SGridPt As Integer
z = 1
If CallPutFlag = "p" Then z = —1
'II Makes sure current asset price falls at grid point
dS = 2 * S / M
SGridPt = S / dS
M = Int(X / dS) * 2
dt = T / N
ReDim C1'(0 To M)
ReDim p(0 To M, 0 To M)
For j = 0 To M
Jr(;) = Max(0, z * (j * dS — X)) '// At maturity
For i = 0 To M
P(j, i) = 0
Next
Next340 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
p(0, 0) = 1
For i = 1 To M — 1 Step 1
p(i , i — 1) = 0.5 * i * (b — vA2 * i) * dt
p(i , i) = 1 + (r + vA2 * 1^2) * dt
p(i , i + 1) = 0.5 * i * (—b — vA2 * i) * dt
Next
p(M, = 1
C = Application .MMult( Application . MInverse(p( )) , _
Application .Transpose(GT()))
For j = N — 1 To 1 Step —1
C = Application .MMult( Application . MInverse(p( )) , C)
If AmeEurFlag = "a" Then 'I /American option
For i = 1 To M
C(i , 1) = Max(CDbl(C(i , 1)) , z * (( i — 1) * dS X))
Next
End If
Next
ImplicitFiniteDifference = C(SGridPt + 1, 1)
End Function
## 7.7.3 Finite Difference in in(S)
Alternatively, we can rewrite the Black-Scholes-Merton PDE in terms
of ln(S). Letting x = ln(S), we get
af a2f + (b — a
2
/2)—
af
=r f (7.30)
at 2 ax2 ax
This will, in general, make the finite difference implementation
slightly more efficient, as the coefficients now no longer depend on
the price step in the grid.
Explicit Finite Difference Method
For the explicit finite difference method, pu, pm and pd now become
independent of the price step, i, which makes the method somewhat
more efficient. In the case of the explicit finite difference method, we
now have
1 (a2 b — a2 /2)
= —A ±
Ax 2t Ax2
Pm =1— At-1--
2
— r At
Ax 2
1 ( 0.2 b _ a2/2 )
= —At
2 Ax2 Ax
It is numerically most efficient to set the price step Ax = a
Pu
Pd7.7. FINITE DIFFERENCE METHODS 341
It is worth mentioning that even if rewriting the PDE in this way
makes the implementation slightly more efficient, the drawback is
that in practice, different conditions typically depend on S and not
in(S)—for example, barrier options and reset-strike options. This can
make the implementation less intuitive for some derivatives.
Computer algorithm
The computer code returns the value of a European or American
call or put option using the explicit finite difference method for a
PDE in ln(S). Setting the AmeEurFlag = "a"gives American option val-
ues, AmeEurFlag ="e" gives European values. Similarly, setting the
CallPutFlag ="c"returns a call value, and CallPutFlag ="p"returns a
put value. In the computer code, v = a and dt = At. N is the number
of time steps and M is the number of price steps.
Function ExplicitFiniteDifferenceLnS(AmeEurFlag As String,
CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, v As Double, _
N As Integer , M As Integer) As Double
Dim Co) As Double, St() As Double
Dim dt As Double, dx As Double
Dim pu As Double, pm As Double, pd As Double
Dim i As Integer , j As Integer , z As Integer
FW011ima C( 0 To M / 2, 0 To M + 1)
lial lbn St ( 0 To M + 1)
z = 1
If CallPutFlag = "p" Then z = —1
dt = T / N
dx = v * Sqr(3 * dt)
pu = 0.5 * dt * ((v / dx)^2 + (b — vA2 / 2) / dx)
pm = 1 — dt * (v / dx)^2 — r * dt
pd = 0.5 * dt * ((v / dx)^2 — (b — v^2 / 2) / dx)
St(0) = S * Exp(—M / 2 * dx)
C(N, 0) = Max(0, z * (St(0) — X))
For i = 1 To M
St(i) = St(i — 1) * Exp(dx) ' II asset price at maturity
C(N, i) = Max(0, z * (St(i) — X)) '// Option value at maturity
Next
For j = N — 1 To 0 Step —1
For i = 1 To M — 1
C(j , i) = pu * C(j + 1, i + 1) _
+ pm * C(j + 1, i) + pd * C(j + 1, i — 1)
If AmeEurFlag = "a" Then 'I/American option
C(j, i) = Max(C(j, i), z * (St(i) — X))
End If
Next
C(j , M) = C(j , M — 1) + St(M) — St(M — 1) 'I/Upper boundary
C(j , 0) = C(j , 1) '11 Lower boundary
Next342 CHAPTER 7. TREES AND FINITE DIFFERENCE METHODS
ExplicitFiniteDifferenceLnS = C(0, M / 2)
End Function
## 7.7.4 The Crank-Nicolson Method
In the Crank-Nicolson method the approximation of the PDE equa-
tion is done by central differences at time step j + instead of at j + 1
as in the explicit finite difference method, or at point j as in the
implicit finite difference method. Using the Crank-Nicolson method
to approximate PDE (7.30) gives
1i a2 (ii,/±1 — 2i1,t ii,i-1) (f+1,+1 —
At — 2 2Ax2
(b — a
2/2)
(f1+1,t+1 fj+1,t-1) (i1,/±1 f1,i-1)
As we can see, the Crank-Nicolson method is a combination of the
explicit and implicit methods. It is more efficient than the others.
In combination with the same boundary conditions as in the implicit
finite difference method, the Crank-Nicolson method will make up
a tridiagonal system of equations. For an in-depth discussion of the
Crank-Nicolson method applied to derivatives valuation, see Wilmott
(2000).
Computer algorithm
Function CrankNicolson(AmeEurFlag As String, CallPutFlag As String, _
S As Double, X As Double, T As Double, r As Double, _
b As Double, v As Double, N As Integer, M As Integer) As Double
Dim Co) As Double, St() As Double, p() As Double, pmd() As Double
Dim dt As Double, dx As Double
Dim i As Integer , j As Integer , z As Integer
Dim pu As Double, pm As Double, pd As Double
ReDim pmd(0 To M)
ReDim p(0 To M)
ReDim C(0 To M / 2 + 1, 0 To M + 1)
ReDim St(0 To M + 1)
z = 1
If CallPutFlag = "p" Then z = —1
dt = T / N
dx = v * Sqr(3 * dt)
pu = —0.25 * dt * ((v / dx)^2 + (b — 0.5 * vA2) / dx)
4Ax7. 7. FINITE DIFFERENCE METHODS 343
pm = 1 + 0.5 * dt * (v / dx)^2 + 0.5 * r * dt
pd = -0.25 * dt * ((v / dx)^2 - (b - 0.5 * v^2) / dx)
St(0) = S * Ego( -M / 2 * dx)
C(0, 0) = NIax(0, z * (St(0) - X))
For i = 1 To M '// Option value at maturity
St(i) = St(i - 1) Exp(dx)
C(0, i) = NIax(0, z * ( St(i) - X))
Next
pmd(1) = pm + pd
p(1) = -pu * C(0, 2) - (pm - 2) * C(0, 1) _
- pd * C(0, 0) - pd * (St(1) - St(0))
For j = N - 1 To 0 Step -1
For i = 2 To 1\4 - 1
p(i) = -pu C(0, i + 1) - (pm - 2) * C(0, i) _
- pd * C(0, 1- 1) - p(i - 1) * pd / pmd(i - 1)
pmd(i) = pm - pu * pd / pmd(i - 1)
Next
For i =M- 2 To 1 Step -1
C(1, i) = (p(i) - pu C(1, i + 1)) / pmd(i)
Next
For i = 0 To M
C(0, i) = C(1, i)
If AmwEimrFlag = "a" Then
C(0, i) = NIstx(C(1, i), z * ( St(i) - X))
End If
Next
Next
CrankNicolson = C(0, M / 2)
End FunctionCHAPTER
8
ob MONTE CARLO SIMULATION
If you are out to describe the truth, leave elegance to the tailor.
Albert Einstein
8.1 STANDARD MONTE CARLO SIMULATION
Monte Carlo simulation is a numerical method that is useful in many
situations when no closed-form solution is available. Monte Carlo
simulating in option pricing, originally introduced by Boyle (1977),
can be used to value most types of European options and, as we will
see, also American options. The Monte Carlo method can be used to
simulate a wide range of stochastic processes and is thus very general.
To illustrate the use of Monte Carlo simulation, we will start with the
processes where the natural logarithm of the underlying asset follows
geometric Brownian motion. The process governing the asset price S
is then given by
,,
S + dS = S exp Rit — 1 .cr`-)dt + adz],
where dz is a Wiener process with standard deviation 1 and mean 0.
To simulate the process, we consider its values at given discrete time
intervals, At apart:
S+ AS = S exp [(it, —1a2) At + aerN/7 6a] ,
2
where AS is the change in S in the chosen time interval At, and Et is
a random drawing from a standard normal distribution.
The main drawback of Monte Carlo simulation is that it is
computer-intensive. A minimum of 10,000 simulations are typically
necessary to price an option with satisfactory accuracy. The stan-
dard error in the estimated value from the standard Monte Carlo
simulation is normally related to the square root of the number of
simulations. More precisely, if s is the standard deviation of the pay-
offs from n simulations, then the standard error is given by /'-T. This
345346 CHAPTER 8. MONTE CARLO SIMULATION
means that to double the accuracy, we will need to quadruple the num-
ber of simulations. So if we want to double the accuracy from 10,000
simulations, we will need 40,000 simulations, and so on. Several
techniques are available to speed up the Monte Carlo simulation,
something we will look into later in this chapter (variance reduc-
tion techniques). The computer code in this book is written in Visual
Basic (VBA). Implementing the same code in C++ (or any other lower-
level computer language) will increase the speed dramatically and is
recommended for serious, large-scale use.
The steps in standard Monte Carlo simulation is simply to simulate
n number of paths of the asset price. The value is then given as the
discounted average of the simulated paths. In the case of non-path-
dependent European style options, we are only interested in the end
value of the asset, and the value of a standard call option is simply
given by
—rT n
c e Emax[Se(b—
a2 12)T+0-EiN/7
_ X ,0],
r=1
where E, is a random drawing from a standard normal distribution,
and similarly for a put option we have
— rT n
P = e Emax[X — Se—a2/2)T H-0-E,,/7
i=1
For path-dependent options, we also need to divide each path into
discrete time steps. Doing this for a standard European option would
be unnecessarily computer-intensive, but just so you get an idea, here
is what it would look like:
C =
n —rT m e E E
i=1
max[Si_le(b—a2/2)L‘t±aeL1 — X ,0],
where m is the number of time steps, At =T Im, and So is the initial
asset price when j =1. Also, when it comes to stochastic processes
like mean reversion, we have to divide the path into discrete time
steps even for standard European options, as we soon will look into.
Computer algorithm
This function can be used to price standard European call and put
options.
Function MonteCarloStandardOption(CallPutFlag As String, _
S As Double, X As Double, T As Double, r As Double, b As Double, _
v As Double, nSimulations As Long) As Double
Dim St As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim i As Long, z As Integer8.1. STANDARD MONTE CARLO SIMULATION 347
Drift = (b — v^2 / 2) * T
vSqrdt = v * Sqr(T)
If CallPutFlag = "c " Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
For i = 1 To nSimulations
St = S * Exp( Drift + vSqrdt * Application .NormInv(Rnd() , 0, 1))
sum = sum + Max( z * (St — X) , 0)
Next
MonteCarloStandardOption = Exp(—r * T) * sum / nSimulations
End Function
## 8.1.1 Greeks in Monte Carlo
One way to calculate Greeks that works for any model or imple-
mentation is to use finite difference approximations—described as
numerical Greeks in Chapter 2. For example, to calculate the delta
with two-sided finite difference method:
c(s ± AS, X, T, r, b, — c(S — AS, X, T, r, b,
A
2AS
This involves running the Monte Carlo simulation twice, once using
S + AS as initial asset price and once using S – AS as initial asset
price. Vega, theta, rho, gamma, and any other Greek can be computed
in similarly ways.
Finite difference approximations are unnecessary computer-
intensive and not very accurate in combination with Monte Carlo
methods. Curran (1993) suggests a more efficient and accurate way to
calculate Greeks using Monte Carlo simulation for many derivatives.
Let us for illustration purposes assume geometric Brownian motion.
In the case of delta, the method starts by counting the number of
paths that ends up in-the-money. For these paths we add up the asset
prices at maturity, then divide this sum by the number of simulations
times the initial asset price—that is:
(8.1)
Sn'
where E is the sum of the asset prices at the end of each path for
every in-the-money path and n is the number of simulations. In the
case of gamma, we have
(8.2)348 CHAPTER 8. MONTE CARLO SIMULATION
where E now is the number of paths where 1ST — X < e for some
e, and n is the number of simulations. Now that we know delta and
gamma, we can find theta from the following relationship:
0 = rC —bSA+ - I cr
2
S2F
2
To get the theta on the notation of a one-day time decay, we have to
divide the calculation above by the number of days in the year, 365.
To calculate vega, we use the following relationship:
Vega = Fa S2T (8.4)
To get the vega in terms of one volatility point we need to divide
by 100.
Computer algorithm
This function can be used to price standard European call and put
options with delta, gamma, theta, and vega. The function returns an
array of these measures.
Function StandardMCWithGreeks(OutputFlag As String, _
CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, v As Double, _
nSimulations As Long) As Variant
Dim St As Double, Output() As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim DeltaSum As Double, GammaSurn As Double
Dim i As Long, z As Integer
ReDim Output(0 To 4) As Double
Drift = (b — vA2 / 2) * T
vSqrdt = v * Sqr(T)
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
For i = 1 To nSimulations
St = S * Exp( Drift + vSqrdt * Application .NormInv(Rzid() , 0, 1))
sum = sum + Max(z * (St — X), 0)
If z = 1 And St > X Then DeltaSum = DeltaSum + St
If z = —1 And St < X Then DeltaSum = DeltaSum + St
If Abs( St — X) < 2 Then GammaSum = GammaSum + 1
Next
'II Option value:
Output(0) = Exp(—r * T) * sum / nSimulations
'II Delta:
Output(1) = z * Exp(—r * T) * DeltaSum / (nSimulations * S)
'// Gcrtnma:
Output(2) = Exp(—r * T) * (X / S)A2 * GammaSum / (4 * nSimulations
/ Theta:
Output(3) = (r * Output(0) — b * S * Output(1) _
— 0.5 * vA2 * SA2 * Output(2)) / 365
(8.3)8.1. STANDARD MONTE CARLO SIMULATION 349
'II Vega:
Output(4) = Output(2) * v * SA2 * T / 100
StandardMCWithGreeks = Application .Transpose(Output0)
End Function
## 8.1.2 Monte Carlo for Callable Options
So far, we have only looked at using Monte Carlo simulation for
a standard European option. There is no need to use simulation
to value an option for which we have a closed-form solution. The
above application was presented only to illustrate the use of Monte
Carlo simulation. The strength of Monte Carlo simulation lies in its
generality and that it is very powerful tool to value path-dependent
options. One type of path-dependent option that we have not covered
yet is the callable option, typically in the form of a callable warrant.
These are call options where the owner is forced to exercise if the asset
price has traded above a given barrier level, H, for a prespecified num-
ber of days in a row. Similarly, a callable put requires the owner to
exercise if the asset price trades below a given barrier for a prespec-
ified number of days in a row. While finding a closed-form solution
for these options can be difficult, it is straightforward to implement
this valuation problem with Monte Carlo methods. Below we have
included a VBA implementation.'
Computer algorithm
This function can be used to price standard European call and put
options that are callable if the asset price is MovingDaysN above the
barrier H.
Function CallableWarrantNDays(CallPutFlag As String, S As Double, _
X As Double, H As Double, T As Double, r As Double, b As Double, _
v As Double, DaysPerYear As Integer, _
nSimulations As Long, MovingDaysN As Integer) As Double
Dim i As Long, j As Long
Dim n As Long, Counter As Long
Dim z As Integer
Dim dt As Double, St As Double, sum As Double
Dim Drift As Double, vSqrt As Double
Dim BarrierHitProb As Double
z = 1
If CallPutFlag = "p" Then
z = —1
End If
iThis is a very time-consuming simulation. For any practical purpose, such a
simulation should be implemented in a fast language like C++.350 CHAPTER 8. MONTE CARLO SIMULATION
n = DaysPerYear * T
dt = T / n
Drift = (b — v * v * 0.5) * dt
vSqrt = v * Sqr( dt )
sum = 0
For j = 1 To nSimulations
BarrierHitProb = 0
St = S
Counter = 0
For i = 2 To n 'I I starts at second fixing
St = St * Exp( Drift + vSqrt _
* Application .NormInv(Rncl() 0, 1) )
If z = 1 Then 'II call
If St > H Then
Counter = Counter + 1
Else
Counter = 0
End If
ElseIf z = —1 Then 'I/put
If St < H Then
Counter = Counter + 1
Else
Counter = 0
End If
End If
If Counter = MovingDaysN Then
sum = sum + Exp(—r * (i * dt )) * Max( z * ( St X) , 0)
BarrierHitProb = 1
Exit For
End If
Next
sum = sum + Exp(—r * T) * (1 — BarrierHitProb ) _
* Max( z * (St — X) , 0)
Next
CallableWarrantNDays = sum / nSimulations
End Function
## 8.1.3 Two Assets
Monte Carlo simulation can easily be extended to options on two
underlying assets:
Si -I- AS1 = si exp [(Ai —21At + alcii,o/T]
1 2 A
S2 ± AS2 = 52 eXp [(p.2 — — a2 ) t 0.2a2,t 'N/Ta]
2
Correlation between the two assets is allowed by setting
al,t = El,/
a2,t = PEI,/ E2,4 1 — P2,8.1. STANDARD MONTE CARLO SIMULATION 351
where EL, and E2,, are two independently random numbers from a
standard normal distribution.
Most options on two correlated assets can more efficiently be priced
analytically or in a three-dimensional binomial lattice, shown earlier
in Chapter 7. One example where two-asset Monte Carlo simula-
tion is useful is in the pricing of European Asian spread options. 2
Theseareoptionswhosepayoffdependsonthedifferencebetween
the arithmetic average of the two assets at expiration.
Computer algorithm
The computer code below shows how to price a European arithmetic
average spread call or put option. The code is limited to pricing the
option at the beginning of the averaging period. It is easy to extend
the code to price the option before or into the averaging period.
Function MonteCarloAsianSpreadOption( CallPutFlag As String, Si As Double, _
S2 As Double, X As Double, T As Double, r As Double, bl As Double, _
b2 As Double, vi As Double, v2 As Double, rho As Double, _
nSteps As Long, nSimulations As Long) As Double
Dim dt As Double, St1 As Double, 5t2 As Double
Dim i As Long, j As Long, z As Integer
Dim sum As Double, Drift 1 As Double, Drift2 As Double
Dim vlSqrdt As Double, v2Sqrdt As Double
Dim Epsilonl As Double, Epsilon2 As Double
Dim Averagel As Double, Average2 As Double
If CallPutFlag = "c " Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
dt = T / nSteps
Driftl = (61 — v1^2 / 2) * dt
Drift2 = (b2 — v2"2 / 2) * dt
vlSqrdt = vi * Sqr( dt )
v2Sqrdt = v2 * Sqr( dt )
For i = 1 To nSimulations
Averagel = 0
Average2 = 0
St1 = Si
St2 = S2
For j = 1 To nSteps
Epsilon]. = Application .NormInv(Rnd() , 0, 1)
Epsilon2 = rho * Epsilonl _
+ Application .NormInv(Rnd() , 0, 1) * Sqr( 1 — rho"2)
Sti = St1 * Exp( Drift 1 + vlSqrdt * Epsilonl )
5t2 = 5t2 * Exp( Drift2 + v2Sqrdt * Epsilon2 )
Averagel = Averagel + St1
Average2 = Average2 + St2
Next
Averagel = Averagel / nSteps
Average2 = Average2 / nSteps
2For pricing Asian spread options, see Heenk, Kemna, and Vorst (1990).352 CHAPTER 8. MONTE CARLO SIMULATION
sum = sum + Max( z * (Averagel — Average2 — X) , 0)
Next
MonteCarloAsianSpreadOption = Exp(—r * T) * sum / nSimulations
End Function
## 8.1.4 Three Assets
Monte Carlo simulation can easily be extended to options on three
underlying assets:
Si ± AS --= Si exp RAI — —
1
aF) At ± cricei,rs/A71
2
1 2
S2 ± AS2 -= S2 exp — At ± cr2a2,t'srAti
2
S3 ± AS3 = S3 exp [(113 — o-2) At ± a3a3,14— A7]
2 3
Correlation between the three assets is allowed by setting
alt = El,t
ce2,t = P1,2E1a E2,t1/1 Pi,2
E3,t , ,
a3,t = -r- l/92,3 P1,3P1,2)E2,t P1,3E1,t
1
1 pf — ,2
where
g = 1 — pf,3
1 — p2 — 43 — pf,3 2P1,2P1,3P2,3
and ei,t, e2,t, and e3,t are three independently drawn random numbers
from a standard normal distribution. Moreover, '91,2 is the correla-
tion between the returns of asset one and two, p1,3 is the correlation
between the returns of asset one and three, and p2,3 is the correlation
between the returns of asset two and three.
Option on Maximum of Two Spread Options
To illustrate Monte Carlo simulation for an option on three correlated
assets, let's look at an option that pays off the maximum of two spread
options. That is, the payoff is max(z (Si — S2 — X), z (S3 — S2 — X), 0),
where Z takes the value 1 for a call and —1 for a put. The computer
code for such an option follows.8.1. STANDARD MONTE CARLO SIMULATION 353
Computer algorithm
Function MonteCarloTripleAsset(CallPutFlag As String, Si As Double, _
S2 As Double, S3 As Double, X As Double, T As Double, r As Double, _
bl As Double, b2 As Double, b3 As Double, vi As Double, v2 As Double,
v3 As Double, rhol2 As Double, rhol3 As Double, _
rho23 As Double, nSimulations As Long) As Double
Dim dt As Double, St1 As Double, St2 As Double, 5t3 As Double
Dim i As Long, z As Integer
Dim sum As Double, g As Double
Dim Driftl As Double, Drift2 As Double, Drift3 As Double
Dim vlSqrdt As Double, v2Sqrdt As Double, v3Sqrdt As Double
Dim Epsilonl As Double, Epsilon2 As Double, Epsilon3 As Double
Dim alpha2 As Double, alpha3 As Double
z = 1
If CallPutFlag = "p" Then
z = —1
End If
Driftl = (b1 — vi * vi / 2) * T
Drift2 = (b2 — v2 * v2 / 2) * T
Drift3 = (b2 — v3 * v3 / 2) * T
vlSqrdt = vi * Sqr(T)
v2Sqrdt = v2 * Sqr(T)
v3Sqrdt = v3 * Sqr(T)
g = Sqr((1 — rhol3 " 2) / (1 — rhol2 ^ 2 — rho23 2
— rhol3 ^ 2 + 2 * rhol2 * rhol3 * rho23))
sum = 0
For i = 1 To nSimulations
St1 = Si
St2 = S2
St3 = S3
Epsilonl = Application.NormInv(Rnd(), 0, 1)
Epsilon2 = Application .NormInv(Rzw1( ) , 0, 1)
Epsilon3 = Application.NormInv(Rnd(), 0, 1)
alpha2 = rhol2 * Epsilonl + Epsilon2 * Sqr(1 — rhol2 ^ 2)
alpha3 = Epsilon3 / g + (rho23 — rhol3 * rhol2) * Epsilon2 _
+ rhol3 * Epsilonl * Sqr(1 / (1 — rhol2 ^ 2))
Sti = Sti * Exp( Driftl + vlSqrdt * Epsilonl)
5t2 = 5t2 * Exp( Drift2 + v2Sqrdt * alpha2)
5t3 = 5t3 * Exp(Drift3 + v3Sqrdt * alpha3)
sum = sum + Application .Max( z * (SU — 5t2 — X) , _
z * (5t3 — St2 — X), 0)
Next
MonteCarloTripleAsset = Exp(—r * T) * sum / nSimulations
End Function
8.1.5 N Assets, Cholesky Decomposition
To build in a correlation matrix for multiple assets in Monte Carlo
simulation, one can utilize the Cholesky decomposition. Assume we
have multiple uncorrelated random numbers El, E2, E3, EN, then
Cholesky decomposition is used to transform these into correlatedR=
1 —P
354 CHAPTER 8. MONTE CARLO SIMULATION
variables a i ,al , a2, a3, . . . , aN . Let us define E and a as column vectors
with Ei and a, in the rows. Now we can transform E to a by
a = Me,
where M is a matrix that must satisfy
mmT = R
where R is a symmetric positive definite correlation matrix. That is,
we are decomposing the correlation matrix into the product of two
matrices. M multiplied by the transposed matrix M T will naturally
return the input matrix R. There are several ways to decompose the
matrix; Cholesky decomposition is a popular method. For example,
the two asset bivariate case is a special case of the multi-asset case
and
[ M = 0 _ p2 0 _ p2
0 1
In the multi-asset case, we need a computer algorithm, 3 as follows.
Computer algorithm
The computer code takes the positive definite correlation matrix R as
input and returns the M matrix.
Function CholeskyDecomposition(R As Object) As Variant
Dim a() As Double
Dim M() As Double
Dim i As Integer , j As Integer , n As Integer , h As Integer
Dim U As Double
'If Number of columns in input correlation matrix R n =
R.Columns.Count
ReDim a(1 To n, 1 To a)
Ream IV( 1 To n, 1 To )
For i = 1 To n
For j = 1 To n
a(i, j ) = RH,
M(i , j) = 0
Next
Next
3The computer algorithm here is based on Wilmott (2000), which gives a more detailed
description of Cholesky decomposition.8.2. MONTE CARLO OF MEAN REVERSION 355
For i = 1 To n
For j = i To n
U= a( i , j)
For h = 1 To (i — 1)
U=U—M(i, h) *M(j, h)
Next
If j = i Then
M(i , i) = Sqr(U)
Else
M(j, i) =U / M(i, i)
End If
Next
Next
CholeskyDecomposition = M
End Function
8.2 MONTE CARLO OF MEAN REVERSION
One of the great strengths of Monte Carlo simulation is that it can
easily be applied to any sensible stochastic process. We next look at an
example of how to implement a popular choice for a mean reverting
asset price:
dS = K (0 - St)dt aedz,
where 0 is the mean reversion level, K is the speed of mean reversion,
and /3 determines the structural form of the diffusion term; consider,
for instance, /3 = 1, which yields the lognormal mean reversion model,
and /3 = 0 yields the normally distributed mean reversion model (aka
the Ornstein-Uhlenbeck process). When we want to do Monte Carlo
simulation of a mean reversion stochastic process, we need to divide
each sample path into discrete time steps, even if we only are going
to value non-path-dependent European options.
Computer algorithm
This function can be used to price standard European call and put
options assuming the asset price follows a mean reversion process.
Function MonteCarloMeanReverting(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, v As Double, _
kappa As Double, theta As Double, beta As Double, _
nSteps As Long, nSimulations As Long) As Double
Dim dt As Double, St As Double
Dim sum As Double
Dim i As Long, j As Long, z As Integer
dt = T / nSteps
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1356 CHAPTER 8. MONTE CARLO SIMULATION
End If
For i = 1 To nSimulations
St -= S
For j = 0 To nSteps
St = St + kappa * ( theta — St) * dt _
+ v * St^beta * v * Sqr( ) _
* Application .NormInv (Rod( ) , 0, 1)
Next
sum = sum + Max( z * (St — X) , 0)
Next
MonteCarloMeanReverting = Exp(—r * T) * sum / nSimulations
End Function
8.3 GENERATING PSEUDO-RANDOM NUMBERS
Random numbers, also called random variates, are an important
input for Monte Carlo simulations. A computer cannot generate
completely random numbers, but a good random-number generator
should be good at simulating numbers that are hard to distinguish
from real randomness.
Random Numbers From the Standard Normal Distribution
Most computer languages offer built-in functions that draw randomly
a number Z uniformly distributed between 0 and 1. In Monte Carlo
simulations we typically need to transform this into a random number
from a standard normal distribution e. Several methods are suggested
in the literature.
One very simple and intuitive method is to use the following
formula:
12
E = Ez, - 6
/=1
The drawback is that it uses unnecessary computer time, as it uses
many independent random numbers to generate one random number.
Another drawback is that it is also not accurate in the tail of the
distribution. To increase the accuracy in the tail of the distribution,
we can simply increase the number of summands, for example, to
24
E = Zi — 12
1=1
This will, however, just add more computer time. A better alternative
is what is known as the Box-Muller method:
E = cos(27Z2)V-21n(Z1), (8.5)8.3. GENERATING PSEUDO-RANDOM NUMBERS 357
where cos is the cosine function, and Z i and Z2 are two independent
uniform random numbers between 0 and 1. The simple procedure
above requires two random numbers to return one; however, the
method can easily be implemented to return two random numbers,
as shown in the code below. Also, using tangens instead of cosinus is
known to increase the speed.
Computer algorithm
Function BoxMuller2(xl As Double, x2 As Double) As Variant
Dim T As Double, L As Double
Dim ReturnVec(1 To 2)
If xl = 0 Then
BoxMuller2(xl, x2) = BoxMuller(x2, xl)
Else
'I Using tan(Pi*x2) instead of cos and sin increases the speed
T = Tan(Pi * x2)
L = Sqr(-2 * Log(x1))
ReturnVec(1) = L (1 — T T) / (1 + T T)
ReturnVec(2) = L * 2 * T / (1 + T T)
BoxMuller2 = ReturnVec()
End If
End Function
Another alternative is to use the inverse cumulative normal distri-
bution function to do the job. This is a procedure that works for any
distribution for which we are able to efficiently express the inverse
cumulative distribution function. In the particular case of the normal
distribution, this is possible, and
E = N-1 (Z)
This is a very efficient method. Since there is no closed-form solu-
tion for the inverse cumulative normal distribution function, we must
make sure we use an accurate approximation. One method is pre-
sented in Chapter 13. Excel also has a built-in inverse cumulative
normal distribution function that we, for convenience, have used in
many of the Monte Carlo VBA examples.
Built-in Excel Function
In Excel there is a built-in random-number generator. Normally dis-
tributed random variates can be easily generated directly in an Excel
spreadsheet by invoking "NormInv(Rnd())" . Be aware that this is not a
good random-number generator, but for simple single-asset options,
it seems to work fine. In particular, for multi-asset options, you
need a better implemented random-number generator. Note also that
random-number generators that come with standard distributions of
lower-level languages like C++ are generally of low quality.358 CHAPTER 8. MONTE CARLO SIMULATION
8.4 VARIANCE REDUCTION TECHNIQUES
Standard Monte Carlo simulation is not very accurate when a "mod-
erate" number of random variates are used. A large number of
simulations is typically needed to get a reasonably accurate result.
With this in mind, we next look at several methods that speed up
and make Monte Carlo simulations more accurate. I discuss how to
implement
• Antithetic variance reduction
• Intelligent Monte Carlo (IQ-MC, aka importance sampling)
• Quasi-random Monte Carlo simulation
• Combining quasi-random MC with importance sampling
## 8.4.1 Antithetic Variance Reduction
The antithetic variance reduction technique involves calculating the
derivative's value twice for each simulation: A path is simulated in
the normal way, and then a mirror path is generated by switching the
sign of the random variates drawn to generate the original path. The
two paths are then used to compute two different option values. One,
therefore, has to simulate fewer random variates (half as many) to
simulate a given number of option values. This is a very robust and
simple variance reduction to implement, and can be used in almost
any type of Monte Carlo simulation.
Computer algorithm antithetic variance reduction
This function can be used to price standard European call and put
options using pseudo-random Monte Carlo simulation with antithetic
variance reduction technique.
Function MonteCarloStandardOptionAntithetic(CallPutFlag As String, _
S As Double, X As Double, T As Double, r As Double, b As Double, _
v As Double, nSimulations As Long) As Double
Dim St1 As Double, 5t2 As Double, Epsilon As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim i As Long, j As Long, z As Integer
Drift = (b — v^2 / 2) * T
vSqrdt = v * Sqr(T)
If CallPutFlag -= "c" Then
z = 1
ElseIf CallPutFlag "p" Then
z = —1
End If
For i = 1 To nSimulations
Epsilon = Application.NormInv(Rn((), 0, 1)
St1 = S * Exp( Drift + vSqrdt * Epsilon)
5t2 = S * Exp ( Drift + vSqrdt * (—Epsilon))
sum = sum + (Max(z * (St1 — X), 0) + Max(z * (5t2 — X), 0)) / 28.4. VARIANCE REDUCTION TECHNIQUES 359
Next
MonteCarloStandardOptionAntithetic = Exp( — r * T) * sum / nSimulations
End Function
8.4.2 IQ-MC/Importance Sampling
This technique involves valuing options by simulation-only paths that
end up in-the-money. The applicability of this technique, of course,
requires that only these paths are relevant for the option value. In
standard Monte Carlo simulation, in contrast, all paths are taken
into account. For example, when one is valuing a deep out-of-the-
money option using 10,000 simulations, it can be that only a couple
of thousand or just a few hundred of the simulated paths end up in-
the-money. All the paths ending out-of-the-money are "useless" for
the valuation and just a waste of computer time. Standard Monte
Carlo simulation is for this reason extremely inefficient for out-of-
the-money options. A method known as importance sampling is based
on the idea that only "important" paths need to be simulated, in the
case of non-path-dependent options—that is, paths that end up in-the-
money. This is, in other words, to make the Monte Carlo simulation
"intelligent" and is why I like to call it IQ-MC (IQ Monte Carlo).
Importance sampling, or what I will describe here as IQ-MC, was
probably first described in relation to quantitative finance by Reider
(1993) and later described by Boyle, Broadie, and Glasserman (1997);
Glasserman, Heidelberg, and Shahabuddin (2000); and Su and Fu
(2000), among others.
IQ-MC can be used to value options that depend on a wide variety
of stochastic processes. We will for simplicity limit ourselves to geo-
metric Brownian motion and standard European options. Standard
European options under geometric Brownian motion can naturally
be valued much more efficiently with the BSM formula. This section
is just to illustrate how powerful and efficient IQ-MC is compared to
standard Monte Carlo simulation.
IQ-MC can be done by the following steps:
Sample random numbers that will lead to in-the-money paths:
X = S exp K 1 b - -a-) T o-Nif N -1 (€)]
2
solved with respect to E gives
N 1 (€) = 111(X
1S) - (b - a 2 12)T
a,11-'360 CHAPTER 8. MONTE CARLO SIMULATION
c = N
(1n(X S) — (b — cr 2 12)1 ,
where N(.) is the cumulative normal distribution function.
For a call option, this means that only random numbers between
N (mn(X /
/T-
2 /2)T
) and 1 will lead to in-the-money options. For put
cy„
options, only random numbers between 0 and N (
1n
/T-
(X I S)-(b-a212)T )
will
„
lead to in-the-money paths.
These in-the-money paths then just have to be weighted by the
fraction of paths that would go in-the-money assuming one used
standard MC. For a call, we simply have to multiply by the risk-
neutral probability of ending up in-the-money. For a European call
this is N (d2), where
ln( X I S) + (b — a2 /2)T
d2=
while for a put option, we use N(-d2). This gives us the value of the
call option
C = N (d2) E Is exp [(b _ a2) T + IfN —'(Ec)1 —xI, (8.6)
2
where Ec is a random number between N ( - d) and 1. If we have an
algorithm for generating a random number E between 0 and 1, all we
need is to compute
Cc = [1 — N(d)]c + N (11)]
Similarly for a put, we have
p N(—d2) IX _ S exp
1
— yrr
2
)T+aff N -1 (cp)11 ,
0
(8.7)
where Ep is a random number between 0 and N(-d). If we have an
algorithm to generate a random number E between 0 and 1, all we
need is to compute
c = N(d)c
Computer algorithm for standard European option
using IQ-MC
This function can be used to price standard European call and put
options. The code illustrates how to use IQ-MC (importance sam-
pling). For improved accuracy and more complex derivatives, one
should replace Excel's random-number generator, Rnd(), with a better
random-number generator.8.4. VARIANCE REDUCTION TECHNIQUES 361
Function IQMC(CallPutFlag As String, S As Double, X As Double, _
T As Double, r As Double, b As Double, v As Double, _
nSimulations As Long) As Double
Dim St As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim i As Long, z As Integer
Dim d As Double, d2 As Double, Epsilon As Double
Drift = (b — v"2 / 2) * T
vSqrdt = v * Sqr(T)
d = (Log(X / S) — (b — vA2 / 2) * T) / (v * Sqr(T))
d2 = (Log(S / X) + (b — vA2 / 2) * T) / (v * Sqr(T))
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
For i = 1 To nSimulations
If z = —1 Then
Epsilon = CND(d) * Bud()
Else
Epsilon = (1 — CND(d)) * Rid() + CND(d)
End If
St = S * Exp( Drift + vSqrdt * Application .NormInv( Epsilon , 0, 1))
sum = sum + Max( z * (St — X) , 0)
Next
IQMC = Exp(—r * T) * sum / nSimulations * ClsW)(z * d2)
End Function
8.4.3 IQ-MC Two Correlated Assets
IQ-MC can easily be extended to options on two correlated assets.
Here we illustrate the procedure to value a two-asset correlation
option. A closed-form solution for such an option is given in Chap-
ter 5, covering two-asset exotic options. However, this gives us a
good opportunity to test out how accurate our implementation is. The
implementation follows below.
Function IQMC2Asset(CallPutFlag As String, Si As Double, S2 As Double, _
xl As Double, x2 As Double, T As Double, r As Double, _
bl As Double, b2 As Double, vi As Double, v2 As Double,
rho As Double, nSimulations As Long) As Double
Dim dt As Double, St1 As Double, St2 As Double
Dim i As Long, j As Long, z As Integer
Dim sum As Double, Driftl As Double, Drift2 As Double
Dim vlSqrdt As Double, v2Sqrdt As Double
Dim yl As Double, y2 As Double, dd As Double
Dim Epsilonl As Double, Epsilon2 As Double
Dim d As Double, d2 As Double
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If362 CHAPTER 8. MONTE CARLO SIMULATION
Drift 1 = (b1 — v1^2 / 2) * T
Drift2 = (b2 — v2^2 / 2) * T
vlSqrdt = vi * Sqr(T)
v2Sqrdt = v2 * Sqr(T)
yl = (Log(S1 / xi)
y2 = (Log(S2 / x2)
d = (Log( xi / Si) —
dd = (Log( x2 / S2)
+ (b1 — v1^2 / 2) * T) / (v1 * Sqr(T))
+ (b2 — v2^2 / 2) * T) / (v2 * Sqr(T))
(b1 — v1^2 / 2) * T) / (v1 * Sqr(T))
— (b2 — v2^2 / 2) * T) / (v2 * Sqr(T))
For i = 1 To nSimulations
If z = —1 Then
Epsilonl = CND(d) * Rod()
Else
Epsilonl = (1 — CND( d )) * Rnd() + CND(d)
End If
Epsilonl = Application .NormInv( Epsilonl , 0, 1)
Epsilon2 = CND( ( dd — rho * Epsilonl ) / Sqr(1 — rho * rho ))
If z = 1 Then
Epsilon2 = (1 — Epsilon2 ) * Rod() + Epsilon2
Else
Epsilon2 = Epsilon2 * Rnd()
End If
Epsilon2 = rho * Epsilonl + Application .NormInv( Epsilon2 , 0, 1)
* Sqr(1 — rho ^ 2)
St1 = Si * Exp( Drift 1 + vlSqrdt * Epsilonl )
St2 = S2 * Exp( Drift2 + v2Sqrdt * Epsilon2 )
sum = sum + z * ( St2 — x2)
Next
IQMC2Asset = Exp(—r * T) * sum / nSimulations _
* CBND( z * yl , z * y2, rho)
End Function
## 8.4.4 Quasi-Random Monte Carlo
Quasi-random numbers, also known as low-discrepancy sequences,
are nonrandom series of numbers. Quasi-random numbers are much
more evenly spread out than random numbers. This make the method
much more efficient than standard Monte Carlo simulation.
Halton Numbers
Halton (1960) numbers are a simple way of generating quasi-random
numbers. Halton numbers are not very efficient for high-dimensional
problems, but the method illustrates very well the added efficiency
in using quasi-random numbers instead of standard pseudo-random
Monte Carlo simulation. Quasi-random numbers better suited for
high-dimensional problems are described by Sobol (1967) and Faure
(1982). For more details on quasi-random numbers in financial appli-
cations see also Wilmott (2000), Jackel (2002), and Glasserman
(2003).8.4. VARIANCE REDUCTION TECHNIQUES 363
Computer algorithm
Below is the computer code for generating quasi-random Halton
numbers.
Function Halton(n, b)
Min nO, nl, r As Integer
Dim H As Double
Dim f As Double
nO = n
H= 0
f = 1 / b
While (n0 > 0)
n1 = Int(n0 / b)
r = nO — n1 * b
H=H+f*r
f = f / b
nO = n1
Wend
Halton = H
End Function
Computer algorithm
Below is the computer code for a European option using quasi-random
Monte Carlo simulation with Halton numbers.
Function HaltonMonteCarloStandardOption(CallPutFlag As String, _
S As Double, X As Double, T As Double, r As Double, b As Double, _
v As Double, nSimulations As Long) As Double
Dim St As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim i As Long, z As Integer
Drift = (b — v^2 / 2) * T
vSqrdt = v * Sqr(T)
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
For i = 1 To nSimulations
St = S * Exp(Drift + vSqrdt _
* BoxMuller(Halton(i , 3), Halton(i , 5)))
sum = sum + Max( z * (St — X), 0)
Next
HaltonMonteCarloStandardOption = Exp(—r * T) * sum / nSimulations
End Function
Function BoxMuller(x As Double, y As Double) As Double
BoxMuller = Sqr(-2 * Log(x)) * Cos(2 * Application. Pi ( ) * y)
End Function
Quasi-Random IQ-MC
By combining quasi-random Monte Carlo simulation with importance
sampling, we get a very intelligent form of simulation that has little364 CHAPTER 8. MONTE CARLO SIMULATION
or nothing to do with random numbers. The method is very powerful
and efficient (super IQ-MC). Below is an example of how to implement
it for a standard option.
Computer algorithm
This function can be used to price standard European call and put
options. The code illustrates how to use Super IQ-MC (quasi-random
MC in combination with importance sampling). Only the in-the-
money paths are simulated using quasi-random Halton numbers. The
computer code calls the Halton function given in the section describing
quasi-random number generation.
Function SuperIQMC(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, _
v As Double, nSimulations As Long) As Double
Dim St As Double
Dim sum As Double, Drift As Double, vSqrdt As Double
Dim i As Long, z As Integer
Dim d As Double, d2 As Double, Epsilon As Double
Drift = (b — v^2 / 2) * T
vSqrdt = v * Sqr(T)
d = (Log(X / S) — (b — v^2 / 2) * T) / (v * Sqr(T))
d2 = (Log(S / X) + (b — vA2 / 2) * T) / (v * Sqr(T))
If CallPutFlag = "c" Then
z = 1
ElseIf CallPutFlag = "p" Then
z = —1
End If
For i = 1 To nSimulations
If z = —1 Then
Epsilon = CND(d) * Halton(i , 5)
Else
Epsilon = (1 — CND(d)) * Halton(i , 5) + CND(d)
End If
St = S * Exp( Drift + vSqrdt * Application .NormInv(Epsilon , 0, 1))
sum = sum + Max(z * (St — X), 0)
Next
SuperIQMC = Exp(—r * T) * sum / nSimulations * CND(z * d2)
End Function
8.5 AMERICAN OPTION MONTE CARLO
In general, Monte Carlo simulation is limited to value European
options/derivatives instruments. However, Boyle, Broadie, and
Glasserman (1997) have developed a sophisticated method for valu-
ing American derivatives using Monte Carlo simulation. Here I
will simply give a quick example of how to implement it in VBA
code.8.5. AMERICAN OPTION MONTE CARLO 365
Computer algorithm
The VBA algorithm shown here shows, how to implement the Boyle,
Broadie, and Glasserman American Monte Carlo simulation for
single-asset options. The implementation is based on programming
done by Meier (2000). To understand the code the best, you should
play with the accompanying spreadsheet.
Function BroadieGlasserman(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, Sig As Double, _
m As Integer , Branches As Integer , nSimulations As Integer) As Double
Dim Drift As Double, SigSqrdt As Double, Discdt As Double
Dim z As Integer
Dim i As Integer , j As Integer , il As Integer , i2 As Integer
Dim Estimator As Integer , Simulation As Integer
Dim EstimatorSum As Double, Sum]. As Double, Surn2 As Double
Dim w() As Integer , v() As Double, Estimators() As Double
ReDim w(1 To m) As Integer, v(1 To Branches, 1 To m) As Double
ReDim Estimators(1 To 2) As Double
z= 1
If CallPutFlag = "Put" Then z = —1
Drift = (b — Sig "2 / 2) * T / (m — 1)
SigSqrdt = Sig * Sqr(T / (m — 1))
Discdt = Exp(—r * T / (m — 1))
For Estimator = 1 To 2
EstimatorSum = 0
For Simulation = 1 To nSimulations
v(1, 1) = S
w(1) = 1
For j = 2 To m
v(1, j ) = v(1, j — 1) * Exp( Drift + SigSqrdt
* NormInv(Rnd, 0, 1))
w( j ) = 1
Next j
=m
Do While j > 0
If j = m Then
v(w(j), j) = Max(z * (v(w(j ), j) — X), 0)
If w(j ) < Branches Then
v(w(j) + 1, j) = v(w(j — 1), j — 1) _
* Exp(Drift + SigSqrdt * NormInv(Rnd, 0, 1))
w(j) = w(j) + 1
ElseIf w(j) = Branches Then
w(j ) = 0
j = j — 1
End If
ElseIf j < m Then
If Estimator = 1 Then 'the high estimator
Suml = 0
For il = 1 To Branches
Suml = Sum]. + Discdt * v(il , j + 1)
Next ii
v(w(j ), j) = Max(Max(z * (v(w(j ), j) — X), 0),
Suml / Branches)
ElseIf Estimator = 2 Then 'the low estimator
Sum]. = 0 'value determinant
For il = 1 To Branches
Surn2 = 0 'decision determinant
For i2 = 1 To Branches
If il <> i2 Then Surn2 = Surn2 _
+ Discdt * v(i2 , j + 1)366 CHAPTER 8. MONTE CARLO SIMULATION
Next i2
If Max( z * (v(w(j ) , j) - X) , 0) >= Sum2 _
/ (Branches - 1) Then
Suml = Suml + Max( z * (v(w(j ), j) - X), 0)
Else
Suml = Suml + Discdt * v(il , j + 1)
End If
Next il
v(w( j ) , j ) = Suml / Branches
End If
If w( j ) < Branches Then
If j > 1 Then
v(w(j) + 1, j) = v(w( j - 1), j - 1) _
* Exp( Drift + SigSqrdt * NormInv(Rnd, 0, 1))
w( j ) = w(j) + 1
For i = j + 1 To m
v(1, i) = v(w(j ), 1) -
* Exp( Drift + SigSqrdt * NormInv(Rnd, 0, 1))
w( i ) = 1
Next i
=m
Else
j = 0
End If
ElseIf w( j ) = Branches Then
w( j ) = 0
j = j - 1
End If
End If
Loop
EstimatorSum = EstimatorSum + v(1, 1)
Next Simulation
Estimators ( Estimator ) = EstimatorSum / nSimulations
Next Estimator
BroadieGlasserman = 0.5 * Max(Max( * (S - X) , 0) , _
Estimators (2)) + 0.5 * Estimators (1)
End Function
Function NormInv(n1 As Double, n2 As Double, n3 As Double) As Double
NormInv = Application .NormInv(nl, n2, n3)
End FunctionCHAPTER
9
OPTIONS ON STOCKS THAT
PAY DISCRETE DIVIDENDS
Anyone who has never made a mistake has never tried anything
new.
Albert Einstein
To find the value of options on a stock index, it is typically suffice to
assume the index pays out a continuous dividend yield. Models that
can deal with this situation were covered in Chapters 1, 3, and 7.
Assuming a continuous payout rate for options on a single stock is
clearly less realistic and will consequently yield unacceptable accu-
racy in the value estimate. A high degree of accuracy can be attained
by assuming the stock pays out known discrete dividends during the
option's lifetime. Valuation of options on an asset, typically a stock,
paying a discrete dividend is considered a relatively complex valuation
problem that has received a lot of attention, but also a lot of confusion.
Despite options on stocks paying discrete dividends have been trading
actively since at least the early 1970s, it was first in 2002 that Haug,
Haug, and Lewis (2003) came up with a "closed-form" benchmark
model for valuing such options. Although most options on single stocks
are American, we start with the European case. Even before that dis-
cussion, we will, however, shortly describe one of the main methods
described in the literature. Because there is much confusion concern-
ing the valuation of options on stocks paying discrete dividends, this
chapter is more wordy than what is typical for this book.
Escrowed Dividend Model The simplest escrowed dividend
approach makes a simple adjustment to the Black-Scholes-Merton
(BSM) formula. The adjustment consists of replacing the stock price S
by the stock price minus the present value of the dividend S - e-rtD D,
where D is the size of the cash dividend to be paid at time tp . Because
the initial stock price is reduced below the actual, observed stock
price, this approach typically leads to too little absolute price volatil-
ity (atSt) in the period before the dividend is paid. Moreover, it is just
an approximation used to fit the ex-dividend price process into the
367368 CHAPTER 9. OPTIONS ON STOCKS
geometric Brownian motion (GBM) assumption of the BSM formula.
The approach will, in general, undervalue call options, and the mis-
pricing is larger the later in the option's lifetime that the dividend
is paid. The approximation suggested by Black (1975) for American
options suffers from the same problem, as does the Roll-Geske-Whaley
(RGW) model Roll (1977), Geske (1979a), and Whaley (1981). The
RGW model uses this approximation of the stock price process and
applies a compound option approach to take into account the possibil-
ity of early exercise. Not only does this yield a poor approximation in
certain circumstances, but it can open up arbitrage opportunities!
Several papers discuss the weakness of the escrowed dividend
approach. In the case of European options, suggested fixes are often
based on adjustments of the volatility in the BSM model, in combina-
tion with the escrowed dividend adjustment. We next discuss three
such approaches, all of which assume that the stock price can be
described by a GBM.
9.1 EUROPEAN OPTIONS ON STOCK WITH
DISCRETE CASH DIVIDEND
## 9.1.1 The Escrowed Dividend Model
European options on a stock that pays out one or more cash dividends
during the option's lifetime can be priced by the BSM formula, by
simply replacing S with S minus the present value of the dividends.
In general, the stock price minus the present value of the dividends
can be written as
S — — D2e —rt2 • • • — Dne—rt", (tn < T),
where D1 is dividend payout one, t1 is the time to this dividend payout,
t2 is the time until the second dividend payout, and so on, and T is the
time to maturity of the option. Although simple, this approach can
lead to significant mispricing and arbitrage opportunities. In particu-
lar, it will underprice options where the dividend is close to the option's
expiration date. The antithesis of this insight is that the approach
may be accurate when there is a single dividend payment just after
the option contract is initiated.
Example
Consider a European call option on a stock that will payout a dividend
two, three, and six months from now. The current stock price is 100,
the strike price is 90, the time to maturity on the option is nine months,
the risk-free rate is 10%, and the volatility is 25%. Hence, S = 100,
X = 90, T = 0.75, r =0.1, a =0.25, D1 = D2 = 2, t1 = 0.25, t2 = 0.5.9.1. EUROPEAN OPTIONS ON STOCK 369
The stock price minus the net present value of the cash dividends
is
100— 2e-0.1x0.25 — 2e 01>5 = 96.1469
Next, use the BSM formula:
In(96.1469/90) ± (0.1 ± 0.252/2)0.75
di = = 0.7598
0.25A/0.75
d2 = — 0.25A/0.75 = 0.5433
N(di) = N(0.7598) -,- - 0.7763 N(d2) = N(0.5433) = 0.7065
c 96.1469N(d1) — 90e x0.75N(d2, = ) 15.6465
## 9.1.2 Simple Volatility Adjustment
To reduce the volatility problem mentioned in the escrowed divi-
dend model, several adjustments to the volatility has been suggested
in the literature. An adjustment popular among practitioners is to
replace the volatility a with cr2 = s_D̀s:_„D ; see, for instance, Chriss
(1997). This approach increases the volatility relative to the basic
escrowed divided process. However, the adjustment yields too high
volatility if the dividend is paid out early in the option's lifetime. The
approach typically overprices call options in this situation and can
give arbitrage opportunities.
9.1.3 Haug- Haug Volatility Adjustment
The following is a volatility adjustment that has been suggested, used
in combination with the escrowed dividend model. The adjustment
seems to have been discovered independently by Haug and Haug
(1998), as well as by Beneder and Vorst (2001). a in the BSM formula
is replaced with cradj, and the stock price minus the present value of
the dividends until expiration is substituted for the stock price.
)2
_2 Sa So-
uadj ( s ELI Diert, )2 to) ( 5 fl D rt. ie
x (t2 — 1'0+ • • • ±a2(T — tn)
rt
s
= E
o-
s 1=1 _ E7=j Dierti
(t j — tj_1)± a2(T — tn) (9.1)
This method seems to work better than, for instance, the volatility
adjustment discussed by Chriss (1997). It is still simply a rough
approximation, though, with little theory behind it. For this reason,
there is no guarantee for it to be accurate in all circumstances.370 CHAPTER 9. OPTIONS ON STOCKS
Computer algorithm
Below is the computer code for calculating the Haug-Haug volatility
adjustment to be used in combination with the escrowed dividend
process.
Function HaugHaugVol(S As Double, T As Double, r As Double, _
Dividends As Variant, DividendTimes As Variant, v As Double) As Double
Dim SumDividends As Double, sumVolatilities As Double
Dim n As Integer , j As Integer , i As Integer
n = Application . Count( Dividends ) ' number of dividends
sumVolatilities = 0
For j = 1 To n + 1
SumDividends = 0
For i = j To n
SumDividends = SumDividends + Dividends( i) _
* Exp(—r * DividendTimes(i))
Next
If j = 1 Then
sumVolatilities = sumVolatilities
+ (S * v / (S — SumDividends))^2 * DividendTimes(j)
ElseIf j < n + 1 Then
sumVolatilities = sumVolatilities _
+ (S * v / (S — SumDividends)^2 _
* ( DividendTimes (j ) — DividendTimes (j — 1))
Else
sumVolatilities = sumVolatilities _
+ 102 * (T — DividendTimes(j — 1))
End If
Next
HaugHaugVol = Sqr( sumVolatilities / T)
End Function
## 9.1.4 Bos-Gairat-Shepeleva Volatility Adjustment
Bos, Gairat, and Shepeleva (2003) suggest the following volatility
adjustment to be used in combination with the escrowed dividend
adjustment:
n
Cr (S, X, T) 2 cr.‘,/
Jr
4e EDie [N(zi)— N(z)
2T Jj N /T i=1
(9.2)
n n
EDipj —r(ti+ti) [N(z2) — N _ z2
2o- min(ti, tj))]
where n is the number of dividends in the option's lifetime, s = ln(S),
x 1n[(X + DT)e -rT ], where DT , and
Z1 = ± Z2 = Z1 ± aNif aff 2
ii
s — x9.1. EUROPEAN OPTIONS ON STOCK 371
The method is quite accurate for most cases. For very large or with
multiple dividend payouts, the method can yield significant mispric-
ing, however. See Haug, Haug, and Lewis (2003) for a more detailed
discussion.
Computer algorithm
Function BosGaiShepVol(S As Double, X As Double, T As Double, r As Double, _
v As Double, Optional DividendTimes As Object, _
Optional Dividends As Object)
Dim n As Integer, i As Integer , j As Integer
Dim siunl As Double, sum2 As Double
Dim zl As Double, z2 As Double
Dim ti As Double, tj As Double
Dim dt As Double
n = Application .Count(Dividends)
dt = 0
For i = 1 To n
dt = dt + Dividends(i) * Exp(—r * DividendTimes(i))
Next
S = Log(S)
X = Log((X + dt) * Exp(—r * T))
zl = (S — X) / (v * Sqr(T)) + v * Sqr(T) / 2
z2 = (S — X) / (v * Sqr(T)) + v * Sqr(T)
suml = 0
sum2 = 0
For i = 1 To n
ti = DividendTimes( )
suml = siunl + Dividends(i) i ) * Exp(—r * ti ) _
* (CND(z1) — CND(z1 — v * ti / Sqr(T)))
For j = 1 To n
tj = DividendTimes(j )
sum2 = siun2 + Dividends(i) * Dividends(j )
* (CND(z2) — CND( z2 — 2 * v * Min( ti , tj )))
Next
Next
BosGaiShepVol = Sqr(vA2 + v Sqr(Pi / (2 * T)) _
* (4 * Exp(z1^2 / 2 — 5) _
* suml + Exp(z2^2 / 2 — 2 * S) * siun2))
End Function
* Exp(—r * (ti + tj )) _
## 9.1.5 Bos-Vandermark
A slightly different way to implement the escrowed dividend method
is to adjust the stock price and strike Bos and Vandermark (2002).
C CBSAI(S Xn , X ± X f , T, r, b,cr), (9.3)372 CHAPTER 9. OPTIONS ON STOCKS
where cBsm (•) is the BSM formula and
xn =E nT Die—rti
t•
X f = E L T Die—rt' ,
i=1
where n is the number of cash dividends in the option's lifetime, t, is
the years to dividend payout i, and Di is the cash dividend at time ti.
As usual, T is the number of years to maturity on the option.
This approach seems to work better than the approximations men-
tioned above. It still suffers from approximation errors for large
dividends, just like the Bos, Gairat, and Shepeleva (2003) approxima-
tion. Numerical investigations indicate that this is a fast and efficient
approximation that should work in most practical cases. The main
drawback is that it works only for European options, while in practice
most options on an asset with discrete dividends are American.
Computer algorithm
Below is the code using the BSM formula with the Bos-Vandermark
adjustment for discrete cash dividends. The variable Dividends can be
an array of the cash dividends, and DividendTimes is correspondingly
an array with the times the dividends are paid, measured in years to
maturity.
Function GBlackScholesBVCashDividend(CallPutFlag As String, S As Double, _
X As Double, T As Double, r As Double, b As Double, v As Double, _
Optional Dividends As Object, Optional DividendTimes As Object) As Double
Dim i As Integer , n As Integer
Dim Xn As Double, Xf As Double
n = Application . Count( Dividends )
Xn = 0
Xf = 0
For i = 1 To n
Xn = Xn + (T — DividendTimes( i )) / T * Dividends(i) i ) _
* Exp(—r * DividendTimes(i))
Xf = Xf + (DividendTimes( i )) / T * Dividends( ) _
* Exp(—r * DividendTimes(i ))
Next
GBlackScholesBVCashDividend = GBlackScholes(CallPutFlag, _
S — Xn, X + Xf * Exp( r * T), T, r, b, v)
End Function
9.2 NON-RECOMBINING TREE
The motivation for using tree models is that they easily handle
American options with discrete dividends.9.2. NON-RECOMBINING TREE 373
An alternative to the escrowed dividend approximation is to use
non-recombining lattice methods. If implemented as a binomial or
trinomial tree, one builds a new tree from each node on each dividend
payment date. A problem with all non-recombining lattices is that
they are time-consuming to evaluate. This problem is amplified with
multiple dividends. As pointed out by Haug, Haug, and Lewis (2003),
the literature on non-recombining trees does not account for the fact
that a constant dividend D can't be paid at arbitrarily low stock
prices.1 Even if the method is "dead wrong" by allowing negative stock
prices, numerical investigation indicates that a non-recombining tree
still is fairly accurate (and efficient) in the case of one or two dividend
payments.
Computer algorithm
Function BinomialDiscreteDividends(CallPutFlag As String, _
AmeEurFlag As String, S As Double, X As Double, T As Double, r As Double,
v As Double, n As Integer, Optional CashDividends As Variant, _
Optional DividendTimes As Variant)
Dim TmpDividendTimes() As Variant
Dim TmpCashDividends() As Variant
Dim StockPriceNode() As Double
Dim OptionValueNode() As Double
Dim No0fDividends As Integer, Binary As Integer
Dim Df As Double, dt As Double
Dim u As Double, d As Double, uu As Double
Dim p As Double, z As Double
Dim i As Integer , j As Integer
Dim StepsBeforeDividend As Integer
Dim DividendAmount As Double
Dim ValueNotExercising As Double
If IsMissing(DividendTimes) Or IsEmpty(DividendTimes) Then
No0fDividends = 0
Else
' II Counts the number of dividend payments
No0fDividends = Application .Count(DividendTimes)
End If
If No0fDividends = 0 Then
' II If the number of dividends is zero use standard binomial model
BinomialDiscreteDividends = CRRBinomial(AmeEurFlag, CallPutFlag , S,
X, T, r, r, v, n)
Exit Function
End If
ReDim TmpDividendTimes(1 To No0fDividends) As Variant
ReDim TmpCashDividends(1 To No0fDividends) As Variant
lOne exception is Wilmott, Dewynne, and Howison (1993, p. 399), who mention the
problem and suggest to let the company go bankrupt if the dividend is larger than
the asset price.374 CHAPTER 9. OPTIONS ON STOCKS
If CallPutFlag = "c" Then
Binary = 1 ' // call option
ElseIf CallPutFlag = "p" Then
Binary = —1 ' // put option
End If
dt = T / n
Df = Exp( — r * dt )
u = Exp( v * Sqr( dt ))
d= 1 / u
uu = u^2
P = (Exp(r * dt) — d) / — d)
DividendAmount = CashDividends ( 1)
For i = 1 To No0fDividends — 1 Step 1
TmpCashDividends( i ) = CashDividends ( i + 1)
TmpDividendTimes ( i ) = DividendTimes ( i + 1) — DividendTimes ( 1)
Next
StepsBeforeDividend = Int ( DividendTimes ( 1) / T * n)
ReDim StockPriceNode ( 1 To StepsBeforeDividend + 2) As Double
ReDim OptionValueNode( 1 To StepsBeforeDividend + 2) As Double
StockPriceNode ( 1) = S * dAStepsBeforeDividend
For i = 2 To StepsBeforeDividend + 1 Step 1
StockPriceNode ( i ) = StockPriceNode ( i — 1) * uu
Next
'11 Calculate option values for nodes time step just before dividend
For i = 1 To StepsBeforeDividend + 1 Step 1
ValueNotExercising = BinomialDiscreteDividends ( CallPutFlag , AmeEurFlag , _
StockPriceNode ( i ) — DividendAmount , X, T — DividendTimes ( 1) , r, v, n _
— StepsBeforeDividend , TmpCashDividends , TmpDividendTimes)
If AmeEurFlag = "a " Then
OptionValueNode( i ) = Max( ValueNotExercising , Binary _
* ( StockPriceNode ( i ) — X))
ElseIf AmeEurFlag = "e" Then
OptionValueNode( i ) = ValueNotExercising
End If
Next
'I/Option values before dividend payment "standard binomial"
For j = StepsBeforeDividend To 1 Step —1
For i = 1 To j + 1 Step 1
StockPriceNode ( i ) = d * StockPriceNode ( i + 1)
If AmeEurFlag = "a " Then
OptionValueNode( i ) = Max( (p * OptionValueNode( i + 1) _
+ (1 — p) * OptionValueNode ( i ) ) _
* Df, Binary * ( StockPriceNode ( i ) — X))
ElseIf AmeEurFlag = "e" Then
OptionValueNode( i ) = (p * OptionValueNode( i + 1) _
+ (1 — p) * OptionValueNode( i )) * Df
End If
Next9.4. THE ROLL, GESKE, AND WHALEY MODEL 375
Next
BinomialDiscreteDividends = OptionValueNode(1)
End Function
9.3 BLACK'S METHOD FOR CALLS ON STOCKS
WITH KNOWN DIVIDENDS
Black (1975) describes an approximation to the value of an American
call on a dividend paying stock. This is basically the escrowed divi-
dend method, where the stock price in the BSM formula is replaced
with the stock price minus the present value of the dividend. To take
into account the possibility of early exercise, one also computes an
option value just before the dividend payment, without subtracting
the dividend. Next, one takes the maximum of the two option val-
ues. The method has the same drawbacks as the escrowed dividend
model, in addition to not optimally taking into account the value of
early exercise possibilities.
9.4 THE ROLL, GESKE, AND NV-HALEY MODEL
Roll (1977), Geske (1979a), and Whaley (1981) developed a formula
for the valuation of an American call option on a stock paying a sin-
gle dividend of D, with time to dividend payout t. It has for a long
time been considered a closed-form solution for American call options
on dividend-paying stocks. However, as pointed out by Beneder and
Vorst (2001), Haug, Haug, and Lewis (2003), and others, the model is
based on the escrowed dividend price process and is seriously flawed,
resulting in arbitrage opportunities among other problems.
C --::', (S — De —rt )N(bi) + (S — De —rt )M ( ai, —b1; —
— Xe rT M (a2. —b2; — ) — (X — D)e —rt N(b2), (9.4)
where
ln[(S — De—rt )I X] (r o-2/2)T
al =
a 0 7
a2 = al —
ln[(S — De—rt )//] (r a2/2)t
=
a N/7
b2 = b1 —376 CHAPTER 9. OPTIONS ON STOCKS
where N(x) is the cumulative normal distribution function and
M(a,b; p) is the cumulative bivariate normal distribution function
with upper integral limits a and b, and correlation coefficient p, as
described in Chapter 13. 1 is the critical ex-dividend stock price /
that solves
c(I, T — r) = I D — X,
where c(/, X, T - t) is the value of a European call with stock price /
and time to maturity T - t. If D < X(1 - e-r(T-`)) or / = oo, it will not
be optimal to exercise the option before expiration, and the price of the
American option can be found by using the BSM formula where the
stock price is replaced with the stock price minus the present value
of the dividend payment S - De-rt.
This model was for many years considered a brilliant closed-form
solution. As indicated above, the approach has considerable flaws that
lead to significant arbitrage opportunities, and thus renders it more
or less useless for all practical purposes. See Haug, Haug, and Lewis
(2003) for more details on its shortcomings.
Example
Consider an American-style call option on a stock that will pay a div-
idend of 4 in exactly three months. The stock price is 80, the strike
price is 82, time to maturity is four months, the risk-free interest rate
is 6%, and the volatility is 30%. S = 80, X = 82, t = 0.25, T = 0.3333,
r =0.06, D = 4, a =0.3.
1n1(80 _ 4e 0625) /82] + (0.06 + 0.32/2)0.3333
a 1 = =-0.2321
0.3N/0.3333
a2 = al — 0.3i0.3333 = —0.4053
The critical stock price / solves
c(I, 82, 0.3333 — 0.25) = / + 4 — 82
The solution, given by a numerical search algorithm, is / = 80.1173.
Moreover:
II-4(80 — 4e 0625 )/80.1 173] + (0.06 + 0.32/2)0.25
b1 = = —0.1715
0.3,s/0.25
b2 -,-- bi — 0.3,./0.25 = —0.3215
0.25 ) 1/ 0.25 )
= 0.0703 M a2, — b2; = 0.0632
0.3333 0.3333
M (al. —bi;9.4. THE ROLL, GESKE, AND WHALEY MODEL 377
N(b1) = N(-0.1715)= 0.4319 N(b2)= N(-0.3215)= 0.3739
_ 4e-0.06x0.25)Nc I . 4e-0.06x0.25)m al; _bi;
0.25 )
C (80 )t (80
4.3333
_ 82e-0.06x0.3333 A, _ _,..
2, , Y, u2, u 4.3333
(
— (82_ 4)e-0.06x0.25 N — 2.
(D ) = 4.3860
The value of a similar European call is 3.5107.
Example of Arbitrage Opportunities
Consider the case of an initial stock price of 100, strike 130, risk-free
rate 6%, volatility 30%, one year to maturity, and an expected dividend
payment of seven in 0.9999 years. Using this input, the RGW model
posits a value of 4.3007. Consider now another option, expiring just
before the dividend payment, say, in 0.9998 years. Since this in effect
is an American call on a non-dividend-paying stock, it is not optimal
to exercise it before maturity. In the absence of arbitrage, the value
must therefore equal the BSM price of 4.9183. This is, however, an
arbitrage opportunity! The arbitrage occurs because the RGW model
is misspecified, in that the dynamics of the stock price process depends
on the timing of the dividend. Similar examples have been discussed
by Beneder and Vorst (2001) and Frishling (2002). This is not just
an esoteric example, as several well-known software systems use the
RGW model and other similar misspecified models.
Computer algorithm
Function RollGeskeWhaley(S As Double, X As Double, ti As Double, _
T2 As Double, r As Double, d As Double, v As Double) As Double
't1 time to dividend payout
'T2 time to option expiration
Dim Sx As Double, i As Double
Dim al As Double, a2 As Double, bl As Double, b2 As Double
Dim HighS As Double, LowS As Double, epsilon As Double
Dim ci As Double, infinity As Double
infinity = 1000000000
epsilon = le-08
Sx = S — d * Exp(—r * ti)
If d <= X * (1 — Exp(—r * (T2 — t1))) Then 'II Not optimal to exercise
RollGeskeWhaley = GBlackScholes("c" , Sx, X, T2, r, r, v)
Exit Function
End If
ci = GBlackScholes("c", S, X, T2 — tl , r, r, v)
HighS = S
While ( ci — HighS — d + X) > 0 And HighS < infinity
HighS = HighS * 2378 CHAPTER 9. OPTIONS ON STOCKS
ci = GBlackScholes("c", HighS, X, T2 — ti, r, r, v)
Wend
If HighS > infinity Then
RollGeskeWhaley = GBlackScholes("c", Sx, X, T2, r, r, v)
Exit Function
End If
LowS .-- 0
i = HighS * 0.5
ci = GBlackScholes("c", i , X, T2 — ti , r, r, v)
'II Search algorithm to find the critical stock price I
While Abs(ci — i — d + X) > epsilon And HighS — L,owS > epsilon
If (ci — i — d +X) < 0 Then
HighS = i
Else
LowS = i
End If
i = (HighS + LowS) / 2
ci = GBlackScholes("c", i , X, T2 — ti , r, r, v)
Wend
al = (Log(Sx / X) + (r + 102 / 2) * T2) / (v * Sqr(T2))
a2 = al — v * Sqr(T2)
bl = (Log(Sx / i) + (r + 102 / 2) * ti) / (v * Sqr(t1))
b2 = bl — v * Sqr( tl)
RollGeskeWhaley = Sx * CND(b1) + Sx * C13ND(al , —bl , —Sqr( tl / T2))
—X * Exp( — r * T2) * CBND(a2, —b2, —Sqr( tl / T2)) _
— (X — d) * Exp(—r * ti) * CND(b2)
End Function
where CND(• is the cumulative normal distribution function and
CBND(•) is the cumulative bivariate normal distribution function
described in Chapter 13.
Example: RollGeskeWhaley(80, 82, 0.25, 0.3333, 0.06, 4, 0.3) returns a
call value of 4.3860 as in the numerical example above.
9.5 BENCHMARK MODEL FOR DISCRETE
CASH DIVIDEND
This section is based on the paper by Haug, Haug, and Lewis (2003)
(HHL). It describes what can be considered a benchmark model for
the discrete dividend option valuation problem.
9.5.1 A Single Dividend
Let us start with a European-style or American-style equity option
on a stock that pays a discrete dividend at time t = tp. The simpler
problem is to first specify a price process whereby any dividends are
reinvested immediately back into the security—this is the so-called
cum-dividend process S. In general, St is not the market price of the9.5. BENCHMARK MODEL 379
security, but instead is the market price of a hypothetical mutual
fund that only invests in the security. To distinguish the concepts, we
will write the market price of the security at time t as Yt, which we
will sometimes call the ex-dividend process. Of course, if there are no
dividends, then Yt = St for all t. Even if the company pays a dividend,
we can always arrange things so that Yo = So, which guarantees that
Yt = St for all t < tp.
The HHL model allows St to follow a very general continuous-
time stochastic process. For example, they mention the following
processes, written with dynamics under risk-adjusted probabilities
(and therefore with an expected instantaneous rate of return equal to
the risk-free rate. To keep things simple, they consider a world with
a constant rate r).
Example (Cum-Dividend) Processes
(P1) GBM: dSt = rSt di' + a St dB, where a is a constant volatility
and B is a standard Brownian motion.
(P2) Jump- diffusion: dSt = (r — Ak)S t di' + a St dBt + St dJt, where
dJt is a Poisson-driven jump process with mean jump arrival
rate A and mean jump size k.
(P3) Jump-diffusion with stochastic volatility: dSt = (r — A,k)S t dt +
o-t St dBt + StdJt, where at follows its own separate, possibly
correlated, diffusion or jump-diffusion.
Consider an option at time t, expiring at time T, and assume for
a moment that there are no dividends so that Yt = St for all t < T.
In that case, clearly, models (P1) and (P2) are one-factor models: The
option value V (St , t) depends only upon the current state of one ran-
dom variable. Model (P3) is a two-factor model, V (St , at , t). Obviously,
"n-factor" models are possible in principle, for arbitrary n, and the
Haug-Haug-Lewis treatment will apply to those, too.
Choosing a Dividend Policy
Consider the case where a company declares a single discrete dividend
of size D, where the "ex-dividend date" is at time tp. We consider an
unprotected European-style option with time to expiration after time
tp, so that the option holder will not receive the dividend. Since option
prices depend upon the market price of the security, we must now
write V (Y t , t) for one-factor models.
Note that the company "declares" a dividend D. This means that
it is the company's stated intention to pay the amount D if that is
possible. When will it be impossible? It is natural to assume that the
company cannot pay out more equity than exists. For simplicity, imag-
ine a world where there are no distortions from taxes or other frictions,
so that a dollar of dividends is valued the same as a dollar of equity. In380 CHAPTER 9. OPTIONS ON STOCKS
such a world, if the company pays a dividend D, the stock price at the
ex-dividend date must drop by the same amount: Y (tD) = Y (tL) - D =
S(t) - D, where tL is the time instantaneously before the ex-dividend
date tD. Since stock prices represent the price of a limited liabil-
ity security, we must have Y (tD) > 0, so the model is inconsistent if
S(ti) ) < D. The above models do not take this into account.
The HHL model uses the following minimal modification of the
company's dividend policy. HHL assumes that the company will
indeed pay out its declared amount D if S- > D, abbreviating S- =
S(t). However, in the case where S - < D, the company is assumed to
pay some lesser amount s(S) whereby 0 < s(S) < S. Numerical
results for two natural policy choices, namely s(S) = S-- (liquidator),
and s(S) = 0 (survivor) are reported below. The first case allows liq-
uidation because the ex-dividend stock price (at least in all of the
sample models P1-P3 above) would be absorbed at zero. The second
case (and, indeed, any model where A(S) < S) allows survival because
the stock price process can then attain strictly positive values after
the dividend payment.
These choices, liquidation versus survival, sound dramatically dif-
ferent. In cases of financial distress, where indeed the stock price is
very low, they would be. But such cases are relatively rare. As a prac-
tical matter, the choice of A(S) for S < D has a negligible financial
effect for most applications; the main point is that some choice must
be made to fully specify the model. There is little financial effect in
most applications because the probability that an initial stock price
So becomes as small as a declared dividend D is typically negligible.
To restate the idea in terms of a stochastic differential equation
(SDE) for the security price process, the model now considers the
actual dividend paid as the random variable D(S), where
ID, if S > D D(S)=
A(S) < S, if S < D (9.5)
In (9.5) D is the declared (or projected) dividend—a constant, indepen-
dent of S. The functional form for D(S) is any function that preserves
limited liability. Then, the market price of the security evolves, using
GBM as the prototype, as the SDE:
dYt =[rYt — 3(t — tD)D(Yt-)1dt + aYtdBt, (P1a)
D
where 8(t - tD) is Dirac's delta function centered at tD. The same SDE
drift modification occurs for (P2), (P3), or any other security price
process you wish to model.
It's worth stressing that the Brownian motion Bt that appears in
(P1) and (Pla) have identical realizations. You might want to picture9.5. BENCHMARK MODEL 381
a realization of Bt for 0 < t < T. Your mental picture will ensure that
Yr = - Sr for all t < tp and YtD = StD — D(StD ). Note that Yt is completely
determined by knowledge of St alone for all t < tr. (the fact that YtD =
f (StD ), where f is a deterministic function, will be crucial later).
To utilize this setup to value options, you need to be able to solve
for the option value and the transition density for the cum-dividend
stock price, (S0, St , t), in the absence of dividends.2 You need not have
these functions in so-called "closed form," but merely have available
some method of obtaining them. This method may be an analytic for-
mula, a lattice method, a Monte Carlo procedure, a series solution, or
whatever.
The Main Result
Now write VE (St t; D, tD) for the time-t fair value of a European-style
option that expires at time T, in the presence of a discrete dividend
D paid at time tp. The last two arguments are the main parameters
in the fully specified dividend policy {tD, D(S)}, where t < t D < T. If
there is no dividend between time t and the option expiration T, we
simply drop the last two arguments and write VE (St, t). SO, to be clear
about notation, when you see an option value V(.) that has only two
arguments, this will be a formula that you know in the absence of
dividends, like the BSM formula. Again, the strike price X, option
expiration T, and other parameters and state variables have been
suppressed for simplicity. With this notation the main result is as
follows:
The adoption by a company of a single discrete dividend policy
{tD, D(S)}, causes the fair value of a European-style option to change
from VE (So, 0) to VE(So, 0; D, tD), where
oc
VE (So, 0; D, tD) = e—rt°
j VE(S — D(S), tD)0(So, S,tD)S (9.6)
For more details including mathematical proofs see Haug, Haug,
and Lewis (2003).
Example
Take GBM, where the dividend policy is A(S) = S (liquidator) for S <
D. Then (9.6) for a call option becomes
00
CE(So. 0; D. t D) = e—rt° CE(S — D, D)0 (So, S,11)) (9.7)
2The transition density is the probability density for an initial state (stock price plus
other state variables) So to evolve to the final state St in a time t. This evolution
occurs under the risk-adjusted, cum-dividend process (or measure) such as the ones
given under "Example (cum-dividend) processes" above. For GBM, (So, St , t) is the
familiar lognormal density.382 CHAPTER 9. OPTIONS ON STOCKS
Note that the call price in the integrand of (9.6) is zero for S — D(S) = 0
(S < D). In (9.7), 4, (So, S, t) is simply the (no-dividend) lognormal den-
sity and C E (S — D, t D) is simply the no-dividend BSM formula with
time-to-go T — t D. For example, suppose So = X = 100, T = 1 (year),
r =0.06, a =0.3, and D = 7. Then consider two cases: (i) tp = 0.01,
and (ii) tp = 0.99. We find from (9.7) the high precision results:
(i) E (100 . 0; 7, 0.01) = 10.59143873835989 and (ii) E (100 , 0; 7, 0.99) =
11.57961536099359.
American-Style Options
It is well known that for an American-style call option with a discrete
dividend, early exercise is only optimal instantaneously prior to the
ex-dividend date Merton (1973). This result, of course, applies to the
present model. Hence, to value an American-style call option with a
single discrete dividend, you merely replace (9.6) with
oo
C A(So, 0; D, t D) = e—rtp f maxYS — X)+, C E (S — D(S), D)}0 (SO, S, t D)8 (9.8)
0
Early exercise is never optimal unless there is a finite solution S*
to S* — X = CE (S * — D, tD), where we are assuming that X> D (a
virtual certainty in practice).
For American-style put options, as is also well known, it can be
optimal to exercise at any time prior to expiration, even in the absence
of dividends. So, in this case, you are generally forced to a numerical
solution, evolving the stock price according to your model. This is the
well-known backward iteration. What may differ from what you are
used to is that you must allow for an instantaneous drop of D(S) on
the ex-date.
## 9.5.2 Multiple Dividends
With the sequence of dividends f(D,, 017_ 1 , ti <t2 < < t,„ the
argument behind formula (9.6) still holds. Simply repeat it iteratively,
starting at time t,_ by applying (9.6) to the last dividend (Dn, tn)•
While straightforward, this procedure involves evaluating an n-fold
integral. I therefore show a simpler way to compute it in the next
section.
## 9.5.3 Applications
To illustrate the application of the pricing formula, we now specialize
the option contracts as well as the stock price process.
European Call and Put Options The following put-call parity
holds:9.5. BENCHMARK MODEL 383
For a general cum-dividend price process St and dividend policy
D(S) as in (9.5),
C E (So, 0; D, t D) e'T X ± e'D = PE(So, 0; D, tD) + SO, (9.9)
where
Dr= D-
Jo
is the expected received dividend.
For the case of GBM stock price and liquidator dividend, 6,(S) =
S for S < D, the value of a European call option can be written
explicitly as
oo 1 12
C E (So, 0; D, tD) = e-ri° f CE (Sod- -a2 12)tp-pa ,/715x _ D, tD) dx (9.10)
in (D I So) - - a 2 / tD
d =
aN/-17- 1)
A similar expression can be written down for the put option, but this
is really not necessary in light of (9.9).
Tables 9-1 and 9-2 report option prices for European call options
for small and large dividends. The tables use the symbols:
BSM is the plain vanilla Black–Scholes–Merton model.
M73 is the BSM model with S – etD D substituted for S—the
escrowed dividend adjustment Merton (1973).
Vol1 is identical to M73, but with an adjusted volatility. The volatil-
ity of the asset is replaced with a2 – s _:_r stpD See, for example,
Chriss (1997).
Vo12 is a slightly more sophisticated volatility adjustment than Voll,
the Haug-Haug volatility adjustment.
Vo13 is the volatility adjustment suggested by Bos, Gairat, and
Shepeleva (2003).
BV adjusts the strike and stock price, to take into account the effects
of the discrete dividend payment (Bos and Vandermark, 2002).
Num is a non-recombining binomial tree with 500 time steps, and no
adjustment to prevent the event that S – D < 0.
HHL(9.7) is the exact solution in (9.7).384 CHAPTER 9. OPTIONS ON STOCKS
TABLE 9-1
European Calls with Dividend of 7
(S = 100, T = 1, r =6%, a =30%)
BSM Mer73 Voll Vo12 Vo13 BV Num HHL(9.7)
X = 100
0.0001 14.7171 10.5805 11.4128 10.5806 10.5806 10.5806 10.5829 10.5806
0.5000 14.7171 10.6932 11.5001 11.1039 11.0781 11.0979 11.1079 11.1062
0.9999 14.7171 10.8031 11.5855 11.5854 11.5383 11.5887 11.5704 11.5887
X = 130
0.0001 4.9196 3.0976 3.7403 3.0977 3.0977 3.0977 3.0987 3.0977
0.5000 4.9196 3.1437 3.7701 3.4583 3.4383 3.4159 3.4368 3.4383
0.9999 4.9196 3.1889 3.7993 3.7993 3.7616 3.7263 3.7140 3.7263
X =70
0.0001 34.9844 28.5332 28.9113 28.5332 28.5332 28.5332 28.5343 28.5332
0.5000 34.9844 28.7200 29.0832 28.9009 28.8893 28.9350 28.9218 28.9215
0.9999 34.9844 28.9016 29.2504 29.2504 29.2286 29.3257 29.3140 29.3257
Table 9-1 illustrates that the M73 adjustment is inaccurate,
especially in the case when the dividend is paid close to the option's
TABLE 9-2
European Calls with Dividend of 50
(S = 100, T = 1, r =6%, a =30%)
BSM Mer73 Voll Vo12 Vo13 BV Num HHL(9.7)
X = 100
0.0001 14.7171 0.1282 2.9961 0.1283 0.1282 0.1283 0.1273 0.1283
0.5000 14.7171 0.1696 3.0678 1.4323 0.5755 0.8444 1.0687 1.0704
0.9999 14.7171 0.2192 3.1472 3.1469 1.1566 2.1907 2.1825 2.1908
X = 130
0.0001 4.9196 0.0094 1.3547 0.0094 0.0094 0.0094 0.0092 0.0094
0.5000 4.9196 0.0133 1.3556 0.4313 0.0947 0.1516 0.2264 0.2279
0.9999 4.9196 0.0184 1.3609 1.3607 0.2510 0.6120 0.6072 0.6120
X = 70
0.0001 34.9844 1.6510 7.0798 1.6517 1.6513 1.6514 1.6515 1.6517
0.5000 34.9844 1.9982 7.3874 4.9953 3.3697 4.2808 4.7304 4.7299
0.9999 34.9844 2.3780 7.7100 7.7096 4.9966 7.2247 7.2122 7.22489.5. BENCHMARK MODEL 385
expiration. Moreover, the Voll adjustment, often used by practition-
ers, yields significantly inaccurate values when the dividend is close
to the beginning of the option's lifetime. Both Vo12 and BV do much
better at accurately pricing the options. Vo13 yields values very close
to the BV model. The non-recombining tree (Num) and the "exact"
HHL solution (9.7) give very similar values in all cases. However, the
non-recombining tree is not ensured to converge to the HHL solu-
tion (9.7) in all situations, unless the non-recombining tree is set up
to prevent negative stock prices in the nodes where S - D < 0. This
problem will typically be relevant only with a very high dividend. For
low to moderate cash dividends, one can assume that even the "naive"
non-recombining tree and the HHL solution agree to economically
significant accuracy.
Table 9-2 shows that the BV and the non-recombining tree have sig-
nificant differences when there's a significant dividend in the middle
of the option's lifetime. The latter is closer to the true value. The Vo13
model strongly underprices the option when the dividend is this high.
American Call and Put Options Most traded stock options are
American. Tables 9-3 to 9-5 offer a numerical comparison of stock
options with a single cash dividend payment. The tables use the
following models that differ from the European options considered
above.
TABLE 9-3
American Calls with Dividend of 7
(D = 7, S = 100, T = 1, r = 6%, a = 30%)
B75 RGW Num HHL(9.8)
X = 100
0.0001 10.5805 10.5805 10.5829 10.5806
0.5000 10.6932 11.1971 11.6601 11.6564
0.9999 14.7162 13.9468 14.7053 14.7162
X = 130
0.0001 3.0976 3.0976 3.0987 3.0977
0.5000 3.1437 3.1586 3.4578 3.4595
0.9999 4.9189 4.3007 4.9071 4.9189
X -70
0.0001 30.0004 30.0004 30.0000 30.0004
0.5000 32.3034 32.3365 32.4604 32.4608
0.9999 34.9839 34.7065 34.9737 34.9839386 CHAPTER 9. OPTIONS ON STOCKS
TABLE 9-4
American Calls with Dividend of 30
(D =30, S = 100, T = 1, r = 6%, a = 30%)
1375 RGW Num HHL(9.8)
X = 100
0.0001 2.0579 2.0579 2.0574 2.0583
0.5000 9.8827 7.5202 9.9296 9.9283
0.9999 14.7162 11.4406 14.7053 14.7162
X = 130
0.0001 0.3345 0.3345 0.3322 0.3346
0.5000 1.6439 0.6742 1.7851 1.7855
0.9999 4.9189 2.4289 4.9071 4.9189
X =70
0.0001 30.0004 30.0004 30.0000 30.0004
0.5000 32.3034 32.0762 32.3033 32.3037
0.9999 34.9839 34.1637 34.9737 34.9839
B75 is the approximation to the value of an American call on a
dividend-paying stock suggested by Black (1975). This is basi-
cally the escrowed dividend method, where the stock price in the
TABLE 9-5
American Calls with Dividend of 50
(D 50, S = 100, T = r = 6%, cr =30%)
B75 RGW Num HHL(9.8)
X = 100
0.0001 0.1282 0.1437 0.1273 0.1922
0.5000 9.8827 5.8639 9.8745 9.8828
0.9999 14.7162 9.3137 14.7053 14.7162
X = 130
0.0001 0.0094 0.0094 0.0092 0.0094
0.5000 1.6439 0.1375 0.5112 1.6492
0.9999 4.9189 1.1029 4.9071 4.9189
X =70
0.0001 30.0004 30.0004 30.0000 30.0004
0.5000 32.3034 32.0762 32.6600 32.3034
0.9999 34.9839 34.1637 34.9737 34.98399.5. BENCHMARK MODEL 387
BSM formula is replaced with the stock price minus the present
value of the dividend. To take into account the possibility of early
exercise, one should also compute an option value just before the
dividend payment, without subtracting the dividend. The value
of the option is considered to be the maximum of these values.
RGW is the model of Roll (1977), Geske (1979a), and Whaley (1981).
It is considered a closed-form solution for American call options
on dividend-paying stocks. As we already know, the model is
seriously flawed.
HHL is the exact solution in (9.8), again using the liquidator policy.
Table 9-3 shows that the RGW model works reasonably well when
the dividend is in the very beginning of the option's lifetime. The RGW
model exhibits the same problems as the simpler M73 or escrowed
dividend method used for European options. The pricing error is par-
ticularly large when the dividend occurs at the end of the option's
lifetime. The B75 approximation also significantly misprices options.
For a very high dividend, as in Table 9-5, the mispricing in the RGW
formula is even more clear; the values are significantly off compared
with both non-recombining tree (Num) and the exact HHL solution
(9.8). The simple B75 approximation is remarkably accurate. The
intuition behind this is that a very high dividend makes it very likely
to be optimal to exercise just before the dividend date—a situation
where the B75 approximation for good reasons should be accurate.
Multiple Dividend Approximation
It is necessary to evaluate an n-fold integral in the HHL model when
there are multiple dividends. It is therefore useful to have a fast,
accurate approximation. We next show how to approximate the option
value in the case of a call option on a stock whose cum-dividend price
follows a GBM, using the liquidator dividend policy.
First, let's write the exact answer on date t with a sequence of n
dividends prior to T as C, (S, X, t, T), where X is the strike and T is the
expiration date. Then, the first iteration of (9.7) in an exact treatment
becomes
00
CI(S, X, 41_1, T) = e-r(t"-tn-i ) f Cgsm(Si - Dn, X, tn, T)95(S, SI, tn tn- l)dS1 ,
D n
(9.11)
where CBsm (.) is the BSM model. This integral is quick to evalu-
ate, just as in the single dividend cases tabulated above. The second
iteration becomes
oo
C2(S. X. tn-2, Ti = e-r(t"-i-t"-2) f CI (Si - Dn_i, X, tn_i, T)0(S, S1, t n_i - tn_DdSi
Dn_,
(9.12)388 CHAPTER 9. OPTIONS ON STOCKS
Notice that we now integrate not over the BSM model, but rather
the option price derived in the first iteration (9.11). Evaluation of
(9.12) therefore involves a double integral. We know, however, that
CI (.) will look like an option solution and hence will have many of the
characteristics of the BSM formula. If we can effectively parameterize
CI(.) with a BSM formula, then it will be quick to evaluate (9.12).
Some key characteristics of CI (S, X, tn_i, T) are as follows. First,
it vanishes as S 0. Second, because (standard) put-call parity
becomes asymptotically exact for large S,
C1 (S. X. S - e-r(T-t") X - e-r(t" -t"-1) Dn
This suggests the BSM parameterization:
CI (s, x, rn_1 , CBsm(S, Xadj, (9.13)
where Xadi = X + Dne-r(rn-T) . The strike adjustment ensures correct
large-S behavior.
A little experimentation will show that the approximating BSM for-
mula just suggested is inaccurate for S near the money. Still, we have
another degree of freedom in our ability to adjust the volatility in the
right-hand side of (9.13). By choosing cradi so that CI (S0, X, tn_i, T)
CBSM (SO, Xadj aadj, tn-1, T), where So is the original stock price of the
problem, we obtain an accurate approximation
C1(S. X, ta_i, CBSM(S, Xadj , aadj , tn-1 , T)
that often differs by less than a penny over the full range of S on
(0, oo).
This same scheme is then used at successive iterations of the
exact integration. That is, the "previous" iteration will always be fast
because it uses the BSM formula. Then after you get the answer, you
approximate that answer by a BSM formula parameterization. In that
parameterization, you choose an adjusted strike price and an adjusted
volatility to fit the large-S behavior and the So value. This enables you
to move on to the next iteration.
Table 9-6 reports call option values when there is a dividend pay-
ment of 4 in the middle of each year. The first column shows the years
to expiration for the contracts we consider. The models Vo12, Vo13, BV,
and Num are identical to the ones described earlier. HHL is the closed-
form solution from Section 2 evaluated by numerical quadrature. This
approach is computer-intensive. The table therefore reports values of
options with this method with up to three dividend payments. An
efficient implementation in, for instance, C++ will naturally make
this approach viable for any practical number of dividend payments.
Non-recombining trees are even more computer-intensive, especially9.5. BENCHMARK MODEL 389
TABLE 9-6
European Calls with Multiple Dividends of 4
(S = 100, X = 100, r =6%, a = 25%, D =4)
Num Vo12 Vo13 BV HHL Appr Adjusted
strike
Adjusted
volatility
1 10.6615 10.6585 10.6530 10.6596 10.6606 10.6606 104.122 0.2467
2 15.2024 15.1780 15.1673 15.1992 15.1989 15.1996 108.499 0.2421
3 18.5798 18.5348 18.5241 18.5981 18.5984 18.5998 113.146 0.2375
4 - 21.2297 21.2304 21.3592 - 21.3644 118.081 0.2328
5 - 23.4666 23.4941 23.6868 - 23.6978 123.320 0.2282
6 - 23.3556 25.4279 25.6907 - 25.7100 128.884 0.2237
7 - 26.9661 27.1023 27.4395 - 27.4695 - -
for multiple dividends. They also entail problems with propagation
of errors when the number of time steps is increased, and the table
therefore reports option values for only up to three dividends (three
years to maturity), with 500 time steps for T = 1, 2 and 1000 time
steps for T = 3. The column Appr is the approximation just described.
The two rightmost columns report the adjusted strike and voiatility
used in this approximation method.
The approximation just suggested (Appr) is clearly very accurate
when compared to the exact solution (HHL). The non-recombining
binomial implementation (Num) of the spot process also yields results
very close to HHL. Vo12 and Vo13 seem to give rise to significant
mispricing with multiple dividends. The BV approximation seems
somewhat more accurate. However, as we already know, it signif-
icantly misprices options when the dividend is very high. From
a trader's perspective, the HHL-based models seem to be a clear
choice-at least if you care about having a robust and accurate model
that will work in "any" situation. Remember also that the HHL
method is valid for any price process, including stochastic volatility,
jumps, and other factors that can have a significant impact on pricing
and hedging.
Exotic and Real Options on Dividend-Paying Stocks
There are a wide variety of exotic options that trade in the OTC
equity market, and many are embedded in warrants and other com-
plex equity derivatives (see Chapters 4 and 5). The HHL approach
to options pricing in the presence of discrete dividends also holds in
these cases. Many exotic options, in particular barrier options, are
known to be very sensitive to stochastic volatility. Luckily, the model
described above also holds for stochastic volatility, jumps, volatility
term structure, as well as other factors that can be of vital importance
when pricing exotic options. The HHL model should also be relevant to390 CHAPTER 9. OPTIONS ON STOCKS
real options pricing, when the underlying asset offers known discrete
payouts (of generic nature) during the lifetime of the real option.
9.6 OPTIONS ON STOCKS WITH DISCRETE
DIVIDEND YIELD
If the stock price of a company increases the company is typically doing
well and one can expect the dividend payout in terms of cash per stock
to increase. On the other hand, if the stock price falls significantly, this
typically indicates that the company is not doing well and that the
company may reduce its dividend payout. Some option traders prefer
taking this form of "discrete dividend yield" explicitly into account in
the model, for long-lived equity options. If we assume the dividend
payout is a fixed percentage of the stock price, we implicitly take this
effect into account. I next present how to modify the BSM formula
to take this into account, and also present a closed-form solution for
American calls. Also presented is a recombining tree model that can be
used to value a large number of options with discrete dividend yield.
## 9.6.1 European with Discrete Dividend Yield
To value standard European call or put options on a stock paying a
discrete dividend yield, all we need to do is replace the stock price
S with S(1 — 3) in the Black and Scholes (1973) formula, where B is
the discrete dividend yield. In the case of multiple dividends, replace
S with S = S(1 — S)' , where i is the number of dividends, or in the
mostgeneral case with varying discrete dividend yield, we have S =
S(1 31)(1 32) • • (1 — 3n).
## 9.6.2 Closed-Form American Call
Villiger (2005) suggests a closed-form solution for an American call
on assets paying a discrete dividend yield 6. The solution is based on
some of the same ideas as the Roll-Geske-Whaley formula, but in this
case, due to discrete dividend yield versus absolute cash dividend, it
does not contain the serious flaws of the Roll-Geske-Whaley formula.
C = SN(bi) ± (I - 8)SM( al , -b1; -fl y)
- X e-r T M (a2 —b2; — ) - Xe-rt N (62), (9.14)9.6. OPTIONS ON STOCKS 391
TABLE 9-7
Examples of American Calls with Discrete Dividend Yield
Closed Form
(S = 100, X = 102, T = 0.5, r = 0.1)
a =0.15 a =0.3
8 t = 0.1 t = 0.25 t =0.4 t = 0.1 t -= 0.25 r = 0.4
1% 5.2072 5.2072 5.2397 9.3036 9.3036 9.3578
2% 4.6298 4.6300 5.0516 8.7333 8.7403 9.1232
5% 3.1468 3.7178 4.8766 7.1533 7.6473 8.7883
10% 1.9218 3.3357 4.8320 5.2984 6.8202 8.5928
15% 1.5620 3.2615 4.8297 4.3020 6.4667 8.5389
20% 1.4695 3.2509 4.8297 3.7852 6,3140 8.5266
where t is the time to dividend payment and T is the time to maturity
and
Inkl - 3)S/ X] ± (r ± a 2 /2)T
al =
a
a2 = al - a,.'7
ln(S I I) ± (r ±a2/2)t
b1=
a-,/i
b2=- b1 -
where N(x) is the cumulative normal distribution function, and
M(a,b; p) is the cumulative bivariate normal distribution function
with upper integral limits a and b, and correlation coefficient p, as
described in Chapter 13. I is the critical ex-dividend stock price that
solves
c(I (1 - 5), X, T - t) = I - X ,
where c(/ (1 - 3), X, T - t) is the value of a European call with stock
price I (1 - 8) and time to maturity T - t.
Table 9-7 gives values of American call options on a stock paying
discrete dividend yield, for different choices of dividend yield 8, time
to dividend payment t, and volatility a.
Computer algorithm
Here I present the VBA code for an American call on a stock paying
a single discrete dividend yield. The method can be extended to a
multiple dividends.
Function DiscreteDividenYieldAnalytic(EurAmeFlag As String, S As Double, _
X As Double, tl As Double, T2 As Double, _392 CHAPTER 9. OPTIONS ON STOCKS
r As Double, Dy As Double, v As Double) As Double
'ti time to dividend payout
'T2 time to option expiration
Dim Sx As Double, i As Double
Dim al As Double, a2 As Double, bl As Double, b2 As Double
Dim HighS As Double, LowS As Double, epsilon As Double
Dim ci As Double, infinity As Double
infinity = 1000000000
epsilon = le-08
Sx = S * (1 — Dy)
If EurAmeFlag = "e" Or S * (1 — Dy) <= X * (1 — Exp(—r * (T2 — ti))) Then
'II Not optimal to exercise
DiscreteDividenYieldAnalytic = GBlackScholes("c" , Sx, X, T2, r, r, v)
Exit Function
End If
ci = GBlackScholes("c", S, X, T2 — ti, r, r, v)
HighS = S
While ( ci — HighS + X) > 0 And HighS < infinity
HighS = HighS * 2
ci = GBlackScholes("c", HighS * (1 — Dy), X, T2 — ti , r, r, v)
Wend
If HighS > infinity Then
DiscreteDividenYieldAnalytic = GBlackScholes("c", Sx, X, T2, r, r, v)
Exit Function
End If
LowS = 0
i = HighS * 0.5
ci = GBlackScholes("c", i * (1 — Dy), X, T2 — ti , r, r, v)
'II Search algorithm to find the critical stock price I
While Abs( ci — i + X) > epsilon And HighS — LowS > epsilon
If (ci — i + X) < 0 Then
HighS = i
Else
LowS = i
End If
i = (HighS + LowS) / 2
ci = GBlackScholes("c", i * (1 — Dy), X, T2 — ti , r, r, v)
Wend
al = (Log(Sx / X) + (r + vA2 / 2) * T2) / (v * Sqr(T2))
a2 = al — v * Sqr(T2)
bl = (Log(S / i) + (r + vA2 / 2) * ti) / (v * Sqr(t1))
b2 = bl — v * Sqr(t1)
DiscreteDividenYieldAnalytic = Sx * CBND(al, —bl, —Sqr(t1 / T2)) _
— X * Exp(—r * T2) * CBND(a2, —b2, —Sqr(t1 / T2)) _
+ S * CND(b1) — X * Exp(—r * ti) * CND(b2)
End Function
Example
To price an American call option with stock price 100, strike 102,
time to maturity six months, risk-free rate equal to 10%, volatility9.6. OPTIONS ON STOCKS 393
15%, time to dividend payment, three months, and proportional
dividend yield of 5%: DiscreteDividenYieldAnalytic(" a" , 100, 102, 0.25,
0.5, 0.1, 0.05, 0.15). This will return an American call option value
of 3.7178.
## 9.6.3 Recombining Tree Model
A binomial tree can be used to price options on a stock that at certain
points in time pays a known dividend yield. Before the stock goes
ex-dividend, the stock price at each node is set equal to
suldj -E, i = 0, j
After the stock goes ex-dividend, the stock price corresponds to
S(1 - 0,1, ..., j,
where j is the total dividend yield from all ex-dividend dates between
time zero and the relevant time step in the binomial tree. The binomial
tree will still be recombining.
If we choose to use the Cox, Ross, and Rubinstein (1979) parame-
ters, we have
U = ,FS7 d =
where At = T I n is the size of each time step and n is the number of
time steps. The probability of the stock price increasing at the next
time step is
eb At d
P — u — d
The probability of going down must be 1 - p, since the probability of
going either up or down equals unity.
Table 9-8 shows values from the discrete dividend binomial tree
using 500 time steps, with the same input parameters as in Table 9-7.
Computer algorithm
The code returns a column array of option value, delta, gamma,
and theta, taking into account discrete dividend yields. The years to
maturity of the dividends is put into "DividendTimes" . Similarly, the
corresponding dividend yields are going into "Dividends". The tree is
fully recombining and very efficient.
Function DiscreteDividendYield(AmeEurFlag As String, CallPutFlag As String,
S As Double, X As Double, T As Double, r As Double, v As Double, _
n As Integer, DividendTimes As Object, Dividends As Object) As Variant394 CHAPTER 9. OPTIONS ON STOCKS
TABLE 9.8
Examples of American Option Values from Discrete
Dividend Yield Binomial Tree.
(s = 100, x = 102, T 0.5, r = 0.1,n = 500)
a=0.15 a =0.3
5 0.1 t = 0.25 t = 0.4 t = 0.1 t = 0.25 t = 0.4
Call options
1% 5.2065 5.2065 5.2391 9.3072 9.3072 9.3615
2% 4.6298 4.6299 5.0516 8.7320 8.7389 9.1231
5% 3.1474 3.7190 4.8772 7.1546 7.6493 8.7899
10% 1.9192 3.3363 4.8311 5.2965 6.8194 8.5965
15% 1.5647 3.2614 4.8283 4.2979 6.4655 8.5387
20% 1.4693 3.2494 4.8283 3.7785 6.3180 8.5238
Put options
1% 4.1048 3.8987 3.7610 8.0053 7.9105 7.7738
2% 4.6827 4.3741 4.0454 8.4898 8.3658 8.1149
5% 7.0000 7.0000 7.0000 10.0936 9.9051 9.5369
10% 12.0000 12.0000 12.0000 13.2590 12.9060 12.3760
15% 17.0000 17.0000 17.0000 17.0421 17.0000 17.0000
20% 22.0000 22.0000 22.0000 22.0000 22.0000 22.0000
Dim ReturnValue ( ) As Double
Dim StepsDividend ( ) As Double
Dim St ( ) As Double
Dim OptionValue 0 As Double 'Option Value at each node
Dim i As Integer , j As Integer , m As Integer , z As Integer
Dim nDividends As Integer
Dim Df As Double, dt As Double , p As Double
Dim u As Double, uu As Double, d As Double, SumDividends As Double
nDividends = Application . Count ( DividendTimes )
If nDividends = 0 Then
DiscreteDividendYield = CRRBinomial(AmeEurFlag, CallPutFlag , _
S, X, T, r, r, v, n)
Exit Function
End If
ReDim ReturnValue (0 To 3)
ReDitn StepsDividend(0 To nDividends)
ReDim St (0 To n + 2)
ReDim OptionValue(0 To n + 2)
dt = T / n 'I/Size of time step
Df = Exp(-r * (T / n)) '// Discount factor
u = Exp( v * Sqr(T / n))
d = 1 / u
uu = u A 2
p = (Exp(r * dt) - d) / (u - d) ' // Up probability
z = 1 'II call
If CallPutFlag = "p" Then
z = -1 '// put9.6. OPTIONS ON STOCKS 395
End If
SumDividends = 1
For i = 0 To nDividends — 1
StepsDividend ( ) = Int( DividendTimes( i + 1) / T * n)
SumDividends = SumDividends * (1 — Dividends ( i + 1))
Next
For i = 0 To n 'II Option value at expiry
St(i) = S * u^i * ciA(n — i ) * SumDividends
OptionValue( i ) = Max( z * ( St( i ) — X) , 0)
Next
For j = n — 1 To 0 Step —1
For m = 0 To nDividends
If j = StepsDividend (m) Then
For i = 0 To j
St ( i ) = St ( i ) / (1 — Dividends (m + 1))
Next i
End If
Next m
For i = 0 To j
St( i) = d * St( i + 1)
' I lEuropean value :
OptionValue ( i ) = (p * OptionValue ( i + 1) _
+ (1 — p) * OptionValue( i )) * Df
If AmeEurFlag = 'a" Then 'II American value
OptionValue( i ) = Max( OptionValue ( i ) , z * ( St( i ) — X))
End If
Next i
If j = 2 Then
'// arrnma
ReturnValue (2 ) = (( OptionValue (2 ) — OptionValue ( 1 )) _
/ (S * 1.02 — S) — ( OptionValue (1) — OptionValue (0 )) _
/ (S— S * c1^2)) / (0.5 * (S * 1.02 — S * c1^2))
'II Part of theta
ReturnValue (3 ) = OptionValue (1 )
End If
If j = 1 Then
'II Delta
ReturnValue (1) = (OptionValue (1) _
— OptionValue ( 0 )) / (S * u — S * d)
End If
Next j
ReturnValue (0 ) = OptionValue (0)
' // One day theta :
ReturnValue ( 3 ) = (ReturnValue (3) — OptionValue ( 0)) / (2 * dt ) / 365
DiscreteDividendYield = Application . Transpose (ReturnValue )
End FunctionCHAPTER
10
6 COMMODITY AND ENERGY
OPTIONS
A practical option formula should be as simple as possible,
but not simpler than that.
The Author
Most commodity and energy options can be valued with the formulas
already described in this book. The most popular commodity option
model is actually the Black-76 model described in Chapter 1. This is
the benchmark model used for most European options on commodity
and energy futures. Also, many of the numerical methods described in
earlier chapters can be applied to commodity and energy derivatives.
For example, in the case of American futures options, the binomial or
trinomial model is popular, and Monte Carlo methods can easily be
used to take mean reversion into account. As in most other markets,
taking jumps and stochastic volatility into account can be of great
importance. Valuing commodity and energy options is thus not very
different from valuing options in other markets. The difference is more
in what input to feed into the model. This chapter briefly presents
some of the adjustments that are particular to energy and commodity
valuation.
10.1 ENERGY SWAPS/FORWARDS
Oil and electricity swaps are actively traded in the energy markets.
To find the fair value of an electricity forward or swap, we need to
know the cost of storing (hydropower can to some degree be stored
in water reservoirs) and producing electricity. These costs can vary
among different operators in the market and the topic is outside the
scope of this book. Given the presence of traded contracts with quoted
market prices—for instance, a swap (forward)—we can come up with
a way to value the swap relative to other swaps. For example, a strip of
quarterly power swaps covering the whole year should have the same
value as an annual contract. Otherwise, there will be an arbitrage
397398 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
opportunity. Oil swaps are similar and typically have a daily fixing
against NYMEX.
The Nordic Electricity Exchange (Nord Pool) lists actively traded
electricity swaps. The electricity swaps traded in the Nordic power
market are known as forwards but are from a valuation perspective
power swaps, a strip of one-day electricity forwards. To compare the
value of different swaps, we need to discount the cash flows. The
swap/forward price is not the value of the swap contract, but only
the contract price. To compare different power swaps with each other,
we need to find the value (Haug, 2005a):
e—rbTb v_ n,
FValueToday = n 2_,(1 + rj,i1j)i
i=1
(10.1)
where FValueToday is the swap value today and
F is the forward/swap price in the market. In this case, "price"
should not be confused with "value"!
j is the number of compoundings per year (number of settlements
in a one-year forward contract). We assume here they are evenly
spread out. In practice, there are no payments during weekends,
so every fifth payment does not have the same time interval as
the rest of the payments. However, the effect of taking this into
account is not of economic significance, at least for monthly or
longer contracts.
n is the number of settlements in the delivery period for the par-
ticular forward contracts. Nord Pool uses daily settlement, so
this will typically be the number of trading days in the forward
period.
rj,i is a risk-free interest swap rate starting at the beginning of the
delivery period and ending at the i period. Further, it has j
compoundings per year.
Tb is the time to the beginning of the forward delivery period.
rb is a risk-free continuously compounded zero coupon rate with
Tb years to maturity.
In the case where we assume a constant interest rate in the delivery
period, we can simplify the swap value formula to
FValueToday Fe—rbTb(1 (H-rliti)"
'
)
(10.2) = n
where ri now is the forward start swap rate, starting at the
beginning of the delivery period and ending at the end of the delivery10.1. ENERGY SWAPS IFORWARDS 399
period, with j compoundings per year set equal to the number of
fixings per year.
Example
Consider a quarterly electricity forward that trades at a price of 35
EUR/MwH (ELTR per mega watt hour), the delivery period is 2160
hours, or 90 days. It is six months to the start of the delivery period.
Assume the forward start swap rate, starting six months from now
and ending six months plus 90 days from now, is 5% converted to the
basis of daily compounding. The six-month continuous zero coupon
rate is 4%. What is the present value of the power contract when
using 365 days per year? F =35, ri =0.05, j = 365, n=90, rb=0.04,
and Tb = 0.5.
1 1
Flia/ueTodav =
35e-0.04x0.5 x ( (1+0.05/365)90 ) 365
x — -= 34.0940
0.05 90
The present value of the power forward/swap is thus 34.0940 EUR
per MwH. The total value of one contract is found by multiplying
the number of hours in the contract period by the value per MwH
2160 x 34.0940 = 73,643.08 EUR.
Approximation
Formula (10.2) can be approximated by
r bTb —rd(Tm — Tb)
FValueToday
, r -=,' Fe e
where rd is the forward starting continuously compounded zero
coupon rate for the delivery period, multiplied by the time from the
start of the delivery period Tb to the middle of the delivery period Tm.
This can be simplified further by
FValueToday Fe—reTm, (10.3)
where re is a continuously compounded zero coupon rate from now
to the end of the delivery period. This approximation is reasonably
accurate as long as we use consistent rates.
Example
Consider the same input as in the last example. To make the
examples equivalent, we have to find a rate re that is consistent
with rb =0.04 and rj =0.05. To find re from the example above,
we first need to convert rj to a continuously compounded ratere =
Tb (Tm — Tb)
rbTb rej(Tm — Tb)
400 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
rcj = 365 ln(1 + 0.05/365) = 0.04999658. We know that
e—reT,,, = e—rbTb e—rej (T,,,—Tb)
0.04 x 0.5 ± 0.049997 x 90/365/2
re — = 0.04198,
0.5 +90/365/2
and we can now approximate the value of the forward price
0.04198 x (0.5+90/365/2) =
FVcaueToday 35e— 34.0961
The approximate value is thus not very different from 34.0940 cal-
culated by the more accurate formula.
10.2 ENERGY OPTIONS
## 10.2.1 Options on Forwards, Black-76F
Traders in commodity markets often use the Black-76 model to value
options on commodity futures. When it comes to commodity options
on forwards, the Black-76 formula holds only for the case when the
forward contract expires at the same time as the option contract T. In
the case where there is delivery of a forward contract that has a differ-
ent expiration date, one has only locked in the payoff from the option
but will receive the intrinsic value first at the forward's expiration.
The Black-76 formula has to be adjusted for this effect. Thus, if you
are long an in-the-money call option and you exercise, you will receive
a forward contract that expires at time Tf (Tf > T), with a forward
delivery price set equal to the strike of the option, X. To lock in the
intrinsic value, you must sell a forward in the market at market price.
You will, however, receive the money from this transaction first when
the forward contract expires at time Tf. We get a modified Black-76
formula that we will name Black-76F:
c = e—rTf [FN(di) — XN (d2)] (10.4)
p = e—rTf[XN(—d2)— FN(—(11)], (10.5)10.2. ENERGY OPTIONS 401
where
d = ln(F
I X) ± (cr2 12)T
i
ln(F I X) - (a 2 /2)T
d2 = = di - a,./T
a
Example
Consider a European option on the Brent Blend forward that expires
in 12 months, with 9 months to expiration. The forward price is USD
19, the strike price is USD 19, the risk-free interest rate is 10% per
year, and the volatility is 28% per year. F = 19, X = 19, T = 0.75, T.),
r =0.1, and a =0.28. Thus:
ln(19/19) + (0.282/2)0.75
- =0.1212
0.28,/0.75
d2 = - 0.28A/0.75 = -0.1212
N(d1) = N(0.1212) = 0.5483 N(d2) = N(-0.1212) =--- 0.4517
N(-c11)= N(-0.1212) = 0.4517 N(-d2)= N(0.1212) = 0.5483
-0.1x1 [19N( _ c = e a ) 19N(d2)] = 1.6591
p = e-0.1x1 [19,N(_d2) _ 19N(-d1)] = 1.6591
## 10.2.2 Energy Swaptions
European options on energy swaps, also called energy swaptions,
are options that at maturity give a delivery of an energy swap at the
strike price (but not necessarily physical delivery of any energy). The
swap can have either financial or physical settlement. For example,
the most popular options trading at the Nordic Power Exchange, Nord
Pool, are in reality energy swaptions. If a call swaption is in-the-money
at maturity, the option has delivery of a swap. The payoutl from the
option is thus not received immediately at expiration, but rather dur-
ing the delivery period of the underlying swap (forward). For example,
at Nord Pool there is financial daily settlement in the delivery period
of the swap/forward against the daily settlement (auction price) of
1Typically named forward by the market participants.402 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
the underlying physical market. The energy call swaption formula is
(see Haug, 2005a)
C =
( I (1+rj1.1)" I e— rp(Tb — T) x Black-76
rj
(1 (i +rj/j)) j e_rp(Tb_ne—rT[Fw(di ) _ XIV(d2)]
rj
= ( I (l+rili) )e—rbTb[FN(di)— XN(d2)1,
rj
where rp is the risk-free rate from the option's expiration to the begin-
ning of the delivery period. Tb is the time from now to the beginning
of the delivery period. Moreover:
d = 1 d2 = d1 - .../T
For a put we similarly have
=
(1 \
(l+rf ) T
p
n
e—rb b [XN( — d2) — FN(—di)]
rj
(10.7)
d =
In(S/X) a2T/2
Good approximations for calculating the call and the put swaption
values are
c c—reTm[FN(cli)— XN(d2)] (10.8)
p e—re7;"[XN(—d2)— FN(—di)I, (10.9)
where re is the risk-free rate from now to the end of the delivery
period and
1
ln(SI X) ± o-2T12
d2 = d1 -
and 7',, is the time in years from now to the middle of the delivery
period.
As there is a lot of notation here, following are summaries of the
notation used for this option formula:
F is the forward/swap price observed in the market. In this case
price should not be confused with value!
j is the number of compoundings per year (number of settlements
in a one-year forward contract). Here we assume evenly spread
(10.6)10.2. ENERGY OPTIONS 403
out. In practice, no payments are made during the weekend, so
every fifth payment is not even. However, the effect of taking this
into account is not of practical importance, at least if we have to
deal with monthly or longer contracts.
n is the number of settlements in the delivery period for the par-
ticular forward contracts. In Nord Pool there is daily settlement,
so this will be the number of trading days in the forward period.
r• is a swap rate starting at the beginning of the delivery period
and ending at the end of the delivery period with j compoundings
per year, equal to the number of fixings in the delivery period.
Tb is the time to the beginning of the forward delivery period.
rb is a risk-free continuous compounding zero coupon rate with Tb
years to maturity.
re is a risk-free continuous compounding zero coupon rate with
time to maturity equal to from now to the end of the delivery
period.
rp is a risk-free continuous compounding zero coupon rate with for-
ward start at the option maturity T and ending at the beg;rming
of the delivery period Tb.
Example
Consider a call on a quarterly electricity swap, with six months
to maturity. The start of the delivery period is 17 days after the
option expires, and the delivery period is 2208 hours, or 92 days.
The swap/forward trades at 33 EUR/MwH, and the strike is 35
EUR/MwH. The number of fixings in the delivery period is 92. The
risk-free rate from now until the beginning of the delivery period is
5%. The daily compounding swap rate starting at the beginning of
the delivery period and ending at the end of the delivery period is 5%.
The volatility of the swap is 18%. What is the option value? T = 0.5,
Tb = 0.5 + 17/365 = 0.5466, rb=0.05, rj =0.05, j = 365, n = 92, and
a = 0.18 yields
ln(33/35) +0.5 x 0.182/2
= = -0.3987
0.18, (] /
d2 = -0.3987 - 0.I8Jö = -0.5259
N(di) = N(-0.3987) = 0.3451 N(d2) = N(-0.5259) = 0.2995
1
( 1 (1+0.05/365)92 ) 365 e- 0.05x0.5466[33N(di) - 35N(d2)] = 0.8761 C =
0.05 92404 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
To find the value of an option on one swap/forward contract, we
need to multiply by the number of delivery hours. This yields a price
of 2208 x 0.8761 = 1,934.37 EUR. Alternatively, we could have found
the option value using the approximation (10.8), using time from now
to the middle of delivery period Tm = 0.5 + 17/365 + 92/2/365 = 0.6726
and assuming the rate from now to the end of the delivery period is
re ;••-, - 0.05:
c e-0.05 x 0.6260 [33N(di — 35N(d2)] = 0.8761
At four-decimals accuracy, the approximation evidently gives the
same result as the more accurate formula.
Put-Call Parity
For a standard put, also called a receiver swaption, or call option, also
called a payer swaption, the put-call parity is
p = c + (X F)
(1 (l+rill)" )
e—rbTb
(10.10)
r •
and, of course,
c = p + (F X)
(11 (1-1-rj I j)) j e—rbTb
(10.11)
r • .1 n
The put-call parity can be used to construct synthetic puts or calls
as well as synthetic swaps/forwards from traded puts and calls. The
synthetic/implied forward price from a put and a call is given by
c — p
(1-0-j11)") _rb=b
rj
Energy Swaption Greeks
Delta:
1 \
(1
e—rbTbN(d1) Acall =
ri
(11
.\
(1±rj1.1)n ) e—rbTbN(—cli) Aput =
rj
(10.12)
(10.13)
Vega:
The vega is the swaption's sensitivity with respect to change in
volatility.
F= + x
1 \
( 1 (I-Fr
e—rbTb Fn(di),[1: Vegacall,put=
r1 n
(10.14)10.2. ENERGY OPTIONS 405
It is necessary to divide by 100 to express vega as the change in the
option value for a 1% point change in volatility.
Gamma:
Gamma for swaptions:
Rho:
Pcall =
Pput =
x
(10.15)
(10.16)
(10.17)
(i+rj i ki)) —rb Tbn(di) ne ri
reall,pur —
Fa ..VT
(I (I+r1/j)—n-1 (1 (i±r jr ) j j
• 2 r1 r .
e—rbTb[FMdl) — X N (C12)]
•
1
( 1 j —1 ( 1 (l+ri jlj) j
2 rj r.
e r—brb [XM—d2) — FM— di)]
( 1 +rj1j)") I)
rj
## 10.2.3 Hybrid Payoff Energy Swaptions
In certain markets there are options that pay off cash at expiration
and also give physical delivery of the underlying swap at close (or
alternatively its settlement price) on option expiration. The option
thus has payoff similar to an option on a futures contract, but in
addition, delivery of a swap equal to the settlement (fixing) price
at expiration. This "hybrid" used to be the standard for electricity
options trading at Nord Pool until they changed delivery to conform
to the standard energy swaption style. This option may seem diffi-
cult to value at first. Assuming geometric Brownian motion of the
swap/forward price, the value is simply the Black-76 value, however.
Still, since the underlying asset is a swap and not a futures contract,
the delta hedge is not the Black-76 delta but has to be adjusted for the
fact that the underlying swap has a payoff over the delivery period,
after the option expires. Letting —AB76 =
e—rT N,(oit ) be the Black-76
delta, the delta for hedging with electricity forwards/swaps is given406 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
by Haug (2005):
AB76F = AHFVaT
(1 1
AB76F = A yFe—rp(Tb—T)
\
j
r •
Ay = N (di)e—
rTerp(Tb—T) nr
(1 (1-Fri tI j)n)
Ay N (di)e— rT er(Tb—T) nr
j (1
(1-Erl i )'
where FyaT is the swap value at option expiration T, r is the con-
tinuous risk-free zero coupon rate until option expiration, and rp is
the continuous compounding zero coupon rate from option expiration
until beginning of the delivery period of the swap.
d = ln(F IX) ± T o-2 12
1
and for a put
Aput = N (_doe—rT erp(Tb—T) nr
j( 1
1 \
(1-Er
(10.18)
10.3 THE MILTERSEN-SCHWARTZ MODEL
Miltersen and Schwartz (1998) developed an advanced model for pric-
ing options on commodity futures. The model is a three-factor model
with stochastic futures price, a term structure of convenience yields, 2
andinterestrates. 3 The model assumes commodity prices are lognor-
mally distributed and that continuously compounded forward interest
rates and future convenience yields are normally distributed (aka
Gaussian).
Investigations using this option pricing model show that the time
lag between the expiration on the option and the underlying futures
2The convenience yield can be seen as the benefit or cost that accrues to the owner of
the physical commodity but not to the owner of a contract for delivery in the future. It
causes the expected price change of the commodity to be different from the expected
return from investing in it.
3The Miltersen and Schwartz (1998) model can be seen as a generalization of previ-
ous work by Merton (1973), Gibson and Schwartz (1990), Amin and Jarrow (1992),
Reismann (1992), Cortazar and Schwartz (1994), Amin, Ng, and Pirrong (1995), and
Schwartz (1997).10.3. THE MILTERSEN-SCHWARTZ MODEL 407
will have a significant effect on the option value. Even with three
stochastic variables, Miltersen and Schwartz manage to derive a
closed-form solution similar to a BSM-type formula. The model can
be used to price European options on commodity futures. 4
c= Pt[FT N (di) — XN(d2)l, (10.19)
where t is the time to maturity of the option, FT is a futures price with
time to expiration T (T > t), and Pt is a zero-coupon bond that expires
on the option's maturity.
ln(FT I X) — a, az2/2
di d2 = di — az ,
crz
and the variances and covariance can be calculated as 5
(j.;- = f
0
(u) f ra f (u, s) — aE (u, s)]ds
2
du = f Ha FT (u)II2 du
0
Crxz =
0 u u
au, s)ds] • la s (u) f
T
[a f(u, s) — a-6 (u, s)]dsi du
=— f
a13, (u) • a FT (u)du,
0
where
a pr (t) =
aFT (t) = a S (t) [a f (t , — crE (t, s)]ds
This is an extremely flexible model where the variances and covari-
ances admits several specifications. One possibility is to assume a
three-factor Gaussian model, with three deterministic a processes
defined as
as(t) = as (31 1)
41n the same paper, Miltersen and Schwartz (1998) also give a separate formula for
options on forwards, as well as on developing a relationship between the forward and
futures contract.
5"." denotes the standard Euclidean inner product of Rd, and the corresponding norm
is defined as 11 x11 2 = x x for any x E Rd.408 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
i
Pse )
ae (t , s) = cre e—'4(s—t) 111—pL
0
a f (t, s) = a f e—Kf (s—t) i
PSf
Pcf —PSE PSf
111—pL
2 1—(PE f — PSE P5f
psf
This leads to the following solution of az and axz:
2 2 ,-, PSf 1
e—Kf T (eK f t —1)1 az =as t hp+f — [t —— K f K f
Pse 1
—ae —[t — —e — T (eKEt —1)1 14 I
KE KE
2
^ ae [t ± 1 e-2KE T (e2KEt 1) e—KET (eicct 1)]
2KE KE
„.2
^ f [t ± 1 e-2Kf T (e2Kft ___ 1)
Kf L 2Kf
2 e—Kf T (eKf t _ 0]
Kf
_ 2creafpef 11 [t 1 e—KET(eic,t _ 1)_ e—KfT (eKft _ 1)
KE Kf KE K f
1
e
— (KE -f-K .f)T (e,(KE+Kf)t 1)]
Kf)
a f 1
Grxz = laSPsf [t (1 - e c t)1 ±af [t 1 e —Kf T(eKf t _ 1)
Kf K f K f K f
1
—— (1 — e —Kf t )±
K f
1
e— K fT (eic ft e—K ft )1
2K f
PE f 1
—ae — [t — —e —KE T (eKct—1)——(1— e—K ft) KE KE K f
1 ^,(ice Kf)
— KET ( eKE t e—wf t)]I10.3. THE MILTERSEN-SCHWARTZ MODEL 409
TABLE 10-1
Comparison of European Futures Option Prices Using the
Miltersen and Schwartz Commodity Option Model and
the Black-76 and Black-76F Modified Black-Scholes Model
In this table, we follow the numerical examples used by Miltersen and
Schwartz (1998) and are using the parameter estimates for the COMEX High
Grade Copper Futures data presented in the Schwartz (1997) paper. In the
Black-76 and Black-76F model, we set a = aS.
(FT = 95, as =0.266, a,. =0.249, a f = 0.0096, PSf = 0.0964,
PsE = 0.805, pEf = 0.1243, KE = 1.045,1(7 = 0.2, Pt =e-0.05t)
Black-76 Black-76F Miltersen-Schwartz
t = 0.25 T = 0.25 80 15.3430 15.3430 15.1918
95 4.9744 4.9744 4.5669
110 0.9159 0.9159 0.6896
t = 0.25 T = 0.3 80 15.3430 15.3047 15.1424
95 4.9744 4.9619 4.4170
110 0.9159 0.9136 0.6131
t = 0.25 T = 0.5 80 15.3430 15.1524 15.0049
95 4.9744 4.9126 3.9251
110 0.9159 0.9045 0.3908
t = 0.5 T =1 80 16.1917 15.7919 15.0787
95 6.9423 6.7709 4.7245
110 2.3311 2.2735 0.7972
where
as =Volatility of the spot commodity price.
a, =Volatility of futures convenience yield.
o-f = Volatility of the forward interest rate.
K f = Speed of mean reversion of the forward interest rate.
KE =- Speed of mean reversion of the convenience yield.
PSf = Correlation between the spot commodity price and
the forward interest rate.
Pse = Correlation between the spot commodity price and
the convenience yield.
pEf = Correlation between the forward interest rate and
the convenience yield.
Using these expressions of az and a„ in the Miltersen and Schwartz
model, we can easily calculate values for European call and put
options on commodity futures with stochastic forward interest rates
and convenience yields.6 Table 10-1 compares the Black-76 as well as
6This can be seen as a special case of the Miltersen and Schwartz option pricing model
where the underlying futures follows a stochastic process as described in the paper
by Schwartz (1997).410 CHAPTER 10. COMMODITY AND ENERGY OPTIONS
the Black-76F model with the Miltersen and Schwartz model. The
price difference between the two types of models will be strongly
dependent on the input parameters. Black-76F is simply the Black-
76 formula adjusted for the fact that the payoff from an option on
forwards typically arrives when the forward expires.
10.4 MEAN REVERSION MODEL
It is possible to derive a closed-form BSM type option formula when
we assume that in(S) follows a mean reversion process:
dSt / St = KO -1n(S))dt + crclZ,
where 0 is the mean reversion level and K is the speed of mean rever-
sion. Given then spot price volatility, as, we can now calculate what
the volatility of the forward must be
oF = cfS
1 _ e-2KT
2K
(10.20)
The value of the option can now be found by the Black-76 formula by
simply using the volatility from (10.20). Thus:
where
c = e-rT [FN (di) - XN (d2)]
p = e-rT [XN( - d2) - FN(- dia
ln(F / X) + (crF 2 I2)T
di =
crFff
d2 = di - aF ff
(10.21)
(10.22)
The mean reversion is already taken into account for in the forward
price. For this reason, the mean reversion adjusted drift does not
enter the option formula directly. Few traders would normally use
this model. The reason is that it in general does not fit the implied
volatility term structure observed in the market, at least as long as
one insists on a constant speed of mean reversion. The model still
gives some intuition on how mean reversion affects volatility. For more
information on energy option valuation under mean reversion, see
Pilipovie (1997) and Eydeland and Wolyniec (2003).10.5. SEASONALITY 411
10.5 SEASONALITY
Many commodities are subject to seasonal effects. Pilipovie (1997)
suggests a way to take seasonality into account through the stochastic
process
St = stUnd +Seasonal effect, (10.23)
where SP n d is the asset price process without adjustment for seasonal-
ity. The underlying stochastic process without seasonality dS tund could
take different forms—for example, a mean reversion model or simply
a geometric Brownian motion. The seasonal adjustment will still take
the same form:
dSt = dSlind — [27PAsin(27(t — tA)) 47PsAsin(47(t — tsA))Idt,
where I3A and 8sA are the annual and semiannual seasonality param-
eters, respectively. tA and tsA are the timing for the centering of the
annual and semiannual seasonality (seasonal peaks) The seasonal-
ity is thus assumed to be deterministic. The seasonal parameters, 13A,
I3sA, tA, and tsA , can be specified by the trader (subjective beliefs) or
calibrated to historical or current market data. The underlying price
process without seasonality could for example be on the form
dSt = St + K(9 — St)dt o- edZ,
where K is the speed of mean reversion, 0 is the mean reversion level,
a is the volatility, and /3 is a parameter that is equal to 1 for the "log-
normal equivalent" volatility, and to 0 for a normally distributed asset
price, or it could simply be calibrated to the market. A simple exam-
ple of how to implement such a model with Monte Carlo simulation is
given in an Excel spreadsheet on the accompanying CD.
It is, however, worthwhile to mention that many academics seem
to overemphasize the importance of taking seasonality into account
when, for example, modeling energy derivatives. Even if the spot price
is normally seasonal, this is typically already reflected in the futures
or forward prices. When modeling an option directly on a futures or
forward, one therefore typically does not need to take into account sea-
sonality in the model. Modeling options on the spot will, on the other
hand, typically require a model that takes seasonality into account.CHAPTER
INTEREST RATE
DERIVATIVES
Go down deep enough into anything and you will find options.
Then to value them you have to go even deeper.
Option Trader
In this chapter we consider how to value interest rate options. The
description is limited mostly to hands-on models that are frequently
used to price most standard fixed-income options. The academic
literature on the topic has shown tremendous growth, but many
of the suggested models are still in very limited use by market
participants—perhaps for good reasons.
11.1 FRAs AND MONEY MARKET INSTRUMENTS
We first look at some useful formulas for interest rate forward rate
agreements, better known as FRAs. As FRAs are the underlying
building blocks in many interest rate options, it is worthwhile to
understand the most basic formulas and arbitrage relationships for
this type of contract. FRAs are, moreover, actively traded in the
interbank market.
11.1.1 FRAs From Cash Deposits
FRAs with maturity less than one year are normally calculated
directly from deposit rates, using the formula
(i + ri (i + FRA T2 — 1 = 1 r2 V2
/ Basis/ \ Basis / Basis
[ (1 + r2) Basis
FRA =
(1 ± rie) r2 – T1
where ri and r2 are the number of days in the deposit period with
corresponding cash rates r1 and r2, and Basis is the day count basis
used in the specific market (for example, 360 or 365).
413414 CHAPTER 11. INTEREST RATE DERIVATIVES
Example
Consider a three-month (91 days) LIBOR rate trading at 6%, and a
six-month (183 days) LIBOR rate trading at 7%. The interest rate
convention is Act/360. What is the theoretical FRA rate starting 91
days from today and ending 183 days from today? With ri = 0.06, r2 =
0.07, ri = 91, r2 = 183, and Basis = 360 we get
[
0+0.0712) 360 =
FRA = (
1 + 0.06 1), 183 — 91
1 0.0787 = 7.87%
## 11.1.2 The Relationship between FRAs and
Currency Forwards
We will now derive a relationship that can be used to compare
FRAs (money market forward rate agreements) in different coun-
tries and/or produce synthetic FRAs. If you compare FRAs in one
country with implied money market futures rates in another coun-
try, remember to adjust for lack of convexity in the money market
futures yield. The convexity adjustment in money market futures is,
however, often negligible for futures with maturity within a couple of
years, and can typically be ignored. For longer dated contracts, the
convexity adjustment can be of great importance.
1.1An ywa
1 FRA T2 — T1 (
Spot
+
Spot +
1 FRA f T2 T1 )
Basis Basis f
Spot ±
Lont,FXSwap
FRA = pA T2 - Ti ) Basis
[( ShortFXSwap)
Spot + 10000 f Basis f T2 — T1
(11.2)
where Spot is the currency spot rate and Swap is the swap points in a
currency forward. FRA f is the FRA in the foreign market, and FRA is
the synthetic domestic forward price.
Example
Assume a foreign FRA trading at 6% on a deposit starting 90 days
from now and expiring 180 days from now with a day count basis of
Act/365. Further, the spot currency rate is 7, the currency swap for
the same period is bid 400 offered 600, and the day count basis in the
domestic FRA market is Act/360.11.1. FRAs AND MONEY MARKET INSTRUMENTS 415
FRA f = 0.06, Spot = 7, ShortFXSwap = 600, LongFXSwap = 400,
Ti = 90, T2 = 180, Basis = 360, Basis f = 365 yields
FRA [(
7 + 600
1"0 )
180 — 90
(1 + 0.06
) 360
1 = 0.0707 , 400 365 180 — 90
' 10000
## 11.1.3 Convexity Adjustment Money Market Futures
Money market futures—for example, Eurodollar futures—have a lin-
ear payoff for every basis point the interest rate changes, while FRAs
and interest rate swaps have a convex payoff. That is, the Eurodollar
(or similar money market futures) have no convexity. For this rea-
son, a FRA with the same maturity as a Eurodollar futures must be
more valuable than the futures. To avoid arbitrage opportunities, the
Eurodollar implied rate, 100 – F, must be higher than the FRA (for-
ward) rate. The difference between the FRA rate and the future rate
is called the convexity bias. Often, Eurodollar futures are much more
liquid than the FRAs, and we can use the Eurodollar future price
and a theoretical convexity bias to find the implied theoretical FRA
rate (FAdj). A strip of Eurodollar futures is also often used to hedge
interest rate swaps. Also, in this case to calculate the implied swap
rate from the futures, we first need to do the appropriate convexity
adjustments.
Kirikos and Novak (1997) has published a closed-form money
market convexity adjustment that has been quite popular among
practitioners. The adjustment is based on the interest rate in the risk-
neutral world and follows the Hull and White (1990a) model. (With
no mean reversion, this gives convexity adjustment under the Ho and
Lee (1986) model.)
FAdj = F ConvexityBias, (11.3)
where
ConvexityBias = (1 — e —Z) (100 — F ± 100 x Basis
and
2 ( 1 e-2Kti _ e—K(T2—ti ) 2 a2
Z=-_
2K
± —(1 — e K(T2—t1) )(1 — e —Kt i)
2K3416 CHAPTER 11. INTEREST RATE DERIVATIVES
In the special case when the speed of mean reversion is zero, K = 0,
which is equivalent to the Ho-Lee mode1, 1 Z is set equal to
a
2
Z = a2
t1 (T2 - t1)
2
± t? (T2 — t1)
F =Market price of the futures contract.
F Adj = Theoretical futures price with convexity adjustment.
K = Mean reversion speed.
ti = Time to maturity of the futures contract.
T2 = Time to maturity of the underlying money (LIBOR) deposit.
a = Volatility of underlying futures rate.
r = The number of days in the underlying deposit period.
Basis = The day basis or number of days per year used in the
market.
For more on convexity bias in money market futures, see also
Flesaker (1993), Burghardt and Hoskins (1994), Burghardt and Panos
(2001), Burghardt and Liu (2002), and Pieterbarg and Renedo (2004).
Example
A Eurodollar futures trades at 95.50 expiring six years from now, and
the underlying three-month money deposit expires 90 days later. The
money deposit is on a 360-day count basis (money market basis). The
expected volatility is 150 basis points per year; the mean reversion
speed is 0.04. F =96.50, ti = 6, T2 = 6 + 90/365 = 6.2466, a = 0.015,
K = 0.04, and Basis = 360.
The unadjusted implied futures yield is 100 – 95.50 = 4.50—that is,
4.5%. What is the implied convexity adjusted yield?
2 ( 1 e-2 x0.04 x6 ) 1 e-0.04(6.2466-6)
2 x0.04 0.04
0.0152 (1 e-0.04(6.2466-6) )0 e-0.04 x
6) = 0.00085
2 x 0.043
ConvexityBias = (1 — e-0."85) (100 — 95.5 +100 x
60
) = 0.3437
90
FAdj = 95.5 ± 0.3437 = 95.8437
lUsing a slightly different notation (all with continuous compounding rates), Hull
(2005) gives with background in the Ho-Lee model the following formula for the
convexity adjustment: 0.50-2ti T2.
Z = 0.01511.2. SIMPLE BOND MATHEMATICS 417
This gives us an implied forward rate of 100– 95.8437 = 4.1563—
that is, 4.1563%, which is 34 basis points lower than the unadjusted
futures rate due to the convexity adjustment.
11.2 SIMPLE BOND MATHEMATICS
## 11.2.1 Dirty and Clean Bond Price
In the bond market people are speaking about clean and dirty bond
prices. A dirty bond price is the price quoted in the market plus the
accrued interest rates. In other words, the dirty price is the price you
have to pay for the bond. Bond prices are typically quoted as clean
prices, though—the bond price without accrued interest rate. When
you are pricing, for instance, bond options, it is important to know if
the strike price is against the clean or dirty bond price.
## 11.2.2 Current Yield
Although not very useful in derivatives calculations, several bond
investor still use the concept of "current yield":
Annual coupon income in $
Current yield =
Dirty bond price
## 11.2.3 Modified Duration and BPV
Duration
ModifiedDuration = 1 + Yield (11.4)
A bonds basis point value (BPV) is how much a bond changes in value
with a 1-basis-point change in yield. BPV per million notional can be
found by
BPV = —ModifiedDuration x DirtyPrice (11.5)
We can similarly find the BPV of a swap by first calculating the
duration of the swap:
SwapDuration = FixedSideDuration — FloatSideDuration (11.6)
Example
Consider a bond with duration 6.43, yield 5.28%, clean price 103.02,
and accrued interest 1.48. What is the BPV of the bond?
6.43
BPV = (103.02 ± 1.48) = —638.24
1 ± 0.0528
Thus, for every 1-basis-point increase in yield, the bond will decrease
638.24 dollars for every 1 million in notional.418 CHAPTER 11. INTEREST RATE DERIVATIVES
## 11.2.4 Bond Price and Yield Relationship
The bond price continuous compounded yield relationship is
P = Cie—Y 7;,
1=1
where
P =Bond price
y = Bond yield continuous compounding
C, = Cash flow (coupon) at time 7',
The bond's sensitivity to a small change in yield is
— aP = E n -ci Tie-Y 7;
ay
The convexity of a bond is given by
a C —
92 —
i=1
## 11.2.5 Price and Yield Relationship for a Bond
It is more common to quote the bond yield as annual compounding
or with the same compounding as the number of coupons per year.
Assuming annual compounding yield, the dirty price of a bond (clean
price P ± accrued interest rates) at any time is given by
ri C [ 1 1 1
1 P C = _2_ 1 ± 22_ N - 1
Basis m y) Basis 0 y) Ba r sis ' (1 y) Basis m
(1 ±
1 _ C ± y)-1 ,÷ 1, — 1
L' 1 — (1 + y) (1+y)d
=0+ y)7+7 Basis
(11.7)
02p n
where N is the number of coupons left to maturity, m is the number of
coupons per year, y is the yield to maturity, ri is the number of days
since the last coupon payment, T-2 is the number of days to the next
coupon payment, F is the face value of the bond, and Basis is the day
basis (i.e., 365 or 360).
i=111.3. PRICING INTEREST RATE OPTIONS USING BLACK-76 419
## 11.2.6 From Bond Price to Yield
The Newton-Raphson algorithm is useful to find the yield given the
bond price:
P(Yn) — Pm
Yn-F1 = Yn aP
aYn
until I Pm — P (yn+i) l< E, at which point yn±i is the implied yield. E
is the desired degree of accuracy. Pm is the market price of the bond,
and is the delta of the bond (the sensitivity of the bond value for a ay„
small change in the yield).
ap
ay
Bd2, - R flik C a— :;11 — 1 _ N
+ Fa m
a m 1 — a tT,
C (a— w + (N +1)(atTi —1)1— N N _ 1
F am], 2
a (1 — a WO 2
where a = 1 + y.Alternatively, assuming yield compounding equal to
the number of coupons per year gives the dirty price of a bond (price
+ accrued interest rates) as a function of the yield:
P C—
Ti
=
C
m
(1+ ki)—N—1
(11.8) (1 + —
y )1-7„
+
Basis 1 — (1 +)± (l +)''J
11.3 PRICING INTEREST RATE OPTIONS USING
BLACK-76
The Black-76 model is probably the most widely used model to price
interest rate options. The model was originally developed to price
options on forwards and assumes that the underlying asset is log-
normally distributed. When used to price a cap, for example, the
underlying forward rates of the cap are thus assumed to be lognormal.
Similarly, when used to price a swaption (an option on a swap), the
underlying swap rate is assumed to be lognormal. This can be justi-
fied when pricing these types of options independently (Jamshidian,
1996; Miltersen, Sandmann, and Sondermann, 1997). Still, using the
model to price both a cap and a swaption is theoretically inconsistent.
The cap forward rate and the swap rate cannot both be lognormal.
Still, the overwhelming popularity of this model for pricing both caps
and swaptions suggests that any problems due to this inconsistency
are economically insignificant.2
2Traders typically take inconsistencies into account by adjusting the volatility. The
adjustment is based on experience from the particular market in which they operate.420 CHAPTER 11. INTEREST RATE DERIVATIVES
The problem of inconsistent pricing is true also for bonds and
swaps: They cannot both have lognormal rates. For instance, if
the bond price is assumed to be lognormal, the continuously com-
pounded swap rate must be normally distributed. Using the same
model (Black-76) for pricing swaptions and bond options is then
inconsistent. The next section is a slight detour on options on
money market futures, before we come back to swaptions and bond
options.
## 11.3.1 Options on Money Market Futures
Several exchanges list actively traded options on money market
futures. Examples of these are options on Eurodollar futures traded on
the Chicago Mercantile Exchange (CME) and short Sterling futures
traded on the London International Futures Exchange (LIFFE). The
price on a money market futures is typically quoted as 100 minus
the yield. For instance, a price of 94.56 would imply a money market
futures implied rate of 100 — 94.56 = 5.44. Assuming that we cannot
have negative real interest rates, the price on the money market
futures has an upper bound of 100. The price on the money market
futures is clearly not lognormally distributed. It is, on the other hand,
quite reasonable to model the implied money market futures yield
as being lognormally distributed. Based on this assumption, most
traders use the Black-76 formula directly on the implied yield. If one
uses this approach, one must remember that a call on the money
market futures must be priced as a put on the yield and vice versa:
p = e-rT [y A
(do - X N (d2)] (11.9)
c = e-rT [XN(-d2)- yN(-di)J, (11.10)
where y is the implied money market futures yield; y = 100 — F, and
ln(yIX) ± (a 2/2)T
d =
aArt-
d2 = d - a Aff
Example
Consider a European put option with three months to expiration on a
Eurodollar futures contract. The Eurodollar futures currently trades
at 94.52, the volatility of the implied money market yield is 23%, the
strike of the put is 94.25, and the risk-free rate used for discounting is
5%. y = 100 — 94.52 = 5.48, X = 5.75, T = 0.25, r =0.05, and a =0.23.11.3. PRICING INTEREST RATE OPTIONS USING BLACK-76 421
Thus:
ln(5.48/5.75) + (0.232/2)0.25
di -=
0.23,./0.25
= —0.3607
d2 = di — 0.23-s/0.25 = —0.4757
N(di) = N(-0.3607) = 0.3592 N(d2) = N(-0.4757) = 0.3171
p = e-0.05x0.25[5.48N(di , _ ) 5.75N(d2)1 = 0.1428
The value is thus approximately 14 basis points, and in a three-month
Eurodollar futures contract, one basis point is worth $25. In other
words, the option is approximately worth $350 (14 x 25) per contract
we have the right to sell.
## 11.3.2 Price and Yield Volatility in Money
Market Futures
The yield y of money market futures F (i.e., Eurodollar futures) is
y = 100— F
The relation between price volatility and yield volatility is
crY = aF100 — F
( 11.11)
100 — F
aF =
Example
Consider a Eurodollar futures with price 94.53 and price volatility
1.5%. What is the equivalent yield volatility? F =94.53, aF =0.015,
and y = 5.47%.
94.53
=0.015 = 25.92%
100 — 94.53
## 11.3.3 Caps and Floors
An interest rate cap consists of a series of individual European call
options, called caplets. Each caplet can be priced by a modified version
of the Black-76 formula. This is accomplished by using the implied
forward rate, F, at each caplet maturity as the underlying asset. The
price of the cap is the sum of the price of the caplets that make up
the cap. Similarly, the value of a floor is the sum of the sequence of
individual put options, often called floorlets, that make up the floor.
Cap = ECaplet, Floor =EFloorleti,
i=1 i=1422 CHAPTER 11. INTEREST RATE DERIVATIVES
where
Notional x
Caplet value = , x Black-76 call value
+ FI)csis)
Notional x
e'T [FN(di) - XN(d2)) (11.13)
(1 + F1c 3sis)
T is the number of days in the forward rate period. Basis is the day
basis or number of days per year used in the market (i.e., 360 or 365).
where
Notional x
Floorlet value = s e T [XN(-d2) - FN ( -di)),
(1 + F
In(F / X) + ((72 /2)T
di =
( 7 ,5
In(F / X) - ((7 2 /2)T
cr.,/T
(11.14)
Miltersen, Sandmann, and Sondermann (1997) recently devel-
oped a closed-form lognormal yield-based model for the pricing of
caps and floors. Their model is an extension of the modified Black-
76 caps and floor model, which allows for stochastic discount rates
and time-dependent volatility.
Example
What is the value of a caplet on a 182-day forward rate, with six
months to expiration and a notional principle of 100 million? The six-
month forward rate is 8% (V basis), the strike is 8%, the risk-free
interest rate is 7%, and the volatility of the forward rate is 28% per
year. Basis = 360, r = 182, F =0.08, X = 0.08, T = 0.5, r =0.07, and
a =0.28, which yields
In(0.08/0.08) + (0.282/2)0.5
di = = 0.0990 d2 = di - 0.28Jö-.3 = -0.0990
N(di) = N(0.0990) = 0.5394 N(d2) = N(-0.0990) = 0.4606
100,000,000 x 182
Caplet value = 3-6° e-007 ".5[0.08N (di) - 0.08N (d2)1 = 295.995
(1 + 0.08
## 11.3.4 Swaptions
It is usual to distinguish between the following:
Payer Swaption The right but not the obligation to pay the fixed
rate and receive the floating rate in the underlying swap.11.3. PRICING INTEREST RATE OPTIONS USING BLACK-76 423
Receiver Swaption The right but not the obligation to receive the
fixed rate and pay the floating rate in the underlying swap.
European swaptions are normally priced by using the forward
swap rate as input in the Black-76 option pricing mode1. 3 The Black-76
value is multiplied by a factor adjusting for the tenor of the swaption,
as shown by Smith (1991). This is the practitioner's benchmark swap-
tion model. The model is arbitrage-free under the assumption of a
lognormal swap rate (Jamshidian, 1996).
C
1
(1+)ti 'm
e-rT [FN(di)- XN(d2)]
p= e-rT [XN(-d2) - (11.16)
where
ln(F I X) + (o-212)T
= , d2
where c indicates a payer swaption, and p indicated a receiver
swaption.
ti = Tenor of swap in years.
F =Forward rate of underlying swap.
X = Strike rate of swaption.
r = Risk-free interest rate.
T = Time to expiration in years.
a =Volatility of the forward-starting swap rate.
in = Compoundings per year in swap rate.
Example
Consider a two-year payer swaption on a four-year swap with semi-
annual compounding. The forward swap rate of 7% starts two years
from now and ends six years from now. The strike is 7.5%, the risk-
free interest rate is 6%, and the volatility of the forward starting swap
rate is 20% per year. t1 = 4, m = 2, F =0.07, X = 0.075, T = 2, r =0.06,
3More than 90% of the swaptions' market consists of European swaptions. To price
American swaptions, look at section 11.4 for yield-based models.424 CHAPTER 11. INTEREST RATE DERIVATIVES
and a -= 0.2.
In(0.07/0.075) + (0.22/2)2
di --= = —0.1025 d2 = di — 0.2J = —0.3853
0.2,/2
N(d1) = N(-0.1025) = 0.4592 N(d2) = N(-0.3853) -= 0.3500
c = c- 0.06x 2 [0.07N (di
) — 0.075N(d2)] = 0.5227%
With a semiannual forward swap rate, the up-front value of the
payer swaption in percent of the notional is
1= 1.7964% C X
/ 07 \ 4 x 2
\ -I- )
0.07
## 11.3.5 Swaption Volatilities from Caps or FRA
Volatilities
When you are trading caps, floors, and swaptions, it is of interest to
be able to compare cap and floor volatilities with swaption volatil-
ities. The relationship between swap rates, Y, and forward rates,
F, is
y = E7=1 Ni F, ri P(0, ti+i)
E7=iNiTi P(0, t,±1)
This shows that the swap rate is a weighted average of the for-
ward rates. This becomes more clear by introducing (see Rebonato,
1996)
Niri P(0, ti+i)
wi = i n =1 Niri P(0, ti+i)
In terms of the swap rate
P(0, 4+1)
Y = Fi n
Ei=i ri P(0, ti +1)
By assuming the weights w i to be approximately constant with rate
movements, we can approximate the swap volatility by
n n
ay R., ' E.3a2 +2E E t Ft wiw j Pi. jaF iaFj
=1 1=1 j=i,joi
This formula can be useful for comparing swaption volatilities with
caps and floors volatilities and vice versa. Alternatively, the relation-
ship can be used to calculate implied correlations, taking the swaption
and cap volatilities as given. For a more in-depth analysis of the rela-
tionship between caps and swaptions, see Longstaff, Santa-Clare, and
Schwartz (2000).11.3. PRICING INTEREST RATE OPTIONS USING BLACK-76 425
Computer algorithm
The Swaption Vo/(-) function returns the swap volatility given the
one-year FRA volatilities and their correlations. The function is limi-
ted to calculate the volatility of swaps with full years to maturity, from
annual forward rates (FRAs). It can be easily extended to cover swaps,
for example, starting three months from now and based on, for exam-
ple, three-month FRAs. I leave this extension up to the reader. See the
accompanying spreadsheet on the CD to attain a better understanding
of how to use the function.
Function SwaptionVol(SwapStart As Integer, SwapTenor As Integer,
Zeros As Variant , Vols As Variant
CorrelationMatrix As Variant ) As Double
Dim Weight () As Double
no_weights = Application .Count(Vols )
ReDim Weight( no_weights ) As Double
For i = SwapStart + 1 To SwapStart + SwapTenor
Weight(i) i ) = 1 / (1 + Zeros ( i ))^ i
SumDiscountFactors = SumDiscountFactors + Weight( i )
Next
For i = SwapStart + 1 To SwapStart + SwapTenor
Weight( i ) = Weight( i ) / SumDiscountFactors
Next
For i = SwapStart + 1 To SwapStart + SwapTenor
Sum = Sum + Weight( i)^2 * Vols( i )^2
For j = i + 1 To SwapStart + SwapTenor
Sum = Sum + 2 * Weight( i ) * Weight(j ) _
* Vols( i ) * Vols (j ) * CorrelationMatrix(i , D
Next
Next
SwaptionVol = Sqr(Sum)
End Function
## 11.3.6 Swaptions with Stochastic Volatility
For more sophisticated valuation of swaptions with a two-factor
stochastic volatility model, one interesting approach is to combine
the method above with the SABR model described in Chapter 6.
## 11.3.7 Convexity Adjustments
A standard bond or interest rate swap exhibits a convex price-yield
relationship. To price options with the Black-76 model when the
underlying asset is a derivative security, with a payoff function linear
in the bond or swap yield, the yield should be adjusted for the lack of
convexity.426 CHAPTER 11. INTEREST RATE DERIVATIVES
Examples of derivatives where the payoff is a linear function of the
bond or swap yield are constant maturity swaps (CMS) and constant
maturity treasury swaps (CMT). The closed-form formula published
by Brotherton-Ratcliffe and then (1993) assumes that the forward
yield is lognormally distributed.4
82p
Convexity adjustment = 1 2- ).'F y2
F (e
o-2T 1),
2
oYF
where
P =Bond or fixed side swap value.
YF = Forward yield.
T = Time to payment date in years.
a =Volatility of the forward yield.
Example
Consider a derivative instrument with a single payment five years
from now that is based on the notional principal times the yield of a
standard four-year swap with annual payments. The forward yield of
the four-year swap, starting five years in the future and ending nine
years in the future, is 7%. The volatility of the forward swap yield is
18%. What is the convexity adjustment of the swap yield? The value
of the fixed side of the swap with annual yield is equal to the value of
a bond where the coupon is equal to the forward swap rate/yield yf:
=
1+c
P
1+yF (1+ YF)2 ( 1 ± YF)3 ( 1 + Y F)4
The partial derivative of the swap with respect to the yield is
aP c 2c 3c 4(1 + c)
=
a Y F ( 1 ± Y F)2 (1 ± Y F) 3 ( 1 ± Y F)4 (I ± Y F) 5
0.07 2 x 0.07 3 x 0.07 4(1 + 0.07) _ = —3.3872,
(1 + 0.07)2 (1 +0.07) (1 +0.07) (1 +0.07)
and the second partial derivative with respect to the forward swap
rate is
82p 2c 6c 12c 20(1 + c)
= 15.2933
— (1 ayi (1 + YF)3 + (1 + YF)4 + ( 1
2 x 0.07 6 x 0.07
+ YF)5 + (1 + YF)6
12 x 0.07 20(1 + 0.07)
= + A +
(1 + 0.07)3 (1 + 0.07r
+
(1 + 0.07)5 (1 + 0.07)6
4The original formula published by Brotherton-Ratcliffe and then (1993) is slightly
different.Convexity adjustment
In + 1] —
T
a2p
aYF
aP -YF
aYF
C = (11.20)
11.3. PRICING INTEREST RATE OPTIONS USING BLACK-76 427
The convexity adjustment can now be found using equation (11.18):
Convexity Adjustment =
15.2933
872
0.072(e0.182x5 — 1) = 0.0019
2
The convexity adjusted rate is then equal to 7.19% (0.07 + 0.0019).
Vega of the Convexity Adjustment
The convexity adjustment's sensitivity to a small change in volatility
is given by
a2P
"YF
Vega=— ap y2 FaTe02T (11.19)
avr
Implied Volatility from the Convexity Value in a Bond
If the convexity adjustment is known, it is possible to calculate the
implied volatility by simply rearranging the convexity adjustment
formula:
## 11.3.8 European Short-Term Bond Options
European bond options can be priced with the Black-76 model by using
the forward price of the bond at expiration as the underlying asset:
e'T [FN(di)— XN(d2)] (11.21)
p = e—rT [X N (—d2) — FN(—d1)]. (11.22)
where F is the forward price of the bond at the expiration of the option
and
ln(F1 X)+ (a212)T
a Nif
This model does not take into consideration the pull-to-par effect of
the bond: At maturity, the bond price must equal the principal plus the
coupon. The uncertainty of a bond will, for this reason, first increase
and then decrease.
The Black-76 model assumes that the variance of the rate of return
on the underlying asset increases linearly with time to maturity. Pric-
ing of European bond options using this approach should thus be
limited to options with short time to maturity relative to the time
to maturity of the bond. A rule of thumb used by some traders is that
the time to maturity of the option should be no longer than one-fifth
of the time to maturity on the underlying bond.428 CHAPTER 11. INTEREST RATE DERIVATIVES
Example
Consider a European put option with six months to expiration and
strike price 122 on a bond with forward price at option expiration
equal to 122.5. The volatility of the forward price is 4%, and the
risk-free discount rate is 5%. What is the option's value? F = 122.5,
X = 122, T = 0.5, r =0.05, and a =0.04.
ln(122.5/122) + (0.042/2)0.5
d] = = 0.1587
d2 = 0.1587 - 0.04Jö = 0.1305
N(-d1)= N(-0.1587) = 0.4369 N(-d2) = N(-0.1305) = 0.4481
p = e-"5"•5 [122 x 0.4481 - 122.5 x 0.4369] = 1.1155
## 11.3.9 From Price to Yield Volatility in Bonds
The following formulas can be used to find the yield volatility of a bond
if one knows the price volatility, and vice versa.
ap ap
(11.23)
(11.24)
aY aP 1
TY
aP I
—
Y
Duration
(1+y)
r Duration]
(1 + y)
where up is the price volatility of the bond price P and ay is the yield
volatility of the bond yield y.
Example
Consider a government bond where the implied price volatility is 9%.
The bond has a duration of six years and a yield to maturity of 8%.
What is the equivalent yield volatility of the bond?
0.09
ay - = 20.25%
1+0.08
## 11.3.10 The Schaefer and Schwartz Model
Schaefer and Schwartz (1987) developed a modified BSM model for
pricing bond options. The model incorporates that the price volatility
of a bond increases with its duration:
c = Se(b-r)T N(di) - Xe -rT N(d2) (11.25)
p = Xe-rT N( -d2) - Se(b-r)T N (11.26)
where
ci = (K Sa-1)D11.4. ONE-FACTOR TERM STRUCTURE MODELS 429
TABLE 11-1
Comparison of the Black-76 Formula with the Schaefer
and Schwartz Volatility-Adjusted Black-76 Formula
(F = 100, X = 100, T = 2, r =0.1, b = 0)
Bond
Duration
Base
Volatility
Adjusted
Volatility
Black-76
Value
Modified
Black-76 Value
1 12.0% 1.5% 5.5364 0.6929
2 12.0% 3.0% 5.5364 1.3857
3 12.0% 4.5% 5.5364 2.0783
4 12.0% 6.0% 5.5364 2.7707
5 12.0% 7.5% 5.5364 3.4628
6 12.0% 9.0% 5.5364 4.1545
7 12.0% 10.5% 5.5364 4.8457
8 12.0% 12.0% 5.5364 5.5364
d = ln(S IX) ± (b o-2 I2)T
i
d2 = d1 -
where D is the duration of the bond after the option expires. K is
estimated from the observed price volatility a, of the bond. a is a
constant that Schaefer and Schwartz suggest should be set equal to
0.5. Moreover,
K=
S' -1 D*'
where D* is the duration of the bond today.
Example
Assume that the duration of the bond is eight years and that the
observed price volatility of the bond is 12%. This gives
0.12
K- =0.15
1000.5-1 8
Table 11-1 uses this value and compares the option prices from the
Schaefer and Schwartz formula with option prices from the Black-76
formula.
11.4 ONE-FACTOR TERM STRUCTURE MODELS
## 11.4.1 The Rendleman and Bartter Model
The Rendleman and Bartter (1980) model is a one-factor equilibrium
model that assumes that the short-term interest rate is lognormal:
dr = ,urdt o-rdz,
cro430 CHAPTER 11. INTEREST RATE DERIVATIVES
where ii, is the expected instantaneous relative change in the
short-term interest rate and a is the instantaneous standard
deviation of the change. The model can be implemented in a binomial
tree similar to the Cox-Ross-Rubinstein tree described in Chapter 7.
The up and down factors are
U = , d = e-a"s t
The probability of moving up is
e t -d
P = u - d
## 11.4.2 The Vasicek Model
The Vasicek (1977) model is a yield-based one-factor equilibrium
model that assumes that the short rate is normally distributed. The
model incorporates mean reversion and is popular in the academic
community—mainly due to its analytic tractability. The model is not
used much by market participants because it is not ensured to be
arbitrage-free relative to the underlying securities already -in the
marketplace.
dr =K(6 - r)dt +adz (11.27)
K is the speed of the mean reversion, and 0 is the mean reversion
level.
Bond Prices
The price at time t of a discount bond maturing at time T is P(t,T),
where
P(t,T)= A(t,T)e -B(t,T)r(t) ,
r(t) is the rate at time t and
B(t, T) =
1 _ e-K(T-t)
K
)(K219 _ u2/2) a2B (t,T) 2 [(B(t,T)- T + t
A(t,T)= exp 2 K 4K
European Options
The value of a European option maturing at time T on a zero-coupon
bond that matures at time r is
c = P(t,r)N(h)- XP(t,T)N(h -ap) (11.28)
p = XP(t,T)N(-h+ap)- P(t,r)N(-h), (11.29)11.4. ONE-FACTOR TERM STRUCTURE MODELS 431
where
h = — 1 ln[ P (t' r) i + c '
ap P(t, T)X 2
o- p = B(T , r)
p2(1
_e-2K (T—t))
2K
Example
Consider a European call option on a zero-coupon bond. Time to expi-
ration is two years, the strike price is 92, the volatility is 3%, the
mean-reverting level is 9%, and the mean reverting rate is 0.05. The
face value of the bond is 100 with time to maturity three years and
initial risk-free rate of 8%. F = 100, X = 92, T = 2, i- = 3, 0 =0.09,
K =0.05, r =0.08, and a =0.03.
1 _ e-0.05(2-0)
B(t, T) = B(0, 2) = = 1.9032
0.05
1 _ e- 0.05(3- 2)
B(T, r) = 8(2, 3) – = 0.9754
0.05
1 _ e- 0.05(3- 0)
B(t, r) = 8(0, 3) = = 2.7858
0.05
A(t , T) = A(0, 2) = exp (8(0, 2) – 2
+0)(0.052 x 0.09 – 0.032/2)
0.052
0.0328(0, 2)2 ]
= 0.9924
4 x 0.05
A(t, r) = A(0, 3) = exp
(B(0, 3) –3 +0)(0.052 x 0.09– 0.032/2)
0.052
0.0328(0, 3)2
= 0.9845
0, e–B(2)0.08 = 0.8523
, – B(03)0.08 = 0.7878
4 x
P(t, T) = P(0, 2)
P (t , r) = P(0, 3)
op = 8(2, 3)
0.05
1
= A(0, 2
= A(0, 3)e
0.032(1 _ e- 2x(J.05x2)
0.0394 –
2x 0.05
h = —1In[
P(0, 2)92
P10, 3) ] + — aP = 0.1 3 94
o-p I_ 2
The call value for one USD in face value is
c = P(0, 3)N(h) – 92P(0, 2)N(h – up) = 0.0143
With a face value of 100, the call value is 1.43 USD (100 x 0.0143)432 CHAPTER 11. INTEREST RATE DERIVATIVES
Jamshidian's Approach for Coupon Bonds
Jamshidian (1989) shows that a European option on a coupon bond
can be decomposed into a portfolio of options on zero-coupon bonds,
where each coupon is treated as a zero-coupon bond. One proceeds by
finding the value of the risk-free interest rate P at time T that causes
the value of the coupon bond to equal the strike price.
Example
Consider a European call option on a coupon bond. Time to expiration
is four years, the strike price 99.5, the volatility is 3%, the mean-
reverting level is 10%, and the mean-reverting rate is 0.05. The face
value of the bond is 100, and it pays a semiannual coupon of 4. Time
to maturity is seven years, and the risk-free rate is initially 9%.
First find the rate P that makes the value of the coupon bond equal
to the strike price at the option's expiration. Trial and error gives
P = 8.0050%. To find the value of the option, we have to determine the
value of six different options:
1. A four-year option with strike price 3.8427 on a 4.5-year
zero-coupon bond with a face value of four
2. A four-year option with strike price 3.6910 on a five-year zero-
coupon bond with a face value of four
3. A four-year option with strike price 3.5452 on a 5.5-year zero-
coupon bond with a face value of four
4. A four-year option with strike price 3.4055 on a six-year
zero-coupon bond with a face value of four
5. A four-year option with strike price 3.2717 on a 6.5-year zero-
coupon bond with a face value of four
6. A four-year option with strike price 81.7440 on a seven-year
zero-coupon bond with a face value of 104.
The value of the six options are, respectively, 0.0256, 0.0493, 0.0713,
0.0917, 0.1105, and 3.3219. This gives a total value of 3.6703.
## 11.4.3 The Ho and Lee Model
Ho and Lee (1986) published the first arbitrage-free yield-based
model. It assumes a normally distributed short-term rate. This
enables analytical solutions for European bond options. The short
rate's drift depends on time, thus making the model arbitrage-free
with respect to observed prices (the input to the model). The model
does not incorporate mean reversion.
dr = O(t)dt +adz, (11.30)
where 0(t) is a time-dependent drift.11.4. ONE-FACTOR TERM STRUCTURE MODELS 433
Bond Prices
The price at time t of a discount bond maturing at time T is P(T),
given by
P(t,T) = A(t,T)e -r(t)(T-t) ,
where r(t) is the rate at time t and
InA(t, T) = In
( P(0, T)) a lnP(0, t) I 2
(T - t)
2
-a t (T -
P(0, t) at
European Options
The value of a European option maturing at time T on a zero-coupon
bond maturing at time r is
c = P(t,r)N(h)- X P(t,T)N(h - a p) (11.31)
p = X P(t,T)N(h - up) - P(t,r)N(h), (11.32)
where
h = ln P(t ' T)
up
ap = a (r - T),\/T - t
## 11.4.4 The Hull and White Model
The Hull and White (1990a) model is simply the Ho and Lee model
with mean reversion. 5 The Hull and White model allows closed-form
solutions for European options on zero-coupon bonds. Jamshidian's
approach can be used to price options on coupon bonds.
19(t)
dr = K (- - r) dt adz, (11.33)
where K is the speed of mean reversion. (0(t)/K) is a time-dependent
mean-reversion level.
Bond Prices
The price at time t of a discount bond maturing at time T is P(t,T):
P(t,T)= A(t,T)e -B(t,T)r(t) ,
where r(t) is the rate at time t and
-
B(t,T) =
5Alternatively, it can be seen as an extension of the Vasicek (1977) model, with time-
dependent drift. For more on this model, see also Hull and White (1992).434 CHAPTER 11. INTEREST RATE DERIVATIVES
InA(t, T) = In rPo,711 B(t, T)
apo, 0 v(t,T) 2
L P(0, t) at 2
1 0.2(e—ICT e —Kr)2 (e2ict 0 v(t.T) 2 = _ _
2K3
European Options
The value of a European option maturing at time T on a zero-coupon
bond maturing at time r is
c = P(0, r)N (h) — X P(0, T)N(h — v(T, r)) (11.34)
p = X P(0, T)N(—h v(T, r)) — P(0, r)N (—h), (11.35)
where
h=
1 [ P(0, r) v(T, r)
ln
v(T, r) P(0, T)X 2
## 11.4.5 The Black-Derman-Toy Model
The Black, Derman, and Toy (1990) (BDT) one-factor model is one
of the most used yield-based models to price bonds and interest rate
options.6 The model is arbitrage-free and thus consistent with the
observed term structure of interest rates. Short rates are lognormally
distributed at all times. This makes it difficult to find closed-form
solutions for the options prices. The model must be implemented in
a recombining binomial tree, for example. The short-rate volatility
a (t) is potentially time-dependent, and the continuous process of the
short-term interest rate is
din(r) = [OW au(t)/at
+ In(r)1 dt ( t)dz, (11.36)
a(t)
where aa(t)lat is the speed of mean reversion and f9(t) divided by the (t)
speed of mean reversion is a time-dependent mean-reversion level.
The following example shows how to calibrate the BDT binomial tree
to the current term structure of zero-coupon yields and zero-coupon
volatilities.
Example
What is the value of an American call option on a five-year zero-coupon
bond with time to expiration of four years and a strike price of 85.50?
The term structure of zero-coupon rates and volatilities is shown in
Table 11-2. From the rates and volatilities, we will calibrate the BDT
interest rate tree. We will assume the risk-neutral probability of going
up on any time step in the tree is p = 0.5, and similar the probability
of going down on next time steps is 1 — p.
6Black and Karasinski (1991) generalize the BDT model.11.4. ONE-FACTOR TERM STRUCTURE MODELS 435
TABLE 11-2
Input to BDT
Years to
Maturity
Zero-Coupon
Rates
Zero-Coupon
Volatilities
1 9.0% 24%
2 9.5% 22%
3 10.0% 20%
4 10.5% 18%
5 11.0% 16%
To price the option by using backward induction, we build a tree for
the bond prices, as shown:
To build the price tree, we have to build the following rate tree:
r„4
We start by finding the price of a zero-coupon bond with maturity
one year in the future:
91.74= 100 x 0.5 + 100 x 0.5
(1 + 0.09)436 CHAPTER 11. INTEREST RATE DERIVATIVES
This gives us the one-period price tree:
100
91.74
100
1 -
The next step is to build a two-period price tree. From the term
structure of zero-coupon rates in Table 11- 2, it is clear that the price
today of a two-year zero-coupon bond with maturity two years from
today must be
100
(1 + 0.095)2
To find the second-year bond prices at year one, we need to know the
short rates at step one:
Appealing to risk-neutral valuation, the following relationship
must hold:
8 40 = 0.5S
1 0.5Sd
3.
(1 + 0.09)
In a standard binomial tree, we have
u = ec 7 `. 1 d =e—c
u d = e2a
(11.37)
ln(uId) =2aVTIn
= ln
2.1rF1 d
Similarly, in the BDT tree the rates are assumed to be lognormally
distributed. This implies that
1
an — In ( r ) = 0.22
2 7.177) rd
83.40 =
0.51n (-
ru
= 0.22
rd
(11.38)and
100
(11.39)
(11.40)
Sd =
1 ru
100
Su =
1 + rd
Now, substitute (11.39) and (11.40) into (11.37) to obtain
0.5 ( + 0.5 (100
(1 + 0.09)
83.40 — (11.41)
11.4. ONE-FACTOR TERM STRUCTURE MODELS 437
We are left with two equations, (11.38) and (11.41), in two
unknowns, ru and r,d = rde0.22 x 2 ,
. We know that ru which leads to the
following quadratic equation:
83.40=
(1 +0.09)
By solving this equation, we get the following rates at step
rd 7.87% ru = 12.22%
Using these solutions, it is now possible to calculate the bond
prices that correspond to these rates. The two-step tree of prices then
becomes:
The next step is to fill in the two-period rate tree:
Last time, there were two unknown rates, and two sources of
information:
1. Zero-coupon rates.
2. The volatility of the zero-coupon rates.
0.5( 100
1+ ro0.22x2) 0.5 (A)100 100
or Sd =
(1 + yd)2
Su =
(1 + yu)2
(11.45)
438 CHAPTER 11. INTEREST RATE DERIVATIVES
This time, we have three unknown rates, but still only two sources
of information. To get around this problem, remember that the BDT
model is built on the following assumptions:
• Rates are lognormally distributed.
• The volatility is only dependent on time, not on the level of the
short rates. There is thus only one level of volatility at the same
time step in the rate tree.
Hence,
0.5 ln(ruu/rud) = 0.5 ln(rud/rdd)
ruu rud —
rud rdd
ru 2d
rdd =
ruu
and we are left with only two unknowns. As with the one-period tree,
we start by finding the bond price at the start of the price tree. In
three years, the price of the bond must be 100, and the price today
must be
100
75.13 =
(1 +0.1)
Based on the risk-neutral valuation principle, the following
relationships must hold:
100 100 100
Suu = , Sud — , Sdd = , (11.42)
i ± ruu 1 + rud 1 + rdd
0.5S ± 0.5S14d 0.5Sdd ± 0.5Sud
Su = , Sd = (11.43)
(1 + 0.1222) (1 + 0.0787) '
0.5514 + 0.5Sd
75.13 = . (11.44)
(1 + 0.09)
If the bond only has two years left to maturity, the bond yield or rate
of return must satisfy
By solving equation (11.45) with respect to the bond yield, we get
Yu = Yd =
100
Sd •
(11.46)11.4. ONE-FACTOR TERM STRUCTURE MODELS 439
As the bond yields must be approximately lognormally distributed, it
also follows that
0.51n (2' ) --= 0.20
Yd
ln
(
` --= 0.40
Yd
_ Yu .= e0.40
Yd
With equations (11.46) and (11.47), Yu can be expressed as
Yu
Yu = — Yd ,
Yd
Yu--= e 0.40 (
sd
and Su can be expressed in terms of Sd:
100
Su =
[1 + e0.40 (vi1s 0 d0 _ /)] 2
(11.47)
(11.48)
This equation must be solved by trial and error (possible, but not rec-
ommended) or, more efficiently, by the Newton—Raphson algorithm.
The solution is
Su = 78.81 Sd = 84.98
rdd = 7.47% rud = rdu = 10.76% ruu = 15.50%
This gives the missing information in the two-period rate tree:440 CHAPTER 11. INTEREST RATE DERIVATIVES
Now it is time to estimate the three-period price tree:
100
The consecutive time steps can be computed by forward induction,
as introduced by Jamshidian (1991), or more easily with the Bjerk-
sund and Stensland (1996) analytical approximation of the short-rate
interest rate tree. Finally, we get the four-year short-rate tree:
From the short-rate tree, we can calculate the short-rate volatili-
ties by using the relationship a, = 2.7
I
-
ln (a): 1 rd
(TO = 24.00% ai = 22.00% a2 = 18.24% a3 = 14.61% .94 = 14.66%
The four-year rate tree supplies input to the solution to the five-
year price tree:11.4. ONE-FACTOR TERM STRUCTURE MODELS 441
The value of the American call option with strike 85.50 and time to
expiration of four years can now easily be found by standard backward
induction. It follows that
(0.5 x +0.5 x
C.I
Cj+1,1
ax [Sj,i — 85.50, ,1
=m
(1 -Fr
The price of the American call option on the five-year bond is thus
2.18.
Black-Derman-Toy Yield Only
The BDT model can alternatively be calibrated to the yield curve only,
and not also to the volatility curve. We can thus instead input a single
volatility for the short rate. This simplified version of the BDT model
often goes under the name "yield-only BDT." Below is a VBA code
illustrating how to implement this simplified model.
Computer algorithm
The BDTYiledOnl)'e) function returns the short rate tree in the form of a
matrix when ReturnFlag = "r",and a discount factor tree if RetumFlag =
"d", and a Arrow-Debreu tree when ReturnFlag = "a" .
Function BDTYieldOnly(ReturnFlag As String, v As Double, N As Integer, _
T As Double, InputZeroRates As Variant, YieldMatu As Variant)
Dim ZeroR() As Double, ZeroBond() As Double, u() As Double
Dim r() As Double, Lambda() As Double, Df() As Double
Dim dt As Double, epsilon As Double
Dim Pi As Double, di As Double
Dim i As Integer , j As Integer , m As Integer
ReDirn ZeroR(0 To N + 1)
ReDim r(0 To N * 2, 0 To N * 2)
ReDitn Lambda(0 To N * 2, 0 To N * 2)
ReDim ZeroBond(0 To N + 1)
ReDim u(0 To N)
ReDim Df(0 To N 2, 0 To N * 2)
dt = T / (N + 1)442 CHAPTER 11. INTEREST RATE DERIVATIVES
For i = 1 To N + 1
ZeroR( i ) = InputZeroRates( i )
ZeroBond(i) = 1 / (1 + ZeroR(i) * dt)^
Next
Lambda(0 , 0) = 1
u (o) ZeroR(1)
r(0, 0) = ZeroR(1)
Df(0, 0) = 1 / (1 + r(0, 0) * dt)
For i = 1 To N
'II Calculate the Arrow—Debreu prices by forward induction:
' I lArrow—Debreu at lowest node:
Lambda(i , 0) = 0.5 * Lambda(i — 1, 0) * Df(i — 1, 0)
' I lArrow—Debreu at uppest node:
Lambda(i , i) = 0.5 * Lambda(i — 1, i — 1) * Df(i — 1, i — 1)
' //Arrow—Debreu between lowest and uppest node
For j = 1 To i — 1
Lambda(i , j) = 0.5 * Lambda(i —1, j — 1) * Df(i —1, j — 1) _
+ 0.5 * Lambda( i — 1, j) * Df(i — 1, j)
Next
'II Newton—Raphson method to find the unknown median u( i )
u(i) = u(i — 1) '11 Seed value
di = 0
Pi = 0
For j = 0 To i
m= j * 2 — i
Pi = Pi + Lambda(i , j) / (1 + u(i) _
* Exp(v * m * Sqr(dt)) * dt)
di = di — Lambda(i , j ) * (Exp(v * m * Sqr(dt)) * dt) / (1 + u(i) _
* Exp(v * m * Sqr(dt)) * dt)^2
Next
epsilon = le-09
While Abs(Pi — ZeroBond(i + 1)) > epsilon
u(i) = u(i) — (Pi — ZeroBond(i + 1)) / di
di = 0
Pi = 0
For j = 0 To i
m = + j * 2
Pi = Pi + Lambda(i , j) / (1 + u(i ) _
* Exp(v * m * Sqr(dt)) * dt)
di = di — Lambda(i, j) * (Exp(v * m * Sqr(dt)) * dt) _
/ (1 + u(i) * Exp(v * m * Sqr(dt)) * dt)^2
Next
Wend
'II Given u( j) from the search above we can calculate the short
'II rates and the corresponding discount factors
For j = 0 To i
m = (—i + j * 2)
r(i, j) = u(i) *Exp(v *m* Sqr(dt))
Df(i, j) =1 / (1 + r(i, j)* dt)
Next j
Next i
'II Output
71 Will return the short rate tree as a matrix:11.4. ONE-FACTOR TERM STRUCTURE MODELS 443
If ReturnFlag = "r" Then
BDTYieldOnly = Application . Transpose ( r )
'II Will return the discount factor tree as a matrix:
ElseIf ReturnFlag = "d" Then
BDTYieldOnly = Application . Transpose (Df )
'// Will return Arrow—Debreu tree as a matrix:
ElseIf ReturnFlag = "a" Then
BDTYieldOnly = Application. Transpose (Lambda( ))
End If
End FunctionCHAPTER
12
VOLATILITY AND
CORRELATION
Volatility is blind to the sign of the move—not humans.
Nassim Taleb
This chapter deals with different ways to calculate volatility and
correlation—an important topic, as these parameters are central to
the valuation of most option contracts.
12.1 HISTORICAL VOLATILITY
## 12.1.1 Historical Volatility from Close Prices
Calculation of the annualized standard deviation is the most widely
used method for estimating historical volatility. Standard deviation
is simply the square root of the mean of the squared deviations of
members of a sample (population) from their mean.
2
1
in
Closei ) 2 1 Closei
in n - 1 Closei_j n(n - 1) i_1
E
i=1 i=1
where n is the
Example
Calculate the
Table 12-1.
number of observations.
annualized volatility based on the close prices in
20
C
20
20
1
- 1 L-d x-,111 (C/o
l
s
o
e
s
i
e ) 2 1
) 20(20 - 1) E aosei _1 ) — ln - 0.0173
C/osei
i=1
When assuming 252 trading days in a year, the annualized close
volatility is
o- = 0.0173V- 22 = 0.2743.
0" = (12.1)
2
0" =
445446 CHAPTER 12. VOLATILITY AND CORRELATION
TABLE 12-1
High, Low, and Close Prices
Day Close High Low ln(Closei/Close, _1) ln(High/Low)
01.0ct.XX 132.5 132.5 131.0 0.011385
04.0ct.XX 133.5 134.0 131.0 0.007519 0.022642
05.0ct.XX 135.0 136.0 134.0 0.011173 0.014815
06.0ct.XX 133.0 137.0 133.0 -0.014926 0.029632
07.0ct.XX 133.0 136.0 133.0 0.000000 0.022306
08.0ct.XX 137.0 137.0 133.0 0.029632 0.029632
11.0ct.XX 135.0 136.5 135.0 -0.014706 0.011050
12.0ct.XX 135.0 136.0 135.0 0.000000 0.007380
13.0ct.XX 142.5 143.5 137.0 0.054067 0.046354
14.0ct.XX 143.0 145.0 142.0 0.003503 0.020907
15.0ct.XX 144.5 147.0 142.0 0.010435 0.034606
18.0ct.XX 145.0 147.5 145.0 0.003454 0.017094
19.0ct.XX 146.0 147.0 143.0 0.006873 0.027588
20.0ct.XX 149.0 150.0 148.0 0.020340 0.013423
21.0ct.XX 148.0 149.0 146.5 -0.006734 0.016921
22.0ct.XX 147.0 149.5 147.0 -0.006780 0.016864
25.0ct.XX 147.0 147.5 146.0 0.000000 0.010222
26.0ct.XX 147.0 149.0 146.5 0.000000 0.016921
27.0ct.XX 145.0 147.5 144.5 -0.013699 0.020549
28.0ct.XX 145.0 145.0 144.0 0.000000 0.006920
29.0ct.XX 150.0 150.0 143.5 0.033902 0.044300
Computer algorithm
Function CloseVolatility(ClosePrices As Object , _
Optional DataPerYear As Variant ) As Double
' Volatility (= standard deviation of logarithmic changes )
' Default adjustment is based on data for 252 days a year
' (Calendar day volatility )
If IsMissing(DataPerYear) Then
DataPerYear = 252
End If
CloseVolatility = Application .StDev(LogChange( ClosePrices )) _
* Sqr( DataPerYear )
End Function
Function LogChange( DataVector As Object )
' Returns the natural logarithm of the changes in DataVector
Dim nRow As Integer
Dim nCol As Integer
Dim nVec As Integer
Dim Element As Integer
Dim TmpVec( ) As Double
If DataVector . Areas. Count <> 1 Then
' Multiple selections not allowed
LogChange = CVErr( xlErrValue )
Else12.1. HISTORICAL VOLATILITY 447
nRow = Da taVector . Rows . Count
nCol = DataVector . Columns . Count
If (nRow = 1 And nCol >= 2) Or ( nCol = 1 And nRow >= 2) Then
nVec = Application .Max(nRow, nCol )
ReDim TmpVec ( nVec — 1)
For Element = 1 To nVec — 1
TmpVec( Element ) = Log( DataVector (Element + 1)
/ DataVector ( Element ))
Next Element
LogChange = Application . Transpose (TmpVec)
Else
' DataVector is not a vector
LogChange = CVErr( xlErrValue )
End If
End If
End Function
## 12.1.2 High-Low Volatility
Parkinson (1980) suggests estimating the standard deviation by
n
1 Highe
a = EIn
2n,/1n(2) ( Lowe )
i=1
(12.2)
Example
Calculate the annualized volatility based on the high and low prices
found in Table 12-1.
21
1 High,)
a— E1n( Low, 1= 0.0126
2 x 2.1.,/ln(2)
=1
When assuming 252 trading days in a year, the annualized high-low
volatility is
a = = 0.2004
The high-low method is statistically much more efficient than the
standard close method. 1 However, it assumes continuous trading and
observations of high and low prices. The method can therefore under-
estimate the true volatility. 2 The same is true for the high-low-close
method described next.
Computer algorithm
This function returns the historical high-low volatility from a series
of historical high and low prices. These can be daily prices, weekly
1In terms of number of observations needed to get the same interval compared with
the standard close method.
2See Marsh and Rosenfield (1986). To get around some of its shortcomings, the high-
low and the high-low-close methods have later been extended by Beckers (1983),
Rogers and Satchel] (1991), and Kunitomo (1992), among others.448 CHAPTER 12. VOLATILITY AND CORRELATION
prices, or of any other frequency. As default, it is assumed the input
prices are daily prices and that there are 252 trading days per year.
The function calls the LogHighLow(.) function, which calculates the
natural logarithm of the high-low price series.
Function HighLowVolatility ( HighPrices As Object
LowPrices As Object, Optional DataPerYear As Variant ) As Double
Dim n As Integer
n = HighPrices . Rows . Count
If IsMissing ( DataPerYear ) Then
DataPerYear = 252
End If
HighLowVolatility = 1 / (2 * n * Sqr(Log(2))) _
* Application . sum( LogHighLow ( HighPrices , LowPrices ))
* Sqr(DataPerYear)
End Function
Function LogHighLow( HighPrices As Object, LowPrices As Object )
Dim nR3w As Integer
Dim nCol As Integer
Dim nVec As Integer
Dim Element As Integer
Dim TmpVec( ) As Double
If HighPrices . Areas . Count <> 1 Or LowPrices . Areas . Count <> 1 Then
' Multiple selections not allowed
LogHighLow = CVErr( xlErrValue )
Else
nRow = HighPrices . Rows. Count
nCol = HighPrices . Columns Count
If (nRow = 1 And nCol >= 2) Or ( nCol = 1 And nRow >= 2) Then
nVec = Application .Max(nR3w, nCol )
ReDim TmpVec ( nVec )
For Element = 1 To nVec
TmpVec( Element ) = Log( HighPrices (Element))
/ LowPrices ( Element ))
Next Element
LogHighLow = Application . Transpose (TmpVec )
Else
' Vector is not a vector
LogHighLow = CVErr( xlErrValue )
End If
End If
End Function
## 12.1.3 High-Low-Close Volatility
Garman and Klass (1980) suggest using the estimator
\ F1n Close, )1 2
= 1 i[21n(2) 1] [ln
n 2 [
C/osei_1 )]
i=1 i=1
(12.3)20 20
E[21n(2) 1 E [ln
High \1
)] 2
( )12
20 L Lowi 20 L cii i=1 i=1
12.1. HISTORICAL VOLATILITY 449
Example
Calculate the annualized volatility based on the high, low, and close
prices reported in Table 12-1.
=
= 0.0128
Assuming 252 trading days in a year, the annualized high-low-close
volatility is
a = 0.0128 = 0.2038
Computer algorithm
This function returns the historical high-low-close volatility from a
series of historical high, low, and close prices. These can, for example,
be daily or weekly prices. As default, it is assumed the input prices
are daily prices and that there are 252 trading days per year. The
function calls the LogHighLow•) function, which calculates the natural
logarithm of the high-low price series.
Function HighLowCloseVolatility(HighPrices As Object, LowPrices As Object, _
ClosePrices As Object , Optional DataPerYear As Variant ) As Double
Dim n As Integer
n = HighPrices .Rows . Count
If IsMissing(DataPerYear) Then
DataPerYear = 252
End If
HighLowCloseVolatility = Sqr( 1 / n * 1 / 2
* Application .SumSq(LogHighLow(HighPrices , LowPrices )) _
— 1 / n * (2 * Log(2) — 1) _
* Application .SumSq(LogChange( ClosePrices ))) * Sqr(DataPerYear)
End Function
## 12.1.4 Exponential Weighted Historical Volatility
Exponentially weighted volatility—also called exponentially weighted
moving average volatility (EWMA)—puts more weight on more recent
observations. An exponential moving average is given by
xt_i + Axt_2 + A2xt-3 + A3xt--4
An—l x n
,
±A±A.2 ±A3 ±„,±An-1
where the xi's are the observations in the time series and A is
a constant. The annualized exponential weighted volatility can be
calculated as
crt2 = Acrt2_ 1 2 + (1 — A.)[1n(St/St_i)] , ( 12.4)450 CHAPTER 12. VOLATILITY AND CORRELATION
where at is the current volatility and at-I is the volatility as calcu-
lated one observation ago. If one is using daily data, the volatility
is annualized by multiplying the result with the square root of the
number of days per year. A rule of thumb is that in most markets A
should typically be between 0.75 and 0.98; see Alexander (2001). The
popular RiskMetrics developed by J.P. Morgan uses an EWMA with
A = 0.94. Using A = 0.94 and the close prices in Table 12-1 yields an
EWMA of 24.56% when we use 252 trading days per year.
Computer algorithm
Function ExponentiallyWeightedVol ( PriceVector As Object , _
Lambda As Double, Optional DataPerYear As Variant ) As Double
Dim ExpVol As Double
Dim nRow As Integer
Dim nCol As Integer
Dim nVec As Integer
Dim Element As Integer
If IsMissing ( DataPerYear) Then
DataPerYear = 252
End If
ExpVol = Log( PriceVector (2) / PriceVector(1))^2
If PriceVector . Areas . Count <> 1 Then
' Multiple selections not allowed
ExponentiallyWeightedVol = CVErr( xlErrValue )
Else
nRow = PriceVector .Rows . Count
nCol = PriceVector . Columns. Count
If (nRow = 1 And nCol >= 2) Or ( nCol = 1 And nRow >= 2) Then
nVec = Application .Max(nRow, nCol )
For Element = 2 To nVec — 1
ExpVol = Lambda * ExpVol + (1 — Lambda) _
* Log( PriceVector (Element + 1) / PriceVector (Element))^ 2
Next Element
ExponentiallyWeightedVol = Sqr(ExpVol * DataPerYear)
Else
' Vector is not a vector
ExponentiallyWeightedVol = CVErr( xlErrValue )
End If
End If
End Function
## 12.1.5 From Annual Volatility to Daily Volatility
The market standard is to express a measure of volatility, whether
historical or implied, as a standard deviation on an annual basis.
In practice, a trader typically has a much better feeling for daily
moves in the market. For this reason, many traders prefer to con-
vert annual volatility to daily volatility. To do this, one simply divides12.1. HISTORICAL VOLATILITY 451
the annualized volatility by the square root of the number of days in
the year, alternatively trading days a year, n.
adaily =
aannual
(12.5)
Example
Assume a market maker tells you the volatility for a given option is
40% (implied Black-Scholes-Merton volatility). What is the equivalent
daily volatility? With a = 0.4, n = 365, we get
0.4
acially = „./30 0.0209
The equivalent daily volatility is thus 2.09%.
## 12.1.6 Confidence Intervals for the Volatility Estimate
The next formula can be used to find the confidence intervals around
the estimated close volatility (standard deviation), s, based on the
number of observations, n, used in the estimate. The formula uses
the chi-square distribution and is based on the assumption that the
percentage changes in the asset price are normally distributed.
P
(n - 1)
< a < s
(n I -
= 1 - a,
1)
.„
(12.6)
\ (n — 1 ,a / 2) x(n—1;1—a/2)
where x(2n_ i;a/2) is the value of the chi-square distribution with n— 1
degrees of freedom and a confidence level of 1 — a.
Example
Consider the 27.43% volatility estimate from the close prices in
Table 12-1. The estimate is based on 21 close prices and 20 price
changes. What is the 95% confidence interval (a =0.05) of this
estimate? s = 0.2743, a =0.05, n = 20. Thus:
(20 - 1) (20 - 1) 1
P[0.2743 2
< a <0.2743 2 =- - 0.95
\ X(20- 1;0.05/2) \ X(20- 1;1- 0.0512)
P[0.2086 < a <0.4006]----- 0.95
With 20 observations there is a 95% probability that the real volatility
will lie between 20.86% and 40.06%, based on an estimate of 27.43%. 3
3That is, if we estimate the true volatility 100 times, with independent samples of
size 20, the true volatility will lie within the confidence interval approximately 95
out of the 100 samples.452 CHAPTER 12. VOLATILITY AND CORRELATION
Comment
Every now and then I hear some traders, market makers, or sales-
people talk about how low or high the volatility has been over last
week, based on a volatility estimate involving five observations. Based
on the sampling error from such an estimate, we can conclude that
such statements are nonsense.
Computer algorithm
This function returns the confidence interval for the historical volatil-
ity estimate. UpperLower = "L" returns the lower confidence interval
and UpperLower = "U" returns the upper confidence interval. n is
the number of observations you have used to calculate the historical
volatility.
ConfidenceIntervalVolatility( alfa As Double, n As Integer , _
VolatilityEstimate As Double, UpperLower As String)
'UpperLower ="L" gives the lower cofidence interval
'UpperLower ="U" gives the upper cofidence interval
'n: number of observations
If UpperLower = "L" Then
ConfidenceIntervalVolatility = VolatilityEstimate _
* Sqr((n — 1) / (Application .ChiInv( alfa / 2, n — 1)))
ElseIf UpperLower = "U" Then
ConfidenceIntervalVolatility = VolatilityEstimate
- * Sqr((n — 1) / (Application .ChiInv(1 — alfa / 2, n — 1»)
End If
End Function
## 12.1.7 Volatility Cones
The volatility cone represents a method to determine if the current
implied volatility is "cheap" or "expensive." A volatility cone based
on historical volatility finds the highest and lowest rolling historical
volatility for different days/period. These are then typically plotted.
If the current implied volatility for a given maturity is lower than the
lowest observed volatility for that time period, the option is possibly
underpriced. Similarly, if the implied volatility is above the highest
observed volatility, it may be overpriced. The method has several obvi-
ous weaknesses and is only one of several tools one should keep in
mind when analyzing volatility. The method does not take into account
the volatility smile observed in many markets. It thus typically works
best for at-the-money options. Volatility cones comes in many vari-
eties. See Burghardt and Lane (1990), Haug (1992), and Hodges and
Tompkins (2002) for a more detailed discussions.
Computer algorithm
This function returns the highest and lowest observed volatility for
the various time periods, the average volatility over the period and the12.2. IMPLIED VOLATILITY 453
latest volatility for the period. This function called the Close Volatility(.)
function is given earlier in this chapter. See accompanying CD and
spreadsheet to see examples of how to use this function.
Function VolatilityCone (DataVec As Object, VolPeriod As Integer, _
Optional DataPerYear As Variant )
' Volatility cone calculation with a volatility period,
' default adjustment is based on data for 252 days a year
' (trading days). Returns a vector which contains minimum,
' maximum, average and last volatility
Dim nRow As Integer , nCol As Integer , nVec As Integer
Dim i As Integer , j As Integer , Elem As Integer
Dim VolVec (4 ) As Double
Dim TmpVec ( ) As Double
If IsMissing(DataPerYear) Then
DataPerYear = 252
End If
If DataVec . Areas . Count <> 1 Then
' Multiple selections not allowed
VolatilityCone = CVErr( xlErrValue )
Else
nRow = DataVec . Rows. Count
nCol = DataVec . Columns Count
If (nRow = 1 And nCol >= 2) Or ( nCol = 1 And nRow >. 2) Then
nVec = Application .Max(nRow, nCol )
If VolPeriod <= nVec — 1 Then
ReDim TmpVec(nVec — VolPeriod)
For j = 1 To nVec — VolPeriod
TmpVec( j ) = VolatilityCone (DataVec . Range( Cells ( j , 1) , _
Cells ( j + VolPeriod , 1)) , DataPerYear)
Next j
VolVec ( 1 ) = Application .Min(TmpVec)
VolVec (2) = Application .Max(TmpVec)
VolVec (3) = Application . Average (TmpVec)
VolVec ( 4 ) = TmpVec(nVec — VolPeriod )
Else
' Not enough data for a volatility period this long
VolVec (1) = CVErr( xlErrValue )
End If
VolatilityC one -.=. Application . Transpose ( VolVec )
Else
' DataVec or VolPeriods are not a vector
VolatilityCone = CVErr( xlErrValue )
End If
End If
End Function
12.2 IMPLIED VOLATILITY
## 12.2.1 The Newton-Raphson Method
The Newton-Raphson method is an efficient way to find the implied
volatility of an option contract. It is nothing more than a simple
iteration technique for solving one-dimensional nonlinear equations454 CHAPTER 12. VOLATILITY AND CORRELATION
(any introductory textbook in calculus will offer an intuitive expla-
nation). The method seldom uses more than two to three iterations
before it converges to the implied volatility. Let
ai+1 =
c(a) — cm
aclaai
(12.7)
until lcm — c(ai+1)1 < E, at which point a1+1 is the implied volatility, E
is the desired degree of accuracy, cm is the market price of the option,
and ac/aa, is the vega of the option evaluated at ai (the sensitivity of
the option value for a small change in volatility).
Manaster and Koehler Start Value
Manaster and Koehler (1982) have developed an efficient seed value
when the Newton-Raphson method is used to compute implied volatil-
ity. The seed value will guarantee convergence (if the implied volatility
exists) for European Black-Scholes stock options. The seed value is
simply
al = liln(S/X) 4- rTi —
T
2
(12.8)
In the case of options on futures or forwards, the seed value should be
set to
=a'
IIln(F/X)I 2 (12.9)
Computer algorithm
This function returns the implied volatility of a European plain vanilla
call or a put stock option.
Function GImpliedVolatilityNR(CallPutFlag As String, S As Double, X
As Double, T As Double, r As Double, b As Double, _
cm As Double, epsilon As Double)
Dim vi As Double, ci As Double
Dim vegai As Double
Dim minDiff As Double
'Manaster and Koehler seed value ( vi)
vi = Sqr(Abs(Log(S / X) + r * T) * 2 /
ci = GBlackScholes(CallPutFlag , S, X, T, r, b, vi )
vegai = GVega(S, X, T, r, b, vi)
minDiff = Abs(cm — ci )
While Abs(cm — ci) >= epsilon And Abs(cm — ci) <= minDiff
vi = vi — ( ci — cm) / vegai
ci = GBlackScholes(CallPutFlag , S, X, T, r, b, vi)
vegai = GVega(S, x, T, r, b, vi )
minDiff = Abs(cm — ci )
WendN aH aL
cri±i = (cm — CL)
CH
(12.10)
12.2. IMPLIED VOLATILITY 455
If Abs(cm — ci) < epsilon Then
GImpliedVolatilityNR = vi
Else
GImpliedVolatilityNR = "NA"
End If
End Function
## 12.2.2 The Bisection Method
The Newton-Raphson method requires knowledge of the partial
derivative of the option pricing formula with respect to volatility
(vega) when searching for the implied volatility. For some options
(exotic and American options in particular), vega is not known ana-
lytically. The bisection method is an even simpler method to estimate
implied volatility when vega is unknown. The bisection method
requires two initial volatility estimates (seed values):
1. A "low" estimate of the implied volatility, al, corresponding to
an option value, CL
2. A "high" volatility estimate, aH, corresponding to an option
value, CH
The option market price, Cm, lies between CL and cH. The bisec-
tion estimate is given as the linear interpolation between the two
estimates:
Replace al with 0i+1if c(cr,+ ) < cm, or else replace aH with ai+1 if
C(7,+ ) > cm until lcm — c(cri+i)i < E, at which point cr,±1 is the implied
volatility and E is the desired degree of accuracy.
Computer algorithm
This function returns the implied volatility of a European plain
vanilla call or put option. With small modifications, the function can
also be used to find the implied volatility for American and exotic
options. The variable counter keeps track of how many loops have
been done. If the implied volatility is not found to the specified accu-
racy E within 100 loops, the algorithm stops and returns "NA" (not
available).
Function GBlackScholesImpVolBisection(CallPutFlag As String, S As Double,
X As Double, T As Double, r As Double, _
b As Double, cm As Double) As Variant
Dim vLow As Double, vHigh As Double, vi As Double456 CHAPTER 12. VOLATILITY AND CORRELATION
Dim cLow As Double, cHigh As Double, epsilon As Double
Dim counter As Integer
vLow = 0.005
vHigh = 4
epsilon = le-08
cLow = GBlackScholes ( CallPutFlag , S, X, T, r, b, vLow)
cHigh = GBlackScholes ( CallPutFlag , S, X, T, r, b, vHigh)
counter = 0
vi = vLow + (cm — cLow ) * (vHigh — vLow) / ( cHigh — cLow)
While Abs(cm — GBlackScholes ( CallPutFlag , S, X, T, r, b, vi )) > epsilon
counter = counter + 1
If counter = 100 Then
GBlackScholesImpVolBisection
Exit Function
End If
If GBlackScholes ( CallPutFlag , S, X, T, r, b, vi ) < cm Then
vLow = vi
Else
vHigh = vi
End If
cLow = GBlackScholes ( CallPutFlag , S, X, T, r, b, vLow)
cHigh = GBlackScholes ( CallPutFlag , S, X, T, r, b, vHigh )
vi = vLow + (cm — cLow ) * (vHigh — vLow) / ( cHigh — cLow)
Wend
GBlackScholesImpVolBisection = vi
End Function
## 12.2.3 Implied Volatility Approximations
At-the-Money Forward Approximation
Brenner and Subrahmanyam (1988) and Feinstein (1988) suggest a
simple formula that can be used to find the implied volatility of a plain
vanilla option that is at-the-money forward:
Cm
(12.11)
Se(b—r)T /
where cm is the market price of an at-the-money-forward call or put
option. At-the-money-forward is defined as S = Xe-bT
Example
Consider an at-the-money-forward stock call option with three months
to expiration. The stock price is 59, the strike price is 60, the risk-free
interest rate is 6.7% per year, and the market price of the option is
2.82. S = 59, X = 60, T = 0.25, r =b = 0.067, and cm = 2.82. What is
the implied volatility?
2.82N/Yr
=23.96%
59e(0.067 —0.067)0.25 N/0.25
For comparison, the exact implied volatility is 23.99%.se(b—r)T _ xe—rT 2 )
2
12.2. IMPLIED VOLATILITY 457
Extended Moneyness Approximation
The implied volatility approximation due to Corrado and Miller
(1996a) extends the range of accuracy to a range of moneyness. 4 For
a call option, the approximation is
Se(b—r)T — Xe —rT
0-
se(b—r)T xe—r T cm 2
(se(b—r)T _ x e—rT)2 1 I
/,./T,
7r
(12.12)
where cm is the market price for a call option. The approximation for
a put option is
N7277'
0-
Se(b—r)T Xe—rT Pm
xe — rT — Se(b — r)T
2
(12.13)
where pm is the market price of a put option.
Example
Consider a put option with six months to expiration. The futures price
is 108, the strike price is 100, the risk-free interest rate is 10.50% per
year, and the market price of the put option is 5.08. S = 108, X = 100,
T = 0.5, r =0.105, b = 0, and pm = 5.08. What is the implied volatility?
100e-0.105x0.5 ,■/Yr 108e0-0105)"
{ 108e(0-0.105)0.5 100e-0.105x0
5.08 .5 2
[ (5.08
100e-0.105x0.5 108e 0- 0.105)0.5 2
(100e- 0.105x0.5 108e(0-0.105)0.5)2
29.90%
7r
For comparison, the exact implied volatility is 30.00%.
4See also Corrado and Miller (1996b).
2458 CHAPTER 12. VOLATILITY AND CORRELATION
## 12.2.4 Implied Forward Volatility
Implied volatility is often considered the market's best estimate of
future volatility. Similarly, the implied forward volatility can be seen
as the market's best estimate of the volatility at a future date:
a F =
0.2T 2T
2 2
_
al 1
T2 —
(12.14)
Haug and Haug (1996) show that implied forward volatility takes into
consideration information embedded in the slope of the term structure
of implied volatilities (in a Black-Scholes-Merton economy).
Example
Suppose we have a six-month option with 12% implied volatility, and
a three-month option with 15% implied volatility. The implied three-
month volatility three months forward is
0.122 x 0.5 — 0.152
x 0.25 = 0.0794 = 7.94%
0.5 — 0.25
By rearranging the implied forward volatility formula, it's possible to
get a lower boundary of implied volatilities with time to maturity T2,
given an implied volatility with time to maturity T1, where T2> T1:
a2 = al
T1
T2
(12.15)
Example
Suppose we have a three-month option with 15% implied volatility.
What is the lower boundary of the six-month implied volatility?
/0.25
a2 = = 0.1061
0.5
Breakage of this lower bound signals a possible arbitrage opportunity.
## 12.2.5 From Implied Volatility Surface to Local
Volatility Surface
Assume the following local volatility model, where the local volatility
is a function of both the price level of the underlying asset and time:
dS = g(t)Sdt + o (S, t)Sdz
Wilmott (1998) has published a useful formula for calculating local
volatility from global volatility (BSM implied volatility surface):
a F =
+ bX — (b + r)c aT ax
1 x2 a2c
7
a(X, t) =(1 Xdi N/T— t ± XL (T — t)a (Q - 7 — di (`M
2
N/T — t
, ) , 2
a2 ± 2(T — t)0 4 2bX (T — t)0
, (12.16)
12.3. CONFIDENCE INTERVAL FOR THE ASSET PRICE 459
This gives us
a (X, 1) =
where
La(SI)C)-11-(bd-a 212)T
d1=
aN/Y7
The partial derivatives of the implied volatility surface can be found
by numerical approximations, as discussed in Chapter 2. Because we
in practice have a limited set of implied volatilities, it is typically nec-
essary to interpolate or smooth the Black-Scholes-Merton volatility
surface. However, the local volatility surface can be very sensitive to
the input; see Wilmott (1998). What type of interpolation or surface
smoothing is used can therefore be important. Rebonato (2004) offers
more details on how to go from global to local volatility surface.
12.3 CONFIDENCE INTERVAL FOR THE
ASSET PRICE
Given the assumption of lognormally distributed security prices, we
can compute the confidence interval for the asset price S as
(6 I2)T—nu Ati
Smin = Se (12.17)
and
Smax -= Se(b— a2 I2)T +na (12.18)
where n is the standard deviation around the expected price (some
commonly used standard deviations are 1 = 68.3%, 1.65 = 90%, 2 =
95.4%, and 3 = 99.7%).
Example
What is the confidence interval six months from now, with two stan-
dard deviations, for a stock that trades at 80 today? Let the risk-free
interest rate be 8% per year and the volatility be 25% per year. S = 80,
T = 0.5, r =b = 0.08, a =0.25, and n = 2.
smin 80e (0.08-0.252/2)0.5-2x0.25 57.5612
smax _ 80e(0.08-0252/2)0.5+2x0.25
116.7407n n
E0 +2 E E
i=1 j=1 j=i, jAi
460 CHAPTER 12. VOLATILITY AND CORRELATION
12.4 BASKET VOLATILITY
The volatility of the portfolio (basket) of several risky assets can be
expressed as
°index (12.19)
where Q is the quantity/weight of the asset, p,,j is the correlation
between the return of assets i and j and a, and ai are the volatility of
the individual assets. It is sometimes suggested one use this volatility
as input in the Black-76 option formula when valuing basket options.
This means one assumes the basket is lognormally distributed. This
is not consistent with the assumption that each asset is lognormally
distributed but is often used as a rough approximation. See Allen
(2003) for a more detailed discussion on this idea.
Computer algorithm
This function returns the volatility of basket of correlated assets.
Function BasketVolatility (Weights As Variant, Vols As Variant, _
Correlations As Variant) As Double
Dim n As Integer , i As Integer , j As Integer
Dim sum As Double
n = Application .Count(Weights)
For i = 1 To n
sum = sum + Weights(i)^2 * Vols(i)^2
For j = i + 1 To n
sum = sum + 2 * Weights( i ) * Weights (j )
* Vols ( i ) * Vols( j ) * Correlations ( i
Next
Next
BasketVolatility = Sqr(sum)
End Function
12.5 HISTORICAL CORRELATION
This function returns the historical correlation from two price (time)
series. It calculates the historical correlation for the natural logarithm
of the price changes.
Computer algorithm
Function HistoricalCorrelation(PricesAsset1 As Object, _
PricesAsset2 As Object) As Double
HistoricalCorrelation = Application.Correl(LogChange(PricesAsset1), -12.5. HISTORICAL CORRELATION 461
LogChange( PricesAsset2 ))
End Function
## 12.5.1 Distribution of Historical Correlation
Coefficient
If you run a two-asset Monte Carlo simulation and calculate the corre-
lation coefficient, you will get a different correlation coefficient every
time you run the simulation. The reason for this is the sampling.
Only with continuous-time sampling will the correlation coefficient
be uniquely determined. Based on the number of observations, n, as
well as the population correlation coefficient p, Rao (1973) has pub-
lished a method of how to calculate the theoretical distribution for the
sample estimate of the correlation coefficient; see also Zhang (1998).
When the population correlation coefficient is equal to zero p = 0, we
have the following density function:
F[(n — 1/2]
771)1) =
vTrF[(n — 2)72]
(1 y2)(n-4)/2 (12.20)
where p is the population correlation coefficient, y is the esti-
mated correlation coefficient, and n is the number of observations
used to calculate the correlation coefficient. For p A 0 the density
function is
2n-3
q(P) =
( 1
(n — 3)!
p2)(n-1)/2(1
EF2 (i+n—1 (2py)i
2 i!
i=0
(12.21)
Even if this involves an infinite sum, it converges very fast and is
therefore of practical use.
Computer algorithm
The function below returns the correlation density function.
Function CorrDen(n As Integer, gamma As Double, rho As Double ) As Double
Dim sum As Double
Dim i As Integer
If rho = 0 Then
CorrDen = lxp(Application GammaLn((n — 1) / 2)) _
/ (Sqr( Application. Pi ( ) ) * Exp( Application .GammaLn((n 2) / 2)))
* (1 — gar1maA2)^((n — 4) / 2)
Else
sum = 0
For i 0 To 10462 CHAPTER 12. VOLATILITY AND CORRELATION
sum = sum + Exp( Application .Gammaln((n + i - 1) / 2))^2 _
* (2 * rho * gamma) A i / Application . Fact( i )
Next
CorrDen = 2^(n - 3) / (Application . Pi ( ) * Application .Fact(n - 3)) _
* (1 - rho A2 )^((n - 1) / 2) * (1 - gamma^2)^((n - 4) / 2) * sum
End If
End Function
12.6 IMPLIED CORRELATIONS
## 12.6.1 Implied Correlation from Currency Options
Implied correlation from liquid currency options is useful as an
estimate of future correlation (Haug, 1996).
CrEURIJPY = \I"USDIE
_L_ UR ' -
,
USDIJPY - 2PcrUSDIEURaUSDIJPY
„.2 2
2 2 2
aUSDIEUR '
_L_
-
, ,
USDIJPY -EURIJPY
2aUSDIEURaUSDIJPY
PEURIJPY =
(12.22)
(12.23)
Example
Consider three currency options, all with six months to expiration.
The implied volatility of the USD/EUR option is 14.90%, the implied
volatility of the USD/JPY option is 15.30%, and the implied volatility
of the EUR/JPY option is 12.30%. What is the implied correlation for
the next six months between USD/EUR and USD/JPY? ausDIEUR =
0.1490, ausDijpy = 0.1530, and aEURIJPY = 0.1230.
0.14902 ± 0.15302 - 0.12302
PEURIJPY = = 0.6685
2 x 0.1490 x 0.1530
## 12.6.2 Average Implied Index Correlation
The volatility of a portfolio containing two risky assets:
2 - — Qi = 110M+ 01Q3+2Q1Q2perio -2, P =
a
2Q1Q2a1a2
where Qi is the quantity of asset 1 and Q2 is the quantity of asset 2.
p is the correlation between the return of assets 1 and 2. When the
correlation coefficient is 0, 1, or —1, the formula for the volatility of
a portfolio of two assets can be simplified to the following. (This is a
special case of the basket volatility covered earlier in this chapter.)
p = 0: a = a?. ± Qi
p= 1: = Q1 +cr2Q2
p = -1: a = alQ - 0.2Q212.7. VARIOUS FORMULAS
The volatility of a portfolio containing three risky assets is
a2 = a? Qi a? Q3 ± (q. Qi
2Q1Q2P1,2a1a2 2Q1Q3P1,3a1a3 2Q2Q3P2,3a2a3
The volatility of a portfolio containing several risky assets is
n n
Ecr?Q?' +2 E E Qi j Pi,jaiaj
i=1 1=1 j-=1,ji
al2 ndex EL-1 at3 Qi
PAverage = 2 reir=i Er j!=i,ji Qi Qi0-i of
aIndex =
463
(12.24)
12.7 VARIOUS FORMULAS
## 12.7.1 Probability of High or Low,
the Arctangent Rule
If we assume the returns follow a Brownian motion without drift,
Acar and Toffel (1999) gives a formula for the probability that a high
or a low occurs after a time t = t out of a trading session T,
2
—arctan
7r
(12.25)
where 0 <= r <= T.In Excel the arctan function is: = ATAN(), so the
whole formula could be written directly in Excel cell A3 as
= 21NO * ATAN (SQRT (Al — A2)I SQRT (A2)),
assuming we have T in cell Al and t in cell A2. In the case of drift, no
closed-form solution is available. Monte Carlo simulation is one way
to solve it. See Acar and Toffel (1999) for more details.
Example
Assume a 10-hour trading day. What is the probability that we will
have a high or low price in the last hour of the day, assuming zero
drift and normally distributed returns? Intuition may suggest to you
1/10=10%, but the right answer is: T = 10, t = 9, yielding
2 ( N/10 — 9)
-arctan 0.205.
7r
The probability of a new high or low in the last hour is thus 20.5%,
assuming the asset follows a Brownian motion without drift.464 CHAPTER 12. VOLATILITY AND CORRELATION
## 12.7.2 Siegel's Paradox and Volatility Ratio Effect
We next consider the ratio of two realized volatilities, something that
is partly related to Siegel's Paradox:
[Rand _I
()1 E[Rand
Rand() E [Rand ()]'
where El] is the expectations operator, and Rand() is a random number.
Example
Consider a coin toss for which there is a 50% probability of heads and
50% probability of tails. Next assume you are flipping two coins; heads
is attached value 2, tails value 1. What is the expected ratio? Did you
say one? Wrong, we have
• Tails and heads: 1
2
* 0 25 = 0.125
• Plus tails and tails: * 0.25 = 0.25
• Plus heads and heads: * 0.25 = 0.25
• Plus heads and tails: * 0.25 = 0.5
The expected value is 0.125 ± 0.25 ± 0.25 ± 0.5 = 1.125. The same effect
"naturally" shows up if you, for example, estimate volatility from a
Monte Carlo simulation with constant volatility. Consider, for exam-
ple, 20 observations. Calculate the volatility ratio for the first 10 days
and for the 10 last days. Even if the problem is more complex than
the coin example, the principle is the same; the expected value of
the ratio is higher than expected volatility for one period divided by
the expected volatility for the second period. Monte Carlo simulation
shows that the expected ratio
E[a221 1 E r2 22 > 1 2
E[aa
2
> 1
E[a ?.] a 2
Using Monte Carlo simulation, we find that the expected value of
the ratio in the example is about 1.07. For a different set of observa-
tions, the ratio would naturally be different. People more clever than
myself can probably easily find an exact solution using probability
theory.
Siegel's paradox can easily lead to confusion when hidden in deriva-
tives instruments. A currency rate, for instance, can be seen as a
ratio of two stochastic variables. For this reason, Siegel's paradox has
received some attention in relation to currency options. See Dumas,
Jennergren, and Naslund (1995) and Berdhan (1995).CHAPTER
13
es DISTRIBUTIONS
Quants don't crack jokes; they crack codes.
Quant
13.1 THE CUMULATIVE NORMAL DISTRIBUTION
FUNCTION
The cumulative normal distribution function is given by the integral
N(x)= exp(—z2/2)dz (13.1)
The integral has no closed-form solution, so a numerical approxi-
mation must be used. We present three possible approximations.'
Recent research has shown that a high precision approximation can
be of great importance in options valuation (West, 2005b). For this
reason, we recommend the use of the Hart algorithm, which offers
double precision. I have also included third- and fifth-degree polyno-
mial approximations that are well known from the options literature.
The polynomial approximations are known to suffer from inaccura-
cies far out in the tails and can in some special situations result in
completely wrong options prices.
## 13.1.1 The Hart Algorithm
Hart (1968) presents an approximation that offers double precision
throughout the real line (14 to 16 decimal places accuracy). This is
the algorithm that I have chosen to use for all option pricing for-
mulas that comes with the accompanying CD. The approximation is
1You can easily make your own, if you so desire. One common and simple approach
is to express the integrand as a Taylor series. This is a polynomial that can easily be
integrated. The approximation then involves truncating the resulting infinite series.
465466 CHAPTER 13. DISTRIBUTIONS
given by
e—y 2I2 A
IB '
1 N (x) = e—y 2 12
where y = lx I. When x > 0 then N(x) = 1 — N(x). Moreover,
A = ((((((alY a2)Y a3)), + a4)Y + a5)), + a6))) + a7)
B = (((((((b1y + b2)Y + b3)Y + b4)Y b5)Y + b6)Y + b7)Y + b8)
C = y 1/(y + 2/(y + 3/(y + 4/(y + 0.65))))
and
ai = 0.0352624965998911
a2 = 0.700383064443688
a3 = 6.37396220353165
a4 = 33.912866078383
a5 = 112.079291497871
a6 = 221.213596169931
= 220.206867912376
bi = 0.0883883476483184
62 = 1.75566716318264
63 = 16.064177579207
64 = 86.7807322029461
65 = 296.564248779674
66 = 637.333633378831
67 = 793.826512519948
68 = 440.413735824752
Computer algorithm
The cumulative normal distribution function CND() returns values
of N(.) to within double-precision accuracy.
Function CND(X As Double) As Double
Dim y As Double, Exponential As Double
when y <7.07106781186547
when y > 7.07106781186547
2.506628274631C
0 when y > 3713.1. THE CUMULATIVE FUNCTION 467
Dim SurnA As Double, SumB As Double
y = Abs( X)
If y > 37 Then
CND = 0
Else
Exponential = ET(—yA2/2)
If y < 7.07106781186547 Then
SuniA = 0.0352624965998911 * y + 0.700383064443688
SuinA = SuinA * y + 6.37396220353165
SunIA = SuinA * y + 33.912866078383
SumA = SwmA * y + 112.079291497871
SwmA = SunIA * y + 221.213596169931
SunIA = SunIA * y + 220.206867912376
SurnB = 0.0883883476483184 * y + 1.75566716318264
SomB = SomB * y + 16.064177579207
SumB = Sun-1B * y + 86.7807322029461
SwnB = Sun-1B * y + 296.564248779674
Suall = SiumB * y + 637.333633378831
SomB = SomB * y + 793.826512519948
SumB = SwnB * y + 440.413735824752
CND = Exponential * SwmA / SumB
Else
SunIA = y + 0.65
SwmA = y + 4 / SwmA
SurnA = y + 3 / SuniA
SunIA = y + 2 / SunIA
SuinA = y + 1 / SunIA
CND = Exponential / (SuntA * 2.506628274631)
End If
End If
If K> 0 Then CND = 1 — CND
End Function
## 13.1.2 Polynomial Approximations
The following approximation of the cumulative normal distribution
function N (x) produces values to within four-decimal-place accuracy.
11 - n(x)(a 1 k ± a2k2 ± a3k3) when x > 0
1— N(—x) when x < 0
where
N (x) =
1
k =
1 ±0.33267x
al = 0.4361836468 CHAPTER 13. DISTRIBUTIONS
a2 = —0.1201676
a3 - -= 0.9372980
n(x) =e—x2 /2
The next approximation, described by Abromowitz and Stegun
(1974), produces values of N(x) to within six decimal places of the
true value.
N(x) =
11 — n(x)(aik + a2k2 ± a3k3 + a4k4 + a5k5)
1— N(—x)
when x > 0
when x < 0
1
k =
1+0.2316419x
al = 0.319381530
a2 = —0.356563782
a3 = 1.781477937
a4 = —1.821255978
a5 = 1.330274429
Example
Calculate the cumulative normal probability for
ln(S/X)+ (b a2/2)T
=
a-VT
where S = 88, X = 90, T = 0.5, r =0.1, b = 0.1, a =0.4.
ln(88/90) + (0.1 + 0.42/2)0.5
=- = 0.2387
1
k = =0.9264
1 + 0.33267 x 0.2387
1
n(di) = n(0.2387) == _e-0.23872/2 = 0.3877
N(di) = 1 — 0.3877(0.4361836 x k ± (-0.1201676) x k2 + 0.9372980 x k3) = 0.5943
Computer algorithm
The following cumulative normal distribution function CND2(-)
returns values of NO to within six-decimal-place accuracy.
Function CND2(x As Double) As Double
If x = 0 Then13.2. THE INVERSE CUMULATIVE FUNCTION 469
CND2 = 0.5
Else
Dim L As Double, k As Double
Const al = 0.31938153: Const a2 = —0.356563782
Const a3 = 1.781477937: Const a4 = —1.821255978:
Const a5 = 1.330274429
L = Abs(x)
k = 1 / (1 + 0.2316419 * L)
CND2 = 1 — 1 / Sqr(2 * Pi) * Exp(—LA2 / 2)
* (al * k + a2 * 102 + a3 * 103 + a4 * 104 + a5 * 105)
If x < 0 Then
CND2 = 1 — CND2
End If
End If
End Function
13.2 THE INVERSE CUMULATIVE NORMAL
DISTRIBUTION FUNCTION
The inverse cumulative normal distribution function is useful in sev-
eral applications. In Monte Carlo simulations it is often used to
transform uniformly distributed random numbers into normally dis-
tributed random numbers. The function is also needed in several
closed-form calculations—for example, to find the strike from the delta
in the BSM formula.
The cumulative normal distribution function is given by N (x) given
in expression (13.1). The inverse of N (x) is found in the usual way
by solving N (x) = y for x as a function of y, where 0 < y < 1. We
will call the function x (y) for N-1 0, which is more suggestive of
the inversion operation. Moro (1995) has developed a fast and accu-
rate approximation of the inverse cumulative normal distribution.
Moro's approximation returns values of N -1 (.) to within largest abso-
lute error of 3 x 10-9 accuracy for up to seven standard deviations.
More accurate higher-order polynomial approximations, with up to
14 digits accuracy, can easily be implemented. These higher-order
approximations will be much slower to compute, however.
Computer algorithm
Below is VBA code for the Moro (1995) inverse cumulative normal
distribution approximation function CNDEV(•).
Option Base 0
Function CNDEV(U As Double) As Double
Dim X As Double, r As Double470 CHAPTER 13. DISTRIBUTIONS
Dim A As Variant, b As Variant, c As Variant
A = Array(2.50662823884, —18.61500062529, 41.39119773534, —25.44106049637)
b = Array(-8.4735109309, 23.08336743743, —21.06224101826, 3.13082909833)
c = Array(0.337475482272615, 0.976169019091719, 0.160797971491821,
0.0276438810333863, 0.0038405729373609, 0.0003951896511919, _
3.21767881767818e-05, 2.888167364e-07, 3.960315187e-07)
X = U — 0.5
If Abs(X) < 0.92 Then
r = X * X
r = X * ( ( (A(3) * r + A(2)) * r + AU)) * r + A(0)) _
/ ((((b(3) * r + b(2)) * r + b(1)) * r + b(0)) * r + 1)
CNDEV = r
Exit Function
End If
r =U
If X >= 0 Then r = 1 — U
r = Log( —Log( r ) )
r = c(0) + r * (c(1) + r * (c(2) + r * (c(3) + r + (c(4)
r * (c(5) + r * (c(6) + r * (c(7) + r * c(8))))))))
If X < 0 Then r = —r
CNDEV = r
End Function
13.3 THE BIVARIATE NORMAL DENSITY
FUNCTION
The bivariate normal density function is given by
F(x, y) =
1
exp [ (x2 2pxy y2)]
2.7r ■/1 — p2 2(1 — P2)
(13.2)
## 13.3.1 The Cumulative Bivariate Normal
Distribution Function
The standardized cumulative normal distribution function returns
the probability that one random variable is less than a and that a
second random variable is less than b when the correlation between
the two variables is p:
M(a, b; p)=
fa fb X 2 — 2pxy y 2 1dx dy
2.1— p2 exP [ 2( 1 — P2)
Since no closed-form solution exists for the bivariate cumulative
normal distribution, we present three approximations. The first one
is the well-known Drezner (1978) algorithm. The second one is the13.3. THE BIVARIATE NORMAL DENSITY FUNCTION 471
more efficient Drezner and Wesolowsky (1990) algorithm. The third
is the Genz (2004) algorithm, which is the most accurate one and
therefore our recommended algorithm. West (2005b) and Agca and
Chance (2003) discuss the speed and accuracy of bivariate normal
distribution approximations for use in option pricing in more detail.
The Drezner 1978 Algorithm
Drezner (1978) has developed a method for approximating the cumu-
lative bivariate normal distribution function. This approximation
produces values of M (a, b; p) to within six decimal places accuracy.
\/1 - p2 5 5
(13.3)
7r E E ), 0(a, b; p) —
where
f (v7, Yj) = exp[al (2yi — al) + bi (2y j — bi) + 2p(y, — ai)(y — b1)]
a
xi -= 0.24840615 = 0.10024215
X2 = 0.39233107 Y2 = 0.48281397
X3 = 0.21141819 y3 = 1.0609498
X4 = 0.033246660 Y4 = 1.7797294
x5 -= 0.00082485334 y5 = 2.6697604
If the product of a, b, and p is nonpositive, compute the cumulative
bivariate normal probability using the following rules:
1. If a <0, b <0, and p < 0, then
M (a, b; p) =0(a, b; p)
2. Ifa <0, b >0, and p > 0, then
M (a, b; p) = N (a) — 0(a, —b; —p)
3. If a > 0, b <0, and p > 0, then
M(a, b; p) = N(b) — (—a, b; —p)
4. If a > 0, b>0, and p < 0, then
M(a, b; p) = N (a) N(b) — 1 + 0(—a, —b; p)
In circumstances where the product of a, b, and p is positive,
compute the cumulative bivariate normal function as
M(a, b; p) = M(a, 0; Pt) + M(6,0; P2) —
i = I 1=1TABLE 13-1
The Cumulative Normal Distribution N(x) when x < 0
0.00 -0.01 -0.02 -0.03 -0.04 -0.05 -0.06 -0.07 -0.08 -0.09
-4.5 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-4.4 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-4.3 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-4.2 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-4.1 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-4.0 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-3.9 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
-3.8 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
-3.7 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
-3.6 0.0002 0.0002 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
-3.5 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002
-3.4 0.0003 0.0003 0.0003 0.0003 0.0003 0.0003 0.0003 0.0003 0.0003 0.0002
-3.3 0.0005 0.0005 0.0005 0.0004 0.0004 0.0004 0.0004 0.0004 0.0004 0.0003
-3.2 0.0007 0.0007 0.0006 0.0006 0.0006 0.0006 0.0006 0.0005 0.0005 0.0005
-3.1 0.0010 0.0009 0.0009 0.0009 0.0008 0.0008 0.0008 0.0008 0.0007 0.0007
-3.0 0.0013 0.0013 0.0013 0.0012 0.0012 0.0011 0.0011 0.0011 0.0010 0.0010
-2.9 0.0019 0.0018 0.0018 0.0017 0.0016 0.0016 0.0015 0.0015 0.0014 0.0014
-2.8 0.0026 0.0025 0.0024 0.0023 0.0023 0.0022 0.0021 0,0021 0.0020 0.0019
-2.7 0.0035 0.0034 0.0033 0.0032 0.0031 0.0030 0.0029 0.0028 0.0027 0.0026
-2.6 0.0047 0.0045 0.0044 0.0043 0.0041 0.0040 0.0039 0.0038 0.0037 0.0036
-2.5 0.0062 0.0060 0.0059 0.0057 0.0055 0.0054 0.0052 0.0051 0.0049 0.0048
-2.4 0.0082 0.0080 0.0078 0.0075 0.0073 0.0071 0.0069 0.0068 0.0066 0.0064
SNOLLIIFIMLLSKI 'ET UaLcIVHD-2.3 0.0107 0.0104 0.0102 0.0099 0.0096 0.0094 0.0091 0.0089 0.0087 0.0084
-2.2 0.0139 0.0136 0.0132 0.0129 0.0125 0.0122 0.0119 0.0116 0.0113 0.0110
-2.1 0.0179 0.0174 0.0170 0.0166 0.0162 0.0158 0.0154 0.0150 0.0146 0.0143 )....,
-2.0 0.0228 0.0222 0.0217 0.0212 0.0207 0.0202 0.0197 0.0192 0.0188 0.0183 S4
-1.9 0.0287 0.0281 0.0274 0.0268 0.0262 0.0256 0.0250 0.0244 0.0239 0.0233 S4
-1.8 0.0359 0.0351 0.0344 0.0336 0.0329 0.0322 0.0314 0.0307 0.0301 0.0294
-1.7
-1.6
0.0446
0.0548
0.0436
0.0537
0.0427
0.0526
0.0418
0.0516
0.0409
0.0505
0.0401
0.0495
0.0392
0.0485
0.0384
0.0475
0.0375
0.0465
0.0367
0.0455
S
L-41
-1.5 0.0668 0.0655 0.0643 0.0630 0.0618 0.0606 0.0594 0.0582 0.0571 0.0559 CZ
-1.4 0.0808 0.0793 0.0778 0.0764 0.0749 0.0735 0.0721 0.0708 0.0694 0.0681
-1.3 0.0968 0.0951 0.0934 0.0918 0.0901 0.0885 0.0869 0.0853 0.0838 0.0823 .. .
-1.2 0.1151 0.1131 0.1112 0.1093 0.1075 0.1056 0.1038 0.1020 0.1003 0.0985
-1.1 0.1357 0.1335 0.1314 0.1292 0.1271 0.1251 0.1230 0.1210 0.1190 0.1170 157-
-1.0 0.1587 0.1562 0.1539 0.1515 0.1492 0.1469 0.1446 0.1423 0.1401 0.1379
-0.9 0.1841 0.1814 0.1788 0.1762 0.1736 0.1711 0.1685 0.1660 0.1635 0.1611 Lz1
-0.8 0.2119 0.2090 0.2061 0.2033 0.2005 0.1977 0.1949 0.1922 0.1894 0.1867
-0.7 0.2420 0.2389 0.2358 0.2327 0.2296 0.2266 0.2236 0.2206 0.2177 0.2148 0
-0.6 0.2743 0.2709 0.2676 0.2643 0.2611 0.2578 0.2546 0.2514 0.2483 0.2451
-0.5 0.3085 0.3050 0.3015 0.2981 0.2946 0.2912 0.2877 0.2843 0.2810 0.2776 s.. .
-0.4 0.3446 0.3409 0.3372 0.3336 0.3300 0.3264 0.3228 0.3192 0.3156 0.3121 Fl
-0.3 0.3821 0.3783 0.3745 0.3707 0.3669 0.3632 0.3594 0.3557 0.3520 0.3483
b -0.2 0.4207 0.4168 0.4129 0.4090 0.4052 0.4013 0.3974 0.3936 0.3897 0.3859 L 'Il
-0.1 0.4602 0.4562 0.4522 0.4483 0.4443 0.4404 0.4364 0.4325 0.4286 0.4247 G
0.0 0.5000 0.4960 0.4920 0.4880 0.4840 0.4801 0.4761 0.4721 0.4681 0.4641 C4TABLE 13-2
The Cumulative Normal Distribution N (x) when x > 0
d 0.00 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09
0.0 0.5000 0.5040 0.5080 0.5120 0.5160 0.5199 0.5239 0.5279 0.5319 0.5359
0.1 0.5398 0.5438 0.5478 0.5517 0.5557 0.5596 0.5636 0.5675 0.5714 0.5753
0.2 0.5793 0.5832 0.5871 0.5910 0.5948 0.5987 0.6026 0.6064 0.6103 0.6141
0.3 0.6179 0.6217 0.6255 0.6293 0.6331 0.6368 0.6406 0.6443 0.6480 0.6517
0.4 0.6554 0.6591 0.6628 0.6664 0.6700 0.6736 0.6772 0.6808 0.6844 0.6879
0.5 0.6915 0.6950 0.6985 0.7019 0.7054 0.7088 0.7123 0.7157 0.7190 0.7224
0.6 0.7257 0.7291 0.7324 0.7357 0.7389 0.7422 0.7454 0.7486 0.7517 0.7549
0.7 0.7580 0.7611 0.7642 0.7673 0.7704 0.7734 0.7764 0.7794 0.7823 0.7852
0.8 0.7881 0.7910 0.7939 0.7967 0.7995 0.8023 0.8051 0.8078 0.8106 0.8133
0.9 0.8159 0.8186 0.8212 0.8238 0.8264 0.8289 0.8315 0.8340 0.8365 0.8389
1.0 0.8413 0.8438 0.8461 0.8485 0.8508 0.8531 0.8554 0.8577 0.8599 0.8621
1.1 0.8643 0.8665 0.8686 0.8708 0.8729 0.8749 0.8770 0.8790 0.8810 0.8830
1.2 0.8849 0.8869 0.8888 0.8907 0.8925 0.8944 0.8962 0.8980 0.8997 0.9015
1.3 0.9032 0.9049 0.9066 0.9082 0.9099 0.9115 0.9131 0.9147 0.9162 0.9177
1.4 0.9192 0.9207 0.9222 0.9236 0.9251 0.9265 0.9279 0.9292 0.9306 0.9319
1.5 0.9332 0.9345 0.9357 0.9370 0.9382 0.9394 0.9406 0.9418 0.9429 0.9441
1.6 0.9452 0.9463 0.9474 0.9484 0.9495 0.9505 0.9515 0.9525 0.9535 0.9545
1.7 0.9554 0.9564 0.9573 0.9582 0.9591 0.9599 0.9608 0.9616 0.9625 0.9633
1.8 0.9641 0.9649 0.9656 0.9664 0.9671 0.9678 0.9686 0.9693 0.9699 0.9706
1.9 0.9713 0.9719 0.9726 0.9732 0.9738 0.9744 0.9750 0.9756 0.9761 0.9767
2.0 0.9772 0.9778 0.9783 0.9788 0.9793 0.9798 0.9803 0.9808 0.9812 0.9817
2.1 0.9821 0.9826 0.9830 0.9834 0.9838 0.9842 0.9846 0.9850 0.9854 0.9857
2.2 0.9861 0.9864 0.9868 0.9871 0.9875 0.9878 0.9881 0.9884 0.9887 0.9890
SNOL MELIIIISla 'GI 1131dV11 32.3 0.9893 0.9896 0.9898 0.9901 0.9904 0.9906 0.9909 0.9911 0.9913 0.9916
2.4 0.9918 0.9920 0.9922 0.9925 0.9927 0.9929 0.9931 0.9932 0.9934 0.9936 1--.■
2.5 0.9938 0.9940 0.9941 0.9943 0.9945 0.9946 0.9948 0.9949 0.9951 0.9952
2.6 0.9953 0.9955 0.9956 0.9957 0.9959 0.9960 0.9961 0.9962 0.9963 0.9964 FAD
2.7 0.9965 0.9966 0.9967 0.9968 0.9969 0.9970 0.9971 0.9972 0.9973 0.9974
Li
2.8 0.9974 0.9975 0.9976 0.9977 0.9977 0.9978 0.9979 0.9979 0.9980 0.9981 1-4
2.9 0.9981 0.9982 0.9982 0.9983 0.9984 0.9984 0.9985 0.9985 0.9986 0.9986 tzl
3.0 0.9987 0.9987 0.9987 0.9988 0.9988 0.9989 0.9989 0.9989 0.9990 0.9990 CV
3.1 0.9990 0.9991 0.9991 0.9991 0.9992 0.9992 0.9992 0.9992 0.9993 0.9993
3.2 0.9993 0.9993 0.9994 0.9994 0.9994 0.9994 0.9994 0.9995 0.9995 0.9995
3.3 0.9995 0.9995 0.9995 0.9996 0.9996 0.9996 0.9996 0.9996 0.9996 0.9997 *
3.4 0.9997 0.9997 0.9997 0.9997 0.9997 0.9997 0.9997 0.9997 0.9997 0.9998 157.
3.5 0.9998 0.9998 0.9998 0.9998 0.9998 0.9998 0.9998 0.9998 0.9998 0.9998 1-3
3.6 0.9998 0.9998 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 tzl
3.7 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999
3.8 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0.9999 0
3.9 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000
4.0 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000
4.1 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 E-I
4.2 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 ti
4.3 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 tz/
4.4 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000
4.5 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 1.0000 C/)
..--1476 CHAPTER 13. DISTRIBUTIONS
where M (a , 0; p1) and M (b, 0; p2) are computed from the rules where
the product ofa,b, and p is negative, and
(pa — b)Sign(a) (pb — a)Sign(b)
P1 = P2 =
a2 — 2pab + b2 a2 — 2pab + b2
1 — Sign (a) x Sign(b) 1+1 when x > 0
= Sign(x) =
4 —1 when x < 0
Computer algorithm
The CBND3(a , b, rho) function returns the standardized bivariate
normal probability that the first variable is less than a and the sec-
ond variable is less than b, where rho is the correlation between the
variables.
Function CBND3(A As Double, b As Double, rho As Double) As Double
Dim X As Variant, y As Variant
Dim rhol As Double, rho2 As Double, delta As Double
Dim al As Double, bl As Double, sum As Double
Dim i As Integer , j As Integer
X = Array(0.24840615, 0.39233107, 0.21141819, 0.03324666, 0.00082485334)
y = Array(0.10024215, 0.48281397, 1.0609498, 1.7797294, 2.6697604)
al = A / Sqr(2 * (1 — rho^2))
bl = b / Sqr(2 * (1 — rho^2))
If A <= 0 And b <= 0 And rho <= 0 Then
sum = 0
For i = 1 To 5
For j = 1 To 5
stun = sum + X(i) * X(j) * Exp(al * (2 * y(i) — al) _
+ bl * (2 * y(j) — bl) + 2 * rho * (y(i) — al) * (y(j) — bl))
Next
Next
CBND3 = Sqr(1 — rho^2) / Pi * sum
ElseIf A <= 0 And b >= 0 And rho >= 0 Then
CBND3 = CND(A) — CBND3(A, —b, —rho)
ElseIf A >= 0 And b <= 0 And rho >= 0 Then
CBND3 = CND( b) — CBND3( —A, b, —rho)
ElseIf A >= 0 And b >= 0 And rho <= 0 Then
CBND3 = CND(A) + CND(b) — 1 + CBND3(—A, —b, rho)
ElseIf A * b * rho > 0 Then
rhol = (rho * A — b) * Sgn(A) / Sqr(A^2 — 2 * rho * A * b + b^2)
rho2 = (rho * b — A) * Sgn(b) / Sqr(AA2 — 2 * rho * A * b + 102)
delta = (1 — Sgn(A) * Sgn(b)) / 4
CIIND3 = CBND3(A, 0, rhol) + CBND3(b, 0, rho2) — delta
End If
End Function
The Drezner and Wesolowsky 1990 Algorithm
Drezner and Wesolowsky (1990) suggest two algorithms for calculat-
ing the bivariate cumulative normal distribution function. Their first13.3. THE BIVARIATE NORMAL DENSITY FUNCTION 477
algorithm is much simpler and four to five times as fast as the Drezner
(1978) algorithm. However, West (2005b) has carefully tested out both
the Drezner and Wesolowsky (1990) algorithms and showed that they
can run into serious problems for certain combinations of parameters
and options contracts. I still give a short presentation of the algo-
rithms here. The simplest version of the Drezner and Wesolowsky
(1990) algorithm is
2abv p- 2 —b2
5 2(1 ,2,2 )
b; p) = N(a)N(b)+p
E xie
./1 .11— yp2
where NO is the cumulative normal distribution function given
earlier in this chapter and
=0.018854042 Yi =0.04691008
X2 = 0.038088059 Y2 = 0.23076534
X3 =-- 0.0452707394 Y3 = 0.5
== 0.038088059 Y4= 0.76923466
x5 == 0.018854042 y5 = 0.95308992
Computer algorithm
The CBND2(a, b, rho) function returns the standardized bivariate
normal probability that the first variable is less than a and the sec-
ond variable is less than b, where rho is the correlation between the
variables.
Option Base 0
Function CBND2(A As Double, b As Double, rho As Double) As Double
Dim g As Double, P As Double, x, y, sum As Double
Dim i As Integer
x = Array(0.018854042, 0.038088059, 0.0452707394, _
0.038088059, 0.018854042)
y = Array(0.04691008, 0.23076534, 0.5, 0.76923466, 0.95308992)
sum = 0
For i = 0 To 4
P = y( i ) * rho
g = 1 — P A 2
sum = sum + x( i ) * Exp((2 * A * b * P _
— A A 2 — b A 2) / g/ 2) / Sqr(g)
Next
CBND2 = rho * sum + CND(A) * CND(b)
End Function
The Genz 2004 Algorithm
Genz (2004) has provided a modification of the Drezner and
Wesolowsky (1990) single-precision algorithm with nearly double
(13.4)478 CHAPTER 13. DISTRIBUTIONS
precision (about 14-decimal accuracy). This is the recommended
bivariate algorithm and the one used for option valuation on the
accompanying CD.
Computer algorithm
The computer algorithm below is based on the original FORTRAN
code by Genz (2004) and was converted into VBA by West (2005b). The
CBND(x y, rho) function returns the standardized bivariate normal
probability that the first variable is less than x and the second variable
is less than y, where rho is the correlation between the variables.
Function CBND(X As Double, y As Double, rho As Double) As Double
A function for computing bivariate normal probabilities.
Alan Genz
Department of Mathematics
Washington State University
Pullman, WA 99164-3113
Email : alangenz@wsu edu
This function is based on the method described by
Drezner, Z and G.O. Wesolowsky, (1990),
On the computation of the bivariate normal integral ,
Journal of Statist. Comput. Simul. 35, pp. 101-107,
with major modifications for double precision ,
and for 1RI close to 1.
This code was originally translated into VBA by Graeme West
Dim i As Integer , ISs As Integer , LG As Integer , NG As Integer
Dim XX(10, 3) As Double, W(10, 3) As Double
Dim h As Double, k As Double, hk As Double, hs As Double
Dim BVN As Double, Ass As Double, asr As Double, sn As Double
Dim A As Double, b As Double, bs As Double, c As Double, d As Double
Dim xs As Double, rs As Double
W(1, 1)
XX( 1 , 1)
W(2, 1)
XX(2 , 1)
=
=
=
=
0.17132449237917
—0.932469514203152
0.360761573048138
—0.661209386466265
W(3, 1) = 0.46791393457269
)0((3, 1) = —0.238619186083197
W(1, 2) = 0.0471753363865118
)0((1, 2) = —0.981560634246719
W(2, 2) = 0.106939325995318
XX(2, 2) = —0.904117256370475
W(3, 2) = 0.160078328543346
)0((3, 2) = —0.769902674194305
W(4, 2) = 0.203167426723066
)0((4, 2) = —0.587317954286617
W(5, 2) = 0.233492536538355
)0((5, 2) = —0.36783149899818
W(6, 2) = 0.249147045813403
)0((6, 2) = —0.12523340851146913.3. THE BIVARIATE NORMAL DENSITY FUNCTION 479
W(1, 3) = 0.0176140071391521
XX(1, 3) = —0.993128599185095
W(2, 3) = 0.0406014298003869
XX(2, 3) = —0.963971927277914
W(3, 3) = 0.0626720483341091
XX(3, 3) = —0.912234428251326
W(4, 3) = 0.0832767415767048
XX(4, 3) = —0.839116971822219
W(5, 3) = 0.10193011981724
XX(5, 3) = —0.746331906460151
W(6, 3) = 0.118194531961518
XX(6, 3) = —0.636053680726515
W(7, 3) = 0.131688638449177
XX(7, 3) = —0.510867001950827
W(8, 3) = 0.142096109318382
XX(8, 3) = —0.37370608871542
W(9, 3) = 0.149172986472604
XX(9, 3) = —0.227785851141645
W(10, 3) = 0.152753387130726
XX(10, 3) = —0.0765265211334973
If Abs(rho) < 0.3 Then
NG = 1
LG = 3
ElseIf Abs(rho) < 0.75 Then
NG = 2
LG = 6
Else
NG = 3
LG = 10
End If
h = —X
k = —y
hk = h * k
B'VN = 0
If Abs(rho) < 0.925 Then
If Abs(rho) > 0 Then
hs = (h * h + k * k) / 2
asr = ArcSin(rho)
For i = 1 To LG
For ISs = —1 To 1 Step 2
sn = Sin(asr * (ISs * NG) + 1) / 2)
BVN = BVN + NG) * 5[p((sn * hk — hs) / (1 — sn * sn))
Next ISs
Next i
BVN = BVN * asr / (4 * Pi)
End If
BVN = BVN + CNEk—h) * CNEX—k)
Ease
If rho < 0 Then
k = —k
hk = —hk
Ehd If
If Abs(rho) < 1 Then
Ass = (1 — rho) * (1 + rho)
A = Sqr(Ass)
bs = (h — k)A2480 CHAPTER 13. DISTRIBUTIONS
c = (4 — hk) / 8
d = (12 — hk) / 16
asr = —(bs / Ass + hk) / 2
If asr > —100 Then BVN = A * Ekp(asr) * (1 — c * (bs — Ass) _
* (1 — d * bs / 5) / 3 + c * d * Ass * Ass / 5)
If —hk < 100 Then
b = Sqr(bs)
BVN = BVN — Ebcpp(—hk / 2) * Sqr(2 * Pi) * / A) _
* b * (1 — c * bs * (1 — d * bs / 5) / 3)
End If
A = A / 2
For i = 1 To LG
For ISs = —1 To 1 Step 2
xs = (A * (ISs * XX(i, NG) + 1))"2
rs = Sqr(1 — xs)
asr = —(bs / xs + hk) / 2
If asr > —100 Then
BVN = BVN + A *M(i, NG) * Ekp(asr) _
* (acp(—hk * (1 — rs) / (2 * (1 + rs))) / rs _
— (1 + c * xs * (1 + d * xs)))
End If
Next ISs
Next i
BVN = —BVIN / (2 * Pi)
End If
If rho > 0 Then
BVN = BVN + CN1X—Nlax(h, k))
Ease
BVN = —FINN
If k > h Then BVN = BVN + CND(k) CND(h)
End If
End If
CHND=BVN
End Function
Function ArcSin(X As Double) As Double
If Abs(K) = 1 Then
AxcSin = Sgn(X) * Pi / 2
Ease
AxcSin = Atn(X / Sqr(1 — XA2))
End If
End Function
Table Values Cumulative Bivariate Function
Those who wish to retype or program any of the cumulative bivariate
functions on their own can check their results against Table 13-3 on
p. 481. In the bottom of the column named Drezner-78, you will find
"#VALUE!"; this is because the Drezner-78 algorithm was not able to
calculate any values for these input parameters.0000000000'0 00000000000 IL9VLST000.0 laIYIVA# 66666660- 6666666'0- 100000
00000000000 00000000000 tgEVL8T000.0 00000000000 66666660- 66666660- 0
060T Egg6IVO 17601 Egg6I17.0 17601EZZ6I17.0 VL90Egg6I17.0
VgEEOZI8L17.0 KEEOZIKVO tgEEOZISLVO tgEEOZ ISLVO 0 TO TO
Zg9E6OZZLE0 6I906EZZLZ*0 6I9E6EZZLE0 6£606£ZZLZ*0 TO TO- co
VLIO8IMVI*0 g81081gg171.0 g81O8IggV1O IT7908IggVI '0
6gZIZVEE1Z'O 6ggIgtEE1 Z*0 6ggIgtEE1Z*0 6gZIZVEE1 Z*0 0 TO- TO
E6EZOVE8IVO L8EZ0VE8I17.0 LSEZOVESIVO LZ9Z0VE81VO TO 0 TO
6IggggIELZ*0 9gggggIELZ*0 9gggggIEZEO 986IZZIELZ*0 TO- 0 TO
90EZIOL9PE*0 90£ZIEL917£'0 90£ZIOL9t£.0 OT EZIELSVE*0 0 0 TO
ZZgE6EZZLZ*0 6IgE6EZZLZ*0 6IgE6EZZZEO 6E6E6EZZZEO g.0 g'0 TO-
VLI08IggVI*0 g8I 08IggVLO 981081g071 .0 IT7908IggVI*0 g'0- TO TO-
6ggIgtEETZ*0 6ggIgtEE1 Z*0 6ggIgtEETZ*0 6ggIgtEE1 Z*0 0 g'0 TO-
EIgg61E910 EOgg61EE9I'0 0g61EE910 917L1761EE910 g'0 g'0- TO-
998 I S6g9E0.0 698'18'6 g9C0 .0 698186g9£0.0 61;171860E0'0
8g Itg6Ig60.0 8g Itg6Ig60.0 8IT7g6Ig60.0 8Z1Vg61g60.0 0 g'0- TO-
I8LUL89ZZ*0 VULLL89ZZ*0 VZILLL89gg'0 VIO8LL89M0 TO 0 TO-
L09L6g9180*0 EI9L6g9180.0 EI9L6g9I80.0 ELEL6g9I80.0 TO- 0 9'0-
1769L89gtg I'0 1769L89gtg1.0 V69L89gt9 1.0 069/.89gtg10 0 0 90-
E6EZ0VE8IV0 L8EZOVE8I17.0 L8EZOVESIV0 LZ9ZOVESIVO g.0 g.0 0
6IZZZZIELZ*0 9ZggggIELZ*0 9ZUZZIELZ*0 986IZZIELZ*0 9'0- g'0 0
90EZIELgPE.0 90EZ I ELM.° 90EZIOLgPS*0 OT MI ELM.° 0 9.0 0
I8ULL89ZZ.0 VULLL89M0 VULLLS9M0 VI08LL89M0 g.0 TO- 0
L09L699180.0 £19L699180.0 E19L699180.0 ELEL699180'0 T0- 9'0- 0
1769L89gtg 1.0 1769L89gt91.0 1769L89gt91 .0 069L89gt910 0 g"0- 0
MECUM.° IZEEEEEEEE*0 IZEEEEEEEE'0 ESEEEEEEMO 9.0 0 0
L999999991 .0 6L99999991 *0 6L9999999I .0 LT99999991 .0 9.0- 0 0
000000009g'0 000000009g'0 000000009g.0 88666666Vg0 0 0 0
azuaD z-samaJa T-samaJa 8L-JauzaJa
sanllictuctoid iguLioN alumunig
E-EI 'DI VI482 CHAPTER 13. DISTRIBUTIONS
13.4 THE TRIVARIATE CUMULATIVE NORMAL
DISTRIBUTION FUNCTION
For certain exotic options, one needs the trivariate cumulative normal
distribution function. I will not go into detail on this function here
but simply give you the VBA algorithm. The main function CTND(.)
returns the trivariate cumulative normal probability. The function
also calls the bivariate cumulative normal distribution function
CBND(.) given in this chapter.
Computer algorithm
Function GTND(LIMIT1 As Double, LIMIT2 As Double, LIMIT3 As Double, _
SIGMA1 As Double, SIGMA2 As Double, SIGMA3 As Double) As Double
A function for computing trivariate normal probabilities.
This function uses an algorithm given in the paper
"Numerical Computation of Bivariate and
Trivariate Normal Probabilities",
by
Alan Genz
Department of Mathematics
Washington State University
Pullman, WA 99164-3113
Email : alangenz@wsu.edu
Thanks to Graeme West for help with VBA version
:C7YVD calculates the probability that X(I) < LIMIT(I), I = 1, 2, 3.
' Parameters
' LIMIT DOUBLE PRECISION array of three upper integration limits.
' SIGMA DOUBLE PRECISION array of three correlation coefficients ,
SIGMA should contain the lower left portion of the
correlation matrix R.
SIGMA( 1) = R(2 , 1) , SIGMA( 2 ) = R(3 , 1) , SIGMA( 3) = R( 3 , 2 ).
C7YVD cuts the outer integral over —infinity to B1 to
an integral from —8.5 to B1 and then uses an adaptive
integration method to compute the integral of a bivariate
normal distribution function.
Dim TAIL As Boolean
Bivariate normal distribution function CBND is required.
Dim SQ21 As Double, SQ31 As Double, rho As Double
Dim B1 As Double, B2 As Double, B3 As Double, b2p As Double, b3p As Double
Dim RH021 As Double, RH031 As Double, RH032 As Double
Const scuwn = 2.506628274631
Const XCUT = —8.5
Const EPS = 5e-16
tawny ITRVBED1B2P, B3P, R11021, RH031, RHO13.4. THE TRIVARIATE CUMULATIVE FUNCTION 483
B1 = LIMIT1
B2 = LIMIT2
B3 LIMIT3
RH021 = SIGMA1
RI1031 = SIGMA2
RI1032 = SIGMA3
If Abs(B2) > Max(Abs(B1), Abs(B3)) Then
B1 = B2
B2 = LIMIT1
RH031 = RH032
RH032 = SIGMA2
ElseIf Abs(B3) > Max(Abs(B1), Abs(B2)) Then
B1 = B3
B3 = LIMIT1
RH021 = RH032
RH032 = SIGMA1
End If
TAIL = False
If B1 > 0 Then
TAIL = True
B1 = -B1
RH021 = -RH021
RH031 = -RH031
End If
If B1 > XCUT Then
If 2 * Abs(RH021) < 1 Then
SQ21 = Sqr(1 - RH021^2)
Else
SQ21 = Sqr((1 - RH021) * (1 + RH021))
End If
If 2 * Abs(RH031) < 1 Then
SQ31 = Sqr(1 - RH031 A 2)
Else
SQ31 = Sqr((1 - RH031) * (1 + RH031))
End If
rho =
b2p =
RH021
b3p =
RH031
CIND =
Else
CTND =
End If
(RI1032 - RH021 * RH031) / (SQ21 * SQ31)
B2 / SQ21
= RI1021 / SQ21
B3 / SQ31
= RI1031 / SQ31
ADONED(XCUP, Bl, EPS, b2p, b3p, RH021, RH031, rho) / SQTWPI
If TAIL = True Then
CIND =CEND(B2, B3, RH.032) - CIND
End If
End Function
Function ADONED(A As Double, b As Double, TOL As Double, _
b2p As Double, b3p As Double, RH021 As Double, -484 CHAPTER 13. DISTRIBUTIONS
R11031 As Double, rho As Double) As Double
One Dimensional Globally Adaptive Integration Function
Dim i As Integer , IM As Integer , IP As Integer
Const NL = 100
Dim EI(NL) As Double, AI(NL) As Double, BI(NL) As Double, FI(NL) As Double
Dim FIN As Double , MR As Double
IP = 1
AI(IP) = A
BI(IP) = b
FI( IP ) = ERNRDD(AI( IP ) , BI( IP ) , EI( IP ) , b2p, b3p, R11021, RH031, rho)
IM = 1
10 LM = LM + 1
BI(LM) = BI(IP)
AI(IM) = (AI(IP) + BI(IP)) / 2
BI(IP) = AI(IM)
FIN = FI(IP)
FI( IP ) = KRNRDD(AI( IP ) , BI(IP), EI( IP ) , b2p, b3p, RH021, RH031, rho)
FI (IM) = KRNIIDD( AI (IM) , BI (IM) , EI OM ) , b2p , b3p , RH021, RH031, rho )
ERR, = Abs(FIN — FI(IP) — FI(IM)) / 2
EI(IP) = EI(IP) + HR
EDDA) = ET(IN) + ERR
IP = 1
ERR = 0
FIN = 0
For i 1 To IM
If EI(i ) > EI(IP) Then
IP = i
End If
FIN = FIN + FI(i )
ERR = ERR + EI(i
Next i
If ERR > ToL And IM < NL Then
GoTo 10
End If
ADONED = FIN
End Function
Function KRNRDD(A As Double, b As Double, ABSERR As Double, _
b2p As Double, b3p As Double, RH021 As Double, _
R11031 As Double, rho As Double) As Double
Kron rod Rule
Dim ABSCIS As Double, CENTER As Double, FC As Double, _
FUNSUM As Double, BFLGITI As Double
Dim RESLTG As Double, RESLTK As Double
The abscissae and weights are given for the interval (-1,1)
because of symmetry only the positive abscisae and their
corresponding weights are given.13.4. THE TRIVARIATE CUMULATIVE FUNCTION 485
XGK — abscissae of the 2N+1—point Kronrod rule :
XGK(2), XGK(4), N-point Gauss rule abscissae ;
XGK(1), XGK(3), ... abscissae optimally added
to the N—point Gauss rule.
144SK — weights of the 2N+1—point Kronrod rule.
WG — weights of the N-point Gauss rule.
Dim J As Integer
Const N = 11
Dim W(0 To (N + 1) / 2) As Double
Dim NNW° To N) As Double, Xr((0 To N) As Double
1AUT(1) =
1AG(2) =
IAG(3) =
WG(4) =
IAG(5) =
WO) =
0.0556685671161745
0.125580369464905
0.186290210927735
0.233193764591991
0.262804544510248
0.272925086777901
XGE:(1) = 0.996369613889543
XGE:(2) = 0.978228658146057
XGRC(3) = 0.941677108578068
X1a(4) = 0.887062599768095
xca((5) = 0.816057456656221
21X((6) = 0.730152005574049
X1a(7) = 0.630599520161965
X1a(8) = 0.519096129206812
xca((9) = 0.397944140952378
X1a(10) = 0.269543155952345
Xr.a(11) = 0.136113000799362
X1a(0) = 0#
WC141) = 0.00976544104596129
mula2) = 0.0271565546821044
WUK(3) = 0.0458293785644267
Wia444) = 0.0630974247503748
MU1(5) = 0.0786645719322276
Mkka6) = 0.0929530985969007
AUK(7) = 0.105872074481389
VA3K(8) = 0.116739502461047
WCAI:(9) = 0.125158799100319
AUK(10) = 0.131280684229806
MUI:(11) = 0.135193572799885
M1:(0) = 0.136577794711118
List of major variables
CENIER — mid point of the interval
HFLGTH — half—length of the interval
ABSCIS — abscissae
RESLM — result of the N—point Gauss formula
RESLYK — result of the 2N+1—point Kronrod formula
HFLGI'H = ( b — A) / 2486 CHAPTER 13. DISTRIBUTIONS
CENTER = ( b + A) / 2
compute the 2N+1—point Kronrod approximation to
the integral, and estimate the absolute error.
FC = TRVFND(CENIER, b2p , b3p , RH021, RH031, rho )
RFSLTG = FC * WI(0) 0 )
RESLTK = FC * NAEK( 0 )
For J = 1 To N
ABSCIS = HFLGTH * XGK( J )
FUNSUM = TRVFND( CENTER — ABSCIS , b2p , b3p , RH021, RH031, rho ) +
TRVFND(CENIER + ABSCIS , b2p , b3p , RH021, RH031, rho )
RESLTK = RESLTK + NWIK( J) * FIJNSUM
If J Mod 2 = 0 Then
RESLTG = RESLTG + NW( J / 2 ) * FUNSUM
End If
Next J
KRNRDD = RESLTK * HFLGTH
ABSERR = 3 * Abs ( ( RESLTK — RESLTG) * HFLGIH)
End Function
Function TRVFND(T As Double, _
B2 As Double, B3 As Double, RH021 As Double,
RH031 As Double, rho As Double )
TRVFND = Exp(—T * T / 2 ) _
* CBND( —T * RH021 + B2, —T * RH031 + B3, rho )
End FunctionCHAPTER
14
SOME USEFUL FORMULAS
14.1 INTERPOLATION
## 14.1.1 Linear Interpolation
Linear interpolation consists of constructing a straight line between
two data points. (Draw the line further, and you get an extrapolation.)
r, = (r2 ri) ri (14.1)
T2 -
Example
Suppose we have a three-year interest rate of 6.3% and a four-year
rate of 7.2%. What is the linear interpolated 3.5 year rate? ri 0.063,
r2 = 0.072, 71 = 3, T2 = 4, and Ti = 3.5.
3.5 - 3
ri = (0.072 - 0.063) + 0.063 = 6.7500%
4 - 3
## 14.1.2 Log-Linear Interpolation
r
r2)(11.±1- 1 T2--TI)
r1 i (-
ri
(14.2)
Example
What is the log-linear interpolated 3.5-year rate with the same
parameters as in the linear interpolation example?
(3.5-3)
(0.063
0.072y 4-3
ri 0.063 = 6.7350%
## 14.1.3 Exponential Interpolation
Some trading systems use exponential interpolation when interpolat-
ing directly from discount factors.
xT2-T, IL Iiii
T1 T)-T1 T
2 X
T
2
-T
1 Di = D1 x D2 (14.3)
487488 CHAPTER 14. SOME USEFUL FORMULAS
Example
Suppose we have a three-year zero-coupon rate of 6.3% and a four-
year zero-coupon rate of 7.2%. What is the exponential interpolated
3.5-year discount factor? ri = 0.063, r2 = 0.072, T1 = 3, T2 = 4, T, = 3.5.
First we have to calculate the discount factors. The three-year dis-
count factor is D i = +o.o63)3 = 0.8325, and the four-year discount
factor is D2 = (1+o. )72)4 = 0.7572. Now we can interpolate the 3.5 year
discount factor:
3.5 4-3.5 3.5 3.5-3
Di -- -= 0.8325 -1- x 4-3 x 0.7572-4- x 4-3 = 0.7957
## 14.1.4 Cubic Interpolation: Lagrange's Formula
Cubic interpolation fits a third-order curve to four data points in
a row, with the interpolation being between the center two points,
see Lagrange (1795). The cubic interpolation on Lagrangian form is
given by
(Ti - T2)(Ti - T3)(Ti - T4) (Ti - Ti)(Ti - T3)(Ti - T4)
ri = r1+ T2
(T1 - T2)(T1 - T3)(TI - Tzt) (T2 - TO (T2 - T3)(T2 - Tzt)
(Ti - Ti)(Ti - T2)(Ti - T4)
± r3
(T3 - T1)(T3 - T2)(T3 - T4)
(Ti - Ti)(Ti - T2)(Ti - T3)
(Tt - )(Tt - T2)(T4 - T3)
T4
Example
Suppose we have a two-year interest rate of 6.4%, a three-year rate
of 6.3%, a four-year rate of 7.2%, and a five-year rate of 8.0%. What is
the cubic interpolated 3.5-year rate? ri = 0.064, r2 = 0.063, r3 = 0.072,
r4 = 0.08, Ti = 2, T2 =3, T3 =4, T4 =5, and Ti = 3.5.
(3.5 - 2)(3.5 - 4)(3.5 - 5) (3.5 - 3)(3.5 - 4)(3.5 - 5)
0.064 0.063 + ri =
(2 - 3)(2 - 4)(2 - 5)
(3.5 - 2)(3.5 - 3)(3.5 - 5)
(3 - 2)(3 - 4)(3 - 5)
0.072
0.08 = 6.6938%
(4 - 2)(4
(3.5 - 2)(3.5
- 3)(4 - 5)
- 3)(3.5 - 4)
## 14.1.5 Cubic-Spline Interpolation
A more sophisticated (but not necessarily better) "interpolation tech-
nique" is the cubic-spline method. The cubic-spline method uses all
the available points to get a smooth function that fits all the input
points. As this book mainly is about derivatives pricing, I will not go
into detail about cubic-spline interpolation but simply present a small
VBA algorithm that can be used for cubic-spline interpolation.
(14.4)
(5 - 2)(5 - 3)(5 -4)14.1. INTERPOLATION 489
Computer algorithm
The following function can be used for cubic-spline interpolation.
XArray is the array that will typically be the time to maturities (for
example, in number of years) for the variables you want to interpo-
late. Y Array is the values you want to interpolate from (for example,
the observed part of the yield curve). The XArray and the Y Array
must have the same size. X is the time to maturity you want to find
the cubic-spline value; this can be a single point or a whole array of
values. The best way to get started with this code is to take a look at
the ready-made Excel spreadsheet.
Function CubicSpline(XArray As Variant, YArray As Variant, X As Variant)
nRates = Application .Count(XArray) — 1
Dim MO As Variant, N() As Variant
Dim Alfa () As Variant, Beta () As Variant, Delta () As Variant
Dim Q( ) As Variant
Dim A() As Variant, B( ) As Variant, Co) As Variant
ReDim M(0 To nRates + 1)
ReDim N(0 To nRates + 1)
ReDim Alfa (0 To nRates + 1)
ReDizn Beta(0 To nRates + 1)
ReDim Delta (0 To nRates + 1)
ReDim Q(0 To nRates + 1)
ReDim A(0 To nRates + 1)
ReDim B(0 To nRates + 1)
ReDim C(0 To nRates + 1)
For i = 0 To nRates — 1
M( i ) = XArray( i + 2) — )(Array( i + 1)
N( i ) = YArray( i + 2) — YArray ( + 1)
Next
For i = 1 To nRates — 1
Q(i) = 3 * (N(i) / M(i) — N(i — 1) / M( — 1))
Next
Alfa(0) = 1
Beta (0 ) = 0
Delta (0) = 0
For i = 1 To nRates — 1
Alfa(i) i ) = 2 * (M( — 1) + M( )) —M( — 1) * Beta( i — 1)
Beta(i) i ) = M( i ) / Alfa(i) i )
Delta(i) i ) = (Q( i ) — M( i — 1) * Delta( i — 1)) / Alfa ( i )
Next
Alfa (nRates ) = 0
B(nRates ) = 0
Delta (nRates) = 0
For j = (nRates — 1) To 0 Step —1
B( j ) = Delta (j ) — Beta( j ) B( j + 1)
A( j ) = N(j ) / M(j ) — j ) / 3 * (B( j + 1) + 2 * B(j ))
C( j ) = (B( j + 1) — B( j )) / (3 * M(j ))490 CHAPTER 14. SOME USEFUL FORMULAS
Next
nn = Application . Count(X)
Dim z ( ) As Double
ReDim z ( 0 To nn + 1 )
For i = 1 To nn
ArrayNo = Application .Match(X( i ) , )(Array)
ti = Application . Index ( )(Array , ArrayNo)
yl = Application . Index (YArray , ArrayNo)
ai := Application . Index (A( ) , ArrayNo)
hi = Application . Index (B( ) , ArrayNo)
ci = Application . Index (C( ) , ArrayNo)
z(i — 1) = yl + ai * (X( i ) — ti) _
+ b * (X( i) — ti)^2 + ci * (X( i ) — ti)^3
Next
CubicSpline = Application .Transpose(z ())
End Function
## 14.1.6 Two-Dimensional Interpolation
The formula below is a straight-line interpolation between four data
points in the plane.
(t2 - - (t2 t)(1; — )Vti,T2
(14.5)
Example
Consider four bond options: Option 1 with three months to expiration,
implied volatility 6%, on an underlying bond with three years to matu-
rity; option 2 with three months to expiration, implied volatility 8%
on an underlying bond with five years to maturity; option 3 with nine
months to expiration, implied volatility 5% on an underlying bond
with three years to maturity; and option 4 with nine months to expi-
ration, implied volatility 7% on an underlying bond with five years
to maturity. The two-dimensional interpolated volatility of an option
with six months to expiration on a bond with four years to matu-
rity is ti = 0.25, t2 = 0.75, Ti = 3, T2 = 5, vti ,Ti = 0.062, vti ,T2 = 0.082,
= 0.052 , Vt2. T2 = 0.072 , ti = 0.5, and Ti = 4.
(0.75 — 0.5)(5 — 4)0.062 + (0.75 — 0.5)(4 — 3)0.082
V0.5,4 -
(0.75 — 0.25)(5 — 3)
(0.5 — 0.25)(5 — 4)0.052 (0.5 — 0.25)(4 — 3)0.072
(0.75 — 0.25)(5 — 3)
— 0.0044
06.5,4 -= N/0.0044 = 0.0660 = 6.60%
vt,,T, =
— ti ) (T2 —
(t, — 11)(7'2 — Ti )vt2,T1 + — ti)(T, — T1) 142, T2
11)(7'2 -14.2. INTEREST RATES 491
14.2 INTEREST RATES
## 14.2.1 Future Value of Annuity
FV = C + C(1 + r) + C(1 + r) 2 + • • • + C(1 + r)" — C[(1 r)n (14.6)
where C is the cash flow and n is the number of cash flows.
## 14.2.2 Net Present Value of Annuity
NPV = +
C C C I1 [40,,I I
(14.7)
(1 + r) (1 + r)2 (1 + r)" r
where C is the cash flow and n is the number of cash flows. This for-
mula plays an important role in many types of swaps and swaptions.
## 14.2.3 Continuous Compounding
From compounding in times per year to continuous compounding:
rc = min (1 + (14.8)
From continuous compounding to compounding in times per year:
rm = m(erelm — 1) (14.9)
Example
Consider an interest rate that is quoted 8% per year with quarterly
compounding. The equivalent rate with continuous compounding is
0.08
r =41n (1 + = 0.0792 = 7.92%
4
Next, consider an interest rate that is quoted 12% per year with
continuous compounding. The equivalent rate with annual compound-
ing is
rj = 1(e0.12/1 1) = 0.1275 = 12.75%
## 14.2.4 Compounding Frequency
From Compounding m Times Per Year to Annual
Compounding
(14.10)492 CHAPTER 14. SOME USEFUL FORMULAS
From Annual Compounding to Compounding m Times
per Year
rni =[(1 r)(ilm) _ 1]m
Example
Consider an interest rate that is quoted 8% per year with quarterly
compounding. The equivalent rate with annual compounding is
r (i ± 0.08)4
4 )
1 = 0.0824 = 8.24% (14.12)
From m to n Compoundings per Year
The formula below can be used to transform a rate r„ with n
compoundings per year to a rate rm with m compoundings per year.
mln
rn =[(1 —1]n (14.13)
Example
Consider a rate with compounding frequency four times per year.
If the rate is 7%, what is the equivalent rate with semiannual
compounding?
r2 = [ (1 ± 0M7)4/2 _
1 2 = 0.0706
4 )
The equivalent rate with semiannual compounding is 7.06%.
## 14.2.5 Zero-Coupon Rates from
Par Bonds/Par Swaps
To calculate zero-coupon rates from par bonds or swaps, the boot-
strapping method originally introduced by Caks (1977) is often
used.
100= Cie—r1T1 IC)e—rn i"
n- 1
100— C E = (100 + C)e—r"T"
i=1
100— C
rn = — In / Tn,
100 + C
(14.14)
where C is the bond coupon and r, is the continuous compounding
zero-coupon rate with time to maturity T,.14.3. RISK-REWARD MEASURES 493
Example
What are the zero-coupon rates given the following five par coupon
bonds?
1. A bond with one year to maturity and an annual coupon
of 6.0%
2. A bond with two years to maturity and an annual coupon
of 7.0%
3. A bond with three years to maturity and an annual coupon of
7.5%
4. A bond with four years to maturity and an annual coupon of
8.0%
5. A bond with five years to maturity and an annual coupon of 8.5%
The continuous compounding zero rate at year 1 is ln(1 + 0.06) =
0.0583. The continuous compounding zero-coupon rates at years 2, 3,
4, and 5 are
(100— 7.0 VIIIe—ri Ti
=--
=--
=-.
=
0.0680
0.0729
0.0780
0.0834
r2 = — ln /2
100 + 7.0
(100— 7.5 EL e—
r3 = — 1n /3
100 + 7.5
=1 — 8.0 e—rl Ti) (100
r4 = — 1n /4
100 + 8.0
(100— 8.5 Er e—riTi ) =1 r5 = — ln /5
100 + 8.5
14.3 RISK-REWARD MEASURES
Below are quick descriptions of some risk-reward measures often
described in the literature and promoted by hedge fund managers
marketing their strategies. For more detailed discussion on these, see
Lhabitant (2004).
## 14.3.1 Treynor's Measure
Treynor (1965) introduced the following risk-reward ratio:
rp - r
Treynor ratio =
Sp
(14.15)494 CHAPTER 14. SOME USEFUL FORMULAS
where rp is the average return of the portfolio during a specific time
period, r is the risk-free return over the same period, and pp is the
beta of the portfolio.
## 14.3.2 Sharpe Ratio
One of the most used (and abused) risk-reward measures, frequently
used by investors and portfolio managers, is the Sharpe (1966) ratio:
Sharpe ratio =
rp -
(14.16)
o-p
where rp is the average return of the portfolio during a specific time
period, r is the risk-free return over the same period, and op is the
portfolio standard deviation (volatility of the portfolio). For option
Sharpe ratios, see Chapter 2.
Example
Assume a hedge fund reports a portfolio return of 28% and that the
risk-free rate over the same period is 5%. Further, the portfolio stan-
dard deviation is 27.43%. What is the Sharpe ratio? rp = 0.12, r =0.05,
and o-p = 0.2743.
0.28 — 0.05
Sharpe ratio = — 0.8385
0.2743
## 14.3.3 Confidence Ratio
The confidence ratio is similar to the Sharpe ratio, but it takes into
account the number of sampling points used to calculate the ratio. For
example a hedge fund that has used only 12 monthly sample points
to calculate its Sharpe ratio is more or less useless from a statistical
standpoint because of the large confidence interval in the standard
deviation.
Confidence ration,« =
[rp - rp - Y1
aL
(14.17)
where o-u is the upper confidence interval of the portfolio standard
deviation and o-L is the lower confidence interval based on n observa-
tions and a confidence interval a decided by the user. Here we have
simply assumed normal distributed returns. In practice, the returns
can naturally follow other types of stochastic processes that can have
significant effect on the distribution of the Sharpe ratio, see Lo (2002)
and Lhabitant (2004).
Example
Assume the same example as under the Sharpe ratio but with the
additional information that the ratio was calculated based on only 2014.3. RISK-REWARD MEASURES 495
observations. What is the 95% confidence ratio? rp = 0.12, r =0.05,
ap = 0.2743, n = 20, and a =0.05. As we already know, the Sharpe
ratio is 0.8385. From Chapter 12 we actually calculated the confidence
interval from exactly this volatility estimate using 20 observations,
and it was aL =0.2086 and au =0.4006. This gives us a confidence
ratio of
Confidence ration =20,a=0.05 =
[0.28 — 0.05 0.28 — 0.05]
0.4006 0.2086
= [0.5741, 1.1026]
As we can see the 95% confidence interval of the Sharpe ratio
is 0.5741 to 1.1026, this is a very simple extension of reporting the
Sharpe ratio that gives much more information and will be positive
for funds with a long and stable track record. By reporting a ratio in
this way, investors can much more easily initially screen a lot of funds,
as it also says something about the length of the track record.
## 14.3.4 Sortino Ratio
The Sortino ratio introduced by Sortino and Price (1994) is a variation
on the Sharpe ratio that differentiates harmful volatility (typically
downside volatility) from volatility in general. In other words, the
Sortino ratio does not penalize a fund or portfolio for its upside
volatility.
Sortino ratio
= rp --r
(14.18)
aDown
where ap„„ is the downside volatility, or in the academic literature,
better known as known as the semistandard deviation.
## 14.3.5 Burke Ratio
Burke (1994) introduces a risk-return ratio where the returns are
divided by the square root of the sum of the squared drawdowns:
rp — r
)1E1 1%1 =-1 13''
where D, are the drawdowns, for example, daily or weekly draw-
downs.
## 14.3.6 Return on VaR
Another risk-return measure often used by hedge funds are simply
portfolio returns Rp divided by the value at risk:
Burke ratio = (14.19)
Return on VaR =
rp
(14.20)
VaR'496 CHAPTER 14. SOME USEFUL FORMULAS
where V a R naturally is the value at risk, typically calculated at 95%
or 99% confidence.
## 14.3.7 Jensen's Measure
Jensen (1965) introduced the following risk-reward measure:
Jensen measure = rp — [r fip (rm — r)], (14.21)
where rp is the expected total portfolio return, r the risk-free rate,
13p the beta of the portfolio, and r 7. the expected market return. This
measure reports the difference between the portfolio's average return
and its expected return. In other words, this is a risk-adjusted per-
formance measure that represents the average return on a portfolio
over and above that predicted by the CAPM, given the portfolio's beta
and the average market return. This is the portfolio's alpha (Jensen
alpha).
14.4 APPENDIX C: BASIC USEFUL INFORMATION
0 [I] t > '"'
Greek Alphabet
a A alpha
13 B beta
• gamma
8 A delta
• epsilon
Z zeta 4-
• eta
0 0 theta 7
The Natural Logarithm
iota P P rho
kappa a E sigma
lambda r T tau
mu v Y upsilon
nu 0 cr, phi
xi X X chi
omicron V/ kii psi
pi co Q omega
ln(xy) = in(x) + in(y)
in (-) = ln(x) — ln(y)
ln(xb) = bln(x)
ln(ex) = x
ein(x) =
ex e) = ex+Y
exy (ex)Y =
ex
ex-y
eY
Some Differentiation Rules
f (x) f' (x) f (x) f'(x) f (x) f'(x)
ax''
_;+,
ex
eu(x)
1n(x)
xa ex
euGou,(x)
x
ln(u (x )) L'il ,( (x x) )
1
2, 2,/iTHE OPTION PRICING SOFTWARE
HARDWARE REQUIREMENTS
The spreadsheets require a Windows compatible computer or a
Macintosh that run Microsoft Excel 2003 (or later versions).
COMPUTER CODE AND READY TO USE
SPREADSHEETS
This book contains a large collection of option pricing formulas. To
ease the use of the formulas, the book includes a CD with ready to
use Excel spreadsheets with Visual Basic for Application source code
for most of the formulas presented in the book. These ready-to-use
spreadsheets can be used by anyone—regardless of his or her knowl-
edge of computer languages. To start pricing options, only a minimum
knowledge of using a spreadsheet is required. All that is required is
typing in the input variables for the relevant formula. The computer
will do the rest.
The various spreadsheets call small computer programs that are
written in Visual Basic for Application (also available in Excel).
For programmers with experience in other programming lan-
guages, it is worth spending a few words on syntax particular to Visual
Basic.
Declaration of variables
Visual Basic does not require the variables to be declared before
they are used (C++, for instance, requires that all variables are ini-
tially declared). However, it is a good idea to declare all variables for
maximum speed and to reduce possible programming errors. Most
variables are thus declared in the computer code included on the CD
that comes with this book.
497498 THE OPTION PRICING SOFTWARE
Power
To take the power of a number, Visual Basic uses the symbol "^".
Example: 4'2 corresponds to 42• Further, Visual Basic uses "Exp()"
for the exponential function. Example: S * Exp(-r * T) corresponds
to Se-
IT .
Line break
To instruct the computer that the command continues on the next
line, Visual Basic uses a space followed by the character "_". In C++,
for instance, the code for a command continues until it's terminated
by “;,,.
Square root
Visual Basic applies the Sqr() command. Example: Sqr(T) is equal
to ,../7.
Natural logarithm
Visual Basic uses the Log() command. Example: Log(S I X) is equal
to ln(S I X).
For getting up to speed in Visual Basic for Applications program-
ming most introduction books on the topic will do.BIBLIOGRAPHY
AASE, K. K. (1988): "Contingent Claims Valuation When the Secu-
rity Price Is a Combination of an Ito Process and a Random Point
Process," Stochastic Processes and Their Applications, 28,185-220.
— (2004): "Negative Volatility and the Survival of the Western
Financial Markets," Wilmott Magazine.
(2005): "The Perpetual American Put Option For Jump-Diffusions
With Applications," Working Paper, UCLA and Norwegian School of
Economics and Business Administration.
ABROMOWITZ, M., AND I. A. STEGUN (1974): Handbook of Mathemati-
cal Functions: With Formulas, Graphs, and Mathematical Tables.
Dover.
Ac, E., AND R. TOFFEL (1999): "Highs and Lows: Times of the Day in
the Currency CME Market," Chap. 5 in Financial Markets Tick by
Tick, ed. Pierre Lequeux (New York: John Wiley & Sons).
ADAMCHUK, A. (1998): "From Supernova to Discovery of Supersym-
metry in Finance," New Vistas in Mathematical Foundations of
Finance, unpublished, University of Chicago.
AGCA, S., AND D. M. CHANCE (2003): "Speed and Accuracy Compar-
ison of Bivariate Normal Distribution Approximations for Option
Pricing," Journal of Computational Finance, 6(4), 61-96.
ALEXANDER, C. (2001): Market Models (New York: John Wiley & Sons).
ALLEN, S. (2003): Financial Risk Management (New York: John Wiley
& Sons).
AMIN, K. I. (1993): "Jump Diffusion Option Valuation in Discrete
Time," Journal of Finance,48,1833-1864.
AMIN, K. I., AND R. A. JARROW (1992): "Pricing Options on Risky Assets
in a Stochastic Interest Rate Economy," Mathematical Finance, 2,
217-237.
499500 BIBLIOGRAPHY
AMIN, K. I., V. NG, AND S. C. PIRRONG (1995): "Valuing Energy
Derivatives," Managing Energy Price Risk, Risk Publications and
Enron.
ASAY, M. R. (1982): "A Note on the Design of Commodity Option
Contracts," Journal of Futures Markets,52,1-7.
BACHELIER, L. (1900): Theory of speculation in The Random Character
of Stock Market Prices (Cambridge, MA: MIT Press, 1964).
BACKUS, D., S. FOREST, AND L. Wu (1997): "Accounting for Biases in
Black–Scholes," Working paper, Stern School of Business.
BALL, C. A., AND W. N. TOROUS (1983): "A Simplified Jump Process
for Common Stock Returns," Journal of Financial and Quantitative
Analysis, 18(1), 53-66.
(1985): "On Jumps in Common Stock Prices and Their Impact on
Call Option Pricing," Journal of Finance,40,155-173.
BARDHAN, I., A. BERGIER, E. DERMAN, C. DOSEMBET, AND I. KAN
(1994): "Valuing Convertible Bonds as Derivatives," Quantitative
strategies research notes.
BARLE, S., AND N. CAKICI (1995): "Growing a Smiling Tree," Risk
Magazine, 8(10).
BARONE-ADESI, G., AND R. E. WHALEY (1987): "Efficient Analytic
Approximation of American Option Values," Journal of Finance,
42(2), 301-320.
BATES, D. S. (1991): "The Crash of '87: Was It Expected? The Evidence
from Options Markets," Journal of Finance,46(3), 1009-1044.
BECKERS, S. (1983): "Variances of Security Price Returns Based on
High, Low, and Closing Prices," Journal of Business, 56,96-109.
BENEDER, R., AND T. VORST (2001): "Options on Dividend Paying
Stocks," Proceedings of the International Conference on Mathemat-
ical Finance (Singapore: World Scientific Publishing Company).
BENSOUSSAN, A., M. CROUHY, AND D. GALAI (1995): "Black-Scholes
Approximation of Warrant Prices," Advances in Futures and
Options Research, 8,1-14.
— (1997): "Black-Scholes Approximation of Complex Option Val-
ues: The Cases of European Compound Call Options and Equity
Warrants," in Option Embedded Bonds, ed. I. Nelken (Chicago:
Irwin).
BERDHAN, I. (1995): "Exchange Rate Shocks, Currency Options and
the Siegel Paradox," Journal of International Money and Finance,
14(3), 441-458.BIBLIOGRAPHY 501
BERMIN, H. P. (1996a): "Combining Lookback Options and Bar-
rier Options: The Case of Look-Barrier Options," Working paper,
Department of Economics, Lund University Sweden.
(1996b): "Exotic Lookback Options: The Case of Extreme
Spread Options," Working paper, Department of Economics, Lund
University Sweden.
(1996c): "Time and Path Dependent Options: The Case of
Time Dependent Inside and Outside Barrier Options," Paper
presented at the Third Nordic Symposium on Contigent Claims
Analysis in Finance, Iceland, May.
BHAGAVATULA, R. S., AND P. CARR (1995): "Valuing Double
Barrier Options with Time-Dependent Parameters," Discus-
sion paper, Cornell University: Johnson Graduate School of
Management.
BJERKSUND, P., AND G. STENSLAND (1993a): "American Exchange
Options and a Put-Call Tranformation: A Note," Journal of Business
Finance and Accounting, 20(5), 761-764.
(1993b): "Closed-Form Approximation of American Options,"
Scandinavian Journal of Management, 9,87-99.
(1994): "An American Call on the Difference of Two Assets,"
International Review of Economics and Finance, 3(1), 1-26.
(1996): "Implementation of the Black-Derman-Toy Interest Rate
Model," Journal of Fixed Income, 6,67-75.
(2002): "Closed-Form Valuation of American Options," Working
paper NHH.
BLACK, F. (1975): "Fact and Fantasy In the Use of Options," Financial
Analysts Journal, 36-72.
(1976): "The Pricing of Commodity Contracts," Journal of Finan-
cial Economics, 3,167-179.
BLACK, F., E. DERMAN, AND W. TOY (1990): "A One-Factor Model of Inter-
est Rates and Its Application to Treasury Bond Options," Financial
Analysts Journal, 33-39.
BLACK, F., AND P. KARASINSIU (1991): "Bond and Option Pricing
when Short Rates are Lognormal," Financial Analysts Journal,
52-59.
BLACK, F., AND M. SCHOLES (1973): "The Pricing of Options and
Corporate Liabilities," Journal of Political Economy, 81,637-654.
BLAU, G. (1994-1945): "Some Aspects of The Theory of Futures
Trading," The Review of Economic Studies, 12(1).502 BIBLIOGRAPHY
BONESS, A. (1964): "Elements of a Theory of Stock-Option Value,"
Journal of Political Economy, 72,163-175.
Bos, M., AND S. VANDERMARK (2002): "Finessing Fixed Dividends," Risk
Magazine, 157-158.
Bos, R., A. GAIRAT, AND A. SHEPELEVA (2003): "Dealing with Discrete
Dividends," Risk Magazine, 109-112.
BOUAZIZ, L., E. BRIYS, AND M. GROUHY (1994): "The Pricing of For-
ward Starting Asian Options," Journal of Banking and Finance, 18,
823-839.
BOYLE, P., M. BROADIE, AND P. GLASSERMAN (1997): "Monte Carlo
Methods for Security Pricing," Journal of Economics Dynamics and
Control, 21,1257-1321.
BOYLE, P. P. (1977): "Options: A Monte Carlo Approch," Journal of
Financial Economics, 4,323-338.
(1986): "Option Valuation Using a Three Jump Process," Inter-
national Options Journal,3,7-12.
(1988): "A Lattice Framework for Option Pricing with Two State
Variables," Journal of Financial and Quantitative Analysis, 23,
1-12.
BOYLE, P. P., J. EVNINE, AND S. Gums (1989): "Numerical Evaluation
of Multivariate Contingent Claims," Review of Financial Studies, 2,
241-50.
BOYLE, P. P., AND S. H. LAU (1994): "Bumping Up Against the Barrier
with the Binomial Method," Journal of Derivatives, 1,6-14.
BOYLE, P. P., ANDY. K. TSE (1990): "An Algorithm for Computing Values
of Options on the Maximum or Minimum of Several Assets," Journal
of Financial and Quantitative Analysis, 25,215-27.
BREEDEN, D. T., AND R. H. LITZENBERGER (1978): "Price of State-
Contingent Claims Implicit in Option Prices," Journal of Business,
51,621-651.
BRENNAN, M. J., AND E. S. SCHWARTZ (1978): "Finite Difference Methods
and Jump Processes Arising in the Pricing of Contingent Claims: A
Synthesis," Journal of Financial and Quantitative Analysis, 13(3),
461-4.
BRENNER, M., AND M. G. SUBFtAHMANYAM (1988): "A Simple Solution
to Compute the Implied Standard Deviation," Financial Analysts
Journal,80-3.
(1994): "A Simple Approach to Option Valuation and Hedging in
the Black-Scholes Model," Financial Analysts Journal,25-28.BIBLIOGRAPHY 503
BROADIE, M., AND P. GLASSERMAN (1997): "Pricing American Style
Securities Using Simulation," Journal of Economics Dynamics and
Control, 21,1323-1352.
BROADIE, M., P. GLASSERMAN, AND S. Kou (1995): "A Continuity
Correction for Discrete Barrier Options," Working paper.
(1997): "A Continuity Correction for Discrete Barrier Options,"
Mathematical Finance, 325-349.
BROCKHAUS, 0., M. FARKAS, A. FERRARIS, D. LONG, AND M. OVERHAUS
(2000): Equity Derivatives and Market Risk Models (London: Risk
Books).
BROCKHAUS, 0., A. FERRARIS, C. GALLUS, D. LONG, R. MARTIN, AND
M. OVERHAUS (1999): Modelling and Hedging Equity Derivatives
(London: Risk Books).
BROCKHAUS, 0., AND D. LONG (2000): "Volatility Swaps Made Simple,"
Risk Magazine, January
BROTHERTON-RATCLIFFE, R., AND B. IBEN (1993): "Yield Curve Applica-
tions of Swap Products," in Advanced Strategies in Financial Risk
Management, ed. Robert J. Schwartz and Clifford W. Smith, Jr. (New
York: New York Institute of Finance).
BROWN, C., AND D. ROBINSON (2002): "Skewness and Kurtosis Implied
by Option Prices: A Correction," Journal of Financial Research,
XXV(2).
BUCHEN, P., AND M. KELLY (1996): "The Maximum Entropy Distribu-
tion of an Asset Inferred from Option Prices," Journal of Financial
and Quantitative Analysis, 31,143-159.
BURGHARDT, G., AND W. HOSKINS (1994): "The Convexity Bias in
Eurodollar Futures," Carr Futures Research Note, September.
BURGHARDT, G., AND M. LANE (1990): "How to Tell if Options Are
Cheap," Journal of Portfolio Management, 72-78.
BURGHARDT, G., AND L. Liu (2002): "New Convexity Bias Series," Carr
Futures Research Note, February.
BURGHARDT, G., AND G. PANOS (2001): "Hedging Convexity Bias," Carr
Futures Research Note, August.
BURKE, G. (1994): "A Sharper Sharpe Ratio," The Computerized Trader,
March.
Cs, J. (1977): "The Coupon Effect on Yield to Maturity," Journal of
Finance, March, 103-115.
CARR, P. (1988): "The Valuation of Sequential Exchange Opportuni-
ties," Journal of Finance,43,1235-1256.504 BIBLIOGRAPHY
(1994): "European Put Call Symmetry," Working paper, Cornell
University.
CARR, P., AND J. BOWIE (1994): "Static Simplicity," Risk Magazine, 7(8).
CARR, P., K. ELLIS, AND V. GUPTA (1998): "Static Hedging of Exotic
Options," Journal of Finance,53.
CARR, P., AND D. MADAM (1998): "Towards a Theory of Volatility
Trading," in Volatility (London: Risk Books).
CHALASANI, P., S. JHA, F. EGRIBOYUN, AND A. VARIKOOTY (1999): "A
Refined Binomial Lattice for Pricing American Asian Options,"
Review of Derivatives Research, 3(1), 85-105.
CHEUK, T. H. F., AND T. C. VORST (1996): "Complex Barrier Options,"
Journal of Derivatives, 4,8-22.
CHO, H. Y., AND H. Y. LEE (1997): "A Lattice Model for Pricing Geo-
metric and Arithmetic Average Options," Journal of Financial
Engineering, 6,179-191.
CH0, H. Y., AND K. W. LEE (1995): "An Extension of the Three-Jump Pro-
cess Model for Contingent Claim Valuation," Journal of Derivatives,
3,102-108.
CHRISS, N. A. (1996): Black-Scholes and Beyond (Chicago: Irwin
Professional Publishing).
CLEWELOW, L., AND C. STRICKLAND (1998): Implementing Derivatives
Models (New York: John Wiley & Sons).
CONZE, A., AND VISWANATHAN (1991): "Path Dependent Options: The
Case of Lookback Options," Journal of Finance,46,1893-1907.
CORRADO, C. J., AND T. W MILLER (1996a): "A Note on a Simple, Accu-
rate Formula to Compute Implied Standard Deviations," Journal of
Banking and Finance, 20,595-603.
(1996b): "Volatility Without Tears," Risk Magazine, 9(7).
CORRADO, C. J., AND T. Su (1996): "Skeewness and Kurtosis in S&P
## 500 Index Returns Implied by Option Prices," Journal of Financial
Research, XIX, 175-192.
CORTAZAR, G., AND E. S. SCHWARTZ (1994): "The Valuation of
Commodity-Contigent Claims," Journal of Derivatives, 1,27-39.
Cox, J. (1975): "Notes on Option Pricing I: Constant Elasticity of
Variance Diffusions." Working Paper, Stanford University.
Cox, J. C., J. E. INGERSOLL, AND S. A. Ross (1985): "A Theory of the
Term Structure of Interest Rates," Econometrica, 53,385-407.BIBLIOGRAPHY 505
Cox, J. C., AND S. A. Ross (1976): "The Valuation of Options for Alter-
native Stochastic Processes," Journal of Financial Economics, 3,
145-166.
Cox, J. C., S. A. Ross, AND M. RUBINSTEIN (1979): "Option Pric-
ing: A Simplified Approach," Journal of Financial Economics, 7,
229-263.
Cox, J. C., AND M. RUBINSTEIN (1985): Options Markets, Chap. 8 (Upper
Saddle River, NJ: Prentice Hall).
CRACK, T. F. (1997): "Derivatives Securities Pricing," Course notes,
Indiana University.
— (2004): Heard on the Street: Quantitative Questions from Wall
Street Job Interviews, 9th ed. (Timothy Crack).
CURRAN, M. (1992): "Beyond Average Intelligence," Risk Magazine,
5(10).
(1993): "Greeks in Monte Carlo," Risk Magazine, April.
(1994): "Valuing Asian and Portfolio Options by Conditioning on
the Geometric Mean Price," Management Science, 40(12), 1705–
1711.
Dm, M., Y. KWOK, AND L. X. Wu (2003): "Options With Multiple Reset
Rights," International Journal of Theoretical and Applied Finance,
6(6), 637-653.
DA!, M., AND Y. K. KWOK (2004): "Knock-in American Option," The
Journal of Futures Markets, 24(2), 179-192.
DAI, T., G. HUANG, AND Y. LYUU (2002): "Extremely Accurate and Effi-
cient Algorithms for European-Style Asian Options with Range,"
Working paper.
DAI, T., AND Y. LYUU (2002): "Efficient, Exact Algorithms for Asian
Options with Multiresolution Lattices," Review of Derivatives
Research, 5,181-203.
DEMETERIFI, K., E. DERMAN, M. KAMAL, AND J. Zou (1999): "More Than
You Ever Wanted to Know about Volatility Swaps," Working paper,
Goldman Sachs.
DERMAN, E. (1992): "Outperformance Options," Working paper,
Goldman Sachs.
(1999): "Regimes of Volatility," Risk Magazine, April.
DERMAN, E., AND N. TALEB (2005): "The Illusion of Dynamic Delta
Replication," Quantitative Finance, 5(4), 323-326.506 BIBLIOGRAPHY
DERMAN, E., I. BARDHAN, D. ERGENER, AND I. KANI (1995): "Enhanced
Numerical Methods for Options with Barriers," Financial Analysts
Journal,November—December, 65-74.
DERMAN, E., D. ERGENER, AND I. KANI (1995): "Static Options Replica-
tion," Journal of Derivatives, 2,78-95.
DERMAN, E., AND M. KAMAL (1999): "When You Cannot Hedge Con-
tinuously: The Corrections of Black-Scholes," Risk Magazine, 12,
82-85.
DERMAN, E., AND I. KANI (1994): "Riding on a Smile," Risk Magazine,
7(2).
(1998): "Stochastic Implied Trees: Arbitrage Pricing with Stochas-
tic Term and Strike Structure of Volatility," International Journal
of Theoretical and Applied Finance, 1(1), 61-110.
DERMAN, E., I. KANI, AND N. CHRISS (1996): "Implied Trinomial Trees
of the Volatility Smile," Journal of Derivatives, 3(4), 7-22.
DERMAN, E., P. KARASINSKI, AND J. S. WECKER (1990): "Under-
standing Guaranteed Exchange-Rate Contracts in Foreign Stock
Investments," International Equity Strategies, Goldman Sachs,
June.
DERosA, D. (2000): Options on Foreign Exchange (New York: John
Wiley & Sons).
DRAPER, H. (1721): "k roc—Volume and Two Greeks Gives SthSeKa
Numbers, 986," Analen der Noisulli, 67,3-500.
DRAVID, A., M. RICHARDSON, AND T. S. SUN (1993): "Pricing Foreign
Index Contigent Claims: An Application to Nikkei Index Warrants,"
Journal of Derivatives, 1(1), 33-51.
DREZNER, Z. (1978): "Computation of the Bivariate Normal Integral,"
Mathematics of Computation, 32,277-279.
DREZNER, Z., AND G. 0. WESOLOWSKY (1990): "On the Computa-
tion of the Bivariate Normal Integral," The Journal of Statistical
Computation and Simulation, 35(1,2), 101-107.
DUFFY, D. J. (2006): Finite Difference Methods in Financial Engineer-
ing. (New York: John Wiley & Sons).
DUMAS, B., L. P. JENNERGREN, AND B. NASLUND (1995): "Siegel's Para-
dox and The Pricing of Currency Options," Journal of International
Money and Finance, 14(3), 213-223.
DUPIRE, B. (1994): "Pricing with a Smile," Risk Magazine, 7(1).
ENGLE, R. F., AND J. MEZRICH (1995): "Grappling with GARCH," Risk
Magazine, September.BIBLIOGRAPHY 507
ENGLE, R. F., AND V. K. NG (1993): "Measuring and Testing the Impact
of News on Volatility," Journal of Finance, 48(5), 1749-1779.
ESSER, A. (2003): "General Valuation Principles for Arbitrary Payoffs
and Applications to Power Options Under Stochastic Volatility,"
Working paper, Goethe University.
EYDELAND, A., AND K. WOLYNIEC (2003): Energy and Power Risk
Management (New York: John Wiley & Sons).
FAURE, H. (1982): "Discrepence de Suites Associees a un Systeme de
Numeration (en Simension s)," Acta Arithmetica, 41,337-351.
FEINSTEIN, S. (1988): "A Source of Unbiased Implied Volatil-
ity Forecasts," Working paper, 88-9, Federal Reserve Bank
of Atlanta.
FIGLEWSKI, S., AND B. GAO (1999): "The Adaptive Mesh Model: A
New Approach to Efficient Option Pricing," Journal of Financial
Economics, Elsevier, 53(3), September, 313-351.
FLESAKER, B. (1993): "Arbitrage Free Pricing of Interest Rate Deriva-
tives and Forward Contracts," The Journal of Futures Markets,
13,77-91.
FOUQUE, J., G. PAPANICOLAOU, AND K. R. SIRCAR (2000): Derivatives
in Financial Markets with Stochastic Volatility (Cambridge, UK:
Cambridge University Press).
FRENCH, D. W (1984): "The Weekend Effect on the Distribution of Stock
Prices," Journal of Financial Economics,13,547-559.
FRENCH, K. R. (1980): "Stock Returns and the Weekend Effect,"
Journal of Financial Economics,8,55-69.
FRENCH, K. R., AND R. ROLL (1986): "Stock Return Variances," Journal
of Financial Economics, 17,5-26.
FRISHLING, V. (2002): "A Discrete Question," Risk Magazine, January.
GAO, B., J. HUANG, AND M. SUBRAHMANYAM (2000): "The Valuation
of American Barrier Options Using the Decomposition Technique,"
Journal of Economics Dynamics & Control, 24,1783-1827.
GARMAN, M. (1989): "Recollection in Tranquility," Risk Magazine, 2(3).
(1992): "Charm School," Risk Magazine, 5(7), 53-56.
GAR, M., AND S. W. KOHLHAGEN (1983): "Foreign Currency
Option Values," Journal of International Money and Finance, 2,
231-237.
GARMAN, M. B., AND M. J. KLASS (1980): "On the Estimation of Security
Price Volatilities from Historical Data," Journal of Business, 53(1),
67-78.508 BIBLIOGRAPHY
GATHERAL, J. (2006): The Volatility Surface: A Practitioner's Guide.
(New York: John Wiley & Sons).
GEMAN, H., AND A. EYDELAND (1995): "Domino Effect," Risk Magazine,
8(4).
GEMAN, H., AND M. YOR (1993): "Bessel Processes, Asian Options, and
Perpetuities," Mathematical Finance, 3(4), 349-375.
(1996): "Pricing and Hedging Double-Barrier Options: A Proba-
bilistic Approach," Mathematical Finance, 6(4), 365-378.
GENZ, A. (2004): "Numerical Computation of Rectangular Bivariate
and Trivariate Normal t Probabilities," Statistics and Computing,
14,151-160.
GERBER, H. U., AND S. W. SHIU (1994): "Martingale Approach to Pricing
Perpetual American Options,"Astin Bulletin, 24(2), 195-220.
GESKE, R. (1977): "The Valuation of Corporate Liabilities as Compound
Options," Journal of Financial and Quantitative Analysis,541-552.
— (1979a): "A Note on an Analytical Formula for Unprotected Amer-
ican Call Options on Stocks with Known Dividends," Journal of
Financial Economics, 7,375-80.
— (1979b): "The Valuation of Compound Options," Journal of
Financial Economics, 7,63-81.
GIBBONS, M. R., AND P. HESS (1981): "Day of the Week Effect and Asset
Returns," Journal of Business, 54,579-596.
GIBSON, R., AND E. S. SCHWARTZ (1990): "Stochastic Convenience Yield
and the Pricing of Oil Contingent Claims," Journal of Finance,45,
959-976.
GLASSERMAN, P. (2003): Monte Carlo Methods in Financial Engineer-
ing (New York: Springer-Verlag).
GLASSERMAN, P., P. HEIDELBERG, AND P. SHAHABUDDIN (2000): "Impor-
tance Sampling in the Heath-Jarrow-Merton Framework," Working
paper, Columbia University.
GOLDMAN, B. M., H. B. SOSIN, AND M. A. GATTO (1979): "Path Dependent
Options: "Buy at the Low Sell at the High"," Journal of Finance,
34(5), 1111-1127.
GRABBE, 0. J. (1983): "The Pricing of Put and Call Options on For-
eign Exchange," Journal of International Money and Finance, 2(3),
239-253.
GRANDITS, P., AND W. SCHACHINGER (2001): "Leland's Approach to
Option Pricing: The Evolution of a Discontinuity," Mathematical
Finance, 11(3).BIBLIOGRAPHY 509
GRAY, S. F., AND R. E. WHALEY (1997): "Valuing Bear Market Reset
Warrants with a Periodic Reset," Journal of Derivatives, 5,229-263.
— (1999): "Reset Put Options: Valuation, Risk Characteristics, and
Application," Australian Journal of Management, 24,1-20.
HAGAN, P. S., D. KUMAR, A. S. LESNIEWSKI, AND D. E. WOODWARD (2002):
"Managing Smile Risk," Wilmott Magazine, September, 1(1).
HAGAN, P. S., AND D. WOODWARD (1999): "Equivalent Black Volatilities,"
Applied Mathematical Finance, 6,113-129.
HAKANSSON, N. (1991): "Supershares," Discussion paper, Institute
of Business and Economic Research, University of California at
Berkeley.
HAKANSSON, N. H. (1976): "The Purchasing Power Fund: A New
Kind of Financial Intermediary," Financial Analysts Journal,
32,49-59.
HALTON, J. H. (1960): "On the Efficiency of Certain Quasi-Random
Sequences of Points in Evaluating Multi-Dimensional Integrals,"
Numerische Mat hematik, 2,84-94.
HANDLEY, J. C. (2001): "Variable Purchase Options," Review of Deriva-
tives Research, (4), 219-230.
HANSEN, A. T., AND P. L. JORGENSEN (1997): "Analytical Valuation
of American-Style Asian Options," Working paper, University of
Aarhus, Denmark.
HART, I., AND M. Ross (1994): "Striking Continuity," Risk Magazine,
7(6).
HART, J. (1968): Computer Approximations (Algorithm 5666 for the
error function). (New York: John Wiley & Sons).
HAUG, E., A. JAVAHERI, AND P. WiLmarr (2004): "GARCH and Volatility
Swaps," Quantitative Finance, 4,589-595.
HAUG, E. G. (1992): "Volatilitetskjegler som Analyseverktoy," Beta,
6(1), 27-35.
— (1993): "Opportunities and Perils of Using Option Sensitivities,"
Journal of Financial Engineering,2(3), 253-269.
(1996): "Implisitt Korrelasjon i Valutamarkedet," Beta, 9(1),
39-43.
— (1998): "Put-Call Barrier Transformations," Working paper, Tern-
pus Financial Engeneering.
— (2001a): "Closed-Form Valuation of American Barrier Options,"
International Journal of Theoretical and Applied Finance, XIX,
175-192.510 BIBLIOGRAPHY
(200 lb): "First-then-Knockout Options," Wilmott Magazine,
August.
(2001c): "The Options Genius," Wilmott Magazine, 1(1).
— (2002): "A Look in the Antimatter Mirror," Wilmott Magazine,
December, www.wilmott.com.
— (2003): "Know Your Weapon, Part 1 and 2," Wilmott Magazine,
May and August.
(2004): "Why So Negative to Negative Probabilities?" Wilmott
Magazine, September/October.
(2005a): "Practical Valuation of Power Derivatives" Wilmott
Magazine, November.
(2005b): "Valuation of Complex Barrier Options Using Symmetry,"
Unpublished working paper.
(2006): Derivatives: Models on Models. (New York: John Wiley &
Sons).
HAUG, E. G., AND J. HAUG (1996): "Implied Forward Volatility," Paper
presented at the Third Nordic Symposium on Contingent Claims
Analysis in Finance, Iceland, May.
— (1998): "Closed Form Approximation for European Options with
Discrete Dividend," Unpublished working paper.
(2001): "Resetting Strikes, Barriers, and Time," www.wilmott.com .
(2002): "Knock-in/out Margrabe," Wilmott Magazine, 1(2),
183-204.
HAUG, E. G., J. HAUG, AND A. LEWIS (2003): "Back to Basics A New
Approach to the Discrete Dividend Problem," Wilmott Magazine,
September.
HAUG, E. G., J. HAUG, AND W MARGRABE (2003): "Asian Pyramid Power,"
Wi/mott Magazine.
HAYKOV, J. M. (1993): "A Better Control Variate for Pricing Stan-
dard Asian Options," Journal of Financial Engineering, 2(3),
207-216.
HEENK, B. A., A. G. Z. KEMNA, AND A. C. F. VORST (1990):
"Asian Options on Oil Spreads," Review of Futures Markets, 9,
510-528.
HENDERSON, V , AND R. WOJAKOWSKI (2001): "On the Equivalence of
Floating and Fixed-Strike Asian Options," Journal of Finance, 52(3),
923-973.BIBLIOGRAPHY 511
HESTON, S., AND G. ZHOU (2000): "On the Rate of Convergence
of Discrete-Time Contingent Claims," Mathematical Finance,
10,53-75.
HEYNEN, R. C., AND H. M. KAT (1994a): "Crossing Barriers," Risk
Magazine, 7.
— (1994b): "Partial Barrier Options," Journal of Financial Engineer-
ing, 3,253-274.
(1994c): "Selective Memory," Risk Magazine, 7(11).
— (1996a): "Brick by Brick," Risk Magazine, 9(6).
(1996b): "Discrete Partial Barrier Options with a Moving Barrier,"
Journal of Financial Engineering,5(3), 199-210.
— (1996c): "Pricing and Hedging Power Options," Financial Engi-
neering and Japanese Markets,3,253-261.
HIGGINS, L. R. (1902): The Put-and-Call. (London: E. Wilson).
Ho, T. S. Y., AND S.-B. LEE (1986): "Term Structure Movements and
Pricing Interest Rate Contingent Claims," Journal of Finance, 41,
1011-29.
HODGES, S. D., AND M. J. P. SELBY (1987): "On the Evaluation of
Compound Options," Management Science, 33(3), 347-355.
HODGES, S. D., AND R. G. TOMPKINS (2002): "Volatility Cones and Their
Sampling Properties," Journal of Derivatives, Fall.
HOGGARD, T., A. E. WHALLEY, AND P. WiLmoTT (1994): "Hedging
Option Portfolios in the Presence of Transaction Costs," Advances
in Futures and Options Research, 7,21-35.
Hui, C. H. (1996): "One-Touch Barrier Binary Option Values," Applied
Financial Economics, 6,343-346.
— (1997): "Time-Dependent Barrier Option Values," Journal of
Futures Markets, 17,667-688.
HULL, J. (2005): Option, Futures, and Other Derivatives, 6th ed. (Upper
Saddle River, NJ: Prentice Hall).
HULL, J.,AND A. WHITE (1987): "The Pricing of Options on Assets with
Stochastic Volatilities," Journal of Finance,XLII(2), 281-300.
(1988): "An Analysis of the Bias in Option Pricing Caused
by a Stochastic Volatility," Advances in Futures and Options
Research, 2.
— (1990a): "Pricing Interest Rate Derivative Securities," Review of
Financial Studies, 3(4), 573-92.512 BIBLIOGRAPHY
— (1990b): "Valuing Derivative Securities Using the Explicit Finite
Difference Method," Journal of Financial and Quantitative Analy-
sis, 25(1), 87-100.
(1992): "In the Common Interest," Risk Magazine, 5(3).
— (1993): "Efficient Procedures for Valuing European and American
Path-Dependent Options," Journal of Derivatives, 1,21-31.
IKEDA, M., AND N. KUINTOMO (1992): "Pricing Options with Curved
Boundaries," Mathematical Finance, 2,275-298.
JACKEL, P. (2002): Monte Carlo Methods in Finance (New York: John
Wiley & Sons).
JACKWERTH, J. C., AND M. RUBINSTEIN (1996): "Recovering Proba-
bility Distributions from Option Prices," Journal of Finance, 51,
1611-1631.
JAMES, P. (2003): Option Theory (New York: John Wiley & Sons).
JAMSHIDIAN, F. (1989): "An Exact Bond Option Formula," Journal of
Finance, 44,205-9.
— (1991): "Forward Induction and Construction of Yield Curve
Diffusion Models," Journal of Fixed Income, pp. 62-74.
— (1996): "Sorting Out Swaptions," Risk Magazine, 9(3).
JARROW, R., AND A. RUDD (1982): "Approximate Option Valuation for
Arbitrary Stochastic Processes," Journal of Financial Economics,
10,347-369.
— (1983): Option Pricing (Chicago: Irwin).
JARROW, R., AND S. TURNBULL (1996): Derivatives Securities. South
Western College Publishing.
JACKSON, M. and J. STAUNTON (2001): Advanced Modelling in Finance
Using Excel and VBA (New York: John Wiley & Sons).
JAVAHERI, A. (2005): Inside Volatility Arbitrage: The Secrets of Skew-
ness (New York: John Wiley & Sons).
JENNERGREN, L. P., AND B. NASLUND (1993): "A Comment on Valuation
of Executive Stock Options and the FASB Proposal," The Accounting
Review, 68(1), 179-183.
JENSEN, M. (1965): "The Performance of Mutual Funds in the Period
1945-1964," Journal of Finance,May, 389-415.
JOHNSON, H. (1987): "Options on the Maximum or the Minimum of
Several Assets," Journal of Financial and Quantitative Analysis,
22(3), 277-283.
JURCZENKO, E., B. MAILLET, AND B. NEGREA (2004): "A Note
on Skewness and Kurtosis Adjusted Option Pricing ModelsBIBLIOGRAPHY 513
under the Martingale Restriction," Quantitative Finance, 4(5),
479-488.
KABANOV, Y. M., AND M. M. SAFARIAN (1997): "On Leland's Strategy of
Option Pricing with Transactions Costs," Finance and Stochastics,
1(2).
KAT, H., AND L. VERDONK (1995): "Tree Surgery," Risk Magazine, 8(2).
KEMNA, A., AND A. VORST (1990): "A Pricing Method for Options Based
on Average Asset Values," Journal of Banking and Finance, 14,
113-129.
KEYNES, J. M. (1924): A Tract on Monetary Reform. Reprinted 2000.
(Amherst, NY: Prometheus Books).
KIRIKOS, G., AND D. NOVAK (1997): "Convexity Conundrums," Risk
Magazine, March, 60-61.
KIRK, E. (1995): "Correlation in the Energy Markets," in Managing
Energy Price Risk. Risk Publications and Enron.
KNIGHT, J., AND S. SATCHELL (2001): Return Distributions in Finance,
Chap. 9 (Burlington, MA: Butterworth-Heinemann).
KUNITOMO, N. (1992): "Improving the Parkinson Method of
Estimating Security Price Volatilities," Journal of Business,
65,295-302.
LAGRANGE, J. L. (1795): Lecons elementaires sur les mat hematiques.
LEISEN, D. P. J., AND M. REIMER (1996): "Binomial Models for Option
Valuation Examining and Improving Convergence," Applied Math-
ematical Finance, 3,319-346.
LELAND, H. (1985): "Option Pricing and Replication with Transactions
Costs," Journal of Finance,XL(5), 1283-1301.
LEVY, E. (1992): "Pricing European Average Rate Currency Options,"
Journal of International Money and Finance, 11,474-491.
(1997): "Asian Options," in Exotic Options: The State of the Art,
ed. L. Clewlow and C. Strickland (Washington, DC: International
Thomson Business Press).
LEVY, E., AND S. TURNBULL (1992): "Average Intelligence," Risk
Magazine, 5(2).
LEWIS, A. (2000): Option Valuation under Stochastic Volatility (New-
port Beach, CA: Finance Press).
LHABITANT, F. (2004): "Hedge Funds Quantitative Insight" (New York:
John Wiley & Sons).
LIAO, S.-L., AND C.-W. WANG (2003): "The Valuation of Reset Options
with Multiple Strike Resets and Reset Dates," The Journal of
Futures Markets, 23(1), 87-107.514 BIBLIOGRAPHY
LIEU, D. (1990): "Option Pricing with Futures-Style Margining,"
Journal of Futures Markets, 10,327-328.
LINDSET, S., AND S.-A. PERSSON (2006): "A Note On a Barrier Exchange
Option: The World's Simplest Option Formula?," Financial Research
Letters, 3.
LINETSKY, V. (2004): "Spectral Expansions for Asian (Average Price)
Options," Operations Research.
Lo, A. (2002): "The Statistics of Sharpe Ratios," Financial Analyst
Journal,58,36-52.
Lo, A., AND J. WANG (1995): "Implementing Option Pricing when Asset
Returns Are Predictable," Journal of Finance,50,87-129.
LONGSTAFF, F. A. (1990): "Pricing Options with Extendible Maturities:
Analysis and Applications," Journal of Finance,45(3), 935-957.
(1995): "Option Pricing and the Martingale Restriction," Review
of Financial Studies, 8,1091-1124.
LONGSTAFF, F. A., P. SANTA-CLARE, AND E. SCHWARTZ (2000): "The Rel-
ative Valuation of Caps and Swaptions: Theoretical and Empirical
Evidence," Working paper.
MANASTER, S., AND G. KOEHLER (1982): "The Calculation of Implied
Variances from the Black-Scholes Model," Journal of Finance,37(1),
227-230.
MANZANO, J. (2001): "Mirror Options," Wilmott Magazine, October,
www.wilmott.com.
MARGRABE, W. (1978): "The Value of an Option to Exchange One Asset
for Another," Journal of Finance,33(1), 177-186.
MARSH, T. A., AND E. R. ROSENFIELD (1986): "Non-Trading, Mar-
ket Making, and Estimates of Stock Price Volatility," Journal of
Financial Economics, 15,359-372.
MCDONALD, R. L. (2002): Derivatives Markets (Upper Saddle River,
NJ: Addison-Wesley).
MCKEAN, H. P (1965): "A Free Boundary Problem For The Heat
Equation Arising From A Problem in Mathematical Economics,"
Industrial Management Review, 6(2), 32-39.
METER, S. (2000): "Implementing the Broadie-Glasserman Approach
for Pricing Multi-Asset American Options Using Monte Carlo
Simulation," Semesterarbeit, University of Zurich.
MELLO, A. S., AND H. J. NEUHAUS (1998): "A Portfolio Approach to Risk
Reduction in Discretely Rebalanced Option Hedges," Management
Science, 44(7), 921-934.BIBLIOGRAPHY 515
MERTON, R. C. (1971): "Optimum Consumption and Portfolio Rules
in a Continuous-Time Model," Journal of Economic Theory, 3,
373-413.
(1973): "Theory of Rational Option Pricing," Bell Journal of
Economics and Management Science, 4,141-183.
— (1976): "Option Pricing When Underlying Stock Returns Are
Discontinuous," Journal of Financial Economics,3,125-144.
MILTERSEN, K., K. SANDMANN, AND D. SONDERMANN (1997): "Closed
Form Solutions for Term Structure Derivatives with Log-Normal
Interest Rates," Journal of Finance, 52(1).
MILTERSEN, K., AND E. S. SCHWARTZ (1998): "Pricing of Options on Com-
modity Futures with Stochastic Term Structures of Convenience
Yields and Interest Rates," Journal of Financial and Quantitative
Analysis, 33(1).
MITCHELL, WESLEY, C. (1915): "The Making and Using of Index Num-
bers," Introduction to Index Numbers and Wholesale Prices in the
United States and Foreign Countries(published in 1915 as Bulletin
No. 173 of the U.S. Bureau of Labor Statistics, reprinted in 1921 as
Bulletin No. 284, and in 1938 as Bulletin No. 656).
MORO, B. (1995): "The Full Monte," Risk Magazine, February.
NELKEN, I. (1993): "Square Deals," Risk Magazine, 6(4).
NELSON, D. B. (1990): "ARCH Models as Diffusion Approximations,"
Journal of Econometrics, 45,7-38.
NELSON, S. A. (1904): The A B C of Options and Arbitrage. (New York:
The Wall Street Library).
NEUBERGER, A. (1994): "The Log Contract: A New Instrument
to Hedge Volatility," Journal of Portfolio Management, Winter,
74-80.
(1996): "The Log Contract and Other Power Contracts," in The
Handbook of Exotic Options, ed. I. Nelken, Winter, 200-212.
PARKINSON, M. (1980): "The Extreme Value Method for Estimating
the Variance of the Rate of Return," Journal of Business, 53(1),
61-65.
PEARSON, N. D. (1995): "An Efficient Approach for Pricing Spread
Options," Journal of Derivatives, 3,76-91.
PECHTL, A. (1995): "Classified Information," Risk Magazine, 8.
PESKIR, G., AND A. N. SHIRYAEV (2001): "A Note on the Put-Call Parity
and a Put-Call Duality," Theory of Probability and its Applications,
46,181-183.516 BIBLIOGRAPHY
PIETERBARG, V. V , AND M. A. RENEDO (2004): "Eurodollar Futures
Convexity Adjustments in Stochastic Volatility Models," Working
paper.
PILIPOVIC, D. (1997): Energy Risk (New York: McGraw-Hill).
PRESS, W. H., S. TEUKOLSKY, W. VETTERLING, AND B. P. FLANNERY (1992):
Numerical Recipies in Fortran 77: The Art of Scientific Computing,
2nd ed. (Cambridge, UK: Cambridge University Press).
RANDALL, C., AND D. TAVELLA (2000): Pricing Financial Instruments
the Finite Difference Method (New York: John Wiley & Sons).
RAO, C. R. (1973): "Distributions of Correlation Coefficient," in Linear
Statistical Inference and Its Applications, 2nd ed. (New York: John
Wiley & Sons), pp. 206-208.
RAY, C. (1993): The Bond Market: Trading and Risk Management (New
York: McGraw-Hill).
REBONATO, R. (1996): Interest-Rate Option Models (New York: John
Wiley & Sons).
— (2004): Volatility and Correlation: The Perfect Hedger and the Fox
(New York: John Wiley & Sons).
REIDER, R. (1993): "An Efficient Monte Carlo Techniques for Pricing
Options," Working paper, Wharton, University of Pennsylvania.
REIMER, M., AND M. SANDEMANN (1995): "A Discrete Time Approach for
European and American Barrier Options," Working paper.
REINER, E. (1992): "Quanto Mechanics," Risk Magazine, 5,59-63.
REINER, E., AND M. RUBINSTEIN (1991a): "Breaking Down the Barriers,"
Risk Magazine, 4(8).
(1991b): "Unscrambling the Binary Code," Risk Magazine, 4(9).
REISMANN, H. (1992): "Movements of the Term Structure of Commodity
Futures and Pricing of Commodity Claims," Working paper, Faculty
of I. E. and Management, Technion-Israel Institute of Technology,
Israel.
RENDLEMAN, R. J., AND B. J. BARTTER (1979): "Two-State Option
Pricing," Journal of Finance,34,1093-1110.
(1980): "The Pricing of Options on Debt Securities," Journal of
Financial and Quantitative Analysis, 15,11-24.
RICH, D. R. (1994): "The Mathematical Foundation of Barrier Option-
Pricing Theory," Advances in Futures and Options Research, 7,
267-311.BIBLIOGRAPHY 517
RICH, D. R., AND D. M. CHANCE (1993): "An Alternative Approach to
the Pricing of Options on Multiple Assets," Journal of Financial
Engineering, 2(3), 271-285.
RITCHKEN, P. (1995): "On Pricing Barrier Options," Journal of Deriva-
tives, 3,19-28.
RITCHKEN, P., AND R. TREVOR (1997): "Pricing Options under Gener-
alized GARCH and Stochastic Volatility Processes," CMBF Papers,
19, www.mafc.mq.edu.au/MAFCpapers/papers.htm.
ROGERS, L. C. G., AND S. E. SATCHELL (1991): "Estimating Variance from
High, Low, and Closing Prices," The Annals of Applied Probability,
1,504-512.
ROLL, R. (1977): "An Analytic Valuation Formula for Unprotected
American Call Options on Stocks with Known Dividends," Journal
of Financial Economics, 5,251-58.
RUBINSTEIN, M. (1990): "The Super Trust," Working paper,
www.in-the-money.com .
— (1991a): "Double Trouble," Risk Magazine, 5(1).
— (1991b): "One for Another," Risk Magazine, 4(7).
— (1991c): "Options for the Undecided," Risk Magazine, 4(4).
(1991d): "Somewhere over the Rainbow," Risk Magazine, 4(10).
— (1994a): "Implied Binomial Trees," Journal of Finance, 49,771–
818.
(1994b): "Return to OZ,"Risk Magazine, 7(11).
(1995a): "As Simple as One, Two, Three," Risk Magazine, 8(1).
(1995b): "SuperShares," Chap. 19 in The Handbook of Equity
Derivatives, ed. J.C. Francis (New York: John Wiley & Sons).
RUBINSTEIN, M. (1998): "Edgeworth Binomial Trees," Journal of
Derivatives, XIX, 20-27.
SAMUELSON, P. (1965): "Rational Theory of Warrant Pricing," Indus-
trial Management Review, 6,13-31.
SCHAEFER, S., AND E. SCHWARTZ (1987): "Time Dependent Vari-
ance and the Pricing of Bond Options," Journal of Finance, 42,
1113-28.
SCHNABEL, J. A., AND J. Z. WET (1994): "Valuing Takover-Contingent
Foreign Exchange Call Options," Advances in Futures and Options
Research, 7,223-236.518 BIBLIOGRAPHY
SCHWARTZ, E. S. (1997): "The Stochastic Behavior of Commod-
ity Prices: Implications for Valuation and Hedging," Finance
working paper 1-97, The John E. Anderson Graduate School of
Management at UCLA, Los Angeles, Journal of Finance, 52(3),
923-973 (July 1997).
SHARPE, W. (1966): "Mutual Fund Performance," Journal of Business,
119-138.
SHAW, W (1998): Modelling Financial Derivatives (Cambridge, UK:
Cambridge University Press).
SHILLING, H. (2001): "No-Arbitrage Bounds and Static Hedging of
Compound Options," Working paper, Commerzbank
SHIMKO, D. (1994): "Options on Futures Spreads: Hedging, Spec-
ulation, and Valuation," The Journal of Futures Markets, 14(2),
183-213.
SMITH, JR., C. W. (1976): "Option Pricing: A Review," Journal of
Financial Economics, 3,3-51.
SMITH, D. R. (1991): "A Simple Method for Pricing Interest Rate
Swaptions," Financial Analysts Journal,May—June, 72-76.
SOBOL, I. M. (1967): "On the Distribution of Points in a Cube
and the Approximate Evaluation of Integrales," USSR Journal of
Computational Mathematics and Mathematical Physics (English
Translation), 7,784-802.
SORTINO, F., AND L. PRICE (1994): "Performance Measurment in a
Downside Risk Framework," The Journal of Investing, 59-65.
SPRENKLE, C. (1964): "Warrant Prices as Indicators of Expectations
and Preferences" in The Random Character of Stock Market Prices,
ed. P. Cootner (Cambridge, MA: MIT Press).
STULZ, R. M. (1982): "Options on the Minimum or the Maximum of
Two Risky Assets," Journal of Financial Economics, 10,161-185.
Su, Y., AND M. Fu (2000): "Optimal Importance Sampling in Securities
Pricing," Working paper, Robert H. Smith School of Business.
TALEB, N. (1997): Dynamic Hedging (New York: John Wiley & Sons).
THORP, E. 0. (1969): "Optimal Gambling Systems for Favorable
Games," Review of the International Statistics Institute, 37(3).
THORP, E. 0., AND S. T. KASSOUF (1967): Beat the Market. (New York:
Random House).
TOPPER, J. (2005): "Financial Engineering with Finite Elements" (New
York: John Wiley & Sons).BIBLIOGRAPHY 519
TREYNOR, J. (1965): "How to Rate Management of Investment Funds,"
Harvard Business Review, 43,63-75.
TURNBULL, S. M., AND L. M. WAKEMAN (1991): "A Quick Algorithm
for Pricing European Average Options," Journal of Financial and
Quantitative Analysis, 26,377-389.
VASICEK, 0. (1977): "An Equilibrium Characterization of the Term
Structure," Journal of Financial Economics, 5,177-88.
VILLIGER, R. (2005): "Valuation of American Call Options," Wilmott
Magazine.
WEBB, A. (1999): "The Sensitivity of Vega," Derivatives Strategy,
November, 16-19.
WEST, G. (2005a): "Calibration of the SABR Model in illiquid Markets,"
Applied Mathematical Finance, 12(4), 371-385.
— (2005b): "Better Approximations to Cumulative Normal Func-
tions," Wilmott Magazine.
WHALEY, R. E. (1981): "On the Valuation of American Call Options on
Stocks with Known Dividends," Journal of Financial Economics, 9,
207-11.
WILCOX, D. (1991): "Spread Options Enchance Risk Managment
Choices," NYMEX Energy in the News, Fall, 9-13.
WiLmoTT, P. (1998): Paul Wilmott Derivatives (New York: John Wiley
& Sons).
— (2000): Paul Wilmott on Quantitative Finance (New York: John
Wiley & Sons).
WILMOTT, P., J. DEWYNNE, AND S. HOWISON (1993): Option Pric-
ing: Mathematical Models and Computation (Oxford, UK: Oxford
Financial Press).
Wu, X., AND J. E. ZHANG (1999): "Options on the Minimum or the
Maximum of Two Average Prices," Review of Derivatives Research,
(2), 183-204.
WYSTRUP, U. (1999): "Aspects of Symmetry and Duality of the Black-
Scholes Pricing Formula for European Style Put and Call Options,"
Working paper, Sal. Oppenhim jr. & Cie.
— (2002): "Vanilla Options," in Foreign Exchange Risk, J. Hakala and
U. Wystrup (London: Risk Books).
ZHANG, P. (1994): "Flexible Asian Options," Journal of Financial
Engineering, 3(1), 65-83.520 BIBLIOGRAPHY
(1995a): "Correlation Digital Options," Journal of Financial
Engineering, 4,75-96.
(1995b): "Flexible Arithmetic Asian Options," Journal of Deriva-
tives, 2(3), 53-63.
(1998): Exotic Options: A Guide to the Second Generation Options,
2nd ed. (Singapore: World Scientific).INDEX
Page numbers followed by n indicate footnotes.
Aase, K. K., 11,109n, 255n
Abromowitz, M., 468
Acar, E., 463
Adamchuk, A., 11,12,40,53
Agca, S., 471
Alexander, C., 450
Allen, S., 460
Alternative stochastic processes,
242-273
constant elasticity of variance,
242-244
jump-diffusion models, 253-258
skewness kurtosis models, 244-253
stochastic volatility models, 258-271
Alternative trinomial tree, 302-303
American Asian options, in trees, 314
American barrier options, 154-155
American option Monte Carlo, 364-366
American options, 97-110
Barone-Adesi and Whaley
approximation, 97-101
benchmark model for discrete cash
dividend, 382,385-387
Bjerksund and Stensland 1993
approximation, 101-104
Bjerksund and Stensland 2002
approximation, 104-108
closed-form call, with discrete
dividend yield, 390-393
exchange-one-asset-for-another
options, 208
perpetual, 108-110
put-call transformation, 108
American perpetual options, 108-110
Amin, K. I., 255n, 406n
Annual volatility
conversion to daily volatility, 450-451
(See also Historical volatility)
Annuities, 491
Antithetic variance reduction, 358
Arbitrage, Roll, Geske, and Whaley
model, 377-378
Arctangent rule, 463
Arithmetic average-rate option:,
186-192
Asian futures options, 189-190
discrete, 192-199
Levy's approximation, 190-192
Turnbull and Wakeman
approximation, 186-189
Arrow-Debreu price tree, 322-323,324,
325,328,330
Asay, M. R., 5,8,10,90
Asian options, 182-202
American, in trees, 314
arithmetic average-rate, 186-192
discrete arithmetic average-rate,
192-199
floating-strike and fixed-strike,
equivalence of, 199
geometric average-rate, 182-186
with volatility term-structure,
199-202
Asset-or-nothing options, 175
Asset prices
close, historical volatility calculation
from, 445-447
confidence interval for, 459
price volatility of money market
futures, 421
(See also Bond prices)
At-the-money—at-the-money
approximate compound
option, 137
521522 INDEX
At-the-money forward approximations,
84-85
Greeks, 84-85
implied volatility, 456
At-the-money forward value symmetry,
for BSM formula, 10
Average-rate options
arithmetic, 186-192
geometric, 182-186
Averages, options on minimum or
maximum of, 224-226
Bachelier, L., 12
Bachelier model, 12-13
modified, 13
Backus, D., 252
Ball, C. A., 255
Bardhan, I., 292, 295, 308
Barle, S., 321
Barone-Adesi, G., 97, 99, 104
Barone-Adesi and Whaley
approximation, 97-101
Barrier options
Brownian bridge probabilities,
305-307
reset, 312
reset strike, 310-312
Barrier symmetries, 168-173
double-barrier option using, 171-172
dual-double-barrier options, 172-173
first-then-barrier options, 169-170
Bartter, B. J., 279, 289, 309, 429
Basis, FRAs, 413
Basis point value (BPV), 417
Basket volatility, 460
Bates, D. S., 9, 10, 45, 255, 256
Bates generalized jump-diffusion model,
255-258
Beckers, S., 44n
Benchmark model of Haug, Haug, and
Lewis, 378-390
American call and put options,
385-387
European call and put options,
382-385
exotic and real options, 389-390
multiple dividend approximation,
387-389
multiple dividends, 382
single dividend, 372-382
Beneder, R., 369, 375, 377
Bensoussan, A., 37n, 136
Berdhan, I., 464
Bergier, A., 292, 295
Bermin, H. P., 148, 163, 217
Best or worst cash-or-nothing options,
223-224
Beta, 37
Bhagavatula, R. S., 156n
Binary options, 174-182
asset-or-nothing, 175
barrier, 176-180
cash-or-nothing, 174-175
double-barrier, 180-182
double-barrier asymmetrical,
181-182
gap, 174
supershare, 176
Binomial option pricing, 279-343
convertible bonds in binomial trees,
292-297
Cox-Ross-Rubenstein American
binomial tree, 284-289, 307-308
generalized European binomial,
282-284
implied binomial trees, 320-332
Leisen-Reimer binomial tree, 290-292
Rendleman Bartter binomial tree,
289-290
skewness and kurtosis, 297-299
Bisection method, implied volatility,
455-456
Bivariate normal density function,
470-481
cumulative, 470-481
Bivariate normal distribution function,
cumulative, 469-470
Bjerksund, P., 101, 104, 108, 208,
213n, 440
Bjerksund and Stensland 1993
approximation, 101-104
Bjerksund and Stensland 2002
approximation, 104-108
Black, F., 1, 2, 4, 5, 13, 17, 18, 37, 76, 90,
170, 213, 309, 368, 375, 386,
390, 434
Black-Derman-Toy (BDT) model,
434-443
yield-only, 434-443
Black-76 model
bond yield volatility, 428
caps and floors, 421-422
commodity futures, 409-410
convexity adjustments, 425-427
European short-term bond options,
427-428INDEX 523
interest rate options, 419-429
money market future options,
420-421
Schaefer and Schwartz modification,
428-429
swaptions, 422-425
Black-Scholes-Merton (BSM) formula,
1-16,233-282
alternatives, 242-282
at-the-money approximation, 84
at-the-money forward value
symmetry for, 10
currency options, 6-7
delayed settlement, 234
discrete hedging, 236-239
escrowed dividend model adjustment,
367-368
forward or futures contracts, 4-5
generalized, 7-9
Ito's lemma and, 15-16
margined options on futures, 5-6
option sensitivities for (see Greeks)
PDE behind, 3-4,15-18
precursors, 12-14
put-call parity for European options,
9-10
put-call supersymmetry, 11
put-call symmetry, 10-11
stock index options, 4
trading day volatility adjustment, 235
trending market adjustment, 240-242
with variance, 11-12
volatility adjustment for skewness
and kurtosis, 252
Black-76F model, 400-401,409-411
Black's method, for calls on stocks with
known dividends, 375
Bleed-offset volatility, 68
Bond options, European, short-term,
427-428
Bond prices
dirty and clean, 417
Ho and Lee model, 432-433
Hull and White model, 433-434
Vasicek model, 430-432
yield related to, 418-419
Bonds
coupon, Jamshidian's approach,
431-432
implied volatility from convexity
value, 427
yield volatility, 428
Boness, A., 14
Boness model, 14
Bos, M., 371,383
Bos, R., 370,372,383
Bos-Gairat-Shepeleva volatility
adjustment, 370-371
Bos-Vandermark method, 371-372
Bouaziz, L., 195n
Bowie, J., 10,45,167
Box-Muller method, 356,363
Boyle, P., 359
Boyle, P. M., 364
Boyle, P. P., 211,213n, 299,308,
315n, 345
BPV (basis point value), 417
Breeden, D. I, 80
Brennan, M. J., 334
Brenner, M., 84,243,456
Briys, E., 195n
Broadie, M., 164,165,312,359,364
Brockhaus, 0., 118,122,223,274,311
Brotherton-Ratcliffe, R., 426,426n
Brown, C., 247
Brownian bridge probabilities, barrier
options, 305-307
BSM formula [see Black-Scholes-Merton
(BSM) formula]
Buchen, P., 321
Burghardt, G., 416,452
Burke, G., 495
Burke ratio, 495
Cakici, N., 320
Caks, J., 492
Callable options, Monte Carlo
simulation, 349-351
Call on call options, 132
Call on put options, 133
Capital asset pricing model (CAPM), 37
CAPM (capital asset pricing model), 37
Capped power options, 117-118
Caps, interest rate, 421-422
Carr, P., 10,45,155,167,209,272
Carry rho, 73-75
Cash-or-nothing options
best or worst, 223-224
single-asset, 174-175
two-asset, 221-224
CEV [see Constant elasticity of variance
(CEV) model]
Chalasani, P., 314
Chance, D. M., 211,471
Charm, 22,35-36
Cheuk, T. H. F., 300n524 INDEX
Cho, H. Y., 314,315n
Cholesky decomposition, 353-354
Chooser options, 128-132
complex, 128-132
simple, 128-129
Chriss, N., 286,321,327,369,383
Clean bond prices, 417
Clewelow, L., 315
Closed-form American calls, 390-393
Closed-form approximations, Greeks
from, 89
Close prices, historical volatility
calculation from, 445-447
Colour, 23,49-50
Commodity futures
Black-76 model, 409-410
Black-76F model, 409-410
Miltersen-Schwartz model, 406-410
Commodity options
mean reversion model, 410
seasonality, 411
Compound option approximation,
136-137
Confidence intervals
for asset price, 459-460
for volatility estimate, 451-452
Confidence ratio, 494-495
Constant elasticity of variance (CEV)
model, 242-244
for futures and forwards, 243-244
Continuous compounding, 491
Conversion probabilities, 293-297
Convexity adjustment
interest rate swaps, 425-427
money market futures, 415-417
Conze, A., 143
Corrado, C. J., 247,252,457
Corrado and Su skewness and kurtosis
model, 247-250
modified, 250-251
Correlation, historical, 460-462
Correlation options, two-asset, 205-206
Cortazar, G., 406n
Cosinus option, 283,284
Cost of carry
at-the-money approximation, 85
partial derivative, 94
Coupon bonds, Jamshidian's approach,
432
Cox, J. C., 175,176n, 242,243,279,281,
309,322,332
Cox-Ross-Rubenstein American
binomial tree, 284-289
barrier options, 307-308
Greeks, 287-289
local volatility, 286
negative probabilities, 286-287
number of nodes, 286
Crack, T. F., 119
Crank-Nicolson method, 342-344
Crouhy, M., 37n, 136
CRR (see Cox-Ross-Rubenstein
American binomial tree)
Cubic interpolation, 488
Cubic-spline interpolation, 488-490
Cumulative bivariate normal density
function, 470-481
Drezner 1978 algorithm, 471,476
Drezner and Wesolowsky 1990
algorithm, 476-477
Genz 2004 algorithm, 477-480
table values, 480
Cumulative normal distribution
function, 465-469
Hart algorithm, 465-467
inverse, 469-470
polynomial approximations, 467-469
trivariate, 480-486
Curran, M., 195,196,347
Curran's approximation, 195-199
Currency forwards, FRAs related to,
414-415
Currency options
BSM formula for, 6-7
implied correlation from, 462
Currency-translated options, 226-232
equity linked foreign exchange
options, 230-232
fixed exchange rate foreign equity
options, 228-230
foreign equity options struck in
domestic currency, 226-228
takeover foreign exchange options,
232
Current yield, 417
Dai, M., 126,155
Dai, T., 315
Daily volatility, 450-451
DdeltaDtime, 22,35-36
DdeltaDvar, 24,63
DdeltaDvol, 22,32-34
Delayed settlement, Black-Scholes-
Merton formula adjustment
for, 234
Delta, 21,22,26-38,91INDEX 525
at-the-money approximation, 84
behavior, 28-29
call (spot), 21,22
DdeltaDtime (charm), 22,35-36
DdeltaDvol, 22,32-34
DvannaDvol, 22,34
DvegaDspot, 22,32-34
elasticity, 22,36-38
energy swaption, 402
futures delta from spot delta, 31
mirror strikes and assets, 29-30
option beta, 37
option volatility, 37
partial derivative, 91
put (spot), 21,22
Sharpe ratios, 38
strike from, 30-31
vega from, 56
Demeterfi, K., 119,272,274
Derman,E., 1, 17, 119, 167n,203,228,
236,272,274,292,295,308,321,
322,327,334,434
Derman-Kani implied binomial model,
building new levels of tree, 323
Derman-Taleb method, 17-18
DeRosa, D., 7
Dewynne, J., 373n
DgammaDspot, 23,47-49
DgammaDtime, 23,49-50
DgammaDvol, 22,45-47
DgammaPDspot, 47-49
DgammaPDtime, 49-50
DgammaPDvol, 45-47
Differentiation rules, 496
Dirty bond prices, 417
Discrete arithmetic average-rate options
Curran's approximation, 195-199
discrete Asian approximation,
192-195
Discrete Asian approximation, 192-195
Discrete-barrier options
single-asset, 164-165
two-asset, 221
Discrete cash dividend, stocks paying
(see Benchmark model of Haug,
Haug, and Lewis; Stocks paying
discrete dividends, options on)
Discrete dividend yield, stocks with (see
Stocks with discrete dividend
yield, options on)
Discrete hedging, Black-Scholes-Merton
formula adjustment for, 236-239
Dividend, discrete, stocks paying (see
Benchmark model of Haug, Haug,
and Lewis; Stocks paying discrete
dividends, options on)
Dividend policy, benchmark model for
discrete cash dividend, 379-380
Dividend yield, discrete (see Stocks with
discrete dividend yield,
options on)
Dosembet, C., 292,295
Double-barrier binary asymmetrical
options, 181-182
Double-barrier options, 156-160,
180-182
asymmetrical, 181-182
double-barrier asymmetrical, 181-182
dual, 172-173
using barrier symmetries, 171-172
Draper, H., 64n
Dravid, A., 228
Drezner, Z., 470,471,476,477
Drezner 1978 algorithm, 471,476
Drezner and Wesolowsky 1990
algorithm, 476-477
Driftless theta, 24,66-68
Dual-double-barrier options, 172-173
Dumas, B., 464
Dupire, B., 321
Duration, modified, 417
DvannaDvol, 22,34
DvegaDspot, 22,32-34
DvegaDtime, 23,61-62
DvegaDvol, 23,57-60,58
DvommaDvol, 23,60
Dynamic hedging
Derman-Taleb method for, 17-18
DzetaDtime, 25,80
DzetaDvol, 25,79
Edgeworth expansion, 297-298
Egriboyun, F., 314
Electricity swaps/forwards, 397-406
Ellis, K., 167
Energy options, 400-406
Black-76F model, 400-401
on energy swaps, 401-406
Energy swaps/forwards, 397-406
Energy swaptions, 401-405
Greeks, 404-405
hybrid payoff, 405-406
put-call parity, 404
Engle, R. F., 275526 INDEX
Equity linked foreign equity options,
230-232
Ergener, D., 167n, 308
Escrowed dividend model, 367-368
Esser, A., 116,117,118
European binomial, two-asset, 319-320
European bond options
Ho and Lee model, 432-433
Hull and White model, 433-434
short-term bond options, 427-428
Vasicek model, 430-431
European options
benchmark model for discrete cash
dividend, 382-390
bond, 427-428,430-434
with discrete dividend yield, 390
European options on stock with discrete
cash dividend, 368-372
Bos-Gairat-Shepeleva volatility
adjustment, 370-371
Bos-Vandermark method, 371-372
escrowed dividend model, 367-368
Haug-Haug volatility adjustment,
369-370
simple volatility adjustment, 369
European reset options binomial,
308-313
reset barrier options, 312
reset strike barrier options, 310-311
reset strike options, 309-314
reset time options, 312-313
European short-term bond options,
427-428
Evnine, J., 211
Excel random-number generator, 357
Excess kurtosis, 245
Exchange-one-asset-for-another options,
206-208
American, 208
Exchange options on exchange options,
209-211
Executive stock options, 114
Exotic options
benchmark model for discrete cash
dividend, 389-390
single asset, 111-202
in tree models, 303-314
in two assets, 203-232
Explicit finite difference, 331-343
Exponential interpolation, 487-488
Exponential weighted historical
volatility, 449-450
Extended moneyness approximation,
implied volatility, 457
Extendible options, 138-141
holder-extendible, 138-140
writer-extendible, 138-140
Extreme-spread lookback options,
148-150
reverse, 149
Eydeland, A., 195n, 410
Fade-in options, 122-123
Farkas, M., 223
"Fat tails," 245
Faure, H., 362
Feinstein, S., 456
Ferraris, A., 118,122,223,311
Figlewski, S., 314
Finite difference methods, 334-343
Crank-Nicolson, 341-343
explicit finite difference, 334-343
finite difference in (S), 340-341
implicit finite difference, 338-340
First-order Greeks, 85-86
First-then-barrier options, 169-170
Fisher kurtosis, 244-245
Fixed exchange rate foreign equity
options, 228-230
Fixed-strike lookback options, 143-144
partial-time, 144-446
Fixed-strike options, equivalence with
floating-strike options, 199
Flannery, B. P., 268
Flesaker, B., 416
Floating-strike lookback options,
141-143
partial-time, 144-146
Floating-strike options
equivalence with fixed-strike options,
199
lookback, 141-143,144-146
Floors, interest rate, 421-422
Foreign equity options
equity linked, 230-232
fixed exchange rate, 228-230
struck in domestic currency, 226-228
takeover, equity linked, 232
Foresi, S., 252
Forth moment, 257
Forward approximations, at-the-money,
84-85,456
Forward rate agreements (FRAs),
413-415INDEX 527
from cash deposits, 413-414
currency forwards related to, 414-415
Forwards
BSM formula, 4
constant elasticity of variance model
for, 243-244
currency, FRAs related to, 414-415
energy, 397-400
start options, 121-122
Forward value symmetry, at-the-money,
for BSM formula, 10
Forward volatility, implied, 458
Fouque, J., 48,278
FRAs [see Forward rate agreements
(FRAs)]
French, D. W., 235
French, K. R., 235n
Frishling, V, 377
Fu, M., 359
Futures
BSM formula, 4
commodity, 406-410
constant elasticity of variance model
for, 243-244
margined, BSM formula for, 5-6
money market, 413-415,418-419
Future value, of annuity, 491
Gairat, A., 370,372,383
Galai, D., 37n, 136
Gallus, C., 118,122,309
Gamma, 22-23,38-50,91-92
at-the-money approximation, 84
DgammaDspot (speed), 23,47-49
DgammaDtime (colour), 23,49-50
DgammaDvol (zomma), 22,45-47
energy swaption, 405
GammaP, 22,42-44
gamma symmetry, 45
maximal, illusions of risk and, 39-42
partial derivative, 91-92
relationship with theta, 68
relationship with vega, 55
saddle point, 40-42
GammaP, 40,42-44
Gamma symmetry, 45
Gao, B., 168,314
Gap options, 174
GARCH volatility swaps, 274-278
Garman, M., 5,6,35,47,49,90,
142n, 448
Gatheral, J., 278
Gatto, M. A., 142
Geman, H., 155,195n
Generalized jump-diffusion model,
255-258
Genz, A., 471,477,478,482
Genz 2004 algorithm, 477-480
Geometric average-rate options,
182-186
continuous, 183
discrete, 183-185
with variable time between fixings,
185-186
Gerber, H. U., 109n
Geske, R., 132,368,375,387
Gibbons, M. R., 235n
Gibbs, S., 211
Gibson, R., 404n
Glasserman, P., 164,165,312,359,
362,364
Goldman, B. M., 142
Grabbe, 0. J., 5
Gram Charlier density, 252
Grandits, P., 239
Gray, S. F., 124,125,309
Greek alphabet, 494
Greeks, 21-95
aggregations, 81-83
at-the-money forward
approximations, 84-85
from closed-form approximations, 89
Cox-Rubenstein American binomial
tree, 287-289
delta, 21,22,26-38,91
energy swaptions, 404-405
gamma, 38-50,91-92
Monte Carlo simulation, 347-349
numerical, 85-89
probability, 75-81
Rendleman Bartter binomial tree,
289-290
rho, 68-75,93
taking partial derivatives and, 90-95
theta, 64-68,95
for two-asset options, 232
variance, 62-63
vega, 50-62,94
volatility-time, 64
Grouhy, M., 195n
Gupta, V, 167
Hagan, P. S., 243,265,266
Hakansson, N. H., 176
Halton, J. H., 362
Halton numbers, 362-363528 INDEX
Handley, J. C., 111, 112
Hansen, A. T., 314n
Hart, I., 165
Hart, J., 465
Hart algorithm, 465-467
Haug, E., 274, 278
Haug, E. G., 11, 12, 17, 18, 21, 55, 56, 82,
83, 154, 155, 168, 169, 171, 172,
184, 192, 200, 219, 243, 252, 287,
300, 308, 309, 367, 369, 373, 375,
376, 378, 381, 398, 402, 406, 452,
458, 462
Haug, J., 184, 192, 200, 219, 308, 309,
367, 369, 371, 373, 375, 376, 378,
381, 458
Haug-Haug-Lewis (HHL) model (see
Benchmark model of Haug, Haug,
and Lewis)
Haug-Haug volatility adjustment,
369-370
Haykov, J. M., 195n
Hedging, dynamic, 16-18
Derman-Taleb method for, 17-18
Hedging error, 236-237
Heenk, B. A., 351n
Heidelberg, P., 359
Henderson, V, 199
Hess, P., 235n
Heston, S., 336
Heynen, R. C., 116, 144, 147, 160, 165,
169, 215, 222
HHL model (see Benchmark model of
Haug, Haug, and Lewis)
Higgins, L. R, 1, 9, 16
High-low-close volatility, 447-448
High-low volatility, 447-448
Historical correlation, 460-462
distribution of correlation coefficient,
460-462
Historical volatility, 445-453
from close prices, 445-447
confidence intervals for estimate,
451-452
conversion of annual volatility to
daily volatility, 450-451
exponential weighted, 449-450
high-low, 447-448
high-low-close, 448-449
volatility cones, 452-453
Ho, T. S. Y., 415, 432
Ho and Lee model, 432-433
Hodges, S. D., 132, 452
Hoggard, T., 239
Holder-extendible options, 138-140
Hoskins, W., 416
Howison, S., 373n
Huang, G., 315
Huang, J., 168
Hui, C. H., 169, 180, 181
Hull, J., 38, 62, 259, 260, 261, 262,
263,264,266,287n,315,335,
415,433
Hull and White model, 433-434
Hull-White stochastic volatility models
correlated, 261-265
uncorrelated, 259-261
Hybrid payoff energy swaptions,
405-406
Iben, B., 426, 426n
Ikeda, M., 156, 158
Implicit finite difference, 338-339
Implied correlation, 462-463
average implied index correlation,
462-463
from currency options, 462
Implied tree models, 321-322
binomial, 321-326
trinomial, 327-334
Implied volatility, 452-459
at-the-money forward approximation,
456
bisection method, 455-456
extended moneyness approximation,
457
forward, 458
local volatility derivation from,
458-459
Newton-Raphson method, 453-455
"In" barriers, 152-153
two-asset, 216
Ingersoll, J. E., 243
In-out parity, for American barrier
options, 155
Intelligent Monte Carlo (see
IQ-MC/importance sampling)
Interest rate options, 413-453
Black-Derman-Toy model, 434-443
Black-76 model, 419-429
bond prices and yields, 417-419
caps and floors, 421-422, 424-425
convexity adjustments, 415-417,
425-427
European short-term bond options,
427-428
FRAs, 413-415, 424-425INDEX 529
Ho and Lee model, 432-433
Hull and White model, 433-434
money market futures, 415-417,
420-421
Rendleman and Bartter model,
429-430
Schaefer and Schwartz model,
428-430
swaptions, 422-425
Vasicek model, 430-432
yield volatility in bonds, 428
Interest rates
compounding frequency, 491-492
continuous compounding, 491
future value of annuity, 491
net present value of annuity, 491
zero-coupon rates for par bonds/par
swaps, 492-493
Interpolation
cubic, 488
cubic-spline, 488-490
exponential, 487-488
linear, 487
log-linear, 487
two-dimensional, 490
In-the-money probability, 76-79
from in-the-money probability to
density, 80
probability of ever getting
in-the-money, 80-81
Inverse cumulative normal distribution
function, 469-470
IQ-MC/importance sampling, 359-361
quasi-random Monte Carlo, 363-364
Ito's lemma, 15-16
Jackel, P., 362
Jackson, M., 298
Jackwerth, J. C., 321
James, P., 336
Jamshidian, F., 419, 423, 431, 440
Jamshidian's approach, for coupon
bonds, 432
Jarrow, R., 118, 246, 247, 289, 406n
Jarrow and Rudd skewness and kurtosis
model, 246-247
Javaheri, A., 274, 278
Jennergren, L. P., 114, 462
Jensen, M., 496
Jensen alpha, 496
Jensen's measure, 496
Jha, S., 314
Johnson, H., 211, 213
Jorgensen, P. L., 314n
Jump-diffusion models, 253-258
Bates, generalized, 255-258
Merton, 253-255
Jurczenko, E., 250
Kabanov, Y. M., 239
Kamal, M., 119, 236, 272, 274
Kan, I., 292, 295
Kani, I., 167n, 308, 321, 322, 327
Karasinski, P., 228, 434n
Kassouf, S. T., 16
Kat, H., 116, 144, 147, 160, 165, 169,
215, 222
Kelly, M., 320
Kemna, A., 183
Kemna, A. G. Z., 351n
Kirikos, G., 415
Kirk, E., 213
Klass, M. J., 446
Knight, J., 252
Koehler, G., 454
Kohlhagen, S. W, 5, 90
Kou, S., 164, 165, 311
Kuintomo, N., 155, 158
Kumar, D., 265, 266
Kunitomo, N., 447n
Kurtosis
excess, 245
Fisher, 244-245
Pearson, 244-245
(See also Skewness and kurtosis
models)
Kwok, Y., 126, 155
Lagrange, J. L., 488
Lagrange's formula, 488
Lane, M., 452
Lau, S. H., 308
Lee, H. Y., 314
Lee, K. W., 315n
Lee, S.-B., 415, 432
Leisen, D. P. J., 290
Leisen-Reimer binomial tree, 290-292
Leland, H., 238, 239
Leptokurtic distributions, 245
Lesniewski, A. S., 265, 266
Levy, E., 184, 190, 191n, 192, 200
Levy's approximation, 190-192
Lewis, A., 278, 367, 371, 373, 375, 376,
378, 381
Lhabitant, F., 493, 494
Liao, S.-L., 126530 INDEX
Lieu, D., 5
Lindset, S., 220
Linear interpolation, 487
Linetsky, V., 186n
Litzenberger, R. H., 80
Liu, L., 416
Lo, A., 240,494
Local volatility
calculation from implied volatility,
458-459
implied binomial trees, 323-325
implied trinomial trees, 329,331
Logarithm, natural, 496
Log contracts, 119-121
Log (S), 119-121
log options, 121
Log-linear interpolation, 487
Lognormal distributions, skewness and
kurtosis, 245
Log options, 121
Lond, D., 274
Long, D., 118,122,223,311
Longstaff, F. A., 138,250,313,424
Lookback options, 141-150
extreme-spread, 148-150
fixed-strike, 143-144
floating-strike, 141-143
partial-time fixed-strike, 147-148
partial-time floating-strike, 144-146
Look-barrier options, 163-164
Low-discrepancy sequences,
quasi-random Monte Carlo,
363-364
Lyuu, Y., 315
MAD (mean absolute deviation), 253
Madan, D., 272
Maillet, B., 250
Manaster, S., 454
Manaster and Koehler start value,
454-455
Manzano, J., 150
Margined options on futures, BSM
formula, 5-6
Margrabe, W., 184,192,200,206,221,
226n
Margrabe barrier options, 219-221
Marsh, T. A., 447n
Martin, R., 118,122,309
Martingale restriction, 250
Maximal gamma, illusions of risk and,
39-42
McDonald, R. L., 38
McKean, H. P., 109
Mean absolute deviation (MAD), 253
Mean reversion
commodity options, 410
Monte Carlo of, 356
Meier, S., 365
Mello, A. S., 1
Merton, R. C., 1,4,5,17,18,37,76,90,
109,152,253,254,255,256,382,
383,406n
Merton jump-diffusion model, 253-255
Mesokurtic distributions, 245
Mezrich, J., 275
Miller, T. W., 457
Miltersen, K., 406,407,409,419,422
Miltersen-Schwartz model, 406-410
Minimum or maximum of two averages,
two-asset exotic options on,
224-226
Mirror options, 150-151
Mirror strikes
delta, 29-30
probability Greeks, 78-79
Mitchell, W. C., 242
Mixed Greeks, 87-89
Modified duration, 417
Money market futures
Black-76 model, 420-421
convexity adjustment, 415-417
Moneyness options, 114-115
Monte Carlo simulation, 345-365
American option, 364-365
for callable options, 349-351
Cholesky decomposition, 353-354
generating pseudo-random numbers,
355-357
Greeks, 347-349
of mean reversion, 355
for option on maximum of two spread
options, 352-353
for options on three assets, 352-353
for options on two assets, 350-351
variance reduction techniques,
357-364
Moro, B., 31,469
Multiple dividends, benchmark model
for discrete cash dividend,
387-389
Naslund, B., 114,464
Natural logarithm, 496
Negative probabilities, 286-287
Negrea, B., 250INDEX 531
Nelken, I., 129n
Nelson, D. B., 275n
Nelson, S. A., 1,9,10,16,18
Net present value, of annuity, 491
Net weighted vega, 82-83
Neuberger, A., 119
Neuhaus, H. J., 1
Newton-Raphson algorithm, for finding
bond yield, 419
Newton-Raphson method, 453-454
Manaster and Koehler start value,
454-455
Ng, V., 275n, 406n
NGARCH processes, 275n
Non-recombining trees, 372-375
Normal density function, bivariate,
cumulative, 470-481
Normal distribution function
bivariate, cumulative, 469-470
trivariate, cumulative, 480-486
Novak, D., 415
Numerical Greeks, 85-89
first-order, 85-86
mixed, 87-89
second-order, 86
third-order, 86,87-89
Option beta, 37
Option Sharpe ratio, 494
Option volatility (see Volatility)
Options, Greeks for, 232
Options on options, 132-137
ATM-ATM approximate compound
option, 137
call on call, 132
call on put, 133
compound option approximation,
136-137
put-call parity compound options, 135
put on call, 133
put on put, 133-134
in tree models, 303-305
Options sensitivities (see Greeks)
"Out" barriers, 153-154
two-asset, 216
Overhaus, M., 118,122,223,309
Panos, G., 416
Papanicolaou, G., 48,278
Par bonds/par swaps, zero-coupon rates,
492-493
Parkinson, M., 447
Partial derivatives, taking, 90-95
Partial differential equation (PDE),
behind BSM formula, 3-4,15-18
Partial-time fixed-strike lookback
options, 147-148
Partial-time floating-strike lookback
options, 144-146
Partial-time single-asset barrier
options, 160-162
Partial-time two-asset barrier options,
217-218
Pascal distribution, 253
Payer swaptions, 422
PDE (partial differential equation),
behind BSM formula, 3-4,15-18
Pearson, N. D., 213n
Pearson kurtosis, 244-245
Pechtl, A., 127
Perpetual options, American, 108-110
Persson, S.-A., 220
Perturbation, 265
Peskir, G., 11
Phi, 71-73
Pieterbarg, V. V., 414
Pilipovie, D., 410,411
Pirrong, S. C., 406n
Playakurtic distributions, 245
Poisson events, 256-258
Polynomial approximations, cumulative
normal distribution function,
467-469
Power contracts, 115-116
Power options, 115,116-119
capped, 117-118
powered options, 118-119
standard, 116-117
Powered options, 118-119
Press, W. H., 268
Price, L., 495
Price volatility, money market
futures, 421
Probability Greeks, 75-81
DzetaDtime, 25,80
DzetaDvol, 25,79
in-the-money probability, 76-79
from in-the-money probability to
density, 80
mirror strikes, 78-79
probability of ever getting
in-the-money, 80-81
risk-neutral probability density, 80
strikes from probability, 79
Probability mirror strikes, 78-79
Product options, 205532 INDEX
Pseudo-random number generation,
356-357
Put-call parity, for European options for
BSM formula, 9-10
Put-call parity compound options, 135
Put-call supersymmetry
for BSM formula, 11
skewness-kurtosis, 252
Put-call symmetry
for barrier options, 167
for BSM formula, 10-11
Put-call transformation American
options, 108
Put on call options, 133
Put on put options, 133-134
Quasi-random Monte Carlo, 362-364
Halton numbers, 362-363
IQ-MC, 363-364
Quotient options, 203-205
Randall, C., 335
Random number generation, 355-357
Rao, C. R., 461
Ratchet options, 124
Ray, C., 253
Rebonato, R., 278, 424, 459
Receiver swaptions, 423
Recombining tree model, known
dividend yield, 393-395
Reider, R., 359
Reimer, M., 165, 290
Reiner, E., 81, 152, 170, 174, 175n, 176,
226, 228, 230
Reismann, H., 406n
Relative outperformance options,
203-205
Rendleman, R. J., 279, 289, 308-309, 429
Rendleman and Bartter model, 429-430
Rendleman Bartter binomial tree,
289-290
Renedo, M. A., 416
Reset barrier options, 312
Reset strike barrier options, 310-311
Reset strike options, 308-310
type 1, 124-125
type 2, 125-126
Reset time options, 312-313
Return on VaR, 495-496
Reverse extreme-spread lookback
options, 149
RGW (Roll, Geske, and Whaley) model,
375-378
Rho, 24, 68-75, 93
at-the-money approximation, 85
call, 24, 69, 70
carry, 73-75
partial derivative, 93
phi (rho-2), 71-73
put, 24, 69-70, 71
Rho-2, 71-73
Rich, D. R., 152n, 211
Richardson, M., 228
Risk-neutral probability density (RND),
80
Risk-reward measures, 493-495
Burke ratio, 495
confidence ratio, 494-495
Jensen's measure, 496
return on VaR, 495-496
Sharpe ratio, 494
Sortino ratio, 495
Treynor's measure, 493-494
Risky assets, maximum or minimum of,
options on, 211-213
Ritchken, P., 275n, 300n
RND (risk-neutral probability density),
80
Robinson, D.., 247
Rogers, L. C. G., 447n
Roll, Geske, and Whaley model,
375-378
Roll, R., 235n, 368, 375, 387
Rosenfield, E. R., 447n
Ross, M., 165
Ross, S. A., 242, 243, 279, 281, 309,
322, 393
Rubinstein, M., 39n, 81, 122, 128, 129,
132, 152, 170, 174, 175, 176, 208n,
211, 213n, 279, 281, 297, 309, 321,
322, 393
Rudd, A., 246, 247, 289
SABR model, 265-271
calibration, 267-268
special cases, 267
Saddle point, 40-42
Safarian, M. M., 239
Samuelson, P., 14
Samuelson model, 14
Sandemann, M., 165
Sandmann, K., 419, 422
Santa-Clare, P., 424
Satchell, S., 252, 447n
Schachinger, W, 239
Schaefer, S., 428INDEX 533
Schaefer and Schwartz model, 428-429
Schnabel, J. A., 232
Scholes, M., 1,2,5,13,17,18,37,76,90,
213,310,390
Schwartz, E., 334,406,407,409,
424,428
Seasonality, commodity options, 411
Second-order Greeks, 86
Selby, M. J. P., 132
Shahabuddin, P., 359
Sharpe, W., 38,494
Sharpe ratio, 494
Shaw, W., 115
Shepeleva, A., 370,372,383
Shilling, H., 135
Shimko, D., 213n
Shiryaev, A. N., 11
Shiu, S. W., 109n
Siegel's paradox, 464
Single-asset barrier options, 152-173
American, standard, 154-155
binary, 176-180
discrete-barrier, 164-165
double-barrier, 156-160
"in" barriers, 152-153
look-barrier, 163-164
"out" barriers, 153-154
partial-time single-asset, 160-162
put-call symmetry for, 167
soft-barrier, 165-167
standard, 152-154
Single asset exotic options, 111-202
Asian, 182-202
barrier, 152-173
binary, 174-182
chooser, 128-132
executive stock options, 114
extendible, 138-141
fade-in, 122-123
forward start, 121-122
log contracts, 119-121
lookback, 141-150
mirror, 150-151
moneyness, 114-115
options on options, 132-137
power contracts and options, 115-119
ratchet, 124
reset strike, 124-126
time-switch, 127-128
variable purchase, 111-114
Sinus option, 283,284
Sircar, K. R., 48,278
Skewness and kurtosis models
Black-Scholes-Merton volatility
adjustment, 252
Corrado and Su, 247-250
definition of skewness and kurtosis,
244-245
Gram Charlier density, 252
Jarrow and Rudd, 246-247
lognormal distributions, 245
modified Corrado-Su, 250-251
put-call supersymmetry, 252
skewness-kurtosis trees, 253
Skewness kurtosis models, 244-253
Skewness-kurtosis put-call
supersymmetry, 252
Skewness-kurtosis trees, 253
Smile dynamics, implied tree models, 334
Smith, C. W., Jr., 13,14
Smith, D. R., 423
Sobol, I. M., 362
Soft-barrier options, 165-167
Sondermann, D., 419,422
Sortino, F., 495
Sortino ratio, 495
Sosin, H. B., 142
Speed, 23,47-49
Spread-option approximation, two-asset
exotic options, 213-215
Spread options, option on maximum of,
352-353
Sprenkle, C., 13
Sprenkle model, 13-14
Square root, 283,284
Standard power options, 116-117
Start options, forward, 121-122
Staunton, J., 298
Stegun, I. A., 468
Stensland, G., 101,104,108,208,
213n, 440
Stochastic volatility, swaptions, 425
Stochastic volatility models, 258-271
Hull-White
correlated, 261-265
uncorrelated, 259-261
SABR, 265-271
Stock index options, BSM formula
for, 4
Stock options, executive, 114
Stocks paying discrete dividends,
options on, 367-395
benchmark model of Haug, Haug, and
Lewis, 378-390
Black's method for calls, 375534 INDEX
Stocks paying discrete dividends,
options on (continued)
escrowed dividend model, 367-368
European, 368-372
non-recombining tree, 372-375
Roll, Geske, and Whaley model,
375-378
stocks with discrete dividend yield,
390-395
Stocks with discrete dividend yield,
options on, 390-395
closed-form American calls, 390-393
European options, 390
recombining tree model, 393-395
Strickland, C., 315
Strike, partial derivative, 92
Strike options
reset—type 1,124-125
reset—type 2,125-126
Stulz, R. M., 211
Su, T., 247,252
Su, Y., 359
Subrahmanyam, M., 84,168,243,456
Sun, T. S., 228
Supershare options, 176
Supersymmetry, put-call,
skewness-kurtosis, 252
Swaps
energy, 397-406
variance, 274-278
volatility, 274-278
Swaptions
Black-76 model, 422-425
payer, 422
receiver, 423
volatilities from caps or FRA
volatilities, 424-425
Takeover foreign equity options, equity
linked, 232
Taleb, N., 1,17,35,36,55,56,83,86
Tangens option, 283,284
Tavella, D., 335
Teukolsky, S., 268
Theta, 24,64-68,95
at-the-money approximation, 84
bleed-offset volatility, 68
call, 24,64,65
driftless, 24,66-68
partial derivative, 95
put, 24,64-66
relationship with gamma, 68
relationship with vega, 68
Theta symmetry, 68
Third moment, 244,257,260
Third-order Greeks, 86,87-89
Thorp, E. 0., 16
Three-asset options, Monte Carlo
simulation, 352-353
Three-dimensional binomial trees,
315-320
two-asset European binomial,
319-320
two-factor, number of nodes, 316-317
Time-switch options, 127-128
Toffel, R., 463
Tompkins, R. G., 452
Topper, J., 335
Torous, W. N., 255
Toy, W., 434
Trading day volatility adjustment, of
Black-Scholes-Merton formula,
235
Transaction cost, discrete-time hedging
with, 238-239
Tree methods, non-recombining trees,
372-375
Tree models
binomial, 279-343
three-dimensional, 315-320
exotic options, 303-314
finite difference methods, 333-342
implied, 320-333
recombining, with known dividend
yield, 391-393
trinomial, 299-303
Trending markets, Black-Scholes-
Merton formula adjustment for,
240-242
Trevor, R., 275n
Treynor, J., 493
Treynor's measure, 493-494
Trinomial trees, 299-303
implied, 327-334
Trivariate cumulative normal
distribution function, 480-486
Tse, Y. K.,211
Turnbull, S., 118,186
Turnbull and Wakeman approximation,
186-189
Two-asset barrier options, 215-221
double-barrier, 180-182
Two-asset European binomial, 319-320
Two-asset exotic options, 203-232
American, exchange-one-asset-
for-another, 208INDEX 535
barrier, 215-221
best or worst cash-or-nothing,
223-224
cash-or-nothing, 221-222
correlation, 205-206
currency-translated, 226-232
exchange-one-asset-for-another,
206-208
exchange options on exchange options,
209-211
Greeks for, 232
on maximum or minimum of two risky
assets, 211-213
on minimum or maximum of two
averages, 224-226
product, 205
relative outperformance (quotient),
203-205
spread-option approximation,
213-215
Two-asset options
correlated, IQ-MC extension to, 361
double-barrier, 180-182
European binomial, 319-320
exotic (see Two-asset exotic options)
Monte Carlo simulation, 350-351
Two-dimensional interpolation, 490
Ultima, 23,60
variance, 24,63
Vandermark, S., 371,383
VaR, return on, 495-496
Variable purchase options (VP0s),
111-114
Variance, BSM formula with, 11-12
Variance and volatility swaps, 271-278
Variance Greeks, 62-63
Variance reduction, 358-364
antithetic, 358
IQ-MC/importance sampling,
359-361
quasi-random Monte Carlo, 369-371
two correlated assets, 361
Variance swaps, 274-278
Variance ultima, 24,63
Variance vega, 23,62-63
Variance vomma, 24,63
Varikooty, A., 314
Vasicek, 0., 430,433n
Vasicek model, 430-432
Vega, 50-62,94
at-the-money approximation, 84
convexity adjustment, 427
from delta, 56
DvegaDtime, 23,61-62
DvegaDvol (vega convexity, Volga,
vomma), 23,57-60
DvommaDvol (ultima), 23,60
energy swaption, 404-405
global maximum, 52-55
leverage and volatility, 57
local maximum, 52
maximum time, 52
net weighted, 82-83
partial derivative, 94
relationship with gamma, 55
relationship with theta, 68
symmetry, 55
variance, 23,62-63
VegaP, 23,56
Vega convexity, 23,57-60
Vega elasticity, 57
Vega global maximum, 52-55
Vega leverage, 57
VegaP, 23,56
Vega symmetry, 55
Verdonk, L., 165
Vetterling, W., 268
Villiger, R., 390
Viswanathan, 143
Volatility
average implied index correlation,
462-463
basket, 460
daily, 450-451
historical (see Historical volatility)
implied, from convexity value in
bonds, 427
local, calculation from implied
volatility, 458-459
price, money market futures, 421
stochastic, swaptions with, 425
stochastic volatility models, 258-271
swaption, from caps or FRA
volatilities, 424-425
yield, money market futures, 421
Volatility adjustment
Bos-Gairat-Shepeleva, 370-371
BSM, 252
Haug-Haug, 369-370
simple, 369
trading day, of BSM formula, 235
Volatility cones, 452-453
Volatility ratio effect, 464536 INDEX
Volatility surface, local, calculation from
implied volatility surface,
458-459
Volatility swaps, 274-278
Volatility term structure, Asian options
with, 199-202
Volatility-time Greeks, 64
Volga, 23, 57-60
VolgaP, 23, 59
Vomma, 23, 57-60
variance, 24, 63
VommaP, 23, 59
Vorst, A., 183
Vorst, A. C. F., 351n
Vorst, T., 300n, 369, 375, 377
Wakeman, L. M., 186
Wang, C.-W., 126
Wang, J., 240
Webb, A., 32, 57
Wecker, J. S., 228
Wei, J. Z.,232
Wesolowsky, G. 0., 471, 476, 477
West, G., 267, 268, 465, 471, 477,
478, 482
Whaley, R. E., 97, 99, 104, 124, 125, 309,
368, 375, 387
Whalley, A. E., 239
White, A., 62, 259, 260, 261, 262, 263,
264, 266, 315, 335, 415,433
Wilcox, D., 213n
Wilmott, P., 38, 121, 238, 239, 274, 278,
335, 336, 342, 354n, 362, 373n,
458, 459
Wojakowski, R., 199
Wolyniec, K., 410
Woodward, D., 243, 265, 266
Writer-extendible options, 138-140
Wu, L., 252
Wu, L. X., 126
Wu, X., 224, 225
Wystrup, U., 29, 31, 42n, 56
Yield
bond prices related to, 418-419
current, 417
money market futures, 421
Yield volatility
bonds, 428
money market futures, 421
Yor, M., 155, 195n
Zero-coupon rates, for par bonds/par
swaps, 492-493
Zhang, J. E., 224, 225
Zhang, P., 116, 195n, 203, 205, 461
Zhou, G., 336
Zomma, 22, 45-47
Zou, J., 119, 272, 274