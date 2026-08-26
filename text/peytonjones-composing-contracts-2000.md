---
sha256: c4c39c5ef9b54a6f15d999785298cd75d0570f8474cdd69c62e81491b8edd97c
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 59002
---
Composing contracts:
an adventure in nancial engineering
Functional pearl
Simon Peyton Jones
Microsoft Research, Cambridge
simonpj@microsoft.com
Jean-Marc Eber
LexiFi Technologies, Paris
jeanmarc.eber@lexifi.com
Julian Seward
University of Glasgow
v-sewardj@microsoft.com
August 17, 2000
Abstract
Financialandinsurancecontractsdonotsoundlikepromis-
ingterritoryforfunctionalprogrammingandformalseman-
tics, but in fact we have discovered that insights from pro-
gramming languages bear directly on the complex subject
of describing andvaluing a large class of contracts.
We introduce a combinator library that allows us to de-
scribesuchcontractsprecisely,andacompositionaldenota-
tional semantics that says what such contracts are worth.
We sketch an implementation of our combinator library in
Haskell. Interestingly, lazy evaluation playsa crucial role.
1 Introduction
Consider the following nancial contract, C: the right to
choose on 30 June 2000 between
D1 Both of:
D11 Receive $100 on 29 Jan 2001.
D12 Pay $105 on 1 Feb2002.
D2 Anoptionexercisable on 15 Dec2000 tochoose one of:
D21 Both of:
D211 Receive $100 on 29 Jan 2001.
D212 Pay $106 on 1 Feb2002.
D22 Both of:
D221 Receive $100 on 29 Jan 2001.
D222 Pay $112 on 1 Feb2003.
The details of this contract are not important, but it is a
simpli edbutrealisticexampleofthesortofcontractthatis
tradedin nancialderivativemarkets. Whatisimportantis
thatcomplexcontracts,suchasC,areformedbycombining
together simpler contracts, such as D1, which in turn are
formed fromsimpler contracts still, suchas D11, D12.
To appear in the International Conference on Func-
tional Programming, Montreal, Sept 2000
At this point, any red-blooded functional programmer
should start to foam at the mouth, yelling \build a com-
binatorlibrary". Andindeed,thatturnsouttobenotonly
possible, buttremendouslybene cial.
The nanceindustryhasanenormousvocabularyofjargon
for typical combinations of nancial contracts (swaps, fu-
tures, caps, oors, swaptions, spreads, straddles, captions,
European options, American options, ...the list goes on).
Treating each of these individually is like having a large
catalogue of prefabricated components. The trouble is that
someone will soon want a contract that is not in the cata-
logue.
If, instead, we could de ne each of these contracts using
a xed, precisely-speci ed set of combinators, we would be
in a much better position than having a xed catalogue.
Forastart,itbecomesmucheasiertodescribe new,unfore-
seen,contracts. Beyondthat,wecansystematicallyanalyse,
andperform computations over thesenewcontracts,because
theyare described in termsof a xedsetof primitives.
The major thrustof thispaperis to draw insights fromthe
studyof functional programmingto illuminatetheworld of
nancial contracts. More speci cally, our contributions are
thefollowing:
 We de ne a carefully-chosen set of combinators, and,
through an extended sequence of examples in Haskell,
we showthatthesecombinatorscanindeedbeusedto
describe a wide varietyof contracts (Section 3).
 Ourcombinatorscanbeusedtodescribe a contract,but
wealsowanttoprocess a contract. Notably,wewantto
beableto nd the value of a contract. InSection4we
describehowtogiveanabstractvaluation semantics to
ourcombinators. Afundamentally-importantproperty
ofthissemanticsisthatitiscompositional;thatis,the
value of a compound contract is given by combining
thevalues of its sub-contracts.
 We sketch an implementation of our valuation seman-
