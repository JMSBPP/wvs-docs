---
sha256: 2460a5f105d8145618928e3f98f15cd88e7fcdc5a19c342b1a96cf05b2c52ba4
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 582442
---
Category Theory
for Programmers
By Bartosz Milewski
compiled and edited by
Igal TabachnikCategory Theory for Programmers
Bartosz Milewski
Version v1.0.0-0-g41e0fc3
October 21, 2018
This work is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International License (cc by-sa 4.0).
Converted from a series of blog posts by Bartosz Milewski.
PDF and book compiled by Igal Tabachnik.
L A TEX source code is available on GitHub:
https://github.com/hmemcpy/milewski-ctfp-pdfContents
Preface xi
Part One 2
## 1 Category: The Essence of Composition 2
## 1.1 Arrows as Functions . . . . . . . . . . . . . . . . . . . . 2
## 1.2 Properties of Composition . . . . . . . . . . . . . . . . 5
## 1.3 Composition is the Essence of Programming . . . . . . 8
## 1.4 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 10
## 2 Types and Functions 11
## 2.1 Who Needs Types? . . . . . . . . . . . . . . . . . . . . 11
## 2.2 Types Are About Composability . . . . . . . . . . . . . 12
## 2.3 What Are Types? . . . . . . . . . . . . . . . . . . . . . 14
## 2.4 Why Do We Need a Mathematical Model? . . . . . . . 17
## 2.5 Pure and Dirty Functions . . . . . . . . . . . . . . . . . 20
## 2.6 Examples of Types . . . . . . . . . . . . . . . . . . . . . 20
## 2.7 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 24
i3 Categories Great and Small 27
## 3.1 No Objects . . . . . . . . . . . . . . . . . . . . . . . . . 27
## 3.2 Simple Graphs . . . . . . . . . . . . . . . . . . . . . . . 28
## 3.3 Orders . . . . . . . . . . . . . . . . . . . . . . . . . . . 28
## 3.4 Monoid as Set . . . . . . . . . . . . . . . . . . . . . . . 29
## 3.5 Monoid as Category . . . . . . . . . . . . . . . . . . . . 34
## 3.6 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 36
## 4 Kleisli Categories 38
## 4.1 The Writer Category . . . . . . . . . . . . . . . . . . . 43
## 4.2 Writer in Haskell . . . . . . . . . . . . . . . . . . . . . 46
## 4.3 Kleisli Categories . . . . . . . . . . . . . . . . . . . . . 49
## 4.4 Challenge . . . . . . . . . . . . . . . . . . . . . . . . . . 50
## 5 Products and Coproducts 52
## 5.1 Initial Object . . . . . . . . . . . . . . . . . . . . . . . . 53
## 5.2 Terminal Object . . . . . . . . . . . . . . . . . . . . . . 55
## 5.3 Duality . . . . . . . . . . . . . . . . . . . . . . . . . . . 56
## 5.4 Isomorphisms . . . . . . . . . . . . . . . . . . . . . . . 57
## 5.5 Products . . . . . . . . . . . . . . . . . . . . . . . . . . 59
## 5.6 Coproduct . . . . . . . . . . . . . . . . . . . . . . . . . 65
## 5.7 Asymmetry . . . . . . . . . . . . . . . . . . . . . . . . . 68
## 5.8 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 71
## 5.9 Bibliography . . . . . . . . . . . . . . . . . . . . . . . . 72
## 6 Simple Algebraic Data Types 73
## 6.1 Product Types . . . . . . . . . . . . . . . . . . . . . . . 74
## 6.2 Records . . . . . . . . . . . . . . . . . . . . . . . . . . . 78
## 6.3 Sum Types . . . . . . . . . . . . . . . . . . . . . . . . . 79
## 6.4 Algebra of Types . . . . . . . . . . . . . . . . . . . . . . 83
ii6.5 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 88
## 7 Functors 89
## 7.1 Functors in Programming . . . . . . . . . . . . . . . . . 92
## 7.1.1 The Maybe Functor . . . . . . . . . . . . . . . . 92
## 7.1.2 Equational Reasoning . . . . . . . . . . . . . . 94
## 7.1.3 Optional . . . . . . . . . . . . . . . . . . . . . . 97
## 7.1.4 Typeclasses . . . . . . . . . . . . . . . . . . . . 98
## 7.1.5 Functor in C++ . . . . . . . . . . . . . . . . . . 100
## 7.1.6 The List Functor . . . . . . . . . . . . . . . . . . 101
## 7.1.7 The Reader Functor . . . . . . . . . . . . . . . . 103
## 7.2 Functors as Containers . . . . . . . . . . . . . . . . . . 105
## 7.3 Functor Composition . . . . . . . . . . . . . . . . . . . 108
## 7.4 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 110
## 8 Functoriality 112
## 8.1 Bifunctors . . . . . . . . . . . . . . . . . . . . . . . . . 112
## 8.2 Product and Coproduct Bifunctors . . . . . . . . . . . . 115
## 8.3 Functorial Algebraic Data Types . . . . . . . . . . . . . 117
## 8.4 Functors in C++ . . . . . . . . . . . . . . . . . . . . . . 121
## 8.5 The Writer Functor . . . . . . . . . . . . . . . . . . . . 123
## 8.6 Covariant and Contravariant Functors . . . . . . . . . . 125
## 8.7 Profunctors . . . . . . . . . . . . . . . . . . . . . . . . . 128
## 8.8 The Hom-Functor . . . . . . . . . . . . . . . . . . . . . 129
## 8.9 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 130
## 9 Function Types 132
## 9.1 Universal Construction . . . . . . . . . . . . . . . . . . 133
## 9.2 Currying . . . . . . . . . . . . . . . . . . . . . . . . . . 138
## 9.3 Exponentials . . . . . . . . . . . . . . . . . . . . . . . . 142
iii9.4 Cartesian Closed Categories . . . . . . . . . . . . . . . 143
## 9.5 Exponentials and Algebraic Data Types . . . . . . . . . 144
## 9.5.1 Zeroth Power . . . . . . . . . . . . . . . . . . . 145
## 9.5.2 Powers of One . . . . . . . . . . . . . . . . . . 145
## 9.5.3 First Power . . . . . . . . . . . . . . . . . . . . 146
## 9.5.4 Exponentials of Sums . . . . . . . . . . . . . . . 146
## 9.5.5 Exponentials of Exponentials . . . . . . . . . . 147
## 9.5.6 Exponentials over Products . . . . . . . . . . . 147
## 9.6 Curry-Howard Isomorphism . . . . . . . . . . . . . . . 147
## 9.7 Bibliography . . . . . . . . . . . . . . . . . . . . . . . . 150
## 10 Natural Transformations 151
## 10.1 Polymorphic Functions . . . . . . . . . . . . . . . . . . 155
## 10.2 Beyond Naturality . . . . . . . . . . . . . . . . . . . . . 161
## 10.3 Functor Category . . . . . . . . . . . . . . . . . . . . . 163
10.4 2-Categories . . . . . . . . . . . . . . . . . . . . . . . . 167
## 10.5 Conclusion . . . . . . . . . . . . . . . . . . . . . . . . . 172
## 10.6 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 173
Part Two 176
## 11 Declarative Programming 176
## 12 Limits and Colimits 184
## 12.1 Limit as a Natural Isomorphism . . . . . . . . . . . . . 190
## 12.2 Examples of Limits . . . . . . . . . . . . . . . . . . . . 194
## 12.3 Colimits . . . . . . . . . . . . . . . . . . . . . . . . . . 202
## 12.4 Continuity . . . . . . . . . . . . . . . . . . . . . . . . . 203
## 12.5 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 205
iv13 Free Monoids 207
## 13.1 Free Monoid in Haskell . . . . . . . . . . . . . . . . . . 209
## 13.2 Free Monoid Universal Construction . . . . . . . . . . 210
## 13.3 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 215
## 14 Representable Functors 216
## 14.1 The Hom Functor . . . . . . . . . . . . . . . . . . . . . 218
## 14.2 Representable Functors . . . . . . . . . . . . . . . . . . 220
## 14.3 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 226
## 14.4 Bibliography . . . . . . . . . . . . . . . . . . . . . . . . 226
## 15 The Yoneda Lemma 227
## 15.1 Yoneda in Haskell . . . . . . . . . . . . . . . . . . . . . 234
## 15.2 Co-Yoneda . . . . . . . . . . . . . . . . . . . . . . . . . 236
## 15.3 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 237
## 15.4 Bibliography . . . . . . . . . . . . . . . . . . . . . . . . 237
## 16 Yoneda Embedding 238
## 16.1 The Embedding . . . . . . . . . . . . . . . . . . . . . . 241
## 16.2 Application to Haskell . . . . . . . . . . . . . . . . . . 242
## 16.3 Preorder Example . . . . . . . . . . . . . . . . . . . . . 243
## 16.4 Naturality . . . . . . . . . . . . . . . . . . . . . . . . . 245
## 16.5 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 246
Part Three 249
## 17 It’s All About Morphisms 249
## 17.1 Functors . . . . . . . . . . . . . . . . . . . . . . . . . . 249
## 17.2 Commuting Diagrams . . . . . . . . . . . . . . . . . . . 250
v17.3 Natural Transformations . . . . . . . . . . . . . . . . . 251
## 17.4 Natural Isomorphisms . . . . . . . . . . . . . . . . . . . 253
## 17.5 Hom-Sets . . . . . . . . . . . . . . . . . . . . . . . . . . 253
## 17.6 Hom-Set Isomorphisms . . . . . . . . . . . . . . . . . . 254
## 17.7 Asymmetry of Hom-Sets . . . . . . . . . . . . . . . . . 255
## 17.8 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 256
## 18 Adjunctions 257
## 18.1 Adjunction and Unit/Counit Pair . . . . . . . . . . . . . 258
## 18.2 Adjunctions and Hom-Sets . . . . . . . . . . . . . . . . 264
## 18.3 Product from Adjunction . . . . . . . . . . . . . . . . . 268
## 18.4 Exponential from Adjunction . . . . . . . . . . . . . . . 273
## 18.5 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 275
## 19 Free/Forgetful Adjunctions 276
## 19.1 Some Intuitions . . . . . . . . . . . . . . . . . . . . . . 280
## 19.2 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 283
## 20 Monads: Programmer’s Definition 284
## 20.1 The Kleisli Category . . . . . . . . . . . . . . . . . . . . 286
## 20.2 Fish Anatomy . . . . . . . . . . . . . . . . . . . . . . . 289
## 20.3 The do Notation . . . . . . . . . . . . . . . . . . . . . . 291
## 21 Monads and Effects 295
## 21.1 The Problem . . . . . . . . . . . . . . . . . . . . . . . . 295
## 21.2 The Solution . . . . . . . . . . . . . . . . . . . . . . . . 296
## 21.2.1 Partiality . . . . . . . . . . . . . . . . . . . . . . 297
## 21.2.2 Nondeterminism . . . . . . . . . . . . . . . . . 298
## 21.2.3 Read-Only State . . . . . . . . . . . . . . . . . . 301
## 21.2.4 Write-Only State . . . . . . . . . . . . . . . . . 302
vi21.2.5 State . . . . . . . . . . . . . . . . . . . . . . . . 303
## 21.2.6 Exceptions . . . . . . . . . . . . . . . . . . . . . 304
## 21.2.7 Continuations . . . . . . . . . . . . . . . . . . . 305
## 21.2.8 Interactive Input . . . . . . . . . . . . . . . . . 307
## 21.2.9 Interactive Output . . . . . . . . . . . . . . . . 309
## 21.3 Conclusion . . . . . . . . . . . . . . . . . . . . . . . . . 310
## 22 Monads Categorically 312
## 22.1 Monoidal Categories . . . . . . . . . . . . . . . . . . . 318
## 22.2 Monoid in a Monoidal Category . . . . . . . . . . . . . 323
## 22.3 Monads as Monoids . . . . . . . . . . . . . . . . . . . . 325
## 22.4 Monads from Adjunctions . . . . . . . . . . . . . . . . 328
## 23 Comonads 332
## 23.1 Programming with Comonads . . . . . . . . . . . . . . 333
## 23.2 The Product Comonad . . . . . . . . . . . . . . . . . . . 334
## 23.3 Dissecting the Composition . . . . . . . . . . . . . . . 335
## 23.4 The Stream Comonad . . . . . . . . . . . . . . . . . . . 338
## 23.5 Comonad Categorically . . . . . . . . . . . . . . . . . . 340
## 23.6 The Store Comonad . . . . . . . . . . . . . . . . . . . . 342
## 23.7 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 345
24 F-Algebras 346
## 24.1 Recursion . . . . . . . . . . . . . . . . . . . . . . . . . . 350
## 24.2 Category of F-Algebras . . . . . . . . . . . . . . . . . . 352
## 24.3 Natural Numbers . . . . . . . . . . . . . . . . . . . . . 356
## 24.4 Catamorphisms . . . . . . . . . . . . . . . . . . . . . . 357
## 24.5 Folds . . . . . . . . . . . . . . . . . . . . . . . . . . . . 359
## 24.6 Coalgebras . . . . . . . . . . . . . . . . . . . . . . . . . 360
## 24.7 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 364
vii25 Algebras for Monads 365
25.1 T-algebras . . . . . . . . . . . . . . . . . . . . . . . . . 368
## 25.2 The Kleisli Category . . . . . . . . . . . . . . . . . . . . 372
## 25.3 Coalgebras for Comonads . . . . . . . . . . . . . . . . . 374
## 25.4 Lenses . . . . . . . . . . . . . . . . . . . . . . . . . . . 375
## 25.5 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 377
## 26 Ends and Coends 378
## 26.1 Dinatural Transformations . . . . . . . . . . . . . . . . 380
## 26.2 Ends . . . . . . . . . . . . . . . . . . . . . . . . . . . . 382
## 26.3 Ends as Equalizers . . . . . . . . . . . . . . . . . . . . . 385
## 26.4 Natural Transformations as Ends . . . . . . . . . . . . 386
## 26.5 Coends . . . . . . . . . . . . . . . . . . . . . . . . . . . 388
## 26.6 Ninja Yoneda Lemma . . . . . . . . . . . . . . . . . . . 391
## 26.7 Profunctor Composition . . . . . . . . . . . . . . . . . 393
## 27 Kan Extensions 395
## 27.1 Right Kan Extension . . . . . . . . . . . . . . . . . . . . 398
## 27.2 Kan Extension as Adjunction . . . . . . . . . . . . . . . 400
## 27.3 Left Kan Extension . . . . . . . . . . . . . . . . . . . . 402
## 27.4 Kan Extensions as Ends . . . . . . . . . . . . . . . . . . 405
## 27.5 Kan Extensions in Haskell . . . . . . . . . . . . . . . . 409
## 27.6 Free Functor . . . . . . . . . . . . . . . . . . . . . . . . 411
## 28 Enriched Categories 414
## 28.1 Why Monoidal Category? . . . . . . . . . . . . . . . . . 415
## 28.2 Monoidal Category . . . . . . . . . . . . . . . . . . . . 416
## 28.3 Enriched Category . . . . . . . . . . . . . . . . . . . . . 419
## 28.4 Preorders . . . . . . . . . . . . . . . . . . . . . . . . . . 421
## 28.5 Metric Spaces . . . . . . . . . . . . . . . . . . . . . . . 422
viii28.6 Enriched Functors . . . . . . . . . . . . . . . . . . . . . 423
## 28.7 Self Enrichment . . . . . . . . . . . . . . . . . . . . . . 424
## 28.8 Relation to 𝟐-Categories . . . . . . . . . . . . . . . . . 426
## 29 Topoi 428
## 29.1 Subobject Classifier . . . . . . . . . . . . . . . . . . . . 429
## 29.2 Topos . . . . . . . . . . . . . . . . . . . . . . . . . . . . 434
## 29.3 Topoi and Logic . . . . . . . . . . . . . . . . . . . . . . 435
## 29.4 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 436
## 30 Lawvere Theories 437
## 30.1 Universal Algebra . . . . . . . . . . . . . . . . . . . . . 437
## 30.2 Lawvere Theories . . . . . . . . . . . . . . . . . . . . . 439
## 30.3 Models of Lawvere Theories . . . . . . . . . . . . . . . 443
## 30.4 The Theory of Monoids . . . . . . . . . . . . . . . . . . 445
## 30.5 Lawvere Theories and Monads . . . . . . . . . . . . . . 446
## 30.6 Monads as Coends . . . . . . . . . . . . . . . . . . . . . 449
## 30.7 Lawvere Theory of Side Effects . . . . . . . . . . . . . . 453
## 30.8 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 455
## 30.9 Further Reading . . . . . . . . . . . . . . . . . . . . . . 455
## 31 Monads, Monoids, and Categories 456
## 31.1 Bicategories . . . . . . . . . . . . . . . . . . . . . . . . 457
## 31.2 Monads . . . . . . . . . . . . . . . . . . . . . . . . . . . 462
## 31.3 Challenges . . . . . . . . . . . . . . . . . . . . . . . . . 467
## 31.4 Bibliography . . . . . . . . . . . . . . . . . . . . . . . . 467
ixAppendices 468
Index 468
Acknowledgments 471
Colophon 472
Copyleft notice 473
xPreface
For some time now I’ve been floating the idea of writing a
book about category theory that would be targeted at pro-
grammers.Mindyou,notcomputerscientistsbutprogram-
mers — engineers rather than scientists. I know this sounds
crazy and I am properly scared. I can’t deny that there is a
huge gap between science and engineering because I have
worked on both sides of the divide. But I’ve always felt a
very strong compulsion to explain things. I have tremen-
dous admiration for Richard Feynman who was the master
of simple explanations. I know I’m no Feynman, but I will
trymybest.I’mstartingbypublishingthispreface—which
is supposed to motivate the reader to learn category theory
—inhopesofstartingadiscussionandsolicitingfeedback.1
Iwill attempt, in the space of a few paragraphs, to convince you that
this book is written for you, and whatever objections you might have
to learning one of the most abstract branches of mathematics in your
“copious spare time” are totally unfounded.
## 1 You may also watch me teach this material to a live audience, at
https://goo.gl/GT2UWU (or search ”bartosz milewski category theory” on YouTube.)
xiMy optimism is based on several observations. First, category the-
ory is a treasure trove of extremely useful programming ideas. Haskell
programmers have been tapping this resource for a long time, and the
ideasareslowlypercolatingintootherlanguages,butthisprocess istoo
slow. We need to speed it up.
Second, there are many different kinds of math, and they appeal to
different audiences. You might be allergic to calculus or algebra, but it
doesn’t mean you won’t enjoy category theory. I would go as far as to
argue that category theory is the kind of math that is particularly well
suited for the minds of programmers. That’s because category theory
— rather than dealing with particulars — deals with structure. It deals
with the kind of structure that makes programs composable.
Composition is at the very root of category theory — it’s part of
the definition of the category itself. And I will argue strongly that com-
position is the essence of programming. We’ve been composing things
forever,longbeforesomegreatengineercameupwiththeideaofasub-
routine. Some time ago the principles of structural programming rev-
olutionized programming because they made blocks of code compos-
able. Then came object oriented programming, which is all about com-
posing objects. Functional programming is not only about composing
functions and algebraic data structures — it makes concurrency com-
posable — something that’s virtually impossible with other program-
ming paradigms.
Third, I have a secret weapon, a butcher’s knife, with which I will
butchermathtomakeitmorepalatabletoprogrammers.Whenyou’rea
professional mathematician, you have to be very careful to get all your
assumptions straight, qualify every statement properly, and construct
all your proofs rigorously. This makes mathematical papers and books
extremelyhardtoreadforanoutsider.I’maphysicistbytraining,andin
xiiphysics we made amazing advances using informal reasoning. Mathe-
maticianslaughedattheDiracdeltafunction,whichwasmadeuponthe
spotbythegreatphysicistP.A.M.Diractosolvesomedifferentialequa-
tions. They stopped laughing when they discovered a completely new
branch of calculus called distribution theory that formalized Dirac’s in-
sights.
Of course when using hand-waving arguments you run the risk of
saying something blatantly wrong, so I will try to make sure that there
is solid mathematical theory behind informal arguments in this book. I
do have a worn-out copy of Saunders Mac Lane’s Category Theory for
the Working Mathematician on my nightstand.
Since this is categorytheory forprogrammers Iwill illustrate all ma-
jor concepts using computer code. You are probably aware that func-
tional languages are closer to math than the more popular imperative
languages. They also offer more abstracting power. So a natural temp-
tation would be to say: You must learn Haskell before the bounty of cat-
egory theory becomes available to you. But that would imply that cate-
gory theory has no application outside of functional programming and
that’s simply not true. So I will provide a lot of C++ examples. Granted,
you’ll have to overcome some ugly syntax, the patterns might not stand
out from the background of verbosity, and you might be forced to do
some copy and paste in lieu of higher abstraction, but that’s just the lot
of a C++ programmer.
But you’re not off the hook as far as Haskell is concerned. You don’t
have to become a Haskell programmer, but you need it as a language
for sketching and documenting ideas to be implemented in C++. That’s
exactlyhowIgot started withHaskell. Ifound its tersesyntax and pow-
erful type system a great help in understanding and implementing C++
templates, data structures, and algorithms. But since I can’t expect the
xiiireaders to already know Haskell, I will introduce it slowly and explain
everything as I go.
Ifyou’reanexperiencedprogrammer,youmightbeaskingyourself:
I’ve been coding for so long without worrying about category theory
or functional methods, so what’s changed? Surely you can’t help but
notice that there’s been a steady stream of new functional features in-
vading imperative languages. Even Java, the bastion of object-oriented
programming, let the lambdas in. C++ has recently been evolving at a
franticpace—anewstandardeveryfewyears—tryingtocatchupwith
the changing world. All this activity is in preparation for a disruptive
change or, as we physicist call it, a phase transition. If you keep heating
water, it will eventually start boiling. We are now in the position of a
frog that must decide if it should continue swimming in increasingly
hot water, or start looking for some alternatives.
One of the forces that are driving the big change is the multicore
revolution. The prevailing programming paradigm, object oriented pro-
gramming, doesn’t buy you anything in the realm of concurrency and
parallelism, and instead encourages dangerous and buggy design. Data
xivhiding, the basic premise of object orientation, when combined with
sharing and mutation, becomes a recipe for data races. The idea of com-
bining a mutex with the data it protects is nice but, unfortunately, locks
don’tcompose,andlockhidingmakesdeadlocksmorelikelyandharder
to debug.
But even in the absence of concurrency, the growing complexity
of software systems is testing the limits of scalability of the imperative
paradigm. To put it simply, side effects are getting out of hand. Granted,
functions that have side effects are often convenient and easy to write.
Their effects can in principle be encoded in their names and in the com-
ments. A function called SetPassword or WriteFile is obviously mutat-
ing some state and generating side effects, and we are used to dealing
with that. It’s only when we start composing functions that have side
effects on top of other functions that have side effects, and so on, that
things start getting hairy. It’s not that side effects are inherently bad —
it’s the fact that they are hidden from view that makes them impossi-
ble to manage at larger scales. Side effects don’t scale, and imperative
programming is all about side effects.
Changes in hardware and the growing complexity of software are
forcing us to rethink the foundations of programming. Just like the
buildersofEurope’sgreatgothiccathedralswe’vebeenhoningourcraft
to the limits of material and structure. There is an unfinished gothic
cathedralinBeauvais2,France,thatstandswitnesstothisdeeplyhuman
struggle with limitations. It was intended to beat all previous records of
height and lightness, but it suffered a series of collapses. Ad hoc mea-
sures like iron rods and wooden supports keep it from disintegrating,
but obviously a lot of things went wrong. From a modern perspective,
it’s a miracle that so many gothic structures had been successfully com-
2http://en.wikipedia.org/wiki/Beauvais_Cathedral
xvAd hoc measures preventing the Beauvais cathedral from collapsing.
pleted without the help of modern material science, computer mod-
elling, finite element analysis, and general math and physics. I hope
future generations will be as admiring of the programming skills we’ve
been displaying in building complex operating systems, web servers,
andtheinternetinfrastructure.And,frankly,theyshould,becausewe’ve
done all this based on very flimsy theoretical foundations. We have to
fix those foundations if we want to move forward.
xviPart One
11 Category: The Essence of Composition
Acategoryisanembarrassinglysimpleconcept.Acategoryconsists
of objects and arrows that go between them. That’s why categories
aresoeasytorepresentpictorially.Anobjectcanbedrawnasacircleor
a point, and an arrow… is an arrow. (Just for variety, I will occasionally
draw objects as piggies and arrows as fireworks.) But the essence of a
category is composition. Or, if you prefer, the essence of composition is
a category. Arrows compose, so if you have an arrow from object 𝐴 to
object 𝐵, and another arrow from object 𝐵 to object 𝐶, then there must
be an arrow — their composition — that goes from 𝐴 to 𝐶.
## 1.1 Arrows as Functions
Is this already too much abstract nonsense? Do not despair. Let’s talk
concretes. Think of arrows, which are also called morphisms, as func-
tions. You have a function 𝑓 that takes an argument of type 𝐴 and re-
turns a 𝐵. You have another function 𝑔 that takes a 𝐵 and returns a 𝐶.
2In a category, if there is an arrow going from 𝐴 to 𝐵 and an arrow going from 𝐵 to 𝐶 then there
mustalsobeadirectarrowfrom𝐴to𝐶 thatistheircomposition.Thisdiagramisnotafullcategory
because it’s missing identity morphisms (see later).
You can compose them by passing the result of 𝑓 to 𝑔. You have just
defined a new function that takes an 𝐴 and returns a 𝐶.
In math, such composition is denoted by a small circle between
functions: 𝑔 ∘ 𝑓. Notice the right to left order of composition. For some
people this is confusing. You may be familiar with the pipe notation in
Unix, as in:
lsof | grep Chrome
or the chevron >> in F#, which both go from left to right. But in math-
ematics and in Haskell functions compose right to left. It helps if you
read 𝑔 ∘ 𝑓 as “g after f.”
Let’s make this even more explicit by writing some C code. We have
one function f that takes an argument of type A and returns a value of
type B:
B f(A a);
3and another:
C g(B b);
Their composition is:
C g_after_f(A a)
{
return g(f(a));
}
Here, again, you see right-to-left composition: g(f(a)); this time in C.
IwishIcouldtellyouthatthereisatemplateintheC++StandardLi-
brary that takes two functions and returns their composition, but there
isn’t one. So let’s try some Haskell for a change. Here’s the declaration
of a function from A to B:
f :: A -> B
Similarly:
g :: B -> C
Their composition is:
g . f
Once you see how simple things are in Haskell, the inability to express
straightforward functional concepts in C++ is a little embarrassing. In
fact, Haskell will let you use Unicode characters so you can write com-
position as:
g ◦ f
4You can even use Unicode double colons and arrows:
f ∷ A → B
Sohere’sthefirstHaskelllesson:Doublecolonmeans“hasthetypeof…”
A function type is created by inserting an arrow between two types.
You compose two functions by inserting a period between them (or a
Unicode circle).
## 1.2 Properties of Composition
There are two extremely important properties that the composition in
any category must satisfy.
1. Compositionisassociative.Ifyouhavethreemorphisms,𝑓,𝑔,and
ℎ, that can be composed (that is, their objects match end-to-end),
you don’t need parentheses to compose them. In math notation
this is expressed as:
ℎ ∘ (𝑔 ∘ 𝑓) = (ℎ ∘ 𝑔) ∘ 𝑓 = ℎ ∘ 𝑔 ∘ 𝑓
In (pseudo) Haskell:
f :: A -> B
g :: B -> C
h :: C -> D
h . (g . f) == (h . g) . f == h . g . f
(I said “pseudo,” because equality is not defined for functions.)
Associativity is pretty obvious when dealing with functions, but
it may be not as obvious in other categories.
52. For every object 𝐴 there is an arrow which is a unit of compo-
sition. This arrow loops from the object to itself. Being a unit of
composition means that, when composed with any arrow that ei-
ther starts at 𝐴 or ends at 𝐴, respectively, it gives back the same
arrow. The unit arrow for object A is called id𝐴 (identity on 𝐴). In
math notation, if 𝑓 goes from 𝐴 to 𝐵 then
𝑓 ∘ id𝐴 = 𝑓
and
id𝐵 ∘ 𝑓 = 𝑓
When dealing with functions, the identity arrow is implemented as the
identity function that just returns back its argument. The implementa-
tionisthesameforeverytype,whichmeansthisfunctionisuniversally
polymorphic. In C++ we could define it as a template:
template<class T> T id(T x) { return x; }
Of course, in C++ nothing is that simple, because you have to take into
account not only what you’re passing but also how (that is, by value, by
reference, by const reference, by move, and so on).
InHaskell,theidentityfunctionispartofthestandardlibrary(called
Prelude). Here’s its declaration and definition:
id :: a -> a
id x = x
As you can see, polymorphic functions in Haskell are a piece of cake. In
thedeclaration,youjustreplacethetypewithatypevariable.Here’sthe
trick: names of concrete types always start with a capital letter, names
6of type variables start with a lowercase letter. So here a stands for all
types.
Haskell function definitions consist of the name of the function fol-
lowed byformal parameters— herejustone, x. The body of the function
follows the equal sign. This terseness is often shocking to newcomers
but you will quickly see that it makes perfect sense. Function definition
and function call are the bread and butter of functional programming
so their syntax is reduced to the bare minimum. Not only are there no
parentheses around the argument list but there areno commas between
arguments (you’ll see that later, when we define functions of multiple
arguments).
The body of a function is always an expression — there are no state-
ments in functions. The result of a function is this expression — here,
just x.
This concludes our second Haskell lesson.
Theidentityconditionscanbewritten(again,inpseudo-Haskell)as:
f . id == f
id . f == f
You might be asking yourself the question: Why would anyone bother
with the identity function — a function that does nothing? Then again,
why do we bother with the number zero? Zero is a symbol for nothing.
Ancient Romans had a number system without a zero and they were
able to build excellent roads and aqueducts, some of which survive to
this day.
Neutral values like zero or id are extremely useful when working
with symbolic variables. That’s why Romans were not very good at al-
gebra, whereas the Arabs and the Persians, who were familiar with the
concept of zero, were. So the identity function becomes very handy as
7an argument to, or a return from, a higher-order function. Higher order
functions are what make symbolic manipulation of functions possible.
They are the algebra of functions.
Tosummarize:Acategoryconsistsofobjectsandarrows(morphisms).
Arrows can be composed, and the composition is associative. Every ob-
ject has an identity arrow that serves as a unit under composition.
1.3 CompositionistheEssenceofProgramming
Functional programmers have a peculiar way of approaching problems.
They start by asking very Zen-like questions. For instance, when de-
signing an interactive program, they would ask: What is interaction?
WhenimplementingConway’sGameofLife,theywouldprobablypon-
der about the meaning of life. In this spirit, I’m going to ask: What is
programming? At the most basic level, programming is about telling
the computer what to do. “Take the contents of memory address x and
add it to the contents of the register EAX.” But even when we program
in assembly, the instructions we give the computer are an expression of
something more meaningful. We are solving a non-trivial problem (if it
were trivial, we wouldn’t need the help of the computer). And how do
we solve problems? We decompose bigger problems into smaller prob-
lems. If the smaller problems are still too big, we decompose them fur-
ther,andso on. Finally,wewrite codethatsolvesallthe smallproblems.
And then comes the essence of programming: we compose those pieces
of code to create solutions to larger problems. Decomposition wouldn’t
make sense if we weren’t able to put the pieces back together.
Thisprocessofhierarchicaldecompositionandrecompositionisnot
imposed on us by computers. It reflects the limitations of the human
mind. Our brains can only deal with a small number of concepts at a
8time. One of the most cited papers in psychology, The Magical Num-
ber Seven, Plus or Minus Two1, postulated that we can only keep 7 ± 2
“chunks” of information in our minds. The details of our understand-
ing of the human short-term memory might be changing, but we know
for sure that it’s limited. The bottom line is that we are unable to deal
with the soup of objects or the spaghetti of code. We need structure not
because well-structured programs are pleasant to look at, but because
otherwise our brains can’t process them efficiently. We often describe
some piece of code as elegant or beautiful, but what we really mean is
that it’s easy to process by our limited human minds. Elegant code cre-
ateschunksthatarejusttherightsizeandcomeinjusttherightnumber
for our mental digestive system to assimilate them.
Sowhataretherightchunksforthecompositionofprograms?Their
surface area has to increase slower than their volume. (I like this anal-
ogy because of the intuition that the surface area of a geometric object
growswiththesquareofitssize—slowerthanthevolume,whichgrows
with the cube of its size.) The surface area is the information we need
in order to compose chunks. The volume is the information we need in
ordertoimplementthem.Theideaisthat,onceachunkisimplemented,
we can forget about the details of its implementation and concentrate
onhowitinteractswithotherchunks.Inobject-orientedprogramming,
the surface is the class declaration of the object, or its abstract interface.
In functional programming, it’s the declaration of a function. (I’m sim-
plifying things a bit, but that’s the gist of it.)
Category theory is extreme in the sense that it actively discourages
us from looking inside the objects. An object in category theory is an
abstractnebulousentity.Allyoucaneverknowaboutitishowitrelates
1http://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_
Minus_Two
9to other objects — how it connects with them using arrows. This is how
internet search engines rank web sites by analyzing incoming and out-
going links (except when they cheat). In object-oriented programming,
an idealized object is only visible through its abstract interface (pure
surface, no volume), with methods playing the role of arrows. The mo-
ment you have to dig into the implementation of the object in order to
understand how to compose it with other objects, you’ve lost the ad-
vantages of your programming paradigm.
## 1.4 Challenges
1. Implement, as best as you can, the identity function in your fa-
vorite language (or the second favorite, if your favorite language
happens to be Haskell).
2. Implement the composition function in your favorite language. It
takes two functions as arguments and returns a function that is
their composition.
3. Write a program that tries to test that your composition function
respects identity.
4. Is the world-wide web a category in any sense? Are links mor-
phisms?
5. Is Facebook a category, with people as objects and friendships as
morphisms?
6. When is a directed graph a category?
102 Types and Functions
The category of types and functions plays an important role in
programming, so let’s talk about what types are and why we need
them.
## 2.1 Who Needs Types?
There seems to be some controversy about the advantages of static vs.
dynamicandstrongvs.weaktyping.Letmeillustratethesechoiceswith
a thought experiment. Imagine millions of monkeys at computer key-
boards happily hitting random keys, producing programs, compiling,
and running them.
Withmachinelanguage,anycombinationofbytesproducedbymon-
keyswouldbeacceptedandrun.Butwithhigherlevellanguages,wedo
appreciatethefactthatacompilerisabletodetectlexicalandgrammat-
ical errors. Lots of monkeys will go without bananas, but the remain-
ing programs will have a better chance of being useful. Type checking
11provides yet another barrier against nonsensical programs. Moreover,
whereas in a dynamically typed language, type mismatches would be
discovered at runtime, in strongly typed statically checked languages
type mismatches are discovered at compile time, eliminating lots of in-
correct programs before they have a chance to run.
So the question is, do we want to make monkeys happy, or do we
want to produce correct programs?
Theusualgoalinthetypingmonkeysthoughtexperimentisthepro-
duction of the complete works of Shakespeare. Having a spell checker
and a grammar checker in the loop would drastically increase the odds.
The analog of a type checker would go even further by making sure
that, once Romeo is declared a human being, he doesn’t sprout leaves
or trap photons in his powerful gravitational field.
## 2.2 Types Are About Composability
Category theory is about composing arrows. But not any two arrows
can be composed. The target object of one arrow must be the same as
12the source object of the next arrow. In programming we pass the re-
sults of one function to another. The program will not work if the tar-
get function is not able to correctly interpret the data produced by the
source function. The two ends must fit for the composition to work. The
stronger the type system of the language, the better this match can be
described and mechanically verified.
TheonlyseriousargumentIhearagainststrongstatictypechecking
is that it might eliminate some programs that are semantically correct.
In practice, this happens extremely rarely and, in any case, every lan-
guageprovidessomekindofabackdoortobypassthetypesystemwhen
that’s really necessary. Even Haskell has unsafeCoerce. But such de-
vicesshouldbeusedjudiciously.FranzKafka’scharacter,GregorSamsa,
breaks the type system when he metamorphoses into a giant bug, and
we all know how it ends.
AnotherargumentIhearalotisthatdealingwithtypesimposestoo
much burden on the programmer. I could sympathize with this senti-
ment after having to write a few declarations of iterators in C++ myself,
except that there is a technology called type inference that lets the com-
piler deduce most of the types from the context in which they are used.
In C++, you can now declare a variable auto and let the compiler figure
out its type.
In Haskell, except on rare occasions, type annotations are purely
optional.Programmerstendtousethemanyway,becausetheycantella
lotaboutthesemanticsofcode,andtheymakecompilationerrorseasier
to understand. It’s a common practice in Haskell to start a project by
designing the types. Later, type annotations drive the implementation
and become compiler-enforced comments.
Strong static typing is often used as an excuse for not testing the
code. You may sometimes hear Haskell programmers saying, “If it com-
13piles, it must be correct.” Of course, there is no guarantee that a type-
correct program is correct in the sense of producing the right output.
TheresultofthiscavalierattitudeisthatinseveralstudiesHaskelldidn’t
come as strongly ahead of the pack in code quality as one would expect.
It seems that, in the commercial setting, the pressure to fix bugs is ap-
plied only up to a certain quality level, which has everything to do with
the economics of software development and the tolerance of the end
user, and very little to do with the programming language or method-
ology. A better criterion would be to measure how many projects fall
behind schedule or are delivered with drastically reduced functionality.
As for the argument that unit testing can replace strong typing,
consider the common refactoring practice in strongly typed languages:
changing the type of an argument of a particular function. In a strongly
typed language, it’s enough to modify the declaration of that function
and then fix all the build breaks. In a weakly typed language, the fact
that a function now expects different data cannot be propagated to call
sites. Unit testing may catch some of the mismatches, but testing is al-
most always a probabilistic rather than a deterministic process. Testing
is a poor substitute for proof.
## 2.3 What Are Types?
The simplest intuition for types is that they are sets of values. The type
Bool (remember, concrete types start with a capital letter in Haskell) is
a two-element set of True and False. Type Char is a set of all Unicode
characters like a or ą.
Sets can be finite or infinite. The type of String, which is a synonym
for a list of Char, is an example of an infinite set.
When we declare x to be an Integer:
14x :: Integer
we are saying that it’s an element of the set of integers. Integer in
Haskell is an infinite set, and it can be used to do arbitrary precision
arithmetic. There is also a finite-set Int that corresponds to machine
type, just like the C++ int.
There are some subtleties that make this identification of types and
sets tricky. Thereare problemswith polymorphic functions that involve
circulardefinitions,andwiththefactthatyoucan’thaveasetofallsets;
but as I promised, I won’t be a stickler for math. The great thing is that
there is a category of sets, which is called 𝐒𝐞𝐭, and we’ll just work with
it. In 𝐒𝐞𝐭, objects are sets and morphisms (arrows) are functions.
𝐒𝐞𝐭 is a very special category, because we can actually peek inside
its objects and get a lot of intuitions from doing that. For instance, we
know that an empty set has no elements. We know that there are spe-
cial one-element sets. We know that functions map elements of one set
to elements of another set. They can map two elements to one, but not
one element to two. We know that an identity function maps each ele-
ment of a set to itself, and so on. The plan is to gradually forget all this
information and instead express all those notions in purely categorical
terms, that is in terms of objects and arrows.
In the ideal world we would just say that Haskell types are sets and
Haskellfunctionsaremathematicalfunctionsbetweensets.Thereisjust
one little problem: A mathematical function does not execute any code
— it just knows the answer. A Haskell function has to calculate the an-
swer. It’s not a problem if the answer can be obtained in a finite number
of steps — however big that number might be. But there are some cal-
culations that involve recursion, and those might never terminate. We
can’t just ban non-terminating functions from Haskell because distin-
guishing between terminating and non-terminating functions is unde-
15cidable — the famous halting problem. That’s why computer scientists
came up with a brilliant idea, or a major hack, depending on your point
of view, to extend every type by one more special value called the bot-
tom and denoted by _|_, or Unicode ⊥. This “value” corresponds to a
non-terminating computation. So a function declared as:
f :: Bool -> Bool
may return True, False, or _|_; the latter meaning that it would never
terminate.
Interestingly,onceyouacceptthebottomaspartofthetypesystem,
it is convenient to treat every runtime error as a bottom, and even allow
functionstoreturnthebottomexplicitly.Thelatterisusuallydoneusing
the expression undefined, as in:
f :: Bool -> Bool
f x = undefined
Thisdefinitiontypechecksbecauseundefined evaluatestobottom,which
is a member of any type, including Bool. You can even write:
f :: Bool -> Bool
f = undefined
(without the x) because the bottom is also a member of the type
Bool -> Bool.
Functions that may return bottom are called partial, as opposed to
total functions, which return valid results for every possible argument.
Because of the bottom, you’ll see the category of Haskell types and
functionsreferredtoasHaskratherthan𝐒𝐞𝐭.Fromthetheoreticalpoint
ofview,thisisthesourceofnever-endingcomplications,soatthispoint
16I will use my butcher’s knife and terminate this line of reasoning. From
the pragmatic point of view, it’s okay to ignore non-terminating func-
tions and bottoms, and treat Hask as bona fide 𝐒𝐞𝐭.1
## 2.4 Why Do We Need a Mathematical Model?
Asaprogrammeryouareintimatelyfamiliarwiththesyntaxandgram-
mar of your programming language. These aspects of the language are
usually described using formal notation at the very beginning of the
language spec. But the meaning, or semantics, of the language is much
harder to describe; it takes many more pages, is rarely formal enough,
and almost never complete. Hence the never ending discussions among
language lawyers, and a whole cottage industry of books dedicated to
the exegesis of the finer points of language standards.
There are formal tools for describing the semantics of a language
but, because of their complexity, they are mostly used with simplified
academic languages, not real-life programming behemoths. One such
tool called operational semantics describes the mechanics of program
execution. It defines a formalized idealized interpreter. The semantics of
industrial languages, such as C++, is usually described using informal
operational reasoning, often in terms of an “abstract machine.”
The problem is that it’s very hard to prove things about programs
using operational semantics. To show a property of a program you es-
sentially have to “run it” through the idealized interpreter.
It doesn’t matter that programmers never perform formal proofs of
correctness.Wealways“think”thatwewritecorrectprograms.Nobody
1Nils Anders Danielsson, John Hughes, Patrik Jansson, Jeremy Gibbons, Fast and
Loose Reasoning is Morally Correct. This paper provides justification for ignoring bot-
toms in most contexts.
17sits at the keyboard saying, “Oh, I’ll just throw a few lines of code and
seewhathappens.”Wethinkthatthecodewewritewillperformcertain
actions that will produce desired results. We are usually quite surprised
whenitdoesn’t.Thatmeanswedoreasonaboutprogramswewrite,and
we usually do it by running an interpreter in our heads. It’s just really
hard to keep track of all the variables. Computers are good at running
programs — humans are not! If we were, we wouldn’t need computers.
But there is an alternative. It’s called denotational semantics and it’s
basedonmath.Indenotationalsemanticseveryprogrammingconstruct
is given its mathematical interpretation. With that, if you want to prove
a property of a program, you just prove a mathematical theorem. You
mightthinkthattheoremprovingishard,butthefactisthatwehumans
have been building up mathematical methods for thousands of years, so
there is a wealth of accumulated knowledge to tap into. Also, as com-
pared to the kind of theorems that professional mathematicians prove,
the problems that we encounter in programming are usually quite sim-
ple, if not trivial.
Consider the definition of a factorial function in Haskell, which is a
language quite amenable to denotational semantics:
fact n = product [1..n]
The expression [1..n] is a list of integers from 1 to n. The function
product multiplies all elements of a list. That’s just like a definition of
factorial taken from a math text. Compare this with C:
int fact(int n) {
int i;
int result = 1;
for (i = 2; i <= n; ++i)
result *= i;
18return result;
}
Need I say more?
Okay, I’ll be the first to admit that this was a cheap shot! A facto-
rial function has an obvious mathematical denotation. An astute reader
might ask: What’s the mathematical model for reading a character from
the keyboard or sending a packet across the network? For the longest
timethatwouldhavebeenanawkwardquestionleadingtoarathercon-
voluted explanation. It seemed like denotational semantics wasn’t the
best fit for a considerable number of important tasks that were essential
for writing useful programs, and which could be easily tackled by oper-
ational semantics. The breakthrough came from category theory. Euge-
nio Moggi discovered that computational effect can be mapped to mon-
ads. This turned out to be an important observation that not only gave
denotational semantics a new lease on life and made pure functional
programs more usable, but also shed new light on traditional program-
ming. I’ll talk about monads later, when we develop more categorical
tools.
One of the important advantages of having a mathematical model
for programming is that it’s possible to perform formal proofs of cor-
rectness of software. This might not seem so important when you’re
writing consumer software, but there are areas of programming where
the price of failure may be exorbitant, or where human life is at stake.
Butevenwhenwritingwebapplicationsforthehealthsystem,youmay
appreciate the thought that functions and algorithms from the Haskell
standard library come with proofs of correctness.
192.5 Pure and Dirty Functions
The things we call functions in C++ or any other imperative language,
are not the same things mathematicians call functions. A mathematical
function is just a mapping of values to values.
We can implement a mathematical function in a programming lan-
guage: Such a function, given an input value will calculate the output
value. A function to produce a square of a number will probably multi-
ply the input value by itself. It will do it every time it’s called, and it’s
guaranteed to produce the same output every time it’s called with the
same input. The square of a number doesn’t change with the phases of
the Moon.
Also, calculating the square of a number should not have a side ef-
fect of dispensing a tasty treat for your dog. A “function” that does that
cannot be easily modelled as a mathematical function.
Inprogramminglanguages,functionsthatalwaysproducethesame
resultgiventhesameinputandhavenosideeffectsarecalledpurefunc-
tions. In a pure functional language like Haskell all functions are pure.
Because of that, it’s easier to give these languages denotational seman-
tics and model them using category theory. As for other languages, it’s
alwayspossibletorestrictyourselftoapuresubset,orreasonaboutside
effects separately. Later we’ll see how monads let us model all kinds of
effects using only pure functions. So we really don’t lose anything by
restricting ourselves to mathematical functions.
## 2.6 Examples of Types
Onceyou realize that types aresets, youcan think of some rather exotic
types. For instance, what’s the type corresponding to an empty set? No,
20it’s not C++ void, although this type is called Void in Haskell. It’s a type
that’s not inhabited by any values. You can define a function that takes
Void, but you can never call it. To call it, you would have to provide
a value of the type Void, and there just aren’t any. As for what this
function can return, there are no restrictions whatsoever. It can return
any type (although it never will, because it can’t be called). In other
words it’s a function that’s polymorphic in the return type. Haskellers
have a name for it:
absurd :: Void -> a
(Remember,a isatypevariablethatcanstandforanytype.)Thenameis
not coincidental. There is deeper interpretation of types and functions
in terms of logic called the Curry-Howard isomorphism. The type Void
represents falsity, and the type of the function absurd corresponds to
the statement that from falsity follows anything, as in the Latin adage
“ex falso sequitur quodlibet.”
Next is the type that corresponds to a singleton set. It’s a type that
has only one possible value. This value just “is.” You might not immedi-
ately recognise it as such, but that is the C++ void. Think of functions
from and to this type.A function from void can always be called. If it’s a
pure function, it will always return the same result. Here’s an example
of such a function:
int f44() { return 44; }
You might think of this function as taking “nothing”, but as we’ve just
seen,afunctionthattakes“nothing”canneverbecalledbecausethereis
no value representing “nothing.” So what does this function take? Con-
ceptually, it takes a dummy value of which there is only one instance
ever, so we don’t have to mention it explicitly. In Haskell, however,
21there is a symbol for this value: an empty pair of parentheses, (). So,
by a funny coincidence (or is it a coincidence?), the call to a function of
voidlooksthesameinC++andinHaskell.Also,becauseoftheHaskell’s
love of terseness, the same symbol () is used for the type, the construc-
tor, and the only value corresponding to a singleton set. So here’s this
function in Haskell:
f44 :: () -> Integer
f44 () = 44
The first line declares that f44 takes the type (), pronounced “unit,” into
the type Integer. The second line defines f44 by pattern matching the
only constructor for unit, namely (), and producing the number 44. You
call this function by providing the unit value ():
f44 ()
Notice that every function of unit is equivalent to picking a single el-
ement from the target type (here, picking the Integer 44). In fact you
could think of f44 as a different representation for the number 44. This
is an example of how we can replace explicit mention of elements of a
set by talking about functions (arrows) instead. Functions from unit to
any type 𝐴 are in one-to-one correspondence with the elements of that
set 𝐴.
What about functions with the void return type, or, in Haskell, with
the unit return type? In C++ such functions are used for side effects, but
we know that these are not real functions in the mathematical sense of
the word. A pure function that returns unit does nothing: it discards its
argument.
Mathematically, a function from a set 𝐴 to a singleton set maps ev-
ery element of 𝐴 to the single element of that singleton set. For every
𝐴 there is exactly one such function. Here’s this function for Integer:
22fInt :: Integer -> ()
fInt x = ()
You give it any integer, and it gives you back a unit. In the spirit of
terseness, Haskell lets you use the wildcard pattern, the underscore, for
anargumentthatisdiscarded.Thiswayyoudon’thavetoinventaname
for it. So the above can be rewritten as:
fInt :: Integer -> ()
fInt _ = ()
Noticethattheimplementationofthisfunctionnotonlydoesn’tdepend
on the value passed to it, but it doesn’t even depend on the type of the
argument.
Functions that can be implemented with the same formula for any
typearecalledparametricallypolymorphic.Youcanimplementawhole
family of such functions with one equation using a type parameter in-
stead of a concrete type. What should we call a polymorphic function
from any type to unit type? Of course we’ll call it unit:
unit :: a -> ()
unit _ = ()
In C++ you would write this function as:
template<class T>
void unit(T) {}
Next in the typology of types is a two-element set. In C++ it’s called
bool and in Haskell, predictably, Bool. The difference is that in C++ bool
is a built-in type, whereas in Haskell it can be defined as follows:
23data Bool = True | False
(The way to read this definition is that Bool is either True or False.) In
principle, one should also be able to define a Boolean type in C++ as an
enumeration:
enum bool {
true,
false
};
but C++ enum is secretly an integer. The C++11 “enum class” could have
been used instead, but then you would have to qualify its values with
theclassname,asinbool::true andbool::false,nottomentionhaving
to include the appropriate header in every file that uses it.
Pure functions from Bool just pick two values from the target type,
one corresponding to True and another to False.
Functions to Bool are called predicates. For instance, the Haskell li-
braryData.Char isfullofpredicateslikeisAlpha orisDigit.InC++there
is a similar library that defines, among others, isalpha and isdigit, but
these return an int rather than a Boolean. The actual predicates are de-
fined in std::ctype and have the form ctype::is(alpha, c),
ctype::is(digit, c), etc.
## 2.7 Challenges
1. Define a higher-order function (or a function object) memoize in
your favorite language. This function takes a pure function f as
an argument and returns a function that behaves almost exactly
likef,exceptthatitonlycallstheoriginalfunctiononceforevery
24argument, stores the result internally, and subsequently returns
this stored result every time it’s called with the same argument.
You can tell the memoized function from the original by watch-
ing its performance. For instance, try to memoize a function that
takes a long time to evaluate. You’ll have to wait for the result
the first time you call it, but on subsequent calls, with the same
argument, you should get the result immediately.
2. Try to memoize a function from your standard library that you
normally use to produce random numbers. Does it work?
3. Most random number generators can be initialized with a seed.
Implement a function that takes a seed, calls the random number
generator with that seed, and returns the result. Memoize that
function. Does it work?
4. Which of these C++ functions are pure? Try to memoize them
and observe what happens when you call them multiple times:
memoized and not.
(a) The factorial function from the example in the text.
(b) std::getchar()
(c) bool f() {
std::cout << "Hello!" << std::endl;
return true;
}
(d) int f(int x) {
static int y = 0;
y += x;
return y;
}
5. How many different functions are there from Bool to Bool? Can
you implement them all?
256. Draw a picture of a category whose only objects are the types
Void,() (unit),andBool;witharrowscorrespondingtoallpossible
functions between these types. Label the arrows with the names
of the functions.
263
Categories Great and Small
You can get real appreciation for categories by studying a variety of
examples. Categories come in all shapes and sizes and often pop up
in unexpected places. We’ll start with something really simple.
## 3.1 No Objects
The most trivial category is one with zero objects and, consequently,
zero morphisms. It’s a very sad category by itself, but it may be impor-
tant in the context of other categories, for instance, in the category of
all categories (yes, there is one). If you think that an empty set makes
sense, then why not an empty category?
273.2 Simple Graphs
Youcanbuildcategoriesjustbyconnectingobjectswitharrows.Youcan
imagine starting with any directed graph and making it into a category
bysimplyaddingmorearrows.First,addanidentityarrowateachnode.
Then, for any two arrows such that the end of one coincides with the
beginning of the other (in other words, any two composable arrows),
add a new arrow to serve as their composition. Every time you add a
new arrow, you have to also consider its composition with any other
arrow (except for the identity arrows) and itself. You usually end up
with infinitely many arrows, but that’s okay.
Another way of looking at this process is that you’re creating a cat-
egory, which has an object for every node in the graph, and all possible
chains of composable graph edges as morphisms. (You may even con-
sider identity morphisms as special cases of chains of length zero.)
Such a category is called a free category generated by a given graph.
It’s an example of a free construction, a process of completing a given
structure by extending it with a minimum number of items to satisfy its
laws (here, the laws of a category). We’ll see more examples of it in the
future.
## 3.3 Orders
And now for something completely different! A category where a mor-
phism is a relation between objects: the relation of being less than or
equal. Let’s check if it indeed is a category. Do we have identity mor-
phisms? Every object is less than or equal to itself: check! Do we have
composition? If 𝑎 ⩽ 𝑏 and 𝑏 ⩽ 𝑐 then 𝑎 ⩽ 𝑐: check! Is composition as-
28sociative? Check! A set with a relation like this is called a preorder, so a
preorder is indeed a category.
You can also have a stronger relation, that satisfies an additional
condition that, if 𝑎 ⩽ 𝑏 and 𝑏 ⩽ 𝑎 then 𝑎 must be the same as 𝑏. That’s
called a partial order.
Finally, you can impose the condition that any two objects are in a
relationwitheachother,onewayoranother;andthatgivesyoualinear
order or total order.
Let’s characterize these ordered sets as categories. A preorder is a
category where there is at most one morphism going from any object 𝑎
to any object 𝑏. Another name for such a category is “thin.” A preorder
is a thin category.
Asetofmorphismsfromobject𝑎 toobject𝑏 inacategory𝐂iscalled
a hom-set and is written as 𝐂(𝑎,𝑏) (or, sometimes, Hom𝐂(𝑎,𝑏)). So ev-
ery hom-set in a preorder is either empty or a singleton. That includes
the hom-set 𝐂(𝑎,𝑎), the set of morphisms from 𝑎 to 𝑎, which must be a
singleton, containing only the identity, in any preorder. You may, how-
ever, have cycles in a preorder. Cycles are forbidden in a partial order.
It’s very important to be able to recognize preorders, partial orders,
and total orders because of sorting. Sorting algorithms, such as quick-
sort, bubble sort, merge sort, etc., can only work correctly on total or-
ders. Partial orders can be sorted using topological sort.
## 3.4 Monoid as Set
Monoid is an embarrassingly simple but amazingly powerful concept.
It’s the concept behind basic arithmetics: Both addition and multipli-
cation form a monoid. Monoids are ubiquitous in programming. They
29show up as strings, lists, foldable data structures, futures in concurrent
programming, events in functional reactive programming, and so on.
Traditionally, a monoid is defined as a set with a binary operation.
All that’s required from this operation is that it’s associative, and that
there is one special element that behaves like a unit with respect to it.
For instance, natural numbers with zero form a monoid under ad-
dition. Associativity means that:
(𝑎 + 𝑏) + 𝑐 = 𝑎 + (𝑏 + 𝑐)
(In other words, we can skip parentheses when adding numbers.)
The neutral element is zero, because:
0 + 𝑎 = 𝑎
and
𝑎 + 0 = 𝑎
Thesecondequationisredundant,becauseadditioniscommutative(𝑎+
𝑏 = 𝑏 + 𝑎), but commutativity is not part of the definition of a monoid.
For instance, string concatenation is not commutative and yet it forms
a monoid. The neutral element for string concatenation, by the way, is
anemptystring,whichcanbeattachedtoeithersideofastringwithout
changing it.
InHaskellwecandefineatypeclassformonoids—atypeforwhich
there is a neutral element called mempty and a binary operation called
mappend:
class Monoid m where
mempty :: m
mappend :: m -> m -> m
30The type signature for a two-argument function, m -> m -> m, might
look strange at first, but it will make perfect sense after we talk about
currying.Youmayinterpretasignaturewithmultiplearrowsintwoba-
sic ways: as a function of multiple arguments, with the rightmost type
being the return type; or as a function of one argument (the leftmost
one), returning a function. The latter interpretation may be emphasized
byaddingparentheses(whichareredundant,becausethearrowisright-
associative),as in: m -> (m -> m). We’ll come back to this interpretation
in a moment.
Notice that, in Haskell, there is no way to express the monoidal
properties of mempty and mappend (i.e., the fact that mempty is neutral and
that mappend is associative). It’s the responsibility of the programmer to
make sure they are satisfied.
Haskell classes are not as intrusive as C++ classes. When you’re
defining a new type, you don’t have to specify its class up front. You are
free to procrastinate and declare a given type to be an instance of some
class much later. As an example, let’s declare String to be a monoid
by providing the implementation of mempty and mappend (this is, in fact,
done for you in the standard Prelude):
instance Monoid String where
mempty = ""
mappend = (++)
Here, we have reused the list concatenation operator (++), because a
String is just a list of characters.
A word about Haskell syntax: Any infix operator can be turned into
a two-argument function by surrounding it with parentheses. Given
two strings, you can concatenate them by inserting ++ between them:
"Hello " ++ "world!"
31or by passing them as two arguments to the parenthesized (++):
(++) "Hello " "world!"
Notice that arguments to a function are not separated by commas or
surrounded by parentheses. (This is probably the hardest thing to get
used to when learning Haskell.)
It’s worth emphasizing that Haskell lets you express equality of
functions, as in:
mappend = (++)
Conceptually, this is different than expressing the equality of values
produced by functions, as in:
mappend s1 s2 = (++) s1 s2
The former translates into equality of morphisms in the category Hask
(or 𝐒𝐞𝐭, if we ignore bottoms, which is the name for never-ending cal-
culations). Such equations are not only more succinct, but can often be
generalized to other categories. The latter is called extensional equal-
ity, and states the fact that for any two input strings, the outputs of
mappend and (++) are the same. Since the values of arguments are some-
times called points (as in: the value of 𝑓 at point 𝑥), this is called point-
wise equality. Function equality without specifying the arguments is
described as point-free. (Incidentally, point-free equations often involve
composition of functions, which is symbolized by a point, so this might
be a little confusing to the beginner.)
The closest one can get to declaring a monoid in C++ would be to
use the (proposed) syntax for concepts.
32template<class T>
T mempty = delete;
template<class T>
T mappend(T, T) = delete;
template<class M>
concept bool Monoid = requires (M m) {
{ mempty<M> } -> M;
{ mappend(m, m); } -> M;
};
Thefirstdefinitionusesavaluetemplate(alsoproposed).Apolymorphic
value is a family of values — a different value for every type.
The keyword delete means that there is no default value defined: It
will have to be specified on a case-by-case basis. Similarly, there is no
default for mappend.
The concept Monoid is a predicate (hence the bool type) that tests
whether there exist appropriate definitions of mempty and mappend for a
given type M.
AninstantiationoftheMonoidconceptcanbeaccomplishedbypro-
viding appropriate specializations and overloads:
template<>
std::string mempty<std::string> = {""};
std::string mappend(std::string s1, std::string s2) {
return s1 + s2;
}
333.5 Monoid as Category
That was the “familiar” definition of the monoid in terms of elements
of a set. But as you know, in category theory we try to get away from
sets and their elements, and instead talk about objects and morphisms.
So let’s change our perspective a bit and think of the application of the
binary operator as “moving” or “shifting” things around the set.
Forinstance,thereistheoperationofadding5toeverynaturalnum-
ber. It maps 0 to 5, 1 to 6, 2 to 7, and so on. That’s a function defined on
the set of natural numbers. That’s good: we have a function and a set. In
general, for any number n there is a function of adding 𝑛 — the “adder”
of 𝑛.
How do adders compose? The composition of the function that adds
5 with the function that adds 7 is a function that adds 12. So the compo-
sition of adders can be made equivalent to the rules of addition. That’s
good too: we can replace addition with function composition.
But wait, there’s more: There is also the adder for the neutral ele-
ment, zero. Adding zero doesn’t move things around, so it’s the identity
function in the set of natural numbers.
Insteadofgivingyouthetraditionalrulesofaddition,Icouldaswell
give you the rules of composing adders, without any loss of informa-
tion. Notice that the composition of adders is associative, because the
composition of functions is associative; and we have the zero adder cor-
responding to the identity function.
Anastutereadermighthavenoticedthatthemappingfromintegers
to adders follows from the second interpretation of the type signature
of mappend as m -> (m -> m). It tells us that mappend maps an element of
a monoid set to a function acting on that set.
34NowIwantyoutoforgetthatyouaredealingwiththesetofnatural
numbers and just think of it as a single object, a blob with a bunch
of morphisms — the adders. A monoid is a single object category. In
fact the name monoid comes from Greek mono, which means single.
Every monoid can be described as a single object category with a set of
morphisms that follow appropriate rules of composition.
String concatenation is an interesting
case, because we have a choice of defin-
ing right appenders and left appenders (or
prependers, if you will). The composition
tables of the two models are a mirror re-
verse of each other. You can easily con-
vince yourself that appending “bar” after
“foo” corresponds to prepending “foo” af-
ter prepending “bar”.
You might ask the question whether
every categorical monoid — a one-object
category — defines a unique set-with-binary-operator monoid. It turns
out that we can always extract a set from a single-object category. This
set is the set of morphisms — the adders in our example. In other words,
we have the hom-set 𝐌(𝑚,𝑚) of the single object 𝑚 in the category 𝐌.
We can easily define abinary operatorin thisset: The monoidalproduct
of two set-elements is the element corresponding to the composition of
the corresponding morphisms. If you give me two elements of 𝐌(𝑚,𝑚)
corresponding to 𝑓 and 𝑔, their product will correspond to the compo-
sition 𝑓 ∘ 𝑔. The composition always exists, because the source and the
target for these morphisms are the same object. And it’s associative by
the rules of category. The identity morphism is the neutral element of
35Monoid hom-set seen as morphisms and as points in a set.
this product. So we can always recover a set monoid from a category
monoid. For all intents and purposes they are one and the same.
There is just one little nit for mathematicians to pick: morphisms
don’t have to form a set. In the world of categories there are things
larger than sets. A category in which morphisms between any two ob-
jects form a set is called locally small. As promised, I will be mostly
ignoring such subtleties, but I thought I should mention them for the
record.
A lot of interesting phenomena in category theory have their root
in the fact that elements of a hom-set can be seen both as morphisms,
whichfollowtherulesofcomposition,andaspointsinaset.Here,com-
position of morphisms in 𝐌 translates into monoidal product in the set
𝐌(𝑚,𝑚).
## 3.6 Challenges
1. Generate a free category from:
(a) A graph with one node and no edges
36(b) A graph with one node and one (directed) edge (hint: this
edge can be composed with itself)
(c) A graph with two nodes and a single arrow between them
(d) A graph with a single node and 26 arrows marked with the
letters of the alphabet: a, b, c … z.
2. What kind of order is this?
(a) A set of sets with the inclusion relation: 𝐴 is included in 𝐵
if every element of 𝐴 is also an element of 𝐵.
(b) C++typeswiththefollowingsubtypingrelation:T1 isasub-
type of T2 if a pointer to T1 can be passed to a function that
expects a pointer to T2 without triggering a compilation er-
ror.
3. Considering that Bool is a set of two values True and False, show
that it forms two (set-theoretical) monoids with respect to, re-
spectively, operator && (AND) and || (OR).
4. Represent the Bool monoid with the AND operator as a category:
List the morphisms and their rules of composition.
5. Represent addition modulo 3 as a monoid category.
374
Kleisli Categories
You’ve seen how to model types and pure functions as a category.
I also mentioned that there is a way to model side effects, or non-
pure functions, in category theory. Let’s have a look at one such exam-
ple: functions that log or trace their execution. Something that, in an
imperative language, would likely be implemented by mutating some
global state, as in:
string logger;
bool negate(bool b) {
logger += "Not so! ";
return !b;
}
You know that this is not a pure function, because its memoized version
would fail to produce a log. This function has side effects.
38In modern programming, we try to stay away from global muta-
ble state as much as possible — if only because of the complications of
concurrency. And you would never put code like this in a library.
Fortunately for us, it’s possible to make this function pure. You just
have to pass the log explicitly, in and out. Let’s do that by adding a
string argument, and pairing regular output with a string that contains
the updated log:
pair<bool, string> negate(bool b, string logger) {
return make_pair(!b, logger + "Not so! ");
}
Thisfunctionispure,ithasnosideeffects,itreturnsthesamepairevery
time it’s called with the same arguments, and it can be memoized if
necessary.However,consideringthecumulativenatureofthelog,you’d
havetomemoizeallpossiblehistoriesthatcanleadtoagivencall.There
would be a separate memo entry for:
negate(true, "It was the best of times. ");
and
negate(true, "It was the worst of times. ");
and so on.
It’s also not a very good interface for a library function. The callers
are free to ignore the string in the return type, so that’s not a huge
burden; but they are forced to pass a string as input, which might be
inconvenient.
Is there a way to do the same thing less intrusively? Is there a way
to separate concerns? In this simple example, the main purpose of the
39function negate is to turn one Boolean into another. The logging is sec-
ondary. Granted, the message that is logged is specific to the function,
but the task of aggregating the messages into one continuous log is a
separate concern. We still want the function to produce a string, but
we’d like to unburden it from producing a log. So here’s the compro-
mise solution:
pair<bool, string> negate(bool b) {
return make_pair(!b, "Not so! ");
}
The idea is that the log will be aggregated between function calls.
To see how this can be done, let’s switch to a slightly more realistic
example. We have one function from string to string that turns lower
case characters to upper case:
string toUpper(string s) {
string result;
int (*toupperp)(int) = &toupper; // toupper is overloaded
transform(begin(s), end(s), back_inserter(result), toupperp);
return result;
}
and another that splits a string into a vector of strings, breaking it on
whitespace boundaries:
vector<string> toWords(string s) {
return words(s);
}
The actual work is done in the auxiliary function words:
40vector<string> words(string s) {
vector<string> result{""};
for (auto i = begin(s); i != end(s); ++i)
{
if (isspace(*i))
result.push_back("");
else
result.back() += *i;
}
return result;
}
We want to modify the functions
toUpper and toWords so that they pig-
gybackamessagestringontopoftheir
regular return values.
We will “embellish” the return val-
ues of these functions. Let’s do it in
a generic way by defining a template
Writer that encapsulates a pair whose
first component is a value of arbitrary
type A and the second component is a
string:
template<class A>
using Writer = pair<A, string>;
Here are the embellished functions:
Writer<string> toUpper(string s) {
string result;
int (*toupperp)(int) = &toupper;
41transform(begin(s), end(s), back_inserter(result), toupperp);
return make_pair(result, "toUpper ");
}
Writer<vector<string>> toWords(string s) {
return make_pair(words(s), "toWords ");
}
Wewanttocomposethesetwofunctionsintoanotherembellishedfunc-
tion that uppercases a string and splits it into words, all the while pro-
ducing a log of those actions. Here’s how we may do it:
Writer<vector<string>> process(string s) {
auto p1 = toUpper(s);
auto p2 = toWords(p1.first);
return make_pair(p2.first, p1.second + p2.second);
}
We have accomplished our goal: The aggregation of the log is no longer
the concern of the individual functions. They produce their own mes-
sages, which are then, externally, concatenated into a larger log.
Nowimagineawholeprogramwritteninthisstyle.It’sanightmare
of repetitive, error-prone code. But we are programmers. We know how
to deal with repetitive code: we abstract it! This is, however, not your
run of the mill abstraction — we have to abstract function composition
itself. But composition is the essence of category theory, so before we
write more code, let’s analyze the problem from the categorical point of
view.
424.1 The Writer Category
The idea of embellishing the return types of a bunch of functions in
order to piggyback some additional functionality turns out to be very
fruitful. We’ll see many more examples of it. The starting point is our
regularcategoryoftypesandfunctions.We’llleavethetypesasobjects,
but redefine our morphisms to be the embellished functions.
Forinstance,supposethatwewanttoembellishthefunctionisEven
that goes from int to bool. We turn it into a morphism that is rep-
resented by an embellished function. The important point is that this
morphism is still considered anarrowbetween theobjects int and bool,
even though the embellished function returns a pair:
pair<bool, string> isEven(int n) {
return make_pair(n % 2 == 0, "isEven ");
}
By the laws of a category, we should be able to compose this morphism
with another morphism that goes from the object bool to whatever. In
particular, we should be able to compose it with our earlier negate:
pair<bool, string> negate(bool b) {
return make_pair(!b, "Not so! ");
}
Obviously, we cannot compose these two morphisms the same way we
composeregularfunctions,becauseoftheinput/outputmismatch.Their
composition should look more like this:
pair<bool, string> isOdd(int n) {
pair<bool, string> p1 = isEven(n);
pair<bool, string> p2 = negate(p1.first);
43return make_pair(p2.first, p1.second + p2.second);
}
So here’s the recipe for the composition of two morphisms in this new
category we are constructing:
1. Execute the embellished function corresponding to the first mor-
phism
2. Extract the first component of the result pair and pass it to the
embellished function corresponding to the second morphism
3. Concatenate the second component (the string) of the first result
and the second component (the string) of the second result
4. Return a new pair combining the first component of the final re-
sult with the concatenated string.
If we want to abstract this composition as a higher order function
in C++, we have to use a template parameterized by three types cor-
responding to three objects in our category. It should take two embel-
lished functions that are composable according to our rules, and return
a third embellished function:
template<class A, class B, class C>
function<Writer<C>(A)> compose(function<Writer<B>(A)> m1,
function<Writer<C>(B)> m2)
{
return [m1, m2](A x) {
auto p1 = m1(x);
auto p2 = m2(p1.first);
return make_pair(p2.first, p1.second + p2.second);
};
}
44Now we can go back to our earlier example and implement the compo-
sition of toUpper and toWords using this new template:
Writer<vector<string>> process(string s) {
return compose<string, string, vector<string>>(toUpper,
toWords)(s); ↪
}
There is still a lot of noise with the passing of types to the compose tem-
plate. This can be avoided as long as you have a C++14-compliant com-
piler that supports generalized lambda functions with return type de-
duction (credit for this code goes to Eric Niebler):
auto const compose = [](auto m1, auto m2) {
return [m1, m2](auto x) {
auto p1 = m1(x);
auto p2 = m2(p1.first);
return make_pair(p2.first, p1.second + p2.second);
};
};
In this new definition, the implementation of process simplifies to:
Writer<vector<string>> process(string s) {
return compose(toUpper, toWords)(s);
}
But we are not finished yet. We have defined composition in our new
category, but what are the identity morphisms? These are not our reg-
ular identity functions! They have to be morphisms from type A back
to type A, which means they are embellished functions of the form:
Writer<A> identity(A);
45They have to behave like units with respect to composition. If you look
at our definition of composition, you’ll see that an identity morphism
shouldpassitsargumentwithoutchange,andonlycontributeanempty
string to the log:
template<class A> Writer<A> identity(A x) {
return make_pair(x, "");
}
You can easily convince yourself that the category we have just defined
isindeedalegitimatecategory.Inparticular,ourcompositionistrivially
associative. If you follow what’s happening with the first component of
each pair, it’s just a regular function composition, which is associative.
The second components are being concatenated, and concatenation is
also associative.
An astute reader may notice that it would be easy to generalize this
construction to any monoid, not just the string monoid. We would use
mappend inside compose and mempty inside identity (in place of + and
""). There really is no reason to limit ourselves to logging just strings.
A good library writer should be able to identify the bare minimum of
constraintsthatmakethelibrarywork—herethelogginglibrary’sonly
requirement is that the log have monoidal properties.
## 4.2 Writer in Haskell
The same thing in Haskell is a little more terse, and we also get a lot
more help from the compiler. Let’s start by defining the Writer type:
type Writer a = (a, String)
46Here I’m just defining a type alias, an equivalent of a typedef (or using)
in C++. The type Writer is parameterized by a type variable a and is
equivalent to a pair of a and String. The syntax for pairs is minimal:
just two items in parentheses, separated by a comma.
OurmorphismsarefunctionsfromanarbitrarytypetosomeWriter
type:
a -> Writer b
We’lldeclarethecompositionasafunnyinfixoperator,sometimescalled
the “fish”:
(>=>) :: (a -> Writer b) -> (b -> Writer c) -> (a -> Writer c)
It’s a function of two arguments, each being a function on its own, and
returning a function. The first argument is of the type (a -> Writer b),
the second is (b -> Writer c), and the result is (a -> Writer c).
Here’s the definition of this infix operator — the two arguments m1
and m2 appearing on either side of the fishy symbol:
m1 >=> m2 = \x ->
let (y, s1) = m1 x
(z, s2) = m2 y
in (z, s1 ++ s2)
Theresultisalambdafunctionofoneargumentx.Thelambdaiswritten
as a backslash — think of it as the Greek letter λ with an amputated leg.
The let expression lets you declare auxiliary variables. Here the re-
sultofthecalltom1 ispatternmatchedtoapairofvariables(y, s1);and
the result of the call to m2, with the argument y from the first pattern, is
matched to (z, s2).
47It is common in Haskell to pattern match pairs, rather than use ac-
cessors, as we did in C++. Other than that there is a pretty straightfor-
ward correspondence between the two implementations.
The overall value of the let expression is specified in its in clause:
here it’s a pair whose first component is z and the second component is
the concatenation of two strings, s1++s2.
I will also define the identity morphism for our category, but for
reasons that will become clear much later, I will call it return.
return :: a -> Writer a
return x = (x, "")
For completeness, let’s have the Haskell versions of the embellished
functions upCase and toWords:
upCase :: String -> Writer String
upCase s = (map toUpper s, "upCase ")
toWords :: String -> Writer [String]
toWords s = (words s, "toWords ")
The function map corresponds to the C++ transform. It applies the char-
acter function toUpper to the string s. The auxiliary function words is
defined in the standard Prelude library.
Finally, the composition of the two functions is accomplished with
the help of the fish operator:
process :: String -> Writer [String]
process = upCase >=> toWords
484.3 Kleisli Categories
You might have guessed that I haven’t invented this category on the
spot. It’s an example of the so called Kleisli category — a category based
on a monad. We are not ready to discuss monads yet, but I wanted to
give you a taste of what they can do. For our limited purposes, a Kleisli
category has, as objects, the types of the underlying programming lan-
guage.Morphismsfromtype𝐴totype𝐵 arefunctionsthatgofrom𝐴to
a type derived from 𝐵 using the particular embellishment. Each Kleisli
category defines its own way of composing such morphisms, as well as
the identity morphisms with respect to that composition. (Later we’ll
see that the imprecise term “embellishment” corresponds to the notion
of an endofunctor in a category.)
The particular monad that I used as the basis of the category in this
postiscalledthewritermonad andit’susedforloggingortracingtheex-
ecution of functions. It’s also an example of a more general mechanism
forembeddingeffectsinpurecomputations.You’veseenpreviouslythat
we could model programming-language types and functions in the cat-
egory of sets (disregarding bottoms, as usual). Here we have extended
this model to a slightly different category, a category where morphisms
are represented by embellished functions, and their composition does
more than just pass the output of one function to the input of another.
We have one more degree of freedom to play with: the composition it-
self. It turns out that this is exactly the degree of freedom which makes
it possible to give simple denotational semantics to programs that in
imperative languages are traditionally implemented using side effects.
494.4 Challenge
A function that is not defined for all possible values of its argument is
called a partial function. It’s not really a function in the mathematical
sense, so it doesn’t fit the standard categorical mold. It can, however, be
represented by a function that returns an embellished type optional:
template<class A> class optional {
bool _isValid;
A _value;
public:
optional() : _isValid(false) {}
optional(A v) : _isValid(true), _value(v) {}
bool isValid() const { return _isValid; }
A value() const { return _value; }
};
As an example, here’s the implementation of the embellished function
safe_root:
optional<double> safe_root(double x) {
if (x >= 0) return optional<double>{sqrt(x)};
else return optional<double>{};
}
Here’s the challenge:
1. Construct the Kleisli category for partial functions (define com-
position and identity).
2. Implementtheembellishedfunctionsafe_reciprocal thatreturns
a valid reciprocal of its argument, if it’s different from zero.
503. Compose safe_root and safe_reciprocal to implement
safe_root_reciprocal that calculates sqrt(1/x) whenever possi-
ble.
515
Products and Coproducts
The Ancient Greek playwright Euripides once said: “Every man is
like the company he is wont to keep.” We are defined by our re-
lationships. Nowhere is this more true than in category theory. If we
want to single out a particular object in a category, we can only do this
by describing its pattern of relationships with other objects (and itself).
These relationships are defined by morphisms.
There is a common construction in category theory called the uni-
versal construction for defining objects in terms of their relationships.
Onewayofdoingthisistopickapattern,aparticularshapeconstructed
fromobjectsandmorphisms,andlookforallitsoccurrencesinthecate-
gory.Ifit’sacommonenoughpattern,andthecategoryislarge,chances
are you’ll have lots and lots of hits. The trick is to establish some kind of
ranking among those hits, and pick what could be considered the best
fit.
52This process is reminiscent of the way we do web searches. A query
is like a pattern. A very general query will give you large recall: lots of
hits. Some may be relevant, others not. To eliminate irrelevant hits, you
refine your query. That increases its precision. Finally, the search engine
will rank the hits and, hopefully, the one result that you’re interested in
will be at the top of the list.
## 5.1 Initial Object
The simplest shape is a single object. Obviously, there are as many in-
stances of this shape as there are objects in a given category. That’s
a lot to choose from. We need to establish some kind of ranking and
try to find the object that tops this hierarchy. The only means at our
disposal are morphisms. If you think of morphisms as arrows, then it’s
possible that there is an overall net flow of arrows from one end of the
category to another. This is true in ordered categories, for instance in
partial orders. We could generalize that notion of object precedence by
saying that object 𝑎 is “more initial” than object 𝑏, if there is an arrow
(a morphism) going from 𝑎 to 𝑏. We would then define the initial object
as one that has arrows going to all other objects. Obviously there is no
guarantee that such an object exists, and that’s okay. A bigger problem
is that there may be too many such objects: The recall is good, but pre-
cision is lacking. The solution is to take a hint from ordered categories
— they allow at most one arrow between any two objects: there is only
one way of being less-than or equal-to another object. Which leads us
to this definition of the initial object:
The initial object is the object that has one and only one
morphism going to any object in the category.
53However, even that doesn’t guarantee the uniqueness of the initial ob-
ject (if one exists). But it guarantees the next best thing: uniqueness up
toisomorphism.Isomorphismsareveryimportantincategorytheory,so
I’ll talk about them shortly. For now, let’s just agree that uniqueness up
to isomorphism justifies the use of “the” in the definition of the initial
object.
Here are some examples: The initial object in a partially ordered
set (often called a poset) is its least element. Some posets don’t have an
initial object — like the set of all integers, positive and negative, with
less-than-or-equal relation for morphisms.
In the category of sets and functions, the initial object is the empty
set.Remember,anemptysetcorrespondstotheHaskelltypeVoid (there
is no corresponding type in C++) and the unique polymorphic function
from Void to any other type is called absurd:
absurd :: Void -> a
It’s this family of morphisms that makes Void the initial object in the
category of types.
545.2 Terminal Object
Let’s continue with the single-object pattern, but let’s change the way
we rank the objects. We’ll say that object 𝑎 is “more terminal” than ob-
ject 𝑏 if there is a morphism going from 𝑏 to 𝑎 (notice the reversal of
direction). We’ll be looking for an object that’s more terminal than any
other object in the category. Again, we will insist on uniqueness:
The terminal object is the object with one and only one
morphism coming to it from any object in the category.
And again, the terminal object is unique, up to isomorphism, which I
will show shortly. But first let’s look at some examples. In a poset, the
terminal object, if it exists, is the biggest object. In the category of sets,
the terminal object is a singleton. We’ve already talked about single-
tons — they correspond to the void type in C++ and the unit type () in
Haskell. It’s a type that has only one value — implicit in C++ and ex-
plicit in Haskell, denoted by (). We’ve also established that there is one
and only one pure function from any type to the unit type:
unit :: a -> ()
unit _ = ()
55so all the conditions for the terminal object are satisfied.
Notice that in this example the uniqueness condition is crucial, be-
cause there are other sets (actually, all of them, except for the empty
set) that have incoming morphisms from every set. For instance, there
is a Boolean-valued function (a predicate) defined for every type:
yes :: a -> Bool
yes _ = True
But Bool is not a terminal object. There is at least one more Bool-valued
function from every type:
no :: a -> Bool
no _ = False
Insistingonuniquenessgivesusjusttherightprecisiontonarrowdown
the definition of the terminal object to just one type.
## 5.3 Duality
You can’t help but to notice the symmetry between the way we defined
the initial object and the terminal object. The only difference between
the two was the direction of morphisms. It turns out that for any cate-
gory C we can define the opposite category 𝐂𝑜𝑝 just by reversing all the
arrows. The opposite category automatically satisfies all the require-
ments of a category, as long as we simultaneously redefine composi-
tion. If original morphisms 𝑓 ∷ 𝑎 → 𝑏 and 𝑔 ∷ 𝑏 → 𝑐 composed to
ℎ ∷ 𝑎 → 𝑐 with ℎ = 𝑔 ∘ 𝑓, then the reversed morphisms 𝑓𝑜𝑝 ∷ 𝑏 → 𝑎
and 𝑔𝑜𝑝 ∷ 𝑐 → 𝑏 will compose to ℎ𝑜𝑝 ∷ 𝑐 → 𝑎 with ℎ𝑜𝑝 = 𝑓𝑜𝑝 ∘ 𝑔𝑜𝑝.
And reversing the identity arrows is a (pun alert!) no-op.
56Dualityisaveryimportantpropertyofcategoriesbecauseitdoubles
the productivity of every mathematician working in category theory.
For every construction you come up with, there is its opposite; and for
every theorem you prove, you get one for free. The constructions in the
opposite category are often prefixed with “co”, so you have products
and coproducts, monads and comonads, cones and cocones, limits and
colimits,andsoon.Therearenococomonadsthough,becausereversing
the arrows twice gets us back to the original state.
It follows then that a terminal object is the initial object in the op-
posite category.
## 5.4 Isomorphisms
As programmers, we are well aware that defining equality is a nontriv-
ial task. What does it mean for two objects to be equal? Do they have to
occupy the same location in memory (pointer equality)? Or is it enough
that the values of all their components are equal? Are two complex
numbers equal if one is expressed as the real and imaginary part, and
theotherasmodulusandangle?You’dthinkthatmathematicianswould
have figured out the meaning of equality, but they haven’t. They have
the same problem of multiple competing definitions for equality. There
is the propositional equality, intensional equality, extensional equality,
and equality as a path in homotopy type theory. And then there are the
weaker notions of isomorphism, and even weaker of equivalence.
The intuition is that isomorphic objects look the same — they have
the same shape. It means that every part of one object corresponds to
some part of another object in a one-to-one mapping. As far as our in-
struments can tell, the two objects are a perfect copy of each other.
Mathematically it means that there is a mapping from object 𝑎 to ob-
57ject 𝑏, and there is a mapping from object 𝑏 back to object 𝑎, and they
are the inverse of each other. In category theory we replace mappings
with morphisms. An isomorphism is an invertible morphism; or a pair
of morphisms, one being the inverse of the other.
We understand the inverse in terms of composition and identity:
Morphism 𝑔 is the inverse of morphism 𝑓 if their composition is the
identity morphism. These are actually two equations because there are
two ways of composing two morphisms:
f . g = id
g . f = id
When I said that the initial (terminal) object was unique up to isomor-
phism, I meant that any two initial (terminal) objects are isomorphic.
That’s actually easy to see. Let’s suppose that we have two initial ob-
jects 𝑖1 and 𝑖2. Since 𝑖1 is initial, there is a unique morphism 𝑓 from 𝑖1
to 𝑖2. By the same token, since 𝑖2 is initial, there is a unique morphism
𝑔 from 𝑖2 to 𝑖1. What’s the composition of these two morphisms?
All morphisms in this diagram are unique.
The composition 𝑔 ∘𝑓 must be a morphism from 𝑖1 to 𝑖1. But 𝑖1 is initial
so there can only be one morphism going from 𝑖1 to 𝑖1. Since we are in
a category, we know that there is an identity morphism from 𝑖1 to 𝑖1,
and since there is room for only one, that must be it. Therefore 𝑔 ∘ 𝑓 is
58equal to identity. Similarly, 𝑓 ∘𝑔 must be equal to identity, because there
can be only one morphism from 𝑖2 back to 𝑖2. This proves that 𝑓 and 𝑔
must be the inverse of each other. Therefore any two initial objects are
isomorphic.
Notice that in this proof we used the uniqueness of the morphism
from the initial object to itself. Without that we couldn’t prove the “up
to isomorphism” part. But why do we need the uniqueness of 𝑓 and
𝑔? Because not only is the initial object unique up to isomorphism, it
is unique up to unique isomorphism. In principle, there could be more
thanoneisomorphismbetweentwoobjects,butthat’snotthecasehere.
This “uniqueness up to unique isomorphism” is the important property
of all universal constructions.
## 5.5 Products
The next universal construction is that of a product. We know what a
Cartesianproductoftwosetsis:it’sasetofpairs.Butwhat’sthepattern
that connects the product set with its constituent sets? If we can figure
that out, we’ll be able to generalize it to other categories.
All we can say is that there are two functions, the projections, from
the product to each of the constituents. In Haskell, these two functions
are called fst and snd and they pick, respectively, the first and the sec-
ond component of a pair:
fst :: (a, b) -> a
fst (x, y) = x
snd :: (a, b) -> b
snd (x, y) = y
59Here, the functions are defined by pattern matching their arguments:
the pattern that matches any pair is (x, y), and it extracts its compo-
nents into variables x and y.
Thesedefinitionscanbesimplifiedevenfurtherwiththeuseofwild-
cards:
fst (x, _) = x
snd (_, y) = y
In C++, we would use template functions, for instance:
template<class A, class B> A
fst(pair<A, B> const & p) {
return p.first;
}
Equippedwiththisseeminglyverylimitedknowledge,let’strytodefine
a pattern of objects and morphisms in the category of sets that will lead
us to the construction of a product of two sets, 𝑎 and 𝑏. This pattern
consists of an object 𝑐 and two morphisms 𝑝 and 𝑞 connecting it to 𝑎
and 𝑏, respectively:
p :: c -> a
q :: c -> b
60All 𝑐s that fit this pattern will be considered candidates for the product.
There may be lots of them.
For instance, let’s pick, as our constituents, two Haskell types, Int and
Bool, and get a sampling of candidates for their product.
Here’s one: Int. Can Int be considered a candidate for the product
of Int and Bool? Yes, it can — and here are its projections:
p :: Int -> Int
p x = x
q :: Int -> Bool
q _ = True
That’s pretty lame, but it matches the criteria.
Here’sanother one: (Int, Int, Bool).It’s a tuple of three elements,
or a triple. Here are two morphisms that make it a legitimate candidate
(we are using pattern matching on triples):
p :: (Int, Int, Bool) -> Int
p (x, _, _) = x
q :: (Int, Int, Bool) -> Bool
q (_, _, b) = b
You may have noticed that while our first candidate was too small — it
only covered the Int dimension of the product; the second was too big
— it spuriously duplicated the Int dimension.
61But we haven’t explored yet the other part of the universal con-
struction: the ranking. We want to be able to compare two instances
of our pattern. We want to compare one candidate object 𝑐 and its two
projections p and q with another candidate object 𝑐′ and its two projec-
tions p’ and q’. We would like to say that 𝑐 is “better” than 𝑐′ if there
is a morphism 𝑚 from 𝑐′ to 𝑐 — but that’s too weak. We also want its
projections to be “better,” or “more universal,” than the projections of
𝑐′. What it means is that the projections p’ and q’ can be reconstructed
from p and q using 𝑚:
p' = p . m
q' = q . m
Another way of looking at these equations is that 𝑚 factorizes p’ and q’.
Just pretend that these equations are in natural numbers, and the dot is
multiplication: 𝑚 is a common factor shared by p’ and q’.
Justtobuildsomeintuitions,letmeshowyouthatthepair(Int, Bool)
withthetwocanonicalprojections,fst andsnd isindeedbetter thanthe
two candidates I presented before.
62The mapping m for the first candidate is:
m :: Int -> (Int, Bool)
m x = (x, True)
Indeed, the two projections, p and q can be reconstructed as:
p x = fst (m x) = x
q x = snd (m x) = True
The m for the second example is similarly uniquely determined:
m (x, _, b) = (x, b)
We were able to show that (Int, Bool) is better than either of the two
candidates. Let’s see why the opposite is not true. Could we find some
m' that would help us reconstruct fst and snd from p and q?
fst = p . m'
snd = q . m'
In our first example, q always returned True and we know that there are
pairs whose second component is False. We can’t reconstruct snd from
q.
63Thesecond exampleis different:weretainenoughinformation after
running either p or q, but there is more than one way to factorize fst
andsnd.Becausebothp andq ignorethesecondcomponentofthetriple,
our m' can put anything in it. We can have:
m' (x, b) = (x, x, b)
or
m' (x, b) = (x, 42, b)
and so on.
Puttingitalltogether,givenanytypec withtwoprojectionsp andq,
thereisauniquem fromc totheCartesianproduct(a, b) thatfactorizes
them. In fact, it just combines p and q into a pair.
m :: c -> (a, b)
m x = (p x, q x)
That makes the Cartesian product (a, b) our best match, which means
that this universal construction works in the category of sets. It picks
the product of any two sets.
Now let’s forget about sets and define a product of two objects in
any category using the same universal construction. Such a product
doesn’t always exist, but when it does, it is unique up to a unique iso-
morphism.
A product of two objects 𝑎 and 𝑏 is the object 𝑐 equipped
withtwoprojectionssuchthatforanyotherobject𝑐′ equipped
with two projections there is a unique morphism 𝑚 from 𝑐′
to 𝑐 that factorizes those projections.
64A (higher order) function that produces the factorizing function m from
two candidates is sometimes called the factorizer. In our case, it would
be the function:
factorizer :: (c -> a) -> (c -> b) -> (c -> (a, b))
factorizer p q = \x -> (p x, q x)
## 5.6 Coproduct
Like every construction in category theory, the product has a dual,
which is called the coproduct. When we reverse the arrows in the prod-
uct pattern, we end up with an object 𝑐 equipped with two injections, i
and j: morphisms from 𝑎 and 𝑏 to 𝑐.
i :: a -> c
j :: b -> c
The ranking is also inverted: object 𝑐 is “better” than object 𝑐′ that is
equipped with the injections 𝑖′ and 𝑗′ if there is a morphism 𝑚 from 𝑐
to 𝑐′ that factorizes the injections:
i' = m . i
j' = m . j
65The “best” such object, one with a unique morphism connecting it to
any other pattern, is called a coproduct and, if it exists, is unique up to
unique isomorphism.
Acoproductoftwoobjects𝑎 and𝑏 istheobject𝑐 equipped
withtwoinjectionssuchthatforanyotherobject𝑐′ equipped
with two injections there is a unique morphism 𝑚 from 𝑐
to 𝑐′ that factorizes those injections.
In the category of sets, the coproduct is the disjoint union of two sets.
An element of the disjoint union of 𝑎 and 𝑏 is either an element of 𝑎 or
an element of 𝑏. If the two sets overlap, the disjoint union contains two
copies of the common part. You can think of an element of a disjoint
union as being tagged with an identifier that specifies its origin.
For a programmer, it’s easier to understand a coproduct in terms of
types: it’s a tagged union of two types. C++ supports unions, but they
are not tagged. It means that in your program you have to somehow
keeptrackwhichmemberoftheunionisvalid.Tocreateataggedunion,
you have to define a tag — an enumeration — and combine it with the
union. For instance, a tagged union of an int and a
char const * could be implemented as:
struct Contact {
enum { isPhone, isEmail } tag;
66union { int phoneNum; char const * emailAddr; };
};
Thetwoinjectionscaneitherbeimplementedasconstructorsorasfunc-
tions. For instance, here’s the first injection as a function PhoneNum:
Contact PhoneNum(int n) {
Contact c;
c.tag = isPhone;
c.phoneNum = n;
return c;
}
It injects an integer into Contact.
A tagged union is also called a variant, and there is a very general
implementation of a variant in the boost library, boost::variant.
In Haskell, you can combine any data types into a tagged union by
separating data constructors with a vertical bar. The Contact example
translates into the declaration:
data Contact = PhoneNum Int | EmailAddr String
Here, PhoneNum and EmailAddr serve both as constructors (injections),
and as tags for pattern matching (more about this later). For instance,
this is how you would construct a contact using a phone number:
helpdesk :: Contact
helpdesk = PhoneNum 2222222
Unlike the canonical implementation of the product that is built into
Haskell as the primitive pair, the canonical implementation of the co-
product is a data type called Either, which is defined in the standard
Prelude as:
67data Either a b = Left a | Right b
It is parameterized by two types, a and b and has two constructors: Left
that takes a value of type a, and Right that takes a value of type b.
Just as we’ve defined the factorizer for a product, we can define one
forthecoproduct.Givenacandidatetypec andtwocandidateinjections
i and j, the factorizer for Either produces the factoring function:
factorizer :: (a -> c) -> (b -> c) -> Either a b -> c
factorizer i j (Left a) = i a
factorizer i j (Right b) = j b
## 5.7 Asymmetry
We’ve seen two sets of dual definitions: The definition of a terminal ob-
ject can be obtained from the definition of the initial object by reversing
the direction of arrows; in a similar way, the definition of the coprod-
uct can be obtained from that of the product. Yet in the category of sets
the initial object is very different from the final object, and coproduct
is very different from product. We’ll see later that product behaves like
multiplication,withtheterminalobjectplayingtheroleofone;whereas
coproduct behaves more like the sum, with the initial object playing the
role of zero. In particular, for finite sets, the size of the product is the
product of the sizes of individual sets, and the size of the coproduct is
the sum of the sizes.
This shows that the category of sets is not symmetric with respect
to the inversion of arrows.
Notice that while the empty set has a unique morphism to any set
(the absurd function), it has no morphisms coming back. The singleton
set has a unique morphism coming to it from any set, but it also has
68outgoing morphisms to every set (except for the empty one). As we’ve
seen before, these outgoing morphisms from the terminal object play a
very important role of picking elements of other sets (the empty set has
no elements, so there’s nothing to pick).
It’s the relationship of the singleton set to the product that sets it
apart from the coproduct. Consider using the singleton set, represented
by the unit type (), as yet another — vastly inferior — candidate for the
product pattern. Equip it with two projections p and q: functions from
the singleton to each of the constituent sets. Each selects a concrete
element from either set. Because the product is universal, there is also a
(unique) morphism m from our candidate, the singleton, to the product.
This morphism selects an element from the product set — it selects a
concrete pair. It also factorizes the two projections:
p = fst . m
q = snd . m
Whenactingonthesingletonvalue(),theonlyelementofthesingleton
set, these two equations become:
p () = fst (m ())
q () = snd (m ())
Since m () is the element of the product picked by m, these equations
tell us that the element picked by p from the first set, p (), is the first
component of the pair picked by m. Similarly, q () is equal to the sec-
ond component. This is in total agreement with our understanding that
elements of the product are pairs of elements from the constituent sets.
There is no such simple interpretation of the coproduct. We could
try the singleton set as a candidate for a coproduct, in an attempt to ex-
tracttheelementsfromit,buttherewewouldhavetwoinjectionsgoing
69into it rather than two projections coming out of it. They’d tell us noth-
ing about their sources (in fact, we’ve seen that they ignore the input
parameter). Neither would the unique morphism from the coproduct to
our singleton. The category of sets just looks very different when seen
from the direction of the initial object than it does when seen from the
terminal end.
This is not an intrinsic property of sets, it’s a property of functions,
which we use as morphisms in 𝐒𝐞𝐭. Functions are, in general, asymmet-
ric. Let me explain.
A function must be defined for every element of its domain set (in
programming, we call it a total function), but it doesn’t have to cover
the whole codomain. We’ve seen some extreme cases of it: functions
from a singleton set — functions that select just a single element in
the codomain. (Actually, functions from an empty set are the real ex-
tremes.) When the size of the domain is much smaller than the size of
the codomain, we often think of such functions as embedding the do-
main in the codomain. For instance, we can think of a function from
a singleton set as embedding its single element in the codomain. I call
them embedding functions, but mathematicians prefer to give a name to
the opposite: functions that tightly fill their codomains are called sur-
jective or onto.
The other source of asymmetry is that functions are allowed to map
many elements of the domain set into one element of the codomain.
They can collapse them. The extreme case are functions that map whole
sets into a singleton. You’ve seen the polymorphic unit function that
does just that. The collapsing can only be compounded by composi-
tion. A composition of two collapsing functions is even more collaps-
ingthantheindividualfunctions.Mathematicianshaveanamefornon-
collapsing functions: they call them injective or one-to-one.
70Of course there are some functions that are neither embedding nor
collapsing. They are called bijections and they are truly symmetric, be-
cause they are invertible. In the category of sets, an isomorphism is the
same as a bijection.
## 5.8 Challenges
1. Show that the terminal object is unique up to unique isomor-
phism.
2. What is a product of two objects in a poset? Hint: Use the univer-
sal construction.
3. What is a coproduct of two objects in a poset?
4. Implement the equivalent of Haskell Either as a generic type in
your favorite language (other than Haskell).
5. Show that Either is a “better” coproduct than int equipped with
two injections:
int i(int n) { return n; }
int j(bool b) { return b ? 0: 1; }
Hint: Define a function
int m(Either const & e);
that factorizes i and j.
6. Continuing the previous problem: How would you argue that int
with the two injections i and j cannot be “better” than Either?
7. Still continuing: What about these injections?
int i(int n) {
if (n < 0) return n;
return n + 2;
71}
int j(bool b) { return b ? 0: 1; }
8. Come up with an inferior candidate for a coproduct of int and
bool that cannot be better than Either because it allows multiple
acceptable morphisms from it to Either.
## 5.9 Bibliography
1. The Catsters, Products and Coproducts1 video.
1https://www.youtube.com/watch?v=upCSDIO9pjc
726 Simple Algebraic Data Types
We’ve seen two basic ways of combining types: using a product
and a coproduct. It turns out that a lot of data structures in ev-
eryday programming can be built using just these two mechanisms.
Thisfacthasimportantpracticalconsequences.Manypropertiesofdata
structures are composable. For instance, if you know how to compare
values of basic types for equality, and you know how to generalize
these comparisons to product and coproduct types, you can automate
the derivation of equality operators for composite types. In Haskell you
can automatically derive equality, comparison, conversion to and from
string, and more, for a large subset of composite types.
Let’s have a closer look at product and sum types as they appear in
programming.
736.1 Product Types
The canonical implementation of a product of two types in a program-
ming language is a pair. In Haskell, a pair is a primitive type construc-
tor; in C++ it’s a relatively complex template defined in the Standard
Library.
Pairs are not strictly commutative: a pair (Int, Bool) cannot be sub-
stituted for a pair (Bool, Int), even though they carry the same infor-
mation. They are, however, commutative up to isomorphism — the iso-
morphism being given by the swap function (which is its own inverse):
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)
You can think of the two pairs as simply using a different format for
storing the same data. It’s just like big endian vs. little endian.
You can combine an arbitrary number of types into a product by
nesting pairs inside pairs, but there is an easier way: nested pairs are
equivalent to tuples. It’s the consequence of the fact that different ways
of nesting pairs are isomorphic. If you want to combine three types in
a product, a, b, and c, in this order, you can do it in two ways:
((a, b), c)
or
74(a, (b, c))
These types are different — you can’t pass one to a function that expects
the other — but their elements are in one-to-one correspondence. There
is a function that maps one to another:
alpha :: ((a, b), c) -> (a, (b, c))
alpha ((x, y), z) = (x, (y, z))
and this function is invertible:
alpha_inv :: (a, (b, c)) -> ((a, b), c)
alpha_inv (x, (y, z)) = ((x, y), z)
so it’s an isomorphism. These are just different ways of repackaging the
same data.
You can interpret the creation of a product type as a binary opera-
tion on types. From that perspective, the above isomorphism looks very
much like the associativity law we’ve seen in monoids:
(𝑎 ∗ 𝑏) ∗ 𝑐 = 𝑎 ∗ (𝑏 ∗ 𝑐)
Except that, in the monoid case, the two ways of composing products
were equal, whereas here they are only equal “up to isomorphism.”
If we can live with isomorphisms, and don’t insist on strict equality,
we can go even further and show that the unit type, (), is the unit of the
product the same way 1 is the unit of multiplication. Indeed, the pairing
of a value of some type a with a unit doesn’t add any information. The
type:
(a, ())
is isomorphic to a. Here’s the isomorphism:
75rho :: (a, ()) -> a
rho (x, ()) = x
rho_inv :: a -> (a, ())
rho_inv x = (x, ())
These observations can be formalized by saying that 𝐒𝐞𝐭 (the category
ofsets)isamonoidalcategory.It’sacategorythat’salsoamonoid,inthe
sense that you can multiply objects (here, take their Cartesian product).
I’ll talk more about monoidal categories, and give the full definition in
the future.
There is a more general way of defining product types in Haskell —
especially, as we’ll see soon, when they are combined with sum types. It
uses named constructors with multiple arguments. A pair, for instance,
can be defined alternatively as:
data Pair a b = P a b
Here, Pair a b is the name of the type parameterized by two other
types, a and b; and P is the name of the data constructor. You define
a pair type by passing two types to the Pair type constructor. You con-
struct a pair value by passing two values of appropriate types to the
constructor P. For instance, let’s define a value stmt as a pair of String
and Bool:
stmt :: Pair String Bool
stmt = P "This statements is" False
The first line is the type declaration. It uses the type constructor Pair,
with String and Bool replacing a and the b in the generic definition
of Pair. The second line defines the actual value by passing a concrete
76string and a concrete Boolean to the data constructor P. Type construc-
tors are used to construct types; data constructors, to construct values.
Since the name spaces for type and data constructors are separate
in Haskell, you will often see the same name used for both, as in:
data Pair a b = Pair a b
And if you squint hard enough, you may even view the built-in pair
type as a variation on this kind of declaration, where the name Pair is
replaced with the binary operator (,). In fact you can use (,) just like
any other named constructor and create pairs using prefix notation:
stmt = (,) "This statement is" False
Similarly, you can use (,,) to create triples, and so on.
Instead of using generic pairs or tuples, you can also define specific
named product types, as in:
data Stmt = Stmt String Bool
which is just a product of String and Bool, but it’s given its own name
and constructor. The advantage of this style of declaration is that you
may define many types that have the same content but different mean-
ing and functionality, and which cannot be substituted for each other.
Programming with tuples and multi-argument constructors can get
messy and error prone — keeping track of which component represents
what. It’s often preferable to give names to components. A product type
with named fields is called a record in Haskell, and a struct in C.
776.2 Records
Let’s have a look at a simple example. We want to describe chemi-
cal elements by combining two strings, name and symbol; and an in-
teger, the atomic number; into one data structure. We can use a tu-
ple (String, String, Int) and remember which component represents
what. We would extract components by pattern matching, as in this
function that checks if the symbol of the element is the prefix of its
name (as in He being the prefix of Helium):
startsWithSymbol :: (String, String, Int) -> Bool
startsWithSymbol (name, symbol, _) = isPrefixOf symbol name
This code is error prone, and is hard to read and maintain. It’s much
better to define a record:
data Element = Element { name :: String
, symbol :: String
, atomicNumber :: Int }
Thetworepresentationsareisomorphic,aswitnessedbythesetwocon-
version functions, which are the inverse of each other:
tupleToElem :: (String, String, Int) -> Element
tupleToElem (n, s, a) = Element { name = n
, symbol = s
, atomicNumber = a }
elemToTuple :: Element -> (String, String, Int)
elemToTuple e = (name e, symbol e, atomicNumber e)
Notice that the names of record fields also serve as functions to access
thesefields.Forinstance,atomicNumber e retrievestheatomicNumber field
from e. We use atomicNumber as a function of the type:
78atomicNumber :: Element -> Int
With the record syntax for Element, our function startsWithSymbol be-
comes more readable:
startsWithSymbol :: Element -> Bool
startsWithSymbol e = isPrefixOf (symbol e) (name e)
We could even use the Haskell trick of turning the function isPrefixOf
into an infix operator by surrounding it with backquotes, and make it
read almost like a sentence:
startsWithSymbol e = symbol e `isPrefixOf` name e
The parentheses could be omitted in this case, because an infix operator
has lower precedence than a function call.
## 6.3 Sum Types
Just as the product in the category of sets gives rise to product types,
the coproduct gives rise to sum types. The canonical implementation of
a sum type in Haskell is:
data Either a b = Left a | Right b
And like pairs, Eithers are commutative (up to isomorphism), can be
nested, and the nesting order is irrelevant (up to isomorphism). So we
can, for instance, define a sum equivalent of a triple:
data OneOfThree a b c = Sinistral a | Medial b | Dextral c
79and so on.
Itturnsoutthat𝐒𝐞𝐭isalsoa(symmetric)monoidalcategorywithre-
spect to coproduct. The roleof thebinary operation is playedby the dis-
joint sum, and the role of the unit element is played by the initial object.
In terms of types, we have Either as the monoidal operator and Void,
the uninhabited type, as its neutral element. You can think of Either as
plus, and Void as zero.Indeed, adding Void toa sumtype doesn’t change
its content. For instance:
Either a Void
is isomorphic to a. That’s because there is no way to construct a Right
version of this type — there isn’t a value of type Void. The only inhabi-
tants of Either a Void are constructed using the Left constructors and
they simply encapsulate a value of type a. So, symbolically, 𝑎 + 0 = 𝑎.
SumtypesareprettycommoninHaskell,buttheirC++equivalents,
unionsorvariants,aremuchlesscommon.Thereareseveralreasonsfor
that.
First of all, the simplest sum types are just enumerations and are
implementedusingenum inC++.TheequivalentoftheHaskellsumtype:
data Color = Red | Green | Blue
is the C++:
enum { Red, Green, Blue };
An even simpler sum type:
data Bool = True | False
80is the primitive bool in C++.
Simplesum typesthatencodethepresenceor absence ofa value are
variouslyimplementedinC++usingspecialtricksand“impossible”val-
ues, like empty strings, negative numbers, null pointers, etc. This kind
of optionality, if deliberate, is expressed in Haskell using the Maybe type:
data Maybe a = Nothing | Just a
The Maybe type is a sum of two types. You can see this if you separate
the two constructors into individual types. The first one would look like
this:
data NothingType = Nothing
It’s an enumeration with one value called Nothing. In other words, it’s
a singleton, which is equivalent to the unit type (). The second part:
data JustType a = Just a
is just an encapsulation of the type a. We could have encoded Maybe as:
data Maybe a = Either () a
MorecomplexsumtypesareoftenfakedinC++usingpointers.Apointer
can be either null, or point to a value of specific type. For instance, a
Haskell list type, which can be defined as a (recursive) sum type:
data List a = Nil | Cons a (List a)
can be translated to C++ using the null pointer trick to implement the
empty list:
81template<class A>
class List {
Node<A> * _head;
public:
List() : _head(nullptr) {} // Nil
List(A a, List<A> l) // Cons
: _head(new Node<A>(a, l))
{}
};
NoticethatthetwoHaskellconstructorsNil andCons aretranslatedinto
two overloaded List constructors with analogous arguments (none, for
Nil; and a value and a list for Cons). The List class doesn’t need a tag
to distinguish between the two components of the sum type. Instead it
uses the special nullptr value for _head to encode Nil.
The main difference, though, between Haskell and C++ types is that
Haskell data structures are immutable. If you create an object using one
particular constructor, the object will forever remember which con-
structor was used and what arguments were passed to it. So a Maybe
object that was created as Just "energy" will never turn into Nothing.
Similarly, an empty list will forever be empty, and a list of three ele-
ments will always have the same three elements.
It’s this immutability that makes construction reversible. Given an
object, you can always disassemble it down to parts that were used in
its construction. This deconstruction is done with pattern matching and
it reuses constructors as patterns. Constructor arguments, if any, are
replaced with variables (or other patterns).
The List data type has two constructors, so the deconstruction of
anarbitraryList usestwopatternscorrespondingtothoseconstructors.
One matches the empty Nil list, and the other a Cons-constructed list.
For instance, here’s the definition of a simple function on Lists:
82maybeTail :: List a -> Maybe (List a)
maybeTail Nil = Nothing
maybeTail (Cons _ t) = Just t
The first part of the definition of maybeTail uses the Nil constructor as
pattern and returns Nothing. The second part uses the Cons constructor
aspattern.Itreplacesthefirstconstructorargumentwithawildcard,be-
cause we are not interested in it. The second argument to Cons is bound
to the variable t (I will call these things variables even though, strictly
speaking,theynevervary:onceboundtoanexpression,avariablenever
changes). The return value is Just t. Now, depending on how your List
wascreated,itwillmatchoneoftheclauses.IfitwascreatedusingCons,
the two arguments that were passed to it will be retrieved (and the first
discarded).
EvenmoreelaboratesumtypesareimplementedinC++usingpoly-
morphic class hierarchies. A family of classes with a common ancestor
may be understood as one variant type, in which the vtable serves as a
hidden tag. What in Haskell would be done by pattern matching on the
constructor, and by calling specialized code, in C++ is accomplished by
dispatching a call to a virtual function based on the vtable pointer.
You will rarely see union used as a sum type in C++ because of
severe limitations on what can go into a union. You can’t even put a
std::string into a union because it has a copy constructor.
## 6.4 Algebra of Types
Taken separately, product and sum types can be used to define a variety
of useful data structures, but the real strength comes from combining
the two. Once again we are invoking the power of composition.
83Let’ssummarizewhatwe’vediscoveredsofar.We’veseentwocom-
mutative monoidal structures underlying the type system: We have the
sum types with Void as the neutral element, and the product types with
the unit type, (), as the neutral element. We’d like to think of them as
analogous to addition and multiplication. In this analogy, Void would
correspond to zero, and unit, (), to one.
Let’s see how far we can stretch this analogy. For instance, does
multiplication by zero give zero? In other words, is a product type with
one component being Void isomorphic to Void? For example, is it pos-
sible to create a pair of, say Int and Void?
To create a pair you need two values. Although you can easily come
upwithaninteger,thereisnovalueoftypeVoid.Therefore,foranytype
a, the type (a, Void) is uninhabited — has no values — and is therefore
equivalent to Void. In other words, 𝑎 × 0 = 0.
Another thing that links addition and multiplication is the distribu-
tive property:
𝑎 × (𝑏 + 𝑐) = 𝑎 × 𝑏 + 𝑎 × 𝑐
Does it also hold for product and sum types? Yes, it does — up to iso-
morphisms, as usual. The left hand side corresponds to the type:
(a, Either b c)
and the right hand side corresponds to the type:
Either (a, b) (a, c)
Here’s the function that converts them one way:
prodToSum :: (a, Either b c) -> Either (a, b) (a, c)
prodToSum (x, e) =
case e of
84Left y -> Left (x, y)
Right z -> Right (x, z)
and here’s one that goes the other way:
sumToProd :: Either (a, b) (a, c) -> (a, Either b c)
sumToProd e =
case e of
Left (x, y) -> (x, Left y)
Right (x, z) -> (x, Right z)
The case of statement is used for pattern matching inside functions.
Each pattern is followed by an arrowand the expression to be evaluated
when the pattern matches. For instance, if you call prodToSum with the
value:
prod1 :: (Int, Either String Float)
prod1 = (2, Left "Hi!")
the e in case e of will be equal to Left "Hi!". It will match the pattern
Left y, substituting "Hi!" for y. Since the x has already been matched
to 2, the result of the case of clause, and the whole function, will be
Left (2, "Hi!"), as expected.
I’m not going to prove that these two functions are the inverse of
eachother,butif youthink aboutit,theymustbe!Theyarejusttrivially
re-packing the contents of the two data structures. It’s the same data,
only different format.
Mathematicianshaveanamefortwosuchintertwinedmonoids:it’s
called a semiring. It’s not a full ring, because we can’t define subtraction
of types. That’s why a semiring is sometimes called a rig, which is a
pun on “ring without an n” (negative). But barring that, we can get a
85lot of mileage from translating statements about, say, natural numbers,
which form a rig, to statements about types. Here’s a translation table
with some entries of interest:
Numbers Types
## 0 Void
1 ()
𝑎 + 𝑏 Either a b = Left a | Right b
𝑎 × 𝑏 (a, b) or Pair a b = Pair a b
2 = 1 + 1 data Bool = True | False
1 + 𝑎 data Maybe = Nothing | Just a
The list type is quite interesting, because it’s defined as a solution to an
equation. The type we are defining appears on both sides of the equa-
tion:
data List a = Nil | Cons a (List a)
If we do our usual substitutions, and also replace List a with x, we get
the equation:
x = 1 + a * x
We can’t solve it using traditional algebraic methods because we can’t
subtract or divide types. But we can try a series of substitutions, where
we keep replacing x on the right hand side with (1 + a*x), and use the
distributive property. This leads to the following series:
x = 1 + a*x
x = 1 + a*(1 + a*x) = 1 + a + a*a*x
x = 1 + a + a*a*(1 + a*x) = 1 + a + a*a + a*a*a*x
86...
x = 1 + a + a*a + a*a*a + a*a*a*a...
We end up with an infinite sum of products (tuples), which can be in-
terpreted as: A list is either empty, 1; or a singleton, a; or a pair, a*a; or
a triple, a*a*a; etc… Well, that’s exactly what a list is — a string of as!
There’s much more to lists than that, and we’ll come back to them
and other recursive data structures after we learn about functors and
fixed points.
Solvingequationswithsymbolicvariables—that’salgebra!It’swhat
gives these types their name: algebraic data types.
Finally, I should mention one very important interpretation of the
algebraoftypes.Noticethataproductoftwotypesa andb mustcontain
both a value of type a and a value of type b, which means both types
must be inhabited. A sum of two types, on the other hand, contains
either a value of type a or a value of type b, so it’s enough if one of
them is inhabited. Logical and and or also form a semiring, and it too
can be mapped into type theory:
Logic Types
false Void
true ()
𝑎 || 𝑏 Either a b = Left a | Right b
𝑎 && 𝑏 (a, b)
This analogy goes deeper, and is the basis of the Curry-Howard isomor-
phism between logic and type theory. We’ll come back to it when we
talk about function types.
876.5 Challenges
1. Show the isomorphism between Maybe a and Either () a.
2. Here’s a sum type defined in Haskell:
data Shape = Circle Float
| Rect Float Float
When we want to define a function like area that acts on a Shape,
we do it by pattern matching on the two constructors:
area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rect d h) = d * h
Implement Shape in C++ or Java as an interface and create two
classes: Circle and Rect. Implement area as a virtual function.
3. Continuing with the previous example: We can easily add a new
functioncirc thatcalculatesthecircumferenceofaShape.Wecan
do it without touching the definition of Shape:
circ :: Shape -> Float
circ (Circle r) = 2.0 * pi * r
circ (Rect d h) = 2.0 * (d + h)
Add circ to your C++ or Java implementation. What parts of the
original code did you have to touch?
4. Continuing further: Add a new shape, Square, to Shape and make
all the necessary updates. What code did you have to touch in
Haskell vs. C++ or Java? (Even if you’re not a Haskell program-
mer, the modifications should be pretty obvious.)
5. Show that 𝑎 + 𝑎 = 2 × 𝑎 holds for types (up to isomorphism). Re-
member that 2 corresponds to Bool, according to our translation
table.
887
Functors
At the risk of sounding like a broken record, I will say this about
functors: A functor is a very simple but powerful idea. Category
theory is just full of those simple but powerful ideas. A functor is a
mapping between categories. Given two categories, 𝐂 and 𝐃, a functor
𝐹 maps objects in 𝐂 to objects in 𝐃 — it’s a function on objects. If 𝑎 is
an object in 𝐂, we’ll write its image in 𝐃 as 𝐹𝑎 (no parentheses). But a
category is not just objects — it’s objects and morphisms that connect
them. A functor also maps morphisms — it’s a function on morphisms.
But it doesn’t map morphisms willy-nilly — it preserves connections.
So if a morphism 𝑓 in 𝐂 connects object 𝑎 to object 𝑏,
𝑓 ∷ 𝑎 → 𝑏
the image of 𝑓 in 𝐃, 𝐹𝑓, will connect the image of 𝑎 to the image of 𝑏:
𝐹𝑓 ∷ 𝐹𝑎 → 𝐹𝑏
89(This is a mixture of mathematical and
Haskell notation that hopefully makes sense by
now. I won’t use parentheses when applying
functors to objects or morphisms.)
As you can see, a functor preserves the
structureofacategory:what’sconnectedinone
category will be connected in the other cate-
gory. But there’s something more to the structure of a category: there’s
also the composition of morphisms. If ℎ is a composition of 𝑓 and 𝑔:
ℎ = 𝑔.𝑓
we want its image under 𝐹 to be a composition of the images of 𝑓 and
𝑔:
𝐹ℎ = 𝐹𝑔 . 𝐹𝑓
Finally, we want all identity morphisms in 𝐂 to be mapped to identity
morphisms in 𝐃:
𝐹id𝑎 = id𝐹𝑎
90Here, id𝑎 is the identity at the object 𝑎, and id𝐹𝑎
the identity at 𝐹𝑎. Note that these conditions
makefunctorsmuchmorerestrictivethanregu-
lar functions. Functors must preserve the struc-
ture of a category. If you picture a category as a
collection of objects held together by a network
of morphisms, a functor is not allowed to intro-
duce any tears into this fabric. It may smash ob-
jects together, it may glue multiple morphisms
into one, but it may never break things apart.
This no-tearing constraint is similar to the continuity condition you
might know from calculus. In this sense functors are “continuous” (al-
though there exists an even more restrictive notion of continuity for
functors). Just like functions, functors may do both collapsing and em-
bedding. The embedding aspect is more prominent when the source
category is much smaller than the target category. In the extreme, the
sourcecanbethetrivialsingletoncategory—acategorywithoneobject
and one morphism (the identity). A functor from the singleton category
to any other category simply selects an object in that category. This is
fullyanalogoustothepropertyofmorphismsfromsingletonsetsselect-
ing elements in target sets. The maximally collapsing functor is called
the constant functor Δ𝑐. It maps every object in the source category to
one selected object 𝑐 in the target category. It also maps every mor-
phism in the source category to the identity morphism id𝑐. It acts like a
black hole, compacting everything into one singularity. We’ll see more
of this functor when we discuss limits and colimits.
917.1 Functors in Programming
Let’s get down to earth and talk about programming. We have our cat-
egory of types and functions. We can talk about functors that map this
category into itself — such functors are called endofunctors. So what’s
an endofunctor in the category of types? First of all, it maps types to
types. We’ve seen examples of such mappings, maybe without realizing
that they were just that. I’m talking about definitions of types that were
parameterized by other types. Let’s see a few examples.
## 7.1.1 The Maybe Functor
The definition of Maybe is a mapping from type a to type Maybe a:
data Maybe a = Nothing | Just a
Here’s an important subtlety: Maybe itself is not a type, it’s a type con-
structor. You have to give it a type argument, like Int or Bool, in order
to turn it into a type. Maybe without any argument represents a function
on types. But can we turn Maybe into a functor? (From now on, when I
speak of functors in the context of programming, I will almost always
mean endofunctors.) A functor is not only a mapping of objects (here,
types) but also a mapping of morphisms (here, functions). For any func-
tion from a to b:
f :: a -> b
we would like to produce a function from Maybe a to Maybe b. To define
such a function, we’ll have two cases to consider, corresponding to the
two constructors of Maybe. The Nothing case is simple: we’ll just return
Nothing back. And if the argument is Just, we’ll apply the function f to
its contents. So the image of f under Maybe is the function:
92f' :: Maybe a -> Maybe b
f' Nothing = Nothing
f' (Just x) = Just (f x)
(By the way, in Haskell you can use apostrophes in variables names,
which is very handy in cases like these.) In Haskell, we implement the
morphism-mapping part of a functor as a higher order function called
fmap. In the case of Maybe, it has the following signature:
fmap :: (a -> b) -> (Maybe a -> Maybe b)
We often say that fmap lifts a function. The lifted function acts on Maybe
values. As usual, because of currying, this signature may be interpreted
in two ways: as a function of one argument — which itself is a function
(a -> b) — returning a function (Maybe a -> Maybe b); or as a function
of two arguments returning Maybe b:
fmap :: (a -> b) -> Maybe a -> Maybe b
Based on our previous discussion, this is how we implement fmap for
Maybe:
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)
93ToshowthatthetypeconstructorMaybe togetherwiththefunctionfmap
form a functor, we have to prove that fmap preserves identity and com-
position. These are called “the functor laws,” but they simply ensure the
preservation of the structure of the category.
## 7.1.2 Equational Reasoning
To prove the functor laws, I will use equational reasoning, which is a
common proof technique in Haskell. It takes advantage of the fact that
Haskell functions are defined as equalities: the left hand side equals the
right hand side. You can always substitute one for another, possibly re-
naming variables to avoid name conflicts. Think of this as either inlin-
ing a function, or the other way around, refactoring an expression into
a function. Let’s take the identity function as an example:
id x = x
If you see, for instance, id y in some expression, you can replace it
with y (inlining). Further, if you see id applied to an expression, say
id (y + 2), you can replace it with the expression itself (y + 2). And
this substitution works both ways: you can replace any expression e
with id e (refactoring). If a function is defined by pattern matching,
you can use each sub-definition independently. For instance, given the
above definition of fmap you can replace fmap f Nothing with Nothing,
ortheotherwayaround.Let’sseehowthisworksinpractice.Let’sstart
with the preservation of identity:
fmap id = id
There are two cases to consider: Nothing and Just. Here’s the first case
(I’m using Haskell pseudo-code to transform the left hand side to the
right hand side):
94fmap id Nothing
= { definition of fmap }
Nothing
= { definition of id }
id Nothing
Notice that in the last step I used the definition of id backwards. I re-
placed the expression Nothing with id Nothing. In practice, you carry
out such proofs by “burning the candle at both ends,” until you hit the
same expression in the middle — here it was Nothing. The second case
is also easy:
fmap id (Just x)
= { definition of fmap }
Just (id x)
= { definition of id }
Just x
= { definition of id }
id (Just x)
Now, lets show that fmap preserves composition:
fmap (g . f) = fmap g . fmap f
First the Nothing case:
fmap (g . f) Nothing
= { definition of fmap }
Nothing
= { definition of fmap }
fmap g Nothing
= { definition of fmap }
fmap g (fmap f Nothing)
95And then the Just case:
fmap (g . f) (Just x)
= { definition of fmap }
Just ((g . f) x)
= { definition of composition }
Just (g (f x))
= { definition of fmap }
fmap g (Just (f x))
= { definition of fmap }
fmap g (fmap f (Just x))
= { definition of composition }
(fmap g . fmap f) (Just x)
It’s worth stressing that equational reasoning doesn’t work for C++
style “functions” with side effects. Consider this code:
int square(int x) {
return x * x;
}
int counter() {
static int c = 0;
return c++;
}
double y = square(counter());
Using equational reasoning, you would be able to inline square to get:
double y = counter() * counter();
This is definitely not a valid transformation, and it will not produce the
same result. Despite that, the C++ compiler will try to use equational
reasoning if you implement square as a macro, with disastrous results.
967.1.3 Optional
Functors are easily expressed in Haskell, but they can be defined in any
language that supports generic programming and higher-order func-
tions.Let’sconsidertheC++analogofMaybe,thetemplatetypeoptional.
Here’s a sketch of the implementation (the actual implementation is
much more complex, dealing with various ways the argument may be
passed, with copy semantics, and with the resource management issues
characteristic of C++):
template<class T>
class optional {
bool _isValid; // the tag
T _v;
public:
optional() : _isValid(false) {} // Nothing
optional(T x) : _isValid(true) , _v(x) {} // Just
bool isValid() const { return _isValid; }
T val() const { return _v; } };
This template provides one part of the definition of a functor: the map-
ping of types. It maps any type T to a new type optional<T>. Let’s define
its action on functions:
template<class A, class B>
std::function<optional<B>(optional<A>)>
fmap(std::function<B(A)> f) {
return [f](optional<A> opt) {
if (!opt.isValid())
return optional<B>{};
else
return optional<B>{ f(opt.val()) };
};
}
97This is a higher order function, taking a function as an argument and
returning a function. Here’s the uncurried version of it:
template<class A, class B>
optional<B> fmap(std::function<B(A)> f, optional<A> opt) {
if (!opt.isValid())
return optional<B>{};
else
return optional<B>{ f(opt.val()) };
}
There is also an option of making fmap a template method of optional.
This embarrassment of choices makes abstracting the functor pattern
in C++ a problem. Should functor be an interface to inherit from (un-
fortunately, you can’t have template virtual functions)? Should it be a
curried or an uncurried free template function? Can the C++ compiler
correctly infer the missing types, or should they be specified explicitly?
Consider a situation where the input function f takes an int to a bool.
How will the compiler figure out the type of g:
auto g = fmap(f);
especiallyif,inthefuture,therearemultiplefunctorsoverloadingfmap?
(We’ll see more functors soon.)
## 7.1.4 Typeclasses
So how does Haskell deal with abstracting the functor? It uses the type-
class mechanism. A typeclass defines a family of types that support a
common interface. For instance, the class of objects that support equal-
ity is defined as follows:
98class Eq a where
(==) :: a -> a -> Bool
This definition states that type a is of the class Eq if it supports the op-
erator (==) that takes two arguments of type a and returns a Bool. If
you want to tell Haskell that a particular type is Eq, you have to de-
clare it an instance of this class and provide the implementation of (==).
For example, given the definition of a 2D Point (a product type of two
Floats):
data Point = Pt Float Float
you can define the equality of points:
instance Eq Point where
(Pt x y) == (Pt x' y') = x == x' && y == y'
Here I used the operator (==) (the one I’m defining) in the infix posi-
tion between the two patterns (Pt x y) and (Pt x' y'). The body of
the function follows the single equal sign. Once Point is declared an in-
stance of Eq, you can directly compare points for equality. Notice that,
unlikeinC++orJava,youdon’thavetospecifytheEq class(orinterface)
when defining Point — you can do it later in client code. Typeclasses
are also Haskell’s only mechanism for overloading functions (and op-
erators). We will need that for overloading fmap for different functors.
There is one complication, though: a functor is not defined as a type but
as a mapping of types, a type constructor. We need a typeclass that’s
not a family of types, as was the case with Eq, but a family of type con-
structors. Fortunately a Haskell typeclass works with type constructors
as well as with types. So here’s the definition of the Functor class:
99class Functor f where
fmap :: (a -> b) -> f a -> f b
It stipulates that f is a Functor if there exists a function fmap with the
specified type signature. The lowercase f is a type variable, similar to
type variables a and b. The compiler, however, is able to deduce that it
represents a type constructor rather than a type by looking at its usage:
acting on other types, as in f a and f b. Accordingly, when declaring
an instance of Functor, you have to give it a type constructor, as is the
case with Maybe:
instance Functor Maybe where
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)
By the way, the Functor class, as well as its instance definitions for a lot
of simple data types, including Maybe, are part of the standard Prelude
library.
## 7.1.5 Functor in C++
Can we try the same approach in C++? A type constructor corresponds
to a template class, like optional, so by analogy, we would parameterize
fmap with a template template parameter F. This is the syntax for it:
template<template<class> F, class A, class B>
F<B> fmap(std::function<B(A)>, F<A>);
We would like to be able to specialize this template for different func-
tors. Unfortunately, there is a prohibition against partial specialization
of template functions in C++. You can’t write:
100template<class A, class B>
optional<B> fmap<optional>(std::function<B(A)> f, optional<A> opt)
Instead, we have to fall back on function overloading, which brings us
back to the original definition of the uncurried fmap:
template<class A, class B>
optional<B> fmap(std::function<B(A)> f, optional<A> opt) {
if (!opt.isValid())
return optional<B>{};
else
return optional<B>{ f(opt.val()) };
}
This definition works, but only because the second argument of fmap
selects the overload. It totally ignores the more generic definition of
fmap.
## 7.1.6 The List Functor
Togetsomeintuitionastotheroleoffunctorsinprogramming,weneed
to look at more examples. Any type that is parameterized by another
type is a candidate for a functor. Generic containers are parameterized
by the type of the elements they store, so let’s look at a very simple
container, the list:
data List a = Nil | Cons a (List a)
We have the type constructor List, which is a mapping from any type
a to the type List a. To show that List is a functor we have to define
the lifting of functions: Given a function a -> b define a function
List a -> List b:
101fmap :: (a -> b) -> (List a -> List b)
A function acting on List a must consider two cases corresponding to
the two list constructors. The Nil case is trivial — just return Nil —
there isn’t much you can do with an empty list. The Cons case is a bit
tricky, because it involves recursion. So let’s step back for a moment
and consider what we are trying to do. We have a list of a, a function f
that turns a to b, and we want to generate a list of b. The obvious thing
is to use f to turn each element of the list from a to b. How do we do
this in practice, given that a (non-empty) list is defined as the Cons of a
head and a tail? We apply f to the head and apply the lifted (fmapped) f
to the tail. This is a recursive definition, because we are defining lifted
f in terms of lifted f:
fmap f (Cons x t) = Cons (f x) (fmap f t)
Notice that, on the right hand side, fmap f is applied to a list that’s
shorter than the list for which we are defining it — it’s applied to its tail.
We recurse towards shorter and shorter lists, so we are bound to even-
tually reach the empty list, or Nil. But as we’ve decided earlier, fmap f
acting on Nil returns Nil, thus terminating the recursion. To get the fi-
nal result, we combine the new head (f x) with the new tail (fmap f t)
using the Cons constructor. Putting it all together, here’s the instance
declaration for the list functor:
instance Functor List where
fmap _ Nil = Nil
fmap f (Cons x t) = Cons (f x) (fmap f t)
IfyouaremorecomfortablewithC++,considerthecaseofastd::vector,
which could be considered the most generic C++ container. The im-
plementation of fmap for std::vector is just a thin encapsulation of
std::transform:
102template<class A, class B>
std::vector<B> fmap(std::function<B(A)> f, std::vector<A> v) {
std::vector<B> w;
std::transform( std::begin(v)
, std::end(v)
, std::back_inserter(w)
, f);
return w;
}
We can use it, for instance, to square the elements of a sequence of
numbers:
std::vector<int> v{ 1, 2, 3, 4 };
auto w = fmap([](int i) { return i*i; }, v);
std::copy( std::begin(w)
, std::end(w)
, std::ostream_iterator(std::cout, ", "));
Most C++ containers are functors by virtue of implementing iterators
thatcanbepassedtostd::transform,whichisthemoreprimitivecousin
of fmap. Unfortunately, the simplicity of a functor is lost under the usual
clutter of iterators and temporaries (see the implementation of fmap
above).I’mhappytosaythatthenewproposedC++rangelibrarymakes
the functorial nature of ranges much more pronounced.
## 7.1.7 The Reader Functor
Now that you might have developed some intuitions — for instance,
functors being some kind of containers — let me show you an example
which at first sight looks very different. Consider a mapping of type a
to the type of a function returning a. We haven’t really talked about
103function types in depth — the full categorical treatment is coming —
but we have some understanding of those as programmers. In Haskell,
a function type is constructed using the arrow type constructor (->)
which takes two types: the argument type and the result type. You’ve
already seen it in infix form, a -> b, but it can equally well be used in
prefix form, when parenthesized:
(->) a b
Just like with regular functions, type functions of more than one argu-
ment can be partially applied. So when we provide just one type argu-
ment to the arrow, it still expects another one. That’s why:
(->) a
is a type constructor. It needs one more type b to produce a complete
type a -> b. As it stands, it defines a whole family of type constructors
parameterized by a. Let’s see if this is also a family of functors. Deal-
ing with two type parameters can get a bit confusing, so let’s do some
renaming. Let’s call the argument type r and the result type a, in line
withourpreviousfunctordefinitions.Soourtypeconstructortakesany
type a and maps it into the type r -> a. To show that it’s a functor, we
want to lift a function a -> b to a function that takes r -> a and returns
r -> b. These are the types that are formed using the type constructor
(->) r acting on, respectively, a and b. Here’s the type signature of fmap
applied to this case:
fmap :: (a -> b) -> (r -> a) -> (r -> b)
Wehavetosolvethefollowingpuzzle:givenafunctionf :: a -> b and
a function g :: r -> a, create a function r -> b. There is only one way
we can compose the two functions, and the result is exactly what we
need. So here’s the implementation of our fmap:
104instance Functor ((->) r) where
fmap f g = f . g
It just works! If you like terse notation, this definition can be reduced
further by noticing that composition can be rewritten in prefix form:
fmap f g = (.) f g
and the arguments can be omitted to yield a direct equality of two func-
tions:
fmap = (.)
This combination of the type constructor (->) r with the above imple-
mentation of fmap is called the reader functor.
## 7.2 Functors as Containers
We’ve seen some examples of functors in programming languages that
define general-purpose containers, or at least objects that contain some
value of the type they are parameterized over. The reader functor seems
to be an outlier, because we don’t think of functions as data. But we’ve
seen that pure functions can be memoized, and function execution can
be turned into table lookup. Tables are data. Conversely, because of
Haskell’slaziness,atraditionalcontainer,likealist,mayactuallybeim-
plementedasafunction.Consider,forinstance,aninfinitelistofnatural
numbers, which can be compactly defined as:
nats :: [Integer]
nats = [1..]
105In the first line, a pair of square brackets is Haskell’s built-in type con-
structor for lists. In the second line, square brackets are used to create a
list literal. Obviously, an infinite list like this cannot be stored in mem-
ory. The compiler implements it as a function that generates Integers
on demand. Haskell effectively blurs the distinction between data and
code. A list could be considered a function, and a function could be
considered a table that maps arguments to results. The latter can even
be practical if the domain of the function is finite and not too large. It
would not be practical, however, to implement strlen as table lookup,
becausethereareinfinitelymanydifferentstrings.Asprogrammers,we
don’t like infinities, but in category theory you learn to eat infinities for
breakfast. Whether it’s a set of all strings or a collection of all possi-
ble states of the Universe, past, present, and future — we can deal with
it! So I like to think of the functor object (an object of the type gen-
erated by an endofunctor) as containing a value or values of the type
over which it is parameterized, even if these values are not physically
present there. One example of a functor is a C++ std::future, which
may at some point contain a value, but it’s not guaranteed it will; and
if you want to access it, you may block waiting for another thread to
finish execution. Another example is a Haskell IO object, which may
contain user input, or the future versions of our Universe with “Hello
World!” displayed on the monitor. According to this interpretation, a
functor object is something that may contain a value or values of the
type it’s parameterized upon. Or it may contain a recipe for generating
those values. We are not at all concerned about being able to access the
values — that’s totally optional, and outside of the scope of the functor.
All we are interested in is to be able to manipulate those values using
functions. If the values can be accessed, then we should be able to see
the results of this manipulation. If they can’t, then all we care about
106is that the manipulations compose correctly and that the manipulation
with an identity function doesn’t change anything. Just to show you
how much we don’t care about being able to access the values inside
a functor object, here’s a type constructor that ignores completely its
argument a:
data Const c a = Const c
The Const type constructor takes two types, c and a. Just like we did
with the arrow constructor, we are going to partially apply it to create
a functor. The data constructor (also called Const) takes just one value
of type c. It has no dependence on a. The type of fmap for this type
constructor is:
fmap :: (a -> b) -> Const c a -> Const c b
Because the functor ignores its type argument, the implementation of
fmap is free to ignore its function argument — the function has nothing
to act upon:
instance Functor (Const c) where
fmap _ (Const v) = Const v
This might be a little clearer in C++ (I never thought I would utter those
words!), where there is a stronger distinction between type arguments
— which are compile-time — and values, which are run-time:
template<class C, class A>
struct Const {
Const(C v) : _v(v) {}
C _v;
};
107The C++ implementation of fmap also ignores the function argument
and essentially re-casts the Const argument without changing its value:
template<class C, class A, class B>
Const<C, B> fmap(std::function<B(A)> f, Const<C, A> c) {
return Const<C, B>{c._v};
}
Despiteitsweirdness,theConst functorplaysanimportantroleinmany
constructions. In category theory, it’s a special case of the Δ𝑐 functor
I mentioned earlier — the endo-functor case of a black hole. We’ll be
seeing more of it in the future.
## 7.3 Functor Composition
It’snothardtoconvinceyourselfthatfunctorsbetweencategoriescom-
pose, just like functions between sets compose. A composition of two
functors, when acting on objects, is just the composition of their re-
spectiveobjectmappings;andsimilarlywhenactingonmorphisms.Af-
ter jumping through two functors, identity morphisms end up as iden-
tity morphisms, and compositions of morphisms finish up as composi-
tions of morphisms. There’s really nothing much to it. In particular, it’s
easy to compose endofunctors. Remember the function maybeTail? I’ll
rewrite it using Haskell’s built in implementation of lists:
maybeTail :: [a] -> Maybe [a]
maybeTail [] = Nothing
maybeTail (x:xs) = Just xs
(The empty list constructor that we used to call Nil is replaced with the
empty pair of square brackets []. The Cons constructor is replaced with
108the infix operator : (colon).) The result of maybeTail is of a type that’s
a composition of two functors, Maybe and [], acting on a. Each of these
functors is equipped with its own version of fmap, but what if we want
to apply some function f to the contents of the composite: a Maybe list?
We have to break through two layers of functors. We can use fmap to
break through the outer Maybe. But we can’t just send f inside Maybe
because f doesn’t work on lists. We have to send (fmap f) to operate on
the inner list. For instance, let’s see how we can square the elements of
a Maybe list of integers:
square x = x * x
mis :: Maybe [Int]
mis = Just [1, 2, 3]
mis2 = fmap (fmap square) mis
Thecompiler,afteranalyzingthetypes,willfigureoutthat,fortheouter
fmap, it should use the implementation from the Maybe instance, and for
the inner one, the list functor implementation. It may not be immedi-
ately obvious that the above code may be rewritten as:
mis2 = (fmap . fmap) square mis
But remember that fmap may be considered a function of just one argu-
ment:
fmap :: (a -> b) -> (f a -> f b)
In our case, the second fmap in (fmap . fmap) takes as its argument:
square :: Int -> Int
109and returns a function of the type:
[Int] -> [Int]
The first fmap then takes that function and returns a function:
Maybe [Int] -> Maybe [Int]
Finally, that function is applied to mis. So the composition of two func-
tors is a functor whose fmap is the composition of the corresponding
fmaps. Going back to category theory: It’s pretty obvious that functor
compositionisassociative(themappingofobjectsisassociative,andthe
mappingofmorphismsisassociative).Andthereisalsoatrivialidentity
functor in every category: it maps every object to itself, and every mor-
phism to itself. So functors have all the same properties as morphisms
in some category. But what category would that be? It would have to be
a category in which objects are categories and morphisms are functors.
It’s a category of categories. But a category of all categories would have
toincludeitself,andwewouldgetintothesamekindsofparadoxesthat
made the set of all sets impossible. There is, however, a category of all
small categories called 𝐂𝐚𝐭 (which is big, so it can’t be a member of it-
self). A small category is one in which objects form a set, as opposed to
something larger than a set. Mind you, in category theory, even an in-
finite uncountable set is considered “small.” I thought I’d mention these
things because I find it pretty amazing that we can recognize the same
structures repeating themselves at many levels of abstraction. We’ll see
later that functors form categories as well.
## 7.4 Challenges
1. CanweturntheMaybe typeconstructorintoafunctorbydefining:
110fmap _ _ = Nothing
which ignores both of its arguments? (Hint: Check the functor
laws.)
2. Prove functor laws for the reader functor. Hint: it’s really simple.
3. Implement the reader functor in your second favorite language
(the first being Haskell, of course).
4. Prove the functor laws for the list functor. Assume that the laws
are true for the tail part of the list you’re applying it to (in other
words, use induction).
1118 Functoriality
Now that you know what a functor is, and have seen a few exam-
ples, let’s see how we can build larger functors from smaller ones.
In particular it’s interesting to see which type constructors (which cor-
respond to mappings between objects in a category) can be extended to
functors (which include mappings between morphisms).
## 8.1 Bifunctors
Since functors are morphisms in 𝐂𝐚𝐭 (the category of categories), a lot
of intuitions about morphisms — and functions in particular — apply to
functors as well. For instance, just like you can have a function of two
arguments, you can have a functor of two arguments, or a bifunctor. On
objects, a bifunctor maps every pair of objects, one from category 𝐂,
and one from category 𝐃, to an object in category 𝐄. Notice that this is
112just saying that it’s a mapping from a Cartesian product of categories
𝐂 × 𝐃 to 𝐄.
That’s pretty straightforward. But
functoriality means that a bifunc-
tor has to map morphisms as well.
Thistime,though,itmustmapapair
of morphisms, one from 𝐂 and one
from 𝐃, to a morphism in 𝐄.
Again, a pair of morphisms is
just a single morphism in the prod-
uct category 𝐂×𝐃 to 𝐄. We define a
morphism in a Cartesian product of
categories as a pair of morphisms which goes from one pair of objects
to another pair of objects. These pairs of morphisms can be composed
in the obvious way:
(𝑓,𝑔) ∘ (𝑓′,𝑔′) = (𝑓 ∘ 𝑓′,𝑔 ∘ 𝑔′)
The composition is associative and it has an identity — a pair of iden-
tity morphisms (id,id). So a Cartesian product of categories is indeed a
category.
But an easier way to think about bifunctors is that they are func-
tors in both arguments. So instead of translating functorial laws — as-
sociativity and identity preservation — from functors to bifunctors, it’s
enough to check them separately for each argument. If you have a map-
pingfromapairofcategoriestoathirdcategory,andyouprovethatitis
functorialineachargumentseparately(i.e.,keepingtheotherargument
constant), then the mapping is automatically a bifunctor. By functorial
I mean that it acts on morphisms like an honest functor.
Let’s define a bifunctor in Haskell. In this case all three categories
are the same: the category of Haskell types. A bifunctor is a type con-
113structor that takes two type arguments. Here’s the definition of the
Bifunctor typeclass taken directly from the library Control.Bifunctor:
class Bifunctor f where
bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
bimap g h = first g . second h
first :: (a -> c) -> f a b -> f c b
first g = bimap g id
second :: (b -> d) -> f a b -> f a d
second = bimap id
The type variable f represents the bifunctor. You can see that in all type
signatures it’s always applied to two type arguments. The first type sig-
nature defines bimap: a mapping of two functions at once. The result
is a lifted function, (f a b -> f c d), operating on types generated by
the bifunctor’s type constructor. There is a default implementation of
bimap in terms of first and second, which shows that it’s enough to
have functoriality in each argument separately to be able to define a bi-
functor. (This is not true in general in category theory, because the two
maps may not commute: first g . second h might not be the same as
second h . first g.)
bimap
114The two other type signatures, first and second, are the two fmaps wit-
nessing the functoriality of f in the first and the second argument, re-
spectively.
first second
The typeclass definition provides default implementations for both of
them in terms of bimap.
When declaring an instance of Bifunctor, you have a choice of ei-
therimplementingbimap andacceptingthedefaultsforfirst andsecond,
or implementing both first and second and accepting the default for
bimap (of course, you may implement all three of them, but then it’s up
to you to make sure they are related to each other in this manner).
## 8.2 Product and Coproduct Bifunctors
Animportantexampleofabifunctoristhecategoricalproduct—aprod-
uctoftwoobjectsthatisdefinedbyauniversalconstruction.Iftheprod-
uct exists for any pair of objects, the mapping from those objects to the
product is bifunctorial. This is true in general, and in Haskell in particu-
lar. Here’s the Bifunctor instance for a pair constructor — the simplest
product type:
115instance Bifunctor (,) where
bimap f g (x, y) = (f x, g y)
There isn’t much choice: bimap simply applies the first function to the
first component, and the second function to the second component of a
pair. The code pretty much writes itself, given the types:
bimap :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
The action of the bifunctor here is to make pairs of types, for instance:
(,) a b = (a, b)
By duality, a coproduct, if it’s defined for every pair of objects in a cat-
egory, is also a bifunctor. In Haskell, this is exemplified by the Either
type constructor being an instance of Bifunctor:
instance Bifunctor Either where
bimap f _ (Left x) = Left (f x)
bimap _ g (Right y) = Right (g y)
This code also writes itself.
Now, remember when we talked about monoidal categories? A mo-
noidal category defines a binary operator acting on objects, together
with a unit object. I mentioned that 𝐒𝐞𝐭 is a monoidal category with re-
spect to Cartesian product, with the singleton set as a unit. And it’s also
a monoidal category with respect to disjoint union, with the empty set
as a unit. What I haven’t mentioned is that one of the requirements for
a monoidal category is that the binary operator be a bifunctor. This is
a very important requirement — we want the monoidal product to be
compatible with the structure of the category, which is defined by mor-
phisms. We are now one step closer to the full definition of a monoidal
category (we still need to learn about naturality, before we can get
there).
1168.3 Functorial Algebraic Data Types
We’ve seen several examples of parameterized data types that turned
outtobefunctors—wewereabletodefinefmap forthem.Complexdata
types are constructed from simpler data types. In particular, algebraic
data types (adts) are created using sums and products. We have just
seen that sums and products are functorial. We also know that functors
compose. So if we can show that the basic building blocks of adts are
functorial, we’ll know that parameterized adts are functorial too.
So what are the building blocks of parameterized algebraic data
types? First, there are the items that have no dependency on the type
parameter of the functor, like Nothing in Maybe, or Nil in List. They are
equivalent to the Const functor. Remember, the Const functor ignores
its type parameter (really, the second type parameter, which is the one
of interest to us, the first one being kept constant).
Thentherearetheelementsthatsimplyencapsulatethetypeparam-
eter itself, like Just in Maybe. They are equivalent to the identity functor.
I mentioned the identity functor previously, as the identity morphism
in Cat, but didn’t give its definition in Haskell. Here it is:
data Identity a = Identity a
instance Functor Identity where
fmap f (Identity x) = Identity (f x)
YoucanthinkofIdentity asthesimplestpossiblecontainerthatalways
stores just one (immutable) value of type a.
Everythingelseinalgebraicdatastructuresisconstructedfromthese
two primitives using products and sums.
With this new knowledge, let’s have a fresh look at the Maybe type
constructor:
117data Maybe a = Nothing | Just a
It’sasumoftwotypes,andwenowknowthatthesumisfunctorial.The
first part, Nothing can be represented as a Const () acting on a (the first
type parameter of Const is set to unit — later we’ll see more interesting
uses of Const). The second part is just a different name for the identity
functor. We could have defined Maybe, up to isomorphism, as:
type Maybe a = Either (Const () a) (Identity a)
So Maybe is the composition of the bifunctor Either with two functors,
Const () and Identity. (Const is really a bifunctor, but here we always
use it partially applied.)
We’ve already seen that a composition of functors is a functor —
we can easily convince ourselves that the same is true of bifunctors.
All we need is to figure out how a composition of a bifunctor with two
functorsworksonmorphisms.Giventwomorphisms,wesimplyliftone
with one functor and the other with the other functor. We then lift the
resulting pair of lifted morphisms with the bifunctor.
We can express this composition in Haskell. Let’s define a data type
that is parameterized by a bifunctor bf (it’s a type variable that is a type
constructor that takes two types as arguments), two functors fu and gu
(type constructors that take one type variable each), and two regular
types a and b. We apply fu to a and gu to b, and then apply bf to the
resulting two types:
newtype BiComp bf fu gu a b = BiComp (bf (fu a) (gu b))
That’s the composition on objects, or types. Notice how in Haskell we
apply type constructors to types, just like we apply functions to argu-
ments. The syntax is the same.
118Ifyou’regettingalittlelost,tryapplyingBiComp toEither,Const (),
Identity, a, and b, in this order. You will recover our bare-bone version
of Maybe b (a is ignored).
The new data type BiComp is a bifunctor in a and b, but only if bf is
itself a Bifunctor and fu and gu are Functors. The compiler must know
that there will be a definition of bimap available for bf, and definitions
of fmap for fu and gu. In Haskell, this is expressed as a precondition in
the instance declaration: a set of class constraints followed by a double
arrow:
instance (Bifunctor bf, Functor fu, Functor gu) =>
Bifunctor (BiComp bf fu gu) where
bimap f1 f2 (BiComp x) = BiComp ((bimap (fmap f1) (fmap f2))
x) ↪
The implementation of bimap for BiComp is given in terms of bimap for bf
and the two fmaps for fu and gu. The compiler automatically infers all
the types and picks the correct overloaded functions whenever BiComp
is used.
The x in the definition of bimap has the type:
bf (fu a) (gu b)
which is quite a mouthful. The outer bimap breaks through the outer bf
layer, and the two fmaps dig under fu and gu, respectively. If the types
of f1 and f2 are:
f1 :: a -> a'
f2 :: b -> b'
then the final result is of the type bf (fu a') (gu b'):
119bimap :: (fu a -> fu a') -> (gu b -> gu b')
-> bf (fu a) (gu b) -> bf (fu a') (gu b')
Ifyoulikejigsawpuzzles,thesekindsoftypemanipulationscanprovide
hours of entertainment.
So it turns out that we didn’t have to prove that Maybe was a functor
— this fact followed from the way it was constructed as a sum of two
functorial primitives.
A perceptive reader might ask the question: If the derivation of the
Functor instance for algebraic data types is so mechanical, can’t it be
automated and performed by the compiler? Indeed, it can, and it is. You
need to enable a particular Haskell extension by including this line at
the top of your source file:
{-# LANGUAGE DeriveFunctor #-}
and then add deriving Functor to your data structure:
data Maybe a = Nothing | Just a deriving Functor
and the corresponding fmap will be implemented for you.
The regularity of algebraic data structures makes it possible to de-
rive instances not only of Functor but of several other type classes, in-
cluding the Eq type class I mentioned before. There is also the option of
teaching the compiler to derive instances of your own typeclasses, but
that’s a bit more advanced. The idea though is the same: You provide
the behavior for the basic building blocks and sums and products, and
let the compiler figure out the rest.
1208.4 Functors in C++
If you are a C++ programmer, you obviously are on your own as far as
implementing functors goes. However, you should be able to recognize
sometypesofalgebraicdatastructuresinC++.Ifsuchadatastructureis
made into a generic template, you should be able to quickly implement
fmap for it.
Let’s have a look at a tree data structure, which we would define in
Haskell as a recursive sum type:
data Tree a = Leaf a | Node (Tree a) (Tree a)
deriving Functor
As I mentioned before, one way of implementing sum types in C++ is
throughclasshierarchies.Itwouldbenatural,inanobject-orientedlan-
guage, to implement fmap as a virtual function of the base class Functor
and then override it in all subclasses. Unfortunately this is impossible
because fmap is a template, parameterized not only by the type of the
object it’s acting upon (the this pointer) but also by the return type of
the function that’s been applied to it. Virtual functions cannot be tem-
platized in C++. We’ll implement fmap as a generic free function, and
we’ll replace pattern matching with dynamic_cast.
The base class must define at least one virtual function in order to
support dynamic casting, so we’ll make the destructor virtual (which is
a good idea in any case):
template<class T>
struct Tree {
virtual ~Tree() {};
};
The Leaf is just an Identity functor in disguise:
121template<class T>
struct Leaf : public Tree<T> {
T _label;
Leaf(T l) : _label(l) {}
};
The Node is a product type:
template<class T>
struct Node : public Tree<T> {
Tree<T> * _left;
Tree<T> * _right;
Node(Tree<T> * l, Tree<T> * r) : _left(l), _right(r) {}
};
Whenimplementingfmap wetakeadvantageofdynamicdispatchingon
the type of the Tree. The Leaf case applies the Identity version of fmap,
and the Node case is treated like a bifunctor composed with two copies
of the Tree functor. As a C++ programmer, you’re probably not used
to analyzing code in these terms, but it’s a good exercise in categorical
thinking.
template<class A, class B>
Tree<B> * fmap(std::function<B(A)> f, Tree<A> * t) {
Leaf<A> * pl = dynamic_cast <Leaf<A>*>(t);
if (pl)
return new Leaf<B>(f (pl->_label));
Node<A> * pn = dynamic_cast<Node<A>*>(t);
if (pn)
return new Node<B>( fmap<A>(f, pn->_left)
, fmap<A>(f, pn->_right));
return nullptr;
}
122For simplicity, I decided to ignore memory and resource management
issues, but in production code you would probably use smart pointers
(unique or shared, depending on your policy).
Compare it with the Haskell implementation of fmap:
instance Functor Tree where
fmap f (Leaf a) = Leaf (f a)
fmap f (Node t t') = Node (fmap f t) (fmap f t')
This implementation can also be automatically derived by the compiler.
## 8.5 The Writer Functor
I promised that I would come back to the Kleisli category I described
earlier. Morphisms in that category were represented as “embellished”
functions returning the Writer data structure.
type Writer a = (a, String)
I said that the embellishment was somehow related to endofunctors.
And, indeed, the Writer type constructor is functorial in a. We don’t
even have to implement fmap for it, because it’s just a simple product
type.
Butwhat’stherelationbetweenaKleislicategoryandafunctor—in
general? A Kleisli category, being a category, defines composition and
identity. Let me remind you that the composition is given by the fish
operator:
(>=>) :: (a -> Writer b) -> (b -> Writer c) -> (a -> Writer c)
m1 >=> m2 = \x ->
let (y, s1) = m1 x
(z, s2) = m2 y
in (z, s1 ++ s2)
123and the identity morphism by a function called return:
return :: a -> Writer a
return x = (x, "")
It turns out that, if you look at the types of these two functions long
enough (and I mean, long enough), you can find a way to combine them
toproduceafunctionwiththerighttypesignaturetoserveasfmap.Like
this:
fmap f = id >=> (\x -> return (f x))
Here, the fish operator combines two functions: one of them is the fa-
miliar id, and the other is a lambda that applies return to the result
of acting with f on the lambda’s argument. The hardest part to wrap
your brain around is probably the use of id. Isn’t the argument to the
fish operator supposed to be a function that takes a “normal” type and
returns an embellished type? Well, not really. Nobody says that a in
a -> Writer b must be a “normal” type. It’s a type variable, so it can be
anything, in particular it can be an embellished type, like Writer b.
So id will take Writer a and turn it into Writer a. The fish operator
will fish out the value of a and pass it as x to the lambda. There, f will
turn it into a b and return will embellish it, making it Writer b. Putting
italltogether,weendupwithafunctionthattakesWriter a andreturns
Writer b, exactly what fmap is supposed to produce.
Notice that this argument is very general: you can replace Writer
with any type constructor. As long as it supports a fish operator and
return, you can define fmap as well. So the embellishment in the Kleisli
category is always a functor. (Not every functor, though, gives rise to a
Kleisli category.)
124You might wonder if the fmap we have just defined is the same fmap
thecompilerwouldhavederivedforuswithderiving Functor.Interest-
ingly enough, it is. This is due to the way Haskell implements polymor-
phic functions. It’s called parametric polymorphism, and it’s a source of
socalledtheoremsforfree.Oneofthosetheoremssaysthat,ifthereisan
implementation of fmap for a given type constructor, one that preserves
identity, then it must be unique.
## 8.6 Covariant and Contravariant Functors
Now that we’ve reviewed the writer functor, let’s go back to the reader
functor. It was based on the partially applied function-arrow type con-
structor:
(->) r
We can rewrite it as a type synonym:
type Reader r a = r -> a
for which the Functor instance, as we’ve seen before, reads:
instance Functor (Reader r) where
fmap f g = f . g
But just like the pair type constructor, or the Either type constructor,
the function type constructor takes two type arguments. The pair and
Either were functorial in both arguments — they were bifunctors. Is the
function constructor a bifunctor too?
Let’strytomakeitfunctorialinthefirstargument.We’llstartwitha
typesynonym—it’sjustliketheReader butwiththeargumentsflipped:
125type Op r a = a -> r
This time we fix the return type, r, and vary the argument type, a. Let’s
see if we can somehow match the types in order to implement fmap,
which would have the following type signature:
fmap :: (a -> b) -> (a -> r) -> (b -> r)
With just two functions taking a and returning, respectively, b and r,
there is simply no way to build a function taking b and returning r! It
wouldbedifferentifwecould somehowinvertthefirstfunction, so that
it took b and returned a instead. We can’t invert an arbitrary function,
but we can go to the opposite category.
A short recap:For every category 𝐂 thereisa dualcategory 𝐂𝑜𝑝. It’s
a category with the same objects as 𝐂, but with all the arrows reversed.
Consider a functor that goes between 𝐂𝑜𝑝 and some other category
𝐃:
𝐹 ∷ 𝐂𝑜𝑝 → 𝐃
Such a functor maps a morphism 𝑓𝑜𝑝 ∷ 𝑎 → 𝑏 in 𝐂𝑜𝑝 to the morphism
𝐹𝑓𝑜𝑝 ∷ 𝐹𝑎 → 𝐹𝑏 in 𝐃. But the morphism 𝑓𝑜𝑝 secretly corresponds
to some morphism 𝑓 ∷ 𝑏 → 𝑎 in the original category 𝐂. Notice the
inversion.
Now, 𝐹 is a regular functor, but there is another mapping we can
define based on 𝐹, which is not a functor — let’s call it 𝐺. It’s a mapping
from 𝐂 to 𝐃. It maps objects the same way 𝐹 does, but when it comes to
mapping morphisms, it reverses them. It takes a morphism 𝑓 ∷ 𝑏 → 𝑎
in 𝐂, maps it first to the opposite morphism 𝑓𝑜𝑝 ∷ 𝑎 → 𝑏 and then uses
the functor 𝐹 on it, to get 𝐹𝑓𝑜𝑝 ∷ 𝐹 𝑎 → 𝐹 𝑏.
Considering that 𝐹𝑎 is the same as 𝐺𝑎 and 𝐹𝑏 is the same as 𝐺𝑏,
the whole trip can be described as: 𝐺𝑓 ∷ (𝑏 → 𝑎) → (𝐺𝑎 → 𝐺𝑏)
126It’s a “functor with a twist.” A mapping of categories that inverts the
direction of morphisms in this manner is called a contravariant functor.
Notice that a contravariant functor is just a regular functor from the
opposite category. The regular functors, by the way — the kind we’ve
been studying thus far — are called covariant functors.
Here’sthetypeclassdefiningacontravariantfunctor(really,acontravari-
ant endofunctor) in Haskell:
class Contravariant f where
contramap :: (b -> a) -> (f a -> f b)
Our type constructor Op is an instance of it:
instance Contravariant (Op r) where
-- (b -> a) -> Op r a -> Op r b
contramap f g = g . f
Notice that the function f inserts itself before (that is, to the right of) the
contents of Op — the function g.
The definition of contramap for Op may be made even terser, if you
notice that it’s just the function composition operator with the argu-
ments flipped. There is a special function for flipping arguments, called
flip:
127flip :: (a -> b -> c) -> (b -> a -> c)
flip f y x = f x y
With it, we get:
contramap = flip (.)
## 8.7 Profunctors
We’ve seen that the function-arrow operator is contravariant in its first
argument and covariant in the second. Is there a name for such a beast?
It turns out that, if the target category is 𝐒𝐞𝐭, such a beast is called a
profunctor. Because a contravariant functor is equivalent to a covariant
functor from the opposite category, a profunctor is defined as:
𝐂𝑜𝑝 × 𝐃 → 𝐒𝐞𝐭
Since, to first approximation, Haskell types are sets, we apply the name
Profunctor to a type constructor p of two arguments, which is contra-
functorial in the first argument and functorial in the second. Here’s the
appropriate typeclass taken from the Data.Profunctor library:
class Profunctor p where
dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
dimap f g = lmap f . rmap g
lmap :: (a -> b) -> p b c -> p a c
lmap f = dimap f id
rmap :: (b -> c) -> p a b -> p a c
rmap = dimap id
All three functions come with default implementations. Just like with
Bifunctor, when declaring an instance of Profunctor, you have a choice
128of either implementing dimap and accepting the defaults for lmap and
rmap, or implementing both lmap and rmap and accepting the default for
dimap.
dimap
Now we can assert that the function-arrow operator is an instance of a
Profunctor:
instance Profunctor (->) where
dimap ab cd bc = cd . bc . ab
lmap = flip (.)
rmap = (.)
Profunctors have their application in the Haskell lens library. We’ll see
them again when we talk about ends and coends.
## 8.8 The Hom-Functor
The above examples are the reflection of a more general statement that
the mapping that takes a pair of objects 𝑎 and 𝑏 and assigns to it the
129set of morphisms between them, the hom-set 𝐂(𝑎,𝑏), is a functor. It is a
functor from the product category 𝐂𝑜𝑝 × 𝐂 to the category of sets, 𝐒𝐞𝐭.
Let’s define its action on morphisms. A morphism in 𝐂𝑜𝑝 × 𝐂 is a
pair of morphisms from 𝐂:
𝑓 ∷ 𝑎′ → 𝑎
𝑔 ∷ 𝑏 → 𝑏′
The lifting of this pair must be a morphism (a function) from the set
𝐂(𝑎,𝑏) to the set 𝐂(𝑎′,𝑏′). Just pick any element ℎ of 𝐂(𝑎,𝑏) (it’s a
morphism from 𝑎 to 𝑏) and assign to it:
𝑔 ∘ ℎ ∘ 𝑓
which is an element of 𝐂(𝑎′,𝑏′).
As you can see, the hom-functor is a special case of a profunctor.
## 8.9 Challenges
1. Show that the data type:
data Pair a b = Pair a b
is a bifunctor. For additional credit implement all three methods
ofBifunctor anduseequationalreasoningtoshowthatthesedef-
initions are compatible with the default implementations when-
ever they can be applied.
2. Show the isomorphism between the standard definition of Maybe
and this desugaring:
type Maybe' a = Either (Const () a) (Identity a)
130Hint: Define two mappings between the two implementations.
For additional credit, show that they are the inverse of each other
using equational reasoning.
3. Let’s try another data structure. I call it a PreList because it’s a
precursor to a List. It replaces recursion with a type parameter b.
data PreList a b = Nil | Cons a b
You could recover our earlier definition of a List by recursively
applying PreList to itself (we’ll see how it’s done when we talk
about fixed points).
Show that PreList is an instance of Bifunctor.
4. Show that the following data types define bifunctors in a and b:
data K2 c a b = K2 c
data Fst a b = Fst a
data Snd a b = Snd b
Foradditionalcredit,checkyoursolutionsagainstConorMcBride’s
paper Clowns to the Left of me, Jokers to the Right1.
5. Define a bifunctor in a language other than Haskell. Implement
bimap for a generic pair in that language.
6. Should std::map be considered a bifunctor or a profunctor in the
two template arguments Key and T? How would you redesign this
data type to make it so?
1http://strictlypositive.org/CJ.pdf
1319
Function Types
So far I’ve been glossing over the meaning of function types. A func-
tion type is different from other types.
Hom-set in Set is just a set
Take Integer, for instance: It’s just a set of
integers. Bool is a two element set. But a func-
tion type 𝑎 → 𝑏 is more than that: it’s a set
of morphisms between objects 𝑎 and 𝑏. A set of
morphismsbetweentwoobjectsinanycategory
is called a hom-set. It just so happens that in the
category 𝐒𝐞𝐭 every hom-set is itself an object in
the same category —because it is, after all, a set.
The same is not true of other categories
where hom-sets are external to a category. They are even called external
hom-sets.
It’s the self-referential nature of the category 𝐒𝐞𝐭 that makes func-
tion types special. But there is a way, at least in some categories, to
132Hom-set in category C is an external set
construct objects that represent hom-sets. Such objects are called inter-
nal hom-sets.
## 9.1 Universal Construction
Let’s forget for a moment that function types are sets and try to con-
struct a function type, or more generally, an internal hom-set, from
scratch. As usual, we’ll take our cues from the 𝐒𝐞𝐭 category, but care-
fully avoid using any properties of sets, so that the construction will
automatically work for other categories.
A function type may be considered a composite type because of its
relationship to the argument type and the result type. We’ve already
seen the constructions of composite types — those that involved rela-
tionships between objects. We used universal constructions to define a
product type and a coproduct types. We can use the same trick to de-
133fine a function type. We will need a pattern that involves three objects:
the function type that we are constructing, the argument type, and the
result type.
The obvious pattern that connects these three types is called func-
tion application or evaluation. Given a candidate for a function type,
let’s call it 𝑧 (notice that, if we are not in the category 𝐒𝐞𝐭, this is just
an object like any other object), and the argument type 𝑎 (an object),
the application maps this pair to the result type 𝑏 (an object). We have
three objects, two of them fixed (the ones representing the argument
type and the result type).
Wealsohavetheapplication,whichisamapping.Howdoweincor-
porate this mapping into our pattern? If we were allowed to look inside
objects, we could pair a function 𝑓 (an element of 𝑧) with an argument
𝑥 (an element of 𝑎) and map it to 𝑓𝑥 (the application of 𝑓 to 𝑥, which is
an element of 𝑏).
In Set we can pick a function 𝑓 from a set of functions 𝑧 and we can pick an argument 𝑥 from the
set (type) 𝑎. We get an element 𝑓𝑥 in the set (type) 𝑏.
But instead of dealing with individual pairs (𝑓,𝑥), we can as well
talk about the whole product of the function type 𝑧 and the argument
134type𝑎.Theproduct𝑧×𝑎 isanobject,andwecanpick,asourapplication
morphism, an arrow 𝑔 from that object to 𝑏. In 𝐒𝐞𝐭, 𝑔 would be the
function that maps every pair (𝑓,𝑥) to 𝑓𝑥.
So that’s the pattern: a product of two objects 𝑧 and 𝑎 connected to
another object 𝑏 by a morphism 𝑔.
A pattern of objects and morphisms that is the starting point of the universal construction
Is this pattern specific enough to single out the function type using
a universal construction? Not in every category. But in the categories of
interesttousitis.Andanotherquestion:Woulditbepossibletodefinea
function object without first defining a product? There are categories in
whichthereisnoproduct,orthereisn’taproductforallpairsofobjects.
The answer is no: there is no function type, if there is no product type.
We’ll come back to this later when we talk about exponentials.
Let’s review the universal construction. We start with a pattern of
objectsandmorphisms.That’sourimprecisequery,anditusuallyyields
lots and lots of hits. In particular, in 𝐒𝐞𝐭, pretty much everything is con-
nected to everything. We can take any object 𝑧, form its product with
𝑎, and there’s going to be a function from it to 𝑏 (except when 𝑏 is an
empty set).
That’s when we apply our secret weapon: ranking. This is usually
done by requiring that there be a unique mapping between candidate
objects — a mapping that somehow factorizes our construction. In our
135case, we’ll decree that 𝑧 together with the morphism 𝑔 from 𝑧 × 𝑎 to 𝑏
is better than some other 𝑧′ with its own application 𝑔′, if and only if
there is a unique mapping ℎ from 𝑧′ to 𝑧 such that the application of
𝑔′ factors through the application of 𝑔. (Hint: Read this sentence while
looking at the picture.)
Establishing a ranking between candidates for the function object
Now here’s the tricky part, and the main reason I postponed this
particular universal construction till now. Given the morphism
ℎ ∷ 𝑧′ → 𝑧,wewanttoclosethediagramthathasboth𝑧′ and𝑧 crossed
with 𝑎. What we really need, given the mapping ℎ from 𝑧′ to 𝑧, is a
mapping from 𝑧′ ×𝑎 to 𝑧×𝑎. And now, after discussing the functoriality
of the product, we know how to do it. Because the product itself is a
functor (more precisely an endo-bi-functor), it’s possible to lift pairs of
morphisms. In other words, we can define not only products of objects
but also products of morphisms.
Since we are not touching the second component of the product
𝑧′ × 𝑎, we will lift the pair of morphisms (ℎ,id), where id is an identity
on 𝑎.
136So, here’s how we can factor one application, 𝑔, out of another ap-
plication 𝑔′:
𝑔′ = 𝑔 ∘ (ℎ × id)
The key here is the action of the product on morphisms.
The third part of the universal construction is selecting the object
that is universally the best. Let’s call this object 𝑎 ⇒ 𝑏 (think of this
as a symbolic name for one object, not to be confused with a Haskell
typeclassconstraint—I’lldiscussdifferentwaysofnamingitlater).This
object comes with its own application — a morphism from (𝑎 ⇒ 𝑏)×𝑎
to 𝑏 — which we will call 𝑒𝑣𝑎𝑙. The object 𝑎 ⇒ 𝑏 is the best if any other
candidate for a function object can be uniquely mapped to it in such a
waythatitsapplicationmorphism𝑔 factorizesthrough𝑒𝑣𝑎𝑙.Thisobject
is better than any other object according to our ranking.
The definition of the universal function object. This is the same diagram as above, but now the
object 𝑎 ⇒ 𝑏 is universal.
Formally:
137A function object from 𝑎 to 𝑏 is an object 𝑎 ⇒ 𝑏 together with the
morphism
𝑒𝑣𝑎𝑙 ∷ ((𝑎 ⇒ 𝑏) × 𝑎) → 𝑏
such that for any other object 𝑧 with a morphism
𝑔 ∷ 𝑧 × 𝑎 → 𝑏
there is a unique morphism
ℎ ∷ 𝑧 → (𝑎 ⇒ 𝑏)
that factors 𝑔 through 𝑒𝑣𝑎𝑙:
𝑔 = 𝑒𝑣𝑎𝑙 ∘ (ℎ × id)
Of course, there is no guarantee that such an object 𝑎 ⇒ 𝑏 exists for
any pair of objects 𝑎 and 𝑏 in a given category. But it always does in
𝐒𝐞𝐭. Moreover, in 𝐒𝐞𝐭, this object is isomorphic to the hom-set 𝐒𝐞𝐭(𝑎,𝑏).
This is why, in Haskell, we interpret the function type a -> b as the
categorical function object 𝑎 ⇒ 𝑏.
## 9.2 Currying
Let’s have a second look at all the candidates for the function object.
This time, however, let’s think of the morphism 𝑔 as a function of two
variables, 𝑧 and 𝑎.
𝑔 ∷ 𝑧 × 𝑎 → 𝑏
Being a morphism from a product comes as close as it gets to being a
function of two variables. In particular, in 𝐒𝐞𝐭, 𝑔 is a function from pairs
of values, one from the set 𝑧 and one from the set 𝑎.
138On the other hand, the universal property tells us that for each such
𝑔 there is a unique morphism ℎ that maps 𝑧 to a function object 𝑎 ⇒ 𝑏.
ℎ ∷ 𝑧 → (𝑎 ⇒ 𝑏)
In 𝐒𝐞𝐭, this just means that ℎ is a function that takes one variable of
type 𝑧 and returns a function from 𝑎 to 𝑏. That makes ℎ a higher order
function. Therefore the universal construction establishes a one-to-one
correspondence between functions of two variables and functions of
one variable returning functions. This correspondence is called curry-
ing, and ℎ is called the curried version of 𝑔.
This correspondence is one-to-one, because given any 𝑔 there is a
unique ℎ, and given any ℎ you can always recreate the two-argument
function 𝑔 using the formula:
𝑔 = 𝑒𝑣𝑎𝑙 ∘ (ℎ × id)
The function 𝑔 can be called the uncurried version of ℎ.
Currying is essentially built into the syntax of Haskell. A function
returning a function:
a -> (b -> c)
is often thought of as a function of two variables. That’s how we read
the un-parenthesized signature:
a -> b -> c
This interpretation is apparent in the way we define multi-argument
functions. For instance:
catstr :: String -> String -> String
catstr s s' = s ++ s'
139The same function can be written as a one-argument function returning
a function — a lambda:
catstr' s = \s' -> s ++ s'
These two definitions are equivalent, and either can be partially applied
to just one argument, producing a one-argument function, as in:
greet :: String -> String
greet = catstr "Hello "
Strictly speaking, a function of two variables is one that takes a pair (a
product type):
(a, b) -> c
It’s trivial to convert between the two representations, and the two
(higher-order) functions that do it are called, unsurprisingly, curry and
uncurry:
curry :: ((a, b) -> c) -> (a -> b -> c)
curry f a b = f (a, b)
and
uncurry :: (a -> b -> c) -> ((a, b) -> c)
uncurry f (a, b) = f a b
Notice that curry is the factorizer for the universal construction of the
function object. This is especially apparent if it’s rewritten in this form:
factorizer :: ((a, b) -> c) -> (a -> (b -> c))
factorizer g = \a -> (\b -> g (a, b))
140(As a reminder: A factorizer produces the factorizing function from a
candidate.)
In non-functional languages, like C++, currying is possible but non-
trivial. You can think of multi-argument functions in C++ as corre-
spondingtoHaskellfunctionstakingtuples(although,toconfusethings
evenmore,inC++youcandefinefunctionsthattakeanexplicitstd::tuple,
as well as variadic functions, and functions taking initializer lists).
YoucanpartiallyapplyaC++functionusingthetemplatestd::bind.
For instance, given a function of two strings:
std::string catstr(std::string s1, std::string s2) {
return s1 + s2;
}
you can define a function of one string:
using namespace std::placeholders;
auto greet = std::bind(catstr, "Hello ", _1);
std::cout << greet("Haskell Curry");
Scala, which is more functional than C++ or Java, falls somewhere in
between. If you anticipate that the function you’re defining will be par-
tially applied, you define it with multiple argument lists:
def catstr(s1: String)(s2: String) = s1 + s2
Of course that requires some amount of foresight or prescience on the
part of a library writer.
1419.3 Exponentials
In mathematical literature, the function object, or the internal hom-
object between two objects 𝑎 and 𝑏, is often called the exponential and
denoted by 𝑏𝑎. Notice that the argument type is in the exponent. This
notation might seem strange at first, but it makes perfect sense if you
thinkoftherelationshipbetweenfunctionsandproducts.We’vealready
seenthatwehavetousetheproductintheuniversalconstructionofthe
internal hom-object, but the connection goes deeper than that.
This is best seen when you consider functions between finite types
— types that have a finite number of values, like Bool, Char, or even Int
or Double. Such functions, at least in principle, can be fully memoized
or turned into data structures to be looked up. And this is the essence of
the equivalence between functions, which are morphisms, and function
types, which are objects.
For instance a (pure) function from Bool is completely specified by
a pair of values: one corresponding to False, and one corresponding to
True. The set of all possible functions from Bool to, say, Int is the set of
all pairs of Ints. This is the same as the product Int × Int or, being a
little creative with notation, Int
2.
Foranotherexample,let’slookattheC++typechar,whichcontains
256 values (Haskell Char is larger, because Haskell uses Unicode). There
are several functions in the part of the C++ Standard Library that are
usually implemented using lookups. Functions like isupper or isspace
are implemented using tables, which are equivalent to tuples of 256
Boolean values. A tuple is a product type, so we are dealing with prod-
uctsof 256 Booleans:bool × bool × bool × ... × bool.Weknowfrom
arithmetics that an iterated product defines a power. If you “multiply”
142bool by itself 256 (or char) times, you get bool to the power of char, or
bool
char
.
Howmanyvaluesarethereinthetypedefinedas256-tuplesofbool?
Exactly 2256. This is also the number of different functions from char to
bool, each function corresponding to a unique 256-tuple. You can sim-
ilarly calculate that the number of functions from bool to char is 2562,
and so on. The exponential notation for function types makes perfect
sense in these cases.
We probably wouldn’t want to fully memoize a function from int
or double. But the equivalence between functions and data types, if
not always practical, is there. There are also infinite types, for instance
lists, strings, or trees. Eager memoization of functions from those types
would require infinite storage. But Haskell is a lazy language, so the
boundary between lazily evaluated (infinite) data structures and func-
tionsisfuzzy.Thisfunctionvs.datadualityexplainstheidentificationof
Haskell’sfunctiontypewiththecategoricalexponentialobject—which
corresponds more to our idea of data.
## 9.4 Cartesian Closed Categories
Although I will continue using the category of sets as a model for types
and functions, it’s worth mentioning that there is a larger family of cat-
egories that can be used for that purpose. These categories are called
Cartesian closed, and 𝐒𝐞𝐭 is just one example of such a category.
A Cartesian closed category must contain:
1. The terminal object,
2. A product of any pair of objects, and
3. An exponential for any pair of objects.
143Ifyouconsideranexponentialasaniteratedproduct(possiblyinfinitely
many times), then you can think of a Cartesian closed category as one
supporting products of an arbitrary arity. In particular, the terminal ob-
jectcanbethoughtofasaproductofzeroobjects—orthezero-thpower
of an object.
What’s interesting about Cartesian closed categories from the per-
spective of computer science is that they provide models for the simply
typed lambda calculus, which forms the basis of all typed programming
languages.
The terminal object and the product have their duals: the initial ob-
ject and the coproduct. A Cartesian closed category that also supports
those two, and in which product can be distributed over coproduct
𝑎 × (𝑏 + 𝑐) = 𝑎 × 𝑏 + 𝑎 × 𝑐
(𝑏 + 𝑐) × 𝑎 = 𝑏 × 𝑎 + 𝑐 × 𝑎
is called a bicartesian closed category. We’ll see in the next section that
bicartesian closed categories, of which 𝐒𝐞𝐭 is a prime example, have
some interesting properties.
## 9.5 Exponentials and Algebraic Data Types
The interpretation of function types as exponentials fits very well into
the scheme of algebraic data types. It turns out that all the basic iden-
tities from high-school algebra relating numbers zero and one, sums,
products, and exponentials hold pretty much unchanged in any bicarte-
sian closed category theory for, respectively, initial and final objects,
coproducts, products, and exponentials. We don’t have the tools yet to
prove them (such as adjunctions or the Yoneda lemma), but I’ll list them
here nevertheless as a source of valuable intuitions.
1449.5.1 Zeroth Power
𝑎0 = 1
In the categorical interpretation, we replace 0 with the initial object, 1
withthefinalobject,andequalitywithisomorphism.Theexponentialis
the internal hom-object. This particular exponential represents the set
of morphisms going from the initial object to an arbitrary object 𝑎. By
the definition of the initial object, there is exactly one such morphism,
so the hom-set 𝐂(0,𝑎) is a singleton set. A singleton set is the terminal
object in 𝐒𝐞𝐭, so this identity trivially works in 𝐒𝐞𝐭. What we are saying
is that it works in any bicartesian closed category.
In Haskell, we replace 0 with Void; 1 with the unit type (); and the
exponential with function type. The claim is that the set of functions
from Void to any type a is equivalent to the unit type — which is a
singleton. In other words, there is only one function Void -> a. We’ve
seen this function before: it’s called absurd.
This is a little bit tricky, for two reasons. One is that in Haskell we
don’t really have uninhabited types — every type contains the “result of
a never ending calculation,” or the bottom. The second reason is that all
implementations of absurd are equivalent because, no matter what they
do, nobody can ever execute them. There is no value that can be passed
to absurd. (And if you manage to pass it a never ending calculation, it
will never return!)
## 9.5.2 Powers of One
1𝑎 = 1
This identity, when interpreted in 𝐒𝐞𝐭, restates the definition of the ter-
minal object: There is a unique morphism from any object to the ter-
145minal object. In general, the internal hom-object from 𝑎 to the terminal
object is isomorphic to the terminal object itself.
In Haskell, there is only one function from any type a to unit. We’ve
seen this function before — it’s called unit. You can also think of it as
the function const partially applied to ().
## 9.5.3 First Power
𝑎1 = 𝑎
This is a restatement of the observation that morphisms from the termi-
nal object can be used to pick “elements” of the object a. The set of such
morphisms is isomorphic to the object itself. In 𝐒𝐞𝐭, and in Haskell, the
isomorphism is between elements of the set a and functions that pick
those elements, () -> a.
## 9.5.4 Exponentials of Sums
𝑎𝑏+𝑐 = 𝑎𝑏 × 𝑎𝑐
Categorically, this says that the exponential from a coproduct of two
objects is isomorphic to a product of two exponentials. In Haskell, this
algebraic identity has a very practical, interpretation. It tells us that a
function from a sum of two types is equivalent to a pair of functions
from individual types. This is just the case analysis that we use when
defining functions on sums. Instead of writing one function definition
with a case statement, we usually split it into two (or more) functions
dealingwitheachtypeconstructorseparately.Forinstance,takeafunc-
tion from the sum type (Either Int Double):
f :: Either Int Double -> String
146It may be defined as a pair of functions from, respectively, Int and
Double:
f (Left n) = if n < 0 then "Negative int" else "Positive int"
f (Right x) = if x < 0.0 then "Negative double" else "Positive
double" ↪
Here, n is an Int and x is a Double.
## 9.5.5 Exponentials of Exponentials
(𝑎𝑏)𝑐 = 𝑎𝑏×𝑐
This is just a way of expressing currying purely in terms of exponential
objects. A function returninga functionis equivalent to a function from
a product (a two-argument function).
## 9.5.6 Exponentials over Products
(𝑎 × 𝑏)𝑐 = 𝑎𝑐 × 𝑏𝑐
In Haskell: A function returning a pair is equivalent to a pair of func-
tions, each producing one element of the pair.
It’s pretty incredible how those simple high-school algebraic iden-
tities can be lifted to category theory and have practical application in
functional programming.
## 9.6 Curry-Howard Isomorphism
I have already mentioned the correspondence between logic and alge-
braic data types. The Void type and the unit type () correspond to false
andtrue.Producttypesandsumtypescorrespondtologicalconjunction
147∧ (AND) and disjunction ∨ (OR). In this scheme, the function type we
have just defined corresponds to logical implication ⇒. In other words,
the type a -> b can be read as “if a then b.”
According to the Curry-Howard isomorphism, every type can be
interpreted as a proposition — a statement or a judgment that may be
true or false. Such a proposition is considered true if the type is inhab-
ited and false if it isn’t. In particular, a logical implication is true if the
function type corresponding to it is inhabited, which means that there
exists a function of that type. An implementation of a function is there-
fore a proof of a theorem. Writing programs is equivalent to proving
theorems. Let’s see a few examples.
Let’s take the function eval we have introduced in the definition of
the function object. Its signature is:
eval :: ((a -> b), a) -> b
It takes a pair consisting of a function and its argument and produces
a result of the appropriate type. It’s the Haskell implementation of the
morphism:
𝑒𝑣𝑎𝑙 ∷ (𝑎 ⇒ 𝑏) × 𝑎 → 𝑏
which defines the function type 𝑎 ⇒ 𝑏 (or the exponential object 𝑏𝑎).
Let’s translate this signature to a logical predicate using the Curry-
Howard isomorphism:
((𝑎 ⇒ 𝑏) ∧ 𝑎) ⇒ 𝑏
Here’s how you can read this statement: If it’s true that 𝑏 follows from
𝑎, and 𝑎 is true, then 𝑏 must be true. This makes perfect intuitive sense
andhasbeenknownsinceantiquityasmodusponens.Wecanprovethis
theorem by implementing the function:
148eval :: ((a -> b), a) -> b
eval (f, x) = f x
If you give me a pair consisting of a function f taking a and returning b,
and a concrete value x of type a, I can produce a concrete value of type
b by simply applying the function f to x. By implementing this func-
tion I have just shown that the type ((a -> b), a) -> b is inhabited.
Therefore modus ponens is true in our logic.
How about a predicate that is blatantly false? For instance: if 𝑎 or 𝑏
is true then 𝑎 must be true.
𝑎 ∨ 𝑏 ⇒ 𝑎
This is obviously wrong because you can chose an 𝑎 that is false and a
𝑏 that is true, and that’s a counter-example.
Mapping this predicate into a function signature using the Curry-
Howard isomorphism, we get:
Either a b -> a
Try as you may, you can’t implement this function — you can’t produce
a value of type a if you are called with the Right value. (Remember, we
are talking about pure functions.)
Finally, we come to the meaning of the absurd function:
absurd :: Void -> a
Considering that Void translates into false, we get:
𝑓𝑎𝑙𝑠𝑒 ⇒ 𝑎
Anything follows from falsehood (ex falso quodlibet). Here’s one possi-
ble proof (implementation) of this statement (function) in Haskell:
149absurd (Void a) = absurd a
where Void is defined as:
newtype Void = Void Void
As always, the type Void is tricky. This definition makes it impossible to
construct a value because in order to construct one, you would need to
provide one. Therefore, the function absurd can never be called.
These are all interesting examples, but is there a practical side to
Curry-Howard isomorphism? Probably not in everyday programming.
But there are programming languages like Agda or Coq, which take
advantage of the Curry-Howard isomorphism to prove theorems.
Computers are not only helping mathematicians do their work —
theyarerevolutionizingtheveryfoundationsofmathematics.Thelatest
hot research topic in that area is called Homotopy Type Theory, and is
anoutgrowthoftypetheory.It’sfullofBooleans,integers,productsand
coproducts, function types, and so on. And, as if to dispel any doubts,
the theory is being formulated in Coq and Agda. Computers are revo-
lutionizing the world in more than one way.
## 9.7 Bibliography
1. Ralph Hinze, Daniel W. H. James, Reason Isomorphically!1. This
paper contains proofs of all those high-school algebraic identities
in category theory that I mentioned in this chapter.
1http://www.cs.ox.ac.uk/ralf.hinze/publications/WGP10.pdf
15010 Natural Transformations
We talked about functors as mappings between categories that
preserve their structure.
A functor “embeds” one cat-
egory in another. It may col-
lapsemultiplethingsintoone,
but it never breaks connec-
tions. One way of thinking
about it is that with a functor
wearemodelingonecategory
inside another. The source
category serves as a model, a
blueprint, for some structure
that’s part of the target cate-
gory.
There may be many ways
of embedding one category in another. Sometimes they are equivalent,
151sometimes very different. One may collapse the whole source category
into one object, another may map every object to a different object and
everymorphismtoadifferentmorphism.Thesameblueprintmaybere-
alizedinmanydifferentways.Naturaltransformationshelpuscompare
these realizations. They are mappings of functors — special mappings
that preserve their functorial nature.
Consider two functors 𝐹 and 𝐺 between categories 𝐂 and 𝐃. If you
focus on just one object 𝑎 in 𝐂, it is mapped to two objects: 𝐹𝑎 and 𝐺𝑎.
A mapping of functors should therefore map 𝐹𝑎 to 𝐺𝑎.
Notice that 𝐹𝑎 and 𝐺𝑎 are objects in the same category 𝐃. Mappings
between objects in the same category should not go against the grain
of the category. We don’t want to make artificial connections between
objects. So it’s natural to use existing connections, namely morphisms.
A natural transformation is a selection of morphisms: for every object
𝑎, it picks one morphism from 𝐹𝑎 to 𝐺𝑎. If we call the natural transfor-
mation 𝛼, this morphism is called the component of 𝛼 at 𝑎, or 𝛼𝑎.
𝛼𝑎 ∷ 𝐹𝑎 → 𝐺𝑎
Keep in mind that 𝑎 is an object in 𝐂 while 𝛼𝑎 is a morphism in 𝐃.
If, for some 𝑎, there is no morphism between 𝐹𝑎 and 𝐺𝑎 in 𝐃, there
can be no natural transformation between 𝐹 and 𝐺.
152Of course that’s only half of the story, because functors not only
mapobjects,theymapmorphismsaswell.Sowhatdoesanaturaltrans-
formation do with those mappings? It turns out that the mapping of
morphisms is fixed — under any natural transformation between 𝐹 and
𝐺,𝐹 𝑓 mustbetransformedinto𝐺 𝑓.What’smore,themappingofmor-
phisms by the two functors drastically restricts the choices we have in
defining a natural transformation that’s compatible with it. Consider
a morphism 𝑓 between two objects 𝑎 and 𝑏 in 𝐂. It’s mapped to two
morphisms, 𝐹 𝑓 and 𝐺𝑓 in 𝐃:
𝐹𝑓 ∷ 𝐹𝑎 → 𝐹𝑏
𝐺𝑓 ∷ 𝐺𝑎 → 𝐺𝑏
The natural transformation α provides two additional morphisms that
complete the diagram in D:
𝛼𝑎 ∷ 𝐹𝑎 → 𝐺𝑎
𝛼𝑏 ∷ 𝐹𝑏 → 𝐺𝑏
153Now we have two ways of getting from 𝐹𝑎 to 𝐺𝑏. To make sure that
they are equal, we must impose the naturality condition that holds for
any 𝑓:
𝐺𝑓 ∘ 𝛼𝑎 = 𝛼𝑏 ∘ 𝐹𝑓
The naturality condition is a pretty stringent requirement. For instance,
if the morphism 𝐹𝑓 is invertible, naturality determines 𝛼𝑏 in terms of
𝛼𝑎. It transports 𝛼𝑎 along 𝑓:
𝛼𝑏 = (𝐺𝑓) ∘ 𝛼𝑎 ∘ (𝐹𝑓)−1
If there is more than one invertible morphism between two objects, all
these transports have to agree. In general, though, morphisms are not
invertible; but you can see that the existence of natural transforma-
tions between two functors is far from guaranteed. So the scarcity or
the abundance of functors that are related by natural transformations
may tell you a lot about the structure of categories between which they
operate. We’ll see some examples of that when we talk about limits and
the Yoneda lemma.
Looking at a natural transformation component-wise, one may say
that it maps objects to morphisms. Because of the naturality condition,
154onemayalsosaythatitmapsmorphismstocommutingsquares—there
is one commuting naturality square in 𝐃 for every morphism in 𝐂.
This property of natural transformations comes in very handy in a lot
of categorical constructions, which often include commuting diagrams.
With a judicious choice of functors, a lot of these commutativity condi-
tionsmaybetransformedintonaturalityconditions.We’llseeexamples
of that when we get to limits, colimits, and adjunctions.
Finally,naturaltransformationsmaybeusedtodefineisomorphisms
of functors. Saying that two functors are naturally isomorphic is almost
like saying they are the same. Natural isomorphism is defined as a natu-
ral transformation whose components are all isomorphisms (invertible
morphisms).
## 10.1 Polymorphic Functions
We talked about the role of functors (or, more specifically, endofunc-
tors) in programming. They correspond to type constructors that map
types to types. They also map functions to functions, and this mapping
is implemented by a higher order function fmap (or transform, then, and
the like in C++).
To construct a natural transformation we start with an object, here
a type, a. One functor, F, maps it to the type 𝐹𝑎. Another functor, G,
155maps it to 𝐺𝑎. The component of a natural transformation alpha at a is
a function from 𝐹𝑎 to 𝐺𝑎. In pseudo-Haskell:
alphaa :: F a -> G a
A natural transformation is a polymorphic function that is defined for
all types a:
alpha :: forall a . F a -> G a
The forall a is optional in Haskell (and in fact requires turning on the
language extension ExplicitForAll). Normally, you would write it like
this:
alpha :: F a -> G a
Keep in mind that it’s really a family of functions parameterized by a.
This is another exampleof the terseness of the Haskell syntax. A similar
construct in C++ would be slightly more verbose:
template<class A> G<A> alpha(F<A>);
There is a more profound difference between Haskell’s polymorphic
functions and C++ generic functions, and it’s reflected in the way these
functions are implemented and type-checked. In Haskell, a polymor-
phicfunctionmustbedefineduniformlyforalltypes.Oneformulamust
work across all types. This is called parametric polymorphism.
C++, on the other hand, supports by default ad hoc polymorphism,
which means that a template doesn’t have to be well-defined for all
types. Whether a template will work for a given type is decided at in-
stantiation time, where a concrete type is substituted for the type pa-
rameter. Type checking is deferred, which unfortunately often leads to
incomprehensible error messages.
156InC++,thereisalsoamechanismforfunctionoverloadingandtem-
platespecialization,whichallowsdifferentdefinitionsofthesamefunc-
tion for different types. In Haskell this functionality is provided by type
classes and type families.
Haskell’sparametricpolymorphismhasanunexpectedconsequence:
any polymorphic function of the type:
alpha :: F a -> G a
where F and G are functors, automatically satisfies the naturality condi-
tion. Here it is in categorical notation (𝑓 is a function 𝑓 ∷ 𝑎 → 𝑏):
𝐺𝑓 ∘ 𝛼𝑎 = 𝛼𝑏 ∘ 𝐹𝑓
In Haskell, the action of a functor G on a morphism f is implemented
using fmap. I’ll first write it in pseudo-Haskell, with explicit type anno-
tations:
fmapG f . alphaa = alphab . fmapF f
Because of type inference, these annotations are not necessary, and the
following equation holds:
fmap f . alpha = alpha . fmap f
ThisisstillnotrealHaskell—functionequalityisnotexpressibleincode
— but it’s an identity that can be used by the programmer in equational
reasoning; or by the compiler, to implement optimizations.
The reason why the naturality condition is automatic in Haskell has
to do with “theorems for free.” Parametric polymorphism, which is used
to define natural transformations in Haskell, imposes very strong limi-
tations on the implementation — one formula for all types. These limi-
tations translate into equational theorems about such functions. In the
157case of functions that transform functors, free theorems are the natu-
rality conditions.1
One way of thinking about functors in Haskell that I mentioned
earlier is to consider them generalized containers. We can continue this
analogy and consider natural transformations to be recipes for repack-
aging the contents of one container into another container. We are not
touchingtheitemsthemselves:wedon’tmodifythem,andwedon’tcre-
ate new ones. We are just copying (some of) them, sometimes multiple
times, into a new container.
The naturality condition becomes the statement that it doesn’t mat-
ter whether we modify the items first, through the application of fmap,
and repackage later; or repackage first, and then modify the items in
the new container, with its own implementation of fmap. These two ac-
tions, repackaging and fmapping, are orthogonal. “One moves the eggs,
the other boils them.”
Let’s see a few examples of natural transformations in Haskell. The
firstisbetweenthelistfunctor,andtheMaybe functor.Itreturnsthehead
of the list, but only if the list is non-empty:
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x
It’s a function polymorphic in a. It works for any type a, with no limita-
tions, so it is an example of parametric polymorphism. Therefore it is a
natural transformation between the two functors. But just to convince
ourselves, let’s verify the naturality condition.
fmap f . safeHead = safeHead . fmap f
## 1 You may read more about free theorems in my blog Parametricity: Money for
Nothing and Theorems for Free.
158We have two cases to consider; an empty list:
fmap f (safeHead []) = fmap f Nothing = Nothing
safeHead (fmap f []) = safeHead [] = Nothing
and a non-empty list:
fmap f (safeHead (x:xs)) = fmap f (Just x) = Just (f x)
safeHead (fmap f (x:xs)) = safeHead (f x : fmap f xs) = Just (f
x) ↪
I used the implementation of fmap for lists:
fmap f [] = []
fmap f (x:xs) = f x : fmap f xs
and for Maybe:
fmap f Nothing = Nothing
fmap f (Just x) = Just (f x)
An interesting case is when one of the functors is the trivial Const func-
tor. A natural transformation from or to a Const functor looks just like a
function that’s either polymorphic in its return type or in its argument
type.
For instance, length can be thought of as a natural transformation
from the list functor to the Const Int functor:
length :: [a] -> Const Int a
length [] = Const 0
length (x:xs) = Const (1 + unConst (length xs))
159Here, unConst is used to peel off the Const constructor:
unConst :: Const c a -> c
unConst (Const x) = x
Of course, in practice length is defined as:
length :: [a] -> Int
which effectively hides the fact that it’s a natural transformation.
FindingaparametricallypolymorphicfunctionfromaConst functor
is a little harder, since it would require the creation of a value from
nothing. The best we can do is:
scam :: Const Int a -> Maybe a
scam (Const x) = Nothing
Another common functor that we’ve seen already, and which will play
an important role in the Yoneda lemma, is the Reader functor. I will
rewrite its definition as a newtype:
newtype Reader e a = Reader (e -> a)
It is parameterized by two types, but is (covariantly) functorial only in
the second one:
instance Functor (Reader e) where
fmap f (Reader g) = Reader (\x -> f (g x))
For every type e, you can define a family of natural transformations
fromReader e toanyotherfunctorf.We’llseelaterthatthemembersof
this family are always in one to one correspondence with the elements
of f e (the Yoneda lemma).
160For instance, consider the somewhat trivial unit type () with one
element (). The functor Reader () takes any type a and maps it into a
function type () -> a. These are just all the functions that pick a single
element from the set a. There are as many of these as there are elements
ina.Nowlet’sconsidernatural transformations fromthis functor tothe
Maybe functor:
alpha :: Reader () a -> Maybe a
There are only two of these, dumb and obvious:
dumb (Reader _) = Nothing
and
obvious (Reader g) = Just (g ())
(The only thing you can do with g is to apply it to the unit value ().)
And,indeed,aspredictedbytheYonedalemma,thesecorrespondto
the two elements of the Maybe () type, which are Nothing and Just ().
We’llcomebacktotheYonedalemmalater—thiswasjustalittleteaser.
## 10.2 Beyond Naturality
A parametrically polymorphic function between two functors (includ-
ing the edge case of the Const functor) is always a natural transforma-
tion. Since all standard algebraic data types are functors, any polymor-
phic function between such types is a natural transformation.
Wealsohavefunctiontypesatourdisposal,andthosearefunctorial
in their return type. We can use them to build functors (like the Reader
161functor) and define natural transformations that are higher-order func-
tions.
However, function types are not covariant in the argument type.
They are contravariant. Of course contravariant functors are equivalent
to covariant functors from the opposite category. Polymorphic func-
tions between two contravariant functors are still natural transforma-
tions in the categorical sense, except that they work on functors from
the opposite category to Haskell types.
You might remember the example of a contravariant functor we’ve
looked at before:
newtype Op r a = Op (a -> r)
This functor is contravariant in a:
instance Contravariant (Op r) where
contramap f (Op g) = Op (g . f)
We can write a polymorphic function from, say, Op Bool to Op String:
predToStr (Op f) = Op (\x -> if f x then "T" else "F")
But since the two functors are not covariant, this is not a natural trans-
formation in Hask. However, because they are both contravariant, they
satisfy the “opposite” naturality condition:
contramap f . predToStr = predToStr . contramap f
Notice that the function f must go in the opposite direction than what
you’d use with fmap, because of the signature of contramap:
contramap :: (b -> a) -> (Op Bool a -> Op Bool b)
162Arethereanytypeconstructorsthatarenotfunctors,whethercovariant
or contravariant? Here’s one example:
a -> a
Thisisnotafunctorbecausethesametypea isusedbothinthenegative
(contravariant) and positive (covariant) position. You can’t implement
fmap or contramap for this type. Therefore a function of the signature:
(a -> a) -> f a
where f is an arbitrary functor, cannot be a natural transformation. In-
terestingly, there is a generalization of natural transformations, called
dinatural transformations, that deals with such cases. We’ll get to them
when we discuss ends.
## 10.3 Functor Category
Now that we have mappings between functors — natural transforma-
tions — it’s only natural to ask the question whether functors form a
category. And indeed they do! There is one category of functors for
each pair of categories, 𝐂 and 𝐃. Objects in this category are functors
from𝐂to𝐃,and morphisms arenaturaltransformations between those
functors.
We have to define composition of two natural transformations, but
that’s quite easy. The components of natural transformations are mor-
phisms, and we know how to compose morphisms.
Indeed, let’s take a natural transformation 𝛼 from functor 𝐹 to 𝐺.
Its component at object 𝑎 is some morphism:
𝛼𝑎 ∷ 𝐹𝑎 → 𝐺𝑎
163We’d like to compose 𝛼 with 𝛽, which is a natural transformation from
functor 𝐺 to 𝐻. The component of 𝛽 at 𝑎 is a morphism:
𝛽𝑎 ∷ 𝐺𝑎 → 𝐻𝑎
Thesemorphismsarecomposableandtheircompositionisanothermor-
phism:
𝛽𝑎 ∘ 𝛼𝑎 ∷ 𝐹𝑎 → 𝐻𝑎
We will use this morphism as the component of the natural transfor-
mation 𝛽 ⋅ 𝛼 — the composition of two natural transformations 𝛽 after
𝛼:
(𝛽 ⋅ 𝛼)𝑎 = 𝛽𝑎 ∘ 𝛼𝑎
One (long) look at a diagram convinces us that the result of this com-
position is indeed a natural transformation from F to H:
𝐻𝑓 ∘ (𝛽 ⋅ 𝛼)𝑎 = (𝛽 ⋅ 𝛼)𝑏 ∘ 𝐹𝑓
164Composition of natural transformations is associative, because their
components, which are regular morphisms, are associative with respect
to their composition.
Finally,foreachfunctorFthereisanidentitynaturaltransformation
1𝐹 whose components are the identity morphisms:
id𝐹𝑎 ∷ 𝐹𝑎 → 𝐹𝑎
So, indeed, functors form a category.
A word about notation. Following Saunders Mac Lane I use the dot
forthekindofnaturaltransformationcompositionIhavejustdescribed.
The problem is that there are two ways of composing natural transfor-
mations. This one is called the vertical composition, because the func-
tors are usually stacked up vertically in the diagrams that describe it.
Vertical composition is important in defining the functor category. I’ll
explain horizontal composition shortly.
165Thefunctorcategorybetweencategories𝐂and𝐃iswrittenas𝐅𝐮𝐧(𝐂,𝐃),
or [𝐂,𝐃], or sometimes as 𝐃𝐂. This last notation suggests that a functor
category itself might be considered a function object (an exponential)
in some other category. Is this indeed the case?
Let’s have a look at the hierarchy of abstractions that we’ve been
building so far. We started with a category, which is a collection of ob-
jects and morphisms. Categories themselves (or, strictly speaking small
categories, whose objects form sets) are themselves objects in a higher-
levelcategory𝐂𝐚𝐭.Morphismsinthatcategoryarefunctors.AHom-set
in 𝐂𝐚𝐭 is a set of functors. For instance 𝐂𝐚𝐭(𝐂,𝐃) is a set of functors be-
tween two categories 𝐂 and 𝐃.
A functor category [𝐂,𝐃] is also a set of functors between two cat-
egories (plus natural transformations as morphisms). Its objects are the
same as the members of 𝐂𝐚𝐭(𝐂,𝐃). Moreover, a functor category, being
a category, must itself be an object of 𝐂𝐚𝐭 (it so happens that the func-
tor category between two small categories is itself small). We have a
relationship between a Hom-set in a category and an object in the same
category. The situation is exactly like the exponential object that we’ve
seen in the last section. Let’s see how we can construct the latter in 𝐂𝐚𝐭.
166As you may remember, in order to construct an exponential, we
need to first define a product. In 𝐂𝐚𝐭, this turns out to be relatively easy,
because small categories are sets of objects, and we know how to define
Cartesian products of sets. So an object in a product category 𝐂 × 𝐃 is
just a pair of objects, (𝑐,𝑑), one from 𝐂 and one from 𝐃. Similarly, a
morphism between two such pairs, (𝑐,𝑑) and (𝑐′,𝑑′), is a pair of mor-
phisms, (𝑓,𝑔), where 𝑓 ∷ 𝑐 → 𝑐′ and 𝑔 ∷ 𝑑 → 𝑑′. These pairs of
morphisms compose component-wise, and there is always an identity
pair that is just a pair of identity morphisms. To make the long story
short, 𝐂𝐚𝐭 is a full-blown Cartesian closed category in which there is an
exponential object 𝐃𝐂 for any pair of categories. And by “object” in 𝐂𝐚𝐭
I mean a category, so 𝐃𝐂 is a category, which we can identify with the
functor category between 𝐂 and 𝐃.
10.4 2-Categories
With that out of the way, let’s have a closer look at 𝐂𝐚𝐭. By definition,
any Hom-set in 𝐂𝐚𝐭 is a set of functors. But, as we have seen, functors
between two objects have a richer structure than just a set. They form
a category, with natural transformations acting as morphisms. Since
functors are considered morphisms in 𝐂𝐚𝐭, natural transformations are
morphisms between morphisms.
This richer structure is an example of a 𝟐-category, a generalization
of a category where, besides objects and morphisms (which might be
called 1-morphisms in this context), there are also 2-morphisms, which
are morphisms between morphisms.
In the case of 𝐂𝐚𝐭 seen as a 𝟐-category we have:
• Objects: (Small) categories
167• 1-morphisms: Functors between categories
• 2-morphisms: Natural transformations between functors.
Instead of a Hom-set between two categories 𝐂 and 𝐃, we have a Hom-
category — the functor category 𝐃𝐂. We have regular functor compo-
sition: a functor 𝐹 from 𝐃𝐂 composes with a functor 𝐺 from 𝐄𝐃 to give
𝐺∘𝐹 from 𝐄𝐂. But we also have composition inside each Hom-category
— vertical composition of natural transformations, or 2-morphisms, be-
tween functors.
Withtwokindsofcompositionina𝟐-category,thequestionarises:How
do they interact with each other?
Let’s pick two functors, or 1-morphisms, in 𝐂𝐚𝐭:
𝐹 ∷ 𝐂 → 𝐃
𝐺 ∷ 𝐃 → 𝐄
and their composition:
𝐺 ∘ 𝐹 ∷ 𝐂 → 𝐄
Suppose wehavetwonatural transformations, 𝛼 and𝛽,thatact, respec-
tively, on functors 𝐹 and 𝐺:
𝛼 ∷ 𝐹 → 𝐹′
𝛽 ∷ 𝐺 → 𝐺′
168Notice that we cannot apply vertical composition to this pair, because
thetargetof𝛼 isdifferentfromthesourceof𝛽.Infacttheyaremembers
of two different functor categories: 𝐃𝐂 and 𝐄𝐃. We can, however, apply
composition to the functors 𝐹′ and 𝐺′, because the target of 𝐹′ is the
source of 𝐺′ — it’s the category 𝐃. What’s the relation between the
functors 𝐺′ ∘ 𝐹′ and 𝐺 ∘ 𝐹?
Having 𝛼 and 𝛽 at our disposal, can we define a natural transforma-
tion from 𝐺 ∘ 𝐹 to 𝐺′ ∘ 𝐹′? Let me sketch the construction.
As usual, we start with an object 𝑎 in 𝐂. Its image splits into two ob-
jects in 𝐃: 𝐹𝑎 and 𝐹′𝑎. There is also a morphism, a component of 𝛼,
connecting these two objects:
𝛼𝑎 ∷ 𝐹𝑎 → 𝐹′𝑎
When going from 𝐃 to 𝐄, these two objects split further into four ob-
jects: 𝐺(𝐹𝑎), 𝐺′(𝐹𝑎), 𝐺(𝐹′𝑎), 𝐺′(𝐹′𝑎). We also have four morphisms
169forming a square. Two of these morphisms are the components of the
natural transformation 𝛽:
𝛽𝐹𝑎 ∷ 𝐺(𝐹𝑎) → 𝐺′(𝐹𝑎)
𝛽𝐹′𝑎 ∷ 𝐺(𝐹′𝑎) → 𝐺′(𝐹′𝑎)
The other two are the images of 𝛼𝑎 under the two functors (functors
map morphisms):
𝐺𝛼𝑎 ∷ 𝐺(𝐹𝑎) → 𝐺(𝐹′𝑎)
𝐺′𝛼𝑎 ∷ 𝐺′(𝐹𝑎) → 𝐺′(𝐹′𝑎)
That’salotofmorphisms.Ourgoalistofindamorphismthatgoesfrom
𝐺(𝐹𝑎) to 𝐺′(𝐹′𝑎), a candidate for the component of a natural transfor-
mation connecting the two functors 𝐺 ∘𝐹 and 𝐺′ ∘𝐹′. In fact there’s not
one but two paths we can take from 𝐺(𝐹𝑎) to 𝐺′(𝐹′𝑎):
𝐺′𝛼𝑎 ∘ 𝛽𝐹𝑎
𝛽𝐹′𝑎 ∘ 𝐺𝛼𝑎
Luckily for us, they are equal, because the square we have formed turns
out to be the naturality square for 𝛽.
We have just defined a component of a natural transformation from
𝐺 ∘𝐹 to 𝐺′ ∘𝐹′. The proof of naturality for this transformation is pretty
straightforward, provided you have enough patience.
We call this natural transformation the horizontal composition of 𝛼
and 𝛽:
𝛽 ∘ 𝛼 ∷ 𝐺 ∘ 𝐹 → 𝐺′ ∘ 𝐹′
Again, following Mac Lane I use the small circle for horizontal compo-
sition, although you may also encounter star in its place.
170Here’s a categorical rule of thumb: Every time you have composi-
tion, you should look for a category. We have vertical composition of
natural transformations, and it’s part of the functor category. But what
about the horizontal composition? What category does that live in?
Thewaytofigurethisoutistolookat𝐂𝐚𝐭sideways.Lookatnatural
transformations not as arrows between functors but as arrows between
categories. A natural transformation sits between two categories, the
ones that are connected by the functors it transforms. We can think of
it as connecting these two categories.
Let’s focus on two objects of 𝐂𝐚𝐭 — categories 𝐂 and 𝐃. There is a set of
natural transformations that go between functors that connect 𝐂 to 𝐃.
These natural transformations are our new arrows from 𝐂 to 𝐃. By the
same token, there are natural transformations going between functors
that connect 𝐃 to 𝐄, which we can treat as new arrows going from 𝐃 to
𝐄. Horizontal composition is the composition of these arrows.
We also have an identity arrow going from 𝐂 to 𝐂. It’s the identity
natural transformation that maps the identity functor on 𝐂 to itself.
Notice that the identity for horizontal composition is also the identity
for vertical composition, but not vice versa.
Finally, the two compositions satisfy the interchange law:
(𝛽′ ⋅ 𝛼′) ∘ (𝛽 ⋅ 𝛼) = (𝛽′ ∘ 𝛽) ⋅ (𝛼′ ∘ 𝛼)
I will quote Saunders Mac Lane here: The reader may enjoy writing
down the evident diagrams needed to prove this fact.
171There is one more piece of notation that might come in handy in the
future. In this new sideways interpretation of 𝐂𝐚𝐭 there are two ways of
getting from object to object: using a functor or using a natural trans-
formation. We can, however, re-interpret the functor arrow as a special
kind of natural transformation: the identity natural transformation act-
ing on this functor. So you’ll often see this notation:
𝐹 ∘ 𝛼
where 𝐹 is a functor from 𝐃 to 𝐄, and 𝛼 is a natural transformation
between two functors going from 𝐂 to 𝐃. Since you can’t compose a
functorwithanaturaltransformation,thisisinterpretedasahorizontal
composition of the identity natural transformation 1𝐹 after 𝛼.
Similarly:
𝛼 ∘ 𝐹
is a horizontal composition of 𝛼 after 1𝐹.
## 10.5 Conclusion
This concludes the first part of the book. We’ve learned the basic vo-
cabulary of category theory. You may think of objects and categories as
nouns; and morphisms, functors, and natural transformations as verbs.
Morphisms connect objects, functors connect categories, natural trans-
formations connect functors.
But we’ve also seen that, what appears as an action at one level of
abstraction, becomes an object at the next level. A set of morphisms
turns into a function object. As an object, it can be a source or a target
of another morphism. That’s the idea behind higher order functions.
A functor maps objects to objects, so we can use it as a type con-
structor, or a parametric type. A functor also maps morphisms, so it is
172a higher order function — fmap. There are some simple functors, like
Const, product, and coproduct, that can be used to generate a large va-
riety of algebraic data types. Function types are also functorial, both
covariant and contravariant, and can be used to extend algebraic data
types.
Functors may be looked upon as objects in the functor category.
As such, they become sources and targets of morphisms: natural trans-
formations. A natural transformation is a special type of polymorphic
function.
## 10.6 Challenges
1. Define a natural transformation from the Maybe functor to the list
functor. Prove the naturality condition for it.
2. DefineatleasttwodifferentnaturaltransformationsbetweenReader ()
and the list functor. How many different lists of () are there?
3. Continue the previous exercise with Reader Bool and Maybe.
4. Show that horizontal composition of natural transformation sat-
isfies the naturality condition (hint: use components). It’s a good
exercise in diagram chasing.
5. Write a short essay about how you may enjoy writing down the
evident diagrams needed to prove the interchange law.
6. Create a few test cases for the opposite naturality condition of
transformations between different Op functors. Here’s one choice:
op :: Op Bool Int
op = Op (\x -> x > 0)
and
f :: String -> Int
173f x = read x
174Part Two
17511 Declarative Programming
In the first part of the book I argued that both category theory and
programmingareaboutcomposability.Inprogramming,youkeepde-
composing a problem until you reach the level of detail that you can
deal with, solve each subproblem in turn, and re-compose the solutions
bottom-up. There are, roughly speaking, two ways of doing it: by telling
the computer what to do, or by telling it how to do it. One is called
declarative and the other imperative.
Youcanseethisevenatthemostbasiclevel.Compositionitselfmay
be defined declaratively; as in, h is a composite of g after f:
h = g . f
or imperatively; as in, call f first, remember the result of that call, then
call g with the result:
h x = let y = f x
in g y
176The imperative version of a program is usually described as a sequence
of actions ordered in time. In particular, the call to g cannot happen be-
fore the execution of f completes. At least, that’s the conceptual picture
— in a lazy language, with call-by-need argument passing, the actual
execution may proceed differently.
In fact, depending on the cleverness of the compiler, there may be
little or no difference between how declarative and imperative code is
executed. But the two methodologies differ, sometimes drastically, in
the way we approach problem solving and in the maintainability and
testability of the resulting code.
Themainquestionis:whenfacedwithaproblem,dowealwayshave
the choice between a declarative and imperative approaches to solving
it?And,ifthereisadeclarativesolution,canitalwaysbetranslatedinto
computer code? The answer to this question is far from obvious and, if
we could find it, we would probably revolutionize our understanding of
the universe.
Let me elaborate. There is a sim-
ilar duality in physics, which ei-
ther points at some deep underly-
ing principle, or tells us something
about how our minds work. Richard
Feynman mentions this duality as
an inspiration in his own work on
quantum electrodynamics.
There are two forms of express-
ing most laws of physics. One uses local, or infinitesimal, considera-
tions.Welookatthestateofasystemaroundasmallneighborhood,and
predict how it will evolve within the next instant of time. This is usu-
177ally expressed using differential equations that have to be integrated, or
summed up, over a period of time.
Notice how this approach resembles imperative thinking: we reach
thefinalsolutionbyfollowingasequenceofsmallsteps,eachdepending
ontheresultofthepreviousone.Infact,computersimulationsofphysi-
calsystemsareroutinelyimplementedbyturningdifferentialequations
into difference equations and iterating them. This is how spaceships are
animated in the asteroids game. At each time step, the position of a
spaceship is changed by adding a small increment, which is calculated
by multiplying its velocity by the time delta. The velocity, in turn, is
changed by a small increment proportional to acceleration, which is
given by force divided by mass.
These are the direct encodings of the differential equations corre-
sponding to Newton’s laws of motion:
𝐹 = 𝑚
𝑑𝑣
𝑑𝑡
𝑣 =
𝑑𝑥
𝑑𝑡
Similar methods may be applied to more complex problems, like the
propagationofelectromagneticfieldsusingMaxwell’sequations,oreven
the behavior of quarks and gluons inside a proton using lattice qcd
(quantum chromodynamics).
This local thinking combined with discretization of space and time
that is encouraged by the use of digital computers found its extreme ex-
pression in the heroic attempt by Stephen Wolfram to reduce the com-
plexity of the whole universe to a system of cellular automata.
The other approach is global. We look at the initial and the final
state of the system, and calculate a trajectory that connects them by
minimizing a certain functional. The simplest example is the Fermat’s
178principle of least time. It states that light rays propagate along paths
that minimize their flight time. In particular, in the absence of reflect-
ing or refracting objects, a light ray from point 𝐴 to point 𝐵 will take
the shortest path, which is a straight line. But light propagates slower
in dense (transparent) materials, like water or glass. So if you pick the
starting point in the air, and the ending point under water, it’s more ad-
vantageous for light to travel longer in the air and then take a shortcut
through water. The path of minimum time makes the ray refract at the
boundary of air and water, resulting in Snell’s law of refraction:
𝑠𝑖𝑛(𝜃1)
𝑠𝑖𝑛(𝜃2)
=
𝑣1
𝑣2
where 𝑣1 is the speed of light in the air and 𝑣2 is the speed of light in
the water.
All of classical mechanics can be derived from the principle of least
action. The action can be calculated for any trajectory by integrating
the Lagrangian, which is the difference between kinetic and potential
179energy (notice: it’s the difference, not the sum — the sum would be the
totalenergy).Whenyoufireamortartohitagiventarget,theprojectile
will first go up, where the potential energy due to gravity is higher, and
spend some time there racking up negative contribution to the action.
It will also slow down at the top of the parabola, to minimize kinetic
energy. Then it will speed up to go quickly through the area of low
potential energy.
Feynman’sgreatestcontributionwastorealizethattheprincipleofleast
actioncanbegeneralizedtoquantummechanics.There,again,theprob-
lem is formulated in terms of initial state and final state. The Feynman
path integral between those states is used to calculate the probability of
transition.
The point is that there is a curious unexplained duality in the way we
can describe the laws of physics. We can use the local picture, in which
things happen sequentially and in small increments. Or we can use the
180global picture, where we declare the initial and final conditions, and
everything in between just follows.
The global approach can be also used in programming, for instance
when implementing ray tracing. We declare the position of the eye and
the positions of light sources, and figure out the paths that the light
rays may take to connect them. We don’t explicitly minimize the time
of flight for each ray, but we do use Snell’s law and the geometry of
reflection to the same effect.
The biggest difference between the local and the global approach is
in their treatment of space and, more importantly, time. The local ap-
proach embraces the immediate gratification of here and now, whereas
the global approach takes a long-term static view, as if the future had
been preordained, and we were only analyzing the properties of some
eternal universe.
Nowhere is it better illustrated than in the Functional Reactive Pro-
gramming (frp) approach to user interaction. Instead of writing sepa-
rate handlers for every possible user action, all having access to some
shared mutable state, frp treats external events as an infinite list, and
applies a series of transformations to it. Conceptually, the list of all our
future actions is there, available as the input data to our program. From
a program’s perspective there’s no difference between the list of digits
of 𝜋, a list of pseudo-random numbers, or a list of mouse positions com-
ing through computer hardware. In each case, if you want to get the 𝑛th
item, you have to first go through the first 𝑛−1 items. When applied to
temporal events, we call this property causality.
So what does it have to do with category theory? I will argue that
category theory encourages a global approach and therefore supports
declarative programming. First of all, unlike calculus, it has no built-in
notion of distance, or neighborhood, or time. All we have is abstract ob-
181jects and abstract connections between them. If you can get from 𝐴 to 𝐵
through a series of steps, you can also get there in one leap. Moreover,
themajor tool ofcategorytheoryistheuniversalconstruction, which is
the epitome of a global approach. We’ve seen it in action, for instance,
in the definition of the categorical product. It was done by specifying its
properties — a very declarative approach. It’s an object equipped with
two projections, and it’s the best such object — it optimizes a certain
property: the property of factorizing the projections of other such ob-
jects.
ComparethiswithFermat’sprincipleofminimumtime,ortheprin-
ciple of least action.
Conversely, contrast this with the traditional definition of a Carte-
sian product, which is much more imperative. You describe how to cre-
ate an element of the product by picking one element from one set and
another element from another set. It’s a recipe for creating a pair. And
there’s another for disassembling a pair.
In almost every programming language, including functional lan-
guages like Haskell, product types, coproduct types, and function types
are built in, rather than being defined by universal constructions; al-
182though there have been attempts at creating categorical programming
languages (see, e.g., Tatsuya Hagino’s thesis1).
Whether used directly or not, categorical definitions justify pre-
existing programming constructs, and give rise to new ones. Most im-
portantly,categorytheoryprovidesameta-languageforreasoningabout
computer programs at a declarative level. It also encourages reasoning
about problem specification before it is cast into code.
1http://web.sfc.keio.ac.jp/~hagino/thesis.pdf
18312 Limits and Colimits
It seems like in category theoryeverythingisrelatedtoeverything
andeverythingcanbeviewedfrommanyangles.Takeforinstancethe
universal construction of the product. Now that we know more about
functors and natural transformations, can we simplify and, possibly,
generalize it? Let us try.
The construction of a product starts with the selection of two objects 𝑎
and 𝑏, whose product we want to construct. But what does it mean to
select objects? Can we rephrase this action in more categorical terms?
Two objects form a pattern — a very simple pattern. We can abstract
184this pattern into a category — a very simple category, but a category
nevertheless.It’sacategorythatwe’llcall𝟐.Itcontainsjusttwoobjects,
1and2,andnomorphismsotherthanthetwoobligatoryidentities.Now
we can rephrase the selection of two objects in 𝐂 as the act of defining a
functor𝐷 fromthecategory𝟐to𝐂.Afunctormapsobjectstoobjects,so
its image is just two objects (or it could be one, if the functor collapses
objects, which is fine too). It also maps morphisms — in this case it
simply maps identity morphisms to identity morphisms.
What’sgreataboutthisapproachisthatitbuildsoncategoricalnotions,
eschewingtheimprecisedescriptionslike”selectingobjects”,takenstra-
ight from the hunter-gatherer lexicon of our ancestors. And, inciden-
tally, it is also easily generalized, because nothing can stop us from us-
ing categories more complex than 𝟐 to define our patterns.
But let’s continue. The next step in the definition of a product is the
selection of the candidate object 𝑐. Here again, we could rephrase the
selection in terms of a functor from a singleton category. And indeed,
if we were using Kan extensions, that would be the right thing to do.
But since we are not ready for Kan extensions yet, there is another trick
we can use: a constant functor Δ from the same category 𝟐 to 𝐂. The
selection of 𝑐 in 𝐂 can be done with Δ𝑐. Remember, Δ𝑐 maps all objects
into 𝑐 and all morphisms into id𝑐.
185Now we have two functors, Δ𝑐 and 𝐷 going between 𝟐 and 𝐂 so it’s
only natural to ask about natural transformations between them. Since
there are only two objects in 𝟐, a natural transformation will have two
components. Object 1 in 𝟐 is mapped to 𝑐 by Δ𝑐 and to 𝑎 by 𝐷. So the
component of a natural transformation between Δ𝑐 and 𝐷 at 1 is a mor-
phism from 𝑐 to 𝑎. We can call it 𝑝. Similarly, the second component
is a morphism 𝑞 from 𝑐 to 𝑏 — the image of the object 2 in 𝟐 under 𝐷.
But these are exactly like the two projections we used in our original
definition of the product. So instead of talking about selecting objects
and projections, we can just talk about picking functors and natural
transformations. It so happens that in this simple case the naturality
condition for our transformation is trivially satisfied, because there are
no morphisms (other than the identities) in 𝟐.
A generalization of this construction to categories other than 𝟐 — ones
that, for instance, contain non-trivial morphisms — will impose natu-
rality conditions on the transformation between Δ𝑐 and 𝐷. We call such
186transformationacone,becausetheimageofΔistheapexofacone/pyra-
mid whose sides are formed by the components of the natural transfor-
mation. The image of 𝐷 forms the base of the cone.
In general, to build a cone, we start with a category 𝐈 that defines
the pattern. It’s a small, often finite category. We pick a functor 𝐷 from
𝐈 to 𝐂 and call it (or its image) a diagram. We pick some 𝑐 in 𝐂 as the
apex of our cone. We use it to define the constant functor Δ𝑐 from 𝐈 to
𝐂. A natural transformation from Δ𝑐 to 𝐷 is then our cone. For a finite
𝐈 it’s just a bunch of morphisms connecting 𝑐 to the diagram: the image
of 𝐈 under 𝐷.
Naturality requires that all triangles (the walls of the pyramid) in this
diagram commute. Indeed, take any morphism 𝑓 in 𝐈. The functor 𝐷
mapsitto amorphism𝐷𝑓 in𝐂,amorphismthatformsthe baseof some
triangle. The constant functor Δ𝑐 maps 𝑓 to the identity morphism on
𝑐. Δ squishes the two ends of the morphism into one object, and the
naturality square becomes a commuting triangle. The two arms of this
triangle are the components of the natural transformation.
187So that’s one cone. What we are interested in is the universal cone —
just like we picked a universal object for our definition of a product.
There are many ways to go about it. For instance, we may define a
category of cones based on a given functor 𝐷. Objects in that category
are cones. Not every object 𝑐 in 𝐂 can be an apex of a cone, though,
because there may be no natural transformation between Δ𝑐 and 𝐷.
To make it a category, we also have to define morphisms between
cones. These would be fully determined by morphisms between their
apexes. But not just any morphism will do. Remember that, in our con-
struction of the product, we imposed the condition that the morphisms
between candidate objects (the apexes) must be common factors for the
projections. For instance:
p' = p . m
q' = q . m
188This condition translates, in the general case, to the condition that the
triangles whose one side is the factorizing morphism all commute.
The commuting triangle connecting two cones, with the factorizing morphism ℎ (here, the lower
cone is the universal one, with Lim𝐷 as its apex)
We’ll take those factorizing morphisms as the morphisms in our cate-
gory of cones. It’s easy to check that those morphisms indeed compose,
andthattheidentitymorphismisafactorizingmorphismaswell.Cones
therefore form a category.
Now we can define the universal cone as the terminal object in the
category of cones. The definition of the terminal object states that there
is a unique morphism from any other object to that object. In our case it
means that there is a unique factorizing morphism from the apex of any
other cone to the apex of the universal cone. We call this universal cone
the limit of the diagram 𝐷, Lim𝐷 (in the literature, you’ll often see a left
arrow pointing towards 𝐼 under the Lim sign). Often, as a shorthand,
we call the apex of this cone the limit (or the limit object).
The intuition is that the limit embodies the properties of the whole
diagram in a single object. For instance, the limit of our two-object di-
agram is the product of two objects. The product (together with the
189two projections) contains the information about both objects. And be-
ing universal means that it has no extraneous junk.
## 12.1 Limit as a Natural Isomorphism
There is still something unsatisfying about this definition of a limit. I
mean, it’s workable, but we still have this commutativity condition for
the triangles that are linking any two cones. It would be so much more
elegant if we could replace it with some naturality condition. But how?
We are no longer dealing with one cone but with a whole collection
(in fact, a category) of cones. If the limit exists (and — let’s make it
clear — there’s no guarantee of that), one of those cones is the universal
cone. For every other cone we have a unique factorizing morphism that
maps its apex, let’s call it 𝑐, to the apex of the universal cone, which we
named Lim𝐷. (In fact, I can skip the word “other”, because the identity
morphism maps the universal cone to itself and it trivially factorizes
through itself.) Let me repeat the important part: given any cone, there
is a unique morphism of a special kind. We have a mapping of cones to
special morphisms, and it’s a one-to-one mapping.
This special morphism is a member of the hom-set 𝐂(𝑐,Lim𝐷). The
other members of this hom-set are less fortunate, in the sense that they
don’t factorize the mapping of cones. What we want is to be able to
pick, for each 𝑐, one morphism from the set 𝐂(𝑐,Lim𝐷) — a morphism
that satisfies the particular commutativity condition. Does that sound
like defining a natural transformation? It most certainly does!
But what are the functors that are related by this transformation?
One functor is the mapping of 𝑐 to the set 𝐂(𝑐,Lim𝐷). It’s a func-
tor from 𝐂 to 𝐒𝐞𝐭 — it maps objects to sets. In fact it’s a contravariant
functor. Here’s how we define its action on morphisms: Let’s take a
190morphism 𝑓 from 𝑐′ to 𝑐:
𝑓 ∷ 𝑐′ → 𝑐
Our functor maps 𝑐′ to the set 𝐂(𝑐′,Lim𝐷). To define the action of this
functor on 𝑓 (in other words, to lift 𝑓), we have to define the corre-
sponding mapping between 𝐂(𝑐,Lim𝐷) and 𝐂(𝑐′,Lim𝐷). So let’s pick
one element 𝑢 of 𝐂(𝑐,Lim𝐷) and see if we can map it to some element
of 𝐂(𝑐′,Lim𝐷). An element of a hom-set is a morphism, so we have:
𝑢 ∷ 𝑐 → Lim𝐷
We can precompose 𝑢 with 𝑓 to get:
𝑢.𝑓 ∷ 𝑐′ → Lim𝐷
And that’s an element of 𝐂(𝑐′,Lim𝐷)— so indeed, we have found a
mapping of morphisms:
contramap :: (c' -> c) -> (c -> LimD) -> (c' -> LimD)
contramap f u = u . f
Notice the inversion in the order of 𝑐 and 𝑐′ characteristic of a con-
travariant functor.
191Todefineanaturaltransformation,weneedanotherfunctorthat’salsoa
mappingfrom𝐂to𝐒𝐞𝐭.Butthistimewe’llconsiderasetofcones.Cones
are just natural transformations, so we are looking at the set of natural
transformations𝑁𝑎𝑡(Δ𝑐,𝐷).Themappingfromc tothisparticularsetof
natural transformations is a (contravariant) functor. How can we show
that? Again, let’s define its action on a morphism:
𝑓 ∷ 𝑐′ → 𝑐
Theliftingof𝑓 shouldbeamappingofnaturaltransformationsbetween
two functors that go from 𝐈 to 𝐂:
𝑁𝑎𝑡(Δ𝑐,𝐷) → 𝑁𝑎𝑡(Δ𝑐′,𝐷)
Howdowemapnaturaltransformations?Everynaturaltransformation
is a selection of morphisms — its components — one morphism per el-
ement of 𝐈. A component of some 𝛼 (a member of 𝑁𝑎𝑡(Δ𝑐,𝐷)) at 𝑎 (an
object in 𝐈) is a morphism:
𝛼𝑎 ∷ Δ𝑐𝑎 → 𝐷𝑎
or, using the definition of the constant functor Δ,
𝛼𝑎 ∷ 𝑐 → 𝐷𝑎
Given 𝑓 and 𝛼, we have to construct a 𝛽, a member of 𝑁𝑎𝑡(Δ𝑐′,𝐷). Its
component at 𝑎 should be a morphism:
𝛽𝑎 ∷ 𝑐′ → 𝐷𝑎
We can easily get the latter (𝛽𝑎) from the former (𝛼𝑎) by precomposing
it with 𝑓:
𝛽𝑎 = 𝛼𝑎.𝑓
192It’s relatively easy to show that those components indeed add up to a
natural transformation.
Given our morphism 𝑓, we have thus built a mapping between two nat-
ural transformations, component-wise. This mapping defines contramap
for the functor:
𝑐 → 𝑁𝑎𝑡(Δ𝑐,𝐷)
What I have just done is to show you that we have two (contravariant)
functorsfrom𝐂to𝐒𝐞𝐭.Ihaven’tmadeanyassumptions—thesefunctors
always exist.
Incidentally, the first of these functors plays an important role in
category theory, and we’ll see it again when we talk about Yoneda’s
lemma. There is a name for contravariant functors from any category
𝐂 to 𝐒𝐞𝐭: they are called “presheaves”. This one is called a representable
presheaf. The second functor is also a presheaf.
Now that we have two functors, we can talk about natural transfor-
mations between them. So without further ado, here’s the conclusion:
A functor 𝐷 from 𝐈 to 𝐂 has a limit Lim𝐷 if and only if there is a natural
isomorphism between the two functors I have just defined:
𝐂(𝑐,Lim𝐷) ≃ 𝑁𝑎𝑡(Δ𝑐,𝐷)
193Let me remind you what a natural isomorphism is. It’s a natural trans-
formation whose every component is an isomorphism, that is to say an
invertible morphism.
I’m not going to go through the proof of this statement. The proce-
dure is pretty straightforward if not tedious. When dealing with natu-
ral transformations, you usually focus on components, which are mor-
phisms. In this case, since the target of both functors is 𝐒𝐞𝐭, the com-
ponents of the natural isomorphism will be functions. These are higher
order functions, because they go from the hom-set to the set of natu-
ral transformations. Again, you can analyze a function by considering
what it does to its argument: here the argument will be a morphism — a
memberof𝐂(𝑐,Lim𝐷)—andtheresultwillbeanaturaltransformation
— a member of 𝑁𝑎𝑡(Δ𝑐,𝐷), or what we have called a cone. This natural
transformation,inturn,hasitsowncomponents,whicharemorphisms.
So it’s morphisms all the way down, and if you can keep track of them,
you can prove the statement.
The most important result is that the naturality condition for this
isomorphism is exactly the commutativity condition for the mapping
of cones.
As a preview of coming attractions, let me mention that the set
𝑁𝑎𝑡(Δ𝑐,𝐷) can be thought of as a hom-set in the functor category; so
our natural isomorphism relates two hom-sets, which points at an even
more general relationship called an adjunction.
## 12.2 Examples of Limits
We’veseenthatthecategoricalproductisalimitofadiagramgenerated
by a simple category we called 𝟐.
194There is an even simpler example of a limit: the terminal object. The
first impulse would be to think of a singleton category as leading to
a terminal object, but the truth is even starker than that: the terminal
object is a limit generated by an empty category. A functor from an
empty category selects no object, so a cone shrinks to just the apex. The
universal cone is the lone apex that has a unique morphism coming to
it from any other apex. You will recognize this as the definition of the
terminal object.
The next interesting limit is called the equalizer. It’s a limit gen-
erated by a two-element category with two parallel morphisms going
between them (and, as always, the identity morphisms). This category
selects a diagram in 𝐂 consisting of two objects, 𝑎 and 𝑏, and two mor-
phisms:
f :: a -> b
g :: a -> b
To build a cone over this diagram, we have to add the apex, 𝑐 and two
projections:
p :: c -> a
q :: c -> b
195We have two triangles that must commute:
q = f . p
q = g . p
This tells us that 𝑞 is uniquely determined by one of these equations,
say, q = f . p, and we can omit it from the picture. So we are left with
just one condition:
f . p = g . p
The way to think about it is that, if we restrict our attention to 𝐒𝐞𝐭, the
image of the function 𝑝 selects a subset of 𝑎. When restricted to this
subset, the functions 𝑓 and 𝑔 are equal.
For instance, take 𝑎 to be the two-dimensional plane parameterized
by coordinates 𝑥 and 𝑦. Take 𝑏 to be the real line, and take:
f (x, y) = 2 * y + x
g (x, y) = y - x
The equalizer for these two functions is the set of real numbers (the
apex, 𝑐) and the function:
p t = (t, (-2) * t)
Notice that (𝑝 𝑡) defines a straight line in the two-dimensional plane.
Along this line, the two functions are equal.
Of course, there are other sets 𝑐′ and functions 𝑝′ that may lead to
the equality:
f . p' = g . p'
196but they all uniquely factor out through 𝑝. For instance, we can take the
singleton set () as 𝑐′ and the function:
p'() = (0, 0)
It’sagoodcone,because𝑓(0,0) = 𝑔(0,0).Butit’snotuniversal,because
of the unique factorization through ℎ:
p' = p . h
with
h () = 0
An equalizer can thus be used to solve equations of the type 𝑓 𝑥 = 𝑔 𝑥.
But it’s much more general, because it’s defined in terms of objects and
morphisms rather than algebraically.
An even more general idea of solving an equation is embodied in
another limit — the pullback. Here, we still have two morphisms that
we want to equate, but this time their domains are different. We start
with a three-object category of the shape: 1 → 2 ← 3. The diagram
197corresponding to this category consists of three objects, 𝑎, 𝑏, and 𝑐, and
two morphisms:
f :: a -> b
g :: c -> b
This diagram is often called a cospan.
A cone built on top of this diagram consists of the apex, 𝑑, and three
morphisms:
p :: d -> a
q :: d -> c
r :: d -> b
Commutativityconditionstellusthat𝑟 iscompletelydeterminedbythe
other morphisms, and can be omitted from the picture. So we are only
left with the following condition:
g . q = f . p
A pullback is a universal cone of this shape.
198Again,ifyounarrowyourfocusdowntosets,youcanthinkoftheobject
𝑑 as consisting of pairs of elements from 𝑎 and 𝑐 for which 𝑓 acting on
the first component is equal to 𝑔 acting on the second component. If
this is still too general, consider the special case in which 𝑔 is a constant
function, say 𝑔 _ = 1.23 (assuming that 𝑏 is a set of real numbers). Then
you are really solving the equation:
f x = 1.23
In this case, the choice of 𝑐 is irrelevant (as long as it’s not an empty
set), so we can take it to be a singleton set. The set 𝑎 could, for instance,
be the set of three-dimensional vectors, and 𝑓 the vector length. Then
the pullback is the set of pairs (𝑣,()), where 𝑣 is a vector of length 1.23
(a solution to the equation √(𝑥2 + 𝑦2 + 𝑧2) = 1.23), and () is the dummy
element of the singleton set.
Butpullbackshavemoregeneralapplications,alsoinprogramming.
For instance, consider C++ classes as a category in which morphism are
arrows that connect subclasses to superclasses. We’ll consider inheri-
tance a transitive property, so if C inherits from B and B inherits from A
then we’ll say that C inherits from A (after all, you can pass a pointer to C
199whereapointerto A isexpected).Also,we’llassumethat C inheritsfrom
C, so we have the identity arrow for every class. This way subclassing is
aligned with subtyping. C++ also supports multiple inheritance, so you
can construct a diamond inheritance diagram with two classes B and C
inheriting from A, and a fourth class D multiply inheriting from B and
C. Normally, D would get two copies of A, which is rarely desirable; but
you can use virtual inheritance to have just one copy of A in D.
What would it mean to have D be a pullback in this diagram? It
would mean that any class E that multiply inherits from B and C is also
a subclass of D. This is not directly expressible in C++, where subtyping
is nominal (the C++ compiler wouldn’t infer this kind of class relation-
ship — it would require “duck typing”). But we could go outside of the
subtyping relationship and instead ask whether a cast from E to D would
be safe or not. This cast would be safe if D were the bare-bone combina-
tion of B and C, with no additional data and no overriding of methods.
And, of course, there would be no pullback if there is a name conflict
between some methods of B and C.
200There’s also a more advanced use of a pullback in type inference. There
is often a need to unify types of two expressions. For instance, suppose
that the compiler wants to infer the type of a function:
twice f x = f (f x)
It will assign preliminary types to all variables and sub-expressions. In
particular, it will assign:
f :: t0
x :: t1
f x :: t2
f (f x) :: t3
from which it will deduce that:
twice :: t0 -> t1 -> t3
It will also come up with a set of constraints resulting from the rules of
function application:
t0 = t1 -> t2 -- because f is applied to x
t0 = t2 -> t3 -- because f is applied to (f x)
These constraints have to be unified by finding a set of types (or type
variables) that, when substituted forthe unknowntypes in both expres-
sions, produce the same type. One such substitution is:
t1 = t2 = t3 = Int
twice :: (Int -> Int) -> Int -> Int
but, obviously, it’s not the most general one. The most general substi-
tution is obtained using a pullback. I won’t go into the details, because
they are beyond the scope of this book, but you can convince yourself
that the result should be:
201twice :: (t -> t) -> t -> t
with t a free type variable.
## 12.3 Colimits
Just like all constructions in category theory, limits have their dual im-
age in opposite categories. When you invert the direction of all arrows
in a cone, you get a co-cone, and the universal one of those is called a
colimit. Notice that the inversion also affects the factorizing morphism,
which now flows from the universal co-cone to any other co-cone.
Cocone with a factorizing morphism ℎ connecting two apexes.
A typical example of a colimit is a coproduct, which corresponds to the
diagram generated by 𝟐, the category we’ve used in the definition of the
product.
202Both the product and the coproduct embody the essence of a pair of
objects, each in a different way.
Just like the terminal object was a limit, so the initial object is a
colimit corresponding to the diagram based on an empty category.
Thedualofthepullbackiscalledthepushout.It’sbasedonadiagram
called a span, generated by the category 1 ← 2 → 3.
## 12.4 Continuity
Isaidpreviouslythatfunctorscomeclosetotheideaofcontinuousmap-
pings of categories, in the sense that they never break existing connec-
tions (morphisms). The actual definition of a continuous functor 𝐹 from
a category 𝐂 to 𝐂′ includes the requirement that the functor preserve
limits. Every diagram 𝐷 in 𝐂 can be mapped to a diagram 𝐹 ∘𝐷 in 𝐂′ by
simply composing two functors. The continuity condition for 𝐹 states
that, if the diagram 𝐷 has a limit Lim𝐷, then the diagram 𝐹 ∘𝐷 also has
a limit, and it is equal to 𝐹(Lim𝐷).
203Notice that, because functors map morphisms to morphisms, and com-
positions to compositions, an image of a cone is always a cone. A com-
muting triangle is always mapped to a commuting triangle (functors
preserve composition). The same is true for the factorizing morphisms:
the image of a factorizing morphism is also a factorizing morphism. So
every functor is almost continuous. What may go wrong is the unique-
ness condition. The factorizing morphism in 𝐂′ might not be unique.
There may also be other “better cones” in 𝐂′ that were not available in
𝐂.
Ahom-functorisanexampleofacontinuousfunctor.Recallthatthe
hom-functor, 𝐂(𝑎,𝑏), is contravariant in the first variable and covariant
in the second. In other words, it’s a functor:
𝐂𝑜𝑝 × 𝐂 → 𝐒𝐞𝐭
Whenitssecondargumentisfixed,thehom-setfunctor(whichbecomes
therepresentablepresheaf)mapscolimitsin𝐂tolimitsin𝐒𝐞𝐭;andwhen
its first argument is fixed, it maps limits to limits.
InHaskell,ahom-functoristhemappingofanytwotypestoafunc-
tion type, so it’s just a parameterized function type. When we fix the
second parameter, let’s say to String, we get the contravariant functor:
newtype ToString a = ToString (a -> String)
instance Contravariant ToString where
contramap f (ToString g) = ToString (g . f)
204Continuity means that when ToString is applied to a colimit, for in-
stance a coproduct Either b c, it will produce a limit; in this case a
product of two function types:
ToString (Either b c) ~ (b -> String, c -> String)
Indeed, any function of Either b c is implemented as a case statement
with the two cases being serviced by a pair of functions.
Similarly, when we fix the first argument of the hom-set, we get
the familiar reader functor. Its continuity means that, for instance, any
function returning a product is equivalent to a product of functions; in
particular:
r -> (a, b) ~ (r -> a, r -> b)
I know what you’re thinking: You don’t need category theory to figure
these things out. And you’re right! Still, I find it amazing that such re-
sults can be derived from first principles with no recourse to bits and
bytes, processor architectures, compiler technologies, or even lambda
calculus.
If you’re curious where the names “limit” and “continuity” come
from, they are a generalization of the corresponding notions from cal-
culus. In calculus limits and continuity are defined in terms of open
neighborhoods. Open sets, which define topology, form a category (a
poset).
## 12.5 Challenges
1. HowwouldyoudescribeapushoutinthecategoryofC++classes?
2. Show that the limit of the identity functor Id ∷ 𝐂 → 𝐂 is the
initial object.
2053. Subsets of a given set form a category. A morphism in that cate-
gory is defined to be an arrow connecting two sets if the first is
the subset of the second. What is a pullback of two sets in such
a category? What’s a pushout? What are the initial and terminal
objects?
4. Can you guess what a coequalizer is?
5. Show that, in a category with a terminal object, a pullback to-
wards the terminal object is a product.
6. Similarly,showthatapushoutfromaninitialobject(ifoneexists)
is the coproduct.
20613
Free Monoids
Monoids are an important concept in both category theory and
in programming. Categories correspond to strongly typed langua-
ges, monoids to untyped languages. That’s because in a monoid you
can compose any two arrows, just as in an untyped language you can
compose any two functions (of course, you may end up with a runtime
error when you execute your program).
We’ve seen that a monoid may be described as a category with a
single object, where all logic is encoded in the rules of morphism com-
position. This categorical model is fully equivalent to the more tradi-
tional set-theoretical definition of a monoid, where we “multiply” two
elements of a set to get a third element. This process of “multiplication”
can be further dissected into first forming a pair of elements and then
identifying this pair with an existing element — their “product.”
What happens when we forgo the second part of multiplication —
the identification of pairs with existing elements? We can, for instance,
207start with an arbitrary set, form all possible pairs of elements, and call
themnewelements.Thenwe’llpairthesenewelementswithallpossible
elements, and so on. This is a chain reaction — we’ll keep adding new
elements forever. The result, an infinite set, will be almost a monoid.
But a monoid also needs a unit element and the law of associativity. No
problem, we can add a special unit element and identify some of the
pairs — just enough to support the unit and associativity laws.
Let’sseehowthisworksinasimpleexample.Let’sstartwithasetof
two elements, {𝑎,𝑏}. We’ll call them the generators of the free monoid.
First, we’ll add a special element 𝑒 to serve as the unit. Next we’ll add all
the pairs of elements and call them “products”. The product of 𝑎 and 𝑏
will be the pair (𝑎,𝑏). The product of 𝑏 and 𝑎 will be the pair (𝑏,𝑎), the
product of 𝑎 with 𝑎 will be (𝑎,𝑎), the product of 𝑏 with 𝑏 will be (𝑏,𝑏).
We can also form pairs with 𝑒, like (𝑎,𝑒), (𝑒,𝑏), etc., but we’ll identify
themwith𝑎,𝑏,etc.Sointhisroundwe’llonlyadd(𝑎,𝑎),(𝑎,𝑏)and(𝑏,𝑎)
and (𝑏,𝑏), and end up with the set {𝑒,𝑎,𝑏,(𝑎,𝑎),(𝑎,𝑏),(𝑏,𝑎),(𝑏,𝑏)}.
208In the next round we’ll keep adding elements like: (𝑎,(𝑎,𝑏)), ((𝑎,𝑏),𝑎),
etc. At this point we’ll have to make sure that associativity holds, so
we’ll identify (𝑎,(𝑏,𝑎)) with ((𝑎,𝑏),𝑎), etc. In other words, we won’t
be needing internal parentheses.
You can guess what the final result of this process will be: we’ll cre-
ate all possible lists of 𝑎s and 𝑏s. In fact, if we represent 𝑒 as an empty
list, we can see that our “multiplication” is nothing but list concatena-
tion.
This kind of construction, in which you keep generating all pos-
sible combinations of elements, and perform the minimum number of
identifications — just enough to uphold the laws — is called a free con-
struction. What we have just done is to construct a free monoid from
the set of generators {𝑎,𝑏}.
## 13.1 Free Monoid in Haskell
A two-element set in Haskell is equivalent to the type Bool, and the free
monoid generated by this set is equivalent to the type [Bool] (list of
Bool). (I am deliberately ignoring problems with infinite lists.)
A monoid in Haskell is defined by the type class:
class Monoid m where
mempty :: m
mappend :: m -> m -> m
This just says that every Monoid must have a neutral element, which is
called mempty, and a binary function (multiplication) called mappend. The
unit and associativity laws cannot be expressed in Haskell and must be
verified by the programmer every time a monoid is instantiated.
The fact that a list of any type forms a monoid is described by this
instance definition:
209instance Monoid [a] where
mempty = []
mappend = (++)
It states that an empty list [] is the unit element, and list concatenation
(++) is the binary operation.
As we have seen, a list of type a corresponds to a free monoid with
the set a serving as generators. The set of natural numbers with mul-
tiplication is not a free monoid, because we identify lots of products.
Compare for instance:
2 * 3 = 6
[2] ++ [3] = [2, 3] // not the same as [6]
Thatwaseasy,butthequestionis,canweperformthisfreeconstruction
in category theory, where we are not allowed to look inside objects?
We’ll use our workhorse: the universal construction.
The second interesting question is, can any monoid be obtained
from some free monoid by identifying more than the minimum number
ofelementsrequiredbythelaws?I’llshowyouthatthisfollowsdirectly
from the universal construction.
## 13.2 Free Monoid Universal Construction
Ifyou recall our previousexperiences with universalconstructions, you
might notice that it’s not so much about constructing something as
about selecting an object that best fits a given pattern. So if we want
to use the universal construction to “construct” a free monoid, we have
to consider a whole bunch of monoids from which to pick one. We need
a whole category of monoids to chose from. But do monoids form a
category?
210Let’sfirstlookatmonoidsassetsequippedwithadditionalstructure
defined by unit and multiplication. We’ll pick as morphisms those func-
tions that preserve the monoidal structure. Such structure-preserving
functions are called homomorphisms. A monoid homomorphism must
map the product of two elements to the product of the mapping of the
two elements:
h (a * b) = h a * h b
and it must map unit to unit.
For instance, consider a homomorphism from lists of integers to in-
tegers. If we map [2] to 2 and [3] to 3, we have to map [2, 3] to 6,
because concatenation
[2] ++ [3] = [2, 3]
becomes multiplication
2 * 3 = 6
Now let’s forget about the internal structure of individual monoids, and
only look at them as objects with corresponding morphisms. You get a
category 𝐌𝐨𝐧 of monoids.
Okay, maybe before we forget about internal structure, let us notice
an important property. Every object of 𝐌𝐨𝐧 can be trivially mapped to
a set. It’s just the set of its elements. This set is called the underlying set.
Infact,notonlycanwemapobjectsof𝐌𝐨𝐧tosets,butwecanalsomap
morphisms of 𝐌𝐨𝐧 (homomorphisms) to functions. Again, this seems
sort of trivial, but it will become useful soon. This mapping of objects
and morphisms from 𝐌𝐨𝐧 to 𝐒𝐞𝐭 is in fact a functor. Since this functor
“forgets” the monoidal structure — once we are inside a plain set, we
211no longer distinguish the unit element or care about multiplication —
it’s called a forgetful functor. Forgetful functors come up regularly in
category theory.
We now have two different views of 𝐌𝐨𝐧. We can treat it just like
any other category with objects and morphisms. In that view, we don’t
see the internal structure of monoids. All we can say about a particular
object in 𝐌𝐨𝐧 is that it connects to itself and to other objects through
morphisms. The “multiplication” table of morphisms — the composition
rules — are derived from the other view: monoids-as-sets. By going to
category theory we haven’t lost this view completely — we can still
access it through our forgetful functor.
To apply the universal construction, we need to define a special
property that would let us search through the category of monoids and
pick the best candidate for a free monoid. But a free monoid is defined
by its generators. Different choices of generators produce different free
monoids (a list of Bool is not the same as a list of Int). Our construction
must start with a set of generators. So we’re back to sets!
That’s where the forgetful functor comes into play. We can use it to
X-ray our monoids. We can identify the generators in the X-ray images
of those blobs. Here’s how it works:
We start with a set of generators, 𝑥. That’s a set in 𝐒𝐞𝐭.
The pattern we are going to match consists of a monoid 𝑚 — an
object of 𝐌𝐨𝐧 — and a function 𝑝 in 𝐒𝐞𝐭:
p :: x -> U m
where 𝑈 is our forgetful functor from 𝐌𝐨𝐧 to 𝐒𝐞𝐭. This is a weird het-
erogeneous pattern — half in 𝐌𝐨𝐧 and half in 𝐒𝐞𝐭.
The idea is that the function 𝑝 will identify the set of generators
inside the X-ray image of 𝑚. It doesn’t matter that functions may be
212lousy at identifying points inside sets (they may collapse them). It will
all be sorted out by the universal construction, which will pick the best
representative of this pattern.
We also have to define the ranking among candidates. Suppose we have
another candidate: a monoid 𝑛 and a function that identifies the gener-
ators in its X-ray image:
q :: x -> U n
We’llsaythat𝑚isbetterthan𝑛ifthereisamorphismofmonoids(that’s
a structure-preserving homomorphism):
h :: m -> n
whose image under 𝑈 (remember, 𝑈 is a functor, so it maps morphisms
to functions) factorizes through 𝑝:
q = U h . p
If you think of 𝑝 as selecting the generators in 𝑚; and 𝑞 as selecting
“the same” generators in 𝑛; then you can think of ℎ as mapping these
generators between the two monoids. Remember that ℎ, by definition,
213preserves the monoidal structure. It means that a product of two gener-
ators in one monoid will be mapped to a product of the corresponding
two generators in the second monoid, and so on.
This ranking may be used to find the best candidate — the free monoid.
Here’s the definition:
We’ll say that 𝑚 (together with the function 𝑝) is the free
monoidwiththegenerators𝑥 ifandonlyifthereisaunique
morphism ℎ from 𝑚 to any other monoid 𝑛 (together with
the function 𝑞) that satisfies the above factorization prop-
erty.
Incidentally, this answers our second question. The function 𝑈ℎ is the
one that has the power to collapse multiple elements of 𝑈𝑚 to a single
element of 𝑈𝑛. This collapse corresponds to identifying some elements
of the free monoid. Therefore any monoid with generators 𝑥 can be
obtained from the free monoid based on 𝑥 by identifying some of the
elements. The free monoid is the one where only the bare minimum of
identifications have been made.
We’ll come back to free monoids when we talk about adjunctions.
21413.3 Challenges
1. You might think (as I did, originally) that the requirement that a
homomorphism of monoids preserve the unit is redundant. After
all, we know that for all 𝑎
h a * h e = h (a * e) = h a
So ℎ𝑒 acts like a right unit (and, by analogy, as a left unit). The
problem is that ℎ𝑎, for all 𝑎 might only cover a sub-monoid of the
target monoid. There may be a “true” unit outside of the image
of ℎ. Show that an isomorphism between monoids that preserves
multiplication must automatically preserve unit.
2. Consider a monoid homomorphism from lists of integers with
concatenation to integers with multiplication. What is the image
of the empty list []? Assume that all singleton lists are mapped to
the integers they contain, that is [3] is mapped to 3, etc. What’s
the image of [1, 2, 3, 4]? How many different lists map to the
integer 12? Is there any other homomorphism between the two
monoids?
3. Whatisthefreemonoidgeneratedbyaone-elementset?Canyou
see what it’s isomorphic to?
21514
Representable Functors
It’s about time we had a little talk about sets. Mathematicians have
a love/hate relationship with set theory. It’s the assembly language of
mathematics — at least it used to be. Category theory tries to step away
from set theory, to some extent. For instance, it’s a known fact that the
setofallsetsdoesn’texist,butthecategoryofallsets,𝐒𝐞𝐭,does.Sothat’s
good. On the other hand, we assume that morphisms between any two
objects in a category form a set. We even called it a hom-set. To be
fair, there is a branch of category theory where morphisms don’t form
sets. Instead they are objects in another category. Those categories that
use hom-objects rather than hom-sets, are called enriched categories. In
what follows, though, we’ll stick to categories with good old-fashioned
hom-sets.
A set is the closest thing to a featureless blob you can get outside of
categorical objects. A set has elements, but you can’t say much about
these elements. If you have a finite set, you can count the elements. You
216cankindofcounttheelementsofaninfinitesetusingcardinalnumbers.
The set of natural numbers, for instance, is smaller than the set of real
numbers, even though both are infinite. But, maybe surprisingly, a set
of rational numbers is the same size as the set of natural numbers.
Other than that, all the information about sets can be encoded in
functions between them — especially the invertible ones called isomor-
phisms. For all intents and purposes isomorphic sets are identical. Be-
foreIsummonthewrathoffoundationalmathematicians,letmeexplain
that the distinction between equality and isomorphism is of fundamen-
tal importance. In fact it is one of the main concerns of the latest branch
of mathematics, the Homotopy Type Theory (HoTT). I’m mentioning
HoTT because it’s a pure mathematical theory that takes inspiration
from computation, and one of its main proponents, Vladimir Voevod-
sky, had a major epiphany while studying the Coq theorem prover. The
interaction between mathematics and programming goes both ways.
The important lesson about sets is that it’s okay to compare sets of
unlike elements. For instance, we can say that a given set of natural
transformations is isomorphic to some set of morphisms, because a set
is just a set. Isomorphism in this case just means that for every natural
transformation from one set there is a unique morphism from the other
setandviceversa.Theycanbepairedagainsteachother.Youcan’tcom-
pare apples with oranges, if they are objects from different categories,
but you can compare sets of apples against sets of oranges. Often trans-
forming a categorical problem into a set-theoretical problem gives us
the necessary insight or even lets us prove valuable theorems.
21714.1 The Hom Functor
Every category comes equipped with a canonical family of mappings to
𝐒𝐞𝐭. Those mappings are in fact functors, so they preserve the structure
of the category. Let’s build one such mapping.
Let’s fix one object 𝑎 in 𝐂 and pick another object 𝑥 also in 𝐂. The
hom-set 𝐂(𝑎,𝑥) is a set, an object in 𝐒𝐞𝐭. When we vary 𝑥, keeping 𝑎
fixed, 𝐂(𝑎,𝑥) will also vary in 𝐒𝐞𝐭. Thus we have a mapping from 𝑥 to
𝐒𝐞𝐭.
If we want to stress the fact that we are considering the hom-set as a
mapping in its second argument, we use the notation 𝐂(𝑎,−) with the
dash serving as the placeholder for the argument.
This mapping of objects is easily extended to the mapping of mor-
phisms. Let’s take a morphism 𝑓 in 𝐂 between two arbitrary objects
𝑥 and 𝑦. The object 𝑥 is mapped to the set 𝐂(𝑎,𝑥), and the object 𝑦
is mapped to 𝐂(𝑎,𝑦), under the mapping we have just defined. If this
mapping is to be a functor, 𝑓 must be mapped to a function between the
two sets: 𝐂(𝑎,𝑥) → 𝐂(𝑎,𝑦)
Let’sdefinethisfunctionpoint-wise,thatisforeachargumentsepa-
rately. For the argument we should pick an arbitrary element of 𝐂(𝑎,𝑥)
— let’s call it ℎ. Morphisms are composable, if they match end to end. It
so happens that the target of ℎ matches the source of 𝑓, so their com-
218position:
𝑓 ∘ ℎ ∷ 𝑎 → 𝑦
is a morphism going from 𝑎 to 𝑦. It is therefore a member of 𝐂(𝑎,𝑦).
We have just found our function from 𝐂(𝑎,𝑥) to 𝐂(𝑎,𝑦), which can
serve as the image of 𝑓. If there is no danger of confusion, we’ll write
this lifted function as: 𝐂(𝑎,𝑓) and its action on a morphism ℎ as:
𝐂(𝑎,𝑓)ℎ = 𝑓 ∘ ℎ
Since this construction works in any category, it must also work in the
category of Haskell types. In Haskell, the hom-functor is better known
as the Reader functor:
type Reader a x = a -> x
instance Functor (Reader a) where
fmap f h = f . h
Now let’s consider what happens if, instead of fixing the source of the
hom-set, we fix the target. In other words, we’re asking the question
if the mapping 𝐂(−,𝑎) is also a functor. It is, but instead of being co-
variant, it’s contravariant. That’s because the same kind of matching
219of morphisms end to end results in postcomposition by 𝑓; rather than
precomposition, as was the case with 𝐂(𝑎,−).
WehavealreadyseenthiscontravariantfunctorinHaskell.Wecalled
it Op:
type Op a x = x -> a
instance Contravariant (Op a) where
contramap f h = h . f
Finally, if we let both objects vary, we get a profunctor 𝐂(−,=), which is
contravariant in the first argument and covariant in the second (to un-
derlinethefactthatthetwoargumentsmayvaryindependently,weuse
a double dash as the second placeholder). We have seen this profunctor
before, when we talked about functoriality:
instance Profunctor (->) where
dimap ab cd bc = cd . bc . ab
lmap = flip (.)
rmap = (.)
The important lesson is that this observation holds in any category: the
mapping of objects to hom-sets is functorial. Since contravariance is
equivalent to a mapping from the opposite category, we can state this
fact succinctly as:
𝐶(−,=) ∷ 𝐂𝑜𝑝 × 𝐂 → 𝐒𝐞𝐭
## 14.2 Representable Functors
We’ve seen that, for every choice of an object 𝑎 in 𝐂, we get a functor
from 𝐂 to 𝐒𝐞𝐭. This kind of structure-preserving mapping to 𝐒𝐞𝐭 is often
220called a representation. We are representing objects and morphisms of
𝐂 as sets and functions in 𝐒𝐞𝐭.
The functor 𝐂(𝑎,−) itself is sometimes called representable. More
generally,anyfunctor𝐹 thatisnaturallyisomorphictothehom-functor,
for some choice of 𝑎, is called representable. Such functor must neces-
sarily be 𝐒𝐞𝐭-valued, since 𝐂(𝑎,−) is.
I said before that we often think of isomorphic sets as identical.
More generally, we think of isomorphic objects in a category as iden-
tical. That’s because objects have no structure other than their relation
to other objects (and themselves) through morphisms.
Forinstance,we’vepreviouslytalkedaboutthecategoryofmonoids,
𝐌𝐨𝐧, that was initially modeled with sets. But we were careful to pick
as morphisms only those functions that preserved the monoidal struc-
ture of those sets. So if two objects in 𝐌𝐨𝐧 are isomorphic, meaning
there is an invertible morphism between them, they have exactly the
same structure. If we peeked at the sets and functions that they were
based upon, we’d see that the unit element of one monoid was mapped
to the unit element of another, and that a product of two elements was
mapped to the product of their mappings.
The same reasoning can be applied to functors. Functors between
two categories form a category in which natural transformations play
the role of morphisms. So two functors are isomorphic, and can be
thought of as identical, if there is an invertible natural transformation
between them.
Let’s analyze the definition of the representable functor from this
perspective.For𝐹 toberepresentablewerequirethat:Therebeanobject
𝑎 in 𝐂; one natural transformation α from 𝐂(𝑎,−) to 𝐹; another natural
transformation, β, in the opposite direction; and that their composition
be the identity natural transformation.
221Let’s look at the component of α at some object 𝑥. It’s a function in
𝐒𝐞𝐭:
𝛼𝑥 ∷ 𝐂(𝑎,𝑥) → 𝐹𝑥
The naturality condition for this transformation tells us that, for any
morphism 𝑓 from 𝑥 to 𝑦, the following diagram commutes:
𝐹𝑓 ∘ 𝛼𝑥 = 𝛼𝑦 ∘ 𝐂(𝑎,𝑓)
InHaskell,wewouldreplacenaturaltransformationswithpolymorphic
functions:
alpha :: forall x. (a -> x) -> F x
with the optional forall quantifier. The naturality condition
fmap f . alpha = alpha . fmap f
is automatically satisfied due to parametricity (it’s one of those the-
orems for free I mentioned earlier), with the understanding that fmap
on the left is defined by the functor 𝐹, whereas the one on the right is
defined by the reader functor. Since fmap for reader is just function pre-
composition, we can be even more explicit. Acting on ℎ, an element of
𝐂(𝑎,𝑥), the naturality condition simplifies to:
fmap f (alpha h) = alpha (f . h)
The other transformation, beta, goes the opposite way:
beta :: forall x. F x -> (a -> x)
Itmustrespectnaturalityconditions,anditmustbetheinverseofalpha:
222alpha . beta = id = beta . alpha
We will see later that a natural transformation from 𝐂(𝑎,−) to any 𝐒𝐞𝐭-
valued functor always exists (Yoneda’s lemma) but it is not necessarily
invertible.
Let me give you an example in Haskell with the list functor and Int
as a. Here’s a natural transformation that does the job:
alpha :: forall x. (Int -> x) -> [x]
alpha h = map h [12]
I have arbitrarily picked the number 12 and created a singleton list with
it. I can then fmap the function h over this list and get a list of the type
returnedbyh.(Thereareactuallyasmanysuchtransformationsasthere
are list of integers.)
The naturality condition is equivalent to the composability of map
(the list version of fmap):
map f (map h [12]) = map (f . h) [12]
But if we tried to find the inverse transformation, we would have to go
from a list of arbitrary type x to a function returning x:
beta :: forall x. [x] -> (Int -> x)
You might think of retrieving an x from the list, e.g., using head, but
that won’t work for an empty list. Notice that there is no choice for the
type a (in place of Int) that would work here. So the list functor is not
representable.
Remember when we talked about Haskell (endo-) functors being
a little like containers? In the same vein we can think of representable
223functorsascontainersforstoringmemoizedresultsoffunctioncalls(the
members of hom-sets in Haskell are just functions). The representing
object, the type 𝑎 in 𝐂(𝑎,−), is thought of as the key type, with which
we can access the tabulated values of a function. The transformation
we called alpha is called tabulate, and its inverse, beta, is called index.
Here’s a (slightly simplified) Representable class definition:
class Representable f where
type Rep f :: *
tabulate :: (Rep f -> x) -> f x
index :: f x -> Rep f -> x
Notice that the representing type, our 𝑎, which is called Rep f here, is
part of the definition of Representable. The star just means that Rep f
is a type (as opposed to a type constructor, or other more exotic kinds).
Infinite lists, or streams, which cannot be empty, are representable.
data Stream x = Cons x (Stream x)
You can think of them as memoized values of a function taking an
Integer asanargument.(Strictlyspeaking,Ishouldbeusingnon-negative
natural numbers, but I didn’t want to complicate the code.)
To tabulate such a function, you create an infinite stream of values.
Of course, this is only possible because Haskell is lazy. The values are
evaluated on demand. You access the memoized values using index:
instance Representable Stream where
type Rep Stream = Integer
tabulate f = Cons (f 0) (tabulate (f . (+1)))
index (Cons b bs) n = if n == 0 then b else index bs (n - 1)
224It’s interesting that you can implement a single memoization scheme to
cover a whole family of functions with arbitrary return types.
Representability for contravariant functors is similarly defined, ex-
cept that we keep the second argument of 𝐂(−,𝑎) fixed. Or, equiva-
lently, we may consider functors from 𝐂𝑜𝑝 to 𝐒𝐞𝐭, because 𝐂𝑜𝑝(𝑎,−) is
the same as 𝐂(−,𝑎).
Thereisaninterestingtwisttorepresentability.Rememberthathom-
sets can internally be treated as exponential objects, in Cartesian closed
categories. The hom-set 𝐂(𝑎,𝑥) is equivalent to 𝑥𝑎, and for a repre-
sentable functor 𝐹 we can write: −𝑎 = 𝐹.
Let’s take the logarithm of both sides, just for kicks: 𝑎 = log𝐹
Of course, this is a purely formal transformation, but if you know
some of the properties of logarithms, it is quite helpful. In particular, it
turns out that functors that are based on product types can be repre-
sented with sum types, and that sum-type functors are not in general
representable (example: the list functor).
Finally,noticethatarepresentablefunctorgivesustwodifferentim-
plementations of the same thing — one a function, one a data structure.
They have exactly the same content — the same values are retrieved us-
ing the same keys. That’s the sense of “sameness” I was talking about.
Two naturally isomorphic functors are identical as far as their contents
are involved. On the other hand, the two representations are often im-
plemented differently and may have different performance characteris-
tics. Memoization is used as a performance enhancement and may lead
to substantially reduced run times. Being able to generate different rep-
resentations of the same underlying computation is very valuable in
practice. So, surprisingly, even though it’s not concerned with perfor-
mance at all, category theory provides ample opportunities to explore
alternative implementations that have practical value.
22514.3 Challenges
1. Show that the hom-functors map identity morphisms in C to cor-
responding identity functions in 𝐒𝐞𝐭.
2. Show that Maybe is not representable.
3. Is the Reader functor representable?
4. Using Stream representation, memoize a function that squares its
argument.
5. Show that tabulate and index for Stream are indeed the inverse
of each other. (Hint: use induction.)
6. The functor:
Pair a = Pair a a
is representable. Can you guess the type that represents it? Im-
plement tabulate and index.
## 14.4 Bibliography
1. The Catsters video about representable functors1.
1https://www.youtube.com/watch?v=4QgjKUzyrhM
22615
The Yoneda Lemma
Most constructions in category theory are generalizations of re-
sults from other more specific areas of mathematics. Things like
products,coproducts,monoids,exponentials,etc.,havebeenknownlong
before category theory. They might have been known under different
names in different branches of mathematics. A Cartesian product in set
theory, a meet in order theory, a conjunction in logic — they are all
specific examples of the abstract idea of a categorical product.
The Yoneda lemma stands out in this respect as a sweeping state-
ment about categories in general with little or no precedent in other
branches of mathematics. Some say that its closest analog is Cayley’s
theorem in group theory (every group is isomorphic to a permutation
group of some set).
ThesettingfortheYonedalemmaisanarbitrarycategory𝐂together
with a functor 𝐹 from 𝐂 to 𝐒𝐞𝐭. We’ve seen in the previous section that
some𝐒𝐞𝐭-valuedfunctorsarerepresentable,thatisisomorphictoahom-
227functor. The Yoneda lemma tells us that all 𝐒𝐞𝐭-valued functors can be
obtainedfromhom-functorsthroughnaturaltransformations,anditex-
plicitly enumerates all such transformations.
When I talked about natural transformations, I mentioned that the
naturality condition can be quite restrictive. When you define a compo-
nent of a natural transformation at one object, naturality may be strong
enough to “transport” this component to another object that is con-
nected to it through a morphism. The more arrows between objects in
the source and the target categories there are, the more constraints you
have for transporting the components of natural transformations. 𝐒𝐞𝐭
happens to be a very arrow-rich category.
The Yoneda lemma tells us that a natural transformation between
a hom-functor and any other functor 𝐹 is completely determined by
specifying the value of its single component at just one point! The rest
of the natural transformation just follows from naturality conditions.
So let’s review the naturality condition between the two functors
involved in the Yoneda lemma. The first functor is the hom-functor. It
maps any object 𝑥 in 𝐂 to the set of morphisms 𝐂(𝑎,𝑥) — for 𝑎 a fixed
object in 𝐂. We’ve also seen that it maps any morphism 𝑓 from 𝑥 → 𝑦
to 𝐂(𝑎,𝑓).
The second functor is an arbitrary 𝐒𝐞𝐭-valued functor 𝐹.
Let’s call the natural transformation between these two functors 𝛼.
Because we are operating in 𝐒𝐞𝐭, the components of the natural trans-
formation, like 𝛼𝑥 or 𝛼𝑦, are just regular functions between sets:
𝛼𝑥 ∷ 𝐂(𝑎,𝑥) → 𝐹𝑥
𝛼𝑦 ∷ 𝐂(𝑎,𝑦) → 𝐹𝑦
228And because these are just functions, we can look at their values at
specific points. But what’s a point in the set 𝐂(𝑎,𝑥)? Here’s the key
observation: Every point in the set 𝐂(𝑎,𝑥) is also a morphism ℎ from 𝑎
to 𝑥.
So the naturality square for 𝛼:
𝛼𝑦 ∘ 𝐂(𝑎,𝑓) = 𝐹𝑓 ∘ 𝛼𝑥
becomes, point-wise, when acting on ℎ:
𝛼𝑦(𝐂(𝑎,𝑓)ℎ) = (𝐹𝑓)(𝛼𝑥ℎ)
You might recall from the previous section that the action of the hom-
functor 𝐂(𝑎,−) on a morphism 𝑓 was defined as precomposition:
𝐂(𝑎,𝑓)ℎ = 𝑓 ∘ ℎ
which leads to:
𝛼𝑦(𝑓 ∘ ℎ) = (𝐹𝑓)(𝛼𝑥ℎ)
Just how strong this condition is can be seen by specializing it to the
case of 𝑥 = 𝑎.
229In that case ℎ becomes a morphism from 𝑎 to 𝑎. We know that there is
at least one such morphism, ℎ = id𝑎. Let’s plug it in:
𝛼𝑦𝑓 = (𝐹𝑓)(𝛼𝑎id𝑎)
Notice what has just happened: The left hand side is the action of 𝛼𝑦
on an arbitrary element 𝑓 of 𝐂(𝑎,𝑦). And it is totally determined by the
singlevalueof𝛼𝑎 atid𝑎.Wecanpickanysuchvalueanditwillgenerate
a natural transformation. Since the values of 𝛼𝑎 are in the set 𝐹𝑎, any
point in 𝐹𝑎 will define some 𝛼.
Conversely, given any natural transformation 𝛼 from 𝐂(𝑎,−) to 𝐹,
you can evaluate it at id𝑎 to get a point in 𝐹𝑎.
We have just proven the Yoneda lemma:
Thereisaone-to-onecorrespondencebetweennaturaltrans-
formations from 𝐂(𝑎,−) to 𝐹 and elements of 𝐹𝑎.
in other words,
𝐍𝐚𝐭(𝐂(𝑎,−),𝐹) ≅ 𝐹𝑎
Or,ifweusethenotation[𝐂,𝐒𝐞𝐭]forthefunctorcategorybetween𝐂and
𝐒𝐞𝐭, the set of natural transformation is just a hom-set in that category,
and we can write:
[𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐹) ≅ 𝐹𝑎
230I’ll explain later how this correspondence is in fact a natural isomor-
phism.
Nowlet’strytogetsomeintuitionaboutthisresult.Themostamaz-
ing thing is that the whole natural transformation crystallizes from just
one nucleation site: the value we assign to it at id𝑎. It spreads from that
point following the naturality condition. It floods the image of 𝐂 in 𝐒𝐞𝐭.
So let’s first consider what the image of 𝐂 is under 𝐂(𝑎,−).
Let’sstartwith theimageof𝑎 itself.Underthehom-functor𝐂(𝑎,−),
𝑎 is mapped to the set 𝐂(𝑎,𝑎). Under the functor 𝐹, on the other hand, it
ismappedtotheset𝐹𝑎.Thecomponentofthenaturaltransformation𝛼𝑎
is some function from 𝐂(𝑎,𝑎) to 𝐹𝑎. Let’s focus on just one point in the
set 𝐂(𝑎,𝑎), the point corresponding to the morphism id𝑎. To emphasize
the fact that it’s just a point in a set, let’s call it 𝑝. The component 𝛼𝑎
should map 𝑝 to some point 𝑞 in 𝐹𝑎. I’ll show you that any choice of 𝑞
leads to a unique natural transformation.
The first claim is that the choice of one point 𝑞 uniquely determines the
rest of the function 𝛼𝑎. Indeed, let’s pick any other point, 𝑝′ in 𝐂(𝑎,𝑎),
corresponding to some morphism 𝑔 from 𝑎 to 𝑎. And here’s where the
magic of the Yoneda lemma happens: 𝑔 can be viewed as a point 𝑝′ in
231the set 𝐂(𝑎,𝑎). At the same time, it selects two functions between sets.
Indeed,underthehom-functor,themorphism𝑔 ismappedtoafunction
𝐂(𝑎,𝑔); and under 𝐹 it’s mapped to 𝐹𝑔.
Now let’s consider the action of 𝐂(𝑎,𝑔) on our original 𝑝 which, as you
remember, corresponds to id𝑎. It is defined as precomposition, 𝑔 ∘ id𝑎,
whichisequalto𝑔,whichcorrespondstoourpoint𝑝′.Sothemorphism
𝑔 is mapped to a function that, when acting on 𝑝 produces 𝑝′, which is
𝑔. We have come full circle!
Now consider the action of 𝐹𝑔 on 𝑞. It is some 𝑞′, a point in 𝐹𝑎. To
complete the naturality square, 𝑝′ must be mapped to 𝑞′ under 𝛼𝑎. We
picked an arbitrary 𝑝′ (an arbitrary 𝑔) and derived its mapping under
𝛼𝑎. The function 𝛼𝑎 is thus completely determined.
The second claim is that 𝛼𝑥 is uniquely determined for any object 𝑥
in 𝐂 that is connected to 𝑎. The reasoning is analogous, except that now
we have two more sets, 𝐂(𝑎,𝑥) and 𝐹𝑥, and the morphism 𝑔 from 𝑎 to
𝑥 is mapped, under the hom-functor, to:
𝐂(𝑎,𝑔) ∷ 𝐂(𝑎,𝑎) → 𝐂(𝑎,𝑥)
and under 𝐹 to:
𝐹𝑔 ∷ 𝐹𝑎 → 𝐹𝑥
232Again, 𝐂(𝑎,𝑔) acting on our 𝑝 is given by the precomposition: 𝑔 ∘ id𝑎,
which corresponds to a point 𝑝′ in 𝐂(𝑎,𝑥). Naturality determines the
value of 𝛼𝑥 acting on 𝑝′ to be:
𝑞′ = (𝐹𝑔)𝑞
Since 𝑝′ was arbitrary, the whole function 𝛼𝑥 is thus determined.
What if there are objects in 𝐂 that have no connection to 𝑎? They are
all mapped under 𝐂(𝑎,−) to a single set — the empty set. Recall that
the empty set is the initial object in the category of sets. It means that
there is a unique function from this set to any other set. We called this
function absurd. So here, again, we have no choice for the component
of the natural transformation: it can only be absurd.
One way of understanding the Yoneda lemma is to realize that nat-
ural transformations between 𝐒𝐞𝐭-valued functors are just families of
functions, and functions are in general lossy. A function may collapse
information and it may cover only parts of its codomain. The only func-
tions that are not lossy are the ones that are invertible — the isomor-
phisms. It follows then that the best structure-preserving 𝐒𝐞𝐭-valued
233functorsaretherepresentableones.Theyareeitherthehom-functorsor
the functors that are naturally isomorphic to hom-functors. Any other
functor 𝐹 is obtained from a hom-functor through a lossy transforma-
tion. Such a transformation may not only lose information, but it may
also cover only a small part of the image of the functor 𝐹 in 𝐒𝐞𝐭.
## 15.1 Yoneda in Haskell
We have already encountered the hom-functor in Haskell under the
guise of the reader functor:
type Reader a x = a -> x
The reader maps morphisms (here, functions) by precomposition:
instance Functor (Reader a) where
fmap f h = f . h
The Yoneda lemma tells us that the reader functor can be naturally
mapped to any other functor.
Anaturaltransformationisapolymorphicfunction.Sogivenafunc-
tor F, we have a mapping to it from the reader functor:
alpha :: forall x . (a -> x) -> F x
As usual, forall is optional, but I like to write it explicitly to emphasize
parametric polymorphism of natural transformations.
The Yoneda lemma tells us that these natural transformations are in
one-to-one correspondence with the elements of F a:
forall x . (a -> x) -> F x ≅ F a
234The right hand side of this identity is what we would normally consider
adatastructure.Remembertheinterpretationoffunctorsasgeneralized
containers? F a is a container of a. But the left hand side is a polymor-
phic function that takes a function as an argument. The Yoneda lemma
tells us that the two representations are equivalent — they contain the
same information.
Another way of saying this is: Give me a polymorphic function of
the type:
alpha :: forall x . (a -> x) -> F x
andI’llproduceacontainerofa.Thetrickistheoneweusedintheproof
of the Yoneda lemma: we call this function with id to get an element of
F a:
alpha id :: F a
The converse is also true: Given a value of the type F a:
fa :: F a
one can define a polymorphic function:
alpha h = fmap h fa
of the correct type. You can easily go back and forth between the two
representations.
The advantage of having multiple representations is that one might
be easier to compose than the other, or that one might be more efficient
in some applications than the other.
The simplest illustration of this principle is the code transformation
that is often used in compiler construction: the continuation passing
style or cps. It’s the simplest application of the Yoneda lemma to the
identity functor. Replacing F with identity produces:
235forall r . (a -> r) -> r ≅ a
The interpretation of this formula is that any type a can be replaced by
a function that takes a “handler” for a. A handler is a function accepting
a and performing the rest of the computation — the continuation. (The
type r usually encapsulates some kind of status code.)
This style of programming is very common in UIs, in asynchronous
systems,andinconcurrentprogramming.Thedrawbackof cps isthatit
involves inversion of control. The code is split between producers and
consumers (handlers), and is not easily composable. Anybody who’s
done any amount of nontrivial web programming is familiar with the
nightmare of spaghetti code from interacting stateful handlers. As we’ll
see later, judicious use of functors and monads can restore some com-
positional properties of cps.
## 15.2 Co-Yoneda
As usual, we get a bonus construction by inverting the direction of ar-
rows. The Yoneda lemma can be applied to the opposite category 𝐂𝑜𝑝 to
give us a mapping between contravariant functors.
Equivalently, we can derive the co-Yoneda lemma by fixing the tar-
get object of our hom-functors instead of the source. We get the con-
travarianthom-functorfrom𝐂to𝐒𝐞𝐭:𝐂(−,𝑎).Thecontravariantversion
of the Yoneda lemma establishes one-to-one correspondence between
natural transformations from this functor to any other contravariant
functor 𝐹 and the elements of the set 𝐹𝑎:
𝐍𝐚𝐭(𝐂(−,𝑎),𝐹) ≅ 𝐹𝑎
Here’s the Haskell version of the co-Yoneda lemma:
236forall x . (x -> a) -> F x ≅ F a
Notice that in some literature it’s the contravariant version that’s called
the Yoneda lemma.
## 15.3 Challenges
1. Show that the two functions phi and psi that form the Yoneda
isomorphism in Haskell are inverses of each other.
phi :: (forall x . (a -> x) -> F x) -> F a
phi alpha = alpha id
psi :: F a -> (forall x . (a -> x) -> F x)
psi fa h = fmap h fa
2. A discrete category is one that has objects but no morphisms
otherthanidentitymorphisms.HowdoestheYonedalemmawork
for functors from such a category?
3. A list of units [()] contains no other information but its length.
So, as a data type, it can be considered an encoding of integers.
An empty list encodes zero, a singleton [()] (a value, not a type)
encodes one, and so on. Construct another representation of this
data type using the Yoneda lemma for the list functor.
## 15.4 Bibliography
1. Catsters1 video.
1https://www.youtube.com/watch?v=TLMxHB19khE
23716 Yoneda Embedding
We’ve seen previously that, when we fix an object 𝑎 in the cate-
gory 𝐂, the mapping 𝐂(𝑎,−) is a (covariant) functor from 𝐂 to 𝐒𝐞𝐭.
𝑥 → 𝐂(𝑎,𝑥)
(The codomain is 𝐒𝐞𝐭 because the hom-set 𝐂(𝑎,𝑥) is a set.) We call this
mappingahom-functor—wehavepreviouslydefineditsactiononmor-
phisms as well.
Nowlet’svary𝑎inthismapping.Wegetanewmappingthatassigns
the hom-functor 𝐂(𝑎,−) to any 𝑎.
𝑎 → 𝐂(𝑎,−)
It’s a mapping of objects from category 𝐂 to functors, which are ob-
jects in the functor category (see the section about functor categories in
Natural Transformations). Let’s use the notation [𝐂,𝐒𝐞𝐭] for the functor
238category from 𝐂 to 𝐒𝐞𝐭. You may also recall that hom-functors are the
prototypical representable functors.
Every time we have a mapping of objects between two categories,
it’s natural to ask if such a mapping is also a functor. In other words
whether we can lift a morphism from one category to a morphism in
the other category. A morphism in 𝐂 is just an element of 𝐂(𝑎,𝑏), but a
morphisminthefunctorcategory[𝐂,𝐒𝐞𝐭]isanaturaltransformation.So
we are looking for a mapping of morphisms to natural transformations.
Let’s see if we can find a natural transformation corresponding to
a morphism 𝑓 ∷ 𝑎 → 𝑏. First, lets see what 𝑎 and 𝑏 are mapped to.
Theyaremappedtotwofunctors:𝐂(𝑎,−)and𝐂(𝑏,−).Weneedanatural
transformation between those two functors.
And here’s the trick: we use the Yoneda lemma:
[𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐹) ≅ 𝐹𝑎
and replace the generic 𝐹 with the hom-functor 𝐂(𝑏,−). We get:
[𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐂(𝑏,−)) ≅ 𝐂(𝑏,𝑎)
239Thisisexactlythenaturaltransformationbetweenthetwohom-functors
we were looking for, but with a little twist: We have a mapping between
anaturaltransformationandamorphism—anelementof𝐂(𝑏,𝑎)—that
goes in the “wrong” direction. But that’s okay; it only means that the
functor we are looking at is contravariant.
Actually,we’vegotevenmorethanwebargainedfor.Themappingfrom
𝐂 to [𝐂,𝐒𝐞𝐭] is not only a contravariant functor — it is a fully faith-
ful functor. Fullness and faithfulness are properties of functors that de-
scribe how they map hom-sets.
A faithful functor is injective on hom-sets, meaning that it maps
distinct morphisms to distinct morphisms. In other words, it doesn’t
coalesce them.
A full functor is surjective on hom-sets, meaning that it maps one
hom-set onto the other hom-set, fully covering the latter.
A fully faithful functor 𝐹 is a bijection on hom-sets — a one to one
matching of all elements of both sets. For every pair of objects 𝑎 and
𝑏 in the source category 𝐂 there is a bijection between 𝐂(𝑎,𝑏) and
𝐃(𝐹𝑎,𝐹𝑏), where 𝐃 is the target category of 𝐹 (in our case, the func-
tor category, [𝐂,𝐒𝐞𝐭]). Notice that this doesn’t mean that 𝐹 is a bijection
240on objects. There may be objects in 𝐃 that are not in the image of 𝐹, and
we can’t say anything about hom-sets for those objects.
## 16.1 The Embedding
The (contravariant) functor we have just described, the functor that
maps objects in 𝐂 to functors in [𝐂,𝐒𝐞𝐭]:
𝑎 → 𝐂(𝑎,−)
defines the Yoneda embedding. It embeds a category 𝐂 (strictly speaking,
thecategory𝐂𝑜𝑝,becauseofcontravariance)insidethefunctorcategory
[𝐂,𝐒𝐞𝐭]. It not only maps objects in 𝐂 to functors, but also faithfully
preserves all connections between them.
Thisisaveryusefulresultbecausemathematiciansknowalotabout
the category of functors, especially functors whose codomain is 𝐒𝐞𝐭. We
can get a lot of insight about an arbitrary category 𝐂 by embedding it
in the functor category.
Of course there is a dual version of the Yoneda embedding, some-
times called the co-Yoneda embedding. Observe that we could have
started by fixing the target object (rather than the sourceobject) of each
hom-set, 𝐂(−,𝑎). That would give us a contravariant hom-functor. Con-
travariant functors from 𝐂 to 𝐒𝐞𝐭 are our familiar presheaves (see, for
instance, Limits and Colimits). The co-Yoneda embedding defines the
embedding of a category 𝐂 in the category of presheaves. Its action on
morphisms is given by:
[𝐂,𝐒𝐞𝐭](𝐂(−,𝑎),𝐂(−,𝑏)) ≅ 𝐂(𝑎,𝑏)
Again, mathematicians know a lot about the category of presheaves, so
being able to embed an arbitrary category in it is a big win.
24116.2 Application to Haskell
In Haskell, the Yoneda embedding can be represented as the isomor-
phismbetweennaturaltransformationsamongstreaderfunctorsonthe
one hand, and functions (going in the opposite direction) on the other
hand:
forall x. (a -> x) -> (b -> x) ≅ b -> a
(Remember, the reader functor is equivalent to ((->) a).)
The left hand side of this identity is a polymorphic function that,
given a function from a to x and a value of type b, can produce a value
of type x (I’m uncurrying — dropping the parentheses around — the
functionb -> x).Theonlywaythiscanbedoneforallx isifourfunction
knows how to convert a b to an a. It has to secretly have access to a
function b -> a.
Given such a converter, btoa, one can define the left hand side, call
itfromY, as:
fromY :: (a -> x) -> b -> x
fromY f b = f (btoa b)
Conversely,givenafunctionfromY wecanrecovertheconverterbycall-
ing fromY with the identity:
fromY id :: b -> a
This establishes the bijection between functions of the type fromY and
btoa.
An alternative way of looking at this isomorphism is that it’s a cps
encoding of a function from b to a. The argument a -> x is a contin-
uation (the handler). The result is a function from b to x which, when
242calledwithavalueoftypeb,willexecutethecontinuationprecomposed
with the function being encoded.
The Yoneda embedding also explains some of the alternative repre-
sentations of data structures in Haskell. In particular, it provides a very
useful representation1 of lenses from the Control.Lens library.
## 16.3 Preorder Example
ThisexamplewassuggestedbyRobertHarper.It’stheapplicationofthe
Yoneda embedding to a category defined by a preorder. A preorder is a
set with an ordering relation between its elements that’s traditionally
written as ⩽ (less than or equal). The “pre” in preorder is there because
we’re only requiring the relation to be transitive and reflexive but not
necessarily antisymmetric (so it’s possible to have cycles).
A set with the preorder relation gives rise to a category. The objects
aretheelementsofthisset.Amorphismfromobject𝑎to𝑏 eitherdoesn’t
exist, if the objects cannot be compared or if it’s not true that 𝑎 ⩽ 𝑏; or
it exists if 𝑎 ⩽ 𝑏, and it points from 𝑎 to 𝑏. There is never more than one
morphism from one object to another. Therefore any hom-set in such a
category is either an empty set or a one-element set. Such a category is
called thin.
It’s easy to convince yourself that this construction is indeed a cate-
gory: The arrows are composable because, if 𝑎 ⩽ 𝑏 and 𝑏 ⩽ 𝑐 then 𝑎 ⩽ 𝑐;
and the composition is associative. We also have the identity arrows
because every element is (less than or) equal to itself (reflexivity of the
underlying relation).
1https://bartoszmilewski.com/2015/07/13/from-lenses-to-yoneda-embedding/
243Wecannowapplytheco-Yonedaembeddingtoapreordercategory.
In particular, we’re interested in its action on morphisms:
[𝐂,𝐒𝐞𝐭](𝐂(−,𝑎),𝐂(−,𝑏)) ≅ 𝐂(𝑎,𝑏)
The hom-set on the right hand side is non-empty if and only if 𝑎 ⩽ 𝑏
— in which case it’s a one-element set. Consequently, if 𝑎 ⩽ 𝑏, there
exists a single natural transformation on the left. Otherwise there is no
natural transformation.
So what’s a natural transformation between hom-functors in a pre-
order?Itshouldbeafamilyoffunctionsbetweensets𝐂(−,𝑎)and𝐂(−,𝑏).
In a preorder, each of these sets can either be empty or a singleton. Let’s
see what kind of functions are there at our disposal.
Thereisafunctionfromanemptysettoitself(theidentityactingon
an empty set), a function absurd from an empty set to a singleton set (it
does nothing, since it only needs to be defined for elements of an empty
set, of which there are none), and a function from a singleton to itself
(the identity acting on a one-element set). The only combination that is
forbidden is the mapping from a singleton to an empty set (what would
the value of such a function be when acting on the single element?).
So our natural transformation will never connect a singleton hom-
set to an empty hom-set. In other words, if 𝑥 ⩽ 𝑎 (singleton hom-set
𝐂(𝑥,𝑎)) then 𝐂(𝑥,𝑏) cannot be empty. A non-empty 𝐂(𝑥,𝑏) means that
𝑥 is less or equal to 𝑏. So the existence of the natural transformation in
question requires that, for every 𝑥, if 𝑥 ⩽ 𝑎 then 𝑥 ⩽ 𝑏.
for all 𝑥,𝑥 ⩽ 𝑎 ⇒ 𝑥 ⩽ 𝑏
On the other hand, co-Yoneda tells us that the existence of this natural
transformation is equivalent to 𝐂(𝑎,𝑏) being non-empty, or to 𝑎 ⩽ 𝑏.
244Together, we get:
𝑎 ⩽ 𝑏 if and only if for all 𝑥,𝑥 ⩽ 𝑎 ⇒ 𝑥 ⩽ 𝑏
Wecouldhavearrivedatthisresultdirectly.Theintuitionisthat,if𝑎 ⩽ 𝑏
then all elements that are below 𝑎 must also be below 𝑏. Conversely,
when you substitute 𝑎 for 𝑥 on the right hand side, it follows that 𝑎 ⩽
𝑏. But you must admit that arriving at this result through the Yoneda
embedding is much more exciting.
## 16.4 Naturality
The Yoneda lemma establishes the isomorphism between the set of nat-
ural transformations and an object in 𝐒𝐞𝐭. Natural transformations are
morphisms in the functor category [𝐂,𝐒𝐞𝐭]. The set of natural transfor-
mation between any two functors is a hom-set in that category. The
Yoneda lemma is the isomorphism:
[𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐹) ≅ 𝐹𝑎
Thisisomorphismturnsouttobenaturalinboth𝐹 and𝑎.Inotherwords,
it’s natural in (𝐹,𝑎), a pair taken from the product category [𝐂,𝐒𝐞𝐭]×𝐂.
Notice that we are now treating 𝐹 as an object in the functor category.
Let’sthinkforamomentwhatthismeans.Anaturalisomorphismis
an invertible natural transformation between two functors. And indeed,
the right hand side of our isomorphism is a functor. It’s a functor from
[𝐂,𝐒𝐞𝐭] × 𝐂 to 𝐒𝐞𝐭. Its action on a pair (𝐹,𝑎) is a set — the result of
evaluating the functor 𝐹 at the object 𝑎. This is called the evaluation
functor.
Thelefthandsideisalsoafunctorthattakes(𝐹,𝑎)toasetofnatural
transformations [𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐹).
245To show that these are really functors, we should also define their
action on morphisms. But what’s a morphism between a pair (𝐹,𝑎) and
(𝐺,𝑏)? It’s a pair of morphisms, (Φ,𝑓); the first being a morphism be-
tweenfunctors—anaturaltransformation—thesecondbeingaregular
morphism in 𝐂.
The evaluation functor takes this pair (Φ,𝑓) and maps it to a func-
tion between two sets, 𝐹𝑎 and 𝐺𝑏. We can easily construct such a func-
tion from the component of Φ at 𝑎 (which maps 𝐹𝑎 to 𝐺𝑎) and the mor-
phism 𝑓 lifted by 𝐺:
(𝐺𝑓) ∘ Φ𝑎
Notice that, because of naturality of Φ, this is the same as:
Φ𝑏 ∘ (𝐹𝑓)
I’m not going to prove the naturality of the whole isomorphism — after
you’veestablishedwhatthefunctorsare,theproofisprettymechanical.
It follows from the fact that our isomorphism is built up from functors
and natural transformations. There is simply no way for it to go wrong.
## 16.5 Challenges
1. Express the co-Yoneda embedding in Haskell.
2. Show that the bijection we established between fromY and btoa is
anisomorphism(thetwomappingsaretheinverseofeachother).
3. Work out the Yoneda embedding for a monoid. What functor cor-
respondstothemonoid’ssingleobject?Whatnaturaltransforma-
tions correspond to monoid morphisms?
4. What is the application of the covariant Yoneda embedding to
preorders? (Question suggested by Gershom Bazerman.)
2465. Yonedaembeddingcanbeusedtoembedanarbitraryfunctorcat-
egory [𝐂,𝐃] in the functor category [[𝐂,𝐃],𝐒𝐞𝐭]. Figure out how
it works on morphisms (which in this case are natural transfor-
mations).
247Part Three
24817
It’s All About Morphisms
If I haven’t convinced you yet that category theory is all about mor-
phisms then I haven’t done my job properly. Since the next topic is
adjunctions, which are defined in terms of isomorphisms of hom-sets, it
makes sense to review our intuitions about the building blocks of hom-
sets. Also, you’ll see that adjunctions provide a more general language
to describe a lot of constructions we’ve studied before, so it might help
to review them too.
## 17.1 Functors
To begin with, you should really think of functors as mappings of mor-
phisms — the view that’s emphasized in the Haskell definition of the
Functor typeclass, which revolves around fmap. Of course, functors also
mapobjects—theendpointsofmorphisms—otherwisewewouldn’tbe
able to talk about preserving composition. Objects tell us which pairs of
249morphisms are composable. The target of one morphism must be equal
to the source of the other — if they are to be composed. So if we want
thecompositionofmorphismstobemappedtothecompositionoflifted
morphisms, the mapping of their endpoints is pretty much determined.
## 17.2 Commuting Diagrams
A lot of properties of morphisms are expressed in terms of commuting
diagrams. If a particular morphism can be described as a composition
of other morphisms in more than one way, then we have a commuting
diagram.
In particular, commuting diagrams form the basis of almost all uni-
versal constructions (with the notable exceptions of the initial and ter-
minal objects). We’ve seen this in the definitions of products, coprod-
ucts, various other (co-)limits, exponential objects, free monoids, etc.
The product is a simple example of
a universal construction. We pick two
objects 𝑎 and 𝑏 and see if there exists
anobject𝑐,togetherwithapairofmor-
phisms 𝑝 and 𝑞, that has the universal
property of being their product.
Aproductisaspecialcaseofalimit.
A limit is defined in terms of cones. A
generalconeisbuiltfromcommutingdiagrams.Commutativityofthose
diagrams may be replaced with a suitable naturality condition for the
mapping of functors. This way commutativity is reduced to the role of
the assembly language for the higher level language of natural trans-
formations.
25017.3 Natural Transformations
In general, natural transformations are very convenient whenever we
need a mapping from morphisms to commuting squares. Two opposing
sidesofanaturalitysquarearethemappingsofsomemorphism𝑓 under
twofunctors𝐹 and𝐺.Theothersidesarethecomponentsofthenatural
transformation (which are also morphisms).
Naturality means that when you move to the “neighboring” component
(by neighboring I mean connected by a morphism), you’re not going
against the structure of either the category or the functors. It doesn’t
matter whether you first use a component of the natural transforma-
tion to bridge the gap between objects, and then jump to its neighbor
using the functor; or the other way around. The two directions are or-
thogonal. A natural transformation moves you left and right, and the
functors move you up and down or back and forth — so to speak. You
can visualize the image of a functor as a sheet in the target category.
A natural transformation maps one such sheet corresponding to F, to
another, corresponding to G.
251We’ve seen examples of this
orthogonalityinHaskell.There
the action of a functor mod-
ifies the content of a con-
tainer without changing its
shape, while a natural trans-
formation repackages the un-
touched contents into a dif-
ferent container. The order of
these operations doesn’t mat-
ter.
We’ve seen the cones in the definition of a limit replaced by natural
transformations. Naturality ensures that the sides of every cone com-
mute. Still, a limit is defined in terms of mappings between cones. These
mappingsmustalsosatisfycommutativityconditions.(Forinstance,the
triangles in the definition of the product must commute.)
These conditions, too, may be replaced by naturality. You may recall
that the universal cone, or the limit, is defined as a natural transforma-
tion between the (contravariant) hom-functor:
𝐹 ∷ 𝑐 → 𝐂(𝑐,Lim𝐷)
and the (also contravariant) functor that maps objects in C to cones,
which themselves are natural transformations:
𝐺 ∷ 𝑐 → 𝐍𝐚𝐭(Δ𝑐,𝐷)
Here, Δ𝑐 is the constant functor, and 𝐷 is the functor that defines the
diagram in 𝐂. Both functors 𝐹 and 𝐺 have well defined actions on mor-
phisms in 𝐂. It so happens that this particular natural transformation
between 𝐹 and 𝐺 is an isomorphism.
25217.4 Natural Isomorphisms
A natural isomorphism — which is a natural transformation whose ev-
ery component is reversible — is category theory’s way of saying that
“two things are the same.” A component of such a transformation must
be an isomorphism between objects — a morphism that has the inverse.
If you visualize functor images as sheets, a natural isomorphism is a
one-to-one invertible mapping between those sheets.
## 17.5 Hom-Sets
But what are morphisms? They do have more structure than objects:
unlike objects, morphisms have two ends. But if you fix the source and
the target objects, the morphisms between the two form a boring set
(at least for locally small categories). We can give elements of this set
names like 𝑓 or 𝑔, to distinguish one from another — but what is it,
really, that makes them different?
The essential difference between morphisms in a given hom-set lies
in the way they compose with other morphisms (from abutting hom-
sets). If there is a morphism ℎ whose composition (either pre- or post-)
with 𝑓 is different than that with 𝑔, for instance:
ℎ ∘ 𝑓 ≠ ℎ ∘ 𝑔
then we can directly “observe” the difference between 𝑓 and 𝑔. But even
if the difference is not directly observable, we might use functors to
zoom in on the hom-set. A functor 𝐹 may map the two morphisms to
distinct morphisms:
𝐹𝑓 ≠ 𝐹𝑔
253in a richer category, where the abutting hom-sets provide more resolu-
tion, e.g.,
ℎ′ ∘ 𝐹𝑓 ≠ ℎ′ ∘ 𝐹𝑔
where ℎ′ is not in the image of 𝐹.
## 17.6 Hom-Set Isomorphisms
A lot of categorical constructions rely on isomorphisms between hom-
sets.Butsincehom-setsarejustsets,aplainisomorphismbetweenthem
doesn’ttellyoumuch.Forfinitesets,anisomorphismjustsaysthatthey
have the same number of elements. If the sets are infinite, their cardi-
nality must be the same. But any meaningful isomorphism of hom-sets
must take into account composition. And composition involves more
than one hom-set. We need to define isomorphisms that span whole
collectionsofhom-sets,andweneedtoimposesomecompatibilitycon-
ditions that interoperate with composition. And a natural isomorphism
fits the bill exactly.
Butwhat’sanaturalisomorphismofhom-sets?Naturalityisaprop-
erty of mappings between functors, not sets. So we are really talking
about a natural isomorphism between hom-set-valued functors. These
functors are more than just set-valued functors. Their action on mor-
phismsisinducedbytheappropriatehom-functors.Morphismsarecanon-
ically mapped by hom-functors using either pre- or post-composition
(depending on the covariance of the functor).
The Yoneda embedding is one example of such an isomorphism. It
mapshom-setsin𝐂tohom-setsinthefunctorcategory;andit’snatural.
One functor in the Yoneda embedding is the hom-functor in 𝐂 and the
othermapsobjectstosetsofnaturaltransformationsbetweenhom-sets.
254Thedefinitionofalimitisalsoanaturalisomorphismbetweenhom-
sets (the second one, again, in the functor category):
𝐂(𝑐,Lim𝐷) ≃ 𝐍𝐚𝐭(Δ𝑐,𝐷)
It turns out that our construction of an exponential object, or that of a
free monoid, can also be rewritten as a natural isomorphism between
hom-sets.
This is no coincidence — we’ll see next that these are just different
examples of adjunctions, which are defined as natural isomorphisms of
hom-sets.
## 17.7 Asymmetry of Hom-Sets
There is one more observation that will help us understand adjunctions.
Hom-setsare,ingeneral,notsymmetric.Ahom-set𝐂(𝑎,𝑏)isoftenvery
different from the hom-set 𝐂(𝑏,𝑎). The ultimate demonstration of this
asymmetry is a partial order viewed as a category. In a partial order, a
morphism from 𝑎 to 𝑏 exists if and only if 𝑎 is less than or equal to 𝑏.
If 𝑎 and 𝑏 are different, then there can be no morphism going the other
way, from 𝑏 to 𝑎. So if the hom-set 𝐂(𝑎,𝑏) is non-empty, which in this
casemeansit’sasingletonset,then𝐂(𝑏,𝑎)mustbeempty,unless𝑎 = 𝑏.
The arrows in this category have a definite flow in one direction.
A preorder, which is based on a relation that’s not necessarily an-
tisymmetric, is also “mostly” directional, except for occasional cycles.
It’s convenient to think of an arbitrary category as a generalization of
a preoder.
A preorder is a thin category — all hom-sets are either singletons or
empty. We can visualize a general category as a “thick” preorder.
25517.8 Challenges
1. Consider some degenerate cases of a naturality condition and
draw the appropriate diagrams. For instance, what happens if ei-
ther functor 𝐹 or 𝐺 map both objects 𝑎 and 𝑏 (the ends of
𝑓 ∷ 𝑎 → 𝑏) to the same object, e.g., 𝐹𝑎 = 𝐹𝑏 or 𝐺𝑎 = 𝐺𝑏? (Notice
that you get a cone or a co-cone this way.) Then consider cases
where either 𝐹𝑎 = 𝐺𝑎 or 𝐹𝑏 = 𝐺𝑏. Finally, what if you start with
a morphism that loops on itself — 𝑓 ∷ 𝑎 → 𝑎?
25618 Adjunctions
In mathematics we havevariouswaysofsayingthatonethingislike
another. The strictest is equality. Two things are equal if there is no
way to distinguish one from another. One can be substituted for the
other in every imaginable context. For instance, did you notice that we
usedequality ofmorphismseverytimewetalkedaboutcommutingdia-
grams?That’sbecausemorphismsformaset(hom-set)andsetelements
can be compared for equality.
But equality is often too strong. There are many examples of things
being the same for all intents and purposes, without actually being
equal. For instance, the pair type (Bool, Char) is not strictly equal to
(Char, Bool), but we understand that they contain the same informa-
tion.Thisconceptisbestcapturedbyanisomorphismbetweentwotypes
— a morphism that’s invertible. Since it’s a morphism, it preserves the
structure; and being “iso” means that it’s part of a round trip that lands
257you in the same spot, no matter on which side you start. In the case of
pairs, this isomorphism is called swap:
swap :: (a,b) -> (b,a)
swap (a,b) = (b,a)
swap happens to be its own inverse.
## 18.1 Adjunction and Unit/Counit Pair
When we talk about categories being isomorphic, we express this in
terms of mappings between categories, a.k.a. functors. We would like
to be able to say that two categories 𝐂 and 𝐃 are isomorphic if there
exists a functor 𝑅 (“right”) from 𝐂 to 𝐃, which is invertible. In other
words, there exists another functor 𝐿 (“left”) from 𝐃 back to 𝐂 which,
when composed with 𝑅, is equal to the identity functor 𝐼. There are two
possiblecompositions,𝑅∘𝐿and𝐿∘𝑅;andtwopossibleidentityfunctors:
one in 𝐂 and another in 𝐃.
258But here’s the tricky part: What does it mean for two functors to be
equal? What do we mean by this equality:
𝑅 ∘ 𝐿 = 𝐼𝐃
or this one:
𝐿 ∘ 𝑅 = 𝐼𝐂
It would be reasonable to define functor equality in terms of equality
of objects. Two functors, when acting on equal objects, should produce
equalobjects.Butwedon’t,ingeneral,havethenotionofobjectequality
inanarbitrarycategory.It’sjustnotpartofthedefinition.(Goingdeeper
into this rabbit hole of “what equality really is,” we would end up in
Homotopy Type Theory.)
You might argue that functors are morphisms in the category of
categories, so they should be equality-comparable. And indeed, as long
as we are talking about small categories, where objects form a set, we
can indeed use the equality of elements of a set to equality-compare
objects.
But, remember, 𝐂𝐚𝐭 is really a 𝟐-category. Hom-sets in a 𝟐-category
have additional structure — there are 2-morphisms acting between 1-
morphisms. In 𝐂𝐚𝐭, 1-morphisms are functors, and 2-morphisms are
natural transformations. So it’s more natural (can’t avoid this pun!) to
consider natural isomorphisms as substitutes for equality when talking
about functors.
So, instead of isomorphism of categories, it makes sense to consider
amoregeneralnotionofequivalence.Twocategories𝐂and𝐃areequiv-
alent if we can find two functors going back and forth between them,
whose composition (either way) is naturally isomorphic to the identity
functor. In other words, there is a two-way natural transformation be-
259tween the composition 𝑅 ∘ 𝐿 and the identity functor 𝐼𝐃, and another
between 𝐿 ∘ 𝑅 and the identity functor 𝐼𝐂.
Adjunction is even weaker than equivalence, because it doesn’t re-
quire that the composition of the two functors be isomorphic to the
identity functor. Instead it stipulates the existence of a one way nat-
ural transformation from 𝐼𝐃 to 𝑅 ∘ 𝐿, and another from 𝐿 ∘ 𝑅 to 𝐼𝐂. Here
are the signatures of these two natural transformations:
𝜂 ∷ 𝐼𝐃 → 𝑅 ∘ 𝐿
𝜀 ∷ 𝐿 ∘ 𝑅 → 𝐼𝐂
𝜂 is called the unit, and 𝜀 the counit of the adjunction.
Noticetheasymmetrybetweenthesetwodefinitions.Ingeneral,we
don’t have the two remaining mappings:
𝑅 ∘ 𝐿 → 𝐼𝐃 not necessarily
𝐼𝐂 → 𝐿 ∘ 𝑅 not necessarily
Because of this asymmetry, the functor 𝐿 is called the left adjoint to the
functor 𝑅, while the functor 𝑅 is the right adjoint to 𝐿. (Of course, left
and right make sense only if you draw your diagrams one particular
way.)
The compact notation for the adjunction is:
𝐿 ⊣ 𝑅
Tobetterunderstandtheadjunction,let’sanalyzetheunitandthecounit
in more detail.
260Let’s start with the unit. It’s a natural transformation, so it’s a family of
morphisms. Given an object 𝑑 in 𝐃, the component of 𝜂 is a morphism
between 𝐼𝑑, which is equal to 𝑑, and (𝑅 ∘ 𝐿)𝑑; which, in the picture, is
called 𝑑′:
𝜂𝑑 ∷ 𝑑 → (𝑅 ∘ 𝐿)𝑑
Notice that the composition 𝑅 ∘ 𝐿 is an endofunctor in 𝐃.
This equation tells us that we can pick any object 𝑑 in 𝐃 as our
starting point, and use the round trip functor 𝑅 ∘ 𝐿 to pick our target
object 𝑑′. Then we shoot an arrow — the morphism 𝜂𝑑 — to our target.
By the same token, the component of the counit ε can be described as:
𝜀𝑐′ ∷ (𝐿 ∘ 𝑅)𝑐 → 𝑐
261where 𝑐′ is (𝐿 ∘ 𝑅)𝑐. It tells us that we can pick any object 𝑐 in 𝐂 as our
target, and use the round trip functor 𝐿 ∘ 𝑅 to pick the source 𝑐′. Then
we shoot the arrow — the morphism 𝜀𝑐′ — from the source to the target.
Another way of looking at unit and counit is that unit lets us in-
troduce the composition 𝑅 ∘ 𝐿 anywhere we could insert an identity
functor on 𝐃; and counit lets us eliminate the composition 𝐿∘𝑅, replac-
ing it with the identity on 𝐂. That leads to some “obvious” consistency
conditions, which make sure that introduction followed by elimination
doesn’t change anything:
𝐿 = 𝐿 ∘ 𝐼𝐃 → 𝐿 ∘ 𝑅 ∘ 𝐿 → 𝐼𝐂 ∘ 𝐿 = 𝐿
𝑅 = 𝐼𝐃 ∘ 𝑅 → 𝑅 ∘ 𝐿 ∘ 𝑅 → 𝑅 ∘ 𝐼𝐂 = 𝑅
These are called triangular identities because they make the following
diagrams commute:
𝐿 𝐿 ∘ 𝑅 ∘ 𝐿
𝐿
𝐿∘𝜂
𝜖∘𝐿
𝑅 𝑅 ∘ 𝐿 ∘ 𝑅
𝑅
𝜂∘𝑅
𝑅∘𝜖
Thesearediagramsinthefunctorcategory:thearrowsarenaturaltrans-
formations, and their composition is the horizontal composition of nat-
ural transformations. In components, these identities become:
𝜀𝐿𝑑 ∘ 𝐿𝜂𝑑 = id𝐿𝑑
𝑅𝜀𝑐 ∘ 𝜂𝑅𝑐 = id𝑅𝑐
We often see unit and counit in Haskell under different names. Unit is
known as return (or pure, in the definition of Applicative):
262return :: d -> m d
and counint as extract:
extract :: w c -> c
Here, m is the (endo-) functor corresponding to 𝑅∘𝐿, and w is the (endo-)
functor corresponding to 𝐿 ∘ 𝑅. As we’ll see later, they are part of the
definition of a monad and a comonad, respectively.
If you think of an endofunctor as a container, the unit (or return)
is a polymorphic function that creates a default box around a value of
arbitrary type. The counit (or extract) does the reverse: it retrieves or
produces a single value from a container.
We’ll see later that every pair of adjoint functors defines a monad
andacomonad.Conversely,everymonadorcomonadmaybefactorized
into a pair of adjoint functors — this factorization is not unique, though.
In Haskell, we use monads a lot, but only rarely factorize them into
pairs of adjoint functors, primarily because those functors would nor-
mally take us out of Hask.
WecanhoweverdefineadjunctionsofendofunctorsinHaskell.Here’s
part of the definition taken from Data.Functor.Adjunction:
class (Functor f, Representable u) =>
Adjunction f u | f -> u, u -> f where
unit :: a -> u (f a)
counit :: f (u a) -> a
This definition requires some explanation. First of all, it describes a
multi-parametertypeclass—thetwoparametersbeingf andu.Itestab-
lishes a relation called Adjunction between these two type constructors.
Additional conditions, after the vertical bar, specify functional de-
pendencies. For instance, f -> u means that u is determined by f (the
263relation between f and u is a function, here on type constructors). Con-
versely, u -> f means that, if we know u, then f is uniquely determined.
I’ll explain in a moment why, in Haskell, we can impose the condi-
tion that the right adjoint u be a representable functor.
## 18.2 Adjunctions and Hom-Sets
There is an equivalent definition of the adjunction in terms of natu-
ral isomorphisms of hom-sets. This definition ties nicely with universal
constructionswe’vebeenstudyingsofar.Everytimeyouhearthestate-
ment that there is some unique morphism, which factorizes some con-
struction, you should think of it as a mapping of some set to a hom-set.
That’s the meaning of “picking a unique morphism.”
Furthermore,factorizationcanbeoftendescribedintermsofnatural
transformations. Factorization involves commuting diagrams — some
morphism being equal to a composition of two morphisms (factors). A
natural transformation maps morphisms to commuting diagrams. So,
in a universal construction, we go from a morphism to a commuting
diagram, and then to a unique morphism. We end up with a mapping
from morphism to morphism, or from one hom-set to another (usually
in different categories). If this mapping is invertible, and if it can be
naturally extended across all hom-sets, we have an adjunction.
The main difference between universal constructions and adjunc-
tions is that the latter are defined globally — for all hom-sets. For in-
stance, using a universal construction you can define a product of two
select objects, even if it doesn’t exist for any other pair of objects in that
category. As we’ll see soon, if the product of any pair of objects exists
in a category, it can be also defined through an adjunction.
264Here’s the alternative definition of the adjunction using hom-sets. As
before, we have two functors 𝐿 ∷ 𝐃 → 𝐂 and 𝑅 ∷ 𝐂 → 𝐃. We pick
two arbitrary objects: the source object 𝑑 in 𝐃, and the target object 𝑐
in 𝐂. We can map the source object 𝑑 to 𝐂 using 𝐿. Now we have two
objects in 𝐂, 𝐿𝑑 and 𝑐. They define a hom-set:
𝐂(𝐿𝑑,𝑐)
Similarly, we can map the target object 𝑐 using 𝑅. Now we have two
objects in 𝐃, 𝑑 and 𝑅𝑐. They, too, define a hom set:
𝐃(𝑑,𝑅𝑐)
We say that 𝐿 is left adjoint to 𝑅 iff there is an isomorphism of hom sets:
𝐂(𝐿𝑑,𝑐) ≅ 𝐃(𝑑,𝑅𝑐)
thatisnaturalbothin𝑑 and𝑐.Naturalitymeansthatthesource𝑑 canbe
varied smoothly across 𝐃; and the target 𝑐, across 𝐂. More precisely, we
have a natural transformation 𝜑 between the following two (covariant)
functors from 𝐂 to 𝐒𝐞𝐭. Here’s the action of these functors on objects:
𝑐 → 𝐂(𝐿𝑑,𝑐)
𝑐 → 𝐃(𝑑,𝑅𝑐)
265The other natural transformation, 𝜓, acts between the following (con-
travariant) functors:
𝑑 → 𝐂(𝐿𝑑,𝑐)
𝑑 → 𝐃(𝑑,𝑅𝑐)
Both natural transformations must be invertible.
It’seasytoshowthatthetwodefinitionsoftheadjunctionareequiv-
alent.Forinstance,let’sderivetheunittransformationstartingfromthe
isomorphism of hom-sets:
𝐂(𝐿𝑑,𝑐) ≅ 𝐃(𝑑,𝑅𝑐)
Since this isomorphism works for any object 𝑐, it must also work for
𝑐 = 𝐿𝑑:
𝐂(𝐿𝑑,𝐿𝑑) ≅ 𝐃(𝑑,(𝑅 ∘ 𝐿)𝑑)
We know that the left hand side must contain at least one morphism,
the identity. The natural transformation will map this morphism to an
elementof𝐃(𝑑,(𝑅∘𝐿)𝑑)or,insertingtheidentityfunctor𝐼,amorphism
in:
𝐃(𝐼𝑑,(𝑅 ∘ 𝐿)𝑑)
We get a family of morphisms parameterized by 𝑑. They form a nat-
ural transformation between the functor 𝐼 and the functor 𝑅 ∘ 𝐿 (the
naturality condition is easy to verify). This is exactly our unit, 𝜂.
Conversely, starting from the existence of the unit and co-unit, we
can define the transformations between hom-sets. For instance, let’s
pick an arbitrary morphism 𝑓 in the hom-set 𝐂(𝐿𝑑,𝑐). We want to de-
fine a 𝜑 that, acting on 𝑓, produces a morphism in 𝐃(𝑑,𝑅𝑐).
Thereisn’treallymuchchoice.Onethingwecantryistolift𝑓 using
𝑅. That will produce a morphism 𝑅𝑓 from 𝑅(𝐿𝑑) to 𝑅𝑐 — a morphism
that’s an element of 𝐃((𝑅 ∘ 𝐿)𝑑,𝑅𝑐).
266What we need for a component of 𝜑, is a morphism from 𝑑 to 𝑅𝑐.
That’s not a problem, since we can use a component of 𝜂𝑑 to get from 𝑑
to (𝑅 ∘ 𝐿)𝑑. We get:
𝜑𝑓 = 𝑅𝑓 ∘ 𝜂𝑑
The other direction is analogous, and so is the derivation of 𝜓.
GoingbacktotheHaskelldefinitionofAdjunction,thenaturaltrans-
formations 𝜑 and 𝜓 are replaced by polymorphic (in a and b) functions
leftAdjunct and rightAdjunct, respectively. The functors 𝐿 and 𝑅 are
called f and u:
class (Functor f, Representable u) =>
Adjunction f u | f -> u, u -> f where
leftAdjunct :: (f a -> b) -> (a -> u b)
rightAdjunct :: (a -> u b) -> (f a -> b)
The equivalence between the unit/counit formulation and the
leftAdjunct/rightAdjunct formulation is witnessed by these mappings:
unit = leftAdjunct id
counit = rightAdjunct id
leftAdjunct f = fmap f . unit
rightAdjunct f = counit . fmap f
It’s very instructive to follow the translation from the categorical de-
scription of the adjunction to Haskell code. I highly encourage this as
an exercise.
We are now ready to explain why, in Haskell, the right adjoint is
automatically a representable functor. The reason for this is that, to the
first approximation, we can treat the category of Haskell types as the
category of sets.
267When the right category 𝐃 is 𝐒𝐞𝐭, the right adjoint 𝑅 is a functor
from 𝐂 to 𝐒𝐞𝐭. Such a functor is representable if we can find an object
𝑟𝑒𝑝 in 𝐂 such that the hom-functor 𝐂(𝑟𝑒𝑝,_) is naturally isomorphic to
𝑅. It turns out that, if 𝑅 is the right adjoint of some functor 𝐿 from 𝐒𝐞𝐭
to 𝐂, such an object always exists — it’s the image of the singleton set
() under 𝐿:
𝑟𝑒𝑝 = 𝐿()
Indeed, the adjunction tells us that the following two hom-sets are nat-
urally isomorphic:
𝐂(𝐿(),𝑐) ≅ 𝐒𝐞𝐭((),𝑅𝑐)
For a given 𝑐, the right hand side is the set of functions from the sin-
gleton set () to 𝑅𝑐. We’ve seen earlier that each such function picks one
element from the set 𝑅 𝑐. The set of such functions is isomorphic to the
set 𝑅𝑐. So we have:
𝐂(𝐿(),−) ≅ 𝑅
which shows that 𝑅 is indeed representable.
## 18.3 Product from Adjunction
We have previously introduced several concepts using universal con-
structions. Many of those concepts, when defined globally, are easier
to express using adjunctions. The simplest non-trivial example is that
of the product. The gist of the universal construction of the product is
theability to factorizeanyproduct-likecandidate throughthe universal
product.
More precisely, the product of two objects 𝑎 and 𝑏 is the object (𝑎 ×
𝑏) (or (a, b) in the Haskell notation) equipped with two morphisms
𝑓𝑠𝑡 and 𝑠𝑛𝑑 such that, for any other candidate 𝑐 equipped with two
268morphisms 𝑝 ∷ 𝑐 → 𝑎 and 𝑞 ∷ 𝑐 → 𝑏, there exists a unique morphism
𝑚 ∷ 𝑐 → (𝑎,𝑏) that factorizes 𝑝 and 𝑞 through 𝑓𝑠𝑡 and 𝑠𝑛𝑑.
As we’ve seen earlier, in Haskell, we can implement a factorizer
that generates this morphism from the two projections:
factorizer :: (c -> a) -> (c -> b) -> (c -> (a, b))
factorizer p q = \x -> (p x, q x)
It’s easy to verify that the factorization conditions hold:
fst . factorizer p q = p
snd . factorizer p q = q
Wehaveamappingthattakesapairofmorphismsp andq andproduces
another morphism m = factorizer p q.
How can we translate this into a mapping between two hom-sets
that we need to define an adjunction? The trick is to go outside of Hask
and treat the pair of morphisms as a single morphism in the product
category.
Let me remind you what a product category is. Take two arbitrary
categories 𝐂 and 𝐃. The objects in the product category 𝐂×𝐃 are pairs
of objects, one from 𝐂 and one from 𝐃. The morphisms are pairs of
morphisms, one from 𝐂 and one from 𝐃.
To define a product in some category 𝐂, we should start with the
productcategory𝐂×𝐂.Pairsofmorphismfrom𝐂aresinglemorphisms
in the product category 𝐂 × 𝐂.
269It might be a little confusing at first that we are using a product cate-
gory to define a product. These are, however, very different products.
We don’t need a universal construction to define a product category.
All we need is the notion of a pair of objects and a pair of morphisms.
However, a pair of objects from 𝐂 is not an object in 𝐂. It’s an ob-
ject in a different category, 𝐂 × 𝐂. We can write the pair formally as
⟨𝑎,𝑏⟩, where 𝑎 and 𝑏 are objects of 𝐂. The universal construction, on the
other hand, is necessary in order to define the object 𝑎 × 𝑏 (or (a, b)
in Haskell), which is an object in the same category 𝐂. This object is
supposed to represent the pair ⟨𝑎,𝑏⟩ in a way specified by the univer-
sal construction. It doesn’t always exist and, even if it exists for some,
might not exist for other pairs of objects in 𝐂.
Let’s now look at the factorizer as a mapping of hom-sets. The
first hom-set is in the product category 𝐂×𝐂, and the second is in 𝐂. A
general morphism in 𝐂 × 𝐂 would be a pair of morphisms ⟨𝑓,𝑔⟩:
𝑓 ∷ 𝑐′ → 𝑎
𝑔 ∷ 𝑐″ → 𝑏
270with 𝑐″ potentially different from 𝑐′. But to define a product, we are
interested in a special morphism in 𝐂 × 𝐂, the pair 𝑝 and 𝑞 that share
the same source object 𝑐. That’s okay: In the definition of an adjuncion,
the source of the left hom-set is not an arbitrary object — it’s the result
of the left functor 𝐿 acting on some object from the right category. The
functor that fits the bill is easy to guess — it’s the diagonal functor Δ
from 𝐂 to 𝐂 × 𝐂, whose action on objects is:
Δ 𝑐 = ⟨𝑐,𝑐⟩
The left-hand side hom-set in our adjunction should thus be:
(𝐂 × 𝐂)(Δ 𝑐,⟨𝑎,𝑏⟩)
It’s a hom-set in the product category. Its elements are pairs of mor-
phisms that we recognize as the arguments to our factorizer:
(𝑐 → 𝑎) → (𝑐 → 𝑏)…
The right-hand side hom-set lives in 𝐂, and it goes between the source
object 𝑐 and the result of some functor 𝑅 acting on the target object in
𝐂×𝐂. That’s the functor that maps the pair ⟨𝑎,𝑏⟩ to our product object,
𝑎 × 𝑏. We recognize this element of the hom-set as the result of the
factorizer:
… → (𝑐 → (𝑎,𝑏))
271Westilldon’thaveafulladjunction.Forthatwefirstneedourfactorizer
to be invertible — we are building an isomorphism between hom-sets.
The inverse of the factorizer should start from a morphism 𝑚 — a mor-
phism from some object 𝑐 to the product object 𝑎×𝑏. In other words, 𝑚
should be an element of:
𝐂(𝑐,𝑎 × 𝑏)
The inverse factorizer should map 𝑚 to a morphism ⟨𝑝,𝑞⟩ in 𝐂×𝐂 that
goes from ⟨𝑐,𝑐⟩ to ⟨𝑎,𝑏⟩; in other words, a morphism that’s an element
of:
(𝐂 × 𝐂)(Δ 𝑐,⟨𝑎,𝑏⟩)
If that mapping exists, we conclude that there exists the right adjoint to
the diagonal functor. That functor defines a product.
In Haskell, we can always construct the inverse of the factorizer
by composing m with, respectively, fst and snd.
p = fst . m
q = snd . m
272To complete the proof of the equivalence of the two ways of defining
a product we also need to show that the mapping between hom-sets is
natural in 𝑎, 𝑏, and 𝑐. I will leave this as an exercise for the dedicated
reader.
To summarize what we have done: A categorical product may be
defined globally as the right adjoint of the diagonal functor:
(𝐂 × 𝐂)(Δ 𝑐,⟨𝑎,𝑏⟩) ≅ 𝐂(𝑐,𝑎 × 𝑏)
Here,𝑎×𝑏 istheresultoftheactionofourrightadjointfunctor𝑃𝑟𝑜𝑑𝑢𝑐𝑡
on the pair ⟨𝑎,𝑏⟩. Notice that any functor from 𝐂 × 𝐂 is a bifunctor,
so 𝑃𝑟𝑜𝑑𝑢𝑐𝑡 is a bifunctor. In Haskell, the 𝑃𝑟𝑜𝑑𝑢𝑐𝑡 bifunctor is written
simply as (,). You can apply it to two types and get their product type,
for instance:
(,) Int Bool ~ (Int, Bool)
## 18.4 Exponential from Adjunction
The exponential 𝑏𝑎, or the function object 𝑎 ⇒ 𝑏, can be defined using
a universal construction. This construction, if it exists for all pairs of
objects, can be seen as an adjunction. Again, the trick is to concentrate
on the statement:
For any other object 𝑧 with a morphism 𝑔 ∷ 𝑧 × 𝑎 → 𝑏
there is a unique morphism ℎ ∷ 𝑧 → (𝑎 ⇒ 𝑏)
This statement establishes a mapping between hom-sets.
In this case, we are dealing with objects in the same category, so the
two adjoint functors are endofunctors. The left (endo-)functor 𝐿, when
273acting on object 𝑧, produces 𝑧 × 𝑎. It’s a functor that corresponds to
taking a product with some fixed 𝑎.
The right (endo-)functor 𝑅, when acting on 𝑏 produces the function
object 𝑎 ⇒ 𝑏 (or 𝑏𝑎). Again, 𝑎 is fixed. The adjunction between these
two functors is often written as:
− × 𝑎 ⊣ (−)𝑎
The mapping of hom-sets that underlies this adjunction is best seen by
redrawing the diagram that we used in the universal construction.
Notice that the 𝑒𝑣𝑎𝑙 morphism1 is nothing else but the counit of this
adjunction:
(𝑎 ⇒ 𝑏) × 𝑎 → 𝑏
where:
(𝑎 ⇒ 𝑏) × 𝑎 = (𝐿 ∘ 𝑅)𝑏
I have previously mentioned that a universal construction defines a
unique object, up to isomorphism. That’s why we have “the” product
and “the” exponential. This property translates to adjunctions as well:
if a functor has an adjoint, this adjoint is unique up to isomorphism.
1See ch.9 on universal construction.
27418.5 Challenges
1. Derive the naturality square for 𝜓, the transformation between
the two (contravariant) functors:
𝑎 → 𝐂(𝐿𝑎,𝑏)
𝑎 → 𝐃(𝑎,𝑅𝑏)
2. Derive the counit 𝜀 starting from the hom-sets isomorphism in
the second definition of the adjunction.
3. Complete the proof of equivalence of the two definitions of the
adjunction.
4. Show that the coproduct can be defined by an adjunction. Start
with the definition of the factorizer for a coproduct.
5. Showthatthecoproductistheleftadjointofthediagonalfunctor.
6. Define the adjunction between a product and a function object in
Haskell.
27519
Free/Forgetful Adjunctions
Free constructions are a powerful application of adjunctions. A
free functor is defined as the left adjoint to a forgetful functor. A
forgetful functor is usually a pretty simple functor that forgets some
structure. For instance, lots of interesting categories are built on top of
sets. But categorical objects, which abstract those sets, have no internal
structure — they have no elements. Still, those objects often carry the
memory of sets, in the sense that there is a mapping — a functor — from
a given category 𝐂 to 𝐒𝐞𝐭. A set corresponding to some object in 𝐂 is
called its underlying set.
Monoids are such objects that have underlying sets — sets of ele-
ments.Thereisaforgetfulfunctor𝑈 fromthecategoryofmonoids𝐌𝐨𝐧
to the category of sets, which maps monoids to their underlying sets. It
also maps monoid morphisms (homomorphisms) to functions between
sets.
276I like to think of 𝐌𝐨𝐧 as having split personality. On the one hand,
it’s a bunch of sets with multiplication and unit elements. On the other
hand, it’s a category with featureless objects whose only structure is
encoded in morphisms that go between them. Every set-function that
preserves multiplication and unit gives rise to a morphism in 𝐌𝐨𝐧.
Things to keep in mind:
• There may be many monoids that map to the same set, and
• There are fewer (or at most as many as) monoid morphisms than
there are functions between their underlying sets.
Monoids 𝑚1 and 𝑚2 have the same underlying set. There are more functions between the under-
lying sets of 𝑚2 and 𝑚3 than there are morphisms between them.
The functor 𝐹 that’s the left adjoint to the forgetful functor 𝑈 is the
free functor that builds free monoids from their generator sets. The ad-
junctionfollowsfromthefreemonoiduniversalconstructionwe’vedis-
cussed before.1
1See ch.13 on free monoids.
277In terms of hom-sets, we can write this adjunction as:
𝐚𝐫𝐠(𝐹𝑥,𝑚) ≅ 𝐒𝐞𝐭(𝑥,𝑈𝑚)
This (natural in 𝑥 and 𝑚) isomorphism tells us that:
• For every monoid homomorphism between the free monoid 𝐹𝑥
generated by 𝑥 and an arbitrary monoid 𝑚 there is a unique func-
tion that embeds the set of generators 𝑥 in the underlying set of
𝑚. It’s a function in 𝐒𝐞𝐭(𝑥,𝑈𝑚).
• For every function that embeds 𝑥 in the underlying set of some
𝑚 there is a unique monoid morphism between the free monoid
generatedby𝑥 andthemonoid𝑚.(Thisisthemorphismwecalled
ℎ in our universal construction.)
The intuition is that 𝐹𝑥 is the “maximum” monoid that can be built on
the basis of 𝑥. If we could look inside monoids, we would see that any
morphismthatbelongsto𝐌𝐨𝐧(𝐹𝑥,𝑚)embeds thisfreemonoidinsome
othermonoid𝑚.Itdoesitbypossiblyidentifyingsomeelements.Inpar-
ticular, it embeds the generators of 𝐹𝑥 (i.e., the elements of 𝑥) in 𝑚. The
278adjunction shows that the embedding of 𝑥, which is given by a function
from 𝐒𝐞𝐭(𝑥,𝑈𝑚) on the right, uniquely determines the embedding of
monoids on the left, and vice versa.
InHaskell,thelistdatastructureisafreemonoid(withsomecaveats:
seeDanDoel’sblogpost2).Alisttype[a] isafreemonoidwiththetype
a representing the set of generators. For instance, the type [Char] con-
tains the unit element — the empty list [] — and the singletons like
['a'], ['b'] — the generators of the free monoid. The rest is generated
byapplyingthe“product.”Here,theproductoftwolistssimplyappends
one to another. Appending is associative and unital (that is, there is a
neutral element — here, the empty list). A free monoid generated by
Char is nothing but the set of all strings of characters from Char. It’s
called String in Haskell:
type String = [Char]
(type defines a type synonym — a different name for an existing type).
Another interesting example is a free monoid built from just one
generator. It’s the type of the list of units, [()]. Its elements are [], [()],
[(), ()], etc. Every such list can be described by one natural number
— its length. There is no more information encoded in the list of units.
Appending two such lists produces a new list whose length is the sum
of the lengths of its constituents. It’s easy to see that the type [()] is
isomorphic to the additive monoid of natural numbers (with zero). Here
are the two functions that are the inverse of each other, witnessing this
isomorphism:
toNat :: [()] -> Int
toNat = length
2http://comonad.com/reader/2015/free-monoids-in-haskell/
279toLst :: Int -> [()]
toLst n = replicate n ()
For simplicity I used the type Int rather than Natural, but the idea is the
same. The function replicate creates a list of length n pre-filled with a
given value — here, the unit.
## 19.1 Some Intuitions
What follows are some hand-waving arguments. Those kind of argu-
ments are far from rigorous, but they help in forming intuitions.
Togetsomeintuitionaboutthefree/forgetfuladjunctionsithelpsto
keep in mind that functors and functions are lossy in nature. Functors
may collapse multiple objects and morphisms, functions may bunch to-
gether multiple elements of a set. Also, their image may cover only part
of their codomain.
An “average” hom-set in 𝐒𝐞𝐭 will contain a whole spectrum of func-
tions starting with the ones that are least lossy (e.g., injections or, pos-
sibly, isomorphisms) and ending with constant functions that collapse
the whole domain to a single element (if there is one).
I tend to think of morphisms in an arbitrary category as being lossy
too.It’sjustamentalmodel,butit’sausefulone,especiallywhenthink-
ing of adjunctions — in particular those in which one of the categories
is 𝐒𝐞𝐭.
Formally, we can only speak of morphisms that are invertible (iso-
morphisms) or non-invertible. It’s that latter kind that may be thought
of as lossy. There is also a notion of mono- and epi- morphisms that
generalize the idea of injective (non-collapsing) and surjective (cover-
280ingthewholecodomain)functions,butit’spossibletohaveamorphism
that is both mono and epi, and which is still non-invertible.
In the Free ⊣ Forgetful adjunction, we have the more constrained
category 𝐂 on the left, and a less constrained category 𝐃 on the right.
Morphisms in 𝐂 are “fewer” because they have to preserve some addi-
tionalstructure.Inthecaseof𝐌𝐨𝐧,theyhavetopreservemultiplication
and unit. Morphisms in 𝐃 don’t have to preserve as much structure, so
there are “more” of them.
When we apply a forgetful functor 𝑈 to an object 𝑐 in 𝐂, we think
of it as revealing the “internal structure” of 𝑐. In fact, if 𝐃 is 𝐒𝐞𝐭 we
think of 𝑈 as defining the internal structure of 𝑐 — its underlying set.
(In an arbitrary category, we can’t talk about the internals of an object
other than through its connections to other objects, but here we are just
hand-waving.)
If we map two objects 𝑐′ and 𝑐 using 𝑈, we expect that, in gen-
eral, the mapping of the hom-set 𝐂(𝑐′,𝑐) will cover only a subset of
𝐃(𝑈𝑐′,𝑈𝑐). That’s because morphisms in 𝐂(𝑐′,𝑐) have to preserve the
additional structure, whereas the ones in 𝐃(𝑈𝑐′,𝑈𝑐) don’t.
Butsinceanadjunctionisdefinedasanisomporphismofparticularhom-
sets,wehavetobeverypickywithourselectionof𝑐′.Intheadjunction,
𝑐′ is picked not from just anywhere in 𝐂, but from the (presumably
281smaller) image of the free functor 𝐹:
𝐂(𝐹𝑑,𝑐) ≅ 𝐃(𝑑,𝑈𝑐)
The image of 𝐹 must therefore consist of objects that have lots of mor-
phismsgoingtoanarbitrary𝑐.Infact,therehastobeasmanystructure-
preserving morphisms from 𝐹𝑑 to 𝑐 as there are non-structure preserv-
ing morphisms from 𝑑 to 𝑈𝑐. It means that the image of 𝐹 must con-
sist of essentially structure-free objects (so that there is no structure
to preserve by morphisms). Such “structure-free” objects are called free
objects.
Inthemonoidexample,afreemonoidhasnostructureotherthanwhat’s
generated by unit and associativity laws. Other than that, all multipli-
cations produce brand new elements.
In a free monoid, 2∗3 is not 6 — it’s a new element [2,3]. Since there
is no identification of [2,3] and 6, a morphism from this free monoid
to any other monoid 𝑚 is allowed to map them separately. But it’s also
okay for it to map both [2,3] and 6 (their product) to the same element
of 𝑚. Or to identify [2,3] and 5 (their sum) in an additive monoid, and
so on. Different identifications give you different monoids.
This leads to another interesting intuition: Free monoids, instead
of performing the monoidal operation, accumulate the arguments that
282were passed to it. Instead of multiplying 2 and 3 they remember 2 and
3 in a list. The advantage of this scheme is that we don’t have to specify
what monoidal operation we will use. We can keep accumulating argu-
ments, and only at the end apply an operator to the result. And it’s then
that we can chose what operator to apply. We can add the numbers, or
multiply them, or perform addition modulo 2, and so on. A free monoid
separates the creation of an expression from its evaluation. We’ll see
this idea again when we talk about algebras.
This intuition generalizes to other, more elaborate free construc-
tions. For instance, we can accumulate whole expression trees before
evaluating them. The advantage of this approach is that we can trans-
form such trees to make the evaluation faster or less memory consum-
ing. This is, for instance, done in implementing matrix calculus, where
eager evaluation would lead to lots of allocations of temporary arrays
to store intermediate results.
## 19.2 Challenges
1. Consider a free monoid built from a singleton set as its generator.
Show that there is a one-to-one correspondence between mor-
phisms from this free monoid to any monoid 𝑚, and functions
from the singleton set to the underlying set of 𝑚.
28320 Monads: Programmer’s Definition
Programmers have developed a whole mythology around monads.
It’s supposed to be one of the most abstract and difficult concepts in
programming. There are people who “get it” and those who don’t. For
many, the moment when they understand the concept of the monad
is like a mystical experience. The monad abstracts the essence of so
many diverse constructions that we simply don’t have a good analogy
for it in everyday life. We are reduced to groping in the dark, like those
blind men touching different parts of the elephant end exclaiming tri-
umphantly: “It’s a rope,” “It’s a tree trunk,” or “It’s a burrito!”
Let me set the record straight: The whole mysticism around the
monad is the result of a misunderstanding. The monad is a very sim-
ple concept. It’s the diversity of applications of the monad that causes
the confusion.
As part of research for this post I looked up duct tape (a.k.a., duck
tape) and its applications. Here’s a little sample of things that you can
do with it:
284• sealing ducts
• fixing CO2 scrubbers on board Apollo 13
• wart treatment
• fixing Apple’s iPhone 4 dropped call issue
• making a prom dress
• building a suspension bridge
Now imagine that you didn’t know what duct tape was and you were
trying to figure it out based on this list. Good luck!
So I’d like to add one more item to the collection of “the monad is
like…” clichés: The monad is like duct tape. Its applications are widely
diverse, but its principle is very simple: it glues things together. More
precisely, it composes things.
This partially explains the difficulties a lot of programmers, espe-
cially those coming from the imperative background, have with under-
standing the monad. The problem is that we are not used to thinking
of programming in terms of function composition. This is understand-
able. We often give names to intermediate values rather than pass them
directly from function to function. We also inline short segments of
glue code rather than abstract them into helper functions. Here’s an
imperative-style implementation of the vector-length function in C:
double vlen(double * v) {
double d = 0.0;
int n;
for (n = 0; n < 3; ++n)
d += v[n] * v[n];
return sqrt(d);
}
Compare this with the (stylized) Haskell version that makes function
composition explicit:
285vlen = sqrt . sum . fmap (flip (^) 2)
(Here, to make things even more cryptic, I partially applied the expo-
nentiation operator (^) by setting its second argument to 2.)
I’m not arguing that Haskell’s point-free style is always better, just
that function composition is at the bottom of everything we do in pro-
gramming. And even though we are effectively composing functions,
Haskelldoesgotogreatlengthstoprovideimperative-stylesyntaxcalled
thedo notationformonadiccomposition.We’llseeitsuselater.Butfirst,
let me explain why we need monadic composition in the first place.
## 20.1 The Kleisli Category
Wehavepreviouslyarrivedatthewritermonadbyembellishingregular
functions. The particular embellishment was done by pairing their re-
turn values with strings or, more generally, with elements of a monoid.
We can now recognize that such embellishment is a functor:
newtype Writer w a = Writer (a, w)
instance Functor (Writer w) where
fmap f (Writer (a, w)) = Writer (f a, w)
We have subsequently found a way of composing embellished func-
tions, or Kleisli arrows, which are functions of the form:
a -> Writer w b
It was inside the composition that we implemented the accumulation of
the log.
286We are now ready for a more general definition of the Kleisli cate-
gory.Westartwithacategory𝐂andanendofunctor𝑚.Thecorrespond-
ing Kleisli category 𝐊 has the same objects as 𝐂, but its morphisms are
different. A morphism between twoobjects 𝑎 and 𝑏 in 𝐊 is implemented
as a morphism:
𝑎 → 𝑚 𝑏
in the original category 𝐂. It’s important to keep in mind that we treat
a Kleisli arrow in 𝐊 as a morphism between 𝑎 and 𝑏, and not between 𝑎
and 𝑚 𝑏.
Inourexample,𝑚wasspecializedtoWriter w,forsomefixedmonoid
w.
Kleisli arrows form a category only if we can define proper compo-
sition for them. If there is a composition, which is associative and has
an identity arrow for every object, then the functor 𝑚 is called a monad,
and the resulting category is called the Kleisli category.
InHaskell,Kleislicompositionisdefinedusingthefishoperator>=>,
and the identity arrow is a polymorphic function called return. Here’s
the definition of a monad using Kleisli composition:
class Monad m where
(>=>) :: (a -> m b) -> (b -> m c) -> (a -> m c)
return :: a -> m a
Keep in mind that there are many equivalent ways of defining a monad,
and that this is not the primary one in the Haskell ecosystem. I like it
for its conceptual simplicity and the intuition it provides, but there are
other definitions that are more convenient when programming. We’ll
talk about them momentarily.
In this formulation, monad laws are very easy to express. They can-
not be enforced in Haskell, but they can be used for equational rea-
287soning. They are simply the standard composition laws for the Kleisli
category:
(f >=> g) >=> h = f >=> (g >=> h) -- associativity
return >=> f = f -- left unit
f >=> return = f -- right unit
This kind of a definition also expresses what a monad really is: it’s a
way of composing embellished functions. It’s not about side effects or
state. It’s about composition. As we’ll see later, embellished functions
may be used to express a variety of effects or state, but that’s not what
the monad is for. The monad is the sticky duct tape that ties one end of
an embellished function to the other end of an embellished function.
GoingbacktoourWriter example:Theloggingfunctions(theKleisli
arrowsfortheWriter functor)formacategorybecauseWriter isamonad:
instance Monoid w => Monad (Writer w) where
f >=> g = \a ->
let Writer (b, s) = f a
Writer (c, s') = g b
in Writer (c, s `mappend` s')
return a = Writer (a, mempty)
Monad laws for Writer w are satisfied as long as monoid laws for w are
satisfied (they can’t be enforced in Haskell either).
There’s a useful Kleisli arrow defined for the Writer monad called
tell. It’s sole purpose is to add its argument to the log:
tell :: w -> Writer w ()
tell s = Writer ((), s)
We’ll use it later as a building block for other monadic functions.
28820.2 Fish Anatomy
When implementing the fish operator for different monads you quickly
realize that a lot of code is repeated and can be easily factored out. To
beginwith,theKleislicompositionoftwofunctionsmustreturnafunc-
tion, so its implementation may as well start with a lambda taking an
argument of type a:
(>=>) :: (a -> m b) -> (b -> m c) -> (a -> m c)
f >=> g = \a -> ...
The only thing we can do with this argument is to pass it to f:
f >=> g = \a -> let mb = f a
in ...
At this point we have to produce the result of type m c, having at our
disposal an object of type m b and a function g :: b -> m c. Let’s define
afunctionthatdoesthatforus.Thisfunctioniscalledbind andisusually
written in the form of an infix operator:
(>>=) :: m a -> (a -> m b) -> m b
For every monad, instead of defining the fish operator, we may instead
definebind.InfactthestandardHaskelldefinitionofamonadusesbind:
class Monad m where
(>>=) :: m a -> (a -> m b) -> m b
return :: a -> m a
Here’s the definition of bind for the Writer monad:
289(Writer (a, w)) >>= f = let Writer (b, w') = f a
in Writer (b, w `mappend` w')
It is indeed shorter than the definition of the fish operator.
It’s possible to further dissect bind, taking advantage of the fact that
m is a functor. We can use fmap to apply the function a -> m b to the
contents of m a. This will turn a into m b. The result of the application is
therefore of type m (m b). This is not exactly what we want — we need
the result of type m b — but we’re close. All we need is a function that
collapses or flattens the double application of m. Such function is called
join:
join :: m (m a) -> m a
Using join, we can rewrite bind as:
ma >>= f = join (fmap f ma)
That leads us to the third option for defining a monad:
class Functor m => Monad m where
join :: m (m a) -> m a
return :: a -> m a
Here we have explicitly requested that m be a Functor. We didn’t have
to do that in the previous two definitions of the monad. That’s because
any type constructor m that either supports the fish or bind operator
is automatically a functor. For instance, it’s possible to define fmap in
terms of bind and return:
fmap f ma = ma >>= \a -> return (f a)
For completeness, here’s join for the Writer monad:
join :: Monoid w => Writer w (Writer w a) -> Writer w a
join (Writer ((Writer (a, w')), w)) = Writer (a, w `mappend` w')
29020.3 The do Notation
One way of writing code using monads is to work with Kleisli arrows
— composing them using the fish operator. This mode of programming
is the generalization of the point-free style. Point-free code is compact
and often quite elegant. In general, though, it can be hard to under-
stand, bordering on cryptic. That’s why most programmers prefer to
give names to function arguments and intermediate values.
Whendealingwithmonadsitmeansfavoringthebindoperatorover
the fish operator. Bind takes a monadic value and returns a monadic
value. The programmer may chose to give names to those values. But
that’s hardly an improvement. What we really want is to pretend that
we are dealing with regular values, not the monadic containers that en-
capsulate them. That’s how imperative code works — side effects, such
as updating a global log, are mostly hidden from view. And that’s what
the do notation emulates in Haskell.
You might be wondering then, why use monads at all? If we want
to make side effects invisible, why not stick to an imperative language?
The answer is that the monad gives us much better control over side
effects. For instance, the log in the Writer monad is passed from func-
tion to function and is never exposed globally. There is no possibility of
garbling the log or creating a data race. Also, monadic code is clearly
demarcated and cordoned off from the rest of the program.
The do notation is just syntactic sugar for monadic composition. On
the surface, it looks a lot like imperative code, but it translates directly
to a sequence of binds and lambda expressions.
For instance, take the example we used previously to illustrate the
composition of Kleisli arrows in the Writer monad. Using our current
definitions, it could be rewritten as:
291process :: String -> Writer String [String]
process = upCase >=> toWords
This function turns all characters in the input string to upper case and
splits it into words, all the while producing a log of its actions.
In the do notation it would look like this:
process s = do
upStr <- upCase s
toWords upStr
Here, upStr is just a String, even though upCase produces a Writer:
upCase :: String -> Writer String String
upCase s = Writer (map toUpper s, "upCase ")
This is because the do block is desugared by the compiler to:
process s =
upCase s >>= \upStr ->
toWords upStr
The monadic result of upCase is bound to a lambda that takes a String.
It’s the name of this string that shows up in the do block. When reading
the line:
upStr <- upCase s
we say that upStr gets the result of upCase s.
The pseudo-imperative style is even more pronounced when we in-
line toWords. We replace it with the call to tell, which logs the string
"toWords ", followed by the call to return with the result of splitting the
stringupStr usingwords.Noticethatwords isaregularfunctionworking
on strings.
292process s = do
upStr <- upCase s
tell "toWords "
return (words upStr)
Here, each line in the do block introduces a new nested bind in the
desugared code:
process s =
upCase s >>= \upStr ->
tell "toWords " >>= \() ->
return (words upStr)
Notice that tell produces a unit value, so it doesn’t have to be passed
to the following lambda. Ignoring the contents of a monadic result (but
not its effect — here, the contribution to the log) is quite common, so
there is a special operator to replace bind in that case:
(>>) :: m a -> m b -> m b
m >> k = m >>= (\_ -> k)
The actual desugaring of our code looks like this:
process s =
upCase s >>= \upStr ->
tell "toWords " >>
return (words upStr)
In general, do blocks consist of lines (or sub-blocks) that either use the
left arrow to introduce new names that are then available in the rest of
the code, or are executed purely for side-effects. Bind operators are im-
plicit between the lines of code. Incidentally, it is possible, in Haskell, to
293replace the formatting in the do blocks with braces and semicolons. This
providesthejustificationfordescribingthemonadasawayofoverload-
ing the semicolon.
Notice that the nesting of lambdas and bind operators when desug-
aring the do notation has the effect of influencing the execution of the
rest of the do block based on the result of each line. This property can be
used to introduce complex control structures, for instance to simulate
exceptions.
Interestingly, the equivalent of the do notation has found its appli-
cation in imperative languages, C++ in particular. I’m talking about re-
sumable functions or coroutines. It’s not a secret that C++ futures form
a monad1. It’s an example of the continuation monad, which we’ll dis-
cuss shortly. The problem with continuations is that they are very hard
to compose. In Haskell, we use the do notation to turn the spaghetti
of “my handler will call your handler” into something that looks very
much like sequential code. Resumable functions make the same trans-
formation possible in C++. And the same mechanism can be applied to
turn the spaghetti of nested loops2 into list comprehensions or “gener-
ators,” which are essentially the do notation for the list monad. With-
out the unifying abstraction of the monad, each of these problems is
typically addressed by providing custom extensions to the language. In
Haskell, this is all dealt with through libraries.
1https://bartoszmilewski.com/2014/02/26/c17-i-see-a-monad-in-your-future/
2https://bartoszmilewski.com/2014/04/21/getting-lazy-with-c/
29421 Monads and Effects
Now that we know what the monad is for — it lets us compose em-
bellished functions — the really interesting question is why embel-
lished functions are so important in functional programming. We’ve al-
ready seen one example, the Writer monad, where embellishment let us
create and accumulate a log across multiple function calls. A problem
that would otherwise be solved using impure functions (e.g., by access-
ing and modifying some global state) was solved with pure functions.
## 21.1 The Problem
Here is a short list of similar problems, copied from Eugenio Moggi’s
seminal paper1, all of which are traditionally solved by abandoning the
purity of functions.
• Partiality: Computations that may not terminate
1https://core.ac.uk/download/pdf/21173011.pdf
295• Nondeterminism: Computations that may return many results
• Side effects: Computations that access/modify state
– Read-only state, or the environment
– Write-only state, or a log
– Read/write state
• Exceptions: Partial functions that may fail
• Continuations: Ability to save state of the program and then re-
store it on demand
• Interactive Input
• Interactive Output
Whatreallyismindblowingisthatalltheseproblemsmaybesolved
usingthesameclevertrick:turningtoembellishedfunctions.Ofcourse,
the embellishment will be totally different in each case.
You have to realize that, at this stage, there is no requirement that
the embellishment be monadic. It’s only when we insist on composition
— being able to decompose a single embellished function into smaller
embellished functions — that weneed a monad. Again, since each of the
embellishments is different, monadic composition will be implemented
differently,buttheoverallpatternisthesame.It’saverysimplepattern:
composition that is associative and equipped with identity.
The next section is heavy on Haskell examples. Feel free to skim or
even skip it if you’re eager to get back to category theory or if you’re
already familiar with Haskell’s implementation of monads.
## 21.2 The Solution
First, let’s analyze the way we used the Writer monad. We started with
apurefunctionthatperformedacertaintask—givenarguments,itpro-
296ducedacertainoutput.Wereplacedthisfunctionwithanotherfunction
thatembellishedtheoriginaloutputbypairingitwithastring.Thatwas
our solution to the logging problem.
We couldn’t stop there because, in general, we don’t want to deal
with monolithic solutions. We needed to be able to decompose one log-
producing function into smaller log-producing functions. It’s the com-
positionofthosesmallerfunctionsthatledustotheconceptofamonad.
What’s really amazing is that the same pattern of embellishing the
function return types works for a large variety of problems that nor-
mally would require abandoning purity. Let’s go through our list and
identify the embellishment that applies to each problem in turn.
## 21.2.1 Partiality
We modify the return type of every function that may not terminate by
turning it into a “lifted” type — a type that contains all values of the
original type plus the special “bottom” value ⊥. For instance, the Bool
type, as a set, would contain two elements: True and False. The lifted
Bool contains three elements. Functions that return the lifted Bool may
produce True or False, or execute forever.
The funny thing is that, in a lazy language like Haskell, a never-
ending function may actually return a value, and this value may be
passed to the next function. We call this special value the bottom. As
long as this value is not explicitly needed (for instance, to be pattern
matched,orproducedasoutput),itmaybepassedaroundwithoutstalling
the execution of the program. Because every Haskell function may be
potentiallynon-terminating,alltypesinHaskellareassumedtobelifted.
This is why we often talk about the category Hask of Haskell (lifted)
297types and functions rather than the simpler 𝐒𝐞𝐭. It is not clear, though,
that Hask is a real category (see this Andrej Bauer post2).
## 21.2.2 Nondeterminism
If a function can return many different results, it may as well return
them all at once. Semantically, a non-deterministic function is equiva-
lent to a function that returns a list of results. This makes a lot of sense
in a lazy garbage-collected language. For instance, if all you need is one
value, you can just take the head of the list, and the tail will never be
evaluated. If you need a random value, use a random number generator
to pick the n-th element of the list. Laziness even allows you to return
an infinite list of results.
In the list monad — Haskell’s implementation of nondeterministic
computations — join is implemented as concat. Remember that join is
supposed to flatten a container of containers — concat concatenates a
list of lists into a single list. return creates a singleton list:
instance Monad [] where
join = concat
return x = [x]
The bind operator for the list monad is given by the general formula:
fmap followed by join which, in this case gives:
as >>= k = concat (fmap k as)
Here, the function k, which itself produces a list, is applied to every
element of the list as. The result is a list of lists, which is flattened using
concat.
2http://math.andrej.com/2016/08/06/hask-is-not-a-category/
298From the programmer’s point of view, working with a list is eas-
ier than, for instance, calling a non-deterministic function in a loop, or
implementing a function that returns an iterator (although, in modern
C++3, returning a lazy range would be almost equivalent to returning a
list in Haskell).
A good example of using non-determinism creatively is in game
programming. For instance, when a computer plays chess against a hu-
man, it can’t predict the opponent’s next move. It can, however, gener-
ate a list of all possible moves and analyze them one by one. Similarly,
a non-deterministic parser may generate a list of all possible parses for
a given expression.
Even though we may interpret functions returning lists as non-
deterministic, the applications of the list monad are much wider. That’s
because stitching together computations that produce lists is a perfect
functional substitute for iterative constructs — loops — that are used
in imperative programming. A single loop can be often rewritten using
fmap that applies the body of the loop to each element of the list. The do
notation in the list monad can be used to replace complex nested loops.
My favorite example is the program that generates Pythagorean
triples — triples of positive integers that can form sides of right trian-
gles.
triples = do
z <- [1..]
x <- [1..z]
y <- [x..z]
guard (x^2 + y^2 == z^2)
return (x, y, z)
3http://ericniebler.com/2014/04/27/range-comprehensions/
299The first line tells us that z gets an element from an infinite list of posi-
tive numbers [1..]. Then x gets an element from the (finite) list [1..z]
of numbers between 1 and z. Finally y gets an element from the list of
numbers between x and z. We have three numbers 1 ⩽ 𝑥 ⩽ 𝑦 ⩽ 𝑧 at our
disposal. The function guard takes a Bool expression and returns a list
of units:
guard :: Bool -> [()]
guard True = [()]
guard False = []
This function (which is a member of a larger class called MonadPlus) is
used here to filter out non-Pythagorean triples. Indeed, if you look at
the implementation of bind (or the related operator >>), you’ll notice
that, when given an empty list, it produces an empty list. On the other
hand, when given a non-empty list (here, the singleton list containing
unit[()]),bindwillcallthecontinuation,herereturn (x, y, z),which
produces a singleton list with a verified Pythagorean triple. All those
singleton lists will be concatenated by the enclosing binds to produce
the final (infinite) result. Of course, the caller of triples will never be
able to consume the whole list, but that doesn’t matter, because Haskell
is lazy.
The problem that normally wouldrequire a set of three nested loops
has been dramatically simplified with the help of the list monad and the
do notation. As if that weren’t enough, Haskell let’s you simplify this
code even further using list comprehension:
triples = [(x, y, z) | z <- [1..]
, x <- [1..z]
, y <- [x..z]
, x^2 + y^2 == z^2]
300This is just further syntactic sugar for the list monad (strictly speaking,
MonadPlus).
You might see similar constructs in other functional or imperative
languages under the guise of generators and coroutines.
## 21.2.3 Read-Only State
A function that has read-only access to some external state, or environ-
ment, can be always replaced by a function that takes that environment
as an additional argument. A pure function (a, e) -> b (where e is the
type of the environment) doesn’t look, at first sight, like a Kleisli arrow.
But as soon as we curry it to a -> (e -> b) we recognize the embellish-
ment as our old friend the reader functor:
newtype Reader e a = Reader (e -> a)
You may interpret a function returning a Reader as producing a mini-
executable: an action that given an environment produces the desired
result. There is a helper function runReader to execute such an action:
runReader :: Reader e a -> e -> a
runReader (Reader f) e = f e
It may produce different results for different values of the environment.
Notice that both the function returning a Reader, and the Reader
action itself are pure.
To implement bind for the Reader monad, first notice that you have
to produce a function that takes the environment e and produces a b:
ra >>= k = Reader (\e -> ...)
Inside the lambda, we can execute the action ra to produce an a:
301ra >>= k = Reader (\e -> let a = runReader ra e
in ...)
We can then pass the a to the continuation k to get a new action rb:
ra >>= k = Reader (\e -> let a = runReader ra e
rb = k a
in ...)
Finally, we can run the action rb with the environment e:
ra >>= k = Reader (\e -> let a = runReader ra e
rb = k a
in runReader rb e)
To implement return we create an action that ignores the environment
and returns the unchanged value.
Putting it all together, after a few simplifications, we get the follow-
ing definition:
instance Monad (Reader e) where
ra >>= k = Reader (\e -> runReader (k (runReader ra e)) e)
return x = Reader (\e -> x)
## 21.2.4 Write-Only State
This is just our initial logging example. The embellishment is given by
the Writer functor:
newtype Writer w a = Writer (a, w)
For completeness, there’s also a trivial helper runWriter that unpacks
the data constructor:
302runWriter :: Writer w a -> (a, w)
runWriter (Writer (a, w)) = (a, w)
As we’ve seen before, in order to make Writer composable, w has to be
a monoid. Here’s the monad instance for Writer written in terms of the
bind operator:
instance (Monoid w) => Monad (Writer w) where
(Writer (a, w)) >>= k = let (a', w') = runWriter (k a)
in Writer (a', w `mappend` w')
return a = Writer (a, mempty)
## 21.2.5 State
Functions that have read/write access to state combine the embellish-
ments of the Reader and the Writer. You may think of them as pure
functions that take the state as an extra argument and produce a pair
value/state as a result: (a, s) -> (b, s). After currying, we get them
into the form of Kleisli arrows a -> (s -> (b, s)), with the embellish-
ment abstracted in the State functor:
newtype State s a = State (s -> (a, s))
Again, we can look at a Kleisli arrow as returning an action, which can
be executed using the helper function:
runState :: State s a -> s -> (a, s)
runState (State f) s = f s
Different initial states may not only produce different results, but also
different final states.
The implementation of bind for the State monad is very similar to
that of the Reader monad, except that care has to be taken to pass the
correct state at each step:
303sa >>= k = State (\s -> let (a, s') = runState sa s
sb = k a
in runState sb s')
Here’s the full instance:
instance Monad (State s) where
sa >>= k = State (\s -> let (a, s') = runState sa s
in runState (k a) s')
return a = State (\s -> (a, s))
There are also two helper Kleisli arrows that may be used to manipulate
the state. One of them retrieves the state for inspection:
get :: State s s
get = State (\s -> (s, s))
and the other replaces it with a completely new state:
put :: s -> State s ()
put s' = State (\s -> ((), s'))
## 21.2.6 Exceptions
Animperativefunctionthatthrowsanexceptionisreallyapartialfunc-
tion — it’s a function that’s not defined for some values of its argu-
ments. The simplest implementation of exceptions in terms of pure to-
tal functions uses the Maybe functor. A partial function is extended to a
total function that returns Just a wheneverit makes sense, and Nothing
when it doesn’t. If we want to also return some information about the
cause of the failure, we can use the Either functor instead (with the first
type fixed, for instance, to String).
Here’s the Monad instance for Maybe:
304instance Monad Maybe where
Nothing >>= k = Nothing
Just a >>= k = k a
return a = Just a
Notice that monadic composition for Maybe correctly short-circuits the
computation (the continuation k is never called) when an error is de-
tected. That’s the behavior we expect from exceptions.
## 21.2.7 Continuations
It’sthe“Don’tcallus,we’llcallyou!”situationyoumayexperienceafter
a job interview. Instead of getting a direct answer, you are supposed to
provide a handler, a function to be called with the result. This style of
programming is especially useful when the result is not known at the
time of the call because, for instance, it’s being evaluated by another
thread or delivered from a remote web site. A Kleisli arrow in this case
returns a function that accepts a handler, which represents “the rest of
the computation”:
data Cont r a = Cont ((a -> r) -> r)
The handler a -> r, when it’s eventually called, produces the result of
type r, and this result is returned at the end. A continuation is parame-
terized by the result type. (In practice, this is often some kind of status
indicator.)
There is also a helper function for executing the action returned by
the Kleisli arrow. It takes the handler and passes it to the continuation:
runCont :: Cont r a -> (a -> r) -> r
runCont (Cont k) h = k h
305The composition of continuations is notoriously difficult, so its han-
dling through a monad and, in particular, the do notation, is of extreme
advantage.
Let’s figure out the implementation of bind. First let’s look at the
stripped down signature:
(>>=) :: ((a -> r) -> r) ->
(a -> (b -> r) -> r) ->
((b -> r) -> r)
Our goal is to create a function that takes the handler (b -> r) and
produces the result r. So that’s our starting point:
ka >>= kab = Cont (\hb -> ...)
Inside the lambda, we want to call the function ka with the appropriate
handler that represents the rest of the computation. We’ll implement
this handler as a lambda:
runCont ka (\a -> ...)
In this case, the rest of the computation involves first calling kab with
a, and then passing hb to the resulting action kb:
runCont ka (\a -> let kb = kab a
in runCont kb hb)
Asyoucansee,continuationsarecomposedinsideout.Thefinalhandler
hb is called from the innermost layer of the computation. Here’s the full
instance:
instance Monad (Cont r) where
ka >>= kab = Cont (\hb -> runCont ka (\a -> runCont (kab a)
hb)) ↪
return a = Cont (\ha -> ha a)
30621.2.8 Interactive Input
This is the trickiest problem and a source of a lot of confusion. Clearly,
a function like getChar, if it were to return a character typed at the key-
board, couldn’t be pure. But what if it returned the character inside a
container?Aslongastherewasnowayofextractingthecharacterfrom
this container, we could claim that the function is pure. Every time you
call getChar it would return exactly the same container. Conceptually,
this container would contain the superposition of all possible charac-
ters.
If you’re familiar with quantum mechanics, you should have no
problemunderstandingthisanalogy.It’sjustliketheboxwiththeSchrödinger’s
cat inside — except that there is no way to open or peek inside the box.
The box is defined using the special built-in IO functor. In our example,
getChar could be declared as a Kleisli arrow:
getChar :: () -> IO Char
(Actually, since a function from the unit type is equivalent to picking
a value of the return type, the declaration of getChar is simplified to
getChar :: IO Char.)
Being a functor, IO lets youmanipulate its contents using fmap. And,
as a functor, it can store the contents of any type, not just a character.
The real utility of this approach comes to light when you consider that,
in Haskell, IO is a monad. It means that you are able to compose Kleisli
arrows that produce IO objects.
You might think that Kleisli composition would allow you to peek
at the contents of the IO object (thus “collapsing the wave function,” if
we were to continue the quantum analogy). Indeed, you could compose
getChar with another Kleisli arrow that takes a character and, say, con-
verts it to an integer. The catch is that this second Kleisli arrow could
307only return this integer as an (IO Int). Again, you’ll end up with a su-
perposition of all possible integers. And so on. The Schrödinger’s cat
is never out of the bag. Once you are inside the IO monad, there is no
way out of it. There is no equivalent of runState or runReader for the IO
monad. There is no runIO!
So what can you do with the result of a Kleisli arrow, the IO object,
other than compose it with another Kleisli arrow? Well, you can return
it from main. In Haskell, main has the signature:
main :: IO ()
and you are free to think of it as a Kleisli arrow:
main :: () -> IO ()
From that perspective, a Haskell program is just one big Kleisli arrow
in the IO monad. You can compose it from smaller Kleisli arrows using
monadic composition. It’s up to the runtime system to do something
with the resulting IO object (also called IO action).
Notice that the arrow itself is a pure function — it’s pure functions
all the way down. The dirty work is relegated to the system. When it
finally executes the IO action returned from main, it does all kinds of
nasty things like reading user input, modifying files, printing obnox-
ious messages, formatting a disk, and so on. The Haskell program never
dirties its hands (well, except when it calls unsafePerformIO, but that’s
a different story).
Of course, because Haskell is lazy, main returns almost immediately,
and the dirty work begins right away. It’s during the execution of the IO
actionthattheresultsofpurecomputationsarerequestedandevaluated
on demand. So, in reality, the execution of a program is an interleaving
of pure (Haskell) and dirty (system) code.
308There is an alternative interpretation of the IO monad that is even
more bizarre but makes perfect sense as a mathematical model. It treats
the whole Universe as an object in a program. Notice that, conceptually,
the imperative model treats the Universe as an external global object,
so procedures that perform I/O have side effects by virtue of interact-
ing with that object. They can both read and modify the state of the
Universe.
Wealreadyknowhowtodealwith statein functional programming
— we use the state monad. Unlike simple state, however, the state of
the Universe cannot be easily described using standard data structures.
But we don’t have to, as long as we never directly interact with it. It’s
enough that we assume that there exists a type RealWorld and, by some
miracle of cosmic engineering, the runtime is able to provide an object
of this type. An IO action is just a function:
type IO a = RealWorld -> (a, RealWorld)
Or, in terms of the State monad:
type IO = State RealWorld
However, >=> and return for the IO monad have to be built into the
language.
## 21.2.9 Interactive Output
The same IO monad is used to encapsulate interactive output. RealWorld
is supposed to contain all output devices. You might wonder why we
can’t just call output functions from Haskell and pretend that they do
nothing. For instance, why do we have:
putStr :: String -> IO ()
309rather than the simpler:
putStr :: String -> ()
Two reasons: Haskell is lazy, so it would never call a function whose
output — here, the unit object — is not used for anything. And, even if it
weren’t lazy, it could still freely change the order of such calls and thus
garble the output. The only way to force sequential execution of two
functions in Haskell is through data dependency. The input of one func-
tion must depend on the output of another. Having RealWorld passed
between IO actions enforces sequencing.
Conceptually, in this program:
main :: IO ()
main = do
putStr "Hello "
putStr "World!"
the action that prints “World!” receives, as input, the Universe in which
“Hello ” is already on the screen. It outputs a new Universe, with “Hello
World!” on the screen.
## 21.3 Conclusion
Of course I have just scratched the surface of monadic programming.
Monads not only accomplish, with pure functions, what normally is
done with side effects in imperative programming, but they also do
it with a high degree of control and type safety. They are not with-
out drawbacks, though. The major complaint about monads is that they
don’t easily compose with each other. Granted, you can combine most
of the basic monads using the monad transformer library. It’s relatively
310easy to create a monad stack that combines, say, state with exceptions,
but there is no formula for stacking arbitrary monads together.
31122 Monads Categorically
If you mention monadstoaprogrammer,you’llprobablyenduptalk-
ing about effects. To a mathematician, monads are about algebras.
We’ll talk about algebras later — they play an important role in pro-
gramming — but first I’d like to give you a little intuition about their
relation to monads. For now, it’s a bit of a hand-waving argument, but
bear with me.
Algebraisaboutcreating,manipulating,andevaluatingexpressions.
Expressions are built using operators. Consider this simple expression:
𝑥2 + 2𝑥 + 1
This expression is formed using variables like 𝑥, and constants like 1 or
2, bound together with operators like plus or times. As programmers,
we often think of expressions as trees.
312Trees are containers so, more generally, an expression is a container for
storing variables. In category theory, we represent containers as endo-
functors. If we assign the type 𝑎 to the variable 𝑥, our expression will
have the type 𝑚 𝑎, where 𝑚 is an endofunctor that builds expression
trees. (Nontrivial branching expressions are usually created using re-
cursively defined endofunctors.)
What’s the most common operation that can be performed on an
expression? It’s substitution: replacing variables with expressions. For
instance, in our example, we could replace 𝑋 with 𝑦 − 1 to get:
(𝑦 − 1)2 + 2(𝑦 − 1) + 1
Here’swhathappened:Wetookanexpressionoftype𝑚 𝑎 andapplieda
transformation of type 𝑎 → 𝑚 𝑏 (𝑏 represents the type of 𝑦). The result
is an expression of type 𝑚 𝑏. Let me spell it out:
𝑚 𝑎 → (𝑎 → 𝑚 𝑏) → 𝑚 𝑏
Yes, that’s the signature of monadic bind.
Thatwasabitofmotivation.Nowlet’sgettothemathofthemonad.
Mathematicians use different notation than programmers. They prefer
to use the letter 𝑇 for the endofunctor, and Greek letters: 𝜇 for join and
313𝜂forreturn.Bothjoin andreturn arepolymorphicfunctions,sowecan
guess that they correspond to natural transformations.
Therefore, in category theory, a monad is defined as an endofunctor
𝑇 equipped with a pair of natural transformations 𝜇 and 𝜂.
𝜇 is a natural transformation from the square of the functor 𝑇2 back
to 𝑇. The square is simply the functor composed with itself, 𝑇 ∘ 𝑇 (we
can only do this kind of squaring for endofunctors).
𝜇 ∷ 𝑇2 → 𝑇
The component of this natural transformation at an object 𝑎 is the mor-
phism:
𝜇𝑎 ∷ 𝑇(𝑇𝑎) → 𝑇𝑎
which, in Hask, translates directly to our definition of join.
𝜂 is a natural transformation between the identity functor 𝐼 and 𝑇:
𝜂 ∷ 𝐼 → 𝑇
Considering that the action of 𝐼 on the object 𝑎 is just 𝑎, the component
of 𝜂 is given by the morphism:
𝜂𝑎 ∷ 𝑎 → 𝑇𝑎
which translates directly to our definition of return.
These natural transformations must satisfy some additional laws.
OnewayoflookingatitisthattheselawsletusdefineaKleislicategory
for the endofunctor 𝑇. Remember that a Kleisli arrow between 𝑎 and 𝑏
is defined as a morphism 𝑎 → 𝑇𝑏. The composition of two such arrows
(I’ll write it as a circle with the subscript 𝑇) can be implemented using
𝜇:
𝑔 ∘𝑇 𝑓 = 𝜇𝑐 ∘ (𝑇 𝑔) ∘ 𝑓
314where
𝑓 ∷ 𝑎 → 𝑇 𝑏
𝑔 ∷ 𝑏 → 𝑇 𝑐
Here 𝑇, being a functor, can be applied to the morphism 𝑔. It might be
easier to recognize this formula in Haskell notation:
f >=> g = join . fmap g . f
or, in components:
(f >=> g) a = join (fmap g (f a))
In terms of the algebraic interpretation, we are just composing two suc-
cessive substitutions.
For Kleisli arrows to form a category we want their composition to
be associative, and 𝜂𝑎 to be the identity Kleisli arrow at 𝑎. This require-
ment can be translated to monadic laws for 𝜇 and 𝜂. But there is another
wayofderivingtheselawsthatmakesthemlookmorelikemonoidlaws.
In fact 𝜇 is often called multiplication, and 𝜂 – unit.
Roughly speaking, the associativity law states that the two ways of
reducing the cube of 𝑇, 𝑇3, down to 𝑇 must give the same result. Two
unit laws (left and right) state that when 𝜂 is applied to 𝑇 and then
reduced by 𝜇, we get back 𝑇.
Things are a little tricky because we are composing natural trans-
formations and functors. So a little refresher on horizontal composition
is in order. For instance, 𝑇3 can be seen as a composition of 𝑇 after 𝑇2.
We can apply to it the horizontal composition of two natural transfor-
mations:
𝐼𝑇 ∘ 𝜇
315and get 𝑇 ∘ 𝑇; which can be
furtherreducedto𝑇 byapply-
ing 𝜇. 𝐼𝑇 is the identity natu-
ral transformation from 𝑇 to
𝑇. You will often see the nota-
tionforthistypeofhorizontal
composition 𝐼𝑇 ∘ 𝜇 shortened
to𝑇∘𝜇.Thisnotationisunam-
biguous because it makes no sense to compose a functor with a natural
transformation, therefore 𝑇 must mean 𝐼𝑇 in this context.
We can also draw the diagram in the (endo-) functor category [𝐂,𝐂]:
Alternatively, we can treat 𝑇3 as the composition of 𝑇2 ∘ 𝑇 and apply
𝜇 ∘ 𝑇 to it. The result is also 𝑇 ∘ 𝑇 which, again, can be reduced to 𝑇
using 𝜇. We require that the two paths produce the same result.
316Similarly, we can apply the horizontal composition 𝜂 ∘ 𝑇 to the com-
position of the identity functor 𝐼 after 𝑇 to obtain 𝑇2, which can then
be reduced using 𝜇. The result should be the same as if we applied the
identity natural transformation directly to T. And, by analogy, the same
should be true for 𝑇 ∘ 𝜂.
You can convince yourself that these laws guarantee that the composi-
tion of Kleisli arrows indeed satisfies the laws of a category.
The similarities between a monad and a monoid are striking. We
have multiplication 𝜇, unit 𝜂, associativity, and unit laws. But our defi-
nition of a monoid is too narrow to describe a monad as a monoid. So
let’s generalize the notion of a monoid.
31722.1 Monoidal Categories
Let’s go back to the conventional definition of a monoid. It’s a set with
a binary operation and a special element called unit. In Haskell, this can
be expressed as a typeclass:
class Monoid m where
mappend :: m -> m -> m
mempty :: m
The binary operation mappend must be associative and unital (i.e., mul-
tiplication by the unit mempty is a no-op).
Notice that, in Haskell, the definition of mappend is curried. It can be
interpreted as mapping every element of m to a function:
mappend :: m -> (m -> m)
It’s this interpretation that gives rise to the definition of a monoid as
a single-object category where endomorphisms (m -> m) represent the
elements of the monoid. But because currying is built into Haskell, we
could as well have started with a different definition of multiplication:
mu :: (m, m) -> m
Here, the Cartesian product (m, m) becomes the source of pairs to be
multiplied.
This definition suggests a different path to generalization: replacing
the Cartesian product with categorical product. We could start with a
category where products are globally defined, pick an object m there,
and define multiplication as a morphism:
𝜇 ∷ 𝑚 × 𝑚 → 𝑚
318We have one problem though: In an arbitrary category we can’t peek
inside an object, so how do we pick the unit element? There is a trick
to it. Remember how element selection is equivalent to a function from
the singleton set? In Haskell, we could replace the definition of mempty
with a function:
eta :: () -> m
The singleton is the terminal object in 𝐒𝐞𝐭, so it’s natural to generalize
this definition to any category that has a terminal object 𝑡:
𝜂 ∷ 𝑡 → 𝑚
This lets us pick the unit “element” without having to talk about ele-
ments.
Unlike in our previous definition of a monoid as a single-object cat-
egory, monoidal laws here are not automatically satisfied — we have to
impose them. But in order to formulate them we have to establish the
monoidal structure of the underlying categorical product itself. Let’s
recall how monoidal structure works in Haskell first.
Westartwithassociativity.InHaskell,thecorrespondingequational
law is:
mu (x, mu (y, z)) = mu (mu (x, y), z)
Before we can generalize it to other categories, we have to rewrite it
as an equality of functions (morphisms). We have to abstract it away
from its action on individual variables — in other words, we have to use
point-free notation. Knowing that the Cartesian product is a bifunctor,
we can write the left hand side as:
(mu . bimap id mu)(x, (y, z))
319and the right hand side as:
(mu . bimap mu id)((x, y), z)
This is almost what we want. Unfortunately, the Cartesian product is
not strictly associative — (x, (y, z)) is not the same as ((x, y), z) —
so we can’t just write point-free:
mu . bimap id mu = mu . bimap mu id
On the other hand, the two nestings of pairs are isomorphic. There is an
invertible function called the associator that converts between them:
alpha :: ((a, b), c) -> (a, (b, c))
alpha ((x, y), z) = (x, (y, z))
Withthehelpoftheassociator,wecanwritethepoint-freeassociativity
law for mu:
mu . bimap id mu . alpha = mu . bimap mu id
We can apply a similar trick to unit laws which, in the new notation,
take the form:
mu (eta (), x) = x
mu (x, eta ()) = x
They can be rewritten as:
(mu . bimap eta id) ((), x) = lambda((), x)
(mu . bimap id eta) (x, ()) = rho (x, ())
320The isomorphisms lambda and rho are called the left and right unitor,
respectively. They witness the fact that the unit () is the identity of the
Cartesian product up to isomorphism:
lambda :: ((), a) -> a
lambda ((), x) = x
rho :: (a, ()) -> a
rho (x, ()) = x
The point-free versions of the unit laws are therefore:
mu . bimap id eta = rho
mu . bimap eta id = lambda
We have formulated point-free monoidal laws for mu and eta using the
fact that the underlying Cartesian product itself acts like a monoidal
multiplication in the category of types. Keep in mind though that the
associativity and unit laws for the Cartesian product are valid only up
to isomorphism.
It turns out that these laws can be generalized to any category with
products and a terminal object. Categorical products are indeed asso-
ciative up to isomorphism and the terminal object is the unit, also up
to isomorphism. The associator and the two unitors are natural isomor-
phisms. The laws can be represented by commuting diagrams.
321Notice that, because the product is a bifunctor, it can lift a pair of mor-
phisms — in Haskell this was done using bimap.
We could stop here and say that we can define a monoid on top of
any category with categorical products and a terminal object. As long
as we can pick an object 𝑚 and two morphisms 𝜇 and 𝜂 that satisfy
monoidal laws, we have a monoid. But we can do better than that. We
don’t need a full-blown categorical product to formulate the laws for 𝜇
and 𝜂. Recall that a product is defined through a universal construction
that uses projections. We haven’t used any projections in our formula-
tion of monoidal laws.
A bifunctor that behaves like a product without being a product is
called a tensor product, often denoted by the infix operator ⊗. A defini-
tion of a tensor product in general is a bit tricky, but we won’t worry
about it. We’ll just list its properties — the most important being asso-
ciativity up to isomorphism.
Similarly, we don’t need the object 𝑡 to be terminal. We never used
its terminal property — namely, the existence of a unique morphism
from any object to it. What we require is that it works well in concert
with the tensor product. Which means that we want it to be the unit of
the tensor product, again, up to isomorphism. Let’s put it all together:
322A monoidal category is a category 𝐂 equipped with a bifunctor
called the tensor product:
⊗ ∷ 𝐂 × 𝐂 → 𝐂
and a distinct object 𝑖 called the unit object, together with three natural
isomorphisms called, respectively, the associator and the left and right
unitors:
𝛼𝑎𝑏𝑐 ∷ (𝑎 ⊗ 𝑏) ⊗ 𝑐 → 𝑎 ⊗ (𝑏 ⊗ 𝑐)
𝜆𝑎 ∷ 𝑖 ⊗ 𝑎 → 𝑎
𝜌𝑎 ∷ 𝑎 ⊗ 𝑖 → 𝑎
(There is also a coherence condition for simplifying a quadruple tensor
product.)
What’s important is that a tensor product describes many familiar
bifunctors.Inparticular,itworksforaproduct,acoproductand,aswe’ll
seeshortly,forthecompositionofendofunctors(andalsoforsomemore
esoteric products like Day convolution). Monoidal categories will play
an essential role in the formulation of enriched categories.
## 22.2 Monoid in a Monoidal Category
We are now ready to define a monoid in a more general setting of a
monoidal category. We start by picking an object 𝑚. Using the tensor
product we can form powers of 𝑚. The square of 𝑚 is 𝑚 ⊗ 𝑚. There are
two ways of forming the cube of 𝑚, but they are isomorphic through
the associator. Similarly for higher powers of 𝑚 (that’s where we need
the coherence conditions). To form a monoid we need to pick two mor-
323phisms:
𝜇 ∷ 𝑚 ⊗ 𝑚 → 𝑚
𝜂 ∷ 𝑖 → 𝑚
where 𝑖 is the unit object for our tensor product.
These morphisms have to satisfy associativity and unit laws, which can
be expressed in terms of the following commuting diagrams:
324Notice that it’s essential that the tensor product be a bifunctor because
we need to lift pairs of morphisms to form products such as 𝜇 ⊗ id or
𝜂 ⊗ id. These diagrams are just a straightforward generalization of our
previous results for categorical products.
## 22.3 Monads as Monoids
Monoidal structures pop up in unexpected places. One such place is the
functor category. If you squint a little, you might be able to see functor
composition as a form of multiplication. The problem is that not any
twofunctorscanbecomposed—thetargetcategoryofonehastobethe
source category of the other. That’s just the usual rule of composition
of morphisms — and, as we know, functors are indeed morphisms in
the category 𝐂𝐚𝐭. But just like endomorphisms (morphisms that loop
back to the same object) are always composable, so are endofunctors.
For any given category 𝐂, endofunctors from 𝐂 to 𝐂 form the functor
category[𝐂,𝐂].Itsobjectsareendofunctors,andmorphismsarenatural
transformations between them. We can take any two objects from this
category, say endofunctors 𝐹 and 𝐺, and produce a third object 𝐹 ∘𝐺 —
an endofunctor that’s their composition.
Is endofunctor composition a good candidate for a tensor product?
First, we have to establish that it’s a bifunctor. Can it be used to lift a
pair of morphisms — here, natural transformations? The signature of
the analog of bimap for the tensor product would look something like
this:
𝑏𝑖𝑚𝑎𝑝 ∷ (𝑎 → 𝑏) → (𝑐 → 𝑑) → (𝑎 ⊗ 𝑐 → 𝑏 ⊗ 𝑑)
325If you replace objects by endofunctors, arrows by natural transforma-
tions, and tensor products by composition, you get:
(𝐹 → 𝐹′) → (𝐺 → 𝐺′) → (𝐹 ∘ 𝐺 → 𝐹′ ∘ 𝐺′)
which you may recognize as the special case of horizontal composition.
Wealsohaveatourdisposaltheidentityendofunctor𝐼,whichcanserve
as the identity for endofunctor composition — our new tensor prod-
uct. Moreover, functor composition is associative. In fact associativity
and unit laws are strict — there’s no need for the associator or the two
unitors. So endofunctors form a strict monoidal category with functor
composition as tensor product.
What’s a monoid in this category? It’s an object — that is an endo-
functor 𝑇; and two morphisms — that is natural transformations:
𝜇 ∷ 𝑇 ∘ 𝑇 → 𝑇
𝜂 ∷ 𝐼 → 𝑇
Not only that, here are the monoid laws:
326They are exactly the monad laws we’ve seen before. Now you under-
stand the famous quote from Saunders Mac Lane:
All told, monad is just a monoid in the category of endo-
functors.
You might have seen it emblazoned on some t-shirts at functional pro-
gramming conferences.
32722.4 Monads from Adjunctions
An adjunction1 𝐿 ⊣ 𝑅, is a pair of functors going back and forth be-
tween two categories 𝐂 and 𝐃. There are two ways of composing them
giving rise to two endofunctors, 𝑅 ∘ 𝐿 and 𝐿 ∘ 𝑅. As per an adjunction,
these endofunctors are related to identity functors through two natural
transformations called unit and counit:
𝜂 ∷ 𝐼𝐃 → 𝑅 ∘ 𝐿
𝜀 ∷ 𝐿 ∘ 𝑅 → 𝐼𝐂
Immediatelyweseethattheunitofanadjunctionlooksjustliketheunit
of a monad. It turns out that the endofunctor 𝑅 ∘ 𝐿 is indeed a monad.
All we need is to define the appropriate μ to go with the η. That’s a
natural transformation between the square of our endofunctor and the
endofunctor itself or, in terms of the adjoint functors:
𝑅 ∘ 𝐿 ∘ 𝑅 ∘ 𝐿 → 𝑅 ∘ 𝐿
And, indeed, we can use the counit to collapse the 𝐿 ∘ 𝑅 in the middle.
The exact formula for 𝜇 is given by the horizontal composition:
𝜇 = 𝑅 ∘ 𝜀 ∘ 𝐿
Monadic laws follow from the identities satisfied by the unit and counit
of the adjunction and the interchange law.
We don’t see a lot of monads derived from adjunctions in Haskell,
because an adjunction usually involves two categories. However, the
1See ch.18 on adjunctions.
328definitions of an exponential, or a function object, is an exception. Here
are the two endofunctors that form this adjunction:
𝐿 𝑧 = 𝑧 × 𝑠
𝑅 𝑏 = 𝑠 ⇒ 𝑏
You may recognize their composition as the familiar state monad:
𝑅 (𝐿 𝑧) = 𝑠 ⇒ (𝑧 × 𝑠)
We’ve seen this monad before in Haskell:
newtype State s a = State (s -> (a, s))
Let’s also translate the adjunction to Haskell. The left functor is the
product functor:
newtype Prod s a = Prod (a, s)
and the right functor is the reader functor:
newtype Reader s a = Reader (s -> a)
They form the adjunction:
instance Adjunction (Prod s) (Reader s) where
counit (Prod (Reader f, s)) = f s
unit a = Reader (\s -> Prod (a, s))
You can easily convince yourself that the composition of the reader
functor after the product functor is indeed equivalent to the state func-
tor:
329newtype State s a = State (s -> (a, s))
As expected, the unit of the adjunction is equivalent to the return func-
tion of the state monad. The counit acts by evaluating a function acting
on its argument. This is recognizable as the uncurried version of the
function runState:
runState :: State s a -> s -> (a, s)
runState (State f) s = f s
(uncurried, because in counit it acts on a pair).
We can now define join for the state monad as a component of the
natural transformation 𝜇. For that we need a horizontal composition of
three natural transformations:
𝜇 = 𝑅 ∘ 𝜀 ∘ 𝐿
In other words, we need to sneak the counit 𝜀 across one level of the
reader functor. We can’t just call fmap directly, because the compiler
wouldpick the oneforthe State functor,ratherthanthe Reader functor.
But recall that fmap for the reader functor is just left function composi-
tion. So we’ll use function composition directly.
We have to first peel off the data constructor State to expose the
function inside the State functor. This is done using runState:
ssa :: State s (State s a)
runState ssa :: s -> (State s a, s)
Thenweleft-composeitwiththecounit,whichisdefinedbyuncurry runState.
Finally, we clothe it back in the State data constructor:
join :: State s (State s a) -> State s a
join ssa = State (uncurry runState . runState ssa)
330This is indeed the implementation of join for the State monad.
Itturnsoutthatnotonlyeveryadjunctiongivesrisetoamonad,but
the converse is also true: every monad can be factorized into a compo-
sition of two adjoint functors. Such factorization is not unique though.
We’ll talk about the other endofunctor 𝐿 ∘ 𝑅 in the next section.
33123
Comonads
Now that we have covered monads, we can reap the benefits of
duality and get comonads for free simply by reversing the arrows
and working in the opposite category.
Recall that, at the most basic level, monads are about composing
Kleisli arrows:
a -> m b
where m is a functor that is a monad. If we use the letter w (upside down
m) for the comonad, we can define co-Kleisli arrows as morphism of the
type:
w a -> b
The analog of the fish operator for co-Kleisli arrows is defined as:
(=>=) :: (w a -> b) -> (w b -> c) -> (w a -> c)
332Forco-Kleisliarrowstoformacategorywealsohavetohaveanidentity
co-Kleisli arrow, which is called extract:
extract :: w a -> a
This is the dual of return. We also have to impose the laws of associa-
tivity as well as left- and right-identity. Putting it all together, we could
define a comonad in Haskell as:
class Functor w => Comonad w where
(=>=) :: (w a -> b) -> (w b -> c) -> (w a -> c)
extract :: w a -> a
In practice, we use slightly different primitives, as we’ll see shortly.
The question is, what’s the use for comonads in programming?
## 23.1 Programming with Comonads
Let’s compare the monad with the comonad. A monad provides a way
of putting a value in a container using return. It doesn’t give you ac-
cess to a value or values stored inside. Of course, data structures that
implement monads might provide access to their contents, but that’s
considered a bonus. There is no common interface for extracting values
from a monad. And we’ve seen the example of the IO monad that prides
itself in never exposing its contents.
A comonad, on the other hand, provides the means of extracting a
singlevaluefromit.Itdoesnotgivethemeanstoinsertvalues.Soifyou
want to think of a comonad as a container, it always comes pre-filled
with contents, and it lets you peek at it.
Just as a Kleisli arrow takes a value and produces some embellished
result — it embellishes it with context — a co-Kleisli arrow takes a value
333togetherwithawholecontextandproducesaresult.It’sanembodiment
of contextual computation.
## 23.2 The Product Comonad
Remember the reader monad? We introduced it to tackle the problem
of implementing computations that need access to some read-only en-
vironment e. Such computations can be represented as pure functions
of the form:
(a, e) -> b
We used currying to turn them into Kleisli arrows:
a -> (e -> b)
But notice that these functions already have the form of co-Kleisli ar-
rows. Let’s massage their arguments into the more convenient functor
form:
data Product e a = P e a deriving Functor
We can easily define the composition operator by making the same en-
vironment available to the arrows that we are composing:
(=>=) :: (Product e a -> b) -> (Product e b -> c) -> (Product e
a -> c) ↪
f =>= g = \(P e a) -> let b = f (P e a)
c = g (P e b)
in c
The implementation of extract simply ignores the environment:
334extract (P e a) = a
Not surprisingly, the product comonad can be used to perform exactly
the same computations as the reader monad. In a way, the comonadic
implementation of the environment is more natural — it follows the
spirit of “computation in context.” On the other hand, monads come
with the convenient syntactic sugar of the do notation.
Theconnectionbetweenthereadermonadandtheproductcomonad
goes deeper, having to do with the fact that the reader functor is the
rightadjointoftheproductfunctor.Ingeneral,though,comonadscover
differentnotionsofcomputationthanmonads.We’llseemoreexamples
later.
It’s easy to generalize the Product comonad to arbitrary product
types including tuples and records.
## 23.3 Dissecting the Composition
Continuing the process of dualization, we could go ahead and dualize
monadicbindandjoin.Alternatively,wecanrepeattheprocessweused
with monads, where we studied the anatomy of the fish operator. This
approach seems more enlightening.
The starting point is the realization that the composition operator
must produce a co-Kleisli arrow that takes w a and produces a c. The
only way to produce a c is to apply the second function to an argument
of the type w b:
(=>=) :: (w a -> b) -> (w b -> c) -> (w a -> c)
f =>= g = g ...
But how can we produce a value of type w b that could be fed to g? We
have at our disposal the argument of type w a and the function
335f :: w a -> b. The solution is to define the dual of bind, which is called
extend:
extend :: (w a -> b) -> w a -> w b
Using extend we can implement composition:
f =>= g = g . extend f
Can we next dissect extend? You might be tempted to say, why not just
apply the function w a -> b to the argument w a, but then you quickly
realize that you’d have no way of converting the resulting b to w b. Re-
member,thecomonadprovidesnomeansofliftingvalues.Atthispoint,
in the analogous construction for monads, we used fmap. The only way
wecouldusefmap herewouldbeifwehadsomethingofthetypew (w a)
at our disposal. If we could only turn w a into
w (w a). And, conveniently, that would be exactly the dual of join. We
call it duplicate:
duplicate :: w a -> w (w a)
So, just like with the definitions of the monad, we have three equiv-
alent definitions of the comonad: using co-Kleisli arrows, extend, or
duplicate. Here’s the Haskell definition taken directly from
Control.Comonad library:
class Functor w => Comonad w where
extract :: w a -> a
duplicate :: w a -> w (w a)
duplicate = extend id
extend :: (w a -> b) -> w a -> w b
extend f = fmap f . duplicate
336Providedarethedefaultimplementationsofextend intermsofduplicate
and vice versa, so you only need to override one of them.
The intuition behind these functions is based on the idea that, in
general,acomonadcanbethoughtofasacontainerfilledwithvaluesof
type a (the product comonad was a special case of just one value). There
is a notion of the “current” value, one that’s easily accessible through
extract. A co-Kleisli arrow performs some computation that is focused
on the current value, but it has access to all the surrounding values.
Think of the Conway’s game of life. Each cell contains a value (usually
just True or False). A comonad corresponding to the game of life would
be a grid of cells focused on the “current” cell.
So what does duplicate do? It takes a comonadic container w a and
producesacontainerofcontainersw (w a).Theideaisthateachofthese
containers is focused on a different a inside w a. In the game of life, you
would get a grid of grids, each cell of the outer grid containing an inner
grid that’s focused on a different cell.
Now look at extend. It takes a co-Kleisli arrow and a comonadic
container w a filled with as. It applies the computation to all of these
as, replacing them with bs. The result is a comonadic container filled
with bs. extend does it by shifting the focus from one a to another and
applyingtheco-Kleisliarrowtoeachoftheminturn.Inthegameoflife,
the co-Kleisli arrow would calculate the newstate of the current cell. To
do that, it would look at its context — presumably its nearest neighbors.
The default implementation of extend illustrates this process. First we
call duplicate to produce all possible foci and then we apply f to each
of them.
33723.4 The Stream Comonad
This process of shifting the focus from one element of the container
to another is best illustrated with the example of an infinite stream.
Such a stream is just like a list, except that it doesn’t have the empty
constructor:
data Stream a = Cons a (Stream a)
It’s trivially a Functor:
instance Functor Stream where
fmap f (Cons a as) = Cons (f a) (fmap f as)
The focus of a stream is its first element, so here’s the implementation
of extract:
extract (Cons a _) = a
duplicate produces a stream of streams, each focused on a different
element.
duplicate (Cons a as) = Cons (Cons a as) (duplicate as)
The first element is the original stream, the second element is the tail of
the original stream, the third element is its tail, and so on, ad infinitum.
Here’s the complete instance:
instance Comonad Stream where
extract (Cons a _) = a
duplicate (Cons a as) = Cons (Cons a as) (duplicate as)
338Thisisaveryfunctionalwayoflookingatstreams.Inanimperativelan-
guage, we would probably start with a method advance that shifts the
stream by one position. Here, duplicate produces all shifted streams in
one fell swoop. Haskell’s laziness makes this possible and even desir-
able. Of course, to make a Stream practical, we would also implement
the analog of advance:
tail :: Stream a -> Stream a
tail (Cons a as) = as
but it’s never part of the comonadic interface.
If you had any experience with digital signal processing, you’ll see
immediately that a co-Kleisli arrow for a stream is just a digital filter,
and extend produces a filtered stream.
As a simple example, let’s implement the moving average filter.
Here’s a function that sums n elements of a stream:
sumS :: Num a => Int -> Stream a -> a
sumS n (Cons a as) = if n <= 0 then 0 else a + sumS (n - 1) as
Here’s the function that calculates the average of the first n elements of
the stream:
average :: Fractional a => Int -> Stream a -> a
average n stm = (sumS n stm) / (fromIntegral n)
Partiallyappliedaverage n isaco-Kleisliarrow,sowecanextend itover
the whole stream:
movingAvg :: Fractional a => Int -> Stream a -> Stream a
movingAvg n = extend (average n)
339The result is the stream of running averages.
Astreamisanexampleofaunidirectional,one-dimensionalcomonad.
It can be easily made bidirectional or extended to two or more dimen-
sions.
## 23.5 Comonad Categorically
Defining a comonad in category theory is a straightforward exercise in
duality. As with the monad, we start with an endofunctor T. The two
natural transformations, η and μ, that define the monad are simply re-
versed for the comonad:
𝜀 ∷ 𝑇 → 𝐼
𝛿 ∷ 𝑇 → 𝑇2
The components of these transformations correspond to extract and
duplicate. Comonad laws are the mirror image of monad laws. No big
surprise here.
Then there is the derivation of the monad from an adjunction. Du-
ality reverses an adjunction: the left adjoint becomes the right adjoint
and vice versa. And, since the composition 𝑅 ∘ 𝐿 defines a monad, 𝐿 ∘ 𝑅
must define a comonad. The counit of the adjunction:
𝜀 ∷ 𝐿 ∘ 𝑅 → 𝐼
is indeed the same ε that we see in the definition of the comonad — or,
in components, as Haskell’s extract. We can also use the unit of the
adjunction:
𝜂 ∷ 𝐼 → 𝑅 ∘ 𝐿
to insert an 𝑅∘𝐿 in the middle of 𝐿∘𝑅 and produce 𝐿∘𝑅∘𝐿∘𝑅. Making 𝑇2
from 𝑇 defines the 𝛿, and that completes the definition of the comonad.
340We’ve also seen that the monad is a monoid. The dual of this state-
ment would require the use of a comonoid, so what’s a comonoid? The
original definition of a monoid as a single-object category doesn’t du-
alize to anything interesting. When you reverse the direction of all en-
domorphisms, you get another monoid. Recall, however, that in our ap-
proach to a monad, we used a more general definition of a monoid as
an object in a monoidal category. The construction was based on two
morphisms:
𝜇 ∷ 𝑚 ⊗ 𝑚 → 𝑚
𝜂 ∷ 𝑖 → 𝑚
The reversal of these morphisms produces a comonoid in a monoidal
category:
𝛿 ∷ 𝑚 → 𝑚 ⊗ 𝑚
𝜀 ∷ 𝑚 → 𝑖
One can write a definition of a comonoid in Haskell:
class Comonoid m where
split :: m -> (m, m)
destroy :: m -> ()
but it is rather trivial. Obviously destroy ignores its argument.
destroy _ = ()
split is just a pair of functions:
split x = (f x, g x)
341Now consider comonoid laws that are dual to the monoid unit laws.
lambda . bimap destroy id . split = id
rho . bimap id destroy . split = id
Here, lambda and rho are the left and right unitors, respectively (see the
definition of monoidal categories). Plugging in the definitions, we get:
lambda (bimap destroy id (split x))
= lambda (bimap destroy id (f x, g x))
= lambda ((), g x)
= g x
which proves that g = id. Similarly, the second law expands to f = id.
In conclusion:
split x = (x, x)
which shows that in Haskell (and, in general, in the category 𝐒𝐞𝐭) every
object is a trivial comonoid.
Fortunately there are other more interesting monoidal categories
in which to define comonoids. One of them is the category of endo-
functors. And it turns out that, just like the monad is a monoid in the
category of endofunctors,
The comonad is a comonoid in the category of endofunc-
tors.
## 23.6 The Store Comonad
Anotherimportantexampleofacomonadisthedualofthestatemonad.
It’s called the costate comonad or, alternatively, the store comonad.
342We’ve seen before that the state monad is generated by the adjunc-
tion that defines the exponentials:
𝐿 𝑧 = 𝑧 × 𝑠
𝑅 𝑎 = 𝑠 ⇒ 𝑎
We’llusethesameadjunctiontodefinethecostatecomonad.Acomonad
is defined by the composition 𝐿 ∘ 𝑅:
𝐿 (𝑅 𝑎) = (𝑠 ⇒ 𝑎) × 𝑠
Translating this to Haskell, we start with the adjunction between the
Prod functor on the left and the Reader functor or the right. Composing
Prod after Reader is equivalent to the following definition:
data Store s a = Store (s -> a) s
The counit of the adjunction taken at the object 𝑎 is the morphism:
𝜀𝑎 ∷ ((𝑠 ⇒ 𝑎) × 𝑠) → 𝑎
or, in Haskell notation:
counit (Prod (Reader f, s)) = f s
This becomes our extract:
extract (Store f s) = f s
The unit of the adjunction:
unit a = Reader (\s -> Prod (a, s))
343can be rewritten as partially applied data constructor:
Store f :: s -> Store f s
We construct 𝛿, or duplicate, as the horizontal composition:
𝛿 ∷ 𝐿 ∘ 𝑅 → 𝐿 ∘ 𝑅 ∘ 𝐿 ∘ 𝑅
𝛿 = 𝐿 ∘ 𝜂 ∘ 𝑅
We have to sneak 𝜂 through the leftmost 𝐿, which is the Prod functor.
It means acting with 𝜂, or Store f, on the left component of the pair
(that’s what fmap for Prod would do). We get:
duplicate (Store f s) = Store (Store f) s
(Remember that, in the formula for 𝛿, 𝐿 and 𝑅 stand for identity natural
transformations whose components are identity morphisms.)
Here’s the complete definition of the Store comonad:
instance Comonad (Store s) where
extract (Store f s) = f s
duplicate (Store f s) = Store (Store f) s
You may think of the Reader part of Store as a generalized container
of as that are keyed using elements of the type s. For instance, if s is
Int, Reader Int a is an infinite bidirectional stream of as. Store pairs
this container with a value of the key type. For instance, Reader Int a
is paired with an Int. In this case, extract uses this integer to index into
the infinite stream. You may think of the second component of Store as
the current position.
Continuingwiththisexample,duplicate createsanewinfinitestream
indexed by an Int. This stream contains streams as its elements. In par-
ticular, at the current position, it contains the original stream. But if
344you use some other Int (positive or negative) as the key, you’d obtain a
shifted stream positioned at that new index.
In general, you can convince yourself that when extract acts on the
duplicated Store it produces the original Store (in fact, the identity law
for the comonad states that extract . duplicate = id).
The Store comonad plays an important role as the theoretical basis
for the Lens library. Conceptually, the Store s a comonad encapsulates
the idea of “focusing” (like a lens) on a particular substructure of the
date type a using the type s as an index. In particular, a function of the
type:
a -> Store s a
is equivalent to a pair of functions:
set :: a -> s -> a
get :: a -> s
If a is a product type, 𝐒𝐞𝐭 could be implemented as setting the field of
type s inside of a while returning the modified version of a. Similarly,
get could be implemented to read the value of the s field from a. We’ll
explore these ideas more in the next section.
## 23.7 Challenges
1. Implement the Conway’s Game of Life using the Store comonad.
Hint: What type do you pick for s?
34524
F-Algebras
We’ve seen several formulationsofamonoid:asaset,asasingle-
object category, as an object in a monoidal category. How much
more juice can we squeeze out of this simple concept?
Let’s try. Take this definition of a monoid as a set 𝑚 with a pair of
functions:
𝜇 ∷ 𝑚 × 𝑚 → 𝑚
𝜂 ∷ 1 → 𝑚
Here, 1 is the terminal object in 𝐒𝐞𝐭 — the singleton set. The first func-
tion defines multiplication (it takes a pair of elements and returns their
product), the second selects the unit element from 𝑚. Not every choice
of two functions with these signatures results in a monoid. For that
we need to impose additional conditions: associativity and unit laws.
But let’s forget about that for a moment and just consider “potential
monoids.” A pair of functions is an element of a Cartesian product of
346two sets of functions. We know that these sets may be represented as
exponential objects:
𝜇 ∈ 𝑚𝑚×𝑚
𝜂 ∈ 𝑚1
The Cartesian product of these two sets is:
𝑚𝑚×𝑚 × 𝑚1
Usingsomehigh-schoolalgebra(whichworksineveryCartesianclosed
category), we can rewrite it as:
𝑚𝑚×𝑚+1
The + sign stands for the coproduct in 𝐒𝐞𝐭. We have just replaced a pair
of functions with a single function — an element of the set:
𝑚 × 𝑚 + 1 → 𝑚
Any element of this set of functions is a potential monoid.
The beauty of this formulation is that it leads to interesting gen-
eralizations. For instance, how would we describe a group using this
language? A group is a monoid with one additional function that as-
signs the inverse to every element. The latter is a function of the type
𝑚 → 𝑚. As an example, integers form a group with addition as a bi-
nary operation, zero as the unit, and negation as the inverse. To define
a group we would start with a triple of functions:
𝑚 × 𝑚 → 𝑚
𝑚 → 𝑚
1 → 𝑚
347As before, we can combine all these triples into one set of functions:
𝑚 × 𝑚 + 𝑚 + 1 → 𝑚
We started with one binary operator (addition), one unary operator
(negation), and one nullary operator (identity — here zero). We com-
bined them into one function. All functions with this signature define
potential groups.
We can go on like this. For instance, to define a ring, we would add
one more binary operator and one nullary operator, and so on. Each
time we end up with a function type whose left-hand side is a sum of
powers(possiblyincludingthezerothpower—theterminalobject),and
the right-hand side being the set itself.
Now we can go crazy with generalizations. First of all, we can re-
place sets with objects and functions with morphisms. We can define
n-ary operators as morphisms from n-ary products. It means that we
need a category that supports finite products. For nullary operators we
require the existence of the terminal object. So we need a Cartesian cat-
egory. In order to combine these operators we need exponentials, so
that’s a Cartesian closed category. Finally, we need coproducts to com-
plete our algebraic shenanigans.
Alternatively, we can just forget about the way we derived our for-
mulas and concentrate on the final product. The sum of products on
the left hand side of our morphism defines an endofunctor. What if we
pick an arbitrary endofunctor 𝐹 instead? In that case we don’t have to
impose any constraints on our category. What we obtain is called an
F-algebra.
An F-algebra is a triple consisting of an endofunctor 𝐹, an object 𝑎,
and a morphism
𝐹 𝑎 → 𝑎
348The object is often called the carrier, an underlying object or, in the
context of programming, the carrier type. The morphism is often called
the evaluation function or the structure map. Think of the functor 𝐹 as
forming expressions and the morphism as evaluating them.
Here’s the Haskell definition of an F-algebra:
type Algebra f a = f a -> a
It identifies the algebra with its evaluation function.
In the monoid example, the functor in question is:
data MonF a = MEmpty | MAppend a a
This is Haskell for 1 + 𝑎 × 𝑎 (remember algebraic data structures).
A ring would be defined using the following functor:
data RingF a = RZero
| ROne
| RAdd a a
| RMul a a
| RNeg a
which is Haskell for 1 + 1 + 𝑎 × 𝑎 + 𝑎 × 𝑎 + 𝑎.
An example of a ring is the set of integers. We can choose Integer
as the carrier type and define the evaluation function as:
evalZ :: Algebra RingF Integer
evalZ RZero = 0
evalZ ROne = 1
evalZ (RAdd m n) = m + n
evalZ (RMul m n) = m * n
evalZ (RNeg n) = -n
349There are more F-algebras based on the same functor RingF. For in-
stance, polynomials form a ring and so do square matrices.
Asyoucansee,theroleofthefunctoristogenerateexpressionsthat
can be evaluated using the evaluator of the algebra. So far we’ve only
seen very simple expressions. We are often interested in more elaborate
expressions that can be defined using recursion.
## 24.1 Recursion
Onewaytogeneratearbitraryexpressiontreesistoreplacethevariable
a inside the functor definition with recursion. For instance, an arbitrary
expression in a ring is generated by this tree-like data structure:
data Expr = RZero
| ROne
| RAdd Expr Expr
| RMul Expr Expr
| RNeg Expr
We can replace the original ring evaluator with its recursive version:
evalZ :: Expr -> Integer
evalZ RZero = 0
evalZ ROne = 1
evalZ (RAdd e1 e2) = evalZ e1 + evalZ e2
evalZ (RMul e1 e2) = evalZ e1 * evalZ e2
evalZ (RNeg e) = -(evalZ e)
This is still not very practical, since we are forced to represent all inte-
gers as sums of ones, but it will do in a pinch.
But how can we describe expression trees using the language of F-
algebras? We have to somehow formalize the process of replacing the
350free type variable in the definition of our functor, recursively, with the
result of the replacement. Imagine doing this in steps. First, define a
depth-one tree as:
type RingF1 a = RingF (RingF a)
We are filling the holes in the definition of RingF with depth-zero trees
generated by RingF a. Depth-2 trees are similarly obtained as:
type RingF2 a = RingF (RingF (RingF a))
which we can also write as:
type RingF2 a = RingF (RingF1 a)
Continuing this process, we can write a symbolic equation:
type RingFn+1 a = RingF (RingFn a)
Conceptually,after repeatingthisprocessinfinitely manytimes, weend
up with our Expr. Notice that Expr does not depend on a. The starting
pointofourjourneydoesn’tmatter,wealwaysendupinthesameplace.
This is not always true for an arbitrary endofunctor in an arbitrary cat-
egory, but in the category 𝐒𝐞𝐭 things are nice.
Of course, this is a hand-waving argument, and I’ll make it more
rigorous later.
Applying an endofunctor infinitely many times produces a fixed
point, an object defined as:
𝐹𝑖𝑥 𝑓 = 𝑓 (𝐹𝑖𝑥 𝑓)
The intuition behind this definition is that, since we applied 𝑓 infinitely
many times to get 𝐹𝑖𝑥 𝑓, applying it one more time doesn’t change
anything. In Haskell, the definition of a fixed point is:
351newtype Fix f = Fix (f (Fix f))
Arguably, this would be more readable if the constructor’s name were
different than the name of the type being defined, as in:
newtype Fix f = In (f (Fix f))
but I’ll stick with the accepted notation. The constructor Fix (or In, if
you prefer) can be seen as a function:
Fix :: f (Fix f) -> Fix f
There is also a function that peels off one level of functor application:
unFix :: Fix f -> f (Fix f)
unFix (Fix x) = x
The two functions are the inverse of each other. We’ll use these func-
tions later.
## 24.2 Category of F-Algebras
Here’s the oldest trick in the book: Whenever you come up with a way
of constructing some new objects, see if they form a category. Not sur-
prisingly, algebras over a given endofunctor 𝐹 form a category. Objects
in that category are algebras — pairs consisting of a carrier object 𝑎 and
a morphism 𝐹 𝑎 → 𝑎, both from the original category 𝐂.
To complete the picture, we have to define morphisms in the cate-
gory of F-algebras. A morphism must map one algebra (𝑎,𝑓) to another
algebra (𝑏,𝑔). We’ll define it as a morphism 𝑚 that maps the carriers
— it goes from 𝑎 to 𝑏 in the original category. Not any morphism will
352do: we want it to be compatible with the two evaluators. (We call such a
structure-preserving morphism a homomorphism.) Here’s how you de-
fine a homomorphism of F-algebras. First, notice that we can lift 𝑚 to
the mapping:
𝐹 𝑚 ∷ 𝐹 𝑎 → 𝐹 𝑏
we can then follow it with 𝑔 to get to 𝑏. Equivalently, we can use 𝑓 to
go from 𝐹 𝑎 to 𝑎 and then follow it with 𝑚. We want the two paths to
be equal:
𝑔 ∘ 𝐹 𝑚 = 𝑚 ∘ 𝑓
It’s easy to convince yourself that this is indeed a category (hint: iden-
tity morphisms from 𝐂 work just fine, and a composition of homomor-
phisms is a homomorphism).
An initial object in the category of F-algebras, if it exists, is called
the initial algebra. Let’s call the carrier of this initial algebra 𝑖 and its
evaluator 𝑗 ∷ 𝐹 𝑖 → 𝑖. It turns out that 𝑗, the evaluator of the initial
algebra, is an isomorphism. This result is known as Lambek’s theorem.
The proof relies on the definition of the initial object, which requires
that there be a unique homomorphism 𝑚 from it to any other F-algebra.
Since 𝑚 is a homomorphism, the following diagram must commute:
353Now let’s construct an algebra whose carrier is 𝐹 𝑖. The evaluator of
such an algebra must be a morphism from 𝐹 (𝐹 𝑖) to 𝐹 𝑖. We can easily
construct such an evaluator simply by lifting 𝑗:
𝐹 𝑗 ∷ 𝐹 (𝐹 𝑖) → 𝐹 𝑖
Because (𝑖,𝑗) is the initial algebra, there must be a unique homomor-
phism 𝑚 from it to (𝐹 𝑖,𝐹 𝑗). The following diagram must commute:
But we also have this trivially commuting diagram (both paths are the
same!):
354which can be interpreted as showing that 𝑗 is a homomorphism of al-
gebras, mapping (𝐹 𝑖,𝐹 𝑗) to (𝑖,𝑗). We can glue these two diagrams
together to get:
This diagram may, in turn, be interpreted as showing that 𝑗 ∘ 𝑚 is a
homomorphism of algebras. Only in this case the two algebras are the
same.Moreover,because(𝑖,𝑗)isinitial,therecanonlybeonehomomor-
phism from it to itself, and that’s the identity morphism id𝑖 — which we
know is a homomorphism of algebras. Therefore 𝑗 ∘ 𝑚 = id𝑖. Using this
fact and the commuting property of the left diagram we can prove that
𝑚 ∘ 𝑗 = id𝐹𝑖. This shows that 𝑚 is the inverse of 𝑗 and therefore 𝑗 is an
isomorphism between 𝐹 𝑖 and 𝑖:
𝐹 𝑖 ≅ 𝑖
355But that is just saying that 𝑖 is a fixed point of 𝐹. That’s the formal proof
behind the original hand-waving argument.
Back to Haskell: We recognize 𝑖 as our Fix f, 𝑗 as our constructor
Fix, and its inverse as unFix. The isomorphism in Lambek’s theorem
tells us that, in order to get the initial algebra, we take the functor 𝑓
and replace its argument 𝑎 with Fix f. We also see why the fixed point
does not depend on 𝑎.
## 24.3 Natural Numbers
Natural numbers can also be defined as an F-algebra. The starting point
is the pair of morphisms:
𝑧𝑒𝑟𝑜 ∷ 1 → 𝑁
𝑠𝑢𝑐𝑐 ∷ 𝑁 → 𝑁
The first one picks the zero, and the second one maps all numbers to
their successors. As before, we can combine the two into one:
1 + 𝑁 → 𝑁
The left hand side defines a functor which, in Haskell, can be written
like this:
data NatF a = ZeroF | SuccF a
The fixed point of this functor (the initial algebra that it generates) can
be encoded in Haskell as:
data Nat = Zero | Succ Nat
A natural number is either zero or a successor of another number. This
is known as the Peano representation for natural numbers.
35624.4 Catamorphisms
Let’s rewrite the initiality condition using Haskell notation. We call
the initial algebra Fix f. Its evaluator is the constructor Fix. There is
a unique morphism m from the initial algebra to any other algebra over
the same functor. Let’s pick an algebra whose carrier is a and the eval-
uator is alg.
By the way, notice what m is: It’s an evaluator for the fixed point, an
evaluator for the whole recursive expression tree. Let’s find a general
way of implementing it.
Lambek’s theorem tells us that the constructor Fix is an isomor-
phism. We called its inverse unFix. We can therefore flip one arrow in
this diagram to get:
357Let’s write down the commutation condition for this diagram:
m = alg . fmap m . unFix
We can interpret this equation as a recursive definition of m. The recur-
sion is bound to terminate for any finite tree created using the functor
f. We can see that by noticing that fmap m operates underneath the top
layer of the functor f. In other words, it works on the children of the
original tree. The children are always one level shallower than the orig-
inal tree.
Here’s what happens when we apply m to a tree constructed using
Fix f. The action of unFix peels off the constructor, exposing the top
level of the tree. We then apply m to all the children of the top node. This
producesresultsoftypea.Finally,wecombinethoseresultsbyapplying
the non-recursive evaluator alg. The key point is that our evaluator alg
is a simple non-recursive function.
Since we can do this for any algebra alg, it makes sense to define
a higher order function that takes the algebra as a parameter and gives
us the function we called m. This higher order function is called a cata-
morphism:
cata :: Functor f => (f a -> a) -> Fix f -> a
cata alg = alg . fmap (cata alg) . unFix
Let’s see an example of that. Take the functor that defines natural num-
bers:
data NatF a = ZeroF | SuccF a
Let’s pick (Int, Int) as the carrier type and define our algebra as:
358fib :: NatF (Int, Int) -> (Int, Int)
fib ZeroF = (1, 1)
fib (SuccF (m, n)) = (n, m + n)
Youcaneasilyconvinceyourselfthatthecatamorphismforthisalgebra,
cata fib, calculates Fibonacci numbers.
In general, an algebra for NatF defines a recurrence relation: the
value of the current element in terms of the previous element. A cata-
morphism then evaluates the n-th element of that sequence.
## 24.5 Folds
A list of e is the initial algebra of the following functor:
data ListF e a = NilF | ConsF e a
Indeed, replacingthe variable a with the result of recursion, which we’ll
call List e, we get:
data List e = Nil | Cons e (List e)
An algebra for a list functor picks a particular carrier type and defines a
function that does pattern matching on the two constructors. Its value
for NilF tells us how to evaluate an empty list, and its value for ConsF
tells us how to combine the current element with the previously accu-
mulated value.
For instance, here’s an algebra that can be used to calculate the
length of a list (the carrier type is Int):
lenAlg :: ListF e Int -> Int
lenAlg (ConsF e n) = n + 1
lenAlg NilF = 0
359Indeed, the resulting catamorphism cata lenAlg calculates the length
of a list. Notice that the evaluator is a combination of (1) a function that
takes a list element and an accumulator and returns a new accumulator,
and (2) a starting value, here zero. The type of the value and the type of
the accumulator are given by the carrier type.
Compare this to the traditional Haskell definition:
length = foldr (\e n -> n + 1) 0
The two arguments to foldr are exactly the two components of the al-
gebra.
Let’s try another example:
sumAlg :: ListF Double Double -> Double
sumAlg (ConsF e s) = e + s
sumAlg NilF = 0.0
Again, compare this with:
sum = foldr (\e s -> e + s) 0.0
As you can see, foldr is just a convenient specialization of a catamor-
phism to lists.
## 24.6 Coalgebras
As usual, we have a dual construction of an F-coagebra, where the di-
rection of the morphism is reversed:
𝑎 → 𝐹 𝑎
360Coalgebras for a given functor also form a category, with homomor-
phisms preserving the coalgebraic structure. The terminal object (𝑡,𝑢)
in that category is called the terminal (or final) coalgebra. For every
other algebra (𝑎,𝑓) there is a unique homomorphism 𝑚 that makes the
following diagram commute:
A terminal colagebra is a fixed point of the functor, in the sense that
the morphism 𝑢 ∷ 𝑡 → 𝐹 𝑡 is an isomorphism (Lambek’s theorem for
coalgebras):
𝐹 𝑡 ≅ 𝑡
A terminal coalgebra is usually interpreted in programming as a recipe
for generating (possibly infinite) data structures or transition systems.
Just like a catamorphism can be used to evaluate an initial algebra,
an anamorphism can be used to coevaluate a terminal coalgebra:
ana :: Functor f => (a -> f a) -> a -> Fix f
ana coalg = Fix . fmap (ana coalg) . coalg
A canonical example of a coalgebra is based on a functor whose fixed
point is an infinite stream of elements of type e. This is the functor:
data StreamF e a = StreamF e a
deriving Functor
361and this is its fixed point:
data Stream e = Stream e (Stream e)
A coalgebra for StreamF e is a function that takes the seed of type a and
produces a pair (StreamF is a fancy name for a pair) consisting of an
element and the next seed.
You can easily generate simple examples of coalgebras that produce
infinite sequences, like the list of squares, or reciprocals.
A more interesting example is a coalgebra that produces a list of
primes. The trick is to use an infinite list as a carrier. Our starting seed
will be the list [2..]. The next seed will be the tail of this list with all
multiples of 2 removed. It’s a list of odd numbers starting with 3. In the
nextstep,we’lltakethetailofthislistandremoveallmultiplesof3,and
so on. You might recognize the makings of the sieve of Eratosthenes.
This coalgebra is implemented by the following function:
era :: [Int] -> StreamF Int [Int]
era (p : ns) = StreamF p (filter (notdiv p) ns)
where notdiv p n = n `mod` p /= 0
The anamorphism for this coalgebra generates the list of primes:
primes = ana era [2..]
A stream is an infinite list, so it should be possible to convert it to a
Haskell list. To do that, we can use the same functor StreamF to form an
algebra, and we can run a catamorphism over it. For instance, this is a
catamorphism that converts a stream to a list:
toListC :: Fix (StreamF e) -> [e]
toListC = cata al
where al :: StreamF e [e] -> [e]
al (StreamF e a) = e : a
362Here, the same fixed point is simultaneously an initial algebra and a
terminal coalgebra for the same endofunctor. It’s not always like this,
in an arbitrary category. In general, an endofunctor may have many (or
no) fixed points. The initial algebra is the so called least fixed point, and
the terminal coalgebra is the greatest fixed point. In Haskell, though,
both are defined by the same formula, and they coincide.
The anamorphism for lists is called unfold. To create finite lists, the
functor is modified to produce a Maybe pair:
unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
The value of Nothing will terminate the generation of the list.
An interesting case of a coalgebra is related to lenses. A lens can be
represented as a pair of a getter and a setter:
set :: a -> s -> a
get :: a -> s
Here, a is usually some product data type with a field of type s. The
getter retrieves the value of that field and the setter replaces this field
with a new value. These two functions can be combined into one:
a -> (s, s -> a)
We can rewrite this function further as:
a -> Store s a
where we have defined a functor:
data Store s a = Store (s -> a) s
363Notice that this is not a simple algebraic functor constructed from sums
of products. It involves an exponential 𝑎𝑠.
A lens is a coalgebra for this functor with the carrier type a. We’ve
seen before that Store s is also a comonad. It turns out that a well-
behaved lens corresponds to a coalgebra that is compatible with the
comonad structure. We’ll talk about this in the next section.
## 24.7 Challenges
1. Implement the evaluation function for a ring of polynomials of
one variable. You can represent a polynomial as a list of coef-
ficients in front of powers of 𝑥. For instance, 4𝑥2 − 1 would be
represented as (starting with the zero’th power) [-1, 0, 4].
2. Generalize the previous construction to polynomials of many in-
dependent variables, like 𝑥2𝑦 − 3𝑦3𝑧.
3. Implement the algebra for the ring of 2 × 2 matrices.
4. Defineacoalgebrawhoseanamorphismproducesalistofsquares
of natural numbers.
5. Use unfoldr to generate a list of the first 𝑛 primes.
36425
Algebras for Monads
If we interpret endofunctors as ways of defining expressions, alge-
bras let us evaluate them and monads let us form and manipulate
them. By combining algebras with monads we not only gain a lot of
functionality but we can also answer a few interesting questions.
One such question concerns the relation
between monads and adjunctions. As we’ve
seen, every adjunction defines a monad (and a
comonad). The question is: Can every monad
(comonad) be derived from an adjunction? The
answerispositive.Thereisawholefamilyofad-
junctionsthatgenerateagivenmonad.I’llshow
you two such adjunction. Let’s review the defi-
nitions. A monad is an endofunctor 𝑚 equipped with two natural trans-
formations that satisfy some coherence conditions. The components of
365these transformations at 𝑎 are:
𝜂𝑎 ∷ 𝑎 → 𝑚 𝑎
𝜇𝑎 ∷ 𝑚 (𝑚 𝑎) → 𝑚 𝑎
An algebra for the same endofunctor is a selection of a particular object
— the carrier 𝑎 — together with the morphism:
𝑎𝑙𝑔 ∷ 𝑚 𝑎 → 𝑎
Thefirstthingtonoticeisthatthealgebragoesintheoppositedirection
to 𝜂𝑎𝑎. The intuition is that 𝜂𝑎 creates a trivial expression from a value
of type 𝑎. The first coherence condition that makes the algebra compat-
ible with the monad ensures that evaluating this expression using the
algebra whose carrier is 𝑎 gives us back the original value:
𝑎𝑙𝑔 ∘ 𝜂𝑎 = id𝑎
The second condition arises from the fact that there are two ways of
evaluating the doubly nested expression 𝑚 (𝑚 𝑎). We can first apply 𝜇𝑎
to flatten the expression, and then use the evaluator of the algebra; or
we can apply the lifted evaluator to evaluate the inner expressions, and
then apply the evaluator to the result. We’d like the two strategies to be
equivalent:
𝑎𝑙𝑔 ∘ 𝜇𝑎 = 𝑎𝑙𝑔 ∘ 𝑚 𝑎𝑙𝑔
Here, m alg is the morphism resulting from lifting 𝑎𝑙𝑔 using the functor
𝑚. The following commuting diagrams describe the two conditions (I
replaced 𝑚 with 𝑇 in anticipation of what follows):
366𝑎 𝑇𝑎
𝑎
𝜂𝑎
𝑎𝑙𝑔
𝑇(𝑇𝑎) 𝑇𝑎
𝑇𝑎 𝑎
𝑇 𝑎𝑙𝑔
𝜇𝑎 𝑎𝑙𝑔
𝑎𝑙𝑔
We can also express these conditions in Haskell:
alg . return = id
alg . join = alg . fmap alg
Let’s look at a small example. An algebra for a list endofunctor consists
of some type a and a function that produces an a from a list of a. We can
express this function using foldr by choosing both the element type
and the accumulator type to be equal to a:
foldr :: (a -> a -> a) -> a -> [a] -> a
This particular algebra is specified by a two-argument function, let’s
call it f, and a value z. The list functor happens to also be a monad,
with return turning a value into a singleton list. The composition of the
algebra, here foldr f z, after return takes x to:
foldr f z [x] = x `f` z
wheretheactionoff iswrittenintheinfixnotation.Thealgebraiscom-
patible with the monad if the following coherence condition is satisfied
for every x:
x `f` z = x
367If we look at f as a binary operator, this condition tells us that z is the
right unit.
Thesecondcoherenceconditionoperatesonalistoflists.Theaction
of join concatenates the individual lists. We can then fold the resulting
list. On the other hand, we can first fold the individual lists, and then
fold the resulting list. Again, if we interpret f as a binary operator, this
condition tells us that this binary operation is associative. These condi-
tions are certainly fulfilled when (a, f, z) is a monoid.
25.1 T-algebras
Since mathematicians prefer to call their monads 𝑇, they call algebras
compatible with them T-algebras. T-algebras for a given monad 𝑇 in
a category 𝐂 form a category called the Eilenberg-Moore category, of-
ten denoted by 𝐂𝑇. Morphisms in that category are homomorphisms of
algebras. These are the same homomorphisms we’ve seen defined for
F-algebras.
A T-algebra is a pair consisting of a carrier object and an evaluator,
(𝑎,𝑓). There is an obvious forgetful functor 𝑈𝑇 from 𝐂𝑇 to 𝐂, which
maps (𝑎,𝑓) to 𝑎. It also maps a homomorphism of T-algebras to a cor-
responding morphism between carrier objects in 𝐂. You may remember
from our discussion of adjunctions that the left adjoint to a forgetful
functor is called a free functor.
The left adjoint to 𝑈𝑇 is called 𝐹𝑇. It maps an object 𝐴 in 𝐂 to a free
algebra in 𝐂𝑇. The carrier of this free algebra is 𝑇 𝑎. Its evaluator is a
morphism from 𝑇 (𝑇 𝑎) back to 𝑇 𝑎. Since 𝑇 is a monad, we can use the
monadic 𝜇𝑎 (join in Haskell) as the evaluator.
368WestillhavetoshowthatthisisaT-algebra.Forthat,twocoherence
conditions must be satisfied:
𝑎𝑙𝑔 ∘ 𝜂𝑇𝑎 = id𝑇𝑎
𝑎𝑙𝑔 ∘ 𝜇𝑎 = 𝑎𝑙𝑔 ∘ 𝑇 𝑎𝑙𝑔
But these are just monadic laws, if you plug in 𝜇 for the algebra.
As you may recall, every adjunction defines a monad. It turns out
that the adjunction between 𝐹𝑇 and 𝑈𝑇 defines the very monad 𝑇 that
was used in the construction of the Eilenberg-Moorecategory. Since we
can perform this construction for every monad, we conclude that every
monad can be generated from an adjunction. Later I’ll show you that
there is another adjunction that generates the same monad.
Here’s the plan: First I’ll show you that 𝐹𝑇 is indeed the left adjoint
of𝑈𝑇.I’lldoitbydefiningtheunitandthecounitofthisadjunctionand
proving that the corresponding triangular identities are satisfied. Then
I’ll show you that the monad generated by this adjunction is indeed our
original monad.
The unit of the adjunction is the natural transformation:
𝜂 ∷ 𝐼 → 𝑈𝑇 ∘ 𝐹𝑇
Let’s calculate the 𝑎 component of this transformation. The identity
functor gives us 𝑎. The free functor produces the free algebra (𝑇 𝑎,𝜇𝑎),
and the forgetful functor reduces it to 𝑇 𝑎. Altogether we get a mapping
from 𝑎 to 𝑇 𝑎. We’ll simply use the unit of the monad 𝑇 as the unit of
this adjunction.
Let’s look at the counit:
𝜀 ∷ 𝐹𝑇 ∘ 𝑈𝑇 → 𝐼
369Let’s calculate its component at some T-algebra (𝑎,𝑓). The forgetful
functorforgetsthe𝑓,andthefreefunctorproducesthepair(𝑇 𝑎,𝜇𝑎).So
in order to define the component of the counit 𝜀 at (𝑎,𝑓), we need the
right morphism in the Eilenberg-Moore category, or a homomorphism
of T-algebras:
(𝑇 𝑎,𝜇𝑎) → (𝑎,𝑓)
Such homomorphism should map the carrier 𝑇 𝑎 to 𝑎. Let’s just res-
urrect the forgotten evaluator 𝑓. This time we’ll use it as a homomor-
phism of T-algebras. Indeed, the same commuting diagram that makes
𝑓 a T-algebra may be re-interpreted to show that it’s a homomorphism
of T-algebras:
𝑇(𝑇𝑎) 𝑇𝑎
𝑇𝑎 𝑎
𝑇𝑓
𝜇𝑎 𝑓
𝑓
We have thus defined the component of the counit natural transforma-
tion 𝜀 at (𝑎,𝑓) (an object in the category of T-algebras) to be 𝑓.
To complete the adjunction we also need to show that the unit and
the counit satisfy triangular identities. These are:
𝑇𝑎 𝑇(𝑇𝑎)
𝑇𝑎
𝑇𝜂𝑎
𝜇𝑎
𝑎 𝑇𝑎
𝑎
𝜂𝑎
𝑓
370The first one holds because of the unit law for the monad 𝑇. The second
is just the law of the T-algebra (𝑎,𝑓).
We have established that the two functors form an adjunction:
𝐹𝑇 ⊣ 𝑈𝑇
Every adjunction gives rise to a monad. The round trip
𝑈𝑇 ∘ 𝐹𝑇
istheendofunctorinCthatgivesrisetothecorrespondingmonad.Let’s
see what its action on an object 𝑎 is. The free algebra created by 𝐹𝑇 is
(𝑇 𝑎,𝜇𝑎). The forgetful functor 𝐹𝑇 drops the evaluator. So, indeed, we
have:
𝑈𝑇 ∘ 𝐹𝑇 = 𝑇
As expected, the unit of the adjunction is the unit of the monad 𝑇.
You may remember that the counint of the adjunction produces
monadic multiplication through the following formula:
𝜇 = 𝑅 ∘ 𝜀 ∘ 𝐿
This is a horizontal composition of three natural transformations, two
of them being identity natural transformations mapping, respectively,
𝐿 to 𝐿 and 𝑅 to 𝑅. The one in the middle, the counit, is a natural trans-
formation whose component at an algebra (𝑎,𝑓) is 𝑓.
Let’s calculate the component 𝜇𝑎. We first horizontally compose 𝜀
after 𝐹𝑇, which results in the component of 𝜀 at 𝐹𝑇 𝑎. Since 𝐹𝑇 takes 𝑎
to the algebra (𝑇 𝑎,𝜇𝑎), and 𝜀 picks the evaluator, we end up with 𝜇𝑎.
Horizontal composition on the left with 𝑈𝑇 doesn’t change anything,
sincetheactionof𝑈𝑇 onmorphismsistrivial.So,indeed,the𝜇 obtained
from the adjunction is the same as the 𝜇 of the original monad 𝑇.
37125.2 The Kleisli Category
We’ve seen the Kleisli category before. It’s a category constructed from
another category 𝐂 and a monad 𝑇. We’ll call this category 𝐂𝑇. The ob-
jects in the Kleisli category 𝐂𝑇 are the objects of 𝐂, but the morphisms
are different. A morphism 𝑓𝐊 from 𝑎 to 𝑏 in the Kleisli category corre-
sponds to a morphism 𝑓 from 𝑎 to 𝑇 𝑏 in the original category. We call
this morphism a Kleisli arrow from 𝑎 to 𝑏.
CompositionofmorphismsintheKleislicategoryisdefinedinterms
ofmonadiccompositionofKleisliarrows.Forinstance,let’scompose𝑔𝐊
after 𝑓𝐊. In the Kleisli category we have:
𝑓𝐊 ∷ 𝑎 → 𝑏
𝑔𝐊 ∷ 𝑏 → 𝑐
which, in the category 𝐂, corresponds to:
𝑓 ∷ 𝑎 → 𝑇 𝑏
𝑔 ∷ 𝑏 → 𝑇 𝑐
We define the composition:
ℎ𝐊 = 𝑔𝐊 ∘ 𝑓𝐊
as a Kleisli arrow in 𝐂
ℎ ∷ 𝑎 → 𝑇 𝑐
ℎ = 𝜇 ∘ (𝑇 𝑔) ∘ 𝑓
In Haskell we would write it as:
h = join . fmap g . f
372There is a functor 𝐹 from 𝐂 to 𝐂𝑇 which acts trivially on objects. On
morphims, it maps 𝑓 in 𝐂 to a morphism in 𝐂𝑇 by creating a Kleisli
arrow that embellishes the return value of 𝑓. Given a morphism:
𝑓 ∷ 𝑎 → 𝑏
it creates a morphism in 𝐂𝑇 with the corresponding Kleisli arrow:
𝜂 ∘ 𝑓
In Haskell we’d write it as:
return . f
We can also define a functor 𝐺 from 𝐂𝑇 back to 𝐂. It takes an object 𝑎
from the Kleisli category and maps it to an object 𝑇 𝑎 in 𝐂. Its action on
a morphism 𝑓𝐊 corresponding to a Kleisli arrow:
𝑓 ∷ 𝑎− > 𝑇 𝑏
is a morphism in 𝐂:
𝑇 𝑎 → 𝑇 𝑏
given by first lifting 𝑓 and then applying 𝜇:
𝜇𝑇 𝑏 ∘ 𝑇 𝑓
In Haskell notation this would read:
G fT = join . fmap f
You may recognize this as the definition of monadic bind in terms of
join.
373It’s easy to see that the two functors form an adjunction:
𝐹 ⊣ 𝐺
and their composition 𝐺 ∘ 𝐹 reproduces the original monad 𝑇.
So this is the second adjunction that produces the same monad. In
fact there is a whole category of adjunctions 𝐀𝐝𝐣(𝐂,𝑇) that result in
the same monad 𝑇 on 𝐂. The Kleisli adjunction we’ve just seen is the
initialobjectinthiscategory,andtheEilenberg-Mooreadjunctionisthe
terminal object.
## 25.3 Coalgebras for Comonads
Analogous constructions can be done for any comonad 𝑊. We can de-
fine a category of coalgebras that are compatible with a comonad. They
make the following diagrams commute:
𝑎 𝑊𝑎
𝑎
𝜖𝑎
𝑐𝑜𝑎
𝑊(𝑊𝑎) 𝑊𝑎
𝑊𝑎 𝑎
𝑊 𝑐𝑜𝑎
𝛿𝑎 𝑐𝑜𝑎
𝑐𝑜𝑎
where 𝑐𝑜𝑎 is the coevaluation morphism of the coalgebra whose carrier
is 𝑎:
𝑐𝑜𝑎 ∷ 𝑎 → 𝑊 𝑎
and 𝜀 and 𝛿 are the two natural transformations defining the comonad
(in Haskell, their components are called extract and duplicate).
Thereisanobviousforgetfulfunctor𝑈𝑊 fromthecategoryofthese
coalgebras to 𝐂. It just forgets the coevaluation. We’ll consider its right
374adjoint 𝐹𝑊 .
𝑈𝑊 ⊣ 𝐹𝑊
The right adjoint to a forgetful functor is called a cofree functor. 𝐹𝑊
generates cofree coalgebras. It assigns, to an object 𝑎 in 𝐂, the coalge-
bra (𝑊 𝑎,𝛿𝑎). The adjunction reproduces the original comonad as the
composite 𝐹𝑊 ∘ 𝑈𝑊 .
Similarly, we can construct a co-Kleisli category with co-Kleisli ar-
rows and regenerate the comonad from the corresponding adjunction.
## 25.4 Lenses
Let’s go back to our discussion of lenses. A lens can be written as a
coalgebra:
𝑐𝑜𝑎𝑙𝑔𝑠 ∷ 𝑎 → 𝑆𝑡𝑜𝑟𝑒 𝑠 𝑎
for the functor 𝑆𝑡𝑜𝑟𝑒 𝑠:
data Store s a = Store (s -> a) s
This coalgebra can be also expressed as a pair of functions:
𝑠𝑒𝑡 ∷ 𝑎 → 𝑠 → 𝑎
𝑔𝑒𝑡 ∷ 𝑎 → 𝑠
(Think of 𝑎 as standing for “all,” and 𝑠 as a “small” part of it.) In terms of
this pair, we have:
𝑐𝑜𝑎𝑙𝑔𝑠 𝑎 = 𝑆𝑡𝑜𝑟𝑒 (𝑠𝑒𝑡 𝑎) (𝑔𝑒𝑡 𝑎)
Here,𝑎 isavalueoftype𝑎.Noticethatpartiallyapplied𝐒𝐞𝐭isafunction
𝑠 → 𝑎.
We also know that 𝑆𝑡𝑜𝑟𝑒 𝑠 is a comonad:
375instance Comonad (Store s) where
extract (Store f s) = f s
duplicate (Store f s) = Store (Store f) s
The question is: Under what conditions is a lens a coalgebra for this
comonad? The first coherence condition:
𝜀𝑎 ∘ 𝑐𝑜𝑎𝑙𝑔 = id𝑎
translates to:
𝑠𝑒𝑡 𝑎 (𝑔𝑒𝑡 𝑎) = 𝑎
This is the lens law that expresses the fact that if you set a field of the
structure 𝑎 to its previous value, nothing changes.
The second condition:
𝑓𝑚𝑎𝑝 𝑐𝑜𝑎𝑙𝑔 ∘ 𝑐𝑜𝑎𝑙𝑔 = 𝛿𝑎 ∘ 𝑐𝑜𝑎𝑙𝑔
requires a little more work. First, recall the definition of fmap for the
Store functor:
fmap g (Store f s) = Store (g . f) s
Applying fmap coalg to the result of coalg gives us:
Store (coalg . set a) (get a)
On the other hand, applying duplicate to the result of coalg produces:
Store (Store (set a)) (get a)
For these two expressions to be equal, the two functions under Store
must be equal when acting on an arbitrary s:
376coalg (set a s) = Store (set a) s
Expanding coalg, we get:
Store (set (set a s)) (get (set a s)) = Store (set a) s
This is equivalent to two remaining lens laws. The first one:
set (set a s) = set a
tells us that setting the value of a field twice is the same as setting it
once. The second law:
get (set a s) = s
tells us that getting a value of a field that was set to 𝑠 gives 𝑠 back.
In other words, a well-behaved lens is indeed a comonad coalgebra
for the Store functor.
## 25.5 Challenges
1. Whatistheactionofthefreefunctor𝐹 ∷ 𝐶 → 𝐶𝑇 onmorphisms.
Hint: use the naturality condition for monadic 𝜇.
2. Define the adjunction:
𝑈𝑊 ⊣ 𝐹𝑊
3. Provethattheaboveadjunctionreproducestheoriginalcomonad.
37726 Ends and Coends
There are many intuitions that we may attach to morphisms in a
category, but we can all agree that if there is a morphism from the
object 𝑎 to the object 𝑏 than the two objects are in some way “related.”
A morphism is, in a sense, the proof of this relation. This is clearly vis-
ible in any poset category, where a morphism is a relation. In general,
there may be many “proofs” of the same relation between two objects.
These proofs form a set that we call the hom-set. When we vary the
objects, we get a mapping from pairs of objects to sets of “proofs.” This
mapping is functorial — contravariant in the first argument and covari-
ant in the second. We can look at it as establishing a global relationship
between objects in the category. This relationship is described by the
hom-functor:
𝐂(−,=) ∷ 𝐂𝑜𝑝 × 𝐂 → 𝐒𝐞𝐭
378In general, any functor like this may be interpreted as establishing a
relation between objects in a category. A relation may also involve two
different categories C and D. A functor, which describes such a relation,
has the following signature and is called a profunctor:
𝑝 ∷ 𝐃𝑜𝑝 × 𝐂 → 𝐒𝐞𝐭
Mathematicians say that it’s a profunctor from 𝐂 to 𝐃 (notice the inver-
sion), and use a slashed arrow as a symbol for it:
𝐂 ↛ 𝐃
You may think of a profunctor as a proof-relevant relation between ob-
jects of 𝐂 and objects of 𝐃, where the elements of the set symbolize
proofs of the relation. Whenever 𝑝 𝑎 𝑏 is empty, there is no relation be-
tween 𝑎 and 𝑏. Keep in mind that relations don’t have to be symmetric.
Another useful intuition is the generalization of the idea that an
endofunctor is a container. A profunctor value of the type 𝑝 𝑎 𝑏 could
then be considered a container of 𝑏s that are keyed by elements of type
𝑎. In particular, an element of the hom-profunctor is a function from 𝑎
to 𝑏.
InHaskell,aprofunctorisdefinedasatwo-argumenttypeconstruc-
tor p equipped with the method called dimap, which lifts a pair of func-
tions, the first going in the “wrong” direction:
class Profunctor p where
dimap :: (c -> a) -> (b -> d) -> p a b -> p c d
The functoriality of the profunctor tells us that if we have a proof that
a is related to b, then we get the proof that c is related to d, as long as
there is a morphism from c to a and another from b to d. Or, we can
379think of the first function as translating new keys to the old keys, and
the second function as modifying the contents of the container.
For profunctors acting within one category, we can extract quite a
lot of information from diagonal elements of the type 𝑝 𝑎 𝑎. We can
prove that 𝑏 is related to 𝑐 as long as we have a pair of morphisms
𝑏 → 𝑎 and 𝑎 → 𝑐. Even better, we can use a single morphism to reach
off-diagonal values. For instance, if we have a morphism 𝑓 ∷ 𝑎 → 𝑏,
we can lift the pair ⟨𝑓,id𝑏⟩ to go from 𝑝 𝑏 𝑏 to 𝑝 𝑎 𝑏:
dimap f id (p b b) :: p a b
Or we can lift the pair ⟨id𝑎,𝑓⟩ to go from 𝑝 𝑎 𝑎 to 𝑝 𝑎 𝑏:
dimap id f (p a a) :: p a b
## 26.1 Dinatural Transformations
Since profunctors are functors, we can define natural transformations
between them in the standard way. In many cases, though, it’s enough
to define the mapping between diagonal elements of two profunctors.
Such a transformation is called a dinatural transformation, provided it
satisfies the commuting conditions that reflect the two ways we can
connect diagonal elements to non-diagonal ones. A dinatural transfor-
mation between two profunctors 𝑝 and 𝑞, which are members of the
functor category [𝐂𝑜𝑝 × 𝐂,𝐒𝐞𝐭], is a family of morphisms:
𝛼𝑎 ∷ 𝑝 𝑎 𝑎 → 𝑞 𝑎 𝑎
for which the following diagram commutes, for any 𝑓 ∷ 𝑎 → 𝑏:
380Noticethatthisisstrictlyweakerthanthenaturalitycondition.If𝛼 were
a natural transformation in [𝐂𝑜𝑝 × 𝐂,𝐒𝐞𝐭], the above diagram could be
constructedfromtwonaturalitysquaresandonefunctorialitycondition
(profunctor 𝑞 preserving composition):
381Notice that a component of a natural transformation 𝛼 in [𝐂𝑜𝑝 ×𝐂,𝐒𝐞𝐭]
is indexed by a pair of objects 𝛼𝑎 𝑏. A dinatural transformation, on the
other hand, is indexed by one object, since it only maps diagonal ele-
ments of the respective profunctors.
## 26.2 Ends
We are now ready to advance from “algebra” to what could be consid-
eredthe“calculus”ofcategorytheory.Thecalculusofends(andcoends)
borrows ideas and even some notation from traditional calculus. In par-
ticular, the coend may be understood as an infinite sum or an integral,
whereas the end is similar to an infinite product. There is even some-
thing that resembles the Dirac delta function.
An end is a generalization of a limit, with the functor replaced by a
profunctor. Instead of a cone, we have a wedge. The base of a wedge is
formedbydiagonalelementsofaprofunctor𝑝.Theapexofthewedgeis
an object (here, a set, since we are considering 𝐒𝐞𝐭-valued profunctors),
and the sides are a family of functions mapping the apex to the sets in
the base. You may think of this family as one polymorphic function —
a function that’s polymorphic in its return type:
𝛼 ∷ ∀𝑎 . 𝑎𝑝𝑒𝑥− > 𝑝 𝑎 𝑎
Unlikeincones,withinawedgewedon’thaveanyfunctionsthatwould
connect vertices of the base. However, as we’ve seen earlier, given any
morphism 𝑓 ∷ 𝑎 → 𝑏 in 𝐂, we can connect both 𝑝 𝑎 𝑎 and 𝑝 𝑏 𝑏 to
the common set 𝑝 𝑎 𝑏. We therefore insist that the following diagram
commute:
382This is called the wedge condition. It can be written as:
𝑝 id𝑎 𝑓 ∘ 𝛼𝑎 = 𝑝 𝑓 id𝑏 ∘ 𝛼𝑏
Or, using Haskell notation:
dimap id f . alpha = dimap f id . alpha
Wecannowproceed withtheuniversalconstructionanddefine theend
of 𝑝 as the universal wedge — a set 𝑒 together with a family of functions
𝜋 such that for any other wedge with the apex 𝑎 and a family 𝛼 there is
a unique function ℎ ∷ 𝑎 → 𝑒 that makes all triangles commute:
𝜋𝑎 ∘ ℎ = 𝛼𝑎
383The symbol for the end is the integral sign, with the “integration vari-
able” in the subscript position:
∫
𝑐
𝑝 𝑐 𝑐
Components of 𝜋 are called projection maps for the end:
𝜋𝑎 ∷ ∫
𝑐
𝑝 𝑐 𝑐 → 𝑝 𝑎 𝑎
Note that if 𝐂 is a discrete category (no morphisms other than the iden-
tities) the end is just a global product of all diagonal entries of 𝑝 across
the whole category 𝐂. Later I’ll show you that, in the more general case,
there is a relationship between the end and this product through an
equalizer.
InHaskell,theendformulatranslatesdirectlytotheuniversalquan-
tifier:
forall a. p a a
Strictly speaking, this is just a product of all diagonal elements of 𝑝, but
thewedgeconditionissatisfiedautomaticallyduetoparametricity1.For
any function 𝑓 ∷ 𝑎 → 𝑏, the wedge condition reads:
dimap f id . pi = dimap id f . pi
or, with type annotations:
dimap f idb . pib = dimap ida f . pia
where both sides of the equation have the type:
1https://bartoszmilewski.com/2017/04/11/profunctor-parametricity/
384Profunctor p => (forall c. p c c) -> p a b
and pi is the polymorphic projection:
pi :: Profunctor p => forall c. (forall a. p a a) -> p c c
pi e = e
Here, type inference automatically picks the right component of e.
Just as we were able to express the whole set of commutation con-
ditions for a cone as one natural transformation, likewise we can group
all the wedge conditions into one dinatural transformation. For that we
need the generalization of the constant functor Δ𝑐 to a constant pro-
functor that maps all pairs of objects to a single object 𝑐, and all pairs
of morphisms to the identity morphism for this object. A wedge is a
dinatural transformation from that functor to the profunctor 𝑝. Indeed,
the dinaturality hexagon shrinks down to the wedge diamond when we
realize that Δ𝑐 lifts all morphisms to one identity function.
Ends can also be defined for target categories other than 𝐒𝐞𝐭, but
here we’ll only consider 𝐒𝐞𝐭-valued profunctors and their ends.
## 26.3 Ends as Equalizers
The commutation condition in the definition of the end can be written
using an equalizer. First, let’s define two functions (I’m using Haskell
notation, because mathematical notation seems to be less user-friendly
inthiscase).Thesefunctionscorrespondtothetwoconvergingbranches
of the wedge condition:
lambda :: Profunctor p => p a a -> (a -> b) -> p a b
lambda paa f = dimap id f paa
385rho :: Profunctor p => p b b -> (a -> b) -> p a b
rho pbb f = dimap f id pbb
Both functions map diagonal elements of the profunctor p to polymor-
phic functions of the type:
type ProdP p = forall a b. (a -> b) -> p a b
Thesefunctionshavedifferenttypes.However,wecanunifytheirtypes,
if we form one big product type, gathering together all diagonal ele-
ments of p:
newtype DiaProd p = DiaProd (forall a. p a a)
The functions lambda and rho induce two mappings from this product
type:
lambdaP :: Profunctor p => DiaProd p -> ProdP p
lambdaP (DiaProd paa) = lambda paa
rhoP :: Profunctor p => DiaProd p -> ProdP p
rhoP (DiaProd pbb) = rho pbb
The end of p is the equalizer of these two functions. Remember that the
equalizer picks the largest subset on which two functions are equal. In
this case it picks the subset of the product of all diagonal elements for
which the wedge diagrams commute.
## 26.4 Natural Transformations as Ends
The most important example of an end is the set of natural transfor-
mations. A natural transformation between two functors 𝐹 and 𝐺 is a
386family of morphisms picked from hom-sets of the form 𝐂(𝐹 𝑎,𝐺 𝑎). If it
weren’t for the naturality condition, the set of natural transformations
would be just the product of all these hom-sets. In fact, in Haskell, it is:
forall a. f a -> g a
The reason it works in Haskell is because naturality follows from para-
metricity. Outside of Haskell, though, not all diagonal sections across
such hom-sets will yield natural transformations. But notice that the
mapping:
⟨𝑎,𝑏⟩ → 𝐂(𝐹 𝑎,𝐺 𝑏)
is a profunctor, so it makes sense to study its end. This is the wedge
condition:
Let’s just pick one element from the set ∫𝑐 𝐂(𝐹 𝑐,𝐺 𝑐). The two projec-
tions will map this element to two components of a particular transfor-
387mation, let’s call them:
𝜏𝑎 ∷ 𝐹 𝑎 → 𝐺 𝑎
𝜏𝑏 ∷ 𝐹 𝑏 → 𝐺 𝑏
In the left branch, we lift a pair of morphisms ⟨id𝑎,𝐺 𝑓⟩ using the hom-
functor.Youmayrecallthatsuchliftingisimplementedassimultaneous
pre- and post-composition. When acting on 𝜏𝑎 the lifted pair gives us:
𝐺 𝑓 ∘ 𝜏𝑎 ∘ id𝑎
The other branch of the diagram gives us:
id𝑏 ∘ 𝜏𝑏 ∘ 𝐹 𝑓
Their equality, demanded by the wedge condition, is nothing but the
naturality condition for 𝜏.
## 26.5 Coends
As expected, the dual to an end is called a coend. It is constructed from
a dual to a wedge called a cowedge (pronounced co-wedge, not cow-
edge).
The symbol for a coend is the integral sign with the “integration
variable” in the superscript position:
∫
𝑐
𝑝 𝑐 𝑐
Just like the end is related to a product, the coend is related to a co-
product, or a sum (in this respect, it resembles an integral, which is a
388limit of a sum). Rather than having projections, we have injections go-
ing from the diagonal elements of the profunctor down to the coend. If
it weren’t for the cowedge conditions, we could say that the coend of
the profunctor 𝑝 is either 𝑝 𝑎 𝑎, or 𝑝 𝑏 𝑏, or 𝑝 𝑐 𝑐, and so on. Or we could
say that there exists such an 𝑎 for which the coend is just the set 𝑝 𝑎 𝑎.
The universal quantifier that we used in the definition of the end turns
into an existential quantifier for the coend.
An edgy cow?
This is why, in pseudo-Haskell, we would de-
fine the coend as:
exists a. p a a
The standard way of encoding existential quan-
tifiers in Haskell is to use universally quantified
data constructors. We can thus define:
data Coend p = forall a. Coend (p a a)
The logic behind this is that it should be possible to construct a coend
using a value of any of the family of types 𝑝 𝑎 𝑎, no matter what 𝑎 we
chose.
Justlikeanendcanbedefinedusinganequalizer,acoendcanbede-
scribed using a coequalizer. All the cowedge conditions can be summa-
rized by taking one gigantic coproduct of 𝑝 𝑎 𝑏 for all possible functions
𝑏 → 𝑎. In Haskell, that would be expressed as an existential type:
data SumP p = forall a b. SumP (b -> a) (p a b)
There are two ways of evaluating this sum type, by lifting the function
using dimap and applying it to the profunctor 𝑝:
389lambda, rho :: Profunctor p => SumP p -> DiagSum p
lambda (SumP f pab) = DiagSum (dimap f id pab)
rho (SumP f pab) = DiagSum (dimap id f pab)
where DiagSum is the sum of diagonal elements of 𝑝:
data DiagSum p = forall a. DiagSum (p a a)
The coequalizer of these two functions is the coend. A coequilizer is
obtained from DiagSum p by identifying values that are obtained by ap-
plying lambda or rho to the same argument. Here, the argument is a pair
consisting of a function 𝑏 → 𝑎 and an element of 𝑝 𝑎 𝑏. The applica-
tion of lambda and rho produces two potentially different values of the
type DiagSum p. In the coend, these two values are identified, making
the cowedge condition automatically satisfied.
The process of identification of related elements in a set is formally
knownastakingaquotient.Todefineaquotientweneedanequivalence
relation ∼, a relation that is reflexive, symmetric, and transitive:
𝑎 ∼ 𝑎
if 𝑎 ∼ 𝑏 then 𝑏 ∼ 𝑎
if 𝑎 ∼ 𝑏 and 𝑏 ∼ 𝑐 then 𝑎 ∼ 𝑐
Such a relation splits the set into equivalence classes. Each class con-
sists of elements that are related to each other. We form a quotient set
by picking one representative from each class. A classic example is the
definition of rational numbers as pairs of whole numbers with the fol-
lowing equivalence relation:
(𝑎,𝑏) ∼ (𝑐,𝑑) iff 𝑎 ∗ 𝑑 = 𝑏 ∗ 𝑐
390It’s easy to check that this is an equivalence relation. A pair (𝑎,𝑏) is
interpretedasafraction
𝑎
𝑏
,andfractionsthathaveacommondivisorare
identified. A rational number is an equivalence class of such fractions.
You might recall from our earlier discussion of limits and colimits
that the hom-functor is continuous, that is, it preserves limits. Dually,
the contravariant hom-functor turns colimits into limits. These proper-
ties can be generalized to ends and coends, which are a generalization
of limits and colimits, respectively. In particular, we get a very useful
identity for converting coends to ends:
𝐒𝐞𝐭(∫
𝑥
𝑝 𝑥 𝑥,𝑐) ≅ ∫
𝑥
𝐒𝐞𝐭(𝑝 𝑥 𝑥,𝑐)
Let’s have a look at it in pseudo-Haskell:
(exists x. p x x) -> c ≅ forall x. p x x -> c
It tells us that a function that takes an existential type is equivalent
to a polymorphic function. This makes perfect sense, because such a
function must be prepared to handle any one of the types that may be
encoded in the existential type. It’s the same principle that tells us that
a function that accepts a sum type must be implemented as a case state-
ment, with a tuple of handlers, one for every type present in the sum.
Here, the sum type is replaced by a coend, and a family of handlers
becomes an end, or a polymorphic function.
## 26.6 Ninja Yoneda Lemma
The set of natural transformations that appears in the Yoneda lemma
may be encoded using an end, resulting in the following formulation:
∫
𝑧
𝐒𝐞𝐭(𝐂(𝑎,𝑧),𝐹 𝑧) ≅ 𝐹 𝑎
391There is also a dual formula:
∫
𝑧
𝐂(𝑎,𝑧) × 𝐹 𝑧 ≅ 𝐹 𝑎
This identity is strongly reminiscent of the formula for the Dirac delta
function(afunction𝛿(𝑎−𝑧),orratheradistribution,thathasaninfinite
peakat𝑎 = 𝑧).Here,thehom-functorplaystheroleofthedeltafunction.
TogetherthesetwoidentitiesaresometimescalledtheNinjaYoneda
lemma.
To prove the second formula, we will use the consequence of the
Yoneda embedding, which states that two objects are isomorphic if and
only if their hom-functors are isomorphic. In other words 𝑎 ≅ 𝑏 if and
only if there is a natural transformation of the type:
[𝐂,𝐒𝐞𝐭](𝐂(𝑎,−),𝐂(𝑏,=))
that is an isomorphism.
We start by inserting the left-hand side of the identity we want to
prove inside a hom-functor that’s going to some arbitrary object 𝑐:
𝐒𝐞𝐭(∫
𝑧
𝐂(𝑎,𝑧) × 𝐹 𝑧,𝑐)
Using the continuity argument, we can replace the coend with the end:
∫
𝑧
𝐒𝐞𝐭(𝐂(𝑎,𝑧) × 𝐹 𝑧,𝑐)
We can now take advantage of the adjunction between the product and
the exponential:
∫
𝑧
𝐒𝐞𝐭(𝐂(𝑎,𝑧),𝑐(𝐹 𝑧))
392We can “perform the integration” by using the Yoneda lemma to get:
𝑐(𝐹 𝑎)
This exponential object is isomorphic to the hom-set:
𝐒𝐞𝐭(𝐹 𝑎,𝑐)
Finally, we take advantage of the Yoneda embedding to arrive at the
isomorphism:
∫
𝑧
𝐂(𝑎,𝑧) × 𝐹 𝑧 ≅ 𝐹 𝑎
## 26.7 Profunctor Composition
Let’s explore further the idea that a profunctor describes a relation —
more precisely, a proof-relevant relation, meaning that the set 𝑝 𝑎 𝑏
representsthesetofproofsthat𝑎 isrelatedto𝑏.Ifwehavetworelations
𝑝 and 𝑞 we can try to compose them. We’ll say that 𝑎 is related to 𝑏
throughthecompositionof𝑞 after𝑝 ifthereexistanintermediaryobject
𝑐 such that both 𝑞 𝑏 𝑐 and 𝑝 𝑐 𝑎 are non-empty. The proofs of this new
relation are all pairs of proofs of individual relations. Therefore, with
theunderstandingthattheexistentialquantifiercorrespondstoacoend,
and the Cartesian product of two sets corresponds to “pairs of proofs,”
we can define composition of profunctors using the following formula:
(𝑞 ∘ 𝑝) 𝑎 𝑏 = ∫
𝑐
𝑝 𝑐 𝑎 × 𝑞 𝑏 𝑐
Here’s the equivalent Haskell definition from
Data.Profunctor.Composition, after some renaming:
393data Procompose q p a b where
Procompose :: q a c -> p c b -> Procompose q p a b
Thisisusinggeneralizedalgebraicdatatype,orgadt syntax,inwhicha
free type variable (here c) is automatically existentially quantified. The
(uncurried) data constructor Procompose is thus equivalent to:
exists c. (q a c, p c b)
The unit of so defined composition is the hom-functor — this immedi-
ately follows from the Ninja Yoneda lemma. It makes sense, therefore,
to ask the question if there is a category in which profunctors serve as
morphisms.Theanswerispositive,withthecaveatthatbothassociativ-
ityandidentitylawsforprofunctorcompositionholdonlyuptonatural
isomorphism. Such a category, where laws are valid up to isomorphism,
is called a bicategory (which is more general than a 𝟐-category). So we
have a bicategory 𝐏𝐫𝐨𝐟, in which objects are categories, morphisms are
profunctors, and morphisms between morphisms (a.k.a., two-cells) are
natural transformations. In fact, one can go even further, because be-
side profunctors, we also have regular functors as morphisms between
categories. A category which has two types of morphisms is called a
double category.
Profunctors play an important role in the Haskell lens library and
in the arrow library.
39427
Kan Extensions
So far we’ve been mostly working with a single category or a pair
of categories. In some cases that was a little too constraining.
For instance, when defining a limit
in a category 𝐂, we introduced an index
category𝐈asthetemplateforthepattern
that would form the basis for our cones.
It would have made sense to introduce
another category, a trivial one, to serve
as a template for the apex of the cone.
Instead we used the constant functor Δ𝑐
from 𝐈 to 𝐂.
It’s time to fix this awkwardness. Let’s define a limit using three
categories. Let’s start with the functor 𝐷 from the index category 𝐈 to
𝐂. This is the functor that selects the base of the cone — the diagram
functor.
395The new addition is the category 𝟏 that contains a single object (and
a single identity morphism). There is only one possible functor 𝐾 from
𝐈 to this category. It maps all objects to the only object in 𝟏, and all
morphisms to the identity morphism. Any functor 𝐹 from 𝟏 to 𝐂 picks
a potential apex for our cone.
A cone is a natural transformation 𝜀 from 𝐹 ∘ 𝐾 to 𝐷. Notice that 𝐹 ∘ 𝐾
does exactly the same thing as our original Δ𝑐. The following diagram
shows this transformation.
We can now define a universal property that picks the “best” such func-
tor 𝐹. This 𝐹 will map 𝟏 to the object that is the limit of 𝐷 in 𝐂, and the
natural transformation 𝜀 from 𝐹 ∘𝐾 to 𝐷 will provide the corresponding
projections. This universal functor is called the right Kan extension of
𝐷 along 𝐾 and is denoted by Ran𝐾𝐷.
396Let’s formulate the universal property. Suppose we have another
cone—thatisanotherfunctor𝐹′ togetherwithanaturaltransformation
𝜀′ from 𝐹′ ∘ 𝐾 to 𝐷.
If the Kan extension 𝐹 = 𝑅𝑎𝑛𝐾𝐷 exists, there must be a unique natural
transformation 𝜎 from 𝐹′ to it, such that 𝜀′ factorizes through 𝜀, that is:
𝜀′ = 𝜀 . (𝜎 ∘ 𝐾)
Here, 𝜎 ∘ 𝐾 is the horizontal composition of two natural transforma-
tions (one of them being the identity natural transformation on 𝐾). This
transformation is then vertically composed with 𝜀.
397In components, when acting on an object 𝑖 in 𝐈, we get:
𝜀′
𝑖 = 𝜀𝑖 ∘ 𝜎𝐾 𝑖
In our case, 𝜎 has only one component corresponding to the single ob-
ject of 𝟏. So, indeed, this is the unique morphism from the apex of the
cone defined by 𝐹′ to the apex of the universal cone defined by Ran𝐾𝐷.
The commuting conditions are exactly the ones required by the defini-
tion of a limit.
But, importantly, we are free to replace the trivial category 𝟏 with
an arbitrary category 𝐀, and the definition of the right Kan extension
remains valid.
## 27.1 Right Kan Extension
The right Kan extension of the functor 𝐷 ∷ 𝐈 → 𝐂 along the functor
𝐾 ∷ 𝐈 → 𝐀 is a functor 𝐹 ∷ 𝐀 → 𝐂 (denoted Ran𝐾𝐷) together with a
natural transformation
𝜀 ∷ 𝐹 ∘ 𝐾 → 𝐷
such that for any other functor 𝐹′ ∷ 𝐀 → 𝐂 and a natural transforma-
tion
𝜀′ ∷ 𝐹′ ∘ 𝐾 → 𝐷
there is a unique natural transformation
𝜎 ∷ 𝐹′ → 𝐹
that factorizes 𝜀′:
𝜀′ = 𝜀 . (𝜎 ∘ 𝐾)
This is quite a mouthful, but it can be visualized in this nice diagram:
398An interesting way of looking at this is to notice that, in a sense, the
Kan extension acts like the inverse of “functor multiplication.” Some
authors go as far as use the notation 𝐷/𝐾 for Ran𝐾𝐷. Indeed, in this
notation, the definition of 𝜀, which is also called the counit of the right
Kan extension, looks like simple cancellation:
𝜀 ∷ 𝐷/𝐾 ∘ 𝐾 → 𝐷
There is another interpretation of Kan extensions. Consider that the
functor 𝐾 embeds the category 𝐈 inside 𝐀. In the simplest case 𝐈 could
just be a subcategory of 𝐀. We have a functor 𝐷 that maps 𝐈 to 𝐂. Can
we extend 𝐷 to a functor 𝐹 that is defined on the whole of 𝐀? Ideally,
such an extension would make the composition 𝐹 ∘ 𝐾 be isomorphic to
𝐷. In other words, 𝐹 would be extending the domain of 𝐷 to 𝐀. But a
full-blown isomorphism is usually too much to ask, and we can do with
just half of it, namely a one-way natural transformation 𝜀 from 𝐹 ∘𝐾 to
𝐷. (The left Kan extension picks the other direction.)
399Of course, the embedding picture breaks down when the functor 𝐾 is
not injective on objects or not faithful on hom-sets, as in the example
of the limit. In that case, the Kan extension tries its best to extrapolate
the lost information.
## 27.2 Kan Extension as Adjunction
Now suppose that the right Kan extension exists for any 𝐷 (and a fixed
𝐾). In that case Ran𝐾− (with the dash replacing 𝐷) is a functor from the
functor category [𝐈,𝐂] to the functor category [𝐀,𝐂]. It turns out that
this functor is the right adjoint to the precomposition functor −∘𝐾. The
latter maps functors in [𝐀,𝐂] to functors in [𝐈,𝐂]. The adjunction is:
[𝐈,𝐂](𝐹′ ∘ 𝐾,𝐷) ≅ [𝐀,𝐂](𝐹′,Ran𝐾𝐷)
It is just a restatement of the fact that to every natural transformation
we called 𝜀′ corresponds a unique natural transformation we called 𝜎.
400Furthermore, if we chose the category 𝐈 to be the same as 𝐂, we can
substitute the identity functor 𝐼𝐂 for 𝐷. We get the following identity:
[𝐂,𝐂](𝐹′ ∘ 𝐾,𝐼𝐂) ≅ [𝐀,𝐂](𝐹′,Ran𝐾𝐼𝐂)
We can now chose 𝐹′ to be the same as Ran𝐾𝐼𝐂. In that case the right
handsidecontainstheidentitynaturaltransformationand,correspond-
ingtoit,thelefthandsidegivesusthefollowingnaturaltransformation:
𝜀 ∷ Ran𝐾𝐼𝐂 ∘ 𝐾 → 𝐼𝐂
This looks very much like the counit of an adjunction:
Ran𝐾𝐼𝐂 ⊣ 𝐾
Indeed, the right Kan extension of the identity functor along a functor
𝐾 can be used to calculate the left adjoint of 𝐾. For that, one more con-
dition is necessary: the right Kan extension must be preserved by the
functor 𝐾. The preservation of the extension means that, if we calculate
the Kan extension of the functor precomposed with 𝐾, we should get
401the same result as precomposing the original Kan extension with 𝐾. In
our case, this condition simplifies to:
𝐾 ∘ Ran𝐾𝐼𝐂 ≅ Ran𝐾𝐾
Notice that, using the division-by-𝐾 notation, the adjunction can be
written as:
𝐼/𝐾 ⊣ 𝐾
which confirms our intuition that an adjunction describes some kind of
an inverse. The preservation condition becomes:
𝐾 ∘ 𝐼/𝐾 ≅ 𝐾/𝐾
The right Kan extension of a functor along itself, 𝐾/𝐾, is called a coden-
sity monad.
The adjunction formula is an important result because, as we’ll see
soon, we can calculate Kan extensions using ends (coends), thus giving
us practical means of finding right (and left) adjoints.
## 27.3 Left Kan Extension
There is a dual construction that gives us the left Kan extension. To
build some intuition, we’ll can start with the definition of a colimit and
restructureittousethesingletoncategory𝟏.Webuildacoconebyusing
the functor 𝐷 ∷ 𝐈 → 𝐂 to form its base, and the functor 𝐹 ∷ 𝟏 → 𝐂 to
select its apex.
402The sides of the cocone, the injections, are components of a natural
transformation 𝜂 from 𝐷 to 𝐹 ∘ 𝐾.
The colimit is the universal cocone. So for any other functor 𝐹′ and a
natural transformation
𝜂′ ∷ 𝐷 → 𝐹′ ∘ 𝐾
there is a unique natural transformation 𝜎 from 𝐹 to 𝐹′
403such that:
𝜂′ = (𝜎 ∘ 𝐾) . 𝜂
This is illustrated in the following diagram:
Replacingthesingletoncategory𝟏with𝐀,thisdefinitionnaturallygen-
eralized to the definition of the left Kan extension, denoted by Lan𝐾𝐷.
404The natural transformation:
𝜂 ∷ 𝐷 → Lan𝐾𝐷 ∘ 𝐾
is called the unit of the left Kan extension.
As before, we can recast the one-to-one correspondence between
natural transformations:
𝜂′ = (𝜎 ∘ 𝐾) . 𝜂
in terms of the adjunction:
[𝐀,𝐂](Lan𝐾𝐷,𝐹′) ≅ [𝐈,𝐂](𝐷,𝐹′ ∘ 𝐾)
In other words, the left Kan extension is the left adjoint, and the right
Kan extension is the right adjoint of the postcomposition with 𝐾.
JustliketherightKanextensionoftheidentityfunctorcouldbeused
to calculate the left adjoint of 𝐾, the left Kan extension of the identity
functor turns out to be the right adjoint of 𝐾 (with 𝜂 being the unit of
the adjunction):
𝐾 ⊣ Lan𝐾𝐼𝐂
Combining the two results, we get:
Ran𝐾𝐼𝐂 ⊣ 𝐾 ⊣ Lan𝐾𝐼𝐂
## 27.4 Kan Extensions as Ends
The real power of Kan extensions comes from the fact that they can
be calculated using ends (and coends). For simplicity, we’ll restrict our
attentiontothecasewherethetargetcategory𝐂is𝐒𝐞𝐭,buttheformulas
can be extended to any category.
405Let’s revisit the idea that a Kan extension can be used to extend the
action of a functor outside of its original domain. Suppose that 𝐾 em-
beds 𝐈 inside 𝐀. Functor 𝐷 maps 𝐈 to 𝐒𝐞𝐭. We could just say that for any
object 𝑎 in the image of 𝐾, that is 𝑎 = 𝐾 𝑖, the extended functor maps 𝑎
to 𝐷 𝑖. The problem is, what to do with those objects in 𝐀 that are out-
side of the image of 𝐾? The idea is that every such object is potentially
connected through lots of morphisms to every object in the image of 𝐾.
A functor must preserve these morphisms. The totality of morphisms
from an object 𝑎 to the image of 𝐾 is characterized by the hom-functor:
𝐀(𝑎,𝐾 −)
Notice that this hom-functor is a composition of two functors:
𝐀(𝑎,𝐾 −) = 𝐀(𝑎,−) ∘ 𝐾
The right Kan extension is the right adjoint of functor composition:
[𝐈,𝐒𝐞𝐭](𝐹′ ∘ 𝐾,𝐷) ≅ [𝐀,𝐒𝐞𝐭](𝐹′,Ran𝐾𝐷)
Let’s see what happens when we replace 𝐹′ with the hom functor:
[𝐈,𝐒𝐞𝐭](𝐀(𝑎,−) ∘ 𝐾,𝐷) ≅ [𝐀,𝐒𝐞𝐭](𝐀(𝑎,−),Ran𝐾𝐷)
406and then inline the composition:
[𝐈,𝐒𝐞𝐭](𝐀(𝑎,𝐾 −),𝐷) ≅ [𝐀,𝐒𝐞𝐭](𝐀(𝑎,−),Ran𝐾𝐷)
The right hand side can be reduced using the Yoneda lemma:
[𝐈,𝐒𝐞𝐭](𝐀(𝑎,𝐾 −),𝐷) ≅ Ran𝐾𝐷 𝑎
We can now rewrite the set of natural transformations as the end to get
this very convenient formula for the right Kan extension:
Ran𝐾𝐷 𝑎 ≅ ∫
𝑖
𝐒𝐞𝐭(𝐀(𝑎,𝐾 𝑖),𝐷 𝑖)
There is an analogous formula for the left Kan extension in terms of a
coend:
Lan𝐾𝐷 𝑎 = ∫
𝑖
𝐀(𝐾 𝑖,𝑎) × 𝐷 𝑖
To see that this is the case, we’ll show that this is indeed the left adjoint
to functor composition:
[𝐀,𝐒𝐞𝐭](Lan𝐾𝐷,𝐹′) ≅ [𝐈,𝐒𝐞𝐭](𝐷,𝐹′ ∘ 𝐾)
Let’s substitute our formula in the left hand side:
[𝐀,𝐒𝐞𝐭](∫
𝑖
𝐀(𝐾 𝑖,−) × 𝐷 𝑖,𝐹′)
This is a set of natural transformations, so it can be rewritten as an end:
∫
𝑎
𝐒𝐞𝐭(∫
𝑖
𝐀(𝐾 𝑖,𝑎) × 𝐷 𝑖,𝐹′ 𝑎)
407Using the continuity of the hom-functor, we can replace the coend with
the end:
∫
𝑎
∫
𝑖
𝐒𝐞𝐭(𝐀(𝐾 𝑖,𝑎) × 𝐷 𝑖,𝐹′ 𝑎)
We can use the product-exponential adjunction:
∫
𝑎
∫
𝑖
𝐒𝐞𝐭(𝐀(𝐾 𝑖,𝑎), (𝐹′ 𝑎)𝐷 𝑖)
The exponential is isomorphic to the corresponding hom-set:
∫
𝑎
∫
𝑖
𝐒𝐞𝐭(𝐀(𝐾 𝑖,𝑎), 𝐀(𝐷 𝑖,𝐹′ 𝑎))
There is a theorem called the Fubini theorem that allows us to swap the
two ends:
∫
𝑖
∫
𝑎
𝐒𝐞𝐭(𝐀(𝐾 𝑖,𝑎), 𝐴(𝐷 𝑖,𝐹′ 𝑎))
The inner end represents the set of natural transformations between
two functors, so we can use the Yoneda lemma:
∫
𝑖
𝐀(𝐷 𝑖,𝐹′ (𝐾 𝑖))
This is indeed the set of natural transformations that forms the right
hand side of the adjunction we set out to prove:
[𝐈,𝐒𝐞𝐭](𝐷,𝐹′ ∘ 𝐾)
These kinds of calculations using ends, coends, and the Yoneda lemma
are pretty typical for the “calculus” of ends.
40827.5 Kan Extensions in Haskell
The end/coend formulas for Kan extensions can be easily translated to
Haskell. Let’s start with the right extension:
Ran𝐾𝐷 𝑎 ≅ ∫
𝑖
𝐒𝐞𝐭(𝐀(𝑎,𝐾 𝑖),𝐷 𝑖)
We replace the end with the universal quantifier, and hom-sets with
function types:
newtype Ran k d a = Ran (forall i. (a -> k i) -> d i)
Looking at this definition, it’s clear that Ran must contain a value of
type a to which the function can be applied, and a natural transfor-
mation between the two functors k and d. For instance, suppose that
k is the tree functor, and d is the list functor, and you were given a
Ran Tree [] String. If you pass it a function:
f :: String -> Tree Int
you’ll get back a list of Int, and so on. The right Kan extension will use
your function to produce a tree and then repackage it into a list. For
instance, you may pass it a parser that generates a parsing tree from a
string, and you’ll get a list that corresponds to the depth-first traversal
of this tree.
The right Kan extension can be used to calculate the left adjoint of a
given functor by replacing the functor d with the identity functor. This
leads to the left adjoint of a functor k being represented by the set of
polymorphic functions of the type:
forall i. (a -> k i) -> i
409Suppose that k is the forgetful functor from the category of monoids.
Theuniversalquantifierthengoesoverallmonoids.Ofcourse,inHaskell
wecannotexpressmonoidallaws,butthefollowingisadecentapproxi-
mationoftheresultingfreefunctor(theforgetfulfunctork isanidentity
on objects):
type Lst a = forall i. Monoid i => (a -> i) -> i
As expected, it generates free monoids, or Haskell lists:
toLst :: [a] -> Lst a
toLst as = \f -> foldMap f as
fromLst :: Lst a -> [a]
fromLst f = f (\a -> [a])
The left Kan extension is a coend:
Lan𝐾𝐷 𝑎 = ∫
𝑖
𝐀(𝐾 𝑖,𝑎) × 𝐷 𝑖
so it translates to an existential quantifier. Symbolically:
Lan k d a = exists i. (k i -> a, d i)
This can be encoded in Haskell using gadts, or using a universally
quantified data constructor:
data Lan k d a = forall i. Lan (k i -> a) (d i)
The interpretation of this data structure is that it contains a function
that takes a container of some unspecified is and produces an a. It also
has a container of those is. Since you have no idea what is are, the only
410thing you can do with this data structure is to retrieve the container of
is, repack it into the container defined by the functor k using a natural
transformation, and call the function to obtain the a. For instance, if d
is a tree, and k is a list, you can serialize the tree, call the function with
the resulting list, and obtain an a.
The left Kan extension can be used to calculate the right adjoint of
a functor. We know that the right adjoint of the product functor is the
exponential, so let’s try to implement it using the Kan extension:
type Exp a b = Lan ((,) a) I b
This is indeed isomorphic to the function type, as witnessed by the fol-
lowing pair of functions:
toExp :: (a -> b) -> Exp a b
toExp f = Lan (f . fst) (I ())
fromExp :: Exp a b -> (a -> b)
fromExp (Lan f (I x)) = \a -> f (a, x)
Notice that, as described earlier in the general case, we performed the
following steps:
1. Retrieved the container of x (here, it’s just a trivial identity con-
tainer), and the function f.
2. Repackaged the container using the natural transformation be-
tween the identity functor and the pair functor.
3. Called the function f.
## 27.6 Free Functor
AninterestingapplicationofKanextensionsistheconstructionofafree
functor.It’sthesolutiontothefollowingpracticalproblem:supposeyou
411have a type constructor — that is a mapping of objects. Is it possible to
define a functor based on this type constructor? In other words, can we
defineamappingofmorphismsthatwouldextendthistypeconstructor
to a full-blown endofunctor?
The key observation is that a type constructor can be described as
a functor whose domain is a discrete category. A discrete category has
no morphisms other than the identity morphisms. Given a category 𝐂,
we can always construct a discrete category |𝐂| by simply discarding
all non-identity morphisms. A functor 𝐹 from |𝐂| to 𝐂 is then a simple
mapping of objects, or what we call a type constructor in Haskell. There
is also a canonical functor 𝐽 that injects |𝐂| into 𝐂: it’s an identity on
objects (and on identity morphisms). The left Kan extension of 𝐹 along
𝐽, if it exists, is then a functor for 𝐂 to 𝐂:
Lan𝐽𝐹 𝑎 = ∫
𝑖
𝐂(𝐽 𝑖,𝑎) × 𝐹 𝑖
It’s called a free functor based on 𝐹.
In Haskell, we would write it as:
data FreeF f a = forall i. FMap (i -> a) (f i)
Indeed, for any type constructor f, FreeF f is a functor:
instance Functor (FreeF f) where
fmap g (FMap h fi) = FMap (g . h) fi
As you can see, the free functor fakes the lifting of a function by record-
ing both the function and its argument. It accumulates the lifted func-
tions by recording their composition. Functor rules are automatically
412satisfied. This construction was used in a paper Freer Monads, More
Extensible Effects1.
Alternatively, we can use the right Kan extension for the same pur-
pose:
newtype FreeF f a = FreeF (forall i. (a -> i) -> f i)
It’s easy to check that this is indeed a functor:
instance Functor (FreeF f) where
fmap g (FreeF r) = FreeF (\bi -> r (bi . g))
1http://okmij.org/ftp/Haskell/extensible/more.pdf
41328 Enriched Categories
Acategory is small if its objects form a set. But we know that there
are things larger than sets. Famously, a set of all sets cannot be
formed within the standard set theory (the Zermelo-Fraenkel theory,
optionally augmented with the Axiom of Choice). So a category of all
setsmustbelarge.TherearemathematicaltrickslikeGrothendieckuni-
verses that can be used to define collections that go beyond sets. These
tricks let us talk about large categories.
A category is locally small if morphisms between any two objects
form a set. If they don’t form a set, we have to rethink a few definitions.
In particular, what does it mean to compose morphisms if we can’t even
pickthemfromaset?Thesolutionistobootstrapourselvesbyreplacing
hom-sets, which are objects in 𝐒𝐞𝐭, with objects from some other cate-
gory𝐕.Thedifferenceisthat,ingeneral,objectsdon’thaveelements,so
we are no longer allowed to talk about individual morphisms. We have
414to define all properties of an enriched category in terms of operations
that can be performed on hom-objects as a whole. In order to do that,
the category that provides hom-objects must have additional structure
— it must be a monoidal category. If we call this monoidal category 𝐕,
we can talk about a category 𝐂 enriched over 𝐕.
Besidesizereasons,wemightbeinterestedingeneralizinghom-sets
tosomethingthathasmorestructurethanmeresets.Forinstance,atra-
ditional category doesn’t have the notion of a distance between objects.
Two objects are either connected by morphisms or not. All objects that
are connected to a given object are its neighbors. Unlike in real life; in
a category, a friend of a friend of a friend is as close to me as my bosom
buddy. In a suitably enriched category,we can define distances between
objects.
Thereisonemoreverypracticalreasontogetsomeexperiencewith
enriched categories, and that’s because a very useful online source of
categoricalknowledge,thenLab1,iswrittenmostlyintermsofenriched
categories.
## 28.1 Why Monoidal Category?
When constructing an enriched category we have to keep in mind that
we should be able to recover the usual definitions when we replace the
monoidal category with 𝐒𝐞𝐭 and hom-objects with hom-sets. The best
way to accomplish this is to start with the usual definitions and keep
reformulating them in a point-free manner — that is, without naming
elements of sets.
Let’s start with the definition of composition. Normally, it takes a
pair of morphisms, one from 𝐂(𝑏,𝑐) and one from 𝐂(𝑎,𝑏) and maps it
1https://ncatlab.org/
415to a morphism from 𝐂(𝑎,𝑐). In other words it’s a mapping:
𝐂(𝑏,𝑐) × 𝐂(𝑎,𝑏) → 𝐂(𝑎,𝑐)
This is a function between sets — one of them being the Cartesian prod-
uctoftwohom-sets.Thisformulacanbeeasilygeneralizedbyreplacing
Cartesian product with something more general. A categorical product
would work, but we can go even further and use a completely general
tensor product.
Next come the identity morphisms. Instead of picking individual
elements from hom-sets, we can define them using functions from the
singleton set 𝟏:
𝑗𝑎 ∷ 𝟏 → 𝐂(𝑎,𝑎)
Again, we could replace the singleton set with the terminal object, but
we can go even further by replacing it with the unit 𝑖 of the tensor
product.
As you can see, objects taken from some monoidal category 𝐕 are
good candidates for hom-set replacement.
## 28.2 Monoidal Category
We’ve talked about monoidal categories before, but it’s worth restating
the definition. A monoidal category defines a tensor product that is a
bifunctor:
⊗ ∷ 𝐕 × 𝐕 → 𝐕
We want the tensor product to be associative, but it’s enough to satisfy
associativity up to natural isomorphism. This isomorphism is called the
associator. Its components are:
𝛼𝑎 𝑏 𝑐 ∷ (𝑎 ⊗ 𝑏) ⊗ 𝑐 → 𝑎 ⊗ (𝑏 ⊗ 𝑐)
416It must be natural in all three arguments.
A monoidal category must also define a special unit object 𝑖 that
serves as the unit of the tensor product; again, up to natural isomor-
phism. The two isomorphisms are called, respectively, the left and the
right unitor, and their components are:
𝜆𝑎 ∷ 𝑖 ⊗ 𝑎 → 𝑎
𝜌𝑎 ∷ 𝑎 ⊗ 𝑖 → 𝑎
The associator and the unitors must satisfy coherence conditions:
((𝑎 ⊗ 𝑏) ⊗ 𝑐) ⊗ 𝑑 (𝑎 ⊗ (𝑏 ⊗ 𝑐)) ⊗ 𝑑
(𝑎 ⊗ 𝑏) ⊗ (𝑐 ⊗ 𝑑) 𝑎 ⊗ ((𝑏 ⊗ 𝑐) ⊗ 𝑑)
𝑎 ⊗ (𝑏 ⊗ (𝑐 ⊗ 𝑑))
𝛼(𝑎⊗𝑏)𝑐𝑑
𝛼𝑎𝑏𝑐⊗id𝑑
𝛼𝑎(𝑏⊗𝑐)𝑑
𝛼𝑎𝑏(𝑐⊗𝑑)
id𝑎⊗𝛼𝑏𝑐𝑑
(𝑎 ⊗ 𝑖) ⊗ 𝑏 𝑎 ⊗ (𝑖 ⊗ 𝑏)
𝑎 ⊗ 𝑏
𝜌𝑎⊗id𝑏
𝛼𝑎𝑖𝑏
id𝑎⊗𝜆𝑏
A monoidal category is called symmetric if there is a natural isomor-
phism with components:
𝛾𝑎 𝑏 ∷ 𝑎 ⊗ 𝑏 → 𝑏 ⊗ 𝑎
417whose “square is one”:
𝛾𝑏 𝑎 ∘ 𝛾𝑎 𝑏 = id𝑎⊗𝑏
and which is consistent with the monoidal structure.
An interesting thing about monoidal categories is that you may be
able to define the internal hom (the function object) as the right adjoint
to the tensor product. You may recall that the standard definition of the
function object, or the exponential, was through the right adjoint to the
categorical product. A category in which such an object existed for any
pair of objects was called Cartesian closed. Here is the adjunction that
defines the internal hom in a monoidal category:
𝐕(𝑎 ⊗ 𝑏,𝑐) ∼ 𝐕(𝑎,[𝑏,𝑐])
Following G. M. Kelly2, I’m using the notation [𝑏,𝑐] for the internal
hom. The counit of this adjunction is the natural transformation whose
components are called evaluation morphisms:
𝜀𝑎 𝑏 ∷ ([𝑎,𝑏] ⊗ 𝑎) → 𝑏
Notice that, if the tensor product is not symmetric, we may define an-
other internal hom, denoted by [[𝑎,𝑐]], using the following adjunction:
𝐕(𝑎 ⊗ 𝑏,𝑐) ∼ 𝐕(𝑏,[[𝑎,𝑐]])
Amonoidal category in which both aredefined is called biclosed. An ex-
ample of a category that is not biclosed is the category of endofunctors
in 𝐒𝐞𝐭, with functor composition serving as tensor product. That’s the
category we used to define monads.
2http://www.tac.mta.ca/tac/reprints/articles/10/tr10.pdf
41828.3 Enriched Category
A category 𝐂 enriched over a monoidal category 𝐕 replaces hom-sets
with hom-objects. To every pair of objects 𝑎 and 𝑏 in 𝐂 we associate
an object 𝐂(𝑎,𝑏) in 𝐕. We use the same notation for hom-objects as
we used for hom-sets, with the understanding that they don’t contain
morphisms. On the other hand, 𝐕 is a regular (non-enriched) category
with hom-sets and morphisms. So we are not entirely rid of sets — we
just swept them under the rug.
Since we cannot talk about individual morphisms in 𝐂, composition
of morphisms is replaced by a family of morphisms in 𝐕:
∘ ∷ 𝐂(𝑏,𝑐) ⊗ 𝐂(𝑎,𝑏) → 𝐂(𝑎,𝑐)
Similarly, identity morphisms are replaced by a family of morphisms in
𝐕:
𝑗𝑎 ∷ 𝑖 → 𝐂(𝑎,𝑎)
where 𝑖 is the tensor unit in 𝐕.
419Associativity of composition is defined in terms of the associator in 𝐕:
(𝐂(𝑐,𝑑) ⊗ 𝐂(𝑏,𝑐)) ⊗ 𝐂(𝑎,𝑏) 𝐂(𝑏,𝑑) ⊗ 𝐂(𝑎,𝑏)
𝐂(𝑎,𝑑)
𝐂(𝑐,𝑑) ⊗ (𝐂(𝑏,𝑐) ⊗ 𝐂(𝑎,𝑏)) 𝐂(𝑐,𝑑) ⊗ 𝐂(𝑎,𝑐)
∘⊗id
𝛼
∘
id⊗∘
∘
Unit laws are likewise expressed in terms of unitors:
𝐂(𝑎,𝑏) ⊗ 𝑖 𝐂(𝑎,𝑏) ⊗ 𝐂(𝑎,𝑎)
𝐂(𝑎,𝑏)
id⊗𝑗𝑎
𝜌
∘
𝑖 ⊗ 𝐂(𝑎,𝑏) 𝐂(𝑏,𝑏) ⊗ 𝐂(𝑎,𝑏)
𝐂(𝑎,𝑏)
𝑗𝑏⊗id
𝜆
∘
42028.4 Preorders
A preorder is defined as a thin category, one in which every hom-set
is either empty or a singleton. We interpret a non-empty set 𝐂(𝑎,𝑏) as
the proof that 𝑎 is less than or equal to 𝑏. Such a category can be inter-
preted as enriched over a very simple monoidal category that contains
just two objects, 0 and 1 (sometimes called 𝐹𝑎𝑙𝑠𝑒 and 𝑇𝑟𝑢𝑒). Besides the
mandatory identity morphisms, this category has a single morphism
going from 0 to 1, let’s call it 0 → 1. A simple monoidal structure can
be established in it, with the tensor product modeling the simple arith-
metic of 0 and 1 (i.e., the only non-zero product is 1 ⊗ 1). The identity
object in this category is 1. This is a strict monoidal category, that is,
the associator and the unitors are identity morphisms.
Since in a preorder the-hom set is either empty or a singleton, we
can easily replace it with a hom-object from our tiny category. The en-
riched preorder 𝐂 has a hom-object 𝐂(𝑎,𝑏) for any pair of objects 𝑎 and
𝑏. If 𝑎 is less than or equal to 𝑏, this object is 1; otherwise it’s 0.
Let’s have a look at composition. The tensor product of any two
objects is 0, unless both of them are 1, in which case it’s 1. If it’s 0, then
we have two options for the composition morphism: it could be either
id0 or 0 → 1. But if it’s 1, then the only option is id1. Translating this
back to relations, this says that if 𝑎 ⩽ 𝑏 and 𝑏 ⩽ 𝑐 then 𝑎 ⩽ 𝑐, which is
exactly the transitivity law we need.
What about the identity? It’s a morphism from 1 to 𝐂(𝑎,𝑎). There is
only one morphism going from 1, and that’s the identity id1, so 𝐂(𝑎,𝑎)
must be 1. It means that 𝑎 ⩽ 𝑎, which is the reflexivity law for a pre-
order. So both transitivity and reflexivity are automatically enforced, if
we implement a preorder as an enriched category.
42128.5 Metric Spaces
An interesting example is due to William Lawvere3. He noticed that
metric spaces can be defined using enriched categories. A metric space
defines a distance between any two objects. This distance is a non-
negative real number. It’s convenient to include infinity as a possible
value. If the distance is infinite, there is no way of getting from the
starting object to the target object.
There are some obvious properties that have to be satisfied by dis-
tances. One of them is that the distance from an object to itself must be
zero. The other is the triangle inequality: the direct distance is no larger
than the sum of distances with intermediate stops. We don’t require the
distance to be symmetric, which might seem weird at first but, as Law-
vere explained, you can imagine that in one direction you’re walking
uphill, while in the other you’re going downhill. In any case, symmetry
may be imposed later as an additional constraint.
So how can a metric space be cast into a categorical language? We
have to construct a category in which hom-objects are distances. Mind
you, distances are not morphisms but hom-objects. How can a hom-
object be a number? Only if we can construct a monoidal category 𝐕
in which these numbers are objects. Non-negative real numbers (plus
infinity) form a total order, so they can be treated as a thin category. A
morphismbetweentwosuchnumbers𝑥 and𝑦 existsifandonlyif𝑥 ⩾ 𝑦
(note: this is the opposite direction to the one traditionally used in the
definition of a preorder). The monoidal structure is given by addition,
with zero serving as the unit object. In other words, the tensor product
of two numbers is their sum.
3http://www.tac.mta.ca/tac/reprints/articles/1/tr1.pdf
422A metric space is a category enriched over such monoidal category.
A hom-object 𝐂(𝑎,𝑏) from object 𝑎 to 𝑏 is a non-negative (possibly in-
finite) number that we will call the distance from 𝑎 to 𝑏. Let’s see what
we get for identity and composition in such a category.
By our definitions, a morphism from the tensorial unit, which is the
number zero, to a hom-object 𝐂(𝑎,𝑎) is the relation:
0 ⩾ 𝐂(𝑎,𝑎)
Since 𝐂(𝑎,𝑎) is a non-negative number, this condition tells us that the
distance from 𝑎 to 𝑎 is always zero. Check!
Now let’s talk about composition. We start with the tensor prod-
uct of two abutting hom-objects, 𝐂(𝑏,𝑐)⊗𝐂(𝑎,𝑏). We have defined the
tensor product as the sum of the two distances. Composition is a mor-
phism in 𝐕 from this product to 𝐂(𝑎,𝑐). A morphism in 𝐕 is defined as
the greater-or-equal relation. In other words, the sum of distances from
𝑎 to 𝑏 and from 𝑏 to 𝑐 is greater than or equal to the distance from 𝑎 to
𝑐. But that’s just the standard triangle inequality. Check!
By re-casting the metric space in terms of an enriched category, we
get the triangle inequality and the zero self-distance “for free.”
## 28.6 Enriched Functors
The definition of a functor involves the mapping of morphisms. In the
enriched setting, we don’t have the notion of individual morphisms, so
we have to deal with hom-objects in bulk. Hom-objects are objects in
a monoidal category 𝐕, and we have morphisms between them at our
disposal. It therefore makes sense to define enriched functors between
categories when they are enriched over the same monoidal category 𝐕.
423We can then use morphisms in 𝐕 to map the hom-objects between two
enriched categories.
Anenrichedfunctor 𝐹 betweentwocategories𝐂and𝐃,besidesmap-
ping objects to objects, also assigns, to every pair of objects in 𝐂, a mor-
phism in 𝐕:
𝐹𝑎 𝑏 ∷ 𝐂(𝑎,𝑏) → 𝐃(𝐹 𝑎,𝐹 𝑏)
A functor is a structure-preserving mapping. For regular functors it
meant preserving composition and identity. In the enriched setting, the
preservation of composition means that the following diagram com-
mute:
𝐂(𝑏,𝑐) ⊗ 𝐂(𝑎,𝑏) 𝐂(𝑎,𝑐)
𝐃(𝐹 𝑏,𝐹 𝑐) ⊗ 𝐃(𝐹 𝑎,𝐹 𝑏) 𝐃(𝐹 𝑎,𝐹 𝑐)
∘
𝐹𝑏𝑐⊗𝐹𝑎𝑏 𝐹𝑎𝑐
∘
The preservation of identity is replaced by the preservation of the mor-
phisms in 𝐕 that “select” the identity:
𝑖
𝐂(𝑎,𝑎) 𝐃(𝐹 𝑎,𝐹 𝑎)
𝑗𝑎 𝑗𝐹 𝑎
𝐹𝑎𝑎
## 28.7 Self Enrichment
A closed symmetric monoidal category may be self-enriched by replac-
inghom-setswithinternalhoms(seethedefinitionabove).Tomakethis
424work,wehavetodefinethecompositionlawforinternalhoms.Inother
words, we have to implement a morphism with the following signature:
[𝑏,𝑐] ⊗ [𝑎,𝑏] → [𝑎,𝑐]
This is not much different from any other programming task, except
that, in category theory, we usually use point free implementations. We
start by specifying the set whose element it’s supposed to be. In this
case, it’s a member of the hom-set:
𝐕([𝑏,𝑐] ⊗ [𝑎,𝑏],[𝑎,𝑐])
This hom-set is isomorphic to:
𝐕(([𝑏,𝑐] ⊗ [𝑎,𝑏]) ⊗ 𝑎,𝑐)
I just used the adjunction that defined the internal hom [𝑎,𝑐]. If we can
build a morphism in this new set, the adjunction will point us at the
morphism in the original set, which we can then use as composition.
We construct this morphism by composing several morphisms that are
at our disposal. To begin with, we can use the associator 𝛼[𝑏,𝑐] [𝑎,𝑏] 𝑎 to
reassociate the expression on the left:
([𝑏,𝑐] ⊗ [𝑎,𝑏]) ⊗ 𝑎 → [𝑏,𝑐] ⊗ ([𝑎,𝑏] ⊗ 𝑎)
We can follow it with the co-unit of the adjunction 𝜀𝑎 𝑏:
[𝑏,𝑐] ⊗ ([𝑎,𝑏] ⊗ 𝑎) → [𝑏,𝑐] ⊗ 𝑏
And use the counit 𝜀𝑏 𝑐 again to get to 𝑐. We have thus constructed a
morphism:
𝜀𝑏 𝑐 . (id[𝑏,𝑐] ⊗ 𝜀𝑎 𝑏) . 𝛼[𝑏,𝑐] [𝑎,𝑏] 𝑎
425that is an element of the hom-set:
𝐕(([𝑏,𝑐] ⊗ [𝑎,𝑏]) ⊗ 𝑎,𝑐)
The adjunction will give us the composition law we were looking for.
Similarly, the identity:
𝑗𝑎 ∷ 𝑖 → [𝑎,𝑎]
is a member of the following hom-set:
𝐕(𝑖,[𝑎,𝑎])
which is isomorphic, through adjunction, to:
𝐕(𝑖 ⊗ 𝑎,𝑎)
We know that this hom-set contains the left identity 𝜆𝑎. We can define
𝑗𝑎 as its image under the adjunction.
Apracticalexampleofself-enrichmentisthecategory𝐒𝐞𝐭thatserves
as the prototype for types in programming languages. We’ve seen be-
forethat it’s a closedmonoidal categorywithrespecttoCartesian prod-
uct. In 𝐒𝐞𝐭, the hom-set between any two sets is itself a set, so it’s an
object in 𝐒𝐞𝐭. We know that it’s isomorphic to the exponential set, so
the external and the internal homs are equivalent. Now we also know
that, through self-enrichment, we can use the exponential set as the
hom-object and express composition in terms of Cartesian products of
exponential objects.
## 28.8 Relation to 𝟐-Categories
I talked about 𝟐-categories in the context of 𝐂𝐚𝐭, the category of (small)
categories. The morphisms between categories are functors, but there
426is an additional structure: natural transformations between functors.
In a 𝟐-category, the objects are often called zero-cells; morphisms, 1-
cells; and morphisms between morphisms, 2-cells. In 𝐂𝐚𝐭 the 0-cells are
categories, 1-cells are functors, and 2-cells are natural transformations.
But notice that functors between two categories form a category
too; so, in 𝐂𝐚𝐭, we really have a hom-category rather than a hom-set. It
turns out that, just like 𝐒𝐞𝐭 can be treated as a category enriched over
𝐒𝐞𝐭, 𝐂𝐚𝐭 can be treated as a category enriched over 𝐂𝐚𝐭. Even more gen-
erally,justlikeeverycategorycanbetreatedasenrichedover𝐒𝐞𝐭,every
𝟐-category can be considered enriched over 𝐂𝐚𝐭.
42729
Topoi
Irealize that we mightbegettingawayfromprogramminganddiv-
ing into hard-core math. But you never know what the next big rev-
olution in programming might bring and what kind of math might be
necessary to understand it. There are some very interesting ideas go-
ing around, like functional reactive programming with its continuous
time, the extension of Haskell’s type system with dependent types, or
the exploration on homotopy type theory in programming.
So far I’ve been casually identifying types with sets of values. This
is not strictly correct, because such approach doesn’t take into account
the fact that, in programming, we compute values, and the computation
is a process that takes time and, in extreme cases, might not terminate.
Divergent computations are part of every Turing-complete language.
There are also foundational reasons why set theory might not be
the best fit as the basis for computer science or even math itself. A good
analogy is that of set theory being the assembly language that is tied
428to a particular architecture. If you want to run your math on different
architectures, you have to use more general tools.
One possibility is to use spaces in place of sets. Spaces come with
more structure, and may be defined without recourse to sets. One thing
usually associated with spaces is topology, which is necessary to define
things like continuity. And the conventional approach to topology is,
you guessed it, through set theory. In particular, the notion of a subset
is central to topology. Not surprisingly, category theorists generalized
this idea to categories other than 𝐒𝐞𝐭. The type of category that has just
the right properties to serve as a replacement for set theory is called a
topos (plural: topoi), and it provides, among other things, a generalized
notion of a subset.
## 29.1 Subobject Classifier
Let’sstartbytryingtoexpresstheideaofasubsetusingfunctionsrather
than elements. Any function 𝑓 from some set 𝑎 to 𝑏 defines a subset of
𝑏–that of the image of 𝑎 under 𝑓. But there are many functions that
define the same subset. We need to be more specific. To begin with, we
mightfocusonfunctionsthatareinjective—onesthatdon’tsmushmul-
tiple elements into one. Injective functions “inject” one set into another.
For finite sets, you may visualize injective functions as parallel arrows
connecting elements of one set to elements of another. Of course, the
firstsetcannotbelargerthanthesecondset,orthearrowswouldneces-
sarily converge. There is still some ambiguity left: there may be another
set 𝑎′ and another injective function 𝑓′ from that set to 𝑏 that picks the
same subset. But you can easily convince yourself that such a set would
have to be isomorphic to 𝑎. We can use this fact to define a subset as a
family of injective functions that are related by isomorphisms of their
429domains. More precisely, we say that two injective functions:
𝑓 ∷ 𝑎 → 𝑏
𝑓′ ∷ 𝑎′ → 𝑏
are equivalent if there is an isomorphism:
ℎ ∷ 𝑎 → 𝑎′
such that:
𝑓 = 𝑓′ . ℎ
Such a family of equivalent injections defines a subset of 𝑏.
This definition can be lifted to an arbitrary category if we replace injec-
tive functions with monomorphism. Just to remind you, a monomor-
phism 𝑚 from 𝑎 to 𝑏 is defined by its universal property. For any object
𝑐 and any pair of morphisms:
𝑔 ∷ 𝑐 → 𝑎
𝑔′ ∷ 𝑐 → 𝑎
430such that:
𝑚 . 𝑔 = 𝑚 . 𝑔′
it must be that 𝑔 = 𝑔′.
On sets, this definition is easier to understand if we consider what it
would mean for a function 𝑚 not to be a monomorphism. It would map
two different elements of 𝑎 to a single element of 𝑏. We could then find
two functions 𝑔 and 𝑔′ that differ only at those two elements. The post-
composition with 𝑚 would then mask this difference.
There is another way of defining a subset: using a single function called
the characteristic function. It’s a function 𝜒 from the set 𝑏 to a two-
element set Ω. One element of this set is designated as “true” and the
other as “false.” This function assigns “true” to those elements of 𝑏 that
are members of the subset, and “false” to those that aren’t.
431It remains to specify what it means to designate an element of Ω as
“true.” We can use the standard trick: use a function from a singleton
set to Ω. We’ll call this function 𝑡𝑟𝑢𝑒:
𝑡𝑟𝑢𝑒 ∷ 1 → Ω
These definitions can be combined in such a way that they not only
define what a subobject is, but also define the special object Ω without
talking about elements. The idea is that we want the morphism 𝑡𝑟𝑢𝑒 to
represent a “generic” subobject. In 𝐒𝐞𝐭, it picks a single-element subset
from a two-element set Ω. This is as generic as it gets. It’s clearly a
propersubset,becauseΩhasonemoreelementthat’snot inthatsubset.
In a more general setting, we define 𝑡𝑟𝑢𝑒 to be a monomorphism
fromtheterminalobjecttotheclassifyingobject Ω.Butwehavetodefine
theclassifyingobject.Weneedauniversalpropertythatlinksthisobject
to the characteristic function. It turns out that, in 𝐒𝐞𝐭, the pullback of
𝑡𝑟𝑢𝑒 along the characteristic function 𝜒 defines both the subset 𝑎 and
the injective function that embeds it in 𝑏. Here’s the pullback diagram:
432Let’s analyze this diagram. The pullback equation is:
𝑡𝑟𝑢𝑒 . 𝑢𝑛𝑖𝑡 = 𝜒 . 𝑓
The function 𝑡𝑟𝑢𝑒 . 𝑢𝑛𝑖𝑡 maps every element of 𝑎 to “true.” Therefore 𝑓
must map all elements of 𝑎 to those elements of 𝑏 for which 𝜒 is “true.”
These are, by definition, the elements of the subset that is specified by
the characteristic function 𝜒. So the image of 𝑓 is indeed the subset in
question. The universality of the pullback guarantees that 𝑓 is injective.
This pullback diagram can be used to define the classifying object
in categories other than 𝐒𝐞𝐭. Such a category must have a terminal ob-
ject, which will let us define the monomorphism 𝑡𝑟𝑢𝑒. It must also have
pullbacks — the actual requirement is that it must have all finite limits
(a pullback is an example of a finite limit). Under those assumptions, we
definetheclassifyingobjectΩbythepropertythat,foreverymonomor-
phism 𝑓 there is a unique morphism 𝜒 that completes the pullback dia-
gram.
Let’s analyze the last statement. When we construct a pullback, we
are given three objects Ω, 𝑏 and 1; and two morphisms, 𝑡𝑟𝑢𝑒 and 𝜒. The
existence of a pullback means that we can find the best such object 𝑎,
433equipped with two morphisms 𝑓 and 𝑢𝑛𝑖𝑡 (the latter is uniquely deter-
mined by the definition of the terminal object), that make the diagram
commute.
Here we are solving a different system of equations. We are solving
for Ω and 𝑡𝑟𝑢𝑒 while varying both 𝑎 and 𝑏. For a given 𝑎 and 𝑏 there
may or may not be a monomorphism 𝑓 ∷ 𝑎 → 𝑏. But if there is one,
we want it to be a pullback of some 𝜒. Moreover, we want this 𝜒 to be
uniquely determined by 𝑓.
We can’t say that there is a one-to-one correspondence between
monomorphisms 𝑓 and characteristic functions 𝜒, because a pullback
is only unique up to isomorphism. But remember our earlier definition
of a subset as a family of equivalent injections. We can generalize it by
defining a subobject of 𝑏 as a family of equivalent monomorphisms to
𝑏. This family of monomorphisms isinone-to-one correspondence with
the family of equivalent pullbacks of our diagram.
We can thus define a set of subobjects of 𝑏, 𝑆𝑢𝑏(𝑏), as a family of
monomorphisms, and see that it is isomorphic to the set of morphisms
from 𝑏 to Ω:
𝑆𝑢𝑏(𝑏) ≅ 𝐂(𝑏,Ω)
This happens to be a natural isomorphism of two functors. In other
words, 𝑆𝑢𝑏(−) is a representable (contravariant) functor whose repre-
sentation is the object Ω.
## 29.2 Topos
A topos is a category that:
1. Is Cartesian closed: It has all products, the terminal object, and
exponentials (defined as right adjoints to products),
4342. Has limits for all finite diagrams,
3. Has a subobject classifier Ω.
This set of properties makes a topos a shoe-in for 𝐒𝐞𝐭 in most appli-
cations. It also has additional properties that follow from its definition.
For instance, a topos has all finite colimits, including the initial object.
Itwouldbetemptingtodefinethesubobjectclassifierasacoproduct
(sum) of two copies of the terminal object –that’s what it is in 𝐒𝐞𝐭— but
we want to be more general than that. Topoi in which this is true are
called Boolean.
## 29.3 Topoi and Logic
In set theory, a characteristic function may be interpreted as defining a
property of the elements of a set — a predicate that is true for some ele-
ments and false for others. The predicate 𝑖𝑠𝐸𝑣𝑒𝑛 selects a subset of even
numbers from the set of natural numbers. In a topos, we can generalize
the idea of a predicate to be a morphism from object 𝑎 to Ω. This is why
Ω is sometimes called the truth object.
Predicates are the building blocks of logic. A topos contains all the
necessary instrumentation to study logic. It has products that corre-
spond to logical conjunctions (logical and), coproducts for disjunctions
(logical or), and exponentials for implications. All standard axioms of
logic hold in a topos except for the law of excluded middle (or, equiv-
alently, double negation elimination). That’s why the logic of a topos
corresponds to constructive or intuitionistic logic.
Intuitionistic logic has been steadily gaining ground, finding unex-
pected support from computer science. The classical notion of excluded
middle is based on the belief that there is absolute truth: Any state-
ment is either true or false or, as Ancient Romans would say, tertium
435non datur (there is no third option). But the only way we can know
whether something is true or false is if we can prove or disprove it. A
proof is a process, a computation — and we know that computations
take time and resources. In some cases, they may never terminate. It
doesn’t make sense to claim that a statement is true if we cannot prove
it in finite amount of time. A topos with its more nuanced truth object
provides a more general framework for modeling interesting logics.
## 29.4 Challenges
1. Show that the function 𝑓 that is the pullback of 𝑡𝑟𝑢𝑒 along the
characteristic function must be injective.
43630
Lawvere Theories
Nowadays you can’t talk about functional programming without
mentioning monads. But there is an alternative universe in which,
by chance, Eugenio Moggi turned his attention to Lawvere theories
rather than monads. Let’s explore that universe.
## 30.1 Universal Algebra
There are many ways of describing algebras at various levels of abstrac-
tion. We try to find a general language to describe things like monoids,
groups, or rings. At the simplest level, all these constructions define op-
erations on elements of a set, plus some laws that must be satisfied by
these operations. For instance, a monoid can be defined in terms of a bi-
nary operation that is associative. We also have a unit element and unit
laws. But with a little bit of imagination we can turn the unit element to
anullary operation— an operation thattakesno argumentsand returns
437a special element of the set. If we want to talk about groups, we add a
unary operator that takes an element and returns its inverse. There are
corresponding left and right inverse laws to go with it. A ring defines
two binary operators plus some more laws. And so on.
The big picture is that an algebra is defined by a set of 𝑛-ary oper-
ations for various values of 𝑛, and a set of equational identities. These
identities are all universally quantified. The associativity equation must
be satisfied for all possible combinations of three elements, and so on.
Incidentally, this eliminates fields from consideration, for the sim-
ple reason that zero (unit with respect to addition) has no inverse with
respect to multiplication. The inverse law for a field can’t be universally
quantified.
This definition of a universal algebra can be extended to categories
other than 𝐒𝐞𝐭, if we replace operations (functions) with morphisms. In-
stead of a set, we select an object 𝑎 (called a generic object). A unary
operation is just an endomorphism of 𝑎. But what about other arities
(arity is the number of arguments for a given operation)? A binary op-
eration (arity 2) can be defined as a morphism from the product 𝑎 × 𝑎
back to 𝑎. A general 𝑛-ary operation is a morphism from the 𝑛th power
of 𝑎 to 𝑎:
𝛼𝑛 ∷ 𝑎𝑛 → 𝑎
A nullary operation is a morphism from the terminal object (the zeroth
power of 𝑎). So all we need in order to define any algebra is a category
whose objects are powers of one special object 𝑎. The specific algebra is
encoded in the hom-sets of this category. This is a Lawvere theory in a
nutshell.
The derivation of Lawvere theories goes through many steps, so
here’s the roadmap:
1. Category of finite sets 𝐅𝐢𝐧𝐒𝐞𝐭.
4382. Its skeleton 𝐅.
3. Its opposite 𝐅𝑜𝑝.
4. Lawvere theory 𝐋: an object in the category 𝐋𝐚𝐰.
5. Model 𝑀 of a Lawvere category: an object in the category
𝐌𝐨𝐝(𝐋𝐚𝐰,𝐒𝐞𝐭).
## 30.2 Lawvere Theories
All Lawvere theories share a common backbone. All objects in a Law-
vere theory are generated from just one object using products (really,
just powers). But how do we define these products in a general cate-
gory? It turns out that we can define products using a mapping from
a simpler category. In fact this simpler category may define coprod-
ucts instead of products, and we’ll use a contravariant functor to embed
them in our target category. A contravariant functor turns coproducts
into products and injections to projections.
The natural choice for the backbone of a Lawvere category is the
category of finite sets, 𝐅𝐢𝐧𝐒𝐞𝐭. It contains the empty set ∅, a singleton
set 1, a two-element set 2, and so on. All objects in this category can be
439generated from the singleton set using coproducts (treating the empty
set as a special case of a nullary coproduct). For instance, a two-element
set is a sum of two singletons, 2 = 1 + 1, as expressed in Haskell:
type Two = Either () ()
However, even though it’s natural to think that there’s only one empty
set, there may be many distinct singleton sets. In particular, the set 1+∅
is different from the set ∅ + 1, and different from 1 — even though they
are all isomorphic. The coproduct in the category of sets is not associa-
tive. We can remedy that situation by building a category that identifies
all isomorphic sets. Such a category is called a skeleton. In other words,
the backbone of any Lawvere theory is the skeleton 𝐅 of 𝐅𝐢𝐧𝐒𝐞𝐭. The ob-
jects in this category can be identified with natural numbers (including
zero) that correspond to the element count in 𝐅𝐢𝐧𝐒𝐞𝐭. Coproduct plays
the role of addition. Morphisms in 𝐅 correspond to functions between
finite sets. For instance, there is a unique morphism from ∅ to 𝑛 (empty
set being the initial object), no morphisms from 𝑛 to ∅ (except ∅ → ∅),
𝑛 morphismsfrom1to𝑛 (theinjections),onemorphismfrom𝑛 to1,and
so on. Here, 𝑛 denotes an object in 𝐅 corresponding to all 𝑛-element sets
in 𝐅𝐢𝐧𝐒𝐞𝐭 that have been identified through isomorphisms.
Using the category 𝐅 we can formally define a Lawvere theory as a
category 𝐋 equipped with a special functor
𝐼𝐋 ∶∶ 𝐅𝑜𝑝 → 𝐋
This functor must be a bijection on objects and it must preserve finite
products (products in 𝐅𝑜𝑝 are the same as coproducts in 𝐅):
𝐼𝐋 (𝑚 × 𝑛) = 𝐼𝐋 𝑚 × 𝐼𝐋 𝑛
440Youmaysometimesseethisfunctorcharacterizedasidentity-on-objects,
which means that the objects in 𝐅 and 𝐋 are the same. We will therefore
use the same names for them — we’ll denote them by natural numbers.
Keep in mind though that objects in 𝐅 are not the same as sets (they are
classes of isomorphic sets).
Thehom-setsin𝐋are,ingeneral,richerthanthosein𝐅𝑜𝑝.Theymay
contain morphisms other than the ones corresponding to functions in
𝐅𝐢𝐧𝐒𝐞𝐭 (the latter are sometimes called basic product operations). Equa-
tional laws of a Lawvere theory are encoded in those morphisms.
The key observation is that the singleton set 1 in 𝐅 is mapped to
some object that we also call 1 in 𝐋, and all the other objects in 𝐋 are
automatically powers of this object. For instance, the two-element set 2
in 𝐅 is the coproduct 1 + 1, so it must be mapped to a product 1 × 1 (or
12) in 𝐋. In this sense, the category 𝐅 behaves like the logarithm of 𝐋.
Among morphisms in 𝐋 we have those transferred by the functor 𝐼𝐋
from 𝐅. They play structural role in 𝐋. In particular coproduct injections
𝑖𝑘 become product projections 𝑝𝑘. A useful intuition is to imagine the
projection:
𝑝𝑘 ∷ 1𝑛 → 1
as the prototype for a function of 𝑛 variables that ignores all but the 𝑘th
variable. Conversely, constant morphisms 𝑛 → 1 in 𝐅 become diagonal
morphisms 1 → 1𝑛 in 𝐋. They correspond to duplication of variables.
The interesting morphisms in 𝐋 are the ones that define 𝑛-ary op-
erations other than projections. It’s those morphisms that distinguish
one Lawvere theory from another. These are the multiplications, the
additions, the selections of unit elements, and so on, that define the al-
gebra.But to make 𝐋afullcategory,wealsoneedcompoundoperations
𝑛 → 𝑚 (or, equivalently, 1𝑛 → 1𝑚). Because of the simple structure
of the category, they turn out to be products of simpler morphisms of
441the type 𝑛 → 1. This is a generalization of the statement that a func-
tion that returns a product is a product of functions (or, as we’ve seen
earlier, that the hom-functor is continuous).
Lawvere theory 𝐋 is based on 𝐅𝑜𝑝, from which it inherits the “boring” morphisms that define the
products. It adds the “interesting” morphisms that describe the 𝑛-ary operations (dotted arrows).
Lawvere theories form a category 𝐋𝐚𝐰, in which morphisms are
functors that preserve finite products and commute with the functors 𝐼.
Given two such theories, (𝐋,𝐼𝐋) and (𝐋′,𝐼′
𝐋′), a morphism between them
is a functor 𝐹 ∷ 𝐋 → 𝐋′ such that:
𝐹 (𝑚 × 𝑛) = 𝐹 𝑚 × 𝐹 𝑛
𝐹 ∘ 𝐼𝐋 = 𝐼′
𝐋′
Morphisms between Lawveretheories encapsulate the idea of the inter-
pretation of one theory inside another. For instance, group multiplica-
tion may be interpreted as monoid multiplication if we ignore inverses.
The simplest trivial example of a Lawvere category is 𝐅𝑜𝑝 itself (cor-
responding to the choice of the identity functor for 𝐼𝐋). This Lawvere
theory that has no operations or laws happens to be the initial object in
𝐋𝐚𝐰.
442At this point it would be very helpful to present a non-trivial exam-
ple of a Lawvere theory, but it would be hard to explain it without first
understanding what models are.
## 30.3 Models of Lawvere Theories
The key to understand Lawvere theories is to realize that one such the-
orygeneralizesalotofindividualalgebrasthatsharethesamestructure.
For instance, the Lawvere theory of monoids describes the essence of
being a monoid. It must be valid for all monoids. A particular monoid
becomes a model of such a theory. A model is defined as a functor from
the Lawvere theory 𝐋 to the category of sets 𝐒𝐞𝐭. (There are generaliza-
tions of Lawvere theories that use other categories for models but here
I’ll just concentrate on 𝐒𝐞𝐭.) Since the structure of 𝐋 depends heavily
on products, we require that such a functor preserve finite products. A
model of 𝐋, also called the algebra over the Lawvere theory 𝐋, is there-
fore defined by a functor:
𝑀 ∷ 𝐋 → 𝐒𝐞𝐭
𝑀 (𝑎 × 𝑏) ≅ 𝑀 𝑎 × 𝑀 𝑏
Notice that we require the preservation of products only up to isomor-
phism. This is very important, because strict preservation of products
would eliminate most interesting theories.
The preservation of products by models means that the image of 𝑀
in 𝐒𝐞𝐭 is a sequence of sets generated by powers of the set 𝑀 1 — the
image of the object 1 from 𝐋. Let’s call this set 𝑎. (This set is sometimes
called a sort, and such algebra is called single-sorted. There exist gener-
alizations of Lawvere theories to multi-sorted algebras.) In particular,
443binary operations from 𝐋 are mapped to functions:
𝑎 × 𝑎 → 𝑎
As with any functor, it’s possible that multiple morphisms in 𝐋 are col-
lapsed to the same function in 𝐒𝐞𝐭.
Incidentally, the fact that all laws are universally quantified equal-
ities means that every Lawvere theory has a trivial model: a constant
functor mapping all objects to the singleton set, and all morphisms to
the identity function on it.
A general morphism in 𝐋 of the form 𝑚 → 𝑛 is mapped to a func-
tion:
𝑎𝑚 → 𝑎𝑛
If we have two different models, 𝑀 and 𝑁, a natural transformation
between them is a family of functions indexed by 𝑛:
𝜇𝑛 ∷ 𝑀 𝑛 → 𝑁 𝑛
or, equivalently:
𝜇𝑛 ∷ 𝑎𝑛 → 𝑏𝑛
where 𝑏 = 𝑁 1.
Notice that the naturality condition guarantees the preservation of
𝑛-ary operations:
𝑁 𝑓 ∘ 𝜇𝑛 = 𝜇1 ∘ 𝑀 𝑓
where 𝑓 ∷ 𝑛 → 1 is an 𝑛-ary operation in 𝐋.
Thefunctorsthatdefinemodelsformacategoryofmodels,𝐌𝐨𝐝(𝐋,𝐒𝐞𝐭),
with natural transformations as morphisms.
Consider a model for the trivial Lawvere category 𝐅𝑜𝑝. Such model
is completely determined by its value at 1, 𝑀 1. Since 𝑀 1 can be any
444set, there are as many of these models as there are sets in 𝐒𝐞𝐭. More-
over, every morphism in 𝐌𝐨𝐝(𝐅𝑜𝑝,𝐒𝐞𝐭) (a natural transformation be-
tween functors 𝑀 and 𝑁) is uniquely determined by its component at
𝑀 1. Conversely, every function 𝑀 1 → 𝑁 1 induces a natural trans-
formation between the two models 𝑀 and 𝑁. Therefore 𝐌𝐨𝐝(𝐅𝑜𝑝,𝐒𝐞𝐭)
is equivalent to 𝐒𝐞𝐭.
## 30.4 The Theory of Monoids
ThesimplestnontrivialexampleofaLawveretheorydescribesthestruc-
ture of monoids. It is a single theory that distills the structure of all pos-
siblemonoids,inthesensethatthemodelsofthistheoryspanthewhole
category 𝐌𝐨𝐧 of monoids. We’ve already seen a universal construction,
which showed that every monoid can be obtained from an appropri-
ate free monoid by identifying a subset of morphisms. So a single free
monoid already generalizes a whole lot of monoids. There are, however,
infinitely many free monoids. The Lawvere theory for monoids 𝐋𝐌𝐨𝐧
combines all of them in one elegant construction.
Every monoid must have a unit, so we have to have a special mor-
phism 𝜂 in 𝐋𝐌𝐨𝐧 that goes from 0 to 1. Notice that there can be no cor-
responding morphism in 𝐅. Such morphism would go in the opposite
direction, from 1 to 0 which, in 𝐅𝐢𝐧𝐒𝐞𝐭, would be a function from the
singleton set to the empty set. No such function exists.
Next, consider morphisms 2 → 1, members of 𝐋𝐌𝐨𝐧(2,1), which
must contain prototypes of all binary operations. When constructing
models in 𝐌𝐨𝐝(𝐋𝐌𝐨𝐧,𝐒𝐞𝐭), these morphisms will be mapped to func-
tions from the Cartesian product 𝑀 1 × 𝑀 1 to 𝑀 1. In other words,
functions of two arguments.
445The question is: how many functions of two arguments can one im-
plement using only the monoidal operator. Let’s call the two arguments
𝑎 and 𝑏. There is one function that ignores both arguments and returns
the monoidal unit. Then there are two projections that return 𝑎 and 𝑏,
respectively. They are followed by functions that return 𝑎𝑏, 𝑏𝑎, 𝑎𝑎, 𝑏𝑏,
𝑎𝑎𝑏, and so on… In fact there are as many such functions of two argu-
ments as there are elements in the free monoid with generators 𝑎 and
𝑏. Notice that 𝐋𝐌𝐨𝐧(2,1) must contain all those morphisms because one
of the models is the free monoid. In a free monoid they correspond to
distinct functions. Other models may collapse multiple morphisms in
𝐋𝐌𝐨𝐧(2,1) down to a single function, but not the free monoid.
If we denote the free monoid with 𝑛 generators 𝑛∗, we may iden-
tify the hom-set 𝐋(2,1) with the hom-set 𝐌𝐨𝐧(1∗,2∗) in 𝐌𝐨𝐧, the cate-
gory of monoids. In general, we pick 𝐋𝐌𝐨𝐧(𝑚,𝑛) to be 𝐌𝐨𝐧(𝑛∗,𝑚∗). In
other words, the category 𝐋𝐌𝐨𝐧 is the opposite of the category of free
monoids.
The category of models of the Lawvere theory for monoids,
𝐌𝐨𝐝(𝐋𝐌𝐨𝐧,𝐒𝐞𝐭), is equivalent to the category of all monoids, 𝐌𝐨𝐧.
## 30.5 Lawvere Theories and Monads
As you may remember, algebraic theories can be described using mon-
ads — in particular algebras for monads. It should be no surprise then
that there is a connection between Lawvere theories and monads.
First, let’s see how a Lawvere theory induces a monad. It does it
through an adjunction between a forgetful functor and a free functor.
The forgetful functor 𝑈 assigns a set to each model. This set is given by
evaluating the functor 𝑀 from 𝐌𝐨𝐝(𝐋,𝐒𝐞𝐭) at the object 1 in 𝐋.
446Another way of deriving 𝑈 is by exploiting the fact that 𝐅𝑜𝑝 is the
initial object in 𝐋𝐚𝐰. It means that, for any Lawvere theory 𝐋, there is a
unique functor 𝐅𝑜𝑝 → 𝐿. This functor induces the opposite functor on
models (since models are functors from theories to sets):
𝐌𝐨𝐝(𝐋,𝐒𝐞𝐭) → 𝐌𝐨𝐝(𝐅𝑜𝑝,𝐒𝐞𝐭)
But, as we discussed, the category of models of 𝐅𝑜𝑝 is equivalent to 𝐒𝐞𝐭,
so we get the forgetful functor:
𝑈 ∷ 𝐌𝐨𝐝(𝐋,𝐒𝐞𝐭) → 𝐒𝐞𝐭
It can be shown that so defined 𝑈 always has a left adjoint, the free
functor 𝐹.
This is easily seen for finite sets. The free functor 𝐹 produces free
algebras. A free algebra is a particular model in 𝐌𝐨𝐝(𝐋,𝐒𝐞𝐭) that is gen-
erated from a finite set of generators 𝑛. We can implement 𝐹 as the
representable functor:
𝐋(𝑛,−) ∷ 𝐋 → 𝐒𝐞𝐭
To show that it’s indeed free, all we have to do is to prove that it’s a left
adjoint to the forgetful functor:
𝐌𝐨𝐝(𝐋(𝑛,−),𝑀) ≅ 𝐒𝐞𝐭(𝑛,𝑈(𝑀))
Let’s simplify the right hand side:
𝐒𝐞𝐭(𝑛,𝑈(𝑀)) ≅ 𝐒𝐞𝐭(𝑛,𝑀 1) ≅ (𝑀 1)𝑛 ≅ 𝑀 𝑛
(I used the fact that a set of morphisms is isomorphic to the exponential
which, in this case, is just the iterated product.) The adjunction is the
result of the Yoneda lemma:
[𝐋,𝐒𝐞𝐭](𝐋(𝑛,−),𝑀) ≅ 𝑀 𝑛
447Together, the forgetful and the free functor define a monad 𝑇 = 𝑈 ∘ 𝐹
on 𝐒𝐞𝐭. Thus every Lawvere theory generates a monad.
Itturnsoutthatthecategoryofalgebrasforthismonadisequivalent
to the category of models.
You may recall that monad algebras define ways to evaluate expres-
sions that are formed using monads. A Lawvere theory defines n-ary
operations that can be used to generate expressions. Models provide
means to evaluate these expressions.
The connection between monads and Lawvere theories doesn’t go
both ways, though. Only finitary monads lead to Lawvere theories. A
finitary monad is based on a finitary functor. A finitary functor on 𝐒𝐞𝐭
is fully determined by its action on finite sets. Its action on an arbitrary
set 𝑎 can be evaluated using the following coend:
𝐹 𝑎 = ∫
𝑛
𝑎𝑛 × (𝐹 𝑛)
Since the coend generalizes a coproduct, or a sum, this formula is a
generalization of a power series expansion. Or we can use the intuition
thatafunctorisageneralizedcontainer.Inthatcaseafinitarycontainer
of 𝑎s can be described as a sum of shapes and contents. Here, 𝐹 𝑛 is a
set of shapes for storing 𝑛 elements, and the contents is an 𝑛-tuple of
elements, itself an element of 𝑎𝑛. For instance, a list (as a functor) is
finitary, with one shape for every arity. A tree has more shapes per
arity, and so on.
First off, all monads that are generated from Lawvere theories are
finitary and they can be expressed as coends:
𝑇𝐋 𝑎 = ∫
𝑛
𝑎𝑛 × 𝐋(𝑛,1)
448Conversely,givenanyfinitarymonad𝑇 on𝐒𝐞𝐭,wecanconstructaLaw-
vere theory. We start by constructing a Kleisli category for 𝑇. As you
may remember, a morphism in a Kleisli category from 𝑎 to 𝑏 is given by
a morphism in the underlying category:
𝑎 → 𝑇 𝑏
When restricted to finite sets, this becomes:
𝑚 → 𝑇 𝑛
The category opposite to this Kleisli category, 𝐊𝐥
𝑜𝑝
𝑇 , restricted to finite
sets,istheLawveretheoryinquestion.Inparticular,thehom-set𝐋(𝑛,1)
that describes n-ary operations in 𝐋 is given by the hom-set 𝐊𝐥𝑇(1,𝑛).
It turns out that most monads that we encounter in programming
are finitary, with the notable exception of the continuation monad. It is
possible to extend the notion of Lawvere theory beyond finitary opera-
tions.
## 30.6 Monads as Coends
Let’s explore the coend formula in more detail.
𝑇𝐋 𝑎 = ∫
𝑛
𝑎𝑛 × 𝐋(𝑛,1)
To begin with, this coend is taken over a profunctor 𝑃 in 𝐅 defined as:
𝑃 𝑛 𝑚 = 𝑎𝑛 × 𝐋(𝑚,1)
This profunctor is contravariant in the first argument, 𝑛. Consider how
it lifts morphisms. A morphism in 𝐅𝐢𝐧𝐒𝐞𝐭 is a mapping of finite sets
449𝑓 ∷ 𝑚 → 𝑛. Such a mapping describes a selection of 𝑚 elements from
an𝑛-elementset(repetitionsareallowed).Itcanbeliftedtothemapping
of powers of 𝑎, namely (notice the direction):
𝑎𝑛 → 𝑎𝑚
The lifting simply selects 𝑚 elements from a tuple of 𝑛 elements
(𝑎1,𝑎2,...𝑎𝑛) (possibly with repetitions).
Forinstance,let’stake𝑓𝑘 ∷ 1 → 𝑛 —aselectionofthe𝑘th elementfrom
an 𝑛-element set. It lifts to a function that takes a 𝑛-tuple of elements
of 𝑎 and returns the 𝑘th one.
Or let’s take 𝑓 ∷ 𝑚 → 1 — a constant function that maps all 𝑚
elements to one. Its lifting is a function that takes a single element of 𝑎
and duplicates it 𝑚 times:
𝜆𝑥 → (𝑥,𝑥, ... ,𝑥 ⏟⏟⏟⏟⏟⏟⏟⏟⏟⏟⏟
𝑚
)
450You might notice that it’s not immediately obvious that the profunc-
tor in question is covariant in the second argument. The hom-functor
𝐋(𝑚,1) is actually contravariant in 𝑚. However, we are taking the co-
end not in the category 𝐋 but in the category 𝐅. The coend variable 𝑛
goes over finite sets (or the skeletons of such). The category 𝐋 contains
the opposite of 𝐅, so a morphism 𝑚 → 𝑛 in 𝐅 is a member of 𝐋(𝑛,𝑚) in
𝐋 (the embedding is given by the functor 𝐼𝐋).
Let’s check the functoriality of 𝐋(𝑚,1) as a functor from 𝐅 to 𝐒𝐞𝐭.
We want to lift a function 𝑓 ∷ 𝑚 → 𝑛, so our goal is to implement a
function from 𝐋(𝑚,1) to 𝐋(𝑛,1). Corresponding to the function 𝑓 there
is a morphism in 𝐋 from 𝑛 to 𝑚 (notice the direction). Precomposing
this morphism with 𝐋(𝑚,1) gives us a subset of 𝐋(𝑛,1).
𝐋(𝑚,1) 𝐋(𝑛,1)
𝑚• •𝑛
𝑓
Noticethat,byliftingafunction1 → 𝑛 wecangofrom𝐋(1,1)to𝐋(𝑛,1).
We’ll use this fact later on.
The product of a contravariant functor 𝑎𝑛 and a covariant functor
𝐋(𝑚,1) is a profunctor 𝐅𝑜𝑝 × 𝐅 → 𝐒𝐞𝐭. Remember that a coend can be
defined as a coproduct (disjoint sum) of all the diagonal members of a
profunctor, in which some elements are identified. The identifications
correspond to cowedge conditions.
Here, the coend starts as the disjoint sum of sets 𝑎𝑛 × 𝐋(𝑛,1) over
all 𝑛s. The identifications can be generated by expressing the coend as
a coequilizer. We start with an off-diagonal term 𝑎𝑛 × 𝐋(𝑚,1). To get
to the diagonal, we can apply a morphism 𝑓 ∷ 𝑚 → 𝑛 either to the
451first or the second component of the product. The two results are then
identified.
𝑎𝑛 × 𝐋(𝑚,1)
𝑎𝑛 × 𝐋(𝑚,1) ∼ 𝑎𝑛 × 𝐋(𝑛,1)
𝑓 ∷ 𝑚 → 𝑛
⟨𝑓,id⟩ ⟨id,𝑓⟩
I have shown before that the lifting of 𝑓 ∷ 1 → 𝑛 results in these two
transformations:
𝑎𝑛 → 𝑎
and:
𝐋(1,1) → 𝐋(𝑛,1)
Therefore, starting from 𝑎𝑛 × 𝐋(1,1) we can reach both:
𝑎 × 𝐋(1,1)
when we lift ⟨𝑓,id⟩ and:
𝑎𝑛 × 𝐋(𝑛,1)
when we lift ⟨id,𝑓⟩. This doesn’t mean, however, that all elements of
𝑎𝑛 × 𝐋(𝑛,1) can be identified with 𝑎 × 𝐋(1,1). That’s because not all
elements of 𝐋(𝑛,1) can be reached from 𝐋(1,1). Remember that we can
only lift morphisms from 𝐅. A non-trivial 𝑛-ary operation in 𝐋 cannot
be constructed by lifting a morphism 𝑓 ∷ 1 → 𝑛.
In other words, we can only identify all addends in the coend for-
mula for which 𝐋(𝑛,1) can be reached from 𝐋(1,1) through the appli-
cation of basic morphisms. They are all equivalent to 𝑎 × 𝐋(1,1). Basic
morphisms are the ones that are images of morphisms in 𝐅.
452Let’s see how this works in the simplest case of the Lawvere the-
ory, the 𝐅𝑜𝑝 itself. In such a theory, every 𝐋(𝑛,1) can be reached from
𝐋(1,1). This is because 𝐋(1,1) is a singleton containing just the iden-
tity morphism, and 𝐋(𝑛,1) only contains morphisms corresponding to
injections 1 → 𝑛 in 𝐅, which are basic morphisms. Therefore all the
addends in the coproduct are equivalent and we get:
𝑇 𝑎 = 𝑎 × 𝐋(1,1) = 𝑎
which is the identity monad.
## 30.7 Lawvere Theory of Side Effects
Since there is such a strong connection between monads and Lawvere
theories, it’s natural to ask the question if Lawvere theories could be
used in programming as an alternative to monads. The major problem
with monads is that they don’t compose nicely. There is no generic
recipe for building monad transformers. Lawvere theories have an ad-
vantage in this area: they can be composed using coproducts and tensor
products. On the other hand, only finitary monads can be easily con-
verted to Lawvere theories. The outlier here is the continuation monad.
There is ongoing research in this area (see bibliography).
To give you a taste of how a Lawvere theory can be used to describe
side effects, I’ll discuss the simple case of exceptions that are tradition-
ally implemented using the Maybe monad.
The Maybe monad is generated by the Lawvere theory with a single
nullary operation 0 → 1. A model of this theory is a functor that maps
1 to some set 𝑎, and maps the nullary operation to a function:
raise :: () -> a
453WecanrecovertheMaybe monadusingthecoendformula.Let’sconsider
what the addition of the nullary operation does to the hom-sets 𝐋(𝑛,1).
Besides creating a new 𝐋(0,1) (which is absent from 𝐅𝑜𝑝), it also adds
newmorphismsto𝐋(𝑛,1).Thesearetheresultsofcomposingmorphism
of the type 𝑛 → 0 with our 0 → 1. Such contributions are all identified
with 𝑎0 × 𝐋(0,1) in the coend formula, because they can be obtained
from:
𝑎𝑛 × 𝐋(0,1)
by lifting 0 → 𝑛 in two different ways.
𝑎𝑛 × 𝐋(0,1)
𝑎0 × 𝐋(0,1) ∼ 𝑎𝑛 × 𝐋(𝑛,1)
𝑓 ∷ 0 → 𝑛
⟨𝑓,id⟩ ⟨id,𝑓⟩
The coend reduces to:
𝑇𝐋 𝑎 = 𝑎0 + 𝑎1
or, using Haskell notation:
type Maybe a = Either () a
which is equivalent to:
data Maybe a = Nothing | Just a
NoticethatthisLawveretheoryonlysupportstheraisingofexceptions,
not their handling.
45430.8 Challenges
1. Enumerate all morphisms between 2 and 3 in 𝐅 (the skeleton of
𝐅𝐢𝐧𝐒𝐞𝐭).
2. ShowthatthecategoryofmodelsfortheLawveretheoryofmonoids
isequivalenttothecategoryofmonadalgebrasforthelistmonad.
3. The Lawvere theory of monoids generates the list monad. Show
that its binary operations can be generated using the correspond-
ing Kleisli arrows.
4. FinSet is a subcategory of 𝐒𝐞𝐭 and there is a functor that embeds
itin𝐒𝐞𝐭.Anyfunctoron𝐒𝐞𝐭canberestrictedto𝐅𝐢𝐧𝐒𝐞𝐭.Showthat
a finitary functor is the left Kan extension of its own restriction.
## 30.9 Further Reading
1. Functorial Semantics of Algebraic Theories1, F. William Lawvere
2. Notions of computation determine monads2, Gordon Plotkin and
John Power
1http://www.tac.mta.ca/tac/reprints/articles/5/tr5.pdf
2http://homepages.inf.ed.ac.uk/gdp/publications/Comp_Eff_Monads.pdf
45531
Monads, Monoids, and Categories
There is no good place to end a book on category theory. There’s
always more to learn. Category theory is a vast subject. At the same
time, it’s obvious that the same themes, concepts, and patterns keep
showing up over and over again. There is a saying that all concepts are
Kan extensions and, indeed, you can use Kan extensions to derive lim-
its, colimits, adjunctions, monads, the Yoneda lemma, and much more.
The notion of a category itself arises at all levels of abstraction, and so
does the concept of a monoid and a monad. Which one is the most ba-
sic? As it turns out they are all interrelated, one leading to another in a
never-ending cycle of abstractions. I decided that showing these inter-
connections might be a good way to end this book.
45631.1 Bicategories
One of the most difficult aspects of category theory is the constant
switching of perspectives. Take the category of sets, for instance. We
are used to defining sets in terms of elements. An empty set has no el-
ements. A singleton set has one element. A Cartesian product of two
sets is a set of pairs, and so on. But when talking about the category
𝐒𝐞𝐭 I asked you to forget about the contents of sets and instead con-
centrate on morphisms (arrows) between them. You were allowed, from
time to time, to peek under the covers to see what a particular universal
construction in 𝐒𝐞𝐭 described in terms of elements. The terminal object
turned out to be a set with one element, and so on. But these were just
sanity checks.
A functor is defined as a mapping of categories. It’s natural to con-
sidera mapping as amorphisminacategory.Afunctorturned out to be
a morphism in the category of categories (small categories, if we want
to avoid questions about size). By treatinga functor as anarrow, we for-
feit the information about its action on the internals of a category (its
objects and morphisms), just like we forfeit the information about the
action of a function on elements of a set when we treat it as an arrow
in 𝐒𝐞𝐭. But functors between any two categories also form a category.
This time you are asked to consider something that was an arrow in one
category to be an object in another. In a functor category functors are
objectsandnaturaltransformationsaremorphisms.Wehavediscovered
that the same thing can be an arrow in one category and an object in
another. The naive view of objects as nouns and arrows as verbs doesn’t
hold.
Instead of switching between two views, we can try to merge them
into one. This is how we get the concept of a 𝟐-category, in which ob-
457jects are called 0-cells, morphisms are 1-cells, and morphisms between
morphisms are 2-cells.
0-cells 𝑎,𝑏; 1-cells 𝑓,𝑔; and a 2-cell 𝛼.
The category of categories 𝐂𝐚𝐭 is an immediate example. We have cat-
egories as 0-cells, functors as 1-cells, and natural transformations as
2-cells. The laws of a 𝟐-category tell us that 1-cells between any two 0-
cells form a category (in other words, 𝐂(𝑎,𝑏) is a hom-category rather
than a hom-set). This fits nicely with our earlier assertion that functors
between any two categories form a functor category.
In particular, 1-cells from any 0-cell back to itself also form a cate-
gory, the hom-category 𝐂(𝑎,𝑎); but that category has even more struc-
ture. Members of 𝐂(𝑎,𝑎) can be viewed as arrows in 𝐂 or as objects in
𝐂(𝑎,𝑎). As arrows, they can be composed with each other. But when
we look at them as objects, the composition becomes a mapping from a
pair of objects to an object. In fact it looks very much like a product —
a tensor product to be precise. This tensor product has a unit: the iden-
tity 1-cell. It turns out that, in any 𝟐-category, a hom-category 𝐂(𝑎,𝑎) is
automatically a monoidal category with the tensor product defined as
composition of 1-cells. Associativity and unit laws simply fall out from
the corresponding category laws.
458Let’s see what this means in our canonical example of a 𝟐-category
𝐂𝐚𝐭. The hom-category 𝐂𝐚𝐭(𝑎,𝑎) is the category of endofunctors on 𝑎.
Endofunctor composition plays the role of a tensor product in it. The
identity functor is the unit with respect to this product. We’ve seen be-
fore that endofunctors form a monoidal category (we used this fact in
the definition of a monad), but now we see that this is a more general
phenomenon: endo-1-cells in any 𝟐-category form a monoidalcategory.
We’ll come back to it later when we generalize monads.
You might recall that, in a general monoidal category, we did not in-
sist on the monoid laws being satisfied on the nose. It was often enough
for the unit laws and the associativity laws to be satisfied up to isomor-
phism. In a 𝟐-category, monoidal laws in 𝐂(𝑎,𝑎) follow from composi-
tion laws for 1-cells. These laws are strict, so we will always get a strict
monoidal category. It is, however, possible to relax these laws as well.
We can say, for instance, that a composition of the identity 1-cell id𝑎
with another 1-cell, 𝑓 ∷ 𝑎 → 𝑏, is isomorphic, rather than equal, to 𝑓.
Isomorphism of 1-cells is defined using 2-cells. In other words, there is
a 2-cell:
𝜌 ∷ 𝑓 ∘ id𝑎 → 𝑓
that has an inverse.
Identity law in a bicategory holds up to isomorphism (an invertible 2-cell ).
459Wecandothesamefortheleftidentityandassociativitylaws.Thiskind
of relaxed 𝟐-category is called a bicategory (there are some additional
coherency laws, which I will omit here).
As expected, endo-1-cells in a bicategory form a general monoidal
category with non-strict laws.
An interesting example of a bicategory is the category of spans. A
spanbetweentwoobjects𝑎 and𝑏 isanobject𝑥 andapairofmorphisms:
𝑓 ∷ 𝑥 → 𝑎
𝑔 ∷ 𝑥 → 𝑏
You might recall that we used spans in the definition of a categorical
product. Here, we want to look at spans as 1-cells in a bicategory. The
first step is to define a composition of spans. Suppose that we have an
adjoining span:
𝑓′ ∷ 𝑦 → 𝑏
𝑔′ ∷ 𝑦 → 𝑐
460The composition would be a third span, with some apex 𝑧. The most
natural choice for it is the pullback of 𝑔 along 𝑓′. Remember that a
pullback is the object 𝑧 together with two morphisms:
ℎ ∷ 𝑧 → 𝑥
ℎ′ ∷ 𝑧 → 𝑦
such that:
𝑔 ∘ ℎ = 𝑓′ ∘ ℎ′
which is universal among all such objects.
For now, let’s concentrate on spans over the category of sets. In that
case, the pullback is just a set of pairs (𝑝,𝑞) from the Cartesian product
𝑥 × 𝑦 such that:
𝑔 𝑝 = 𝑓′ 𝑞
A morphism between two spans that share the same endpoints is de-
fined as a morphism ℎ between their apices, such that the appropriate
triangles commute.
461A 2-cell in 𝐒𝐩𝐚𝐧.
To summarize, in the bicategory 𝐒𝐩𝐚𝐧: 0-cells are sets, 1-cells are spans,
2-cells are span morphisms. An identity 1-cell is a degenerate span in
which all three objects are the same, and the two morphisms are iden-
tities.
We’ve seen another example of a bicategory before: the bicategory
𝐏𝐫𝐨𝐟 ofprofunctors,where0-cellsarecategories,1-cellsareprofunctors,
and 2-cells are natural transformations. The composition of profunctors
was given by a coend.
## 31.2 Monads
By now you should be pretty familiar with the definition of a monad
as a monoid in the category of endofunctors. Let’s revisit this defini-
tion with the new understanding that the category of endofunctors is
just one small hom-category of endo-1-cells in the bicategory 𝐂𝐚𝐭. We
know it’s a monoidal category: the tensor product comes from the com-
positionofendofunctors.Amonoidisdefinedasanobjectinamonoidal
category — here it will be an endofunctor 𝑇 — together with two mor-
phisms. Morphisms between endofunctors are natural transformations.
462One morphism maps the monoidal unit — the identity endofunctor —
to 𝑇:
𝜂 ∷ 𝐼 → 𝑇
The second morphism maps the tensor product of 𝑇 ⊗𝑇 to 𝑇. The tensor
product is given by endofunctor composition, so we get:
𝜇 ∷ 𝑇 ∘ 𝑇 → 𝑇
We recognize these as the two operations defining a monad (they are
called return and join in Haskell), and we know that monoid laws turn
to monad laws.
Now let’s remove all mention of endofunctors from this definition.
We start with a bicategory 𝐂 and pick a 0-cell 𝑎 in it. As we’ve seen ear-
lier, the hom-category 𝐂(𝑎,𝑎) is a monoidal category. We can therefore
define a monoid in 𝐂(𝑎,𝑎) by picking a 1-cell, 𝑇, and two 2-cells:
𝜂 ∷ 𝐼 → 𝑇
𝜇 ∷ 𝑇 ∘ 𝑇 → 𝑇
satisfying the monoid laws. We call this a monad.
463That’s a much more general definition of a monad using only 0-cells,
1-cells, and 2-cells. It reduces to the usual monad when applied to the
bicategory 𝐂𝐚𝐭. But let’s see what happens in other bicategories.
Let’sconstructamonadin𝐒𝐩𝐚𝐧.Wepicka0-cell,whichisasetthat,
for reasons that will become clear soon, I will call 𝑂𝑏. Next, we pick an
endo-1-cell: a span from 𝑂𝑏 back to 𝑂𝑏. It has a set at the apex, which
I will call 𝐴𝑟, equipped with two functions:
𝑑𝑜𝑚 ∷ 𝐴𝑟 → 𝑂𝑏
𝑐𝑜𝑑 ∷ 𝐴𝑟 → 𝑂𝑏
464Let’s call the elements of the set 𝐴𝑟 “arrows.” If I also tell you to call the
elements of 𝑂𝑏 “objects,” you might get a hint where this is leading to.
The two functions 𝑑𝑜𝑚 and 𝑐𝑜𝑑 assign the domain and the codomain
to an “arrow.”
To make our span into a monad, we need two 2-cells, 𝜂 and 𝜇. The
monoidal unit, in this case, is the trivial span from 𝑂𝑏 to 𝑂𝑏 with the
apexat𝑂𝑏 andtwoidentityfunctions.The2-cell𝜂isafunctionbetween
the apices 𝑂𝑏 and 𝐴𝑟. In other words, 𝜂 assigns an “arrow” to every
“object.” A 2-cell in 𝐒𝐩𝐚𝐧 must satisfy commutation conditions — in this
case:
𝑑𝑜𝑚 ∘ 𝜂 = id
𝑐𝑜𝑑 ∘ 𝜂 = id
465In components, this becomes:
𝑑𝑜𝑚 (𝜂 𝑜𝑏) = 𝑜𝑏 = 𝑐𝑜𝑑 (𝜂 𝑜𝑏)
where𝑜𝑏 isan“object”in𝑂𝑏.Inotherwords,𝜂assignstoevery“object”
and “arrow” whose domain and codomain are that “object.” We’ll call
this special “arrow” the “identity arrow.”
The second 2-cell 𝜇 acts on the composition of the span 𝐴𝑟 with
itself. The composition is defined as a pullback, so its elements are pairs
ofelementsfrom𝐴𝑟 —pairsof“arrows”(𝑎1,𝑎2).Thepullbackcondition
is:
𝑐𝑜𝑑 𝑎1 = 𝑑𝑜𝑚 𝑎2
We say that 𝑎1 and 𝑎2 are “composable,” because the domain of one is
the codomain of the other.
The 2-cell 𝜇 is a function that maps a pair of composable arrows (𝑎1,𝑎2)
to a single arrow 𝑎3 from 𝐴𝑟. In other words 𝜇 defines composition of
arrows.
It’s easy to check that monad laws correspond to identity and as-
sociativity laws for arrows. We have just defined a category (a small
category, mind you, in which objects and arrows form sets).
466So, all told, a category is just a monad in the bicategory of spans.
What is amazing about this result is that it puts categories on the
same footing as other algebraic structures like monads and monoids.
There is nothing special about being a category. It’s just two sets and
four functions. In fact we don’t even need a separate set for objects,
because objects can be identified with identity arrows (they are in one-
to-one correspondence). So it’s really just a set and a few functions.
Considering the pivotal role that category theory plays in all of mathe-
matics, this is a very humbling realization.
## 31.3 Challenges
1. Derive unit and associativity laws for the tensor product defined
as composition of endo-1-cells in a bicategory.
2. Check that monad laws for a monad in 𝐒𝐩𝐚𝐧 correspond to iden-
tity and associativity laws in the resulting category.
3. Show that a monad in 𝐏𝐫𝐨𝐟 is an identity-on-objects functor.
4. What’s a monad algebra for a monad in 𝐒𝐩𝐚𝐧?
## 31.4 Bibliography
1. Paweł Sobociński’s blog1.
1https://graphicallinearalgebra.net/2017/04/16/
a-monoid-is-a-category-a-category-is-a-monad-a-monad-is-a-monoid/
467Index
Any inaccuracies in this index may be explained by the fact
that it has been prepared with the help of a computer.
—Donald E. Knuth, Fundamental Algorithms
(Volume 1 of The Art of Computer Programming)
ad hoc polymorphism, 156
arity, 438
arrows, 2
basic product operations, 441
bicartesian closed, 144
biclosed, 418
bifunctor, 112
bijection, 240
bijections, 71
bottom, 16
Cartesian closed, 143
Cartesian product, 113
chains, 28
coequalizer, 389
component, 152
composable, 28
contextual computation, 334
contravariant, 162
currying, 139
denotational semantics, 18
embedding, 70
endofunctors, 263
enriched, 216
enriched functor, 424
equality, 257
equational reasoning, 94
equivalence, 259
equivalence relation, 390
evaluation, 134
exponential, 142
extensional, 32
factorizer, 65
468fixed point, 351
forgetful functor, 212, 276
free category, 28
free functor, 276
free monoid, 209
function application, 134
function composition, 42
functorial, 113
hom-set, 29
homomorphism, 353
homomorphisms, 211
horizontal composition, 170
identity, 6
initial algebra, 353
injective, 70, 240
instance, 99
internal, 133
isomorphism, 257
isomporphism, 281
Lawvere theory, 440
left adjoint, 260
lifted, 250
linear order, 29
modus ponens, 148, 149
monad, 287
monoidal category, 76
morphisms, 2
natural, 254
Natural isomorphism, 155
naturality condition, 154
naturally isomorphic, 259
object, 245
objects, 2
one way, 260
one-to-one, 70
onto, 70
operational semantics, 17
opposite category, 56
parametric polymorphism, 125, 156
partial order, 29
point-free, 32
points, 32
poset, 54
predicate, 435
predicates, 24
preorder, 29
profunctor, 128
proof-relevant relation, 379
pure functions, 20
representable, 221, 264
representable presheaf, 193
representation, 221
rig, 85
right adjoint, 273
ring, 85
semiring, 85
side effects, 38
single-sorted, 443
skeleton, 440
surjective, 70, 240
symmetric, 417
template template parameter, 100
tensor product, 322
theorems for free, 125
469topos, 429
total, 70
total order, 29
type inference, 13
underlying, 211
underlying set, 276
universal cone, 188
universal construction, 52
up to isomorphism, 54
variant, 67
wedge condition, 383
writer monad, 49
Yoneda embedding, 241
470Acknowledgments
I’d like to thank Edward Kmett and Gershom Bazerman for checking
my math and logic, and André van Meulebrouck, who has been volun-
teering his editing help throughout this series of posts.
I’d like to thank Andrew Sutton for rewriting my C++ monoid concept
code according to his and Bjarne Stroustrup’s latest proposal.
I’mgratefultoEricNieblerforreadingthedraftandprovidingtheclever
implementation of compose that uses advanced features of C++14 to
drive type inference. I was able to cut the whole section of old fash-
ioned template magic that did the same thing using type traits. Good
riddance! I’m also grateful to Gershom Bazerman for useful comments
that helped me clarify some important points.
471Colophon
This book was compiled by Igal Tabachnik2, by converting the orig-
inal text by Bartosz Milewski into L ATEX format, by first scraping the
originalWordPressblogpostsusingMercuryWebParser3 togetaclean
HTML content, modifying and tweaking with Beautiful Soup4, finally,
converting to LaTeX with Pandoc5.
The typefaces are Linux Libertine for body text and Linux Biolinum
forheadings,bothbyPhilippH.Poll.TypewriterfaceisInconsolatacre-
ated by Raph Levien and supplemented by Dimosthenis Kaponis and
Takashi Tanigawa in the form of Inconsolata lgc. The cover page type-
face is Alegreya, designed by Juan Pablo del Peral.
Original book layout design and typography are done by Andres
Raba.
2https://hmemcpy.com
3https://mercury.postlight.com/web-parser/
4https://www.crummy.com/software/BeautifulSoup/
5https://pandoc.org/
472Copyleft notice
This book is Libre and follows the philosophy of Free Software6:
you can use this book as you like, the source is available, you can
redistribute this book and you can distribute your own version. That
means you can print it, photocopy it, e-mail it, upload it to websites,
change it, translate it, remix it, delete bits, and draw all over it.
This book is Copyleft: if you change the book and distribute your
own version, you must also pass these freedoms to its recipients. This
book uses the Creative Commons Attribution-ShareAlike 4.0 Interna-
tional License (cc by-sa 4.0).
6https://www.gnu.org/philosophy/free-sw.en.html
473