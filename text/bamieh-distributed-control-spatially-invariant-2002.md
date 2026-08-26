---
sha256: 359009eae2b9341332a919590051576e8d2052038491d6d5c448bb60178cee3c
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 82524
---
IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002 1091
Distributed Control of Spatially Invariant Systems
Bassam Bamieh, Member, IEEE, Fernando Paganini, Member, IEEE, and Munther A. Dahleh, Fellow, IEEE
Abstract—We consider distributed parameter systems where
the underlying dynamics are spatially invariant, and where
the controls and measurements are spatially distributed. These
systems arise in many applications such as the control of vehicular
platoons, flow control, microelectromechanical systems (MEMS),
smart structures, and systems described by partial differential
equations with constant coefficients and distributed controls and
measurements. For fully actuated distributed control problems
involving quadratic criteria such as linear quadratic regulator
(LQR), 2 and , optimal controllers can be obtained by
solving a parameterized family of standard finite-dimensional
problems. We show that optimal controllers have an inherent de-
gree of decentralization, and this provides a practical distributed
controller architecture. We also prove a general result that applies
to partially distributed control and a variety of performance cri-
teria, stating that optimal controllers inherit the spatial invariance
structure of the plant. Connections of this work to that on systems
over rings, and systems with dynamical symmetries are discussed.
Index Terms—Distributed control, infinite-dimensional systems,
optimal control, robust control, spatially invariant systems.
I. INTRODUCTION
THE VAST majority of automatic control implementations
to this day are spatially “lumped,” in the sense that the
controller interfaces with the physical system at a fixed and rel-
atively small number of actuators and sensors. Therefore the
spatially distributed aspect of the dynamics is only internal to
the system, usually modeled as an infinite-dimensional state;
thetheory ofdistributed parametersystems(see [1]–[4]) hasfo-
cused on methods ( -semigroups, operator equations, etc.) for
the precise mathematical treatment of these internal dynamics,
which is significantly more difficult than the finite-dimensional
theory. The constructive aspects of these theories typically deal
with insuring that finite-dimensional approximation schemes
converge. Problems with spatially distributed sensing and ac-
tuation pose an additional challenge, in that finite dimensional
Manuscript received May 29, 1998; revised December 10, 1999, August 5,
2000, February 20, 2001, and April 10, 2001. Recommended by Associate Ed-
itor H. Ozbay. The work of B. Bamieh was supported by the National Science
Foundation under CAREER award ECS-96-24152, and by the Air Force Of-
fice of Scientific Research-PRET 442530-25380. The work of F. Paganini was
supported by the National Science Foundation under CAREER award ECS-
9875056. The work of M. A. Dahleh was supported by the National Science
Foundation under award ECS-9612558 and by the Air Force Office of Scien-
tific Research under Grant F49620-95-0219.
B. Bamieh is with the Department of Mechanical and Environmental Engi-
neering, University of California at Santa Barbara, Santa Barbara, CA 93106
USA (e-mail: bamieh@engineering.ucsb.edu).
F. Paganini is with the Department of Electrical Engineering, University
of California at Los Angeles, Los Angeles, CA 90024 USA (e-mail: pa-
ganini@seas.ucla.edu).
M. A. Dahleh is with Department of Electrical Engineering and Computer
Science, Massachusetts Institute of Technology, Cambridge, MA 02139 USA
(e-mail: dahleh@lids.mit.edu).
Publisher Item Identifier 10.1109/TAC.2002.800646.
approximations always produce systems with large scale inputs
and outputs. With few exceptions, such problems have not been
thoroughly studied due to the perception of their technological
infeasibility.
Recently, however, technological progress is bringing
dramatic changes to this picture. In particular, advances in
microelectromechanical systems (MEMS) make feasible the
ideaofmicroscopicdeviceswithactuating,sensing,computing,
and telecommunications capabilities. Distributing a large array
of such devices in a spatial configuration gives unprecedented
capabilities for control; some recent examples are distributed
flow control [5]–[8] for drag reduction, and “smart” mechanical
structures [9]–[11]. At a larger scale, the control of networks of
autonomous units is gaining attention, e.g., in infinite strings of
vehicles (recently known as Platoons) [12]–[14], and in cross
directional (CD) control [15]–[17] in the chemical process
industry. For these applications the control variables are also
distributed in space, in addition to the internal states. While,
of course, practical systems will involve a finite number of
sensors and actuators, the correct abstraction in the limit for a
large array is that of a spatio-temporal system [18], where all
variables are indexed in space and time. Important questions
that arise are i) how to design controllers for these systems
with regard to global objectives; and ii) how can these control
algorithms be implemented in a distributed array.
In this paper, we study these questions for an important class
of problems. The key property which we exploit is spatial
invariance, which means that there is a notion of translation
in some spatial coordinates, with respect to which the plant
dynamics are invariant. The systems we consider and the
optimal controllers we design in this paper are typically infinite
dimensional. However, for the spatially invariant class, we
show that quadratically optimal controllers can be designed by
solving parameterized families of finite-dimensional problems
(via parameterized families of matrix Riccati equations). This is
an exact solution of the infinite dimensional problem. We also
show that the optimal infinite-dimensional controllers have an
inherently semidecentralized architecture (which we refer to as
“localized”). This architecture consists of a distributed infinite
array of finitedimensional controllers with separation structure,
and observer and state feedback operators which are spatial
convolutions. One of our main results is that the corresponding
convolution kernels (which determine the communication
requirements in the controller array) have exponential rates
of decay spatially. These facts allow us to argue for spatial
truncation to implement these controllers rather than the stan-
dard practice of modal truncation. In contrast to the latter, the
former preserves the inherently localized structure of optimal
controllers, and has exponential rather than polynomial rates
of approximation convergence.
0018-9286/02$17.00 © 2002 IEEE1092 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
Thenotionofspatialinvarianceshouldbeviewedasthecoun-
terpart to time invariance for spatio-temporal systems. Another
main result in this paper is that for spatially invariant plants, one
can restrict attention to spatially invariant controllers without
any loss in performance. This fact provides a significant sim-
plification of controller implementation and design, and further
generalizes our results on quadratic problems. We prove this in-
variance property for a large class of systems and induced-norm
robust control measures.
Our work is related to several earlier results in the literature,
and we briefly mention here some connections. The earliest use
of a spatial-invariance concept for control design is the work of
[12] for infinite strings of systems, with application to vehicle
arrays. This work and subsequent extensions in [13], [19] al-
ready include the use of transform methods over for control
optimization. The work on discretized partial differential equa-
tions [20] can be viewed as similar to our results for the group
.Thiscasehasalsoappearedelsewhereintheliteratureinthe
contextof block-circulanttransferfunctionmatrices[16],andis
relatedtothe“lifting”techniquefor -periodicsystems[21].In
our work wegeneralize thesenotions tospatial coordinatesover
arbitrary groups, including continuous domains. For the case of
infinite domains, we study the inherently localized structure of
optimal controllers which to our knowledge has not been pre-
viously addressed in the theory. Interestingly however, this fact
seems to have been observed in special examples earlier. In pur-
suing the question of sensor location [22], [23], it was observed
that optimal feedback kernels (referred to as “functional gains”)
are inherently localized.
Thenotionofspatio-temporalsystemshasalsoreceivedsome
attention in the early 1980s in the literature on systems over
rings [18], [24]–[26], where conditions for stability and stabi-
lizability were obtained in terms of a parameterized families of
finite dimensional conditions. Again, our work here generalizes
these notions and we furthermore show that these techniques
can also effectively solve optimal control problems.
Another line of related research is the work on symmetries
of linear dynamical systems [27], [28], where among other re-
sults, it was shown that plants with certain dynamical symme-
tries can be stabilized by controllers with the same symmetry
(i.e., without “symmetry breaking” in the terminology of [28]).
In this paper we consider systems with similar spatial symme-
tries and show that one can also achieve optimal performance
without breaking symmetry.
More recently and in parallel to our work, distributed sensing
and actuation problems have also been addressed using linear
matrix inequality (LMI) techniques [29], [30], where the dis-
tributed nature of inputs and outputs and limited communica-
tion requirements are incorporated in the theory.
Our presentation is organized as follows. In Section II, we in-
troduce the formalism of systems over spatial groups to study
such invariances, and collect some facts from generalized com-
mutative Fourier analysis. The simplest case (which we label
fully actuated) is when all spatial coordinates are of this na-
ture, and the actuation/sensing is fully distributed across them.
As discussed in Section III, these systems can be studied by a
Fourier transform over the spatial domain, which block-diago-
nalizesthedynamics intoa familyof finitedimensionalsystems
overspatialfrequency.Inparticular,optimalcontroldesignwith
respect to quadratic performance criteria (LQR, , ) can
be decoupled into a family of standard finite dimensional prob-
lems over spatial frequency, as shown in Section IV.
In Section V, we analyze the structure of these optimal con-
trollers, with particular attention to their localization or decen-
tralizationinspace.Thisisakeyissuefortheimplementationof
these optimal strategies in a distributed array. In this regard, we
show in Section V-A that a natural distributed architecture can
be provided, where local controllers observe the local state and
communicate with neighboring actuators and sensors. In Sec-
tion V-B, we study the spatial decay rates of the related con-
volution kernels, which directly affects the communication re-
quirements for the array. By analytically extending solutions of
parameterized Riccati equations, we prove that the decay rates
are spatially exponential.
In Section VI, we move to the general situation where spa-
tially invariant coordinates exist but do not fully parameterize
the plant dynamics; in this case diagonalization can still be per-
formed, but to yield a finite-dimensional problem it must be
combined with some form of lumped approximation in the re-
maining coordinates. In these cases our techniques still provide
acomputationalreduction incontroller design, aswell asan im-
portant insight into the architecture of distributed controllers.
We end the paper with a general result which shows that under
a variety of (not necessarily quadratic) performance criteria, the
optimal controller can always be taken to have the same invari-
ances as the underlying system, i.e., in the terminology of [28],
one can achieve optimality without symmetry breaking. Con-
clusions are given in Section VII.
II. MATHEMATICAL PRELIMINARIES
Inthissection,weintroduceaformalismtostudythequestion
ofspatial invariancein spatiallydistributeddynamical systems.
In full generality, spatial invariance can be defined whenever a
group of symmetries acts on the spatial coordinates, and the dy-
namics commute with this group. In this paper, we will restrict
ourselves to the special case when some spatial variables them-
selves form a group, and the symmetries considered are transla-
tions in this group.
A. Groups, Translations and Invariance
Inthesequel, willdenotealocallycompact,abelian(LCA)
group, see [31]. Special cases of this include
1) ;
2) (unit circle);
3) (integers);
4) , (finite group of integers modulo ).
In addition, one can consider direct products of such spaces,
, e.g., , , or the cylinder . Such
examples coverall the cases of interest in this paper, but still the
abstract formulation is convenient to treat all cases at once. In
this paper, the group will represent a number of spatial coor-
dinates,eachvaryinginoneoftheabovegroups.Theremayalso
beadditionalcoordinatesintheproblem;inotherwords,signals
will have the form , where varies inBAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1093
a group , contains additional spatial co-
ordinates varying in some set, and is (discrete or continuous)
time.
The group operation (denoted by , in the case of this
corresponds to addition of arcs) introduces a translation map
on , and a translation operator for functions
on in the natural way: . There is
a natural measure on which is invariant under translations,
and positive over open sets; this is called the Haar measure and
is unique up to normalization. (e.g., Lebesgue measure in or
, counting measure on or ). We denote it by . We will
be mainly concerned with complex functions on which are
square integrable with respect to the Haar measure
(1)
An operator with domain
is said to be translation invariant if
and for every translation .
Two important examples are as follows.
• For , the differentiation operator
(2)
Thedomainofthisoperatoristhesetoffunctionsin
with derivative in ; it is clear that is translation
invariant. Note that is unbounded, but it is a closed op-
erator with dense domain (see, e.g., [2]); due to their im-
portance inpartialdifferential equation models,thetheory
of distributed parameter systems is usually developed for
this larger class, see [3]. More generally, a PDE operator
whose spatial domain is a group, and has constant coeffi-
cients is translation invariant.
• A spatial convolution: let be a family of operators in-
dexed over , and define
(3)
wheretheintegralcorrespondstotheHaarmeasure.Under
appropriate assumptions, this operator is well defined and
spatially invariant.
B. Fourier Analysis on Groups
One of the main advantages of the spatial invariance prop-
erty over a group, is that Fourier transforms can be introduced
to diagonalize the relevant operators, in the same way as time
invariance is exploited in standard system theory. This section
contains a brief overview of Fourier analysis over groups; for a
full account see [31].
General Fourier analysis (also known as commutative
harmonic analysis) consists on mapping functions on to
functions on a dual group ; in full generality, can be
identified with the set of homomorphisms from to (the
so-called characters); for our purposes it suffices to consider
Table I, where the entries correspond to the Fourier transform,
Fourier series, -transform, and discrete Fourier transform,
respectively.
TABLE I
COMMUTATIVE GROUPS AND THEIR DUALS
The Fourier transform associates a function on
with a function on (for a general definition see [31]).
A few properties are
1) is linear;
2) transforms convolutions into products;
3) with appropriate normalizations in the measures and
, isanisometricisomorphismfrom to ;
in particular the Plancherel theorem states that
(4)
The last property above implies that one can identify the
spaces and ; in particular, every operator
on a dense domain in is identified with an operator
on a dense domain in . The main advan-
tage of this identification in that translation invariant operators
are associated with multiplication operators in the transformed
domain.
Definition 1: A multiplication operator is
defined by
almost everywhere, where is a measur-
able matrix-valued function.
The matrix-valued function is called the symbol of
the operator . With a slight abuse of notation, we use the same
letter to denote both the operator and its symbol. We will also
denote such symbols by either or to make formulas
more readable. It is easily seen that if is a multiplication op-
erator, the corresponding on is translation invariant;
in what follows, we restrict the attention to translation invariant
operators with this property.
Assumption 1: We will consider translation invariant oper-
ators such that the corresponding
, is a multiplication operator,
and the function is continuous.
This assumption is general enough to include spatial convo-
lutions with kernels in , as well as the differentiation op-
erators which appear in constant coefficient PDE models. As is
well known [32], the induced norm of multiplication operators
isgivenbythe normofthedefiningfunction,inotherwords
and the finiteness of the right-hand side is a necessary and suf-
ficient condition for the boundedness of the operator .
III. SPATIAL INVARIANCE WITH FULL ACTUATION:
STATE-SPACE MODELS
This paper is concerned with spatio–temporal systems where
the relevant signals are indexed by a spatial coordinate in addi-1094 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
tiontotime.Inthissection,wefocusonaspecialclassofcontrol
problems, where the following are true.
1) Allthespatialcoordinates,denotedcollectivelyby ,vary
in a group . Modulo this coordinate, the dynamics are
finite dimensional.
2) The system actuators and sensors are fully distributed
over this coordinate.
3) Thedynamicsarespatiallyinvariantwithrespecttotrans-
lations in this coordinate.
To be more precise, we adopt a state-space description for
this class of systems. The first two assumptions imply that if
, and denote the state, input, and output spaces respec-
tively, , , , are all finite. In
other words they can be expressed as vector-valued functions
, and . A general linear model is, thus, of
the form (in continuous time)
(5)
(6)
Definition 2: The system (5) and (6) is called spatially in-
variant if the operators , , , are translation invariant and
satisfy Assumption 1.
The entire treatment will be in terms of signal spaces: in
(5) and (6), at a fixed instant of time the signals , and
are assumed to be elements of (respectively, and
) for some finite vector dimensions , , . , , ,
are translation invariant operators between spaces of ap-
propriate dimensions, and are static (no dependence on ). The
third assumption above means that these operators are transla-
tioninvariant,inthesensedefinedinSectionII.Forexample, ,
, , could be matrices whose elements are PDE operators
(in ) with constant coefficients, spatial shift operators, spatial
convolution operators, or a linear combination of several such
operators.
In general, some of the operators will be unbounded, so the
notion of a solution to (5) requires some care, and involves the
theory of semigroups of operators; for a full discussion, see
[3].
A. Examples
A standard example of a spatially invariant system is the heat
equation with fully distributed control overeither an infinite do-
main orwithperiodicboundaryconditions .
An example where the spatial domain is discrete is lon-
gitudinal control and string stability of vehicular platoons
. Such problems have been considered using transform
techniques where the property of spatial invariance was utilized
[12], [13]. If each vehicle in an infinite string is modeled as a
moving mass with second-order dynamics (with normalized
coefficients), we obtain
for all , and where are the relative position and ve-
locity errors between the ’th and vehicle, respectively.
arethecontrolanddisturbance inputsinto the th vehicle.
In such a problem, it is typically desired to regulate errors down
to zero, and this can be captured by quadratic performance ob-
jective such as
Note that in the above model, the operator is obviously
spatially invariant. The operator is actually ,
where is the operator of translation by 1. And as usual,
wecandefinearegulatedoutputwhose normisthequadratic
objective defined above. All the system operators thus defined
willbespatiallyinvariant.Onecanthenposedistributed and
problems for such systems. We finally note here that the
stability of the distributed system implies the so-called “string
stability” of the vehicular platoon.
Other examples, were the spatial variables are of a mixed dis-
creteandcontinuousnaturecanbeaccommodatedinourframe-
work.
B. Block-Diagonalization
The main observation we will exploit in the next few sections
is that by taking a Fourier transform, the system (5) and (6) is
diagonalized into the decoupled form
(7)
(8)
where , , , are multiplication operators in
accordancewithassumption1.Now,thetransformedsystem(7)
and (8) is in effect a decoupled family of standard finite-dimen-
sionallineartime-invariant(LTI)systemsoverthefrequencypa-
rameter .
Stability: The decoupling achieved by Fourier transforma-
tion allows for standard techniques from finite dimensional
system theory to be applied to these distributed problems.
Consider first the question of stability of the autonomous
equation
(9)
with . Definitions of stability, asymptotic stability
and exponential stability have been studied for such systems
(see [2]), which extend, with some complications, the finite di-
mensional theory. In the translation invariant case, this question
can be studied by means of the diagonalized system
.
We will assume that the operator generates a strongly con-
tinuous semigroup[2] on , which we refer to as
.
Definition 3: The system (9) is exponentially stable if
for some .BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1095
Note that the corresponding semigroup
on is a semigroup of multiplication operators with
symbol . Thus, the stability condition can be recast as
(10)
This implies that checking exponential stability is almost equiv-
alent to checking “pointwise” the stability of the decoupled sys-
tems. The precise statement is in the following theorem.
Theorem 1: If is the generator of a strongly continuous
semigroup, then the following two statements about the system
(9) are equivalent:
1) the system is exponentially stable;
2) for each , is stable, and the solution of the
family of matrix Lyapunov equations
(11)
is bounded, i.e., .
Proof: The main point is that is
equivalent to the boundedness of the multiplication operator on
defined by the symbol .
: This follows [33, Th. 5.1.3]. The solution is a
bounded Hermitianoperator thatsatisfiesthe weakversion
of the operator Lyapunov equation, and thus,
is a Lyapunov function for the system [33, Th.
5.1.3].
: Since the semigroup is made up of multipli-
cation operators, the boundedness condition (10) is
Therefore, if we define to be the solution of (11) for each ,
we can bound
independently of .
The aforementioned theorem then implies that checking ex-
ponential stability can be handled by finite dimensional tools
plus a search over .
Stabilizability: Similar statements can be made about the
question of stabilizability of the system
(12)
where is a bounded operator on . The following state-
ments can be generalized to the case where is unbounded, but
we state the bounded case here for simplicity.
Definition 4: The system (12) is exponentially stabilizable
if there exists an operator such that
generates an exponentially stable semigroup on
.
It turns out that checking stabilizability can be done by a
pointwise solution to a parameterized family of finite dimen-
sional Riccati equations.
Theorem 2: Let be the generator of a semigroup, and
be bounded. Then, the system in (12) is exponentially stabi-
lizable if and only if the following two conditions hold:
1) for all , the pair is stabilizable;
2) the solution of the family of matrix Riccati equations
(13)
is bounded, i.e., .
Proof: We first note that condition 1) implies that for all
there exists a positive definite stabilizing solution to the alge-
braic Riccati equation (ARE) (13), and we require condition 2)
to insure that this results in a bounded operator on .
Sufficiency: This is clear since is a Lya-
punov function for the closed loop system with feedback
.
Necessity: This is essentially in [3, Th. 4.1.8], which con-
cludes that there must exist a unique bounded Hermitian
solution to a weak operator version of (13). In this case,
that solution gives the value function to
therelatedLQRproblem.Thevaluefunctionisclearlyspa-
tially invariant, and therefore the corresponding Hermitian
operator is spatially invariant. Thus, the operator ARE
collapsesto(13),togetherwiththeboundednesscondition.
We remark here that the above two theorems imply that
checking stability or stabilizability of spatially invariant
systems can be done by checking the same condition for the
finite-dimensional decoupled systems for every frequency
.
Remark: There are examples where it is necessary to check
the boundedness conditions in Theorems 1 and 2. However,
these appear to be mathematical constructions rather than phys-
ical examples. At large spatial frequencies (i.e., as ) the
dominantmechanisminphysicalsystemsisdissipation.Inother
words, for large , physical systems are stable and thus stabiliz-
able, and the conditions are automatically satisfied in the limit
.
The boundedness condition is certainly not needed when the
group is compact (i.e., for the case of spatially discrete sys-
tems ), since it follows from the continuity of so-
lutions. The above results are then very similar to results on
so-called spatio-temporal systems from the theory of systems
over rings [18], [25], [26]. We summarize this in the following
corollary.
Corollary 3: If the group is compact, then
1) the system in (9) is exponentially stable if and only if for
every , the matrix is stable;
2) thesystemin(12) isexponentiallystabilizableifand only
if for every , the matrix pair is stabiliz-
able.
Wenote herethat in the compact case, no technical assumptions
on the operators , are necessary other than the continuity of
thematrix-valuedfunctions , , whichthenimply that
, are bounded operators on .1096 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
IV. OPTIMAL CONTROL WITH QUADRATIC MEASURES
We now discuss briefly the possible settings for optimal and
robust control problems for such systems. There are two pos-
sible lines of investigation. The first would be to combine the
spatial Fourier transform with a Laplace transform over time
to obtain a multidimensional system transfer function. To illus-
trate, assume that (9) is exponentially stable, then has
a bounded inverse for , and we can define
(14)
which is a matrix-valued function on
, continuous in and analytic in . Then analysis and syn-
thesis problems for such systems become equivalent problems
for a certain class of multidimensional systems. In this setting,
causality (or stability) for both plants and controllers is only rel-
evantwithrespecttothevariable ,andnotthespatialtransform
variable . This is a crucial difference between these problems
and other multidimensional systems problems.
In this paper, we will take another approach which is more
expedient for quadratic problems. We transform only the spa-
tial variables, as was done in (7) and (8). The main observation
is that since norms are preserved by the Fourier transform,
any optimal control problem on (5) and (6) involving quadratic
signal norms (e.g., LQR, or problems, see below) will
be equivalent to an analogous problem for (7) and (8). Thus,
the original distributed problem is converted to a parameterized
family of finite dimensional state space problems.
A. The Distributed LQR
We begin by studying the distributed LQR problem. There is
an abundant amount of literature (see [3], [34]) on this problem,
characterizing the optimum in terms of a solution to an operator
Riccati equation, in an analogous fashion to the finite dimen-
sional theory. Such equations are difficult to solve in general,
but for the class of spatially invariant systems, the problem di-
agonalizes exactly into a parameterized family of finite dimen-
sionalLQRproblems.Thisisnowexplained;forsimplicityonly
the infinite horizon problem is discussed.
Consider the problem of minimizing the functional
(15)
subjecttothedynamics(5),and .Our
mainassumption isthat , , , and are translationinvariant
operators (further assumptions are listed in Theorem 4).
Taking spatial transforms, utilizing the facts that translation
invariant operators transform to multiplication operators, and
that inner products are preserved, the problem can then be
rewritten as the minimization of
(16)
subject to (7) and , and where and are the
Fourier symbols of the operators and , respectively. Now
it is clear from (16) and (7) that the problem decouples over ,
that is, it is “block-diagonal” with the blocks parameterized by
. At a fixed , it amounts to no more than a classical finite-di-
mensional LQR problem. Therefore, the unique solution to this
problem is achieved by the translation invariant state feedback
, where is a translation invariant operator
whose Fourier symbol is the positive–definite solution to
the parameter-dependent matrix ARE
(17)
for all .
The main observation here is that when , , , are trans-
lation invariant operators, then the solution to the operator ARE
in the LQR problem is also a translation invariant operator. The
exact conditions under which this yields a stabilizing controller
are:
Theorem 4: Consider the LQR problem (15), (5), where ,
, , are translation invariant operators, with , .
If and are exponentially stabilizable, then
1) the solution to the family of matrix ARE’s in (17) is uni-
formly bounded, i.e., ;
2) the translation invariant feedback operator
is exponentially stabilizing.
Proof: As in the proof of Theorem 2, this follows from [3,
Cor. 4.17 and Th. 4.18] after noting that the solution of the op-
erator ARE must be a spatially invariant operator. This follows
from the spatial invariance of the value function of the LQR
problem. This last fact is clear: if , , , are spatially in-
variant operators, then for any initial state , we have from the
LQR problem definition that , where is
any translation.
We should note here that the above is a generalization of the
notion of solving certain LQR problems by so-called modal de-
composition. The important difference is that in this paper we
do not advocate the standard “modal truncation” as the method
to implement a finite-dimensional approximation of the optimal
infinite-dimensional controller. Rather, we will proceed further
and analyze the properties of the resulting feedback operators.
This will yield a more natural approximation scheme that we
refer to as “spatial truncation.” These issues will be studied in
Section V-B.
B. and Control
In this section, we briefly describe how the preceding
methodology applies also to two disturbance rejection prob-
lems of the standard form given in Fig. 1. The generalized
plant is a linear, space/time invariant distributed system,
which admits a state-space representation as in (5) and (6). The
feedback , which is also distributed, must internally (expo-
nentially) stabilize the system and minimize a certain norm of
the closed loop map . As will be shown in more generality
in Section VI, no performance loss occurs by restricting the
design to controllers whichare themselvesspace/time invariant.
Under these circumstances, the closed loop is a
space/time invariant system, which can be represented by either
the convolution
(18)BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1097
Fig. 1. The standard problem.
(in the continuous time case) or the transfer function represen-
tation
(19)
The stabilizing property of is required to guarantee (18)
and (19) are meaningful under suitable signal classes. For our
purposes, we will require that be bounded, and analytic
in the second variable over .
This in particular, implies that is a well-defined operator
on , with induced norm
(20)
which we call the norm of the system; note, however, that
the Hardy space (analytic) structure refers only to the second
variable; from the point of view of the spatial frequency this is
onlyan norm.Thus,the controlprobleminthiscontext
istofindastabilizing whichminimizesthepreviousquantity.
Anothersystemspecificationwhichtranslatesnaturallytothe
frequency domain is the criterion, given by
tr (21)
As in the finite dimensional case, this norm can be used to mea-
sure the response of the system to stochastic disturbances. Once
again, we remark that the Hardy space structure is with respect
to the temporal-frequency variables alone.
The distributed and control design problems are de-
fined in terms of the following state-space description of the
plant in Fig. 1:
(22)
(23)
(24)
here , , , , , , are translation invariant op-
erators, and it is assumed that and are expo-
nentially stabilizable. Note that these conditions can be tested
by a parameterized family of finite dimensional stabilizability
checks as in Theorem 2.
The control design problems consist of finding controllers of
the form
(25)
(26)
where the state is a real separable Hilbert space, and is the
generatorofa semigroup,suchasthetheclosed-loopsystem
be exponentially stable, and either of
• is minimized. ( control);
• ( control).
These problems have been addressed in the literature for gen-
eral classes of distributed parameter systems [3], [34]). The so-
lutions generally available are in terms of the solvability of two
operator AREs. As we now indicate, spatial invariance allows
us to solve these operator AREs as a parameterized family of
matrix AREs. This can be observed by looking at the Fourier
transformed version of (22)–(24)
(27)
(28)
(29)
The system is thus reduced to a parameterized family of finite
dimensional LTI systems over . Now for both the
and problems, the optimization can be decoupled over fre-
quency since quadratic performance measures are preserved by
Fourier transformation
• from (21), the distributed problem amounts to solving
a family of standard problems over , then integrating
for the overall cost;
• the feasibility question can be imposed
asafamilyofstandard conditions .
This means that the standard finite dimensional theory can
apply at every , and the optimal controllers can be found by
applying the standard finite dimensional Riccati equations as in
[35] at each . The only additional technical requirement is to
showboundednessover oftheresultingsolutions;forthispur-
pose some regularity conditions must be imposed, which spe-
cialize those of [34] to the spatially invariant case. For the sake
of brevity we omit the detailed statements; the interested reader
is referred to [36].
As a consequence of the above, we find that the optimal
and controllers for spatial invariant plants are themselves
spatiallyinvariant; ageneralization of this fact will be discussed
in Section VI.
V. THE STRUCTURE OF QUADRATICALLY OPTIMAL
CONTROLLERS
The optimal controllers obtained in Section IV have the fol-
lowing attractive properties:
• theyprovideglobalperformanceguarantees. Inparticular,
they will ensure overall stability;
• they can be effectively computed by a family of low di-
mensional problems across spatial frequency.
However, we have not considered the issue of implementa-
tion of the control algorithm. In this regard, rather than a highly
complex centralized controller with information from all the
distributed array, it would be desirable to have distributed intel-
ligence, where each actuator runs a local algorithm with infor-
mationfromtheneighboringsensors.Inthissection,weanalyze
the optimal schemes from this perspective. Relevant questions
are as follows.
• (Section V-A) Does the control law lend itself to a dis-
tributed architecture?1098 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
• (Section V-B) To what degree is information from far
awaysensorsrequired?Noticethatthispertainstoapprox-
imate diagonalization in the original spatial variables.
A. Local Controller Architecture
We now illustrate the surprisingly intuitive and appealing ar-
chitecture of quadratically optimal controllers (by this we mean
the LQR, and the central controller).
First note that since the ARE solutions for all three problems
aretranslation-invariantoperators,thentheircontrollersarespa-
tially invariant systems; in particular, the same algorithm must
be run ateach actuator location, the influence of eachsensor de-
pending on its position relative to the actuator.
To understand the structure of this algorithm, let us examine
more closely the optimal controller; it has the following re-
alization:
(30)
(31)
where the state feedback and estimator “gains” are
and , where and are the
solutions to the operator Riccati equations, themselves spatially
invariant. Thus in the original spatial coordinates, and are
spatial convolutions, which is previously emphasized by the
notation.
The above implies the following structure of the optimal con-
troller.
a) A distributed estimator whose local state is .
Notethattopropagate thisstate[(30)], one needstoknow
the outputs of neighboring estimators, and convolve the
prediction errors with the kernel of (the size of this
neighborhood is determined by the spread of ). We
note that at a given , the local controller state
has a physical interpretation; it is the estimate
of the system’s local state .
b) The feedback at position is given by which is
computedbyconvolvingneighboringstateestimateswith
the kernel of (the size of this neighborhood is deter-
mined by the spread of ).
Thus the optimal laws are directly amenable to a distributed
implementation, with localized actuation and information
passing. What determines the degree of localization, and thus
the communication burden for the array, is the spread of the
convolution operators and . Note that the open loop system
operators , and are typically PDE operators, therefore
localized1 .
However, in general the Riccati solutions and will not
be differential operators ( and are not rational in
general, see the example in Section V-B), and their convolution
kernels will have a spread, reflecting the need of information
passing within the array.
In Section V-B, we will provide means of evaluating the
spread of and ; in particular we will see that these convo-
1Foropen-loopoperatorsoftheform(3),theirconvolutionkernelswouldalso
contribute to the controller spread.
lution kernels decay exponentially in space; thus the optimal
control laws have an inherent degree of decentralization. From
a practical perspective, the convolution kernels can be spa-
tially truncated to form “local” convolution kernels that have
performance close to the optimal, and preserve the appealing
architecture described earlier.
B. The Degree of Spatial Localization
We will study the localization issue for systems with un-
bounded spatial domains; for these we can ask the question of
how the controller gains decay as we move away in space. For
concreteness, we focus on the case (and ), anal-
ogous ideas apply to the discrete case . We first consider
the simplest example of LQR optimization to illustrate the spa-
tial localization properties.
Example: Consider the heat equation on an infinite bar with
distributed heat injection
(32)
Herethegroup istherealline.ThestandardFouriertransform
yields the transformed system
(33)
Taking, for example, (multiple of the identity) and
in the LQR cost (15), the corresponding (scalar) param-
eterized Riccati equation is
(34)
which has the positive solution
(35)
In the transform domain, the optimal control will be of the form
, with . Note that even
though the system and the cost are rational in , the optimal
control is irrational. This in particular implies that it cannot be
implemented by a “completely localized” PDE in and . In-
deed the control law takes the spatial convolution form
where the convolution kernel , and is the in-
verse Fourier transform of . In this particular case, noticing
that
we see that is a continuous function of . The degree of
spatial decentralization is characterized by the “spread” of
asafunctionof .Wenowshowthatthiskernelhassomedegree
of inherent “localization.”
Ifwemeasurethisspreadintermsoftheexponentialdecayof
, then we can bring in Laplace transform tools to relate this
decay to the existence of an analytic continuation of the Fourier
transform into a vertical strip of the complex plane.BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1099
Fig. 2. Analytic continuation region for ^ p() = 0c +
pc  + q.
In particular, can be extended to the function
of , and such that . We note that is
analytic in a region of the complex plane which avoids the four
branch cuts shown by the diagonal lines in Fig. 2. Thus, the
Fourier transform of can be analytically extended to the strip
Now, a consequence of Theorem 5 is that must decay ex-
ponentially, more precisely
for
Since decays exponentially with , it can be
truncated to form a “localized” feedback convolution operator
whose closed loop performance is close to the optimal.
Remark: We note that in this particular problem, an inter-
esting tradeoff seems to be in place: in the limit of “cheap”
control (i.e., ) the analyticity region grows and the
controller becomes more decentralized (approximates a purely
local feedback). It seems thus possible that there is an inherent
tradeoff between actuator authority and controller centraliza-
tion, in the sense that low authority actuators need feedback
from more distant sensors to achieve optimality.
In the remainder of this section we generalize these ideas
beyond this specific example. We begin by precisely stating
the relationship between analytic continuation and exponential
decay of the inverse transform. We draw from the theory of
Fourier-Laplace transformsas describedin [37, Ch. 7]. Here the
theory is set up in the Schwartz space of distributions ,
and a key role is played by the subspace of tempered distribu-
tions , which have a well-defined Fourier transform .
For our purposes it suffices to note that a tempered function on
is a locally integrable function that grows no faster than
polynomially as , and tempered distributions are ob-
tained by finite generalized derivatives of such functions; thus
theymayhavesingularities(Dirac ’s,etc.)buttheirgrowthrate
is no more than polynomial.
The generalization of (bilateral) Laplace transforms works as
follows.2 For a given distribution , define the set
TheLaplacetransform ontheverticalstrip
is defined by
(36)
With this definition in place, we now state the following result
from [37, Th. 7.4.2].
Theorem 5: Let be an open interval in , and be an
analyticfunctiononthestrip ,suchthatforeverycompact
set , there exist such that
(37)
holds for . Then there exists a distribution
such that for every , and satisfying
(36).
If we specialize this result to we see that an-
alytic functions on the strip
whichsatisfy thegrowth bound(37), haveinverseFourier trans-
forms such that isof “tempered”growth in , for every
. For instance if itself is a continuous function (as in
the example above), then must decay to zero as ,
faster than any exponential ; this is the decay result we
are looking for.
To generalize this kind of result to a class of optimal control
problems, we must guarantee that the Riccati solutions
have an analytic continuation to a vertical strip of this
kind, and that theysatisfy a growth bound of the form (37). This
will now be pursued, focusing on the LQR Riccati (17), and for
simplicity setting . We narrow the set of problems with
the following assumptions.
Assumption 2:
i) The functions , , have analytic exten-
sions , , to the strip
, which are rational functions. Note
that this class includes differential operators which are
common in “open loop” PDE models. We use the nota-
tion , where denotes transpose.
ii) For every , isstabilizable.
iii) For every , if for some vectors ,
, then either , or
(or both). In other words, the range space
of does not contain vectors orthogonal to those
in the range space of .
This last assumption is satisfied for examples where
is either a scalar or a vector. We remark here that these assump-
tionsareperhapsnotthemostgeneralunderwhichthefollowing
results can be obtained. Under these assumptions, we will show
2This material is from [37, Sec. 7.4]: here Fourier transforms are defined on
the real axis and analytic continuations are done in horizontal strips, so minor
changes are needed to adapt to our current notation.1100 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
that the ARE solution admits an analytic continuation to
a strip around the imaginary axis (possibly smaller than
) which satisfies the hypothesis of Theorem 5. This will mean
that
also satisfies these conditions, and therefore corresponds to a
convolution kernel such that is a tempered dis-
tribution for . This means, in a distribution sense, that we
have exponential decay of the controller “spread.” We will also
study means of computing the strip and decay bound.
Remark: The importance of this exponential decay is seen
more clearly when comparing it with the decay of the Fourier
transform, which is algebraic in . Thus, we see that at least
in a qualitative sense, the spatial domain is more appropriate to
perform truncations than the Fourier domain. This is an impor-
tant comment, because a commonly used method for controller
design in distributed parameter systems is to “pick a number of
modes,” i.e., truncate in the Fourier domain. This “modal trun-
cation” ignores the localization of the controller in the spatial
coordinates.
As an illustration, let be the spatially truncated convolu-
tion operatordefinedbytruncatingtheconvolution kernelof the
optimal feedback
Assume that is a function (i.e., any distribution com-
ponents of are supported in , this is the typical case);
under this assumption, exponential decay can be expressed as
for and thus
This means that if we establish exponential decay of the kernel,
we can make the operator norm of the truncation error
exponentiallysmallas becomeslarge.Bystandardsmall-gain
arguments,thisapproximationpropertyguaranteesthatthetrun-
cated feedback is stabilizing and approximates the optimal per-
formance. Asanillustration, wedemonstrate thesmall-gain sta-
bility argument. Write the truncated closed loop
as the interconnection of the two systems
(38)
The mapping in (38) is bounded on since is expo-
nentiallystabilizing(see[33,Th.5.1.5]);if isaboundedoper-
ator3 , the feedback mapping has arbitrarily small norm.
Thesmall-gaintheoremnowimpliesstabilityoftheclosed-loop
system.
3This is not the most general situation under which a small-gain argument is
possible. We assume the boundedness of B here for simplicity.
1) Analytic Continuation: The first step will be to prove the
existence of an analytic continuation to the Riccati equation so-
lution. We note that in this section, we drop the subscript and
the “hats” from all extension functions for simplicity of nota-
tion. To perform the extension, define the following generalized
Hamiltonian matrix
(39)
is analytic on ; restricted to the axis it is the
Hamiltonian matrix which corresponds to the ARE (17). Hence
(see [38]), its stabilizing solution is associated with the
stable invariant subspace of ; to extend analyti-
cally amounts to extending this subspace. We note that for
we still use the notation dom (Ric) to mean that it
hasno purelyimaginary eigenvaluesandastable eigensubspace
complementary to the range of . In such cases we de-
note the unique stabilizing (not necessarily Hermitian) solution
by Ric (see Appendix A). The precise statement of an-
alytic extension follows.
Theorem 6: Given the previous assumptions and as in
(39), with
1) if for some , , condition
(40)
holds, we can conclude that in the strip
, , and
is an analytic extension of
;
2) there exists a such that the condition (40) is satis-
fied.
Proof:
Part 1) The condition (40) guarantees that no eigenvalue
of crosses the imaginary axis as varies in the strip
. Since for
, we conclude that for any in the strip, has
exactly stable and antistable eigenvalues. We note here
that no longer has the standard Hamiltonian struc-
ture for , however, our assumptions guarantee that
it has a stabilizing solution (no longer necessarily Hermi-
tian) with the property that (we refer the
reader to Appendix A for the details of this argument). An
additional argument in Appendix B implies that the func-
tion is differentiable.
It remains to show that the solution is analytic
in the strip. To see this, note that is the stabilizing
solution of the ARE
Differentiatingthisequationwithrespectto (thecomplex
conjugate of ), we obtain (suppressing the argument )BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1101
Using analyticity of , , , this equation reduces to
which is a Sylvester equation. Since and
are both stable in
, then we have that in that strip, i.e., is
analytic there.
Part 2. Let us write . The rationality of
implies that (40) can be rewritten as
(41)
where is some polynomial in the real variables .
The hypotheses imply that (41) is true at . Wewant to
show that this is also true for for some .
To do this, we appeal to the Tarski–Seidenberg quantifier
elimination procedure [39], [40], where we can obtain the
following equivalence:
for some single-variable polynomials . Clearly, if
this last condition is satisfied at , it is satisfied in
some nonzero interval .
2) AGrowthBound: InordertoapplyTheorem5tothecon-
tinuation , we must show that its entries satisfy a polyno-
mial growth bound of the form (37); for this, we exploit the fact
that the function is algebraic.
We begin with the scalar case; a function of the com-
plex variable is algebraic if it satisfies the polynomial identity
, where
(42)
is a two-variable polynomial, i.e., each is a polynomial
of complex coefficients; we assume that is nontrivial in , i.e.,
and .Theobjectiveistoderiveagrowthbound
for . We first state the following.
Lemma 7: Given a monic polynomial
, then all roots satisfy
Proof: Take . Then and so
for each we have
This leads to
and therefore
We can now derive the desired bound for algebraic functions.
Proposition 8: Let be an analytic function in the strip
,where isopen.Alsoassumethat isalgebraic
as defined above. Then for every compact , there exist
such that for every
Proof: By hypothesis, where is as
in (42). Since is a nonzero polynomial, the set
is compact; since is continuous, by choosing
appropriatelywecanensurethattheboundholdsoverthisset.
It remains to consider the behavior of for ’s where
. For each of these, is a root of the polynomial
so the previous lemma gives
for equal to the sum of the degrees of the , and an ap-
propriately chosen .
The previous results can be immediately applied to the scalar
algebraic Riccati equation
underAssumption2.Thefunction obtainedfromTheorem
6 is analytic on a strip, and also algebraic. Therefore, it can be
bounded as required for Theorem 5.
In the matrix case, the previous results will apply provided
we can go from the matrix ARE to a scalar algebraic equation
for each entry of ; for details see Appendix B.
3) Computational Test for the Decay Rate: We have seen
that the exponential decay rate is dictated by the width of the
strip in which we have analytic continuation, and that condition
(40) provides a (possibly conservative) estimate of . We now
show that this determinant condition can be efficiently tested.
Assuming again is a rational function, we can write the
“descriptor realization”
(43)
well defined over , and reduce condition (40) to
(44)
for all , . This procedure casts the Hamil-
tonianconditionfor asawell-posednesscondition,ofananal-
ogous nature to the structured singular value theory [41]. With
this inspiration, we can “close the other loop” and define1102 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
which leads to the equivalent condition
(45)
Note that conditions (43) and (45) are equivalent to (44) via
Schur complements. So we conclude that satisfies (40) if and
only if
(46)
This last condition involves only a generalized eigenvalue com-
putation plus a one dimensional search over the parameter ; in
general, we can plot the eigenvalue condition over a grid of fre-
quencies,andfromthereestimateasuitablevalueof .Invoking
the preceding theory, a satisfying (46) bounds the exponential
decay of the optimal convolution kernel .
VI. PARTIALLY ACTUATED SYSTEMS: EXTENSIONS AND
LIMITATIONS
The main assumption in our work thus far has been that the
system is fully actuated, i.e., that the controls and states are de-
fined over the same index set . More precisely, we assumed
that , , , are all finite. In this
section, we first show how for systems in which
is infinite, our techniques still provide some reduction in the
complexity of the control design problem. We then prove a gen-
eral result valid for nonquadratic performance measures, that
optimal controllers are spatially invariant if the system is.
We first consider state models of the form
(47)
(48)
with , a group, and a set of indices with no a
priori defined structure. The operators , , , are assumed
to commute only with translations , for .
Amoregeneraland abstractmodelwouldbetosimplyregard
the state as taking values in an infinite-dimensional space for
every (this amounts to “suppressing” the variable ). We
can then write the model as previously
where now for every the system is infinite-dimensional
with finite-dimensional inputs and outputs.
The techniques we have presented for fully actuated systems
can now be applied to yield parameterized families of control
problems involving infinite-dimensional systems. To solve each
such problem, one must resort to some approximation tech-
nique. However, our development implies that one needs to ap-
proximate only in the dimensions in which the problem is not
spatially invariant.
We now briefly present an example to illustrate this point.
A. Stabilization of Fluid Flow in a Channel
This is a problem that has attracted much recent attention [7],
[8]. An example of this problem is depicted in Fig. 3, where
Fig. 3. 2-D Poiseuille flow with active boundary control.
the flow of a fluid in a two-dimensional (2-D) channel is being
controlledbyblowing/suctionactuators(indicatedbyarrowsto-
wardthechannel),andanarrayofflowshearsensorsareusedas
measurement outputs (indicated by arrows away from channel).
The control objective in this problem is to stabilize the nom-
inal laminar flow. This set up is a prototype for the important
problem of skin-friction drag reduction by microactuators and
sensors [7], [8].
The system model for this problem can be taken to be the lin-
earized Navier–Stokes equations about the nominal flow. If we
divide the system into an array of “cells” as shown. The cells
consist of vertical segments (each to include one pair of sen-
sors and actuators as the basic cell). The state of each cell
wouldthenrepresenttheflowfieldineachverticalsegment.The
spatial invariance of the system with respect to a discrete index
representing horizontal shifts from one cell to the next
canbeestablished(assumingtheunderlyingPDEtohavecoeffi-
cientsconstantinthehorizontaldirection,whichhappensinthis
case).Infactthespatialinvarianceofthisproblemcanalmostbe
ascertained from basic physical symmetry arguments, without
the need to write down the underlying PDEs. This model is spa-
tially invariant in the horizontal dimension, but not in the ver-
tical one.
The realization that this problem is spatially invariant
in the horizontal dimension significantly reduces the com-
plexity of the control design. To approximate the linearized
Navier-Stokes equations in both directions at large Reynolds
numbers is prohibitively expensive computationally, and would
yield controllers of very large orders. The horizontal spatial
invariance of this problem implies that a) one only needs to
approximateintheverticaldimension,thehorizontaldimension
should be Fourier transformed, and b) optimal controllers have
the structure of horizontal spatial convolutions that are spatially
localized (see Section V). We note here that the first fact a) was
observed in [7] by looking at the modal decomposition, and the
second fact was recently utilized [42].
B. A General Result on the Spatial Invariance of Optimal
Controllers
In this section we divert from our set up and consider
problems for general induced norms. We have seen that
quadratically optimal controllers for spatially invariant systems
arethemselvesspatiallyinvariant.Wewillaskasimilarquestion
for more general induced norms: given a spatially-invariant
generalized plant, can the optimal controller be taken to be spa-
tially invariant? Fortunately, the answer is yes, and this implies
a significant reduction in the complexity of the control design
problem.BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1103
The question above is reminiscent of questions related to
time-varying versus time-invariant compensation [43]–[46],
where it was shown that for linear time invariant plants and
induced norm performance objectives, time-varying controllers
offer no advantage over time-invariant ones. We will now prove
a similar result. The essence of our technique is similar to that
of [45], [46], in which averaging over the time index was used.
We will show here that the averaging argument only needs a
group structure, and thus one can average over any group, in
particular our spatial index sets.
To state the result precisely, consider a set up in terms of the
“standard problem” of robust control [38], [47], [48]. This is
shown in Fig. 1. All signals , , , are vector-valued signals
indexed over the same group . The objective in this problem
is to find a stabilizing controller that minimizes the -in-
duced norm from from to . For reference we note here that
the norm is defined as
We note that taking such norms on the regulated variables al-
lows us to penalize global objectives, i.e., to design the con-
troller so that some macro-objective of the overall array system
is optimized.
Intheusualnotation,wewillrefertotheclosedloopsystemin
Fig. 1 by . For any given , the input-output
sensitivity of the system is given by the induced norm
If the controller is a stabilizing controller the above worst case
gain will be finite.
Let LSI and LSV be the classes of Linear Spatially Invariant
and Linear Spatially Varying (not necessarily stable) systems
respectively. let us define the following two problems:
which are the best achievable performances with LSI and LSV
controllers respectively.
Theorem 9: If the generalized plant is spatially invariant
and has at least one spatially-invariant stabilizing controller,
then the best achievable performance can be approached with
a spatially-invariant controller. More precisely,
Proof: We use the existence of one stabilizing controller
to obtain a stable coprime factorization of the plant [4, chap. 8].
Since the controller is spatially invariant, then so are the stable
factors. With the YJBK parameterization, our problem then be-
comes
where the stable systems are LSI.
We first consider the case where the group is finite. Let
(possibly LSV) achieve a given performance level
. Define the averaged system
where the “shift” operator acts by .
Now it is clear that is spatially invariant, since the group
property guarantees for any
(i.e., the sum is re-shuffled). Now we prove that achieves at
least the same performance as . This is standard since
where we have used the spatial invariance of the ’s and of
the norm.
In the case of infinite , we follow the argument of [46] with
a slight modification. We take a sequence of subsets
with
where each has finite Haar measure (see [31]), and
define
This sequence then converges weak- to a spatially-in-
variant with the required norm bound [46].
The above result can be seen as a sequel to that in [27], [28]
showing existence of stabilizing controllers with the same in-
variance property as the plant. We have extended this here to
optimal controllers.
Remark: Although the examples we consider in this paper
are over commutative groups, the proof of the above theorem
does not require this assumption, and the statement holds for
noncommutative groups as well. For example, a MIMO transfer
function matrix where the entries are invariant with respect to a
permutation subgroup of the input and output indices will have
an optimal controller with the same invariance property.
The practical implication of this result is that if the plant is
spatially invariant (which is often obvious from physical sym-
metries), the controllers can be taken to be spatial convolutions.
Wenotethatthisalsoappliestosystemswithanunevendistribu-
tion of sensors and actuators. In such systems, if there is a large
numberofsensorsandactuators,theyaretypicallydistributedin
a regular lattice structure. Since any regular lattice can be gen-
erated by shifts of a fundamental cell (see [36] for an illustra-
tive example), such a lattice exhibits a translational invariance
with respect to those shifts. Our results then specify what shift1104 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
invariance optimal controllers can have. Such a structure may
be useful even when implementing controllers designed using
other methods (e.g., networks of PID controllers).
VII. CONCLUSION
In this paper we have studied control problems with dis-
tributed sensing and actuation over spatial coordinates. We
have identified the spatial invariance property as a fundamental
tool in reducing the complexity of optimal control design with
regard to global objectives. In the special case of quadratic
performance measures (LQR, , ), we provided exact so-
lutions to infinite dimensional control design problems in terms
of parametrized families of finite dimensional ones. We have
also discovered that these optimal controllers are inherently
distributed and spatially localized. Finally, we proved a general
principle that any spatial invariance of the plant is inherited by
an optimal controller under a variety of performance criteria.
The spatial invariance assumption involves a certain ideal-
ization with respect to practical control problems which have
bounded spatial domains. Also, the consideration of distributed
actuation over a continuous spatial variable will in practice be
implemented with some level of discretization. These idealiza-
tions are, however, completely analogous to those usually per-
formed over the time domain: a long but finite time horizon is
typically treated by infinite horizon techniques, and fast tem-
porally sampled systems are often approximated by continuous
time systems.
In terms of spatial localization, the results of Section V-B on
exponential decay rates of the optimal convolution kernel pro-
vide a qualitative assessment. Although these results are for un-
boundeddomains,examplesinvolvingboundeddomainsappear
tohavethisinherentlocalizationpropertyaswell[14],[50].The
next question would be to attempt to influence the degree of lo-
calizationinthedesign.Onepossiblelineofattackwouldbethe
use of spatio-temporal weighting functions (e.g., in or
optimalcontrol);thisremainsopenforfurtherresearch.Another
recently explored strategy [51] involves relaxations to the LMI
versions of these problems.
APPENDIX A
COMPLETING THE PROOF OF THEOREM 6
The difficultyin establishing theexistence of a solution
for isthatthecorrespondingAREisnotstandard,inthat
the coefficients , are not Hermitian. How-
ever the Hamiltonian approach to this problem, as described in
[52, Ths. 12.1 and 12.2], can be mimicked under our assump-
tions,toshowexistenceofasolutionsatisfying .
We now sketch this argument, focusing for brevity on the steps
which are not straightforward, where our assumptions must be
invoked. We first find bases for the stable eigenspaces of
and such that
(49)
where and are stable matrices. Note that the
matrices and are not necessarily related, but we
now derive some relations. Proceeding as in [52, Th. 12.1] and
using the stability of and , we conclude that
(50)
which also implies that is invertible if and only if
is invertible. To see that, assume is invert-
ible and is not. This means such that
, so (50) implies that .
Since is invertible, this means , contra-
dicting the fact that forms a basis.
These facts imply that when is invertible
is well defined and has the property .
It remains to show that is invertible. Suppose it is not,
then we first have
Claim: Either is invariant, or
is invariant.
Proof: Suppose not, then such that
, and
. Now, the first com-
ponent of (49) is
(51)
which then gives
whichbyourassumptionsimplythateither
or (or both). This last statement, to-
gether with (51) and its “dual” imply
Since at least one of the above is true, we have a contradiction,
and the claim is proved.
We will assume the first clause of the claim and show that
the stabilizability assumption is then violated, a symmetrical
argument can be made if the second clause is true.
Since is invariant,
such that , with . Multiplying (49)
by , we obtain
which violates the stabilizability assumption (at ) since
is a nonzero vector (because , form a basis),
and .BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1105
We have thus established the existence of a solution with
the property that . This solution gives a stable
by a standard argument as in [52, Th.
12.1].
APPENDIX B
MATRIX ARES AND ALGEBRAIC FUNCTIONS
In applying the results of Theorem 5 to exponential decay of
optimal Riccati operators, we invoked the algebraic property of
the solution in the scalar case. We want to extend this to
the matrix case; here the ARE is in effect a system of
coupled equations in the entries of and the variable ;
under Assumption 2 we can eliminate denominators and write
the equivalent polynomial equations
(52)
where are the entries of .
Let betheentriesofthestabilizingsolution
of the ARE; we claim that each of these is a scalar algebraic
function of to which we can apply Proposition 8. We outline a
proof based on some tools from algebraic geometry, taken from
[53].
• The set of solutions to equations such as (52)
iscalledanaffinevariety.Algebraicgeometrystudiessuch
sets by means of their interplay with ideals in the ring
of polynomials . An ideal generated by
polynomials is the set
the Hilbert basis theorem states all ideals are of this form.
If we consider polynomials defining a variety , then
denotes the fact that is the common set of
roots of polynomials in . All varieties have an associated
ideal. Also, a variety can be decomposed into the union
of a finite number of “irreducible” varieties, which have a
well-defined dimension: at all but a set of singular points,
this coincides with the dimension of the tangent subspace.
• The intersection of an ideal with the ring
is called the elimination ideal ; it
contains equations that can be algebraically derived from
those in and which eliminate the first variables. If
we now look at the set of roots
to the polynomials in the elimination ideal this must
contain the projection of onto the coordinates
; indeed is the “closure” of this set
in an algebraic sense.
We now state the following result.
Proposition 10: Consider the polynomial (52). Suppose that
for in an open set , we have a continuous family of
solutions , such that the Jacobian matrix
is nonsingular at every point . Then there
exists a polynomial
(53)
where , , satisfying .
Remark: We chose for concreteness, but an analogous
argument can be used for the other variables.
Proof: Let be the variety defined by the
(52). Invoking [53, Th. 9, p. 462], we find that all points
are nonsingular and belong to a unique
irreducible component of of dimension one. Let be this
irreducible component (which must be the same for all points
by continuity), and the corresponding prime ideal.
Now, we consider the elimination ideal
; since has dimension one, we see [53,
Cor 4, p. 449] that must be nontrivial, and thus we
find a nontrivial that is zero on ; this implies
. This polynomial must depend explicitly on
, otherwise, we would have derived a constraint on , which
we assumed is free to vary in an open set.
We can now apply this result to the polynomial
equations obtained from the ARE (41)
Here is the common denominator of , , ;
note that by Assumption 2 (i), is nonzero on
.
We know from Appendix A that for each ,
there is a solution which is stabilizing, i.e.,
is a stable matrix. By symmetry of
theregionthesamehappenswith .
We must show the Jacobian of these equations is nonzero on
; we can in fact express the partial derivatives
in matrix form (in vector form they would correspond to one
column of the Jacobian), as
where is the canonical matrix basis. If the Jacobian matrix
is singular at , we can find scalars , not all zero,
such that
in matrix form, this combination takes the form
where is the matrix of the ; but now the stability of the
matrices and impliesthat
invoking Sylvester’s theorem. So, we have a contradiction and
the Jacobian is nonsingular.
Now, Proposition 10 implies that each is algebraic, and
we can then obtain a growth bound by applying the scalar result
in Proposition 8.
Remark: The nonsingularity of the Jacobian has an addi-
tional implication; invoking the implicit function theorem, we
see that the stabilizing solution will be differentiable as a
function of the real and imaginary parts of ; this fact is used in
the proof of Theorem 6.1106 IEEE TRANSACTIONS ON AUTOMATIC CONTROL, VOL. 47, NO. 7, JULY 2002
ACKNOWLEDGMENT
The first author would like to thank P. Kokotovic and
M. Dahleh for providing a supportive research environment
while visiting at the Center for Control Engineering and Com-
putations at the University of California, Santa Barbara, during
1997–98. The authors would like to thank the anonymous
referees and H. Ozbay for identifying technical issues in need
of improvement, and P. Parrilo for helpful references.
REFERENCES
[1] J.L.Lions,OptimalControlof SystemsGovernedbyPartialDifferential
Equations. New York: Springer-Verlag, 1971.
[2] S.P. Banks,State-Spaceand Frequency-DomainMethodsin theControl
of Distributed Parameter Systems. London, U.K.: Peter Peregrinus,
1983.
[3] R. F. Curtain and A. J. Pritchard, “Infinite dimensional linear systems
theory,” Lecture Notes Control Inform. Sci., vol. 8, 1978.
[4] A. Bensousan, G. P. Da Prato, M. C. Delfour, and S. K. Mitter, Repre-
sentation and Control of Infinite Dimensional Systems. Boston, MA:
Birkhauser, 1992 & 1993, vol. I & II.
[5] C.Liu,T.Tsao,Y.Tai,J.Leu,C.Ho,W.Tang,andD.Miu,“Outofplane
permanent magnetic actuators for delta wing motion control,” in Proc.
1995 IEEE Micro Electro Mechanical Systems Workshop, Amsterdam,
The Netherlands, 1995.
[6] C. Ho and Y. Tai, “REVIEW: MEMS and its applications for flow con-
trol,” ASME J. Fluid Eng., vol. 118, Sept. 1996.
[7] S. S. Joshi, J. L. Speyer, and J. Kim, “A system theory approach to the
feedback stabilization of infinitesimal and finite-amplitude distrubances
in plane Poiseuille flow,” J. Fluid Mech., 1997.
[8] T. R. Bewley and S. Liu, “Optimal and robust control and estimation of
linear paths to transition,” J. Fluid Mech., 1998.
[9] H.T.Banks,R.S.Smith,andY.Wang,SmartMaterialStructures:Mod-
eling, Estimation and Control. New York: Wiley, 1996.
[10] R. E. Skelton and C. Sultan, “Controllable tensegrity: A new class of
smart structures,” in Proc. SPIE 4th Annual Int. Symp. Smart Structures
Materials, San Diego, CA, Mar. 1997.
[11] A. V. Balakrishnan, “Aeroelastic control with self-straining actuators:
Continuum models,” in Proc.SPIE Fifth Annual Int. Symp.Smart Struc-
tures Materials, San Diego, CA, Mar. 1998.
[12] S. M. Melzer and B. C. Kuo, “Optimal regulation of systems described
by a countably infinite number of objects,” Automatica, vol. 7, pp.
359–366, 1971.
[13] K. C. Chu, “Decentralized control of high-speed vehicular strings,”
Trans. Sci., pp. 361–384, Nov. 1974.
[14] B. Shu, “Robust Longitudinal Control of Vehicle Platoons on Intelligent
Highways,” M.S. thesis, Dept. ECE, Univ. Illinois, Urbana-Champaign,
1996.
[15] E. M. Heaven, I. M. Jonsson, T. M. Kean, M. A. Manness, and R. N.
Vyse,“Recentadvancesincrossmachineprofilecontrol,”IEEEControl
Syst. Mag., vol. 14, no. 5, Oct. 1994.
[16] D. Laughlin, M. Morari, and R. D. Braatz, “Robust performance of
cross-directional basis-weight control in paper machines,” Automatica,
vol. 29, pp. 1395–1410, 1993.
[17] R. D. Braatz and J. G. VanAntwerp, “Robust cross-directional control
of large scale paper machines,” in Proc. 1996 IEEE Int. Conf. Control
Applications, 1996.
[18] E. W. Kamen, “Stabilization of linear spatially-distributed contin-
uous-time and discrete-time systems,” in Multidimensional Systems
Theory, N. K. Bose, Ed. Norwell, MA: Kluwer, 1985.
[19] M. L. El-Sayed and P. S. Krishnaprasad, “Homogeneous interconnected
systems: An example,” IEEE Trans. Automat. Contr., vol. AC-26, pp.
894–901, Apr. 1981.
[20] R. W. Brockett and J. L. Willems, “Discretized partial differential equa-
tions: Examples of control systems defined on modules,” Automatica,
vol. 10, pp. 507–515, 1974.
[21] P. P. Khargonekar, K. Poolla, and A. Tannenbaum, “Robust control of
linear time-invariant plants using periodic compensation,” IEEE Trans.
Automat. Contr., vol. AC-30, Nov. 1985.
[22] J. A. Burns and D. Rubio, “A distributed parameter control approach to
sensor location for optimal feedback control of thermal processes,” in
Proc. 36th IEEE Conf. Decision Control, Dec. 1997.
[23] J. A. Burns and B. B. King, “Optimal sensor location for robust control
of distributed parameter systems,” in Proc. 33rd IEEE Conf. Decision
Control, Lake Buena Park, FL, Dec. 1994.
[24] W. L. Green and E. W. Kamen, “Stability of linear systems over a com-
mutative normed algebra with applications to spatially-distributed and
parameter-dependent systems,” SIAM J. Control Optimiz., vol. 23, pp.
1–18, 1985.
[25] E. W. Kamen and P. P. Khargonekar, “On the control of linear systems
whose coefficients are functions of parameters,” IEEE Trans. Automat.
Contr., vol. AC-29, pp. 25–33, Jan. 1984.
[26] P. P. Khargonekar and E. Sontag, “On the relation between stable matrix
fraction factorizations and regulable realizations of linear systems over
rings,”IEEETrans.Automat.Contr.,vol.AC-27,pp.627–638,Mar.1982.
[27] F. Fagnani and J. C. Willems, “Representations of symmetric linear
dynamical systems,” SIAM J. Control Optimiz., vol. 31, no. 5, pp.
1267–1293, 1993.
[28] , “Interconnections and symmetries of linear differential systems,”
SIAM J. Control Optimiz., 1994.
[29] R.D’Andrea,“Alinearmatrixinequalityapproachtodecentralizedcon-
trol of distributed parameter systems,” in Proc. Amer. Control Conf.,
June 1998.
[30] G. Dullerud, R. D’Andrea, and S. Lall, “Control of spatially varying
distributed systems,” in Proc. IEEE Control Decision Conf., Dec. 1998.
[31] W.Rudin,FourierAnalysisonGroups. NewYork:Interscience-Wiley,
1962.
[32] R. Walter, Functional Analysis. New York: McGraw-Hill, 1991.
[33] R. F. Curtain and H. J. Zwart, An Introduction to Infinite-Dimensional
Linear Systems Theory. New York: Springer-Verlag, 1995.
[34] B. van Keulen, H -Control for Distributed Parameter Sys-
tems. Boston, MA: Birkhauser, 1993.
[35] J. C. Doyle, K. Glover, P. Khargonekar, and B. A. Francis, “State-space
solutions to standard H and H problems,” IEEE Trans. Automat.
Contr., vol. 34, pp. 831–847, Aug. 1989.
[36] B. Bamieh, F. Paganini, and M. A. Dahleh. (2001) Distributed
Control of Spatially Invariant Systems. [Online]. Available: www.engi-
neering.ucsb.edu/~bamieh/papers/ccec01-0720.ps.
[37] L. Hormander, The Analysis of Partial Differential Operators I, 2nd
ed. Berlin, Germany: Springer-Verlag, 1990.
[38] K. Zhou, J. C. Doyle, and K. Glover, Robust and Optimal Con-
trol. Upper Saddle River, NJ: Prentice-Hall, 1996.
[39] J.H.Davenport,Y.Siret,andE.Tournier,ComputerAlgebra,Systemsand
AlgorithmsforAlgebraicComputation. NewYork:Academic,1988.
[40] B. Mishra, Algorithmic Algebra. New York: Springer-Verlag, 1993.
[41] A. Packard and J. C. Doyle, “The complex structured singular value,”
Automatica, vol. 29, no. 1, pp. 71–109, 1993.
[42] H. Markus and B. Thomas, “Spatially localized convolution kernels for
feedback control of transitional flows,” in Proc. 39th IEEE Conf. Deci-
sion Control, Dec. 2000.
[43] A. Feintuch and B. A. Francis, “Uniformly optimal control of linear
time-varying systems,” SIAM J. Cont. Optimiz., 1985.
[44] P. Khargonekar and K. Poolla, “Uniformly optimal control of linear
time-invariantplants:Nonlinear time-varyingcontrollers,” Syst. Control
Lett., vol. 6, pp. 303–308, Jan. 1986.
[45] J. Shamma and M. Dahleh, “Time-varying versus time-invariant com-
pensation for rejection of persistent bounded disturbances and robust
stabilization,” IEEE Trans. Automat. Contr., vol. 36, pp. 838–748, July
1991.
[46] H. Chapellat and M. Dahleh, “Analysis of time-varying control strate-
gies for optimal disturbance rejection and robustness,” IEEE Trans. Au-
tomat. Contr., vol. 37, Nov. 1992.
[47] M. A. Dahleh and I. J. Diaz-Bobillo, Control of Uncertain Systems:
A Linear Programming Approach. Upper Saddle River, NJ: Prentice-
Hall, 1995.
[48] M. Green and D. Limebeer, Linear Robust Control. New York: Pren-
tice-Hall, 1995.
[49] M. Vidyasagar, Control Systems Synthesis: A Factorization Ap-
proach. Cambridge, MA: MIT Press, 1995.
[50] G. Hagen, I. Mezić, B. Bamieh, and Z. Kaixia, “Control of axial com-
pressors via air injection,” in Proc.Amer. ControlConf.,San Diego,CA,
June 1999.
[51] G. Ayres and F. Paganini, “Convex method for decentralized control de-
sign in spatially invariant systems,” in Proc. 39th IEEE Conf. Control,
Dec. 2000.
[52] K. Zhou, Essentials of Robust Control. Upper Saddle River, NJ: Pren-
tice-Hall, 1998.
[53] D. Cox, J. Little, and D. O’Shea, Ideals, Varieties, and Algorithms: An
Introduction to Computational Algebraic Geometry and Commutative
Algebra. New York: Springer-Verlag, 1992.BAMIEH et al.: DISTRIBUTED CONTROL OF SPATIALLY INVARIANT SYSTEMS 1107
Bassam Bamieh (S’94–M’90) received the
electrical engineering and physics degrees from
Valparaiso University, Valparaiso, IN, and the
M.Sc. and Ph.D. degrees from Rice University,
Houston, TX, in 1993, 1996, and 1992, respectively.
Between 1991–1998, he was with the Department
of Electrical and Computer Engineering and the
Coordinated Science Laboratory at the University
of Illinois at Urbana-Champaign. He joined the
Mechanical Engineering department at the Uni-
versity of California at Santa Barbara in 1998,
where he is now an Associate Professor. His current research interests are
in distributed systems, shear flow turbulence modeling and control, Atomic
Force Microscopy, multimicro-cantilevers modeling and control, and optical
actuation via optical tweezers.
Dr. Bamieh is a past receipient of the AACC Hugo Schuck Best Paper Award
and a National Science Foundation CAREER Award.
Fernando Paganini (S’90–M’90) received the elec-
trical engineering and mathematics degrees from the
Universidad de la Republica, Montevideo, Uruguay,
and the M.S. and Ph.D. degrees in electrical engi-
neering from the California Institute of Technology,
Pasadena, in 1990, 1992, and 1996, respectively.
From 1996 to 1997, he was a Postdoctoral Asso-
ciate at the Massachusetts Institute of Technology,
Cambridge. Since 1997, he has been with the Elec-
trical Engineering Department at the University of
California, Los Angeles, where he is currently As-
sociate Professor. His research interests are robust control, distributed control,
and networks.
Dr. Paganini received the American Automatic Control Council O. Hugo
Schuck award in 1995, the Wilts and Clauser Prizes for outstanding Ph.D. dis-
sertation at the California Institute of Technology in 1996, the 1999 National
Science Foundation CAREER Award, and the 1999 Packard Fellowship.
Munther A. Dahleh (S’84–M’97–SM’97–F’01) re-
ceivedthe B.S. degree from Texas A & M University,
College Station,and the Ph.D.degree from Rice Uni-
versity, Houston, TX, both in electrical engineering,
in 1983 and 1987, respectively.
Since 1987, he has been with the Department
of Electrical Engineering and Computer Science,
Massachusetts Institute of Technology, Cambridge,
where he is now a Full Professor. He was a
Visiting Professor at the Department of Electrical
Engineering, California Institute of Technology,
Pasadena, in the spring 1993. He has held consulting positions with several
companies in the United States and abroad. He is the coauthor of Control of
Uncertain Systems: A Linear Programming Approach (Upper Saddle River, NJ:
Prentice-Hall, 1995), and Computational Methods for Controller Design (NY:
Springer-Verlag, 1998). His interests include robust control and identification,
the development of computational methods for linear and nonlinear controller
design, and applications of feedback control in several disciplines including
material manufacturing and modeling of biological systems.
Dr. Dahleh was the recipient of the Ralph Budd Award for the best thesis at
Rice University in 1987, the George Axelby Outstanding Paper Award (paper
coauthored with J. B. Pearson in 1987), a National Science Foundation Presi-
dential Young Investigator Award in 1991, the Finmeccanica Career Develop-
ment Chair in 1992, the Donald P. Eckman Award from the American Control
Council in 1993, and the Graduate Students Council Teaching Award in 1995.
HewasaPlenarySpeakeratthe1994AmericanControlConference, andiscur-
rently serving as an Associate Editor for IEEE TRANSACTIONS ON AUTOMATIC
CONTROL.