tics, using as an example a simple interest rate model
and its associated lattice (Section 5). Lazy evaluation
turnsoutto betremendouslyimportantintranslating
thecompositionalsemanticsintoamodularimplemen-
tation (Section 5.3).
Stated in this way, our work sounds like a perfectly rou-
tine application of the idea of using a functional languagec, d, u Contract
o Observable
t, s Date, time
k Currency
x Dimensionless real value
p Value process
v Randomvariable
Figure 1: Notational conventions
to de ne a domain-speci c combinator library, thereby ef-
fectively creating an application-speci c programming lan-
guage. Suchlanguageshavebeende nedforparsers,music,
animations, hardware circuits, and many others [16]. How-
ever, from the standpoint of nancial engineers, our lan-
guage is truly radical: they acknowledge that the lack of a
precise way to describe complex contracts is \the bane of
our lives"1
.
It has taken us a long time to boil down the immensesoup
of actively-traded contracts into a reasonably small set of
combinators; but once that is done, new vistas open up,
because a single formal description can drive all manner of
automated processes. For example, we can generate sched-
ulesforback-oÆcecontractexecution,performriskanalysis
optimisations, presentcontractsinnewgraphicalways(e.g.
decision trees), provideanimated simulations, andso on.
This paper is addressed to a functional programming audi-
ence. Wewill introduce any nancial jargon as we go.
## 2 Getting started
Inthissectionwewill informallyintroduceournotationfor
contracts,andshowhowwecanbuildmorecomplicatedcon-
tracts out of simpler ones. We use the functional language
Haskell [14]throughout.
2.1 A simple contract
Considerthefollowingsimplecontract,knowntotheindus-
tryaszero-coupon discount bond: \receive$100on1stJan-
uary 2010". We can specify this contract, which we name
c1, thus:
c1 :: Contract
c1 = zcb t1 100 GBP
Figure 1 summarises the notational conventions we use
throughout the paper for variables, such as c1 and t1 in
this de nition.
Thecombinatorzcb usedinc1'sde nitionhasthefollowing
type:
zcb :: Date -> Double -> Currency -> Contract
The rstargumenttozcb isaDate,whichspeci esapartic-
ular momentintime(i.e. bothdateandtime). Weprovide
afunction,date,thatconvertsadateexpressedasafriendly
character string to a Date.
date :: String -> Date
1The quote is from an informal response to a draft of our work
Now we can de neourdate t1:
t1,t2 :: Date
t1 = date "1530GMT 1 Jan 2010"
t2 = date "1200GMT 1 Feb 2010"
We will sometimes need to subtract dates, to get a time
di erence, and add a date and a time di erence to get a
new date.
type Days = Double -- A time difference
diff :: Date -> Date -> Days
add :: Date -> Days -> Date
Werepresentatimedi erenceasa oating-pointnumberin
units of days(parts of dayscan beimportant).
2.2 Combining contracts
Sozcb letsusbuildasimplecontract. Wecanalsocombine
contractstomakebiggercontracts. Agoodexampleofsuch
a combiningform is and, whose typeis:
and :: Contract -> Contract -> Contract
Using and we can de ne c3, a contract that involves two
payments2
:
c2,c3 :: Contract
c2 = zcb t2 200 GBP
c3 = c1 `and` c2
Thatis,theholderofcontractc3 willbene tfromapayment
of $100 at time t1, and another payment of $200 at time
t2.
In general, the contracts we can describe are between two
parties, the holder of the contract, and the counter-party.
NotwithstandingBiblicaladvice(Acts10.35),bydefaultthe
owner of a contract receives the payments, and makes the
choices, speci ed in the contract. This situation can be re-
versedbythegive combinator:
give :: Contract -> Contract
Thecontractgive c issimplyc withrightsandobligations
reversed,astatementwewillmakepreciseinSection4.2. In-
deed,whentwopartiesagreeonacontract,oneacquiresthe
contractc,andtheothersimultaneouslyacquires(give c);
each is the other's counter-party. For example, c4 is a con-
tractwhoseholderreceives $100attimet1,andpays $200
at timet2:
c4 = c1 `and` give c2
So far, each of our de nitions has de ned a new contract
(c1, c2, etc). It is also easy to de ne a new combinator
(a function that builds a contract). For example, we could
de neandGive thus:
andGive :: Contract -> Contract -> Contract
andGive c d = c `and` give d
Now we can give an alternative de nition of c4 (which we
built earlier):
c4 = c1 `andGive` c2
2In Haskell, a function can be turned into an in x operator by
enclosing it in back-quotes.
2This ability to de ne new combinators, and use them just
as if they were built in, is quite routine for functional pro-
grammers, butnot for nancial engineers.
3 Building contracts
We have now completed our informal introduction. In this
sectionwewillgivethefullsetofprimitives,andshowhowa
widevarietyofothercontractscanbebuiltusingthem. For
reference,Figure2givestheprimitivecombinatorsovercon-
tracts; we will introducethese primitivesas we needthem.
3.1 Acquisition date and horizon
Figure 2 gives an English-language, but quite precise, de-
scriptionofeachcombinator. Todoso,itusestwotechnical
terms: acquisition date, and horizon. We begin by intro-
ducing thembrie y.
Our language describes what a contract is. However, what
the consequences for the holder of the contract depends on
the date at which the contract is acquired, its acquisition
date. (By\consequencesfortheholder"wemeantherights
and obligations that the contract confers on the holder of
a contract.) For example, the contract \receive $100 on 1
Jan2000andreceive$100on1Jan2001"isworthalotless
if acquiredafter 1 Jan 2000, because anyrights and obliga-
tions that fall due before the acquisition date are simply
discarded.
Thesecondfundamentalconceptisthatofacontract'shori-
zon,orexpiry date: the horizon, or expiry date, of a contract
is the latest date at which it can be acquired. A contract's
horizonmaybe niteorin nite. Thehorizonofacontractis
completelyspeci edbythecontractitself: givenacontract,
we can easily work out its horizon using the de nitions in
Figure 2. Note carefully, though, that a contract's rights
and obligations may, in principle, extend well beyond its
horizon. For example, consider the contract \the right to
decide on or before 1 Jan 2001 whether to have contract
C". This sort of contract is called an option. Its horizon
is 1 Jan 2001 | it cannot be acquired after that date |
but if one acquires it before then, the underlying contract
C may(indeed,typicallywill)haveconsequencesextending
well beyond1 Jan 2001.
To reiterate, the horizon of a contract is a property of the
contract, while theacquisition date is not.
3.2 Discount bonds
Earlier, we described the zero-coupon discount bond: \re-
ceive $100 at time t1" (Section 2.1). At that time we as-
sumed that zcb was a primitive combinator, but in fact it
isn't. It is obtained by composing no fewer than four more
primitivecombinators. Webegin with theone combinator:
c5 = one GBP
Figure 2 gives a careful, albeit informal, de nition of one:
if youacquire(one GBP), youimmediately receive$1. The
contract has an in nite horizon; that is, there is no restric-
tion on whenyoucan acquire this contract.
But the bond we want pays $100 at t1, and no earlier,
regardless of when the bond itself is acquired. To obtain
thise ectweusetwoothercombinators,get andtruncate,
thus:
c6 = get (truncate t1 (one GBP))
truncate t c is a contract that trims c's horizon so that
it cannot be acquired any later than t. (get c) is a con-
tract that,when acquired,acquires theunderlyingcontract
c at c's horizon | that is, at the last possible moment |
regardless of when the composite contract (get c) is ac-
quired. The combination of the two is exactly the e ect
we want, since the horizon of (truncate t1 (one GBP)) is
exactly t1. Like one, get and truncate are de ned in Fig-
ure 2.
We are still not nished. The bond we want pays $100
not $1. We use the combinator scaleK to \scale up" the
contract, thus:
c7 = scaleK 100 (get (truncate t1 (one GBP)))
Wewillde nescaleK shortly,inSection3.3. Ithasthetype
scaleK :: Double -> Contract -> Contract
To acquire (scaleK x c) is to acquire c, but all the pay-
ments and receipts in c are multiplied by x. So we can,
nally, de nezcb correctly:
zcb :: Date -> Double -> Currency -> Contract
zcb t x k = scaleK x (get (truncate t (one k)))
This de nition of zcb e ectively extends our repertoire of
combinators, just as andGive did in Section 2.2, only more
usefully. Wewill continuallyextendourlibraryofcombina-
tors in this way.
Why did we go to the trouble of de ning zcb in terms of
fourcombinators,ratherthanmakingitprimitive? Because
itturnsoutthatscaleK, get, truncate, andone areallin-
dependentlyuseful. Eachembodiesadistinctpiece offunc-
tionality, and by separating them we signi cantly simplify
thesemanticsandenrichthealgebraofcontracts(Section4).
The combinators we present are the result of an extended,
iterative process of re nement, leading to an interlocking
set of decisions | programming language designers will be
quitefamiliar with this process.
3.3 Observables and scaling
Arealcontractoftenmentionsquantitiesthataretobemea-
sured on a particular date. For example, a contract might
say \receive an amount in dollars equal to the noon Centi-
grade temperature in Los Angeles"; or \pay an amount in
poundssterlingequaltothe3-monthLIBORspotrate3
mul-
tipliedby100". Weusethetermobservable foranobjective,
but perhaps time-varying,quantity. By\objective" wemean
that at any particular time the observable has a value that
bothparties tothecontract will agree. Thetemperaturein
Los Angeles can be objectively measured; but the value to
meofinsuringmyhouseissubjective,andisnotanobserv-
able. Observables are thus a di erent \kind of thing" from
contracts, so we give thema di erenttype:
3The LIBOR spot rate is publisheddaily in the nancialpress. For
present purposes it does not matter what it means; all that matters
is that it is an observable quantity.
3zero :: Contract
zero is a contract that may be acquired at any
time. It has no rights and no obligations, and
has an in nitehorizon. (Section 3.4.)
one :: Currency -> Contract
(one k) isacontractthatimmediatelypaysthe
holder one unit of the currency k. The contract
has an in nitehorizon. (Section 3.2.)
give :: Contract -> Contract
To acquire (give c) is to acquire all c's rights
as obligations, and vice versa. Note that for a
bilateral contract q between parties A andB, A
acquiring q implies that B acquires (give q).
(Section 2.2.)
and :: Contract -> Contract -> Contract
If youacquire (c1 `and` c2) thenyouimmedi-
atelyacquirebothc1 (unlessithasexpired)and
c2 (unless it has expired). The composite con-
tract expires when both c1 and c2 expire. (Sec-
tion 2.2.)
or :: Contract -> Contract -> Contract
If you acquire (c1 `or` c2) you must immedi-
ately acquire either c1 or c2 (but not both). If
either has expired, that one cannot be chosen.
Whenbothhaveexpired,thecompoundcontract
expires. (Section3.4.)
truncate :: Date -> Contract -> Contract
(truncate t c) is exactly like c except that it
expires at the earlier of t and the horizon of c.
Noticethattruncate limitsonlythepossibleac-
quisition date ofc;itdoesnot truncatec'srights
and obligations, which may extend well beyond
t. (Section 3.4.)
then :: Contract -> Contract -> Contract
If you acquire (c1 `then` c2) and c1 has not
expired, then you acquire c1. If c1 has expired,
but c2 has not, you acquire c2. The compound
contract expires when both c1 and c2 expire.
(Section3.5.)
scale :: Obs Double -> Contract -> Contract
If you acquire (scale o c), then you acquire c
at the same moment, except that all the rights
and obligations of c are multiplied by the value
oftheobservableo atthemomentofacquisition.
(Section3.3.)
get :: Contract -> Contract
If you acquire (get c) then you mustacquire c
at c's expiry date. The compound contract ex-
pires at the same moment that c expires. (Sec-
tion 3.2.)
anytime :: Contract -> Contract
If you acquire (anytime c) you mustacquire c,
butyoucandosoatanytimebetweentheacqui-
sition of (anytime c) and the expiry of c. The
compound contract expires when c does. (Sec-
tion 3.5.)
Figure 2: Primitivesfor de ningcontracts
noonTempInLA :: Obs Double
libor3m :: Obs Double
In general, a value of type Obs d represents a time-varying
quantityof typed.
In the previous section we used scaleK to scale a contract
by a xedquantity. The primitivecombinator scale scales
acontractbyatime-varyingvalue,thatis,byanobservable:
scale :: Obs Double -> Contract -> Contract
With the aid of scale we can de ne the (strange but re-
alistic) contract \receive an amount in dollars equal to the
noon Centigrade temperatureinLos Angeles":
c8 = scale noonTempInLA (one USD)
Again,wehavetobeverypreciseinourde nitions. Exactly
when is the noon temperature in LA sampled? Answer (in
Figure 2): when youacquire (scale o c) youimmediately
acquire c, scaling all the paymentsand receipts in c bythe
valueoftheobservableo sampled at the moment of acquisi-
tion. So we sample the observable at a single, well-de ned
moment(theacquisitiondate)andthenusethatsinglenum-
ber to scale thesubsequentpaymentsand receipts inc.
A very useful observable is one that has the same value at
everytime:
konst :: a -> Obs a
With its aid we can de nescaleK:
scaleK :: Double -> Contract -> Contract
scaleK x c = scale (konst x) c
Anyarithmeticcombinationofobservablesisalsoanobserv-
able. For example,we maywrite:
ntLAinKelvin :: Obs Double
ntLAinKelvin = noonTempInLA + konst 373
We can use the addition operator, (+), to add two observ-
ables,becauseobservablesareaninstanceoftheNum class4
,
which has operations for addition, subtraction, multiplica-
tion, and so on:
instance Num a => Num (Obs a)
(ReaderswhoareunfamiliarwithHaskell'stypeclassesneed
not worry | all we need is that we can employ the usual
arithmetic operators for observables.) These observables
and their operations are, of course, reminiscent of Fran's
behaviours [6]. LikeFran,weprovidecombinatorsforlifting
functionstotheobservablelevel,lift,lift2,etc. Figure3
gives the primitivecombinators overobservables.
3.4 European options
Muchofthesubtletyin nancialcontractsarisesbecausethe
participants can exercise choices. We encapsulate choice in
4And indeed all the other numeric classes, such as Real,
Fractional, etc
4konst :: a -> Obs a
(konst x) is an observable that has value x at
anytime.
lift :: (a -> b) -> Obs a -> Obs b
(lift f o) is the observable whose value is the
resultofapplyingf tothevalueoftheobservable
o.
lift2 :: (a->b->c) -> Obs a -> Obs b -> Obs c
(lift2 f o1 o2) is the observable whose value
is the result of applying f to the values of the
observables o1 and o2.
instance Num a => Num (Obs a)
All numericoperations lift to the Obs type. The
implementationissimple,usinglift andlift2.
time :: Date -> Obs Days
The value of the observable (time t) at time s
is the numberof days between s and t, positive
if s is later thant.
Theremaybeanarbitrary numberof otherprimitive
observables provided bya particular implementation.
For example:
libor :: Currency -> Days -> Days -> Obs Double
(libor k m1 m2) is an observable equal, at any
time t, to the quoted forward (actuarial) rate in
currency k over the time interval t `add` m1 to
t `add` m2.
Figure 3: Primitivesover observables
twoprimitivecombinators,or andanytime. Theformeral-
lows one to choose which of two contracts to acquire (this
section), while the latter allows one to choose when to ac-
quire it(Section 3.5).
First, we consider the choice betweentwo contracts:
or :: Contract -> Contract -> Contract
Whenyouacquirethecontract(c1 `or` c2),youmustim-
mediately acquire either c1 or c2 (but not both). Clearly,
c1 can only be chosen at or before c1's horizon, and sim-
ilarly for c2. The horizon for (c1 `or` c2) is the latest
of thehorizonsofc1 andc2. Acquiringthiscompositecon-
tract,forexample,afterc1'shorizonbutbeforec2'shorizon
means that you can only \choose" to acquire contract c2.
For example,the contract
zcb t1 100 GBP `or` zcb t2 110 GBP
givestheholdertheright,ifacquiredbeforemin(t1; t2),to
chooseimmediatelyeithertoreceive$100att1,oralterna-
tively toreceive $110 at t2.
A so-called European option gives the right to choose, at a
particular date, whether or not to acquire an \underlying"
contract:
european :: Date -> Contract -> Contract
For example,consider thecontract c5:
c5 = european (date "24 Apr 2003") (
zcb (date "12 May 2003") 0.4 GBP `and`
zcb (date "12 May 2004") 9.3 GBP `and`
zcb (date "12 May 2005") 109.3 GBP `and`
give (zcb (date "26 Apr 2003") 100 GBP)
)
This contract gives the right to choose, on 24 Apr 2003,
whetherornottoacquireanunderlyingcontractconsisting
ofthreereceiptsandonepayment. Inthe nancialindustry,
this kind of contract is indeed called a call on a coupon
bond,givingtheright,atafuturedate,tobuyabondfora
prescribed price. Aswith zcb, we de neeuropean interms
of simplerelements:
european :: Date -> Contract -> Contract
european t u = get (truncate t (u `or` zero))
Youcan read thisde nition as follows:
 The primitive contract zero has no rights or obliga-
