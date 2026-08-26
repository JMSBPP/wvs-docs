---
sha256: 4c9b0e037f243ce2f03616f5789214aace698ad7bf553a7d7888afdd3a8dfde6
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 687966
---
Dynamic Asset Pricing Theory
(Provisional Manuscript)
Darrell Duffie
Graduate School of Business
Stanford University
Preliminary Incomplete Draft: Not for Distribution
Copyright c 1999 Darrell Duffie
October 5, 1999iiContents
## 1 Introduction to State Pricing 9
1A Arbitrage and State Prices . . . . . . . . . . . . . . . . . . . . 9
1B Risk-Neutral Probabilities . . . . . . . . . . . . . . . . . . . . 10
1C Optimality and Asset Pricing . . . . . . . . . . . . . . . . . . 11
1D Efficiency and Complete Markets . . . . . . . . . . . . . . . . 14
1E Optimality and Representative Agents . . . . . . . . . . . . . 15
1F State-Price Beta Models . . . . . . . . . . . . . . . . . . . . . 18
## 2 The Basic Multiperiod Model 29
2A Uncertainty . . . . . . . . . . . . . . . . . . . . . . . . . . . . 29
2B Security Markets . . . . . . . . . . . . . . . . . . . . . . . . . 30
2C Arbitrage, State Prices, and Martingales . . . . . . . . . . . . 30
2D Individual Agent Optimality . . . . . . . . . . . . . . . . . . . 33
2E Equilibrium and Pareto Optimality . . . . . . . . . . . . . . . 34
2F Equilibrium Asset Pricing . . . . . . . . . . . . . . . . . . . . 35
2G Arbitrage and Martingale Measures . . . . . . . . . . . . . . . 36
2H Valuation of Redundant Securities . . . . . . . . . . . . . . . . 39
2I American Exercise Policies and Valuation . . . . . . . . . . . . 40
2J Is Early Exercise Optimal? . . . . . . . . . . . . . . . . . . . . 44
## 3 The Dynamic Programming Approach 61
3A The Bellman Approach . . . . . . . . . . . . . . . . . . . . . . 61
3B First-Order Conditions of the Bellman Equation . . . . . . . . 63
3C Markov Uncertainty . . . . . . . . . . . . . . . . . . . . . . . . 63
3D Markov Asset Pricing . . . . . . . . . . . . . . . . . . . . . . . 64
3E Security Pricing by Markov Control . . . . . . . . . . . . . . . 65
3F Arbitrage-Free Valuation in a Markov Setting . . . . . . . . . 67
3G Early Exercise and Optimal Stopping . . . . . . . . . . . . . . 69iv CONTENTS
## 4 The Infinite-Horizon Setting 79
4A Markov Dynamic Programming . . . . . . . . . . . . . . . . . 79
4B Dynamic Programming and Equilibrium . . . . . . . . . . . . 83
4C Arbitrage and State Prices . . . . . . . . . . . . . . . . . . . . 84
4D Optimality and State Prices . . . . . . . . . . . . . . . . . . . 85
4E Method-of-Moments Estimation . . . . . . . . . . . . . . . . . 87
## 5 The Black-Scholes Model 97
5A Trading Gains for Brownian Prices . . . . . . . . . . . . . . . 97
5B Martingale Trading Gains . . . . . . . . . . . . . . . . . . . . 99
5C Ito Prices and Gains . . . . . . . . . . . . . . . . . . . . . . . 100
5D Ito’s Formula . . . . . . . . . . . . . . . . . . . . . . . . . . . 102
5E The Black-Scholes Option-Pricing Formula . . . . . . . . . . . 102
5F Black-Scholes Formula: First Try . . . . . . . . . . . . . . . . 104
5G The PDE for Arbitrage-Free Derivative Security Prices . . . . 106
5H The Feynman-Kac Solution . . . . . . . . . . . . . . . . . . . 107
5I The Multidimensional Case . . . . . . . . . . . . . . . . . . . 108
## 6 State Prices and Equivalent Martingale Measures 117
6A Arbitrage . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 118
6B Numeraire Invariance . . . . . . . . . . . . . . . . . . . . . . . 119
6C State Prices and Doubling Strategies . . . . . . . . . . . . . . 119
6D Expected Rates of Return . . . . . . . . . . . . . . . . . . . . 122
6E Equivalent Martingale Measures . . . . . . . . . . . . . . . . . 124
6F State Prices and Martingale Measures . . . . . . . . . . . . . . 126
6G Girsanov and Market Prices of Risk . . . . . . . . . . . . . . . 128
6H Black-Scholes Again . . . . . . . . . . . . . . . . . . . . . . . 131
6I Complete Markets . . . . . . . . . . . . . . . . . . . . . . . . 133
6J Redundant Security Pricing . . . . . . . . . . . . . . . . . . . 136
6K Martingale Measures From No Arbitrage . . . . . . . . . . . . 137
6L Arbitrage Pricing with Dividends . . . . . . . . . . . . . . . . 140
6M Lumpy Dividends and Term Structures . . . . . . . . . . . . . 142
## 7 Term-Structure Models 151
7A The Term Structure . . . . . . . . . . . . . . . . . . . . . . . . 152
7B One-Factor Term-Structure Models . . . . . . . . . . . . . . . 153
7C The Gaussian Single-Factor Models . . . . . . . . . . . . . . . 156
7D The Cox-Ingersoll-Ross Model . . . . . . . . . . . . . . . . . . 157CONTENTS v
7E The Affine Single-Factor Models . . . . . . . . . . . . . . . . . 158
7F Term-Structure Derivatives . . . . . . . . . . . . . . . . . . . . 160
7G The Fundamental Solution . . . . . . . . . . . . . . . . . . . . 162
7H Multifactor Models . . . . . . . . . . . . . . . . . . . . . . . . 164
7I Affine Term Structure Models . . . . . . . . . . . . . . . . . . 165
7J The HJM Model of Forward Rates . . . . . . . . . . . . . . . 167
7K Markovian Yield-Curves and SPDEs . . . . . . . . . . . . . . 171
## 8 Derivative Pricing 183
8A Martingale Measures in a Black Box . . . . . . . . . . . . . . 183
8B Forward Prices . . . . . . . . . . . . . . . . . . . . . . . . . . 185
8C Futures and Continuous Resettlement . . . . . . . . . . . . . . 187
8D Arbitrage-Free Futures Prices . . . . . . . . . . . . . . . . . . 188
8E Stochastic Volatility . . . . . . . . . . . . . . . . . . . . . . . 190
8F Option Valuation by Transform Analysis . . . . . . . . . . . . 194
8G American Security Valuation . . . . . . . . . . . . . . . . . . . 197
8H American Exercise Boundaries . . . . . . . . . . . . . . . . . . 202
8I Lookback Options . . . . . . . . . . . . . . . . . . . . . . . . . 205
## 9 Portfolio and Consumption Choice 221
9A Stochastic Control . . . . . . . . . . . . . . . . . . . . . . . . 221
9B Merton’s Problem . . . . . . . . . . . . . . . . . . . . . . . . . 225
9C Solution to Merton’s Problem . . . . . . . . . . . . . . . . . . 228
9D The Infinite-Horizon Case . . . . . . . . . . . . . . . . . . . . 231
9E The Martingale Formulation . . . . . . . . . . . . . . . . . . . 233
9F Martingale Solution . . . . . . . . . . . . . . . . . . . . . . . . 236
9G A Generalization . . . . . . . . . . . . . . . . . . . . . . . . . 239
9H The Utility-Gradient Approach . . . . . . . . . . . . . . . . . 240
## 10 Equilibrium 261
10A The Primitives . . . . . . . . . . . . . . . . . . . . . . . . . . 261
10B Security-Spot Market Equilibrium . . . . . . . . . . . . . . . . 262
10C Arrow-Debreu Equilibrium . . . . . . . . . . . . . . . . . . . . 263
10D Implementing Arrow-Debreu Equilibrium . . . . . . . . . . . . 264
10E Real Security Prices . . . . . . . . . . . . . . . . . . . . . . . . 267
10F Optimality with Additive Utility . . . . . . . . . . . . . . . . . 268
10G Equilibrium with Additive Utility . . . . . . . . . . . . . . . . 269
10H The Consumption-Based CAPM . . . . . . . . . . . . . . . . . 271vi CONTENTS
10I The CIR Term Structure . . . . . . . . . . . . . . . . . . . . . 272
10J The CCAPM without Dynamic Spanning . . . . . . . . . . . . 276
## 11 Numerical Methods 287
11A Central Limit Theorems . . . . . . . . . . . . . . . . . . . . . 287
11B Binomial to Black-Scholes . . . . . . . . . . . . . . . . . . . . 288
11C Binomial Convergence for Unbounded Derivative Payoffs . . . 291
11D Discretization of Asset Price Processes . . . . . . . . . . . . . 292
11E Monte Carlo Simulation . . . . . . . . . . . . . . . . . . . . . 293
11F Efficient SDE Simulation . . . . . . . . . . . . . . . . . . . . . 294
11G Applying Feynman-Kac . . . . . . . . . . . . . . . . . . . . . . 296
11H Finite-Difference Methods . . . . . . . . . . . . . . . . . . . . 297
11I Term-Structure Example . . . . . . . . . . . . . . . . . . . . . 300
11J Finite-Difference Algorithms with Early Exercise Options . . . 302
11K The Numerical Solution of State Prices . . . . . . . . . . . . . 303
11L Numerical Solution of the Pricing Semi-Group . . . . . . . . . 306
11M Fitting the Initial Term Structure . . . . . . . . . . . . . . . . 308
A. Finite-State Probability 315
B. Separating Hyperplanes and Optimality 319
C. Probability—The General Case 323
D. Stochastic Integration 329
E. SDE, PDE, and Feynman-Kac 335
F. Simple Jump Processes 343
G. Utility Gradients 349
H. Ito’s Formula for Complex Functions 353
I. Finite-Difference Code 355Preface
THIS BOOK IS an introduction to the theory of portfolio choice and asset
pricing in multiperiod settings under uncertainty. An alternate title might be
“Arbitrage, Optimality, and Equilibrium,” because the book is built around
the three basic constraints on asset prices: absence of arbitrage, single-agent
optimality, and market equilibrium. The most important unifying principle
is that any of these three conditions implies that there are “state prices,”
meaning positive discount factors, one for each state and date, such that
the price of any security is merely the state-price weighted sum of its future
payoffs. This idea can be traced to Kenneth Arrow’s (1953) invention of the
general equilibrium model of security markets. Identifying the state prices
is the major task at hand. Technicalities are given relatively little emphasis
so as to simplify these concepts and to make plain the similarities between
discrete and continuous-time models. All continuous-time models are based
on Brownian motion, despite the fact that most of the results extend easily
to the case of a general abstract information filtration.
To someone who came out of graduate school in the mid-eighties, the
decade spanning roughly 1969-79 seems like a golden age of dynamic asset
pricing theory. Robert Merton started continuous-time financial modeling
with his explicit dynamic programming solution for optimal portfolio and
consumption policies. This set the stage for his 1973 general equilibrium
model of security prices, another milestone. His next major contribution was
his arbitrage-based proof of the option pricing formula introduced by Fisher
Black and Myron Scholes in 1973, and his continual development of that
approach to derivative pricing. The Black-Scholes model now seems to be,
by far, the most important single breakthrough of this “golden decade,” and
ranks alone with the Modigliani-Miller(1958) Theorem and the Capital Asset
Pricing Model (CAPM) of Sharpe (1964) and Lintner (1965) in its overall
importance for financial theory and practice. A tremendously influential2 Chapter 0. Preface
simplification of the Black-Scholes model appeared in the “binomial” option
pricing model of Cox, Ross, and Rubinstein (1979), who drew on an insight
of Bill Sharpe.
Working with discrete-time models, LeRoy (1973), Rubinstein (1976), and
Lucas (1978) developed multiperiod extensions of the CAPM. To this day,
the “Lucas model” is the “vanilla flavor” of equilibrium asset pricing models.
The simplest multiperiod representation of the CAPM finally appeared in
Doug Breeden’s continuous-time consumption based CAPM, published in
1979. Although not published until 1985, the Cox-Ingersoll-Ross model of
the term structure of interest rates appeared in the mid-seventies and is still
the premier textbook example of a continuous-time general equilibrium asset
pricing model with practical applications. It also ranks as one of the key
breakthroughs of that decade. Finally, extending the ideas of Cox and Ross
(1976) and Ross (1978), Harrison and Kreps (1979) gave an almost definitive
conceptual structure to the whole theory of dynamic security prices.
The periodsince 1979, with relatively few exceptions, has been a mopping-
up operation. On the theoretical side, assumptions have been weakened,
there have been noteworthy extensions and illutrative models, and the var-
ious problems have become much more unified under the umbrella of the
Harrison-Kreps model. On the applied side, markets have experienced an
explosion of new valuation techniques, hedging applications, and security
innovation, much of this based on the Black-Scholes and related arbitrage
models. No major investment bank, for example, lacks the experts or com-
puter technology required to implement advanced mathematical models of
the term structure. Because of the wealth of new applications, there has
been a significant development of special models to treat stochastic volatil-
ity, jump behavior including default, and the term structure of interest rates,
along with many econometric advances designed to take advantage of the re-
sulting improvements in richness and tractability.
Although it is difficult to predict where the theory will go next, in order
to promote faster progress by people coming into the field it seems wise to
have some of the basics condensed into a textbook. This book is designed to
be a streamlined course text, not a research monograph. Much generality is
sacrificed for expositional reasons, and there is relatively little emphasis on
mathematical rigor or on the existence of general equilibrium. As its title
indicates, I am treating only the theoretical side of the story. Although it
might be useful to tie the theory to the empirical side of asset pricing, we
have excellent treatments of the econometric modeling of financial data by3
Campbell, Lo, and MacKinlay [1994] as well as Gourieroux, Scaillet, and
Szafarz (1997). The story told by this book also leaves out some important
aspects of functioning security markets such as asymmetric information, and
transactions costs. I have chosen to develop only some of the essential ideas
of dynamic asset pricing, and even these are more than enough to put into
one book or into a one-semester course.
Other books whose treatments overlap with some of the topics treated
here include Avelleneda and Laurence (1999), Bjork (1998), Dana and Jean-
blanc (1998), Demange and Rochet (1992), Dewynne and Wilmott (1994),
Dixit and Pindyck (1993), Dothan (1990), Duffie (1988), Harris (1987),
Huang (1994), Huang and Litzenberger (1988), Ingersoll (1987), Jarrow (1988),
Karatzas (1997), Karatzas and Shreve (1998), Lamberton and Lapeyre (1997),
Magill and Quinzii (1994), Malliaris (1982), Merton (1990b), Musiela and
Rutkowski (1998), Stokey and Lucas (1989), and Willmott, Howison, and
Dewynne (1995). Each has its own aims and themes. There are also survey
articles by Constantinides (1989), Cox and Huang (1988), Huang (1987b),
Karatzas (1987), Marimon (1987), Merton (1990a, 1993, 1994a,b), and Roth-
schild (1986). I hope that readers will find some advantage in having yet
another perspective.
A reasonable way to teach a shorter course on continuous-time asset pric-
ing out of this book is to begin with Chapter 1 as an introduction to the
basic notion of state prices and then to go directly to Chapters 5 through
10. Chapter 11, on numerical methods, could be skipped at some cost in the
student’s ability to implement the results. There is no direct dependence of
any results in Chapters 5 through 11 on the first four chapters.
For mathematical preparation, little beyond undergraduate analysis, as
in Bartle (1976), and linear algebra, as in O’Nan (1976), is assumed. Further
depth, for example, by study of Rudin (1973) or a similar text on func-
tional analysis and measure theory, would be useful. Some background in
microeconomics would be useful, at the level of Kreps (1990), Luenberger
(1995), or Varian (1984). Familiarity with probability theory at a level ap-
proaching Billingsley (1986), for example, would also speed things along,
although measure theory is not used heavily. In any case, a series of appen-
dices supplies all of the required concepts and definitions from probability
theory and stochastic calculus. Additional useful references in this regard are
Arnold (1974), Brémaud (1981), Chung and Williams (1990), Elliott (1982),
Karatzas and Shreve (1988), Karr (1991), Kopp (1984), Oksendal (1985),
Rogers and Williams (1987), and Stroock and Varadhan (1979).4 Chapter 0. Preface
Students seem to learn best by doing problem exercises. Each chapter has
exercises and notes to the literature. I have tried to be thorough in giving
sources for results whenever possible and plead that any cases in which I have
mistaken or missed sources be brought to my attention for correction. The
notation and terminology throughout is fairly standard. I use R to denote
the real line and R = R ∪ {−∞,+∞} for the extended real line. For any
set Z and positive integer n, I use Zn
for the set of n-tuples of the form
(z1,...,zn) with zi in Z for all i. For example, think of Rn
. The conventions
used for inequalities in any context are
• x ≥ 0 means that x is nonnegative. For x in Rn
, this is equivalent to
x ∈ Rn
+;
• x > 0 means that x is nonnegative and not zero, but not necessarily
strictly positive in all coordinates;
• x ≫ 0 means x is strictly positive in every possible sense. The phrase
“x is strictly positive” means the same thing. For x in Rn
, this is
equivalent to x ∈ Rn
++ ≡ int (Rn
+).
Although warnings will be given at appropriate times, it should be kept
in mind that X = Y will be used to mean equality almost everywhere or
almost surely, as the case may be. The same caveat applies to each of the
above inequalities. A function F on an ordered set (such as Rn
) is increasing
if F(x) ≥ F(y) whenever x ≥ y and strictly increasing if F(x) > F(y)
whenever x > y. When the domain and range of a function are implicitly
obvious, the notation “x 7→ F(x)” means the function that maps x to F(x);
for example, x 7→ x2
means the function F : R → R defined by F(x) = x 2
.
Also, while warnings appear at appropriate places, it is worth pointing out
again here that for ease of exposition, a continuous-time “process” will be
defined throughout as a jointly measurable function on Ω×[0,T], where [0,T]
is the given time interval and (Ω,F,P) is the given underlying probability
space.
This first four chapters take place in a discrete-time setting with a dis-
crete set of states. This should ease the development of intuition for the
models to be found in chapters 5 through 11. The three pillars of the theory,
arbitrage, optimality, and equilibrium, are developed repeatedly in different
settings. Chapter 1 is the basic single-period model. Chapter 2 extends the5
results of Chapter 1 to many periods. Chapter 3 specializes Chapter 2 to a
Markov setting and illustrates dynamic programming as an alternate solution
technique. The Ho-and-Lee and Black-Derman-Toy term-structure models
are included as exercises. Chapter 4 is an infinite-horizon counterpart to
Chapter 3 that has become known as the Lucas model.
The focus of the theory is the notion of state prices, which specify the
price of any security as the state-price weighted sum or expectation of the
security’s state-contingent dividends. In a finite-dimensional setting, there
exist state prices if and only if there is no arbitrage. The same fact is true
in infinite-dimensional settings under mild technical regularity conditions.
Given an agent’s optimal portfolio choice, a state-price vector is given by
that agent’s utility gradient. In an equilibrium with Pareto optimality, a
state-price vector is likewise given by a representative agent’s utility gradient
at the economy’s aggregate consumption process.
Chapters 5 through 11 develop a continuous-time version of the theory in
which uncertainty is generated by Brownian motion. The results are some-
what richer and more delicate than those in Chapters 1 through 4, with a
greater dependence on mathematical technicalities. It is wiser to focus on
the parallels than on these technicalities. Once again, the three basic forces
behind the theory are arbitrage, optimality, and equilibrium.
Chapter 5 introduces the continuous-trading model and develops the
Black-Scholes partial differential equation (PDE) for arbitrage-free prices of
derivative securities. The Harrison-Kreps model of equivalent martingale
measures is presented in Chapter 6 in parallel with the theory of state prices
in continuous time. Chapter 7 presents models of the term structure of in-
terest rates, including the Black-Derman-Toy, Vasicek, Cox-Ingersoll-Ross,
and Heath-Jarrow-Morton models, as well as extensions. Chapter 8 presents
specific classes of derivative securities, such as futures, forwards, American
options, and lookback options. Chapter 8 also introduces models of op-
tion pricing with stochastic volatility. Chapter 9 is a summary of optimal
continuous-time portfolio choice, using both dynamic programming and an
approach involving equivalent martingale measures or state prices. Chapter
10 is a summary of security pricing in an equilibrium setting. Included are
such well-known models as Breeden’s consumption-based capital asset pricing
model and the general equilibrium version of the Cox-Ingersoll-Ross model
of the term structure of interest rates. Chapter 11 outlines three numeri-
cal methods for calculating derivative security prices in a continuous-time
setting: binomial approximation, Monte Carlo simulation of a discrete-time6 Chapter 0. Preface
approximation of security prices, and finite-difference solution of the associ-
ated PDE for the asset price or the fundamental solution.
In my preparation of the first edition, I relied on help from many peo-
ple, in addition to those mentioned above who developed this theory. In
1982, Michael Harrison gave a class at Stanford that had a major effect on
my understanding and research goals. Beside me in that class was Chi-fu
Huang; we learned much of this material together, becoming close friends
and collaborators. I owe him a lot. I am grateful to Niko and Vana Ski-
adas, who treated me with overwhelming warmth and hospitality at their
home on Skiathos, where parts of the first draft were written. Useful com-
ments on subsequent drafts have been provided by Howie Corb, Rui Kan,
John Overdeck, Christina Shannon, Philippe Henrotte, Chris Avery, Pinghua
Young, Don Iglehart, Rohit Rahi, Shinsuke Kambe, Marco Scarsini, Kerry
Back, Heracles Polemarchakis, John Campbell, Ravi Myneni, Michael Intrili-
gator, Robert Ashcroft, and Ayman Hindy. I thank Kingston Duffie, Ravi
Myneni, Paul Bernstein, and Michael Boulware for coding and running some
numerical examples. In writing the book, I have benefited from research col-
laboration over the years with George Constantinides, Larry Epstein, Mark
Garman, John Geanakoplos, Chi-fu Huang, Matt Jackson, Pierre-Louis Li-
ons, Andreu Mas-Colell, Andy McLennan, Philip Protter, Tony Richardson,
Wayne Shafer, Ken Singleton, Costis Skiadas, Richard Stanton, and Bill
Zame. At Princeton University Press, Jack Repcheck was a friendly, helpful,
and supportive editor. I owe a special debt to Costis Skiadas, whose generous
supply of good ideas has had a big influence on the result.
In going from the first to the second edition, I received the helpful sugges-
tions of Robert Ashcroft, Flavio Auler, Michael Boulware, Chin-Shan Chuan,
Qiang Dai, Michelle Dick, Phil Dolan, Kian Esteghamat, John Fuqua, Ay-
man Hindy, Toshiki Honda, Ming Huang, Farshid Jamshidian, Ping Jiang,
Allan Kulig, Yoichi Kuwana, Piero La Mura, Joe Langsam, Jun Liu, Lee
Bath Nelson, Angela Ng, Kazuhiko Ōhashi, Amir Sadr, Martin Schneider,
Lucie Tepla, Rajat Tewari, Steven Weinberg, Seth Weingram, and Guojun
Wu. I am happy to have had access to research discussions here at Stan-
ford, especially with Qiang Dai, Ayman Hindy, Ming Huang, Rui Kan, and
Ken Singleton, and elsewhere with too many others to name. I am thank-
ful to have had the chance to work on applied financial models with Mike
Burger, Ken Knowles, and Elizabeth Glaeser of Mobil Corporation; Adam
Duff, Craig Gustaffson, Joe Langsam, and Amir Sadr of Morgan Stanley and
Company; Mark Williams and Wei Shi of Bank of America; Vince Kaminsky,7
Stenson Gibner, and Corwin Joy and Krishna Rao of Enron; and Matt Page
and Aloke Majumdar of Susquehanna Investment Group. Peter Dougherty
has been a wonderful editor. I am also grateful for the opportunity to have
learned from new coauthors: Peter DeMarzo, Pierre-Yves Geoffard, Peter
Glynn, Mike Harrison, Ming Huang, Rui Kan, Jin Ma, Rohit Rahi, Mark
Schroeder, and Jiongmin Yong. Once again, I owe a special debt to Costis
Skiadas for extensive suggestions.
For assistance with bibliographic research, I am grateful to Yu-Hua Chen,
Melissa Gomez, David Lee, and Analiza Quiroz. Lauri Pickert of Archetype
did a superb job typesetting the first and second editions.
Acknowledgements for the new work going into this revised manuscript
will be added soon. The errors are my own responsibility, and I hope to hear
of them and any other comments from readers.
These notes are for classroom purposes only. Please do not copy or dis-
tribute in any form without permission of the author.8 Chapter 0. PrefaceChapter 1
Introduction to State Pricing
This chapter introduces the basic ideas of the course in a finite-state one-
period setting. In many basic senses, each subsequent chapter merely repeats
this one from a new perspective. The objective is a characterization of se-
curity prices in terms of “state prices,” one for each state of the world. The
price of a given security is simply the state-price weighted sum of its payoffs
in the different states. One can treat a state price as the “shadow price,” or
Lagrange multiplier, for wealth contingent on a given state of the world. We
obtain a characterization of state prices, first based on the absence of arbi-
trage, then based on the first-order conditions for optimal portfolio choice of
a given agent, and finally from the first-order conditions for Pareto optimal-
ity in an equilibrium with complete markets. State prices are connected with
the “beta” model for excess expected returns, a special case of which is the
Capital Asset Pricing Model (CAPM). Many readers will find this chapter
to be a review of standard results. In most cases, here and throughout, tech-
nical conditions are imposed that give up much generality so as to simplify
the exposition.
1A Arbitrage and State Prices
Uncertainty is represented here by a finite set {1,...,S} of states, one of
which will be revealed as true. The N securities are given by an N × S
matrix D, with Dij denoting the number of units of account paid by security
i in state j. The security prices are given by some q in RN
. A portfolio
θ ∈ RN
has market value q · θ and payoff D⊤
θ in RS
. An arbitrage is a10 Chapter 1. State Pricing
portfolio θ in RN
with q · θ ≤ 0 and D⊤
θ > 0, or q · θ < 0 and D⊤
θ ≥ 0. An
arbitrage is therefore, in effect, a portfolio offering “something for nothing.”
Not surprisingly, it will later be shown that an arbitrage is naturally ruled
out, and this gives a characterization of security prices as follows. A state-
price vector is a vector ψ in RS
++ with q = Dψ. We can think of ψj as the
marginal cost of obtaining an additional unit of account in state j.
Theorem. There is no arbitrage if and only if there is a state-price vector.
Proof: The proof is an application of the Separating Hyperplane Theorem.
Let L = R × RS
and M = {(−q · θ,D⊤
θ) : θ ∈ RN
}, a linear subspace of
L. Let K = R+ × RS
+, which is a cone (meaning that if x is in K, then λx
is in K for each strictly positive scalar λ.) Both K and M are closed and
convex subsets of L. There is no arbitrage if and only if K and M intersect
precisely at 0, as pictured in Figure 1.1.
Suppose K∩M = {0}. The Separating Hyperplane Theorem (in a version
for closed cones that is found in Appendix B) implies the existence of a linear
functional F : L → R such that F(z) < F(x) for all z in M and nonzero x
in K. Since M is a linear space, this implies that F(z) = 0 for all z in M
and that F(x) > 0 for all nonzero x in K. The latter fact implies that there
is some α > 0 in R and ψ ≫ 0 in RS
such that F (v,c) = αv + ψ · c, for any
(v,c) ∈ L. This in turn implies that −αq · θ + ψ · (D⊤
θ) = 0 for all θ in RN
.
The vector ψ/α is therefore a state-price vector.
Conversely, if a state-price vector ψ exists, then for any θ, we have q·θ =
ψ⊤
D⊤
θ. Thus, when D⊤
θ ≥ 0 we have q·θ ≥ 0, and when D⊤
θ > 0 we have
q · θ > 0, so there is no arbitrage.
1B Risk-Neutral Probabilities
We can view any p in RS
+ with p1 +···+pS = 1 as a vector of probabilities of
the corresponding states. Given a state-price vector ψ for the dividend-price
pair (D,q), let ψ0 = ψ1 + ··· + ψS and, for any state j, let ψ̂j = ψj/ψ0. We
now have a vector (ψ̂1,...,ψ̂S) of probabilities and can write, for an arbitrary
security i,
qi
ψ0
= Ê(Di) ≡
S X
j=1
ψ̂jDij,1C. Optimality and Asset Pricing 11
K
0
M
Figure1.1: Separating a Cone from a Linear Subspace
viewing the normalized price of the security as its expected payoff under spe-
cially chosen “risk-neutral” probabilities. If there exists a portfolio θ with
D⊤
θ = (1,1,...,1), then ψ0 = θ·q is the discount on riskless borrowing and,
for any security i, qi = ψ0Ê(Di), showing any security’s price to be its dis-
counted expected payoff in this sense of artificially constructed probabilities.
1C Optimality and Asset Pricing
Suppose the dividend-price pair (D,q) is given. An agent is defined by a
strictly increasing utility function U : RS
+ → R and an endowment e in RS
+.
This leaves the budget-feasible set
X(q,e) =

e + D⊤
θ ∈ RS
+ : θ ∈ RN
, q · θ ≤ 0 ,
and the problem
sup
c∈X(q,e)
U(c). (1)
We will suppose for this section that there is some some portfolio θ0
with
payoff D⊤
θ0
> 0. Because U is strictly increasing, the wealth constraint12 Chapter 1. State Pricing
q·θ ≤ 0 is then binding at an optimum. That is, if c∗
= e+D⊤
θ∗
solves (1),
then q · θ∗
= 0.
Proposition. If there is a solution to (1), then there is no arbitrage. If U
is continuous and there is no arbitrage, then there is a solution to (1).
Proof is left as an exercise.
Theorem. Suppose that c∗
is a strictly positive solution to (1), that U is
continuously differentiable at c∗
, and that the vector ∂U(c∗
) of partial deriva-
tives of U at c∗
is strictly positive. Then there is some scalar λ > 0 such that
λ∂U(c∗
) is a state-price vector.
Proof: The first-order condition for optimalityis that for any θ with q·θ = 0,
the marginal utility for buying the portfolio θ is zero. This is expressed more
precisely in the following way: The strict positivity of c∗
implies that for any
portfolio θ, there is some scalar k > 0 such that c∗
+ αD⊤
θ ≥ 0 for all α in
[−k,k]. Let gθ : [−k,k] → R be defined by
gθ(α) = U(c∗
+ αD⊤
θ).
Suppose q·θ = 0. The optimality of c∗
implies that gθ is maximized at α = 0.
The first-order condition for this is that g′
θ(0) = ∂U(c∗
)⊤
D⊤
θ = 0. We can
conclude that, for any θ in RN
, if q · θ = 0, then ∂U(c∗
)⊤
D⊤
θ = 0. From
this, there is some scalar µ such that ∂U(c∗
)⊤
D⊤
= µq.
By assumption, there is some portfolio θ0
with D⊤
θ0
> 0. From the
existence of a solution to (1), there is no arbitrage, implying that q · θ0
> 0.
We have
µq · θ0
= ∂U(c∗
)⊤
D⊤
θ0
> 0.
Thus µ > 0. We let λ = 1/µ, obtaining
q = λD∂U(c∗
), (2)
implying that λ∂U(c∗
) is a state-price vector.
Although we have assumed that U is strictly increasing, this does not
necessarily mean that ∂U(c∗
) ≫ 0. If U is concave and strictly increasing,
however, it is always true that ∂U(c∗
) ≫ 0.
Corollary. Suppose U is concave and differentiable at some c∗
= e+D⊤
θ∗
≫
0, with q · θ∗
= 0. Then c∗
is optimal if and only if λ∂U(c∗
) is a state-price
vector for some scalar λ > 0.1C. Optimality and Asset Pricing 13
State-1 consumption
State-2 consumption
budget set
c1
c2
c∗
∂ U(c∗
)
Figure1.2: First-Order Conditions for Optimal Consumption Choice
This follows from the sufficiency of the first-order conditions for concave
objective functions. The idea is illustrated in Figure 1.2. In that figure, there
are only two states, and a state-price vector is a suitably normalized nonzero
positive vector orthogonal to the set B = {D⊤
θ : q·θ = 0} of budget-neutral
consumption adjustments. The first-order condition for optimality of c∗
is
that movement in any feasible direction away from c∗
has negative or zero
marginal utility, which is equivalent to the statement that the budget-neutral
set is tangent at c∗
to the preferred set {c : U(c) ≥ U(c∗
)}, as shown in the
figure. This is equivalent to the statement that ∂U(c∗
) is orthogonal to B,
consistent with the last corollary. Figure 1.3 illustrates a strictly suboptimal
consumption choice c, at which the derivative vector ∂U(c) is not co-linear
with the state-price vector ψ.
We consider the special case of an expected utility function U, defined by
a given vector p of probabilities and by some u : R+ → R according to
U(c) = E [u(c)] ≡
S X
j=1
pju(cj). (3)
One can check that for c ≫ 0, if u is differentiable, then ∂U(c)j = pju′
(cj).14 Chapter 1. State Pricing
State-1 consumption
State-2 consumption
budget set
c1
c2
c
ψ
∂ U(c)
Figure1.3: A Strictly Suboptimal Consumption Choice
For this expected utility function, (2) therefore applies if and only if
q = λE [Du′
(c∗
)], (4)
with the obvious notationalconvention. As we saw in Section 1B, one can also
write (2) or (4), with the “risk-neutral” probability ψ̂j = u′
(c∗
j)pj/E[u′
(c∗
)],
in the form
qi
ψ0
= Ê(Di) ≡
S X
j=1
Dijψ̂j, 1 ≤ i ≤ N. (5)
1D Efficiency and Complete Markets
Suppose there are m agents, defined as in Section 1C by strictly increasing
utility functions U1,...,Um and by endowments e1
,...,em
. An equilibrium
for the economy [(Ui,ei
),D] is a collection (θ1
,...,θm
,q) such that, given the
security-price vector q, for each agent i, θi
solves supθ Ui(ei
+ D⊤
θ) subject
to q · θ ≤ 0, and such that
Pm
i=1 θi
= 0. The existence of equilibrium is
treated in the exercises and in sources cited in the notes.1E. Optimality and Representative Agents 15
With span(D) ≡ {D⊤
θ : θ ∈ RN
} denoting the set of possible portfolio
payoffs, markets are complete if span(D) = RS
, and are otherwise incomplete.
Let e = e1
+ ··· + em
denote the aggregate endowment. A consumption
allocation (c1
,...,cm
) in RS
+
m
is feasible if c1
+ ··· + cm
≤ e. A feasi-
ble allocation (c1
,...,cm
) is Pareto optimal if there is no feasible allocation
(ĉ1
,...,ĉm
) with Ui(ĉi
) ≥ Ui(ci
) for all i and with Ui(ĉi
) > Ui(ci
) for some i.
Complete markets and the Pareto optimality of equilibrium allocations are
almost equivalent properties of any economy.
Proposition. Suppose markets are complete and (θ1
,...,θm
,q) is an equi-
librium. Then the associated equilibrium allocation is Pareto optimal.
This is sometimes known as The First Welfare Theorem. The proof, re-
quiring only the strict monotonicity of utilities, is left as an exercise. We
have established the sufficiency of complete markets for Pareto optimality.
The necessity of complete markets for the Pareto optimality of equilibrium
allocations does not always follow. For example, if the initial endowment
allocation (e1
,...,em
) happens by chance to be Pareto optimal, then any
equilibrium allocation is also Pareto optimal, regardless of the span of secu-
rities. It would be unusual, however, for the initial endowment to be Pareto
optimal. Although beyond the scope of this book, it can be shown that with
incomplete markets and under natural assumptions on utility, for almost
every endowment, the equilibrium allocation is not Pareto optimal.
1E Optimality and Representative Agents
Aside from its allocationalimplications,Pareto optimalityis also a convenient
property for the purpose of security pricing. In order to see this, consider,
for each vector λ ∈ Rm
+ of “agent weights,” the utility function Uλ : RS
+ → R
defined by
Uλ(x) = sup
(c1,...,cm)
m X
i=1
λi Ui(ci
) subject to c1
+ ··· + cm
≤ x. (6)
Lemma. Suppose that, for all i, Ui is concave. An allocation (c1
,...,cm
)
that is feasible is Pareto optimal if and only if there is some nonzero λ ∈ Rm
+
such that (c1
,...,cm
) solves (6) at x = e = c1
+ ··· + cm
.
Proof: Suppose that (c1
,...,cm
) is Pareto optimal. Let U(x) = (U1(x1
),...,Um(xm
)),16 Chapter 1. State Pricing
for any allocation x, and let
U = {U(x) − U(c) − z : x ∈ A, z ∈ Rm
+ } ⊂ Rm
,
where A is the set of feasible allocations. Let J = {y ∈ Rm
+ : y 6= 0}. Since U
is convex (by the concavity of utility functions) and J∩U is empty (by Pareto
optimality), the Separating Hyperplane Theorem (Appendix B) implies that
there is a nonzero vector λ in Rm
such that λ · y ≤ λ · z for each y in U and
each z in J. Since 0 ∈ U, we know that λ ≥ 0, proving the first part of the
result. The second part is easy to show as an exercise.
Proposition. Suppose that for all i, Ui is concave. Suppose that markets
are complete and that (θ1
,...,θm
,q) is an equilibrium. Then there exists
some nonzero λ ∈ Rm
+ such that (0,q) is a (no-trade) equilibrium for the
single-agent economy [(Uλ,e),D] defined by (6). Moreover, the equilibrium
consumption allocation (c1
,...,cm
) solves the allocation problem (6) at the
aggregate endowment. That is, Uλ(e) =
P
i λiUi(ci
).
Proof: Since there is an equilibrium, there is no arbitrage, and therefore
there is a state-price vector ψ. Since markets are complete, this implies that
the problem of any agent i can be reduced to
sup
c∈RS
+
Ui(c) subject to ψ · c ≤ ψ · ei
.
We can assume that ei
is not zero, for otherwise ci
= 0 and agent i can be
eliminated from the problem without loss of generality. By the Saddle Point
Theorem of Appendix B, there is a Lagrange multiplier αi ≥ 0 such that ci
solves the problem
sup
c∈RS
+
Ui(c) − αi ψ · c − ψ · ei

.
(The Slater condition is satisfied since ei
is not zero and ψ ≫ 0.) Since Ui
is strictly increasing, αi > 0. Let λi = 1/αi. For any feasible allocation
(x1
,...,xm
), we have
m X
i=1
λiUi(ci
) =
m X
i=1

λiUi(ci
) − λiαi ψ · ci
− ψ · ei

≥
m X
i=1
λi

Ui(xi
) − αi ψ · xi
− ψ · ei
1E. Optimality and Representative Agents 17
=
m X
i=1
λiUi(xi
) − ψ ·
m X
i=1
(xi
− ei
)
≥
m X
i=1
λiUi(xi
).
This shows that (c1
,...,cm
) solves the allocation problem (6). We must
also show that no trade is optimal for the single agent with utility function
Uλ and endowment e. If not, there is some x in RS
+ such that Uλ(x) > Uλ(e)
and ψ · x ≤ ψ · e. By the definition of Uλ, this would imply the existence of
an allocation (x1
,...,xm
), not necessarily feasible, such that
P
i λiUi(xi
) > P
i λiUi(ci
) and
X
i
λiαiψ · xi
= ψ · x ≤ ψ · e =
X
i
λiαiψ · ci
.
Putting these two inequalities together, we have
m X
i=1
λi

Ui(xi
) − αiψ · (xi
− ei
)

>
m X
i=1
λi

Ui(ci
) − αiψ · (ci
− ei
)

,
which contradicts the fact that, for each agent i, (ci
,αi) is a saddle point for
that agent’s problem.
Corollary 1. If, moreover, e ≫ 0 and Uλ is continuously differentiable at
e, then λ can be chosen so that ∂Uλ(e) is a state-price vector, meaning
q = D∂Uλ(e). (7)
The differentiability of Uλ at e is implied by the differentiability, for some
agent i, of Ui at ci
. (See Exercise 10 (C).)
Corollary 2. Suppose there is a fixed vector p of state probabilities such
that for all i, Ui(c) = E[ui(c)] ≡
PS
j=1 pjui(cj), for some ui(·). Then
Uλ(c) = E[uλ(c)], where, for each y in R+,
uλ(y) = max
x∈Rm
+
m X
i=1
λiui(xi) subject to x1 + ··· + xm ≤ y.
In this case, (7) is equivalent to q = E[Du′
λ(e)].
Extensions of this representative-agent asset pricing formula will crop up
frequently in later chapters.18 Chapter 1. State Pricing
1F State-Price Beta Models
We fix a vector p ≫ 0 in RS
of probabilities for this section, and for any
x in RS
we write E(x) = p1x1 + ··· + pSxS. For any x and π in RS
, we
take xπ to be the vector (x1π1,...,xSπS). The following version of the Riesz
Representation Theorem can be shown as an exercise.
Lemma. Suppose F : RS
→ R is linear. Then there is a unique π in RS
such that, for all x in RS
, we have F(x) = E(πx). Moreover, F is strictly
increasing if and only if π ≫ 0.
Corollary. A dividend-price pair (D,q) admits no arbitrage if and only if
there is some π ≫ 0 in RS
such that q = E(Dπ).
Proof: Given a state-price vector ψ, let πs = ψs/ps. Conversely, if π has the
assumed property, then ψs = psπs defines a state-price vector ψ.
Given (D,q), we refer to any vector π given by this result as a state-price
deflator. (The terms state-price density and state-price kernel are often used
synonymously with state-price deflator.) For example, the representative-
agent pricing model of Corollary 2 of Section 1E shows that we can take
πs = u′
λ(es).
For any x and y in RS
, the covariance cov(x,y) ≡ E(xy) − E(x)E(y)
is a measure of covariation between x and y that is useful in asset pricing
applications. For any such x and y with var(y) ≡ cov(y,y) 6= 0, we can
always represent x in the form x = α + βy + ǫ, where β = cov(y,x)/var(y),
where cov(y,ǫ) = E(ǫ) = 0, and where α is a scalar. This linear regression of
x on y is uniquely defined. The coefficient β is called the associated regression
coefficient.
Suppose (D,q) admits no arbitrage. For any portfolio θ with q · θ 6= 0,
the return on θ is the vector Rθ
in RS
defined by Rθ
s = (D⊤
θ)s/q·θ. Fixing a
state-price deflator π, for any such portfolio θ, we have E(πRθ
) = 1. Suppose
there is a riskless portfolio, meaning some portfolio θ with constant return
R0
. We then call R0
the riskless return. A bit of algebra shows that for any
portfolio θ with a return, we have
E(Rθ
) − R0
= −
cov(Rθ
,π)
E(π)
.
Thus, covariation with π has a negative effect on expected return, as one
might expect from the interpretation of state prices as shadow prices for
wealth.1F. State-Price Beta Models 19
The correlation between any x and y in RS
is zero if either has zero
variance, and is otherwise defined by
corr(x,y) =
cov(x,y)
p
var(x)var(y)
.
There is always a portfolio θ∗
solving the problem
sup
θ
corr(D⊤
θ,π). (8)
If there is such a portfolio θ∗
with a return R∗
having nonzero variance, then
it can be shown as an exercise that for any return Rθ
,
E(Rθ
) − R0
= βθ

E(R∗
) − R0

, (9)
where
βθ =
cov(R∗
,Rθ
)
var(R∗)
.
If markets are complete, then R∗
is of course perfectly correlated with the
state-price deflator.
Formula (9) is a state-price beta model, showing excess expected returns
on portfolios to be proportional to the excess return on a portfolio having
maximal correlation with a state-price deflator, where the constant of propor-
tionality is the associated regression coefficient. The formula can be extended
to the case in which there is no riskless return. Another exercise carries this
idea, under additional assumptions, to the Capital Asset Pricing Model, or
CAPM.
Exercises
Exercise 1.1 The dividend-price pair (D,q) of Section 1A is defined to
be weakly arbitrage-free if q · θ ≥ 0 whenever D⊤
θ ≥ 0. Show that (D,q) is
weakly arbitrage-free if and only if there exists (“weak” state prices) ψ ∈ RS
+
such that q = Dψ. This fact is known as Farkas’s Lemma.
Exercise 1.2 Prove the assertion in Section 1A that (D,q) is arbitrage-
free if and only if there exists some ψ ∈ RS
++ such that q = Dψ. Instead of
following the proof given in Section 1A, use the following result, sometimes
known as the Theorem of the Alternative.20 Chapter 1. State Pricing
Stiemke’s Lemma. Suppose A is an m×n matrix. Then one and only one
of the following is true:
(a) There exists x in Rn
++ with Ax = 0.
(b) There exists y in Rm
with y⊤
A > 0.
Exercise 1.3 Show for U(c) ≡ E[u(c)] as defined by (3) that (2) is equiv-
alent to (4).
Exercise 1.4 Prove the existence of an equilibriumas defined in Section 1D
under these assumptions: There exists some portfolio θ with payoff D⊤
θ > 0
and, for all i, ei
≫ 0 and Ui is continuous, strictly concave, and strictly
increasing. This is a demanding exercise, and calls for the following general
result.
Kakutani’s Fixed Point Theorem. Suppose Z is a nonempty convex
compact subset of Rn
, and for each x in Z, ϕ(x) is a nonempty convex com-
pact subset of Z. Suppose also that {(x,y) ∈ Z × Z : x ∈ ϕ(y)} is closed.
Then there exists x∗
in Z such that x∗
∈ ϕ(x∗
).
Exercise 1.5 Prove Proposition 1D. Hint: The maintained assumption of
strict monotonicity of Ui(·) should be used.
Exercise 1.6 Suppose that the endowment allocation(e1
,...,em
) is Pareto
optimal.
(A) Show, as claimed in Section 1D, that any equilibrium allocation is Pareto
optimal.
(B) Suppose that there is some portfolio θ with D⊤
θ > 0 and, for all i, that
Ui is concave and ei
≫ 0. Show that (e1
,...,em
) is itself an equilibrium
allocation.
Exercise 1.7 Prove Proposition 1C. Hint: A continuous real-valued func-
tion on a compact set has a maximum.
Exercise 1.8 Prove Corollary 1 of Proposition 1E.
Exercise 1.9 Prove Corollary 2 of Proposition 1E.1F. State-Price Beta Models 21
Exercise 1.10 Suppose, in addition to the assumptions of Proposition 1E,
that
(a) e = e1
+ ··· + em
is in RS
++;
(b) for all i, Ui is concave and twice continuously differentiable in RS
++;
(c) for all i, ci
is in RS
++ and the Hessian matrix ∂2
U(ci
), which is negative
semi-definite by concavity, is in fact negative definite.
Property (c) can be replaced with the assumption of regular preferences, as
defined in a source cited below in the Notes.
(A) Show that the assumption that Uλ is continuously differentiable at e is
justified and, moreover, that for each i there is a scalar γi > 0 such that
∂Uλ(e) = γi∂Ui(ci
). (This co-linearity is known as “equal marginal rates of
substitution,” a property of any Pareto optimal allocation.) Hint: Use the
following:
Implicit Function Theorem. Suppose for given m and n that f : Rm
×
Rn
→ Rn
is Ck
(k times continuously differentiable) for some k ≥ 1. Suppose
also that the n × n matrix ∂yf(x,y) of partial derivatives of f with respect
to its second argument is non-singular at some (x,y). If f(x,y) = 0, then
there exist scalars ǫ > 0 and δ > 0 and a Ck
function Z : Rm
→ Rn
such
that if kx − ak < ǫ, then f[x,Z(x)] = 0 and kZ(x) − bk < δ.
(B) Show that the negative definite part of condition (c) is satisfied if e ≫ 0
and, for all i, Ui is an expected utility function of the form Ui(c) = E[ui(c)],
where ui is strictly concave with an unbounded derivative on (0,∞).
(C) Obtain the result of Part (A) without assuming the existence of second
derivatives of the utilities. (You would therefore not exploit the Hessian
matrix or Implicit Function Theorem.) As the first (and main) step, show
the following. Given a concave function f : RS
+ → R, the superdifferential of
f at some x in RS
+ is
∂f(x) =

z ∈ RS
: f(y) ≤ f(x) + z · (y − x), y ∈ RS
+ .
For any feasible allocation (c1
,...,cm
) and λ ∈ Rm
+ satisfying Uλ(e) = P
i λiUi(ci
),
∂Uλ(e) = ∩m
i=1λi∂Ui(ci).22 Chapter 1. State Pricing
Exercise 1.11 (Binomial Option Pricing) As an application of the re-
sults in Section 1A, consider the following two-state (S = 2) option-pricing
problem. There are N = 3 securities:
(a) a stock, with initial price q1 > 0 and dividend D11 = Gq1 in state 1 and
dividend D12 = Bq1 in state 2, where G > B > 0 are the “good” and
“bad” gross returns, respectively;
(b) a riskless bond, with initial price q2 > 0 and dividend D21 = D22 = Rq2
in both states (that is, R is the riskless return and R−1
is the discount);
(c) a call option on the stock, with initial price q3 = C and dividend D3j =
(D1j −K)+
≡ max(D1j −K, 0) for both states j = 1 and j = 2, where
K ≥ 0 is the exercise price of the option. (The call option gives its
holder the right, but not the obligation, to pay K for the stock, with
dividend, after the state is revealed.)
(A) Show necessary and sufficient conditions on G, B, and R for the absence
of arbitrage involving only the stock and bond.
(B) Assuming no arbitrage for the three securities, calculate the call-option
price C explicitly in terms of q1, G, R, B, and K. Find the state-price
probabilities ψ̂1 and ψ̂2 referred to in Section 1B in terms of G, B, and R,
and show that C = R−1
Ê(D3), where Ê denotes expectation with respect to
(ψ̂1,ψ̂2).
Exercise 1.12 (CAPM) In the setting of Section 1D, suppose (c1
,...,cm
)
is a strictly positive equilibrium consumption allocation. For any agent i,
suppose utility is of the expected-utility form Ui(c) = E[ui(c)]. For any
agent i, suppose there are fixed positive constants c and bi such that for any
state j, we have ci
j < c and ui(x) = x − bix2
for all x ≤ c.
(A) In the context of Corollary 2 of Section 1E, show that u′
λ(e) = k − Ke
for some positive constants k and K. From this, derive the CAPM
q = AE(D) − Bcov(D,e), (10)
for positive constants A and B, where cov(D,e) ∈ RN
is the vector of co-
variances between the security dividends and the aggregate endowment.
Suppose for a given portfolio θ that each of the following is well defined:1F. State-Price Beta Models 23
• the return Rθ
≡ D⊤
θ/q · θ;
• the return RM
on a portfolio M with payoff D⊤
M = e;
• the return R0
on a portfolio θ0
with cov(D⊤
θ0
,e) = 0;
• βθ = cov(Rθ
,RM
)/var(RM
).
The return RM
is sometimes called the market return. The return R0
is
called the zero-beta return and is the return on a riskless bond if one exists.
Prove the “beta” form of the CAPM
E(Rθ
− R0
) = βθE(RM
− R0
). (11)
(B) Part (A) relies on the completeness of markets. Without any such as-
sumption, but assuming that the equilibriumallocation(c1
,...,cm
) is strictly
positive, show that the same beta form (11) applies, provided we extend the
definition of the market return RM
to be the return on any portfolio solving
sup
θ∈RN
corr(Rθ
,e). (12)
For complete markets, corr(RM
,e) = 1, so the result of part (A) is a special
case.
(C) The CAPM applies essentially as stated without the quadratic expec-
ted-utility assumption provided that each agent i is strictly variance-averse,
in that Ui(x) > Ui(y) whenever E(x) = E(y) and var(x) < var(y). Formalize
this statement by providing a reasonable set of supporting technical condi-
tions. We remark that a common alternative formulationof the CAPM allows
security portfoliosin initialendowments θ̂1
,...,θ̂m
with
Pm
i=1 θ̂i
j = 1 for all j.
In this case, with the total endowment e redefined by e =
Pm
i=1

ei
+ D⊤
θ̂i

,
the same CAPM (11) applies. If ei
= 0 for all i, then even in incomplete
markets, corr(RM
,e) = 1, since (12) is solved by θ = (1,1,...,1). The Notes
below provide references.
Exercise 1.13 An Arrow-Debreu equilibrium for [(Ui,ei
),D] is a nonzero
vector ψ in RS
+ and a feasible consumption allocation (c1
,...,cm
) such that
for each i, ci
solves supc Ui(c) subject to ψ·ci
≤ ψ·ei
. Suppose that markets
are complete, in that span(D) = RS
. Show that (c1
,...,cm
) is an Arrow-
Debreu consumption allocation if and only if it is an equilibrium consumption
allocation in the sense of Section 1D.24 Chapter 1. State Pricing
Exercise 1.14 Suppose (D,q) admits no arbitrage. Show that there is a
unique state-price vector if and only if markets are complete.
Exercise 1.15 (Aggregation) For the “representative-agent” problem
(6), suppose for all i that Ui(c) = E [u(c)], where u(c) = cγ
/γ for some
nonzero scalar γ < 1.
(A) Show for any nonzero agent weight vector λ ∈ Rm
+ that Uλ(c) = E[kcγ
/γ]
for some scalar k > 0 and that (6) is solved by ci
= kix for some scalar ki ≥ 0
that is nonzero if and only if λi is nonzero.
(B) With this special utility assumption, show that there exists an equilib-
rium with a Pareto efficient allocation, without the assumption that markets
are complete, but with the assumption that ei
∈ span (D) for all i. Calculate
the associated equilibrium allocation.
Exercise 1.16 (State-Price Beta Model) This exercise is to prove and
extend the state-price beta model (9) of Section 1F.
(A) Show problem (8) is solved by any portfolio θ such that π = D⊤
θ + ǫ,
where cov(ǫ,Dj
) = 0 for any security j, where Dj
∈ RS
is the payoff of
security j.
(B) Given a solution θ to (8) such that Rθ
is well defined with nonzero
variance, prove (9).
(C) Reformulate (9) for the case in which there is no riskless return by re-
defining R0
to be the expected return on any portfolio θ such that Rθ
is well
defined and cov(Rθ
,π) = 0, assuming such a portfolio exists.
Exercise 1.17 Prove the Riesz representation lemma of Section 1F. The
following hint is perhaps unnecessary in this simple setting but allows the
result to be extended to a broad variety of spaces called Hilbert spaces. Given
a vector space L, a function (· | ·) : L × L → R is called an inner product
for L if for any x, y, and z in L and any scalar α we have the five properties:
(a) (x | y) = (y | x)
(b) (x + y | z) = (x | z) + (y | z)
(c) (αx | y) = α(x | y)1F. State-Price Beta Models 25
(d) (x | x) ≥ 0
(e) (x | x) = 0 if and only if x = 0.
Suppose a finite-dimensional vector space L has an inner product (· | ·).
(This defines a special case of a Hilbert space.) Two vectors x and y are
defined to be orthogonal if (x | y) = 0. For any linear subspace H of L
and any x in L, it can be shown that there is a unique y in H such that
(x − y | z) = 0 for all z in H. This vector y is the orthogonal projection
in L of x onto H, and solves the problem minh∈H kx − hk. Let L = RS
.
For any x and y in L, let (x | y) = E(xy). We must show that given a
linear functional F, there is a unique π with F(x) = (π | x) for all x. Let
J = {x : F(x) = 0}. If J = L, then F is the zero functional, and the unique
representation is π = 0. If not, there is some z such that F(z) = 1 and
(z | x) = 0 for all x in J. Show this using the idea of orthogonal projection.
Then show that π = z/(z | z) represents F, using the fact that for any x, we
have x − F(x)z ∈ J.
Exercise 1.18 Suppose there are m = 2 consumers, A and B, with
identical utilities for consumption c1 and c2 in states 1 and 2 given by
U(c1,c2) = 0.2
√
c1 + 0.5logc2. There is a total endowment of e1 = 25 units
of consumption in state 1.
(A) Suppose that markets are complete and that, in a given equilibrium,
consumer A’s consumption is 9 units in state 1 and 10 units in state 2. What
is the total endowment e2 in state 2?
(B) Continuing under the assumptions of part (A), suppose there are two
securities. The first is a riskless bond paying 10 units of consumption in each
state. The second is a risky asset paying 5 units of consumption in state 1
and 10 units in state 2. In equilibrium, what is the ratio of the price of the
bond to that of the risky asset?
Exercise 1.19 There are two states of the world, labeled 1 and 2, two
agents, and two securities, both paying units of the consumption numeraire
good. The risky security pays a total of 1 unit in state 1 and pays 3 units in
state 2. The riskless security pays 1 unit in each state. Each agent is initially
endowed with half of the total supply of the risky security. There are no other
endowments. (The riskless security is in zero net supply.) The two agents26 Chapter 1. State Pricing
assign equal probabilities to the two states. One of the agents is risk-neutral,
with utility function E(c) for state-contingent consumption c, and can con-
sume negatively or positively in both states. The other, risk-averse, agent
has utility E(
√
c) for non-negative state-contingent consumption. Solve for
the equilibrium allocation of the two securities in a competitive equilibrium.
Exercise 1.20 Consider a setting with two assets A and B, only, both
paying off the same random variable X, whose value is non-negative in every
state and non-zero with strictly positive probability. Asset A has price p,
while asset B has price q. An arbitrage is then a portfolio (α,β) ∈ R2
of
the two assets whose total payoff αX +βX is non-negative and whose initial
price αp + βq is strictly negative, or whose total payoff is non-zero with
strictly positive probability and always non-negative, and whose initial price
is negative or zero.
(A) Assuming no restrictions on portfolios, and no transactions costs or
frictions, state the set of arbitrage-free prices (p,q). (State precisely the
appropriate subset of R2
.)
(B) Assuming no short sales (α ≥ 0 and β ≥ 0), state the set of arbitrage-
free prices (p,q).
(C) Now suppose that A and B can be short sold, but that asset A can only
be short sold only by paying an extra fee of φ > 0 per unit sold short. There
are no other fees of any kind. Provide the obvious new definition of “no
arbitrage” in precise mathematical terms, and state the set of arbitrage-free
prices.
Notes
The basic approach of this chapter follows Arrow [1953], taking a general-
equilibrium perspective originating with Walras [1877]. Black [1995] offers
a persepctive on the general equilibrium approach and a critique of other
approaches. The state-pricing implications of no arbitrage found in Section
1A originate with Ross [1978]. The idea of “risk-neutral probabilities” appar-
ently originates with Arrow [1970], a revision of Arrow [1953], and appears as
well in Drèze [0 71]. Proposition 1D is the First Welfare Theorem of Arrow
[1951] and Debreu [1954]. The generic inoptimality of incomplete markets
equilibrium allocations can be gleaned from sources cited by Geanakoplos
[1990]. Indeed, Geanakoplos and Polemarchakis [1986] show that even a1F. State-Price Beta Models 27
reasonable notion of constrained optimality generically fails in certain in-
complete markets settings. See, however, Kajii [1994] and references cited in
the Notes of Chapter 2 for mitigating results. Mas-Colell [1987] and Werner
[1991] also treat constrained optimality.
The “representative-agent” approach goes back, at least, to Negishi[1960].
The existence of a representative agent is no more than an illustrative simpli-
fication in this setting, and should not be confused with the more demanding
notion of aggregation of Gorman [1953] found in Exercise 1.15. In Chapter 9,
the existence of a representative agent with smooth utility, based on Exercise
1.11, is important for technical reasons.
Debreu [1972] provides preference assumptions that substitute for the ex-
istence of a negative-definite Hessian matrix of each agent’s utility function
at the equilibrium allocation. For more on regular preferences and the dif-
ferential approach to general equilibrium, see Mas-Colell [1985] and Balasko
[1989]. Kreps [1988] reviews the theory of choice and utility representation
of preferences. For Farkas’s and Stiemke’s Lemmas, and other forms of the
Theorem of the Alternative, see Gale [1960].
Arrow and Debreu [1954] and, in a slightly different model, McKenzie
[1954] are responsible for a proof of the existence of complete-markets equi-
libria. Debreu [1982] surveys the existence problem. Standard introductory
treatments of general equilibrium theory are given by Debreu [1959] and
Hildenbrand and Kirman [1989]. In this setting, with incomplete markets,
Polemarchakis and Siconolfi [1991] address the failure of existence unless one
has a portfolio θ with payoff D⊤
θ > 0. Geanakoplos [1990] surveys other
literature on the existence of equilibria in incomplete markets, some of which
takes the alternative of defining security payoffs in nominal units of account,
while allowing consumption of multiple commodities. Most of the literature
allows for an initial period of consumption before the realization of the un-
certain state. For a survey, see Magill and Shafer [1991]. Additional results
on incomplete markets equilibrium include those ofBoyle and Wang [1999],
Weil [1992], Araujo and Monteiro [1989], Berk [1994], For related results in
multiperiod settings, references are cited in the Notes of Chapter 2.
The superdifferentiability result of Exercise 10(C) is due to Skiadas [1995].
Hellwig [1996], Mas-Colell and Monteiro [1996], and Monteiro [1996] have
recently shown existence with a continuum of states. Geanakoplos and Pole-
marchakis [1986] and Chae [1988] show existence in a model closely related
to that studied in this chapter. Grodal and Vind [1988] and Yamazaki [1991]28 Chapter 1. State Pricing
show existence with alternative formulations. With multiple commodities or
multiple periods, existence is not guaranteed under any natural conditions, as
shown by Hart [1975], who gives a counterexample. For these more delicate
cases, the literature on generic existence is cited in the Notes of Chapter 2.
The CAPM is due to Sharpe [1964] and Lintner [1965]. The version with-
out a riskless asset is due to Black [1972]. Allingham [1991], Berk [1992],
and Nielsen [990a], and Nielsen [990b] address the existence of equilibrium
in the CAPM. Characterization of the mean-variance model and two-fund
separation is provided by Bottazzi, Hens, and Löffler [1994] , Nielsen [993a]
and Nielsen [993b]. Löffler [1994] provides sufficient conditions for variance
aversion in terms of mean-variance preferences. Ross [1976] introduced the
arbitrage pricing theory, a multifactor model of asset returns that in terms of
expected returns can be thought of as an extension of the CAPM. In this re-
gard, see also Bray [994a], Bray [994b] and Gilles and LeRoy [1991]. Balasko
and Cass [1986] and Balasko, Cass, and Siconolfi [1990] treat equilibrium
with constrained participation in security trading. See, also, Hara [1994].
The binomial option-pricing formula of Exercise 1.11 is from an early
edition of Sharpe [1985], and is extended in Chapter 2 to a multiperiod
setting. The hint given for the demonstration of the Riesz representation
exercise is condensed from the proof given by Luenberger [1969] of the Riesz-
Frechet Theorem: For any Hilbert space H with inner product (· | ·), any
continuous linear functional F : H → R has a unique π in H such that
F(x) = (π | x), x ∈ H. The Fixed Point Theorem of Exercise 1.4 is from
Kakutani [1941].
On the role of default and collateralization, see andGeanakoplosZ:99.
Gottardi and Kajii [1995] study the role and existence of sunspot equilib-
ria. Pietra [1992] treats indeterminacy.Chapter 2
The Basic Multiperiod Model
THIS CHAPTER EXTENDS the results of Chapter 1 on arbitrage, optimal-
ity, and equilibrium to a multiperiod setting. A connection is drawn between
state prices and martingales for the purpose of representing security prices.
The exercises include the consumption-based capital asset pricing model and
the multiperiod “binomial” option pricing model.
2A Uncertainty
As in Chapter 1, there is some finite set, say Ω, of states. In order to handle
multiperiod issues, however, we will treat uncertainty a bit more formally
as a probability space (Ω, F, P), with F denoting the tribe of subsets of Ω
that are events (and can therefore be assigned a probability), and with P
a probability measure assigning to any event B in F its probability P(B).
Those not familiar with the definition of a probability space can consult
Appendix A.
There are T+1 dates: 0,1,...,T. At each of these, a tribe Ft ⊂ F denotes
the set of events corresponding to the information available at time t. That
is, if an event B is in Ft, then at time t this event is known to be true or false.
(A definition of tribes in terms of “partitions” of Ω is given in Exercise 2.11.)
We adopt the usual convention that Ft ⊂ Fs whenever t ≤ s, meaning that
events are never “forgotten.” For simplicity, we also take it that every event
in F0 has probability 0 or 1, meaning roughly that there is no information
at time t = 0. Taken altogether, the filtration F = {F0,...,FT} represents
how information is revealed through time. For any random variable Y , we30 Chapter 2. Basic Multiperiod Model
let Et(Y ) = E(Y |Ft) denote the conditional expectation of Y given Ft.
(Appendix A provides definitions of random variables and of conditional
expectation.) An adapted process is a sequence X = {X0,...,XT } such that
for each t, Xt is a random variable with respect to (Ω, Ft). Informally, this
means that at time t, the outcome of Xt is known. An adapted process X
is a martingale if, for any times t and s > t, we have Et(Xs) = Xt. As we
shall see, martingales are useful in the characterization of security prices. In
order to simplify things, for any two random variables Y and Z, we always
write Y = Z if the probability that Y 6= Z is zero.
2B Security Markets
A security is a claim to an adapted dividend process, say δ, with δt denoting
the dividend paid by the security at time t. Each security has an adapted
security-price process S, so that St is the price of the security, ex dividend, at
time t. That is, at each time t, the security pays its dividend δt and is then
available for trade at the price St. This convention implies that δ0 plays no
role in determining ex-dividend prices. The cum-dividend security price at
time t is St + δt.
Suppose there are N securities defined by the RN
-valued adapted dividend
process δ = (δ(1)
,...,δ(N)
). These securities have some adapted price process
S = (S(1)
,...,S(N)
). A trading strategy is an adapted process θ in RN
. Here,
θt = (θ
(1)
t ,...,θ
(N)
t ) represents the portfolio held after trading at time t. The
dividend process δθ
generated by a trading strategy θ is defined by
δθ
t = θt−1 · (St + δt) − θt · St, (1)
with “θ−1” taken to be zero by convention.
2C Arbitrage, State Prices, and Martingales
Given a dividend-price pair (δ,S) for N securities, a trading strategy θ is
an arbitrage if δθ
> 0. (The reader should become convinced that this is
the same notion of arbitrage defined in Chapter 1.) Let Θ denote the space
of trading strategies. For any θ and ϕ in Θ and scalars a and b, we have
aδθ
+ bδϕ
= δaθ+bϕ
. Thus the marketed subspace M = {δθ
: θ ∈ Θ} of
dividend processes generated by trading strategies is a linear subspace of the
space L of adapted processes.2C. Arbitrage, State Prices, and Martingales 31
Proposition. There is no arbitrage if and only if there is a strictly increas-
ing linear function F : L → R such that F(δθ
) = 0 for any trading strategy
θ.
Proof: The proof is almost identical to the first part of the proof of Theo-
rem 1A. Let L+ = {c ∈ L : c ≥ 0}. There is no arbitrage if and only if the
cone L+ and the marketed subspace M intersect precisely at zero. Suppose
there is no arbitrage. The Separating Hyperplane Theorem, in a form given
in Appendix B for cones, implies the existence of a nonzero linear functional
F such that F(x) < F(y) for each x in M and each nonzero y in L+. Since
M is a linear subspace, this implies that F(x) = 0 for each x in M, and
thus that F(y) > 0 for each nonzero y in L+. This implies that F is strictly
increasing. The converse is immediate.
The following result gives a convenient Riesz representation of a linear
function on the space of adapted processes. Proof is left as an exercise,
extending the single-period Riesz representation lemma of Section 1F.
Lemma. For each linear function F : L → R there is a unique π in L, called
the Riesz representation of F, such that
F(x) = E
T X
t=0
πtxt
!
, x ∈ L.
If F is strictly increasing, then π is strictly positive.
For convenience, we call any strictly positive adapted process a deflator.
A deflator π is a state-price deflator if, for all t,
St =
1
πt
Et
T X
j=t+1
πjδj
!
. (2)
For t = T, the right-hand side of (2) is zero, so ST = 0 whenever there is
a state-price deflator. The notion here of a state-price deflator is a natural
extension of that of Chapter 1. It can be shown as an exercise that a deflator
π is a state-price deflator if and only if, for any trading strategy θ,
θt · St =
1
πt
Et
T X
j=t+1
πjδθ
j
!
, t < T, (3)32 Chapter 2. Basic Multiperiod Model
meaning roughly that the market value of a trading strategy is, at any time,
the state-price discounted expected future dividends generated by the strat-
egy. The cum-dividend value process V θ
of a trading strategy θ is defined by
V θ
t = θt−1 · (St + δt). If π is a state-price deflator, we have
V θ
t =
1
πt
Et
T X
j=t
πjδθ
j
!
.
The gain process G for (δ,S) is defined by Gt = St +
Pt
j=1 δj. Given a
deflator γ, the deflated gain process Gγ
is defined by Gγ
t = γtSt +
Pt
j=1 γjδj.
We can think of deflation as a change of numeraire.
Theorem. The dividend-price pair (δ,S) admits no arbitrage if and only if
there is a state-price deflator. A deflator π is a state-price deflator if and
only if ST = 0 and the state-price-deflated gain process Gπ
is a martingale.
Proof: It can be shown as an easy exercise that that a deflator π is a state-
price deflator if and only if ST = 0 and the state-price-deflated gain process
Gπ
is a martingale.
Suppose there is no arbitrage. Then ST = 0, for otherwise the strategy
θ is an arbitrage when defined by θt = 0, t < T, θT = −ST . The previous
proposition implies that there is some strictly increasing linear function F :
L → R such that F(δθ
) = 0 for any strategy θ. By the previous lemma,
there is some deflator π such that F(x) = E(
PT
t=0 xtπt) for all x in L. This
implies that E(
PT
t=0 δθ
t πt) = 0 for any strategy θ.
We must prove (2), or equivalently, that Gπ
is a martingale. From Ap-
pendix A, an adapted process X is a martingale if and only if E(Xτ) = X0
for any finite-valued stopping time τ ≤ T. Consider, for an arbitrary security
n and an arbitrary finite-valued stopping time τ ≤ T, the trading strategy θ
defined by θ(k)
= 0 for k 6= n and θ
(n)
t = 1, t < τ, with θ
(n)
t = 0, t ≥ τ. Since
E(
PT
t=0 πtδθ
t ) = 0, we have
E −S
(n)
0 π0 +
τ X
t=1
πtδ
(n)
t + πτS(n)
τ
!
= 0,
implying that the deflated gain process Gnπ
of security n satisfies Gn,π
0 =
E (Gn,π
τ ). Since τ is arbitrary, Gn,π
is a martingale, and since n is arbitrary,
Gπ
is a martingale.
This shows that absence of arbitrage implies the existence of a state-price
deflator. The converse is easy.2D. Individual Agent Optimality 33
2D Individual Agent Optimality
We introduce an agent, defined by a strictly increasing utility function U
on the set L+ of nonnegative adapted “consumption” processes, and by an
endowment process e in L+. Given a dividend-price process (δ,S), a trading
strategy θ leaves the agent with the total consumption process e + δθ
. Thus
the agent has the budget-feasible consumption set
X = {e + δθ
∈ L+ : θ ∈ Θ},
and the problem
sup
c∈X
U(c). (4)
The existence of a solution to (4) implies the absence of arbitrage. Con-
versely, it can be shown as an exercise that if U is continuous, then the
absence of arbitrage implies that there exists a solution to (4). For pur-
poses of checking continuity or the closedness of sets in L, we will say that
cn converges to c if E[
PT
t=0 |cn(t) − c(t)|] → 0. Then U is continuous if
U(cn) → U(c) whenever cn → c.
Suppose that (4) has a strictly positive solution c∗
and that U is continu-
ously differentiable at c∗
. We can use the first-order conditions for optimal-
ity (which can be reviewed in Appendix B) to characterize security prices in
terms of the derivatives of the utility function U at c∗
. Specifically, for any c
in L, the derivative of U at c∗
in the direction c is the derivative g′
(0), where
g(α) = U(c∗
+αc) for any scalar α sufficiently small in absolute value. That
is, g′
(0) is the marginal rate of improvement of utility as one moves in the
direction c away from c∗
. This derivative is denoted ∇U(c∗
;c). Because U is
continuously differentiable at c∗
, c 7→ ∇U(c∗
,c) is linear function on L into
R. Since δθ
is a budget-feasible direction of change for any trading strategy
θ, the first-order conditions for optimality of c∗
imply that
∇U(c∗
;δθ
) = 0, θ ∈ Θ.
We now have a characterization of a state-price deflator.
Proposition. Suppose that (4) has a strictly positive solution c∗
and that U
has a strictly positive continuous derivative at c∗
. Then there is no arbitrage
and a state-price deflator is given by the Riesz representation π of ∇U(c∗
):
∇U(c∗
;x) = E
T X
t=0
πtxt
!
, x ∈ L.34 Chapter 2. Basic Multiperiod Model
Despite our standing assumption that U is strictly increasing, ∇U(c∗
; ·) need
not in general be strictly increasing, but is so if U is concave.
As an example, suppose U has the additive form
U(c) = E
" T X
t=0
ut(ct)
#
, c ∈ L+, (5)
for some ut : R+ → R, t ≥ 0. It is an exercise to show that if ∇U(c) exists,
then
∇U(c;x) = E
" T X
t=0
u′
t(ct)xt
#
. (6)
If, for all t, ut is concave with an unbounded derivative and e is strictly
positive, then any solution c∗
to (4) is strictly positive.
Corollary. Suppose U is defined by (5). Under the conditions of the Propo-
sition, for any times t and τ ≥ t,
St =
1
u′
t(c∗
t )
Et
"
Sτu′
τ(c∗
τ) +
τ X
j=t+1
δju′
j(c∗
j)
#
.
For the case τ = t+1, this result is often called the stochastic Euler equation.
Extending this classical result for additive utility, the exercises include other
utility examples such as habit-formation utility and recursive utility. As in
Chapter 1, we now turn to the multi-agent case.
2E Equilibrium and Pareto Optimality
Suppose there are m agents; agent i is defined as above by a strictly in-
creasing utility function Ui : L+ → R and an endowment process ei
∈ L+.
Given a dividend process δ for N securities, an equilibrium is a collection
(θ(1)
,...,θ(m
),S), where S is a security-price process and, for each i, θi
is a
trading strategy solving
sup
θ∈Θ
Ui(c) subject to c = ei
+ δθ
∈ L+, (7)
with
Pm
i=1 θi
= 0.
We define markets to be complete if, for each process x in L, there is some
trading strategy θ with δθ
t = xt, t ≥ 1. Complete markets thus means that2F. Equilibrium Asset Pricing 35
any consumption process x can be obtained by investing some amount at
time 0 in a trading strategy that generates the dividend xt in each period t
after 0. With the same definition of Pareto optimality, Proposition 1D carries
over to this multiperiod setting. Any equilibrium (θ(1)
,...,θ(m)
,S) has an
associated feasible consumption allocation (c(1)
,...,c(m)
) defined by letting
ci
− ei
be the dividend process generated by θi
.
Proposition. Suppose (θ(1)
,...,θ(m)
,S) is an equilibrium and markets are
complete. Then the associated consumption allocation is Pareto optimal.
The completeness of markets depends on the security-price process S
itself. Indeed, the dependence of the marketed subspace on S makes the
existence of an equilibrium a nontrivial issue. We ignore existence here and
refer to the Notes for some relevant sources.
2F Equilibrium Asset Pricing
Again following the ideas in Chapter 1, we define for each λ in Rm
+ the utility
function Uλ : L+ → R by
Uλ(x) = sup
(c(1),...,c(m))
m X
i=1
λi Ui(ci
) subject to c(1)
+ ··· + c(m)
≤ x. (8)
Proposition. Suppose for all i that Ui is concave and strictly increasing.
Suppose that (θ(1)
,...,θ(m)
,S) is an equilibrium and that markets are com-
plete. Then there exists some nonzero λ ∈ Rm
+ such that (0,S) is a (no-trade)
equilibrium for the one-agent economy [(Uλ,e),δ], where e = e(1)
+···+e(m)
.
With this λ and with x = e = e(1)
+ ··· + e(m)
, problem (8) is solved by the
equilibrium consumption allocation.
Proof is assigned as an exercise. The result is essentially the same as Propo-
sition 1E. A method of proof, as well as the intuition for this proposition,
is that with complete markets, a state-price deflator π represents Lagrange
multipliers for consumption in the various periods and states for all of the
agents simultaneously, as well as for the representative agent (Uλ,e).
Corollary 1. If, moreover, Uλ is differentiable at e, then λ can be chosen
so that for any times t and τ ≥ t, there is a state-price deflator π equal to
the Riesz representation of ∇Uλ(e).
Differentiability of Uλ at e can be shown by exactly the arguments used in
Exercise 1.10.36 Chapter 2. Basic Multiperiod Model
Corollary 2. Suppose for each i that Ui is of the additive form
Ui(c) = E
" T X
t=0
uit(ct)
#
.
Then Uλ is also additive, with
Uλ(c) = E
" T X
t=0
uλt(ct)
#
,
where
uλt(y) = sup
x∈Rm
+
m X
i=1
λi uit(xi) subject to x1 + ··· + xm ≤ y.
In this case, the differentiability of Uλ at e implies that for any times t and
τ ≥ t,
St =
1
u′
λt(et)
Et
"
u′
λτ(eτ)Sτ +
τ X
j=t+1
u′
λj(ej)δj
#
. (9)
2G Arbitrage and Martingale Measures
This section shows the equivalence between the absence of arbitrage and the
existence of a probability measure Q with the property, roughly speaking,
that the price of a security is the sum of Q-expected discounted dividends.
There is short-term riskless borrowing if, for each given time t < T if there
is a security trading strategy θ with δθ
t+1 = 1 and with δθ
s = 0 for s < t and
s > t+1. The associated discount is dt = θt ·St. If there is no arbitrage, the
discount dt is uniquely defined and strictly positive, and we may define the
associated short-rate rt by 1+rt = 1/dt. This means that at any time t < T,
one may invest one unit of account in order to receive 1+rt units of account
at time t + 1. We refer to {r0,r1,...,rT−1} as the associated “short-rate
process,” even though rT is not defined.
Let us suppose throughout this section that there is short-term riskless
borrowing at some uniquely defined short-rate process r. We can define, for
any times t and τ < T,
Rt,τ = (1 + rt)(1 + rt+1)···(1 + rτ−1),2G. Arbitrage and Martingale Measures 37
the payback at time τ of one unit of account borrowed risklessly at time t
and rolled over in short-term borrowing repeatedly until date τ.
It would be a simple situation, both computationally and conceptually,
if any security’s price were merely the expected discounted dividends of the
security. Of course, this is unlikely to be the case in a market with risk-averse
investors. We can nevertheless come close to this sort of characterization of
security prices by adjusting the original probability measure P. For this, we
define a new probability measure Q to be equivalent to P if Q and P assign
zero probabilities to the same events. An equivalent probability measure Q
is an equivalent martingale measure if
St = EQ
t
T X
j=t+1
δj
Rt,j
!
, t < T,
where EQ
denotes expectation under Q, and likewise EQ
t (x) = EQ
(x|Ft) for
any random variable x.
It is easy to show that Q is an equivalent martingale measure if and only
if, for any trading strategy θ,
θt · St = EQ
t
T X
j=t+1
δθ
j
Rt,j
!
, t < T. (10)
If interest rates are deterministic, (10) is merely the total discounted expected
dividends, after substituting Q for the original measure P. We will show
that the absence of arbitrage is equivalent to the existence of an equivalent
martingale measure.
The deflator γ defined by γt = R−1
0,t defines the discounted gain process
Gγ
. The word “martingale” in the term “equivalent martingale measure”
comes from the following equivalence.
Lemma. A probability measure Q equivalent to P is an equivalent martin-
gale measure for (δ,S) if and only if ST = 0 and the discounted gain process
Gγ
is a martingale with respect to Q.
We already know from Theorem 2C that the absence of arbitrage is equiv-
alent to the existence of a state-price deflator π. Fixing π, let Q be the prob-
ability measure defined, as explained in Appendix A, by the Radon-Nikodym
derivative given by
ξT =
πT R0,T
π0
.38 Chapter 2. Basic Multiperiod Model
That is, Q is defined by letting EQ
(Z) = E(ξTZ) for any random variable Z.
Because ξT is strictly positive, Q and P are equivalent probability measures.
The density process ξ for Q is defined by ξt = Et(ξT ). Relation (A.2) of
Appendix A implies that for any times t and j > t and any Fj-measurable
random variable Zj,
EQ
t (Zj) =
1
ξt
Et(ξjZj). (11)
Fixing some time t < T, consider a trading strategy θ that invests one
unit of account at time t and repeatedly rolls the value over in short-term
riskless borrowing until time T, with final value Rt,T . That is, θt ·St = 1 and
δθ
T = Rt,T . Relation (3) then implies that
πt = Et(πT Rt,T ) =
Et(πT R0,T )
R0,t
=
Et(ξTπ0)
R0,t
=
ξtπ0
R0,t
. (12)
From (11), (12), and the definition of a state-price deflator, (10) is satisfied, so
Q is indeed an equivalent martingale measure. We have shown the following
result.
Theorem. There is no arbitrage if and only if there exists an equivalent
martingale measure. Moreover, π is a state-price deflator if and only if an
equivalent martingale measure Q has the density process ξ defined by ξt =
R0,tπt/π0.
Proposition. Suppose that FT = F and there is no arbitrage. Then markets
are complete if and only if there is a unique equivalent martingale measure.
Proof: Suppose that markets are complete and let Q1 and Q2 be two equiv-
alent martingale measures. We must show that Q1 = Q2. Let A be any
event. Since markets are complete, there is a trading strategy θ with divi-
dend process δθ
such that δθ
T = R0,T 1A and δθ
t = 0, 0 < t < T. By (10), we
have θ0 · S0 = Q1(A) = Q2(A). Since A is arbitrary, Q1 = Q2.
Exercise 2.18 outlines a proof of the converse part of the result.
This martingale approach simplifies many asset-pricing problems that
might otherwise appear to be quite complex, such as the American option-
pricing problem to follow in Section 2I. This martingaleapproach also applies
much more generally than indicated here. For example, the assumption of
short-term borrowing is merely a convenience. More generally, one can typ-
ically obtain an equivalent martingale measure after normalizing prices and
dividends by the price of some particular security (or trading strategy).2H. Valuation of Redundant Securities 39
2H Valuation of Redundant Securities
Suppose that the given dividend-price pair (δ,S) is arbitrage-free, with an
associated state-price deflator π. Now consider the introduction of a new
security with dividend process δ̂ and price process Ŝ. We say that δ̂ is
redundant given (δ,S) if there exists a trading strategy θ, with respect to
only the original security dividend-price process (δ,S), that replicates δ̂, in
the sense that δθ
t = δ̂t, t ≥ 1. In this case, the absence of arbitrage for the
“larger” dividend-proce process [(δ,δ̂),(S,Ŝ)] implies that
Ŝt = Yt ≡
1
πt
Et
T X
j=t+1
πjδ̂j
!
, t < T.
If this were not the case, there would be an arbitrage, as follows. For example,
suppose that for some stopping time τ, we have Ŝτ > Yτ, and that τ ≤ T
with strictly positive probability. We can then define the strategy:
(a) Sell the redundant security δ̂ at time τ for Ŝτ, and hold this position
until T.
(b) Invest θτ · Sτ at time τ in the replicating strategy θ, and follow this
strategy until T.
Since the dividends generated by this combined strategy (a)–(b) after τ are
zero, the only dividend is at τ for the amount Ŝτ −Yτ > 0, which means that
this is an arbitrage. Likewise, if Ŝτ < Yτ for some finite-valued stopping time
τ, the opposite strategy is an arbitrage. We have shown the following.
Proposition. Suppose (δ,S) is arbitrage-free with state-price deflator π. Let
δ̂ be a redundant dividend process with price process Ŝ. Then the combined
dividend-price pair [(δ,δ̂),(S,Ŝ)] is arbitrage-free if and only if it has π as a
state-price deflator.
In applications, it is often assumed that (δ,S) generates complete mar-
kets, in which case any additional security is redundant. Exercise 2.1 gives a
classical example in which the redundant security is an option on one of the
original securities.40 Chapter 2. Basic Multiperiod Model
2I American Exercise Policies and Valuation
We will now extend our pricing framework to include a family of securities,
called “American,” for which there is discretion regarding the timing of cash
flows.
Given an adapted process X, each finite-valued stopping time τ generates
a dividend process δX,τ
defined by δX,τ
t = 0, t 6= τ, and δX,τ
τ = Xτ. In this
context, a finite-valued stopping time is an exercise policy, determining the
time at which to accept payment. Any exercise policy τ is constrained by
τ ≤ τ, for some expiration time τ ≤ T. (We may take τ to be a stopping time
in the following, which is usfeul for the case of certain knockout options, as
shown for example in Exercise 2.1.) We say that (X,τ) defines an American
security. The exercise policy is selected by the holder of the security. Once
exercised, the security has no remaining cash flows. A standard example is
an American put option on a security with price process p. The American
put gives the holder of the option the right, but not the obligation, to sell
the underlying security for a fixed exercise price at any time before a given
expiration time τ. If the option has an exercise price K and expiration time
τ < T, then Xt = (K − pt)+
, t ≤ τ, and Xt = 0, t > τ.
We will suppose that in addition to an American security (X,τ), there are
securities with an arbitrage-free dividend-price process (δ,S) that generates
complete markets. The assumption of complete markets will dramatically
simplify our analysis since it implies, for any exercise policy τ, that the
dividend process δX,τ
is redundant given (δ,S). For notational convenience,
we assume that 0 < τ < T.
Let π be a state-price deflator associated with (δ,S). From Proposition
2H, given any exercise policy τ, the American security’s dividend process δX,τ
has an associated cum-dividend price process, say V τ
, which, in the absence
of arbitrage, satisfies
V τ
t =
1
πt
Et (πτXτ), t ≤ τ.
This value does not depend on which state-price deflator is chosen because,
with complete markets, state-price deflators are all equal up to a positive
rescaling, as one can see from the theorem and proposition of Section 2G.
We consider the optimal stopping problem
V ∗
0 ≡ max
τ∈T (0)
V τ
0 , (13)2I. American Exercise Policies and Valuation 41
where, for any time t ≤ τ, we let T (t) denote the set of stopping times
bounded below by t and above by τ. A solution to (13) is called a rational
exercise policy for the American security X, in the sense that it maximizes
the initial arbitrage-free value of the security.
We claim that in the absence of arbitrage, the actual initial price V0
for the American security must be V ∗
0 . In order to see this, suppose first
that V ∗
0 > V0. Then one could buy the American security, adopt for it a
rational exercise policy τ, and also undertake a trading strategy replicating
−δX,τ
. Since V ∗
0 = E(πτXτ)/π0, this replication involves an initial payoff of
−δX,τ
0 = V ∗
0 , and the net effect is a total initial dividend of V ∗
0 − V0 > 0 and
zero dividends after time 0, which defines an arbitrage. Thus the absence of
arbitrage easily leads to the conclusion that V0 ≥ V ∗
0 . It remains to show
that the absence of arbitrage also implies the opposite inequality V0 ≤ V ∗
0 .
Suppose that V0 > V ∗
0 . One could sell the American security at time 0
for V0. We will show that for an initial investment of V ∗
0 , one can “super-
replicate” the payoff at exercise demanded by the holder of the American
security, regardless of the exercise policy used. Specifically, a super-replicating
trading strategy for (X,τ,δ,S) is a trading strategy θ involving only the
securities with dividend-price process (δ,S) that has the properties:
(a) δθ
t = 0 for 0 < t < τ, and
(b) V θ
t ≥ Xt for all t ≤ τ,
where, we recall, V θ
t is the cum-dividend value of θ at time t. Regardless of
the exercise policy τ used by the holder of the security, the payment of Xτ
demanded at time τ is covered by the market value V θ
t of a super-replicating
strategy θ. (In effect, one modifies θ by liquidating the portfolio θτ at time τ,
so that the actual trading strategy ϕ associated with the arbitrage is defined
by ϕt = θt for t < τ and ϕt = 0 for t ≥ τ.) By these properties (a)–(b), if
V0 > V ∗
0 then the strategy of selling the American security and adopting a
super-replicating strategy is an arbitrage provided V θ
0 = V ∗
0 .
This notion of arbitrage for American securities, an extension of the no-
tion of arbitrage used earlier in the chapter, is reasonable because a super-
replicating strategy does not depend on the exercise policy adopted by the
holder (or sequence of holders over time) of the American security. It would
be unreasonable to call a strategy involving a short position in the American
security an “arbitrage” if, in carrying it out, one requires knowledge of the42 Chapter 2. Basic Multiperiod Model
•
•
•
Z
W
Y
τ 0
¯ τ
discounted value
(exercise) (expiration)
time
(deflated price)
(Snell Envelope)
Y
Figure2.1: Snell Envelope and Optimal Stopping Rule: Deterministic Case
exercise policy for the American security that will be adopted by other agents
that hold the security over time, who may after all act “irrationally.”
Proposition. There is a super-replicating trading strategy θ for (X,τ,δ,S)
with the initial value V θ
0 = V ∗
0 .
In order to construct a super-replicating strategy, we will make a short
excursion into the theory of optimal stopping. For any process Y in L, Snell
envelope W of Y is defined by
Wt = max
τ∈T (t)
Et(Yτ), 0 ≤ t ≤ τ.
It can be shown as an exercise that for any t < τ, Wt = max[Yt,Et(Wt+1)].
Thus Wt ≥ Et(Wt+1), implying that W is a supermartingale, meaning that
we can decompose W in the form W = Z−A for some martingale Z and some
increasing adapted process A with A0 = 0. This decomposition is illustrated
in Figure 2.1 for the case in which Y is a deterministic process, which implies
that W, Z, and A are also deterministic.
We take Y to be defined by Yt = Xtπt, and let W, Z, and A be defined
as above. By the definition of complete markets, there is a trading strategy
θ with the property that2I. American Exercise Policies and Valuation 43
• δθ
t = 0 for 0 < t < τ;
• δθ
τ = Zτ/πτ;
• δθ
t = 0 for t > τ.
Property (a) of a super-replicating strategy is satsifed by this strategy θ.
From the fact that Z is a martingale and the definition of a state-price
deflator, the cum-dividend value V θ
of the trading strategy θ satisfies
πtV θ
t = Et(πτδθ
τ) = Et(Zτ) = Zt, t ≤ τ. (14)
From (14) and the fact that A0 = 0, we know that V θ
0 = V ∗
0 because Z0 =
W0 = π0V ∗
0 . Since Zt − At = Wt ≥ Yt for all t, from (14) we also know that
V θ
t =
Zt
πt
≥
1
πt
(Yt + At) = Xt +
At
πt
≥ Xt, t ≤ τ,
the last inequality following from the fact that At ≥ 0 for all t. Thus property
(b) is also satisfied, and θ is indeed a super-replicating strategy with V θ
0 = V ∗
0 .
This proves the proposition and implies that unless there is an arbitrage, the
initial price V0 of the American security is equal to the market value V ∗
0
associated with a rational exercise policy.
The Snell envelope W is also the key to finding a rational exercise policy.
As for the deterministic case illustrated in Figure 2.1, a rational exercise
policy is given by τ0
= min{t : Wt = Yt}. We now show the optimality of τ0
.
First, we know that if τ is a rational exercise policy, then Wτ = Yτ. (This
can be seen from the fact that Wτ ≥ Yτ, and if Wτ > Yτ then τ cannot be
rational.) From this fact, any rational exercise policy τ has the property that
τ ≥ τ0
. For any such τ, we have
Eτ0[Y (τ)] ≤ W(τ0
) = Y (τ0
),
and the law of iterated expectations implies that E[Y (τ)] ≤ E[Y (τ0
)], so τ0
is rational.
We have shown the following.
Theorem. Given (X,τ,δ,S), suppose, for each τ ≤ τ, that δX,τ
is redun-
dant. Suppose there is a state-price deflator π for (δ,S), and let W be the
Snell envelope of Xπ up to the expiration time τ. Then a rational exercise44 Chapter 2. Basic Multiperiod Model
policy for (X,τ,δ,S) is given by τ0
= min{t : Wt = πtXt}. The unique initial
arbitrage-free price process of of the American security is
V ∗
0 =
1
π0
E

X(τ0
)π(τ0
)

.
2J Is Early Exercise Optimal?
With the equivalent martingale measure Q defined in Section 2G, we can
also write the optimal stopping problem (13) in the form
V ∗
0 = max
τ∈T (0)
EQ

Xτ
R0,τ

. (15)
This representation of the rational exercise problem is sometimes convenient.
For example, let us consider the case of an American call option on a security
with price process p. We have Xt = (pt − K)+
for some exercise price K.
Suppose the underlying security has no dividends before or at the expiration
time τ. We suppose positive interest rates, meaning that Rt,s ≥ 1 for all t
and s ≥ t. With these assumptions, we will show that it is never optimal
to exercise the call option before its expiration date τ. This property is
sometimes called “no early exercise,” or “better alive than dead.”
We define the “discounted price process” p∗
by p∗
t = pt/R0,t. The fact
that the underlying security pays dividends only after the expiration time τ
implies, by Lemma 2G, that p∗
is a Q-martingale at least up to the expiration
time τ. That is, for t ≤ s ≤ τ, we have EQ
t (p∗
s) = p∗
t .
Jensen’s Inequality can be used to show the following fact about convex
functions of martingales, which we will use to obtain conditions for the no-
early-exercise result.
Lemma. Suppose f : R×R → R is convex with respect to its first argument,
Y is a martingale, τ(1) and τ(2) are two stopping times with τ(2) ≥ τ(1),
and Z is an adapted process. Then f(Yτ(1),Zτ(1)) ≤ Eτ(1)[f(Yτ(2),Zτ(1))].
Moreover, the law of iterated expectations implies that E[f(Yτ(1),Zτ(1))] ≤
E[f(Yτ(2),Zτ(1))].
With the benefit of this lemma and positive interest rates, we have, for any
stopping time τ ≤ τ,
EQ

1
R0,τ
(pτ − K)+

= EQ
"
p∗
τ −
K
R0,τ
+
#2J. Is Early Exercise Optimal? 45
≤ EQ
"
p∗
τ −
K
R0,τ
+
#
≤ EQ
"
p∗
τ −
K
R0,τ
+
#
= EQ

1
R0,τ
(pτ − K)+

.
It follows that τ is a rational exercise policy. In typical cases, τ is the unique
rational exercise policy.
If the underlying security pays dividends before expiration, then early
exercise of the American call is, in certain cases, optimal. From the fact
that the put payoff is increasing in the strike price (as opposed to decreasing
for the call option), the second inequality above is reversed for the case of
a put option, and one can guess that early exercise of the American put is
sometimes optimal.
Exercise 2.1 gives a simple example of American security valuation in
a complete-markets setting. Chapter 3 presents the idea in a Markovian
setting, which offers computational advantages in solving for the rational ex-
ercise policy and market value of American securities. In Chapter 3 we also
consider the case of American securities that offer dividends before expira-
tion.
The real difficulties with analyzing American securities begin with incom-
plete markets. In that case, the choice of exercise policy may play a role in
determining the marketed subspace, and therefore a role in pricing securities.
If the state-price deflator depends on the exercise policy, it could even turn
out that the notion of a rational exercise policy is not well defined.
Exercises
Exercise 2.1 Suppose in the setting of Section 2B that S is the price
process of a security with zero dividends before T. We assume that
St+1 = StHt+1; t ≥ 0; S0 > 0,
where H is an adapted process such that for allt ≥ 1, Ht has only two possible
outcomes U > 0 and D > 0, each with positive conditional probability given
Ft−1. Suppose β is the price process of a security, also with no dividends46 Chapter 2. Basic Multiperiod Model
before T, such that
βt+1 = βtR; t ≥ 1; β0 > 0,
where R > 1 is a constant. We can think of β as the price process of a
riskless bond. Consider a third security, a European call option on S with
expiration at some fixed date τ < T and exercise price K ≥ 0. This means
that the price process Cτ
of the third security has expiration value
Cτ
τ = (Sτ − K)+
≡ max(Sτ − K,0),
with Cτ
t = 0, t > τ. That is, the option gives its holder the right, but not
the obligation, to purchase the stock at time τ at price K.
The absence of arbitrage implies that U = R = D, or that U > R > D.
We will assume the latter (non-degeneracy of retruns) for the remainder of
the exercise.
(A) Assuming no arbitrage, show that for 0 ≤ t < τ,
Cτ
t =
1
Rτ−t
τ−t X
i=0
b(i;τ − t,p)(Ui
Dτ−t−i
St − K)+
, (16)
where p = (R − D)/(U − D) and where
b(i;n,p) =
n!
i!(n − i)!
pi
(1 − p)n−i
(17)
is the probability of i successes, each with probability p, out of n independent
binomial trials. One can thus view (16) as the discounted expected exercise
value of the option, with expectation under some probability measure con-
structed from the stock and bond returns. In order to model this viewpoint,
let Ŝ be the process defined by
Ŝt+1 = ŜtĤt+1; t ≥ 0; Ŝ0 = S0, (18)
where {Ĥ0,Ĥ1,...} is a sequence of independent random variables with out-
comes U and D of probability p and 1 − p, respectively. Then (18) implies
that
Cτ
0 = E
"
(Ŝτ − K)+
Rτ
#
. (19)2J. Is Early Exercise Optimal? 47
(B) We take it that F is the filtration generated by the return process H,
meaning that for all t ≥ 1, Ft is the tribe generated by {H1,...,Ht}. We
extend the definition of the option described in part (A) by allowing the
expiry date τ to be a stopping time. Show that (19) is still implied by the
absence of arbitrage.
(C) An American call option with expiration date τ < T is merely an option
of the form described in part (A), with the exception that the exercise date τ
is a finite-valued stopping time selected by the holder of the option from the
set T (0) of all stopping times bounded by τ. Show that the rational exercise
problem
sup
τ∈T (0)
Cτ
0 (20)
is solved by τ = τ. In other words, the holder of the American call option
maximizes its value by holding the option to expiration. Hint: Jensen’s
Inequality states that for f a convex function, X a random variable on
(Ω,F,P), and G a sub-tribe of F, we have E[f(X) | G] ≥ f[E(X | G)]. (D)
Show that the unique arbitrage-free price of the American call described in
part (C) is at any time t equal to Cτ
t , which is the corresponding European
call price. (E) Now let τ be a stopping time. Show that the price of an
American call option that expires at τ is given by (19), for τ = τ.
(F) A European put option is defined just as is the European call, with the
exception that the exercise value is (K−Sτ)+
rather than (Sτ −K)+
. That is,
the put gives its holder the right, but not the obligation, to sell (rather than
buy) the stock at τ for the exercise price K. Let Fτ
denote the European
put price process for expiration at τ. The American put with expiration τ,
analogous to the case of calls, has an exercise date τ selected by the holder
from the set T (0) of stopping times bounded by τ. Show by counterexample
that the problem
sup
τ∈T (0)
Fτ
0 (21)
is not, in general, solved by τ = τ, and that the arbitrage-free American put
price process is not generally the same as the corresponding arbitrage-free
European put price process Fτ
, contrary to the case of American call options
on stocks with no dividends before expiration. An easy algorithm for com-
puting the value of the American put in this setting is given in Chapter 3.
(G) Show that markets are complete. (H) The moneyness of a call op-48 Chapter 2. Basic Multiperiod Model
tion with expiration at a deterministic time τ < T and with strike price
K is (S0Rτ
− K)/K. If the moneyness is positive, the option is said to be
in the money. If the moneyness is negative, the option is said to be out of
the money. If the moneyness is zero, the option is said to be at the money.
For a put option with same strike K and expiration time τ, the moneyness
is (K − S0Rτ
)/K (minus the call moneyness), and the same terms apply.
Let S0 = 100, U = 1.028, R = 1.001, and D = 0.978. Plot (or tabulate)
the price of European call and American call and put options, with expira-
tion at τ = 100, against moneyness. (I) For the parameters in Part (H),
suppose that up and down returns for the stock are equally likely in each
period, and that one time period represents 0.01 years. Compute the annu-
alized continuously compounding interest rate r, and the mean and standard
deviation of the annual return ρ = (logS100 − logS0)/100. Plot the likeli-
hood of ρ as a frequency diagram, that is, showing the probability of each
outcome of ρ above that outcome. (J) A barrier option is one that can
be exercised or not depending on whether or not the underlying price has
crossed a given level before expiration. For example, a down-and-out call,
at barrier S, exercise time τ (possibly a stopping time), and exercise price
K ≥ S, is a security that pays 1A(Sτ − K)+
at τ, where A is the event
{ω : min{S0(ω),S1(ω),...,Sτ(ω)(ω)} > S}. That is, A is the event that the
minimum price achieved through τ is larger than the barrier S. Show that
an American down-and-out call, exercisable at any time τ ≤ τ, is rationally
exercised (if at all) only at τ. (K) For the parameters in Part (H), and
τ = 100, price a down-and-out call with barrier S = 80, for strikes K from
80 to 120. Plot (or, if you can’t, tabulate) the prices for integer K in this
range. (L) For the parameters in Part (H), price European and American
up-and-out put options, with knock-out barrier S = 120. Again, obtain the
prices for strikes ranging from 80 to 120. Plot (or, if you can’t, tabulate) the
prices for integer K in this range. For the special case of K = 100, plot the
optimal exercise region for the American up-and-out put. That is, for each
t ≤ 100, show the set of outcomes for St at which it is optimal to exercise at
time t.
Exercise 2.2 Suppose in the context of problem (4) that (δ,S) admits no
arbitrage and that U is continuous. Show the existence of a solution. Hint:
A continuous function on a compact set has a maximum. In this setting, a
set is compact if closed and bounded.2J. Is Early Exercise Optimal? 49
Exercise 2.3 Suppose in the context of problem (4) that e ≫ 0 and that U
has the additive form (5), where for each t, ut is concave with an unbounded
derivative. Show that any solution c∗
is strictly positive. Show that the
same conclusion follows if the assumption that e ≫ 0 is replaced with the
assumption that markets are complete and that e is not zero.
Exercise 2.4 Prove Lemma 2C. Hint: For any x and y in L, let
(x | y) = E
T X
t=0
xtyt
!
.
Then follow the hint given for Exercise 1.17, remembering that we write
x = y whenever xt = yt for all t almost surely.
Exercise 2.5 For U of the additive form (5), show that the gradient ∇U(c),
if it exists, is represented as in (6).
Exercise 2.6 Suppose (c(1)
,...,c(m)
) is a strictly positive equilibrium con-
sumption allocation and that for all i, Ui is of the additive form: Ui(c) =
E[
PT
t=0 uit(ct)]. Assume there is a constant c larger than ci
t for all i and t
such that for all i and t, uit(x) = Aitx − Bitx2
, x ≤ c, for some positive
constants Ait and Bit. That is, utility is quadratic in the relevant range.
(A) In the context of Corollary 2 of Section 2F, show that for each t, there
are some constants kt and Kt such that u′
λt(et) = kt + Ktet. Suppose for a
given trading strategy θ and time t that the following are well defined:
• Rθ
t = θt−1 · (St + δt)/θt−1 · St−1, the return on θ at time t;
• RM
t , the return at time t on a strategy ϕ maximizing corrt−1(Rϕ
t ,et),
where corrt(·) denotes Ft-conditional correlation;
• βθ
t−1 = covt−1(Rθ
t ,RM
t )/vart−1(RM
t ), the conditional beta of the trading
strategy θ with respect to the market return, where covt(·) denotes Ft-
conditional covariance and vart(·) denotes Ft-conditional variance;
• R0
t , the return at time t on a strategy η with corrt−1(Rη
t ,et) = 0.
Derive the following beta-form of the consumption-based CAPM:
Et−1(Rθ
t − R0
t ) = βθ
t−1Et−1(RM
t − R0
t ). (22)50 Chapter 2. Basic Multiperiod Model
(B) Prove the same beta-form (22) of the CAPM holds in equilibrium even
without assuming complete markets.
(C) Extend the state-price beta model of Section 1F to this setting, as
follows, without using the assumptions of the CAPM. Let π be a state-price
deflator. For each t, suppose R∗
t is the return on a trading strategy solving
sup
θ
corrt−1(Rθ
t ,πt).
Assume that vart−1(R∗
t ) is nonzero almost surely. Show that for any return
Rθ
t ,
Et−1(Rθ
t − R0
t ) = βθ
t−1Et−1(R∗
t − R0
t ), (23)
where βθ
t−1 = covt−1(Rθ
t ,R∗
t )/vart−1(R∗
t ) and corrt−1(R0
t ,πt) = 0.
Exercise 2.7 Prove Proposition 2E.
Exercise 2.8 In the context of Section 2D, suppose that U is the habit-
formation utility function defined by U(c) = E[
PT
t=0 u(ct,ht)], where u :
R+ ×R → R is continuously differentiable on the interior of its domain and,
for any t, the “habit” level of consumption is defined by ht =
Pt
j=0 αjct−j
for some α ∈ RT
. For example, we could take αj = γj
for γ ∈ (0,1), which
gives geometrically declining weights on past consumption. Calculate the
Riesz representation of the gradient of U at a strictly positive consumption
process c.
Exercise 2.9 Consider a utility function U defined by U(c) = V0, where
the utility process V is defined recursively, backward from T in time, by
VT = J(cT ,h(0)) and, for t < T, by Vt = J(ct,Et[h(Vt+1)]), where J :
R+ × R → R is increasing and continuously differentiable on the interior of
its domain and h : R → R is increasing and continuously differentiable. This
is a special case of what is known as recursive utility, and also a special case
of what is known as Kreps-Porteus utility. Note that the utility function
can depend nontrivially on the filtration F, which is not true for additive or
habit-formation utility functions. This utility model is reconsidered in an
exercise in Chapter 3.
(A) Compute the Riesz Representation π of the gradient of U at a strictly
positive consumption process c.
(B) Suppose that h and J are concave and increasing functions. Show that
U is concave and increasing.2J. Is Early Exercise Optimal? 51
Exercise 2.10 In the setting of Section 2E, an Arrow-Debreu equilib-
rium is a feasible consumption allocation (c(1)
,...,c(m)
) and a nonzero linear
function Ψ : L → R such that for all i, ci
solves maxc∈L+ Ui(c) subject to
Ψ(ci
) ≤ Ψ(ei
). Suppose that (c(1)
,...,c(m)
) and Ψ form an Arrow-Debreu
equilibrium and that π is the Riesz representation of Ψ. Let S be defined
by ST = 0 and by taking π to be a state-price deflator. Suppose, given
(δ,S), that markets are complete. Show the existence of trading strategies
θ(1)
,...,θ(m)
such that (θ(1)
,...,θ(m)
,S) is an equilibrium with the same con-
sumption allocation (c(1)
,...,c(m)
).
Exercise 2.11 Given a finite set Ω of states, a partition of Ω is a collection
of disjoint nonempty subsets of Ω whose union is Ω. For example, a partition
of {1,2,3} is given by {{1},{2,3}}. The tribe on a finite set Ω generated by
a given partition p of Ω, denoted σ(p), is the smallest tribe F on Ω such that
p ⊂ F. Conversely, for any tribe F on Ω, the partition P(F) generated by F
is the smallest partition p of Ω such that F = σ(p). For instance, the tribe
{∅,Ω,{1},{2,3}} is generated by the partition in the above example. Since
partitions and tribes on a given finite set Ω are in one-to-one correspondence,
we could have developed the results of Chapter 2 in terms of an increasing
sequence p0,p1,...,pT of partitions of Ω rather than a filtration of tribes,
F0,F1,...,FT. (In the infinite-state models of Part II, however, it is more
convenient to use tribes than partitions.)
Given a subset B of Ω and a partition p of Ω, let n(B,p) denote the
minimum number of elements of p whose union contains B. In a sense, this
is the number of distinct nonempty events that might occur if B is to occur.
For t < T, let
nt = max
B∈pt
n(B,pt+1).
Finally, the spanning number of the filtration F generated by p0,...,pT is
n(F) ≡ maxt<T nt. In a sense, n(F) is the maximum number of distinct
events that could be revealed between two periods.
Show that complete markets requires at least n(F) securities, and that
given the filtration F, there exists a set of n(F) dividend processes and asso-
ciated arbitrage-free security-price processes such that markets are complete.
This issue is further investigated in sources indicated in the Notes.
Exercise 2.12 Given securities with a dividend-price pair (δ,S), extend
Theorem 2G to show, in the presence of riskless borrowing at a strictly
positive discount at each date, the equivalence of these statements:52 Chapter 2. Basic Multiperiod Model
(a) There exists a state-price deflator.
(b) There exists a deflator π such that (3) holds for any trading strategy θ.
(c) ST = 0 and there exists a deflator π such that the deflated gain process
Gπ
is a martingale.
(d) There is no arbitrage.
(e) There is an equivalent martingale measure.
Exercise 2.13 Show, from (11) and (12), that (10) is indeed satisfied,
confirming that Q is an equivalent martingale measure.
Exercise 2.14 Show, as claimed in Section 2I, that if τ∗
is a rational
exercise policy for the American security X and if V ∗
is the cum-dividend
price process for the American security with this rational exercise policy,
then V ∗
τ ≥ Xτ for any stopping time τ ≤ τ∗
.
Exercise 2.15 (Aggregation Revisited) Suppose, in the context of the
supremum (8), that x ≫ 0 and, for all i, Ui(c) = E[
PT
t=0 ut(ct)], where, for
all t, ut(x) = ktxγ(t)
/γ(t), where kt and γ(t) < 1, γ(t) 6= 0, are constants
(depending on t).
(A) Show that Uλ is of the same utility form as Ui.
(B) Suppose that γ(t) is a constant independent of t. Replace the assumption
of complete markets in Proposition 2F with the assumption that e ≫ 0 and
that, for all i, there is a security whose dividend process is ei
. (This can easily
be weakened.) Demonstrate the existence of an equilibrium with the same
properties described in Proposition 2F, including a consumption allocation
that is Pareto optimal.
Exercise 2.16 (Put-Call Parity) In the general setting explained in Sec-
tion 2B, suppose there exist the following securities:
(a) a “stock,” with price process X;
(b) a European call option on the stock with strike price K and expiration
τ;2J. Is Early Exercise Optimal? 53
(c) a European put option on the stock with strike price K and expiration
τ;
(d) a τ-period zero-coupon riskless bond.
Let X0, C0, P0, and B0 denote the initialrespective prices of the securities.
Suppose there is no arbitrage, and that the stock pays no dividends before
time τ. Solve for C0 explicitly in terms of X0, P0, and B0.
Exercise 2.17 (Futures-Forward Price Equivalence) This exercise de-
fines (in ideal terms) a forward contract and a futures contract, and gives
simple conditions under which the futures price and the forward price co-
incide. We adopt the setting of Section 2B, in the absence of arbitrage.
Fixed throughout are a delivery date τ and a settlement amount Wτ (an
Fτ-measurable random variable).
Informally speaking, the associated forward contract made at time t is a
commitment to pay an amount Ft (the forward price), which is agreed upon
at time t and paid at time τ, in return for the amount Wτ at time τ. Formally
speaking, the forward contract made at time t for delivery of Wτ at time τ
for a forward price of Ft is a security whose price at time t is zero and whose
dividend process δ is defined by δt = 0, t 6= τ, and δτ = Wτ − Ft.
(A) Suppose that Q is an equivalent martingale measure and that there is
riskless short-term borrowing at any date t at a discount dt that is determin-
istic. Show that {F0,F1,...,Fτ} is a Q-martingale, in that Ft = EQ
t (Fτ) for
all t ≤ τ.
A futures contract differs from a forward contract in several practical
ways that depend on institutional details. One of the details that is particu-
larly important for pricing purposes is resettlement. For theoretical modeling
purposes, we can describe resettlement as follows: A futures-price process
Φ = {Φ0,...,Φτ} for delivery of Wτ at time τ is taken as given. At any time
t, an investor can adopt a position of θ futures contracts by agreeing to accept
the resettlement payment θ(Φt+1 −Φt) at time t+1, θ(Φt+2 −Φt+1) at time
t + 2, and so on, until the position is changed (or eliminated). This process
of paying or collecting any changes in the futures price, period by period,
is called marking to market, and serves in practice to reduce the likelihood
or magnitude of potential defaults. Formally, all of this means simply that
the dividend process δ of the futures contract is defined by δt = Φt − Φt−1,
1 ≤ t ≤ τ.54 Chapter 2. Basic Multiperiod Model
For our purposes, it is natural to assume that the delivery value Φτ is
contractually equated with Wτ. (In a more detailed model, we could equate
Φτ and Wτ by the absence of delivery arbitrage.)
(B) Suppose Q is an equivalent martingale measure and show that for all
t ≤ τ, Φt = EQ
t (Wτ). It follows from parts (A) and (B) that with de-
terministic interest rates and the absence of arbitrage, futures and forward
prices coincide. We now suppose that Wτ is the market value Sτ of a secu-
rity with dividend process δ. (C) Suppose that δ and the discount process
d = {d1,...,dT } on riskless borrowing are both deterministic. Calculate the
futures and forward prices, Φt and Ft, explicitly in terms of St, d, and δ.
Exercise 2.18 Provide details fleshing out the following outline of a proof
of the converse part of Proposition 2G.
Let J = {(x1,...,xT ) : x ∈ L} and H =

(δθ
1,...,δθ
T ) : θ ∈ Θ . Markets
are complete if and only if J = H. By Theorem 2G, there is a unique
equivalent martingale measure if and only if there is a unique state-price
deflator π such that π0 = 1. Suppose H 6= J. Since H is a linear subspace
of J, there is some nonzero y in J “orthogonal” to H, in the sense that
E(
PT
t=1 ytht) = 0 for all h in H. Let π̂ ∈ L be defined by π̂0 = 1 and
π̂t = πt +αyt, t ≥ 1, where α > 0 is a scalar small enough that π̂ ≫ 0. Then
π̂ is a distinct state-price deflator with π̂0 = 1. This shows that if there is a
unique state-price deflator π with π0 = 1, then markets must be complete.
Hint: Let
(y | h) ≡ E
T X
t=1
ytht
!
, h ∈ H
define an inner (· | ·) for H in the sense of Exercise 1.17.
Exercise 2.19 It is asserted in Section 2I that if W is the Snell envelope
of Y , then Wt = max[Yt,Et(Wt+1)]. Prove this natural property.
Exercise 2.20 Prove Lemma 2J.
Exercise 2.21 Consider the “tree” of prices for securities A and B shown
in Figure 2.2. At each node in the tree, a pair (pA,pB) of prices is shown,
the first of which is the price of A at that node, the second of which is the
price of B.2J. Is Early Exercise Optimal? 55
(95, 85)
(98, 100)
(100, 150)
(100, 75)
(100, 80)
(100, 90)
(95, 80)
t=1 t=2 t=3
Figure2.2: An Event Tree With Prices56 Chapter 2. Basic Multiperiod Model
(A) Construct a probabilityspace (Ω,F,P), a filtrationof tribes, {F0,F1,F2},
and a vector security price process S, that formally encode the information
in the figure. Please be explicit. Take the security price process to be cum-
dividend, so that S2 is both the price and the dividend payoff vector of the
securities at time 2. There are no dividend payments in periods 0 and 1.
(B) Suppose there is no arbitrage. Find the price at time 0 of an American
put option on asset B, with an exercise price of 95 and expiring at time 2.
(Remember, this is an option to sell B for 95 at any of times 0, 1, or 2.)
(C) Suppose the price at time 0 in the market of this put option is in fact
10 percent lower than the arbitrage-free price you arrived at in part B. Show
explicitly how to create a riskless profit of 1 million dollars at time 0, with
no cash flow after time 0. (D) Suppose the price in the market of this put
option is in fact 10 percent higher than the arbitrage-free price you arrived at
in part B. Show explicitly how to create a riskless profit of 1 million dollars
at time 0, with non-negative cash flow after time 0. Hint: If you decide to
sell the option, you should not assume that the person to whom you sold it
will exercise it in any particular fashion.
Exercise 2.22 Let T = 1, and suppose there are 3 equally likely states of
world, ω1,ω2, and ω3, one of which is revealed as true at time 1. A particular
agent has utility function U and has equilibrium consumption choices c0 = 25
and
c1(ω1) = 9, c1(ω2) = 16, c1(ω3) = 4.
In each case below, compute the price of a security that pays 3 in state ω1,
6 in state ω2, and 5 in state ω3. Show your work.
(A) Expected, but not time-additive, utility U(c0,c1) = E[u(c0,c1)], with
u(x,y) =
√
xy.
(B) Non-expected utility U(c0,c1) =
p
c0 c1(ω1)c1(ω2)c1(ω3).
Exercise 2.23 For concreteness, the length of one period is one year.
There are two basic types of investments. The first is riskless borrowing
or lending. The equilibrium one-year short rate is 25 percent (simple interest
per year), each year. (So one can invest 1 at time zero and collect 1.25 at
the end of the first year, or invest 1 at the end of the first year and collect
1.25 at the end of the second year.) At the end of each year a fair coin is2J. Is Early Exercise Optimal? 57
flipped. A risky security has zero initial market value. Its market value goes
up by one unit at the end of each year if the outcome of the coin flip for that
year is Heads. Its market value goes down by one unit at the end of each
year if the outcome of the coin flip for that year is Tails. For example, the
price of the risky security at the end of the second year is −2, 0, or +2, with
respective probabilities 0.25, 0.50, and 0.25.
There is also a European option to purchase the risky security above at
the end of the second year (only) at an exercise price of 1 unit of account.
(A) Suppose there is no arbitrage. State the initial market price q of the
option. (Show your reasoning.)
(B) Now suppose the option is actually selling for q/2. Construct a trading
strategy that generates a net initialpositive cash flow of 1000 units of account
and no subsequent cash flows. (State a precise recipe for the quantities of
each security to buy or sell, at each time, in each contingency.)
Exercise 2.24 Prove Corollary 2F.
Exercise 2.25 (Numeraire Invariance) Consider a dividend-price pair (δ,S) ∈
LN
×LN
, and a deflator γ. Let Ŝ = Sγ and δ̂ = δγ denote the deflated price
and dividend processes. Let θ be any given trading strategy. Show that the
dividend process δ̂θ
generated by θ given (δ̂,Ŝ) and the dividend process δθ
generated by θ under (δ,S) are related by δ̂θ
= γδθ
. Show that θ is an ar-
bitrage with respect to (δ,S) if and only if θ is an arbitrage with respect to
(δ̂,Ŝ). If π is a state-price deflator for (δ,S), compute a state-price deflator
π̂ for (δ̂,Ŝ) in terms of π and γ.
Notes
The model of uncertainty and information is standard. The model of
uncertainty is equivalent to that originated in the general equilibrium model
of Debreu [1953], which appears in Chapter 7 of Debreu [1959]. For more
details in a finance setting, see Dothan [1990]. The connection between
arbitrage and martingales given in Sections 2C and 2G is from the more
general model of Harrison and Kreps [1979]. Girotto and Ortu [1993] present
general results, in this finite-dimensional setting, on the equivalence between
no arbitrage and the existence of an equivalent martingale measure. The
spirit of the results on optimality and state prices is also from Harrison and
Kreps [1979]. ?], Girotto and Ortu [1995], and Girotto and Ortu [1997] full
explore this equivalence in financial dimensional multi-period economies.58 Chapter 2. Basic Multiperiod Model
The habit-formation utility model was developed by Dunn and Singleton
[1986] and in continuous time by Ryder and Heal [1973]. An application of
habit formation to state-pricing in this setting appears in Chapman [1998].
The recursive-utility model, in various forms, is due to Selden [1978], Kreps
and Porteus [1978], and Epstein and Zin [1989], and is surveyed by Ep-
stein [1992]. Koopmans [1960] presented an early precursor. The recursive-
utility model allows for preference for earlier or later resolution of uncertainty
(which have no impact on additive utility). This is relevant, for example, in
the context of the remarks by Ross [1989], as shown by Skiadas [991a] and
Duffie, Schroder, and Skiadas [1997]. For a more general form of recursive
utility than that appearing in Exercise 2.9, the von Neumann-Morgenstern
function h can be replaced with a function of the conditional distribution of
next-period utility. Examples are the local-expected-utilitymodel of Machina
[1982] and the betweenness certainty equivalent model of Chew [1983], Chew
[1989], Dekel [1987], and Gul and Lantto [1992]. The equilibrium state-price
associated with recursive utility is computed in a Markovian version of this
setting by ?]. For further justification and properties of recursive utility, see
Chew and Epstein [1991], Skiadas [991a] and Skiadas [991b]. For further
implications for asset pricing, see Epstein [1988], Epstein [1992], Epstein and
Zin [1991], and Giovannini and Weil [1989]. Kakutani [1993] explored the
utility gradient representation of recursive utility in this setting.
Radner [1967] and Radner [1972] originated the sort of dynamic equilib-
rium model treated in this chapter. The basic approach to existence given
in Exercise 2.11 is suggested by Kreps [1982], and is shown to work for
“generic” dividends and endowments, under technical regularity conditions,
in McManus [1984], Repullo [1986], and Magill and Shafer [1990], provided
the number of securities is at least as large as the spanning number of the
filtration F (as suggested in Exercise 2.11). This literature is reviewed in
depth by Geanakoplos [1990]. See Duffie and Huang [1985] for the definition
of spanning number in more general settings and for a continuous-time ver-
sion of a similar result. Duffie and Shafer [1985] and Duffie and Shafer [986a]
show generic existence of equilibriumin incompletemarkets; Hart [1975] gives
a counterexample. Bottazzi [1995] has a somewhat more advanced version
of this result in its single-period multiple-commodity version. See, also Won
[1996] and Won [996c].
Related existence topics are studied by Bottazzi and Hens [1993], Hens
[1991], and Zhou [1993]. Dispersed expectations, in a temporary-equilibrium
variant of the model, is shown to lead to existence by Henrotte [1994] and2J. Is Early Exercise Optimal? 59
by Honda [1992]. Alternative proofs of existence of equilibrium are given in
the 2-period version of the model by Geanakoplos and Shafer [1990], Hirsch,
Magill, and Mas-Colell [1990], and Husseini, Lasry, and Magill [1990]; and
in a T-period version by Florenzano and Gourdel [1994]. If one defines secu-
rity dividends in nominal terms, rather than in units of consumption, then
equilibria always exist under standard technical conditions on preferences
and endowments, as shown by Cass [1984], Werner [1985], Duffie [1987],
and Gottardi and Hens [1994], although equilibrium may be indeterminate,
as shown by Cass [1989] and Geanakoplos and Mas-Colell [1989]. On this
point, see also Kydland and Prescott [1991], Mas-Colell [1991], and Cass
[1991]. Likewise, one obtains existence in a one-period version of the model
provided securities have payoffs in a single commodity (the framework of
most of this book), as shown by Chae [1988] and Geanakoplos and Polemar-
chakis [1986]. Surveys of general equilibrium models in incomplete markets
setting are given by Cass [1991], Duffie [1992], Geanakoplos [1990], ?], and
Magill and Shafer [1991]. In the presence of price-dependent options, exis-
tence can be more problematic, as shown by Polemarchakis and Ku [1990],
but variants of the formulation will suffice for existence in many cases, as
shown by Huang and Wu [1994] and Krasa and Werner [1991]. Detemple
and Selden [1991] examine the implications of options for asset pricing in a
general equilibrium model with incomplete markets. Bajeux-Besnainou and
Rochet [1995] explore the dynamic spanning implications of options. The
importance of the timing of information in this setting is described by Berk
and Uhlig [1993]. Hindy and Huang [1993b] show the implications of linear
collateral constraints on security valuation. Hara [1993] treats the role of
“redundant” securities in the presence of transactions costs.
Hahn [1992] and Hahn [1994] raise some philosophical issues regarding
the possibility of complete markets and efficiency. The Pareto inefficiency
of incomplete markets equilibrium consumption allocations, and notions of
constrained efficiency, are discussed by Hart [1975], Kreps [1979] (and refer-
ences therein), Citanna, Kajii, and Villanacci [1994], Citanna and Villanacci
[1993], Pan [1992], and Pan [1993].
The optimality of individual portfolio and consumption choices in incom-
plete markets in this setting is given a dual interpretation by He and es [1993].
(Girotto and Ortu [1994] offer related remarks.) Methods for computation of
equilibrium with incomplete markets are developed by Brown, DeMarzo, and
Eaves [993a], Brown, DeMarzo, and Eaves [993b] and DeMarzo and Eaves
[1993].60 Chapter 2. Basic Multiperiod Model
The representative agent state-pricing model for this setting was shown by
Constantinides [1982]. An extension of this notion to incomplete markets,
where one cannot generally exploit Pareto optimality, is given by Cuoco
and He [992a]. Kraus and Litzenberger [1975] and Stapleton and Subrah-
manyam [1978] present parametric examples of equilibrium. Hansen and
Richard [1987] explore the state-price beta model in a much more general
multiperiod setting. Ross [1987] and Prisman [1985] show the impact of
taxes and transactions costs on the state-pricing model. Hara [1993] dis-
cusses the role of redundant securities in the presence of transactions costs.
The consumption-based CAPM of Exercise 2.6 is found, in a different form,
in Rubinstein [1976]. The aggregation result of Exercise 2.15 is based on Ru-
binstein [974b]. Rubinstein [974a] has a detailed treatment of asset pricing
results in the setting of this chapter. Rubinstein [1987] is a useful expository
treatment of derivative asset pricing in this setting.
Cox, Ross, and Rubinstein [1979] developed the muli-period binomial
option pricing model analyzed in Exercise 2.1, and further analyzed in terms
of convergece to the Black-Scholes Formula in Chapter 11.
The role of production is considered by Duffie and Shafer [1986] and Naik
[1993]. The Modigliani-Miller Theorems are reconsidered in this setting by
DeMarzo [1988], Duffie and Shafer [1986], and Gottardi [1995].
The modeling of American security valuation given here is similar to the
continuous-time treatments of Bensoussan [1984] and Karatzas [1988], who
do not formallyconnect the valuation of American securities with the absence
of arbitrage, but rather deal with the similar notion of “fair price.” Merton
[1973] was the first to attack American option valuation systematically using
arbitrage-based methods and to point out the inoptimalityof early exercise of
certain American options in a Black-Scholes style setting. American option
valuation is reconsidered in Chapters 3 and 8, whose literature notes cite
many additional references.Chapter 3
The Dynamic Programming
Approach
THIS CHAPTER PRESENTS portfoliochoice and asset pricing in the frame-
work of dynamic programming, a technique for solving dynamic optimization
problems with a recursive structure. The asset-pricing implications go little
beyond those of the previous chapter, but there are computational advan-
tages. After introducing the idea of dynamic programming in a deterministic
setting, we review the basics of a finite-state Markov chain. The Bellman
equation is shown to characterize optimality in a Markov setting. The first-
order condition for the Bellman equation, often called the “stochastic Euler
equation,” is then shown to characterize equilibrium security prices. This is
done with additive utility in the main body of the chapter, and extended to
more general recursive forms of utility in the exercises. The last sections of
the chapter show the computation of arbitrage-free derivative security values
in a Markov setting, including an application of Bellman’s equation for op-
timal stopping to the valuation of American securities such as the American
put option. An exercise presents algorithms for the numerical solution of
term-structure derivative securities in a simple binomial setting.
3A The Bellman Approach
To get the basic idea, we start in the T-period setting of the previous chapter,
with no securities except those permitting short-term riskless borrowing at
any time t at the discount dt > 0. The endowment process of a given agent62 Chapter 3. Dynamic Programming
is e. Given a consumption process c, it is convenient to define the agent’s
wealth process Wc
by Wc
0 = 0 and
Wc
t =
Wc
t−1 + et−1 − ct−1
dt−1
, t ≥ 1. (1)
Given a utility function U : L+ → R on the set L of nonnegative adapted
processes, the agent’s problem can be rewritten as
sup
c∈L+
U(c) subject to (1) and cT ≤ Wc
T + eT . (2)
Dynamic programming is only convenient with special types of utility
functions. One example is an additive utility function U, defined by
U(c) = E
" T X
t=0
ut(ct)
#
, (3)
with ut : R+ → R strictly increasing and continuous for each t. Given
this utility function, it is natural to consider the problem at any time t
of maximizing the “remaining utility,” given current wealth W c
t = w. In
order to keep things simple at first, we take the case in which there is no
uncertainty, meaning that Ft = {Ω,∅} for all t. The maximum remaining
utility at time t is then written, for each w in R, as
Vt(w) = sup
c∈L+
T X
s=t
us(cs),
subject to Wc
t = w, the wealth dynamic (1), and cT ≤ Wc
T + eT . If there is
no budget-feasible consumption choice (because w is excessively negative),
we write Vt(w) = −∞.
Clearly VT (w) = uT(w + eT ) for w ≥ −eT , and it is shown as an exercise
that for t < T,
Vt(w) = sup
c∈R+
ut(c) + Vt+1

w + et − c
dt

, (4)
the Bellman equation. It is also left as an exercise to show that an optimal
consumption policy c is defined inductively by ct = Ct(Wc
t ), where Ct(w)
denotes a solution to (4) for t < T, and where CT (w) = w + eT . From
(4), the value function Vt+1 thus summarizes all information regarding the
“future” of the problem that is required for choice at time t.3B. First-Order Conditions of the Bellman Equation 63
3B First-Order Conditions of the Bellman Equa-
tion
Throughout this section, we take the additive model (3) and assume in ad-
dition that for each t, ut is strictly concave and differentiable on (0,∞).
Extending Exercise 2.2, there exists an optimal consumption policy c∗
. We
assume that c∗
is strictly positive. Let W∗
denote the wealth process associ-
ated with c∗
by (1).
Lemma. For any t, Vt is strictly concave and continuously differentiable at
W∗
t , with V ′
t (W∗
t ) = u′
t(c∗
t ).
Proof is left as Exercise 3.3, which gives a broad hint. The first-order con-
ditions for the Bellman equation (4) then imply, for any t < T, that the
one-period discount is
dt =
u′
t+1(c∗
t+1)
u′
t(c∗
t )
. (5)
The same equation is easily derived from the general characterization of
equilibrium security prices given by equation (2.9). More generally, the price
Λt,τ at time t of a unit riskless bond maturing at any time τ > t is
Λt,τ ≡ dt dt+1 ···dτ−1 =
u′
τ(c∗
τ)
u′
t(c∗
t )
, (6)
which, naturally, is the marginal rate of substitution of consumption between
the two dates.
Since the price of a coupon-bearing bond, the only kind of security in
a deterministic setting, is merely the sum of the prices of its coupons and
principal, (6) provides a complete characterization of security prices in this
setting.
3C Markov Uncertainty
We take the easiest kind of Markov uncertainty, a time-homogeneous Markov
chain. Let the elements of a fixed set Z = {1,...,k} be known as shocks. For
any shocks i and j, let qij ∈ [0,1] be thought of as the probability, for any t,
that shock j occurs in period t + 1 given that shock i occurs in period t. Of
course, for each i, qi1 + ···+qik = 1. The k ×k transition matrix q is thus a64 Chapter 3. Dynamic Programming
complete characterization of transition probabilities. This idea is formalized
with the following construction of a probability space and filtration of tribes.
It is enough to consider a state of the world as some particular sequence
(z0,...,zT ) of shocks that might occur. We therefore let Ω = ZT+1
and let
F be the set of all subsets of Ω. For each t, let Xt : Ω → Z (the random shock
at time t) be the random variable defined by Xt(z0,...,zT ) = zt. Finally, for
each i in Z, let Pi be the probability measure on (Ω,F) uniquely defined by
two conditions:
Pi(X0 = i) = 1 (7)
and, for all t < T,
Pi [X(t + 1) = j | X(0), X(1), X(2),...,X(t)] = qX(t),j. (8)
Relations (7) and (8) mean that under probability measure Pi, X starts at i
with probability 1 and has the transition probabilities previously described
informally. In particular, (8) means that X = {X0,...,XT } is a Markov
process: the conditional distribution of Xt+1 given X0,...,Xt depends only
on Xt. To complete the formal picture, for each t, we let Ft be the tribe
generated by {X0,...,Xt}, meaning that the information available at time t
is that obtained by observing the shock process X until time t.
Lemma. For any time t, let f : ZT−t+1
→ R be arbitrary. Then there exists
a fixed function g : Z → R such that for any i in Z,
Ei
[f(Xt,...,XT ) | Ft] = Ei
[f(Xt,...,XT) | Xt] = g(Xt),
where Ei
denotes expectation under Pi.
This lemma gives the complete flavor of the Markov property.
3D Markov Asset Pricing
Taking the particular Markov source of uncertainty described in Section 3C,
we now consider the prices of securities in a single- or representative-agent
setting with additive utility of the form (3), where, for all t, ut has a strictly
positive derivative on (0,∞). Suppose, moreover, that for each t there are
functions ft : Z → RN
and gt : Z → R such that the dividend is δt =
ft(Xt) and the endowment is et = gt(Xt). Then Lemma 3C and the general
gradient solution (2.9) for equilibrium security prices imply the following3E. Security Pricing by Markov Control 65
characterization of the equilibrium security price process S. For each t there
is a function St : Z → RN
such that St = St(Xt). In particular, for any
initial shock i and any time t < T,
St(Xt) =
1
πt
Ei

πt+1 [ft+1(Xt+1) + St+1(Xt+1)] Xt

, (9)
where π is the state-price deflator given by πt = u′
t[gt(Xt)]. This has been
called the stochastic Euler equation for security prices.
3E Security Pricing by Markov Control
We will demonstrate (9) once again, under stronger conditions, using instead
Markov dynamic programmingmethods. Suppose that X is the shock process
already described. For notational simplicity, in this section we suppose that
the transition matrix q is strictly positive and that for all t,
• ut is continuous, strictly concave, increasing, and differentiableon (0,∞);
• et = gt(Xt) for some gt : Z → R++; and
• δt = ft(Xt) for some ft : Z → RN
++.
We assume, naturally, that St : Z → RN
++, t < T, and that there is
no arbitrage. We let Θ denote the space of trading strategies and L+ the
space of nonnegative adapted processes (for consumption). For each t ≤ T,
consider the value function Vt : Z × R → R defined by
Vt(i,w) = sup
(c,θ)∈L+×Θ
E
" T X
j=t
uj(cj) Xt = i
#
, (10)
subject to
Wθ
j = θj−1 · [Sj(Xj) + fj(Xj)], j > t; Wθ
t = w, (11)
and
cj + θj · Sj(Xj) ≤ Wθ
j + gj(Xj), t ≤ j ≤ T.
One may think of Vt(Xt, ·) as an indirect utility function for wealth at time
t. The conditional expectation in (10) does not depend on the initial state66 Chapter 3. Dynamic Programming
X0 according to Lemma 3C, so we abuse the notation by simply ignoring the
initial state in this sort of expression. For sufficiently negative w, there is
no (θ,c) that is feasible for (10), in which case we take Vt(i,w) = −∞. For
initial wealth w = 0 and time t = 0, (10) is equivalent to problem (2.4) with
Sj = Sj(Xj) for any time j.
We now define a sequence F0,...,FT of functions on Z × R into R that
will eventually be shown to coincide with the value functions V0,...,VT . We
first define FT+1 ≡ 0. For t ≤ T, we let Ft be given by the Bellman equation
Ft(i,w) = sup
(θ,c)∈RN×R+
Git θ,c

subject to c+θ·St(i) ≤ w+gt(i), (12)
where
Git(θ,c) = ut(c) + E
h
Ft+1 Xt+1,θ · [St+1(Xt+1) + ft+1(Xt+1)]

Xt = i
i
.
The following technical conditions extend those of Lemma 3B, and have
essentially the same proof.
Proposition. For any i in Z and t ≤ T, the function Ft(i, ·) : R → R,
restricted to its domain of finiteness {w : Ft(i,w) > −∞}, is strictly concave
and increasing. If c,θ

solves (12) and c > 0, then Ft(i, ·) is continuously
differentiable at w with derivative Ftw(i,w) = u′
t(c).
It can be shown as an exercise that unless the constraint of (12) is in-
feasible, a solution to (12) always exists. In this case, for any i, t, and w,
let [Φt(i,w),Ct(i,w)] denote a solution. We can then define the associated
wealth process W∗
recursively, for any initial condition w, by W ∗
0 = w and
W∗
t = Φt−1(Xt−1,W∗
t−1) · [St(Xt) + ft(Xt)], t ≥ 1.
Let (c∗
,θ∗
) be defined, at each t, by c∗
t = Ct(Xt,W∗
t ) and θ∗
t = Φt(Xt,W∗
t ).
The fact that (c∗
,θ∗
) solves (10) for t = 0 can be shown as follows: Let (c,θ)
be an arbitrary feasible policy. For each t, from the Bellman equation (12),
Ft(Xt,Wθ
t ) ≥ ut(ct) + E
h
Ft+1 (Xt+1,θt · [St+1(Xt+1) + ft+1(Xt+1)]) Xt
i
.
Rearranging this inequality and applying the law of iterated expectations,
E[Ft(Xt,Wθ
t )] − E

Ft+1 Xt+1,Wθ
t+1

≥ E[ut(ct)]. (13)3F. Arbitrage-Free Valuation in a Markov Setting 67
Adding equation (13) from t = 0 to t = T shows that F0(X0,W0) ≥ U(c).
Repeating the same calculations for the special policy (c,θ) = (c∗
,θ∗
) allows
us to replace the inequality in (13) with an equality, leaving F0(X0,W0) =
U(c∗
). This shows that U(c∗
) ≥ U(c) for any feasible (θ,c), meaning that
(θ∗
,c∗
) indeed solves equation (10) for t = 0. An optimal policy can thus be
captured in feedback-policy form in terms of the functions Ct and Φt, t ≤ T.
We also see that for all t ≤ T, Ft = Vt, so Vt inherits the properties of F
given by the last proposition.
We can now recover the stochastic Euler equation (9) directly from the
first-order conditions to (12), rather than from the more general first-order
conditions developed in Chapter 2 based on the gradient of U.
Theorem. Suppose c∗
is a strictly positive consumption process and θ∗
is a
trading strategy θ∗
such that
c∗
t = Wθ∗
t + et − θ∗
t · St.
Then (c∗
,θ) solves (10) for t = 0 if and only if, for all t < T,
St(Xt) =
1
u′
t(c∗
t )
E

u′
t+1 (c∗
t+1)[St+1(Xt+1) + ft+1(Xt+1)]|Xt

. (14)
The theorem follows from the necessity and sufficiency of the first-order con-
ditions for (12), relying on the last propositionfor the fact that Ft+1,w(Xt+1,W∗
t+1) =
u′
t+1(c∗
t+1).
In a single-agent model, we define a sequence {S0,...,ST } of security-
price functions to be a single-agent equilibrium if (e,0) (no trade) solves (10)
for t = 0, w = 0, and any initial shock i.
Corollary. {S0,...,ST } is a single-agent equilibrium if and only if ST = 0
and, for all t < T, the stochastic Euler equation (9) is satisfied taking c∗
= e.
3F Arbitrage-Free Valuation in a Markov Set-
ting
Taking the setting of Markov uncertainty described in Section 3C, but assum-
ing no particular optimality properties or equilibrium, suppose that security
prices and dividends are given, at each t, by functions St and ft on Z into68 Chapter 3. Dynamic Programming
RN
. It can be shown as an exercise that the absence of arbitrage is equiva-
lent to the existence of a state-price deflator π given by πt = ψt(Xt) for some
ψt : Z → (0,∞). With this, we have, for 0 < t ≤ T,
St−1(Xt−1) =
1
ψt−1(Xt−1)
E (ψt(Xt)[ft(Xt) + St(Xt)]|Xt−1). (15)
In the special setting of Section 3E, for example, (9) tells us that we can take
ψt(i) = u′
t[g(i)].
Since Z = {1,...,k} for some integer k, we can abuse the notation by
treating any function such as ψt : Z → R interchangeably as a vector in Rk
denoted ψt, with i-th element ψt(i). Likewise, St can be treated as a k × N
matrix, and so on. In this sense, (15) can also be written
St−1 = Πt−1(ft + St), (16)
where Πt−1 is the k ×k matrix with (i,j)-element qijψt(j)/ψt−1(i). For each
t and s > t, we let Πt,s = ΠtΠt+1 ···Πs−1. Then (16) is equivalent to, for any
t and τ > t,
St = Πt,τSτ +
τ X
s=t+1
Πt,sfs. (17)
As an example, consider the “binomial” model of Exercise 2.1. We can let
Z = {0,1,...,T}, with shock i having the interpretation: “There have so far
occurred i ‘up’ returns on the stock.” From the calculations in Exercise 2.1,
it is apparent that for any t, we may choose Πt = Π, where
Πij =
p
R
, j = i + 1,
=
1 − p
R
, j = i,
= 0, otherwise,
where p = (R − D)/(U − D), for constant coefficients R, U, and D, with
0 < D < R < U. For a given initial stock price x and any i ∈ Z, the
stock-price process S of Exercise 2.1 can indeed be represented at each time
t by St : Z → R, where St(i) = xUi
Dt−i
.
We can recover the “binomial” option-pricing formula (2.16) by noting
that the European call option with strike price K and expiration time τ may
be treated as a security with dividends only at time τ given by the function3G. Early Exercise and Optimal Stopping 69
g : Z → R, with g(i) = [Sτ(i) − K]+
. From (17), the arbitrage-free value
of the option at time t is Cτ
t = Πτ−t
g, where Πt
denotes the t-th power of
Π. This same valuation formula applies to an arbitrary security paying a
dividend at time τ defined by some payoff function g : Z → R.
3G Early Exercise and Optimal Stopping
In the setting of Section 3F, consider an “American” security, defined by
some payoff functions gt : Z → R+, t ∈ {0,...,T}. As explained in Section
2I, the security is a claim to the dividend gτ(Xτ) at any stopping time τ
selected by the owner. Expiration of the security at some time τ is handled
by defining gt to be zero for t > τ. Given the state-price deflator π defined
by πt = ψt(Xt), as outlined in the previous section, the rational exercise
problem (2.13) for the American security, with initial shock i, is given by
J0(i) ≡ max
τ∈T
1
ψ0(i)
Ei
[ψτ(Xτ)g(Xτ)], (18)
where T is the set of stopping times bounded by T. As explained in Section
2I, if the American security is redundant and there is no arbitrage, then
J0(i) is its cum-dividend value at time 0 with initial shock i. The Bellman
equation for (18) is
Jt(Xt) ≡ max

gt(Xt),
1
ψt(Xt)
E [ψt+1(Xt+1)Jt+1(Xt+1)|Xt]

. (19)
It is left as an exercise to show that J0 is indeed determined inductively,
backward in time from T, by (19) and JT = gT. Moreover, as demonstrated
in Section 2I, problem (18) is solved by the stopping time
τ∗
= min[t : Jt(Xt) = gt(Xt)]. (20)
In our alternate notation that treats Jt as a vector in Rk
, we can rewrite
the Bellman equation (19) in the form
Jt = max(gt,ΠtJt+1), (21)
where, for any x and y in Rk
, max(x,y) denotes the vector in Rk
that has
max(xi,yi) as its i-th element.70 Chapter 3. Dynamic Programming
The Bellman equation (21) leads to a simple recursive solution algorithm
for the American put valuation problem of Exercise 2.1. Given an expiration
time τ < T and exercise price K, we have Jτ+1 = 0 and
Jt = max

(K − St)+
, ΠJt+1

, t ≤ τ. (22)
More explicitly: For any t and i ≤ t,
Jt(i) = max

[K − St(i)]+
,
pJt+1(i + 1) + (1 − p)Jt+1(i)
R

, (23)
where St(i) = xUi
Dt−i
and p = (R − D)/(U − D), for constant coefficients
R, U, and D, with 0 < D < R < U.
More generally, consider an American security defined by dividend func-
tions h0,...,hT and exercise payoff functions g0,...,gT. For a given expira-
tion time τ, we have ht = gt = 0, t > τ. The owner of the security chooses
a stopping time τ at which to exercise, generating the dividend process δτ
defined by
δτ
t = ht(Xt), t < τ,
= gt(Xt), t = τ,
= 0, t > τ.
Assuming that δτ
is redundant for any exercise policy τ, the security’s
arbitrage-free cum-dividend value is defined recursively by Jτ+1 = 0 and
the extension of (21):
Jt = max(gt, ht + ΠtJt+1). (24)
Exercises
Exercise 3.1 Prove the Bellman equation (4).
Exercise 3.2 For each t and each w such that there exists a feasible policy,
let Ct(w) solve equation (4). Let W∗
be determined by equation (1) with
ct−1 = Ct−1(W∗
t−1) for t > 0. Show that an optimal policy c∗
is given by
c∗
t = Ct(W∗
t ), t < T, and c∗
T = eT + W∗
T .3G. Early Exercise and Optimal Stopping 71
Exercise 3.3 Prove Lemma 3B. Hint: If f : R → R is concave, then for
each x there is a number β such that β(x − y) ≤ f(x) − f(y) for all y. If f
is also differentiable at x, then β = f′
(x). If f is differentiable and strictly
concave, then f is continuously differentiable. Let w∗
= W∗
t . If c∗
t > 0, there
is an interval I = (w,w) ⊂ R with w∗
∈ I such that v : I → R is well defined
by
v(w) = ut(c∗
t + w − w∗
) + Vt+1(W∗
t+1).
Now use the differentiability of v, the definition of a derivative, and the fact
that v(w) ≤ Vt(w) for all w ∈ I.
Exercise 3.4 Prove equation (9).
Exercise 3.5 Prove Proposition 3E.
Exercise 3.6 Prove Theorem 3E and its corollary.
Exercise 3.7 Consider the case of securities in positive supply, which can
be taken without loss of generality to be a supply of 1 each. Equilibrium
in the context of Section 3E is thus redefined by the following: {S0,...,ST }
is an equilibrium if (c∗
,θ∗
) solves (10) at t = 0 and w = 1 · [S0(X0) +
f0(X0)], where 1 = (1,...,1) and, for all t, θ∗
t = 1, and c∗
t = gt(Xt) + 1 ·
ft(Xt). Demonstrate a new version of the stochastic Euler equation (9) that
characterizes equilibrium in this case.
Exercise 3.8 (Recursive Utility Revisited) The objective in this exercise
is to extend the basic results of the chapter to the case of a recursive-utility
function that generalizes additive utility. Rather than assuming a typical
additive-utility function U of the form
U(c) = E
" T X
t=0
ρt
u(ct)
#
, (25)
we adopt instead the more general recursive definition of utility given by
U(c) = Y0, where Y is a process defined by YT+1 = 0 and, for any t ≤ T,
Yt = J (ct,Et[h(Yt+1)]), (26)
where J : R+ × R → R and h : R → R. This is the special case treated in
Exercise 2.9 of what is known as recursive utility. (In an even more general72 Chapter 3. Dynamic Programming
recursive-utility model, the von Neumann-Morgenstern criterion E[h(·)] is
replaced by a general functional on distributions, but we do not deal with this
further generalization.) Note that the special case J(q,w) = u(q) + ρw and
h(y) = y gives us the additively separable criterion (25). The conventional
additive utility has the disadvantage that the elasticity of intertemporal sub-
stitution (as measured in a deterministic setting) and relative risk aversion
are fixed in terms of one another. The recursive criterion, however, allows
one to examine the effects of varying risk aversion while holding fixed the
utility’s elasticity of intertemporal substitution in a deterministic setting.
(A) (Dynamic Programming) Provide an extension of the Bellman equa-
tion (12) for optimal portfolio and consumption choice, substituting the re-
cursive utility for the additive utility. That is, state a revised Bellman equa-
tion and regularity conditions on the utility primitives (J,h) under which a
solution to the Bellman equation implies that the associated feedback poli-
cies solving the Bellman equation generate optimal consumption and port-
folio choice. (State a theorem with proof.) Also, include conditions under
which there exists a solution to the Bellman equation. For simplicity, among
your conditions you may wish to impose the assumptions that J and h are
continuous and strictly increasing.
(B) (Asset Pricing Theory) Suppose that J and h are differentiable, in-
creasing, and concave, with either h or J (or both) strictly concave. Provide
any additional regularity conditions that you feel are called for in order to
derive an analogue to the stochastic Euler equation (9) for security prices.
(C) (An Investment Problem) Let G : Z × R+ → R+ and consider the
capital-stock investment problem defined by
sup
c∈L+
U(c) (27)
subject to 0 ≤ ct ≤ Kt for all t, where K0,K1,..., is a capital-stock process
defined by Kt = G(Xt,Kt−1 − ct−1), and where X0,...,XT is the Markov
process defined in Section 3C. The utility function U is the recursive function
defined above in terms of (J,h). Provide reasonable conditions on (J,h,G)
under which there exists a solution. State the Bellman equation.
(D) (Parametric Example) For this part, in order to obtain closed-form
solutions, we depart from the assumption that the shock takes only a finite
number of possible values, and replace this with a normality assumption.
Solve the problem of part (C) in the following case:3G. Early Exercise and Optimal Stopping 73
(a) X is the real-valued shock process defined by Xt+1 = A + BXt + ǫt+1,
where A and B are scalars and ǫ1,ǫ2,... is an i.i.d. sequence of normally
distributed random variables with E(ǫt) = 0 and var(ǫt) = σ2
.
(b) G(x,a) = aγ
ex
for some γ ∈ (0,1).
(c) J(q,w) = log(q) + ρlog(w1/α
) for some α ∈ (0,1).
(d) h(v) = eαv
for v ≥ 0.
Hint: You may wish to conjecture a solution to the value function of the
form Vt(x,k) = A1(t)log(k)+A2(t)x+A3(t), for time-dependent coefficients
A1, A2, and A3. This example is unlikely to satisfy the regularity conditions
that you imposed in part (C).
(E) (Term Structure) For the consumption endowment process e defined
by the solution to part (D), return to the setting of part (B), and calculate the
price Λt,s at time t of a pure discount bond paying one unit of consumption
at time s > t. Note that α is a measure of risk tolerance that can be studied
independently of the effects of intertemporal substitution in this model, since,
for deterministic consumption processes, utility is independent of α, with
J[q,h(v)] = log(q) + ρlog(v).
Exercise 3.9 Show equation (5) directly from equation (2.9).
Exercise 3.10 Consider, as in the setup described in Section 3F, securities
defined by the dividend-price pair (δ,S), where, for all t, there are functions
ft and St on Z into RN
such that δt = ft(Xt) and St = St(Xt). Show that
there is no arbitrage if and only if there is a state-price deflator π such that,
for each time t, πt = ψt(Xt) for some function ψt : Z → (0,∞).
Exercise 3.11 (Binomial Term-Structure Algorithms) This exercise asks
for a series of numerical solutions of term-structure valuation problems in a
setting with binomial changes in short-term interest rates. In the setting of
Section 3F, under the absence of arbitrage, suppose that short-term riskless
borrowing is possible at any time t at the discount dt. The one-period interest
rate at time t is denoted rt, and is given by its definition:
dt =
1
1 + rt
.74 Chapter 3. Dynamic Programming
The underlying shock process X has the property that either Xt = Xt−1 + 1
or Xt = Xt−1. That is, in each period, the new shock is the old shock plus
a 0-1 binomial trial. An example is the binomial stock-option pricing model
of Exercise 2.1, which is reconsidered in Section 3F. As opposed to that
example, we do not necesarily assume here that interest rates are constant.
Rather, we allow, at each time t, a function ρt : Z → R such that rt = ρt(Xt).
For simplicity, however, we take it that at any time t the pricing matrix Πt
defined in Section 3F is of the form
(Πt)ij =
p
1 + ρt(i)
, j = i + 1,
=
1 − p
1 + ρt(i)
, j = i,
= 0, otherwise,
where p ∈ (0,1) is the “risk-neutral” probability that Xt+1 − Xt = 1. Liter-
ally, there is an equivalent martingale measure Q under which, for all t, we
have
Q(Xt+1 − Xt = 1 | X0,...,Xt) = p.
It may help to imagine the calculation of security prices at the nodes of
the “tree” illustrated in Figure 3.1. The horizontal axis indicates the time
periods; the vertical axis corresponds to the possible levels of the shock,
assuming that X0 = 0. At each time t and at each shock level i, the price of
a given security at the (i,t)-node of the tree is given by a weighted sum of
its value at the two successor nodes (i + 1,t + 1) and (i,t + 1). Specifically,
St(i) =
1
1 + ρt(i)
[p(St+1(i + 1) + ft+1(i + 1)) + (1 − p)(St+1(i) + ft+1(i))].
Two typical models for the short rate are obtained by taking p = 1/2 and
either
(a) the Ho-Lee model: For each t < T, ρt(i) = at + bti for some constants
at and bt; or
(b) the Black-Derman-Toy model: For each t, ρt(i) = at exp(bti) for some
constants at and bt.3G. Early Exercise and Optimal Stopping 75
t = 0 t = 1 t = 2 t = 3 t = 4 t = 5 t = 6
i = 0
i = 1
i = 2
i = 3
i = 4
i = 5
i = 6
time period
shock level
• • • • • • •
• • • • • •
• • • • •
• • •
• •
•
• • • •
Figure3.1: A Binomial Tree
(A) For case (b), prepare computer code to calculate the arbitrage-free price
Λ0,t of a zero-coupon bond of any given maturity t, given the coefficients
at and bt for each t. Prepare an example taking bt = 0.01 for all t and
a0,a1,...,aT such that EQ
(rt) = 0.01 for all t. (These parameters are of a
typical order of magnitude for monthly periods.) Solve for the price Λ0,t of
a unit zero-coupon riskless bond maturing at time t, for all t in {1,...,50}.
(B) Consider, for any i and t, the price ψ(i,t) at time 0 of a security that
pays one unit of account at time t if and only if Xt = i.
Show that ψ can be calculated recursively by the difference equation
ψ(i,t + 1) =
ψ(i,t)
2[1 + ρt(i)]
+
ψ(i − 1,t)
2[1 + ρt(i − 1)]
, 0 < i < t + 1,
=
ψ(i − 1,t)
2[1 + ρt(i − 1)]
, i = t + 1,
=
ψ(i,t)
2[1 + ρt(i)]
, i = 0.
(28)
The initial condition is ψ(0,0) = 1 and ψ(i,0) = 0 for i > 0. Knowledge of
this “shock-price” function ψ is useful. For example, the arbitrage-free price
at time 0 of a security that pays the dividend f(Xt) at time t (and nothing76 Chapter 3. Dynamic Programming
otherwise) is given by
Pt
i=0 ψt(i)f(i).
(C) In practice, the coefficients at and bt are often fitted to match the ini-
tial term structure Λ0,1,...,Λ0,T , given the “volatility” coefficients b0,...,bT .
The following algorithm has been suggested for this purpose, using the fact
that Λ0,t =
Pt
i=0 ψt(i).
(a) Let ψ(0,0) = 1 and let t = 1.
(b) Fixing ψt−1 and bt, let λt(at−1) =
Pt
i=0 ψt(i), where ψt is given by the for-
ward difference equation (28). Only the dependence of the t-maturity
zero-coupon bond price λt(at−1) on at−1 is notationally explicit. Since
λt(at−1) is strictly monotone in at−1, we can solve numerically for that
coefficient at−1 such that Λ0,t = λt(at−1). (A Newton-Raphson search
will suffice.)
(c) Let t be increased by 1. Return to step (b) if t ≤ T. Otherwise, stop.
Prepare computer code for this algorithm (a)–(b)–(c). Given bt = 0.01
for all t, solve for at for all t, using the Black-Derman-Toy model, given an
initial term structure that is given by Λ0,t = αt
, where α = 0.99.
(D) Extend your code as necessary to give the price of American call options
on coupon bonds of any given maturity. For the coefficients a0,...,aT−1 that
you determined from part (C), calculate the initial price of an American
option on a bond that pays coupons of 0.011 each period until its maturity
at time 20, at which time it pays 1 unit of account in addition to its coupon.
The option has an exercise price of 1.00, ex dividend, and expiration at time
10. Do this for the Black-Derman-Toy model only.
Notes
Bellman’s principle of optimality is due to Bellman [1957]. Freedman [1983]
covers the theory of Markov chains. For general treatments of dynamic pro-
gramming in a discrete-time Markov setting, see Bertsekas [1976] and Bert-
sekas and Shreve [1978]. The proof for Lemma 3B that is sketched in Exer-
cise 3.3, on the differentiability of the value function, is from Benveniste and
Scheinkman [1979], and easily extends to general state spaces; see, for ex-
ample, Duffie [1988b] and Stokey and Lucas [1989]. The semi-group pricing
approach implicit in equation (17) is from Duffie and Garman [1991]. Ex-
ercise 3.8, treating asset pricing with the recursive utility of Exercise 2.9, is3G. Early Exercise and Optimal Stopping 77
extended to the infinite-horizon setting of Epstein and Zin [1989] in Exercise
4.12. See the Notes of Chapter 2 for additional references on recursive utility
and Streufert [1991a], Streufert [1991b] and Streufert [1991c] for more on
dynamic programming with a recursive-utility function. For additional work
on recursive utility and asset pricing in a discrete-time Markovian setting,
see Kan [1995], Ma [991a] and Ma [1994].
The extensive exercise on binomial term-structure models is based almost
entirely on Jamshidian [1991], who emphasizes the connection between the
solution ψ of the difference equation (28) and state pricing of contingent
claims. This connection is reconsidered in Chapters 7 and 11 for continuous-
time applications. The two particular term-structure models appearing in
this exercise are based, respectively, on Ho and Lee [1986] and Black, Der-
man, and Toy [1990]. The parametric form shown here for the Ho-Lee model
is slightly more general than the form actually appearing in Ho and Lee
(1986). Most authors take the convention that Xt+1 is Xt+1 or Xt−1, which
generates a slightly different form for the same model. The two forms are
equivalent after a change of the parameters. Pye [1966], whose work predates
the notion of “risk-neutral valuation” provides a remarkably early precursor
to these discrete-time Markovian models of the term structure. Continuous-
time versions of these models are considered in Chapter 7. Chapter 11 also
deals in more detail with algorithms designed to match the initial term struc-
ture. Exercise 11.5 demonstrates convergence, with a decreasing length of
time period, of the discrete-time Black-Derman-Toy model to its continuous-
time version. Jamshidian [1991] considers a larger class of examples.
Derman and Kani [1994], Dupire [1994], Rubinstein [1994] and Rubinstein
[1995] provide various methods for calibrating a “binomial” Markov stock
price process, similar to that of Section 3F, to the available prices of options
of various strike prices and, in some cases, of various maturities. This is
part of a literature devoted to the smile curve, which refers to the shape
often found for a plot of the “implied volatilities” of option prices derived
from the Black-Scholes formula against the exercise prices of the respective
options. If the assumptions underlying the Black-Scholes formula are correct,
the implied volatility does not depend on the strike price. The smile curve
is discussed once again in Chapter 8, under the topic of stochastic volatility.
Related literature is cited in the Notes of Chapter 8. A related approach
to calibration of the stochastic behavior of the underlying asset price to the
prices of options is considered by Shimko [1993].
Bossaerts, Ghysels, and Gouriéroux [1996] analyze arbitrage-based pricing78 Chapter 3. Dynamic Programming
with stochastic volatility. Jouini, Koehl, and Touzi [1995] explore the effects
of transactions costs and incomplete markets in this setting.Chapter 4
The Infinite-Horizon Setting
THIS CHAPTER PRESENTS infinite-periodanalogues of the results of Chap-
ters 2 and 3. Although it requires additional technicalities and produces few
new insights, this setting is often deemed important for reasons of elegance
or for serving the large-sample theory of econometrics, which calls for an un-
bounded number of observations. We start directly with a Markov dynamic
programming extension of the finite-horizon results of Chapter 3, and only
later consider the implicationsof no arbitrage or optimality for security prices
without using the Markov assumption. Finally, we return to the stationary
Markov setting to review briefly the large-sample approach to estimating as-
set pricing models. Only Sections 4A and 4B are essential; the remainder
could be skipped on a first reading.
4A Markov Dynamic Programming
Suppose X = {X0,X1,X2,...} is a time-homogeneous Markov chain of
shocks valued in a finite set Z = {1,...,k}, defined exactly as in Section
3C, with the exception that there is an infinite number of time periods.
Given a k ×k nonnegative matrix whose rows sum to 1, sources given in the
Notes explain the existence of a probability space (Ω,F,Pi), for each initial
shock i, satisfying the defining properties Pi(X0 = i) = 1 and
Pi(Xt+1 = j | X0,...,Xt) = qX(t),j.
As in Chapter 3, Ft denotes the tribe generated by {X0,...,Xt}. That
is, the source of information is the Markov chain {Xt}. This is the first80 Chapter 4. Infinite Horizon
appearance in the book of a set Ω of states that need not be finite, but
because there is only a finite number of events in Ft for each t, most of
this chapter can be easily understood without referring to Appendix C for a
review of general probability spaces.
Let L denote the space of sequences of random variables of the form
c = {c0, c1, c2,...} such that there is a constant k with the property that
for all t, ct is Ft-measurable with |ct| ≤ k. In other words, L is the space of
bounded adapted processes. Agents choose a consumption process from the
set L+ of nonnegative processes in L. There are N securities; security n is
defined by a dividend process δn
in L and has a price process Sn
in L. A
trading strategy is some θ = (θ1
,...,θN
) ∈ Θ ≡ LN
. Each strategy θ in Θ
generates a dividend process δθ
in L defined, just as in Chapter 2, by
δθ
t = θt−1 · (St + δt) − θt · St, t ≥ 0,
with “θ−1” = 0 by convention. A given agent has an endowment process e
in L+ and, given a particular initial shock i, a utility function U i
: L+ → R.
The agent’s problem is
sup
θ∈Θ(e)
Ui
(e + δθ
),
where Θ(e) = {θ ∈ Θ : e + δθ
≥ 0}.
In order to develop a time-homogeneous Markov model, we restrict our-
selves initially to utility functions, endowments, and security dividends with
special time-homogeneous properties. Given an initial shock i, consider the
utility function Ui
: L+ → R defined by a discount ρ ∈ (0,1) and a strictly
increasing, bounded, concave, and continuous u : R+ → R according to
Ui
(c) = Ei
" ∞ X
t=0
ρt
u(ct)
#
, (1)
where Ei
denotes expectation under the probability measure Pi associated
with the initial shock X0 = i. Suppose that g : Z → R++ and f : Z → RN
++
are such that for all t, the endowment is et = g(Xt) and the dividend vector
is δt = f(Xt). Finally, suppose that security prices are given by some fixed
S : Z → RN
++ so that for all t, St = S(Xt).
We fix a portfolio b in RN
++ and think of −b as a lower bound on short
positions. This restriction will later be removed. For now, however, wealth
is bounded below by
w = min
i∈Z
−b · [S(i) + f(i)].4A. Markov Dynamic Programming 81
Let D = Z × [w,∞). A function F : D → R is defined to be in the
space denoted B(D) if, for each i in Z, F(i, ·) : [w,∞) → R is bounded,
continuous, and concave. We are looking for some V in B(D) as the value
of the agent’s control problem. That is, we want some V in B(D) with
V (i,w) = sup
(c,θ)∈L+×Θ
Ui
(c), (2)
subject to
Wθ
0 = w, (3)
Wθ
t = θt−1 · [S(Xt) + f(Xt)], t ≥ 1, (4)
ct + θt · S(Xt) ≤ Wθ
t + g(Xt), t ≥ 0, (5)
θt ≥ −b, t ≥ 0. (6)
We will solve for the value function V by taking an arbitrary F in B(D)
and, from this candidate, construct a new candidate denoted UF that is
described below. Our method will show that if F = UF, then F = V .
In fact, this approach also leads to an algorithm, called value iteration, for
calculating V . This algorithm is laid out below. For any F in B(D), let
UF : D → R be defined by
UF(i,w) = sup
(θ,c)∈RN×R+
u(c) + ρEi

F X1, θ · [S(X1) + f(X1)]

, (7)
subject to
c + θ · S(i) ≤ w + g(i), (8)
θ ≥ −b. (9)
In other words, UF(i,w) is the supremum utility that can be achieved at
(i,w), assuming that the value function in the next period is F.
Proofs of the next three results are left as exercises.
Fact. If F is in B(D), then UF is in B(D).
For any F and G in B(D), let
d(F,G) = sup{|F(i,w) − G(i,w)| : (i,w) ∈ D},
giving a notion of the distance between any two such functions. Clearly
F = G if and only if d(F,G) = 0.82 Chapter 4. Infinite Horizon
Lemma. For any F and G in B(D), d(UF,UG) ≤ ρd(F,G).
Using this lemma, we can construct the unique solution F to the equation
UF = F, which is known as the Bellman equation for problem (2)–(6). The
solution F is called the fixed point of U and, as shown by the following
result, can be constructed as the limit of the finite-horizon versions of the
value functions as the horizon goes to infinity.
Proposition. Let F−1(i,w) = 0 for all (i,w) in D, and let Ft = UFt−1,
t ≥ 0. Then F(i,w) ≡ limt→∞ Ft(i,w) exists for all (i,w) in D and defines
the unique function F in B(D) satisfying F = UF.
We take F to be the unique fixed point of U. We will show that F is
the value function V of problem (2)–(6). Let C : D → R+ and Φ : D →
RN
be functions defined by letting [C(i,w),Φ(i,w)] solve (7)–(9). Given
the initial conditions (i,w) of (2)–(6), let W ∗
be defined by W∗
0 = w and
W∗
t = Φ(Xt−1,W∗
t−1)·[S(Xt)+f(Xt)], t ≥ 1. Then let (c∗
,θ∗
) be defined by
c∗
t = C(Xt,W∗
t ) and θ∗
t = Φ(Xt,W∗
t ), t ≥ 0. We refer to any such (θ∗
,c∗
)
as an optimal feedback control. The functions Φ and C are the associated
feedback policy functions.
Theorem. The value function V of (2)–(6) is the unique fixed point of U.
Any optimal feedback control (c∗
,θ∗
) solves (2)–(6).
Proof: Let F be the unique solution of the Bellman equation UF = F. Fix
any initial shock i in Z and initial wealth w in [w,∞). Let (θ,c) be an
arbitrary feasible control. For any time t, by the Bellman equation (7)–(9),
F(Xt,Wθ
t ) ≥ u(ct) + ρEi

F(Xt+1,Wθ
t+1) | Xt

.
Multiplying through by ρt
and rearranging,
ρt
F(Xt,Wθ
t ) − ρt+1
Ei

F(Xt+1,Wθ
t+1) | Xt

≥ ρt
u(ct). (10)
Taking expectations on each side, and using the law of iterated expectations,
Ei

ρt
F(Xt,Wθ
t )

− ρt+1
Ei

F(Xt+1,Wθ
t+1)

≥ Ei
[ρt
u(ct)].
Calculating the sum of this expression from t = 0 to t = T, for any time
T ≥ 1, causes telescopic cancellation on the left-hand side, leaving only
Ei

F(X0,Wθ
0 )

− ρT+1
Ei

F(XT+1,Wθ
T+1)

≥ Ei
" T X
t=0
ρt
u(ct)
#
.4B. Dynamic Programming and Equilibrium 83
Since F is a bounded function and ρ ∈ (0,1), the limit of the left-hand side
as T → ∞ is F(i,w). By the Dominated Convergence Theorem (Appendix
C), the limit of the right-hand side is Ui
(c). Thus F(i,w) ≥ Ui
(c), implying
that F(i,w) ≥ V (i,w) for any i and w. All of the above calculations apply
for the given optimal feedback control (c∗
,θ∗
), for which we can replace the
inequality in (10) with an equality, using the definition of C and Φ. This
leaves F(i,w) = Ui
(c∗
). It follows, since (i,w) is arbitrary, that V is indeed
the value function and that (c∗
,θ∗
) is optimal, in that it solves (2)-(6), proving
the result.
4B Dynamic Programming and Equilibrium
Section 4A shows the existence of optimal control in feedback form, given
by policy functions C and Φ that specify optimal consumption and port-
folio choices in terms of the current shock–wealth pair (i,w). In order to
characterize an equilibrium by the same approach, we adopt stronger utility
conditions for this section. In addition to our standing assumption that u is
strictly increasing, bounded, concave, and continuous, we add the following
regularity condition.
Assumption A. The function u is strictly concave and differentiable on
(0,∞).
We define S to be a single-agent Markov equilibrium if associated opti-
mal feedback policy functions C and Φ can be chosen so that for any shock
i, C(i,0) = g(i) and Φ(i,0) = 0. With this, the consumption and security
markets always clear if the agent is originally endowed with no wealth be-
yond that of his or her private endowment. The short sales restriction on
portfolios is superfluous in equilibrium since this short sales constraint is not
binding at the solution (e,0), and since the equilibrium shown (which is the
unique equilibrium) does not depend on the particular lower bound −b cho-
sen. (It is assigned as an exercise to verify this fact.) Our main objective is
to demonstrate the following characterization of equilibrium.
Proposition. S is a Markov equilibrium if and only if, for all i,
S(i) =
1
u′[g(i)]
Ei
∞ X
t=1
ρt
u′
[g(Xt)]f(Xt)
!
. (11)84 Chapter 4. Infinite Horizon
The law of iterated expectations implies the following equivalent form of (11),
sometimes called the stochastic Euler equation.
Corollary. S is a Markov equilibrium if and only if, for any time t and any
initial shock i,
S(Xt) =
1
u′[g(Xt)]
Ei

ρu′
[g(Xt+1)][S(Xt+1) + f(Xt+1)] Xt

. (12)
We will demonstrate these results by exploiting the properties of the value
function V .
Fact 1. For each i, V (i, ·) : [w,∞) → R is increasing and strictly concave.
Fact 2. Fixing S arbitrarily, let (C,Φ) be optimal feedback policy functions,
as above. Suppose, at a given i and ŵ > w, that ĉ = C(i,ŵ) > 0. Then
V (i, ·) is continuously differentiable at ŵ with derivative Vw(i,ŵ) = u′
(ĉ).
These two facts, proved in a manner similar to their analogues in Chapter
3, imply, from the first-order conditions of the Bellman equation (7) and the
fact that V solves the Bellman equation, that C and Φ can be chosen with
C(i,0) = g(i) and Φ(i,0) = 0 for all i if and only if
S(i) =
1
u′[g(i)]
Ei
(ρu′
[g(X1)][S(X1) + f(X1)]), i ∈ Z. (13)
Then (13) is equivalent to (11) and (12), proving the Proposition and Corol-
lary.
4C Arbitrage and State Prices
We turn away from the special case of Markov uncertainty in order to investi-
gate the implications of lack of arbitrage and of optimality for security prices
in an abstract infinite-horizon setting. Suppose Ω is a set, F is a tribe on Ω,
and, for each nonnegative integer t, Ft is a finite sub-tribe with Ft ⊂ Fs for
s ≥ t. We also fix a probability measure P on (Ω,F). As usual, we assume
that F0 includes only events of probability 0 or 1. We again denote by L
the space of bounded adapted processes. There are N securities; security n
is defined by a dividend process δn
in L and has a price process Sn
in L. A
trading strategy is some θ = (θ1
,...,θN
) ∈ Θ ≡ LN
.4D. Optimality and State Prices 85
An arbitrage is a trading strategy θ with δθ
> 0. If there is no arbitrage,
then for any T, there is no T-period arbitrage, meaning an arbitrage θ with
θt = 0, t ≥ T. Fixing T momentarily, if there is no T-period arbitrage, then
the results of Chapter 2 imply that there is a T-period state-price deflator,
a strictly positive process πT
in L with πT
0 = 1 such that for any trading
strategy θ with θt = 0, t ≥ T, we have E(
PT
t=0 πT
t δθ
t ) = 0. Likewise, there is
a (T +1)-period state-price deflator πT+1
. It can be checked that the process
π̂ defined by π̂t = πT
t , t ≤ T, and π̂t = πT+1
t , t > T, is also a (T + 1)-period
state-price deflator. By induction in T, this means that there is a strictly
positive adapted process π such that for any trading strategy θ with θt = 0
for all t larger than some T, we have E(
P∞
t=0 πt δθ
t ) = 0. In particular, π
has the property that for any times t and τ ≥ t, we have the now-familiar
state-pricing relationship
St =
1
πt
Et πτ Sτ +
τ X
j=t+1
πj δj
!
. (14)
Equation (14) even holds when τ is a bounded stopping time. Unfortu-
nately, there is no reason (yet) to believe that there is a state-price deflator,
a strictly positive adapted process π such that (14) holds for τ an unbounded
stopping time, or that for any t,
St =
1
πt
Et
∞ X
j=t+1
πj δj
!
. (15)
Indeed, the right-hand side of (15) may not even be well defined. We need
some restriction on π!
We call an adapted process x mean-summable if E (
P∞
t=0 |xt|) < ∞, and
let L∗
denote the space of mean-summable processes. If π ∈ L∗
and c ∈
L, then the Dominated Convergence Theorem (Appendix C) implies that
E (
P∞
t=0 πt ct) is well defined and finite, so L∗
may be a natural space of
candidate state-price deflators if (15) is to work.
4D Optimality and State Prices
An agent is defined by an endowment process e in the space L+ of nonnegative
processes in L, and by a strictly increasing utility function U : L+ → R.86 Chapter 4. Infinite Horizon
Given the dividend-price pair (δ, S) ∈ LN
×LN
, the agent faces the problem
sup
θ
U(e + δθ
). (16)
We say that the utility function U is L∗
-smooth at c if the gradient ∇U(c)
exists and moreover has a unique Riesz representation π in L∗
defined by
∇U(c;x) = E
∞ X
t=0
πt xt
!
,
for any feasible direction x in L. (See Appendix B for the definition of the
gradient and feasible directions.) For example, suppose that U is defined
by U(c) = E [
P∞
t=0 ρt
u(ct)], where u : R+ → R is strictly increasing and
continuously differentiable on (0,∞), and where ρ ∈ (0,1). Then, for any c
in L+ that is bounded away from zero, U is L∗
-smooth at c, any x in L is a
feasible direction at c, and
∇U(c;x) = E
" ∞ X
t=0
ρt
u′
(ct)xt
#
, x ∈ L, (17)
implying that the Riesz representation of the utility gradient is in this case
the process π defined by πt = ρt
u′
t(ct).
More generally, we have the following characterization of state-price de-
flators.
Proposition. Suppose c∗
solves (16), c∗
is bounded away from zero, and U is
L∗
-smooth at c∗
. Then the Riesz representation π of ∇U(c∗
) is a state-price
deflator.
Corollary. Suppose, moreover, that U is defined by
U(c) = E
" ∞ X
t=0
ρt
u(ct)
#
,
where ρ ∈ (0,1) and u has a strictly positive derivative on (0,∞). Then π,
defined by πt = ρt
u′
(c∗
t ), is a state-price deflator and, for any time t and
stopping time τ > t,
St =
1
u′(c∗
t )
Et
"
ρτ−t
u′
(c∗
τ)Sτ +
τ X
j=t+1
ρj−t
u′
(c∗
j)δj
#
.4E. Method-of-Moments Estimation 87
This corollary gives a necessary condition for optimality that, when spe-
cialized to the case of equilibrium, recovers the stochastic Euler equation
(12) as a necessary condition on equilibrium without relying on Markov un-
certainty or dynamic programming. For sufficiency, we should give conditions
under which the stochastic Euler equation implies that S is an equilibrium.
For this, we define S to be a single-agent equilibrium if θ∗
= 0 solves (16)
given S.
Theorem. Suppose that U is strictly increasing, concave, and L∗
-smooth at
the endowment process e. Suppose that the endowment process e is bounded
away from zero. Let π ∈ L∗
be the Riesz representation of ∇U(e). It is
necessary and sufficient for S to be a single-agent equilibrium that π is a
state-price deflator.
The assumption that e is bounded away from zero is automatically satis-
fied in the Markovian example of Section 4A. Proof of the theorem is assigned
as an exercise.
4E Method-of-Moments Estimation
Although it is not our main purpose to delve into econometrics, it seems
worthwhile to illustrate here why the infinite-horizon setting is deemed useful
for empirical modeling.
Suppose, for some integer m ≥ 1, that B ⊂ Rm
is a set of parameters.
Each b in B corresponds to a different Markov economy with the same state
space Z. In particular, the transition matrix q(b) of the Markov process X
may vary with b. For instance, we could take a single agent with utility
given by a discount factor ρ ∈ (0,1) and a reward function uα(x) = xα
/α
for α < 1 (with u0(x) = logx). We could then take m = 2 and b = (ρ,α) ∈
B = (0,∞) × (−∞,1). In this example, the transition matrix q(b) does not
depend on b.
We fix some b0 in B, to be thought of as the “true” parameter vector
governing the economy. Our goal is to estimate the unknown parameter
vector b0.
For simplicity, we will assume that the transition matrix q(b0) of X is
strictly positive. With this, a result known as the Frobenius-Perron Theorem
implies that there is a unique vector p ∈ Rk
++ whose elements sum to 1 with
the property that q(b0)⊤
p = p. Letting q(b0)t
denote the t-fold product88 Chapter 4. Infinite Horizon
of q(b0), we see that Pi(Xt = j) = q(b0)t
ij, so that q(b0)t
is the t-period
transition matrix. It can be shown that p is given by any row of limt q(b0)t
.
Thus, regardless of the initial shock i, limt Pi(Xt = j) = pj. Indeed, the
convergence to the “steady-state” probability vector p is exponentially fast,
in the sense that there is a constant β > 1 such that for any i and j,
βt
[pj − Pi(Xt = j)] → 0. (18)
From this, it follows immediately that for any H : Z → R and any initial
condition j ∈ Z, we have Ej
[H(Xt)] →
Pk
i=1 piH(i), and again convergence
is exponentially fast. The empirical distribution vector pT of X at time T is
defined by
pTi =
1
T
#{t < T : Xt = i},
where #A denotes the number of elements in a finite set A. That is, pTi is
the average fraction of time, up to T, spent in state i. From the law of large
numbers for i.i.d. sequences of random variables, it is not hard to show that
pT converges almost surely to the steady-state distribution vector p. Proof of
this fact is assigned as Exercise 4.14, which includes a broad hint. From this,
we have the following form of the law of large numbers for Markov chains.
The Strong Law of Large Numbers for Markov Chains. For any
H : Z → R, the empirical average
PT
t=0 H(Xt)/T converges almost surely to
the steady-state mean
Pk
i=1 piH(i).
Proof: Since
PT
t=0 H(Xt)/T =
Pk
i=1 pTiH(i), the result follows from the
fact that pT → p almost surely.
Suppose that there is some integer ℓ ≥ 0 such that for each time t, the
econometricianobserves at time t+ℓ the data h(Yt), where Yt = (Xt,Xt+1,...,Xt+ℓ)
and h : Zℓ+1
→ Rn
. For example, the data could be in the form of security
prices, dividends, endowments, or functions of these. It is easy to check that
the strong law of large numbers would apply even if q(b0) were not strictly
positive, provided the t-period transition matrix q(b0)t
is strictly positive for
some t. From this fact, Y also satisfies the strong law of large numbers, since
Y can be treated as a Markov process whose (ℓ+1)-period transition matrix
is strictly positive. In particular, for any G : Zℓ+1
→ R, the empirical aver-
age
PT
t=1 G(Yt)/T converges almost surely to the corresponding steady-state
mean, which is also equal to limt Ei
[G(Yt)], a quantity that is independent
of the initial shock i.4E. Method-of-Moments Estimation 89
We now specify some test moment function K : Rn
× B → RM
, for some
integer M, with the property that for all t, Et (K[h(Yt),b0]) = 0. For a simple
example, we could take the single-agent Markov equilibrium described by the
stochastic Euler equation (13), where the utility function is specified as above
by the unknown parameter vector b0 = (ρ0,α0). For this example, we can
let Yt = (Xt,Xt+1) and let h(Yt) = (Rt+1,et+1,et), where et = g(Xt) is the
current endowment and Rt is the RN
-valued return vector defined by
Rit =
Si(Xt) + fi(Xt)
Si(Xt−1)
, i ∈ {1,...,N}.
With M = N and b = (ρ,α), we can let
Ki[h(Yt),b] =
ρeα−1
t+1 Ri,t+1
eα−1
t
− 1. (19)
From (13), we confirm that Et[K(Yt,b0)] = 0.
We know from the strong law of large numbers that for each b in B,
the empirical average KT (b) ≡
PT
t=1 K(Yt,b)/T converges almost surely to
a limit denoted K∞(b). By the law of iterated expectations, for any initial
state i,
Ei
[K(Yt,b0)] = Ei
(Et[K(Yt,b0)]) = 0.
From this, we know that K∞(b0) = 0 almost surely. A natural estimator of
b0 at time t is then given by a solution b̂t to the problem
inf
b∈B
k Kt(b) k . (20)
Any such sequence {b̂t} of solutions to (20) is called a generalized-method-
of-moments, or GMM, estimator of b0. Under conditions, one can show that
a GMM estimator is consistent, in the sense that b̂t → b0 almost surely. A
sufficient set of technical conditions is as follows.
GMM Regularity Conditions. The parameter set B is compact. For any
b in B other than b0, K∞(b) 6= 0. The function K is Lipschitz with respect
to b, in the sense that there is a constant k such that for any y in Zℓ+1
and
any b1 and b2 in B, we have
k K(y,b1) − K(y,b2) k ≤ k k b1 − b2 k .
Theorem. Under the GMM regularity conditions, a GMM estimator exists
and any GMM estimator is consistent.
The proof follows immediately from the following proposition.90 Chapter 4. Infinite Horizon
Uniform Strong Law of Large Numbers. Under the GMM regularity
conditions,
sup
b∈B
|KT (b) − K∞(b)| → 0 almost surely.
Proof: The following proof is adapted from a source indicated in the Notes.
Without loss of generality for the following arguments, we can take M = 1.
Since B is a compact set and K is Lipschitz with respect to b, for each
ǫ ∈ (0,∞) there is a finite set Bǫ ⊂ B with the following property: For any
b in B there is some bǫ and bǫ
in Bǫ satisfying, for all y,
K(y,bǫ) ≤ K(y,b) ≤ K(y,bǫ
), |K(y,bǫ) − K(y,bǫ
)| ≤ ǫ. (21)
As is customary, for any sequence {xn} of numbers we let
limn xn = sup
n
inf
k≥n
xk.
For a given ǫ > 0,
limt inf
b

Kt(b) − K∞(b)

≥ limt inf
b

Kt(bǫ) − K∞(b)

≥ limt inf
b

Kt(bǫ) − K∞(bǫ)

+inf
b

K∞(bǫ) − K∞(b)

≥ −ǫ almost surely,
by the strong law of large numbers, (21), and the fact that Bǫ is finite. Let
Aǫ ⊂ Ω be the event of probability 1 on which this inequality holds, and let
A = A1 ∩ A1/2 ∩ A1/3 ···. Then A also has probability 1, and on A we have
limt inf
b

Kt(b) − K∞(b)

≥ 0. (22)
Likewise, by using bǫ
in place of bǫ and −K in place of K, we have
limt inf
b

−Kt(b) + K∞(b)

≥ 0 almost surely. (23)
The claim follows from (22) and (23).4E. Method-of-Moments Estimation 91
The Notes cite papers that prove the consistency of GMM estimators
under weaker conditions and analyze the theoretical properties of this esti-
mator. Included in these are technical conditions implying the normality of
the limit of the distribution of (bt − b0)/
√
t, as well as the form of covari-
ance matrix Σ of this asymptotic distribution. As shown in these references,
the efficiency properties of the GMM estimator, in terms of this asymptotic
covariance matrix Σ, can be improved by replacing the criterion function
b 7→k Kt(b) k in (20) with the criterion function b 7→ Kt(b)⊤
WtKt(b), for a
particular adapted sequence {Wt} of positive semi-definite “weighting” ma-
trices. Other papers cited in the Notes apply GMM estimators in a financial
setting.
Exercises
Exercise 4.1 Prove Fact 4A.
Exercise 4.2 Prove Lemma 4A.
Exercise 4.3 Prove Proposition 4A.
Exercise 4.4 Prove Fact 1 of Section 4B.
Exercise 4.5 Prove Fact 2 of Section 4B.
Exercise 4.6 Show that (13) is necessary and sufficient for optimality of
C(i,0) = g(i) and Φ(i,0) = 0, that is, for equilibrium.
Exercise 4.7 Show that (11), (12), and (13) are equivalent.
Exercise 4.8 Show that the constraint (9), placing a lower bound on port-
folios, is not binding in a Markov equilibrium.
Exercise 4.9 Suppose there is a single security with price process S ≡ 1
and with dividend process δ satisfying δt > −1 for all t. The utility function
U is defined by (1), where u(x) = xα
/α for α < 1 and α 6= 0. The endowment
process e is given by et = 0, t > 1, and e0 = w > 0. Let L+ denote the space
of nonnegative adapted processes. With a nonnegative wealth constraint and
no other bounding restrictions, the agent’s problem is modified to
sup
c∈L+
U(c) subject to Wc
t ≥ 0, t ≥ 0, (24)92 Chapter 4. Infinite Horizon
where Wc
0 = w and Wc
t = (Wc
t−1 − ct−1)(1 + δt), t > 1.
(A) Suppose δt = ǫ for all t, where ǫ > −1 is a constant. Provide regularity
conditions on α, ρ, and ǫ under which there exists a solution to (24). Solve for
the value function and the optimal consumption control. Hint: Use dynamic
programming and conjecture that the value function is of the form V (w) =
kwα
/α for some constant k. Solve the Bellman equation explicitly for V , and
then show that the Bellman equation characterizes optimality by showing
that V (w) ≥ U(c) for any feasible c, and that V (w) = U(c∗
), where c∗
is
your candidate control. Note that this will require a demonstration that
ρt
V (Wc
t ) → 0 for any feasible c. (B) Suppose that δ is an i.i.d. process.
Provide regularity conditions on β = ρE[(1 + δ1)α
], ρ, and α under which
there exists a solution to (24). Solve for the value function and the optimal
consumption control. (C) Solve parts (A) and (B) once again for u(x) =
log(x), x > 0, and u(0) = −∞. The utility function U may now take −∞ as
a value.
Exercise 4.10 Extend the solutions to parts (D) and (E) of Exercise 3.8
to the infinite-horizon case, adding any additional regularity conditions on
the parameters (γ,α,ρ,A,B,σ2
) that you feel are called for.
Exercise 4.11 Demonstrate the Riesz representation (17) of the gradi-
ent of the additive discounted utility function. Hint: Use the Dominated
Convergence Theorem.
Exercise 4.12 Prove Theorem 4D.
Exercise 4.13 Prove relation (18), showing exponential convergence of
probabilities to their steady-state counterparts.
Exercise 4.14 Prove the version of the strong law of large numbers shown
in Section 4E. Hint: Prove the almost sure convergence of the empirical
distribution vector pT to p by using the strong law of large numbers for i.i.d.
random variables with finite expectations. For this, given any l ∈ Z, let τn(l)
be the n-th time t ≥ 0 that Xt = l. Note that
Qnlj ≡ #{t : Xt = j, τn(l) ≤ t < τn+1}
has a distribution that does not depend on n or the initialstate i, and that for
each l and j, the sequences {Q1lj,Q2lj,...} and {tn}, with tn = τn+1(l)−τn(l),4E. Method-of-Moments Estimation 93
are each i.i.d. with distributions that do not depend on the initial state i.
Complete the proof from this point, considering the properties, for each l
and j in Z, of
N−1
PN
n=1 Qnlj
N−1
PN
n=1 tn
.
Notes
Freedman [1983] covers the theory of Markov chains. Revuz [1975] is a treat-
ment of Markov processes on a general state space. Sections 4A and 4B
are based on Lucas [1978], although the details here are different. LeRoy
[1973] gives a precursor of this model. The probability space, on which the
Markov process X is defined, is constructed in Bertsekas and Shreve [1978].
The fixed-point approach of Section 4A is based on Blackwell [1965]; Lemma
4A, in more general guises, is called Blackwell’s Theorem. The results ex-
tend easily to a general compact metric space Z of shocks, as, for example,
in Lucas [1978], Duffie [1988b], or Stokey and Lucas [1989]. Smoothness
of the policy function or the value function is addressed by Benveniste and
Scheinkman [1979]. Santos [1991] and Santos [1994] have recent results on
smoothness and provide references to the extensive related literature. Ver-
sions of some of the results for this chapter that include production are found
in Brock [1979], Brock [1982], Duffie [1988b] and Stokey and Lucas [1989].
The recursive-utility model was introduced into this setting by Epstein and
Zin [1989]. See also Becker and Boyd [1992], Hong and Epstein [1989], ?], ?],
Ma [991a], ?], Ma [1996], Streufert [1991a], Streufert [1991b] and Streufert
[1991c]. Wang [1991] and Wang [993b] show the generic ability to distinguish
between additive and nonadditive recursive utility from security-price data.
Sections 4C and 4D are slightly unconventional, and are designed merely
to bridge the gap from the finite-dimensional results of Chapter 2 to this
infinite-dimensional setting. Strong assumptions are adopted here in order
to guarantee the “transversality” conditions. Much weaker conditions suffice.
See, for example, Kocherlakota [1990]. Schachermayer [1994] and Santos and
Woodford [] give conditions for the existence of a state-price deflator in this
and more general settings. Yu [1997] treats arbitrage valuation with frictions
in this setting.
Kandori [1988] gives a proof of Pareto optimality and a representative
agent in a complete-markets general equilibrium model. Examples are given
by Abel [1986], Campbell [1984], Donaldson, Johnson, and Mehra [1987], and94 Chapter 4. Infinite Horizon
Dumas and Luciano [1989]. Further characterization of equilibrium is given
by Prescott and Mehra [1980] and Donaldson and Mehra [1984]. Hernandez
and Santos [1994], Levine [1989], Levine and Zame [1996], ?], Lucas [1995],
Magill and Quinzii [1996], and Magill and Quinzii [1994]. Araujo, Monteiro,
and Páscoa [1996] show conditions for the existence of equilibrium in an
incomplete market with incomplete markets. Conditions for the existence of a
stationary Markov equilibrium (with incomplete markets and heterogeneous
agents) are given by Duffie, Geanakoplos, Mas-Colell, and McLennan [1994].
The role of debt constraints in promoting existence of equilibria in this
setting is developed by Florenzano and Gourdel [1993], Kehoe and Levine
[1993], Levine and Zame [1996], Magill and Quinzii [1996] and Magill and
Quinzii [1994]. The related issue of speculative bubbles is addressed by Gilles
and LeRoy [992a], Gilles and LeRoy [992b], Magill and Quinzii [1996] and
Santos and Woodford []. Kurz [1992], and Kurz [1993], Kurz [1997], and
Kurz and Beltratti [1996] develop the implications of stationarity and ratio-
nality in this setting. propose a rational-beliefs model that allows individual
probability assessments by agents to be restricted only by absence of conflict
with long-run empirical behavior. Shannon [1996] gives conditions for deter-
minacy. Hansen and Sargent [1990] have worked out extensive examples for
equilibrium in this setting with quadratic utilities and linear dynamics.
A recent spate of literature has addressed the issue of asset pricing with
heterogeneous agents and incomplete markets, partly spurred by the equity
premium puzzle pointed out by Mehra and Prescott [1985], showing the differ-
ence in expected returns between equity and riskless bonds to be far in excess
of what one would find from a typical representative-agent model. Bewley
[1982] and Mankiw [1986] have seminal examples of the effects of incomplete
markets. The more recent literature includes Acharya and Madan [1993a],
Acharya and Madan [1993b], Aiyagari and Gertler [1990], Calvet [1999], Con-
stantinides and Duffie [1996], Duffie [1992], Haan [1994], Heaton and Lucas
[1996] Judd [1997], ?], Lucas [1991], Marcet and Singleton [1991], Mehrling
[1990], Mehrling [1994], Sandroni [1995], Scheinkman [1989], Scheinkman
and Weiss [1986], Svensson and Werner [1993] Telmer [1993] and Weil [1992].
Others have attempted to resolve the perceived equity premium puzzle by
turning to more general utility functions, such as the habit-formation model
(see, for example, Constantinides [1990] and Hansen and Jaganathan [1990])
or the recursive model (see Epstein and Zin [1989] and Epstein and Zin
[1991]). For the effect of first-order risk aversion or Knightian uncertainty,4E. Method-of-Moments Estimation 95
see Epstein and Wang [1994]. Judd, Kubler, and Schmedders [1997] and
Santos and Vigo [1995] treat the computation of equilibria in this setting.
Dumas and Luciano [1989] treat optimal portfolio selection with transac-
tions costs in this setting. Cover and Ordentlich [1996] is a recent example
of the literature on optimal long-run returns, sometimes called log-optimal
growth-rate models.
Section 4E gives a “baby version” of the estimation technique used in
Hansen and Singleton [1982] and Hansen and Singleton [1983]. Brown and
Gibbons [1985] give an alternative exposition of this model. The generalized
method of moments, in a much more general setting than that of Section 4E,
is shown by Hansen [1982] to be consistent. We have used the exponential
convergence of probabilities given by equation (18) to avoid the assumption
that the shock process X is stationary. This extends to a more general
Markov setting under regularity conditions. The proof given for the uniform
strong law of large numbers is based on Pollard [1984]. A general treatment
of method-of-moments estimation can be found in Gallant and White [1988].
Duffie and Singleton [1993], Lee and Ingram [1991], McFadden [1986] and
Pakes and Pollard [1986] extend the GMM to a setting with simulated esti-
mation of moments. General treatments of dynamic programming are given
by Bertsekas and Shreve [1978] and Dynkin and Yushkevich [1979]. Exer-
cise 4.11 is based on Samuelson [1969] and Levhari and Srinivasan [1969],
and is extended by Hakansson [1970], Blume, Easley, and O’Hara [1982] and
others. For a related turnpike theorem, see Hakansson [1974]. Many further
results in the vein of Chapter 4 are summarized in Duffie [1988b] uffie and,
especially, Stokey and Lucas [1989].
Barberis, Huang, and Santos [1999] proposed a limited-rationality asset
pricing model that stressed the role of investors’ aversion to negative asset
returns.
?]
?]96 Chapter 4. Infinite HorizonChapter 5
The Black-Scholes Model
THIS CHAPTER PRESENTS the basic Black-Scholes model of arbitrage
pricing in continuous time, as well as extensions to a nonparametric mul-
tivariate Markov setting. We first introduce the Brownian model of uncer-
tainty and continuous security trading, and then derive partial differential
equations for the arbitrage-free prices of derivative securities. The classic
example is the Black-Scholes option-pricing formula. Chapter 6 extends to a
non-Markovian setting using more general techniques.
5A Trading Gains for Brownian Prices
We fix a probability space (Ω,F,P). A process is a measurable function on
Ω×[0,∞) into R. (For a definition of measurability with respect to a product
space of this variety, see Appendix 6M.) The value of a process X at time t
is the random variable variously written as Xt, X(t), or X(·,t) : Ω → R. A
standard Brownian motion is a process B defined by the following properties:
(a) B0 = 0 almost surely;
(b) for any times t and s > t, Bs − Bt is normally distributed with mean
zero and variance s − t;
(c) for any times t0,...,tn such that 0 ≤ t0 < t1 < ··· < tn < ∞, the
random variables B(t0), B(t1) − B(t0), ...,B(tn) − B(tn−1) are inde-
pendently distributed; and
(d) for each ω in Ω, the sample path t 7→ B(ω,t) is continuous.98 Chapter 5. The Black-Scholes Model
It is a nontrivial fact, whose proof has a colorful history, that the probabil-
ity space (Ω,F,P) can be constructed so that there exist standard Brownian
motions. By 1900, in perhaps the first scientific work involving Brownian mo-
tion, Louis Bachelier proposed Brownian motion as a model of stock prices.
We will follow his lead for the time being and suppose that a given standard
Brownian motion B is the price process of a security. Later we consider more
general classes of price processes.
The tribe FB
t generated by {Bs : 0 ≤ s ≤ t} is, on intuitive grounds,
a reasonable model of the information available at time t for trading the
security, since FB
t includes every event based on the history of the price
process B up to that time. For technical reasons, however, one must be
able to assign probabilities to the null sets of Ω, the subsets of events of
zero probability. For this reason, we will fix instead the standard filtration
F = {Ft : t ≥ 0} of B, with Ft defined as the tribe generated by the union of
FB
t and the null sets. The probability measure P is also extended by letting
P(A) = 0 for any null set A. This completion of the probability space is
defined in more detail in Appendix C.
A trading strategy is an adapted process θ specifying at each state ω and
time t the number θt(ω) of units of the security to hold. If a strategy θ is a
constant, say θ, between two dates t and s > t, then the total gain between
those two dates is θ(Bs−Bt), the quantity held multipliedby the price change.
So long as the strategy is piecewise constant, we would have no difficulty in
defining the total gain between any two times. In order to make for a good
model of trading gains when we do not necessarily require piecewise constant
trading, a trading strategy θ is required to satisfy
R T
0
θ2
t dt < ∞ almost surely
for each T. Let L2
denote the space of adapted processes satisfying this
integrability restriction. For each θ in L2
there is an adapted process with
continuous sample paths, denoted
R
θdB, that is called the stochastic integral
of θ with respect to B. The definition of
R
θdB is outlined in Appendix D.
The value of the process
R
θdB at time T is usually denoted
RT
0
θt dBt, and
represents the total gain generated up to time T by trading the security with
price process B according to the trading strategy θ.
An interpretation of
RT
0
θt dBt can be drawn from the discrete-time ana-
logue
PT
t=0 θt ∆1
Bt, where ∆1
Bt ≡ Bt+1 − Bt, that is, the sum (over t) of
the shares held at t multiplied by the change in price between t and t + 1.
More generally, let ∆n
Bt = B(t+1)/n −Bt/n. In a sense that we shall not make
precise,
RT
0
θt dBt can be thought of as the limit of
PTn
t=0 θt/n ∆n
Bt, as the5B. Martingale Trading Gains 99
number n of trading intervals per unit of time goes to infinity. This state-
ment is literally true, for example, if θ has continuous sample paths, taking
“limit” to mean limit in probability. The definition of
RT
0
θt dBt as a limit in
probability of the discrete-time analogue extends to a larger class of θ, but
not large enough to capture some of the applications in later chapters. The
definition of
RT
0
θt dBt given in Appendix D therefore admits any θ in L2
.
The stochastic integral has some of the properties that one would expect
from the fact that it is a good model of trading gains. For example, suppose
a trading strategy θ is piecewise constant on [0,T ] in that for some stopping
times t0,...,tN with 0 = t0 < t1 < ··· < tN = T, and for any n, we have
θ(t) = θ(tn−1) for all t ∈ [tn−1,tn). Then
Z T
0
θt dBt =
N X
n=1
θ(tn−1)[B(tn) − B(tn−1)].
A second natural property of stochastic integration as a model for trading
gains is linearity: For any θ and ϕ in L2
and any scalars a and b, the process
aθ + bϕ is also in L2
, and, for any time T > 0,
Z T
0
(aθt + bϕt)dBt = a
Z T
0
θt dBt + b
Z T
0
ϕt dBt.
5B Martingale Trading Gains
The properties of standard Brownian motion imply that B is a martingale.
(This follows basically from the property that its increments are independent
and of zero expectation.) A process θ is bounded if there is a fixed constant
k such that |θ(ω,t)| ≤ k for all (ω,t). For any bounded θ in L2
, the law of it-
erated expectations and the “martingality” of B imply, for any integer times
t and τ > t, that Et(
Pτ
s=t θs ∆1
Bs) = 0. This means that the discrete-time
gain process X, defined by X0 = 0 and Xt =
Pt−1
s=0 θs ∆1
Bs, is itself a mar-
tingale with respect to the discrete-time filtration {F0,F1,...}, an exercise
for the reader. The same is also true in continuous time: For any bounded
θ in L2
,
R
θdB is a martingale. This is natural; it should be impossible
to generate an expected profit by trading a security that never experiences
an expected price change. If one places no bound or other restriction on θ,100 Chapter 5. The Black-Scholes Model
however, the expectation of
R T
0
θt dBt may not even exist. Even if
R T
0
θt dBt
and its expectation exist, we may not have a reasonable model of trading
gains without some restriction on θ, as shown by example in Chapter 6. The
following proposition assists in determining whether the expectation or the
variance of
R T
0
θt dBt is finite, and whether
R
θdB is indeed a martingale.
Consider the spaces
H1
=
(
θ ∈ L2
: E
"Z T
0
θ2
t dt
1/2
#
< ∞, T > 0
)
H2
=

θ ∈ L2
: E
Z T
0
θ2
t dt

< ∞, T > 0

.
Of course, H2
is contained by H1
.
Proposition. If θ is in H1
, then
R
θdB is a martingale. If
R
θdB is a
martingale, then
var
Z T
0
θt dBt

= E
Z T
0
θ2
t dt

. (1)
In particular, (1) applies to any θ in H2
. A proof of the proposition is cited
in the Notes.
5C Ito Prices and Gains
As a model of security-price processes, standard Brownian motion is too
restrictive for most purposes. Consider, instead, a process of the form
St = x +
Z t
0
µs ds +
Z t
0
σs dBs, t ≥ 0, (2)
where x is a real number, σ is in L2
, and µ is in L1
, meaning that µ is an
adapted process such that
R t
0
|µs|ds < ∞ almost surely for all t. We call a
process S of this form (2) an Ito process. It is common to write (2) in the
informal “differential” form
dSt = µt dt + σt dBt; S0 = x.
One often thinks intuitively of dSt as the “increment” of S at time t, made up
of two parts, the “dt” part and the “dBt” part. In order to further interpret5C. Ito Prices and Gains 101
this differential representation of an Ito process, suppose that σ and µ have
continuous sample paths and are in H2
. It is then literally the case that for
any time t,
d
dτ
Et (Sτ)
τ=t
= µt almost surely (3)
and
d
dτ
vart (Sτ)
τ=t
= σ2
t almost surely, (4)
where the derivatives are taken from the right, and where, for any random
variable X with finite variance, vart(X) ≡ Et(X2
) − [Et(X)]2
is the Ft-
conditional variance of X. In this sense of (3) and (4), we can interpret µt
as the rate of change of the expectation of S, conditional on information
available at time t, and likewise interpret σ2
t as the rate of change of the
conditional variance of S at time t. One sometimes reads the associated
abuses of notation “Et(dSt) = µt dt” and “vart(dSt) = σ2
t dt.” Of course, dSt
is not even a random variable, so this sort of characterization is not rigorously
justified and is used purely for its intuitive content. We will refer to µ and σ
as the drift and diffusion processes of S, respectively. Many authors reserve
the term “diffusion” for σ2
t or other related quantities.
For an Ito process S of the form (2), let L(S) denote the space consisting
of any adapted process θ with {θt µt : t ≥ 0} in L1
and {θt σt : t ≥ 0} in
L2
. For θ in L(S), we define the stochastic integral
R
θdS as the Ito process
given by
Z T
0
θt dSt =
Z T
0
θtµt dt +
Z T
0
θtσt dBt, T ≥ 0. (5)
We also refer to
R
θdS as the gain process generated by θ, given the price pro-
cess S. If θ ∈ L(S) is such that {θtσt : t ≥ 0} is in H2
and E
RT
0
θtµt dt
2

<
∞, then we write that θ is in H2
(S). By Proposition 5B, if θ is in H2
(S)
then
R
θdS is a finite-variance process.
We will have occasion to refer to adapted processes θ and ϕ that are equal
almost everywhere, by which we mean that E(
R∞
0
|θt − ϕt|dt) = 0. In fact,
we shall write “θ = ϕ” whenever θ = ϕ almost everywhere. This is a natural
convention, for suppose that X and Y are Ito processes with X0 = Y0 and
with dXt = µt dt+σt dBt and dYt = at dt+bt dBt. Since stochastic integrals
are defined for our purposes as continuous sample path processes, it turns
out that Xt = Yt for all t almost surely if and only if µ = a almost everywhere102 Chapter 5. The Black-Scholes Model
and σ = b almost everywhere. We call this the unique decomposition property
of Ito processes.
5D Ito’s Formula
More than any other result, Ito’s Formula is the basis for explicit solutions
to asset-pricing problems in a continuous-time setting.
Ito’s Formula. Suppose X is an Ito process with dXt = µt dt + σt dBt and
f : R2
→ R is twice continuously differentiable. Then the process Y , defined
by Yt = f(Xt,t), is an Ito process with
dYt =

fx(Xt,t)µt + ft(Xt,t) +
1
2
fxx(Xt,t)σ2
t

dt + fx(Xt,t)σt dBt. (6)
A generalization of Ito’s Formula (6) appears later in the chapter.
5E The Black-Scholes Option-Pricing Formula
Consider a security, to be called a stock, with price process
St = x exp(αt + σBt), t ≥ 0, (7)
where x > 0, α, and σ are constants. Such a process, called a geometric
Brownian motion, is often called log-normal because, for any t, log(St) =
log(x) + αt+ σBt is normally distributed. Moreover, since Xt ≡ αt+σBt = Rt
0
αds+
Rt
0
σdBs defines an Ito process X with constant drift α and diffusion
σ, and since y 7→ xey
is a C2
function, Ito’s Formula implies that S is an Ito
process and that
dSt = µSt dt + σSt dBt; S0 = x,
where µ = α + σ2
/2. From (3) and (4), at any time t, the rate of change of
the conditional mean of St is µSt, and the rate of change of the conditional
variance is σ2
S2
t , so that per dollar invested in this security at time t, one
may think of µ as the “instantaneous” expected rate of return, and σ as
the “instantaneous” standard deviation of the rate of return. This sort of
characterization abounds in the literature, and one often reads the associated
abuses of notation “E(dSt/St) = µdt” and “var(dSt/St) = σ2
dt.” The5E. The Black-Scholes Option-Pricing Formula 103
coefficient σ is also known as the volatility of S. In any case, a geometric
Brownian motion is a natural two-parameter model of a security-price process
because of these simple interpretations of µ and σ.
Consider a second security, to be called a bond, with the price process β
defined by
βt = β0 ert
, t ≥ 0, (8)
for some constants β0 > 0 and r. We have the obvious interpretation of r
as the continually compounding interest rate, that is, the exponential rate at
which riskless deposits accumulate with interest. Throughout, we will also
refer to r as the short rate. Since {rt : t ≥ 0} is trivially an Ito process, β is
also an Ito process with
dβt = rβt dt. (9)
We can also view (9) as an ordinary differential equation with initialcondition
β0 and solution (8).
We allow any trading strategies a in H2
(S) for the stock and b in H2
(β)
for the bond. Such a trading strategy (a,b) is said to be self-financing if it
generates no dividends (either positive or negative), meaning that for all t,
atSt + btβt = a0S0 + b0β0 +
Z t
0
au dSu +
Z t
0
bu dβu. (10)
The self-financing condition (10) is merely a statement that the current port-
folio value (on the left-hand side) is precisely the initial investment plus any
trading gains, and therefore that no dividend “inflow” or “outflow” is gener-
ated.
Now consider a third security, an option. We begin with the case of a
European call option on the stock, giving its owner the right, but not the
obligation, to buy the stock at a given exercise price K on a given exercise
date T. The option’s price process Y is as yet unknown except for the fact
that YT = (ST − K)+
≡ max(ST − K, 0), which follows from the fact that
the option is rationally exercised if and only if ST > K. (See Exercise 2.1 for
a discrete-time analogue.)
Suppose there exists a self-financing trading strategy (a,b) in the stock
and bond with aT ST + bT βT = YT. If a0S0 + b0β0 < Y0, then one could sell
the option for Y0, make an initial investment of a0S0 + b0β0 in the trading
strategy (a,b), and at time T liquidate the entire portfolio (−1,aT ,bT ) of
option, stock, and bond with payoff −YT + aT ST + bT βT = 0. The initial104 Chapter 5. The Black-Scholes Model
profit Y0 − a0S0 − b0β0 > 0 is thus riskless, so the trading strategy (−1,a,b)
would be an arbitrage. Likewise, if a0S0 +b0β0 > Y0, the strategy (1,−a,−b)
is an arbitrage. Thus, if there is no arbitrage, Y0 = a0S0 + b0β0. The same
arguments applied at each date t imply that in the absence of arbitrage,
Yt = atSt + btβt. A full definition of continuous-time arbitrage is given in
Chapter 6, but for now we can proceed without much ambiguity at this
informal level. Our objective now is to show the following.
The Black-Scholes Formula. If there is no arbitrage, then, for all t < T,
Yt = C(St,t), where
C(x,t) = xΦ(z) − e−r(T−t)
KΦ

z − σ
√
T − t

, (11)
with
z =
log(x/K) + (r + σ2
/2)(T − t)
σ
√
T − t
, (12)
where Φ is the cumulative standard normal distribution function.
5F Black-Scholes Formula: First Try
We will eventually see many different ways to arrive at the Black-Scholes
formula (11). Although not the shortest argument, the following is perhaps
the most obvious and constructive. We start by assuming that Yt = C(St,t),
t < T, without knowledge of the function C aside from the assumption that it
is twice continuously differentiable on (0,∞)×[0,T) (allowing an application
of Ito’s Formula). This will lead us to deduce (11), justifying the assumption
and proving the result at the same time.
Based on our assumption that Yt = C(St,t) and Ito’s Formula,
dYt = µY (t)dt + Cx(St,t)σSt dBt, t < T, (13)
where
µY (t) = Cx(St,t)µSt + Ct(St,t) +
1
2
Cxx(St,t)σ2
S2
t .
Now suppose there is a self-financing trading strategy (a,b) with
atSt + btβt = Yt, t ∈ [0,T], (14)5F. Black-Scholes Formula: First Try 105
as outlined in Section 5E. This assumption will also be justified shortly.
Equations (10) and (14), along with the linearity of stochastic integration,
imply that
dYt = at dSt + bt dβt = (atµSt + btβtr)dt + atσSt dBt. (15)
One way to choose the trading strategy (a,b) so that both (13) and (15)
are satisfied is to “match coefficients separately in both dBt and dt.” In
fact, the unique decomposition property of Ito processes explained at the
end of Section 5C implies that this is the only way to ensure that (13) and
(15) are consistent. Specifically, we choose at so that atσSt = Cx(St,t)σSt;
for this, we let at = Cx(St,t). From (14) and Yt = C(St,t), we then have
Cx(St,t)St + btβt = C(St,t), or
bt =
1
βt
[C(St,t) − Cx(St,t)St]. (16)
Finally, “matching coefficients in dt” from (13) and (15) leaves, for t < T,
−rC(St,t) + Ct(St,t) + rStCx(St,t) +
1
2
σ2
S2
t Cxx(St,t) = 0. (17)
In order for (17) to hold, it is enough that C satisfies the partial differ-
ential equation (PDE)
−rC(x,t) + Ct(x,t) + rxCx(x,t) +
1
2
σ2
x2
Cxx(x,t) = 0, (18)
for (x,t) ∈ (0,∞)×[0,T). The fact that YT = C(ST,T) = (ST −K)+
supplies
the boundary condition:
C(x,T) = (x − K)+
, x ∈ (0,∞). (19)
By direct calculation of derivatives, one can show as an exercise that (11) is
a solution to (18)–(19). All of this seems to confirm that C(S0,0), with C
defined by the Black-Scholes formula (11), is a good candidate for the initial
price of the option. In order to make this solid, suppose that Y0 > C(S0,0),
where C is defined by (11). Consider the strategy (−1,a,b) in the option,
stock, and bond, with at = Cx(St,t) and bt given by (16) for t < T. We can
choose aT and bT arbitrarily so that (14) is satisfied; this does not affect the
self-financing condition (10) because the value of the trading strategy at a106 Chapter 5. The Black-Scholes Model
single point in time has no effect on the stochastic integral. (For this, see the
implications of equality “almost everywhere” at the end of Section 5C.) The
result is that (a,b) is self-financing by construction and that aT ST +bT βT =
YT = (ST − K)+
. This strategy therefore nets an initial riskless profit of
Y0 − a0S0 − b0β0 = Y0 − C(S0,0) > 0,
which defines an arbitrage. Likewise, if Y0 < C(S0,0), the trading strategy
(+1,−a,−b) is an arbitrage. Thus, it is indeed a necessary condition for the
absence of arbitrage that Y0 = C(S0,0). Sufficiency is a more delicate matter.
We will see in Chapter 6 that under mild technical conditions on trading
strategies, the Black-Scholes formula for the option price is also sufficient
for the absence of arbitrage. One last piece of business is to show that the
“option-hedging” strategy (a,b) is such that a is in H2
(S) and b is in H2
(β).
This is true, and is left to show as an exercise.
Transactions costs play havoc with the sort of reasoning just applied. For
example, if brokerage fees are any positive fixed fraction of the market value
of stock trades, the stock-trading strategy a constructed above would call for
infinite total brokerage fees, since, in effect, the number of shares traded is
infinite! This fact and the literature on transactions costs in this setting is
reviewed in the Notes of Chapters 6 and 9.
5G The PDE for Arbitrage-Free Derivative
Security Prices
The expression dSt = µSt dt+σSt dBt for the log-normal stock-price process
S of Section 5E is a special case of a stochastic differential equation (SDE)
of the form
dSt = µ(St,t)dt + σ(St,t)dBt; S0 = x, (20)
where µ : R×[0,∞) → R and σ : R×[0,∞) → R are given functions. Under
regularity conditions on µ and σ reviewed in Appendix E, there is a unique
Ito process S solving (20) for each starting point x in R. Assuming that
such a solution S defines a stock-price process, consider the price process β
defined by
βt = β0 exp
Z t
0
r(Su,u)du

, (21)5H. The Feynman-Kac Solution 107
where r : R × [0,∞) → R is well enough behaved for the existence of the
integral in (21). We may view βt as the market value at time t of an invest-
ment account that is continuously re-invested at the short rate r(St,t). This
is consistent with a trivial application of Ito’s Formula, which implies that
dβt = βtr(St,t)dt; β0 > 0. (22)
Rather than restricting attention to the option payoff YT = (ST − K)+
,
consider a derivative security defined by the payoff YT = g(ST) at time T,
for some continuous g : R → R. Arguments like those in Section 5F lead one
to formulate the arbitrage-free price process Y of the derivative security as
Yt = C(St,t), t ∈ [0,T], where C solves the PDE
−r(x,t)C(x,t) + Ct(x,t) + r(x,t)xCx(x,t) +
1
2
σ(x,t)2
Cxx(x,t) = 0, (23)
for (x,t) ∈ R × [0,T), with the boundary condition
C(x,T) = g(x), x ∈ R. (24)
In order to tie things together, suppose that C solves (23)–(24). If Y0 6=
C(S0,0), then an obvious extension of our earlier arguments implies that
there is an arbitrage. (This extension is left as an exercise.) This is true
even if C is not twice continuously differentiable, but merely C2,1
(R×[0,T)),
meaning that the derivatives Cx, Ct, and Cxx exist and are continuous in
R×(0,T), and extend continuously to R×[0,T). (Ito’s Formula also applies
to any function in this class.)
This PDE characterization of the arbitrage-free price of derivative secu-
rities is useful if there are convenient methods for solving PDEs of the form
(23)–(24). Numerical solution techniques are discussed in Chapter 11. One
of these techniques is based on a probabilistic representation of solutions
given in the next section.
5H The Feynman-Kac Solution
A potential simplification of the PDE problem (23)–(24) is obtained as fol-
lows. For each (x,t) in R × [0,T], let Zx,t
be the Ito process defined by
Zx,t
s = x, s ≤ t, and
dZx,t
s = r(Zx,t
s ,s)Zx,t
s ds + σ(Zx,t
s ,s)dBs, s > t. (25)
That is, Zx,t
starts at x at time t and continues from there by following the
SDE (25).108 Chapter 5. The Black-Scholes Model
Condition FK. The functions σ, r, and g satisfy one of the technical suf-
ficient conditions given in Appendix E for Feynman-Kac solutions.
The FK (for “Feynman-Kac”) condition is indeed only technical, and limits
how quickly the functions σ, r, and g can grow or change. Referring to
Appendix E, we have the following solution to the PDE (23)–(24) as an
expectation of the discounted payoff of the derivative security, modified by
replacing the original price process S with a pseudo-price process Zx,t
whose
expected rate of return is the riskless interest rate. This is sometimes known
as risk-neutral valuation. This is not to say that agents are risk-neutral, but
rather that risk-neutrality is (in this setting) without loss of generality for
purposes of pricing derivative securities.
The Feynman-Kac Solution. Under Condition FK, if there is no arbi-
trage, then the derivative security defined by the payoff g(ST) at time T has
the price process Y with Yt = C(St,t), where C is the solution to (23)–(24)
given by
C(x,t) = E

exp

−
Z T
t
r(Zx,t
s ,s)ds

g Zx,t
T


, (x,t) ∈ R×[0,T]. (26)
It can be checked as an exercise that (26) recovers the Black-Scholes option-
pricing formula (11). Calculating this expectation directly is a simpler way
to solve the corresponding PDE (18)–(19) than is the method originally
used to discover the Black-Scholes formula. Chapter 11 presents numerical
methods for solving (23)–(24), one of which involves Monte Carlo simula-
tion of the Feynman-Kac solution (26), which bears a close resemblance to
the discrete-time equivalent-martingale-measure arbitrage-free price repre-
sentation of Chapter 2. This is more than a coincidence, as we shall see in
Chapter 6.
5I The Multidimensional Case
Suppose that B1
,...,Bd
are d independent standard Brownian motions on
a probability space (Ω,F,P). The process B = (B1
,...,Bd
) is known as a
standard Brownian motion in Rd
. The standard filtration F = {Ft : t ≥ 0}
of B is defined just as in the one-dimensional case. Given F, the subsets L1
,
L2
, H1
, and H2
of adapted processes are also as defined in Sections 5A and
5B.5I. The Multidimensional Case 109
In this setting, X is an Ito process if, for some x in R, some µ in L1
, and
some θ1
,...,θd
in L2
,
Xt = x +
Z t
0
µs ds +
d X
i=1
Z t
0
θi
s dBi
s, t ≥ 0. (27)
For convenience, (27) is also written
Xt = x +
Z t
0
µs ds +
Z t
0
θs dBs, t ≥ 0, (28)
or in the convenient stochastic differential form
dXt = µt dt + θt dBt; X0 = x. (29)
If X1
,...,XN
are Ito processes, then we call X = (X1
,...,XN
) an Ito
process in RN
, which can be written
Xt = x +
Z t
0
µs ds +
Z t
0
θs dBs, t ≥ 0, (30)
or
dXt = µt dt + θt dBt; X0 = x ∈ RN
, (31)
where µ and θ are valued in RN
and RN×d
, respectively. (Here, RN×d
denotes
the space of real matrices with N rows and d columns.) Ito’s Formula extends
as follows.
Ito’s Formula. Suppose X is the Ito process in RN
given by (30) and f is
in C2,1
(RN
× [0,∞)). Then {f(Xt,t) : t ≥ 0} is an Ito process and, for any
time t,
f(Xt,t) = f(X0,0) +
Z t
0
DXf(Xs,s)ds +
Z t
0
fx(Xs,s)θs dBs,
where
DXf(Xt,t) = fx(Xt,t)µt + ft(Xt,t) +
1
2
tr

θtθ⊤
t fxx(Xt,t)

.
Here, fx, ft, and fxx denote the obvious partial derivatives of f valued in RN
,
R, and RN×N
respectively, and tr(A) denotes the trace of a square matrix A
(the sum of its diagonal elements).110 Chapter 5. The Black-Scholes Model
If X and Y are real-valued Ito processes with dXt = µX(t)dt+σX(t)dBt
and dYt = µY (t)dt + σY (t)dBt, then Ito’s Formula (for N = 2) implies that
the product Z = XY is an Ito process, with drift µZ given by
µZ(t) = Xt µY (t) + YtµX(t) + σX(t) · σY (t). (32)
If µX, µY , σX, and σY are all in H2
and have continuous sample paths, then
an application of Fubini’s Theorem (Appendix C) implies that
d
ds
covt (Xs,Ys)
s=t
= σX(t) · σY (t) almost surely, (33)
where covt(Xs,Ys) = Et(XsYs) − Et(Xs)Et(Ys) and where the derivative is
taken from the right, extending the intuition developed with (3) and (4).
If X is an Ito process in RN
with dXt = µt dt+σt dBt and θ = (θ1
,...,θN
)
is a vector of adapted processes such that θ · µ is in L1
and, for each i, θ · σi
is in L2
, then we say that θ is in L(X), which implies that
Z T
0
θt dXt ≡
Z T
0
θt · µt dt +
Z T
0
θ⊤
t σt dBt, T ≥ 0
is well defined as an Ito process. If E[(
R T
0
θt · µt dt)2
] < ∞ and, for each i,
θ·σi
is also in H2
, then we say that θ is in H2
(X), which implies that
R
θdX
is a finite-variance process.
Suppose that S = (S1
,...,SN
) is an Ito process in RN
specifying the
prices of N given securities, and that S satisfies the stochastic differential
equation:
dSt = µ(St,t)dt + σ(St,t)dBt; S0 = x ∈ RN
, (34)
where µ : RN
× [0,∞) → RN
and σ : RN
× [0,∞) → RN×d
satisfy enough
regularity (conditions are given in Appendix E) for existence and uniqueness
of a solution to (34). Let
βt = β0 exp
Z t
0
r(Su,u)du

, β0 > 0, (35)
define the price process of a bond, where r : RN
× [0,∞) → R defines a
continuously compounding short rate, sufficiently well behaved that (35) is
a well-defined Ito process. We can also use Ito’s Formula to write
dβt = βtr(St,t)dt; β0 > 0. (36)5I. The Multidimensional Case 111
Finally, let some continuous g : RN
→ R define the payoff g(ST ) at time T
of a derivative security whose price at time zero is to be determined.
Once again, the arguments of Section 5F can be extended to show that
under technical regularity conditions and in the absence of arbitrage, the
price process Y of the derivative security is given by Yt = C(St,t), where C
solves the PDE:
DZC(x,t) − r(x,t)C(x,t) = 0, (x,t) ∈ RN
× [0,T), (37)
with boundary condition
C(x,T) = g(x), x ∈ RN
, (38)
where
DZC(x,t) = Cx(x,t)r(x,t)x+Ct(x,t)+
1
2
tr

σ(x,t)σ(x,t)⊤
Cxx(x,t)

. (39)
We exploit once again the technical condition FK on (r,σ,g) reviewed in
Appendix E for existence of a probabilistic representation of solutions to the
PDE (37)–(38).
The Feynman-Kac Solution. Under Condition FK, if there is no arbi-
trage, then the derivative security with payoff g(ST ) at time T has the price
process Y given by Yt = C(St,t), where C is the solution to the PDE (37)–
(38) given by
C(x,t) = E
h
exp

−
RT
t
r(Zx,t
s ,s)ds

g Zx,t
T
i
,
(x,t) ∈ RN
× [0,T],
(40)
where Zx,t
is the Ito process defined by Zx,t
s = x, s ≤ t, and
dZx,t
s = r(Zx,t
s ,s)Zx,t
s ds + σ(Zx,t
s ,s)dBs, s ≥ t. (41)
The exercises provide applications and additional extensions of this ap-
proach to the arbitrage-free valuation of derivative securities, allowing for
intermediate dividends and for an underlying Markov-state process. Chap-
ter 6 further extends arbitrage-free pricing to a non-Markovian setting using
more general methods. Chapters 7 and 8 give further applications, including
futures, forwards, American options, and the term structure of interest rates.
Exercises112 Chapter 5. The Black-Scholes Model
Exercise 5.1 Fixing a probability space (Ω,F,P) and a filtration {Ft :
t ≥ 0}, a process X is Markov if, for any time t and any integrable random
variable Y that is measurable with respect to the tribe generated by {Xs :
s ≥ t}, we have E(Y |Ft) = E(Y |Xt) almost surely. In particular, for
any measurable f : R → R such that f(X t) has finite expectation, we have
E[f(Xt) | Fs] = E[f(Xt) | Xs] for s ≤ t. It is a fact, which we shall not
prove, that standard Brownian motion B is a Markov process with respect
to its standard filtration. Use this fact to show that B is a martingale with
respect to its standard filtration. Suppose that θ is a bounded adapted
process. Show, as stated in Section 5B, that the discrete-time process X
defined by X0 = 0 and Xt =
Pt−1
s=0 θs ∆1
Bs, t ≥ 1, is a martingale with
respect to {F0,F1,...}.
Exercise 5.2 Suppose that S is defined by (7). Use Ito’s Formula to show
that, as claimed, dSt = µSt dt + σSt dBt, where µ = α + σ2
/2.
Exercise 5.3 Verify that the ordinary differential equation (9), with initial
condition β0, is solved by (8).
Exercise 5.4 Verify by direct calculation of the derivatives that the PDE
(18)–(19) is solved by the Black-Scholes formula (11).
Exercise 5.5 Derive the PDE (23) for the arbitrage-free value of the
derivative security. Hint: Use arguments analogous to those used to derive
the PDE (18) for the Black-Scholes formula.
Exercise 5.6 Suppose the PDE (37) for the arbitrage-free value of the
derivative security is not satisfied, in that the initial price Y0 of the security
is not equal to C(S0,0), where C solves (37)–(38). Construct an arbitrage
that nets an initial risk-free profit of m units of account, where m is an
arbitrary number chosen by you.
Exercise 5.7 Suppose that the stock, whose price process S is given
by (20), pays dividends at a rate δ(St,t) at time t, where a continuous
function δ : R × [0,∞) → R defines a cumulative dividend process D by
Dt =
R t
0
δ(Su,u)du. The total gain process G for the security is defined by
Gt = St + Dt, and a trading strategy θ in L(G) generates the gain process R
θdG, the sum of capital and dividend gains. Derive a new PDE general-
izing (23) for the arbitrage-free value of the derivative security defined by5I. The Multidimensional Case 113
g. Provide regularity conditions for the associated Feynman-Kac solution,
extending (25)–(26).
Exercise 5.8 Suppose that S is a stock-price process defined by (20), β
is a bond-price process defined by (21), and a derivative security is defined
by the lump-sum payoff g(ST) at time T, as in Section 5G, and also by
the cumulative dividend process H defined by Ht =
Rt
0
h(Sτ,τ)dτ, for some
continuous h : R × [0,T] → R. By definition, a trading strategy (a,b) in
H2
(S,β) finances this derivative security if
atSt + btβt = a0S0 + b0β0 +
Z t
0
au dSu +
Z t
0
bu dβu − Ht, t ≤ T, (42)
and
aT ST + bT βT = g(ST). (43)
Relation (42) means that the current value of the portfolio is, at any time,
the initial value, plus trading gains to date, less the payout to date of the
derivative dividends. If (a,b) finances the derivative security in this sense
and the derivative security’s initial price Y0 is not equal to a0S0 +b0β0, then
there is an arbitrage. For example, if Y0 > a0S0 + b0β0, then the strategy
(−1,a,b) in derivative security, stock, and bond generates the cumulative
dividend process −H +H = 0 and the final payoff −g(ST)+g(ST) = 0, with
the initial riskless profit Y0 − a0S0 − b0β0 > 0. Derive an extension of the
PDE (23)–(24) for the derivative security price, as well as an extension of
the Feynman-Kac solution (25)–(26).
Exercise 5.9 Suppose that X is the Ito process in RK
solving the SDE
dXt = µ(Xt,t)dt + σ(Xt,t)dBt; X0 = x.
We could refer to X, by analogy with Chapter 3, as the “shock process.”
Suppose the price process S for the N “stocks” is defined by St = S(Xt,t),
where S is in C2,1
(RK
×[0,∞)), and that the bond-price process β is the Ito
process defined by dβt = βtr(Xt,t)dt, β0 > 0, where r : RK
× [0,∞) → R is
bounded and continuous.
(A) State regularity conditions that you find appropriate in order to derive a
PDE analogous to (37)–(38) for the price of an additional security defined by
the payoff g(XT) at time T, where g : RK
→ R. Then provide the Feynman-
Kac solution, analogous to (40)–(41), including a sufficient set of technical114 Chapter 5. The Black-Scholes Model
conditions based on Appendix E. (B) Extend part (A) to the case in which
the stocks pay a cumulative dividend process D that is an Ito process in RN
well defined by Dt =
R t
0
δ(Xs,s)ds, where δ : RK
×[0,∞) → RN
, and in which
the additional security has the lump-sum payoff of g(XT) at time T, as well
as a cumulative dividend Ito process H well defined by Ht =
R t
0
h(Xs,s)ds,
where h : RK
× [0,T] → R.
Exercise 5.10 Suppose the short-rate process r is given by a bounded
continuous function r : [0,T ] → R. Consider a security with price process S
defined by
dSt = µ(St)dt + σ(St)dBt,
where µ and σ satisfy a Lipschitz condition. Suppose this security has the
cumulative dividend process D defined by Dt =
Rt
0
δuSu du, where δ : [0,T] →
R is a continuous function. (Such a function δ is often called the “dividend
yield.”)
(A) (Put-Call Parity) Suppose there are markets for European call and
put options on the above security with exercise price K and exercise date T.
Let C0 and P0 denote the call and put prices at time zero. Give an explicit
expression for P0 in terms of C0, in the absence of arbitrage and transactions
costs.
(B) Suppose, for all t, that rt = 0.10 and that δt = 0.08. Consider a
European option expiring in T = 0.25 years. Suppose that K = 50 and
S0 = 45. If the call sells for 3.75, what is the put price? (Give a specific
dollar price, to the nearest penny, showing how you calculated it.)
(C) Suppose, instead, that the dividend process D is defined by Dt = Rt
0
δτ log(Sτ)Sτ dτ. Suppose σ(x) = ǫx, for some constant ǫ > 0. Solve
part (A) again. Then calculate the price of a European call with exercise
price K = 35 given initial stock price S0 = 40, assuming, for all t, that
δt = 0.08, rt = 0.10, and ǫ = 0.20. Assume expiration in 0.25 years. Justify
your answer.
Exercise 5.11 Suppose the price of haggis (an unusually nasty food served
in Scotland) follows the process H defined by
dHt = HtµH dt + HtσH dBt; H0 > 0,
in British pounds per pint, where µH is a constant, σH is a constant vector
in R2
, and B is a standard Brownian motion in R2
. A trader at a Wall5I. The Multidimensional Case 115
Street investment bank, Gold in Sacks, Incorporated, has decided that since
there are options on almost everything else, there may as well be options on
haggis. Of course, there is the matter of selling the options in the United
States, denominated in U.S. dollars. It has been noted that the price of the
U.S. dollar, in British pounds per dollar, follows the process
dDt = DtµD dt + DtσD dBt; D0 > 0,
where µD is a constant and σD is a constant vector in R2
. The continuously
compounding short rate in U.S. funds is rD, a constant. Although there are
liquid markets in Edinburgh for haggis and for U.S. dollars, there is not a
liquid market for haggis options. Gold in Sacks has therefore decided to sell
call options on haggis at a U.S. dollar strike price of 6.50 per pint expiring
in 3 months, and cover its option position with a replicating strategy in the
other instruments, so as to earn a riskless profit equal to the markup in the
sale price of the options over the initial investment cost to Gold in Sacks for
the replicating strategy.
(A) What replicating strategy would you recommend?
(B) If the options are sold at a 10 percent profit markup, give an explicit
formula for the option price Gold in Sacks should charge its customers.
(C) Suppose borrowing in U.S. funds is too clumsy, since the other two
parts of the strategy (dollar and haggis trading) are done at Gold in Sacks’s
Edinburgh office. If the British pound borrowing rate is rP , a constant,
can you still answer parts (A) and (B), using British pound borrowing (and
lending) rather than U.S. dollar borrowing (and lending)? If so, do so. If
not, say why not. If you find it useful, you may use any arbitrage conditions
relating the various coefficients (µH,µD,σH,σD,rD,rP), if indeed there are
any such coefficients precluding arbitrage.
Exercise 5.12 Show, in the setting of Section 5E, that (26) recovers the
Black-Scholes formula (11).
Exercise 5.13 Show that the Black-Scholes option-hedging strategy (a,b)
of Section 5F is such that a ∈ H2
(S) and b ∈ H2
(β), as assumed.
Notes
The material in this chapter is standard. Proposition 5B is from Protter
[1990]. The Brownian model was introduced to the study of option pricing116 Chapter 5. The Black-Scholes Model
by Bachelier [1900]. The Black and Scholes [1973] formula was extended by
Merton [1973] and Merton [1977] and subsequently given literally hundreds of
further extensions and applications. Andreasen, Jensen, and Poulsen [1996]
provide numerous alternative methods of deriving thge Black-Scholes For-
mula. Cox and Rubinstein [1985] is a standard reference on options, while
Hull [1993] has further applications and references. The basic approach of us-
ing continuous-time self-financing strategies as the basis for making arbitrage
arguments is due to Merton [1977] and Harrison and Kreps [1979]. The basic
idea of risk-neutral valuation, via adjustment of the underlying stock-price
process, is due to Cox and Ross [1976]. This is extended to the notion of
equivalent martingale measures, found in Chapter 6, by Harrison and Kreps
[1979]. The impact of variations in the “volatility” on the Black-Scholes
option-pricing formula is shown, in two different senses, by El Karoui, Jean-
blanc, and Shreve [1991], Grundy and Wiener [1995], Johnson and Shanno
[1987] and Reisman [1986]. For “stochastic volatility” models, see Section 8E
and references cited in the Notes to Chapter 8.
Alternative approaches to the standard methods of stochastic calculus
have been developed by Cutland, Kopp, and Willinger[1991], Cutland, Kopp,
and Willinger [1993] and Cutland, Kopp, and Willinger [993b], who apply
nonstandard analysis; by Bick and Willinger [1994] and Willinger and Tacqu
[1989], who use a path-wise integral established by Föllmer [1981]; and by
Kunitomo [1993], Cutland, Kopp, and Willinger [1991], and Cutland, Kopp,
and Willinger [993b], who exploit fractional Brownian motion. See Rogers
[1998] for a discussion of the use of fractional Brownian motion in this setting,
and Lacoste [1995] proposes a Wiener-Chaos
Part (C) of Exercise 5.10 was related to the author by Bruce Grundy.
The line of exposition in this chapter is based on Gabay [1982] and Duffie
[1988a]. For the case of transactions costs and other market “imperfections,”
see the Notes of Chapter 6.Chapter 6
State Prices and Equivalent
Martingale Measures
THIS CHAPTER SUMMARIZES arbitrage-free security pricing theory in
the continuous-time setting introduced in Chapter 5. The main idea is the
equivalence between no arbitrage, the existence of state prices, and the exis-
tence of an equivalent martingale measure, paralleling the discrete-state the-
ory of Chapter 2. This extends the Markovian results of Chapter 5, which
are based on PDE methods. For those interested mainly in applications, the
first sections of Chapters 7 and 8 summarize the major conclusions of this
chapter as a “black box,” making it possible to skip this chapter on a first
reading.
The existence of a state-price deflator is shown to imply the absence of
arbitrage. Then a state-price “beta” model of expected returns is derived.
Turning to equivalent martingale measures, we begin with the sufficiency of
an equivalent martingale measure for the absence of arbitrage. Girsanov’s
Theorem (Appendix D) gives conditions under which there exists an equiv-
alent martingale measure. This approach generates yet another proof of the
Black-Scholes formula. State prices are then connected with equivalent mar-
tingale measures; the two concepts are more or less the same. They are
literally equivalent in the analogous finite-state model of Chapter 2, and we
will see that the distinction here is purely technical.118 Chapter 6. Equivalent Martingale Measures
6A Arbitrage
We fix a standard Brownian motion B = (B1
,...,Bd
) in Rd
, restricted to
some time interval [0,T], on a given probability space (Ω,F,P). We also fix
the standard filtration F = {Ft : t ∈ [0,T]} of B, as defined in Section 5I.
For simplicity, we take F to be FT. Suppose the price processes of N given
securities form an Ito process X = (X(1)
,...,X(N)
) in RN
. We suppose that
each security price process is in the space H2
containing any Ito process Y
with dYt = a(t)dt + b(t)dB(t) for which
E
"Z t
0
a(s)ds
2
#
< ∞ and E
Z t
0
b(s) · b(s)ds

< ∞.
Until later in the chapter, we willsuppose that the securities pay no dividends
during the time interval [0,T), and that XT is the vector of cum-dividend
security prices at time T.
A trading strategy θ, as we recall from Chapter 5, is an RN
-valued process
θ in L(X), as defined in Section 5I. This means simply that the stochastic
integral
R
θdX defining trading gains is well defined. A trading strategy θ
is self-financing if
θt · Xt = θ0 · X0 +
Z t
0
θs dXs, t ≤ T. (1)
If there is some process r with the property that
RT
0
|rt|dt is finite almost
surely and, for some security with strictly positive price process β we have
βt = β0 exp
Z t
0
rs ds

, t ∈ [0,T], (2)
then we call r the short-rate process. In this case, dβt = rtβt dt, allowing
us to view rt as the riskless short-term continuously compounding rate of
interest, in an instantaneous sense, and to view βt as the market value of an
account that is continually reinvested at the short-term interest rate r.
A self-financing strategy θ is an arbitrage if θ0 ·X0 < 0 and θT ·XT ≥ 0, or
θ0 ·X0 ≤ 0 and θT ·XT > 0. Our main goal in this chapter is to characterize
the properties of a price process X that admits no arbitrage, at least after
placing some reasonable restrictions on trading strategies.6B. Numeraire Invariance 119
6B Numeraire Invariance
It is often convenient to renormalize all security prices, sometimes relative to
a particular price process. This section shows that such a renormalization has
essentially no economic effects. A deflator is a strictly positive Ito process.
We can deflate the previously given security price process X by a deflator Y
to get the new price process XY
defined by XY
t = XtYt.
Numeraire Invariance Theorem. Suppose Y is a deflator. Then a trad-
ing strategy θ is self-financing with respect to X if and only if θ is self-
financing with respect to XY
.
Proof: Let Wt = θ0 · X0 +
Rt
0
θs dXs, t ∈ [0,T]. Let WY
be the process
defined by WY
t = WtYt. Because W and Y are Ito processes, Ito’s Formula
implies, letting σX, σW , and σY denote the respective diffusions of X, W,
and Y , that
dWY
t = Yt dWt + Wt dYt + σW (t) · σY (t)dt
= Ytθt dXt + (θt · Xt)dYt + [θ⊤
t σX(t)]σY (t)dt
= θt · [Yt dXt + Xt dYt + σX(t)σY (t)dt]
= θt dXY
t .
Thus, θt ·XY
t = θ0 ·XY
0 +
Rt
0
θs dXY
s if and only if θt ·Xt = θ0 ·X0 +
Rt
0
θs dXs,
completing the proof.
We have the following corollary, which is immediate from the Numeraire
Invariance Theorem, the strict positivity of Y , and the definition of an arbi-
trage.
Corollary. Suppose Y is a deflator. A trading strategy is an arbitrage with
respect to X if and only if it is an arbitrage with respect to the deflated price
process XY
.
6C State Prices and Doubling Strategies
Paralleling the terminology of Section 2C, a state-price deflator is a deflator
π with the property that the deflated price process Xπ
is a martingale. Other
terms used for this concept in the literature are state-price density, marginal
rates of substitution, and pricing kernel. In the discrete-state discrete-time120 Chapter 6. Equivalent Martingale Measures
setting of Chapter 2, we found that there is a state-price deflator if and only
if there is no arbitrage. In this chapter, we will see a sense in which this
result is “almost” true, up to some technical issues. First, however, we need
to establish some mild restrictions on trading strategies, as the following
example shows.
Suppose we take B to be a single Brownian motion (d = 1) and take the
price process X = (S,β), where βt = 1 for all t and dSt = St dBt, with S0 = 1.
Even though X is a martingale before deflation and S is a log-normal process
as typically used in the Black-Scholes option pricing model, we are able to
construct an arbitrage that produces any desired constant payoff α > 0 at T
with no initial investment. For this, consider the stopping time
τ = inf

t :
Z t
0
(T − s)−1/2
dBs = α

.
A source cited in the Notes shows that 0 < τ < T almost surely. This is not
surprising given the rate at which (T − t)−1/2
“explodes” as t approaches T.
Now consider the trading strategy θ defined by θt = (at,bt), where
at =
1
St
√
T − t
, t ≤ τ (3)
= 0, t > τ,
and
bt = −atSt +
Z t
0
au dSu. (4)
In effect, θ places a larger and larger “bet” on the risky asset as T approaches.
It is immediate from (4) that θ = (a,b) is self-financing. It is also clear
that θ0 · X0 = 0 and that θT · XT = α almost surely. Thus θ is indeed an
arbitrage, despite the natural assumptions on security prices. Some technical
restrictions on trading strategies must be added if we are to expect some solid
relationship between the existence of a state-price deflator and the absence
of arbitrage.
For intuition, one may think of an analogy between the above example
and a series of bets on fair and independent coin tosses at times 1/2, 3/4,
7/8, and so on. Suppose one’s goal is to earn a riskless profit of α by time
1, where α is some arbitrarily large number. One can bet α on heads for
the first coin toss at time 1/2. If the first toss comes up heads, one stops.
Otherwise, one owes α to one’s opponent. A bet of 2α on heads for the6C. State Prices and Doubling Strategies 121
second toss at time 3/4 produces the desired profit if heads comes up at that
time. In that case, one stops. Otherwise, one is down 3α and bets 4α on
the third toss, and so on. Because there is an infinite number of potential
tosses, one will eventually stop with a riskless profit of α (almost surely),
because the probability of losing on every one of an infinite number of tosses
is (1/2)·(1/2)·(1/2)··· = 0. This is a classic “doubling strategy” that can be
ruled out either by a technical limitation, such as limiting the total number
of coin tosses, or by a credit restriction limiting the total amount that one is
allowed to owe one’s opponent.
For the case of continuous-time trading strategies, we will eliminate the
possibility of “doubling strategies” by either of two approaches. One ap-
proach requires some extra integrability condition on θ, the other requires a
credit constraint, limiting the extent to which the market value θt ·Xt of the
portfolio may become negative. Given a state-price deflator π, a sufficient in-
tegrability condition is that θ ∈ H2
(Xπ
), as defined in Section 5I. The credit
constraint is that θt · Xπ
t , the deflated market value of the trading strategy,
is bounded below, in that there is some constant k with θt · Xπ
t ≥ k for all
t almost surely. We let Θ(Xπ
) denote the space of such credit-constrained
trading strategies. In the above example (3)–(4) of an arbitrage, π ≡ 1 de-
fines a state-price deflator because X is itself a martingale, and the trading
strategy θ defined by (3)–(4) is neither in H2
(X) nor in Θ(X).
Proposition. For any state-price deflator π, there is no arbitrage in H2
(Xπ
)
or in Θ(Xπ
).
Proof: Suppose π is a state-price deflator. Let θ be any self-financing trading
strategy.
Suppose, to begin, that θ is in H2
(Xπ
). Because Xπ
is a martingale,
Proposition 5B implies that E
RT
0
θt dXπ
t

= 0. By numeraire invariance, θ
is self-financing with respect to Xπ
, and we have
θ0 · Xπ
0 = E

θT · Xπ
T −
Z T
0
θt dXπ
t

= E (θT · Xπ
T ).
If θT · Xπ
T ≥ 0, then θ0 · Xπ
0 ≥ 0. Likewise, if θT · Xπ
T > 0, then θ0 · Xπ
0 > 0.
It follows that θ cannot be an arbitrage for Xπ
. The Corollary to Theorem
6B implies that θ is not an arbitrage for X.
Now suppose that θ is in Θ(Xπ
). Because Xπ
is a martingale,
R
θdXπ
is
a local martingale (as defined in Appendix D). By the Numeraire Invariance122 Chapter 6. Equivalent Martingale Measures
Theorem, because θ is self-financing with respect to X, θ is also self-financing
with respect to Xπ
. Fromthis and the self-financing condition (1), we see that
the deflated wealth process W, defined by Wt = θt ·Xπ
t , is a local martingale.
Because θ ∈ Θ(Xπ
), we know that W is also bounded below. Because a local
martingale that is bounded below is a supermartingale (Appendix D), we
know that E(WT ) ≤ W0. From this, if θT ·XT > 0, then WT > 0, so W0 > 0
and thus θ0 · X0 > 0. Likewise, if θT · XT ≥ 0, then WT ≥ 0, so W0 ≥ 0 and
thus θ0 · X0 ≥ 0. This implies that θ is not an arbitrage.
6D Expected Rates of Return
Suppose that π is a state-price deflator for X, and consider an arbitrary
security with price process S. Because a state-price deflator is an Ito process,
we can write
dπt = µπ(t)dt + σπ(t)dBt
for appropriate µπ and σπ. Because S is an Ito process, we can also write
dSt = µS(t)dt + σS(t)dBt for some µS and σS. As Sπ
is a martingale, its
drift is zero. It follows from Ito’s Formula that almost everywhere,
0 = µπ(t)St + µS(t)πt + σS(t) · σπ(t).
We suppose that S is a strictly positive process, and can therefore rearrange
to get
µS(t)
St
=
−µπ(t)
πt
−
σS(t) · σπ(t)
πtSt
. (5)
The cumulative-return process of this security is the Ito process R defined
by R0 = 0 and
dRt = µR(t)dt + σR(t)dBt ≡
µS(t)
St
dt +
σS(t)
St
dBt.
We can now write dSt = St dRt. Looking back at equations (5.3) and (5.4),
µR may be viewed as the conditional expected rate of return, and σR(t)·σR(t)
as the rate of change in the conditional variance of the return. We re-express
(5) as
µR(t) − b rt = −
1
πt
σR(t) · σπ(t), (6)6D. Expected Rates of Return 123
where b rt = −µπ(t)/πt. In the sense of equation (5.33), σR(t) · σπ(t) is a
notion of “instantaneous covariance” of the increments of R and π. Thus (6)
is reminiscent of the results of Section 1F. If σR(t) = 0, then µR(t) = b rt, so
the short-term riskless rate process, if there is one, must be b r. In summary,
(6) impliesa sense in which excess expected rates of return are proportionalto
the “instantaneous” conditional covariance between returns and state prices.
The constant of proportionality, −1/πt, does not depend on the security.
This interpretation is a bit loose, but (6) itself is unambiguous.
We have been unnecessarily restrictive in deriving (6) only for a particular
security. The same formula applies in principle to the return on an arbitrary
self-financing trading strategy θ. In order to define this return, let Wθ
denote
the associated market-value process, defined by Wθ
t = θt ·Xt. If Wθ
is strictly
positive, then the cumulative-return process Rθ
for θ is defined by
Rθ
t =
Z t
0
1
Wθ
s
dWθ
s , t ∈ [0,T ].
It can be verified as an exercise that the drift µθ and diffusion σθ of Rθ
satisfy
the return restriction extending (6), given by
µθ(t) − b rt = −
1
πt
σθ(t) · σπ(t). (7)
We will now see that (7) leads to a “beta model” for expected returns,
analogous to that of Chapter 2. We can always find adapted processes ϕ and
ǫ valued in RN
and Rd
respectively such that
σπ(t) = σX(t)⊤
ϕt + ǫt and σX(t)ǫt = 0, t ∈ [0,T],
where σX is the RN×d
-valued diffusion of the price process X. For each
(ω,t) in Ω × [0,T], the vector σX(ω,t)⊤
ϕ(ω,t) is the orthogonal projection
in RN
of σπ(ω,t) onto the span of the rows of the matrix σX(ω,t). Suppose
θ = (θ(1)
,...,θ(N)
) is a self-financing trading strategy with σ⊤
Xθ = σ⊤
Xϕ. (For
example, if X
(1)
t = exp(
R t
0
rs ds) for a short-rate process r, we can construct
θ by letting θ
(j)
t = ϕ
(j)
t , j > 1, and by choosing θ(1)
so that the self-financing
condition is met.) The market-value process W θ
of θ is an Ito process because
θ is self-financing. We suppose that θ0 can be chosen so that Wθ
is also
strictly positive, implying that the associated return process R∗
≡ Rθ
is124 Chapter 6. Equivalent Martingale Measures
well defined. Because the diffusion of Wθ
is σ⊤
Xϕ, the diffusion of R∗
is
σ∗
≡ σ⊤
Xϕ/Wθ
. For an arbitrary Ito return process R, (6) implies that
µR(t) − b rt = −
1
πt
σR(t) · σπ(t)
= −
1
πt
σR(t) · [σX(t)⊤
ϕt + ǫt]
= −
Wθ
t
πt
σR(t) · σ∗
t ,
using the fact that σR(ω,t) is (in each state ω) a linear combination of the
rows of σX(ω,t). This in turn implies that σR(t) · ǫt = 0. In particular, for
the return process R∗
, we have
µ∗
t − b rt =
−Wθ
t
πt
σ∗
t · σ∗
t ,
where µ∗
is the drift (expected rate of return) of R∗
. Substituting back into
(6) the resulting expression for Wθ
t /πt leaves the state-price beta model of
returns given by
µR(t) − b rt = βR(t)(µ∗
t − r̂t), (8)
where
βR(t) =
σR(t) · σ∗
t
σ∗
t · σ∗
t
.
In the “instantaneous sense” in which σ∗
t ·σ∗
t stands for the conditional vari-
ance for dR∗
t and σR(t) · σ∗
t stands for the conditional covariance between
dRt and dR∗
t , we can view (8) as the continuous-time analogue to the state-
price beta models of Section 1F and Exercise 2.6(C). Likewise, we can loosely
think of R∗
as a return process whose increments have maximal conditional
correlation with the increments of the state-price deflator π.
6E Equivalent Martingale Measures
A probability measure Q on (Ω,F) is said to be equivalent to P provided,
for any event A, we have Q(A) > 0 if and only if P(A) > 0. An equiva-
lent probability measure Q is an equivalent martingale measure for the price
process X of the N securities if X is a martingale with respect to Q, and if6E. Equivalent Martingale Measures 125
the Radon-Nikodym derivative dQ
dP
(defined in Appendix C) has finite vari-
ance. The finite-variance condition is a technical convenience that is not
uniformly adopted in the literature cited in the Notes on equivalent martin-
gale measures. An equivalent martingale measure is sometimes referred to
as a “risk-neutral” measure.
In the finite-state setting of Chapter 2, it was shown that the existence
of a state-price deflator is equivalent to the existence of an equivalent mar-
tingale measure (after some deflation). Later in this chapter, we will see
technical conditions sustaining that equivalence in this continuous-time set-
ting. Aside from offering a conceptual simplification of some asset-pricing
and investment problems, the use of equivalent martingale measures is justi-
fied by the large body of useful properties of martingales that can be applied
to simplify reasoning and calculations.
First, we establish the sufficiency of an equivalent martingale measure for
the absence of arbitrage. We later show that a technical strengthening of the
no-arbitrage condition of the following Theorem implies the existence of an
equivalent martingale measure. Aside from technical issues, the arguments
are the same as those used to show this equivalence in Chapter 2. As in
Section 6C, we need to apply an integrability condition or a credit constraint
to trading strategies.
Theorem. If the price process X admits an equivalent martingale measure,
then there is no arbitrage in H2
(X) or in Θ(X).
Proof: The proof is quite similar to that of Proposition 6C. Let Q be an
equivalent martingale measure. Let θ be any self-financing trading strategy.
The idea of the proof is based on the case in which θ is bounded, which
we assume for the moment. The fact that X is a martingale under Q implies
that EQ
(
R T
0
θt dXt) = 0. The self-financing condition (1) therefore implies
that
θ0 · X0 = EQ

θT · XT −
Z T
0
θt dXt

= EQ
(θT XT ).
Thus, if θT ·XT ≥ 0, then θ0·X0 ≥ 0. Likewise, if θT ·XT > 0, then θ0·X0 > 0.
An arbitrage is therefore impossible using bounded trading strategies.
For the case of any self-financing trading strategy θ ∈ H2
(X), additional
technical arguments are needed to show that EQ
(
RT
0
θt dXt) = 0. As X is an
Ito process, we can write dXt = µt dt+σt dBt for appropriate µ and σ. By the
Diffusion Invariance Principle (Appendix D), there is a standard Brownian
motion BQ
in Rd
under Q such that dXt = σt dBQ
t . Let Y =
RT
0
kθtσtk2
dt.126 Chapter 6. Equivalent Martingale Measures
Because θ is in H2
(X), Y has finite expectation under P. The product of
two random variables of finite variance is of finite expectation, so dQ
dP
√
Y is
also of finite expectation under P. Thus, EQ
(
√
Y ) < ∞. Proposition 5B
then implies that
R
θt dXt is a Q-martingale, so EQ
(
R T
0
θt dXt) = 0. The
remainder of the proof for this case is covered by the arguments used for
bounded θ.
For the case of θ ∈ Θ(X), the arguments used in the proof of Proposition
6C imply that the wealth process W, defined by Wt = θt · Xt, is a super-
martingale under Q, so that EQ
(θT · XT ) ≤ θ0 · X0, implying that θ cannot
be an arbitrage.
In most cases, the theorem is applied along the lines of the following corol-
lary, a consequence of the corollary to the Numeraire Invariance Theorem of
Section 6B.
Corollary. If there is a deflator Y such that the deflated price process XY
admits an equivalent martingale measure, then there is no arbitrage in H2
(XY
)
or Θ(XY
).
If there is a short rate process r, it is typical in applications to take the
deflator Y defined by Yt = exp

−
Rt
0
rs ds

. If r is bounded, then we have
H2
(XY
) = H2
(X) and Θ(XY
) = Θ(X), so the previous result can be stated
in a more natural form.
6F State Prices and Martingale Measures
We now investigate the relationship between equivalent martingale measures
and state-price deflators. They turn out to be effectively the same concept.
We take as given the setup of Section 6A, including a price process X for N
securities.
For a probability measure Q equivalent to P, the density process ξ for Q
is the martingale defined by
ξt = Et

dQ
dP

, t ∈ [0,T], (9)
where dQ
dP
is the Radon-Nikodym derivative of Q with respect to P. As stated
in Appendix C, for any times t and s > t, and any Fs-measurable random6F. State Prices and Martingale Measures 127
variable W such that EQ
(|W|) < ∞,
EQ
t (W) =
Et(ξsW)
ξt
, t ∈ [0,T]. (10)
Proposition. Suppose there is a short-rate process r and let Y be defined
by Yt = exp

−
R t
0
rs ds

. Suppose, after deflation by Y , that there is an
equivalent martingale measure with density process ξ. Then a state-price
deflator π is defined by πt = ξtYt, provided var(πt) < ∞ for all t. Conversely,
suppose π is a state-price deflator and let ξ be defined by
ξt = exp
Z t
0
rs ds

πt
π0
, t ∈ [0,T]. (11)
Then, provided var(ξT ) is finite, ξ is the density process for an equivalent
martingale measure.
Proof: Suppose, after deflation by Y , that there is an equivalent martingale
measure Q with density process ξ. Let π = ξY . Then, for any times t and
s > t, using (10),
Et(πsXs) = Et(ξsXY
s ) = ξtEQ
t (XY
s ) = ξtXY
t = πtXt. (12)
(These expectations exist because both Xs and πs have finite variances.) This
shows that Xπ
is a martingale, so π is indeed a state-price deflator.
Conversely, suppose π is a state-price deflator, and let ξ be defined by
(9). By applying the definition of a state-price deflator to the price process
β = 1/Y , we see that ξ is a strictly positive martingale with
E(ξT ) = E(βT πT ) = β0 = 1,
so ξ is indeed the density of some equivalent probability measure Q. It is
provided in the statement of the proposition that ξT = dQ
dP
has finite variance.
We need only show that XY
is a Q-martingale, but this follows by applying
(12).
The general equivalence between state-price deflators and equivalent mar-
tingale measures was shown in the simpler setting of Chapter 2 without
technical qualification. An exercise further pursues the equivalence in this
setting.128 Chapter 6. Equivalent Martingale Measures
6G Girsanov and Market Prices of Risk
We now look for convenient conditions on X supporting the existence of an
equivalent martingale measure. We will also see how to calculate such a
measure, and conditions for the uniqueness of such a measure.
Suppose Q is any given probability measure equivalent to P, with density
process ξ. By the martingale representation theorem (Appendix D), we can
express ξ as a stochastic integral of the form
dξt = γt dBt,
for some adapted process γ = (γ(1)
,...,γ(d)
) with
RT
0
γt · γt dt < ∞. Gir-
sanov’s Theorem (Appendix D) states that a standard Brownian motion BQ
in Rd
under Q is defined by BQ
0 = 0 and dBQ
t = dBt−ηt dt, where ηt = −γt/ξt.
Because X is an Ito process, we can write dXt = µt dt+σt dBt, and therefore
dXt = (µt − σtηt)dt + σt dBQ
t .
As X is in H2
, it is necessary and sufficient for X to be a Q-martingale that
its drift is zero, which means that, almost everywhere,
σ(ω,t)η(ω,t) = µ(ω,t), (ω,t) ∈ Ω × [0,T]. (13)
Thus, the existence of a solution η to the system (13) of linear equations
(almost everywhere) is necessary for the existence of an equivalent martingale
measure for X. Under additional technical conditions, we will find that it is
also sufficient.
We can also view a solution η to (13) as providing a proportional rela-
tionship between mean rates of change of prices (µ) and the amounts (σ) of
“risk” in price changes stemming from the underlying d Brownian motions.
For this reason, any such solution η is called a market-price-of-risk process
for X. The idea is that ηi(t) is the “unit price,” measured in price drift, of
bearing exposure to the increment of B(i)
at time t.
A numeraire deflator is a deflator that is the reciprocal of the price process
of one of the securities. It is usually the case that one first chooses some
numeraire deflator Y , and then calculates the market price of risk for the
deflated price process XY
. This is technically convenient because one of the
securities, the “numeraire,” has a price that is always 1 after such a deflation.
If there is a short-rate process r, a typical numeraire deflator is given by Y ,
where Yt = exp

−
R t
0
rs ds

.6G. Girsanov and Market Prices of Risk 129
If there is no market price of risk, one may guess that something is
“wrong,” as the following result confirms.
Lemma. Suppose, for some numeraire deflator Y , that there is no market-
price-of-risk process for XY
. Then there are arbitrages in both Θ(XY
) and
H2
(XY
), and there is no equivalent martingale measure for XY
.
Proof: Suppose XY
has drift process µY
and diffusion σY
, and that there
is no solution η to σY
η = µY
. Then, as a matter of linear algebra, there
exists an adapted process θ taking values that are row vectors in RN
such
that θσY
≡ 0 and θµY
6= 0. By replacing θ(ω,t) with zero for any (ω,t)
such that θ(ω,t)µY
(ω,t) < 0, we can arrange to have θµY
> 0. (This works
provided the resulting process θ is not identically zero; in that case the same
procedure applied to −θ works.) These properties for θ are preserved after
multiplication by any strictly positive adapted “scaling” process, so we can
assume without loss of generality that θ is in H2
(XY
). Finally, because the
numeraire security associated with the deflator has a price that is identically
equal to 1 after deflation, we can also choose the trading strategy for the
numeraire so that, in addition to the above properties, θ is self-financing.
That is, assuming without loss of generality that the numeraire security is
the first security, we can adopt the same idea used in (4) and let
θ
(N)
t = −
"N−1 X
i=1
θ
(i)
t X
Y,(i)
t +
Z t
0
θ(i)
s dXY,(i)
s
#
.
It follows that θ is a self-financing trading strategy in H2
(XY
), with θ0·XY
0 =
0, whose wealth process W, defined by Wt = θt · XY
t , is increasing and not
constant. In particular, θ is in Θ(XY
). It follows that θ is an arbitrage for
XY
, and therefore (by Numeraire Invariance) for X.
Finally, the reasoning leading to (13) implies that if there is no market-
price-of-risk process, then there can be no equivalent martingale measure for
XY
.
If σ(ω,t) is of rank less than d, there can be multiple solutions η(ω,t) to
(13). There may, therefore, be more than one market-price-of-risk process.
If there is at least one market price of risk, we can always single out for
convenience the unique “minimum-norm” market price of risk, denoted ηX
.
For concreteness, we could construct ηX
defined as follows. Let σ̂t and µ̂t be
obtained, respectively, by eliminating (ω by ω) as many linearly dependent
rows from σt as possible and by eliminating the corresponding elements of130 Chapter 6. Equivalent Martingale Measures
µt. Regardless of how this is done, if X has a market price of risk, then a
particular market price of risk ηX
is uniquely defined by
ηX
t = σ̂⊤
t σ̂tσ̂⊤
t
−1
µ̂t.
For any Rd
-valued adapted process η, we let
ν(η)t =
1
2
Z t
0
ηs · ηs ds,
and, if ν(η)T is finite almost surely, we let
E(−η)t = exp

−
Z t
0
ηs dBt − ν(η)t

, 0 ≤ t ≤ T.
The process E(−η) is known as the stochastic exponential of −η. Lett ξ be
defined by ξt = E(−η)t, Ito’s Formula implies that
dξt = −ξtηt dBt,
so ξ is a local martingale. Novikov’s Condition (Appendix D), which is a
sufficient technical condition for ξ to be a martingale, is that exp[ν(η)T ] has
a finite expectation. If Novikov’s Condition holds and E(−η)T has moreover
finite variance, then we say that η is L2
-reducible. For example, it suffices
that η is bounded. It can be shown as an exercise that if η is L2
-reducible,
then so is ηX
, so it suffices to check this property for ηX
.
All of this sets up L2
-reducibility as a convenient condition for the exis-
tence of an equivalent martingale measure.
Theorem. If X has market price of risk process that is L2
-reducible (it
suffices that there is a bounded market price of risk for X), then there is an
equivalent martingale measure for X, and there is no arbitrage in H2
(X) or
Θ(X).
Proof: If X has an L2
-reducible market price of risk, we let ξ = E(−ηX
).
By Novikov’s Condition, ξ is a positive martingale. We have ξ0 = E(−η)0 =
e0
= 1, so ξ is indeed the density process of an equivalent probability measure
Q defined by dQ
dP
= ξT. By assumption, the variance of dQ
dP
is finite. It remains
to show that X is Q-martingale.6H. Black-Scholes Again 131
By Girsanov’s Theorem, a standard Brownian motion BQ
in Rd
under
Q is defined by dBQ
t = dBt − ηt dt. Thus dXt = σt dBQ
t . As dQ
dP
has finite
variance and each security price process X(i)
is in H2
, we know that
EQ
"Z T
0
σ(i)
(t) · σ(i)
(t) dt
1/2
#
< ∞,
by the same argument used in the proof of Theorem 6E. Thus, X(i)
is a Q-
martingale by Proposition 5B, and Q is therefore an equivalent martingale
measure. The lack of arbitrage in H2
(X) or Θ(X) follows from Theorem
6E.
Putting this result together with the previous lemma, we see that the
existence of a market-price-of-risk process is necessary and, coupled with a
technical integrability condition, sufficient for the absence of “well-behaved”
arbitrages and the existence of an equivalent martingale measure.
For uniqueness of equivalent martingale measures, we can use the fact
that for any such measure Q, Girsanov’s Theorem implies that we must have
dQ
dP
= E(−η)T , for some market price of risk η. If σ(ω,t) is of maximal rank d,
however, there can be at most one solution η(ω,t) to (13). This maximal rank
condition is equivalent to the condition that the span of the rows of σ(ω,t)
is all of Rd
, which is reminiscent of the uniqueness condition for equivalent
martingale measures found in Chapter 2.
Proposition. If rank(σ) = d almost everywhere, then there is at most one
market price of risk and at most one equivalent martingale measure. If there
is a unique market-price-of-risk process, then rank(σ) = d almost everywhere.
6H Black-Scholes Again
Suppose the given security-price process is X = (S(1)
,...,S(N−1)
,β), where,
for S = (S(1)
,...,S(N−1)
),
dSt = µt dt + σt dBt
and
dβt = rtβt dt; β0 > 0,
where µ, σ, and r are adapted processes (valued in RN−1
, R(N−1)×d
, and R
respectively). We also suppose for technical convenience that the short-rate132 Chapter 6. Equivalent Martingale Measures
process r is bounded. Then Y = β−1
is a convenient numeraire deflator, and
we let Z = SY . By Ito’s Formula,
dZt =

−rtZt +
µt
βt

dt +
σt
βt
dBt.
In order to apply Theorem 6G to the deflated price process X̂ = (Z,1),
it would be enough to know that Z has an L2
-reducible market price of
risk. Given this, there would be an equivalent martingale measure Q and
no arbitrage in H2
(X) or Θ(X). Suppose, for the moment, that this is the
case. By the Diffusion Invariance result of Appendix D, there is a standard
Brownian motion BQ
in Rd
under Q such that
dZt =
σt
βt
dBQ
t .
Because S = βZ, another application of Ito’s Formula yields
dSt = rt St dt + σt dBQ
t . (14)
Equation (14) is an important intermediate result for arbitrage-free asset
pricing, giving an explicit expression for security prices under a probability
measure Q with the property that the “discounted” price process S/β is a
martingale. For example, this leads to an easy recovery of the Black-Scholes
formula, as follows.
Suppose that, of the securities with price processes S(1)
,...,S(N−1)
, one
is a call option on another. For convenience, we denote the price process of
the call option by U and the price process of the underlying security by V ,
so that UT = (VT − K)+
, for expiration at time T with some given exercise
price K. Because UY is by assumption a martingale under Q, we have
Ut = βtEQ
t

UT
βT

= EQ
t

exp

−
Z T
t
rs ds

(VT − K)+

. (15)
The reader is asked to verify as an exercise that this is the Black-Scholes
formula for the case of d = 1, N = 3, V0 > 0, and with constants r and
non-zero σ such that for all t, rt = r and dVt = VtµV (t)dt + VtσdBt, where
µV is a bounded adapted process. Indeed, in this case, Z has an L2
-reducible
market price of risk process, an exercise, so the assumption of an equivalent
martingale measure is justified. To be more precise, it is sufficient for the6I. Complete Markets 133
absence of arbitrage that the option-price process is given by (15). Necessity
of the Black-Scholes formula for the absence of arbitrages in H2
(X) or Θ(X)
is formally addressed in Section 6J. We can already see, however, that the
expectation in (15) defining the Black-Scholes formula does not depend on
which equivalent martingale measure Q one chooses, so one should expect
that the Black-Scholes formula (15) is also necessary for the absence of ar-
bitrage. If (15) is not satisfied, for instance, there cannot be an equivalent
martingale measure for S/β. Unfortunately, and for purely technical reasons,
this is not enough to imply directly the necessity of (15) for the absence of
well-behaved arbitrage, because we do not have a precise equivalence between
the absence of arbitrage and the existence of equivalent martingale measures.
Section 6J shows that other methods can be used to show necessity.
In the Black-Scholes setting, we have at most one equivalent martingale
measure because σ is non-zero, implying that σ is of maximal rank d = 1 al-
most everywhere. Thus, from Proposition 6G, there is exactly one equivalent
martingale measure.
The detailed calculations of Girsanov’s Theorem appear nowhere in the
actual solution (14) for the “risk-neutral behavior” of arbitrage-free security
prices, which can be given by inspection in terms of σ and r only. The results
extend to the case of an infinite horizon under technical conditions given in
sources cited in the Notes.
6I Complete Markets
We say that a random variable W can be replicated by a self-financing trad-
ing strategy θ if it is obtained as the terminal value W = θT · XT . Our
basic objective in this section is to give a simple spanning condition on the
diffusion σ of the price process X under which, up to technical integrabil-
ity conditions, any random variable can be replicated (without resporting to
“doubling strategies”).
Proposition. Suppose Y is a numerator deflator and Q is an equivalent
martingale measure for the deflated price process XY
. Suppose the diffusion
σY
of XY
is of full rank d almost everywhere. Let W be any random variable
with EQ
(|WY |) < ∞. Then there is a self-financing trading strategy θ that
replicates W and whose deflated market-value process {θt · XY
t : 0 ≤ t ≤ T}
is a Q-martingale.134 Chapter 6. Equivalent Martingale Measures
Proof: We can suppose that, without loss of generality, the numeraire is the
last of the N securities and write XY
= (Z,1). Let BQ
be the standard
Brownian motion in Rd
under Q obtained by Girsanov’s Theorem. Because
BQ
has the martingale representation property under Q, there is some ϕ such
that
EQ
t (WYT) = EQ
(WYT) +
Z t
0
ϕs dBQ
s , t ∈ [0,T]. (16)
By the rank assumption on σY
, there are adapted processes θ(1)
,...,θ(N−1)
solving
(θ
(1)
t ,...,θ
(N−1)
t )σY
t = ϕ⊤
t , t ∈ [0,T]. (17)
Let θ(N)
be defined by
θ
(N)
t = EQ
(WYT) +
N−1 X
i=1
Z t
0
θ(i)
s dZ(i)
s − θi
tZ
(i)
t

. (18)
Then θ = (θ(1)
,...,θ(N)
) is self-financing and θT · XY
T = WYT. By the
Numeraire Invariance Theorem, θ is also self-financing with respect to X
and θT · XT = W. As
R
ϕdBQ
is by construction a Q-martingale, (16)-(18)
imply that {θt · XY
t : 0 ≤ t ≤ T} is a Q-martingale.
In order to further explore the dynamic spanning properties of the price
process X, we let Θ(X) denote the space of self-financing trading strategies
in H2
(X). The marketed space of X is
M(X) = {θT · XT : θ ∈ Θ(X)}.
We know that M(X) is a subset of L2
(P), the space of all random variables
with finite variance (and therefore finite expectation), because Θ is a subset
of H2
(X). We say that markets are complete if the marketed space M(X) is
actually equal to the space L2
(P). Our objective now is to extend Proposition
6I with necessary and sufficient conditions for complete markets.
To say that M(X) is closed means that if W1,W2,... is a sequence in
M(X), and if W is some random variable such that E[(W − Wn)2
] → 0,
then W is also in M(X). (This would mean that W is also replicated by
some trading strategy in Θ.) For technical reasons, this closedness property
is useful. The following result is from a source cited in the Notes.6I. Complete Markets 135
Lemma. Suppose that Y is a numeraire deflator and that there is a bounded
market-price-of-risk process for XY
. Then M(XY
) is closed.
For the remainder of this section, we suppose there is a bounded short-
rate process r, and let X = (S(1)
,...,S(N−1)
,β), as in Section 6H. We will
work with the usual deflated price process XY
, where Yt = exp(−
R t
0
rs ds).
We can now exploit the previous lemma to obtain a simple condition for
complete markets.
Theorem. For dXt = µt dt + σt dBt, suppose there is a bounded market-
price-of-risk process for XY
. Then markets are complete if and only if
rank(σ) = d almost everywhere.
Proof: Let η be a bounded market-price-of-risk process for XY
and Q be
the associated equivalent martingale measure.
Suppose rank(σ) = d almost everywhere. Let Z = SY
, so that XY
=
(Z,1). Let BQ
be the standard Brownian motion in Rd
under Q defined by
dBQ
t = dBt − ηt dt. Let W be a bounded random variable.
By Ito’s Formula, the diffusion σY
of XY
= XY has the same span
as σ, (ω,t) by (ω,t), and is therefore of rank d almost everywhere. By
Propositon 6I, there is a self-financing trading strategy θ such that θT ·XT =
W, and whose deflated market-value process V is a Q-martingale. Because
W is bounded and dVt = ϕt dBQ
t , where ϕ is given by (16), Proposition 5B
implies that θσ = ϕ is essentially bounded. (That is, there is a constant
k such that, letting δt = 1 whenever kϕtk ≥ k and zero otherwise, we have
E(
R T
0
δt dt) = 0. By the definition of a market-price-of-risk process, θµ = θση.
By assumption, η is bounded, so θµ is essentially bounded, and therefore θ
is in H2
(X). This proves that any bounded W can be replicated by some θ
in Θ(X).
Now suppose that W is in L2
(P). For each positive integer n, we approx-
imate W with the bounded random variable Wn defined by Wn(ω) = W(ω)
whenever |W(ω)| ≤ n and Wn(ω) = 0 otherwise. As Wn is in the marketed
space for all n, and because E[(W −Wn)2
] → 0, we have W in M(X) by the
previous lemma. Thus M(X) = L2
(P).
Conversely, suppose that it is not true that rank(σ) = d almost every-
where. We will show that markets are not complete. By the rank assumption
on σ and the fact that the diffusion σY
of XY
and the diffusion σ of X have
the same span for all (ω,t), there is some bounded adapted process ϕ such
that there is no solution θ(1)
,...,θ(N−1)
to (17). Then there is no trading136 Chapter 6. Equivalent Martingale Measures
strategy θ in H2
(X) that is self-financing with respect to (Z,1) such that
θT ·(ZT ,1) =
R T
0
ϕt dBQ
t . By the Numeraire Invariance Theorem, there is no
θ in Θ(X) with θT · (ST ,βT ) = W, where W = βT
R T
0
ϕt dBQ
t . Because ϕ, β,
and η are bounded, W is in L2
(P).
6J Redundant Security Pricing
We return to the Black-Scholes example of Section 6H. We recall that the
underlying Brownian motion B is 1-dimensional, and that there are two
primitive securties with prices processes V and β, where V is a geometric
Brownian motion and βt = ert
for a constant interest rate r. For a mar-
ket with these two securities alone, there is a bounded market-price-of-risk
process. It follows that markets are complete, that there is an equivalent
martingale measure Q after deflating by β, and that there is no arbitrage in
Θ(X).
Now, consider an option at strike price K, paying (VT − K)+
at time T.
We would like to conclude that the Black-Scholes Formula applies, meaning
that the option has the price process
Ut = EQ
t

e−r(T−t)
(VT − K)+

.
In Section 6H, we showed that this pricing formula is sufficient for the absence
of a well-behaved arbitrage with respect to (β,V,U). Now we show that this
is the unique arbitrage-free price process for the option with that property.
(This was already shown, in effect, in Chapter 5, but the following argument
leads to a more general theorem.)
We proceed as follows. As VT has finite variance, so does the option payoff
(VT − K)+
. Suppose, to set up a contradiction, that the actual option price
process Û is not U. For any constant ǫ > 0, let A+
ǫ denote the event that
Ût − Ut ≥ ǫ for some t in [0,T]. Let A−
ǫ denote the event that Ut − Ût ≥ ǫ
for some t in [0,T]. Because U and Û are assumed to be different processes,
there is some ǫ > 0 such that at least one of the events A+
ǫ or A−
ǫ has strictly
positive probability. Without loss of generality, suppose that P(A+
ǫ ) > 0,
and let τ = inf{t : Ût −Ut ≥ ǫ}, a stopping time that is valued in [0,T] with
strictly positive probability.
By Proposition 6I, there is a self-financing trading strategy θ = (θ(0)
,θ(1)
)
in H2
(β,V ) that replicates (VT −K)+
. From the fact that θ is self-financing,6K. Martingale Measures From No Arbitrage 137
numeraire invariance, and the fact that Q is an equivalent martingalemeasure
for (1,V/β), we have
θ
(0)
t βt + θ
(1)
t Vt = EQ
t e−r(T−t)
(VT − K)+

= Ut.
Let ϕ be the trading strategy defined by ϕt = 0, t < τ, and
ϕt = (θ
(0)
t + er(t−τ)
ǫ,θ
(1)
t ,−1), t ≥ τ,
where (θ(0)
,θ(1)
) is the option-replicating strategy described above. It can be
checked that ϕ is self-financing and that ϕT ·(βT,VT ,ÛT ) > 0, implying that
ϕ is an arbitrage that is in H2
(β,V,U).
More broadly, given some general price process X for the N “primitive”
securities, we say that a security with price process U is redundant if its
final value UT can be replicated by a trading strategy θ in Θ(X). Com-
plete markets implies that any security (with finite-variance price process) is
redundant.
Theorem. Suppose X admits an equivalent martingale measure Q. Given
X, consider a redundant security with price process U in H2
. Then (X,U) ≡
(X(1)
,...,X(N)
,U) admits no arbitrage in H2
(X,U) if and only if U is a Q-
martingale.
Proof: If U is a Q-martingale, then Q is an equivalent martingale measure
for (X,U), implying no arbitrage in H2
(X,U) by Theorem 6E. Conversely,
suppose U is not a Q-martingale. The arguments used for the preceding
Black-Scholes case extend directly to this setting so as to imply the existence
of an arbitrage in H2
(X,U).
One would typically apply this result after deflation. In the definition
of a redundant security, one could have as easily substituted the credit-
constrained class Θ(X,U) of trading strategies for H2
(X,U), allowing a like
substitution in the statement of the theorem.
6K Martingale Measures From No Arbitrage
So far, we have exploited the existence of an equivalent martingale measure
as a sufficient condition for the absence of well-behaved arbitrage. Now we
turn to the converse issue: Does the absence of well-behaved arbitrages imply
the existence of an equivalent martingale measure? In the finite-dimensional138 Chapter 6. Equivalent Martingale Measures
setting of Chapter 2, we know that the answer is always: “After a change
of numeraire, yes.” Only technicalities stand between this finite-dimensional
equivalence and the infinite-dimensional case we face here. Because of these
technicalities, this section can be skipped on a first reading.
Given a price process X for the N securities, suppose there is no arbitrage
in Θ(X). Then, for each W in M(X) (that is, each W = θT · XT for some θ
in Θ(X)), let ψ(W) = θ0 ·X0 denote the unique initial investment required to
obtain the payoff Z. We know that this function ψ : M(X) → R is uniquely
well defined because, if there are two trading strategies θ and ϕ in Θ(X)
with θT · XT = ϕT · XT and θ0 · X0 > ϕ0 · X0, then ϕ − θ is an arbitrage.
The function ψ is linear because stochastic integration is linear. Finally,
again from the absence of arbitrage, ψ is strictly increasing, meaning that
ψ(W) > ψ(W′
) whenever W > W′
. The marketed space M(X) is a linear
subspace of L2
(P) because, whenever Z = θT · XT and W = ϕT · XT are in
M(X), then aZ + bW is also in M for any constants a and b. (This follows
from the fact that aθ + bϕ is a self-financing strategy, using the linearity of
stochastic integration.)
Although the existence of an equivalent martingale measure does not
follow from the absence of arbitrage in H2
(X), we can resort to the notion
of an approximate arbitrage: a sequence {Zn} in M(X) with ψ(Zn) ≤ 0 for
all n, such that there exists some sequence {Z′
n} in L2
(P) with Z′
n ≤ Zn for
all n, and with E[(Z′
n − Z′
)2
] → 0 for some Z′
> 0. The idea is that no Zn
has positive market value, yet Zn is larger than Z′
n, which in turns converges
to a positive, nonzero, random value. For example, suppose θ is an arbitrage
in Θ(X) with θT · XT > 0. Then the (trivial) sequence {Zn} defined by
Zn = θT · XT for all n is an approximate arbitrage. (Just take Z′
n = θT · XT
for all n.) Provided there is a bounded short rate process, or under other
weak assumptions, the absence of approximate arbitrage is indeed a stronger
assumption than the absence of arbitrage in Θ(X), and the difference is
only important (for technical reasons) in this infinite-dimensional setting. If
we strengthen the assumption of no arbitrage in H2
(X) to the assumption
of no approximate arbitrage, we can recover the existence of an equivalent
martingale measure.
Proposition. Suppose X(1)
≡ 1. Then there is no approximate arbitrage
for X if and only if there is an equivalent martingale measure for X.
Proof: Suppose there is no approximate arbitrage. Then there is no arbi-
trage, and the pricing functional ψ : M(X) → R for X is well defined, linear,6K. Martingale Measures From No Arbitrage 139
and strictly increasing. By a technical result cited in the Notes, ψ can be
extended to a strictly increasing linear functional Ψ : L2
(P) → R. By “ex-
tension,” we mean that for any W in M(X), Ψ(W) = ψ(W). Because Ψ is
increasing and linear, the Riesz Representation Theorem for L2
(P) (Exercise
6.8) implies that there is a unique π in L2
(P) such that
Ψ(W) = E(πW), W ∈ L2
(P).
Because X(1)
≡ 1, we have E(πX
(1)
T ) = X
(1)
0 = 1, so E(π) = 1. Let Q be
the probability measure defined by dQ
dP
= π. Because Ψ is strictly increasing,
π ≫ 0, so Q is equivalent to P.
Obviously X(1)
is a martingale. To show that X(i)
is a Q-martingale for
each i > 1, let τ be an arbitrary stopping time valued in [0,T], and let θ be
the trading strategy defined by
(a) θj
= 0 for j 6= i and j 6= 1.
(b) θi
t = 1 for t ≤ τ, and θi
t = 0 for t > τ.
(c) θ1
t = 0 for t ≤ τ, and θ1
t = Xi
τ for t > τ.
This means that θ is the strategy of buying the i-th security at time 0 and
selling it at time τ, holding the proceeds of the sale in the numeraire security.
It is easily seen that θ is in Θ(X) and that θT · XT = X
(i)
τ , with initial
investment X
(i)
0 = ψ(X
(i)
τ ) = E(πX
(i)
τ ) = EQ
(X
(i)
τ ). This characterizes X(i)
as a Q-martingale, by Doob’s Optional Sampling Theorem (Appendix C).
Thus, because dQ
dP
is of finite variance, Q is an equivalent martingale measure
for X.
Conversely, if there is an equivalent martingale measure Q, then there
is no arbitrage in H2
(X) by Theorem 6E, and the linear functional Ψ :
L2
(P) → R defined by Ψ(W) = EQ
(W) is an extension of the pricing func-
tional ψ. Suppose, for purposes of contradiction, that {Wn} is an approx-
imate arbitrage. Then there is some sequence {W′
n} in L2
(P) such that
EQ
(W′
n) ≤ EQ
(Wn) ≤ 0 and EQ
(W′
n) converges to a strictly positive num-
ber. This is impossible, so there is no approximate arbitrage.
Corollary. Suppose there is a bounded short-rate process r. Then there is no
approximate arbitrage for X if and only if there is an equivalent martingale
measure for the deflated price process XY
, where Yt = exp(−
Rt
0
rs ds).140 Chapter 6. Equivalent Martingale Measures
Proof: After deflation by Y , one of the securities has a price identically
equal to 1. Because r is bounded, a trading strategy θ is an approximate
arbitrage for X if and only if it is an approximate arbitrage for XY
. The
Theorem then applies.
6L Arbitrage Pricing with Dividends
This section and the next extend the basic arbitrage-pricing approach to
securities with dividends paid during [0,T]. Consider an Ito process D for
the cumulative dividend of a security. This means that the cumulative total
amount of dividends paid by the security until time t is Dt. For example,
if Dt =
Rt
0
δs ds, then δ represents the dividend-rate process, as treated in
Exercises 5.7, 5.8, and 5.9. Given a cumulative-dividend process D and the
associated security-price process X, the gain process G = X + D measures
the total (capital plus dividend) gain generated by holding the security. A
trading strategy is now defined to be a process θ in L(G), allowing one to
define the stochastic integral
R
θdG representing the total gain generated
by θ. By the linearity of stochastic integrals, if
R
θdX and
R
θdD are well
defined, then
R
θdG =
R
θdX +
R
θdD, once again the sum of capital gains
and dividend gains.
Suppose we are given N securities defined by the price process X =
(X1
,...,XN
) and cumulative-dividend process D = (D1
,...,DN
), with the
associated gain process G = X + D. For now, we assume, for each j, that
Xj
and Dj
are Ito processes in H2
. A trading strategy θ is self-financing,
extending our earlier definition, if
θt · Xt = θ0 · X0 +
Z t
0
θs dGs, t ∈ [0,T].
As before, an arbitrage is a self-financing trading strategy θ with θ0 ·X0 ≤ 0
and θT · XT > 0, or with θ0 · X0 < 0 and θT · XT ≥ 0.
We can extend our earlier results characterizing security prices in the
absence of arbitrage. An equivalent martingale measure for the dividend-
price pair (D,X) is defined as an equivalent probability measure Q under
which G = X +D is a martingale, and such that dQ
dP
has finite variance. The
existence of an equivalent martingalemeasure implies, by the same arguments
used in the proof of Theorem 6E, that there is no arbitrage in H2
(G) or in
Θ(X).6L. Arbitrage Pricing with Dividends 141
Given a trading strategy θ, if there is an Ito process Dθ
such that
Dθ
t = θ0 · X0 +
Z t
0
θs dGs − θt · Xt, t ∈ [0,T],
then we say that Dθ
is the cumulative dividend process generated by θ.
Suppose there exists an equivalent martingale measure Q for (D,X), and
consider an additional security defined by the cumulative dividend process
H and price process V . Both H and V are assumed to be in H2
. Suppose
that the additional security is redundant, in that there exists some trading
strategy θ in H2
(G) such that Dθ
= H and θT · XT = VT . The absence
of arbitrage involving all N + 1 securities implies that, for all t, we have
Vt = θt·Xt almost surely. From this, the gain process V +H of the redundant
security is also a martingale under Q. The proof is a simple extension of that
of Theorem 6J.
Under an equivalent martingale measure Q for (D,X), we have, for any
time t ∈ [0,T],
Xt + Dt = Gt = EQ
t (GT ) = EQ
t (XT + DT ),
which implies that Xt = EQ
t (XT + DT − Dt). For example, if D is defined
by Dt =
R t
0
δs ds, then
Xt = EQ
t

XT +
Z T
t
δs ds

. (19)
Given the dividend-price pair (D,X), there should be no economic effect,
in principle, from a change of numeraire given by a deflator Y . We can
write dYt = µY (t)dt + σY (t)dBt for appropriate µY and σY , and dDt =
µD(t)dt + σD(t)dBt for appropriate µD and σD. The deflated cumulative
dividend process DY
is defined by dDY
t = Yt dDt + σD(t) · σY (t)dt. The
deflated gain process GY
is defined by GY
t = DY
t + XtYt. This leads to a
slightly more general version of numeraire invariance, whose proof is left as
an exercise.
Lemma (Numeraire Invariance). Suppose θ is a trading strategy with re-
spect to (D,X) that generatess an Ito dividend process Dθ
. If Y is a deflator,
then the deflated dividend process (Dθ
)Y
is the dividend process generated by
θ with respect to (DY
,XY
).
The term “σD(t)·σY (t)dt” in the definition of dDY
t might seem puzzling at
first. This term is in fact dictated by numeraire invariance. In all applications142 Chapter 6. Equivalent Martingale Measures
that appear in this book, however, we have either σD = 0 or σY = 0, implying
the more “obvious” definition dDY
t = Yt dDt, which can be intuitively treated
as the dividend “increment” dDt deflated by Yt.
Suppose that X = (S,β), with S = (S(1)
,...,S(N−1)
) and
βt = β0 exp
Z t
0
rs ds

; β0 > 0,
where r is a bounded short-rate process. Consider the deflator Y defined by
Yt = β−1
t . If, after deflation by Y , there is an equivalent martingale measure
Q, then (19) implies the convenient pricing formula
St = EQ
t

exp
Z T
t
−ru du

ST +
Z T
t
exp
Z s
t
−ru du

dDs

. (20)
Proposition 6I and Theorem 6J extend in the obvious way to this setting.
6M Lumpy Dividends and Term Structures
By means beyond the scope of this book, one can extend (20) to the case
of finite-variance cumulative-dividend process of the form D = Z + V − W,
for an Ito process Z and increasing adapted processes V and W that are
right continuous. By increasing, we mean that Vs ≥ Vt whenever s ≥ t.
By right continuous, we mean that for any t, lims↓t Vs = Vt. The jump ∆Vt
of V at time t, as depicted in Figure 6.1, is defined by ∆Vt = Vt − Vt−,
where Vt− ≡ lims↑t Vs denotes the left limit. By convention, V0− = V0 = 0.
The jump ∆Dt ≡ Dt − Dt− of the total dividend process D represents the
lump-sum dividend paid at time t.
Each of the above implications of the absence of arbitrage for security
prices has a natural extension to this case of “lumpy” dividends. In particu-
lar, (20) applies as stated, with
R
θdD defined by
R
θdZ +
R
θdV −
R
θdW
whenever all three integrals are well defined, the first as a stochastic integral
and latter two as Stieltjes integrals. A reader unfamiliar with the Stieltjes
integral may consult sources given in the Notes. Happily, the stochastic in-
tegral and the Stieltjes integral coincide whenever both are well defined. In
this book, we only consider applications that involve the following two trivial
examples of the Stieltjes integral
R
θdV .6M. Lumpy Dividends and Term Structures 143
Vt−
Vt
t time
∆ Vt
Figure6.1: A Right-Continuous Increasing Sample Path
(a) For the first example of a Stieltjes integral, we let V =
R
δt dt for some
δ in L1
, in which case
R t
0
θs dVs =
R t
0
θsδs ds.
(b) In the second case, for some stopping time τ, we have Vt = 0, t < τ,
and Vt = v, t ≥ τ, where v = ∆Vτ is the jump of V at time τ. For
this second case, we have
Rt
0
θs dVs = 0, t < τ, and
R t
0
θs dVs = θτ∆Vτ,
t ≥ τ, which is natural for our purposes.
We continue to take (D,X) to be a dividend-price pair if X + D is an
Ito process. Because of the possibility of jumps in dividends, it is now nec-
essary to take an explicit stance, however, on whether security prices will be
measured ex dividend or cum dividend. We opt for the former convention,
which means that for a dividend-price pair (D,X), a trading strategy θ is
self-financing if
θt · (Xt + ∆Dt) = θ0 · X0 +
Z t
0
θs dGs, t ∈ [0,T],
where G = X+D. With this, an arbitrage is defined as self-financing trading
strategy θ with θ0 ·X0 ≤ 0 and θT ·(XT +∆DT ) > 0, or with θ0 ·X0 < 0 and
θT · (XT + ∆DT ) ≥ 0.
Extending our earlier definition to allow for lumpy dividends, a trading
strategy θ finances a dividend process Dθ
if Dθ
is a right-continuous process144 Chapter 6. Equivalent Martingale Measures
satisfying
θt · (Xt + ∆Dt) = θ0 · X0 +
Z t
0
θs dGs − Dθ
t−, t ∈ [0,T],
with ∆Dθ
T = θT · (XT + ∆DT ).
With these new definitions in place, the term structure can be charac-
terized from (20) as follows. Given a bounded short-rate process r, sup-
pose that Q is an equivalent martingale measure after deflation by Y , where
Yt = exp(−
Rt
0
rs ds). A unit zero-coupon riskless bond maturing at time τ
is defined by the cumulative-dividend process H with Hs = 0, s < τ, and
Hs = 1, s ≥ τ. Because dHs = 0 for s 6= τ, and because ∆Hτ = 1, we know
from case (b) above of the Stieltjes integral that
Z T
t
exp
Z s
t
−ru du

dHs = exp
Z τ
t
−ru du

.
Then (20) implies that the price at time t of a unit zero-coupon riskless bond
maturing at time τ > t is given by
Λt,τ = EQ
t

exp
Z τ
t
−ru du

. (21)
The solution for the term structure given by (21) is based on the im-
plicit assumption that the price of a bond after its maturity date is zero.
This is also consistent with our earlier analysis of option prices, where we
have implicitly equated the terminal cum-dividend price of an option with
its terminal dividend payment. For example, with an option expiring at T
on a price process S with exercise price K, we set the terminal option price
at its expiration value (ST − K)+
. This seems innocuous. Had we actually
allowed for the possibility that the terminal cum-dividend option price might
be something other than (ST −K)+
, however, we would have needed a more
complicated model and further analysis to conclude from the absence of arbi-
trage that the (ST − K)+
is indeed the cum-dividend expiration value. This
issue of terminal security prices is further pursued in a source cited in the
Notes.
Exercises
Exercise 6.1 Provide the details left out of the proof provided for Lemma
6G.6M. Lumpy Dividends and Term Structures 145
Exercise 6.2 Verify relation (14).
Exercise 6.3 We let (Ω,F,P) be a probability space on which is defined a
standard Brownian motion B. We let {Ft : 0 ≤ t ≤ T} denote the standard
filtration of B. Suppose the Ito price process S of an underlying asset is S,
where
dSt = Stµt dt + Stσt dBt,
where µ and σ are bounded, and σ is bounded away from zero. The short rate
process r is bounded. The price process β, defined by βt = exp
R t
0
rs ds

, is
that associated with investment at the short rate.
(A) Show that there is an equivalent martingale measure Q for the two
securities defined by the normalized price process S/β of the underlying and
the normalized value 1 = β/β for investment at the short rate. Compute dQ
dP
,
and provide the drift of S under Q.
(B) Consider a European call option on the underlying asset, with expira-
tion at T, and strike K. If we rule out arbitrages that have a market value
bounded below, provide an expression for the price process Y of the option.
(C) For the price process U that you found in part (B), show that
U0 = c1Q1(A) − c2KQ2(A),
where A is the event that the option expires in the money, Q1 and Q2 are
probability measures equivalent to P, and c1 and c2 are constants. All of c1,
c2, Q1, and Q2 do not depend on the strike price K. Provide dQi
dQ
and the
constants c1 and c2. Explain why c1 and c2 can often be obtained without
calculation.
(D) Show that the solution U0 for the option price given in part (C) cor-
responds to the Black-Scholes option pricing formula in the case of constant
r and σ. Hint: Use Girsanov’s formula for the distribution of logST under
Qi for each i.
(E) Provide an explicit solution U0 for the option price given in part (C),
for the case in which r and σ are deterministic (but not necessarily constant),
expressing the solution in terms of the Black-Scholes formula with an adjusted
interest rate parameter and volatility parameter.
Exercise 6.4 Prove Theorem 6J.146 Chapter 6. Equivalent Martingale Measures
Exercise 6.5 Suppose that the return process Rθ
for a self-financing trad-
ing strategy θ is well defined as an Ito process, as at the end of Section 6D.
Show, as claimed there, that Rθ
satisfies the state-price restriction (6).
Exercise 6.6 Extend the arguments of Sections 6I and Section 6J to the
case of intermediate dividends, as follows. First, consider a particular security
with a dividend-rate process δ in H2
. The cumulative-dividend process H is
thus defined by H =
Rt
0
δs ds, t ∈ [0,T]. Suppose that the security’s price
process V satisfies VT = 0. Suppose that Q is an equivalent martingale
measure with density ξ. Let π be defined by π0 = 1 and (11). The fact that
HY
+ V Y
is a Q-martingale is equivalent to
Vt =
1
Yt
EQ
t
Z T
t
Ysδs ds

, t ∈ [0,T].
(A) From the definition of ξ, Fubini’s Theorem, the law of iterated expec-
tations, and the fact that ξ is a martingale, show each of the equalities
Vt = 1
ξtYt
Et

ξT
RT
t
Ysδs ds

= 1
ξtYt
Et
RT
t
ξTYsδs ds

= 1
ξtYt
R T
t
Et(ξT Ysδs)ds
= 1
ξtYt
RT
t
Et[Es(ξTYsδs)]ds
= 1
ξtYt
R T
t
Et(ξsYsδs)ds
= 1
ξtYt
Et
RT
t
ξsYsδs ds

= 1
πt
Et
RT
t
πsδs ds

.
This calculation shows that Hπ
+V π
is a martingale, consistent with the
definition of π as a state-price deflator. Reversing the calculations shows
that if π is a state-price deflator and var(πT ) < ∞, then HY
+ V Y
is a Q-
martingale, where Q is the probability measure defined by its density process
ξ from (11).
(B) Extend to the case of VT not necessarily zero. That is, suppose Q is an
equivalent probability measure whose density process ξ is of finite variance.
Show that V Y
+HY
is a Q-martingaleif and only if V π
+Hπ
is a P-martingale.6M. Lumpy Dividends and Term Structures 147
(C) Extend to the case of a cumulative-dividend process H that is a
bounded Ito process. (Although beyond the scope of this book, an exten-
sion of Ito’s Formula applying to general dividend processes that are not
necessarily Ito processes shows that one need not assume that H is an Ito
process.)
Exercise 6.7 Extend Exercise 6.6 to allow for cumulative-dividend pro-
cesses, as follows. Recall that the cumulative-dividend process Dθ
gener-
ated by a trading strategy θ is defined by ∆Dθ
T = Wθ
T and Wθ
t = Wθ
0 + R t
0
θs dGs −Dθ
t−, where Wθ
t = θt ·(Xt +∆Dt) and G is the gain process of the
given securities. Let Gθ
denote the gain process generated by θ, defined by
Gθ
t = Wθ
t +Dθ
t−. Assuming that an Ito return process Rθ
for θ is well defined
by dRθ
t = (Wθ
t )−1
dGθ
t , show that Rθ
satisfies the return restriction (6).
Exercise 6.8 Extend the proof of Proposition 6K to allow for general
dividend processes. Add technical conditions as necessary.
Notes
The basic approach of this chapter is from Harrison and Kreps [1979] and
Harrison and Pliska [1981], who coined most of the terms and developed
most of the techniques and basic results. Huang [1985b] and Huang [1985a]
generalized the basic theory. The development here differs in some minor
ways. On numeraire invariance, see Huang [1985a]. This result extends more
generally.
The notion of a doubling strategy, as described here in terms of coin
tosses, appears in Harrison and Kreps [1979]. The actual continuous-time
“doubling” strategy (3)–(4), and proof that the associated stopping time τ
is valued in (0,T), is from Karatzas [1993], as is a version of Lemma 6G.
The relevance of the credit-constrained class of trading strategies Θ(X), and
results such as Proposition 6C, originates with Dybvig and Huang [1988].
Hindy [1995] explores further the implications of a nonnegative wealth con-
straint.
Banz and Miller [1978] and Breeden and Litzenberger [1978] explore the
ability to deduce state prices from the valuation of derivative securities.
Huang and Pagès [1992] give an extension to the case of an infinite-time
horizon. The Stieltjes integral, mentioned in Section 6M, can be found in an
analysis text such as Royden [1968]. Choulli, Krawczyk, and Stricker [1997]
address the role of martingales that are stochastic exponentials (such as a
density process) in financial applications.148 Chapter 6. Equivalent Martingale Measures
In order to see a sense in which the absence of arbitrage implies that ter-
minal ex-dividend prices are zero, see Ōhashi [1991]. This issue is especially
delicate in non-Brownian information settings, since the event that XT 6= 0,
in some informational sense not explored here, can be suddenly revealed at
time T, and therefore be impossible to exploit with a simultaneous trade.
For further discussion of the terminal arbitrage issue, see Ōhashi [1991].
The main technical result used in Section 6K, on the extension of positive
linear functionals, is inspired by Kreps [1981], and can be found specifically
in Clark [1993]. Related results leading to technical conditions for the ex-
istence of an equivalent martingale measure, based on Harrison and Kreps
[1979], and Harrison and Pliska [1981], or related concepts, can be found
in Ansel and Stricker [1992], Ansel and Stricker [1994], Back and Pliska
[1987], Cassese [1996] Dalang, Morton, and Willinger [1990], Delbaen [1992],
Delbaen and Schachermayer [1994b], Delbaen and Schachermayer [1994b],
Delbaen and Schachermayer [1994a], Delbaen and Schachermayer [1995a],
Delbaen and Schachermayer [1995c], Delbaen and Schachermayer [1995b],
Delbaen and Schachermayer [1996a], Delbaen and Schachermayer [1996b],
Delbaen and Schachermayer [1998], Duffie and Huang [1986], El Karoui and
Quenez [1993], Frittelli and Lakner [1995] Jacod and Shiryaev [1998], Ka-
banov [1996], Kabanov and Kramkov [1993], Kabanov and Kramkov [1995],
Kusuoka [1992a], Lakner [993a], Lakner [1993], Levental and Skorohod [1994],
Rogers [1993]. Schachermayer [1992], Schachermayer [1994], Schachermayer
[98], Schweizer [1992], and Stricker [1990]. Of these, Delbaen and Schacher-
mayer [1998] is essentially definitive in a continuous-time setting. Further
references are found in Duffie [1988b]. Most of the results in this chapter ex-
tend to an abstract filtration, not necessarily generated by Brownian motion.
Artzner [1995a] treats completeness and uniqueness of equivalent martingale
measures. Rydberg [1996] discusses uniqueness in a Markovian setting. On
market completeness under a change of measure in the abstract case, see
Duffie [1985].
On the relationship between complete markets and equivalent martingale
measures, see Artzner [1995a], Artzner and Heath [1990], Jarrow and Madan
[1991], Müller [1985], and Stricker [1984].
Amendinger [1999] treats martingale representation for enlarged filtra-
tions. Dritschel and Protter [1998] apply martingale representation in a
financial setting involving Azema’s martingale.
Babbs and Selby [1996], Buhlmann, Delbaen, Embrechts, and Shyriayev
[1996], and Föllmer and Schweizer [1990] suggest some criteria or parame-6M. Lumpy Dividends and Term Structures 149
terization for the selection of an equivalent martingale measures in incom-
plete markets. In particular, Artzner [1995b], Bajeux-Besnainou and Portait
[1997a], Dijkstra [1996], Johnson [1994], and Long [1990], address the nu-
meraire portfolio, also called growth-optimal portfolio, as a device for selecting
a state-price deflator.
For various notions of counterexamples to the existence of an equivalent
martingale measure in the absence of arbitrage, see Stricker [1990], Back and
Pliska [1991], ?], Schachermayer [1993], and Levental and Skorohod(1994).
The notion of an approximate arbitrage is a slight variation on the notion of a
free lunch, introduced by Kreps (1981). Loewenstein and Willard [998a] and
Loewenstein and Willard [998b] treat the implications of local-martingale
versions of a “density process” for what would, as a martingale, define an
equivalent martinglae measure.
Carr and Jarrow [1990] show a connection between local time and the
Black-Scholes model. See, also, Bick [1993]. Delbaen, Monat, Schacher-
mayer, Schweizer, and Stricker [1994], Monat and Stricker [1993a], Monat
and Stricker [1993b], provide conditions for L2
-closedness of the marketed
space of contingent claims, a property used in the last section and in the
proof of Proposition 6I.
Analogues to some of the results in Chapter 5 or in this chapter for
the case of market imperfections such as portfolio constraints or transac-
tions costs are provided by Ahn, Dayal, Grannan, and Swindle [1995], Avel-
laneda and Parás [1994], Bergman [1995], Boyle and Vorst [1992], Carassus
and Jouini [1995], Chen [1994], Clewlow and Hodges [1996] Constantinides
[1993], Constantinides and Zariphopoulou [1999], Cvitanić and Karatzas
[1993], Davis and Clark [1993], Davis and Panas [1991], Davis, Panas, and
Zariphopoulou [1993], Edirisinghe, Naik, and Uppal [1991], Grannan and
Swindle [1992], Henrotte [1991], Jouini and Kallal [1991], Jouini and Kallal
[993a], Karatzas and Kou [1994], Korn [1992], Kusuoka [1992b], Kusuoka
[1993], Leland [1985], Levental and Skorohod [1995] Luttmer [1991], Munk
[1997], Soner, Shreve, and Cvitanić [1994], Taleb [1997], and Whalley and
Wilmott [1994]. Many of these results are asymptotic, for “small” propor-
tional transactions costs. Additional implications of transactions costs and
portfolio constraints for optimal portfolio and consumption choice are cited
in the Notes of Chapter 9.
An application to international markets is given by Delbaen and Shi-
rakawa [1994]. General treatments of some of the issues covered in this chap-
ter can be found in Babbs and Selby [1996], Back and Pliska [1991], Chris-150 Chapter 6. Equivalent Martingale Measures
tensen [1987], Christensen [1991], Conze and Viswanathan [991a], Dothan
[1990], El Karoui and Quenez [1991] El Karoui and Quenez [1993], Geman,
El Karoui, and Rochet [1991], Jarrow and Madan [1994], Jouini and Kallal
[1991], Karatzas [1993], Müller [1985], Protter [1999], and Rady [1993].Chapter 7
Term-Structure Models
THIS CHAPTER REVIEWS models of the term structure of interest rates
that are used for the pricing and hedging of fixed-income securities, those
whose future payoffs are contingent on future interest rates. Term-structure
modeling is one of the most active and sophisticated areas of application of
financial theory to everyday business problems, ranging from managing the
risk of a bond portfolio to the design and pricing of collateralized mortgage
obligations.
Included in this chapter are such standard examples as the Merton, Ho-
Lee, Dothan, Brennan-Schwartz, Vasicek, Black-Derman-Toy, Black-Kara-
sinski, and Cox-Ingersoll-Ross models, and variations of these “single-factor”
term-structure models, so named because they treat the entire term structure
of interest rates at any time as a function of a single state variable, the short
rate of interest. We will also review multifactor models, including multifactor
affine models, extending the Cox-Ingersoll-Ross and Vasicek models.
All of the named single-factor and multifactor models can be viewed in
terms of marginal forward rates rather than directly in terms of interest
rates, within the Heath-Jarrow-Morton (HJM) term-structure framework.
The HJM framework allows, under technical conditions, any initial term
structure of forward interest rates and any process for the conditional volatil-
ities and correlations of these forward rates.
Numerical tractability is essential for practical applications. The “cali-
bration” of model parameters and the pricing of term-structure derivatives
are typically done by such numerical methods as “binomial trees” (Chapter
3), Fourier transform methods (Chapter 8), Monte-Carlo simulation (Chap-
ter 11), and finite-difference solution of PDEs (Chapter 11).152 Chapter 7. Term-Structure Models
This chapter makes little direct use of the pricing theory developed in
Chapter 6 beyond the basic idea of an equivalent martingale measure, which
can therefore be treated as a “black box” for those readers not familiar with
Chapter 6. One need only remember that with probabilities assigned by an
equivalent martingale measure, the expected rate of return on any security
is the short rate of interest. Since the existence of an equivalent martingale
measure is, under purely technical conditions, equivalent to the absence of
arbitrage, we find it safe and convenient to work almost from the outset
under an assumed equivalent martingale measure. Sufficient conditions for
an equivalent martingale measure are reviewed in Chapter 6. An equilibrium
example is given in Chapter 10.
7A The Term Structure
We fix a Standard Brownian Motion B = (B1
,...,Bd
) in Rd
, for some di-
mension d ≥ 1, restricted to some time interval [0,T], on a given probability
space (Ω,F,P). We also fix the standard filtration F = {Ft : 0 ≤ t ≤ T} of
B, as defined in Section 5I.
We take as given an adapted short-rate process r with
R T
0
|rt|dt < ∞.
Conceptually, rt is the continually compounding rate of interest on riskless
securities at time t. This is formalized by taking exp
R s
t
ru du

to be the
market value at time s of an investment made at time t of 1 unit of account,
continually reinvested at the short rate between t and s.
Consider a zero-coupon bond maturing at some future time s > t. By
definition, the bond pays no dividends before time s, and offers a fixed lump-
sum payment at time s that we can take without loss of generality to be
1 unit of account. Although it is not always essential to do so, we assume
throughout the chapter that such a bond exists for each maturity date s.
One of our main objectives is to characterize the price Λt,s at time t of the
s-maturity bond, and its behavior over time.
In the absence of arbitrage, purely technical conditions reviewed in Chap-
ter 6 are required for the existence of an equivalent martingale measure. Such
a probability measure Q has the property that any security whose dividend
is in the form of a lump sum payment of Z at some time s has a price, at
any time t < s of
EQ
t

exp
Z s
t
−ru du

Z

, (1)7B. One-Factor Term-Structure Models 153
where EQ
t denotes Ft-conditional expectation under Q. Here, Z would be
Fs-measurable, and such that the expectation (1) is well defined. A review of
Theorem 2G justifies the easy finite-dimensional version of (1). In particular,
taking Z = 1 in (1), the price at time t of the zero-coupon bond maturing at
s is
Λt,s ≡ EQ
t

exp
Z s
t
−ru du

. (2)
The doubly-indexed process Λ is sometimes known as the discount func-
tion, or more loosely as the term structure of interest rates. The term struc-
ture is often expressed in terms of the yield curve. The continuously com-
pounding yield yt,τ on a zero-coupon bond maturing at time t + τ is defined
by
yt,τ = −
log(Λt,t+τ)
τ
.
The term structure can also be represented in terms of forward interest rates,
as explained in Section 7J.
In most of this chapter, we review conventional models of the behavior of
the short rate r under a fixed equivalent martingale measure Q. In each case,
r is modeled in terms of the standard Brownian motion BQ
in Rd
under Q
that is obtained from B via Girsanov’s Theorem (Appendix D). The Notes
cite more general models. We will characterize the term structure and the
pricing of term-structure derivatives, securities whose payoffs depend on the
term structure.
7B One-Factor Term-Structure Models
We begin with one-factor term-structure models, by which we mean models
of the short rate r given by an SDE of the form
drt = µ(rt,t)dt + σ(rt,t)dBQ
t , (3)
where µ : R ×[0,T] → R and σ : R ×[0,T] → R d
satisfy technical conditions
guaranteeing the existence of a solution to (3) such that for all t and s ≥ t,
the price Λt,s of the zero-coupon bond maturing at s is finite and well defined
by (2). For simplicity, we can take d = 1.
The one-factor models are so named because the Markov property (under
Q) of the solution r to (3) implies from (2) that the short rate is the only154 Chapter 7. Term-Structure Models
state variable, or “factor,” on which the current yield curve depends. That
is, for all t and s ≥ t, we can write Λt,s = F(t,s,rt), for some fixed F :
[0,T] × [0,T] × R → R.
Table 7.1 shows most of the parametric examples of one-factor models
appearing in the literature, with their conventional names. Each of these
models is a special case of the SDE
drt = [K0(t) + K1(t)rt + K2(t)rt log(rt)] dt + [H0(t) + H1(t)rt]ν
dBQ
t ,
for continuous functions K0,K1,K2,H0, and H1 on [0,T] into R, and for some
exponent ν ∈ [0.5,1.5]. Coefficient restrictions, and restrictions on the space
of possible short rates, are needed for the existence and uniqueness of solu-
tions. For each model, Table 7.1 shows the associated exponent ν, and uses
the symbol “•” to indicate those coefficients that appear in nonzero form. We
can view a negative coefficient function K1 as a mean-reversion parameter,
in that a higher short rate generates a lower drift, and vice versa. Empiri-
cally speaking, mean reversion is widely believed to be a useful attribute to
include in single-factor short-rate models.
In most cases, the original versions of these models had constant coef-
ficients, and were only later extended to allow Ki(t) and Hi(t) to depend
on t, for practical reasons, such as calibration of the model to a given set
of bond and option prices, as described in Section 11M. For example, with
time-varying coefficients, the Merton model of the term structure is often
called the Ho-Lee model. A popular special case of the Black-Karasinski
model is the Black-Derman-Toy model, defined in Exercise 7.1. References
to the literature are given in the Notes.
Each of these single-factor models has its own desirable properties, some
of which will be reviewed below. It tends to depend on the application which
of these, if any, is used in practice. The Notes cite some of the empirical
evidence regarding these single-factor models, in some cases strongly pointing
toward multifactor extensions, which we will turn to later in this chapter.
For essentially any single-factor model, the term structure can be com-
puted (numerically, if not explicitly) by taking advantange of the Feynman-
Kac relationship between PDEs and SDEs given in Appendix E. Fixing for
convenience the maturity date s, the Feynman-Kac approach implies from
(2), under technical conditions on µ and σ, that for all t,
Λt,s = f(rt,t), (4)7B. One-Factor Term-Structure Models 155
Table 7.1. Common Single-Factor Model Parameters
Model K0 K1 K2 H0 H1 ν
Cox-Ingersoll-Ross • • • 0.5
Pearson-Sun • • • • 0.5
Dothan • 1.0
Brennan-Schwartz • • • 1.0
Merton (Ho-Lee) • • 1.0
Vasicek • • • 1.0
Black-Karasinski • • • 1.0
Constantinides-Ingersoll • 1.5
where f ∈ C2,1
(R × [0,T)) solves the PDE
Df(x,t) − xf(x,t) = 0, (x,t) ∈ R × [0,s), (5)
with boundary condition
f(x,s) = 1, x ∈ R, (6)
where
Df(x,t) = ft(x,t) + fx(x,t)µ(x,t) +
1
2
fxx(x,t)σ(x,t)2
.
According to the results in Appendix E, in order for (4)–(5)–(6) to be con-
sistent, it is enough that r is nonnegative and that µ and σ satisfy Lipschitz
conditions in x and have derivatives µx, σx, µxx, and σxx that are continuous
and satisfy growth conditions in x. These conditions are not necessary and
can be weakened. We note that the Lipschitz condition is violated for sev-
eral of the examples considered in Table 7.1, such as the Cox-Ingersoll-Ross
model, which must be treated on a case-by-case basis.
The PDE (5)–(6) can be quickly solved using numerical algorithms de-
scribed in Chapter 11. If µ and σ do not depend on t, then, for any calendar
time t and any time u < s remaining to maturity, we can also view the so-
lution f to (5)-(6) as determining the price f(rt,s − u) = Λt,t+u at time t of
the zero-coupon bond maturing at t+u, so that a single function f describes
the entire term structure at any time.156 Chapter 7. Term-Structure Models
7C The Gaussian Single-Factor Models
A subset of the models considered in Table 7.1, those with K2 = H1 = 0,
are Gaussian, in that the short rates {r(t1),...,r(tk)} at any finite set
{t1,...,tk} of times have a joint normal distribution under Q. This fol-
lows from the properties of linear stochastic differential equations reviewed
in Appendix E. Special cases are the Merton (often called “Ho-Lee”) and
Vasicek models.
For the Gaussian model, we can show that bond-price processes are log-
normal (under Q) by defining a new process y satisfying dyt = −rt dt, and
noting that (r,y) is the solution of a two-dimensional linear stochastic dif-
ferential equation, in the sense of Appendix E. Thus, for any t and s ≥ t,
the random variable ys − yt = −
R s
t
ru du is normally distributed. Under Q,
the mean m(t,s) and variance v(t,s) of −
R s
t
ru du, conditional on Ft, are
easily computed in terms of rt, K0, K1, and H0. From the results for linear
SDEs in Appendix E, the conditional variance v(t,s) is deterministic and
the conditional mean m(t,s) is of the form a(t,s) + β(t,s)rt, for coefficients
a(t,s) and β(t,s) whose calculation is left as an exercise. It follows that
Λt,s = EQ
t

exp

−
Z s
t
ru du

= exp

m(t,s) +
v(t,s)
2

= eα(t,s)+β(t,s)r(t)
, (7)
where α(t,s) = a(t,s) + v(t,s)/2. Because rt is normally distributed under
Q, this means that any zero-coupon bond price is log-normally distributed
under Q. Using this property, a further exercise requests explicit compu-
tation of bond-option prices in this setting, along the lines of the original
Black-Scholes formula. Aside from the simplicity of the Gaussian model,
this explicit computation is one of its main advantages in applications.
An undesirable feature of the Gaussian model is that it implies (for H0
everywhere nonzero) that the short rate and yields on bonds of any maturity
are negative with positive probability at any future date. While negative
interest rates are sometimes plausible when expressed in “real” (consump-
tion numeraire) terms, it is common in practice to express term structures
in nominal terms, relative to the price of money. In nominal terms, negative
bond yields imply a kind of arbitrage. In order to describe this arbitrage, we7D. The Cox-Ingersoll-Ross Model 157
can formally view money as a security with no dividends whose price process
is identically equal to 1. If a particular zero-coupon bond were to offer a
negative yield, consider a short position in the bond and a long position of
an equal number of units of money, both held to the maturity of the bond.
With a negative bond yield, the initial bond price is larger than 1, implying
that this position is an arbitrage. Of course, the proposed alternative of
everywhere positive interest rates, along with money, implies that the oppo-
site strategy is an arbitrage if money can be freely shorted. One normally
assumes that money is a special kind of security that cannot be shorted.
(Indeed, the fact that money has a strictly positive price despite having no
dividends means that shorting money is itself a kind of arbitrage.) To address
properly the role of money in supporting nonnegative interest rates would
therefore require a rather wide detour into monetary theory and the institu-
tional features of money markets. It may suffice for our purposes to point
out that money conveys certain special advantages, for example the abil-
ity to undertake certain types of transactions immediately, or with reduced
transactions costs, which would imply a fee in equilibrium for the shorting
of money. Let us merely leave this issue with the sense that allowing nega-
tive interest rates is not necessarily “wrong,” but is somewhat undesirable.
Gaussian short-rate models are nevertheless useful, and frequently used, be-
cause they are relatively tractable and in light of the low likelihood that they
would assign to negative interest rates within a reasonably short time, with
reasonable choices for the coefficient functions.
7D The Cox-Ingersoll-Ross Model
One of the best-known single-factor term-structure modelsis the Cox-Ingersoll-
Ross (CIR) model indicated in Table 7.1. For constant coefficient functions
K0,K1, and H1, the CIR drift and diffusion functions, µ and σ, may be
written in the form
µ(x,t) = κ(x − x); σ(x,t) = C
√
x, x ≥ 0, (8)
for constants κ, x, and C. Provided κ and x are positive, there is a nonnega-
tive solution to the SDE (3), based on a source cited in the Notes. (Obviously,
nonnegativity is important, if only for the fact of the square root in the dif-
fusion). Of course, we assume that r0 ≥ 0, and treat (5)–(6) as applying
only to a short rate x in [0,∞). Given r0, under Q, rt has a non-central χ2158 Chapter 7. Term-Structure Models
distribution with parameters that are known explicitly. In particular, the
drift µ(x,t) indicates reversion toward a stationary risk-neutral mean x at a
rate κ, in the sense that
EQ
(rt) = x + e−κt
(r0 − x),
which tends to x as t goes to +∞. Additional properties of this model are
discussed later in this chapter and in Section 10I, where the coefficients κ, x,
and C are calculated in a general equilibrium setting in terms of the utility
function and endowment of a representative agent. For the CIR model, it
can be verified by direct computation of the derivatives that the solution for
the term-structure PDE (5)–(6) is given by
f(x,t) = exp[α(t,s) + β(t,s)x], (9)
where
α(t,s) =
2κx
C2

log 2γe(γ+κ)(s−t)/2

− log (γ + κ)(eγ(s−t)
− 1) + 2γ

(10)
β(t,s) =
2(1 − eγ(s−t)
)
(γ + κ)(eγ(s−t) − 1) + 2γ
, (11)
for γ = (κ2
+2C2
)1/2
. We will later consider multi-factor versions of the CIR
model.
7E The Affine Single-Factor Models
The Gaussian and Cox-Ingersoll-Ross models are special cases of single-factor
models with the property that the solution f of the term-structure PDE (5)–
(6) is given in the exponential-affine form (9) for some coefficients α(t,s)
and β(t,s) that are continuously differentiable in s. For all t, the yield
−log[f(x,t)]/(s − t) obtained from (9) is affine in x. We therefore call any
such model an affine term-structure model. (A function g : Rk
→ R, for
some k, is affine if there are constants a and b in Rk
such that for all x,
g(x) = a + b · x.)
We can use the PDE (5) to characterize the drift and diffusion functions,
µ and σ, underlying any affine model. Specifically, substituting (9) into (5)
and simplifying leaves, for each (x,t) ∈ R × [0,s),
β(t,s)µ(x,t) = [1 − βt(t,s)]x − αt(t,s) −
1
2
β2
(t,s)σ2
(x,t), (12)7E. The Affine Single-Factor Models 159
where subscripts indicate partial derivatives. We will use (12) to deduce how
µ(x,t) and σ(x,t) depend on x. Suppose, for simplicity, that µ(x,t) and
σ(x,t) do not depend on t. Applying (12) at two possible maturity dates,
say s1 and s2, we have the two linear equations in the two unknowns µ(x)
and σ2
(x):
A(s1,s2)

µ(x)
σ2
(x)

=

−αt(t,s1) + [1 − βt(t,s1)]x
−αt(t,s2) + [1 − βt(t,s2)]x

, (13)
where
A(s1,s2) =

β(t,s1) β2
(t,s1)/2
β(t,s2) β2
(t,s2)/2

.
Except at maturity dates s1 and s2 chosen so that A(s1,s2) is singular, we
can conclude from (13) that µ(x) and σ2
(x) must themselves be affine in x.
Going the other way, suppose that µ and σ2
are affine in x, in that
µ(x,t) = K0(t) + K1(t)x; σ2
(x,t) = H0(t) + H1(t)x.
Then we can recover an affine term-structure model by showing that the
solution to (5)–(6) is of the affine form (9). Such a solution applies if there
exists (α,β) solving (12). The terms proportional to x in (12) must sum to
zero, for otherwise we could vary x and contradict (12). This supplies us
with an ordinary differential equation (ODE) for β:
βt(t,s) = 1 − K1(t)β(t,s) −
1
2
H1(t)β2
(t,s); β(s,s) = 0, (14)
whose boundary condition β(s,s) = 0 is dictated by (6) and (9). The ODE
(14) is a form of what is known as a Ricatti equation. Solutions are finite
given technical conditions on K1 and K2.
Likewise, the “intercept” term in (12), the term that is not dependent on
x, must also be zero. Having solved for β from (14), this gives us:
αt(t,s) = −K0(t)β(t,s) −
1
2
H0(t)β2
(t,s).
Again, the boundary condition α(s,s) = 0 is from (6) and (9). Thus, by
integrating αu(u,s) with respect to u, we have
α(t,s) =
Z s
t

K0(u)β(u,s) +
1
2
H0(u)β2
(u,s)

du. (15)160 Chapter 7. Term-Structure Models
Thus, technicalities aside, µ and σ2
are affine in x if and only if the
term structure is itself affine in x. Numerical solutions of the ODE (14), for
example by discretization methods such as Runge-Kutta, are easy and given
in a source cited in the Notes. Then (15) can solved by numerical integration.
The special cases associated with the Gaussian model and the CIR model
have explicit solutions for α and β.
We have shown, basically, that affine term-structure models are easily
classified and solved. This idea is further pursued in a multifactor setting
later in this chapter and in sources cited in the Notes.
From the above characterization, we know that the “affine class” of term-
structure models includes those shown in Table 7.1 with K2 = 0 and ν = 0.5,
including
(a) The Vasicek model, for which H1 = 0.
(b) The Cox-Ingersoll-Ross model, for which H0 = 0.
(c) The Merton (Ho-Lee) model, for which K1 = H1 = 0.
(d) The Pearson-Sun model.
For affine models with H1 6= 0, existence of a solution to the SDE (3) requires
coefficients (H,K) with
K0(t) − K1(t)
H0(t)
H1(t)
≥ 0, t ∈ [0,T]. (16)
This condition guarantees the existence of a solution r to the SDE (3) with
r(t) ≥ −H0(t)/H1(t) for all t.
7F Term-Structure Derivatives
We return to the general one-factor model (3) and consider one of its most
important applications, the pricing of derivative securities. Suppose a deriva-
tive has a payoff at some given time s defined by g(rs). By the definition of
an equivalent martingale measure, the price at time t for such a security is
F(rt,t) ≡ EQ
t

exp

−
Z s
t
ru du

g(rs)

.7F. Term-Structure Derivatives 161
The Feynman-Kac PDE results of Appendix E give technical conditions on
µ, σ, and g under which F solves the PDE, for (x,t) ∈ R × [0,s),
Ft(x,t) + Fx(x,t)µ(x,t) +
1
2
Fxx(x,t)σ(x,t)2
− xF(x,t) = 0, (17)
with boundary condition
F(x,s) = g(x), x ∈ R. (18)
Some examples follow, abstracting from many institutional details.
(a) A European option expiring at time s on a zero-coupon bond maturing
at some later time u, with strike price p, is a claim to (Λs,u − p)+
at
s. The valuation of the option is given, in a one-factor setting, by the
solution F to (17)–(18), with g(x) = [f(x,s)−p]+
, where f(x,s) is the
price at time s of a zero-coupon bond maturing at u.
(b) A forward-rate agreement (FRA) calls for a net payment by the fixed-
rate payer of c∗
−c(s) at time s, where c∗
is a fixed payment and c(s) is
a floating-rate payment for a time-to-maturity δ, in arrears, meaning
that c(s) is the simple interest rate Λ−1
s−δ,s − 1 applying at time s − δ
for loans maturing at time s. In practice, we usually have a time to
maturity δ or one quarter or one half year. When originally sold, the
fixed-rate payment c∗
is usually set so that the FRA is at market,
meaning of zero market value.
(c) An interest-rate swap is a portfolio of FRAs maturing at a given in-
creasing sequence t(1),t(2), ...,t(n) of coupon dates. The inter-coupon
interval t(i) − t(i − 1) is usually 3 months or 6 months. The associ-
ated FRA for date t(i) calls for a net payment by the fixed-rate payer
of c∗
− c(t(i)), where the floating-rate payment received is c(t(i)) =
Λ−1
t(i−1),t(i) −1, and the fixed-rate payment c∗
is the same for all coupon
dates. At initiation, the swap is usually at market, meaning that the
fixed rate c∗
is chosen so that the swap is of zero market value. Ignor-
ing default risk, this would imply, as can be shown as an exercise, that
the fixed-rate coupon c∗
is the par coupon rate. That is, the at-market
swap rate c∗
is set at the origination date t of the swap so that
1 = c∗
Λt,t(1) + ··· + Λt,t(n)

+ Λt,t(n),
meaning that c∗
is the coupon rate on a par bond, one whose face value
and initial market value are the same.162 Chapter 7. Term-Structure Models
(d) A cap can be viewed as portfolio of “caplet” payments of the form
(c(t(i)) − c∗
)+
, for a sequence of payment dates t(1),t(2),...,t(n) and
floating rates c(t(i)) that are defined as for a swap. The fixed rate c∗
is set with the terms of the cap contract.
(e) A floor is defined symmetrically with a cap, replacing (c(t(i)) − c∗
)+
with (c∗
− c(t(i)))+
.
Path-dependentderivative securities, such as mortgage-backed securities, some-
times call for additional state variables. Some interest-rate derivative securi-
ties are based on the yields of bonds that are subject to some risk of default,
in which case the approach must be modified by accounting for default risk,
as in Chapter 9.
There are relatively few cases of practical interest for which the PDE
(17)–(18) can be solved explicitly. Chapters 8 and 11 review some numerical
solution techniques.
7G The Fundamental Solution
Based on the results of Appendix E, under technical conditions we can also
express the solution F of the PDE (17)–(18) for the value of a derivative
term-structure security in the form
F(x,t) =
Z +∞
−∞
G(x,t,y,s)g(y)dy, (19)
where G is the fundamental solution of the PDE (17). Some have called
G the Green’s function associated with (17), although that terminology is
not rigorously justified. From (19), for any time s > t and any interval
[y(1),y(2)],
Z y(2)
y(1)
G(rt,t,y,s)dy
is the price at time t of a security that pays one unit of account at time s in
the event that rs is in [y(1),y(2)]. For example, the current price Λt,s of the
zero-coupon bond maturing at s is given by
R+∞
−∞
G(rt,t,y,s)dy.
One can compute the fundamental solution G by solving a PDE that is
“dual” to (5)–(6), in the following sense. As explained in Appendix E, under7G. The Fundamental Solution 163
technical conditions, for each (x,t) in R × [0,T), a function ψ ∈ C2,1
(R ×
(0,T]) is defined by ψ(y,s) = G(x,t,y,s), and solves the forward Kolmogorov
equation (also known as the Fokker-Planck equation):
D∗
ψ(y,s) − yψ(y,s) = 0, (20)
where
D∗
ψ(y,s) = −ψt(y,s) −
∂
∂y
[ψ(y,s)µ(y,s)]+
1
2
∂2
∂y2

ψ(y,s)σ(y,s)2

.
The “intuitive” boundary condition for (20) is obtained from the role of G
in pricing securities. Imagine that the current short rate at time t is x, and
consider an instrument that pays one unit of account immediately, if and
only if the current short rate is some number y. Presumably this contingent
claim is valued at 1 unit of account if x = y, and otherwise has no value.
From continuity in s, one can thus think of ψ(·,s) as the density at time
s of a measure on R that converges as s ↓ t to a probability measure ν
with ν({x}) = 1, sometimes called the dirac measure at x. Although this
initial boundary condition on ψ can be made more precise, we leave that to
sources cited in Appendix E. An implementation of this boundary condition
for a numerical solution of (20) is spelled out in Chapter 11. A discrete-
time analogue is found in Chapter 3, where we provided an algorithm for
computing the fundamental solutions for the Black-Derman-Toy and Ho-Lee
models.
Given the fundamental solution G, the derivative asset price function F
is more easily computed by numerically integrating (19) than from a direct
numerical attack on the PDE (17)–(18). Thus, given a sufficient number of
derivative securities whose prices must be computed, it may be worth the
effort to compute G. Some numerical methods for calculating F and G are
indicated in Chapter 11.
A lengthy argument given by a source cited in the Notes shows that the
fundamental solution G of the Cox-Ingersoll-Ross model (8) is given explicitly
in terms of the parameters κ, x, and C by
G(x,0,y,t) =
ϕ(t)Iq ϕ(t)
√
xye−γt

exp[ϕ(t)(y + xe−γt) − η(x + κxt − y)]

eγt
y
x
q/2
,
where γ = (κ2
+ 2C2
)1/2
, η = (κ − γ)/C2
,
ϕ(t) =
2γ
C2(1 − e−γt)
, q =
2κx
C2
− 1,164 Chapter 7. Term-Structure Models
and Iq(·) is the modified Bessel function of the first kind of order q. The
same source gives explicit solutions for the fundamental solutions of other
models. For time-independent µ and σ, as with the CIR model, we have, for
all t and s > t, G(x,t,y,s) = G(x,0,y,s − t).
7H Multifactor Models
The one-factor model (3) for the short rate is limiting. Even a casual review
of the empirical properties of the term structure, some of which can be found
in papers cited in the Notes, shows the significant potential improvements in
fit offered by a multifactor term-structure model. While terminology varies
from place to place, by a “multifactor” model, we mean a model in which
the short rate is of the form rt = R(Xt,t), t ≥ 0, where X is an Ito process
in Rk
solving a stochastic differential equation of the form
dXt = µ(Xt,t)dt + σ(Xt,t)dBQ
t , (21)
where the given functions R, µ, and σ on Rk
× [0,∞) into R, Rk
, and Rk×d
,
respectively, satisfy enough technical regularity to guarantee that (21) has a
unique solution and that the term structure (2) is well defined. (Sufficient
conditions are given in Appendix E.) In empirical applications, one often sup-
poses that the state process X also satisfies a stochastic differential equation
under the probability measure P, in order to exploit the time-series behavior
of observed prices and price-determining variables in estimating the model.
Examples are indicated in the Notes.
An interpretation of the role of the “state variables” is left open for the
time being. For example, in an equilibrium model such as later considered
in Chapter 10, some elements of the state vector Xt are sometimes latent,
that is, unobservable to the modeler, except insofar as they can be inferred
from prices that depend on the levels of X. This latent-variable approach has
been popular in much of the empirical literature on term-structure modeling.
Another approach is to take some or all of the state variables to be directly
observable variables, such as macro-economic determinants of the business
cycle and inflation, that are thought to play a role in determining the term
structure. This approach has also been explored in the empirical literature.
In many examples, one of the component processes X(1
,...,X(k)
is singled
out as the short-rate process r, whose drift and diffusion are allowed to
depend on the levels of the other component processes.7I. Affine Term Structure Models 165
A derivative security is, in this setting, given by some real-valued terminal
payment function g on Rk
, for some maturity date s ≤ T. By the definition
of an equivalent martingale measure, the associated derivative security price
is given from (1) by
F(Xt,t) = EQ
t

exp

−
Z s
t
R(Xu,u)du

g(Xs)

.
Extending (17)–(18), under technical conditions given in Appendix E, we
have the PDE characterization
DF(x,t) − R(x,t)F(x,t) = 0, (x,t) ∈ Rk
× [0,s), (22)
with boundary condition
F(x,s) = g(x), x ∈ Rk
, (23)
where
DF(x,t) = Ft(x,t) + Fx(x,t)µ(x,t) +
1
2
tr

σ(x,t)σ(x,t)⊤
Fxx(x,t)

.
The case of a zero-coupon bond is g(x) ≡ 1. Under technical conditions,
we can also express the solution F, as in (19), in terms of the fundamental
solution G of the PDE (22), as discussed in Appendix E.
7I Affine Term Structure Models
A rich and tractable sub-class of multi-factor models are the affine term-
structure models, defined by taking (21) with
µ(x,t) = K0 + K1x (24)
for some K0 ∈ Rk
and K1 ∈ Rk×k
, and by taking, for each i and j in
{1,...,k},
(σ(x,t)σ(x,t)⊤
)ij = H0ij + H1ij · x, (25)
for H0ij ∈ R and H1ij ∈ Rk
. One can also allow the coefficient functions
H = (H0,H1) and K = (K0,K1) to depend on t; we ignore that for notational
simplicity.166 Chapter 7. Term-Structure Models
Given the coefficients (H,K), a natural statespace D ⊂ RK
for this affine
model is set by the obvious requirement that σ(x,t)σ(x,t)⊤

ii
≥ 0 for all x
in D. Thus, given H, we choose the state space
D =

x ∈ Rk
: H0ii + H1ii · x ≥ 0, i ∈ {1,...,k} . (26)
Conditions cited in the Notes on the coefficients (H,K) ensure existence of
a unique solution X to (21) that is valued in D.
An example is the “multi-factor CIR” model, defined by
dXit = Ai(xi − Xit)dt + Ci
p
Xit dB
Q,(i)
t ; Xi0 > 0, (27)
where Ai, xi, and Ci are positive constants playing the same respective roles
as A, x, and C in the one-factor CIR model (8). Given the independence
under Q of BQ,(1)
,...,BQ,(k)
, if we let R(x,t) = x1 +···+xk, the multi-factor
CIR model generates the zero-coupon bond price f(x,t) for maturity date s
given by
f(x,t) = exp[α(t,s) + β1(t,s)x1 + ··· + βk(t,s)xk], (28)
where α(t,s) = α1(t,s)+···+αk(t,s), and where αi(t,s) and βi(t,s) are the
solution coefficients of the univariate CIR model with coefficients (κi,xi,Ci).
More generally, we suppose that
R(x,t) = ρ0 + ρ1 · x, (29)
for coefficients ρ0 ∈ R and ρ1 ∈ Rk
. For a fixed maturity date s, we expect
a solution f(Xt,t) for the price at time t of a zero-coupon bond maturing at
time s to be of the exponential-affine form
f(x,t) = eα(t)+β(t)·x
, (30)
for deterministic α(t) and β(t). For notational simplicity, we suppress the
maturity date s from the notation for α and β, and we let β(t)⊤
H1(t)β(t)
denote the vector in Rk
whose n-th element is
P
i,j βi(t)⊤
Hijnβj(t). After
substituting the candidate solution (30) into the PDE (22), extending from
the single-factor case, we conjecture that β satisfies the k-dimensional ordi-
nary differential equation, analogous to (14), given by
β′
(t) = ρ1 − K1β(t) −
1
2
β(t)⊤
H1β(t), (31)7J. The HJM Model of Forward Rates 167
with the boundary condition β(s) = 0 determined by (30) and the require-
ment that f(x,s) = 1. We have repeatedly used a separation-of-variables
idea: If a + b · x = 0 for all x in some open subset of Rk
, then a and b must
be zero.
The ODE (31) is, as with the single-factor affine models, a Riccati equa-
tion. Solutions are finite given technical conditions on K1 and H1. In some
cases, an explicit solution is possible. One can alternatively apply a numeri-
cal ODE solution method, such as Runge-Kutta.
Likewise, we find that
α′
(t) = ρ0 − K0β(t) −
1
2
β(t)⊤
H0β(t), (32)
with the boundary condition α(s) = 0. One integrates (32) to get
α(t) =
Z s
t

−ρ0 + K0β(u) +
1
2
β(u)⊤
H0β(u)

du. (33)
Numerical integration is an easy and fast method for treating (33) when
explicit solutions are not at hand.
This affine class of term structure models extends to allow for time-
dependent coefficients (K,H,ρ) and to cases with jumps in the state process
X, as cited in the Notes. As we shall see in Chapter 8, one can also analyt-
ically solve for the transition distribution of an affine state-variable process,
and for the associated prices of options on zero-coupon bonds, using Fourier-
transform methods. The affine model, moreover, is used extensively for the
analysis of asset-pricing applications going well beyond a term-structure set-
ting.
7J The HJM Model of Forward Rates
In modeling the term structure, we have so far taken as the primitive a
model of the short rate process of the form rt = R(Xt,t), where (under
some equivalent martingale measure) X solves a given stochastic differential
equation. (In the one-factor case, one usually takes rt = Xt.) This approach
has the advantage of a finite-dimensional state-space. For example, with this
state-space approach one can compute certain derivative prices by solving
PDEs.168 Chapter 7. Term-Structure Models
An alternative approach is to directly model the stochastic behavior of
the entire term structure of interest rates. This is the essence of the Heath-
Jarrow-Morton (HJM) model. The remainder of this section is a summary of
the basic elements of the HJM model. The following section, the exercises,
and sources cited in the Notes, provide many extensions and details.
The forward price at time t of a zero-coupon bond for delivery at time
τ ≥ t with maturity at time s ≥ τ is (in the absence of arbitrage) given
by Λt,s/Λt,τ, the ratio of zero-coupon bond prices at maturity and delivery,
respectively. Proof of this is left as an exercise. The associated forward rate
is defined by
Φt,τ,s ≡
log(Λt,τ) − log(Λt,s)
s − τ
, (34)
which can be viewed as the continuously compounding yield of the bond
bought forward. The instantaneous forward rate, when it exists, is defined
for each time t and forward delivery date τ ≥ t, by
f(t,τ) = lim
s↓τ
Φt,τ,s. (35)
Thus, the instantaneous forward-rate process f exists (and is an adapted
process) if and only if, for all t, the discount Λt,s is differentiable with respect
to s.
From (34) and (35), we arrive at the ordinary differential equation
d
ds
Λt,s = −Λt,sf(t,s),
with the boundary condition Λ(t,t) = 1. The solution,
Λt,s = exp

−
Z s
t
f(t,u)du

, (36)
is the price at time t of a zero-coupon bond maturing at s. The term structure
can thus be recovered from the instantaneous forward rates, and vice versa.
Given a stochastic model f of forward rates, we will assume that the short
rate process r is defined by rt = f(t,t), the limit of bond yields as maturity
goes to zero. Justification of this assumption can be given under technical
conditions cited in the Notes.
We first fix a maturity date s and model the one-dimensional forward-rate
process f(·,s) = {f(t,s) : 0 ≤ t ≤ s}. We suppose that f(·,s) is an Ito7J. The HJM Model of Forward Rates 169
process, meaning that
f(t,s) = f(0,s) +
Z t
0
µ(u,s)du +
Z t
0
σ(u,s)dBQ
u , 0 ≤ t ≤ s, (37)
where µ(·,s) = {µ(t,s) : 0 ≤ t ≤ s} and σ(·,s) = {σ(t,s) : 0 ≤ t ≤ s} are
adapted processes valued in R and Rd
respectively such that, almost surely, R s
0
|µ(t,s)|dt < ∞ and
R s
0
σ(t,s) · σ(t,s)|dt < ∞.
It turns out that there is an important consistency relationship between
µ and σ. Under purely technical conditions, it must be the case that
µ(t,s) = σ(t,s) ·
Z s
t
σ(t,u)du. (38)
Under technical conditions, this risk-neutral drift restriction on forward rates
will be shown at the end of this section. For now, let us point out that
knowledge of the initial forward rates {f(0,s) : 0 ≤ s ≤ T} and the forward-
rate “volatility” process σ is enough to determine all bond and interest-rate
derivative price processes. That is, given (38), we can use the definition
rt = f(t,t) of the short rate to obtain
rt = f(0,t) +
Z t
0
σ(v,t) ·
Z t
v
σ(v,u)dudv +
Z t
0
σ(v,t)dBQ
v , (39)
assuming that this process exists and is adapted. We can see that if σ is ev-
erywhere zero, the spot and forward rates must coincide, in that r(t) = f(0,t)
for all t, as one would expect from the absence of arbitrage in a deterministic
bond market! From (39), we can price any term-structure related security
using the basic formula (1), calculated numerically if necessary by Monte
Carlo simulation. Indeed, aside from the Gaussian special case studied in
Exercise 7.6 and certain other restrictive special cases, most valuation work
in the HJM setting is done numerically. Special cases aside, there is no finite-
dimensional state variable for the HJM model, so PDE-based computational
methods cannot be used. Instead, one can build an analogous model in dis-
crete time with a finite number of states, and compute prices from “first
principles.” For the discrete model, the expectation analogous to (1) is ob-
tained by constructing all sample paths for r from the discretization of (39),
and by computing the probability (under Q) of each. Sources given in the
Notes provide details. Monte Carlo simulation can also be used, as explained
in Chapter 11.170 Chapter 7. Term-Structure Models
It remains to confirm the key relationship (38) between the drifts and
diffusions of forward rates. Consider the Q-martingale M defined by
Mt = EQ
t

exp

−
Z s
0
ru du

(40)
nonum = exp

−
Z t
0
ru du

Λt,s (41)
= exp(Xt + Yt), (42)
where, using (36),
Xt = −
Z t
0
ru du; Yt = −
Z s
t
f(t,u)du. (41)
In order to continue, we want to show that Y , as an infinite sum of the
Ito processes for forward rates over all maturities ranging from t to s, is itself
an Ito process. From Fubini’s Theorem for stochastic integrals (Appendix
D), this is true under technical conditions on µ and σ. For example, it is
certainly sufficient for Fubini’s Theorem that, in addition to our previous
assumptions, µ(t,u,ω) and σ(t,u,ω) are uniformly bounded and, for each ω,
continuous in (t,u). Under these or weaker conditions for Fubini’s Theorem,
moreover, we can calculate that dYt = µY (t)dt + σY (t)dBQ
t , where
µY (t) = f(t,t) −
Z s
t
µ(t,u)du, (42)
and
σY (t) = −
Z s
t
σ(t,u)du. (43)
This is natural, given the linearity of stochastic integration explained in
Chapter 5. Provided Fubini’s Theorem does apply to give us (42)-(43), we
can apply Ito’s Formula in the usual way to Mt = eX(t)+Y (t)
and obtain the
drift under Q of M as
µM(t) = Mt

µY (t) +
1
2
σY (t) · σY (t) − rt

. (44)
Because M is a Q-martingale, we must have µM = 0, so, substituting (42)
into (44), we obtain
Z s
t
µ(t,u)du =
1
2
Z s
t
σ(t,u)du

·
Z s
t
σ(t,u)du

. (45)7K. Markovian Yield-Curves and SPDEs 171
Taking the derivative of each side of (42) with respect to s then leaves the
risk-neutral drift restriction (38).
7K Markovian Yield-Curves and SPDEs
Specializing the HJM model, we can view the forward-rate curve f(t) =
{f(t,t + u) : 0 ≤ u ≤ ∞}, in each state ω of Ω, as an element of the
state space C1
([0,∞)) of real-valued continuously differentiable functions on
[0,∞). We may then suppose that
σ(t,s) = Σ(f(t),t,s − t), (46)
where Σ : C([0,T]×[0,∞)×[0,∞) → Rd
. For the forward-rate process {f(t) :
t ≥ 0} to be well defined under Q, we would like the “volatility function” Σ
to satisfy enough regularity for existence and uniquess of solutions to
f(t,s) = f(0,s) +
Z t
0
M(f(u),u,s)du +
Z t
0
Σ(f(u),u,s − u)dBu, (47)
where
M(f,t,τ) = Σ(f,t,τ) ·
Z t+τ
t
Σ(f,t,u)du.
This formulation (47) is an example of a stochastic partial differential equa-
tion (SPDE), a general class of infinite-dimensional stochastic differential
equations treated in sources cited in the Notes. While the technicalities are
rather onerous and left to those sources, the idea is rather elegant. Provided
the SPDE (47) is well defined, the entire forward rate curve f(t) is a suffi-
cient statistic for its future evolution. That is, the function-valued process
{f(t) : t ≥ 0} is Markovian with state space C1
([0,∞)), or some suitable
sub-space of smooth functions in C1
([0,∞)).
Applications of the SPDE approach include the market model, which spec-
ifies the proportional-volatility case
Σ(f(t),t,u) = σ(t,u)f(t,t + u) (48)
for some deterministic σ(t,u), at least for certain specified u. This special
case allows for zero-coupon bond options (and therefore conventional caps) to
be priced explicitly by a version of the Black-Scholes option-pricing formula172 Chapter 7. Term-Structure Models
that is explored in an exercise. This is a matter of some convenience in
practice, for the prices of many caps and bond-options are quoted in terms
of Black-Scholes implied volatilities.
Exercises
Exercise 7.1 The Black-Derman-Toy model is normally expressed in the
form
rt = U(t)exp[γ(t)BQ
(t)], (49)
for some functions U and γ in C1
(R+). Find conditions on K1,K2, and H2
under which the parameterization for the Black-Karasinski model shown in
Table 7.1 specializes to the Black-Derman-Toy model (49).
Exercise 7.2 For the Vasicek model, as specified in Table 7.1, show that
Λt,s = exp[α(t,s) + β(t,s)rt],
and provide α(t,s) and β(t,s) in the case of time-independent K0, K1, and
H0.
Exercise 7.3 For the Vasicek model, for time-independent K0, K1, and
H0, compute the price at time zero of a zero-coupon bond call option. The
underlying bond matures at time s. The option is European, struck at c ∈
(0,1), and expiring at τ. That is, compute the price of a derivative that
pays (Λτ,s − c)+
at time τ. Hint: Choose as a numeraire the zero-coupon
bond maturing at time τ. Relative to this numeraire, the short rate is zero
and the payoff of the option is unaffected since Λτ,τ = 1. Use Ito’s Formula
and the solution to the previous exercise to write a stochastic differential
expression for the normalized bond price pt ≡ Λt,s/Λt,τ, t ≤ τ. As such,
p is a “log-normal” process. Now apply the approach taken in Chapter 5
or Chapter 6. Express the solution for the bond option price in the form of
the Black-Scholes option-pricing formula, replacing the usual arguments with
new expressions based on K0, K1, and H0. Do not forget to renormalize to
the original numeraire! This exercise is extended below to the Heath-Jarrow-
Morton setting.
Exercise 7.4 Show, as claimed in Section 7J, that in the absence of arbi-
trage the forward price at time t for delivery at time τ of a zero-coupon bond
maturing at time s > τ is given by Λt,s/Λt,τ. Show that if the short-rate7K. Markovian Yield-Curves and SPDEs 173
process r is nonnegative then the forward interest rates defined by (34) and
instantaneous forward rates defined by (35) are nonnegative. Finally, show
(36).
Exercise 7.5 Let λt,τ,s denote the forward price at time t for delivery at
time τ of one zero-coupon bond maturing at time s. Now consider the forward
price Ft at time t for delivery at time s of a security with price process S
and deterministic dividend rate process δ. Show, assuming integrability as
needed, that the absence of arbitrage implies that
Ft =
St
Λt,s
−
Z s
t
λ−1
t,τ,sδτ dτ.
Do not assume the existence of an equivalent martingale measure.
Exercise 7.6 Consider the Gaussian forward-rate model, defined by taking
the HJM model of Section 7J with coefficients µ(t,s) and σ(t,s) of (37) that
are deterministic and differentiable with respect to s. Let d = 1 for simplicity.
Calculate the arbitrage-free price at time t of a European call option on a
unit zero-coupon bond maturing at time s, with strike price K and expiration
date τ, with t < τ < s. To be specific, the option has payoff (Λτ,s − K)+
at time τ. Hint: Consider the numeraire deflator defined by normalizing
prices relative to the price Λt,τ of the pure discount bond maturing at τ.
With this deflation, compute an equivalent martingale measure P(τ) and
the stochastic differential equation under P(τ) for the deflated bond-price
process Z defined by Zt = Λt,s/Λt,τ, t ≤ τ and Zt = Λt,s, t > τ. Show that
Zτ is log-normallydistributed under P(τ). Using the fact that Λτ,τ = 1, show
that the relevant option price is Λt,τE
P(τ)
t [(Λτ,s−K)+
]. An explicit solution is
then obtained by exploiting the Black-Scholes option-pricing formula. Under
P(τ), conditioning on Ft, one needs to compute the variance of logΛτ,s, which
is normally distributed.
Exercise 7.7 Verify the claim that the at-market coupon rate c∗
on a swp
is the par fixed coupon rate.
Exercise 7.8 In the context of the HJM model with forward-rate process f,
consider a bond issued at time t that pays a dividend process {δs : t ≤ s ≤ τ}
until some maturity date τ, at which time it pays 1 unit of account. Suppose
that, for all s, we have δs = f(t,s). Show that, barring arbitrage, the price
at time t of this bond is 1.174 Chapter 7. Term-Structure Models
Exercise 7.9 We can derive the equivalent martingale measure Q for the
HJM model as follows, at the same time obtaining conditions under which an
arbitrage-free instantaneous forward-rate model f is defined in terms of the
Brownian motion B under the original measure P, for each fixed maturity s,
by
f(t,s) = f(0,s) +
Z t
0
α(u,s)du +
Z t
0
σ(u,s)dBu, t ≤ s. (50)
Here, {α(t,s) : 0 ≤ t ≤ s} and {σ(t,s) : 0 ≤ t ≤ s} are adapted processes
valued in R and Rd
respectively such that (50) is well defined as an Ito
process. This proceeds as follows.
(A) For each fixed s, suppose an Rd
-valued process as
and a real-valued
process bs
are well defined by
as
t = −
Z s
t
σ(t,v)dv; bs
t =
kas
tk2
2
−
Z s
t
α(t,v)dv, t ≤ s. (51)
Show, under additional technical conditions, that for each fixed s,
Λt,s = Λ0,s +
Z t
0
Λu,s(ru + bs
u)du +
Z t
0
Λu,s as
u dBu, 0 ≤ t ≤ s. (52)
Now, taking an arbitrary set {s(1),...,s(d)} of d different maturities,
consider the deflated bond price processes Z1
,...,Zd
, defined by
Zi
t = exp

−
Z t
0
ru du

Λt,s(i), t ≤ s(i). (53)
For the absence of arbitrage involving these d bonds until time S ≡
min{s(i) : 1 ≤ i ≤ d}, Chapter 6 shows that it suffices, and in a sense
is almost necessary, that there exists an equivalent martingale measure Q
for Z = (Z1
,...,Zd
). For this, it is sufficient that Z has a market price
of risk that is L2
-reducible, in the sense of Section 6G. The question of
L2
-reducibility hinges on the drift and diffusion processes of Z. For the
remainder of the exercise, we restrict ourselves to the time interval [0,S].
(B) Show that, for all i,
dZi
t = Zi
tb
s(i)
t dt + Zi
ta
s(i)
t dBt, t ∈ [0,S]. (54)7K. Markovian Yield-Curves and SPDEs 175
For each t ≤ S, let At be the d×d matrix whose (i,j)-element is the j-th
element of the vector a
s(i)
t , and let λt be the vector in Rd
whose i-th element
is b
s(i)
t . We can then consider the system of linear equations
Atηt = λt, t ∈ [0,S], (55)
to be solved for an Rd
-valued process η in L2
. Assuming such a solution η to
(55) exists, and letting ν(Z) =
RS
0
ηt · ηt dt/2 and ξ(Z) = exp[
RS
0
−ηt dBt −
ν(Z)], Proposition 6G implies that α and σ are consistent with the absence
of arbitrage, and that there exists an equivalent martingale measure for Z
that is denoted Q(S), provided exp[ν(Z)] has finite expectation and ξ(Z) has
finite variance. In this case, we can let
dQ(S)
dP
= ξ(Z). (56)
Provided At is nonsingular almost everywhere, Q(S) is uniquely defined. Of
course, S is arbitrary. A sufficient set of technical conditions for each of the
above steps is cited in the Notes.
(C) Suppose At is everywhere nonsingular. Using Girsanov’s Theorem of
Appendix D, show that, for t ≤ s,
f(t,s) = f(0,s) +
Z t
0
[α(u,s) − σ(u,s)ηu]du +
Z t
0
σ(u,s)dBQ
u , (57)
where BQ
is the standard Brownian in Rd
under Q(S) arising from Girsanov’s
Theorem. That is, dBQ
t = dBt + ηt dt.
(D) Show that (57) and (38) are consistent.
Exercise 7.10 (Foreign Bond Derivatives) Suppose you are to price a
foreign bond option. The underlying zero-coupon bond pays one unit of
foreign currency at some maturity date T, and has a dollar price process of
S. With an expiration date for the option of τ and a strike price of K, the
bond option pays (Sτ −K)+
dollars at time τ. Our job is to obtain the bond
option-price process C.
The foreign currency price process, say Ut, is given. The foreign currency
is defined as a security having a continuous dividend process of UtRt, where176 Chapter 7. Term-Structure Models
R is the foreign short-rate process. The exchange-rate process U is assumed
to be a strictly positive Ito process of the form
dUt = αtUt dt + Utβt dBt,
where α, a real-valued adapted process, and β, an Rd
-valued adapted process,
are both bounded.
Foreign interest rates are given by a forward-rate process F, as in the
HJM setting. That is, the price of the given zero-coupon foreign bond at
time t, in units of foreign currency, is exp
R T
t
−F(t,u)du

, and we have
Rt = F(t,t). It follows that the bond-price process in dollars is given by
St = Ut exp
Z T
t
−F(t,u)du

,
and that the price of the bond option, in dollars, is
Ct = EQ
t

exp
Z τ
t
−ru du

(Sτ − K)+

, (58)
where r is the dollar short-rate process and Q is an equivalent martingale
measure. In general we assume that the vector X of security-price processes
(in dollars) for all available securities is such that exp
Rt
0
−ru du

Xt de-
fines a Q-martingale, consistent with the definition of Q as an equivalent
martingale measure. It is assumed that for each t and s ≥ t,
F(t,s) = F(0,s) +
Z t
0
a(u,s)du +
Z t
0
b(u,s)dBQ
u ,
where BQ
is a standard Brownian motion in Rd
under Q, and where the
s-dependent drift process a(·,s) : Ω × [0,T] → R and the s-dependent
diffusion process b(·,s) : Ω × [0,T] → Rd
are assumed to satisfy sufficient
regularity conditions for Q to indeed be an equivalent martingale measure
and for foreign bond price processes to be well defined.
(A) Demonstrate the risk-neutral drift restriction on the foreign forward-rate
process F is given by a(t,s) = b(t,s) ·
Rs
t
b(t,u)du − βt

.
(B) Suppose the domestic forward-rate process f is also of the HJM form.
That is, we have rt = f(t,t), where
f(t,s) = f(0,s) +
Z t
0
µ(u,s)du+
Z t
0
σ(u,s)dBQ
u , (59)7K. Markovian Yield-Curves and SPDEs 177
and where the s-dependent drift process µ(·,s) : Ω × [0,T] → R and the
s-dependent diffusion process σ(·,s) : Ω×[0,T] → Rd
are assumed to satisfy
regularity conditions analogous to a and b, respectively. Suppose the coeffi-
cient processes β, b, and σ are all deterministic. Derive a relatively explicit
expression for the foreign bond-option price.
(C) An international yield spread option is a derivative security that promises
a dollar payoff that depends on the difference δ = F −f between the foreign
and domestic forward-rate curves. For various reasons, it has been proposed
to develop a model directly for the spread curve δ. We will have (59) and
δ(t,s) = δ(0,s) +
Z t
0
m(u,s)du +
Z t
0
v(u,s)dBQ
u , (60)
where the s-dependent drift process m(·,s) : Ω × [0,T] → R and the s-
dependent diffusion process v(·,s) : Ω × [0,T] → Rd
are assumed to satisfy
regularity conditions analogous to a and b, respectively. Develop the drift
restriction on δ. That is, obtain an expression for m that does not explicitly
involve a and b. Do not assume deterministic coefficient processes β, σ,
and v.
Notes
The relationship between forwards and futures in Sections 8B, 8C, and 8D
was developed by Cox, Ingersoll, and Ross [981b]. The derivation given here
for the martingale property (8) of futures prices is original, although the for-
mula itself is due to Cox, Ingersoll, and Ross (1981b), as is the subsequent
replication strategy. For additional work in this vein, see Bick [1994], Dezh-
bakhsh [1994], Duffie and Stanton [1988], and Myneni [992b]. An explicit
Gaussian example is given by Jamshidian [993b] and Jamshidian and Fein
[1990]. Grinblatt and Jegadeesh [1993] derived the futures prices for bonds
in the setting of a Cox-Ingersoll-Ross model of the term structure. Grauer
and Litzenberger [1979] give an example of the equilibrium determination of
commodity forward prices. Carr [1989] provides option-valuation models for
assets with stochastic dividends, in terms of the stochastic model for forward
prices on the underlying asset. Carr and Chen [1993] treat the valuation of
the cheapest-to-deliver option in Treasury Bond futures, sometimes called the
quality option, and the associated problem of determining the futures price.
For the related wildcard option, see Fleming and Whaley [1994]. ?] treat
the case of complex options.178 Chapter 7. Term-Structure Models
Black [1976] showed how to extend the Black-Scholes option-pricing for-
mula to the case of futures options. See, also, Bick [1988]. Carr [1993] and
Hemler [1987] value the option to deliver various grades of the underlying
asset against the futures contract. This problem is related to that of valu-
ing compound options, and options on the maximum or minimum of several
assets, which was solved (in the Black-Scholes setting) by Geske [1979], John-
son [1987], Margrabe [1978], Selby and Hodges [1987], and Stulz [1982]. On
put-call parity and symmetry, see Carr [993b].
McKean [1965], Merton [1973], Harrison and Kreps [1979], and Bensous-
san [1984] did important early work on American option pricing. Proposition
8G is from Karatzas [1988], although his technical conditions are slightly dif-
ferent. Karatzas defines the fair price of an American security, which turns
out to be equal to the arbitrage-free price when both exist, and also extends
Merton’s analysis of perpetual options, those with no expiration. Jaillet,
Lamberton, and Lapeyre [1988] and Jaillet, Lamberton, and Lapeyre [1990]
review the treatment of the optimal stopping valuation problem as a vari-
ational inequality, which can be written in the form (20)–(21). A decom-
position of the American option in terms of an early exercise premium (19)
was proposed in a collection of papers by Jamshidian [989c], Jacka [1991],
Kim [1990], and Carr, Jarrow, and Myneni [1992], working from McKean’s
(1965) formulation of the free boundary problem, sometimes called a Stefan
problem. Moerbeke [1976] was the first to demonstrate, among other results,
that the optimal stopping boundary S∗
is continuously differentiable. In this
regard, see also Ait-Sahlia [1995]. Jorgensen [994a] and Myneni [992a] survey
this and other literature on American put option pricing in the Black-Scholes
setting. Approximate solutions to the American option price are given by
Allegretto, Barone-Adesi, and Elliott [1993], Broadie and Detemple [993a],
Carr [1994], Geske and Johnson [1984], Gandhi, Kooros, and Salkin [993a],
and Barone-Adesi and Elliott [1991] (who cite related literature). The behav-
ior of the optimal exercise boundary near expiration is treated by Ait-Sahlia
[1995], Barles, Burdeau, Romano, and Samsoen [1993], Lamberton [1993],
and Charretour, Elliott, Myneni, and Viswanathan [1992]. Option pricing
in a jump-diffusion setting was originated by Merton [1976], and more re-
cently treated by Amin [993a], ?], and Zhang [1994]. de Matos [1993] gives
a method-of-simulated-moments estimation technique for American options.
Yu [1993] provides additional results on American option valuation. Broadie
and Detemple [993b] and Broadie and Detemple [1995] provide pricing for
American capped call options, and for options on multiple assets.7K. Markovian Yield-Curves and SPDEs 179
Term-structure models such as those applied in Chapter 7 have been
applied to commodity option valuation by Jamshidian [991b] and Jamshidian
(1993b). The sell-at-the-max and buy-at-the-min lookback option valuation
is from Goldman, Sosin, and Gatto [1979]. The particular representation
of the sell-at-the-max put formula is copied from Conze and Viswanathan
[991b]. The distribution of the maximum of a Brownian motion path between
two dates, and related results on the distribution of first passage times, can
be found in Chuang [1994], Dassios [1994], Harrison [1985], and Ricciardi
and Sato [1988]. For other lookback option valuation results, see Conze and
Viswanathan (1991b), Duffie and Harrison [1993], and Shepp and Shiryaev
[1993]. The asian option, based on an arithmetic average of the underlying
price process, is analyzed by Geman and Yor [1993], Oliveira [1994], Rogers
and Shi [1994], and Yor [1991]. Akahari [1993], Miura [1992], and Yor [1993]
treat the related problem of median-price options.
The hedging of asian and lookback options is analysed by Kat [993b]. For
hedging under leverage constraints, see Naik and Uppal [1992]. For hedging
with a “minimax” criterion, see Howe and Rustem [994a] and Howe and
Rustem [994b].
Forms of barrier options, which are variously known as knockouts, knock-
ins, down-and-outs, up-and-ins, limited-risk options, and lock-in options are
covered by Carr and Ellis [1994], Conze and Viswanathan (1991b), Merton
(1973b), and Yu (1993). On approximation methods for anlaysing path-
dependent options, see Kind, Liptser, and Runggaldier [1991].
Beckers (1981) promoted the idea of using implied volatility, as measured
by options prices. A generalized version of implied volatility is discussed by
Bick and Reisman [1993]. Cherian and Jarrow [1993] explore a related “ra-
tionality” issue. Option pricing with stochastic volatility was proposed as an
answer to the “smile curve,” and analyzed, by Hull and White [1987], Scott
[1987], ?], and Wiggins [1987], and since has been addressed by Amin [993b],
Amin and Ng [1993], Ball and Roma [1994], Barles, Romano, and Touzi
[1993], Duan [1995], Heston [1993], Hofmann, Platen, and Schweizer [1992],
Lu and Yu [1993], Platen and Schweizer [1994], Renault and Touzi [992a], Re-
nault and Touzi [992b], Touzi [1993], and Touzi [1995]. Renault and Touzi
(1992b) consider the econometric use of option price data in this setting.
Amin and Jarrow [1993] treat the problem of option valuation with stochas-
tic interest rates, in a Heath-Jarrow-Morton setting. Melino and Turnbull
[1990] illustrate an application to foreign exchange option pricing. Heynen
and Kat [1993] and Heynen, Kemna, and Vorst [1994] provide formulas for180 Chapter 7. Term-Structure Models
prediction of volatility in a Markovian setting. Nelson [1990], Nelson [1991],
and Nelson [1992] treat the convergence of ARCH, GARCH, and EGARCH
models to stochastic volatility models of the style considered in Section 8E,
as well as related issues. Bollerslev, Chou, and Kroner [1992] and Taylor
[1994] survey applications in finance for ARCH and ARCH-related models,
originated by Engle [1982]. ?], Harvey and Shephard [1993], and ?] present
related econometric techniques and results. Hobson and Rogers [1993] de-
scribe a model for endogenous stochastic volatility. Proposition 8E can be
deduced from results in Karatzas and Shreve [1988].
The literature on stochastic volatility and option pricing is often linked
with the extensive body of available work on econometric models of auto-
regressive conditional heteroskedasticity (ARCH), and its extensions and vari-
ants, GARCH and EGARCH defined in sources cited in the Notes. It has
been shown, for example, that typical discrete-time models of heteroskedas-
ticity, including certain ARCH and EGARCH models, converge in a natural
way with time periods of shrinking length to the continuous-time stochastic
volatility model in which vt = logVt is well defined and satisfies the Ornstein-
Uhlenbeck stochastic differential equation
dvt = (a + bvt)dt + cdυt, (43)
where a, b, and c are coefficients that can be estimated from historical obser-
vations of the underlying asset-price process. As (43) is a linear stochastic
differential equation, we know from Appendix E that its solution is a Gaus-
sian process (under Q). One must bear in mind, especially for econometric
applications, that our analysis has been under an equivalent martingale mea-
sure. In order to draw econometric implications, one may also wish to char-
acterize the behavior of stochastic volatility under the original probability
measure P. For example, one can adopt parametric assumptions regarding
the market price of risk.
Attempts have also been made to extend the econometric model to include
observations on option prices in the data set used to estimate the parameters
of the stochastic volatility process. In principal, use of options data should
improve the econometric efficiency of the estimation, given the one-to-one
relationship between vt and a given option price at time t that follows from
the proposition above.
Derman and Kani [1994], Dupire [1992], Dupire [1994], and Rubinstein
[1995] also construct implied-tree models of option pricing.7K. Markovian Yield-Curves and SPDEs 181
Nielsen and Saá-Requejo [1992] provide an example of a foreign exchange
option-valuation model.
The results of Section 8F are based on Duffie, Pan, and Singleton [1997],
which builds on the seminal work on transform-based option pricing by ?]
and Heston [1993], as well as subsequent work by Bakshi, Cao, and Chen
[1997], ?], and ?].
The hedging coefficients, “delta,” “gamma,” and so on, associated with
derivative securities are studied by Carr [1991]. On option pricing with trans-
actions costs and constraints, see references cited in the Notes of Chapter 6.
Johnson and Shanno [1987] and Rich [1993] deal with the impact of default
risk on the Black-Scholes approach. Brennan and Schwartz [980b] present a
model for the valuation of convertible bonds.
General reviews of options, futures, or other derivative markets include
those of Cox and Rubinstein [1985], Daigler [1993], Duffie [1989], Hull [1993],
Jarrow and Rudd [1983], Rubinstein [1992], Siegel and Siegel [1990], and Stoll
and Whaley [1993]. For computational issues, see Chapter 11, or Wilmott,
Dewynne, and Howison [1993]. Dixit and Pindyck [1993] is a thorough treat-
ment, with references, of the modeling of real options, which arise in the
theory of production planning and capital budgeting under uncertainty.
The problem of valuing futures options, as considered in Exercise 8.7,
was addressed and solved by Black (1976). The forward and futures prices
for bonds in the Cox-Ingersoll-Ross model, addressed in Exercise 8.8, are
found in Grinblatt [1994]. A related problem, examined by Carr [1989], is
the valuation of options when carrying costs are unknown. The definition
and pricing result for the market-timing option is from ?]. Gerber and Shiu
[1994] describe a computational approach to option pricing based on the
Escher transform.
Bossaerts and Hillion[1994]115 Kat [993a]116 Ait-Sahliaand Lai[1998]117
Ait-Sahalia and Lai [997a]118 Ait-Sahalia and Lai [997b]119 Amin and Mor-
ton [1994b]120 Amin and Morton [1994a]121 Andersen [1995]122 Andersen,
Andreasen, and Brotherton-Ratcliffe [1997]123 Andersen and Brotherton-
Ratcliffe[1995]124 Bakshi and Madan [1997b]125 Bakshi and Madan [1997a]126
Ball and Torous [1985]127 Barles, Burdeau, Romano, and Samsoen [1995]128
Barles and Soner [1996]129 Basak and Cuoco [995b]130 Bates [1996]131 Bates
[1994]132 Bates [995a]133 Beckers [1981]134 Beibel and Lerche [1997]135
Beibel and Lerche [1995]136 Bensoussan, Crouhy, and Galai [995a]137 Ben-
soussan, Crouhy, and Galai [995b]138 Bergman [985a]139 Bergman, Grundy,
and Wiener [1996]140 Bick [1997]141 Bottazzi and Hueffmann [1999]142182 Chapter 7. Term-Structure Models
Buckdahn and Hu [995b]143 Carr [1995]144 Carr and Faguet [1996]145 Ches-
ney, Jeanblanc, and Yor [1994]146 Corradi [1997]147 Davydov and Linet-
sky [1998]148 Décamps and Koehl [1994]149 Eberlein, Keller, and Prause
[1998]150 Karoui, Jeanblanc, and Shreve [1995]151 Flesaker [1991]152 Frey
[1996]153 Frey and Sin [1997]154 Ghysels, Gourieroux, and Jasiak [1995]155
Ghysels, Harvey, and Renault [1995]156 Goncalves and Souza [1996]157 Grabbe
[1983]158 Gukhal [995a]159 Gukhal [995b]160 Harvey, Ruiz, and Shephard
[1994]161 Haug [1999]162 He and Takahashi [1995]163 Heston [1997]164 He-
ston and Nandi [1997]165 Hobson [1995]166 Hobson and Rogers [1995]167
Huang, Subrahmanyam, and Yu [1995]168 Jackwerth [996a]169 Jackwerth
and Rubinstein [1996b]170 Jackwerth and Rubinstein [1996a]171 Jackwerth
and Rubinstein [1996c]172 Jakubenas [1999]173 Jamshidian [1997]174 John-
son and Stulz [1987]175 Jorion [1988]176 Ju [997a]177 Ju [997b]178 Kusuoka
[996a]179 Lagnado and Osher [1996]180 Lai [1995]181 Lamoureux and Las-
trapes [1993]182 ?] Linetsky [1996]183 Linetsky [1997]184 Lyons [1995]185
Ma and Cvitanić [1996]186 Ma and Yong [1997]187 Madan and Chang [1995]188
Madan and Chang [1996]189 ?] Maghsoodi [1998]190 Nelson [1993]191 Or-
dentlich and Cover [1996]192 Pappalardo [1996]193 Pham [1995]194 Pikovsky
and Shreve [996a]195 Rady [1995]196 Rady [1996]197 Redekop [1995]198 Re-
dekop and Fisher [1995]199 Romano and Touzi [1997]200 Sbuelz [1998]201
Schroder [1999]202 Schröder [1999]203 Schröder [1999]204 Schwartz [1997]205
Scott [1992]206 Scott [1997]207 Stutzer [1996]208 Subramanian [1997]209
Toft and Brown [1996]210 Topper [1998]211 Zhou [1997]212 Zou and Der-
man [1996]213Chapter 8
Derivative Pricing
THIS CHAPTER APPLIES arbitrage-free pricing techniques from Chapter
6 to derivative securities that are not always easily treated by the direct
PDE approach of Chapter 5. A derivative security is one whose cash flows are
contingent on the prices of other securities, or on closely related indices. After
summarizing the essential results from Chapter 6 for this purpose, we study
the valuation of forwards, futures, European and American options, and
certain exotic options. Option pricing with stochastic volatility is addressed
with Fourier-transform methods.
8A Martingale Measures in a Black Box
Skipping over the foundational theory developed in Chapter 6, this section
reviews the properties of an equivalent martingale measure, a convenient
“black-box” approach to derivative asset pricing in the absence of arbitrage.
Once again, we fix a Standard Brownian motion B = (B1
,...,Bd
) in Rd
restricted to some time interval [0,T], on a given probability space (Ω,F,P).
The standard filtration F = {Ft : 0 ≤ t ≤ T} of B is as defined in Section 5I.
We take as given an adapted short-rate process r, with
R T
0
|rt|dt < ∞
almost surely, and an Ito security price process S in RN
with
dSt = µt dt + σt dBt,
for appropriate µ and σ. It was shown in Chapter 6 that aside from tech-
nical conditions, the absence of arbitrage is equivalent to the existence of a184 Chapter 8. Derivative Pricing
probability measure Q with special properties, called an equivalent martin-
gale measure. For this chapter, we will use a narrow definition of equivalent
martingale measures under which all expected rates of return are equivalent
to the riskless rate r; a broader definition is given in Chapter 6. This means
that, under Q, there is a Standard Brownian Motion BQ
in Rd
such that if
the given securities pay no dividends before T, then
dSt = rtSt dt + σt dBQ
t , (1)
which repeats (6.6). After substituting this “risk-neutral” measure Q for P,
one can thus treat every security as though its “instantaneous expected rate
of return” is the short rate r.
More generally, suppose the securities with price process S are claims to
a cumulative dividend process D. (That is, Dt is the vector of cumulative
dividends paid by the N securities up through time t.) In this case, we have
St = EQ
t

exp
Z T
t
−rs ds

ST +
Z T
t
exp
Z s
t
−ru du

dDs

, (2)
which repeats (6.18). For example, suppose that Dt =
R t
0
δs ds for some
dividend-rate process δ. Then (2) implies that
dSt = (rtSt − δt)dt + σt dBQ
t , (3)
generalizing (1). For another example, consider a unit discount riskless bond
maturing at some time s. The cumulative-dividend process, say H, of this
security is characterized by Hu = 0 for u < s and Hu = 1 for u ≥ s. The
price of this bond at any time t < s is therefore determined by (2) as
Λt,s ≡ EQ
t

exp

−
Z s
t
ru du

.
This doubly indexed process Λ is sometimes known as the discount function,
or more loosely as a term structure model. Details are given in Chapter 7.
By the definition of an equivalent martingale measure given in Chapter
6, any random variable Z that has finite variance with respect to P has finite
expectation with respect to Q, and
EQ
t (Z) =
1
ξt
Et(ξTZ), (4)8B. Forward Prices 185
where
ξt = exp

−
Z t
0
ηs dBs −
1
2
Z t
0
ηs · ηs ds

,
and where η is a market-price-of-risk process, that is, an adapted process in
Rd
solving the family of linear equations
σtηt = µt − rtSt, t ∈ [0,T].
The remainder of this chapter applies these concepts to the calculation of
derivative asset prices, going beyond the simple cases treated in Chapter 5.
8B Forward Prices
Sections 8B through 8D address the pricing of forward and futures contracts,
an important class of derivatives. A discrete-time primer on this topic is
given in Exercise 2.17. The forward contract is the simpler of these two
closely related securities. Let W be an FT-measurable finite-variance random
variable underlying the claim payable to a holder of the forward contract at
its delivery date T. For example, with a forward contract for delivery of a
foreign currency at time T, the random variable W is the market value at
time T of the foreign currency. The forward-price process F is an Ito process
defined by the fact that one forward contract at time t is a commitment to
pay the net amount Ft −W at time T, with no other cash flows at any time.
In particular, the true price of a forward contract, at the contract date, is
zero.
We fix a bounded short-rate process r and an equivalent martingale mea-
sure Q. The dividend process H defined by the forward contract made at
time t is given by Hs = 0, s < T, and HT = W − Ft. Because the true price
of the forward contract at t is zero, (2) implies that
0 = EQ
t

exp

−
Z T
t
rs ds

(W − Ft)

.
Solving for the forward price,
Ft =
EQ
t
h
exp

−
R T
t
rs ds

W
i
EQ
t
h
exp

−
R T
t
rs ds
i .186 Chapter 8. Derivative Pricing
If we assume that there exists at time t a zero-coupon riskless bond maturing
at time T, then
Ft =
1
Λt,T
EQ
t

exp

−
Z T
t
rs ds

W

. (5)
From this, ew see that the forward-price process F is indeed an Ito process.
If r and W are statistically independent with respect to Q, we have the
simplified expression Ft = EQ
t (W), implying that the forward price is a Q-
martingale. This would be true, for instance, if the short-rate process r is
deterministic.
As an example, suppose that the forward contract is for delivery at time T
of one unit of a particular security with price process S and dividend process
D. In particular, W = ST . We can obtain a more concrete representation of
the forward price than (5), as follows. From (5) and (2),
Ft =
1
Λt,T

St − EQ
t
Z T
t
exp

−
Z s
t
ru du

dDs

. (6)
If the short-rate process r is deterministic, we can simplify further to
Ft =
St
Λt,T
− EQ
t
Z T
t
exp
Z T
s
ru du

dDs

. (7)
which is known as the cost-of-carry formula for forward prices.
For deterministic r and D, the cost-of-carry formula (7) can be recovered
from a direct and simple arbitrage argument. As an alternative to buying
a forward contract at time t, one could instead buy the underlying security
at t and borrow the required cost St by selling riskless zero-coupon bonds
maturing at T. If one lends out the dividends as they are received by buying
riskless bonds maturing at T, the net payoff to this strategy at time T is
the value ST of the underlying security, less the maturity value St/Λt,T of
the bonds sold at t, plus the total maturity value
R T
t
Λ−1
s,T dDs of all of the
bonds purchased with the dividends received between t and T. The total is
ST − St/Λt,T +
RT
t
Λ−1
s,T dDs. The payoff of the forward contract is ST − Ft.
Since these two strategies have no payoffs except at T, and since both Ft
and St/Λt,T −
RT
t
Λ−1
s,T dDs are known at time t, there would be an arbitrage
unless Ft and St/Λt,T −
RT
t
Λ−1
s,T dDs are equal, consistent with (7).
We have put aside the issue of calculating the equivalent martingale mea-
sure Q. The simplest case is that in which the forward contract is redundant,8C. Futures and Continuous Resettlement 187
for in this case, the equivalent martingale measure does not depend on the
forward price. The forward contract is automatically redundant if the under-
lying asset is a security with deterministic dividends between the contract
date t and the delivery date T, provided there is a zero-coupon bond matur-
ing at T. In that case, the forward contract can be replicated by a strategy
similar to that used to verify the cost-of-carry formula directly. Construction
of the strategy is assigned as an exercise.
8C Futures and Continuous Resettlement
As with a forward contract, a futures contract with delivery date T is keyed
to some delivery value W, which we take to be an FT-measurable random
variable with finite variance. The contract is completely defined by a futures-
price process Φ with the property that ΦT = W. As we shall see, the contract
is literally a security whose price process is zero and whose cumulative divi-
dend process is Φ. In other words, changes in the futures price are credited to
the holder of the contract as they occur. See Exercise 2.17 for an explanation
in discrete time.
This definition is an abstraction of the traditional notion of a futures
contract, which calls for the holder of one contract at the delivery time T
to accept delivery of some asset (whose spot market value is represented
here by W) in return for simultaneous payment of the current futures price
ΦT . Likewise, the holder of −1 contract, also known as a short position of
1 contract, is traditionally obliged to make delivery of the same underlying
assset in exchange for the current futures price ΦT . This informally justifies
the property ΦT = W of the futures-price process Φ given in the definition
above. Roughly speaking, if ΦT is not equal to W (and if we continue to
neglect transactions costs and other details), there is a delivery arbitrage.
We won’t explicitly define a delivery arbitrage since it only complicates the
analysis of futures prices that follows. Informally, however, in the event that
W > ΦT , one could buy at time T the deliverable asset for W, simultaneously
sell one futures contract, and make immediate delivery for a profit of W −ΦT .
Thus the potential of delivery arbitrage will naturally equate ΦT with the
delivery value W. This is sometimes known as the principle of convergence.
Many modern futures contracts have streamlined procedures that avoid
the delivery process. For these, the only link that exists with the notion
of delivery is that the terminal futures price ΦT is contractually equated188 Chapter 8. Derivative Pricing
to some such variable W, which could be the price of some commodity or
security, or even some abstract variable of general economic interest such as
a price deflator. This procedure, finessing the actual delivery of some asset,
is known as cash settlement. In any case, whether based on cash settlement
or the absence of delivery arbitrage, we shall always take it by definition that
the delivery futures price ΦT is equal to the given delivery value W.
The institutional feature of futures markets that is central to our analy-
sis of futures prices is resettlement, the process that generates daily or even
more frequent payments to and from the holders of futures contracts based
on changes in the futures price. As with the expression “forward price,” the
term “futures price” can be misleading in that the futures price Φt at time t
is not the price of the contract at all. Instead, at each resettlement time t,
an investor who has held θ futures contracts since the last resettlement time,
say s, receives the resettlement payment θ(Φt − Φs), following the simplest
resettlement recipe. More complicated resettlement arrangements often ap-
ply in practice. The continuous-time abstraction is to take the futures-price
process Φ to be an Ito process and a futures position process to be some θ
in H2
(Φ) generating the resettlement gain
R
θdΦ as a cumulative-dividend
process. In particular, as we have already stated in its definition, the futures-
price process Φ is itself, formally speaking, the cumulative dividend process
associated with the contract. The true price process is zero, since (again
ignoring some of the detailed institutional procedures), there is no payment
against the contract due at the time a contract is bought or sold.
8D Arbitrage-Free Futures Prices
The futures-price process Φ can now be characterized as follows. We suppose
that the short-rate process r is bounded. For all t, let Yt = exp

−
R t
0
rs ds

.
Because Φ is strictly speaking the cumulative-dividend process associated
with the futures contract, and since the true-price process of the contract is
zero, from (2) we see that
0 = EQ
t
Z T
t
Ys dΦs

, t ≤ T,
from which it follows that the stochastic integral
R
Y dΦ is a Q-martingale.
Because r is bounded, there are constants k1 > 0 and k2 such that k1 ≤8D. Arbitrage-Free Futures Prices 189
Yt ≤ k2 for all t. The process
R
Y dΦ is therefore a Q-martingale if and only
if Φ is also a Q-martingale. (This seems obvious; proof is assigned as an
exercise.) Since ΦT = W, we have deduced a convenient representation for
the futures-price process:
Φt = EQ
t (W), t ∈ [0,T]. (8)
If r and W are statisticallyindependent under Q, the futures-price process
Φ given by (8) and the forward-price process F given by (5) are thus identical.
In particular, if r is deterministic, the cost-of-carry formula (7) applies as well
to futures prices.
As for how to calculate an equivalent martingale measure Q, it is most
convenient if the futures contract is redundant, for then a suitable Q can
be calculated directly from the other available securities. We shall work on
this approach, originating with an article cited in the Notes, and fix for the
remainder of the section an equivalent martingale measure Q. Aside from
the case of complete markets, it is not obvious how to establish the redun-
dancy of a futures contract since the futures-price process Φ is itself the
cumulative-dividend process of the contract, so any argument might seem
circular. Suppose, however, that there is a self-financing strategy (in secu-
rities other than the futures contract) whose value at the delivery date T
is
ZT = W exp
Z T
t
rs ds

.
We will give an example of such a strategy shortly. From the definition of
Q, the market value of this strategy at time t is Zt = EQ
t (W). We claim
that if Φt is not equal to Zt, then there is an arbitrage. In order to show
this, we will construct a trading strategy, involving only the futures contract
and borrowing or lending at the short rate, such that the strategy pays off
exactly ZT at time T and requires the investment of Φt at time t. It will be
clear from this that the absence of arbitrage equates Φt and Zt. The strategy
is constructed as follows. Let θ be the (bounded) futures position process
defined by θs = 0,s < t, and θs = exp
Rs
t
ru du

,s ≥ t. Let Vt be the amount
invested at the short rate at time t, determined as follows. Let Vs = 0, s < t,
and Vt = Φt. After t, let all dividends generated by the futures position be
invested at the short rate and “rolled over.” That is, let
dVs = rsVs ds + θs dΦs, s ∈ [t,T].190 Chapter 8. Derivative Pricing
The total market value at any time s ≥ t of this self-financing strategy in
futures and investment at the short rate is the amount Vs invested at the short
rate, since the true price of the futures contract is zero. We can calculate by
Ito’s Formula that
VT = ΦT exp
Z T
t
rs ds

= W exp
Z T
t
rs ds

= ZT , (9)
which verifies the claim that the futures contract is redundant.
Summarizing, the futures-price process is uniquely defined by (8) provided
there is a self-financing strategy with value ZT = W exp
R T
t
rs ds

at the
delivery date T. It remains to look for examples in which ZT is indeed the
value at time T of some self-financing strategy. That is the case, for instance,
if the futures contract delivers a security that pays no dividends before T
and if the short-rate process is deterministic. With this, the purchase of
exp
RT
t
rs ds

units of the underlying security at time 0 would suffice. More
general examples can easily be constructed.
There is one loose end to tidy up. The assumption that the futures-price
process Φ is an Ito process played a role in our analysis, yet we have not
confirmed that the solution (8) for Φ is actually an Ito process. This can be
shown as an application of Girsanov’s Theorem (Appendix D).
8E Stochastic Volatility
The Black-Scholes option-pricing formula, as we recall from Chapter 5, is of
the form C(x,p,r,t,σ), for C : R5
+ → R+, where x is the current underlying
asset price, p is the exercise price, r is the short interest rate, t is the time
to expiration, and σ is the volatility coefficient for the underlying asset. For
each fixed (x,p,r,t), the map from σ to C(x,p,r,t,σ) is strictly increasing,
and its range is unbounded. We may therefore invert and obtain the volatility
from the option price. That is, we can define an implied volatility function
I : R5
+ → R+ by
c = C(x,p,r,t,I(x,p,r,t,c)), (10)
for all sufficiently large c ∈ R+.
If c1 is the Black-Scholes price of an option on a given asset at strike p1
and expiration t1, and c2 is the Black-Scholes price of an option on the same
asset at strike p2 and expiration t2, then the associated implied volatilities8E. Stochastic Volatility 191 implied volatility
exercise price
Figure8.1: The Smile Curve
I(x,p1,r,t1,c1) and I(x,p2,r,t2,c2) must be identical if indeed the assump-
tions underlying the Black-Scholes formula apply literally, and in particular
if the underlying asset-price process has the constant volatility of a geo-
metric Brownian motion. It has been widely noted, however, that actual
market prices for European options on the same underlying asset have as-
sociated Black-Scholes implied volatilities that vary with both exercise price
and expiration date. For example, in certain markets at certain times im-
plied volatilities depend on strike prices in the convex manner illustrated in
Figure 8.1, which is often termed a smile curve. Other forms of systematic
deviation away from constant implied volatilities have been noted, both over
time and across various derivatives at a point in time.
Three major lines of modeling address these systematic deviations from
the assumptions underlying the Black-Scholes model. In both of these, the
underlying log-normal price process is generalized by replacing the constant
volatility parameter σ of the Black-Scholes model with a volatility process, an
adapted non-negative process V with
R T
0
Vt dt < ∞ such that the underlying
asset price process S satisfies
dSt = rtSt dt + St
p
Vt dǫS
t , (11)
where ǫS
= cS · BQ
is a standard Brownian motion under Q obtained from
any cS in Rd
with unit norm.192 Chapter 8. Derivative Pricing
In the first class of models, Vt = v(St,t), for some function v : R×[0,T] →
R satisfying technical regularity conditions. In practical applications, the
function v, or its discrete-time discrete-state analogue, is “calibrated” to the
available option prices. This approach, sometimes referred to as the implied-
tree model, is explored in literature cited in the Notes of this chapter and of
Chapter 3.
A second approach, called generalized autoregressive conditional heteroscedas-
tic, or GARCH, the volatility depends on the path of squared returns. The
model was originally formulated in a discrete time setting by constructing
the volatility Vt at time t of the return Rt+1 = logSt+1 − logSt according to
the recursive formula
Vt = a + bVt−1 + cR2
t ,
for fixed coefficients a, b, and c satisfying regularity conditions. By takinga
time period of length h, normalizing, and taking limits, a natural continous-
time limiting behavior for volatility is simply a deterministic mean-reverting
process V satisfying the ordinary differential equation
dV (t)
dt
= κ(v − V (t)).
There is, however, an alternative proposal for the continuous-time limit, dis-
cussed in the Notes.
In a third approach, the increments of the volatility process V depend on
Brownian motions that are not perfectly correlated with ǫS
. For example,
in a simple “one-factor” setting the volatility process V satisfies a stochastic
differential equation of the form
dVt = µV (Vt)dt + σV (Vt)dǫV
t , (12)
where ǫV
= cV · BQ
is a standard Brownian motion under Q. As we shall
see, the correlation parameter cSV = cS · cV has an important influence on
option prices.
The Feynman-Kac approach illustrated in Chapter 5 leads, under tech-
nical conditions, to a partial differential equation to be solved for a function
f : R+ × R × [0,t] → R that determines the price at time s of a European
option at exercise price p and expiration at time t as
f(Ss,Vs,s) = EQ
s

e−r(t−s)
(St − p)+

.
Methods for solving such a PDE by discretization are cited in Chapter 11.8E. Stochastic Volatility 193
A special case of the stochastic-volatility model that has sometimes been
applied takes the correlation parameter cSV to be zero. This implies that the
volatility process V is independently distributed (under Q) with the return-
driving Brownian motion ǫS
. One can then more easily calculate the value
an option (or another derivative) on the underlying asset by noting that,
conditional on the volatility process V , the underlying asset price process is
log-normal under Q. That is, the distribution under Q of logSt conditional
on the entire volatility process {Vs : s ∈ [0,t]} is normal with standard
deviation σ(V )
√
t, where
σ(V ) =
1
√
t
Z t
0
Vs ds
1/2
,
and with mean rt − σ(V )2
t/2. By the law of iterated expectations, the
European call option price, with expiration date t and strike p, is given by
C(S0,V0,p,r,t) = EQ

e−rt
(St − p)+

= EQ
EQ

e−rt
(St − p)+
| {Vs : s ∈ [0,t]}

= EQ
[C (S0,p,r,t,σ(V ))], (13)
where C(·) as usual denotes the Black-Scholes formula. Given a particular
stochastic model for V , one could evaluate the option price (13) by several
numerical methods mentioned in the Notes. One finds that that the implied
smile curve is indeed “smile-shaped,” although it is difficult to reconcile this
special case with the empirical behavior of many types of options. In particu-
lar, in many settings, a pronounced skew to the smile indicates an important
potential role for correlation between the increments of the return-driving
and volatility-driving Brownian motions, ǫS
and ǫV
. This role is borne out
directly by the correlation apparent from time-series data on implied volatil-
ities and returns for certain important asset classes, as indicated in sources
cited in the Notes.
A tractable model that allows for the skew effects of correlation is the
Heston model, for which
dVt = κ(v − Vt)dt + σv
p
Vt dǫV
t , (14)
for positive coefficients κ, v, and σv that play the same respective roles for V
as for a Cox-Ingersoll-Ross interest rate model. (Indeed, (14) is sometimes194 Chapter 8. Derivative Pricing
called a “CIR model” for volatility.) In the original Heston model, the short
rate was assumed to be a constant, say r, and option prices can be com-
puted analytically, using transform methods explained in the next section,
in terms of the parameters (r,cSV ,κ,v,σv) of the Heston model, as well as
the initial volatility V0, the initial underlying price S0, the strike price, and
the expriation time. This transform approach also accomodates stochastic
interest rates and more general volatility models.
8F Option Valuation by Transform Analysis
This section is devoted to the calculation of option prices with stochastic
volatility, in a setting with affine state dynamics of the type introduced for
term-structure modeling in Chapter 7, using transform analysis. This will
allow for relatively rich and tractable specifications of stochastic interest rates
and volatility, and, eventually, for jumps. Repeating from Chapter 7, a state
process X in state space D ⊂ Rk
is affine (under Q) if
dXt = µ(Xt)dt + σ(Xt)dBQ
t , (15)
where µ(x) = K0 + K1x for some K0 ∈ Rk
and K1 ∈ Rk×k
and, for each i
and j in {1,...,k},
σ(x)σ(x)⊤

ij
= H0ij + H1ij · x, (16)
for some H0ij ∈ R and H1ij ∈ Rk
, for the state space
D = {x : H0ii + H1ii · x ≥ 0, 1 ≤ i ≤ n}.
The Notes cite technical conditions on the coefficients (H,K) ensuring the
existence of a unique solution X to (15). For time-series empirical studies,
it is often convenient to suppose that the X is also affine under the data-
generating probability measure P, albeit with a different set KP
of drift-
related coefficients in place of K. Conditions for this, and extensions to
time-dependent coefficients, are explored in exercises.
In this setting, the short-rate process r is assumed to be of the affine
form rt = ρ0 + ρ1 · Xt, for coefficients ρ0 in R and ρ1 in Rk
. Finally, we
suppose that the price process S underling the options in question is of the
exponential-affine form St = exp(at +bt ·Xt), for potentially time-dependent8F. Option Valuation by Transform Analysis 195
coefficients at in R and bt in Rk
. An example would be the price of an equity,
a foreign currency, or, as shown in Chapter 7, the price of a zero-coupon
bond.
The Heston model (14) is a special case with constant short rate r = ρ0,
with k = d = 2, with X
(1)
t = Yt ≡ log(St), and X
(2)
t = Vt. From Ito’s
Formula,
dYt =

r −
1
2
Vt

dt +
p
Yt dǫS
t , (17)
which indeed makes the state vector Xt = (Yt,Vt)⊤
an affine process, whose
state space is D = R×[0,∞), and whose coefficients (H,K) can be chosen in
terms of the parameters (r,cSV ,κ,v,σv) of the Heston model. The underlying
asset price is of the desired exponential-affine form because St = eY (t)
. We
will return to the Heston model shortly with some explicit results on option
valuation.
For the general affine case, suppose we are interested in valuing a Euro-
pean call option on the underlying security, with strike price p and exercise
date t. We have the initial option price
U0 = EQ

exp

−
Z t
0
ru du

(Su − p)+

.
Letting A denote the event {ω : S(ω,t) ≥ p} that the option is in the money
at expiration, we have the option price
U0 = EQ

exp

−
Z t
0
rs ds

(St1A − p1A)

.
Because S(t) = ea(t)+b(t)·X(t)
, we have
U0 = ea(t)
G(−logp;t,b(t),−b(t)) − pG(−logp,t,0,−b(t)), (18)
where, for any y ∈ R and for any coefficient vectors d and δ in Rk
,
G(y;t,d,δ) = EQ

exp

−
Z t
0
rs ds

ed·X(t)
1δ·X(t)≤y

.
So, with the ability to compute the function G, we can obtain the prices
of options of any strike and exercise date. Likewise, the prices of European
puts, interest rate caps, chooser options, and many other derivatives can be
derived in terms of G, as shown in exercises and sources cited in the Notes.196 Chapter 8. Derivative Pricing
We note, for fixed (t,d,δ), assuming E ed·X(t)

< ∞, that G(·;t,d,δ) is
a bounded increasing function. For any such function g : R → [0,∞), an
associated transform ĝ : R → C , where C is the set of complex numbers, is
defined by
ĝ(z) =
Z +∞
−∞
eizy
dg(y), (19)
where i is the usual imaginary number, often denoted
√
−1. (Appendix H
summarizes a few minimal elements of complex arithmetic.) Depending on
one’s conventions, one may refer to ĝ as the fourier transform of g. Under
the technical condition that
R+∞
−∞
|ĝ(z)|dz < ∞, we have the Levy Inversion
Formula
g(y) =
ĝ(0)
2
−
1
π
Z ∞
0
1
z
Im[eizy
ĝ(iz)]dz, (20)
where Im(c) denotes the imaginary part of a complex number c.
For the case g(y) = G(y;t,d,δ), knowing the transform Ĝ(·;t,d,δ), then
we can compute G(y;t,d,δ) from (20), typically by computing the integral
in (20) numerically, and thereby obtain option prices from (18). Our final
objective is therefore to compute the transform Ĝ. Fixing z, and applying
Fubini’s Theorem to (19) implies that Ĝ(z;t,d,δ) = f(X0,0) where f : D ×
[0,t] → C is defined by
f(Xs,s) = EQ

exp

−
Z t
s
ru du

ed·X(t)
eizδ·X(t)
Xt

. (21)
From (21), the same separation-of-variables arguments used in Chapter 7
imply, under technical regularity conditions, that
f(x,s) = eα(s)+β(s)·x
, (22)
where β solves the Ricatti ordinary differential equation (ODE)
β′
(s) = ρ1 − K1β(s) −
1
2
β(s)⊤
H1β(s), (23)
with the boundary condition
β(t) = d + izδ, (24)
and where
α(s) =
Z t
s

−ρ0 + K0 · β(u) +
1
2
β(u)⊤
H0β(u)

du. (25)8G. American Security Valuation 197
The ODE (23) is identical to that arising in the affine term-structure calcula-
tions of Chapter 7, but the solutions for α(t) and β(t) are complex numbers,
in light of the complex boundary condition (24) for β(t). One must keep
track of both the real and imaginary parts of α(s) and β(s), following the
usual rules of complex arithmetic outlined in Appendix H.
Thus, under technical conditions, we have our transform Ĝ(z;t,d,δ), eval-
uated at a particular z. We then have the option-pricing formula (18), where
G(y;t,d,δ) is obtained from the inversion formula (20) applied to the trans-
forms Ĝ(·;t,b(t),−b(t)) and Ĝ(·;t,0,−b(t)), obtained by solving the Ri-
catti equation (23) with the respective boundary conditions b(t)−izb(t) and
−izb(t). For cases in which the ODE (23) cannot be solved explicitly, its
numerical computation, followed by numerical integration to obtain (20),
is somewhat burdensome. Direct PDE or Monte Carlo numerical methods
would typically, however, be even more computationally intensive.
For option pricing with the Heston model, we require only the transform
ψ(u) = e−rt
EQ
[euY (t)
], for some particular choices for u ∈ C , and solving (23)
for this case we have
ψ(u) = eα(t,u)+uY (0)+β(t,u)V (0)
,
where, letting b = uσvcSV − κ, a = u(1 − u), and γ =
p
b2 + aσ2
v, we find
that
β(t,u) = −
a(1 − e−γt
)
2γ − (γ + b)(1 − e−γt)
,
α(t,u) = rt(u − 1) − κv

γ + b
σ2
v
t +
2
σ2
v
log

1 −
γ + b
2γ
1 − e−γt


.
Other special cases for which one can compute explicit solutions are cited in
the Notes, or treated in exercises.
8G American Security Valuation
This section addresses the valuation of American securities, those whose cash
flows are determined by the stopping time at which the owner of the American
security decides to exercise. As our setup for primitive securities, we take
a bounded short-rate process r and suppose that the price process S of the
other securities satisfies (1), where BQ
is a standard Brownian motion under198 Chapter 8. Derivative Pricing
a probability measure Q equivalent to P. We also suppose for this section
that rank (σ) = d almost everywhere, so that any random payoff with finite
risk-neutral expectation can be replicated without resorting to “doubling
strategies,” as shown by Proposition 6I. As indicated in Chapter 2, some sort
of dynamic-spanning property of this type is important for the valuation of
American securities.
An American security, defined by an adapted process U and an expiration
time τ, is a claim to the payoff Uτ at a stopping time τ ≤ τ chosen by the
holder of the security. Such a stopping time is an exercise policy. As with
the discrete-time treatment in Chapter 2, our objective is to calculate the
price process V of the American security and to characterize rational exercise
policies. The classic example is the case of a put option on a stock in the
Black-Scholes setting of constant-volatility stock prices and constant short
rates. In that case, we have Ut = (K − St)+
, where K is the exercise price
and S is the underlying asset price process. More generally, we will rely on
the following technical condition.
American Regularity Condition. U is a adapted continuous process,
bounded below, with EQ
(U∗) < ∞, where U∗ = supt∈[0,T ] Ut.
This regularity is certainly satisfied for an American put option in stan-
dard settings for which the underlying price process is an Ito process.
Given some particular exercise policy τ, Proposition 6I implies that the
claim to Uτ exp
RT
τ
rs ds

at T can be replicated by a self-financing trading
strategy θ whose market-value process V τ
is given by
V τ
t = EQ
t (ϕt,τUτ),
where ϕt,τ ≡ exp
Rτ
t
−rs ds

. This implies that the payoff of Uτ at time
τ is replicated by the trading strategy θτ
that is θ until time τ, and zero
afterward, generating a lump-sum payment of Uτ at τ.
Following the approach taken in Section 2I, we therefore define a rational
exercise policy as a solution to the optimal-stopping problem
V ∗
0 = sup
τ∈T (0)
V τ
0 , (26)
where T (t) denotes the set of stopping times valued in [t,τ]. This is the
problem of maximizing the initial cost of replication. We will show that
there is in fact a stopping time τ∗
solving (26), and that the absence of8G. American Security Valuation 199
“non-pathological” arbitrages implies that the American security must sell
initially for V ∗
0 .
If V0 < V ∗
0 , then purchase of the American security for V0, adoption of a
rational exercise policy τ∗
, and replication of the payoff −U(τ∗
) at τ∗
at an
initial payoff of V ∗
0 , together generate a net initial profit of V ∗
0 − V0 > 0 and
no further cash flow. This is an arbitrage.
In order to rule out the other possibility, that V0 > V ∗
0 , we will exploit the
notion of a super-replicating trading strategy, a self-financing trading strategy
whose market-value process Y dominates the exercise-value process U, in that
Yt ≥ Ut for all t in [0,τ]. We will show the existence of a super-replicating
trading strategy with initial market value Y0 = V ∗
0 . If V0 > V ∗
0 , then sale of
the American security and adoption of a super-replicating strategy implies an
initialprofit of V0−V ∗
0 > 0 and the ability to cover the payment Uτ demanded
by the holder of the American security at exercise with the market value Yτ
of the super-replicating strategy, regardless of the exercise policy τ used by
the holder of the American security. This constitutes an arbitrage. Indeed,
then, the unique arbitrage-free American security price would be given by
(26). (We have implicitly extended the definition of an arbitrage slightly in
order to handle American securities.)
Let b U be the deflated exercise-value process, defined by
b Ut = exp
Z t
0
−rs ds

Ut.
Let W be the Snell envelope of b U under Q, meaning that
Wt = ess sup
τ∈T (t)
EQ
t (b Uτ), t ≤ τ, (27)
where, ess sup denotes essential supremum. (In other words, for all τ in T (t),
P(Wt ≥ EQ
t (b Uτ)) = 1, and if Ŵt is any other Ft-measurable random variable
satisfying P(Ŵt ≥ EQ
t (b Uτ)) = 1 for all τ in T (t), then P(Wt ≤ Ŵt) = 1.)
We recall from Chapter 6 that a trading strategy whose market-value
process is bounded below cannot take advantage of certain “pathological”
varieties of arbitrage, such as doubling strategies.
Proposition. There is a super-replicating trading strategy θ∗
whose market-
value process Y is bounded below, with inital market value Y0 = V ∗
0 . A
rational exercise policy is given by τ0
= inf{t : Yt = Ut}.200 Chapter 8. Derivative Pricing
Proof: Under the American Regularity Conditions, a source cited in the
Notes shows that the Snell envelope W of Û is a continuous supermartingale
under Q, and can therefore be decomposed in the form W = Z − A, where
Z is a Q-martingale and A is an increasing adapted process with A0 = 0.
(This was proved in a discrete-time setting in Chapter 2.) By Proposition 6I
and Numerarire Invariance, there is a self-financing trading strategy whose
market-value process Y has the final market value YT = Zτ exp
RT
τ
rt dt

and satisfies
Yt = EQ
t

exp
Z T
t
−rt dt

YT

.
A Q-martingale Ŷ is thus defined by Ŷt = Yt exp
Rt
0
−rs ds

. Because Z is
also a Q-martingale, for t ≤ τ we have
Yt = exp
Z t
0
rs ds

EQ
t

exp

−
Z T
0
rs ds

YT

= exp
Z t
0
rs ds

EQ
t [Z(τ)]
= exp
Z t
0
rs ds

Zt
= exp
Z t
0
rs ds

(Wt + At). (28)
Taking t = 0 in (28), we have Y0 = W0 = V ∗
0 , as asserted. From (28),
Yt ≥ exp
Z t
0
rs ds

Wt ≥ Ut, (29)
using the facts that At is nonnegative, the definition of b Ut, and the fact that
Wt ≥ b Ut. Thus the underlying trading strategy is super-replicating. Because
U is bounded below, (29) implies that the replicating market-value process
Y is bounded below. Moreover, τ0
is a rational exercise policy because
V ∗
0 = Y0 = EQ
"
exp
Z τ0
0
−rt dt
!
Y (τ0
)
#
= V τ0
0 ,
from noting that Ŷ is a Q-martingale and that Y (τ0
) = U(τ0
).8G. American Security Valuation 201
Putting the various pieces of the story together, the “arbitrage pricing”
result is summarized as follows. If the initialprice V0 of the American security
(U,τ) is strictly larger than
V ∗
0 = sup
τ∈T (0)
EQ

exp
Z τ
0
−r(s)ds

Uτ

, (30)
then an arbitrage consists of sale of the option and adoption of the super-
replicating trading strategy θ∗
until whatever exercise time τ chosen by the
option holder. Conversely, if V0 > V ∗
0 , then an arbitrage is made by pur-
chase of the option at time 0, exercise of the option at the rational time τ0
,
and adoption of the trading strategy −θ∗
until liquidation at τ0
. Neither
of these arbitrage strategies would be “pathological” because the market-
value process Y of the super-replicating stragegy is consistent with the given
equivalent martingale measure Q, and the position held in the American se-
curity is constant until exercise. Thus, the American regularity conditions
and complete markets are, in effect, sufficient for (30) to be the unique price
for the American security that keeps the markets for all securities free of
(pathological) arbitrage.
All of our assumptions are satisfied in the case of an American put in
the “Black-Scholes” setting, with a constant short rate r, and an underlying
price process S solving
dSt = rSt dt + σSt dǫS
t ; S0 = x, (31)
where ǫS
is a standard Brownian motion under Q. Thus, an American put
with exercise price K and expiration at time τ has the initial arbitrage-free
price
V ∗
0 = max
τ∈T (0)
EQ

e−rτ
(K − Sτ)+

. (32)
In Chapter 11 we review some numerical recipes for approximating this value.
There need not in fact be complete markets for our results to apply in this
simple setting, for even if the underlying Brownian motion is of dimension d >
1, the super-replicating strategy of the Proposition 8G can be constructed in
terms of the underlying security with price process S and with funds invested
at the short rate r, and has a market-value process Y that dominates the
exercise value (K −Sτ)+
at any stopping time τ, even a stopping time τ that
is determined by information not generated by the Brownian motion ǫS
of the
underlying price process S.202 Chapter 8. Derivative Pricing
By extending our arguments, we can handle an American security that
promises a cumulative-dividend process H until exercised at a stopping time
τ ≤ τ for a final payoff of Uτ. The same arguments applied previously lead
to an initial price of the American security (H,U,τ) given, under similar
technical regularity, by
V ∗
0 = sup
τ∈T (0)
EQ
Z τ
0
e
R s
0 −r(u)du
dHs + e
R τ
0 −r(u)du
Uτ

.
8H American Exercise Boundaries
We take the case of an American security (U,τ) with Ut = g(Xt,t), where
g : Rk
× [0,T] → R is continuous and X is state process in Rk
satisfying the
SDE (under the equivalent martingale measure Q)
dXt = a(Xt)dt + b(Xt)dBQ
t , (33)
for continuous functions a and b satisfying Lipschitz conditions. For simplic-
ity, we take the interest-rate process r to be zero, and later show that, aside
from technicalities, this is without loss of generality. We adopt the American
regularity conditions and again assume redundancy of the American security
for any exercise policy. Starting at time t with initial condition Xt = x for
(33), the arbitrage-free value is given by
h(x,t) ≡ sup
τ∈T (t)
EQ
t [g(Xτ,τ)]. (34)
By inspection, h ≥ g. From Proposition 8G, an optimal exercise policy
is given by
τ0
= inf{t ∈ [0,T] : h(Xt,t) = g(Xt,t)}. (35)
By (35), h(Xt,t) > g(Xt,t) for all t < τ0
. Letting
E = {(x,t) ∈ Rk
× [0,T] : h(x,t) = g(x,t)}, (36)
we can write τ0
= inf{t : (Xt,t) ∈ E}, and safely call E the exercise region,
and its complement
C = {(x,t) ∈ Rk
× [0,T) : h(x,t) > g(x,t)}8H. American Exercise Boundaries 203
the continuation region. In order to solve the optimal exercise problem, it is
enough to break Rk
×[0,T] into these two sets. An optimal policy is then to
exercise whenever (Xt,t) is in E, and otherwise to wait. Typically, solving
for the exercise region E is a formidable problem.
For a characterization of the solution in terms of the solution of a partial
differential equation, suppose that h is sufficiently smooth for an application
of Ito’s Formula. Then
h(Xt,t) = h(X0,0) +
Z t
0
Dh(Xs,s)ds +
Z t
0
hx(Xs,s)b(Xs)dBQ
s ,
where
Dh(x,t) = ht(x,t) + hx(x,t)a(x) +
1
2
tr

hxx(x,t)b(x)b(x)⊤

.
For any initial conditions (x,t) and any stopping time τ ≥ t, we know from
the definition of h that EQ
[h(Xτ,τ)] ≤ h(x,t). From this, it is natural to
conjecture that Dh(x,t) ≤ 0 for all (x,t). Moreover, from the fact that M is
a Q-martingale and Mt = h(Xt,t), t < τ0
, it is easy to see that Dh(x,t) = 0
for all (x,t) in C. We summarize these conjectured necessary conditions on
h, supressing the arguments (x,t) everywhere for brevity. On Rk
× [0,T)
h ≥ g, Dh ≤ 0, (h − g)(Dh) = 0. (37)
The last of these three conditions means that Dh = 0 wherever h > g,
and conversely that h = g wherever Dh < 0. Intuitively, this is a Bellman
condition prescribing a policy of not exercising so long as the expected rate
of change of the value function is not strictly negative. We also have the
boundary condition
h(x,T) = g(x,T), x ∈ Rk
. (38)
Under strong technical assumptions that can be found in sources cited in
the Notes, it turns out that these necessary conditions (37)–(38) are also
sufficient for h to be the value function. This characterization (37)–(38) of
the value function lends itself to a finite-difference algorithm for numerical
solution of the value function h.
In order to incorporate nonzero interest rates, suppose that the short-rate
process r can be written in the form rt = R(Xt) for some bounded R(·). By204 Chapter 8. Derivative Pricing
sample path of
underlying asset price (S)
underlying asset price
STRIKE
τ 0
T
exercise expiration
time
optimal exercise boundary (S ) ∗
Figure8.2: Optimal Exercise Boundary for American Put
similar arguments, the variational inequality (37)–(38) for the value function
h can then be written exactly as before, with the exception that Dh(x,t) is
replaced everywhere by Dh(x,t) − R(x)h(x,t).
For the special case of the American put with a constant short rate and
the constant-volatilityunderlying process S given by (31), a series of advances
cited in the Notes has led to the following characterization of the solution,
taking the state process X to be the underlying proce process S. Because
S is nonnegative, the continuation region C can be treated as a subset of
R+ ×[0,T). It turns out that there is an increasing continuously differentiable
function S : [0,T) → R, called the optimal exercise boundary, such that
C = {(x,t) : x > St}. Letting, ST = K, the optimal exercise policy τ∗
is
then to exercise when (and if) the stock price S “hits the optimal exercise
boundary,” as illustrated in Figure 8.2. That is, τ0
= inf{t : St = St}.
Unfortunately, there is no explicit solution available for the optimal stop-
ping boundary S. There are, however, numerical methods for estimating
the value function h and exercise boundary S. One is the simple algorithm
(3.23) for the “binomial” model, which as we see in Chapter 11 can be taken
as an approximation of the Black-Scholes model. The other is a direct finite-
difference numerical solution of the associated partial differential inequality8I. Lookback Options 205
(37)–(38), which in this case can be written, with the change of variables
from stock price x to its logarithm y = log(x): On R × [0,T),
h(y,t) − (K − ey
)+
≥ 0
Dh(y,t) − rh(y,t) ≤ 0 (39)

h(y,t) − (K − ey
)+

[Dh(y,t) − rh(y,t)] = 0,
with the boundary condition
h(y,T) = (K − ey
)+
, y ∈ R, (40)
where
Dh(y,t) = ht(y,t) +

r −
σ2
2

hy(y,t) +
σ2
2
hyy(y,t). (41)
Not all of the indicated derivatives of h may exist, but it turns out, from
sources cited in the Notes, that there is no essential difficulty in treating
(39)–(41) as written for computational purposes.
8I Lookback Options
Certain classes of derivative securities are said to be path dependent, in that
the payoff of the derivative security at a given time depends on the path
taken by the underlying asset price up until that time. An important and
illustrative class of examples is given by lookback options.
Consider the case of a sell-at-the-max option, with exercise date T, a
lookback option defined as follows. Let S be an Ito process defining the price
of a security, and let r be a bounded adapted short-rate process. For any
times t and s ≥ t, let S∗
t,s = max{Su : t ≤ u ≤ s} denote the maximum
level achieved by the security-price process between times t and s. This
particular option offers the right to sell the stock at time T for S∗
0,T . Of
course, S∗
0,T ≥ ST , so the option is always exercised for a payoff of S∗
0,T −ST .
Given an equivalent martingale measure Q, the market value of the option
at time t is then by definition
Vt = EQ
t

exp

−
Z T
t
rs ds

(S∗
0,T − ST )

. (42)
For the case of a log-normal security-price process satisfying (31) and
constant short interest rate r, a closed-form solution can be obtained for206 Chapter 8. Derivative Pricing
the lookback-option price process V . We know that St = S0 exp νt + σǫS
t

,
where ǫS
is a standard Brownian motion under Q and ν = r − σ2
/2. Thus
S∗
0,T = max(S∗
0,t,S∗
t,T )
= max

S∗
0,t,St exp(Zt,T )

, (43)
where
Zt,T = max
u∈[t,T]
ν(u − t) + σ(ǫS
u − ǫS
t ). (44)
The cumulative distribution function FT−t of Zt,T is known, based on sources
cited in the Notes, to be given by
Fτ(z) = 1 − Φ

z − ντ
σ
√
τ

+ e2νz/σ2
Φ

−z − ντ
σ
√
τ

, z > 0, (45)
where Φ is the standard normal cumulative distribution function. From (43),
EQ
t S∗
0,T

= FT−t(z∗
)S∗
0,t + [1 − FT−t(z∗
)]St
Z ∞
z∗
ez
F′
T−t(z)dz, (46)
where z∗
= log(S∗
0,t) − log(St).
Because there are no dividends, the payment of ST at T has a market
value at time t of St. From (42), we thus have
Vt = EQ
t e−r(T−t)
S∗
0,T

− St.
After computing the integral in (46), we have the lookback sell-at-the-max
put option price Vt = p(St,S∗
0,t;T − t), where
p(x,y;τ) = −xΦ(−D) + e−rτ
yΦ(−D + σ
√
τ)
+
σ2
2r
e−rτ
x
"
−

x
y
−2r/σ2
Φ

D −
2r
σ
√
τ

+ erτ
Φ(D)
#
,
and where
D =
1
σ
√
τ

log

x
y

+ rτ +
1
2
σ2
τ

.
The analogous arbitrage-free buy-at-the-min lookback price is also known
in closed form. This is the derivative paying ST − S∗,0,T at time T, where
S∗,t,s = min{Su : t ≤ u ≤ s}. (47)
Other varieties of path-dependent derivatives include8I. Lookback Options 207
• knock-outs, whose payoff is zero if the underlying asset price touches a
given boundary before expiration. (See Exercise 2.1)
• knock-ins, whose payoff is zero unless the underlying asset price touches
a given boundary before expiration.
• barrier derivatives, which payoff at the point in time at which a given
process, usually the underlying asset price, touches some boundary.
• asians, whose payoff depends on the average over time of the sample
path of the underlying asset price before expiration.
Path-dependent options are sometimes called exotic options, despite the fact
that some are commonplace in the market. Exotic options include, however,
a much wider variety of options that need not be path dependent. Some
relevant sources are indicated in the Notes.
Exercises
Exercise 8.1 Show by use of Girsanov’s Theorem that the futures-price
process Φ defined by (8) is an Ito process (under the original measure P).
Exercise 8.2 Verify (9) with Ito’s Formula.
Exercise 8.3 Show, as claimed in Section 8D, that if Φ is an Ito process
and Y is bounded and bounded away from zero, then
R
Y dΦ is a martingale
if and only if Φ is a martingale. Hint: Use the unique decomposition property
of Ito processes.
Exercise 8.4 Suppose there are three traded securities. Security 1 has the
price process X given by Xt = xexp(αt + β · Bt), where α ∈ R, β ∈ R2
, and
B is a standard Brownian motion in R2
. Security 2 has the price process Y
given by Yt = yexp(at + b · Bt), where a ∈ R, b ∈ R2
. Security 3 has the
price process ert
, where r is a constant. None of the securities pay dividends
during [0,T]. Consider a contract paying, at some time T > 0, either k units
of security 1 or one unit of security 2, whichever is preferred by the owner of
the contract at that time. Calculate the arbitrage-free price of that contract.208 Chapter 8. Derivative Pricing
Exercise 8.5 Consider the rolling spot futures contract, defined as follows.
The contract promises to pay, continually, changes in the spot price St of the
underlying asset as well as futures resettlement payments. That is, the rolling
spot futures-price process associated with the contract, say U, contractually
satisfies UT = ST , and the total gain for the contract between any two times
t and s ≥ t is Gs − Gt, where Gt = Ut + St. Show that, given the existence
of an equivalent martingale measure (which is essentially equivalent to no
arbitrage), the rolling spot futures-price process is given by Ut = 2Ft − St,
where Ft is the conventional futures price.
Exercise 8.6 Compute the value of the buy-at-the-min lookback option
defined in Section 8I under the same assumptions used to derive the price
(46) of the sell-at-the-max option.
Exercise 8.7 Consider an underlying asset price process S satisfying (31),
the log-normal model, and a futures option on the asset. That is, we let f be
the futures price for delivery of the underlying asset at time T, and consider
a security that pays (fτ − K)+
at some given time τ < T. Compute the
initial price of this futures option.
Exercise 8.8 Suppose the short-rate process r is given by the Cox-Ingersoll-
Ross model, defined in Section 7D. Compute the futures price and the for-
ward price that would apply at time zero for delivery at time τ < T of a zero-
coupon bond maturing at time T. Hint: For the futures price, conjecture the
form f(rt,t) = eα(t)+β(t)r(t)
, for t < τ, for time-dependent coefficients α and
β. You will determine an ordinary differential equation for β, with a bound-
ary condition at τ. Consider the change of variables given by b(t) = β(t)−1
.
Solve for b, then β, then α.
Exercise 8.9 (A Market-Timing Option Valuation Formula) Consider
an economy with a constant short rate of r, and a firm whose equity price
process is a geometric Brownian motion S. We assume, as usual, that for
given real parameters α and σ,
St = S0 exp(αt + σBt),
where B is a standard Brownian motion. A constant-proportional invest-
ment strategy is defined by the fraction b ∈ R of the value of a portfolio
of the riskless and risky securities that is invested in the risky asset, with8I. Lookback Options 209
rebalancing to maintain this fraction constantly over time. (We know, for
example, that under HARA utility and technical regularity, such a policy is
optimal.)
The wealth process W(b) associated with such a policy coefficient b, with
initial wealth W(b)0 = 1, is unambiguously defined for each b ∈ R.
If one had advance knowledge at time zero of the path of returns, {αt +
σBt : t ∈ [0,T]} taken by the underlying share price, one could take advan-
tage of this knowledge in choosing from among different available constant
proportional policies. Such an advanced-knowledge policy is defined by a
constant risky-investment fraction f that is an FT-measurable random vari-
able. Of course, we assume that such advance knowledge is not available.
Nevertheless, a broker-dealer decides to offer for a sale a derivative security
that pays off the value of the constant proportional investment strategy that
would have been chosen with advance knowledge. The broker-dealer calls
this a market-timing option. This market-timing option pays off W(b∗
)T at
a fixed time T, where, for each ω, the fraction b∗
(ω) solves, the problem
max
b∈[0,1]
W(b,ω)T.
The requirement that b be chosen in [0,1] means no short sales of either asset.
In other words, the broker-dealer will give the investor the payoff associated
with a constant proportional investment policy whose risky fraction is chosen
at time T after seeing what happened!
(A) Compute the market value of the market-timing option, assuming the
absence of arbitrage. In this setting, the type of arbitrage to rule out would be
in the form of a self-financing trading strategy θ ∈ H2
(S,e−rt
) for stock and
bank account, combined with a fixed position in the market timing option.
Show that there is no arbitrage at the price that you propose, and that there
is an arbitrage at any other price.
(B) Suppose that the broker-dealer offers to sell a market-timing option
with the one change being that the risky-asset proportion is not constrained
to [0,1], but is completely unconstrained. If there is a finite arbitrage-free
price for the market-timing option, compute it and show why, as above. If
not, show why not.
Exercise 8.10 (Gold Delivery Contract Pricing) The spot price pro-
cess S of gold is assumed to be a geometric Brownian motion with constant210 Chapter 8. Derivative Pricing
volatility parameter v. The interest rate is assumed to be a constant r ≥ 0.
We assume for simplicity that gold can be stored costlessly, and pays no div-
idends. That is, the usual assumptions underlying the Black-Scholes model
apply.
A gold-mining firm offers the following delivery contract to special cus-
tomers. For a price of p, set and paid on date 0, the customer receives the
right, but not the obligation, to buy n ounces of gold from the mining firm
on dates chosen by the customer between dates T > 0 and U > T, inclusive,
at the spot price ST set on date T. For each date t between T and U, the
decision of whether or not to purchase gold on date t at the price ST can
be made based on all information available on date t. At most k ounces
can be purchased per day. (Purchase decisions can be made at a fixed time,
say noon, each day, when the spot market for gold is open.) For notational
simplicity, you may assume that n/k is an integer and that U − T ≥ n/k.
(A) Provide, and justify, an explicit formula for the unique arbitrage-free
price p of the gold delivery contract. Suggestion: Reduce the difficulty of
this problem, in stages, to that of a problem that you know how to solve.
Don’t apply brute force. Provide your reasoning.
(B) For an extra fee of f, set and paid on date 0, the customer can elect on
a given date T0, between 0 and T, to double the size of the contract to 2n
ounces by making an additional payment of p on date T0. State explicitly
the arbitrage-free level of f. You may assume for notational simplicity that
U − T ≥ 2n/k.
Exercise 8.11 (Valuation of Options with Bankruptcy) For this exercise,
please refer to the appendix on counting processes. Suppose, in a given econ-
omy, that there is a constant short rate r. Consider a firm whose equity
price process is a geometric Brownian motion X, until bankruptcy. We as-
sume that there is an equivalent martingale measure Q (after normalization
of prices, as usual, by e−rt
) such that, for given real parameters α and σ, we
have
Xt = X0 exp(αt + σBQ
t ),
where BQ
is a standard Brownian motion under Q. Bankruptcy occurs with
“risk-neutralized” arrival intensity λ. That is, bankruptcy occurs at the
stopping time τ = inf{t : Nt = 1}, where, under Q, N is a Poisson process
with intensity λ, independent of BQ
. When bankruptcy occurs, the price of
the equity jumps to zero.8I. Lookback Options 211
(A) Compute the price of a European call option on the equity for expira-
tion at time T and for strike price K > 0. Hint: The point of the exercise is
that the firm may go bankrupt before expiration. The option pays off if the
firm does not go bankrupt, and if the price of the equity is above the strike.
(B) Compute the price of a European put option on the equity for expi-
ration at time T and for strike price K > 0, without using put-call parity.
Now show that put-call parity holds.
Exercise 8.12 For the Heston modelwith parameter vector (r,cSV ,κ,v,σv),
this exercise explores a variation on the transform solution method. For
h = 0.5 or h = −0.5, let Y (h)
solve the SDE
dY
(h)
t = (r + hVt) dt +
p
Vt dǫS
t ; Y
(h)
0 = logS0.
For each real number y and time t, let
gh,t(y) = P(Y
(h)
t ≥ y). (48)
(A) Show that the transform ĝh,t of gh,t(·) is given by
ĝh,t(z) = exp
h
C(t,z) + D(t,z)V0 + izY
(h)
0
i
, (49)
where
C(t,z) = rizt +
κv
σ2
v

(κ − cSV σvzi + ϕ)t − 2log

1 − ζetϕ
1 − ζ

D(t,z) =
κ − cSV σvi + ϕ
σ2
v
·

1 − etϕ
1 − ζetϕ

,
for
ζ =
κ − cSV σvzi + ϕ
κ − cSV σvzi − ϕ
,
with
ϕ =
p
(cSV σvzi − κ)2 − σ2
v(2hzi − z2).
(B) Provide the price of a call option on the underlying, expiring at time t
and struck at p, in terms of g0.5,t(·) and g−0.5,t(·). Hint: In order to compute212 Chapter 8. Derivative Pricing
G(y;t,b(t),−b(t)) of the option-pricing formula (18), consider treating the
underlying asset price process S as a numeraire.
(C) For the Heston model with parameters
(r,cSV ,κ,v,σv) = (0.05,−0.5,0.5,0.09,0.09),
let S0 = 100 and V0 = 0.09. Plot or tabulate (at least 10 points) the smile
curve (Black-Scholes implied volatilities) for European call options with ex-
piration at time t = 0.25. Now re-plot for the correlation parameter cSV = 0.
You may compute (20) with any convenient numerical-integration software.
Exercise 8.13 (Volatility Hedging) As we know from Chapter 5, the
implied-tree model has the property that an option can be replicated, and
therefore hedged, by a self-financing trading strategy involving the underly-
ing asset and funds invested at the short rate r. The stochastic-volatility
model does not generally have this property. Under regularity conditions,
however, one can replicate a given option with a self-financing trading strat-
egy involving the underlying asset, a different option, and funds invested at
the riskless rate r.
(A) To be specific, consider the model (11) for the underlying price pro-
cess S and (12) for the volatility process V , with correlation coefficient
cSV ∈ (0,1). Let Φt = f(St,Vt,t) and Γt = g(St,Vt,t) denote the prices
at time t of options for expiration at a future time τ, and different strike
prices p1 and p2, respectively. Suppose that f and g solve the PDEs sug-
gested by the Feynman-Kac approach. Suppose the short rate is a constant
r. Let θ = (a,b,c) denote a self-financing trading strategy in the price pro-
cess (St,Φt,ert
) that replicates the payoff of the option with strike p2 and
price process Γ. Solve for θt explicitly in terms of f and g and their partial
derivatives, making minimal assumptions.
(B) For the Heston model, with parameters
(r,cSV ,κ,v,σv) = (0.05,−0.5,0.5,0.09,0.09),
let S0 = 100, V0 = 0.09, and p1 = 100. Tabulate (or plot) estimates of the
initial replicating portfolio (a0,b0,c0) as the exercise price p2 of the option
to be replicated ranges from 60 to 150, showing at least 10 points. In order
to estimate partial derivatives, you may use either analytic methods (show
your work), or take the usual discretization approximation, under which, for
small ∆, we have F′
(x) ≃ [F(x + ∆) − F(x − ∆)]/2∆.8I. Lookback Options 213
Exercise 8.14 (Option Valuation in an Affine Term-Structure Model)
This problem shows how to calculate the prices of options on bonds in
a setting with affine state dynamics. We start slightly differently than in
Section 7I by beginning with the behavior of the state process X, not under
an equivalent martingale measure Q, but rather under the originally given
measure P, assuming that X solves a stochastic differential equation of the
form
dXt = [KP
0 + KP
1 Xt]dt + σ(Xt)dBt, X0 ∈ D ⊂ Rk
, (50)
where B is a standard Brownian motion in Rd
under P, and σ satisfies (25).
We assume additional conditions on the coefficients KP
= (KP
0 ,KP
1 ) and
H = (H0ij,H1ij) that ensure existence of a unique solution X to (50) in
the state space D defined by (26). You may assume for simplicity that D
contains an open set.
(A) The state-price deflator π for the given economy is assumed to be the
process π defined by πt = exp(X
(1)
t ), the exponential of the first co-ordinate
of the state process X = (X(1)
,...,X(k)
)⊤
. This implies that the short-rate
process r is defined by rt = ρ0 + ρ1 · Xt for some ρ0 ∈ R and ρ1 ∈ Rk
.
Compute ρ0 and ρ1.
(B) The price at time t of a zero-coupon bond maturing at a given time
s ≥ t is by definition of π given by f(Xt,t,s) = Et(πs)/πt. Extending
the ideas in Section 7I, conjecture the ordinary differential equation (ODE)
solved by some a : [0,s] → R and b : [0,s] → Rk
such that f(x,t,s) =
exp[a(s−t)+b(s−t)·x]. Do not forget to provide boundary conditions. This
sort of ordinary differential equation (which we shall see again below) is easy
to solve numerically, provided a solution exists (which we assume). Perform
a verification of your candidate solution for f under technical integrability
conditions provided by you. Hint: If an Ito process is a martingale, its drift
process must be zero.
(C) Suppose there are n > 0 such zero-coupon bonds available for trade,
with maturity dates T1,T2,...,Tn. Provide a spanning condition under
which, in principle, an additional security with payoff at some time T given
by a bounded FT -measurable random variable Z is redundant, given the op-
portunity to trade the n bonds and to borrow or lend continuously at the
short rate r? Develop notation as you need it.
(D) We are now interested in pricing a zero-coupon bond option that pro-
vides the opportunity, but not the obligation, to sell at time τ for a given214 Chapter 8. Derivative Pricing
price p > 0 the zero-coupon bond maturing at a given time s > τ (paying
one unit of account at maturity). The option is in the money at expira-
tion if and only if exp[a(s − τ) + b(s − τ) · Xτ] ≤ p, which is the event A
that b(s − τ) · Xτ ≤ logp − a(s − τ). It can be seen under integrability
conditions that the price of the option at time 0 is therefore of the form
c1Q1(A) − c2Q2(A), for some coefficients c1 and c2 and some probability
measures Q1 and Q2 equivalent to P. Provide the integrability conditions,
the Radon-Nikodym derivatives of Q1 and Q2 with respect to P, and the
definitions of c1 and c2. These coefficients should be easily obtained from
knowledge of the initial term structure of interest rates. Why?
(E) For each i ∈ {1,2}, the density process ξi of Qi can be shown (un-
der technical integrability conditions) to be of the form ξi(t) = exp[αi(t) +
βi(t) · Xt], for αi and βi solving ordinary differential equations. Provide
these ordinary differential equations, their boundary equations, and techni-
cal integrability conditions justifying this solution. How would you find the
coefficient c1?
(F) Under Qi, for each i ∈ {1,2}, provide a new stochastic differential equa-
tion for the state-vector process X driven by a standard Brownian motion
BQ(i)
in Rd
under Qi. Define BQ(i)
.
(G) By virtue of the previous steps, you have shown that the bond option
price can be easily computed if one can compute any probability of the form
Qi(γ · XT ≤ y), for any γ ∈ Rd
. One can compute P(Z ≤ z), for a given
random variable Z and number z, if one knows the characteristic function
ψ : R → R of Z, defined by ψ(u) = E[exp(iuZ)], where i =
√
−1 is the usual
imaginary number. Thus, option pricing in this setting can be reduced to
the calculation of the characteristic function (sometimes called the Fourier
transform — the Fourier transform and the characteristic function are iden-
tical up to a scalar multiple) of Z = γ · XT under Q1 and Q2. Based on
the results of Section 8F, we conjecture that, fixing u and d, and defining
ψ(Xt,t) = Et [exp(iud · XT )], we have
ψ(x,t) = exp[α(t) + β(t) · x],
where α and β are complex-valued coefficient functions that solve ordinary
differential equations (ODEs). Taking as given the time-dependent coeff-
cients (K(t),H(t)) for X appropriate to the probability measure at hand,
your task is now to provide these ODEs for α and β, with their boundary8I. Lookback Options 215
conditions, and to confirm the conjecture under integrability conditions pro-
vided by you that will arise as you verify your solution with Ito’s Formula.
Hint: Remember that ψ(x,t) is a complex number, and apply Ito’s Formula
to get the drift (both the real and imaginary parts). You will see a restriction
on the drift that will give you the desired ODEs. Express the ODEs as tidily
as possible. Note: In practice, at this point, you would compute the solutions
of the differential equation for each u, separately (there are tricks that can
speed this up), and from the resulting characteristic function, numerically
compute the needed numbers c1, c2, Q1(A) and Q2(A).
Notes
The relationship between forwards and futures in Sections 8B, 8C, and 8D
was developed by Cox, Ingersoll, and Ross [981b]. The derivation given here
for the martingale property (8) of futures prices is original, although the for-
mula itself is due to Cox, Ingersoll, and Ross (1981b), as is the subsequent
replication strategy. For additional work in this vein, see Bick [1994], Dezh-
bakhsh [1994], Duffie and Stanton [1988], and Myneni [992b]. An explicit
Gaussian example is given by Jamshidian [993b] and Jamshidian and Fein
[1990]. Grinblatt and Jegadeesh [1993] derived the futures prices for bonds
in the setting of a Cox-Ingersoll-Ross model of the term structure. Grauer
and Litzenberger [1979] give an example of the equilibrium determination of
commodity forward prices. Carr [1989] provides option-valuation models for
assets with stochastic dividends, in terms of the stochastic model for forward
prices on the underlying asset. Carr and Chen [1993] treat the valuation of
the cheapest-to-deliver option in Treasury Bond futures, sometimes called the
quality option, and the associated problem of determining the futures price.
For the related wildcard option, see Fleming and Whaley [1994]. ?] treat
the case of complex options.
Black [1976] showed how to extend the Black-Scholes option-pricing for-
mula to the case of futures options. See, also, Bick [1988]. Carr [1993] and
Hemler [1987] value the option to deliver various grades of the underlying
asset against the futures contract. This problem is related to that of valu-
ing compound options, and options on the maximum or minimum of several
assets, which was solved (in the Black-Scholes setting) by Geske [1979], John-
son [1987], Margrabe [1978], Selby and Hodges [1987], and Stulz [1982]. On
put-call parity and symmetry, see Carr [993b].
McKean [1965], Merton [1973], Harrison and Kreps [1979], and Bensous-
san [1984] did important early work on American option pricing. Proposition216 Chapter 8. Derivative Pricing
8G is from Karatzas [1988], although his technical conditions are slightly dif-
ferent. Karatzas defines the fair price of an American security, which turns
out to be equal to the arbitrage-free price when both exist, and also extends
Merton’s analysis of perpetual options, those with no expiration. Jaillet,
Lamberton, and Lapeyre [1988] and Jaillet, Lamberton, and Lapeyre [1990]
review the treatment of the optimal stopping valuation problem as a vari-
ational inequality, which can be written in the form (20)–(21). A decom-
position of the American option in terms of an early exercise premium (19)
was proposed in a collection of papers by Jamshidian [989c], Jacka [1991],
Kim [1990], and Carr, Jarrow, and Myneni [1992], working from McKean’s
(1965) formulation of the free boundary problem, sometimes called a Stefan
problem. Moerbeke [1976] was the first to demonstrate, among other results,
that the optimal stopping boundary S∗
is continuously differentiable. In this
regard, see also Ait-Sahlia [1995]. Jorgensen [994a] and Myneni [992a] survey
this and other literature on American put option pricing in the Black-Scholes
setting. Approximate solutions to the American option price are given by
Allegretto, Barone-Adesi, and Elliott [1993], Broadie and Detemple [993a],
Carr [1994], Geske and Johnson [1984], Gandhi, Kooros, and Salkin [993a],
and Barone-Adesi and Elliott [1991] (who cite related literature). The behav-
ior of the optimal exercise boundary near expiration is treated by Ait-Sahlia
[1995], Barles, Burdeau, Romano, and Samsoen [1993], Lamberton [1993],
and Charretour, Elliott, Myneni, and Viswanathan [1992]. Option pricing
in a jump-diffusion setting was originated by Merton [1976], and more re-
cently treated by Amin [993a], ?], and Zhang [1994]. de Matos [1993] gives
a method-of-simulated-moments estimation technique for American options.
Yu [1993] provides additional results on American option valuation. Broadie
and Detemple [993b] and Broadie and Detemple [1995] provide pricing for
American capped call options, and for options on multiple assets.
Term-structure models such as those applied in Chapter 7 have been
applied to commodity option valuation by Jamshidian [991b] and Jamshidian
(1993b). The sell-at-the-max and buy-at-the-min lookback option valuation
is from Goldman, Sosin, and Gatto [1979]. The particular representation
of the sell-at-the-max put formula is copied from Conze and Viswanathan
[991b]. The distribution of the maximum of a Brownian motion path between
two dates, and related results on the distribution of first passage times, can
be found in Chuang [1994], Dassios [1994], Harrison [1985], and Ricciardi
and Sato [1988]. For other lookback option valuation results, see Conze and
Viswanathan (1991b), Duffie and Harrison [1993], and Shepp and Shiryaev8I. Lookback Options 217
[1993]. The asian option, based on an arithmetic average of the underlying
price process, is analyzed by Geman and Yor [1993], Oliveira [1994], Rogers
and Shi [1994], and Yor [1991]. Akahari [1993], Miura [1992], and Yor [1993]
treat the related problem of median-price options.
The hedging of asian and lookback options is analysed by Kat [993b]. For
hedging under leverage constraints, see Naik and Uppal [1992]. For hedging
with a “minimax” criterion, see Howe and Rustem [994a] and Howe and
Rustem [994b].
Forms of barrier options, which are variously known as knockouts, knock-
ins, down-and-outs, up-and-ins, limited-risk options, and lock-in options are
covered by Carr and Ellis [1994], Conze and Viswanathan (1991b), Merton
(1973b), and Yu (1993). On approximation methods for anlaysing path-
dependent options, see Kind, Liptser, and Runggaldier [1991].
Beckers (1981) promoted the idea of using implied volatility, as measured
by options prices. A generalized version of implied volatility is discussed by
Bick and Reisman [1993]. Cherian and Jarrow [1993] explore a related “ra-
tionality” issue. Option pricing with stochastic volatility was proposed as an
answer to the “smile curve,” and analyzed, by Hull and White [1987], Scott
[1987], ?], and Wiggins [1987], and since has been addressed by Amin [993b],
Amin and Ng [1993], Ball and Roma [1994], Barles, Romano, and Touzi
[1993], Duan [1995], Heston [1993], Hofmann, Platen, and Schweizer [1992],
Lu and Yu [1993], Platen and Schweizer [1994], Renault and Touzi [992a], Re-
nault and Touzi [992b], Touzi [1993], and Touzi [1995]. Renault and Touzi
(1992b) consider the econometric use of option price data in this setting.
Amin and Jarrow [1993] treat the problem of option valuation with stochas-
tic interest rates, in a Heath-Jarrow-Morton setting. Melino and Turnbull
[1990] illustrate an application to foreign exchange option pricing. Heynen
and Kat [1993] and Heynen, Kemna, and Vorst [1994] provide formulas for
prediction of volatility in a Markovian setting. Nelson [1990], Nelson [1991],
and Nelson [1992] treat the convergence of ARCH, GARCH, and EGARCH
models to stochastic volatility models of the style considered in Section 8E,
as well as related issues. Bollerslev, Chou, and Kroner [1992] and Taylor
[1994] survey applications in finance for ARCH and ARCH-related models,
originated by Engle [1982]. ?], Harvey and Shephard [1993], and ?] present
related econometric techniques and results. Hobson and Rogers [1993] de-
scribe a model for endogenous stochastic volatility. Proposition 8E can be
deduced from results in Karatzas and Shreve [1988].
The literature on stochastic volatility and option pricing is often linked218 Chapter 8. Derivative Pricing
with the extensive body of available work on econometric models of auto-
regressive conditional heteroskedasticity (ARCH), and its extensions and vari-
ants, GARCH and EGARCH defined in sources cited in the Notes. It has
been shown, for example, that typical discrete-time models of heteroskedas-
ticity, including certain ARCH and EGARCH models, converge in a natural
way with time periods of shrinking length to the continuous-time stochastic
volatility model in which vt = logVt is well defined and satisfies the Ornstein-
Uhlenbeck stochastic differential equation
dvt = (a + bvt)dt + cdζt, (43)
where a, b, and c are coefficients that can be estimated from historical obser-
vations of the underlying asset-price process. As (43) is a linear stochastic
differential equation, we know from Appendix E that its solution is a Gaus-
sian process (under Q). One must bear in mind, especially for econometric
applications, that our analysis has been under an equivalent martingale mea-
sure. In order to draw econometric implications, one may also wish to char-
acterize the behavior of stochastic volatility under the original probability
measure P. For example, one can adopt parametric assumptions regarding
the market price of risk.
Attempts have also been made to extend the econometric model to include
observations on option prices in the data set used to estimate the parameters
of the stochastic volatility process. In principal, use of options data should
improve the econometric efficiency of the estimation, given the one-to-one
relationship between vt and a given option price at time t that follows from
the proposition above.
Derman and Kani [1994], Dupire [1992], Dupire [1994], and Rubinstein
[1995] also construct implied-tree models of option pricing.
Nielsen and Saá-Requejo [1992] provide an example of a foreign exchange
option-valuation model.
The results of Section 8F are based on Duffie, Pan, and Singleton [1997],
which builds on the seminal work on transform-based option pricing by ?]
and Heston [1993], as well as subsequent work by Bakshi, Cao, and Chen
[1997], ?], and ?].
The hedging coefficients, “delta,” “gamma,” and so on, associated with
derivative securities are studied by Carr [1991]. On option pricing with trans-
actions costs and constraints, see references cited in the Notes of Chapter 6.
Johnson and Shanno [1987] and Rich [1993] deal with the impact of default8I. Lookback Options 219
risk on the Black-Scholes approach. Brennan and Schwartz [980b] present a
model for the valuation of convertible bonds.
General reviews of options, futures, or other derivative markets include
those of Cox and Rubinstein [1985], Daigler [1993], Duffie [1989], Hull [1993],
Jarrow and Rudd [1983], Rubinstein [1992], Siegel and Siegel [1990], and Stoll
and Whaley [1993]. For computational issues, see Chapter 11, or Wilmott,
Dewynne, and Howison [1993]. Dixit and Pindyck [1993] is a thorough treat-
ment, with references, of the modeling of real options, which arise in the
theory of production planning and capital budgeting under uncertainty.
The problem of valuing futures options, as considered in Exercise 8.7,
was addressed and solved by Black (1976). The forward and futures prices
for bonds in the Cox-Ingersoll-Ross model, addressed in Exercise 8.8, are
found in Grinblatt [1994]. A related problem, examined by Carr [1989], is
the valuation of options when carrying costs are unknown. The definition
and pricing result for the market-timing option is from ?]. Gerber and Shiu
[1994] describe a computational approach to option pricing based on the
Escher transform.
Bossaerts and Hillion[1994]115 Kat [993a]116 Ait-Sahliaand Lai[1998]117
Ait-Sahalia and Lai [997a]118 Ait-Sahalia and Lai [997b]119 Amin and Mor-
ton [1994b]120 Amin and Morton [1994a]121 Andersen [1995]122 Andersen,
Andreasen, and Brotherton-Ratcliffe [1997]123 Andersen and Brotherton-
Ratcliffe[1995]124 Bakshi and Madan [1997b]125 Bakshi and Madan [1997a]126
Ball and Torous [1985]127 Barles, Burdeau, Romano, and Samsoen [1995]128
Barles and Soner [1996]129 Basak and Cuoco [995b]130 Bates [1996]131 Bates
[1994]132 Bates [995a]133 Beckers [1981]134 Beibel and Lerche [1997]135
Beibel and Lerche [1995]136 Bensoussan, Crouhy, and Galai [995a]137 Ben-
soussan, Crouhy, and Galai [995b]138 Bergman [985a]139 Bergman, Grundy,
and Wiener [1996]140 Bick [1997]141 Bottazzi and Hueffmann [1999]142
Buckdahn and Hu [995b]143 Carr [1995]144 Carr and Faguet [1996]145 Ches-
ney, Jeanblanc, and Yor [1994]146 Corradi [1997]147 Davydov and Linet-
sky [1998]148 Décamps and Koehl [1994]149 Eberlein, Keller, and Prause
[1998]150 Karoui, Jeanblanc, and Shreve [1995]151 Flesaker [1991]152 Frey
[1996]153 Frey and Sin [1997]154 Ghysels, Gourieroux, and Jasiak [1995]155
Ghysels, Harvey, and Renault [1995]156 Goncalves and Souza [1996]157 Grabbe
[1983]158 Gukhal [995a]159 Gukhal [995b]160 Harvey, Ruiz, and Shephard
[1994]161 Haug [1999]162 He and Takahashi [1995]163 Heston [1997]164 He-
ston and Nandi [1997]165 Hobson [1995]166 Hobson and Rogers [1995]167
Huang, Subrahmanyam, and Yu [1995]168 Jackwerth [996a]169 Jackwerth220 Chapter 8. Derivative Pricing
and Rubinstein [1996b]170 Jackwerth and Rubinstein [1996a]171 Jackwerth
and Rubinstein [1996c]172 Jakubenas [1999]173 Jamshidian [1997]174 John-
son and Stulz [1987]175 Jorion [1988]176 Ju [997a]177 Ju [997b]178 Kusuoka
[996a]179 Lagnado and Osher [1996]180 Lai [1995]181 Lamoureux and Las-
trapes [1993]182 ?] Linetsky [1996]183 Linetsky [1997]184 Lyons [1995]185
Ma and Cvitanić [1996]186 Ma and Yong [1997]187 Madan and Chang [1995]188
Madan and Chang [1996]189 ?] Maghsoodi [1998]190 Nelson [1993]191 Or-
dentlich and Cover [1996]192 Pappalardo [1996]193 Pham [1995]194 Pikovsky
and Shreve [996a]195 Rady [1995]196 Rady [1996]197 Redekop [1995]198 Re-
dekop and Fisher [1995]199 Romano and Touzi [1997]200 Sbuelz [1998]201
Schroder [1999]202 Schröder [1999]203 Schröder [1999]204 Schwartz [1997]205
Scott [1992]206 Scott [1997]207 Stutzer [1996]208 Subramanian [1997]209
Toft and Brown [1996]210 Topper [1998]211 Zhou [1997]212 Zou and Der-
man [1996]213Chapter 9
Portfolio and Consumption
Choice
THIS CHAPTER PRESENTS basic results on optimal portfolio and con-
sumption choice, first using dynamic programming, then using general mar-
tingaleand utility-gradientmethods. We begin with a review of the Hamilton-
Jacobi-Bellman equation for stochastic control, and then apply it to Merton’s
problem of optimal consumption and portfolio choice in finite- and infinite-
horizon settings. Then, exploiting the properties of equivalent martingale
measures from Chapter 6, Merton’s problem is solved once again in a non-
Markovian setting. Finally, we turn to the general utility-gradient approach
from Chapter 2, and show that it coincides with the approach of equivalent
martingale measures.
9A Stochastic Control
Dynamic programming in continuous time is often called stochastic con-
trol and uses the same basic ideas applied in the discrete-time setting of
Chapter 3. The existence of well-behaved solutions in a continuous-time set-
ting is a delicate matter, however, and we shall focus mainly on necessary
conditions. This helps us to conjecture a solution that, if correct, can often
be easily validated.
Given is a standard Brownian motion B = (B1
,...,Bd
) in Rd
on a prob-
ability space (Ω,F,P). We fix the standard filtration F = {Ft : t ≥ 0} of B
and begin with the time horizon [0,T ] for some finite T > 0. The primitive222 Chapter 9. Portfolio and Consumption Choice
objects of a stochastic control problem are
• a set A ⊂ Rm
of actions.
• a set Y ⊂ RK
of states.
• a set C of A-valued adapted processes, called controls.
• a controlled drift function g : A × Y → RK
.
• a controlled diffusion function h : A × Y → RK×d
.
• a running reward function f : A × Y × [0,T ] → R.
• a terminal reward function F : Y → R.
The K-dimensional set Y of states of the problem is not to be confused with
the underlying set Ω of “states of the world.” A control c in C is admissible
given an initial state y in Y if there is a unique Ito process Y c
valued in Y
with
dY c
t = g(ct,Y c
t )dt + h(ct,Y c
t )dBt; Y c
0 = y. (1)
For this, there are of course technical conditions required of c, g, and h.
Let Ca(y) denote the set of admissible controls given initial state y. We
assume that the primitives (A,Y,C,g,h,f,F) are such that, given any initial
state y ∈ Y, the utility of any admissible control c is well defined as
V c
(y) = E
Z T
0
f(ct,Y c
t ,t)dt + F(Y c
T )

,
which we allow to take the values −∞ or +∞. The value of an initial state
y in Y is then
V (y) = sup
c∈Ca(y)
V c
(y), (2)
with V (y) = −∞ if there is no admissible control given initial state y. If
V c
(y) = V (y), then c is an optimal control at y. (One may note that this fo-
rumulation allows for the possibility that an optimal control achieves infinite
utility.)
One usually proceeds by conjecturing that V (y) = J(y,0) for some J in
C2,1
(Y × [0,T]) that solves the Bellman equation:
sup
a∈A
{Da
J(y,t) + f(a,y,t)} = 0, (y,t) ∈ (Y,[0,T)), (3)9A. Stochastic Control 223
where
Da
J(y,t) = Jy(y,t)g(a,y) + Jt(y,t) +
1
2
tr

h(a,y)h(a,y)⊤
Jyy(y,t)

,
with the boundary condition
J(y,T) = F(y), y ∈ Y. (4)
An intuitive justification of (3) is obtained from an analogous discrete-
time, discrete-state, discrete-action setting, in which the Bellman equation
would be something like
J(y,t) = max
a∈A

f(a,y,t) + E

J(Y c
t+1,t + 1) | Y c
t = y, ct = a

,
where f(a,y,t) is the running reward per unit of time. (The reader is invited
to apply imagination liberally here. A complete development and rigorous
justification of this analogy goes well beyond the goal of illustrating the idea.
Sources that give such a justification are cited in the Notes.) For any given
control process c, this discrete-time Bellman equation implies that
Et

J(Y c
t+1,t + 1) − J(Y c
t ,t)

+ f(ct,Y c
t ,t) ≤ 0,
which, for a model with intervals of length ∆t, may be rewritten
Et

J(Y c
t+∆t,t + ∆t) − J(Y c
t ,t)

+ f(ct,Y c
t ,t)∆t ≤ 0.
Now, returning to the continuous-time setting, dividing the last equation by
∆t, and taking limits as ∆t → 0 leaves, under technical conditions described
in Chapter 5,
d
ds
Et [J(Y c
s ,s)]|s=t+
+ f(ct,Y c
t ,t) = Dc(t)
J(Y c
t ,t) + f(ct,Y c
t ,t) ≤ 0,
with equality if ct attains the supremum in the discrete version of the Bellman
equation. This leads, again only by this incomplete heuristic argument, to
the Bellman equation (3).
The continuous-time Bellman equation (3) is often called the Hamilton-
Jacobi-Bellman (HJB) equation. One may think of J(y,t) as the optimal
utility remaining at time t in state y. Given a solution J to (3)–(4), suppose
that a measurable function C : Y × [0,T] → A is defined so that for each224 Chapter 9. Portfolio and Consumption Choice
(y,t), the action C(y,t) solves (3). The intuitive idea is that if the time is t
and the state is y, then the optimal action is C(y,t). In order to verify the
optimality of choosing actions in this manner for the original problem (2),
we turn this feedback form of control policy function C into a control in the
sense of problem (2), that is, a process in the set C. For this, suppose that
there is a Y-valued solution Y ∗
to the stochastic differential equation (SDE)
dY ∗
t = g[C(Y ∗
t ,t),Y ∗
t ]dt + h[C(Y ∗
t ,t),Y ∗
t ]dBt; Y ∗
0 = y.
Conditions on the primitives of the problem sufficient for the existence of a
unique solution Y ∗
to this SDE are often difficult to formulate because C
depends on J, which is not usually an explicit function. Sources indicated
in the Notes address this existence issue. Given Y ∗
, we can conjecture that
an optimal control c∗
is given by c∗
t = C(Y ∗
t ,t), and attempt to verify this
conjecture as follows. Let c ∈ Ca(y) be an arbitrary admissible control. We
want to show that V c∗
(y) ≥ V c
(y). By (3),
Dc(t)
J(Y c
t ,t) + f(ct,Y c
t ,t) ≤ 0, t ∈ [0,T ]. (5)
By Ito’s Formula,
J(Y c
T ,T) = J(y,0) +
Z T
0
Dc(t)
J(Y c
t ,t)dt +
Z T
0
βt dBt, (6)
where βt = Jy(Y c
t ,t)h(ct,Y c
t ), t ∈ [0,T). Supposing that the local martingale R
β dB is in fact a martingale (which is usually verified on a problem-by-
problembasis or circumvented by special tricks), we know that E(
RT
0
βt dBt) =
0. We can then take the expectation of each side of (6) and use the boundary
condition (4) and inequality (5) to see that
V c
(y) = E
Z T
0
f(ct,Y c
t ,t)dt + F(Y c
T )

≤ J(y,0). (7)
The same calculation applies with c = c∗
, except that the inequalities in
(5) and (7) may be replaced with equalities, implying that
J(y,0) = V c∗
(y). (8)
Then (7) and (8) imply that V (y) = J(y,0), and that c∗
is indeed optimal.9B. Merton’s Problem 225
This is only a sketch of the general approach, with several assumptions
made along the way. These assumptions can be replaced by strong techni-
cal regularity conditions on the primitives (A,Y,C,g,h,f,F), but the known
general conditions are too restrictive for most applications in finance. In-
stead, one typically uses the Bellman equation (3)–(4) as a means of guessing
an explicit solution that, if correct, can often be validated by some variation
of the above procedure. In some cases, the Bellman equation can also be
used as the basis for a finite-difference numerical solution, as indicated in
sources cited in Chapter 11.
9B Merton’s Problem
We now apply the stochastic control approach to the solution of a “classic”
optimal-consumption and investment problem in continuous time.
Suppose X = (X(0)
,X(1)
,...,X(N)
) is an Ito process in RN+1
for the
prices of N + 1 securities. For each i ≥ 1, we assume that
dX
(i)
t = µiX
(i)
t dt + X
(i)
t σ(i)
dBt; X
(i)
0 > 0, (9)
where σi
is the i-th row of a matrix σ in RN×d
with linearly independent rows,
and where µi is a constant. This implies, in particular, that each process X(i)
is a geometric Brownian motion of the sort used in the Black-Scholes model
of option pricing. We suppose that σ(0)
= 0, so that r = µ0 is the short rate.
Utility is defined over the space D of consumption pairs (c,Z), where c is
an adapted nonnegative consumption-rate process with
R T
0
ct dt < ∞ almost
surely and Z is an FT -measurable nonnegative random variable describing
terminal lump-sum consumption. Specifically, U : D → R is defined by
U(c,Z) = E
Z T
0
u(ct,t)dt + F(Z)

, (10)
where
• F : R+ → R is increasing and concave with F(0) = 0;
• u : R+ × [0,T] → R is continuous and, for each t in [0,T], u(·,t) :
R+ → R is increasing and concave, with u(0,t) = 0;
• F is strictly concave or zero, or for each t in [0,T ], u(·,t) is strictly
concave or zero.226 Chapter 9. Portfolio and Consumption Choice
• At least one of u and F is non-zero.
A trading strategy is a process θ = (θ(0)
,...,θ(N)
) in L(X). (As defined
in Chapter 5, this means merely that the stochastic integral
R
θdX exists.)
Given an initial wealth w > 0, we say that (c,Z,θ) is budget-feasible, denoted
(c,Z,θ) ∈ Λ(w), if (c,Z) is a consumption choice in D and θ ∈ L(X) is a
trading strategy satisfying
θt · Xt = w +
Z t
0
θs dXs −
Z t
0
cs ds ≥ 0, t ∈ [0,T ], (11)
and
θT · XT ≥ Z. (12)
The first restriction (11) is that the current market value θt ·Xt of the trading
strategy is non-negative and equal to its initial value w, plus any gains from
security trade, less the cumulative consumption to date. The nonnegative
wealth restriction can be viewed as a credit constraint, as in Section 6C.
The second restriction (12) is that the terminal portfolio value is sufficient to
cover the terminal consumption. We now have the problem, for each initial
wealth w,
sup
(c,Z,θ)∈Λ(w)
U(c,Z). (13)
In order to convert this problem statement (13) into one that is more
easily addressed within the stochastic-control formulation set up in Section
9A, we represent trading strategies in terms of the fractions ϕ(1)
,...,ϕ(N)
of total wealth held in the “risky” securities, those with price processes
X(1)
,...,X(N)
, respectively. Because wealth is restricted to be nonnega-
tive, this involves no loss of generality. That is, for a given trading strategy
θ in the original sense, we can let
ϕ
(n)
t =
θ
(n)
t X
(n)
t
θt · Xt
, θt · Xt 6= 0, (14)
with ϕ
(n)
t = 0 if θt · Xt = 0.
Problem (13) is converted into a standard control problem of the variety
in Section 9A by first defining a state process. Using portfolio fractions to
define trading strategies allows one to leave the security price process X out
of the definition of the state process for the control problem. Instead, we9B. Merton’s Problem 227
can define a one-dimensional state process W for the investor’s total wealth.
As a notational convenience, we let λ ∈ RN
denote the vector in RN
with
λi = µi − r, the “excess expected rate of return” on security i. Given a
consumption process c and an adapted process ϕ = (ϕ(1)
,...,ϕ(N)
) defining
fractions of total wealth held in the risky securities, we can pose the question
of existence of a nonnegative Ito process for wealth W satisfying
dWt = [Wt(ϕt · λ + r) − ct]dt + Wtϕ⊤
t σ dBt; W0 = w. (15)
One may notice that in order for W to remain nonnegative, an admissible
control (c,ϕ) has the property that ϕt = 0 and Wt = ct = 0 for t larger than
the stopping time inf{s : Ws = 0}. Thus nonzero investment or consumption
are ruled out once there is no remaining wealth.
The control problem associated with (13) is thus fixed by defining the
primitives (A,Y,C,g,h,f,F) as follows:
• A = R+ ×RN
, with typical element (c, ϕ) representing the current con-
sumption rate c and the fractions ϕ1,...,ϕN of current wealth invested
in the risky securities.
• Y = R+, with typical element w representing current wealth.
• C is the set of adapted processes (c,ϕ) valued in R+ and RN
, respec-
tively, with
R T
0
ct dt < ∞ almost surely and
RT
0
ϕt · ϕt dt < ∞ almost
surely.
• g[(c,ϕ),w] = wϕ · λ + rw − c.
• h[(c,ϕ),w] = wϕ⊤
σ.
• f[(c,ϕ),w,t] = u(c,t), where u is as given by (10).
• F(w) is as given by (10).
An admissible control given initial wealth w is a control (c,ϕ) in C for which
there is a unique nonnegative Ito process W satisfying (16).
The control problem (A,Y,C,g,h,f,F) is equivalent to the original prob-
lem (13), with the small exception that the control formulation forces the in-
vestor to consume all terminal wealth, whereas the original budget constraint
(12) allows the investor to leave some terminal wealth unconsumed. Because228 Chapter 9. Portfolio and Consumption Choice
the terminal utility function F is increasing, however, this distinction is not
important. Indeed, one can see that (c,Z,θ) is in Λ(w) if and only if the
wealth process {Wt = θt · Xt : t ∈ [0,T ]} is non-negative, satisfies (16), and
WT ≥ Z, where ϕ is defined from θ by (15).
9C Solution to Merton’s Problem
The Bellman equation (3) for Merton’s problem, at a current level w > 0 of
wealth, is
sup
(c,ϕ)∈A

Dc,ϕ
J(w,t) + u(c,t) = 0, (16)
where
Dc,ϕ
J(w,t) = Jw(w,t)(wϕ · λ + rw − c) + Jt(w,t) +
w2
2
ϕ⊤
σσ⊤
ϕJww(w,t),
with the boundary condition
J(w,T) = F(w), w ≥ 0. (17)
For any t, one may think of J(·,t) as the investor’s indirect utility function
for wealth at time t. We note that
J(0,t) =
Z T
t
u(0,s)ds + F(0), t ∈ [0,T ], (18)
from our remark regarding the nonnegativity of solutions to (16).
Assuming that for each t, u(·,t) is strictly concave and twice continuously
differentiable on (0,∞), the first-order condition for interior optimal choice
of c in (16) implies that
c = C(w,t) ≡ I[Jw(w,t),t],
where I(·,t) inverts uc(·,t), meaning that I[uc(x,t),t] = x for all x and t.
We let I = 0 if u = 0. Assuming that the indirect utility function J(·,t) for
wealth is strictly concave, the first-order condition for optimal choice of ϕ in
(16) implies that
ϕ = Φ(w,t) ≡
−Jw(w,t)
wJww(w,t)
(σσ⊤
)−1
λ. (19)9C. Solution to Merton’s Problem 229
We remark that the optimal portfolio fractions are given by a fixed vector
ϕ̃ = (σσ⊤
)−1
λ of portfolio weights multiplied by the Arrow-Pratt measure
of relative risk tolerance (reciprocal of relative risk aversion) of the indirect
utility function J(·,t). This means effectively that, in this setting of time-
homogeneous Gaussian returns and additive utility, it is enough for purposes
of optimal portfolio choice for any investor to replace all risky investments
with a single investment in a single “mutual fund,” a security that invests in
the given risky securities, trading among them so as to maintain the given
proportions ϕ̃ of total asset value in each. Every investor would be content
to invest in only this mutual fund and in riskless borrowing and lending, al-
though different investors would have different fractions of wealth in the mu-
tual fund, depending on the risk aversion of their indirect utility for wealth.
Of course, this would not necessarily be consistent with market clearing, and
therefore with equilibrium.
We focus for now on the special case of u = 0 and F(w) = wα
/α for some
coefficient α ∈ (0,1). The associated relative risk aversion is 1−α. This is an
example of a utilityfunction that is often called hyperbolic absolute risk averse
(HARA). Because we take u = 0, only terminal consumption Z is optimally
nonzero. An explicit value function J for this HARA utility example is
conjectured as follows. Suppose Z is the optimal terminal consumption for
initial wealth level 1. Now consider a new level w of initial wealth, for some
fixed w ∈ (0,∞). One may see that wZ must be the associated optimal
terminal consumption. Certainly, wZ can be obtained in a budget-feasible
manner, for if Z = θT · XT can be obtained from initial wealth 1 with a
trading strategy θ then, given the linearity of stochastic integrals, wθ is a
budget-feasible strategy for initial wealth w, and we have wθT ·XT = wZ. If
there were some alternative terminal consumption b Z that is budget-feasible
with initial wealth w and with the higher utility
E
b Zα
α
!
> E

(wZ)α
α

, (20)
then we would have a contradiction, as follows. First, dividing (20) through
by wα
/α leaves
E
"
b Z
w
!α#
> E(Zα
). (21)
By the above reasoning, b Z/w can be financed with initial wealth 1, but then
(21) contradicts the optimality of Z for initial wealth 1. Thus, as asserted,230 Chapter 9. Portfolio and Consumption Choice
for any initial level of wealth w, the optimal terminal consumption is wZ. It
follows that
J(w,0) = E

(wZ)α
α

=
wα
α
K,
where K = E(Zα
). Up to a constant K, which depends on all of the basic
parameters (λ,r,σ,α,T) of the model, we have a reasonable conjecture for the
initial indirect utility function J(·,0). For t ∈ (0,T), the optimal remaining
utility can be conjectured in exactly the above manner, treating the problem
as one with a time horizon of T − t rather than T. We therefore conjecture
that J(w,t) = k(t)wα
/α for some function k : [0,T] → R. In order for J to
be sufficiently differentiable for an application of Ito’s Formula, we conjecture
that k is itself continuously differentiable.
With this conjecture for J in hand, we can solve (19) to get
ϕ =
(σσ⊤
)−1
λ
1 − α
, (22)
or fixed portfolio fractions. The total fraction of wealth invested in risky
assets is therefore decreasing in the relative risk aversion 1 − α. Because
u = 0, we have
c = C(w,t) ≡ 0. (23)
We can substitute (22)–(23) into the Bellman equation (16), using our con-
jecture J(w,t) = k(t)wα
/α to obtain the ordinary differential equation
k′
(t) = −ǫk(t), (24)
where
ǫ =
αλ⊤
(σσ⊤
)−1
λ
2(1 − α)
+ rα, (25)
with the boundary condition from (17):
k(T) = 1. (26)
Solving (24)–(26), we have
k(t) = eǫ(T−t)
, t ∈ [0,T ].
We have found that the function J defined by J(w,t) = eǫ(T−t)
wα
/α solves
the Bellman equation (16) and the boundary condition (17), so J is therefore
a logical candidate for the value function.9D. The Infinite-Horizon Case 231
We now verify this candidate for the value function, and also that the
conjectured optimal control (c∗
,ϕ∗
), which is given by c∗
t = 0 and ϕ∗
t =
(σσ⊤
)−1
λ/(1 − α), is indeed optimal. Let (c,ϕ) be an arbitrary admissible
control for initial wealth w, and let W be the associated wealth process solv-
ing (16). From the Bellman equation (16), Ito’s Formula, and the boundary
condition (17), we have
J(w,0) +
Z T
0
βt dBt ≥ F(WT), (27)
where βt = Jw(Wt,t)Wtϕ⊤
t σ. Because J is nonnegative, the Bellman equa-
tion (16) and Ito’s Formula also imply that a nonnegative process M is
defined by Mt = J(w,0)+
Rt
0
βs dBs. We also know that M is a local martin-
gale (as defined in Appendix D). A nonnegative local martingale is a super-
martingale (a fact also stipulated in Appendix D). By taking expectations
of each side of (27), this implies that for an arbitrary admissible control,
J(w,0) ≥ E[F(WT )].
It remains to show that for the candidate optimal control (c∗
,ϕ∗
), with
associated wealth process W∗
, we have J(w,0) = E[F(W∗
T )], verifying opti-
mality. For the candidate optimal control (c∗
,ϕ∗
), the Bellman equation and
the same calculations leave us with
J(w,0) +
Z T
0
βt dBt = F(W∗
T ), (28)
where equality appears in place of the inequality in (27) because the pro-
posed optimal control achieves the supremum in the Bellman equation. Be-
cause Jw(W∗
t ,t)W∗
t = eǫ(T−t)
(W∗
t )α
, it can be seen as an exercise that for the
candidate optimal control, E
R T
0
β2
t dt

< ∞, implying by Proposition 5B
that
R
β dB is a martingale. Taking expectations through (28) then leaves
J(w,0) = E[F(W∗
T )], verifying the optimality of (c∗
,ϕ∗
) and confirming that
the problem has optimal initial utility J(w,0) = eǫT
wα
/α.
9D The Infinite-Horizon Case
The primitives (A,Y,C,g,h,f) of an infinite-horizon control problem are just
as described in Section 9A, dropping the terminal reward F. The running
reward function f : A × Y × [0,∞) → R is usually defined, given a discount232 Chapter 9. Portfolio and Consumption Choice
rate ρ ∈ (0,∞), by f(a,y,t) = e−ρt
v(a,y), for some v : A × Y → R. Given
an initial state y in Y, the value of an admissible control c in C is
V c
(y) = E
Z ∞
0
e−ρt
v(ct,Y c
t )dt

, (29)
assuming that the expectation exists, where Y c
is given by (1). The supre-
mum value V (y) is as defined by (2). The finite-horizon Bellman equation
(3) is replaced with
sup
a∈A
{Da
J(y) − ρJ(y) + v(a,y)} = 0, y ∈ Y, (30)
for J in C2
(Y), where
Da
J(y) = Jy(y)g(a,y)+
1
2
tr

h(a,y)h(a,y)⊤
Jyy(y)

.
Rather than the boundary condition (4), one can add technical conditions
yielding the so-called transversality condition
lim
T→∞
E e−ρT
|J(Y c
T )|

= 0, (31)
for any given initialstate Y c
0 = y in Y and any admissiblecontrol c. With this,
the same arguments and technical assumptions applied in Section 9A imply
that a solution J to the Bellman equation (30) defines the value J(y) = V (y)
of the problem. The essential difference is the replacement of (7) with
J(y) ≥ E
Z T
0
e−ρt
v(ct,Y c
t )dt + e−ρT
J(Y c
T )

, T > 0,
from which J(y) ≥ V c
(y) for an arbitrary admissible control c by taking the
limit of the right-hand side as T → ∞, using (31). Similarly, a candidate
optimal control is defined in feedback form by a function C : Y → A with the
property that for each y, the action C(y) solves the Bellman equation (30).
Once again, technical conditions on the primitives guarantee the existence of
an optimal control, but such conditions are often too restrictive in practice,
and the Bellman equation is frequently used more as an aid in conjecturing
a solution.
In Merton’s problem, for example, with v(c,w) = cα
/α, α ∈ (0,1), it is
natural to conjecture that J(w) = Kwα
/α for some constant K. With some9E. The Martingale Formulation 233
calculations, the Bellman equation (30) for this candidate value function J
leads to K = γα−1
, where
γ =
ρ − rα
1 − α
−
αλ⊤
(σσ⊤
)−1
λ
2(1 − α)2
. (32)
The associated consumption-portfolio policy (c∗
,ϕ∗
) is given by ϕ∗
t =
(σσ⊤
)−1
λ/(1 − α) and c∗
t = γW∗
t , where W∗
is the wealth process generated
by (c∗
,ϕ∗
). In order to confirm the optimality of this policy, the transver-
sality condition (31) must be checked, and is satisfied provided γ > 0. This
verification is left as an exercise.
9E The Martingale Formulation
The objective now is to use the martingale results of Chapter 6 as the basis of
a new method for solving Merton’s problem (13). First, we state a corollary
numeraire invariance, in the form of Lemma 6L.
Lemma. Let Y be any deflator. Given an initial wealth w ≥ 0, a strategy
(c,Z,θ) is budget-feasible given price process X if and only
θt · XY
t = wY0 +
Z t
0
θs dXY
s −
Z t
0
Yscs ds ≥ 0, t ∈ [0,T ], (33)
and
θT · XY
T ≥ ZYT . (34)
For simplicity, we take the case N = d. By Girsanov’s Theorem (Appendix
D), there is an equivalent martingale measure Q for the deflated price process
X̂, defined by X̂t = e−rt
Xt, and Q is defined by the density process ξ, in that
EQ
t (Z) =
1
ξt
EP
t (ZξT), (35)
for any random variable Z with EQ
(|Z|) < ∞, where
ξt = exp

−η⊤
Bt −
t
2
η⊤
η

, t ∈ [0,T ], (36)
and where η is the market price of risk defined by
η = σ−1
λ. (37)234 Chapter 9. Portfolio and Consumption Choice
(The invertibility of σ is implied by our earlier assumption that the rows of σ
are linearly independent. The fact that ξ satisfies the Novikov condition and
that var(ξT) < ∞, as demanded by the definition of an equivalent martingale
measure, are easily shown as an exercise.) As shown in Proposition 6F, the
associated state-price deflator π is defined by πt = ξte−rt
.
Proposition. Given a consumption choice (c,Z) in D and some initial
wealth w, there exists a trading strategy θ such that (c,Z,θ) is budget-feasible
if and only if
E

πT Z +
Z T
0
πtct dt

≤ w. (38)
Proof: Suppose (c,Z,θ) is budget-feasible. Applying the previous numeraire-
invariance lemma to the state-price defaltor π, and using the fact that π0 =
ξ0 = 1, we have
w +
Z T
0
θt dXπ
t ≥ πT Z +
Z T
0
πtct dt. (39)
Because Xπ
is a martingale under Q, the process M, defined by Mt =
w+
Rt
0
θs dXπ
s , is a local martingale under Q. Moreover, by (33), M is nonneg-
ative, and therefore a supermartingale (Appendix D). Taking expectations
through (39) leaves (38).
Conversely, suppose (c,Z) satisfies (38), and let M be the Q-martingale
defined by
Mt = EQ
t

e−rT
Z +
Z T
0
e−rt
ct dt

, t ∈ [0,T].
By Girsanov’s Theorem (Appendix D), a standard Brownian motion BQ
in
Rd
under Q is defined by BQ
t = Bt + ηt, and BQ
has the martingale repre-
sentation property. We thus know there there is some ϕ = (ϕ(1)
,...,ϕ(d)
)
with components in L2
such that
Mt = M0 +
Z t
0
ϕs dBQ
s , t ∈ [0,T ],
where M0 ≤ w. For the deflator Y defined by Yt = e−rt
, we also know that
X̂ = XY
is a Q-martingale. From the definitions of the market price of risk
η and of BQ
,
dX̂
(i)
t = X̂
(i)
t σ(i)
dBQ
t , 1 ≤ i ≤ N.9E. The Martingale Formulation 235
Because σ is invertible and X̂ is strictly positive with continuous sample
paths, we can choose adapted processes (θ(1)
,...,θ(N)
) such that
(θ
(1)
t X̂
(1)
t ,...,θ
(N)
t X̂
(N)
t )σ = ϕ⊤
t , t ∈ [0,T].
This implies that
Mt = M0 +
N X
i=1
Z t
0
θ(i)
s dX̂(i)
s .
We can also let
θ
(0)
t = w +
N X
i=1
Z t
0
θ(i)
s dX̂(i)
s −
N X
i=1
θi
tX̂
(i)
t −
Z t
0
e−rs
cs ds. (40)
Because ϕ has components in L2
, we know that θ = (θ(0)
,...,θ(N)
) is in
L(X̂). From (38), Fubini’s Theorem, and the fact that ξt = πtert
defines the
density process for Q, we have
M0 = EQ

e−rT
Z +
Z T
0
e−rt
ct dt

≤ w. (41)
From (40), for any t ≤ T,
θt · X̂t = w +
Z t
0
θs dX̂s −
Z t
0
e−rs
cs ds
= w + Mt − M0 −
Z t
0
e−rs
cs ds
= w − M0 + EQ
t
Z T
t
e−rs
cs ds + e−rT
Z

≥ 0,
using from (41) the fact that w ≥ M0. Restating this inequality in terms of
the deflator, Yt = e−rt
, we have (33). We can also use the same inequality
for t = T and the fact that EQ
T (e−rT
Z) = e−rT
Z to obtain (34). Thus, by
Lemma 9E, (c,Z,θ) is budget-feasible.
Corollary. Given a consumption choice (c∗
,Z∗
) in D and some initial wealth
w, there exists a trading strategy θ∗
such that (c∗
,Z∗
,θ∗
) solves Merton’s prob-
lem (13) if and only if (c∗
,Z∗
) solves the problem
sup
(c,Z)∈D
U(c,Z) subject to E
Z T
0
πtct dt + πT Z

≤ w. (42)236 Chapter 9. Portfolio and Consumption Choice
9F Martingale Solution
We are now in a position to obtain a relatively explicit solution to Merton’s
problem (13) by applying the previous Corollary.
By the Saddle Point Theorem (which can be found in Appendix B) and
the strict monotonicity of U, the control (c∗
,Z∗
) solves (42) if and only if
there is a scalar Lagrange multiplier γ∗
≥ 0 such that, first: (c∗
,Z∗
) solves
the unconstrained problem
sup
(c,Z)∈D
L(c,Z;γ∗
), (43)
where, for any γ ≥ 0,
L(c,Z;γ) = U(c,Z) − γE

πT Z +
Z T
0
πtct dt − w

, (44)
and second, using the fact that at least one of u and F is strictly increasing,
γ∗
> 0 and the complementary-slackness condition can be stated as
E

πT Z∗
+
Z T
0
πtc∗
t dt

= w. (45)
Applying Corollary 9E, we can thus summarize our progress on Merton’s
problem (13) as follows.
Proposition. Given some (c∗
,Z∗
) in D, there is a trading strategy θ∗
such
that (c∗
,Z∗
,θ∗
) solves Merton’s problem (13) if and only if there is a constant
γ∗
> 0 such that (c∗
,Z∗
) solves (43), and E

πT Z∗
+
RT
0
πtc∗
t dt

= w.
In order to obtain an intuition for the solution of (43), we begin with
some arbitrary γ > 0 and treat U(c,Z) = E[
RT
0
u(ct)dt + F(Z)] intuitively
by thinking of “E” and “
R
” as finite sums, in which case the first-order
conditions for optimality of (c∗
,Z∗
) ≫ 0 for the problem sup(c,Z) L(c,Z;γ),
assuming differentiability of u and F, are
uc(c∗
t ,t) − γπt = 0, t ∈ [0,T ], (46)
and
F′
(Z∗
) − γπT = 0. (47)9F. Martingale Solution 237
Solving, we have
c∗
t = I(γπt,t), t ∈ [0,T], (48)
and
Z∗
= IF (γπT ), (49)
where, as we recall, I(·,t) inverts uc(·,t) and where IF = 0 if F = 0 and
otherwise IF inverts F′
. We will confirm these conjectured forms (48) and
(49) of the solution in the next theorem. Under strict concavity of u or F, the
inversions I(·,t) and IF , respectively, are continuous and strictly decreasing.
A decreasing function ŵ : (0,∞) → R is therefore defined by
ŵ(γ) = E
Z T
0
πtI(γπt,t)dt + πT IF (γπT )

. (50)
(We have not yet ruled out the possibility that the expectation may be +∞.)
All of this implies that (c∗
,Z∗
) of (48)-(49) maximizes L(c,Z;γ) provided
the required initial investment ŵ(γ) is equal to the endowed initial wealth
w. This leaves an equation ŵ(γ) = w to solve for the “correct” Lagrange
multiplier γ∗
, and with that an explicit solution to the optimal consumption
policy for Merton’s problem.
We can be a little more systematic about the properties of u and F in
order to guarantee that ŵ(γ) = w can be solved for a unique γ∗
> 0. A
strictly concave increasing function F : R+ → R that is differentiable on
(0,∞) satisfies Inada conditions if infx F′
(x) = 0 and supx F′
(x) = +∞. If
F satisfies these Inada conditions, then the inverse IF of F′
is well defined
as a strictly decreasing continuous function on (0,∞) whose image is (0,∞).
Condition A. Either F is zero or F is differentiable on (0,∞), strictly
concave, and satisfies Inada conditions. Either u is zero or, for all t, u(·,t)
is differentiable on (0,∞), strictly concave, and satisfies Inada conditions.
(Recall, at least one of u and F is nonzero.) For each γ > 0, ŵ(γ) is finite.
The asumption of finiteness of ŵ(·) can be shown under regularity conditions
on utility cited in the Notes.
Theorem. Under Condition A, for any w > 0, Merton’s problem (13) has
a solution (c∗
,Z∗
,θ∗
), where (c∗
,Z∗
) is given by (48)-(49) for a unique γ ∈
(0,∞).
Proof: Under Condition A, the Dominated Convergence Theorem implies
that ŵ(·) is continuous. Because one or both of I(·,t) and IF (·) have238 Chapter 9. Portfolio and Consumption Choice
(0,∞) as their image and are strictly decreasing, ŵ(·) inherits these two
properties. From this, given any initial wealth w > 0, there is a unique
γ∗
with ŵ(γ∗
) = w. Let (c∗
,Z∗
) be defined by (48)-(49), taking γ = γ∗
.
Proposition 9E tells us there is a trading strategy θ∗
such that (c∗
,Z∗
,θ∗
) is
budget-feasible. Let (θ,c,Z) be any budget-feasible choice. Proposition 9E
also implies that (c,Z) satisfies (38). The first-order conditions (46) and (47)
are sufficient (by concavity of u and F) for optimality of c∗
(ω,t) and Z∗
(ω)
in the problems
sup
c∈[0,∞)
u(c,t) − γ∗
π(ω,t)c
and
sup
Z∈[0,∞)
F(Z) − γ∗
π(ω,T)Z,
respectively. Thus,
u(c∗
t ,t) − γ∗
πtc∗
t ≥ u(ct,t) − γ∗
πtct, 0 ≤ t ≤ T, (51)
and
F(Z∗
) − γ∗
πT Z∗
≥ F(Z) − γ∗
πT Z. (52)
Integrating (51) from 0 to T, adding (52), and taking expectations, and
then applying the complementary slackness condition (45) and the budget
constraint (38), leaves U(c∗
,Z∗
) ≥ U(c,Z). As (c,Z,θ) is arbitrary, this
implies the optimality of (c∗
,Z∗
,θ∗
).
This result, giving a relatively explicit consumption solution to Merton’s
problem, has been extended in many directions, including relaxing the reg-
ularity conditions on utility in Condition A, and indeed even generalizing
the assumption of additive utility to allow for habit-formation or recursive
utility, as indicated in the Notes. In the next section, we will show that one
can also extend to allow general Ito security price processes, under technical
conditions.
For a specific example, we once again consider terminal consumption
only, taking u ≡ 0 and F(w) = wα
/α for α ∈ (0,1). Then c∗
= 0 and the
calculations above imply that ŵ(γ) = E

πT (γπT )1/(α−1)

. Solving ŵ(γ∗
) = w
for γ∗
leaves
γ∗
= wα−1
E

π
α/(α−1)
T
α−1
.
It is left as an exercise to check that (49) can be reduced explicitly to
Z∗
= IF (γ∗
πT ) = WT ,9G. A Generalization 239
where
dWt = Wt(r + ϕ · λ)dt + Wtϕ⊤
σdBt; W0 = w,
where ϕ = (σσ⊤
)−1
λ/(1−α) is the vector of fixed optimal portfolio fractions
found previously from the Bellman equation.
9G A Generalization
We generalize the security-price process X = (X(0)
,X(1)
,...,X(N)
) to be of
the form
dX
(i)
t = µ
(i)
t X
(i)
t dt + X
(i)
t σ
(i)
t dBt; X
(i)
0 > 0, (53)
where µ = (µ(0)
,...,µ(N)
) the RN×d
-valued process σ whose i-th row is σ(i)
are bounded adapted processes. We suppose that σ(0)
= 0, so that again
r = µ(0)
is the short-rate process. We assume for simplicity that N = d. That
this is without loss of generality is shown in an exercise, as a consequence
of Lévy’s characterization of Brownian motion. The excess expected returns
of the “risky” securities are defined by an RN
-valued process λ given by
λ
(i)
t = µ
(i)
t − rt. We assume that σ is invertible (almost everywhere) and
that the market-price-of-risk process η, defined by ηt = σ−1
t λt, is bounded.
It follows from the results of Chapter 6 that markets are complete (at least
in the sense of Proposition 6I) and that there are no arbitrages that are
reasonably well behaved.
In this setting, a state-price deflator π is defined by
πt = exp

−
Z t
0
rs ds

ξt, (54)
where
ξt = exp

−
1
2
Z t
0
ηs · ηs ds −
Z t
0
ηs dBs

.
The reformulation of Merton’s problem given by Proposition 9F and the
form (48)-(49) of the solution (when it exists) still apply, substituting only
the state-price deflator π of (54) for that given in the earlier special case of
constant r, λ, and σ. Once again, the only difficulty to overcome is a solution
γ∗
to ŵ(γ∗
) = w, where ŵ is again defined by (53). This is guaranteed by the
same Condition A of the previous section. The proof of Theorem 9F thus
suffices for the following extension.240 Chapter 9. Portfolio and Consumption Choice
Proposition. Suppose µ and σ, are bounded adapted processes, rank(σ) = d
almost everywhere, and η = σ−1
λ is bounded. Under Condition A, for any
w > 0, Merton’s problem has the optimal consumption policy given by (48)-
(49) for a unique scalar γ > 0.
Although this approach generates an explicit solution for the optimal con-
sumption policy up to an unknown scalar γ, it does not say much about the
form of the optimal trading strategy, beyond its existence. The Notes cite
sources in which an optimal strategy is represented in terms of the Malliavin
calculus. The original stochastic-control approach, in a Markov setting, gives
explicit solutions for the optimal trading strategy in terms of the derivatives
of the value function. Although there are few examples in which these deriva-
tives are known explicitly, they can be approximated by a numerical solution
of the Hamilton-Jacobi-Bellman equation, by extending the finite-difference
methods given in Chapter 11.
9H The Utility-Gradient Approach
The martingale approach can be simplified, at least under technical con-
ditions, by adopting the utility-gradient approach of Chapter 2. Although
conceptually easy, this theory has only been developed to the point of theo-
rems under restrictive conditions, and with proofs beyond the scope of this
book, so we shall merely sketch out the basic ideas and refer to the Notes for
sources with proofs and more details.
We let L+ denote the set of nonnegative adapted consumption processes
satisfying the integrability condition E
RT
0
ct dt

< ∞. We adopt a concave
utility function U : L+ → R, not necessarily of the additive form
U(c) = E
Z T
0
u(Ct,t)dt

. (55)
We fix the security-price process X of Section 9G. Fixing also the initial
wealth w, we say that a consumption process c in L+ is budget-feasible if
there is some trading strategy θ such that
θt · Xt = w +
Z t
0
θs dXs −
Z t
0
cs ds ≥ 0, t ∈ [0,T],9H. The Utility-Gradient Approach 241
with θT · XT = 0. A budget-feasible consumption process c is optimal if it
solves the problem
sup
c∈A
U(c),
where A denotes the set of budget-feasible consumption processes. If c∗
is
budget-feasible and the gradient ∇U(c∗
) (defined in Appendix A) of U at c∗
exists, the gradient approach to optimality reviewed in Appendix A leads to
the first-order condition for optimality:
∇U(c∗
;c∗
− c) ≤ 0, c ∈ A.
We suppose that c∗
is budget-feasible and that ∇U(c∗
) exists, with a
Riesz representation π that is an Ito process. That is,
∇U(c∗
;c − c∗
) = E
Z T
0
(ct − c∗
t )πt dt

, c ∈ A.
As shown in Appendix G, this is true for the additive model (55), under
natural conditions, taking πt = uc(c∗
t ,t). Appendix G also gives Riesz repre-
sentations of the utility gradients of other forms of utility functions, such as
continuous-time versions of the habit-formation and recursive utilities con-
sidered in Exercises 2.8 and 2.9.
Based on Proposition 2D and the results of Section 9G, it is natural to
conjecture that c∗
is optimal if and only if the Riesz representation π of
∇U(c∗
) is in fact a state-price deflator. In order to explore this conjecture,
we suppose that π is indeed a state-price deflator; that is, Xπ
is a martingale.
Numeraire Invariance implies that c is budget-feasible if and only if there is
some trading strategy θ with
θt · Xπ
t = wπ0 +
Z t
0
θs dXπ
s −
Z t
0
cs πs ds ≥ 0, t ∈ [0,T], (56)
and θT · Xπ
T = 0. For any budget-feasible strategy (c,θ), because
R
θdXπ
is
a local martingale that is bounded below, and therefore a supermartingale,
(56) implies that
E
Z T
0
ct πt dt

≤ wπ0.
Applying this in particular to c∗
, where we expect it to hold with strict
equality under technical conditions, we have
∇U(c∗
;c − c∗
) = E
Z T
0
πt(ct − c∗
t )dt

≤ 0, c ∈ A. (57)242 Chapter 9. Portfolio and Consumption Choice
Thus, assuming some technical conditions along the way, we have shown
that the first-order conditions for optimality of a budget-feasible choice c
is essentially that the Riesz Representation π of the utility gradient at c
is a state-price deflator. (This was precisely what we found in the finite-
dimensional setting of Chapter 2.) We would next like to see how to deduce
an optimal choice c∗
from this first-order condition (57). We may have a
significant amount of structure with which to determine c∗
on this basis.
First, from Chapter 6, we know that a state-price deflator π is given, under
regularity, by
πt = π0 exp

−
Z t
0
rs ds

ξt, (58)
where ξ is the density process for some equivalent martingale measure, which
implies that dξt = ξtηt dBt for a market-price-of-risk process η. Second, U
may be one of the popular utility functions for which we can calculate the
gradient ∇U(c) at any c. Finally, we can attempt to invert for an optimal
c∗
by matching the Riesz representation of ∇U(c∗
) to one of the state-price
deflators that we can calculate from (58).
In the case of additive utility, for example, if c∗
is optimal then a state-
price deflator π can be chosen, for some scalar k > 0, by kπt = uc(c∗
t ,t), so
that c∗
t = I(kπt,t), where I(·,t) inverts uc(·,t). Finally, we need to choose
k so that c∗
is budget-feasible. For the case of complete markets, it suffices,
by the same numeraire-invariance argument made earlier, that
)π0 w = E
Z T
0
c∗
t πt dt

= E
Z T
0
I(kπt,t)πt dt

. (59)
Provided I(·,t) has range (0,∞) for all t, the arguments used in Section
9F can be applied for the existence of some scalar k > 0 satisfying (59). It
is enough, for instance, that a market price of risk process η can be chosen
to be bounded, and that I satisfies a uniform growth condition in its first
argument. The Notes cite examples of a nonadditive utility function U with
the property that for each deflator π in a suitably general class, one can
recover a unique consumption process c∗
with the property that ∇U(c∗
) has
π as its Riesz representation. Subject to regularity conditions, the habit-
formation and recursive-utility functions have this property.
For the case of incomplete markets (for which it is not true that rank(σ) =
d almost everywhere), all of the above steps can be carried out in the absence
of arbitrage, except that there need not be a trading strategy θ∗
that finances9H. The Utility-Gradient Approach 243
the candidate solution c∗
. Papers cited in the Notes have taken the following
approach. With incomplete markets, there is a family of different market-
price-of-risk processes. The objective is to choose a market-price-of-risk pro-
cess η∗
with the property that, when matching the Riesz representation of
the utility gradient to kη∗
, we can choose k so that c∗
can be financed. This
can be done under technical regularity conditions.
Exercises
Exercise 9.1 For the candidate optimal portfolio control ϕ∗
t = ϕ given by
(22), verify that (28) is indeed a martingale as asserted.
Exercise 9.2 Solve Merton’s problem in the following cases. Add any
regularity conditions that you feel are appropriate.
(A) Let T be finite, F = 0, and u(c,t) = e−ρt
cα
/α,α ∈ (0,1).
(B) Let T be finite, F = 0, and u(c,t) = logc.
(C) Let T = +∞ and u(c,t) = e−ρt
cα
/α, α ∈ (0,1). Verify the solution
given by c∗
t = γW∗
t and ϕ∗
t = (σσ⊤
)−1
λ/(1 − α), where γ is given by (32).
Verify the so-called transversality condition (31) with γ(1 − α) > 0.
Exercise 9.3 Extend the example in Section 9D, with v(c,w) = cα
/α, to
the case without a riskless security. Add regularity conditions as appropriate.
Exercise 9.4 The rate of growth of capital stock in a given production
technology is determined by a “random shock” process Y solving the stochas-
tic differential equation
dYt = (b − κYt)dt + k
√
Y t dBt; Y0 = y ∈ R+, t ≥ 0,
where b, κ, and k are strictly positive scalars with 2b > k2
, and where B
is a standard Brownian motion. Let C be the space of nonnegative adapted
consumption processes satisfying
RT
0
ct dt < ∞ almost surely for all T ≥ 0.
For each c in C, a capital stock process Kc
is defined by
dKc
t = (Kc
t hYt − ct)dt + Kc
t ǫ
√
Y t dBt; Kc
0 = x > 0,
where h and ǫ are strictly positive scalars with h > ǫ2
. Consider the control
problem
V (x,y) = sup
c∈C
E
Z T
0
e−ρt
log(ct)dt

,244 Chapter 9. Portfolio and Consumption Choice
subject to Kc
t ≥ 0 for all t in [0,T].
(A) Let C : R+ × [0,T] → R+ be defined by
C(x,t) =
ρx
1 − e−ρ(T−t)
,
and let K be the solution of the SDE
dKt = [KthYt − C(Kt,t)]dt + Ktǫ
√
Y t dBt; K0 = x > 0.
Finally, let c∗
be the consumption process defined by c∗
t = C(Kt,t). Show
that c∗
is the unique optimalconsumption control. Hint: Verify that V (x,y) =
J(x,y,0), where J is of the form
J(x,y,t) = A1(t)log(x) + A2(t)y + A3(t), (x,y,t) ∈ R+ × R × [0,T),
where A1, A2, and A3 are (deterministic) real-valued functions of time. State
the function A1 and differential equations for A2 and A3.
(B) State the value function and the optimal consumption control for the
infinite-horizon case. Add regularity conditions as appropriate.
Exercise 9.5 An agent has the objective of maximizing E[u(WT )], where
WT denotes wealth at some future time T and u : R → R is increasing and
strictly concave. The wealth WT is the sum of the market value of a fixed
portfolio of assets and the terminal value of the margin account of a futures
trading strategy, as elaborated below. This problem is one of characterizing
optimal futures hedging. The first component of wealth is the spot market
value of a fixed portfolio p ∈ RM
of M different assets whose price processes
S1
,...,SM
satisfy the respective stochastic differential equations
dSm
t = µm(t)dt + σm(t)dBt; t ≥ 0; Sm
0 = 1, m ∈ {1,...,M},
where, for each m, µm : [0,T ] → R and σm : [0,T ] → Rd
are continuous.
There are futures contracts for K assets with delivery at some date τ > T,
having futures-price processes F1
,...,Fk
satisfying the stochastic differential
equations
dFk
t = mk(t)dt + vk(t)dBt; t ∈ [0,T ], 1 ≤ k ≤ K,
where mk and vk are continuous on [0,T] into R and Rd
, respectively. For
simplicity, we assume that there is a constant short rate r for borrowing9H. The Utility-Gradient Approach 245
or lending. One takes a futures position merely by committing oneself to
mark a margin account to market. Conceptually, that is, if one holds a long
(positive) position of, say, ten futures contracts on a particular asset and the
price of the futures contract goes up by a dollar, then one receives ten dollars
from the short side of the contract. (In practice, the contracts are largely
insured against default by the opposite side, and it is normal to treat the
contracts as default-free for modeling purposes.) The margin account earns
interest at the riskless rate (or, if the margin account balance is negative, one
loses interest at the riskless rate). We ignore margin calls or borrowing limits.
Formally, as described in Section 8C, the futures-price process is actually the
cumulative-dividend process of a futures contract; the true price process is
zero. Given any bounded adapted process θ = (θ(1)
,...,θ(K)
) for the agent’s
futures-position process, the agent’s wealth at time T is p · ST + XT , where
X is the Ito process for the agent’s margin account value, defined by X0 = 0
and dXt = rXt dt + θt dFt.
(A) Set up the agent’s dynamic hedging problem for choice of futures-
position process θ in the framework of continuous-time stochastic control.
State the Bellman equation and first-order conditions. Derive an explicit
expression for the optimal futures position θt involving the (unknown) value
function. Make regularity assumptions such as differentiability and nonsin-
gularity. Hint: Let Wt = p · St + er(T−t)
Xt, t ∈ [0,T].
(B) Solve for the optimal policy θ in the case m ≡ 0, meaning no expected
futures-price changes. Add any regularity conditions needed.
(C) Solve the problem explicitly for the case u(w) = −e−αw
, where α > 0
is a scalar risk aversion coefficient. Add any regularity conditions needed.
Exercise 9.6 In the setting of Section 9B, consider the special case of the
utility function
U(c,Z) = E
Z T
0
log(ct)dt +
√
Z

.
Obtain a closed-form solution for Merton’s problem (14). Hint: The mixture
of logarithm and power function in the utility makes this a situation in which
the martingale approach has an advantage over the Bellman approach, from
which it might be difficult to conjecture a value function. Once the optimal
consumption policy is found, do not forget to calculate the optimal portfolio
trading strategy.246 Chapter 9. Portfolio and Consumption Choice
Exercise 9.7 (Utility-GradientExample) Suppose B is a standard Brow-
nian motion and there are two securities with price processes S and β given
by
dSt = µtSt dt + σtSt dBt; S0 > 0
dβt = rtβt dt; β0 > 0,
where µ, σ, and r are bounded adapted processes with µt > rt for all t. We
take the infinite horizon case, with utility function U defined by
U(c) = E
Z ∞
0
e−ρt
cα
t dt

,
where α ∈ (0,1) and ρ ∈ (0,∞). Taking the utility-gradient approach of
Section 9H, c∗
is, in principle, an optimal choice if and only if
E
Z ∞
0
πt c∗
t dt

= w,
where ∇U(c∗
) has Riesz representation π, and where Sπ
and βπ
are martin-
gales. Assuming that the solution c∗
is an Ito process with
dc∗
t = c∗
t µ∗
t dt + c∗
t σ∗
t dBt,
we can write
dπt = πt µπ(t)dt + πt σπ(t)dBt
for processes µπ and σπ that can be solved explicitly in terms of µ∗
and σ∗
from Ito’s Formula and the fact that πt = αe−ρt
cα−1
t . Assuming that Sπ
and
βπ
are indeed martingales, solve for µ∗
and σ∗
explicitly.
Exercise 9.8 Verify that, as defined by (35) and (36), Q is indeed an
equivalent martingale measure, including the property that var(ξT ) < ∞.
Exercise 9.9 (Constrained Investment Behavior) Security markets are
characterized by price processes S = (S(1)
,...,S(N)
) and β, with
dβt = βtrt dt, β0 > 0,
for a bounded adapted process r, and with
dS
(i)
t = S
(i)
t µ
(i)
t dt + S
(i)
t σ
(i)
t dBt,9H. The Utility-Gradient Approach 247
where, for each i, µ(i)
and σ(i)
are bounded adapted processes in R and Rd
respectively. We also assume that Γt = (σtσ⊤
t )−1
is well defined and bounded.
With a trading strategy specified in terms of a bounded adapted process ϕ
valued in RN
with
RT
0
ϕt · ϕt dt < ∞, and with a non-negative consumption
process c, the wealth process W(ϕ,c)
of an investor is defined by
dW
(ϕ,c)
t = [W
ϕ,c)
t (ϕt · λt + rt) − ct]dt + W
(ϕ,c)
t ϕ⊤
t σt dBt; W
(ϕ,c)
0 = w,
where λi
t = µi
t − rt and where w > 0 is a given constant. The investment-
consumption strategy (ϕ,c) is admissible if W
(ϕ,c)
t ≥ 0 for all t. Consider an
investor with the utility criterion
U(c) = E
Z T
0
e−ρt
logct dt

,
where ρ > 0 is a constant, and c is chosen from the set of non-negative
adapted processes such that U(c) is well defined.
(A) (Unconstrained case) Let C∗
(r,µ,σ) denote the set of solutions to the
investor’s optimization problem,
sup
(ϕ,c)∈C(w)
U(c),
where C(w) is the set of admissible strategies. Calculate C∗
(r,µ,σ).
(B) (Leverage Constraints) Let C(w,ℓ) = {(ϕ,c) ∈ C(w) :
PN
i=1 ϕi
t ≤ ℓt},
where ℓ is a non-negative bounded adapted process that sets an upper bound
on the leverage of the investment strategy. The investor’s problem is now
sup
(ϕ,c)∈C(w,ℓ)
U(c).
Solve this leverage-constrained problem. Hint: Reduce the problem to that
of the un-constrained case by an adjustment of the interest rate r, to reflect
the shadow price of the leverage constraint, so that the problem may be
effectively solved unconstrained.
(C) (Leverage and shortsales constraints) Let
C(w,ℓ,b) = {(ϕ,c) ∈ C(w,ℓ) : ϕt ≥ −bt},248 Chapter 9. Portfolio and Consumption Choice
where ℓ is as above and b = (b(1)
,...,b(N)
), where bi
is for each i a non-
negative bounded adapted process that places, in addition to a leverage con-
straint, a bound on short sales as a fraction of portfolio value. Now, solve:
sup
(ϕ,c)∈C(w,ℓ,b)
U(c).
Hint: Again, reduce to the unconstrained case, this time by suitable adjust-
ment of all of the return coefficients (r,µ) to reflect the shadow prices of the
constraints.
Exercise 9.10 (Investment and Price Behavior with Jumps) The objec-
tive of this exercise is to extend the basic results for consumption-investment
models and asset pricing to an economy in which the volatilities and expected
rates of return of the available securities may change suddenly, and depend
on a “regime” state process defined by a two-state Markov chain Z. When a
regime switch occurs, the price may jump as well, for example to reflect the
sudden change in the distribution of returns on equilibrium asset values.
We fix a probability space on which is defined a standard Brownian mo-
tion B in Rd
and the two-state continuous-time Markov chain Z, as defined
in Appendix F, with states 0 and 1, and transition intensities λ(0) and λ(1).
We let M denote the compensated version of Z.
Suppose X = (X(0)
,X(1)
,...,X(N)
) is an adapted process in RN+1
for
the prices of N + 1 securities. For each i ≥ 1, we assume that
dX
(i)
t = µi(Zt)X
(i)
t dt + X
(i)
t σ(i)
(Zt)dBt + X
(i)
t−βi(Zt−)dMt; X0 > 0,
where, for each ℓ ∈ {0,1},
σ(i)
(ℓ) is the i-th row of a constant matrix σ(ℓ) in RN×d
.
µi(ℓ) is a constant.
βi(ℓ) is a constant strictly less than 1 in absolute value.
This implies, in particular, that within a “regime,” each process X (i)
behaves
as a geometric Brownian motion of the sort used in the Black-Scholes model
of option pricing. When the regime changes, the price process jumps and its
drift and diffusion parameters change. When the regime changes from 0 to
1, for example, the price of risky security i jumps by a multiplicative factor9H. The Utility-Gradient Approach 249
of βi(0). When the regime changes from 1 to zero, the price of risky security
i jumps by a multiplicative factor of −βi(1).
Given a short rate process {r(Zt) : t ≥ 0}, for given constants r(0) and
r(1), the market value of an investment rolled over at the short rate defines
a value process X(0)
by
dX
(0)
t = r(Zt)X
(0)
t dt; X
(0)
0 > 0.
The filtration of tribes generated by (B,Z), and augmented with null sets,
as above, defines the information available to investors. A trading strategy is
a predictable RN+1
-valued process θ such that the stochastic integral
R
θdX
exists. A trading strategy θ is self-financing if
θt · Xt = θ0 · X0 +
Z t
0
θs dXs, 0 ≤ t ≤ T.
(A) (Complete Markets and Equivalent Martingale Measure) Find condi-
tions on the primitive functions (σ, µ, r, β, λ) defining asset returns that are
sufficient for the existence of a unique equivalent martingale measure Q for
the deflated price process Xt/X
(0)
t . (Do not assume that λ or β are trivial.)
Show, under these conditions, that for any bounded FT -measurable random
variable Y there is a self-financing trading strategy θ with bounded market
value θt · Xt, with θT · XT = Y , and with
θ0 · X0 = EQ

exp
Z T
0
−r(Zt)dt

Y

.
Also, given the existence of an equivalent martingale measure, show that any
self-financing trading strategy θ satisfying θt · Xt ≥ 0 for all t cannot be an
arbitrage.
Hint: For a given equivalent probability measure Q, let
ξt = Et

dQ
dP

, t ≤ T.
Because ξ is a martingale, it has a martingale representation in the form
dξt = ξtσξ(t)dBt + ξt−βξ(t)dMt,250 Chapter 9. Portfolio and Consumption Choice
for some adapted processes σξ and βξ. For Q to be an equivalent martingale
measure under the numeraire deflator X(0)
, it must be the case that a P-
martingale is defined by the process whose value at time t is
ξtX
(i)
t
X
(0)
t
.
Using Ito’s Formula from Appendix G for the case of a product of processes
of this form, compute restrictions on σξ and βξ in terms of the primitives,
and then provide restrictions on the asset-return coefficient functions µ, r, σ,
λ, and β under which ξ, and therefore Q, are uniquely well defined. Please
don’t forget that ξ should be of finite variance.
(B) (Martingale Formulation of Optimality) Utility is defined over the
space L+ of non-negative adapted consumption processes satisfying the re-
striction that
RT
0
ct dt < ∞ almost surely. Specifically, U : L+ → R is defined
by
U(c) = E
Z T
0
e−ρt
u(ct)dt

.
For this part of the problem, T is a fixed finite time and u : R+ → R is
strictly concave and increasing.
Given an initialwealth w > 0, we say that (c,θ) is budget-feasible, denoted
(c,θ) ∈ Λ(w), if c ∈ L+ and if θ ∈ L(X) is a trading strategy satisfying
θt · Xt = w +
Z t
0
θs dXs −
Z t
0
cs ds ≥ 0, t ∈ [0,T ],
where w > 0 is a given constant and
θT · XT ≥ 0.
We now have the problem, for each initialwealth w and each initialregime
i ∈ {0,1},
J(i,w,0) = sup
(c,θ)∈Λ(w)
U(c). (60)
Using the martingale approach, compute the optimal consumption process
up to a missing scalar Lagrange multipler. Justify your answer, making
technical assumptions as needed.
(C) (Parametric Example) We change the formulation in Part (B) by let-
ting T = +∞ and by considering the special case u(c) = cα
, for some9H. The Utility-Gradient Approach 251
α in (0,1). A consumption process c is non-negative and adapted, with R t
0
cs ds < ∞ for each t > 0. We also simplify the problem by assuming that
βi = 0 for all i, meaning that a regime shift causes no jump in asset prices,
but may cause a change in expected rates of returns, volatilities, and cor-
relations. State the solution to (60), proving its optimality by reducing the
supremum value function J defined by (60) to 2 unknown coefficients, k0 and
k1, one for each initial regime. Using your extension of the Hamilton-Jacobi-
Bellman equation for optimal control in this setting, obtain two non-linear
restrictions on these 2 unknown coefficients. Assume existence of a solution
to this system of equations for k0 and k1. Compute the candidate optimal
consumption and portfolio fraction policies as explicitly as possible. Verify
your candidate solution, under additional explicit regularity conditions on
the primitive parameters as well as k0 and k1. Please be extremely careful
to provide a complete proof of optimality given k0 and k1.
(D) (Robinson Crusoe) Let d = 1 (one-dimensional Brownian motion).
Robinson must consume at each time t from a physical stock Kt of consump-
tion commodity, satisfying the production equation
dKt = [η(Zt)Kt − ct]dt + Ktζ(Zt)dBt + Kt−δ(Zt−)dZt, (61)
where η, ζ, and δ are real-valued functions on {0,1} and c is a non-negative
adapted consumption process to be chosen by Robinson. We assume that
|δ| < 1. Robinson’s utility for consumption is defined by
U(c) = E
Z ∞
0
e−ρt
cα
t dt

,
for a given α ∈ (0,1). Robinson’s problem is
sup
c∈A
U(c), (62)
where A is the space containing any consumption process c such that the
stock Kt of commodity solving (61) remains non-negative for all t. Solve
(62). Hint: Conjecture the form of the value function. Now, for each initial
state i ∈ {0,1}, consider the stopping time τ of first transition to the other
state. Begin your calculation of the unknown coefficients of the solution by
conditioning on this stopping time τ.
(E) (Incomplete Information and Filtering) We now consider the special
case of a single risky asset (N = 1) for which, with each change in regime252 Chapter 9. Portfolio and Consumption Choice
there is no jump in the risky asset price (that is, β = 0), no change in the
interest rate (that is, r(1) = r(0) = r for some constant r), and no jumps in
the volatility (that is, σ(1) = σ(2) = q for some constant q). With a change
in regime, however, there is a change in the mean-rate-of-return coefficient.
That is, µ(1) 6= µ(0). For simplicity, we will assume that λ(0) = λ(1) = λ,
for some constant λ > 0, so that the arrival intensity of a change in regime
is the same in both regimes.
Suppose, however, that the investor is not able to observe the regime state
process Z, but can only observe the risky-asset’s price process S = X(1)
. This
means that, for the investor, the relevant filtration of tribes describing the
available information is {FS
t = σ({Su : u ≤ t})}.
Now solve the optimal portfolio investment strategy for an investor with
the utility criterion
U(c) = E
Z ∞
0
e−ρt
logct dt

,
where ρ > 0 is a constant, and c is chosen from the set of non-negative
adapted processes such that U(c) is well defined.
Hint: It may assist you to work with a stochastic differential model for
asset price behavior given the limited information available. For this, let
pt = P(Zt = 1|FS
t ) denote the conditional probability at time t that Zt = 1,
given the observed asset prices to that time. By adding and subtracting the
same thing from the stochastic differential expression for S, we have
dSt = Stm(pt)dt + Stq dBt,
where
dBt =
1
q
[µ(Zt) − m(pt)]dt + dBt,
and where, for any α ∈ [0,1],
m(α) = αµ(1) + (1 − α)µ(0)
defines the conditional expectation of the mean-rate of return on the risky
asset given probability α that the unknown regime is 1. It can be shown,
for the probability space (Ω,F,P) and the limited filtration {FS
t : t ≥ 0}
available to the investor, that B is a standard Brownian motion. It turns
out, moreover, that
dpt = λ(1 − 2pt)dt + kpt(1 − pt)dBt,9H. The Utility-Gradient Approach 253
where k = [µ(1)−µ(0)]/q. The initialcondition p0 is the investor’s prior prob-
ability assesment that Z(0) = 1. We have therefore effectively reduced the
original investment problem to one of complete observation, with a stochas-
tic mean-rate of return m(pt) determined by a separate Markov process p
satisfying its own stochastic differential equation.
Notes
Standard treatments of stochastic control in this setting are given by Flem-
ing and Rishel [1975], Krylov [1980], Bensoussan [1983], Lions [1981], Li-
ons [1983], Fleming and Soner [1993], and Davis [1993]. Fleming and Soner
(1993) develop the notion of viscosity solutions of the Hamilton-Jacobi-Bellman
equation. Among other advantages of this approach, it allows one to charac-
terize the continuous-time stochastic control problem as the limit of discrete
Markov control problems of the sort considered in Chapter 3.
Merton [1969] and Merton [1971], in perhaps the first successful applica-
tion of stochastic control methods in an economics application, formulated
and solved the problem described in Section 9B. (Another early example
is Mirrlees [1974].) Extensions and improvements of Merton’s result have
been developed by Aase [1984], Fleming and Zariphopoulou [1991], Karatzas,
Lehoczky, Sethi, and Shreve [1986], Lehoczky, Sethi, and Shreve [1983],
Lehoczky, Sethi, and Shreve [1985], Sethi and Taksar [1988], Fitzpatrick
and Fleming [1991], Richard [1975], Jacka [1984], Ocone and Karatzas [1991]
(who apply the Malliavin calculus), and Merton [990b].
The martingale approach to optimal investment described in Section 9E
has been developed in a series of papers. Principle among these are Cox and
Huang [1989] and, subsequently, Karatzas, Lehoczky, and Shreve [1987]. This
literature includes Cox [1983], Pliska [1986], Cox and Huang [1991], Back
[1986], Back and Pliska [1987], Huang and Pagès [1992], ?], ?], Jeanblanc
and Pontier [1990], Richardson [1989], and ?]. For applications of duality
techniques to markets with constraints, see Cvitanić and Karatzas [1992],
Cvitanić and Karatzas [1993], Cvitanić and Karatzas [1994], He and es [1993],
He and Pearson [991a], He and Pearson [991b], Karatzas, Lehoczky, Shreve,
and Xu [1991], and El Karoui and Quenez [1991].
For problems with mean-variance-criteria in a continuous-time setting,
see Ansel and Stricker [1993], Bajeux-Besnainou and Portait [1993], Bossaerts
and Hillion [1994], Bouleau and Lamberton [1993], Duffie and Jackson [1990],
Duffie and Richardson [1991], Föllmer and Schweizer [1990], Föllmer and
Sondermann [1986], Lakner [994a], and Schweizer [993a], Schweizer [993b],254 Chapter 9. Portfolio and Consumption Choice
Schweizer [994a], and Schweizer [994b].
For optimality under various habit-formation utilities, see Constantinides
[1990], Detemple and Zapatero [1992], Ingersoll[1992], Ryder and Heal [1973],
and Sundaresan [1989]. A model involving local substitution for consumption
was developed by Hindy and Huang [1992], Hindy and Huang [1993a], and
Hindy, Huang, and Kreps [1992]. See, also, Hindy, Huang, and Zhu [993b].
Ekern [1993] is an example of a model of irreversible investment. Dixit
and Pindyck [1993] review many other models of optimal production under
uncertainty using stochastic control methods.
For developments of recursive utility in continuous-time settings, and the
associated technical problem of backward stochastic differential equations,
see Ahn [1993], ?], ?], Alvarez and Tourin [1994], Darling [1994], Duffie and
Epstein (with Skiadas) (1992a), Duffie and Epstein [992b], Duffie and Lions
[1990], Duffie and Skiadas [1994], ?], Karoui, Peng, and Quenez [1994], Ma
[991a], Ma [991b], Ma [1993], ?], Pardoux and Peng [1990], Pardoux and
Peng [1994], Peng [1992], Peng [1993], Svensson [1989], and Uzawa [1968].
For the related problem of backward-forward stochastic differential equations
see Antonelli [1993], Cvitanić and Ma [1994], Duffie, Geoffard, and Skiadas
[1994], ?], Ma, Protter, and Yong [1993], and Ma and Yong [1993].
The utility-gradient approach to optimal investment of Section 9H is
based on work by Harrison and Kreps [1979], Kreps [1981], Huang [1985b],
Foldes [1978], Foldes [1979], Foldes [1990], Foldes [991a], Foldes [991b], Foldes
[991c], Back [991a], and ?], and is extended in these sources to an abstract
setting with more general information and utility functions.
For optimal investment problems in the case of transactions costs, see
Akian, Menaldi, and Sulem [1993], Alvarez [1991], Arntzen [1994], Chang
[1993], Constantinides [1986], Davis and Norman [1990], Davis and Panas
[1991], Duffie and Sun [1990], Dumas and Luciano [1989], Edirisinghe, Naik,
and Uppal [1991], Fleming, Grossman, Vila, and Zariphopoulou[1989], Jouini
and Kallal [993a], Jouini and Kallal [993b], Pliska and Selby [1994], Schroder
[1993], Shreve and Soner [1994], Shreve, Soner, and Xu [1991], Vayanos and
Vila [1992], and Zariphopoulou [1992]. See also the references cited in the
Notes of Chapter 6.
For results with incomplete markets, see Adler and Detemple [1988],
Cuoco [1994], Cvitanić and Karatzas [1992], Cvitanić and Karatzas [1994],
?], Duffie and Zariphopoulou [1993], Dybvig [1989], Karoui and Jeanblanc-
Picqué [1994], He and es [1993], Koo [1991], Koo [994a], Koo [994b], Scheinkman
and Weiss [1986], and Svensson and Werner [1993].9H. The Utility-Gradient Approach 255
For the case of short-sales constraints and other forms of portfolio retric-
tions, see Back and Pliska [1986], Brennan, Schwartz, and Lagnado [1993],
Cuoco [1994], Cvitanić Karatzas (1992, 1994), Dybvig [1994], Fleming and
Zariphopoulou [1991], He and es [1993], Hindy [1995], Shirakawa [1994], Vila
and Zariphopoulou [1991], Xu and Shreve [992a], Xu and Shreve [992b], Za-
riphopoulou (1992), and Zariphopoulou [1994].
On the existence of additive or other particular forms of utility consis-
tent with given asset prices, sometimes called integrability, see Bick [1986],
He and Huang [1994], He and Leland [1993], Hodges and Carverhill [1992],
and Wang [993a]. On turnpike problems, see Cox and Huang (1991, 1992)
and Huang and Zariphopoulou [1994]. For problems in settings with incom-
plete information, usually requiring filtering of the state, see Dothan and
Feldman [1986], Gennotte [1984], Detemple [1991], Föllmer and Schweizer
(1990), Karatzas [1991], Karatzas and Xue [1990], Kuwana [1994], Lakner
[994b], ?], Ocone and Karatzas (1991), and Schweizer (1993b).
Exercise 9.9 is based in part on Cvitanìc and Karatzas (1992, 1994) and
on Tepla (1997). Exercise 9.10 is based on Honda (1997). For the results on
filtering used in Exercise 9.10 of ?].
Quenez [1992] and Karatzas [1989] survey some of the topics in this chap-
ter. Exercise 9.4 is from Cox, Ingersoll, and Ross [1985].
Detemple [1986]127 Aase [1993]128 Akian, Sulem, and Taksar [1999]129
Altay, Nageswaran, and Kazemi [1995]130 Amendinger, Imkeller, and Schweizer
[1998]131 Avellaneda and Levy [1995]132 Avellaneda [1994]133 Balduzzi and
Lynch [1998]134 Balduzzi and Lynch [1997]135 Bally [1995]136 Barles, Buck-
dahn, and Pardoux [1995]137 Bergman [985b]138 Boyle and Yang [1995]139
Broadie, Cvitanić, and Soner [1996]140 Buckdahn [995a]141 Buckdahn [995b]142
Cadenillasand Pliska [1996]143 Chapman [1995]144 Clelow and Hodges [1996]145
Cox and Huang [1992]146 Cuoco [1995]147 Cuoco and Cvitanić [1995]148
Cuoco and Liu [1997]149 Cuoco and Zapatero [1997]150 Cvitanić [1994]151
Cvitanić [1998]152 Cvitanić [1995]153 Cvitanić and Karatzas [1995]154 Cvi-
tanić and Karatzas [1996]155 Cvitanić, Karatzas, and Soner [1998]156 Davis
and List [1996]157 Derviz [1996]158 Detemple and Murthy [994a]159 Duffie
and Skiadas) [992a]160 Duffie, Fleming, Soner, and Zariphopoulou [1997]161
Dybvig, Rogers, and Back [1995]162 Karoui, Kapoudjian, Pardoux, Peng,
and Quenez [1995]163 Fisher and Gilles [1998]164 Foldes [1996]165 Gegout-
Petit and Pardoux [1995]166 Glasserman [1996]167 Gourieroux, Laurent,
and Pham [1995]168 Grossman and Zhou [1996]169 Honda [1996]170 Honda
[997b]171 Honda [997c]172 Huang [1992]173 Huang [1995]174 Iyengar and256 Chapter 9. Portfolio and Consumption Choice
Cover [1997]175 Kuwana [995b]176 Lakner [1988]177 Lakner [1995]178 Lakner
and Slud [1991]179 Lioui[1995]180 Liu [1999]181 Lynch and Balduzzi[1998]182
Pagès. [1987]183 Pikovsky and Karatzas [1995]184 Radner and Shepp [1995]185
Ruegg [1996]186 Schroder and Skiadas [1998]187 Schroder and Skiadas [1999]188
Schroder and Skiadas [1997]189 Sekine [1998]190 Sethi [1995]191 Sethi and
Taksar [1992]192 Sethi, Taksar, and Presman [1992]193 Sircar [1996]194
Taksar, Klass, and Assaf [1988]195 Tenney [1995]196 Tepla [1995]197 Tepla
[996a]198 Tepla [996b]199 Weerasinghe [1996]200Bibliography
Aase, K. (1984). Optimum Portfolio Diversification in a General Continuous Time
Model. Stochastic Processes and Their Application 18, 81–98.
Aase, K. (1993). Continuous Trading in an Exchange Economy under Discontinuous
Dynamics: A Resolution of the Equity Premium Puzzle. Scandinavian Journal of
Management 9, suppl., 3–28.
Aase, K. (1996a). An Equilibrium Approach to Derivative Securities: Stochastic Volatil-
ity and Survival.
Aase, K. (1996b). An Equilibrium Model of Catastrophe Insurance Futures and Spreads.
Abel, A. (1986). Stock Prices under Time-Varying Dividend Risk: An Exact Solution in
an Infinite-Horizon General Equilibrium Model. Working Paper, Wharton School,
University of Pennsylvania.
Acharya, S. and D. Madan (1993a). Arbitrage-Free Econometric Option Pricing Models
in an Incomplete Market with a Locally Risky Discount Factor. Working Paper,
Federal Reserve Board.
Acharya, S. and D. Madan (1993b). Idiosyncratic Risk, Borrowing Constraints and
Asset Prices. Working Paper, Barnard College.
Adler, M. and J. Detemple (1988). On the Optimal Hedge of a Non-Traded Cash Posi-
tion. Journal of Finance 43, 143–153.
Ahn, H. (1993). A Review on Stochastic Differential Utility. Working Paper, Mathe-
matics Department, Purdue University.
Ahn, H., M. Dayal, E. Grannan, and G. Swindle (1995). Option Replication with Trans-
action Costs: General Diffusion Limits. Working Paper, Department of Statistics
and Applied Probability, University of California, Santa Barbara.
Ait-Sahalia, F. and T. Lai (1997a). Valuation of Discrete Barrier and Hindsight Options.
Working Paper, Hewlett-Packard Laboratories.
Ait-Sahalia, F. and T. Lai (1997b). Random Walk Duality and the Valuation of Discrete
Lookback Options. Working Paper, Hewlett-Packard Laboratories.
Ait-Sahlia, F. (1995). Optimal Stopping and Weak Convergence Methods for Some
Problems in Financial Economics. Working Paper, Ph.D. diss., Operations Research
Department, Stanford University.362 BIBLIOGRAPHY
Ait-Sahlia, F. and T.-L. Lai (1998). Efficient Approximations to American Option
Prices, Hedge Parameters and Exercise Boundaries. Working Paper, Hewlett-
Packard Laboratories, Palo Alto, CA.
Aitsahlia, F. and T.-L. Lai (1996). Approximations for American Options.
Aiyagari, S. and M. Gertler (1990). Asset Returns with Transaction Costs and Unin-
sured Individual Risk: A Stage III Exercise. Working Paper, Federal Reserve Bank
of Minneapolis.
Akahari, J. (1993). Some Formulas for a New Type of Path-Dependent Option. Working
Paper, Department of Mathematics, University of Tokyo.
Akian, M., J.-L. Menaldi, and A. Sulem (1993). On an Investment-Consumption Model
with Transaction Costs. Working Paper, INRIA, Rocquencourt, France.
Akian, M., A. Sulem, and M. Taksar (1999). Dynamic Optimisation of a Long Term
Growth Rate for a Mixed Portfolio with Transaction Costs. The Logarithmic Utility
Case. Working Paper, INRIA Rocquencourt.
Aliprantis, C. and O. Burkinshaw (1985). Positive Operators. Orlando: Academic Press.
Allegretto, W., G. Barone-Adesi, and R. Elliott (1993). Numerical Evaluation of the
Critical Price and American Options. Working Paper, Department of Mathematics,
University of Alberta.
Allingham, M. (1991). Existence Theorems in the Capital Asset Pricing Model. Econo-
metrica 59, 1169–1174.
Altay, A., V. Nageswaran, and H. Kazemi (1995). Optimal Hedging Strategy When
Spot and Futures Prices Have Time-Varying Distributions. Working Paper, Salomon
Brothers, New York.
Alvarez, O. (1991). Gestion de Portefeuille Avec Coût de Transaction. Working Paper,
École Polytechnique.
Alvarez, O. and A. Tourin (1994). Viscosity Solutions of Nonlinear Integro-Differential
Equations. Working Paper, Université de Paris IX-Dauphine.
Amendinger, J. (1999). Martingale Representation Theorems for Initially Enlarged Fil-
trations. Working Paper, Technische Universität Berlin.
Amendinger, J., P. Imkeller, and M. Schweizer (1998). Additional Logarithmic Utility
of an Insider. Working Paper, Technische Universität Berlin.
Amin, K. (1991). On the Computation of Continuous Time Option Prices Using Discrete
Approximations. Journal of Financial and Quantitative Analysis 26, 477–495.
Amin, K. (1993a). Jump-Diffusion Option Valuation in Discrete-Time. Journal of Fi-
nance 48, 1833–1863.
Amin, K. (1993b). Option Valuation with Systematic Stochastic Volatility. Journal of
Finance 48, 881–910.
Amin, K. and R. Jarrow (1993). Pricing Options on Risky Assets in a Stochastic Interest
Rate Economy. Mathematical Finance 2, 217–237.
Amin, K. and A. Khanna (1994). Convergence of American Option Values from Discrete
to Continuous-Time Financial Models. Mathematical Finance 4, 289–304.BIBLIOGRAPHY 363
Amin, K. and A. Morton (1994a). A Comparison of Predictable Volatility Models Using
Option Data. Working Paper, Lehman Brothers.
Amin, K. and A. Morton (1994b). Implied Volatility Functions in Arbitrage-Free Term
Structure Models. Journal of Financial Economics 35, 141–180.
Amin, K. and V. Ng (1993). Options Valuation with Systematic Stochastic Volatility.
Journal of Finance 48, 881–909.
Andersen, L. (1995). Bivariate Binary Options. Working Paper, Research General Re
Financial Products Corp.
Andersen, L. (1996). Monte Carlo Simulation of Barrier and Lookback Options with
Continuous or High-Frequency Monitoring of the Underlying Asset. Working Paper,
General Re Financial Products Corp.
Andersen, L., J. Andreasen, and R. Brotherton-Ratcliffe (1997). The Passport Op-
tion. Working Paper, General Re Financial Products and Institute of Mathematics,
Aarhus University, Denmark.
Andersen, L. and R. Brotherton-Ratcliffe (1995). The Equity Option Volatility Smile:
An Implicit Finite Difference Approach. Working Paper, General Re Financial Prod-
ucts Corp.
Andreasen, J. (1996a). Fast and Accurate Pricing of Path Dependent Options: A Finite
Difference Approach. Working Paper, Department of Operations Research, Institute
of Mathematics, Aarhus University, Denmark.
Andreasen, J. (1996b). Implied Modelling: Stable Implementation, Hedging, and Dual-
ity. Working Paper, Department of Operations Research, Institute of Mathematics,
Aarhus University, Denmark.
Andreasen, J. and B. Gruenewald (1996). American Option Pricing in the Jump-
Diffusion Model. Working Paper, Aarhus University, Denmark.
Andreasen, J., B. Jensen, and R. Poulsen (1996). New Skin For the Old Ceremony: Eight
Different Derivations of the Black-Scholes Formula. Working Paper, Department of
Operations Research, Institute of Mathematics, Aarhus University, Denmark.
Ansel, J. and C. Stricker (1992). Quelques Remarques sur un theoreme de Yan. Working
Paper, Université de Franche-Comté.
Ansel, J. and C. Stricker (1993). Couverture des actifs contingents. Working Paper,
Laboratoire de Mathématiques - URA CNRS 741, UFR Science et Techniques.
Ansel, J. and C. Stricker (1994). Lois de Martingale, Densités et Decomposition de
Föllmer Schweizer. Working Paper, Université de Franche-Comté.
Antonelli, F. (1993). Backward-Forward Stochastic Differential Equations. Annals of
Applied Probability 3, 777–793.
Araujo, A. and P. Monteiro (1987). Generic Non-Existence of Equilibria in Finance
Models. Journal of Mathematical Economics 20, 489–501.
Araujo, A. and P. Monteiro (1989). Equilibrium Without Uniform Conditions. Journal
of Economic Theory 48, 416–427.
Araujo, A., P. Monteiro, and M. Páscoa (1996). Infinite Horizon Incomplete Markets
with a Continuum of States. Mathematical Finance 6, 119–132.364 BIBLIOGRAPHY
Arntzen, H. (1994). Solution to a Class of Stochastic Investment Problems Involving
Finite Variation Controls. Working Paper, Mathematics Institute, University of
Oslo.
Arrow, K. (1951). An Extension of the Basic Theorems of Classical Welfare Economics.
In J. Neyman (Ed.), Proceedings of the Second Berkeley Symposium on Mathemati-
cal Statistics and Probability, pp. 507–532. Berkeley: University of California Press.
Arrow, K. (1953). Le Rôle des valeurs boursières pour la repartition la meillure des
risques. Econometrie. Colloq. Internat. Centre National de la Recherche Scientifique
40 (Paris 1952), pp. 41–47; discussion, pp. 47–48, C.N.R.S. (Paris 1953). English
Translation in Review of Economic Studies 31 (1964), 91–96.
Arrow, K. (1970). Essays in the Theory of Risk Bearing. London: North-Holland.
Arrow, K. and G. Debreu (1954). Existence of an Equilibrium for a Competitive Econ-
omy. Econometrica 22, 265–290.
Artzner, P. (1995a). Approximate Completeness with Multiple Martingale Measures.
Mathematical Finance 5, 1–12.
Artzner, P. (1995b). References for the Numeraire Portfolio. Working Paper, Institut
de Recherche Mathématique Avancée Université Louis Pasteur et CNRS, et Labo-
ratoire de Recherche en Gestion.
Artzner, P. and D. Heath (1990). Completeness and Non-Unique Pricing. Working Pa-
per, Department of Operations Research, Cornell University.
Avellaneda, A. P.M. (1994). Hedging Derivatives in the Presence of Transaction Costs:
Non-Linear Diffusion Equation, Obstacle Problems and Non-Markovian Strategies.
Working Paper, Courant Institute of Mathematical Sciences, New York University.
Avellaneda, M. and A.P.A. Levy (1995). Pricing and Hedging Derivatives in Markets
with Uncertain Volatilities. Applied Mathematical Finance 2, 73–88.
Avellaneda, M. and A. Parás (1994). Hedging Derivatives in the Presence of Transac-
tion Costs: Non-Linear Diffusion Equation, Obstacle Problems and Non-Markovian
Strategies. Working Paper, Courant Institute of Mathematical Sciences, New York
University.
Babbs, S. and M. Selby (1996). Pricing by Arbitrage in Incomplete Markets. Working
Paper, Financial Options Research Centre, University of Warwick.
Bachelier, L. (1900). Théorie de la Speculation. Annales Scientifiques de L’École Nor-
male Supérieure 3d ser., 17, 21–88. Translation in The Random Character of Stock
Market Prices, ed. Paul Cootner, pp. 17–79. Cambridge, Mass.: MIT Press, 1964.
Back, K. (1986). Securities Market Equilibrium without Bankruptcy: Contingent Claim
Valuation and the Martingale Property. Working Paper, Center for Mathematical
Studies in Economics and Management Science, Northwestern University.
Back, K. (1991a). Asset Pricing for General Processes. Journal of Mathematical Eco-
nomics 20, 371–396.
Back, K., H. Cao, and G. Willard (1995). Imperfect Competition among Informed
Traders. Working Paper, Olin School of Business, Washington University in St.
Louis.BIBLIOGRAPHY 365
Back, K. and S. Pliska (1986). Discrete versus Continuous Trading in Securities Markets
with Net Worth Constraints. Working Paper, Center for Mathematical Studies in
Economics and Management Science, Northwestern University.
Back, K. and S. Pliska (1987). The Shadow Price of Information in Continuous Time
Decision Problems. Stochastics 22, 151–186.
Back, K. and S. Pliska (1991). On the Fundamental Theorem of Asset Pricing with an
Infinite State Space. Journal of Mathematical Economics 20, 1–18.
Bajeux-Besnainou, I. and R. Portait (1993). Dynamic Asset Allocation in a Mean-
Variance Framework. Working Paper, ESSEC and Laboratoire d’Econométrie de
L’École Polytechnique.
Bajeux-Besnainou, I. and R. Portait (1997a). Pricing Coningent Claims in incomplete
Markets using the Numeraire Portfolio. Working Paper.
Bajeux-Besnainou, I. and R. Portait (1997b). Pricing Contingent Claims in Incomplete
Markets Using the Numeraire Portfolio. Working Paper, George Washington Uni-
versity.
Bajeux-Besnainou, I. and J.-C. Rochet (1995). Dynamic Spanning: Are Options an
Appropriate Instrument? Working Paper, ESSEC, Cergy-Pontoise, France.
Bakshi, G., C. Cao, and Z. Chen (1997). Pricing and Hedging Long-Term Options.
Working Paper, Department of Finance, College of Business and Management, Uni-
versity of Maryland.
Bakshi, G. and Z. Chen (1995). An Alternative Valuation Equation for Contingent
Claims. Working Paper, Department of Economics and Finance, College of Business
Administration, University of New Orleans.
Bakshi, G. and D. Madan (1997a). Pricing Average-Rate Contingent Claims. Working
Paper, Department of Finance, College of Business and Management, University of
Maryland.
Bakshi, G. and D. Madan (1997b). A Simplified Approach to the Valuation of Options.
Working Paper, Department of Finance, College of Business and Management, Uni-
versity of Maryland.
Balasko, Y. (1989). Foundations of the Theory of General Equilibrium. New York: Aca-
demic Press.
Balasko, Y. and D. Cass (1986). The Structure of Financial Equilibrium with Exogenous
Yields: The Case of Incomplete Markets. Econometrica 57, 135–162.
Balasko, Y., D. Cass, and P. Siconolfi (1990). The Structure of Financial Equilibrium
with Exogenous Yields: The Case of Restricted Participation. Journal of Mathe-
matical Economics 19, 195–216.
Balduzzi, P. and A. Lynch (1997). Samuelson’s Irrelevance Result Reconsidered: The
Case of Transaction Costs. Working Paper, New York University.
Balduzzi, P. and A. Lynch (1998). Transaction Costs and Predictability: Some Utility
Cost Calculations. Working Paper, Boston College, MA.
Ball, C. and A. Roma (1994). Stochastic Volatility Option Pricing. Journal of Financial
and Quantitative Analysis 29, 589–607.366 BIBLIOGRAPHY
Ball, C. and W. Torous (1985). On Jumps in Common Stock Prices and Their Impact
on Call Option Pricing. The Journal of Finance 40, 155–173.
Bally, V. (1995). An Approximation Scheme for BSDE’s and Applications to Control
and Nonlinear PDE’s. Working Paper, Laboratoire De Statistique et Processus,
Universités du Maine et D’Angers.
Bally, V. and D. Talay (1995). The Law of the Euler Scheme for Stochastic Differential
Equations: II. Convergence Rate of the Density. Working Paper, Institut National
de Recherche en Informatique et en Automatique.
Banz, R. and M. Miller (1978). Prices for State-Contingent Claims: Some Evidence and
Applications. Journal of Business 51, 653–672.
Barberis, N., M. Huang, and T. Santos (1999). Prospect Theory and Asset Prices.
Working Paper, University of Chicago, Stanford University.
Barles, G., R. Buckdahn, and E. Pardoux (1995). BSDE’s and Integral-Partial Differ-
ential Equations. Working Paper, Université de Provence.
Barles, G., J. Burdeau, M. Romano, and N. Samsoen (1993). Estimation de la
frontière libre des options américaines au voisinage de l’echéance. Comtes Rendus
de l’Academie de Science de Paris 316-I, 171–174.
Barles, G., J. Burdeau, M. Romano, and N. Samsoen (1995). Critical Stock Price Near
Expiration. Mathematical Finance 2, 77–96.
Barles, G., C. Daher, and M. Romano (1992). Convergence of Numerical Schemes
for Parabolic Equations Arising in Finance Theory. Working Paper, Cahier 9244,
CEREMADE, Université de Paris.
Barles, G., M. Romano, and N. Touzi (1993). Contingent Claims and Market Com-
pleteness in a Stochastic Volatility Model. Working Paper, Département de
Mathématiques, Université de Tours, France.
Barles, G. and H. Soner (1996). Option Pricing with Transaction Costs and a Non-
linear Black-Scholes Equation. Working Paper, Faculté des Sciences et Techniques,
Université de Tours, Tours.
Barone-Adesi, G. and R. Elliott (1991). Approximations for the Values of American
Options. Stochastic Analysis and Applications 9, 115–131.
Barraquand, J. (1993). Numerical Valuation of High Dimensional Multivariate Euro-
pean Securities. Working Paper, Digital Research Laboratory, Paris.
Barraquand, J. and D. Martineau (1995). Numerical Valuation of High Dimensional
Multivariate American Securities. Journal of Financial and Quantitative Analysis
30, 383–??
Barraquand, J. and T. Pudet (1994). Pricing of American Path-Dependent Contingent
Claims. Working Paper, Digital Research Laboratory, Paris.
Basak, S. (1992). A General Equilibrium Model of Portfolio Insurance. Working Paper,
Graduate School of Industrial Administration, Carnegie Mellon University.
Basak, S. (1995). Dynamic Consumption-Portfolio Choice and Asset Pricing with Non-
Price-Taking Agents. Working Paper, The Wharton School of the University of
Pennsylvania.BIBLIOGRAPHY 367
Basak, S. and D. Cuoco (1995b). Testing Option Pricing Models. Working Paper, Rod-
ney L. White Center for Financial Research, Wharton School, University of Penn-
sylvania.
Basak, S. and D. Cuoco (1997). An Equilibrium Model with Restricted Stock Market
Participation. Working Paper, Wharton School, University of Pennsylvania.
Bates, D. (1994). Jumps and Stochastic Volatility: Exchange Rate Processes Implicit in
Deutschemark Options. Working Paper, The Wharton School, University of Penn-
sylvania.
Bates, D. (1995a). Post-87’Crash Fears in S-and-P 500 Futures Options. Working Paper,
Finance Department, Wharton School, University of Pennsylvania.
Bates, D. (1996). Jumps and Stochastic Volatility: Exchange Rate Processes Implicit
in Deutsche Mark Option. The Review of Financial Studies 9, 69–107.
Beaglehole, D. (1990). Tax Clienteles and Stochastic Processes in the Gilt Market.
Working Paper, Graduate School of Business, University of Chicago.
Becker, R. and J. Boyd (1992). Recursive Utility: Discrete Time Theory. Working Paper,
Department of Economics, Indiana University.
Beckers, S. (1981). Standard Deviations Implied in Option Process as Predictors of
Future Stock Price Variability. Journal of Banking and Finance 5, 363–382.
Beibel, M. and H. Lerche (1995). A New Look at Warrant Pricing and Related Opti-
mal Stopping Problems. Working Paper, Institute für Mathematische Stochastik,
University of Bonn.
Beibel, M. and H. Lerche (1997). A New Look at Optimal Stopping Problems Related
to Mathematical Finance. Statistica Sinica 7, 93–108.
Bellman, R. (1957). Dynamic Programming. Princeton, N.J.: Princeton University
Press.
Bensoussan, A. (1983). Lectures on Stochastic Control. In S. Mitter and A. Moro (Eds.),
Nonlinear Filtering and Stochastic Control, Lecture Notes in Mathematics, pp. 1–
62. New York: Springer-Verlag.
Bensoussan, A. (1984). On the Theory of Option Pricing. Acta Applicandae Mathemat-
icae 2, 139–158.
Bensoussan, A., M. Crouhy, and D. Galai (1995a). Black-Scholes Approximation of
Complex Option Values: The Cases of European Compound Call Options and
Equity Warrants. Working Paper, Université Paris Dauphine and INRIA, France.
Bensoussan, A., M. Crouhy, and D. Galai (1995b). Stochastic Equity Volatility Related
to the Leverage Effect II: Valuation of European Equity Options and Warrants.
Applied Mathematical Finance 2, 43–59.
Benveniste, L. and J. Scheinkman (1979). On the Differentiability of the Value Function
in Dynamic Models of Economics. Econometrica 47, 727–732.
Bergman, Y. (1985a). Option Pricing with Differential Interest Rates. The Review of
Financial Studies 8, 475–500.
Bergman, Y. (1985b). Time Preference and Capital Asset Pricing Models. Journal of
Financial Economics 14, 145–159.368 BIBLIOGRAPHY
Bergman, Y. (1995). Option Pricing with Differential Interest Rates. The Reveiw of
Financial Studies 8, 475–500.
Bergman, Y., B. Grundy, and Z. Wiener (1996). General Properties of Option Prices.
Working Paper, Rodney L. White Center for Financial Research, Wharton School
of the University of Pennsylvania.
Berk, J. (1992). The Necessary and Sufficient Conditions that Imply the CAPM. Work-
ing Paper, Faculty of Commerce, University of British Columbia, Canada.
Berk, J. (1994). Necessary Conditions for the CAPM. Working Paper, Faculty of Com-
merce, University of British Columbia.
Berk, J. and H. Uhlig (1993). The Timing of Information in a General Equilibrium
Framework. Journal of Economic Theory 59, 275–287.
Bernard, P., D. Talay, and L. Tubaro (1993). Rate of Convergence of a Stochastic
Particle Method for the Kolmogorov Equation with Variable Coefficients. Working
Paper, INRIA, Sophia-Antipolis, France.
Bertsekas, D. (1976). Dynamic Programming and Stochastic Control. New York: Aca-
demic Press.
Bertsekas, D. and S. Shreve (1978). Stochastic Optimal Control: The Discrete Time
Case. New York: Academic Press.
Bertsimas, D., L. Kogan, and A. Lo (1998). When is Time Continuous? Working Paper,
MIT Sloan School of Management.
Bewley, T. (1972). Existence of Equilibria in Economies with Infinitely Many Com-
modities. Journal of Economic Theory 4, 514–540.
Bewley, T. (1982). Thoughts on Volatility Tests of the Intertemporal Asset Pricing
Model. Working Paper, Department of Economics, Northwestern University.
Bick, A. (1986). On Viable Diffusion Price Processes. Journal of Finance 45, 673–689.
Bick, A. (1988). Producing Derivative Assets with Forward Contracts. Journal of Fi-
nancial and Quantitative Analysis 2, 153–160.
Bick, A. (1993). Quadratic Variation Based Dynamic Strategies. Working Paper, Fac-
ulty of Business Administration, Simon Fraser University, Vancouver, Canada.
Bick, A. (1994). Futures Pricing via Futures Strategies. Working Paper, Faculty of
Business Administration, Simon Fraser University, Vancouver, Canada.
Bick, A. (1997). Two Closed-Form Formulas for the Futures Price in the Presence of a
Quality Option. European Finance Review 1, 81–104.
Bick, A. and H. Reisman (1993). Generalized Implied Volatility. Working Paper, Faculty
of Business Administration, Simon Fraser University, Vancouver, Canada.
Bick, A. and W. Willinger (1994). Dynamic Spanning without Probabilities. Stochastic
Processes and Their Applications 50, 349–374.
Billingsley, P. (1986). Probability and Measure (2d ed.). New York: Wiley.
Bjerksund, P. and G. Stensland (1993). Closed-Form Approximation of American Op-
tions. Scandinavian Journal of Management 9, S87–S99.BIBLIOGRAPHY 369
Black, F. (1972). Capital Market Equilibrium with Restricted Borrowing. Journal of
Business 45, 444–454.
Black, F. (1976). The Pricing of Commodity Contracts. Journal of Financial Economics
3, 167–179.
Black, F. (1990). Mean Reversion and Consumption Smoothing. Review of Financial
Studies 3, 107–114.
Black, F. (1995). Exploring General Equilibrium. Cambridge: MIT Press.
Black, F., E. Derman, and W. Toy (1990). A One-Factor Model of Interest Rates and
Its Application to Treasury Bond Options. Financial Analysts Journal January–
February, 33–39.
Black, F. and M. Scholes (1973). The Pricing of Options and Corporate Liabilities.
Journal of Political Economy 81, 637–654.
Blackwell, D. (1965). Discounted Dynamic Programming. Annals of Mathematical
Statistics 36, 226–235.
Blume, L., D. Easley, and M. O’Hara (1982). Characterization of Optimal Plans for
Stochastic Dynamic Programs. Journal of Economic Theory 28, 221–234.
Bollerslev, T., R. Chou, and K. Kroner (1992). ARCH Modeling in Finance: A Review
of the Theory and Empirical Evidence. Journal of Econometrics 52, 5–59.
Bonomo, M. and R. Garcia (1993). Disappointment Aversion as a Solution to the Equity
Premium and the Risk-Free Rate Puzzles. Working Paper, CRDE 2793. Université
de Montréal.
Bossaerts, P., E. Ghysels, and C. Gouriéroux (1996). Arbitrage-Based Pricing
When Volatility Is Stochastic. Working Paper, California Institute of Technology,
Pasadena.
Bossaerts, P. and P. Hillion (1994). Local Parametric Analysis of Hedging in Discrete
Time. Working Paper, California Institute of Technology, Pasadena, and Tilburg
University, The Netherlands.
Bottazzi, J., T. Hens, and A. Löffler (1994). Market Demand Functions in the CAPM.
Working Paper, Delta, Université de Paris.
Bottazzi, J.-M. (1995). Existence of Equilibria with Incomplete Markets: The Case of
Smooth Returns. Journal of Mathematical Economics 24, 59–72.
Bottazzi, J.-M. and T. Hens (1993). Excess Demand Funtions and Incomplete Markets.
Working Paper, CERMSEM, Harvard University.
Bottazzi, J.-M. and A. Hueffmann (1999). FX Derivatives with Pre-Announced Peg:
EMU Ins. Working Paper, Credit Suisse First Boston.
Bouleau, N. and D. Lamberton (1993). Residual Risks and Hedging Strategies in Marko-
vian Markets. Working Paper, CERMA-ENPC, Paris, France.
Bouleau, N. and D. Lépingle (1994). Numerical Methods for Stochastic Processes. New
York: Wiley.
Boyle, P. (1977). Options: A Monte Carlo Approach. Journal of Financial Economics
4, 323–338.370 BIBLIOGRAPHY
Boyle, P. (1988). A Lattice Framework for Option Pricing with Two State Variables.
Journal of Financial and Quantitative Analysis 23, 1–12.
Boyle, P. (1990). Valuation of Derivative Securities Involving Several Assets Using Dis-
crete Time Methods. Working Paper, Accounting Group, University of Waterloo,
Waterloo, Canada.
Boyle, P., M. Broadie, and P. Glasserman (1997). Monte Carlo Methods for Security
Pricing. Journal of Economic Dynamics and Control 21, 1267–1321.
Boyle, P., J. Evnine, and S. Gibbs (1989). Numerical Evaluation of Multivariate Con-
tingent Claims. Review of Financial Studies 2, 241–250.
Boyle, P. and X. Lin (1998). Bounds on Contingent Claims Based on Several Assets.
Working Paper, Center for Advanced Studies in Finance, University of Waterloo,
Waterloo, Ontario.
Boyle, P. and T. Vorst (1992). Options Replication in Discrete Time with Transaction
Costs. Journal of Finance 47, 271–293.
Boyle, P. and T. Wang (1999). Valuation of New Securities in an Incomplete Market:
the Catch of Derivative Pricing. Working Paper, School of Accountancy, University
of Waterloo.
Boyle, P. and H. Yang (1995). Asset Allocation with Time Variation in Expected Re-
turns. Working Paper, School of Accountancy, University of Waterloo, Ontario.
Brace, A. (1996). Non-Bushy Trees for Gaussian HJM and Lognormal Forward Models.
Working Paper, School of Mathematics, UNSW, Australia.
Bray, M. (1994a). The Arbitrage Pricing Theory is Not Robust 1: Variance Matrices
and Portfolio Theory in Pictures. Working Paper, London School of Economics.
Bray, M. (1994b). The Arbitrage Pricing Theory is Not Robust 2: Factor Structure and
Factor Pricing. Working Paper, London School of Economics.
Breeden, D. (1979). An Intertemporal Asset Pricing Model with Stochastic Consump-
tion and Investment Opportunities. Journal of Financial Economics 7, 265–296.
Breeden, D. (1986). Consumption, Production, Inflation and Interest Rates. Journal of
Financial Economics 16, 3–39.
Breeden, D., M. Gibbons, and R. Litzenberger (1989). Empirical Tests of the Consump-
tion Oriented CAPM. Journal of Finance 44, 231–262.
Breeden, D. and R. Litzenberger (1978). Prices of State-Contingent Claims Implicit in
Option Prices. Journal of Business 51, 621–651.
Brennan, M. and E. Schwartz (1977). The Valuation of American Put Options. Journal
of Finance 32, 449–462.
Brennan, M. and E. Schwartz (1980b). Analyzing Convertible Bonds. Journal of Fi-
nancial and Quantitative Analysis 10, 907–929.
Brennan, M., E. Schwartz, and R. Lagnado (1993). Strategic Asset Allocation. Working
Paper, Anderson School of Management, University of California, Los Angeles.
Broadie, M., J. Cvitanić, and H. Soner (1996). Optimal Replication of Contingent
Claims Under Portfolio Constraints. Working Paper, Graduate School of Business,
Columbia University.BIBLIOGRAPHY 371
Broadie, M. and J. Detemple (1993a). Bounds and Approximations for American Option
Values. Working Paper, Graduate School of Business, Columbia University.
Broadie, M. and J. Detemple (1993b). The Valuation of American Options on Multiple
Assets. Working Paper, Graduate School of Business, Columbia University.
Broadie, M. and J. Detemple (1994). American Option Valuation: New Bounds, Ap-
proximations, and a Comparison of Existing Methods. Working Paper, Graduate
School of Business, Columbia University. Forthcoming in Review of Financial Stud-
ies.
Broadie, M. and J. Detemple (1995). American Capped Call Options on Dividend-
Paying Assets. Review of Financial Studies 8, 161–191.
Broadie, M. and P. Glasserman (1996). Estimating Security Price Derivatives Using
Simulation. Management Science 42, 269–285.
Broadie, M. and P. Glasserman (1997). Pricing American Style Securities Using Simu-
lation. Journal of Economic Dynamics and Control 21, 1323–1353.
Broadie, M. and P. Glasserman (1998). A Stochastic Mesh Method for Pricing High
Dimensional American Options. Working Paper, Graduate School of Business,
Columbia University, New York, NY.
Broadie, M., P. Glasserman, and S. Kou (1996). Connecting Discrete and Continuous
Path-Dependent Options. Working Paper, Graduate School of Business, Columbia
University, New York.
Broadie, M., P. Glasserman, and S. Kou (1997). A Continuity Correction for Discrete
Barrier Options. Mathematical Finance 7, 325–350.
Brock, W. (1979). An Integration of Stochastic Growth Theory and the Theory of Fi-
nance, Part I: The Growth Model, pp. 165–192. New York: Academic Press.
Brock, W. (1982). Asset Prices in a Production Economy, pp. 1–46. Chicago: University
of Chicago Press.
Brown, D., P. DeMarzo, and C. Eaves (1993a). Computing Equilibria when Asset Mar-
kets are Incomplete. Working Paper, Department of Economics, Stanford Univer-
sity, forthcoming: Econometrica.
Brown, D., P. DeMarzo, and C. Eaves (1993b). Computing Zeros of Sections Vector
Bundles Using Homotopies and Relocalization. Working Paper, Department of Op-
erations Research, Stanford University, forthcoming: Mathematics of Operations
Research.
Brown, D. and M. Gibbons (1985). A Simple Econometric Approach for Utility-Based
Asset Pricing Models. Journal of Finance 40, 359–381.
Buckdahn, R. (1995a). Backward Stochastic Differential Equations Driven by a Martin-
gale. Working Paper, FB Mathematik der Humboldt-Universität zu Berlin, Berlin.
Buckdahn, R. (1995b). BSDE with Non-Square Integrable Terminal Value—FBSDE
with Delay. Working Paper, Faculté des Sciences, Département de Mathématiques,
Université de Bretagne Occidentale, Brest, France.372 BIBLIOGRAPHY
Buckdahn, R. and Y. Hu (1995b). Pricing of American Contingent Claims with
Jump Stock Price and Constrained Portfolios. Working Paper, Département de
Mathématiques, Université de Bretagne Occidentale.
Buhlmann, H., F. Delbaen, P. Embrechts, and A. Shyriayev (1996). Fundamental The-
orem of Asset Pricing Esscher Transform and Change of Measure in The Finite
Horizon Discrete Multiperiod Model. Working Paper, ETH Zurich and Moscow
University.
Bunch, D. and H. Johnson (1993). A Simple and Numerically Efficient Valuation
Method for American Puts Using a Modified Geske-Johnson Approach. Journal
of Finance 47, 809–816.
Cadenillas, A. and S. Pliska (1996). Optimal Trading of a Security When There Are
Taxes and Transaction Costs. Working Paper, Department of Mathematical Sci-
ences, University of Alberta.
Caflisch, R. and W. Morokoff (1995). Quasi-Monte Carlo Computation of a Finance
Problem. Working Paper, Department of Mathematics, University of California,
Los Angeles.
Caflisch, R. and W. Morokoff (1996). Valuation of Mortgage Backed Securities Using
the Quasi-Monte Carlo Method. Working Paper, Department of Mathematics, Uni-
versity of California, Los Angeles.
Caflisch, R., W. Morokoff, and A. Owen (1997). Valuation of Mortgage Backed Se-
curities Using Brownian Bridges to Reduce Effective Dimension. Working Paper,
Mathematics Department, UCLA.
Calvet, L. (1999). Incomplete Markets and Volatility. Working Paper, Department of
Economics, Littauer Center, Cambridge, MA.
Campbell, J. (1984). Bond and Stock Returns in a Simple Exchange Model. Working
Paper, Department of Economics, Princeton University.
Campbell, J. (1990). Intertemporal Asset Pricing without Consumption. Working Pa-
per, Department of Economics, Princeton University.
Carassus, L. and E. Jouini (1995). Investment Opportunities, Shortsale Constraints and
Arbitrage. Working Paper, CREST-ENSAE, Laboratoire de Finance-Assurance et
CERMSEM, Université de Paris I Panthéon-Sorbonne.
Carr, P. (1989). European Option Valuation When Carrying Costs are Unknown. Work-
ing Paper, Johnson Graduate School of Management, Cornell University.
Carr, P. (1991). Deriving Derivatives of Derivative Securities. Working Paper, Johnson
Graduate School of Management, Cornell University.
Carr, P. (1993). Valuing Bond Futures and the Quality Option. Working Paper, Johnson
Graduate School of Management, Cornell University.
Carr, P. (1993b). European Put Call Symmetry. Working Paper, Johnson Graduate
School of Management, Cornell University.
Carr, P. (1994). On Approximations for the Values of American Options. Working
Paper, Johnson Graduate School of Management, Cornell University.BIBLIOGRAPHY 373
Carr, P. (1995). Two Extensions to Barrier Option Valuation. Applied Mathematical
Finance 2, 173–209.
Carr, P. (1996). Randomization and the American Put. Working Paper, Morgan Stanley,
New York.
Carr, P. and R.-R. Chen (1993). Valuing Bond Futures and the Quality Option. Working
Paper, Johnson Graduate School of Management, Cornell University.
Carr, P. and K. Ellis (1994). Non-Standard Valuation of Barrier Options. Working
Paper, Johnson Graduate School of Management, Cornell University.
Carr, P. and D. Faguet (1994). Fast Accurate Valuation of American Options. Working
Paper, Johnson Graduate School of Management, Cornell University.
Carr, P. and D. Faguet (1996). Valuing Finite-Lived Options as Perpetual. Working
Paper, Johnson School of Management, Cornell University.
Carr, P. and R. Jarrow (1990). The Stop-Loss Start-Gain Paradox and Option Valu-
ation: A New Decomposition into Intrinsic and Time Value. Review of Financial
Studies 3, 469–492.
Carr, P., R. Jarrow, and R. Myneni (1992). Alternative Characterizations of American
Put Options. Mathematical Finance 2, 87–106.
Carr, P. and D. Madan (1998). Option Valuation Using the Fast Fourier Transform.
Working Paper, Morgan Stanley, New York, NY.
Cass, D. (1984). Competitive Equilibria in Incomplete Financial Markets. Working Pa-
per, Center for Analytic Research in Economics and the Social Sciences, University
of Pennsylvania.
Cass, D. (1989). Sunspots and Incomplete Financial Markets: The Leading Example. In
G. Feiwel (Ed.), The Economics of Imperfect Competition and Employment: Joan
Robinson and Beyond, pp. 677–693. London: Macmillan.
Cass, D. (1991). Incomplete Financial Markets and Indeterminacy of Financial Equi-
librium. In J.-J. Laffont (Ed.), Advances in Economic Theory, pp. 263–288. Cam-
bridge: Cambridge University Press.
Cassese, G. (1996). An Elementary Remark on Martingale Equivalence and the Fun-
damental Theorem of Asset Pricing. Working Paper, Istituto di Economia Politica,
Università Commerciale “Luigi Bocconi,” Milan.
Chae, S. (1988). Existence of Equilibria in Incomplete Markets. Journal of Economic
Theory 44, 9–18.
Chalasani, P., S. Jha, and A. Varikooty (1997). Accurate Approximations for European
Asian Options. Working Paper, Carnegie Mellon University.
Chamberlain, G. (1988). Asset Pricing in Multiperiod Securities Markets. Econometrica
56, 1283–1300.
Chang, F.-R. (1993). Adjustment Costs, Optimal Investment and Uncertainty. Working
Paper, Department of Economics, Indiana University.
Chapman, D. (1995). Habit Formation, Aggregate Consumption, and State-Prices.
Working Paper, Department of Finance, Graduate School of Business, University374 BIBLIOGRAPHY
of Texas at Austin and W.E. Simon Graduate School of Business Administration,
University of Rochester.
Chapman, D. (1997). Habit Formation and Aggregate Consumption. Working Paper, Fi-
nace Department, Graduate School of Business, The University of Texas at Austin.
Forthcoming in Econometrica.
Chapman, D. (1998). Habit Formation, Consumption, and State-Prices. Econometrica.
Charretour, F., R. Elliott, R. Myneni, and R. Viswanathan (1992). American Option
Valuation Notes. Working Paper, Oberwohlfach Institute, Oberwohlfach, Germany.
Chavella, D. (1994). Numerical Error in Monte Carlo Simulations of Log-Normal Pro-
cesses. Working Paper, BARRA, Oakland, California.
Chen, R.-R. and L. Scott (1992a). Pricing Interest Rate Options in a Two-Factor Cox-
Ingersoll-Ross Model of the Term Structure. Review of Financial Studies 5, 613–
636.
Chen, R.-R. and L. Scott (1992b). Maximum Likelihood Estimation for a Multi-Factor
Equilibrium Model of the Term Structure of Interest Rates. Working Paper, De-
partment of Finance, Rutgers University.
Chen, R.-R. and L. Scott (1993a). Multi-Factor Cox-Ingersoll-Ross Models of the Term
Structure: Estimates and Tests from a State-Space Model Using a Kalman Filter.
Working Paper, Department of Finance, Rutgers University.
Chen, Z.-W. (1994). Viable Costs and Equilibrium Prices in Frictional Securities Mar-
kets. Working Paper, Graduate School of Business, University of Wisconsin.
Cherian, J. and R. Jarrow (1993). Options Markets, Self-Fulfilling Prophecies, and
Implied Volatilities. Working Paper, School of Management, Boston University.
Chernoff, H. and A. Petkau (1984). Numerical Methods for Bayes Sequential Decisions
Problems. Working Paper, Technical Report 34. Statistics Center, Massachusetts
Institute of Technology.
Chesney, M., M. Jeanblanc, and M. Yor (1994). Parisian Options and Excursions The-
ory. Working Paper, Groupe HEC, Department of Finance and Economics.
Chevance, D. (1995). Discrétisation des Équations Différentielles Stochastiques
Rétrogrades. Working Paper, I.N.R.I.A.
Chevance, D. (1996). Discretization of Pardoux-Peng’s Backward Stochastic Differential
Equations. Working Paper, Université de Provence.
Chew, S.-H. (1983). A Generalization of the Quasilinear Mean with Applications to
the Measurement of Income Inequality and Decision Theory Resolving the Allais
Paradox. Econometrica 51, 1065–1092.
Chew, S.-H. (1989). Axiomatic Utility Theories with the Betweenness Property. Annals
of Operations Research 19, 273–298.
Chew, S.-H. and L. Epstein (1991). Recursive Utility under Uncertainty. In A. Khan and
N. Yannelis (Eds.), Equilibrium Theory with an Infinite Number of Commodities,
pp. 353–369. New York: Springer-Verlag.BIBLIOGRAPHY 375
Chiarella, C. and N.E. Hassan (1996). Evaluation of Derivative Security Prices in the
Heath-Jarrow-Morton Framework as Path Integrals. Working Paper, School of Fi-
nance and Economics, University of Technology, Sidney.
Chidambaran, N. and S. Figlewski (1995). Streamlining Monte-Carlo Simulation with
the Quasi-Analytic Method: An Analysis of a Path-Dependent Option Strategy.
The Journal of Derivatives 3, 29–51.
Choulli, T., L. Krawczyk, and C. Stricker (1997). E-Martingales and Their Applications
in Mathematical Finance. Working Paper, Laboratoire de Mathématiques, CNRS,
Besano̧n.
Chow, Y. and H. Teicher (1978). Probability Theory: Independence Interchangeability
Martingales. New York: Springer-Verlag.
Christensen, B.J. (1991). Statistics for Arbitrage-Free Asset Pricing. Working Paper,
Department of Finance, New York University.
Christensen, P. (1987). An Intuitive Approach to the Harrison and Kreps Concept of
Arbitrage Pricing for Continuous Time Diffusions. Working Paper, Department of
Management, Odense University, Denmark.
Christensen, P., S. Graversen, and K. Miltersen (1996). Dynamic Spanning in the
Consumption-Based Capital Asset Pricing Model. Working Paper, Department of
Management, Odense University, Denmark.
Chuang, C. (1994). Joint Distribution of Brownian Motion and Its Maximum, with a
Generalization to Correlated BM and Applications to Barrier Options. Working
Paper, Department of Statistics, Stanford University.
Chung, K.-L. (1974). A Course in Probability Theory (2d ed.). New York: Academic
Press.
Chung, K.L. and R. Williams (1990). An Introduction to Stochastic Integration (2d ed.).
Boston: Birkhäuser.
Citanna, A., A. Kajii, and A. Villanacci (1994). Constrained Suboptimality in Incom-
plete Markets: A General Approach and Two Applications. Working Paper, Center
for Analytic Research in Economics and the Social Sciences, University of Pennsyl-
vania.
Citanna, A. and A. Villanacci (1993). On Generic Pareto Improvement in Competitive
Economies with Incomplete Asset Structure. Working Paper, Center for Analytic
Research in Economics and the Social Sciences, University of Pennsylvania.
Clark, S. (1993). The Valuation Problem in Arbitrage Price Theory. Journal of Math-
ematical Economics 22, 463–478.
Clarke, N. and K. Parrott (1996). The Multigrid solution of Two-factor American Put
Options. Working Paper, Oxford University Computing Laboratory.
Clelow, L. (1990). Finite Difference Techniques for One and Two Dimensional Option
Valuation Problems. Working Paper, Financial Options Research Center, University
of Warwick.
Clelow, L. and A. Carverhill (1992). Efficient Monte Carlo Valuation and Hedging of
Contingent Claims. Working Paper, Financial Options Research Centre, University
of Warwick.376 BIBLIOGRAPHY
Clelow, L. and A. Carverhill (1995). A Note on the Efficiency of the Binomial Option
Pricing Model. Working Paper, Financial Options Research Center, University of
Warwick.
Clelow, L. and S. Hodges (1996). Optimal Delta-Hedging Under Transactions Costs.
Working Paper, Financial Options Research Center, University of Warwick.
Clelow, L., K. Pang, and C. Strickland (1997b). Numerical Procedures for Pricing In-
terest Rate Exotics Using Markovian Short Rate Models. Working Paper, Financial
Options Research Centre, Warwick Business Schoolk Universtiy of Warwick.
Clelow, L. and C. Strickland (1996). Monte Carlo Valuation of Interest Rate Derivatives
under Stochastic Volatility. Working Paper, Financial Options Research Certer,
University of Warwick.
Clewlow, L. (1990). Finite Difference Techniques for One and Two Dimensional Option
Valuation Problems.
Clewlow, L. and A. Carverhill (1992). Efficient Monte Carlo Valuation and Hedging of
Contingent Claims. Working Paper, Financial Options Research Center, University
of Warwick.
Clewlow, L. and A. Carverhill (1995). A Note on the Efficiency of the Binomial Option
Pricing Model. Working Paper, Financial Options Research Center, University of
Warwick.
Clewlow, L. and S. Hodges (1996). Optimal Delta-Hedging Under Transactions Costs.
Working Paper, Financial Options Research Center, University of Warwick.
Clewlow, L. and C. Strickland (1996). Monte Carlo Valuation of Interest Rate Deriva-
tives under Stochastic Volatility. Working Paper, Financial Options Research Cen-
ter, University of Warwick.
Constantinides, G. (1982). Intertemporal Asset Pricing with Heterogeneous Consumers
and without Demand Aggregation. Journal of Business 55, 253–267.
Constantinides, G. (1986). Capital Market Equilibrium with Transactions Costs. Jour-
nal of Political Economy 94, 842–862.
Constantinides, G. (1990). Habit Formation: A Resolution of the Equity Premium
Puzzle. Journal of Political Economy 98, 519–543.
Constantinides, G. (1993). Option Pricing Bounds with Transactions Costs. Working
Paper, Graduate School of Business, University of Chicago.
Constantinides, G. and D. Duffie (1996). Asset Pricing with Heterogeneous Consumers.
Journal of Political Economy 104, 219–240.
Constantinides, G. and T. Zariphopoulou (1999). Bounds on Prices of Contingent
Claims in an Intertemporal Economy with Proportional Transaction Costs and
General Preferences. Finance and Stochastics 3, 345–369.
Conze, A. and R. Viswanathan (1991a). Probability Measures and Numeraires. Working
Paper, CEREMADE, Université de Paris.
Conze, A. and R. Viswanathan (1991b). Path Dependent Options: The Case of Look-
back Options. Journal of Finance 5, 1893–1907.BIBLIOGRAPHY 377
Cornell, B. (1981). The Consumption Based Asset Pricing Model. Journal of Financial
Economics 9, 103–108.
Corradi, V. (1997). Degenerate Continuous Time Limits of GARCH and GARCH-type
Processes. Working Paper, University of Pennsylvania, Department of Economics.
Courtadon, G. (1982). The Pricing of Options on Default-Free Bonds. Journal of Fi-
nancial and Quantitative Analysis 17, 75–100.
Cover, T. and E. Ordentlich (1996). Universal Portfolios with Side Information. IEEE
Transactions on Information Theory 42, 348–363.
Cox, J. (1983). Optimal Consumption and Portfolio Rules When Assets Follow a Dif-
fusion Process. Working Paper, Graduate School of Business, Stanford University.
Cox, J. and C.-F. Huang (1989). Optimal Consumption and Portfolio Policies When
Asset Prices Follow a Diffusion Process. Journal of Economic Theory 49, 33–83.
Cox, J. and C.-F. Huang (1991). A Variational Problem Arising in Financial Economics
with an Application to a Portfolio Turnpike Theorem. Journal of Mathematical
Economics 20, 465–488.
Cox, J. and C.-F. Huang (1992). A Continuous-Time Portfolio Turnpike Theorem. Jour-
nal of Economic Dynamics and Control 16, 491–508.
Cox, J., J. Ingersoll, and S. Ross (1981b). The Relation between Forward Prices and
Futures Prices. Journal of Financial Economics 9, 321–346.
Cox, J., J. Ingersoll, and S. Ross (1985). A Theory of the Term Structure of Interest
Rates. Econometrica 53, 385–408.
Cox, J., J. Ingersoll, and S. Ross (1985b). An Intertemporal General Equilibrium Model
of Asset Prices. Econometrica 53, 363–384.
Cox, J. and S. Ross (1976). The Valuation of Options for Alternative Stochastic Pro-
cesses. Journal of Financial Economics 3, 145–166.
Cox, J., S. Ross, and M. Rubinstein (1979). Option Pricing: A Simplified Approach.
Journal of Financial Economics 7, 229–263.
Cox, J. and M. Rubinstein (1985). Options Markets. Englewood Cliffs, N.J.: Prentice-
Hall.
Cuoco, D. (1994). Optimal Policies and Equilibrium Prices with Portfolio Cone Con-
straints and Stochastic Labor Income. Working Paper, Wharton School, University
of Pennsylvania.
Cuoco, D. (1995). Optimal Consumption and Equilibrium Prices with Portfolio Con-
straints and Stochastic Income. Working Paper, Wharton School, University of
Pennsylvania, Philadelphia.
Cuoco, D. and J. Cvitanić (1995). Optimal Consumption Choices for a ‘Large’ Investor.
Working Paper, Wharton School of University of Pennsylvania.
Cuoco, D. and H. He (1992a). Dynamic Aggregation and Computation of Equilibria in
Finite-Dimensional Economies with Incomplete Financial Markets. Working Paper,
Haas School of Business, University of California, Berkeley.378 BIBLIOGRAPHY
Cuoco, D. and H. He (1992b). Dynamic Equilibrium in Infinite-Dimensional Economies
with Incomplete Financial Markets. Working Paper, Wharton School, University of
Pennsylvania.
Cuoco, D. and H. Liu (1997). Optimal Consumption of a Durable Good Under Pro-
portional Adjustment Costs. Working Paper, Wharton School, Department of Eco-
nomics, University of Pennsylvania.
Cuoco, D. and F. Zapatero (1997). On the Recoverability of Preferences and Beliefs in
Financial Models. Working Paper, Wharton School, University of Pennsylvania.
Curran, M. (1996). Adaptive Importance Sampling for Pricing Path Dependent Options.
Working Paper, Banque Paribas, London.
Cutland, N., P. Kopp, and W. Willinger (1991). A Nonstandard Approach to Option
Pricing. Mathematical Finance 1, 1–38.
Cutland, N., P. Kopp, and W. Willinger (1993). Stock Price Returns and the Joseph
Effect: Fractional Version of the Black-Scholes Model. Working Paper, School of
Mathematics, University of Hull, England.
Cutland, N., P. Kopp, and W. Willinger (1993b). From Discrete to Continuous Financial
Models: New Convergence Results for Options Pricing. Mathematical Finance 3,
101–124.
Cvitanić, J. (1994). Optimal Trading Under Constraints. Working Paper, Department
of Statistics, Columbia University, New York.
Cvitanić, J. (1995). Nonlinear Financial Markets: Hedging and Portfolio Optimization.
Working Paper, Department of Statistics, Columbia University, New York.
Cvitanić, J. (1998). Methods of Partial Hedging. Asia Pacific Financial Markets 00,
1–28.
Cvitanić, J. and I. Karatzas (1992). Convex Duality in Constrained Portfolio Optimiza-
tion. Annals of Applied Probability 2, 767–818.
Cvitanić, J. and I. Karatzas (1993). Hedging Contingent Claims with Constrained Port-
folios. Annals of Applied Probability 3, 652–681.
Cvitanić, J. and I. Karatzas (1994). On Portfolio Optimization under ‘Drawdown’ Con-
straints. Working Paper, Institute for Mathematics and Its Applications, University
of Minnesota.
Cvitanić, J. and I. Karatzas (1995). Backward Stochastic Differential Equations with
Reflection and Dynkin Games. Working Paper, Department of Statistics, Columbia
University, New York.
Cvitanić, J. and I. Karatzas (1996). Hedging and Portfolio Optimization under Trans-
action Costs: A Martingale Approach. Mathematical Finance 6, 133–165.
Cvitanić, J., I. Karatzas, and H. Soner (1998). Backward Stochastic Differential Equa-
tions with Constraints on the Gains-Process. The Annals of Probability 26, 1522–
1551.
Cvitanić, J. and J. Ma (1994). Hedging Options for a Large Investor and Forward-
Backward SDEs. Working Paper, Department of Statistics, Columbia University.BIBLIOGRAPHY 379
Daigler, R. (1993). Financial Futures Markets. New York: Harper Collins.
Dalang, R., A. Morton, and W. Willinger (1990). Equivalent Martingale Measures and
No-Arbitrage in Stochastic Securities Market Models. Stochastics and Stochastics
Reports 29, 185–201.
Dana, R.-A. (1993a). Existence, Uniqueness and Determinacy of Arrow-Debreu Equi-
libria in Finance Models. Journal of Mathematical Economics 22, 563–580.
Dana, R.-A. (1993b). Existence and Uniqueness of Equilibria when Preferences are
Additively Separable. Econometrica 61, 953–958.
Dana, R.-A. and M. Pontier (1990). On the Existence of a Stochastic Equilibrium.
Working Paper, Université de Paris VI, Paris.
Dana, R.-A. and C.L. Van (1995). Asset Equilibria in Lp
Spaces with Complete Markets:
A Duality Approach. Working Paper, Gremaq, Université des Sciences Sociales,
Toulouse.
Dana, R.-A. and C.L. Van (1996). Arbitrage, Duality and Asset Equilibria. Working
Paper, Ceremade, Place du maréchal De Lattre de Tassigny, Paris.
Darling, R. (1994). Constructing Gamma-Martingales with Prescribed Limit, Using
Backward SDE. Working Paper, Université de Provence, Marseilles.
Dash, J. (1989). Path Integrals and Options-I. Working Paper, Financial Strategies
Group, Merrill Lynch Capital Markets, New York.
Dassios, A. (1994). The Distribution of the Quantiles of a Brownian Motion with Drift
and the Pricing of Related Path-Dependent Options. Working Paper, Department
of Statistics, London School of Economics.
Davis, M. (1993). Review of ‘Controlled Markov Processes and Viscosity Solutions’ by
W. Fleming and H. Soner. Forthcoming in AMS Bulletin. Working Paper, Imperial
College, University of London.
Davis, M. and M. Clark (1993). Analysis of Financial Models including Transactions
Costs. Working Paper, Imperial College, University of London.
Davis, M. and H.-F. List (1996). Establishing a Robust Risk Management Strategy for
Your Portfolio. Working Paper, Mitsubishi Finance International, London.
Davis, M. and A. Norman (1990). Portfolio Selection with Transaction Costs. Mathe-
matics of Operations Research 15, 676–713.
Davis, M., A. Panas, and T. Zariphopoulou (1993). European Option Pricing with
Transaction Costs. SIAM Journal of Control and Optimization 31, 470–493.
Davis, M. and V. Panas (1991). European Option Pricing with Transaction Costs.
Working Paper, Proceedings of the Thirtieth IEEE Conference on Decision and
Control, Brighton, December, pp. 1299–1304.
Davydov, D. and V. Linetsky (1998). Double Step Options. Working Paper, University
of Michigan.
de Matos, J.A. (1993). MSM Estimators of American Option Pricing Models. Working
Paper, INSEAD, Fontainebleau, France.
Debreu, G. (1953). Une economie de l’incertain. Working Paper, Electricité de France.380 BIBLIOGRAPHY
Debreu, G. (1954). Valuation Equilibrium and Pareto Optimum. Proceedings of the
National Academy of Sciences 40, 588–592.
Debreu, G. (1959). Theory of Value. Cowles Foundation Monograph 17. New Haven,
Connecticut: Yale University Press.
Debreu, G. (1972). Smooth Preferences. Econometrica 40, 603–615; Corrigendum 44
(1976): 831–832.
Debreu, G. (1982). Existence of Competitive Equilibrium. In K. Arrow and M. In-
triligator (Eds.), Handbook of Mathematical Economics, VolumeII, pp. 697–743.
Amsterdam: North-Holland.
Décamps, J.-P. and P. Koehl (1994). Pricing and Hedging Asian Options: A PDE
Approach. Working Paper, GREMAQ, Universite des Sciences Sociales.
Dekel, E. (1987). Asset Demands Without the Independence Axiom. Working Paper,
Department of Economics, University of California, Berkeley.
Delbaen, F. (1992). Representing Martingale Measures when Asset Prices are Continu-
ous and Bounded. Mathematical Finance 2, 107–130.
Delbaen, F., P. Monat, W. Schachermayer, M. Schweizer, and C. Stricker (1994).
Inégalités de normes avec poids et fermeture d’un espace d’intégrales stochastiques.
Comtes Rendus de l’Academie de Science de Paris 319I, 1079–1081.
Delbaen, F. and W. Schachermayer (1994a). Arbitrage and Free Lunch with Bounded
Risk for Unbounded Continuous Processes. Mathematical Finance 4, 343–348.
Delbaen, F. and W. Schachermayer (1994b). A General Version of the Fundamental
Theorem of Asset Pricing. Mathematische Annalen 300, 463–520.
Delbaen, F. and W. Schachermayer (1995a). Arbitrage Possibilities in Bessel Processes
and Their Relations to Local Martingales. Probability Theory and Related Fields
102, 357–366.
Delbaen, F. and W. Schachermayer (1995b). The Existence of Absolutely Continuous
Local Martingale Measures. Annals of Applied Probability 5, 926–945.
Delbaen, F. and W. Schachermayer (1995c). The No-Arbitrage Property under a Choice
of Numéraire. Stochastics 53, 213–226.
Delbaen, F. and W. Schachermayer (1996a). Attainable Claims with p’th Moments.
Ann. Institut Henri Poincaré 33, 113–144.
Delbaen, F. and W. Schachermayer (1996b). A Compactness Principle for Bounded Se-
quences of Martingales with Applications. Working Paper, Departement für Math-
ematik, Eidgenössische Technische Hochschule Zürich.
Delbaen, F. and W. Schachermayer (1998). The Fundamental Theorem of Asset Pricing
for Unbounded Stochastic Processes. Mathematische Annalen 312, 215–250.
Delbaen, F. and H. Shirakawa (1994). A Note on the No Arbitrage Condition for In-
ternational Financial Markets. Working Paper, Department of Mathematics, Vrije
Universiteit Brussel.
Delgado, F. and B. Dumas (1993). How Far Apart Can Two Riskless Interest Rates
Be? Working Paper, Fuqua School of Business, Duke University.BIBLIOGRAPHY 381
DeMarzo, P. (1988). An Extension of the Modigliani-Miller Therorem to Stochastic
Economics with Incomplete Markets. Journal of Economic Theory 45, 353–369.
DeMarzo, P. and B. Eaves (1993). A Homotopy, Grassmann Manifold, and Relocaliza-
tion for Computing Equilibria of GEI. Working Paper, Hoover Institute, Stanford
University.
Dempster, M. (1994). Fast Numerical Valuation of American, Exotic and Complex
Options. Working Paper, Finance Research Group, Department of Mathematics
and Institute for Studies in Finance, University of Essex.
Dempster, M. and J. Hutton (1995). Fast Numerical Valuation of American, Exotic
and Complex Options. Working Paper, Department of Mathematics, University of
Essex, Colchester.
Dengler, H. and R. Jarrow (1993). Option Pricing Using a Binomial Model with Ran-
dom Time Steps. Working Paper, Mathematics Department and Johnson Graduate
School of Management, Cornell University.
Derman, E. and I. Kani (1994, February). Riding on the Smile. Risk, 32–39.
Derviz, A. (1996). Adjoint Equations in Stochastic Optimal Control and Application
to Portfolio Optimization with Borrowing Constraints. Working Paper, Institute of
Information Theory and Automation, Academy of Sciences of the Czech Republic,
Prague.
Detemple, J. (1986). Asset Pricing in a Production Economy with Incomplete Informa-
tion. Journal of Finance 41, 383–391.
Detemple, J. (1991). Further Results on Asset Pricing with Incomplete Information.
Journal of Economic Dynamics and Control 15, 425–454.
Detemple, J. (1995a). Asset Pricing in an Intertemporal Noisy Rational Expectations
Equilibrium. Working Paper, Sloan School of Management, Massachusetts Institu-
tion of Technology.
Detemple, J. (1995b). The Valuation of Nontraded Assets. Working Paper, Sloan School
of Management, MIT, Cambridge.
Detemple, J. and P. Gottardi (1995). Aggregation, Efficiency, and Mutual Fund Sepa-
ration in Incomplete Markets. Working Paper, Sloan School of Management, MIT.
Detemple, J. and S. Murthy (1994a). Equilibrium Asset Prices and No-Arbitrage with
Portfolio Constraints. The Review of Financial Studies 10, 1133–1174.
Detemple, J. and S. Murthy (1994b). Intertemporal Asset Pricing with Heterogeneous
Beliefs. Journal of Economic Theory 62, 294–320.
Detemple, J. and S. Murthy (1997a). Equilibrium Asset Prices and No-Arbitrage with
Portfolio Constraints. Working Paper, Faculty of Management, McGill University
and CIRANO.
Detemple, J. and S. Murthy (1997b). Pricing and Trade of Index Options Under Het-
erogeneous Beliefs. Working Paper, Faculty of Management, McGill University and
CIRANO.
Detemple, J. and L. Selden (1991). A General Equilibrium Analysis of Option and Stock
Market Interactions. International Economic Review 32, 279–303.382 BIBLIOGRAPHY
Detemple, J. and A. Serrat (1998). Dynamic Equilibrium with Liquidity Constraints.
Working Paper, Faculty of Management, McGill University and CIRANO.
Detemple, J. and F. Zapatero (1991). Asset Prices in an Exchange Economy with Habit
Formation. Econometrica 59, 1633–1658.
Detemple, J. and F. Zapatero (1992). Optimal Consumption-Portfolio Policies with
Habit Formation. Mathematical Finance 2, 251–274.
Dewynne, J. and P. Wilmott (1994). Exotic Options: Mathematical Models and Com-
putation. Working Paper, Department of Mathematics, Southampton University.
Dezhbakhsh, H. (1994). Foreign Exchange Forward and Futures Prices: Are They
Equal? Journal of Financial and Quantitative Analysis 1, 75–87.
Diener, F. and M. Diener (1999). Asymptotics of the Binomial Formula for Option
Pricing. Working Paper, Université de Nice Sophia-Antipolis.
Dijkstra, T. (1996). On numeraires and growth-optimum portfolios. Working Paper,
Faculty of Economics, University of Groningen.
Dixit, A. and R. Pindyck (1993). Investment under Uncertainty. Princeton: Princeton
University Press.
Donaldson, J., T. Johnson, and R. Mehra (1987). The Behavior of the Term Structure
of Interest Rates in a Real Business Cycle Model. Working Paper, Department of
Economics, University of California, Santa Barbara.
Donaldson, J. and R. Mehra (1984). Comparative Dynamics of an Equilibrium Intertem-
poral Asset Pricing Model. Review of Economic Studies 51, 491–508.
Doss, H. (1977). Liens Enter Équations Différentielles Stochastiques et Ordinaires. An-
nales de l’Institut Henri Poincaré 13, 99–125.
Dothan, M. (1990). Prices in Financial Markets. New York: Oxford University Press.
Dothan, M. and D. Feldman (1986). Equilibrium Interest Rates and Multiperiod Bonds
in a Partially Observable Economy. Journal of Finance 41, 369–382.
Douglas, J., J. Ma, and P. Protter (1996). Numerical Methods for Forward-Backward
Stochastic Differential Equations. Working Paper, Department of Mathematics,
Purdue University, West Lafayette.
Drèze, J. (1970-71). Market Allocation under Uncertainty. (Winter), 133–165.
Dritschel, M. and P. Protter (1998). Complete Markets with Discontinuous Security
Price. Working Paper, Department of Statistics, Purdue University, West Lafayatte.
Druskin, V., L. Knizhnerman, T. Tamarchenko, and S. Kostek (1996). Krylov Sub-
space Reduction and Its Extensions for Option Pricing. Working Paper, Druskin
Associates and Morgan Stanley and Co.
Duan, J.-C. (1995). The Garch Option Pricing Model. Mathematical Finance 5, 13–32.
Duffie, D. (1985). Predictable Representation of Martingale Spaces and Changes of
Probability Measure. In J. Azéma and M. Yor (Eds.), Séminaire de Probabilités
XIX, Lecture Notes in Mathematics Number 1123, pp. 278–284. Berlin: Springer-
Verlag.BIBLIOGRAPHY 383
Duffie, D. (1986). Stochastic Equilibria: Existence, Spanning Number, and the ‘No
Expected Financial Gain from Trade’ Hypothesis. Econometrica 54, 1161–1184.
Duffie, D. (1987). Stochastic Equilibria with Incomplete Financial Markets. Journal of
Economic Theory 41, 405–416, Corrigendum 49 (1989): 384.
Duffie, D. (1988a). An Extension of the Black-Scholes Model of Security Valuation.
Journal of Economic Theory 46, 194–204.
Duffie, D. (1988b). Security Markets: Stochastic Models. Boston: Academic Press.
Duffie, D. (1989). Futures Markets. Englewood Cliffs, N.J.: Prentice-Hall.
Duffie, D. (1992). The Nature of Incomplete Markets, pp. 214–262. Cambridge: Cam-
bridge University Press.
Duffie, D. and L. Epstein (1992b). Asset Pricing with Stochastic Differential Utility.
Review of Financial Studies 5, 411–436.
Duffie, D., W. Fleming, M. Soner, and T. Zariphopoulou (1997). Hedging in Incomplete
Markets with HARA Utility. Journal of Economic Dynamics and Control 21, 753–
782.
Duffie, D. and M. Garman (1991). Intertemporal Arbitrage and the Markov Valuation
of Securities. Cuadernos economicos de ICE 49, 37–60.
Duffie, D., J. Geanakoplos, A. Mas-Colell, and A. McLennan (1994). Stationary Markov
Equilibria. Econometrica 62, 745–781.
Duffie, D., P.-Y. Geoffard, and C. Skiadas (1994). Efficient and Equilibrium Allocations
with Stochastic Differential Utility. Journal of Mathematical Economics 23, 133–
146.
Duffie, D. and P. Glynn (1995). Efficient Monte Carlo Estimation of Security Prices.
Annals of Applied Probability 5, 897–905.
Duffie, D. and M. Harrison (1993). Arbitrage Pricing of Russian Options and Perpetual
Lookback Options. Annals of Applied Probability 3, 641–651.
Duffie, D. and C.-F. Huang (1985). Implementing Arrow-Debreu Equilibria by Contin-
uous Trading of Few Long-Lived Securities. Econometrica 53, 1337–1356.
Duffie, D. and C.-F. Huang (1986). Multiperiod Security Markets with Differential In-
formation: Martingales and Resolution Times. Journal of Mathematical Economics
15, 283–303.
Duffie, D. and M. Jackson (1990). Optimal Hedging and Equilibrium in a Dynamic
Futures Market. Journal of Economic Dynamics and Control 14, 21–33.
Duffie, D. and P.-L. Lions (1990). PDE Solutions of Stochastic Differential Utility.
Journal of Mathematical Economics 21, 577–606.
Duffie, D. and J. Pan (1997). An Overview of Value at Risk. Journal of Derivatives 4,
7–49.
Duffie, D., J. Pan, and K. Singleton (1997). Transform Analysis and Asset Pricing
for Affine Jump-Diffusions. Working Paper, Graduate School of Business, Stanford
University.384 BIBLIOGRAPHY
Duffie, D. and P. Protter (1988). From Discrete to Continuous Time Finance: Weak
Convergence of the Financial Gain Process. Mathematical Finance 2, 1–16.
Duffie, D. and H. Richardson (1991). Mean-Variance Hedging in Continuous Time.
Annals of Applied Probability 1, 1–15.
Duffie, D., M. Schroder, and C. Skiadas (1997). A Term Structure Model with Prefer-
ences for the Timing of Resolution of Uncertainty. Economic Theory 9, 3–22.
Duffie, D. and W. Shafer (1985). Equilibrium in Incomplete Markets I: A Basic Model
of Generic Existence. Journal of Mathematical Economics 14, 285–300.
Duffie, D. and W. Shafer (1986). Equilibrium and the Role of the Firm in Incomplete
Markets. Working Paper, Graduate School of Business, Stanford University.
Duffie, D. and W. Shafer (1986a). Equilibrium in Incomplete Markets II: Generic Exis-
tence in Stochastic Economies. Journal of Mathematical Economics 15, 199–216.
Duffie, D. and K. Singleton (1993). Simulated Moments Estimation of Markov Models
of Asset Prices. Econometrica 61, 929–952.
Duffie, D. and C. Skiadas (1994). Continuous-Time Security Pricing: A Utility Gradient
Approach. Journal of Mathematical Economics 23, 107–132.
Duffie, D. and L.E. W.C. Skiadas) (1992a). Stochastic Differential Utility. Econometrica
60, 353–394.
Duffie, D. and R. Stanton (1988). Pricing Continuously Resettled Contingent Claims.
Journal of Economic Dynamics and Control 16, 561–574.
Duffie, D. and T.-S. Sun (1990). Transactions Costs and Portfolio Choice in a Discrete-
Continuous Time Setting. Journal of Economic Dynamics and Control 14, 35–51.
Duffie, D. and W. Zame (1989). The Consumption-Based Capital Asset Pricing Model.
Econometrica 57, 1279–1297.
Duffie, D. and T. Zariphopoulou (1993). Optimal Investment with Undiversifiable In-
come Risk. Mathematical Finance 3, 135–148.
Dumas, B. (1989). Two-Person Dynamic Equilibrium in the Capital Market. Review of
Financial Studies 2, 157–188.
Dumas, B. and E. Luciano (1989). An Exact Solution to a Dynamic Portfolio Choice
Problem under Transactions Costs. Working Paper, Wharton School, University of
Pennsylvania.
Dumas, B., R. Uppal, and T. Wang (1997). Efficient Intertemporal Allocations with
Recursive Utility. Working Paper, HEC School of Management, France.
Dunn, K. and K. Singleton (1986). Modeling the Term Structure of Interest Rates under
Nonseparable Utility and Durability of Goods. Journal of Financial Economics 17,
27–55.
Dupire, B. (1992). Arbitrage Pricing with Stochastic Volatility. Working Paper, Société
Générale, Division Options, Paris, France.
Dupire, B. (1994). Pricing with a Smile. Risk January, 18–20.
Durrett, R. (1991). Probability: Theory and Examples. Belmont, California: Wadsworth
Publishing Co.BIBLIOGRAPHY 385
Dybvig, P. (1988). Bond and Bond Option Pricing Based on the Current Term Structure.
Working Paper, School of Business, Washington University, St. Louis.
Dybvig, P. (1989). Hedging Nontraded Wealth. Working Paper, School of Business,
Washington University, St. Louis.
Dybvig, P. (1994). Duesenberry’s Ratcheting of Consumption: Optimal Dynamic Con-
sumption and Investment Given Intolerance for Any Decline in Standard of Living.
Working Paper, School of Business, Washington University, St. Louis.
Dybvig, P. and C.-F. Huang (1988). Nonnegative Wealth, Absence of Arbitrage, and
Feasible Consumption Plans. Review of Financial Studies 1, 377–401.
Dybvig, P., C. Rogers, and K. Back (1995). Portfolio Turnpikes: Synthesis and Critique.
Working Paper, Washington University.
Dynkin, E. and A. Yushkevich (1979). Controlled Markov Processes. Berlin, New York:
Springer-Verlag.
Eberlein, E. (1991). On Modelling Questions in Security Valuation. Working Paper,
Institut für Mathematische Stochastik, Universität Freiburg.
Eberlein, E., U. Keller, and K. Prause (1998). New Insights into Smile, Mispricing, and
Value at Risk: The Hyperbolic Model. Journal of Business 71, 371–405.
Edirisinghe, C., V. Naik, and R. Uppal (1991). Optimal Replication of Options with
Transactions Costs. Working Paper, College of Business, University of Tennessee.
Ekern, S. (1993). Entry and Exit Decisions with Restricted Reversibility. Working Pa-
per, Norwegian School of Economics, Bergen.
El Karoui, N., M. Jeanblanc, and S. Shreve (1991). On the Robustness of the Black-
Scholes Equation. Working Paper, LAMM, École Normale Supérieure de Cachan,
France.
El Karoui, N. and M. Quenez (1991). Evaluation dans les marchés incomplets et pro-
grammation dynamique. Working Paper, Laboratoire de Probabilités, Université de
Paris VI.
El Karoui, N. and M. Quenez (1993). Dynamic Programming and Pricing of Contin-
gent Claims in an Incomplete Market. Working Paper, Laboratoire de Probabilités,
Université de Paris VI.
Engle, R. (1982). Autoregressive Conditional Heteroskedasticity with Estimates of the
Variance of United Kingdom Inflation. Econometrica 50, 987–1008.
Epstein, L. (1988). Risk Aversion and Asset Prices. Journal of Monetary Economics
22, 179–192.
Epstein, L. (1992). Behavior under Risk: Recent Developments in Theory and Applica-
tion, pp. 1–63. Cambridge: Cambridge University Press.
Epstein, L. and A. Melino (1995). A Revealed Preference Analysis of Asset Pricing
under Recursive Utility. Review of Economic Studies 62, 597–618.
Epstein, L. and T. Wang (1994). Intertemporal Asset Pricing under Knightian Uncer-
tainty. Econometrica 62, 283–322.386 BIBLIOGRAPHY
Epstein, L. and S. Zin (1989). Substitution, Risk Aversion and the Temporal Behavior
of Consumption and Asset Returns I: A Theoretical Framework. Econometrica 57,
937–969.
Epstein, L. and S. Zin (1991). The Independence Axiom and Asset Returns. Working
Paper, Department of Economics, University of Toronto.
Ethier, S. and T. Kurtz (1986). Markov Processes: Characterization and Convergence.
New York: Wiley.
Eydeland, A. (1994a). A Spectral Algorithm for Pricing Interest Rate Options. Working
Paper, Department of Mathematics, University of Massachusetts.
Eydeland, A. (1994b). A Fast Algorithm for Computing Integrals in Function Spaces:
Financial Applications. Working Paper, Fuji Capital Markets Corporation, New
York.
Fisher, M. and C. Gilles (1997). The Equity Premium and the Term Structure of Interest
Rates with Recursive Preferences. Working Paper, Research and Statistics, Board
of Governors of the Federal Reserve System.
Fisher, M. and C. Gilles (1998). Consumption and Asset Prices with Recursive Prefer-
ences. Working Paper, Board of Governors of the Federal Reserve System.
Fitzpatrick, B. and W. Fleming (1991). Numerical Methods for Optimal Investment—
Consumption Models. Mathematics of Operations Research 16, 823–841.
Fleming, J. and R. Whaley (1994). The Value of Wildcard Options. Journal of Finance
1, 215–236.
Fleming, W., S. Grossman, J.-L. Vila, and T. Zariphopoulou (1989). Optimal Portfo-
lio Rebalancing with Transaction Costs. Working Paper, Department of Applied
Mathematics, Brown University.
Fleming, W. and R. Rishel (1975). Deterministic and Stochastic Optimal Control.
Berlin: Springer-Verlag.
Fleming, W. and H. Soner (1993). Controlled Markov Processes and Viscosity Solutions.
New York: Springer-Verlag.
Fleming, W. and T. Zariphopoulou (1991). An Optimal Investment/Consumption
Model with Borrowing Constraints. Mathematics of Operations Research 16, 802–
822.
Flesaker, B. (1991). Valuing European Options When the terminal Value of the Under-
lying Asset is Unobservable. Working Paper, Department of Finance, University of
Illinois at Urbana-Champaign.
Florenzano, M. and P. Gourdel (1993). Incomplete Markets in Infinite Horizon: Debt
Constraints versus Node Prices. Working Paper, CNRS-CEPREMAP, Paris.
Florenzano, M. and P. Gourdel (1994). T-Period Economies with Incomplete Markets.
Economics Letters 44, 91–97.
Foldes, L. (1978). Martingale Conditions for Optimal Saving-Discrete Time. Journal of
Mathematical Economics 5, 83–96.
Foldes, L. (1979). Optimal Saving and Risk in Continuous Time. Review of Economic
Studies 46, 39–65.BIBLIOGRAPHY 387
Foldes, L. (1990). Conditions for Optimality in the Infinite-Horizon Portfolio-Cum-
Saving Problem with Semimartingale Investments. Stochastics and Stochastics Re-
ports 29, 133–170.
Foldes, L. (1991a).Certainty Equivalence in the Continuous-Time Portfolio-Cum-Saving
Model. In Applied Stochastic Analysis. London: Gordon and Breach.
Foldes, L. (1991b). Existence and Uniqueness of an Optimum in the Infinite-Horizon
Portfolio-cum-Saving Model with Semimartingale Investments. Working Paper,
L.S.E. Financial Markets Group Discussion Paper 109, London School of Economics.
Foldes, L. (1991c). Optimal Sure Portfolio Plans. Mathematical Finance 1, 15–55.
Foldes, L. (1996). The Optimal Consumption Function in a Brownian Model of Ac-
cumulation, Part A: The Consumption Function as Solution of a Boundary Value
Problem. Working Paper, London School of Economics and Political Science.
Föllmer, H. (1981). Calcul d’Ito Sans Probabilities. In J. Azéma and M. Yor (Eds.),
Séminaire de Probabilités XV, Lecture Notes in Mathematics, pp. 143–150. Berlin:
Springer-Verlag.
Föllmer, H. (1993). A Microeconomic Approach to Diffusion Models for Stock Prices.
Mathematical Finance 1, 1–23.
Föllmer, H. and M. Schweizer (1990). Hedging of Contingent Claims under Incomplete
Information. In M. Davis and R. Elliott (Eds.), Applied Stochastic Analysis, pp.
389–414. London: Gordon and Breach, pp. 389–414.
Föllmer, H. and D. Sondermann (1986). Hedging of Non-Redundant Contingent Claims.
Amsterdam: North-Holland.
Fournié, E. (1993). Statistiques des diffusions ergodiques avec applications en finance.
Working Paper, Ph.D. diss., Université de Nice-Sophia Antipolis.
Fournié, E. and J.-M. Lasry (1996). Some Nonlinear Methods to Study Far-from-the-
Money Contingent Claims. Working Paper, Caisse Autonome de Refinancement,
Paris.
Fournié, E., J.-M. Lasry, J. Lebuchoux, P.-L. Lions, and N. Touzi (1997). An Application
of Malliavin Calculus to Monte Carlo Methods in Finance. Working Paper, Caisse
Autonome de Refinancement, Paris.
Fournié, E., J.-M. Lasry, and N. Touzi (1996). Méthode de Monte Carlo pour les
Modéles á Volatilité Stochastique. Working Paper, Caisse Autonome de Refinance-
ment, Paris.
Fournié, E., J. Lebuchoux, and N. Touzi (1996). Small Noise Expansion and Importance
Sampling. Working Paper, Ecole Normale Supérieure and Université de ParisIX,
Dauphine.
Freedman, D. (1983). Markov Chains. New York: Springer-Verlag.
Freidlin, M. (1985). Functional Integration and Partial Differential Equations. Prince-
ton, N.J.: Princeton University Press.
Frey, R. (1996). The Pricing and Hedging of Options in Finitely Elastic Markets. Work-
ing Paper, Department of Statistics, Faculty of Economics, University of Bonn.388 BIBLIOGRAPHY
Frey, R. and C. Sin (1997). Bounds on European Option Prices under Stochastic Volatil-
ity. Working Paper, Department Mathematik, ETH Zentrum, Zürich.
Frey, R. and A. Stremme (1995). Market Volatility and Feedback Effects from Dynamic
Hedging. Working Paper, Rheinische Friedrich-Wilhelms-Universitat Bonn.
Friedman, A. (1964). Partial Differential Equations of the Parabolic Type. Englewood
Cliffs, N.J.: Prentice-Hall.
Friedman, A. (1975). Stochastic Differential Equations and Applications, Vol. I. New
York: Academic Press.
Frittelli, M. and P. Lakner (1995). Arbitrage and Free Lunch in a General Financial
Market Model; The Fundamental Theorem of Asset Pricing. Working Paper, Uni-
versitá degli Studi di Urbino, Facoltá di Economia e Commercio, Urbino.
Fu, M., D. Madan, and T. Wang (1995). Pricing Asian Options: A Comparison of
Analytical and Monte Carlo Methods. Working Paper, College of Business and
Management, University of Maryland.
Gabay, D. (1982). Stochastic Processes in Models of Financial Markets. Working Paper,
In Proceedings of the IFIP Conference on Control of Distributed Systems, Toulouse.
Toulouse, France: Pergamon Press.
Gagnon, J. and J. Taylor (1986). Solving and Estimating Stochastic Equilibrium Mod-
els with the Extended Path Method. Working Paper, Department of Economics,
Stanford University.
Gale, D. (1960). The Theory of Linear Economic Models. New York: McGraw-Hill.
Gallant, R. and H. White (1988). A Unified Theory of Estimation and Inference for
Nonlinear Dynamic Models. New York: Basil Blackwell.
Gandhi, S., A. Kooros, and G. Salkin (1993a). Average-Price Options, An Analytic
Approach. Working Paper, Imperial College, University of London.
Gandhi, S., A. Kooros, and G. Salkin (1993b). An Improved Analytic Approximation for
American Option Pricing. Working Paper, Imperial College, University of London.
Gao, B., J.-Z. Huang, and M. Subrahmanyam (1996). An Analytical Approach to the
Valuation of American Path-Dependent Options. Working Paper, Kenan-Flagler
Business School, University of North Carolina.
Garman, M. (1985). Towards a Semigroup Pricing Theory. Journal of Finance 40,
847–861.
Geanakoplos, J. (1990). An Introduction to General Equilibrium with Incomplete Asset
Markets. Journal of Mathematical Economics 19, 1–38.
Geanakoplos, J. and A. Mas-Colell (1989). Real Indeterminacy with Financial Assets.
Journal of Economic Theory 47, 22–38.
Geanakoplos, J. and H. Polemarchakis (1986). Existence, Regularity, and Constrained
Suboptimality of Competitive Allocations when the Asset Market Is Incomplete. In
W. Heller and D. Starrett (Eds.), Essays in Honor of Kenneth J. Arrow, Volume
III, pp. 65–96. Cambridge: Cambridge University Press.
Geanakoplos, J. and W. Shafer (1990). Solving Systems of Simultaneous Equations in
Economics. Journal of Mathematical Economics 19, 69–94.BIBLIOGRAPHY 389
Gegout-Petit, A. and E. Pardoux (1995). Equations Différentielles Stochastiques
Rétrogrades Réfléchies dans un Convexe. Working Paper, C.M.I. Université de
Provence, Marseille.
Geman, H., N. El Karoui, and J. Rochet (1991). Probability Changes and Option
Pricing. Working Paper, Laboratoires de Probabilités, Université de Paris VI.
Geman, H. and M. Yor (1993). Bessel Processes, Asian Options and Perpetuities. Math-
ematical Finance 3, 349–375.
Gennotte, G. (1984). Continuous-Time Production Economies Under Incomplete In-
formation I: A Separation Theorem. Working Paper, Sloan School, Massachusetts
Institute of Technology.
Gerber, H. and E. Shiu (1994). Option Pricing by Esscher Transforms. Transactions of
the Society of Actuaries 46, 51–92.
Geske, R. (1979). The Valuation of Compound Options. Journal of Financial Economics
7, 63–81.
Geske, R. and H. Johnson (1984). The American Put Option Valued Analytically. Jour-
nal of Finance 39, 1511–1524.
Ghysels, E. (1986). Asset Prices in an Economy with Latent Technological Shocks -
Econometric Implications of a Discrete Time General Equilibrium Model. Working
Paper, Department of Economics and Centre de Recherche et Développement en
Économique, Université de Montréal.
Ghysels, E., C. Gourieroux, and J. Jasiak (1995). Market Time and Asset Price Move-
ments Theory and Estimation. Working Paper, C.R.D.E., Université de Montreal.
Ghysels, E., A. Harvey, and E. Renault (1995). Stochastic Volatility. Working Paper,
C.R.D.E., Université de Montréal.
Gibbons, M. and K. Ramaswamy (1993). A Test of the Cox-Ingersoll-Ross Model of
The Term Structure of Interest Rates. Review of Financial Studies 6, 619–658.
Gibbons, M. and T. Sun (1986). The Term Structure of Interest Rates: A Simple
Exposition of the Cox, Ingersoll, and Ross Model. Working Paper, Graduate School
of Business, Stanford University.
Gilles, C. and S. LeRoy (1991). On the Arbitrage Pricing Theory. Economic Theory 1,
213–230.
Gilles, C. and S. LeRoy (1992a). Bubbles and Charges. International Economic Review
33, 323–339.
Gilles, C. and S. LeRoy (1992b). Stochastic Bubbles in Markov Economies. Working
Paper, Board of Governors of The Federal Reserve System, Washington, D.C.
Giovannini, A. and P. Weil (1989). Risk Aversion and Intertemporal Substitution in
the Capital Asset Pricing Model. Working Paper, National Bureau of Economic
Research, Cambridge, Massachusetts.
Girotto, B. and F. Ortu (1993). Existence of Equivalent Martingale Measures in Finite
Dimensional Securities Markets. Working Paper, Department of Applied Mathe-
matics, Università di Trieste, Italy.390 BIBLIOGRAPHY
Girotto, B. and F. Ortu (1994). Consumption and Portfolio Policies with Incomplete
Markets and Short-Sale Contraints in the Finite-Dimensional Case: Some Remarks.
Mathematical Finance 4, 69–73.
Girotto, B. and F. Ortu (1995). Numeraires, Equivalent Martingale Measures and Com-
pleteness in Finite Dimensional Securities Markets. Working Paper, Dipartimento
di Matematica Applicata “B. de Finetti,” Universitá di Trieste, Trieste.
Girotto, B. and F. Ortu (1997). Generic Existence and Robust Non-Existence of Nu-
meraires in Finite Dimensional Securities Markets. Working Paper, Dipartimento
di Matematica Applicata “B. de Finetti,” Universitá di Trieste, Trieste.
Glasserman, P. (1996). Liquidity Risk in Long-Term Hedging with Short-Term Futures
Contracts. Working Paper, Columbia Business School.
Glasserman, P. and P. Heidelberger (1997). Asymptotically Optimal Importance Sam-
pling and Stratification for Pricing Path-Dependent Options. Working Paper, Grad-
uate School of Business, Columbia University, New York.
Glasserman, P. and X. Zhao (1998). Fast Greeks in Forward Libor Models. Working
Paper, Graduate School of Business, Columbia University.
Goldman, B., H. Sosin, and M. Gatto (1979). Path Dependent Options: ‘Buy at the
Low, Sell at the High’. Journal of Finance 34, 1111–1127.
Goldstein, R. and F. Zapatero (1994). General Equilibrium with Constant Relative
Risk Aversion and Vasicek Interest Rates. Working Paper, Haas School of Business,
University of California, Berkeley.
Goncalves, F. and A. Souza (1996). Pricing of Bermuda Style Options with Variable
Strike Schedule. Working Paper, Banco da Bahia Investimentos S.A., Rio de Janeiro.
Gorman, W. (1953). Community Preference Fields. Econometrica 21, 63–80.
Gottardi, P. (1995). An Analysis of the Conditions for the Validity of the Modigliani-
Miller Theorem with Incomplete Markets. Economic Theory 5, 191–208.
Gottardi, P. and T. Hens (1994). The Survival Assumption and Existence of Compet-
itive Equilibria when Asset Markets are Incomplete. Working Paper, Department
of Economics, University of Venice.
Gottardi, P. and A. Kajii (1995). Generic Existence of Sunspot Equilibria: The Real
Asset Case. Working Paper, Center for Analytic Research in Economics and the
Social Sciences, University of Pennsylvania.
Gourieroux, C., J.-P. Laurent, and H. Pham (1995). Quadratic Hedging and Numeraire.
Working Paper, CREST-CEPREMAP.
Grabbe, J. (1983). The Pricing of Call and Put Options on Foreign Exchange. Journal
of International Money and Finance 2, 239–253.
Grannan, E. and G. Swindle (1992). Minimizing Transaction Costs of Option Hedging
Strategies. Working Paper, Department of Statistics, University of California, Santa
Barbara.
Grauer, F. and R. Litzenberger (1979). The Pricing of Commodity Futures Contracts,
Nominal Bonds, and Other Risky Assets under Commodity Price Uncertainty. Jour-
nal of Finance 44, 69–84.BIBLIOGRAPHY 391
Grinblatt, M. (1994). An Analytic Solution for Interest Rate Swap Spreads. Working
Paper, Anderson Graduate School of Management, University of California, Los
Angeles.
Grinblatt, M. and N. Jegadeesh (1993). The Relative Pricing of Eurodollar Futures and
Forward Contracts. Working Paper, Anderson Graduate School of Management,
University of California, Los Angeles.
Grodal, B. and K. Vind (1988). Equilibrium with Arbitrary Market Structure. Working
Paper, Department of Economics, University of Copenhagen.
Grossman, S. and G. Laroque (1989). Asset Pricing and Optimal Portfolio Choice in
the Presence of Illiquid Durable Consumption Goods. Econometrica 58, 25–52.
Grossman, S. and R. Shiller (1982). Consumption Correlatedness and Risk Measurement
in Economies with Non-Traded Assets and Heterogeneous Information. Journal of
Financial Economics 10, 195–210.
Grossman, S. and Z. Zhou (1996). Equilibrium Analysis of Portfolio Insurance. The
Journal of Finance 51, 1379–1403.
Grundy, B. and Z. Wiener (1995). Theory of Rational Optional Pricing: II. Working
Paper, The Wharton School, University of Pennsylvania.
Grundy, B. and Z. Wiener (1996). The Analysis of Var, Deltas and State Prices: A
New Approach. Working Paper, Rodney L. White Center for Financial Research,
Wharton School, The University of Pennsylvania.
Gukhal, C. (1995a). American Call Options on Stocks with Discrete Dividends. Working
Paper, Graduate School of Business, Columbia University, New York.
Gukhal, C. (1995b). The Analytic Valuation of American Options on Jump-Diffusion
Processes. Working Paper, Graduate School of Business, Columbia University, New
York.
Gul, F. and O. Lantto (1992). Betweenness Satisfying Preferences and Dynamic Choice.
Working Paper, Graduate School of Business, Stanford University.
Haan, W. (1994). Heterogeneity, Aggregate Uncertainty and the Short Interest Rate: A
Case Study of Two Solution Techniques. Working Paper, Department of Economics,
University of California, San Diego.
Hahn, F. (1992). A Remark on Incomplete Markets Equilibrium. Working Paper, De-
partment of Economics, Cambridge University.
Hahn, F. (1994). On Economies with Arrow Securities. Working Paper, Department of
Economics, Cambridge University.
Hakansson, N. (1970). Optimal Investment and Consumption Strategies under Risk for
a Class of Utility Functions. Econometrica 38, 587–607.
Hakansson, N. (1974). Convergence to Isoelastic Utility and Policy in Multiperiod Port-
folio Choice. Journal of Financial Economics 1, 201–224.
Hansen, L. (1982). Large Sample Properties of Generalized Method of Moments Esti-
mators. Econometrica 50, 1029–1054.
Hansen, L. and R. Jaganathan (1990). Implications of Security Market Data for Models
of Dynamic Economies. Journal of Political Economy 99, 225–262.392 BIBLIOGRAPHY
Hansen, L. and S. Richard (1987). The Role of Conditioning Information in Deducing
Testable Restrictions Implied by Dynamic Asset Pricing Models. Econometrica 55,
587–614.
Hansen, L. and T. Sargent (1990). Recursive Linear Models of Dynamic Economies.
Working Paper, Department of Economics, University of Chicago.
Hansen, L. and K. Singleton (1982). Generalized Instrumental Variables Estimation of
Nonlinear Rational Expectations Models. Econometrica 50, 1269–1286.
Hansen, L. and K. Singleton (1983). Stochastic Consumption, Risk Aversion, and the
Temporal Behavior of Asset Returns. Journal of Political Economy 91, 249–265.
Hansen, L. and K. Singleton (1986). Efficient Estimation of Linear Asset Pricing Models
with Moving Average Errors. Working Paper, Department of Economics, University
of Chicago.
Hara, C. (1993). A Role of Redundant Assets in the Presence of Transaction Costs.
Working Paper, Sloan School of Management, Massachusetts Institute of Technol-
ogy.
Hara, C. (1994). Marginal Rates of Substitution for Uninsurable Risks with Constraint-
Efficient Asset Structures. Working Paper, Center for Operations Research and
Econometrics, Université Catholique de Louvain.
Harrison, M. (1985). Brownian Motion and Stochastic Flow Systems. New York: Wiley.
Harrison, M. and D. Kreps (1979). Martingales and Arbitrage in Multiperiod Securities
Markets. Journal of Economic Theory 20, 381–408.
Harrison, M. and S. Pliska (1981). Martingales and Stochastic Integrals in the Theory
of Continuous Trading. Stochastic Processes and Their Applications 11, 215–260.
Hart, O. (1975). On the Optimality of Equilibrium when the Market Structure Is In-
complete. Journal of Economic Theory 11, 418–430.
Harvey, A., E. Ruiz, and N. Shephard (1994). Multivariate Stochastic Variance Models.
Review of Economic Studies 61, 247–264.
Harvey, A. and N. Shephard (1993). The Econometrics of Stochastic Volatility. Working
Paper, Department of Statistical and Mathematical Sciences, London School of
Economics.
Haug, E. (1999). Closed form Valuation of American Barrier Options. Working Paper,
Derivatives Research, Tempus Financial Engineering, Norway.
He, H. (1990). Convergence from Discrete- to Continuous-Time Contingent Claims
Prices. Review of Financial Studies 3, 523–546.
He, H. (1991). Optimal Consumption-Portfolio Policies: A Convergence from Discrete
to Continuous Time Models. Journal of Economic Theory 55, 340–363.
He, H. and H.P. es (1993). Labor Income, Borrowing Constraints, and Equilibrium
Asset Prices. Economic Theory 3, 663–696.
He, H. and C. Huang (1994). Consumption-Portfolio Policies: An Inverse Optimal Prob-
lem. Journal of Economic Theory 62, 294–320.BIBLIOGRAPHY 393
He, H. and H. Leland (1993). On Equilibrium Asset Price Processes. Review of Financial
Studies 6, 593–617.
He, H. and D. Modest (1993). Market Frictions and Consumption-Based Asset Pricing.
Working Paper, Haas School of Business, University of California at Berkeley.
He, H. and N. Pearson (1991a). Consumption and Portfolio Policies with Incomplete
Markets: The Infinite-Dimensional Case. Journal of Economic Theory 54, 259–305.
He, H. and N. Pearson (1991b). Consumption and Portfolio Policies with Incomplete
Markets and Short-Sale Contraints: The Finite-Dimensional Case. Mathematical
Finance 1, 1–10.
He, H. and A. Takahashi (1995). A Variable Separation Technique for Pricing Average-
Rate Options. Working Paper, Salomon Brothers Asia Limited, Derivatives Analy-
sis.
Heath, D., R. Jarrow, and A. Morton (1990). Bond Pricing and the Term Structure of
Interest Rates: A Discrete Time Approximation. Journal of Financial and Quanti-
tative Analysis 25, 419–440.
Heath, D., R. Jarrow, and A. Morton (1992a). Bond Pricing and the Term Structure of
Interest Rates: A New Methodology for Contingent Claims Valuation. Economet-
rica 60, 77–106.
Heath, D., R. Jarrow, and A. Morton (1992b). Contingent Claim Valuation with a Ran-
dom Evolution of Interest Rates. Working Paper, Operations Research Department,
Cornell University.
Heaton, J. (1993). The Interaction Between Time-Nonseparable Preferences and Time
Aggregation. Econometrica 61, 353–386.
Heaton, J. and D. Lucas (1996). Evaluating the Effects of Incomplete Markets on Risk
Sharing and Asset Pricing. Journal of Political Economy 104, 668–712.
Hellwig, M. (1996). Rational Expectations Equilibria in Sequence Economies with Sym-
metric Information: The Two Period Case. Journal of Mathematical Economics 26,
9–49.
Hemler, M. (1987). The Quality Delivery Option in Treasury Bond Futures Contracts.
Working Paper, Graduate School of Business, University of Chicago.
Henrotte, P. (1991). Transactions Costs and Duplication Strategies. Working Paper,
Graduate School of Business, Stanford University.
Henrotte, P. (1994). Multiperiod Equilibrium with Endogenous Price Uncertainty.
Working Paper, Groupe HEC, Département de Finance et Economie, Jouy en Josas,
France.
Hens, T. (1991). Structure of General Equilibrium Models with Incomplete Markets.
Working Paper, Ph.D. diss., Department of Economics, University of Bonn.
Hernandez, A. and M. Santos (1994). Competitive Equilibria for Infinite-Horizon
Economies with Incomplete Markets. Working Paper, Centro de Investigación
Económica, ITAM, Mexico City.394 BIBLIOGRAPHY
Heston, S. (1988b). Testing Continuous Time Models of the Term Structure of Interest
Rates. Working Paper, Graduate School of Industrial Administration, Carnegie-
Mellon University.
Heston, S. (1990). Sticky Consumption, Optimal Investment, and Equilibrium Asset
Prices. Working Paper, School of Organization and Management, Yale University.
Heston, S. (1993). A Closed-Form Solution for Options with Stochastic Volatility with
Applications to Bond and Currency Options. Review of Financial Studies 6, 327–
344.
Heston, S. (1997). Option Pricing with Infinitely Divisible Distributions. Working Pa-
per, John M. Olin School of Business, Washington University in St. Louis.
Heston, S. and S. Nandi (1997). A Closed-Form GARCH Option Pricing Model. Working
Paper, Federal Reserve Bank of Atlanta.
Heston, S. and G. Zhou (1997). On Rate of Convergence of Discrete Time Contingent
Claims. Working Paper, Washington Universtiy, St. Louis.
Heynen, R. and H. Kat (1993). Volatility Prediction: A Comparison of the Stochastic
Volatility, GARCH(1,1) and EGARCH(1,1) Models. Working Paper, Department
of Operations Research, Erasmus University Rotterdam.
Heynen, R., A. Kemna, and T. Vorst (1994). Analysis of the Term Structure of Implied
Volatilities. Journal of Financial and Quantitative Analysis 1, 31–57.
Hildenbrand, W. and P. Kirman (1989). Introduction to Equilibrium Analysis (Second
edition). Amsterdam: North-Holland Elsevier.
Hindy, A. (1995). Viable Prices in Financial Markets with Solvency Constraints. Journal
of Mathematical Economics 24, 105–136.
Hindy, A. and C.-F. Huang (1992). Intertemporal Preferences for Uncertain Consump-
tion: A Continuous Time Approach. Econometrica 60, 781–802.
Hindy, A. and C.-F. Huang (1993a). Optimal Consumption and Portfolio Rules with
Local Substitution. Econometrica 61, 85–122.
Hindy, A., C.-F. Huang, and D. Kreps (1992). On Intertemporal Preferences in Con-
tinuous Time: The Case of Certainty. Journal of Mathematical Economics 21,
401–440.
Hindy, A., C.-F. Huang, and H. Zhu (1993a). Numerical Analysis of a Free Boundary
Singular Control Problem in Financial Economics. Working Paper, Graduate School
of Business, Stanford University.
Hindy, A., C.-F. Huang, and H. Zhu (1993b). Optimal Consumption and Portfolio Rules
with Durability and Habit Formation. Working Paper, Graduate School of Business,
Stanford University.
Hindy, A. and M. Huang (1993b). Asset Pricing with Linear Collateral Constraints.
Working Paper, Graduate School of Business, Stanford University.
Hirsch, M., M. Magill, and A. Mas-Colell (1990). A Geometric Approach to a Class of
Equilibrium Existence Theorems. Journal of Mathematical Economics 19, 95–106.
Ho, T. and S. Lee (1986). Term Structure Movements and Pricing Interest Rate Con-
tingent Claims. Journal of Finance 41, 1011–1029.BIBLIOGRAPHY 395
Hobson, D. (1995). Bounds on the Lookback. Working Paper, School of Mathematical
Sciences, University of Bath.
Hobson, D. and C. Rogers (1993). Models of Endogenous Stochastic Volatility. Working
Paper, Judge Institute of Management Studies, Cambridge University.
Hobson, D. and L. Rogers (1995). Complete Models with Stochastic Volatility. Working
Paper, School of Mathematical Sciences, University of Bath.
Hodges, S. and A. Carverhill (1992). The Characterization of Economic Equilibria
Which Support Black-Scholes Options Pricing. Working Paper, Financial Options
Research Centre, University of Warwick.
Hodges, S. and M. Selby (1996). The Risk Premium in Trading Equilibria Which Sup-
port Black-Scholes Option Pricing. Working Paper, Financial Options Research
Center, University of Warwick.
Hofmann, N., E. Platen, and M. Schweizer (1992). Option Pricing Under Incompleteness
and Stochastic Volatility. Working Paper, Department of Mathematics, University
of Bonn.
Honda, T. (1992). Equilibrium in Incomplete Real Asset Markets with Dispersed Fore-
cast Functions. Working Paper, Engineering-Economic Systems Department, Stan-
ford University.
Honda, T. (1996). On the Consumption/Investment Problem with Stochastic ”Regime
Switching” Parameters. Working Paper, Engineering-Economic Systems Depart-
ment, Stanford University.
Honda, T. (1997a). Equilibrium Asset Pricing with Unobservable Regime-Switching
Mean Earnings Growth. Working Paper, Department of Engineering-Economic Sys-
tems and Operations Research, Stanford University.
Honda, T. (1997b). Optimal Portfolio Choice and Equilibrium Valuation with Regime-
Switching Mean Returns. Working Paper, Department of Engineering- Economic
Systems and Operations Research, Stanford University.
Honda, T. (1997c). Optimal Portfolio Choice for Unobservable and Regime-Switching
Mean Returns. Working Paper, Department of Engineering-Economic Systems and
Operations Research, Stanford University.
Hong, C. and L. Epstein (1989). Non-Expected Utility Preferences in a Temporal Frame-
work with an Application to Consumption-Savings Behavior. Working Paper, De-
partment of Political Economy, Johns Hopkins University.
Howe, M. and B. Rustem (1994a). Minimax Hedging Strategy. Working Paper, Financial
Options Research Centre, University of Warwick.
Howe, M. and B. Rustem (1994b). Multi-Period Minimax Hedging Strategies. Working
Paper, Financial Options Research Centre, University of Warwick.
Huang, C.-F. (1985a). Information Structures and Equilibrium Asset Prices. Journal of
Economic Theory 31, 33–71.
Huang, C.-F. (1985b). Information Structures and Viable Price Systems. Journal of
Mathematical Economics 14, 215–240.396 BIBLIOGRAPHY
Huang, C.-F. (1985c). Discussion on ‘Towards a Semigroup Pricing Theory’. Proceedings
of the Journal of Finance 40, 861–862.
Huang, C.-F. (1987a). An Intertemporal General Equilibrium Asset Pricing Model: The
Case of Diffusion Information. Econometrica 55, 117–142.
Huang, C.-F. and H. Pagès (1992). Optimal Consumption and Portfolio Policies with
an Infinite Horizon: Existence and Convergence. Annals of Applied Probability 2,
36–64.
Huang, C.-F. and T. Zariphopoulou (1994). Further Results on Continuous-Time Port-
folio Turnpike Theorem. Working Paper, Fixed Income Derivatives Research, Gold-
man, Sachs and Company, New York.
Huang, H. P. C.-F. (1992). Optimal Consumption and Portfolio Policies with an Infinite
Horizon: Existence and Convergence. Annals of Applied Probability 2, 36–64.
Huang, J., M. Subrahmanyam, and G. Yu (1995). Pricing and Hedging American Op-
tions: A Recursive Integration Method. Working Paper, Leonard N. Stern School
of Business, New York University.
Huang, M. (1995). Liquidity Shocks and Equilibrium Liquidity Premia. Working Paper,
Graduate School of Business, Stanford University.
Huang, P. and H. Wu (1994). Competitive Equilibrium of Incomplete Markets for Se-
curities with Smooth Payoffs. Journal of Mathematical Economics 23, 219–234.
Hubalek, F. and W. Schachermayer (1997). When Does Convergence of Asset Price Pro-
cesses Imply Convergence of Option Prices? Working Paper, Institut für Statistik,
Universität Wien, Austria.
Hull, J. (1993). Options, Futures, and Other Derivative Securities (2d ed.). Englewood
Cliffs, N.J.: Prentice-Hall.
Hull, J. and A. White (1987). The Pricing of Options on Assets with Stochastic Volatil-
ities. Journal of Finance 2, 281–300.
Hull, J. and A. White (1990a). Pricing Interest Rate Derivative Securities. Review of
Financial Studies 3, 573–592.
Hull, J. and A. White (1990b). Valuing Derivative Securities Using the Explicit Finite
Difference Method. Journal of Financial and Quantitative Analysis 25, 87–100.
Hull, J. and A. White (1994). Numerical Procedures for Implementing Term Structure
Models. Working Paper, Faculty of Management, University of Toronto.
Husseini, S., J.-M. Lasry, and M. Magill (1990). Existence of Equilibrium with Incom-
plete Markets. Journal of Mathematical Economics 19, 39–68.
Hutton, J. (1995). Fast Valuation of Derivative Securities. Working Paper, Department
of Mathematics, University of Essex.
Ibanez, A. and F. Zapatero (1999). Monte Carlo Valuation of American Options through
Computation of the Optimal Exercise Frontier. Working Paper, Departamento de
Administracion, ITAM, Mexico.
Ikeda, N. and S. Watanabe (1981). Stochastic Differential Equations and Diffusion Pro-
cesses. Amsterdam: North-Holland.BIBLIOGRAPHY 397
Ingersoll, J. (1992). Optimal Consumption and Portfolio Rules with Intertemporally
Dependent Utility of Consumption. Journal of Economic Dynamics and Control
16, 681–712.
Iyengar, G. and T. Cover (1997). Analysis of Growth-Rate in the Presence of Transac-
tion Costs. Working Paper, Information Systems Laboratory, Stanford University.
Jacka, S. (1984). Optimal Consumption of an Investment. Stochastics 13, 45–60.
Jacka, S. (1991). Optimal Stopping and the American Put. Mathematical Finance 1,
1–14.
Jackwerth, J. (1996a). Generalized Binomial Trees. Working Paper, Haas School of
Business, University of California at Berkeley.
Jackwerth, J. (1996b). Recovering Risk Aversion from Option Prices and Realized Re-
turns. Working Paper, Haas School of Business, University of California at Berkeley.
Jackwerth, J. and M. Rubinstein (1996a). Implied Binomial Trees: Generalizations and
Empirical Tests. Working Paper, Haas School of Business, University of California,
Berkeley.
Jackwerth, J. and M. Rubinstein (1996b). Recovering Probability Distributions from
Contemporaneous Security Prices. Journal of Finance 51, 1611–1631.
Jackwerth, J. and M. Rubinstein (1996c). Recovering Stochastic Processes from Option
Prices. Working Paper, Haas School of Business, University of California , Berkeley.
Jacod, J. and A. Shiryaev (1998). Local Martingales and the Fundamental Asset Pricing
Theorems in the Discrete-Time Case. Finance and Stochastics 2, 259–274.
Jaillet, P., D. Lamberton, and B. Lapeyre (1988). Inéquations variationelles et théorie
des options. Comtes rendus de l’academie de sciences de Paris 307, 961–965.
Jaillet, P., D. Lamberton, and B. Lapeyre (1990). Variational Inequalities and the Pric-
ing of American Options. Working Paper, CERMA-ENPC, La Courtine, France.
Jakubenas, P. (1999). On Option Pricing in Certain Incomplete Markets. Working Pa-
per, Laboratoire de Probabilités, Université Paris 6.
Jamshidian, F. (1989c). Free Boundary Formulas for American Options. Working Paper,
Financial Strategies Group, Merrill Lynch Capital Markets, New York.
Jamshidian, F. (1991). Forward Induction and Construction of Yield Curve Diffusion
Models. Journal of Fixed Income June, 62–74.
Jamshidian, F. (1991b). Commodity Option Evaluation in the Gaussian Futures Term
Structure Model. Review of Futures Markets 10, 324–346.
Jamshidian, F. (1993b). Options and Futures Evaluation with Deterministic Volatilities.
Mathematical Finance 3, 149–159.
Jamshidian, F. (1997). A note on analytical valuation of double barrier options. Working
Paper, Sakura Global Capital.
Jamshidian, F. and M. Fein (1990). Closed Form Solutions for Oil Futures and European
Options in the Gibson-Schwartz Model: A Comment. Working Paper, Financial
Strategies Group, Merrill Lynch Capital Markets, New York.398 BIBLIOGRAPHY
Jamshidian, F. and Y. Zhu (1996). Scenario Simulation Model: Theory and Methodol-
ogy. Working Paper, Sakura Global Capital, London.
Jarrow, R. and D. Madan (1991). A Characterization of Complete Security Markets on
a Brownian Filtration. Mathematical Finance 1, 31–44.
Jarrow, R. and D. Madan (1994). Valuing and Hedging Contingent Claims on Semi-
martingales. Working Paper, Johnson Graduate School of Management, Cornell
University.
Jarrow, R. and A. Rudd (1983). Option Pricing. Homewood, Ill.: Richard D. Irwin.
Jeanblanc, M. and M. Pontier (1990). Optimal Portfolio for a Small Investor in a Market
Model with Discontinuous Prices. Applied Mathematics and Optimization 22, 287–
310.
Johnson, B. (1994). Dynamic Asset Pricing Theory: The Search for Implementable
Results. Working Paper, Engineering School, Stanford University.
Johnson, H. (1987). Options on the Maximum or the Minimum of Several Assets. Jour-
nal of Financial and Quantitative Analysis 22, 277–283.
Johnson, H. and D. Shanno (1987). The Pricing of Options when the Variance is Chang-
ing. Journal of Financial and Quantitative Analysis 22, 143–151.
Johnson, H. and R. Stulz (1987). The Pricing of Options with Default Risk. Journal of
Finance 42, 267–280.
Jones, R. and R. Jacobs (1986). History Dependent Financial Claims: Monte Carlo
Valuation. Working Paper, Department of Finance, Simon Fraser Universit y, Van-
couver, Canada.
Jorgensen, P. (1994a). American Option Pricing. Working Paper, School of Business,
Institute of Management, University of Aarhaus, Denmark.
Jorion, P. (1988). On Jump Processes in the Foreign Excange and Stock Markets. The
Review of Financial Studies 1, 427–445.
Jouini, E. and H. Kallal (1991). Martingales, Arbitrage, and Equilibrium in Security
Markets with Transactions Costs. Journal of Economic Theory.
Jouini, E. and H. Kallal (1993a). Efficient Trading Strategies in the Presence of Market
Frictions. Working Paper, CREST-ENSAE, Paris.
Jouini, E. and H. Kallal (1993b). Portfolio Choice and Market Frictions. Working Paper,
ENSAE, and Laboratoire d’Econométrie de l’Ecole Polytechnique, Paris, France.
Jouini, E., P. Koehl, and N. Touzi (1995). Incomplete Markets, Transaction Costs and
Liquidity Effects. Working Paper, Crest-Ensae, Université de Paris I.
Joy, C., P. Boyle, and K. Tan (1996). Quasi-Monte Carlo Methods in Numerical Finance.
Management Science 42, 926–938.
Ju, N. (1997a). Fourier Transformation, Martingale, and the Pricing of Average-Rate
Derivatives. Working Paper, Haas School of Business, University of California at
Berkeley.
Ju, N. (1997b). Pricing American Perpetual Lookback Options. Working Paper, Haas
School of Business, University of California at Berkeley.BIBLIOGRAPHY 399
Judd, K. (1989). Minimum Weighted Residual Methods for Solving Dynamic Economic
Models. Working Paper, Hoover Institution, Stanford University.
Judd, K. (1997). Incomplete Asset Markets with Heterogenous Tastes and Idiosyncratic
Income. Working Paper, Hoover Institution, Stanford University.
Judd, K., F. Kubler, and K. Schmedders (1997). Computing Equilibria in Infinite Hori-
zon Finance Economies - The Case of One Asset. Working Paper, Hoover Institu-
tion, Stanford University.
Kabanov, Y. (1996). On the FTAP of Kreps-Delbaen-Schachermayer. Working Paper,
Laboratoire de Mathématiques, Université de Franche-Comté.
Kabanov, Y. and D. Kramkov (1993). No-Arbitrage and Equivalent Martingale Mea-
sures: An Elementary Proof of the Harrison-Pliska Theorem. Working Paper, Cen-
tral Economics and Mathematics Institute, Moscow.
Kabanov, Y. and D. Kramkov (1995). Asymptotic Arbitrage in Large Financial Markets.
Working Paper, Central Economics and Mathematics Institute, Moscow.
Kajii, A. (1994). Anonymity and Optimality of Competitive Equilibrium when Markets
are Incomplete. Journal of Economic Theory 64, 115–129.
Kakutani, S. (1941). A Generalization of Brouwer’s Fixed-Point Theorem. Duke Math-
ematical Journal 8, 451–459.
Kakutani, S. (1993). Gradient of the Representative Agent Utility When Agents Have
Stochastic Recursive Preferences. Working Paper, Graduate School of Business,
Stanford University. Forthcoming in Journal of Mathematical Economics.
Kan, R. (1995). Structure of Pareto Optima when Agents Have Stochastic Recursive
Preferences. Journal of Economic Theory 66, 626–631.
Kandori, M. (1988). Equivalent Equilibria. International Economic Review 29, 401–
417.
Karatzas, I. (1988). On the Pricing of American Options. Applied Mathematics and
Optimization 17, 37–60.
Karatzas, I. (1989). Optimization Problems in the Theory of Continuous Trading. SIAM
Journal of Control and Optimization 27, 1221–1259.
Karatzas, I. (1991). A Note on Utility Maximization under Partial Obervations. Math-
ematical Finance 1, 57–70.
Karatzas, I. (1993). IMA Tutorial Lectures 1–3: Minneapolis. Working Paper, Depart-
ment of Statistics, Columbia University.
Karatzas, I. and S.-G. Kou (1994). On the Pricing of Contingent Claims under Con-
straints. Working Paper, Department of Statistics, Columbia University.
Karatzas, I., P. Lakner, J. Lehoczky, and S. Shreve (1990). Equilibrium in a Simpli-
fied Dynamic, Stochastic Economy with Heterogeneous Agents. Working Paper,
Department of Mathematics, Carnegie-Mellon University.
Karatzas, I., J. Lehoczky, S. Sethi, and S. Shreve (1986). Explicit Solution of a General
Consumption/Investment Problem. Mathematics of Operations Research 11, 261–
294.400 BIBLIOGRAPHY
Karatzas, I., J. Lehoczky, and S. Shreve (1987). Optimal Portfolio and Consumption
Decisions for a ‘Small Investor’ on a Finite Horizon. SIAM Journal of Control and
Optimization 25, 1157–1186.
Karatzas, I., J. Lehoczky, and S. Shreve (1991). Equilibrium Models with Singular Asset
Prices. Mathematical Finance 1/3, 11–30.
Karatzas, I., J. Lehoczky, S. Shreve, and G.-L. Xu (1991). Martingale and Duality
Methods for Utility Maximization in Incomplete Markets. SIAM Journal of Control
and Optimization 29, 702–730.
Karatzas, I. and S. Shreve (1988). Brownian Motion and Stochastic Calculus. New York:
Springer-Verlag.
Karatzas, I. and X.-X. Xue (1990). Utility Maximization in a Financial Market with
Partial Observations. Working Paper, Department of Mathematics, Rutgers Uni-
versity.
Karoui, N.E., M. Jeanblanc, and S. Shreve (1995). Robustness of the Black-Scholes
Formula. Working Paper, Equipe d’Analyse et Probabilités, Université d’Evry Val
d’Essonne.
Karoui, N.E. and M. Jeanblanc-Picqué (1994). Optimisation of Consumption with La-
bor Income. Working Paper, Laboratoire de Probabilités, Université de Paris VI.
Karoui, N.E., C. Kapoudjian, E. Pardoux, S. Peng, and M. Quenez (1995). Reflected
Solutions of Backward SDE’s, and Related Obstacle Problems for PDE’s. Working
Paper, Laboratoire de Probabilités, Université Pierre et Marie Curie, Paris.
Karoui, N.E., S. Peng, and M. Quenez (1994). Backward Stochastic Differential Equa-
tions in Finance. Working Paper, Laboratoire de Probabilités, Université de Paris
VI.
Kat, H. (1993a). Replicating Ordinary Call Options in an Imperfect Market: A Stochas-
tic Simulation Study. Working Paper, Derivatives Department, MeesPierson N.V.,
Amsterdam.
Kat, H. (1993b). Hedging Lookback and Asian Options. Working Paper, Derivatives
Department, MeesPierson N.V., Amsterdam.
Kehoe, T. and D.K. Levine (1993). Debt-Constrained Asset Markets. Review of Eco-
nomic Studies 60, 865–888.
Kim, I. (1990). The Analytic Valuation of American Options. Review of Financial Stud-
ies 3, 547–572.
Kind, P., R. Liptser, and W. Runggaldier (1991). Diffusion Approximation in Past De-
pendent Models and Applications to Option Pricing. Annals of Applied Probability
1, 379–405.
Kishimoto, N. (1989). A Simplified Approach to Pricing Path Dependent Securities.
Working Paper, Fuqua School of Business, Duke University.
Kocherlakota, N. (1990). On the Discount Factor in ‘Growth’ Economies. Journal of
Monetary Economics 25, 43–47.
Koo, H.-K. (1991). Consumption and Portfolio Choice with Uninsurable Income Risk.
Working Paper, Department of Economics, Princeton University.BIBLIOGRAPHY 401
Koo, H.-K. (1994a). Consumption and Portfolio Selection with Labor Income I: Eval-
uation of Human Capital. Working Paper, Olin School of Business, Washington
University, St. Louis.
Koo, H.-K. (1994b). Comsumption and Portfolio Selection with Labor Income II: The
Life Cycle-Permanent Income Hypothesis. Working Paper, Olin School of Business,
Washington University, St. Louis.
Koopmans, T. (1960). Stationary Utility and Impatience. Econometrica 28, 287–309.
Korn, R. (1992). Contingent Claim Valuation in a Market with a Higher Interest Rate for
Borrowingthan for Lending. Working Paper, Department of Mathematics, Johannes
Gutenberg-Universität Mainz.
Krasa, S. and J. Werner (1991). Equilibria with Options: Existence and Indeterminacy.
Journal of Economic Theory 54, 305–320.
Kraus, A. and R. Litzenberger (1975). Market Equilibrium in a Multiperiod State Pref-
erence Model with Logarithmic Utility. Journal of Finance 30, 1213–1227.
Kreps, D. (1979). Three Essays on Capital Markets. Working Paper, Institute for Math-
ematical Studies in the Social Sciences, Stanford University.
Kreps, D. (1981). Arbitrage and Equilibrium in Economies with Infinitely Many Com-
modities. Journal of Mathematical Economics 8, 15–35.
Kreps, D. (1982). Multiperiod Securities and the Efficient Allocation of Risk: A Com-
ment on the Black-Scholes Option Pricing Model, pp. 203–232. Chicago: University
of Chicago Press.
Kreps, D. (1988). Notes on the Theory of Choice. Boulder, Colo., and London: Westview
Press.
Kreps, D. and E. Porteus (1978). Temporal Resolution of Uncertainty and Dynamic
Choice. Econometrica 46, 185–200.
Krylov, N. (1980). Controlled Diffusion Processes. New York: Springer-Verlag.
Kubler, F. and K. Schmedders (1997). Computing Equilibria in Stochastic Finance
Economies. Working Paper, Department of Economics, Yale University, forthcom-
ing: Computational Economics.
Kunitomo, N. (1993). Long-Term Memory and Fractional Brownian Motion in Financial
Markets. Working Paper, Faculty of Economics, University of Tokyo.
Kunitomo, N. and A. Takahashi (1996). The Asymptotic Expansion Approach to the
Valuation of Interest Rates Contingent Claims. Working Paper, Faculty of Eco-
nomics, University of Tokyo.
Kurz, M. (1992). Asset Prices with Rational Beliefs. Working Paper, Department of
Economics, Stanford University.
Kurz, M. (1993). General Equilibrium with Endogenous Uncertainty. Working Paper,
Department of Economics, Stanford University.
Kurz, M. (1997). Social States of Belief and the Determinants of the Equity Risk Pre-
mium in A Rational Belief Equilibrium. Working Paper, Department of Economics,
Stanford University.402 BIBLIOGRAPHY
Kurz, M. and A. Beltratti (1996). The Equity Premium is No Puzzle. Working Paper,
Department of Economics, Stanford University.
Kusuoka, S. (1992a). Arbitrage and Martingale Measure. Working Paper, Research
Institute for Mathematical Sciences, Kyoto University.
Kusuoka, S. (1992b). Consistent Price System when Transaction Costs Exist. Working
Paper, Research Institute for Mathematical Sciences, Kyoto University.
Kusuoka, S. (1993). Limit Theorem on Option Replication Cost with Transaction Costs.
Working Paper, Department of Mathematics, University of Tokyo.
Kusuoka, S. (1996a). A Remark on American Securities. Working Paper, Graduate
School of Mathematical Sciences, University of Tokyo.
Kusuoka, S. (1999b). Approximation of Expectation of Diffusion Process and Mathe-
matical Finance. Working Paper, Graduate School of Mathematical Sciences, Uni-
versity of Tokyo.
Kusuoka, S. and H. Nakagawa (1997). On Spot Rate Models Induced by Equilibrium
Model. Working Paper, Department of Mathematical Science, University of Tokyo.
Kuwana, Y. (1994). Optimal Consumption/Investment Decisions with Partial Observa-
tions. Working Paper, “Optimal Consumption/Investment Decisions with Partial
Observations,” Statistics Department, Stanford University.
Kuwana, Y. (1995). An Extension of Krylov’s Aproach to Stochastic Solutions: The
Space LE. Hitotsubashi Journal of Economics.
Kuwana, Y. (1995b). Certainty Equivalence and Logarithmic Utilities in Consump-
tion/Investment Problems. Working Paper, Economics Department, Hitotsubashi
University, Tokyo, forthcoming: Mathematical Finance.
Kydland, F.E. and E. Prescott (1991). Indeterminacy in Incomplete Market Economies.
Economic Theory 1, 45–62.
Lacoste, V. (1995). Wiener Chaos: A New Approach to Option Hedging. Working
Paper, Department Finance, ESSEC.
Lagnado, R. and S. Osher (1996). A Technique for Calibrating Derivative Security
Pricing Models: Numerical Solution of an Inverse Problem. Working Paper, C-ATS,
Palo Alto.
Lai, D. (1995). Diffusion Processes and ARCH Models in Option Pricing. Working
Paper, School of Public Health, University of Texas, Houston.
Lakner, P. (1988). Optimal Consumption and Investment on a Finite Horizon with
Stochastic Commodity Prices. In C.M. C.Byrnes and R. Saeks (Eds.), Linear Cir-
cuits, Systems and Signal Processing: Theory and Application, pp. 457–464. North-
Holland: Elsevier Science Publishers B.V.
Lakner, P. (1993). Equivalent Local Martingale Measures and Free Lunch in a Stochastic
Model of Finance with Continuous Trading. Working Paper, Statistics and Opera-
tion Research Department, New York University.
Lakner, P. (1993a). Martingale Measures for a Class of Right-Continuous Processes.
Mathematical Finance 3, 43–54.BIBLIOGRAPHY 403
Lakner, P. (1994a). Minimization of the Expected Squared Difference of a Random
Variable and Stochastic Integrals with a Given Integrator.Working Paper, Statistics
and Operation Research Department, New York University.
Lakner, P. (1994b). Optimal Investment Processes for Utility Maximazation Problems
with Restricted Information. Working Paper, Statistics and Operation Research
Department, New York University.
Lakner, P. (1995). Utility Maximization with Partial Information. Stochastic Processes
and Their Applications 56, 247–273.
Lakner, P. and E. Slud (1991). Optimal Consumption by a Bond Investor: the Case
of Random Interest Rate Adapted to a Point Process. SIAM J. Control and Opti-
mization 29, 638–655.
Lamberton, D. (1993). Convergence of the Critical Price in the Approximation of Amer-
ican Options. Mathematical Finance 3, 179–190.
Lamberton, D. (1997). Error Estimates for the Binomial Approximation of American
Put Options. Working Paper, Equipe d’Analyse et de Mathématiques Appliquées,
Université De Marne-La-Vallée, forthcoming: The Annals of Applied Probability.
Lamberton, D. and G. Pagès (1990). Sur l’approximation des réduites. Annales de
l’Institut Henri Poincaré 26, 331–355.
Lamoureux, C. and W. Lastrapes (1993). Forecasting Stock-Return Variance: Toward
an Understanding of Stochastic Implied Volatilities. Review of Financial Studies 6,
293–327.
Lawson, J. and J. Morris (1978). The Extrapolation of First Order Methods for
Parabolic Partial Differential Equations I. SIAM Journal of Numerical Analysis
15, 1212–1224.
Lee, B. and B. Ingram (1991). Simulation Estimation of Time-Series Models. Journal
of Econometrics 47, 197–205.
Lee, J.-J. (1990). The Valuation of American Calls. Working Paper, Graduate School
of Business, Stanford University.
Lee, J.-J. (1991). A Note on Binomial Approximation for Contingent Securities. Working
Paper, Graduate School of Business, Stanford University.
Lehoczky, J., S. Sethi, and S. Shreve (1983). Optimal Consumption and Investment
Policies Allowing Consumption Constraints and Bankruptcy. Mathematics of Op-
erations Research 8, 613–636.
Lehoczky, J., S. Sethi, and S. Shreve (1985). A Martingale Formulation for Optimal Con-
sumption/ Investment Decision Making. In Optimal Control and Economic Analysis
2, pp. 135–153. Amsterdam: North-Holland.
Lehoczky, J. and S. Shreve (1986). Explicit Equilibrium Solutions for a Multi-
Agent Consumption/Investment Problem. Working Paper, Department of Statis-
tics, Carnegie-Mellon University.
Leisen, D. The Random-Time Binomial Model. Working Paper, Stanford University.
Leland, H. (1985). Option Pricing and Replication with Transactions Costs. Journal of
Finance 40, 1283–1301.404 BIBLIOGRAPHY
LeRoy, S. (1973). Risk Aversion and the Martingale Property of Asset Prices. Interna-
tional Economic Review 14, 436–446.
Lesne, J.-P., J.-L. Prigent, and O. Scaillet (1998). Convergence of Discrete Time Op-
tion Pricing Models Under Stochastic Interest Rates. Working Paper, Université de
Cergy-Pontoise, France.
Levental, S. and A. Skorohod (1994). A Necessary and Sufficient Condition for Absence
of Arbitrage with Tame Portfolios. Working Paper, School of Business, Michigan
State University.
Levental, S. and A. Skorohod (1995). On the Possibility of Hedging Options in the
Presence of Transactions Costs. Working Paper, Michigan State University.
Levhari, D. and T. Srinivasan (1969). Optimal Savings under Uncertainty. Review of
Economic Studies 59, 153–165.
Levine, D. (1989). Infinite Horizon Equilibria with Incomplete Markets. Journal of
Mathematical Economics 18, 357–376.
Levine, D. and W. Zame (1996). Debt Constraints and Equilibium in Infinite Horizon
Economies with Incomplete Markets. Journal of Mathematical Economics 26, 103–
131.
Levy, A., M. Avellaneda, and A. Parás (1994). A New Approach for Pricing Derivative
Securities in Markets with Uncertain Volatilities: A ‘Case Study’ on the Trino-
mial Tree. Working Paper, Courant Institute of Mathematical Sciences, New York
University.
Li, A., P. Ritchken, and L. Sankarasubramanian (1995). Lattice Models for Pricing
American Interest Rate Claims. The Journal of Finance 1, 719–737.
Linetsky, V. (1996). The Path Integral Approach to Financial Modeling and Options
Pricing. Working Paper, Financial Engineering Program, Department of Industrial
and Operations Engineering, University of Michigan, Ann Arbor.
Linetsky, V. (1997). Step Options (The Feynman-Kac Approach to Occupation Time
Derivatives). Working Paper, Financial Engineering Program, Department of In-
dustrial and Operations Engineering, University of Michigan, Ann Arbor.
Lintner, J. (1965). The Valuation of Risky Assets and the Selection of Risky Investment
in Stock Portfolios and Capital Budgets. Review of Economics and Statistics 47,
13–37.
Lions, P.-L. (1981). Control of Diffusion Processes in RN
. Communications in Pure and
Applied Mathematics 34, 121–147.
Lions, P.-L. (1983). Optimal Control of Diffusion Processes. Working Paper, Université
de Paris IX, Dauphine.
Lioui, A. (1995). On Mean-Variance Hedging in Continuous Time with Imperfect Cor-
relation. Working Paper, Department of Economics, Bar Ilan University.
Liu, J. (1999). Portfolio Selection in Stochastic Environments. Working Paper, Stanford
University.BIBLIOGRAPHY 405
Loewenstein, M. and G. Willard (1998a). Rational Equilibrium Asset-Pricing Bubbles in
Continuous Trading Models. Working Paper, Olin School of Business, Washington
University in St. Louis.
Loewenstein, M. and G. Willard (1998b). Local Martingales, Arbitrage, and Viability:
Free Snacks and Cheap Thrills. Working Paper, Olin School of Business, Washing-
ton University in Saint Louis.
Löffler, A. (1994). Variance Aversion Implies µ–σ2
–Criterion. Working Paper,
Graduiertenkolleg des FB Wirtschaftswissenschaften, Berlin.
Long, J. (1990). The Numeraire Portfolio. Journal of Financial Economics 26.
Longstaff, F. and E. Schwartz (1998). Valuing American Options By Simulation: A Sim-
ple Least-Squares Approach. Working Paper, Anderson Graduate School of Man-
agement, University of California, Los Angeles.
Lu, S. and G. Yu (1993). Valuation of Options under Stochastic Volatility: The Garch
Diffusion Approach. Working Paper, Department of Mathematics, University of
Michigan.
Lucas, D. (1991). Asset Pricing with Undiversifiable Income Risk and Short Sales Con-
straints: Deepening the Equity Premium Puzzle. Working Paper, Kellogg School of
Management, Northwestern University.
Lucas, D. (1995). Market Fractions, Savings Behavior and Portfolio Choice. Working
Paper, Kellogg School of Management, Northwestern University.
Lucas, R. (1978). Asset Prices in an Exchange Economy. Econometrica 46, 1429–1445.
Luenberger, D. (1969). Optimization by Vector Space Methods. New York: Wiley.
Luenberger, D. (1984). Introduction to Linear and Nonlinear Programming (2d ed.).
Reading, Mass.: Addison-Wesley.
Luttmer, E. (1991). Asset Pricing in Economies with Frictions. Working Paper, Depart-
ment of Economics, University of Chicago.
Lynch, A. and P. Balduzzi (1998). Predictability and Transaction Costs: The Impact
on Rebalancing Rules and Behavior. Working Paper, New York University.
Lyons, T. (1995). Uncertain Volatility and the Risk-Free Synthesis of Derivatives. Ap-
plied Mathematical Finance 2, 117–133.
Ma, C.-H. (1991a). Market Equilibrium with Heterogeneous Recursive-Utility-
Maximizing Agents. Economic Theory 3, 243–266.
Ma, C.-H. (1991b). Valuation of Derivative Securities with Mixed Poisson-Brown-ian
Information and with Recursive Utility. Working Paper, Department of Economics,
University of Toronto.
Ma, C.-H. (1993). Intertemporal Recursive Utility in the Presence of Mixed Poisson-
Brownian Uncertainty. Working Paper, Department of Economics, McGill Univer-
sity.
Ma, C.-H. (1994). Discrete-Time Model of Asset Pricing in Incomplete Market: GE
Approach with Recursive Utility. Working Paper, Department of Economics, McGill
University.406 BIBLIOGRAPHY
Ma, C.-H. (1996). Attitudes Toward the Timing of Resolution of Uncertainty and the
Existence of Recursive Utility. Working Paper, Department of Economics, McGill
University, Montreal.
Ma, J. and J. Cvitanić (1996). Reflected Forward-Backward SDE’s and Obstacle Prob-
lems with Boundary conditions. Working Paper, Department of Mathematics, Pur-
due University.
Ma, J., P. Protter, and J. Yong (1993). Solving Forward-Backward Stochastic Differ-
ential Equations Explicitly—A Four Step Scheme. Working Paper, Institute for
Mathematics and Its Applications, University of Minnesota.
Ma, J. and J. Yong (1993). Solvability of Forward-Backward SDEs and the Nodal Set
of Hamilton-Jacobi-Bellman Equations. Working Paper, Institute for Mathematics
and its Applications, University of Minnesota.
Ma, J. and J. Yong (1997). Adapted Solution of a Degenerate Backward SPDE, with
Applications. Stochastic Processes and Their Applications ?, ?
Machina, M. (1982). ‘Expected Utility’ Analysis without the Independence Axiom.
Econometrica 50, 277–323.
Madan, D. (1988). Risk Measurement in Semimartingale Models with Multiple Con-
sumption Goods. Journal of Economic Theory 44, 398–412.
Madan, D. and E. Chang (1995). Volatility Smiles, Skewness Premia and Risk Metrics:
Applications of a Four Parameter Closed Form Generalization of Geometric Brow-
nian Motion to the Pricing of Options. Working Paper, University of Maryland.
Madan, D. and E. Chang (1996). Volatility Smiles, Skewness Premia and Risk Metrics:
Applications of a Four Parameter Closed Form Generalization of Geometric Brow-
nian Motion to the Pricing of Options. Working Paper, University of Maryland.
Madan, D., F. Milne, and H. Shefrin (1989). The Multinomial Option Pricing Model
and Its Brownian and Poisson Limits. Review of Financial Studies 2, 251–266.
Maghsoodi, Y. (1998). A Closed-Form Analytical Formula for Options with a Non-
Linear Stochastic Volatility. Working Paper, University of Southampton, UK.
Magill, M. and M. Quinzii (1994). Infinite Horizon Incomplete Markets. Econometrica
62, 853–880.
Magill, M. and M. Quinzii (1996). Incomplete Markets over an Infinite Horizon: Long-
Lived Securities and Speculative Bubbles. Journal of Mathematical Economics 26,
133–170.
Magill, M. and W. Shafer (1990). Characterisation of Generically Complete Real Asset
Structures. Journal of Mathematical Economics 19, 167–194.
Magill, M. and W. Shafer (1991). Incomplete Markets. In Handbook of Mathematical
Economics, Volume 4, pp. 1523–1614. Amsterdam: North-Holland.
Mankiw, G. (1986). The Equity Premium and the Concentration of Aggregate Shocks.
Journal of Financial Economics 17, 211–219.
Marcet, A. (1993). Simulation Analysis of Dynamic Stochastic Models: Applications
to Theory and Estimation. Working Paper, Department of Economics, Universitat
Pompeu Fabra, Barcelona.BIBLIOGRAPHY 407
Marcet, A. and D. Marshall (1994). Solving Nonlinear Rational Expectations Models by
Parameterized Expectations: Convergence to Stationary Solutions. Working Paper,
Universitat Pompeu Fabra, Department of Economics, Barcelona.
Marcet, A. and K. Singleton (1991). Optimal Consumption and Savings Decisions and
Equilibrium Asset Prices in a Model with Heterogeneous Agents Subject to Portfolio
Constraints. Working Paper, Carnegie-Mellon University and Graduate School of
Business, Stanford University.
Margrabe, W. (1978). The Value of an Option to Exchange One Asset for Another.
Journal of Finance 33, 177–186.
Marshall, D. (1992). Asset Return Volatility with Extremely Small Costs of Consump-
tion Adjustment. Working Paper, Kellogg Graduate School of Management, North-
western University.
Mas-Colell, A. (1985). The Theory of General Economic Equilibrium—A Differentiable
Approach. Cambridge: Cambridge University Press.
Mas-Colell, A. (1986a). The Price Equilibrium Existence Problem in Topological Vector
Lattices. Econometrica 54, 1039–1054.
Mas-Colell, A. (1986b). Valuation Equilibrium and Pareto Optimum Revisited. In W.
Hildenbrand and A. Mas-Colell (Eds.), Contributions to Mathematical Economics,
pp. 317–332. Amsterdam: North-Holland.
Mas-Colell, A. (1987). An Observation on Geanakoplos and Polemarchakis. Working
Paper, Department of Economics, Harvard University.
Mas-Colell, A. (1991). Indeterminacy in Incomplete Market Economies. Economic The-
ory 1, 45–62.
Mas-Colell, A. and P. Monteiro (1996). Self-Fulfilling Equilibria: An Existence Theorem
for a General State Space. Journal of Mathematical Economics 26, 51–62.
Mas-Colell, A. and W. Zame (1992). Equilibrium Theory in Infinite Dimensional
Spaces. In W. Hildenbrand and H. Sonnenschein (Eds.), Handbook of Mathematical
Econonomics, Volume4, pp. 1835–1898. Amsterdam: North-Holland.
McFadden, D. (1986). A Method of Simulated Moments for Estimation of Discrete
Response Models without Numerical Integration. Working Paper, Department of
Economics, Massachusetts Institute of Technology.
McKean, H. (1965). Appendix: Free Boundary Problem for the Heat Equation Arising
from a Problem in Mathematical Economics. Industrial Management Review 6,
32–39.
McKenzie, L. (1954). On Equilibrium in Graham’s Model of World Trade and Other
Competitive Systems. Econometrica 22, 147–161.
McManus, D. (1984). Incomplete Markets: Generic Existence of Equilibrium and Op-
timality Properties in an Economy with Futures Markets. Working Paper, Depart-
ment of Economics, University of Pennsylv ania.
Mehra, R. and E. Prescott (1985). The Equity Premium: A Puzzle. Journal of Monetary
Economics 15, 145–161.408 BIBLIOGRAPHY
Mehrling, P. (1990). Heterogeneity, Incomplete Markets, and the Equity Premium.
Working Paper, Department of Economics, Barnard College and Columbia Uni-
versity.
Mehrling, P. (1994). Idiosyncratic Risk, Borrowing Constraints and Asset Prices. Work-
ing Paper, Department of Economics, Barnard College, Columbia University, New
York.
Melino, A. and S. Turnbull (1990). Pricing Foreign Currency Options with Stochastic
Volatility. Journal of Econometrics 45, 239–265.
Merton, R. (1969). Lifetime Portfolio Selection under Uncertainty: The Continuous
Time Case. Review of Economics and Statistics 51, 247–257.
Merton, R. (1971). Optimum Consumption and Portfolio Rules in a Continuous Time
Model. Journal of Economic Theory 3, 373–413; Erratum 6 (1973): 213–214.
Merton, R. (1973). The Theory of Rational Option Pricing. Bell Journal of Economics
and Management Science 4, 141–183.
Merton, R. (1973a). An Intertemporal Capital Asset Pricing Model. Econometrica 41,
867–888.
Merton, R. (1976). Option Pricing when the Underlying Stock Returns are Discontin-
uous. Journal of Financial Economics 5, 125–144.
Merton, R. (1977). On the Pricing of Contingent Claims and the Modigliani-Miller
Theorem. Journal of Financial Economics 5, 241–250.
Merton, R. (1990b). Continuous-Time Finance. Oxford: Basil Blackwell.
Milshtein, G. (1974). Approximate Integration of Stochastic Differential Equations. The-
ory of Probability and Its Applications 3, 557–562.
Milshtein, G. (1978). A Method of Second-Order Accuracy Integration of Stochastic
Differential Equations. Theory of Probability and Its Applications 23, 396–401.
Mirrlees, J. (1974). Optimal Accumulation under Uncertainty: The Case of Stationary
Returns to Investment. In J.D. eze (Ed.), Allocation under Uncertainty: Equilibrium
and Optimality, pp. 36–50. New York: Wiley.
Mitchell, A. and D. Griffiths (1980). The Finite Difference Method in Partial Differential
Equations. New York: John Wiley.
Miura, R. (1992). A Note on Look-Back Options Based on Order Statistics. Hitotsubashi
Journal of Commerce and Management 27, 15–28.
Moerbeke, P.V. (1976). On Optimal Stopping and Free Boundary Problems. Archive
for Rational Mechanics and Analysis 60, 101–148.
Monat, P. and C. Stricker (1993a). Décomposition de Föllmer-Schweizer et Fermeture
de GT (Θ). Working Paper, Département de Mathématiques, Université Franche-
Comté, France.
Monat, P. and C. Stricker (1993b). Follmer-Schweizer Decomposition and Closedness
of GT (Θ). Working Paper, Laboratoire de Mathématiques, URA CNRS 741, Paris,
France.BIBLIOGRAPHY 409
Monteiro, P. (1993). Inada’s Condition Imply Equilibrium Existence is Rare. Working
Paper, Department of Economics, Universidade Federal do Rio de Janeiro.
Monteiro, P. (1996). A New Proof of the Existence of Equilibrium in Incomplete Markets
Economies. Working Paper.
Morokoff, W. and R. Caflisch (1993). A Quasi-Monte Carlo Approach to Particle Simu-
lation of the Heat Equation. SIAM Journal of Numerical Analysis 30, 1558–1573.
Morokoff, W. and R. Caflisch (1994). Quasi-Random Sequences and Their Discrepan-
cies. SIAM Journal of Scientific Computing 15, 1251–1279.
Morokoff, W. and R. Caflisch (1995). Quasi-Monte Carlo Integration. Journal of Com-
putational Physics 122, 218–230.
Moskowitz, B. and R. Caflisch (1994). Smoothness and Dimension Reduction in Quasi-
Monte Carlo Methods. Working Paper, Department of Mathematics, University of
California, Los Angeles.
Müller, S. (1985). Arbitrage Pricing of Contingent Claims. Lecture Notes in Economics
and Mathematical Systems, vol. 254. New York: Springer-Verlag.
Munk, C. (1996). Optimal Consumption/Investment Choice with Undiversifiable In-
come Risk: Numerical Solution. Working Paper, Department of Management,
School of Business and Economics, Odense University, Denmark.
Munk, C. (1997). No-Arbitrage Bounds on Contingent Claims Prices with Convex Con-
straints on the Dollar Investments of the Hedge Portfolio. Working Paper, Depart-
ment of Management, Odense University, Denmark.
Myneni, R. (1992a). The Pricing of the American Option. Annals of Applied Probability
2, 1–23.
Myneni, R. (1992b). Continuous-Time Relationships Between Futures and Forward
Prices. Working Paper, Graduate School of Business, Stanford University.
Naik, V. (1993). Asset Prices in Dynamic Production Economies with Time Varying
Risk. Working Paper, Faculty of Commerce and Business Administration, Univer-
sity of British Columbia.
Naik, V. and R. Uppal (1992). Leverage Constraints and the Optimal Hedging of Stock
and Bond Options. Working Paper, Faculty of Commerce and Business Adminis-
tration, University of British Columbia.
Negishi, T. (1960). Welfare Economics and Existence of an Equilibrium for a Compet-
itive Economy. Metroeconometrica 12, 92–97.
Nelson, D. (1990). ARCH Models as Diffusion Appoximations. Journal of Econometrics
45, 7–38.
Nelson, D. (1991). Conditional Heteroskedasticity in Asset Returns: A New Approach.
Econometrica 59, 347–370.
Nelson, D. (1992). Filtering and Forecasting with Misspecified ARCH Models I. Journal
of Econometrics 52, 61–90.
Nelson, D. (1993). Asymptotic Filtering and Smoothing Theory for Multivariate Arch
Models. Working Paper, University of Chicago, Graduate School of Business and
N.B.E.R.410 BIBLIOGRAPHY
Nelson, D. and K. Ramaswamy (1989). Simple Binomial Processes as Diffusion Approx-
imations in Financial Models. Review of Financial Studies 3, 393–430.
Neuberger, A. and S. Hodges (1996). Equilibrium and the Role of Options in an Econ-
omy with Stochastic Volatility. Working Paper, Financial Options Research Center,
University of Warwick.
Newton, N. (1990). Asymptotically Efficient Runge-Kutta Methods for a Class of Ito
and Stratonovich Equations. Working Paper, Department of Electrical Engineering,
University of Essex.
Nielsen, J. and K. Sandmann (1996). The Pricing of Asian Options Under Stochastic
Interest Rates. Applied Mathematical Finance 3, 209–236.
Nielsen, L. (1990a).Equilibrium in CAPM without a Riskless Asset. Review of Economic
Studies 57, 315–324.
Nielsen, L. (1990b). Existence of Equilibrium in CAPM. Journal of Economic Theory
52, 223–231.
Nielsen, L. (1993a). Two-Fund Separation and Equilibrum. Working Paper, INSEAD,
Fontainebleau, France.
Nielsen, L. (1993b). Robustness of the Market Model. Economic Theory 3, 365–370.
Nielsen, L.T. and J. Saá-Requejo (1992). Exchange Rate and Term Structure Dynamics
and the Pricing of Derivative Securities. Working Paper, INSEAD, Fontainebleau,
France.
Ocone, D. and I. Karatzas (1991). A Generalized Clark Representation Formula, with
Application to Optimal Portfolios. Stochastics and Stochastics Reports 34, 187–220.
Ōhashi, K. (1991). A Note on the Terminal Date Security Prices in a Continuous Time
Trading Model with Dividends. Journal of Mathematical Economics 20, 219–224.
Oliveira, D. (1994). Arbitrage Pricing of Integral Options. Working Paper, Instituto de
Matemática Pura e Applicada, Rio de Janeiro.
Ordentlich, E. and T. Cover (1996). The Cost of Achieving the Best Portfolio in Hind-
sight. Working Paper, Department of Electrical Engineering, Stanford University.
Owen, A. (1996a). Monte Carlo Variance of Scrambled Net Quadrature. Working Paper,
Department of Statistics, Stanford University, forthcoming: SIAM Jounal.
Owen, A. (1996b). Scrambled Net Variance for Integrals of Smooth Functions. Work-
ing Paper, Department of Statistics, Stanford University, forthcoming: Annals of
Statistics.
Owen, A. and D. Tavella (1996). Scrambled Nets for Value at Risk Calculations. Working
Paper, Statistics Department, Stanford University.
Page, M. and D. Costas (1996). The Value-at-Risk of a Portfolio of Currency Deriva-
tives Under Worst-Case Distribution Assumptions. Working Paper, Susquehanna
Investment Group, Philadelphia.
Pagès., H. (1987). Optimal Consumption and Portfolio Policies when Markets are In-
complete. Working Paper, Department of Economics, Massachusetts Institute of
Technology.BIBLIOGRAPHY 411
Pakes, A. and D. Pollard (1986). The Asymptotics of Simulation Estimators. Working
Paper, Department of Economics, University of Wisconsin.
Pan, W.-H. (1992). A Second Welfare Theorem for Constrained Efficient Allocations
in Incomplete Markets. Working Paper, Department of Economics, University of
Rochester.
Pan, W.-H. (1993). Constrained Efficient Allocations in Incomplete Markets: Character-
ization and Implementation. Working Paper, Department of Economics, University
of Rochester.
Pappalardo, L. (1996). Option Pricing and Smile Effect When Underlying Stock Prices
are Driven by a Jump Process. Working Paper, Financial Options Research Centre,
University of Warwick.
Pardoux, E. and S. Peng (1990). Adapted Solution of a Backward Stochastic Differential
Equation. Systems and Control Letters 14, 55–61.
Pardoux, E. and S. Peng (1994). Some Backward Stochastic Differencial Equations with
Non-Lipschitz Coefficients. Working Paper, Department of Mathematics, Université
de Provence.
Pearson, N. and T.-S. Sun (1994). An Empirical Examination of the Cox, Ingersoll, and
Ross Model of the Term Structure of Interest Rates using the Method of Maximum
Likelihood. Journal of Finance 54, 929–959.
Peng, S. (1992). Backward Stochastic Differential Equations and Applications to Opti-
mal Control. Working Paper, Department of Mathematics, Shandong University.
Peng, S. (1993). Adapted Solution of Backward Stochastic Equations and Related Par-
tial Differential Equations. Working Paper, Department of Mathematics, Shandong
University.
Pham, H. (1995). Optimal Stopping, Free Boundary and American Option in a Jump
Diffusion Model. Working Paper, forthcoming: Applied Mathematics and Optimiza-
tion, CEREMADE Université Paris IX Dauphine.
Pham, H. and N. Touzi (1993). Intertemporal Equilibrium Risk Premia in a Stochastic
Volatility Model. Working Paper, CREST, Paris.
Pham, H. and N. Touzi (1995). Equilibrium State Prices in a Stochastic Volatility
Model. Working Paper, Equipe d’Analyse et de Mathématiques Appliquées, Uni-
versité de Marne-La-Vallée.
Pietra, T. (1992). Indeterminacy in General Equilibrium Economies with Incomplete
Financial Markets–Mixed Asset Returns. Journal of Mathematical Economics 21,
155–172.
Pikovsky, I. and I. Karatzas (1995). Anticipative Portfolio Optimization. Working Pa-
per, Department of Mathematics, Carnegie-Mellon University, Pittsburgh.
Pikovsky, I. and I. Karatzas (1998). Stochastic Equilibrium with Differential Informa-
tion. Finance and Stochastics.
Pikovsky, I. and S. Shreve (1996a). Perpetual Convertible Debt. Working Paper, De-
partment of Mathematics, Courant Institute, New York.412 BIBLIOGRAPHY
Pikovsky, I. and S. Shreve (1996b). Callable Convertible Bonds. Working Paper, De-
partment of Mathematics, Courant Institute, New York.
Platen, E. and M. Schweizer (1994). On Smile and Skewness. Working Paper, School
of Mathematical Sciences Centre for Mathematics and Its Applications, The Aus-
tralian National University, Canberra.
Pliska, S. (1986). A Stochastic Calculus Model of Continuous Trading: Optimal Port-
folios. Mathematics of Operations Research 11, 371–382.
Pliska, S. and M. Selby (1994). On a Free Boundary Problem that Arises in Portfolio
Management. Working Paper, Financial Options Research Centre, University of
Warwick.
Polemarchakis, H. and B. Ku (1990). Options and Equilibrium. Journal of Mathematical
Economics 19, 107–112.
Polemarchakis, H. and P. Siconolfi (1991). Competitive Equilibria without Free Disposal
or Nonsatiation. Working Paper, CORE, Université Catholique de Louvain.
Pollard, D. (1984). Convergence of Stochastic Processes. New York: Springer-Verlag.
Prescott, E. and R. Mehra (1980). Recursive Competitive Equilibrium: The Case of
Homogeneous Households. Econometrica 48, 1365–1379.
Press, W., B. Flannery, S. Teukolsky, and W. Vetterling (1993). Numerical Recipes in
C: The Art of Scientific Computing (2d ed.). Cambridge: Cambridge University
Press.
Prigent, J.-L. (1994). From Discrete to Continuous Time Finance: Weak Convergence
of the Optimal Financial Trading Strategies. Working Paper, Institute of Mathe-
matical Research of Rennes, University of Rennes.
Prigent, J.-L. (1995). Incomplete Markets: Convergence of Options Values under
the Minimal Martingale Measure. Working Paper, THEMA, Université de Cergy-
Pontoise, Cergy-Pontoise.
Prisman, E. (1985). Valuation of Risky Assets in Arbitrage Free Economies with Fric-
tions. Working Paper, Department of Finance, University of Arizona.
Protter, P. (1990). Stochastic Integration and Differential Equations. New York:
Springer-Verlag.
Protter, P. (1999). A Partial Introduction to Finance. Working Paper, Purdue Univer-
sity.
Protter, P. and D. Talay (1995). The Euler Scheme for Lévy Driven Stochastic Differ-
ential Equations. Working Paper, Institut National de Recherche en Informatique
et en Automatique, Sophia-Antipolis, France.
Pye, G. (1966). A Markov Model of the Term Structure. Quarterly Journal of Economics
81, 61–72.
Quenez, M.-C. (1992). Méthodes de controle stochastique en finance. Working Paper,
Ph.D. diss., Laboratoires de Probabilités, Université de Paris VI.
Radner, R. (1967). Equilibre des marchés a terme et au comptant en cas d’incertitude.
Cahiers d’Econométrie 4, 35–52.BIBLIOGRAPHY 413
Radner, R. (1972). Existence of Equilibrium of Plans, Prices, and Price Expectations
in a Sequence of Markets. Econometrica 40, 289–303.
Radner, R. and L. Shepp (1995). Risk vs. Profit-Potential; A Model for Corporate
Strategy. Working Paper, AT& T Bell Laboratories.
Rady, S. (1993). State Prices Implicit in Valuation Formula for Derivative Securities:
A Martingale Approach. Working Paper, London School of Economics.
Rady, S. (1995). Option Pricing with a Quadratic Diffusion Term. Working Paper,
Financial Markets Group, London School of Economics.
Rady, S. (1996). Option Pricing with Natural Boundaries and a Quadratic Diffusion
Term. Working Paper, Graduate School of Business, Stanford University.
Rebonato, R. and I. Cooper (1996). Coupling Backward Induction with Monte Carlo
Simulations: A Fast Fourier Transform (FFT) Approach. Working Paper, Institute
of Finance and Accounting, London Business School.
Redekop, J. (1995). Extreme-value Distributions for Generalizations of Brownian Mo-
tion. Working Paper, Departments of Economics and Statistics and Actuarial Sci-
ence.
Redekop, J. and R. Fisher (1995). Extreme-Value Diagnostic Statistics for Some
Stochastic Volatility Models. Working Paper, Department of Economics, Univer-
sity of Waterloo.
Reisman, H. (1986). Option Pricing for Stocks with a Generalized Log-Normal Price
Distribution. Working Paper, Department of Finance, University of Minnesota.
Renault, E. and N. Touzi (1992a). Option Hedging and Implicit Volatilities. Working
Paper, GREMAQ, Toulouse, France.
Renault, E. and N. Touzi (1992b). Stochastic Volatility Models: Statistical Inference
from Implied Volatilities. Working Paper, GREMAQ IDEI, Toulouse, and CREST,
Paris, France.
Repullo, R. (1986). On the Generic Existence of Radner Equilibria when There Are as
Many Securities as States of Nature. Economics Letters 21, 101–105.
Revuz, D. (1975). Markov Chains. Amsterdam: North-Holland.
Revuz, D. and M. Yor (1999). Continuous Martingales and Brownian Motion, Third
Edition. New York: Springer-Verlag.
Ricciardi, L. and S. Sato (1988). First-Passage-Time Density and Moments of the
Ornstein-Uhlenbeck Process. Journal of Applied Probability 25, 43–57.
Rich, D. (1993). The Valuation of Black-Scholes Options Subject to Intertemporal De-
fault Risk. Working Paper, Department of Finance, Virginia Polytechnic Institute.
Richard, S. (1975). Optimal Consumption, Portfolio, and Life Insurance Rules for an
Uncertain Lived Individual in a Continuous Time Model. Journal of Financial Eco-
nomics 2, 187–203.
Richardson, H. (1989). A Minimum Variance Result in Continuous Trading Portfolio
Optimization. Management Science 35, 1045–1055.414 BIBLIOGRAPHY
Ritchken, P. and R. Trevor (1997). Pricing Options Under Generalised GARCH and
Stochastic Volatility Processes. Working Paper, Centre for Studies in Money, Bank-
ing and Finance, Macquairie University.
Rockafellar, R. (1970). Convex Analysis. Princeton, N.J.: Princeton University Press.
Rogers, C. (1993). Equivalent Martingale Measures and No-Arbitrage. Working Pa-
per, Department of Mathematics, Queen Mary and Westfield College, University of
London.
Rogers, C. (1998). Arbitrage with Fractional Brownian Motion. Working Paper, Uni-
versity of Bath.
Rogers, C. and Z. Shi (1994). The Value of an Asian Option. Working Paper, Queen
Mary and Westfield College, Department of Mathematics, University of London.
Rogers, L. and E. Stapleton (1998). Fast Accurate Binomial Pricing. Finance and
Stochastics 2, 3–17.
Romano, M. and N. Touzi (1997). Contingent Claims and Market Completeness in a
Stochastic Volatility Model. Mathematical Finance 7, 399–412.
Ross, S. (1976). The Arbitrage Theory of Capital Asset Pricing. Journal of Economic
Theory 13, 341–60.
Ross, S. (1978). A Simple Approach to the Valuation of Risky Streams. Journal of
Business 51, 453–475.
Ross, S. (1987). Arbitrage and Martingales with Taxation. Journal of Political Economy
95, 371–393.
Ross, S. (1989). Information and Volatility: The Non-Arbitrage Martingale Approach
to Timing and Resolution Irrelevancy. Journal of Finance 64, 1–17.
Royden, H. (1968). Real Analysis (2d ed.). New York: Macmillan.
Rubinstein, M. (1974a). A Discrete-Time Synthesis of Financial Theory. Working Paper,
Haas School of Business, University of California, Berkeley.
Rubinstein, M. (1974b). An Aggregation Theorem for Securities Markets. Journal of
Financial Economics 1, 225–244.
Rubinstein, M. (1976). The Valuation of Uncertain Income Streams and the Pricing of
Options. Bell Journal of Economics 7, 407–425.
Rubinstein, M. (1987). Derivative Assets Analysis. Economics Perspectives 1, 73–93.
Rubinstein, M. (1992). Guiding Force. In From Black-Scholes to Black Holes, pp. 39–48.
London: Risk Magazine.
Rubinstein, M. (1994). Implied Binomial Trees. Journal of Finance 49, 771–818.
Rubinstein, M. (1995). As Simple as One, Two, Three. Risk 8, 44–47.
Ruegg, M. (1996). Optimal Consumption and Portfolio Choice with Borrowing Con-
straints. Working Paper, Department of Mathematics, ETH Zurich.
Runggaldier, W. and M. Schweizer (1995). Convergence of Option Values under Incom-
pleteness. Working Paper, Dipartimento di Matematica Pura ed Applicata, Univer-
sitá degli Studi di Padova, Padova.BIBLIOGRAPHY 415
Rydberg, T. (1996). Existence of Unique Equivalent Martingale Measures in a Marko-
vian Setting. Working Paper, Department of Theoretical Statistics, University of
Aarhus, Denmark.
Ryder, H. and G. Heal (1973). Optimal Growth with Intertemporally Dependent Pref-
erences. Review of Economic Studies 40, 1–31.
Saito, M. (1995). Incomplete Insurance and Risk-free Rates: Cases where Indiosyncratic
Shocks Are Permanent and Correlated with Aggregate Shocks. Working Paper,
Department of Economics, the University of British Columbia, Vancouver.
Samuelson, P. (1969). Lifetime Portfolio Selection by Dynamic Stochastic Programming.
Review of Economics and Statistics 51, 239–246.
Sandroni, A. (1995). The Risk Premium and the Interest Rate Puzzles: The Role of
Heterogeneous Agents. Working Paper, University of Pennsylvania.
Santos, M. (1991). Smoothness of the Policy Function in Discrete Time Economic Mod-
els. Econometrica 59, 1365–1382.
Santos, M. (1994). Smooth Dynamics and Computation in Models of Economic Growth.
Journal of Economic Dynamics and Control 18, 879–895.
Santos, M. and J. Vigo (1995). Error Bounds for a Numerical Solution for Dynamic
Economic Models. Working Paper, Centro de Investigacion Economica, Institute
Tecnologico Autonomo de Mexico.
Santos, M. and M. Woodford. Rational Asset Pricing Bubbles. Econometrica.
Sbuelz, A. (1998). A General Treatment of Barrier Options. Working Paper, London
Business School.
Schachermayer, W. (1992). A Hilbert-Space Proof of the Fundamental Theorem of Asset
Pricing. Insurance Mathematics and Economics 11, 249–257.
Schachermayer, W. (1993). A Counterexample to Several Problems in the Theory of
Asset Pricing. Mathematical Finance 3, 217–230.
Schachermayer, W. (1994). Martingale Measures for Discrete-Time Processes with In-
finite Horizon. Mathematical Finance 4, 25–56.
Schachermayer, W. (98). Some Remarks on a Paper of David Kreps. Working Paper,
Institut für Statistik der Universität Wien.
Scheinkman, J. (1989). Market Incompleteness and the Equilibrium Valuation of Assets,
pp. 45–51. Totowa, N.J.: Rowman and Littlefield.
Scheinkman, J. and L. Weiss (1986). Borrowing Constraints and Aggregate Economic
Activity. Econometrica 54, 23–45.
Schoenmakers, J. and A. Heemink (1996). Fast Valuation of Financial Derivatives.
Working Paper, Delft University of Technology, the Netherlands.
Schroder, M. (1993). Optimal Portfolio Selection with Transactions Costs. Working
Paper, Finance Department, Northwestern University.
Schroder, M. (1999). Changes of Nemeraire of Pricing Futures, Forwards and Options.
Working Paper, SUNY at Buffalo, School of Management, NY.416 BIBLIOGRAPHY
Schröder, M. (1999). On the Valuation of Arithmetic-Average Asian Options: Explicit
Formulas. Working Paper, Fakultät für Mathematik und Informatik der Universität
Mannheim.
Schröder, M. (1999). On the Valuation of Double- Barrier Options. Working Paper,
Fakultät für Mathematik und Informatik der Universität Mannheim.
Schroder, M. and C. Skiadas (1997). Optimal Consumption and Portfolio Selection with
Temporally Dependent Preferences. Working Paper, School of Management, SUNY
at Buffalo, NY.
Schroder, M. and C. Skiadas (1998). Optimal Consumption and Portfolio Selection
with Stochastic Differential Utility. Working Paper, Eli Broad Graduate School of
Management, Michigan State Unviersity.
Schroder, M. and C. Skiadas (1999). An Isomorphism between Asset Pricing Models
with and without Linear Habit Formation. Working Paper, Eli Broad Graduate
School of Management, Michigan State University.
Schwartz, E. (1977). The Valuation of Warrants: Implementing a New Approach. Jour-
nal of Financial Economics 4, 79–94.
Schwartz, E. (1997). Presidential Address: The Stochastic Behavior of Commodity
Prices: Implications for Valuation and Hedging. The Journal of Finance 52, 923–
973.
Schweizer, M. (1992). Martingale Densities for General Asset Prices. Journal of Math-
ematical Economics 21, 363–378.
Schweizer, M. (1993a). Approximating Random Variables by Stochastic Integrals. Work-
ing Paper, Department of Mathematics, University of Bonn.
Schweizer, M. (1993b). Risk-Minimizing Hedging Strategies under Restricted Informa-
tion. Working Paper, Department of Mathematics, University of Bonn.
Schweizer, M. (1994a). A Projection Result for Semimartingales. Working Paper, De-
partment of Mathematics, University of Bonn.
Schweizer, M. (1994b). Hedging and the CAPM. Working Paper, Department of Math-
ematics, University of Bonn.
Scott, L. (1987). Option Pricing when the Variance Changes Randomly: Theory, Esti-
mation, and Application. Journal of Financial and Quantitative Analysis 4, 419–
438.
Scott, L. (1992). Stock Market Volatility and the Pricing of Index Options: An Analysis
of Implied Volatilities and the Volatility Risk Premium in a Model with Stochastic
Interest Rates and Volatility. Working Paper, Department of Finance, University
of Georgia.
Scott, L. (1996a). Simulating a Multi-Factor Term Structure Model Over Relatively
Long Discrete Time Periods. Working Paper, Department of Banking and Finance,
University of Georgia, Athens.
Scott, L. (1997). Pricing Stock Options in a Jump-Diffusion Model with Stochastic
Volatility and Interest Rates: Applications of Fourier Inversion Methods. Mathe-
matical Finance 7, 413–426.BIBLIOGRAPHY 417
Sekine, J. (1998). Mean-Variance Hedging in Continuous-Time with Stochastic Interest
Rate. Working Paper, MTP Investment Technology Institute, Tokyo.
Selby, M. and S. Hodges (1987). On the Evaluation of Compound Options. Management
Science 33, 347–355.
Selden, L. (1978). A New Representation of Preference over ‘Certain × Uncertain’
Consumption Pairs: The ‘Ordinal Certainty Equivalent’ Hypothesis. Econometrica
46, 1045–1060.
Serrat, A. (1995a). A Dynamic Equilibrium Model of International Risk-Sharing Puz-
zles. Working Paper, Sloan School of Management, M.I.T.
Serrat, A. (1995b). An Equilibrium Analysis of Liquidity Constraints. Working Paper,
Sloan School of Management, M.I.T.
Sethi, S. (1995). Optimal Consumption-Investment Decisions Allowing for Bankruptcy:
A Survey. Working Paper, Faculty of Management, University of Toronto. forth-
coming World Wide Asset and Liability Modeling.
Sethi, S. and M. Taksar (1988). A Note on Merton’s ‘Optimum Consumption and
Portfolio Rules in a Continuous-Time Model’. Journal of Economic Theory 46,
395–401.
Sethi, S. and M. Taksar (1992). Infinite-Horizon Investment Consumption Model with
a Nonterminal Bankruptcy. Journal of Optimization Theory and Applications 74,
333–346.
Sethi, S., M. Taksar, and E. Presman (1992). Explicit Solution of a General Consump-
tion/Portfolio Problem with Subsistence Consumption and Bankruptcy. Journal of
Economic Dynamics and Control 16, 747–768.
Shannon, C. (1996). Determinacy of Competitive Equilibria in Economies with Many
Commodities. Working Paper, Department of Economics, University of California,
Berkeley.
Sharpe, W. (1964). Capital Asset Prices: A Theory of Market Equilibrium under Con-
ditions of Risk. Journal of Finance 19, 425–442.
Sharpe, W. (1985). Investments (3d ed.). Englewood Cliffs, N.J.: Prentice-Hall.
Shepp, L. and A.N. Shiryaev (1993). The Russian Option: Reduced Regret. Annals of
Applied Probability 3, 631–640.
Shimko, D. (1993). Bounds of Probability. Risk, 33–37.
Shirakawa, H. (1994). Optimal Consumption and Portfolio Selection with Incomplete
Markets and Upper and Lower Bound Constraints. Mathematical Finance 4, 1–24.
Shreve, S. and M. Soner (1994). Optimal Investment and Consumption with Transaction
Costs. Annals of Applied Probability 4, 609–692.
Shreve, S., M. Soner, and G.-L. Xu (1991). Optimal Investment and Consumption with
Two Bonds and Transaction Costs. Mathematical Finance 1, 53–84.
Shrikhande, M. (1995). Nonaddictive Habit-Formation and the Equity Premium Puzzle.
Working Paper, School of Management, Georgia Institute of Technology, Atlanta.
Siegel, D. and D. Siegel (1990). Futures Markets. Orlando: The Dryden Press.418 BIBLIOGRAPHY
Sircar, K. (1996). Feedback Effects in Option Pricing. Working Paper, SC-CM Program,
Stanford University.
Skiadas, C. (1991a). Time-Consistent Choice and Preferences for Information. Working
Paper, Operations Research Department, Stanford University.
Skiadas, C. (1991b). Conditioning and Aggregation of Preferences. Working Paper,
Operations Research Department, Stanford University.
Skiadas, C. (1995). On the (Super) Differentiability of the Utility of a Representative
Agent at a Pareto Optimal Allocation. Working Paper, Private Written Communi-
cation, Kellogg School of Management, Northwestern University.
Smith, G. (1985). Numerical Solution of Partial Differential Equations: Finite Differ-
ence Methods (3d ed.). Oxford: Clarendon Press.
Soner, M., S. Shreve, and J. Cvitanić (1994). There Is No Nontrivial Hedging Portfolio
for Option Pricing with Transaction Costs. Annals of Applied Probability 5, 327–
355.
Stanton, R. and N. Wallace (1994). ARM Wrestling: Valuing Adjustable Rate Mort-
gages Indexed to the Eleventh District Cost of Funds. Working Paper, Haas School
of Business, University of California, Berkeley. Forthcoming in Journal of the Amer-
ican Real Estate and Urban Economics Association.
Stapleton, R. and M. Subrahmanyam (1978). A Multiperiod Equilibrium Asset Pricing
Model. Econometrica 46, 1077–1093.
Stokey, N. and R. Lucas (1989). Recursive Methods in Economic Dynamics (with Ed
Prescott). Cambridge, Massachusetts: Harvard University Press.
Stoll, H. and R. Whaley (1993). Futures and Options: Theory and Applications. Cincin-
nati: Southwestern.
Streufert, P. (1991a). Existence and Characterization Results for Stochastic Dynamic
Programming. Working Paper, Department of Economics, University of California,
San Diego.
Streufert, P. (1991b). Nonnegative Stochastic Dynamic Preferences. Working Paper,
Department of Economics, University of California, San Diego.
Streufert, P. (1991c). Ordinal Dynamic Programming. Working Paper, Department of
Economics, University of Wisconsin, Madison.
Stricker, C. (1984). Integral Representation in the Theory of Continuous Trading.
Stochastics and Stochastic Reports 13, 249–265.
Stricker, C. (1990). Arbitrage et Lois de Martingale. Annales de l’Institut Henri
Poincaré 26, 451–460.
Strikwerda, J. (1989). Finite Difference Schemes and Partial Differential Equations.
Belmont, California: Wadsworth.
Stulz, R. (1982). Options on the Minimum or the Maximum of Two Risky Assets:
Analysis and Applications. Journal of Financial Economics 10, 161–185.
Stutzer, M. (1996). A Simple Nonparametric Approach to Derivative Security Valuation.
The Journal of Finance 51, 1633–1652.BIBLIOGRAPHY 419
Subramanian, A. (1997). European Option Pricing with General Transaction Costs.
Working Paper, Center for Applied Mathematics, Cornell University.
Sundaresan, S. (1989). Intertemporally Dependent Preferences in the Theories of Con-
sumption, Portfolio Choice and Equilibrium Asset Pricing. Review of Financial
Studies 2, 73–89.
Svensson, L. E.O. (1989). Portfolio Choice with Non-Expected Utility in Continuous
Time. Economic Letters 30, 313–317.
Svensson, L. E.O. and I. Werner (1993). Non-Traded Assets in Incomplete Markets.
European Economic Review 37, 1149–1168.
Taksar, M., M. Klass, and D. Assaf (1988). A Diffusion Model for Optimal Portfolio
Selection in the Presence of Brokerage Fees. Mathematics of Operations Research
13, 277–294.
Talay, D. (1984). Efficient Numerical Schemes for the Approximation of Expectations of
Functionals of S.D.E. In Filtering and Control of Random Processes: Lecture Notes
in Control and Information Sciences 61, pp. 294–313. New York: Springer-Verlag.
Talay, D. (1986). Discrétiation d’une equation différentielle stochastique et calcul ap-
proché d’espérances de fonctionelles de la solution. Mathematical Modeling and Nu-
merical Analysis 20, 141–179.
Talay, D. (1990). Second Order Discretization Schemes of Stochastic Differential Sys-
tems for the Computation of the Invariant Law. Working Paper, Institut National
de Recherche en Informatique et en Automatique, Sophia Antipolis, France.
Talay, D. and L. Tubaro (1990). Expansion of the Global Error for Numerical Schemes
Solving Stochastic Differential Equations. Working Paper, Institut National de
Recherche en Informatique et en Automatique, Sophia Antipolis, France.
Taleb, N. (1997). Transaction Costs: Much Smaller than We Thought. Working Paper,
Paribas, Inc. and Universite Paris Dauphine.
Tauchen, G. and R. Hussey (1991). Quadrature-Based Methods for Obtaining Approxi-
mate Solutions to the Integral Equations of Nonlinear Rational Expectations Mod-
els. Econometrica 59, 371–396.
Taylor, S. (1994). Modeling Stochastic Volatility: A Review and Comparative Study.
Mathematical Finance 4, 183–204.
Telmer, C. (1993). Asset-Pricing Puzzles and Incomplete Markets. The Journal of Fi-
nance 48, 1803–1832.
Tenney, M. (1995). Dynamic Dynamic-Programming Solutions for the Portfolio of Risky
Assets. Working Paper, Alexandria, Virginia.
Tenney, M. (1996). The Green’s Function Numerical Method. Working Paper, Mathe-
matical Finance, Co.
Tepla, L. (1995). Optimal Portfolio Policies with Constrained Investment. Working
Paper, Department of Engineering-Economic Systems, Stanford University.
Tepla, L. (1996a). A Characterization of Optimal Portfolio Policies with Borrowing
and Shortsale Constraints. Working Paper, Department of Engineering-Economic
Systems and Operations Research, Stanford University.420 BIBLIOGRAPHY
Tepla, L. (1996b). Revisiting ”Optimal Consumption and Portfolio Policies when Asset
Prices Follow a Diffusion Process”. Working Paper, Department of Engineering-
Economic Systems, Stanford University.
Toft, K. and G. Brown (1996). Constructing Binomial Trees from Multiple Implied
Probability Distributions. Working Paper, Department of Finance, the University
of Taxas, Austin.
Topper, J. (1997). Solving Term Structure Models with Finite Elements. Working Paper,
Fachbereich Wirtschaftwissenschaften der Universität Hannover.
Topper, J. (1998). Finite Element Modeling of Exotic Options. Working Paper, Fach-
bereich Wirtschaftswissenschaften, Universität Hannover.
Török, C. (1993). Numerical Solution of Linear Stochastic Differential Equations. Work-
ing Paper, Department of Mathematics, Technical University of Kosice.
Touzi, N. (1993). Modèles Volatilité Stochastique. Working Paper, Ph.D. diss.,
CEREMADE, Université de Paris IX, Dauphine.
Touzi, N. (1995). American Options Exercise Boundary when the Volatility Changes
Randomly. Working Paper, CEREMADE, Université de Paris IX, Dauphine.
Uzawa, H. (1968). Time Preference, The Consumption Function and Optimal Asset
Holdings, pp. 485–504. Chicago: Aldine.
Vayanos, D. (1998). Transaction Costs and Asset Prices: A Dynamic Equilibrium
Model. The Review of Financial Studies 11, 1–58.
Vayanos, D. and J.-L. Vila (1992). Equilibrium Interest Rate and Liquidity Pre-
mium Under Proportional Transactions Costs. Working Paper, Sloan School of
Management, Massachusetts Institute of Technology.
Vila, J.-L. and T. Zariphopoulou (1991). Optimal Consumption and Portfolio Choice
with Borrowing Constraints. Working Paper, Sloan School of Management,
Massachusetts Institute of Technology.
Walras, L. (1874–1877). Eléments d’économie politique pure (4th ed.). Lausanne: L.
Corbaz, English translation of the definitive edition by W. Jaffé, Elements of Pure
Economics. London: Allen and Unwin, (1954).
Wang, J. (1993). A Model of Intertemporal Asset Prices Under Asymmetric Informa-
tion. Review of Economic Studies 60, 249–282.
Wang, J. (1996). The Term Structure of Interest Rates in a Pure Exchange Economy
with Heterogeneous Investors. Journal of Financial Economics 41, 75–110.
Wang, S. (1991). Is Kreps-Porteus Utility Distinguishable from Intertemporal Expected
Utility. Working Paper, Department of Economics, University of Toronto.
Wang, S. (1993a). The Integrability Problem of Asset Prices. Journal of Economic
Theory 59, 199–213.
Wang, S. (1993b). The Local Recoverability of Risk Aversion and Intertemporal
Substitution. Journal of Economic Theory 59, 333–363.
Wang, T. (1995). Equilibrium with New Investment Opportunities. Working Paper,
Department of Economics, University of Waterloo, Waterloo.BIBLIOGRAPHY 421
Weerasinghe, A. (1996). Singular Optimal Strategies for Investment with Transaction
Costs. Working Paper, Department of Mathematics, Iowa State University, Ames.
Weil, P. (1992). Equilibrium Asset Prices with Undiversifiable Labor Income Risk.
Journal of Economic Dynamics and Control 16, 769–790.
Werner, J. (1985). Equilibrium in Economies with Incomplete Financial Markets.
Journal of Economic Theory 36, 110–119.
Werner, J. (1991). On Constrained Optimal Allocations with Incomplete Markets.
Economic Theory 1, 205–209.
Whalley, A.E. and P. Wilmott (1994). Optimal Hedging of Options with Small but
Arbitrary Transaction Cost Structure. Working Paper, Mathematical Institute,
Oxford University.
Wiggins, J. (1987). Option Values under Stochastic Volatility: Theory and Empirical
Estimates. Journal of Financial Economics 19, 351–372.
Willard, G. (1996). Calculating Prices and Sensitivities for Path- Independent Deriva-
tive Securities in Multifactor Models. Working Paper, Washington University in
Saint Louis.
Willinger, W. and M. Tacqu (1989). Pathwise Stochastic Integration and Application
to the Theory of Continuous Trading. Stochastic Processes and Their Applications
32, 253–280.
Willinger, W. and M. Tacqu (1991). Toward a Convergence Theory for Continuous
Stochastic Securities Market Models. Mathematical Finance 1, 55–100.
Wilmott, P., J. Dewynne, and S. Howison (1993). Option Pricing: Mathematical
Models and Computation. Oxford: Oxford Financial Press.
Won, D. (1996). A New Approach to Equilibrium in Incomplete Markets. Working
Paper, Korea Economic Research Institute, Seoul.
Won, D. (1996c). Generic Existence of Equilibrium in Incomplete Markets: the Case
of Differential Participation. Working Paper, Korea Economic Research Institute,
Seoul.
Wu, L. (1996). The Front-Fixing Finite Difference Method for the Valuation of
American Options. Working Paper, Department of Mathematics, University of
Sciences and Technology, Hong Kong.
Xu, G.-L. and S. Shreve (1992a). A Duality Method for Optimal Consumption and
Investment under Short-Selling Prohibition. I. General Market Coefficients. Annals
of Applied Probability 2, 87–112.
Xu, G.-L. and S. Shreve (1992b). A Duality Method for Optimal Consumption and
Investment under Short-Selling Prohibition. II. Constant Market Coefficients.
Annals of Applied Probability 2, 314–328.
Yamazaki, A. (1991). Equilibrium in Economies with Incomplete Markets and Out-
side Money: Transactions Costs and Existence. Working Paper, Department of
Economics, Hitotsubashi University.
Yor, M. (1991). On Some Exponential Functionals of Brownian Motion. Working
Paper, Laboratoires de Probabilités, Université de Paris VI.422 BIBLIOGRAPHY
Yor, M. (1993). The Distribution of Brownian Quantiles. Working Paper, Laboratoires
de Probabilités, Université de Paris VI.
Yu, D. (1997). Infinite-Horizon Frictional Arbitrage Valuation. Working Paper,
Department of Economics, Princeton University, NJ.
Yu, G. (1993). Essays on the Valuation of American Options. Working Paper, Stern
School of Business, New York University.
Zapatero, F. (1992). Equilibrium Asset Prices and Exchange Rates. Working Paper,
Haas School of Business, University of California, Berkeley.
Zapatero, F. (1993). Interest Rates with Converging Heterogeneous Reliefs. Working
Paper, Haas School of Business, University of California at Berkeley.
Zapatero, F. (1996). Effects of Financial Innovations on Market Volatility when
Beliefs are Heterogeneous. Working Paper, Haas School of Business, University of
California, Berkeley.
Zariphopoulou, T. (1992). Investment-Consumption Models with Transactions Costs
and Markov-Chain Parameters. SIAM Journal on Control and Optimization 30,
613–636.
Zariphopoulou, T. (1994). Consumption-Investment Models with Constraints. SIAM
Journal on Control and Optimization.
Zhang, X. (1993). Options américaines et modèles de diffusion avec sauts. Comtes
Rendus de l’Academie de Science de Paris 317, 857–862.
Zhang, X. (1994). Numerical Analysis of American Option Pricing in a Jump-Diffusion
Model. Working Paper, CERMA, URA-CNRS 1502, E.N.P.C, Paris, France.
Zhou, C. (1997). Path-Dependent Option Valuation When the Underlying Path is
Discontinuous. Working Paper, Divisions of Research and Statistics and Monetary
Affairs, Federal Reserve Board, Washington, DC.
Zhou, Y.-Q. (1993). The Global Structure of Equilibrium Manifold in Incomplete
Markets. Working Paper, Department of Economics, Columbia University.
Zou, J. and E. Derman (1996). Monte Carlo Valuation of Path-Dependent Options on In-
dexes with a Volatility Smile. Working Paper, Goldman, Sachs and Co., New York.
Zuasti, J. (1999). Insurance with Frequent Trading. Working Paper.
Zvan, R., P. Forsyth, and K. Vetzal (1996). Robust Numerical Methods for PDE
Models of Asian Options. Working Paper, University of Waterloo, Canada.