tions:
zero :: Contract
 The contract (u `or` zero) expresses the choice be-
tween acquiring u andacquiring nothing.
 Wetrimthehorizonof thecontract(u `or` zero) to
t,usingtheprimitivecombinatortruncate (Figure2).
 Finally,weuseourget combinatortoacquireitatthat
horizon.
We will repeatedly encounter the pattern
(truncate t (u `or` zero)), so we will package it
upinto a new composite combinator:
perhaps :: Date -> Contract -> Contract
perhaps t u = truncate t (u `or` zero)
3.5 American options
Theor combinatorletsuschoose which of twocontractsto
acquire. Let us now consider the choice of when to acquire
a contract:
anytime :: Contract -> Contract
Acquiringthecontractanytime u givestherighttoacquire
the \underlying" contract u at any time, from acquisition
date of anytime u up to u's horizon. However, note that u
must beacquired,albeitperhapsatthelatestpossibledate.
AnAmerican option o ersmore exibilitythanaEuropean
option. Typically, an American option confers the right
to acquire an underlying contract at any time between two
dates, or not to do so at all. Our rst (incorrect) attempt
to de nesucha contract mightbeto say:
american :: (Date,Date) -> Contract -> Contract
american (t1,t2) u -- WRONG
= anytime (perhaps t2 u)
butthatisobviouslywrongbecauseitdoesnotmentiont1.
WehavetoarrangethatifweacquiretheAmericancontract
beforet1 thenthebene tsarethesameasifweacquiredit
at t1. So ournextattemptis:
5american (t1,t2) u -- WRONG
= get (truncate t1 (anytime (perhaps t2 u)))
Butthatiswrongtoo,becauseitdoesnotallowustoacquire
theAmericancontractaftert1. Wereallywanttosay\until
t1 yougetthis,andaftert1 yougetthat". Wecanexpress
this using thethen combinator:
american (t1,t2) u
= get (truncate t1 opt) `then` opt
where
opt :: Contract
opt = anytime (perhaps t2 u)
We give the intermediate contract opt an (arbitrary) name
inawhere clause,becauseweneedtouseittwice. Thenew
combinator then is de ned as follows: if you acquire the
contract(c1 `then` c2) beforec1 expiresthenyouacquire
c1, otherwise youacquire c2 (unlessit too has expired).
3.6 Summary
We have now given the avour of our approach to de ning
contracts. The combinators we have de ned so far are not
enoughtodescribeallthecontractsthatareactivelytraded,
andweareextendingthesetinongoingwork. However,our
mainconclusions are una ected:
 Financialcontractscanbedescribedinapurelydeclar-
ative way.
 A huge variety of contracts can be described in terms
of a small numberof combinators.
Identifyingthe\right"primitivecombinatorsisquiteachal-
lenge. For example, it was a breakthrough to identify and
separatethetwoformsofchoice,or andanytime,andencap-
sulate those choices (andnothing else) in two combinators.
## 4 Valuation
We now have at our disposal a rich language for describing
nancial contracts. This is already useful for communicat-
ing between people | the industry lacks any such precise
notation. But in addition, a precise description lends itself
toautomaticprocessingofvarioussorts. Fromasinglecon-
tractdescriptionwe mayhopetogenerate legal paperwork,
pictures, schedules and more besides. The most immediate
question one might ask about a contract is, however, what
is it worth? Thatis, what would I pay to own the contract?
It is to thisquestion thatwe now turn.
We will expresscontract valuation in two \layers":
Abstract evaluation semantics. First,wewillshowhow
to translate an arbitrary contract, written in our lan-
guage, into a value process, together with a handful of
operations over these processes. These processes cor-
respond directly to the mathematical and stochastic
machineryusedby nancial experts[15,13].
Concrete implementation. A process is an abstract
mathematical value. To make a computer calculate
with processes we have to represent themsomehow |
thisisthestepfromabstractsemanticstoconcreteim-
plementation. An implementation will consist of a -
nancial model, associated to some discrete numerical
method. A tremendous number of di erent nancial
models are used today; but only three families of nu-
merical methods are widely used in industry: partial
di erential equations [18], Monte Carlo [1] and lattice
methods[5].
Thisapproachisstronglyreminiscentofthewayinwhicha
compileristypicallystructured. Theprogramis rsttrans-
latedintoalow-levelbutmachine-independentintermediate
language; manyoptimisations are applied at this level; and
then the program is further translated into the instruction
setforthedesiredprocessor(Pentium,Sparc,orwhatever).
In a similar way, we can transform a contract into a value
processe, apply meaning-preserving optimising transforma-
tions to this intermediate representation, before computing
a value for the process. This latter step can be done inter-
pretatively,oronecouldimaginegeneratingspecialisedcode
that, whenrun, would performthevaluation.
Indeed,ourabstractsemanticsservesasourreferencemodel
for what it means for two contracts to be the same. For
example,here are two claims:
get (get c) = get c
give (c1 `or` c2) = give c1 `or` give c2
In fact, the rst is true, and the second is not, but how
do we know for sure? Answer: we compare their valuation
semantics, as we shall see in Section 4.6.
4.1 Value processes
De nition 1 (Value process.) A value process, p, over
type a, is a partial function from time to a random variable
of type a. The random variable p(t) describes the possible
values for p at time t. We write the informal type de nition
PR a =DATE , !RV a
(We use caligraphic font for types at the semantic level.)
Becauseweneedtoworkwithdi erentprocessesbutde ned
on the same \underlying space" ( ltration), such a value
process is moreprecisely describedas anadapted stochastic
process, given a ltration. Such processes come equipped
with a sophisticated mathematical theory [15, 13], but it is
unlikely to be familiar to computer scientists, so we only
present informal, intuitive notions. We usually abbreviate
\value process" to simply \process". Be warned, though:
\process"and\variable"meanquitedi erentthingstotheir
conventional computerscience meanings.
Both contracts and observables are modeled as processes.
The underlyingintuition is as follows:
 Thevalueprocessforanobservableo mapsatimet toa
randomvariabledescribingthepossiblevaluesofo att.
Forexample,thevalueprocessfortheobservable\IBM
stock price in US$" is a (total) function that maps a
time to a real-valued random variable that describes
thepossible values of IBM's stock price in US$.
6Abstract
semantics
evaluation
Contract
descriptions
Monte Carlo PDE solver Lattice
Observables
Contracts
Processes
...
MODELS
NUMERICAL SOLVERS
BDT HJM B-S
Figure 4: Layered evaluation
V[[]]:Obs a ! PR a
V[[konst x]] = K(x)
V[[time s]] = time(s)
V[[lift f o]] = lift(f; V[[o]])
V[[lift2 f o1 o2]] = lift2(f; V[[o1]]; V[[o2]])
V[[libor k m1 m2]] = ...omitted
Figure 6: Evaluation semanticsfor observables
 The value process for a contract c, expressed in cur-
rency k is a (partial) function from a time, t, to a
random variable describing the value, in currency k,
of acquiring thecontract c at time t.
These intuitions are essential to understand the rest of the
paper.
A value process is, in general, a partial function of time;
thatis, itmaynotbede nedfor all valuesof itsargument.
Observablesarede nedforalltime,andsodonotneedthis
exibility; they de ne total processes. However, contracts
arenotde nedforall time;thevalueprocessfor acontract
is unde nedfor timesbeyondits horizon.
4.2 From contracts to processes
How, then, are we to go from contracts and observables to
processes? Figure5givesthecompletetranslationfromcon-
These primitives are independent of the evaluation
model
K:a !PR a
The process K(x) is de ned at all times to have
valuex.
time :DATE !PR R
Theprocesstime(s)isde nedatalltimest tobe
thenumberofdaysbetweens andt. Itispositive
if t is later thans.
lift :(a !b)!PR a !PR b
Applythespeci edfunctiontotheargumentpro-
cess point-wise. Theresult isde nedonlywhere
theargumentsprocess is de ned.
lift2:(a !b !c)!PR a !PR b !PR c
Combine the two argument processes point-wise
withthespeci edfunction. Theresultisde ned
onlywhere both argumentsare de ned.
These primitives are dependent on the particular
model
disc
T
k :RVT R !PR R
The primitive disc
T
k maps a real-valued random
variableatdateT ,expressedincurrencyk,toits
\fair" equivalent stochastic value process in the
samecurrencyk.
exchk1(k2):PR R
exchk1(k2) is a real-valued process representing
thevalueofoneunitofk2,expressedincurrency
k1. This is simply the process representing the
quotedexchangerate between thecurrencies.
snell
T
k :PR R !PR R
The primitive snell
T
k calculates the Snell enve-
lopeofitsargument. Itusestheprobabilitymea-
sureassociated with thecurrencyk.
Figure 7: Model primitives
tractstoprocesses,whileFigure6doesthesameforobserv-
ables. These Figures do not look very impressive, but that
isthewholepoint! Everythingsofarhasbeenleadingupto
this point; our entire design is organised around the desire
to give a simple, tractable, modular, valuation semantics.
Let uslook at Figure 5 inmore detail.
The function Ek[[]] takes a contract, c, and maps it to a
process describing, for each moment in time, the value in
currency k of acquiring c at that moment. For example,
the equation for give (E1) says that the value process for
give c issimplythenegationofEk[[c]],thevalueprocessfor
c. Aha! Whatdoes\negation" mean? Clearly, weneednot
only the notion of a value process, but also a collection of
operationsovertheseprocesses. Negatingaprocessesisone
suchoperation;thenegationofaprocessp issimplyafunc-
tionthatmapseachtime,t,tothenegationofp(t). Itisan
absolutely straightforward exercise to \lift" all operations
on real numbers to operate point-wise on processes. (This,
in turn, requires us to negate a randomvariable, butdoing
7Ek[[]]:Contract ! PR R
(E1) Ek[[give c]] = Ek[[c]]
(E2) Ek[[c1 `and` c2]] = Ek[[c1]]+Ek[[c2]] on ft j t H(c1) ^ t H(c2)g
Ek[[c1]] on ft j t H(c1) ^ t > H(c2)g
Ek[[c2]] on ft j t > H(c1) ^ t H(c2)g
(E3) Ek[[c1 `or` c2]] = max(Ek[[c1]]; Ek[[c2]]) on ft j t H(c1) ^ t H(c2)g
Ek[[c1]] on ft j t H(c1) ^ t > H(c2)g
Ek[[c2]] on ft j t > H(c1) ^ t H(c2)g
(E4) Ek[[o `scale` c]] = V[[o]]Ek[[c]]
(E5) Ek[[zero]] = K0
(E6) Ek[[truncate T c]] = Ek[[c]] on ft j t Tg
(E7) Ek[[c1 `then` c2]] = Ek[[c1]] on ft j t H(c1)g
Ek[[c2]] on ft j t > H(c1)g
(E8) Ek[[one k2]] = exchk(k2)
(E9) Ek[[get c]] = disc
H(c)
k
(Ek[[c]](H(c))) if H(c)6=1
(E10) Ek[[anytime c]] = snell
H(c)
k
(Ek[[c]]) if H(c)6=1
Figure 5: Compositional evaluation semantics for contracts
H(zero) = 1
H(one k) = 1
H(c1 `and` c2) = max(H(c1); H(c2))
H(c1 `or` c2) = max(H(c1); H(c2))
H(c1 `then` c2) = max(H(c1); H(c2))
H(truncate t c) = min(t; H(c))
H(scale o c) = H(c)
H(anytime c) = H(c)
H(get c) = H(c)
Figure 8: De nition of horizon
so is simple.) We will need a number of other operations
over processes. They are summarised in Figure 7, but we
will introduce each one as we needit.
Next, consider equation (E2). The and of two contracts is
modeledbytakingthesumof theirtwo valueprocesses; we
needthreeequationstogivethevalueofEk[[]] whent is ear-
lier than the horizon of both contracts, when it is earlier
than one but later than the other, and vice versa. In the
fourth case | i.e. for times beyond both horizons | the
evaluation function is simply unde ned. We use the nota-
tion \onft j : : : t : : :g" to indicate that the corresponding
equationappliesforonlypartofthe(time)domainofEk[[c]].
Figure8speci esformallyhowtocalculatethehorizonH(c)
of a contract c. It returns 1 as the horizon of a contract
with anin nitehorizon; we extend andmax intheobvi-
ous way to suchin nities.
Equation(E3)doesthesamefortheor combinator. Again,
by design, the combinator maps to a simple mathematical
operation, max. Onemightwonderwhywe de nedavalue
processtobeapartialfunction,ratherthanatotalfunction
that is zero beyond its horizon. Equation (E3) gives the
answer: beyond c1's horizon one is forced to choose c2. In
general, max(v1; 0)6=v1!
Equation (E4) is nice and simple. To scale a contract c by
a time-varying observable o, we simply multiply the value
processforthecontractEk[[c]]bythevalueprocessfortheob-
servable|rememberthatwearemodelingeachobservable
byavalueprocess. WeexpressthelatterasV[[o]],de nedin
Figure6inaverysimilarfashiontoEk[[]]. At rstthisseems
odd: how can we scale point-wise, when the scaling applies
tofuture paymentsandreceipts inc? Recall thatthevalue
process for c at a timet gives thevalue of acquiring c at t.
Well, if this value is v thenthe value of acquiring the same
contract with all payments and receipts scaled by x is cer-
tainlyv x. Ourde nitionof scale inFigure 2was infact
driven directly by our desire to express its semantics in a
simple way. Simple semantics gives rise to simple algebraic
properties (Section 4.6).
The equations for zero, truncate, and then are also easy.
Equation (E5) delivers the constant zero process, while
Equation (E6) truncates a process simply by limiting its
domain | remember, again, that the time argument of a
process models the acquisition date. The then combinator
ofequation(E7)behaveslikethe rstprocessinitsdomain,
andelsewhere like the second.
4.3 Exchange rates
Thetopgroup of operations overvalueprocesses de nedin
Figure 7 are generic { they are unrelated to a particular
nancial model. But we can't get away with that for ever.
Thelowergroupofprimitivesinthesame gurearespeci c
to nancial contracts, and they are used in the remaining
equations of Figure 5.
Consider equation (E8) in Figure 5. It says that to get
the value process for one unit of currency k2, expressed in
currency k, is simply the exchange-rate process between k2
andk namelyexchk(k2)(Figure7). Wheredowegetthese
exchange-rateprocessesfrom? Whenwecometoimplemen-
tation,wewill needsome(numerical)assumptionaboutfu-
ture evolution of exchange rates, but for now it suÆces to
treat the exchange rate processes as primitives. However,
8there are importantrelationships betweenthem! Notably:
(A1) exchk(k) = K(1)
(A2) exchk2(k1)exchk3(k2) = exchk3(k1)
That is, exchange-rate process between a currency and it-
selfiseverywhereunity;anditmakesnodi erencewhether
we convert k1 directly into k3 or whether we go via some
intermediate currency k2. These are particular cases of no-
arbitrage conditions, preventing any arbitrage opportunity
thatis,awayofearningmoneyforsurewithoutanyriskof
loosing one.
You might also wonder what has become of the bid-
o er spread encountered by every traveller at the foreign-
exchange counter. In order to keep things technically
tractable, nance theory assumes most of the time the ab-
sence of any spreads: one typically rst computes a \fair"
price, before nally adding a pro t margin. It is the latter
which gives rise to the spread, but our modelling applies
only to theformer.
4.4 Interest rates
Next,considerequation(E9). Theget combinatoracquires
the underlying contract c at its horizon, H(c). (get c is
unde ned if c has an in nite horizon.) It does not matter
what c's valuemightbeat earlier times;all thatmattersis
c's value at its horizon, which is described by the random
variable Ek[[c]](H(c)). What is the value of get c at earlier
times? To answer that question we need a speci cation of
future evolution of interest rates, that is an interest rate
model.
Let's consider a concrete example:
c = get (scaleK 10 (truncate t (one GBP)))
where t is one year from today. The underlying contract
(scaleK 10 (truncate t (one GBP))) pays out $10 im-
mediately it is acquired; the get acquires it at its horizon,
namely t. So the value of c at t is just $10. Before t,
though, it is not worth as much. If I expect interest rates
to average5
(say) 10% over the next year, a fair price for c
today would beabout $9.
Just as the primitive exch encapsulates assumptions about
future exchange rate evolution, so the primitive disc en-
capsulates an interest rate evolution (Figure 7). It maps
a random variable describing a payout, in a particular cur-
rency, at a particular date, into a process describing the
value of that payout at earlier dates, in the same currency.
Like exch, there are some properties that any no-arbitrage
nancial model shouldsatisfy. Notably:
(A3) disc
t
k(v)(t) = v
(A4) exchk1(k2)disc
t
k2(v) = disc
t
k1(exchk1(k2)(t)v)
(A5) disc
t
k(v1 +v2) = disc
t
k(v1)+disc
t
k(v2)
The rstequationsaysthatdisc shouldbetheidentityatits
horizon; the second says that the interest rate evolution of
di erent currencies should be compatible with the assump-
tionofevolutionofexchangerates. Thethird6
isoftenused
5For the associated risk-neutral probability, but we will not go in
these nancial details here.
6The nancially educated reader should note that we assume here
implicitly what is called complete markets.
inaright-to-leftdirectionasoptimisations: ratherthanper-
form discounting on two random variables separately, and
then add the resulting process trees, it is faster to add the
random variables (a single column) and then discount the
result. Just as in an optimising compiler, we mayuse iden-
tities like these to transform (the meaning of) our contract
into a formthat is faster to execute.
Onehas to becareful, though. Here is a plausible property
thatdoes not hold:
disc
t
k(max(v1; v2))=max(disc
t
k(v1); disc
t
k(v2))
It is plausible because it would hold if v1; v2 were single
numbers and disc were a simple multiplicative factor. But
v1 andv2 are randomvariables, andthe propertyis false.
Equation(E10)usesthesnell operatortogivethemeaning
of anytime. This operator is mathematically subtle, but
it has a simple characterisation: snell
t
k(p) is the smallest
process q such that
 q  p. Since we can exercise the option at any time,
anytime c is at all timesbetterthanc.
 8t:q disc
t
k(q(t)). Sincewecanalwaysdeferexercising
theoption,(anytime c) isalwaysbetterthanthesame
contract acquired later.
## 4.5 Observables
We can only value contracts over observables that we can
model. Forexample,wecanonlyvalueacontractinvolving
the temperature in Los Angeles if we have a model of the
temperature in Los Angeles. Some such observables clearly
require separate models. Others, such as the LIBOR rate
andthepriceoffutures,canincestuouslybemodeledasthe
value of particular contracts. We omit all the details here;
Figure 6 gives the semantics only for the simplest observ-
ables. This is not unrealistic, however. One can write a
large range of contracts with our contract combinators and
only thesesimple observables.
## 4.6 Reasoning about contracts
Now we are readyto use oursemantics to answer theques-
tions we posed at the beginning of Section 4. First, is this
equation valid?
get (get c) = get c
Wetakethemeaningofthelefthandsideinsomearbitrary
currencyk:
Ek[[get (get c)]]
= disc
h1
k
(Ek[[get c]](h1)) by(E9)
= disc
h1
k
(disc
h2
k
(Ek[[c]](h2))(h1)) by(E9)
= disc
h2
k
(disc
h2
k
(Ek[[c]](h2))(h2)) since h1 =h2
= disc
h2
k
(Ek[[c]](h2)) by(A3)
= Ek[[get c]] by(E9)
where
h1 =H(get c)
h2 =H(c)
9In a similar way, we can argue this plausible equation is
false:
give (c1 `or` c2)
?
= give c1 `or` give c2
The proof is routine, butits core is theobservation that
max(a; b)6=max( a; b)
Back in the real world, the point is that the left hand side
gives the choice to the counter-party, whereas in the right
handside the choice is madebytheholder of the contract.
Ourcombinatorssatisfyarichsetofequalities,suchasthat
givenforget above. Someoftheseequalitieshavesidecon-
ditions; for example:
scale o (c1 `or` c2) = scale o c1 `or` scale o c2
holdsonlyifo 0,forexactlythesamereasonthatget does
not commutewith or. Hang on! Whatdoes it meanto say
that\o 0"? Wemeanthato ispositiveforalltime. More
generally, as well as equalities between contracts, we have
alsodevelopedanotionoforderingbetweenbothobservables
and contracts, c1 c2,pronounced\c1 dominates c2".
Equalities, suchastheonesgivenabove,canbeusedasop-
timisingtransformationsinavaluationengine. A\contract
compiler" can use these identies to transform a contract,
expressed in the intermediate language of value processes
(see theintroduction to Section 4), into a formthat can be
valuedmore cheaply.
4.7 Summary
This completes our description of the abstract evaluation
semantics. From a programming-language point of view,
everything is quite routine, including our proofs. But we
stress that it is most unusual to nd formal proofs in the
nanceindustryatthislevelofabstraction. Wehavenamed
andtamedthecomplicatedprimitives(disc,exch,etc): the
lawstheymustsatisfygiveusawaytoproveidentitiesabout
contractswithouthavingtounderstandmuchaboutrandom
variables. The mathematicaldetails are arcane, believe us!
5 Implementation
Ourevaluationsemanticsisnotonlyanabstractbeast. We
can also regard Figures 5 and 6 as a translation from our
contract language into a lower-level language of processes,
whose combinators are theprimitives of Figure 7. Thenwe
canoptimisetheprocess-level description,using(A1)-(A5).
Finally,all(ha!) weneedtodoistoimplementtheprocess-
level primitives, and we will be able to value an arbitrary
contract.
The key decision is, of course, how we implement a value
process. Avalue process has to representuncertainty about
the future in an explicit way. There are numerous ways to
model this uncertainty. Rather than try to be general, we
will simply pick the Ho and Lee model, and use a lattice
methodtoevaluatecontractswithit[8]. Thereadershould
be warnedhowever: nothinginthis section is linkedto this
model, and we could take any of the multiple possible no-
arbitage models available in the nancial litterature. We
5%
4%
6%
3%
2%
4%
6%
7%
5%
8%
Figure 9: Ashort terminterest rate evolution
choose this model for its technical simplicity and historical
importance.
5.1 An interest rate model
In the typical Ho and Lee numerical scheme, the interest
rate evolution is represented by a lattice (or \recombining
tree"), as depicted in Figure 9. Each column of the tree
representsadiscretetimestep,andtimeincreasesfromleft
toright. Timezerorepresents\now". Asusualwithdiscrete
models,thereisanissueofhowlongatimestepwillbe;we
won'tdiscussthatfurtherhere,butwenoteinpassingthat
thetimesteps neednot be of uniformsize.
At each node of the tree is associated a one period short
term interest rate, shortly denominated the interest rate
from now on. We know today's interest rate, so the rst
column in the tree has just one element. However, there
is some uncertainty of what interest rates will evolve to by
the end of the rst time step. This is expressed by having
two interest-rate values in the second column; the idea is
that the interest rate will evolve to one of these two val-
ueswithequalprobability. Inthethirdtimestep,therates
split again, but the down/up path joins the up/down path,
so there are only three rates in the third column, not four.
This is why the structure is called a lattice; it makes the
whole schemecomputationallyfeasible bygivingonlyalin-
eargrowthinthewidthofthetreewithtime. Ofcourse,the
treeisonlyadiscreteapproximationofacontinuousprocess;
itsrecombiningnatureisjustachoiceforeÆciencyreasons.
We write Rt for the vector of rates in time-step t, and Rt;i
for the i'th member of that vector, starting with 0 at the
bottom. Thus,forexample,R2;1 =5%. Theactualnumbers
in Figure 9 are unrealistically regular: in more elaborated
interestratemodels,theywillnotbeevenlyspacedbutonly
monotonically distributedin each column.
108.64
9.25
8.90
9.71
10
10
10
9.35
9.52
10
Figure 10: AHo andLee valuation lattice
5.2 Value processes
So much for the interest rate model. A value process is
modeledbyalatticeofexactlythesameshapeastheinterest
rate evolution, except that we have a value at each node
insteadofaninterest rate. Figure10showsthevalueprocess
tree for ourfavourite zero-couponbond
c7 = get (scaleK 10 (truncate t (one GBP)))
evaluatedinpoundssterling(GBP).Usingourevaluationse-
manticswe have
EGBP [[c7]]=disc
t
GBP(K(10)(t))
IntheFigure, weassumethatthetimet istimestep3. At
step 3, therefore, the value of the contract c is certainly 10
atallnodes,becausec unconditionallydelivers$10atthat
time | remember axiom (A3). At time step 2, however,
we must discount the $10 by the interest rate appropriate
to that time step. We compute the value at each node of
time-step 2 by averaging the two values in its successors,
and then discounting the average value back one time step
using the interest rate associated to that node7
. Using the
same notation for the value tree V as we used for the rate
model R,we get the equation:
Vt;i = Vt+1;i +Vt+1;i+1
2(1+Rt;it)
where t is the size of the time step. Using this equation
we can ll in the rest of the values in the tree, as we have
done in Figure 10. The value in time step 0 is the current
value of thecontract, inpoundssterling. i.e $8:64.
Inshort, a lattice implementationworks as follows:
 A value process is represented by a lattice, in which
each column is a discrete representation of a random
7For evident presentation reasons, we don't care about the fact
that the Ho and Lee model is member of a class of models that admit
in fact a closed-form solution for zero-coupon bonds.
variable. The value in each node is one of thepossible
values the variable can take, and in our very simple
setting the numberof paths fromthe root to the node
isproportionaltotheprobabilitythatthevariablewill
take that value. We will say a bit more about how to
represent sucha tree inthe nextsubsection.
 The generic operations, in the top half of Figure 7,
are easy to implement. K(x) is a value process that is
everywhere equal to x. time(t) is a process in which
the values in a particular column are all equal to the
number of days between that column's time and t.
lift(f; p)appliesf top point-wise;lift2(f; p1; p2)\zips
together" p1 and p2, combining corresponding values
point-wise withf.
 The model-speci c operations of Figure 7 are a bit
harder. We have described how to implement disc,
which uses the interest rate model. exch is actually
rather easier (multiplythevalueprocess point-wise by
a process representing the exchange-rate). The snell
primitive takes a bit more work, and we do not de-
scribe it in detail here. Roughly speaking, a possible
implementation may be: take the nal column of the
tree,discountitbackonetimestep,takethemaximum
of that column with the corresponding column of the
original tree, and then repeat that process all the way
backto theroot.
The remaining high-level question is: in the (big) set of
possibleinterestratemodels,whatisa\good" model? The
answerisratherincestuous. Acandidateinterestratemodel
shouldpricecorrectlythosecontractsthatarewidelytraded:
one can simplylook upthecurrentmarketprices for them,
and compare them with the calculated results. So we look
for and later adjust the interest rate model until it ts the
marketdataforthesesimplecontracts. Nowwearereadyto
use the model to compute prices for more exotic contracts.
Theentiremarketis agigantic feedbacksystem,andactive
research studies the problemof its stability.
5.3 Implementation in Haskell
Wehavetwopartialimplementationsof(earlierversionsof)
these ideas, one of which is implementedas a Haskell com-
binator library. The type Contract is implemented as an
algebraicdatatype,withoneconstructorforeachprimitive
combinator:
data Contract = One Date Currency
| Give Contract
| ...
The translation to processes is done by a straightforward
recursive Haskell implementationof Ek[[]]:
eval :: Model -> Currency -> Contract -> ValProc
Here, Model contains the interest rate evolutions, exchange
rate evolutions, and whatever other \underlyings" are nec-
essary to evaluate thecontract.
Our rst implementation used the following representation
for a valueprocess:
type ValProc = (TimeStep, [Slice])
type Slice = [Double]
11Avalueprocess is representedbya pairof (a)theprocess's
horizon, and (b) a list of slices (or columns), one per time
step in reverse time order. The rst slice is at the horizon
oftheprocess, thenextsliceisonetimestepearlier, andso
on. Since the (fundamental) discount recurrence equation
(Section 5.1) works backwards in time, it is convenient to
represent the list this way round. Each slice is one element
shorter than theone before.
Laziness plays a veryimportantrole, for two reasons:
 Process trees can become very large, since their size is
quadratic in the number of time steps they cover. A
complexcontractwill berepresentedbycombiningto-
gethermanyvaluetrees;itwouldbeVeryBadtofully
evaluate thesesub-trees,andonlythencombinethem.
Lazy evaluation automatically \pipelines" the evalua-
tionalgorithm, sothatonlythe\currentslice" of each
value tree is requiredat anyone moment.
 Only part of a process tree may be required. Consider
again our examplecontract
c = get (scaleK 10 (truncate t (one GBP)))
The value process for
(scaleK 10 (truncate t (one GBP))) is a com-
plete value process, all the way back to time-step
zero, with value 10 everywhere. But get samples
this value process only at its horizon | there is no
point in computing its value at any earlier time. By
representing a value process as a lazily-evaluated list
we get the \right" behaviour automatically.
Microsoft Research collaborates closely with LombardRisk
Systems Ltd, who have a production tree-based valuation
system in C++. It uses a clever but complex event-driven
engine in which a value tree is represented by a single slice
that is mutated as time progresses. There is never a no-
tion of a complete tree. The Haskell implementationtreats
treesas rstclassvalues,andthispointofviewo ersarad-
ical new perspective on the whole evaluation process. We
are hopeful that some of the insights from our Haskell im-
plementationmayserve to informandimprovetheeÆcient
C++ implementation.
TheHaskellversiontakesaround900linesofHaskelltosup-
port a working, albeit limited, contract valuation engine,
complete with a COM interface [7] that lets it be plugged
into Lombard's framework. It is not nearly as fast as the
productioncode, butitisnotunbearablyslow either|for
example, it takes around 20 seconds to compute the value
of a contract with 15 sub-contracts, over 500 time steps,
on a standard desktopPC. Though it lacks muchfunction-
ality, the compositional approach means that can already
valuesomecontracts,suchasoptionsoveroptions,thatthe
production system cannot. (The production system is not
fundamentallyincapableofsuchfeats;butitisprogrammed
onacase-by-casebasis, andthemorecomplicatedcasesare
dauntinglyhard to implement.)
5.4 Memoisation
In functional programming terms, most of this is quite
straightforward. There is a nasty practical problem, how-
ever,thatrepeatedlybitespeoplewhoembedadomainspe-
ci c language in a functional language. Consider the con-
tract
c10 = join `and` join
where
join = <stuff> `or` <more stuff>
Here, join is ashared sub-contractof c10 muchlike opt in
ourde nitionofamerican (Section3.5). Thetroubleisthat
eval will evaluate the two branches of the and at the root
ofc10, obliviousofthefactthatthesetwobranchesarethe
same. In fact, eval will do all the work of evaluating join
twice! Thereisnowayforeval totellthatithas\seenthis
argumentbefore".
This problem arises, in various guises, in almost every em-
beddeddomain-speci clanguage. WehaveseenitinFran's
reactive animations [6], the diÆculty of extracting net-lists
fromHawkcircuitdescriptions[4],andinothersettingsbe-
sides. What makes it particularly frustrating is that the
sharing is absolutely apparentin thesource program.
One \solution" is to suggest that eval be made a memo
function[10,3,12],butwedonot nditsatisfactory. Losing
sharingcangiverisetoanunboundedamountofduplicated
work,soitseemsunpleasanttorelegate themaintenanceof
propersharingtoanoperationalmechanism. Forexample,a
memofunctionmaybedeceivedbyunevaluatedarguments,
orautomatically-purgedmemotables,orwhatever. Fornow
we simply identify it as an important open problem that
deserves further study. The only paper that addresses this
issue head on is [2]: it proposes one way to make sharing
observable,butleavesopenthequestionofmemofunctions.
6 Putting our work in context
At rst sight, nancial contracts and functional program-
ming do not have much to do with each other. It has been
a surprise and delight to discover that manyof the insights
useful inthe design, semantics, and implementationof pro-
gramminglanguages canbe applieddirectly to thedescrip-
tionandevaluationofcontracts. Oneofus(Eber)hasbeen
developingthisideafornearlytenyearsatSoci et eG en erale.
Theothers(PeytonJonesandSeward)cametoitmuchmore
recently, through a fruitful partnership with Lombard Risk
SystemsLtd. Theoriginalideawastoapplyfunctionalpro-
grammingtoarealisticproblem,andtocompareourresult-
ingprogramwiththeexisting imperativeversion|butwe
haveendedupwitharadicalre-thinkingofhowtodescribe
andevaluate contracts.
Though there is a great deal of work on domain-speci c
programming languages (see [9, 16] for surveys), our work
is virtually the only attempt to give a formal description
to nancial contracts. Anexceptionis theRISLAlanguage
developed at CWI [17], an object-oriented domain-speci c
language for nancial contracts. RISLA is designed for an
object-orientedframework,andappearstobemorestateful
andless declarative thanoursystem.
We have presented our design as a combinator library em-
beddedin Haskell, andindeed Haskell has proved an excel-
lent host language for prototyping both the library design
andvariousimplementationchoices. However,ourdesignis
absolutelynotHaskell-speci c. Thebigpayo comesfroma
12declarativeapproachtodescribing contracts. Asithappens
wealsousedafunctionallanguageforimplementing thecon-
tract language, but that is somewhat incidental. It could
equally well be implemented as a free-standing domain-
speci c language, using domain-speci c compiler technol-
ogy. Indeed, one of us (Eber) has work afoot do to just
this, compiling a contract into code that should be as fast
or faster than the best available current valuation engines,
usingOCaml[11],astrictfunctionallanguage,asimplemen-
tation language.
Although Haskell is lazy, and that was useful in our im-
plementation, the really signi cant feature of the contract-
description language is that it is declarative not that it is
lazy. Our design can be seen as a declarative, domain-
speci c language entirely independent of Haskell, and one
couldreadilyimplementavaluationengineforitinJavaor
C++, for example.
There is much left to do. We need to expand the set of
contractcombinatorstodescribeawiderrangeofcontracts;
to expand the set of observables; to provide semantics for
these new combinators;to write down andprovea range of
theoremsaboutcontracts;toconsiderwhetherthenotionof
a \normal form" makes sense for contracts; to build a ro-
bustimplementation;toenabletoapplyeasilythedramatic
simpli cations thatclosed formulas makepossible; to think
aboutmanagingacontractduringitslifeandtovalidateall
this in real nancial settings. Wehaveonly justbegun.
Acknowledgements
We warmly thank John Wisbey, Jurgen Gaiser-Porter, and
Malcolm Pymm at Lombard Risk Systems Ltd for their
collaboration. They invested a great deal of time in edu-
cating two of the present authors (Peyton Jones and Se-
ward)inthemysteriesof nancialcontracts andtheBlack-
Derman-Toy evaluation model. Jean-Marc Eber warmly
thanks Philippe Artzner for many very helpful discussions
andSoci et e G en eralefor nancialsupportofthiswork. We
also thank Conal Elliott, Andrew Kennedy, Stephen Javis,
AndyMoran,NormanRamsey,ColinRunciman,DavidVin-
cent andtheICFP referees, for their helpful feedback.
References
[1] P.Boyle, M. Broadie, andP.Glasserman. Monte carlo
methodsforsecuritypricing. Journal of Economic Dy-
namics and Control, 21:1267{1321, 1997.
[2] K Claessen and D Sands. Observable sharing for
functional circuit description. In PS Thiagarajan
and R Yap, editors, Advances in Computing Science
(ASIAN'99); 5th Asian Computing Science Confer-
ence,LectureNotesinComputerScience,pages62{73.
Springer Verlag, 1999.
[3] B Cook and J Launchbury. Disposable memo func-
tions. InJ Launchbury,editor, Haskell workshop, Am-
sterdam, 1997.
[4] B Cook, J Launchbury, and J Matthews. Speci-
fying superscalar microprocessors in hawk. In For-
mal techniques for hardware and hardware-like systems,
Marstrand, Sweden,1998.
[5] J. C. Cox, S. A. Ross, and M. Rubinstein. Option
pricing: a simpli ed approach. Journal of Financial
Economics, 7:229{263, 1979.
[6] CElliottandPHudak. Functionalreactiveanimation.
InACM SIGPLAN International Conference on Func-
tional Programming (ICFP'97), pages 263{273. ACM,
Amsterdam,August1997.
[7] S Finne, D Leijen, E Meijer, and SL Peyton Jones.
Calling hell from heaven and heaven from hell. In
ACM SIGPLAN International Conference on Func-
tional Programming (ICFP'99), pages 114{125, Paris,
September1999. ACM.
[8] T. Ho and S. Lee. Term Structure Movements and
Pricing Interest Rate Contingent Claims. Journal of
Finance, 41:1011{1028, 1986.
[9] P Hudak. Building domain-speci c embedded lan-
guages. ACM Computing Surveys, 28, December1996.
[10] John Hughes. Lazy memo-functions. In Proc Aspenas
workshop on implementation of functional languages,
February1985.
[11] Xavier Leroy, J er^ ome Vouillon, Damien Doligez, et al.
TheObjectiveCamlsystem,release3.00.TechnicalRe-
port, INRIA, available at http://caml.inria.fr/ocaml,
1999.
[12] SMarlowandSLPeytonJones. Stretchingthestorage
manager: weak pointers and stable names in haskell.
InInternational Workshop on Implementing Functional
Languages (IFL'99), Lecture Notes in Computer Sci-
ence,Lochem,TheNetherlands,1999.SpringerVerlag.
[13] M. Musiela andM. Rutkowski. Martingale Methods in
Financial Modelling. Springer, 1997.
[14] SLPeyton Jones, RJM Hughes, L Augustsson, DBar-
ton, B Boutel, W Burton, J Fasel, K Hammond,
R Hinze, P Hudak, T Johnsson, MP Jones, J Launch-
bury, E Meijer, J Peterson, A Reid, C Runciman, and
PL Wadler. Report on the programming language
Haskell 98. Technical report, February1998.
[15] D. Revuz and M. Yor. Continuous Martingales and
Brownian Motion. Springer, 1991.
[16] AvanDeursen,PKline,andJVisser. Domain-speci c
languages: an annotated bibliography. Technical re-
port,CentrumvoorWiskundeenInformatica,Amster-
dam,2000.
[17] A van Deursen and P Klint. Little languages: lit-
tle maintenance? Journal of Software Maintenance,
10:75{92, 1998.
[18] P. Willmot, J.N. Dewyne, and S.D. Howison. Option
Pricing: Mathematical Models and Computation. Ox-
ford Financial Press, 1993.
13